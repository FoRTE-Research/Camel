#include <msp430.h>
#include <stdint.h>
#include <stdbool.h>
#include <stdlib.h>
#include <math.h>
#include <string.h>

#include "macros.h"
#include "camel_ckpt_defines.h"

#define KEY_SIZE_BITS    64
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

// Blocks are padded with these digits (on the MSD side). Padding value must be
// chosen such that block value is less than the modulus. This is accomplished
// by any value below 0x80, because the modulus is restricted to be above
// 0x80 (see comments below).
static const uint8_t PAD_DIGITS[] = { 0x01 };
#define NUM_PAD_DIGITS (sizeof(PAD_DIGITS) / sizeof(PAD_DIGITS[0]))

// To generate a key pair: see scripts/

// modulus: byte order: LSB to MSB, constraint MSB>=0x80
static const pubkey_t pubkey = {
#include "key64.txt"
};

static const unsigned char PLAINTEXT[] =
#include "plaintext.txt"
;

#define NUM_PLAINTEXT_BLOCKS (sizeof(PLAINTEXT) / (NUM_DIGITS - NUM_PAD_DIGITS) + 1)
#define CYPHERTEXT_SIZE (NUM_PLAINTEXT_BLOCKS * NUM_DIGITS)

// Camel stuff

// 16-bit architecture
typedef uint16_t camel_reg_t;

// Temporary CRC results
uint16_t tmp_stack_crc;
uint16_t tmp_stack_buf_crc;

