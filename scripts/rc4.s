	.text
	.file	"rc4.c"
	.globl	main                            # -- Begin function main
	.p2align	4, 0x90
	.type	main,@function
main:                                   # @main
.Lfunc_begin0:
	.file	0 "/home/zzzccc/cxzz/Kotoamatsukami/scripts" "../tests/rc4.c" md5 0x8ebb5389ccd87b42f602a50ec8bc218d
	.loc	0 5 0                           # ../tests/rc4.c:5:0
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$1440, %rsp                     # imm = 0x5A0
.Ltmp0:                                 # Block address taken
# %bb.1:
	movq	%rsp, %rax
	addq	$-16, %rax
	movq	%rax, -1336(%rbp)               # 8-byte Spill
	movq	%rax, %rsp
	movq	%rsp, %rax
	addq	$-16, %rax
	movq	%rax, -1328(%rbp)               # 8-byte Spill
	movq	%rax, %rsp
.Ltmp1:                                 # Block address taken
# %bb.2:
	movq	%rsp, %rax
	addq	$-16, %rax
	movq	%rax, -1352(%rbp)               # 8-byte Spill
	movq	%rax, %rsp
	movq	%rsp, %rax
	addq	$-16, %rax
	movq	%rax, -1344(%rbp)               # 8-byte Spill
	movq	%rax, %rsp
	movl	$0, -4(%rbp)
.Ltmp2:
	.loc	0 6 19 prologue_end             # ../tests/rc4.c:6:19
	leaq	-272(%rbp), %rdi
	xorl	%esi, %esi
	movl	$256, %edx                      # imm = 0x100
	callq	memset@PLT
	.loc	0 7 19                          # ../tests/rc4.c:7:19
	leaq	-528(%rbp), %rdi
	xorl	%esi, %esi
	movl	$256, %edx                      # imm = 0x100
	callq	memset@PLT
	.loc	0 8 19                          # ../tests/rc4.c:8:19
	movb	$0, -529(%rbp)
	.loc	0 9 10                          # ../tests/rc4.c:9:10
	leaq	-800(%rbp), %rdi
	xorl	%esi, %esi
	movl	$256, %edx                      # imm = 0x100
	callq	memset@PLT
	movb	$88, -800(%rbp)
.Ltmp3:                                 # Block address taken
# %bb.3:
	movb	$48, -799(%rbp)
	movb	$110, -798(%rbp)
	movb	$66, -797(%rbp)
	movb	$64, -796(%rbp)
	movb	$68, -795(%rbp)
	.loc	0 10 10                         # ../tests/rc4.c:10:10
	leaq	-1312(%rbp), %rdi
	leaq	.L__const.main.data(%rip), %rsi
	movl	$512, %edx                      # imm = 0x200
	callq	memcpy@PLT
	.loc	0 11 32                         # ../tests/rc4.c:11:32
	leaq	-1312(%rbp), %rdi
	.loc	0 11 25 is_stmt 0               # ../tests/rc4.c:11:25
	callq	strlen@PLT
	movq	-1328(%rbp), %rsi               # 8-byte Reload
	movq	-1352(%rbp), %rdx               # 8-byte Reload
	movq	-1344(%rbp), %rcx               # 8-byte Reload
	movq	%rax, %rdi
	movq	-1336(%rbp), %rax               # 8-byte Reload
	.loc	0 11 19                         # ../tests/rc4.c:11:19
	movq	%rdi, -1320(%rbp)
.Ltmp4:
	#DEBUG_VALUE: main:i <- [DW_OP_constu 1336, DW_OP_minus, DW_OP_deref] [$rbp+0]
	.loc	0 12 9 is_stmt 1                # ../tests/rc4.c:12:9
	movl	$0, (%rax)
.Ltmp5:
	#DEBUG_VALUE: main:j <- [DW_OP_constu 1328, DW_OP_minus, DW_OP_deref] [$rbp+0]
	.loc	0 12 16 is_stmt 0               # ../tests/rc4.c:12:16
	movl	$0, (%rsi)
.Ltmp6:
	#DEBUG_VALUE: main:t <- [DW_OP_constu 1352, DW_OP_minus, DW_OP_deref] [$rbp+0]
	.loc	0 12 23                         # ../tests/rc4.c:12:23
	movl	$0, (%rdx)
.Ltmp7:
	#DEBUG_VALUE: main:k_len <- [DW_OP_constu 1344, DW_OP_minus, DW_OP_deref] [$rbp+0]
	.loc	0 13 19 is_stmt 1               # ../tests/rc4.c:13:19
	movq	$0, (%rcx)
.Ltmp8:
	.loc	0 16 12                         # ../tests/rc4.c:16:12
	movl	$0, (%rax)
.Ltmp9:
.Ltmp10:                                # Block address taken
.LBB0_4:                                # =>This Inner Loop Header: Depth=1
	#DEBUG_VALUE: main:k_len <- [DW_OP_constu 1344, DW_OP_minus, DW_OP_deref] [$rbp+0]
	#DEBUG_VALUE: main:t <- [DW_OP_constu 1352, DW_OP_minus, DW_OP_deref] [$rbp+0]
	#DEBUG_VALUE: main:j <- [DW_OP_constu 1328, DW_OP_minus, DW_OP_deref] [$rbp+0]
	#DEBUG_VALUE: main:i <- [DW_OP_constu 1336, DW_OP_minus, DW_OP_deref] [$rbp+0]
	.loc	0 0 12 is_stmt 0                # ../tests/rc4.c:0:12
	movq	-1336(%rbp), %rax               # 8-byte Reload
.Ltmp11:
	.loc	0 16 17                         # ../tests/rc4.c:16:17
	movl	(%rax), %eax
	movl	%eax, -1356(%rbp)               # 4-byte Spill
.Ltmp12:
.Ltmp13:                                # Block address taken
# %bb.5:                                #   in Loop: Header=BB0_4 Depth=1
	#DEBUG_VALUE: main:k_len <- [DW_OP_constu 1344, DW_OP_minus, DW_OP_deref] [$rbp+0]
	#DEBUG_VALUE: main:t <- [DW_OP_constu 1352, DW_OP_minus, DW_OP_deref] [$rbp+0]
	#DEBUG_VALUE: main:j <- [DW_OP_constu 1328, DW_OP_minus, DW_OP_deref] [$rbp+0]
	#DEBUG_VALUE: main:i <- [DW_OP_constu 1336, DW_OP_minus, DW_OP_deref] [$rbp+0]
	.loc	0 0 17                          # ../tests/rc4.c:0:17
	movl	-1356(%rbp), %eax               # 4-byte Reload
	.loc	0 16 19                         # ../tests/rc4.c:16:19
	cmpl	$256, %eax                      # imm = 0x100
	setl	%al
	movb	%al, -1357(%rbp)                # 1-byte Spill
.Ltmp14:
.Ltmp15:                                # Block address taken
# %bb.6:                                #   in Loop: Header=BB0_4 Depth=1
	#DEBUG_VALUE: main:k_len <- [DW_OP_constu 1344, DW_OP_minus, DW_OP_deref] [$rbp+0]
	#DEBUG_VALUE: main:t <- [DW_OP_constu 1352, DW_OP_minus, DW_OP_deref] [$rbp+0]
	#DEBUG_VALUE: main:j <- [DW_OP_constu 1328, DW_OP_minus, DW_OP_deref] [$rbp+0]
	#DEBUG_VALUE: main:i <- [DW_OP_constu 1336, DW_OP_minus, DW_OP_deref] [$rbp+0]
	.loc	0 0 19                          # ../tests/rc4.c:0:19
	movb	-1357(%rbp), %al                # 1-byte Reload
	.loc	0 16 5                          # ../tests/rc4.c:16:5
	movb	%al, %cl
	#APP
	pushq	%rax
	pushq	%rbx
	pushq	%rcx
	pushq	%rdx
	movabsq	$21475229708, %rax              # imm = 0x50006000C
	xorq	%rbx, %rbx
	movb	%cl, %bl
	callq	IndirectConditionalJumpFunc

	#NO_APP
	testb	$1, %al
	jne	.LBB0_7
	jmp	.LBB0_13
.Ltmp16:
.Ltmp17:                                # Block address taken
.LBB0_7:                                #   in Loop: Header=BB0_4 Depth=1
	#DEBUG_VALUE: main:k_len <- [DW_OP_constu 1344, DW_OP_minus, DW_OP_deref] [$rbp+0]
	#DEBUG_VALUE: main:t <- [DW_OP_constu 1352, DW_OP_minus, DW_OP_deref] [$rbp+0]
	#DEBUG_VALUE: main:j <- [DW_OP_constu 1328, DW_OP_minus, DW_OP_deref] [$rbp+0]
	#DEBUG_VALUE: main:i <- [DW_OP_constu 1336, DW_OP_minus, DW_OP_deref] [$rbp+0]
	.loc	0 0 5                           # ../tests/rc4.c:0:5
	movq	-1336(%rbp), %rax               # 8-byte Reload
