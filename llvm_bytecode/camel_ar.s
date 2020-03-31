	.text
	.file	"camel_ar.c"
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
	mov	#camel+190, &unsafe
	jmp	.LBB1_6
.LBB1_2:                                ; %if.else
	mov	&camel, r12
	cmp	#2, r12
	jne	.LBB1_4
	jmp	.LBB1_3
.LBB1_3:                                ; %if.then2
	mov	#camel+190, &safe
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
	mov	#186, r13
	call	#__fast_hw_crc
	mov	r12, &tmp_stack_buf_crc
	mov	&tmp_stack_buf_crc, r12
	mov	&safe, r13
	mov	186(r13), r13
	cmp	r13, r12
	jne	.LBB1_8
	jmp	.LBB1_7
.LBB1_7:                                ; %if.then10
	mov	&unsafe, r12
	mov	&safe, r13
	mov	#188, r14
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
	.globl	ACCEL_singleSample_     ; -- Begin function ACCEL_singleSample_
	.p2align	1
	.type	ACCEL_singleSample_,@function
ACCEL_singleSample_:                    ; @ACCEL_singleSample_
.Lfunc_begin2:
; %bb.0:                                ; %entry
	sub	#4, r1
	mov	r12, 2(r1)
	mov	r13, 0(r1)
	mov	0(r1), r12
	mov	#17, r13
	call	#__mspabi_mpyi
	mov	#85, r13
	call	#__mspabi_remu
	mov	2(r1), r13
	mov.b	r12, 0(r13)
	mov	0(r1), r12
	mov	#289, r13
	call	#__mspabi_mpyi
	mov	#85, r13
	call	#__mspabi_remu
	mov	2(r1), r13
	mov.b	r12, 1(r13)
	mov	0(r1), r12
	mov	#4913, r13
	call	#__mspabi_mpyi
	mov	#85, r13
	call	#__mspabi_remu
	mov	2(r1), r13
	mov.b	r12, 2(r13)
	mov	0(r1), r12
	inc	r12
	mov	r12, 0(r1)
	mov	0(r1), r12
	add	#4, r1
	ret
.Lfunc_end2:
	.size	ACCEL_singleSample_, .Lfunc_end2-ACCEL_singleSample_
                                        ; -- End function
	.globl	task_init               ; -- Begin function task_init
	.p2align	1
	.type	task_init,@function
task_init:                              ; @task_init
.Lfunc_begin3:
; %bb.0:                                ; %entry
	mov	&unsafe, r12
	mov	#3, 22(r12)
	mov	&unsafe, r12
	clr	184(r12)
	mov	&unsafe, r12
	mov	#1, 182(r12)
	ret
.Lfunc_end3:
	.size	task_init, .Lfunc_end3-task_init
                                        ; -- End function
	.globl	task_selectMode         ; -- Begin function task_selectMode
	.p2align	1
	.type	task_selectMode,@function
task_selectMode:                        ; @task_selectMode
.Lfunc_begin4:
; %bb.0:                                ; %entry
	sub	#6, r1
	mov	#1, 4(r1)
	mov	&unsafe, r12
	mov	184(r12), r13
	inc	r13
	mov	r13, 184(r12)
	mov	&unsafe, r12
	mov	184(r12), r12
	cmp	#3, r12
	jlo	.LBB4_2
	jmp	.LBB4_1
.LBB4_1:                                ; %if.then
	mov	#2, 4(r1)
	jmp	.LBB4_2
.LBB4_2:                                ; %if.end
	mov	&unsafe, r12
	mov	184(r12), r12
	cmp	#5, r12
	jlo	.LBB4_4
	jmp	.LBB4_3
.LBB4_3:                                ; %if.then6
	clr	4(r1)
	jmp	.LBB4_4
.LBB4_4:                                ; %if.end7
	mov	&unsafe, r12
	mov	184(r12), r12
	cmp	#7, r12
	jlo	.LBB4_6
	jmp	.LBB4_5
.LBB4_5:                                ; %if.then11
	call	#task_done
	jmp	.LBB4_6
.LBB4_6:                                ; %if.end12
	mov	4(r1), r12
	cmp	#2, r12
	jeq	.LBB4_8
	jmp	.LBB4_7
.LBB4_7:                                ; %lor.lhs.false
	mov	4(r1), r12
	cmp	#1, r12
	jne	.LBB4_10
	jmp	.LBB4_8
.LBB4_8:                                ; %land.lhs.true
	mov	4(r1), r12
	mov	&unsafe, r13
	mov	22(r13), r13
	cmp	r13, r12
	jne	.LBB4_10
	jmp	.LBB4_9
.LBB4_9:                                ; %if.then17
	mov	#3, 4(r1)
	jmp	.LBB4_11
.LBB4_10:                               ; %if.else
	mov	4(r1), r12
	mov	&unsafe, r13
	mov	r12, 22(r13)
	jmp	.LBB4_11
.LBB4_11:                               ; %if.end20
	mov	4(r1), r12
	tst	r12
	jeq	.LBB4_16
	jmp	.LBB4_12
.LBB4_12:                               ; %if.end20
	cmp	#1, r12
	jeq	.LBB4_15
	jmp	.LBB4_13
.LBB4_13:                               ; %if.end20
	cmp	#2, r12
	jne	.LBB4_17
	jmp	.LBB4_14
.LBB4_14:                               ; %sw.bb
	mov	&unsafe, r12
	clr	24(r12)
	mov	&unsafe, r12
	mov	#2, 180(r12)
	mov	&unsafe, r12
	clr	26(r12)
	mov	&unsafe, r12
	clr	178(r12)
	jmp	.LBB4_18
.LBB4_15:                               ; %sw.bb27
	mov	&unsafe, r12
	clr	24(r12)
	mov	&unsafe, r12
	mov	#1, 180(r12)
	mov	&unsafe, r12
	mov	#1, 26(r12)
	mov	&unsafe, r12
	clr	178(r12)
	jmp	.LBB4_18
.LBB4_16:                               ; %sw.bb36
	mov	&unsafe, r12
	clr	180(r12)
	jmp	.LBB4_18
.LBB4_17:                               ; %sw.default
	jmp	.LBB4_18
.LBB4_18:                               ; %sw.epilog
	add	#6, r1
	ret
.Lfunc_end4:
	.size	task_selectMode, .Lfunc_end4-task_selectMode
                                        ; -- End function
	.globl	task_resetStats         ; -- Begin function task_resetStats
	.p2align	1
	.type	task_resetStats,@function
task_resetStats:                        ; @task_resetStats
.Lfunc_begin5:
; %bb.0:                                ; %entry
	mov	&unsafe, r12
	clr	30(r12)
	mov	&unsafe, r12
	clr	32(r12)
	mov	&unsafe, r12
	clr	28(r12)
	mov	&unsafe, r12
	clr	178(r12)
	ret
.Lfunc_end5:
	.size	task_resetStats, .Lfunc_end5-task_resetStats
                                        ; -- End function
	.globl	task_sample             ; -- Begin function task_sample
	.p2align	1
	.type	task_sample,@function
task_sample:                            ; @task_sample
.Lfunc_begin6:
; %bb.0:                                ; %entry
	push	r10
	sub	#4, r1
	jmp	.LBB6_1
.LBB6_1:                                ; %while.cond
                                        ; =>This Inner Loop Header: Depth=1
	mov	&unsafe, r12
	mov	178(r12), r12
	cmp	#3, r12
	jhs	.LBB6_3
	jmp	.LBB6_2