// Globals
typedef struct camel_global_t
{

	digit_t product[NUM_DIGITS*2];
	digit_t exponent;
	digit_t exponent_next;
	unsigned block_offset;
	unsigned message_length;
	unsigned cyphertext_len;
	digit_t base[NUM_DIGITS*2];
	digit_t modulus[NUM_DIGITS];
	digit_t digit;
	digit_t carry;
	unsigned reduce;
	digit_t cyphertext[CYPHERTEXT_SIZE];
	unsigned offset;
	digit_t n_div;
	digit_t product2[NUM_DIGITS*2];
	digit_t block[NUM_DIGITS*2];
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

void task_done() {
	 
	exit(0);
}


void task_init()
{

	//printf("task: %s\n", "task_init");
	//cout << "task_init" << endl;
	
	int i;
	unsigned message_length = sizeof(PLAINTEXT) - 1; // skip the terminating null byte

	// TODO: consider passing pubkey as a structure type
	for (i = 0; i < NUM_DIGITS; ++i) {
		GV(modulus)[i] = pubkey.n[i];
	}


	GV(message_length) = message_length;
	GV(block_offset) = 0;
	GV(cyphertext_len) = 0;

	//branch vars
	GV(check) = 0;
	GV(check_final) = 0;
	//GV(count) = 0;
	//TRANSITION_TO(task_pad);
}

void task_pad()
{

	//printf("task: %s\n", "task_pad");

	//cout << "task_pad" << endl;
	int i;

	if (GV(block_offset) >= GV(message_length)) {

		P9DIR |= BIT7;
		P9OUT |= BIT7;

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

	//GV(exponent_next) = GV(exponent);
	GV(exponent) = pubkey.e;

	GV(block_offset) += NUM_DIGITS - NUM_PAD_DIGITS;

	GV(check) = 2;
	//TRANSITION_TO(task_exp);
}

void task_exp()
{

	//printf("task: %s\n", "task_exp");
	//cout << "task_exp" << endl;

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

void task_mult_block()
{

	//cout << "task_mult_block" << endl;
    GV(check_final) = 0;
	// TODO: pass args to mult: message * base
	//GV(next_task) = TASK_REF(task_mult_block_get_result);
	//TRANSITION_TO(task_mult_mod);
}

void task_mult_block_get_result()
{

	//cout << "task_mult_block_get_result" << endl;
	//printf("task: %s\n", "task_mult_block_Get_result");

	int i;

	for (i = NUM_DIGITS - 1; i >= 0; --i) { // reverse for printing
		GV(block)[i] = GV(product)[i];
	}

	// On last iteration we don't need to square base
	if (GV(exponent) > 0) {

		GV(check) = 1;
		GV(check_final) = 1;
		//TRANSITION_TO(task_square_base);

	} else { // block is finished, save it

		if (GV(cyphertext_len) + NUM_DIGITS <= CYPHERTEXT_SIZE) {

			for (i = 0; i < NUM_DIGITS; ++i) { // reverse for printing

				unsigned op = GV(cyphertext_len);
				GV(cyphertext)[op] = GV(product)[i];
				++GV(cyphertext_len);
			}

		} 
		// else {

		// 	// carry on encoding, though
		// }


		GV(check) = 0;
		//TRANSITION_TO(task_pad);
	}

}

void task_square_base()
{

	//cout << "task_square_base" << endl;

	GV(check_final) = 1;
	//GV(next_task) = TASK_REF(task_square_base_get_result);
	//TRANSITION_TO(task_mult_mod);
}

void task_square_base_get_result()
{
	//cout << "task_square_base_get_result" << endl;
	//printf("task: %s\n", "task_square_base_get_Result");

	int i;

	for (i = 0; i < NUM_DIGITS; ++i) {
		GV(base)[i] = GV(product)[i];
	}

	GV(check) = 2;
	//TRANSITION_TO(task_exp);
}

void task_mult_mod()
{

	//cout << "task_mult_mod" << endl;
	//printf("task: %s\n", "task_mult_mod");


	GV(digit) = 0;
	GV(carry) = 0;

	//TRANSITION_TO(task_mult);
}

void task_mult()
{
	//cout << "task_mult" << endl;

	//printf("task: %s\n", "task_mult");
	int i;
	digit_t a, b, c;
	digit_t dp, p;

	p = GV(carry);
	c = 0;
	for (i = 0; i < NUM_DIGITS; ++i) {
		if (GV(digit) - i >= 0 && GV(digit) - i < NUM_DIGITS) {
			
			unsigned op = GV(digit) - i;

			a = GV(base)[op];
			b = GV(block)[i];
			dp = a * b;

			c += dp >> DIGIT_BITS;
			p += dp & DIGIT_MASK;

		}
	}

	c += p >> DIGIT_BITS;
	p &= DIGIT_MASK;

	GV(product)[GV(digit)] = p;
	//GV(print_which) = 0;
	GV(digit)++;

	//printf("num:%d\n ", GV(digit));

	if (GV(digit) < NUM_DIGITS * 2) {
		GV(carry) = c;
		//TRANSITION_TO(task_mult);
	} 
	// else {
	// 	//GV(next_task_print) = TASK_REF(task_reduce_digits);
	// 	//TRANSITION_TO(task_print_product);
	// }
}

void task_reduce_digits()
{
	//cout << "task_reduce_digits" << endl;

	//printf("task: %s\n", "task_reduce_digits");

	int d;

	d = 2 * NUM_DIGITS;
	do {
		d--;
	} while (GV(product)[d] == 0 && d > 0);

	if (GV(product)[d] == 0) {
		GV(check) = 0;
		//TRANSITION_TO(task_init);
	}

	GV(reduce) = d;

	GV(check) = 1;
	//TRANSITION_TO(task_reduce_normalizable);
}

void task_reduce_normalizable()
{

	//cout << "task_reduce_normalizable" << endl;
	//printf("task: %s\n", "task_reduce_normailzable");

	int i;
	bool normalizable = true;

	GV(offset) = GV(reduce) + 1 - NUM_DIGITS; // TODO: can this go below zero

	for (i = GV(reduce); i >= 0; --i) {

		unsigned op = i-GV(offset);

		if (GV(product)[i] > GV(modulus)[op]) {
			break;
		} else if (GV(product)[i] < GV(modulus)[op]) {
			normalizable = false;
			break;
		}
	}

	if (!normalizable && GV(reduce) == NUM_DIGITS - 1) {

		GV(check) = 0;
		//transition_to(GV(next_task));
	}

	if (normalizable) {

		GV(check) = 1;
		//TRANSITION_TO(task_reduce_normalize);
	} else {

		GV(check) = 2;
		//TRANSITION_TO(task_reduce_n_divisor);
	}
}
void task_reduce_normalize()
{
	//printf("task: %s\n", "task_reduce_normalize");
	//cout << "task_reduce_normalize" << endl;

	digit_t m, n, d, s;
	unsigned borrow;

	int i;
	// To call the print task, we need to proxy the values we don't touch
	//GV(print_which) = 0;

	borrow = 0;
	for (i = 0; i < NUM_DIGITS; ++i) {

		unsigned op = i + GV(offset);

		m = GV(product)[op];
		n = GV(modulus)[i];

		s = n + borrow;
		if (m < s) {
			m += 1 << DIGIT_BITS;
			borrow = 1;
		} else {
			borrow = 0;
		}
		d = m - s;

		GV(product)[op] = d;

	}

	if (GV(offset) > 0) { 
		GV(check) = 2;
		//GV(next_task_print) = TASK_REF(task_reduce_n_divisor);
	} else {
		GV(check) = 0;
		//GV(next_task_print) = GV(next_task);
	}
	//TRANSITION_TO(task_print_product);
}

void task_reduce_n_divisor()
{

	//cout << "task_reduce_n_divisor" << endl;

	unsigned op1 = NUM_DIGITS - 1;
	unsigned op2 = NUM_DIGITS -2;

	GV(n_div) = ( GV(modulus)[op1]<< DIGIT_BITS) + GV(modulus)[op2];

	//TRANSITION_TO(task_reduce_quotient);
}

void task_reduce_quotient()
{

	//cout << "task_reudce_quotient" << endl;

	uint32_t qn, n_q; 

	unsigned op1 = NUM_DIGITS - 1;
	unsigned op2 = GV(reduce) - 1;
	unsigned op3 = GV(reduce) - 2;

	if (GV(product)[GV(reduce)] == GV(modulus)[op1]) {
		GV(quotient) = (1 << DIGIT_BITS) - 1;
	} else {
		GV(quotient) = ((GV(product)[GV(reduce)] << DIGIT_BITS) + GV(product)[op2]) / GV(modulus)[op1];
	}

	n_q = ((uint32_t)GV(product)[GV(reduce)] << (2 * DIGIT_BITS)) + (GV(product)[op2] << DIGIT_BITS) + GV(product)[op3];

	GV(quotient)++;
	do {
		GV(quotient)--;
		qn = GV(n_div) *  GV(quotient);
	} while (qn > n_q);

	GV(reduce)--;

	//TRANSITION_TO(task_reduce_multiply);
}

void task_reduce_multiply()
{
	//cout << "task_reduce_multiply" << endl;
	int i;
	digit_t m = 0;
	digit_t n= 0;
	unsigned c = 0; 
	//int offset = 0;
	int offset = GV(reduce) + 1 - NUM_DIGITS;
	//cout << offset << endl;

	for (i = 0; i < offset; ++i) {
		GV(product2)[i] = 0;
	}
	c = 0;
	for (i = offset; i < 2 * NUM_DIGITS; ++i) {

		m = c;
		if (i < offset + NUM_DIGITS) {

			int op = i - offset;
			n = GV(modulus)[op];

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

void task_reduce_compare()
{
	
	//cout << "task_reduce_compare" << endl;

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
	} 
	// else {
	// 	GV(check) = 1;
	// 	//TRANSITION_TO(task_reduce_subtract);
	// }
}


void task_reduce_add()
{

	//cout << "task_reduce_add" << endl;
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

}

void task_reduce_subtract()
{

	//cout << "task_reduce_subtract" << endl;

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

	// if (GV(reduce) + 1 > NUM_DIGITS) {
	// 	GV(next_task_print) = TASK_REF(task_reduce_quotient);
	// } else { 
	// 	GV(next_task_print) = GV(next_task);
	// }
	// TRANSITION_TO(task_print_product);
}

void task_commit() {

}


int main() {

    camel.flag = CKPT_1_FLG;
    safe = &(camel.buf1);
    unsafe = &(camel.buf2);
    camel_init();

	while (1) {

		TASK(task_init);

		while (1) {

			if (MGV(check) == 0) {

				TASK(task_pad);

			}

			if (MGV(check) == 2) {

				TASK(task_exp);

			}

			if (MGV(check) == 0) {

				TASK(task_mult_block);

			} else if (MGV(check) == 1) {
				
				TASK(task_square_base);

			}

			TASK(task_mult_mod);

			do {

				TASK(task_mult);

			} while (MGV(digit) < NUM_DIGITS * 2);

			TASK(task_reduce_digits);

			if (MGV(check) == 0)
				break;

			TASK(task_reduce_normalizable);

			if (MGV(check) == 1) {

				TASK(task_reduce_normalize);

			}

			if (MGV(check) == 2) {

				TASK(task_reduce_n_divisor);

				do {

					TASK(task_reduce_quotient);

					TASK(task_reduce_multiply);

					TASK(task_reduce_compare);

					if (MGV(check) == 0) {

						TASK(task_reduce_add);

					}

					TASK(task_reduce_subtract);

				} while(MGV(reduce) + 1 > NUM_DIGITS);
			}

			if (MGV(check_final) == 0) {

				TASK(task_mult_block_get_result);

			} else if (MGV(check_final) == 1) {

				TASK(task_square_base_get_result);

			}
		}
	}

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
