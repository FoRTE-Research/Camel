	.text
	.file	"camel_ar.c"
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
	mov	#camel+190, &unsafe
	mov	#camel+2, &safe
	jmp	.LBB1_5
.LBB1_3:                                ; %if.then2
	mov	#camel+190, r12
	mov	#camel+2, &unsafe
	mov	#camel+190, &safe
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
	mov	#186, r13
	call	#__fast_hw_crc
	mov	r12, &tmp_stack_buf_crc
	mov	&safe, r13
	cmp	186(r13), r12
	jne	.LBB1_7
; %bb.6:                                ; %if.then10
	mov	&unsafe, r12
	mov	#188, r14
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
	mov	#camel+190, &safe
	mov	#camel+190, r12
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
	mov	#camel+190, &unsafe
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
	mov	#186, r13
	call	#__fast_hw_crc
	mov	r12, &tmp_stack_buf_crc
	mov	&safe, r13
	mov	r12, 186(r13)
	mov	r10, &camel
	pop	r10
	ret
.Lfunc_end2:
	.size	commit, .Lfunc_end2-commit
                                        ; -- End function
	.globl	ACCEL_singleSample_     ; -- Begin function ACCEL_singleSample_
	.p2align	1
	.type	ACCEL_singleSample_,@function
ACCEL_singleSample_:                    ; @ACCEL_singleSample_
.Lfunc_begin3:
; %bb.0:                                ; %entry
	;DEBUG_VALUE: ACCEL_singleSample_:result <- $r12
	;DEBUG_VALUE: ACCEL_singleSample_:seed <- $r13
	push	r10
	push	r9
	mov	r13, r10
	;DEBUG_VALUE: ACCEL_singleSample_:seed <- $r10
	mov	r12, r9
	;DEBUG_VALUE: ACCEL_singleSample_:result <- $r9
	mov	r10, r12
	mov	#4913, r13
	call	#__mspabi_mpyi
	mov	#85, r13
	call	#__mspabi_remu
	mov.b	r12, 2(r9)
	mov	r10, r12
	mov	#289, r13
	call	#__mspabi_mpyi
	mov	#85, r13
	call	#__mspabi_remu
	mov.b	r12, 1(r9)
	mov	r10, r12
	mov	#17, r13
	call	#__mspabi_mpyi
	mov	#85, r13
	call	#__mspabi_remu
	mov.b	r12, 0(r9)
	inc	r10
	;DEBUG_VALUE: ACCEL_singleSample_:seed <- $r10
	mov	r10, r12
	pop	r9
	pop	r10
	ret
.Lfunc_end3:
	.size	ACCEL_singleSample_, .Lfunc_end3-ACCEL_singleSample_
                                        ; -- End function
	.globl	task_init               ; -- Begin function task_init
	.p2align	1
	.type	task_init,@function
task_init:                              ; @task_init
.Lfunc_begin4:
; %bb.0:                                ; %entry
	mov	&unsafe, r12
	mov	#3, 22(r12)
	mov	&unsafe, r12
	clr	184(r12)
	mov	&unsafe, r12
	mov	#1, 182(r12)
	ret
.Lfunc_end4:
	.size	task_init, .Lfunc_end4-task_init
                                        ; -- End function
	.globl	task_selectMode         ; -- Begin function task_selectMode
	.p2align	1
	.type	task_selectMode,@function
task_selectMode:                        ; @task_selectMode
.Lfunc_begin5:
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
	jlo	.LBB5_2
	jmp	.LBB5_1
.LBB5_1:                                ; %if.then
	mov	#2, 4(r1)
	jmp	.LBB5_2
.LBB5_2:                                ; %if.end
	mov	&unsafe, r12
	mov	184(r12), r12
	cmp	#5, r12
	jlo	.LBB5_4
	jmp	.LBB5_3
.LBB5_3:                                ; %if.then6
	clr	4(r1)
	jmp	.LBB5_4
.LBB5_4:                                ; %if.end7
	mov	&unsafe, r12
	mov	184(r12), r12
	cmp	#7, r12
	jlo	.LBB5_6
	jmp	.LBB5_5
.LBB5_5:                                ; %if.then11
	call	#task_done
.LBB5_6:                                ; %if.end12
	mov	4(r1), r12
	cmp	#2, r12
	jeq	.LBB5_8
	jmp	.LBB5_7
.LBB5_7:                                ; %lor.lhs.false
	mov	4(r1), r12
	cmp	#1, r12
	jne	.LBB5_10
	jmp	.LBB5_8
