	.text
	.file	"camel_rsa.c"
	.globl	camel_init              ; -- Begin function camel_init
	.p2align	1
	.type	camel_init,@function
camel_init:                             ; @camel_init
.Lfunc_begin0:
; %bb.0:                                ; %entry
	mov	#23168, &WDTCTL
	mov.b	&PADIR_L, r12
	bis.b	#1, r12
	mov.b	r12, &PADIR_L
	mov.b	&PAOUT_L, r12
	and.b	#-2, r12
	mov.b	r12, &PAOUT_L
	mov	&PM5CTL0, r12
	and	#-2, r12
	mov	r12, &PM5CTL0
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
	sub	#8, r1
	mov	&camel, r12
	cmp	#1, r12
	jne	.LBB1_2
	jmp	.LBB1_1
.LBB1_1:                                ; %if.then
	mov	#camel+2, &safe
	mov	#camel+348, &unsafe
	jmp	.LBB1_6
.LBB1_2:                                ; %if.else
	mov	&camel, r12
	cmp	#2, r12
	jne	.LBB1_4
	jmp	.LBB1_3
.LBB1_3:                                ; %if.then2
	mov	#camel+348, &safe
	mov	#camel+2, &unsafe
	jmp	.LBB1_5
.LBB1_4:                                ; %if.else3
	call	#__crt0_start
	jmp	.LBB1_5
.LBB1_5:                                ; %if.end
	jmp	.LBB1_6
.LBB1_6:                                ; %if.end4
	mov	&safe, r12
	mov	18(r12), r12
	;APP
	mov	r12, r1
	;NO_APP
	;APP
	mov	r1, r12
	;NO_APP
	mov	r12, 6(r1)
	mov	6(r1), r12
	mov	r12, 4(r1)
	mov	4(r1), r12
	incd	r12
	;APP
	mov	r1, r13
	;NO_APP
	mov	r13, 2(r1)
	mov	2(r1), r13
	mov	r13, 0(r1)
	mov	0(r1), r14
	mov	#9214, r13
	sub	r14, r13
	mov	#-1, r14
	call	#__fast_hw_crc
	mov	r12, &tmp_stack_crc
	mov	&safe, r12
	mov	&tmp_stack_crc, r14
	mov	#344, r13
	call	#__fast_hw_crc
	mov	r12, &tmp_stack_buf_crc
	mov	&tmp_stack_buf_crc, r12
	mov	&safe, r13
	mov	344(r13), r13
	cmp	r13, r12
	jne	.LBB1_8
	jmp	.LBB1_7
.LBB1_7:                                ; %if.then10
	mov	&unsafe, r12
	mov	&safe, r13
	mov	#346, r14
	call	#memcpy
	call	#camel_init
	mov	&safe, r12
	call	#__restore_registers
	jmp	.LBB1_9
.LBB1_8:                                ; %if.else12
	call	#__crt0_start
	jmp	.LBB1_9
.LBB1_9:                                ; %if.end13
	add	#8, r1
	ret
.Lfunc_end1:
	.size	camel_recover, .Lfunc_end1-camel_recover
                                        ; -- End function
	.globl	task_init               ; -- Begin function task_init
	.p2align	1
	.type	task_init,@function
task_init:                              ; @task_init
.Lfunc_begin2:
; %bb.0:                                ; %entry
	sub	#4, r1
	mov	#8, 0(r1)
	clr	2(r1)
	jmp	.LBB2_1
.LBB2_1:                                ; %for.cond
                                        ; =>This Inner Loop Header: Depth=1
	mov	2(r1), r12
	cmp	#4, r12
	jge	.LBB2_4
	jmp	.LBB2_2
.LBB2_2:                                ; %for.body
                                        ;   in Loop: Header=BB2_1 Depth=1
	mov	2(r1), r12
	mov.b	pubkey(r12), r13
	mov	&unsafe, r14
	add	r12, r12
	add	r12, r14
	mov	r13, 160(r14)
	jmp	.LBB2_3
.LBB2_3:                                ; %for.inc
                                        ;   in Loop: Header=BB2_1 Depth=1
	mov	2(r1), r12
	inc	r12
	mov	r12, 2(r1)
	jmp	.LBB2_1
.LBB2_4:                                ; %for.end
	mov	0(r1), r12
	mov	&unsafe, r13
	mov	r12, 92(r13)
	mov	&unsafe, r12
	clr	90(r12)
	mov	&unsafe, r12
	clr	94(r12)
	mov	&unsafe, r12
	clr	342(r12)
	mov	&unsafe, r12
	clr	340(r12)
	add	#4, r1
	ret
.Lfunc_end2:
	.size	task_init, .Lfunc_end2-task_init
                                        ; -- End function
	.globl	task_pad                ; -- Begin function task_pad
	.p2align	1
	.type	task_pad,@function
task_pad:                               ; @task_pad
.Lfunc_begin3:
; %bb.0:                                ; %entry
	sub	#4, r1
	mov	&unsafe, r12
	mov	90(r12), r13
	mov	92(r12), r12
	cmp	r12, r13
	jlo	.LBB3_2
	jmp	.LBB3_1
.LBB3_1:                                ; %if.then
	call	#task_done
	jmp	.LBB3_2
.LBB3_2:                                ; %if.end
	clr	0(r1)
	clr	2(r1)
	jmp	.LBB3_3
.LBB3_3:                                ; %for.cond
                                        ; =>This Inner Loop Header: Depth=1
	mov	2(r1), r12
	cmp	#3, r12
	jhs	.LBB3_9
	jmp	.LBB3_4
.LBB3_4:                                ; %for.body
                                        ;   in Loop: Header=BB3_3 Depth=1
	mov	&unsafe, r12
	mov	90(r12), r13
	mov	2(r1), r14
	add	r14, r13
	mov	92(r12), r12
	cmp	r12, r13
	jhs	.LBB3_6
	jmp	.LBB3_5
.LBB3_5:                                ; %cond.true
                                        ;   in Loop: Header=BB3_3 Depth=1
	mov	&unsafe, r12
	mov	90(r12), r12
	mov	2(r1), r13
	add	r13, r12
	mov.b	PLAINTEXT(r12), r12
	jmp	.LBB3_7
.LBB3_6:                                ; %cond.false
                                        ;   in Loop: Header=BB3_3 Depth=1
	mov	#255, r12
	jmp	.LBB3_7
.LBB3_7:                                ; %cond.end
                                        ;   in Loop: Header=BB3_3 Depth=1
	mov	&unsafe, r13
	mov	2(r1), r14
	add	r14, r14
	add	r14, r13
	mov	r12, 96(r13)
	jmp	.LBB3_8
.LBB3_8:                                ; %for.inc
                                        ;   in Loop: Header=BB3_3 Depth=1
	mov	2(r1), r12
	inc	r12
	mov	r12, 2(r1)
	jmp	.LBB3_3
.LBB3_9:                                ; %for.end
	mov	#3, 2(r1)
	jmp	.LBB3_10
.LBB3_10:                               ; %for.cond13
                                        ; =>This Inner Loop Header: Depth=1
	mov	2(r1), r12
	cmp	#4, r12
	jge	.LBB3_13
	jmp	.LBB3_11
.LBB3_11:                               ; %for.body16
                                        ;   in Loop: Header=BB3_10 Depth=1
	mov	&unsafe, r12
	mov	2(r1), r13
	add	r13, r13
	add	r13, r12
	mov	#1, 96(r12)
	jmp	.LBB3_12
.LBB3_12:                               ; %for.inc20
                                        ;   in Loop: Header=BB3_10 Depth=1
	mov	2(r1), r12
	inc	r12
	mov	r12, 2(r1)
	jmp	.LBB3_10
.LBB3_13:                               ; %for.end22
	mov	&unsafe, r12
	mov	0(r1), r13
	add	r13, r13
	add	r13, r12
	mov	#1, 274(r12)
	mov	#1, 2(r1)
	jmp	.LBB3_14
.LBB3_14:                               ; %for.cond25
                                        ; =>This Inner Loop Header: Depth=1
	mov	2(r1), r12
	cmp	#4, r12
	jge	.LBB3_17
	jmp	.LBB3_15
.LBB3_15:                               ; %for.body28
                                        ;   in Loop: Header=BB3_14 Depth=1
	mov	&unsafe, r12
	mov	2(r1), r13
	add	r13, r13
	add	r13, r12
	clr	274(r12)
	jmp	.LBB3_16
.LBB3_16:                               ; %for.inc32
                                        ;   in Loop: Header=BB3_14 Depth=1
	mov	2(r1), r12
	inc	r12
	mov	r12, 2(r1)
	jmp	.LBB3_14
.LBB3_17:                               ; %for.end34
	mov	&pubkey+4, r12
	mov	&unsafe, r13
	mov	r12, 86(r13)
	mov	&unsafe, r12
	mov	90(r12), r13
	add	#3, r13
	mov	r13, 90(r12)
	mov	&unsafe, r12
	clr	340(r12)
	add	#4, r1
	ret
.Lfunc_end3:
	.size	task_pad, .Lfunc_end3-task_pad
                                        ; -- End function
	.globl	task_exp                ; -- Begin function task_exp
	.p2align	1
	.type	task_exp,@function
task_exp:                               ; @task_exp
.Lfunc_begin4:
; %bb.0:                                ; %entry
	mov	&unsafe, r12
	mov.b	86(r12), r12
	bit.b	#1, r12
	jeq	.LBB4_2
	jmp	.LBB4_1
.LBB4_1:                                ; %if.then
	mov	&unsafe, r12
	mov	86(r12), r13
	clrc
	rrc	r13
	mov	r13, 86(r12)
	mov	&unsafe, r12
	clr	342(r12)
	mov	&unsafe, r12
	clr	340(r12)
	jmp	.LBB4_3
.LBB4_2:                                ; %if.else
	mov	&unsafe, r12
	mov	86(r12), r13
	clrc
	rrc	r13
	mov	r13, 86(r12)
	mov	&unsafe, r12
	mov	#1, 342(r12)
	mov	&unsafe, r12
	mov	#1, 340(r12)
	jmp	.LBB4_3
.LBB4_3:                                ; %if.end
	ret
.Lfunc_end4:
	.size	task_exp, .Lfunc_end4-task_exp
                                        ; -- End function
	.globl	task_mult_block         ; -- Begin function task_mult_block
	.p2align	1
	.type	task_mult_block,@function
task_mult_block:                        ; @task_mult_block
.Lfunc_begin5:
; %bb.0:                                ; %entry
	mov	&unsafe, r12
	clr	342(r12)
	ret
.Lfunc_end5:
	.size	task_mult_block, .Lfunc_end5-task_mult_block
                                        ; -- End function
	.globl	task_mult_block_get_result ; -- Begin function task_mult_block_get_result
	.p2align	1
	.type	task_mult_block_get_result,@function
task_mult_block_get_result:             ; @task_mult_block_get_result
.Lfunc_begin6:
; %bb.0:                                ; %entry
	sub	#2, r1
	mov	#3, 0(r1)
	jmp	.LBB6_1
.LBB6_1:                                ; %for.cond
                                        ; =>This Inner Loop Header: Depth=1
	mov	0(r1), r12
	tst	r12
	jl	.LBB6_4
	jmp	.LBB6_2
.LBB6_2:                                ; %for.body
                                        ;   in Loop: Header=BB6_1 Depth=1
	mov	&unsafe, r12
	mov	0(r1), r13
	add	r13, r13
	add	r13, r12
	mov	22(r12), r13
	mov	r13, 274(r12)
	jmp	.LBB6_3
.LBB6_3:                                ; %for.inc
                                        ;   in Loop: Header=BB6_1 Depth=1
	mov	0(r1), r12
	add	#-1, r12
	mov	r12, 0(r1)
	jmp	.LBB6_1
.LBB6_4:                                ; %for.end
	mov	&unsafe, r12
	mov	86(r12), r12
	tst	r12
	jeq	.LBB6_6
	jmp	.LBB6_5
.LBB6_5:                                ; %if.then
	mov	&unsafe, r12
	mov	#100, 340(r12)
	mov	&unsafe, r12
	mov	#1, 342(r12)
	jmp	.LBB6_13
.LBB6_6:                                ; %if.else
	mov	&unsafe, r12
	mov	94(r12), r12
	add	#4, r12
	cmp	#17, r12
	jhs	.LBB6_12
	jmp	.LBB6_7
.LBB6_7:                                ; %if.then9
	clr	0(r1)
	jmp	.LBB6_8
.LBB6_8:                                ; %for.cond10
                                        ; =>This Inner Loop Header: Depth=1
	mov	0(r1), r12
	cmp	#4, r12
	jge	.LBB6_11
	jmp	.LBB6_9
