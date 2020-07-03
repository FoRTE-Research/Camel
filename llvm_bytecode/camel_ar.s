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
	sub	#8, r1
	cmp	#1, &camel
	jne	.LBB1_2
; %bb.1:                                ; %if.then
	mov	#camel+190, &unsafe
	mov	#camel+2, &safe
	jmp	.LBB1_5
.LBB1_2:                                ; %if.else
	cmp	#2, &camel
	jne	.LBB1_4
; %bb.3:                                ; %if.then2
	mov	#camel+2, &unsafe
	mov	#camel+190, &safe
	jmp	.LBB1_5
.LBB1_4:                                ; %if.else3
	call	#__crt0_start
.LBB1_5:                                ; %if.end4
	mov	&safe, r12
	mov	18(r12), r12
	;APP
	mov	r12, r1
	;NO_APP
	;APP
	mov	r1, r12
	;NO_APP
	mov	r12, 4(r1)
	;APP
	mov	r1, r14
	;NO_APP
	mov	r14, 0(r1)
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
	mov	&safe, r13
	mov	&unsafe, r12
	mov	#188, r14
	call	#memcpy
	call	#camel_init
	mov	&safe, r12
	call	#__restore_registers
	add	#8, r1
	ret
.LBB1_7:                                ; %if.else12
	call	#__crt0_start
	add	#8, r1
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
	sub	#16, r1
	cmp	#1, &camel
	jne	.LBB2_2
; %bb.1:                                ; %if.then
	mov	#camel+2, &unsafe
	mov	#camel+190, &safe
	mov	#camel+190, r12
	call	#__dump_registers
	;APP
	mov	r1, r12
	;NO_APP
	mov	r12, 12(r1)
	;APP
	mov	r1, r14
	;NO_APP
	mov	r14, 8(r1)
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
	mov	#2, &camel
	add	#16, r1
	ret
.LBB2_2:                                ; %if.else
	mov	#camel+190, &unsafe
	mov	#camel+2, &safe
	mov	#camel+2, r12
	call	#__dump_registers
	;APP
	mov	r1, r12
	;NO_APP
	mov	r12, 4(r1)
	;APP
	mov	r1, r14
	;NO_APP
	mov	r14, 0(r1)
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
	mov	#1, &camel
	add	#16, r1
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
	push	r10
	sub	#4, r1
	mov	r12, r10
	mov	r13, 0(r1)
	mov	r10, 2(r1)
	mov	r13, r12
	mov	#17, r13
	call	#__mspabi_mpyi
	mov	#85, r13
	call	#__mspabi_remu
	mov.b	r12, 0(r10)
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
	mov	#1, r12
	add	0(r1), r12
	mov	r12, 0(r1)
	add	#4, r1
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
	inc	184(r12)
	mov	&unsafe, r12
	cmp	#3, 184(r12)
	jlo	.LBB5_2
; %bb.1:                                ; %if.then
	mov	#2, 4(r1)
.LBB5_2:                                ; %if.end
	mov	&unsafe, r12
	cmp	#5, 184(r12)
	jlo	.LBB5_4
; %bb.3:                                ; %if.then6
	clr	4(r1)
.LBB5_4:                                ; %if.end7
	mov	&unsafe, r12
	cmp	#7, 184(r12)
	jlo	.LBB5_6
; %bb.5:                                ; %if.then11
	call	#task_done
.LBB5_6:                                ; %if.end12
	cmp	#2, 4(r1)
	jeq	.LBB5_8
; %bb.7:                                ; %lor.lhs.false
	cmp	#1, 4(r1)
	jne	.LBB5_10
.LBB5_8:                                ; %land.lhs.true
	mov	&unsafe, r12
	cmp	22(r12), 4(r1)
	jne	.LBB5_10
; %bb.9:                                ; %if.then17
	mov	#3, 4(r1)
	jmp	.LBB5_11
.LBB5_10:                               ; %if.else
	mov	&unsafe, r12
	mov	4(r1), 22(r12)
.LBB5_11:                               ; %if.end20
	mov	4(r1), r12
	tst	r12
	jeq	.LBB5_15
; %bb.12:                               ; %if.end20
	cmp	#1, r12
	jeq	.LBB5_16
