#include <stdio.h>

#include <msp430.h>
#include <stdint.h>
#include <stdbool.h>
#include <stdlib.h>
#include <string.h>

#include "../checkpoint/camel_ckpt_defines.h"

//Original size of buffer 3492
//////////////////////////////////////////////////////////////////
// #define NIL 0 // like NULL, but for indexes, not real pointers

// #define DICT_SIZE         512
// #define BLOCK_SIZE         64

// #define NUM_LETTERS_IN_SAMPLE        2
// #define LETTER_MASK             0x00FF
// #define LETTER_SIZE_BITS             8
// #define NUM_LETTERS (LETTER_MASK + 1)
//////////////////////////////////////////////////////////////////

// v1 size of buffer 1708
////////////////////////////////////////////////////////////////////
// #define NIL 0 // like NULL, but for indexes, not real pointers

// #define DICT_SIZE         256
// #define BLOCK_SIZE         32

// #define NUM_LETTERS_IN_SAMPLE        2
// #define LETTER_MASK             	0x007F
// #define LETTER_SIZE_BITS             8
// #define NUM_LETTERS (LETTER_MASK + 1)
////////////////////////////////////////////////////////////////////

// v2 size of buffer 908
//////////////////////////////////////////////////////////////////////
#define NIL 0 // like NULL, but for indexes, not real pointers

#define DICT_SIZE         128
#define BLOCK_SIZE         16

#define NUM_LETTERS_IN_SAMPLE        2
#define LETTER_MASK             	0x3F
#define LETTER_SIZE_BITS             8
#define NUM_LETTERS (LETTER_MASK + 1)
//////////////////////////////////////////////////////////////////////

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

// Single variable
#define cps(x) unsafe->globals.x = safe->globals.x

// Array
#define cpas(x,y) unsafe->globals.x[unsafe->globals.y] = safe->globals.x[unsafe->globals.y]
#define cpaso(x, y) unsafe->globals.x[y] = safe->globals.x[y]
#define cpa(x,y) memcpy(unsafe->globals.x,safe->globals.x,y)

// Struct
#define cps_s(x) unsafe->globals.x = safe->globals.x
#define cpas_s(x,y) unsafe->globals.x[unsafe->globals.y] = safe->globals.x[safe->globals.y]

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
	unsigned check;
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
	GV(letter_idx) = 0;
	GV(sample_count) = 1;

	while (GV(letter) < NUM_LETTERS) {

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

#if ALL
    #define prepare_task_sample() memcpy(&(unsafe->globals), &(safe->globals), sizeof(camel_global_t))
#elif READS
    #define prepare_task_sample() cps(letter_idx)
#elif WRITES
	#define prepare_task_sample() cps(letter_idx); cps(check)
#elif IDEM
    #define prepare_task_sample() cps(letter_idx)
#elif NONE
    #define prepare_task_sample() 
#else
    #error type of system not defined
#endif
#define writes_task_sample() cps(letter_idx); cps(check)

void task_sample()
{
	unsigned next_letter_idx = GV(letter_idx) + 1;
	if (next_letter_idx == NUM_LETTERS_IN_SAMPLE)
		next_letter_idx = 0;

	if (GV(letter_idx) == 0) {
		GV(letter_idx) = next_letter_idx;
		GV(check) = 0;

		//TRANSITION_TO(task_measure_temp);
	} else {
		GV(letter_idx) = next_letter_idx;
		GV(check) = 1;

		//TRANSITION_TO(task_letterize);
	}
}

#if ALL
    #define prepare_task_measure_temp() memcpy(&(unsafe->globals), &(safe->globals), sizeof(camel_global_t))
#elif READS
    #define prepare_task_measure_temp() cps(prev_sample)
#elif WRITES
	#define  prepare_task_measure_temp() cps(prev_sample); cps(sample)
#elif IDEM
    #define prepare_task_measure_temp() cps(prev_sample)
#elif NONE
    #define prepare_task_measure_temp()
#else
    #error type of system not defined
#endif
#define writes_task_measure_temp() cps(prev_sample); cps(sample)

void task_measure_temp()
{
	sample_t prev_sample;
	prev_sample = GV(prev_sample);

	sample_t sample = acquire_sample(prev_sample);
	prev_sample = sample;
	GV(prev_sample) = prev_sample;
	GV(sample) = sample;
	//TRANSITION_TO(task_letterize);
}

#if ALL
    #define prepare_task_letterize() memcpy(&(unsafe->globals), &(safe->globals), sizeof(camel_global_t))
#elif READS
    #define prepare_task_letterize() cps(letter_idx); cps(sample)
#elif WRITES
	#define  prepare_task_letterize() cps(letter);
#elif IDEM
    #define prepare_task_letterize() 
#elif NONE
    #define prepare_task_letterize()
#else
    #error type of system not defined
#endif
#define writes_task_letterize() cps(letter)

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
	//TRANSITION_TO(task_compress);
}

