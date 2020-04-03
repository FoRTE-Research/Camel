#include <msp430.h>
#include <stdint.h>
#include <stdbool.h>
#include <stdlib.h>

#include "../checkpoint/camel_ckpt_defines.h"

// Number of samples to discard before recording training set
#define NUM_WARMUP_SAMPLES 3

#define ACCEL_WINDOW_SIZE 3
#define MODEL_SIZE 16
#define SAMPLE_NOISE_FLOOR 10 // TODO: made up value

// Number of classifications to complete in one experiment
#define SAMPLES_TO_COLLECT 128

typedef struct {
     int8_t x;
     int8_t y;
     int8_t z;
 } threeAxis_t_8;

typedef threeAxis_t_8 accelReading;
typedef accelReading accelWindow[ACCEL_WINDOW_SIZE];

typedef struct {
	unsigned meanmag;
	unsigned stddevmag;
} features_t;

typedef enum {
	CLASS_STATIONARY,
	CLASS_MOVING,
} class_t;

typedef enum {
	// MODE_IDLE = (BIT(PIN_AUX_1) | BIT(PIN_AUX_2)),
	//  MODE_TRAIN_STATIONARY = BIT(PIN_AUX_1),
	//  MODE_TRAIN_MOVING = BIT(PIN_AUX_2),
	MODE_IDLE = 3,
	MODE_TRAIN_STATIONARY = 2,
	MODE_TRAIN_MOVING = 1,
	MODE_RECOGNIZE = 0, // default
} run_mode_t;

void task_init();
void task_selectMode();
void task_resetStats();
void task_sample();
void task_transform();
void task_featurize();
void task_classify();
void task_stats();
void task_warmup();
void task_train();
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
	uint16_t pinState;
	unsigned discardedSamplesCount;
	class_t class;
	unsigned totalCount;
	unsigned movingCount;
	unsigned stationaryCount;
	accelReading window[ACCEL_WINDOW_SIZE];
	features_t features;
	features_t model_stationary[MODEL_SIZE];
	features_t model_moving[MODEL_SIZE];
	unsigned trainingSetSize;
	unsigned samplesInWindow;
	run_mode_t mode;
	unsigned seed;
	unsigned count;
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

unsigned ACCEL_singleSample_(threeAxis_t_8* result, unsigned seed){
	result->x = (seed*17)%85;
	result->y = (seed*17*17)%85;
	result->z = (seed*17*17*17)%85;
	++seed;

	return seed;
}

void task_init()
{
	GV(pinState) = MODE_IDLE;
	GV(count) = 0;
	GV(seed) = 1;
	//TRANSITION_TO(task_selectMode);
}

#if ALL
    #define prepare_task_selectMode() memcpy(&(unsafe->globals), &(safe->globals), sizeof(camel_global_t))
#elif READS
    #define prepare_task_selectMode() cps(count); cps(pinState);
#elif WRITES
	#define prepare_task_selectMode() cps(count); cps(pinState); cps(discardedSamplesCount); cps(mode); cps(class); cps(samplesInWindow)
#elif IDEM
    #define prepare_task_selectMode() cps(count); cps(pinState)
#elif NONE
    #define prepare_task_selectMode() 
#else
    #error type of system not defined
#endif
#define writes_task_selectMode() cps(count); cps(pinState); cps(discardedSamplesCount); cps(mode); cps(class); cps(samplesInWindow)

void task_selectMode()
{
	uint16_t pin_state=1;
	++GV(count);

	if(GV(count) >= 3) pin_state=2;
	if(GV(count)>=5) pin_state=0;
	if (GV(count) >= 7) {

		task_done();
		//while(1);
		//TRANSITION_TO(task_init);
	}
	run_mode_t mode;
	class_t class;

	// uint16_t pin_state = GPIO(PORT_AUX, IN) & (BIT(PIN_AUX_1) | BIT(PIN_AUX_2));

	// Don't re-launch training after finishing training
	if ((pin_state == MODE_TRAIN_STATIONARY ||
				pin_state == MODE_TRAIN_MOVING) &&
			pin_state == GV(pinState)) {
		pin_state = MODE_IDLE;
	} else {
		GV(pinState) = pin_state;
	}

	switch(pin_state) {
		case MODE_TRAIN_STATIONARY:		
			GV(discardedSamplesCount) = 0;
			GV(mode) = MODE_TRAIN_STATIONARY;
			GV(class) = CLASS_STATIONARY;
			GV(samplesInWindow) = 0;

			//TRANSITION_TO(task_warmup);
			break;

		case MODE_TRAIN_MOVING:
			GV(discardedSamplesCount) = 0;
			GV(mode) = MODE_TRAIN_MOVING;
			GV(class) = CLASS_MOVING;
			GV(samplesInWindow) = 0;

			//TRANSITION_TO(task_warmup);
			break;

		case MODE_RECOGNIZE:
			GV(mode) = MODE_RECOGNIZE;

			//TRANSITION_TO(task_resetStats);
			break;

		default:
			break;
			//TRANSITION_TO(task_idle);
	}
}

#if ALL
    #define prepare_task_resetStats() memcpy(&(unsafe->globals), &(safe->globals), sizeof(camel_global_t))
#elif READS
    #define prepare_task_resetStats() 
#elif WRITES
	#define prepare_task_resetStats() cps(movingCount); cps(stationaryCount); cps(totalCount); cps(samplesInWindow)
#elif IDEM
    #define prepare_task_resetStats() 
#elif NONE
    #define prepare_task_resetStats() 
#else
    #error type of system not defined
#endif
#define writes_task_resetStats() cps(movingCount); cps(stationaryCount); cps(totalCount); cps(samplesInWindow)

void task_resetStats()
{
	// NOTE: could roll this into selectMode task, but no compelling reason
	// NOTE: not combined into one struct because not all code paths use both
	GV(movingCount) = 0;
	GV(stationaryCount) = 0;
	GV(totalCount) = 0;

	GV(samplesInWindow) = 0;

	//TRANSITION_TO(task_sample);
}

#if ALL
    #define prepare_task_sample() memcpy(&(unsafe->globals), &(safe->globals), sizeof(camel_global_t))
#elif READS
    #define prepare_task_sample() cps(samplesInWindow); cps(seed)
#elif WRITES
	#define prepare_task_sample() cps(seed); cpas_s(window, samplesInWindow); cps(samplesInWindow)
#elif IDEM
    #define prepare_task_sample() cps(seed); cps(samplesInWindow)
#elif NONE
    #define prepare_task_sample() 
#else
    #error type of system not defined
#endif
#define writes_task_sample() cps(seed); cpas_s(window, samplesInWindow); cps(samplesInWindow)

void task_sample()
{
	while (GV(samplesInWindow) < ACCEL_WINDOW_SIZE){

		accelReading sample;
		GV(seed) = ACCEL_singleSample_(&sample, GV(seed));
		GV(window)[GV(samplesInWindow)] = sample;
		++GV(samplesInWindow);

	}

	GV(samplesInWindow) = 0;
	//TRANSITION_TO(task_transform);

	// accelReading sample;
	// ACCEL_singleSample_(&sample);
	// GV(window, _global_samplesInWindow) = sample;
	// ++GV(samplesInWindow);

	// if (GV(samplesInWindow) < ACCEL_WINDOW_SIZE) {
	// 	TRANSITION_TO(task_sample);
	// } else {
	// 	GV(samplesInWindow) = 0;
	// 	TRANSITION_TO(task_transform);
	// }
}

#if ALL
    #define prepare_task_transform() memcpy(&(unsafe->globals), &(safe->globals), sizeof(camel_global_t))
#elif READS
    #define prepare_task_transform() cpa(window, sizeof(accelReading) * ACCEL_WINDOW_SIZE)
#elif WRITES
	#define prepare_task_transform() cpa(window, sizeof(accelReading) * ACCEL_WINDOW_SIZE)
#elif IDEM
    #define prepare_task_transform() cpa(window, sizeof(accelReading) * ACCEL_WINDOW_SIZE)
#elif NONE
    #define prepare_task_transform() 
#else
    #error type of system not defined
#endif
#define writes_task_transform() cpa(window, sizeof(accelReading) * ACCEL_WINDOW_SIZE)


//edit this task to meet our system's requirements
void task_transform()
{
	//unsigned i;

	accelReading *sample;
	accelReading transformedSample;

	for (unsigned i = 0; i < ACCEL_WINDOW_SIZE; i++) {
		if (GV(window)[i].x < SAMPLE_NOISE_FLOOR ||
				GV(window)[i].y < SAMPLE_NOISE_FLOOR ||
				GV(window)[i].z < SAMPLE_NOISE_FLOOR) {

			GV(window)[i].x = (GV(window)[i].x > SAMPLE_NOISE_FLOOR)
				? GV(window)[i].x : 0; 
			GV(window)[i].y = (GV(window)[i].y > SAMPLE_NOISE_FLOOR)
				? GV(window)[i].y : 0;
			GV(window)[i].z = (GV(window)[i].z > SAMPLE_NOISE_FLOOR)
				? GV(window)[i].z : 0;
		}
	}
	//TRANSITION_TO(task_featurize);
}

#if ALL
    #define prepare_task_featurize() memcpy(&(unsafe->globals), &(safe->globals), sizeof(camel_global_t))
#elif READS
    #define prepare_task_featurize() cpa(window, sizeof(accelReading) * ACCEL_WINDOW_SIZE); cps(mode)
#elif WRITES
	#define prepare_task_featurize() cps_s(features)
#elif IDEM
    #define prepare_task_featurize() 
#elif NONE
    #define prepare_task_featurize() 
#else
    #error type of system not defined
#endif
#define writes_task_featurize() cps_s(features)

void task_featurize()
{
	accelReading mean, stddev;
	mean.x = mean.y = mean.z = 0;
	stddev.x = stddev.y = stddev.z = 0;
	features_t features;

	int i;
	for (i = 0; i < ACCEL_WINDOW_SIZE; i++) {

		mean.x += GV(window)[i].x;
		mean.y += GV(window)[i].y;
		mean.z += GV(window)[i].z;
	}
	mean.x >>= 2;
	mean.y >>= 2;
	mean.z >>= 2;

	for (i = 0; i < ACCEL_WINDOW_SIZE; i++) {
		stddev.x += GV(window)[i].x > mean.x ? GV(window)[i].x - mean.x
			: mean.x - GV(window)[i].x;
		stddev.y += GV(window)[i].y > mean.y ? GV(window)[i].y - mean.y
			: mean.y - GV(window)[i].y;
		stddev.z += GV(window)[i].z > mean.z ? GV(window)[i].z - mean.z
			: mean.z - GV(window)[i].z;
	}
	stddev.x >>= 2;
	stddev.y >>= 2;
	stddev.z >>= 2;

	unsigned meanmag = mean.x*mean.x + mean.y*mean.y + mean.z*mean.z;
	unsigned stddevmag = stddev.x*stddev.x + stddev.y*stddev.y + stddev.z*stddev.z;
	features.meanmag   = sqrt16(meanmag);
	features.stddevmag = sqrt16(stddevmag);

	switch (GV(mode)) {
		case MODE_TRAIN_STATIONARY:
		case MODE_TRAIN_MOVING:
			//GV(features) = features;
			//TRANSITION_TO(task_train);
			//break;
		case MODE_RECOGNIZE:
			GV(features) = features;
			//TRANSITION_TO(task_classify);
			break;
		default:
			// TODO: abort
			break;
	}
}

#if ALL
    #define prepare_task_classify() memcpy(&(unsafe->globals), &(safe->globals), sizeof(camel_global_t))
#elif READS
    #define prepare_task_classify() cps_s(features); cpa(model_stationary, sizeof(features_t) * MODEL_SIZE); cpa(model_moving, sizeof(features_t) * MODEL_SIZE)
#elif WRITES
	#define prepare_task_classify() cps(class)
#elif IDEM
    #define prepare_task_classify() 
#elif NONE
    #define prepare_task_classify() 
#else
    #error type of system not defined
#endif
#define writes_task_classify() cps(class)

void task_classify() {
	int move_less_error = 0;
	int stat_less_error = 0;
	int i;
	class_t class;
	long int meanmag;
	long int stddevmag;

	meanmag = GV(features).meanmag;
	stddevmag = GV(features).stddevmag;

	for (i = 0; i < MODEL_SIZE; ++i) {
		long int stat_mean_err = (GV(model_stationary)[i].meanmag > meanmag)
			? (GV(model_stationary)[i].meanmag - meanmag)
			: (meanmag - GV(model_stationary)[i].meanmag);

		long int stat_sd_err = (GV(model_stationary)[i].stddevmag > stddevmag)
			? (GV(model_stationary)[i].stddevmag - stddevmag)
			: (stddevmag - GV(model_stationary)[i].stddevmag);

		long int move_mean_err = (GV(model_moving)[i].meanmag > meanmag)
			? (GV(model_moving)[i].meanmag - meanmag)
			: (meanmag - GV(model_moving)[i].meanmag);

		long int move_sd_err = (GV(model_moving)[i].stddevmag > stddevmag)
			? (GV(model_moving)[i].stddevmag - stddevmag)
			: (stddevmag - GV(model_moving)[i].stddevmag);

		if (move_mean_err < stat_mean_err) {
			move_less_error++;
		} else {
			stat_less_error++;
		}

		if (move_sd_err < stat_sd_err) {
			move_less_error++;
		} else {
			stat_less_error++;
		}
	}

	GV(class) = (move_less_error > stat_less_error) ? CLASS_MOVING : CLASS_STATIONARY;


	//TRANSITION_TO(task_stats);
}

#if ALL
    #define prepare_task_stats() memcpy(&(unsafe->globals), &(safe->globals), sizeof(camel_global_t))
#elif READS
    #define prepare_task_stats() cps(totalCount); cps(class); cps(movingCount); cps(stationaryCount)
#elif WRITES
	#define prepare_task_stats() cps(totalCount); cps(movingCount); cps(stationaryCount); 
#elif IDEM
    #define prepare_task_stats() cps(totalCount); cps(movingCount); cps(stationaryCount);
#elif NONE
    #define prepare_task_stats() 
#else
    #error type of system not defined
#endif
#define writes_task_stats() cps(totalCount); cps(movingCount); cps(stationaryCount);

void task_stats()
{
	unsigned movingCount = 0, stationaryCount = 0;

	++GV(totalCount);

	switch (GV(class)) {
		case CLASS_MOVING:

			++GV(movingCount);
			break;
		case CLASS_STATIONARY:

			++GV(stationaryCount);
			break;
	}

	if (GV(totalCount) == SAMPLES_TO_COLLECT) {

		unsigned resultStationaryPct = GV(stationaryCount) * 100 / GV(totalCount);
		unsigned resultMovingPct = GV(movingCount) * 100 / GV(totalCount);

		unsigned sum = GV(stationaryCount) + GV(movingCount);

		//TRANSITION_TO(task_idle);
	} else {
		//TRANSITION_TO(task_sample);
	}
}

#if ALL
    #define prepare_task_warmup() memcpy(&(unsafe->globals), &(safe->globals), sizeof(camel_global_t))
#elif READS
    #define prepare_task_warmup() cps(discardedSamplesCount); cps(seed)
#elif WRITES
	#define prepare_task_warmup() cps(seed); cps(discardedSamplesCount); cps(trainingSetSize)
#elif IDEM
    #define prepare_task_warmup() cps(seed); cps(discardedSamplesCount)
#elif NONE
    #define prepare_task_warmup() 
#else
    #error type of system not defined
#endif
#define writes_task_warmup() cps(seed); cps(discardedSamplesCount); cps(trainingSetSize)

void task_warmup()
{

	// to remove transition to

	while (GV(discardedSamplesCount) < NUM_WARMUP_SAMPLES) {

		threeAxis_t_8 sample;
		GV(seed) = ACCEL_singleSample_(&sample, GV(seed));
		++GV(discardedSamplesCount);

	}

	GV(trainingSetSize) = 0;
	//TRANSITION_TO(task_sample);

	// threeAxis_t_8 sample;

	// if (GV(discardedSamplesCount) < NUM_WARMUP_SAMPLES) {

	// 	ACCEL_singleSample_(&sample);
	// 	++GV(discardedSamplesCount);

	// 	TRANSITION_TO(task_warmup);
	// } else {
	// 	GV(trainingSetSize) = 0;
	// 	TRANSITION_TO(task_sample);
	// }
}

#if ALL
    #define prepare_task_train() memcpy(&(unsafe->globals), &(safe->globals), sizeof(camel_global_t))
#elif READS
    #define prepare_task_train() cps(class); cps(trainingSetSize); cps_s(features);
#elif WRITES
	#define prepare_task_train() cpas_s(model_stationary, trainingSetSize); cpas_s(model_moving, trainingSetSize); cps(trainingSetSize)
#elif IDEM
    #define prepare_task_train() cps(trainingSetSize)
#elif NONE
    #define prepare_task_train() 
#else
    #error type of system not defined
#endif
#define writes_task_train() cpas_s(model_stationary, trainingSetSize); cpas_s(model_moving, trainingSetSize); cps(trainingSetSize)

void task_train()
{
	unsigned trainingSetSize;
	unsigned class;

	switch (GV(class)) {
		case CLASS_STATIONARY:
			GV(model_stationary)[GV(trainingSetSize)] = GV(features);
			break;
		case CLASS_MOVING:
			GV(model_moving)[GV(trainingSetSize)] = GV(features);
			break;
	}

	++GV(trainingSetSize);

	if (GV(trainingSetSize) < MODEL_SIZE) {
		//TRANSITION_TO(task_sample);
	} else {

		//TRANSITION_TO(task_idle);
	}
}

void task_done() {

	exit(0);
	//TRANSITION_TO(task_selectMode);
}

void task_commit() {

}

int main() {
	
    camel.flag = CKPT_1_FLG;
    safe = &(camel.buf1);
    unsafe = &(camel.buf2);
	camel_init();

	task_init();
	//commit();
	//memcpy(&(unsafe->globals), &(safe->globals), sizeof(camel_global_t))
	//task_commit();

	while (MGV(count) < 7) {

		//prepare_task_selectMode();
		task_selectMode();
		//commit();
		//writes_task_selectMode();
		//task_commit();

		if (MGV(mode) == 2 || MGV(mode) == 1){

			//prepare_task_warmup();
			task_warmup();
			//commit();
			//writes_task_warmup();
			//task_commit();

		} else if (MGV(mode) == 0) {

			//prepare_task_resetStats();
			task_resetStats();
			//commit();
			//writes_task_resetStats();
			//task_commit();

		} else {

			break;
		}

		while (1) {

			//prepare_task_sample();
			task_sample();
			//commit();
			//writes_task_sample();
			//task_commit();

			//prepare_task_transform();
			task_transform();
			//commit();
			//writes_task_transform();
			//task_commit();

			//prepare_task_featurize();
			task_featurize();
			//commit();
			//writes_task_featurize();
			//task_commit();

			if (MGV(mode) == 2 || MGV(mode) == 1){

				//prepare_task_train();
				task_train();
				//commit();
				//writes_task_train();
				//task_commit();

				if (GV(trainingSetSize) >= MODEL_SIZE)
					break;

			} else if (MGV(mode) == 0) {

				//prepare_task_classify();
				task_classify();
				//commit();
				//writes_task_classify();
				//task_commit();

				//prepare_task_stats();
				task_stats();
				//commit();
				//writes_task_stats();
				//task_commit();

				if (GV(totalCount) == SAMPLES_TO_COLLECT)
					break;

			}
		}

		//task_idle(); //this is where task idle is called
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
