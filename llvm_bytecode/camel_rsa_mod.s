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
	mov	&camel, r12
	cmp	#1, r12
	jne	.LBB1_2
	jmp	.LBB1_1
.LBB1_1:                                ; %if.then
	mov	#camel+2, &safe
	mov	#camel+228, &unsafe
	jmp	.LBB1_6
.LBB1_2:                                ; %if.else
	mov	&camel, r12
	cmp	#2, r12
	jne	.LBB1_4
	jmp	.LBB1_3
.LBB1_3:                                ; %if.then2
	mov	#camel+228, &safe
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
	call	#camel_init
	mov	&safe, r12
	call	#__restore_registers
	ret
.Lfunc_end1:
	.size	camel_recover, .Lfunc_end1-camel_recover
                                        ; -- End function
	.globl	task_done               ; -- Begin function task_done
	.p2align	1
	.type	task_done,@function
task_done:                              ; @task_done
.Lfunc_begin2:
; %bb.0:                                ; %entry
	clr	r12
	call	#exit
.Lfunc_end2:
	.size	task_done, .Lfunc_end2-task_done
                                        ; -- End function
	.globl	task_init               ; -- Begin function task_init
	.p2align	1
	.type	task_init,@function
task_init:                              ; @task_init
.Lfunc_begin3:
; %bb.0:                                ; %entry
	sub	#4, r1
	mov	#11, 0(r1)
	clr	2(r1)
	jmp	.LBB3_1
.LBB3_1:                                ; %for.cond
                                        ; =>This Inner Loop Header: Depth=1
	mov	2(r1), r12
	cmp	#8, r12
	jge	.LBB3_4
	jmp	.LBB3_2
.LBB3_2:                                ; %for.body
                                        ;   in Loop: Header=BB3_1 Depth=1
	mov	2(r1), r12
	mov.b	pubkey(r12), r13
	mov	&unsafe, r14
	add	r12, r12
	add	r12, r14
	mov	r13, 96(r14)
	jmp	.LBB3_3
.LBB3_3:                                ; %for.inc
                                        ;   in Loop: Header=BB3_1 Depth=1
	mov	2(r1), r12
	inc	r12
	mov	r12, 2(r1)
	jmp	.LBB3_1
.LBB3_4:                                ; %for.end
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
.Lfunc_end3:
	.size	task_init, .Lfunc_end3-task_init
                                        ; -- End function
	.globl	task_pad                ; -- Begin function task_pad
	.p2align	1
	.type	task_pad,@function
task_pad:                               ; @task_pad
.Lfunc_begin4:
; %bb.0:                                ; %entry
	sub	#4, r1
	mov	&unsafe, r12
	mov	58(r12), r13
	mov	60(r12), r12
	cmp	r12, r13
	jlo	.LBB4_2
	jmp	.LBB4_1
.LBB4_1:                                ; %if.then
	call	#task_done
	jmp	.LBB4_2
.LBB4_2:                                ; %if.end
	clr	0(r1)
	clr	2(r1)
	jmp	.LBB4_3
.LBB4_3:                                ; %for.cond
                                        ; =>This Inner Loop Header: Depth=1
	mov	2(r1), r12
	cmp	#7, r12
	jhs	.LBB4_9
	jmp	.LBB4_4
.LBB4_4:                                ; %for.body
                                        ;   in Loop: Header=BB4_3 Depth=1
	mov	&unsafe, r12
	mov	58(r12), r13
	mov	2(r1), r14
	add	r14, r13
	mov	60(r12), r12
	cmp	r12, r13
	jhs	.LBB4_6
	jmp	.LBB4_5
.LBB4_5:                                ; %cond.true
                                        ;   in Loop: Header=BB4_3 Depth=1
	mov	&unsafe, r12
	mov	58(r12), r12
	mov	2(r1), r13
	add	r13, r12
	mov.b	PLAINTEXT(r12), r12
	jmp	.LBB4_7
.LBB4_6:                                ; %cond.false
                                        ;   in Loop: Header=BB4_3 Depth=1
	mov	#255, r12
	jmp	.LBB4_7
.LBB4_7:                                ; %cond.end
                                        ;   in Loop: Header=BB4_3 Depth=1
	mov	&unsafe, r13
	mov	2(r1), r14
	add	r14, r14
	add	r14, r13
	mov	r12, 64(r13)
	jmp	.LBB4_8
.LBB4_8:                                ; %for.inc
                                        ;   in Loop: Header=BB4_3 Depth=1
	mov	2(r1), r12
	inc	r12
	mov	r12, 2(r1)
	jmp	.LBB4_3
.LBB4_9:                                ; %for.end
	mov	#7, 2(r1)
	jmp	.LBB4_10
.LBB4_10:                               ; %for.cond13
                                        ; =>This Inner Loop Header: Depth=1
	mov	2(r1), r12
	cmp	#8, r12
	jge	.LBB4_13
	jmp	.LBB4_11
.LBB4_11:                               ; %for.body16
                                        ;   in Loop: Header=BB4_10 Depth=1
	mov	&unsafe, r12
	mov	2(r1), r13
	add	r13, r13
	add	r13, r12
	mov	#1, 64(r12)
	jmp	.LBB4_12
.LBB4_12:                               ; %for.inc20
                                        ;   in Loop: Header=BB4_10 Depth=1
	mov	2(r1), r12
	inc	r12
	mov	r12, 2(r1)
	jmp	.LBB4_10
.LBB4_13:                               ; %for.end22
	mov	&unsafe, r12
	mov	0(r1), r13
	add	r13, r13
	add	r13, r12
	mov	#1, 186(r12)
	mov	#1, 2(r1)
	jmp	.LBB4_14
.LBB4_14:                               ; %for.cond25
                                        ; =>This Inner Loop Header: Depth=1
	mov	2(r1), r12
	cmp	#8, r12
	jge	.LBB4_17
	jmp	.LBB4_15
.LBB4_15:                               ; %for.body28
                                        ;   in Loop: Header=BB4_14 Depth=1
	mov	&unsafe, r12
	mov	2(r1), r13
	add	r13, r13
	add	r13, r12
	clr	186(r12)
	jmp	.LBB4_16
.LBB4_16:                               ; %for.inc32
                                        ;   in Loop: Header=BB4_14 Depth=1
	mov	2(r1), r12
	inc	r12
	mov	r12, 2(r1)
	jmp	.LBB4_14
.LBB4_17:                               ; %for.end34
	mov	&pubkey+8, r12
	mov	&unsafe, r13
	mov	r12, 54(r13)
	mov	&unsafe, r12
	mov	58(r12), r13
	add	#7, r13
	mov	r13, 58(r12)
	mov	&unsafe, r12
	mov	#2, 220(r12)
	add	#4, r1
	ret
.Lfunc_end4:
	.size	task_pad, .Lfunc_end4-task_pad
                                        ; -- End function
	.globl	task_exp                ; -- Begin function task_exp
	.p2align	1
	.type	task_exp,@function
task_exp:                               ; @task_exp
.Lfunc_begin5:
; %bb.0:                                ; %entry
	mov	&unsafe, r12
	mov.b	54(r12), r12
	bit.b	#1, r12
	jeq	.LBB5_2
	jmp	.LBB5_1
.LBB5_1:                                ; %if.then
	mov	&unsafe, r12
	mov	54(r12), r13
	clrc
	rrc	r13
	mov	r13, 54(r12)
	mov	&unsafe, r12
	clr	220(r12)
	jmp	.LBB5_3
.LBB5_2:                                ; %if.else
	mov	&unsafe, r12
	mov	54(r12), r13
	clrc
	rrc	r13
	mov	r13, 54(r12)
	mov	&unsafe, r12
	mov	#1, 220(r12)
	jmp	.LBB5_3
.LBB5_3:                                ; %if.end
	ret
.Lfunc_end5:
	.size	task_exp, .Lfunc_end5-task_exp
                                        ; -- End function
	.globl	task_mult_block         ; -- Begin function task_mult_block
	.p2align	1
	.type	task_mult_block,@function
task_mult_block:                        ; @task_mult_block
.Lfunc_begin6:
; %bb.0:                                ; %entry
	mov	&unsafe, r12
	clr	222(r12)
	ret
.Lfunc_end6:
	.size	task_mult_block, .Lfunc_end6-task_mult_block
                                        ; -- End function
	.globl	task_mult_block_get_result ; -- Begin function task_mult_block_get_result
	.p2align	1
	.type	task_mult_block_get_result,@function
