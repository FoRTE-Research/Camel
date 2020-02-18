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
	.globl	task_init               ; -- Begin function task_init
	.p2align	1
	.type	task_init,@function
task_init:                              ; @task_init
.Lfunc_begin2:
; %bb.0:                                ; %entry
	;DEBUG_VALUE: task_init:i <- 0
	clr	r13
	mov	&unsafe, r12
	mov	r12, r14
	add	#22, r14
.LBB2_1:                                ; %for.body
                                        ; =>This Inner Loop Header: Depth=1
	;DEBUG_VALUE: task_init:i <- $r13
	mov	r13, 0(r14)
	incd	r14
	inc	r13
	;DEBUG_VALUE: task_init:i <- $r13
	cmp	#128, r13
	jne	.LBB2_1
; %bb.2:                                ; %for.end
	;DEBUG_VALUE: task_init:i <- $r13
	clr	294(r12)
	clr	292(r12)
	clr	290(r12)
	clr	288(r12)
	mov	#1, 278(r12)
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
	;DEBUG_VALUE: djb_hash:data <- undef
	push	r10
	push	r9
	;DEBUG_VALUE: djb_hash:i <- 1
	mov	&unsafe, r10
	mov	278(r10), r9
	;DEBUG_VALUE: djb_hash:hash <- 5381
	;DEBUG_VALUE: djb_hash:len <- 2
	;DEBUG_VALUE: hash_to_fingerprint:key <- $r9
	;DEBUG_VALUE: djb_hash:data <- undef
	;DEBUG_VALUE: djb_hash:i <- 0
	mov	r9, r12
	mov.b	r12, r12
	;DEBUG_VALUE: djb_hash:hash <- [DW_OP_constu 19035, DW_OP_minus, DW_OP_stack_value] $r12
	mov	#33, r13
	call	#__mspabi_mpyi
	swpb	r9
	mov.b	r9, r9
	add	r12, r9
	add	#27205, r9
	;DEBUG_VALUE: djb_hash:hash <- $r9
	;DEBUG_VALUE: djb_hash:i <- 2
	mov	r9, 280(r10)
	pop	r9
	pop	r10
	ret
.Lfunc_end4:
	.size	task_calc_indexes, .Lfunc_end4-task_calc_indexes
                                        ; -- End function
	.globl	task_calc_indexes_index_1 ; -- Begin function task_calc_indexes_index_1
	.p2align	1
	.type	task_calc_indexes_index_1,@function
task_calc_indexes_index_1:              ; @task_calc_indexes_index_1
.Lfunc_begin5:
; %bb.0:                                ; %entry
	;DEBUG_VALUE: djb_hash:data <- undef
	;DEBUG_VALUE: djb_hash:len <- 2
	push	r10
	push	r9
	;DEBUG_VALUE: djb_hash:hash <- 5381
	;DEBUG_VALUE: djb_hash:i <- 1
	;DEBUG_VALUE: djb_hash:hash <- [DW_OP_constu 19035, DW_OP_minus, DW_OP_stack_value] undef
	mov	&unsafe, r9
	mov	278(r9), r10
	;DEBUG_VALUE: hash_to_index:fp <- $r10
	mov	r10, r12
	;DEBUG_VALUE: djb_hash:i <- 1
	;DEBUG_VALUE: djb_hash:hash <- 5381
	;DEBUG_VALUE: djb_hash:len <- 2
	mov	#33, r13
	call	#__mspabi_mpyi
	swpb	r10
	add	r12, r10
	add	#69, r10
	;DEBUG_VALUE: hash_to_index:hash <- $r10
	;DEBUG_VALUE: djb_hash:i <- 2
	;DEBUG_VALUE: djb_hash:hash <- $r10
	and	#127, r10
	mov	r10, 282(r9)
	pop	r9
	pop	r10
	ret
