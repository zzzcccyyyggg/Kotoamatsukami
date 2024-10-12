	.text
	.file	"test2.c"
	.globl	main                            # -- Begin function main
	.p2align	4, 0x90
	.type	main,@function
main:                                   # @main
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$32, %rsp
	movl	$0, -4(%rbp)
	movl	$0, -8(%rbp)
	movl	$4, -12(%rbp)
	movl	$2, -16(%rbp)
	movl	$0, -20(%rbp)
	movl	-12(%rbp), %eax
	movl	%eax, -8(%rbp)
	cmpl	$0, -8(%rbp)
	setg	%al
	movl	$8, %ecx
	movb	%al, %dl
	#APP
	pushq	%rax
	pushq	%rbx
	movq	%rcx, %rax
	xorq	%rbx, %rbx
	movb	%dl, %bl
	callq	IndirectConditionalJumpFunc

	#NO_APP
	testb	$1, %al
	jne	.LBB0_1
	jmp	.LBB0_9
.Ltmp0:                                 # Block address taken
.LBB0_1:
	#APP
	popq	%rax
	popq	%rbx
	popq	%rax

	#NO_APP
	leaq	.L.str(%rip), %rdi
	movb	$0, %al
	callq	printf@PLT
	movl	$1, -24(%rbp)
.Ltmp1:                                 # Block address taken
.LBB0_2:                                # =>This Inner Loop Header: Depth=1
	movl	-24(%rbp), %eax
	cmpl	-8(%rbp), %eax
	setle	%al
	movabsq	$4295098372, %rcx               # imm = 0x100020004
	movb	%al, %dl
	#APP
	pushq	%rax
	pushq	%rbx
	movq	%rcx, %rax
	xorq	%rbx, %rbx
	movb	%dl, %bl
	callq	IndirectConditionalJumpFunc

	#NO_APP
	testb	$1, %al
	jne	.LBB0_3
	jmp	.LBB0_5
.Ltmp2:                                 # Block address taken
.LBB0_3:                                #   in Loop: Header=BB0_2 Depth=1
	#APP
	popq	%rax
	popq	%rbx
	popq	%rax

	#NO_APP
	movl	-24(%rbp), %eax
	addl	-20(%rbp), %eax
	movl	%eax, -20(%rbp)
	movl	-24(%rbp), %esi
	movl	-20(%rbp), %edx
	leaq	.L.str.1(%rip), %rdi
	movb	$0, %al
	callq	printf@PLT