.LBB6_2:                                ; %while.body
                                        ;   in Loop: Header=BB6_1 Depth=1
	mov	&unsafe, r12
	mov	182(r12), r13
	mov	r1, r12
	add	#1, r12
	call	#ACCEL_singleSample_
	mov	&unsafe, r13
	mov	r12, 182(r13)
	mov	&unsafe, r10
	mov	178(r10), r12
	mov	#3, r13
	call	#__mspabi_mpyi
	add	r12, r10
	mov.b	3(r1), r12
	mov.b	r12, 36(r10)
	mov.b	2(r1), r12
	mov.b	r12, 35(r10)
	mov.b	1(r1), r12
	mov.b	r12, 34(r10)
	mov	&unsafe, r12
	mov	178(r12), r13
	inc	r13
	mov	r13, 178(r12)
	jmp	.LBB6_1
.LBB6_3:                                ; %while.end
	mov	&unsafe, r12
	clr	178(r12)
	add	#4, r1
	pop	r10
	ret
.Lfunc_end6:
	.size	task_sample, .Lfunc_end6-task_sample
                                        ; -- End function
	.globl	task_transform          ; -- Begin function task_transform
	.p2align	1
	.type	task_transform,@function
task_transform:                         ; @task_transform
.Lfunc_begin7:
; %bb.0:                                ; %entry
	push	r10
	push	r9
	sub	#8, r1
	clr	0(r1)
	jmp	.LBB7_1
.LBB7_1:                                ; %for.cond
                                        ; =>This Inner Loop Header: Depth=1
	mov	0(r1), r12
	cmp	#3, r12
	jhs	.LBB7_17
	jmp	.LBB7_2
.LBB7_2:                                ; %for.body
                                        ;   in Loop: Header=BB7_1 Depth=1
	mov	&unsafe, r10
	mov	0(r1), r12
	mov	#3, r13
	call	#__mspabi_mpyi
	add	r12, r10
	mov.b	34(r10), r12
	sxt	r12
	cmp	#10, r12
	jl	.LBB7_5
	jmp	.LBB7_3
.LBB7_3:                                ; %lor.lhs.false
                                        ;   in Loop: Header=BB7_1 Depth=1
	mov	&unsafe, r10
	mov	0(r1), r12
	mov	#3, r13
	call	#__mspabi_mpyi
	add	r12, r10
	mov.b	35(r10), r12
	sxt	r12
	cmp	#10, r12
	jl	.LBB7_5
	jmp	.LBB7_4
.LBB7_4:                                ; %lor.lhs.false9
                                        ;   in Loop: Header=BB7_1 Depth=1
	mov	&unsafe, r10
	mov	0(r1), r12
	mov	#3, r13
	call	#__mspabi_mpyi
	add	r12, r10
	mov.b	36(r10), r12
	sxt	r12
	cmp	#10, r12
	jge	.LBB7_15
	jmp	.LBB7_5
.LBB7_5:                                ; %if.then
                                        ;   in Loop: Header=BB7_1 Depth=1
	mov	&unsafe, r10
	mov	0(r1), r12
	mov	#3, r13
	call	#__mspabi_mpyi
	add	r12, r10
	mov.b	34(r10), r12
	sxt	r12
	cmp	#11, r12
	jl	.LBB7_7
	jmp	.LBB7_6
.LBB7_6:                                ; %cond.true
                                        ;   in Loop: Header=BB7_1 Depth=1
	mov	&unsafe, r10
	mov	0(r1), r12
	mov	#3, r13
	call	#__mspabi_mpyi
	add	r12, r10
	mov.b	34(r10), r10
	sxt	r10
	jmp	.LBB7_8
.LBB7_7:                                ; %cond.false
                                        ;   in Loop: Header=BB7_1 Depth=1
	clr	r10
	jmp	.LBB7_8
.LBB7_8:                                ; %cond.end
                                        ;   in Loop: Header=BB7_1 Depth=1
	mov	&unsafe, r9
	mov	0(r1), r12
	mov	#3, r13
	call	#__mspabi_mpyi
	add	r12, r9
	mov.b	r10, 34(r9)
	mov	&unsafe, r10
	mov	0(r1), r12
	mov	#3, r13
	call	#__mspabi_mpyi
	add	r12, r10
	mov.b	35(r10), r12
	sxt	r12
	cmp	#11, r12
	jl	.LBB7_10
	jmp	.LBB7_9
.LBB7_9:                                ; %cond.true40
                                        ;   in Loop: Header=BB7_1 Depth=1
	mov	&unsafe, r10
	mov	0(r1), r12
	mov	#3, r13
	call	#__mspabi_mpyi
	add	r12, r10
	mov.b	35(r10), r10
	sxt	r10
	jmp	.LBB7_11
.LBB7_10:                               ; %cond.false46
                                        ;   in Loop: Header=BB7_1 Depth=1
	clr	r10
	jmp	.LBB7_11
.LBB7_11:                               ; %cond.end47
                                        ;   in Loop: Header=BB7_1 Depth=1
	mov	&unsafe, r9
	mov	0(r1), r12
	mov	#3, r13
	call	#__mspabi_mpyi
	add	r12, r9
	mov.b	r10, 35(r9)
	mov	&unsafe, r10
	mov	0(r1), r12
	mov	#3, r13
	call	#__mspabi_mpyi
	add	r12, r10
	mov.b	36(r10), r12
	sxt	r12
	cmp	#11, r12
	jl	.LBB7_13
	jmp	.LBB7_12
.LBB7_12:                               ; %cond.true61
                                        ;   in Loop: Header=BB7_1 Depth=1
	mov	&unsafe, r10
	mov	0(r1), r12
	mov	#3, r13
	call	#__mspabi_mpyi
	add	r12, r10
	mov.b	36(r10), r10
	sxt	r10
	jmp	.LBB7_14
.LBB7_13:                               ; %cond.false67
                                        ;   in Loop: Header=BB7_1 Depth=1
	clr	r10
	jmp	.LBB7_14
.LBB7_14:                               ; %cond.end68
                                        ;   in Loop: Header=BB7_1 Depth=1
	mov	&unsafe, r9
	mov	0(r1), r12
	mov	#3, r13
	call	#__mspabi_mpyi
	add	r12, r9
	mov.b	r10, 36(r9)
	jmp	.LBB7_15
.LBB7_15:                               ; %if.end
                                        ;   in Loop: Header=BB7_1 Depth=1
	jmp	.LBB7_16
.LBB7_16:                               ; %for.inc
                                        ;   in Loop: Header=BB7_1 Depth=1
	mov	0(r1), r12
	inc	r12
	mov	r12, 0(r1)
	jmp	.LBB7_1
.LBB7_17:                               ; %for.end
	add	#8, r1
	pop	r9
	pop	r10
	ret
.Lfunc_end7:
	.size	task_transform, .Lfunc_end7-task_transform
                                        ; -- End function
	.globl	task_featurize          ; -- Begin function task_featurize
	.p2align	1
	.type	task_featurize,@function
task_featurize:                         ; @task_featurize
.Lfunc_begin8:
; %bb.0:                                ; %entry
	push	r10
	push	r9
	sub	#16, r1
	clr.b	15(r1)
	clr.b	14(r1)
	clr.b	13(r1)
	clr.b	12(r1)
	clr.b	11(r1)
	clr.b	10(r1)
	clr	4(r1)
	jmp	.LBB8_1
.LBB8_1:                                ; %for.cond
                                        ; =>This Inner Loop Header: Depth=1
	mov	4(r1), r12
	cmp	#3, r12
	jge	.LBB8_4
	jmp	.LBB8_2
.LBB8_2:                                ; %for.body
                                        ;   in Loop: Header=BB8_1 Depth=1
	mov	&unsafe, r10
	mov	4(r1), r12
	mov	#3, r13
	call	#__mspabi_mpyi
	add	r12, r10
	mov.b	34(r10), r12
	mov.b	13(r1), r13
	add	r12, r13
	mov.b	r13, 13(r1)
	mov	&unsafe, r10
	mov	4(r1), r12
	mov	#3, r13
	call	#__mspabi_mpyi
	add	r12, r10
	mov.b	35(r10), r12
	mov.b	14(r1), r13
	add	r12, r13
	mov.b	r13, 14(r1)
	mov	&unsafe, r10
	mov	4(r1), r12
	mov	#3, r13
	call	#__mspabi_mpyi
	add	r12, r10
	mov.b	36(r10), r12
	mov.b	15(r1), r13
	add	r12, r13
	mov.b	r13, 15(r1)
	jmp	.LBB8_3