.LBB5_8:                                ; %land.lhs.true
	mov	4(r1), r12
	mov	&unsafe, r13
	mov	22(r13), r13
	cmp	r13, r12
	jne	.LBB5_10
	jmp	.LBB5_9
.LBB5_9:                                ; %if.then17
	mov	#3, 4(r1)
	jmp	.LBB5_11
.LBB5_10:                               ; %if.else
	mov	4(r1), r12
	mov	&unsafe, r13
	mov	r12, 22(r13)
	jmp	.LBB5_11
.LBB5_11:                               ; %if.end20
	mov	4(r1), r12
	tst	r12
	jeq	.LBB5_16
	jmp	.LBB5_12
.LBB5_12:                               ; %if.end20
	cmp	#1, r12
	jeq	.LBB5_15
	jmp	.LBB5_13
.LBB5_13:                               ; %if.end20
	cmp	#2, r12
	jne	.LBB5_17
	jmp	.LBB5_14
.LBB5_14:                               ; %sw.bb
	mov	&unsafe, r12
	clr	24(r12)
	mov	&unsafe, r12
	mov	#2, 180(r12)
	mov	&unsafe, r12
	clr	26(r12)
	mov	&unsafe, r12
	clr	178(r12)
	jmp	.LBB5_18
.LBB5_15:                               ; %sw.bb27
	mov	&unsafe, r12
	clr	24(r12)
	mov	&unsafe, r12
	mov	#1, 180(r12)
	mov	&unsafe, r12
	mov	#1, 26(r12)
	mov	&unsafe, r12
	clr	178(r12)
	jmp	.LBB5_18
.LBB5_16:                               ; %sw.bb36
	mov	&unsafe, r12
	clr	180(r12)
	jmp	.LBB5_18
.LBB5_17:                               ; %sw.default
	mov	&unsafe, r12
	mov	#3, 180(r12)
	jmp	.LBB5_18
.LBB5_18:                               ; %sw.epilog
	add	#6, r1
	ret
.Lfunc_end5:
	.size	task_selectMode, .Lfunc_end5-task_selectMode
                                        ; -- End function
	.globl	task_resetStats         ; -- Begin function task_resetStats
	.p2align	1
	.type	task_resetStats,@function
task_resetStats:                        ; @task_resetStats
.Lfunc_begin6:
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
.Lfunc_end6:
	.size	task_resetStats, .Lfunc_end6-task_resetStats
                                        ; -- End function
	.globl	task_sample             ; -- Begin function task_sample
	.p2align	1
	.type	task_sample,@function
task_sample:                            ; @task_sample
.Lfunc_begin7:
; %bb.0:                                ; %entry
	push	r10
	sub	#4, r1
	mov	&unsafe, r12
	mov	182(r12), r13
	mov	r1, r12
	add	#1, r12
	call	#ACCEL_singleSample_
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
	add	#4, r1
	pop	r10
	ret
.Lfunc_end7:
	.size	task_sample, .Lfunc_end7-task_sample
                                        ; -- End function
	.globl	task_transform          ; -- Begin function task_transform
	.p2align	1
	.type	task_transform,@function
task_transform:                         ; @task_transform
.Lfunc_begin8:
; %bb.0:                                ; %entry
	push	r10
	push	r9
	sub	#8, r1
	mov	&unsafe, r12
	clr	178(r12)
	clr	0(r1)
	jmp	.LBB8_1
.LBB8_1:                                ; %for.cond
                                        ; =>This Inner Loop Header: Depth=1
	mov	0(r1), r12
	cmp	#3, r12
	jlo	.LBB8_3
	jmp	.LBB8_2
.LBB8_2:                                ; %for.cond.cleanup
	jmp	.LBB8_18
.LBB8_3:                                ; %for.body
                                        ;   in Loop: Header=BB8_1 Depth=1
	mov	&unsafe, r10
	mov	0(r1), r12
	mov	#3, r13
	call	#__mspabi_mpyi
	add	r12, r10
	mov.b	34(r10), r12
	sxt	r12
	cmp	#10, r12
	jl	.LBB8_6
	jmp	.LBB8_4
.LBB8_4:                                ; %lor.lhs.false
                                        ;   in Loop: Header=BB8_1 Depth=1
	mov	&unsafe, r10
	mov	0(r1), r12
	mov	#3, r13
	call	#__mspabi_mpyi
	add	r12, r10
	mov.b	35(r10), r12
	sxt	r12
	cmp	#10, r12
	jl	.LBB8_6
	jmp	.LBB8_5
