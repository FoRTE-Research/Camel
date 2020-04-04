#include <msp430.h>
#include <stdint.h>
#include <stdbool.h>
#include <stdlib.h>

#include "../checkpoint/camel_ckpt_defines.h"

#define KEY_SIZE_BITS    32
#define DIGIT_BITS       8 // arithmetic ops take 8-bit args produce 16-bit result
#define DIGIT_MASK       0x00ff
#define NUM_DIGITS       (KEY_SIZE_BITS / DIGIT_BITS)

/** @brief Type large enough to store a product of two digits */
typedef uint16_t digit_t;
//typedef uint8_t digit_t;

typedef struct {
	uint8_t n[NUM_DIGITS]; // modulus
	digit_t e;  // exponent
} pubkey_t;

#if NUM_DIGITS < 2
#error The modular reduction implementation requires at least 2 digits
#endif

#define PRINT_HEX_ASCII_COLS 8

// Blocks are padded with these digits (on the MSD side). Padding value must be
// chosen such that block value is less than the modulus. This is accomplished
// by any value below 0x80, because the modulus is restricted to be above
// 0x80 (see comments below).
static const uint8_t PAD_DIGITS[] = { 0x01 };
#define NUM_PAD_DIGITS (sizeof(PAD_DIGITS) / sizeof(PAD_DIGITS[0]))

// To generate a key pair: see scripts/

// modulus: byte order: LSB to MSB, constraint MSB>=0x80
static const pubkey_t pubkey = {
#include "key.txt"
};

static const unsigned char PLAINTEXT[] =
#include "plaintext.txt"
;

#define NUM_PLAINTEXT_BLOCKS (sizeof(PLAINTEXT) / (NUM_DIGITS - NUM_PAD_DIGITS) + 1)
#define CYPHERTEXT_SIZE (NUM_PLAINTEXT_BLOCKS * NUM_DIGITS)

void task_init();
void task_pad();
void task_exp();
void task_mult_block();
void task_mult_block_get_result();
void task_square_base();
void task_square_base_get_result();
void task_mult_mod();
void task_mult();
void task_reduce_digits();
void task_reduce_normalizable();
void task_reduce_normalize();
void task_reduce_n_divisor();
void task_reduce_quotient();
void task_reduce_multiply();
void task_reduce_compare();
void task_reduce_add();
void task_reduce_subtract();
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
	digit_t product[32];
	digit_t exponent;
	digit_t exponent_next;
	unsigned block_offset;
	unsigned message_length;
	unsigned cyphertext_len;
	digit_t base[32];
	digit_t modulus[NUM_DIGITS];
	digit_t digit;
	digit_t carry;
	unsigned reduce;
	digit_t cyphertext[CYPHERTEXT_SIZE];
	unsigned offset;
	digit_t n_div;
	digit_t product2[32];
	digit_t block[32];
	unsigned quotient;

	// conditional global
	unsigned check;
	unsigned check_final;

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

void task_init()
{
	int i;
	unsigned message_length = sizeof(PLAINTEXT) - 1; 

	for (i = 0; i < NUM_DIGITS; ++i) {
		GV(modulus)[i] = pubkey.n[i];
	}

	GV(message_length) = message_length;
	GV(block_offset) = 0;
	GV(cyphertext_len) = 0;

	//branch var
	GV(check_final) = 0;
	GV(check) = 0;

	//TRANSITION_TO(task_pad);
}

#if ALL
    #define prepare_task_pad() memcpy(&(unsafe->globals), &(safe->globals), sizeof(camel_global_t))
#elif READS
    #define prepare_task_pad() cps(block_offset); cps(message_length)
#elif WRITES
	#define prepare_task_pad() cpa(base, sizeof(digit_t)*32); cps(exponent); cps(block_offset); cps(check)
#elif IDEM
    #define prepare_task_pad() cps(block_offset)
#elif NONE
    #define prepare_task_pad() 
#else
    #error type of system not defined
