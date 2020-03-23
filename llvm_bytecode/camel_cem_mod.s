	.text
	.file	"camel_cem.c"
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
	mov	#camel+3520, &unsafe
	jmp	.LBB1_6
.LBB1_2:                                ; %if.else
	mov	&camel, r12
	cmp	#2, r12
	jne	.LBB1_4
	jmp	.LBB1_3
.LBB1_3:                                ; %if.then2
	mov	#camel+3520, &safe
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
	mov	#3516, r13
	call	#__fast_hw_crc
	mov	r12, &tmp_stack_buf_crc
	mov	&tmp_stack_buf_crc, r12
	mov	&safe, r13
	mov	3516(r13), r13
	cmp	r13, r12
	jne	.LBB1_8
	jmp	.LBB1_7
.LBB1_7:                                ; %if.then10
	mov	&unsafe, r12
	mov	&safe, r13
	mov	#3518, r14
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
	push	r10
	sub	#8, r1
	mov	&unsafe, r12
	clr	3114(r12)
	mov	&unsafe, r12
	clr	28(r12)
	mov	&unsafe, r12
	clr	22(r12)
	mov	&unsafe, r12
	clr	26(r12)
	mov	&unsafe, r12
	clr	24(r12)
	mov	&unsafe, r12
	mov	#1, 3106(r12)
	mov	&unsafe, r12
	clr	3514(r12)
	jmp	.LBB2_1
.LBB2_1:                                ; %while.cond
                                        ; =>This Inner Loop Header: Depth=1
	mov	&unsafe, r12
	mov	22(r12), r12
	cmp	#256, r12
	jhs	.LBB2_3
	jmp	.LBB2_2
.LBB2_2:                                ; %while.body
                                        ;   in Loop: Header=BB2_1 Depth=1
	mov	&unsafe, r12
	mov	22(r12), r12
	mov	r12, 2(r1)
	clr	4(r1)
	clr	6(r1)
	mov	&unsafe, r12
	mov	22(r12), r12
	mov	r12, 0(r1)
	mov	&unsafe, r10
	mov	0(r1), r12
	mov	#6, r13
	call	#__mspabi_mpyi
	add	r12, r10
	mov	6(r1), r12
	mov	r12, 36(r10)
	mov	4(r1), r12
	mov	r12, 34(r10)
	mov	2(r1), r12
	mov	r12, 32(r10)
	mov	&unsafe, r12
	mov	22(r12), r13
	inc	r13
	mov	r13, 22(r12)
	jmp	.LBB2_1
.LBB2_3:                                ; %while.end
	mov	&unsafe, r12
	mov	#256, 30(r12)
	add	#8, r1
	pop	r10
	ret
.Lfunc_end2:
	.size	task_init, .Lfunc_end2-task_init
                                        ; -- End function
	.globl	task_sample             ; -- Begin function task_sample
	.p2align	1
	.type	task_sample,@function
task_sample:                            ; @task_sample
.Lfunc_begin3:
; %bb.0:                                ; %entry
	sub	#2, r1
	mov	&unsafe, r12
	mov	24(r12), r12
	inc	r12
	mov	r12, 0(r1)
	mov	0(r1), r12
	cmp	#2, r12
	jne	.LBB3_2
	jmp	.LBB3_1
.LBB3_1:                                ; %if.then
	clr	0(r1)
	jmp	.LBB3_2
.LBB3_2:                                ; %if.end
	mov	&unsafe, r12
	mov	24(r12), r12
	tst	r12
	jne	.LBB3_4
	jmp	.LBB3_3
.LBB3_3:                                ; %if.then4
	mov	0(r1), r12
	mov	&unsafe, r13
	mov	r12, 24(r13)
	mov	&unsafe, r12
	mov	#1, 3514(r12)
	jmp	.LBB3_5
.LBB3_4:                                ; %if.else
	mov	0(r1), r12
	mov	&unsafe, r13
	mov	r12, 24(r13)
	mov	&unsafe, r12
	clr	3514(r12)
	jmp	.LBB3_5
.LBB3_5:                                ; %if.end12
	add	#2, r1
	ret
.Lfunc_end3:
	.size	task_sample, .Lfunc_end3-task_sample
                                        ; -- End function
	.globl	task_measure_temp       ; -- Begin function task_measure_temp
	.p2align	1
	.type	task_measure_temp,@function