.LBB8_3:                                ; %for.inc
                                        ;   in Loop: Header=BB8_1 Depth=1
	mov	4(r1), r12
	inc	r12
	mov	r12, 4(r1)
	jmp	.LBB8_1
.LBB8_4:                                ; %for.end
	mov.b	13(r1), r12
	sxt	r12
	clrc
	rrc	r12
	rra	r12
	mov.b	r12, 13(r1)
	mov.b	14(r1), r12
	sxt	r12
	clrc
	rrc	r12
	rra	r12
	mov.b	r12, 14(r1)
	mov.b	15(r1), r12
	sxt	r12
	clrc
	rrc	r12
	rra	r12
	mov.b	r12, 15(r1)
	clr	4(r1)
	jmp	.LBB8_5
.LBB8_5:                                ; %for.cond37
                                        ; =>This Inner Loop Header: Depth=1
	mov	4(r1), r12
	cmp	#3, r12
	jge	.LBB8_17
	jmp	.LBB8_6
.LBB8_6:                                ; %for.body40
                                        ;   in Loop: Header=BB8_5 Depth=1
	mov	&unsafe, r10
	mov	4(r1), r12
	mov	#3, r13
	call	#__mspabi_mpyi
	add	r12, r10
	mov.b	34(r10), r12
	sxt	r12
	mov.b	13(r1), r13
	sxt	r13
	cmp	r12, r13
	jge	.LBB8_8
	jmp	.LBB8_7
.LBB8_7:                                ; %cond.true
                                        ;   in Loop: Header=BB8_5 Depth=1
	mov	&unsafe, r10
	mov	4(r1), r12
	mov	#3, r13
	call	#__mspabi_mpyi
	add	r12, r10
	mov.b	34(r10), r10
	sxt	r10
	mov.b	13(r1), r12
	sxt	r12
	sub	r12, r10
	jmp	.LBB8_9
.LBB8_8:                                ; %cond.false
                                        ;   in Loop: Header=BB8_5 Depth=1
	mov.b	13(r1), r10
	sxt	r10
	mov	&unsafe, r9
	mov	4(r1), r12
	mov	#3, r13
	call	#__mspabi_mpyi
	add	r12, r9
	mov.b	34(r9), r12
	sxt	r12
	sub	r12, r10
	jmp	.LBB8_9
.LBB8_9:                                ; %cond.end
                                        ;   in Loop: Header=BB8_5 Depth=1
	mov.b	10(r1), r12
	add	r10, r12
	mov.b	r12, 10(r1)
	mov	&unsafe, r10
	mov	4(r1), r12
	mov	#3, r13
	call	#__mspabi_mpyi
	add	r12, r10
	mov.b	35(r10), r12
	sxt	r12
	mov.b	14(r1), r13
	sxt	r13
	cmp	r12, r13
	jge	.LBB8_11
	jmp	.LBB8_10
.LBB8_10:                               ; %cond.true78
                                        ;   in Loop: Header=BB8_5 Depth=1
	mov	&unsafe, r10
	mov	4(r1), r12
	mov	#3, r13
	call	#__mspabi_mpyi
	add	r12, r10
	mov.b	35(r10), r10
	sxt	r10
	mov.b	14(r1), r12
	sxt	r12
	sub	r12, r10
	jmp	.LBB8_12
.LBB8_11:                               ; %cond.false87
                                        ;   in Loop: Header=BB8_5 Depth=1
	mov.b	14(r1), r10
	sxt	r10
	mov	&unsafe, r9
	mov	4(r1), r12
	mov	#3, r13
	call	#__mspabi_mpyi
	add	r12, r9
	mov.b	35(r9), r12
	sxt	r12
	sub	r12, r10
	jmp	.LBB8_12
.LBB8_12:                               ; %cond.end96
                                        ;   in Loop: Header=BB8_5 Depth=1
	mov.b	11(r1), r12
	add	r10, r12
	mov.b	r12, 11(r1)
	mov	&unsafe, r10
	mov	4(r1), r12
	mov	#3, r13
	call	#__mspabi_mpyi
	add	r12, r10
	mov.b	36(r10), r12
	sxt	r12
	mov.b	15(r1), r13
	sxt	r13
	cmp	r12, r13
	jge	.LBB8_14
	jmp	.LBB8_13
.LBB8_13:                               ; %cond.true111
                                        ;   in Loop: Header=BB8_5 Depth=1
	mov	&unsafe, r10
	mov	4(r1), r12
	mov	#3, r13
	call	#__mspabi_mpyi
	add	r12, r10
	mov.b	36(r10), r10
	sxt	r10
	mov.b	15(r1), r12
	sxt	r12
	sub	r12, r10
	jmp	.LBB8_15
.LBB8_14:                               ; %cond.false120
                                        ;   in Loop: Header=BB8_5 Depth=1
	mov.b	15(r1), r10
	sxt	r10
	mov	&unsafe, r9
	mov	4(r1), r12
	mov	#3, r13
	call	#__mspabi_mpyi
	add	r12, r9
	mov.b	36(r9), r12
	sxt	r12
	sub	r12, r10
	jmp	.LBB8_15
.LBB8_15:                               ; %cond.end129
                                        ;   in Loop: Header=BB8_5 Depth=1
	mov.b	12(r1), r12
	add	r10, r12
	mov.b	r12, 12(r1)
	jmp	.LBB8_16
.LBB8_16:                               ; %for.inc135
                                        ;   in Loop: Header=BB8_5 Depth=1
	mov	4(r1), r12
	inc	r12
	mov	r12, 4(r1)
	jmp	.LBB8_5
.LBB8_17:                               ; %for.end137
	mov.b	10(r1), r12
	sxt	r12
	clrc
	rrc	r12
	rra	r12
	mov.b	r12, 10(r1)
	mov.b	11(r1), r12
	sxt	r12
	clrc
	rrc	r12
	rra	r12
	mov.b	r12, 11(r1)
	mov.b	12(r1), r12
	sxt	r12
	clrc
	rrc	r12
	rra	r12
	mov.b	r12, 12(r1)
	mov.b	13(r1), r12
	sxt	r12
	mov	r12, r13
	call	#__mspabi_mpyi
	mov	r12, r10
	mov.b	14(r1), r12
	sxt	r12
	mov	r12, r13
	call	#__mspabi_mpyi
	add	r12, r10
	mov.b	15(r1), r12
	sxt	r12
	mov	r12, r13
	call	#__mspabi_mpyi
	add	r12, r10
	mov	r10, 2(r1)
	mov.b	10(r1), r12
	sxt	r12
	mov	r12, r13
	call	#__mspabi_mpyi
	mov	r12, r10
	mov.b	11(r1), r12
	sxt	r12
	mov	r12, r13
	call	#__mspabi_mpyi
	add	r12, r10
	mov.b	12(r1), r12
	sxt	r12
	mov	r12, r13
	call	#__mspabi_mpyi
	add	r12, r10
	mov	r10, 0(r1)
	mov	2(r1), r12
	call	#sqrt16
	mov	r12, 6(r1)
	mov	0(r1), r12
	call	#sqrt16
	mov	r12, 8(r1)
	mov	&unsafe, r12
	mov	180(r12), r12
	cmp	#3, r12
	jhs	.LBB8_19
	jmp	.LBB8_18
.LBB8_18:                               ; %sw.bb
	mov	&unsafe, r12
	mov	8(r1), r13
	mov	r13, 46(r12)
	mov	6(r1), r13
	mov	r13, 44(r12)
	jmp	.LBB8_20
.LBB8_19:                               ; %sw.default
	jmp	.LBB8_20