task_mult_block_get_result:             ; @task_mult_block_get_result
.Lfunc_begin7:
; %bb.0:                                ; %entry
	sub	#4, r1
	mov	#7, 2(r1)
	jmp	.LBB7_1
.LBB7_1:                                ; %for.cond
                                        ; =>This Inner Loop Header: Depth=1
	mov	2(r1), r12
	tst	r12
	jl	.LBB7_4
	jmp	.LBB7_2
.LBB7_2:                                ; %for.body
                                        ;   in Loop: Header=BB7_1 Depth=1
	mov	&unsafe, r12
	mov	2(r1), r13
	add	r13, r13
	add	r13, r12
	mov	22(r12), r13
	mov	r13, 186(r12)
	jmp	.LBB7_3
.LBB7_3:                                ; %for.inc
                                        ;   in Loop: Header=BB7_1 Depth=1
	mov	2(r1), r12
	add	#-1, r12
	mov	r12, 2(r1)
	jmp	.LBB7_1
.LBB7_4:                                ; %for.end
	mov	&unsafe, r12
	mov	54(r12), r12
	tst	r12
	jeq	.LBB7_6
	jmp	.LBB7_5
.LBB7_5:                                ; %if.then
	mov	&unsafe, r12
	mov	#1, 220(r12)
	jmp	.LBB7_13
.LBB7_6:                                ; %if.else
	mov	&unsafe, r12
	mov	62(r12), r12
	add	#8, r12
	cmp	#17, r12
	jhs	.LBB7_12
	jmp	.LBB7_7
.LBB7_7:                                ; %if.then8
	clr	2(r1)
	jmp	.LBB7_8
.LBB7_8:                                ; %for.cond9
                                        ; =>This Inner Loop Header: Depth=1
	mov	2(r1), r12
	cmp	#8, r12
	jge	.LBB7_11
	jmp	.LBB7_9
.LBB7_9:                                ; %for.body11
                                        ;   in Loop: Header=BB7_8 Depth=1
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
	jmp	.LBB7_10
.LBB7_10:                               ; %for.inc21
                                        ;   in Loop: Header=BB7_8 Depth=1
	mov	2(r1), r12
	inc	r12
	mov	r12, 2(r1)
	jmp	.LBB7_8
.LBB7_11:                               ; %for.end23
	jmp	.LBB7_12
.LBB7_12:                               ; %if.end
	mov	&unsafe, r12
	clr	220(r12)
	jmp	.LBB7_13
.LBB7_13:                               ; %if.end26
	add	#4, r1
	ret
.Lfunc_end7:
	.size	task_mult_block_get_result, .Lfunc_end7-task_mult_block_get_result
                                        ; -- End function
	.globl	task_square_base        ; -- Begin function task_square_base
	.p2align	1
	.type	task_square_base,@function
task_square_base:                       ; @task_square_base
.Lfunc_begin8:
; %bb.0:                                ; %entry
	mov	&unsafe, r12
	mov	#1, 222(r12)
	ret
.Lfunc_end8:
	.size	task_square_base, .Lfunc_end8-task_square_base
                                        ; -- End function
	.globl	task_square_base_get_result ; -- Begin function task_square_base_get_result
	.p2align	1
	.type	task_square_base_get_result,@function
task_square_base_get_result:            ; @task_square_base_get_result
.Lfunc_begin9:
; %bb.0:                                ; %entry
	sub	#2, r1
	clr	0(r1)
	jmp	.LBB9_1
.LBB9_1:                                ; %for.cond
                                        ; =>This Inner Loop Header: Depth=1
	mov	0(r1), r12
	cmp	#8, r12
	jge	.LBB9_4
	jmp	.LBB9_2
.LBB9_2:                                ; %for.body
                                        ;   in Loop: Header=BB9_1 Depth=1
	mov	&unsafe, r12
	mov	0(r1), r13
	add	r13, r13
	add	r13, r12
	mov	22(r12), r13
	mov	r13, 64(r12)
	jmp	.LBB9_3
.LBB9_3:                                ; %for.inc
                                        ;   in Loop: Header=BB9_1 Depth=1
	mov	0(r1), r12
	inc	r12
	mov	r12, 0(r1)
	jmp	.LBB9_1
.LBB9_4:                                ; %for.end
	mov	&unsafe, r12
	mov	#2, 220(r12)
	add	#2, r1
	ret
.Lfunc_end9:
	.size	task_square_base_get_result, .Lfunc_end9-task_square_base_get_result
                                        ; -- End function
	.globl	task_mult_mod           ; -- Begin function task_mult_mod
	.p2align	1
	.type	task_mult_mod,@function
task_mult_mod:                          ; @task_mult_mod
.Lfunc_begin10:
; %bb.0:                                ; %entry
	mov	&unsafe, r12
	clr	112(r12)
	mov	&unsafe, r12
	clr	114(r12)
	ret
.Lfunc_end10:
	.size	task_mult_mod, .Lfunc_end10-task_mult_mod
                                        ; -- End function
	.globl	task_mult               ; -- Begin function task_mult
	.p2align	1
	.type	task_mult,@function
task_mult:                              ; @task_mult
.Lfunc_begin11:
; %bb.0:                                ; %entry
	sub	#14, r1
	mov	&unsafe, r12
	mov	114(r12), r12
	mov	r12, 2(r1)
	clr	6(r1)
	clr	12(r1)
	jmp	.LBB11_1
.LBB11_1:                               ; %for.cond
                                        ; =>This Inner Loop Header: Depth=1
	mov	12(r1), r12
	cmp	#8, r12
	jge	.LBB11_7
	jmp	.LBB11_2
.LBB11_2:                               ; %for.body
                                        ;   in Loop: Header=BB11_1 Depth=1
	mov	&unsafe, r12
	mov	112(r12), r12
	mov	12(r1), r13
	sub	r13, r12
	tst	r12
	jlo	.LBB11_5
	jmp	.LBB11_3
.LBB11_3:                               ; %land.lhs.true
                                        ;   in Loop: Header=BB11_1 Depth=1
	mov	&unsafe, r12
	mov	112(r12), r12
	mov	12(r1), r13
	sub	r13, r12
	cmp	#8, r12
	jhs	.LBB11_5
	jmp	.LBB11_4
.LBB11_4:                               ; %if.then
                                        ;   in Loop: Header=BB11_1 Depth=1
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
	jmp	.LBB11_5
.LBB11_5:                               ; %if.end
                                        ;   in Loop: Header=BB11_1 Depth=1
	jmp	.LBB11_6
.LBB11_6:                               ; %for.inc
                                        ;   in Loop: Header=BB11_1 Depth=1
	mov	12(r1), r12
	inc	r12
	mov	r12, 12(r1)
	jmp	.LBB11_1
.LBB11_7:                               ; %for.end
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
	jhs	.LBB11_9
	jmp	.LBB11_8
.LBB11_8:                               ; %if.then27
	mov	6(r1), r12
	mov	&unsafe, r13
	mov	r12, 114(r13)
	jmp	.LBB11_9
.LBB11_9:                               ; %if.end30
	add	#14, r1
	ret
.Lfunc_end11:
	.size	task_mult, .Lfunc_end11-task_mult
                                        ; -- End function
	.globl	task_reduce_digits      ; -- Begin function task_reduce_digits
	.p2align	1
	.type	task_reduce_digits,@function
task_reduce_digits:                     ; @task_reduce_digits
.Lfunc_begin12:
; %bb.0:                                ; %entry
	sub	#2, r1
	mov	#16, 0(r1)
	jmp	.LBB12_1
.LBB12_1:                               ; %do.body
                                        ; =>This Inner Loop Header: Depth=1
	mov	0(r1), r12
	add	#-1, r12
	mov	r12, 0(r1)
	jmp	.LBB12_2
.LBB12_2:                               ; %do.cond
                                        ;   in Loop: Header=BB12_1 Depth=1
	mov	&unsafe, r12
	mov	0(r1), r13
	add	r13, r13
	add	r13, r12
	mov	22(r12), r13
	clr.b	r12
	tst	r13
	jne	.LBB12_6
	jmp	.LBB12_3
.LBB12_3:                               ; %land.rhs
                                        ;   in Loop: Header=BB12_1 Depth=1
	mov	0(r1), r13
	mov	#1, r12
	cmp	#1, r13
	jge	.LBB12_5
; %bb.4:                                ; %land.rhs
                                        ;   in Loop: Header=BB12_1 Depth=1
	clr	r12
