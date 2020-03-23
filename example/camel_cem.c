#include <stdio.h>

#include <msp430.h>
#include <stdint.h>
#include <stdbool.h>
#include <stdlib.h>

#include "../checkpoint/camel_ckpt_defines.h"

#define NIL 0 // like NULL, but for indexes, not real pointers

#define DICT_SIZE         512
#define BLOCK_SIZE         64

#define NUM_LETTERS_IN_SAMPLE        2
#define LETTER_MASK             0x00FF
#define LETTER_SIZE_BITS             8
#define NUM_LETTERS (LETTER_MASK + 1)

typedef unsigned index_t;
typedef unsigned letter_t;
typedef unsigned sample_t;

typedef struct _node_t {
	letter_t letter; // 'letter' of the alphabet
	index_t sibling; // this node is a member of the parent's children list
	index_t child;   // link-list of children
} node_t;

void task_init();
void task_sample();
void task_measure_temp();
void task_letterize();
void task_compress();
void task_find_sibling();
void task_add_node();
void task_add_insert();
void task_append_compressed();
void task_print();
void task_done();

// Camel stuff

// 16-bit architecture
typedef uint16_t camel_reg_t;

// Temporary CRC results
uint16_t tmp_stack_crc;
uint16_t tmp_stack_buf_crc;

// Macros and macro redefinitions!
#define GV(x) unsafe->globals.x
#define MGV(x) safe->globals.x //to be used only in main with conditionals

// Macros that define how prepare statements copy variables and arrays
#define cps(x) unsafe->globals.x = safe->globals.x
#define cpas(x,y) unsafe->globals.x[unsafe->globals.y] = safe->globals.x[unsafe->globals.y]
#define cpaso(x, y) unsafe->globals.x[y] = safe->globals.x[y]
#define cpa(x,y) memcpy(unsafe->globals.x,safe->globals.x,y)

#if (CRC_ON && CRC_OFF) || !(CRC_ON || CRC_OFF)
#error You must define exactly one of CRC_ON and CRC_OFF
#endif

#ifdef CRC_ON
#define commit() do{                                                                                                      \
                    _Pragma("GCC diagnostic ignored \"-Wint-conversion\"")                                                \
										if(camel.flag == CKPT_1_FLG){																																					\
											safe = &(camel.buf2);																																								\
											unsafe = &(camel.buf1);																																							\
											__dump_registers(safe->reg_file);																																		\
										  tmp_stack_crc 		= __fast_hw_crc(_get_SP_register()+2, SRAM_TOP-(_get_SP_register()+2), CRC_INIT);	\
										  tmp_stack_buf_crc = __fast_hw_crc(safe, sizeof(camel_buffer_t) - 2, tmp_stack_crc);									\
										  safe->stack_and_buf_crc = tmp_stack_buf_crc;																												\
											camel.flag = CKPT_2_FLG;																																						\
										} else{																																																\
											safe = &(camel.buf1);																																								\
											unsafe = &(camel.buf2);																																							\
											__dump_registers(safe->reg_file);																																		\
										  tmp_stack_crc 		= __fast_hw_crc(_get_SP_register()+2, SRAM_TOP-(_get_SP_register()+2), CRC_INIT);	\
										  tmp_stack_buf_crc = __fast_hw_crc(safe, sizeof(camel_buffer_t) - 2, tmp_stack_crc);									\
										  safe->stack_and_buf_crc = tmp_stack_buf_crc;																												\
											camel.flag = CKPT_1_FLG;																																						\
										}																																																			\
                    _Pragma("GCC diagnostic warning \"-Wint-conversion\"")                                                \
                  }	while(0)

#elif CRC_OFF
#define commit() do{                                                                                                      \
                    _Pragma("GCC diagnostic ignored \"-Wint-conversion\"")                                                \
										if(camel.flag == CKPT_1_FLG){																																					\
											safe = &(camel.buf2);																																								\
											unsafe = &(camel.buf1);																																							\
											__dump_registers(safe->reg_file);																																		\
											camel.flag = CKPT_2_FLG;																																						\
										} else{																																																\
											safe = &(camel.buf1);																																								\
											unsafe = &(camel.buf2);																																							\
											__dump_registers(safe->reg_file);																																		\
											camel.flag = CKPT_1_FLG;																																						\
										}																																																			\
                    _Pragma("GCC diagnostic warning \"-Wint-conversion\"")                                                \
                  }	while(0)

#endif

// Globals
typedef struct camel_global_t
{
	letter_t letter;
	unsigned letter_idx;
	sample_t prev_sample;
	index_t out_len;
	index_t node_count;
	node_t dict[DICT_SIZE];
	sample_t sample;
	index_t sample_count;
	index_t sibling;
	index_t child;
	index_t parent;
	index_t parent_next;
	node_t parent_node;
	node_t compressed_data[BLOCK_SIZE];
	node_t sibling_node;
	index_t symbol;
	//global for checking which branch to take
	int check;
} camel_global_t;
// End globals

