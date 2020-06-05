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
	mov	&camel, r12
	cmp	#1, r12
	jne	.LBB1_2
	jmp	.LBB1_1
.LBB1_1:                                ; %if.then
	mov	#camel+2, &safe
	mov	#camel+928, &unsafe
	jmp	.LBB1_6
.LBB1_2:                                ; %if.else
	mov	&camel, r12
	cmp	#2, r12
	jne	.LBB1_4
	jmp	.LBB1_3
.LBB1_3:                                ; %if.then2
	mov	#camel+928, &safe
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
	.globl	task_init               ; -- Begin function task_init
	.p2align	1
	.type	task_init,@function
task_init:                              ; @task_init
.Lfunc_begin2:
; %bb.0:                                ; %entry
	push	r10
	sub	#8, r1
	mov	&unsafe, r12
	clr	810(r12)
	mov	&unsafe, r12
	clr	28(r12)
	mov	&unsafe, r12
	clr	22(r12)
	mov	&unsafe, r12
	clr	26(r12)
	mov	&unsafe, r12
	clr	24(r12)
	mov	&unsafe, r12
	mov	#1, 802(r12)
	jmp	.LBB2_1
.LBB2_1:                                ; %while.cond
                                        ; =>This Inner Loop Header: Depth=1
	mov	&unsafe, r12
	mov	22(r12), r12
	cmp	#64, r12
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
	mov	#64, 30(r12)
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
	clr	922(r12)
	jmp	.LBB3_5
.LBB3_4:                                ; %if.else
	mov	0(r1), r12
	mov	&unsafe, r13
	mov	r12, 24(r13)
	mov	&unsafe, r12
	mov	#1, 922(r12)
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
	mov	r12, 800(r13)
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
	mov	800(r12), r12
	mov.b	2(r1), r13
	mov	#63, r14
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
	mov	810(r12), r12
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
	mov	r12, 804(r13)
	mov	&unsafe, r12
	mov	6(r1), r13
	mov	r13, 816(r12)
	mov	4(r1), r13
	mov	r13, 814(r12)
	mov	2(r1), r13
	mov	r13, 812(r12)
	mov	0(r1), r12
	mov	&unsafe, r13
	mov	r12, 808(r13)
	mov	6(r1), r12
	mov	&unsafe, r13
	mov	r12, 806(r13)
	mov	&unsafe, r12
	mov	802(r12), r13
	inc	r13
	mov	r13, 802(r12)
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
	mov	804(r12), r12
	tst	r12
	jeq	.LBB8_7
	jmp	.LBB8_1
.LBB8_1:                                ; %if.then
	mov	&unsafe, r12
	mov	804(r12), r12
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
	mov	804(r12), r13
	mov	r13, 810(r12)
	mov	&unsafe, r12
	clr	922(r12)
	jmp	.LBB8_10
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
	mov	r12, 804(r13)
	mov	&unsafe, r12
	mov	#1, 922(r12)
	jmp	.LBB8_10
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
	mov	r12, 810(r13)
	mov	&unsafe, r12
	mov	806(r12), r12
	tst	r12
	jne	.LBB8_9
	jmp	.LBB8_8
.LBB8_8:                                ; %if.then28
	mov	&unsafe, r12
	mov	#2, 922(r12)
	jmp	.LBB8_10
.LBB8_9:                                ; %if.else31
	mov	&unsafe, r12
	mov	#3, 922(r12)
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
	mov	804(r12), r12
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
	mov	r12, 804(r13)
	mov	&unsafe, r12
	clr	922(r12)
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
	mov	r13, 918(r12)
	mov	2(r1), r13
	mov	r13, 916(r12)
	mov	0(r1), r13
	mov	r13, 914(r12)
	mov	&unsafe, r12
	mov	#1, 922(r12)
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
	sub	#26, r1
	mov	&unsafe, r12
	mov	30(r12), r12
	cmp	#128, r12
	jne	.LBB10_3
	jmp	.LBB10_1
.LBB10_1:                               ; %if.then
	call	#task_done
	jmp	.LBB10_2
.LBB10_2:                               ; %while.body
                                        ; =>This Inner Loop Header: Depth=1
	jmp	.LBB10_2