.LBB8_5:                                ; %lor.lhs.false10
                                        ;   in Loop: Header=BB8_1 Depth=1
	mov	&unsafe, r10
	mov	0(r1), r12
	mov	#3, r13
	call	#__mspabi_mpyi
	add	r12, r10
	mov.b	36(r10), r12
	sxt	r12
	cmp	#10, r12
	jge	.LBB8_16
	jmp	.LBB8_6
.LBB8_6:                                ; %if.then
                                        ;   in Loop: Header=BB8_1 Depth=1
	mov	&unsafe, r10
	mov	0(r1), r12
	mov	#3, r13
	call	#__mspabi_mpyi
	add	r12, r10
	mov.b	34(r10), r12
	sxt	r12
	cmp	#11, r12
	jl	.LBB8_8
	jmp	.LBB8_7
.LBB8_7:                                ; %cond.true
                                        ;   in Loop: Header=BB8_1 Depth=1
	mov	&unsafe, r10
	mov	0(r1), r12
	mov	#3, r13
	call	#__mspabi_mpyi
	add	r12, r10
	mov.b	34(r10), r10
	sxt	r10
	jmp	.LBB8_9
.LBB8_8:                                ; %cond.false
                                        ;   in Loop: Header=BB8_1 Depth=1
	clr	r10
	jmp	.LBB8_9
.LBB8_9:                                ; %cond.end
                                        ;   in Loop: Header=BB8_1 Depth=1
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
	jl	.LBB8_11
	jmp	.LBB8_10
.LBB8_10:                               ; %cond.true41
                                        ;   in Loop: Header=BB8_1 Depth=1
	mov	&unsafe, r10
	mov	0(r1), r12
	mov	#3, r13
	call	#__mspabi_mpyi
	add	r12, r10
	mov.b	35(r10), r10
	sxt	r10
	jmp	.LBB8_12
.LBB8_11:                               ; %cond.false47
                                        ;   in Loop: Header=BB8_1 Depth=1
	clr	r10
	jmp	.LBB8_12
.LBB8_12:                               ; %cond.end48
                                        ;   in Loop: Header=BB8_1 Depth=1
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
	jl	.LBB8_14
	jmp	.LBB8_13
.LBB8_13:                               ; %cond.true62
                                        ;   in Loop: Header=BB8_1 Depth=1
	mov	&unsafe, r10
	mov	0(r1), r12
	mov	#3, r13
	call	#__mspabi_mpyi
	add	r12, r10
	mov.b	36(r10), r10
	sxt	r10
	jmp	.LBB8_15
.LBB8_14:                               ; %cond.false68
                                        ;   in Loop: Header=BB8_1 Depth=1
	clr	r10
	jmp	.LBB8_15
.LBB8_15:                               ; %cond.end69
                                        ;   in Loop: Header=BB8_1 Depth=1
	mov	&unsafe, r9
	mov	0(r1), r12
	mov	#3, r13
	call	#__mspabi_mpyi
	add	r12, r9
	mov.b	r10, 36(r9)
	jmp	.LBB8_16
.LBB8_16:                               ; %if.end
                                        ;   in Loop: Header=BB8_1 Depth=1
	jmp	.LBB8_17
.LBB8_17:                               ; %for.inc
                                        ;   in Loop: Header=BB8_1 Depth=1
	mov	0(r1), r12
	inc	r12
	mov	r12, 0(r1)
	jmp	.LBB8_1
.LBB8_18:                               ; %for.end
	add	#8, r1
	pop	r9
	pop	r10
	ret
.Lfunc_end8:
	.size	task_transform, .Lfunc_end8-task_transform
                                        ; -- End function
	.globl	task_featurize          ; -- Begin function task_featurize
	.p2align	1
	.type	task_featurize,@function
task_featurize:                         ; @task_featurize
.Lfunc_begin9:
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
	jmp	.LBB9_1
.LBB9_1:                                ; %for.cond
                                        ; =>This Inner Loop Header: Depth=1
	mov	4(r1), r12
	cmp	#3, r12
	jge	.LBB9_4
	jmp	.LBB9_2
