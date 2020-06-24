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
	popq	%rcx
	.cfi_def_cfa_offset 8
	jmp	printf                  # TAILCALL
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
	xorps	%xmm0, %xmm0
	movups	%xmm0, 56(%rax)
	movups	%xmm0, 40(%rax)
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
	movq	$4, 72(%rax)
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
	leal	13(%rcx), %edx
	movl	%edx, 72(%rax)
	xorl	%edx, %edx
	testl	%ecx, %ecx
	je	.LBB3_2
	.p2align	4, 0x90
.LBB3_1:                                # %do.body
                                        # =>This Inner Loop Header: Depth=1
	addl	$1, %edx
	leal	-1(%rcx), %esi
	andl	%esi, %ecx
	jne	.LBB3_1
.LBB3_2:                                # %if.end
	addl	%edx, 40(%rax)
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
	leal	13(%rcx), %edx
	movl	%edx, 72(%rax)
	movl	%ecx, %edx
	shrl	%edx
	andl	$1431655765, %edx       # imm = 0x55555555
	andl	$1431655765, %ecx       # imm = 0x55555555
	addl	%edx, %ecx
	movl	%ecx, %edx
	shrl	$2, %edx
	andl	$858993459, %edx        # imm = 0x33333333
	andl	$858993459, %ecx        # imm = 0x33333333
	addl	%edx, %ecx
	movl	%ecx, %edx
	shrl	$4, %edx
	andl	$117901063, %edx        # imm = 0x7070707
	andl	$117901063, %ecx        # imm = 0x7070707
	addl	%edx, %ecx
	movl	%ecx, %edx
	shrl	$8, %edx
	andl	$983055, %edx           # imm = 0xF000F
	andl	$983055, %ecx           # imm = 0xF000F
	addl	%edx, %ecx
	movzwl	%cx, %edx
                                        # kill: def $ecx killed $ecx killed $rcx
	shrl	$16, %ecx
	addl	44(%rax), %edx
	addl	%ecx, %edx
	movl	%edx, 44(%rax)
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
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset %rbx, -16
                                        # kill: def $edi killed $edi def $rdi
	movl	%edi, %eax
	andl	$15, %eax
	movsbl	bits(%rax), %ebx
	shrl	$4, %edi
	je	.LBB5_2
# %bb.1:                                # %if.then
                                        # kill: def $edi killed $edi killed $rdi
	callq	recursive_cnt
	addl	%ebx, %eax
	popq	%rbx
	.cfi_def_cfa_offset 8
	retq