.LBB10_3:                               ; %if.end
	mov	&unsafe, r12
	mov	30(r12), r12
	mov	r12, 24(r1)
	mov	&unsafe, r12
	mov	22(r12), r12
	mov	r12, 18(r1)
	clr	20(r1)
	clr	22(r1)
	mov	&unsafe, r12
	mov	816(r12), r13
	mov	r13, 16(r1)
	mov	814(r12), r13
	mov	r13, 14(r1)
	mov	812(r12), r12
	mov	r12, 12(r1)
	mov	16(r1), r12
	tst	r12
	jne	.LBB10_5
	jmp	.LBB10_4
.LBB10_4:                               ; %if.then9
	mov	&unsafe, r12
	mov	816(r12), r13
	mov	r13, 10(r1)
	mov	814(r12), r13
	mov	r13, 8(r1)
	mov	812(r12), r12
	mov	r12, 6(r1)
	mov	24(r1), r12
	mov	r12, 10(r1)
	mov	&unsafe, r10
	mov	808(r10), r12
	mov	#6, r13
	call	#__mspabi_mpyi
	add	r12, r10
	mov	10(r1), r12
	mov	r12, 36(r10)
	mov	8(r1), r12
	mov	r12, 34(r10)
	mov	6(r1), r12
	mov	r12, 32(r10)
	jmp	.LBB10_6
.LBB10_5:                               ; %if.else
	mov	&unsafe, r12
	mov	918(r12), r13
	mov	r13, 4(r1)
	mov	916(r12), r13
	mov	r13, 2(r1)
	mov	914(r12), r12
	mov	r12, 0(r1)
	mov	24(r1), r12
	mov	r12, 2(r1)
	mov	&unsafe, r10
	mov	804(r10), r12
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
	mov	806(r10), r12
	mov	#6, r13
	call	#__mspabi_mpyi
	add	r12, r10
	mov	22(r1), r12
	mov	r12, 36(r10)
	mov	20(r1), r12
	mov	r12, 34(r10)
	mov	18(r1), r12
	mov	r12, 32(r10)
	mov	&unsafe, r12
	mov	808(r12), r13
	mov	r13, 920(r12)
	mov	&unsafe, r12
	mov	30(r12), r13
	inc	r13
	mov	r13, 30(r12)
	add	#26, r1
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
	mov	&unsafe, r10
	mov	28(r10), r12
	mov	#6, r13
	call	#__mspabi_mpyi
	mov	r10, r13
	add	r12, r13
	mov	920(r10), r12
	mov	r12, 818(r13)
	mov	&unsafe, r12
	mov	28(r12), r13
	inc	r13
	mov	r13, 28(r12)
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
	sub	#2, r1
	clr	0(r1)
	mov	#1, &camel
	mov	#camel+2, &safe
	mov	#camel+928, &unsafe
	call	#camel_init
	call	#task_init
	jmp	.LBB14_1
.LBB14_1:                               ; %do.body
	mov	&camel, r12
	cmp	#1, r12
	jne	.LBB14_3
	jmp	.LBB14_2
.LBB14_2:                               ; %if.then
	mov	#camel+928, &safe
	mov	#camel+2, &unsafe
	mov	&safe, r12
	call	#__dump_registers
	mov	#2, &camel
	jmp	.LBB14_4
.LBB14_3:                               ; %if.else
	mov	#camel+2, &safe
	mov	#camel+928, &unsafe
	mov	&safe, r12
	call	#__dump_registers
	mov	#1, &camel
	jmp	.LBB14_4
.LBB14_4:                               ; %if.end
	jmp	.LBB14_5
.LBB14_5:                               ; %do.end
	call	#task_commit
	jmp	.LBB14_6
.LBB14_6:                               ; %while.cond
                                        ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB14_20 Depth 2
                                        ;       Child Loop BB14_31 Depth 3
                                        ;     Child Loop BB14_43 Depth 2
	mov	&safe, r12
	mov	28(r12), r12
	cmp	#16, r12
	jhs	.LBB14_62
	jmp	.LBB14_7
.LBB14_7:                               ; %while.body
                                        ;   in Loop: Header=BB14_6 Depth=1
	call	#task_sample
	jmp	.LBB14_8