; %bb.13:                               ; %if.end20
	cmp	#2, r12
	jne	.LBB5_18
; %bb.14:                               ; %sw.bb
	mov	&unsafe, r12
	clr	24(r12)
	mov	&unsafe, r12
	mov	#2, 180(r12)
	mov	&unsafe, r12
	clr	26(r12)
	jmp	.LBB5_17
.LBB5_15:                               ; %sw.bb36
	mov	&unsafe, r12
	clr	180(r12)
	add	#6, r1
	ret
.LBB5_16:                               ; %sw.bb27
	mov	&unsafe, r12
	clr	24(r12)
	mov	&unsafe, r12
	mov	#1, 180(r12)
	mov	&unsafe, r12
	mov	#1, 26(r12)
.LBB5_17:                               ; %sw.epilog
	mov	&unsafe, r12
	clr	178(r12)
	add	#6, r1
	ret
.LBB5_18:                               ; %sw.default
	mov	&unsafe, r12
	mov	#3, 180(r12)
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
	add	r10, r12
	mov.b	2(r1), 35(r12)
	mov.b	3(r1), 36(r12)
	mov.b	1(r1), 34(r12)
	mov	&unsafe, r12
	inc	178(r12)
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
	cmp	#3, 0(r1)
	jlo	.LBB8_3
	jmp	.LBB8_12
.LBB8_1:                                ; %cond.end69
                                        ;   in Loop: Header=BB8_3 Depth=1
	mov	0(r1), r12
	mov	#3, r13
	call	#__mspabi_mpyi
	add	&unsafe, r12
	mov.b	r10, 36(r12)
.LBB8_2:                                ; %if.end
                                        ;   in Loop: Header=BB8_3 Depth=1
	inc	0(r1)
	cmp	#3, 0(r1)
	jhs	.LBB8_12
.LBB8_3:                                ; %for.body
                                        ; =>This Inner Loop Header: Depth=1
	mov	0(r1), r12
	mov	#3, r13
	call	#__mspabi_mpyi
	add	&unsafe, r12
	mov.b	34(r12), r12
	sxt	r12
	cmp	#10, r12
	jl	.LBB8_6
; %bb.4:                                ; %lor.lhs.false
                                        ;   in Loop: Header=BB8_3 Depth=1
	mov	0(r1), r12
	mov	#3, r13
	call	#__mspabi_mpyi
	add	&unsafe, r12
	mov.b	35(r12), r12
	sxt	r12
	cmp	#10, r12
	jl	.LBB8_6
; %bb.5:                                ; %lor.lhs.false10
                                        ;   in Loop: Header=BB8_3 Depth=1
	mov	0(r1), r12
	mov	#3, r13
	call	#__mspabi_mpyi
	add	&unsafe, r12
	mov.b	36(r12), r12
	sxt	r12
	cmp	#10, r12
	jge	.LBB8_2
.LBB8_6:                                ; %if.then
                                        ;   in Loop: Header=BB8_3 Depth=1
	mov	0(r1), r12
	mov	#3, r13
	call	#__mspabi_mpyi
	clr	r10
	add	&unsafe, r12
	mov.b	34(r12), r12
	sxt	r12
	cmp	#11, r12
	clr	r9
	jl	.LBB8_8
; %bb.7:                                ; %cond.true
                                        ;   in Loop: Header=BB8_3 Depth=1
	mov	0(r1), r12
	mov	#3, r13
	call	#__mspabi_mpyi
	add	&unsafe, r12
	mov.b	34(r12), r9
	sxt	r9
.LBB8_8:                                ; %cond.end
                                        ;   in Loop: Header=BB8_3 Depth=1
	mov	0(r1), r12
	mov	#3, r13
	call	#__mspabi_mpyi
	add	&unsafe, r12
	mov.b	r9, 34(r12)
	mov	0(r1), r12
	mov	#3, r13
	call	#__mspabi_mpyi
	add	&unsafe, r12
	mov.b	35(r12), r12
	sxt	r12
	cmp	#11, r12
	jl	.LBB8_10
; %bb.9:                                ; %cond.true41
                                        ;   in Loop: Header=BB8_3 Depth=1
	mov	0(r1), r12
	mov	#3, r13
	call	#__mspabi_mpyi
	add	&unsafe, r12
	mov.b	35(r12), r10
	sxt	r10
