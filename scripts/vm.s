	.text
	.file	"vm.c"
	.globl	new_vm                          # -- Begin function new_vm
	.p2align	4, 0x90
	.type	new_vm,@function
new_vm:                                 # @new_vm
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$32, %rsp
	movq	%rdi, -8(%rbp)
	movl	%esi, -12(%rbp)
	movl	%edx, -16(%rbp)
	movl	$88, %edi
	callq	malloc@PLT
	movq	%rax, -24(%rbp)
	movq	-8(%rbp), %rcx
	movq	-24(%rbp), %rax
	movq	%rcx, 64(%rax)
	movq	-24(%rbp), %rax
	movl	$0, 72(%rax)
	movq	-24(%rbp), %rax
	movl	$0, 76(%rax)
	movslq	-16(%rbp), %rdi
	shlq	$2, %rdi
	callq	malloc@PLT
	movq	%rax, %rcx
	movq	-24(%rbp), %rax
	movq	%rcx, 80(%rax)
	movq	-24(%rbp), %rax
	movq	80(%rax), %rdi
	movslq	-16(%rbp), %rdx
	xorl	%esi, %esi
	callq	memset@PLT
	movq	-24(%rbp), %rax
	movq	80(%rax), %rdi
	addq	$128, %rdi
	leaq	cmps(%rip), %rsi
	movl	$34, %edx
	callq	memcpy@PLT
	movq	-24(%rbp), %rax
	addq	$32, %rsp
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Lfunc_end0:
	.size	new_vm, .Lfunc_end0-new_vm
	.cfi_endproc
                                        # -- End function
	.globl	run_vm                          # -- Begin function run_vm
	.p2align	4, 0x90
	.type	run_vm,@function
run_vm:                                 # @run_vm
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$48, %rsp
	movq	%rdi, -8(%rbp)
	movl	$1, -36(%rbp)
	leaq	.L.str(%rip), %rdi
	movb	$0, %al
	callq	printf@PLT
.Ltmp0:                                 # Block address taken
.LBB1_1:                                # =>This Inner Loop Header: Depth=1
	cmpl	$0, -36(%rbp)
	setne	%al
	movl	$65560, %ecx                    # imm = 0x10018
	movb	%al, %dl
	#APP
	pushq	%rax
	pushq	%rbx
	movq	$65560, %rax                    # imm = 0x10018
	xorq	%rbx, %rbx
	movb	%dl, %bl
	callq	IndirectConditionalJumpFunc
.Ltmp1:                                 # Block address taken
.LBB1_2:                                #   in Loop: Header=BB1_1 Depth=1
	#APP
	popq	%rax
	popq	%rbx
	popq	%rax

	#NO_APP
	movq	-8(%rbp), %rcx
	movq	64(%rcx), %rax
	movslq	72(%rcx), %rcx
	movl	(%rax,%rcx,4), %eax
	movl	%eax, -12(%rbp)
	movl	-12(%rbp), %eax
                                        # kill: def $rax killed $eax
	movq	%rax, -48(%rbp)                 # 8-byte Spill
	subq	$13, %rax
	ja	.LBB1_23
# %bb.26:                               #   in Loop: Header=BB1_1 Depth=1
	movq	-48(%rbp), %rax                 # 8-byte Reload
	leaq	.LJTI1_0(%rip), %rcx
	movslq	(%rcx,%rax,4), %rax
	addq	%rcx, %rax
	jmpq	*%rax
.Ltmp2:                                 # Block address taken
.LBB1_3:                                #   in Loop: Header=BB1_1 Depth=1
	movl	$0, -36(%rbp)
	jmp	.LBB1_24
.Ltmp3:                                 # Block address taken
.LBB1_4:                                #   in Loop: Header=BB1_1 Depth=1
	movq	-8(%rbp), %rax
	movq	64(%rax), %rax
	movq	-8(%rbp), %rcx
	movl	72(%rcx), %ecx
	addl	$1, %ecx
	movslq	%ecx, %rcx
	movl	(%rax,%rcx,4), %eax
	movl	%eax, -16(%rbp)
	movq	-8(%rbp), %rax
	movq	64(%rax), %rax
	movq	-8(%rbp), %rcx
	movl	72(%rcx), %ecx
	addl	$2, %ecx
	movslq	%ecx, %rcx
	movl	(%rax,%rcx,4), %eax
	movl	%eax, -28(%rbp)
	movl	-28(%rbp), %edx
	movq	-8(%rbp), %rax
	movslq	-16(%rbp), %rcx
	movl	%edx, (%rax,%rcx,4)
	movq	-8(%rbp), %rax
	movl	72(%rax), %ecx
	addl	$3, %ecx
	movl	%ecx, 72(%rax)
	jmp	.LBB1_24
.Ltmp4:                                 # Block address taken
.LBB1_5:                                #   in Loop: Header=BB1_1 Depth=1
	movq	-8(%rbp), %rax
	movq	64(%rax), %rax
	movq	-8(%rbp), %rcx
	movl	72(%rcx), %ecx
	addl	$1, %ecx
	movslq	%ecx, %rcx
	movl	(%rax,%rcx,4), %eax
	movl	%eax, -16(%rbp)
	movq	-8(%rbp), %rax
	movq	64(%rax), %rax
	movq	-8(%rbp), %rcx
	movl	72(%rcx), %ecx
	addl	$2, %ecx
	movslq	%ecx, %rcx
	movl	(%rax,%rcx,4), %eax
	movl	%eax, -20(%rbp)
	movq	-8(%rbp), %rax
	movslq	-16(%rbp), %rcx
	movl	(%rax,%rcx,4), %edx
	movq	-8(%rbp), %rax
	movslq	-20(%rbp), %rcx
	movl	%edx, (%rax,%rcx,4)
	movq	-8(%rbp), %rax
	movl	72(%rax), %ecx
	addl	$3, %ecx
	movl	%ecx, 72(%rax)
	jmp	.LBB1_24
.Ltmp5:                                 # Block address taken
.LBB1_6:                                #   in Loop: Header=BB1_1 Depth=1
	movq	-8(%rbp), %rax
	movq	64(%rax), %rax
	movq	-8(%rbp), %rcx
	movl	72(%rcx), %ecx
	addl	$3, %ecx
	movslq	%ecx, %rcx
	movl	(%rax,%rcx,4), %eax
	movl	%eax, -16(%rbp)
	movq	-8(%rbp), %rax
	movq	64(%rax), %rax
	movq	-8(%rbp), %rcx
	movl	72(%rcx), %ecx
	addl	$2, %ecx
	movslq	%ecx, %rcx
	movl	(%rax,%rcx,4), %eax
	movl	%eax, -20(%rbp)
	movq	-8(%rbp), %rax
	movq	64(%rax), %rax
	movq	-8(%rbp), %rcx
	movl	72(%rcx), %ecx
	addl	$1, %ecx
	movslq	%ecx, %rcx
	movl	(%rax,%rcx,4), %eax
	movl	%eax, -24(%rbp)
	movq	-8(%rbp), %rax
	movslq	-16(%rbp), %rcx
	movl	(%rax,%rcx,4), %edx
	movq	-8(%rbp), %rax
	movslq	-20(%rbp), %rcx
	addl	(%rax,%rcx,4), %edx
	movq	-8(%rbp), %rax
	movslq	-24(%rbp), %rcx
	movl	%edx, (%rax,%rcx,4)
	movq	-8(%rbp), %rax
	movl	72(%rax), %ecx
	addl	$4, %ecx
	movl	%ecx, 72(%rax)
	jmp	.LBB1_24
