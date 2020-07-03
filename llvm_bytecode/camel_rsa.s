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
	mov	#camel+228, &unsafe
	mov	#camel+2, &safe
	jmp	.LBB1_5
.LBB1_2:                                ; %if.else
	cmp	#2, &camel
	jne	.LBB1_4
; %bb.3:                                ; %if.then2
	mov	#camel+2, &unsafe
	mov	#camel+228, &safe
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
	mov	#224, r13
	call	#__fast_hw_crc
	mov	r12, &tmp_stack_buf_crc
	mov	&safe, r13
	cmp	224(r13), r12
	jne	.LBB1_7
; %bb.6:                                ; %if.then10
	mov	&safe, r13
	mov	&unsafe, r12
	mov	#226, r14
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
	mov	#camel+228, &safe
	mov	#camel+228, r12
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
	mov	#224, r13
	call	#__fast_hw_crc
	mov	r12, &tmp_stack_buf_crc
	mov	&safe, r13
	mov	r12, 224(r13)
	mov	#2, &camel
	add	#16, r1
	ret
.LBB2_2:                                ; %if.else
	mov	#camel+228, &unsafe
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
	mov	#224, r13
	call	#__fast_hw_crc
	mov	r12, &tmp_stack_buf_crc
	mov	&safe, r13
	mov	r12, 224(r13)
	mov	#1, &camel
	add	#16, r1
	ret
.Lfunc_end2:
	.size	commit, .Lfunc_end2-commit
                                        ; -- End function
	.globl	task_done               ; -- Begin function task_done
	.p2align	1
	.type	task_done,@function
task_done:                              ; @task_done
.Lfunc_begin3:
; %bb.0:                                ; %entry
	clr	r12
	call	#exit
.Lfunc_end3:
	.size	task_done, .Lfunc_end3-task_done
                                        ; -- End function
	.globl	task_init               ; -- Begin function task_init
	.p2align	1
	.type	task_init,@function
task_init:                              ; @task_init
.Lfunc_begin4:
; %bb.0:                                ; %entry
	sub	#4, r1
	clr	2(r1)
	mov	#11, 0(r1)
	cmp	#8, 2(r1)
	jge	.LBB4_2
.LBB4_1:                                ; %for.body
                                        ; =>This Inner Loop Header: Depth=1
	mov	2(r1), r12
	mov	r12, r13
	add	r13, r13
	add	&unsafe, r13
	mov.b	pubkey(r12), r12
	mov	r12, 96(r13)
	inc	2(r1)
	cmp	#8, 2(r1)
	jl	.LBB4_1
.LBB4_2:                                ; %for.end
	mov	&unsafe, r12
	mov	0(r1), 60(r12)
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
.Lfunc_end4:
	.size	task_init, .Lfunc_end4-task_init
                                        ; -- End function
	.globl	task_pad                ; -- Begin function task_pad
	.p2align	1
	.type	task_pad,@function
task_pad:                               ; @task_pad
.Lfunc_begin5:
; %bb.0:                                ; %entry
	sub	#4, r1
	mov	&unsafe, r12
	cmp	60(r12), 58(r12)
	jlo	.LBB5_2
; %bb.1:                                ; %if.then
	call	#task_done
.LBB5_2:                                ; %if.end
	clr	2(r1)
	clr	0(r1)
	cmp	#7, 2(r1)
	jlo	.LBB5_4
	jmp	.LBB5_6
.LBB5_3:                                ; %cond.end
                                        ;   in Loop: Header=BB5_4 Depth=1
	mov	2(r1), r13
	add	r13, r13
	add	&unsafe, r13
	mov	r12, 64(r13)
	inc	2(r1)
	cmp	#7, 2(r1)
	jhs	.LBB5_6
.LBB5_4:                                ; %for.body
                                        ; =>This Inner Loop Header: Depth=1
	mov	#255, r12
	mov	&unsafe, r13
	mov	58(r13), r14
	add	2(r1), r14
	cmp	60(r13), r14
	jhs	.LBB5_3
; %bb.5:                                ; %cond.true
                                        ;   in Loop: Header=BB5_4 Depth=1
	mov	&unsafe, r12
	mov	58(r12), r12
	add	2(r1), r12
	mov.b	PLAINTEXT(r12), r12
	jmp	.LBB5_3
.LBB5_6:                                ; %for.end
	mov	#7, 2(r1)
	cmp	#8, 2(r1)
	jge	.LBB5_8
.LBB5_7:                                ; %for.body16
                                        ; =>This Inner Loop Header: Depth=1
	mov	2(r1), r12
	add	r12, r12
	add	&unsafe, r12
	mov	#1, 64(r12)
	inc	2(r1)
	cmp	#8, 2(r1)
	jl	.LBB5_7
.LBB5_8:                                ; %for.end22
	mov	0(r1), r12
	add	r12, r12
	add	&unsafe, r12
	mov	#1, 186(r12)
	mov	#1, 2(r1)
	cmp	#8, 2(r1)
	jge	.LBB5_10
.LBB5_9:                                ; %for.body28
                                        ; =>This Inner Loop Header: Depth=1
	mov	2(r1), r12
	add	r12, r12
	add	&unsafe, r12
	clr	186(r12)
	inc	2(r1)
	cmp	#8, 2(r1)
	jl	.LBB5_9
