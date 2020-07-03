	.text
	.file	"camel_rsa.c"
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
	mov	#camel+228, &unsafe
	mov	#camel+2, &safe
	jmp	.LBB1_5
.LBB1_3:                                ; %if.then2
	mov	#camel+228, r12
	mov	#camel+2, &unsafe
	mov	#camel+228, &safe
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
	mov	#224, r13
	call	#__fast_hw_crc
	mov	r12, &tmp_stack_buf_crc
	mov	&safe, r13
	cmp	224(r13), r12
	jne	.LBB1_7
; %bb.6:                                ; %if.then10
	mov	&unsafe, r12
	mov	#226, r14
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
	mov	#camel+228, &safe
	mov	#camel+228, r12
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
	mov	#camel+228, &unsafe
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
	mov	#224, r13
	call	#__fast_hw_crc
	mov	r12, &tmp_stack_buf_crc
	mov	&safe, r13
	mov	r12, 224(r13)
	mov	r10, &camel
	pop	r10
	ret
.Lfunc_end2:
	.size	commit, .Lfunc_end2-commit
                                        ; -- End function
	.globl	task_done               ; -- Begin function task_done
	.p2align	1
	.type	task_done,@function
task_done:                              ; @task_done
.Lfunc_begin3:
; %bb.0:                                ; %entry
	clr	r12
	call	#exit
.Lfunc_end3:
	.size	task_done, .Lfunc_end3-task_done
                                        ; -- End function
	.globl	task_init               ; -- Begin function task_init
	.p2align	1
	.type	task_init,@function
task_init:                              ; @task_init
.Lfunc_begin4:
; %bb.0:                                ; %entry
	sub	#4, r1
	mov	#11, 0(r1)
	clr	2(r1)
	jmp	.LBB4_1
.LBB4_1:                                ; %for.cond
                                        ; =>This Inner Loop Header: Depth=1
	mov	2(r1), r12
	cmp	#8, r12
	jge	.LBB4_4
	jmp	.LBB4_2
.LBB4_2:                                ; %for.body
                                        ;   in Loop: Header=BB4_1 Depth=1
	mov	2(r1), r12
	mov.b	pubkey(r12), r13
	mov	&unsafe, r14
	add	r12, r12
	add	r12, r14
	mov	r13, 96(r14)
	jmp	.LBB4_3
.LBB4_3:                                ; %for.inc
                                        ;   in Loop: Header=BB4_1 Depth=1
	mov	2(r1), r12
	inc	r12
	mov	r12, 2(r1)
	jmp	.LBB4_1
.LBB4_4:                                ; %for.end
	mov	0(r1), r12
	mov	&unsafe, r13
	mov	r12, 60(r13)
	mov	&unsafe, r12
	clr	58(r12)
	mov	&unsafe, r12
	clr	62(r12)
	mov	&unsafe, r12
	clr	220(r12)
	mov	&unsafe, r12
	clr	222(r12)
	add	#4, r1
	ret
.Lfunc_end4:
	.size	task_init, .Lfunc_end4-task_init
                                        ; -- End function
	.globl	task_pad                ; -- Begin function task_pad
	.p2align	1
	.type	task_pad,@function
task_pad:                               ; @task_pad
.Lfunc_begin5:
; %bb.0:                                ; %entry
	sub	#4, r1
	mov	&unsafe, r12
	mov	58(r12), r13
	mov	60(r12), r12
	cmp	r12, r13
	jlo	.LBB5_2
	jmp	.LBB5_1
.LBB5_1:                                ; %if.then
	call	#task_done
.LBB5_2:                                ; %if.end
	clr	0(r1)
	clr	2(r1)
	jmp	.LBB5_3
.LBB5_3:                                ; %for.cond
                                        ; =>This Inner Loop Header: Depth=1
	mov	2(r1), r12
	cmp	#7, r12
	jhs	.LBB5_9
	jmp	.LBB5_4
.LBB5_4:                                ; %for.body
                                        ;   in Loop: Header=BB5_3 Depth=1
	mov	&unsafe, r12
	mov	58(r12), r13
	mov	2(r1), r14
	add	r14, r13
	mov	60(r12), r12
	cmp	r12, r13
	jhs	.LBB5_6
	jmp	.LBB5_5
.LBB5_5:                                ; %cond.true
                                        ;   in Loop: Header=BB5_3 Depth=1
	mov	&unsafe, r12
	mov	58(r12), r12
	mov	2(r1), r13
	add	r13, r12
	mov.b	PLAINTEXT(r12), r12
	jmp	.LBB5_7
.LBB5_6:                                ; %cond.false
                                        ;   in Loop: Header=BB5_3 Depth=1
	mov	#255, r12
	jmp	.LBB5_7
.LBB5_7:                                ; %cond.end
                                        ;   in Loop: Header=BB5_3 Depth=1
	mov	&unsafe, r13
	mov	2(r1), r14
	add	r14, r14
	add	r14, r13
	mov	r12, 64(r13)
	jmp	.LBB5_8
.LBB5_8:                                ; %for.inc
                                        ;   in Loop: Header=BB5_3 Depth=1
	mov	2(r1), r12
	inc	r12
	mov	r12, 2(r1)
	jmp	.LBB5_3
.LBB5_9:                                ; %for.end
	mov	#7, 2(r1)
	jmp	.LBB5_10
.LBB5_10:                               ; %for.cond13
                                        ; =>This Inner Loop Header: Depth=1
	mov	2(r1), r12
	cmp	#8, r12
	jge	.LBB5_13
	jmp	.LBB5_11
.LBB5_11:                               ; %for.body16
                                        ;   in Loop: Header=BB5_10 Depth=1
	mov	&unsafe, r12
	mov	2(r1), r13
	add	r13, r13
	add	r13, r12
	mov	#1, 64(r12)
	jmp	.LBB5_12
.LBB5_12:                               ; %for.inc20
                                        ;   in Loop: Header=BB5_10 Depth=1
	mov	2(r1), r12
	inc	r12
	mov	r12, 2(r1)
	jmp	.LBB5_10
.LBB5_13:                               ; %for.end22
	mov	&unsafe, r12
	mov	0(r1), r13
	add	r13, r13
	add	r13, r12
	mov	#1, 186(r12)
	mov	#1, 2(r1)
	jmp	.LBB5_14
.LBB5_14:                               ; %for.cond25
                                        ; =>This Inner Loop Header: Depth=1
	mov	2(r1), r12
	cmp	#8, r12
	jge	.LBB5_17
	jmp	.LBB5_15
.LBB5_15:                               ; %for.body28
                                        ;   in Loop: Header=BB5_14 Depth=1
	mov	&unsafe, r12
	mov	2(r1), r13
	add	r13, r13
	add	r13, r12
	clr	186(r12)
	jmp	.LBB5_16
.LBB5_16:                               ; %for.inc32
                                        ;   in Loop: Header=BB5_14 Depth=1
	mov	2(r1), r12
	inc	r12
	mov	r12, 2(r1)
	jmp	.LBB5_14