task_measure_temp:                      ; @task_measure_temp
.Lfunc_begin4:
; %bb.0:                                ; %entry
	sub	#4, r1
	mov	&unsafe, r12
	mov	26(r12), r12
	mov	r12, 2(r1)
	mov	2(r1), r12
	call	#acquire_sample
	mov	r12, 0(r1)
	mov	0(r1), r12
	mov	r12, 2(r1)
	mov	2(r1), r12
	mov	&unsafe, r13
	mov	r12, 26(r13)
	mov	0(r1), r12
	mov	&unsafe, r13
	mov	r12, 3104(r13)
	add	#4, r1
	ret
.Lfunc_end4:
	.size	task_measure_temp, .Lfunc_end4-task_measure_temp
                                        ; -- End function
	.p2align	1               ; -- Begin function acquire_sample
	.type	acquire_sample,@function
acquire_sample:                         ; @acquire_sample
.Lfunc_begin5:
; %bb.0:                                ; %entry
	sub	#4, r1
	mov	r12, 2(r1)
	mov	2(r1), r12
	inc	r12
	and	#3, r12
	mov	r12, 0(r1)
	mov	0(r1), r12
	add	#4, r1
	ret
.Lfunc_end5:
	.size	acquire_sample, .Lfunc_end5-acquire_sample
                                        ; -- End function
	.globl	task_letterize          ; -- Begin function task_letterize
	.p2align	1
	.type	task_letterize,@function
task_letterize:                         ; @task_letterize
.Lfunc_begin6:
; %bb.0:                                ; %entry
	sub	#6, r1
	mov	&unsafe, r12
	mov	24(r12), r12
	mov	r12, 4(r1)
	mov	4(r1), r12
	tst	r12
	jne	.LBB6_2
	jmp	.LBB6_1
.LBB6_1:                                ; %if.then
	mov	#2, 4(r1)
	jmp	.LBB6_3
.LBB6_2:                                ; %if.else
	mov	4(r1), r12
	add	#-1, r12
	mov	r12, 4(r1)
	jmp	.LBB6_3
.LBB6_3:                                ; %if.end
	mov	4(r1), r12
	add	r12, r12
	add	r12, r12
	add	r12, r12
	mov	r12, 2(r1)
	mov	&unsafe, r12
	mov	3104(r12), r12
	mov.b	2(r1), r13
	mov	#255, r14
	cmp.b	#0, r13
	mov.b	r13, r15
	jeq	.LBB6_5
.LBB6_4:                                ; %if.end
                                        ; =>This Inner Loop Header: Depth=1
	add	r14, r14
	sub.b	#1, r15
	jne	.LBB6_4
.LBB6_5:                                ; %if.end
	and	r14, r12
	cmp.b	#0, r13
	jeq	.LBB6_7
.LBB6_6:                                ; %if.end
                                        ; =>This Inner Loop Header: Depth=1
	clrc
	rrc	r12
	sub.b	#1, r13
	jne	.LBB6_6
.LBB6_7:                                ; %if.end
	mov	r12, 0(r1)
	mov	0(r1), r12
	mov	&unsafe, r13
	mov	r12, 22(r13)
	add	#6, r1
	ret
.Lfunc_end6:
	.size	task_letterize, .Lfunc_end6-task_letterize
                                        ; -- End function
	.globl	task_compress           ; -- Begin function task_compress
	.p2align	1
	.type	task_compress,@function
task_compress:                          ; @task_compress
.Lfunc_begin7:
; %bb.0:                                ; %entry
	push	r10
	sub	#8, r1
	mov	&unsafe, r12
	mov	3114(r12), r12
	mov	r12, 0(r1)
	mov	&unsafe, r10
	mov	0(r1), r12
	mov	#6, r13
	call	#__mspabi_mpyi
	add	r12, r10
	mov	36(r10), r12
	mov	r12, 6(r1)
	mov	34(r10), r12
	mov	r12, 4(r1)
	mov	32(r10), r12
	mov	r12, 2(r1)
	mov	6(r1), r12
	mov	&unsafe, r13
	mov	r12, 3108(r13)
	mov	&unsafe, r12
	mov	6(r1), r13
	mov	r13, 3120(r12)
	mov	4(r1), r13
	mov	r13, 3118(r12)
	mov	2(r1), r13
	mov	r13, 3116(r12)
	mov	0(r1), r12
	mov	&unsafe, r13
	mov	r12, 3112(r13)
	mov	6(r1), r12
	mov	&unsafe, r13
	mov	r12, 3110(r13)
	mov	&unsafe, r12
	mov	3106(r12), r13
	inc	r13
	mov	r13, 3106(r12)
	add	#8, r1
	pop	r10
	ret