.LBB5_10:                               ; %for.end34
	mov	&unsafe, r12
	mov	&pubkey+8, 54(r12)
	mov	&unsafe, r12
	add	#7, 58(r12)
	mov	&unsafe, r12
	mov	#2, 220(r12)
	add	#4, r1
	ret
.Lfunc_end5:
	.size	task_pad, .Lfunc_end5-task_pad
                                        ; -- End function
	.globl	task_exp                ; -- Begin function task_exp
	.p2align	1
	.type	task_exp,@function
task_exp:                               ; @task_exp
.Lfunc_begin6:
; %bb.0:                                ; %entry
	mov	&unsafe, r12
	bit.b	#1, 54(r12)
	jeq	.LBB6_2
; %bb.1:                                ; %if.then
	mov	&unsafe, r12
	mov	54(r12), r13
	clrc
	rrc	r13
	mov	r13, 54(r12)
	mov	&unsafe, r12
	clr	220(r12)
	ret
.LBB6_2:                                ; %if.else
	mov	&unsafe, r12
	mov	54(r12), r13
	clrc
	rrc	r13
	mov	r13, 54(r12)
	mov	&unsafe, r12
	mov	#1, 220(r12)
	ret
.Lfunc_end6:
	.size	task_exp, .Lfunc_end6-task_exp
                                        ; -- End function
	.globl	task_mult_block         ; -- Begin function task_mult_block
	.p2align	1
	.type	task_mult_block,@function
task_mult_block:                        ; @task_mult_block
.Lfunc_begin7:
; %bb.0:                                ; %entry
	mov	&unsafe, r12
	clr	222(r12)
	ret
.Lfunc_end7:
	.size	task_mult_block, .Lfunc_end7-task_mult_block
                                        ; -- End function
	.globl	task_mult_block_get_result ; -- Begin function task_mult_block_get_result
	.p2align	1
	.type	task_mult_block_get_result,@function
task_mult_block_get_result:             ; @task_mult_block_get_result
.Lfunc_begin8:
; %bb.0:                                ; %entry
	sub	#4, r1
	mov	#7, 2(r1)
	tst	2(r1)
	jl	.LBB8_2
.LBB8_1:                                ; %for.body
                                        ; =>This Inner Loop Header: Depth=1
	mov	2(r1), r12
	add	r12, r12
	add	&unsafe, r12
	mov	22(r12), 186(r12)
	add	#-1, 2(r1)
	tst	2(r1)
	jge	.LBB8_1
.LBB8_2:                                ; %for.end
	mov	&unsafe, r12
	tst	54(r12)
	jeq	.LBB8_4
; %bb.3:                                ; %if.then
	mov	&unsafe, r12
	mov	#1, 220(r12)
	add	#4, r1
	ret
.LBB8_4:                                ; %if.else
	mov	&unsafe, r12
	mov	#8, r13
	add	62(r12), r13
	cmp	#17, r13
	jhs	.LBB8_7
; %bb.5:                                ; %if.then8
	clr	2(r1)
	cmp	#8, 2(r1)
	jge	.LBB8_7
.LBB8_6:                                ; %for.body11
                                        ; =>This Inner Loop Header: Depth=1
	mov	&unsafe, r12
	mov	62(r12), r13
	mov	r13, 0(r1)
	mov	2(r1), r14
	add	r14, r14
	add	#22, r12
	add	r12, r14
	add	r13, r13
	add	r12, r13
	mov	0(r14), 96(r13)
	mov	&unsafe, r12
	inc	62(r12)
	inc	2(r1)
	cmp	#8, 2(r1)
	jl	.LBB8_6
.LBB8_7:                                ; %if.end
	mov	&unsafe, r12
	clr	220(r12)
	add	#4, r1
	ret
.Lfunc_end8:
	.size	task_mult_block_get_result, .Lfunc_end8-task_mult_block_get_result
                                        ; -- End function
	.globl	task_square_base        ; -- Begin function task_square_base
	.p2align	1
	.type	task_square_base,@function
task_square_base:                       ; @task_square_base
.Lfunc_begin9:
; %bb.0:                                ; %entry
	mov	&unsafe, r12
	mov	#1, 222(r12)
	ret
.Lfunc_end9:
	.size	task_square_base, .Lfunc_end9-task_square_base
                                        ; -- End function
	.globl	task_square_base_get_result ; -- Begin function task_square_base_get_result
	.p2align	1
	.type	task_square_base_get_result,@function
task_square_base_get_result:            ; @task_square_base_get_result
.Lfunc_begin10:
; %bb.0:                                ; %entry
	sub	#2, r1
	clr	0(r1)
	cmp	#8, 0(r1)
	jge	.LBB10_2
.LBB10_1:                               ; %for.body
                                        ; =>This Inner Loop Header: Depth=1
	mov	0(r1), r12
	add	r12, r12
	add	&unsafe, r12
	mov	22(r12), 64(r12)
	inc	0(r1)
	cmp	#8, 0(r1)
	jl	.LBB10_1
.LBB10_2:                               ; %for.end
	mov	&unsafe, r12
	mov	#2, 220(r12)
	add	#2, r1
	ret
