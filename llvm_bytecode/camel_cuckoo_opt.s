	.text
	.file	"camel_cuckoo.c"
	.globl	camel_init              ; -- Begin function camel_init
	.p2align	1
	.type	camel_init,@function
camel_init:                             ; @camel_init
.Lfunc_begin0:
; %bb.0:                                ; %entry
	mov	#23168, &WDTCTL
	bis.b	#1, &PADIR_L
	and.b	#-2, &PAOUT_L
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
	mov	&camel, r12
	cmp	#2, r12
	jeq	.LBB1_3
; %bb.1:                                ; %entry
	cmp	#1, r12
	jne	.LBB1_4
; %bb.2:                                ; %if.then
	mov	#camel+2, r12
	mov	#camel+302, &unsafe
	mov	#camel+2, &safe
	jmp	.LBB1_5
.LBB1_3:                                ; %if.then2
	mov	#camel+302, r12
	mov	#camel+2, &unsafe
	mov	#camel+302, &safe
	jmp	.LBB1_5
.LBB1_4:                                ; %if.else3
	call	#__crt0_start
	mov	&safe, r12
.LBB1_5:                                ; %if.end4
	mov	18(r12), r12
	;APP
	mov	r12, r1
	;NO_APP
	;APP
	mov	r1, r12
	;NO_APP
	;DEBUG_VALUE: __x <- $r12
	;APP
	mov	r1, r14
	;NO_APP
	;DEBUG_VALUE: __x <- $r14
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
	mov	&unsafe, r12
	mov	#300, r14
	call	#memcpy
	mov	#23168, &WDTCTL
	bis.b	#1, &PADIR_L
	and.b	#-2, &PAOUT_L
	and	#-2, &PM5CTL0
	mov.b	#-91, &CSCTL0_H
	mov	#64, &CSCTL1
	mov	#307, &CSCTL2
	clr	&CSCTL3
	clr.b	&CSCTL0_H
	mov	#-23296, &FRCTL0
	mov	&safe, r12
	call	#__restore_registers
	ret
.LBB1_7:                                ; %if.else12
	call	#__crt0_start
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
	push	r10
	cmp	#1, &camel
	jne	.LBB2_2
; %bb.1:                                ; %if.then
	mov	#camel+2, &unsafe
	mov	#camel+302, &safe
	mov	#camel+302, r12
	call	#__dump_registers
	mov	#2, r10
	;APP
	mov	r1, r12
	;NO_APP
	;DEBUG_VALUE: __x <- $r12
	;APP
	mov	r1, r14
	;NO_APP
	;DEBUG_VALUE: __x <- $r14
	jmp	.LBB2_3
.LBB2_2:                                ; %if.else
	mov	#camel+302, &unsafe
	mov	#camel+2, &safe
	mov	#camel+2, r12
	call	#__dump_registers
	mov	#1, r10
	;APP
	mov	r1, r12
	;NO_APP
	;DEBUG_VALUE: __x <- $r12
	;APP
	mov	r1, r14
	;NO_APP
	;DEBUG_VALUE: __x <- $r14
.LBB2_3:                                ; %do.end
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
	mov	r10, &camel
	pop	r10
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
	jmp	.LBB3_1
.LBB3_1:                                ; %for.cond
                                        ; =>This Inner Loop Header: Depth=1
	mov	0(r1), r12
	cmp	#128, r12
	jhs	.LBB3_4
	jmp	.LBB3_2
.LBB3_2:                                ; %for.body
                                        ;   in Loop: Header=BB3_1 Depth=1
	mov	&unsafe, r12
	mov	0(r1), r13
	add	r13, r13
	add	r13, r12
	clr	22(r12)
	jmp	.LBB3_3
.LBB3_3:                                ; %for.inc
                                        ;   in Loop: Header=BB3_1 Depth=1
	mov	0(r1), r12
	inc	r12
	mov	r12, 0(r1)
	jmp	.LBB3_1