.LBB8_10:                               ; %cond.end48
                                        ;   in Loop: Header=BB8_3 Depth=1
	mov	0(r1), r12
	mov	#3, r13
	call	#__mspabi_mpyi
	add	&unsafe, r12
	mov.b	r10, 35(r12)
	mov	0(r1), r12
	mov	#3, r13
	call	#__mspabi_mpyi
	clr	r10
	add	&unsafe, r12
	mov.b	36(r12), r12
	sxt	r12
	cmp	#11, r12
	jl	.LBB8_1
; %bb.11:                               ; %cond.true62
                                        ;   in Loop: Header=BB8_3 Depth=1
	mov	0(r1), r12
	mov	#3, r13
	call	#__mspabi_mpyi
	add	&unsafe, r12
	mov.b	36(r12), r10
	sxt	r10
	jmp	.LBB8_1
.LBB8_12:                               ; %for.cond.cleanup
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
	push	r8
	push	r7
	sub	#16, r1
	clr.b	15(r1)
	clr.b	14(r1)
	clr.b	13(r1)
	clr.b	12(r1)
	clr.b	11(r1)
	clr.b	10(r1)
	clr	4(r1)
	cmp	#3, 4(r1)
	jge	.LBB9_2
.LBB9_1:                                ; %for.body
                                        ; =>This Inner Loop Header: Depth=1
	mov	4(r1), r10
	mov	r10, r12
	mov	#3, r13
	call	#__mspabi_mpyi
	add	&unsafe, r12
	mov.b	34(r12), r13
	mov.b	13(r1), r14
	add	r13, r14
	mov.b	r14, 13(r1)
	mov.b	14(r1), r13
	mov.b	35(r12), r14
	add	r13, r14
	mov.b	r14, 14(r1)
	inc	r10
	mov.b	36(r12), r12
	mov	r10, 4(r1)
	mov.b	15(r1), r13
	add	r12, r13
	mov.b	r13, 15(r1)
	cmp	#3, 4(r1)
	jl	.LBB9_1
.LBB9_2:                                ; %for.end
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
	cmp	#3, 4(r1)
	jl	.LBB9_5
	jmp	.LBB9_13
.LBB9_3:                                ; %cond.false120
                                        ;   in Loop: Header=BB9_5 Depth=1
	mov	4(r1), r12
	mov	#3, r13
	call	#__mspabi_mpyi
	add	&unsafe, r12
	mov.b	36(r12), r13
	sxt	r13
	mov.b	15(r1), r12
	sxt	r12
.LBB9_4:                                ; %cond.end129
                                        ;   in Loop: Header=BB9_5 Depth=1
	sub	r13, r12
	mov.b	12(r1), r13
	add	r12, r13
	mov.b	r13, 12(r1)
	inc	4(r1)
	cmp	#3, 4(r1)
	jge	.LBB9_13
.LBB9_5:                                ; %for.body40
                                        ; =>This Inner Loop Header: Depth=1
	mov	4(r1), r12
	mov	#3, r13
	call	#__mspabi_mpyi
	add	&unsafe, r12
	mov.b	34(r12), r12
	sxt	r12
	mov.b	13(r1), r13
	sxt	r13
	cmp	r12, r13
	jge	.LBB9_7
; %bb.6:                                ; %cond.true
                                        ;   in Loop: Header=BB9_5 Depth=1
	mov	4(r1), r12
	mov	#3, r13
	call	#__mspabi_mpyi
	add	&unsafe, r12
	mov.b	34(r12), r12
	sxt	r12
	mov.b	13(r1), r13
	sxt	r13
	jmp	.LBB9_8
.LBB9_7:                                ; %cond.false
                                        ;   in Loop: Header=BB9_5 Depth=1
	mov	4(r1), r12
	mov	#3, r13
	call	#__mspabi_mpyi
	add	&unsafe, r12
	mov.b	34(r12), r13
	sxt	r13
	mov.b	13(r1), r12
	sxt	r12
