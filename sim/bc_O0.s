	.text
	.file	"bc.c"
	.globl	task_done               # -- Begin function task_done
	.p2align	4, 0x90
	.type	task_done,@function
task_done:                              # @task_done
	.cfi_startproc
# %bb.0:                                # %entry
	pushq	%rax
	.cfi_def_cfa_offset 16
	movq	safe(%rip), %rax
	movl	40(%rax), %esi
	movl	$.L.str, %edi
	xorl	%eax, %eax
	callq	printf
	movq	safe(%rip), %rax
	movl	44(%rax), %esi
	movl	$.L.str.1, %edi
	xorl	%eax, %eax
	callq	printf
	movq	safe(%rip), %rax
	movl	48(%rax), %esi
	movl	$.L.str.2, %edi
	xorl	%eax, %eax
	callq	printf
	movq	safe(%rip), %rax
	movl	52(%rax), %esi
	movl	$.L.str.3, %edi
	xorl	%eax, %eax
	callq	printf
	movq	safe(%rip), %rax
	movl	56(%rax), %esi
	movl	$.L.str.4, %edi
	xorl	%eax, %eax
	callq	printf
	movq	safe(%rip), %rax
	movl	60(%rax), %esi
	movl	$.L.str.5, %edi
	xorl	%eax, %eax
	callq	printf
	movq	safe(%rip), %rax
	movl	64(%rax), %esi
	movl	$.L.str.6, %edi
	xorl	%eax, %eax
	callq	printf
	movl	global_count(%rip), %esi
	movl	$.L.str.7, %edi
	xorl	%eax, %eax
	callq	printf
	popq	%rax
	.cfi_def_cfa_offset 8
	retq
.Lfunc_end0:
	.size	task_done, .Lfunc_end0-task_done
	.cfi_endproc
                                        # -- End function
	.globl	task_init               # -- Begin function task_init
	.p2align	4, 0x90
	.type	task_init,@function
task_init:                              # @task_init
	.cfi_startproc
# %bb.0:                                # %entry
	movq	unsafe(%rip), %rax
	movl	$0, 68(%rax)
	movq	unsafe(%rip), %rax
	movl	$0, 40(%rax)
	movq	unsafe(%rip), %rax
	movl	$0, 44(%rax)
	movq	unsafe(%rip), %rax
	movl	$0, 48(%rax)
	movq	unsafe(%rip), %rax
	movl	$0, 52(%rax)
	movq	unsafe(%rip), %rax
	movl	$0, 56(%rax)
	movq	unsafe(%rip), %rax
	movl	$0, 60(%rax)
	movq	unsafe(%rip), %rax
	movl	$0, 64(%rax)
	retq
.Lfunc_end1:
	.size	task_init, .Lfunc_end1-task_init
	.cfi_endproc
                                        # -- End function
	.globl	task_select_func        # -- Begin function task_select_func
	.p2align	4, 0x90
	.type	task_select_func,@function
task_select_func:                       # @task_select_func
	.cfi_startproc
# %bb.0:                                # %entry
	movq	unsafe(%rip), %rax
	movl	$4, 72(%rax)
	movq	unsafe(%rip), %rax
	movl	$0, 76(%rax)
	movq	unsafe(%rip), %rax
	addl	$1, 68(%rax)
	retq
.Lfunc_end2:
	.size	task_select_func, .Lfunc_end2-task_select_func
	.cfi_endproc
                                        # -- End function
	.globl	task_bit_count          # -- Begin function task_bit_count
	.p2align	4, 0x90
	.type	task_bit_count,@function
task_bit_count:                         # @task_bit_count
	.cfi_startproc
# %bb.0:                                # %entry
	movq	unsafe(%rip), %rax
	movl	72(%rax), %ecx
	movl	%ecx, -8(%rsp)
	addl	$13, 72(%rax)
	movl	$0, -4(%rsp)
	cmpl	$0, -8(%rsp)
	je	.LBB3_2
	.p2align	4, 0x90
