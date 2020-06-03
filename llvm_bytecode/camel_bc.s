	.text
	.file	"camel_bc.c"
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
	mov	#camel+48, &unsafe
	jmp	.LBB1_6
.LBB1_2:                                ; %if.else
	mov	&camel, r12
	cmp	#2, r12
	jne	.LBB1_4
	jmp	.LBB1_3
.LBB1_3:                                ; %if.then2
	mov	#camel+48, &safe
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
	mov	#44, r13
	call	#__fast_hw_crc
	mov	r12, &tmp_stack_buf_crc
	mov	&tmp_stack_buf_crc, r12
	mov	&safe, r13
	mov	44(r13), r13
	cmp	r13, r12
	jne	.LBB1_8
	jmp	.LBB1_7
.LBB1_7:                                ; %if.then10
	mov	&unsafe, r12
	mov	&safe, r13
	mov	#46, r14
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
	mov	&unsafe, r12
	clr	36(r12)
	mov	&unsafe, r12
	clr	22(r12)
	mov	&unsafe, r12
	clr	24(r12)
	mov	&unsafe, r12
	clr	26(r12)
	mov	&unsafe, r12
	clr	28(r12)
	mov	&unsafe, r12
	clr	30(r12)
	mov	&unsafe, r12
	clr	32(r12)
	mov	&unsafe, r12
	clr	34(r12)
	ret
.Lfunc_end2:
	.size	task_init, .Lfunc_end2-task_init
                                        ; -- End function
	.globl	task_select_func        ; -- Begin function task_select_func
	.p2align	1
	.type	task_select_func,@function
task_select_func:                       ; @task_select_func
.Lfunc_begin3:
; %bb.0:                                ; %entry
	mov	&unsafe, r12
	clr	40(r12)
	mov	#4, 38(r12)
	mov	&unsafe, r12
	clr	42(r12)
	mov	&unsafe, r12
	mov	36(r12), r13
	inc	r13
	mov	r13, 36(r12)
	ret
.Lfunc_end3:
	.size	task_select_func, .Lfunc_end3-task_select_func
                                        ; -- End function
	.globl	task_bit_count          ; -- Begin function task_bit_count
	.p2align	1
	.type	task_bit_count,@function
task_bit_count:                         ; @task_bit_count
.Lfunc_begin4:
; %bb.0:                                ; %entry
	sub	#6, r1
	mov	&unsafe, r12
	mov	38(r12), r13
	mov	40(r12), r12
	mov	r12, 4(r1)
	mov	r13, 2(r1)
	mov	&unsafe, r12
	mov	40(r12), r13
	mov	38(r12), r14
	mov	r14, r15
	add	#13, r15
	cmp	r14, r15
	mov	#1, r14
	bic	r2, r14
	add	r14, r13
	mov	r15, 38(r12)
	mov	r13, 40(r12)
	clr	0(r1)
	mov	4(r1), r12
	mov	2(r1), r13
	bis	r12, r13
	tst	r13
	jeq	.LBB4_5
	jmp	.LBB4_1
.LBB4_1:                                ; %if.then
	jmp	.LBB4_2
.LBB4_2:                                ; %do.body
                                        ; =>This Inner Loop Header: Depth=1
	mov	0(r1), r12
	inc	r12
	mov	r12, 0(r1)
	jmp	.LBB4_3
.LBB4_3:                                ; %do.cond
                                        ;   in Loop: Header=BB4_2 Depth=1
	mov	4(r1), r12
	mov	2(r1), r13
	mov	r13, r14
	add	#-1, r14
	cmp	r13, r14
	mov	#1, r15
	bic	r2, r15
	mov	r12, r11
	add	r15, r11
	add	#-1, r11
	and	r11, r12
	and	r14, r13
	mov	r13, 2(r1)
	mov	r12, 4(r1)
	bis	r12, r13
	tst	r13
	jne	.LBB4_2
	jmp	.LBB4_4