.LBB9_8:                                ; %cond.end
                                        ;   in Loop: Header=BB9_5 Depth=1
	sub	r13, r12
	mov.b	10(r1), r13
	add	r12, r13
	mov.b	r13, 10(r1)
	mov	4(r1), r12
	mov	#3, r13
	call	#__mspabi_mpyi
	add	&unsafe, r12
	mov.b	35(r12), r12
	sxt	r12
	mov.b	14(r1), r13
	sxt	r13
	cmp	r12, r13
	jge	.LBB9_10
; %bb.9:                                ; %cond.true78
                                        ;   in Loop: Header=BB9_5 Depth=1
	mov	4(r1), r12
	mov	#3, r13
	call	#__mspabi_mpyi
	add	&unsafe, r12
	mov.b	35(r12), r12
	sxt	r12
	mov.b	14(r1), r13
	sxt	r13
	jmp	.LBB9_11
.LBB9_10:                               ; %cond.false87
                                        ;   in Loop: Header=BB9_5 Depth=1
	mov	4(r1), r12
	mov	#3, r13
	call	#__mspabi_mpyi
	add	&unsafe, r12
	mov.b	35(r12), r13
	sxt	r13
	mov.b	14(r1), r12
	sxt	r12
.LBB9_11:                               ; %cond.end96
                                        ;   in Loop: Header=BB9_5 Depth=1
	sub	r13, r12
	mov.b	11(r1), r13
	add	r12, r13
	mov.b	r13, 11(r1)
	mov	4(r1), r12
	mov	#3, r13
	call	#__mspabi_mpyi
	add	&unsafe, r12
	mov.b	36(r12), r12
	sxt	r12
	mov.b	15(r1), r13
	sxt	r13
	cmp	r12, r13
	jge	.LBB9_3
; %bb.12:                               ; %cond.true111
                                        ;   in Loop: Header=BB9_5 Depth=1
	mov	4(r1), r12
	mov	#3, r13
	call	#__mspabi_mpyi
	add	&unsafe, r12
	mov.b	36(r12), r12
	sxt	r12
	mov.b	15(r1), r13
	sxt	r13
	jmp	.LBB9_4
.LBB9_13:                               ; %for.end137
	mov.b	10(r1), r10
	sxt	r10
	rra	r10
	rra	r10
	mov	r10, r12
	mov	r10, r13
	call	#__mspabi_mpyi
	mov	r12, r9
	mov.b	11(r1), r8
	sxt	r8
	rra	r8
	rra	r8
	mov	r8, r12
	mov	r8, r13
	call	#__mspabi_mpyi
	mov	r12, r7
	add	r9, r7
	mov.b	r10, 10(r1)
	mov.b	r8, 11(r1)
	mov.b	12(r1), r12
	sxt	r12
	rra	r12
	rra	r12
	mov.b	r12, 12(r1)
	mov	r12, r13
	call	#__mspabi_mpyi
	mov	r12, r10
	add	r7, r10
	mov.b	13(r1), r12
	sxt	r12
	mov	r12, r13
	call	#__mspabi_mpyi
	mov	r12, r9
	mov.b	14(r1), r12
	sxt	r12
	mov	r12, r13
	call	#__mspabi_mpyi
	mov	r12, r8
	add	r9, r8
	mov.b	15(r1), r12
	sxt	r12
	mov	r12, r13
	call	#__mspabi_mpyi
	add	r8, r12
	mov	r12, 2(r1)
	mov	r10, 0(r1)
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
	mov	r12, r13
	add	#-1, r13
	cmp	#2, r13
	jlo	.LBB9_15
; %bb.14:                               ; %for.end137
	tst	r12
	jne	.LBB9_16
.LBB9_15:                               ; %sw.bb193
	mov	&unsafe, r12
	mov	8(r1), 46(r12)
	mov	6(r1), 44(r12)
.LBB9_16:                               ; %sw.epilog
	add	#16, r1
	pop	r7
	pop	r8
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
	push	r10
	sub	#32, r1
	clr	30(r1)
	clr	28(r1)
	mov	&unsafe, r12
	mov	44(r12), 20(r1)
	clr	22(r1)
	mov	46(r12), 16(r1)
	clr	18(r1)
	clr	26(r1)
	cmp	#16, 26(r1)
	jl	.LBB10_2
	jmp	.LBB10_44
.LBB10_1:                               ; %if.then96
                                        ;   in Loop: Header=BB10_2 Depth=1
	inc	30(r1)
	inc	26(r1)
	cmp	#16, 26(r1)
	jge	.LBB10_44
.LBB10_2:                               ; %for.body
                                        ; =>This Inner Loop Header: Depth=1
	mov	22(r1), r13
	mov	#1, r12
	tst	r13
	jge	.LBB10_4
; %bb.3:                                ; %for.body
                                        ;   in Loop: Header=BB10_2 Depth=1
	clr	r12
.LBB10_4:                               ; %for.body
                                        ;   in Loop: Header=BB10_2 Depth=1
	mov	26(r1), r14
	add	r14, r14
	add	r14, r14
	add	&unsafe, r14
	cmp	48(r14), 20(r1)
	mov	r2, r14
	tst	r13
	jeq	.LBB10_7
; %bb.5:                                ; %for.body
                                        ;   in Loop: Header=BB10_2 Depth=1
	mov	r12, r14
	bit	#1, r14
	jeq	.LBB10_8
.LBB10_6:                               ; %cond.false
                                        ;   in Loop: Header=BB10_2 Depth=1
	mov	26(r1), r12
	add	r12, r12
	add	r12, r12
	add	&unsafe, r12
	mov	48(r12), r13
	mov	20(r1), r12
	cmp	r13, r12
	mov	r2, r14
	sub	r13, r12
	mov	#1, r15
	bic	r14, r15
	mov	22(r1), r13
	jmp	.LBB10_9
.LBB10_7:                               ;   in Loop: Header=BB10_2 Depth=1
	and	#1, r14
	bit	#1, r14
	jne	.LBB10_6
.LBB10_8:                               ; %cond.true
                                        ;   in Loop: Header=BB10_2 Depth=1
	mov	26(r1), r12
	add	r12, r12
	add	r12, r12
	add	&unsafe, r12
	mov	48(r12), r12
	mov	20(r1), r13
	cmp	r13, r12
	mov	r2, r14
	sub	r13, r12
	mov	#1, r15
	bic	r14, r15
	add	22(r1), r15
	clr	r13
.LBB10_9:                               ; %cond.end
                                        ;   in Loop: Header=BB10_2 Depth=1
	sub	r15, r13
	mov	r12, 12(r1)
	mov	r13, 14(r1)
	mov	18(r1), r13
	mov	#1, r12
	tst	r13
	jge	.LBB10_11
; %bb.10:                               ; %cond.end
                                        ;   in Loop: Header=BB10_2 Depth=1
	clr	r12
.LBB10_11:                              ; %cond.end
                                        ;   in Loop: Header=BB10_2 Depth=1
	mov	26(r1), r14
	add	r14, r14
	add	r14, r14
	add	&unsafe, r14
	cmp	50(r14), 16(r1)
	mov	r2, r14
	tst	r13
	jeq	.LBB10_14
; %bb.12:                               ; %cond.end
                                        ;   in Loop: Header=BB10_2 Depth=1
	mov	r12, r14
	bit	#1, r14
	jeq	.LBB10_15
.LBB10_13:                              ; %cond.false37
                                        ;   in Loop: Header=BB10_2 Depth=1
	mov	26(r1), r12
	add	r12, r12
	add	r12, r12
	add	&unsafe, r12
	mov	50(r12), r13
	mov	16(r1), r12
	cmp	r13, r12
	mov	r2, r14
	sub	r13, r12
	mov	#1, r15
	bic	r14, r15
	mov	18(r1), r13
	jmp	.LBB10_16
.LBB10_14:                              ;   in Loop: Header=BB10_2 Depth=1
	and	#1, r14
	bit	#1, r14
	jne	.LBB10_13
.LBB10_15:                              ; %cond.true30
                                        ;   in Loop: Header=BB10_2 Depth=1
	mov	26(r1), r12
	add	r12, r12
	add	r12, r12
	add	&unsafe, r12
	mov	50(r12), r12
	mov	16(r1), r13
	cmp	r13, r12
	mov	r2, r14
	sub	r13, r12
	mov	#1, r15
	bic	r14, r15
	add	18(r1), r15
	clr	r13