.LBB8_20:                               ; %sw.epilog
	add	#16, r1
	pop	r9
	pop	r10
	ret
.Lfunc_end8:
	.size	task_featurize, .Lfunc_end8-task_featurize
                                        ; -- End function
	.globl	task_classify           ; -- Begin function task_classify
	.p2align	1
	.type	task_classify,@function
task_classify:                          ; @task_classify
.Lfunc_begin9:
; %bb.0:                                ; %entry
	sub	#32, r1
	clr	30(r1)
	clr	28(r1)
	mov	&unsafe, r12
	mov	44(r12), r12
	mov	r12, 20(r1)
	clr	22(r1)
	mov	&unsafe, r12
	mov	46(r12), r12
	mov	r12, 16(r1)
	clr	18(r1)
	clr	26(r1)
	jmp	.LBB9_1
.LBB9_1:                                ; %for.cond
                                        ; =>This Inner Loop Header: Depth=1
	mov	26(r1), r12
	cmp	#16, r12
	jge	.LBB9_46
	jmp	.LBB9_2
.LBB9_2:                                ; %for.body
                                        ;   in Loop: Header=BB9_1 Depth=1
	mov	&unsafe, r12
	mov	26(r1), r13
	add	r13, r13
	add	r13, r13
	add	r13, r12
	mov	48(r12), r14
	mov	20(r1), r15
	mov	22(r1), r13
	mov	#1, r12
	tst	r13
	jge	.LBB9_4
; %bb.3:                                ; %for.body
                                        ;   in Loop: Header=BB9_1 Depth=1
	clr	r12
.LBB9_4:                                ; %for.body
                                        ;   in Loop: Header=BB9_1 Depth=1
	cmp	r14, r15
	mov	r2, r14
	and	#1, r14
	tst	r13
	jeq	.LBB9_6
; %bb.5:                                ; %for.body
                                        ;   in Loop: Header=BB9_1 Depth=1
	mov	r12, r14
.LBB9_6:                                ; %for.body
                                        ;   in Loop: Header=BB9_1 Depth=1
	bit	#1, r14
	jne	.LBB9_8
	jmp	.LBB9_7
.LBB9_7:                                ; %cond.true
                                        ;   in Loop: Header=BB9_1 Depth=1
	mov	&unsafe, r12
	mov	26(r1), r13
	add	r13, r13
	add	r13, r13
	add	r13, r12
	mov	48(r12), r12
	mov	22(r1), r14
	mov	20(r1), r15
	mov	r12, r13
	sub	r15, r13
	cmp	r15, r12
	mov	#1, r12
	bic	r2, r12
	add	r12, r14
	clr	r12
	sub	r14, r12
	jmp	.LBB9_9
.LBB9_8:                                ; %cond.false
                                        ;   in Loop: Header=BB9_1 Depth=1
	mov	22(r1), r12
	mov	20(r1), r14
	mov	&unsafe, r13
	mov	26(r1), r15
	add	r15, r15
	add	r15, r15
	add	r15, r13
	mov	48(r13), r15
	mov	r14, r13
	sub	r15, r13
	cmp	r15, r14
	mov	#1, r14
	bic	r2, r14
	sub	r14, r12
	jmp	.LBB9_9
.LBB9_9:                                ; %cond.end
                                        ;   in Loop: Header=BB9_1 Depth=1
	mov	r13, 12(r1)
	mov	r12, 14(r1)
	mov	&unsafe, r12
	mov	26(r1), r13
	add	r13, r13
	add	r13, r13
	add	r13, r12
	mov	50(r12), r14
	mov	16(r1), r15
	mov	18(r1), r13
	mov	#1, r12
	tst	r13
	jge	.LBB9_11
; %bb.10:                               ; %cond.end
                                        ;   in Loop: Header=BB9_1 Depth=1
	clr	r12
.LBB9_11:                               ; %cond.end
                                        ;   in Loop: Header=BB9_1 Depth=1
	cmp	r14, r15
	mov	r2, r14
	and	#1, r14
	tst	r13
	jeq	.LBB9_13
; %bb.12:                               ; %cond.end
                                        ;   in Loop: Header=BB9_1 Depth=1
	mov	r12, r14
.LBB9_13:                               ; %cond.end
                                        ;   in Loop: Header=BB9_1 Depth=1
	bit	#1, r14
	jne	.LBB9_15
	jmp	.LBB9_14
.LBB9_14:                               ; %cond.true30
                                        ;   in Loop: Header=BB9_1 Depth=1
	mov	&unsafe, r12
	mov	26(r1), r13
	add	r13, r13
	add	r13, r13
	add	r13, r12
	mov	50(r12), r12
	mov	18(r1), r14
	mov	16(r1), r15
	mov	r12, r13
	sub	r15, r13
	cmp	r15, r12
	mov	#1, r12
	bic	r2, r12
	add	r12, r14
	clr	r12
	sub	r14, r12
	jmp	.LBB9_16
.LBB9_15:                               ; %cond.false37
                                        ;   in Loop: Header=BB9_1 Depth=1
	mov	18(r1), r12
	mov	16(r1), r14
	mov	&unsafe, r13
	mov	26(r1), r15
	add	r15, r15
	add	r15, r15
	add	r15, r13
	mov	50(r13), r15
	mov	r14, r13
	sub	r15, r13
	cmp	r15, r14
	mov	#1, r14
	bic	r2, r14
	sub	r14, r12
	jmp	.LBB9_16
.LBB9_16:                               ; %cond.end44
                                        ;   in Loop: Header=BB9_1 Depth=1
	mov	r13, 8(r1)
	mov	r12, 10(r1)
	mov	&unsafe, r12
	mov	26(r1), r13
	add	r13, r13
	add	r13, r13
	add	r13, r12
	mov	112(r12), r14
	mov	20(r1), r15
	mov	22(r1), r13
	mov	#1, r12
	tst	r13
	jge	.LBB9_18
; %bb.17:                               ; %cond.end44
                                        ;   in Loop: Header=BB9_1 Depth=1
	clr	r12
.LBB9_18:                               ; %cond.end44
                                        ;   in Loop: Header=BB9_1 Depth=1
	cmp	r14, r15
	mov	r2, r14
	and	#1, r14
	tst	r13
	jeq	.LBB9_20
; %bb.19:                               ; %cond.end44
                                        ;   in Loop: Header=BB9_1 Depth=1
	mov	r12, r14
.LBB9_20:                               ; %cond.end44
                                        ;   in Loop: Header=BB9_1 Depth=1
	bit	#1, r14
	jne	.LBB9_22
	jmp	.LBB9_21
.LBB9_21:                               ; %cond.true52
                                        ;   in Loop: Header=BB9_1 Depth=1
	mov	&unsafe, r12
	mov	26(r1), r13
	add	r13, r13
	add	r13, r13
	add	r13, r12
	mov	112(r12), r12
	mov	22(r1), r14
	mov	20(r1), r15
	mov	r12, r13
	sub	r15, r13
	cmp	r15, r12
	mov	#1, r12
	bic	r2, r12
	add	r12, r14
	clr	r12
	sub	r14, r12
	jmp	.LBB9_23
.LBB9_22:                               ; %cond.false59
                                        ;   in Loop: Header=BB9_1 Depth=1
	mov	22(r1), r12
	mov	20(r1), r14
	mov	&unsafe, r13
	mov	26(r1), r15
	add	r15, r15
	add	r15, r15
	add	r15, r13
	mov	112(r13), r15
	mov	r14, r13
	sub	r15, r13
	cmp	r15, r14
	mov	#1, r14
	bic	r2, r14
	sub	r14, r12
	jmp	.LBB9_23
.LBB9_23:                               ; %cond.end66
                                        ;   in Loop: Header=BB9_1 Depth=1
	mov	r13, 4(r1)
	mov	r12, 6(r1)
	mov	&unsafe, r12
	mov	26(r1), r13
	add	r13, r13
	add	r13, r13
	add	r13, r12
	mov	114(r12), r14
	mov	16(r1), r15
	mov	18(r1), r13
	mov	#1, r12
	tst	r13
	jge	.LBB9_25