.LBB14_8:                               ; %do.body4
                                        ;   in Loop: Header=BB14_6 Depth=1
	mov	&camel, r12
	cmp	#1, r12
	jne	.LBB14_10
	jmp	.LBB14_9
.LBB14_9:                               ; %if.then6
                                        ;   in Loop: Header=BB14_6 Depth=1
	mov	#camel+928, &safe
	mov	#camel+2, &unsafe
	mov	&safe, r12
	call	#__dump_registers
	mov	#2, &camel
	jmp	.LBB14_11
.LBB14_10:                              ; %if.else9
                                        ;   in Loop: Header=BB14_6 Depth=1
	mov	#camel+2, &safe
	mov	#camel+928, &unsafe
	mov	&safe, r12
	call	#__dump_registers
	mov	#1, &camel
	jmp	.LBB14_11
.LBB14_11:                              ; %if.end12
                                        ;   in Loop: Header=BB14_6 Depth=1
	jmp	.LBB14_12
.LBB14_12:                              ; %do.end13
                                        ;   in Loop: Header=BB14_6 Depth=1
	call	#task_commit
	mov	&safe, r12
	mov	922(r12), r12
	tst	r12
	jne	.LBB14_19
	jmp	.LBB14_13
.LBB14_13:                              ; %if.then16
                                        ;   in Loop: Header=BB14_6 Depth=1
	call	#task_measure_temp
	jmp	.LBB14_14
.LBB14_14:                              ; %do.body17
                                        ;   in Loop: Header=BB14_6 Depth=1
	mov	&camel, r12
	cmp	#1, r12
	jne	.LBB14_16
	jmp	.LBB14_15
.LBB14_15:                              ; %if.then19
                                        ;   in Loop: Header=BB14_6 Depth=1
	mov	#camel+928, &safe
	mov	#camel+2, &unsafe
	mov	&safe, r12
	call	#__dump_registers
	mov	#2, &camel
	jmp	.LBB14_17
.LBB14_16:                              ; %if.else22
                                        ;   in Loop: Header=BB14_6 Depth=1
	mov	#camel+2, &safe
	mov	#camel+928, &unsafe
	mov	&safe, r12
	call	#__dump_registers
	mov	#1, &camel
	jmp	.LBB14_17
.LBB14_17:                              ; %if.end25
                                        ;   in Loop: Header=BB14_6 Depth=1
	jmp	.LBB14_18
.LBB14_18:                              ; %do.end26
                                        ;   in Loop: Header=BB14_6 Depth=1
	call	#task_commit
	jmp	.LBB14_19
.LBB14_19:                              ; %if.end27
                                        ;   in Loop: Header=BB14_6 Depth=1
	jmp	.LBB14_20
.LBB14_20:                              ; %while.body29
                                        ;   Parent Loop BB14_6 Depth=1
                                        ; =>  This Loop Header: Depth=2
                                        ;       Child Loop BB14_31 Depth 3
	call	#task_letterize
	jmp	.LBB14_21
.LBB14_21:                              ; %do.body30
                                        ;   in Loop: Header=BB14_20 Depth=2
	mov	&camel, r12
	cmp	#1, r12
	jne	.LBB14_23
	jmp	.LBB14_22
.LBB14_22:                              ; %if.then32
                                        ;   in Loop: Header=BB14_20 Depth=2
	mov	#camel+928, &safe
	mov	#camel+2, &unsafe
	mov	&safe, r12
	call	#__dump_registers
	mov	#2, &camel
	jmp	.LBB14_24
.LBB14_23:                              ; %if.else35
                                        ;   in Loop: Header=BB14_20 Depth=2
	mov	#camel+2, &safe
	mov	#camel+928, &unsafe
	mov	&safe, r12
	call	#__dump_registers
	mov	#1, &camel
	jmp	.LBB14_24
.LBB14_24:                              ; %if.end38
                                        ;   in Loop: Header=BB14_20 Depth=2
	jmp	.LBB14_25
.LBB14_25:                              ; %do.end39
                                        ;   in Loop: Header=BB14_20 Depth=2
	call	#task_commit
	call	#task_compress
	jmp	.LBB14_26