.LBB3_4:                                ; %for.end
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
	;DEBUG_VALUE: hash_to_fingerprint:key <- $r12
	push	r10
	mov	r12, r10
	;DEBUG_VALUE: djb_hash:data <- undef
	;DEBUG_VALUE: djb_hash:i <- 1
	;DEBUG_VALUE: hash_to_fingerprint:key <- $r10
	;DEBUG_VALUE: djb_hash:hash <- 5381
	;DEBUG_VALUE: djb_hash:len <- 2
	;DEBUG_VALUE: djb_hash:data <- undef
	;DEBUG_VALUE: djb_hash:i <- 0
	mov.b	r12, r12
	;DEBUG_VALUE: djb_hash:hash <- [DW_OP_constu 19035, DW_OP_minus, DW_OP_stack_value] $r12
	mov	#33, r13
	call	#__mspabi_mpyi
	swpb	r10
	mov.b	r10, r10
	add	r12, r10
	add	#27205, r10
	;DEBUG_VALUE: djb_hash:hash <- $r10
	;DEBUG_VALUE: djb_hash:i <- 2
	mov	r10, r12
	pop	r10
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
	;DEBUG_VALUE: hash_to_index:fp <- $r12
	push	r10
	mov	r12, r10
	;DEBUG_VALUE: djb_hash:hash <- [DW_OP_constu 19035, DW_OP_minus, DW_OP_stack_value] $r10
	;DEBUG_VALUE: djb_hash:i <- 1
	;DEBUG_VALUE: djb_hash:hash <- 5381
	;DEBUG_VALUE: djb_hash:len <- 2
	;DEBUG_VALUE: djb_hash:data <- undef
	;DEBUG_VALUE: hash_to_index:fp <- $r10
	mov	#33, r13
	call	#__mspabi_mpyi
	swpb	r10
	add	r12, r10
	add	#69, r10
	;DEBUG_VALUE: hash_to_index:hash <- $r10
	;DEBUG_VALUE: djb_hash:i <- 2
	;DEBUG_VALUE: djb_hash:hash <- $r10
	and	#127, r10
	mov	r10, r12
	pop	r10
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
	mov	&unsafe, r12
	mov	282(r12), r13
	mov	0(r1), r14
	xor	r14, r13
	mov	r13, 284(r12)
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
	add	r13, r12
	mov	22(r12), r12
	tst	r12
	jne	.LBB10_2
	jmp	.LBB10_1
.LBB10_1:                               ; %if.then
	mov	&unsafe, r12
	mov.b	#1, 296(r12)
	mov	&unsafe, r12
	mov	282(r12), r13
	add	r13, r13
	mov	r12, r14
	add	r13, r14
	mov	280(r12), r12
	mov	r12, 22(r14)
	jmp	.LBB10_9
.LBB10_2:                               ; %if.else
	mov	&unsafe, r12
	mov	284(r12), r13
	add	r13, r13
	add	r13, r12
	mov	22(r12), r12
	tst	r12
	jne	.LBB10_4
	jmp	.LBB10_3
.LBB10_3:                               ; %if.then14
	mov	&unsafe, r12
	mov.b	#1, 296(r12)
	mov	&unsafe, r12
	mov	284(r12), r13
	add	r13, r13
	mov	r12, r14
	add	r13, r14
	mov	280(r12), r12
	mov	r12, 22(r14)
	jmp	.LBB10_8
.LBB10_4:                               ; %if.else24
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
	jeq	.LBB10_6
	jmp	.LBB10_5
.LBB10_5:                               ; %if.then26
	mov	&unsafe, r12
	mov	282(r12), r12
	mov	r12, 0(r1)
	mov	&unsafe, r12
	mov	282(r12), r13
	add	r13, r13
	add	r13, r12
	mov	22(r12), r12
	mov	r12, 2(r1)
	jmp	.LBB10_7
.LBB10_6:                               ; %if.else34
	mov	&unsafe, r12
	mov	284(r12), r12
	mov	r12, 0(r1)
	mov	&unsafe, r12
	mov	284(r12), r13
	add	r13, r13
	add	r13, r12
	mov	22(r12), r12
	mov	r12, 2(r1)
	jmp	.LBB10_7
.LBB10_7:                               ; %if.end
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
	jmp	.LBB10_8
.LBB10_8:                               ; %if.end52
	jmp	.LBB10_9
.LBB10_9:                               ; %if.end53
	mov	0(r1), r12
	mov	r12, &index_victim
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
	mov	8(r1), r12
	call	#hash_to_index
	mov	r12, 6(r1)
	mov	&unsafe, r12
	mov	282(r12), r12
	mov	6(r1), r13
	xor	r13, r12
	mov	r12, 4(r1)
	mov	&unsafe, r12
	mov	4(r1), r13
	add	r13, r13
	add	r13, r12
	mov	22(r12), r12
	tst	r12
	jne	.LBB11_2
	jmp	.LBB11_1
.LBB11_1:                               ; %if.then
	mov	&unsafe, r12
	mov.b	#1, 296(r12)
	mov	8(r1), r12
	mov	&unsafe, r13
	mov	4(r1), r14
	add	r14, r14
	add	r14, r13
	mov	r12, 22(r13)
	clr	2(r1)
	mov	#1, 0(r1)
	jmp	.LBB11_5