.LBB12_5:                               ; %land.rhs
                                        ;   in Loop: Header=BB12_1 Depth=1
	jmp	.LBB12_6
.LBB12_6:                               ; %land.end
                                        ;   in Loop: Header=BB12_1 Depth=1
	bit	#1, r12
	jne	.LBB12_1
	jmp	.LBB12_7
.LBB12_7:                               ; %do.end
	mov	&unsafe, r12
	mov	0(r1), r13
	add	r13, r13
	add	r13, r12
	mov	22(r12), r12
	tst	r12
	jne	.LBB12_9
	jmp	.LBB12_8
.LBB12_8:                               ; %if.then
	mov	&unsafe, r12
	clr	220(r12)
	jmp	.LBB12_9
.LBB12_9:                               ; %if.end
	mov	0(r1), r12
	mov	&unsafe, r13
	mov	r12, 116(r13)
	mov	&unsafe, r12
	mov	#1, 220(r12)
	add	#2, r1
	ret
.Lfunc_end12:
	.size	task_reduce_digits, .Lfunc_end12-task_reduce_digits
                                        ; -- End function
	.globl	task_reduce_normalizable ; -- Begin function task_reduce_normalizable
	.p2align	1
	.type	task_reduce_normalizable,@function
task_reduce_normalizable:               ; @task_reduce_normalizable
.Lfunc_begin13:
; %bb.0:                                ; %entry
	sub	#6, r1
	mov.b	#1, 3(r1)
	mov	&unsafe, r12
	mov	116(r12), r13
	add	#-7, r13
	mov	r13, 150(r12)
	mov	&unsafe, r12
	mov	116(r12), r12
	mov	r12, 4(r1)
	jmp	.LBB13_1
.LBB13_1:                               ; %for.cond
                                        ; =>This Inner Loop Header: Depth=1
	mov	4(r1), r12
	tst	r12
	jl	.LBB13_9
	jmp	.LBB13_2
.LBB13_2:                               ; %for.body
                                        ;   in Loop: Header=BB13_1 Depth=1
	mov	4(r1), r12
	mov	&unsafe, r13
	mov	150(r13), r13
	sub	r13, r12
	mov	r12, 0(r1)
	mov	&unsafe, r12
	add	#22, r12
	mov	4(r1), r13
	add	r13, r13
	mov	r12, r14
	add	r13, r14
	mov	0(r14), r13
	mov	0(r1), r14
	add	r14, r14
	add	r14, r12
	mov	74(r12), r12
	cmp	r13, r12
	jhs	.LBB13_4
	jmp	.LBB13_3
.LBB13_3:                               ; %if.then
	jmp	.LBB13_10
.LBB13_4:                               ; %if.else
                                        ;   in Loop: Header=BB13_1 Depth=1
	mov	&unsafe, r12
	add	#22, r12
	mov	4(r1), r13
	add	r13, r13
	mov	r12, r14
	add	r13, r14
	mov	0(r14), r13
	mov	0(r1), r14
	add	r14, r14
	add	r14, r12
	mov	74(r12), r12
	cmp	r12, r13
	jhs	.LBB13_6
	jmp	.LBB13_5
.LBB13_5:                               ; %if.then18
	clr.b	3(r1)
	jmp	.LBB13_10
.LBB13_6:                               ; %if.end
                                        ;   in Loop: Header=BB13_1 Depth=1
	jmp	.LBB13_7
.LBB13_7:                               ; %if.end19
                                        ;   in Loop: Header=BB13_1 Depth=1
	jmp	.LBB13_8
.LBB13_8:                               ; %for.inc
                                        ;   in Loop: Header=BB13_1 Depth=1
	mov	4(r1), r12
	add	#-1, r12
	mov	r12, 4(r1)
	jmp	.LBB13_1
.LBB13_9:                               ; %for.end.loopexit
	jmp	.LBB13_10
.LBB13_10:                              ; %for.end
	mov.b	3(r1), r12
	bit	#1, r12
	jne	.LBB13_13
	jmp	.LBB13_11
.LBB13_11:                              ; %land.lhs.true
	mov	&unsafe, r12
	mov	116(r12), r12
	cmp	#7, r12
	jne	.LBB13_13
	jmp	.LBB13_12
.LBB13_12:                              ; %if.then23
	mov	&unsafe, r12
	clr	220(r12)
	jmp	.LBB13_13
.LBB13_13:                              ; %if.end25
	mov.b	3(r1), r12
	bit	#1, r12
	jeq	.LBB13_15
	jmp	.LBB13_14
.LBB13_14:                              ; %if.then27
	mov	&unsafe, r12
	mov	#1, 220(r12)
	jmp	.LBB13_16
.LBB13_15:                              ; %if.else30
	mov	&unsafe, r12
	mov	#2, 220(r12)
	jmp	.LBB13_16
.LBB13_16:                              ; %if.end33
	add	#6, r1
	ret
.Lfunc_end13:
	.size	task_reduce_normalizable, .Lfunc_end13-task_reduce_normalizable
                                        ; -- End function
	.globl	task_reduce_normalize   ; -- Begin function task_reduce_normalize
	.p2align	1
	.type	task_reduce_normalize,@function
task_reduce_normalize:                  ; @task_reduce_normalize
.Lfunc_begin14:
; %bb.0:                                ; %entry
	sub	#14, r1
	clr	4(r1)
	clr	2(r1)
	jmp	.LBB14_1
.LBB14_1:                               ; %for.cond
                                        ; =>This Inner Loop Header: Depth=1
	mov	2(r1), r12
	cmp	#8, r12
	jge	.LBB14_7
	jmp	.LBB14_2
.LBB14_2:                               ; %for.body
                                        ;   in Loop: Header=BB14_1 Depth=1
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
	jhs	.LBB14_4
	jmp	.LBB14_3
.LBB14_3:                               ; %if.then
                                        ;   in Loop: Header=BB14_1 Depth=1
	mov	12(r1), r12
	add	#256, r12
	mov	r12, 12(r1)
	mov	#1, 4(r1)
	jmp	.LBB14_5
.LBB14_4:                               ; %if.else
                                        ;   in Loop: Header=BB14_1 Depth=1
	clr	4(r1)
	jmp	.LBB14_5
.LBB14_5:                               ; %if.end
                                        ;   in Loop: Header=BB14_1 Depth=1
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
	jmp	.LBB14_6
.LBB14_6:                               ; %for.inc
                                        ;   in Loop: Header=BB14_1 Depth=1
	mov	2(r1), r12
	inc	r12
	mov	r12, 2(r1)
	jmp	.LBB14_1
.LBB14_7:                               ; %for.end
	mov	&unsafe, r12
	mov	150(r12), r12
	tst	r12
	jeq	.LBB14_9
	jmp	.LBB14_8
.LBB14_8:                               ; %if.then13
	mov	&unsafe, r12
	mov	#2, 220(r12)
	jmp	.LBB14_10
.LBB14_9:                               ; %if.else15
	mov	&unsafe, r12
	clr	220(r12)
	jmp	.LBB14_10
.LBB14_10:                              ; %if.end18
	add	#14, r1
	ret
.Lfunc_end14:
	.size	task_reduce_normalize, .Lfunc_end14-task_reduce_normalize
                                        ; -- End function
	.globl	task_reduce_n_divisor   ; -- Begin function task_reduce_n_divisor
	.p2align	1
	.type	task_reduce_n_divisor,@function
task_reduce_n_divisor:                  ; @task_reduce_n_divisor
.Lfunc_begin15:
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
.Lfunc_end15:
	.size	task_reduce_n_divisor, .Lfunc_end15-task_reduce_n_divisor
                                        ; -- End function
	.globl	task_reduce_quotient    ; -- Begin function task_reduce_quotient
	.p2align	1
	.type	task_reduce_quotient,@function
task_reduce_quotient:                   ; @task_reduce_quotient
.Lfunc_begin16:
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
	jne	.LBB16_2
	jmp	.LBB16_1
.LBB16_1:                               ; %if.then
	mov	&unsafe, r12
	mov	#255, 218(r12)
	jmp	.LBB16_3
.LBB16_2:                               ; %if.else
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
	jmp	.LBB16_3
.LBB16_3:                               ; %if.end
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
	jmp	.LBB16_4
.LBB16_4:                               ; %do.body
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
	jmp	.LBB16_5
.LBB16_5:                               ; %do.cond
                                        ;   in Loop: Header=BB16_4 Depth=1
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
	jeq	.LBB16_7
