	.text
	.file	"basic_math.c"
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
	mov	#camel+52, &unsafe
	jmp	.LBB1_6
.LBB1_2:                                ; %if.else
	mov	&camel, r12
	cmp	#2, r12
	jne	.LBB1_4
	jmp	.LBB1_3
.LBB1_3:                                ; %if.then2
	mov	#camel+52, &safe
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
	mov	#48, r13
	call	#__fast_hw_crc
	mov	r12, &tmp_stack_buf_crc
	mov	&tmp_stack_buf_crc, r12
	mov	&safe, r13
	mov	48(r13), r13
	cmp	r13, r12
	jne	.LBB1_8
	jmp	.LBB1_7
.LBB1_7:                                ; %if.then10
	mov	&unsafe, r12
	mov	&safe, r13
	mov	#50, r14
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
	.globl	arrEqual                ; -- Begin function arrEqual
	.p2align	1
	.type	arrEqual,@function
arrEqual:                               ; @arrEqual
.Lfunc_begin2:
; %bb.0:                                ; %entry
	sub	#10, r1
	mov	r12, 6(r1)
	mov	r13, 4(r1)
	mov	r14, 2(r1)
	clr	0(r1)
	jmp	.LBB2_1
.LBB2_1:                                ; %for.cond
                                        ; =>This Inner Loop Header: Depth=1
	mov	0(r1), r12
	mov	2(r1), r13
	cmp	r13, r12
	jhs	.LBB2_6
	jmp	.LBB2_2
.LBB2_2:                                ; %for.body
                                        ;   in Loop: Header=BB2_1 Depth=1
	mov	6(r1), r12
	mov	0(r1), r13
	add	r13, r13
	add	r13, r12
	mov	0(r12), r12
	mov	4(r1), r14
	add	r13, r14
	mov	0(r14), r13
	cmp	r13, r12
	jeq	.LBB2_4
	jmp	.LBB2_3
.LBB2_3:                                ; %if.then
	clr.b	9(r1)
	jmp	.LBB2_7
.LBB2_4:                                ; %if.end
                                        ;   in Loop: Header=BB2_1 Depth=1
	jmp	.LBB2_5
.LBB2_5:                                ; %for.inc
                                        ;   in Loop: Header=BB2_1 Depth=1
	mov	0(r1), r12
	inc	r12
	mov	r12, 0(r1)
	jmp	.LBB2_1
.LBB2_6:                                ; %for.end
	mov.b	#1, 9(r1)
	jmp	.LBB2_7
.LBB2_7:                                ; %return
	mov.b	9(r1), r12
	add	#10, r1
	ret
.Lfunc_end2:
	.size	arrEqual, .Lfunc_end2-arrEqual
                                        ; -- End function
	.globl	task_init               ; -- Begin function task_init
	.p2align	1
	.type	task_init,@function
task_init:                              ; @task_init
.Lfunc_begin3:
; %bb.0:                                ; %entry
	mov	&unsafe, r12
	mov	#1, 22(r12)
	mov	&unsafe, r12
	mov	#2, 24(r12)
	mov	&unsafe, r12
	clr	26(r12)
	mov	&unsafe, r12
	clr	36(r12)
	clr	34(r12)
	clr	32(r12)
	clr	30(r12)
	clr	28(r12)
	mov	&unsafe, r12
	clr	46(r12)
	clr	44(r12)
	clr	42(r12)
	clr	40(r12)
	clr	38(r12)
	ret
.Lfunc_end3:
	.size	task_init, .Lfunc_end3-task_init
                                        ; -- End function
	.globl	task_1                  ; -- Begin function task_1
	.p2align	1
	.type	task_1,@function
task_1:                                 ; @task_1
.Lfunc_begin4:
; %bb.0:                                ; %entry
	sub	#2, r1
	mov	&unsafe, r12
	mov	22(r12), r13
	inc	r13
	mov	r13, 22(r12)
	mov	&unsafe, r12
	mov	22(r12), r13
	add	r13, r13
	add	#5, r13
	mov	r13, 24(r12)
	clr	0(r1)
	mov	&unsafe, r12
	mov	r12, r13
	add	#22, r13
	mov	22(r12), r12
	mov	0(r1), r14
	add	r14, r14
	add	r14, r13
	mov	r12, 6(r13)
	add	#2, r1
	ret
.Lfunc_end4:
	.size	task_1, .Lfunc_end4-task_1
                                        ; -- End function
	.globl	task_2                  ; -- Begin function task_2
	.p2align	1
	.type	task_2,@function