.LBB5_17:                               ; %for.end34
	mov	&unsafe, r12
	mov	#3, 54(r12)
	mov	&unsafe, r12
	mov	58(r12), r13
	add	#7, r13
	mov	r13, 58(r12)
	mov	&unsafe, r12
	mov	#2, 220(r12)
	mov	0(r1), r12
	mov	r12, &zero
	add	#4, r1
	ret
.Lfunc_end5:
	.size	task_pad, .Lfunc_end5-task_pad
                                        ; -- End function
	.globl	task_exp                ; -- Begin function task_exp
	.p2align	1
	.type	task_exp,@function
task_exp:                               ; @task_exp
.Lfunc_begin6:
; %bb.0:                                ; %entry
	mov	&unsafe, r12
	mov.b	54(r12), r12
	bit.b	#1, r12
	jeq	.LBB6_2
	jmp	.LBB6_1
.LBB6_1:                                ; %if.then
	mov	&unsafe, r12
	mov	54(r12), r13
	clrc
	rrc	r13
	mov	r13, 54(r12)
	mov	&unsafe, r12
	clr	220(r12)
	jmp	.LBB6_3
.LBB6_2:                                ; %if.else
	mov	&unsafe, r12
	mov	54(r12), r13
	clrc
	rrc	r13
	mov	r13, 54(r12)
	mov	&unsafe, r12
	mov	#1, 220(r12)
	jmp	.LBB6_3
.LBB6_3:                                ; %if.end
	ret
.Lfunc_end6:
	.size	task_exp, .Lfunc_end6-task_exp
                                        ; -- End function
	.globl	task_mult_block         ; -- Begin function task_mult_block
	.p2align	1
	.type	task_mult_block,@function
task_mult_block:                        ; @task_mult_block
.Lfunc_begin7:
; %bb.0:                                ; %entry
	mov	&unsafe, r12
	clr	222(r12)
	ret
.Lfunc_end7:
	.size	task_mult_block, .Lfunc_end7-task_mult_block
                                        ; -- End function
	.globl	task_mult_block_get_result ; -- Begin function task_mult_block_get_result
	.p2align	1
	.type	task_mult_block_get_result,@function
task_mult_block_get_result:             ; @task_mult_block_get_result
.Lfunc_begin8:
; %bb.0:                                ; %entry
	sub	#4, r1
	mov	#7, 2(r1)
	jmp	.LBB8_1
.LBB8_1:                                ; %for.cond
                                        ; =>This Inner Loop Header: Depth=1
	mov	2(r1), r12
	tst	r12
	jl	.LBB8_4
	jmp	.LBB8_2
.LBB8_2:                                ; %for.body
                                        ;   in Loop: Header=BB8_1 Depth=1
	mov	&unsafe, r12
	mov	2(r1), r13
	add	r13, r13
	add	r13, r12
	mov	22(r12), r13
	mov	r13, 186(r12)
	jmp	.LBB8_3
.LBB8_3:                                ; %for.inc
                                        ;   in Loop: Header=BB8_1 Depth=1
	mov	2(r1), r12
	add	#-1, r12
	mov	r12, 2(r1)
	jmp	.LBB8_1
.LBB8_4:                                ; %for.end
	mov	&unsafe, r12
	mov	54(r12), r12
	tst	r12
	jeq	.LBB8_6
	jmp	.LBB8_5
.LBB8_5:                                ; %if.then
	mov	&unsafe, r12
	mov	#1, 220(r12)
	jmp	.LBB8_13
.LBB8_6:                                ; %if.else
	mov	&unsafe, r12
	mov	62(r12), r12
	add	#8, r12
	cmp	#17, r12
	jhs	.LBB8_12
	jmp	.LBB8_7
.LBB8_7:                                ; %if.then8
	clr	2(r1)
	jmp	.LBB8_8
.LBB8_8:                                ; %for.cond9
                                        ; =>This Inner Loop Header: Depth=1
	mov	2(r1), r12
	cmp	#8, r12
	jge	.LBB8_11
	jmp	.LBB8_9
.LBB8_9:                                ; %for.body11
                                        ;   in Loop: Header=BB8_8 Depth=1
	mov	&unsafe, r12
	mov	62(r12), r12
	mov	r12, 0(r1)
	mov	&unsafe, r12
	add	#22, r12
	mov	2(r1), r13
	add	r13, r13
	mov	r12, r14
	add	r13, r14
	mov	0(r14), r13
	mov	0(r1), r14
	add	r14, r14
	add	r14, r12
	mov	r13, 96(r12)
	mov	&unsafe, r12
	mov	62(r12), r13
	inc	r13
	mov	r13, 62(r12)
	jmp	.LBB8_10
.LBB8_10:                               ; %for.inc21
                                        ;   in Loop: Header=BB8_8 Depth=1
	mov	2(r1), r12
	inc	r12
	mov	r12, 2(r1)
	jmp	.LBB8_8
.LBB8_11:                               ; %for.end23
	jmp	.LBB8_12
.LBB8_12:                               ; %if.end
	mov	&unsafe, r12
	clr	220(r12)
	jmp	.LBB8_13
.LBB8_13:                               ; %if.end26
	add	#4, r1
	ret
.Lfunc_end8:
	.size	task_mult_block_get_result, .Lfunc_end8-task_mult_block_get_result
                                        ; -- End function
	.globl	task_square_base        ; -- Begin function task_square_base
	.p2align	1
	.type	task_square_base,@function
task_square_base:                       ; @task_square_base
.Lfunc_begin9:
; %bb.0:                                ; %entry
	mov	&unsafe, r12
	mov	#1, 222(r12)
	ret
.Lfunc_end9:
	.size	task_square_base, .Lfunc_end9-task_square_base
                                        ; -- End function
	.globl	task_square_base_get_result ; -- Begin function task_square_base_get_result
	.p2align	1
	.type	task_square_base_get_result,@function
task_square_base_get_result:            ; @task_square_base_get_result
.Lfunc_begin10:
; %bb.0:                                ; %entry
	sub	#2, r1
	clr	0(r1)
	jmp	.LBB10_1
.LBB10_1:                               ; %for.cond
                                        ; =>This Inner Loop Header: Depth=1
	mov	0(r1), r12
	cmp	#8, r12
	jge	.LBB10_4
	jmp	.LBB10_2
.LBB10_2:                               ; %for.body
                                        ;   in Loop: Header=BB10_1 Depth=1
	mov	&unsafe, r12
	mov	0(r1), r13
	add	r13, r13
	add	r13, r12
	mov	22(r12), r13
	mov	r13, 64(r12)
	jmp	.LBB10_3
.LBB10_3:                               ; %for.inc
                                        ;   in Loop: Header=BB10_1 Depth=1
	mov	0(r1), r12
	inc	r12
	mov	r12, 0(r1)
	jmp	.LBB10_1
.LBB10_4:                               ; %for.end
	mov	&unsafe, r12
	mov	#2, 220(r12)
	add	#2, r1
	ret
.Lfunc_end10:
	.size	task_square_base_get_result, .Lfunc_end10-task_square_base_get_result
                                        ; -- End function
	.globl	task_mult_mod           ; -- Begin function task_mult_mod
	.p2align	1
	.type	task_mult_mod,@function