.LBB6_9:                                ; %for.body12
                                        ;   in Loop: Header=BB6_8 Depth=1
	mov	&unsafe, r12
	mov	r12, r13
	add	#22, r13
	mov	0(r1), r14
	add	r14, r14
	mov	r13, r15
	add	r14, r15
	mov	0(r15), r14
	mov	94(r12), r12
	add	r12, r12
	add	r12, r13
	mov	r14, 152(r13)
	mov	&unsafe, r12
	mov	94(r12), r13
	inc	r13
	mov	r13, 94(r12)
	jmp	.LBB6_10
.LBB6_10:                               ; %for.inc22
                                        ;   in Loop: Header=BB6_8 Depth=1
	mov	0(r1), r12
	inc	r12
	mov	r12, 0(r1)
	jmp	.LBB6_8
.LBB6_11:                               ; %for.end24
	jmp	.LBB6_12
.LBB6_12:                               ; %if.end
	jmp	.LBB6_13
.LBB6_13:                               ; %if.end25
	add	#2, r1
	ret
.Lfunc_end6:
	.size	task_mult_block_get_result, .Lfunc_end6-task_mult_block_get_result
                                        ; -- End function
	.globl	task_square_base        ; -- Begin function task_square_base
	.p2align	1
	.type	task_square_base,@function
task_square_base:                       ; @task_square_base
.Lfunc_begin7:
; %bb.0:                                ; %entry
	mov	&unsafe, r12
	mov	#1, 342(r12)
	ret
.Lfunc_end7:
	.size	task_square_base, .Lfunc_end7-task_square_base
                                        ; -- End function
	.globl	task_square_base_get_result ; -- Begin function task_square_base_get_result
	.p2align	1
	.type	task_square_base_get_result,@function
task_square_base_get_result:            ; @task_square_base_get_result
.Lfunc_begin8:
; %bb.0:                                ; %entry
	sub	#4, r1
	clr	2(r1)
	jmp	.LBB8_1
.LBB8_1:                                ; %for.cond
                                        ; =>This Inner Loop Header: Depth=1
	mov	2(r1), r12
	cmp	#4, r12
	jge	.LBB8_4
	jmp	.LBB8_2
.LBB8_2:                                ; %for.body
                                        ;   in Loop: Header=BB8_1 Depth=1
	mov	&unsafe, r12
	mov	2(r1), r13
	add	r13, r13
	add	r13, r12
	mov	22(r12), r13
	mov	r13, 96(r12)
	jmp	.LBB8_3
.LBB8_3:                                ; %for.inc
                                        ;   in Loop: Header=BB8_1 Depth=1
	mov	2(r1), r12
	inc	r12
	mov	r12, 2(r1)
	jmp	.LBB8_1
.LBB8_4:                                ; %for.end
	mov	&unsafe, r12
	clr	340(r12)
	add	#4, r1
	ret
.Lfunc_end8:
	.size	task_square_base_get_result, .Lfunc_end8-task_square_base_get_result
                                        ; -- End function
	.globl	task_mult_mod           ; -- Begin function task_mult_mod
	.p2align	1
	.type	task_mult_mod,@function
task_mult_mod:                          ; @task_mult_mod
.Lfunc_begin9:
; %bb.0:                                ; %entry
	mov	&unsafe, r12
	clr	168(r12)
	mov	&unsafe, r12
	clr	170(r12)
	ret
.Lfunc_end9:
	.size	task_mult_mod, .Lfunc_end9-task_mult_mod
                                        ; -- End function
	.globl	task_mult               ; -- Begin function task_mult
	.p2align	1
	.type	task_mult,@function
task_mult:                              ; @task_mult
.Lfunc_begin10:
; %bb.0:                                ; %entry
	sub	#12, r1
	mov	&unsafe, r12
	mov	170(r12), r12
	mov	r12, 0(r1)
	clr	4(r1)
	clr	10(r1)
	jmp	.LBB10_1
.LBB10_1:                               ; %for.cond
                                        ; =>This Inner Loop Header: Depth=1
	mov	10(r1), r12
	cmp	#4, r12
	jge	.LBB10_7
	jmp	.LBB10_2
.LBB10_2:                               ; %for.body
                                        ;   in Loop: Header=BB10_1 Depth=1
	mov	&unsafe, r12
	mov	168(r12), r12
	mov	10(r1), r13
	sub	r13, r12
	tst	r12
	jlo	.LBB10_5
	jmp	.LBB10_3
.LBB10_3:                               ; %land.lhs.true
                                        ;   in Loop: Header=BB10_1 Depth=1
	mov	&unsafe, r12
	mov	168(r12), r12
	mov	10(r1), r13
	sub	r13, r12
	cmp	#4, r12
	jhs	.LBB10_5
	jmp	.LBB10_4
.LBB10_4:                               ; %if.then
                                        ;   in Loop: Header=BB10_1 Depth=1
	mov	&unsafe, r12
	mov	168(r12), r13
	mov	10(r1), r14
	sub	r14, r13
	add	r13, r13
	add	r13, r12
	mov	96(r12), r12
	mov	r12, 8(r1)
	mov	&unsafe, r12
	mov	10(r1), r13
	add	r13, r13
	add	r13, r12
	mov	274(r12), r12
	mov	r12, 6(r1)
	mov	8(r1), r12
	mov	6(r1), r13
	call	#__mspabi_mpyi
	mov	r12, 2(r1)
	mov.b	3(r1), r12
	mov	4(r1), r13
	add	r12, r13
	mov	r13, 4(r1)
	mov.b	2(r1), r12
	mov	0(r1), r13
	add	r12, r13
	mov	r13, 0(r1)
	jmp	.LBB10_5
.LBB10_5:                               ; %if.end
                                        ;   in Loop: Header=BB10_1 Depth=1
	jmp	.LBB10_6
.LBB10_6:                               ; %for.inc
                                        ;   in Loop: Header=BB10_1 Depth=1
	mov	10(r1), r12
	inc	r12
	mov	r12, 10(r1)
	jmp	.LBB10_1
.LBB10_7:                               ; %for.end
	mov.b	1(r1), r12
	mov	4(r1), r13
	add	r12, r13
	mov	r13, 4(r1)
	mov.b	0(r1), r12
	mov	r12, 0(r1)
	mov	0(r1), r12
	mov	&unsafe, r13
	mov	168(r13), r14
	add	r14, r14
	add	r14, r13
	mov	r12, 22(r13)
	mov	&unsafe, r12
	mov	168(r12), r13
	inc	r13
	mov	r13, 168(r12)
	mov	&unsafe, r12
	mov	168(r12), r12
	cmp	#8, r12
	jhs	.LBB10_9
	jmp	.LBB10_8
.LBB10_8:                               ; %if.then27
	mov	4(r1), r12
	mov	&unsafe, r13
	mov	r12, 170(r13)
	mov	&unsafe, r12
	clr	340(r12)
	jmp	.LBB10_10
.LBB10_9:                               ; %if.else
	mov	&unsafe, r12
	mov	#1, 340(r12)
	jmp	.LBB10_10
.LBB10_10:                              ; %if.end33
	add	#12, r1
	ret
.Lfunc_end10:
	.size	task_mult, .Lfunc_end10-task_mult
                                        ; -- End function
	.globl	task_reduce_digits      ; -- Begin function task_reduce_digits
	.p2align	1
	.type	task_reduce_digits,@function
task_reduce_digits:                     ; @task_reduce_digits
.Lfunc_begin11:
; %bb.0:                                ; %entry
	sub	#2, r1
	mov	#8, 0(r1)
	jmp	.LBB11_1
.LBB11_1:                               ; %do.body
                                        ; =>This Inner Loop Header: Depth=1
	mov	0(r1), r12
	add	#-1, r12
	mov	r12, 0(r1)
	jmp	.LBB11_2
.LBB11_2:                               ; %do.cond
                                        ;   in Loop: Header=BB11_1 Depth=1
	mov	&unsafe, r12
	mov	0(r1), r13
	add	r13, r13
	add	r13, r12
	mov	22(r12), r13
	clr.b	r12
	tst	r13
	jne	.LBB11_6
	jmp	.LBB11_3
.LBB11_3:                               ; %land.rhs
                                        ;   in Loop: Header=BB11_1 Depth=1
	mov	0(r1), r13
	mov	#1, r12
	cmp	#1, r13
	jge	.LBB11_5
; %bb.4:                                ; %land.rhs
                                        ;   in Loop: Header=BB11_1 Depth=1
	clr	r12
.LBB11_5:                               ; %land.rhs
                                        ;   in Loop: Header=BB11_1 Depth=1
	jmp	.LBB11_6
.LBB11_6:                               ; %land.end
                                        ;   in Loop: Header=BB11_1 Depth=1
	bit	#1, r12
	jne	.LBB11_1
	jmp	.LBB11_7
.LBB11_7:                               ; %do.end
	mov	&unsafe, r12
	mov	0(r1), r13
	add	r13, r13
	add	r13, r12
	mov	22(r12), r12
	tst	r12
	jne	.LBB11_9
	jmp	.LBB11_8
.LBB11_8:                               ; %if.then
	mov	&unsafe, r12
	clr	340(r12)
	jmp	.LBB11_10
.LBB11_9:                               ; %if.end
	mov	0(r1), r12
	mov	&unsafe, r13
	mov	r12, 172(r13)
	mov	&unsafe, r12
	mov	#1, 340(r12)
	jmp	.LBB11_10
.LBB11_10:                              ; %return
	add	#2, r1
	ret
.Lfunc_end11:
	.size	task_reduce_digits, .Lfunc_end11-task_reduce_digits
                                        ; -- End function
	.globl	task_reduce_normalizable ; -- Begin function task_reduce_normalizable
	.p2align	1
	.type	task_reduce_normalizable,@function
task_reduce_normalizable:               ; @task_reduce_normalizable
.Lfunc_begin12:
; %bb.0:                                ; %entry
	sub	#10, r1
	mov.b	#1, 1(r1)
	mov	&unsafe, r12
	mov	172(r12), r13
	add	#-3, r13
	mov	r13, 206(r12)
	mov	&unsafe, r12
	mov	172(r12), r12
	mov	r12, 8(r1)
	jmp	.LBB12_1
.LBB12_1:                               ; %for.cond
                                        ; =>This Inner Loop Header: Depth=1
	mov	8(r1), r12
	tst	r12
	jl	.LBB12_9
	jmp	.LBB12_2
.LBB12_2:                               ; %for.body
                                        ;   in Loop: Header=BB12_1 Depth=1
	mov	&unsafe, r12
	mov	r12, r13
	add	#22, r13
	mov	8(r1), r14
	mov	r14, r15
	add	r15, r15
	mov	r13, r11
	add	r15, r11
	mov	0(r11), r15
	mov	206(r12), r12
	sub	r12, r14
	add	r14, r14
	add	r14, r13
	mov	138(r13), r12
	cmp	r15, r12
	jhs	.LBB12_4
	jmp	.LBB12_3
.LBB12_3:                               ; %if.then
	jmp	.LBB12_10
.LBB12_4:                               ; %if.else
                                        ;   in Loop: Header=BB12_1 Depth=1
	mov	&unsafe, r12
	mov	r12, r13
	add	#22, r13
	mov	8(r1), r14
	mov	r14, r15
	add	r15, r15
	mov	r13, r11
	add	r15, r11
	mov	0(r11), r15
	mov	206(r12), r12
	sub	r12, r14
	add	r14, r14
	add	r14, r13
	mov	138(r13), r12
	cmp	r12, r15
	jhs	.LBB12_6
	jmp	.LBB12_5
.LBB12_5:                               ; %if.then21
	clr.b	1(r1)
	jmp	.LBB12_10
.LBB12_6:                               ; %if.end
                                        ;   in Loop: Header=BB12_1 Depth=1
	jmp	.LBB12_7
.LBB12_7:                               ; %if.end22
                                        ;   in Loop: Header=BB12_1 Depth=1
	jmp	.LBB12_8
.LBB12_8:                               ; %for.inc
                                        ;   in Loop: Header=BB12_1 Depth=1
	mov	8(r1), r12
	add	#-1, r12
	mov	r12, 8(r1)
	jmp	.LBB12_1
.LBB12_9:                               ; %for.end.loopexit
	jmp	.LBB12_10
.LBB12_10:                              ; %for.end
	mov.b	1(r1), r12
	bit	#1, r12
	jne	.LBB12_13
	jmp	.LBB12_11
.LBB12_11:                              ; %land.lhs.true
	mov	&unsafe, r12
	mov	172(r12), r12
	cmp	#3, r12
	jne	.LBB12_13
	jmp	.LBB12_12
.LBB12_12:                              ; %if.then26
	mov	&unsafe, r12
	mov	#2, 340(r12)
	jmp	.LBB12_13