.LBB10_16:                              ; %cond.end44
                                        ;   in Loop: Header=BB10_2 Depth=1
	sub	r15, r13
	mov	r12, 8(r1)
	mov	r13, 10(r1)
	mov	22(r1), r13
	mov	#1, r12
	tst	r13
	jge	.LBB10_18
; %bb.17:                               ; %cond.end44
                                        ;   in Loop: Header=BB10_2 Depth=1
	clr	r12
.LBB10_18:                              ; %cond.end44
                                        ;   in Loop: Header=BB10_2 Depth=1
	mov	26(r1), r14
	add	r14, r14
	add	r14, r14
	add	&unsafe, r14
	cmp	112(r14), 20(r1)
	mov	r2, r14
	tst	r13
	jeq	.LBB10_21
; %bb.19:                               ; %cond.end44
                                        ;   in Loop: Header=BB10_2 Depth=1
	mov	r12, r14
	bit	#1, r14
	jeq	.LBB10_22
.LBB10_20:                              ; %cond.false59
                                        ;   in Loop: Header=BB10_2 Depth=1
	mov	26(r1), r12
	add	r12, r12
	add	r12, r12
	add	&unsafe, r12
	mov	112(r12), r13
	mov	20(r1), r12
	cmp	r13, r12
	mov	r2, r14
	sub	r13, r12
	mov	#1, r15
	bic	r14, r15
	mov	22(r1), r13
	jmp	.LBB10_23
.LBB10_21:                              ;   in Loop: Header=BB10_2 Depth=1
	and	#1, r14
	bit	#1, r14
	jne	.LBB10_20
.LBB10_22:                              ; %cond.true52
                                        ;   in Loop: Header=BB10_2 Depth=1
	mov	26(r1), r12
	add	r12, r12
	add	r12, r12
	add	&unsafe, r12
	mov	112(r12), r12
	mov	20(r1), r13
	cmp	r13, r12
	mov	r2, r14
	sub	r13, r12
	mov	#1, r15
	bic	r14, r15
	add	22(r1), r15
	clr	r13
.LBB10_23:                              ; %cond.end66
                                        ;   in Loop: Header=BB10_2 Depth=1
	sub	r15, r13
	mov	r12, 4(r1)
	mov	r13, 6(r1)
	mov	18(r1), r13
	mov	#1, r12
	tst	r13
	jge	.LBB10_25
; %bb.24:                               ; %cond.end66
                                        ;   in Loop: Header=BB10_2 Depth=1
	clr	r12
.LBB10_25:                              ; %cond.end66
                                        ;   in Loop: Header=BB10_2 Depth=1
	mov	26(r1), r14
	add	r14, r14
	add	r14, r14
	add	&unsafe, r14
	cmp	114(r14), 16(r1)
	mov	r2, r14
	tst	r13
	jeq	.LBB10_28
; %bb.26:                               ; %cond.end66
                                        ;   in Loop: Header=BB10_2 Depth=1
	mov	r12, r14
	bit	#1, r14
	jeq	.LBB10_29
.LBB10_27:                              ; %cond.false82
                                        ;   in Loop: Header=BB10_2 Depth=1
	mov	26(r1), r12
	add	r12, r12
	add	r12, r12
	add	&unsafe, r12
	mov	114(r12), r13
	mov	16(r1), r12
	cmp	r13, r12
	mov	r2, r14
	sub	r13, r12
	mov	#1, r15
	bic	r14, r15
	mov	18(r1), r13
	jmp	.LBB10_30
.LBB10_28:                              ;   in Loop: Header=BB10_2 Depth=1
	and	#1, r14
	bit	#1, r14
	jne	.LBB10_27
.LBB10_29:                              ; %cond.true75
                                        ;   in Loop: Header=BB10_2 Depth=1
	mov	26(r1), r12
	add	r12, r12
	add	r12, r12
	add	&unsafe, r12
	mov	114(r12), r12
	mov	16(r1), r13
	cmp	r13, r12
	mov	r2, r14
	sub	r13, r12
	mov	#1, r15
	bic	r14, r15
	add	18(r1), r15
	clr	r13
.LBB10_30:                              ; %cond.end89
                                        ;   in Loop: Header=BB10_2 Depth=1
	sub	r15, r13
	mov	14(r1), r14
	mov	6(r1), r10
	mov	#1, r15
	cmp	r14, r10
	jge	.LBB10_32