.Lfunc_end7:
	.size	task_compress, .Lfunc_end7-task_compress
                                        ; -- End function
	.globl	task_find_sibling       ; -- Begin function task_find_sibling
	.p2align	1
	.type	task_find_sibling,@function
task_find_sibling:                      ; @task_find_sibling
.Lfunc_begin8:
; %bb.0:                                ; %entry
	push	r10
	sub	#6, r1
	mov	&unsafe, r12
	mov	3108(r12), r12
	tst	r12
	jeq	.LBB8_7
	jmp	.LBB8_1
.LBB8_1:                                ; %if.then
	mov	&unsafe, r12
	mov	3108(r12), r12
	mov	r12, 2(r1)
	mov	&unsafe, r10
	mov	2(r1), r12
	mov	#6, r13
	call	#__mspabi_mpyi
	add	r12, r10
	add	#32, r10
	mov	r10, 4(r1)
	mov	4(r1), r12
	mov	0(r12), r12
	mov	&unsafe, r13
	mov	22(r13), r13
	cmp	r13, r12
	jne	.LBB8_3
	jmp	.LBB8_2
.LBB8_2:                                ; %if.then7
	mov	&unsafe, r12
	mov	3108(r12), r13
	mov	r13, 3114(r12)
	mov	&unsafe, r12
	mov	#1, 3514(r12)
	jmp	.LBB8_6
.LBB8_3:                                ; %if.else
	mov	4(r1), r12
	mov	2(r12), r12
	tst	r12
	jeq	.LBB8_5
	jmp	.LBB8_4
.LBB8_4:                                ; %if.then14
	mov	4(r1), r12
	mov	2(r12), r12
	mov	&unsafe, r13
	mov	r12, 3108(r13)
	mov	&unsafe, r12
	mov	#2, 3514(r12)
	jmp	.LBB8_5
.LBB8_5:                                ; %if.end
	jmp	.LBB8_6
.LBB8_6:                                ; %if.end20
	jmp	.LBB8_7
.LBB8_7:                                ; %if.end21
	mov	&unsafe, r12
	mov	22(r12), r12
	mov	r12, 0(r1)
	mov	0(r1), r12
	mov	&unsafe, r13
	mov	r12, 3114(r13)
	mov	&unsafe, r12
	mov	3110(r12), r12
	tst	r12
	jne	.LBB8_9
	jmp	.LBB8_8
.LBB8_8:                                ; %if.then28
	mov	&unsafe, r12
	mov	#3, 3514(r12)
	jmp	.LBB8_10
.LBB8_9:                                ; %if.else31
	mov	&unsafe, r12
	mov	#4, 3514(r12)
	jmp	.LBB8_10
.LBB8_10:                               ; %if.end34
	add	#6, r1
	pop	r10
	ret
.Lfunc_end8:
	.size	task_find_sibling, .Lfunc_end8-task_find_sibling
                                        ; -- End function
	.globl	task_add_node           ; -- Begin function task_add_node
	.p2align	1
	.type	task_add_node,@function
task_add_node:                          ; @task_add_node
.Lfunc_begin9:
; %bb.0:                                ; %entry
	push	r10
	sub	#12, r1
	mov	&unsafe, r12
	mov	3108(r12), r12
	mov	r12, 8(r1)
	mov	&unsafe, r10
	mov	8(r1), r12
	mov	#6, r13
	call	#__mspabi_mpyi
	add	r12, r10
	add	#32, r10
	mov	r10, 10(r1)
	mov	10(r1), r12
	mov	2(r12), r12
	tst	r12
	jeq	.LBB9_2
	jmp	.LBB9_1
.LBB9_1:                                ; %if.then
	mov	10(r1), r12
	mov	2(r12), r12
	mov	r12, 6(r1)
	mov	6(r1), r12
	mov	&unsafe, r13
	mov	r12, 3108(r13)
	jmp	.LBB9_3
