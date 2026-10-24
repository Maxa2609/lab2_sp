	.file	"mm.c"
	.intel_syntax noprefix
	.text
	.local	A
	.comm	A,8388608,32
	.local	B
	.comm	B,8388608,32
	.local	C
	.comm	C,8388608,32
	.globl	init
	.type	init, @function
init:
.LFB0:
	.cfi_startproc
	endbr64
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp
	.cfi_def_cfa_register 6
	mov	DWORD PTR -8[rbp], 0
	jmp	.L2
.L5:
	mov	DWORD PTR -4[rbp], 0
	jmp	.L3
.L4:
	mov	edx, DWORD PTR -8[rbp]
	mov	eax, DWORD PTR -4[rbp]
	add	eax, edx
	pxor	xmm0, xmm0
	cvtsi2sd	xmm0, eax
	mov	eax, DWORD PTR -4[rbp]
	cdqe
	mov	edx, DWORD PTR -8[rbp]
	movsxd	rdx, edx
	sal	rdx, 10
	add	rax, rdx
	lea	rdx, 0[0+rax*8]
	lea	rax, A[rip]
	movsd	QWORD PTR [rdx+rax], xmm0
	mov	eax, DWORD PTR -8[rbp]
	sub	eax, DWORD PTR -4[rbp]
	pxor	xmm0, xmm0
	cvtsi2sd	xmm0, eax
	mov	eax, DWORD PTR -4[rbp]
	cdqe
	mov	edx, DWORD PTR -8[rbp]
	movsxd	rdx, edx
	sal	rdx, 10
	add	rax, rdx
	lea	rdx, 0[0+rax*8]
	lea	rax, B[rip]
	movsd	QWORD PTR [rdx+rax], xmm0
	add	DWORD PTR -4[rbp], 1
.L3:
	cmp	DWORD PTR -4[rbp], 1023
	jle	.L4
	add	DWORD PTR -8[rbp], 1
.L2:
	cmp	DWORD PTR -8[rbp], 1023
	jle	.L5
	nop
	nop
	pop	rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE0:
	.size	init, .-init
	.globl	multiply
	.type	multiply, @function
multiply:
.LFB1:
	.cfi_startproc
	endbr64
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp
	.cfi_def_cfa_register 6
	mov	DWORD PTR -12[rbp], 0
	jmp	.L7
.L12:
	mov	DWORD PTR -8[rbp], 0
	jmp	.L8
.L11:
	mov	DWORD PTR -4[rbp], 0
	jmp	.L9
.L10:
	mov	eax, DWORD PTR -4[rbp]
	cdqe
	mov	edx, DWORD PTR -12[rbp]
	movsxd	rdx, edx
	sal	rdx, 10
	add	rax, rdx
	lea	rdx, 0[0+rax*8]
	lea	rax, C[rip]
	movsd	xmm1, QWORD PTR [rdx+rax]
	mov	eax, DWORD PTR -8[rbp]
	cdqe
	mov	edx, DWORD PTR -12[rbp]
	movsxd	rdx, edx
	sal	rdx, 10
	add	rax, rdx
	lea	rdx, 0[0+rax*8]
	lea	rax, A[rip]
	movsd	xmm2, QWORD PTR [rdx+rax]
	mov	eax, DWORD PTR -4[rbp]
	cdqe
	mov	edx, DWORD PTR -8[rbp]
	movsxd	rdx, edx
	sal	rdx, 10
	add	rax, rdx
	lea	rdx, 0[0+rax*8]
	lea	rax, B[rip]
	movsd	xmm0, QWORD PTR [rdx+rax]
	mulsd	xmm0, xmm2
	addsd	xmm0, xmm1
	mov	eax, DWORD PTR -4[rbp]
	cdqe
	mov	edx, DWORD PTR -12[rbp]
	movsxd	rdx, edx
	sal	rdx, 10
	add	rax, rdx
	lea	rdx, 0[0+rax*8]
	lea	rax, C[rip]
	movsd	QWORD PTR [rdx+rax], xmm0
	add	DWORD PTR -4[rbp], 1
.L9:
	cmp	DWORD PTR -4[rbp], 1023
	jle	.L10
	add	DWORD PTR -8[rbp], 1
.L8:
	cmp	DWORD PTR -8[rbp], 1023
	jle	.L11
	add	DWORD PTR -12[rbp], 1
.L7:
	cmp	DWORD PTR -12[rbp], 1023
	jle	.L12
	nop
	nop
	pop	rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE1:
	.size	multiply, .-multiply
	.section	.rodata
.LC0:
	.string	"%f\n"
	.text
	.globl	main
	.type	main, @function
main:
.LFB2:
	.cfi_startproc
	endbr64
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp
	.cfi_def_cfa_register 6
	call	init
	call	multiply
	mov	rax, QWORD PTR C[rip+4198400]
	lea	rdx, .LC0[rip]
	movq	xmm0, rax
	mov	rdi, rdx
	mov	eax, 1
	call	printf@PLT
	mov	eax, 0
	pop	rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE2:
	.size	main, .-main
	.ident	"GCC: (Ubuntu 15.2.0-16ubuntu1) 15.2.0"
	.section	.note.GNU-stack,"",@progbits
	.section	.note.gnu.property,"a"
	.align 8
	.long	1f - 0f
	.long	4f - 1f
	.long	5
0:
	.string	"GNU"
1:
	.align 8
	.long	0xc0000002
	.long	3f - 2f
2:
	.long	0x3
3:
	.align 8
4:
