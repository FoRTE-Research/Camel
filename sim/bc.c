#include <stdint.h>
#include <stdbool.h>
#include <stdlib.h>
#include <math.h>
#include <string.h>
#include <stdio.h>

//using namespace std;
#define SEED 4L
#define ITER 100
#define CHAR_BIT 8

uint16_t tmp_stack_crc;
uint16_t tmp_stack_buf_crc;

typedef struct camel_global_t
{

	unsigned n_0;
	unsigned n_1;
	unsigned n_2;
	unsigned n_3;
	unsigned n_4;
	unsigned n_5;
	unsigned n_6;
	unsigned func;
	uint32_t seed;
	unsigned iter;

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

int global_count = 0;
int c = 0;

void task_done() {
	 
	//cout << "end" << endl;
	//cout << GV(count) << endl;

	printf("The count is: %d\n", global_count);

	exit(0);
}


static char bits[256] =
{
	0, 1, 1, 2, 1, 2, 2, 3, 1, 2, 2, 3, 2, 3, 3, 4,  /* 0   - 15  */
	1, 2, 2, 3, 2, 3, 3, 4, 2, 3, 3, 4, 3, 4, 4, 5,  /* 16  - 31  */
	1, 2, 2, 3, 2, 3, 3, 4, 2, 3, 3, 4, 3, 4, 4, 5,  /* 32  - 47  */
	2, 3, 3, 4, 3, 4, 4, 5, 3, 4, 4, 5, 4, 5, 5, 6,  /* 48  - 63  */
	1, 2, 2, 3, 2, 3, 3, 4, 2, 3, 3, 4, 3, 4, 4, 5,  /* 64  - 79  */
	2, 3, 3, 4, 3, 4, 4, 5, 3, 4, 4, 5, 4, 5, 5, 6,  /* 80  - 95  */
	2, 3, 3, 4, 3, 4, 4, 5, 3, 4, 4, 5, 4, 5, 5, 6,  /* 96  - 111 */
	3, 4, 4, 5, 4, 5, 5, 6, 4, 5, 5, 6, 5, 6, 6, 7,  /* 112 - 127 */
	1, 2, 2, 3, 2, 3, 3, 4, 2, 3, 3, 4, 3, 4, 4, 5,  /* 128 - 143 */
	2, 3, 3, 4, 3, 4, 4, 5, 3, 4, 4, 5, 4, 5, 5, 6,  /* 144 - 159 */
	2, 3, 3, 4, 3, 4, 4, 5, 3, 4, 4, 5, 4, 5, 5, 6,  /* 160 - 175 */
	3, 4, 4, 5, 4, 5, 5, 6, 4, 5, 5, 6, 5, 6, 6, 7,  /* 176 - 191 */
	2, 3, 3, 4, 3, 4, 4, 5, 3, 4, 4, 5, 4, 5, 5, 6,  /* 192 - 207 */
	3, 4, 4, 5, 4, 5, 5, 6, 4, 5, 5, 6, 5, 6, 6, 7,  /* 208 - 223 */
	3, 4, 4, 5, 4, 5, 5, 6, 4, 5, 5, 6, 5, 6, 6, 7,  /* 224 - 239 */
	4, 5, 5, 6, 5, 6, 6, 7, 5, 6, 6, 7, 6, 7, 7, 8   /* 240 - 255 */
};

void task_init() {

	GV(func) = 0;
	GV(n_0) = 0;
	GV(n_1) = 0;
	GV(n_2) = 0;
	GV(n_3) = 0;
	GV(n_4) = 0;
	GV(n_5) = 0;
	GV(n_6) = 0;

	//TRANSITION_TO(task_select_func);
}

void task_select_func() {

	GV(seed) = (uint32_t)SEED; // for test, seed is always the same
	GV(iter) = 0;
	GV(func)++; 

	// if(GV(func) == 0){
	// 	GV(func)++;
	// 	TRANSITION_TO(task_bit_count);
	// }
	// else if(GV(func) == 1){
	// 	GV(func)++;
	// 	TRANSITION_TO(task_bitcount);
	// }
	// else if(GV(func) == 2){
	// 	GV(func)++;
	// 	TRANSITION_TO(task_ntbl_bitcnt);
	// }
	// else if(GV(func) == 3){
	// 	GV(func)++;
	// 	TRANSITION_TO(task_ntbl_bitcount);
	// }
	// else if(GV(func) == 4){
	// 	GV(func)++;
	// 	TRANSITION_TO(task_BW_btbl_bitcount);
	// }
	// else if(GV(func) == 5){
	// 	GV(func)++;
	// 	TRANSITION_TO(task_AR_btbl_bitcount);
	// }
	// else if(GV(func) == 6){
	// 	GV(func)++;
	// 	TRANSITION_TO(task_bit_shifter);
	// }
	// else{
	// 	TRANSITION_TO(task_end);

	// }
}
void task_bit_count() {
	uint32_t tmp_seed = GV(seed);
	GV(seed) = GV(seed) + 13;
	unsigned temp = 0;
	if(tmp_seed) do 
		temp++;
	while (0 != (tmp_seed = tmp_seed&(tmp_seed-1)));
	GV(n_0) += temp;
	GV(iter)++;

	// if(GV(iter) < ITER){
	// 	TRANSITION_TO(task_bit_count);
	// }
	// else{
	// 	TRANSITION_TO(task_select_func);
	// }
}
void task_bitcount() {
	uint32_t tmp_seed = GV(seed);
	GV(seed) = GV(seed) + 13;
	tmp_seed = ((tmp_seed & 0xAAAAAAAAL) >>  1) + (tmp_seed & 0x55555555L);
	tmp_seed = ((tmp_seed & 0xCCCCCCCCL) >>  2) + (tmp_seed & 0x33333333L);
	tmp_seed = ((tmp_seed & 0xF0F0F0F0L) >>  4) + (tmp_seed & 0x0F0F0F0FL);
	tmp_seed = ((tmp_seed & 0xFF00FF00L) >>  8) + (tmp_seed & 0x00FF00FFL);
	tmp_seed = ((tmp_seed & 0xFFFF0000L) >> 16) + (tmp_seed & 0x0000FFFFL);
	GV(n_1) += (int)tmp_seed;
	GV(iter)++;

	// if(GV(iter) < ITER){
	// 	TRANSITION_TO(task_bitcount);
	// }
	// else{
	// 	TRANSITION_TO(task_select_func);
	// }
}
int recursive_cnt(uint32_t x){
	int cnt = bits[(int)(x & 0x0000000FL)];

	if (0L != (x >>= 4))
		cnt += recursive_cnt(x);

	return cnt;
}
void task_ntbl_bitcnt() {
	GV(n_2) += recursive_cnt(GV(seed));	
	GV(seed) = GV(seed) + 13;
	GV(iter)++;

	// if(GV(iter) < ITER){
	// 	TRANSITION_TO(task_ntbl_bitcnt);
	// }
	// else{
	// 	TRANSITION_TO(task_select_func);
	// }
}
void task_ntbl_bitcount() {
	GV(n_3) += bits[ (int) (GV(seed) & 0x0000000FUL)       ] +
		bits[ (int)((GV(seed) & 0x000000F0UL) >> 4) ] +
		bits[ (int)((GV(seed) & 0x00000F00UL) >> 8) ] +
		bits[ (int)((GV(seed) & 0x0000F000UL) >> 12)] +
		bits[ (int)((GV(seed) & 0x000F0000UL) >> 16)] +
		bits[ (int)((GV(seed) & 0x00F00000UL) >> 20)] +
		bits[ (int)((GV(seed) & 0x0F000000UL) >> 24)] +
		bits[ (int)((GV(seed) & 0xF0000000UL) >> 28)];
	GV(seed) = GV(seed) + 13;
	GV(iter)++;

	// if(GV(iter) < ITER){
	// 	TRANSITION_TO(task_ntbl_bitcount);
	// }
	// else{
	// 	TRANSITION_TO(task_select_func);
	// }
}
void task_BW_btbl_bitcount() {
	union 
	{ 
		unsigned char ch[4]; 
		long y; 
	} U; 

	U.y = GV(seed); 

	GV(n_4) += bits[ U.ch[0] ] + bits[ U.ch[1] ] + 
		bits[ U.ch[3] ] + bits[ U.ch[2] ]; 
	GV(seed) = GV(seed) + 13;
	GV(iter)++;

	// if(GV(iter) < ITER){
	// 	TRANSITION_TO(task_BW_btbl_bitcount);
	// }
	// else{
	// 	TRANSITION_TO(task_select_func);
	// }
}
void task_AR_btbl_bitcount() {
	unsigned char * Ptr = (unsigned char *) &GV(seed) ;
	int Accu ;

	Accu  = bits[ *Ptr++ ];
	Accu += bits[ *Ptr++ ];
	Accu += bits[ *Ptr++ ];
	Accu += bits[ *Ptr ];
	GV(n_5)+= Accu;
	GV(seed) = GV(seed) + 13;
	GV(iter)++;

	// if(GV(iter) < ITER){
	// 	TRANSITION_TO(task_AR_btbl_bitcount);
	// }
	// else{
	// 	TRANSITION_TO(task_select_func);
	// }
}
void task_bit_shifter() {
	int i, nn;
	uint32_t tmp_seed = GV(seed);
	for (i = nn = 0; tmp_seed && (i < (sizeof(long) * CHAR_BIT)); ++i, tmp_seed >>= 1)
		nn += (int)(tmp_seed & 1L);
	GV(n_6) += nn;
	GV(seed) = GV(seed) + 13;

	GV(iter)++;

	// if(GV(iter) < ITER){
	// 	TRANSITION_TO(task_bit_shifter);
	// }
	// else{
	// 	TRANSITION_TO(task_select_func);
	// }
}

void task_commit() {

	//cout << "task_commit" << endl;
	//GV(count)++;
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

	task_init();
	commit();
	memcpy(&(unsafe->globals), &(safe->globals), sizeof(camel_global_t));
	task_commit();

	while (1){

		//memcpy(&(unsafe->globals), &(safe->globals), sizeof(camel_global_t));
		task_select_func();
		commit();
		memcpy(&(unsafe->globals), &(safe->globals), sizeof(camel_global_t));
		task_commit();

		if (GV(func) == 1){

			while (GV(iter) < ITER) {
				
				//memcpy(&(unsafe->globals), &(safe->globals), sizeof(camel_global_t));
				task_bit_count();
				commit();
				memcpy(&(unsafe->globals), &(safe->globals), sizeof(camel_global_t));
				task_commit();

			}

		} else if (GV(func) == 2) {

			while (GV(iter) < ITER) {
				
				//memcpy(&(unsafe->globals), &(safe->globals), sizeof(camel_global_t));
				task_bitcount();
				commit();
				memcpy(&(unsafe->globals), &(safe->globals), sizeof(camel_global_t));
				task_commit();

			}

		} else if (GV(func) == 3) {
			
			while (GV(iter) < ITER) {
				
				//memcpy(&(unsafe->globals), &(safe->globals), sizeof(camel_global_t));
				task_ntbl_bitcnt();
				commit();
				memcpy(&(unsafe->globals), &(safe->globals), sizeof(camel_global_t));
				task_commit();

			}

		} else if (GV(func) == 4) {

			while (GV(iter) < ITER) {
				
				//memcpy(&(unsafe->globals), &(safe->globals), sizeof(camel_global_t));
				task_ntbl_bitcount();
				commit();
				memcpy(&(unsafe->globals), &(safe->globals), sizeof(camel_global_t));
				task_commit();

			}
			
		} else if (GV(func) == 5) {

			while (GV(iter) < ITER) {

				//memcpy(&(unsafe->globals), &(safe->globals), sizeof(camel_global_t));
				task_BW_btbl_bitcount();
				commit();
				memcpy(&(unsafe->globals), &(safe->globals), sizeof(camel_global_t));
				task_commit();

			}
			
		} else if (GV(func) == 6) {

			while (GV(iter) < ITER) {

				//memcpy(&(unsafe->globals), &(safe->globals), sizeof(camel_global_t));
				task_AR_btbl_bitcount();
				commit();
				memcpy(&(unsafe->globals), &(safe->globals), sizeof(camel_global_t));
				task_commit();

			}
			
		} else if (GV(func) == 7) {
			
			while (GV(iter) < ITER) {
				
				//memcpy(&(unsafe->globals), &(safe->globals), sizeof(camel_global_t));
				task_bit_shifter();
				commit();
				memcpy(&(unsafe->globals), &(safe->globals), sizeof(camel_global_t));
				task_commit();

			}

		} else if (GV(func) == 8) {

			task_done();

		} 
	}
}