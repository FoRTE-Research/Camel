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
	sub	#146, r1
	clr	144(r1)
	mov	#1, &camel
	mov	#camel+2, &safe
	mov	#camel+48, &unsafe
	call	#camel_init
	call	#task_init
	jmp	.LBB14_1
.LBB14_1:                               ; %do.body
	mov	&camel, r12
	cmp	#1, r12
	jne	.LBB14_3
	jmp	.LBB14_2
.LBB14_2:                               ; %if.then
	mov	#camel+48, &safe
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
	mov	#44, r13
	call	#__fast_hw_crc
	mov	r12, &tmp_stack_buf_crc
	mov	&tmp_stack_buf_crc, r12
	mov	&safe, r13
	mov	r12, 44(r13)
	mov	#2, &camel
	jmp	.LBB14_4
.LBB14_3:                               ; %if.else
	mov	#camel+2, &safe
	mov	#camel+48, &unsafe
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
	mov	#44, r13
	call	#__fast_hw_crc
	mov	r12, &tmp_stack_buf_crc
	mov	&tmp_stack_buf_crc, r12
	mov	&safe, r13
	mov	r12, 44(r13)
	mov	#1, &camel
	jmp	.LBB14_4
.LBB14_4:                               ; %if.end
	jmp	.LBB14_5
.LBB14_5:                               ; %do.end
	mov	&unsafe, r12
	add	#22, r12
	mov	&safe, r13
	add	#22, r13
	mov	#22, r14
	call	#memcpy
	call	#task_commit
	jmp	.LBB14_6
.LBB14_6:                               ; %while.body
                                        ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB14_73 Depth 2
                                        ;     Child Loop BB14_63 Depth 2
                                        ;     Child Loop BB14_53 Depth 2
                                        ;     Child Loop BB14_43 Depth 2
                                        ;     Child Loop BB14_33 Depth 2
                                        ;     Child Loop BB14_23 Depth 2
                                        ;     Child Loop BB14_13 Depth 2
	mov	&safe, r12
	mov	36(r12), r12
	mov	&unsafe, r13
	mov	r12, 36(r13)
	call	#task_select_func
	jmp	.LBB14_7
.LBB14_7:                               ; %do.body17
                                        ;   in Loop: Header=BB14_6 Depth=1
	mov	&camel, r12
	cmp	#1, r12
	jne	.LBB14_9
	jmp	.LBB14_8
.LBB14_8:                               ; %if.then19
                                        ;   in Loop: Header=BB14_6 Depth=1
	mov	#camel+48, &safe
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
	mov	#44, r13
	call	#__fast_hw_crc
	mov	r12, &tmp_stack_buf_crc
	mov	&tmp_stack_buf_crc, r12
	mov	&safe, r13
	mov	r12, 44(r13)
	mov	#2, &camel
	jmp	.LBB14_10
.LBB14_9:                               ; %if.else32
                                        ;   in Loop: Header=BB14_6 Depth=1
	mov	#camel+2, &safe
	mov	#camel+48, &unsafe
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
	mov	#44, r13
	call	#__fast_hw_crc
	mov	r12, &tmp_stack_buf_crc
	mov	&tmp_stack_buf_crc, r12
	mov	&safe, r13
	mov	r12, 44(r13)
	mov	#1, &camel
	jmp	.LBB14_10
.LBB14_10:                              ; %if.end45
                                        ;   in Loop: Header=BB14_6 Depth=1
	jmp	.LBB14_11
.LBB14_11:                              ; %do.end46
                                        ;   in Loop: Header=BB14_6 Depth=1
	mov	&safe, r12
	mov	38(r12), r13
	mov	40(r12), r12
	mov	&unsafe, r14
	mov	r12, 40(r14)
	mov	r13, 38(r14)
	mov	&safe, r12
	mov	42(r12), r12
	mov	&unsafe, r13
	mov	r12, 42(r13)
	mov	&safe, r12
	mov	36(r12), r12
	mov	&unsafe, r13
	mov	r12, 36(r13)
	call	#task_commit
	mov	&unsafe, r12
	mov	36(r12), r12
	tst	r12
	jne	.LBB14_21
	jmp	.LBB14_12