; %bb.24:                               ; %cond.end66
                                        ;   in Loop: Header=BB9_1 Depth=1
	clr	r12
.LBB9_25:                               ; %cond.end66
                                        ;   in Loop: Header=BB9_1 Depth=1
	cmp	r14, r15
	mov	r2, r14
	and	#1, r14
	tst	r13
	jeq	.LBB9_27
; %bb.26:                               ; %cond.end66
                                        ;   in Loop: Header=BB9_1 Depth=1
	mov	r12, r14
.LBB9_27:                               ; %cond.end66
                                        ;   in Loop: Header=BB9_1 Depth=1
	bit	#1, r14
	jne	.LBB9_29
	jmp	.LBB9_28
.LBB9_28:                               ; %cond.true75
                                        ;   in Loop: Header=BB9_1 Depth=1
	mov	&unsafe, r12
	mov	26(r1), r13
	add	r13, r13
	add	r13, r13
	add	r13, r12
	mov	114(r12), r12
	mov	18(r1), r14
	mov	16(r1), r15
	mov	r12, r13
	sub	r15, r13
	cmp	r15, r12
	mov	#1, r12
	bic	r2, r12
	add	r12, r14
	clr	r12
	sub	r14, r12
	jmp	.LBB9_30
.LBB9_29:                               ; %cond.false82
                                        ;   in Loop: Header=BB9_1 Depth=1
	mov	18(r1), r12
	mov	16(r1), r14
	mov	&unsafe, r13
	mov	26(r1), r15
	add	r15, r15
	add	r15, r15
	add	r15, r13
	mov	114(r13), r15
	mov	r14, r13
	sub	r15, r13
	cmp	r15, r14
	mov	#1, r14
	bic	r2, r14
	sub	r14, r12
	jmp	.LBB9_30
.LBB9_30:                               ; %cond.end89
                                        ;   in Loop: Header=BB9_1 Depth=1
	mov	r13, 0(r1)
	mov	r12, 2(r1)
	mov	4(r1), r15
	mov	6(r1), r12
	mov	12(r1), r11
	mov	14(r1), r14
	mov	#1, r13
	cmp	r14, r12
	jge	.LBB9_32
; %bb.31:                               ; %cond.end89
                                        ;   in Loop: Header=BB9_1 Depth=1
	clr	r13
.LBB9_32:                               ; %cond.end89
                                        ;   in Loop: Header=BB9_1 Depth=1
	cmp	r11, r15
	mov	r2, r15
	and	#1, r15
	cmp	r14, r12
	jeq	.LBB9_34
; %bb.33:                               ; %cond.end89
                                        ;   in Loop: Header=BB9_1 Depth=1
	mov	r13, r15
.LBB9_34:                               ; %cond.end89
                                        ;   in Loop: Header=BB9_1 Depth=1
	bit	#1, r15
	jne	.LBB9_36
	jmp	.LBB9_35
.LBB9_35:                               ; %if.then
                                        ;   in Loop: Header=BB9_1 Depth=1
	mov	30(r1), r12
	inc	r12
	mov	r12, 30(r1)
	jmp	.LBB9_37
.LBB9_36:                               ; %if.else
                                        ;   in Loop: Header=BB9_1 Depth=1
	mov	28(r1), r12
	inc	r12
	mov	r12, 28(r1)
	jmp	.LBB9_37
.LBB9_37:                               ; %if.end
                                        ;   in Loop: Header=BB9_1 Depth=1
	mov	0(r1), r15
	mov	2(r1), r12
	mov	8(r1), r11
	mov	10(r1), r14
	mov	#1, r13
	cmp	r14, r12
	jge	.LBB9_39
; %bb.38:                               ; %if.end
                                        ;   in Loop: Header=BB9_1 Depth=1
	clr	r13
.LBB9_39:                               ; %if.end
                                        ;   in Loop: Header=BB9_1 Depth=1
	cmp	r11, r15
	mov	r2, r15
	and	#1, r15
	cmp	r14, r12
	jeq	.LBB9_41
; %bb.40:                               ; %if.end
                                        ;   in Loop: Header=BB9_1 Depth=1
	mov	r13, r15
.LBB9_41:                               ; %if.end
                                        ;   in Loop: Header=BB9_1 Depth=1
	bit	#1, r15
	jne	.LBB9_43
	jmp	.LBB9_42
.LBB9_42:                               ; %if.then96
                                        ;   in Loop: Header=BB9_1 Depth=1
	mov	30(r1), r12
	inc	r12
	mov	r12, 30(r1)
	jmp	.LBB9_44
.LBB9_43:                               ; %if.else98
                                        ;   in Loop: Header=BB9_1 Depth=1
	mov	28(r1), r12
	inc	r12
	mov	r12, 28(r1)
	jmp	.LBB9_44
.LBB9_44:                               ; %if.end100
                                        ;   in Loop: Header=BB9_1 Depth=1
	jmp	.LBB9_45
.LBB9_45:                               ; %for.inc
                                        ;   in Loop: Header=BB9_1 Depth=1
	mov	26(r1), r12
	inc	r12
	mov	r12, 26(r1)
	jmp	.LBB9_1
.LBB9_46:                               ; %for.end
	mov	30(r1), r13
	mov	28(r1), r14
	mov	#1, r12
	cmp	r13, r14
	jl	.LBB9_48
; %bb.47:                               ; %for.end
	clr	r12
.LBB9_48:                               ; %for.end
	mov	&unsafe, r13
	mov	r12, 26(r13)
	add	#32, r1
	ret
.Lfunc_end9:
	.size	task_classify, .Lfunc_end9-task_classify
                                        ; -- End function
	.globl	task_stats              ; -- Begin function task_stats
	.p2align	1
	.type	task_stats,@function
task_stats:                             ; @task_stats
.Lfunc_begin10:
; %bb.0:                                ; %entry
	push	r10
	sub	#10, r1
	clr	8(r1)
	clr	6(r1)
	mov	&unsafe, r12
	mov	28(r12), r13
	inc	r13
	mov	r13, 28(r12)
	mov	&unsafe, r12
	mov	26(r12), r12
	tst	r12
	jeq	.LBB10_3
	jmp	.LBB10_1
.LBB10_1:                               ; %entry
	cmp	#1, r12
	jne	.LBB10_4
	jmp	.LBB10_2
.LBB10_2:                               ; %sw.bb
	mov	&unsafe, r12
	mov	30(r12), r13
	inc	r13
	mov	r13, 30(r12)
	jmp	.LBB10_4
.LBB10_3:                               ; %sw.bb5
	mov	&unsafe, r12
	mov	32(r12), r13
	inc	r13
	mov	r13, 32(r12)
	jmp	.LBB10_4
.LBB10_4:                               ; %sw.epilog
	mov	&unsafe, r12
	mov	28(r12), r12
	cmp	#128, r12
	jne	.LBB10_6
	jmp	.LBB10_5
.LBB10_5:                               ; %if.then
	mov	&unsafe, r10
	mov	32(r10), r12
	mov	#100, r13
	call	#__mspabi_mpyi
	mov	28(r10), r13
	call	#__mspabi_divu
	mov	r12, 4(r1)
	mov	&unsafe, r10
	mov	30(r10), r12
	mov	#100, r13
	call	#__mspabi_mpyi
	mov	28(r10), r13
	call	#__mspabi_divu
	mov	r12, 2(r1)
	mov	&unsafe, r12
	mov	32(r12), r13
	mov	30(r12), r12
	add	r12, r13
	mov	r13, 0(r1)
	jmp	.LBB10_7
.LBB10_6:                               ; %if.else
	jmp	.LBB10_7
.LBB10_7:                               ; %if.end
	add	#10, r1
	pop	r10
	ret