.LBB3_1:                                # %do.body
                                        # =>This Inner Loop Header: Depth=1
	addl	$1, -4(%rsp)
	movl	-8(%rsp), %eax
	leal	-1(%rax), %ecx
	andl	%eax, %ecx
	movl	%ecx, -8(%rsp)
	jne	.LBB3_1
.LBB3_2:                                # %if.end
	movl	-4(%rsp), %eax
	movq	unsafe(%rip), %rcx
	addl	%eax, 40(%rcx)
	movq	unsafe(%rip), %rax
	addl	$1, 76(%rax)
	retq
.Lfunc_end3:
	.size	task_bit_count, .Lfunc_end3-task_bit_count
	.cfi_endproc
                                        # -- End function
	.globl	task_bitcount           # -- Begin function task_bitcount
	.p2align	4, 0x90
	.type	task_bitcount,@function
task_bitcount:                          # @task_bitcount
	.cfi_startproc
# %bb.0:                                # %entry
	movq	unsafe(%rip), %rax
	movl	72(%rax), %ecx
	movl	%ecx, -4(%rsp)
	addl	$13, 72(%rax)
	movl	-4(%rsp), %eax
	movq	%rax, %rcx
	shrq	%rcx
	andl	$1431655765, %ecx       # imm = 0x55555555
	andl	$1431655765, %eax       # imm = 0x55555555
	addq	%rcx, %rax
	movq	%rax, %rcx
	shrq	$2, %rcx
	andl	$858993459, %ecx        # imm = 0x33333333
	andl	$858993459, %eax        # imm = 0x33333333
	addq	%rcx, %rax
	movl	%eax, %ecx
	andl	$1886417008, %ecx       # imm = 0x70707070
	shrq	$4, %rcx
	andl	$117901063, %eax        # imm = 0x7070707
	addq	%rcx, %rax
	movl	%eax, %ecx
	andl	$251662080, %ecx        # imm = 0xF000F00
	shrq	$8, %rcx
	andl	$983055, %eax           # imm = 0xF000F
	addq	%rcx, %rax
	movzwl	%ax, %ecx
	shrq	$16, %rax
	addl	%ecx, %eax
	movl	%eax, -4(%rsp)
	movq	unsafe(%rip), %rcx
	addl	%eax, 44(%rcx)
	movq	unsafe(%rip), %rax
	addl	$1, 76(%rax)
	retq
.Lfunc_end4:
	.size	task_bitcount, .Lfunc_end4-task_bitcount
	.cfi_endproc
                                        # -- End function
	.globl	recursive_cnt           # -- Begin function recursive_cnt
	.p2align	4, 0x90
	.type	recursive_cnt,@function
recursive_cnt:                          # @recursive_cnt
	.cfi_startproc
# %bb.0:                                # %entry
	pushq	%rax
	.cfi_def_cfa_offset 16
                                        # kill: def $edi killed $edi def $rdi
	movl	%edi, 4(%rsp)
	movl	%edi, %eax
	andl	$15, %edi
	movsbl	bits(%rdi), %ecx
	movl	%ecx, (%rsp)
	shrq	$4, %rax
	movl	%eax, 4(%rsp)
	je	.LBB5_2
# %bb.1:                                # %if.then
	movl	4(%rsp), %edi
	callq	recursive_cnt
	addl	%eax, (%rsp)
.LBB5_2:                                # %if.end
	movl	(%rsp), %eax
	popq	%rcx
	.cfi_def_cfa_offset 8
	retq
.Lfunc_end5:
	.size	recursive_cnt, .Lfunc_end5-recursive_cnt
	.cfi_endproc
                                        # -- End function
	.globl	task_ntbl_bitcnt        # -- Begin function task_ntbl_bitcnt
	.p2align	4, 0x90
	.type	task_ntbl_bitcnt,@function
