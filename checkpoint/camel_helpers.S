.file "camel_helpers.S"

#include "camel_ckpt_defines.h"

; Calculate the hardware CRC quickly
; C compiler does it in a silly way...
; First argument is start pointer,
; second argument is length
; Third argument is CRC init value
; .text
; .balign 2
; .global __fast_hw_crc
; .type __fast_hw_crc, @function
; __fast_hw_crc:
;   #define R_PTR R12
;   #define R_LEN R13
;   #define R_INI R14

;   MOV.W R_INI,  &CRCINIRES
;   ADD.W R_PTR,  R_LEN
;   ; TODO: Loop unrolling - on C side, ensure that buffer is even number of bytes long
;   _fast_hw_crc_loop:
;     MOV.W   @R_PTR, &CRCDIRB
;     INCD.W  R_PTR
;     CMP     R_LEN, R_PTR
;     JL      _fast_hw_crc_loop
;   MOV.W &CRCINIRES, R12
;   RET

;   #undef  R_PTR
;   #undef  R_LEN
;   #undef  R_INI
; .size __fast_hw_crc, .-__fast_hw_crc

; Calculate the CRC in software for devices without HW CRC
; First argument is start pointer,
; second argument is length
; Third argument is CRC init value
.text
.balign 2
.global __fast_sw_crc
.type __fast_sw_crc, @function
__fast_sw_crc:
  #define r_pmsg      R12
  #define r_msg_size  R13
  #define r_crc       R14
  #define r_ptable    R15
  #define r_mask      R8
  #define r_index     R9

_prequel_c:
  PUSH            R8
  PUSH            R9
  MOV             #0xFF00,		r_mask
  MOV 						#CRC_TABLE, r_ptable
_rc_loop_c:
  SWPB            r_crc
  MOV.B           r_crc, r_index
  XOR.B           @r_pmsg+, r_index
  ADD             r_index, r_index
  ADD             r_ptable, r_index
  AND             r_mask, r_crc
  XOR             @r_index, r_crc
  DEC		r_msg_size
  ; No loop unrolling now
  JNZ		_rc_loop_c
  POP   R9
  POP   R8
  RET

  #undef  r_crc
  #undef  r_ptable
  #undef  r_mask
  #undef  r_index
  #undef  r_msg_size
  #undef  r_pmsg
.size __fast_sw_crc, .-__fast_sw_crc

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

#ifndef CRC16_TABLE
#define CRC16_TABLE

; CRC16 lookup table
; width=16 poly=0x8005 init=0x0000 refin=false refout=false xorout=0x0000 check=0xfee8 residue=0x0000 name="CRC-16/UMTS"