.LBB11_2:                               ; %if.end
	mov	&unsafe, r12
	mov	286(r12), r12
	cmp	#8, r12
	jlo	.LBB11_4
	jmp	.LBB11_3
.LBB11_3:                               ; %if.then8
	mov	&unsafe, r12
	clr.b	296(r12)
	clr	2(r1)
	mov	#1, 0(r1)
	jmp	.LBB11_5
.LBB11_4:                               ; %if.end11
	mov	&unsafe, r12
	mov	286(r12), r13
	inc	r13
	mov	r13, 286(r12)
	mov	4(r1), r12
	mov	&unsafe, r13
	mov	r12, 282(r13)
	mov	&unsafe, r12
	mov	4(r1), r13
	add	r13, r13
	mov	r12, r14
	add	r13, r14
	mov	22(r14), r13
	mov	r13, 280(r12)
	mov	8(r1), r12
	mov	&unsafe, r13
	mov	4(r1), r14
	add	r14, r14
	add	r14, r13
	mov	r12, 22(r13)
	clr	2(r1)
	clr	0(r1)
	jmp	.LBB11_5
.LBB11_5:                               ; %cleanup
	mov	0(r1), r13
	mov	2(r1), r14
	tst	r14
	mov	r2, r15
	rra	r15
	mov	#1, r12
	bic	r15, r12
	cmp	#2, r13
	mov	r2, r13
	and	#1, r13
	tst	r14
	jeq	.LBB11_7
; %bb.6:                                ; %cleanup
	mov	r12, r13
.LBB11_7:                               ; %cleanup
	bit	#1, r13
	jne	.LBB11_9
	jmp	.LBB11_8
.LBB11_8:                               ; %cleanup.cont
	add	#10, r1
	ret
.LBB11_9:                               ; %unreachable
	mov	4(r1), r12
	mov	r12, &index2_victim
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
	mov	288(r12), r13
	inc	r13
	mov	r13, 288(r12)
	mov	&unsafe, r12
	mov.b	296(r12), r13
	mov	290(r12), r14
	add	r13, r14
	mov	r14, 290(r12)
	mov	&unsafe, r12
	mov	288(r12), r12
	cmp	#32, r12
	jlo	.LBB12_2
	jmp	.LBB12_1
.LBB12_1:                               ; %if.then
	mov	&unsafe, r12
	mov	#1, 278(r12)
	jmp	.LBB12_2
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
	mov	r12, r14
	add	r13, r14
	mov	22(r14), r13
	mov	280(r12), r12
	cmp	r12, r13
	jne	.LBB13_2
	jmp	.LBB13_1
.LBB13_1:                               ; %if.then
	mov	&unsafe, r12
	mov.b	#1, 297(r12)
	jmp	.LBB13_6
.LBB13_2:                               ; %if.else
	mov	&unsafe, r12
	mov	284(r12), r13
	add	r13, r13
	mov	r12, r14
	add	r13, r14
	mov	22(r14), r13
	mov	280(r12), r12
	cmp	r12, r13
	jne	.LBB13_4
	jmp	.LBB13_3
.LBB13_3:                               ; %if.then11
	mov	&unsafe, r12
	mov.b	#1, 297(r12)
	jmp	.LBB13_5
.LBB13_4:                               ; %if.else14
	mov	&unsafe, r12
	clr.b	297(r12)
	jmp	.LBB13_5
.LBB13_5:                               ; %if.end
	jmp	.LBB13_6
.LBB13_6:                               ; %if.end17
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
	mov	292(r12), r13
	inc	r13
	mov	r13, 292(r12)
	mov	&unsafe, r12
	mov.b	297(r12), r13
	mov	294(r12), r14
	add	r13, r14
	mov	r14, 294(r12)
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
	push	r10
	mov	#23168, &WDTCTL
	bis.b	#1, &PADIR_L
	and.b	#-2, &PAOUT_L
	and	#-2, &PM5CTL0
	mov.b	#-91, &CSCTL0_H
	mov	#64, &CSCTL1
	mov	#307, &CSCTL2
	mov	#camel+2, &safe
	mov	#1, &camel
	mov	#camel+302, &unsafe
	clr	&CSCTL3
	clr.b	&CSCTL0_H
	mov	#-23296, &FRCTL0
	call	#task_init
	call	#commit
	mov	#22, r12
	add	&unsafe, r12
	mov	&safe, r10
	mov	r10, r13
	add	#22, r13
	mov	#276, r14
	call	#memcpy
	cmp	#32, 292(r10)
	jlo	.LBB17_2
	jmp	.LBB17_9