.LBB12_13:                              ; %if.end28
	mov.b	1(r1), r12
	bit	#1, r12
	jeq	.LBB12_15
	jmp	.LBB12_14
.LBB12_14:                              ; %if.then30
	mov	&unsafe, r12
	clr	340(r12)
	jmp	.LBB12_16
.LBB12_15:                              ; %if.else33
	mov	&unsafe, r12
	mov	#1, 340(r12)
	jmp	.LBB12_16
.LBB12_16:                              ; %if.end36
	add	#10, r1
	ret
.Lfunc_end12:
	.size	task_reduce_normalizable, .Lfunc_end12-task_reduce_normalizable
                                        ; -- End function
	.globl	task_reduce_normalize   ; -- Begin function task_reduce_normalize
	.p2align	1
	.type	task_reduce_normalize,@function
task_reduce_normalize:                  ; @task_reduce_normalize
.Lfunc_begin13:
; %bb.0:                                ; %entry
	sub	#12, r1
	clr	2(r1)
	clr	0(r1)
	jmp	.LBB13_1
.LBB13_1:                               ; %for.cond
                                        ; =>This Inner Loop Header: Depth=1
	mov	0(r1), r12
	cmp	#4, r12
	jge	.LBB13_7
	jmp	.LBB13_2
.LBB13_2:                               ; %for.body
                                        ;   in Loop: Header=BB13_1 Depth=1
	mov	&unsafe, r12
	mov	0(r1), r13
	mov	206(r12), r14
	add	r14, r13
	add	r13, r13
	add	r13, r12
	mov	22(r12), r12
	mov	r12, 10(r1)
	mov	&unsafe, r12
	mov	0(r1), r13
	add	r13, r13
	add	r13, r12
	mov	160(r12), r12
	mov	r12, 8(r1)
	mov	8(r1), r12
	mov	2(r1), r13
	add	r13, r12
	mov	r12, 4(r1)
	mov	10(r1), r12
	mov	4(r1), r13
	cmp	r13, r12
	jhs	.LBB13_4
	jmp	.LBB13_3
.LBB13_3:                               ; %if.then
                                        ;   in Loop: Header=BB13_1 Depth=1
	mov	10(r1), r12
	add	#256, r12
	mov	r12, 10(r1)
	mov	#1, 2(r1)
	jmp	.LBB13_5
.LBB13_4:                               ; %if.else
                                        ;   in Loop: Header=BB13_1 Depth=1
	clr	2(r1)
	jmp	.LBB13_5
.LBB13_5:                               ; %if.end
                                        ;   in Loop: Header=BB13_1 Depth=1
	mov	10(r1), r12
	mov	4(r1), r13
	sub	r13, r12
	mov	r12, 6(r1)
	mov	6(r1), r12
	mov	&unsafe, r13
	mov	0(r1), r14
	mov	206(r13), r15
	add	r15, r14
	add	r14, r14
	add	r14, r13
	mov	r12, 22(r13)
	jmp	.LBB13_6
.LBB13_6:                               ; %for.inc
                                        ;   in Loop: Header=BB13_1 Depth=1
	mov	0(r1), r12
	inc	r12
	mov	r12, 0(r1)
	jmp	.LBB13_1
.LBB13_7:                               ; %for.end
	mov	&unsafe, r12
	mov	206(r12), r12
	tst	r12
	jeq	.LBB13_9
	jmp	.LBB13_8
.LBB13_8:                               ; %if.then16
	jmp	.LBB13_10
.LBB13_9:                               ; %if.else17
	mov	&unsafe, r12
	mov	#2, 340(r12)
	jmp	.LBB13_10
.LBB13_10:                              ; %if.end19
	add	#12, r1
	ret
.Lfunc_end13:
	.size	task_reduce_normalize, .Lfunc_end13-task_reduce_normalize
                                        ; -- End function
	.globl	task_reduce_n_divisor   ; -- Begin function task_reduce_n_divisor
	.p2align	1
	.type	task_reduce_n_divisor,@function
task_reduce_n_divisor:                  ; @task_reduce_n_divisor
.Lfunc_begin14:
; %bb.0:                                ; %entry
	mov	&unsafe, r12
	mov.b	166(r12), r13
	swpb	r13
	mov	164(r12), r14
	add	r14, r13
	mov	r13, 208(r12)
	ret
.Lfunc_end14:
	.size	task_reduce_n_divisor, .Lfunc_end14-task_reduce_n_divisor
                                        ; -- End function
	.globl	task_reduce_quotient    ; -- Begin function task_reduce_quotient
	.p2align	1
	.type	task_reduce_quotient,@function
task_reduce_quotient:                   ; @task_reduce_quotient
.Lfunc_begin15:
; %bb.0:                                ; %entry
	push	r10
	push	r9
	sub	#12, r1
	mov	&unsafe, r12
	mov	172(r12), r13
	add	r13, r13
	mov	r12, r14
	add	r13, r14
	mov	22(r14), r13
	mov	166(r12), r12
	cmp	r12, r13
	jne	.LBB15_2
	jmp	.LBB15_1
.LBB15_1:                               ; %if.then
	mov	&unsafe, r12
	mov	#255, 338(r12)
	jmp	.LBB15_3
.LBB15_2:                               ; %if.else
	mov	&unsafe, r10
	mov	172(r10), r12
	add	r12, r12
	mov	r10, r13
	add	r12, r13
	mov.b	22(r13), r9
	swpb	r9
	mov	20(r13), r12
	mov	166(r10), r13
	call	#__mspabi_divu
	add	r12, r9
	mov	r9, 338(r10)
	jmp	.LBB15_3
.LBB15_3:                               ; %if.end
	mov	&unsafe, r12
	mov	172(r12), r13
	add	r13, r13
	add	r13, r12
	mov	22(r12), r13
	mov.b	20(r12), r14
	swpb	r14
	mov	18(r12), r12
	mov	r14, r15
	add	r12, r15
	cmp	r14, r15
	mov	#1, r12
	bic	r2, r12
	add	r12, r13
	mov	r15, 0(r1)
	mov	r13, 2(r1)
	mov	&unsafe, r12
	mov	338(r12), r13
	inc	r13
	mov	r13, 338(r12)
	jmp	.LBB15_4
.LBB15_4:                               ; %do.body
                                        ; =>This Inner Loop Header: Depth=1
	mov	&unsafe, r12
	mov	338(r12), r13
	add	#-1, r13
	mov	r13, 338(r12)
	mov	&unsafe, r13
	mov	208(r13), r12
	mov	338(r13), r13
	call	#mult16
	mov	r12, r13
	swpb	r13
	sxt	r13
	rra	r13
	rra	r13
	rra	r13
	rra	r13
	rra	r13
	rra	r13
	rra	r13
	mov	r12, 4(r1)
	mov	r13, 6(r1)
	jmp	.LBB15_5
.LBB15_5:                               ; %do.cond
                                        ;   in Loop: Header=BB15_4 Depth=1
	mov	4(r1), r14
	mov	6(r1), r15
	mov	0(r1), r11
	mov	2(r1), r10
	cmp	r15, r10
	mov	#1, r12
	mov	#1, r13
	bic	r2, r13
	cmp	r14, r11
	bic	r2, r12
	cmp	r10, r15
	jeq	.LBB15_7
; %bb.6:                                ; %do.cond
                                        ;   in Loop: Header=BB15_4 Depth=1
	mov	r13, r12
.LBB15_7:                               ; %do.cond
                                        ;   in Loop: Header=BB15_4 Depth=1
	bit	#1, r12
	jne	.LBB15_4
	jmp	.LBB15_8
.LBB15_8:                               ; %do.end
	mov	&unsafe, r12
	mov	172(r12), r13
	add	#-1, r13
	mov	r13, 172(r12)
	add	#12, r1
	pop	r9
	pop	r10
	ret
.Lfunc_end15:
	.size	task_reduce_quotient, .Lfunc_end15-task_reduce_quotient
                                        ; -- End function
	.globl	task_reduce_multiply    ; -- Begin function task_reduce_multiply
	.p2align	1
	.type	task_reduce_multiply,@function
task_reduce_multiply:                   ; @task_reduce_multiply
.Lfunc_begin16:
; %bb.0:                                ; %entry
	sub	#10, r1
	mov	&unsafe, r12
	mov	172(r12), r12
	add	#-3, r12
	mov	r12, 0(r1)
	clr	8(r1)
	jmp	.LBB16_1
.LBB16_1:                               ; %for.cond
                                        ; =>This Inner Loop Header: Depth=1
	mov	8(r1), r12
	mov	0(r1), r13
	cmp	r13, r12
	jhs	.LBB16_4
	jmp	.LBB16_2
.LBB16_2:                               ; %for.body
                                        ;   in Loop: Header=BB16_1 Depth=1
	mov	&unsafe, r12
	mov	8(r1), r13
	add	r13, r13
	add	r13, r12
	clr	210(r12)
	jmp	.LBB16_3
.LBB16_3:                               ; %for.inc
                                        ;   in Loop: Header=BB16_1 Depth=1
	mov	8(r1), r12
	inc	r12
	mov	r12, 8(r1)
	jmp	.LBB16_1
.LBB16_4:                               ; %for.end
	clr	2(r1)
	mov	0(r1), r12
	mov	r12, 8(r1)
	jmp	.LBB16_5
.LBB16_5:                               ; %for.cond2
                                        ; =>This Inner Loop Header: Depth=1
	mov	8(r1), r12
	cmp	#8, r12
	jge	.LBB16_11
	jmp	.LBB16_6
.LBB16_6:                               ; %for.body4
                                        ;   in Loop: Header=BB16_5 Depth=1
	mov	2(r1), r12
	mov	r12, 6(r1)
	mov	8(r1), r12
	mov	0(r1), r13
	add	#4, r13
	cmp	r13, r12
	jhs	.LBB16_8
	jmp	.LBB16_7
.LBB16_7:                               ; %if.then
                                        ;   in Loop: Header=BB16_5 Depth=1
	mov	&unsafe, r12
	mov	8(r1), r13
	mov	206(r12), r14
	sub	r14, r13
	add	r13, r13
	add	r13, r12
	mov	160(r12), r12
	mov	r12, 4(r1)
	mov	&unsafe, r12
	mov	338(r12), r12
	mov	4(r1), r13
	call	#__mspabi_mpyi
	mov	6(r1), r13
	add	r12, r13
	mov	r13, 6(r1)
	jmp	.LBB16_9
.LBB16_8:                               ; %if.else
                                        ;   in Loop: Header=BB16_5 Depth=1
	clr	4(r1)
	jmp	.LBB16_9
.LBB16_9:                               ; %if.end
                                        ;   in Loop: Header=BB16_5 Depth=1
	mov.b	7(r1), r12
	mov	r12, 2(r1)
	mov.b	6(r1), r12
	mov	r12, 6(r1)
	mov	6(r1), r12
	mov	&unsafe, r13
	mov	8(r1), r14
	add	r14, r14
	add	r14, r13
	mov	r12, 210(r13)
	jmp	.LBB16_10
.LBB16_10:                              ; %for.inc17
                                        ;   in Loop: Header=BB16_5 Depth=1
	mov	8(r1), r12
	inc	r12
	mov	r12, 8(r1)
	jmp	.LBB16_5
.LBB16_11:                              ; %for.end19
	add	#10, r1
	ret
.Lfunc_end16:
	.size	task_reduce_multiply, .Lfunc_end16-task_reduce_multiply
                                        ; -- End function
	.globl	task_reduce_compare     ; -- Begin function task_reduce_compare
	.p2align	1
	.type	task_reduce_compare,@function
task_reduce_compare:                    ; @task_reduce_compare
.Lfunc_begin17:
; %bb.0:                                ; %entry
	sub	#4, r1
	mov.b	#61, 1(r1)
	mov	#7, 2(r1)
	jmp	.LBB17_1
.LBB17_1:                               ; %for.cond
                                        ; =>This Inner Loop Header: Depth=1
	mov	2(r1), r12
	tst	r12
	jl	.LBB17_9
	jmp	.LBB17_2
.LBB17_2:                               ; %for.body
                                        ;   in Loop: Header=BB17_1 Depth=1
	mov	&unsafe, r12
	mov	2(r1), r13
	add	r13, r13
	add	r13, r12
	mov	22(r12), r13
	mov	210(r12), r12
	cmp	r13, r12
	jhs	.LBB17_4
	jmp	.LBB17_3
.LBB17_3:                               ; %if.then
	mov.b	#62, 1(r1)
	jmp	.LBB17_10