.Lfunc_end10:
	.size	task_square_base_get_result, .Lfunc_end10-task_square_base_get_result
                                        ; -- End function
	.globl	task_mult_mod           ; -- Begin function task_mult_mod
	.p2align	1
	.type	task_mult_mod,@function
task_mult_mod:                          ; @task_mult_mod
.Lfunc_begin11:
; %bb.0:                                ; %entry
	mov	&unsafe, r12
	clr	112(r12)
	mov	&unsafe, r12
	clr	114(r12)
	ret
.Lfunc_end11:
	.size	task_mult_mod, .Lfunc_end11-task_mult_mod
                                        ; -- End function
	.globl	task_mult               ; -- Begin function task_mult
	.p2align	1
	.type	task_mult,@function
task_mult:                              ; @task_mult
.Lfunc_begin12:
; %bb.0:                                ; %entry
	sub	#14, r1
	mov	&unsafe, r12
	mov	114(r12), 2(r1)
	clr	6(r1)
	clr	12(r1)
	cmp	#8, 12(r1)
	jl	.LBB12_2
	jmp	.LBB12_5
.LBB12_1:                               ; %if.end
                                        ;   in Loop: Header=BB12_2 Depth=1
	inc	12(r1)
	cmp	#8, 12(r1)
	jge	.LBB12_5
.LBB12_2:                               ; %for.body
                                        ; =>This Inner Loop Header: Depth=1
	mov	&unsafe, r12
	mov	112(r12), r12
	sub	12(r1), r12
	tst	r12
	jlo	.LBB12_1
; %bb.3:                                ; %land.lhs.true
                                        ;   in Loop: Header=BB12_2 Depth=1
	mov	&unsafe, r12
	mov	112(r12), r12
	sub	12(r1), r12
	cmp	#8, r12
	jhs	.LBB12_1
; %bb.4:                                ; %if.then
                                        ;   in Loop: Header=BB12_2 Depth=1
	mov	&unsafe, r12
	mov	112(r12), r13
	mov	12(r1), r14
	sub	r14, r13
	mov	r13, 0(r1)
	add	r14, r14
	add	r12, r14
	add	r13, r13
	add	r12, r13
	mov	64(r13), r12
	mov	r12, 10(r1)
	mov	186(r14), r13
	mov	r13, 8(r1)
	call	#__mspabi_mpyi
	mov	r12, 4(r1)
	mov.b	r12, r12
	add	r12, 2(r1)
	mov.b	5(r1), r12
	add	r12, 6(r1)
	jmp	.LBB12_1
.LBB12_5:                               ; %for.end
	mov.b	3(r1), r12
	add	r12, 6(r1)
	mov.b	2(r1), r12
	mov	r12, 2(r1)
	mov	&unsafe, r13
	mov	112(r13), r14
	add	r14, r14
	add	r13, r14
	mov	r12, 22(r14)
	mov	&unsafe, r12
	inc	112(r12)
	mov	&unsafe, r12
	cmp	#16, 112(r12)
	jhs	.LBB12_7
; %bb.6:                                ; %if.then27
	mov	&unsafe, r12
	mov	6(r1), 114(r12)
.LBB12_7:                               ; %if.end30
	add	#14, r1
	ret
.Lfunc_end12:
	.size	task_mult, .Lfunc_end12-task_mult
                                        ; -- End function
	.globl	task_reduce_digits      ; -- Begin function task_reduce_digits
	.p2align	1
	.type	task_reduce_digits,@function
task_reduce_digits:                     ; @task_reduce_digits
.Lfunc_begin13:
; %bb.0:                                ; %entry
	sub	#2, r1
	mov	#16, 0(r1)
	jmp	.LBB13_2
.LBB13_1:                               ; %land.end
                                        ;   in Loop: Header=BB13_2 Depth=1
	bit	#1, r12
	jeq	.LBB13_5
.LBB13_2:                               ; %do.body
                                        ; =>This Inner Loop Header: Depth=1
	clr.b	r12
	mov	#-1, r13
	add	0(r1), r13
	mov	r13, 0(r1)
	add	r13, r13
	add	&unsafe, r13
	tst	22(r13)
	jne	.LBB13_1
; %bb.3:                                ; %land.rhs
                                        ;   in Loop: Header=BB13_2 Depth=1
	mov	#1, r12
	cmp	#1, 0(r1)
	jge	.LBB13_1
; %bb.4:                                ; %land.rhs
                                        ;   in Loop: Header=BB13_2 Depth=1
	clr	r12
	jmp	.LBB13_1
.LBB13_5:                               ; %do.end
	mov	0(r1), r12
	add	r12, r12
	add	&unsafe, r12
	tst	22(r12)
	jne	.LBB13_7
; %bb.6:                                ; %if.then
	mov	&unsafe, r12
	clr	220(r12)
.LBB13_7:                               ; %if.end
	mov	&unsafe, r12
	mov	0(r1), 116(r12)
	mov	&unsafe, r12
	mov	#1, 220(r12)
	add	#2, r1
	ret
.Lfunc_end13:
	.size	task_reduce_digits, .Lfunc_end13-task_reduce_digits
                                        ; -- End function
	.globl	task_reduce_normalizable ; -- Begin function task_reduce_normalizable
	.p2align	1
	.type	task_reduce_normalizable,@function