.Ltmp6:                                 # Block address taken
.LBB1_7:                                #   in Loop: Header=BB1_1 Depth=1
	movq	-8(%rbp), %rax
	movq	64(%rax), %rax
	movq	-8(%rbp), %rcx
	movl	72(%rcx), %ecx
	addl	$3, %ecx
	movslq	%ecx, %rcx
	movl	(%rax,%rcx,4), %eax
	movl	%eax, -16(%rbp)
	movq	-8(%rbp), %rax
	movq	64(%rax), %rax
	movq	-8(%rbp), %rcx
	movl	72(%rcx), %ecx
	addl	$2, %ecx
	movslq	%ecx, %rcx
	movl	(%rax,%rcx,4), %eax
	movl	%eax, -20(%rbp)
	movq	-8(%rbp), %rax
	movq	64(%rax), %rax
	movq	-8(%rbp), %rcx
	movl	72(%rcx), %ecx
	addl	$1, %ecx
	movslq	%ecx, %rcx
	movl	(%rax,%rcx,4), %eax
	movl	%eax, -24(%rbp)
	movq	-8(%rbp), %rax
	movslq	-16(%rbp), %rcx
	movl	(%rax,%rcx,4), %edx
	movq	-8(%rbp), %rax
	movslq	-20(%rbp), %rcx
	subl	(%rax,%rcx,4), %edx
	movq	-8(%rbp), %rax
	movslq	-24(%rbp), %rcx
	movl	%edx, (%rax,%rcx,4)
	movq	-8(%rbp), %rax
	movl	72(%rax), %ecx
	addl	$4, %ecx
	movl	%ecx, 72(%rax)
	jmp	.LBB1_24
.Ltmp7:                                 # Block address taken
.LBB1_8:                                #   in Loop: Header=BB1_1 Depth=1
	movq	-8(%rbp), %rax
	movq	64(%rax), %rax
	movq	-8(%rbp), %rcx
	movl	72(%rcx), %ecx
	addl	$3, %ecx
	movslq	%ecx, %rcx
	movl	(%rax,%rcx,4), %eax
	movl	%eax, -16(%rbp)
	movq	-8(%rbp), %rax
	movq	64(%rax), %rax
	movq	-8(%rbp), %rcx
	movl	72(%rcx), %ecx
	addl	$2, %ecx
	movslq	%ecx, %rcx
	movl	(%rax,%rcx,4), %eax
	movl	%eax, -20(%rbp)
	movq	-8(%rbp), %rax
	movq	64(%rax), %rax
	movq	-8(%rbp), %rcx
	movl	72(%rcx), %ecx
	addl	$1, %ecx
	movslq	%ecx, %rcx
	movl	(%rax,%rcx,4), %eax
	movl	%eax, -24(%rbp)
	movq	-8(%rbp), %rax
	movslq	-16(%rbp), %rcx
	movl	(%rax,%rcx,4), %edx
	movq	-8(%rbp), %rax
	movslq	-20(%rbp), %rcx
	imull	(%rax,%rcx,4), %edx
	movq	-8(%rbp), %rax
	movslq	-24(%rbp), %rcx
	movl	%edx, (%rax,%rcx,4)
	movq	-8(%rbp), %rax
	movl	72(%rax), %ecx
	addl	$4, %ecx
	movl	%ecx, 72(%rax)
	jmp	.LBB1_24
.Ltmp8:                                 # Block address taken
.LBB1_9:                                #   in Loop: Header=BB1_1 Depth=1
	movq	-8(%rbp), %rax
	movq	64(%rax), %rax
	movq	-8(%rbp), %rcx
	movl	72(%rcx), %ecx
	addl	$3, %ecx
	movslq	%ecx, %rcx
	movl	(%rax,%rcx,4), %eax
	movl	%eax, -16(%rbp)
	movq	-8(%rbp), %rax
	movq	64(%rax), %rax
	movq	-8(%rbp), %rcx
	movl	72(%rcx), %ecx
	addl	$2, %ecx
	movslq	%ecx, %rcx
	movl	(%rax,%rcx,4), %eax
	movl	%eax, -20(%rbp)
	movq	-8(%rbp), %rax
	movq	64(%rax), %rax
	movq	-8(%rbp), %rcx
	movl	72(%rcx), %ecx
	addl	$1, %ecx
	movslq	%ecx, %rcx
	movl	(%rax,%rcx,4), %eax
	movl	%eax, -24(%rbp)
	movq	-8(%rbp), %rax
	movslq	-16(%rbp), %rcx
	movl	(%rax,%rcx,4), %eax
	movq	-8(%rbp), %rcx
	movslq	-20(%rbp), %rsi
	cltd
	idivl	(%rcx,%rsi,4)
	movl	%eax, %edx
	movq	-8(%rbp), %rax
	movslq	-24(%rbp), %rcx
	movl	%edx, (%rax,%rcx,4)
	movq	-8(%rbp), %rax
	movl	72(%rax), %ecx
	addl	$4, %ecx
	movl	%ecx, 72(%rax)
	jmp	.LBB1_24