task_ntbl_bitcnt:                       # @task_ntbl_bitcnt
	.cfi_startproc
# %bb.0:                                # %entry
	pushq	%rax
	.cfi_def_cfa_offset 16
	movq	unsafe(%rip), %rax
	movl	72(%rax), %edi
	callq	recursive_cnt
	movq	unsafe(%rip), %rcx
	addl	%eax, 48(%rcx)
	movq	unsafe(%rip), %rax
	addl	$13, 72(%rax)
	movq	unsafe(%rip), %rax
	addl	$1, 76(%rax)
	popq	%rax
	.cfi_def_cfa_offset 8
	retq
.Lfunc_end6:
	.size	task_ntbl_bitcnt, .Lfunc_end6-task_ntbl_bitcnt
	.cfi_endproc
                                        # -- End function
	.globl	task_ntbl_bitcount      # -- Begin function task_ntbl_bitcount
	.p2align	4, 0x90
	.type	task_ntbl_bitcount,@function
task_ntbl_bitcount:                     # @task_ntbl_bitcount
	.cfi_startproc
# %bb.0:                                # %entry
	movq	unsafe(%rip), %rax
	movl	72(%rax), %ecx
	movl	%ecx, %edx
	andl	$15, %edx
	movsbl	bits(%rdx), %edx
	movzbl	%cl, %esi
	shrq	$4, %rsi
	movsbl	bits(%rsi), %esi
	addl	%edx, %esi
	movl	%ecx, %edx
	shrl	$8, %edx
	andl	$15, %edx
	movsbl	bits(%rdx), %edx
	addl	%esi, %edx
	movzwl	%cx, %esi
	shrq	$12, %rsi
	movsbl	bits(%rsi), %esi
	addl	%edx, %esi
	movl	%ecx, %edx
	shrl	$16, %edx
	andl	$15, %edx
	movsbl	bits(%rdx), %edx
	addl	%esi, %edx
	movl	%ecx, %esi
	shrl	$20, %esi
	andl	$15, %esi
	movsbl	bits(%rsi), %esi
	addl	%edx, %esi
	movl	%ecx, %edx
	shrl	$24, %edx
	andl	$15, %edx
	movsbl	bits(%rdx), %edx
	addl	%esi, %edx
	shrq	$28, %rcx
	movsbl	bits(%rcx), %ecx
	addl	%edx, %ecx
	addl	%ecx, 52(%rax)
	movq	unsafe(%rip), %rax
	addl	$13, 72(%rax)
	movq	unsafe(%rip), %rax
	addl	$1, 76(%rax)
	retq
.Lfunc_end7:
	.size	task_ntbl_bitcount, .Lfunc_end7-task_ntbl_bitcount
	.cfi_endproc
                                        # -- End function
	.globl	task_BW_btbl_bitcount   # -- Begin function task_BW_btbl_bitcount
	.p2align	4, 0x90
	.type	task_BW_btbl_bitcount,@function
task_BW_btbl_bitcount:                  # @task_BW_btbl_bitcount
	.cfi_startproc
# %bb.0:                                # %entry
	movq	unsafe(%rip), %rax
	movl	72(%rax), %ecx
	movq	%rcx, -8(%rsp)
	movzbl	%cl, %ecx
	movsbl	bits(%rcx), %ecx
	movzbl	-7(%rsp), %edx
	movsbl	bits(%rdx), %edx
	addl	%ecx, %edx
	movzbl	-5(%rsp), %ecx
	movsbl	bits(%rcx), %ecx
	addl	%edx, %ecx
	movzbl	-6(%rsp), %edx
	movsbl	bits(%rdx), %edx
	addl	%ecx, %edx
	addl	%edx, 56(%rax)
	movq	unsafe(%rip), %rax
	addl	$13, 72(%rax)
	movq	unsafe(%rip), %rax
	addl	$1, 76(%rax)
	retq