task_reduce_normalizable:               ; @task_reduce_normalizable
.Lfunc_begin14:
; %bb.0:                                ; %entry
	sub	#10, r1
	mov.b	#1, 7(r1)
	mov	&unsafe, r12
	mov	#-7, r13
	add	116(r12), r13
	mov	r13, 150(r12)
	mov	&unsafe, r12
	mov	116(r12), 8(r1)
	tst	8(r1)
	jl	.LBB14_8
.LBB14_1:                               ; %for.body
                                        ; =>This Inner Loop Header: Depth=1
	mov	&unsafe, r12
	mov	8(r1), r13
	mov	r13, r14
	sub	150(r12), r14
	mov	r14, 4(r1)
	add	r13, r13
	add	#22, r12
	add	r12, r13
	add	r14, r14
	add	r12, r14
	cmp	0(r13), 74(r14)
	jhs	.LBB14_3
; %bb.2:                                ; %if.then
                                        ;   in Loop: Header=BB14_1 Depth=1
	clr	2(r1)
	mov	#2, 0(r1)
	jmp	.LBB14_6
.LBB14_3:                               ; %if.else
                                        ;   in Loop: Header=BB14_1 Depth=1
	mov	4(r1), r12
	add	r12, r12
	mov	#22, r13
	add	&unsafe, r13
	add	r13, r12
	mov	8(r1), r14
	add	r14, r14
	add	r13, r14
	cmp	74(r12), 0(r14)
	jhs	.LBB14_5
; %bb.4:                                ; %if.then18
                                        ;   in Loop: Header=BB14_1 Depth=1
	clr	2(r1)
	mov	#2, 0(r1)
	clr.b	7(r1)
	jmp	.LBB14_6
.LBB14_5:                               ; %if.end
                                        ;   in Loop: Header=BB14_1 Depth=1
	clr	2(r1)
	clr	0(r1)
.LBB14_6:                               ; %cleanup
                                        ;   in Loop: Header=BB14_1 Depth=1
	mov	0(r1), r12
	xor	#2, r12
	mov	2(r1), r13
	bis	r12, r13
	tst	r13
	jeq	.LBB14_8
; %bb.7:                                ; %cleanup
                                        ;   in Loop: Header=BB14_1 Depth=1
	add	#-1, 8(r1)
	tst	8(r1)
	jge	.LBB14_1
.LBB14_8:                               ; %for.end
	mov.b	7(r1), r12
	bit	#1, r12
	jne	.LBB14_11
; %bb.9:                                ; %land.lhs.true
	mov	&unsafe, r12
	cmp	#7, 116(r12)
	jne	.LBB14_11
; %bb.10:                               ; %if.then23
	mov	&unsafe, r12
	clr	220(r12)
.LBB14_11:                              ; %if.end25
	cmp.b	#1, 7(r1)
	jne	.LBB14_13
; %bb.12:                               ; %if.then27
	mov	&unsafe, r12
	mov	#1, 220(r12)
	add	#10, r1
	ret
.LBB14_13:                              ; %if.else30
	mov	&unsafe, r12
	mov	#2, 220(r12)
	add	#10, r1
	ret
.Lfunc_end14:
	.size	task_reduce_normalizable, .Lfunc_end14-task_reduce_normalizable
                                        ; -- End function
	.globl	task_reduce_normalize   ; -- Begin function task_reduce_normalize
	.p2align	1
	.type	task_reduce_normalize,@function
task_reduce_normalize:                  ; @task_reduce_normalize
.Lfunc_begin15:
; %bb.0:                                ; %entry
	sub	#14, r1
	clr	4(r1)
	clr	2(r1)
	cmp	#8, 2(r1)
	jl	.LBB15_3
	jmp	.LBB15_5
.LBB15_1:                               ; %if.else
                                        ;   in Loop: Header=BB15_3 Depth=1
	clr	4(r1)
.LBB15_2:                               ; %if.end
                                        ;   in Loop: Header=BB15_3 Depth=1
	mov	12(r1), r12
	sub	6(r1), r12
	mov	r12, 8(r1)
	mov	0(r1), r13
	add	r13, r13
	add	&unsafe, r13
	mov	r12, 22(r13)
	inc	2(r1)
	cmp	#8, 2(r1)
	jge	.LBB15_5
.LBB15_3:                               ; %for.body
                                        ; =>This Inner Loop Header: Depth=1
	mov	&unsafe, r12
	mov	2(r1), r13
	mov	r13, r14
	add	150(r12), r14
	mov	r14, 0(r1)
	add	r13, r13
	add	r12, r13
	add	r14, r14
	add	r12, r14
	mov	22(r14), r12
	mov	r12, 12(r1)
	mov	96(r13), r13
	mov	r13, 10(r1)
	add	4(r1), r13
	mov	r13, 6(r1)
	cmp	r13, r12
	jhs	.LBB15_1
; %bb.4:                                ; %if.then
                                        ;   in Loop: Header=BB15_3 Depth=1
	mov	#1, 4(r1)
	add	#256, 12(r1)
	jmp	.LBB15_2
.LBB15_5:                               ; %for.end
	mov	&unsafe, r12
	tst	150(r12)
	jeq	.LBB15_7
; %bb.6:                                ; %if.then13
	mov	&unsafe, r12
	mov	#2, 220(r12)
	add	#14, r1
	ret