.LBB4_4:                                ; %do.end
	jmp	.LBB4_5
.LBB4_5:                                ; %if.end
	mov	0(r1), r12
	mov	&unsafe, r13
	mov	22(r13), r14
	add	r12, r14
	mov	r14, 22(r13)
	mov	&unsafe, r12
	mov	42(r12), r13
	inc	r13
	mov	r13, 42(r12)
	add	#6, r1
	ret
.Lfunc_end4:
	.size	task_bit_count, .Lfunc_end4-task_bit_count
                                        ; -- End function
	.globl	task_bitcount           ; -- Begin function task_bitcount
	.p2align	1
	.type	task_bitcount,@function
task_bitcount:                          ; @task_bitcount
.Lfunc_begin5:
; %bb.0:                                ; %entry
	sub	#4, r1
	mov	&unsafe, r12
	mov	38(r12), r13
	mov	40(r12), r12
	mov	r12, 2(r1)
	mov	r13, 0(r1)
	mov	&unsafe, r13
	mov	40(r13), r14
	mov	38(r13), r12
	mov	r12, r15
	add	#13, r15
	cmp	r12, r15
	mov	#1, r12
	mov	#1, r11
	bic	r2, r11
	add	r11, r14
	mov	r15, 38(r13)
	mov	r14, 40(r13)
	mov	0(r1), r13
	mov	2(r1), r14
	mov	r14, r15
	and	#-21846, r15
	mov	r13, r11
	and	#-21846, r11
	clrc
	rrc	r11
	clrc
	rrc	r15
	and	#21845, r13
	and	#21845, r14
	add	r14, r15
	mov	r11, r14
	add	r13, r14
	cmp	r11, r14
	mov	#1, r13
	bic	r2, r13
	add	r13, r15
	mov	r14, 0(r1)
	mov	r15, 2(r1)
	mov	0(r1), r13
	mov	2(r1), r14
	mov	r14, r15
	and	#-13108, r15
	mov	r13, r11
	and	#-13108, r11
	clrc
	rrc	r11
	rra	r11
	clrc
	rrc	r15
	rra	r15
	and	#13107, r13
	and	#13107, r14
	add	r14, r15
	mov	r11, r14
	add	r13, r14
	cmp	r11, r14
	mov	#1, r13
	bic	r2, r13
	add	r13, r15
	mov	r14, 0(r1)
	mov	r15, 2(r1)
	mov	0(r1), r14
	mov	2(r1), r15
	mov	r15, r13
	and	#-3856, r13
	mov	r14, r11
	and	#-3856, r11
	clrc
	rrc	r11
	rra	r11
	rra	r11
	rra	r11
	clrc
	rrc	r13
	rra	r13
	rra	r13
	rra	r13
	and	#3855, r14
	and	#3855, r15
	add	r15, r13
	mov	r11, r15
	add	r14, r15
	cmp	r11, r15
	mov	#1, r14
	bic	r2, r14
	add	r14, r13
	mov	r15, 0(r1)
	mov	r13, 2(r1)
	mov	0(r1), r13
	mov	2(r1), r14
	mov	r14, r15
	and	#-256, r15
	mov	r13, r11
	swpb	r11
	mov.b	r11, r11
	swpb	r15
	mov.b	r13, r13
	mov.b	r14, r14
	add	r14, r15
	mov	r11, r14
	add	r13, r14
	cmp	r11, r14
	mov	#1, r13
	bic	r2, r13
	add	r13, r15
	mov	r14, 0(r1)
	mov	r15, 2(r1)
	mov	0(r1), r13
	mov	2(r1), r14
	mov	r14, r15
	add	r13, r15
	cmp	r14, r15
	bic	r2, r12
	mov	r15, 0(r1)
	mov	r12, 2(r1)
	mov	0(r1), r12
	mov	&unsafe, r13
	mov	24(r13), r14
	add	r12, r14
	mov	r14, 24(r13)
	mov	&unsafe, r12
	mov	42(r12), r13
	inc	r13
	mov	r13, 42(r12)
	add	#4, r1
	ret