.LBB14_12:                              ; %if.then48
                                        ;   in Loop: Header=BB14_6 Depth=1
	jmp	.LBB14_13
.LBB14_13:                              ; %while.cond49
                                        ;   Parent Loop BB14_6 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	mov	&unsafe, r12
	mov	42(r12), r12
	cmp	#100, r12
	jhs	.LBB14_20
	jmp	.LBB14_14
.LBB14_14:                              ; %while.body52
                                        ;   in Loop: Header=BB14_13 Depth=2
	mov	&safe, r12
	mov	38(r12), r13
	mov	40(r12), r12
	mov	&unsafe, r14
	mov	r12, 40(r14)
	mov	r13, 38(r14)
	mov	&safe, r12
	mov	24(r12), r12
	mov	&unsafe, r13
	mov	r12, 24(r13)
	mov	&safe, r12
	mov	42(r12), r12
	mov	&unsafe, r13
	mov	r12, 42(r13)
	call	#task_bitcount
	jmp	.LBB14_15
.LBB14_15:                              ; %do.body53
                                        ;   in Loop: Header=BB14_13 Depth=2
	mov	&camel, r12
	cmp	#1, r12
	jne	.LBB14_17
	jmp	.LBB14_16
.LBB14_16:                              ; %if.then55
                                        ;   in Loop: Header=BB14_13 Depth=2
	mov	#camel+48, &safe
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
	mov	#44, r13
	call	#__fast_hw_crc
	mov	r12, &tmp_stack_buf_crc
	mov	&tmp_stack_buf_crc, r12
	mov	&safe, r13
	mov	r12, 44(r13)
	mov	#2, &camel
	jmp	.LBB14_18
.LBB14_17:                              ; %if.else68
                                        ;   in Loop: Header=BB14_13 Depth=2
	mov	#camel+2, &safe
	mov	#camel+48, &unsafe
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
	mov	#44, r13
	call	#__fast_hw_crc
	mov	r12, &tmp_stack_buf_crc
	mov	&tmp_stack_buf_crc, r12
	mov	&safe, r13
	mov	r12, 44(r13)
	mov	#1, &camel
	jmp	.LBB14_18
.LBB14_18:                              ; %if.end81
                                        ;   in Loop: Header=BB14_13 Depth=2
	jmp	.LBB14_19
.LBB14_19:                              ; %do.end82
                                        ;   in Loop: Header=BB14_13 Depth=2
	mov	&safe, r12
	mov	38(r12), r13
	mov	40(r12), r12
	mov	&unsafe, r14
	mov	r12, 40(r14)
	mov	r13, 38(r14)
	mov	&safe, r12
	mov	24(r12), r12
	mov	&unsafe, r13
	mov	r12, 24(r13)
	mov	&safe, r12
	mov	42(r12), r12
	mov	&unsafe, r13
	mov	r12, 42(r13)
	call	#task_commit
	jmp	.LBB14_13
.LBB14_20:                              ; %while.end
                                        ;   in Loop: Header=BB14_6 Depth=1
	br	#.LBB14_88
.LBB14_21:                              ; %if.else83
                                        ;   in Loop: Header=BB14_6 Depth=1
	mov	&unsafe, r12
	mov	36(r12), r12
	cmp	#1, r12
	jne	.LBB14_31
	jmp	.LBB14_22
.LBB14_22:                              ; %if.then87
                                        ;   in Loop: Header=BB14_6 Depth=1
	jmp	.LBB14_23
.LBB14_23:                              ; %while.cond88
                                        ;   Parent Loop BB14_6 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	mov	&unsafe, r12
	mov	42(r12), r12
	cmp	#100, r12
	jhs	.LBB14_30
	jmp	.LBB14_24
