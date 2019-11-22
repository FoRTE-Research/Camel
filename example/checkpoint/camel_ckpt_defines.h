#ifndef CAMEL_CKPT_DEFINES_H
#define CAMEL_CKPT_DEFINES_H

// This value set in the FLG_POS indicates that there is a complete checkpoint there
#define CKPT_1_FLG  0x0001
#define CKPT_2_FLG  0x0002
#define NV_CKPT_FLG 0x0003

#if defined __MSP430F5529__
  #define SRAM_TOP  0x4400
#elif defined __MSP430G2553__
  #define SRAM_TOP  0x400
#elif defined __MSP430FR6989__
  #define SRAM_TOP  0x2400
#else
  #error "Board not supported"
#endif

#define CRC_INIT 0xFFFF

// On MSP430, 16 16-bit architectural registers - R3 is a constant generator, not saved
// But, only the registers up to and including R11 are preserved across function calls
#define NUM_REGISTERS_SAVED 11

#define R11_POS 0
#define R10_POS 2
#define R9_POS  4
#define R8_POS  6
#define R7_POS  8
#define R6_POS  10
#define R5_POS  12
#define R4_POS  14
#define R2_POS  16
#define R1_POS  18
#define R0_POS  20

#endif