.LBB9_2:                                ; %if.else
	mov	10(r1), r12
	mov	4(r12), r13
	mov	r13, 4(r1)
	mov	2(r12), r13
	mov	r13, 2(r1)
	mov	0(r12), r12
	mov	r12, 0(r1)
	mov	&unsafe, r12
	mov	4(r1), r13
	mov	r13, 3510(r12)
	mov	2(r1), r13
	mov	r13, 3508(r12)
	mov	0(r1), r13
	mov	r13, 3506(r12)
	jmp	.LBB9_3
.LBB9_3:                                ; %if.end
	add	#12, r1
	pop	r10
	ret
.Lfunc_end9:
	.size	task_add_node, .Lfunc_end9-task_add_node
                                        ; -- End function
	.globl	task_add_insert         ; -- Begin function task_add_insert
	.p2align	1
	.type	task_add_insert,@function
task_add_insert:                        ; @task_add_insert
.Lfunc_begin10:
; %bb.0:                                ; %entry
	push	r10
	sub	#24, r1
	mov	&unsafe, r12
	mov	30(r12), r12
	cmp	#512, r12
	jne	.LBB10_3
	jmp	.LBB10_1
.LBB10_1:                               ; %if.then
	jmp	.LBB10_2
.LBB10_2:                               ; %while.body
                                        ; =>This Inner Loop Header: Depth=1
	jmp	.LBB10_2
.LBB10_3:                               ; %if.end
	mov	&unsafe, r12
	mov	30(r12), r12
	mov	r12, 22(r1)
	mov	&unsafe, r12
	mov	22(r12), r12
	mov	r12, 16(r1)
	clr	18(r1)
	clr	20(r1)
	mov	&unsafe, r12
	mov	3120(r12), r12
	tst	r12
	jne	.LBB10_5
	jmp	.LBB10_4
.LBB10_4:                               ; %if.then9
	mov	&unsafe, r12
	mov	3120(r12), r13
	mov	r13, 14(r1)
	mov	3118(r12), r13
	mov	r13, 12(r1)
	mov	3116(r12), r12
	mov	r12, 10(r1)
	mov	22(r1), r12
	mov	r12, 14(r1)
	mov	&unsafe, r12
	mov	3112(r12), r12
	mov	r12, 8(r1)
	mov	&unsafe, r10
	mov	8(r1), r12
	mov	#6, r13
	call	#__mspabi_mpyi
	add	r12, r10
	mov	14(r1), r12
	mov	r12, 36(r10)
	mov	12(r1), r12
	mov	r12, 34(r10)
	mov	10(r1), r12
	mov	r12, 32(r10)
	jmp	.LBB10_6
.LBB10_5:                               ; %if.else
	mov	&unsafe, r12
	mov	3108(r12), r12
	mov	r12, 6(r1)
	mov	&unsafe, r12
	mov	3510(r12), r13
	mov	r13, 4(r1)
	mov	3508(r12), r13
	mov	r13, 2(r1)
	mov	3506(r12), r12
	mov	r12, 0(r1)
	mov	22(r1), r12
	mov	r12, 2(r1)
	mov	&unsafe, r10
	mov	6(r1), r12
	mov	#6, r13
	call	#__mspabi_mpyi
	add	r12, r10
	mov	4(r1), r12
	mov	r12, 36(r10)
	mov	2(r1), r12
	mov	r12, 34(r10)
	mov	0(r1), r12
	mov	r12, 32(r10)
	jmp	.LBB10_6
.LBB10_6:                               ; %if.end22
	mov	&unsafe, r10
	mov	22(r1), r12
	mov	#6, r13
	call	#__mspabi_mpyi
	add	r12, r10
	mov	20(r1), r12
	mov	r12, 36(r10)
	mov	18(r1), r12
	mov	r12, 34(r10)
	mov	16(r1), r12
	mov	r12, 32(r10)
	mov	&unsafe, r12
	mov	3112(r12), r13
	mov	r13, 3512(r12)
	mov	&unsafe, r12
	mov	30(r12), r13
	inc	r13
	mov	r13, 30(r12)
	add	#24, r1
	pop	r10
	ret
.Lfunc_end10:
	.size	task_add_insert, .Lfunc_end10-task_add_insert
                                        ; -- End function
	.globl	task_append_compressed  ; -- Begin function task_append_compressed
	.p2align	1
	.type	task_append_compressed,@function