.Lfunc_end5:
	.size	task_bitcount, .Lfunc_end5-task_bitcount
                                        ; -- End function
	.globl	recursive_cnt           ; -- Begin function recursive_cnt
	.p2align	1
	.type	recursive_cnt,@function
recursive_cnt:                          ; @recursive_cnt
.Lfunc_begin6:
; %bb.0:                                ; %entry
	sub	#6, r1
	mov	r13, 4(r1)
	mov	r12, 2(r1)
	mov	2(r1), r12
	and	#15, r12
	mov.b	bits(r12), r12
	sxt	r12
	mov	r12, 0(r1)
	mov	4(r1), r13
	mov	2(r1), r12
	clrc
	rrc	r12
	rra	r12
	rra	r12
	rra	r12
	mov	r13, r14
	mov.b	r14, r14
	swpb	r14
	add	r14, r14
	add	r14, r14
	add	r14, r14
	add	r14, r14
	bis	r14, r12
	clrc
	rrc	r13
	rra	r13
	rra	r13
	rra	r13
	mov	r13, 4(r1)
	mov	r12, 2(r1)
	bis	r13, r12
	tst	r12
	jeq	.LBB6_2
	jmp	.LBB6_1
.LBB6_1:                                ; %if.then
	mov	4(r1), r13
	mov	2(r1), r12
	call	#recursive_cnt
	mov	0(r1), r13
	add	r12, r13
	mov	r13, 0(r1)
	jmp	.LBB6_2
.LBB6_2:                                ; %if.end
	mov	0(r1), r12
	add	#6, r1
	ret
.Lfunc_end6:
	.size	recursive_cnt, .Lfunc_end6-recursive_cnt
                                        ; -- End function
	.globl	task_ntbl_bitcnt        ; -- Begin function task_ntbl_bitcnt
	.p2align	1
	.type	task_ntbl_bitcnt,@function
task_ntbl_bitcnt:                       ; @task_ntbl_bitcnt
.Lfunc_begin7:
; %bb.0:                                ; %entry
	mov	&unsafe, r12
	mov	40(r12), r13
	mov	38(r12), r12
	call	#recursive_cnt
	mov	&unsafe, r13
	mov	26(r13), r14
	add	r12, r14
	mov	r14, 26(r13)
	mov	&unsafe, r12
	mov	40(r12), r13
	mov	38(r12), r14
	mov	r14, r15
	add	#13, r15
	cmp	r14, r15
	mov	#1, r14
	bic	r2, r14
	add	r14, r13
	mov	r15, 38(r12)
	mov	r13, 40(r12)
	mov	&unsafe, r12
	mov	42(r12), r13
	inc	r13
	mov	r13, 42(r12)
	ret
.Lfunc_end7:
	.size	task_ntbl_bitcnt, .Lfunc_end7-task_ntbl_bitcnt
                                        ; -- End function
	.globl	task_ntbl_bitcount      ; -- Begin function task_ntbl_bitcount
	.p2align	1
	.type	task_ntbl_bitcount,@function
