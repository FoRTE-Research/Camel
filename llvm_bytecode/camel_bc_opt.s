	.text
	.file	"camel_bc.c"
	.globl	camel_init              ; -- Begin function camel_init
	.p2align	1
	.type	camel_init,@function
camel_init:                             ; @camel_init
.Lfunc_begin0:
; %bb.0:                                ; %entry
	mov	#23168, &WDTCTL
	bis.b	#1, &PADIR_L
	and.b	#-2, &PAOUT_L
	and	#-2, &PM5CTL0
	mov.b	#-91, &CSCTL0_H
	mov	#64, &CSCTL1
	mov	#307, &CSCTL2
	clr	&CSCTL3
	clr.b	&CSCTL0_H
	mov	#-23296, &FRCTL0
	ret
.Lfunc_end0:
	.size	camel_init, .Lfunc_end0-camel_init
                                        ; -- End function
	.globl	camel_recover           ; -- Begin function camel_recover
	.p2align	1
	.type	camel_recover,@function
camel_recover:                          ; @camel_recover
.Lfunc_begin1:
; %bb.0:                                ; %entry
	mov	&camel, r12
	cmp	#2, r12
	jeq	.LBB1_3
; %bb.1:                                ; %entry
	cmp	#1, r12
	jne	.LBB1_4
; %bb.2:                                ; %if.then
	mov	#camel+2, r12
	mov	#camel+48, &unsafe
	mov	#camel+2, &safe
	jmp	.LBB1_5
.LBB1_3:                                ; %if.then2
	mov	#camel+48, r12
	mov	#camel+2, &unsafe
	mov	#camel+48, &safe
	jmp	.LBB1_5
.LBB1_4:                                ; %if.else3
	call	#__crt0_start
	mov	&safe, r12
.LBB1_5:                                ; %if.end4
	mov	18(r12), r12
	;APP
	mov	r12, r1
	;NO_APP
	;APP
	mov	r1, r12
	;NO_APP
	;DEBUG_VALUE: __x <- $r12
	;APP
	mov	r1, r14
	;NO_APP
	;DEBUG_VALUE: __x <- $r14
	mov	#9214, r13
	sub	r14, r13
	incd	r12
	mov	#-1, r14
	call	#__fast_hw_crc
	mov	r12, r14
	mov	r14, &tmp_stack_crc
	mov	&safe, r12
	mov	#44, r13
	call	#__fast_hw_crc
	mov	r12, &tmp_stack_buf_crc
	mov	&safe, r13
	cmp	44(r13), r12
	jne	.LBB1_7
; %bb.6:                                ; %if.then10
	mov	&unsafe, r12
	mov	#46, r14
	call	#memcpy
	mov	#23168, &WDTCTL
	bis.b	#1, &PADIR_L
	and.b	#-2, &PAOUT_L
	and	#-2, &PM5CTL0
	mov.b	#-91, &CSCTL0_H
	mov	#64, &CSCTL1
	mov	#307, &CSCTL2
	clr	&CSCTL3
	clr.b	&CSCTL0_H
	mov	#-23296, &FRCTL0
	mov	&safe, r12
	call	#__restore_registers
	ret
.LBB1_7:                                ; %if.else12
	call	#__crt0_start
	ret
.Lfunc_end1:
	.size	camel_recover, .Lfunc_end1-camel_recover
                                        ; -- End function
	.globl	commit                  ; -- Begin function commit
	.p2align	1
	.type	commit,@function
commit:                                 ; @commit
.Lfunc_begin2:
; %bb.0:                                ; %entry
	push	r10
	cmp	#1, &camel
	jne	.LBB2_2
; %bb.1:                                ; %if.then
	mov	#camel+2, &unsafe
	mov	#camel+48, &safe
	mov	#camel+48, r12
	call	#__dump_registers
	mov	#2, r10
	;APP
	mov	r1, r12
	;NO_APP
	;DEBUG_VALUE: __x <- $r12
	;APP
	mov	r1, r14
	;NO_APP
	;DEBUG_VALUE: __x <- $r14
	jmp	.LBB2_3
.LBB2_2:                                ; %if.else
	mov	#camel+48, &unsafe
	mov	#camel+2, &safe
	mov	#camel+2, r12
	call	#__dump_registers
	mov	#1, r10
	;APP
	mov	r1, r12
	;NO_APP
	;DEBUG_VALUE: __x <- $r12
	;APP
	mov	r1, r14
	;NO_APP
	;DEBUG_VALUE: __x <- $r14