task_2:                                 ; @task_2
.Lfunc_begin5:
; %bb.0:                                ; %entry
	sub	#8, r1
	clr	6(r1)
	mov	#3, 4(r1)
	mov	#1, 2(r1)
	mov	#1, 0(r1)
	mov	&unsafe, r12
	add	#22, r12
	mov	6(r1), r13
	add	r13, r13
	mov	r12, r14
	add	r13, r14
	mov	6(r14), r13
	mov	2(r1), r14
	add	r14, r14
	add	r14, r12
	mov	r13, 16(r12)
	mov	&unsafe, r12
	add	#28, r12
	mov	4(r1), r13
	add	r13, r13
	mov	r12, r14
	add	r13, r14
	mov	0(r14), r13
	mov	0(r1), r14
	add	r14, r14
	add	r14, r12
	mov	0(r12), r14
	add	r14, r13
	add	#5, r13
	mov	r13, 0(r12)
	add	#8, r1
	ret
.Lfunc_end5:
	.size	task_2, .Lfunc_end5-task_2
                                        ; -- End function
	.globl	task_3                  ; -- Begin function task_3
	.p2align	1
	.type	task_3,@function
task_3:                                 ; @task_3
.Lfunc_begin6:
; %bb.0:                                ; %entry
	sub	#2, r1
	mov	&unsafe, r12
	mov	22(r12), r13
	inc	r13
	mov	r13, 26(r12)
	mov	&unsafe, r12
	mov	26(r12), r12
	inc	r12
	mov	r12, 0(r1)
	mov	&unsafe, r12
	mov	r12, r13
	add	#22, r13
	mov	0(r1), r14
	add	r14, r14
	mov	r13, r15
	add	r14, r15
	mov	6(r15), r14
	mov	26(r12), r12
	add	r12, r12
	add	r12, r13
	mov	r14, 16(r13)
	mov	&unsafe, r12
	mov	26(r12), r13
	inc	r13
	mov	r13, 26(r12)
	mov	&unsafe, r12
	mov	26(r12), r13
	add	r13, r13
	add	r13, r12
	mov	28(r12), r13
	mov	r13, 38(r12)
	add	#2, r1
	ret
.Lfunc_end6:
	.size	task_3, .Lfunc_end6-task_3
                                        ; -- End function
	.globl	success                 ; -- Begin function success
	.p2align	1
	.type	success,@function
success:                                ; @success
.Lfunc_begin7:
; %bb.0:                                ; %entry
	ret
.Lfunc_end7:
	.size	success, .Lfunc_end7-success
                                        ; -- End function
	.globl	failure                 ; -- Begin function failure
	.p2align	1
	.type	failure,@function
failure:                                ; @failure
.Lfunc_begin8:
; %bb.0:                                ; %entry
	ret
.Lfunc_end8:
	.size	failure, .Lfunc_end8-failure
                                        ; -- End function
	.globl	task_check              ; -- Begin function task_check
	.p2align	1
	.type	task_check,@function
task_check:                             ; @task_check
.Lfunc_begin9:
; %bb.0:                                ; %entry
	sub	#26, r1
	mov	&.L__const.task_check.ref_arr1+8, r12
	mov	r12, 24(r1)
	mov	&.L__const.task_check.ref_arr1+6, r12
	mov	r12, 22(r1)
	mov	&.L__const.task_check.ref_arr1+4, r12
	mov	r12, 20(r1)
	mov	&.L__const.task_check.ref_arr1+2, r12
	mov	r12, 18(r1)
	mov	&.L__const.task_check.ref_arr1, r12
	mov	r12, 16(r1)
	mov	&.L__const.task_check.ref_arr2+8, r12
	mov	r12, 14(r1)
	mov	&.L__const.task_check.ref_arr2+6, r12
	mov	r12, 12(r1)
	mov	&.L__const.task_check.ref_arr2+4, r12
	mov	r12, 10(r1)
	mov	&.L__const.task_check.ref_arr2+2, r12
	mov	r12, 8(r1)
	mov	&.L__const.task_check.ref_arr2, r12
	mov	r12, 6(r1)
	mov	#2, 4(r1)
	mov	#9, 2(r1)
	mov	#4, 0(r1)
	mov	&unsafe, r12
	mov	22(r12), r12
	mov	4(r1), r13
	cmp	r13, r12
	jeq	.LBB9_2
	jmp	.LBB9_1
.LBB9_1:                                ; %if.then
	call	#failure
	jmp	.LBB9_2
.LBB9_2:                                ; %if.end
	mov	&unsafe, r12
	mov	24(r12), r12
	mov	2(r1), r13
	cmp	r13, r12
	jeq	.LBB9_4
	jmp	.LBB9_3