.LBB14_24:                              ; %while.body92
                                        ;   in Loop: Header=BB14_23 Depth=2
	mov	&safe, r12
	mov	38(r12), r13
	mov	40(r12), r12
	mov	&unsafe, r14
	mov	r12, 40(r14)
	mov	r13, 38(r14)
	mov	&safe, r12
	mov	22(r12), r12
	mov	&unsafe, r13
	mov	r12, 22(r13)
	mov	&safe, r12
	mov	42(r12), r12
	mov	&unsafe, r13
	mov	r12, 42(r13)
	call	#task_bit_count
	jmp	.LBB14_25
.LBB14_25:                              ; %do.body93
                                        ;   in Loop: Header=BB14_23 Depth=2
	mov	&camel, r12
	cmp	#1, r12
	jne	.LBB14_27
	jmp	.LBB14_26
.LBB14_26:                              ; %if.then95
                                        ;   in Loop: Header=BB14_23 Depth=2
	mov	#camel+48, &safe
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
	mov	#44, r13
	call	#__fast_hw_crc
	mov	r12, &tmp_stack_buf_crc
	mov	&tmp_stack_buf_crc, r12
	mov	&safe, r13
	mov	r12, 44(r13)
	mov	#2, &camel
	jmp	.LBB14_28
.LBB14_27:                              ; %if.else108
                                        ;   in Loop: Header=BB14_23 Depth=2
	mov	#camel+2, &safe
	mov	#camel+48, &unsafe
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
	mov	#44, r13
	call	#__fast_hw_crc
	mov	r12, &tmp_stack_buf_crc
	mov	&tmp_stack_buf_crc, r12
	mov	&safe, r13
	mov	r12, 44(r13)
	mov	#1, &camel
	jmp	.LBB14_28
.LBB14_28:                              ; %if.end121
                                        ;   in Loop: Header=BB14_23 Depth=2
	jmp	.LBB14_29
.LBB14_29:                              ; %do.end122
                                        ;   in Loop: Header=BB14_23 Depth=2
	mov	&safe, r12
	mov	38(r12), r13
	mov	40(r12), r12
	mov	&unsafe, r14
	mov	r12, 40(r14)
	mov	r13, 38(r14)
	mov	&safe, r12
	mov	22(r12), r12
	mov	&unsafe, r13
	mov	r12, 22(r13)
	mov	&safe, r12
	mov	42(r12), r12
	mov	&unsafe, r13
	mov	r12, 42(r13)
	call	#task_commit
	jmp	.LBB14_23
.LBB14_30:                              ; %while.end123
                                        ;   in Loop: Header=BB14_6 Depth=1
	br	#.LBB14_87
.LBB14_31:                              ; %if.else124
                                        ;   in Loop: Header=BB14_6 Depth=1
	mov	&unsafe, r12
	mov	36(r12), r12
	cmp	#2, r12
	jne	.LBB14_41
	jmp	.LBB14_32
.LBB14_32:                              ; %if.then128
                                        ;   in Loop: Header=BB14_6 Depth=1
	jmp	.LBB14_33
.LBB14_33:                              ; %while.cond129
                                        ;   Parent Loop BB14_6 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	mov	&unsafe, r12
	mov	42(r12), r12
	cmp	#100, r12
	jhs	.LBB14_40
	jmp	.LBB14_34
.LBB14_34:                              ; %while.body133
                                        ;   in Loop: Header=BB14_33 Depth=2
	mov	&safe, r12
	mov	26(r12), r12
	mov	&unsafe, r13
	mov	r12, 26(r13)
	mov	&safe, r12
	mov	38(r12), r13
	mov	40(r12), r12
	mov	&unsafe, r14
	mov	r12, 40(r14)
	mov	r13, 38(r14)
	mov	&safe, r12
	mov	42(r12), r12
	mov	&unsafe, r13
	mov	r12, 42(r13)
	call	#task_ntbl_bitcnt
	jmp	.LBB14_35
.LBB14_35:                              ; %do.body134
                                        ;   in Loop: Header=BB14_33 Depth=2
	mov	&camel, r12
	cmp	#1, r12
	jne	.LBB14_37
	jmp	.LBB14_36