; %bb.6:                                ; %do.cond
                                        ;   in Loop: Header=BB16_4 Depth=1
	mov	r13, r12
.LBB16_7:                               ; %do.cond
                                        ;   in Loop: Header=BB16_4 Depth=1
	bit	#1, r12
	jne	.LBB16_4
	jmp	.LBB16_8
.LBB16_8:                               ; %do.end
	mov	&unsafe, r12
	mov	116(r12), r13
	add	#-1, r13
	mov	r13, 116(r12)
	add	#14, r1
	pop	r10
	ret
.Lfunc_end16:
	.size	task_reduce_quotient, .Lfunc_end16-task_reduce_quotient
                                        ; -- End function
	.globl	task_reduce_multiply    ; -- Begin function task_reduce_multiply
	.p2align	1
	.type	task_reduce_multiply,@function
task_reduce_multiply:                   ; @task_reduce_multiply
.Lfunc_begin17:
; %bb.0:                                ; %entry
	sub	#12, r1
	mov	&unsafe, r12
	mov	116(r12), r12
	add	#-7, r12
	mov	r12, 2(r1)
	clr	10(r1)
	jmp	.LBB17_1
.LBB17_1:                               ; %for.cond
                                        ; =>This Inner Loop Header: Depth=1
	mov	10(r1), r12
	mov	2(r1), r13
	cmp	r13, r12
	jhs	.LBB17_4
	jmp	.LBB17_2
.LBB17_2:                               ; %for.body
                                        ;   in Loop: Header=BB17_1 Depth=1
	mov	&unsafe, r12
	mov	10(r1), r13
	add	r13, r13
	add	r13, r12
	clr	154(r12)
	jmp	.LBB17_3
.LBB17_3:                               ; %for.inc
                                        ;   in Loop: Header=BB17_1 Depth=1
	mov	10(r1), r12
	inc	r12
	mov	r12, 10(r1)
	jmp	.LBB17_1
.LBB17_4:                               ; %for.end
	clr	4(r1)
	mov	2(r1), r12
	mov	r12, 10(r1)
	jmp	.LBB17_5
.LBB17_5:                               ; %for.cond2
                                        ; =>This Inner Loop Header: Depth=1
	mov	10(r1), r12
	cmp	#16, r12
	jge	.LBB17_11
	jmp	.LBB17_6
.LBB17_6:                               ; %for.body4
                                        ;   in Loop: Header=BB17_5 Depth=1
	mov	4(r1), r12
	mov	r12, 8(r1)
	mov	10(r1), r12
	mov	2(r1), r13
	add	#8, r13
	cmp	r13, r12
	jhs	.LBB17_8
	jmp	.LBB17_7
.LBB17_7:                               ; %if.then
                                        ;   in Loop: Header=BB17_5 Depth=1
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
	jmp	.LBB17_9
.LBB17_8:                               ; %if.else
                                        ;   in Loop: Header=BB17_5 Depth=1
	clr	6(r1)
	jmp	.LBB17_9
.LBB17_9:                               ; %if.end
                                        ;   in Loop: Header=BB17_5 Depth=1
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
	jmp	.LBB17_10
.LBB17_10:                              ; %for.inc15
                                        ;   in Loop: Header=BB17_5 Depth=1
	mov	10(r1), r12
	inc	r12
	mov	r12, 10(r1)
	jmp	.LBB17_5
.LBB17_11:                              ; %for.end17
	add	#12, r1
	ret
.Lfunc_end17:
	.size	task_reduce_multiply, .Lfunc_end17-task_reduce_multiply
                                        ; -- End function
	.globl	task_reduce_compare     ; -- Begin function task_reduce_compare
	.p2align	1
	.type	task_reduce_compare,@function
task_reduce_compare:                    ; @task_reduce_compare
.Lfunc_begin18:
; %bb.0:                                ; %entry
	sub	#4, r1
	mov.b	#61, 1(r1)
	mov	#15, 2(r1)
	jmp	.LBB18_1
.LBB18_1:                               ; %for.cond
                                        ; =>This Inner Loop Header: Depth=1
	mov	2(r1), r12
	tst	r12
	jl	.LBB18_9
	jmp	.LBB18_2
.LBB18_2:                               ; %for.body
                                        ;   in Loop: Header=BB18_1 Depth=1
	mov	&unsafe, r12
	mov	2(r1), r13
	add	r13, r13
	add	r13, r12
	mov	22(r12), r13
	mov	154(r12), r12
	cmp	r13, r12
	jhs	.LBB18_4
	jmp	.LBB18_3
.LBB18_3:                               ; %if.then
	mov.b	#62, 1(r1)
	jmp	.LBB18_10
.LBB18_4:                               ; %if.else
                                        ;   in Loop: Header=BB18_1 Depth=1
	mov	&unsafe, r12
	mov	2(r1), r13
	add	r13, r13
	add	r13, r12
	mov	22(r12), r13
	mov	154(r12), r12
	cmp	r12, r13
	jhs	.LBB18_6
	jmp	.LBB18_5
.LBB18_5:                               ; %if.then11
	mov.b	#60, 1(r1)
	jmp	.LBB18_10
.LBB18_6:                               ; %if.end
                                        ;   in Loop: Header=BB18_1 Depth=1
	jmp	.LBB18_7
.LBB18_7:                               ; %if.end12
                                        ;   in Loop: Header=BB18_1 Depth=1
	jmp	.LBB18_8
.LBB18_8:                               ; %for.inc
                                        ;   in Loop: Header=BB18_1 Depth=1
	mov	2(r1), r12
	add	#-1, r12
	mov	r12, 2(r1)
	jmp	.LBB18_1
.LBB18_9:                               ; %for.end.loopexit
	jmp	.LBB18_10
.LBB18_10:                              ; %for.end
	mov.b	1(r1), r12
	cmp.b	#60, r12
	jne	.LBB18_12
	jmp	.LBB18_11
.LBB18_11:                              ; %if.then15
	mov	&unsafe, r12
	clr	220(r12)
	jmp	.LBB18_12
.LBB18_12:                              ; %if.end17
	add	#4, r1
	ret
.Lfunc_end18:
	.size	task_reduce_compare, .Lfunc_end18-task_reduce_compare
                                        ; -- End function
	.globl	task_reduce_add         ; -- Begin function task_reduce_add
	.p2align	1
	.type	task_reduce_add,@function
task_reduce_add:                        ; @task_reduce_add
.Lfunc_begin19:
; %bb.0:                                ; %entry
	sub	#12, r1
	mov	&unsafe, r12
	mov	116(r12), r12
	add	#-7, r12
	mov	r12, 0(r1)
	clr	2(r1)
	mov	0(r1), r12
	mov	r12, 10(r1)
	jmp	.LBB19_1
.LBB19_1:                               ; %for.cond
                                        ; =>This Inner Loop Header: Depth=1
	mov	10(r1), r12
	cmp	#16, r12
	jge	.LBB19_7
	jmp	.LBB19_2
.LBB19_2:                               ; %for.body
                                        ;   in Loop: Header=BB19_1 Depth=1
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
	jhs	.LBB19_4
	jmp	.LBB19_3
.LBB19_3:                               ; %if.then
                                        ;   in Loop: Header=BB19_1 Depth=1
	mov	&unsafe, r12
	mov	8(r1), r13
	add	r13, r13
	add	r13, r12
	mov	96(r12), r12
	mov	r12, 4(r1)
	jmp	.LBB19_5
.LBB19_4:                               ; %if.else
                                        ;   in Loop: Header=BB19_1 Depth=1
	clr	4(r1)
	clr	8(r1)
	jmp	.LBB19_5
.LBB19_5:                               ; %if.end
                                        ;   in Loop: Header=BB19_1 Depth=1
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
	jmp	.LBB19_6
.LBB19_6:                               ; %for.inc
                                        ;   in Loop: Header=BB19_1 Depth=1
	mov	10(r1), r12
	inc	r12
	mov	r12, 10(r1)
	jmp	.LBB19_1
.LBB19_7:                               ; %for.end
	add	#12, r1
	ret
.Lfunc_end19:
	.size	task_reduce_add, .Lfunc_end19-task_reduce_add
                                        ; -- End function
	.globl	task_reduce_subtract    ; -- Begin function task_reduce_subtract
	.p2align	1
	.type	task_reduce_subtract,@function
task_reduce_subtract:                   ; @task_reduce_subtract
.Lfunc_begin20:
; %bb.0:                                ; %entry
	sub	#12, r1
	mov	&unsafe, r12
	mov	116(r12), r12
	add	#-7, r12
	mov	r12, 0(r1)
	clr	2(r1)
	clr	10(r1)
	jmp	.LBB20_1