.LBB2_3:                                ; %do.end
	mov	#9214, r13
	sub	r14, r13
	incd	r12
	mov	#-1, r14
	call	#__fast_hw_crc
	mov	r12, r14
	mov	r14, &tmp_stack_crc
	mov	&safe, r12
	mov	#44, r13
	call	#__fast_hw_crc
	mov	r12, &tmp_stack_buf_crc
	mov	&safe, r13
	mov	r12, 44(r13)
	mov	r10, &camel
	pop	r10
	ret
.Lfunc_end2:
	.size	commit, .Lfunc_end2-commit
                                        ; -- End function
	.globl	naked                   ; -- Begin function naked
	.p2align	1
	.type	naked,@function
naked:                                  ; @naked
.Lfunc_begin3:
; %bb.0:                                ; %entry
	;APP
	ret

	;NO_APP
.Lfunc_end3:
	.size	naked, .Lfunc_end3-naked
                                        ; -- End function
	.globl	task_init               ; -- Begin function task_init
	.p2align	1
	.type	task_init,@function
task_init:                              ; @task_init
.Lfunc_begin4:
; %bb.0:                                ; %entry
	mov	&unsafe, r12
	clr	36(r12)
	mov	&unsafe, r12
	clr	22(r12)
	mov	&unsafe, r12
	clr	24(r12)
	mov	&unsafe, r12
	clr	26(r12)
	mov	&unsafe, r12
	clr	28(r12)
	mov	&unsafe, r12
	clr	30(r12)
	mov	&unsafe, r12
	clr	32(r12)
	mov	&unsafe, r12
	clr	34(r12)
	ret
.Lfunc_end4:
	.size	task_init, .Lfunc_end4-task_init
                                        ; -- End function
	.globl	task_select_func        ; -- Begin function task_select_func
	.p2align	1
	.type	task_select_func,@function
task_select_func:                       ; @task_select_func
.Lfunc_begin5:
; %bb.0:                                ; %entry
	mov	&unsafe, r12
	clr	40(r12)
	mov	#4, 38(r12)
	mov	&unsafe, r12
	clr	42(r12)
	mov	&unsafe, r12
	mov	36(r12), r13
	inc	r13
	mov	r13, 36(r12)
	ret
.Lfunc_end5:
	.size	task_select_func, .Lfunc_end5-task_select_func
                                        ; -- End function
	.globl	task_bit_count          ; -- Begin function task_bit_count
	.p2align	1
	.type	task_bit_count,@function
task_bit_count:                         ; @task_bit_count
.Lfunc_begin6:
; %bb.0:                                ; %entry
	sub	#6, r1
	mov	&unsafe, r12
	mov	38(r12), r13
	mov	40(r12), r12
	mov	r12, 4(r1)
	mov	r13, 2(r1)
	mov	&unsafe, r12
	mov	40(r12), r13
	mov	38(r12), r14
	mov	r14, r15
	add	#13, r15
	cmp	r14, r15
	mov	#1, r14
	bic	r2, r14
	add	r14, r13
	mov	r15, 38(r12)
	mov	r13, 40(r12)
	clr	0(r1)
	mov	4(r1), r12
	mov	2(r1), r13
	bis	r12, r13
	tst	r13
	jeq	.LBB6_5
	jmp	.LBB6_1
.LBB6_1:                                ; %if.then
	jmp	.LBB6_2
.LBB6_2:                                ; %do.body
                                        ; =>This Inner Loop Header: Depth=1
	mov	0(r1), r12
	inc	r12
	mov	r12, 0(r1)
	jmp	.LBB6_3
.LBB6_3:                                ; %do.cond
                                        ;   in Loop: Header=BB6_2 Depth=1
	mov	4(r1), r12
	mov	2(r1), r13
	mov	r13, r14
	add	#-1, r14
	cmp	r13, r14
	mov	#1, r15
	bic	r2, r15
	mov	r12, r11
	add	r15, r11
	add	#-1, r11
	and	r11, r12
	and	r14, r13
	mov	r13, 2(r1)
	mov	r12, 4(r1)
	bis	r12, r13
	tst	r13
	jne	.LBB6_2
	jmp	.LBB6_4
.LBB6_4:                                ; %do.end
	jmp	.LBB6_5
.LBB6_5:                                ; %if.end
	mov	0(r1), r12
	mov	&unsafe, r13
	mov	22(r13), r14
	add	r12, r14
	mov	r14, 22(r13)
	mov	&unsafe, r12
	mov	42(r12), r13
	inc	r13
	mov	r13, 42(r12)
	add	#6, r1
	ret