.Ltmp18:
	.loc	0 17 16 is_stmt 1               # ../tests/rc4.c:17:16
	#APP
	popq	%rax
	popq	%rdx
	popq	%rcx
	popq	%rbx
	popq	%rax

	#NO_APP
	movl	(%rax), %ecx
	movb	%cl, %dl
	.loc	0 17 9 is_stmt 0                # ../tests/rc4.c:17:9
	movslq	(%rax), %rcx
	.loc	0 17 14                         # ../tests/rc4.c:17:14
	movb	%dl, -272(%rbp,%rcx)
	.loc	0 18 20 is_stmt 1               # ../tests/rc4.c:18:20
	movl	(%rax), %eax
	movl	%eax, -1364(%rbp)               # 4-byte Spill
.Ltmp19:
.Ltmp20:                                # Block address taken
# %bb.8:                                #   in Loop: Header=BB0_4 Depth=1
	#DEBUG_VALUE: main:k_len <- [DW_OP_constu 1344, DW_OP_minus, DW_OP_deref] [$rbp+0]
	#DEBUG_VALUE: main:t <- [DW_OP_constu 1352, DW_OP_minus, DW_OP_deref] [$rbp+0]
	#DEBUG_VALUE: main:j <- [DW_OP_constu 1328, DW_OP_minus, DW_OP_deref] [$rbp+0]
	#DEBUG_VALUE: main:i <- [DW_OP_constu 1336, DW_OP_minus, DW_OP_deref] [$rbp+0]
	.loc	0 0 20 is_stmt 0                # ../tests/rc4.c:0:20
	movl	-1364(%rbp), %eax               # 4-byte Reload
	.loc	0 18 20                         # ../tests/rc4.c:18:20
	cltq
	movq	%rax, -1384(%rbp)               # 8-byte Spill
	.loc	0 18 31                         # ../tests/rc4.c:18:31
	leaq	-800(%rbp), %rdi
	.loc	0 18 24                         # ../tests/rc4.c:18:24
	callq	strlen@PLT
	movq	%rax, -1376(%rbp)               # 8-byte Spill
.Ltmp21:
.Ltmp22:                                # Block address taken
# %bb.9:                                #   in Loop: Header=BB0_4 Depth=1
	#DEBUG_VALUE: main:k_len <- [DW_OP_constu 1344, DW_OP_minus, DW_OP_deref] [$rbp+0]
	#DEBUG_VALUE: main:t <- [DW_OP_constu 1352, DW_OP_minus, DW_OP_deref] [$rbp+0]
	#DEBUG_VALUE: main:j <- [DW_OP_constu 1328, DW_OP_minus, DW_OP_deref] [$rbp+0]
	#DEBUG_VALUE: main:i <- [DW_OP_constu 1336, DW_OP_minus, DW_OP_deref] [$rbp+0]
	.loc	0 0 24                          # ../tests/rc4.c:0:24
	movq	-1376(%rbp), %rcx               # 8-byte Reload
	movq	-1384(%rbp), %rax               # 8-byte Reload
	.loc	0 18 22                         # ../tests/rc4.c:18:22
	xorl	%edx, %edx
                                        # kill: def $rdx killed $edx
	divq	%rcx
	movq	-1336(%rbp), %rax               # 8-byte Reload
	.loc	0 18 16                         # ../tests/rc4.c:18:16
	movb	-800(%rbp,%rdx), %cl
	.loc	0 18 9                          # ../tests/rc4.c:18:9
	movslq	(%rax), %rax
	.loc	0 18 14                         # ../tests/rc4.c:18:14
	movb	%cl, -528(%rbp,%rax)
.Ltmp23:
.Ltmp24:                                # Block address taken
# %bb.10:                               #   in Loop: Header=BB0_4 Depth=1
	#DEBUG_VALUE: main:k_len <- [DW_OP_constu 1344, DW_OP_minus, DW_OP_deref] [$rbp+0]
	#DEBUG_VALUE: main:t <- [DW_OP_constu 1352, DW_OP_minus, DW_OP_deref] [$rbp+0]
	#DEBUG_VALUE: main:j <- [DW_OP_constu 1328, DW_OP_minus, DW_OP_deref] [$rbp+0]
	#DEBUG_VALUE: main:i <- [DW_OP_constu 1336, DW_OP_minus, DW_OP_deref] [$rbp+0]
	.loc	0 16 27 is_stmt 1               # ../tests/rc4.c:16:27
	jmp	.LBB0_11
.Ltmp25:
.Ltmp26:                                # Block address taken
.LBB0_11:                               #   in Loop: Header=BB0_4 Depth=1
	#DEBUG_VALUE: main:k_len <- [DW_OP_constu 1344, DW_OP_minus, DW_OP_deref] [$rbp+0]
	#DEBUG_VALUE: main:t <- [DW_OP_constu 1352, DW_OP_minus, DW_OP_deref] [$rbp+0]
	#DEBUG_VALUE: main:j <- [DW_OP_constu 1328, DW_OP_minus, DW_OP_deref] [$rbp+0]
	#DEBUG_VALUE: main:i <- [DW_OP_constu 1336, DW_OP_minus, DW_OP_deref] [$rbp+0]
	.loc	0 0 27 is_stmt 0                # ../tests/rc4.c:0:27
	movq	-1336(%rbp), %rax               # 8-byte Reload
	.loc	0 16 27                         # ../tests/rc4.c:16:27
	movl	(%rax), %eax
	movl	%eax, -1388(%rbp)               # 4-byte Spill
.Ltmp27:
.Ltmp28:                                # Block address taken
# %bb.12:                               #   in Loop: Header=BB0_4 Depth=1
	#DEBUG_VALUE: main:k_len <- [DW_OP_constu 1344, DW_OP_minus, DW_OP_deref] [$rbp+0]
	#DEBUG_VALUE: main:t <- [DW_OP_constu 1352, DW_OP_minus, DW_OP_deref] [$rbp+0]
	#DEBUG_VALUE: main:j <- [DW_OP_constu 1328, DW_OP_minus, DW_OP_deref] [$rbp+0]
	#DEBUG_VALUE: main:i <- [DW_OP_constu 1336, DW_OP_minus, DW_OP_deref] [$rbp+0]
	.loc	0 0 27                          # ../tests/rc4.c:0:27
	movq	-1336(%rbp), %rax               # 8-byte Reload
	movl	-1388(%rbp), %ecx               # 4-byte Reload
	.loc	0 16 27                         # ../tests/rc4.c:16:27
	addl	$1, %ecx
	movl	%ecx, (%rax)
	.loc	0 16 5                          # ../tests/rc4.c:16:5
	jmp	.LBB0_4
.Ltmp29:
.Ltmp30:                                # Block address taken
.LBB0_13:
	#DEBUG_VALUE: main:k_len <- [DW_OP_constu 1344, DW_OP_minus, DW_OP_deref] [$rbp+0]
	#DEBUG_VALUE: main:t <- [DW_OP_constu 1352, DW_OP_minus, DW_OP_deref] [$rbp+0]
	#DEBUG_VALUE: main:j <- [DW_OP_constu 1328, DW_OP_minus, DW_OP_deref] [$rbp+0]
	#DEBUG_VALUE: main:i <- [DW_OP_constu 1336, DW_OP_minus, DW_OP_deref] [$rbp+0]
	.loc	0 0 5                           # ../tests/rc4.c:0:5
	movq	-1336(%rbp), %rax               # 8-byte Reload
.Ltmp31:
	.loc	0 20 12 is_stmt 1               # ../tests/rc4.c:20:12
	#APP
	popq	%rax
	popq	%rdx
	popq	%rcx
	popq	%rbx
	popq	%rax

	#NO_APP
	movl	$0, (%rax)
.Ltmp32:
.Ltmp33:                                # Block address taken
# %bb.14:
	#DEBUG_VALUE: main:k_len <- [DW_OP_constu 1344, DW_OP_minus, DW_OP_deref] [$rbp+0]
	#DEBUG_VALUE: main:t <- [DW_OP_constu 1352, DW_OP_minus, DW_OP_deref] [$rbp+0]
	#DEBUG_VALUE: main:j <- [DW_OP_constu 1328, DW_OP_minus, DW_OP_deref] [$rbp+0]
	#DEBUG_VALUE: main:i <- [DW_OP_constu 1336, DW_OP_minus, DW_OP_deref] [$rbp+0]
	.loc	0 0 12 is_stmt 0                # ../tests/rc4.c:0:12
	movq	-1328(%rbp), %rax               # 8-byte Reload
	.loc	0 20 19                         # ../tests/rc4.c:20:19
	movl	$0, (%rax)