task_mult_mod:                          ; @task_mult_mod
.Lfunc_begin11:
; %bb.0:                                ; %entry
	mov	&unsafe, r12
	clr	112(r12)
	mov	&unsafe, r12
	clr	114(r12)
	ret
.Lfunc_end11:
	.size	task_mult_mod, .Lfunc_end11-task_mult_mod
                                        ; -- End function
	.globl	task_mult               ; -- Begin function task_mult
	.p2align	1
	.type	task_mult,@function
task_mult:                              ; @task_mult
.Lfunc_begin12:
; %bb.0:                                ; %entry
	sub	#14, r1
	mov	&unsafe, r12
	mov	114(r12), r12
	mov	r12, 2(r1)
	clr	6(r1)
	clr	12(r1)
	jmp	.LBB12_1
.LBB12_1:                               ; %for.cond
                                        ; =>This Inner Loop Header: Depth=1
	mov	12(r1), r12
	cmp	#8, r12
	jge	.LBB12_7
	jmp	.LBB12_2
.LBB12_2:                               ; %for.body
                                        ;   in Loop: Header=BB12_1 Depth=1
	mov	&unsafe, r12
	mov	112(r12), r12
	mov	12(r1), r13
	sub	r13, r12
	tst	r12
	jlo	.LBB12_5
	jmp	.LBB12_3
.LBB12_3:                               ; %land.lhs.true
                                        ;   in Loop: Header=BB12_1 Depth=1
	mov	&unsafe, r12
	mov	112(r12), r12
	mov	12(r1), r13
	sub	r13, r12
	cmp	#8, r12
	jhs	.LBB12_5
	jmp	.LBB12_4
.LBB12_4:                               ; %if.then
                                        ;   in Loop: Header=BB12_1 Depth=1
	mov	&unsafe, r12
	mov	112(r12), r12
	mov	12(r1), r13
	sub	r13, r12
	mov	r12, 0(r1)
	mov	&unsafe, r12
	mov	0(r1), r13
	add	r13, r13
	add	r13, r12
	mov	64(r12), r12
	mov	r12, 10(r1)
	mov	&unsafe, r12
	mov	12(r1), r13
	add	r13, r13
	add	r13, r12
	mov	186(r12), r12
	mov	r12, 8(r1)
	mov	10(r1), r12
	mov	8(r1), r13
	call	#__mspabi_mpyi
	mov	r12, 4(r1)
	mov.b	5(r1), r12
	mov	6(r1), r13
	add	r12, r13
	mov	r13, 6(r1)
	mov.b	4(r1), r12
	mov	2(r1), r13
	add	r12, r13
	mov	r13, 2(r1)
	jmp	.LBB12_5
.LBB12_5:                               ; %if.end
                                        ;   in Loop: Header=BB12_1 Depth=1
	jmp	.LBB12_6
.LBB12_6:                               ; %for.inc
                                        ;   in Loop: Header=BB12_1 Depth=1
	mov	12(r1), r12
	inc	r12
	mov	r12, 12(r1)
	jmp	.LBB12_1
.LBB12_7:                               ; %for.end
	mov.b	3(r1), r12
	mov	6(r1), r13
	add	r12, r13
	mov	r13, 6(r1)
	mov.b	2(r1), r12
	mov	r12, 2(r1)
	mov	2(r1), r12
	mov	&unsafe, r13
	mov	112(r13), r14
	add	r14, r14
	add	r14, r13
	mov	r12, 22(r13)
	mov	&unsafe, r12
	mov	112(r12), r13
	inc	r13
	mov	r13, 112(r12)
	mov	&unsafe, r12
	mov	112(r12), r12
	cmp	#16, r12
	jhs	.LBB12_9
	jmp	.LBB12_8
.LBB12_8:                               ; %if.then27
	mov	6(r1), r12
	mov	&unsafe, r13
	mov	r12, 114(r13)
	jmp	.LBB12_9
.LBB12_9:                               ; %if.end30
	add	#14, r1
	ret
.Lfunc_end12:
	.size	task_mult, .Lfunc_end12-task_mult
                                        ; -- End function
	.globl	task_reduce_digits      ; -- Begin function task_reduce_digits
	.p2align	1
	.type	task_reduce_digits,@function
task_reduce_digits:                     ; @task_reduce_digits
.Lfunc_begin13:
; %bb.0:                                ; %entry
	sub	#2, r1
	mov	#16, 0(r1)
	jmp	.LBB13_1
.LBB13_1:                               ; %do.body
                                        ; =>This Inner Loop Header: Depth=1
	mov	0(r1), r12
	add	#-1, r12
	mov	r12, 0(r1)
	jmp	.LBB13_2
.LBB13_2:                               ; %do.cond
                                        ;   in Loop: Header=BB13_1 Depth=1
	mov	&unsafe, r12
	mov	0(r1), r13
	add	r13, r13
	add	r13, r12
	mov	22(r12), r13
	clr.b	r12
	tst	r13
	jne	.LBB13_6
	jmp	.LBB13_3
.LBB13_3:                               ; %land.rhs
                                        ;   in Loop: Header=BB13_1 Depth=1
	mov	0(r1), r13
	mov	#1, r12
	cmp	#1, r13
	jge	.LBB13_5
; %bb.4:                                ; %land.rhs
                                        ;   in Loop: Header=BB13_1 Depth=1
	clr	r12
.LBB13_5:                               ; %land.rhs
                                        ;   in Loop: Header=BB13_1 Depth=1
	jmp	.LBB13_6
.LBB13_6:                               ; %land.end
                                        ;   in Loop: Header=BB13_1 Depth=1
	bit	#1, r12
	jne	.LBB13_1
	jmp	.LBB13_7
.LBB13_7:                               ; %do.end
	mov	&unsafe, r12
	mov	0(r1), r13
	add	r13, r13
	add	r13, r12
	mov	22(r12), r12
	tst	r12
	jne	.LBB13_9
	jmp	.LBB13_8
.LBB13_8:                               ; %if.then
	mov	&unsafe, r12
	clr	220(r12)
	jmp	.LBB13_9
.LBB13_9:                               ; %if.end
	mov	0(r1), r12
	mov	&unsafe, r13
	mov	r12, 116(r13)
	mov	&unsafe, r12
	mov	#1, 220(r12)
	add	#2, r1
	ret
.Lfunc_end13:
	.size	task_reduce_digits, .Lfunc_end13-task_reduce_digits
                                        ; -- End function
	.globl	task_reduce_normalizable ; -- Begin function task_reduce_normalizable
	.p2align	1
	.type	task_reduce_normalizable,@function
task_reduce_normalizable:               ; @task_reduce_normalizable
.Lfunc_begin14:
; %bb.0:                                ; %entry
	sub	#10, r1
	mov.b	#1, 7(r1)
	mov	&unsafe, r12
	mov	116(r12), r13
	add	#-7, r13
	mov	r13, 150(r12)
	mov	&unsafe, r12
	mov	116(r12), r12
	mov	r12, 8(r1)
	jmp	.LBB14_1
.LBB14_1:                               ; %for.cond
                                        ; =>This Inner Loop Header: Depth=1
	mov	8(r1), r12
	tst	r12
	jl	.LBB14_12
	jmp	.LBB14_2