; %bb.31:                               ; %cond.end89
                                        ;   in Loop: Header=BB10_2 Depth=1
	clr	r15
.LBB10_32:                              ; %cond.end89
                                        ;   in Loop: Header=BB10_2 Depth=1
	cmp	12(r1), 4(r1)
	mov	r2, r11
	cmp	r14, r10
	jeq	.LBB10_34
; %bb.33:                               ; %cond.end89
                                        ;   in Loop: Header=BB10_2 Depth=1
	mov	r15, r11
	jmp	.LBB10_35
.LBB10_34:                              ;   in Loop: Header=BB10_2 Depth=1
	and	#1, r11
.LBB10_35:                              ; %cond.end89
                                        ;   in Loop: Header=BB10_2 Depth=1
	mov	r12, 0(r1)
	mov	r13, 2(r1)
	bit	#1, r11
	jne	.LBB10_37
; %bb.36:                               ; %if.then
                                        ;   in Loop: Header=BB10_2 Depth=1
	inc	30(r1)
	jmp	.LBB10_38
.LBB10_37:                              ; %if.else
                                        ;   in Loop: Header=BB10_2 Depth=1
	inc	28(r1)
.LBB10_38:                              ; %if.end
                                        ;   in Loop: Header=BB10_2 Depth=1
	mov	10(r1), r12
	mov	2(r1), r14
	mov	#1, r13
	cmp	r12, r14
	jge	.LBB10_40
; %bb.39:                               ; %if.end
                                        ;   in Loop: Header=BB10_2 Depth=1
	clr	r13
.LBB10_40:                              ; %if.end
                                        ;   in Loop: Header=BB10_2 Depth=1
	cmp	8(r1), 0(r1)
	mov	r2, r15
	cmp	r12, r14
	jeq	.LBB10_42
; %bb.41:                               ; %if.end
                                        ;   in Loop: Header=BB10_2 Depth=1
	mov	r13, r15
	bit	#1, r15
	jeq	.LBB10_1
	jmp	.LBB10_43
.LBB10_42:                              ;   in Loop: Header=BB10_2 Depth=1
	and	#1, r15
	bit	#1, r15
	jeq	.LBB10_1
.LBB10_43:                              ; %if.else98
                                        ;   in Loop: Header=BB10_2 Depth=1
	inc	28(r1)
	inc	26(r1)
	cmp	#16, 26(r1)
	jl	.LBB10_2
.LBB10_44:                              ; %for.end
	mov	#1, r12
	cmp	30(r1), 28(r1)
	jl	.LBB10_46
; %bb.45:                               ; %for.end
	clr	r12
.LBB10_46:                              ; %for.end
	mov	&unsafe, r13
	mov	r12, 26(r13)
	add	#32, r1
	pop	r10
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
	inc	28(r12)
	mov	&unsafe, r12
	mov	26(r12), r12
	tst	r12
	jeq	.LBB11_3
; %bb.1:                                ; %entry
	cmp	#1, r12
	jne	.LBB11_4
; %bb.2:                                ; %sw.bb
	mov	&unsafe, r12
	inc	30(r12)
	jmp	.LBB11_4
.LBB11_3:                               ; %sw.bb5
	mov	&unsafe, r12
	inc	32(r12)
.LBB11_4:                               ; %sw.epilog
	mov	&unsafe, r12
	cmp	#128, 28(r12)
	jne	.LBB11_6
; %bb.5:                                ; %if.then
	mov	&unsafe, r10
	mov	32(r10), r12
	mov	#100, r13
	call	#__mspabi_mpyi
	mov	28(r10), r13
	call	#__mspabi_divu
	mov	r12, 4(r1)
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
	inc	24(r12)
	mov	&unsafe, r12
	cmp	#3, 24(r12)
	jne	.LBB12_2
; %bb.1:                                ; %if.then
	mov	&unsafe, r12
	clr	176(r12)
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
	cmp	#1, r12
	jeq	.LBB13_3
; %bb.1:                                ; %entry
	tst	r12
	jne	.LBB13_4