.Ltmp9:                                 # Block address taken
.LBB1_10:                               #   in Loop: Header=BB1_1 Depth=1
	movq	-8(%rbp), %rax
	movq	64(%rax), %rax
	movq	-8(%rbp), %rcx
	movl	72(%rcx), %ecx
	addl	$3, %ecx
	movslq	%ecx, %rcx
	movl	(%rax,%rcx,4), %eax
	movl	%eax, -16(%rbp)
	movq	-8(%rbp), %rax
	movq	64(%rax), %rax
	movq	-8(%rbp), %rcx
	movl	72(%rcx), %ecx
	addl	$2, %ecx
	movslq	%ecx, %rcx
	movl	(%rax,%rcx,4), %eax
	movl	%eax, -20(%rbp)
	movq	-8(%rbp), %rax
	movq	64(%rax), %rax
	movq	-8(%rbp), %rcx
	movl	72(%rcx), %ecx
	addl	$1, %ecx
	movslq	%ecx, %rcx
	movl	(%rax,%rcx,4), %eax
	movl	%eax, -24(%rbp)
	movq	-8(%rbp), %rax
	movslq	-16(%rbp), %rcx
	movl	(%rax,%rcx,4), %edx
	movq	-8(%rbp), %rax
	movslq	-20(%rbp), %rcx
	xorl	(%rax,%rcx,4), %edx
	movq	-8(%rbp), %rax
	movslq	-24(%rbp), %rcx
	movl	%edx, (%rax,%rcx,4)
	movq	-8(%rbp), %rax
	movl	72(%rax), %ecx
	addl	$4, %ecx
	movl	%ecx, 72(%rax)
	jmp	.LBB1_24
.Ltmp10:                                # Block address taken
.LBB1_11:                               #   in Loop: Header=BB1_1 Depth=1
	movq	-8(%rbp), %rax
	movq	64(%rax), %rax
	movq	-8(%rbp), %rcx
	movl	72(%rcx), %ecx
	addl	$1, %ecx
	movslq	%ecx, %rcx
	movl	(%rax,%rcx,4), %eax
	movl	%eax, -28(%rbp)
	movl	-28(%rbp), %ecx
	movq	-8(%rbp), %rax
	movl	%ecx, 72(%rax)
	jmp	.LBB1_24
.Ltmp11:                                # Block address taken
.LBB1_12:                               #   in Loop: Header=BB1_1 Depth=1
	movq	-8(%rbp), %rax
	movq	64(%rax), %rax
	movq	-8(%rbp), %rcx
	movl	72(%rcx), %ecx
	addl	$1, %ecx
	movslq	%ecx, %rcx
	movl	(%rax,%rcx,4), %eax
	movl	%eax, -32(%rbp)
	movq	-8(%rbp), %rax
	movq	80(%rax), %rdi
	movslq	-32(%rbp), %rax
	addq	%rax, %rdi
	movq	stdin@GOTPCREL(%rip), %rax
	movq	(%rax), %rdx
	movl	$256, %esi                      # imm = 0x100
	callq	fgets@PLT
	movq	-8(%rbp), %rax
	movl	72(%rax), %ecx
	addl	$2, %ecx
	movl	%ecx, 72(%rax)
	jmp	.LBB1_24