task_append_compressed:                 ; @task_append_compressed
.Lfunc_begin11:
; %bb.0:                                ; %entry
	push	r10
	sub	#2, r1
	mov	&unsafe, r12
	mov	28(r12), r12
	mov	r12, 0(r1)
	mov	&unsafe, r10
	mov	0(r1), r12
	mov	#6, r13
	call	#__mspabi_mpyi
	mov	r10, r13
	add	r12, r13
	mov	3512(r10), r12
	mov	r12, 3122(r13)
	mov	&unsafe, r12
	mov	28(r12), r13
	inc	r13
	mov	r13, 28(r12)
	cmp	#64, r13
	jne	.LBB11_2
	jmp	.LBB11_1
.LBB11_1:                               ; %if.then
	jmp	.LBB11_3
.LBB11_2:                               ; %if.else
	jmp	.LBB11_3
.LBB11_3:                               ; %if.end
	add	#2, r1
	pop	r10
	ret
.Lfunc_end11:
	.size	task_append_compressed, .Lfunc_end11-task_append_compressed
                                        ; -- End function
	.globl	task_done               ; -- Begin function task_done
	.p2align	1
	.type	task_done,@function
task_done:                              ; @task_done
.Lfunc_begin12:
; %bb.0:                                ; %entry
	clr	r12
	call	#exit
.Lfunc_end12:
	.size	task_done, .Lfunc_end12-task_done
                                        ; -- End function
	.globl	task_commit             ; -- Begin function task_commit
	.p2align	1
	.type	task_commit,@function
task_commit:                            ; @task_commit
.Lfunc_begin13:
; %bb.0:                                ; %entry
	ret
.Lfunc_end13:
	.size	task_commit, .Lfunc_end13-task_commit
                                        ; -- End function
	.globl	main                    ; -- Begin function main
	.p2align	1
	.type	main,@function
main:                                   ; @main
.Lfunc_begin14:
; %bb.0:                                ; %entry
	sub	#130, r1
	clr	128(r1)
	mov	#1, &camel
	mov	#camel+2, &safe
	mov	#camel+3520, &unsafe
	call	#camel_init
	call	#task_init
	jmp	.LBB14_1
.LBB14_1:                               ; %do.body
	mov	&camel, r12
	cmp	#1, r12
	jne	.LBB14_3
	jmp	.LBB14_2
.LBB14_2:                               ; %if.then
	mov	#camel+3520, &safe
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
	mov	#3516, r13
	call	#__fast_hw_crc
	mov	r12, &tmp_stack_buf_crc
	mov	&tmp_stack_buf_crc, r12
	mov	&safe, r13
	mov	r12, 3516(r13)
	mov	#2, &camel
	jmp	.LBB14_4
.LBB14_3:                               ; %if.else
	mov	#camel+2, &safe
	mov	#camel+3520, &unsafe
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
	mov	#3516, r13
	call	#__fast_hw_crc
	mov	r12, &tmp_stack_buf_crc
	mov	&tmp_stack_buf_crc, r12
	mov	&safe, r13
	mov	r12, 3516(r13)
	mov	#1, &camel
	jmp	.LBB14_4
.LBB14_4:                               ; %if.end
	jmp	.LBB14_5
.LBB14_5:                               ; %do.end
	call	#task_commit
	jmp	.LBB14_6
.LBB14_6:                               ; %while.cond
                                        ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB14_16 Depth 2
                                        ;       Child Loop BB14_27 Depth 3
	mov	&safe, r12
	mov	28(r12), r12
	cmp	#64, r12
	jlo	.LBB14_7
	br	#.LBB14_56
.LBB14_7:                               ; %while.cond
                                        ;   in Loop: Header=BB14_6 Depth=1
	jmp	.LBB14_8
.LBB14_8:                               ; %while.body
                                        ;   in Loop: Header=BB14_6 Depth=1
	mov	&safe, r12
	mov	3514(r12), r12
	cmp	#1, r12
	jne	.LBB14_15
	jmp	.LBB14_9
.LBB14_9:                               ; %if.then20
                                        ;   in Loop: Header=BB14_6 Depth=1
	call	#task_measure_temp
	jmp	.LBB14_10
