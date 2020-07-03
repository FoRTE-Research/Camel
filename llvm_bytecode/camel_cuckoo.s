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
	mov	#camel+302, &unsafe
	mov	#camel+2, &safe
	jmp	.LBB1_5
.LBB1_2:                                ; %if.else
	cmp	#2, &camel
	jne	.LBB1_4
; %bb.3:                                ; %if.then2
	mov	#camel+2, &unsafe
	mov	#camel+302, &safe
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
	mov	#298, r13
	call	#__fast_hw_crc
	mov	r12, &tmp_stack_buf_crc
	mov	&safe, r13
	cmp	298(r13), r12
	jne	.LBB1_7
; %bb.6:                                ; %if.then10
	mov	&safe, r13
	mov	&unsafe, r12
	mov	#300, r14
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
	mov	#camel+302, &safe
	mov	#camel+302, r12
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
	mov	#298, r13
	call	#__fast_hw_crc
	mov	r12, &tmp_stack_buf_crc
	mov	&safe, r13
	mov	r12, 298(r13)
	mov	#2, &camel
	add	#16, r1
	ret
.LBB2_2:                                ; %if.else
	mov	#camel+302, &unsafe
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
	mov	#298, r13
	call	#__fast_hw_crc
	mov	r12, &tmp_stack_buf_crc
	mov	&safe, r13
	mov	r12, 298(r13)
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
	sub	#2, r1
	clr	0(r1)
	cmp	#128, 0(r1)
	jhs	.LBB3_2
.LBB3_1:                                ; %for.body
                                        ; =>This Inner Loop Header: Depth=1
	mov	0(r1), r12
	add	r12, r12
	add	&unsafe, r12
	clr	22(r12)
	inc	0(r1)
	cmp	#128, 0(r1)
	jlo	.LBB3_1
.LBB3_2:                                ; %for.end
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
.Lfunc_end3:
	.size	task_init, .Lfunc_end3-task_init
                                        ; -- End function
	.globl	task_generate_key       ; -- Begin function task_generate_key
	.p2align	1
	.type	task_generate_key,@function
task_generate_key:                      ; @task_generate_key
.Lfunc_begin4:
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
.Lfunc_end4:
	.size	task_generate_key, .Lfunc_end4-task_generate_key
                                        ; -- End function
	.globl	task_calc_indexes       ; -- Begin function task_calc_indexes
	.p2align	1
	.type	task_calc_indexes,@function
task_calc_indexes:                      ; @task_calc_indexes
.Lfunc_begin5:
; %bb.0:                                ; %entry
	mov	&unsafe, r12
	mov	278(r12), r12
	call	#hash_to_fingerprint
	mov	&unsafe, r13
	mov	r12, 280(r13)
	ret
.Lfunc_end5:
	.size	task_calc_indexes, .Lfunc_end5-task_calc_indexes
                                        ; -- End function
	.p2align	1               ; -- Begin function hash_to_fingerprint
	.type	hash_to_fingerprint,@function
hash_to_fingerprint:                    ; @hash_to_fingerprint
.Lfunc_begin6:
; %bb.0:                                ; %entry
	sub	#2, r1
	mov	r12, 0(r1)
	mov	r1, r12
	mov	#2, r13
	call	#djb_hash
	add	#2, r1
	ret
.Lfunc_end6:
	.size	hash_to_fingerprint, .Lfunc_end6-hash_to_fingerprint
                                        ; -- End function
	.globl	task_calc_indexes_index_1 ; -- Begin function task_calc_indexes_index_1
	.p2align	1
	.type	task_calc_indexes_index_1,@function
task_calc_indexes_index_1:              ; @task_calc_indexes_index_1
.Lfunc_begin7:
; %bb.0:                                ; %entry
	mov	&unsafe, r12
	mov	278(r12), r12
	call	#hash_to_index
	mov	&unsafe, r13
	mov	r12, 282(r13)
	ret
.Lfunc_end7:
	.size	task_calc_indexes_index_1, .Lfunc_end7-task_calc_indexes_index_1
                                        ; -- End function
	.p2align	1               ; -- Begin function hash_to_index
	.type	hash_to_index,@function