.LBB14_36:                              ; %if.then136
                                        ;   in Loop: Header=BB14_33 Depth=2
	mov	#camel+48, &safe
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
	mov	#44, r13
	call	#__fast_hw_crc
	mov	r12, &tmp_stack_buf_crc
	mov	&tmp_stack_buf_crc, r12
	mov	&safe, r13
	mov	r12, 44(r13)
	mov	#2, &camel
	jmp	.LBB14_38
.LBB14_37:                              ; %if.else149
                                        ;   in Loop: Header=BB14_33 Depth=2
	mov	#camel+2, &safe
	mov	#camel+48, &unsafe
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
	mov	#44, r13
	call	#__fast_hw_crc
	mov	r12, &tmp_stack_buf_crc
	mov	&tmp_stack_buf_crc, r12
	mov	&safe, r13
	mov	r12, 44(r13)
	mov	#1, &camel
	jmp	.LBB14_38
.LBB14_38:                              ; %if.end162
                                        ;   in Loop: Header=BB14_33 Depth=2
	jmp	.LBB14_39
.LBB14_39:                              ; %do.end163
                                        ;   in Loop: Header=BB14_33 Depth=2
	mov	&safe, r12
	mov	26(r12), r12
	mov	&unsafe, r13
	mov	r12, 26(r13)
	mov	&safe, r12
	mov	38(r12), r13
	mov	40(r12), r12
	mov	&unsafe, r14
	mov	r12, 40(r14)
	mov	r13, 38(r14)
	mov	&safe, r12
	mov	42(r12), r12
	mov	&unsafe, r13
	mov	r12, 42(r13)
	call	#task_commit
	jmp	.LBB14_33
.LBB14_40:                              ; %while.end164
                                        ;   in Loop: Header=BB14_6 Depth=1
	br	#.LBB14_86
.LBB14_41:                              ; %if.else165
                                        ;   in Loop: Header=BB14_6 Depth=1
	mov	&unsafe, r12
	mov	36(r12), r12
	cmp	#3, r12
	jne	.LBB14_51
	jmp	.LBB14_42
.LBB14_42:                              ; %if.then169
                                        ;   in Loop: Header=BB14_6 Depth=1
	jmp	.LBB14_43
.LBB14_43:                              ; %while.cond170
                                        ;   Parent Loop BB14_6 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	mov	&unsafe, r12
	mov	42(r12), r12
	cmp	#100, r12
	jhs	.LBB14_50
	jmp	.LBB14_44
.LBB14_44:                              ; %while.body174
                                        ;   in Loop: Header=BB14_43 Depth=2
	mov	&safe, r12
	mov	28(r12), r12
	mov	&unsafe, r13
	mov	r12, 28(r13)
	mov	&safe, r12
	mov	38(r12), r13
	mov	40(r12), r12
	mov	&unsafe, r14
	mov	r12, 40(r14)
	mov	r13, 38(r14)
	mov	&safe, r12
	mov	42(r12), r12
	mov	&unsafe, r13
	mov	r12, 42(r13)
	call	#task_ntbl_bitcount
	jmp	.LBB14_45
.LBB14_45:                              ; %do.body175
                                        ;   in Loop: Header=BB14_43 Depth=2
	mov	&camel, r12
	cmp	#1, r12
	jne	.LBB14_47
	jmp	.LBB14_46
.LBB14_46:                              ; %if.then177
                                        ;   in Loop: Header=BB14_43 Depth=2
	mov	#camel+48, &safe
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
	mov	#44, r13
	call	#__fast_hw_crc
	mov	r12, &tmp_stack_buf_crc
	mov	&tmp_stack_buf_crc, r12
	mov	&safe, r13
	mov	r12, 44(r13)
	mov	#2, &camel
	jmp	.LBB14_48
.LBB14_47:                              ; %if.else190
                                        ;   in Loop: Header=BB14_43 Depth=2
	mov	#camel+2, &safe
	mov	#camel+48, &unsafe
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
	mov	#44, r13
	call	#__fast_hw_crc
	mov	r12, &tmp_stack_buf_crc
	mov	&tmp_stack_buf_crc, r12
	mov	&safe, r13
	mov	r12, 44(r13)
	mov	#1, &camel
	jmp	.LBB14_48