.LBB17_4:                               ; %if.else
                                        ;   in Loop: Header=BB17_1 Depth=1
	mov	&unsafe, r12
	mov	2(r1), r13
	add	r13, r13
	add	r13, r12
	mov	22(r12), r13
	mov	210(r12), r12
	cmp	r12, r13
	jhs	.LBB17_6
	jmp	.LBB17_5
.LBB17_5:                               ; %if.then11
	mov.b	#60, 1(r1)
	jmp	.LBB17_10
.LBB17_6:                               ; %if.end
                                        ;   in Loop: Header=BB17_1 Depth=1
	jmp	.LBB17_7
.LBB17_7:                               ; %if.end12
                                        ;   in Loop: Header=BB17_1 Depth=1
	jmp	.LBB17_8
.LBB17_8:                               ; %for.inc
                                        ;   in Loop: Header=BB17_1 Depth=1
	mov	2(r1), r12
	add	#-1, r12
	mov	r12, 2(r1)
	jmp	.LBB17_1
.LBB17_9:                               ; %for.end.loopexit
	jmp	.LBB17_10
.LBB17_10:                              ; %for.end
	mov.b	1(r1), r12
	cmp.b	#60, r12
	jne	.LBB17_12
	jmp	.LBB17_11
.LBB17_11:                              ; %if.then15
	mov	&unsafe, r12
	clr	340(r12)
	jmp	.LBB17_13
.LBB17_12:                              ; %if.else17
	mov	&unsafe, r12
	mov	#1, 340(r12)
	jmp	.LBB17_13
.LBB17_13:                              ; %if.end20
	add	#4, r1
	ret
.Lfunc_end17:
	.size	task_reduce_compare, .Lfunc_end17-task_reduce_compare
                                        ; -- End function
	.globl	task_reduce_add         ; -- Begin function task_reduce_add
	.p2align	1
	.type	task_reduce_add,@function
task_reduce_add:                        ; @task_reduce_add
.Lfunc_begin18:
; %bb.0:                                ; %entry
	sub	#12, r1
	mov	&unsafe, r12
	mov	172(r12), r12
	add	#-3, r12
	mov	r12, 0(r1)
	clr	2(r1)
	mov	0(r1), r12
	mov	r12, 10(r1)
	jmp	.LBB18_1
.LBB18_1:                               ; %for.cond
                                        ; =>This Inner Loop Header: Depth=1
	mov	10(r1), r12
	cmp	#8, r12
	jge	.LBB18_7
	jmp	.LBB18_2
.LBB18_2:                               ; %for.body
                                        ;   in Loop: Header=BB18_1 Depth=1
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
	add	#4, r13
	cmp	r13, r12
	jhs	.LBB18_4
	jmp	.LBB18_3
.LBB18_3:                               ; %if.then
                                        ;   in Loop: Header=BB18_1 Depth=1
	mov	&unsafe, r12
	mov	8(r1), r13
	add	r13, r13
	add	r13, r12
	mov	160(r12), r12
	mov	r12, 4(r1)
	jmp	.LBB18_5
.LBB18_4:                               ; %if.else
                                        ;   in Loop: Header=BB18_1 Depth=1
	clr	4(r1)
	clr	8(r1)
	jmp	.LBB18_5
.LBB18_5:                               ; %if.end
                                        ;   in Loop: Header=BB18_1 Depth=1
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
	jmp	.LBB18_6
.LBB18_6:                               ; %for.inc
                                        ;   in Loop: Header=BB18_1 Depth=1
	mov	10(r1), r12
	inc	r12
	mov	r12, 10(r1)
	jmp	.LBB18_1
.LBB18_7:                               ; %for.end
	add	#12, r1
	ret
.Lfunc_end18:
	.size	task_reduce_add, .Lfunc_end18-task_reduce_add
                                        ; -- End function
	.globl	task_reduce_subtract    ; -- Begin function task_reduce_subtract
	.p2align	1
	.type	task_reduce_subtract,@function
task_reduce_subtract:                   ; @task_reduce_subtract
.Lfunc_begin19:
; %bb.0:                                ; %entry
	sub	#12, r1
	mov	&unsafe, r12
	mov	172(r12), r12
	add	#-3, r12
	mov	r12, 0(r1)
	clr	2(r1)
	clr	10(r1)
	jmp	.LBB19_1
.LBB19_1:                               ; %for.cond
                                        ; =>This Inner Loop Header: Depth=1
	mov	10(r1), r12
	cmp	#8, r12
	jge	.LBB19_9
	jmp	.LBB19_2
.LBB19_2:                               ; %for.body
                                        ;   in Loop: Header=BB19_1 Depth=1
	mov	&unsafe, r12
	mov	10(r1), r13
	add	r13, r13
	add	r13, r12
	mov	22(r12), r12
	mov	r12, 8(r1)
	mov	10(r1), r12
	mov	0(r1), r13
	cmp	r13, r12
	jlo	.LBB19_7
	jmp	.LBB19_3
.LBB19_3:                               ; %if.then
                                        ;   in Loop: Header=BB19_1 Depth=1
	mov	&unsafe, r12
	mov	10(r1), r13
	add	r13, r13
	add	r13, r12
	mov	210(r12), r12
	mov	r12, 4(r1)
	mov	4(r1), r12
	mov	2(r1), r13
	add	r13, r12
	mov	r12, 6(r1)
	mov	8(r1), r12
	mov	6(r1), r13
	cmp	r13, r12
	jhs	.LBB19_5
	jmp	.LBB19_4
.LBB19_4:                               ; %if.then7
                                        ;   in Loop: Header=BB19_1 Depth=1
	mov	8(r1), r12
	add	#256, r12
	mov	r12, 8(r1)
	mov	#1, 2(r1)
	jmp	.LBB19_6
.LBB19_5:                               ; %if.else
                                        ;   in Loop: Header=BB19_1 Depth=1
	clr	2(r1)
	jmp	.LBB19_6
.LBB19_6:                               ; %if.end
                                        ;   in Loop: Header=BB19_1 Depth=1
	mov	8(r1), r12
	mov	6(r1), r13
	sub	r13, r12
	mov	&unsafe, r13
	mov	10(r1), r14
	add	r14, r14
	add	r14, r13
	mov	r12, 22(r13)
	jmp	.LBB19_7
.LBB19_7:                               ; %if.end13
                                        ;   in Loop: Header=BB19_1 Depth=1
	jmp	.LBB19_8
.LBB19_8:                               ; %for.inc
                                        ;   in Loop: Header=BB19_1 Depth=1
	mov	10(r1), r12
	inc	r12
	mov	r12, 10(r1)
	jmp	.LBB19_1
.LBB19_9:                               ; %for.end
	mov	&unsafe, r12
	mov	172(r12), r12
	inc	r12
	cmp	#5, r12
	jlo	.LBB19_11
	jmp	.LBB19_10
.LBB19_10:                              ; %if.then18
	jmp	.LBB19_12
.LBB19_11:                              ; %if.else19
	jmp	.LBB19_12
.LBB19_12:                              ; %if.end20
	add	#12, r1
	ret
.Lfunc_end19:
	.size	task_reduce_subtract, .Lfunc_end19-task_reduce_subtract
                                        ; -- End function
	.globl	task_commit             ; -- Begin function task_commit
	.p2align	1
	.type	task_commit,@function
task_commit:                            ; @task_commit
.Lfunc_begin20:
; %bb.0:                                ; %entry
	ret
.Lfunc_end20:
	.size	task_commit, .Lfunc_end20-task_commit
                                        ; -- End function
	.globl	task_done               ; -- Begin function task_done
	.p2align	1
	.type	task_done,@function
task_done:                              ; @task_done
.Lfunc_begin21:
; %bb.0:                                ; %entry
	clr	r12
	call	#exit
.Lfunc_end21:
	.size	task_done, .Lfunc_end21-task_done
                                        ; -- End function
	.globl	main                    ; -- Begin function main
	.p2align	1
	.type	main,@function
main:                                   ; @main
.Lfunc_begin22:
; %bb.0:                                ; %entry
	sub	#274, r1
	clr	272(r1)
	mov	#1, &camel
	mov	#camel+2, &safe
	mov	#camel+348, &unsafe
	call	#camel_init
	jmp	.LBB22_1
.LBB22_1:                               ; %while.body
                                        ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB22_7 Depth 2
                                        ;       Child Loop BB22_28 Depth 3
                                        ;       Child Loop BB22_72 Depth 3
	call	#task_init
	jmp	.LBB22_2
.LBB22_2:                               ; %do.body
                                        ;   in Loop: Header=BB22_1 Depth=1
	mov	&camel, r12
	cmp	#1, r12
	jne	.LBB22_4
	jmp	.LBB22_3
.LBB22_3:                               ; %if.then
                                        ;   in Loop: Header=BB22_1 Depth=1
	mov	#camel+348, &safe
	mov	#camel+2, &unsafe
	mov	&safe, r12
	call	#__dump_registers
	;APP
	mov	r1, r12
	;NO_APP
	mov	r12, 270(r1)
	mov	270(r1), r12
	mov	r12, 268(r1)
	mov	268(r1), r12
	incd	r12
	;APP
	mov	r1, r13
	;NO_APP
	mov	r13, 266(r1)
	mov	266(r1), r13
	mov	r13, 264(r1)
	mov	264(r1), r14
	mov	#9214, r13
	sub	r14, r13
	mov	#-1, r14
	call	#__fast_hw_crc
	mov	r12, &tmp_stack_crc
	mov	&safe, r12
	mov	&tmp_stack_crc, r14
	mov	#344, r13
	call	#__fast_hw_crc
	mov	r12, &tmp_stack_buf_crc
	mov	&tmp_stack_buf_crc, r12
	mov	&safe, r13
	mov	r12, 344(r13)
	mov	#2, &camel
	jmp	.LBB22_5
.LBB22_4:                               ; %if.else
                                        ;   in Loop: Header=BB22_1 Depth=1
	mov	#camel+2, &safe
	mov	#camel+348, &unsafe
	mov	&safe, r12
	call	#__dump_registers
	;APP
	mov	r1, r12
	;NO_APP
	mov	r12, 262(r1)
	mov	262(r1), r12
	mov	r12, 260(r1)
	mov	260(r1), r12
	incd	r12
	;APP
	mov	r1, r13
	;NO_APP
	mov	r13, 258(r1)
	mov	258(r1), r13
	mov	r13, 256(r1)
	mov	256(r1), r14
	mov	#9214, r13
	sub	r14, r13
	mov	#-1, r14
	call	#__fast_hw_crc
	mov	r12, &tmp_stack_crc
	mov	&safe, r12
	mov	&tmp_stack_crc, r14
	mov	#344, r13
	call	#__fast_hw_crc
	mov	r12, &tmp_stack_buf_crc
	mov	&tmp_stack_buf_crc, r12
	mov	&safe, r13
	mov	r12, 344(r13)
	mov	#1, &camel
	jmp	.LBB22_5
.LBB22_5:                               ; %if.end
                                        ;   in Loop: Header=BB22_1 Depth=1
	jmp	.LBB22_6
.LBB22_6:                               ; %do.end
                                        ;   in Loop: Header=BB22_1 Depth=1
	call	#task_commit
	jmp	.LBB22_7
.LBB22_7:                               ; %while.body18
                                        ;   Parent Loop BB22_1 Depth=1
                                        ; =>  This Loop Header: Depth=2
                                        ;       Child Loop BB22_28 Depth 3
                                        ;       Child Loop BB22_72 Depth 3
	mov	&safe, r12
	mov	342(r12), r12
	tst	r12
	jne	.LBB22_15
	jmp	.LBB22_8
.LBB22_8:                               ; %land.lhs.true
                                        ;   in Loop: Header=BB22_7 Depth=2
	mov	&unsafe, r12
	mov	340(r12), r12
	cmp	#100, r12
	jeq	.LBB22_15
	jmp	.LBB22_9
.LBB22_9:                               ; %if.then22
                                        ;   in Loop: Header=BB22_7 Depth=2
	call	#task_pad
	jmp	.LBB22_10
.LBB22_10:                              ; %do.body23
                                        ;   in Loop: Header=BB22_7 Depth=2
	mov	&camel, r12
	cmp	#1, r12
	jne	.LBB22_12
	jmp	.LBB22_11