.Lfunc_end6:
	.size	task_bit_count, .Lfunc_end6-task_bit_count
                                        ; -- End function
	.globl	task_bitcount           ; -- Begin function task_bitcount
	.p2align	1
	.type	task_bitcount,@function
task_bitcount:                          ; @task_bitcount
.Lfunc_begin7:
; %bb.0:                                ; %entry
	sub	#4, r1
	mov	&unsafe, r12
	mov	38(r12), r13
	mov	40(r12), r12
	mov	r12, 2(r1)
	mov	r13, 0(r1)
	mov	&unsafe, r13
	mov	40(r13), r14
	mov	38(r13), r12
	mov	r12, r15
	add	#13, r15
	cmp	r12, r15
	mov	#1, r12
	mov	#1, r11
	bic	r2, r11
	add	r11, r14
	mov	r15, 38(r13)
	mov	r14, 40(r13)
	mov	0(r1), r13
	mov	2(r1), r14
	mov	r14, r15
	and	#-21846, r15
	mov	r13, r11
	and	#-21846, r11
	clrc
	rrc	r11
	clrc
	rrc	r15
	and	#21845, r13
	and	#21845, r14
	add	r14, r15
	mov	r11, r14
	add	r13, r14
	cmp	r11, r14
	mov	#1, r13
	bic	r2, r13
	add	r13, r15
	mov	r14, 0(r1)
	mov	r15, 2(r1)
	mov	0(r1), r13
	mov	2(r1), r14
	mov	r14, r15
	and	#-13108, r15
	mov	r13, r11
	and	#-13108, r11
	clrc
	rrc	r11
	rra	r11
	clrc
	rrc	r15
	rra	r15
	and	#13107, r13
	and	#13107, r14
	add	r14, r15
	mov	r11, r14
	add	r13, r14
	cmp	r11, r14
	mov	#1, r13
	bic	r2, r13
	add	r13, r15
	mov	r14, 0(r1)
	mov	r15, 2(r1)
	mov	0(r1), r14
	mov	2(r1), r15
	mov	r15, r13
	and	#-3856, r13
	mov	r14, r11
	and	#-3856, r11
	clrc
	rrc	r11
	rra	r11
	rra	r11
	rra	r11
	clrc
	rrc	r13
	rra	r13
	rra	r13
	rra	r13
	and	#3855, r14
	and	#3855, r15
	add	r15, r13
	mov	r11, r15
	add	r14, r15
	cmp	r11, r15
	mov	#1, r14
	bic	r2, r14
	add	r14, r13
	mov	r15, 0(r1)
	mov	r13, 2(r1)
	mov	0(r1), r13
	mov	2(r1), r14
	mov	r14, r15
	and	#-256, r15
	mov	r13, r11
	swpb	r11
	mov.b	r11, r11
	swpb	r15
	mov.b	r13, r13
	mov.b	r14, r14
	add	r14, r15
	mov	r11, r14
	add	r13, r14
	cmp	r11, r14
	mov	#1, r13
	bic	r2, r13
	add	r13, r15
	mov	r14, 0(r1)
	mov	r15, 2(r1)
	mov	0(r1), r13
	mov	2(r1), r14
	mov	r14, r15
	add	r13, r15
	cmp	r14, r15
	bic	r2, r12
	mov	r15, 0(r1)
	mov	r12, 2(r1)
	mov	0(r1), r12
	mov	&unsafe, r13
	mov	24(r13), r14
	add	r12, r14
	mov	r14, 24(r13)
	mov	&unsafe, r12
	mov	42(r12), r13
	inc	r13
	mov	r13, 42(r12)
	add	#4, r1
	ret
.Lfunc_end7:
	.size	task_bitcount, .Lfunc_end7-task_bitcount
                                        ; -- End function
	.globl	recursive_cnt           ; -- Begin function recursive_cnt
	.p2align	1
	.type	recursive_cnt,@function