.Lfunc_end5:
	.size	task_calc_indexes_index_1, .Lfunc_end5-task_calc_indexes_index_1
                                        ; -- End function
	.globl	task_calc_indexes_index_2 ; -- Begin function task_calc_indexes_index_2
	.p2align	1
	.type	task_calc_indexes_index_2,@function
task_calc_indexes_index_2:              ; @task_calc_indexes_index_2
.Lfunc_begin6:
; %bb.0:                                ; %entry
	;DEBUG_VALUE: djb_hash:data <- undef
	;DEBUG_VALUE: djb_hash:len <- 2
	push	r10
	push	r9
	;DEBUG_VALUE: djb_hash:hash <- 5381
	;DEBUG_VALUE: djb_hash:i <- 1
	;DEBUG_VALUE: djb_hash:hash <- [DW_OP_constu 19035, DW_OP_minus, DW_OP_stack_value] undef
	mov	&unsafe, r9
	mov	280(r9), r10
	;DEBUG_VALUE: hash_to_index:fp <- $r10
	mov	r10, r12
	;DEBUG_VALUE: djb_hash:i <- 1
	;DEBUG_VALUE: djb_hash:hash <- 5381
	;DEBUG_VALUE: djb_hash:len <- 2
	mov	#33, r13
	call	#__mspabi_mpyi
	swpb	r10
	add	r12, r10
	add	#69, r10
	;DEBUG_VALUE: hash_to_index:hash <- $r10
	;DEBUG_VALUE: djb_hash:i <- 2
	;DEBUG_VALUE: djb_hash:hash <- $r10
	and	#127, r10
	;DEBUG_VALUE: task_calc_indexes_index_2:fp_hash <- $r10
	xor	282(r9), r10
	mov	r10, 284(r9)
	pop	r9
	pop	r10
	ret
.Lfunc_end6:
	.size	task_calc_indexes_index_2, .Lfunc_end6-task_calc_indexes_index_2
                                        ; -- End function
	.globl	task_add                ; -- Begin function task_add
	.p2align	1
	.type	task_add,@function
task_add:                               ; @task_add
.Lfunc_begin7:
; %bb.0:                                ; %entry
	mov	&unsafe, r12
	mov	282(r12), r13
	add	r13, r13
	add	r12, r13
	tst	22(r13)
	jeq	.LBB7_5
; %bb.1:                                ; %if.else
	mov	284(r12), r13
	add	r13, r13
	add	r12, r13
	tst	22(r13)
	jeq	.LBB7_5
; %bb.2:                                ; %if.else24
	call	#rand
	mov	#284, r13
	bit	#1, r12
	jeq	.LBB7_4
; %bb.3:                                ; %if.else24
	mov	#282, r13
.LBB7_4:                                ; %if.else24
	mov	&unsafe, r12
	add	r12, r13
	mov	0(r13), r13
	;DEBUG_VALUE: index_victim <- $r13
	mov	r13, r14
	add	r14, r14
	add	r12, r14
	mov	22(r14), r15
	;DEBUG_VALUE: fp_victim <- $r15
	mov	280(r12), 22(r14)
	mov	r15, 280(r12)
	mov	r13, 282(r12)
	clr	286(r12)
	ret
.LBB7_5:                                ; %if.then
	add	#22, r13
	mov.b	#1, 296(r12)
	mov	280(r12), 0(r13)
	ret
.Lfunc_end7:
	.size	task_add, .Lfunc_end7-task_add
                                        ; -- End function
	.globl	task_relocate           ; -- Begin function task_relocate
	.p2align	1
	.type	task_relocate,@function