.Lfunc_end8:
	.size	task_BW_btbl_bitcount, .Lfunc_end8-task_BW_btbl_bitcount
	.cfi_endproc
                                        # -- End function
	.globl	task_AR_btbl_bitcount   # -- Begin function task_AR_btbl_bitcount
	.p2align	4, 0x90
	.type	task_AR_btbl_bitcount,@function
task_AR_btbl_bitcount:                  # @task_AR_btbl_bitcount
	.cfi_startproc
# %bb.0:                                # %entry
	movq	unsafe(%rip), %rax
	leaq	72(%rax), %rcx
	movq	%rcx, -8(%rsp)
	leaq	73(%rax), %rcx
	movq	%rcx, -8(%rsp)
	movzbl	72(%rax), %ecx
	movsbl	bits(%rcx), %ecx
	movl	%ecx, -12(%rsp)
	leaq	74(%rax), %rdx
	movq	%rdx, -8(%rsp)
	movzbl	73(%rax), %edx
	movsbl	bits(%rdx), %edx
	addl	%ecx, %edx
	movl	%edx, -12(%rsp)
	leaq	75(%rax), %rcx
	movq	%rcx, -8(%rsp)
	movzbl	74(%rax), %ecx
	movsbl	bits(%rcx), %ecx
	addl	%edx, %ecx
	movl	%ecx, -12(%rsp)
	movzbl	75(%rax), %eax
	movsbl	bits(%rax), %eax
	addl	%ecx, %eax
	movl	%eax, -12(%rsp)
	movq	unsafe(%rip), %rcx
	addl	%eax, 60(%rcx)
	movq	unsafe(%rip), %rax
	addl	$13, 72(%rax)
	movq	unsafe(%rip), %rax
	addl	$1, 76(%rax)
	retq
.Lfunc_end9:
	.size	task_AR_btbl_bitcount, .Lfunc_end9-task_AR_btbl_bitcount
	.cfi_endproc
                                        # -- End function
	.globl	task_bit_shifter        # -- Begin function task_bit_shifter
	.p2align	4, 0x90
	.type	task_bit_shifter,@function
task_bit_shifter:                       # @task_bit_shifter
	.cfi_startproc
# %bb.0:                                # %entry
	movq	unsafe(%rip), %rax
	movl	72(%rax), %eax
	movl	%eax, -12(%rsp)
	movl	$0, -8(%rsp)
	movl	$0, -4(%rsp)
	cmpl	$0, -12(%rsp)
	je	.LBB10_2
	.p2align	4, 0x90
.LBB10_3:                               # %land.rhs
	movslq	-4(%rsp), %rax
	cmpq	$64, %rax
	setb	%al
	testb	%al, %al
	jne	.LBB10_5
	jmp	.LBB10_6
	.p2align	4, 0x90
.LBB10_2:
	xorl	%eax, %eax
	testb	%al, %al
	je	.LBB10_6
.LBB10_5:                               # %for.body
	movl	-12(%rsp), %eax
	andl	$1, %eax
	addl	%eax, -8(%rsp)
	addl	$1, -4(%rsp)
	shrl	-12(%rsp)
	cmpl	$0, -12(%rsp)
	jne	.LBB10_3
	jmp	.LBB10_2
.LBB10_6:                               # %for.end
	movl	-8(%rsp), %eax
	movq	unsafe(%rip), %rcx
	addl	%eax, 64(%rcx)
	movq	unsafe(%rip), %rax
	addl	$13, 72(%rax)
	movq	unsafe(%rip), %rax
	addl	$1, 76(%rax)
	retq
.Lfunc_end10:
	.size	task_bit_shifter, .Lfunc_end10-task_bit_shifter
	.cfi_endproc
                                        # -- End function
	.globl	task_commit             # -- Begin function task_commit
	.p2align	4, 0x90
	.type	task_commit,@function
task_commit:                            # @task_commit
	.cfi_startproc