.LBB17_1:                               ; %if.else
                                        ;   in Loop: Header=BB17_2 Depth=1
	call	#task_lookup_search
	call	#commit
	mov	&unsafe, r12
	mov	&safe, r13
	mov.b	297(r13), 297(r12)
	call	#task_lookup_done
	call	#commit
	mov	&unsafe, r13
	mov	&safe, r12
	mov	292(r12), 292(r13)
	mov	294(r12), 294(r13)
	cmp	#32, 292(r12)
	jhs	.LBB17_9
.LBB17_2:                               ; %while.body
                                        ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB17_6 Depth 2
	call	#task_generate_key
	call	#commit
	mov	&unsafe, r12
	mov	&safe, r13
	mov	278(r13), 278(r12)
	call	#task_calc_indexes
	call	#commit
	mov	&unsafe, r12
	mov	&safe, r13
	mov	280(r13), 280(r12)
	call	#task_calc_indexes_index_1
	call	#commit
	mov	&unsafe, r12
	mov	&safe, r13
	mov	282(r13), 282(r12)
	call	#task_calc_indexes_index_2
	call	#commit
	mov	&unsafe, r12
	mov	&safe, r13
	mov	284(r13), 284(r12)
	cmp	#32, 288(r12)
	jhs	.LBB17_1
; %bb.3:                                ; %if.then
                                        ;   in Loop: Header=BB17_2 Depth=1
	call	#task_add
	call	#commit
	mov	&unsafe, r12
	mov	&safe, r13
	mov.b	296(r13), 296(r12)
	mov	282(r12), r14
	add	r14, r14
	add	r14, r13
	add	r12, r14
	mov	22(r13), 22(r14)
	mov	&unsafe, r12
	mov	284(r12), r13
	add	r13, r13
	add	r13, r12
	add	&safe, r13
	mov	22(r13), 22(r12)
	mov	&index_victim, r12
	add	r12, r12
	mov	r12, r13
	add	&unsafe, r13
	add	&safe, r12
	mov	22(r12), 22(r13)
	mov	&unsafe, r13
	mov	&safe, r12
	mov	282(r12), 282(r13)
	mov	280(r12), 280(r13)
	mov	286(r12), 286(r13)
	mov	282(r12), r13
	add	r13, r13
	add	r12, r13
	tst	22(r13)
	jeq	.LBB17_8
; %bb.4:                                ; %land.lhs.true
                                        ;   in Loop: Header=BB17_2 Depth=1
	mov	284(r12), r13
	add	r13, r13
	add	r12, r13
	tst	22(r13)
	jeq	.LBB17_8
; %bb.5:                                ; %while.cond11.preheader
                                        ;   in Loop: Header=BB17_2 Depth=1
	tst.b	296(r12)
	jne	.LBB17_8
.LBB17_6:                               ; %land.rhs
                                        ;   Parent Loop BB17_2 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	cmp	#8, 286(r12)
	jhs	.LBB17_8
; %bb.7:                                ; %while.body19
                                        ;   in Loop: Header=BB17_6 Depth=2
	call	#task_relocate
	call	#commit
	mov	&unsafe, r12
	mov	&safe, r13
	mov.b	296(r13), 296(r12)
	mov	&index2_victim, r14
	add	r14, r14
	add	r14, r13
	add	r12, r14
	mov	22(r13), 22(r14)
	mov	&unsafe, r13
	mov	&safe, r12
	mov	286(r12), 286(r13)
	mov	282(r12), 282(r13)
	mov	280(r12), 280(r13)
	tst.b	296(r12)
	jeq	.LBB17_6
.LBB17_8:                               ; %if.end
                                        ;   in Loop: Header=BB17_2 Depth=1
	call	#task_insert_done
	call	#commit
	mov	&unsafe, r13
	mov	&safe, r12
	mov	288(r12), 288(r13)
	mov	290(r12), 290(r13)
	mov	278(r12), 278(r13)
	cmp	#32, 292(r12)
	jlo	.LBB17_2
.LBB17_9:                               ; %while.end21
	call	#task_done
.Lfunc_end17:
	.size	main, .Lfunc_end17-main
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
	.type	index_victim,@object    ; @index_victim
	.comm	index_victim,2,2
	.type	index2_victim,@object   ; @index2_victim
	.comm	index2_victim,2,2

	.ident	"clang version 10.0.0 (https://github.com/llvm/llvm-project.git f79f68975d51b389d9f141aa30ab47723a75a868)"
	.section	".note.GNU-stack","",@progbits