.LBB5_2:                                # %if.end
	.cfi_def_cfa_offset 16
	movl	%ebx, %eax
	popq	%rbx
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
	pushq	%r14
	.cfi_def_cfa_offset 16
	pushq	%rbx
	.cfi_def_cfa_offset 24
	pushq	%rax
	.cfi_def_cfa_offset 32
	.cfi_offset %rbx, -24
	.cfi_offset %r14, -16
	movq	unsafe(%rip), %r14
	movl	72(%r14), %ebx
	movl	%ebx, %edi
	callq	recursive_cnt
	addl	%eax, 48(%r14)
	addl	$13, %ebx
	movl	%ebx, 72(%r14)
	addl	$1, 76(%r14)
	addq	$8, %rsp
	.cfi_def_cfa_offset 24
	popq	%rbx
	.cfi_def_cfa_offset 16
	popq	%r14
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
	pushq	%rbp
	.cfi_def_cfa_offset 16
	pushq	%rbx
	.cfi_def_cfa_offset 24
	.cfi_offset %rbx, -24
	.cfi_offset %rbp, -16
	movq	unsafe(%rip), %r8
	movl	72(%r8), %ecx
	movl	%ecx, %r9d
	movl	%ecx, %r10d
	movl	%ecx, %r11d
	movl	%ecx, %eax
	movl	%ecx, %edx
	movl	%ecx, %esi
	movq	%rcx, %rdi
	leal	13(%rcx), %ebp
                                        # kill: def $ecx killed $ecx killed $rcx def $rcx
	andl	$15, %ecx
	movsbl	bits(%rcx), %ecx
	shrl	$4, %r9d
	andl	$15, %r9d
	movsbl	bits(%r9), %ebx
	addl	%ecx, %ebx
	shrl	$8, %r10d
	andl	$15, %r10d
	movsbl	bits(%r10), %ecx
	addl	%ebx, %ecx
	shrl	$12, %r11d
	andl	$15, %r11d
	movsbl	bits(%r11), %ebx
	addl	%ecx, %ebx
	shrl	$16, %eax
	andl	$15, %eax
	movsbl	bits(%rax), %eax
	addl	%ebx, %eax
	shrl	$20, %edx
	andl	$15, %edx
	movsbl	bits(%rdx), %ecx
	addl	%eax, %ecx
	shrl	$24, %esi
	andl	$15, %esi
	movsbl	bits(%rsi), %eax
	addl	%ecx, %eax
	shrq	$28, %rdi
	movsbl	bits(%rdi), %ecx
	addl	%eax, %ecx
	addl	%ecx, 52(%r8)
	movl	%ebp, 72(%r8)
	addl	$1, 76(%r8)
	popq	%rbx
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
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
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset %rbx, -16
	movq	unsafe(%rip), %rax
	movl	72(%rax), %ecx
	movzbl	%ch, %ebx
	movq	%rcx, %rsi
	movzbl	%cl, %edi
	leal	13(%rcx), %edx
                                        # kill: def $ecx killed $ecx killed $rcx
	shrl	$16, %ecx
	movzbl	%cl, %ecx
	shrq	$24, %rsi
	movsbl	bits(%rdi), %edi
	movsbl	bits(%rbx), %ebx
	addl	%edi, %ebx
	movsbl	bits(%rsi), %esi
	addl	%ebx, %esi
	movsbl	bits(%rcx), %ecx
	addl	%esi, %ecx
	addl	%ecx, 56(%rax)
	movl	%edx, 72(%rax)
	addl	$1, 76(%rax)
	popq	%rbx
	.cfi_def_cfa_offset 8
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
	movzbl	72(%rax), %ecx
	movsbl	bits(%rcx), %ecx
	movzbl	73(%rax), %edx
	movsbl	bits(%rdx), %edx
	addl	%ecx, %edx
	movzbl	74(%rax), %ecx
	movsbl	bits(%rcx), %ecx
	addl	%edx, %ecx
	movzbl	75(%rax), %edx
	movsbl	bits(%rdx), %edx
	addl	%ecx, %edx
	addl	%edx, 60(%rax)
	addl	$13, 72(%rax)
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
	movl	72(%rax), %ecx
	xorl	%edx, %edx
	testl	%ecx, %ecx
	je	.LBB10_3
# %bb.1:                                # %for.body.preheader
	movl	%ecx, %esi
	.p2align	4, 0x90
.LBB10_2:                               # %for.body
                                        # =>This Inner Loop Header: Depth=1
	movl	%esi, %edi
	andl	$1, %edi
	addl	%edi, %edx
	shrl	%esi
	jne	.LBB10_2
.LBB10_3:                               # %for.end
	addl	%edx, 64(%rax)
	addl	$13, %ecx
	movl	%ecx, 72(%rax)
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
	movl	$camel+92, %eax
	movl	$camel+4, %ecx
	movl	$camel+4, %edx
	cmoveq	%rax, %rdx
	cmoveq	%rcx, %rax
	movq	%rdx, safe(%rip)
	movq	%rax, unsafe(%rip)
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
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset %rbx, -16
	callq	clock
	movq	%rax, %rbx
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
	.p2align	4, 0x90