.LBB14_10:                              ; %do.body21
                                        ;   in Loop: Header=BB14_6 Depth=1
	mov	&camel, r12
	cmp	#1, r12
	jne	.LBB14_12
	jmp	.LBB14_11
.LBB14_11:                              ; %if.then23
                                        ;   in Loop: Header=BB14_6 Depth=1
	mov	#camel+3520, &safe
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
	mov	#3516, r13
	call	#__fast_hw_crc
	mov	r12, &tmp_stack_buf_crc
	mov	&tmp_stack_buf_crc, r12
	mov	&safe, r13
	mov	r12, 3516(r13)
	mov	#2, &camel
	jmp	.LBB14_13
.LBB14_12:                              ; %if.else36
                                        ;   in Loop: Header=BB14_6 Depth=1
	mov	#camel+2, &safe
	mov	#camel+3520, &unsafe
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
	mov	#3516, r13
	call	#__fast_hw_crc
	mov	r12, &tmp_stack_buf_crc
	mov	&tmp_stack_buf_crc, r12
	mov	&safe, r13
	mov	r12, 3516(r13)
	mov	#1, &camel
	jmp	.LBB14_13
.LBB14_13:                              ; %if.end49
                                        ;   in Loop: Header=BB14_6 Depth=1
	jmp	.LBB14_14
.LBB14_14:                              ; %do.end50
                                        ;   in Loop: Header=BB14_6 Depth=1
	call	#task_commit
	jmp	.LBB14_15
.LBB14_15:                              ; %if.end51
                                        ;   in Loop: Header=BB14_6 Depth=1
	jmp	.LBB14_16
.LBB14_16:                              ; %while.body53
                                        ;   Parent Loop BB14_6 Depth=1
                                        ; =>  This Loop Header: Depth=2
                                        ;       Child Loop BB14_27 Depth 3
	call	#task_letterize
	jmp	.LBB14_17
.LBB14_17:                              ; %do.body54
                                        ;   in Loop: Header=BB14_16 Depth=2
	mov	&camel, r12
	cmp	#1, r12
	jne	.LBB14_19
	jmp	.LBB14_18
.LBB14_18:                              ; %if.then56
                                        ;   in Loop: Header=BB14_16 Depth=2
	mov	#camel+3520, &safe
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
	mov	#3516, r13
	call	#__fast_hw_crc
	mov	r12, &tmp_stack_buf_crc
	mov	&tmp_stack_buf_crc, r12
	mov	&safe, r13
	mov	r12, 3516(r13)
	mov	#2, &camel
	jmp	.LBB14_20
.LBB14_19:                              ; %if.else69
                                        ;   in Loop: Header=BB14_16 Depth=2
	mov	#camel+2, &safe
	mov	#camel+3520, &unsafe
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
	mov	#3516, r13
	call	#__fast_hw_crc
	mov	r12, &tmp_stack_buf_crc
	mov	&tmp_stack_buf_crc, r12
	mov	&safe, r13
	mov	r12, 3516(r13)
	mov	#1, &camel
	jmp	.LBB14_20
.LBB14_20:                              ; %if.end82
                                        ;   in Loop: Header=BB14_16 Depth=2
	jmp	.LBB14_21
.LBB14_21:                              ; %do.end83
                                        ;   in Loop: Header=BB14_16 Depth=2
	call	#task_commit
	call	#task_compress
	jmp	.LBB14_22
.LBB14_22:                              ; %do.body84
                                        ;   in Loop: Header=BB14_16 Depth=2
	mov	&camel, r12
	cmp	#1, r12
	jne	.LBB14_24
	jmp	.LBB14_23
.LBB14_23:                              ; %if.then86
                                        ;   in Loop: Header=BB14_16 Depth=2
	mov	#camel+3520, &safe
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
	mov	#3516, r13
	call	#__fast_hw_crc
	mov	r12, &tmp_stack_buf_crc
	mov	&tmp_stack_buf_crc, r12
	mov	&safe, r13
	mov	r12, 3516(r13)
	mov	#2, &camel
	jmp	.LBB14_25
.LBB14_24:                              ; %if.else99
                                        ;   in Loop: Header=BB14_16 Depth=2
	mov	#camel+2, &safe
	mov	#camel+3520, &unsafe
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
	mov	#3516, r13
	call	#__fast_hw_crc
	mov	r12, &tmp_stack_buf_crc
	mov	&tmp_stack_buf_crc, r12
	mov	&safe, r13
	mov	r12, 3516(r13)
	mov	#1, &camel
	jmp	.LBB14_25