.Ltmp12:                                # Block address taken
.LBB1_13:                               #   in Loop: Header=BB1_1 Depth=1
	movq	-8(%rbp), %rax
	movq	64(%rax), %rax
	movq	-8(%rbp), %rcx
	movl	72(%rcx), %ecx
	addl	$1, %ecx
	movslq	%ecx, %rcx
	movl	(%rax,%rcx,4), %eax
	movl	%eax, -16(%rbp)
	movq	-8(%rbp), %rax
	movq	64(%rax), %rax
	movq	-8(%rbp), %rcx
	movl	72(%rcx), %ecx
	addl	$2, %ecx
	movslq	%ecx, %rcx
	movl	(%rax,%rcx,4), %eax
	movl	%eax, -20(%rbp)
	movq	-8(%rbp), %rax
	movslq	-16(%rbp), %rcx
	movl	(%rax,%rcx,4), %eax
	movq	-8(%rbp), %rcx
	movslq	-20(%rbp), %rdx
	cmpl	(%rcx,%rdx,4), %eax
	sete	%al
	andb	$1, %al
	movzbl	%al, %ecx
	movq	-8(%rbp), %rax
	movl	%ecx, 76(%rax)
	movq	-8(%rbp), %rax
	movl	72(%rax), %ecx
	addl	$3, %ecx
	movl	%ecx, 72(%rax)
	jmp	.LBB1_24
.Ltmp13:                                # Block address taken
.LBB1_14:                               #   in Loop: Header=BB1_1 Depth=1
	movq	-8(%rbp), %rax
	cmpl	$0, 76(%rax)
	setne	%al
	movabsq	$55835557902, %rcx              # imm = 0xD000F000E
	movb	%al, %dl
	#APP
	pushq	%rax
	pushq	%rbx
	movabsq	$55835557902, %rax              # imm = 0xD000F000E
	xorq	%rbx, %rbx
	movb	%dl, %bl
	callq	IndirectConditionalJumpFunc
.Ltmp14:                                # Block address taken
# %bb.15:                               #   in Loop: Header=BB1_1 Depth=1
	#APP
	popq	%rax
	popq	%rbx
	popq	%rax

	#NO_APP
	movq	-8(%rbp), %rax
	movq	64(%rax), %rax
	movq	-8(%rbp), %rcx
	movl	72(%rcx), %ecx
	addl	$1, %ecx
	movslq	%ecx, %rcx
	movl	(%rax,%rcx,4), %ecx
	movq	-8(%rbp), %rax
	movl	%ecx, 72(%rax)
	jmp	.LBB1_17
.Ltmp15:                                # Block address taken
.LBB1_16:                               #   in Loop: Header=BB1_1 Depth=1
	#APP
	popq	%rax
	popq	%rbx
	popq	%rax

	#NO_APP
	movq	-8(%rbp), %rax
	movl	72(%rax), %ecx
	addl	$2, %ecx
	movl	%ecx, 72(%rax)
.Ltmp16:                                # Block address taken
.LBB1_17:                               #   in Loop: Header=BB1_1 Depth=1
	jmp	.LBB1_24
.Ltmp17:                                # Block address taken
.LBB1_18:                               #   in Loop: Header=BB1_1 Depth=1
	movq	-8(%rbp), %rax
	movq	64(%rax), %rax
	movq	-8(%rbp), %rcx
	movl	72(%rcx), %ecx
	addl	$1, %ecx
	movslq	%ecx, %rcx
	movl	(%rax,%rcx,4), %eax
	movl	%eax, -16(%rbp)
	movq	-8(%rbp), %rax
	movq	64(%rax), %rax
	movq	-8(%rbp), %rcx
	movl	72(%rcx), %ecx
	addl	$2, %ecx
	movslq	%ecx, %rcx
	movl	(%rax,%rcx,4), %eax
	movl	%eax, -20(%rbp)
	movq	-8(%rbp), %rax
	movslq	-20(%rbp), %rcx
	movl	(%rax,%rcx,4), %eax
	movl	%eax, -32(%rbp)
	movq	-8(%rbp), %rax
	movq	80(%rax), %rax
	movslq	-32(%rbp), %rcx
	movzbl	(%rax,%rcx), %edx
	movq	-8(%rbp), %rax
	movslq	-16(%rbp), %rcx
	movl	%edx, (%rax,%rcx,4)
	movq	-8(%rbp), %rax
	movl	72(%rax), %ecx
	addl	$3, %ecx
	movl	%ecx, 72(%rax)
	jmp	.LBB1_24