.LBB14_48:                              ; %if.end203
                                        ;   in Loop: Header=BB14_43 Depth=2
	jmp	.LBB14_49
.LBB14_49:                              ; %do.end204
                                        ;   in Loop: Header=BB14_43 Depth=2
	mov	&safe, r12
	mov	28(r12), r12
	mov	&unsafe, r13
	mov	r12, 28(r13)
	mov	&safe, r12
	mov	38(r12), r13
	mov	40(r12), r12
	mov	&unsafe, r14
	mov	r12, 40(r14)
	mov	r13, 38(r14)
	mov	&safe, r12
	mov	42(r12), r12
	mov	&unsafe, r13
	mov	r12, 42(r13)
	call	#task_commit
	jmp	.LBB14_43
.LBB14_50:                              ; %while.end205
                                        ;   in Loop: Header=BB14_6 Depth=1
	br	#.LBB14_85
.LBB14_51:                              ; %if.else206
                                        ;   in Loop: Header=BB14_6 Depth=1
	mov	&unsafe, r12
	mov	36(r12), r12
	cmp	#4, r12
	jne	.LBB14_61
	jmp	.LBB14_52
.LBB14_52:                              ; %if.then210
                                        ;   in Loop: Header=BB14_6 Depth=1
	jmp	.LBB14_53
.LBB14_53:                              ; %while.cond211
                                        ;   Parent Loop BB14_6 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	mov	&unsafe, r12
	mov	42(r12), r12
	cmp	#100, r12
	jhs	.LBB14_60
	jmp	.LBB14_54
.LBB14_54:                              ; %while.body215
                                        ;   in Loop: Header=BB14_53 Depth=2
	mov	&safe, r12
	mov	30(r12), r12
	mov	&unsafe, r13
	mov	r12, 30(r13)
	mov	&safe, r12
	mov	38(r12), r13
	mov	40(r12), r12
	mov	&unsafe, r14
	mov	r12, 40(r14)
	mov	r13, 38(r14)
	mov	&safe, r12
	mov	42(r12), r12
	mov	&unsafe, r13
	mov	r12, 42(r13)
	call	#task_BW_btbl_bitcount
	jmp	.LBB14_55
.LBB14_55:                              ; %do.body216
                                        ;   in Loop: Header=BB14_53 Depth=2
	mov	&camel, r12
	cmp	#1, r12
	jne	.LBB14_57
	jmp	.LBB14_56
.LBB14_56:                              ; %if.then218
                                        ;   in Loop: Header=BB14_53 Depth=2
	mov	#camel+48, &safe
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
	mov	#44, r13
	call	#__fast_hw_crc
	mov	r12, &tmp_stack_buf_crc
	mov	&tmp_stack_buf_crc, r12
	mov	&safe, r13
	mov	r12, 44(r13)
	mov	#2, &camel
	jmp	.LBB14_58
.LBB14_57:                              ; %if.else231
                                        ;   in Loop: Header=BB14_53 Depth=2
	mov	#camel+2, &safe
	mov	#camel+48, &unsafe
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
	mov	#44, r13
	call	#__fast_hw_crc
	mov	r12, &tmp_stack_buf_crc
	mov	&tmp_stack_buf_crc, r12
	mov	&safe, r13
	mov	r12, 44(r13)
	mov	#1, &camel
	jmp	.LBB14_58
.LBB14_58:                              ; %if.end244
                                        ;   in Loop: Header=BB14_53 Depth=2
	jmp	.LBB14_59
.LBB14_59:                              ; %do.end245
                                        ;   in Loop: Header=BB14_53 Depth=2
	mov	&safe, r12
	mov	30(r12), r12
	mov	&unsafe, r13
	mov	r12, 30(r13)
	mov	&safe, r12
	mov	38(r12), r13
	mov	40(r12), r12
	mov	&unsafe, r14
	mov	r12, 40(r14)
	mov	r13, 38(r14)
	mov	&safe, r12
	mov	42(r12), r12
	mov	&unsafe, r13
	mov	r12, 42(r13)
	call	#task_commit
	jmp	.LBB14_53