.Ltmp34:
.Ltmp35:                                # Block address taken
# %bb.15:
	#DEBUG_VALUE: main:k_len <- [DW_OP_constu 1344, DW_OP_minus, DW_OP_deref] [$rbp+0]
	#DEBUG_VALUE: main:t <- [DW_OP_constu 1352, DW_OP_minus, DW_OP_deref] [$rbp+0]
	#DEBUG_VALUE: main:j <- [DW_OP_constu 1328, DW_OP_minus, DW_OP_deref] [$rbp+0]
	#DEBUG_VALUE: main:i <- [DW_OP_constu 1336, DW_OP_minus, DW_OP_deref] [$rbp+0]
	.loc	0 20 10                         # ../tests/rc4.c:20:10
	jmp	.LBB0_16
.Ltmp36:
.Ltmp37:                                # Block address taken
.LBB0_16:                               # =>This Inner Loop Header: Depth=1
	#DEBUG_VALUE: main:k_len <- [DW_OP_constu 1344, DW_OP_minus, DW_OP_deref] [$rbp+0]
	#DEBUG_VALUE: main:t <- [DW_OP_constu 1352, DW_OP_minus, DW_OP_deref] [$rbp+0]
	#DEBUG_VALUE: main:j <- [DW_OP_constu 1328, DW_OP_minus, DW_OP_deref] [$rbp+0]
	#DEBUG_VALUE: main:i <- [DW_OP_constu 1336, DW_OP_minus, DW_OP_deref] [$rbp+0]
	.loc	0 0 10                          # ../tests/rc4.c:0:10
	movq	-1336(%rbp), %rax               # 8-byte Reload
.Ltmp38:
	.loc	0 20 24                         # ../tests/rc4.c:20:24
	movl	(%rax), %eax
	movl	%eax, -1392(%rbp)               # 4-byte Spill
.Ltmp39:
.Ltmp40:                                # Block address taken
# %bb.17:                               #   in Loop: Header=BB0_16 Depth=1
	#DEBUG_VALUE: main:k_len <- [DW_OP_constu 1344, DW_OP_minus, DW_OP_deref] [$rbp+0]
	#DEBUG_VALUE: main:t <- [DW_OP_constu 1352, DW_OP_minus, DW_OP_deref] [$rbp+0]
	#DEBUG_VALUE: main:j <- [DW_OP_constu 1328, DW_OP_minus, DW_OP_deref] [$rbp+0]
	#DEBUG_VALUE: main:i <- [DW_OP_constu 1336, DW_OP_minus, DW_OP_deref] [$rbp+0]
	.loc	0 0 24                          # ../tests/rc4.c:0:24
	movl	-1392(%rbp), %eax               # 4-byte Reload
	.loc	0 20 26                         # ../tests/rc4.c:20:26
	cmpl	$256, %eax                      # imm = 0x100
	setl	%al
	movb	%al, -1393(%rbp)                # 1-byte Spill
.Ltmp41:
.Ltmp42:                                # Block address taken
# %bb.18:                               #   in Loop: Header=BB0_16 Depth=1
	#DEBUG_VALUE: main:k_len <- [DW_OP_constu 1344, DW_OP_minus, DW_OP_deref] [$rbp+0]
	#DEBUG_VALUE: main:t <- [DW_OP_constu 1352, DW_OP_minus, DW_OP_deref] [$rbp+0]
	#DEBUG_VALUE: main:j <- [DW_OP_constu 1328, DW_OP_minus, DW_OP_deref] [$rbp+0]
	#DEBUG_VALUE: main:i <- [DW_OP_constu 1336, DW_OP_minus, DW_OP_deref] [$rbp+0]
	.loc	0 0 26                          # ../tests/rc4.c:0:26
	movb	-1393(%rbp), %al                # 1-byte Reload
	.loc	0 20 5                          # ../tests/rc4.c:20:5
	movb	%al, %cl
	#APP
	pushq	%rax
	pushq	%rbx
	pushq	%rcx
	pushq	%rdx
	movabsq	$73015623704, %rax              # imm = 0x1100120018
	xorq	%rbx, %rbx
	movb	%cl, %bl
	callq	IndirectConditionalJumpFunc

	#NO_APP
	testb	$1, %al
	jne	.LBB0_19
	jmp	.LBB0_25
.Ltmp43:
.Ltmp44:                                # Block address taken
.LBB0_19:                               #   in Loop: Header=BB0_16 Depth=1
	#DEBUG_VALUE: main:k_len <- [DW_OP_constu 1344, DW_OP_minus, DW_OP_deref] [$rbp+0]
	#DEBUG_VALUE: main:t <- [DW_OP_constu 1352, DW_OP_minus, DW_OP_deref] [$rbp+0]
	#DEBUG_VALUE: main:j <- [DW_OP_constu 1328, DW_OP_minus, DW_OP_deref] [$rbp+0]
	#DEBUG_VALUE: main:i <- [DW_OP_constu 1336, DW_OP_minus, DW_OP_deref] [$rbp+0]
	.loc	0 0 5                           # ../tests/rc4.c:0:5
	movq	-1336(%rbp), %rdx               # 8-byte Reload
	movq	-1328(%rbp), %rcx               # 8-byte Reload
.Ltmp45:
	.loc	0 21 14 is_stmt 1               # ../tests/rc4.c:21:14
	#APP
	popq	%rax
	popq	%rdx
	popq	%rcx
	popq	%rbx
	popq	%rax

	#NO_APP
	movl	(%rcx), %eax
	.loc	0 21 18 is_stmt 0               # ../tests/rc4.c:21:18
	movslq	(%rdx), %rsi
	movzbl	-272(%rbp,%rsi), %esi
	.loc	0 21 16                         # ../tests/rc4.c:21:16
	addl	%esi, %eax
	.loc	0 21 25                         # ../tests/rc4.c:21:25
	movslq	(%rdx), %rdx
	movzbl	-528(%rbp,%rdx), %edx
	.loc	0 21 23                         # ../tests/rc4.c:21:23
	addl	%edx, %eax
	.loc	0 21 31                         # ../tests/rc4.c:21:31
	movl	$256, %esi                      # imm = 0x100
	cltd
	idivl	%esi
	movq	-1336(%rbp), %rax               # 8-byte Reload
	.loc	0 21 11                         # ../tests/rc4.c:21:11
	movl	%edx, (%rcx)
	.loc	0 22 16 is_stmt 1               # ../tests/rc4.c:22:16
	movslq	(%rax), %rax
	movb	-272(%rbp,%rax), %al
	movb	%al, -1394(%rbp)                # 1-byte Spill
.Ltmp46:
.Ltmp47:                                # Block address taken
# %bb.20:                               #   in Loop: Header=BB0_16 Depth=1
	#DEBUG_VALUE: main:k_len <- [DW_OP_constu 1344, DW_OP_minus, DW_OP_deref] [$rbp+0]
	#DEBUG_VALUE: main:t <- [DW_OP_constu 1352, DW_OP_minus, DW_OP_deref] [$rbp+0]
	#DEBUG_VALUE: main:j <- [DW_OP_constu 1328, DW_OP_minus, DW_OP_deref] [$rbp+0]
	#DEBUG_VALUE: main:i <- [DW_OP_constu 1336, DW_OP_minus, DW_OP_deref] [$rbp+0]
	.loc	0 0 16 is_stmt 0                # ../tests/rc4.c:0:16
	movq	-1336(%rbp), %rax               # 8-byte Reload
	movq	-1328(%rbp), %rcx               # 8-byte Reload
	movb	-1394(%rbp), %dl                # 1-byte Reload
	.loc	0 22 14                         # ../tests/rc4.c:22:14
	movb	%dl, -529(%rbp)
	.loc	0 23 16 is_stmt 1               # ../tests/rc4.c:23:16
	movslq	(%rcx), %rcx
	movb	-272(%rbp,%rcx), %cl
	.loc	0 23 9 is_stmt 0                # ../tests/rc4.c:23:9
	movslq	(%rax), %rax
	.loc	0 23 14                         # ../tests/rc4.c:23:14
	movb	%cl, -272(%rbp,%rax)
	.loc	0 24 16 is_stmt 1               # ../tests/rc4.c:24:16
	movb	-529(%rbp), %al
	movb	%al, -1395(%rbp)                # 1-byte Spill