.LBB9_2:                                ; %for.body
                                        ;   in Loop: Header=BB9_1 Depth=1
	mov	&unsafe, r10
	mov	4(r1), r12
	mov	#3, r13
	call	#__mspabi_mpyi
	add	r12, r10
	mov.b	34(r10), r12
	mov.b	13(r1), r13
	add.b	r12, r13
	mov.b	r13, 13(r1)
	mov	&unsafe, r10
	mov	4(r1), r12
	mov	#3, r13
	call	#__mspabi_mpyi
	add	r12, r10
	mov.b	35(r10), r12
	mov.b	14(r1), r13
	add.b	r12, r13
	mov.b	r13, 14(r1)
	mov	&unsafe, r10
	mov	4(r1), r12
	mov	#3, r13
	call	#__mspabi_mpyi
	add	r12, r10
	mov.b	36(r10), r12
	mov.b	15(r1), r13
	add.b	r12, r13
	mov.b	r13, 15(r1)
	jmp	.LBB9_3
.LBB9_3:                                ; %for.inc
                                        ;   in Loop: Header=BB9_1 Depth=1
	mov	4(r1), r12
	inc	r12
	mov	r12, 4(r1)
	jmp	.LBB9_1
.LBB9_4:                                ; %for.end
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
	jmp	.LBB9_5
.LBB9_5:                                ; %for.cond37
                                        ; =>This Inner Loop Header: Depth=1
	mov	4(r1), r12
	cmp	#3, r12
	jge	.LBB9_17
	jmp	.LBB9_6
.LBB9_6:                                ; %for.body40
                                        ;   in Loop: Header=BB9_5 Depth=1
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
	jge	.LBB9_8
	jmp	.LBB9_7
.LBB9_7:                                ; %cond.true
                                        ;   in Loop: Header=BB9_5 Depth=1
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
	jmp	.LBB9_9
.LBB9_8:                                ; %cond.false
                                        ;   in Loop: Header=BB9_5 Depth=1
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
	jmp	.LBB9_9
.LBB9_9:                                ; %cond.end
                                        ;   in Loop: Header=BB9_5 Depth=1
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
	jge	.LBB9_11
	jmp	.LBB9_10
.LBB9_10:                               ; %cond.true78
                                        ;   in Loop: Header=BB9_5 Depth=1
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
	jmp	.LBB9_12
.LBB9_11:                               ; %cond.false87
                                        ;   in Loop: Header=BB9_5 Depth=1
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
	jmp	.LBB9_12
.LBB9_12:                               ; %cond.end96
                                        ;   in Loop: Header=BB9_5 Depth=1
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
	jge	.LBB9_14
	jmp	.LBB9_13
.LBB9_13:                               ; %cond.true111
                                        ;   in Loop: Header=BB9_5 Depth=1
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
	jmp	.LBB9_15
.LBB9_14:                               ; %cond.false120
                                        ;   in Loop: Header=BB9_5 Depth=1
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
	jmp	.LBB9_15
.LBB9_15:                               ; %cond.end129
                                        ;   in Loop: Header=BB9_5 Depth=1
	mov.b	12(r1), r12
	add	r10, r12
	mov.b	r12, 12(r1)
	jmp	.LBB9_16
.LBB9_16:                               ; %for.inc135
                                        ;   in Loop: Header=BB9_5 Depth=1
	mov	4(r1), r12
	inc	r12
	mov	r12, 4(r1)
	jmp	.LBB9_5
.LBB9_17:                               ; %for.end137
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
	clr	r13
	call	#__mspabi_fltuld
	call	#sqrt
	call	#__mspabi_fixdul
	mov	r12, 6(r1)
	mov	0(r1), r12
	clr	r13
	call	#__mspabi_fltuld
	call	#sqrt
	call	#__mspabi_fixdul
	mov	r12, 8(r1)
	mov	&unsafe, r12
	mov	180(r12), r12
	tst	r12
	jeq	.LBB9_20
	jmp	.LBB9_18
.LBB9_18:                               ; %for.end137
	add	#-1, r12
	cmp	#2, r12
	jhs	.LBB9_21
	jmp	.LBB9_19
.LBB9_19:                               ; %sw.bb
	mov	&unsafe, r12
	mov	8(r1), r13
	mov	r13, 46(r12)
	mov	6(r1), r13
	mov	r13, 44(r12)
	jmp	.LBB9_22
.LBB9_20:                               ; %sw.bb193
	mov	&unsafe, r12
	mov	8(r1), r13
	mov	r13, 46(r12)
	mov	6(r1), r13
	mov	r13, 44(r12)
	jmp	.LBB9_22
.LBB9_21:                               ; %sw.default
	jmp	.LBB9_22