typedef struct camel_buffer_t
{
  camel_reg_t reg_file[NUM_REGISTERS_SAVED];  // 11 16-bit registers: 30 bytes
  camel_global_t globals;
  uint16_t stack_and_buf_crc;                         			// CRC of (stack) | (register file) | (globals)
} camel_buffer_t;

struct Camel
{
  uint16_t flag;
  camel_buffer_t buf1;
  camel_buffer_t buf2;
} camel;

extern void     __crt0_start();
extern uint16_t __fast_hw_crc(void* ptr, uint16_t len, uint16_t init);
extern void 		__dump_registers(uint16_t* ptr);
extern void 		__restore_registers(uint16_t* ptr);	// Warning! This will never return!

camel_buffer_t *safe, *unsafe;

void camel_init(){
  WDTCTL = WDTPW | WDTHOLD; // Stop WDT

  P1DIR |= BIT0;
  //Turn both LEDs on
  P1OUT &= ~BIT0;

#ifdef __MSP430FR6989__
  // Disable the GPIO power-on default high-impedance mode to activate
  // previously configured port settings
  PM5CTL0 &= ~LOCKLPM5;

  //Set clock to 1MHz

  // Clock System Setup
  CSCTL0_H = CSKEY >> 8;                    // Unlock CS registers
  CSCTL1 = DCOFSEL_0 | DCORSEL;             // Set DCO to 1MHz
  CSCTL2 = SELA__VLOCLK | SELS__DCOCLK | SELM__DCOCLK;  // Set SMCLK = MCLK = DCO,
                                                        // ACLK = VLOCLK
  CSCTL3 = DIVA__1 | DIVS__1 | DIVM__1;     // Set all dividers
  CSCTL0_H = 0;                             // Lock CS registers

  // Zero FRAM wait states
  FRCTL0 = FRCTLPW | NWAITS_0;
#endif
}

uint16_t buf[NUM_REGISTERS_SAVED];

void camel_recover(){
    if(camel.flag == CKPT_1_FLG) {
        safe = &(camel.buf1);
        unsafe = &(camel.buf2);
    } else if(camel.flag == CKPT_2_FLG) {
        safe = &(camel.buf2);
        unsafe = &(camel.buf1);
    } else {
        __crt0_start();
    }

    // If the CRC is off, just assume data integrity
    #if CRC_OFF
    // memcpy(unsafe, safe, sizeof(camel_buffer_t));
    _set_SP_register(safe->reg_file[R1_POS / 2]);
    camel_init();
    __restore_registers(safe->reg_file);
    #elif CRC_ON
		// Need to set stack pointer before we call things
    // Calling it before we verify, but if it's incorrect the CRC will fail anyway
    // TODO: Could potentially cause an error if the saved SP is so
    // corrupted that it points to outside of SRAM

    // Solution: Haven't stopped WDT so it will save us, but need to see if I
    // can point WDT reset to __crt0_start instead of here
		_set_SP_register(safe->reg_file[R1_POS / 2]);
    _Pragma("GCC diagnostic ignored \"-Wint-conversion\"")
		tmp_stack_crc = __fast_hw_crc(_get_SP_register()+2, SRAM_TOP-(_get_SP_register()+2), CRC_INIT);
		tmp_stack_buf_crc = __fast_hw_crc(safe, sizeof(camel_buffer_t) - 2, tmp_stack_crc);	// Don't CRC the CRC result!
    _Pragma("GCC diagnostic warning \"-Wint-conversion\"")

		if(tmp_stack_buf_crc == safe->stack_and_buf_crc){
			memcpy(unsafe, safe, sizeof(camel_buffer_t));	// Prevent SDC
			camel_init();
			__restore_registers(safe->reg_file);
		} else{
			__crt0_start();
		}
    #endif
}

// End Camel Stuff

static sample_t acquire_sample(letter_t prev_sample)
{
	letter_t sample = (prev_sample + 1) & 0x03;
	return sample;
}

void task_init()
{
	GV(parent_next) = 0;
	GV(out_len) = 0;
	GV(letter) = 0;
	GV(prev_sample) = 0;
	GV(letter_idx) = 0;;
	GV(sample_count) = 1;
	GV(check) = 0;

	while (GV(letter) < NUM_LETTERS){

		node_t node = {
			.letter = GV(letter),
			.sibling = NIL, // no siblings for 'root' nodes
			.child = NIL, // init an empty list for children
		};

		int i = GV(letter);	
		GV(dict)[i] = node; 
		GV(letter)++;
	}

	GV(node_count) = NUM_LETTERS;
}