hash_to_index:                          ; @hash_to_index
.Lfunc_begin8:
; %bb.0:                                ; %entry
	sub	#4, r1
	mov	r12, 2(r1)
	mov	r1, r12
	add	#2, r12
	mov	#2, r13
	call	#djb_hash
	and	#127, r12
	add	#4, r1
	ret
.Lfunc_end8:
	.size	hash_to_index, .Lfunc_end8-hash_to_index
                                        ; -- End function
	.globl	task_calc_indexes_index_2 ; -- Begin function task_calc_indexes_index_2
	.p2align	1
	.type	task_calc_indexes_index_2,@function
task_calc_indexes_index_2:              ; @task_calc_indexes_index_2
.Lfunc_begin9:
; %bb.0:                                ; %entry
	sub	#2, r1
	mov	&unsafe, r12
	mov	280(r12), r12
	call	#hash_to_index
	mov	r12, 0(r1)
	mov	&unsafe, r13
	xor	282(r13), r12
	mov	r12, 284(r13)
	add	#2, r1
	ret
.Lfunc_end9:
	.size	task_calc_indexes_index_2, .Lfunc_end9-task_calc_indexes_index_2
                                        ; -- End function
	.globl	task_add                ; -- Begin function task_add
	.p2align	1
	.type	task_add,@function
task_add:                               ; @task_add
.Lfunc_begin10:
; %bb.0:                                ; %entry
	sub	#4, r1
	mov	&unsafe, r12
	mov	282(r12), r13
	add	r13, r13
	add	r12, r13
	tst	22(r13)
	jeq	.LBB10_4
; %bb.1:                                ; %if.else
	mov	&unsafe, r12
	mov	284(r12), r13
	add	r13, r13
	add	r12, r13
	tst	22(r13)
	jeq	.LBB10_5
; %bb.2:                                ; %if.else24
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
	add	r12, r13
	and	#-2, r13
	sub	r13, r12
	tst	r12
	jeq	.LBB10_7
; %bb.3:                                ; %if.then26
	mov	&unsafe, r12
	mov	282(r12), 0(r1)
	mov	282(r12), r13
	jmp	.LBB10_8
.LBB10_4:                               ; %if.then
	mov	&unsafe, r12
	mov.b	#1, 296(r12)
	mov	&unsafe, r12
	mov	282(r12), r13
	jmp	.LBB10_6
.LBB10_5:                               ; %if.then14
	mov	&unsafe, r12
	mov.b	#1, 296(r12)
	mov	&unsafe, r12
	mov	284(r12), r13
.LBB10_6:                               ; %if.end53
	add	r13, r13
	add	r12, r13
	mov	280(r12), 22(r13)
	add	#4, r1
	ret
.LBB10_7:                               ; %if.else34
	mov	&unsafe, r12
	mov	284(r12), 0(r1)
	mov	284(r12), r13
.LBB10_8:                               ; %if.end
	add	r13, r13
	add	r12, r13
	mov	22(r13), 2(r1)
	mov	0(r1), r12
	add	r12, r12
	mov	&unsafe, r13
	add	r13, r12
	mov	280(r13), 22(r12)
	mov	&unsafe, r12
	mov	0(r1), 282(r12)
	mov	&unsafe, r12
	mov	2(r1), 280(r12)
	mov	&unsafe, r12
	clr	286(r12)
	add	#4, r1
	ret
.Lfunc_end10:
	.size	task_add, .Lfunc_end10-task_add
                                        ; -- End function
	.globl	task_relocate           ; -- Begin function task_relocate
	.p2align	1
	.type	task_relocate,@function
task_relocate:                          ; @task_relocate
.Lfunc_begin11:
; %bb.0:                                ; %entry
	sub	#10, r1
	mov	&unsafe, r12
	mov	280(r12), r12
	mov	r12, 8(r1)
	call	#hash_to_index
	mov	r12, 6(r1)
	mov	&unsafe, r13
	xor	282(r13), r12
	mov	r12, 4(r1)
	add	r12, r12
	add	r13, r12
	tst	22(r12)
	jeq	.LBB11_3
; %bb.1:                                ; %if.end
	mov	&unsafe, r12
	cmp	#8, 286(r12)
	jlo	.LBB11_5