.LBB9_3:                                ; %if.then3
	call	#failure
	jmp	.LBB9_4
.LBB9_4:                                ; %if.end4
	mov	&unsafe, r12
	mov	26(r12), r12
	mov	0(r1), r13
	cmp	r13, r12
	jeq	.LBB9_6
	jmp	.LBB9_5
.LBB9_5:                                ; %if.then7
	call	#failure
	jmp	.LBB9_6
.LBB9_6:                                ; %if.end8
	mov	&unsafe, r13
	add	#28, r13
	mov	r1, r12
	add	#16, r12
	mov	#5, r14
	call	#arrEqual
	tst.b	r12
	jne	.LBB9_8
	jmp	.LBB9_7
.LBB9_7:                                ; %if.then11
	call	#failure
	jmp	.LBB9_8
.LBB9_8:                                ; %if.end12
	mov	&unsafe, r13
	add	#38, r13
	mov	r1, r12
	add	#6, r12
	mov	#5, r14
	call	#arrEqual
	tst.b	r12
	jne	.LBB9_10
	jmp	.LBB9_9
.LBB9_9:                                ; %if.then18
	call	#failure
	jmp	.LBB9_10
.LBB9_10:                               ; %if.end19
	call	#success
	add	#26, r1
	ret
.Lfunc_end9:
	.size	task_check, .Lfunc_end9-task_check
                                        ; -- End function
	.globl	main                    ; -- Begin function main
	.p2align	1
	.type	main,@function
main:                                   ; @main
.Lfunc_begin10:
; %bb.0:                                ; %entry
	sub	#66, r1
	clr	64(r1)
	mov	#1, &camel
	mov	#camel+2, &safe
	mov	#camel+52, &unsafe
	call	#camel_init
	mov	&unsafe, r12
	add	#22, r12
	mov	&safe, r13
	add	#22, r13
	mov	#26, r14
	call	#memcpy
	call	#task_init
	jmp	.LBB10_1
.LBB10_1:                               ; %do.body
	mov	&camel, r12
	cmp	#1, r12
	jne	.LBB10_3
	jmp	.LBB10_2
.LBB10_2:                               ; %if.then
	mov	#camel+52, &safe
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
	mov	#48, r13
	call	#__fast_hw_crc
	mov	r12, &tmp_stack_buf_crc
	mov	&tmp_stack_buf_crc, r12
	mov	&safe, r13
	mov	r12, 48(r13)
	mov	#2, &camel
	jmp	.LBB10_4
.LBB10_3:                               ; %if.else
	mov	#camel+2, &safe
	mov	#camel+52, &unsafe
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
	mov	#48, r13
	call	#__fast_hw_crc
	mov	r12, &tmp_stack_buf_crc
	mov	&tmp_stack_buf_crc, r12
	mov	&safe, r13
	mov	r12, 48(r13)
	mov	#1, &camel
	jmp	.LBB10_4
.LBB10_4:                               ; %if.end
	jmp	.LBB10_5
.LBB10_5:                               ; %do.end
	mov	&unsafe, r12
	add	#22, r12
	mov	&safe, r13
	add	#22, r13
	mov	#26, r14
	call	#memcpy
	call	#task_1
	jmp	.LBB10_6
.LBB10_6:                               ; %do.body17
	mov	&camel, r12
	cmp	#1, r12
	jne	.LBB10_8
	jmp	.LBB10_7
.LBB10_7:                               ; %if.then19
	mov	#camel+52, &safe
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
	mov	#48, r13
	call	#__fast_hw_crc
	mov	r12, &tmp_stack_buf_crc
	mov	&tmp_stack_buf_crc, r12
	mov	&safe, r13
	mov	r12, 48(r13)
	mov	#2, &camel
	jmp	.LBB10_9
.LBB10_8:                               ; %if.else32
	mov	#camel+2, &safe
	mov	#camel+52, &unsafe
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
	mov	#48, r13
	call	#__fast_hw_crc
	mov	r12, &tmp_stack_buf_crc
	mov	&tmp_stack_buf_crc, r12
	mov	&safe, r13
	mov	r12, 48(r13)
	mov	#1, &camel
	jmp	.LBB10_9
.LBB10_9:                               ; %if.end45
	jmp	.LBB10_10
.LBB10_10:                              ; %do.end46
	mov	&unsafe, r12
	add	#22, r12
	mov	&safe, r13
	add	#22, r13
	mov	#26, r14
	call	#memcpy
	call	#task_2
	jmp	.LBB10_11
.LBB10_11:                              ; %do.body47
	mov	&camel, r12
	cmp	#1, r12
	jne	.LBB10_13
	jmp	.LBB10_12