.LBB22_11:                              ; %if.then25
                                        ;   in Loop: Header=BB22_7 Depth=2
	mov	#camel+348, &safe
	mov	#camel+2, &unsafe
	mov	&safe, r12
	call	#__dump_registers
	;APP
	mov	r1, r12
	;NO_APP
	mov	r12, 254(r1)
	mov	254(r1), r12
	mov	r12, 252(r1)
	mov	252(r1), r12
	incd	r12
	;APP
	mov	r1, r13
	;NO_APP
	mov	r13, 250(r1)
	mov	250(r1), r13
	mov	r13, 248(r1)
	mov	248(r1), r14
	mov	#9214, r13
	sub	r14, r13
	mov	#-1, r14
	call	#__fast_hw_crc
	mov	r12, &tmp_stack_crc
	mov	&safe, r12
	mov	&tmp_stack_crc, r14
	mov	#344, r13
	call	#__fast_hw_crc
	mov	r12, &tmp_stack_buf_crc
	mov	&tmp_stack_buf_crc, r12
	mov	&safe, r13
	mov	r12, 344(r13)
	mov	#2, &camel
	jmp	.LBB22_13
.LBB22_12:                              ; %if.else38
                                        ;   in Loop: Header=BB22_7 Depth=2
	mov	#camel+2, &safe
	mov	#camel+348, &unsafe
	mov	&safe, r12
	call	#__dump_registers
	;APP
	mov	r1, r12
	;NO_APP
	mov	r12, 246(r1)
	mov	246(r1), r12
	mov	r12, 244(r1)
	mov	244(r1), r12
	incd	r12
	;APP
	mov	r1, r13
	;NO_APP
	mov	r13, 242(r1)
	mov	242(r1), r13
	mov	r13, 240(r1)
	mov	240(r1), r14
	mov	#9214, r13
	sub	r14, r13
	mov	#-1, r14
	call	#__fast_hw_crc
	mov	r12, &tmp_stack_crc
	mov	&safe, r12
	mov	&tmp_stack_crc, r14
	mov	#344, r13
	call	#__fast_hw_crc
	mov	r12, &tmp_stack_buf_crc
	mov	&tmp_stack_buf_crc, r12
	mov	&safe, r13
	mov	r12, 344(r13)
	mov	#1, &camel
	jmp	.LBB22_13
.LBB22_13:                              ; %if.end51
                                        ;   in Loop: Header=BB22_7 Depth=2
	jmp	.LBB22_14
.LBB22_14:                              ; %do.end52
                                        ;   in Loop: Header=BB22_7 Depth=2
	call	#task_commit
	jmp	.LBB22_15
.LBB22_15:                              ; %if.end53
                                        ;   in Loop: Header=BB22_7 Depth=2
	mov	&unsafe, r12
	mov	340(r12), r12
	cmp	#100, r12
	jeq	.LBB22_22
	jmp	.LBB22_16
.LBB22_16:                              ; %if.then57
                                        ;   in Loop: Header=BB22_7 Depth=2
	call	#task_exp
	jmp	.LBB22_17
.LBB22_17:                              ; %do.body58
                                        ;   in Loop: Header=BB22_7 Depth=2
	mov	&camel, r12
	cmp	#1, r12
	jne	.LBB22_19
	jmp	.LBB22_18
.LBB22_18:                              ; %if.then60
                                        ;   in Loop: Header=BB22_7 Depth=2
	mov	#camel+348, &safe
	mov	#camel+2, &unsafe
	mov	&safe, r12
	call	#__dump_registers
	;APP
	mov	r1, r12
	;NO_APP
	mov	r12, 238(r1)
	mov	238(r1), r12
	mov	r12, 236(r1)
	mov	236(r1), r12
	incd	r12
	;APP
	mov	r1, r13
	;NO_APP
	mov	r13, 234(r1)
	mov	234(r1), r13
	mov	r13, 232(r1)
	mov	232(r1), r14
	mov	#9214, r13
	sub	r14, r13
	mov	#-1, r14
	call	#__fast_hw_crc
	mov	r12, &tmp_stack_crc
	mov	&safe, r12
	mov	&tmp_stack_crc, r14
	mov	#344, r13
	call	#__fast_hw_crc
	mov	r12, &tmp_stack_buf_crc
	mov	&tmp_stack_buf_crc, r12
	mov	&safe, r13
	mov	r12, 344(r13)
	mov	#2, &camel
	jmp	.LBB22_20
.LBB22_19:                              ; %if.else73
                                        ;   in Loop: Header=BB22_7 Depth=2
	mov	#camel+2, &safe
	mov	#camel+348, &unsafe
	mov	&safe, r12
	call	#__dump_registers
	;APP
	mov	r1, r12
	;NO_APP
	mov	r12, 230(r1)
	mov	230(r1), r12
	mov	r12, 228(r1)
	mov	228(r1), r12
	incd	r12
	;APP
	mov	r1, r13
	;NO_APP
	mov	r13, 226(r1)
	mov	226(r1), r13
	mov	r13, 224(r1)
	mov	224(r1), r14
	mov	#9214, r13
	sub	r14, r13
	mov	#-1, r14
	call	#__fast_hw_crc
	mov	r12, &tmp_stack_crc
	mov	&safe, r12
	mov	&tmp_stack_crc, r14
	mov	#344, r13
	call	#__fast_hw_crc
	mov	r12, &tmp_stack_buf_crc
	mov	&tmp_stack_buf_crc, r12
	mov	&safe, r13
	mov	r12, 344(r13)
	mov	#1, &camel
	jmp	.LBB22_20
.LBB22_20:                              ; %if.end86
                                        ;   in Loop: Header=BB22_7 Depth=2
	jmp	.LBB22_21
.LBB22_21:                              ; %do.end87
                                        ;   in Loop: Header=BB22_7 Depth=2
	call	#task_commit
	jmp	.LBB22_22
.LBB22_22:                              ; %if.end88
                                        ;   in Loop: Header=BB22_7 Depth=2
	call	#task_mult_mod
	jmp	.LBB22_23
.LBB22_23:                              ; %do.body89
                                        ;   in Loop: Header=BB22_7 Depth=2
	mov	&camel, r12
	cmp	#1, r12
	jne	.LBB22_25
	jmp	.LBB22_24
.LBB22_24:                              ; %if.then91
                                        ;   in Loop: Header=BB22_7 Depth=2
	mov	#camel+348, &safe
	mov	#camel+2, &unsafe
	mov	&safe, r12
	call	#__dump_registers
	;APP
	mov	r1, r12
	;NO_APP
	mov	r12, 222(r1)
	mov	222(r1), r12
	mov	r12, 220(r1)
	mov	220(r1), r12
	incd	r12
	;APP
	mov	r1, r13
	;NO_APP
	mov	r13, 218(r1)
	mov	218(r1), r13
	mov	r13, 216(r1)
	mov	216(r1), r14
	mov	#9214, r13
	sub	r14, r13
	mov	#-1, r14
	call	#__fast_hw_crc
	mov	r12, &tmp_stack_crc
	mov	&safe, r12
	mov	&tmp_stack_crc, r14
	mov	#344, r13
	call	#__fast_hw_crc
	mov	r12, &tmp_stack_buf_crc
	mov	&tmp_stack_buf_crc, r12
	mov	&safe, r13
	mov	r12, 344(r13)
	mov	#2, &camel
	jmp	.LBB22_26
.LBB22_25:                              ; %if.else104
                                        ;   in Loop: Header=BB22_7 Depth=2
	mov	#camel+2, &safe
	mov	#camel+348, &unsafe
	mov	&safe, r12
	call	#__dump_registers
	;APP
	mov	r1, r12
	;NO_APP
	mov	r12, 214(r1)
	mov	214(r1), r12
	mov	r12, 212(r1)
	mov	212(r1), r12
	incd	r12
	;APP
	mov	r1, r13
	;NO_APP
	mov	r13, 210(r1)
	mov	210(r1), r13
	mov	r13, 208(r1)
	mov	208(r1), r14
	mov	#9214, r13
	sub	r14, r13
	mov	#-1, r14
	call	#__fast_hw_crc
	mov	r12, &tmp_stack_crc
	mov	&safe, r12
	mov	&tmp_stack_crc, r14
	mov	#344, r13
	call	#__fast_hw_crc
	mov	r12, &tmp_stack_buf_crc
	mov	&tmp_stack_buf_crc, r12
	mov	&safe, r13
	mov	r12, 344(r13)
	mov	#1, &camel
	jmp	.LBB22_26
.LBB22_26:                              ; %if.end117
                                        ;   in Loop: Header=BB22_7 Depth=2
	jmp	.LBB22_27
.LBB22_27:                              ; %do.end118
                                        ;   in Loop: Header=BB22_7 Depth=2
	call	#task_commit
	jmp	.LBB22_28
.LBB22_28:                              ; %do.body119
                                        ;   Parent Loop BB22_1 Depth=1
                                        ;     Parent Loop BB22_7 Depth=2
                                        ; =>    This Inner Loop Header: Depth=3
	call	#task_mult
	jmp	.LBB22_29
.LBB22_29:                              ; %do.body120
                                        ;   in Loop: Header=BB22_28 Depth=3
	mov	&camel, r12
	cmp	#1, r12
	jne	.LBB22_31
	jmp	.LBB22_30
.LBB22_30:                              ; %if.then122
                                        ;   in Loop: Header=BB22_28 Depth=3
	mov	#camel+348, &safe
	mov	#camel+2, &unsafe
	mov	&safe, r12
	call	#__dump_registers
	;APP
	mov	r1, r12
	;NO_APP
	mov	r12, 206(r1)
	mov	206(r1), r12
	mov	r12, 204(r1)
	mov	204(r1), r12
	incd	r12
	;APP
	mov	r1, r13
	;NO_APP
	mov	r13, 202(r1)
	mov	202(r1), r13
	mov	r13, 200(r1)
	mov	200(r1), r14
	mov	#9214, r13
	sub	r14, r13
	mov	#-1, r14
	call	#__fast_hw_crc
	mov	r12, &tmp_stack_crc
	mov	&safe, r12
	mov	&tmp_stack_crc, r14
	mov	#344, r13
	call	#__fast_hw_crc
	mov	r12, &tmp_stack_buf_crc
	mov	&tmp_stack_buf_crc, r12
	mov	&safe, r13
	mov	r12, 344(r13)
	mov	#2, &camel
	jmp	.LBB22_32
.LBB22_31:                              ; %if.else135
                                        ;   in Loop: Header=BB22_28 Depth=3
	mov	#camel+2, &safe
	mov	#camel+348, &unsafe
	mov	&safe, r12
	call	#__dump_registers
	;APP
	mov	r1, r12
	;NO_APP
	mov	r12, 198(r1)
	mov	198(r1), r12
	mov	r12, 196(r1)
	mov	196(r1), r12
	incd	r12
	;APP
	mov	r1, r13
	;NO_APP
	mov	r13, 194(r1)
	mov	194(r1), r13
	mov	r13, 192(r1)
	mov	192(r1), r14
	mov	#9214, r13
	sub	r14, r13
	mov	#-1, r14
	call	#__fast_hw_crc
	mov	r12, &tmp_stack_crc
	mov	&safe, r12
	mov	&tmp_stack_crc, r14
	mov	#344, r13
	call	#__fast_hw_crc
	mov	r12, &tmp_stack_buf_crc
	mov	&tmp_stack_buf_crc, r12
	mov	&safe, r13
	mov	r12, 344(r13)
	mov	#1, &camel
	jmp	.LBB22_32
.LBB22_32:                              ; %if.end148
                                        ;   in Loop: Header=BB22_28 Depth=3
	jmp	.LBB22_33
.LBB22_33:                              ; %do.end149
                                        ;   in Loop: Header=BB22_28 Depth=3
	call	#task_commit
	jmp	.LBB22_34
.LBB22_34:                              ; %do.cond
                                        ;   in Loop: Header=BB22_28 Depth=3
	mov	&safe, r12
	mov	340(r12), r12
	tst	r12
	jeq	.LBB22_28
	jmp	.LBB22_35
.LBB22_35:                              ; %do.end153
                                        ;   in Loop: Header=BB22_7 Depth=2
	call	#task_reduce_digits
	jmp	.LBB22_36
.LBB22_36:                              ; %do.body154
                                        ;   in Loop: Header=BB22_7 Depth=2
	mov	&camel, r12
	cmp	#1, r12
	jne	.LBB22_38
	jmp	.LBB22_37
.LBB22_37:                              ; %if.then156
                                        ;   in Loop: Header=BB22_7 Depth=2
	mov	#camel+348, &safe
	mov	#camel+2, &unsafe
	mov	&safe, r12
	call	#__dump_registers
	;APP
	mov	r1, r12
	;NO_APP
	mov	r12, 190(r1)
	mov	190(r1), r12
	mov	r12, 188(r1)
	mov	188(r1), r12
	incd	r12
	;APP
	mov	r1, r13
	;NO_APP
	mov	r13, 186(r1)
	mov	186(r1), r13
	mov	r13, 184(r1)
	mov	184(r1), r14
	mov	#9214, r13
	sub	r14, r13
	mov	#-1, r14
	call	#__fast_hw_crc
	mov	r12, &tmp_stack_crc
	mov	&safe, r12
	mov	&tmp_stack_crc, r14
	mov	#344, r13
	call	#__fast_hw_crc
	mov	r12, &tmp_stack_buf_crc
	mov	&tmp_stack_buf_crc, r12
	mov	&safe, r13
	mov	r12, 344(r13)
	mov	#2, &camel
	jmp	.LBB22_39