recursive_cnt:                          ; @recursive_cnt
.Lfunc_begin8:
; %bb.0:                                ; %entry
	;DEBUG_VALUE: recursive_cnt:x <- [DW_OP_LLVM_fragment 16 16] $r13
	push	r10
	mov	r12, r14
	;DEBUG_VALUE: recursive_cnt:x <- [DW_OP_LLVM_fragment 0 16] $r14
	clrc
	mov	r14, r15
	rrc	r15
	rra	r15
	rra	r15
	rra	r15
	mov	r13, r12
	mov.b	r12, r12
	swpb	r12
	add	r12, r12
	add	r12, r12
	add	r12, r12
	add	r12, r12
	bis	r15, r12
	;DEBUG_VALUE: recursive_cnt:x <- [DW_OP_LLVM_fragment 0 16] $r12
	and	#15, r14
	mov.b	bits(r14), r10
	sxt	r10
	;DEBUG_VALUE: recursive_cnt:cnt <- $r10
	clrc
	rrc	r13
	rra	r13
	rra	r13
	rra	r13
	;DEBUG_VALUE: recursive_cnt:x <- [DW_OP_LLVM_fragment 16 16] $r13
	mov	r12, r14
	bis	r13, r14
	tst	r14
	jeq	.LBB8_2
; %bb.1:                                ; %if.then
	;DEBUG_VALUE: recursive_cnt:cnt <- $r10
	;DEBUG_VALUE: recursive_cnt:x <- [DW_OP_LLVM_fragment 0 16] $r12
	;DEBUG_VALUE: recursive_cnt:x <- [DW_OP_LLVM_fragment 16 16] $r13
	call	#recursive_cnt
	add	r10, r12
	;DEBUG_VALUE: recursive_cnt:cnt <- $r12
	pop	r10
	ret
.LBB8_2:                                ; %if.end
	;DEBUG_VALUE: recursive_cnt:cnt <- $r10
	;DEBUG_VALUE: recursive_cnt:x <- [DW_OP_LLVM_fragment 0 16] $r12
	;DEBUG_VALUE: recursive_cnt:x <- [DW_OP_LLVM_fragment 16 16] $r13
	mov	r10, r12
	pop	r10
	ret
.Lfunc_end8:
	.size	recursive_cnt, .Lfunc_end8-recursive_cnt
                                        ; -- End function
	.globl	task_ntbl_bitcnt        ; -- Begin function task_ntbl_bitcnt
	.p2align	1
	.type	task_ntbl_bitcnt,@function
task_ntbl_bitcnt:                       ; @task_ntbl_bitcnt
.Lfunc_begin9:
; %bb.0:                                ; %entry
	mov	&unsafe, r12
	mov	40(r12), r13
	mov	38(r12), r12
	call	#recursive_cnt
	mov	&unsafe, r13
	mov	26(r13), r14
	add	r12, r14
	mov	r14, 26(r13)
	mov	&unsafe, r12
	mov	40(r12), r13
	mov	38(r12), r14
	mov	r14, r15
	add	#13, r15
	cmp	r14, r15
	mov	#1, r14
	bic	r2, r14
	add	r14, r13
	mov	r15, 38(r12)
	mov	r13, 40(r12)
	mov	&unsafe, r12
	mov	42(r12), r13
	inc	r13
	mov	r13, 42(r12)
	ret
.Lfunc_end9:
	.size	task_ntbl_bitcnt, .Lfunc_end9-task_ntbl_bitcnt
                                        ; -- End function
	.globl	task_ntbl_bitcount      ; -- Begin function task_ntbl_bitcount
	.p2align	1
	.type	task_ntbl_bitcount,@function
task_ntbl_bitcount:                     ; @task_ntbl_bitcount
.Lfunc_begin10:
; %bb.0:                                ; %entry
	mov	&unsafe, r12
	mov	40(r12), r14
	mov	38(r12), r15
	mov	r15, r13
	and	#15, r13
	mov.b	bits(r13), r13
	sxt	r13
	mov	r15, r11
	and	#240, r11
	clrc
	rrc	r11
	rra	r11
	rra	r11
	rra	r11
	mov.b	bits(r11), r11
	sxt	r11
	add	r11, r13
	mov	r15, r11
	and	#3840, r11
	swpb	r11
	mov.b	bits(r11), r11
	sxt	r11
	add	r11, r13
	swpb	r15
	mov.b	r15, r15
	clrc
	rrc	r15
	rra	r15
	rra	r15
	rra	r15
	mov.b	bits(r15), r15
	sxt	r15
	add	r15, r13
	mov	r14, r15
	and	#15, r15
	mov.b	bits(r15), r15
	sxt	r15
	add	r15, r13
	mov	r14, r15
	and	#240, r15
	clrc
	rrc	r15
	rra	r15
	rra	r15
	rra	r15
	mov.b	bits(r15), r15
	sxt	r15
	add	r15, r13
	mov	r14, r15
	and	#3840, r15
	swpb	r15
	mov.b	bits(r15), r15
	sxt	r15
	add	r15, r13
	swpb	r14
	mov.b	r14, r14
	clrc
	rrc	r14
	rra	r14
	rra	r14
	rra	r14
	mov.b	bits(r14), r14
	sxt	r14
	add	r14, r13
	mov	28(r12), r14
	add	r13, r14
	mov	r14, 28(r12)
	mov	&unsafe, r12
	mov	40(r12), r13
	mov	38(r12), r14
	mov	r14, r15
	add	#13, r15
	cmp	r14, r15
	mov	#1, r14
	bic	r2, r14
	add	r14, r13
	mov	r15, 38(r12)
	mov	r13, 40(r12)
	mov	&unsafe, r12
	mov	42(r12), r13
	inc	r13
	mov	r13, 42(r12)
	ret
