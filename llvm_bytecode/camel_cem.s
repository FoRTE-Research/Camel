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
	mov	#camel+928, &unsafe
	mov	#camel+2, &safe
	jmp	.LBB1_5
.LBB1_2:                                ; %if.else
	cmp	#2, &camel
	jne	.LBB1_4
; %bb.3:                                ; %if.then2
	mov	#camel+2, &unsafe
	mov	#camel+928, &safe
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
	mov	#924, r13
	call	#__fast_hw_crc
	mov	r12, &tmp_stack_buf_crc
	mov	&safe, r13
	cmp	924(r13), r12
	jne	.LBB1_7
; %bb.6:                                ; %if.then10
	mov	&safe, r13
	mov	&unsafe, r12
	mov	#926, r14
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
	mov	#camel+928, &safe
	mov	#camel+928, r12
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
	mov	#924, r13
	call	#__fast_hw_crc
	mov	r12, &tmp_stack_buf_crc
	mov	&safe, r13
	mov	r12, 924(r13)
	mov	#2, &camel
	add	#16, r1
	ret
.LBB2_2:                                ; %if.else
	mov	#camel+928, &unsafe
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
	mov	#924, r13
	call	#__fast_hw_crc
	mov	r12, &tmp_stack_buf_crc
	mov	&safe, r13
	mov	r12, 924(r13)
	mov	#1, &camel
	add	#16, r1
	ret
.Lfunc_end2:
	.size	commit, .Lfunc_end2-commit
                                        ; -- End function
	.globl	task_init               ; -- Begin function task_init
	.p2align	1
	.type	task_init,@function
task_init:                              ; @task_init
.Lfunc_begin3:
; %bb.0:                                ; %entry
	push	r10
	push	r9
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
.LBB3_1:                                ; %while.cond
                                        ; =>This Inner Loop Header: Depth=1
	mov	&unsafe, r12
	cmp	#64, 22(r12)
	jhs	.LBB3_3
; %bb.2:                                ; %while.body
                                        ;   in Loop: Header=BB3_1 Depth=1
	mov	&unsafe, r10
	mov	22(r10), r9
	mov	r9, 2(r1)
	clr	6(r1)
	clr	4(r1)
	mov	22(r10), r12
	mov	r12, 0(r1)
	mov	#6, r13
	call	#__mspabi_mpyi
	add	r10, r12
	mov	r9, 32(r12)
	clr	36(r12)
	clr	34(r12)
	mov	&unsafe, r12
	inc	22(r12)
	jmp	.LBB3_1
.LBB3_3:                                ; %while.end
	mov	&unsafe, r12
	mov	#64, 30(r12)
	add	#8, r1
	pop	r9
	pop	r10
	ret
.Lfunc_end3:
	.size	task_init, .Lfunc_end3-task_init
                                        ; -- End function
	.globl	task_sample             ; -- Begin function task_sample
	.p2align	1
	.type	task_sample,@function
task_sample:                            ; @task_sample
.Lfunc_begin4:
; %bb.0:                                ; %entry
	sub	#2, r1
	mov	&unsafe, r12
	mov	#1, r13
	add	24(r12), r13
	mov	r13, 0(r1)
	cmp	#2, r13
	jne	.LBB4_2
; %bb.1:                                ; %if.then
	clr	0(r1)
.LBB4_2:                                ; %if.end
	mov	&unsafe, r12
	tst	24(r12)
	jeq	.LBB4_4
; %bb.3:                                ; %if.else
	mov	&unsafe, r12
	mov	0(r1), 24(r12)
	mov	&unsafe, r12
	mov	#1, 922(r12)
	add	#2, r1
	ret
.LBB4_4:                                ; %if.then4
	mov	&unsafe, r12
	mov	0(r1), 24(r12)
	mov	&unsafe, r12
	clr	922(r12)
	add	#2, r1
	ret
.Lfunc_end4:
	.size	task_sample, .Lfunc_end4-task_sample
                                        ; -- End function
	.globl	task_measure_temp       ; -- Begin function task_measure_temp
	.p2align	1
	.type	task_measure_temp,@function
task_measure_temp:                      ; @task_measure_temp
.Lfunc_begin5:
; %bb.0:                                ; %entry
	sub	#4, r1
	mov	&unsafe, r12
	mov	26(r12), r12
	mov	r12, 2(r1)
	call	#acquire_sample
	mov	r12, 0(r1)
	mov	r12, 2(r1)
	mov	&unsafe, r13
	mov	r12, 26(r13)
	mov	&unsafe, r12
	mov	0(r1), 800(r12)
	add	#4, r1
	ret