.LBB22_38:                              ; %if.else169
                                        ;   in Loop: Header=BB22_7 Depth=2
	mov	#camel+2, &safe
	mov	#camel+348, &unsafe
	mov	&safe, r12
	call	#__dump_registers
	;APP
	mov	r1, r12
	;NO_APP
	mov	r12, 182(r1)
	mov	182(r1), r12
	mov	r12, 180(r1)
	mov	180(r1), r12
	incd	r12
	;APP
	mov	r1, r13
	;NO_APP
	mov	r13, 178(r1)
	mov	178(r1), r13
	mov	r13, 176(r1)
	mov	176(r1), r14
	mov	#9214, r13
	sub	r14, r13
	mov	#-1, r14
	call	#__fast_hw_crc
	mov	r12, &tmp_stack_crc
	mov	&safe, r12
	mov	&tmp_stack_crc, r14
	mov	#344, r13
	call	#__fast_hw_crc
	mov	r12, &tmp_stack_buf_crc
	mov	&tmp_stack_buf_crc, r12
	mov	&safe, r13
	mov	r12, 344(r13)
	mov	#1, &camel
	jmp	.LBB22_39
.LBB22_39:                              ; %if.end182
                                        ;   in Loop: Header=BB22_7 Depth=2
	jmp	.LBB22_40
.LBB22_40:                              ; %do.end184
                                        ;   in Loop: Header=BB22_7 Depth=2
	call	#task_commit
	mov	&safe, r12
	mov	340(r12), r12
	tst	r12
	jne	.LBB22_42
	jmp	.LBB22_41
.LBB22_41:                              ; %if.then188
                                        ;   in Loop: Header=BB22_1 Depth=1
	br	#.LBB22_119
.LBB22_42:                              ; %if.end189
                                        ;   in Loop: Header=BB22_7 Depth=2
	call	#task_reduce_normalizable
	jmp	.LBB22_43
.LBB22_43:                              ; %do.body190
                                        ;   in Loop: Header=BB22_7 Depth=2
	mov	&camel, r12
	cmp	#1, r12
	jne	.LBB22_45
	jmp	.LBB22_44
.LBB22_44:                              ; %if.then192
                                        ;   in Loop: Header=BB22_7 Depth=2
	mov	#camel+348, &safe
	mov	#camel+2, &unsafe
	mov	&safe, r12
	call	#__dump_registers
	;APP
	mov	r1, r12
	;NO_APP
	mov	r12, 174(r1)
	mov	174(r1), r12
	mov	r12, 172(r1)
	mov	172(r1), r12
	incd	r12
	;APP
	mov	r1, r13
	;NO_APP
	mov	r13, 170(r1)
	mov	170(r1), r13
	mov	r13, 168(r1)
	mov	168(r1), r14
	mov	#9214, r13
	sub	r14, r13
	mov	#-1, r14
	call	#__fast_hw_crc
	mov	r12, &tmp_stack_crc
	mov	&safe, r12
	mov	&tmp_stack_crc, r14
	mov	#344, r13
	call	#__fast_hw_crc
	mov	r12, &tmp_stack_buf_crc
	mov	&tmp_stack_buf_crc, r12
	mov	&safe, r13
	mov	r12, 344(r13)
	mov	#2, &camel
	jmp	.LBB22_46
.LBB22_45:                              ; %if.else205
                                        ;   in Loop: Header=BB22_7 Depth=2
	mov	#camel+2, &safe
	mov	#camel+348, &unsafe
	mov	&safe, r12
	call	#__dump_registers
	;APP
	mov	r1, r12
	;NO_APP
	mov	r12, 166(r1)
	mov	166(r1), r12
	mov	r12, 164(r1)
	mov	164(r1), r12
	incd	r12
	;APP
	mov	r1, r13
	;NO_APP
	mov	r13, 162(r1)
	mov	162(r1), r13
	mov	r13, 160(r1)
	mov	160(r1), r14
	mov	#9214, r13
	sub	r14, r13
	mov	#-1, r14
	call	#__fast_hw_crc
	mov	r12, &tmp_stack_crc
	mov	&safe, r12
	mov	&tmp_stack_crc, r14
	mov	#344, r13
	call	#__fast_hw_crc
	mov	r12, &tmp_stack_buf_crc
	mov	&tmp_stack_buf_crc, r12
	mov	&safe, r13
	mov	r12, 344(r13)
	mov	#1, &camel
	jmp	.LBB22_46
.LBB22_46:                              ; %if.end218
                                        ;   in Loop: Header=BB22_7 Depth=2
	jmp	.LBB22_47
.LBB22_47:                              ; %do.end220
                                        ;   in Loop: Header=BB22_7 Depth=2
	call	#task_commit
	mov	&safe, r12
	mov	340(r12), r12
	tst	r12
	jne	.LBB22_61
	jmp	.LBB22_48
.LBB22_48:                              ; %if.then224
                                        ;   in Loop: Header=BB22_7 Depth=2
	call	#task_reduce_normalize
	jmp	.LBB22_49
.LBB22_49:                              ; %do.body225
                                        ;   in Loop: Header=BB22_7 Depth=2
	mov	&camel, r12
	cmp	#1, r12
	jne	.LBB22_51
	jmp	.LBB22_50
.LBB22_50:                              ; %if.then227
                                        ;   in Loop: Header=BB22_7 Depth=2
	mov	#camel+348, &safe
	mov	#camel+2, &unsafe
	mov	&safe, r12
	call	#__dump_registers
	;APP
	mov	r1, r12
	;NO_APP
	mov	r12, 158(r1)
	mov	158(r1), r12
	mov	r12, 156(r1)
	mov	156(r1), r12
	incd	r12
	;APP
	mov	r1, r13
	;NO_APP
	mov	r13, 154(r1)
	mov	154(r1), r13
	mov	r13, 152(r1)
	mov	152(r1), r14
	mov	#9214, r13
	sub	r14, r13
	mov	#-1, r14
	call	#__fast_hw_crc
	mov	r12, &tmp_stack_crc
	mov	&safe, r12
	mov	&tmp_stack_crc, r14
	mov	#344, r13
	call	#__fast_hw_crc
	mov	r12, &tmp_stack_buf_crc
	mov	&tmp_stack_buf_crc, r12
	mov	&safe, r13
	mov	r12, 344(r13)
	mov	#2, &camel
	jmp	.LBB22_52
.LBB22_51:                              ; %if.else240
                                        ;   in Loop: Header=BB22_7 Depth=2
	mov	#camel+2, &safe
	mov	#camel+348, &unsafe
	mov	&safe, r12
	call	#__dump_registers
	;APP
	mov	r1, r12
	;NO_APP
	mov	r12, 150(r1)
	mov	150(r1), r12
	mov	r12, 148(r1)
	mov	148(r1), r12
	incd	r12
	;APP
	mov	r1, r13
	;NO_APP
	mov	r13, 146(r1)
	mov	146(r1), r13
	mov	r13, 144(r1)
	mov	144(r1), r14
	mov	#9214, r13
	sub	r14, r13
	mov	#-1, r14
	call	#__fast_hw_crc
	mov	r12, &tmp_stack_crc
	mov	&safe, r12
	mov	&tmp_stack_crc, r14
	mov	#344, r13
	call	#__fast_hw_crc
	mov	r12, &tmp_stack_buf_crc
	mov	&tmp_stack_buf_crc, r12
	mov	&safe, r13
	mov	r12, 344(r13)
	mov	#1, &camel
	jmp	.LBB22_52
.LBB22_52:                              ; %if.end253
                                        ;   in Loop: Header=BB22_7 Depth=2
	jmp	.LBB22_53
.LBB22_53:                              ; %do.end255
                                        ;   in Loop: Header=BB22_7 Depth=2
	call	#task_commit
	mov	&unsafe, r12
	mov	206(r12), r12
	tst	r12
	jeq	.LBB22_60
	jmp	.LBB22_54
.LBB22_54:                              ; %if.then258
                                        ;   in Loop: Header=BB22_7 Depth=2
	call	#task_reduce_n_divisor
	jmp	.LBB22_55
.LBB22_55:                              ; %do.body259
                                        ;   in Loop: Header=BB22_7 Depth=2
	mov	&camel, r12
	cmp	#1, r12
	jne	.LBB22_57
	jmp	.LBB22_56
.LBB22_56:                              ; %if.then261
                                        ;   in Loop: Header=BB22_7 Depth=2
	mov	#camel+348, &safe
	mov	#camel+2, &unsafe
	mov	&safe, r12
	call	#__dump_registers
	;APP
	mov	r1, r12
	;NO_APP
	mov	r12, 142(r1)
	mov	142(r1), r12
	mov	r12, 140(r1)
	mov	140(r1), r12
	incd	r12
	;APP
	mov	r1, r13
	;NO_APP
	mov	r13, 138(r1)
	mov	138(r1), r13
	mov	r13, 136(r1)
	mov	136(r1), r14
	mov	#9214, r13
	sub	r14, r13
	mov	#-1, r14
	call	#__fast_hw_crc
	mov	r12, &tmp_stack_crc
	mov	&safe, r12
	mov	&tmp_stack_crc, r14
	mov	#344, r13
	call	#__fast_hw_crc
	mov	r12, &tmp_stack_buf_crc
	mov	&tmp_stack_buf_crc, r12
	mov	&safe, r13
	mov	r12, 344(r13)
	mov	#2, &camel
	jmp	.LBB22_58
.LBB22_57:                              ; %if.else274
                                        ;   in Loop: Header=BB22_7 Depth=2
	mov	#camel+2, &safe
	mov	#camel+348, &unsafe
	mov	&safe, r12
	call	#__dump_registers
	;APP
	mov	r1, r12
	;NO_APP
	mov	r12, 134(r1)
	mov	134(r1), r12
	mov	r12, 132(r1)
	mov	132(r1), r12
	incd	r12
	;APP
	mov	r1, r13
	;NO_APP
	mov	r13, 130(r1)
	mov	130(r1), r13
	mov	r13, 128(r1)
	mov	128(r1), r14
	mov	#9214, r13
	sub	r14, r13
	mov	#-1, r14
	call	#__fast_hw_crc
	mov	r12, &tmp_stack_crc
	mov	&safe, r12
	mov	&tmp_stack_crc, r14
	mov	#344, r13
	call	#__fast_hw_crc
	mov	r12, &tmp_stack_buf_crc
	mov	&tmp_stack_buf_crc, r12
	mov	&safe, r13
	mov	r12, 344(r13)
	mov	#1, &camel
	jmp	.LBB22_58
.LBB22_58:                              ; %if.end287
                                        ;   in Loop: Header=BB22_7 Depth=2
	jmp	.LBB22_59
.LBB22_59:                              ; %do.end289
                                        ;   in Loop: Header=BB22_7 Depth=2
	call	#task_commit
	jmp	.LBB22_60
.LBB22_60:                              ; %if.end290
                                        ;   in Loop: Header=BB22_7 Depth=2
	jmp	.LBB22_69
.LBB22_61:                              ; %if.else291
                                        ;   in Loop: Header=BB22_7 Depth=2
	mov	&safe, r12
	mov	340(r12), r12
	cmp	#1, r12
	jne	.LBB22_68
	jmp	.LBB22_62
.LBB22_62:                              ; %if.then295
                                        ;   in Loop: Header=BB22_7 Depth=2
	call	#task_reduce_n_divisor
	jmp	.LBB22_63
.LBB22_63:                              ; %do.body296
                                        ;   in Loop: Header=BB22_7 Depth=2
	mov	&camel, r12
	cmp	#1, r12
	jne	.LBB22_65
	jmp	.LBB22_64
.LBB22_64:                              ; %if.then298
                                        ;   in Loop: Header=BB22_7 Depth=2
	mov	#camel+348, &safe
	mov	#camel+2, &unsafe
	mov	&safe, r12
	call	#__dump_registers
	;APP
	mov	r1, r12
	;NO_APP
	mov	r12, 126(r1)
	mov	126(r1), r12
	mov	r12, 124(r1)
	mov	124(r1), r12
	incd	r12
	;APP
	mov	r1, r13
	;NO_APP
	mov	r13, 122(r1)
	mov	122(r1), r13
	mov	r13, 120(r1)
	mov	120(r1), r14
	mov	#9214, r13
	sub	r14, r13
	mov	#-1, r14
	call	#__fast_hw_crc
	mov	r12, &tmp_stack_crc
	mov	&safe, r12
	mov	&tmp_stack_crc, r14
	mov	#344, r13
	call	#__fast_hw_crc
	mov	r12, &tmp_stack_buf_crc
	mov	&tmp_stack_buf_crc, r12
	mov	&safe, r13
	mov	r12, 344(r13)
	mov	#2, &camel
	jmp	.LBB22_66
