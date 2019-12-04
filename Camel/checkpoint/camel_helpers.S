.file "camel_helpers.S"

#include "camel_ckpt_defines.h"

; Calculate the hardware CRC quickly
; C compiler does it in a silly way...
; First argument is start pointer,
; second argument is length
; Third argument is CRC init value
.text
.balign 2
.global __fast_hw_crc
.type __fast_hw_crc, @function
__fast_hw_crc:
  #define R_PTR R12
  #define R_LEN R13
  #define R_INI R14

  MOV.W R_INI,  &CRCINIRES
  ADD.W R_PTR,  R_LEN
  ; TODO: Loop unrolling - on C side, ensure that buffer is even number of bytes long
  _fast_hw_crc_loop:
    MOV.W   @R_PTR, &CRCDIRB
    INCD.W  R_PTR
    CMP     R_LEN, R_PTR
    JL      _fast_hw_crc_loop
  MOV.W &CRCINIRES, R12
  RET

  #undef  R_PTR
  #undef  R_LEN
  #undef  R_INI
.size __fast_hw_crc, .-__fast_hw_crc

; Write architectural registers to the given buffer
; Only write registers which are preserved across calls:
; Up to and including R11
; First argument is pointer to buffer to dump registers to
.text
.balign 2
.global __dump_registers
.type __dump_registers, @function
__dump_registers:
  MOV.W R11,    R11_POS(R12)
  MOV.W R10,    R10_POS(R12)
  MOV.W R9,     R9_POS(R12)
  MOV.W R8,     R8_POS(R12)
  MOV.W R7,     R7_POS(R12)
  MOV.W R6,     R6_POS(R12)
  MOV.W R5,     R5_POS(R12)
  MOV.W R4,     R4_POS(R12)
  MOV.W R2,     R2_POS(R12)
  MOV.W R1,     R1_POS(R12)
  ADD.W #2,     R1_POS(R12)
  MOV.W @SP,    R0_POS(R12)
  RET
.size __dump_registers, .-__dump_registers

; Restore architectural registers from the given buffer
; Only restore registers which are preserved across calls:
; Up to and including R11
; First argument is pointer to buffer to restore registers from
.text
.balign 2
.global __restore_registers
.type __restore_registers, @function
__restore_registers:
  MOV.W R11_POS(R12), R11
  MOV.W R10_POS(R12), R10
  MOV.W R9_POS(R12),  R9
  MOV.W R8_POS(R12),  R8
  MOV.W R7_POS(R12),  R7
  MOV.W R6_POS(R12),  R6
  MOV.W R5_POS(R12),  R5
  MOV.W R4_POS(R12),  R4
  MOV.W R2_POS(R12),  R2
  NOP ; Potential interrupt enable/disable needs to be surrounded with NOPs
  MOV.W R1_POS(R12),  R1
  NOP
  MOV.W R0_POS(R12),  R0
  ; Don't need to return - moving value into R0 (PC) will jump for us
.size __restore_registers, .-__restore_registers