.LBB20_1:                               ; %for.cond
                                        ; =>This Inner Loop Header: Depth=1
	mov	10(r1), r12
	cmp	#16, r12
	jge	.LBB20_9
	jmp	.LBB20_2
.LBB20_2:                               ; %for.body
                                        ;   in Loop: Header=BB20_1 Depth=1
	mov	&unsafe, r12
	mov	10(r1), r13
	add	r13, r13
	add	r13, r12
	mov	22(r12), r12
	mov	r12, 8(r1)
	mov	10(r1), r12
	mov	0(r1), r13
	cmp	r13, r12
	jlo	.LBB20_7
	jmp	.LBB20_3
.LBB20_3:                               ; %if.then
                                        ;   in Loop: Header=BB20_1 Depth=1
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
	jhs	.LBB20_5
	jmp	.LBB20_4
.LBB20_4:                               ; %if.then7
                                        ;   in Loop: Header=BB20_1 Depth=1
	mov	8(r1), r12
	add	#256, r12
	mov	r12, 8(r1)
	mov	#1, 2(r1)
	jmp	.LBB20_6
.LBB20_5:                               ; %if.else
                                        ;   in Loop: Header=BB20_1 Depth=1
	clr	2(r1)
	jmp	.LBB20_6
.LBB20_6:                               ; %if.end
                                        ;   in Loop: Header=BB20_1 Depth=1
	mov	8(r1), r12
	mov	6(r1), r13
	sub	r13, r12
	mov	&unsafe, r13
	mov	10(r1), r14
	add	r14, r14
	add	r14, r13
	mov	r12, 22(r13)
	jmp	.LBB20_7
.LBB20_7:                               ; %if.end13
                                        ;   in Loop: Header=BB20_1 Depth=1
	jmp	.LBB20_8
.LBB20_8:                               ; %for.inc
                                        ;   in Loop: Header=BB20_1 Depth=1
	mov	10(r1), r12
	inc	r12
	mov	r12, 10(r1)
	jmp	.LBB20_1
.LBB20_9:                               ; %for.end
	add	#12, r1
	ret
.Lfunc_end20:
	.size	task_reduce_subtract, .Lfunc_end20-task_reduce_subtract
                                        ; -- End function
	.globl	task_commit             ; -- Begin function task_commit
	.p2align	1
	.type	task_commit,@function
task_commit:                            ; @task_commit
.Lfunc_begin21:
; %bb.0:                                ; %entry
	ret
.Lfunc_end21:
	.size	task_commit, .Lfunc_end21-task_commit
                                        ; -- End function
	.globl	main                    ; -- Begin function main
	.p2align	1
	.type	main,@function
main:                                   ; @main
.Lfunc_begin22:
; %bb.0:                                ; %entry
	sub	#2, r1
	clr	0(r1)
	mov	#1, &camel
	mov	#camel+2, &safe
	mov	#camel+228, &unsafe
	call	#camel_init
	jmp	.LBB22_1
.LBB22_1:                               ; %while.body
                                        ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB22_7 Depth 2
                                        ;       Child Loop BB22_42 Depth 3
                                        ;       Child Loop BB22_75 Depth 3
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
	mov	#camel+228, &safe
	mov	#camel+2, &unsafe
	mov	&safe, r12
	call	#__dump_registers
	mov	#2, &camel
	jmp	.LBB22_5
.LBB22_4:                               ; %if.else
                                        ;   in Loop: Header=BB22_1 Depth=1
	mov	#camel+2, &safe
	mov	#camel+228, &unsafe
	mov	&safe, r12
	call	#__dump_registers
	mov	#1, &camel
	jmp	.LBB22_5
.LBB22_5:                               ; %if.end
                                        ;   in Loop: Header=BB22_1 Depth=1
	jmp	.LBB22_6
.LBB22_6:                               ; %do.end
                                        ;   in Loop: Header=BB22_1 Depth=1
	mov	&unsafe, r12
	add	#22, r12
	mov	&safe, r13
	add	#22, r13
	mov	#202, r14
	call	#memcpy
	call	#task_commit
	jmp	.LBB22_7
.LBB22_7:                               ; %while.body4
                                        ;   Parent Loop BB22_1 Depth=1
                                        ; =>  This Loop Header: Depth=2
                                        ;       Child Loop BB22_42 Depth 3
                                        ;       Child Loop BB22_75 Depth 3
	mov	&safe, r12
	mov	220(r12), r12
	tst	r12
	jne	.LBB22_14
	jmp	.LBB22_8
.LBB22_8:                               ; %if.then6
                                        ;   in Loop: Header=BB22_7 Depth=2
	mov	&unsafe, r12
	add	#22, r12
	mov	&safe, r13
	add	#22, r13
	mov	#202, r14
	call	#memcpy
	call	#task_pad
	jmp	.LBB22_9
.LBB22_9:                               ; %do.body7
                                        ;   in Loop: Header=BB22_7 Depth=2
	mov	&camel, r12
	cmp	#1, r12
	jne	.LBB22_11
	jmp	.LBB22_10
.LBB22_10:                              ; %if.then9
                                        ;   in Loop: Header=BB22_7 Depth=2
	mov	#camel+228, &safe
	mov	#camel+2, &unsafe
	mov	&safe, r12
	call	#__dump_registers
	mov	#2, &camel
	jmp	.LBB22_12
.LBB22_11:                              ; %if.else12
                                        ;   in Loop: Header=BB22_7 Depth=2
	mov	#camel+2, &safe
	mov	#camel+228, &unsafe
	mov	&safe, r12
	call	#__dump_registers
	mov	#1, &camel
	jmp	.LBB22_12
.LBB22_12:                              ; %if.end15
                                        ;   in Loop: Header=BB22_7 Depth=2
	jmp	.LBB22_13
.LBB22_13:                              ; %do.end16
                                        ;   in Loop: Header=BB22_7 Depth=2
	call	#task_commit
	jmp	.LBB22_14
.LBB22_14:                              ; %if.end17
                                        ;   in Loop: Header=BB22_7 Depth=2
	mov	&safe, r12
	mov	220(r12), r12
	cmp	#2, r12
	jne	.LBB22_21
	jmp	.LBB22_15
.LBB22_15:                              ; %if.then21
                                        ;   in Loop: Header=BB22_7 Depth=2
	mov	&unsafe, r12
	add	#22, r12
	mov	&safe, r13
	add	#22, r13
	mov	#202, r14
	call	#memcpy
	call	#task_exp
	jmp	.LBB22_16
.LBB22_16:                              ; %do.body22
                                        ;   in Loop: Header=BB22_7 Depth=2
	mov	&camel, r12
	cmp	#1, r12
	jne	.LBB22_18
	jmp	.LBB22_17
.LBB22_17:                              ; %if.then24
                                        ;   in Loop: Header=BB22_7 Depth=2
	mov	#camel+228, &safe
	mov	#camel+2, &unsafe
	mov	&safe, r12
	call	#__dump_registers
	mov	#2, &camel
	jmp	.LBB22_19
.LBB22_18:                              ; %if.else27
                                        ;   in Loop: Header=BB22_7 Depth=2
	mov	#camel+2, &safe
	mov	#camel+228, &unsafe
	mov	&safe, r12
	call	#__dump_registers
	mov	#1, &camel
	jmp	.LBB22_19
.LBB22_19:                              ; %if.end30
                                        ;   in Loop: Header=BB22_7 Depth=2
	jmp	.LBB22_20
.LBB22_20:                              ; %do.end31
                                        ;   in Loop: Header=BB22_7 Depth=2
	call	#task_commit
	jmp	.LBB22_21
.LBB22_21:                              ; %if.end32
                                        ;   in Loop: Header=BB22_7 Depth=2
	mov	&safe, r12
	mov	220(r12), r12
	tst	r12
	jne	.LBB22_28
	jmp	.LBB22_22
.LBB22_22:                              ; %if.then36
                                        ;   in Loop: Header=BB22_7 Depth=2
	mov	&unsafe, r12
	add	#22, r12
	mov	&safe, r13
	add	#22, r13
	mov	#202, r14
	call	#memcpy
	call	#task_mult_block
	jmp	.LBB22_23
.LBB22_23:                              ; %do.body37
                                        ;   in Loop: Header=BB22_7 Depth=2
	mov	&camel, r12
	cmp	#1, r12
	jne	.LBB22_25
	jmp	.LBB22_24