.Ltmp18:                                # Block address taken
.LBB1_19:                               #   in Loop: Header=BB1_1 Depth=1
	movq	-8(%rbp), %rax
	movq	64(%rax), %rax
	movq	-8(%rbp), %rcx
	movl	72(%rcx), %ecx
	addl	$1, %ecx
	movslq	%ecx, %rcx
	cmpl	$0, (%rax,%rcx,4)
	setne	%al
	movabsq	$77310656532, %rcx              # imm = 0x1200130014
	movb	%al, %dl
	#APP
	pushq	%rax
	pushq	%rbx
	movabsq	$77310656532, %rax              # imm = 0x1200130014
	xorq	%rbx, %rbx
	movb	%dl, %bl
	callq	IndirectConditionalJumpFunc
.Ltmp19:                                # Block address taken
.LBB1_20:                               #   in Loop: Header=BB1_1 Depth=1
	#APP
	popq	%rax
	popq	%rbx
	popq	%rax

	#NO_APP
	leaq	.L.str.1(%rip), %rdi
	movb	$0, %al
	callq	printf@PLT
	jmp	.LBB1_22
.Ltmp20:                                # Block address taken
.LBB1_21:                               #   in Loop: Header=BB1_1 Depth=1
	#APP
	popq	%rax
	popq	%rbx
	popq	%rax

	#NO_APP
	leaq	.L.str.2(%rip), %rdi
	movb	$0, %al
	callq	printf@PLT
.Ltmp21:                                # Block address taken
.LBB1_22:                               #   in Loop: Header=BB1_1 Depth=1
	movq	-8(%rbp), %rax
	movl	72(%rax), %ecx
	addl	$1, %ecx
	movl	%ecx, 72(%rax)
	jmp	.LBB1_24
.Ltmp22:                                # Block address taken
.LBB1_23:
	movl	-12(%rbp), %esi
	leaq	.L.str.3(%rip), %rdi
	movb	$0, %al
	callq	printf@PLT
	movl	$1, %edi
	callq	exit@PLT
.Ltmp23:                                # Block address taken
.LBB1_24:                               #   in Loop: Header=BB1_1 Depth=1
	jmp	.LBB1_1
.Ltmp24:                                # Block address taken
.LBB1_25:
	#APP
	popq	%rax
	popq	%rbx
	popq	%rax

	#NO_APP
	addq	$48, %rsp
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Lfunc_end1:
	.size	run_vm, .Lfunc_end1-run_vm
	.cfi_endproc
	.section	.rodata,"a",@progbits
	.p2align	2, 0x0
.LJTI1_0:
	.long	.LBB1_3-.LJTI1_0
	.long	.LBB1_4-.LJTI1_0
	.long	.LBB1_5-.LJTI1_0
	.long	.LBB1_6-.LJTI1_0
	.long	.LBB1_7-.LJTI1_0
	.long	.LBB1_8-.LJTI1_0
	.long	.LBB1_9-.LJTI1_0
	.long	.LBB1_10-.LJTI1_0
	.long	.LBB1_11-.LJTI1_0
	.long	.LBB1_12-.LJTI1_0
	.long	.LBB1_13-.LJTI1_0
	.long	.LBB1_14-.LJTI1_0
	.long	.LBB1_18-.LJTI1_0
	.long	.LBB1_19-.LJTI1_0
                                        # -- End function
	.text
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
	subq	$16, %rsp
	leaq	prog(%rip), %rdi
	movl	$51, %esi
	movl	$256, %edx                      # imm = 0x100
	callq	new_vm
	movq	%rax, -8(%rbp)
	movq	-8(%rbp), %rdi
	callq	run_vm
	xorl	%eax, %eax
	addq	$16, %rsp
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Lfunc_end2:
	.size	main, .Lfunc_end2-main
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
	imulq	$208, %rdx, %rdx
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
	imulq	$208, %r8, %r8
	addq	%r8, %rax
	movswq	%cx, %rcx
	movq	(%rax,%rcx,8), %rax
	leaq	.LAllFunctions_IndirectBrTargets(%rip), %rcx
	movswq	%di, %rdi
	imulq	$208, %rdi, %rdi
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
	.type	cmps,@object                    # @cmps
	.data
	.globl	cmps
	.p2align	4, 0x0
