	.text
	.file	"camel_cuckoo.c"
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
	mov	#camel+302, &unsafe
	jmp	.LBB1_6
.LBB1_2:                                ; %if.else
	mov	&camel, r12
	cmp	#2, r12
	jne	.LBB1_4
	jmp	.LBB1_3
.LBB1_3:                                ; %if.then2
	mov	#camel+302, &safe
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
	mov	#298, r13
	call	#__fast_hw_crc
	mov	r12, &tmp_stack_buf_crc
	mov	&tmp_stack_buf_crc, r12
	mov	&safe, r13
	mov	298(r13), r13
	cmp	r13, r12
	jne	.LBB1_8
	jmp	.LBB1_7
.LBB1_7:                                ; %if.then10
	mov	&unsafe, r12
	mov	&safe, r13
	mov	#300, r14
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
	sub	#2, r1
	clr	0(r1)
	jmp	.LBB2_1
.LBB2_1:                                ; %for.cond
                                        ; =>This Inner Loop Header: Depth=1
	mov	0(r1), r12
	cmp	#128, r12
	jhs	.LBB2_4
	jmp	.LBB2_2
.LBB2_2:                                ; %for.body
                                        ;   in Loop: Header=BB2_1 Depth=1
	mov	&unsafe, r12
	mov	0(r1), r13
	add	r13, r13
	add	r13, r12
	clr	22(r12)
	jmp	.LBB2_3
.LBB2_3:                                ; %for.inc
                                        ;   in Loop: Header=BB2_1 Depth=1
	mov	0(r1), r12
	inc	r12
	mov	r12, 0(r1)
	jmp	.LBB2_1
.LBB2_4:                                ; %for.end
	mov	&unsafe, r12
	clr	288(r12)
	mov	&unsafe, r12
	clr	292(r12)
	mov	&unsafe, r12
	clr	290(r12)
	mov	&unsafe, r12
	clr	294(r12)
	mov	&unsafe, r12
	mov	#1, 278(r12)
	add	#2, r1
	ret
.Lfunc_end2:
	.size	task_init, .Lfunc_end2-task_init
                                        ; -- End function
	.globl	task_generate_key       ; -- Begin function task_generate_key
	.p2align	1
	.type	task_generate_key,@function
task_generate_key:                      ; @task_generate_key
.Lfunc_begin3:
; %bb.0:                                ; %entry
	push	r10
	mov	&unsafe, r10
	mov	278(r10), r12
	mov	#17, r13
	call	#__mspabi_mpyi
	add	#17, r12
	mov	r12, 278(r10)
	pop	r10
	ret
.Lfunc_end3:
	.size	task_generate_key, .Lfunc_end3-task_generate_key
                                        ; -- End function
	.globl	task_calc_indexes       ; -- Begin function task_calc_indexes
	.p2align	1
	.type	task_calc_indexes,@function
task_calc_indexes:                      ; @task_calc_indexes
.Lfunc_begin4:
; %bb.0:                                ; %entry
	mov	&unsafe, r12
	mov	278(r12), r12
	call	#hash_to_fingerprint
	mov	&unsafe, r13
	mov	r12, 280(r13)
	ret
.Lfunc_end4:
	.size	task_calc_indexes, .Lfunc_end4-task_calc_indexes
                                        ; -- End function
	.p2align	1               ; -- Begin function hash_to_fingerprint
	.type	hash_to_fingerprint,@function
hash_to_fingerprint:                    ; @hash_to_fingerprint
.Lfunc_begin5:
; %bb.0:                                ; %entry
	sub	#2, r1
	mov	r12, 0(r1)
	mov	r1, r12
	mov	#2, r13
	call	#djb_hash
	add	#2, r1
	ret
.Lfunc_end5:
	.size	hash_to_fingerprint, .Lfunc_end5-hash_to_fingerprint
                                        ; -- End function
	.globl	task_calc_indexes_index_1 ; -- Begin function task_calc_indexes_index_1
	.p2align	1
	.type	task_calc_indexes_index_1,@function
task_calc_indexes_index_1:              ; @task_calc_indexes_index_1
.Lfunc_begin6:
; %bb.0:                                ; %entry
	mov	&unsafe, r12
	mov	278(r12), r12
	call	#hash_to_index
	mov	&unsafe, r13
	mov	r12, 282(r13)
	ret