.Lfunc_end10:
	.size	task_stats, .Lfunc_end10-task_stats
                                        ; -- End function
	.globl	task_warmup             ; -- Begin function task_warmup
	.p2align	1
	.type	task_warmup,@function
task_warmup:                            ; @task_warmup
.Lfunc_begin11:
; %bb.0:                                ; %entry
	sub	#4, r1
	jmp	.LBB11_1
.LBB11_1:                               ; %while.cond
                                        ; =>This Inner Loop Header: Depth=1
	mov	&unsafe, r12
	mov	24(r12), r12
	cmp	#3, r12
	jhs	.LBB11_3
	jmp	.LBB11_2
.LBB11_2:                               ; %while.body
                                        ;   in Loop: Header=BB11_1 Depth=1
	mov	&unsafe, r12
	mov	182(r12), r13
	mov	r1, r12
	add	#1, r12
	call	#ACCEL_singleSample_
	mov	&unsafe, r13
	mov	r12, 182(r13)
	mov	&unsafe, r12
	mov	24(r12), r13
	inc	r13
	mov	r13, 24(r12)
	jmp	.LBB11_1
.LBB11_3:                               ; %while.end
	mov	&unsafe, r12
	clr	176(r12)
	add	#4, r1
	ret
.Lfunc_end11:
	.size	task_warmup, .Lfunc_end11-task_warmup
                                        ; -- End function
	.globl	task_train              ; -- Begin function task_train
	.p2align	1
	.type	task_train,@function
task_train:                             ; @task_train
.Lfunc_begin12:
; %bb.0:                                ; %entry
	sub	#4, r1
	mov	&unsafe, r12
	mov	26(r12), r12
	tst	r12
	jeq	.LBB12_2
	jmp	.LBB12_1
.LBB12_1:                               ; %entry
	cmp	#1, r12
	jeq	.LBB12_3
	jmp	.LBB12_4
.LBB12_2:                               ; %sw.bb
	mov	&unsafe, r12
	mov	176(r12), r13
	add	r13, r13
	add	r13, r13
	mov	r12, r14
	add	r13, r14
	mov	46(r12), r13
	mov	r13, 50(r14)
	mov	44(r12), r12
	mov	r12, 48(r14)
	jmp	.LBB12_4
.LBB12_3:                               ; %sw.bb6
	mov	&unsafe, r12
	mov	176(r12), r13
	add	r13, r13
	add	r13, r13
	mov	r12, r14
	add	r13, r14
	mov	46(r12), r13
	mov	r13, 114(r14)
	mov	44(r12), r12
	mov	r12, 112(r14)
	jmp	.LBB12_4
.LBB12_4:                               ; %sw.epilog
	mov	&unsafe, r12
	mov	176(r12), r13
	inc	r13
	mov	r13, 176(r12)
	mov	&unsafe, r12
	mov	176(r12), r12
	cmp	#16, r12
	jhs	.LBB12_6
	jmp	.LBB12_5
.LBB12_5:                               ; %if.then
	jmp	.LBB12_7
.LBB12_6:                               ; %if.else
	jmp	.LBB12_7
.LBB12_7:                               ; %if.end
	add	#4, r1
	ret
.Lfunc_end12:
	.size	task_train, .Lfunc_end12-task_train
                                        ; -- End function
	.globl	task_done               ; -- Begin function task_done
	.p2align	1
	.type	task_done,@function
task_done:                              ; @task_done
.Lfunc_begin13:
; %bb.0:                                ; %entry
	clr	r12
	call	#exit
.Lfunc_end13:
	.size	task_done, .Lfunc_end13-task_done
                                        ; -- End function
	.globl	task_commit             ; -- Begin function task_commit
	.p2align	1
	.type	task_commit,@function
task_commit:                            ; @task_commit
.Lfunc_begin14:
; %bb.0:                                ; %entry
	ret
.Lfunc_end14:
	.size	task_commit, .Lfunc_end14-task_commit
                                        ; -- End function
	.globl	main                    ; -- Begin function main
	.p2align	1
	.type	main,@function
main:                                   ; @main
.Lfunc_begin15:
; %bb.0:                                ; %entry
	sub	#162, r1
	clr	160(r1)
	mov	#1, &camel
	mov	#camel+2, &safe
	mov	#camel+190, &unsafe
	call	#camel_init
	call	#task_init
	jmp	.LBB15_1
.LBB15_1:                               ; %do.body
	mov	&camel, r12
	cmp	#1, r12
	jne	.LBB15_3
	jmp	.LBB15_2
.LBB15_2:                               ; %if.then
	mov	#camel+190, &safe
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
	mov	#186, r13
	call	#__fast_hw_crc
	mov	r12, &tmp_stack_buf_crc
	mov	&tmp_stack_buf_crc, r12
	mov	&safe, r13
	mov	r12, 186(r13)
	mov	#2, &camel
	jmp	.LBB15_4
.LBB15_3:                               ; %if.else
	mov	#camel+2, &safe
	mov	#camel+190, &unsafe
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
	mov	#186, r13
	call	#__fast_hw_crc
	mov	r12, &tmp_stack_buf_crc
	mov	&tmp_stack_buf_crc, r12
	mov	&safe, r13
	mov	r12, 186(r13)
	mov	#1, &camel
	jmp	.LBB15_4
.LBB15_4:                               ; %if.end
	jmp	.LBB15_5
.LBB15_5:                               ; %do.end
	jmp	.LBB15_6
.LBB15_6:                               ; %while.cond
                                        ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB15_31 Depth 2
	mov	&safe, r12
	mov	184(r12), r12
	cmp	#7, r12
	jlo	.LBB15_7
	br	#.LBB15_73
.LBB15_7:                               ; %while.cond
                                        ;   in Loop: Header=BB15_6 Depth=1
	jmp	.LBB15_8
.LBB15_8:                               ; %while.body
                                        ;   in Loop: Header=BB15_6 Depth=1
	call	#task_selectMode
	jmp	.LBB15_9
.LBB15_9:                               ; %do.body18
                                        ;   in Loop: Header=BB15_6 Depth=1
	mov	&camel, r12
	cmp	#1, r12
	jne	.LBB15_11
	jmp	.LBB15_10
.LBB15_10:                              ; %if.then20
                                        ;   in Loop: Header=BB15_6 Depth=1
	mov	#camel+190, &safe
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
	mov	#186, r13
	call	#__fast_hw_crc
	mov	r12, &tmp_stack_buf_crc
	mov	&tmp_stack_buf_crc, r12
	mov	&safe, r13
	mov	r12, 186(r13)
	mov	#2, &camel
	jmp	.LBB15_12
.LBB15_11:                              ; %if.else33
                                        ;   in Loop: Header=BB15_6 Depth=1
	mov	#camel+2, &safe
	mov	#camel+190, &unsafe
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
	mov	#186, r13
	call	#__fast_hw_crc
	mov	r12, &tmp_stack_buf_crc
	mov	&tmp_stack_buf_crc, r12
	mov	&safe, r13
	mov	r12, 186(r13)
	mov	#1, &camel
	jmp	.LBB15_12
.LBB15_12:                              ; %if.end46
                                        ;   in Loop: Header=BB15_6 Depth=1
	jmp	.LBB15_13
.LBB15_13:                              ; %do.end47
                                        ;   in Loop: Header=BB15_6 Depth=1
	call	#task_commit
	mov	&safe, r12
	mov	180(r12), r12
	cmp	#2, r12
	jeq	.LBB15_15
	jmp	.LBB15_14
.LBB15_14:                              ; %lor.lhs.false
                                        ;   in Loop: Header=BB15_6 Depth=1
	mov	&safe, r12
	mov	180(r12), r12
	cmp	#1, r12
	jne	.LBB15_21
	jmp	.LBB15_15
.LBB15_15:                              ; %if.then53
                                        ;   in Loop: Header=BB15_6 Depth=1
	call	#task_warmup
	jmp	.LBB15_16