# %bb.0:                                # %entry
	addl	$1, global_count(%rip)
	retq
.Lfunc_end11:
	.size	task_commit, .Lfunc_end11-task_commit
	.cfi_endproc
                                        # -- End function
	.globl	commit                  # -- Begin function commit
	.p2align	4, 0x90
	.type	commit,@function
commit:                                 # @commit
	.cfi_startproc
# %bb.0:                                # %entry
	movl	global_count(%rip), %eax
	movl	%eax, %ecx
	shrl	$31, %ecx
	addl	%eax, %ecx
	andl	$-2, %ecx
	subl	%ecx, %eax
	cmpl	$1, %eax
	jne	.LBB12_2
# %bb.1:                                # %if.then
	movq	$camel+92, safe(%rip)
	movq	$camel+4, unsafe(%rip)
	retq
.LBB12_2:                               # %if.else
	movq	$camel+4, safe(%rip)
	movq	$camel+92, unsafe(%rip)
	retq
.Lfunc_end12:
	.size	commit, .Lfunc_end12-commit
	.cfi_endproc
                                        # -- End function
	.section	.rodata.cst8,"aM",@progbits,8
	.p2align	3               # -- Begin function main
.LCPI13_0:
	.quad	4696837146684686336     # double 1.0E+6
	.text
	.globl	main
	.p2align	4, 0x90
	.type	main,@function
main:                                   # @main
	.cfi_startproc
# %bb.0:                                # %entry
	subq	$24, %rsp
	.cfi_def_cfa_offset 32
	movl	$0, 12(%rsp)
	callq	clock
	movq	%rax, (%rsp)
	callq	task_init
	callq	commit
	movq	unsafe(%rip), %rax
	movq	safe(%rip), %rcx
	movups	40(%rcx), %xmm0
	movups	56(%rcx), %xmm1
	movups	68(%rcx), %xmm2
	movups	%xmm2, 68(%rax)
	movups	%xmm1, 56(%rax)
	movups	%xmm0, 40(%rax)
	callq	task_commit
	jmp	.LBB13_1
.LBB13_22:                              # %if.else160
                                        #   in Loop: Header=BB13_1 Depth=1
	movq	unsafe(%rip), %rax
	cmpl	$8, 68(%rax)
	je	.LBB13_23
	.p2align	4, 0x90
.LBB13_1:                               # %while.cond
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB13_20 Depth 2
                                        #     Child Loop BB13_17 Depth 2
                                        #     Child Loop BB13_14 Depth 2
                                        #     Child Loop BB13_11 Depth 2
                                        #     Child Loop BB13_8 Depth 2
                                        #     Child Loop BB13_5 Depth 2
                                        #     Child Loop BB13_2 Depth 2
	callq	task_select_func
	callq	commit
	movq	safe(%rip), %rax
	movl	72(%rax), %eax
	movq	unsafe(%rip), %rcx
	movl	%eax, 72(%rcx)
	movq	safe(%rip), %rax
	movl	76(%rax), %eax
	movq	unsafe(%rip), %rcx
	movl	%eax, 76(%rcx)
	movq	safe(%rip), %rax
	movl	68(%rax), %eax
	movq	unsafe(%rip), %rcx
	movl	%eax, 68(%rcx)
	callq	task_commit
	movq	unsafe(%rip), %rax
	cmpl	$1, 68(%rax)
	jne	.LBB13_4
	.p2align	4, 0x90
.LBB13_2:                               # %while.cond13
                                        #   Parent Loop BB13_1 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movq	unsafe(%rip), %rax
	cmpl	$99, 76(%rax)
	ja	.LBB13_1