; %bb.2:                                ; %if.then8
	mov	&unsafe, r12
	clr.b	296(r12)
	jmp	.LBB11_4
.LBB11_3:                               ; %if.then
	mov	&unsafe, r12
	mov.b	#1, 296(r12)
	mov	4(r1), r12
	add	r12, r12
	add	&unsafe, r12
	mov	8(r1), 22(r12)
.LBB11_4:                               ; %cleanup
	clr	2(r1)
	mov	#1, 0(r1)
	add	#10, r1
	ret
.LBB11_5:                               ; %if.end11
	mov	&unsafe, r12
	inc	286(r12)
	mov	&unsafe, r12
	mov	4(r1), 282(r12)
	mov	4(r1), r12
	add	r12, r12
	mov	&unsafe, r13
	add	r13, r12
	mov	22(r12), 280(r13)
	mov	4(r1), r12
	add	r12, r12
	add	&unsafe, r12
	mov	8(r1), 22(r12)
	clr	2(r1)
	clr	0(r1)
	add	#10, r1
	ret
.Lfunc_end11:
	.size	task_relocate, .Lfunc_end11-task_relocate
                                        ; -- End function
	.globl	task_insert_done        ; -- Begin function task_insert_done
	.p2align	1
	.type	task_insert_done,@function
task_insert_done:                       ; @task_insert_done
.Lfunc_begin12:
; %bb.0:                                ; %entry
	mov	&unsafe, r12
	inc	288(r12)
	mov	&unsafe, r12
	mov.b	296(r12), r13
	add	r13, 290(r12)
	mov	&unsafe, r12
	cmp	#32, 288(r12)
	jlo	.LBB12_2
; %bb.1:                                ; %if.then
	mov	&unsafe, r12
	mov	#1, 278(r12)
.LBB12_2:                               ; %if.end
	ret
.Lfunc_end12:
	.size	task_insert_done, .Lfunc_end12-task_insert_done
                                        ; -- End function
	.globl	task_lookup_search      ; -- Begin function task_lookup_search
	.p2align	1
	.type	task_lookup_search,@function
task_lookup_search:                     ; @task_lookup_search
.Lfunc_begin13:
; %bb.0:                                ; %entry
	mov	&unsafe, r12
	mov	282(r12), r13
	add	r13, r13
	add	r12, r13
	cmp	280(r12), 22(r13)
	jeq	.LBB13_2
; %bb.1:                                ; %if.else
	mov	&unsafe, r12
	mov	284(r12), r13
	add	r13, r13
	add	r12, r13
	cmp	280(r12), 22(r13)
	jne	.LBB13_3
.LBB13_2:                               ; %if.then
	mov	&unsafe, r12
	mov.b	#1, 297(r12)
	ret
.LBB13_3:                               ; %if.else14
	mov	&unsafe, r12
	clr.b	297(r12)
	ret
.Lfunc_end13:
	.size	task_lookup_search, .Lfunc_end13-task_lookup_search
                                        ; -- End function
	.globl	task_lookup_done        ; -- Begin function task_lookup_done
	.p2align	1
	.type	task_lookup_done,@function
task_lookup_done:                       ; @task_lookup_done
.Lfunc_begin14:
; %bb.0:                                ; %entry
	mov	&unsafe, r12
	inc	292(r12)
	mov	&unsafe, r12
	mov.b	297(r12), r13
	add	r13, 294(r12)
	ret
.Lfunc_end14:
	.size	task_lookup_done, .Lfunc_end14-task_lookup_done
                                        ; -- End function
	.globl	task_done               ; -- Begin function task_done
	.p2align	1
	.type	task_done,@function
task_done:                              ; @task_done
.Lfunc_begin15:
; %bb.0:                                ; %entry
	clr	r12
	call	#exit
.Lfunc_end15:
	.size	task_done, .Lfunc_end15-task_done
                                        ; -- End function
	.globl	task_commit             ; -- Begin function task_commit
	.p2align	1
	.type	task_commit,@function
task_commit:                            ; @task_commit
.Lfunc_begin16:
; %bb.0:                                ; %entry
	ret
