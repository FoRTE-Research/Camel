#include <stdio.h>

#include <msp430.h>
#include <stdint.h>
#include <stdbool.h>
#include <stdlib.h>
#include <string.h>

#include "../checkpoint/camel_ckpt_defines.h"

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
  volatile uint16_t crc;
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

// End Camel stuff

// Wasn't declared as a const before, should have been...
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

// Reads:
// Reads first:
// Writes: filter entire array,insert_count,lookup_count,inserted_count,member_count,key
// Writes first: filter entire array,insert_count,lookup_count,inserted_count,member_count,key
#if ALL
    #define prepare_task_init() memcpy(&(unsafe->globals), &(safe->globals), sizeof(camel_global_t)); // copy everything
#elif READS
    #define prepare_task_init() ; // copy everything read by task
#elif IDEM
    #define prepare_task_init() ; // copy everything in both read first and writes lists
#elif NONE
    #define prepare_task_init() ;
#else
    #error type of system not defined
#endif
#define writes_task_init() cpa(filter, sizeof(fingerprint_t)*NUM_BUCKETS); cps(insert_count); cps(lookup_count); cps(inserted_count); cps(member_count); cps(key) // everything written needs to go here
void __attribute__((noinline)) task_init()
{
    unsigned i;
    for (i = 0; i < NUM_BUCKETS ; ++i) {
        GV(filter)[i] = i;
        //GV(filter, i) = 0;
    }
    GV(insert_count) = 0;
    GV(lookup_count) = 0;
    GV(inserted_count) = 0;
    GV(member_count) = 0;
    GV(key) = init_key;
}

// Reads: key
// Reads first: key
// Writes: key
// Writes first:
#if ALL
    #define prepare_task_generate_key() memcpy(&(unsafe->globals), &(safe->globals), sizeof(camel_global_t)) // copy everything
#elif READS
    #define prepare_task_generate_key() cps(key) // copy everything read by task
#elif IDEM
    #define prepare_task_generate_key() cps(key) // copy everything that is present in both read first and writes lists
#elif NONE
    #define prepare_task_generate_key() ;
#else
    #error type of system not defined
#endif
#define writes_task_generate_key() cps(key) // everything written needs to go here
void __attribute__((noinline)) task_generate_key()
{

    GV(key) = (GV(key) + 1) * 17;
}

// Reads: key
// Reads first: key
// Writes: fingerprint
// Writes first: fingerprint
#if ALL
    #define prepare_task_calc_indexes() memcpy(&(unsafe->globals), &(safe->globals), sizeof(camel_global_t)) // copy everything
#elif READS
    #define prepare_task_calc_indexes() cps(key) // copy everything read by task
#elif IDEM
    #define prepare_task_calc_indexes() ; // copy everything that is present in both read first and writes lists
#elif NONE
    #define prepare_task_calc_indexes() ;
#else
    #error type of system not defined
#endif
#define writes_task_calc_indexes() cps(fingerprint) // everything written needs to go here
void __attribute__((noinline)) task_calc_indexes()
{
    GV(fingerprint) = hash_to_fingerprint(GV(key));
}

// Reads: key
// Reads first: key
// Writes: index1
// Writes first: index1
#if ALL
    #define prepare_task_calc_indexes_index_1() memcpy(&(unsafe->globals), &(safe->globals), sizeof(camel_global_t)) // copy everything
#elif READS
    #define prepare_task_calc_indexes_index_1() cps(key) // copy everything read by task
#elif IDEM
    #define prepare_task_calc_indexes_index_1() ; // copy everything that is present in both read first and writes lists
#elif NONE
    #define prepare_task_calc_indexes_index_1() ;
#else
    #error type of system not defined
#endif
#define writes_task_calc_indexes_index_1() cps(index1) // everything written needs to go here
void __attribute__((noinline)) task_calc_indexes_index_1()
{
    GV(index1) = hash_to_index(GV(key));
}

// Reads: fingerprint, index1
// Reads first: fingerprint, index1
// Writes: index2
// Writes first: index2
#if ALL
    #define prepare_task_calc_indexes_index_2() memcpy(&(unsafe->globals), &(safe->globals), sizeof(camel_global_t)) // copy everything
#elif READS
    #define prepare_task_calc_indexes_index_2() cps(fingerprint); cps(index1) // copy everything read by task
#elif IDEM
    #define prepare_task_calc_indexes_index_2() ; // copy everything that is present in both read first and writes lists
#elif NONE
    #define prepare_task_calc_indexes_index_2() ;
#else
    #error type of system not defined
#endif
#define writes_task_calc_indexes_index_2() cps(index2) // everything written needs to go here
void __attribute__((noinline)) task_calc_indexes_index_2()
{
    index_t fp_hash = hash_to_index(GV(fingerprint));
    GV(index2) = GV(index1) ^ fp_hash;
}

// Reads: filter[index1], fingerprint, filter[index2]
// Reads first: filter[index1], fingerprint, filter[index2]
// Writes: success, filter[index1], filter[index2], index1, relocation_count
// Writes first: success, relocation_count
#if ALL
    #define prepare_task_add() memcpy(&(unsafe->globals), &(safe->globals), sizeof(camel_global_t)) // copy everything