.LBB13_1:                               # %while.cond
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB13_16 Depth 2
                                        #     Child Loop BB13_14 Depth 2
                                        #     Child Loop BB13_12 Depth 2
                                        #     Child Loop BB13_10 Depth 2
                                        #     Child Loop BB13_8 Depth 2
                                        #     Child Loop BB13_6 Depth 2
                                        #     Child Loop BB13_4 Depth 2
	callq	task_select_func
	callq	commit
	movq	safe(%rip), %rax
	movl	72(%rax), %ecx
	movq	unsafe(%rip), %rdx
	movl	%ecx, 72(%rdx)
	movl	76(%rax), %ecx
	movl	%ecx, 76(%rdx)
	movl	68(%rax), %eax
	movl	%eax, 68(%rdx)
	callq	task_commit
	movq	unsafe(%rip), %rax
	movl	68(%rax), %eax
	addl	$-1, %eax
	cmpl	$7, %eax
	ja	.LBB13_1
# %bb.2:                                # %while.cond
                                        #   in Loop: Header=BB13_1 Depth=1
	jmpq	*.LJTI13_0(,%rax,8)
.LBB13_3:                               # %while.cond13.preheader
                                        #   in Loop: Header=BB13_1 Depth=1
	movq	unsafe(%rip), %rax
	cmpl	$99, 76(%rax)
	ja	.LBB13_1
	.p2align	4, 0x90
.LBB13_4:                               # %while.body17
                                        #   Parent Loop BB13_1 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	callq	task_bit_count
	callq	commit
	movq	safe(%rip), %rax
	movl	72(%rax), %ecx
	movq	unsafe(%rip), %rdx
	movl	%ecx, 72(%rdx)
	movl	76(%rax), %ecx
	movl	%ecx, 76(%rdx)
	movl	40(%rax), %eax
	movl	%eax, 40(%rdx)
	callq	task_commit
	movq	unsafe(%rip), %rax
	cmpl	$100, 76(%rax)
	jb	.LBB13_4
	jmp	.LBB13_1
.LBB13_11:                              # %while.cond99.preheader
                                        #   in Loop: Header=BB13_1 Depth=1
	movq	unsafe(%rip), %rax
	cmpl	$99, 76(%rax)
	ja	.LBB13_1
	.p2align	4, 0x90
.LBB13_12:                              # %while.body103
                                        #   Parent Loop BB13_1 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	callq	task_BW_btbl_bitcount
	callq	commit
	movq	safe(%rip), %rax
	movl	72(%rax), %ecx
	movq	unsafe(%rip), %rdx
	movl	%ecx, 72(%rdx)
	movl	76(%rax), %ecx
	movl	%ecx, 76(%rdx)
	movl	56(%rax), %eax
	movl	%eax, 56(%rdx)
	callq	task_commit
	movq	unsafe(%rip), %rax
	cmpl	$100, 76(%rax)
	jb	.LBB13_12
	jmp	.LBB13_1
.LBB13_7:                               # %while.cond55.preheader
                                        #   in Loop: Header=BB13_1 Depth=1
	movq	unsafe(%rip), %rax
	cmpl	$99, 76(%rax)
	ja	.LBB13_1
	.p2align	4, 0x90
.LBB13_8:                               # %while.body59
                                        #   Parent Loop BB13_1 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	callq	task_ntbl_bitcnt
	callq	commit
	movq	safe(%rip), %rax
	movl	72(%rax), %ecx
	movq	unsafe(%rip), %rdx
	movl	%ecx, 72(%rdx)
	movl	76(%rax), %ecx
	movl	%ecx, 76(%rdx)
	movl	48(%rax), %eax
	movl	%eax, 48(%rdx)
	callq	task_commit
	movq	unsafe(%rip), %rax
	cmpl	$100, 76(%rax)
	jb	.LBB13_8
	jmp	.LBB13_1
.LBB13_9:                               # %while.cond77.preheader
                                        #   in Loop: Header=BB13_1 Depth=1
	movq	unsafe(%rip), %rax
	cmpl	$99, 76(%rax)
	ja	.LBB13_1
	.p2align	4, 0x90