# %bb.3:                                # %while.body17
                                        #   in Loop: Header=BB13_2 Depth=2
	callq	task_bit_count
	callq	commit
	movq	safe(%rip), %rax
	movl	72(%rax), %eax
	movq	unsafe(%rip), %rcx
	movl	%eax, 72(%rcx)
	movq	safe(%rip), %rax
	movl	76(%rax), %eax
	movq	unsafe(%rip), %rcx
	movl	%eax, 76(%rcx)
	movq	safe(%rip), %rax
	movl	40(%rax), %eax
	movq	unsafe(%rip), %rcx
	movl	%eax, 40(%rcx)
	callq	task_commit
	jmp	.LBB13_2
	.p2align	4, 0x90
.LBB13_4:                               # %if.else
                                        #   in Loop: Header=BB13_1 Depth=1
	movq	unsafe(%rip), %rax
	cmpl	$2, 68(%rax)
	jne	.LBB13_7
	.p2align	4, 0x90
.LBB13_5:                               # %while.cond33
                                        #   Parent Loop BB13_1 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movq	unsafe(%rip), %rax
	cmpl	$99, 76(%rax)
	ja	.LBB13_1
# %bb.6:                                # %while.body37
                                        #   in Loop: Header=BB13_5 Depth=2
	callq	task_bitcount
	callq	commit
	movq	safe(%rip), %rax
	movl	72(%rax), %eax
	movq	unsafe(%rip), %rcx
	movl	%eax, 72(%rcx)
	movq	safe(%rip), %rax
	movl	76(%rax), %eax
	movq	unsafe(%rip), %rcx
	movl	%eax, 76(%rcx)
	movq	safe(%rip), %rax
	movl	44(%rax), %eax
	movq	unsafe(%rip), %rcx
	movl	%eax, 44(%rcx)
	callq	task_commit
	jmp	.LBB13_5
	.p2align	4, 0x90
.LBB13_7:                               # %if.else50
                                        #   in Loop: Header=BB13_1 Depth=1
	movq	unsafe(%rip), %rax
	cmpl	$3, 68(%rax)
	jne	.LBB13_10
	.p2align	4, 0x90
.LBB13_8:                               # %while.cond55
                                        #   Parent Loop BB13_1 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movq	unsafe(%rip), %rax
	cmpl	$99, 76(%rax)
	ja	.LBB13_1
# %bb.9:                                # %while.body59
                                        #   in Loop: Header=BB13_8 Depth=2
	callq	task_ntbl_bitcnt
	callq	commit
	movq	safe(%rip), %rax
	movl	72(%rax), %eax
	movq	unsafe(%rip), %rcx
	movl	%eax, 72(%rcx)
	movq	safe(%rip), %rax
	movl	76(%rax), %eax
	movq	unsafe(%rip), %rcx
	movl	%eax, 76(%rcx)
	movq	safe(%rip), %rax
	movl	48(%rax), %eax
	movq	unsafe(%rip), %rcx
	movl	%eax, 48(%rcx)
	callq	task_commit
	jmp	.LBB13_8
.LBB13_10:                              # %if.else72
                                        #   in Loop: Header=BB13_1 Depth=1
	movq	unsafe(%rip), %rax
	cmpl	$4, 68(%rax)
	jne	.LBB13_13
	.p2align	4, 0x90
.LBB13_11:                              # %while.cond77
                                        #   Parent Loop BB13_1 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movq	unsafe(%rip), %rax
	cmpl	$99, 76(%rax)
	ja	.LBB13_1
# %bb.12:                               # %while.body81
                                        #   in Loop: Header=BB13_11 Depth=2
	callq	task_ntbl_bitcount
	callq	commit
	movq	safe(%rip), %rax
	movl	72(%rax), %eax
	movq	unsafe(%rip), %rcx
	movl	%eax, 72(%rcx)
	movq	safe(%rip), %rax
	movl	76(%rax), %eax
	movq	unsafe(%rip), %rcx
	movl	%eax, 76(%rcx)
	movq	safe(%rip), %rax
	movl	52(%rax), %eax
	movq	unsafe(%rip), %rcx
	movl	%eax, 52(%rcx)
	callq	task_commit
	jmp	.LBB13_11