#elif READS
    #define prepare_task_add() cpa(filter, sizeof(fingerprint_t)*NUM_BUCKETS); cps(index1); cps(index2); cps(fingerprint) // copy everything read by task
#elif IDEM
    #define prepare_task_add() cpas(filter,index1); cpas(filter,index2); cps(index1) // copy everything that is present in both read first and writes lists
#elif NONE
    #define prepare_task_add() ;
#else
    #error type of system not defined
#endif
#define writes_task_add() cps(success); cpas(filter, index1); cpas(filter, index2); cps(index1); cps(relocation_count) // everything written needs to go here
void __attribute__((noinline)) task_add()
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

// Reads: fingerprint, index1, filter, relocation_count
// Reads first: fingerprint, index1, filter, relocation_count
// Writes: filter, success, relocation_count, index1, fingerprint
// Writes first: success
#if ALL
    #define prepare_task_relocate() memcpy(&(unsafe->globals), &(safe->globals), sizeof(camel_global_t)) // copy everything
#elif READS
    #define prepare_task_relocate() cps(fingerprint); cps(index1); cpa(filter, sizeof(fingerprint_t)*NUM_BUCKETS); cps(relocation_count) // copy everything read by task
#elif IDEM
    #define prepare_task_relocate() cps(fingerprint); cps(index1); cps(relocation_count) // cpa(filter, sizeof(fingerprint_t)*NUM_BUCKETS); opt below; copy everything that is present in both read first and writes lists
#elif NONE
    #define prepare_task_relocate() ;
#else
    #error type of system not defined
#endif
#define writes_task_relocate() cps(success); cps(relocation_count); cps(index1); cps(fingerprint); //cpaso(filter,writeOpt)  // cpa(filter, sizeof(fingerprint_t)*NUM_BUCKETS); opt below; everything written needs to go here
void __attribute__((noinline)) task_relocate()
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

// Reads: insert_count, success, inserted_count
// Reads first: insert_count, success, inserted_count
// Writes: insert_count, inserted_count, key
// Writes first: key
#if ALL
    #define prepare_task_insert_done() memcpy(&(unsafe->globals), &(safe->globals), sizeof(camel_global_t)) // copy everything
#elif READS
    #define prepare_task_insert_done() cps(insert_count); cps(success); cps(inserted_count) // copy everything read by task
#elif IDEM
    #define prepare_task_insert_done() cps(insert_count); cps(inserted_count) // copy everything that is present in both read first and writes lists
#elif NONE
    #define prepare_task_insert_done() ;
#else
    #error type of system not defined
#endif
#define writes_task_insert_done() cps(insert_count); cps(inserted_count); cps(key)  // everything written needs to go here
void __attribute__((noinline)) task_insert_done()
{
    ++GV(insert_count);
    GV(inserted_count) += GV(success);

    if (GV(insert_count) < NUM_INSERTS) {
    } else {
        GV(key) = init_key;
    }
}

// Reads: filter[index1], filter[index2], fingerprint
// Reads first: filter[index1], filter[index2], fingerprint
// Writes: member
// Writes first: member
#if ALL
    #define prepare_task_lookup_search() memcpy(&(unsafe->globals), &(safe->globals), sizeof(camel_global_t)) // copy everything
#elif READS
    #define prepare_task_lookup_search() cpa(filter, sizeof(fingerprint_t)*NUM_BUCKETS); cps(index1); cps(index2); cps(fingerprint) // copy everything read by task
#elif IDEM
    #define prepare_task_lookup_search() ; // copy everything that is present in both read first and writes lists
#elif NONE
    #define prepare_task_lookup_search() ;
#else
    #error type of system not defined
#endif
#define writes_task_lookup_search() cps(member)  // everything written needs to go here
void __attribute__((noinline)) task_lookup_search()
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

    if (!GV(member)) {
    }
}

// Reads: lookup_count, member, member_count
// Reads first: lookup_count, member, member_count
// Writes: lookup_count, member_count
// Writes first:
#if ALL
    #define prepare_task_lookup_done() memcpy(&(unsafe->globals), &(safe->globals), sizeof(camel_global_t)) // copy everything
#elif READS
    #define prepare_task_lookup_done() cps(lookup_count); cps(lookup_count); cps(lookup_count) // copy everything read by task
#elif IDEM
    #define prepare_task_lookup_done() cps(lookup_count); cps(member_count) // copy everything that is present in both read first and writes lists
#elif NONE
    #define prepare_task_lookup_done() ;
#else
    #error type of system not defined
#endif
#define writes_task_lookup_done() cps(lookup_count); cps(member_count)  // everything written needs to go here
void __attribute__((noinline)) task_lookup_done()
{
    ++GV(lookup_count);

    GV(member_count) += GV(member);

    if (GV(lookup_count) < NUM_LOOKUPS) {
    } else {
    }
}