.LBB14_2:                               ; %for.body
                                        ;   in Loop: Header=BB14_1 Depth=1
	mov	8(r1), r12
	mov	&unsafe, r13
	mov	150(r13), r13
	sub	r13, r12
	mov	r12, 4(r1)
	mov	&unsafe, r12
	add	#22, r12
	mov	8(r1), r13
	add	r13, r13
	mov	r12, r14
	add	r13, r14
	mov	0(r14), r13
	mov	4(r1), r14
	add	r14, r14
	add	r14, r12
	mov	74(r12), r12
	cmp	r13, r12
	jhs	.LBB14_4
	jmp	.LBB14_3
.LBB14_3:                               ; %if.then
                                        ;   in Loop: Header=BB14_1 Depth=1
	clr	2(r1)
	mov	#2, 0(r1)
	jmp	.LBB14_8
.LBB14_4:                               ; %if.else
                                        ;   in Loop: Header=BB14_1 Depth=1
	mov	&unsafe, r12
	add	#22, r12
	mov	8(r1), r13
	add	r13, r13
	mov	r12, r14
	add	r13, r14
	mov	0(r14), r13
	mov	4(r1), r14
	add	r14, r14
	add	r14, r12
	mov	74(r12), r12
	cmp	r12, r13
	jhs	.LBB14_6
	jmp	.LBB14_5
.LBB14_5:                               ; %if.then18
                                        ;   in Loop: Header=BB14_1 Depth=1
	clr.b	7(r1)
	clr	2(r1)
	mov	#2, 0(r1)
	jmp	.LBB14_8
.LBB14_6:                               ; %if.end
                                        ;   in Loop: Header=BB14_1 Depth=1
	jmp	.LBB14_7
.LBB14_7:                               ; %if.end19
                                        ;   in Loop: Header=BB14_1 Depth=1
	clr	2(r1)
	clr	0(r1)
	jmp	.LBB14_8
.LBB14_8:                               ; %cleanup
                                        ;   in Loop: Header=BB14_1 Depth=1
	mov	2(r1), r12
	mov	0(r1), r13
	bis	r12, r13
	tst	r13
	jeq	.LBB14_10
	jmp	.LBB14_9
.LBB14_9:                               ; %cleanup
	jmp	.LBB14_12
.LBB14_10:                              ; %cleanup.cont
                                        ;   in Loop: Header=BB14_1 Depth=1
	jmp	.LBB14_11
.LBB14_11:                              ; %for.inc
                                        ;   in Loop: Header=BB14_1 Depth=1
	mov	8(r1), r12
	add	#-1, r12
	mov	r12, 8(r1)
	jmp	.LBB14_1
.LBB14_12:                              ; %for.end
	mov.b	7(r1), r12
	bit	#1, r12
	jne	.LBB14_15
	jmp	.LBB14_13
.LBB14_13:                              ; %land.lhs.true
	mov	&unsafe, r12
	mov	116(r12), r12
	cmp	#7, r12
	jne	.LBB14_15
	jmp	.LBB14_14
.LBB14_14:                              ; %if.then23
	mov	&unsafe, r12
	clr	220(r12)
	jmp	.LBB14_15
.LBB14_15:                              ; %if.end25
	mov.b	7(r1), r12
	cmp.b	#1, r12
	jne	.LBB14_17
	jmp	.LBB14_16
.LBB14_16:                              ; %if.then27
	mov	&unsafe, r12
	mov	#1, 220(r12)
	jmp	.LBB14_18
.LBB14_17:                              ; %if.else30
	mov	&unsafe, r12
	mov	#2, 220(r12)
	jmp	.LBB14_18
.LBB14_18:                              ; %if.end33
	add	#10, r1
	ret
.Lfunc_end14:
	.size	task_reduce_normalizable, .Lfunc_end14-task_reduce_normalizable
                                        ; -- End function
	.globl	task_reduce_normalize   ; -- Begin function task_reduce_normalize
	.p2align	1
	.type	task_reduce_normalize,@function
task_reduce_normalize:                  ; @task_reduce_normalize
.Lfunc_begin15:
; %bb.0:                                ; %entry
	sub	#14, r1
	clr	4(r1)
	clr	2(r1)
	jmp	.LBB15_1
.LBB15_1:                               ; %for.cond
                                        ; =>This Inner Loop Header: Depth=1
	mov	2(r1), r12
	cmp	#8, r12
	jge	.LBB15_7
	jmp	.LBB15_2
.LBB15_2:                               ; %for.body
                                        ;   in Loop: Header=BB15_1 Depth=1
	mov	2(r1), r12
	mov	&unsafe, r13
	mov	150(r13), r13
	add	r13, r12
	mov	r12, 0(r1)
	mov	&unsafe, r12
	mov	0(r1), r13
	add	r13, r13
	add	r13, r12
	mov	22(r12), r12
	mov	r12, 12(r1)
	mov	&unsafe, r12
	mov	2(r1), r13
	add	r13, r13
	add	r13, r12
	mov	96(r12), r12
	mov	r12, 10(r1)
	mov	10(r1), r12
	mov	4(r1), r13
	add	r13, r12
	mov	r12, 6(r1)
	mov	12(r1), r12
	mov	6(r1), r13
	cmp	r13, r12
	jhs	.LBB15_4
	jmp	.LBB15_3
.LBB15_3:                               ; %if.then
                                        ;   in Loop: Header=BB15_1 Depth=1
	mov	12(r1), r12
	add	#256, r12
	mov	r12, 12(r1)
	mov	#1, 4(r1)
	jmp	.LBB15_5
.LBB15_4:                               ; %if.else
                                        ;   in Loop: Header=BB15_1 Depth=1
	clr	4(r1)
	jmp	.LBB15_5
.LBB15_5:                               ; %if.end
                                        ;   in Loop: Header=BB15_1 Depth=1
	mov	12(r1), r12
	mov	6(r1), r13
	sub	r13, r12
	mov	r12, 8(r1)
	mov	8(r1), r12
	mov	&unsafe, r13
	mov	0(r1), r14
	add	r14, r14
	add	r14, r13
	mov	r12, 22(r13)
	jmp	.LBB15_6
.LBB15_6:                               ; %for.inc
                                        ;   in Loop: Header=BB15_1 Depth=1
	mov	2(r1), r12
	inc	r12
	mov	r12, 2(r1)
	jmp	.LBB15_1
.LBB15_7:                               ; %for.end
	mov	&unsafe, r12
	mov	150(r12), r12
	tst	r12
	jeq	.LBB15_9
	jmp	.LBB15_8
.LBB15_8:                               ; %if.then13
	mov	&unsafe, r12
	mov	#2, 220(r12)
	jmp	.LBB15_10
.LBB15_9:                               ; %if.else15
	mov	&unsafe, r12
	clr	220(r12)
	jmp	.LBB15_10
.LBB15_10:                              ; %if.end18
	add	#14, r1
	ret
.Lfunc_end15:
	.size	task_reduce_normalize, .Lfunc_end15-task_reduce_normalize
                                        ; -- End function
	.globl	task_reduce_n_divisor   ; -- Begin function task_reduce_n_divisor
	.p2align	1
	.type	task_reduce_n_divisor,@function