task_ntbl_bitcount:                     ; @task_ntbl_bitcount
.Lfunc_begin8:
; %bb.0:                                ; %entry
	mov	&unsafe, r12
	mov	40(r12), r14
	mov	38(r12), r15
	mov	r15, r13
	and	#15, r13
	mov.b	bits(r13), r13
	sxt	r13
	mov	r15, r11
	and	#240, r11
	clrc
	rrc	r11
	rra	r11
	rra	r11
	rra	r11
	mov.b	bits(r11), r11
	sxt	r11
	add	r11, r13
	mov	r15, r11
	and	#3840, r11
	swpb	r11
	mov.b	bits(r11), r11
	sxt	r11
	add	r11, r13
	swpb	r15
	mov.b	r15, r15
	clrc
	rrc	r15
	rra	r15
	rra	r15
	rra	r15
	mov.b	bits(r15), r15
	sxt	r15
	add	r15, r13
	mov	r14, r15
	and	#15, r15
	mov.b	bits(r15), r15
	sxt	r15
	add	r15, r13
	mov	r14, r15
	and	#240, r15
	clrc
	rrc	r15
	rra	r15
	rra	r15
	rra	r15
	mov.b	bits(r15), r15
	sxt	r15
	add	r15, r13
	mov	r14, r15
	and	#3840, r15
	swpb	r15
	mov.b	bits(r15), r15
	sxt	r15
	add	r15, r13
	swpb	r14
	mov.b	r14, r14
	clrc
	rrc	r14
	rra	r14
	rra	r14
	rra	r14
	mov.b	bits(r14), r14
	sxt	r14
	add	r14, r13
	mov	28(r12), r14
	add	r13, r14
	mov	r14, 28(r12)
	mov	&unsafe, r12
	mov	40(r12), r13
	mov	38(r12), r14
	mov	r14, r15
	add	#13, r15
	cmp	r14, r15
	mov	#1, r14
	bic	r2, r14
	add	r14, r13
	mov	r15, 38(r12)
	mov	r13, 40(r12)
	mov	&unsafe, r12
	mov	42(r12), r13
	inc	r13
	mov	r13, 42(r12)
	ret
.Lfunc_end8:
	.size	task_ntbl_bitcount, .Lfunc_end8-task_ntbl_bitcount
                                        ; -- End function
	.globl	task_BW_btbl_bitcount   ; -- Begin function task_BW_btbl_bitcount
	.p2align	1
	.type	task_BW_btbl_bitcount,@function
task_BW_btbl_bitcount:                  ; @task_BW_btbl_bitcount
.Lfunc_begin9:
; %bb.0:                                ; %entry
	sub	#4, r1
	mov	&unsafe, r12
	mov	38(r12), r13
	mov	40(r12), r12
	mov	r12, 2(r1)
	mov	r13, 0(r1)
	mov.b	0(r1), r12
	mov.b	bits(r12), r12
	sxt	r12
	mov.b	1(r1), r13
	mov.b	bits(r13), r13
	sxt	r13
	add	r13, r12
	mov.b	3(r1), r13
	mov.b	bits(r13), r13
	sxt	r13
	add	r13, r12
	mov.b	2(r1), r13
	mov.b	bits(r13), r13
	sxt	r13
	add	r13, r12
	mov	&unsafe, r13
	mov	30(r13), r14
	add	r12, r14
	mov	r14, 30(r13)
	mov	&unsafe, r12
	mov	40(r12), r13
	mov	38(r12), r14
	mov	r14, r15
	add	#13, r15
	cmp	r14, r15
	mov	#1, r14
	bic	r2, r14
	add	r14, r13
	mov	r15, 38(r12)
	mov	r13, 40(r12)
	mov	&unsafe, r12
	mov	42(r12), r13
	inc	r13
	mov	r13, 42(r12)
	add	#4, r1
	ret
.Lfunc_end9:
	.size	task_BW_btbl_bitcount, .Lfunc_end9-task_BW_btbl_bitcount
                                        ; -- End function
	.globl	task_AR_btbl_bitcount   ; -- Begin function task_AR_btbl_bitcount
	.p2align	1
	.type	task_AR_btbl_bitcount,@function