.LBB14_26:                              ; %do.body40
                                        ;   in Loop: Header=BB14_20 Depth=2
	mov	&camel, r12
	cmp	#1, r12
	jne	.LBB14_28
	jmp	.LBB14_27
.LBB14_27:                              ; %if.then42
                                        ;   in Loop: Header=BB14_20 Depth=2
	mov	#camel+928, &safe
	mov	#camel+2, &unsafe
	mov	&safe, r12
	call	#__dump_registers
	mov	#2, &camel
	jmp	.LBB14_29
.LBB14_28:                              ; %if.else45
                                        ;   in Loop: Header=BB14_20 Depth=2
	mov	#camel+2, &safe
	mov	#camel+928, &unsafe
	mov	&safe, r12
	call	#__dump_registers
	mov	#1, &camel
	jmp	.LBB14_29
.LBB14_29:                              ; %if.end48
                                        ;   in Loop: Header=BB14_20 Depth=2
	jmp	.LBB14_30
.LBB14_30:                              ; %do.end49
                                        ;   in Loop: Header=BB14_20 Depth=2
	call	#task_commit
	jmp	.LBB14_31
.LBB14_31:                              ; %do.body50
                                        ;   Parent Loop BB14_6 Depth=1
                                        ;     Parent Loop BB14_20 Depth=2
                                        ; =>    This Inner Loop Header: Depth=3
	call	#task_find_sibling
	jmp	.LBB14_32
.LBB14_32:                              ; %do.body51
                                        ;   in Loop: Header=BB14_31 Depth=3
	mov	&camel, r12
	cmp	#1, r12
	jne	.LBB14_34
	jmp	.LBB14_33
.LBB14_33:                              ; %if.then53
                                        ;   in Loop: Header=BB14_31 Depth=3
	mov	#camel+928, &safe
	mov	#camel+2, &unsafe
	mov	&safe, r12
	call	#__dump_registers
	mov	#2, &camel
	jmp	.LBB14_35
.LBB14_34:                              ; %if.else56
                                        ;   in Loop: Header=BB14_31 Depth=3
	mov	#camel+2, &safe
	mov	#camel+928, &unsafe
	mov	&safe, r12
	call	#__dump_registers
	mov	#1, &camel
	jmp	.LBB14_35
.LBB14_35:                              ; %if.end59
                                        ;   in Loop: Header=BB14_31 Depth=3
	jmp	.LBB14_36
.LBB14_36:                              ; %do.end60
                                        ;   in Loop: Header=BB14_31 Depth=3
	call	#task_commit
	jmp	.LBB14_37
.LBB14_37:                              ; %do.cond
                                        ;   in Loop: Header=BB14_31 Depth=3
	mov	&safe, r12
	mov	922(r12), r12
	cmp	#1, r12
	jeq	.LBB14_31
	jmp	.LBB14_38
.LBB14_38:                              ; %do.end64
                                        ;   in Loop: Header=BB14_20 Depth=2
	mov	&safe, r12
	mov	922(r12), r12
	tst	r12
	jeq	.LBB14_40
	jmp	.LBB14_39
.LBB14_39:                              ; %if.then68
                                        ;   in Loop: Header=BB14_6 Depth=1
	jmp	.LBB14_41
.LBB14_40:                              ; %if.end69
                                        ;   in Loop: Header=BB14_20 Depth=2
	jmp	.LBB14_20
.LBB14_41:                              ; %while.end
                                        ;   in Loop: Header=BB14_6 Depth=1
	mov	&safe, r12
	mov	922(r12), r12
	cmp	#3, r12
	jne	.LBB14_51
	jmp	.LBB14_42
.LBB14_42:                              ; %if.then73
                                        ;   in Loop: Header=BB14_6 Depth=1
	jmp	.LBB14_43
.LBB14_43:                              ; %do.body74
                                        ;   Parent Loop BB14_6 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	call	#task_add_node
	jmp	.LBB14_44
.LBB14_44:                              ; %do.body75
                                        ;   in Loop: Header=BB14_43 Depth=2
	mov	&camel, r12
	cmp	#1, r12
	jne	.LBB14_46
	jmp	.LBB14_45