.LBB22_24:                              ; %if.then39
                                        ;   in Loop: Header=BB22_7 Depth=2
	mov	#camel+228, &safe
	mov	#camel+2, &unsafe
	mov	&safe, r12
	call	#__dump_registers
	mov	#2, &camel
	jmp	.LBB22_26
.LBB22_25:                              ; %if.else42
                                        ;   in Loop: Header=BB22_7 Depth=2
	mov	#camel+2, &safe
	mov	#camel+228, &unsafe
	mov	&safe, r12
	call	#__dump_registers
	mov	#1, &camel
	jmp	.LBB22_26
.LBB22_26:                              ; %if.end45
                                        ;   in Loop: Header=BB22_7 Depth=2
	jmp	.LBB22_27
.LBB22_27:                              ; %do.end46
                                        ;   in Loop: Header=BB22_7 Depth=2
	call	#task_commit
	jmp	.LBB22_36
.LBB22_28:                              ; %if.else47
                                        ;   in Loop: Header=BB22_7 Depth=2
	mov	&safe, r12
	mov	220(r12), r12
	cmp	#1, r12
	jne	.LBB22_35
	jmp	.LBB22_29
.LBB22_29:                              ; %if.then51
                                        ;   in Loop: Header=BB22_7 Depth=2
	mov	&unsafe, r12
	add	#22, r12
	mov	&safe, r13
	add	#22, r13
	mov	#202, r14
	call	#memcpy
	call	#task_square_base
	jmp	.LBB22_30
.LBB22_30:                              ; %do.body52
                                        ;   in Loop: Header=BB22_7 Depth=2
	mov	&camel, r12
	cmp	#1, r12
	jne	.LBB22_32
	jmp	.LBB22_31
.LBB22_31:                              ; %if.then54
                                        ;   in Loop: Header=BB22_7 Depth=2
	mov	#camel+228, &safe
	mov	#camel+2, &unsafe
	mov	&safe, r12
	call	#__dump_registers
	mov	#2, &camel
	jmp	.LBB22_33
.LBB22_32:                              ; %if.else57
                                        ;   in Loop: Header=BB22_7 Depth=2
	mov	#camel+2, &safe
	mov	#camel+228, &unsafe
	mov	&safe, r12
	call	#__dump_registers
	mov	#1, &camel
	jmp	.LBB22_33
.LBB22_33:                              ; %if.end60
                                        ;   in Loop: Header=BB22_7 Depth=2
	jmp	.LBB22_34
.LBB22_34:                              ; %do.end61
                                        ;   in Loop: Header=BB22_7 Depth=2
	call	#task_commit
	jmp	.LBB22_35
.LBB22_35:                              ; %if.end62
                                        ;   in Loop: Header=BB22_7 Depth=2
	jmp	.LBB22_36
.LBB22_36:                              ; %if.end63
                                        ;   in Loop: Header=BB22_7 Depth=2
	mov	&unsafe, r12
	add	#22, r12
	mov	&safe, r13
	add	#22, r13
	mov	#202, r14
	call	#memcpy
	call	#task_mult_mod
	jmp	.LBB22_37
.LBB22_37:                              ; %do.body64
                                        ;   in Loop: Header=BB22_7 Depth=2
	mov	&camel, r12
	cmp	#1, r12
	jne	.LBB22_39
	jmp	.LBB22_38
.LBB22_38:                              ; %if.then66
                                        ;   in Loop: Header=BB22_7 Depth=2
	mov	#camel+228, &safe
	mov	#camel+2, &unsafe
	mov	&safe, r12
	call	#__dump_registers
	mov	#2, &camel
	jmp	.LBB22_40
.LBB22_39:                              ; %if.else69
                                        ;   in Loop: Header=BB22_7 Depth=2
	mov	#camel+2, &safe
	mov	#camel+228, &unsafe
	mov	&safe, r12
	call	#__dump_registers
	mov	#1, &camel
	jmp	.LBB22_40
.LBB22_40:                              ; %if.end72
                                        ;   in Loop: Header=BB22_7 Depth=2
	jmp	.LBB22_41
.LBB22_41:                              ; %do.end73
                                        ;   in Loop: Header=BB22_7 Depth=2
	call	#task_commit
	jmp	.LBB22_42
.LBB22_42:                              ; %do.body74
                                        ;   Parent Loop BB22_1 Depth=1
                                        ;     Parent Loop BB22_7 Depth=2
                                        ; =>    This Inner Loop Header: Depth=3
	mov	&unsafe, r12
	add	#22, r12
	mov	&safe, r13
	add	#22, r13
	mov	#202, r14
	call	#memcpy
	call	#task_mult
	jmp	.LBB22_43
.LBB22_43:                              ; %do.body75
                                        ;   in Loop: Header=BB22_42 Depth=3
	mov	&camel, r12
	cmp	#1, r12
	jne	.LBB22_45
	jmp	.LBB22_44
.LBB22_44:                              ; %if.then77
                                        ;   in Loop: Header=BB22_42 Depth=3
	mov	#camel+228, &safe
	mov	#camel+2, &unsafe
	mov	&safe, r12
	call	#__dump_registers
	mov	#2, &camel
	jmp	.LBB22_46
.LBB22_45:                              ; %if.else80
                                        ;   in Loop: Header=BB22_42 Depth=3
	mov	#camel+2, &safe
	mov	#camel+228, &unsafe
	mov	&safe, r12
	call	#__dump_registers
	mov	#1, &camel
	jmp	.LBB22_46
.LBB22_46:                              ; %if.end83
                                        ;   in Loop: Header=BB22_42 Depth=3
	jmp	.LBB22_47
.LBB22_47:                              ; %do.end84
                                        ;   in Loop: Header=BB22_42 Depth=3
	call	#task_commit
	jmp	.LBB22_48
.LBB22_48:                              ; %do.cond
                                        ;   in Loop: Header=BB22_42 Depth=3
	mov	&safe, r12
	mov	112(r12), r12
	cmp	#16, r12
	jlo	.LBB22_42
	jmp	.LBB22_49
.LBB22_49:                              ; %do.end87
                                        ;   in Loop: Header=BB22_7 Depth=2
	mov	&unsafe, r12
	add	#22, r12
	mov	&safe, r13
	add	#22, r13
	mov	#202, r14
	call	#memcpy
	call	#task_reduce_digits
	jmp	.LBB22_50
.LBB22_50:                              ; %do.body88
                                        ;   in Loop: Header=BB22_7 Depth=2
	mov	&camel, r12
	cmp	#1, r12
	jne	.LBB22_52
	jmp	.LBB22_51
.LBB22_51:                              ; %if.then90
                                        ;   in Loop: Header=BB22_7 Depth=2
	mov	#camel+228, &safe
	mov	#camel+2, &unsafe
	mov	&safe, r12
	call	#__dump_registers
	mov	#2, &camel
	jmp	.LBB22_53
.LBB22_52:                              ; %if.else93
                                        ;   in Loop: Header=BB22_7 Depth=2
	mov	#camel+2, &safe
	mov	#camel+228, &unsafe
	mov	&safe, r12
	call	#__dump_registers
	mov	#1, &camel
	jmp	.LBB22_53
.LBB22_53:                              ; %if.end96
                                        ;   in Loop: Header=BB22_7 Depth=2
	jmp	.LBB22_54
.LBB22_54:                              ; %do.end98
                                        ;   in Loop: Header=BB22_7 Depth=2
	call	#task_commit
	mov	&safe, r12
	mov	220(r12), r12
	tst	r12
	jne	.LBB22_56
	jmp	.LBB22_55
.LBB22_55:                              ; %if.then102
                                        ;   in Loop: Header=BB22_1 Depth=1
	br	#.LBB22_121
.LBB22_56:                              ; %if.end103
                                        ;   in Loop: Header=BB22_7 Depth=2
	mov	&unsafe, r12
	add	#22, r12
	mov	&safe, r13
	add	#22, r13
	mov	#202, r14
	call	#memcpy
	call	#task_reduce_normalizable
	jmp	.LBB22_57
.LBB22_57:                              ; %do.body104
                                        ;   in Loop: Header=BB22_7 Depth=2
	mov	&camel, r12
	cmp	#1, r12
	jne	.LBB22_59
	jmp	.LBB22_58
.LBB22_58:                              ; %if.then106
                                        ;   in Loop: Header=BB22_7 Depth=2
	mov	#camel+228, &safe
	mov	#camel+2, &unsafe
	mov	&safe, r12
	call	#__dump_registers
	mov	#2, &camel
	jmp	.LBB22_60