task_AR_btbl_bitcount:                  ; @task_AR_btbl_bitcount
.Lfunc_begin10:
; %bb.0:                                ; %entry
	sub	#4, r1
	mov	&unsafe, r12
	add	#38, r12
	mov	r12, 2(r1)
	mov	2(r1), r12
	mov	r12, r13
	inc	r13
	mov	r13, 2(r1)
	mov.b	0(r12), r12
	mov.b	bits(r12), r12
	sxt	r12
	mov	r12, 0(r1)
	mov	2(r1), r12
	mov	r12, r13
	inc	r13
	mov	r13, 2(r1)
	mov.b	0(r12), r12
	mov.b	bits(r12), r12
	sxt	r12
	mov	0(r1), r13
	add	r12, r13
	mov	r13, 0(r1)
	mov	2(r1), r12
	mov	r12, r13
	inc	r13
	mov	r13, 2(r1)
	mov.b	0(r12), r12
	mov.b	bits(r12), r12
	sxt	r12
	mov	0(r1), r13
	add	r12, r13
	mov	r13, 0(r1)
	mov	2(r1), r12
	mov.b	0(r12), r12
	mov.b	bits(r12), r12
	sxt	r12
	mov	0(r1), r13
	add	r12, r13
	mov	r13, 0(r1)
	mov	0(r1), r12
	mov	&unsafe, r13
	mov	32(r13), r14
	add	r12, r14
	mov	r14, 32(r13)
	mov	&unsafe, r12
	mov	40(r12), r13
	mov	38(r12), r14
	mov	r14, r15
	add	#13, r15
	cmp	r14, r15
	mov	#1, r14
	bic	r2, r14
	add	r14, r13
	mov	r15, 38(r12)
	mov	r13, 40(r12)
	mov	&unsafe, r12
	mov	42(r12), r13
	inc	r13
	mov	r13, 42(r12)
	add	#4, r1
	ret
.Lfunc_end10:
	.size	task_AR_btbl_bitcount, .Lfunc_end10-task_AR_btbl_bitcount
                                        ; -- End function
	.globl	task_bit_shifter        ; -- Begin function task_bit_shifter
	.p2align	1
	.type	task_bit_shifter,@function
task_bit_shifter:                       ; @task_bit_shifter
.Lfunc_begin11:
; %bb.0:                                ; %entry
	sub	#8, r1
	mov	&unsafe, r12
	mov	38(r12), r13
	mov	40(r12), r12
	mov	r12, 2(r1)
	mov	r13, 0(r1)
	clr	4(r1)
	clr	6(r1)
	jmp	.LBB11_1
.LBB11_1:                               ; %for.cond
                                        ; =>This Inner Loop Header: Depth=1
	mov	2(r1), r12
	mov	0(r1), r13
	bis	r12, r13
	clr.b	r12
	tst	r13
	jeq	.LBB11_3
	jmp	.LBB11_2
.LBB11_2:                               ; %land.rhs
                                        ;   in Loop: Header=BB11_1 Depth=1
	mov	6(r1), r12
	cmp	#32, r12
	mov	#1, r12
	bic	r2, r12
	jmp	.LBB11_3
.LBB11_3:                               ; %land.end
                                        ;   in Loop: Header=BB11_1 Depth=1
	bit	#1, r12
	jeq	.LBB11_6
	jmp	.LBB11_4
.LBB11_4:                               ; %for.body
                                        ;   in Loop: Header=BB11_1 Depth=1
	mov	0(r1), r12
	and	#1, r12
	mov	4(r1), r13
	add	r12, r13
	mov	r13, 4(r1)
	jmp	.LBB11_5
.LBB11_5:                               ; %for.inc
                                        ;   in Loop: Header=BB11_1 Depth=1
	mov	6(r1), r12
	inc	r12
	mov	r12, 6(r1)
	mov	2(r1), r12
	mov	0(r1), r13
	clrc
	rrc	r13
	mov	r12, r14
	mov.b	r14, r14
	swpb	r14
	add	r14, r14
	add	r14, r14
	add	r14, r14
	add	r14, r14
	add	r14, r14
	add	r14, r14
	add	r14, r14
	bis	r14, r13
	clrc
	rrc	r12
	mov	r12, 2(r1)
	mov	r13, 0(r1)
	jmp	.LBB11_1