.LBB14_45:                              ; %if.then77
                                        ;   in Loop: Header=BB14_43 Depth=2
	mov	#camel+928, &safe
	mov	#camel+2, &unsafe
	mov	&safe, r12
	call	#__dump_registers
	mov	#2, &camel
	jmp	.LBB14_47
.LBB14_46:                              ; %if.else80
                                        ;   in Loop: Header=BB14_43 Depth=2
	mov	#camel+2, &safe
	mov	#camel+928, &unsafe
	mov	&safe, r12
	call	#__dump_registers
	mov	#1, &camel
	jmp	.LBB14_47
.LBB14_47:                              ; %if.end83
                                        ;   in Loop: Header=BB14_43 Depth=2
	jmp	.LBB14_48
.LBB14_48:                              ; %do.end85
                                        ;   in Loop: Header=BB14_43 Depth=2
	call	#task_commit
	jmp	.LBB14_49
.LBB14_49:                              ; %do.cond86
                                        ;   in Loop: Header=BB14_43 Depth=2
	mov	&safe, r12
	mov	922(r12), r12
	tst	r12
	jeq	.LBB14_43
	jmp	.LBB14_50
.LBB14_50:                              ; %do.end90
                                        ;   in Loop: Header=BB14_6 Depth=1
	jmp	.LBB14_51
.LBB14_51:                              ; %if.end91
                                        ;   in Loop: Header=BB14_6 Depth=1
	call	#task_add_insert
	jmp	.LBB14_52
.LBB14_52:                              ; %do.body92
                                        ;   in Loop: Header=BB14_6 Depth=1
	mov	&camel, r12
	cmp	#1, r12
	jne	.LBB14_54
	jmp	.LBB14_53
.LBB14_53:                              ; %if.then94
                                        ;   in Loop: Header=BB14_6 Depth=1
	mov	#camel+928, &safe
	mov	#camel+2, &unsafe
	mov	&safe, r12
	call	#__dump_registers
	mov	#2, &camel
	jmp	.LBB14_55
.LBB14_54:                              ; %if.else97
                                        ;   in Loop: Header=BB14_6 Depth=1
	mov	#camel+2, &safe
	mov	#camel+928, &unsafe
	mov	&safe, r12
	call	#__dump_registers
	mov	#1, &camel
	jmp	.LBB14_55
.LBB14_55:                              ; %if.end100
                                        ;   in Loop: Header=BB14_6 Depth=1
	jmp	.LBB14_56
.LBB14_56:                              ; %do.end102
                                        ;   in Loop: Header=BB14_6 Depth=1
	call	#task_commit
	call	#task_append_compressed
	jmp	.LBB14_57
.LBB14_57:                              ; %do.body103
                                        ;   in Loop: Header=BB14_6 Depth=1
	mov	&camel, r12
	cmp	#1, r12
	jne	.LBB14_59
	jmp	.LBB14_58
.LBB14_58:                              ; %if.then105
                                        ;   in Loop: Header=BB14_6 Depth=1
	mov	#camel+928, &safe
	mov	#camel+2, &unsafe
	mov	&safe, r12
	call	#__dump_registers
	mov	#2, &camel
	jmp	.LBB14_60
.LBB14_59:                              ; %if.else108
                                        ;   in Loop: Header=BB14_6 Depth=1
	mov	#camel+2, &safe
	mov	#camel+928, &unsafe
	mov	&safe, r12
	call	#__dump_registers
	mov	#1, &camel
	jmp	.LBB14_60
.LBB14_60:                              ; %if.end111
                                        ;   in Loop: Header=BB14_6 Depth=1
	jmp	.LBB14_61
.LBB14_61:                              ; %do.end113
                                        ;   in Loop: Header=BB14_6 Depth=1
	call	#task_commit
	jmp	.LBB14_6
.LBB14_62:                              ; %while.end114
	call	#task_done
	mov	0(r1), r12
	add	#2, r1
	ret
.Lfunc_end14:
	.size	main, .Lfunc_end14-main
                                        ; -- End function
	.type	camel,@object           ; @camel
	.comm	camel,1854,2
	.type	safe,@object            ; @safe
	.comm	safe,2,2
	.type	unsafe,@object          ; @unsafe
	.comm	unsafe,2,2
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