.LBB10_12:                              ; %if.then49
	mov	#camel+52, &safe
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
	mov	#48, r13
	call	#__fast_hw_crc
	mov	r12, &tmp_stack_buf_crc
	mov	&tmp_stack_buf_crc, r12
	mov	&safe, r13
	mov	r12, 48(r13)
	mov	#2, &camel
	jmp	.LBB10_14
.LBB10_13:                              ; %if.else62
	mov	#camel+2, &safe
	mov	#camel+52, &unsafe
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
	mov	#48, r13
	call	#__fast_hw_crc
	mov	r12, &tmp_stack_buf_crc
	mov	&tmp_stack_buf_crc, r12
	mov	&safe, r13
	mov	r12, 48(r13)
	mov	#1, &camel
	jmp	.LBB10_14
.LBB10_14:                              ; %if.end75
	jmp	.LBB10_15
.LBB10_15:                              ; %do.end76
	mov	&unsafe, r12
	add	#22, r12
	mov	&safe, r13
	add	#22, r13
	mov	#26, r14
	call	#memcpy
	call	#task_3
	jmp	.LBB10_16
.LBB10_16:                              ; %do.body77
	mov	&camel, r12
	cmp	#1, r12
	jne	.LBB10_18
	jmp	.LBB10_17
.LBB10_17:                              ; %if.then79
	mov	#camel+52, &safe
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
	mov	#48, r13
	call	#__fast_hw_crc
	mov	r12, &tmp_stack_buf_crc
	mov	&tmp_stack_buf_crc, r12
	mov	&safe, r13
	mov	r12, 48(r13)
	mov	#2, &camel
	jmp	.LBB10_19
.LBB10_18:                              ; %if.else92
	mov	#camel+2, &safe
	mov	#camel+52, &unsafe
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
	mov	#48, r13
	call	#__fast_hw_crc
	mov	r12, &tmp_stack_buf_crc
	mov	&tmp_stack_buf_crc, r12
	mov	&safe, r13
	mov	r12, 48(r13)
	mov	#1, &camel
	jmp	.LBB10_19
.LBB10_19:                              ; %if.end105
	jmp	.LBB10_20
.LBB10_20:                              ; %do.end106
	mov	&unsafe, r12
	add	#22, r12
	mov	&safe, r13
	add	#22, r13
	mov	#26, r14
	call	#memcpy
	call	#task_check
	jmp	.LBB10_21
.LBB10_21:                              ; %while.body
                                        ; =>This Inner Loop Header: Depth=1
	jmp	.LBB10_21
.Lfunc_end10:
	.size	main, .Lfunc_end10-main
                                        ; -- End function
	.type	camel,@object           ; @camel
	.comm	camel,102,2
	.type	safe,@object            ; @safe
	.comm	safe,2,2
	.type	unsafe,@object          ; @unsafe
	.comm	unsafe,2,2
	.type	tmp_stack_crc,@object   ; @tmp_stack_crc
	.comm	tmp_stack_crc,2,2
	.type	tmp_stack_buf_crc,@object ; @tmp_stack_buf_crc
	.comm	tmp_stack_buf_crc,2,2
	.type	.L__const.task_check.ref_arr1,@object ; @__const.task_check.ref_arr1
	.section	.rodata,"a",@progbits
	.p2align	1
.L__const.task_check.ref_arr1:
	.short	2                       ; 0x2
	.short	0                       ; 0x0
	.short	0                       ; 0x0
	.short	0                       ; 0x0
	.short	5                       ; 0x5
	.size	.L__const.task_check.ref_arr1, 10

	.type	.L__const.task_check.ref_arr2,@object ; @__const.task_check.ref_arr2
	.p2align	1
.L__const.task_check.ref_arr2:
	.short	0                       ; 0x0
	.short	2                       ; 0x2
	.short	0                       ; 0x0
	.short	5                       ; 0x5
	.short	5                       ; 0x5
	.size	.L__const.task_check.ref_arr2, 10

	.type	reset_vector,@object    ; @reset_vector
	.section	__interrupt_vector_56,"aw",@progbits
	.p2align	1
reset_vector:
	.short	camel_recover
	.size	reset_vector, 2

	.type	writeOpt,@object        ; @writeOpt
	.comm	writeOpt,2,2
	.type	buf,@object             ; @buf
	.comm	buf,22,2

	.ident	"clang version 10.0.0 (https://github.com/llvm/llvm-project.git f79f68975d51b389d9f141aa30ab47723a75a868)"
	.section	".note.GNU-stack","",@progbits