task_relocate:                          ; @task_relocate
.Lfunc_begin8:
; %bb.0:                                ; %entry
	;DEBUG_VALUE: djb_hash:data <- undef
	;DEBUG_VALUE: djb_hash:len <- 2
	push	r10
	push	r9
	;DEBUG_VALUE: djb_hash:hash <- 5381
	;DEBUG_VALUE: djb_hash:i <- 1
	;DEBUG_VALUE: djb_hash:hash <- [DW_OP_constu 19035, DW_OP_minus, DW_OP_stack_value] undef
	mov	&unsafe, r9
	mov	280(r9), r10
	;DEBUG_VALUE: hash_to_index:fp <- $r10
	;DEBUG_VALUE: task_relocate:fp_victim <- $r10
	mov	r10, r12
	;DEBUG_VALUE: djb_hash:i <- 1
	;DEBUG_VALUE: djb_hash:hash <- 5381
	;DEBUG_VALUE: djb_hash:len <- 2
	mov	#33, r13
	call	#__mspabi_mpyi
	mov	r10, r13
	swpb	r13
	add	r12, r13
	add	#69, r13
	;DEBUG_VALUE: hash_to_index:hash <- $r13
	;DEBUG_VALUE: djb_hash:i <- 2
	;DEBUG_VALUE: djb_hash:hash <- $r13
	and	#127, r13
	;DEBUG_VALUE: task_relocate:fp_hash_victim <- $r13
	xor	282(r9), r13
	;DEBUG_VALUE: task_relocate:index2_victim <- $r13
	mov	r13, r14
	add	r14, r14
	add	r9, r14
	mov	r14, r12
	add	#22, r12
	tst	22(r14)
	jeq	.LBB8_3
; %bb.1:                                ; %if.end
	;DEBUG_VALUE: task_relocate:index2_victim <- $r13
	;DEBUG_VALUE: task_relocate:fp_victim <- $r10
	mov	286(r9), r14
	cmp	#8, r14
	jlo	.LBB8_4
; %bb.2:                                ; %if.then8
	;DEBUG_VALUE: task_relocate:index2_victim <- $r13
	;DEBUG_VALUE: task_relocate:fp_victim <- $r10
	clr.b	296(r9)
	jmp	.LBB8_6
.LBB8_3:                                ; %if.then
	;DEBUG_VALUE: task_relocate:index2_victim <- $r13
	;DEBUG_VALUE: task_relocate:fp_victim <- $r10
	mov.b	#1, 296(r9)
	jmp	.LBB8_5
.LBB8_4:                                ; %if.end11
	;DEBUG_VALUE: task_relocate:index2_victim <- $r13
	;DEBUG_VALUE: task_relocate:fp_victim <- $r10
	mov	r13, 282(r9)
	inc	r14
	mov	r14, 286(r9)
	mov	0(r12), 280(r9)
.LBB8_5:                                ; %cleanup
	;DEBUG_VALUE: task_relocate:index2_victim <- $r13
	;DEBUG_VALUE: task_relocate:fp_victim <- $r10
	mov	r10, 0(r12)
.LBB8_6:                                ; %cleanup
	;DEBUG_VALUE: task_relocate:index2_victim <- $r13
	;DEBUG_VALUE: task_relocate:fp_victim <- $r10
	pop	r9
	pop	r10
	ret
.Lfunc_end8:
	.size	task_relocate, .Lfunc_end8-task_relocate
                                        ; -- End function
	.globl	task_insert_done        ; -- Begin function task_insert_done
	.p2align	1
	.type	task_insert_done,@function
task_insert_done:                       ; @task_insert_done
.Lfunc_begin9:
; %bb.0:                                ; %entry
	mov	&unsafe, r12
	mov.b	296(r12), r13
	add	r13, 290(r12)
	mov	#1, r13
	add	288(r12), r13
	mov	r13, 288(r12)
	cmp	#32, r13
	jlo	.LBB9_2
; %bb.1:                                ; %if.else
	mov	#1, 278(r12)
.LBB9_2:                                ; %if.end
	ret
.Lfunc_end9:
	.size	task_insert_done, .Lfunc_end9-task_insert_done
                                        ; -- End function
	.globl	task_lookup_search      ; -- Begin function task_lookup_search
	.p2align	1
	.type	task_lookup_search,@function