.LBB22_65:                              ; %if.else311
                                        ;   in Loop: Header=BB22_7 Depth=2
	mov	#camel+2, &safe
	mov	#camel+348, &unsafe
	mov	&safe, r12
	call	#__dump_registers
	;APP
	mov	r1, r12
	;NO_APP
	mov	r12, 118(r1)
	mov	118(r1), r12
	mov	r12, 116(r1)
	mov	116(r1), r12
	incd	r12
	;APP
	mov	r1, r13
	;NO_APP
	mov	r13, 114(r1)
	mov	114(r1), r13
	mov	r13, 112(r1)
	mov	112(r1), r14
	mov	#9214, r13
	sub	r14, r13
	mov	#-1, r14
	call	#__fast_hw_crc
	mov	r12, &tmp_stack_crc
	mov	&safe, r12
	mov	&tmp_stack_crc, r14
	mov	#344, r13
	call	#__fast_hw_crc
	mov	r12, &tmp_stack_buf_crc
	mov	&tmp_stack_buf_crc, r12
	mov	&safe, r13
	mov	r12, 344(r13)
	mov	#1, &camel
	jmp	.LBB22_66
.LBB22_66:                              ; %if.end324
                                        ;   in Loop: Header=BB22_7 Depth=2
	jmp	.LBB22_67
.LBB22_67:                              ; %do.end326
                                        ;   in Loop: Header=BB22_7 Depth=2
	call	#task_commit
	jmp	.LBB22_68
.LBB22_68:                              ; %if.end327
                                        ;   in Loop: Header=BB22_7 Depth=2
	jmp	.LBB22_69
.LBB22_69:                              ; %if.end328
                                        ;   in Loop: Header=BB22_7 Depth=2
	mov	&unsafe, r12
	mov	340(r12), r12
	cmp	#2, r12
	jne	.LBB22_70
	br	#.LBB22_103
.LBB22_70:                              ; %if.end328
                                        ;   in Loop: Header=BB22_7 Depth=2
	jmp	.LBB22_71
.LBB22_71:                              ; %if.then332
                                        ;   in Loop: Header=BB22_7 Depth=2
	jmp	.LBB22_72
.LBB22_72:                              ; %do.body333
                                        ;   Parent Loop BB22_1 Depth=1
                                        ;     Parent Loop BB22_7 Depth=2
                                        ; =>    This Inner Loop Header: Depth=3
	call	#task_reduce_quotient
	jmp	.LBB22_73
.LBB22_73:                              ; %do.body334
                                        ;   in Loop: Header=BB22_72 Depth=3
	mov	&camel, r12
	cmp	#1, r12
	jne	.LBB22_75
	jmp	.LBB22_74
.LBB22_74:                              ; %if.then336
                                        ;   in Loop: Header=BB22_72 Depth=3
	mov	#camel+348, &safe
	mov	#camel+2, &unsafe
	mov	&safe, r12
	call	#__dump_registers
	;APP
	mov	r1, r12
	;NO_APP
	mov	r12, 110(r1)
	mov	110(r1), r12
	mov	r12, 108(r1)
	mov	108(r1), r12
	incd	r12
	;APP
	mov	r1, r13
	;NO_APP
	mov	r13, 106(r1)
	mov	106(r1), r13
	mov	r13, 104(r1)
	mov	104(r1), r14
	mov	#9214, r13
	sub	r14, r13
	mov	#-1, r14
	call	#__fast_hw_crc
	mov	r12, &tmp_stack_crc
	mov	&safe, r12
	mov	&tmp_stack_crc, r14
	mov	#344, r13
	call	#__fast_hw_crc
	mov	r12, &tmp_stack_buf_crc
	mov	&tmp_stack_buf_crc, r12
	mov	&safe, r13
	mov	r12, 344(r13)
	mov	#2, &camel
	jmp	.LBB22_76
.LBB22_75:                              ; %if.else349
                                        ;   in Loop: Header=BB22_72 Depth=3
	mov	#camel+2, &safe
	mov	#camel+348, &unsafe
	mov	&safe, r12
	call	#__dump_registers
	;APP
	mov	r1, r12
	;NO_APP
	mov	r12, 102(r1)
	mov	102(r1), r12
	mov	r12, 100(r1)
	mov	100(r1), r12
	incd	r12
	;APP
	mov	r1, r13
	;NO_APP
	mov	r13, 98(r1)
	mov	98(r1), r13
	mov	r13, 96(r1)
	mov	96(r1), r14
	mov	#9214, r13
	sub	r14, r13
	mov	#-1, r14
	call	#__fast_hw_crc
	mov	r12, &tmp_stack_crc
	mov	&safe, r12
	mov	&tmp_stack_crc, r14
	mov	#344, r13
	call	#__fast_hw_crc
	mov	r12, &tmp_stack_buf_crc
	mov	&tmp_stack_buf_crc, r12
	mov	&safe, r13
	mov	r12, 344(r13)
	mov	#1, &camel
	jmp	.LBB22_76
.LBB22_76:                              ; %if.end362
                                        ;   in Loop: Header=BB22_72 Depth=3
	jmp	.LBB22_77
.LBB22_77:                              ; %do.end364
                                        ;   in Loop: Header=BB22_72 Depth=3
	call	#task_commit
	call	#task_reduce_multiply
	jmp	.LBB22_78
.LBB22_78:                              ; %do.body365
                                        ;   in Loop: Header=BB22_72 Depth=3
	mov	&camel, r12
	cmp	#1, r12
	jne	.LBB22_80
	jmp	.LBB22_79
.LBB22_79:                              ; %if.then367
                                        ;   in Loop: Header=BB22_72 Depth=3
	mov	#camel+348, &safe
	mov	#camel+2, &unsafe
	mov	&safe, r12
	call	#__dump_registers
	;APP
	mov	r1, r12
	;NO_APP
	mov	r12, 94(r1)
	mov	94(r1), r12
	mov	r12, 92(r1)
	mov	92(r1), r12
	incd	r12
	;APP
	mov	r1, r13
	;NO_APP
	mov	r13, 90(r1)
	mov	90(r1), r13
	mov	r13, 88(r1)
	mov	88(r1), r14
	mov	#9214, r13
	sub	r14, r13
	mov	#-1, r14
	call	#__fast_hw_crc
	mov	r12, &tmp_stack_crc
	mov	&safe, r12
	mov	&tmp_stack_crc, r14
	mov	#344, r13
	call	#__fast_hw_crc
	mov	r12, &tmp_stack_buf_crc
	mov	&tmp_stack_buf_crc, r12
	mov	&safe, r13
	mov	r12, 344(r13)
	mov	#2, &camel
	jmp	.LBB22_81
.LBB22_80:                              ; %if.else380
                                        ;   in Loop: Header=BB22_72 Depth=3
	mov	#camel+2, &safe
	mov	#camel+348, &unsafe
	mov	&safe, r12
	call	#__dump_registers
	;APP
	mov	r1, r12
	;NO_APP
	mov	r12, 86(r1)
	mov	86(r1), r12
	mov	r12, 84(r1)
	mov	84(r1), r12
	incd	r12
	;APP
	mov	r1, r13
	;NO_APP
	mov	r13, 82(r1)
	mov	82(r1), r13
	mov	r13, 80(r1)
	mov	80(r1), r14
	mov	#9214, r13
	sub	r14, r13
	mov	#-1, r14
	call	#__fast_hw_crc
	mov	r12, &tmp_stack_crc
	mov	&safe, r12
	mov	&tmp_stack_crc, r14
	mov	#344, r13
	call	#__fast_hw_crc
	mov	r12, &tmp_stack_buf_crc
	mov	&tmp_stack_buf_crc, r12
	mov	&safe, r13
	mov	r12, 344(r13)
	mov	#1, &camel
	jmp	.LBB22_81
.LBB22_81:                              ; %if.end393
                                        ;   in Loop: Header=BB22_72 Depth=3
	jmp	.LBB22_82
.LBB22_82:                              ; %do.end395
                                        ;   in Loop: Header=BB22_72 Depth=3
	call	#task_commit
	call	#task_reduce_compare
	jmp	.LBB22_83
.LBB22_83:                              ; %do.body396
                                        ;   in Loop: Header=BB22_72 Depth=3
	mov	&camel, r12
	cmp	#1, r12
	jne	.LBB22_85
	jmp	.LBB22_84
.LBB22_84:                              ; %if.then398
                                        ;   in Loop: Header=BB22_72 Depth=3
	mov	#camel+348, &safe
	mov	#camel+2, &unsafe
	mov	&safe, r12
	call	#__dump_registers
	;APP
	mov	r1, r12
	;NO_APP
	mov	r12, 78(r1)
	mov	78(r1), r12
	mov	r12, 76(r1)
	mov	76(r1), r12
	incd	r12
	;APP
	mov	r1, r13
	;NO_APP
	mov	r13, 74(r1)
	mov	74(r1), r13
	mov	r13, 72(r1)
	mov	72(r1), r14
	mov	#9214, r13
	sub	r14, r13
	mov	#-1, r14
	call	#__fast_hw_crc
	mov	r12, &tmp_stack_crc
	mov	&safe, r12
	mov	&tmp_stack_crc, r14
	mov	#344, r13
	call	#__fast_hw_crc
	mov	r12, &tmp_stack_buf_crc
	mov	&tmp_stack_buf_crc, r12
	mov	&safe, r13
	mov	r12, 344(r13)
	mov	#2, &camel
	jmp	.LBB22_86
.LBB22_85:                              ; %if.else411
                                        ;   in Loop: Header=BB22_72 Depth=3
	mov	#camel+2, &safe
	mov	#camel+348, &unsafe
	mov	&safe, r12
	call	#__dump_registers
	;APP
	mov	r1, r12
	;NO_APP
	mov	r12, 70(r1)
	mov	70(r1), r12
	mov	r12, 68(r1)
	mov	68(r1), r12
	incd	r12
	;APP
	mov	r1, r13
	;NO_APP
	mov	r13, 66(r1)
	mov	66(r1), r13
	mov	r13, 64(r1)
	mov	64(r1), r14
	mov	#9214, r13
	sub	r14, r13
	mov	#-1, r14
	call	#__fast_hw_crc
	mov	r12, &tmp_stack_crc
	mov	&safe, r12
	mov	&tmp_stack_crc, r14
	mov	#344, r13
	call	#__fast_hw_crc
	mov	r12, &tmp_stack_buf_crc
	mov	&tmp_stack_buf_crc, r12
	mov	&safe, r13
	mov	r12, 344(r13)
	mov	#1, &camel
	jmp	.LBB22_86
.LBB22_86:                              ; %if.end424
                                        ;   in Loop: Header=BB22_72 Depth=3
	jmp	.LBB22_87
.LBB22_87:                              ; %do.end426
                                        ;   in Loop: Header=BB22_72 Depth=3
	call	#task_commit
	mov	&safe, r12
	mov	340(r12), r12
	tst	r12
	jne	.LBB22_94
	jmp	.LBB22_88
.LBB22_88:                              ; %if.then430
                                        ;   in Loop: Header=BB22_72 Depth=3
	call	#task_reduce_add
	jmp	.LBB22_89
.LBB22_89:                              ; %do.body431
                                        ;   in Loop: Header=BB22_72 Depth=3
	mov	&camel, r12
	cmp	#1, r12
	jne	.LBB22_91
	jmp	.LBB22_90
.LBB22_90:                              ; %if.then433
                                        ;   in Loop: Header=BB22_72 Depth=3
	mov	#camel+348, &safe
	mov	#camel+2, &unsafe
	mov	&safe, r12
	call	#__dump_registers
	;APP
	mov	r1, r12
	;NO_APP
	mov	r12, 62(r1)
	mov	62(r1), r12
	mov	r12, 60(r1)
	mov	60(r1), r12
	incd	r12
	;APP
	mov	r1, r13
	;NO_APP
	mov	r13, 58(r1)
	mov	58(r1), r13
	mov	r13, 56(r1)
	mov	56(r1), r14
	mov	#9214, r13
	sub	r14, r13
	mov	#-1, r14
	call	#__fast_hw_crc
	mov	r12, &tmp_stack_crc
	mov	&safe, r12
	mov	&tmp_stack_crc, r14
	mov	#344, r13
	call	#__fast_hw_crc
	mov	r12, &tmp_stack_buf_crc
	mov	&tmp_stack_buf_crc, r12
	mov	&safe, r13
	mov	r12, 344(r13)
	mov	#2, &camel
	jmp	.LBB22_92