.Lfunc_end10:
	.size	task_ntbl_bitcount, .Lfunc_end10-task_ntbl_bitcount
                                        ; -- End function
	.globl	task_BW_btbl_bitcount   ; -- Begin function task_BW_btbl_bitcount
	.p2align	1
	.type	task_BW_btbl_bitcount,@function
task_BW_btbl_bitcount:                  ; @task_BW_btbl_bitcount
.Lfunc_begin11:
; %bb.0:                                ; %entry
	sub	#4, r1
	mov	&unsafe, r12
	mov	38(r12), r13
	mov	40(r12), r12
	mov	r12, 2(r1)
	mov	r13, 0(r1)
	mov.b	0(r1), r12
	mov.b	bits(r12), r12
	sxt	r12
	mov.b	1(r1), r13
	mov.b	bits(r13), r13
	sxt	r13
	add	r13, r12
	mov.b	3(r1), r13
	mov.b	bits(r13), r13
	sxt	r13
	add	r13, r12
	mov.b	2(r1), r13
	mov.b	bits(r13), r13
	sxt	r13
	add	r13, r12
	mov	&unsafe, r13
	mov	30(r13), r14
	add	r12, r14
	mov	r14, 30(r13)
	mov	&unsafe, r12
	mov	40(r12), r13
	mov	38(r12), r14
	mov	r14, r15
	add	#13, r15
	cmp	r14, r15
	mov	#1, r14
	bic	r2, r14
	add	r14, r13
	mov	r15, 38(r12)
	mov	r13, 40(r12)
	mov	&unsafe, r12
	mov	42(r12), r13
	inc	r13
	mov	r13, 42(r12)
	add	#4, r1
	ret
.Lfunc_end11:
	.size	task_BW_btbl_bitcount, .Lfunc_end11-task_BW_btbl_bitcount
                                        ; -- End function
	.globl	task_AR_btbl_bitcount   ; -- Begin function task_AR_btbl_bitcount
	.p2align	1
	.type	task_AR_btbl_bitcount,@function
task_AR_btbl_bitcount:                  ; @task_AR_btbl_bitcount
.Lfunc_begin12:
; %bb.0:                                ; %entry
	sub	#4, r1
	mov	&unsafe, r12
	add	#38, r12
	mov	r12, 2(r1)
	mov	2(r1), r12
	mov	r12, r13
	inc	r13
	mov	r13, 2(r1)
	mov.b	0(r12), r12
	mov.b	bits(r12), r12
	sxt	r12
	mov	r12, 0(r1)
	mov	2(r1), r12
	mov	r12, r13
	inc	r13
	mov	r13, 2(r1)
	mov.b	0(r12), r12
	mov.b	bits(r12), r12
	sxt	r12
	mov	0(r1), r13
	add	r12, r13
	mov	r13, 0(r1)
	mov	2(r1), r12
	mov	r12, r13
	inc	r13
	mov	r13, 2(r1)
	mov.b	0(r12), r12
	mov.b	bits(r12), r12
	sxt	r12
	mov	0(r1), r13
	add	r12, r13
	mov	r13, 0(r1)
	mov	2(r1), r12
	mov.b	0(r12), r12
	mov.b	bits(r12), r12
	sxt	r12
	mov	0(r1), r13
	add	r12, r13
	mov	r13, 0(r1)
	mov	0(r1), r12
	mov	&unsafe, r13
	mov	32(r13), r14
	add	r12, r14
	mov	r14, 32(r13)
	mov	&unsafe, r12
	mov	40(r12), r13
	mov	38(r12), r14
	mov	r14, r15
	add	#13, r15
	cmp	r14, r15
	mov	#1, r14
	bic	r2, r14
	add	r14, r13
	mov	r15, 38(r12)
	mov	r13, 40(r12)
	mov	&unsafe, r12
	mov	42(r12), r13
	inc	r13
	mov	r13, 42(r12)
	add	#4, r1
	ret