.Lfunc_end6:
	.size	task_calc_indexes_index_1, .Lfunc_end6-task_calc_indexes_index_1
                                        ; -- End function
	.p2align	1               ; -- Begin function hash_to_index
	.type	hash_to_index,@function
hash_to_index:                          ; @hash_to_index
.Lfunc_begin7:
; %bb.0:                                ; %entry
	sub	#4, r1
	mov	r12, 2(r1)
	mov	r1, r12
	add	#2, r12
	mov	#2, r13
	call	#djb_hash
	mov	r12, 0(r1)
	mov	0(r1), r12
	and	#127, r12
	add	#4, r1
	ret
.Lfunc_end7:
	.size	hash_to_index, .Lfunc_end7-hash_to_index
                                        ; -- End function
	.globl	task_calc_indexes_index_2 ; -- Begin function task_calc_indexes_index_2
	.p2align	1
	.type	task_calc_indexes_index_2,@function
task_calc_indexes_index_2:              ; @task_calc_indexes_index_2
.Lfunc_begin8:
; %bb.0:                                ; %entry
	sub	#2, r1
	mov	&unsafe, r12
	mov	280(r12), r12
	call	#hash_to_index
	mov	r12, 0(r1)
	mov	&unsafe, r12
	mov	282(r12), r13
	mov	0(r1), r14
	xor	r14, r13
	mov	r13, 284(r12)
	add	#2, r1
	ret
.Lfunc_end8:
	.size	task_calc_indexes_index_2, .Lfunc_end8-task_calc_indexes_index_2
                                        ; -- End function
	.globl	task_add                ; -- Begin function task_add
	.p2align	1
	.type	task_add,@function
task_add:                               ; @task_add
.Lfunc_begin9:
; %bb.0:                                ; %entry
	sub	#4, r1
	mov	&unsafe, r12
	mov	282(r12), r13
	add	r13, r13
	add	r13, r12
	mov	22(r12), r12
	tst	r12
	jne	.LBB9_2
	jmp	.LBB9_1
.LBB9_1:                                ; %if.then
	mov	&unsafe, r12
	mov.b	#1, 296(r12)
	mov	&unsafe, r12
	mov	282(r12), r13
	add	r13, r13
	mov	r12, r14
	add	r13, r14
	mov	280(r12), r12
	mov	r12, 22(r14)
	jmp	.LBB9_9
.LBB9_2:                                ; %if.else
	mov	&unsafe, r12
	mov	284(r12), r13
	add	r13, r13
	add	r13, r12
	mov	22(r12), r12
	tst	r12
	jne	.LBB9_4
	jmp	.LBB9_3
.LBB9_3:                                ; %if.then14
	mov	&unsafe, r12
	mov.b	#1, 296(r12)
	mov	&unsafe, r12
	mov	284(r12), r13
	add	r13, r13
	mov	r12, r14
	add	r13, r14
	mov	280(r12), r12
	mov	r12, 22(r14)
	jmp	.LBB9_8
.LBB9_4:                                ; %if.else24
	call	#rand
	mov	r12, r13
	swpb	r13
	mov.b	r13, r13
	clrc
	rrc	r13
	rra	r13
	rra	r13
	rra	r13
	rra	r13
	rra	r13
	rra	r13
	mov	r12, r14
	add	r13, r14
	and	#-2, r14
	sub	r14, r12
	tst	r12
	jeq	.LBB9_6
	jmp	.LBB9_5
.LBB9_5:                                ; %if.then26
	mov	&unsafe, r12
	mov	282(r12), r12
	mov	r12, 0(r1)
	mov	&unsafe, r12
	mov	282(r12), r13
	add	r13, r13
	add	r13, r12
	mov	22(r12), r12
	mov	r12, 2(r1)
	jmp	.LBB9_7
.LBB9_6:                                ; %if.else34
	mov	&unsafe, r12
	mov	284(r12), r12
	mov	r12, 0(r1)
	mov	&unsafe, r12
	mov	284(r12), r13
	add	r13, r13
	add	r13, r12
	mov	22(r12), r12
	mov	r12, 2(r1)
	jmp	.LBB9_7