#if ALL
    #define prepare_task_compress() memcpy(&(unsafe->globals), &(safe->globals), sizeof(camel_global_t))
#elif READS
    #define prepare_task_compress() cps(parent_next); cpa(dict, sizeof(node_t)*DICT_SIZE); cps(sample_count)
#elif WRITES
	#define  prepare_task_compress() cps(sibling); cps_s(parent_node); cps(parent); cps(child); cps(sample_count)
#elif IDEM
    #define prepare_task_compress() cps(sample_count)
#elif NONE
    #define prepare_task_compress()
#else
    #error type of system not defined
#endif
#define writes_task_compress() cps(sibling); cps_s(parent_node); cps(parent); cps(child); cps(sample_count)

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

	//TRANSITION_TO(task_find_sibling);
}

#if ALL
    #define prepare_task_find_sibling() memcpy(&(unsafe->globals), &(safe->globals), sizeof(camel_global_t))
#elif READS
    #define prepare_task_find_sibling() cps(sibling); cps(letter); cps(child)
#elif WRITES
	#define  prepare_task_find_sibling() cps(parent_next); cps(check); cps(sibling)
#elif IDEM
    #define prepare_task_find_sibling() cps(sibling)
#elif NONE
    #define prepare_task_find_sibling()
#else
    #error type of system not defined
#endif
#define writes_task_find_sibling() cps(parent_next); cps(check); cps(sibling)

void task_find_sibling()
{
	node_t *sibling_node;

	if (GV(sibling) != NIL) {
		int i = GV(sibling);
		sibling_node = &GV(dict)[i]; 

		if (sibling_node->letter == GV(letter)) { // found

			GV(parent_next) = GV(sibling);

			GV(check) = 0;
			//TRANSITION_TO(task_letterize);
			return;
		} else { // continue traversing the siblings
			if(sibling_node->sibling != 0){
				GV(sibling) = sibling_node->sibling;
				GV(check) = 1;	
				//TRANSITION_TO(task_find_sibling);
				return;
			}
		}

	} 

	index_t starting_node_idx = (index_t)GV(letter);
	GV(parent_next) = starting_node_idx;

	if (GV(child) == NIL) {
		GV(check) = 2;
		//TRANSITION_TO(task_add_insert);
	} else {
		GV(check) = 3;
		//TRANSITION_TO(task_add_node); 
	}
}

#if ALL
    #define prepare_task_add_node() memcpy(&(unsafe->globals), &(safe->globals), sizeof(camel_global_t))
#elif READS
    #define prepare_task_add_node() cps(sibling)
#elif WRITES
	#define  prepare_task_add_node() cps(sibling); cps(check); cps_s(sibling_node)
#elif IDEM
    #define prepare_task_add_node() cps(sibling)
#elif NONE
    #define prepare_task_add_node()
#else
    #error type of system not defined
#endif
#define writes_task_add_node() cps(sibling); cps(check); cps_s(sibling_node)

void task_add_node()
{
	node_t *sibling_node;

	int i = GV(sibling);
	sibling_node = &GV(dict)[i];

	if (sibling_node->sibling != NIL) {
		index_t next_sibling = sibling_node->sibling;
		GV(sibling) = next_sibling;

		//TRANSITION_TO(task_add_node);
		GV(check) = 0;

	} else { // found last sibling in the list

		node_t sibling_node_obj = *sibling_node;
		GV(sibling_node) = sibling_node_obj;

		//TRANSITION_TO(task_add_insert);
		GV(check) = 1;
	}
}

#if ALL
    #define prepare_task_add_insert() memcpy(&(unsafe->globals), &(safe->globals), sizeof(camel_global_t))
#elif READS
    #define prepare_task_add_insert() cps(node_count); cps(letter); cps_s(parent_node); cps(parent); cps(sibling); cps_s(sibling_node); cps(child)
#elif WRITES
	#define  prepare_task_add_insert() cpas_s(dict, parent); cpas_s(dict, sibling); cpas_s(dict, child); cps(symbol); cps(node_count)
#elif IDEM
    #define prepare_task_add_insert() cps(node_count)
#elif NONE
    #define prepare_task_add_insert()
#else
    #error type of system not defined
#endif
#define writes_task_add_insert() cps(write1); cps(write2); cpas_s(dict, write1); cpas_s(dict, write2); cpas_s(dict, child); cps(symbol); cps(node_count)