.Lfunc_end12:
	.size	task_AR_btbl_bitcount, .Lfunc_end12-task_AR_btbl_bitcount
                                        ; -- End function
	.globl	task_bit_shifter        ; -- Begin function task_bit_shifter
	.p2align	1
	.type	task_bit_shifter,@function
task_bit_shifter:                       ; @task_bit_shifter
.Lfunc_begin13:
; %bb.0:                                ; %entry
	sub	#8, r1
	mov	&unsafe, r12
	mov	38(r12), r13
	mov	40(r12), r12
	mov	r12, 2(r1)
	mov	r13, 0(r1)
	clr	4(r1)
	clr	6(r1)
	jmp	.LBB13_1
.LBB13_1:                               ; %for.cond
                                        ; =>This Inner Loop Header: Depth=1
	mov	2(r1), r12
	mov	0(r1), r13
	bis	r12, r13
	clr.b	r12
	tst	r13
	jeq	.LBB13_3
	jmp	.LBB13_2
.LBB13_2:                               ; %land.rhs
                                        ;   in Loop: Header=BB13_1 Depth=1
	mov	6(r1), r12
	cmp	#32, r12
	mov	#1, r12
	bic	r2, r12
	jmp	.LBB13_3
.LBB13_3:                               ; %land.end
                                        ;   in Loop: Header=BB13_1 Depth=1
	bit	#1, r12
	jeq	.LBB13_6
	jmp	.LBB13_4
.LBB13_4:                               ; %for.body
                                        ;   in Loop: Header=BB13_1 Depth=1
	mov	0(r1), r12
	and	#1, r12
	mov	4(r1), r13
	add	r12, r13
	mov	r13, 4(r1)
	jmp	.LBB13_5
.LBB13_5:                               ; %for.inc
                                        ;   in Loop: Header=BB13_1 Depth=1
	mov	6(r1), r12
	inc	r12
	mov	r12, 6(r1)
	mov	2(r1), r12
	mov	0(r1), r13
	clrc
	rrc	r13
	mov	r12, r14
	mov.b	r14, r14
	swpb	r14
	add	r14, r14
	add	r14, r14
	add	r14, r14
	add	r14, r14
	add	r14, r14
	add	r14, r14
	add	r14, r14
	bis	r14, r13
	clrc
	rrc	r12
	mov	r12, 2(r1)
	mov	r13, 0(r1)
	jmp	.LBB13_1
.LBB13_6:                               ; %for.end
	mov	4(r1), r12
	mov	&unsafe, r13
	mov	34(r13), r14
	add	r12, r14
	mov	r14, 34(r13)
	mov	&unsafe, r12
	mov	40(r12), r13
	mov	38(r12), r14
	mov	r14, r15
	add	#13, r15
	cmp	r14, r15
	mov	#1, r14
	bic	r2, r14
	add	r14, r13
	mov	r15, 38(r12)
	mov	r13, 40(r12)
	mov	&unsafe, r12
	mov	42(r12), r13
	inc	r13
	mov	r13, 42(r12)
	add	#8, r1
	ret
.Lfunc_end13:
	.size	task_bit_shifter, .Lfunc_end13-task_bit_shifter
                                        ; -- End function
	.globl	task_done               ; -- Begin function task_done
	.p2align	1
	.type	task_done,@function
task_done:                              ; @task_done
.Lfunc_begin14:
; %bb.0:                                ; %entry
	clr	r12
	call	#exit
.Lfunc_end14:
	.size	task_done, .Lfunc_end14-task_done
                                        ; -- End function
	.globl	task_commit             ; -- Begin function task_commit
	.p2align	1
	.type	task_commit,@function
task_commit:                            ; @task_commit
.Lfunc_begin15:
; %bb.0:                                ; %entry
	ret
.Lfunc_end15:
	.size	task_commit, .Lfunc_end15-task_commit
                                        ; -- End function
	.globl	main                    ; -- Begin function main
	.p2align	1
	.type	main,@function
