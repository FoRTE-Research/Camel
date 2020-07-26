#include <stdio.h>

#include <msp430.h>
#include <stdint.h>
#include <stdbool.h>
#include <stdlib.h>
#include <string.h>

#include "macros.h"
#include "camel_ckpt_defines.h"

#define NUM_BUCKETS 128 // must be a power of 2
#define NUM_INSERTS (NUM_BUCKETS / 4) // shoot for 25% occupancy
#define NUM_LOOKUPS NUM_INSERTS
#define MAX_RELOCATIONS 8
#define BUFFER_SIZE 32

typedef uint16_t value_t;
typedef uint16_t hash_t;
typedef uint16_t fingerprint_t;
typedef uint16_t index_t; // bucket index

typedef struct _insert_count {
    unsigned insert_count;
    unsigned inserted_count;
} insert_count_t;

typedef struct _lookup_count {
    unsigned lookup_count;
    unsigned member_count;
} lookup_count_t;

void task_init();
void task_generate_key();
void task_calc_indexes();
void task_calc_indexes_1();
void task_calc_indexes_index2();
void task_add();
void task_relocate();
void task_insert_done();
void task_lookup_search();
void task_lookup_done();
void task_done();
void task_init_array();
void task_commit();

// Camel stuff

// 16-bit architecture
typedef uint16_t camel_reg_t;

// Temporary CRC results
uint16_t tmp_stack_crc;
uint16_t tmp_stack_buf_crc;

// Globals
typedef struct camel_global_t
{
  fingerprint_t filter[NUM_BUCKETS];
  value_t key;
  fingerprint_t fingerprint;
  value_t index1;
  value_t index2;
  value_t relocation_count;
  value_t insert_count;
  value_t inserted_count;
  value_t lookup_count;
  value_t member_count;
  bool success;
  bool member;

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

#if (CRC_ON && CRC_OFF) || !(CRC_ON || CRC_OFF)
#error You must define exactly one of CRC_ON and CRC_OFF
#endif

#ifdef INLINE
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

#elif NAKED
#ifdef CRC_ON
void commit() {
				do {
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
                  }	while(0);

}
#elif CRC_OFF

void commit() {
	
				do{                                                                                                      \
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
                  }	while(0);
}
#endif

#endif

// End Camel stuff

const value_t init_key = 0x0001;

static hash_t djb_hash(uint8_t* data, unsigned len)
{
    uint16_t hash = 5381;
    unsigned int i;

    for(i = 0; i < len; data++, i++)
        hash = ((hash << 5) + hash) + (*data);


    return hash & 0xFFFF;
}

static index_t hash_to_index(fingerprint_t fp)
{
    hash_t hash = djb_hash((uint8_t *)&fp, sizeof(fingerprint_t));
    return hash & (NUM_BUCKETS - 1); // NUM_BUCKETS must be power of 2
}

static fingerprint_t hash_to_fingerprint(value_t key)
{
    return djb_hash((uint8_t *)&key, sizeof(value_t));
}

void task_init()
{
    unsigned i;
    for (i = 0; i < NUM_BUCKETS ; ++i) {
        GV(filter)[i] = 0;
    }
    GV(insert_count) = 0;
    GV(lookup_count) = 0;
    GV(inserted_count) = 0;
    GV(member_count) = 0;
    GV(key) = init_key;
}

void task_generate_key()
{

    GV(key) = (GV(key) + 1) * 17;
}

void task_calc_indexes()
{
    GV(fingerprint) = hash_to_fingerprint(GV(key));
}

void task_calc_indexes_index_1()
{
    GV(index1) = hash_to_index(GV(key));
}

void __attribute__((noinline)) task_calc_indexes_index_2()
{
    index_t fp_hash = hash_to_index(GV(fingerprint));
    GV(index2) = GV(index1) ^ fp_hash;
}

void task_add()
{
    if (!GV(filter)[GV(index1)]) {
        GV(success) = true;
        GV(filter)[GV(index1)] = GV(fingerprint);
    } else {
        if (!GV(filter)[GV(index2)]) {
            GV(success) = true;
            GV(filter)[GV(index2)] = GV(fingerprint);
        } else { // evict one of the two entries
            fingerprint_t fp_victim;
            index_t index_victim;
            if (rand() % 2) {
                index_victim = GV(index1);
                fp_victim = GV(filter)[GV(index1)];
            } else {
                index_victim = GV(index2);
                fp_victim = GV(filter)[GV(index2)];
            }

            // Evict the victim
            GV(filter)[index_victim] = GV(fingerprint);
            GV(index1) = index_victim;
            GV(fingerprint) = fp_victim;
            GV(relocation_count) = 0;
        }
    }
}

void task_relocate()
{
    fingerprint_t fp_victim = GV(fingerprint);
    index_t fp_hash_victim = hash_to_index(fp_victim);
    index_t index2_victim = GV(index1) ^ fp_hash_victim;

        //writeOpt = index2_victim;
        //cpaso(filter,writeOpt); // Opt: cross function boundary with part of prepare statement to make it more precise (lower overhead)
        if (!GV(filter)[index2_victim]) { // slot was free
            GV(success) = true;
            GV(filter)[index2_victim] = fp_victim;
            return;
        }

        // slot was occupied, rellocate the next victim
        if (GV(relocation_count) >= MAX_RELOCATIONS) { // insert failed
            GV(success) = false;
            return;
        }

        ++GV(relocation_count);
        GV(index1) = index2_victim;
        GV(fingerprint) = GV(filter)[index2_victim];
        GV(filter)[index2_victim] = fp_victim;
}

void task_insert_done()
{
    ++GV(insert_count);
    GV(inserted_count) += GV(success);

    if (GV(insert_count) >= NUM_INSERTS) {

        GV(key) = init_key;
        
    }
}

void task_lookup_search()
{
    if (GV(filter)[GV(index1)] == GV(fingerprint)) {
        GV(member) = true;
    } else {
        if (GV(filter)[GV(index2)] == GV(fingerprint)) {
            GV(member) = true;
        }
        else {
            GV(member) = false;
        }
    }
}

void task_lookup_done()
{
    ++GV(lookup_count);

    GV(member_count) += GV(member);

}

void task_done()
{
    exit(0);
}

void task_commit() {
                                             
																																											
}

int writeOpt = 0;

int main(){

    camel.flag = CKPT_1_FLG;
    safe = &(camel.buf1);
    unsafe = &(camel.buf2);
    camel_init();

    TASK(task_init);

    while(MGV(lookup_count) < NUM_LOOKUPS) {

        TASK(task_generate_key);

        TASK(task_calc_indexes);

        TASK(task_calc_indexes_index_1);

        TASK(task_calc_indexes_index_2);

        if(GV(insert_count) < NUM_INSERTS) {

            TASK(task_add);
            
            if(MGV(filter)[MGV(index1)] && MGV(filter)[MGV(index2)]) {
                while(MGV(success) == false && (MGV(relocation_count) < MAX_RELOCATIONS)) {

                    TASK(task_relocate);
     
                }
            }

        TASK(task_insert_done);
            
        } else {

            TASK(task_lookup_search);

            TASK(task_lookup_done);
        }
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