.LBB11_6:                               ; %for.end
	mov	4(r1), r12
	mov	&unsafe, r13
	mov	34(r13), r14
	add	r12, r14
	mov	r14, 34(r13)
	mov	&unsafe, r12
	mov	40(r12), r13
	mov	38(r12), r14
	mov	r14, r15
	add	#13, r15
	cmp	r14, r15
	mov	#1, r14
	bic	r2, r14
	add	r14, r13
	mov	r15, 38(r12)
	mov	r13, 40(r12)
	mov	&unsafe, r12
	mov	42(r12), r13
	inc	r13
	mov	r13, 42(r12)
	add	#8, r1
	ret
.Lfunc_end11:
	.size	task_bit_shifter, .Lfunc_end11-task_bit_shifter
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
	mov	#camel+48, &unsafe
	call	#camel_init
	call	#task_init
	jmp	.LBB14_1
.LBB14_1:                               ; %while.body
                                        ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB14_33 Depth 2
                                        ;     Child Loop BB14_28 Depth 2
                                        ;     Child Loop BB14_23 Depth 2
                                        ;     Child Loop BB14_18 Depth 2
                                        ;     Child Loop BB14_13 Depth 2
                                        ;     Child Loop BB14_8 Depth 2
                                        ;     Child Loop BB14_3 Depth 2
	call	#task_select_func
	mov	&unsafe, r12
	mov	36(r12), r12
	cmp	#1, r12
	jne	.LBB14_6
	jmp	.LBB14_2
.LBB14_2:                               ; %if.then
                                        ;   in Loop: Header=BB14_1 Depth=1
	jmp	.LBB14_3
.LBB14_3:                               ; %while.cond1
                                        ;   Parent Loop BB14_1 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	mov	&unsafe, r12
	mov	42(r12), r12
	cmp	#100, r12
	jhs	.LBB14_5
	jmp	.LBB14_4
.LBB14_4:                               ; %while.body4
                                        ;   in Loop: Header=BB14_3 Depth=2
	call	#task_bit_count
	jmp	.LBB14_3
.LBB14_5:                               ; %while.end
                                        ;   in Loop: Header=BB14_1 Depth=1
	jmp	.LBB14_45
.LBB14_6:                               ; %if.else
                                        ;   in Loop: Header=BB14_1 Depth=1
	mov	&unsafe, r12
	mov	36(r12), r12
	cmp	#2, r12
	jne	.LBB14_11
	jmp	.LBB14_7
.LBB14_7:                               ; %if.then8
                                        ;   in Loop: Header=BB14_1 Depth=1
	jmp	.LBB14_8
.LBB14_8:                               ; %while.cond9
                                        ;   Parent Loop BB14_1 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	mov	&unsafe, r12
	mov	42(r12), r12
	cmp	#100, r12
	jhs	.LBB14_10
	jmp	.LBB14_9
.LBB14_9:                               ; %while.body13
                                        ;   in Loop: Header=BB14_8 Depth=2
	call	#task_bitcount
	jmp	.LBB14_8
.LBB14_10:                              ; %while.end14
                                        ;   in Loop: Header=BB14_1 Depth=1
	jmp	.LBB14_44
.LBB14_11:                              ; %if.else15
                                        ;   in Loop: Header=BB14_1 Depth=1
	mov	&unsafe, r12
	mov	36(r12), r12
	cmp	#3, r12
	jne	.LBB14_16
	jmp	.LBB14_12
.LBB14_12:                              ; %if.then19
                                        ;   in Loop: Header=BB14_1 Depth=1
	jmp	.LBB14_13
.LBB14_13:                              ; %while.cond20
                                        ;   Parent Loop BB14_1 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	mov	&unsafe, r12
	mov	42(r12), r12
	cmp	#100, r12
	jhs	.LBB14_15
	jmp	.LBB14_14