.LBB9_22:                               ; %sw.epilog
	add	#16, r1
	pop	r9
	pop	r10
	ret
.Lfunc_end9:
	.size	task_featurize, .Lfunc_end9-task_featurize
                                        ; -- End function
	.globl	task_classify           ; -- Begin function task_classify
	.p2align	1
	.type	task_classify,@function
task_classify:                          ; @task_classify
.Lfunc_begin10:
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
	jmp	.LBB10_1
.LBB10_1:                               ; %for.cond
                                        ; =>This Inner Loop Header: Depth=1
	mov	26(r1), r12
	cmp	#16, r12
	jge	.LBB10_46
	jmp	.LBB10_2
.LBB10_2:                               ; %for.body
                                        ;   in Loop: Header=BB10_1 Depth=1
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
	jge	.LBB10_4
; %bb.3:                                ; %for.body
                                        ;   in Loop: Header=BB10_1 Depth=1
	clr	r12
.LBB10_4:                               ; %for.body
                                        ;   in Loop: Header=BB10_1 Depth=1
	cmp	r14, r15
	mov	r2, r14
	and	#1, r14
	tst	r13
	jeq	.LBB10_6
; %bb.5:                                ; %for.body
                                        ;   in Loop: Header=BB10_1 Depth=1
	mov	r12, r14
.LBB10_6:                               ; %for.body
                                        ;   in Loop: Header=BB10_1 Depth=1
	bit	#1, r14
	jne	.LBB10_8
	jmp	.LBB10_7
.LBB10_7:                               ; %cond.true
                                        ;   in Loop: Header=BB10_1 Depth=1
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
	jmp	.LBB10_9
.LBB10_8:                               ; %cond.false
                                        ;   in Loop: Header=BB10_1 Depth=1
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
	jmp	.LBB10_9
.LBB10_9:                               ; %cond.end
                                        ;   in Loop: Header=BB10_1 Depth=1
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
	jge	.LBB10_11
; %bb.10:                               ; %cond.end
                                        ;   in Loop: Header=BB10_1 Depth=1
	clr	r12
.LBB10_11:                              ; %cond.end
                                        ;   in Loop: Header=BB10_1 Depth=1
	cmp	r14, r15
	mov	r2, r14
	and	#1, r14
	tst	r13
	jeq	.LBB10_13
; %bb.12:                               ; %cond.end
                                        ;   in Loop: Header=BB10_1 Depth=1
	mov	r12, r14
.LBB10_13:                              ; %cond.end
                                        ;   in Loop: Header=BB10_1 Depth=1
	bit	#1, r14
	jne	.LBB10_15
	jmp	.LBB10_14
.LBB10_14:                              ; %cond.true30
                                        ;   in Loop: Header=BB10_1 Depth=1
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
	jmp	.LBB10_16
.LBB10_15:                              ; %cond.false37
                                        ;   in Loop: Header=BB10_1 Depth=1
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
	jmp	.LBB10_16
.LBB10_16:                              ; %cond.end44
                                        ;   in Loop: Header=BB10_1 Depth=1
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
	jge	.LBB10_18
; %bb.17:                               ; %cond.end44
                                        ;   in Loop: Header=BB10_1 Depth=1
	clr	r12
.LBB10_18:                              ; %cond.end44
                                        ;   in Loop: Header=BB10_1 Depth=1
	cmp	r14, r15
	mov	r2, r14
	and	#1, r14
	tst	r13
	jeq	.LBB10_20
; %bb.19:                               ; %cond.end44
                                        ;   in Loop: Header=BB10_1 Depth=1
	mov	r12, r14
.LBB10_20:                              ; %cond.end44
                                        ;   in Loop: Header=BB10_1 Depth=1
	bit	#1, r14
	jne	.LBB10_22
	jmp	.LBB10_21
.LBB10_21:                              ; %cond.true52
                                        ;   in Loop: Header=BB10_1 Depth=1
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
	jmp	.LBB10_23
.LBB10_22:                              ; %cond.false59
                                        ;   in Loop: Header=BB10_1 Depth=1
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
	jmp	.LBB10_23
.LBB10_23:                              ; %cond.end66
                                        ;   in Loop: Header=BB10_1 Depth=1
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
	jge	.LBB10_25
; %bb.24:                               ; %cond.end66
                                        ;   in Loop: Header=BB10_1 Depth=1
	clr	r12
.LBB10_25:                              ; %cond.end66
                                        ;   in Loop: Header=BB10_1 Depth=1
	cmp	r14, r15
	mov	r2, r14
	and	#1, r14
	tst	r13
	jeq	.LBB10_27