cmps:
	.ascii	"\253\274\250\250\252\275\257\222\330\232\266\277\244\266\213\214\210\234\235\330\217\234\330\266\217\206\233\266\273\254\254\273\326\224"
	.size	cmps, 34

	.type	.L.str,@object                  # @.str
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str:
	.asciz	"input\n"
	.size	.L.str, 7

	.type	.L.str.1,@object                # @.str.1
.L.str.1:
	.asciz	"righhhhhhhhht!\n"
	.size	.L.str.1, 16

	.type	.L.str.2,@object                # @.str.2
.L.str.2:
	.asciz	"wronnnnnnnnng!\n"
	.size	.L.str.2, 16

	.type	.L.str.3,@object                # @.str.3
.L.str.3:
	.asciz	"Invalid opcode: %d\n"
	.size	.L.str.3, 20

	.type	prog,@object                    # @prog
	.data
	.globl	prog
	.p2align	4, 0x0
prog:
	.long	9                               # 0x9
	.long	0                               # 0x0
	.long	1                               # 0x1
	.long	0                               # 0x0
	.long	0                               # 0x0
	.long	1                               # 0x1
	.long	1                               # 0x1
	.long	128                             # 0x80
	.long	1                               # 0x1
	.long	13                              # 0xd
	.long	34                              # 0x22
	.long	1                               # 0x1
	.long	14                              # 0xe
	.long	1                               # 0x1
	.long	1                               # 0x1
	.long	15                              # 0xf
	.long	233                             # 0xe9
	.long	12                              # 0xc
	.long	2                               # 0x2
	.long	0                               # 0x0
	.long	7                               # 0x7
	.long	3                               # 0x3
	.long	2                               # 0x2
	.long	15                              # 0xf
	.long	12                              # 0xc
	.long	4                               # 0x4
	.long	1                               # 0x1
	.long	10                              # 0xa
	.long	4                               # 0x4
	.long	3                               # 0x3
	.long	11                              # 0xb
	.long	48                              # 0x30
	.long	3                               # 0x3
	.long	0                               # 0x0
	.long	0                               # 0x0
	.long	14                              # 0xe
	.long	3                               # 0x3
	.long	1                               # 0x1
	.long	1                               # 0x1
	.long	14                              # 0xe
	.long	10                              # 0xa
	.long	0                               # 0x0
	.long	13                              # 0xd
	.long	11                              # 0xb
	.long	17                              # 0x11
	.long	13                              # 0xd
	.long	1                               # 0x1
	.long	0                               # 0x0
	.long	13                              # 0xd
	.long	0                               # 0x0
	.long	0                               # 0x0
	.size	prog, 204

	.type	.LAllFunctions_IndirectBrTargets,@object # @AllFunctions_IndirectBrTargets
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
	.quad	.Ltmp10
	.quad	.Ltmp11
	.quad	.Ltmp12
	.quad	.Ltmp13
	.quad	.Ltmp14
	.quad	.Ltmp15
	.quad	.Ltmp16
	.quad	.Ltmp17
	.quad	.Ltmp18
	.quad	.Ltmp19
	.quad	.Ltmp20
	.quad	.Ltmp21
	.quad	.Ltmp22
	.quad	.Ltmp23
	.quad	.Ltmp24
	.quad	0
	.size	.LAllFunctions_IndirectBrTargets, 208

	.ident	"clang version 17.0.6 (git@github.com:llvm/llvm-project.git 6009708b4367171ccdbf4b5905cb6a803753fe18)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
	.addrsig_sym new_vm
	.addrsig_sym malloc
	.addrsig_sym run_vm
	.addrsig_sym printf
	.addrsig_sym fgets
	.addrsig_sym exit
	.addrsig_sym cmps
	.addrsig_sym stdin
	.addrsig_sym prog
	.addrsig_sym .LAllFunctions_IndirectBrTargets