; %bb.2:                                ; %sw.bb
	mov	&unsafe, r12
	mov	176(r12), r13
	add	r13, r13
	add	r13, r13
	add	r12, r13
	mov	44(r12), 48(r13)
	mov	46(r12), 50(r13)
	jmp	.LBB13_4
.LBB13_3:                               ; %sw.bb6
	mov	&unsafe, r12
	mov	176(r12), r13
	add	r13, r13
	add	r13, r13
	add	r12, r13
	mov	44(r12), 112(r13)
	mov	46(r12), 114(r13)
.LBB13_4:                               ; %sw.epilog
	mov	&unsafe, r12
	inc	176(r12)
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
	sub	#2, r1
	mov	#1, &camel
	clr	0(r1)
	mov	#camel+2, &safe
	mov	#camel+190, &unsafe
	call	#camel_init
	call	#task_init
	call	#commit
	call	#task_commit
.LBB16_1:                               ; %while.body
                                        ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB16_6 Depth 2
                                        ;     Child Loop BB16_9 Depth 2
	call	#task_selectMode
	call	#commit
	call	#task_commit
	mov	&safe, r12
	cmp	#2, 180(r12)
	jeq	.LBB16_6
; %bb.2:                                ; %lor.lhs.false
                                        ;   in Loop: Header=BB16_1 Depth=1
	mov	&safe, r12
	cmp	#1, 180(r12)
	jeq	.LBB16_6
; %bb.3:                                ; %if.else
                                        ;   in Loop: Header=BB16_1 Depth=1
	mov	&safe, r12
	tst	180(r12)
	jeq	.LBB16_7
; %bb.4:                                ; %if.else12
                                        ;   in Loop: Header=BB16_1 Depth=1
	mov	&safe, r12
	cmp	#3, 180(r12)
	jeq	.LBB16_1
	jmp	.LBB16_9
.LBB16_5:                               ; %while.body7
                                        ;   in Loop: Header=BB16_6 Depth=2
	call	#task_warmup
	call	#commit
	call	#task_commit
.LBB16_6:                               ; %while.cond4
                                        ;   Parent Loop BB16_1 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	mov	&safe, r12
	cmp	#3, 24(r12)
	jlo	.LBB16_5
	jmp	.LBB16_9
.LBB16_7:                               ; %if.then11
                                        ;   in Loop: Header=BB16_1 Depth=1
	call	#task_resetStats
.LBB16_8:                               ; %while.cond21
                                        ;   in Loop: Header=BB16_1 Depth=1
	call	#commit
	call	#task_commit
.LBB16_9:                               ; %while.cond21
                                        ;   Parent Loop BB16_1 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	mov	&safe, r12
	cmp	#3, 178(r12)
	jlo	.LBB16_15
; %bb.10:                               ; %while.end25
                                        ;   in Loop: Header=BB16_9 Depth=2
	call	#task_transform
	call	#commit
	call	#task_commit
	call	#task_featurize
	call	#commit
	call	#task_commit
	mov	&safe, r12
	cmp	#2, 180(r12)
	jeq	.LBB16_12
; %bb.11:                               ; %lor.lhs.false29
                                        ;   in Loop: Header=BB16_9 Depth=2
	mov	&safe, r12
	cmp	#1, 180(r12)
	jne	.LBB16_13
.LBB16_12:                              ; %if.then33
                                        ;   in Loop: Header=BB16_9 Depth=2
	call	#task_train
	call	#commit
	call	#task_commit
	mov	&safe, r12
	cmp	#16, 176(r12)
	jlo	.LBB16_9
	jmp	.LBB16_1
.LBB16_13:                              ; %if.else38
                                        ;   in Loop: Header=BB16_9 Depth=2
	mov	&safe, r12
	tst	180(r12)
	jne	.LBB16_9
; %bb.14:                               ; %if.then42
                                        ;   in Loop: Header=BB16_9 Depth=2
	call	#task_classify
	call	#commit
	call	#task_commit
	call	#task_stats
	call	#commit
	call	#task_commit
	mov	&safe, r12
	cmp	#128, 28(r12)
	jne	.LBB16_9
	jmp	.LBB16_1
.LBB16_15:                              ; %while.body24
                                        ;   in Loop: Header=BB16_1 Depth=1
	call	#task_sample
	jmp	.LBB16_8
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