; %bb.26:                               ; %cond.end66
                                        ;   in Loop: Header=BB10_1 Depth=1
	mov	r12, r14
.LBB10_27:                              ; %cond.end66
                                        ;   in Loop: Header=BB10_1 Depth=1
	bit	#1, r14
	jne	.LBB10_29
	jmp	.LBB10_28
.LBB10_28:                              ; %cond.true75
                                        ;   in Loop: Header=BB10_1 Depth=1
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
	jmp	.LBB10_30
.LBB10_29:                              ; %cond.false82
                                        ;   in Loop: Header=BB10_1 Depth=1
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
	jmp	.LBB10_30
.LBB10_30:                              ; %cond.end89
                                        ;   in Loop: Header=BB10_1 Depth=1
	mov	r13, 0(r1)
	mov	r12, 2(r1)
	mov	4(r1), r15
	mov	6(r1), r12
	mov	12(r1), r11
	mov	14(r1), r14
	mov	#1, r13
	cmp	r14, r12
	jge	.LBB10_32
; %bb.31:                               ; %cond.end89
                                        ;   in Loop: Header=BB10_1 Depth=1
	clr	r13
.LBB10_32:                              ; %cond.end89
                                        ;   in Loop: Header=BB10_1 Depth=1
	cmp	r11, r15
	mov	r2, r15
	and	#1, r15
	cmp	r14, r12
	jeq	.LBB10_34
; %bb.33:                               ; %cond.end89
                                        ;   in Loop: Header=BB10_1 Depth=1
	mov	r13, r15
.LBB10_34:                              ; %cond.end89
                                        ;   in Loop: Header=BB10_1 Depth=1
	bit	#1, r15
	jne	.LBB10_36
	jmp	.LBB10_35
.LBB10_35:                              ; %if.then
                                        ;   in Loop: Header=BB10_1 Depth=1
	mov	30(r1), r12
	inc	r12
	mov	r12, 30(r1)
	jmp	.LBB10_37
.LBB10_36:                              ; %if.else
                                        ;   in Loop: Header=BB10_1 Depth=1
	mov	28(r1), r12
	inc	r12
	mov	r12, 28(r1)
	jmp	.LBB10_37
.LBB10_37:                              ; %if.end
                                        ;   in Loop: Header=BB10_1 Depth=1
	mov	0(r1), r15
	mov	2(r1), r12
	mov	8(r1), r11
	mov	10(r1), r14
	mov	#1, r13
	cmp	r14, r12
	jge	.LBB10_39
; %bb.38:                               ; %if.end
                                        ;   in Loop: Header=BB10_1 Depth=1
	clr	r13
.LBB10_39:                              ; %if.end
                                        ;   in Loop: Header=BB10_1 Depth=1
	cmp	r11, r15
	mov	r2, r15
	and	#1, r15
	cmp	r14, r12
	jeq	.LBB10_41
; %bb.40:                               ; %if.end
                                        ;   in Loop: Header=BB10_1 Depth=1
	mov	r13, r15
.LBB10_41:                              ; %if.end
                                        ;   in Loop: Header=BB10_1 Depth=1
	bit	#1, r15
	jne	.LBB10_43
	jmp	.LBB10_42
.LBB10_42:                              ; %if.then96
                                        ;   in Loop: Header=BB10_1 Depth=1
	mov	30(r1), r12
	inc	r12
	mov	r12, 30(r1)
	jmp	.LBB10_44
.LBB10_43:                              ; %if.else98
                                        ;   in Loop: Header=BB10_1 Depth=1
	mov	28(r1), r12
	inc	r12
	mov	r12, 28(r1)
	jmp	.LBB10_44
.LBB10_44:                              ; %if.end100
                                        ;   in Loop: Header=BB10_1 Depth=1
	jmp	.LBB10_45
.LBB10_45:                              ; %for.inc
                                        ;   in Loop: Header=BB10_1 Depth=1
	mov	26(r1), r12
	inc	r12
	mov	r12, 26(r1)
	jmp	.LBB10_1
.LBB10_46:                              ; %for.end
	mov	30(r1), r13
	mov	28(r1), r14
	mov	#1, r12
	cmp	r13, r14
	jl	.LBB10_48
; %bb.47:                               ; %for.end
	clr	r12
.LBB10_48:                              ; %for.end
	mov	&unsafe, r13
	mov	r12, 26(r13)
	add	#32, r1
	ret