.Ltmp3:                                 # Block address taken
# %bb.4:                                #   in Loop: Header=BB0_2 Depth=1
	movl	-24(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -24(%rbp)
	jmp	.LBB0_2
.Ltmp4:                                 # Block address taken
.LBB0_5:
	#APP
	popq	%rax
	popq	%rbx
	popq	%rax

	#NO_APP
	cmpl	$10, -20(%rbp)
	setg	%al
	movabsq	$17180196870, %rcx              # imm = 0x400050006
	movb	%al, %dl
	#APP
	pushq	%rax
	pushq	%rbx
	movq	%rcx, %rax
	xorq	%rbx, %rbx
	movb	%dl, %bl
	callq	IndirectConditionalJumpFunc

	#NO_APP
	testb	$1, %al
	jne	.LBB0_6
	jmp	.LBB0_7
.Ltmp5:                                 # Block address taken
.LBB0_6:
	#APP
	popq	%rax
	popq	%rbx
	popq	%rax

	#NO_APP
	leaq	.L.str.2(%rip), %rdi
	movb	$0, %al
	callq	printf@PLT
	jmp	.LBB0_8
.Ltmp6:                                 # Block address taken
.LBB0_7:
	#APP
	popq	%rax
	popq	%rbx
	popq	%rax

	#NO_APP
	leaq	.L.str.3(%rip), %rdi
	movb	$0, %al
	callq	printf@PLT
.Ltmp7:                                 # Block address taken
.LBB0_8:
	jmp	.LBB0_10
.Ltmp8:                                 # Block address taken
.LBB0_9:
	#APP
	popq	%rax
	popq	%rbx
	popq	%rax

	#NO_APP
	leaq	.L.str.4(%rip), %rdi
	movb	$0, %al
	callq	printf@PLT
.Ltmp9:                                 # Block address taken
.LBB0_10:
	movl	-8(%rbp), %edi
	movl	-16(%rbp), %esi
	callq	calculateSum
	movl	%eax, -28(%rbp)
	movl	-28(%rbp), %edi
	callq	printResult
	xorl	%eax, %eax
	addq	$32, %rsp
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Lfunc_end0:
	.size	main, .Lfunc_end0-main
	.cfi_endproc
                                        # -- End function
	.globl	calculateSum                    # -- Begin function calculateSum
	.p2align	4, 0x90
	.type	calculateSum,@function
calculateSum:                           # @calculateSum
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	movl	%edi, -4(%rbp)
	movl	%esi, -8(%rbp)
	movl	-4(%rbp), %eax
	addl	-8(%rbp), %eax
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Lfunc_end1:
	.size	calculateSum, .Lfunc_end1-calculateSum
	.cfi_endproc
                                        # -- End function
	.globl	printResult                     # -- Begin function printResult
	.p2align	4, 0x90
	.type	printResult,@function
printResult:                            # @printResult
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$16, %rsp
	movl	%edi, -4(%rbp)
	movl	-4(%rbp), %esi
	leaq	.L.str.5(%rip), %rdi
	movb	$0, %al
	callq	printf@PLT
	addq	$16, %rsp
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Lfunc_end2:
	.size	printResult, .Lfunc_end2-printResult
	.cfi_endproc
                                        # -- End function
	.globl	IndirectCallFunc                # -- Begin function IndirectCallFunc
	.p2align	4, 0x90
	.type	IndirectCallFunc,@function
IndirectCallFunc:                       # @IndirectCallFunc
	.cfi_startproc
# %bb.0:
	#APP
	movq	%rax, %rax
	#NO_APP
	movq	%rax, %rcx
	shrq	$48, %rcx
	movw	%cx, %dx
	shrq	$32, %rax
	movw	%ax, %cx
	leaq	.LAllFunctions_IndirectBrTargets(%rip), %rax
	movswq	%dx, %rdx
	imulq	$88, %rdx, %rdx
	addq	%rdx, %rax
	movswq	%cx, %rcx
	movq	(%rax,%rcx,8), %rax
	#APP
	pushq	%rax
	#NO_APP
	retq
.Lfunc_end3:
	.size	IndirectCallFunc, .Lfunc_end3-IndirectCallFunc
	.cfi_endproc
                                        # -- End function
	.globl	IndirectConditionalJumpFunc     # -- Begin function IndirectConditionalJumpFunc
	.p2align	4, 0x90
	.type	IndirectConditionalJumpFunc,@function
IndirectConditionalJumpFunc:            # @IndirectConditionalJumpFunc
	.cfi_startproc
# %bb.0:
	#APP
	movq	%rax, %rax
	#NO_APP
	movq	%rax, %rcx
	shrq	$48, %rcx
	movw	%cx, %di
	movq	%rax, %rcx
	shrq	$16, %rcx
                                        # kill: def $cx killed $cx killed $rcx
	movw	%ax, %dx
	#APP
	movq	%rbx, %rsi
	#NO_APP
	leaq	.LAllFunctions_IndirectBrTargets(%rip), %rax
	movswq	%di, %r8
	imulq	$88, %r8, %r8
	addq	%r8, %rax
	movswq	%cx, %rcx
	movq	(%rax,%rcx,8), %rax
	leaq	.LAllFunctions_IndirectBrTargets(%rip), %rcx
	movswq	%di, %rdi
	imulq	$88, %rdi, %rdi
	addq	%rdi, %rcx
	cmpq	$1, %rsi
	movswq	%dx, %rdx
	cmovneq	(%rcx,%rdx,8), %rax
	#APP
	pushq	%rax
	#NO_APP
	retq
.Lfunc_end4:
	.size	IndirectConditionalJumpFunc, .Lfunc_end4-IndirectConditionalJumpFunc
	.cfi_endproc
                                        # -- End function
	.type	.L.str,@object                  # @.str
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str:
	.asciz	"Node 1: a is greater than 0\n"
	.size	.L.str, 29

	.type	.L.str.1,@object                # @.str.1
.L.str.1:
	.asciz	"Adding %d to sum, current sum: %d\n"
	.size	.L.str.1, 35

	.type	.L.str.2,@object                # @.str.2
.L.str.2:
	.asciz	"Node 2: Sum is greater than 10\n"
	.size	.L.str.2, 32

	.type	.L.str.3,@object                # @.str.3
.L.str.3:
	.asciz	"Node 3: Sum is less than or equal to 10\n"
	.size	.L.str.3, 41

	.type	.L.str.4,@object                # @.str.4
.L.str.4:
	.asciz	"Node 4: a is not greater than 0\n"
	.size	.L.str.4, 33

	.type	.L.str.5,@object                # @.str.5
.L.str.5:
	.asciz	"The result of the calculation is: %d\n"
	.size	.L.str.5, 38

	.type	.LAllFunctions_IndirectBrTargets,@object # @AllFunctions_IndirectBrTargets
	.data
	.p2align	4, 0x0
.LAllFunctions_IndirectBrTargets:
	.quad	.Ltmp0
	.quad	.Ltmp1
	.quad	.Ltmp2
	.quad	.Ltmp3
	.quad	.Ltmp4
	.quad	.Ltmp5
	.quad	.Ltmp6
	.quad	.Ltmp7
	.quad	.Ltmp8
	.quad	.Ltmp9
	.quad	0
	.size	.LAllFunctions_IndirectBrTargets, 88

	.ident	"clang version 17.0.6 (git@github.com:llvm/llvm-project.git 6009708b4367171ccdbf4b5905cb6a803753fe18)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
	.addrsig_sym main
	.addrsig_sym printf
	.addrsig_sym calculateSum
	.addrsig_sym printResult
	.addrsig_sym .LAllFunctions_IndirectBrTargets