#endif
#define writes_task_pad() cpa(base, size0f(digit_t)*32); cps(exponent); cps(block_offset); cps(check)
void task_pad()
{
	int i;

	if (GV(block_offset) >= GV(message_length)) {
		task_done();
		//TRANSITION_TO(task_print_cyphertext);
	}

	digit_t zero = 0;
	for (i = 0; i < NUM_DIGITS - NUM_PAD_DIGITS; ++i) {
		GV(base)[i] = (GV(block_offset) + i < GV(message_length)) ? PLAINTEXT[GV(block_offset) + i] : 0xFF;
	}
	for (i = NUM_DIGITS - NUM_PAD_DIGITS; i < NUM_DIGITS; ++i) {
		GV(base)[i] = 1;
	}

	GV(block)[zero] = 1;
	for (i = 1; i < NUM_DIGITS; ++i)
		GV(block)[i] = 0;

	GV(exponent) = pubkey.e;

	GV(block_offset) += NUM_DIGITS - NUM_PAD_DIGITS;

	GV(check) = 0;
	//TRANSITION_TO(task_exp);
}

#if ALL
    #define prepare_task_exp() memcpy(&(unsafe->globals), &(safe->globals), sizeof(camel_global_t))
#elif READS
    #define prepare_task_exp() cps(exponent)
#elif WRITES
	#define prepare_task_exp() cps(exponent); cps(check)
#elif IDEM
    #define prepare_task_exp() cps(exponent)
#elif NONE
    #define prepare_task_exp() 
#else
    #error type of system not defined
#endif
#define writes_task_exp() cps(exponent); cps(check)
void task_exp()
{

	if (GV(exponent) & 0x1) {
		GV(exponent) >>= 1;
		GV(check_final) = 0;
		GV(check) = 0;
		//TRANSITION_TO(task_mult_block);
	} else {
		GV(exponent) >>= 1;
		GV(check_final) = 1;
		GV(check) = 1;
		//TRANSITION_TO(task_square_base);
	}
}

//edit: remove this
void task_mult_block()
{
	//GV(next_task) = TASK_REF(task_mult_block_get_result);
	GV(check_final) = 0;
	//TRANSITION_TO(task_mult_mod);
}

#if ALL
    #define prepare_task_mult_block_get_result() memcpy(&(unsafe->globals), &(safe->globals), sizeof(camel_global_t))
#elif READS
    #define prepare_task_mult_block_get_result() cpa(product, sizeof(digit_t) * 32); cps(exponent); cps(cyphertext_len)
#elif WRITES
	#define prepare_task_mult_block_get_result() cpa(block, sizeof(digit_t) * 32); cps(check); cps(check_final); cpa(cyphertext, sizeof(digit_t) *CYPHERTEXT_SIZE); cps(cyphertext_len)
#elif IDEM
    #define prepare_task_mult_block_get_result() cps(cyphertext_len)
#elif NONE
    #define prepare_task_mult_block_get_result() 
#else
    #error type of system not defined
#endif
#define writes_task_mult_block_get_result() cpa(block, sizeof(digit_t) * 32); cps(check); cps(check_final); cpa(cyphertext, sizeof(digit_t) *CYPHERTEXT_SIZE); cps(cyphertext_len)
void task_mult_block_get_result()
{
	int i;

	for (i = NUM_DIGITS - 1; i >= 0; --i) { // reverse for printing
		GV(block)[i] = GV(product)[i];
	}

	// On last iteration we don't need to square base
	if (GV(exponent) > 0) {

		GV(check) = 100;
		GV(check_final) = 1;
		//TRANSITION_TO(task_square_base);

	} else { // block is finished, save it

		if (GV(cyphertext_len) + NUM_DIGITS <= CYPHERTEXT_SIZE) {

			for (i = 0; i < NUM_DIGITS; ++i) { // reverse for printing

				GV(cyphertext)[GV(cyphertext_len)] = GV(product)[i];
				++GV(cyphertext_len);
			}

		} 

		GV(check) = 0;
		//TRANSITION_TO(task_pad);
	}

}