.Lfunc_end10:
	.size	task_classify, .Lfunc_end10-task_classify
                                        ; -- End function
	.globl	task_stats              ; -- Begin function task_stats
	.p2align	1
	.type	task_stats,@function
task_stats:                             ; @task_stats
.Lfunc_begin11:
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
	jeq	.LBB11_3
	jmp	.LBB11_1
.LBB11_1:                               ; %entry
	cmp	#1, r12
	jne	.LBB11_4
	jmp	.LBB11_2
.LBB11_2:                               ; %sw.bb
	mov	&unsafe, r12
	mov	30(r12), r13
	inc	r13
	mov	r13, 30(r12)
	jmp	.LBB11_4
.LBB11_3:                               ; %sw.bb5
	mov	&unsafe, r12
	mov	32(r12), r13
	inc	r13
	mov	r13, 32(r12)
	jmp	.LBB11_4
.LBB11_4:                               ; %sw.epilog
	mov	&unsafe, r12
	mov	28(r12), r12
	cmp	#128, r12
	jne	.LBB11_6
	jmp	.LBB11_5
.LBB11_5:                               ; %if.then
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
	jmp	.LBB11_6
.LBB11_6:                               ; %if.end
	add	#10, r1
	pop	r10
	ret
.Lfunc_end11:
	.size	task_stats, .Lfunc_end11-task_stats
                                        ; -- End function
	.globl	task_warmup             ; -- Begin function task_warmup
	.p2align	1
	.type	task_warmup,@function
task_warmup:                            ; @task_warmup
.Lfunc_begin12:
; %bb.0:                                ; %entry
	sub	#4, r1
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
	mov	&unsafe, r12
	mov	24(r12), r12
	cmp	#3, r12
	jne	.LBB12_2
	jmp	.LBB12_1
.LBB12_1:                               ; %if.then
	mov	&unsafe, r12
	clr	176(r12)
	jmp	.LBB12_2
.LBB12_2:                               ; %if.end
	add	#4, r1
	ret
.Lfunc_end12:
	.size	task_warmup, .Lfunc_end12-task_warmup
                                        ; -- End function
	.globl	task_train              ; -- Begin function task_train
	.p2align	1
	.type	task_train,@function
task_train:                             ; @task_train
.Lfunc_begin13:
; %bb.0:                                ; %entry
	sub	#4, r1
	mov	&unsafe, r12
	mov	26(r12), r12
	tst	r12
	jeq	.LBB13_2
	jmp	.LBB13_1
.LBB13_1:                               ; %entry
	cmp	#1, r12
	jeq	.LBB13_3
	jmp	.LBB13_4
.LBB13_2:                               ; %sw.bb
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
	jmp	.LBB13_4
.LBB13_3:                               ; %sw.bb6
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
	jmp	.LBB13_4
.LBB13_4:                               ; %sw.epilog
	mov	&unsafe, r12
	mov	176(r12), r13
	inc	r13
	mov	r13, 176(r12)
	add	#4, r1
	ret
.Lfunc_end13:
	.size	task_train, .Lfunc_end13-task_train
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
	push	r10
	mov	#23168, &WDTCTL
	bis.b	#1, &PADIR_L
	and.b	#-2, &PAOUT_L
	and	#-2, &PM5CTL0
	mov.b	#-91, &CSCTL0_H
	mov	#64, &CSCTL1
	mov	#307, &CSCTL2
	mov	#camel+2, &safe
	mov	#1, &camel
	mov	#camel+190, &unsafe
	clr	&CSCTL3
	clr.b	&CSCTL0_H
	mov	#-23296, &FRCTL0
	call	#task_init
	call	#commit
	mov	#22, r12
	mov	#22, r13
	add	&safe, r13
	add	&unsafe, r12
	mov	#164, r14
	call	#memcpy
.LBB16_1:                               ; %while.body
                                        ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB16_3 Depth 2
                                        ;     Child Loop BB16_9 Depth 2
	call	#task_selectMode
	call	#commit
	mov	&unsafe, r13
	mov	&safe, r12
	mov	184(r12), 184(r13)
	mov	22(r12), 22(r13)
	mov	24(r12), 24(r13)
	mov	180(r12), 180(r13)
	mov	26(r12), 26(r13)
	mov	178(r12), 178(r13)
	mov	180(r12), r13
	cmp	#3, r13
	jeq	.LBB16_1