.Ltmp48:
.Ltmp49:                                # Block address taken
# %bb.21:                               #   in Loop: Header=BB0_16 Depth=1
	#DEBUG_VALUE: main:k_len <- [DW_OP_constu 1344, DW_OP_minus, DW_OP_deref] [$rbp+0]
	#DEBUG_VALUE: main:t <- [DW_OP_constu 1352, DW_OP_minus, DW_OP_deref] [$rbp+0]
	#DEBUG_VALUE: main:j <- [DW_OP_constu 1328, DW_OP_minus, DW_OP_deref] [$rbp+0]
	#DEBUG_VALUE: main:i <- [DW_OP_constu 1336, DW_OP_minus, DW_OP_deref] [$rbp+0]
	.loc	0 0 16 is_stmt 0                # ../tests/rc4.c:0:16
	movb	-1395(%rbp), %cl                # 1-byte Reload
	movq	-1328(%rbp), %rax               # 8-byte Reload
	.loc	0 24 9                          # ../tests/rc4.c:24:9
	movslq	(%rax), %rax
	.loc	0 24 14                         # ../tests/rc4.c:24:14
	movb	%cl, -272(%rbp,%rax)
.Ltmp50:
.Ltmp51:                                # Block address taken
# %bb.22:                               #   in Loop: Header=BB0_16 Depth=1
	#DEBUG_VALUE: main:k_len <- [DW_OP_constu 1344, DW_OP_minus, DW_OP_deref] [$rbp+0]
	#DEBUG_VALUE: main:t <- [DW_OP_constu 1352, DW_OP_minus, DW_OP_deref] [$rbp+0]
	#DEBUG_VALUE: main:j <- [DW_OP_constu 1328, DW_OP_minus, DW_OP_deref] [$rbp+0]
	#DEBUG_VALUE: main:i <- [DW_OP_constu 1336, DW_OP_minus, DW_OP_deref] [$rbp+0]
	.loc	0 20 34 is_stmt 1               # ../tests/rc4.c:20:34
	jmp	.LBB0_23
.Ltmp52:
.Ltmp53:                                # Block address taken
.LBB0_23:                               #   in Loop: Header=BB0_16 Depth=1
	#DEBUG_VALUE: main:k_len <- [DW_OP_constu 1344, DW_OP_minus, DW_OP_deref] [$rbp+0]
	#DEBUG_VALUE: main:t <- [DW_OP_constu 1352, DW_OP_minus, DW_OP_deref] [$rbp+0]
	#DEBUG_VALUE: main:j <- [DW_OP_constu 1328, DW_OP_minus, DW_OP_deref] [$rbp+0]
	#DEBUG_VALUE: main:i <- [DW_OP_constu 1336, DW_OP_minus, DW_OP_deref] [$rbp+0]
	.loc	0 0 34 is_stmt 0                # ../tests/rc4.c:0:34
	movq	-1336(%rbp), %rax               # 8-byte Reload
	.loc	0 20 34                         # ../tests/rc4.c:20:34
	movl	(%rax), %eax
	addl	$1, %eax
	movl	%eax, -1400(%rbp)               # 4-byte Spill
.Ltmp54:
.Ltmp55:                                # Block address taken
# %bb.24:                               #   in Loop: Header=BB0_16 Depth=1
	#DEBUG_VALUE: main:k_len <- [DW_OP_constu 1344, DW_OP_minus, DW_OP_deref] [$rbp+0]
	#DEBUG_VALUE: main:t <- [DW_OP_constu 1352, DW_OP_minus, DW_OP_deref] [$rbp+0]
	#DEBUG_VALUE: main:j <- [DW_OP_constu 1328, DW_OP_minus, DW_OP_deref] [$rbp+0]
	#DEBUG_VALUE: main:i <- [DW_OP_constu 1336, DW_OP_minus, DW_OP_deref] [$rbp+0]
	.loc	0 0 34                          # ../tests/rc4.c:0:34
	movq	-1336(%rbp), %rax               # 8-byte Reload
	movl	-1400(%rbp), %ecx               # 4-byte Reload
	.loc	0 20 34                         # ../tests/rc4.c:20:34
	movl	%ecx, (%rax)
	.loc	0 20 5                          # ../tests/rc4.c:20:5
	jmp	.LBB0_16
.Ltmp56:
.Ltmp57:                                # Block address taken
.LBB0_25:
	#DEBUG_VALUE: main:k_len <- [DW_OP_constu 1344, DW_OP_minus, DW_OP_deref] [$rbp+0]
	#DEBUG_VALUE: main:t <- [DW_OP_constu 1352, DW_OP_minus, DW_OP_deref] [$rbp+0]
	#DEBUG_VALUE: main:j <- [DW_OP_constu 1328, DW_OP_minus, DW_OP_deref] [$rbp+0]
	#DEBUG_VALUE: main:i <- [DW_OP_constu 1336, DW_OP_minus, DW_OP_deref] [$rbp+0]
	.loc	0 28 16 is_stmt 1               # ../tests/rc4.c:28:16
	#APP
	popq	%rax
	popq	%rdx
	popq	%rcx
	popq	%rbx
	popq	%rax

	#NO_APP
.Ltmp58:
.Ltmp59:                                # Block address taken
# %bb.26:
	#DEBUG_VALUE: main:k_len <- [DW_OP_constu 1344, DW_OP_minus, DW_OP_deref] [$rbp+0]
	#DEBUG_VALUE: main:t <- [DW_OP_constu 1352, DW_OP_minus, DW_OP_deref] [$rbp+0]
	#DEBUG_VALUE: main:j <- [DW_OP_constu 1328, DW_OP_minus, DW_OP_deref] [$rbp+0]
	#DEBUG_VALUE: main:i <- [DW_OP_constu 1336, DW_OP_minus, DW_OP_deref] [$rbp+0]
	.loc	0 0 16 is_stmt 0                # ../tests/rc4.c:0:16
	movq	-1336(%rbp), %rax               # 8-byte Reload
	movq	-1344(%rbp), %rcx               # 8-byte Reload
	.loc	0 28 16                         # ../tests/rc4.c:28:16
	movq	$0, (%rcx)
	.loc	0 28 23                         # ../tests/rc4.c:28:23
	movl	$0, (%rax)
.Ltmp60:
.Ltmp61:                                # Block address taken
# %bb.27:
	#DEBUG_VALUE: main:k_len <- [DW_OP_constu 1344, DW_OP_minus, DW_OP_deref] [$rbp+0]
	#DEBUG_VALUE: main:t <- [DW_OP_constu 1352, DW_OP_minus, DW_OP_deref] [$rbp+0]
	#DEBUG_VALUE: main:j <- [DW_OP_constu 1328, DW_OP_minus, DW_OP_deref] [$rbp+0]
	#DEBUG_VALUE: main:i <- [DW_OP_constu 1336, DW_OP_minus, DW_OP_deref] [$rbp+0]
	.loc	0 0 23                          # ../tests/rc4.c:0:23
	movq	-1328(%rbp), %rax               # 8-byte Reload
	.loc	0 28 30                         # ../tests/rc4.c:28:30
	movl	$0, (%rax)
.Ltmp62:
.Ltmp63:                                # Block address taken
.LBB0_28:                               # =>This Inner Loop Header: Depth=1
	#DEBUG_VALUE: main:k_len <- [DW_OP_constu 1344, DW_OP_minus, DW_OP_deref] [$rbp+0]
	#DEBUG_VALUE: main:t <- [DW_OP_constu 1352, DW_OP_minus, DW_OP_deref] [$rbp+0]
	#DEBUG_VALUE: main:j <- [DW_OP_constu 1328, DW_OP_minus, DW_OP_deref] [$rbp+0]
	#DEBUG_VALUE: main:i <- [DW_OP_constu 1336, DW_OP_minus, DW_OP_deref] [$rbp+0]
	.loc	0 28 35                         # ../tests/rc4.c:28:35
	jmp	.LBB0_29
.Ltmp64:
.Ltmp65:                                # Block address taken
.LBB0_29:                               #   in Loop: Header=BB0_28 Depth=1
	#DEBUG_VALUE: main:k_len <- [DW_OP_constu 1344, DW_OP_minus, DW_OP_deref] [$rbp+0]
	#DEBUG_VALUE: main:t <- [DW_OP_constu 1352, DW_OP_minus, DW_OP_deref] [$rbp+0]
	#DEBUG_VALUE: main:j <- [DW_OP_constu 1328, DW_OP_minus, DW_OP_deref] [$rbp+0]
	#DEBUG_VALUE: main:i <- [DW_OP_constu 1336, DW_OP_minus, DW_OP_deref] [$rbp+0]
	.loc	0 0 35                          # ../tests/rc4.c:0:35
	movq	-1344(%rbp), %rax               # 8-byte Reload
	.loc	0 28 35                         # ../tests/rc4.c:28:35
	movq	(%rax), %rax
	.loc	0 28 41                         # ../tests/rc4.c:28:41
	cmpq	-1320(%rbp), %rax
	setb	%al
	movb	%al, -1401(%rbp)                # 1-byte Spill