task_lookup_search:                     ; @task_lookup_search
.Lfunc_begin10:
; %bb.0:                                ; %entry
	mov	&unsafe, r12
	mov	282(r12), r14
	add	r14, r14
	add	r12, r14
	mov	280(r12), r13
	cmp	r13, 22(r14)
	jne	.LBB10_2
; %bb.1:                                ; %if.then
	mov.b	#1, 297(r12)
	ret
.LBB10_2:                               ; %if.else
	mov	284(r12), r14
	add	r14, r14
	add	r12, r14
	cmp	r13, 22(r14)
	jne	.LBB10_4
; %bb.3:                                ; %if.then11
	mov.b	#1, 297(r12)
	ret
.LBB10_4:                               ; %if.else14
	clr.b	297(r12)
	ret
.Lfunc_end10:
	.size	task_lookup_search, .Lfunc_end10-task_lookup_search
                                        ; -- End function
	.globl	task_lookup_done        ; -- Begin function task_lookup_done
	.p2align	1
	.type	task_lookup_done,@function
task_lookup_done:                       ; @task_lookup_done
.Lfunc_begin11:
; %bb.0:                                ; %entry
	mov	&unsafe, r12
	mov.b	297(r12), r13
	add	r13, 294(r12)
	inc	292(r12)
	ret
.Lfunc_end11:
	.size	task_lookup_done, .Lfunc_end11-task_lookup_done
                                        ; -- End function
	.globl	task_done               ; -- Begin function task_done
	.p2align	1
	.type	task_done,@function
task_done:                              ; @task_done
.Lfunc_begin12:
; %bb.0:                                ; %entry
	mov	&safe, r12
	mov	#298, r13
	mov	#-1, r14
	call	#__fast_hw_crc
	;DEBUG_VALUE: task_done:crc_end <- undef
	clr	r12
	call	#exit
.Lfunc_end12:
	.size	task_done, .Lfunc_end12-task_done
                                        ; -- End function
	.globl	task_commit_done        ; -- Begin function task_commit_done
	.p2align	1
	.type	task_commit_done,@function
task_commit_done:                       ; @task_commit_done
.Lfunc_begin13:
; %bb.0:                                ; %entry
	;DEBUG_VALUE: task_commit_done:x <- 10
	;DEBUG_VALUE: task_commit_done:x <- [DW_OP_plus_uconst 1, DW_OP_stack_value] 10
	ret
.Lfunc_end13:
	.size	task_commit_done, .Lfunc_end13-task_commit_done
                                        ; -- End function
	.globl	main                    ; -- Begin function main
	.p2align	1
	.type	main,@function
main:                                   ; @main
.Lfunc_begin14:
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
	mov	&safe, r12
	cmp	#32, 292(r12)
	jlo	.LBB14_4
	br	#.LBB14_37
.LBB14_1:                               ; %if.else269
                                        ;   in Loop: Header=BB14_4 Depth=1
	mov	#camel+302, &unsafe
	mov	#camel+2, &safe
	mov	#camel+2, r12
	call	#__dump_registers
	;APP
	mov	r1, r12
	;NO_APP
	;DEBUG_VALUE: __x <- $r12
	;APP
	mov	r1, r14
	;NO_APP
.LBB14_2:                               ; %if.end284
                                        ;   in Loop: Header=BB14_4 Depth=1
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
	mov	#1, r13
.LBB14_3:                               ; %if.end284
                                        ;   in Loop: Header=BB14_4 Depth=1
	mov	r12, &tmp_stack_buf_crc
	mov	&safe, r14
	mov	r12, 298(r14)
	mov	r13, &camel
	cmp	#32, 292(r14)
	jlo	.LBB14_4
	br	#.LBB14_37
.LBB14_4:                               ; %while.body
                                        ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB14_26 Depth 2
	call	#task_generate_key
	cmp	#1, &camel
	jne	.LBB14_6
