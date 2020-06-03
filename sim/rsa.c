#include <stdint.h>
#include <stdbool.h>
#include <stdlib.h>
#include <math.h>
#include <string.h>
//#include <iostream>
#include <stdio.h>

//using namespace std;


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

static const unsigned char PLAINTEXT[] = ".RRRSSSAAA.";

#define NUM_PLAINTEXT_BLOCKS (sizeof(PLAINTEXT) / (NUM_DIGITS - NUM_PAD_DIGITS) + 1)
#define CYPHERTEXT_SIZE (NUM_PLAINTEXT_BLOCKS * NUM_DIGITS)

uint16_t tmp_stack_crc;
uint16_t tmp_stack_buf_crc;

// Globals
typedef struct camel_global_t{

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
	unsigned count;

} camel_global_t;

typedef struct camel_buffer_t
{
  int reg_file[10];  // 11 16-bit registers: 30 bytes
  camel_global_t globals;
  uint16_t stack_and_buf_crc;                         			// CRC of (stack) | (register file) | (globals)
} camel_buffer_t;

struct Camel
{
  uint16_t flag;
  camel_buffer_t buf1;
  camel_buffer_t buf2;
} camel;

camel_buffer_t *safe = &(camel.buf2);
camel_buffer_t *unsafe = &(camel.buf1);

#define GV(x) unsafe->globals.x
#define MGV(x) safe->globals.x
int global_count = 0;

void task_done() {
	 
	//cout << "end" << endl;
	//cout << GV(count) << endl;
	//printf("The count is: %d\n", GV(count));
	printf("The count is: %d\n", global_count);


	exit(0);
}


void task_init()
{

	printf("task: %s\n", "task_init");
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
	GV(count) = 0;
	//TRANSITION_TO(task_pad);
}

void task_pad()
{

	printf("task: %s\n", "task_pad");

	//cout << "task_pad" << endl;
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

	//GV(exponent_next) = GV(exponent);
	GV(exponent) = pubkey.e;

	GV(block_offset) += NUM_DIGITS - NUM_PAD_DIGITS;

	GV(check) = 2;
	//TRANSITION_TO(task_exp);
}

void task_exp()
{

	printf("task: %s\n", "task_exp");
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
	printf("task: %s\n", "task_mult_block_Get_result");

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
	printf("task: %s\n", "task_square_base_get_Result");

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
	printf("task: %s\n", "task_mult_mod");


	GV(digit) = 0;
	GV(carry) = 0;

	//TRANSITION_TO(task_mult);
}

void task_mult()
{
	//cout << "task_mult" << endl;

	printf("task: %s\n", "task_mult");
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

	printf("num:%d\n ", GV(digit));

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

	printf("task: %s\n", "task_reduce_digits");

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
	printf("task: %s\n", "task_reduce_normailzable");

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
	printf("task: %s\n", "task_reduce_normalize");
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

	//cout << "task_commit" << endl;
	//MGV(count)++;
	global_count++;
}

void commit() {

	if (global_count%2 == 1) {

		safe = &(camel.buf2);																																								\
		unsafe = &(camel.buf1);

	} else {

		safe = &(camel.buf1);																																								\
		unsafe = &(camel.buf2);

	}
}


