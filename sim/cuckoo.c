#include <stdint.h>
#include <stdbool.h>
#include <stdlib.h>
#include <math.h>
#include <string.h>
//#include <iostream>
#include <stdio.h>

//using namespace std;

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

  int count;
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


void task_done() {
	 
	//cout << "end" << endl;
	//cout << GV(count) << endl;
	printf("The count is: %d\n", global_count);

	exit(0);
}


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
    GV(count) = 0;
}

#if ALL
    #define prepare_task_generate_key() memcpy(&(unsafe->globals), &(safe->globals), sizeof(camel_global_t)) // copy everything
#elif IDEM
    #define prepare_task_generate_key() cps(key) // copy everything that is present in both read first and writes lists
#elif NONE
    #define prepare_task_generate_key() ;
#else
    #error type of system not defined
#endif
#define writes_task_generate_key() cps(key) // everything written needs to go here
void task_generate_key()
{

    GV(key) = (GV(key) + 1) * 17;
}

#if ALL
    #define prepare_task_calc_indexes() memcpy(&(unsafe->globals), &(safe->globals), sizeof(camel_global_t)) // copy everything
#elif IDEM
    #define prepare_task_calc_indexes() ; // copy everything that is present in both read first and writes lists
#elif NONE
    #define prepare_task_calc_indexes() ;
#else
    #error type of system not defined
#endif
#define writes_task_calc_indexes() cps(fingerprint) // everything written needs to go here
void task_calc_indexes()
{
    GV(fingerprint) = hash_to_fingerprint(GV(key));
}

#if ALL
    #define prepare_task_calc_indexes_index_1() memcpy(&(unsafe->globals), &(safe->globals), sizeof(camel_global_t)) // copy everything
#elif IDEM
    #define prepare_task_calc_indexes_index_1() ; // copy everything that is present in both read first and writes lists
#elif NONE
    #define prepare_task_calc_indexes_index_1() ;
#else
    #error type of system not defined
#endif
#define writes_task_calc_indexes_index_1() cps(index1) // everything written needs to go here
void task_calc_indexes_index_1()
{
    GV(index1) = hash_to_index(GV(key));
}


#if ALL
    #define prepare_task_calc_indexes_index_2() memcpy(&(unsafe->globals), &(safe->globals), sizeof(camel_global_t)) // copy everything
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

#if ALL
    #define prepare_task_add() memcpy(&(unsafe->globals), &(safe->globals), sizeof(camel_global_t)) // copy everything
#elif IDEM
    #define prepare_task_add() cpas(filter,index1); cpas(filter,index2); cps(index1) // copy everything that is present in both read first and writes lists
#elif NONE
    #define prepare_task_add() ;
#else
    #error type of system not defined
#endif
#define writes_task_add() cps(success); cpas(filter, index1); cpas(filter, index2); cps(index1); cps(relocation_count) // everything written needs to go here
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

#if ALL
    #define prepare_task_relocate() memcpy(&(unsafe->globals), &(safe->globals), sizeof(camel_global_t)) // copy everything
#elif IDEM
    #define prepare_task_relocate() cps(fingerprint); cps(index1); cps(relocation_count) // cpa(filter, sizeof(fingerprint_t)*NUM_BUCKETS); opt below; copy everything that is present in both read first and writes lists
#elif NONE
    #define prepare_task_relocate() ;
#else
    #error type of system not defined
#endif
#define writes_task_relocate() cps(success); cps(relocation_count); cps(index1); cps(fingerprint);
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

#if ALL
    #define prepare_task_insert_done() memcpy(&(unsafe->globals), &(safe->globals), sizeof(camel_global_t)) // copy everything
#elif IDEM
    #define prepare_task_insert_done() cps(insert_count); cps(inserted_count) // copy everything that is present in both read first and writes lists
#elif NONE
    #define prepare_task_insert_done() ;
#else
    #error type of system not defined
#endif
#define writes_task_insert_done() cps(insert_count); cps(inserted_count); cps(key)  // everything written needs to go here
void task_insert_done()
{
    ++GV(insert_count);
    GV(inserted_count) += GV(success);

    // if (GV(insert_count) < NUM_INSERTS) {
    // } else {
    //     GV(key) = init_key;
    // }

    if (GV(insert_count) >= NUM_INSERTS) {

        GV(key) = init_key;
        
    } 
}

#if ALL
    #define prepare_task_lookup_search() memcpy(&(unsafe->globals), &(safe->globals), sizeof(camel_global_t)) // copy everything
#elif IDEM
    #define prepare_task_lookup_search() ; // copy everything that is present in both read first and writes lists
#elif NONE
    #define prepare_task_lookup_search() ;
#else
    #error type of system not defined
#endif
#define writes_task_lookup_search() cps(member)  // everything written needs to go here
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

    // if (!GV(member)) {
    // }
}

#if ALL
    #define prepare_task_lookup_done() memcpy(&(unsafe->globals), &(safe->globals), sizeof(camel_global_t)) // copy everything
#elif IDEM
    #define prepare_task_lookup_done() cps(lookup_count); cps(member_count) // copy everything that is present in both read first and writes lists
#elif NONE
    #define prepare_task_lookup_done() ;
#else
    #error type of system not defined
#endif
#define writes_task_lookup_done() cps(lookup_count); cps(member_count)  // everything written needs to go here
void task_lookup_done()
{
    ++GV(lookup_count);

    GV(member_count) += GV(member);

    // if (GV(lookup_count) < NUM_LOOKUPS) {
    // } else {
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


int main(){

    task_init();
    commit();
    memcpy(&(unsafe->globals), &(safe->globals), sizeof(camel_global_t));
    task_commit();

    while(GV(lookup_count) < NUM_LOOKUPS) {

        //memcpy(&(unsafe->globals), &(safe->globals), sizeof(camel_global_t));
        task_generate_key();
        commit();
        memcpy(&(unsafe->globals), &(safe->globals), sizeof(camel_global_t));
        task_commit();

        //memcpy(&(unsafe->globals), &(safe->globals), sizeof(camel_global_t));
        task_calc_indexes();
        commit();
        memcpy(&(unsafe->globals), &(safe->globals), sizeof(camel_global_t));
        task_commit();

        //memcpy(&(unsafe->globals), &(safe->globals), sizeof(camel_global_t));
        task_calc_indexes_index_1();
        commit();
        memcpy(&(unsafe->globals), &(safe->globals), sizeof(camel_global_t));
        task_commit();

        //memcpy(&(unsafe->globals), &(safe->globals), sizeof(camel_global_t));
        task_calc_indexes_index_2();
        commit();
        memcpy(&(unsafe->globals), &(safe->globals), sizeof(camel_global_t));
        task_commit();

        if(GV(insert_count) < NUM_INSERTS) {

            //memcpy(&(unsafe->globals), &(safe->globals), sizeof(camel_global_t));
            task_add();
            commit();
            memcpy(&(unsafe->globals), &(safe->globals), sizeof(camel_global_t));
            task_commit();
            
            if(GV(filter)[GV(index1)] && GV(filter)[GV(index2)]) {
                while(GV(success) == false && (GV(relocation_count) < MAX_RELOCATIONS)) {

                    //memcpy(&(unsafe->globals), &(safe->globals), sizeof(camel_global_t));
                    task_relocate();
                    commit();
                    memcpy(&(unsafe->globals), &(safe->globals), sizeof(camel_global_t));
                    task_commit();
                }
            }

            //memcpy(&(unsafe->globals), &(safe->globals), sizeof(camel_global_t));
            task_insert_done();
            commit();
            memcpy(&(unsafe->globals), &(safe->globals), sizeof(camel_global_t));
            task_commit();
            
        } else {

            //memcpy(&(unsafe->globals), &(safe->globals), sizeof(camel_global_t));
            task_lookup_search();
            commit();
            memcpy(&(unsafe->globals), &(safe->globals), sizeof(camel_global_t));
            task_commit();

            //memcpy(&(unsafe->globals), &(safe->globals), sizeof(camel_global_t));
            task_lookup_done();
            commit();
            memcpy(&(unsafe->globals), &(safe->globals), sizeof(camel_global_t));
            task_commit();
        }
    }
    
    task_done();
}