//edit: remove this
void task_square_base()
{
	//GV(next_task) = TASK_REF(task_square_base_get_result);
	GV(check_final) = 1;
	//TRANSITION_TO(task_mult_mod);
}

#if ALL
    #define prepare_task_square_base_get_result() memcpy(&(unsafe->globals), &(safe->globals), sizeof(camel_global_t))
#elif READS
    #define prepare_task_square_base_get_result() cpa(product, sizeof(digit_t) * 32)
#elif WRITES
	#define prepare_task_square_base_get_result() cpa(base, sizeof(digit_t) * 32); cps(check)
#elif IDEM
    #define prepare_task_square_base_get_result() 
#elif NONE
    #define prepare_task_square_base_get_result() 
#else
    #error type of system not defined
#endif
#define writes_task_square_base_get_result() cpa(base, sizeof(digit_t) * 32); cps(check)
void task_square_base_get_result()
{
	int i;
	digit_t b;

	for (i = 0; i < NUM_DIGITS; ++i) {
		GV(base)[i] = GV(product)[i];
	}

	GV(check) = 0;
	//TRANSITION_TO(task_exp);
}

#if ALL
    #define prepare_task_mult_mod() memcpy(&(unsafe->globals), &(safe->globals), sizeof(camel_global_t))
#elif READS
    #define prepare_task_mult_mod()
#elif WRITES
	#define prepare_task_mult_mod() cps(digit); cps(carry)
#elif IDEM
    #define prepare_task_mult_mod() 
#elif NONE
    #define prepare_task_mult_mod() 
#else
    #error type of system not defined
#endif
#define writes_task_mult_mod() cps(digit); cps(carry)
void task_mult_mod()
{

	GV(digit) = 0;
	GV(carry) = 0;

	//TRANSITION_TO(task_mult);
}

#if ALL
    #define prepare_task_mult() memcpy(&(unsafe->globals), &(safe->globals), sizeof(camel_global_t))
#elif READS
    #define prepare_task_mult() cps(carry); cps(digit); cpa(base, sizeof(digit_t)*32);  cpa(block, sizeof(digit_t)*32); 
#elif WRITES
	#define prepare_task_mult() cpas(product, digit); cps(digit); cps(carry); cps(check)
#elif IDEM
    #define prepare_task_mult() cps(digit); cps(carry)
#elif NONE
    #define prepare_task_mult() 
#else
    #error type of system not defined
#endif
#define writes_task_mult() cpas(product, digit); cps(digit); cps(carry); cps(check)
void task_mult()
{
	int i;
	digit_t a, b, c;
	digit_t dp, p;

	p = GV(carry);
	c = 0;
	for (i = 0; i < NUM_DIGITS; ++i) {
		if (GV(digit) - i >= 0 && GV(digit) - i < NUM_DIGITS) {
			a = GV(base)[GV(digit)-i];
			b = GV(block)[i];
			dp = a * b;

			c += dp >> DIGIT_BITS;
			p += dp & DIGIT_MASK;

		}
	}

	c += p >> DIGIT_BITS;
	p &= DIGIT_MASK;

	GV(product)[GV(digit)] = p;
	GV(digit)++;

	if (GV(digit) < NUM_DIGITS * 2) {
		GV(carry) = c;
		GV(check) = 0;
		//TRANSITION_TO(task_mult);
	} else {
		//GV(next_task_print) = TASK_REF(task_reduce_digits);
		GV(check) = 1;
		//TRANSITION_TO(task_print_product);
	}
}

#if ALL
    #define prepare_task_reduce_digits() memcpy(&(unsafe->globals), &(safe->globals), sizeof(camel_global_t))
#elif READS
    #define prepare_task_reduce_digits() cpa(product, sizeof(digit_t)*32)
#elif WRITES
	#define prepare_task_reduce_digits() cps(check); cps(reduce)
#elif IDEM
    #define prepare_task_reduce_digits() 
#elif NONE
    #define prepare_task_reduce_digits() 