.Lfunc_end5:
	.size	task_measure_temp, .Lfunc_end5-task_measure_temp
                                        ; -- End function
	.p2align	1               ; -- Begin function acquire_sample
	.type	acquire_sample,@function
acquire_sample:                         ; @acquire_sample
.Lfunc_begin6:
; %bb.0:                                ; %entry
	sub	#4, r1
	mov	r12, 2(r1)
	inc	r12
	and	#3, r12
	add	#4, r1
	ret
.Lfunc_end6:
	.size	acquire_sample, .Lfunc_end6-acquire_sample
                                        ; -- End function
	.globl	task_letterize          ; -- Begin function task_letterize
	.p2align	1
	.type	task_letterize,@function
task_letterize:                         ; @task_letterize
.Lfunc_begin7:
; %bb.0:                                ; %entry
	sub	#6, r1
	mov	&unsafe, r12
	mov	24(r12), r12
	mov	r12, 4(r1)
	tst	r12
	jeq	.LBB7_2
; %bb.1:                                ; %if.else
	add	#-1, 4(r1)
	jmp	.LBB7_3
.LBB7_2:                                ; %if.then
	mov	#2, 4(r1)
.LBB7_3:                                ; %if.end
	mov	4(r1), r12
	add	r12, r12
	add	r12, r12
	add	r12, r12
	mov	r12, 2(r1)
	mov	#63, r13
	cmp.b	#0, r12
	jeq	.LBB7_6
; %bb.4:
	mov.b	r12, r14
.LBB7_5:                                ; %if.end
                                        ; =>This Inner Loop Header: Depth=1
	add	r13, r13
	sub.b	#1, r14
	jne	.LBB7_5
.LBB7_6:                                ; %if.end
	mov	&unsafe, r14
	and	800(r14), r13
	cmp.b	#0, r12
	jeq	.LBB7_8
.LBB7_7:                                ; %if.end
                                        ; =>This Inner Loop Header: Depth=1
	clrc
	rrc	r13
	sub.b	#1, r12
	jne	.LBB7_7
.LBB7_8:                                ; %if.end
	mov	r13, 0(r1)
	mov	r13, 22(r14)
	add	#6, r1
	ret
.Lfunc_end7:
	.size	task_letterize, .Lfunc_end7-task_letterize
                                        ; -- End function
	.globl	task_compress           ; -- Begin function task_compress
	.p2align	1
	.type	task_compress,@function
task_compress:                          ; @task_compress
.Lfunc_begin8:
; %bb.0:                                ; %entry
	push	r10
	sub	#8, r1
	mov	&unsafe, r10
	mov	810(r10), r12
	mov	r12, 0(r1)
	mov	#6, r13
	call	#__mspabi_mpyi
	add	r10, r12
	mov	32(r12), 2(r1)
	mov	34(r12), 4(r1)
	mov	36(r12), r12
	mov	r12, 6(r1)
	mov	r12, 804(r10)
	mov	&unsafe, r12
	mov	6(r1), 816(r12)
	mov	4(r1), 814(r12)
	mov	2(r1), 812(r12)
	mov	&unsafe, r12
	mov	0(r1), 808(r12)
	mov	&unsafe, r12
	mov	6(r1), 806(r12)
	mov	&unsafe, r12
	inc	802(r12)
	add	#8, r1
	pop	r10
	ret
.Lfunc_end8:
	.size	task_compress, .Lfunc_end8-task_compress
                                        ; -- End function
	.globl	task_find_sibling       ; -- Begin function task_find_sibling
	.p2align	1
	.type	task_find_sibling,@function
task_find_sibling:                      ; @task_find_sibling
.Lfunc_begin9:
; %bb.0:                                ; %entry
	push	r10
	sub	#10, r1
	mov	&unsafe, r12
	tst	804(r12)
	jeq	.LBB9_8
; %bb.1:                                ; %if.then
	mov	&unsafe, r10
	mov	804(r10), r12
	mov	r12, 6(r1)
	mov	#6, r13
	call	#__mspabi_mpyi
	add	r10, r12
	mov	r12, r13
	add	#32, r13
	mov	r13, 8(r1)
	cmp	22(r10), 32(r12)
	jne	.LBB9_3
; %bb.2:                                ; %if.then7
	mov	&unsafe, r12
	mov	804(r12), 810(r12)
	mov	&unsafe, r12
	clr	922(r12)
	jmp	.LBB9_5
.LBB9_3:                                ; %if.else
	mov	8(r1), r12
	tst	2(r12)
	jeq	.LBB9_6
; %bb.4:                                ; %if.then14
	mov	&unsafe, r12
	mov	8(r1), r13
	mov	2(r13), 804(r12)
	mov	&unsafe, r12
	mov	#1, 922(r12)