.LBB14_14:                              ; %while.body24
                                        ;   in Loop: Header=BB14_13 Depth=2
	call	#task_ntbl_bitcnt
	jmp	.LBB14_13
.LBB14_15:                              ; %while.end25
                                        ;   in Loop: Header=BB14_1 Depth=1
	jmp	.LBB14_43
.LBB14_16:                              ; %if.else26
                                        ;   in Loop: Header=BB14_1 Depth=1
	mov	&unsafe, r12
	mov	36(r12), r12
	cmp	#4, r12
	jne	.LBB14_21
	jmp	.LBB14_17
.LBB14_17:                              ; %if.then30
                                        ;   in Loop: Header=BB14_1 Depth=1
	jmp	.LBB14_18
.LBB14_18:                              ; %while.cond31
                                        ;   Parent Loop BB14_1 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	mov	&unsafe, r12
	mov	42(r12), r12
	cmp	#100, r12
	jhs	.LBB14_20
	jmp	.LBB14_19
.LBB14_19:                              ; %while.body35
                                        ;   in Loop: Header=BB14_18 Depth=2
	call	#task_ntbl_bitcount
	jmp	.LBB14_18
.LBB14_20:                              ; %while.end36
                                        ;   in Loop: Header=BB14_1 Depth=1
	jmp	.LBB14_42
.LBB14_21:                              ; %if.else37
                                        ;   in Loop: Header=BB14_1 Depth=1
	mov	&unsafe, r12
	mov	36(r12), r12
	cmp	#5, r12
	jne	.LBB14_26
	jmp	.LBB14_22
.LBB14_22:                              ; %if.then41
                                        ;   in Loop: Header=BB14_1 Depth=1
	jmp	.LBB14_23
.LBB14_23:                              ; %while.cond42
                                        ;   Parent Loop BB14_1 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	mov	&unsafe, r12
	mov	42(r12), r12
	cmp	#100, r12
	jhs	.LBB14_25
	jmp	.LBB14_24
.LBB14_24:                              ; %while.body46
                                        ;   in Loop: Header=BB14_23 Depth=2
	call	#task_BW_btbl_bitcount
	jmp	.LBB14_23
.LBB14_25:                              ; %while.end47
                                        ;   in Loop: Header=BB14_1 Depth=1
	jmp	.LBB14_41
.LBB14_26:                              ; %if.else48
                                        ;   in Loop: Header=BB14_1 Depth=1
	mov	&unsafe, r12
	mov	36(r12), r12
	cmp	#6, r12
	jne	.LBB14_31
	jmp	.LBB14_27
.LBB14_27:                              ; %if.then52
                                        ;   in Loop: Header=BB14_1 Depth=1
	jmp	.LBB14_28
.LBB14_28:                              ; %while.cond53
                                        ;   Parent Loop BB14_1 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	mov	&unsafe, r12
	mov	42(r12), r12
	cmp	#100, r12
	jhs	.LBB14_30
	jmp	.LBB14_29
.LBB14_29:                              ; %while.body57
                                        ;   in Loop: Header=BB14_28 Depth=2
	call	#task_AR_btbl_bitcount
	jmp	.LBB14_28
.LBB14_30:                              ; %while.end58
                                        ;   in Loop: Header=BB14_1 Depth=1
	jmp	.LBB14_40
.LBB14_31:                              ; %if.else59
                                        ;   in Loop: Header=BB14_1 Depth=1
	mov	&unsafe, r12
	mov	36(r12), r12
	cmp	#7, r12
	jne	.LBB14_36
	jmp	.LBB14_32
.LBB14_32:                              ; %if.then63
                                        ;   in Loop: Header=BB14_1 Depth=1
	jmp	.LBB14_33
.LBB14_33:                              ; %while.cond64
                                        ;   Parent Loop BB14_1 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	mov	&unsafe, r12
	mov	42(r12), r12
	cmp	#100, r12
	jhs	.LBB14_35
	jmp	.LBB14_34