.LBB14_25:                              ; %if.end112
                                        ;   in Loop: Header=BB14_16 Depth=2
	jmp	.LBB14_26
.LBB14_26:                              ; %do.end113
                                        ;   in Loop: Header=BB14_16 Depth=2
	call	#task_commit
	jmp	.LBB14_27
.LBB14_27:                              ; %while.body115
                                        ;   Parent Loop BB14_6 Depth=1
                                        ;     Parent Loop BB14_16 Depth=2
                                        ; =>    This Inner Loop Header: Depth=3
	call	#task_find_sibling
	jmp	.LBB14_28
.LBB14_28:                              ; %do.body116
                                        ;   in Loop: Header=BB14_27 Depth=3
	mov	&camel, r12
	cmp	#1, r12
	jne	.LBB14_30
	jmp	.LBB14_29
.LBB14_29:                              ; %if.then118
                                        ;   in Loop: Header=BB14_27 Depth=3
	mov	#camel+3520, &safe
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
	mov	#3516, r13
	call	#__fast_hw_crc
	mov	r12, &tmp_stack_buf_crc
	mov	&tmp_stack_buf_crc, r12
	mov	&safe, r13
	mov	r12, 3516(r13)
	mov	#2, &camel
	jmp	.LBB14_31
.LBB14_30:                              ; %if.else131
                                        ;   in Loop: Header=BB14_27 Depth=3
	mov	#camel+2, &safe
	mov	#camel+3520, &unsafe
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
	mov	#3516, r13
	call	#__fast_hw_crc
	mov	r12, &tmp_stack_buf_crc
	mov	&tmp_stack_buf_crc, r12
	mov	&safe, r13
	mov	r12, 3516(r13)
	mov	#1, &camel
	jmp	.LBB14_31
.LBB14_31:                              ; %if.end144
                                        ;   in Loop: Header=BB14_27 Depth=3
	jmp	.LBB14_32
.LBB14_32:                              ; %do.end145
                                        ;   in Loop: Header=BB14_27 Depth=3
	call	#task_commit
	mov	&safe, r12
	mov	3514(r12), r12
	cmp	#2, r12
	jeq	.LBB14_34
	jmp	.LBB14_33
.LBB14_33:                              ; %if.then149
                                        ;   in Loop: Header=BB14_16 Depth=2
	jmp	.LBB14_35
.LBB14_34:                              ; %if.end150
                                        ;   in Loop: Header=BB14_27 Depth=3
	jmp	.LBB14_27
.LBB14_35:                              ; %while.end
                                        ;   in Loop: Header=BB14_16 Depth=2
	mov	&safe, r12
	mov	3514(r12), r12
	cmp	#1, r12
	jeq	.LBB14_37
	jmp	.LBB14_36
.LBB14_36:                              ; %if.then154
                                        ;   in Loop: Header=BB14_6 Depth=1
	jmp	.LBB14_38
.LBB14_37:                              ; %if.end155
                                        ;   in Loop: Header=BB14_16 Depth=2
	jmp	.LBB14_16
.LBB14_38:                              ; %while.end156
                                        ;   in Loop: Header=BB14_6 Depth=1
	mov	&safe, r12
	mov	3514(r12), r12
	cmp	#3, r12
	jne	.LBB14_40
	jmp	.LBB14_39
.LBB14_39:                              ; %if.then160
                                        ;   in Loop: Header=BB14_6 Depth=1
	call	#task_add_node
	jmp	.LBB14_40
.LBB14_40:                              ; %if.end161
                                        ;   in Loop: Header=BB14_6 Depth=1
	jmp	.LBB14_41
.LBB14_41:                              ; %do.body162
                                        ;   in Loop: Header=BB14_6 Depth=1
	mov	&camel, r12
	cmp	#1, r12
	jne	.LBB14_43
	jmp	.LBB14_42
.LBB14_42:                              ; %if.then164
                                        ;   in Loop: Header=BB14_6 Depth=1
	mov	#camel+3520, &safe
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
	mov	#3516, r13
	call	#__fast_hw_crc
	mov	r12, &tmp_stack_buf_crc
	mov	&tmp_stack_buf_crc, r12
	mov	&safe, r13
	mov	r12, 3516(r13)
	mov	#2, &camel
	jmp	.LBB14_44