.LBB9_5:                                ; %cleanup
	clr	4(r1)
	mov	#1, 2(r1)
	jmp	.LBB9_7
.LBB9_6:                                ; %if.end
	clr	4(r1)
	clr	2(r1)
.LBB9_7:                                ; %cleanup
	mov	2(r1), r12
	bis	4(r1), r12
	tst	r12
	jne	.LBB9_12
.LBB9_8:                                ; %if.end21
	mov	&unsafe, r12
	mov	22(r12), r13
	mov	r13, 0(r1)
	mov	r13, 810(r12)
	mov	&unsafe, r12
	tst	806(r12)
	jeq	.LBB9_10
; %bb.9:                                ; %if.else31
	mov	&unsafe, r12
	mov	#3, 922(r12)
	jmp	.LBB9_11
.LBB9_10:                               ; %if.then28
	mov	&unsafe, r12
	mov	#2, 922(r12)
.LBB9_11:                               ; %if.end34
	clr	4(r1)
	clr	2(r1)
.LBB9_12:                               ; %cleanup35
	add	#10, r1
	pop	r10
	ret
.Lfunc_end9:
	.size	task_find_sibling, .Lfunc_end9-task_find_sibling
                                        ; -- End function
	.globl	task_add_node           ; -- Begin function task_add_node
	.p2align	1
	.type	task_add_node,@function
task_add_node:                          ; @task_add_node
.Lfunc_begin10:
; %bb.0:                                ; %entry
	push	r10
	sub	#12, r1
	mov	&unsafe, r10
	mov	804(r10), r12
	mov	r12, 8(r1)
	mov	#6, r13
	call	#__mspabi_mpyi
	add	r10, r12
	mov	r12, r13
	add	#32, r13
	mov	r13, 10(r1)
	tst	34(r12)
	jeq	.LBB10_2
; %bb.1:                                ; %if.then
	mov	10(r1), r12
	mov	2(r12), r12
	mov	r12, 6(r1)
	mov	&unsafe, r13
	mov	r12, 804(r13)
	mov	&unsafe, r12
	clr	922(r12)
	jmp	.LBB10_3
.LBB10_2:                               ; %if.else
	mov	10(r1), r12
	mov	0(r12), r13
	mov	r13, 0(r1)
	mov	2(r12), r14
	mov	r14, 2(r1)
	mov	4(r12), r12
	mov	r12, 4(r1)
	mov	&unsafe, r15
	mov	r14, 916(r15)
	mov	r12, 918(r15)
	mov	r13, 914(r15)
	mov	&unsafe, r12
	mov	#1, 922(r12)
.LBB10_3:                               ; %if.end
	add	#12, r1
	pop	r10
	ret
.Lfunc_end10:
	.size	task_add_node, .Lfunc_end10-task_add_node
                                        ; -- End function
	.globl	task_add_insert         ; -- Begin function task_add_insert
	.p2align	1
	.type	task_add_insert,@function
task_add_insert:                        ; @task_add_insert
.Lfunc_begin11:
; %bb.0:                                ; %entry
	push	r10
	push	r9
	push	r8
	push	r7
	sub	#20, r1
	mov	&unsafe, r12
	cmp	#128, 30(r12)
	jne	.LBB11_3
; %bb.1:                                ; %if.then
	call	#task_done
.LBB11_2:                               ; %while.body
                                        ; =>This Inner Loop Header: Depth=1
	jmp	.LBB11_2
.LBB11_3:                               ; %if.end
	mov	&unsafe, r12
	mov	30(r12), 18(r1)
	mov	22(r12), 12(r1)
	clr	16(r1)
	clr	14(r1)
	mov	812(r12), 6(r1)
	mov	814(r12), 8(r1)
	mov	816(r12), r12
	mov	r12, 10(r1)
	tst	r12
	jeq	.LBB11_5
; %bb.4:                                ; %if.else
	mov	&unsafe, r10
	mov	916(r10), 2(r1)
	mov	918(r10), r9
	mov	914(r10), r8
	mov	18(r1), r7
	mov	r7, 2(r1)
	mov	r8, 0(r1)
	mov	r9, 4(r1)
	mov	804(r10), r12
	mov	#6, r13
	call	#__mspabi_mpyi
	add	r10, r12
	mov	r8, 32(r12)
	mov	r7, 34(r12)
	mov	r9, 36(r12)
	jmp	.LBB11_6