.Ltmp66:
.Ltmp67:                                # Block address taken
# %bb.30:                               #   in Loop: Header=BB0_28 Depth=1
	#DEBUG_VALUE: main:k_len <- [DW_OP_constu 1344, DW_OP_minus, DW_OP_deref] [$rbp+0]
	#DEBUG_VALUE: main:t <- [DW_OP_constu 1352, DW_OP_minus, DW_OP_deref] [$rbp+0]
	#DEBUG_VALUE: main:j <- [DW_OP_constu 1328, DW_OP_minus, DW_OP_deref] [$rbp+0]
	#DEBUG_VALUE: main:i <- [DW_OP_constu 1336, DW_OP_minus, DW_OP_deref] [$rbp+0]
	.loc	0 0 41                          # ../tests/rc4.c:0:41
	movb	-1401(%rbp), %al                # 1-byte Reload
	.loc	0 28 5                          # ../tests/rc4.c:28:5
	movb	%al, %cl
	#APP
	pushq	%rax
	pushq	%rbx
	pushq	%rcx
	pushq	%rdx
	movabsq	$124556017700, %rax             # imm = 0x1D001E0024
	xorq	%rbx, %rbx
	movb	%cl, %bl
	callq	IndirectConditionalJumpFunc

	#NO_APP
	testb	$1, %al
	jne	.LBB0_31
	jmp	.LBB0_37
.Ltmp68:
.Ltmp69:                                # Block address taken
.LBB0_31:                               #   in Loop: Header=BB0_28 Depth=1
	#DEBUG_VALUE: main:k_len <- [DW_OP_constu 1344, DW_OP_minus, DW_OP_deref] [$rbp+0]
	#DEBUG_VALUE: main:t <- [DW_OP_constu 1352, DW_OP_minus, DW_OP_deref] [$rbp+0]
	#DEBUG_VALUE: main:j <- [DW_OP_constu 1328, DW_OP_minus, DW_OP_deref] [$rbp+0]
	#DEBUG_VALUE: main:i <- [DW_OP_constu 1336, DW_OP_minus, DW_OP_deref] [$rbp+0]
	.loc	0 0 5                           # ../tests/rc4.c:0:5
	movq	-1336(%rbp), %rax               # 8-byte Reload
	movq	-1328(%rbp), %rcx               # 8-byte Reload
.Ltmp70:
	.loc	0 29 14 is_stmt 1               # ../tests/rc4.c:29:14
	#APP
	popq	%rax
	popq	%rdx
	popq	%rcx
	popq	%rbx
	popq	%rax

	#NO_APP
	movl	(%rax), %eax
	.loc	0 29 16 is_stmt 0               # ../tests/rc4.c:29:16
	addl	$1, %eax
	.loc	0 29 21                         # ../tests/rc4.c:29:21
	movl	$256, %esi                      # imm = 0x100
	cltd
	idivl	%esi
	movl	%edx, %eax
	movq	-1336(%rbp), %rdx               # 8-byte Reload
	.loc	0 29 11                         # ../tests/rc4.c:29:11
	movl	%eax, (%rdx)
	.loc	0 30 14 is_stmt 1               # ../tests/rc4.c:30:14
	movl	(%rcx), %eax
	.loc	0 30 18 is_stmt 0               # ../tests/rc4.c:30:18
	movslq	(%rdx), %rdx
	movzbl	-272(%rbp,%rdx), %edx
	.loc	0 30 16                         # ../tests/rc4.c:30:16
	addl	%edx, %eax
	.loc	0 30 24                         # ../tests/rc4.c:30:24
	movl	$256, %esi                      # imm = 0x100
	cltd
	idivl	%esi
	movq	-1336(%rbp), %rax               # 8-byte Reload
	.loc	0 30 11                         # ../tests/rc4.c:30:11
	movl	%edx, (%rcx)
	.loc	0 31 16 is_stmt 1               # ../tests/rc4.c:31:16
	movslq	(%rax), %rdx
	movb	-272(%rbp,%rdx), %dl
	.loc	0 31 14 is_stmt 0               # ../tests/rc4.c:31:14
	movb	%dl, -529(%rbp)
	.loc	0 32 16 is_stmt 1               # ../tests/rc4.c:32:16
	movslq	(%rcx), %rcx
	movb	-272(%rbp,%rcx), %cl
	.loc	0 32 9 is_stmt 0                # ../tests/rc4.c:32:9
	movslq	(%rax), %rax
	.loc	0 32 14                         # ../tests/rc4.c:32:14
	movb	%cl, -272(%rbp,%rax)
	.loc	0 33 16 is_stmt 1               # ../tests/rc4.c:33:16
	movb	-529(%rbp), %al
	movb	%al, -1402(%rbp)                # 1-byte Spill
.Ltmp71:
.Ltmp72:                                # Block address taken
# %bb.32:                               #   in Loop: Header=BB0_28 Depth=1
	#DEBUG_VALUE: main:k_len <- [DW_OP_constu 1344, DW_OP_minus, DW_OP_deref] [$rbp+0]
	#DEBUG_VALUE: main:t <- [DW_OP_constu 1352, DW_OP_minus, DW_OP_deref] [$rbp+0]
	#DEBUG_VALUE: main:j <- [DW_OP_constu 1328, DW_OP_minus, DW_OP_deref] [$rbp+0]
	#DEBUG_VALUE: main:i <- [DW_OP_constu 1336, DW_OP_minus, DW_OP_deref] [$rbp+0]
	.loc	0 0 16 is_stmt 0                # ../tests/rc4.c:0:16
	movq	-1352(%rbp), %rcx               # 8-byte Reload
	movq	-1328(%rbp), %rdx               # 8-byte Reload
	movq	-1336(%rbp), %rax               # 8-byte Reload
	movb	-1402(%rbp), %dil               # 1-byte Reload
	.loc	0 33 9                          # ../tests/rc4.c:33:9
	movslq	(%rdx), %rsi
	.loc	0 33 14                         # ../tests/rc4.c:33:14
	movb	%dil, -272(%rbp,%rsi)
	.loc	0 34 14 is_stmt 1               # ../tests/rc4.c:34:14
	movslq	(%rax), %rax
	movzbl	-272(%rbp,%rax), %eax
	.loc	0 34 21 is_stmt 0               # ../tests/rc4.c:34:21
	movslq	(%rdx), %rdx
	movzbl	-272(%rbp,%rdx), %edx
	.loc	0 34 19                         # ../tests/rc4.c:34:19
	addl	%edx, %eax
	.loc	0 34 27                         # ../tests/rc4.c:34:27
	movl	$256, %esi                      # imm = 0x100
	cltd
	idivl	%esi
	movq	-1344(%rbp), %rax               # 8-byte Reload
	.loc	0 34 11                         # ../tests/rc4.c:34:11
	movl	%edx, (%rcx)
	.loc	0 35 24 is_stmt 1               # ../tests/rc4.c:35:24
	movslq	(%rcx), %rcx
	movzbl	-272(%rbp,%rcx), %ecx
	movl	%ecx, -1420(%rbp)               # 4-byte Spill
	.loc	0 35 14 is_stmt 0               # ../tests/rc4.c:35:14
	movq	(%rax), %rax
	.loc	0 35 9                          # ../tests/rc4.c:35:9
	leaq	-1312(%rbp), %rcx
	addq	%rax, %rcx
	movq	%rcx, -1416(%rbp)               # 8-byte Spill
	.loc	0 35 21                         # ../tests/rc4.c:35:21
	movsbl	-1312(%rbp,%rax), %eax
	movl	%eax, -1408(%rbp)               # 4-byte Spill
.Ltmp73:
.Ltmp74:                                # Block address taken
# %bb.33:                               #   in Loop: Header=BB0_28 Depth=1
	#DEBUG_VALUE: main:k_len <- [DW_OP_constu 1344, DW_OP_minus, DW_OP_deref] [$rbp+0]
	#DEBUG_VALUE: main:t <- [DW_OP_constu 1352, DW_OP_minus, DW_OP_deref] [$rbp+0]
	#DEBUG_VALUE: main:j <- [DW_OP_constu 1328, DW_OP_minus, DW_OP_deref] [$rbp+0]
	#DEBUG_VALUE: main:i <- [DW_OP_constu 1336, DW_OP_minus, DW_OP_deref] [$rbp+0]
	.loc	0 0 21                          # ../tests/rc4.c:0:21
	movq	-1416(%rbp), %rax               # 8-byte Reload
	movl	-1420(%rbp), %edx               # 4-byte Reload
	movl	-1408(%rbp), %ecx               # 4-byte Reload
	.loc	0 35 21                         # ../tests/rc4.c:35:21
	xorl	%edx, %ecx
                                        # kill: def $cl killed $cl killed $ecx
	movb	%cl, (%rax)