task_reduce_n_divisor:                  ; @task_reduce_n_divisor
.Lfunc_begin16:
; %bb.0:                                ; %entry
	sub	#4, r1
	mov	#7, 2(r1)
	mov	#6, 0(r1)
	mov	&unsafe, r12
	mov	r12, r13
	add	#96, r13
	mov	2(r1), r14
	add	r14, r14
	mov	r13, r15
	add	r14, r15
	mov.b	0(r15), r14
	swpb	r14
	mov	0(r1), r15
	add	r15, r15
	add	r15, r13
	mov	0(r13), r13
	add	r13, r14
	mov	r14, 152(r12)
	add	#4, r1
	ret
.Lfunc_end16:
	.size	task_reduce_n_divisor, .Lfunc_end16-task_reduce_n_divisor
                                        ; -- End function
	.globl	task_reduce_quotient    ; -- Begin function task_reduce_quotient
	.p2align	1
	.type	task_reduce_quotient,@function
task_reduce_quotient:                   ; @task_reduce_quotient
.Lfunc_begin17:
; %bb.0:                                ; %entry
	push	r10
	sub	#14, r1
	mov	#7, 4(r1)
	mov	&unsafe, r12
	mov	116(r12), r12
	add	#-1, r12
	mov	r12, 2(r1)
	mov	&unsafe, r12
	mov	116(r12), r12
	add	#-2, r12
	mov	r12, 0(r1)
	mov	&unsafe, r12
	mov	r12, r13
	add	#22, r13
	mov	116(r12), r12
	add	r12, r12
	mov	r13, r14
	add	r12, r14
	mov	0(r14), r12
	mov	4(r1), r14
	add	r14, r14
	add	r14, r13
	mov	74(r13), r13
	cmp	r13, r12
	jne	.LBB17_2
	jmp	.LBB17_1
.LBB17_1:                               ; %if.then
	mov	&unsafe, r12
	mov	#255, 218(r12)
	jmp	.LBB17_3
.LBB17_2:                               ; %if.else
	mov	&unsafe, r10
	mov	r10, r13
	add	#22, r13
	mov	116(r10), r12
	add	r12, r12
	mov	r13, r14
	add	r12, r14
	mov.b	0(r14), r12
	swpb	r12
	mov	2(r1), r14
	add	r14, r14
	mov	r13, r15
	add	r14, r15
	mov	0(r15), r14
	add	r14, r12
	mov	4(r1), r14
	add	r14, r14
	add	r14, r13
	mov	74(r13), r13
	call	#__mspabi_divu
	mov	r12, 218(r10)
	jmp	.LBB17_3
.LBB17_3:                               ; %if.end
	mov	&unsafe, r12
	mov	r12, r13
	add	#22, r13
	mov	116(r12), r12
	add	r12, r12
	mov	r13, r14
	add	r12, r14
	mov	0(r14), r12
	mov	2(r1), r14
	add	r14, r14
	mov	r13, r15
	add	r14, r15
	mov.b	0(r15), r14
	swpb	r14
	mov	0(r1), r15
	add	r15, r15
	add	r15, r13
	mov	0(r13), r13
	mov	r14, r15
	add	r13, r15
	cmp	r14, r15
	mov	#1, r13
	bic	r2, r13
	add	r13, r12
	mov	r15, 6(r1)
	mov	r12, 8(r1)
	mov	&unsafe, r12
	mov	218(r12), r13
	inc	r13
	mov	r13, 218(r12)
	jmp	.LBB17_4
.LBB17_4:                               ; %do.body
                                        ; =>This Inner Loop Header: Depth=1
	mov	&unsafe, r12
	mov	218(r12), r13
	add	#-1, r13
	mov	r13, 218(r12)
	mov	&unsafe, r13
	mov	152(r13), r12
	mov	218(r13), r13
	call	#__mspabi_mpyi
	mov	r12, 10(r1)
	clr	12(r1)
	jmp	.LBB17_5
.LBB17_5:                               ; %do.cond
                                        ;   in Loop: Header=BB17_4 Depth=1
	mov	10(r1), r14
	mov	12(r1), r15
	mov	6(r1), r11
	mov	8(r1), r10
	cmp	r15, r10
	mov	#1, r12
	mov	#1, r13
	bic	r2, r13
	cmp	r14, r11
	bic	r2, r12
	cmp	r10, r15
	jeq	.LBB17_7
; %bb.6:                                ; %do.cond
                                        ;   in Loop: Header=BB17_4 Depth=1
	mov	r13, r12
.LBB17_7:                               ; %do.cond
                                        ;   in Loop: Header=BB17_4 Depth=1
	bit	#1, r12
	jne	.LBB17_4
	jmp	.LBB17_8
.LBB17_8:                               ; %do.end
	mov	&unsafe, r12
	mov	116(r12), r13
	add	#-1, r13
	mov	r13, 116(r12)
	add	#14, r1
	pop	r10
	ret
.Lfunc_end17:
	.size	task_reduce_quotient, .Lfunc_end17-task_reduce_quotient
                                        ; -- End function
	.globl	task_reduce_multiply    ; -- Begin function task_reduce_multiply
	.p2align	1
	.type	task_reduce_multiply,@function
task_reduce_multiply:                   ; @task_reduce_multiply
.Lfunc_begin18:
; %bb.0:                                ; %entry
	sub	#12, r1
	mov	&unsafe, r12
	mov	116(r12), r12
	add	#-7, r12
	mov	r12, 2(r1)
	clr	10(r1)
	jmp	.LBB18_1
.LBB18_1:                               ; %for.cond
                                        ; =>This Inner Loop Header: Depth=1
	mov	10(r1), r12
	mov	2(r1), r13
	cmp	r13, r12
	jhs	.LBB18_4
	jmp	.LBB18_2
.LBB18_2:                               ; %for.body
                                        ;   in Loop: Header=BB18_1 Depth=1
	mov	&unsafe, r12
	mov	10(r1), r13
	add	r13, r13
	add	r13, r12
	clr	154(r12)
	jmp	.LBB18_3
.LBB18_3:                               ; %for.inc
                                        ;   in Loop: Header=BB18_1 Depth=1
	mov	10(r1), r12
	inc	r12
	mov	r12, 10(r1)
	jmp	.LBB18_1
.LBB18_4:                               ; %for.end
	clr	4(r1)
	mov	2(r1), r12
	mov	r12, 10(r1)
	jmp	.LBB18_5
.LBB18_5:                               ; %for.cond2
                                        ; =>This Inner Loop Header: Depth=1
	mov	10(r1), r12
	cmp	#16, r12
	jge	.LBB18_11
	jmp	.LBB18_6
.LBB18_6:                               ; %for.body4
                                        ;   in Loop: Header=BB18_5 Depth=1
	mov	4(r1), r12
	mov	r12, 8(r1)
	mov	10(r1), r12
	mov	2(r1), r13
	add	#8, r13
	cmp	r13, r12
	jhs	.LBB18_8
	jmp	.LBB18_7