.LBB14_60:                              ; %while.end246
                                        ;   in Loop: Header=BB14_6 Depth=1
	jmp	.LBB14_84
.LBB14_61:                              ; %if.else247
                                        ;   in Loop: Header=BB14_6 Depth=1
	mov	&unsafe, r12
	mov	36(r12), r12
	cmp	#5, r12
	jne	.LBB14_71
	jmp	.LBB14_62
.LBB14_62:                              ; %if.then251
                                        ;   in Loop: Header=BB14_6 Depth=1
	jmp	.LBB14_63
.LBB14_63:                              ; %while.cond252
                                        ;   Parent Loop BB14_6 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	mov	&unsafe, r12
	mov	42(r12), r12
	cmp	#100, r12
	jhs	.LBB14_70
	jmp	.LBB14_64
.LBB14_64:                              ; %while.body256
                                        ;   in Loop: Header=BB14_63 Depth=2
	mov	&safe, r12
	mov	32(r12), r12
	mov	&unsafe, r13
	mov	r12, 32(r13)
	mov	&safe, r12
	mov	38(r12), r13
	mov	40(r12), r12
	mov	&unsafe, r14
	mov	r12, 40(r14)
	mov	r13, 38(r14)
	mov	&safe, r12
	mov	42(r12), r12
	mov	&unsafe, r13
	mov	r12, 42(r13)
	call	#task_AR_btbl_bitcount
	jmp	.LBB14_65
.LBB14_65:                              ; %do.body257
                                        ;   in Loop: Header=BB14_63 Depth=2
	mov	&camel, r12
	cmp	#1, r12
	jne	.LBB14_67
	jmp	.LBB14_66
.LBB14_66:                              ; %if.then259
                                        ;   in Loop: Header=BB14_63 Depth=2
	mov	#camel+48, &safe
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
	mov	#44, r13
	call	#__fast_hw_crc
	mov	r12, &tmp_stack_buf_crc
	mov	&tmp_stack_buf_crc, r12
	mov	&safe, r13
	mov	r12, 44(r13)
	mov	#2, &camel
	jmp	.LBB14_68
.LBB14_67:                              ; %if.else272
                                        ;   in Loop: Header=BB14_63 Depth=2
	mov	#camel+2, &safe
	mov	#camel+48, &unsafe
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
	mov	#44, r13
	call	#__fast_hw_crc
	mov	r12, &tmp_stack_buf_crc
	mov	&tmp_stack_buf_crc, r12
	mov	&safe, r13
	mov	r12, 44(r13)
	mov	#1, &camel
	jmp	.LBB14_68
.LBB14_68:                              ; %if.end285
                                        ;   in Loop: Header=BB14_63 Depth=2
	jmp	.LBB14_69
.LBB14_69:                              ; %do.end286
                                        ;   in Loop: Header=BB14_63 Depth=2
	mov	&safe, r12
	mov	32(r12), r12
	mov	&unsafe, r13
	mov	r12, 32(r13)
	mov	&safe, r12
	mov	38(r12), r13
	mov	40(r12), r12
	mov	&unsafe, r14
	mov	r12, 40(r14)
	mov	r13, 38(r14)
	mov	&safe, r12
	mov	42(r12), r12
	mov	&unsafe, r13
	mov	r12, 42(r13)
	call	#task_commit
	jmp	.LBB14_63
.LBB14_70:                              ; %while.end287
                                        ;   in Loop: Header=BB14_6 Depth=1
	jmp	.LBB14_83
.LBB14_71:                              ; %if.else288
                                        ;   in Loop: Header=BB14_6 Depth=1
	mov	&unsafe, r12
	mov	36(r12), r12
	cmp	#6, r12
	jne	.LBB14_81
	jmp	.LBB14_72
.LBB14_72:                              ; %if.then292
                                        ;   in Loop: Header=BB14_6 Depth=1
	jmp	.LBB14_73