.LBB15_7:                               ; %if.else15
	mov	&unsafe, r12
	clr	220(r12)
	add	#14, r1
	ret
.Lfunc_end15:
	.size	task_reduce_normalize, .Lfunc_end15-task_reduce_normalize
                                        ; -- End function
	.globl	task_reduce_n_divisor   ; -- Begin function task_reduce_n_divisor
	.p2align	1
	.type	task_reduce_n_divisor,@function
task_reduce_n_divisor:                  ; @task_reduce_n_divisor
.Lfunc_begin16:
; %bb.0:                                ; %entry
	sub	#4, r1
	mov	#7, 2(r1)
	mov	#6, 0(r1)
	mov	&unsafe, r12
	mov.b	110(r12), r13
	swpb	r13
	add	108(r12), r13
	mov	r13, 152(r12)
	add	#4, r1
	ret
.Lfunc_end16:
	.size	task_reduce_n_divisor, .Lfunc_end16-task_reduce_n_divisor
                                        ; -- End function
	.globl	task_reduce_quotient    ; -- Begin function task_reduce_quotient
	.p2align	1
	.type	task_reduce_quotient,@function
task_reduce_quotient:                   ; @task_reduce_quotient
.Lfunc_begin17:
; %bb.0:                                ; %entry
	push	r10
	sub	#14, r1
	mov	#7, 4(r1)
	mov	&unsafe, r12
	mov	#-1, r13
	add	116(r12), r13
	mov	r13, 2(r1)
	mov	#-2, r13
	add	116(r12), r13
	mov	r13, 0(r1)
	mov	116(r12), r13
	add	r13, r13
	add	r12, r13
	cmp	110(r12), 22(r13)
	jne	.LBB17_2
; %bb.1:                                ; %if.then
	mov	&unsafe, r12
	mov	#255, 218(r12)
	jmp	.LBB17_3
.LBB17_2:                               ; %if.else
	mov	2(r1), r13
	add	r13, r13
	mov	&unsafe, r10
	mov	r10, r14
	add	#22, r14
	add	r14, r13
	mov	116(r10), r12
	add	r12, r12
	add	r14, r12
	mov.b	0(r12), r12
	swpb	r12
	add	0(r13), r12
	mov	4(r1), r13
	add	r13, r13
	add	r14, r13
	mov	74(r13), r13
	call	#__mspabi_divu
	mov	r12, 218(r10)
.LBB17_3:                               ; %if.end
	mov	0(r1), r12
	add	r12, r12
	mov	&unsafe, r13
	mov	r13, r14
	add	#22, r14
	add	r14, r12
	mov	2(r1), r15
	add	r15, r15
	add	r14, r15
	mov.b	0(r15), r15
	swpb	r15
	mov	r15, r11
	add	0(r12), r11
	cmp	r15, r11
	mov	#1, r12
	bic	r2, r12
	mov	116(r13), r15
	add	r15, r15
	add	r14, r15
	add	0(r15), r12
	mov	r12, 8(r1)
	mov	r11, 6(r1)
	inc	218(r13)
	jmp	.LBB17_6
.LBB17_4:                               ; %do.body
                                        ;   in Loop: Header=BB17_6 Depth=1
	clr	r12
.LBB17_5:                               ; %do.body
                                        ;   in Loop: Header=BB17_6 Depth=1
	clr	12(r1)
	bit	#1, r12
	jeq	.LBB17_8
.LBB17_6:                               ; %do.body
                                        ; =>This Inner Loop Header: Depth=1
	mov	&unsafe, r12
	add	#-1, 218(r12)
	mov	&unsafe, r13
	mov	152(r13), r12
	mov	218(r13), r13
	call	#__mspabi_mpyi
	mov	r12, 10(r1)
	cmp	r12, 6(r1)
	mov	r2, r13
	tst	8(r1)
	jne	.LBB17_4
; %bb.7:                                ;   in Loop: Header=BB17_6 Depth=1
	mov	#1, r12
	bic	r13, r12
	jmp	.LBB17_5
.LBB17_8:                               ; %do.end
	mov	&unsafe, r12
	add	#-1, 116(r12)
	add	#14, r1
	pop	r10
	ret
.Lfunc_end17:
	.size	task_reduce_quotient, .Lfunc_end17-task_reduce_quotient
                                        ; -- End function
	.globl	task_reduce_multiply    ; -- Begin function task_reduce_multiply
	.p2align	1
	.type	task_reduce_multiply,@function
task_reduce_multiply:                   ; @task_reduce_multiply
.Lfunc_begin18:
; %bb.0:                                ; %entry
	sub	#12, r1
	mov	&unsafe, r12
	mov	#-7, r13
	add	116(r12), r13
	mov	r13, 2(r1)
	clr	10(r1)
	cmp	2(r1), 10(r1)
	jhs	.LBB18_2
.LBB18_1:                               ; %for.body
                                        ; =>This Inner Loop Header: Depth=1
	mov	10(r1), r12
	add	r12, r12
	add	&unsafe, r12
	clr	154(r12)
	inc	10(r1)
	cmp	2(r1), 10(r1)
	jlo	.LBB18_1
.LBB18_2:                               ; %for.end
	clr	4(r1)
	mov	2(r1), 10(r1)
	cmp	#16, 10(r1)
	jl	.LBB18_5
	jmp	.LBB18_7