.LBB13_13:                              # %if.else94
                                        #   in Loop: Header=BB13_1 Depth=1
	movq	unsafe(%rip), %rax
	cmpl	$5, 68(%rax)
	jne	.LBB13_16
	.p2align	4, 0x90
.LBB13_14:                              # %while.cond99
                                        #   Parent Loop BB13_1 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movq	unsafe(%rip), %rax
	cmpl	$99, 76(%rax)
	ja	.LBB13_1
# %bb.15:                               # %while.body103
                                        #   in Loop: Header=BB13_14 Depth=2
	callq	task_BW_btbl_bitcount
	callq	commit
	movq	safe(%rip), %rax
	movl	72(%rax), %eax
	movq	unsafe(%rip), %rcx
	movl	%eax, 72(%rcx)
	movq	safe(%rip), %rax
	movl	76(%rax), %eax
	movq	unsafe(%rip), %rcx
	movl	%eax, 76(%rcx)
	movq	safe(%rip), %rax
	movl	56(%rax), %eax
	movq	unsafe(%rip), %rcx
	movl	%eax, 56(%rcx)
	callq	task_commit
	jmp	.LBB13_14
.LBB13_16:                              # %if.else116
                                        #   in Loop: Header=BB13_1 Depth=1
	movq	unsafe(%rip), %rax
	cmpl	$6, 68(%rax)
	jne	.LBB13_19
	.p2align	4, 0x90
.LBB13_17:                              # %while.cond121
                                        #   Parent Loop BB13_1 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movq	unsafe(%rip), %rax
	cmpl	$99, 76(%rax)
	ja	.LBB13_1
# %bb.18:                               # %while.body125
                                        #   in Loop: Header=BB13_17 Depth=2
	callq	task_AR_btbl_bitcount
	callq	commit
	movq	safe(%rip), %rax
	movl	72(%rax), %eax
	movq	unsafe(%rip), %rcx
	movl	%eax, 72(%rcx)
	movq	safe(%rip), %rax
	movl	76(%rax), %eax
	movq	unsafe(%rip), %rcx
	movl	%eax, 76(%rcx)
	movq	safe(%rip), %rax
	movl	60(%rax), %eax
	movq	unsafe(%rip), %rcx
	movl	%eax, 60(%rcx)
	callq	task_commit
	jmp	.LBB13_17
.LBB13_19:                              # %if.else138
                                        #   in Loop: Header=BB13_1 Depth=1
	movq	unsafe(%rip), %rax
	cmpl	$7, 68(%rax)
	jne	.LBB13_22
	.p2align	4, 0x90
.LBB13_20:                              # %while.cond143
                                        #   Parent Loop BB13_1 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movq	unsafe(%rip), %rax
	cmpl	$99, 76(%rax)
	ja	.LBB13_1
# %bb.21:                               # %while.body147
                                        #   in Loop: Header=BB13_20 Depth=2
	callq	task_bit_shifter
	callq	commit
	movq	safe(%rip), %rax
	movl	72(%rax), %eax
	movq	unsafe(%rip), %rcx
	movl	%eax, 72(%rcx)
	movq	safe(%rip), %rax
	movl	76(%rax), %eax
	movq	unsafe(%rip), %rcx
	movl	%eax, 76(%rcx)
	movq	safe(%rip), %rax
	movl	64(%rax), %eax
	movq	unsafe(%rip), %rcx
	movl	%eax, 64(%rcx)
	callq	task_commit
	jmp	.LBB13_20
.LBB13_23:                              # %if.then164
	callq	task_done
	callq	clock
	subq	(%rsp), %rax
	xorps	%xmm0, %xmm0
	cvtsi2sd	%rax, %xmm0
	movq	%rax, (%rsp)
	divsd	.LCPI13_0(%rip), %xmm0
	movsd	%xmm0, 16(%rsp)
	movl	$.L.str.8, %edi
	movb	$1, %al
	callq	printf
	xorl	%edi, %edi
	callq	exit