int main() {

	while (1) {

		task_init();
		commit();
		memcpy(&(unsafe->globals), &(safe->globals), sizeof(camel_global_t));
		task_commit();


		while (1) {


			if (GV(check) == 0) {

				//memcpy(&(unsafe->globals), &(safe->globals), sizeof(camel_global_t));
				task_pad();
				commit();
				memcpy(&(unsafe->globals), &(safe->globals), sizeof(camel_global_t));
				task_commit();

			}

			if (GV(check) == 2) {

				//memcpy(&(unsafe->globals), &(safe->globals), sizeof(camel_global_t));
				task_exp();
				commit();
				memcpy(&(unsafe->globals), &(safe->globals), sizeof(camel_global_t));
				task_commit();

			}

			// if (MGV(check) == 0) {

			// 	memcpy(&(unsafe->globals), &(safe->globals), sizeof(camel_global_t));
			// 	task_mult_block();
			// 	commit();
			// 	task_commit();

			// } else if (MGV(check) == 1) {
				
			// 	memcpy(&(unsafe->globals), &(safe->globals), sizeof(camel_global_t));
			// 	task_square_base();
			// 	commit();
			// 	task_commit();
			// }

			//memcpy(&(unsafe->globals), &(safe->globals), sizeof(camel_global_t));
			task_mult_mod();
			commit();
			memcpy(&(unsafe->globals), &(safe->globals), sizeof(camel_global_t));
			task_commit();
			//printf("num111%d\n:", MGV(digit));


			do {

				// memcpy(&(unsafe->globals), &(safe->globals), sizeof(camel_global_t));
				task_mult();
				commit();
				memcpy(&(unsafe->globals), &(safe->globals), sizeof(camel_global_t));
				task_commit();

			} while (GV(digit) < NUM_DIGITS * 2);

			//memcpy(&(unsafe->globals), &(safe->globals), sizeof(camel_global_t));
			task_reduce_digits();
			commit();
			memcpy(&(unsafe->globals), &(safe->globals), sizeof(camel_global_t));
			task_commit();

			if (GV(check) == 0)
				break;

			//memcpy(&(unsafe->globals), &(safe->globals), sizeof(camel_global_t));
			task_reduce_normalizable();
			commit();
			memcpy(&(unsafe->globals), &(safe->globals), sizeof(camel_global_t));
			task_commit();

			if (GV(check) == 1) {

				//memcpy(&(unsafe->globals), &(safe->globals), sizeof(camel_global_t));
				task_reduce_normalize();
				commit();
				memcpy(&(unsafe->globals), &(safe->globals), sizeof(camel_global_t));
				task_commit();
			}

			if (GV(check) == 2) {

				//memcpy(&(unsafe->globals), &(safe->globals), sizeof(camel_global_t));
				task_reduce_n_divisor();
				commit();
				memcpy(&(unsafe->globals), &(safe->globals), sizeof(camel_global_t));
				task_commit();

				do {

					//memcpy(&(unsafe->globals), &(safe->globals), sizeof(camel_global_t));
					task_reduce_quotient();
					commit();
					memcpy(&(unsafe->globals), &(safe->globals), sizeof(camel_global_t));
					task_commit();

					//memcpy(&(unsafe->globals), &(safe->globals), sizeof(camel_global_t));
					task_reduce_multiply();
					commit();
					memcpy(&(unsafe->globals), &(safe->globals), sizeof(camel_global_t));
					task_commit();


					//memcpy(&(unsafe->globals), &(safe->globals), sizeof(camel_global_t));
					task_reduce_compare();
					commit();
					memcpy(&(unsafe->globals), &(safe->globals), sizeof(camel_global_t));
					task_commit();

					if (MGV(check) == 0) {

						//memcpy(&(unsafe->globals), &(safe->globals), sizeof(camel_global_t));
						task_reduce_add();
						commit();
						memcpy(&(unsafe->globals), &(safe->globals), sizeof(camel_global_t));
						task_commit();

					}

					//memcpy(&(unsafe->globals), &(safe->globals), sizeof(camel_global_t));
					task_reduce_subtract();
					commit();
					memcpy(&(unsafe->globals), &(safe->globals), sizeof(camel_global_t));
					task_commit();

				} while(GV(reduce) + 1 > NUM_DIGITS);
			}

			if (GV(check_final) == 0) {

				//memcpy(&(unsafe->globals), &(safe->globals), sizeof(camel_global_t));
				task_mult_block_get_result();
				commit();
				memcpy(&(unsafe->globals), &(safe->globals), sizeof(camel_global_t));
				task_commit();

			} else if (GV(check_final) == 1) {

				//memcpy(&(unsafe->globals), &(safe->globals), sizeof(camel_global_t));
				task_square_base_get_result();
				commit();
				memcpy(&(unsafe->globals), &(safe->globals), sizeof(camel_global_t));
				task_commit();

			}
		}
	}

}

 