.LBB18_3:                               ; %if.else
                                        ;   in Loop: Header=BB18_5 Depth=1
	clr	6(r1)
.LBB18_4:                               ; %if.end
                                        ;   in Loop: Header=BB18_5 Depth=1
	mov.b	9(r1), r12
	mov	r12, 4(r1)
	mov.b	8(r1), r12
	mov	r12, 8(r1)
	mov	10(r1), r13
	add	r13, r13
	add	&unsafe, r13
	mov	r12, 154(r13)
	inc	10(r1)
	cmp	#16, 10(r1)
	jge	.LBB18_7
.LBB18_5:                               ; %for.body4
                                        ; =>This Inner Loop Header: Depth=1
	mov	4(r1), 8(r1)
	mov	#8, r12
	add	2(r1), r12
	cmp	r12, 10(r1)
	jhs	.LBB18_3
; %bb.6:                                ; %if.then
                                        ;   in Loop: Header=BB18_5 Depth=1
	mov	10(r1), r12
	sub	2(r1), r12
	mov	r12, 0(r1)
	add	r12, r12
	mov	&unsafe, r14
	add	r14, r12
	mov	96(r12), r13
	mov	r13, 6(r1)
	mov	218(r14), r12
	call	#__mspabi_mpyi
	add	r12, 8(r1)
	jmp	.LBB18_4
.LBB18_7:                               ; %for.end17
	add	#12, r1
	ret
.Lfunc_end18:
	.size	task_reduce_multiply, .Lfunc_end18-task_reduce_multiply
                                        ; -- End function
	.globl	task_reduce_compare     ; -- Begin function task_reduce_compare
	.p2align	1
	.type	task_reduce_compare,@function
task_reduce_compare:                    ; @task_reduce_compare
.Lfunc_begin19:
; %bb.0:                                ; %entry
	sub	#4, r1
	mov	#15, 2(r1)
	mov.b	#61, 1(r1)
	tst	2(r1)
	jl	.LBB19_4
.LBB19_1:                               ; %for.body
                                        ; =>This Inner Loop Header: Depth=1
	mov	2(r1), r12
	add	r12, r12
	add	&unsafe, r12
	cmp	22(r12), 154(r12)
	jlo	.LBB19_7
; %bb.2:                                ; %if.else
                                        ;   in Loop: Header=BB19_1 Depth=1
	mov	2(r1), r12
	add	r12, r12
	add	&unsafe, r12
	cmp	154(r12), 22(r12)
	jlo	.LBB19_8
; %bb.3:                                ; %if.end
                                        ;   in Loop: Header=BB19_1 Depth=1
	add	#-1, 2(r1)
	tst	2(r1)
	jge	.LBB19_1
.LBB19_4:                               ; %for.end
	cmp.b	#60, 1(r1)
	jne	.LBB19_6
.LBB19_5:                               ; %if.then15
	mov	&unsafe, r12
	clr	220(r12)
.LBB19_6:                               ; %if.end17
	add	#4, r1
	ret
.LBB19_7:                               ; %if.then
	mov.b	#62, 1(r1)
	cmp.b	#60, 1(r1)
	jeq	.LBB19_5
	jmp	.LBB19_6
.LBB19_8:                               ; %if.then11
	mov.b	#60, 1(r1)
	cmp.b	#60, 1(r1)
	jeq	.LBB19_5
	jmp	.LBB19_6
.Lfunc_end19:
	.size	task_reduce_compare, .Lfunc_end19-task_reduce_compare
                                        ; -- End function
	.globl	task_reduce_add         ; -- Begin function task_reduce_add
	.p2align	1
	.type	task_reduce_add,@function
task_reduce_add:                        ; @task_reduce_add
.Lfunc_begin20:
; %bb.0:                                ; %entry
	sub	#12, r1
	mov	&unsafe, r12
	mov	#-7, r13
	add	116(r12), r13
	mov	r13, 0(r1)
	mov	r13, 10(r1)
	clr	2(r1)
	cmp	#16, 10(r1)
	jl	.LBB20_3
	jmp	.LBB20_5
.LBB20_1:                               ; %if.else
                                        ;   in Loop: Header=BB20_3 Depth=1
	clr	8(r1)
	clr	4(r1)
.LBB20_2:                               ; %if.end
                                        ;   in Loop: Header=BB20_3 Depth=1
	mov	10(r1), r12
	add	r12, r12
	add	&unsafe, r12
	mov	2(r1), r13
	add	6(r1), r13
	add	4(r1), r13
	mov	r13, 22(r12)
	mov	10(r1), r12
	add	r12, r12
	add	&unsafe, r12
	mov.b	23(r12), r13
	mov	r13, 2(r1)
	mov.b	22(r12), r13
	mov	r13, 22(r12)
	inc	10(r1)
	cmp	#16, 10(r1)
	jge	.LBB20_5
.LBB20_3:                               ; %for.body
                                        ; =>This Inner Loop Header: Depth=1
	mov	10(r1), r12
	mov	r12, r13
	add	r13, r13
	add	&unsafe, r13
	mov	22(r13), 6(r1)
	mov	0(r1), r13
	mov	r12, r14
	sub	r13, r14
	mov	r14, 8(r1)
	add	#8, r13
	cmp	r13, r12
	jhs	.LBB20_1