.LBB22_91:                              ; %if.else446
                                        ;   in Loop: Header=BB22_72 Depth=3
	mov	#camel+2, &safe
	mov	#camel+348, &unsafe
	mov	&safe, r12
	call	#__dump_registers
	;APP
	mov	r1, r12
	;NO_APP
	mov	r12, 54(r1)
	mov	54(r1), r12
	mov	r12, 52(r1)
	mov	52(r1), r12
	incd	r12
	;APP
	mov	r1, r13
	;NO_APP
	mov	r13, 50(r1)
	mov	50(r1), r13
	mov	r13, 48(r1)
	mov	48(r1), r14
	mov	#9214, r13
	sub	r14, r13
	mov	#-1, r14
	call	#__fast_hw_crc
	mov	r12, &tmp_stack_crc
	mov	&safe, r12
	mov	&tmp_stack_crc, r14
	mov	#344, r13
	call	#__fast_hw_crc
	mov	r12, &tmp_stack_buf_crc
	mov	&tmp_stack_buf_crc, r12
	mov	&safe, r13
	mov	r12, 344(r13)
	mov	#1, &camel
	jmp	.LBB22_92
.LBB22_92:                              ; %if.end459
                                        ;   in Loop: Header=BB22_72 Depth=3
	jmp	.LBB22_93
.LBB22_93:                              ; %do.end461
                                        ;   in Loop: Header=BB22_72 Depth=3
	call	#task_commit
	jmp	.LBB22_94
.LBB22_94:                              ; %if.end462
                                        ;   in Loop: Header=BB22_72 Depth=3
	call	#task_reduce_subtract
	jmp	.LBB22_95
.LBB22_95:                              ; %do.body463
                                        ;   in Loop: Header=BB22_72 Depth=3
	mov	&camel, r12
	cmp	#1, r12
	jne	.LBB22_97
	jmp	.LBB22_96
.LBB22_96:                              ; %if.then465
                                        ;   in Loop: Header=BB22_72 Depth=3
	mov	#camel+348, &safe
	mov	#camel+2, &unsafe
	mov	&safe, r12
	call	#__dump_registers
	;APP
	mov	r1, r12
	;NO_APP
	mov	r12, 46(r1)
	mov	46(r1), r12
	mov	r12, 44(r1)
	mov	44(r1), r12
	incd	r12
	;APP
	mov	r1, r13
	;NO_APP
	mov	r13, 42(r1)
	mov	42(r1), r13
	mov	r13, 40(r1)
	mov	40(r1), r14
	mov	#9214, r13
	sub	r14, r13
	mov	#-1, r14
	call	#__fast_hw_crc
	mov	r12, &tmp_stack_crc
	mov	&safe, r12
	mov	&tmp_stack_crc, r14
	mov	#344, r13
	call	#__fast_hw_crc
	mov	r12, &tmp_stack_buf_crc
	mov	&tmp_stack_buf_crc, r12
	mov	&safe, r13
	mov	r12, 344(r13)
	mov	#2, &camel
	jmp	.LBB22_98
.LBB22_97:                              ; %if.else478
                                        ;   in Loop: Header=BB22_72 Depth=3
	mov	#camel+2, &safe
	mov	#camel+348, &unsafe
	mov	&safe, r12
	call	#__dump_registers
	;APP
	mov	r1, r12
	;NO_APP
	mov	r12, 38(r1)
	mov	38(r1), r12
	mov	r12, 36(r1)
	mov	36(r1), r12
	incd	r12
	;APP
	mov	r1, r13
	;NO_APP
	mov	r13, 34(r1)
	mov	34(r1), r13
	mov	r13, 32(r1)
	mov	32(r1), r14
	mov	#9214, r13
	sub	r14, r13
	mov	#-1, r14
	call	#__fast_hw_crc
	mov	r12, &tmp_stack_crc
	mov	&safe, r12
	mov	&tmp_stack_crc, r14
	mov	#344, r13
	call	#__fast_hw_crc
	mov	r12, &tmp_stack_buf_crc
	mov	&tmp_stack_buf_crc, r12
	mov	&safe, r13
	mov	r12, 344(r13)
	mov	#1, &camel
	jmp	.LBB22_98
.LBB22_98:                              ; %if.end491
                                        ;   in Loop: Header=BB22_72 Depth=3
	jmp	.LBB22_99
.LBB22_99:                              ; %do.end493
                                        ;   in Loop: Header=BB22_72 Depth=3
	call	#task_commit
	jmp	.LBB22_100
.LBB22_100:                             ; %do.cond494
                                        ;   in Loop: Header=BB22_72 Depth=3
	mov	&safe, r12
	mov	172(r12), r12
	inc	r12
	cmp	#5, r12
	jlo	.LBB22_101
	br	#.LBB22_72
.LBB22_101:                             ; %do.cond494
                                        ;   in Loop: Header=BB22_7 Depth=2
	jmp	.LBB22_102
.LBB22_102:                             ; %do.end498
                                        ;   in Loop: Header=BB22_7 Depth=2
	jmp	.LBB22_103
.LBB22_103:                             ; %if.end499
                                        ;   in Loop: Header=BB22_7 Depth=2
	mov	&safe, r12
	mov	342(r12), r12
	tst	r12
	jne	.LBB22_110
	jmp	.LBB22_104
.LBB22_104:                             ; %if.then503
                                        ;   in Loop: Header=BB22_7 Depth=2
	call	#task_mult_block_get_result
	jmp	.LBB22_105
.LBB22_105:                             ; %do.body504
                                        ;   in Loop: Header=BB22_7 Depth=2
	mov	&camel, r12
	cmp	#1, r12
	jne	.LBB22_107
	jmp	.LBB22_106
.LBB22_106:                             ; %if.then506
                                        ;   in Loop: Header=BB22_7 Depth=2
	mov	#camel+348, &safe
	mov	#camel+2, &unsafe
	mov	&safe, r12
	call	#__dump_registers
	;APP
	mov	r1, r12
	;NO_APP
	mov	r12, 30(r1)
	mov	30(r1), r12
	mov	r12, 28(r1)
	mov	28(r1), r12
	incd	r12
	;APP
	mov	r1, r13
	;NO_APP
	mov	r13, 26(r1)
	mov	26(r1), r13
	mov	r13, 24(r1)
	mov	24(r1), r14
	mov	#9214, r13
	sub	r14, r13
	mov	#-1, r14
	call	#__fast_hw_crc
	mov	r12, &tmp_stack_crc
	mov	&safe, r12
	mov	&tmp_stack_crc, r14
	mov	#344, r13
	call	#__fast_hw_crc
	mov	r12, &tmp_stack_buf_crc
	mov	&tmp_stack_buf_crc, r12
	mov	&safe, r13
	mov	r12, 344(r13)
	mov	#2, &camel
	jmp	.LBB22_108
.LBB22_107:                             ; %if.else519
                                        ;   in Loop: Header=BB22_7 Depth=2
	mov	#camel+2, &safe
	mov	#camel+348, &unsafe
	mov	&safe, r12
	call	#__dump_registers
	;APP
	mov	r1, r12
	;NO_APP
	mov	r12, 22(r1)
	mov	22(r1), r12
	mov	r12, 20(r1)
	mov	20(r1), r12
	incd	r12
	;APP
	mov	r1, r13
	;NO_APP
	mov	r13, 18(r1)
	mov	18(r1), r13
	mov	r13, 16(r1)
	mov	16(r1), r14
	mov	#9214, r13
	sub	r14, r13
	mov	#-1, r14
	call	#__fast_hw_crc
	mov	r12, &tmp_stack_crc
	mov	&safe, r12
	mov	&tmp_stack_crc, r14
	mov	#344, r13
	call	#__fast_hw_crc
	mov	r12, &tmp_stack_buf_crc
	mov	&tmp_stack_buf_crc, r12
	mov	&safe, r13
	mov	r12, 344(r13)
	mov	#1, &camel
	jmp	.LBB22_108
.LBB22_108:                             ; %if.end532
                                        ;   in Loop: Header=BB22_7 Depth=2
	jmp	.LBB22_109
.LBB22_109:                             ; %do.end534
                                        ;   in Loop: Header=BB22_7 Depth=2
	call	#task_commit
	jmp	.LBB22_118
.LBB22_110:                             ; %if.else535
                                        ;   in Loop: Header=BB22_7 Depth=2
	mov	&safe, r12
	mov	342(r12), r12
	cmp	#1, r12
	jne	.LBB22_117
	jmp	.LBB22_111
.LBB22_111:                             ; %if.then539
                                        ;   in Loop: Header=BB22_7 Depth=2
	call	#task_square_base_get_result
	jmp	.LBB22_112
.LBB22_112:                             ; %do.body540
                                        ;   in Loop: Header=BB22_7 Depth=2
	mov	&camel, r12
	cmp	#1, r12
	jne	.LBB22_114
	jmp	.LBB22_113
.LBB22_113:                             ; %if.then542
                                        ;   in Loop: Header=BB22_7 Depth=2
	mov	#camel+348, &safe
	mov	#camel+2, &unsafe
	mov	&safe, r12
	call	#__dump_registers
	;APP
	mov	r1, r12
	;NO_APP
	mov	r12, 14(r1)
	mov	14(r1), r12
	mov	r12, 12(r1)
	mov	12(r1), r12
	incd	r12
	;APP
	mov	r1, r13
	;NO_APP
	mov	r13, 10(r1)
	mov	10(r1), r13
	mov	r13, 8(r1)
	mov	8(r1), r14
	mov	#9214, r13
	sub	r14, r13
	mov	#-1, r14
	call	#__fast_hw_crc
	mov	r12, &tmp_stack_crc
	mov	&safe, r12
	mov	&tmp_stack_crc, r14
	mov	#344, r13
	call	#__fast_hw_crc
	mov	r12, &tmp_stack_buf_crc
	mov	&tmp_stack_buf_crc, r12
	mov	&safe, r13
	mov	r12, 344(r13)
	mov	#2, &camel
	jmp	.LBB22_115
.LBB22_114:                             ; %if.else555
                                        ;   in Loop: Header=BB22_7 Depth=2
	mov	#camel+2, &safe
	mov	#camel+348, &unsafe
	mov	&safe, r12
	call	#__dump_registers
	;APP
	mov	r1, r12
	;NO_APP
	mov	r12, 6(r1)
	mov	6(r1), r12
	mov	r12, 4(r1)
	mov	4(r1), r12
	incd	r12
	;APP
	mov	r1, r13
	;NO_APP
	mov	r13, 2(r1)
	mov	2(r1), r13
	mov	r13, 0(r1)
	mov	0(r1), r14
	mov	#9214, r13
	sub	r14, r13
	mov	#-1, r14
	call	#__fast_hw_crc
	mov	r12, &tmp_stack_crc
	mov	&safe, r12
	mov	&tmp_stack_crc, r14
	mov	#344, r13
	call	#__fast_hw_crc
	mov	r12, &tmp_stack_buf_crc
	mov	&tmp_stack_buf_crc, r12
	mov	&safe, r13
	mov	r12, 344(r13)
	mov	#1, &camel
	jmp	.LBB22_115
.LBB22_115:                             ; %if.end568
                                        ;   in Loop: Header=BB22_7 Depth=2
	jmp	.LBB22_116
.LBB22_116:                             ; %do.end570
                                        ;   in Loop: Header=BB22_7 Depth=2
	call	#task_commit
	jmp	.LBB22_117
.LBB22_117:                             ; %if.end571
                                        ;   in Loop: Header=BB22_7 Depth=2
	jmp	.LBB22_118
.LBB22_118:                             ; %if.end572
                                        ;   in Loop: Header=BB22_7 Depth=2
	br	#.LBB22_7
.LBB22_119:                             ; %while.end
                                        ;   in Loop: Header=BB22_1 Depth=1
	br	#.LBB22_1
.Lfunc_end22:
	.size	main, .Lfunc_end22-main
                                        ; -- End function
	.type	camel,@object           ; @camel
	.comm	camel,694,2
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
	.ascii	"EjI\252"
	.short	3                       ; 0x3
	.size	pubkey, 6

	.type	PLAINTEXT,@object       ; @PLAINTEXT
PLAINTEXT:
	.asciz	".RRSSAA."
	.size	PLAINTEXT, 9

	.type	buf,@object             ; @buf
	.comm	buf,22,2

	.ident	"clang version 10.0.0 (https://github.com/llvm/llvm-project.git f79f68975d51b389d9f141aa30ab47723a75a868)"
	.section	".note.GNU-stack","",@progbits