main:                                   ; @main
.Lfunc_begin16:
; %bb.0:                                ; %entry
	mov	#23168, &WDTCTL
	bis.b	#1, &PADIR_L
	and.b	#-2, &PAOUT_L
	and	#-2, &PM5CTL0
	mov.b	#-91, &CSCTL0_H
	mov	#64, &CSCTL1
	mov	#307, &CSCTL2
	mov	#camel+2, &safe
	mov	#1, &camel
	mov	#camel+48, &unsafe
	clr	&CSCTL3
	clr.b	&CSCTL0_H
	mov	#-23296, &FRCTL0
	call	#task_init
	call	#commit
	mov	#22, r13
	add	&safe, r13
	mov	#22, r12
	add	&unsafe, r12
	mov	#22, r14
	call	#memcpy
.LBB16_1:                               ; %while.body
                                        ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB16_16 Depth 2
                                        ;     Child Loop BB16_14 Depth 2
                                        ;     Child Loop BB16_10 Depth 2
                                        ;     Child Loop BB16_12 Depth 2
                                        ;     Child Loop BB16_4 Depth 2
                                        ;     Child Loop BB16_8 Depth 2
                                        ;     Child Loop BB16_6 Depth 2
	call	#task_select_func
	call	#commit
	mov	&safe, r12
	mov	38(r12), r13
	mov	&unsafe, r14
	mov	40(r12), 40(r14)
	mov	r13, 38(r14)
	mov	42(r12), 42(r14)
	mov	36(r12), 36(r14)
	mov	#-1, r13
	add	36(r12), r13
	cmp	#8, r13
	jhs	.LBB16_1
; %bb.2:                                ; %while.body
                                        ;   in Loop: Header=BB16_1 Depth=1
	add	r13, r13
	br	.LJTI16_0(r13)
.LBB16_3:                               ; %while.cond20.preheader
                                        ;   in Loop: Header=BB16_1 Depth=1
	cmp	#100, 42(r12)
	jhs	.LBB16_1
.LBB16_4:                               ; %while.body24
                                        ;   Parent Loop BB16_1 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	call	#task_ntbl_bitcnt
	call	#commit
	mov	&unsafe, r12
	mov	&safe, r13
	mov	26(r13), 26(r12)
	mov	40(r13), r14
	mov	38(r13), 38(r12)
	mov	r14, 40(r12)
	mov	42(r13), 42(r12)
	cmp	#100, 42(r13)
	jlo	.LBB16_4
	jmp	.LBB16_1
.LBB16_5:                               ; %while.body4
                                        ;   in Loop: Header=BB16_6 Depth=2
	call	#task_bit_count
	call	#commit
	mov	&safe, r12
	mov	38(r12), r13
	mov	&unsafe, r14
	mov	40(r12), 40(r14)
	mov	r13, 38(r14)
	mov	22(r12), 22(r14)
	mov	42(r12), 42(r14)
.LBB16_6:                               ; %while.cond1.preheader
                                        ;   Parent Loop BB16_1 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	cmp	#100, 42(r12)
	jlo	.LBB16_5
	jmp	.LBB16_1
.LBB16_7:                               ; %while.body13
                                        ;   in Loop: Header=BB16_8 Depth=2
	call	#task_bitcount
	call	#commit
	mov	&safe, r12
	mov	38(r12), r13
	mov	&unsafe, r14
	mov	40(r12), 40(r14)
	mov	r13, 38(r14)
	mov	24(r12), 24(r14)
	mov	42(r12), 42(r14)
.LBB16_8:                               ; %while.cond9.preheader
                                        ;   Parent Loop BB16_1 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	cmp	#100, 42(r12)
	jlo	.LBB16_7
	jmp	.LBB16_1
.LBB16_9:                               ; %while.cond42.preheader
                                        ;   in Loop: Header=BB16_1 Depth=1
	cmp	#100, 42(r12)
	jhs	.LBB16_1
.LBB16_10:                              ; %while.body46
                                        ;   Parent Loop BB16_1 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	call	#task_BW_btbl_bitcount
	call	#commit
	mov	&unsafe, r12
	mov	&safe, r13
	mov	30(r13), 30(r12)
	mov	40(r13), r14
	mov	38(r13), 38(r12)
	mov	r14, 40(r12)
	mov	42(r13), 42(r12)
	cmp	#100, 42(r13)
	jlo	.LBB16_10
	jmp	.LBB16_1
.LBB16_11:                              ; %while.cond31.preheader
                                        ;   in Loop: Header=BB16_1 Depth=1
	cmp	#100, 42(r12)
	jhs	.LBB16_1