; %bb.4:                                ; %if.then
                                        ;   in Loop: Header=BB20_3 Depth=1
	mov	8(r1), r12
	add	r12, r12
	add	&unsafe, r12
	mov	96(r12), 4(r1)
	jmp	.LBB20_2
.LBB20_5:                               ; %for.end
	add	#12, r1
	ret
.Lfunc_end20:
	.size	task_reduce_add, .Lfunc_end20-task_reduce_add
                                        ; -- End function
	.globl	task_reduce_subtract    ; -- Begin function task_reduce_subtract
	.p2align	1
	.type	task_reduce_subtract,@function
task_reduce_subtract:                   ; @task_reduce_subtract
.Lfunc_begin21:
; %bb.0:                                ; %entry
	sub	#12, r1
	mov	&unsafe, r12
	mov	#-7, r13
	add	116(r12), r13
	mov	r13, 0(r1)
	clr	2(r1)
	clr	10(r1)
	cmp	#16, 10(r1)
	jl	.LBB21_4
	jmp	.LBB21_7
.LBB21_1:                               ; %if.else
                                        ;   in Loop: Header=BB21_4 Depth=1
	clr	2(r1)
.LBB21_2:                               ; %if.end
                                        ;   in Loop: Header=BB21_4 Depth=1
	mov	8(r1), r12
	sub	6(r1), r12
	mov	10(r1), r13
	add	r13, r13
	add	&unsafe, r13
	mov	r12, 22(r13)
.LBB21_3:                               ; %if.end13
                                        ;   in Loop: Header=BB21_4 Depth=1
	inc	10(r1)
	cmp	#16, 10(r1)
	jge	.LBB21_7
.LBB21_4:                               ; %for.body
                                        ; =>This Inner Loop Header: Depth=1
	mov	10(r1), r12
	mov	r12, r13
	add	r13, r13
	add	&unsafe, r13
	mov	22(r13), 8(r1)
	cmp	0(r1), r12
	jlo	.LBB21_3
; %bb.5:                                ; %if.then
                                        ;   in Loop: Header=BB21_4 Depth=1
	mov	10(r1), r12
	add	r12, r12
	add	&unsafe, r12
	mov	154(r12), r12
	mov	r12, 4(r1)
	add	2(r1), r12
	mov	r12, 6(r1)
	cmp	r12, 8(r1)
	jhs	.LBB21_1
; %bb.6:                                ; %if.then7
                                        ;   in Loop: Header=BB21_4 Depth=1
	mov	#1, 2(r1)
	add	#256, 8(r1)
	jmp	.LBB21_2
.LBB21_7:                               ; %for.end
	add	#12, r1
	ret
.Lfunc_end21:
	.size	task_reduce_subtract, .Lfunc_end21-task_reduce_subtract
                                        ; -- End function
	.globl	task_commit             ; -- Begin function task_commit
	.p2align	1
	.type	task_commit,@function
task_commit:                            ; @task_commit
.Lfunc_begin22:
; %bb.0:                                ; %entry
	ret
.Lfunc_end22:
	.size	task_commit, .Lfunc_end22-task_commit
                                        ; -- End function
	.globl	main                    ; -- Begin function main
	.p2align	1
	.type	main,@function
main:                                   ; @main
.Lfunc_begin23:
; %bb.0:                                ; %entry
	sub	#2, r1
	mov	#1, &camel
	clr	0(r1)
	mov	#camel+2, &safe
	mov	#camel+228, &unsafe
	call	#camel_init
.LBB23_1:                               ; %while.body
                                        ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB23_3 Depth 2
                                        ;       Child Loop BB23_4 Depth 3
                                        ;         Child Loop BB23_14 Depth 4
                                        ;         Child Loop BB23_21 Depth 4
	call	#task_init
	jmp	.LBB23_3
.LBB23_2:                               ; %if.then47
                                        ;   in Loop: Header=BB23_3 Depth=2
	call	#task_mult_block_get_result
.LBB23_3:                               ; %while.body2
                                        ;   Parent Loop BB23_1 Depth=1
                                        ; =>  This Loop Header: Depth=2
                                        ;       Child Loop BB23_4 Depth 3
                                        ;         Child Loop BB23_14 Depth 4
                                        ;         Child Loop BB23_21 Depth 4
	call	#commit
	call	#task_commit
.LBB23_4:                               ; %while.body2
                                        ;   Parent Loop BB23_1 Depth=1
                                        ;     Parent Loop BB23_3 Depth=2
                                        ; =>    This Loop Header: Depth=3
                                        ;         Child Loop BB23_14 Depth 4
                                        ;         Child Loop BB23_21 Depth 4
	mov	&safe, r12
	tst	220(r12)
	jne	.LBB23_6
; %bb.5:                                ; %if.then
                                        ;   in Loop: Header=BB23_4 Depth=3
	call	#task_pad
	call	#commit
	call	#task_commit
.LBB23_6:                               ; %if.end
                                        ;   in Loop: Header=BB23_4 Depth=3
	mov	&safe, r12
	cmp	#2, 220(r12)
	jne	.LBB23_8
; %bb.7:                                ; %if.then6
                                        ;   in Loop: Header=BB23_4 Depth=3
	call	#task_exp
	call	#commit
	call	#task_commit