.Ltmp75:
.Ltmp76:                                # Block address taken
# %bb.34:                               #   in Loop: Header=BB0_28 Depth=1
	#DEBUG_VALUE: main:k_len <- [DW_OP_constu 1344, DW_OP_minus, DW_OP_deref] [$rbp+0]
	#DEBUG_VALUE: main:t <- [DW_OP_constu 1352, DW_OP_minus, DW_OP_deref] [$rbp+0]
	#DEBUG_VALUE: main:j <- [DW_OP_constu 1328, DW_OP_minus, DW_OP_deref] [$rbp+0]
	#DEBUG_VALUE: main:i <- [DW_OP_constu 1336, DW_OP_minus, DW_OP_deref] [$rbp+0]
	.loc	0 0 21                          # ../tests/rc4.c:0:21
	movq	-1344(%rbp), %rax               # 8-byte Reload
	.loc	0 28 53 is_stmt 1               # ../tests/rc4.c:28:53
	movq	(%rax), %rax
	movq	%rax, -1432(%rbp)               # 8-byte Spill
.Ltmp77:
.Ltmp78:                                # Block address taken
# %bb.35:                               #   in Loop: Header=BB0_28 Depth=1
	#DEBUG_VALUE: main:k_len <- [DW_OP_constu 1344, DW_OP_minus, DW_OP_deref] [$rbp+0]
	#DEBUG_VALUE: main:t <- [DW_OP_constu 1352, DW_OP_minus, DW_OP_deref] [$rbp+0]
	#DEBUG_VALUE: main:j <- [DW_OP_constu 1328, DW_OP_minus, DW_OP_deref] [$rbp+0]
	#DEBUG_VALUE: main:i <- [DW_OP_constu 1336, DW_OP_minus, DW_OP_deref] [$rbp+0]
	.loc	0 0 53 is_stmt 0                # ../tests/rc4.c:0:53
	movq	-1432(%rbp), %rax               # 8-byte Reload
	.loc	0 28 53                         # ../tests/rc4.c:28:53
	addq	$1, %rax
	movq	%rax, -1440(%rbp)               # 8-byte Spill
.Ltmp79:
.Ltmp80:                                # Block address taken
# %bb.36:                               #   in Loop: Header=BB0_28 Depth=1
	#DEBUG_VALUE: main:k_len <- [DW_OP_constu 1344, DW_OP_minus, DW_OP_deref] [$rbp+0]
	#DEBUG_VALUE: main:t <- [DW_OP_constu 1352, DW_OP_minus, DW_OP_deref] [$rbp+0]
	#DEBUG_VALUE: main:j <- [DW_OP_constu 1328, DW_OP_minus, DW_OP_deref] [$rbp+0]
	#DEBUG_VALUE: main:i <- [DW_OP_constu 1336, DW_OP_minus, DW_OP_deref] [$rbp+0]
	.loc	0 0 53                          # ../tests/rc4.c:0:53
	movq	-1344(%rbp), %rax               # 8-byte Reload
	movq	-1440(%rbp), %rcx               # 8-byte Reload
	.loc	0 28 53                         # ../tests/rc4.c:28:53
	movq	%rcx, (%rax)
	.loc	0 28 5                          # ../tests/rc4.c:28:5
	jmp	.LBB0_28
.Ltmp81:
.Ltmp82:                                # Block address taken
.LBB0_37:
	#DEBUG_VALUE: main:k_len <- [DW_OP_constu 1344, DW_OP_minus, DW_OP_deref] [$rbp+0]
	#DEBUG_VALUE: main:t <- [DW_OP_constu 1352, DW_OP_minus, DW_OP_deref] [$rbp+0]
	#DEBUG_VALUE: main:j <- [DW_OP_constu 1328, DW_OP_minus, DW_OP_deref] [$rbp+0]
	#DEBUG_VALUE: main:i <- [DW_OP_constu 1336, DW_OP_minus, DW_OP_deref] [$rbp+0]
	.loc	0 37 5 is_stmt 1                # ../tests/rc4.c:37:5
	#APP
	popq	%rax
	popq	%rdx
	popq	%rcx
	popq	%rbx
	popq	%rax

	#NO_APP
	xorl	%eax, %eax
	movq	%rbp, %rsp
	.loc	0 37 5 epilogue_begin is_stmt 0 # ../tests/rc4.c:37:5
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Ltmp83:
.Lfunc_end0:
	.size	main, .Lfunc_end0-main
	.cfi_endproc
                                        # -- End function
	.globl	IndirectCallFunc                # -- Begin function IndirectCallFunc
	.p2align	4, 0x90
	.type	IndirectCallFunc,@function
IndirectCallFunc:                       # @IndirectCallFunc
.Lfunc_begin1:
	.cfi_startproc
# %bb.0:
	#APP
	movq	%rax, %rax
	#NO_APP
	movq	%rax, %rcx
	shrq	$48, %rcx
	movw	%cx, %dx
	shrq	$16, %rax
	movw	%ax, %cx
	leaq	.LAllFunctions_IndirectBrTargets(%rip), %rax
	movswq	%dx, %rdx
	imulq	$304, %rdx, %rdx                # imm = 0x130
	addq	%rdx, %rax
	movswq	%cx, %rcx
	movq	(%rax,%rcx,8), %rax
	#APP
	pushq	%rax
	#NO_APP
	retq
.Lfunc_end1:
	.size	IndirectCallFunc, .Lfunc_end1-IndirectCallFunc
	.cfi_endproc
                                        # -- End function
	.globl	IndirectConditionalJumpFunc     # -- Begin function IndirectConditionalJumpFunc
	.p2align	4, 0x90
	.type	IndirectConditionalJumpFunc,@function
IndirectConditionalJumpFunc:            # @IndirectConditionalJumpFunc
.Lfunc_begin2:
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
	imulq	$304, %r8, %r8                  # imm = 0x130
	addq	%r8, %rax
	movswq	%cx, %rcx
	movq	(%rax,%rcx,8), %rax
	leaq	.LAllFunctions_IndirectBrTargets(%rip), %rcx
	movswq	%di, %rdi
	imulq	$304, %rdi, %rdi                # imm = 0x130
	addq	%rdi, %rcx
	cmpq	$1, %rsi
	movswq	%dx, %rdx
	cmovneq	(%rcx,%rdx,8), %rax
	#APP
	pushq	%rax
	#NO_APP
	retq
.Lfunc_end2:
	.size	IndirectConditionalJumpFunc, .Lfunc_end2-IndirectConditionalJumpFunc
	.cfi_endproc
                                        # -- End function
	.type	.L__const.main.data,@object     # @__const.main.data
	.section	.rodata,"a",@progbits
	.p2align	4, 0x0
.L__const.main.data:
	.ascii	"\344\025\304\355\246/V\020\273\023\353\255uV\307\273\273\351\271\314\002:P\2376\220i\276|BD\312\306\324$\\\322\271$\301\030\223\263\352"
	.zero	468
	.size	.L__const.main.data, 512

	.type	.LAllFunctions_IndirectBrTargets,@object # @AllFunctions_IndirectBrTargets
	.data
	.p2align	4, 0x0
.LAllFunctions_IndirectBrTargets:
	.quad	.Ltmp0
	.quad	.Ltmp1
	.quad	.Ltmp3
	.quad	.Ltmp10
	.quad	.Ltmp13
	.quad	.Ltmp15
	.quad	.Ltmp17
	.quad	.Ltmp20
	.quad	.Ltmp22
	.quad	.Ltmp24
	.quad	.Ltmp26
	.quad	.Ltmp28
	.quad	.Ltmp30
	.quad	.Ltmp33
	.quad	.Ltmp35
	.quad	.Ltmp37
	.quad	.Ltmp40
	.quad	.Ltmp42
	.quad	.Ltmp44
	.quad	.Ltmp47
	.quad	.Ltmp49
	.quad	.Ltmp51
	.quad	.Ltmp53
	.quad	.Ltmp55
	.quad	.Ltmp57
	.quad	.Ltmp59
	.quad	.Ltmp61
	.quad	.Ltmp63
	.quad	.Ltmp65
	.quad	.Ltmp67
	.quad	.Ltmp69
	.quad	.Ltmp72
	.quad	.Ltmp74
	.quad	.Ltmp76
	.quad	.Ltmp78
	.quad	.Ltmp80
	.quad	.Ltmp82
	.quad	0
	.size	.LAllFunctions_IndirectBrTargets, 304

	.section	.debug_loclists,"",@progbits
	.long	.Ldebug_list_header_end0-.Ldebug_list_header_start0 # Length
.Ldebug_list_header_start0:
	.short	5                               # Version
	.byte	8                               # Address size
	.byte	0                               # Segment selector size
	.long	4                               # Offset entry count
.Lloclists_table_base0:
	.long	.Ldebug_loc0-.Lloclists_table_base0
	.long	.Ldebug_loc1-.Lloclists_table_base0
	.long	.Ldebug_loc2-.Lloclists_table_base0
	.long	.Ldebug_loc3-.Lloclists_table_base0