; %bb.5:                                ; %if.then
                                        ;   in Loop: Header=BB14_4 Depth=1
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
	jmp	.LBB14_7
.LBB14_6:                               ; %if.else
                                        ;   in Loop: Header=BB14_4 Depth=1
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
.LBB14_7:                               ; %do.end
                                        ;   in Loop: Header=BB14_4 Depth=1
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
	call	#task_calc_indexes
	cmp	#1, &camel
	jne	.LBB14_9
; %bb.8:                                ; %if.then20
                                        ;   in Loop: Header=BB14_4 Depth=1
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
	jmp	.LBB14_10
.LBB14_9:                               ; %if.else33
                                        ;   in Loop: Header=BB14_4 Depth=1
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
.LBB14_10:                              ; %do.end47
                                        ;   in Loop: Header=BB14_4 Depth=1
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
	call	#task_calc_indexes_index_1
	cmp	#1, &camel
	jne	.LBB14_12
; %bb.11:                               ; %if.then50
                                        ;   in Loop: Header=BB14_4 Depth=1
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
	jmp	.LBB14_13
.LBB14_12:                              ; %if.else63
                                        ;   in Loop: Header=BB14_4 Depth=1
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
.LBB14_13:                              ; %do.end77
                                        ;   in Loop: Header=BB14_4 Depth=1
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
	call	#task_calc_indexes_index_2
	cmp	#1, &camel
	jne	.LBB14_15
; %bb.14:                               ; %if.then80
                                        ;   in Loop: Header=BB14_4 Depth=1
	mov	#camel+2, &unsafe
	mov	#camel+302, &safe
	mov	#camel+302, r12
	call	#__dump_registers
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
	mov	#2, r13
	jmp	.LBB14_16
.LBB14_15:                              ; %if.else93
                                        ;   in Loop: Header=BB14_4 Depth=1
	mov	#camel+302, &unsafe
	mov	#camel+2, &safe
	mov	#camel+2, r12
	call	#__dump_registers
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
	mov	#1, r13
.LBB14_16:                              ; %do.end107
                                        ;   in Loop: Header=BB14_4 Depth=1
	mov	r12, &tmp_stack_buf_crc
	mov	&safe, r14
	mov	r12, 298(r14)
	mov	r13, &camel
	cmp	#32, 288(r14)
	jhs	.LBB14_19
; %bb.17:                               ; %if.then110
                                        ;   in Loop: Header=BB14_4 Depth=1
	call	#task_add
	cmp	#1, &camel
	jne	.LBB14_21
; %bb.18:                               ; %if.then113
                                        ;   in Loop: Header=BB14_4 Depth=1
	mov	#camel+2, &unsafe
	mov	#camel+302, &safe
	mov	#camel+302, r12
	call	#__dump_registers
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
	mov	#2, r14
	jmp	.LBB14_22
.LBB14_19:                              ; %if.else221
                                        ;   in Loop: Header=BB14_4 Depth=1
	call	#task_lookup_search
	cmp	#1, &camel
	jne	.LBB14_32
; %bb.20:                               ; %if.then225
                                        ;   in Loop: Header=BB14_4 Depth=1
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
	jmp	.LBB14_33
.LBB14_21:                              ; %if.else126
                                        ;   in Loop: Header=BB14_4 Depth=1
	mov	#camel+302, &unsafe
	mov	#camel+2, &safe
	mov	#camel+2, r12
	call	#__dump_registers
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
	mov	#1, r14
.LBB14_22:                              ; %do.end140
                                        ;   in Loop: Header=BB14_4 Depth=1
	mov	r12, &tmp_stack_buf_crc
	mov	&safe, r13
	mov	r12, 298(r13)
	mov	r14, &camel
	mov	282(r13), r12
	add	r12, r12
	add	r13, r12
	tst	22(r12)
	jeq	.LBB14_30