#else
    #error type of system not defined
#endif
#define writes_task_reduce_digits() cps(check); cps(reduce)
void task_reduce_digits()
{
	int d;

	d = 2 * NUM_DIGITS;
	do {
		d--;
	} while (GV(product)[d] == 0 && d > 0);

	if (GV(product)[d] == 0) {
		GV(check) = 0;
		return;
		//TRANSITION_TO(task_init);
	}

	GV(reduce) = d;

	GV(check) = 1;
	//TRANSITION_TO(task_reduce_normalizable);
}

#if ALL
    #define prepare_task_reduce_normalizable() memcpy(&(unsafe->globals), &(safe->globals), sizeof(camel_global_t))
#elif READS
    #define prepare_task_reduce_normalizable() cps(reduce); cpa(product, sizeof(digit_t)*32); cps(offset); cpa(modulus, sizeof(digit_t)*NUM_DIGITS)
#elif WRITES
	#define prepare_task_reduce_normalizable() cps(offset); cps(check)
#elif IDEM
    #define prepare_task_reduce_normalizable() 
#elif NONE
    #define prepare_task_reduce_normalizable() 
#else
    #error type of system not defined
#endif
#define writes_task_reduce_normalizable() cps(offset); cps(check)
void task_reduce_normalizable()
{
	int i;
	unsigned m, n, d;
	bool normalizable = true;

	GV(offset) = GV(reduce) + 1 - NUM_DIGITS; // TODO: can this go below zero

	for (i = GV(reduce); i >= 0; --i) {

		if (GV(product)[i] > GV(modulus)[i-GV(offset)]) {
			break;
		} else if (GV(product)[i] < GV(modulus)[i-GV(offset)]) {
			normalizable = false;
			break;
		}
	}

	if (!normalizable && GV(reduce) == NUM_DIGITS - 1) {

		GV(check) = 2;
		//transition_to(GV(next_task));
	}

	if (normalizable) {
		GV(check) = 0;
		//TRANSITION_TO(task_reduce_normalize);
	} else {
		GV(check) = 1;
		//TRANSITION_TO(task_reduce_n_divisor);
	}
}

#if ALL
    #define prepare_task_reduce_normalize() memcpy(&(unsafe->globals), &(safe->globals), sizeof(camel_global_t))
#elif READS
    #define prepare_task_reduce_normalize() cpa(product, sizeof(digit_t)*32); cps(offset); cpa(modulus, sizeof(digit_t)*NUM_DIGITS)
#elif WRITES
	#define prepare_task_reduce_normalize() cpa(product, sizeof(digit_t)*32); cps(check)
#elif IDEM
    #define prepare_task_reduce_normalize() cpa(product, sizeof(digit_t)*32
#elif NONE
    #define prepare_task_reduce_normalize() 
#else
    #error type of system not defined
#endif
#define writes_task_reduce_normalize() cpa(product, sizeof(digit_t)*32); cps(check)
void task_reduce_normalize()
{
	digit_t m, n, d, s;
	unsigned borrow;

	int i;

	borrow = 0;
	for (i = 0; i < NUM_DIGITS; ++i) {
		m = GV(product)[i + GV(offset)];
		n = GV(modulus)[i];

		s = n + borrow;
		if (m < s) {
			m += 1 << DIGIT_BITS;
			borrow = 1;
		} else {
			borrow = 0;
		}
		d = m - s;

		GV(product)[ i + GV(offset)] = d;
	}

	if (GV(offset) > 0) { 
		//GV(next_task_print) = TASK_REF(task_reduce_n_divisor);
	} else {

		GV(check) = 2;
		//GV(next_task_print) = GV(next_task);
	}
	//TRANSITION_TO(task_print_product);
}

#if ALL
    #define prepare_task_reduce_n_divisor() memcpy(&(unsafe->globals), &(safe->globals), sizeof(camel_global_t))
#elif READS
    #define prepare_task_reduce_n_divisor() cpa(modulus, sizeof(digit_t)*NUM_DIGITS)
