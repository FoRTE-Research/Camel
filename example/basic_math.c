#include <stdio.h>

#include <msp430.h>
#include <stdint.h>
#include <stdbool.h>
#include <stdlib.h>
#include <string.h>

#include "../checkpoint/camel_ckpt_defines.h"

// Camel stuff

// 16-bit architecture
typedef uint16_t camel_reg_t;
typedef uint16_t value_t;

// Temporary CRC results
uint16_t tmp_stack_crc;
uint16_t tmp_stack_buf_crc;

// Macros and macro redefinitions!
#define GV(x) unsafe->globals.x

// Macros that define how prepare statements copy variables and arrays
#define cps(x) unsafe->globals.x = safe->globals.x
#define cpas(x,y) unsafe->globals.x[unsafe->globals.y] = safe->globals.x[unsafe->globals.y]
#define cpaso(x, y) unsafe->globals.x[y] = safe->globals.x[y]
#define cpa(x,y) memcpy(unsafe->globals.x,safe->globals.x,y)
uint16_t writeOpt;

#define commit() do{ 																																									    	              \
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

// Globals
#define ARR_SIZE 5
typedef struct camel_global_t
{
  value_t v1, v2, v3;
  value_t arr1[ARR_SIZE], arr2[ARR_SIZE];
} camel_global_t;
// End globals

typedef struct camel_buffer_t
{
  camel_reg_t reg_file[NUM_REGISTERS_SAVED];  // 11 16-bit registers: 22 bytes
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
}

// End Camel stuff

uint8_t arrEqual(value_t ptr1[], value_t ptr2[], size_t len){
  size_t i;
  for(i = 0; i < len; i++){
    if(ptr1[i] != ptr2[i]){
      return 0;
    }
  }
  return 1;
}

#define writes_task_init() cps(v1); cps(v2); cps(v3); cpa(arr1, ARR_SIZE * sizeof(value_t)); cpa(arr2, ARR_SIZE * sizeof(value_t))
void task_init(){
  GV(v1) = 1;
  GV(v2) = 2;
  GV(v3) = 0;
  memset(GV(arr1), 0, ARR_SIZE * sizeof(value_t));
  memset(GV(arr2), 0, ARR_SIZE * sizeof(value_t));
}

#define writes_task1() cps(v1); cps(v2); cpaso(arr1, 0)
void task_1(){
  GV(v1) += 1;                    // v1 = 2
  GV(v2) = GV(v1) + GV(v1) + 5;   // v2 = 9
  int opt=0;                        // added for Camel.
  GV(arr1)[opt] = GV(v1);           // arr1[0] = 2
}

#define writes_task2() cpaso(arr2, 1); cpaso(arr1, 4)
void task_2(){

  // added for camel
  int read1 = 0;
  int read2 = 3;
  int write1 = 1;
  int write2 = 1;

  GV(arr2)[write1] = GV(arr1)[read1];      // arr2[1] = 2
  GV(arr1)[write2] += GV(arr1)[read2] + 5; // arr1[4] = 5
}

// Top succeeds - entire arr2 is copied
// Bottom fails - first modification of arr2 is missed
// #define writes_task3() cps(v3); cpa(arr2, ARR_SIZE * sizeof(value_t))
#define writes_task3() cps(v3); cpas(arr2, v3)
void task_3(){
  GV(v3) = GV(v1) + 1;                      // v3 = 3

  int opt = GV(v3) + 1;             //added for camel

  GV(arr2)[GV(v3)] = GV(arr1)[opt];  // arr2[3] = arr1[4] = 5
  // Kills camel!
  // Modification to GV(arr2)[3] is forgotten - when we exit function,
  // we see that GV(v3) is 4 so we only update GV(arr2)[4]
  GV(v3) += 1;                              // v3 = 4
  GV(arr2)[GV(v3)] = GV(arr1)[GV(v3)];      // arr2[4] = arr1[4] = 5
}

// Set breakpoints on these and see which you get to
void success(){}
void failure(){}

void task_check(){
  value_t ref_arr1[ARR_SIZE] = {2, 0, 0, 0, 5};
  value_t ref_arr2[ARR_SIZE] = {0, 2, 0, 5, 5}; // Fails: arr2[3] = 0
  value_t ref_v1 = 2;
  value_t ref_v2 = 9;
  value_t ref_v3 = 4;

  if(GV(v1) != ref_v1){
    failure();
  }
  if(GV(v2) != ref_v2){
    failure();
  }
  if(GV(v3) != ref_v3){
    failure();
  }
  if(!arrEqual(ref_arr1, GV(arr1), ARR_SIZE)){
    failure();
  }
  if(!arrEqual(ref_arr2, GV(arr2), ARR_SIZE)){
    failure();
  }
  success();
}

int main(){
  // Compile main with this to find camel size easily
  // volatile int i;
  // while(1){
  //   i = sizeof(camel);
  // }
  camel.flag = CKPT_1_FLG;
  safe = &(camel.buf1);
  unsafe = &(camel.buf2);
  camel_init();

  task_init();
  commit();
  //writes_task_init();


  task_1();
  commit();
  //writes_task1();

  task_2();
  commit();
  //writes_task2();

  task_3();
  commit();
  //writes_task3();

  task_check();

  while(1);
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