.LBB9_7:                                ; %if.end
	mov	&unsafe, r12
	mov	0(r1), r13
	add	r13, r13
	mov	r12, r14
	add	r13, r14
	mov	280(r12), r12
	mov	r12, 22(r14)
	mov	0(r1), r12
	mov	&unsafe, r13
	mov	r12, 282(r13)
	mov	2(r1), r12
	mov	&unsafe, r13
	mov	r12, 280(r13)
	mov	&unsafe, r12
	clr	286(r12)
	jmp	.LBB9_8
.LBB9_8:                                ; %if.end52
	jmp	.LBB9_9
.LBB9_9:                                ; %if.end53
	add	#4, r1
	ret
.Lfunc_end9:
	.size	task_add, .Lfunc_end9-task_add
                                        ; -- End function
	.globl	task_relocate           ; -- Begin function task_relocate
	.p2align	1
	.type	task_relocate,@function
task_relocate:                          ; @task_relocate
.Lfunc_begin10:
; %bb.0:                                ; %entry
	sub	#6, r1
	mov	&unsafe, r12
	mov	280(r12), r12
	mov	r12, 4(r1)
	mov	4(r1), r12
	call	#hash_to_index
	mov	r12, 2(r1)
	mov	&unsafe, r12
	mov	282(r12), r12
	mov	2(r1), r13
	xor	r13, r12
	mov	r12, 0(r1)
	mov	&unsafe, r12
	mov	0(r1), r13
	add	r13, r13
	add	r13, r12
	mov	22(r12), r12
	tst	r12
	jne	.LBB10_2
	jmp	.LBB10_1
.LBB10_1:                               ; %if.then
	mov	&unsafe, r12
	mov.b	#1, 296(r12)
	mov	4(r1), r12
	mov	&unsafe, r13
	mov	0(r1), r14
	add	r14, r14
	add	r14, r13
	mov	r12, 22(r13)
	jmp	.LBB10_5
.LBB10_2:                               ; %if.end
	mov	&unsafe, r12
	mov	286(r12), r12
	cmp	#8, r12
	jlo	.LBB10_4
	jmp	.LBB10_3
.LBB10_3:                               ; %if.then8
	mov	&unsafe, r12
	clr.b	296(r12)
	jmp	.LBB10_5
.LBB10_4:                               ; %if.end11
	mov	&unsafe, r12
	mov	286(r12), r13
	inc	r13
	mov	r13, 286(r12)
	mov	0(r1), r12
	mov	&unsafe, r13
	mov	r12, 282(r13)
	mov	&unsafe, r12
	mov	0(r1), r13
	add	r13, r13
	mov	r12, r14
	add	r13, r14
	mov	22(r14), r13
	mov	r13, 280(r12)
	mov	4(r1), r12
	mov	&unsafe, r13
	mov	0(r1), r14
	add	r14, r14
	add	r14, r13
	mov	r12, 22(r13)
	jmp	.LBB10_5
.LBB10_5:                               ; %return
	add	#6, r1
	ret
.Lfunc_end10:
	.size	task_relocate, .Lfunc_end10-task_relocate
                                        ; -- End function
	.globl	task_insert_done        ; -- Begin function task_insert_done
	.p2align	1
	.type	task_insert_done,@function
task_insert_done:                       ; @task_insert_done
.Lfunc_begin11:
; %bb.0:                                ; %entry
	mov	&unsafe, r12
	mov	288(r12), r13
	inc	r13
	mov	r13, 288(r12)
	mov	&unsafe, r12
	mov.b	296(r12), r13
	and	#1, r13
	mov	290(r12), r14
	add	r13, r14
	mov	r14, 290(r12)
	mov	&unsafe, r12
	mov	288(r12), r12
	cmp	#32, r12
	jlo	.LBB11_2
	jmp	.LBB11_1
.LBB11_1:                               ; %if.then
	mov	&unsafe, r12
	mov	#1, 278(r12)
	jmp	.LBB11_2
.LBB11_2:                               ; %if.end
	ret