#elif WRITES
	#define prepare_task_reduce_n_divisor() cps(n_div)
#elif IDEM
    #define prepare_task_reduce_n_divisor() 
#elif NONE
    #define prepare_task_reduce_n_divisor() 
#else
    #error type of system not defined
#endif
#define writes_task_reduce_normalize() cps(n_div)
void task_reduce_n_divisor()
{

	GV(n_div) = ( GV(modulus)[NUM_DIGITS - 1] << DIGIT_BITS) + GV(modulus)[ NUM_DIGITS -2];

	//TRANSITION_TO(task_reduce_quotient);
}

#if ALL
    #define prepare_task_reduce_quotient() memcpy(&(unsafe->globals), &(safe->globals), sizeof(camel_global_t))
#elif READS
    #define prepare_task_reduce_quotient() cpa(product, sizeof(digit_t)*32); cpa(modulus, sizeof(digit_t)*NUM_DIGITS); cps(reduce); cps(n_div); cps(quotient)
#elif WRITES
	#define prepare_task_reduce_quotient() cps(quotient); cps(reduce)
#elif IDEM
    #define prepare_task_reduce_quotient() cps(quotient); cps(reduce)
#elif NONE
    #define prepare_task_reduce_quotient() 
#else
    #error type of system not defined
#endif
#define writes_task_reduce_quotient() cps(quotient); cps(reduce)
void task_reduce_quotient()
{
	digit_t m_n, q;
	uint32_t qn, n_q; 

	if (GV(product)[GV(reduce)] == GV(modulus)[NUM_DIGITS - 1]) {
		GV(quotient) = (1 << DIGIT_BITS) - 1;
	} else {
		GV(quotient) = ((GV(product)[GV(reduce)] << DIGIT_BITS) + GV(product)[GV(reduce)-1] / GV(modulus)[NUM_DIGITS - 1]);
	}

	n_q = ((uint32_t)GV(product)[GV(reduce)] << (2 * DIGIT_BITS)) + (GV(product)[GV(reduce) - 1] << DIGIT_BITS) + GV(product)[GV(reduce) - 2];

	GV(quotient)++;
	do {
		GV(quotient)--;
		qn = mult16(GV(n_div), GV(quotient));

	} while (qn > n_q);


	GV(reduce)--;

	//TRANSITION_TO(task_reduce_multiply);
}

#if ALL
    #define prepare_task_reduce_multiply() memcpy(&(unsafe->globals), &(safe->globals), sizeof(camel_global_t))
#elif READS
    #define prepare_task_reduce_multiply() cps(reduce); cpa(modulus, sizeof(digit_t)*NUM_DIGITS); cps(offset); cps(quotient)
#elif WRITES
	#define prepare_task_reduce_multiply() cpa(product2, sizeof(digit_t)*32)
#elif IDEM
    #define prepare_task_reduce_multiply() 
#elif NONE
    #define prepare_task_reduce_multiply() 
#else
    #error type of system not defined
#endif
#define writes_task_reduce_multiply() cpa(product2, sizeof(digit_t)*32)
void task_reduce_multiply()
{
	int i;
	digit_t m, n;
	unsigned c, offset;

	offset = GV(reduce) + 1 - NUM_DIGITS;

	for (i = 0; i < offset; ++i) {
		GV(product2)[i] = 0;
	}
	c = 0;
	for (i = offset; i < 2 * NUM_DIGITS; ++i) {

		m = c;
		if (i < offset + NUM_DIGITS) {
			n = GV(modulus)[i - GV(offset)];

			m += GV(quotient) * n;
		} else {
			n = 0;

		}


		c = m >> DIGIT_BITS;
		m &= DIGIT_MASK;

		GV(product2)[i] = m;

	}
	//GV(next_task_print) = TASK_REF(task_reduce_compare);
	//TRANSITION_TO(task_print_product);
}

#if ALL
    #define prepare_task_reduce_compare() memcpy(&(unsafe->globals), &(safe->globals), sizeof(camel_global_t))