; %bb.2:                                ; %while.body
                                        ;   in Loop: Header=BB16_1 Depth=1
	mov	r13, r14
	add	#-1, r14
	cmp	#2, r14
	jhs	.LBB16_5
.LBB16_3:                               ; %while.body7
                                        ;   Parent Loop BB16_1 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	cmp	#3, 24(r12)
	jhs	.LBB16_9
; %bb.4:                                ; %while.body7
                                        ;   in Loop: Header=BB16_3 Depth=2
	call	#task_warmup
	call	#commit
	mov	&unsafe, r13
	mov	&safe, r12
	mov	182(r12), 182(r13)
	mov	24(r12), 24(r13)
	mov	176(r12), 176(r13)
	jmp	.LBB16_3
.LBB16_5:                               ; %while.body
                                        ;   in Loop: Header=BB16_1 Depth=1
	tst	r13
	jne	.LBB16_9
; %bb.6:                                ; %if.then11
                                        ;   in Loop: Header=BB16_1 Depth=1
	call	#task_resetStats
	call	#commit
	mov	&unsafe, r13
	mov	&safe, r12
	mov	30(r12), 30(r13)
	mov	32(r12), 32(r13)
	mov	28(r12), 28(r13)
	jmp	.LBB16_8
.LBB16_7:                               ; %while.body24
                                        ;   in Loop: Header=BB16_1 Depth=1
	call	#task_sample
	call	#commit
	mov	&unsafe, r10
	mov	178(r10), r12
	mov	#3, r13
	call	#__mspabi_mpyi
	add	r12, r10
	add	&safe, r12
	mov.b	36(r12), 36(r10)
	mov	34(r12), 34(r10)
	mov	&safe, r12
	mov	&unsafe, r13
.LBB16_8:                               ; %while.body24
                                        ;   in Loop: Header=BB16_1 Depth=1
	mov	178(r12), 178(r13)
.LBB16_9:                               ; %while.body24
                                        ;   Parent Loop BB16_1 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	cmp	#3, 178(r12)
	jlo	.LBB16_7
; %bb.10:                               ; %while.end25
                                        ;   in Loop: Header=BB16_9 Depth=2
	call	#task_transform
	call	#commit
	mov	&unsafe, r12
	mov	&safe, r13
	mov	178(r13), 178(r12)
	mov.b	42(r13), 42(r12)
	mov	40(r13), 40(r12)
	mov	38(r13), 38(r12)
	mov	36(r13), 36(r12)
	mov	34(r13), 34(r12)
	call	#task_featurize
	call	#commit
	mov	&safe, r12
	mov	44(r12), r13
	mov	&unsafe, r14
	mov	46(r12), 46(r14)
	mov	r13, 44(r14)
	mov	180(r12), r13
	mov	r13, r14
	add	#-1, r14
	cmp	#2, r14
	jlo	.LBB16_13
; %bb.11:                               ; %while.end25
                                        ;   in Loop: Header=BB16_9 Depth=2
	tst	r13
	jne	.LBB16_9
; %bb.12:                               ; %if.then42
                                        ;   in Loop: Header=BB16_9 Depth=2
	call	#task_classify
	call	#commit
	mov	&unsafe, r12
	mov	&safe, r13
	mov	26(r13), 26(r12)
	call	#task_stats
	call	#commit
	mov	&unsafe, r13
	mov	&safe, r12
	mov	28(r12), 28(r13)
	mov	30(r12), 30(r13)
	mov	32(r12), 32(r13)
	cmp	#128, 28(r12)
	jne	.LBB16_9
	jmp	.LBB16_1
.LBB16_13:                              ; %if.then33
                                        ;   in Loop: Header=BB16_9 Depth=2
	call	#task_train
	call	#commit
	mov	&unsafe, r12
	mov	176(r12), r13
	add	r13, r13
	add	r13, r13
	add	r13, r12
	add	&safe, r13
	mov	48(r13), r14
	mov	50(r13), 50(r12)
	mov	r14, 48(r12)
	mov	&unsafe, r12
	mov	176(r12), r13
	add	r13, r13
	add	r13, r13
	add	r13, r12
	add	&safe, r13
	mov	112(r13), r14
	mov	114(r13), 114(r12)
	mov	r14, 112(r12)
	mov	&unsafe, r13
	mov	&safe, r12
	mov	176(r12), 176(r13)
	cmp	#16, 176(r12)
	jlo	.LBB16_9
	jmp	.LBB16_1
.Lfunc_end16:
	.size	main, .Lfunc_end16-main
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