.Lfunc_end11:
	.size	task_insert_done, .Lfunc_end11-task_insert_done
                                        ; -- End function
	.globl	task_lookup_search      ; -- Begin function task_lookup_search
	.p2align	1
	.type	task_lookup_search,@function
task_lookup_search:                     ; @task_lookup_search
.Lfunc_begin12:
; %bb.0:                                ; %entry
	mov	&unsafe, r12
	mov	282(r12), r13
	add	r13, r13
	mov	r12, r14
	add	r13, r14
	mov	22(r14), r13
	mov	280(r12), r12
	cmp	r12, r13
	jne	.LBB12_2
	jmp	.LBB12_1
.LBB12_1:                               ; %if.then
	mov	&unsafe, r12
	mov.b	#1, 297(r12)
	jmp	.LBB12_6
.LBB12_2:                               ; %if.else
	mov	&unsafe, r12
	mov	284(r12), r13
	add	r13, r13
	mov	r12, r14
	add	r13, r14
	mov	22(r14), r13
	mov	280(r12), r12
	cmp	r12, r13
	jne	.LBB12_4
	jmp	.LBB12_3
.LBB12_3:                               ; %if.then11
	mov	&unsafe, r12
	mov.b	#1, 297(r12)
	jmp	.LBB12_5
.LBB12_4:                               ; %if.else14
	mov	&unsafe, r12
	clr.b	297(r12)
	jmp	.LBB12_5
.LBB12_5:                               ; %if.end
	jmp	.LBB12_6
.LBB12_6:                               ; %if.end17
	ret
.Lfunc_end12:
	.size	task_lookup_search, .Lfunc_end12-task_lookup_search
                                        ; -- End function
	.globl	task_lookup_done        ; -- Begin function task_lookup_done
	.p2align	1
	.type	task_lookup_done,@function
task_lookup_done:                       ; @task_lookup_done
.Lfunc_begin13:
; %bb.0:                                ; %entry
	mov	&unsafe, r12
	mov	292(r12), r13
	inc	r13
	mov	r13, 292(r12)
	mov	&unsafe, r12
	mov.b	297(r12), r13
	and	#1, r13
	mov	294(r12), r14
	add	r13, r14
	mov	r14, 294(r12)
	ret
.Lfunc_end13:
	.size	task_lookup_done, .Lfunc_end13-task_lookup_done
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
	clr	0(r1)
	mov	#1, &camel
	mov	#camel+2, &safe
	mov	#camel+302, &unsafe
	call	#camel_init
	call	#task_init
	jmp	.LBB16_1
.LBB16_1:                               ; %while.cond
                                        ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB16_6 Depth 2
	mov	&unsafe, r12
	mov	292(r12), r12
	cmp	#32, r12
	jhs	.LBB16_14
	jmp	.LBB16_2
.LBB16_2:                               ; %while.body
                                        ;   in Loop: Header=BB16_1 Depth=1
	call	#task_generate_key
	call	#task_calc_indexes
	call	#task_calc_indexes_index_1
	call	#task_calc_indexes_index_2
	mov	&unsafe, r12
	mov	288(r12), r12
	cmp	#32, r12
	jhs	.LBB16_12
	jmp	.LBB16_3
.LBB16_3:                               ; %if.then
                                        ;   in Loop: Header=BB16_1 Depth=1
	call	#task_add
	mov	&unsafe, r12
	mov	282(r12), r13
	add	r13, r13
	add	r13, r12
	mov	22(r12), r12
	tst	r12
	jeq	.LBB16_11
	jmp	.LBB16_4
.LBB16_4:                               ; %land.lhs.true
                                        ;   in Loop: Header=BB16_1 Depth=1
	mov	&unsafe, r12
	mov	284(r12), r13
	add	r13, r13
	add	r13, r12
	mov	22(r12), r12
	tst	r12
	jeq	.LBB16_11
	jmp	.LBB16_5
.LBB16_5:                               ; %if.then10
                                        ;   in Loop: Header=BB16_1 Depth=1
	jmp	.LBB16_6
.LBB16_6:                               ; %while.cond11
                                        ;   Parent Loop BB16_1 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	mov	&unsafe, r12
	mov.b	296(r12), r13
	clr.b	r12
	bit.b	#1, r13
	jne	.LBB16_8
	jmp	.LBB16_7