#elif READS
    #define prepare_task_reduce_compare() cpa(product, sizeof(digit_t)*32); cpa(product2, sizeof(digit_t)*32)
#elif WRITES
	#define prepare_task_reduce_compare() cps(check)
#elif IDEM
    #define prepare_task_reduce_compare() 
#elif NONE
    #define prepare_task_reduce_compare() 
#else
    #error type of system not defined
#endif
#define writes_task_reduce_compare() cps(check)
void task_reduce_compare()
{
	int i;
	char relation = '=';

	for (i = NUM_DIGITS * 2 - 1; i >= 0; --i) {

		if (GV(product)[i] > GV(product2)[i]) {
			relation = '>';
			break;
		} else if (GV(product)[i] < GV(product2)[i]) {
			relation = '<';
			break;
		}
	}

	if (relation == '<') {
		GV(check) = 0;
		//TRANSITION_TO(task_reduce_add);
	} else {
		GV(check) = 1;
		//TRANSITION_TO(task_reduce_subtract);
	}
}

#if ALL
    #define prepare_task_reduce_add() memcpy(&(unsafe->globals), &(safe->globals), sizeof(camel_global_t))
#elif READS
    #define prepare_task_reduce_add() cps(reduce); cpa(product, sizeof(digit_t)*32); cpa(modulus, sizeof(digit_t)*NUM_DIGITS)
#elif WRITES
	#define prepare_task_reduce_add() cpa(product, sizeof(digit_t)*32)
#elif IDEM
    #define prepare_task_reduce_add() cpa(product, sizeof(digit_t)*32)
#elif NONE
    #define prepare_task_reduce_add() 
#else
    #error type of system not defined
#endif
#define writes_task_reduce_add() cpa(product, sizeof(digit_t)*32)
void task_reduce_add()
{
	int i, j;
	digit_t m, n, c;
	unsigned offset;
	offset = GV(reduce) + 1 - NUM_DIGITS;
	c = 0;
	for (i = offset; i < 2 * NUM_DIGITS; ++i) {
		m = GV(product)[i];

		j = i - offset;

		if (i < offset + NUM_DIGITS) {
			n = GV(modulus)[j];
		} else {
			n = 0;
			j = 0; 
		}

		GV(product)[i] = c + m + n;

		c = GV(product)[i] >> DIGIT_BITS;
		GV(product)[i] &= DIGIT_MASK;
	}

	//GV(next_task_print) = TASK_REF(task_reduce_subtract);
	//TRANSITION_TO(task_print_product);
}

#if ALL
    #define prepare_task_reduce_subtract() memcpy(&(unsafe->globals), &(safe->globals), sizeof(camel_global_t))
#elif READS
    #define prepare_task_reduce_subtract() cps(reduce); cpa(product, sizeof(digit_t)*32); cpa(product2, sizeof(digit_t)*32) 
#elif WRITES
	#define prepare_task_reduce_subtract() cpa(product, sizeof(digit_t)*32)
#elif IDEM
    #define prepare_task_reduce_subtract() cpa(product, sizeof(digit_t)*32)
#elif NONE
    #define prepare_task_reduce_subtract() 
#else
    #error type of system not defined
#endif
#define writes_task_reduce_subtract() cpa(product, sizeof(digit_t)*32)
void task_reduce_subtract()
{
	int i;
	digit_t m, s, qn;
	unsigned borrow, offset;

	offset = GV(reduce) + 1 - NUM_DIGITS;

	borrow = 0;
	for (i = 0; i < 2 * NUM_DIGITS; ++i) {
		m = GV(product)[i];

		if (i >= offset) {
			qn = GV(product2)[i];

			s = qn + borrow;
			if (m < s) {
				m += 1 << DIGIT_BITS;
				borrow = 1;
			} else {
				borrow = 0;
			}
			GV(product)[i] = m - s;
		}
	}

	if (GV(reduce) + 1 > NUM_DIGITS) {
		//GV(next_task_print) = TASK_REF(task_reduce_quotient);
	} else { 
		//GV(next_task_print) = GV(next_task);
	}
	//TRANSITION_TO(task_print_product);
}