.LBB15_16:                              ; %do.body54
                                        ;   in Loop: Header=BB15_6 Depth=1
	mov	&camel, r12
	cmp	#1, r12
	jne	.LBB15_18
	jmp	.LBB15_17
.LBB15_17:                              ; %if.then56
                                        ;   in Loop: Header=BB15_6 Depth=1
	mov	#camel+190, &safe
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
	mov	#186, r13
	call	#__fast_hw_crc
	mov	r12, &tmp_stack_buf_crc
	mov	&tmp_stack_buf_crc, r12
	mov	&safe, r13
	mov	r12, 186(r13)
	mov	#2, &camel
	jmp	.LBB15_19
.LBB15_18:                              ; %if.else69
                                        ;   in Loop: Header=BB15_6 Depth=1
	mov	#camel+2, &safe
	mov	#camel+190, &unsafe
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
	mov	#186, r13
	call	#__fast_hw_crc
	mov	r12, &tmp_stack_buf_crc
	mov	&tmp_stack_buf_crc, r12
	mov	&safe, r13
	mov	r12, 186(r13)
	mov	#1, &camel
	jmp	.LBB15_19
.LBB15_19:                              ; %if.end82
                                        ;   in Loop: Header=BB15_6 Depth=1
	jmp	.LBB15_20
.LBB15_20:                              ; %do.end83
                                        ;   in Loop: Header=BB15_6 Depth=1
	call	#task_commit
	jmp	.LBB15_30
.LBB15_21:                              ; %if.else84
                                        ;   in Loop: Header=BB15_6 Depth=1
	mov	&safe, r12
	mov	180(r12), r12
	tst	r12
	jne	.LBB15_28
	jmp	.LBB15_22
.LBB15_22:                              ; %if.then88
                                        ;   in Loop: Header=BB15_6 Depth=1
	call	#task_resetStats
	jmp	.LBB15_23
.LBB15_23:                              ; %do.body89
                                        ;   in Loop: Header=BB15_6 Depth=1
	mov	&camel, r12
	cmp	#1, r12
	jne	.LBB15_25
	jmp	.LBB15_24
.LBB15_24:                              ; %if.then91
                                        ;   in Loop: Header=BB15_6 Depth=1
	mov	#camel+190, &safe
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
	mov	#186, r13
	call	#__fast_hw_crc
	mov	r12, &tmp_stack_buf_crc
	mov	&tmp_stack_buf_crc, r12
	mov	&safe, r13
	mov	r12, 186(r13)
	mov	#2, &camel
	jmp	.LBB15_26
.LBB15_25:                              ; %if.else104
                                        ;   in Loop: Header=BB15_6 Depth=1
	mov	#camel+2, &safe
	mov	#camel+190, &unsafe
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
	mov	#186, r13
	call	#__fast_hw_crc
	mov	r12, &tmp_stack_buf_crc
	mov	&tmp_stack_buf_crc, r12
	mov	&safe, r13
	mov	r12, 186(r13)
	mov	#1, &camel
	jmp	.LBB15_26
.LBB15_26:                              ; %if.end117
                                        ;   in Loop: Header=BB15_6 Depth=1
	jmp	.LBB15_27
.LBB15_27:                              ; %do.end118
                                        ;   in Loop: Header=BB15_6 Depth=1
	call	#task_commit
	jmp	.LBB15_29
.LBB15_28:                              ; %if.else119
	br	#.LBB15_74
.LBB15_29:                              ; %if.end120
                                        ;   in Loop: Header=BB15_6 Depth=1
	jmp	.LBB15_30
.LBB15_30:                              ; %if.end121
                                        ;   in Loop: Header=BB15_6 Depth=1
	jmp	.LBB15_31
.LBB15_31:                              ; %while.body123
                                        ;   Parent Loop BB15_6 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	call	#task_sample
	jmp	.LBB15_32
.LBB15_32:                              ; %do.body124
                                        ;   in Loop: Header=BB15_31 Depth=2
	mov	&camel, r12
	cmp	#1, r12
	jne	.LBB15_34
	jmp	.LBB15_33
.LBB15_33:                              ; %if.then126
                                        ;   in Loop: Header=BB15_31 Depth=2
	mov	#camel+190, &safe
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
	mov	#186, r13
	call	#__fast_hw_crc
	mov	r12, &tmp_stack_buf_crc
	mov	&tmp_stack_buf_crc, r12
	mov	&safe, r13
	mov	r12, 186(r13)
	mov	#2, &camel
	jmp	.LBB15_35
.LBB15_34:                              ; %if.else139
                                        ;   in Loop: Header=BB15_31 Depth=2
	mov	#camel+2, &safe
	mov	#camel+190, &unsafe
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
	mov	#186, r13
	call	#__fast_hw_crc
	mov	r12, &tmp_stack_buf_crc
	mov	&tmp_stack_buf_crc, r12
	mov	&safe, r13
	mov	r12, 186(r13)
	mov	#1, &camel
	jmp	.LBB15_35
.LBB15_35:                              ; %if.end152
                                        ;   in Loop: Header=BB15_31 Depth=2
	jmp	.LBB15_36
.LBB15_36:                              ; %do.end153
                                        ;   in Loop: Header=BB15_31 Depth=2
	call	#task_commit
	call	#task_transform
	jmp	.LBB15_37
.LBB15_37:                              ; %do.body154
                                        ;   in Loop: Header=BB15_31 Depth=2
	mov	&camel, r12
	cmp	#1, r12
	jne	.LBB15_39
	jmp	.LBB15_38
.LBB15_38:                              ; %if.then156
                                        ;   in Loop: Header=BB15_31 Depth=2
	mov	#camel+190, &safe
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
	mov	#186, r13
	call	#__fast_hw_crc
	mov	r12, &tmp_stack_buf_crc
	mov	&tmp_stack_buf_crc, r12
	mov	&safe, r13
	mov	r12, 186(r13)
	mov	#2, &camel
	jmp	.LBB15_40
.LBB15_39:                              ; %if.else169
                                        ;   in Loop: Header=BB15_31 Depth=2
	mov	#camel+2, &safe
	mov	#camel+190, &unsafe
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
	mov	#186, r13
	call	#__fast_hw_crc
	mov	r12, &tmp_stack_buf_crc
	mov	&tmp_stack_buf_crc, r12
	mov	&safe, r13
	mov	r12, 186(r13)
	mov	#1, &camel
	jmp	.LBB15_40
.LBB15_40:                              ; %if.end182
                                        ;   in Loop: Header=BB15_31 Depth=2
	jmp	.LBB15_41
.LBB15_41:                              ; %do.end183
                                        ;   in Loop: Header=BB15_31 Depth=2
	call	#task_commit
	call	#task_featurize
	jmp	.LBB15_42
.LBB15_42:                              ; %do.body184
                                        ;   in Loop: Header=BB15_31 Depth=2
	mov	&camel, r12
	cmp	#1, r12
	jne	.LBB15_44
	jmp	.LBB15_43
.LBB15_43:                              ; %if.then186
                                        ;   in Loop: Header=BB15_31 Depth=2
	mov	#camel+190, &safe
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
	mov	#186, r13
	call	#__fast_hw_crc
	mov	r12, &tmp_stack_buf_crc
	mov	&tmp_stack_buf_crc, r12
	mov	&safe, r13
	mov	r12, 186(r13)
	mov	#2, &camel
	jmp	.LBB15_45
.LBB15_44:                              ; %if.else199
                                        ;   in Loop: Header=BB15_31 Depth=2
	mov	#camel+2, &safe
	mov	#camel+190, &unsafe
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
	mov	#186, r13
	call	#__fast_hw_crc
	mov	r12, &tmp_stack_buf_crc
	mov	&tmp_stack_buf_crc, r12
	mov	&safe, r13
	mov	r12, 186(r13)
	mov	#1, &camel
	jmp	.LBB15_45
