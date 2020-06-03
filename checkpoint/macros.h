
//Accessing Global Variables
#define GV(x) unsafe->globals.x
#define MGV(x) safe->globals.x

//Manual logging of global variables
// Single variable
#define cps(x) unsafe->globals.x = safe->globals.x

// Array
#define cpas(x,y) unsafe->globals.x[unsafe->globals.y] = safe->globals.x[unsafe->globals.y]
#define cpaso(x, y) unsafe->globals.x[y] = safe->globals.x[y]
#define cpa(x,y) memcpy(unsafe->globals.x,safe->globals.x,y)

// Struct
#define cps_s(x) unsafe->globals.x = safe->globals.x
#define cpas_s(x,y) unsafe->globals.x[unsafe->globals.y] = safe->globals.x[safe->globals.y]

// Macros for task calling
#define TASK(x) x(); commit(); task_commit()