.LBB13_10:                              # %while.body81
                                        #   Parent Loop BB13_1 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	callq	task_ntbl_bitcount
	callq	commit
	movq	safe(%rip), %rax
	movl	72(%rax), %ecx
	movq	unsafe(%rip), %rdx
	movl	%ecx, 72(%rdx)
	movl	76(%rax), %ecx
	movl	%ecx, 76(%rdx)
	movl	52(%rax), %eax
	movl	%eax, 52(%rdx)
	callq	task_commit
	movq	unsafe(%rip), %rax
	cmpl	$100, 76(%rax)
	jb	.LBB13_10
	jmp	.LBB13_1
.LBB13_5:                               # %while.cond33.preheader
                                        #   in Loop: Header=BB13_1 Depth=1
	movq	unsafe(%rip), %rax
	cmpl	$99, 76(%rax)
	ja	.LBB13_1
	.p2align	4, 0x90
.LBB13_6:                               # %while.body37
                                        #   Parent Loop BB13_1 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	callq	task_bitcount
	callq	commit
	movq	safe(%rip), %rax
	movl	72(%rax), %ecx
	movq	unsafe(%rip), %rdx
	movl	%ecx, 72(%rdx)
	movl	76(%rax), %ecx
	movl	%ecx, 76(%rdx)
	movl	44(%rax), %eax
	movl	%eax, 44(%rdx)
	callq	task_commit
	movq	unsafe(%rip), %rax
	cmpl	$100, 76(%rax)
	jb	.LBB13_6
	jmp	.LBB13_1
.LBB13_13:                              # %while.cond121.preheader
                                        #   in Loop: Header=BB13_1 Depth=1
	movq	unsafe(%rip), %rax
	cmpl	$99, 76(%rax)
	ja	.LBB13_1
	.p2align	4, 0x90
.LBB13_14:                              # %while.body125
                                        #   Parent Loop BB13_1 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	callq	task_AR_btbl_bitcount
	callq	commit
	movq	safe(%rip), %rax
	movl	72(%rax), %ecx
	movq	unsafe(%rip), %rdx
	movl	%ecx, 72(%rdx)
	movl	76(%rax), %ecx
	movl	%ecx, 76(%rdx)
	movl	60(%rax), %eax
	movl	%eax, 60(%rdx)
	callq	task_commit
	movq	unsafe(%rip), %rax
	cmpl	$100, 76(%rax)
	jb	.LBB13_14
	jmp	.LBB13_1
.LBB13_15:                              # %while.cond143.preheader
                                        #   in Loop: Header=BB13_1 Depth=1
	movq	unsafe(%rip), %rax
	cmpl	$99, 76(%rax)
	ja	.LBB13_1
	.p2align	4, 0x90
.LBB13_16:                              # %while.body147
                                        #   Parent Loop BB13_1 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	callq	task_bit_shifter
	callq	commit
	movq	safe(%rip), %rax
	movl	72(%rax), %ecx
	movq	unsafe(%rip), %rdx
	movl	%ecx, 72(%rdx)
	movl	76(%rax), %ecx
	movl	%ecx, 76(%rdx)
	movl	64(%rax), %eax
	movl	%eax, 64(%rdx)
	callq	task_commit
	movq	unsafe(%rip), %rax
	cmpl	$100, 76(%rax)
	jb	.LBB13_16
	jmp	.LBB13_1
.LBB13_17:                              # %if.then164
	callq	task_done
	callq	clock
	subq	%rbx, %rax
	xorps	%xmm0, %xmm0
	cvtsi2sd	%rax, %xmm0
	divsd	.LCPI13_0(%rip), %xmm0
	movl	$.L.str.8, %edi
	movb	$1, %al
	callq	printf
	xorl	%edi, %edi
	callq	exit
.Lfunc_end13:
	.size	main, .Lfunc_end13-main
	.cfi_endproc
	.section	.rodata,"a",@progbits
	.p2align	3
.LJTI13_0:
	.quad	.LBB13_3
	.quad	.LBB13_5
	.quad	.LBB13_7
	.quad	.LBB13_9
	.quad	.LBB13_11
	.quad	.LBB13_13
	.quad	.LBB13_15
	.quad	.LBB13_17
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
	.section	.rodata,"a",@progbits
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