void task_add_insert()
{

	if (GV(node_count) == DICT_SIZE) { // wipe the table if full
		task_done();
		while (1);
	}

	index_t child = GV(node_count);
	node_t child_node = {
		.letter = GV(letter),
		.sibling = NIL,
		.child = NIL,
	};

	//opt
	node_t cond = GV(parent_node);

	if (cond.child == NIL) { // the only child

		node_t parent_node_obj = GV(parent_node);
		parent_node_obj.child = child;
		//int i = GV(parent);
		//opt
		//GV(write1) = GV(parent);
		GV(dict)[GV(parent)] = parent_node_obj;

	} else { // a sibling

		//index_t last_sibling = GV(sibling);
		//GV(write2) = GV(sibling);
		node_t last_sibling_node = GV(sibling_node);                   

		last_sibling_node.sibling = child;
		//GV(dict)[last_sibling] = last_sibling_node;
		GV(dict)[GV(sibling)] = last_sibling_node;
	}
	GV(dict)[GV(child)] = child_node;
	GV(symbol) = GV(parent);
	GV(node_count)++;

	//TRANSITION_TO(task_append_compressed);
}

#if ALL
    #define prepare_task_append_compressed() memcpy(&(unsafe->globals), &(safe->globals), sizeof(camel_global_t))
#elif READS
    #define prepare_task_append_compressed() cps(out_len); cps(symbol)
#elif WRITES
	#define  prepare_task_append_compressed() cps(write1); cpas_s(compressed_data, write1); cps(out_len)
#elif IDEM
    #define prepare_task_append_compressed() cps(out_len)
#elif NONE
    #define prepare_task_append_compressed()
#else
    #error type of system not defined
#endif
#define writes_task_append_compressed() cpas_s(compressed_data, write1); cps(out_len)

void task_append_compressed()
{
	//int i = GV(out_len);
	//opt
	//GV(write1) = GV(out_len);

	//can change here
	//GV(compressed_data)[i].letter = GV(symbol);

	//opt
	// node_t copy = {
	// 	.letter = GV(symbol),
	// 	.sibling = GV(compressed_data)[GV(write1)].sibling,
	// 	.child = GV(compressed_data)[GV(write1)].child,
	// };

	// node_t copy;
	// copy = GV(compressed_data)[GV(out_len)];
	// copy.letter = GV(symbol);

	GV(compressed_data)[GV(out_len)].letter = GV(symbol);

	++GV(out_len);

	// if (++GV(out_len) == BLOCK_SIZE) {
	// 	//TRANSITION_TO(task_done);
	// } else {
	// 	//TRANSITION_TO(task_sample);
	// }
}

void task_done()
{
	exit(0);
}

void task_commit(){

}

int main(){

    camel.flag = CKPT_1_FLG;
    safe = &(camel.buf1);
    unsafe = &(camel.buf2);
    camel_init();

	task_init();
	commit();
	//memcpy(&(unsafe->globals), &(safe->globals), sizeof(camel_global_t));
	task_commit();

	while(GV(out_len) < BLOCK_SIZE) {

		//prepare_task_sample();
		task_sample();
		commit();
		//writes_task_sample();
		task_commit();

		if (GV(check) == 0){

			//prepare_task_measure_temp();
			task_measure_temp();
			commit();
			//writes_task_measure_temp();
			task_commit();

		}

		while (1) {

			//prepare_task_letterize();
			task_letterize();
			commit();
			//writes_task_letterize();
			task_commit();

			//prepare_task_compress();
			task_compress();
			commit();
			//writes_task_compress();
			task_commit();

			do {

				//prepare_task_find_sibling();
				task_find_sibling();
				commit();
				//writes_task_find_sibling();
				task_commit();

			} while (GV(check) == 1);

			if (GV(check) != 0)
				break;
		}

		if (GV(check) == 3) {
			do{

				//prepare_task_add_node();
				task_add_node();
				commit();
				//writes_task_add_node();
				task_commit();

			} while (GV(check) == 0);
		}

		//prepare_task_add_insert();
		task_add_insert();
		commit();
		//writes_task_add_insert();
		task_commit();

		//prepare_task_append_compressed();
		task_append_compressed();
		commit();
		//writes_task_append_compressed();
		task_commit();

	}

	task_done();
}

#ifdef __MSP430FR6989__
__attribute__((section("__interrupt_vector_56"), used))
static void (*reset_vector)(void) = camel_recover;
#elif __MSP430F5529__
__attribute__((section("__interrupt_vector_64"), used))
static void (*reset_vector)(void) = camel_recover;
#else
#error Board not supported
#endif