void __attribute__((noinline)) task_done()
{

	//GV(crc) = __fast_hw_crc(safe, sizeof(camel_buffer_t) - 2, CRC_INIT);
    exit(0);
}

void __attribute__((noinline)) task_commit() {
                                             
    // do{                                                                                                     
    //     _Pragma("GCC diagnostic ignored \"-Wint-conversion\"")                                                
    //                         if(camel.flag == CKPT_1_FLG){																																					
    //                             safe = &(camel.buf2);																																								
    //                             unsafe = &(camel.buf1);																																							
    //                             __dump_registers(safe->reg_file);																																		
    //                             tmp_stack_crc 		= __fast_hw_crc(_get_SP_register()+2, SRAM_TOP-(_get_SP_register()+2), CRC_INIT);	
    //                             tmp_stack_buf_crc = __fast_hw_crc(safe, sizeof(camel_buffer_t) - 2, tmp_stack_crc);									
    //                             safe->stack_and_buf_crc = tmp_stack_buf_crc;																												
    //                             camel.flag = CKPT_2_FLG;																																						
    //                         } else{																																																
    //                             safe = &(camel.buf1);																																								
    //                             unsafe = &(camel.buf2);																																							
    //                             __dump_registers(safe->reg_file);																																		
    //                             tmp_stack_crc 		= __fast_hw_crc(_get_SP_register()+2, SRAM_TOP-(_get_SP_register()+2), CRC_INIT);	
    //                             tmp_stack_buf_crc = __fast_hw_crc(safe, sizeof(camel_buffer_t) - 2, tmp_stack_crc);									
    //                             safe->stack_and_buf_crc = tmp_stack_buf_crc;																												
    //                             camel.flag = CKPT_1_FLG;																																						
    //                         }																																																			
    //     _Pragma("GCC diagnostic warning \"-Wint-conversion\"")                                                
    // }while(0);																																												
}

int main(){

    camel.flag = CKPT_1_FLG;
    safe = &(camel.buf1);
    unsafe = &(camel.buf2);
    camel_init();

    // llvm testing start
    //cps(key);
    //cpas(filter, key);
    //cpa(filter, sizeof(fingerprint_t)*NUM_BUCKETS);
    //cpaso(filter,writeOpt);
    // llvm testing end

    //prepare_task_init();
    //memcpy(&(unsafe->globals), &(safe->globals), sizeof(camel_global_t));
    task_init();
    commit();
    task_commit();
    //memcpy(&(safe->globals), &(unsafe->globals), sizeof(camel_global_t)); // concise version of writes_task_init()
    // The buffers are equal

  while(MGV(lookup_count) < NUM_LOOKUPS) {
        prepare_task_generate_key();
        //memcpy(&(unsafe->globals), &(safe->globals), sizeof(camel_global_t));
        task_generate_key();
        commit();
        writes_task_generate_key();
        task_commit();

        prepare_task_calc_indexes();
        //memcpy(&(unsafe->globals), &(safe->globals), sizeof(camel_global_t));
        task_calc_indexes();
        commit();
        writes_task_calc_indexes();
        task_commit();

        prepare_task_calc_indexes_index_1();
        //memcpy(&(unsafe->globals), &(safe->globals), sizeof(camel_global_t));
        task_calc_indexes_index_1();
        commit();
        writes_task_calc_indexes_index_1();
        task_commit();

        prepare_task_calc_indexes_index_2();
        //memcpy(&(unsafe->globals), &(safe->globals), sizeof(camel_global_t));
        task_calc_indexes_index_2();
        commit();
        writes_task_calc_indexes_index_2();
        task_commit();

        if(MGV(insert_count) < NUM_INSERTS) {
            prepare_task_add();
            //memcpy(&(unsafe->globals), &(safe->globals), sizeof(camel_global_t));
            task_add();
            commit();
            writes_task_calc_indexes();
            task_commit();
            
            if(MGV(filter)[MGV(index1)] && MGV(filter)[MGV(index2)]) {
                while(MGV(success) == false && (MGV(relocation_count) < MAX_RELOCATIONS)) {
                    prepare_task_relocate();
                    //memcpy(&(unsafe->globals), &(safe->globals), sizeof(camel_global_t));
                    task_relocate();
                    commit();
                    writes_task_relocate();
                    task_commit();
                }
            }

            prepare_task_insert_done();
            //memcpy(&(unsafe->globals), &(safe->globals), sizeof(camel_global_t));
            task_insert_done();
            commit();
            writes_task_insert_done();
            task_commit();
            
        } else {
            prepare_task_lookup_search();
            //memcpy(&(unsafe->globals), &(safe->globals), sizeof(camel_global_t));
            task_lookup_search();
            commit();
            writes_task_lookup_search();
            task_commit();

            prepare_task_lookup_done();
            //memcpy(&(unsafe->globals), &(safe->globals), sizeof(camel_global_t));
            task_lookup_done();
            commit();
            writes_task_lookup_done();
            task_commit();
        }
    }
    
    //memcpy(&(unsafe->globals), &(safe->globals), sizeof(camel_global_t));
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