.LBB15_45:                              ; %if.end212
                                        ;   in Loop: Header=BB15_31 Depth=2
	jmp	.LBB15_46
.LBB15_46:                              ; %do.end213
                                        ;   in Loop: Header=BB15_31 Depth=2
	call	#task_commit
	mov	&safe, r12
	mov	180(r12), r12
	cmp	#2, r12
	jeq	.LBB15_48
	jmp	.LBB15_47
.LBB15_47:                              ; %lor.lhs.false217
                                        ;   in Loop: Header=BB15_31 Depth=2
	mov	&safe, r12
	mov	180(r12), r12
	cmp	#1, r12
	jne	.LBB15_56
	jmp	.LBB15_48
.LBB15_48:                              ; %if.then221
                                        ;   in Loop: Header=BB15_31 Depth=2
	call	#task_train
	jmp	.LBB15_49
.LBB15_49:                              ; %do.body222
                                        ;   in Loop: Header=BB15_31 Depth=2
	mov	&camel, r12
	cmp	#1, r12
	jne	.LBB15_51
	jmp	.LBB15_50
.LBB15_50:                              ; %if.then224
                                        ;   in Loop: Header=BB15_31 Depth=2
	mov	#camel+190, &safe
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
	mov	#186, r13
	call	#__fast_hw_crc
	mov	r12, &tmp_stack_buf_crc
	mov	&tmp_stack_buf_crc, r12
	mov	&safe, r13
	mov	r12, 186(r13)
	mov	#2, &camel
	jmp	.LBB15_52
.LBB15_51:                              ; %if.else237
                                        ;   in Loop: Header=BB15_31 Depth=2
	mov	#camel+2, &safe
	mov	#camel+190, &unsafe
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
	mov	#186, r13
	call	#__fast_hw_crc
	mov	r12, &tmp_stack_buf_crc
	mov	&tmp_stack_buf_crc, r12
	mov	&safe, r13
	mov	r12, 186(r13)
	mov	#1, &camel
	jmp	.LBB15_52
.LBB15_52:                              ; %if.end250
                                        ;   in Loop: Header=BB15_31 Depth=2
	jmp	.LBB15_53
.LBB15_53:                              ; %do.end251
                                        ;   in Loop: Header=BB15_31 Depth=2
	call	#task_done
	mov	&unsafe, r12
	mov	176(r12), r12
	cmp	#16, r12
	jlo	.LBB15_55
	jmp	.LBB15_54
.LBB15_54:                              ; %if.then254
                                        ;   in Loop: Header=BB15_6 Depth=1
	jmp	.LBB15_72
.LBB15_55:                              ; %if.end255
                                        ;   in Loop: Header=BB15_31 Depth=2
	jmp	.LBB15_71
.LBB15_56:                              ; %if.else256
                                        ;   in Loop: Header=BB15_31 Depth=2
	mov	&safe, r12
	mov	180(r12), r12
	tst	r12
	jne	.LBB15_70
	jmp	.LBB15_57
.LBB15_57:                              ; %if.then260
                                        ;   in Loop: Header=BB15_31 Depth=2
	call	#task_classify
	jmp	.LBB15_58
.LBB15_58:                              ; %do.body261
                                        ;   in Loop: Header=BB15_31 Depth=2
	mov	&camel, r12
	cmp	#1, r12
	jne	.LBB15_60
	jmp	.LBB15_59
.LBB15_59:                              ; %if.then263
                                        ;   in Loop: Header=BB15_31 Depth=2
	mov	#camel+190, &safe
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
	mov	#186, r13
	call	#__fast_hw_crc
	mov	r12, &tmp_stack_buf_crc
	mov	&tmp_stack_buf_crc, r12
	mov	&safe, r13
	mov	r12, 186(r13)
	mov	#2, &camel
	jmp	.LBB15_61
.LBB15_60:                              ; %if.else276
                                        ;   in Loop: Header=BB15_31 Depth=2
	mov	#camel+2, &safe
	mov	#camel+190, &unsafe
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
	mov	#186, r13
	call	#__fast_hw_crc
	mov	r12, &tmp_stack_buf_crc
	mov	&tmp_stack_buf_crc, r12
	mov	&safe, r13
	mov	r12, 186(r13)
	mov	#1, &camel
	jmp	.LBB15_61
.LBB15_61:                              ; %if.end289
                                        ;   in Loop: Header=BB15_31 Depth=2
	jmp	.LBB15_62
.LBB15_62:                              ; %do.end290
                                        ;   in Loop: Header=BB15_31 Depth=2
	call	#task_commit
	call	#task_stats
	jmp	.LBB15_63
.LBB15_63:                              ; %do.body291
                                        ;   in Loop: Header=BB15_31 Depth=2
	mov	&camel, r12
	cmp	#1, r12
	jne	.LBB15_65
	jmp	.LBB15_64
.LBB15_64:                              ; %if.then293
                                        ;   in Loop: Header=BB15_31 Depth=2
	mov	#camel+190, &safe
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
	mov	#186, r13
	call	#__fast_hw_crc
	mov	r12, &tmp_stack_buf_crc
	mov	&tmp_stack_buf_crc, r12
	mov	&safe, r13
	mov	r12, 186(r13)
	mov	#2, &camel
	jmp	.LBB15_66
.LBB15_65:                              ; %if.else306
                                        ;   in Loop: Header=BB15_31 Depth=2
	mov	#camel+2, &safe
	mov	#camel+190, &unsafe
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
	mov	#186, r13
	call	#__fast_hw_crc
	mov	r12, &tmp_stack_buf_crc
	mov	&tmp_stack_buf_crc, r12
	mov	&safe, r13
	mov	r12, 186(r13)
	mov	#1, &camel
	jmp	.LBB15_66
.LBB15_66:                              ; %if.end319
                                        ;   in Loop: Header=BB15_31 Depth=2
	jmp	.LBB15_67
.LBB15_67:                              ; %do.end320
                                        ;   in Loop: Header=BB15_31 Depth=2
	call	#task_commit
	mov	&unsafe, r12
	mov	28(r12), r12
	cmp	#128, r12
	jne	.LBB15_69
	jmp	.LBB15_68
.LBB15_68:                              ; %if.then323
                                        ;   in Loop: Header=BB15_6 Depth=1
	jmp	.LBB15_72
.LBB15_69:                              ; %if.end324
                                        ;   in Loop: Header=BB15_31 Depth=2
	jmp	.LBB15_70
.LBB15_70:                              ; %if.end325
                                        ;   in Loop: Header=BB15_31 Depth=2
	jmp	.LBB15_71
.LBB15_71:                              ; %if.end326
                                        ;   in Loop: Header=BB15_31 Depth=2
	br	#.LBB15_31
.LBB15_72:                              ; %while.end
                                        ;   in Loop: Header=BB15_6 Depth=1
	br	#.LBB15_6
.LBB15_73:                              ; %while.end327.loopexit
	jmp	.LBB15_74
.LBB15_74:                              ; %while.end327
	call	#task_done
	mov	160(r1), r12
	add	#162, r1
	ret
.Lfunc_end15:
	.size	main, .Lfunc_end15-main
                                        ; -- End function
	.type	camel,@object           ; @camel
	.comm	camel,378,2
	.type	safe,@object            ; @safe
	.comm	safe,2,2
	.type	unsafe,@object          ; @unsafe
	.comm	unsafe,2,2
	.type	tmp_stack_crc,@object   ; @tmp_stack_crc
	.comm	tmp_stack_crc,2,2
	.type	tmp_stack_buf_crc,@object ; @tmp_stack_buf_crc
	.comm	tmp_stack_buf_crc,2,2
	.type	buf,@object             ; @buf
	.comm	buf,22,2

	.ident	"clang version 10.0.0 (https://github.com/llvm/llvm-project.git f79f68975d51b389d9f141aa30ab47723a75a868)"
	.section	".note.GNU-stack","",@progbits