.LBB18_7:                               ; %if.then
                                        ;   in Loop: Header=BB18_5 Depth=1
	mov	10(r1), r12
	mov	2(r1), r13
	sub	r13, r12
	mov	r12, 0(r1)
	mov	&unsafe, r12
	mov	0(r1), r13
	add	r13, r13
	add	r13, r12
	mov	96(r12), r12
	mov	r12, 6(r1)
	mov	&unsafe, r12
	mov	218(r12), r12
	mov	6(r1), r13
	call	#__mspabi_mpyi
	mov	8(r1), r13
	add	r12, r13
	mov	r13, 8(r1)
	jmp	.LBB18_9
.LBB18_8:                               ; %if.else
                                        ;   in Loop: Header=BB18_5 Depth=1
	clr	6(r1)
	jmp	.LBB18_9
.LBB18_9:                               ; %if.end
                                        ;   in Loop: Header=BB18_5 Depth=1
	mov.b	9(r1), r12
	mov	r12, 4(r1)
	mov.b	8(r1), r12
	mov	r12, 8(r1)
	mov	8(r1), r12
	mov	&unsafe, r13
	mov	10(r1), r14
	add	r14, r14
	add	r14, r13
	mov	r12, 154(r13)
	jmp	.LBB18_10
.LBB18_10:                              ; %for.inc15
                                        ;   in Loop: Header=BB18_5 Depth=1
	mov	10(r1), r12
	inc	r12
	mov	r12, 10(r1)
	jmp	.LBB18_5
.LBB18_11:                              ; %for.end17
	add	#12, r1
	ret
.Lfunc_end18:
	.size	task_reduce_multiply, .Lfunc_end18-task_reduce_multiply
                                        ; -- End function
	.globl	task_reduce_compare     ; -- Begin function task_reduce_compare
	.p2align	1
	.type	task_reduce_compare,@function
task_reduce_compare:                    ; @task_reduce_compare
.Lfunc_begin19:
; %bb.0:                                ; %entry
	sub	#4, r1
	mov.b	#61, 1(r1)
	mov	#15, 2(r1)
	jmp	.LBB19_1
.LBB19_1:                               ; %for.cond
                                        ; =>This Inner Loop Header: Depth=1
	mov	2(r1), r12
	tst	r12
	jl	.LBB19_9
	jmp	.LBB19_2
.LBB19_2:                               ; %for.body
                                        ;   in Loop: Header=BB19_1 Depth=1
	mov	&unsafe, r12
	mov	2(r1), r13
	add	r13, r13
	add	r13, r12
	mov	22(r12), r13
	mov	154(r12), r12
	cmp	r13, r12
	jhs	.LBB19_4
	jmp	.LBB19_3
.LBB19_3:                               ; %if.then
	mov.b	#62, 1(r1)
	jmp	.LBB19_10
.LBB19_4:                               ; %if.else
                                        ;   in Loop: Header=BB19_1 Depth=1
	mov	&unsafe, r12
	mov	2(r1), r13
	add	r13, r13
	add	r13, r12
	mov	22(r12), r13
	mov	154(r12), r12
	cmp	r12, r13
	jhs	.LBB19_6
	jmp	.LBB19_5
.LBB19_5:                               ; %if.then11
	mov.b	#60, 1(r1)
	jmp	.LBB19_10
.LBB19_6:                               ; %if.end
                                        ;   in Loop: Header=BB19_1 Depth=1
	jmp	.LBB19_7
.LBB19_7:                               ; %if.end12
                                        ;   in Loop: Header=BB19_1 Depth=1
	jmp	.LBB19_8
.LBB19_8:                               ; %for.inc
                                        ;   in Loop: Header=BB19_1 Depth=1
	mov	2(r1), r12
	add	#-1, r12
	mov	r12, 2(r1)
	jmp	.LBB19_1
.LBB19_9:                               ; %for.end.loopexit
	jmp	.LBB19_10
.LBB19_10:                              ; %for.end
	mov.b	1(r1), r12
	cmp.b	#60, r12
	jne	.LBB19_12
	jmp	.LBB19_11
.LBB19_11:                              ; %if.then15
	mov	&unsafe, r12
	clr	220(r12)
	jmp	.LBB19_12
.LBB19_12:                              ; %if.end17
	add	#4, r1
	ret
.Lfunc_end19:
	.size	task_reduce_compare, .Lfunc_end19-task_reduce_compare
                                        ; -- End function
	.globl	task_reduce_add         ; -- Begin function task_reduce_add
	.p2align	1
	.type	task_reduce_add,@function
task_reduce_add:                        ; @task_reduce_add
.Lfunc_begin20:
; %bb.0:                                ; %entry
	sub	#12, r1
	mov	&unsafe, r12
	mov	116(r12), r12
	add	#-7, r12
	mov	r12, 0(r1)
	clr	2(r1)
	mov	0(r1), r12
	mov	r12, 10(r1)
	jmp	.LBB20_1
.LBB20_1:                               ; %for.cond
                                        ; =>This Inner Loop Header: Depth=1
	mov	10(r1), r12
	cmp	#16, r12
	jge	.LBB20_7
	jmp	.LBB20_2
.LBB20_2:                               ; %for.body
                                        ;   in Loop: Header=BB20_1 Depth=1
	mov	&unsafe, r12
	mov	10(r1), r13
	add	r13, r13
	add	r13, r12
	mov	22(r12), r12
	mov	r12, 6(r1)
	mov	10(r1), r12
	mov	0(r1), r13
	sub	r13, r12
	mov	r12, 8(r1)
	mov	10(r1), r12
	mov	0(r1), r13
	add	#8, r13
	cmp	r13, r12
	jhs	.LBB20_4
	jmp	.LBB20_3
.LBB20_3:                               ; %if.then
                                        ;   in Loop: Header=BB20_1 Depth=1
	mov	&unsafe, r12
	mov	8(r1), r13
	add	r13, r13
	add	r13, r12
	mov	96(r12), r12
	mov	r12, 4(r1)
	jmp	.LBB20_5
.LBB20_4:                               ; %if.else
                                        ;   in Loop: Header=BB20_1 Depth=1
	clr	4(r1)
	clr	8(r1)
	jmp	.LBB20_5
.LBB20_5:                               ; %if.end
                                        ;   in Loop: Header=BB20_1 Depth=1
	mov	2(r1), r12
	mov	6(r1), r13
	add	r13, r12
	mov	4(r1), r13
	add	r13, r12
	mov	&unsafe, r13
	mov	10(r1), r14
	add	r14, r14
	add	r14, r13
	mov	r12, 22(r13)
	mov	&unsafe, r12
	mov	10(r1), r13
	add	r13, r13
	add	r13, r12
	mov.b	23(r12), r12
	mov	r12, 2(r1)
	mov	&unsafe, r12
	mov	10(r1), r13
	add	r13, r13
	add	r13, r12
	mov.b	22(r12), r13
	mov	r13, 22(r12)
	jmp	.LBB20_6
.LBB20_6:                               ; %for.inc
                                        ;   in Loop: Header=BB20_1 Depth=1
	mov	10(r1), r12
	inc	r12
	mov	r12, 10(r1)
	jmp	.LBB20_1
.LBB20_7:                               ; %for.end
	add	#12, r1
	ret