.Ldebug_loc0:
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp4-.Lfunc_begin0           #   starting offset
	.uleb128 .Lfunc_end0-.Lfunc_begin0      #   ending offset
	.byte	4                               # Loc expr size
	.byte	118                             # DW_OP_breg6
	.byte	200                             # -1336
	.byte	117                             # 
	.byte	6                               # DW_OP_deref
	.byte	0                               # DW_LLE_end_of_list
.Ldebug_loc1:
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp5-.Lfunc_begin0           #   starting offset
	.uleb128 .Lfunc_end0-.Lfunc_begin0      #   ending offset
	.byte	4                               # Loc expr size
	.byte	118                             # DW_OP_breg6
	.byte	208                             # -1328
	.byte	117                             # 
	.byte	6                               # DW_OP_deref
	.byte	0                               # DW_LLE_end_of_list
.Ldebug_loc2:
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp6-.Lfunc_begin0           #   starting offset
	.uleb128 .Lfunc_end0-.Lfunc_begin0      #   ending offset
	.byte	4                               # Loc expr size
	.byte	118                             # DW_OP_breg6
	.byte	184                             # -1352
	.byte	117                             # 
	.byte	6                               # DW_OP_deref
	.byte	0                               # DW_LLE_end_of_list
.Ldebug_loc3:
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp7-.Lfunc_begin0           #   starting offset
	.uleb128 .Lfunc_end0-.Lfunc_begin0      #   ending offset
	.byte	4                               # Loc expr size
	.byte	118                             # DW_OP_breg6
	.byte	192                             # -1344
	.byte	117                             # 
	.byte	6                               # DW_OP_deref
	.byte	0                               # DW_LLE_end_of_list
.Ldebug_list_header_end0:
	.section	.debug_abbrev,"",@progbits
	.byte	1                               # Abbreviation Code
	.byte	17                              # DW_TAG_compile_unit
	.byte	1                               # DW_CHILDREN_yes
	.byte	37                              # DW_AT_producer
	.byte	37                              # DW_FORM_strx1
	.byte	19                              # DW_AT_language
	.byte	5                               # DW_FORM_data2
	.byte	3                               # DW_AT_name
	.byte	37                              # DW_FORM_strx1
	.byte	114                             # DW_AT_str_offsets_base
	.byte	23                              # DW_FORM_sec_offset
	.byte	16                              # DW_AT_stmt_list
	.byte	23                              # DW_FORM_sec_offset
	.byte	27                              # DW_AT_comp_dir
	.byte	37                              # DW_FORM_strx1
	.byte	17                              # DW_AT_low_pc
	.byte	27                              # DW_FORM_addrx
	.byte	18                              # DW_AT_high_pc
	.byte	6                               # DW_FORM_data4
	.byte	115                             # DW_AT_addr_base
	.byte	23                              # DW_FORM_sec_offset
	.ascii	"\214\001"                      # DW_AT_loclists_base
	.byte	23                              # DW_FORM_sec_offset
	.byte	0                               # EOM(1)
	.byte	0                               # EOM(2)
	.byte	2                               # Abbreviation Code
	.byte	46                              # DW_TAG_subprogram
	.byte	1                               # DW_CHILDREN_yes
	.byte	17                              # DW_AT_low_pc
	.byte	27                              # DW_FORM_addrx
	.byte	18                              # DW_AT_high_pc
	.byte	6                               # DW_FORM_data4
	.byte	64                              # DW_AT_frame_base
	.byte	24                              # DW_FORM_exprloc
	.byte	3                               # DW_AT_name
	.byte	37                              # DW_FORM_strx1
	.byte	58                              # DW_AT_decl_file
	.byte	11                              # DW_FORM_data1
	.byte	59                              # DW_AT_decl_line
	.byte	11                              # DW_FORM_data1
	.byte	73                              # DW_AT_type
	.byte	19                              # DW_FORM_ref4
	.byte	63                              # DW_AT_external
	.byte	25                              # DW_FORM_flag_present
	.byte	0                               # EOM(1)
	.byte	0                               # EOM(2)
	.byte	3                               # Abbreviation Code
	.byte	52                              # DW_TAG_variable
	.byte	0                               # DW_CHILDREN_no
	.byte	2                               # DW_AT_location
	.byte	24                              # DW_FORM_exprloc
	.byte	3                               # DW_AT_name
	.byte	37                              # DW_FORM_strx1
	.byte	58                              # DW_AT_decl_file
	.byte	11                              # DW_FORM_data1
	.byte	59                              # DW_AT_decl_line
	.byte	11                              # DW_FORM_data1
	.byte	73                              # DW_AT_type
	.byte	19                              # DW_FORM_ref4
	.byte	0                               # EOM(1)
	.byte	0                               # EOM(2)
	.byte	4                               # Abbreviation Code
	.byte	52                              # DW_TAG_variable
	.byte	0                               # DW_CHILDREN_no
	.byte	2                               # DW_AT_location
	.byte	34                              # DW_FORM_loclistx
	.byte	3                               # DW_AT_name
	.byte	37                              # DW_FORM_strx1
	.byte	58                              # DW_AT_decl_file
	.byte	11                              # DW_FORM_data1
	.byte	59                              # DW_AT_decl_line
	.byte	11                              # DW_FORM_data1
	.byte	73                              # DW_AT_type
	.byte	19                              # DW_FORM_ref4
	.byte	0                               # EOM(1)
	.byte	0                               # EOM(2)
	.byte	5                               # Abbreviation Code
	.byte	36                              # DW_TAG_base_type
	.byte	0                               # DW_CHILDREN_no
	.byte	3                               # DW_AT_name
	.byte	37                              # DW_FORM_strx1
	.byte	62                              # DW_AT_encoding
	.byte	11                              # DW_FORM_data1
	.byte	11                              # DW_AT_byte_size
	.byte	11                              # DW_FORM_data1
	.byte	0                               # EOM(1)
	.byte	0                               # EOM(2)
	.byte	6                               # Abbreviation Code
	.byte	1                               # DW_TAG_array_type
	.byte	1                               # DW_CHILDREN_yes
	.byte	73                              # DW_AT_type
	.byte	19                              # DW_FORM_ref4
	.byte	0                               # EOM(1)
	.byte	0                               # EOM(2)
	.byte	7                               # Abbreviation Code
	.byte	33                              # DW_TAG_subrange_type
	.byte	0                               # DW_CHILDREN_no
	.byte	73                              # DW_AT_type
	.byte	19                              # DW_FORM_ref4
	.byte	55                              # DW_AT_count
	.byte	5                               # DW_FORM_data2
	.byte	0                               # EOM(1)
	.byte	0                               # EOM(2)
	.byte	8                               # Abbreviation Code
	.byte	36                              # DW_TAG_base_type
	.byte	0                               # DW_CHILDREN_no
	.byte	3                               # DW_AT_name
	.byte	37                              # DW_FORM_strx1
	.byte	11                              # DW_AT_byte_size
	.byte	11                              # DW_FORM_data1
	.byte	62                              # DW_AT_encoding
	.byte	11                              # DW_FORM_data1
	.byte	0                               # EOM(1)
	.byte	0                               # EOM(2)
	.byte	0                               # EOM(3)
	.section	.debug_info,"",@progbits
.Lcu_begin0:
	.long	.Ldebug_info_end0-.Ldebug_info_start0 # Length of Unit