.global CRC_TABLE
.text
CRC_TABLE:
	.word 0x0000
	.word 0x8005
	.word 0x800F
	.word 0x000A
	.word 0x801B
	.word 0x001E
	.word 0x0014
	.word 0x8011
	.word 0x8033
	.word 0x0036
	.word 0x003C
	.word 0x8039
	.word 0x0028
	.word 0x802D
	.word 0x8027
	.word 0x0022
	.word 0x8063
	.word 0x0066
	.word 0x006C
	.word 0x8069
	.word 0x0078
	.word 0x807D
	.word 0x8077
	.word 0x0072
	.word 0x0050
	.word 0x8055
	.word 0x805F
	.word 0x005A
	.word 0x804B
	.word 0x004E
	.word 0x0044
	.word 0x8041
	.word 0x80C3
	.word 0x00C6
	.word 0x00CC
	.word 0x80C9
	.word 0x00D8
	.word 0x80DD
	.word 0x80D7
	.word 0x00D2
	.word 0x00F0
	.word 0x80F5
	.word 0x80FF
	.word 0x00FA
	.word 0x80EB
	.word 0x00EE
	.word 0x00E4
	.word 0x80E1
	.word 0x00A0
	.word 0x80A5
	.word 0x80AF
	.word 0x00AA
	.word 0x80BB
	.word 0x00BE
	.word 0x00B4
	.word 0x80B1
	.word 0x8093
	.word 0x0096
	.word 0x009C
	.word 0x8099
	.word 0x0088
	.word 0x808D
	.word 0x8087
	.word 0x0082
	.word 0x8183
	.word 0x0186
	.word 0x018C
	.word 0x8189
	.word 0x0198
	.word 0x819D
	.word 0x8197
	.word 0x0192
	.word 0x01B0
	.word 0x81B5
	.word 0x81BF
	.word 0x01BA
	.word 0x81AB
	.word 0x01AE
	.word 0x01A4
	.word 0x81A1
	.word 0x01E0
	.word 0x81E5
	.word 0x81EF
	.word 0x01EA
	.word 0x81FB
	.word 0x01FE
	.word 0x01F4
	.word 0x81F1
	.word 0x81D3
	.word 0x01D6
	.word 0x01DC
	.word 0x81D9
	.word 0x01C8
	.word 0x81CD
	.word 0x81C7
	.word 0x01C2
	.word 0x0140
	.word 0x8145
	.word 0x814F
	.word 0x014A
	.word 0x815B
	.word 0x015E
	.word 0x0154
	.word 0x8151
	.word 0x8173
	.word 0x0176
	.word 0x017C
	.word 0x8179
	.word 0x0168
	.word 0x816D
	.word 0x8167
	.word 0x0162
	.word 0x8123
	.word 0x0126
	.word 0x012C
	.word 0x8129
	.word 0x0138
	.word 0x813D
	.word 0x8137
	.word 0x0132
	.word 0x0110
	.word 0x8115
	.word 0x811F
	.word 0x011A
	.word 0x810B
	.word 0x010E
	.word 0x0104
	.word 0x8101
	.word 0x8303
	.word 0x0306
	.word 0x030C
	.word 0x8309
	.word 0x0318
	.word 0x831D
	.word 0x8317
	.word 0x0312
	.word 0x0330
	.word 0x8335
	.word 0x833F
	.word 0x033A
	.word 0x832B
	.word 0x032E
	.word 0x0324
	.word 0x8321
	.word 0x0360
	.word 0x8365
	.word 0x836F
	.word 0x036A
	.word 0x837B
	.word 0x037E
	.word 0x0374
	.word 0x8371
	.word 0x8353
	.word 0x0356
	.word 0x035C
	.word 0x8359
	.word 0x0348
	.word 0x834D
	.word 0x8347
	.word 0x0342
	.word 0x03C0
	.word 0x83C5
	.word 0x83CF
	.word 0x03CA
	.word 0x83DB
	.word 0x03DE
	.word 0x03D4
	.word 0x83D1
	.word 0x83F3
	.word 0x03F6
	.word 0x03FC
	.word 0x83F9
	.word 0x03E8
	.word 0x83ED
	.word 0x83E7
	.word 0x03E2
	.word 0x83A3
	.word 0x03A6
	.word 0x03AC
	.word 0x83A9
	.word 0x03B8
	.word 0x83BD
	.word 0x83B7
	.word 0x03B2
	.word 0x0390
	.word 0x8395
	.word 0x839F
	.word 0x039A
	.word 0x838B
	.word 0x038E
	.word 0x0384
	.word 0x8381
	.word 0x0280
	.word 0x8285
	.word 0x828F
	.word 0x028A
	.word 0x829B
	.word 0x029E
	.word 0x0294
	.word 0x8291
	.word 0x82B3
	.word 0x02B6
	.word 0x02BC
	.word 0x82B9
	.word 0x02A8
	.word 0x82AD
	.word 0x82A7
	.word 0x02A2
	.word 0x82E3
	.word 0x02E6
	.word 0x02EC
	.word 0x82E9
	.word 0x02F8
	.word 0x82FD
	.word 0x82F7
	.word 0x02F2
	.word 0x02D0
	.word 0x82D5
	.word 0x82DF
	.word 0x02DA
	.word 0x82CB
	.word 0x02CE
	.word 0x02C4
	.word 0x82C1
	.word 0x8243
	.word 0x0246
	.word 0x024C
	.word 0x8249
	.word 0x0258
	.word 0x825D
	.word 0x8257
	.word 0x0252
	.word 0x0270
	.word 0x8275
	.word 0x827F
	.word 0x027A
	.word 0x826B
	.word 0x026E
	.word 0x0264
	.word 0x8261
	.word 0x0220
	.word 0x8225
	.word 0x822F
	.word 0x022A
	.word 0x823B
	.word 0x023E
	.word 0x0234
	.word 0x8231
	.word 0x8213
	.word 0x0216
	.word 0x021C
	.word 0x8219
	.word 0x0208
	.word 0x820D
	.word 0x8207
	.word 0x0202
	.end
#endif