.Lfunc_end20:
	.size	task_reduce_add, .Lfunc_end20-task_reduce_add
                                        ; -- End function
	.globl	task_reduce_subtract    ; -- Begin function task_reduce_subtract
	.p2align	1
	.type	task_reduce_subtract,@function
task_reduce_subtract:                   ; @task_reduce_subtract
.Lfunc_begin21:
; %bb.0:                                ; %entry
	sub	#12, r1
	mov	&unsafe, r12
	mov	116(r12), r12
	add	#-7, r12
	mov	r12, 0(r1)
	clr	2(r1)
	clr	10(r1)
	jmp	.LBB21_1
.LBB21_1:                               ; %for.cond
                                        ; =>This Inner Loop Header: Depth=1
	mov	10(r1), r12
	cmp	#16, r12
	jge	.LBB21_9
	jmp	.LBB21_2
.LBB21_2:                               ; %for.body
                                        ;   in Loop: Header=BB21_1 Depth=1
	mov	&unsafe, r12
	mov	10(r1), r13
	add	r13, r13
	add	r13, r12
	mov	22(r12), r12
	mov	r12, 8(r1)
	mov	10(r1), r12
	mov	0(r1), r13
	cmp	r13, r12
	jlo	.LBB21_7
	jmp	.LBB21_3
.LBB21_3:                               ; %if.then
                                        ;   in Loop: Header=BB21_1 Depth=1
	mov	&unsafe, r12
	mov	10(r1), r13
	add	r13, r13
	add	r13, r12
	mov	154(r12), r12
	mov	r12, 4(r1)
	mov	4(r1), r12
	mov	2(r1), r13
	add	r13, r12
	mov	r12, 6(r1)
	mov	8(r1), r12
	mov	6(r1), r13
	cmp	r13, r12
	jhs	.LBB21_5
	jmp	.LBB21_4
.LBB21_4:                               ; %if.then7
                                        ;   in Loop: Header=BB21_1 Depth=1
	mov	8(r1), r12
	add	#256, r12
	mov	r12, 8(r1)
	mov	#1, 2(r1)
	jmp	.LBB21_6
.LBB21_5:                               ; %if.else
                                        ;   in Loop: Header=BB21_1 Depth=1
	clr	2(r1)
	jmp	.LBB21_6
.LBB21_6:                               ; %if.end
                                        ;   in Loop: Header=BB21_1 Depth=1
	mov	8(r1), r12
	mov	6(r1), r13
	sub	r13, r12
	mov	&unsafe, r13
	mov	10(r1), r14
	add	r14, r14
	add	r14, r13
	mov	r12, 22(r13)
	jmp	.LBB21_7
.LBB21_7:                               ; %if.end13
                                        ;   in Loop: Header=BB21_1 Depth=1
	jmp	.LBB21_8
.LBB21_8:                               ; %for.inc
                                        ;   in Loop: Header=BB21_1 Depth=1
	mov	10(r1), r12
	inc	r12
	mov	r12, 10(r1)
	jmp	.LBB21_1
.LBB21_9:                               ; %for.end
	add	#12, r1
	ret
.Lfunc_end21:
	.size	task_reduce_subtract, .Lfunc_end21-task_reduce_subtract
                                        ; -- End function
	.globl	task_commit             ; -- Begin function task_commit
	.p2align	1
	.type	task_commit,@function
task_commit:                            ; @task_commit
.Lfunc_begin22:
; %bb.0:                                ; %entry
	ret
.Lfunc_end22:
	.size	task_commit, .Lfunc_end22-task_commit
                                        ; -- End function
	.globl	main                    ; -- Begin function main
	.p2align	1
	.type	main,@function
main:                                   ; @main
.Lfunc_begin23:
; %bb.0:                                ; %entry
	push	r10
	push	r9
	mov	#23168, &WDTCTL
	bis.b	#1, &PADIR_L
	and.b	#-2, &PAOUT_L
	and	#-2, &PM5CTL0
	mov.b	#-91, &CSCTL0_H
	mov	#64, &CSCTL1
	mov	#307, &CSCTL2
	mov	#camel+2, &safe
	mov	#1, &camel
	mov	#camel+228, &unsafe
	clr	&CSCTL3
	clr.b	&CSCTL0_H
	mov	#-23296, &FRCTL0
.LBB23_1:                               ; %while.body
                                        ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB23_3 Depth 2
                                        ;       Child Loop BB23_13 Depth 3
                                        ;       Child Loop BB23_20 Depth 3
	call	#task_init
	call	#commit
	mov	#22, r12
	add	&unsafe, r12
	mov	&safe, r10
	mov	r10, r13
	add	#22, r13
	mov	#202, r14
	call	#memcpy
	jmp	.LBB23_3
.LBB23_2:                               ; %if.then52
                                        ;   in Loop: Header=BB23_3 Depth=2
	call	#task_square_base_get_result
	call	#commit
	mov	&safe, r10
	mov	&unsafe, r9
	mov	r9, r12
	add	#64, r12
	mov	r10, r13
	add	#64, r13
	mov	#32, r14
	call	#memcpy
	mov	220(r10), 220(r9)
.LBB23_3:                               ; %while.body2
                                        ;   Parent Loop BB23_1 Depth=1
                                        ; =>  This Loop Header: Depth=2
                                        ;       Child Loop BB23_13 Depth 3
                                        ;       Child Loop BB23_20 Depth 3
	mov	220(r10), r12
	tst	r12
	jeq	.LBB23_8
; %bb.4:                                ; %if.end
                                        ;   in Loop: Header=BB23_3 Depth=2
	cmp	#2, r12
	jeq	.LBB23_9
.LBB23_5:                               ; %if.end7
                                        ;   in Loop: Header=BB23_3 Depth=2
	cmp	#1, r12
	jeq	.LBB23_10
.LBB23_6:                               ; %if.end7
                                        ;   in Loop: Header=BB23_3 Depth=2
	tst	r12
	jne	.LBB23_12
; %bb.7:                                ; %if.then11
                                        ;   in Loop: Header=BB23_3 Depth=2
	call	#task_mult_block
	jmp	.LBB23_11
.LBB23_8:                               ; %if.then
                                        ;   in Loop: Header=BB23_3 Depth=2
	call	#task_pad
	call	#commit
	mov	&safe, r10
	mov	&unsafe, r9
	mov	r9, r12
	add	#64, r12
	mov	r10, r13
	add	#64, r13
	mov	#32, r14
	call	#memcpy
	mov	&zero, r12
	add	r12, r12
	add	r12, r10
	add	r9, r12
	mov	186(r10), 186(r12)
	mov	&safe, r10
	mov	&unsafe, r9
	mov	r9, r12
	add	#186, r12
	mov	r10, r13
	add	#186, r13
	mov	#32, r14
	call	#memcpy
	mov	54(r10), 54(r9)
	mov	58(r10), 58(r9)
	mov	220(r10), 220(r9)
	mov	220(r10), r12
	cmp	#2, r12
	jne	.LBB23_5
.LBB23_9:                               ; %if.then6
                                        ;   in Loop: Header=BB23_3 Depth=2
	call	#task_exp
	call	#commit
	mov	&unsafe, r12
	mov	&safe, r13
	mov	54(r13), 54(r12)
	mov	220(r13), 220(r12)
	mov	220(r13), r12
	cmp	#1, r12
	jne	.LBB23_6