.LBB16_7:                               ; %land.rhs
                                        ;   in Loop: Header=BB16_6 Depth=2
	mov	&unsafe, r12
	mov	286(r12), r12
	cmp	#8, r12
	mov	#1, r12
	bic	r2, r12
	jmp	.LBB16_8
.LBB16_8:                               ; %land.end
                                        ;   in Loop: Header=BB16_6 Depth=2
	bit	#1, r12
	jeq	.LBB16_10
	jmp	.LBB16_9
.LBB16_9:                               ; %while.body19
                                        ;   in Loop: Header=BB16_6 Depth=2
	call	#task_relocate
	jmp	.LBB16_6
.LBB16_10:                              ; %while.end
                                        ;   in Loop: Header=BB16_1 Depth=1
	jmp	.LBB16_11
.LBB16_11:                              ; %if.end
                                        ;   in Loop: Header=BB16_1 Depth=1
	call	#task_insert_done
	jmp	.LBB16_13
.LBB16_12:                              ; %if.else
                                        ;   in Loop: Header=BB16_1 Depth=1
	call	#task_lookup_search
	call	#task_lookup_done
	jmp	.LBB16_13
.LBB16_13:                              ; %if.end20
                                        ;   in Loop: Header=BB16_1 Depth=1
	jmp	.LBB16_1
.LBB16_14:                              ; %while.end21
	call	#task_done
	mov	0(r1), r12
	add	#2, r1
	ret
.Lfunc_end16:
	.size	main, .Lfunc_end16-main
                                        ; -- End function
	.p2align	1               ; -- Begin function djb_hash
	.type	djb_hash,@function
djb_hash:                               ; @djb_hash
.Lfunc_begin17:
; %bb.0:                                ; %entry
	sub	#8, r1
	mov	r12, 6(r1)
	mov	r13, 4(r1)
	mov	#5381, 2(r1)
	clr	0(r1)
	jmp	.LBB17_1
.LBB17_1:                               ; %for.cond
                                        ; =>This Inner Loop Header: Depth=1
	mov	0(r1), r12
	mov	4(r1), r13
	cmp	r13, r12
	jhs	.LBB17_4
	jmp	.LBB17_2
.LBB17_2:                               ; %for.body
                                        ;   in Loop: Header=BB17_1 Depth=1
	mov	2(r1), r12
	mov	r12, r13
	add	r13, r13
	add	r13, r13
	add	r13, r13
	add	r13, r13
	add	r13, r13
	add	r12, r13
	mov	6(r1), r12
	mov.b	0(r12), r12
	add	r12, r13
	mov	r13, 2(r1)
	jmp	.LBB17_3
.LBB17_3:                               ; %for.inc
                                        ;   in Loop: Header=BB17_1 Depth=1
	mov	6(r1), r12
	inc	r12
	mov	r12, 6(r1)
	mov	0(r1), r12
	inc	r12
	mov	r12, 0(r1)
	jmp	.LBB17_1
.LBB17_4:                               ; %for.end
	mov	2(r1), r12
	add	#8, r1
	ret
.Lfunc_end17:
	.size	djb_hash, .Lfunc_end17-djb_hash
                                        ; -- End function
	.type	camel,@object           ; @camel
	.comm	camel,602,2
	.type	safe,@object            ; @safe
	.comm	safe,2,2
	.type	unsafe,@object          ; @unsafe
	.comm	unsafe,2,2
	.type	tmp_stack_crc,@object   ; @tmp_stack_crc
	.comm	tmp_stack_crc,2,2
	.type	tmp_stack_buf_crc,@object ; @tmp_stack_buf_crc
	.comm	tmp_stack_buf_crc,2,2
	.type	init_key,@object        ; @init_key
	.section	.rodata,"a",@progbits
	.globl	init_key
	.p2align	1
init_key:
	.short	1                       ; 0x1
	.size	init_key, 2

	.type	writeOpt,@object        ; @writeOpt
	.section	.bss,"aw",@nobits
	.globl	writeOpt
	.p2align	1
writeOpt:
	.short	0                       ; 0x0
	.size	writeOpt, 2

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