.LBB14_73:                              ; %while.cond293
                                        ;   Parent Loop BB14_6 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	mov	&unsafe, r12
	mov	42(r12), r12
	cmp	#100, r12
	jhs	.LBB14_80
	jmp	.LBB14_74
.LBB14_74:                              ; %while.body297
                                        ;   in Loop: Header=BB14_73 Depth=2
	mov	&safe, r12
	mov	34(r12), r12
	mov	&unsafe, r13
	mov	r12, 34(r13)
	mov	&safe, r12
	mov	38(r12), r13
	mov	40(r12), r12
	mov	&unsafe, r14
	mov	r12, 40(r14)
	mov	r13, 38(r14)
	mov	&safe, r12
	mov	42(r12), r12
	mov	&unsafe, r13
	mov	r12, 42(r13)
	call	#task_bit_shifter
	jmp	.LBB14_75
.LBB14_75:                              ; %do.body298
                                        ;   in Loop: Header=BB14_73 Depth=2
	mov	&camel, r12
	cmp	#1, r12
	jne	.LBB14_77
	jmp	.LBB14_76
.LBB14_76:                              ; %if.then300
                                        ;   in Loop: Header=BB14_73 Depth=2
	mov	#camel+48, &safe
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
	mov	#44, r13
	call	#__fast_hw_crc
	mov	r12, &tmp_stack_buf_crc
	mov	&tmp_stack_buf_crc, r12
	mov	&safe, r13
	mov	r12, 44(r13)
	mov	#2, &camel
	jmp	.LBB14_78
.LBB14_77:                              ; %if.else313
                                        ;   in Loop: Header=BB14_73 Depth=2
	mov	#camel+2, &safe
	mov	#camel+48, &unsafe
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
	mov	#44, r13
	call	#__fast_hw_crc
	mov	r12, &tmp_stack_buf_crc
	mov	&tmp_stack_buf_crc, r12
	mov	&safe, r13
	mov	r12, 44(r13)
	mov	#1, &camel
	jmp	.LBB14_78
.LBB14_78:                              ; %if.end326
                                        ;   in Loop: Header=BB14_73 Depth=2
	jmp	.LBB14_79
.LBB14_79:                              ; %do.end327
                                        ;   in Loop: Header=BB14_73 Depth=2
	mov	&safe, r12
	mov	34(r12), r12
	mov	&unsafe, r13
	mov	r12, 34(r13)
	mov	&safe, r12
	mov	38(r12), r13
	mov	40(r12), r12
	mov	&unsafe, r14
	mov	r12, 40(r14)
	mov	r13, 38(r14)
	mov	&safe, r12
	mov	42(r12), r12
	mov	&unsafe, r13
	mov	r12, 42(r13)
	call	#task_commit
	jmp	.LBB14_73
.LBB14_80:                              ; %while.end328
                                        ;   in Loop: Header=BB14_6 Depth=1
	jmp	.LBB14_82
.LBB14_81:                              ; %if.else329
	jmp	.LBB14_89
.LBB14_82:                              ; %if.end330
                                        ;   in Loop: Header=BB14_6 Depth=1
	jmp	.LBB14_83
.LBB14_83:                              ; %if.end331
                                        ;   in Loop: Header=BB14_6 Depth=1
	jmp	.LBB14_84
.LBB14_84:                              ; %if.end332
                                        ;   in Loop: Header=BB14_6 Depth=1
	jmp	.LBB14_85
.LBB14_85:                              ; %if.end333
                                        ;   in Loop: Header=BB14_6 Depth=1
	jmp	.LBB14_86
.LBB14_86:                              ; %if.end334
                                        ;   in Loop: Header=BB14_6 Depth=1
	jmp	.LBB14_87
.LBB14_87:                              ; %if.end335
                                        ;   in Loop: Header=BB14_6 Depth=1
	jmp	.LBB14_88
.LBB14_88:                              ; %if.end336
                                        ;   in Loop: Header=BB14_6 Depth=1
	br	#.LBB14_6
.LBB14_89:                              ; %while.end337
	call	#task_done
	mov	144(r1), r12
	add	#146, r1
	ret
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