.LBB23_10:                              ; %if.then15
                                        ;   in Loop: Header=BB23_3 Depth=2
	call	#task_square_base
.LBB23_11:                              ; %if.end17.sink.split
                                        ;   in Loop: Header=BB23_3 Depth=2
	call	#commit
	mov	&unsafe, r12
	mov	&safe, r13
	mov	222(r13), 222(r12)
.LBB23_12:                              ; %if.end17
                                        ;   in Loop: Header=BB23_3 Depth=2
	call	#task_mult_mod
	call	#commit
	mov	&unsafe, r12
	mov	&safe, r13
	mov	112(r13), 112(r12)
	mov	114(r13), 114(r12)
.LBB23_13:                              ; %do.body
                                        ;   Parent Loop BB23_1 Depth=1
                                        ;     Parent Loop BB23_3 Depth=2
                                        ; =>    This Inner Loop Header: Depth=3
	call	#task_mult
	call	#commit
	mov	&unsafe, r12
	mov	112(r12), r13
	add	r13, r13
	add	r13, r12
	add	&safe, r13
	mov	22(r13), 22(r12)
	mov	&unsafe, r12
	mov	&safe, r13
	mov	112(r13), 112(r12)
	mov	114(r13), 114(r12)
	cmp	#16, 112(r13)
	jlo	.LBB23_13
; %bb.14:                               ; %do.end
                                        ;   in Loop: Header=BB23_3 Depth=2
	call	#task_reduce_digits
	call	#commit
	mov	&unsafe, r12
	mov	&safe, r13
	mov	220(r13), 220(r12)
	mov	116(r13), 116(r12)
	tst	220(r13)
	jeq	.LBB23_1
; %bb.15:                               ; %if.end24
                                        ;   in Loop: Header=BB23_3 Depth=2
	call	#task_reduce_normalizable
	call	#commit
	mov	&unsafe, r12
	mov	&safe, r10
	mov	150(r10), 150(r12)
	mov	220(r10), 220(r12)
	mov	220(r10), r12
	cmp	#1, r12
	jne	.LBB23_17
; %bb.16:                               ; %if.then28
                                        ;   in Loop: Header=BB23_3 Depth=2
	call	#task_reduce_normalize
	call	#commit
	mov	&safe, r10
	mov	&unsafe, r9
	mov	r9, r12
	add	#22, r12
	mov	r10, r13
	add	#22, r13
	mov	#32, r14
	call	#memcpy
	mov	220(r10), 220(r9)
	mov	220(r10), r12
.LBB23_17:                              ; %if.end29
                                        ;   in Loop: Header=BB23_3 Depth=2
	cmp	#2, r12
	jne	.LBB23_22
; %bb.18:                               ; %if.then33
                                        ;   in Loop: Header=BB23_3 Depth=2
	call	#task_reduce_n_divisor
	call	#commit
	mov	&unsafe, r12
	mov	&safe, r13
	mov	152(r13), 152(r12)
	jmp	.LBB23_20
.LBB23_19:                              ; %if.end39
                                        ;   in Loop: Header=BB23_20 Depth=3
	call	#task_reduce_subtract
	call	#commit
	mov	#22, r12
	add	&unsafe, r12
	mov	&safe, r10
	mov	r10, r13
	add	#22, r13
	mov	#32, r14
	call	#memcpy
	mov	#1, r12
	add	116(r10), r12
	cmp	#9, r12
	jlo	.LBB23_22
.LBB23_20:                              ; %do.body34
                                        ;   Parent Loop BB23_1 Depth=1
                                        ;     Parent Loop BB23_3 Depth=2
                                        ; =>    This Inner Loop Header: Depth=3
	call	#task_reduce_quotient
	call	#commit
	mov	&unsafe, r12
	mov	&safe, r13
	mov	218(r13), 218(r12)
	mov	116(r13), 116(r12)
	call	#task_reduce_multiply
	call	#commit
	mov	#154, r13
	add	&safe, r13
	mov	#154, r12
	add	&unsafe, r12
	mov	#32, r14
	call	#memcpy
	call	#task_reduce_compare
	call	#commit
	mov	&unsafe, r12
	mov	&safe, r13
	mov	220(r13), 220(r12)
	tst	220(r13)
	jne	.LBB23_19
; %bb.21:                               ; %if.then38
                                        ;   in Loop: Header=BB23_20 Depth=3
	call	#task_reduce_compare
	call	#commit
	mov	&unsafe, r12
	mov	&safe, r13
	mov	220(r13), 220(r12)
	jmp	.LBB23_19
.LBB23_22:                              ; %if.end44
                                        ;   in Loop: Header=BB23_3 Depth=2
	mov	222(r10), r12
	cmp	#1, r12
	jeq	.LBB23_2
; %bb.23:                               ; %if.end44
                                        ;   in Loop: Header=BB23_3 Depth=2
	tst	r12
	jne	.LBB23_3
; %bb.24:                               ; %if.then47
                                        ;   in Loop: Header=BB23_3 Depth=2
	call	#task_mult_block_get_result
	call	#commit
	mov	&safe, r10
	mov	&unsafe, r9
	mov	r9, r12
	add	#186, r12
	mov	r10, r13
	add	#186, r13
	mov	#32, r14
	call	#memcpy
	mov	220(r10), 220(r9)
	mov	r9, r12
	add	#118, r12
	mov	r10, r13
	add	#118, r13
	mov	#32, r14
	call	#memcpy
	mov	62(r10), 62(r9)
	jmp	.LBB23_3
.Lfunc_end23:
	.size	main, .Lfunc_end23-main
                                        ; -- End function
	.type	camel,@object           ; @camel
	.comm	camel,454,2
	.type	safe,@object            ; @safe
	.comm	safe,2,2
	.type	unsafe,@object          ; @unsafe
	.comm	unsafe,2,2
	.type	tmp_stack_crc,@object   ; @tmp_stack_crc
	.comm	tmp_stack_crc,2,2
	.type	tmp_stack_buf_crc,@object ; @tmp_stack_buf_crc
	.comm	tmp_stack_buf_crc,2,2
	.type	pubkey,@object          ; @pubkey
	.section	.rodata,"a",@progbits
	.p2align	1
pubkey:
	.ascii	"\025p\366B\016\202q\246"
	.short	3                       ; 0x3
	.size	pubkey, 10

	.type	PLAINTEXT,@object       ; @PLAINTEXT
	.section	.rodata.str1.1,"aMS",@progbits,1
PLAINTEXT:
	.asciz	".RRRSSSAAA."
	.size	PLAINTEXT, 12

	.type	reset_vector,@object    ; @reset_vector
	.section	__interrupt_vector_56,"aw",@progbits
	.p2align	1
reset_vector:
	.short	camel_recover
	.size	reset_vector, 2

	.type	buf,@object             ; @buf
	.comm	buf,22,2
	.type	zero,@object            ; @zero
	.comm	zero,2,2

	.ident	"clang version 10.0.0 (https://github.com/llvm/llvm-project.git f79f68975d51b389d9f141aa30ab47723a75a868)"
	.section	".note.GNU-stack","",@progbits