.LBB11_5:                               ; %if.then9
	mov	&unsafe, r10
	mov	816(r10), 4(r1)
	mov	814(r10), r9
	mov	812(r10), r8
	mov	18(r1), r7
	mov	r7, 4(r1)
	mov	r8, 0(r1)
	mov	r9, 2(r1)
	mov	808(r10), r12
	mov	#6, r13
	call	#__mspabi_mpyi
	add	r10, r12
	mov	r8, 32(r12)
	mov	r9, 34(r12)
	mov	r7, 36(r12)
.LBB11_6:                               ; %if.end22
	mov	&unsafe, r10
	mov	806(r10), r12
	mov	#6, r13
	call	#__mspabi_mpyi
	add	r10, r12
	mov	12(r1), 32(r12)
	mov	14(r1), 34(r12)
	mov	16(r1), 36(r12)
	mov	&unsafe, r12
	mov	808(r12), 920(r12)
	mov	&unsafe, r12
	inc	30(r12)
	add	#20, r1
	pop	r7
	pop	r8
	pop	r9
	pop	r10
	ret
.Lfunc_end11:
	.size	task_add_insert, .Lfunc_end11-task_add_insert
                                        ; -- End function
	.globl	task_append_compressed  ; -- Begin function task_append_compressed
	.p2align	1
	.type	task_append_compressed,@function
task_append_compressed:                 ; @task_append_compressed
.Lfunc_begin12:
; %bb.0:                                ; %entry
	push	r10
	mov	&unsafe, r10
	mov	28(r10), r12
	mov	#6, r13
	call	#__mspabi_mpyi
	add	r10, r12
	mov	920(r10), 818(r12)
	mov	&unsafe, r12
	inc	28(r12)
	pop	r10
	ret
.Lfunc_end12:
	.size	task_append_compressed, .Lfunc_end12-task_append_compressed
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
	sub	#2, r1
	mov	#1, &camel
	clr	0(r1)
	mov	#camel+2, &safe
	mov	#camel+928, &unsafe
	call	#camel_init
	call	#task_init
	jmp	.LBB15_2
.LBB15_1:                               ; %if.end23
                                        ;   in Loop: Header=BB15_2 Depth=1
	call	#task_add_insert
	call	#commit
	call	#task_commit
	call	#task_append_compressed
.LBB15_2:                               ; %while.cond
                                        ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB15_5 Depth 2
                                        ;       Child Loop BB15_6 Depth 3
                                        ;     Child Loop BB15_9 Depth 2
	call	#commit
	call	#task_commit
	mov	&safe, r12
	cmp	#16, 28(r12)
	jhs	.LBB15_10
; %bb.3:                                ; %while.body
                                        ;   in Loop: Header=BB15_2 Depth=1
	call	#task_sample
	call	#commit
	call	#task_commit
	mov	&safe, r12
	tst	922(r12)
	jne	.LBB15_5
; %bb.4:                                ; %if.then
                                        ;   in Loop: Header=BB15_2 Depth=1
	call	#task_measure_temp
	call	#commit
	call	#task_commit
.LBB15_5:                               ; %while.body4
                                        ;   Parent Loop BB15_2 Depth=1
                                        ; =>  This Loop Header: Depth=2
                                        ;       Child Loop BB15_6 Depth 3
	call	#task_letterize
	call	#commit
	call	#task_commit
	call	#task_compress
	call	#commit
	call	#task_commit
.LBB15_6:                               ; %do.body
                                        ;   Parent Loop BB15_2 Depth=1
                                        ;     Parent Loop BB15_5 Depth=2
                                        ; =>    This Inner Loop Header: Depth=3
	call	#task_find_sibling
	call	#commit
	call	#task_commit
	mov	&safe, r12
	cmp	#1, 922(r12)
	jeq	.LBB15_6
; %bb.7:                                ; %do.end
                                        ;   in Loop: Header=BB15_5 Depth=2
	mov	&safe, r12
	tst	922(r12)
	jeq	.LBB15_5
; %bb.8:                                ; %if.then11
                                        ;   in Loop: Header=BB15_2 Depth=1
	mov	&safe, r12
	cmp	#3, 922(r12)
	jne	.LBB15_1
.LBB15_9:                               ; %do.body17
                                        ;   Parent Loop BB15_2 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	call	#task_add_node
	call	#commit
	call	#task_commit
	mov	&safe, r12
	tst	922(r12)
	jeq	.LBB15_9
	jmp	.LBB15_1
.LBB15_10:                              ; %while.end24
	call	#task_done
	mov	0(r1), r12
	add	#2, r1
	ret
.Lfunc_end15:
	.size	main, .Lfunc_end15-main
                                        ; -- End function
	.type	camel,@object           ; @camel
	.comm	camel,1854,2
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