.LBB22_59:                              ; %if.else109
                                        ;   in Loop: Header=BB22_7 Depth=2
	mov	#camel+2, &safe
	mov	#camel+228, &unsafe
	mov	&safe, r12
	call	#__dump_registers
	mov	#1, &camel
	jmp	.LBB22_60
.LBB22_60:                              ; %if.end112
                                        ;   in Loop: Header=BB22_7 Depth=2
	jmp	.LBB22_61
.LBB22_61:                              ; %do.end114
                                        ;   in Loop: Header=BB22_7 Depth=2
	call	#task_commit
	mov	&safe, r12
	mov	220(r12), r12
	cmp	#1, r12
	jne	.LBB22_68
	jmp	.LBB22_62
.LBB22_62:                              ; %if.then118
                                        ;   in Loop: Header=BB22_7 Depth=2
	mov	&unsafe, r12
	add	#22, r12
	mov	&safe, r13
	add	#22, r13
	mov	#202, r14
	call	#memcpy
	call	#task_reduce_normalize
	jmp	.LBB22_63
.LBB22_63:                              ; %do.body119
                                        ;   in Loop: Header=BB22_7 Depth=2
	mov	&camel, r12
	cmp	#1, r12
	jne	.LBB22_65
	jmp	.LBB22_64
.LBB22_64:                              ; %if.then121
                                        ;   in Loop: Header=BB22_7 Depth=2
	mov	#camel+228, &safe
	mov	#camel+2, &unsafe
	mov	&safe, r12
	call	#__dump_registers
	mov	#2, &camel
	jmp	.LBB22_66
.LBB22_65:                              ; %if.else124
                                        ;   in Loop: Header=BB22_7 Depth=2
	mov	#camel+2, &safe
	mov	#camel+228, &unsafe
	mov	&safe, r12
	call	#__dump_registers
	mov	#1, &camel
	jmp	.LBB22_66
.LBB22_66:                              ; %if.end127
                                        ;   in Loop: Header=BB22_7 Depth=2
	jmp	.LBB22_67
.LBB22_67:                              ; %do.end129
                                        ;   in Loop: Header=BB22_7 Depth=2
	call	#task_commit
	jmp	.LBB22_68
.LBB22_68:                              ; %if.end130
                                        ;   in Loop: Header=BB22_7 Depth=2
	mov	&safe, r12
	mov	220(r12), r12
	cmp	#2, r12
	jne	.LBB22_105
	jmp	.LBB22_69
.LBB22_69:                              ; %if.then134
                                        ;   in Loop: Header=BB22_7 Depth=2
	mov	&unsafe, r12
	add	#22, r12
	mov	&safe, r13
	add	#22, r13
	mov	#202, r14
	call	#memcpy
	call	#task_reduce_n_divisor
	jmp	.LBB22_70
.LBB22_70:                              ; %do.body135
                                        ;   in Loop: Header=BB22_7 Depth=2
	mov	&camel, r12
	cmp	#1, r12
	jne	.LBB22_72
	jmp	.LBB22_71
.LBB22_71:                              ; %if.then137
                                        ;   in Loop: Header=BB22_7 Depth=2
	mov	#camel+228, &safe
	mov	#camel+2, &unsafe
	mov	&safe, r12
	call	#__dump_registers
	mov	#2, &camel
	jmp	.LBB22_73
.LBB22_72:                              ; %if.else140
                                        ;   in Loop: Header=BB22_7 Depth=2
	mov	#camel+2, &safe
	mov	#camel+228, &unsafe
	mov	&safe, r12
	call	#__dump_registers
	mov	#1, &camel
	jmp	.LBB22_73
.LBB22_73:                              ; %if.end143
                                        ;   in Loop: Header=BB22_7 Depth=2
	jmp	.LBB22_74
.LBB22_74:                              ; %do.end145
                                        ;   in Loop: Header=BB22_7 Depth=2
	call	#task_commit
	jmp	.LBB22_75
.LBB22_75:                              ; %do.body146
                                        ;   Parent Loop BB22_1 Depth=1
                                        ;     Parent Loop BB22_7 Depth=2
                                        ; =>    This Inner Loop Header: Depth=3
	mov	&unsafe, r12
	add	#22, r12
	mov	&safe, r13
	add	#22, r13
	mov	#202, r14
	call	#memcpy
	call	#task_reduce_quotient
	jmp	.LBB22_76
.LBB22_76:                              ; %do.body147
                                        ;   in Loop: Header=BB22_75 Depth=3
	mov	&camel, r12
	cmp	#1, r12
	jne	.LBB22_78
	jmp	.LBB22_77
.LBB22_77:                              ; %if.then149
                                        ;   in Loop: Header=BB22_75 Depth=3
	mov	#camel+228, &safe
	mov	#camel+2, &unsafe
	mov	&safe, r12
	call	#__dump_registers
	mov	#2, &camel
	jmp	.LBB22_79
.LBB22_78:                              ; %if.else152
                                        ;   in Loop: Header=BB22_75 Depth=3
	mov	#camel+2, &safe
	mov	#camel+228, &unsafe
	mov	&safe, r12
	call	#__dump_registers
	mov	#1, &camel
	jmp	.LBB22_79
.LBB22_79:                              ; %if.end155
                                        ;   in Loop: Header=BB22_75 Depth=3
	jmp	.LBB22_80
.LBB22_80:                              ; %do.end157
                                        ;   in Loop: Header=BB22_75 Depth=3
	call	#task_commit
	mov	&unsafe, r12
	add	#22, r12
	mov	&safe, r13
	add	#22, r13
	mov	#202, r14
	call	#memcpy
	call	#task_reduce_multiply
	jmp	.LBB22_81
.LBB22_81:                              ; %do.body158
                                        ;   in Loop: Header=BB22_75 Depth=3
	mov	&camel, r12
	cmp	#1, r12
	jne	.LBB22_83
	jmp	.LBB22_82
.LBB22_82:                              ; %if.then160
                                        ;   in Loop: Header=BB22_75 Depth=3
	mov	#camel+228, &safe
	mov	#camel+2, &unsafe
	mov	&safe, r12
	call	#__dump_registers
	mov	#2, &camel
	jmp	.LBB22_84
.LBB22_83:                              ; %if.else163
                                        ;   in Loop: Header=BB22_75 Depth=3
	mov	#camel+2, &safe
	mov	#camel+228, &unsafe
	mov	&safe, r12
	call	#__dump_registers
	mov	#1, &camel
	jmp	.LBB22_84
.LBB22_84:                              ; %if.end166
                                        ;   in Loop: Header=BB22_75 Depth=3
	jmp	.LBB22_85
.LBB22_85:                              ; %do.end168
                                        ;   in Loop: Header=BB22_75 Depth=3
	call	#task_commit
	mov	&unsafe, r12
	add	#22, r12
	mov	&safe, r13
	add	#22, r13
	mov	#202, r14
	call	#memcpy
	call	#task_reduce_compare
	jmp	.LBB22_86
.LBB22_86:                              ; %do.body169
                                        ;   in Loop: Header=BB22_75 Depth=3
	mov	&camel, r12
	cmp	#1, r12
	jne	.LBB22_88
	jmp	.LBB22_87
.LBB22_87:                              ; %if.then171
                                        ;   in Loop: Header=BB22_75 Depth=3
	mov	#camel+228, &safe
	mov	#camel+2, &unsafe
	mov	&safe, r12
	call	#__dump_registers
	mov	#2, &camel
	jmp	.LBB22_89
.LBB22_88:                              ; %if.else174
                                        ;   in Loop: Header=BB22_75 Depth=3
	mov	#camel+2, &safe
	mov	#camel+228, &unsafe
	mov	&safe, r12
	call	#__dump_registers
	mov	#1, &camel
	jmp	.LBB22_89
.LBB22_89:                              ; %if.end177
                                        ;   in Loop: Header=BB22_75 Depth=3
	jmp	.LBB22_90
.LBB22_90:                              ; %do.end179
                                        ;   in Loop: Header=BB22_75 Depth=3
	call	#task_commit
	mov	&safe, r12
	mov	220(r12), r12
	tst	r12
	jne	.LBB22_97
	jmp	.LBB22_91