.Lfunc_end13:
	.size	main, .Lfunc_end13-main
	.cfi_endproc
                                        # -- End function
	.type	camel,@object           # @camel
	.comm	camel,180,4
	.type	safe,@object            # @safe
	.data
	.globl	safe
	.p2align	3
safe:
	.quad	camel+92
	.size	safe, 8

	.type	unsafe,@object          # @unsafe
	.globl	unsafe
	.p2align	3
unsafe:
	.quad	camel+4
	.size	unsafe, 8

	.type	global_count,@object    # @global_count
	.bss
	.globl	global_count
	.p2align	2
global_count:
	.long	0                       # 0x0
	.size	global_count, 4

	.type	c,@object               # @c
	.globl	c
	.p2align	2
c:
	.long	0                       # 0x0
	.size	c, 4

	.type	.L.str,@object          # @.str
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str:
	.asciz	"n0: %d\n"
	.size	.L.str, 8

	.type	.L.str.1,@object        # @.str.1
.L.str.1:
	.asciz	"n1: %d\n"
	.size	.L.str.1, 8

	.type	.L.str.2,@object        # @.str.2
.L.str.2:
	.asciz	"n2: %d\n"
	.size	.L.str.2, 8

	.type	.L.str.3,@object        # @.str.3
.L.str.3:
	.asciz	"n3: %d\n"
	.size	.L.str.3, 8

	.type	.L.str.4,@object        # @.str.4
.L.str.4:
	.asciz	"n4: %d\n"
	.size	.L.str.4, 8

	.type	.L.str.5,@object        # @.str.5
.L.str.5:
	.asciz	"n5: %d\n"
	.size	.L.str.5, 8

	.type	.L.str.6,@object        # @.str.6
.L.str.6:
	.asciz	"n6: %d\n"
	.size	.L.str.6, 8

	.type	.L.str.7,@object        # @.str.7
.L.str.7:
	.asciz	"The count is: %d\n"
	.size	.L.str.7, 18

	.type	bits,@object            # @bits
	.data
	.p2align	4
bits:
	.ascii	"\000\001\001\002\001\002\002\003\001\002\002\003\002\003\003\004\001\002\002\003\002\003\003\004\002\003\003\004\003\004\004\005\001\002\002\003\002\003\003\004\002\003\003\004\003\004\004\005\002\003\003\004\003\004\004\005\003\004\004\005\004\005\005\006\001\002\002\003\002\003\003\004\002\003\003\004\003\004\004\005\002\003\003\004\003\004\004\005\003\004\004\005\004\005\005\006\002\003\003\004\003\004\004\005\003\004\004\005\004\005\005\006\003\004\004\005\004\005\005\006\004\005\005\006\005\006\006\007\001\002\002\003\002\003\003\004\002\003\003\004\003\004\004\005\002\003\003\004\003\004\004\005\003\004\004\005\004\005\005\006\002\003\003\004\003\004\004\005\003\004\004\005\004\005\005\006\003\004\004\005\004\005\005\006\004\005\005\006\005\006\006\007\002\003\003\004\003\004\004\005\003\004\004\005\004\005\005\006\003\004\004\005\004\005\005\006\004\005\005\006\005\006\006\007\003\004\004\005\004\005\005\006\004\005\005\006\005\006\006\007\004\005\005\006\005\006\006\007\005\006\006\007\006\007\007\b"
	.size	bits, 256

	.type	.L.str.8,@object        # @.str.8
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str.8:
	.asciz	"bc took %f seconds to execute \n"
	.size	.L.str.8, 32


	.ident	"clang version 10.0.0 (https://github.com/llvm/llvm-project.git f79f68975d51b389d9f141aa30ab47723a75a868)"
	.section	".note.GNU-stack","",@progbits