.LBB23_8:                               ; %if.end7
                                        ;   in Loop: Header=BB23_4 Depth=3
	mov	&safe, r12
	tst	220(r12)
	jeq	.LBB23_11
; %bb.9:                                ; %if.else
                                        ;   in Loop: Header=BB23_4 Depth=3
	mov	&safe, r12
	cmp	#1, 220(r12)
	jne	.LBB23_13
; %bb.10:                               ; %if.then15
                                        ;   in Loop: Header=BB23_4 Depth=3
	call	#task_square_base
	jmp	.LBB23_12
.LBB23_11:                              ; %if.then11
                                        ;   in Loop: Header=BB23_4 Depth=3
	call	#task_mult_block
.LBB23_12:                              ; %if.end17
                                        ;   in Loop: Header=BB23_4 Depth=3
	call	#commit
	call	#task_commit
.LBB23_13:                              ; %if.end17
                                        ;   in Loop: Header=BB23_4 Depth=3
	call	#task_mult_mod
	call	#commit
	call	#task_commit
.LBB23_14:                              ; %do.body
                                        ;   Parent Loop BB23_1 Depth=1
                                        ;     Parent Loop BB23_3 Depth=2
                                        ;       Parent Loop BB23_4 Depth=3
                                        ; =>      This Inner Loop Header: Depth=4
	call	#task_mult
	call	#commit
	call	#task_commit
	mov	&safe, r12
	cmp	#16, 112(r12)
	jlo	.LBB23_14
; %bb.15:                               ; %do.end
                                        ;   in Loop: Header=BB23_4 Depth=3
	call	#task_reduce_digits
	call	#commit
	call	#task_commit
	mov	&safe, r12
	tst	220(r12)
	jeq	.LBB23_1
; %bb.16:                               ; %if.end24
                                        ;   in Loop: Header=BB23_4 Depth=3
	call	#task_reduce_normalizable
	call	#commit
	call	#task_commit
	mov	&safe, r12
	cmp	#1, 220(r12)
	jne	.LBB23_18
; %bb.17:                               ; %if.then28
                                        ;   in Loop: Header=BB23_4 Depth=3
	call	#task_reduce_normalize
	call	#commit
	call	#task_commit
.LBB23_18:                              ; %if.end29
                                        ;   in Loop: Header=BB23_4 Depth=3
	mov	&safe, r12
	cmp	#2, 220(r12)
	jne	.LBB23_23
; %bb.19:                               ; %if.then33
                                        ;   in Loop: Header=BB23_4 Depth=3
	call	#task_reduce_n_divisor
	call	#commit
	call	#task_commit
	jmp	.LBB23_21
.LBB23_20:                              ; %if.end39
                                        ;   in Loop: Header=BB23_21 Depth=4
	call	#task_reduce_subtract
	call	#commit
	call	#task_commit
	mov	&safe, r12
	mov	#1, r13
	add	116(r12), r13
	cmp	#9, r13
	jlo	.LBB23_23
.LBB23_21:                              ; %do.body34
                                        ;   Parent Loop BB23_1 Depth=1
                                        ;     Parent Loop BB23_3 Depth=2
                                        ;       Parent Loop BB23_4 Depth=3
                                        ; =>      This Inner Loop Header: Depth=4
	call	#task_reduce_quotient
	call	#commit
	call	#task_commit
	call	#task_reduce_multiply
	call	#commit
	call	#task_commit
	call	#task_reduce_compare
	call	#commit
	call	#task_commit
	mov	&safe, r12
	tst	220(r12)
	jne	.LBB23_20
; %bb.22:                               ; %if.then38
                                        ;   in Loop: Header=BB23_21 Depth=4
	call	#task_reduce_compare
	call	#commit
	call	#task_commit
	jmp	.LBB23_20
.LBB23_23:                              ; %if.end44
                                        ;   in Loop: Header=BB23_4 Depth=3
	mov	&safe, r12
	tst	222(r12)
	jeq	.LBB23_2
; %bb.24:                               ; %if.else48
                                        ;   in Loop: Header=BB23_4 Depth=3
	mov	&safe, r12
	cmp	#1, 222(r12)
	jne	.LBB23_4
; %bb.25:                               ; %if.then52
                                        ;   in Loop: Header=BB23_3 Depth=2
	call	#task_square_base_get_result
	jmp	.LBB23_3
.Lfunc_end23:
	.size	main, .Lfunc_end23-main
                                        ; -- End function
	.type	camel,@object           ; @camel
	.comm	camel,454,2
	.type	safe,@object            ; @safe
	.comm	safe,2,2
	.type	unsafe,@object          ; @unsafe
	.comm	unsafe,2,2
	.type	tmp_stack_crc,@object   ; @tmp_stack_crc
	.comm	tmp_stack_crc,2,2
	.type	tmp_stack_buf_crc,@object ; @tmp_stack_buf_crc
	.comm	tmp_stack_buf_crc,2,2
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

	.type	buf,@object             ; @buf
	.comm	buf,22,2

	.ident	"clang version 10.0.0 (https://github.com/llvm/llvm-project.git f79f68975d51b389d9f141aa30ab47723a75a868)"
	.section	".note.GNU-stack","",@progbits