.LBB22_91:                              ; %if.then183
                                        ;   in Loop: Header=BB22_75 Depth=3
	mov	&unsafe, r12
	add	#22, r12
	mov	&safe, r13
	add	#22, r13
	mov	#202, r14
	call	#memcpy
	call	#task_reduce_compare
	jmp	.LBB22_92
.LBB22_92:                              ; %do.body184
                                        ;   in Loop: Header=BB22_75 Depth=3
	mov	&camel, r12
	cmp	#1, r12
	jne	.LBB22_94
	jmp	.LBB22_93
.LBB22_93:                              ; %if.then186
                                        ;   in Loop: Header=BB22_75 Depth=3
	mov	#camel+228, &safe
	mov	#camel+2, &unsafe
	mov	&safe, r12
	call	#__dump_registers
	mov	#2, &camel
	jmp	.LBB22_95
.LBB22_94:                              ; %if.else189
                                        ;   in Loop: Header=BB22_75 Depth=3
	mov	#camel+2, &safe
	mov	#camel+228, &unsafe
	mov	&safe, r12
	call	#__dump_registers
	mov	#1, &camel
	jmp	.LBB22_95
.LBB22_95:                              ; %if.end192
                                        ;   in Loop: Header=BB22_75 Depth=3
	jmp	.LBB22_96
.LBB22_96:                              ; %do.end194
                                        ;   in Loop: Header=BB22_75 Depth=3
	call	#task_commit
	jmp	.LBB22_97
.LBB22_97:                              ; %if.end195
                                        ;   in Loop: Header=BB22_75 Depth=3
	mov	&unsafe, r12
	add	#22, r12
	mov	&safe, r13
	add	#22, r13
	mov	#202, r14
	call	#memcpy
	call	#task_reduce_subtract
	jmp	.LBB22_98
.LBB22_98:                              ; %do.body196
                                        ;   in Loop: Header=BB22_75 Depth=3
	mov	&camel, r12
	cmp	#1, r12
	jne	.LBB22_100
	jmp	.LBB22_99
.LBB22_99:                              ; %if.then198
                                        ;   in Loop: Header=BB22_75 Depth=3
	mov	#camel+228, &safe
	mov	#camel+2, &unsafe
	mov	&safe, r12
	call	#__dump_registers
	mov	#2, &camel
	jmp	.LBB22_101
.LBB22_100:                             ; %if.else201
                                        ;   in Loop: Header=BB22_75 Depth=3
	mov	#camel+2, &safe
	mov	#camel+228, &unsafe
	mov	&safe, r12
	call	#__dump_registers
	mov	#1, &camel
	jmp	.LBB22_101
.LBB22_101:                             ; %if.end204
                                        ;   in Loop: Header=BB22_75 Depth=3
	jmp	.LBB22_102
.LBB22_102:                             ; %do.end206
                                        ;   in Loop: Header=BB22_75 Depth=3
	call	#task_commit
	jmp	.LBB22_103
.LBB22_103:                             ; %do.cond207
                                        ;   in Loop: Header=BB22_75 Depth=3
	mov	&safe, r12
	mov	116(r12), r12
	inc	r12
	cmp	#9, r12
	jhs	.LBB22_75
	jmp	.LBB22_104
.LBB22_104:                             ; %do.end210
                                        ;   in Loop: Header=BB22_7 Depth=2
	jmp	.LBB22_105
.LBB22_105:                             ; %if.end211
                                        ;   in Loop: Header=BB22_7 Depth=2
	mov	&safe, r12
	mov	222(r12), r12
	tst	r12
	jne	.LBB22_112
	jmp	.LBB22_106
.LBB22_106:                             ; %if.then214
                                        ;   in Loop: Header=BB22_7 Depth=2
	mov	&unsafe, r12
	add	#22, r12
	mov	&safe, r13
	add	#22, r13
	mov	#202, r14
	call	#memcpy
	call	#task_mult_block_get_result
	jmp	.LBB22_107
.LBB22_107:                             ; %do.body215
                                        ;   in Loop: Header=BB22_7 Depth=2
	mov	&camel, r12
	cmp	#1, r12
	jne	.LBB22_109
	jmp	.LBB22_108
.LBB22_108:                             ; %if.then217
                                        ;   in Loop: Header=BB22_7 Depth=2
	mov	#camel+228, &safe
	mov	#camel+2, &unsafe
	mov	&safe, r12
	call	#__dump_registers
	mov	#2, &camel
	jmp	.LBB22_110
.LBB22_109:                             ; %if.else220
                                        ;   in Loop: Header=BB22_7 Depth=2
	mov	#camel+2, &safe
	mov	#camel+228, &unsafe
	mov	&safe, r12
	call	#__dump_registers
	mov	#1, &camel
	jmp	.LBB22_110
.LBB22_110:                             ; %if.end223
                                        ;   in Loop: Header=BB22_7 Depth=2
	jmp	.LBB22_111
.LBB22_111:                             ; %do.end225
                                        ;   in Loop: Header=BB22_7 Depth=2
	call	#task_commit
	jmp	.LBB22_120
.LBB22_112:                             ; %if.else226
                                        ;   in Loop: Header=BB22_7 Depth=2
	mov	&safe, r12
	mov	222(r12), r12
	cmp	#1, r12
	jne	.LBB22_119
	jmp	.LBB22_113
.LBB22_113:                             ; %if.then230
                                        ;   in Loop: Header=BB22_7 Depth=2
	mov	&unsafe, r12
	add	#22, r12
	mov	&safe, r13
	add	#22, r13
	mov	#202, r14
	call	#memcpy
	call	#task_square_base_get_result
	jmp	.LBB22_114
.LBB22_114:                             ; %do.body231
                                        ;   in Loop: Header=BB22_7 Depth=2
	mov	&camel, r12
	cmp	#1, r12
	jne	.LBB22_116
	jmp	.LBB22_115
.LBB22_115:                             ; %if.then233
                                        ;   in Loop: Header=BB22_7 Depth=2
	mov	#camel+228, &safe
	mov	#camel+2, &unsafe
	mov	&safe, r12
	call	#__dump_registers
	mov	#2, &camel
	jmp	.LBB22_117
.LBB22_116:                             ; %if.else236
                                        ;   in Loop: Header=BB22_7 Depth=2
	mov	#camel+2, &safe
	mov	#camel+228, &unsafe
	mov	&safe, r12
	call	#__dump_registers
	mov	#1, &camel
	jmp	.LBB22_117
.LBB22_117:                             ; %if.end239
                                        ;   in Loop: Header=BB22_7 Depth=2
	jmp	.LBB22_118
.LBB22_118:                             ; %do.end241
                                        ;   in Loop: Header=BB22_7 Depth=2
	call	#task_commit
	jmp	.LBB22_119
.LBB22_119:                             ; %if.end242
                                        ;   in Loop: Header=BB22_7 Depth=2
	jmp	.LBB22_120
.LBB22_120:                             ; %if.end243
                                        ;   in Loop: Header=BB22_7 Depth=2
	br	#.LBB22_7
.LBB22_121:                             ; %while.end
                                        ;   in Loop: Header=BB22_1 Depth=1
	br	#.LBB22_1
.Lfunc_end22:
	.size	main, .Lfunc_end22-main
                                        ; -- End function
	.type	camel,@object           ; @camel
	.comm	camel,454,2
	.type	safe,@object            ; @safe
	.comm	safe,2,2
	.type	unsafe,@object          ; @unsafe
	.comm	unsafe,2,2
	.type	pubkey,@object          ; @pubkey
	.section	.rodata,"a",@progbits
	.p2align	1
pubkey:
	.ascii	"\025p\366B\016\202q\246"
	.short	3                       ; 0x3
	.size	pubkey, 10

	.type	PLAINTEXT,@object       ; @PLAINTEXT
PLAINTEXT:
	.asciz	".RRRSSSAAA."
	.size	PLAINTEXT, 12

	.type	reset_vector,@object    ; @reset_vector
	.section	__interrupt_vector_56,"aw",@progbits
	.p2align	1
reset_vector:
	.short	camel_recover
	.size	reset_vector, 2

	.type	tmp_stack_crc,@object   ; @tmp_stack_crc
	.comm	tmp_stack_crc,2,2
	.type	tmp_stack_buf_crc,@object ; @tmp_stack_buf_crc
	.comm	tmp_stack_buf_crc,2,2
	.type	buf,@object             ; @buf
	.comm	buf,22,2

	.ident	"clang version 10.0.0 (https://github.com/llvm/llvm-project.git f79f68975d51b389d9f141aa30ab47723a75a868)"
	.section	".note.GNU-stack","",@progbits