.LBB16_12:                              ; %while.body35
                                        ;   Parent Loop BB16_1 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	call	#task_ntbl_bitcount
	call	#commit
	mov	&unsafe, r12
	mov	&safe, r13
	mov	28(r13), 28(r12)
	mov	40(r13), r14
	mov	38(r13), 38(r12)
	mov	r14, 40(r12)
	mov	42(r13), 42(r12)
	cmp	#100, 42(r13)
	jlo	.LBB16_12
	jmp	.LBB16_1
.LBB16_13:                              ; %while.cond53.preheader
                                        ;   in Loop: Header=BB16_1 Depth=1
	cmp	#100, 42(r12)
	jhs	.LBB16_1
.LBB16_14:                              ; %while.body57
                                        ;   Parent Loop BB16_1 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	call	#task_AR_btbl_bitcount
	call	#commit
	mov	&unsafe, r12
	mov	&safe, r13
	mov	32(r13), 32(r12)
	mov	40(r13), r14
	mov	38(r13), 38(r12)
	mov	r14, 40(r12)
	mov	42(r13), 42(r12)
	cmp	#100, 42(r13)
	jlo	.LBB16_14
	jmp	.LBB16_1
.LBB16_15:                              ; %while.cond64.preheader
                                        ;   in Loop: Header=BB16_1 Depth=1
	cmp	#100, 42(r12)
	jhs	.LBB16_1
.LBB16_16:                              ; %while.body68
                                        ;   Parent Loop BB16_1 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	call	#task_bit_shifter
	call	#commit
	mov	&unsafe, r12
	mov	&safe, r13
	mov	34(r13), 34(r12)
	mov	40(r13), r14
	mov	38(r13), 38(r12)
	mov	r14, 40(r12)
	mov	42(r13), 42(r12)
	cmp	#100, 42(r13)
	jlo	.LBB16_16
	jmp	.LBB16_1
.LBB16_17:                              ; %if.then74
	call	#task_done
.Lfunc_end16:
	.size	main, .Lfunc_end16-main
	.section	.rodata,"a",@progbits
	.p2align	1
.LJTI16_0:
	.short	.LBB16_6
	.short	.LBB16_8
	.short	.LBB16_3
	.short	.LBB16_11
	.short	.LBB16_9
	.short	.LBB16_13
	.short	.LBB16_15
	.short	.LBB16_17
                                        ; -- End function
	.type	camel,@object           ; @camel
	.comm	camel,94,2
	.type	safe,@object            ; @safe
	.comm	safe,2,2
	.type	unsafe,@object          ; @unsafe
	.comm	unsafe,2,2
	.type	tmp_stack_crc,@object   ; @tmp_stack_crc
	.comm	tmp_stack_crc,2,2
	.type	tmp_stack_buf_crc,@object ; @tmp_stack_buf_crc
	.comm	tmp_stack_buf_crc,2,2
	.type	bits,@object            ; @bits
bits:
	.ascii	"\000\001\001\002\001\002\002\003\001\002\002\003\002\003\003\004\001\002\002\003\002\003\003\004\002\003\003\004\003\004\004\005\001\002\002\003\002\003\003\004\002\003\003\004\003\004\004\005\002\003\003\004\003\004\004\005\003\004\004\005\004\005\005\006\001\002\002\003\002\003\003\004\002\003\003\004\003\004\004\005\002\003\003\004\003\004\004\005\003\004\004\005\004\005\005\006\002\003\003\004\003\004\004\005\003\004\004\005\004\005\005\006\003\004\004\005\004\005\005\006\004\005\005\006\005\006\006\007\001\002\002\003\002\003\003\004\002\003\003\004\003\004\004\005\002\003\003\004\003\004\004\005\003\004\004\005\004\005\005\006\002\003\003\004\003\004\004\005\003\004\004\005\004\005\005\006\003\004\004\005\004\005\005\006\004\005\005\006\005\006\006\007\002\003\003\004\003\004\004\005\003\004\004\005\004\005\005\006\003\004\004\005\004\005\005\006\004\005\005\006\005\006\006\007\003\004\004\005\004\005\005\006\004\005\005\006\005\006\006\007\004\005\005\006\005\006\006\007\005\006\006\007\006\007\007\b"
	.size	bits, 256

	.type	reset_vector,@object    ; @reset_vector
	.section	__interrupt_vector_56,"aw",@progbits
	.p2align	1
reset_vector:
	.short	camel_recover
	.size	reset_vector, 2

	.type	buf,@object             ; @buf
	.comm	buf,22,2

	.ident	"clang version 10.0.0 (https://github.com/llvm/llvm-project.git f79f68975d51b389d9f141aa30ab47723a75a868)"
	.section	".note.GNU-stack","",@progbits