void task_commit() {

}

void task_done() {

	exit(0);
	
}

int main() {

    camel.flag = CKPT_1_FLG;
    safe = &(camel.buf1);
    unsafe = &(camel.buf2);
    camel_init();

    while (1) { 

	    task_init();
	    commit();
	 	//memcpy(&(safe->globals), &(unsafe->globals), sizeof(camel_global_t)); // concise version of writes_task_init()
	    task_commit();

	    while(1) {

	    	if (MGV(check_final) == 0 && GV(check) != 100) {
			    //prepare_task_pad();
			    task_pad();
			    commit();
			    //writes_task_pad();
			    task_commit();
			}

			if (GV(check) != 100) {

				//prepare_task_exp();
				task_exp();
				commit();
				//writes_task_exp();
				task_commit();
			
			}

			// removed completely from the flow of the program
		    // if (MGV(check) == 0){

		    // 	//prepare_task_mult_block();
		    // 	task_mult_block();
		    // 	commit();
		    // 	//writes_task_mult_block();
		    // 	task_commit();

		    // } else {

		    // 	//prepare_task_square_base();
		    // 	task_square_base();
		    // 	commit();
		    // 	//writes_task_square_base();
		    // 	task_commit();

		    // }

		    //prepare_task_mult_mod();
		    task_mult_mod();
		    commit();
		    //writes_task_mult_mod();
		    task_commit();

			do {

				//prepare_task_mult();
				task_mult();
				commit();
				//writes_task_mult();
				task_commit();
				
			} while (MGV(check) == 0);

			//prepare_task_reduce_digits();
			task_reduce_digits();
			commit();
			//writes_task_reduce_digits();
			task_commit();

			if (MGV(check) == 0){

				break;
			}

			//prepare_task_reduce_normalizable();
			task_reduce_normalizable();
			commit();
			//writes_task_reduce_normalizable();
			task_commit();

			if (MGV(check) == 0) {

				//prepare_task_reduce_normalize();
				task_reduce_normalize();
				commit();
				//writes_task_reduce_normalize();
				task_commit();

				if (GV(offset) > 0) {

					//prepare_task_reduce_n_divisor();
					task_reduce_n_divisor();
					commit();
					//writes_task_reduce_n_divisor();
					task_commit();
				}

			} else if (MGV(check) == 1) {

				//prepare_task_reduce_n_divisor();
				task_reduce_n_divisor();
				commit();
				//writes_task_reduce_n_divisor();
				task_commit();
			}

			if (GV(check) != 2) {
				do {
					//prepare_task_reduce_quotient();
					task_reduce_quotient();
					commit();
					//writes_task_reduce_quotient();
					task_commit();

					//prepare_task_reduce_multiply();
					task_reduce_multiply();
					commit();
					//writes_task_reduce_multiply();
					task_commit();

					//prepare_task_reduce_compare();
					task_reduce_compare();
					commit();
					//writes_task_reduce_compare();
					task_commit();

					if (MGV(check) == 0) {

						//prepare_task_reduce_add();
						task_reduce_add();
						commit();
						//writes_task_reduce_add();
						task_commit();

					} 

					//prepare_task_reduce_subtract();
					task_reduce_subtract();
					commit();
					//writes_task_reduce_subtract();
					task_commit();
			 	
			 	} while (MGV(reduce) + 1 > NUM_DIGITS);

			 }

		 	if (MGV(check_final) == 0) {

				//prepare_task_mult_block_get_result();
				task_mult_block_get_result();
				commit();
				//writes_task_mult_block_get_result();
				task_commit();

			} else if (MGV(check_final) == 1) {

				//prepare_task_square_base_get_result();
				task_square_base_get_result();
				commit();
				//writes_task_square_base_get_result();
				task_commit();
			}
		}
	}
}