.LBB14_34:                              ; %while.body68
                                        ;   in Loop: Header=BB14_33 Depth=2
	call	#task_bit_shifter
	jmp	.LBB14_33
.LBB14_35:                              ; %while.end69
                                        ;   in Loop: Header=BB14_1 Depth=1
	jmp	.LBB14_39
.LBB14_36:                              ; %if.else70
                                        ;   in Loop: Header=BB14_1 Depth=1
	mov	&unsafe, r12
	mov	36(r12), r12
	cmp	#8, r12
	jne	.LBB14_38
	jmp	.LBB14_37
.LBB14_37:                              ; %if.then74
                                        ;   in Loop: Header=BB14_1 Depth=1
	call	#task_done
	jmp	.LBB14_38
.LBB14_38:                              ; %if.end
                                        ;   in Loop: Header=BB14_1 Depth=1
	jmp	.LBB14_39
.LBB14_39:                              ; %if.end75
                                        ;   in Loop: Header=BB14_1 Depth=1
	jmp	.LBB14_40
.LBB14_40:                              ; %if.end76
                                        ;   in Loop: Header=BB14_1 Depth=1
	jmp	.LBB14_41
.LBB14_41:                              ; %if.end77
                                        ;   in Loop: Header=BB14_1 Depth=1
	jmp	.LBB14_42
.LBB14_42:                              ; %if.end78
                                        ;   in Loop: Header=BB14_1 Depth=1
	jmp	.LBB14_43
.LBB14_43:                              ; %if.end79
                                        ;   in Loop: Header=BB14_1 Depth=1
	jmp	.LBB14_44
.LBB14_44:                              ; %if.end80
                                        ;   in Loop: Header=BB14_1 Depth=1
	jmp	.LBB14_45
.LBB14_45:                              ; %if.end81
                                        ;   in Loop: Header=BB14_1 Depth=1
	jmp	.LBB14_1
.Lfunc_end14:
	.size	main, .Lfunc_end14-main
                                        ; -- End function
	.type	camel,@object           ; @camel
	.comm	camel,94,2
	.type	safe,@object            ; @safe
	.comm	safe,2,2
	.type	unsafe,@object          ; @unsafe
	.comm	unsafe,2,2
	.type	tmp_stack_crc,@object   ; @tmp_stack_crc
	.comm	tmp_stack_crc,2,2
	.type	tmp_stack_buf_crc,@object ; @tmp_stack_buf_crc
	.comm	tmp_stack_buf_crc,2,2
	.type	bits,@object            ; @bits
	.data
bits:
	.ascii	"\000\001\001\002\001\002\002\003\001\002\002\003\002\003\003\004\001\002\002\003\002\003\003\004\002\003\003\004\003\004\004\005\001\002\002\003\002\003\003\004\002\003\003\004\003\004\004\005\002\003\003\004\003\004\004\005\003\004\004\005\004\005\005\006\001\002\002\003\002\003\003\004\002\003\003\004\003\004\004\005\002\003\003\004\003\004\004\005\003\004\004\005\004\005\005\006\002\003\003\004\003\004\004\005\003\004\004\005\004\005\005\006\003\004\004\005\004\005\005\006\004\005\005\006\005\006\006\007\001\002\002\003\002\003\003\004\002\003\003\004\003\004\004\005\002\003\003\004\003\004\004\005\003\004\004\005\004\005\005\006\002\003\003\004\003\004\004\005\003\004\004\005\004\005\005\006\003\004\004\005\004\005\005\006\004\005\005\006\005\006\006\007\002\003\003\004\003\004\004\005\003\004\004\005\004\005\005\006\003\004\004\005\004\005\005\006\004\005\005\006\005\006\006\007\003\004\004\005\004\005\005\006\004\005\005\006\005\006\006\007\004\005\005\006\005\006\006\007\005\006\006\007\006\007\007\b"
	.size	bits, 256

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
