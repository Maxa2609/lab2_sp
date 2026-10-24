	.file	"mm.c"
	.intel_syntax noprefix
	.text
	.p2align 4
	.globl	init
	.type	init, @function
init:
.LFB23:
	.cfi_startproc
	endbr64
	mov	eax, 8
	vmovdqa	ymm6, YMMWORD PTR .LC0[rip]
	lea	rcx, A[rip]
	lea	rdx, B[rip]
	vmovd	xmm5, eax
	xor	esi, esi
	vpbroadcastd	ymm5, xmm5
.L2:
	vmovd	xmm3, esi
	xor	eax, eax
	vmovdqa	ymm2, ymm6
	vpbroadcastd	ymm3, xmm3
	.p2align 4,,10
	.p2align 3
.L3:
	vpaddd	ymm1, ymm3, ymm2
	vpsubd	ymm0, ymm3, ymm2
	vcvtdq2pd	ymm4, xmm1
	vextracti128	xmm1, ymm1, 0x1
	vmovapd	YMMWORD PTR [rcx+rax], ymm4
	vpaddd	ymm2, ymm2, ymm5
	vcvtdq2pd	ymm1, xmm1
	vmovapd	YMMWORD PTR 32[rcx+rax], ymm1
	vcvtdq2pd	ymm1, xmm0
	vextracti128	xmm0, ymm0, 0x1
	vmovapd	YMMWORD PTR [rdx+rax], ymm1
	vcvtdq2pd	ymm0, xmm0
	vmovapd	YMMWORD PTR 32[rdx+rax], ymm0
	add	rax, 64
	cmp	rax, 8192
	jne	.L3
	inc	esi
	add	rcx, 8192
	add	rdx, 8192
	cmp	esi, 1024
	jne	.L2
	vzeroupper
	ret
	.cfi_endproc
.LFE23:
	.size	init, .-init
	.p2align 4
	.globl	multiply
	.type	multiply, @function
multiply:
.LFB24:
	.cfi_startproc
	endbr64
	lea	r10, A[rip]
	xor	r9d, r9d
	lea	r8, B[rip+8388608]
	lea	r11, C[rip]
.L9:
	mov	rdx, r9
	lea	rcx, B[rip]
	mov	rdi, r10
	sal	rdx, 13
	add	rdx, r11
.L13:
	vbroadcastsd	ymm2, QWORD PTR [rdi]
	vbroadcastsd	ymm1, QWORD PTR 8[rdi]
	lea	rsi, 8192[rcx]
	xor	eax, eax
	.p2align 6
	.p2align 4,,10
	.p2align 3
.L10:
	vmovapd	ymm0, YMMWORD PTR [rcx+rax]
	vfmadd213pd	ymm0, ymm2, YMMWORD PTR [rdx+rax]
	vmovapd	YMMWORD PTR [rdx+rax], ymm0
	vfmadd231pd	ymm0, ymm1, YMMWORD PTR [rsi+rax]
	vmovapd	YMMWORD PTR [rdx+rax], ymm0
	add	rax, 32
	cmp	rax, 8192
	jne	.L10
	add	rcx, 16384
	add	rdi, 16
	cmp	rcx, r8
	jne	.L13
	inc	r9
	add	r10, 8192
	cmp	r9, 1024
	jne	.L9
	vzeroupper
	ret
	.cfi_endproc
.LFE24:
	.size	multiply, .-multiply
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC2:
	.string	"%f\n"
	.section	.text.startup,"ax",@progbits
	.p2align 4
	.globl	main
	.type	main, @function
main:
.LFB25:
	.cfi_startproc
	endbr64
	sub	rsp, 8
	.cfi_def_cfa_offset 16
	call	init
	call	multiply
	vmovsd	xmm0, QWORD PTR C[rip+4198400]
	lea	rsi, .LC2[rip]
	mov	edi, 2
	mov	eax, 1
	call	__printf_chk@PLT
	xor	eax, eax
	add	rsp, 8
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE25:
	.size	main, .-main
	.local	C
	.comm	C,8388608,32
	.local	B
	.comm	B,8388608,32
	.local	A
	.comm	A,8388608,32
	.section	.rodata.cst32,"aM",@progbits,32
	.align 32
.LC0:
	.long	0
	.long	1
	.long	2
	.long	3
	.long	4
	.long	5
	.long	6
	.long	7
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