.Lfunc_end16:
	.size	task_commit, .Lfunc_end16-task_commit
                                        ; -- End function
	.globl	main                    ; -- Begin function main
	.p2align	1
	.type	main,@function
main:                                   ; @main
.Lfunc_begin17:
; %bb.0:                                ; %entry
	sub	#2, r1
	mov	#1, &camel
	clr	0(r1)
	mov	#camel+2, &safe
	mov	#camel+302, &unsafe
	call	#camel_init
	call	#task_init
	jmp	.LBB17_2
.LBB17_1:                               ; %if.else
                                        ;   in Loop: Header=BB17_2 Depth=1
	call	#task_lookup_search
	call	#commit
	call	#task_commit
	call	#task_lookup_done
.LBB17_2:                               ; %while.cond
                                        ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB17_6 Depth 2
	call	#commit
	call	#task_commit
	mov	&safe, r12
	cmp	#32, 292(r12)
	jhs	.LBB17_11
; %bb.3:                                ; %while.body
                                        ;   in Loop: Header=BB17_2 Depth=1
	call	#task_generate_key
	call	#commit
	call	#task_commit
	call	#task_calc_indexes
	call	#commit
	call	#task_commit
	call	#task_calc_indexes_index_1
	call	#commit
	call	#task_commit
	call	#task_calc_indexes_index_2
	call	#commit
	call	#task_commit
	mov	&unsafe, r12
	cmp	#32, 288(r12)
	jhs	.LBB17_1
; %bb.4:                                ; %if.then
                                        ;   in Loop: Header=BB17_2 Depth=1
	call	#task_add
	call	#commit
	call	#task_commit
	mov	&safe, r12
	mov	282(r12), r13
	add	r13, r13
	add	r12, r13
	tst	22(r13)
	jeq	.LBB17_10
; %bb.5:                                ; %land.lhs.true
                                        ;   in Loop: Header=BB17_2 Depth=1
	mov	&safe, r12
	mov	284(r12), r13
	add	r13, r13
	add	r12, r13
	tst	22(r13)
	jeq	.LBB17_10
.LBB17_6:                               ; %while.cond11
                                        ;   Parent Loop BB17_2 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	clr.b	r12
	mov	&safe, r13
	tst.b	296(r13)
	jne	.LBB17_8
; %bb.7:                                ; %land.rhs
                                        ;   in Loop: Header=BB17_6 Depth=2
	mov	&safe, r12
	cmp	#8, 286(r12)
	mov	#1, r12
	bic	r2, r12
.LBB17_8:                               ; %land.end
                                        ;   in Loop: Header=BB17_6 Depth=2
	tst.b	r12
	jeq	.LBB17_10
; %bb.9:                                ; %while.body19
                                        ;   in Loop: Header=BB17_6 Depth=2
	call	#task_relocate
	call	#commit
	call	#task_commit
	jmp	.LBB17_6
.LBB17_10:                              ; %if.end
                                        ;   in Loop: Header=BB17_2 Depth=1
	call	#task_insert_done
	jmp	.LBB17_2
.LBB17_11:                              ; %while.end21
	call	#task_done
	mov	0(r1), r12
	add	#2, r1
	ret
.Lfunc_end17:
	.size	main, .Lfunc_end17-main
                                        ; -- End function
	.p2align	1               ; -- Begin function djb_hash
	.type	djb_hash,@function
djb_hash:                               ; @djb_hash
.Lfunc_begin18:
; %bb.0:                                ; %entry
	sub	#8, r1
	mov	r13, 4(r1)
	mov	r12, 6(r1)
	mov	#5381, 2(r1)
	clr	0(r1)
	cmp	4(r1), 0(r1)
	jhs	.LBB18_2
.LBB18_1:                               ; %for.body
                                        ; =>This Inner Loop Header: Depth=1
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
	add	r13, r12
	mov	r12, 2(r1)
	inc	6(r1)
	inc	0(r1)
	cmp	4(r1), 0(r1)
	jlo	.LBB18_1
.LBB18_2:                               ; %for.end
	mov	2(r1), r12
	add	#8, r1
	ret
.Lfunc_end18:
	.size	djb_hash, .Lfunc_end18-djb_hash
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