.LBB14_43:                              ; %if.else177
                                        ;   in Loop: Header=BB14_6 Depth=1
	mov	#camel+2, &safe
	mov	#camel+3520, &unsafe
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
	mov	#3516, r13
	call	#__fast_hw_crc
	mov	r12, &tmp_stack_buf_crc
	mov	&tmp_stack_buf_crc, r12
	mov	&safe, r13
	mov	r12, 3516(r13)
	mov	#1, &camel
	jmp	.LBB14_44
.LBB14_44:                              ; %if.end190
                                        ;   in Loop: Header=BB14_6 Depth=1
	jmp	.LBB14_45
.LBB14_45:                              ; %do.end191
                                        ;   in Loop: Header=BB14_6 Depth=1
	call	#task_commit
	call	#task_add_insert
	jmp	.LBB14_46
.LBB14_46:                              ; %do.body192
                                        ;   in Loop: Header=BB14_6 Depth=1
	mov	&camel, r12
	cmp	#1, r12
	jne	.LBB14_48
	jmp	.LBB14_47
.LBB14_47:                              ; %if.then194
                                        ;   in Loop: Header=BB14_6 Depth=1
	mov	#camel+3520, &safe
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
	mov	#3516, r13
	call	#__fast_hw_crc
	mov	r12, &tmp_stack_buf_crc
	mov	&tmp_stack_buf_crc, r12
	mov	&safe, r13
	mov	r12, 3516(r13)
	mov	#2, &camel
	jmp	.LBB14_49
.LBB14_48:                              ; %if.else207
                                        ;   in Loop: Header=BB14_6 Depth=1
	mov	#camel+2, &safe
	mov	#camel+3520, &unsafe
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
	mov	#3516, r13
	call	#__fast_hw_crc
	mov	r12, &tmp_stack_buf_crc
	mov	&tmp_stack_buf_crc, r12
	mov	&safe, r13
	mov	r12, 3516(r13)
	mov	#1, &camel
	jmp	.LBB14_49
.LBB14_49:                              ; %if.end220
                                        ;   in Loop: Header=BB14_6 Depth=1
	jmp	.LBB14_50
.LBB14_50:                              ; %do.end221
                                        ;   in Loop: Header=BB14_6 Depth=1
	call	#task_commit
	call	#task_append_compressed
	jmp	.LBB14_51
.LBB14_51:                              ; %do.body222
                                        ;   in Loop: Header=BB14_6 Depth=1
	mov	&camel, r12
	cmp	#1, r12
	jne	.LBB14_53
	jmp	.LBB14_52
.LBB14_52:                              ; %if.then224
                                        ;   in Loop: Header=BB14_6 Depth=1
	mov	#camel+3520, &safe
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
	mov	#3516, r13
	call	#__fast_hw_crc
	mov	r12, &tmp_stack_buf_crc
	mov	&tmp_stack_buf_crc, r12
	mov	&safe, r13
	mov	r12, 3516(r13)
	mov	#2, &camel
	jmp	.LBB14_54
.LBB14_53:                              ; %if.else237
                                        ;   in Loop: Header=BB14_6 Depth=1
	mov	#camel+2, &safe
	mov	#camel+3520, &unsafe
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
	mov	#3516, r13
	call	#__fast_hw_crc
	mov	r12, &tmp_stack_buf_crc
	mov	&tmp_stack_buf_crc, r12
	mov	&safe, r13
	mov	r12, 3516(r13)
	mov	#1, &camel
	jmp	.LBB14_54
.LBB14_54:                              ; %if.end250
                                        ;   in Loop: Header=BB14_6 Depth=1
	jmp	.LBB14_55
.LBB14_55:                              ; %do.end251
                                        ;   in Loop: Header=BB14_6 Depth=1
	call	#task_commit
	br	#.LBB14_6
.LBB14_56:                              ; %while.end252
	call	#task_done
	mov	128(r1), r12
	add	#130, r1
	ret
.Lfunc_end14:
	.size	main, .Lfunc_end14-main
                                        ; -- End function
	.type	camel,@object           ; @camel
	.comm	camel,7038,2
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
