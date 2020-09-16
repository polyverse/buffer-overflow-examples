	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 10, 15	sdk_version 10, 15, 6
	.globl	_do_bad_stuff           ## -- Begin function do_bad_stuff
	.p2align	4, 0x90
_do_bad_stuff:                          ## @do_bad_stuff
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_username_by_concat     ## -- Begin function username_by_concat
	.p2align	4, 0x90
_username_by_concat:                    ## @username_by_concat
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$48, %rsp
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	movq	-8(%rbp), %rdi
	callq	_strlen
	movq	-16(%rbp), %rdi
	movq	%rax, -32(%rbp)         ## 8-byte Spill
	callq	_strlen
	movq	-32(%rbp), %rcx         ## 8-byte Reload
	addq	%rax, %rcx
	addq	$1, %rcx
	shlq	$0, %rcx
	movq	%rcx, %rdi
	callq	_malloc
	movq	$-1, %rdx
	movq	%rax, -24(%rbp)
	movq	-24(%rbp), %rdi
	movq	-8(%rbp), %rsi
	callq	___strcpy_chk
	movq	$-1, %rdx
	movq	-24(%rbp), %rdi
	movq	-16(%rbp), %rsi
	movq	%rax, -40(%rbp)         ## 8-byte Spill
	callq	___strcat_chk
	movq	-24(%rbp), %rcx
	movq	%rax, -48(%rbp)         ## 8-byte Spill
	movq	%rcx, %rax
	addq	$48, %rsp
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_main                   ## -- Begin function main
	.p2align	4, 0x90
_main:                                  ## @main
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$32, %rsp
	movl	$32, %edi
	callq	_malloc
	movq	%rax, -8(%rbp)
	movq	-8(%rbp), %rax
	leaq	_username_by_concat(%rip), %rcx
	movq	%rcx, 24(%rax)
	leaq	L_.str(%rip), %rdi
	movb	$0, %al
	callq	_printf
	movq	-8(%rbp), %rsi
	leaq	L_.str.1(%rip), %rdi
	movl	%eax, -12(%rbp)         ## 4-byte Spill
	movb	$0, %al
	callq	_scanf
	leaq	L_.str.2(%rip), %rdi
	movl	%eax, -16(%rbp)         ## 4-byte Spill
	movb	$0, %al
	callq	_printf
	movq	-8(%rbp), %rcx
	addq	$10, %rcx
	leaq	L_.str.1(%rip), %rdi
	movq	%rcx, %rsi
	movl	%eax, -20(%rbp)         ## 4-byte Spill
	movb	$0, %al
	callq	_scanf
	movq	-8(%rbp), %rcx
	movq	24(%rcx), %rcx
	movq	-8(%rbp), %rdi
	movq	-8(%rbp), %rdx
	addq	$10, %rdx
	movq	%rdx, %rsi
	movl	%eax, -24(%rbp)         ## 4-byte Spill
	callq	*%rcx
	leaq	L_.str.3(%rip), %rdi
	movq	%rax, %rsi
	movb	$0, %al
	callq	_printf
	xorl	%r8d, %r8d
	movl	%eax, -28(%rbp)         ## 4-byte Spill
	movl	%r8d, %eax
	addq	$32, %rsp
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.section	__TEXT,__cstring,cstring_literals
L_.str:                                 ## @.str
	.asciz	"\nEnter first name: "

L_.str.1:                               ## @.str.1
	.asciz	"%s"

L_.str.2:                               ## @.str.2
	.asciz	"\nEnter last name: "

L_.str.3:                               ## @.str.3
	.asciz	"\nGenerated username: %s\n"


.subsections_via_symbols