void task_sample()
{

	unsigned next_letter_idx = GV(letter_idx) + 1;
	if (next_letter_idx == NUM_LETTERS_IN_SAMPLE)
		next_letter_idx = 0;

	if (GV(letter_idx) == 0) {
		GV(letter_idx) = next_letter_idx;
		GV(check) = 1;
	} else {
		GV(letter_idx) = next_letter_idx;
		GV(check) = 0;
	}
}

void task_measure_temp()
{
	sample_t prev_sample;
	prev_sample = GV(prev_sample);

	sample_t sample = acquire_sample(prev_sample);
	prev_sample = sample;
	GV(prev_sample) = prev_sample;
	GV(sample) = sample;
}

void task_letterize()
{
	unsigned letter_idx = GV(letter_idx);
	if (letter_idx == 0)
		letter_idx = NUM_LETTERS_IN_SAMPLE;
	else
		letter_idx--;
	unsigned letter_shift = LETTER_SIZE_BITS * letter_idx;
	letter_t letter = (GV(sample) & (LETTER_MASK << letter_shift)) >> letter_shift;

	GV(letter) = letter;
}

void task_compress()
{
	node_t parent_node;
	index_t parent = GV(parent_next);
	parent_node = GV(dict)[parent];

	GV(sibling) = parent_node.child;
	GV(parent_node) = parent_node;
	GV(parent) = parent;
	GV(child) = parent_node.child;
	GV(sample_count)++;

}

void task_find_sibling()
{
	node_t *sibling_node;

	if (GV(sibling) != NIL) {
		int i = GV(sibling);
		sibling_node = &GV(dict)[i]; 

		if (sibling_node->letter == GV(letter)) { // found

			GV(parent_next) = GV(sibling);

			GV(check) = 1;

		} else { // continue traversing the siblings
			if(sibling_node->sibling != 0){
				GV(sibling) = sibling_node->sibling;
				GV(check) = 2;
			}
		}

	} 

	index_t starting_node_idx = (index_t)GV(letter);
	GV(parent_next) = starting_node_idx;

	if (GV(child) == NIL) {
		GV(check) = 3;
	} else {
		GV(check) = 4;
	}
}

void task_add_node()
{
	node_t *sibling_node;

	int i = GV(sibling);
	sibling_node = &GV(dict)[i];

	if (sibling_node->sibling != NIL) {
		index_t next_sibling = sibling_node->sibling;
		GV(sibling) = next_sibling;

	} else { // found last sibling in the list


		node_t sibling_node_obj = *sibling_node;
		GV(sibling_node) = sibling_node_obj;

	}
}

void task_add_insert()
{

	if (GV(node_count) == DICT_SIZE) { // wipe the table if full
		while (1);
	}


	index_t child = GV(node_count);
	node_t child_node = {
		.letter = GV(letter),
		.sibling = NIL,
		.child = NIL,
	};

	if (GV(parent_node).child == NIL) { // the only child

		node_t parent_node_obj = GV(parent_node);
		parent_node_obj.child = child;
		int i = GV(parent);
		GV(dict)[i] = parent_node_obj;

	} else { // a sibling

		index_t last_sibling = GV(sibling);
		node_t last_sibling_node = GV(sibling_node);                   

		last_sibling_node.sibling = child;
		GV(dict)[last_sibling] = last_sibling_node;
	}
	GV(dict)[child] = child_node;
	GV(symbol) = GV(parent);
	GV(node_count)++;

}

void task_append_compressed()
{
	int i = GV(out_len);
	GV(compressed_data[i]).letter = GV(symbol);

	if (++GV(out_len) == BLOCK_SIZE) {
		//TRANSITION_TO(task_print);
	} else {
		//TRANSITION_TO(task_sample);
	}
}

void task_done()
{
	exit(0);
}

void task_commit(){

}

int main() {

    camel.flag = CKPT_1_FLG;
    safe = &(camel.buf1);
    unsafe = &(camel.buf2);
	camel_init();
	
	task_init();
	commit();
	task_commit();

	while (MGV(out_len) < BLOCK_SIZE){

		if (MGV(check) == 1){
			task_measure_temp();
			commit();
			task_commit();
		}

		while(1){

			task_letterize();
			commit();
			task_commit();

			task_compress();
			commit();
			task_commit();

			while(1){
				task_find_sibling();
				commit();
				task_commit();
				if (MGV(check) != 2)
					break;
			}

			if (MGV(check) != 1)
				break;
		}	

		if (MGV(check) == 3)
			task_add_node();
			commit();
			task_commit();

		task_add_insert();
		commit();
		task_commit();

		task_append_compressed();
		commit();
		task_commit();	
	}

	task_done();
}