.Ldebug_info_start0:
	.short	5                               # DWARF version number
	.byte	1                               # DWARF Unit Type
	.byte	8                               # Address Size (in bytes)
	.long	.debug_abbrev                   # Offset Into Abbrev. Section
	.byte	1                               # Abbrev [1] 0xc:0xd3 DW_TAG_compile_unit
	.byte	0                               # DW_AT_producer
	.short	29                              # DW_AT_language
	.byte	1                               # DW_AT_name
	.long	.Lstr_offsets_base0             # DW_AT_str_offsets_base
	.long	.Lline_table_start0             # DW_AT_stmt_list
	.byte	2                               # DW_AT_comp_dir
	.byte	0                               # DW_AT_low_pc
	.long	.Lfunc_end0-.Lfunc_begin0       # DW_AT_high_pc
	.long	.Laddr_table_base0              # DW_AT_addr_base
	.long	.Lloclists_table_base0          # DW_AT_loclists_base
	.byte	2                               # Abbrev [2] 0x27:0x7c DW_TAG_subprogram
	.byte	0                               # DW_AT_low_pc
	.long	.Lfunc_end0-.Lfunc_begin0       # DW_AT_high_pc
	.byte	1                               # DW_AT_frame_base
	.byte	86
	.byte	3                               # DW_AT_name
	.byte	0                               # DW_AT_decl_file
	.byte	4                               # DW_AT_decl_line
	.long	163                             # DW_AT_type
                                        # DW_AT_external
	.byte	3                               # Abbrev [3] 0x36:0xc DW_TAG_variable
	.byte	3                               # DW_AT_location
	.byte	145
	.ascii	"\360}"
	.byte	5                               # DW_AT_name
	.byte	0                               # DW_AT_decl_file
	.byte	6                               # DW_AT_decl_line
	.long	167                             # DW_AT_type
	.byte	3                               # Abbrev [3] 0x42:0xc DW_TAG_variable
	.byte	3                               # DW_AT_location
	.byte	145
	.ascii	"\360{"
	.byte	8                               # DW_AT_name
	.byte	0                               # DW_AT_decl_file
	.byte	7                               # DW_AT_decl_line
	.long	167                             # DW_AT_type
	.byte	3                               # Abbrev [3] 0x4e:0xc DW_TAG_variable
	.byte	3                               # DW_AT_location
	.byte	145
	.ascii	"\357{"
	.byte	9                               # DW_AT_name
	.byte	0                               # DW_AT_decl_file
	.byte	8                               # DW_AT_decl_line
	.long	180                             # DW_AT_type
	.byte	3                               # Abbrev [3] 0x5a:0xc DW_TAG_variable
	.byte	3                               # DW_AT_location
	.byte	145
	.ascii	"\340y"
	.byte	10                              # DW_AT_name
	.byte	0                               # DW_AT_decl_file
	.byte	9                               # DW_AT_decl_line
	.long	188                             # DW_AT_type
	.byte	3                               # Abbrev [3] 0x66:0xc DW_TAG_variable
	.byte	3                               # DW_AT_location
	.byte	145
	.ascii	"\340u"
	.byte	12                              # DW_AT_name
	.byte	0                               # DW_AT_decl_file
	.byte	10                              # DW_AT_decl_line
	.long	205                             # DW_AT_type
	.byte	3                               # Abbrev [3] 0x72:0xc DW_TAG_variable
	.byte	3                               # DW_AT_location
	.byte	145
	.ascii	"\330u"
	.byte	13                              # DW_AT_name
	.byte	0                               # DW_AT_decl_file
	.byte	11                              # DW_AT_decl_line
	.long	218                             # DW_AT_type
	.byte	4                               # Abbrev [4] 0x7e:0x9 DW_TAG_variable
	.byte	0                               # DW_AT_location
	.byte	15                              # DW_AT_name
	.byte	0                               # DW_AT_decl_file
	.byte	12                              # DW_AT_decl_line
	.long	163                             # DW_AT_type
	.byte	4                               # Abbrev [4] 0x87:0x9 DW_TAG_variable
	.byte	1                               # DW_AT_location
	.byte	16                              # DW_AT_name
	.byte	0                               # DW_AT_decl_file
	.byte	12                              # DW_AT_decl_line
	.long	163                             # DW_AT_type
	.byte	4                               # Abbrev [4] 0x90:0x9 DW_TAG_variable
	.byte	2                               # DW_AT_location
	.byte	17                              # DW_AT_name
	.byte	0                               # DW_AT_decl_file
	.byte	12                              # DW_AT_decl_line
	.long	163                             # DW_AT_type
	.byte	4                               # Abbrev [4] 0x99:0x9 DW_TAG_variable
	.byte	3                               # DW_AT_location
	.byte	18                              # DW_AT_name
	.byte	0                               # DW_AT_decl_file
	.byte	13                              # DW_AT_decl_line
	.long	218                             # DW_AT_type
	.byte	0                               # End Of Children Mark
	.byte	5                               # Abbrev [5] 0xa3:0x4 DW_TAG_base_type
	.byte	4                               # DW_AT_name
	.byte	5                               # DW_AT_encoding
	.byte	4                               # DW_AT_byte_size
	.byte	6                               # Abbrev [6] 0xa7:0xd DW_TAG_array_type
	.long	180                             # DW_AT_type
	.byte	7                               # Abbrev [7] 0xac:0x7 DW_TAG_subrange_type
	.long	184                             # DW_AT_type
	.short	256                             # DW_AT_count
	.byte	0                               # End Of Children Mark
	.byte	5                               # Abbrev [5] 0xb4:0x4 DW_TAG_base_type
	.byte	6                               # DW_AT_name
	.byte	8                               # DW_AT_encoding
	.byte	1                               # DW_AT_byte_size
	.byte	8                               # Abbrev [8] 0xb8:0x4 DW_TAG_base_type
	.byte	7                               # DW_AT_name
	.byte	8                               # DW_AT_byte_size
	.byte	7                               # DW_AT_encoding
	.byte	6                               # Abbrev [6] 0xbc:0xd DW_TAG_array_type
	.long	201                             # DW_AT_type
	.byte	7                               # Abbrev [7] 0xc1:0x7 DW_TAG_subrange_type
	.long	184                             # DW_AT_type
	.short	256                             # DW_AT_count
	.byte	0                               # End Of Children Mark
	.byte	5                               # Abbrev [5] 0xc9:0x4 DW_TAG_base_type
	.byte	11                              # DW_AT_name
	.byte	6                               # DW_AT_encoding
	.byte	1                               # DW_AT_byte_size
	.byte	6                               # Abbrev [6] 0xcd:0xd DW_TAG_array_type
	.long	201                             # DW_AT_type
	.byte	7                               # Abbrev [7] 0xd2:0x7 DW_TAG_subrange_type
	.long	184                             # DW_AT_type
	.short	512                             # DW_AT_count
	.byte	0                               # End Of Children Mark
	.byte	5                               # Abbrev [5] 0xda:0x4 DW_TAG_base_type
	.byte	14                              # DW_AT_name
	.byte	7                               # DW_AT_encoding
	.byte	8                               # DW_AT_byte_size
	.byte	0                               # End Of Children Mark
.Ldebug_info_end0:
	.section	.debug_str_offsets,"",@progbits
	.long	80                              # Length of String Offsets Set
	.short	5
	.short	0
.Lstr_offsets_base0:
	.section	.debug_str,"MS",@progbits,1
.Linfo_string0:
	.asciz	"clang version 17.0.6 (git@github.com:llvm/llvm-project.git 6009708b4367171ccdbf4b5905cb6a803753fe18)" # string offset=0
.Linfo_string1:
	.asciz	"../tests/rc4.c"                # string offset=101
.Linfo_string2:
	.asciz	"/home/zzzccc/cxzz/Kotoamatsukami/scripts" # string offset=116
.Linfo_string3:
	.asciz	"main"                          # string offset=157
.Linfo_string4:
	.asciz	"int"                           # string offset=162
.Linfo_string5:
	.asciz	"s"                             # string offset=166
.Linfo_string6:
	.asciz	"unsigned char"                 # string offset=168
.Linfo_string7:
	.asciz	"__ARRAY_SIZE_TYPE__"           # string offset=182
.Linfo_string8:
	.asciz	"k"                             # string offset=202
.Linfo_string9:
	.asciz	"temp"                          # string offset=204
.Linfo_string10:
	.asciz	"key"                           # string offset=209
.Linfo_string11:
	.asciz	"char"                          # string offset=213
.Linfo_string12:
	.asciz	"data"                          # string offset=218
.Linfo_string13:
	.asciz	"len"                           # string offset=223
.Linfo_string14:
	.asciz	"unsigned long"                 # string offset=227
.Linfo_string15:
	.asciz	"i"                             # string offset=241
.Linfo_string16:
	.asciz	"j"                             # string offset=243
.Linfo_string17:
	.asciz	"t"                             # string offset=245
.Linfo_string18:
	.asciz	"k_len"                         # string offset=247
	.section	.debug_str_offsets,"",@progbits
	.long	.Linfo_string0
	.long	.Linfo_string1
	.long	.Linfo_string2
	.long	.Linfo_string3
	.long	.Linfo_string4
	.long	.Linfo_string5
	.long	.Linfo_string6
	.long	.Linfo_string7
	.long	.Linfo_string8
	.long	.Linfo_string9
	.long	.Linfo_string10
	.long	.Linfo_string11
	.long	.Linfo_string12
	.long	.Linfo_string13
	.long	.Linfo_string14
	.long	.Linfo_string15
	.long	.Linfo_string16
	.long	.Linfo_string17
	.long	.Linfo_string18
	.section	.debug_addr,"",@progbits
	.long	.Ldebug_addr_end0-.Ldebug_addr_start0 # Length of contribution
.Ldebug_addr_start0:
	.short	5                               # DWARF version number
	.byte	8                               # Address size
	.byte	0                               # Segment selector size
.Laddr_table_base0:
	.quad	.Lfunc_begin0
.Ldebug_addr_end0:
	.ident	"clang version 17.0.6 (git@github.com:llvm/llvm-project.git 6009708b4367171ccdbf4b5905cb6a803753fe18)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
	.addrsig_sym main
	.addrsig_sym strlen
	.addrsig_sym .LAllFunctions_IndirectBrTargets
	.section	.debug_line,"",@progbits
.Lline_table_start0:
