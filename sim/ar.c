#include <stdint.h>
#include <stdbool.h>
#include <stdlib.h>
#include <math.h>
#include <string.h>
//#include <iostream>
#include <stdio.h>

//using namespace std;


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


uint16_t tmp_stack_crc;
uint16_t tmp_stack_buf_crc;

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

    unsigned count1;
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
	//printf("The count is: %d\n", GV(count1));
	printf("The count is: %d\n", global_count);


	exit(0);
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
        	GV(mode) = MODE_IDLE;
			break;
			//TRANSITION_TO(task_idle);
	}
}


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


void task_sample()
{

	accelReading sample;
	ACCEL_singleSample_(&sample, GV(seed));
	GV(window)[GV(samplesInWindow)] = sample;
	++GV(samplesInWindow);


	// while (GV(samplesInWindow) < ACCEL_WINDOW_SIZE){

	// 	accelReading sample;
	// 	GV(seed) = ACCEL_singleSample_(&sample, GV(seed));
	// 	GV(window)[GV(samplesInWindow)] = sample;
	// 	++GV(samplesInWindow);

	// }

	// GV(samplesInWindow) = 0;
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
//edit this task to meet our system's requirements
void task_transform()
{
    GV(samplesInWindow) = 0;

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
	features.meanmag   = sqrt(meanmag);
	features.stddevmag = sqrt(stddevmag);

	switch (GV(mode)) {
		case MODE_TRAIN_STATIONARY:
		case MODE_TRAIN_MOVING:
			GV(features) = features;
			//TRANSITION_TO(task_train);
			break;
		case MODE_RECOGNIZE:
			GV(features) = features;
			//TRANSITION_TO(task_classify);
			break;
		default:
			// TODO: abort
			break;
	}
}

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
	} 
	// else {
	// 	//TRANSITION_TO(task_sample);
	// }
}

void task_warmup()
{


    threeAxis_t_8 sample; 

    GV(seed) = ACCEL_singleSample_(&sample, GV(seed));
    ++GV(discardedSamplesCount);

    if (GV(discardedSamplesCount) == NUM_WARMUP_SAMPLES){
        GV(trainingSetSize) = 0;
    }
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

	// if (GV(trainingSetSize) < MODEL_SIZE) {
	// 	//TRANSITION_TO(task_sample);
	// } else {

	// 	//TRANSITION_TO(task_idle);
	// }
}

void task_commit() {

	//cout << "task_commit" << endl;
	//GV(count1)++;
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
	
    // camel.flag = CKPT_1_FLG;
    // safe = &(camel.buf1);
    // unsafe = &(camel.buf2);
	// camel_init();

	task_init();
	//commit();
	//memcpy(&(unsafe->globals), &(safe->globals), sizeof(camel_global_t));
	task_commit();

	while (1) {

		//prepare_task_selectMode();
		task_selectMode();
		//commit();
		//writes_task_selectMode();
		task_commit();

		if (GV(mode) == MODE_TRAIN_STATIONARY || GV(mode) == MODE_TRAIN_MOVING){


            while (GV(discardedSamplesCount) < NUM_WARMUP_SAMPLES) {

                //prepare_task_warmup();
                task_warmup();
                //commit();
                //writes_task_warmup();
                task_commit();

            }

		} else if (GV(mode) ==  MODE_RECOGNIZE) {

			//prepare_task_resetStats();
			task_resetStats();
			//commit();
			//writes_task_resetStats();
			task_commit();

		} else if (GV(mode) == MODE_IDLE) {

			continue;
		}

		while (1) {


            while (GV(samplesInWindow) < ACCEL_WINDOW_SIZE){

                //prepare_task_sample();
                task_sample();
               	//commit();
                //writes_task_sample();
                task_commit();


            }

			//prepare_task_transform();
			task_transform();
			//commit();
			//writes_task_transform();
			task_commit();

			//prepare_task_featurize();
			task_featurize();
			//commit();
			//writes_task_featurize();
			task_commit();

			if (GV(mode) == MODE_TRAIN_STATIONARY || GV(mode) == MODE_TRAIN_MOVING){

				//prepare_task_train();
				task_train();
				//commit();
				//writes_task_train();
				task_commit();

				if (GV(trainingSetSize) >= MODEL_SIZE)
					break;

			} else if (GV(mode) ==  MODE_RECOGNIZE) {

				//prepare_task_classify();
				task_classify();
				//commit();
				//writes_task_classify();
				task_commit();

				//prepare_task_stats();
				task_stats();
				//commit();
				//writes_task_stats();
				task_commit();

				if (GV(totalCount) == SAMPLES_TO_COLLECT)
					break;

			}
		}

		//task_idle(); //this is where task_idle is called
	}
}