; %bb.23:                               ; %land.lhs.true
                                        ;   in Loop: Header=BB14_4 Depth=1
	mov	284(r13), r12
	add	r12, r12
	add	r13, r12
	tst	22(r12)
	jne	.LBB14_26
	jmp	.LBB14_30
.LBB14_24:                              ; %if.else174
                                        ;   in Loop: Header=BB14_26 Depth=2
	mov	#camel+302, &unsafe
	mov	#camel+2, &safe
	mov	#camel+2, r12
	call	#__dump_registers
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
	mov	#1, r14
.LBB14_25:                              ; %do.end188
                                        ;   in Loop: Header=BB14_26 Depth=2
	mov	r12, &tmp_stack_buf_crc
	mov	&safe, r13
	mov	r12, 298(r13)
	mov	r14, &camel
.LBB14_26:                              ; %while.cond149.preheader
                                        ;   Parent Loop BB14_4 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	tst.b	296(r13)
	jne	.LBB14_30
; %bb.27:                               ; %land.rhs
                                        ;   in Loop: Header=BB14_26 Depth=2
	cmp	#8, 286(r13)
	jhs	.LBB14_30
; %bb.28:                               ; %while.body157
                                        ;   in Loop: Header=BB14_26 Depth=2
	call	#task_relocate
	cmp	#1, &camel
	jne	.LBB14_24
; %bb.29:                               ; %if.then161
                                        ;   in Loop: Header=BB14_26 Depth=2
	mov	#camel+2, &unsafe
	mov	#camel+302, &safe
	mov	#camel+302, r12
	call	#__dump_registers
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
	mov	#2, r14
	jmp	.LBB14_25
.LBB14_30:                              ; %if.end189
                                        ;   in Loop: Header=BB14_4 Depth=1
	call	#task_insert_done
	cmp	#1, &camel
	jne	.LBB14_36
; %bb.31:                               ; %if.then193
                                        ;   in Loop: Header=BB14_4 Depth=1
	mov	#camel+2, &unsafe
	mov	#camel+302, &safe
	mov	#camel+302, r12
	call	#__dump_registers
	;APP
	mov	r1, r12
	;NO_APP
	;DEBUG_VALUE: __x <- $r12
	;APP
	mov	r1, r14
	;NO_APP
	jmp	.LBB14_35
.LBB14_32:                              ; %if.else238
                                        ;   in Loop: Header=BB14_4 Depth=1
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
.LBB14_33:                              ; %do.end252
                                        ;   in Loop: Header=BB14_4 Depth=1
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
	call	#task_lookup_done
	cmp	#1, &camel
	jeq	.LBB14_34
	br	#.LBB14_1
.LBB14_34:                              ; %if.then256
                                        ;   in Loop: Header=BB14_4 Depth=1
	mov	#camel+2, &unsafe
	mov	#camel+302, &safe
	mov	#camel+302, r12
	call	#__dump_registers
	;APP
	mov	r1, r12
	;NO_APP
	;DEBUG_VALUE: __x <- $r12
	;APP
	mov	r1, r14
	;NO_APP
.LBB14_35:                              ; %if.end284
                                        ;   in Loop: Header=BB14_4 Depth=1
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
	mov	#2, r13
	br	#.LBB14_3
.LBB14_36:                              ; %if.else206
                                        ;   in Loop: Header=BB14_4 Depth=1
	mov	#camel+302, &unsafe
	mov	#camel+2, &safe
	mov	#camel+2, r12
	call	#__dump_registers
	;APP
	mov	r1, r12
	;NO_APP
	;DEBUG_VALUE: __x <- $r12
	;APP
	mov	r1, r14
	;NO_APP
	br	#.LBB14_2
.LBB14_37:                              ; %while.end285
	call	#task_done
.Lfunc_end14:
	.size	main, .Lfunc_end14-main
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
