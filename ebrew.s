	.file	"ebrew.c"
	.intel_syntax noprefix
	.text
.lcomm ebz_base,8000000,32
.lcomm ebz_used,8,8
	.def	ebz_cons;	.scl	3;	.type	32;	.endef
	.seh_proc	ebz_cons
ebz_cons:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 32
	.seh_stackalloc	32
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	QWORD PTR 24[rbp], rdx
	mov	DWORD PTR -8[rbp], 1000000
	mov	eax, DWORD PTR -8[rbp]
	cdqe
	imul	rax, QWORD PTR 16[rbp]
	test	rax, rax
	js	.L2
	pxor	xmm0, xmm0
	cvtsi2sd	xmm0, rax
	jmp	.L3
.L2:
	mov	rdx, rax
	shr	rdx
	and	eax, 1
	or	rdx, rax
	pxor	xmm0, xmm0
	cvtsi2sd	xmm0, rdx
	addsd	xmm0, xmm0
.L3:
	movsd	xmm1, QWORD PTR .LC0[rip]
	mulsd	xmm0, xmm1
	cvttsd2si	eax, xmm0
	mov	edx, eax
	mov	rax, QWORD PTR 24[rbp]
	xor	eax, edx
	mov	DWORD PTR -12[rbp], eax
	mov	eax, DWORD PTR -12[rbp]
	cdq
	idiv	DWORD PTR -8[rbp]
	mov	DWORD PTR -4[rbp], edx
.L8:
	mov	eax, DWORD PTR -4[rbp]
	cdqe
	lea	rdx, 0[0+rax*8]
	lea	rax, ebz_base[rip]
	add	rax, rdx
	mov	QWORD PTR -24[rbp], rax
	mov	rax, QWORD PTR -24[rbp]
	movzx	eax, BYTE PTR 7[rax]
	and	eax, -128
	test	al, al
	jne	.L4
	mov	rax, QWORD PTR 16[rbp]
	mov	edx, eax
	mov	rax, QWORD PTR -24[rbp]
	mov	DWORD PTR [rax], edx
	mov	rax, QWORD PTR 24[rbp]
	and	eax, 2147483647
	mov	rdx, QWORD PTR -24[rbp]
	and	eax, 2147483647
	mov	ecx, eax
	mov	eax, DWORD PTR 4[rdx]
	and	eax, -2147483648
	or	eax, ecx
	mov	DWORD PTR 4[rdx], eax
	mov	rax, QWORD PTR -24[rbp]
	movzx	edx, BYTE PTR 7[rax]
	or	edx, -128
	mov	BYTE PTR 7[rax], dl
	mov	rax, QWORD PTR ebz_used[rip]
	add	rax, 1
	mov	QWORD PTR ebz_used[rip], rax
	jmp	.L5
.L4:
	mov	rax, QWORD PTR -24[rbp]
	mov	eax, DWORD PTR [rax]
	mov	eax, eax
	cmp	QWORD PTR 16[rbp], rax
	jne	.L6
	mov	rax, QWORD PTR -24[rbp]
	mov	eax, DWORD PTR 4[rax]
	and	eax, 2147483647
	mov	eax, eax
	cmp	QWORD PTR 24[rbp], rax
	je	.L10
.L6:
	add	DWORD PTR -4[rbp], 1
	mov	eax, DWORD PTR -4[rbp]
	cmp	eax, DWORD PTR -8[rbp]
	jne	.L8
	mov	DWORD PTR -4[rbp], 0
	jmp	.L8
.L10:
	nop
.L5:
	mov	eax, DWORD PTR -4[rbp]
	cdqe
	add	rsp, 32
	pop	rbp
	ret
	.seh_endproc
	.def	eb_putchar;	.scl	3;	.type	32;	.endef
	.seh_proc	eb_putchar
eb_putchar:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 32
	.seh_stackalloc	32
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	QWORD PTR 24[rbp], rdx
	mov	rax, QWORD PTR 24[rbp]
	mov	ecx, eax
	call	putchar
	mov	eax, 0
	add	rsp, 32
	pop	rbp
	ret
	.seh_endproc
	.def	eb_cons;	.scl	3;	.type	32;	.endef
	.seh_proc	eb_cons
eb_cons:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 32
	.seh_stackalloc	32
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	QWORD PTR 24[rbp], rdx
	mov	QWORD PTR 32[rbp], r8
	mov	rdx, QWORD PTR 32[rbp]
	mov	rax, QWORD PTR 24[rbp]
	mov	rcx, rax
	call	ebz_cons
	add	rsp, 32
	pop	rbp
	ret
	.seh_endproc
	.def	eb_car;	.scl	3;	.type	32;	.endef
	.seh_proc	eb_car
eb_car:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	QWORD PTR 24[rbp], rdx
	mov	rax, QWORD PTR 24[rbp]
	lea	rdx, 0[0+rax*8]
	lea	rax, ebz_base[rip]
	mov	eax, DWORD PTR [rdx+rax]
	mov	eax, eax
	pop	rbp
	ret
	.seh_endproc
	.def	eb_cdr;	.scl	3;	.type	32;	.endef
	.seh_proc	eb_cdr
eb_cdr:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	QWORD PTR 24[rbp], rdx
	mov	rax, QWORD PTR 24[rbp]
	lea	rdx, 0[0+rax*8]
	lea	rax, ebz_base[rip]
	mov	eax, DWORD PTR 4[rdx+rax]
	and	eax, 2147483647
	mov	eax, eax
	pop	rbp
	ret
	.seh_endproc
	.def	eb_if;	.scl	3;	.type	32;	.endef
	.seh_proc	eb_if
eb_if:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 32
	.seh_stackalloc	32
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	QWORD PTR 24[rbp], rdx
	mov	QWORD PTR 32[rbp], r8
	mov	QWORD PTR 40[rbp], r9
	cmp	QWORD PTR 24[rbp], 0
	je	.L20
	mov	rax, QWORD PTR 32[rbp]
	mov	rax, QWORD PTR [rax]
	mov	rdx, rax
	mov	rax, QWORD PTR 32[rbp]
	mov	rcx, rax
	call	rdx
	jmp	.L21
.L20:
	mov	rax, QWORD PTR 40[rbp]
	mov	rax, QWORD PTR [rax]
	mov	rdx, rax
	mov	rax, QWORD PTR 40[rbp]
	mov	rcx, rax
	call	rdx
.L21:
	add	rsp, 32
	pop	rbp
	ret
	.seh_endproc
	.def	eb_add;	.scl	3;	.type	32;	.endef
	.seh_proc	eb_add
eb_add:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	QWORD PTR 24[rbp], rdx
	mov	QWORD PTR 32[rbp], r8
	mov	rdx, QWORD PTR 32[rbp]
	mov	rax, QWORD PTR 24[rbp]
	add	rax, rdx
	pop	rbp
	ret
	.seh_endproc
	.def	eb_sub;	.scl	3;	.type	32;	.endef
	.seh_proc	eb_sub
eb_sub:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	QWORD PTR 24[rbp], rdx
	mov	QWORD PTR 32[rbp], r8
	mov	rax, QWORD PTR 32[rbp]
	sub	rax, QWORD PTR 24[rbp]
	pop	rbp
	ret
	.seh_endproc
	.def	eb_mul;	.scl	3;	.type	32;	.endef
	.seh_proc	eb_mul
eb_mul:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	QWORD PTR 24[rbp], rdx
	mov	QWORD PTR 32[rbp], r8
	mov	rax, QWORD PTR 32[rbp]
	imul	rax, QWORD PTR 24[rbp]
	pop	rbp
	ret
	.seh_endproc
	.def	eb_div;	.scl	3;	.type	32;	.endef
	.seh_proc	eb_div
eb_div:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	QWORD PTR 24[rbp], rdx
	mov	QWORD PTR 32[rbp], r8
	mov	rax, QWORD PTR 32[rbp]
	mov	edx, 0
	div	QWORD PTR 24[rbp]
	pop	rbp
	ret
	.seh_endproc
	.def	eb_mod;	.scl	3;	.type	32;	.endef
	.seh_proc	eb_mod
eb_mod:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	QWORD PTR 24[rbp], rdx
	mov	QWORD PTR 32[rbp], r8
	mov	rax, QWORD PTR 32[rbp]
	mov	edx, 0
	div	QWORD PTR 24[rbp]
	mov	rax, rdx
	pop	rbp
	ret
	.seh_endproc
	.def	eb_equal;	.scl	3;	.type	32;	.endef
	.seh_proc	eb_equal
eb_equal:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	QWORD PTR 24[rbp], rdx
	mov	QWORD PTR 32[rbp], r8
	mov	rax, QWORD PTR 32[rbp]
	cmp	rax, QWORD PTR 24[rbp]
	sete	al
	movzx	eax, al
	pop	rbp
	ret
	.seh_endproc
	.def	eb_above;	.scl	3;	.type	32;	.endef
	.seh_proc	eb_above
eb_above:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	QWORD PTR 24[rbp], rdx
	mov	QWORD PTR 32[rbp], r8
	mov	rax, QWORD PTR 32[rbp]
	cmp	QWORD PTR 24[rbp], rax
	setb	al
	movzx	eax, al
	pop	rbp
	ret
	.seh_endproc
	.def	ebz_stol;	.scl	3;	.type	32;	.endef
	.seh_proc	ebz_stol
ebz_stol:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 48
	.seh_stackalloc	48
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	QWORD PTR 24[rbp], rdx
	mov	rax, QWORD PTR 16[rbp]
	mov	rax, QWORD PTR [rax]
	test	rax, rax
	jne	.L43
	mov	QWORD PTR -8[rbp], 0
	mov	QWORD PTR -16[rbp], 0
	jmp	.L39
.L40:
	add	QWORD PTR -16[rbp], 1
.L39:
	mov	rdx, QWORD PTR 24[rbp]
	mov	rax, QWORD PTR -16[rbp]
	add	rax, rdx
	movzx	eax, BYTE PTR [rax]
	test	al, al
	jne	.L40
	jmp	.L41
.L42:
	sub	QWORD PTR -16[rbp], 1
	mov	rdx, QWORD PTR 24[rbp]
	mov	rax, QWORD PTR -16[rbp]
	add	rax, rdx
	movzx	eax, BYTE PTR [rax]
	movsx	rax, al
	mov	rdx, QWORD PTR -8[rbp]
	mov	rcx, rax
	call	ebz_cons
	mov	QWORD PTR -8[rbp], rax
.L41:
	cmp	QWORD PTR -16[rbp], 0
	jne	.L42
	mov	rax, QWORD PTR 16[rbp]
	mov	rdx, QWORD PTR -8[rbp]
	mov	QWORD PTR [rax], rdx
	jmp	.L36
.L43:
	nop
.L36:
	add	rsp, 48
	pop	rbp
	ret
	.seh_endproc
	.section .rdata,"dr"
.LC1:
	.ascii "r\0"
	.text
	.def	eb_read_file;	.scl	3;	.type	32;	.endef
	.seh_proc	eb_read_file
eb_read_file:
	push	rbp
	.seh_pushreg	rbp
	sub	rsp, 1104
	.seh_stackalloc	1104
	lea	rbp, 128[rsp]
	.seh_setframe	rbp, 128
	.seh_endprologue
	mov	QWORD PTR 992[rbp], rcx
	mov	QWORD PTR 1000[rbp], rdx
	lea	rax, -80[rbp]
	mov	QWORD PTR 968[rbp], rax
	jmp	.L45
.L46:
	mov	rax, QWORD PTR 1000[rbp]
	mov	rdx, rax
	mov	ecx, 0
	call	eb_car
	mov	rcx, rax
	mov	rax, QWORD PTR 968[rbp]
	lea	rdx, 1[rax]
	mov	QWORD PTR 968[rbp], rdx
	mov	edx, ecx
	mov	BYTE PTR [rax], dl
	mov	rax, QWORD PTR 1000[rbp]
	mov	rdx, rax
	mov	ecx, 0
	call	eb_cdr
	mov	QWORD PTR 1000[rbp], rax
.L45:
	cmp	QWORD PTR 1000[rbp], 0
	jne	.L46
	mov	rax, QWORD PTR 968[rbp]
	lea	rdx, 1[rax]
	mov	QWORD PTR 968[rbp], rdx
	mov	BYTE PTR [rax], 0
	lea	rax, -80[rbp]
	lea	rdx, .LC1[rip]
	mov	rcx, rax
	call	fopen
	mov	QWORD PTR 952[rbp], rax
	cmp	QWORD PTR 952[rbp], 0
	jne	.L47
	mov	eax, 0
	jmp	.L53
.L47:
	lea	rax, i.2[rip]
	mov	QWORD PTR 960[rbp], rax
	jmp	.L49
.L52:
	mov	rax, QWORD PTR 952[rbp]
	mov	rcx, rax
	call	fgetc
	mov	BYTE PTR 951[rbp], al
	cmp	BYTE PTR 951[rbp], 0
	jle	.L54
	mov	rax, QWORD PTR 960[rbp]
	lea	rdx, 1[rax]
	mov	QWORD PTR 960[rbp], rdx
	movzx	edx, BYTE PTR 951[rbp]
	mov	BYTE PTR [rax], dl
.L49:
	mov	rax, QWORD PTR 952[rbp]
	mov	rcx, rax
	call	feof
	test	eax, eax
	je	.L52
	jmp	.L51
.L54:
	nop
.L51:
	mov	rax, QWORD PTR 960[rbp]
	lea	rdx, 1[rax]
	mov	QWORD PTR 960[rbp], rdx
	mov	BYTE PTR [rax], 0
	mov	rax, QWORD PTR 952[rbp]
	mov	rcx, rax
	call	fclose
	mov	QWORD PTR -88[rbp], 0
	lea	rax, -88[rbp]
	lea	rdx, i.2[rip]
	mov	rcx, rax
	call	ebz_stol
	mov	rax, QWORD PTR -88[rbp]
.L53:
	add	rsp, 1104
	pop	rbp
	ret
	.seh_endproc
	.globl	main
	.def	main;	.scl	2;	.type	32;	.endef
	.seh_proc	main
main:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 64
	.seh_stackalloc	64
	.seh_endprologue
	mov	DWORD PTR 16[rbp], ecx
	mov	QWORD PTR 24[rbp], rdx
	call	__main
	mov	QWORD PTR -8[rbp], 0
	jmp	.L56
.L57:
	sub	DWORD PTR 16[rbp], 1
	mov	eax, DWORD PTR 16[rbp]
	cdqe
	lea	rdx, 0[0+rax*8]
	mov	rax, QWORD PTR 24[rbp]
	add	rax, rdx
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -16[rbp], rax
	mov	QWORD PTR -24[rbp], 0
	mov	rdx, QWORD PTR -16[rbp]
	lea	rax, -24[rbp]
	mov	rcx, rax
	call	ebz_stol
	mov	rax, QWORD PTR -24[rbp]
	mov	rdx, QWORD PTR -8[rbp]
	mov	rcx, rax
	call	ebz_cons
	mov	QWORD PTR -8[rbp], rax
.L56:
	cmp	DWORD PTR 16[rbp], 1
	jg	.L57
	mov	rax, QWORD PTR -8[rbp]
	mov	rdx, rax
	mov	ecx, 0
	call	eb_main
	add	rsp, 64
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_or1f
	.def	eb_or1f;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_or1f
eb_or1f:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 16
	.seh_stackalloc	16
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -8[rbp], rax
	mov	rax, QWORD PTR -8[rbp]
	add	rsp, 16
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_or2f
	.def	eb_or2f;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_or2f
eb_or2f:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 48
	.seh_stackalloc	48
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -8[rbp], rax
	mov	rax, QWORD PTR -8[rbp]
	mov	rax, QWORD PTR [rax]
	mov	rdx, rax
	mov	rax, QWORD PTR -8[rbp]
	mov	rcx, rax
	call	rdx
	mov	QWORD PTR -16[rbp], rax
	mov	rax, QWORD PTR -16[rbp]
	add	rsp, 48
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_or
	.def	eb_or;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_or
eb_or:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 80
	.seh_stackalloc	80
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	QWORD PTR 24[rbp], rdx
	mov	QWORD PTR 32[rbp], r8
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -8[rbp], rax
	lea	rax, eb_or1f[rip]
	mov	QWORD PTR -32[rbp], rax
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -24[rbp], rax
	lea	rax, eb_or2f[rip]
	mov	QWORD PTR -48[rbp], rax
	mov	rax, QWORD PTR 32[rbp]
	mov	QWORD PTR -40[rbp], rax
	lea	r8, -48[rbp]
	lea	rdx, -32[rbp]
	lea	rcx, eb_if[rip]
	mov	rax, QWORD PTR -8[rbp]
	mov	r9, r8
	mov	r8, rdx
	mov	rdx, rax
	call	eb_if
	mov	QWORD PTR -16[rbp], rax
	mov	rax, QWORD PTR -16[rbp]
	add	rsp, 80
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_and1f
	.def	eb_and1f;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_and1f
eb_and1f:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 48
	.seh_stackalloc	48
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -8[rbp], rax
	mov	rax, QWORD PTR -8[rbp]
	mov	rax, QWORD PTR [rax]
	mov	rdx, rax
	mov	rax, QWORD PTR -8[rbp]
	mov	rcx, rax
	call	rdx
	mov	QWORD PTR -16[rbp], rax
	mov	rax, QWORD PTR -16[rbp]
	add	rsp, 48
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_and2f
	.def	eb_and2f;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_and2f
eb_and2f:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 16
	.seh_stackalloc	16
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	QWORD PTR -8[rbp], 0
	mov	rax, QWORD PTR -8[rbp]
	add	rsp, 16
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_and
	.def	eb_and;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_and
eb_and:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 80
	.seh_stackalloc	80
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	QWORD PTR 24[rbp], rdx
	mov	QWORD PTR 32[rbp], r8
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -8[rbp], rax
	lea	rax, eb_and1f[rip]
	mov	QWORD PTR -32[rbp], rax
	mov	rax, QWORD PTR 32[rbp]
	mov	QWORD PTR -24[rbp], rax
	lea	rax, eb_and2f[rip]
	mov	QWORD PTR -40[rbp], rax
	lea	r8, -40[rbp]
	lea	rdx, -32[rbp]
	lea	rcx, eb_if[rip]
	mov	rax, QWORD PTR -8[rbp]
	mov	r9, r8
	mov	r8, rdx
	mov	rdx, rax
	call	eb_if
	mov	QWORD PTR -16[rbp], rax
	mov	rax, QWORD PTR -16[rbp]
	add	rsp, 80
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_not1f
	.def	eb_not1f;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_not1f
eb_not1f:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 16
	.seh_stackalloc	16
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	QWORD PTR -8[rbp], 0
	mov	rax, QWORD PTR -8[rbp]
	add	rsp, 16
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_not2f
	.def	eb_not2f;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_not2f
eb_not2f:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 16
	.seh_stackalloc	16
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	QWORD PTR -8[rbp], 1
	mov	rax, QWORD PTR -8[rbp]
	add	rsp, 16
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_not
	.def	eb_not;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_not
eb_not:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 64
	.seh_stackalloc	64
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	QWORD PTR 24[rbp], rdx
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -8[rbp], rax
	lea	rax, eb_not1f[rip]
	mov	QWORD PTR -24[rbp], rax
	lea	rax, eb_not2f[rip]
	mov	QWORD PTR -32[rbp], rax
	lea	r8, -32[rbp]
	lea	rdx, -24[rbp]
	lea	rcx, eb_if[rip]
	mov	rax, QWORD PTR -8[rbp]
	mov	r9, r8
	mov	r8, rdx
	mov	rdx, rax
	call	eb_if
	mov	QWORD PTR -16[rbp], rax
	mov	rax, QWORD PTR -16[rbp]
	add	rsp, 64
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_do
	.def	eb_do;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_do
eb_do:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 16
	.seh_stackalloc	16
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	QWORD PTR 24[rbp], rdx
	mov	QWORD PTR 32[rbp], r8
	mov	rax, QWORD PTR 32[rbp]
	mov	QWORD PTR -8[rbp], rax
	mov	rax, QWORD PTR -8[rbp]
	add	rsp, 16
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_let
	.def	eb_let;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_let
eb_let:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 64
	.seh_stackalloc	64
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	QWORD PTR 24[rbp], rdx
	mov	QWORD PTR 32[rbp], r8
	mov	rax, QWORD PTR 32[rbp]
	mov	QWORD PTR -8[rbp], rax
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -16[rbp], rax
	mov	rax, QWORD PTR -8[rbp]
	mov	rax, QWORD PTR [rax]
	mov	r8, rax
	mov	rdx, QWORD PTR -16[rbp]
	mov	rax, QWORD PTR -8[rbp]
	mov	rcx, rax
	call	r8
	mov	QWORD PTR -24[rbp], rax
	mov	rax, QWORD PTR -24[rbp]
	add	rsp, 64
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_for1f11f
	.def	eb_for1f11f;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_for1f11f
eb_for1f11f:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 64
	.seh_stackalloc	64
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	QWORD PTR 24[rbp], rdx
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -8[rbp], rax
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -16[rbp], rax
	mov	rax, QWORD PTR -8[rbp]
	mov	rax, QWORD PTR [rax]
	mov	r8, rax
	mov	rdx, QWORD PTR -16[rbp]
	mov	rax, QWORD PTR -8[rbp]
	mov	rcx, rax
	call	r8
	mov	QWORD PTR -24[rbp], rax
	mov	rax, QWORD PTR -24[rbp]
	add	rsp, 64
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_for1f
	.def	eb_for1f;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_for1f
eb_for1f:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 112
	.seh_stackalloc	112
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -8[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 16
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -16[rbp], rax
	lea	rcx, eb_car[rip]
	mov	rax, QWORD PTR -16[rbp]
	mov	rdx, rax
	call	eb_car
	mov	QWORD PTR -24[rbp], rax
	mov	rax, QWORD PTR -8[rbp]
	mov	rax, QWORD PTR [rax]
	mov	r8, rax
	mov	rdx, QWORD PTR -24[rbp]
	mov	rax, QWORD PTR -8[rbp]
	mov	rcx, rax
	call	r8
	mov	QWORD PTR -32[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 16
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -40[rbp], rax
	lea	rcx, eb_cdr[rip]
	mov	rax, QWORD PTR -40[rbp]
	mov	rdx, rax
	call	eb_cdr
	mov	QWORD PTR -48[rbp], rax
	lea	rax, eb_for1f11f[rip]
	mov	QWORD PTR -80[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -72[rbp], rax
	lea	rdx, -80[rbp]
	lea	rcx, eb_for[rip]
	mov	rax, QWORD PTR -48[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_for
	mov	QWORD PTR -56[rbp], rax
	lea	rcx, eb_do[rip]
	mov	rdx, QWORD PTR -56[rbp]
	mov	rax, QWORD PTR -32[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_do
	mov	QWORD PTR -64[rbp], rax
	mov	rax, QWORD PTR -64[rbp]
	add	rsp, 112
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_for
	.def	eb_for;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_for
eb_for:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 80
	.seh_stackalloc	80
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	QWORD PTR 24[rbp], rdx
	mov	QWORD PTR 32[rbp], r8
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -8[rbp], rax
	lea	rax, eb_for1f[rip]
	mov	QWORD PTR -48[rbp], rax
	mov	rax, QWORD PTR 32[rbp]
	mov	QWORD PTR -40[rbp], rax
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -32[rbp], rax
	lea	rdx, -48[rbp]
	lea	rcx, eb_and[rip]
	mov	rax, QWORD PTR -8[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_and
	mov	QWORD PTR -16[rbp], rax
	mov	rax, QWORD PTR -16[rbp]
	add	rsp, 80
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_fold1f02f
	.def	eb_fold1f02f;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_fold1f02f
eb_fold1f02f:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 64
	.seh_stackalloc	64
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	QWORD PTR 24[rbp], rdx
	mov	QWORD PTR 32[rbp], r8
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -8[rbp], rax
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -16[rbp], rax
	mov	rax, QWORD PTR 32[rbp]
	mov	QWORD PTR -24[rbp], rax
	mov	rax, QWORD PTR -8[rbp]
	mov	rax, QWORD PTR [rax]
	mov	r9, rax
	mov	rcx, QWORD PTR -24[rbp]
	mov	rdx, QWORD PTR -16[rbp]
	mov	rax, QWORD PTR -8[rbp]
	mov	r8, rcx
	mov	rcx, rax
	call	r9
	mov	QWORD PTR -32[rbp], rax
	mov	rax, QWORD PTR -32[rbp]
	add	rsp, 64
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_fold1f
	.def	eb_fold1f;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_fold1f
eb_fold1f:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 112
	.seh_stackalloc	112
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -8[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 24
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -16[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 16
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -24[rbp], rax
	lea	rcx, eb_cdr[rip]
	mov	rax, QWORD PTR -24[rbp]
	mov	rdx, rax
	call	eb_cdr
	mov	QWORD PTR -32[rbp], rax
	lea	rax, eb_fold1f02f[rip]
	mov	QWORD PTR -80[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -72[rbp], rax
	lea	r8, -80[rbp]
	lea	rcx, eb_fold[rip]
	mov	rdx, QWORD PTR -32[rbp]
	mov	rax, QWORD PTR -16[rbp]
	mov	r9, r8
	mov	r8, rdx
	mov	rdx, rax
	call	eb_fold
	mov	QWORD PTR -40[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 16
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -48[rbp], rax
	lea	rcx, eb_car[rip]
	mov	rax, QWORD PTR -48[rbp]
	mov	rdx, rax
	call	eb_car
	mov	QWORD PTR -56[rbp], rax
	mov	rax, QWORD PTR -8[rbp]
	mov	rax, QWORD PTR [rax]
	mov	r9, rax
	mov	rcx, QWORD PTR -56[rbp]
	mov	rdx, QWORD PTR -40[rbp]
	mov	rax, QWORD PTR -8[rbp]
	mov	r8, rcx
	mov	rcx, rax
	call	r9
	mov	QWORD PTR -64[rbp], rax
	mov	rax, QWORD PTR -64[rbp]
	add	rsp, 112
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_fold2f
	.def	eb_fold2f;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_fold2f
eb_fold2f:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 16
	.seh_stackalloc	16
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -8[rbp], rax
	mov	rax, QWORD PTR -8[rbp]
	add	rsp, 16
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_fold
	.def	eb_fold;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_fold
eb_fold:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 96
	.seh_stackalloc	96
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	QWORD PTR 24[rbp], rdx
	mov	QWORD PTR 32[rbp], r8
	mov	QWORD PTR 40[rbp], r9
	mov	rax, QWORD PTR 32[rbp]
	mov	QWORD PTR -8[rbp], rax
	lea	rax, eb_fold1f[rip]
	mov	QWORD PTR -48[rbp], rax
	mov	rax, QWORD PTR 40[rbp]
	mov	QWORD PTR -40[rbp], rax
	mov	rax, QWORD PTR 32[rbp]
	mov	QWORD PTR -32[rbp], rax
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -24[rbp], rax
	lea	rax, eb_fold2f[rip]
	mov	QWORD PTR -64[rbp], rax
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -56[rbp], rax
	lea	r8, -64[rbp]
	lea	rdx, -48[rbp]
	lea	rcx, eb_if[rip]
	mov	rax, QWORD PTR -8[rbp]
	mov	r9, r8
	mov	r8, rdx
	mov	rdx, rax
	call	eb_if
	mov	QWORD PTR -16[rbp], rax
	mov	rax, QWORD PTR -16[rbp]
	add	rsp, 96
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_map1f11f
	.def	eb_map1f11f;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_map1f11f
eb_map1f11f:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 64
	.seh_stackalloc	64
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	QWORD PTR 24[rbp], rdx
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -8[rbp], rax
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -16[rbp], rax
	mov	rax, QWORD PTR -8[rbp]
	mov	rax, QWORD PTR [rax]
	mov	r8, rax
	mov	rdx, QWORD PTR -16[rbp]
	mov	rax, QWORD PTR -8[rbp]
	mov	rcx, rax
	call	r8
	mov	QWORD PTR -24[rbp], rax
	mov	rax, QWORD PTR -24[rbp]
	add	rsp, 64
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_map1f
	.def	eb_map1f;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_map1f
eb_map1f:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 112
	.seh_stackalloc	112
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -8[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 16
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -16[rbp], rax
	lea	rcx, eb_car[rip]
	mov	rax, QWORD PTR -16[rbp]
	mov	rdx, rax
	call	eb_car
	mov	QWORD PTR -24[rbp], rax
	mov	rax, QWORD PTR -8[rbp]
	mov	rax, QWORD PTR [rax]
	mov	r8, rax
	mov	rdx, QWORD PTR -24[rbp]
	mov	rax, QWORD PTR -8[rbp]
	mov	rcx, rax
	call	r8
	mov	QWORD PTR -32[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 16
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -40[rbp], rax
	lea	rcx, eb_cdr[rip]
	mov	rax, QWORD PTR -40[rbp]
	mov	rdx, rax
	call	eb_cdr
	mov	QWORD PTR -48[rbp], rax
	lea	rax, eb_map1f11f[rip]
	mov	QWORD PTR -80[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -72[rbp], rax
	lea	rdx, -80[rbp]
	lea	rcx, eb_map[rip]
	mov	rax, QWORD PTR -48[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_map
	mov	QWORD PTR -56[rbp], rax
	lea	rcx, eb_cons[rip]
	mov	rdx, QWORD PTR -56[rbp]
	mov	rax, QWORD PTR -32[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_cons
	mov	QWORD PTR -64[rbp], rax
	mov	rax, QWORD PTR -64[rbp]
	add	rsp, 112
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_map
	.def	eb_map;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_map
eb_map:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 80
	.seh_stackalloc	80
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	QWORD PTR 24[rbp], rdx
	mov	QWORD PTR 32[rbp], r8
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -8[rbp], rax
	lea	rax, eb_map1f[rip]
	mov	QWORD PTR -48[rbp], rax
	mov	rax, QWORD PTR 32[rbp]
	mov	QWORD PTR -40[rbp], rax
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -32[rbp], rax
	lea	rdx, -48[rbp]
	lea	rcx, eb_and[rip]
	mov	rax, QWORD PTR -8[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_and
	mov	QWORD PTR -16[rbp], rax
	mov	rax, QWORD PTR -16[rbp]
	add	rsp, 80
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_filter1f01f
	.def	eb_filter1f01f;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_filter1f01f
eb_filter1f01f:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 64
	.seh_stackalloc	64
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	QWORD PTR 24[rbp], rdx
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -8[rbp], rax
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -16[rbp], rax
	mov	rax, QWORD PTR -8[rbp]
	mov	rax, QWORD PTR [rax]
	mov	r8, rax
	mov	rdx, QWORD PTR -16[rbp]
	mov	rax, QWORD PTR -8[rbp]
	mov	rcx, rax
	call	r8
	mov	QWORD PTR -24[rbp], rax
	mov	rax, QWORD PTR -24[rbp]
	add	rsp, 64
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_filter1f1f1f
	.def	eb_filter1f1f1f;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_filter1f1f1f
eb_filter1f1f1f:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 64
	.seh_stackalloc	64
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -8[rbp], rax
	lea	rcx, eb_car[rip]
	mov	rax, QWORD PTR -8[rbp]
	mov	rdx, rax
	call	eb_car
	mov	QWORD PTR -16[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 16
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -24[rbp], rax
	lea	rcx, eb_cons[rip]
	mov	rdx, QWORD PTR -24[rbp]
	mov	rax, QWORD PTR -16[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_cons
	mov	QWORD PTR -32[rbp], rax
	mov	rax, QWORD PTR -32[rbp]
	add	rsp, 64
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_filter1f1f2f
	.def	eb_filter1f1f2f;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_filter1f1f2f
eb_filter1f1f2f:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 16
	.seh_stackalloc	16
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -8[rbp], rax
	mov	rax, QWORD PTR -8[rbp]
	add	rsp, 16
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_filter1f1f
	.def	eb_filter1f1f;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_filter1f1f
eb_filter1f1f:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 112
	.seh_stackalloc	112
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	QWORD PTR 24[rbp], rdx
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -8[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 16
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -16[rbp], rax
	lea	rcx, eb_car[rip]
	mov	rax, QWORD PTR -16[rbp]
	mov	rdx, rax
	call	eb_car
	mov	QWORD PTR -24[rbp], rax
	mov	rax, QWORD PTR -8[rbp]
	mov	rax, QWORD PTR [rax]
	mov	r8, rax
	mov	rdx, QWORD PTR -24[rbp]
	mov	rax, QWORD PTR -8[rbp]
	mov	rcx, rax
	call	r8
	mov	QWORD PTR -32[rbp], rax
	lea	rax, eb_filter1f1f1f[rip]
	mov	QWORD PTR -64[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 16
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -56[rbp], rax
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -48[rbp], rax
	lea	rax, eb_filter1f1f2f[rip]
	mov	QWORD PTR -80[rbp], rax
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -72[rbp], rax
	lea	r8, -80[rbp]
	lea	rdx, -64[rbp]
	lea	rcx, eb_if[rip]
	mov	rax, QWORD PTR -32[rbp]
	mov	r9, r8
	mov	r8, rdx
	mov	rdx, rax
	call	eb_if
	mov	QWORD PTR -40[rbp], rax
	mov	rax, QWORD PTR -40[rbp]
	add	rsp, 112
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_filter1f
	.def	eb_filter1f;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_filter1f
eb_filter1f:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 112
	.seh_stackalloc	112
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 16
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -8[rbp], rax
	lea	rcx, eb_cdr[rip]
	mov	rax, QWORD PTR -8[rbp]
	mov	rdx, rax
	call	eb_cdr
	mov	QWORD PTR -16[rbp], rax
	lea	rax, eb_filter1f01f[rip]
	mov	QWORD PTR -48[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -40[rbp], rax
	lea	rdx, -48[rbp]
	lea	rcx, eb_filter[rip]
	mov	rax, QWORD PTR -16[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_filter
	mov	QWORD PTR -24[rbp], rax
	lea	rax, eb_filter1f1f[rip]
	mov	QWORD PTR -80[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -72[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 16
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -64[rbp], rax
	lea	rdx, -80[rbp]
	lea	rcx, eb_let[rip]
	mov	rax, QWORD PTR -24[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_let
	mov	QWORD PTR -32[rbp], rax
	mov	rax, QWORD PTR -32[rbp]
	add	rsp, 112
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_filter
	.def	eb_filter;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_filter
eb_filter:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 80
	.seh_stackalloc	80
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	QWORD PTR 24[rbp], rdx
	mov	QWORD PTR 32[rbp], r8
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -8[rbp], rax
	lea	rax, eb_filter1f[rip]
	mov	QWORD PTR -48[rbp], rax
	mov	rax, QWORD PTR 32[rbp]
	mov	QWORD PTR -40[rbp], rax
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -32[rbp], rax
	lea	rdx, -48[rbp]
	lea	rcx, eb_and[rip]
	mov	rax, QWORD PTR -8[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_and
	mov	QWORD PTR -16[rbp], rax
	mov	rax, QWORD PTR -16[rbp]
	add	rsp, 80
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_contains1f1f1f
	.def	eb_contains1f1f1f;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_contains1f1f1f
eb_contains1f1f1f:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 64
	.seh_stackalloc	64
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	QWORD PTR 24[rbp], rdx
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -8[rbp], rax
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -16[rbp], rax
	mov	rax, QWORD PTR -8[rbp]
	mov	rax, QWORD PTR [rax]
	mov	r8, rax
	mov	rdx, QWORD PTR -16[rbp]
	mov	rax, QWORD PTR -8[rbp]
	mov	rcx, rax
	call	r8
	mov	QWORD PTR -24[rbp], rax
	mov	rax, QWORD PTR -24[rbp]
	add	rsp, 64
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_contains1f1f
	.def	eb_contains1f1f;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_contains1f1f
eb_contains1f1f:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 80
	.seh_stackalloc	80
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 16
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -8[rbp], rax
	lea	rcx, eb_cdr[rip]
	mov	rax, QWORD PTR -8[rbp]
	mov	rdx, rax
	call	eb_cdr
	mov	QWORD PTR -16[rbp], rax
	lea	rax, eb_contains1f1f1f[rip]
	mov	QWORD PTR -48[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -40[rbp], rax
	lea	rdx, -48[rbp]
	lea	rcx, eb_contains[rip]
	mov	rax, QWORD PTR -16[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_contains
	mov	QWORD PTR -24[rbp], rax
	mov	rax, QWORD PTR -24[rbp]
	add	rsp, 80
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_contains1f
	.def	eb_contains1f;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_contains1f
eb_contains1f:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 96
	.seh_stackalloc	96
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -8[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 16
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -16[rbp], rax
	lea	rcx, eb_car[rip]
	mov	rax, QWORD PTR -16[rbp]
	mov	rdx, rax
	call	eb_car
	mov	QWORD PTR -24[rbp], rax
	mov	rax, QWORD PTR -8[rbp]
	mov	rax, QWORD PTR [rax]
	mov	r8, rax
	mov	rdx, QWORD PTR -24[rbp]
	mov	rax, QWORD PTR -8[rbp]
	mov	rcx, rax
	call	r8
	mov	QWORD PTR -32[rbp], rax
	lea	rax, eb_contains1f1f[rip]
	mov	QWORD PTR -64[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -56[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 16
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -48[rbp], rax
	lea	rdx, -64[rbp]
	lea	rcx, eb_or[rip]
	mov	rax, QWORD PTR -32[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_or
	mov	QWORD PTR -40[rbp], rax
	mov	rax, QWORD PTR -40[rbp]
	add	rsp, 96
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_contains
	.def	eb_contains;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_contains
eb_contains:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 80
	.seh_stackalloc	80
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	QWORD PTR 24[rbp], rdx
	mov	QWORD PTR 32[rbp], r8
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -8[rbp], rax
	lea	rax, eb_contains1f[rip]
	mov	QWORD PTR -48[rbp], rax
	mov	rax, QWORD PTR 32[rbp]
	mov	QWORD PTR -40[rbp], rax
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -32[rbp], rax
	lea	rdx, -48[rbp]
	lea	rcx, eb_and[rip]
	mov	rax, QWORD PTR -8[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_and
	mov	QWORD PTR -16[rbp], rax
	mov	rax, QWORD PTR -16[rbp]
	add	rsp, 80
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_length1f
	.def	eb_length1f;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_length1f
eb_length1f:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 80
	.seh_stackalloc	80
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	QWORD PTR -8[rbp], 1
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -16[rbp], rax
	lea	rcx, eb_cdr[rip]
	mov	rax, QWORD PTR -16[rbp]
	mov	rdx, rax
	call	eb_cdr
	mov	QWORD PTR -24[rbp], rax
	lea	rcx, eb_length[rip]
	mov	rax, QWORD PTR -24[rbp]
	mov	rdx, rax
	call	eb_length
	mov	QWORD PTR -32[rbp], rax
	lea	rcx, eb_add[rip]
	mov	rdx, QWORD PTR -32[rbp]
	mov	rax, QWORD PTR -8[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_add
	mov	QWORD PTR -40[rbp], rax
	mov	rax, QWORD PTR -40[rbp]
	add	rsp, 80
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_length
	.def	eb_length;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_length
eb_length:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 64
	.seh_stackalloc	64
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	QWORD PTR 24[rbp], rdx
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -8[rbp], rax
	lea	rax, eb_length1f[rip]
	mov	QWORD PTR -32[rbp], rax
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -24[rbp], rax
	lea	rdx, -32[rbp]
	lea	rcx, eb_and[rip]
	mov	rax, QWORD PTR -8[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_and
	mov	QWORD PTR -16[rbp], rax
	mov	rax, QWORD PTR -16[rbp]
	add	rsp, 64
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_put_line
	.def	eb_put_line;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_put_line
eb_put_line:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 48
	.seh_stackalloc	48
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	QWORD PTR -8[rbp], 10
	lea	rcx, eb_putchar[rip]
	mov	rax, QWORD PTR -8[rbp]
	mov	rdx, rax
	call	eb_putchar
	mov	QWORD PTR -16[rbp], rax
	mov	rax, QWORD PTR -16[rbp]
	add	rsp, 48
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_put_str1f
	.def	eb_put_str1f;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_put_str1f
eb_put_str1f:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 48
	.seh_stackalloc	48
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	QWORD PTR 24[rbp], rdx
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -8[rbp], rax
	lea	rcx, eb_putchar[rip]
	mov	rax, QWORD PTR -8[rbp]
	mov	rdx, rax
	call	eb_putchar
	mov	QWORD PTR -16[rbp], rax
	mov	rax, QWORD PTR -16[rbp]
	add	rsp, 48
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_put_str
	.def	eb_put_str;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_put_str
eb_put_str:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 64
	.seh_stackalloc	64
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	QWORD PTR 24[rbp], rdx
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -8[rbp], rax
	lea	rax, eb_put_str1f[rip]
	mov	QWORD PTR -24[rbp], rax
	lea	rdx, -24[rbp]
	lea	rcx, eb_for[rip]
	mov	rax, QWORD PTR -8[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_for
	mov	QWORD PTR -16[rbp], rax
	mov	rax, QWORD PTR -16[rbp]
	add	rsp, 64
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_put_digit
	.def	eb_put_digit;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_put_digit
eb_put_digit:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 80
	.seh_stackalloc	80
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	QWORD PTR 24[rbp], rdx
	mov	QWORD PTR -8[rbp], 48
	mov	QWORD PTR -16[rbp], 10
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -24[rbp], rax
	lea	rcx, eb_mod[rip]
	mov	rdx, QWORD PTR -24[rbp]
	mov	rax, QWORD PTR -16[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_mod
	mov	QWORD PTR -32[rbp], rax
	lea	rcx, eb_add[rip]
	mov	rdx, QWORD PTR -32[rbp]
	mov	rax, QWORD PTR -8[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_add
	mov	QWORD PTR -40[rbp], rax
	lea	rcx, eb_putchar[rip]
	mov	rax, QWORD PTR -40[rbp]
	mov	rdx, rax
	call	eb_putchar
	mov	QWORD PTR -48[rbp], rax
	mov	rax, QWORD PTR -48[rbp]
	add	rsp, 80
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_put_num_nonzero1f
	.def	eb_put_num_nonzero1f;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_put_num_nonzero1f
eb_put_num_nonzero1f:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 96
	.seh_stackalloc	96
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	QWORD PTR -8[rbp], 10
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -16[rbp], rax
	lea	rcx, eb_div[rip]
	mov	rdx, QWORD PTR -16[rbp]
	mov	rax, QWORD PTR -8[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_div
	mov	QWORD PTR -24[rbp], rax
	lea	rcx, eb_put_num_nonzero[rip]
	mov	rax, QWORD PTR -24[rbp]
	mov	rdx, rax
	call	eb_put_num_nonzero
	mov	QWORD PTR -32[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -40[rbp], rax
	lea	rcx, eb_put_digit[rip]
	mov	rax, QWORD PTR -40[rbp]
	mov	rdx, rax
	call	eb_put_digit
	mov	QWORD PTR -48[rbp], rax
	lea	rcx, eb_do[rip]
	mov	rdx, QWORD PTR -48[rbp]
	mov	rax, QWORD PTR -32[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_do
	mov	QWORD PTR -56[rbp], rax
	mov	rax, QWORD PTR -56[rbp]
	add	rsp, 96
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_put_num_nonzero
	.def	eb_put_num_nonzero;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_put_num_nonzero
eb_put_num_nonzero:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 80
	.seh_stackalloc	80
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	QWORD PTR 24[rbp], rdx
	mov	QWORD PTR -8[rbp], 0
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -16[rbp], rax
	lea	rcx, eb_equal[rip]
	mov	rdx, QWORD PTR -16[rbp]
	mov	rax, QWORD PTR -8[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_equal
	mov	QWORD PTR -24[rbp], rax
	lea	rax, eb_put_num_nonzero1f[rip]
	mov	QWORD PTR -48[rbp], rax
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -40[rbp], rax
	lea	rdx, -48[rbp]
	lea	rcx, eb_or[rip]
	mov	rax, QWORD PTR -24[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_or
	mov	QWORD PTR -32[rbp], rax
	mov	rax, QWORD PTR -32[rbp]
	add	rsp, 80
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_put_num1f
	.def	eb_put_num1f;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_put_num1f
eb_put_num1f:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 48
	.seh_stackalloc	48
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -8[rbp], rax
	lea	rcx, eb_put_num_nonzero[rip]
	mov	rax, QWORD PTR -8[rbp]
	mov	rdx, rax
	call	eb_put_num_nonzero
	mov	QWORD PTR -16[rbp], rax
	mov	rax, QWORD PTR -16[rbp]
	add	rsp, 48
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_put_num2f
	.def	eb_put_num2f;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_put_num2f
eb_put_num2f:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 48
	.seh_stackalloc	48
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	QWORD PTR -8[rbp], 0
	lea	rcx, eb_put_digit[rip]
	mov	rax, QWORD PTR -8[rbp]
	mov	rdx, rax
	call	eb_put_digit
	mov	QWORD PTR -16[rbp], rax
	mov	rax, QWORD PTR -16[rbp]
	add	rsp, 48
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_put_num
	.def	eb_put_num;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_put_num
eb_put_num:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 80
	.seh_stackalloc	80
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	QWORD PTR 24[rbp], rdx
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -8[rbp], rax
	lea	rax, eb_put_num1f[rip]
	mov	QWORD PTR -32[rbp], rax
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -24[rbp], rax
	lea	rax, eb_put_num2f[rip]
	mov	QWORD PTR -40[rbp], rax
	lea	r8, -40[rbp]
	lea	rdx, -32[rbp]
	lea	rcx, eb_if[rip]
	mov	rax, QWORD PTR -8[rbp]
	mov	r9, r8
	mov	r8, rdx
	mov	rdx, rax
	call	eb_if
	mov	QWORD PTR -16[rbp], rax
	mov	rax, QWORD PTR -16[rbp]
	add	rsp, 80
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_put_list_sep_from1f01f
	.def	eb_put_list_sep_from1f01f;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_put_list_sep_from1f01f
eb_put_list_sep_from1f01f:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 48
	.seh_stackalloc	48
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -8[rbp], rax
	mov	rax, QWORD PTR -8[rbp]
	mov	rax, QWORD PTR [rax]
	mov	rdx, rax
	mov	rax, QWORD PTR -8[rbp]
	mov	rcx, rax
	call	rdx
	mov	QWORD PTR -16[rbp], rax
	mov	rax, QWORD PTR -16[rbp]
	add	rsp, 48
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_put_list_sep_from1f112f
	.def	eb_put_list_sep_from1f112f;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_put_list_sep_from1f112f
eb_put_list_sep_from1f112f:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 48
	.seh_stackalloc	48
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -8[rbp], rax
	mov	rax, QWORD PTR -8[rbp]
	mov	rax, QWORD PTR [rax]
	mov	rdx, rax
	mov	rax, QWORD PTR -8[rbp]
	mov	rcx, rax
	call	rdx
	mov	QWORD PTR -16[rbp], rax
	mov	rax, QWORD PTR -16[rbp]
	add	rsp, 48
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_put_list_sep_from1f113f
	.def	eb_put_list_sep_from1f113f;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_put_list_sep_from1f113f
eb_put_list_sep_from1f113f:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 64
	.seh_stackalloc	64
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	QWORD PTR 24[rbp], rdx
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -8[rbp], rax
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -16[rbp], rax
	mov	rax, QWORD PTR -8[rbp]
	mov	rax, QWORD PTR [rax]
	mov	r8, rax
	mov	rdx, QWORD PTR -16[rbp]
	mov	rax, QWORD PTR -8[rbp]
	mov	rcx, rax
	call	r8
	mov	QWORD PTR -24[rbp], rax
	mov	rax, QWORD PTR -24[rbp]
	add	rsp, 64
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_put_list_sep_from1f
	.def	eb_put_list_sep_from1f;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_put_list_sep_from1f
eb_put_list_sep_from1f:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 208
	.seh_stackalloc	208
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 32
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -8[rbp], rax
	lea	rax, eb_put_list_sep_from1f01f[rip]
	mov	QWORD PTR -128[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 16
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -120[rbp], rax
	lea	rdx, -128[rbp]
	lea	rcx, eb_and[rip]
	mov	rax, QWORD PTR -8[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_and
	mov	QWORD PTR -16[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -24[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 24
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -32[rbp], rax
	lea	rcx, eb_car[rip]
	mov	rax, QWORD PTR -32[rbp]
	mov	rdx, rax
	call	eb_car
	mov	QWORD PTR -40[rbp], rax
	mov	rax, QWORD PTR -24[rbp]
	mov	rax, QWORD PTR [rax]
	mov	r8, rax
	mov	rdx, QWORD PTR -40[rbp]
	mov	rax, QWORD PTR -24[rbp]
	mov	rcx, rax
	call	r8
	mov	QWORD PTR -48[rbp], rax
	mov	QWORD PTR -56[rbp], 1
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 32
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -64[rbp], rax
	lea	rcx, eb_add[rip]
	mov	rdx, QWORD PTR -64[rbp]
	mov	rax, QWORD PTR -56[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_add
	mov	QWORD PTR -72[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 24
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -80[rbp], rax
	lea	rcx, eb_cdr[rip]
	mov	rax, QWORD PTR -80[rbp]
	mov	rdx, rax
	call	eb_cdr
	mov	QWORD PTR -88[rbp], rax
	lea	rax, eb_put_list_sep_from1f112f[rip]
	mov	QWORD PTR -144[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 16
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -136[rbp], rax
	lea	rax, eb_put_list_sep_from1f113f[rip]
	mov	QWORD PTR -160[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -152[rbp], rax
	lea	rdx, -160[rbp]
	lea	r9, -144[rbp]
	lea	rcx, eb_put_list_sep_from[rip]
	mov	r8, QWORD PTR -88[rbp]
	mov	rax, QWORD PTR -72[rbp]
	mov	QWORD PTR 32[rsp], rdx
	mov	rdx, rax
	call	eb_put_list_sep_from
	mov	QWORD PTR -96[rbp], rax
	lea	rcx, eb_do[rip]
	mov	rdx, QWORD PTR -96[rbp]
	mov	rax, QWORD PTR -48[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_do
	mov	QWORD PTR -104[rbp], rax
	lea	rcx, eb_do[rip]
	mov	rdx, QWORD PTR -104[rbp]
	mov	rax, QWORD PTR -16[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_do
	mov	QWORD PTR -112[rbp], rax
	mov	rax, QWORD PTR -112[rbp]
	add	rsp, 208
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_put_list_sep_from
	.def	eb_put_list_sep_from;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_put_list_sep_from
eb_put_list_sep_from:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 96
	.seh_stackalloc	96
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	QWORD PTR 24[rbp], rdx
	mov	QWORD PTR 32[rbp], r8
	mov	QWORD PTR 40[rbp], r9
	mov	rax, QWORD PTR 32[rbp]
	mov	QWORD PTR -8[rbp], rax
	lea	rax, eb_put_list_sep_from1f[rip]
	mov	QWORD PTR -64[rbp], rax
	mov	rax, QWORD PTR 48[rbp]
	mov	QWORD PTR -56[rbp], rax
	mov	rax, QWORD PTR 40[rbp]
	mov	QWORD PTR -48[rbp], rax
	mov	rax, QWORD PTR 32[rbp]
	mov	QWORD PTR -40[rbp], rax
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -32[rbp], rax
	lea	rdx, -64[rbp]
	lea	rcx, eb_and[rip]
	mov	rax, QWORD PTR -8[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_and
	mov	QWORD PTR -16[rbp], rax
	mov	rax, QWORD PTR -16[rbp]
	add	rsp, 96
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_put_list_sep2f
	.def	eb_put_list_sep2f;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_put_list_sep2f
eb_put_list_sep2f:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 48
	.seh_stackalloc	48
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -8[rbp], rax
	mov	rax, QWORD PTR -8[rbp]
	mov	rax, QWORD PTR [rax]
	mov	rdx, rax
	mov	rax, QWORD PTR -8[rbp]
	mov	rcx, rax
	call	rdx
	mov	QWORD PTR -16[rbp], rax
	mov	rax, QWORD PTR -16[rbp]
	add	rsp, 48
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_put_list_sep3f
	.def	eb_put_list_sep3f;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_put_list_sep3f
eb_put_list_sep3f:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 64
	.seh_stackalloc	64
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	QWORD PTR 24[rbp], rdx
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -8[rbp], rax
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -16[rbp], rax
	mov	rax, QWORD PTR -8[rbp]
	mov	rax, QWORD PTR [rax]
	mov	r8, rax
	mov	rdx, QWORD PTR -16[rbp]
	mov	rax, QWORD PTR -8[rbp]
	mov	rcx, rax
	call	r8
	mov	QWORD PTR -24[rbp], rax
	mov	rax, QWORD PTR -24[rbp]
	add	rsp, 64
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_put_list_sep
	.def	eb_put_list_sep;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_put_list_sep
eb_put_list_sep:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 112
	.seh_stackalloc	112
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	QWORD PTR 24[rbp], rdx
	mov	QWORD PTR 32[rbp], r8
	mov	QWORD PTR 40[rbp], r9
	mov	QWORD PTR -8[rbp], 0
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -16[rbp], rax
	lea	rax, eb_put_list_sep2f[rip]
	mov	QWORD PTR -48[rbp], rax
	mov	rax, QWORD PTR 32[rbp]
	mov	QWORD PTR -40[rbp], rax
	lea	rax, eb_put_list_sep3f[rip]
	mov	QWORD PTR -64[rbp], rax
	mov	rax, QWORD PTR 40[rbp]
	mov	QWORD PTR -56[rbp], rax
	lea	rdx, -64[rbp]
	lea	r9, -48[rbp]
	lea	rcx, eb_put_list_sep_from[rip]
	mov	r8, QWORD PTR -16[rbp]
	mov	rax, QWORD PTR -8[rbp]
	mov	QWORD PTR 32[rsp], rdx
	mov	rdx, rax
	call	eb_put_list_sep_from
	mov	QWORD PTR -24[rbp], rax
	mov	rax, QWORD PTR -24[rbp]
	add	rsp, 112
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_reverse_from1f
	.def	eb_reverse_from1f;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_reverse_from1f
eb_reverse_from1f:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 96
	.seh_stackalloc	96
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 16
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -8[rbp], rax
	lea	rcx, eb_cdr[rip]
	mov	rax, QWORD PTR -8[rbp]
	mov	rdx, rax
	call	eb_cdr
	mov	QWORD PTR -16[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 16
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -24[rbp], rax
	lea	rcx, eb_car[rip]
	mov	rax, QWORD PTR -24[rbp]
	mov	rdx, rax
	call	eb_car
	mov	QWORD PTR -32[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -40[rbp], rax
	lea	rcx, eb_cons[rip]
	mov	rdx, QWORD PTR -40[rbp]
	mov	rax, QWORD PTR -32[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_cons
	mov	QWORD PTR -48[rbp], rax
	lea	rcx, eb_reverse_from[rip]
	mov	rdx, QWORD PTR -48[rbp]
	mov	rax, QWORD PTR -16[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_reverse_from
	mov	QWORD PTR -56[rbp], rax
	mov	rax, QWORD PTR -56[rbp]
	add	rsp, 96
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_reverse_from2f
	.def	eb_reverse_from2f;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_reverse_from2f
eb_reverse_from2f:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 16
	.seh_stackalloc	16
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -8[rbp], rax
	mov	rax, QWORD PTR -8[rbp]
	add	rsp, 16
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_reverse_from
	.def	eb_reverse_from;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_reverse_from
eb_reverse_from:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 96
	.seh_stackalloc	96
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	QWORD PTR 24[rbp], rdx
	mov	QWORD PTR 32[rbp], r8
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -8[rbp], rax
	lea	rax, eb_reverse_from1f[rip]
	mov	QWORD PTR -48[rbp], rax
	mov	rax, QWORD PTR 32[rbp]
	mov	QWORD PTR -40[rbp], rax
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -32[rbp], rax
	lea	rax, eb_reverse_from2f[rip]
	mov	QWORD PTR -64[rbp], rax
	mov	rax, QWORD PTR 32[rbp]
	mov	QWORD PTR -56[rbp], rax
	lea	r8, -64[rbp]
	lea	rdx, -48[rbp]
	lea	rcx, eb_if[rip]
	mov	rax, QWORD PTR -8[rbp]
	mov	r9, r8
	mov	r8, rdx
	mov	rdx, rax
	call	eb_if
	mov	QWORD PTR -16[rbp], rax
	mov	rax, QWORD PTR -16[rbp]
	add	rsp, 96
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_reverse
	.def	eb_reverse;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_reverse
eb_reverse:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 64
	.seh_stackalloc	64
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	QWORD PTR 24[rbp], rdx
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -8[rbp], rax
	mov	QWORD PTR -16[rbp], 0
	lea	rcx, eb_reverse_from[rip]
	mov	rdx, QWORD PTR -16[rbp]
	mov	rax, QWORD PTR -8[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_reverse_from
	mov	QWORD PTR -24[rbp], rax
	mov	rax, QWORD PTR -24[rbp]
	add	rsp, 64
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_concat1f
	.def	eb_concat1f;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_concat1f
eb_concat1f:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 96
	.seh_stackalloc	96
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 16
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -8[rbp], rax
	lea	rcx, eb_car[rip]
	mov	rax, QWORD PTR -8[rbp]
	mov	rdx, rax
	call	eb_car
	mov	QWORD PTR -16[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 16
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -24[rbp], rax
	lea	rcx, eb_cdr[rip]
	mov	rax, QWORD PTR -24[rbp]
	mov	rdx, rax
	call	eb_cdr
	mov	QWORD PTR -32[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -40[rbp], rax
	lea	rcx, eb_concat[rip]
	mov	rdx, QWORD PTR -40[rbp]
	mov	rax, QWORD PTR -32[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_concat
	mov	QWORD PTR -48[rbp], rax
	lea	rcx, eb_cons[rip]
	mov	rdx, QWORD PTR -48[rbp]
	mov	rax, QWORD PTR -16[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_cons
	mov	QWORD PTR -56[rbp], rax
	mov	rax, QWORD PTR -56[rbp]
	add	rsp, 96
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_concat2f
	.def	eb_concat2f;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_concat2f
eb_concat2f:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 16
	.seh_stackalloc	16
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -8[rbp], rax
	mov	rax, QWORD PTR -8[rbp]
	add	rsp, 16
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_concat
	.def	eb_concat;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_concat
eb_concat:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 96
	.seh_stackalloc	96
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	QWORD PTR 24[rbp], rdx
	mov	QWORD PTR 32[rbp], r8
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -8[rbp], rax
	lea	rax, eb_concat1f[rip]
	mov	QWORD PTR -48[rbp], rax
	mov	rax, QWORD PTR 32[rbp]
	mov	QWORD PTR -40[rbp], rax
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -32[rbp], rax
	lea	rax, eb_concat2f[rip]
	mov	QWORD PTR -64[rbp], rax
	mov	rax, QWORD PTR 32[rbp]
	mov	QWORD PTR -56[rbp], rax
	lea	r8, -64[rbp]
	lea	rdx, -48[rbp]
	lea	rcx, eb_if[rip]
	mov	rax, QWORD PTR -8[rbp]
	mov	r9, r8
	mov	r8, rdx
	mov	rdx, rax
	call	eb_if
	mov	QWORD PTR -16[rbp], rax
	mov	rax, QWORD PTR -16[rbp]
	add	rsp, 96
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_flatten2f
	.def	eb_flatten2f;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_flatten2f
eb_flatten2f:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 64
	.seh_stackalloc	64
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	QWORD PTR 24[rbp], rdx
	mov	QWORD PTR 32[rbp], r8
	mov	rax, QWORD PTR 32[rbp]
	mov	QWORD PTR -8[rbp], rax
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -16[rbp], rax
	lea	rcx, eb_concat[rip]
	mov	rdx, QWORD PTR -16[rbp]
	mov	rax, QWORD PTR -8[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_concat
	mov	QWORD PTR -24[rbp], rax
	mov	rax, QWORD PTR -24[rbp]
	add	rsp, 64
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_flatten
	.def	eb_flatten;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_flatten
eb_flatten:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 64
	.seh_stackalloc	64
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	QWORD PTR 24[rbp], rdx
	mov	QWORD PTR -8[rbp], 0
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -16[rbp], rax
	lea	rax, eb_flatten2f[rip]
	mov	QWORD PTR -32[rbp], rax
	lea	r8, -32[rbp]
	lea	rcx, eb_fold[rip]
	mov	rdx, QWORD PTR -16[rbp]
	mov	rax, QWORD PTR -8[rbp]
	mov	r9, r8
	mov	r8, rdx
	mov	rdx, rax
	call	eb_fold
	mov	QWORD PTR -24[rbp], rax
	mov	rax, QWORD PTR -24[rbp]
	add	rsp, 64
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_str_eq1f1f1f
	.def	eb_str_eq1f1f1f;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_str_eq1f1f1f
eb_str_eq1f1f1f:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 80
	.seh_stackalloc	80
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 16
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -8[rbp], rax
	lea	rcx, eb_cdr[rip]
	mov	rax, QWORD PTR -8[rbp]
	mov	rdx, rax
	call	eb_cdr
	mov	QWORD PTR -16[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -24[rbp], rax
	lea	rcx, eb_cdr[rip]
	mov	rax, QWORD PTR -24[rbp]
	mov	rdx, rax
	call	eb_cdr
	mov	QWORD PTR -32[rbp], rax
	lea	rcx, eb_str_eq[rip]
	mov	rdx, QWORD PTR -32[rbp]
	mov	rax, QWORD PTR -16[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_str_eq
	mov	QWORD PTR -40[rbp], rax
	mov	rax, QWORD PTR -40[rbp]
	add	rsp, 80
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_str_eq1f1f
	.def	eb_str_eq1f1f;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_str_eq1f1f
eb_str_eq1f1f:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 112
	.seh_stackalloc	112
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 16
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -8[rbp], rax
	lea	rcx, eb_car[rip]
	mov	rax, QWORD PTR -8[rbp]
	mov	rdx, rax
	call	eb_car
	mov	QWORD PTR -16[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -24[rbp], rax
	lea	rcx, eb_car[rip]
	mov	rax, QWORD PTR -24[rbp]
	mov	rdx, rax
	call	eb_car
	mov	QWORD PTR -32[rbp], rax
	lea	rcx, eb_equal[rip]
	mov	rdx, QWORD PTR -32[rbp]
	mov	rax, QWORD PTR -16[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_equal
	mov	QWORD PTR -40[rbp], rax
	lea	rax, eb_str_eq1f1f1f[rip]
	mov	QWORD PTR -80[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -72[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 16
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -64[rbp], rax
	lea	rdx, -80[rbp]
	lea	rcx, eb_and[rip]
	mov	rax, QWORD PTR -40[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_and
	mov	QWORD PTR -48[rbp], rax
	mov	rax, QWORD PTR -48[rbp]
	add	rsp, 112
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_str_eq1f2f
	.def	eb_str_eq1f2f;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_str_eq1f2f
eb_str_eq1f2f:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 16
	.seh_stackalloc	16
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	QWORD PTR -8[rbp], 0
	mov	rax, QWORD PTR -8[rbp]
	add	rsp, 16
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_str_eq1f
	.def	eb_str_eq1f;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_str_eq1f
eb_str_eq1f:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 96
	.seh_stackalloc	96
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -8[rbp], rax
	lea	rax, eb_str_eq1f1f[rip]
	mov	QWORD PTR -48[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -40[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 16
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -32[rbp], rax
	lea	rax, eb_str_eq1f2f[rip]
	mov	QWORD PTR -56[rbp], rax
	lea	r8, -56[rbp]
	lea	rdx, -48[rbp]
	lea	rcx, eb_if[rip]
	mov	rax, QWORD PTR -8[rbp]
	mov	r9, r8
	mov	r8, rdx
	mov	rdx, rax
	call	eb_if
	mov	QWORD PTR -16[rbp], rax
	mov	rax, QWORD PTR -16[rbp]
	add	rsp, 96
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_str_eq2f1f
	.def	eb_str_eq2f1f;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_str_eq2f1f
eb_str_eq2f1f:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 16
	.seh_stackalloc	16
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	QWORD PTR -8[rbp], 0
	mov	rax, QWORD PTR -8[rbp]
	add	rsp, 16
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_str_eq2f2f
	.def	eb_str_eq2f2f;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_str_eq2f2f
eb_str_eq2f2f:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 16
	.seh_stackalloc	16
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	QWORD PTR -8[rbp], 1
	mov	rax, QWORD PTR -8[rbp]
	add	rsp, 16
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_str_eq2f
	.def	eb_str_eq2f;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_str_eq2f
eb_str_eq2f:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 64
	.seh_stackalloc	64
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -8[rbp], rax
	lea	rax, eb_str_eq2f1f[rip]
	mov	QWORD PTR -24[rbp], rax
	lea	rax, eb_str_eq2f2f[rip]
	mov	QWORD PTR -32[rbp], rax
	lea	r8, -32[rbp]
	lea	rdx, -24[rbp]
	lea	rcx, eb_if[rip]
	mov	rax, QWORD PTR -8[rbp]
	mov	r9, r8
	mov	r8, rdx
	mov	rdx, rax
	call	eb_if
	mov	QWORD PTR -16[rbp], rax
	mov	rax, QWORD PTR -16[rbp]
	add	rsp, 64
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_str_eq
	.def	eb_str_eq;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_str_eq
eb_str_eq:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 96
	.seh_stackalloc	96
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	QWORD PTR 24[rbp], rdx
	mov	QWORD PTR 32[rbp], r8
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -8[rbp], rax
	lea	rax, eb_str_eq1f[rip]
	mov	QWORD PTR -48[rbp], rax
	mov	rax, QWORD PTR 32[rbp]
	mov	QWORD PTR -40[rbp], rax
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -32[rbp], rax
	lea	rax, eb_str_eq2f[rip]
	mov	QWORD PTR -64[rbp], rax
	mov	rax, QWORD PTR 32[rbp]
	mov	QWORD PTR -56[rbp], rax
	lea	r8, -64[rbp]
	lea	rdx, -48[rbp]
	lea	rcx, eb_if[rip]
	mov	rax, QWORD PTR -8[rbp]
	mov	r9, r8
	mov	r8, rdx
	mov	rdx, rax
	call	eb_if
	mov	QWORD PTR -16[rbp], rax
	mov	rax, QWORD PTR -16[rbp]
	add	rsp, 96
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_has_str1f1f
	.def	eb_has_str1f1f;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_has_str1f1f
eb_has_str1f1f:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 64
	.seh_stackalloc	64
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 16
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -8[rbp], rax
	lea	rcx, eb_cdr[rip]
	mov	rax, QWORD PTR -8[rbp]
	mov	rdx, rax
	call	eb_cdr
	mov	QWORD PTR -16[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -24[rbp], rax
	lea	rcx, eb_has_str[rip]
	mov	rdx, QWORD PTR -24[rbp]
	mov	rax, QWORD PTR -16[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_has_str
	mov	QWORD PTR -32[rbp], rax
	mov	rax, QWORD PTR -32[rbp]
	add	rsp, 64
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_has_str1f
	.def	eb_has_str1f;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_has_str1f
eb_has_str1f:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 96
	.seh_stackalloc	96
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -8[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 16
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -16[rbp], rax
	lea	rcx, eb_car[rip]
	mov	rax, QWORD PTR -16[rbp]
	mov	rdx, rax
	call	eb_car
	mov	QWORD PTR -24[rbp], rax
	lea	rcx, eb_str_eq[rip]
	mov	rdx, QWORD PTR -24[rbp]
	mov	rax, QWORD PTR -8[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_str_eq
	mov	QWORD PTR -32[rbp], rax
	lea	rax, eb_has_str1f1f[rip]
	mov	QWORD PTR -64[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -56[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 16
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -48[rbp], rax
	lea	rdx, -64[rbp]
	lea	rcx, eb_or[rip]
	mov	rax, QWORD PTR -32[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_or
	mov	QWORD PTR -40[rbp], rax
	mov	rax, QWORD PTR -40[rbp]
	add	rsp, 96
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_has_str
	.def	eb_has_str;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_has_str
eb_has_str:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 80
	.seh_stackalloc	80
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	QWORD PTR 24[rbp], rdx
	mov	QWORD PTR 32[rbp], r8
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -8[rbp], rax
	lea	rax, eb_has_str1f[rip]
	mov	QWORD PTR -48[rbp], rax
	mov	rax, QWORD PTR 32[rbp]
	mov	QWORD PTR -40[rbp], rax
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -32[rbp], rax
	lea	rdx, -48[rbp]
	lea	rcx, eb_and[rip]
	mov	rax, QWORD PTR -8[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_and
	mov	QWORD PTR -16[rbp], rax
	mov	rax, QWORD PTR -16[rbp]
	add	rsp, 80
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_uniq_str_add1f
	.def	eb_uniq_str_add1f;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_uniq_str_add1f
eb_uniq_str_add1f:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 16
	.seh_stackalloc	16
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -8[rbp], rax
	mov	rax, QWORD PTR -8[rbp]
	add	rsp, 16
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_uniq_str_add2f
	.def	eb_uniq_str_add2f;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_uniq_str_add2f
eb_uniq_str_add2f:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 64
	.seh_stackalloc	64
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -8[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 16
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -16[rbp], rax
	lea	rcx, eb_cons[rip]
	mov	rdx, QWORD PTR -16[rbp]
	mov	rax, QWORD PTR -8[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_cons
	mov	QWORD PTR -24[rbp], rax
	mov	rax, QWORD PTR -24[rbp]
	add	rsp, 64
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_uniq_str_add
	.def	eb_uniq_str_add;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_uniq_str_add
eb_uniq_str_add:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 112
	.seh_stackalloc	112
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	QWORD PTR 24[rbp], rdx
	mov	QWORD PTR 32[rbp], r8
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -8[rbp], rax
	mov	rax, QWORD PTR 32[rbp]
	mov	QWORD PTR -16[rbp], rax
	lea	rcx, eb_has_str[rip]
	mov	rdx, QWORD PTR -16[rbp]
	mov	rax, QWORD PTR -8[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_has_str
	mov	QWORD PTR -24[rbp], rax
	lea	rax, eb_uniq_str_add1f[rip]
	mov	QWORD PTR -48[rbp], rax
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -40[rbp], rax
	lea	rax, eb_uniq_str_add2f[rip]
	mov	QWORD PTR -80[rbp], rax
	mov	rax, QWORD PTR 32[rbp]
	mov	QWORD PTR -72[rbp], rax
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -64[rbp], rax
	lea	r8, -80[rbp]
	lea	rdx, -48[rbp]
	lea	rcx, eb_if[rip]
	mov	rax, QWORD PTR -24[rbp]
	mov	r9, r8
	mov	r8, rdx
	mov	rdx, rax
	call	eb_if
	mov	QWORD PTR -32[rbp], rax
	mov	rax, QWORD PTR -32[rbp]
	add	rsp, 112
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_uniq_str2f
	.def	eb_uniq_str2f;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_uniq_str2f
eb_uniq_str2f:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 64
	.seh_stackalloc	64
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	QWORD PTR 24[rbp], rdx
	mov	QWORD PTR 32[rbp], r8
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -8[rbp], rax
	mov	rax, QWORD PTR 32[rbp]
	mov	QWORD PTR -16[rbp], rax
	lea	rcx, eb_uniq_str_add[rip]
	mov	rdx, QWORD PTR -16[rbp]
	mov	rax, QWORD PTR -8[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_uniq_str_add
	mov	QWORD PTR -24[rbp], rax
	mov	rax, QWORD PTR -24[rbp]
	add	rsp, 64
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_uniq_str
	.def	eb_uniq_str;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_uniq_str
eb_uniq_str:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 64
	.seh_stackalloc	64
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	QWORD PTR 24[rbp], rdx
	mov	QWORD PTR -8[rbp], 0
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -16[rbp], rax
	lea	rax, eb_uniq_str2f[rip]
	mov	QWORD PTR -32[rbp], rax
	lea	r8, -32[rbp]
	lea	rcx, eb_fold[rip]
	mov	rdx, QWORD PTR -16[rbp]
	mov	rax, QWORD PTR -8[rbp]
	mov	r9, r8
	mov	r8, rdx
	mov	rdx, rax
	call	eb_fold
	mov	QWORD PTR -24[rbp], rax
	mov	rax, QWORD PTR -24[rbp]
	add	rsp, 64
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_num_to_str_nonzero1f
	.def	eb_num_to_str_nonzero1f;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_num_to_str_nonzero1f
eb_num_to_str_nonzero1f:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	add	rsp, -128
	.seh_stackalloc	128
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	QWORD PTR -8[rbp], 10
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -16[rbp], rax
	lea	rcx, eb_div[rip]
	mov	rdx, QWORD PTR -16[rbp]
	mov	rax, QWORD PTR -8[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_div
	mov	QWORD PTR -24[rbp], rax
	lea	rcx, eb_num_to_str_nonzero[rip]
	mov	rax, QWORD PTR -24[rbp]
	mov	rdx, rax
	call	eb_num_to_str_nonzero
	mov	QWORD PTR -32[rbp], rax
	mov	QWORD PTR -40[rbp], 48
	mov	QWORD PTR -48[rbp], 10
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -56[rbp], rax
	lea	rcx, eb_mod[rip]
	mov	rdx, QWORD PTR -56[rbp]
	mov	rax, QWORD PTR -48[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_mod
	mov	QWORD PTR -64[rbp], rax
	lea	rcx, eb_add[rip]
	mov	rdx, QWORD PTR -64[rbp]
	mov	rax, QWORD PTR -40[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_add
	mov	QWORD PTR -72[rbp], rax
	mov	QWORD PTR -80[rbp], 0
	lea	rcx, eb_cons[rip]
	mov	rdx, QWORD PTR -80[rbp]
	mov	rax, QWORD PTR -72[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_cons
	mov	QWORD PTR -88[rbp], rax
	lea	rcx, eb_concat[rip]
	mov	rdx, QWORD PTR -88[rbp]
	mov	rax, QWORD PTR -32[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_concat
	mov	QWORD PTR -96[rbp], rax
	mov	rax, QWORD PTR -96[rbp]
	sub	rsp, -128
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_num_to_str_nonzero
	.def	eb_num_to_str_nonzero;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_num_to_str_nonzero
eb_num_to_str_nonzero:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 80
	.seh_stackalloc	80
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	QWORD PTR 24[rbp], rdx
	mov	QWORD PTR -8[rbp], 0
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -16[rbp], rax
	lea	rcx, eb_equal[rip]
	mov	rdx, QWORD PTR -16[rbp]
	mov	rax, QWORD PTR -8[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_equal
	mov	QWORD PTR -24[rbp], rax
	lea	rax, eb_num_to_str_nonzero1f[rip]
	mov	QWORD PTR -48[rbp], rax
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -40[rbp], rax
	lea	rdx, -48[rbp]
	lea	rcx, eb_or[rip]
	mov	rax, QWORD PTR -24[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_or
	mov	QWORD PTR -32[rbp], rax
	mov	rax, QWORD PTR -32[rbp]
	add	rsp, 80
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_num_to_str1f
	.def	eb_num_to_str1f;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_num_to_str1f
eb_num_to_str1f:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 48
	.seh_stackalloc	48
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -8[rbp], rax
	lea	rcx, eb_num_to_str_nonzero[rip]
	mov	rax, QWORD PTR -8[rbp]
	mov	rdx, rax
	call	eb_num_to_str_nonzero
	mov	QWORD PTR -16[rbp], rax
	mov	rax, QWORD PTR -16[rbp]
	add	rsp, 48
	pop	rbp
	ret
	.seh_endproc
	.section .rdata,"dr"
.LC2:
	.ascii "0\0"
	.text
	.globl	eb_num_to_str2f
	.def	eb_num_to_str2f;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_num_to_str2f
eb_num_to_str2f:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 32
	.seh_stackalloc	32
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	lea	rax, .LC2[rip]
	mov	rdx, rax
	lea	rax, eb_num_to_str2f.87[rip]
	mov	rcx, rax
	call	ebz_stol
	mov	rax, QWORD PTR eb_num_to_str2f.87[rip]
	add	rsp, 32
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_num_to_str
	.def	eb_num_to_str;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_num_to_str
eb_num_to_str:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 80
	.seh_stackalloc	80
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	QWORD PTR 24[rbp], rdx
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -8[rbp], rax
	lea	rax, eb_num_to_str1f[rip]
	mov	QWORD PTR -32[rbp], rax
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -24[rbp], rax
	lea	rax, eb_num_to_str2f[rip]
	mov	QWORD PTR -40[rbp], rax
	lea	r8, -40[rbp]
	lea	rdx, -32[rbp]
	lea	rcx, eb_if[rip]
	mov	rax, QWORD PTR -8[rbp]
	mov	r9, r8
	mov	r8, rdx
	mov	rdx, rax
	call	eb_if
	mov	QWORD PTR -16[rbp], rax
	mov	rax, QWORD PTR -16[rbp]
	add	rsp, 80
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_rstr_to_num1f
	.def	eb_rstr_to_num1f;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_rstr_to_num1f
eb_rstr_to_num1f:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 112
	.seh_stackalloc	112
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	QWORD PTR -8[rbp], 10
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -16[rbp], rax
	lea	rcx, eb_cdr[rip]
	mov	rax, QWORD PTR -16[rbp]
	mov	rdx, rax
	call	eb_cdr
	mov	QWORD PTR -24[rbp], rax
	lea	rcx, eb_rstr_to_num[rip]
	mov	rax, QWORD PTR -24[rbp]
	mov	rdx, rax
	call	eb_rstr_to_num
	mov	QWORD PTR -32[rbp], rax
	lea	rcx, eb_mul[rip]
	mov	rdx, QWORD PTR -32[rbp]
	mov	rax, QWORD PTR -8[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_mul
	mov	QWORD PTR -40[rbp], rax
	mov	QWORD PTR -48[rbp], 48
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -56[rbp], rax
	lea	rcx, eb_car[rip]
	mov	rax, QWORD PTR -56[rbp]
	mov	rdx, rax
	call	eb_car
	mov	QWORD PTR -64[rbp], rax
	lea	rcx, eb_sub[rip]
	mov	rdx, QWORD PTR -64[rbp]
	mov	rax, QWORD PTR -48[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_sub
	mov	QWORD PTR -72[rbp], rax
	lea	rcx, eb_add[rip]
	mov	rdx, QWORD PTR -72[rbp]
	mov	rax, QWORD PTR -40[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_add
	mov	QWORD PTR -80[rbp], rax
	mov	rax, QWORD PTR -80[rbp]
	add	rsp, 112
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_rstr_to_num
	.def	eb_rstr_to_num;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_rstr_to_num
eb_rstr_to_num:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 64
	.seh_stackalloc	64
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	QWORD PTR 24[rbp], rdx
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -8[rbp], rax
	lea	rax, eb_rstr_to_num1f[rip]
	mov	QWORD PTR -32[rbp], rax
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -24[rbp], rax
	lea	rdx, -32[rbp]
	lea	rcx, eb_and[rip]
	mov	rax, QWORD PTR -8[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_and
	mov	QWORD PTR -16[rbp], rax
	mov	rax, QWORD PTR -16[rbp]
	add	rsp, 64
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_str_to_num
	.def	eb_str_to_num;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_str_to_num
eb_str_to_num:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 64
	.seh_stackalloc	64
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	QWORD PTR 24[rbp], rdx
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -8[rbp], rax
	lea	rcx, eb_reverse[rip]
	mov	rax, QWORD PTR -8[rbp]
	mov	rdx, rax
	call	eb_reverse
	mov	QWORD PTR -16[rbp], rax
	lea	rcx, eb_rstr_to_num[rip]
	mov	rax, QWORD PTR -16[rbp]
	mov	rdx, rax
	call	eb_rstr_to_num
	mov	QWORD PTR -24[rbp], rax
	mov	rax, QWORD PTR -24[rbp]
	add	rsp, 64
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_error_from_str
	.def	eb_error_from_str;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_error_from_str
eb_error_from_str:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 64
	.seh_stackalloc	64
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	QWORD PTR 24[rbp], rdx
	mov	QWORD PTR -8[rbp], 0
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -16[rbp], rax
	lea	rcx, eb_cons[rip]
	mov	rdx, QWORD PTR -16[rbp]
	mov	rax, QWORD PTR -8[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_cons
	mov	QWORD PTR -24[rbp], rax
	mov	rax, QWORD PTR -24[rbp]
	add	rsp, 64
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_error_from_both
	.def	eb_error_from_both;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_error_from_both
eb_error_from_both:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 80
	.seh_stackalloc	80
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	QWORD PTR 24[rbp], rdx
	mov	QWORD PTR 32[rbp], r8
	mov	QWORD PTR -8[rbp], 1
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -16[rbp], rax
	mov	rax, QWORD PTR 32[rbp]
	mov	QWORD PTR -24[rbp], rax
	lea	rcx, eb_cons[rip]
	mov	rdx, QWORD PTR -24[rbp]
	mov	rax, QWORD PTR -16[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_cons
	mov	QWORD PTR -32[rbp], rax
	lea	rcx, eb_cons[rip]
	mov	rdx, QWORD PTR -32[rbp]
	mov	rax, QWORD PTR -8[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_cons
	mov	QWORD PTR -40[rbp], rax
	mov	rax, QWORD PTR -40[rbp]
	add	rsp, 80
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_error_from_wanted
	.def	eb_error_from_wanted;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_error_from_wanted
eb_error_from_wanted:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 64
	.seh_stackalloc	64
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	QWORD PTR 24[rbp], rdx
	mov	QWORD PTR -8[rbp], 2
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -16[rbp], rax
	lea	rcx, eb_cons[rip]
	mov	rdx, QWORD PTR -16[rbp]
	mov	rax, QWORD PTR -8[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_cons
	mov	QWORD PTR -24[rbp], rax
	mov	rax, QWORD PTR -24[rbp]
	add	rsp, 64
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_error_from_got
	.def	eb_error_from_got;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_error_from_got
eb_error_from_got:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 64
	.seh_stackalloc	64
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	QWORD PTR 24[rbp], rdx
	mov	QWORD PTR -8[rbp], 3
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -16[rbp], rax
	lea	rcx, eb_cons[rip]
	mov	rdx, QWORD PTR -16[rbp]
	mov	rax, QWORD PTR -8[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_cons
	mov	QWORD PTR -24[rbp], rax
	mov	rax, QWORD PTR -24[rbp]
	add	rsp, 64
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_error_from_position
	.def	eb_error_from_position;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_error_from_position
eb_error_from_position:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 80
	.seh_stackalloc	80
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	QWORD PTR 24[rbp], rdx
	mov	QWORD PTR 32[rbp], r8
	mov	QWORD PTR -8[rbp], 4
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -16[rbp], rax
	mov	rax, QWORD PTR 32[rbp]
	mov	QWORD PTR -24[rbp], rax
	lea	rcx, eb_cons[rip]
	mov	rdx, QWORD PTR -24[rbp]
	mov	rax, QWORD PTR -16[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_cons
	mov	QWORD PTR -32[rbp], rax
	lea	rcx, eb_cons[rip]
	mov	rdx, QWORD PTR -32[rbp]
	mov	rax, QWORD PTR -8[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_cons
	mov	QWORD PTR -40[rbp], rax
	mov	rax, QWORD PTR -40[rbp]
	add	rsp, 80
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_error_from_char
	.def	eb_error_from_char;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_error_from_char
eb_error_from_char:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 64
	.seh_stackalloc	64
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	QWORD PTR 24[rbp], rdx
	mov	QWORD PTR -8[rbp], 5
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -16[rbp], rax
	lea	rcx, eb_cons[rip]
	mov	rdx, QWORD PTR -16[rbp]
	mov	rax, QWORD PTR -8[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_cons
	mov	QWORD PTR -24[rbp], rax
	mov	rax, QWORD PTR -24[rbp]
	add	rsp, 64
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_error_is_str
	.def	eb_error_is_str;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_error_is_str
eb_error_is_str:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 64
	.seh_stackalloc	64
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	QWORD PTR 24[rbp], rdx
	mov	QWORD PTR -8[rbp], 0
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -16[rbp], rax
	lea	rcx, eb_car[rip]
	mov	rax, QWORD PTR -16[rbp]
	mov	rdx, rax
	call	eb_car
	mov	QWORD PTR -24[rbp], rax
	lea	rcx, eb_equal[rip]
	mov	rdx, QWORD PTR -24[rbp]
	mov	rax, QWORD PTR -8[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_equal
	mov	QWORD PTR -32[rbp], rax
	mov	rax, QWORD PTR -32[rbp]
	add	rsp, 64
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_error_is_both
	.def	eb_error_is_both;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_error_is_both
eb_error_is_both:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 64
	.seh_stackalloc	64
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	QWORD PTR 24[rbp], rdx
	mov	QWORD PTR -8[rbp], 1
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -16[rbp], rax
	lea	rcx, eb_car[rip]
	mov	rax, QWORD PTR -16[rbp]
	mov	rdx, rax
	call	eb_car
	mov	QWORD PTR -24[rbp], rax
	lea	rcx, eb_equal[rip]
	mov	rdx, QWORD PTR -24[rbp]
	mov	rax, QWORD PTR -8[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_equal
	mov	QWORD PTR -32[rbp], rax
	mov	rax, QWORD PTR -32[rbp]
	add	rsp, 64
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_error_is_wanted
	.def	eb_error_is_wanted;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_error_is_wanted
eb_error_is_wanted:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 64
	.seh_stackalloc	64
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	QWORD PTR 24[rbp], rdx
	mov	QWORD PTR -8[rbp], 2
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -16[rbp], rax
	lea	rcx, eb_car[rip]
	mov	rax, QWORD PTR -16[rbp]
	mov	rdx, rax
	call	eb_car
	mov	QWORD PTR -24[rbp], rax
	lea	rcx, eb_equal[rip]
	mov	rdx, QWORD PTR -24[rbp]
	mov	rax, QWORD PTR -8[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_equal
	mov	QWORD PTR -32[rbp], rax
	mov	rax, QWORD PTR -32[rbp]
	add	rsp, 64
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_error_is_got
	.def	eb_error_is_got;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_error_is_got
eb_error_is_got:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 64
	.seh_stackalloc	64
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	QWORD PTR 24[rbp], rdx
	mov	QWORD PTR -8[rbp], 3
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -16[rbp], rax
	lea	rcx, eb_car[rip]
	mov	rax, QWORD PTR -16[rbp]
	mov	rdx, rax
	call	eb_car
	mov	QWORD PTR -24[rbp], rax
	lea	rcx, eb_equal[rip]
	mov	rdx, QWORD PTR -24[rbp]
	mov	rax, QWORD PTR -8[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_equal
	mov	QWORD PTR -32[rbp], rax
	mov	rax, QWORD PTR -32[rbp]
	add	rsp, 64
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_error_is_position
	.def	eb_error_is_position;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_error_is_position
eb_error_is_position:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 64
	.seh_stackalloc	64
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	QWORD PTR 24[rbp], rdx
	mov	QWORD PTR -8[rbp], 4
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -16[rbp], rax
	lea	rcx, eb_car[rip]
	mov	rax, QWORD PTR -16[rbp]
	mov	rdx, rax
	call	eb_car
	mov	QWORD PTR -24[rbp], rax
	lea	rcx, eb_equal[rip]
	mov	rdx, QWORD PTR -24[rbp]
	mov	rax, QWORD PTR -8[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_equal
	mov	QWORD PTR -32[rbp], rax
	mov	rax, QWORD PTR -32[rbp]
	add	rsp, 64
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_error_is_char
	.def	eb_error_is_char;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_error_is_char
eb_error_is_char:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 64
	.seh_stackalloc	64
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	QWORD PTR 24[rbp], rdx
	mov	QWORD PTR -8[rbp], 5
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -16[rbp], rax
	lea	rcx, eb_car[rip]
	mov	rax, QWORD PTR -16[rbp]
	mov	rdx, rax
	call	eb_car
	mov	QWORD PTR -24[rbp], rax
	lea	rcx, eb_equal[rip]
	mov	rdx, QWORD PTR -24[rbp]
	mov	rax, QWORD PTR -8[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_equal
	mov	QWORD PTR -32[rbp], rax
	mov	rax, QWORD PTR -32[rbp]
	add	rsp, 64
	pop	rbp
	ret
	.seh_endproc
	.section .rdata,"dr"
.LC3:
	.ascii "newline\0"
	.text
	.globl	eb_put_error_body1f1f
	.def	eb_put_error_body1f1f;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_put_error_body1f1f
eb_put_error_body1f1f:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 48
	.seh_stackalloc	48
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	lea	rax, .LC3[rip]
	mov	rdx, rax
	lea	rax, eb_put_error_body1f1f0.86[rip]
	mov	rcx, rax
	call	ebz_stol
	mov	rax, QWORD PTR eb_put_error_body1f1f0.86[rip]
	lea	rcx, eb_put_str[rip]
	mov	rdx, rax
	call	eb_put_str
	mov	QWORD PTR -8[rbp], rax
	mov	rax, QWORD PTR -8[rbp]
	add	rsp, 48
	pop	rbp
	ret
	.seh_endproc
	.section .rdata,"dr"
.LC4:
	.ascii "space\0"
	.text
	.globl	eb_put_error_body1f2f1f
	.def	eb_put_error_body1f2f1f;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_put_error_body1f2f1f
eb_put_error_body1f2f1f:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 48
	.seh_stackalloc	48
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	lea	rax, .LC4[rip]
	mov	rdx, rax
	lea	rax, eb_put_error_body1f2f1f0.85[rip]
	mov	rcx, rax
	call	ebz_stol
	mov	rax, QWORD PTR eb_put_error_body1f2f1f0.85[rip]
	lea	rcx, eb_put_str[rip]
	mov	rdx, rax
	call	eb_put_str
	mov	QWORD PTR -8[rbp], rax
	mov	rax, QWORD PTR -8[rbp]
	add	rsp, 48
	pop	rbp
	ret
	.seh_endproc
	.section .rdata,"dr"
.LC5:
	.ascii "signle quote\0"
	.text
	.globl	eb_put_error_body1f2f2f1f
	.def	eb_put_error_body1f2f2f1f;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_put_error_body1f2f2f1f
eb_put_error_body1f2f2f1f:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 48
	.seh_stackalloc	48
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	lea	rax, .LC5[rip]
	mov	rdx, rax
	lea	rax, eb_put_error_body1f2f2f1f0.84[rip]
	mov	rcx, rax
	call	ebz_stol
	mov	rax, QWORD PTR eb_put_error_body1f2f2f1f0.84[rip]
	lea	rcx, eb_put_str[rip]
	mov	rdx, rax
	call	eb_put_str
	mov	QWORD PTR -8[rbp], rax
	mov	rax, QWORD PTR -8[rbp]
	add	rsp, 48
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_put_error_body1f2f2f2f
	.def	eb_put_error_body1f2f2f2f;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_put_error_body1f2f2f2f
eb_put_error_body1f2f2f2f:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 112
	.seh_stackalloc	112
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	QWORD PTR -8[rbp], 39
	lea	rcx, eb_putchar[rip]
	mov	rax, QWORD PTR -8[rbp]
	mov	rdx, rax
	call	eb_putchar
	mov	QWORD PTR -16[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -24[rbp], rax
	lea	rcx, eb_cdr[rip]
	mov	rax, QWORD PTR -24[rbp]
	mov	rdx, rax
	call	eb_cdr
	mov	QWORD PTR -32[rbp], rax
	lea	rcx, eb_putchar[rip]
	mov	rax, QWORD PTR -32[rbp]
	mov	rdx, rax
	call	eb_putchar
	mov	QWORD PTR -40[rbp], rax
	mov	QWORD PTR -48[rbp], 39
	lea	rcx, eb_putchar[rip]
	mov	rax, QWORD PTR -48[rbp]
	mov	rdx, rax
	call	eb_putchar
	mov	QWORD PTR -56[rbp], rax
	lea	rcx, eb_do[rip]
	mov	rdx, QWORD PTR -56[rbp]
	mov	rax, QWORD PTR -40[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_do
	mov	QWORD PTR -64[rbp], rax
	lea	rcx, eb_do[rip]
	mov	rdx, QWORD PTR -64[rbp]
	mov	rax, QWORD PTR -16[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_do
	mov	QWORD PTR -72[rbp], rax
	mov	rax, QWORD PTR -72[rbp]
	add	rsp, 112
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_put_error_body1f2f2f
	.def	eb_put_error_body1f2f2f;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_put_error_body1f2f2f
eb_put_error_body1f2f2f:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 96
	.seh_stackalloc	96
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	QWORD PTR -8[rbp], 39
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -16[rbp], rax
	lea	rcx, eb_cdr[rip]
	mov	rax, QWORD PTR -16[rbp]
	mov	rdx, rax
	call	eb_cdr
	mov	QWORD PTR -24[rbp], rax
	lea	rcx, eb_equal[rip]
	mov	rdx, QWORD PTR -24[rbp]
	mov	rax, QWORD PTR -8[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_equal
	mov	QWORD PTR -32[rbp], rax
	lea	rax, eb_put_error_body1f2f2f1f[rip]
	mov	QWORD PTR -48[rbp], rax
	lea	rax, eb_put_error_body1f2f2f2f[rip]
	mov	QWORD PTR -64[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -56[rbp], rax
	lea	r8, -64[rbp]
	lea	rdx, -48[rbp]
	lea	rcx, eb_if[rip]
	mov	rax, QWORD PTR -32[rbp]
	mov	r9, r8
	mov	r8, rdx
	mov	rdx, rax
	call	eb_if
	mov	QWORD PTR -40[rbp], rax
	mov	rax, QWORD PTR -40[rbp]
	add	rsp, 96
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_put_error_body1f2f
	.def	eb_put_error_body1f2f;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_put_error_body1f2f
eb_put_error_body1f2f:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 96
	.seh_stackalloc	96
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	QWORD PTR -8[rbp], 32
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -16[rbp], rax
	lea	rcx, eb_cdr[rip]
	mov	rax, QWORD PTR -16[rbp]
	mov	rdx, rax
	call	eb_cdr
	mov	QWORD PTR -24[rbp], rax
	lea	rcx, eb_equal[rip]
	mov	rdx, QWORD PTR -24[rbp]
	mov	rax, QWORD PTR -8[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_equal
	mov	QWORD PTR -32[rbp], rax
	lea	rax, eb_put_error_body1f2f1f[rip]
	mov	QWORD PTR -48[rbp], rax
	lea	rax, eb_put_error_body1f2f2f[rip]
	mov	QWORD PTR -64[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -56[rbp], rax
	lea	r8, -64[rbp]
	lea	rdx, -48[rbp]
	lea	rcx, eb_if[rip]
	mov	rax, QWORD PTR -32[rbp]
	mov	r9, r8
	mov	r8, rdx
	mov	rdx, rax
	call	eb_if
	mov	QWORD PTR -40[rbp], rax
	mov	rax, QWORD PTR -40[rbp]
	add	rsp, 96
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_put_error_body1f
	.def	eb_put_error_body1f;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_put_error_body1f
eb_put_error_body1f:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 96
	.seh_stackalloc	96
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	QWORD PTR -8[rbp], 10
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -16[rbp], rax
	lea	rcx, eb_cdr[rip]
	mov	rax, QWORD PTR -16[rbp]
	mov	rdx, rax
	call	eb_cdr
	mov	QWORD PTR -24[rbp], rax
	lea	rcx, eb_equal[rip]
	mov	rdx, QWORD PTR -24[rbp]
	mov	rax, QWORD PTR -8[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_equal
	mov	QWORD PTR -32[rbp], rax
	lea	rax, eb_put_error_body1f1f[rip]
	mov	QWORD PTR -48[rbp], rax
	lea	rax, eb_put_error_body1f2f[rip]
	mov	QWORD PTR -64[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -56[rbp], rax
	lea	r8, -64[rbp]
	lea	rdx, -48[rbp]
	lea	rcx, eb_if[rip]
	mov	rax, QWORD PTR -32[rbp]
	mov	r9, r8
	mov	r8, rdx
	mov	rdx, rax
	call	eb_if
	mov	QWORD PTR -40[rbp], rax
	mov	rax, QWORD PTR -40[rbp]
	add	rsp, 96
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_put_error_body2f1f
	.def	eb_put_error_body2f1f;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_put_error_body2f1f
eb_put_error_body2f1f:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 64
	.seh_stackalloc	64
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -8[rbp], rax
	lea	rcx, eb_cdr[rip]
	mov	rax, QWORD PTR -8[rbp]
	mov	rdx, rax
	call	eb_cdr
	mov	QWORD PTR -16[rbp], rax
	lea	rcx, eb_put_str[rip]
	mov	rax, QWORD PTR -16[rbp]
	mov	rdx, rax
	call	eb_put_str
	mov	QWORD PTR -24[rbp], rax
	mov	rax, QWORD PTR -24[rbp]
	add	rsp, 64
	pop	rbp
	ret
	.seh_endproc
	.section .rdata,"dr"
.LC6:
	.ascii " \0"
	.text
	.globl	eb_put_error_body2f2f1f
	.def	eb_put_error_body2f2f1f;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_put_error_body2f2f1f
eb_put_error_body2f2f1f:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	add	rsp, -128
	.seh_stackalloc	128
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -8[rbp], rax
	lea	rcx, eb_cdr[rip]
	mov	rax, QWORD PTR -8[rbp]
	mov	rdx, rax
	call	eb_cdr
	mov	QWORD PTR -16[rbp], rax
	lea	rcx, eb_car[rip]
	mov	rax, QWORD PTR -16[rbp]
	mov	rdx, rax
	call	eb_car
	mov	QWORD PTR -24[rbp], rax
	lea	rcx, eb_put_error_body[rip]
	mov	rax, QWORD PTR -24[rbp]
	mov	rdx, rax
	call	eb_put_error_body
	mov	QWORD PTR -32[rbp], rax
	lea	rax, .LC6[rip]
	mov	rdx, rax
	lea	rax, eb_put_error_body2f2f1f100.83[rip]
	mov	rcx, rax
	call	ebz_stol
	mov	rax, QWORD PTR eb_put_error_body2f2f1f100.83[rip]
	lea	rcx, eb_put_str[rip]
	mov	rdx, rax
	call	eb_put_str
	mov	QWORD PTR -40[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -48[rbp], rax
	lea	rcx, eb_cdr[rip]
	mov	rax, QWORD PTR -48[rbp]
	mov	rdx, rax
	call	eb_cdr
	mov	QWORD PTR -56[rbp], rax
	lea	rcx, eb_cdr[rip]
	mov	rax, QWORD PTR -56[rbp]
	mov	rdx, rax
	call	eb_cdr
	mov	QWORD PTR -64[rbp], rax
	lea	rcx, eb_put_error_body[rip]
	mov	rax, QWORD PTR -64[rbp]
	mov	rdx, rax
	call	eb_put_error_body
	mov	QWORD PTR -72[rbp], rax
	lea	rcx, eb_do[rip]
	mov	rdx, QWORD PTR -72[rbp]
	mov	rax, QWORD PTR -40[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_do
	mov	QWORD PTR -80[rbp], rax
	lea	rcx, eb_do[rip]
	mov	rdx, QWORD PTR -80[rbp]
	mov	rax, QWORD PTR -32[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_do
	mov	QWORD PTR -88[rbp], rax
	mov	rax, QWORD PTR -88[rbp]
	sub	rsp, -128
	pop	rbp
	ret
	.seh_endproc
	.section .rdata,"dr"
.LC7:
	.ascii "(Wanted: \0"
.LC8:
	.ascii ")\0"
	.text
	.globl	eb_put_error_body2f2f2f1f
	.def	eb_put_error_body2f2f2f1f;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_put_error_body2f2f2f1f
eb_put_error_body2f2f2f1f:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 96
	.seh_stackalloc	96
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	lea	rax, .LC7[rip]
	mov	rdx, rax
	lea	rax, eb_put_error_body2f2f2f1f00.82[rip]
	mov	rcx, rax
	call	ebz_stol
	mov	rax, QWORD PTR eb_put_error_body2f2f2f1f00.82[rip]
	lea	rcx, eb_put_str[rip]
	mov	rdx, rax
	call	eb_put_str
	mov	QWORD PTR -8[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -16[rbp], rax
	lea	rcx, eb_cdr[rip]
	mov	rax, QWORD PTR -16[rbp]
	mov	rdx, rax
	call	eb_cdr
	mov	QWORD PTR -24[rbp], rax
	lea	rcx, eb_put_error_body[rip]
	mov	rax, QWORD PTR -24[rbp]
	mov	rdx, rax
	call	eb_put_error_body
	mov	QWORD PTR -32[rbp], rax
	lea	rax, .LC8[rip]
	mov	rdx, rax
	lea	rax, eb_put_error_body2f2f2f1f110.81[rip]
	mov	rcx, rax
	call	ebz_stol
	mov	rax, QWORD PTR eb_put_error_body2f2f2f1f110.81[rip]
	lea	rcx, eb_put_str[rip]
	mov	rdx, rax
	call	eb_put_str
	mov	QWORD PTR -40[rbp], rax
	lea	rcx, eb_do[rip]
	mov	rdx, QWORD PTR -40[rbp]
	mov	rax, QWORD PTR -32[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_do
	mov	QWORD PTR -48[rbp], rax
	lea	rcx, eb_do[rip]
	mov	rdx, QWORD PTR -48[rbp]
	mov	rax, QWORD PTR -8[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_do
	mov	QWORD PTR -56[rbp], rax
	mov	rax, QWORD PTR -56[rbp]
	add	rsp, 96
	pop	rbp
	ret
	.seh_endproc
	.section .rdata,"dr"
.LC9:
	.ascii "(Got: \0"
	.text
	.globl	eb_put_error_body2f2f2f2f1f
	.def	eb_put_error_body2f2f2f2f1f;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_put_error_body2f2f2f2f1f
eb_put_error_body2f2f2f2f1f:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 96
	.seh_stackalloc	96
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	lea	rax, .LC9[rip]
	mov	rdx, rax
	lea	rax, eb_put_error_body2f2f2f2f1f00.80[rip]
	mov	rcx, rax
	call	ebz_stol
	mov	rax, QWORD PTR eb_put_error_body2f2f2f2f1f00.80[rip]
	lea	rcx, eb_put_str[rip]
	mov	rdx, rax
	call	eb_put_str
	mov	QWORD PTR -8[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -16[rbp], rax
	lea	rcx, eb_cdr[rip]
	mov	rax, QWORD PTR -16[rbp]
	mov	rdx, rax
	call	eb_cdr
	mov	QWORD PTR -24[rbp], rax
	lea	rcx, eb_put_error_body[rip]
	mov	rax, QWORD PTR -24[rbp]
	mov	rdx, rax
	call	eb_put_error_body
	mov	QWORD PTR -32[rbp], rax
	lea	rax, .LC8[rip]
	mov	rdx, rax
	lea	rax, eb_put_error_body2f2f2f2f1f110.79[rip]
	mov	rcx, rax
	call	ebz_stol
	mov	rax, QWORD PTR eb_put_error_body2f2f2f2f1f110.79[rip]
	lea	rcx, eb_put_str[rip]
	mov	rdx, rax
	call	eb_put_str
	mov	QWORD PTR -40[rbp], rax
	lea	rcx, eb_do[rip]
	mov	rdx, QWORD PTR -40[rbp]
	mov	rax, QWORD PTR -32[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_do
	mov	QWORD PTR -48[rbp], rax
	lea	rcx, eb_do[rip]
	mov	rdx, QWORD PTR -48[rbp]
	mov	rax, QWORD PTR -8[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_do
	mov	QWORD PTR -56[rbp], rax
	mov	rax, QWORD PTR -56[rbp]
	add	rsp, 96
	pop	rbp
	ret
	.seh_endproc
	.section .rdata,"dr"
.LC10:
	.ascii "At Line \0"
.LC11:
	.ascii ", Col \0"
.LC12:
	.ascii ": \0"
	.text
	.globl	eb_put_error_body2f2f2f2f2f1f1f
	.def	eb_put_error_body2f2f2f2f2f1f1f;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_put_error_body2f2f2f2f2f1f1f
eb_put_error_body2f2f2f2f2f1f1f:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 176
	.seh_stackalloc	176
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	QWORD PTR 24[rbp], rdx
	lea	rax, .LC10[rip]
	mov	rdx, rax
	lea	rax, eb_put_error_body2f2f2f2f2f1f1f00.78[rip]
	mov	rcx, rax
	call	ebz_stol
	mov	rax, QWORD PTR eb_put_error_body2f2f2f2f2f1f1f00.78[rip]
	lea	rcx, eb_put_str[rip]
	mov	rdx, rax
	call	eb_put_str
	mov	QWORD PTR -8[rbp], rax
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -16[rbp], rax
	lea	rcx, eb_car[rip]
	mov	rax, QWORD PTR -16[rbp]
	mov	rdx, rax
	call	eb_car
	mov	QWORD PTR -24[rbp], rax
	lea	rcx, eb_put_num[rip]
	mov	rax, QWORD PTR -24[rbp]
	mov	rdx, rax
	call	eb_put_num
	mov	QWORD PTR -32[rbp], rax
	lea	rax, .LC11[rip]
	mov	rdx, rax
	lea	rax, eb_put_error_body2f2f2f2f2f1f1f1100.77[rip]
	mov	rcx, rax
	call	ebz_stol
	mov	rax, QWORD PTR eb_put_error_body2f2f2f2f2f1f1f1100.77[rip]
	lea	rcx, eb_put_str[rip]
	mov	rdx, rax
	call	eb_put_str
	mov	QWORD PTR -40[rbp], rax
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -48[rbp], rax
	lea	rcx, eb_cdr[rip]
	mov	rax, QWORD PTR -48[rbp]
	mov	rdx, rax
	call	eb_cdr
	mov	QWORD PTR -56[rbp], rax
	lea	rcx, eb_put_num[rip]
	mov	rax, QWORD PTR -56[rbp]
	mov	rdx, rax
	call	eb_put_num
	mov	QWORD PTR -64[rbp], rax
	lea	rax, .LC12[rip]
	mov	rdx, rax
	lea	rax, eb_put_error_body2f2f2f2f2f1f1f111100.76[rip]
	mov	rcx, rax
	call	ebz_stol
	mov	rax, QWORD PTR eb_put_error_body2f2f2f2f2f1f1f111100.76[rip]
	lea	rcx, eb_put_str[rip]
	mov	rdx, rax
	call	eb_put_str
	mov	QWORD PTR -72[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -80[rbp], rax
	lea	rcx, eb_cdr[rip]
	mov	rax, QWORD PTR -80[rbp]
	mov	rdx, rax
	call	eb_cdr
	mov	QWORD PTR -88[rbp], rax
	lea	rcx, eb_cdr[rip]
	mov	rax, QWORD PTR -88[rbp]
	mov	rdx, rax
	call	eb_cdr
	mov	QWORD PTR -96[rbp], rax
	lea	rcx, eb_put_error_body[rip]
	mov	rax, QWORD PTR -96[rbp]
	mov	rdx, rax
	call	eb_put_error_body
	mov	QWORD PTR -104[rbp], rax
	lea	rcx, eb_do[rip]
	mov	rdx, QWORD PTR -104[rbp]
	mov	rax, QWORD PTR -72[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_do
	mov	QWORD PTR -112[rbp], rax
	lea	rcx, eb_do[rip]
	mov	rdx, QWORD PTR -112[rbp]
	mov	rax, QWORD PTR -64[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_do
	mov	QWORD PTR -120[rbp], rax
	lea	rcx, eb_do[rip]
	mov	rdx, QWORD PTR -120[rbp]
	mov	rax, QWORD PTR -40[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_do
	mov	QWORD PTR -128[rbp], rax
	lea	rcx, eb_do[rip]
	mov	rdx, QWORD PTR -128[rbp]
	mov	rax, QWORD PTR -32[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_do
	mov	QWORD PTR -136[rbp], rax
	lea	rcx, eb_do[rip]
	mov	rdx, QWORD PTR -136[rbp]
	mov	rax, QWORD PTR -8[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_do
	mov	QWORD PTR -144[rbp], rax
	mov	rax, QWORD PTR -144[rbp]
	add	rsp, 176
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_put_error_body2f2f2f2f2f1f
	.def	eb_put_error_body2f2f2f2f2f1f;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_put_error_body2f2f2f2f2f1f
eb_put_error_body2f2f2f2f2f1f:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 80
	.seh_stackalloc	80
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -8[rbp], rax
	lea	rcx, eb_cdr[rip]
	mov	rax, QWORD PTR -8[rbp]
	mov	rdx, rax
	call	eb_cdr
	mov	QWORD PTR -16[rbp], rax
	lea	rcx, eb_car[rip]
	mov	rax, QWORD PTR -16[rbp]
	mov	rdx, rax
	call	eb_car
	mov	QWORD PTR -24[rbp], rax
	lea	rax, eb_put_error_body2f2f2f2f2f1f1f[rip]
	mov	QWORD PTR -48[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -40[rbp], rax
	lea	rdx, -48[rbp]
	lea	rcx, eb_let[rip]
	mov	rax, QWORD PTR -24[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_let
	mov	QWORD PTR -32[rbp], rax
	mov	rax, QWORD PTR -32[rbp]
	add	rsp, 80
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_put_error_body2f2f2f2f2f2f
	.def	eb_put_error_body2f2f2f2f2f2f;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_put_error_body2f2f2f2f2f2f
eb_put_error_body2f2f2f2f2f2f:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 16
	.seh_stackalloc	16
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	QWORD PTR -8[rbp], 0
	mov	rax, QWORD PTR -8[rbp]
	add	rsp, 16
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_put_error_body2f2f2f2f2f
	.def	eb_put_error_body2f2f2f2f2f;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_put_error_body2f2f2f2f2f
eb_put_error_body2f2f2f2f2f:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 96
	.seh_stackalloc	96
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -8[rbp], rax
	lea	rcx, eb_error_is_position[rip]
	mov	rax, QWORD PTR -8[rbp]
	mov	rdx, rax
	call	eb_error_is_position
	mov	QWORD PTR -16[rbp], rax
	lea	rax, eb_put_error_body2f2f2f2f2f1f[rip]
	mov	QWORD PTR -48[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -40[rbp], rax
	lea	rax, eb_put_error_body2f2f2f2f2f2f[rip]
	mov	QWORD PTR -56[rbp], rax
	lea	r8, -56[rbp]
	lea	rdx, -48[rbp]
	lea	rcx, eb_if[rip]
	mov	rax, QWORD PTR -16[rbp]
	mov	r9, r8
	mov	r8, rdx
	mov	rdx, rax
	call	eb_if
	mov	QWORD PTR -24[rbp], rax
	mov	rax, QWORD PTR -24[rbp]
	add	rsp, 96
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_put_error_body2f2f2f2f
	.def	eb_put_error_body2f2f2f2f;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_put_error_body2f2f2f2f
eb_put_error_body2f2f2f2f:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 96
	.seh_stackalloc	96
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -8[rbp], rax
	lea	rcx, eb_error_is_got[rip]
	mov	rax, QWORD PTR -8[rbp]
	mov	rdx, rax
	call	eb_error_is_got
	mov	QWORD PTR -16[rbp], rax
	lea	rax, eb_put_error_body2f2f2f2f1f[rip]
	mov	QWORD PTR -48[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -40[rbp], rax
	lea	rax, eb_put_error_body2f2f2f2f2f[rip]
	mov	QWORD PTR -64[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -56[rbp], rax
	lea	r8, -64[rbp]
	lea	rdx, -48[rbp]
	lea	rcx, eb_if[rip]
	mov	rax, QWORD PTR -16[rbp]
	mov	r9, r8
	mov	r8, rdx
	mov	rdx, rax
	call	eb_if
	mov	QWORD PTR -24[rbp], rax
	mov	rax, QWORD PTR -24[rbp]
	add	rsp, 96
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_put_error_body2f2f2f
	.def	eb_put_error_body2f2f2f;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_put_error_body2f2f2f
eb_put_error_body2f2f2f:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 96
	.seh_stackalloc	96
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -8[rbp], rax
	lea	rcx, eb_error_is_wanted[rip]
	mov	rax, QWORD PTR -8[rbp]
	mov	rdx, rax
	call	eb_error_is_wanted
	mov	QWORD PTR -16[rbp], rax
	lea	rax, eb_put_error_body2f2f2f1f[rip]
	mov	QWORD PTR -48[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -40[rbp], rax
	lea	rax, eb_put_error_body2f2f2f2f[rip]
	mov	QWORD PTR -64[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -56[rbp], rax
	lea	r8, -64[rbp]
	lea	rdx, -48[rbp]
	lea	rcx, eb_if[rip]
	mov	rax, QWORD PTR -16[rbp]
	mov	r9, r8
	mov	r8, rdx
	mov	rdx, rax
	call	eb_if
	mov	QWORD PTR -24[rbp], rax
	mov	rax, QWORD PTR -24[rbp]
	add	rsp, 96
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_put_error_body2f2f
	.def	eb_put_error_body2f2f;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_put_error_body2f2f
eb_put_error_body2f2f:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 96
	.seh_stackalloc	96
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -8[rbp], rax
	lea	rcx, eb_error_is_both[rip]
	mov	rax, QWORD PTR -8[rbp]
	mov	rdx, rax
	call	eb_error_is_both
	mov	QWORD PTR -16[rbp], rax
	lea	rax, eb_put_error_body2f2f1f[rip]
	mov	QWORD PTR -48[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -40[rbp], rax
	lea	rax, eb_put_error_body2f2f2f[rip]
	mov	QWORD PTR -64[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -56[rbp], rax
	lea	r8, -64[rbp]
	lea	rdx, -48[rbp]
	lea	rcx, eb_if[rip]
	mov	rax, QWORD PTR -16[rbp]
	mov	r9, r8
	mov	r8, rdx
	mov	rdx, rax
	call	eb_if
	mov	QWORD PTR -24[rbp], rax
	mov	rax, QWORD PTR -24[rbp]
	add	rsp, 96
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_put_error_body2f
	.def	eb_put_error_body2f;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_put_error_body2f
eb_put_error_body2f:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 96
	.seh_stackalloc	96
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -8[rbp], rax
	lea	rcx, eb_error_is_str[rip]
	mov	rax, QWORD PTR -8[rbp]
	mov	rdx, rax
	call	eb_error_is_str
	mov	QWORD PTR -16[rbp], rax
	lea	rax, eb_put_error_body2f1f[rip]
	mov	QWORD PTR -48[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -40[rbp], rax
	lea	rax, eb_put_error_body2f2f[rip]
	mov	QWORD PTR -64[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -56[rbp], rax
	lea	r8, -64[rbp]
	lea	rdx, -48[rbp]
	lea	rcx, eb_if[rip]
	mov	rax, QWORD PTR -16[rbp]
	mov	r9, r8
	mov	r8, rdx
	mov	rdx, rax
	call	eb_if
	mov	QWORD PTR -24[rbp], rax
	mov	rax, QWORD PTR -24[rbp]
	add	rsp, 96
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_put_error_body
	.def	eb_put_error_body;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_put_error_body
eb_put_error_body:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 96
	.seh_stackalloc	96
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	QWORD PTR 24[rbp], rdx
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -8[rbp], rax
	lea	rcx, eb_error_is_char[rip]
	mov	rax, QWORD PTR -8[rbp]
	mov	rdx, rax
	call	eb_error_is_char
	mov	QWORD PTR -16[rbp], rax
	lea	rax, eb_put_error_body1f[rip]
	mov	QWORD PTR -48[rbp], rax
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -40[rbp], rax
	lea	rax, eb_put_error_body2f[rip]
	mov	QWORD PTR -64[rbp], rax
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -56[rbp], rax
	lea	r8, -64[rbp]
	lea	rdx, -48[rbp]
	lea	rcx, eb_if[rip]
	mov	rax, QWORD PTR -16[rbp]
	mov	r9, r8
	mov	r8, rdx
	mov	rdx, rax
	call	eb_if
	mov	QWORD PTR -24[rbp], rax
	mov	rax, QWORD PTR -24[rbp]
	add	rsp, 96
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_put_error
	.def	eb_put_error;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_put_error
eb_put_error:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 64
	.seh_stackalloc	64
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	QWORD PTR 24[rbp], rdx
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -8[rbp], rax
	lea	rcx, eb_put_error_body[rip]
	mov	rax, QWORD PTR -8[rbp]
	mov	rdx, rax
	call	eb_put_error_body
	mov	QWORD PTR -16[rbp], rax
	lea	rax, eb_put_line[rip]
	mov	rcx, rax
	call	eb_put_line
	mov	QWORD PTR -24[rbp], rax
	lea	rcx, eb_do[rip]
	mov	rdx, QWORD PTR -24[rbp]
	mov	rax, QWORD PTR -16[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_do
	mov	QWORD PTR -32[rbp], rax
	mov	rax, QWORD PTR -32[rbp]
	add	rsp, 64
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_state_has_data
	.def	eb_state_has_data;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_state_has_data
eb_state_has_data:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 48
	.seh_stackalloc	48
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	QWORD PTR 24[rbp], rdx
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -8[rbp], rax
	lea	rcx, eb_cdr[rip]
	mov	rax, QWORD PTR -8[rbp]
	mov	rdx, rax
	call	eb_cdr
	mov	QWORD PTR -16[rbp], rax
	mov	rax, QWORD PTR -16[rbp]
	add	rsp, 48
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_state_data
	.def	eb_state_data;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_state_data
eb_state_data:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 64
	.seh_stackalloc	64
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	QWORD PTR 24[rbp], rdx
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -8[rbp], rax
	lea	rcx, eb_cdr[rip]
	mov	rax, QWORD PTR -8[rbp]
	mov	rdx, rax
	call	eb_cdr
	mov	QWORD PTR -16[rbp], rax
	lea	rcx, eb_car[rip]
	mov	rax, QWORD PTR -16[rbp]
	mov	rdx, rax
	call	eb_car
	mov	QWORD PTR -24[rbp], rax
	mov	rax, QWORD PTR -24[rbp]
	add	rsp, 64
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_state_pos
	.def	eb_state_pos;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_state_pos
eb_state_pos:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 48
	.seh_stackalloc	48
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	QWORD PTR 24[rbp], rdx
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -8[rbp], rax
	lea	rcx, eb_car[rip]
	mov	rax, QWORD PTR -8[rbp]
	mov	rdx, rax
	call	eb_car
	mov	QWORD PTR -16[rbp], rax
	mov	rax, QWORD PTR -16[rbp]
	add	rsp, 48
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_state_line
	.def	eb_state_line;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_state_line
eb_state_line:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 64
	.seh_stackalloc	64
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	QWORD PTR 24[rbp], rdx
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -8[rbp], rax
	lea	rcx, eb_state_pos[rip]
	mov	rax, QWORD PTR -8[rbp]
	mov	rdx, rax
	call	eb_state_pos
	mov	QWORD PTR -16[rbp], rax
	lea	rcx, eb_car[rip]
	mov	rax, QWORD PTR -16[rbp]
	mov	rdx, rax
	call	eb_car
	mov	QWORD PTR -24[rbp], rax
	mov	rax, QWORD PTR -24[rbp]
	add	rsp, 64
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_state_col
	.def	eb_state_col;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_state_col
eb_state_col:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 64
	.seh_stackalloc	64
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	QWORD PTR 24[rbp], rdx
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -8[rbp], rax
	lea	rcx, eb_state_pos[rip]
	mov	rax, QWORD PTR -8[rbp]
	mov	rdx, rax
	call	eb_state_pos
	mov	QWORD PTR -16[rbp], rax
	lea	rcx, eb_cdr[rip]
	mov	rax, QWORD PTR -16[rbp]
	mov	rdx, rax
	call	eb_cdr
	mov	QWORD PTR -24[rbp], rax
	mov	rax, QWORD PTR -24[rbp]
	add	rsp, 64
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_str_to_state
	.def	eb_str_to_state;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_str_to_state
eb_str_to_state:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 80
	.seh_stackalloc	80
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	QWORD PTR 24[rbp], rdx
	mov	QWORD PTR -8[rbp], 1
	mov	QWORD PTR -16[rbp], 1
	lea	rcx, eb_cons[rip]
	mov	rdx, QWORD PTR -16[rbp]
	mov	rax, QWORD PTR -8[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_cons
	mov	QWORD PTR -24[rbp], rax
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -32[rbp], rax
	lea	rcx, eb_cons[rip]
	mov	rdx, QWORD PTR -32[rbp]
	mov	rax, QWORD PTR -24[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_cons
	mov	QWORD PTR -40[rbp], rax
	mov	rax, QWORD PTR -40[rbp]
	add	rsp, 80
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_state_skip1f1f1f1f01f
	.def	eb_state_skip1f1f1f1f01f;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_state_skip1f1f1f1f01f
eb_state_skip1f1f1f1f01f:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 80
	.seh_stackalloc	80
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	QWORD PTR -8[rbp], 1
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -16[rbp], rax
	lea	rcx, eb_add[rip]
	mov	rdx, QWORD PTR -16[rbp]
	mov	rax, QWORD PTR -8[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_add
	mov	QWORD PTR -24[rbp], rax
	mov	QWORD PTR -32[rbp], 1
	lea	rcx, eb_cons[rip]
	mov	rdx, QWORD PTR -32[rbp]
	mov	rax, QWORD PTR -24[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_cons
	mov	QWORD PTR -40[rbp], rax
	mov	rax, QWORD PTR -40[rbp]
	add	rsp, 80
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_state_skip1f1f1f1f02f
	.def	eb_state_skip1f1f1f1f02f;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_state_skip1f1f1f1f02f
eb_state_skip1f1f1f1f02f:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 80
	.seh_stackalloc	80
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 16
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -8[rbp], rax
	mov	QWORD PTR -16[rbp], 1
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -24[rbp], rax
	lea	rcx, eb_add[rip]
	mov	rdx, QWORD PTR -24[rbp]
	mov	rax, QWORD PTR -16[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_add
	mov	QWORD PTR -32[rbp], rax
	lea	rcx, eb_cons[rip]
	mov	rdx, QWORD PTR -32[rbp]
	mov	rax, QWORD PTR -8[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_cons
	mov	QWORD PTR -40[rbp], rax
	mov	rax, QWORD PTR -40[rbp]
	add	rsp, 80
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_state_skip1f1f1f1f
	.def	eb_state_skip1f1f1f1f;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_state_skip1f1f1f1f
eb_state_skip1f1f1f1f:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 144
	.seh_stackalloc	144
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	QWORD PTR 24[rbp], rdx
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 16
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -8[rbp], rax
	mov	QWORD PTR -16[rbp], 10
	lea	rcx, eb_equal[rip]
	mov	rdx, QWORD PTR -16[rbp]
	mov	rax, QWORD PTR -8[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_equal
	mov	QWORD PTR -24[rbp], rax
	lea	rax, eb_state_skip1f1f1f1f01f[rip]
	mov	QWORD PTR -80[rbp], rax
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -72[rbp], rax
	lea	rax, eb_state_skip1f1f1f1f02f[rip]
	mov	QWORD PTR -112[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 24
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -104[rbp], rax
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -96[rbp], rax
	lea	r8, -112[rbp]
	lea	rdx, -80[rbp]
	lea	rcx, eb_if[rip]
	mov	rax, QWORD PTR -24[rbp]
	mov	r9, r8
	mov	r8, rdx
	mov	rdx, rax
	call	eb_if
	mov	QWORD PTR -32[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -40[rbp], rax
	lea	rcx, eb_cdr[rip]
	mov	rax, QWORD PTR -40[rbp]
	mov	rdx, rax
	call	eb_cdr
	mov	QWORD PTR -48[rbp], rax
	lea	rcx, eb_cons[rip]
	mov	rdx, QWORD PTR -48[rbp]
	mov	rax, QWORD PTR -32[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_cons
	mov	QWORD PTR -56[rbp], rax
	mov	rax, QWORD PTR -56[rbp]
	add	rsp, 144
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_state_skip1f1f1f
	.def	eb_state_skip1f1f1f;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_state_skip1f1f1f
eb_state_skip1f1f1f:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 96
	.seh_stackalloc	96
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	QWORD PTR 24[rbp], rdx
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -8[rbp], rax
	lea	rcx, eb_state_line[rip]
	mov	rax, QWORD PTR -8[rbp]
	mov	rdx, rax
	call	eb_state_line
	mov	QWORD PTR -16[rbp], rax
	lea	rax, eb_state_skip1f1f1f1f[rip]
	mov	QWORD PTR -64[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 16
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -56[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 24
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -48[rbp], rax
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -40[rbp], rax
	lea	rdx, -64[rbp]
	lea	rcx, eb_let[rip]
	mov	rax, QWORD PTR -16[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_let
	mov	QWORD PTR -24[rbp], rax
	mov	rax, QWORD PTR -24[rbp]
	add	rsp, 96
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_state_skip1f1f
	.def	eb_state_skip1f1f;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_state_skip1f1f
eb_state_skip1f1f:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 96
	.seh_stackalloc	96
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	QWORD PTR 24[rbp], rdx
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -8[rbp], rax
	lea	rcx, eb_state_col[rip]
	mov	rax, QWORD PTR -8[rbp]
	mov	rdx, rax
	call	eb_state_col
	mov	QWORD PTR -16[rbp], rax
	lea	rax, eb_state_skip1f1f1f[rip]
	mov	QWORD PTR -64[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -56[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 16
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -48[rbp], rax
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -40[rbp], rax
	lea	rdx, -64[rbp]
	lea	rcx, eb_let[rip]
	mov	rax, QWORD PTR -16[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_let
	mov	QWORD PTR -24[rbp], rax
	mov	rax, QWORD PTR -24[rbp]
	add	rsp, 96
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_state_skip1f
	.def	eb_state_skip1f;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_state_skip1f
eb_state_skip1f:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 80
	.seh_stackalloc	80
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	QWORD PTR 24[rbp], rdx
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -8[rbp], rax
	lea	rcx, eb_state_data[rip]
	mov	rax, QWORD PTR -8[rbp]
	mov	rdx, rax
	call	eb_state_data
	mov	QWORD PTR -16[rbp], rax
	lea	rax, eb_state_skip1f1f[rip]
	mov	QWORD PTR -48[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -40[rbp], rax
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -32[rbp], rax
	lea	rdx, -48[rbp]
	lea	rcx, eb_let[rip]
	mov	rax, QWORD PTR -16[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_let
	mov	QWORD PTR -24[rbp], rax
	mov	rax, QWORD PTR -24[rbp]
	add	rsp, 80
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_state_skip
	.def	eb_state_skip;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_state_skip
eb_state_skip:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 80
	.seh_stackalloc	80
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	QWORD PTR 24[rbp], rdx
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -8[rbp], rax
	lea	rcx, eb_cdr[rip]
	mov	rax, QWORD PTR -8[rbp]
	mov	rdx, rax
	call	eb_cdr
	mov	QWORD PTR -16[rbp], rax
	lea	rax, eb_state_skip1f[rip]
	mov	QWORD PTR -48[rbp], rax
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -40[rbp], rax
	lea	rdx, -48[rbp]
	lea	rcx, eb_let[rip]
	mov	rax, QWORD PTR -16[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_let
	mov	QWORD PTR -24[rbp], rax
	mov	rax, QWORD PTR -24[rbp]
	add	rsp, 80
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_strip_comment1f
	.def	eb_strip_comment1f;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_strip_comment1f
eb_strip_comment1f:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 16
	.seh_stackalloc	16
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -8[rbp], rax
	mov	rax, QWORD PTR -8[rbp]
	add	rsp, 16
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_strip_comment2f1f1f
	.def	eb_strip_comment2f1f1f;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_strip_comment2f1f1f
eb_strip_comment2f1f1f:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 48
	.seh_stackalloc	48
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -8[rbp], rax
	lea	rcx, eb_state_skip[rip]
	mov	rax, QWORD PTR -8[rbp]
	mov	rdx, rax
	call	eb_state_skip
	mov	QWORD PTR -16[rbp], rax
	mov	rax, QWORD PTR -16[rbp]
	add	rsp, 48
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_strip_comment2f1f2f
	.def	eb_strip_comment2f1f2f;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_strip_comment2f1f2f
eb_strip_comment2f1f2f:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 64
	.seh_stackalloc	64
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -8[rbp], rax
	lea	rcx, eb_state_skip[rip]
	mov	rax, QWORD PTR -8[rbp]
	mov	rdx, rax
	call	eb_state_skip
	mov	QWORD PTR -16[rbp], rax
	lea	rcx, eb_strip_comment[rip]
	mov	rax, QWORD PTR -16[rbp]
	mov	rdx, rax
	call	eb_strip_comment
	mov	QWORD PTR -24[rbp], rax
	mov	rax, QWORD PTR -24[rbp]
	add	rsp, 64
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_strip_comment2f1f
	.def	eb_strip_comment2f1f;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_strip_comment2f1f
eb_strip_comment2f1f:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 96
	.seh_stackalloc	96
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	QWORD PTR 24[rbp], rdx
	mov	QWORD PTR -8[rbp], 35
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -16[rbp], rax
	lea	rcx, eb_equal[rip]
	mov	rdx, QWORD PTR -16[rbp]
	mov	rax, QWORD PTR -8[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_equal
	mov	QWORD PTR -24[rbp], rax
	lea	rax, eb_strip_comment2f1f1f[rip]
	mov	QWORD PTR -48[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -40[rbp], rax
	lea	rax, eb_strip_comment2f1f2f[rip]
	mov	QWORD PTR -64[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -56[rbp], rax
	lea	r8, -64[rbp]
	lea	rdx, -48[rbp]
	lea	rcx, eb_if[rip]
	mov	rax, QWORD PTR -24[rbp]
	mov	r9, r8
	mov	r8, rdx
	mov	rdx, rax
	call	eb_if
	mov	QWORD PTR -32[rbp], rax
	mov	rax, QWORD PTR -32[rbp]
	add	rsp, 96
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_strip_comment2f
	.def	eb_strip_comment2f;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_strip_comment2f
eb_strip_comment2f:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 80
	.seh_stackalloc	80
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -8[rbp], rax
	lea	rcx, eb_state_data[rip]
	mov	rax, QWORD PTR -8[rbp]
	mov	rdx, rax
	call	eb_state_data
	mov	QWORD PTR -16[rbp], rax
	lea	rax, eb_strip_comment2f1f[rip]
	mov	QWORD PTR -48[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -40[rbp], rax
	lea	rdx, -48[rbp]
	lea	rcx, eb_let[rip]
	mov	rax, QWORD PTR -16[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_let
	mov	QWORD PTR -24[rbp], rax
	mov	rax, QWORD PTR -24[rbp]
	add	rsp, 80
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_strip_comment
	.def	eb_strip_comment;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_strip_comment
eb_strip_comment:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 96
	.seh_stackalloc	96
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	QWORD PTR 24[rbp], rdx
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -8[rbp], rax
	lea	rcx, eb_state_has_data[rip]
	mov	rax, QWORD PTR -8[rbp]
	mov	rdx, rax
	call	eb_state_has_data
	mov	QWORD PTR -16[rbp], rax
	lea	rcx, eb_not[rip]
	mov	rax, QWORD PTR -16[rbp]
	mov	rdx, rax
	call	eb_not
	mov	QWORD PTR -24[rbp], rax
	lea	rax, eb_strip_comment1f[rip]
	mov	QWORD PTR -48[rbp], rax
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -40[rbp], rax
	lea	rax, eb_strip_comment2f[rip]
	mov	QWORD PTR -64[rbp], rax
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -56[rbp], rax
	lea	r8, -64[rbp]
	lea	rdx, -48[rbp]
	lea	rcx, eb_if[rip]
	mov	rax, QWORD PTR -24[rbp]
	mov	r9, r8
	mov	r8, rdx
	mov	rdx, rax
	call	eb_if
	mov	QWORD PTR -32[rbp], rax
	mov	rax, QWORD PTR -32[rbp]
	add	rsp, 96
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_strip1f
	.def	eb_strip1f;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_strip1f
eb_strip1f:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 16
	.seh_stackalloc	16
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -8[rbp], rax
	mov	rax, QWORD PTR -8[rbp]
	add	rsp, 16
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_strip2f1f1f
	.def	eb_strip2f1f1f;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_strip2f1f1f
eb_strip2f1f1f:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 64
	.seh_stackalloc	64
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -8[rbp], rax
	lea	rcx, eb_state_skip[rip]
	mov	rax, QWORD PTR -8[rbp]
	mov	rdx, rax
	call	eb_state_skip
	mov	QWORD PTR -16[rbp], rax
	lea	rcx, eb_strip_comment[rip]
	mov	rax, QWORD PTR -16[rbp]
	mov	rdx, rax
	call	eb_strip_comment
	mov	QWORD PTR -24[rbp], rax
	lea	rcx, eb_strip[rip]
	mov	rax, QWORD PTR -24[rbp]
	mov	rdx, rax
	call	eb_strip
	mov	QWORD PTR -32[rbp], rax
	mov	rax, QWORD PTR -32[rbp]
	add	rsp, 64
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_strip2f1f2f01f
	.def	eb_strip2f1f2f01f;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_strip2f1f2f01f
eb_strip2f1f2f01f:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 64
	.seh_stackalloc	64
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	QWORD PTR -8[rbp], 10
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -16[rbp], rax
	lea	rcx, eb_equal[rip]
	mov	rdx, QWORD PTR -16[rbp]
	mov	rax, QWORD PTR -8[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_equal
	mov	QWORD PTR -24[rbp], rax
	mov	rax, QWORD PTR -24[rbp]
	add	rsp, 64
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_strip2f1f2f1f
	.def	eb_strip2f1f2f1f;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_strip2f1f2f1f
eb_strip2f1f2f1f:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 64
	.seh_stackalloc	64
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -8[rbp], rax
	lea	rcx, eb_state_skip[rip]
	mov	rax, QWORD PTR -8[rbp]
	mov	rdx, rax
	call	eb_state_skip
	mov	QWORD PTR -16[rbp], rax
	lea	rcx, eb_strip[rip]
	mov	rax, QWORD PTR -16[rbp]
	mov	rdx, rax
	call	eb_strip
	mov	QWORD PTR -24[rbp], rax
	mov	rax, QWORD PTR -24[rbp]
	add	rsp, 64
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_strip2f1f2f2f
	.def	eb_strip2f1f2f2f;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_strip2f1f2f2f
eb_strip2f1f2f2f:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 16
	.seh_stackalloc	16
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -8[rbp], rax
	mov	rax, QWORD PTR -8[rbp]
	add	rsp, 16
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_strip2f1f2f
	.def	eb_strip2f1f2f;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_strip2f1f2f
eb_strip2f1f2f:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	add	rsp, -128
	.seh_stackalloc	128
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	QWORD PTR -8[rbp], 32
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 16
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -16[rbp], rax
	lea	rcx, eb_equal[rip]
	mov	rdx, QWORD PTR -16[rbp]
	mov	rax, QWORD PTR -8[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_equal
	mov	QWORD PTR -24[rbp], rax
	lea	rax, eb_strip2f1f2f01f[rip]
	mov	QWORD PTR -64[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 16
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -56[rbp], rax
	lea	rdx, -64[rbp]
	lea	rcx, eb_or[rip]
	mov	rax, QWORD PTR -24[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_or
	mov	QWORD PTR -32[rbp], rax
	lea	rax, eb_strip2f1f2f1f[rip]
	mov	QWORD PTR -80[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -72[rbp], rax
	lea	rax, eb_strip2f1f2f2f[rip]
	mov	QWORD PTR -96[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -88[rbp], rax
	lea	r8, -96[rbp]
	lea	rdx, -80[rbp]
	lea	rcx, eb_if[rip]
	mov	rax, QWORD PTR -32[rbp]
	mov	r9, r8
	mov	r8, rdx
	mov	rdx, rax
	call	eb_if
	mov	QWORD PTR -40[rbp], rax
	mov	rax, QWORD PTR -40[rbp]
	sub	rsp, -128
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_strip2f1f
	.def	eb_strip2f1f;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_strip2f1f
eb_strip2f1f:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 112
	.seh_stackalloc	112
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	QWORD PTR 24[rbp], rdx
	mov	QWORD PTR -8[rbp], 35
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -16[rbp], rax
	lea	rcx, eb_equal[rip]
	mov	rdx, QWORD PTR -16[rbp]
	mov	rax, QWORD PTR -8[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_equal
	mov	QWORD PTR -24[rbp], rax
	lea	rax, eb_strip2f1f1f[rip]
	mov	QWORD PTR -48[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -40[rbp], rax
	lea	rax, eb_strip2f1f2f[rip]
	mov	QWORD PTR -80[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -72[rbp], rax
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -64[rbp], rax
	lea	r8, -80[rbp]
	lea	rdx, -48[rbp]
	lea	rcx, eb_if[rip]
	mov	rax, QWORD PTR -24[rbp]
	mov	r9, r8
	mov	r8, rdx
	mov	rdx, rax
	call	eb_if
	mov	QWORD PTR -32[rbp], rax
	mov	rax, QWORD PTR -32[rbp]
	add	rsp, 112
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_strip2f
	.def	eb_strip2f;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_strip2f
eb_strip2f:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 80
	.seh_stackalloc	80
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -8[rbp], rax
	lea	rcx, eb_state_data[rip]
	mov	rax, QWORD PTR -8[rbp]
	mov	rdx, rax
	call	eb_state_data
	mov	QWORD PTR -16[rbp], rax
	lea	rax, eb_strip2f1f[rip]
	mov	QWORD PTR -48[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -40[rbp], rax
	lea	rdx, -48[rbp]
	lea	rcx, eb_let[rip]
	mov	rax, QWORD PTR -16[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_let
	mov	QWORD PTR -24[rbp], rax
	mov	rax, QWORD PTR -24[rbp]
	add	rsp, 80
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_strip
	.def	eb_strip;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_strip
eb_strip:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 96
	.seh_stackalloc	96
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	QWORD PTR 24[rbp], rdx
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -8[rbp], rax
	lea	rcx, eb_state_has_data[rip]
	mov	rax, QWORD PTR -8[rbp]
	mov	rdx, rax
	call	eb_state_has_data
	mov	QWORD PTR -16[rbp], rax
	lea	rcx, eb_not[rip]
	mov	rax, QWORD PTR -16[rbp]
	mov	rdx, rax
	call	eb_not
	mov	QWORD PTR -24[rbp], rax
	lea	rax, eb_strip1f[rip]
	mov	QWORD PTR -48[rbp], rax
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -40[rbp], rax
	lea	rax, eb_strip2f[rip]
	mov	QWORD PTR -64[rbp], rax
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -56[rbp], rax
	lea	r8, -64[rbp]
	lea	rdx, -48[rbp]
	lea	rcx, eb_if[rip]
	mov	rax, QWORD PTR -24[rbp]
	mov	r9, r8
	mov	r8, rdx
	mov	rdx, rax
	call	eb_if
	mov	QWORD PTR -32[rbp], rax
	mov	rax, QWORD PTR -32[rbp]
	add	rsp, 96
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_parse_any1f
	.def	eb_parse_any1f;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_parse_any1f
eb_parse_any1f:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 80
	.seh_stackalloc	80
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -8[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 16
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -16[rbp], rax
	lea	rcx, eb_state_data[rip]
	mov	rax, QWORD PTR -16[rbp]
	mov	rdx, rax
	call	eb_state_data
	mov	QWORD PTR -24[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 16
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -32[rbp], rax
	lea	rcx, eb_state_skip[rip]
	mov	rax, QWORD PTR -32[rbp]
	mov	rdx, rax
	call	eb_state_skip
	mov	QWORD PTR -40[rbp], rax
	mov	rax, QWORD PTR -8[rbp]
	mov	rax, QWORD PTR [rax]
	mov	r9, rax
	mov	rcx, QWORD PTR -40[rbp]
	mov	rdx, QWORD PTR -24[rbp]
	mov	rax, QWORD PTR -8[rbp]
	mov	r8, rcx
	mov	rcx, rax
	call	r9
	mov	QWORD PTR -48[rbp], rax
	mov	rax, QWORD PTR -48[rbp]
	add	rsp, 80
	pop	rbp
	ret
	.seh_endproc
	.section .rdata,"dr"
.LC13:
	.ascii "end of file\0"
	.text
	.globl	eb_parse_any2f
	.def	eb_parse_any2f;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_parse_any2f
eb_parse_any2f:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 96
	.seh_stackalloc	96
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -8[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 16
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -16[rbp], rax
	lea	rcx, eb_state_pos[rip]
	mov	rax, QWORD PTR -16[rbp]
	mov	rdx, rax
	call	eb_state_pos
	mov	QWORD PTR -24[rbp], rax
	lea	rax, .LC13[rip]
	mov	rdx, rax
	lea	rax, eb_parse_any2f0100.75[rip]
	mov	rcx, rax
	call	ebz_stol
	mov	rax, QWORD PTR eb_parse_any2f0100.75[rip]
	lea	rcx, eb_error_from_str[rip]
	mov	rdx, rax
	call	eb_error_from_str
	mov	QWORD PTR -32[rbp], rax
	lea	rcx, eb_error_from_got[rip]
	mov	rax, QWORD PTR -32[rbp]
	mov	rdx, rax
	call	eb_error_from_got
	mov	QWORD PTR -40[rbp], rax
	lea	rcx, eb_error_from_position[rip]
	mov	rdx, QWORD PTR -40[rbp]
	mov	rax, QWORD PTR -24[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_error_from_position
	mov	QWORD PTR -48[rbp], rax
	mov	rax, QWORD PTR -8[rbp]
	mov	rax, QWORD PTR [rax]
	mov	r8, rax
	mov	rdx, QWORD PTR -48[rbp]
	mov	rax, QWORD PTR -8[rbp]
	mov	rcx, rax
	call	r8
	mov	QWORD PTR -56[rbp], rax
	mov	rax, QWORD PTR -56[rbp]
	add	rsp, 96
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_parse_any
	.def	eb_parse_any;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_parse_any
eb_parse_any:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 112
	.seh_stackalloc	112
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	QWORD PTR 24[rbp], rdx
	mov	QWORD PTR 32[rbp], r8
	mov	QWORD PTR 40[rbp], r9
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -8[rbp], rax
	lea	rcx, eb_state_has_data[rip]
	mov	rax, QWORD PTR -8[rbp]
	mov	rdx, rax
	call	eb_state_has_data
	mov	QWORD PTR -16[rbp], rax
	lea	rax, eb_parse_any1f[rip]
	mov	QWORD PTR -48[rbp], rax
	mov	rax, QWORD PTR 32[rbp]
	mov	QWORD PTR -40[rbp], rax
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -32[rbp], rax
	lea	rax, eb_parse_any2f[rip]
	mov	QWORD PTR -80[rbp], rax
	mov	rax, QWORD PTR 40[rbp]
	mov	QWORD PTR -72[rbp], rax
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -64[rbp], rax
	lea	r8, -80[rbp]
	lea	rdx, -48[rbp]
	lea	rcx, eb_if[rip]
	mov	rax, QWORD PTR -16[rbp]
	mov	r9, r8
	mov	r8, rdx
	mov	rdx, rax
	call	eb_if
	mov	QWORD PTR -24[rbp], rax
	mov	rax, QWORD PTR -24[rbp]
	add	rsp, 112
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_parse_if1f1f
	.def	eb_parse_if1f1f;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_parse_if1f1f
eb_parse_if1f1f:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 64
	.seh_stackalloc	64
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -8[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 32
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -16[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 24
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -24[rbp], rax
	mov	rax, QWORD PTR -8[rbp]
	mov	rax, QWORD PTR [rax]
	mov	r9, rax
	mov	rcx, QWORD PTR -24[rbp]
	mov	rdx, QWORD PTR -16[rbp]
	mov	rax, QWORD PTR -8[rbp]
	mov	r8, rcx
	mov	rcx, rax
	call	r9
	mov	QWORD PTR -32[rbp], rax
	mov	rax, QWORD PTR -32[rbp]
	add	rsp, 64
	pop	rbp
	ret
	.seh_endproc
	.section .rdata,"dr"
.LC14:
	.ascii "match unknown criterion\0"
	.text
	.globl	eb_parse_if1f2f
	.def	eb_parse_if1f2f;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_parse_if1f2f
eb_parse_if1f2f:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 96
	.seh_stackalloc	96
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -8[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 24
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -16[rbp], rax
	lea	rcx, eb_state_pos[rip]
	mov	rax, QWORD PTR -16[rbp]
	mov	rdx, rax
	call	eb_state_pos
	mov	QWORD PTR -24[rbp], rax
	lea	rax, .LC14[rip]
	mov	rdx, rax
	lea	rax, eb_parse_if1f2f0100.74[rip]
	mov	rcx, rax
	call	ebz_stol
	mov	rax, QWORD PTR eb_parse_if1f2f0100.74[rip]
	lea	rcx, eb_error_from_str[rip]
	mov	rdx, rax
	call	eb_error_from_str
	mov	QWORD PTR -32[rbp], rax
	lea	rcx, eb_error_from_wanted[rip]
	mov	rax, QWORD PTR -32[rbp]
	mov	rdx, rax
	call	eb_error_from_wanted
	mov	QWORD PTR -40[rbp], rax
	lea	rcx, eb_error_from_position[rip]
	mov	rdx, QWORD PTR -40[rbp]
	mov	rax, QWORD PTR -24[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_error_from_position
	mov	QWORD PTR -48[rbp], rax
	mov	rax, QWORD PTR -8[rbp]
	mov	rax, QWORD PTR [rax]
	mov	r8, rax
	mov	rdx, QWORD PTR -48[rbp]
	mov	rax, QWORD PTR -8[rbp]
	mov	rcx, rax
	call	r8
	mov	QWORD PTR -56[rbp], rax
	mov	rax, QWORD PTR -56[rbp]
	add	rsp, 96
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_parse_if1f
	.def	eb_parse_if1f;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_parse_if1f
eb_parse_if1f:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 144
	.seh_stackalloc	144
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	QWORD PTR 24[rbp], rdx
	mov	QWORD PTR 32[rbp], r8
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 24
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -8[rbp], rax
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -16[rbp], rax
	mov	rax, QWORD PTR -8[rbp]
	mov	rax, QWORD PTR [rax]
	mov	r8, rax
	mov	rdx, QWORD PTR -16[rbp]
	mov	rax, QWORD PTR -8[rbp]
	mov	rcx, rax
	call	r8
	mov	QWORD PTR -24[rbp], rax
	lea	rax, eb_parse_if1f1f[rip]
	mov	QWORD PTR -80[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 16
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -72[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 32
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -64[rbp], rax
	mov	rax, QWORD PTR 32[rbp]
	mov	QWORD PTR -56[rbp], rax
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -48[rbp], rax
	lea	rax, eb_parse_if1f2f[rip]
	mov	QWORD PTR -112[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -104[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 32
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -96[rbp], rax
	mov	rax, QWORD PTR 32[rbp]
	mov	QWORD PTR -88[rbp], rax
	lea	r8, -112[rbp]
	lea	rdx, -80[rbp]
	lea	rcx, eb_if[rip]
	mov	rax, QWORD PTR -24[rbp]
	mov	r9, r8
	mov	r8, rdx
	mov	rdx, rax
	call	eb_if
	mov	QWORD PTR -32[rbp], rax
	mov	rax, QWORD PTR -32[rbp]
	add	rsp, 144
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_parse_if2f
	.def	eb_parse_if2f;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_parse_if2f
eb_parse_if2f:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 64
	.seh_stackalloc	64
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	QWORD PTR 24[rbp], rdx
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -8[rbp], rax
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -16[rbp], rax
	mov	rax, QWORD PTR -8[rbp]
	mov	rax, QWORD PTR [rax]
	mov	r8, rax
	mov	rdx, QWORD PTR -16[rbp]
	mov	rax, QWORD PTR -8[rbp]
	mov	rcx, rax
	call	r8
	mov	QWORD PTR -24[rbp], rax
	mov	rax, QWORD PTR -24[rbp]
	add	rsp, 64
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_parse_if
	.def	eb_parse_if;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_parse_if
eb_parse_if:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 112
	.seh_stackalloc	112
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	QWORD PTR 24[rbp], rdx
	mov	QWORD PTR 32[rbp], r8
	mov	QWORD PTR 40[rbp], r9
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -8[rbp], rax
	lea	rax, eb_parse_if1f[rip]
	mov	QWORD PTR -64[rbp], rax
	mov	rax, QWORD PTR 48[rbp]
	mov	QWORD PTR -56[rbp], rax
	mov	rax, QWORD PTR 40[rbp]
	mov	QWORD PTR -48[rbp], rax
	mov	rax, QWORD PTR 32[rbp]
	mov	QWORD PTR -40[rbp], rax
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -32[rbp], rax
	lea	rax, eb_parse_if2f[rip]
	mov	QWORD PTR -80[rbp], rax
	mov	rax, QWORD PTR 48[rbp]
	mov	QWORD PTR -72[rbp], rax
	lea	r8, -80[rbp]
	lea	rdx, -64[rbp]
	lea	rcx, eb_parse_any[rip]
	mov	rax, QWORD PTR -8[rbp]
	mov	r9, r8
	mov	r8, rdx
	mov	rdx, rax
	call	eb_parse_any
	mov	QWORD PTR -16[rbp], rax
	mov	rax, QWORD PTR -16[rbp]
	add	rsp, 112
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_parse_value1f
	.def	eb_parse_value1f;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_parse_value1f
eb_parse_value1f:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 64
	.seh_stackalloc	64
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	QWORD PTR 24[rbp], rdx
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -8[rbp], rax
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -16[rbp], rax
	lea	rcx, eb_equal[rip]
	mov	rdx, QWORD PTR -16[rbp]
	mov	rax, QWORD PTR -8[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_equal
	mov	QWORD PTR -24[rbp], rax
	mov	rax, QWORD PTR -24[rbp]
	add	rsp, 64
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_parse_value2f
	.def	eb_parse_value2f;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_parse_value2f
eb_parse_value2f:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 64
	.seh_stackalloc	64
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	QWORD PTR 24[rbp], rdx
	mov	QWORD PTR 32[rbp], r8
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -8[rbp], rax
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -16[rbp], rax
	mov	rax, QWORD PTR 32[rbp]
	mov	QWORD PTR -24[rbp], rax
	mov	rax, QWORD PTR -8[rbp]
	mov	rax, QWORD PTR [rax]
	mov	r9, rax
	mov	rcx, QWORD PTR -24[rbp]
	mov	rdx, QWORD PTR -16[rbp]
	mov	rax, QWORD PTR -8[rbp]
	mov	r8, rcx
	mov	rcx, rax
	call	r9
	mov	QWORD PTR -32[rbp], rax
	mov	rax, QWORD PTR -32[rbp]
	add	rsp, 64
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_parse_value3f01101f
	.def	eb_parse_value3f01101f;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_parse_value3f01101f
eb_parse_value3f01101f:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 64
	.seh_stackalloc	64
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -8[rbp], rax
	lea	rcx, eb_state_data[rip]
	mov	rax, QWORD PTR -8[rbp]
	mov	rdx, rax
	call	eb_state_data
	mov	QWORD PTR -16[rbp], rax
	lea	rcx, eb_error_from_char[rip]
	mov	rax, QWORD PTR -16[rbp]
	mov	rdx, rax
	call	eb_error_from_char
	mov	QWORD PTR -24[rbp], rax
	mov	rax, QWORD PTR -24[rbp]
	add	rsp, 64
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_parse_value3f01102f
	.def	eb_parse_value3f01102f;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_parse_value3f01102f
eb_parse_value3f01102f:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 48
	.seh_stackalloc	48
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	lea	rax, .LC13[rip]
	mov	rdx, rax
	lea	rax, eb_parse_value3f01102f0.73[rip]
	mov	rcx, rax
	call	ebz_stol
	mov	rax, QWORD PTR eb_parse_value3f01102f0.73[rip]
	lea	rcx, eb_error_from_str[rip]
	mov	rdx, rax
	call	eb_error_from_str
	mov	QWORD PTR -8[rbp], rax
	mov	rax, QWORD PTR -8[rbp]
	add	rsp, 48
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_parse_value3f
	.def	eb_parse_value3f;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_parse_value3f
eb_parse_value3f:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 176
	.seh_stackalloc	176
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	QWORD PTR 24[rbp], rdx
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -8[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 24
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -16[rbp], rax
	lea	rcx, eb_state_pos[rip]
	mov	rax, QWORD PTR -16[rbp]
	mov	rdx, rax
	call	eb_state_pos
	mov	QWORD PTR -24[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 16
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -32[rbp], rax
	lea	rcx, eb_error_from_char[rip]
	mov	rax, QWORD PTR -32[rbp]
	mov	rdx, rax
	call	eb_error_from_char
	mov	QWORD PTR -40[rbp], rax
	lea	rcx, eb_error_from_wanted[rip]
	mov	rax, QWORD PTR -40[rbp]
	mov	rdx, rax
	call	eb_error_from_wanted
	mov	QWORD PTR -48[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 24
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -56[rbp], rax
	lea	rcx, eb_state_has_data[rip]
	mov	rax, QWORD PTR -56[rbp]
	mov	rdx, rax
	call	eb_state_has_data
	mov	QWORD PTR -64[rbp], rax
	lea	rax, eb_parse_value3f01101f[rip]
	mov	QWORD PTR -128[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 24
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -120[rbp], rax
	lea	rax, eb_parse_value3f01102f[rip]
	mov	QWORD PTR -136[rbp], rax
	lea	r8, -136[rbp]
	lea	rdx, -128[rbp]
	lea	rcx, eb_if[rip]
	mov	rax, QWORD PTR -64[rbp]
	mov	r9, r8
	mov	r8, rdx
	mov	rdx, rax
	call	eb_if
	mov	QWORD PTR -72[rbp], rax
	lea	rcx, eb_error_from_got[rip]
	mov	rax, QWORD PTR -72[rbp]
	mov	rdx, rax
	call	eb_error_from_got
	mov	QWORD PTR -80[rbp], rax
	lea	rcx, eb_error_from_both[rip]
	mov	rdx, QWORD PTR -80[rbp]
	mov	rax, QWORD PTR -48[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_error_from_both
	mov	QWORD PTR -88[rbp], rax
	lea	rcx, eb_error_from_position[rip]
	mov	rdx, QWORD PTR -88[rbp]
	mov	rax, QWORD PTR -24[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_error_from_position
	mov	QWORD PTR -96[rbp], rax
	mov	rax, QWORD PTR -8[rbp]
	mov	rax, QWORD PTR [rax]
	mov	r8, rax
	mov	rdx, QWORD PTR -96[rbp]
	mov	rax, QWORD PTR -8[rbp]
	mov	rcx, rax
	call	r8
	mov	QWORD PTR -104[rbp], rax
	mov	rax, QWORD PTR -104[rbp]
	add	rsp, 176
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_parse_value
	.def	eb_parse_value;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_parse_value
eb_parse_value:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 144
	.seh_stackalloc	144
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	QWORD PTR 24[rbp], rdx
	mov	QWORD PTR 32[rbp], r8
	mov	QWORD PTR 40[rbp], r9
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -8[rbp], rax
	lea	rax, eb_parse_value1f[rip]
	mov	QWORD PTR -32[rbp], rax
	mov	rax, QWORD PTR 32[rbp]
	mov	QWORD PTR -24[rbp], rax
	lea	rax, eb_parse_value2f[rip]
	mov	QWORD PTR -64[rbp], rax
	mov	rax, QWORD PTR 40[rbp]
	mov	QWORD PTR -56[rbp], rax
	mov	rax, QWORD PTR 32[rbp]
	mov	QWORD PTR -48[rbp], rax
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -40[rbp], rax
	lea	rax, eb_parse_value3f[rip]
	mov	QWORD PTR -96[rbp], rax
	mov	rax, QWORD PTR 48[rbp]
	mov	QWORD PTR -88[rbp], rax
	mov	rax, QWORD PTR 32[rbp]
	mov	QWORD PTR -80[rbp], rax
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -72[rbp], rax
	lea	rdx, -96[rbp]
	lea	r9, -64[rbp]
	lea	r8, -32[rbp]
	lea	rcx, eb_parse_if[rip]
	mov	rax, QWORD PTR -8[rbp]
	mov	QWORD PTR 32[rsp], rdx
	mov	rdx, rax
	call	eb_parse_if
	mov	QWORD PTR -16[rbp], rax
	mov	rax, QWORD PTR -16[rbp]
	add	rsp, 144
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_parse_and1f1f1f1f
	.def	eb_parse_and1f1f1f1f;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_parse_and1f1f1f1f
eb_parse_and1f1f1f1f:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 80
	.seh_stackalloc	80
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	QWORD PTR 24[rbp], rdx
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -8[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 32
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -16[rbp], rax
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -24[rbp], rax
	lea	rcx, eb_cons[rip]
	mov	rdx, QWORD PTR -24[rbp]
	mov	rax, QWORD PTR -16[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_cons
	mov	QWORD PTR -32[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 40
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -40[rbp], rax
	mov	rax, QWORD PTR -8[rbp]
	mov	rax, QWORD PTR [rax]
	mov	r9, rax
	mov	rcx, QWORD PTR -40[rbp]
	mov	rdx, QWORD PTR -32[rbp]
	mov	rax, QWORD PTR -8[rbp]
	mov	r8, rcx
	mov	rcx, rax
	call	r9
	mov	QWORD PTR -48[rbp], rax
	mov	rax, QWORD PTR -48[rbp]
	add	rsp, 80
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_parse_and1f1f1f
	.def	eb_parse_and1f1f1f;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_parse_and1f1f1f
eb_parse_and1f1f1f:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 96
	.seh_stackalloc	96
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	QWORD PTR 24[rbp], rdx
	mov	QWORD PTR 32[rbp], r8
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -8[rbp], rax
	lea	rax, eb_parse_and1f1f1f1f[rip]
	mov	QWORD PTR -64[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -56[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 16
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -48[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 24
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -40[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 40
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -32[rbp], rax
	mov	rax, QWORD PTR 32[rbp]
	mov	QWORD PTR -24[rbp], rax
	lea	rdx, -64[rbp]
	lea	rcx, eb_let[rip]
	mov	rax, QWORD PTR -8[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_let
	mov	QWORD PTR -16[rbp], rax
	mov	rax, QWORD PTR -16[rbp]
	add	rsp, 96
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_parse_and1f1f2f
	.def	eb_parse_and1f1f2f;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_parse_and1f1f2f
eb_parse_and1f1f2f:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 64
	.seh_stackalloc	64
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	QWORD PTR 24[rbp], rdx
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -8[rbp], rax
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -16[rbp], rax
	mov	rax, QWORD PTR -8[rbp]
	mov	rax, QWORD PTR [rax]
	mov	r8, rax
	mov	rdx, QWORD PTR -16[rbp]
	mov	rax, QWORD PTR -8[rbp]
	mov	rcx, rax
	call	r8
	mov	QWORD PTR -24[rbp], rax
	mov	rax, QWORD PTR -24[rbp]
	add	rsp, 64
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_parse_and1f1f
	.def	eb_parse_and1f1f;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_parse_and1f1f
eb_parse_and1f1f:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	add	rsp, -128
	.seh_stackalloc	128
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	QWORD PTR 24[rbp], rdx
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 24
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -8[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 40
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -16[rbp], rax
	lea	rax, eb_parse_and1f1f1f[rip]
	mov	QWORD PTR -80[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 16
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -72[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 32
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -64[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 40
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -56[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 48
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -48[rbp], rax
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -40[rbp], rax
	lea	rax, eb_parse_and1f1f2f[rip]
	mov	QWORD PTR -96[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -88[rbp], rax
	mov	rax, QWORD PTR -8[rbp]
	mov	rax, QWORD PTR [rax]
	mov	r10, rax
	lea	r8, -96[rbp]
	lea	rcx, -80[rbp]
	mov	rdx, QWORD PTR -16[rbp]
	mov	rax, QWORD PTR -8[rbp]
	mov	r9, r8
	mov	r8, rcx
	mov	rcx, rax
	call	r10
	mov	QWORD PTR -24[rbp], rax
	mov	rax, QWORD PTR -24[rbp]
	sub	rsp, -128
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_parse_and1f
	.def	eb_parse_and1f;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_parse_and1f
eb_parse_and1f:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 112
	.seh_stackalloc	112
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	QWORD PTR 24[rbp], rdx
	mov	QWORD PTR 32[rbp], r8
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -8[rbp], rax
	lea	rax, eb_parse_and1f1f[rip]
	mov	QWORD PTR -80[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -72[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 16
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -64[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 24
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -56[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 32
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -48[rbp], rax
	mov	rax, QWORD PTR 32[rbp]
	mov	QWORD PTR -40[rbp], rax
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -32[rbp], rax
	lea	rdx, -80[rbp]
	lea	rcx, eb_let[rip]
	mov	rax, QWORD PTR -8[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_let
	mov	QWORD PTR -16[rbp], rax
	mov	rax, QWORD PTR -16[rbp]
	add	rsp, 112
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_parse_and2f
	.def	eb_parse_and2f;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_parse_and2f
eb_parse_and2f:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 64
	.seh_stackalloc	64
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	QWORD PTR 24[rbp], rdx
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -8[rbp], rax
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -16[rbp], rax
	mov	rax, QWORD PTR -8[rbp]
	mov	rax, QWORD PTR [rax]
	mov	r8, rax
	mov	rdx, QWORD PTR -16[rbp]
	mov	rax, QWORD PTR -8[rbp]
	mov	rcx, rax
	call	r8
	mov	QWORD PTR -24[rbp], rax
	mov	rax, QWORD PTR -24[rbp]
	add	rsp, 64
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_parse_and
	.def	eb_parse_and;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_parse_and
eb_parse_and:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 112
	.seh_stackalloc	112
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	QWORD PTR 24[rbp], rdx
	mov	QWORD PTR 32[rbp], r8
	mov	QWORD PTR 40[rbp], r9
	mov	rax, QWORD PTR 32[rbp]
	mov	QWORD PTR -8[rbp], rax
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -16[rbp], rax
	lea	rax, eb_parse_and1f[rip]
	mov	QWORD PTR -64[rbp], rax
	mov	rax, QWORD PTR 56[rbp]
	mov	QWORD PTR -56[rbp], rax
	mov	rax, QWORD PTR 48[rbp]
	mov	QWORD PTR -48[rbp], rax
	mov	rax, QWORD PTR 40[rbp]
	mov	QWORD PTR -40[rbp], rax
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -32[rbp], rax
	lea	rax, eb_parse_and2f[rip]
	mov	QWORD PTR -80[rbp], rax
	mov	rax, QWORD PTR 56[rbp]
	mov	QWORD PTR -72[rbp], rax
	mov	rax, QWORD PTR -8[rbp]
	mov	rax, QWORD PTR [rax]
	mov	r10, rax
	lea	r8, -80[rbp]
	lea	rcx, -64[rbp]
	mov	rdx, QWORD PTR -16[rbp]
	mov	rax, QWORD PTR -8[rbp]
	mov	r9, r8
	mov	r8, rcx
	mov	rcx, rax
	call	r10
	mov	QWORD PTR -24[rbp], rax
	mov	rax, QWORD PTR -24[rbp]
	add	rsp, 112
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_parse_zero_or_more1f1f
	.def	eb_parse_zero_or_more1f1f;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_parse_zero_or_more1f1f
eb_parse_zero_or_more1f1f:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 64
	.seh_stackalloc	64
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	QWORD PTR 24[rbp], rdx
	mov	QWORD PTR 32[rbp], r8
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 24
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -8[rbp], rax
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -16[rbp], rax
	mov	rax, QWORD PTR 32[rbp]
	mov	QWORD PTR -24[rbp], rax
	mov	rax, QWORD PTR -8[rbp]
	mov	rax, QWORD PTR [rax]
	mov	r9, rax
	mov	rcx, QWORD PTR -24[rbp]
	mov	rdx, QWORD PTR -16[rbp]
	mov	rax, QWORD PTR -8[rbp]
	mov	r8, rcx
	mov	rcx, rax
	call	r9
	mov	QWORD PTR -32[rbp], rax
	mov	rax, QWORD PTR -32[rbp]
	add	rsp, 64
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_parse_zero_or_more1f2f
	.def	eb_parse_zero_or_more1f2f;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_parse_zero_or_more1f2f
eb_parse_zero_or_more1f2f:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 64
	.seh_stackalloc	64
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	QWORD PTR 24[rbp], rdx
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 16
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -8[rbp], rax
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -16[rbp], rax
	mov	rax, QWORD PTR -8[rbp]
	mov	rax, QWORD PTR [rax]
	mov	r8, rax
	mov	rdx, QWORD PTR -16[rbp]
	mov	rax, QWORD PTR -8[rbp]
	mov	rcx, rax
	call	r8
	mov	QWORD PTR -24[rbp], rax
	mov	rax, QWORD PTR -24[rbp]
	add	rsp, 64
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_parse_zero_or_more1f
	.def	eb_parse_zero_or_more1f;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_parse_zero_or_more1f
eb_parse_zero_or_more1f:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	add	rsp, -128
	.seh_stackalloc	128
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	QWORD PTR 24[rbp], rdx
	mov	QWORD PTR 32[rbp], r8
	mov	QWORD PTR 40[rbp], r9
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 24
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -8[rbp], rax
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -16[rbp], rax
	lea	rax, eb_parse_zero_or_more1f1f[rip]
	mov	QWORD PTR -64[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 16
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -56[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 32
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -48[rbp], rax
	mov	rax, QWORD PTR 32[rbp]
	mov	QWORD PTR -40[rbp], rax
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -32[rbp], rax
	lea	rax, eb_parse_zero_or_more1f2f[rip]
	mov	QWORD PTR -96[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -88[rbp], rax
	mov	rax, QWORD PTR 40[rbp]
	mov	QWORD PTR -80[rbp], rax
	mov	rax, QWORD PTR -8[rbp]
	mov	rax, QWORD PTR [rax]
	mov	r10, rax
	lea	r8, -96[rbp]
	lea	rcx, -64[rbp]
	mov	rdx, QWORD PTR -16[rbp]
	mov	rax, QWORD PTR -8[rbp]
	mov	r9, r8
	mov	r8, rcx
	mov	rcx, rax
	call	r10
	mov	QWORD PTR -24[rbp], rax
	mov	rax, QWORD PTR -24[rbp]
	sub	rsp, -128
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_parse_zero_or_more2f1f1f
	.def	eb_parse_zero_or_more2f1f1f;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_parse_zero_or_more2f1f1f
eb_parse_zero_or_more2f1f1f:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 64
	.seh_stackalloc	64
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	QWORD PTR 24[rbp], rdx
	mov	QWORD PTR 32[rbp], r8
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 40
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -8[rbp], rax
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -16[rbp], rax
	mov	rax, QWORD PTR 32[rbp]
	mov	QWORD PTR -24[rbp], rax
	mov	rax, QWORD PTR -8[rbp]
	mov	rax, QWORD PTR [rax]
	mov	r9, rax
	mov	rcx, QWORD PTR -24[rbp]
	mov	rdx, QWORD PTR -16[rbp]
	mov	rax, QWORD PTR -8[rbp]
	mov	r8, rcx
	mov	rcx, rax
	call	r9
	mov	QWORD PTR -32[rbp], rax
	mov	rax, QWORD PTR -32[rbp]
	add	rsp, 64
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_parse_zero_or_more2f1f2f
	.def	eb_parse_zero_or_more2f1f2f;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_parse_zero_or_more2f1f2f
eb_parse_zero_or_more2f1f2f:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 64
	.seh_stackalloc	64
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	QWORD PTR 24[rbp], rdx
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 24
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -8[rbp], rax
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -16[rbp], rax
	mov	rax, QWORD PTR -8[rbp]
	mov	rax, QWORD PTR [rax]
	mov	r8, rax
	mov	rdx, QWORD PTR -16[rbp]
	mov	rax, QWORD PTR -8[rbp]
	mov	rcx, rax
	call	r8
	mov	QWORD PTR -24[rbp], rax
	mov	rax, QWORD PTR -24[rbp]
	add	rsp, 64
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_parse_zero_or_more2f1f
	.def	eb_parse_zero_or_more2f1f;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_parse_zero_or_more2f1f
eb_parse_zero_or_more2f1f:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 144
	.seh_stackalloc	144
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	QWORD PTR 24[rbp], rdx
	mov	QWORD PTR 32[rbp], r8
	mov	QWORD PTR 40[rbp], r9
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 24
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -8[rbp], rax
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -16[rbp], rax
	lea	rax, eb_parse_zero_or_more2f1f1f[rip]
	mov	QWORD PTR -80[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 16
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -72[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 32
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -64[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 48
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -56[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 56
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -48[rbp], rax
	mov	rax, QWORD PTR 32[rbp]
	mov	QWORD PTR -40[rbp], rax
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -32[rbp], rax
	lea	rax, eb_parse_zero_or_more2f1f2f[rip]
	mov	QWORD PTR -112[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -104[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 40
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -96[rbp], rax
	mov	rax, QWORD PTR 40[rbp]
	mov	QWORD PTR -88[rbp], rax
	mov	rax, QWORD PTR -8[rbp]
	mov	rax, QWORD PTR [rax]
	mov	r10, rax
	lea	r8, -112[rbp]
	lea	rcx, -80[rbp]
	mov	rdx, QWORD PTR -16[rbp]
	mov	rax, QWORD PTR -8[rbp]
	mov	r9, r8
	mov	r8, rcx
	mov	rcx, rax
	call	r10
	mov	QWORD PTR -24[rbp], rax
	mov	rax, QWORD PTR -24[rbp]
	add	rsp, 144
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_parse_zero_or_more2f2f
	.def	eb_parse_zero_or_more2f2f;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_parse_zero_or_more2f2f
eb_parse_zero_or_more2f2f:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 64
	.seh_stackalloc	64
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	QWORD PTR 24[rbp], rdx
	mov	QWORD PTR 32[rbp], r8
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 24
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -8[rbp], rax
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -16[rbp], rax
	mov	rax, QWORD PTR 32[rbp]
	mov	QWORD PTR -24[rbp], rax
	mov	rax, QWORD PTR -8[rbp]
	mov	rax, QWORD PTR [rax]
	mov	r9, rax
	mov	rcx, QWORD PTR -24[rbp]
	mov	rdx, QWORD PTR -16[rbp]
	mov	rax, QWORD PTR -8[rbp]
	mov	r8, rcx
	mov	rcx, rax
	call	r9
	mov	QWORD PTR -32[rbp], rax
	mov	rax, QWORD PTR -32[rbp]
	add	rsp, 64
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_parse_zero_or_more2f3f
	.def	eb_parse_zero_or_more2f3f;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_parse_zero_or_more2f3f
eb_parse_zero_or_more2f3f:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 64
	.seh_stackalloc	64
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	QWORD PTR 24[rbp], rdx
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 16
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -8[rbp], rax
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -16[rbp], rax
	mov	rax, QWORD PTR -8[rbp]
	mov	rax, QWORD PTR [rax]
	mov	r8, rax
	mov	rdx, QWORD PTR -16[rbp]
	mov	rax, QWORD PTR -8[rbp]
	mov	rcx, rax
	call	r8
	mov	QWORD PTR -24[rbp], rax
	mov	rax, QWORD PTR -24[rbp]
	add	rsp, 64
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_parse_zero_or_more2f
	.def	eb_parse_zero_or_more2f;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_parse_zero_or_more2f
eb_parse_zero_or_more2f:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 208
	.seh_stackalloc	208
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	QWORD PTR 24[rbp], rdx
	mov	QWORD PTR 32[rbp], r8
	mov	QWORD PTR 40[rbp], r9
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -8[rbp], rax
	lea	rax, eb_parse_zero_or_more2f1f[rip]
	mov	QWORD PTR -80[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -72[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 16
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -64[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 24
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -56[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 32
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -48[rbp], rax
	mov	rax, QWORD PTR 40[rbp]
	mov	QWORD PTR -40[rbp], rax
	mov	rax, QWORD PTR 32[rbp]
	mov	QWORD PTR -32[rbp], rax
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -24[rbp], rax
	lea	rax, eb_parse_zero_or_more2f2f[rip]
	mov	QWORD PTR -128[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 16
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -120[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 32
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -112[rbp], rax
	mov	rax, QWORD PTR 32[rbp]
	mov	QWORD PTR -104[rbp], rax
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -96[rbp], rax
	lea	rax, eb_parse_zero_or_more2f3f[rip]
	mov	QWORD PTR -160[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -152[rbp], rax
	mov	rax, QWORD PTR 40[rbp]
	mov	QWORD PTR -144[rbp], rax
	lea	rdx, -160[rbp]
	lea	r9, -128[rbp]
	lea	r8, -80[rbp]
	lea	rcx, eb_parse_zero_or_more[rip]
	mov	rax, QWORD PTR -8[rbp]
	mov	QWORD PTR 32[rsp], rdx
	mov	rdx, rax
	call	eb_parse_zero_or_more
	mov	QWORD PTR -16[rbp], rax
	mov	rax, QWORD PTR -16[rbp]
	add	rsp, 208
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_parse_zero_or_more3f
	.def	eb_parse_zero_or_more3f;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_parse_zero_or_more3f
eb_parse_zero_or_more3f:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 64
	.seh_stackalloc	64
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	QWORD PTR 24[rbp], rdx
	mov	QWORD PTR 32[rbp], r8
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -8[rbp], rax
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -16[rbp], rax
	mov	rax, QWORD PTR 32[rbp]
	mov	QWORD PTR -24[rbp], rax
	mov	rax, QWORD PTR -8[rbp]
	mov	rax, QWORD PTR [rax]
	mov	r9, rax
	mov	rcx, QWORD PTR -24[rbp]
	mov	rdx, QWORD PTR -16[rbp]
	mov	rax, QWORD PTR -8[rbp]
	mov	r8, rcx
	mov	rcx, rax
	call	r9
	mov	QWORD PTR -32[rbp], rax
	mov	rax, QWORD PTR -32[rbp]
	add	rsp, 64
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_parse_zero_or_more4f
	.def	eb_parse_zero_or_more4f;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_parse_zero_or_more4f
eb_parse_zero_or_more4f:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 64
	.seh_stackalloc	64
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	QWORD PTR 24[rbp], rdx
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -8[rbp], rax
	mov	QWORD PTR -16[rbp], 0
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 16
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -24[rbp], rax
	mov	rax, QWORD PTR -8[rbp]
	mov	rax, QWORD PTR [rax]
	mov	r9, rax
	mov	rcx, QWORD PTR -24[rbp]
	mov	rdx, QWORD PTR -16[rbp]
	mov	rax, QWORD PTR -8[rbp]
	mov	r8, rcx
	mov	rcx, rax
	call	r9
	mov	QWORD PTR -32[rbp], rax
	mov	rax, QWORD PTR -32[rbp]
	add	rsp, 64
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_parse_zero_or_more
	.def	eb_parse_zero_or_more;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_parse_zero_or_more
eb_parse_zero_or_more:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 224
	.seh_stackalloc	224
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	QWORD PTR 24[rbp], rdx
	mov	QWORD PTR 32[rbp], r8
	mov	QWORD PTR 40[rbp], r9
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -8[rbp], rax
	lea	rax, eb_parse_zero_or_more1f[rip]
	mov	QWORD PTR -64[rbp], rax
	mov	rax, QWORD PTR 48[rbp]
	mov	QWORD PTR -56[rbp], rax
	mov	rax, QWORD PTR 40[rbp]
	mov	QWORD PTR -48[rbp], rax
	mov	rax, QWORD PTR 32[rbp]
	mov	QWORD PTR -40[rbp], rax
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -32[rbp], rax
	lea	rax, eb_parse_zero_or_more2f[rip]
	mov	QWORD PTR -112[rbp], rax
	mov	rax, QWORD PTR 48[rbp]
	mov	QWORD PTR -104[rbp], rax
	mov	rax, QWORD PTR 40[rbp]
	mov	QWORD PTR -96[rbp], rax
	mov	rax, QWORD PTR 32[rbp]
	mov	QWORD PTR -88[rbp], rax
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -80[rbp], rax
	lea	rax, eb_parse_zero_or_more3f[rip]
	mov	QWORD PTR -144[rbp], rax
	mov	rax, QWORD PTR 40[rbp]
	mov	QWORD PTR -136[rbp], rax
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -128[rbp], rax
	lea	rax, eb_parse_zero_or_more4f[rip]
	mov	QWORD PTR -176[rbp], rax
	mov	rax, QWORD PTR 40[rbp]
	mov	QWORD PTR -168[rbp], rax
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -160[rbp], rax
	lea	r8, -176[rbp]
	lea	rdx, -144[rbp]
	lea	r9, -112[rbp]
	lea	r10, -64[rbp]
	lea	rcx, eb_parse_and[rip]
	mov	rax, QWORD PTR -8[rbp]
	mov	QWORD PTR 40[rsp], r8
	mov	QWORD PTR 32[rsp], rdx
	mov	r8, r10
	mov	rdx, rax
	call	eb_parse_and
	mov	QWORD PTR -16[rbp], rax
	mov	rax, QWORD PTR -16[rbp]
	add	rsp, 224
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_parse_one_or_more1f1f
	.def	eb_parse_one_or_more1f1f;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_parse_one_or_more1f1f
eb_parse_one_or_more1f1f:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 64
	.seh_stackalloc	64
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	QWORD PTR 24[rbp], rdx
	mov	QWORD PTR 32[rbp], r8
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 24
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -8[rbp], rax
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -16[rbp], rax
	mov	rax, QWORD PTR 32[rbp]
	mov	QWORD PTR -24[rbp], rax
	mov	rax, QWORD PTR -8[rbp]
	mov	rax, QWORD PTR [rax]
	mov	r9, rax
	mov	rcx, QWORD PTR -24[rbp]
	mov	rdx, QWORD PTR -16[rbp]
	mov	rax, QWORD PTR -8[rbp]
	mov	r8, rcx
	mov	rcx, rax
	call	r9
	mov	QWORD PTR -32[rbp], rax
	mov	rax, QWORD PTR -32[rbp]
	add	rsp, 64
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_parse_one_or_more1f2f
	.def	eb_parse_one_or_more1f2f;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_parse_one_or_more1f2f
eb_parse_one_or_more1f2f:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 64
	.seh_stackalloc	64
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	QWORD PTR 24[rbp], rdx
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 16
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -8[rbp], rax
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -16[rbp], rax
	mov	rax, QWORD PTR -8[rbp]
	mov	rax, QWORD PTR [rax]
	mov	r8, rax
	mov	rdx, QWORD PTR -16[rbp]
	mov	rax, QWORD PTR -8[rbp]
	mov	rcx, rax
	call	r8
	mov	QWORD PTR -24[rbp], rax
	mov	rax, QWORD PTR -24[rbp]
	add	rsp, 64
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_parse_one_or_more1f
	.def	eb_parse_one_or_more1f;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_parse_one_or_more1f
eb_parse_one_or_more1f:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	add	rsp, -128
	.seh_stackalloc	128
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	QWORD PTR 24[rbp], rdx
	mov	QWORD PTR 32[rbp], r8
	mov	QWORD PTR 40[rbp], r9
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 24
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -8[rbp], rax
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -16[rbp], rax
	lea	rax, eb_parse_one_or_more1f1f[rip]
	mov	QWORD PTR -64[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 16
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -56[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 32
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -48[rbp], rax
	mov	rax, QWORD PTR 32[rbp]
	mov	QWORD PTR -40[rbp], rax
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -32[rbp], rax
	lea	rax, eb_parse_one_or_more1f2f[rip]
	mov	QWORD PTR -96[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -88[rbp], rax
	mov	rax, QWORD PTR 40[rbp]
	mov	QWORD PTR -80[rbp], rax
	mov	rax, QWORD PTR -8[rbp]
	mov	rax, QWORD PTR [rax]
	mov	r10, rax
	lea	r8, -96[rbp]
	lea	rcx, -64[rbp]
	mov	rdx, QWORD PTR -16[rbp]
	mov	rax, QWORD PTR -8[rbp]
	mov	r9, r8
	mov	r8, rcx
	mov	rcx, rax
	call	r10
	mov	QWORD PTR -24[rbp], rax
	mov	rax, QWORD PTR -24[rbp]
	sub	rsp, -128
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_parse_one_or_more2f1f1f
	.def	eb_parse_one_or_more2f1f1f;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_parse_one_or_more2f1f1f
eb_parse_one_or_more2f1f1f:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 64
	.seh_stackalloc	64
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	QWORD PTR 24[rbp], rdx
	mov	QWORD PTR 32[rbp], r8
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 40
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -8[rbp], rax
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -16[rbp], rax
	mov	rax, QWORD PTR 32[rbp]
	mov	QWORD PTR -24[rbp], rax
	mov	rax, QWORD PTR -8[rbp]
	mov	rax, QWORD PTR [rax]
	mov	r9, rax
	mov	rcx, QWORD PTR -24[rbp]
	mov	rdx, QWORD PTR -16[rbp]
	mov	rax, QWORD PTR -8[rbp]
	mov	r8, rcx
	mov	rcx, rax
	call	r9
	mov	QWORD PTR -32[rbp], rax
	mov	rax, QWORD PTR -32[rbp]
	add	rsp, 64
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_parse_one_or_more2f1f2f
	.def	eb_parse_one_or_more2f1f2f;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_parse_one_or_more2f1f2f
eb_parse_one_or_more2f1f2f:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 64
	.seh_stackalloc	64
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	QWORD PTR 24[rbp], rdx
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 24
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -8[rbp], rax
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -16[rbp], rax
	mov	rax, QWORD PTR -8[rbp]
	mov	rax, QWORD PTR [rax]
	mov	r8, rax
	mov	rdx, QWORD PTR -16[rbp]
	mov	rax, QWORD PTR -8[rbp]
	mov	rcx, rax
	call	r8
	mov	QWORD PTR -24[rbp], rax
	mov	rax, QWORD PTR -24[rbp]
	add	rsp, 64
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_parse_one_or_more2f1f
	.def	eb_parse_one_or_more2f1f;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_parse_one_or_more2f1f
eb_parse_one_or_more2f1f:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 144
	.seh_stackalloc	144
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	QWORD PTR 24[rbp], rdx
	mov	QWORD PTR 32[rbp], r8
	mov	QWORD PTR 40[rbp], r9
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 24
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -8[rbp], rax
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -16[rbp], rax
	lea	rax, eb_parse_one_or_more2f1f1f[rip]
	mov	QWORD PTR -80[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 16
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -72[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 32
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -64[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 48
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -56[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 56
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -48[rbp], rax
	mov	rax, QWORD PTR 32[rbp]
	mov	QWORD PTR -40[rbp], rax
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -32[rbp], rax
	lea	rax, eb_parse_one_or_more2f1f2f[rip]
	mov	QWORD PTR -112[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -104[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 40
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -96[rbp], rax
	mov	rax, QWORD PTR 40[rbp]
	mov	QWORD PTR -88[rbp], rax
	mov	rax, QWORD PTR -8[rbp]
	mov	rax, QWORD PTR [rax]
	mov	r10, rax
	lea	r8, -112[rbp]
	lea	rcx, -80[rbp]
	mov	rdx, QWORD PTR -16[rbp]
	mov	rax, QWORD PTR -8[rbp]
	mov	r9, r8
	mov	r8, rcx
	mov	rcx, rax
	call	r10
	mov	QWORD PTR -24[rbp], rax
	mov	rax, QWORD PTR -24[rbp]
	add	rsp, 144
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_parse_one_or_more2f2f
	.def	eb_parse_one_or_more2f2f;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_parse_one_or_more2f2f
eb_parse_one_or_more2f2f:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 64
	.seh_stackalloc	64
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	QWORD PTR 24[rbp], rdx
	mov	QWORD PTR 32[rbp], r8
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 24
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -8[rbp], rax
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -16[rbp], rax
	mov	rax, QWORD PTR 32[rbp]
	mov	QWORD PTR -24[rbp], rax
	mov	rax, QWORD PTR -8[rbp]
	mov	rax, QWORD PTR [rax]
	mov	r9, rax
	mov	rcx, QWORD PTR -24[rbp]
	mov	rdx, QWORD PTR -16[rbp]
	mov	rax, QWORD PTR -8[rbp]
	mov	r8, rcx
	mov	rcx, rax
	call	r9
	mov	QWORD PTR -32[rbp], rax
	mov	rax, QWORD PTR -32[rbp]
	add	rsp, 64
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_parse_one_or_more2f3f
	.def	eb_parse_one_or_more2f3f;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_parse_one_or_more2f3f
eb_parse_one_or_more2f3f:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 64
	.seh_stackalloc	64
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	QWORD PTR 24[rbp], rdx
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 16
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -8[rbp], rax
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -16[rbp], rax
	mov	rax, QWORD PTR -8[rbp]
	mov	rax, QWORD PTR [rax]
	mov	r8, rax
	mov	rdx, QWORD PTR -16[rbp]
	mov	rax, QWORD PTR -8[rbp]
	mov	rcx, rax
	call	r8
	mov	QWORD PTR -24[rbp], rax
	mov	rax, QWORD PTR -24[rbp]
	add	rsp, 64
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_parse_one_or_more2f
	.def	eb_parse_one_or_more2f;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_parse_one_or_more2f
eb_parse_one_or_more2f:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 208
	.seh_stackalloc	208
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	QWORD PTR 24[rbp], rdx
	mov	QWORD PTR 32[rbp], r8
	mov	QWORD PTR 40[rbp], r9
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -8[rbp], rax
	lea	rax, eb_parse_one_or_more2f1f[rip]
	mov	QWORD PTR -80[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -72[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 16
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -64[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 24
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -56[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 32
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -48[rbp], rax
	mov	rax, QWORD PTR 40[rbp]
	mov	QWORD PTR -40[rbp], rax
	mov	rax, QWORD PTR 32[rbp]
	mov	QWORD PTR -32[rbp], rax
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -24[rbp], rax
	lea	rax, eb_parse_one_or_more2f2f[rip]
	mov	QWORD PTR -128[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 16
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -120[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 32
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -112[rbp], rax
	mov	rax, QWORD PTR 32[rbp]
	mov	QWORD PTR -104[rbp], rax
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -96[rbp], rax
	lea	rax, eb_parse_one_or_more2f3f[rip]
	mov	QWORD PTR -160[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -152[rbp], rax
	mov	rax, QWORD PTR 40[rbp]
	mov	QWORD PTR -144[rbp], rax
	lea	rdx, -160[rbp]
	lea	r9, -128[rbp]
	lea	r8, -80[rbp]
	lea	rcx, eb_parse_zero_or_more[rip]
	mov	rax, QWORD PTR -8[rbp]
	mov	QWORD PTR 32[rsp], rdx
	mov	rdx, rax
	call	eb_parse_zero_or_more
	mov	QWORD PTR -16[rbp], rax
	mov	rax, QWORD PTR -16[rbp]
	add	rsp, 208
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_parse_one_or_more3f
	.def	eb_parse_one_or_more3f;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_parse_one_or_more3f
eb_parse_one_or_more3f:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 64
	.seh_stackalloc	64
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	QWORD PTR 24[rbp], rdx
	mov	QWORD PTR 32[rbp], r8
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -8[rbp], rax
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -16[rbp], rax
	mov	rax, QWORD PTR 32[rbp]
	mov	QWORD PTR -24[rbp], rax
	mov	rax, QWORD PTR -8[rbp]
	mov	rax, QWORD PTR [rax]
	mov	r9, rax
	mov	rcx, QWORD PTR -24[rbp]
	mov	rdx, QWORD PTR -16[rbp]
	mov	rax, QWORD PTR -8[rbp]
	mov	r8, rcx
	mov	rcx, rax
	call	r9
	mov	QWORD PTR -32[rbp], rax
	mov	rax, QWORD PTR -32[rbp]
	add	rsp, 64
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_parse_one_or_more4f
	.def	eb_parse_one_or_more4f;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_parse_one_or_more4f
eb_parse_one_or_more4f:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 64
	.seh_stackalloc	64
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	QWORD PTR 24[rbp], rdx
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -8[rbp], rax
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -16[rbp], rax
	mov	rax, QWORD PTR -8[rbp]
	mov	rax, QWORD PTR [rax]
	mov	r8, rax
	mov	rdx, QWORD PTR -16[rbp]
	mov	rax, QWORD PTR -8[rbp]
	mov	rcx, rax
	call	r8
	mov	QWORD PTR -24[rbp], rax
	mov	rax, QWORD PTR -24[rbp]
	add	rsp, 64
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_parse_one_or_more
	.def	eb_parse_one_or_more;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_parse_one_or_more
eb_parse_one_or_more:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 208
	.seh_stackalloc	208
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	QWORD PTR 24[rbp], rdx
	mov	QWORD PTR 32[rbp], r8
	mov	QWORD PTR 40[rbp], r9
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -8[rbp], rax
	lea	rax, eb_parse_one_or_more1f[rip]
	mov	QWORD PTR -64[rbp], rax
	mov	rax, QWORD PTR 48[rbp]
	mov	QWORD PTR -56[rbp], rax
	mov	rax, QWORD PTR 40[rbp]
	mov	QWORD PTR -48[rbp], rax
	mov	rax, QWORD PTR 32[rbp]
	mov	QWORD PTR -40[rbp], rax
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -32[rbp], rax
	lea	rax, eb_parse_one_or_more2f[rip]
	mov	QWORD PTR -112[rbp], rax
	mov	rax, QWORD PTR 48[rbp]
	mov	QWORD PTR -104[rbp], rax
	mov	rax, QWORD PTR 40[rbp]
	mov	QWORD PTR -96[rbp], rax
	mov	rax, QWORD PTR 32[rbp]
	mov	QWORD PTR -88[rbp], rax
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -80[rbp], rax
	lea	rax, eb_parse_one_or_more3f[rip]
	mov	QWORD PTR -144[rbp], rax
	mov	rax, QWORD PTR 40[rbp]
	mov	QWORD PTR -136[rbp], rax
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -128[rbp], rax
	lea	rax, eb_parse_one_or_more4f[rip]
	mov	QWORD PTR -160[rbp], rax
	mov	rax, QWORD PTR 48[rbp]
	mov	QWORD PTR -152[rbp], rax
	lea	r8, -160[rbp]
	lea	rdx, -144[rbp]
	lea	r9, -112[rbp]
	lea	r10, -64[rbp]
	lea	rcx, eb_parse_and[rip]
	mov	rax, QWORD PTR -8[rbp]
	mov	QWORD PTR 40[rsp], r8
	mov	QWORD PTR 32[rsp], rdx
	mov	r8, r10
	mov	rdx, rax
	call	eb_parse_and
	mov	QWORD PTR -16[rbp], rax
	mov	rax, QWORD PTR -16[rbp]
	add	rsp, 208
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_binding_of_value
	.def	eb_binding_of_value;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_binding_of_value
eb_binding_of_value:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 16
	.seh_stackalloc	16
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	QWORD PTR -8[rbp], 0
	mov	rax, QWORD PTR -8[rbp]
	add	rsp, 16
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_binding_of_lambda
	.def	eb_binding_of_lambda;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_binding_of_lambda
eb_binding_of_lambda:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 16
	.seh_stackalloc	16
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	QWORD PTR -8[rbp], 1
	mov	rax, QWORD PTR -8[rbp]
	add	rsp, 16
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_binding_of_generic
	.def	eb_binding_of_generic;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_binding_of_generic
eb_binding_of_generic:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 16
	.seh_stackalloc	16
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	QWORD PTR -8[rbp], 2
	mov	rax, QWORD PTR -8[rbp]
	add	rsp, 16
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_binding_value
	.def	eb_binding_value;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_binding_value
eb_binding_value:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 64
	.seh_stackalloc	64
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	QWORD PTR 24[rbp], rdx
	lea	rax, eb_binding_of_value[rip]
	mov	rcx, rax
	call	eb_binding_of_value
	mov	QWORD PTR -8[rbp], rax
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -16[rbp], rax
	lea	rcx, eb_cons[rip]
	mov	rdx, QWORD PTR -16[rbp]
	mov	rax, QWORD PTR -8[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_cons
	mov	QWORD PTR -24[rbp], rax
	mov	rax, QWORD PTR -24[rbp]
	add	rsp, 64
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_binding_lambda
	.def	eb_binding_lambda;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_binding_lambda
eb_binding_lambda:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 96
	.seh_stackalloc	96
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	QWORD PTR 24[rbp], rdx
	mov	QWORD PTR 32[rbp], r8
	mov	QWORD PTR 40[rbp], r9
	lea	rax, eb_binding_of_lambda[rip]
	mov	rcx, rax
	call	eb_binding_of_lambda
	mov	QWORD PTR -8[rbp], rax
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -16[rbp], rax
	mov	rax, QWORD PTR 32[rbp]
	mov	QWORD PTR -24[rbp], rax
	mov	rax, QWORD PTR 40[rbp]
	mov	QWORD PTR -32[rbp], rax
	lea	rcx, eb_cons[rip]
	mov	rdx, QWORD PTR -32[rbp]
	mov	rax, QWORD PTR -24[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_cons
	mov	QWORD PTR -40[rbp], rax
	lea	rcx, eb_cons[rip]
	mov	rdx, QWORD PTR -40[rbp]
	mov	rax, QWORD PTR -16[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_cons
	mov	QWORD PTR -48[rbp], rax
	lea	rcx, eb_cons[rip]
	mov	rdx, QWORD PTR -48[rbp]
	mov	rax, QWORD PTR -8[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_cons
	mov	QWORD PTR -56[rbp], rax
	mov	rax, QWORD PTR -56[rbp]
	add	rsp, 96
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_binding_generic
	.def	eb_binding_generic;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_binding_generic
eb_binding_generic:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 64
	.seh_stackalloc	64
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	QWORD PTR 24[rbp], rdx
	lea	rax, eb_binding_of_generic[rip]
	mov	rcx, rax
	call	eb_binding_of_generic
	mov	QWORD PTR -8[rbp], rax
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -16[rbp], rax
	lea	rcx, eb_cons[rip]
	mov	rdx, QWORD PTR -16[rbp]
	mov	rax, QWORD PTR -8[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_cons
	mov	QWORD PTR -24[rbp], rax
	mov	rax, QWORD PTR -24[rbp]
	add	rsp, 64
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_binding_is_value
	.def	eb_binding_is_value;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_binding_is_value
eb_binding_is_value:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 64
	.seh_stackalloc	64
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	QWORD PTR 24[rbp], rdx
	lea	rax, eb_binding_of_value[rip]
	mov	rcx, rax
	call	eb_binding_of_value
	mov	QWORD PTR -8[rbp], rax
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -16[rbp], rax
	lea	rcx, eb_car[rip]
	mov	rax, QWORD PTR -16[rbp]
	mov	rdx, rax
	call	eb_car
	mov	QWORD PTR -24[rbp], rax
	lea	rcx, eb_equal[rip]
	mov	rdx, QWORD PTR -24[rbp]
	mov	rax, QWORD PTR -8[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_equal
	mov	QWORD PTR -32[rbp], rax
	mov	rax, QWORD PTR -32[rbp]
	add	rsp, 64
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_binding_is_lambda
	.def	eb_binding_is_lambda;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_binding_is_lambda
eb_binding_is_lambda:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 64
	.seh_stackalloc	64
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	QWORD PTR 24[rbp], rdx
	lea	rax, eb_binding_of_lambda[rip]
	mov	rcx, rax
	call	eb_binding_of_lambda
	mov	QWORD PTR -8[rbp], rax
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -16[rbp], rax
	lea	rcx, eb_car[rip]
	mov	rax, QWORD PTR -16[rbp]
	mov	rdx, rax
	call	eb_car
	mov	QWORD PTR -24[rbp], rax
	lea	rcx, eb_equal[rip]
	mov	rdx, QWORD PTR -24[rbp]
	mov	rax, QWORD PTR -8[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_equal
	mov	QWORD PTR -32[rbp], rax
	mov	rax, QWORD PTR -32[rbp]
	add	rsp, 64
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_binding_is_generic
	.def	eb_binding_is_generic;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_binding_is_generic
eb_binding_is_generic:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 64
	.seh_stackalloc	64
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	QWORD PTR 24[rbp], rdx
	lea	rax, eb_binding_of_generic[rip]
	mov	rcx, rax
	call	eb_binding_of_generic
	mov	QWORD PTR -8[rbp], rax
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -16[rbp], rax
	lea	rcx, eb_car[rip]
	mov	rax, QWORD PTR -16[rbp]
	mov	rdx, rax
	call	eb_car
	mov	QWORD PTR -24[rbp], rax
	lea	rcx, eb_equal[rip]
	mov	rdx, QWORD PTR -24[rbp]
	mov	rax, QWORD PTR -8[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_equal
	mov	QWORD PTR -32[rbp], rax
	mov	rax, QWORD PTR -32[rbp]
	add	rsp, 64
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_get_binding_value1f
	.def	eb_get_binding_value1f;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_get_binding_value1f
eb_get_binding_value1f:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 48
	.seh_stackalloc	48
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -8[rbp], rax
	lea	rcx, eb_cdr[rip]
	mov	rax, QWORD PTR -8[rbp]
	mov	rdx, rax
	call	eb_cdr
	mov	QWORD PTR -16[rbp], rax
	mov	rax, QWORD PTR -16[rbp]
	add	rsp, 48
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_get_binding_value2f1f
	.def	eb_get_binding_value2f1f;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_get_binding_value2f1f
eb_get_binding_value2f1f:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 48
	.seh_stackalloc	48
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -8[rbp], rax
	lea	rcx, eb_cdr[rip]
	mov	rax, QWORD PTR -8[rbp]
	mov	rdx, rax
	call	eb_cdr
	mov	QWORD PTR -16[rbp], rax
	mov	rax, QWORD PTR -16[rbp]
	add	rsp, 48
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_get_binding_value2f2f
	.def	eb_get_binding_value2f2f;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_get_binding_value2f2f
eb_get_binding_value2f2f:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 64
	.seh_stackalloc	64
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -8[rbp], rax
	lea	rcx, eb_cdr[rip]
	mov	rax, QWORD PTR -8[rbp]
	mov	rdx, rax
	call	eb_cdr
	mov	QWORD PTR -16[rbp], rax
	lea	rcx, eb_car[rip]
	mov	rax, QWORD PTR -16[rbp]
	mov	rdx, rax
	call	eb_car
	mov	QWORD PTR -24[rbp], rax
	lea	rcx, eb_get_binding_value[rip]
	mov	rax, QWORD PTR -24[rbp]
	mov	rdx, rax
	call	eb_get_binding_value
	mov	QWORD PTR -32[rbp], rax
	mov	rax, QWORD PTR -32[rbp]
	add	rsp, 64
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_get_binding_value2f
	.def	eb_get_binding_value2f;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_get_binding_value2f
eb_get_binding_value2f:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 96
	.seh_stackalloc	96
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -8[rbp], rax
	lea	rcx, eb_binding_is_generic[rip]
	mov	rax, QWORD PTR -8[rbp]
	mov	rdx, rax
	call	eb_binding_is_generic
	mov	QWORD PTR -16[rbp], rax
	lea	rax, eb_get_binding_value2f1f[rip]
	mov	QWORD PTR -48[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -40[rbp], rax
	lea	rax, eb_get_binding_value2f2f[rip]
	mov	QWORD PTR -64[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -56[rbp], rax
	lea	r8, -64[rbp]
	lea	rdx, -48[rbp]
	lea	rcx, eb_if[rip]
	mov	rax, QWORD PTR -16[rbp]
	mov	r9, r8
	mov	r8, rdx
	mov	rdx, rax
	call	eb_if
	mov	QWORD PTR -24[rbp], rax
	mov	rax, QWORD PTR -24[rbp]
	add	rsp, 96
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_get_binding_value
	.def	eb_get_binding_value;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_get_binding_value
eb_get_binding_value:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 96
	.seh_stackalloc	96
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	QWORD PTR 24[rbp], rdx
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -8[rbp], rax
	lea	rcx, eb_binding_is_value[rip]
	mov	rax, QWORD PTR -8[rbp]
	mov	rdx, rax
	call	eb_binding_is_value
	mov	QWORD PTR -16[rbp], rax
	lea	rax, eb_get_binding_value1f[rip]
	mov	QWORD PTR -48[rbp], rax
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -40[rbp], rax
	lea	rax, eb_get_binding_value2f[rip]
	mov	QWORD PTR -64[rbp], rax
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -56[rbp], rax
	lea	r8, -64[rbp]
	lea	rdx, -48[rbp]
	lea	rcx, eb_if[rip]
	mov	rax, QWORD PTR -16[rbp]
	mov	r9, r8
	mov	r8, rdx
	mov	rdx, rax
	call	eb_if
	mov	QWORD PTR -24[rbp], rax
	mov	rax, QWORD PTR -24[rbp]
	add	rsp, 96
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_get_binding_args
	.def	eb_get_binding_args;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_get_binding_args
eb_get_binding_args:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 64
	.seh_stackalloc	64
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	QWORD PTR 24[rbp], rdx
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -8[rbp], rax
	lea	rcx, eb_cdr[rip]
	mov	rax, QWORD PTR -8[rbp]
	mov	rdx, rax
	call	eb_cdr
	mov	QWORD PTR -16[rbp], rax
	lea	rcx, eb_cdr[rip]
	mov	rax, QWORD PTR -16[rbp]
	mov	rdx, rax
	call	eb_cdr
	mov	QWORD PTR -24[rbp], rax
	lea	rcx, eb_car[rip]
	mov	rax, QWORD PTR -24[rbp]
	mov	rdx, rax
	call	eb_car
	mov	QWORD PTR -32[rbp], rax
	mov	rax, QWORD PTR -32[rbp]
	add	rsp, 64
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_get_binding_generics
	.def	eb_get_binding_generics;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_get_binding_generics
eb_get_binding_generics:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 64
	.seh_stackalloc	64
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	QWORD PTR 24[rbp], rdx
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -8[rbp], rax
	lea	rcx, eb_cdr[rip]
	mov	rax, QWORD PTR -8[rbp]
	mov	rdx, rax
	call	eb_cdr
	mov	QWORD PTR -16[rbp], rax
	lea	rcx, eb_cdr[rip]
	mov	rax, QWORD PTR -16[rbp]
	mov	rdx, rax
	call	eb_cdr
	mov	QWORD PTR -24[rbp], rax
	lea	rcx, eb_cdr[rip]
	mov	rax, QWORD PTR -24[rbp]
	mov	rdx, rax
	call	eb_cdr
	mov	QWORD PTR -32[rbp], rax
	mov	rax, QWORD PTR -32[rbp]
	add	rsp, 64
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_name_table_append
	.def	eb_name_table_append;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_name_table_append
eb_name_table_append:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 64
	.seh_stackalloc	64
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	QWORD PTR 24[rbp], rdx
	mov	QWORD PTR 32[rbp], r8
	mov	rax, QWORD PTR 32[rbp]
	mov	QWORD PTR -8[rbp], rax
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -16[rbp], rax
	lea	rcx, eb_cons[rip]
	mov	rdx, QWORD PTR -16[rbp]
	mov	rax, QWORD PTR -8[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_cons
	mov	QWORD PTR -24[rbp], rax
	mov	rax, QWORD PTR -24[rbp]
	add	rsp, 64
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_name_table_lookup1f1f
	.def	eb_name_table_lookup1f1f;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_name_table_lookup1f1f
eb_name_table_lookup1f1f:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 48
	.seh_stackalloc	48
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -8[rbp], rax
	lea	rcx, eb_car[rip]
	mov	rax, QWORD PTR -8[rbp]
	mov	rdx, rax
	call	eb_car
	mov	QWORD PTR -16[rbp], rax
	mov	rax, QWORD PTR -16[rbp]
	add	rsp, 48
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_name_table_lookup1f2f
	.def	eb_name_table_lookup1f2f;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_name_table_lookup1f2f
eb_name_table_lookup1f2f:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 64
	.seh_stackalloc	64
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 16
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -8[rbp], rax
	lea	rcx, eb_cdr[rip]
	mov	rax, QWORD PTR -8[rbp]
	mov	rdx, rax
	call	eb_cdr
	mov	QWORD PTR -16[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -24[rbp], rax
	lea	rcx, eb_name_table_lookup[rip]
	mov	rdx, QWORD PTR -24[rbp]
	mov	rax, QWORD PTR -16[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_name_table_lookup
	mov	QWORD PTR -32[rbp], rax
	mov	rax, QWORD PTR -32[rbp]
	add	rsp, 64
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_name_table_lookup1f
	.def	eb_name_table_lookup1f;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_name_table_lookup1f
eb_name_table_lookup1f:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	add	rsp, -128
	.seh_stackalloc	128
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -8[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 16
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -16[rbp], rax
	lea	rcx, eb_car[rip]
	mov	rax, QWORD PTR -16[rbp]
	mov	rdx, rax
	call	eb_car
	mov	QWORD PTR -24[rbp], rax
	lea	rcx, eb_get_binding_value[rip]
	mov	rax, QWORD PTR -24[rbp]
	mov	rdx, rax
	call	eb_get_binding_value
	mov	QWORD PTR -32[rbp], rax
	lea	rcx, eb_str_eq[rip]
	mov	rdx, QWORD PTR -32[rbp]
	mov	rax, QWORD PTR -8[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_str_eq
	mov	QWORD PTR -40[rbp], rax
	lea	rax, eb_name_table_lookup1f1f[rip]
	mov	QWORD PTR -64[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 16
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -56[rbp], rax
	lea	rax, eb_name_table_lookup1f2f[rip]
	mov	QWORD PTR -96[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -88[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 16
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -80[rbp], rax
	lea	r8, -96[rbp]
	lea	rdx, -64[rbp]
	lea	rcx, eb_if[rip]
	mov	rax, QWORD PTR -40[rbp]
	mov	r9, r8
	mov	r8, rdx
	mov	rdx, rax
	call	eb_if
	mov	QWORD PTR -48[rbp], rax
	mov	rax, QWORD PTR -48[rbp]
	sub	rsp, -128
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_name_table_lookup
	.def	eb_name_table_lookup;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_name_table_lookup
eb_name_table_lookup:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 80
	.seh_stackalloc	80
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	QWORD PTR 24[rbp], rdx
	mov	QWORD PTR 32[rbp], r8
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -8[rbp], rax
	lea	rax, eb_name_table_lookup1f[rip]
	mov	QWORD PTR -48[rbp], rax
	mov	rax, QWORD PTR 32[rbp]
	mov	QWORD PTR -40[rbp], rax
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -32[rbp], rax
	lea	rdx, -48[rbp]
	lea	rcx, eb_and[rip]
	mov	rax, QWORD PTR -8[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_and
	mov	QWORD PTR -16[rbp], rax
	mov	rax, QWORD PTR -16[rbp]
	add	rsp, 80
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_binding_table
	.def	eb_binding_table;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_binding_table
eb_binding_table:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 64
	.seh_stackalloc	64
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	QWORD PTR -8[rbp], 0
	mov	QWORD PTR -16[rbp], 0
	lea	rcx, eb_cons[rip]
	mov	rdx, QWORD PTR -16[rbp]
	mov	rax, QWORD PTR -8[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_cons
	mov	QWORD PTR -24[rbp], rax
	mov	rax, QWORD PTR -24[rbp]
	add	rsp, 64
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_binding_table_append_generic
	.def	eb_binding_table_append_generic;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_binding_table_append_generic
eb_binding_table_append_generic:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 96
	.seh_stackalloc	96
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	QWORD PTR 24[rbp], rdx
	mov	QWORD PTR 32[rbp], r8
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -8[rbp], rax
	lea	rcx, eb_car[rip]
	mov	rax, QWORD PTR -8[rbp]
	mov	rdx, rax
	call	eb_car
	mov	QWORD PTR -16[rbp], rax
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -24[rbp], rax
	lea	rcx, eb_cdr[rip]
	mov	rax, QWORD PTR -24[rbp]
	mov	rdx, rax
	call	eb_cdr
	mov	QWORD PTR -32[rbp], rax
	mov	rax, QWORD PTR 32[rbp]
	mov	QWORD PTR -40[rbp], rax
	lea	rcx, eb_name_table_append[rip]
	mov	rdx, QWORD PTR -40[rbp]
	mov	rax, QWORD PTR -32[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_name_table_append
	mov	QWORD PTR -48[rbp], rax
	lea	rcx, eb_cons[rip]
	mov	rdx, QWORD PTR -48[rbp]
	mov	rax, QWORD PTR -16[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_cons
	mov	QWORD PTR -56[rbp], rax
	mov	rax, QWORD PTR -56[rbp]
	add	rsp, 96
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_binding_table_append
	.def	eb_binding_table_append;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_binding_table_append
eb_binding_table_append:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 96
	.seh_stackalloc	96
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	QWORD PTR 24[rbp], rdx
	mov	QWORD PTR 32[rbp], r8
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -8[rbp], rax
	lea	rcx, eb_car[rip]
	mov	rax, QWORD PTR -8[rbp]
	mov	rdx, rax
	call	eb_car
	mov	QWORD PTR -16[rbp], rax
	mov	rax, QWORD PTR 32[rbp]
	mov	QWORD PTR -24[rbp], rax
	lea	rcx, eb_name_table_append[rip]
	mov	rdx, QWORD PTR -24[rbp]
	mov	rax, QWORD PTR -16[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_name_table_append
	mov	QWORD PTR -32[rbp], rax
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -40[rbp], rax
	lea	rcx, eb_cdr[rip]
	mov	rax, QWORD PTR -40[rbp]
	mov	rdx, rax
	call	eb_cdr
	mov	QWORD PTR -48[rbp], rax
	lea	rcx, eb_cons[rip]
	mov	rdx, QWORD PTR -48[rbp]
	mov	rax, QWORD PTR -32[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_cons
	mov	QWORD PTR -56[rbp], rax
	mov	rax, QWORD PTR -56[rbp]
	add	rsp, 96
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_binding_table_lookup_generic
	.def	eb_binding_table_lookup_generic;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_binding_table_lookup_generic
eb_binding_table_lookup_generic:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 64
	.seh_stackalloc	64
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	QWORD PTR 24[rbp], rdx
	mov	QWORD PTR 32[rbp], r8
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -8[rbp], rax
	lea	rcx, eb_cdr[rip]
	mov	rax, QWORD PTR -8[rbp]
	mov	rdx, rax
	call	eb_cdr
	mov	QWORD PTR -16[rbp], rax
	mov	rax, QWORD PTR 32[rbp]
	mov	QWORD PTR -24[rbp], rax
	lea	rcx, eb_name_table_lookup[rip]
	mov	rdx, QWORD PTR -24[rbp]
	mov	rax, QWORD PTR -16[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_name_table_lookup
	mov	QWORD PTR -32[rbp], rax
	mov	rax, QWORD PTR -32[rbp]
	add	rsp, 64
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_binding_table_lookup1f
	.def	eb_binding_table_lookup1f;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_binding_table_lookup1f
eb_binding_table_lookup1f:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 48
	.seh_stackalloc	48
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -8[rbp], rax
	lea	rcx, eb_binding_value[rip]
	mov	rax, QWORD PTR -8[rbp]
	mov	rdx, rax
	call	eb_binding_value
	mov	QWORD PTR -16[rbp], rax
	mov	rax, QWORD PTR -16[rbp]
	add	rsp, 48
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_binding_table_lookup
	.def	eb_binding_table_lookup;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_binding_table_lookup
eb_binding_table_lookup:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 96
	.seh_stackalloc	96
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	QWORD PTR 24[rbp], rdx
	mov	QWORD PTR 32[rbp], r8
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -8[rbp], rax
	lea	rcx, eb_car[rip]
	mov	rax, QWORD PTR -8[rbp]
	mov	rdx, rax
	call	eb_car
	mov	QWORD PTR -16[rbp], rax
	mov	rax, QWORD PTR 32[rbp]
	mov	QWORD PTR -24[rbp], rax
	lea	rcx, eb_name_table_lookup[rip]
	mov	rdx, QWORD PTR -24[rbp]
	mov	rax, QWORD PTR -16[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_name_table_lookup
	mov	QWORD PTR -32[rbp], rax
	lea	rax, eb_binding_table_lookup1f[rip]
	mov	QWORD PTR -64[rbp], rax
	mov	rax, QWORD PTR 32[rbp]
	mov	QWORD PTR -56[rbp], rax
	lea	rdx, -64[rbp]
	lea	rcx, eb_or[rip]
	mov	rax, QWORD PTR -32[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_or
	mov	QWORD PTR -40[rbp], rax
	mov	rax, QWORD PTR -40[rbp]
	add	rsp, 96
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_ast_of_name
	.def	eb_ast_of_name;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_ast_of_name
eb_ast_of_name:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 16
	.seh_stackalloc	16
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	QWORD PTR -8[rbp], 0
	mov	rax, QWORD PTR -8[rbp]
	add	rsp, 16
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_ast_of_call
	.def	eb_ast_of_call;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_ast_of_call
eb_ast_of_call:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 16
	.seh_stackalloc	16
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	QWORD PTR -8[rbp], 1
	mov	rax, QWORD PTR -8[rbp]
	add	rsp, 16
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_ast_of_function
	.def	eb_ast_of_function;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_ast_of_function
eb_ast_of_function:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 16
	.seh_stackalloc	16
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	QWORD PTR -8[rbp], 2
	mov	rax, QWORD PTR -8[rbp]
	add	rsp, 16
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_ast_of_number
	.def	eb_ast_of_number;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_ast_of_number
eb_ast_of_number:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 16
	.seh_stackalloc	16
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	QWORD PTR -8[rbp], 3
	mov	rax, QWORD PTR -8[rbp]
	add	rsp, 16
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_ast_of_extern
	.def	eb_ast_of_extern;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_ast_of_extern
eb_ast_of_extern:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 16
	.seh_stackalloc	16
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	QWORD PTR -8[rbp], 4
	mov	rax, QWORD PTR -8[rbp]
	add	rsp, 16
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_ast_of_lambda
	.def	eb_ast_of_lambda;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_ast_of_lambda
eb_ast_of_lambda:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 16
	.seh_stackalloc	16
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	QWORD PTR -8[rbp], 5
	mov	rax, QWORD PTR -8[rbp]
	add	rsp, 16
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_ast_of_str
	.def	eb_ast_of_str;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_ast_of_str
eb_ast_of_str:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 16
	.seh_stackalloc	16
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	QWORD PTR -8[rbp], 6
	mov	rax, QWORD PTR -8[rbp]
	add	rsp, 16
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_ast_name
	.def	eb_ast_name;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_ast_name
eb_ast_name:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 64
	.seh_stackalloc	64
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	QWORD PTR 24[rbp], rdx
	lea	rax, eb_ast_of_name[rip]
	mov	rcx, rax
	call	eb_ast_of_name
	mov	QWORD PTR -8[rbp], rax
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -16[rbp], rax
	lea	rcx, eb_cons[rip]
	mov	rdx, QWORD PTR -16[rbp]
	mov	rax, QWORD PTR -8[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_cons
	mov	QWORD PTR -24[rbp], rax
	mov	rax, QWORD PTR -24[rbp]
	add	rsp, 64
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_ast_call
	.def	eb_ast_call;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_ast_call
eb_ast_call:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 64
	.seh_stackalloc	64
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	QWORD PTR 24[rbp], rdx
	lea	rax, eb_ast_of_call[rip]
	mov	rcx, rax
	call	eb_ast_of_call
	mov	QWORD PTR -8[rbp], rax
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -16[rbp], rax
	lea	rcx, eb_cons[rip]
	mov	rdx, QWORD PTR -16[rbp]
	mov	rax, QWORD PTR -8[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_cons
	mov	QWORD PTR -24[rbp], rax
	mov	rax, QWORD PTR -24[rbp]
	add	rsp, 64
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_ast_function
	.def	eb_ast_function;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_ast_function
eb_ast_function:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 80
	.seh_stackalloc	80
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	QWORD PTR 24[rbp], rdx
	mov	QWORD PTR 32[rbp], r8
	lea	rax, eb_ast_of_function[rip]
	mov	rcx, rax
	call	eb_ast_of_function
	mov	QWORD PTR -8[rbp], rax
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -16[rbp], rax
	mov	rax, QWORD PTR 32[rbp]
	mov	QWORD PTR -24[rbp], rax
	lea	rcx, eb_cons[rip]
	mov	rdx, QWORD PTR -24[rbp]
	mov	rax, QWORD PTR -16[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_cons
	mov	QWORD PTR -32[rbp], rax
	lea	rcx, eb_cons[rip]
	mov	rdx, QWORD PTR -32[rbp]
	mov	rax, QWORD PTR -8[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_cons
	mov	QWORD PTR -40[rbp], rax
	mov	rax, QWORD PTR -40[rbp]
	add	rsp, 80
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_ast_number
	.def	eb_ast_number;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_ast_number
eb_ast_number:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 64
	.seh_stackalloc	64
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	QWORD PTR 24[rbp], rdx
	lea	rax, eb_ast_of_number[rip]
	mov	rcx, rax
	call	eb_ast_of_number
	mov	QWORD PTR -8[rbp], rax
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -16[rbp], rax
	lea	rcx, eb_cons[rip]
	mov	rdx, QWORD PTR -16[rbp]
	mov	rax, QWORD PTR -8[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_cons
	mov	QWORD PTR -24[rbp], rax
	mov	rax, QWORD PTR -24[rbp]
	add	rsp, 64
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_ast_extern
	.def	eb_ast_extern;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_ast_extern
eb_ast_extern:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 64
	.seh_stackalloc	64
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	QWORD PTR 24[rbp], rdx
	lea	rax, eb_ast_of_extern[rip]
	mov	rcx, rax
	call	eb_ast_of_extern
	mov	QWORD PTR -8[rbp], rax
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -16[rbp], rax
	lea	rcx, eb_cons[rip]
	mov	rdx, QWORD PTR -16[rbp]
	mov	rax, QWORD PTR -8[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_cons
	mov	QWORD PTR -24[rbp], rax
	mov	rax, QWORD PTR -24[rbp]
	add	rsp, 64
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_ast_lambda
	.def	eb_ast_lambda;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_ast_lambda
eb_ast_lambda:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 80
	.seh_stackalloc	80
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	QWORD PTR 24[rbp], rdx
	mov	QWORD PTR 32[rbp], r8
	lea	rax, eb_ast_of_lambda[rip]
	mov	rcx, rax
	call	eb_ast_of_lambda
	mov	QWORD PTR -8[rbp], rax
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -16[rbp], rax
	mov	rax, QWORD PTR 32[rbp]
	mov	QWORD PTR -24[rbp], rax
	lea	rcx, eb_cons[rip]
	mov	rdx, QWORD PTR -24[rbp]
	mov	rax, QWORD PTR -16[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_cons
	mov	QWORD PTR -32[rbp], rax
	lea	rcx, eb_cons[rip]
	mov	rdx, QWORD PTR -32[rbp]
	mov	rax, QWORD PTR -8[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_cons
	mov	QWORD PTR -40[rbp], rax
	mov	rax, QWORD PTR -40[rbp]
	add	rsp, 80
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_ast_str
	.def	eb_ast_str;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_ast_str
eb_ast_str:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 64
	.seh_stackalloc	64
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	QWORD PTR 24[rbp], rdx
	lea	rax, eb_ast_of_str[rip]
	mov	rcx, rax
	call	eb_ast_of_str
	mov	QWORD PTR -8[rbp], rax
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -16[rbp], rax
	lea	rcx, eb_cons[rip]
	mov	rdx, QWORD PTR -16[rbp]
	mov	rax, QWORD PTR -8[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_cons
	mov	QWORD PTR -24[rbp], rax
	mov	rax, QWORD PTR -24[rbp]
	add	rsp, 64
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_ast_is_name
	.def	eb_ast_is_name;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_ast_is_name
eb_ast_is_name:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 64
	.seh_stackalloc	64
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	QWORD PTR 24[rbp], rdx
	lea	rax, eb_ast_of_name[rip]
	mov	rcx, rax
	call	eb_ast_of_name
	mov	QWORD PTR -8[rbp], rax
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -16[rbp], rax
	lea	rcx, eb_car[rip]
	mov	rax, QWORD PTR -16[rbp]
	mov	rdx, rax
	call	eb_car
	mov	QWORD PTR -24[rbp], rax
	lea	rcx, eb_equal[rip]
	mov	rdx, QWORD PTR -24[rbp]
	mov	rax, QWORD PTR -8[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_equal
	mov	QWORD PTR -32[rbp], rax
	mov	rax, QWORD PTR -32[rbp]
	add	rsp, 64
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_ast_is_call
	.def	eb_ast_is_call;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_ast_is_call
eb_ast_is_call:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 64
	.seh_stackalloc	64
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	QWORD PTR 24[rbp], rdx
	lea	rax, eb_ast_of_call[rip]
	mov	rcx, rax
	call	eb_ast_of_call
	mov	QWORD PTR -8[rbp], rax
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -16[rbp], rax
	lea	rcx, eb_car[rip]
	mov	rax, QWORD PTR -16[rbp]
	mov	rdx, rax
	call	eb_car
	mov	QWORD PTR -24[rbp], rax
	lea	rcx, eb_equal[rip]
	mov	rdx, QWORD PTR -24[rbp]
	mov	rax, QWORD PTR -8[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_equal
	mov	QWORD PTR -32[rbp], rax
	mov	rax, QWORD PTR -32[rbp]
	add	rsp, 64
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_ast_is_function
	.def	eb_ast_is_function;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_ast_is_function
eb_ast_is_function:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 64
	.seh_stackalloc	64
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	QWORD PTR 24[rbp], rdx
	lea	rax, eb_ast_of_function[rip]
	mov	rcx, rax
	call	eb_ast_of_function
	mov	QWORD PTR -8[rbp], rax
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -16[rbp], rax
	lea	rcx, eb_car[rip]
	mov	rax, QWORD PTR -16[rbp]
	mov	rdx, rax
	call	eb_car
	mov	QWORD PTR -24[rbp], rax
	lea	rcx, eb_equal[rip]
	mov	rdx, QWORD PTR -24[rbp]
	mov	rax, QWORD PTR -8[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_equal
	mov	QWORD PTR -32[rbp], rax
	mov	rax, QWORD PTR -32[rbp]
	add	rsp, 64
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_ast_is_number
	.def	eb_ast_is_number;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_ast_is_number
eb_ast_is_number:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 64
	.seh_stackalloc	64
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	QWORD PTR 24[rbp], rdx
	lea	rax, eb_ast_of_number[rip]
	mov	rcx, rax
	call	eb_ast_of_number
	mov	QWORD PTR -8[rbp], rax
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -16[rbp], rax
	lea	rcx, eb_car[rip]
	mov	rax, QWORD PTR -16[rbp]
	mov	rdx, rax
	call	eb_car
	mov	QWORD PTR -24[rbp], rax
	lea	rcx, eb_equal[rip]
	mov	rdx, QWORD PTR -24[rbp]
	mov	rax, QWORD PTR -8[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_equal
	mov	QWORD PTR -32[rbp], rax
	mov	rax, QWORD PTR -32[rbp]
	add	rsp, 64
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_ast_is_extern
	.def	eb_ast_is_extern;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_ast_is_extern
eb_ast_is_extern:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 64
	.seh_stackalloc	64
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	QWORD PTR 24[rbp], rdx
	lea	rax, eb_ast_of_extern[rip]
	mov	rcx, rax
	call	eb_ast_of_extern
	mov	QWORD PTR -8[rbp], rax
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -16[rbp], rax
	lea	rcx, eb_car[rip]
	mov	rax, QWORD PTR -16[rbp]
	mov	rdx, rax
	call	eb_car
	mov	QWORD PTR -24[rbp], rax
	lea	rcx, eb_equal[rip]
	mov	rdx, QWORD PTR -24[rbp]
	mov	rax, QWORD PTR -8[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_equal
	mov	QWORD PTR -32[rbp], rax
	mov	rax, QWORD PTR -32[rbp]
	add	rsp, 64
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_ast_is_lambda
	.def	eb_ast_is_lambda;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_ast_is_lambda
eb_ast_is_lambda:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 64
	.seh_stackalloc	64
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	QWORD PTR 24[rbp], rdx
	lea	rax, eb_ast_of_lambda[rip]
	mov	rcx, rax
	call	eb_ast_of_lambda
	mov	QWORD PTR -8[rbp], rax
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -16[rbp], rax
	lea	rcx, eb_car[rip]
	mov	rax, QWORD PTR -16[rbp]
	mov	rdx, rax
	call	eb_car
	mov	QWORD PTR -24[rbp], rax
	lea	rcx, eb_equal[rip]
	mov	rdx, QWORD PTR -24[rbp]
	mov	rax, QWORD PTR -8[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_equal
	mov	QWORD PTR -32[rbp], rax
	mov	rax, QWORD PTR -32[rbp]
	add	rsp, 64
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_ast_is_str
	.def	eb_ast_is_str;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_ast_is_str
eb_ast_is_str:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 64
	.seh_stackalloc	64
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	QWORD PTR 24[rbp], rdx
	lea	rax, eb_ast_of_str[rip]
	mov	rcx, rax
	call	eb_ast_of_str
	mov	QWORD PTR -8[rbp], rax
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -16[rbp], rax
	lea	rcx, eb_car[rip]
	mov	rax, QWORD PTR -16[rbp]
	mov	rdx, rax
	call	eb_car
	mov	QWORD PTR -24[rbp], rax
	lea	rcx, eb_equal[rip]
	mov	rdx, QWORD PTR -24[rbp]
	mov	rax, QWORD PTR -8[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_equal
	mov	QWORD PTR -32[rbp], rax
	mov	rax, QWORD PTR -32[rbp]
	add	rsp, 64
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_binding_to_ast1f
	.def	eb_binding_to_ast1f;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_binding_to_ast1f
eb_binding_to_ast1f:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 64
	.seh_stackalloc	64
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -8[rbp], rax
	lea	rcx, eb_get_binding_value[rip]
	mov	rax, QWORD PTR -8[rbp]
	mov	rdx, rax
	call	eb_get_binding_value
	mov	QWORD PTR -16[rbp], rax
	lea	rcx, eb_ast_name[rip]
	mov	rax, QWORD PTR -16[rbp]
	mov	rdx, rax
	call	eb_ast_name
	mov	QWORD PTR -24[rbp], rax
	mov	rax, QWORD PTR -24[rbp]
	add	rsp, 64
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_binding_to_ast2f1f011f
	.def	eb_binding_to_ast2f1f011f;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_binding_to_ast2f1f011f
eb_binding_to_ast2f1f011f:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 64
	.seh_stackalloc	64
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	QWORD PTR 24[rbp], rdx
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -8[rbp], rax
	lea	rcx, eb_get_binding_value[rip]
	mov	rax, QWORD PTR -8[rbp]
	mov	rdx, rax
	call	eb_get_binding_value
	mov	QWORD PTR -16[rbp], rax
	lea	rcx, eb_ast_name[rip]
	mov	rax, QWORD PTR -16[rbp]
	mov	rdx, rax
	call	eb_ast_name
	mov	QWORD PTR -24[rbp], rax
	mov	rax, QWORD PTR -24[rbp]
	add	rsp, 64
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_binding_to_ast2f1f
	.def	eb_binding_to_ast2f1f;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_binding_to_ast2f1f
eb_binding_to_ast2f1f:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 112
	.seh_stackalloc	112
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -8[rbp], rax
	lea	rcx, eb_get_binding_value[rip]
	mov	rax, QWORD PTR -8[rbp]
	mov	rdx, rax
	call	eb_get_binding_value
	mov	QWORD PTR -16[rbp], rax
	lea	rcx, eb_ast_name[rip]
	mov	rax, QWORD PTR -16[rbp]
	mov	rdx, rax
	call	eb_ast_name
	mov	QWORD PTR -24[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -32[rbp], rax
	lea	rcx, eb_get_binding_args[rip]
	mov	rax, QWORD PTR -32[rbp]
	mov	rdx, rax
	call	eb_get_binding_args
	mov	QWORD PTR -40[rbp], rax
	lea	rax, eb_binding_to_ast2f1f011f[rip]
	mov	QWORD PTR -72[rbp], rax
	lea	rdx, -72[rbp]
	lea	rcx, eb_map[rip]
	mov	rax, QWORD PTR -40[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_map
	mov	QWORD PTR -48[rbp], rax
	lea	rcx, eb_cons[rip]
	mov	rdx, QWORD PTR -48[rbp]
	mov	rax, QWORD PTR -24[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_cons
	mov	QWORD PTR -56[rbp], rax
	lea	rcx, eb_ast_call[rip]
	mov	rax, QWORD PTR -56[rbp]
	mov	rdx, rax
	call	eb_ast_call
	mov	QWORD PTR -64[rbp], rax
	mov	rax, QWORD PTR -64[rbp]
	add	rsp, 112
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_binding_to_ast2f2f1f
	.def	eb_binding_to_ast2f2f1f;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_binding_to_ast2f2f1f
eb_binding_to_ast2f2f1f:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 64
	.seh_stackalloc	64
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -8[rbp], rax
	lea	rcx, eb_get_binding_value[rip]
	mov	rax, QWORD PTR -8[rbp]
	mov	rdx, rax
	call	eb_get_binding_value
	mov	QWORD PTR -16[rbp], rax
	lea	rcx, eb_ast_name[rip]
	mov	rax, QWORD PTR -16[rbp]
	mov	rdx, rax
	call	eb_ast_name
	mov	QWORD PTR -24[rbp], rax
	mov	rax, QWORD PTR -24[rbp]
	add	rsp, 64
	pop	rbp
	ret
	.seh_endproc
	.section .rdata,"dr"
.LC15:
	.ascii "???\0"
	.text
	.globl	eb_binding_to_ast2f2f2f
	.def	eb_binding_to_ast2f2f2f;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_binding_to_ast2f2f2f
eb_binding_to_ast2f2f2f:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 48
	.seh_stackalloc	48
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	lea	rax, .LC15[rip]
	mov	rdx, rax
	lea	rax, eb_binding_to_ast2f2f2f0.72[rip]
	mov	rcx, rax
	call	ebz_stol
	mov	rax, QWORD PTR eb_binding_to_ast2f2f2f0.72[rip]
	lea	rcx, eb_ast_str[rip]
	mov	rdx, rax
	call	eb_ast_str
	mov	QWORD PTR -8[rbp], rax
	mov	rax, QWORD PTR -8[rbp]
	add	rsp, 48
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_binding_to_ast2f2f
	.def	eb_binding_to_ast2f2f;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_binding_to_ast2f2f
eb_binding_to_ast2f2f:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 96
	.seh_stackalloc	96
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -8[rbp], rax
	lea	rcx, eb_binding_is_generic[rip]
	mov	rax, QWORD PTR -8[rbp]
	mov	rdx, rax
	call	eb_binding_is_generic
	mov	QWORD PTR -16[rbp], rax
	lea	rax, eb_binding_to_ast2f2f1f[rip]
	mov	QWORD PTR -48[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -40[rbp], rax
	lea	rax, eb_binding_to_ast2f2f2f[rip]
	mov	QWORD PTR -56[rbp], rax
	lea	r8, -56[rbp]
	lea	rdx, -48[rbp]
	lea	rcx, eb_if[rip]
	mov	rax, QWORD PTR -16[rbp]
	mov	r9, r8
	mov	r8, rdx
	mov	rdx, rax
	call	eb_if
	mov	QWORD PTR -24[rbp], rax
	mov	rax, QWORD PTR -24[rbp]
	add	rsp, 96
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_binding_to_ast2f
	.def	eb_binding_to_ast2f;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_binding_to_ast2f
eb_binding_to_ast2f:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 96
	.seh_stackalloc	96
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -8[rbp], rax
	lea	rcx, eb_binding_is_lambda[rip]
	mov	rax, QWORD PTR -8[rbp]
	mov	rdx, rax
	call	eb_binding_is_lambda
	mov	QWORD PTR -16[rbp], rax
	lea	rax, eb_binding_to_ast2f1f[rip]
	mov	QWORD PTR -48[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -40[rbp], rax
	lea	rax, eb_binding_to_ast2f2f[rip]
	mov	QWORD PTR -64[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -56[rbp], rax
	lea	r8, -64[rbp]
	lea	rdx, -48[rbp]
	lea	rcx, eb_if[rip]
	mov	rax, QWORD PTR -16[rbp]
	mov	r9, r8
	mov	r8, rdx
	mov	rdx, rax
	call	eb_if
	mov	QWORD PTR -24[rbp], rax
	mov	rax, QWORD PTR -24[rbp]
	add	rsp, 96
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_binding_to_ast
	.def	eb_binding_to_ast;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_binding_to_ast
eb_binding_to_ast:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 96
	.seh_stackalloc	96
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	QWORD PTR 24[rbp], rdx
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -8[rbp], rax
	lea	rcx, eb_binding_is_value[rip]
	mov	rax, QWORD PTR -8[rbp]
	mov	rdx, rax
	call	eb_binding_is_value
	mov	QWORD PTR -16[rbp], rax
	lea	rax, eb_binding_to_ast1f[rip]
	mov	QWORD PTR -48[rbp], rax
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -40[rbp], rax
	lea	rax, eb_binding_to_ast2f[rip]
	mov	QWORD PTR -64[rbp], rax
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -56[rbp], rax
	lea	r8, -64[rbp]
	lea	rdx, -48[rbp]
	lea	rcx, eb_if[rip]
	mov	rax, QWORD PTR -16[rbp]
	mov	r9, r8
	mov	r8, rdx
	mov	rdx, rax
	call	eb_if
	mov	QWORD PTR -24[rbp], rax
	mov	rax, QWORD PTR -24[rbp]
	add	rsp, 96
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_within_range1f
	.def	eb_within_range1f;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_within_range1f
eb_within_range1f:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 64
	.seh_stackalloc	64
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -8[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 16
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -16[rbp], rax
	lea	rcx, eb_above[rip]
	mov	rdx, QWORD PTR -16[rbp]
	mov	rax, QWORD PTR -8[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_above
	mov	QWORD PTR -24[rbp], rax
	lea	rcx, eb_not[rip]
	mov	rax, QWORD PTR -24[rbp]
	mov	rdx, rax
	call	eb_not
	mov	QWORD PTR -32[rbp], rax
	mov	rax, QWORD PTR -32[rbp]
	add	rsp, 64
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_within_range
	.def	eb_within_range;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_within_range
eb_within_range:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 96
	.seh_stackalloc	96
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	QWORD PTR 24[rbp], rdx
	mov	QWORD PTR 32[rbp], r8
	mov	QWORD PTR 40[rbp], r9
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -8[rbp], rax
	mov	rax, QWORD PTR 40[rbp]
	mov	QWORD PTR -16[rbp], rax
	lea	rcx, eb_above[rip]
	mov	rdx, QWORD PTR -16[rbp]
	mov	rax, QWORD PTR -8[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_above
	mov	QWORD PTR -24[rbp], rax
	lea	rcx, eb_not[rip]
	mov	rax, QWORD PTR -24[rbp]
	mov	rdx, rax
	call	eb_not
	mov	QWORD PTR -32[rbp], rax
	lea	rax, eb_within_range1f[rip]
	mov	QWORD PTR -64[rbp], rax
	mov	rax, QWORD PTR 32[rbp]
	mov	QWORD PTR -56[rbp], rax
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -48[rbp], rax
	lea	rdx, -64[rbp]
	lea	rcx, eb_and[rip]
	mov	rax, QWORD PTR -32[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_and
	mov	QWORD PTR -40[rbp], rax
	mov	rax, QWORD PTR -40[rbp]
	add	rsp, 96
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_is_word_char_init1f1f1f
	.def	eb_is_word_char_init1f1f1f;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_is_word_char_init1f1f1f
eb_is_word_char_init1f1f1f:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 64
	.seh_stackalloc	64
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -8[rbp], rax
	mov	QWORD PTR -16[rbp], 95
	lea	rcx, eb_equal[rip]
	mov	rdx, QWORD PTR -16[rbp]
	mov	rax, QWORD PTR -8[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_equal
	mov	QWORD PTR -24[rbp], rax
	mov	rax, QWORD PTR -24[rbp]
	add	rsp, 64
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_is_word_char_init1f1f
	.def	eb_is_word_char_init1f1f;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_is_word_char_init1f1f
eb_is_word_char_init1f1f:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 80
	.seh_stackalloc	80
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -8[rbp], rax
	mov	QWORD PTR -16[rbp], 45
	lea	rcx, eb_equal[rip]
	mov	rdx, QWORD PTR -16[rbp]
	mov	rax, QWORD PTR -8[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_equal
	mov	QWORD PTR -24[rbp], rax
	lea	rax, eb_is_word_char_init1f1f1f[rip]
	mov	QWORD PTR -48[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -40[rbp], rax
	lea	rdx, -48[rbp]
	lea	rcx, eb_or[rip]
	mov	rax, QWORD PTR -24[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_or
	mov	QWORD PTR -32[rbp], rax
	mov	rax, QWORD PTR -32[rbp]
	add	rsp, 80
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_is_word_char_init1f
	.def	eb_is_word_char_init1f;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_is_word_char_init1f
eb_is_word_char_init1f:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 96
	.seh_stackalloc	96
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -8[rbp], rax
	mov	QWORD PTR -16[rbp], 65
	mov	QWORD PTR -24[rbp], 90
	lea	rcx, eb_within_range[rip]
	mov	r8, QWORD PTR -24[rbp]
	mov	rdx, QWORD PTR -16[rbp]
	mov	rax, QWORD PTR -8[rbp]
	mov	r9, r8
	mov	r8, rdx
	mov	rdx, rax
	call	eb_within_range
	mov	QWORD PTR -32[rbp], rax
	lea	rax, eb_is_word_char_init1f1f[rip]
	mov	QWORD PTR -64[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -56[rbp], rax
	lea	rdx, -64[rbp]
	lea	rcx, eb_or[rip]
	mov	rax, QWORD PTR -32[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_or
	mov	QWORD PTR -40[rbp], rax
	mov	rax, QWORD PTR -40[rbp]
	add	rsp, 96
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_is_word_char_init
	.def	eb_is_word_char_init;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_is_word_char_init
eb_is_word_char_init:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 96
	.seh_stackalloc	96
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	QWORD PTR 24[rbp], rdx
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -8[rbp], rax
	mov	QWORD PTR -16[rbp], 97
	mov	QWORD PTR -24[rbp], 122
	lea	rcx, eb_within_range[rip]
	mov	r8, QWORD PTR -24[rbp]
	mov	rdx, QWORD PTR -16[rbp]
	mov	rax, QWORD PTR -8[rbp]
	mov	r9, r8
	mov	r8, rdx
	mov	rdx, rax
	call	eb_within_range
	mov	QWORD PTR -32[rbp], rax
	lea	rax, eb_is_word_char_init1f[rip]
	mov	QWORD PTR -64[rbp], rax
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -56[rbp], rax
	lea	rdx, -64[rbp]
	lea	rcx, eb_or[rip]
	mov	rax, QWORD PTR -32[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_or
	mov	QWORD PTR -40[rbp], rax
	mov	rax, QWORD PTR -40[rbp]
	add	rsp, 96
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_is_digit
	.def	eb_is_digit;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_is_digit
eb_is_digit:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 64
	.seh_stackalloc	64
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	QWORD PTR 24[rbp], rdx
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -8[rbp], rax
	mov	QWORD PTR -16[rbp], 48
	mov	QWORD PTR -24[rbp], 57
	lea	rcx, eb_within_range[rip]
	mov	r8, QWORD PTR -24[rbp]
	mov	rdx, QWORD PTR -16[rbp]
	mov	rax, QWORD PTR -8[rbp]
	mov	r9, r8
	mov	r8, rdx
	mov	rdx, rax
	call	eb_within_range
	mov	QWORD PTR -32[rbp], rax
	mov	rax, QWORD PTR -32[rbp]
	add	rsp, 64
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_is_word_char1f
	.def	eb_is_word_char1f;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_is_word_char1f
eb_is_word_char1f:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 48
	.seh_stackalloc	48
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -8[rbp], rax
	lea	rcx, eb_is_digit[rip]
	mov	rax, QWORD PTR -8[rbp]
	mov	rdx, rax
	call	eb_is_digit
	mov	QWORD PTR -16[rbp], rax
	mov	rax, QWORD PTR -16[rbp]
	add	rsp, 48
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_is_word_char
	.def	eb_is_word_char;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_is_word_char
eb_is_word_char:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 80
	.seh_stackalloc	80
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	QWORD PTR 24[rbp], rdx
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -8[rbp], rax
	lea	rcx, eb_is_word_char_init[rip]
	mov	rax, QWORD PTR -8[rbp]
	mov	rdx, rax
	call	eb_is_word_char_init
	mov	QWORD PTR -16[rbp], rax
	lea	rax, eb_is_word_char1f[rip]
	mov	QWORD PTR -48[rbp], rax
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -40[rbp], rax
	lea	rdx, -48[rbp]
	lea	rcx, eb_or[rip]
	mov	rax, QWORD PTR -16[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_or
	mov	QWORD PTR -24[rbp], rax
	mov	rax, QWORD PTR -24[rbp]
	add	rsp, 80
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_parse_word1f1f
	.def	eb_parse_word1f1f;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_parse_word1f1f
eb_parse_word1f1f:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 48
	.seh_stackalloc	48
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	QWORD PTR 24[rbp], rdx
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -8[rbp], rax
	lea	rcx, eb_is_word_char_init[rip]
	mov	rax, QWORD PTR -8[rbp]
	mov	rdx, rax
	call	eb_is_word_char_init
	mov	QWORD PTR -16[rbp], rax
	mov	rax, QWORD PTR -16[rbp]
	add	rsp, 48
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_parse_word1f2f
	.def	eb_parse_word1f2f;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_parse_word1f2f
eb_parse_word1f2f:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 64
	.seh_stackalloc	64
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	QWORD PTR 24[rbp], rdx
	mov	QWORD PTR 32[rbp], r8
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 24
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -8[rbp], rax
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -16[rbp], rax
	mov	rax, QWORD PTR 32[rbp]
	mov	QWORD PTR -24[rbp], rax
	mov	rax, QWORD PTR -8[rbp]
	mov	rax, QWORD PTR [rax]
	mov	r9, rax
	mov	rcx, QWORD PTR -24[rbp]
	mov	rdx, QWORD PTR -16[rbp]
	mov	rax, QWORD PTR -8[rbp]
	mov	r8, rcx
	mov	rcx, rax
	call	r9
	mov	QWORD PTR -32[rbp], rax
	mov	rax, QWORD PTR -32[rbp]
	add	rsp, 64
	pop	rbp
	ret
	.seh_endproc
	.section .rdata,"dr"
	.align 8
.LC16:
	.ascii "expected a start of word character\0"
	.text
	.globl	eb_parse_word1f3f
	.def	eb_parse_word1f3f;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_parse_word1f3f
eb_parse_word1f3f:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 80
	.seh_stackalloc	80
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	QWORD PTR 24[rbp], rdx
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 24
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -8[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 32
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -16[rbp], rax
	lea	rcx, eb_state_pos[rip]
	mov	rax, QWORD PTR -16[rbp]
	mov	rdx, rax
	call	eb_state_pos
	mov	QWORD PTR -24[rbp], rax
	lea	rax, .LC16[rip]
	mov	rdx, rax
	lea	rax, eb_parse_word1f3f01.71[rip]
	mov	rcx, rax
	call	ebz_stol
	mov	rdx, QWORD PTR eb_parse_word1f3f01.71[rip]
	lea	rcx, eb_error_from_position[rip]
	mov	rax, QWORD PTR -24[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_error_from_position
	mov	QWORD PTR -32[rbp], rax
	mov	rax, QWORD PTR -8[rbp]
	mov	rax, QWORD PTR [rax]
	mov	r8, rax
	mov	rdx, QWORD PTR -32[rbp]
	mov	rax, QWORD PTR -8[rbp]
	mov	rcx, rax
	call	r8
	mov	QWORD PTR -40[rbp], rax
	mov	rax, QWORD PTR -40[rbp]
	add	rsp, 80
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_parse_word1f
	.def	eb_parse_word1f;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_parse_word1f
eb_parse_word1f:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 176
	.seh_stackalloc	176
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	QWORD PTR 24[rbp], rdx
	mov	QWORD PTR 32[rbp], r8
	mov	QWORD PTR 40[rbp], r9
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -8[rbp], rax
	lea	rcx, eb_strip[rip]
	mov	rax, QWORD PTR -8[rbp]
	mov	rdx, rax
	call	eb_strip
	mov	QWORD PTR -16[rbp], rax
	lea	rax, eb_parse_word1f1f[rip]
	mov	QWORD PTR -32[rbp], rax
	lea	rax, eb_parse_word1f2f[rip]
	mov	QWORD PTR -80[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 16
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -72[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 24
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -64[rbp], rax
	mov	rax, QWORD PTR 32[rbp]
	mov	QWORD PTR -56[rbp], rax
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -48[rbp], rax
	lea	rax, eb_parse_word1f3f[rip]
	mov	QWORD PTR -128[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -120[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 24
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -112[rbp], rax
	mov	rax, QWORD PTR 40[rbp]
	mov	QWORD PTR -104[rbp], rax
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -96[rbp], rax
	lea	rdx, -128[rbp]
	lea	r9, -80[rbp]
	lea	r8, -32[rbp]
	lea	rcx, eb_parse_if[rip]
	mov	rax, QWORD PTR -16[rbp]
	mov	QWORD PTR 32[rsp], rdx
	mov	rdx, rax
	call	eb_parse_if
	mov	QWORD PTR -24[rbp], rax
	mov	rax, QWORD PTR -24[rbp]
	add	rsp, 176
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_parse_word2f1f1f
	.def	eb_parse_word2f1f1f;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_parse_word2f1f1f
eb_parse_word2f1f1f:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 48
	.seh_stackalloc	48
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	QWORD PTR 24[rbp], rdx
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -8[rbp], rax
	lea	rcx, eb_is_word_char[rip]
	mov	rax, QWORD PTR -8[rbp]
	mov	rdx, rax
	call	eb_is_word_char
	mov	QWORD PTR -16[rbp], rax
	mov	rax, QWORD PTR -16[rbp]
	add	rsp, 48
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_parse_word2f1f2f
	.def	eb_parse_word2f1f2f;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_parse_word2f1f2f
eb_parse_word2f1f2f:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 64
	.seh_stackalloc	64
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	QWORD PTR 24[rbp], rdx
	mov	QWORD PTR 32[rbp], r8
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 40
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -8[rbp], rax
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -16[rbp], rax
	mov	rax, QWORD PTR 32[rbp]
	mov	QWORD PTR -24[rbp], rax
	mov	rax, QWORD PTR -8[rbp]
	mov	rax, QWORD PTR [rax]
	mov	r9, rax
	mov	rcx, QWORD PTR -24[rbp]
	mov	rdx, QWORD PTR -16[rbp]
	mov	rax, QWORD PTR -8[rbp]
	mov	r8, rcx
	mov	rcx, rax
	call	r9
	mov	QWORD PTR -32[rbp], rax
	mov	rax, QWORD PTR -32[rbp]
	add	rsp, 64
	pop	rbp
	ret
	.seh_endproc
	.section .rdata,"dr"
.LC17:
	.ascii "expected word character\0"
	.text
	.globl	eb_parse_word2f1f3f
	.def	eb_parse_word2f1f3f;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_parse_word2f1f3f
eb_parse_word2f1f3f:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 80
	.seh_stackalloc	80
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	QWORD PTR 24[rbp], rdx
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 40
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -8[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 48
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -16[rbp], rax
	lea	rcx, eb_state_pos[rip]
	mov	rax, QWORD PTR -16[rbp]
	mov	rdx, rax
	call	eb_state_pos
	mov	QWORD PTR -24[rbp], rax
	lea	rax, .LC17[rip]
	mov	rdx, rax
	lea	rax, eb_parse_word2f1f3f01.70[rip]
	mov	rcx, rax
	call	ebz_stol
	mov	rdx, QWORD PTR eb_parse_word2f1f3f01.70[rip]
	lea	rcx, eb_error_from_position[rip]
	mov	rax, QWORD PTR -24[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_error_from_position
	mov	QWORD PTR -32[rbp], rax
	mov	rax, QWORD PTR -8[rbp]
	mov	rax, QWORD PTR [rax]
	mov	r8, rax
	mov	rdx, QWORD PTR -32[rbp]
	mov	rax, QWORD PTR -8[rbp]
	mov	rcx, rax
	call	r8
	mov	QWORD PTR -40[rbp], rax
	mov	rax, QWORD PTR -40[rbp]
	add	rsp, 80
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_parse_word2f1f
	.def	eb_parse_word2f1f;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_parse_word2f1f
eb_parse_word2f1f:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 192
	.seh_stackalloc	192
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	QWORD PTR 24[rbp], rdx
	mov	QWORD PTR 32[rbp], r8
	mov	QWORD PTR 40[rbp], r9
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -8[rbp], rax
	lea	rax, eb_parse_word2f1f1f[rip]
	mov	QWORD PTR -24[rbp], rax
	lea	rax, eb_parse_word2f1f2f[rip]
	mov	QWORD PTR -80[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 16
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -72[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 24
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -64[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 40
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -56[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 48
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -48[rbp], rax
	mov	rax, QWORD PTR 32[rbp]
	mov	QWORD PTR -40[rbp], rax
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -32[rbp], rax
	lea	rax, eb_parse_word2f1f3f[rip]
	mov	QWORD PTR -144[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -136[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 24
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -128[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 32
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -120[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 48
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -112[rbp], rax
	mov	rax, QWORD PTR 40[rbp]
	mov	QWORD PTR -104[rbp], rax
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -96[rbp], rax
	lea	rdx, -144[rbp]
	lea	r9, -80[rbp]
	lea	r8, -24[rbp]
	lea	rcx, eb_parse_if[rip]
	mov	rax, QWORD PTR -8[rbp]
	mov	QWORD PTR 32[rsp], rdx
	mov	rdx, rax
	call	eb_parse_if
	mov	QWORD PTR -16[rbp], rax
	mov	rax, QWORD PTR -16[rbp]
	add	rsp, 192
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_parse_word2f2f
	.def	eb_parse_word2f2f;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_parse_word2f2f
eb_parse_word2f2f:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 64
	.seh_stackalloc	64
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	QWORD PTR 24[rbp], rdx
	mov	QWORD PTR 32[rbp], r8
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 24
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -8[rbp], rax
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -16[rbp], rax
	mov	rax, QWORD PTR 32[rbp]
	mov	QWORD PTR -24[rbp], rax
	mov	rax, QWORD PTR -8[rbp]
	mov	rax, QWORD PTR [rax]
	mov	r9, rax
	mov	rcx, QWORD PTR -24[rbp]
	mov	rdx, QWORD PTR -16[rbp]
	mov	rax, QWORD PTR -8[rbp]
	mov	r8, rcx
	mov	rcx, rax
	call	r9
	mov	QWORD PTR -32[rbp], rax
	mov	rax, QWORD PTR -32[rbp]
	add	rsp, 64
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_parse_word2f3f
	.def	eb_parse_word2f3f;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_parse_word2f3f
eb_parse_word2f3f:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 64
	.seh_stackalloc	64
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	QWORD PTR 24[rbp], rdx
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 16
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -8[rbp], rax
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -16[rbp], rax
	mov	rax, QWORD PTR -8[rbp]
	mov	rax, QWORD PTR [rax]
	mov	r8, rax
	mov	rdx, QWORD PTR -16[rbp]
	mov	rax, QWORD PTR -8[rbp]
	mov	rcx, rax
	call	r8
	mov	QWORD PTR -24[rbp], rax
	mov	rax, QWORD PTR -24[rbp]
	add	rsp, 64
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_parse_word2f
	.def	eb_parse_word2f;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_parse_word2f
eb_parse_word2f:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 208
	.seh_stackalloc	208
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	QWORD PTR 24[rbp], rdx
	mov	QWORD PTR 32[rbp], r8
	mov	QWORD PTR 40[rbp], r9
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -8[rbp], rax
	lea	rax, eb_parse_word2f1f[rip]
	mov	QWORD PTR -80[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -72[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 16
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -64[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 24
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -56[rbp], rax
	mov	rax, QWORD PTR 40[rbp]
	mov	QWORD PTR -48[rbp], rax
	mov	rax, QWORD PTR 32[rbp]
	mov	QWORD PTR -40[rbp], rax
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -32[rbp], rax
	lea	rax, eb_parse_word2f2f[rip]
	mov	QWORD PTR -128[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 16
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -120[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 24
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -112[rbp], rax
	mov	rax, QWORD PTR 32[rbp]
	mov	QWORD PTR -104[rbp], rax
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -96[rbp], rax
	lea	rax, eb_parse_word2f3f[rip]
	mov	QWORD PTR -160[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -152[rbp], rax
	mov	rax, QWORD PTR 40[rbp]
	mov	QWORD PTR -144[rbp], rax
	lea	rdx, -160[rbp]
	lea	r9, -128[rbp]
	lea	r8, -80[rbp]
	lea	rcx, eb_parse_zero_or_more[rip]
	mov	rax, QWORD PTR -8[rbp]
	mov	QWORD PTR 32[rsp], rdx
	mov	rdx, rax
	call	eb_parse_zero_or_more
	mov	QWORD PTR -16[rbp], rax
	mov	rax, QWORD PTR -16[rbp]
	add	rsp, 208
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_parse_word3f
	.def	eb_parse_word3f;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_parse_word3f
eb_parse_word3f:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 64
	.seh_stackalloc	64
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	QWORD PTR 24[rbp], rdx
	mov	QWORD PTR 32[rbp], r8
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -8[rbp], rax
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -16[rbp], rax
	mov	rax, QWORD PTR 32[rbp]
	mov	QWORD PTR -24[rbp], rax
	mov	rax, QWORD PTR -8[rbp]
	mov	rax, QWORD PTR [rax]
	mov	r9, rax
	mov	rcx, QWORD PTR -24[rbp]
	mov	rdx, QWORD PTR -16[rbp]
	mov	rax, QWORD PTR -8[rbp]
	mov	r8, rcx
	mov	rcx, rax
	call	r9
	mov	QWORD PTR -32[rbp], rax
	mov	rax, QWORD PTR -32[rbp]
	add	rsp, 64
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_parse_word4f
	.def	eb_parse_word4f;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_parse_word4f
eb_parse_word4f:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 64
	.seh_stackalloc	64
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	QWORD PTR 24[rbp], rdx
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -8[rbp], rax
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -16[rbp], rax
	mov	rax, QWORD PTR -8[rbp]
	mov	rax, QWORD PTR [rax]
	mov	r8, rax
	mov	rdx, QWORD PTR -16[rbp]
	mov	rax, QWORD PTR -8[rbp]
	mov	rcx, rax
	call	r8
	mov	QWORD PTR -24[rbp], rax
	mov	rax, QWORD PTR -24[rbp]
	add	rsp, 64
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_parse_word
	.def	eb_parse_word;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_parse_word
eb_parse_word:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 176
	.seh_stackalloc	176
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	QWORD PTR 24[rbp], rdx
	mov	QWORD PTR 32[rbp], r8
	mov	QWORD PTR 40[rbp], r9
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -8[rbp], rax
	lea	rax, eb_parse_word1f[rip]
	mov	QWORD PTR -48[rbp], rax
	mov	rax, QWORD PTR 40[rbp]
	mov	QWORD PTR -40[rbp], rax
	mov	rax, QWORD PTR 32[rbp]
	mov	QWORD PTR -32[rbp], rax
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -24[rbp], rax
	lea	rax, eb_parse_word2f[rip]
	mov	QWORD PTR -80[rbp], rax
	mov	rax, QWORD PTR 40[rbp]
	mov	QWORD PTR -72[rbp], rax
	mov	rax, QWORD PTR 32[rbp]
	mov	QWORD PTR -64[rbp], rax
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -56[rbp], rax
	lea	rax, eb_parse_word3f[rip]
	mov	QWORD PTR -112[rbp], rax
	mov	rax, QWORD PTR 32[rbp]
	mov	QWORD PTR -104[rbp], rax
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -96[rbp], rax
	lea	rax, eb_parse_word4f[rip]
	mov	QWORD PTR -128[rbp], rax
	mov	rax, QWORD PTR 40[rbp]
	mov	QWORD PTR -120[rbp], rax
	lea	r8, -128[rbp]
	lea	rdx, -112[rbp]
	lea	r9, -80[rbp]
	lea	r10, -48[rbp]
	lea	rcx, eb_parse_and[rip]
	mov	rax, QWORD PTR -8[rbp]
	mov	QWORD PTR 40[rsp], r8
	mov	QWORD PTR 32[rsp], rdx
	mov	r8, r10
	mov	rdx, rax
	call	eb_parse_and
	mov	QWORD PTR -16[rbp], rax
	mov	rax, QWORD PTR -16[rbp]
	add	rsp, 176
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_parse_square2f1f1f
	.def	eb_parse_square2f1f1f;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_parse_square2f1f1f
eb_parse_square2f1f1f:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 64
	.seh_stackalloc	64
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	QWORD PTR 24[rbp], rdx
	mov	QWORD PTR 32[rbp], r8
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 40
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -8[rbp], rax
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -16[rbp], rax
	mov	rax, QWORD PTR 32[rbp]
	mov	QWORD PTR -24[rbp], rax
	mov	rax, QWORD PTR -8[rbp]
	mov	rax, QWORD PTR [rax]
	mov	r9, rax
	mov	rcx, QWORD PTR -24[rbp]
	mov	rdx, QWORD PTR -16[rbp]
	mov	rax, QWORD PTR -8[rbp]
	mov	r8, rcx
	mov	rcx, rax
	call	r9
	mov	QWORD PTR -32[rbp], rax
	mov	rax, QWORD PTR -32[rbp]
	add	rsp, 64
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_parse_square2f1f2f
	.def	eb_parse_square2f1f2f;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_parse_square2f1f2f
eb_parse_square2f1f2f:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 64
	.seh_stackalloc	64
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	QWORD PTR 24[rbp], rdx
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 16
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -8[rbp], rax
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -16[rbp], rax
	mov	rax, QWORD PTR -8[rbp]
	mov	rax, QWORD PTR [rax]
	mov	r8, rax
	mov	rdx, QWORD PTR -16[rbp]
	mov	rax, QWORD PTR -8[rbp]
	mov	rcx, rax
	call	r8
	mov	QWORD PTR -24[rbp], rax
	mov	rax, QWORD PTR -24[rbp]
	add	rsp, 64
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_parse_square2f1f
	.def	eb_parse_square2f1f;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_parse_square2f1f
eb_parse_square2f1f:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 144
	.seh_stackalloc	144
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	QWORD PTR 24[rbp], rdx
	mov	QWORD PTR 32[rbp], r8
	mov	QWORD PTR 40[rbp], r9
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -8[rbp], rax
	lea	rax, eb_parse_square2f1f1f[rip]
	mov	QWORD PTR -80[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 16
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -72[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 24
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -64[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 32
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -56[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 40
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -48[rbp], rax
	mov	rax, QWORD PTR 32[rbp]
	mov	QWORD PTR -40[rbp], rax
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -32[rbp], rax
	lea	rax, eb_parse_square2f1f2f[rip]
	mov	QWORD PTR -112[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -104[rbp], rax
	mov	rax, QWORD PTR 40[rbp]
	mov	QWORD PTR -96[rbp], rax
	lea	r8, -112[rbp]
	lea	rdx, -80[rbp]
	lea	rcx, eb_parse_word[rip]
	mov	rax, QWORD PTR -8[rbp]
	mov	r9, r8
	mov	r8, rdx
	mov	rdx, rax
	call	eb_parse_word
	mov	QWORD PTR -16[rbp], rax
	mov	rax, QWORD PTR -16[rbp]
	add	rsp, 144
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_parse_square2f2f1f2f
	.def	eb_parse_square2f2f1f2f;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_parse_square2f2f1f2f
eb_parse_square2f2f1f2f:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 64
	.seh_stackalloc	64
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	QWORD PTR 24[rbp], rdx
	mov	QWORD PTR 32[rbp], r8
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -8[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 40
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -16[rbp], rax
	mov	rax, QWORD PTR 32[rbp]
	mov	QWORD PTR -24[rbp], rax
	mov	rax, QWORD PTR -8[rbp]
	mov	rax, QWORD PTR [rax]
	mov	r9, rax
	mov	rcx, QWORD PTR -24[rbp]
	mov	rdx, QWORD PTR -16[rbp]
	mov	rax, QWORD PTR -8[rbp]
	mov	r8, rcx
	mov	rcx, rax
	call	r9
	mov	QWORD PTR -32[rbp], rax
	mov	rax, QWORD PTR -32[rbp]
	add	rsp, 64
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_parse_square2f2f1f3f
	.def	eb_parse_square2f2f1f3f;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_parse_square2f2f1f3f
eb_parse_square2f2f1f3f:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 64
	.seh_stackalloc	64
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	QWORD PTR 24[rbp], rdx
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -8[rbp], rax
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -16[rbp], rax
	mov	rax, QWORD PTR -8[rbp]
	mov	rax, QWORD PTR [rax]
	mov	r8, rax
	mov	rdx, QWORD PTR -16[rbp]
	mov	rax, QWORD PTR -8[rbp]
	mov	rcx, rax
	call	r8
	mov	QWORD PTR -24[rbp], rax
	mov	rax, QWORD PTR -24[rbp]
	add	rsp, 64
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_parse_square2f2f1f
	.def	eb_parse_square2f2f1f;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_parse_square2f2f1f
eb_parse_square2f2f1f:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 144
	.seh_stackalloc	144
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	QWORD PTR 24[rbp], rdx
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 40
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -8[rbp], rax
	lea	rcx, eb_strip[rip]
	mov	rax, QWORD PTR -8[rbp]
	mov	rdx, rax
	call	eb_strip
	mov	QWORD PTR -16[rbp], rax
	mov	QWORD PTR -24[rbp], 93
	lea	rax, eb_parse_square2f2f1f2f[rip]
	mov	QWORD PTR -80[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 16
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -72[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 24
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -64[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 32
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -56[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 40
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -48[rbp], rax
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -40[rbp], rax
	lea	rax, eb_parse_square2f2f1f3f[rip]
	mov	QWORD PTR -96[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -88[rbp], rax
	lea	rdx, -96[rbp]
	lea	r9, -80[rbp]
	lea	rcx, eb_parse_value[rip]
	mov	r8, QWORD PTR -24[rbp]
	mov	rax, QWORD PTR -16[rbp]
	mov	QWORD PTR 32[rsp], rdx
	mov	rdx, rax
	call	eb_parse_value
	mov	QWORD PTR -32[rbp], rax
	mov	rax, QWORD PTR -32[rbp]
	add	rsp, 144
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_parse_square2f2f
	.def	eb_parse_square2f2f;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_parse_square2f2f
eb_parse_square2f2f:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 96
	.seh_stackalloc	96
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	QWORD PTR 24[rbp], rdx
	mov	QWORD PTR 32[rbp], r8
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -8[rbp], rax
	lea	rax, eb_parse_square2f2f1f[rip]
	mov	QWORD PTR -64[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -56[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 16
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -48[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 24
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -40[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 32
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -32[rbp], rax
	mov	rax, QWORD PTR 32[rbp]
	mov	QWORD PTR -24[rbp], rax
	lea	rdx, -64[rbp]
	lea	rcx, eb_let[rip]
	mov	rax, QWORD PTR -8[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_let
	mov	QWORD PTR -16[rbp], rax
	mov	rax, QWORD PTR -16[rbp]
	add	rsp, 96
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_parse_square2f3f
	.def	eb_parse_square2f3f;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_parse_square2f3f
eb_parse_square2f3f:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 64
	.seh_stackalloc	64
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	QWORD PTR 24[rbp], rdx
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -8[rbp], rax
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -16[rbp], rax
	mov	rax, QWORD PTR -8[rbp]
	mov	rax, QWORD PTR [rax]
	mov	r8, rax
	mov	rdx, QWORD PTR -16[rbp]
	mov	rax, QWORD PTR -8[rbp]
	mov	rcx, rax
	call	r8
	mov	QWORD PTR -24[rbp], rax
	mov	rax, QWORD PTR -24[rbp]
	add	rsp, 64
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_parse_square2f
	.def	eb_parse_square2f;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_parse_square2f
eb_parse_square2f:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 176
	.seh_stackalloc	176
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	QWORD PTR 24[rbp], rdx
	mov	QWORD PTR 32[rbp], r8
	mov	rax, QWORD PTR 32[rbp]
	mov	QWORD PTR -8[rbp], rax
	lea	rax, eb_parse_square2f1f[rip]
	mov	QWORD PTR -64[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -56[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 16
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -48[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 24
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -40[rbp], rax
	mov	rax, QWORD PTR 32[rbp]
	mov	QWORD PTR -32[rbp], rax
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -24[rbp], rax
	lea	rax, eb_parse_square2f2f[rip]
	mov	QWORD PTR -112[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -104[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 16
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -96[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 24
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -88[rbp], rax
	mov	rax, QWORD PTR 32[rbp]
	mov	QWORD PTR -80[rbp], rax
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -72[rbp], rax
	lea	rax, eb_parse_square2f3f[rip]
	mov	QWORD PTR -128[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -120[rbp], rax
	lea	rdx, -128[rbp]
	lea	r9, -112[rbp]
	lea	r8, -64[rbp]
	lea	rcx, eb_parse_zero_or_more[rip]
	mov	rax, QWORD PTR -8[rbp]
	mov	QWORD PTR 32[rsp], rdx
	mov	rdx, rax
	call	eb_parse_zero_or_more
	mov	QWORD PTR -16[rbp], rax
	mov	rax, QWORD PTR -16[rbp]
	add	rsp, 176
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_parse_square3f
	.def	eb_parse_square3f;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_parse_square3f
eb_parse_square3f:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 64
	.seh_stackalloc	64
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	QWORD PTR 24[rbp], rdx
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -8[rbp], rax
	mov	QWORD PTR -16[rbp], 0
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 16
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -24[rbp], rax
	mov	rax, QWORD PTR -8[rbp]
	mov	rax, QWORD PTR [rax]
	mov	r9, rax
	mov	rcx, QWORD PTR -24[rbp]
	mov	rdx, QWORD PTR -16[rbp]
	mov	rax, QWORD PTR -8[rbp]
	mov	r8, rcx
	mov	rcx, rax
	call	r9
	mov	QWORD PTR -32[rbp], rax
	mov	rax, QWORD PTR -32[rbp]
	add	rsp, 64
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_parse_square
	.def	eb_parse_square;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_parse_square
eb_parse_square:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 144
	.seh_stackalloc	144
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	QWORD PTR 24[rbp], rdx
	mov	QWORD PTR 32[rbp], r8
	mov	QWORD PTR 40[rbp], r9
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -8[rbp], rax
	lea	rcx, eb_strip[rip]
	mov	rax, QWORD PTR -8[rbp]
	mov	rdx, rax
	call	eb_strip
	mov	QWORD PTR -16[rbp], rax
	mov	QWORD PTR -24[rbp], 91
	lea	rax, eb_parse_square2f[rip]
	mov	QWORD PTR -64[rbp], rax
	mov	rax, QWORD PTR 40[rbp]
	mov	QWORD PTR -56[rbp], rax
	mov	rax, QWORD PTR 32[rbp]
	mov	QWORD PTR -48[rbp], rax
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -40[rbp], rax
	lea	rax, eb_parse_square3f[rip]
	mov	QWORD PTR -96[rbp], rax
	mov	rax, QWORD PTR 32[rbp]
	mov	QWORD PTR -88[rbp], rax
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -80[rbp], rax
	lea	rdx, -96[rbp]
	lea	r9, -64[rbp]
	lea	rcx, eb_parse_value[rip]
	mov	r8, QWORD PTR -24[rbp]
	mov	rax, QWORD PTR -16[rbp]
	mov	QWORD PTR 32[rsp], rdx
	mov	rdx, rax
	call	eb_parse_value
	mov	QWORD PTR -32[rbp], rax
	mov	rax, QWORD PTR -32[rbp]
	add	rsp, 144
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_parse_args_from2f1f1f1f02f
	.def	eb_parse_args_from2f1f1f1f02f;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_parse_args_from2f1f1f1f02f
eb_parse_args_from2f1f1f1f02f:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 64
	.seh_stackalloc	64
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	QWORD PTR 24[rbp], rdx
	mov	QWORD PTR 32[rbp], r8
	mov	rax, QWORD PTR 32[rbp]
	mov	QWORD PTR -8[rbp], rax
	lea	rcx, eb_binding_generic[rip]
	mov	rax, QWORD PTR -8[rbp]
	mov	rdx, rax
	call	eb_binding_generic
	mov	QWORD PTR -16[rbp], rax
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -24[rbp], rax
	lea	rcx, eb_cons[rip]
	mov	rdx, QWORD PTR -24[rbp]
	mov	rax, QWORD PTR -16[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_cons
	mov	QWORD PTR -32[rbp], rax
	mov	rax, QWORD PTR -32[rbp]
	add	rsp, 64
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_parse_args_from2f1f1f1f1f02f
	.def	eb_parse_args_from2f1f1f1f1f02f;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_parse_args_from2f1f1f1f1f02f
eb_parse_args_from2f1f1f1f1f02f:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 64
	.seh_stackalloc	64
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	QWORD PTR 24[rbp], rdx
	mov	QWORD PTR 32[rbp], r8
	mov	rax, QWORD PTR 32[rbp]
	mov	QWORD PTR -8[rbp], rax
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -16[rbp], rax
	lea	rcx, eb_cons[rip]
	mov	rdx, QWORD PTR -16[rbp]
	mov	rax, QWORD PTR -8[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_cons
	mov	QWORD PTR -24[rbp], rax
	mov	rax, QWORD PTR -24[rbp]
	add	rsp, 64
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_parse_args_from2f1f1f1f1f1f1f2f
	.def	eb_parse_args_from2f1f1f1f1f1f1f2f;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_parse_args_from2f1f1f1f1f1f1f2f
eb_parse_args_from2f1f1f1f1f1f1f2f:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 64
	.seh_stackalloc	64
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	QWORD PTR 24[rbp], rdx
	mov	QWORD PTR 32[rbp], r8
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 72
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -8[rbp], rax
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -16[rbp], rax
	mov	rax, QWORD PTR 32[rbp]
	mov	QWORD PTR -24[rbp], rax
	mov	rax, QWORD PTR -8[rbp]
	mov	rax, QWORD PTR [rax]
	mov	r9, rax
	mov	rcx, QWORD PTR -24[rbp]
	mov	rdx, QWORD PTR -16[rbp]
	mov	rax, QWORD PTR -8[rbp]
	mov	r8, rcx
	mov	rcx, rax
	call	r9
	mov	QWORD PTR -32[rbp], rax
	mov	rax, QWORD PTR -32[rbp]
	add	rsp, 64
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_parse_args_from2f1f1f1f1f1f1f3f
	.def	eb_parse_args_from2f1f1f1f1f1f1f3f;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_parse_args_from2f1f1f1f1f1f1f3f
eb_parse_args_from2f1f1f1f1f1f1f3f:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 64
	.seh_stackalloc	64
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	QWORD PTR 24[rbp], rdx
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 16
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -8[rbp], rax
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -16[rbp], rax
	mov	rax, QWORD PTR -8[rbp]
	mov	rax, QWORD PTR [rax]
	mov	r8, rax
	mov	rdx, QWORD PTR -16[rbp]
	mov	rax, QWORD PTR -8[rbp]
	mov	rcx, rax
	call	r8
	mov	QWORD PTR -24[rbp], rax
	mov	rax, QWORD PTR -24[rbp]
	add	rsp, 64
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_parse_args_from2f1f1f1f1f1f1f
	.def	eb_parse_args_from2f1f1f1f1f1f1f;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_parse_args_from2f1f1f1f1f1f1f
eb_parse_args_from2f1f1f1f1f1f1f:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 192
	.seh_stackalloc	192
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	QWORD PTR 24[rbp], rdx
	mov	QWORD PTR 32[rbp], r8
	mov	QWORD PTR 40[rbp], r9
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -8[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 88
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -16[rbp], rax
	lea	rax, eb_parse_args_from2f1f1f1f1f1f1f2f[rip]
	mov	QWORD PTR -112[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 16
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -104[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 32
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -96[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 40
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -88[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 48
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -80[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 56
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -72[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 64
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -64[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 72
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -56[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 80
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -48[rbp], rax
	mov	rax, QWORD PTR 32[rbp]
	mov	QWORD PTR -40[rbp], rax
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -32[rbp], rax
	lea	rax, eb_parse_args_from2f1f1f1f1f1f1f3f[rip]
	mov	QWORD PTR -144[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -136[rbp], rax
	mov	rax, QWORD PTR 40[rbp]
	mov	QWORD PTR -128[rbp], rax
	lea	rdx, -144[rbp]
	lea	r9, -112[rbp]
	lea	rcx, eb_parse_args_from[rip]
	mov	r8, QWORD PTR -16[rbp]
	mov	rax, QWORD PTR -8[rbp]
	mov	QWORD PTR 32[rsp], rdx
	mov	rdx, rax
	call	eb_parse_args_from
	mov	QWORD PTR -24[rbp], rax
	mov	rax, QWORD PTR -24[rbp]
	add	rsp, 192
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_parse_args_from2f1f1f1f1f1f2f1f2f
	.def	eb_parse_args_from2f1f1f1f1f1f2f1f2f;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_parse_args_from2f1f1f1f1f1f2f1f2f
eb_parse_args_from2f1f1f1f1f1f2f1f2f:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 96
	.seh_stackalloc	96
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	QWORD PTR 24[rbp], rdx
	mov	QWORD PTR 32[rbp], r8
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -8[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 40
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -16[rbp], rax
	lea	rcx, eb_binding_value[rip]
	mov	rax, QWORD PTR -16[rbp]
	mov	rdx, rax
	call	eb_binding_value
	mov	QWORD PTR -24[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 72
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -32[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 56
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -40[rbp], rax
	lea	rcx, eb_binding_lambda[rip]
	mov	r8, QWORD PTR -40[rbp]
	mov	rdx, QWORD PTR -32[rbp]
	mov	rax, QWORD PTR -24[rbp]
	mov	r9, r8
	mov	r8, rdx
	mov	rdx, rax
	call	eb_binding_lambda
	mov	QWORD PTR -48[rbp], rax
	mov	rax, QWORD PTR 32[rbp]
	mov	QWORD PTR -56[rbp], rax
	mov	rax, QWORD PTR -8[rbp]
	mov	rax, QWORD PTR [rax]
	mov	r9, rax
	mov	rcx, QWORD PTR -56[rbp]
	mov	rdx, QWORD PTR -48[rbp]
	mov	rax, QWORD PTR -8[rbp]
	mov	r8, rcx
	mov	rcx, rax
	call	r9
	mov	QWORD PTR -64[rbp], rax
	mov	rax, QWORD PTR -64[rbp]
	add	rsp, 96
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_parse_args_from2f1f1f1f1f1f2f1f3f
	.def	eb_parse_args_from2f1f1f1f1f1f2f1f3f;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_parse_args_from2f1f1f1f1f1f2f1f3f
eb_parse_args_from2f1f1f1f1f1f2f1f3f:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 64
	.seh_stackalloc	64
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	QWORD PTR 24[rbp], rdx
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -8[rbp], rax
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -16[rbp], rax
	mov	rax, QWORD PTR -8[rbp]
	mov	rax, QWORD PTR [rax]
	mov	r8, rax
	mov	rdx, QWORD PTR -16[rbp]
	mov	rax, QWORD PTR -8[rbp]
	mov	rcx, rax
	call	r8
	mov	QWORD PTR -24[rbp], rax
	mov	rax, QWORD PTR -24[rbp]
	add	rsp, 64
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_parse_args_from2f1f1f1f1f1f2f1f
	.def	eb_parse_args_from2f1f1f1f1f1f2f1f;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_parse_args_from2f1f1f1f1f1f2f1f
eb_parse_args_from2f1f1f1f1f1f2f1f:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 176
	.seh_stackalloc	176
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	QWORD PTR 24[rbp], rdx
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 72
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -8[rbp], rax
	lea	rcx, eb_strip[rip]
	mov	rax, QWORD PTR -8[rbp]
	mov	rdx, rax
	call	eb_strip
	mov	QWORD PTR -16[rbp], rax
	mov	QWORD PTR -24[rbp], 41
	lea	rax, eb_parse_args_from2f1f1f1f1f1f2f1f2f[rip]
	mov	QWORD PTR -112[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 16
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -104[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 24
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -96[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 32
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -88[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 40
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -80[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 48
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -72[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 56
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -64[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 64
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -56[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 72
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -48[rbp], rax
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -40[rbp], rax
	lea	rax, eb_parse_args_from2f1f1f1f1f1f2f1f3f[rip]
	mov	QWORD PTR -128[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -120[rbp], rax
	lea	rdx, -128[rbp]
	lea	r9, -112[rbp]
	lea	rcx, eb_parse_value[rip]
	mov	r8, QWORD PTR -24[rbp]
	mov	rax, QWORD PTR -16[rbp]
	mov	QWORD PTR 32[rsp], rdx
	mov	rdx, rax
	call	eb_parse_value
	mov	QWORD PTR -32[rbp], rax
	mov	rax, QWORD PTR -32[rbp]
	add	rsp, 176
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_parse_args_from2f1f1f1f1f1f2f
	.def	eb_parse_args_from2f1f1f1f1f1f2f;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_parse_args_from2f1f1f1f1f1f2f
eb_parse_args_from2f1f1f1f1f1f2f:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	add	rsp, -128
	.seh_stackalloc	128
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	QWORD PTR 24[rbp], rdx
	mov	QWORD PTR 32[rbp], r8
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -8[rbp], rax
	lea	rax, eb_parse_args_from2f1f1f1f1f1f2f1f[rip]
	mov	QWORD PTR -96[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -88[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 16
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -80[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 24
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -72[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 32
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -64[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 48
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -56[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 64
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -48[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 72
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -40[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 88
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -32[rbp], rax
	mov	rax, QWORD PTR 32[rbp]
	mov	QWORD PTR -24[rbp], rax
	lea	rdx, -96[rbp]
	lea	rcx, eb_let[rip]
	mov	rax, QWORD PTR -8[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_let
	mov	QWORD PTR -16[rbp], rax
	mov	rax, QWORD PTR -16[rbp]
	sub	rsp, -128
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_parse_args_from2f1f1f1f1f1f3f
	.def	eb_parse_args_from2f1f1f1f1f1f3f;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_parse_args_from2f1f1f1f1f1f3f
eb_parse_args_from2f1f1f1f1f1f3f:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 64
	.seh_stackalloc	64
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	QWORD PTR 24[rbp], rdx
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -8[rbp], rax
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -16[rbp], rax
	mov	rax, QWORD PTR -8[rbp]
	mov	rax, QWORD PTR [rax]
	mov	r8, rax
	mov	rdx, QWORD PTR -16[rbp]
	mov	rax, QWORD PTR -8[rbp]
	mov	rcx, rax
	call	r8
	mov	QWORD PTR -24[rbp], rax
	mov	rax, QWORD PTR -24[rbp]
	add	rsp, 64
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_parse_args_from2f1f1f1f1f1f
	.def	eb_parse_args_from2f1f1f1f1f1f;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_parse_args_from2f1f1f1f1f1f
eb_parse_args_from2f1f1f1f1f1f:
	push	rbp
	.seh_pushreg	rbp
	sub	rsp, 272
	.seh_stackalloc	272
	lea	rbp, 128[rsp]
	.seh_setframe	rbp, 128
	.seh_endprologue
	mov	QWORD PTR 160[rbp], rcx
	mov	QWORD PTR 168[rbp], rdx
	mov	rax, QWORD PTR 160[rbp]
	add	rax, 80
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR 136[rbp], rax
	lea	rax, eb_parse_args_from2f1f1f1f1f1f1f[rip]
	mov	QWORD PTR 32[rbp], rax
	mov	rax, QWORD PTR 160[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR 40[rbp], rax
	mov	rax, QWORD PTR 160[rbp]
	add	rax, 16
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR 48[rbp], rax
	mov	rax, QWORD PTR 160[rbp]
	add	rax, 24
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR 56[rbp], rax
	mov	rax, QWORD PTR 160[rbp]
	add	rax, 32
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR 64[rbp], rax
	mov	rax, QWORD PTR 160[rbp]
	add	rax, 40
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR 72[rbp], rax
	mov	rax, QWORD PTR 160[rbp]
	add	rax, 48
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR 80[rbp], rax
	mov	rax, QWORD PTR 160[rbp]
	add	rax, 56
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR 88[rbp], rax
	mov	rax, QWORD PTR 160[rbp]
	add	rax, 64
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR 96[rbp], rax
	mov	rax, QWORD PTR 160[rbp]
	add	rax, 80
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR 104[rbp], rax
	mov	rax, QWORD PTR 160[rbp]
	add	rax, 88
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR 112[rbp], rax
	mov	rax, QWORD PTR 168[rbp]
	mov	QWORD PTR 120[rbp], rax
	lea	rax, eb_parse_args_from2f1f1f1f1f1f2f[rip]
	mov	QWORD PTR -64[rbp], rax
	mov	rax, QWORD PTR 160[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -56[rbp], rax
	mov	rax, QWORD PTR 160[rbp]
	add	rax, 16
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -48[rbp], rax
	mov	rax, QWORD PTR 160[rbp]
	add	rax, 32
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -40[rbp], rax
	mov	rax, QWORD PTR 160[rbp]
	add	rax, 40
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -32[rbp], rax
	mov	rax, QWORD PTR 160[rbp]
	add	rax, 48
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -24[rbp], rax
	mov	rax, QWORD PTR 160[rbp]
	add	rax, 56
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -16[rbp], rax
	mov	rax, QWORD PTR 160[rbp]
	add	rax, 64
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -8[rbp], rax
	mov	rax, QWORD PTR 160[rbp]
	add	rax, 72
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR 0[rbp], rax
	mov	rax, QWORD PTR 160[rbp]
	add	rax, 80
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR 8[rbp], rax
	mov	rax, QWORD PTR 160[rbp]
	add	rax, 88
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR 16[rbp], rax
	mov	rax, QWORD PTR 160[rbp]
	add	rax, 96
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR 24[rbp], rax
	lea	rax, eb_parse_args_from2f1f1f1f1f1f3f[rip]
	mov	QWORD PTR -80[rbp], rax
	mov	rax, QWORD PTR 160[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -72[rbp], rax
	lea	rdx, -80[rbp]
	lea	r9, -64[rbp]
	lea	r8, 32[rbp]
	lea	rcx, eb_parse_zero_or_more[rip]
	mov	rax, QWORD PTR 136[rbp]
	mov	QWORD PTR 32[rsp], rdx
	mov	rdx, rax
	call	eb_parse_zero_or_more
	mov	QWORD PTR 128[rbp], rax
	mov	rax, QWORD PTR 128[rbp]
	add	rsp, 272
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_parse_args_from2f1f1f1f1f
	.def	eb_parse_args_from2f1f1f1f1f;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_parse_args_from2f1f1f1f1f
eb_parse_args_from2f1f1f1f1f:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 192
	.seh_stackalloc	192
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	QWORD PTR 24[rbp], rdx
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 24
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -8[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 88
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -16[rbp], rax
	lea	rax, eb_parse_args_from2f1f1f1f1f02f[rip]
	mov	QWORD PTR -48[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 24
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -40[rbp], rax
	lea	r8, -48[rbp]
	lea	rcx, eb_fold[rip]
	mov	rdx, QWORD PTR -16[rbp]
	mov	rax, QWORD PTR -8[rbp]
	mov	r9, r8
	mov	r8, rdx
	mov	rdx, rax
	call	eb_fold
	mov	QWORD PTR -24[rbp], rax
	lea	rax, eb_parse_args_from2f1f1f1f1f1f[rip]
	mov	QWORD PTR -160[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -152[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 16
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -144[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 24
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -136[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 32
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -128[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 40
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -120[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 48
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -112[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 56
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -104[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 64
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -96[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 72
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -88[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 80
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -80[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 88
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -72[rbp], rax
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -64[rbp], rax
	lea	rdx, -160[rbp]
	lea	rcx, eb_let[rip]
	mov	rax, QWORD PTR -24[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_let
	mov	QWORD PTR -32[rbp], rax
	mov	rax, QWORD PTR -32[rbp]
	add	rsp, 192
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_parse_args_from2f1f1f1f
	.def	eb_parse_args_from2f1f1f1f;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_parse_args_from2f1f1f1f
eb_parse_args_from2f1f1f1f:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 176
	.seh_stackalloc	176
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	QWORD PTR 24[rbp], rdx
	mov	QWORD PTR 32[rbp], r8
	mov	QWORD PTR -8[rbp], 0
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -16[rbp], rax
	lea	rax, eb_parse_args_from2f1f1f1f02f[rip]
	mov	QWORD PTR -40[rbp], rax
	lea	r8, -40[rbp]
	lea	rcx, eb_fold[rip]
	mov	rdx, QWORD PTR -16[rbp]
	mov	rax, QWORD PTR -8[rbp]
	mov	r9, r8
	mov	r8, rdx
	mov	rdx, rax
	call	eb_fold
	mov	QWORD PTR -24[rbp], rax
	lea	rax, eb_parse_args_from2f1f1f1f1f[rip]
	mov	QWORD PTR -144[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -136[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 16
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -128[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 24
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -120[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 32
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -112[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 40
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -104[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 48
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -96[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 56
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -88[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 64
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -80[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 72
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -72[rbp], rax
	mov	rax, QWORD PTR 32[rbp]
	mov	QWORD PTR -64[rbp], rax
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -56[rbp], rax
	lea	rdx, -144[rbp]
	lea	rcx, eb_let[rip]
	mov	rax, QWORD PTR -24[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_let
	mov	QWORD PTR -32[rbp], rax
	mov	rax, QWORD PTR -32[rbp]
	add	rsp, 176
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_parse_args_from2f1f1f2f
	.def	eb_parse_args_from2f1f1f2f;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_parse_args_from2f1f1f2f
eb_parse_args_from2f1f1f2f:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 64
	.seh_stackalloc	64
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	QWORD PTR 24[rbp], rdx
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -8[rbp], rax
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -16[rbp], rax
	mov	rax, QWORD PTR -8[rbp]
	mov	rax, QWORD PTR [rax]
	mov	r8, rax
	mov	rdx, QWORD PTR -16[rbp]
	mov	rax, QWORD PTR -8[rbp]
	mov	rcx, rax
	call	r8
	mov	QWORD PTR -24[rbp], rax
	mov	rax, QWORD PTR -24[rbp]
	add	rsp, 64
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_parse_args_from2f1f1f
	.def	eb_parse_args_from2f1f1f;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_parse_args_from2f1f1f
eb_parse_args_from2f1f1f:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 144
	.seh_stackalloc	144
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	QWORD PTR 24[rbp], rdx
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 56
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -8[rbp], rax
	lea	rax, eb_parse_args_from2f1f1f1f[rip]
	mov	QWORD PTR -96[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -88[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 16
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -80[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 24
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -72[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 32
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -64[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 40
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -56[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 48
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -48[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 56
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -40[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 64
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -32[rbp], rax
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -24[rbp], rax
	lea	rax, eb_parse_args_from2f1f1f2f[rip]
	mov	QWORD PTR -112[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -104[rbp], rax
	lea	r8, -112[rbp]
	lea	rdx, -96[rbp]
	lea	rcx, eb_parse_square[rip]
	mov	rax, QWORD PTR -8[rbp]
	mov	r9, r8
	mov	r8, rdx
	mov	rdx, rax
	call	eb_parse_square
	mov	QWORD PTR -16[rbp], rax
	mov	rax, QWORD PTR -16[rbp]
	add	rsp, 144
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_parse_args_from2f1f
	.def	eb_parse_args_from2f1f;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_parse_args_from2f1f
eb_parse_args_from2f1f:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	add	rsp, -128
	.seh_stackalloc	128
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	QWORD PTR 24[rbp], rdx
	mov	QWORD PTR 32[rbp], r8
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -8[rbp], rax
	lea	rax, eb_parse_args_from2f1f1f[rip]
	mov	QWORD PTR -96[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -88[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 16
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -80[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 24
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -72[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 32
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -64[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 40
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -56[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 48
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -48[rbp], rax
	mov	rax, QWORD PTR 32[rbp]
	mov	QWORD PTR -40[rbp], rax
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -32[rbp], rax
	lea	rdx, -96[rbp]
	lea	rcx, eb_let[rip]
	mov	rax, QWORD PTR -8[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_let
	mov	QWORD PTR -16[rbp], rax
	mov	rax, QWORD PTR -16[rbp]
	sub	rsp, -128
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_parse_args_from2f2f
	.def	eb_parse_args_from2f2f;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_parse_args_from2f2f
eb_parse_args_from2f2f:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 64
	.seh_stackalloc	64
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	QWORD PTR 24[rbp], rdx
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -8[rbp], rax
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -16[rbp], rax
	mov	rax, QWORD PTR -8[rbp]
	mov	rax, QWORD PTR [rax]
	mov	r8, rax
	mov	rdx, QWORD PTR -16[rbp]
	mov	rax, QWORD PTR -8[rbp]
	mov	rcx, rax
	call	r8
	mov	QWORD PTR -24[rbp], rax
	mov	rax, QWORD PTR -24[rbp]
	add	rsp, 64
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_parse_args_from2f
	.def	eb_parse_args_from2f;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_parse_args_from2f
eb_parse_args_from2f:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	add	rsp, -128
	.seh_stackalloc	128
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	QWORD PTR 24[rbp], rdx
	mov	QWORD PTR 32[rbp], r8
	mov	rax, QWORD PTR 32[rbp]
	mov	QWORD PTR -8[rbp], rax
	lea	rax, eb_parse_args_from2f1f[rip]
	mov	QWORD PTR -80[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -72[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 16
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -64[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 24
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -56[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 32
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -48[rbp], rax
	mov	rax, QWORD PTR 32[rbp]
	mov	QWORD PTR -40[rbp], rax
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -32[rbp], rax
	lea	rax, eb_parse_args_from2f2f[rip]
	mov	QWORD PTR -96[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -88[rbp], rax
	lea	r8, -96[rbp]
	lea	rdx, -80[rbp]
	lea	rcx, eb_parse_word[rip]
	mov	rax, QWORD PTR -8[rbp]
	mov	r9, r8
	mov	r8, rdx
	mov	rdx, rax
	call	eb_parse_word
	mov	QWORD PTR -16[rbp], rax
	mov	rax, QWORD PTR -16[rbp]
	sub	rsp, -128
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_parse_args_from3f1f01f
	.def	eb_parse_args_from3f1f01f;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_parse_args_from3f1f01f
eb_parse_args_from3f1f01f:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 64
	.seh_stackalloc	64
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	QWORD PTR 24[rbp], rdx
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -8[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -16[rbp], rax
	lea	rcx, eb_str_eq[rip]
	mov	rdx, QWORD PTR -16[rbp]
	mov	rax, QWORD PTR -8[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_str_eq
	mov	QWORD PTR -24[rbp], rax
	mov	rax, QWORD PTR -24[rbp]
	add	rsp, 64
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_parse_args_from3f1f1f
	.def	eb_parse_args_from3f1f1f;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_parse_args_from3f1f1f
eb_parse_args_from3f1f1f:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 80
	.seh_stackalloc	80
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -8[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 32
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -16[rbp], rax
	lea	rcx, eb_binding_generic[rip]
	mov	rax, QWORD PTR -16[rbp]
	mov	rdx, rax
	call	eb_binding_generic
	mov	QWORD PTR -24[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 24
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -32[rbp], rax
	mov	rax, QWORD PTR -8[rbp]
	mov	rax, QWORD PTR [rax]
	mov	r9, rax
	mov	rcx, QWORD PTR -32[rbp]
	mov	rdx, QWORD PTR -24[rbp]
	mov	rax, QWORD PTR -8[rbp]
	mov	r8, rcx
	mov	rcx, rax
	call	r9
	mov	QWORD PTR -40[rbp], rax
	mov	rax, QWORD PTR -40[rbp]
	add	rsp, 80
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_parse_args_from3f1f2f
	.def	eb_parse_args_from3f1f2f;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_parse_args_from3f1f2f
eb_parse_args_from3f1f2f:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 80
	.seh_stackalloc	80
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -8[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 32
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -16[rbp], rax
	lea	rcx, eb_binding_value[rip]
	mov	rax, QWORD PTR -16[rbp]
	mov	rdx, rax
	call	eb_binding_value
	mov	QWORD PTR -24[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 24
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -32[rbp], rax
	mov	rax, QWORD PTR -8[rbp]
	mov	rax, QWORD PTR [rax]
	mov	r9, rax
	mov	rcx, QWORD PTR -32[rbp]
	mov	rdx, QWORD PTR -24[rbp]
	mov	rax, QWORD PTR -8[rbp]
	mov	r8, rcx
	mov	rcx, rax
	call	r9
	mov	QWORD PTR -40[rbp], rax
	mov	rax, QWORD PTR -40[rbp]
	add	rsp, 80
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_parse_args_from3f1f
	.def	eb_parse_args_from3f1f;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_parse_args_from3f1f
eb_parse_args_from3f1f:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 176
	.seh_stackalloc	176
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	QWORD PTR 24[rbp], rdx
	mov	QWORD PTR 32[rbp], r8
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 16
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -8[rbp], rax
	lea	rax, eb_parse_args_from3f1f01f[rip]
	mov	QWORD PTR -48[rbp], rax
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -40[rbp], rax
	lea	rdx, -48[rbp]
	lea	rcx, eb_contains[rip]
	mov	rax, QWORD PTR -8[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_contains
	mov	QWORD PTR -16[rbp], rax
	lea	rax, eb_parse_args_from3f1f1f[rip]
	mov	QWORD PTR -96[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -88[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 24
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -80[rbp], rax
	mov	rax, QWORD PTR 32[rbp]
	mov	QWORD PTR -72[rbp], rax
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -64[rbp], rax
	lea	rax, eb_parse_args_from3f1f2f[rip]
	mov	QWORD PTR -144[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -136[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 24
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -128[rbp], rax
	mov	rax, QWORD PTR 32[rbp]
	mov	QWORD PTR -120[rbp], rax
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -112[rbp], rax
	lea	r8, -144[rbp]
	lea	rdx, -96[rbp]
	lea	rcx, eb_if[rip]
	mov	rax, QWORD PTR -16[rbp]
	mov	r9, r8
	mov	r8, rdx
	mov	rdx, rax
	call	eb_if
	mov	QWORD PTR -24[rbp], rax
	mov	rax, QWORD PTR -24[rbp]
	add	rsp, 176
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_parse_args_from3f2f
	.def	eb_parse_args_from3f2f;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_parse_args_from3f2f
eb_parse_args_from3f2f:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 64
	.seh_stackalloc	64
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	QWORD PTR 24[rbp], rdx
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -8[rbp], rax
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -16[rbp], rax
	mov	rax, QWORD PTR -8[rbp]
	mov	rax, QWORD PTR [rax]
	mov	r8, rax
	mov	rdx, QWORD PTR -16[rbp]
	mov	rax, QWORD PTR -8[rbp]
	mov	rcx, rax
	call	r8
	mov	QWORD PTR -24[rbp], rax
	mov	rax, QWORD PTR -24[rbp]
	add	rsp, 64
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_parse_args_from3f
	.def	eb_parse_args_from3f;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_parse_args_from3f
eb_parse_args_from3f:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 112
	.seh_stackalloc	112
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	QWORD PTR 24[rbp], rdx
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 32
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -8[rbp], rax
	lea	rax, eb_parse_args_from3f1f[rip]
	mov	QWORD PTR -48[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 16
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -40[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 24
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -32[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 32
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -24[rbp], rax
	lea	rax, eb_parse_args_from3f2f[rip]
	mov	QWORD PTR -80[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -72[rbp], rax
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -64[rbp], rax
	lea	r8, -80[rbp]
	lea	rdx, -48[rbp]
	lea	rcx, eb_parse_word[rip]
	mov	rax, QWORD PTR -8[rbp]
	mov	r9, r8
	mov	r8, rdx
	mov	rdx, rax
	call	eb_parse_word
	mov	QWORD PTR -16[rbp], rax
	mov	rax, QWORD PTR -16[rbp]
	add	rsp, 112
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_parse_args_from
	.def	eb_parse_args_from;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_parse_args_from
eb_parse_args_from:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 176
	.seh_stackalloc	176
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	QWORD PTR 24[rbp], rdx
	mov	QWORD PTR 32[rbp], r8
	mov	QWORD PTR 40[rbp], r9
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -8[rbp], rax
	lea	rcx, eb_strip[rip]
	mov	rax, QWORD PTR -8[rbp]
	mov	rdx, rax
	call	eb_strip
	mov	QWORD PTR -16[rbp], rax
	mov	QWORD PTR -24[rbp], 40
	lea	rax, eb_parse_args_from2f[rip]
	mov	QWORD PTR -80[rbp], rax
	mov	rax, QWORD PTR 48[rbp]
	mov	QWORD PTR -72[rbp], rax
	mov	rax, QWORD PTR 40[rbp]
	mov	QWORD PTR -64[rbp], rax
	mov	rax, QWORD PTR 32[rbp]
	mov	QWORD PTR -56[rbp], rax
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -48[rbp], rax
	lea	rax, eb_parse_args_from3f[rip]
	mov	QWORD PTR -128[rbp], rax
	mov	rax, QWORD PTR 48[rbp]
	mov	QWORD PTR -120[rbp], rax
	mov	rax, QWORD PTR 40[rbp]
	mov	QWORD PTR -112[rbp], rax
	mov	rax, QWORD PTR 32[rbp]
	mov	QWORD PTR -104[rbp], rax
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -96[rbp], rax
	lea	rdx, -128[rbp]
	lea	r9, -80[rbp]
	lea	rcx, eb_parse_value[rip]
	mov	r8, QWORD PTR -24[rbp]
	mov	rax, QWORD PTR -16[rbp]
	mov	QWORD PTR 32[rsp], rdx
	mov	rdx, rax
	call	eb_parse_value
	mov	QWORD PTR -32[rbp], rax
	mov	rax, QWORD PTR -32[rbp]
	add	rsp, 176
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_parse_args2f
	.def	eb_parse_args2f;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_parse_args2f
eb_parse_args2f:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 64
	.seh_stackalloc	64
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	QWORD PTR 24[rbp], rdx
	mov	QWORD PTR 32[rbp], r8
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -8[rbp], rax
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -16[rbp], rax
	mov	rax, QWORD PTR 32[rbp]
	mov	QWORD PTR -24[rbp], rax
	mov	rax, QWORD PTR -8[rbp]
	mov	rax, QWORD PTR [rax]
	mov	r9, rax
	mov	rcx, QWORD PTR -24[rbp]
	mov	rdx, QWORD PTR -16[rbp]
	mov	rax, QWORD PTR -8[rbp]
	mov	r8, rcx
	mov	rcx, rax
	call	r9
	mov	QWORD PTR -32[rbp], rax
	mov	rax, QWORD PTR -32[rbp]
	add	rsp, 64
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_parse_args3f
	.def	eb_parse_args3f;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_parse_args3f
eb_parse_args3f:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 64
	.seh_stackalloc	64
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	QWORD PTR 24[rbp], rdx
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -8[rbp], rax
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -16[rbp], rax
	mov	rax, QWORD PTR -8[rbp]
	mov	rax, QWORD PTR [rax]
	mov	r8, rax
	mov	rdx, QWORD PTR -16[rbp]
	mov	rax, QWORD PTR -8[rbp]
	mov	rcx, rax
	call	r8
	mov	QWORD PTR -24[rbp], rax
	mov	rax, QWORD PTR -24[rbp]
	add	rsp, 64
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_parse_args
	.def	eb_parse_args;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_parse_args
eb_parse_args:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 112
	.seh_stackalloc	112
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	QWORD PTR 24[rbp], rdx
	mov	QWORD PTR 32[rbp], r8
	mov	QWORD PTR 40[rbp], r9
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -8[rbp], rax
	mov	QWORD PTR -16[rbp], 0
	lea	rax, eb_parse_args2f[rip]
	mov	QWORD PTR -48[rbp], rax
	mov	rax, QWORD PTR 32[rbp]
	mov	QWORD PTR -40[rbp], rax
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -32[rbp], rax
	lea	rax, eb_parse_args3f[rip]
	mov	QWORD PTR -64[rbp], rax
	mov	rax, QWORD PTR 40[rbp]
	mov	QWORD PTR -56[rbp], rax
	lea	rdx, -64[rbp]
	lea	r9, -48[rbp]
	lea	rcx, eb_parse_args_from[rip]
	mov	r8, QWORD PTR -16[rbp]
	mov	rax, QWORD PTR -8[rbp]
	mov	QWORD PTR 32[rsp], rdx
	mov	rdx, rax
	call	eb_parse_args_from
	mov	QWORD PTR -24[rbp], rax
	mov	rax, QWORD PTR -24[rbp]
	add	rsp, 112
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_parse_generic_args1f1f1f3f
	.def	eb_parse_generic_args1f1f1f3f;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_parse_generic_args1f1f1f3f
eb_parse_generic_args1f1f1f3f:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 64
	.seh_stackalloc	64
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	QWORD PTR 24[rbp], rdx
	mov	QWORD PTR 32[rbp], r8
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -8[rbp], rax
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -16[rbp], rax
	mov	rax, QWORD PTR 32[rbp]
	mov	QWORD PTR -24[rbp], rax
	mov	rax, QWORD PTR -8[rbp]
	mov	rax, QWORD PTR [rax]
	mov	r9, rax
	mov	rcx, QWORD PTR -24[rbp]
	mov	rdx, QWORD PTR -16[rbp]
	mov	rax, QWORD PTR -8[rbp]
	mov	r8, rcx
	mov	rcx, rax
	call	r9
	mov	QWORD PTR -32[rbp], rax
	mov	rax, QWORD PTR -32[rbp]
	add	rsp, 64
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_parse_generic_args1f1f1f4f
	.def	eb_parse_generic_args1f1f1f4f;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_parse_generic_args1f1f1f4f
eb_parse_generic_args1f1f1f4f:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 64
	.seh_stackalloc	64
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	QWORD PTR 24[rbp], rdx
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -8[rbp], rax
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -16[rbp], rax
	mov	rax, QWORD PTR -8[rbp]
	mov	rax, QWORD PTR [rax]
	mov	r8, rax
	mov	rdx, QWORD PTR -16[rbp]
	mov	rax, QWORD PTR -8[rbp]
	mov	rcx, rax
	call	r8
	mov	QWORD PTR -24[rbp], rax
	mov	rax, QWORD PTR -24[rbp]
	add	rsp, 64
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_parse_generic_args1f1f1f
	.def	eb_parse_generic_args1f1f1f;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_parse_generic_args1f1f1f
eb_parse_generic_args1f1f1f:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 160
	.seh_stackalloc	160
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	QWORD PTR 24[rbp], rdx
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 48
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -8[rbp], rax
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -16[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 24
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -24[rbp], rax
	lea	rcx, eb_cdr[rip]
	mov	rax, QWORD PTR -24[rbp]
	mov	rdx, rax
	call	eb_cdr
	mov	QWORD PTR -32[rbp], rax
	lea	rax, eb_parse_generic_args1f1f1f3f[rip]
	mov	QWORD PTR -96[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 16
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -88[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 32
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -80[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 40
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -72[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 48
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -64[rbp], rax
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -56[rbp], rax
	lea	rax, eb_parse_generic_args1f1f1f4f[rip]
	mov	QWORD PTR -112[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -104[rbp], rax
	lea	r8, -112[rbp]
	lea	rdx, -96[rbp]
	lea	rcx, eb_parse_generic_args[rip]
	mov	r9, QWORD PTR -32[rbp]
	mov	r10, QWORD PTR -16[rbp]
	mov	rax, QWORD PTR -8[rbp]
	mov	QWORD PTR 40[rsp], r8
	mov	QWORD PTR 32[rsp], rdx
	mov	r8, r10
	mov	rdx, rax
	call	eb_parse_generic_args
	mov	QWORD PTR -40[rbp], rax
	mov	rax, QWORD PTR -40[rbp]
	add	rsp, 160
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_parse_generic_args1f1f
	.def	eb_parse_generic_args1f1f;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_parse_generic_args1f1f
eb_parse_generic_args1f1f:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 176
	.seh_stackalloc	176
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	QWORD PTR 24[rbp], rdx
	mov	QWORD PTR 32[rbp], r8
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 32
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -8[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 24
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -16[rbp], rax
	lea	rcx, eb_car[rip]
	mov	rax, QWORD PTR -16[rbp]
	mov	rdx, rax
	call	eb_car
	mov	QWORD PTR -24[rbp], rax
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -32[rbp], rax
	mov	QWORD PTR -40[rbp], 0
	lea	rcx, eb_cons[rip]
	mov	rdx, QWORD PTR -40[rbp]
	mov	rax, QWORD PTR -32[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_cons
	mov	QWORD PTR -48[rbp], rax
	mov	QWORD PTR -56[rbp], 0
	lea	rcx, eb_binding_lambda[rip]
	mov	r8, QWORD PTR -56[rbp]
	mov	rdx, QWORD PTR -48[rbp]
	mov	rax, QWORD PTR -24[rbp]
	mov	r9, r8
	mov	r8, rdx
	mov	rdx, rax
	call	eb_binding_lambda
	mov	QWORD PTR -64[rbp], rax
	lea	rcx, eb_binding_table_append_generic[rip]
	mov	rdx, QWORD PTR -64[rbp]
	mov	rax, QWORD PTR -8[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_binding_table_append_generic
	mov	QWORD PTR -72[rbp], rax
	lea	rax, eb_parse_generic_args1f1f1f[rip]
	mov	QWORD PTR -144[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -136[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 16
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -128[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 24
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -120[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 32
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -112[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 40
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -104[rbp], rax
	mov	rax, QWORD PTR 32[rbp]
	mov	QWORD PTR -96[rbp], rax
	lea	rdx, -144[rbp]
	lea	rcx, eb_let[rip]
	mov	rax, QWORD PTR -72[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_let
	mov	QWORD PTR -80[rbp], rax
	mov	rax, QWORD PTR -80[rbp]
	add	rsp, 176
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_parse_generic_args1f2f
	.def	eb_parse_generic_args1f2f;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_parse_generic_args1f2f
eb_parse_generic_args1f2f:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 64
	.seh_stackalloc	64
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	QWORD PTR 24[rbp], rdx
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -8[rbp], rax
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -16[rbp], rax
	mov	rax, QWORD PTR -8[rbp]
	mov	rax, QWORD PTR [rax]
	mov	r8, rax
	mov	rdx, QWORD PTR -16[rbp]
	mov	rax, QWORD PTR -8[rbp]
	mov	rcx, rax
	call	r8
	mov	QWORD PTR -24[rbp], rax
	mov	rax, QWORD PTR -24[rbp]
	add	rsp, 64
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_parse_generic_args1f
	.def	eb_parse_generic_args1f;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_parse_generic_args1f
eb_parse_generic_args1f:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 112
	.seh_stackalloc	112
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 40
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -8[rbp], rax
	lea	rax, eb_parse_generic_args1f1f[rip]
	mov	QWORD PTR -64[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -56[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 16
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -48[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 24
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -40[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 32
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -32[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 40
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -24[rbp], rax
	lea	rax, eb_parse_generic_args1f2f[rip]
	mov	QWORD PTR -80[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -72[rbp], rax
	lea	r8, -80[rbp]
	lea	rdx, -64[rbp]
	lea	rcx, eb_parse_args[rip]
	mov	rax, QWORD PTR -8[rbp]
	mov	r9, r8
	mov	r8, rdx
	mov	rdx, rax
	call	eb_parse_args
	mov	QWORD PTR -16[rbp], rax
	mov	rax, QWORD PTR -16[rbp]
	add	rsp, 112
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_parse_generic_args2f
	.def	eb_parse_generic_args2f;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_parse_generic_args2f
eb_parse_generic_args2f:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 64
	.seh_stackalloc	64
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -8[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 24
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -16[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 16
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -24[rbp], rax
	mov	rax, QWORD PTR -8[rbp]
	mov	rax, QWORD PTR [rax]
	mov	r9, rax
	mov	rcx, QWORD PTR -24[rbp]
	mov	rdx, QWORD PTR -16[rbp]
	mov	rax, QWORD PTR -8[rbp]
	mov	r8, rcx
	mov	rcx, rax
	call	r9
	mov	QWORD PTR -32[rbp], rax
	mov	rax, QWORD PTR -32[rbp]
	add	rsp, 64
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_parse_generic_args
	.def	eb_parse_generic_args;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_parse_generic_args
eb_parse_generic_args:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	add	rsp, -128
	.seh_stackalloc	128
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	QWORD PTR 24[rbp], rdx
	mov	QWORD PTR 32[rbp], r8
	mov	QWORD PTR 40[rbp], r9
	mov	rax, QWORD PTR 40[rbp]
	mov	QWORD PTR -8[rbp], rax
	lea	rax, eb_parse_generic_args1f[rip]
	mov	QWORD PTR -64[rbp], rax
	mov	rax, QWORD PTR 56[rbp]
	mov	QWORD PTR -56[rbp], rax
	mov	rax, QWORD PTR 48[rbp]
	mov	QWORD PTR -48[rbp], rax
	mov	rax, QWORD PTR 40[rbp]
	mov	QWORD PTR -40[rbp], rax
	mov	rax, QWORD PTR 32[rbp]
	mov	QWORD PTR -32[rbp], rax
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -24[rbp], rax
	lea	rax, eb_parse_generic_args2f[rip]
	mov	QWORD PTR -96[rbp], rax
	mov	rax, QWORD PTR 48[rbp]
	mov	QWORD PTR -88[rbp], rax
	mov	rax, QWORD PTR 32[rbp]
	mov	QWORD PTR -80[rbp], rax
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -72[rbp], rax
	lea	r8, -96[rbp]
	lea	rdx, -64[rbp]
	lea	rcx, eb_if[rip]
	mov	rax, QWORD PTR -8[rbp]
	mov	r9, r8
	mov	r8, rdx
	mov	rdx, rax
	call	eb_if
	mov	QWORD PTR -16[rbp], rax
	mov	rax, QWORD PTR -16[rbp]
	sub	rsp, -128
	pop	rbp
	ret
	.seh_endproc
	.section .rdata,"dr"
.LC18:
	.ascii "unknown name\0"
	.text
	.globl	eb_parse_expr_match1f1f
	.def	eb_parse_expr_match1f1f;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_parse_expr_match1f1f
eb_parse_expr_match1f1f:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 80
	.seh_stackalloc	80
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -8[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 16
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -16[rbp], rax
	lea	rcx, eb_state_pos[rip]
	mov	rax, QWORD PTR -16[rbp]
	mov	rdx, rax
	call	eb_state_pos
	mov	QWORD PTR -24[rbp], rax
	lea	rax, .LC18[rip]
	mov	rdx, rax
	lea	rax, eb_parse_expr_match1f1f01.69[rip]
	mov	rcx, rax
	call	ebz_stol
	mov	rdx, QWORD PTR eb_parse_expr_match1f1f01.69[rip]
	lea	rcx, eb_error_from_position[rip]
	mov	rax, QWORD PTR -24[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_error_from_position
	mov	QWORD PTR -32[rbp], rax
	mov	rax, QWORD PTR -8[rbp]
	mov	rax, QWORD PTR [rax]
	mov	r8, rax
	mov	rdx, QWORD PTR -32[rbp]
	mov	rax, QWORD PTR -8[rbp]
	mov	rcx, rax
	call	r8
	mov	QWORD PTR -40[rbp], rax
	mov	rax, QWORD PTR -40[rbp]
	add	rsp, 80
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_parse_expr_match1f2f1f
	.def	eb_parse_expr_match1f2f1f;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_parse_expr_match1f2f1f
eb_parse_expr_match1f2f1f:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 80
	.seh_stackalloc	80
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -8[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 16
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -16[rbp], rax
	lea	rcx, eb_ast_name[rip]
	mov	rax, QWORD PTR -16[rbp]
	mov	rdx, rax
	call	eb_ast_name
	mov	QWORD PTR -24[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 32
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -32[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 24
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -40[rbp], rax
	mov	rax, QWORD PTR -8[rbp]
	mov	rax, QWORD PTR [rax]
	mov	r10, rax
	mov	r8, QWORD PTR -40[rbp]
	mov	rcx, QWORD PTR -32[rbp]
	mov	rdx, QWORD PTR -24[rbp]
	mov	rax, QWORD PTR -8[rbp]
	mov	r9, r8
	mov	r8, rcx
	mov	rcx, rax
	call	r10
	mov	QWORD PTR -48[rbp], rax
	mov	rax, QWORD PTR -48[rbp]
	add	rsp, 80
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_parse_expr_match1f2f2f1f
	.def	eb_parse_expr_match1f2f2f1f;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_parse_expr_match1f2f2f1f
eb_parse_expr_match1f2f2f1f:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 80
	.seh_stackalloc	80
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -8[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 16
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -16[rbp], rax
	lea	rcx, eb_ast_name[rip]
	mov	rax, QWORD PTR -16[rbp]
	mov	rdx, rax
	call	eb_ast_name
	mov	QWORD PTR -24[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 32
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -32[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 24
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -40[rbp], rax
	mov	rax, QWORD PTR -8[rbp]
	mov	rax, QWORD PTR [rax]
	mov	r10, rax
	mov	r8, QWORD PTR -40[rbp]
	mov	rcx, QWORD PTR -32[rbp]
	mov	rdx, QWORD PTR -24[rbp]
	mov	rax, QWORD PTR -8[rbp]
	mov	r9, r8
	mov	r8, rcx
	mov	rcx, rax
	call	r10
	mov	QWORD PTR -48[rbp], rax
	mov	rax, QWORD PTR -48[rbp]
	add	rsp, 80
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_parse_expr_match1f2f2f2f1f1f3f3f2f
	.def	eb_parse_expr_match1f2f2f2f1f1f3f3f2f;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_parse_expr_match1f2f2f2f1f1f3f3f2f
eb_parse_expr_match1f2f2f2f1f1f3f3f2f:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 80
	.seh_stackalloc	80
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	QWORD PTR 24[rbp], rdx
	mov	QWORD PTR 32[rbp], r8
	mov	QWORD PTR 40[rbp], r9
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 56
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -8[rbp], rax
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -16[rbp], rax
	mov	rax, QWORD PTR 32[rbp]
	mov	QWORD PTR -24[rbp], rax
	mov	rax, QWORD PTR 40[rbp]
	mov	QWORD PTR -32[rbp], rax
	mov	rax, QWORD PTR -8[rbp]
	mov	rax, QWORD PTR [rax]
	mov	r10, rax
	mov	r8, QWORD PTR -32[rbp]
	mov	rcx, QWORD PTR -24[rbp]
	mov	rdx, QWORD PTR -16[rbp]
	mov	rax, QWORD PTR -8[rbp]
	mov	r9, r8
	mov	r8, rcx
	mov	rcx, rax
	call	r10
	mov	QWORD PTR -40[rbp], rax
	mov	rax, QWORD PTR -40[rbp]
	add	rsp, 80
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_parse_expr_match1f2f2f2f1f1f3f3f3f
	.def	eb_parse_expr_match1f2f2f2f1f1f3f3f3f;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_parse_expr_match1f2f2f2f1f1f3f3f3f
eb_parse_expr_match1f2f2f2f1f1f3f3f3f:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 64
	.seh_stackalloc	64
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	QWORD PTR 24[rbp], rdx
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 16
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -8[rbp], rax
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -16[rbp], rax
	mov	rax, QWORD PTR -8[rbp]
	mov	rax, QWORD PTR [rax]
	mov	r8, rax
	mov	rdx, QWORD PTR -16[rbp]
	mov	rax, QWORD PTR -8[rbp]
	mov	rcx, rax
	call	r8
	mov	QWORD PTR -24[rbp], rax
	mov	rax, QWORD PTR -24[rbp]
	add	rsp, 64
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_parse_expr_match1f2f2f2f1f1f3f3f
	.def	eb_parse_expr_match1f2f2f2f1f1f3f3f;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_parse_expr_match1f2f2f2f1f1f3f3f
eb_parse_expr_match1f2f2f2f1f1f3f3f:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 192
	.seh_stackalloc	192
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	QWORD PTR 24[rbp], rdx
	mov	QWORD PTR 32[rbp], r8
	mov	QWORD PTR 40[rbp], r9
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 24
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -8[rbp], rax
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -16[rbp], rax
	mov	rax, QWORD PTR 32[rbp]
	mov	QWORD PTR -24[rbp], rax
	lea	rax, eb_parse_expr_match1f2f2f2f1f1f3f3f2f[rip]
	mov	QWORD PTR -112[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 16
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -104[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 32
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -96[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 40
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -88[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 48
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -80[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 56
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -72[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 64
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -64[rbp], rax
	mov	rax, QWORD PTR 40[rbp]
	mov	QWORD PTR -56[rbp], rax
	mov	rax, QWORD PTR 32[rbp]
	mov	QWORD PTR -48[rbp], rax
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -40[rbp], rax
	lea	rax, eb_parse_expr_match1f2f2f2f1f1f3f3f3f[rip]
	mov	QWORD PTR -144[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -136[rbp], rax
	mov	rax, QWORD PTR 48[rbp]
	mov	QWORD PTR -128[rbp], rax
	mov	rax, QWORD PTR -8[rbp]
	mov	rax, QWORD PTR [rax]
	mov	r10, rax
	lea	rcx, -144[rbp]
	lea	r9, -112[rbp]
	mov	r8, QWORD PTR -24[rbp]
	mov	rdx, QWORD PTR -16[rbp]
	mov	rax, QWORD PTR -8[rbp]
	mov	QWORD PTR 32[rsp], rcx
	mov	rcx, rax
	call	r10
	mov	QWORD PTR -32[rbp], rax
	mov	rax, QWORD PTR -32[rbp]
	add	rsp, 192
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_parse_expr_match1f2f2f2f1f1f3f4f
	.def	eb_parse_expr_match1f2f2f2f1f1f3f4f;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_parse_expr_match1f2f2f2f1f1f3f4f
eb_parse_expr_match1f2f2f2f1f1f3f4f:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 112
	.seh_stackalloc	112
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	QWORD PTR 24[rbp], rdx
	mov	QWORD PTR 32[rbp], r8
	mov	QWORD PTR 40[rbp], r9
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -8[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 40
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -16[rbp], rax
	lea	rcx, eb_ast_name[rip]
	mov	rax, QWORD PTR -16[rbp]
	mov	rdx, rax
	call	eb_ast_name
	mov	QWORD PTR -24[rbp], rax
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -32[rbp], rax
	lea	rcx, eb_cons[rip]
	mov	rdx, QWORD PTR -32[rbp]
	mov	rax, QWORD PTR -24[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_cons
	mov	QWORD PTR -40[rbp], rax
	lea	rcx, eb_ast_call[rip]
	mov	rax, QWORD PTR -40[rbp]
	mov	rdx, rax
	call	eb_ast_call
	mov	QWORD PTR -48[rbp], rax
	mov	rax, QWORD PTR 32[rbp]
	mov	QWORD PTR -56[rbp], rax
	mov	rax, QWORD PTR 40[rbp]
	mov	QWORD PTR -64[rbp], rax
	mov	rax, QWORD PTR -8[rbp]
	mov	rax, QWORD PTR [rax]
	mov	r10, rax
	mov	r8, QWORD PTR -64[rbp]
	mov	rcx, QWORD PTR -56[rbp]
	mov	rdx, QWORD PTR -48[rbp]
	mov	rax, QWORD PTR -8[rbp]
	mov	r9, r8
	mov	r8, rcx
	mov	rcx, rax
	call	r10
	mov	QWORD PTR -72[rbp], rax
	mov	rax, QWORD PTR -72[rbp]
	add	rsp, 112
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_parse_expr_match1f2f2f2f1f1f3f5f
	.def	eb_parse_expr_match1f2f2f2f1f1f3f5f;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_parse_expr_match1f2f2f2f1f1f3f5f
eb_parse_expr_match1f2f2f2f1f1f3f5f:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 64
	.seh_stackalloc	64
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	QWORD PTR 24[rbp], rdx
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -8[rbp], rax
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -16[rbp], rax
	mov	rax, QWORD PTR -8[rbp]
	mov	rax, QWORD PTR [rax]
	mov	r8, rax
	mov	rdx, QWORD PTR -16[rbp]
	mov	rax, QWORD PTR -8[rbp]
	mov	rcx, rax
	call	r8
	mov	QWORD PTR -24[rbp], rax
	mov	rax, QWORD PTR -24[rbp]
	add	rsp, 64
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_parse_expr_match1f2f2f2f1f1f3f
	.def	eb_parse_expr_match1f2f2f2f1f1f3f;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_parse_expr_match1f2f2f2f1f1f3f
eb_parse_expr_match1f2f2f2f1f1f3f:
	push	rbp
	.seh_pushreg	rbp
	push	rbx
	.seh_pushreg	rbx
	sub	rsp, 280
	.seh_stackalloc	280
	lea	rbp, 128[rsp]
	.seh_setframe	rbp, 128
	.seh_endprologue
	mov	QWORD PTR 176[rbp], rcx
	mov	QWORD PTR 184[rbp], rdx
	mov	QWORD PTR 192[rbp], r8
	mov	rax, QWORD PTR 176[rbp]
	add	rax, 32
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR 136[rbp], rax
	mov	rax, QWORD PTR 184[rbp]
	mov	QWORD PTR 128[rbp], rax
	mov	rax, QWORD PTR 192[rbp]
	mov	QWORD PTR 120[rbp], rax
	mov	rax, QWORD PTR 176[rbp]
	add	rax, 64
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR 112[rbp], rax
	lea	rcx, eb_get_binding_args[rip]
	mov	rax, QWORD PTR 112[rbp]
	mov	rdx, rax
	call	eb_get_binding_args
	mov	QWORD PTR 104[rbp], rax
	lea	rax, eb_parse_expr_match1f2f2f2f1f1f3f3f[rip]
	mov	QWORD PTR 16[rbp], rax
	mov	rax, QWORD PTR 176[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR 24[rbp], rax
	mov	rax, QWORD PTR 176[rbp]
	add	rax, 16
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR 32[rbp], rax
	mov	rax, QWORD PTR 176[rbp]
	add	rax, 24
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR 40[rbp], rax
	mov	rax, QWORD PTR 176[rbp]
	add	rax, 40
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR 48[rbp], rax
	mov	rax, QWORD PTR 176[rbp]
	add	rax, 48
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR 56[rbp], rax
	mov	rax, QWORD PTR 176[rbp]
	add	rax, 56
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR 64[rbp], rax
	mov	rax, QWORD PTR 192[rbp]
	mov	QWORD PTR 72[rbp], rax
	mov	rax, QWORD PTR 184[rbp]
	mov	QWORD PTR 80[rbp], rax
	lea	rax, eb_parse_expr_match1f2f2f2f1f1f3f4f[rip]
	mov	QWORD PTR -48[rbp], rax
	mov	rax, QWORD PTR 176[rbp]
	add	rax, 16
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -40[rbp], rax
	mov	rax, QWORD PTR 176[rbp]
	add	rax, 40
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -32[rbp], rax
	mov	rax, QWORD PTR 176[rbp]
	add	rax, 48
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -24[rbp], rax
	mov	rax, QWORD PTR 176[rbp]
	add	rax, 56
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -16[rbp], rax
	mov	rax, QWORD PTR 176[rbp]
	add	rax, 72
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -8[rbp], rax
	mov	rax, QWORD PTR 192[rbp]
	mov	QWORD PTR 0[rbp], rax
	mov	rax, QWORD PTR 184[rbp]
	mov	QWORD PTR 8[rbp], rax
	lea	rax, eb_parse_expr_match1f2f2f2f1f1f3f5f[rip]
	mov	QWORD PTR -64[rbp], rax
	mov	rax, QWORD PTR 176[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -56[rbp], rax
	mov	rax, QWORD PTR 136[rbp]
	mov	rax, QWORD PTR [rax]
	mov	rbx, rax
	lea	r9, -64[rbp]
	lea	r8, -48[rbp]
	lea	rcx, 16[rbp]
	mov	r11, QWORD PTR 104[rbp]
	mov	r10, QWORD PTR 120[rbp]
	mov	rdx, QWORD PTR 128[rbp]
	mov	rax, QWORD PTR 136[rbp]
	mov	QWORD PTR 48[rsp], r9
	mov	QWORD PTR 40[rsp], r8
	mov	QWORD PTR 32[rsp], rcx
	mov	r9, r11
	mov	r8, r10
	mov	rcx, rax
	call	rbx
	mov	QWORD PTR 96[rbp], rax
	mov	rax, QWORD PTR 96[rbp]
	add	rsp, 280
	pop	rbx
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_parse_expr_match1f2f2f2f1f1f4f
	.def	eb_parse_expr_match1f2f2f2f1f1f4f;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_parse_expr_match1f2f2f2f1f1f4f
eb_parse_expr_match1f2f2f2f1f1f4f:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 64
	.seh_stackalloc	64
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	QWORD PTR 24[rbp], rdx
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -8[rbp], rax
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -16[rbp], rax
	mov	rax, QWORD PTR -8[rbp]
	mov	rax, QWORD PTR [rax]
	mov	r8, rax
	mov	rdx, QWORD PTR -16[rbp]
	mov	rax, QWORD PTR -8[rbp]
	mov	rcx, rax
	call	r8
	mov	QWORD PTR -24[rbp], rax
	mov	rax, QWORD PTR -24[rbp]
	add	rsp, 64
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_parse_expr_match1f2f2f2f1f1f
	.def	eb_parse_expr_match1f2f2f2f1f1f;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_parse_expr_match1f2f2f2f1f1f
eb_parse_expr_match1f2f2f2f1f1f:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 192
	.seh_stackalloc	192
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	QWORD PTR 24[rbp], rdx
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 56
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -8[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 48
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -16[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 64
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -24[rbp], rax
	lea	rcx, eb_get_binding_generics[rip]
	mov	rax, QWORD PTR -24[rbp]
	mov	rdx, rax
	call	eb_get_binding_generics
	mov	QWORD PTR -32[rbp], rax
	lea	rax, eb_parse_expr_match1f2f2f2f1f1f3f[rip]
	mov	QWORD PTR -128[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -120[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 16
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -112[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 24
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -104[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 32
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -96[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 40
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -88[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 48
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -80[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 56
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -72[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 64
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -64[rbp], rax
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -56[rbp], rax
	lea	rax, eb_parse_expr_match1f2f2f2f1f1f4f[rip]
	mov	QWORD PTR -144[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -136[rbp], rax
	lea	r8, -144[rbp]
	lea	rdx, -128[rbp]
	lea	rcx, eb_parse_generic_args[rip]
	mov	r9, QWORD PTR -32[rbp]
	mov	r10, QWORD PTR -16[rbp]
	mov	rax, QWORD PTR -8[rbp]
	mov	QWORD PTR 40[rsp], r8
	mov	QWORD PTR 32[rsp], rdx
	mov	r8, r10
	mov	rdx, rax
	call	eb_parse_generic_args
	mov	QWORD PTR -40[rbp], rax
	mov	rax, QWORD PTR -40[rbp]
	add	rsp, 192
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_parse_expr_match1f2f2f2f1f
	.def	eb_parse_expr_match1f2f2f2f1f;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_parse_expr_match1f2f2f2f1f
eb_parse_expr_match1f2f2f2f1f:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	add	rsp, -128
	.seh_stackalloc	128
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 40
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -8[rbp], rax
	lea	rax, eb_parse_expr_match1f2f2f2f1f1f[rip]
	mov	QWORD PTR -96[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -88[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 16
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -80[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 24
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -72[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 32
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -64[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 40
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -56[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 48
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -48[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 56
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -40[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 64
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -32[rbp], rax
	lea	rdx, -96[rbp]
	lea	rcx, eb_let[rip]
	mov	rax, QWORD PTR -8[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_let
	mov	QWORD PTR -16[rbp], rax
	mov	rax, QWORD PTR -16[rbp]
	sub	rsp, -128
	pop	rbp
	ret
	.seh_endproc
	.section .rdata,"dr"
.LC19:
	.ascii "binding can not be understood\0"
	.text
	.globl	eb_parse_expr_match1f2f2f2f2f
	.def	eb_parse_expr_match1f2f2f2f2f;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_parse_expr_match1f2f2f2f2f
eb_parse_expr_match1f2f2f2f2f:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 80
	.seh_stackalloc	80
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -8[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 16
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -16[rbp], rax
	lea	rcx, eb_state_pos[rip]
	mov	rax, QWORD PTR -16[rbp]
	mov	rdx, rax
	call	eb_state_pos
	mov	QWORD PTR -24[rbp], rax
	lea	rax, .LC19[rip]
	mov	rdx, rax
	lea	rax, eb_parse_expr_match1f2f2f2f2f01.68[rip]
	mov	rcx, rax
	call	ebz_stol
	mov	rdx, QWORD PTR eb_parse_expr_match1f2f2f2f2f01.68[rip]
	lea	rcx, eb_error_from_position[rip]
	mov	rax, QWORD PTR -24[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_error_from_position
	mov	QWORD PTR -32[rbp], rax
	mov	rax, QWORD PTR -8[rbp]
	mov	rax, QWORD PTR [rax]
	mov	r8, rax
	mov	rdx, QWORD PTR -32[rbp]
	mov	rax, QWORD PTR -8[rbp]
	mov	rcx, rax
	call	r8
	mov	QWORD PTR -40[rbp], rax
	mov	rax, QWORD PTR -40[rbp]
	add	rsp, 80
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_parse_expr_match1f2f2f2f
	.def	eb_parse_expr_match1f2f2f2f;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_parse_expr_match1f2f2f2f
eb_parse_expr_match1f2f2f2f:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 160
	.seh_stackalloc	160
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 64
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -8[rbp], rax
	lea	rcx, eb_binding_is_lambda[rip]
	mov	rax, QWORD PTR -8[rbp]
	mov	rdx, rax
	call	eb_binding_is_lambda
	mov	QWORD PTR -16[rbp], rax
	lea	rax, eb_parse_expr_match1f2f2f2f1f[rip]
	mov	QWORD PTR -96[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -88[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 16
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -80[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 24
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -72[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 32
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -64[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 40
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -56[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 48
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -48[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 56
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -40[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 64
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -32[rbp], rax
	lea	rax, eb_parse_expr_match1f2f2f2f2f[rip]
	mov	QWORD PTR -128[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -120[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 56
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -112[rbp], rax
	lea	r8, -128[rbp]
	lea	rdx, -96[rbp]
	lea	rcx, eb_if[rip]
	mov	rax, QWORD PTR -16[rbp]
	mov	r9, r8
	mov	r8, rdx
	mov	rdx, rax
	call	eb_if
	mov	QWORD PTR -24[rbp], rax
	mov	rax, QWORD PTR -24[rbp]
	add	rsp, 160
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_parse_expr_match1f2f2f
	.def	eb_parse_expr_match1f2f2f;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_parse_expr_match1f2f2f
eb_parse_expr_match1f2f2f:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 176
	.seh_stackalloc	176
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 64
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -8[rbp], rax
	lea	rcx, eb_binding_is_value[rip]
	mov	rax, QWORD PTR -8[rbp]
	mov	rdx, rax
	call	eb_binding_is_value
	mov	QWORD PTR -16[rbp], rax
	lea	rax, eb_parse_expr_match1f2f2f1f[rip]
	mov	QWORD PTR -64[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 16
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -56[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 40
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -48[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 48
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -40[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 56
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -32[rbp], rax
	lea	rax, eb_parse_expr_match1f2f2f2f[rip]
	mov	QWORD PTR -144[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -136[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 16
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -128[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 24
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -120[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 32
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -112[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 40
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -104[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 48
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -96[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 56
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -88[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 64
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -80[rbp], rax
	lea	r8, -144[rbp]
	lea	rdx, -64[rbp]
	lea	rcx, eb_if[rip]
	mov	rax, QWORD PTR -16[rbp]
	mov	r9, r8
	mov	r8, rdx
	mov	rdx, rax
	call	eb_if
	mov	QWORD PTR -24[rbp], rax
	mov	rax, QWORD PTR -24[rbp]
	add	rsp, 176
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_parse_expr_match1f2f
	.def	eb_parse_expr_match1f2f;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_parse_expr_match1f2f
eb_parse_expr_match1f2f:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 176
	.seh_stackalloc	176
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 64
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -8[rbp], rax
	lea	rcx, eb_binding_is_generic[rip]
	mov	rax, QWORD PTR -8[rbp]
	mov	rdx, rax
	call	eb_binding_is_generic
	mov	QWORD PTR -16[rbp], rax
	lea	rax, eb_parse_expr_match1f2f1f[rip]
	mov	QWORD PTR -64[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 16
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -56[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 40
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -48[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 48
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -40[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 56
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -32[rbp], rax
	lea	rax, eb_parse_expr_match1f2f2f[rip]
	mov	QWORD PTR -144[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -136[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 16
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -128[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 24
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -120[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 32
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -112[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 40
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -104[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 48
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -96[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 56
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -88[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 64
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -80[rbp], rax
	lea	r8, -144[rbp]
	lea	rdx, -64[rbp]
	lea	rcx, eb_if[rip]
	mov	rax, QWORD PTR -16[rbp]
	mov	r9, r8
	mov	r8, rdx
	mov	rdx, rax
	call	eb_if
	mov	QWORD PTR -24[rbp], rax
	mov	rax, QWORD PTR -24[rbp]
	add	rsp, 176
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_parse_expr_match1f
	.def	eb_parse_expr_match1f;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_parse_expr_match1f
eb_parse_expr_match1f:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 160
	.seh_stackalloc	160
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	QWORD PTR 24[rbp], rdx
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -8[rbp], rax
	lea	rcx, eb_not[rip]
	mov	rax, QWORD PTR -8[rbp]
	mov	rdx, rax
	call	eb_not
	mov	QWORD PTR -16[rbp], rax
	lea	rax, eb_parse_expr_match1f1f[rip]
	mov	QWORD PTR -48[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -40[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 56
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -32[rbp], rax
	lea	rax, eb_parse_expr_match1f2f[rip]
	mov	QWORD PTR -128[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -120[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 16
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -112[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 24
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -104[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 32
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -96[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 40
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -88[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 48
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -80[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 56
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -72[rbp], rax
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -64[rbp], rax
	lea	r8, -128[rbp]
	lea	rdx, -48[rbp]
	lea	rcx, eb_if[rip]
	mov	rax, QWORD PTR -16[rbp]
	mov	r9, r8
	mov	r8, rdx
	mov	rdx, rax
	call	eb_if
	mov	QWORD PTR -24[rbp], rax
	mov	rax, QWORD PTR -24[rbp]
	add	rsp, 160
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_parse_expr_match
	.def	eb_parse_expr_match;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_parse_expr_match
eb_parse_expr_match:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	add	rsp, -128
	.seh_stackalloc	128
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	QWORD PTR 24[rbp], rdx
	mov	QWORD PTR 32[rbp], r8
	mov	QWORD PTR 40[rbp], r9
	mov	rax, QWORD PTR 32[rbp]
	mov	QWORD PTR -8[rbp], rax
	mov	rax, QWORD PTR 40[rbp]
	mov	QWORD PTR -16[rbp], rax
	lea	rcx, eb_binding_table_lookup[rip]
	mov	rdx, QWORD PTR -16[rbp]
	mov	rax, QWORD PTR -8[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_binding_table_lookup
	mov	QWORD PTR -24[rbp], rax
	lea	rax, eb_parse_expr_match1f[rip]
	mov	QWORD PTR -96[rbp], rax
	mov	rax, QWORD PTR 72[rbp]
	mov	QWORD PTR -88[rbp], rax
	mov	rax, QWORD PTR 64[rbp]
	mov	QWORD PTR -80[rbp], rax
	mov	rax, QWORD PTR 56[rbp]
	mov	QWORD PTR -72[rbp], rax
	mov	rax, QWORD PTR 48[rbp]
	mov	QWORD PTR -64[rbp], rax
	mov	rax, QWORD PTR 40[rbp]
	mov	QWORD PTR -56[rbp], rax
	mov	rax, QWORD PTR 32[rbp]
	mov	QWORD PTR -48[rbp], rax
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -40[rbp], rax
	lea	rdx, -96[rbp]
	lea	rcx, eb_let[rip]
	mov	rax, QWORD PTR -24[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_let
	mov	QWORD PTR -32[rbp], rax
	mov	rax, QWORD PTR -32[rbp]
	sub	rsp, -128
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_parse_call1f1f1f1f1f1f1f3f2f
	.def	eb_parse_call1f1f1f1f1f1f1f3f2f;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_parse_call1f1f1f1f1f1f1f3f2f
eb_parse_call1f1f1f1f1f1f1f3f2f:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 80
	.seh_stackalloc	80
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	QWORD PTR 24[rbp], rdx
	mov	QWORD PTR 32[rbp], r8
	mov	QWORD PTR 40[rbp], r9
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 40
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -8[rbp], rax
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -16[rbp], rax
	mov	rax, QWORD PTR 32[rbp]
	mov	QWORD PTR -24[rbp], rax
	mov	rax, QWORD PTR 40[rbp]
	mov	QWORD PTR -32[rbp], rax
	mov	rax, QWORD PTR -8[rbp]
	mov	rax, QWORD PTR [rax]
	mov	r10, rax
	mov	r8, QWORD PTR -32[rbp]
	mov	rcx, QWORD PTR -24[rbp]
	mov	rdx, QWORD PTR -16[rbp]
	mov	rax, QWORD PTR -8[rbp]
	mov	r9, r8
	mov	r8, rcx
	mov	rcx, rax
	call	r10
	mov	QWORD PTR -40[rbp], rax
	mov	rax, QWORD PTR -40[rbp]
	add	rsp, 80
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_parse_call1f1f1f1f1f1f1f3f3f
	.def	eb_parse_call1f1f1f1f1f1f1f3f3f;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_parse_call1f1f1f1f1f1f1f3f3f
eb_parse_call1f1f1f1f1f1f1f3f3f:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 64
	.seh_stackalloc	64
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	QWORD PTR 24[rbp], rdx
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 16
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -8[rbp], rax
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -16[rbp], rax
	mov	rax, QWORD PTR -8[rbp]
	mov	rax, QWORD PTR [rax]
	mov	r8, rax
	mov	rdx, QWORD PTR -16[rbp]
	mov	rax, QWORD PTR -8[rbp]
	mov	rcx, rax
	call	r8
	mov	QWORD PTR -24[rbp], rax
	mov	rax, QWORD PTR -24[rbp]
	add	rsp, 64
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_parse_call1f1f1f1f1f1f1f3f
	.def	eb_parse_call1f1f1f1f1f1f1f3f;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_parse_call1f1f1f1f1f1f1f3f
eb_parse_call1f1f1f1f1f1f1f3f:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 176
	.seh_stackalloc	176
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	QWORD PTR 24[rbp], rdx
	mov	QWORD PTR 32[rbp], r8
	mov	QWORD PTR 40[rbp], r9
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 24
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -8[rbp], rax
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -16[rbp], rax
	mov	rax, QWORD PTR 32[rbp]
	mov	QWORD PTR -24[rbp], rax
	lea	rax, eb_parse_call1f1f1f1f1f1f1f3f2f[rip]
	mov	QWORD PTR -96[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 16
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -88[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 32
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -80[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 40
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -72[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 48
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -64[rbp], rax
	mov	rax, QWORD PTR 40[rbp]
	mov	QWORD PTR -56[rbp], rax
	mov	rax, QWORD PTR 32[rbp]
	mov	QWORD PTR -48[rbp], rax
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -40[rbp], rax
	lea	rax, eb_parse_call1f1f1f1f1f1f1f3f3f[rip]
	mov	QWORD PTR -128[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -120[rbp], rax
	mov	rax, QWORD PTR 48[rbp]
	mov	QWORD PTR -112[rbp], rax
	mov	rax, QWORD PTR -8[rbp]
	mov	rax, QWORD PTR [rax]
	mov	r10, rax
	lea	rcx, -128[rbp]
	lea	r9, -96[rbp]
	mov	r8, QWORD PTR -24[rbp]
	mov	rdx, QWORD PTR -16[rbp]
	mov	rax, QWORD PTR -8[rbp]
	mov	QWORD PTR 32[rsp], rcx
	mov	rcx, rax
	call	r10
	mov	QWORD PTR -32[rbp], rax
	mov	rax, QWORD PTR -32[rbp]
	add	rsp, 176
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_parse_call1f1f1f1f1f1f1f4f
	.def	eb_parse_call1f1f1f1f1f1f1f4f;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_parse_call1f1f1f1f1f1f1f4f
eb_parse_call1f1f1f1f1f1f1f4f:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 80
	.seh_stackalloc	80
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	QWORD PTR 24[rbp], rdx
	mov	QWORD PTR 32[rbp], r8
	mov	QWORD PTR 40[rbp], r9
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -8[rbp], rax
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -16[rbp], rax
	mov	rax, QWORD PTR 32[rbp]
	mov	QWORD PTR -24[rbp], rax
	mov	rax, QWORD PTR 40[rbp]
	mov	QWORD PTR -32[rbp], rax
	mov	rax, QWORD PTR -8[rbp]
	mov	rax, QWORD PTR [rax]
	mov	r10, rax
	mov	r8, QWORD PTR -32[rbp]
	mov	rcx, QWORD PTR -24[rbp]
	mov	rdx, QWORD PTR -16[rbp]
	mov	rax, QWORD PTR -8[rbp]
	mov	r9, r8
	mov	r8, rcx
	mov	rcx, rax
	call	r10
	mov	QWORD PTR -40[rbp], rax
	mov	rax, QWORD PTR -40[rbp]
	add	rsp, 80
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_parse_call1f1f1f1f1f1f1f5f
	.def	eb_parse_call1f1f1f1f1f1f1f5f;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_parse_call1f1f1f1f1f1f1f5f
eb_parse_call1f1f1f1f1f1f1f5f:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 64
	.seh_stackalloc	64
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	QWORD PTR 24[rbp], rdx
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -8[rbp], rax
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -16[rbp], rax
	mov	rax, QWORD PTR -8[rbp]
	mov	rax, QWORD PTR [rax]
	mov	r8, rax
	mov	rdx, QWORD PTR -16[rbp]
	mov	rax, QWORD PTR -8[rbp]
	mov	rcx, rax
	call	r8
	mov	QWORD PTR -24[rbp], rax
	mov	rax, QWORD PTR -24[rbp]
	add	rsp, 64
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_parse_call1f1f1f1f1f1f1f
	.def	eb_parse_call1f1f1f1f1f1f1f;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_parse_call1f1f1f1f1f1f1f
eb_parse_call1f1f1f1f1f1f1f:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 240
	.seh_stackalloc	240
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	QWORD PTR 24[rbp], rdx
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 48
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -8[rbp], rax
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -16[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 56
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -24[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 32
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -32[rbp], rax
	lea	rcx, eb_cdr[rip]
	mov	rax, QWORD PTR -32[rbp]
	mov	rdx, rax
	call	eb_cdr
	mov	QWORD PTR -40[rbp], rax
	lea	rcx, eb_cons[rip]
	mov	rdx, QWORD PTR -40[rbp]
	mov	rax, QWORD PTR -24[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_cons
	mov	QWORD PTR -48[rbp], rax
	lea	rax, eb_parse_call1f1f1f1f1f1f1f3f[rip]
	mov	QWORD PTR -112[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -104[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 16
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -96[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 24
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -88[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 40
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -80[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 48
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -72[rbp], rax
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -64[rbp], rax
	lea	rax, eb_parse_call1f1f1f1f1f1f1f4f[rip]
	mov	QWORD PTR -160[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 16
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -152[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 40
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -144[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 48
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -136[rbp], rax
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -128[rbp], rax
	lea	rax, eb_parse_call1f1f1f1f1f1f1f5f[rip]
	mov	QWORD PTR -176[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -168[rbp], rax
	lea	r9, -176[rbp]
	lea	r8, -160[rbp]
	lea	rdx, -112[rbp]
	lea	rcx, eb_parse_call[rip]
	mov	r11, QWORD PTR -48[rbp]
	mov	r10, QWORD PTR -16[rbp]
	mov	rax, QWORD PTR -8[rbp]
	mov	QWORD PTR 48[rsp], r9
	mov	QWORD PTR 40[rsp], r8
	mov	QWORD PTR 32[rsp], rdx
	mov	r9, r11
	mov	r8, r10
	mov	rdx, rax
	call	eb_parse_call
	mov	QWORD PTR -56[rbp], rax
	mov	rax, QWORD PTR -56[rbp]
	add	rsp, 240
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_parse_call1f1f1f1f1f1f
	.def	eb_parse_call1f1f1f1f1f1f;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_parse_call1f1f1f1f1f1f
eb_parse_call1f1f1f1f1f1f:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	add	rsp, -128
	.seh_stackalloc	128
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	QWORD PTR 24[rbp], rdx
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 40
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -8[rbp], rax
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -16[rbp], rax
	lea	rcx, eb_binding_table_append[rip]
	mov	rdx, QWORD PTR -16[rbp]
	mov	rax, QWORD PTR -8[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_binding_table_append
	mov	QWORD PTR -24[rbp], rax
	lea	rax, eb_parse_call1f1f1f1f1f1f1f[rip]
	mov	QWORD PTR -96[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -88[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 16
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -80[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 24
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -72[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 32
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -64[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 40
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -56[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 48
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -48[rbp], rax
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -40[rbp], rax
	lea	rdx, -96[rbp]
	lea	rcx, eb_let[rip]
	mov	rax, QWORD PTR -24[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_let
	mov	QWORD PTR -32[rbp], rax
	mov	rax, QWORD PTR -32[rbp]
	sub	rsp, -128
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_parse_call1f1f1f1f1f
	.def	eb_parse_call1f1f1f1f1f;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_parse_call1f1f1f1f1f
eb_parse_call1f1f1f1f1f:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	add	rsp, -128
	.seh_stackalloc	128
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 56
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -8[rbp], rax
	lea	rcx, eb_get_binding_args[rip]
	mov	rax, QWORD PTR -8[rbp]
	mov	rdx, rax
	call	eb_get_binding_args
	mov	QWORD PTR -16[rbp], rax
	lea	rcx, eb_car[rip]
	mov	rax, QWORD PTR -16[rbp]
	mov	rdx, rax
	call	eb_car
	mov	QWORD PTR -24[rbp], rax
	lea	rax, eb_parse_call1f1f1f1f1f1f[rip]
	mov	QWORD PTR -96[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -88[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 16
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -80[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 24
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -72[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 32
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -64[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 40
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -56[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 48
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -48[rbp], rax
	lea	rdx, -96[rbp]
	lea	rcx, eb_let[rip]
	mov	rax, QWORD PTR -24[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_let
	mov	QWORD PTR -32[rbp], rax
	mov	rax, QWORD PTR -32[rbp]
	sub	rsp, -128
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_parse_call1f1f1f1f2f2f1f3f2f
	.def	eb_parse_call1f1f1f1f2f2f1f3f2f;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_parse_call1f1f1f1f2f2f1f3f2f
eb_parse_call1f1f1f1f2f2f1f3f2f:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 80
	.seh_stackalloc	80
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	QWORD PTR 24[rbp], rdx
	mov	QWORD PTR 32[rbp], r8
	mov	QWORD PTR 40[rbp], r9
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 56
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -8[rbp], rax
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -16[rbp], rax
	mov	rax, QWORD PTR 32[rbp]
	mov	QWORD PTR -24[rbp], rax
	mov	rax, QWORD PTR 40[rbp]
	mov	QWORD PTR -32[rbp], rax
	mov	rax, QWORD PTR -8[rbp]
	mov	rax, QWORD PTR [rax]
	mov	r10, rax
	mov	r8, QWORD PTR -32[rbp]
	mov	rcx, QWORD PTR -24[rbp]
	mov	rdx, QWORD PTR -16[rbp]
	mov	rax, QWORD PTR -8[rbp]
	mov	r9, r8
	mov	r8, rcx
	mov	rcx, rax
	call	r10
	mov	QWORD PTR -40[rbp], rax
	mov	rax, QWORD PTR -40[rbp]
	add	rsp, 80
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_parse_call1f1f1f1f2f2f1f3f3f
	.def	eb_parse_call1f1f1f1f2f2f1f3f3f;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_parse_call1f1f1f1f2f2f1f3f3f
eb_parse_call1f1f1f1f2f2f1f3f3f:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 64
	.seh_stackalloc	64
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	QWORD PTR 24[rbp], rdx
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 16
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -8[rbp], rax
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -16[rbp], rax
	mov	rax, QWORD PTR -8[rbp]
	mov	rax, QWORD PTR [rax]
	mov	r8, rax
	mov	rdx, QWORD PTR -16[rbp]
	mov	rax, QWORD PTR -8[rbp]
	mov	rcx, rax
	call	r8
	mov	QWORD PTR -24[rbp], rax
	mov	rax, QWORD PTR -24[rbp]
	add	rsp, 64
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_parse_call1f1f1f1f2f2f1f3f
	.def	eb_parse_call1f1f1f1f2f2f1f3f;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_parse_call1f1f1f1f2f2f1f3f
eb_parse_call1f1f1f1f2f2f1f3f:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 192
	.seh_stackalloc	192
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	QWORD PTR 24[rbp], rdx
	mov	QWORD PTR 32[rbp], r8
	mov	QWORD PTR 40[rbp], r9
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 24
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -8[rbp], rax
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -16[rbp], rax
	mov	rax, QWORD PTR 32[rbp]
	mov	QWORD PTR -24[rbp], rax
	lea	rax, eb_parse_call1f1f1f1f2f2f1f3f2f[rip]
	mov	QWORD PTR -112[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 16
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -104[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 32
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -96[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 40
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -88[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 48
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -80[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 56
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -72[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 64
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -64[rbp], rax
	mov	rax, QWORD PTR 40[rbp]
	mov	QWORD PTR -56[rbp], rax
	mov	rax, QWORD PTR 32[rbp]
	mov	QWORD PTR -48[rbp], rax
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -40[rbp], rax
	lea	rax, eb_parse_call1f1f1f1f2f2f1f3f3f[rip]
	mov	QWORD PTR -144[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -136[rbp], rax
	mov	rax, QWORD PTR 48[rbp]
	mov	QWORD PTR -128[rbp], rax
	mov	rax, QWORD PTR -8[rbp]
	mov	rax, QWORD PTR [rax]
	mov	r10, rax
	lea	rcx, -144[rbp]
	lea	r9, -112[rbp]
	mov	r8, QWORD PTR -24[rbp]
	mov	rdx, QWORD PTR -16[rbp]
	mov	rax, QWORD PTR -8[rbp]
	mov	QWORD PTR 32[rsp], rcx
	mov	rcx, rax
	call	r10
	mov	QWORD PTR -32[rbp], rax
	mov	rax, QWORD PTR -32[rbp]
	add	rsp, 192
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_parse_call1f1f1f1f2f2f1f4f
	.def	eb_parse_call1f1f1f1f2f2f1f4f;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_parse_call1f1f1f1f2f2f1f4f
eb_parse_call1f1f1f1f2f2f1f4f:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 96
	.seh_stackalloc	96
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	QWORD PTR 24[rbp], rdx
	mov	QWORD PTR 32[rbp], r8
	mov	QWORD PTR 40[rbp], r9
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -8[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 56
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -16[rbp], rax
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -24[rbp], rax
	lea	rcx, eb_cons[rip]
	mov	rdx, QWORD PTR -24[rbp]
	mov	rax, QWORD PTR -16[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_cons
	mov	QWORD PTR -32[rbp], rax
	mov	rax, QWORD PTR 32[rbp]
	mov	QWORD PTR -40[rbp], rax
	mov	rax, QWORD PTR 40[rbp]
	mov	QWORD PTR -48[rbp], rax
	mov	rax, QWORD PTR -8[rbp]
	mov	rax, QWORD PTR [rax]
	mov	r10, rax
	mov	r8, QWORD PTR -48[rbp]
	mov	rcx, QWORD PTR -40[rbp]
	mov	rdx, QWORD PTR -32[rbp]
	mov	rax, QWORD PTR -8[rbp]
	mov	r9, r8
	mov	r8, rcx
	mov	rcx, rax
	call	r10
	mov	QWORD PTR -56[rbp], rax
	mov	rax, QWORD PTR -56[rbp]
	add	rsp, 96
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_parse_call1f1f1f1f2f2f1f5f
	.def	eb_parse_call1f1f1f1f2f2f1f5f;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_parse_call1f1f1f1f2f2f1f5f
eb_parse_call1f1f1f1f2f2f1f5f:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 64
	.seh_stackalloc	64
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	QWORD PTR 24[rbp], rdx
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -8[rbp], rax
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -16[rbp], rax
	mov	rax, QWORD PTR -8[rbp]
	mov	rax, QWORD PTR [rax]
	mov	r8, rax
	mov	rdx, QWORD PTR -16[rbp]
	mov	rax, QWORD PTR -8[rbp]
	mov	rcx, rax
	call	r8
	mov	QWORD PTR -24[rbp], rax
	mov	rax, QWORD PTR -24[rbp]
	add	rsp, 64
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_parse_call1f1f1f1f2f2f1f
	.def	eb_parse_call1f1f1f1f2f2f1f;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_parse_call1f1f1f1f2f2f1f
eb_parse_call1f1f1f1f2f2f1f:
	push	rbp
	.seh_pushreg	rbp
	sub	rsp, 256
	.seh_stackalloc	256
	lea	rbp, 128[rsp]
	.seh_setframe	rbp, 128
	.seh_endprologue
	mov	QWORD PTR 144[rbp], rcx
	mov	QWORD PTR 152[rbp], rdx
	mov	rax, QWORD PTR 144[rbp]
	add	rax, 64
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR 120[rbp], rax
	mov	rax, QWORD PTR 144[rbp]
	add	rax, 56
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR 112[rbp], rax
	mov	rax, QWORD PTR 144[rbp]
	add	rax, 32
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR 104[rbp], rax
	lea	rcx, eb_cdr[rip]
	mov	rax, QWORD PTR 104[rbp]
	mov	rdx, rax
	call	eb_cdr
	mov	QWORD PTR 96[rbp], rax
	lea	rax, eb_parse_call1f1f1f1f2f2f1f3f[rip]
	mov	QWORD PTR 16[rbp], rax
	mov	rax, QWORD PTR 144[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR 24[rbp], rax
	mov	rax, QWORD PTR 144[rbp]
	add	rax, 16
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR 32[rbp], rax
	mov	rax, QWORD PTR 144[rbp]
	add	rax, 24
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR 40[rbp], rax
	mov	rax, QWORD PTR 144[rbp]
	add	rax, 40
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR 48[rbp], rax
	mov	rax, QWORD PTR 144[rbp]
	add	rax, 48
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR 56[rbp], rax
	mov	rax, QWORD PTR 144[rbp]
	add	rax, 56
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR 64[rbp], rax
	mov	rax, QWORD PTR 144[rbp]
	add	rax, 64
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR 72[rbp], rax
	mov	rax, QWORD PTR 144[rbp]
	add	rax, 72
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR 80[rbp], rax
	lea	rax, eb_parse_call1f1f1f1f2f2f1f4f[rip]
	mov	QWORD PTR -48[rbp], rax
	mov	rax, QWORD PTR 144[rbp]
	add	rax, 16
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -40[rbp], rax
	mov	rax, QWORD PTR 144[rbp]
	add	rax, 40
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -32[rbp], rax
	mov	rax, QWORD PTR 144[rbp]
	add	rax, 48
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -24[rbp], rax
	mov	rax, QWORD PTR 144[rbp]
	add	rax, 56
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -16[rbp], rax
	mov	rax, QWORD PTR 144[rbp]
	add	rax, 64
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -8[rbp], rax
	mov	rax, QWORD PTR 144[rbp]
	add	rax, 72
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR 0[rbp], rax
	mov	rax, QWORD PTR 152[rbp]
	mov	QWORD PTR 8[rbp], rax
	lea	rax, eb_parse_call1f1f1f1f2f2f1f5f[rip]
	mov	QWORD PTR -64[rbp], rax
	mov	rax, QWORD PTR 144[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -56[rbp], rax
	lea	r9, -64[rbp]
	lea	r8, -48[rbp]
	lea	rdx, 16[rbp]
	lea	rcx, eb_parse_call[rip]
	mov	r11, QWORD PTR 96[rbp]
	mov	r10, QWORD PTR 112[rbp]
	mov	rax, QWORD PTR 120[rbp]
	mov	QWORD PTR 48[rsp], r9
	mov	QWORD PTR 40[rsp], r8
	mov	QWORD PTR 32[rsp], rdx
	mov	r9, r11
	mov	r8, r10
	mov	rdx, rax
	call	eb_parse_call
	mov	QWORD PTR 88[rbp], rax
	mov	rax, QWORD PTR 88[rbp]
	add	rsp, 256
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_parse_call1f1f1f1f2f2f
	.def	eb_parse_call1f1f1f1f2f2f;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_parse_call1f1f1f1f2f2f
eb_parse_call1f1f1f1f2f2f:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	add	rsp, -128
	.seh_stackalloc	128
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	QWORD PTR 24[rbp], rdx
	mov	QWORD PTR 32[rbp], r8
	mov	QWORD PTR 40[rbp], r9
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -8[rbp], rax
	lea	rax, eb_parse_call1f1f1f1f2f2f1f[rip]
	mov	QWORD PTR -96[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -88[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 16
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -80[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 24
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -72[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 32
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -64[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 40
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -56[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 48
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -48[rbp], rax
	mov	rax, QWORD PTR 40[rbp]
	mov	QWORD PTR -40[rbp], rax
	mov	rax, QWORD PTR 32[rbp]
	mov	QWORD PTR -32[rbp], rax
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -24[rbp], rax
	lea	rdx, -96[rbp]
	lea	rcx, eb_let[rip]
	mov	rax, QWORD PTR -8[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_let
	mov	QWORD PTR -16[rbp], rax
	mov	rax, QWORD PTR -16[rbp]
	sub	rsp, -128
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_parse_call1f1f1f1f2f3f
	.def	eb_parse_call1f1f1f1f2f3f;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_parse_call1f1f1f1f2f3f
eb_parse_call1f1f1f1f2f3f:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 64
	.seh_stackalloc	64
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	QWORD PTR 24[rbp], rdx
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -8[rbp], rax
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -16[rbp], rax
	mov	rax, QWORD PTR -8[rbp]
	mov	rax, QWORD PTR [rax]
	mov	r8, rax
	mov	rdx, QWORD PTR -16[rbp]
	mov	rax, QWORD PTR -8[rbp]
	mov	rcx, rax
	call	r8
	mov	QWORD PTR -24[rbp], rax
	mov	rax, QWORD PTR -24[rbp]
	add	rsp, 64
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_parse_call1f1f1f1f2f
	.def	eb_parse_call1f1f1f1f2f;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_parse_call1f1f1f1f2f
eb_parse_call1f1f1f1f2f:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 160
	.seh_stackalloc	160
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 24
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -8[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 48
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -16[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 40
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -24[rbp], rax
	lea	rax, eb_parse_call1f1f1f1f2f2f[rip]
	mov	QWORD PTR -96[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -88[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 16
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -80[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 24
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -72[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 32
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -64[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 40
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -56[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 48
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -48[rbp], rax
	lea	rax, eb_parse_call1f1f1f1f2f3f[rip]
	mov	QWORD PTR -112[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -104[rbp], rax
	mov	rax, QWORD PTR -8[rbp]
	mov	rax, QWORD PTR [rax]
	mov	r10, rax
	lea	rcx, -112[rbp]
	lea	r9, -96[rbp]
	mov	r8, QWORD PTR -24[rbp]
	mov	rdx, QWORD PTR -16[rbp]
	mov	rax, QWORD PTR -8[rbp]
	mov	QWORD PTR 32[rsp], rcx
	mov	rcx, rax
	call	r10
	mov	QWORD PTR -32[rbp], rax
	mov	rax, QWORD PTR -32[rbp]
	add	rsp, 160
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_parse_call1f1f1f1f
	.def	eb_parse_call1f1f1f1f;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_parse_call1f1f1f1f
eb_parse_call1f1f1f1f:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 176
	.seh_stackalloc	176
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	QWORD PTR 24[rbp], rdx
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -8[rbp], rax
	lea	rax, eb_parse_call1f1f1f1f1f[rip]
	mov	QWORD PTR -80[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -72[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 16
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -64[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 24
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -56[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 32
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -48[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 40
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -40[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 48
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -32[rbp], rax
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -24[rbp], rax
	lea	rax, eb_parse_call1f1f1f1f2f[rip]
	mov	QWORD PTR -144[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -136[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 16
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -128[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 24
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -120[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 32
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -112[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 40
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -104[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 48
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -96[rbp], rax
	lea	r8, -144[rbp]
	lea	rdx, -80[rbp]
	lea	rcx, eb_if[rip]
	mov	rax, QWORD PTR -8[rbp]
	mov	r9, r8
	mov	r8, rdx
	mov	rdx, rax
	call	eb_if
	mov	QWORD PTR -16[rbp], rax
	mov	rax, QWORD PTR -16[rbp]
	add	rsp, 176
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_parse_call1f1f1f
	.def	eb_parse_call1f1f1f;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_parse_call1f1f1f
eb_parse_call1f1f1f:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	add	rsp, -128
	.seh_stackalloc	128
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 40
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -8[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 56
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -16[rbp], rax
	lea	rcx, eb_get_binding_value[rip]
	mov	rax, QWORD PTR -16[rbp]
	mov	rdx, rax
	call	eb_get_binding_value
	mov	QWORD PTR -24[rbp], rax
	lea	rcx, eb_binding_table_lookup_generic[rip]
	mov	rdx, QWORD PTR -24[rbp]
	mov	rax, QWORD PTR -8[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_binding_table_lookup_generic
	mov	QWORD PTR -32[rbp], rax
	lea	rax, eb_parse_call1f1f1f1f[rip]
	mov	QWORD PTR -96[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -88[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 16
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -80[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 24
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -72[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 32
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -64[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 40
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -56[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 48
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -48[rbp], rax
	lea	rdx, -96[rbp]
	lea	rcx, eb_let[rip]
	mov	rax, QWORD PTR -32[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_let
	mov	QWORD PTR -40[rbp], rax
	mov	rax, QWORD PTR -40[rbp]
	sub	rsp, -128
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_parse_call1f1f2f1f2f1f3f2f
	.def	eb_parse_call1f1f2f1f2f1f3f2f;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_parse_call1f1f2f1f2f1f3f2f
eb_parse_call1f1f2f1f2f1f3f2f:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 80
	.seh_stackalloc	80
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	QWORD PTR 24[rbp], rdx
	mov	QWORD PTR 32[rbp], r8
	mov	QWORD PTR 40[rbp], r9
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 56
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -8[rbp], rax
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -16[rbp], rax
	mov	rax, QWORD PTR 32[rbp]
	mov	QWORD PTR -24[rbp], rax
	mov	rax, QWORD PTR 40[rbp]
	mov	QWORD PTR -32[rbp], rax
	mov	rax, QWORD PTR -8[rbp]
	mov	rax, QWORD PTR [rax]
	mov	r10, rax
	mov	r8, QWORD PTR -32[rbp]
	mov	rcx, QWORD PTR -24[rbp]
	mov	rdx, QWORD PTR -16[rbp]
	mov	rax, QWORD PTR -8[rbp]
	mov	r9, r8
	mov	r8, rcx
	mov	rcx, rax
	call	r10
	mov	QWORD PTR -40[rbp], rax
	mov	rax, QWORD PTR -40[rbp]
	add	rsp, 80
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_parse_call1f1f2f1f2f1f3f3f
	.def	eb_parse_call1f1f2f1f2f1f3f3f;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_parse_call1f1f2f1f2f1f3f3f
eb_parse_call1f1f2f1f2f1f3f3f:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 64
	.seh_stackalloc	64
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	QWORD PTR 24[rbp], rdx
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 16
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -8[rbp], rax
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -16[rbp], rax
	mov	rax, QWORD PTR -8[rbp]
	mov	rax, QWORD PTR [rax]
	mov	r8, rax
	mov	rdx, QWORD PTR -16[rbp]
	mov	rax, QWORD PTR -8[rbp]
	mov	rcx, rax
	call	r8
	mov	QWORD PTR -24[rbp], rax
	mov	rax, QWORD PTR -24[rbp]
	add	rsp, 64
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_parse_call1f1f2f1f2f1f3f
	.def	eb_parse_call1f1f2f1f2f1f3f;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_parse_call1f1f2f1f2f1f3f
eb_parse_call1f1f2f1f2f1f3f:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 192
	.seh_stackalloc	192
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	QWORD PTR 24[rbp], rdx
	mov	QWORD PTR 32[rbp], r8
	mov	QWORD PTR 40[rbp], r9
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 24
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -8[rbp], rax
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -16[rbp], rax
	mov	rax, QWORD PTR 32[rbp]
	mov	QWORD PTR -24[rbp], rax
	lea	rax, eb_parse_call1f1f2f1f2f1f3f2f[rip]
	mov	QWORD PTR -112[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 16
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -104[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 32
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -96[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 40
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -88[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 48
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -80[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 56
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -72[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 64
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -64[rbp], rax
	mov	rax, QWORD PTR 40[rbp]
	mov	QWORD PTR -56[rbp], rax
	mov	rax, QWORD PTR 32[rbp]
	mov	QWORD PTR -48[rbp], rax
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -40[rbp], rax
	lea	rax, eb_parse_call1f1f2f1f2f1f3f3f[rip]
	mov	QWORD PTR -144[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -136[rbp], rax
	mov	rax, QWORD PTR 48[rbp]
	mov	QWORD PTR -128[rbp], rax
	mov	rax, QWORD PTR -8[rbp]
	mov	rax, QWORD PTR [rax]
	mov	r10, rax
	lea	rcx, -144[rbp]
	lea	r9, -112[rbp]
	mov	r8, QWORD PTR -24[rbp]
	mov	rdx, QWORD PTR -16[rbp]
	mov	rax, QWORD PTR -8[rbp]
	mov	QWORD PTR 32[rsp], rcx
	mov	rcx, rax
	call	r10
	mov	QWORD PTR -32[rbp], rax
	mov	rax, QWORD PTR -32[rbp]
	add	rsp, 192
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_parse_call1f1f2f1f2f1f4f
	.def	eb_parse_call1f1f2f1f2f1f4f;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_parse_call1f1f2f1f2f1f4f
eb_parse_call1f1f2f1f2f1f4f:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 96
	.seh_stackalloc	96
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	QWORD PTR 24[rbp], rdx
	mov	QWORD PTR 32[rbp], r8
	mov	QWORD PTR 40[rbp], r9
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -8[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 56
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -16[rbp], rax
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -24[rbp], rax
	lea	rcx, eb_cons[rip]
	mov	rdx, QWORD PTR -24[rbp]
	mov	rax, QWORD PTR -16[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_cons
	mov	QWORD PTR -32[rbp], rax
	mov	rax, QWORD PTR 32[rbp]
	mov	QWORD PTR -40[rbp], rax
	mov	rax, QWORD PTR 40[rbp]
	mov	QWORD PTR -48[rbp], rax
	mov	rax, QWORD PTR -8[rbp]
	mov	rax, QWORD PTR [rax]
	mov	r10, rax
	mov	r8, QWORD PTR -48[rbp]
	mov	rcx, QWORD PTR -40[rbp]
	mov	rdx, QWORD PTR -32[rbp]
	mov	rax, QWORD PTR -8[rbp]
	mov	r9, r8
	mov	r8, rcx
	mov	rcx, rax
	call	r10
	mov	QWORD PTR -56[rbp], rax
	mov	rax, QWORD PTR -56[rbp]
	add	rsp, 96
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_parse_call1f1f2f1f2f1f5f
	.def	eb_parse_call1f1f2f1f2f1f5f;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_parse_call1f1f2f1f2f1f5f
eb_parse_call1f1f2f1f2f1f5f:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 64
	.seh_stackalloc	64
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	QWORD PTR 24[rbp], rdx
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -8[rbp], rax
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -16[rbp], rax
	mov	rax, QWORD PTR -8[rbp]
	mov	rax, QWORD PTR [rax]
	mov	r8, rax
	mov	rdx, QWORD PTR -16[rbp]
	mov	rax, QWORD PTR -8[rbp]
	mov	rcx, rax
	call	r8
	mov	QWORD PTR -24[rbp], rax
	mov	rax, QWORD PTR -24[rbp]
	add	rsp, 64
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_parse_call1f1f2f1f2f1f
	.def	eb_parse_call1f1f2f1f2f1f;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_parse_call1f1f2f1f2f1f
eb_parse_call1f1f2f1f2f1f:
	push	rbp
	.seh_pushreg	rbp
	sub	rsp, 256
	.seh_stackalloc	256
	lea	rbp, 128[rsp]
	.seh_setframe	rbp, 128
	.seh_endprologue
	mov	QWORD PTR 144[rbp], rcx
	mov	QWORD PTR 152[rbp], rdx
	mov	rax, QWORD PTR 144[rbp]
	add	rax, 64
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR 120[rbp], rax
	mov	rax, QWORD PTR 144[rbp]
	add	rax, 56
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR 112[rbp], rax
	mov	rax, QWORD PTR 144[rbp]
	add	rax, 32
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR 104[rbp], rax
	lea	rcx, eb_cdr[rip]
	mov	rax, QWORD PTR 104[rbp]
	mov	rdx, rax
	call	eb_cdr
	mov	QWORD PTR 96[rbp], rax
	lea	rax, eb_parse_call1f1f2f1f2f1f3f[rip]
	mov	QWORD PTR 16[rbp], rax
	mov	rax, QWORD PTR 144[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR 24[rbp], rax
	mov	rax, QWORD PTR 144[rbp]
	add	rax, 16
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR 32[rbp], rax
	mov	rax, QWORD PTR 144[rbp]
	add	rax, 24
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR 40[rbp], rax
	mov	rax, QWORD PTR 144[rbp]
	add	rax, 40
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR 48[rbp], rax
	mov	rax, QWORD PTR 144[rbp]
	add	rax, 48
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR 56[rbp], rax
	mov	rax, QWORD PTR 144[rbp]
	add	rax, 56
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR 64[rbp], rax
	mov	rax, QWORD PTR 144[rbp]
	add	rax, 64
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR 72[rbp], rax
	mov	rax, QWORD PTR 144[rbp]
	add	rax, 72
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR 80[rbp], rax
	lea	rax, eb_parse_call1f1f2f1f2f1f4f[rip]
	mov	QWORD PTR -48[rbp], rax
	mov	rax, QWORD PTR 144[rbp]
	add	rax, 16
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -40[rbp], rax
	mov	rax, QWORD PTR 144[rbp]
	add	rax, 40
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -32[rbp], rax
	mov	rax, QWORD PTR 144[rbp]
	add	rax, 48
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -24[rbp], rax
	mov	rax, QWORD PTR 144[rbp]
	add	rax, 56
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -16[rbp], rax
	mov	rax, QWORD PTR 144[rbp]
	add	rax, 64
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -8[rbp], rax
	mov	rax, QWORD PTR 144[rbp]
	add	rax, 72
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR 0[rbp], rax
	mov	rax, QWORD PTR 152[rbp]
	mov	QWORD PTR 8[rbp], rax
	lea	rax, eb_parse_call1f1f2f1f2f1f5f[rip]
	mov	QWORD PTR -64[rbp], rax
	mov	rax, QWORD PTR 144[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -56[rbp], rax
	lea	r9, -64[rbp]
	lea	r8, -48[rbp]
	lea	rdx, 16[rbp]
	lea	rcx, eb_parse_call[rip]
	mov	r11, QWORD PTR 96[rbp]
	mov	r10, QWORD PTR 112[rbp]
	mov	rax, QWORD PTR 120[rbp]
	mov	QWORD PTR 48[rsp], r9
	mov	QWORD PTR 40[rsp], r8
	mov	QWORD PTR 32[rsp], rdx
	mov	r9, r11
	mov	r8, r10
	mov	rdx, rax
	call	eb_parse_call
	mov	QWORD PTR 88[rbp], rax
	mov	rax, QWORD PTR 88[rbp]
	add	rsp, 256
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_parse_call1f1f2f1f2f
	.def	eb_parse_call1f1f2f1f2f;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_parse_call1f1f2f1f2f
eb_parse_call1f1f2f1f2f:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	add	rsp, -128
	.seh_stackalloc	128
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	QWORD PTR 24[rbp], rdx
	mov	QWORD PTR 32[rbp], r8
	mov	QWORD PTR 40[rbp], r9
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -8[rbp], rax
	lea	rax, eb_parse_call1f1f2f1f2f1f[rip]
	mov	QWORD PTR -96[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -88[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 16
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -80[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 24
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -72[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 32
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -64[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 40
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -56[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 48
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -48[rbp], rax
	mov	rax, QWORD PTR 40[rbp]
	mov	QWORD PTR -40[rbp], rax
	mov	rax, QWORD PTR 32[rbp]
	mov	QWORD PTR -32[rbp], rax
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -24[rbp], rax
	lea	rdx, -96[rbp]
	lea	rcx, eb_let[rip]
	mov	rax, QWORD PTR -8[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_let
	mov	QWORD PTR -16[rbp], rax
	mov	rax, QWORD PTR -16[rbp]
	sub	rsp, -128
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_parse_call1f1f2f1f3f
	.def	eb_parse_call1f1f2f1f3f;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_parse_call1f1f2f1f3f
eb_parse_call1f1f2f1f3f:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 64
	.seh_stackalloc	64
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	QWORD PTR 24[rbp], rdx
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -8[rbp], rax
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -16[rbp], rax
	mov	rax, QWORD PTR -8[rbp]
	mov	rax, QWORD PTR [rax]
	mov	r8, rax
	mov	rdx, QWORD PTR -16[rbp]
	mov	rax, QWORD PTR -8[rbp]
	mov	rcx, rax
	call	r8
	mov	QWORD PTR -24[rbp], rax
	mov	rax, QWORD PTR -24[rbp]
	add	rsp, 64
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_parse_call1f1f2f1f
	.def	eb_parse_call1f1f2f1f;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_parse_call1f1f2f1f
eb_parse_call1f1f2f1f:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 160
	.seh_stackalloc	160
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 24
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -8[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 48
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -16[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 40
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -24[rbp], rax
	lea	rax, eb_parse_call1f1f2f1f2f[rip]
	mov	QWORD PTR -96[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -88[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 16
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -80[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 24
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -72[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 32
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -64[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 40
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -56[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 48
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -48[rbp], rax
	lea	rax, eb_parse_call1f1f2f1f3f[rip]
	mov	QWORD PTR -112[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -104[rbp], rax
	mov	rax, QWORD PTR -8[rbp]
	mov	rax, QWORD PTR [rax]
	mov	r10, rax
	lea	rcx, -112[rbp]
	lea	r9, -96[rbp]
	mov	r8, QWORD PTR -24[rbp]
	mov	rdx, QWORD PTR -16[rbp]
	mov	rax, QWORD PTR -8[rbp]
	mov	QWORD PTR 32[rsp], rcx
	mov	rcx, rax
	call	r10
	mov	QWORD PTR -32[rbp], rax
	mov	rax, QWORD PTR -32[rbp]
	add	rsp, 160
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_parse_call1f1f2f2f1f02f
	.def	eb_parse_call1f1f2f2f1f02f;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_parse_call1f1f2f2f1f02f
eb_parse_call1f1f2f2f1f02f:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 64
	.seh_stackalloc	64
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	QWORD PTR 24[rbp], rdx
	mov	QWORD PTR 32[rbp], r8
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -8[rbp], rax
	mov	rax, QWORD PTR 32[rbp]
	mov	QWORD PTR -16[rbp], rax
	lea	rcx, eb_binding_table_append[rip]
	mov	rdx, QWORD PTR -16[rbp]
	mov	rax, QWORD PTR -8[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_binding_table_append
	mov	QWORD PTR -24[rbp], rax
	mov	rax, QWORD PTR -24[rbp]
	add	rsp, 64
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_parse_call1f1f2f2f1f1f2f001f01f1f
	.def	eb_parse_call1f1f2f2f1f1f2f001f01f1f;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_parse_call1f1f2f2f1f1f2f001f01f1f
eb_parse_call1f1f2f2f1f1f2f001f01f1f:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 64
	.seh_stackalloc	64
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	QWORD PTR 24[rbp], rdx
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -8[rbp], rax
	lea	rcx, eb_get_binding_args[rip]
	mov	rax, QWORD PTR -8[rbp]
	mov	rdx, rax
	call	eb_get_binding_args
	mov	QWORD PTR -16[rbp], rax
	lea	rcx, eb_car[rip]
	mov	rax, QWORD PTR -16[rbp]
	mov	rdx, rax
	call	eb_car
	mov	QWORD PTR -24[rbp], rax
	lea	rcx, eb_get_binding_value[rip]
	mov	rax, QWORD PTR -24[rbp]
	mov	rdx, rax
	call	eb_get_binding_value
	mov	QWORD PTR -32[rbp], rax
	mov	rax, QWORD PTR -32[rbp]
	add	rsp, 64
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_parse_call1f1f2f2f1f1f2f001f01f
	.def	eb_parse_call1f1f2f2f1f1f2f001f01f;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_parse_call1f1f2f2f1f1f2f001f01f
eb_parse_call1f1f2f2f1f1f2f001f01f:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 80
	.seh_stackalloc	80
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 24
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -8[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 32
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -16[rbp], rax
	lea	rcx, eb_get_binding_value[rip]
	mov	rax, QWORD PTR -16[rbp]
	mov	rdx, rax
	call	eb_get_binding_value
	mov	QWORD PTR -24[rbp], rax
	lea	rcx, eb_binding_table_lookup_generic[rip]
	mov	rdx, QWORD PTR -24[rbp]
	mov	rax, QWORD PTR -8[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_binding_table_lookup_generic
	mov	QWORD PTR -32[rbp], rax
	lea	rax, eb_parse_call1f1f2f2f1f1f2f001f01f1f[rip]
	mov	QWORD PTR -48[rbp], rax
	lea	rdx, -48[rbp]
	lea	rcx, eb_let[rip]
	mov	rax, QWORD PTR -32[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_let
	mov	QWORD PTR -40[rbp], rax
	mov	rax, QWORD PTR -40[rbp]
	add	rsp, 80
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_parse_call1f1f2f2f1f1f2f001f02f
	.def	eb_parse_call1f1f2f2f1f1f2f001f02f;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_parse_call1f1f2f2f1f1f2f001f02f
eb_parse_call1f1f2f2f1f1f2f001f02f:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 48
	.seh_stackalloc	48
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -8[rbp], rax
	lea	rcx, eb_get_binding_value[rip]
	mov	rax, QWORD PTR -8[rbp]
	mov	rdx, rax
	call	eb_get_binding_value
	mov	QWORD PTR -16[rbp], rax
	mov	rax, QWORD PTR -16[rbp]
	add	rsp, 48
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_parse_call1f1f2f2f1f1f2f001f
	.def	eb_parse_call1f1f2f2f1f1f2f001f;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_parse_call1f1f2f2f1f1f2f001f
eb_parse_call1f1f2f2f1f1f2f001f:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	add	rsp, -128
	.seh_stackalloc	128
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	QWORD PTR 24[rbp], rdx
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -8[rbp], rax
	lea	rcx, eb_binding_is_generic[rip]
	mov	rax, QWORD PTR -8[rbp]
	mov	rdx, rax
	call	eb_binding_is_generic
	mov	QWORD PTR -16[rbp], rax
	lea	rax, eb_parse_call1f1f2f2f1f1f2f001f01f[rip]
	mov	QWORD PTR -80[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -72[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 16
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -64[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 24
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -56[rbp], rax
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -48[rbp], rax
	lea	rax, eb_parse_call1f1f2f2f1f1f2f001f02f[rip]
	mov	QWORD PTR -96[rbp], rax
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -88[rbp], rax
	lea	r8, -96[rbp]
	lea	rdx, -80[rbp]
	lea	rcx, eb_if[rip]
	mov	rax, QWORD PTR -16[rbp]
	mov	r9, r8
	mov	r8, rdx
	mov	rdx, rax
	call	eb_if
	mov	QWORD PTR -24[rbp], rax
	lea	rcx, eb_ast_name[rip]
	mov	rax, QWORD PTR -24[rbp]
	mov	rdx, rax
	call	eb_ast_name
	mov	QWORD PTR -32[rbp], rax
	mov	rax, QWORD PTR -32[rbp]
	sub	rsp, -128
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_parse_call1f1f2f2f1f1f2f1f3f2f
	.def	eb_parse_call1f1f2f2f1f1f2f1f3f2f;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_parse_call1f1f2f2f1f1f2f1f3f2f
eb_parse_call1f1f2f2f1f1f2f1f3f2f:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 80
	.seh_stackalloc	80
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	QWORD PTR 24[rbp], rdx
	mov	QWORD PTR 32[rbp], r8
	mov	QWORD PTR 40[rbp], r9
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 64
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -8[rbp], rax
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -16[rbp], rax
	mov	rax, QWORD PTR 32[rbp]
	mov	QWORD PTR -24[rbp], rax
	mov	rax, QWORD PTR 40[rbp]
	mov	QWORD PTR -32[rbp], rax
	mov	rax, QWORD PTR -8[rbp]
	mov	rax, QWORD PTR [rax]
	mov	r10, rax
	mov	r8, QWORD PTR -32[rbp]
	mov	rcx, QWORD PTR -24[rbp]
	mov	rdx, QWORD PTR -16[rbp]
	mov	rax, QWORD PTR -8[rbp]
	mov	r9, r8
	mov	r8, rcx
	mov	rcx, rax
	call	r10
	mov	QWORD PTR -40[rbp], rax
	mov	rax, QWORD PTR -40[rbp]
	add	rsp, 80
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_parse_call1f1f2f2f1f1f2f1f3f3f
	.def	eb_parse_call1f1f2f2f1f1f2f1f3f3f;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_parse_call1f1f2f2f1f1f2f1f3f3f
eb_parse_call1f1f2f2f1f1f2f1f3f3f:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 64
	.seh_stackalloc	64
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	QWORD PTR 24[rbp], rdx
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 16
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -8[rbp], rax
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -16[rbp], rax
	mov	rax, QWORD PTR -8[rbp]
	mov	rax, QWORD PTR [rax]
	mov	r8, rax
	mov	rdx, QWORD PTR -16[rbp]
	mov	rax, QWORD PTR -8[rbp]
	mov	rcx, rax
	call	r8
	mov	QWORD PTR -24[rbp], rax
	mov	rax, QWORD PTR -24[rbp]
	add	rsp, 64
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_parse_call1f1f2f2f1f1f2f1f3f
	.def	eb_parse_call1f1f2f2f1f1f2f1f3f;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_parse_call1f1f2f2f1f1f2f1f3f
eb_parse_call1f1f2f2f1f1f2f1f3f:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 208
	.seh_stackalloc	208
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	QWORD PTR 24[rbp], rdx
	mov	QWORD PTR 32[rbp], r8
	mov	QWORD PTR 40[rbp], r9
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 24
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -8[rbp], rax
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -16[rbp], rax
	mov	rax, QWORD PTR 32[rbp]
	mov	QWORD PTR -24[rbp], rax
	lea	rax, eb_parse_call1f1f2f2f1f1f2f1f3f2f[rip]
	mov	QWORD PTR -128[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 16
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -120[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 32
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -112[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 40
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -104[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 48
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -96[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 56
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -88[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 64
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -80[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 72
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -72[rbp], rax
	mov	rax, QWORD PTR 40[rbp]
	mov	QWORD PTR -64[rbp], rax
	mov	rax, QWORD PTR 32[rbp]
	mov	QWORD PTR -56[rbp], rax
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -48[rbp], rax
	lea	rax, eb_parse_call1f1f2f2f1f1f2f1f3f3f[rip]
	mov	QWORD PTR -160[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -152[rbp], rax
	mov	rax, QWORD PTR 48[rbp]
	mov	QWORD PTR -144[rbp], rax
	mov	rax, QWORD PTR -8[rbp]
	mov	rax, QWORD PTR [rax]
	mov	r10, rax
	lea	rcx, -160[rbp]
	lea	r9, -128[rbp]
	mov	r8, QWORD PTR -24[rbp]
	mov	rdx, QWORD PTR -16[rbp]
	mov	rax, QWORD PTR -8[rbp]
	mov	QWORD PTR 32[rsp], rcx
	mov	rcx, rax
	call	r10
	mov	QWORD PTR -32[rbp], rax
	mov	rax, QWORD PTR -32[rbp]
	add	rsp, 208
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_parse_call1f1f2f2f1f1f2f1f4f
	.def	eb_parse_call1f1f2f2f1f1f2f1f4f;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_parse_call1f1f2f2f1f1f2f1f4f
eb_parse_call1f1f2f2f1f1f2f1f4f:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 96
	.seh_stackalloc	96
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	QWORD PTR 24[rbp], rdx
	mov	QWORD PTR 32[rbp], r8
	mov	QWORD PTR 40[rbp], r9
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -8[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 64
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -16[rbp], rax
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -24[rbp], rax
	lea	rcx, eb_cons[rip]
	mov	rdx, QWORD PTR -24[rbp]
	mov	rax, QWORD PTR -16[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_cons
	mov	QWORD PTR -32[rbp], rax
	mov	rax, QWORD PTR 32[rbp]
	mov	QWORD PTR -40[rbp], rax
	mov	rax, QWORD PTR 40[rbp]
	mov	QWORD PTR -48[rbp], rax
	mov	rax, QWORD PTR -8[rbp]
	mov	rax, QWORD PTR [rax]
	mov	r10, rax
	mov	r8, QWORD PTR -48[rbp]
	mov	rcx, QWORD PTR -40[rbp]
	mov	rdx, QWORD PTR -32[rbp]
	mov	rax, QWORD PTR -8[rbp]
	mov	r9, r8
	mov	r8, rcx
	mov	rcx, rax
	call	r10
	mov	QWORD PTR -56[rbp], rax
	mov	rax, QWORD PTR -56[rbp]
	add	rsp, 96
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_parse_call1f1f2f2f1f1f2f1f5f
	.def	eb_parse_call1f1f2f2f1f1f2f1f5f;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_parse_call1f1f2f2f1f1f2f1f5f
eb_parse_call1f1f2f2f1f1f2f1f5f:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 64
	.seh_stackalloc	64
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	QWORD PTR 24[rbp], rdx
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -8[rbp], rax
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -16[rbp], rax
	mov	rax, QWORD PTR -8[rbp]
	mov	rax, QWORD PTR [rax]
	mov	r8, rax
	mov	rdx, QWORD PTR -16[rbp]
	mov	rax, QWORD PTR -8[rbp]
	mov	rcx, rax
	call	r8
	mov	QWORD PTR -24[rbp], rax
	mov	rax, QWORD PTR -24[rbp]
	add	rsp, 64
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_parse_call1f1f2f2f1f1f2f1f
	.def	eb_parse_call1f1f2f2f1f1f2f1f;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_parse_call1f1f2f2f1f1f2f1f
eb_parse_call1f1f2f2f1f1f2f1f:
	push	rbp
	.seh_pushreg	rbp
	sub	rsp, 288
	.seh_stackalloc	288
	lea	rbp, 128[rsp]
	.seh_setframe	rbp, 128
	.seh_endprologue
	mov	QWORD PTR 176[rbp], rcx
	mov	QWORD PTR 184[rbp], rdx
	mov	rax, QWORD PTR 176[rbp]
	add	rax, 72
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR 152[rbp], rax
	mov	rax, QWORD PTR 176[rbp]
	add	rax, 64
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR 144[rbp], rax
	mov	rax, QWORD PTR 176[rbp]
	add	rax, 32
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR 136[rbp], rax
	lea	rcx, eb_cdr[rip]
	mov	rax, QWORD PTR 136[rbp]
	mov	rdx, rax
	call	eb_cdr
	mov	QWORD PTR 128[rbp], rax
	lea	rax, eb_parse_call1f1f2f2f1f1f2f1f3f[rip]
	mov	QWORD PTR 32[rbp], rax
	mov	rax, QWORD PTR 176[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR 40[rbp], rax
	mov	rax, QWORD PTR 176[rbp]
	add	rax, 16
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR 48[rbp], rax
	mov	rax, QWORD PTR 176[rbp]
	add	rax, 24
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR 56[rbp], rax
	mov	rax, QWORD PTR 176[rbp]
	add	rax, 40
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR 64[rbp], rax
	mov	rax, QWORD PTR 176[rbp]
	add	rax, 48
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR 72[rbp], rax
	mov	rax, QWORD PTR 176[rbp]
	add	rax, 56
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR 80[rbp], rax
	mov	rax, QWORD PTR 176[rbp]
	add	rax, 64
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR 88[rbp], rax
	mov	rax, QWORD PTR 176[rbp]
	add	rax, 72
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR 96[rbp], rax
	mov	rax, QWORD PTR 176[rbp]
	add	rax, 80
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR 104[rbp], rax
	lea	rax, eb_parse_call1f1f2f2f1f1f2f1f4f[rip]
	mov	QWORD PTR -48[rbp], rax
	mov	rax, QWORD PTR 176[rbp]
	add	rax, 16
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -40[rbp], rax
	mov	rax, QWORD PTR 176[rbp]
	add	rax, 40
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -32[rbp], rax
	mov	rax, QWORD PTR 176[rbp]
	add	rax, 48
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -24[rbp], rax
	mov	rax, QWORD PTR 176[rbp]
	add	rax, 56
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -16[rbp], rax
	mov	rax, QWORD PTR 176[rbp]
	add	rax, 64
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -8[rbp], rax
	mov	rax, QWORD PTR 176[rbp]
	add	rax, 72
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR 0[rbp], rax
	mov	rax, QWORD PTR 176[rbp]
	add	rax, 80
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR 8[rbp], rax
	mov	rax, QWORD PTR 184[rbp]
	mov	QWORD PTR 16[rbp], rax
	lea	rax, eb_parse_call1f1f2f2f1f1f2f1f5f[rip]
	mov	QWORD PTR -64[rbp], rax
	mov	rax, QWORD PTR 176[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -56[rbp], rax
	lea	r9, -64[rbp]
	lea	r8, -48[rbp]
	lea	rdx, 32[rbp]
	lea	rcx, eb_parse_call[rip]
	mov	r11, QWORD PTR 128[rbp]
	mov	r10, QWORD PTR 144[rbp]
	mov	rax, QWORD PTR 152[rbp]
	mov	QWORD PTR 48[rsp], r9
	mov	QWORD PTR 40[rsp], r8
	mov	QWORD PTR 32[rsp], rdx
	mov	r9, r11
	mov	r8, r10
	mov	rdx, rax
	call	eb_parse_call
	mov	QWORD PTR 120[rbp], rax
	mov	rax, QWORD PTR 120[rbp]
	add	rsp, 288
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_parse_call1f1f2f2f1f1f2f
	.def	eb_parse_call1f1f2f2f1f1f2f;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_parse_call1f1f2f2f1f1f2f
eb_parse_call1f1f2f2f1f1f2f:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 208
	.seh_stackalloc	208
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	QWORD PTR 24[rbp], rdx
	mov	QWORD PTR 32[rbp], r8
	mov	QWORD PTR 40[rbp], r9
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 56
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -8[rbp], rax
	lea	rcx, eb_get_binding_args[rip]
	mov	rax, QWORD PTR -8[rbp]
	mov	rdx, rax
	call	eb_get_binding_args
	mov	QWORD PTR -16[rbp], rax
	lea	rax, eb_parse_call1f1f2f2f1f1f2f001f[rip]
	mov	QWORD PTR -80[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 40
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -72[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 64
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -64[rbp], rax
	mov	rax, QWORD PTR 40[rbp]
	mov	QWORD PTR -56[rbp], rax
	lea	rdx, -80[rbp]
	lea	rcx, eb_map[rip]
	mov	rax, QWORD PTR -16[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_map
	mov	QWORD PTR -24[rbp], rax
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -32[rbp], rax
	lea	rcx, eb_ast_lambda[rip]
	mov	rdx, QWORD PTR -32[rbp]
	mov	rax, QWORD PTR -24[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_ast_lambda
	mov	QWORD PTR -40[rbp], rax
	lea	rax, eb_parse_call1f1f2f2f1f1f2f1f[rip]
	mov	QWORD PTR -176[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -168[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 16
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -160[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 24
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -152[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 32
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -144[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 40
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -136[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 48
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -128[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 64
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -120[rbp], rax
	mov	rax, QWORD PTR 40[rbp]
	mov	QWORD PTR -112[rbp], rax
	mov	rax, QWORD PTR 32[rbp]
	mov	QWORD PTR -104[rbp], rax
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -96[rbp], rax
	lea	rdx, -176[rbp]
	lea	rcx, eb_let[rip]
	mov	rax, QWORD PTR -40[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_let
	mov	QWORD PTR -48[rbp], rax
	mov	rax, QWORD PTR -48[rbp]
	add	rsp, 208
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_parse_call1f1f2f2f1f1f3f
	.def	eb_parse_call1f1f2f2f1f1f3f;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_parse_call1f1f2f2f1f1f3f
eb_parse_call1f1f2f2f1f1f3f:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 64
	.seh_stackalloc	64
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	QWORD PTR 24[rbp], rdx
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -8[rbp], rax
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -16[rbp], rax
	mov	rax, QWORD PTR -8[rbp]
	mov	rax, QWORD PTR [rax]
	mov	r8, rax
	mov	rdx, QWORD PTR -16[rbp]
	mov	rax, QWORD PTR -8[rbp]
	mov	rcx, rax
	call	r8
	mov	QWORD PTR -24[rbp], rax
	mov	rax, QWORD PTR -24[rbp]
	add	rsp, 64
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_parse_call1f1f2f2f1f1f
	.def	eb_parse_call1f1f2f2f1f1f;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_parse_call1f1f2f2f1f1f
eb_parse_call1f1f2f2f1f1f:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 176
	.seh_stackalloc	176
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	QWORD PTR 24[rbp], rdx
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 24
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -8[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 48
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -16[rbp], rax
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -24[rbp], rax
	lea	rax, eb_parse_call1f1f2f2f1f1f2f[rip]
	mov	QWORD PTR -112[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -104[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 16
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -96[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 24
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -88[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 32
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -80[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 40
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -72[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 48
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -64[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 56
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -56[rbp], rax
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -48[rbp], rax
	lea	rax, eb_parse_call1f1f2f2f1f1f3f[rip]
	mov	QWORD PTR -128[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -120[rbp], rax
	mov	rax, QWORD PTR -8[rbp]
	mov	rax, QWORD PTR [rax]
	mov	r10, rax
	lea	rcx, -128[rbp]
	lea	r9, -112[rbp]
	mov	r8, QWORD PTR -24[rbp]
	mov	rdx, QWORD PTR -16[rbp]
	mov	rax, QWORD PTR -8[rbp]
	mov	QWORD PTR 32[rsp], rcx
	mov	rcx, rax
	call	r10
	mov	QWORD PTR -32[rbp], rax
	mov	rax, QWORD PTR -32[rbp]
	add	rsp, 176
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_parse_call1f1f2f2f1f
	.def	eb_parse_call1f1f2f2f1f;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_parse_call1f1f2f2f1f
eb_parse_call1f1f2f2f1f:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 144
	.seh_stackalloc	144
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 40
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -8[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 56
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -16[rbp], rax
	lea	rcx, eb_get_binding_args[rip]
	mov	rax, QWORD PTR -16[rbp]
	mov	rdx, rax
	call	eb_get_binding_args
	mov	QWORD PTR -24[rbp], rax
	lea	rax, eb_parse_call1f1f2f2f1f02f[rip]
	mov	QWORD PTR -48[rbp], rax
	lea	r8, -48[rbp]
	lea	rcx, eb_fold[rip]
	mov	rdx, QWORD PTR -24[rbp]
	mov	rax, QWORD PTR -8[rbp]
	mov	r9, r8
	mov	r8, rdx
	mov	rdx, rax
	call	eb_fold
	mov	QWORD PTR -32[rbp], rax
	lea	rax, eb_parse_call1f1f2f2f1f1f[rip]
	mov	QWORD PTR -112[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -104[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 16
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -96[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 24
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -88[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 32
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -80[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 40
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -72[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 48
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -64[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 56
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -56[rbp], rax
	lea	rdx, -112[rbp]
	lea	rcx, eb_let[rip]
	mov	rax, QWORD PTR -32[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_let
	mov	QWORD PTR -40[rbp], rax
	mov	rax, QWORD PTR -40[rbp]
	add	rsp, 144
	pop	rbp
	ret
	.seh_endproc
	.section .rdata,"dr"
	.align 8
.LC20:
	.ascii "binding could not be understood\0"
	.text
	.globl	eb_parse_call1f1f2f2f2f
	.def	eb_parse_call1f1f2f2f2f;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_parse_call1f1f2f2f2f
eb_parse_call1f1f2f2f2f:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 80
	.seh_stackalloc	80
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -8[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 16
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -16[rbp], rax
	lea	rcx, eb_state_pos[rip]
	mov	rax, QWORD PTR -16[rbp]
	mov	rdx, rax
	call	eb_state_pos
	mov	QWORD PTR -24[rbp], rax
	lea	rax, .LC20[rip]
	mov	rdx, rax
	lea	rax, eb_parse_call1f1f2f2f2f01.67[rip]
	mov	rcx, rax
	call	ebz_stol
	mov	rdx, QWORD PTR eb_parse_call1f1f2f2f2f01.67[rip]
	lea	rcx, eb_error_from_position[rip]
	mov	rax, QWORD PTR -24[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_error_from_position
	mov	QWORD PTR -32[rbp], rax
	mov	rax, QWORD PTR -8[rbp]
	mov	rax, QWORD PTR [rax]
	mov	r8, rax
	mov	rdx, QWORD PTR -32[rbp]
	mov	rax, QWORD PTR -8[rbp]
	mov	rcx, rax
	call	r8
	mov	QWORD PTR -40[rbp], rax
	mov	rax, QWORD PTR -40[rbp]
	add	rsp, 80
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_parse_call1f1f2f2f
	.def	eb_parse_call1f1f2f2f;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_parse_call1f1f2f2f
eb_parse_call1f1f2f2f:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 160
	.seh_stackalloc	160
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 56
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -8[rbp], rax
	lea	rcx, eb_binding_is_lambda[rip]
	mov	rax, QWORD PTR -8[rbp]
	mov	rdx, rax
	call	eb_binding_is_lambda
	mov	QWORD PTR -16[rbp], rax
	lea	rax, eb_parse_call1f1f2f2f1f[rip]
	mov	QWORD PTR -96[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -88[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 16
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -80[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 24
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -72[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 32
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -64[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 40
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -56[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 48
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -48[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 56
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -40[rbp], rax
	lea	rax, eb_parse_call1f1f2f2f2f[rip]
	mov	QWORD PTR -128[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -120[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 48
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -112[rbp], rax
	lea	r8, -128[rbp]
	lea	rdx, -96[rbp]
	lea	rcx, eb_if[rip]
	mov	rax, QWORD PTR -16[rbp]
	mov	r9, r8
	mov	r8, rdx
	mov	rdx, rax
	call	eb_if
	mov	QWORD PTR -24[rbp], rax
	mov	rax, QWORD PTR -24[rbp]
	add	rsp, 160
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_parse_call1f1f2f
	.def	eb_parse_call1f1f2f;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_parse_call1f1f2f
eb_parse_call1f1f2f:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 176
	.seh_stackalloc	176
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 56
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -8[rbp], rax
	lea	rcx, eb_binding_is_value[rip]
	mov	rax, QWORD PTR -8[rbp]
	mov	rdx, rax
	call	eb_binding_is_value
	mov	QWORD PTR -16[rbp], rax
	lea	rax, eb_parse_call1f1f2f1f[rip]
	mov	QWORD PTR -80[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -72[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 16
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -64[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 24
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -56[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 32
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -48[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 40
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -40[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 48
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -32[rbp], rax
	lea	rax, eb_parse_call1f1f2f2f[rip]
	mov	QWORD PTR -144[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -136[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 16
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -128[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 24
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -120[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 32
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -112[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 40
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -104[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 48
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -96[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 56
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -88[rbp], rax
	lea	r8, -144[rbp]
	lea	rdx, -80[rbp]
	lea	rcx, eb_if[rip]
	mov	rax, QWORD PTR -16[rbp]
	mov	r9, r8
	mov	r8, rdx
	mov	rdx, rax
	call	eb_if
	mov	QWORD PTR -24[rbp], rax
	mov	rax, QWORD PTR -24[rbp]
	add	rsp, 176
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_parse_call1f1f
	.def	eb_parse_call1f1f;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_parse_call1f1f
eb_parse_call1f1f:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 192
	.seh_stackalloc	192
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	QWORD PTR 24[rbp], rdx
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -8[rbp], rax
	lea	rcx, eb_binding_is_generic[rip]
	mov	rax, QWORD PTR -8[rbp]
	mov	rdx, rax
	call	eb_binding_is_generic
	mov	QWORD PTR -16[rbp], rax
	lea	rax, eb_parse_call1f1f1f[rip]
	mov	QWORD PTR -96[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -88[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 16
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -80[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 24
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -72[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 32
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -64[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 40
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -56[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 48
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -48[rbp], rax
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -40[rbp], rax
	lea	rax, eb_parse_call1f1f2f[rip]
	mov	QWORD PTR -160[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -152[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 16
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -144[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 24
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -136[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 32
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -128[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 40
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -120[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 48
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -112[rbp], rax
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -104[rbp], rax
	lea	r8, -160[rbp]
	lea	rdx, -96[rbp]
	lea	rcx, eb_if[rip]
	mov	rax, QWORD PTR -16[rbp]
	mov	r9, r8
	mov	r8, rdx
	mov	rdx, rax
	call	eb_if
	mov	QWORD PTR -24[rbp], rax
	mov	rax, QWORD PTR -24[rbp]
	add	rsp, 192
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_parse_call1f
	.def	eb_parse_call1f;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_parse_call1f
eb_parse_call1f:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 112
	.seh_stackalloc	112
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 32
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -8[rbp], rax
	lea	rcx, eb_car[rip]
	mov	rax, QWORD PTR -8[rbp]
	mov	rdx, rax
	call	eb_car
	mov	QWORD PTR -16[rbp], rax
	lea	rax, eb_parse_call1f1f[rip]
	mov	QWORD PTR -80[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -72[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 16
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -64[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 24
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -56[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 32
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -48[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 40
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -40[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 48
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -32[rbp], rax
	lea	rdx, -80[rbp]
	lea	rcx, eb_let[rip]
	mov	rax, QWORD PTR -16[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_let
	mov	QWORD PTR -24[rbp], rax
	mov	rax, QWORD PTR -24[rbp]
	add	rsp, 112
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_parse_call2f
	.def	eb_parse_call2f;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_parse_call2f
eb_parse_call2f:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 80
	.seh_stackalloc	80
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -8[rbp], rax
	mov	QWORD PTR -16[rbp], 0
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 24
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -24[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 16
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -32[rbp], rax
	mov	rax, QWORD PTR -8[rbp]
	mov	rax, QWORD PTR [rax]
	mov	r10, rax
	mov	r8, QWORD PTR -32[rbp]
	mov	rcx, QWORD PTR -24[rbp]
	mov	rdx, QWORD PTR -16[rbp]
	mov	rax, QWORD PTR -8[rbp]
	mov	r9, r8
	mov	r8, rcx
	mov	rcx, rax
	call	r10
	mov	QWORD PTR -40[rbp], rax
	mov	rax, QWORD PTR -40[rbp]
	add	rsp, 80
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_parse_call
	.def	eb_parse_call;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_parse_call
eb_parse_call:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 144
	.seh_stackalloc	144
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	QWORD PTR 24[rbp], rdx
	mov	QWORD PTR 32[rbp], r8
	mov	QWORD PTR 40[rbp], r9
	mov	rax, QWORD PTR 40[rbp]
	mov	QWORD PTR -8[rbp], rax
	lea	rax, eb_parse_call1f[rip]
	mov	QWORD PTR -80[rbp], rax
	mov	rax, QWORD PTR 64[rbp]
	mov	QWORD PTR -72[rbp], rax
	mov	rax, QWORD PTR 56[rbp]
	mov	QWORD PTR -64[rbp], rax
	mov	rax, QWORD PTR 48[rbp]
	mov	QWORD PTR -56[rbp], rax
	mov	rax, QWORD PTR 40[rbp]
	mov	QWORD PTR -48[rbp], rax
	mov	rax, QWORD PTR 32[rbp]
	mov	QWORD PTR -40[rbp], rax
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -32[rbp], rax
	lea	rax, eb_parse_call2f[rip]
	mov	QWORD PTR -112[rbp], rax
	mov	rax, QWORD PTR 56[rbp]
	mov	QWORD PTR -104[rbp], rax
	mov	rax, QWORD PTR 32[rbp]
	mov	QWORD PTR -96[rbp], rax
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -88[rbp], rax
	lea	r8, -112[rbp]
	lea	rdx, -80[rbp]
	lea	rcx, eb_if[rip]
	mov	rax, QWORD PTR -8[rbp]
	mov	r9, r8
	mov	r8, rdx
	mov	rdx, rax
	call	eb_if
	mov	QWORD PTR -16[rbp], rax
	mov	rax, QWORD PTR -16[rbp]
	add	rsp, 144
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_parse_str_expr2f1f1f
	.def	eb_parse_str_expr2f1f1f;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_parse_str_expr2f1f1f
eb_parse_str_expr2f1f1f:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 64
	.seh_stackalloc	64
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	QWORD PTR 24[rbp], rdx
	mov	QWORD PTR -8[rbp], 34
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -16[rbp], rax
	lea	rcx, eb_equal[rip]
	mov	rdx, QWORD PTR -16[rbp]
	mov	rax, QWORD PTR -8[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_equal
	mov	QWORD PTR -24[rbp], rax
	lea	rcx, eb_not[rip]
	mov	rax, QWORD PTR -24[rbp]
	mov	rdx, rax
	call	eb_not
	mov	QWORD PTR -32[rbp], rax
	mov	rax, QWORD PTR -32[rbp]
	add	rsp, 64
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_parse_str_expr2f1f2f
	.def	eb_parse_str_expr2f1f2f;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_parse_str_expr2f1f2f
eb_parse_str_expr2f1f2f:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 64
	.seh_stackalloc	64
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	QWORD PTR 24[rbp], rdx
	mov	QWORD PTR 32[rbp], r8
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 40
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -8[rbp], rax
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -16[rbp], rax
	mov	rax, QWORD PTR 32[rbp]
	mov	QWORD PTR -24[rbp], rax
	mov	rax, QWORD PTR -8[rbp]
	mov	rax, QWORD PTR [rax]
	mov	r9, rax
	mov	rcx, QWORD PTR -24[rbp]
	mov	rdx, QWORD PTR -16[rbp]
	mov	rax, QWORD PTR -8[rbp]
	mov	r8, rcx
	mov	rcx, rax
	call	r9
	mov	QWORD PTR -32[rbp], rax
	mov	rax, QWORD PTR -32[rbp]
	add	rsp, 64
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_parse_str_expr2f1f3f
	.def	eb_parse_str_expr2f1f3f;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_parse_str_expr2f1f3f
eb_parse_str_expr2f1f3f:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 64
	.seh_stackalloc	64
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	QWORD PTR 24[rbp], rdx
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 16
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -8[rbp], rax
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -16[rbp], rax
	mov	rax, QWORD PTR -8[rbp]
	mov	rax, QWORD PTR [rax]
	mov	r8, rax
	mov	rdx, QWORD PTR -16[rbp]
	mov	rax, QWORD PTR -8[rbp]
	mov	rcx, rax
	call	r8
	mov	QWORD PTR -24[rbp], rax
	mov	rax, QWORD PTR -24[rbp]
	add	rsp, 64
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_parse_str_expr2f1f
	.def	eb_parse_str_expr2f1f;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_parse_str_expr2f1f
eb_parse_str_expr2f1f:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 160
	.seh_stackalloc	160
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	QWORD PTR 24[rbp], rdx
	mov	QWORD PTR 32[rbp], r8
	mov	QWORD PTR 40[rbp], r9
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -8[rbp], rax
	lea	rax, eb_parse_str_expr2f1f1f[rip]
	mov	QWORD PTR -24[rbp], rax
	lea	rax, eb_parse_str_expr2f1f2f[rip]
	mov	QWORD PTR -80[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 16
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -72[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 24
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -64[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 32
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -56[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 40
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -48[rbp], rax
	mov	rax, QWORD PTR 32[rbp]
	mov	QWORD PTR -40[rbp], rax
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -32[rbp], rax
	lea	rax, eb_parse_str_expr2f1f3f[rip]
	mov	QWORD PTR -112[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -104[rbp], rax
	mov	rax, QWORD PTR 40[rbp]
	mov	QWORD PTR -96[rbp], rax
	lea	rdx, -112[rbp]
	lea	r9, -80[rbp]
	lea	r8, -24[rbp]
	lea	rcx, eb_parse_if[rip]
	mov	rax, QWORD PTR -8[rbp]
	mov	QWORD PTR 32[rsp], rdx
	mov	rdx, rax
	call	eb_parse_if
	mov	QWORD PTR -16[rbp], rax
	mov	rax, QWORD PTR -16[rbp]
	add	rsp, 160
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_parse_str_expr2f2f1f2f
	.def	eb_parse_str_expr2f2f1f2f;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_parse_str_expr2f2f1f2f
eb_parse_str_expr2f2f1f2f:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 64
	.seh_stackalloc	64
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	QWORD PTR 24[rbp], rdx
	mov	QWORD PTR 32[rbp], r8
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -8[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 40
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -16[rbp], rax
	mov	rax, QWORD PTR 32[rbp]
	mov	QWORD PTR -24[rbp], rax
	mov	rax, QWORD PTR -8[rbp]
	mov	rax, QWORD PTR [rax]
	mov	r9, rax
	mov	rcx, QWORD PTR -24[rbp]
	mov	rdx, QWORD PTR -16[rbp]
	mov	rax, QWORD PTR -8[rbp]
	mov	r8, rcx
	mov	rcx, rax
	call	r9
	mov	QWORD PTR -32[rbp], rax
	mov	rax, QWORD PTR -32[rbp]
	add	rsp, 64
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_parse_str_expr2f2f1f3f
	.def	eb_parse_str_expr2f2f1f3f;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_parse_str_expr2f2f1f3f
eb_parse_str_expr2f2f1f3f:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 64
	.seh_stackalloc	64
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	QWORD PTR 24[rbp], rdx
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -8[rbp], rax
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -16[rbp], rax
	mov	rax, QWORD PTR -8[rbp]
	mov	rax, QWORD PTR [rax]
	mov	r8, rax
	mov	rdx, QWORD PTR -16[rbp]
	mov	rax, QWORD PTR -8[rbp]
	mov	rcx, rax
	call	r8
	mov	QWORD PTR -24[rbp], rax
	mov	rax, QWORD PTR -24[rbp]
	add	rsp, 64
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_parse_str_expr2f2f1f
	.def	eb_parse_str_expr2f2f1f;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_parse_str_expr2f2f1f
eb_parse_str_expr2f2f1f:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 144
	.seh_stackalloc	144
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	QWORD PTR 24[rbp], rdx
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 40
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -8[rbp], rax
	mov	QWORD PTR -16[rbp], 34
	lea	rax, eb_parse_str_expr2f2f1f2f[rip]
	mov	QWORD PTR -80[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 16
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -72[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 24
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -64[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 32
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -56[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 40
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -48[rbp], rax
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -40[rbp], rax
	lea	rax, eb_parse_str_expr2f2f1f3f[rip]
	mov	QWORD PTR -96[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -88[rbp], rax
	lea	rdx, -96[rbp]
	lea	r9, -80[rbp]
	lea	rcx, eb_parse_value[rip]
	mov	r8, QWORD PTR -16[rbp]
	mov	rax, QWORD PTR -8[rbp]
	mov	QWORD PTR 32[rsp], rdx
	mov	rdx, rax
	call	eb_parse_value
	mov	QWORD PTR -24[rbp], rax
	mov	rax, QWORD PTR -24[rbp]
	add	rsp, 144
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_parse_str_expr2f2f
	.def	eb_parse_str_expr2f2f;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_parse_str_expr2f2f
eb_parse_str_expr2f2f:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 112
	.seh_stackalloc	112
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	QWORD PTR 24[rbp], rdx
	mov	QWORD PTR 32[rbp], r8
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -8[rbp], rax
	lea	rcx, eb_ast_str[rip]
	mov	rax, QWORD PTR -8[rbp]
	mov	rdx, rax
	call	eb_ast_str
	mov	QWORD PTR -16[rbp], rax
	lea	rax, eb_parse_str_expr2f2f1f[rip]
	mov	QWORD PTR -80[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -72[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 16
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -64[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 24
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -56[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 32
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -48[rbp], rax
	mov	rax, QWORD PTR 32[rbp]
	mov	QWORD PTR -40[rbp], rax
	lea	rdx, -80[rbp]
	lea	rcx, eb_let[rip]
	mov	rax, QWORD PTR -16[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_let
	mov	QWORD PTR -24[rbp], rax
	mov	rax, QWORD PTR -24[rbp]
	add	rsp, 112
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_parse_str_expr2f3f
	.def	eb_parse_str_expr2f3f;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_parse_str_expr2f3f
eb_parse_str_expr2f3f:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 64
	.seh_stackalloc	64
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	QWORD PTR 24[rbp], rdx
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -8[rbp], rax
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -16[rbp], rax
	mov	rax, QWORD PTR -8[rbp]
	mov	rax, QWORD PTR [rax]
	mov	r8, rax
	mov	rdx, QWORD PTR -16[rbp]
	mov	rax, QWORD PTR -8[rbp]
	mov	rcx, rax
	call	r8
	mov	QWORD PTR -24[rbp], rax
	mov	rax, QWORD PTR -24[rbp]
	add	rsp, 64
	pop	rbp
	ret
	.seh_endprocg
	.globl	eb_parse_str_expr2f
	.def	eb_parse_str_expr2f;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_parse_str_expr2f
eb_parse_str_expr2f:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 176
	.seh_stackalloc	176
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	QWORD PTR 24[rbp], rdx
	mov	QWORD PTR 32[rbp], r8
	mov	rax, QWORD PTR 32[rbp]
	mov	QWORD PTR -8[rbp], rax
	lea	rax, eb_parse_str_expr2f1f[rip]
	mov	QWORD PTR -64[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -56[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 16
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -48[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 24
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -40[rbp], rax
	mov	rax, QWORD PTR 32[rbp]
	mov	QWORD PTR -32[rbp], rax
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -24[rbp], rax
	lea	rax, eb_parse_str_expr2f2f[rip]
	mov	QWORD PTR -112[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -104[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 16
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -96[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 24
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -88[rbp], rax
	mov	rax, QWORD PTR 32[rbp]
	mov	QWORD PTR -80[rbp], rax
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -72[rbp], rax
	lea	rax, eb_parse_str_expr2f3f[rip]
	mov	QWORD PTR -128[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -120[rbp], rax
	lea	rdx, -128[rbp]
	lea	r9, -112[rbp]
	lea	r8, -64[rbp]
	lea	rcx, eb_parse_zero_or_more[rip]
	mov	rax, QWORD PTR -8[rbp]
	mov	QWORD PTR 32[rsp], rdx
	mov	rdx, rax
	call	eb_parse_zero_or_more
	mov	QWORD PTR -16[rbp], rax
	mov	rax, QWORD PTR -16[rbp]
	add	rsp, 176
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_parse_str_expr3f2f1f
	.def	eb_parse_str_expr3f2f1f;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_parse_str_expr3f2f1f
eb_parse_str_expr3f2f1f:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 80
	.seh_stackalloc	80
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	QWORD PTR 24[rbp], rdx
	mov	QWORD PTR 32[rbp], r8
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -8[rbp], rax
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -16[rbp], rax
	lea	rcx, eb_ast_number[rip]
	mov	rax, QWORD PTR -16[rbp]
	mov	rdx, rax
	call	eb_ast_number
	mov	QWORD PTR -24[rbp], rax
	mov	rax, QWORD PTR 32[rbp]
	mov	QWORD PTR -32[rbp], rax
	mov	rax, QWORD PTR -8[rbp]
	mov	rax, QWORD PTR [rax]
	mov	r9, rax
	mov	rcx, QWORD PTR -32[rbp]
	mov	rdx, QWORD PTR -24[rbp]
	mov	rax, QWORD PTR -8[rbp]
	mov	r8, rcx
	mov	rcx, rax
	call	r9
	mov	QWORD PTR -40[rbp], rax
	mov	rax, QWORD PTR -40[rbp]
	add	rsp, 80
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_parse_str_expr3f2f2f
	.def	eb_parse_str_expr3f2f2f;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_parse_str_expr3f2f2f
eb_parse_str_expr3f2f2f:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 64
	.seh_stackalloc	64
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	QWORD PTR 24[rbp], rdx
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -8[rbp], rax
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -16[rbp], rax
	mov	rax, QWORD PTR -8[rbp]
	mov	rax, QWORD PTR [rax]
	mov	r8, rax
	mov	rdx, QWORD PTR -16[rbp]
	mov	rax, QWORD PTR -8[rbp]
	mov	rcx, rax
	call	r8
	mov	QWORD PTR -24[rbp], rax
	mov	rax, QWORD PTR -24[rbp]
	add	rsp, 64
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_parse_str_expr3f2f
	.def	eb_parse_str_expr3f2f;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_parse_str_expr3f2f
eb_parse_str_expr3f2f:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	add	rsp, -128
	.seh_stackalloc	128
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	QWORD PTR 24[rbp], rdx
	mov	QWORD PTR 32[rbp], r8
	mov	rax, QWORD PTR 32[rbp]
	mov	QWORD PTR -8[rbp], rax
	lea	rax, eb_parse_str_expr3f2f1f[rip]
	mov	QWORD PTR -64[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 16
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -56[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 24
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -48[rbp], rax
	mov	rax, QWORD PTR 32[rbp]
	mov	QWORD PTR -40[rbp], rax
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -32[rbp], rax
	lea	rax, eb_parse_str_expr3f2f2f[rip]
	mov	QWORD PTR -96[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -88[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 32
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -80[rbp], rax
	lea	r8, -96[rbp]
	lea	rdx, -64[rbp]
	lea	rcx, eb_parse_any[rip]
	mov	rax, QWORD PTR -8[rbp]
	mov	r9, r8
	mov	r8, rdx
	mov	rdx, rax
	call	eb_parse_any
	mov	QWORD PTR -16[rbp], rax
	mov	rax, QWORD PTR -16[rbp]
	sub	rsp, -128
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_parse_str_expr3f3f
	.def	eb_parse_str_expr3f3f;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_parse_str_expr3f3f
eb_parse_str_expr3f3f:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 64
	.seh_stackalloc	64
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	QWORD PTR 24[rbp], rdx
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -8[rbp], rax
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -16[rbp], rax
	mov	rax, QWORD PTR -8[rbp]
	mov	rax, QWORD PTR [rax]
	mov	r8, rax
	mov	rdx, QWORD PTR -16[rbp]
	mov	rax, QWORD PTR -8[rbp]
	mov	rcx, rax
	call	r8
	mov	QWORD PTR -24[rbp], rax
	mov	rax, QWORD PTR -24[rbp]
	add	rsp, 64
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_parse_str_expr3f
	.def	eb_parse_str_expr3f;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_parse_str_expr3f
eb_parse_str_expr3f:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 144
	.seh_stackalloc	144
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	QWORD PTR 24[rbp], rdx
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 24
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -8[rbp], rax
	mov	QWORD PTR -16[rbp], 39
	lea	rax, eb_parse_str_expr3f2f[rip]
	mov	QWORD PTR -64[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -56[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 16
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -48[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 24
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -40[rbp], rax
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -32[rbp], rax
	lea	rax, eb_parse_str_expr3f3f[rip]
	mov	QWORD PTR -96[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -88[rbp], rax
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -80[rbp], rax
	lea	rdx, -96[rbp]
	lea	r9, -64[rbp]
	lea	rcx, eb_parse_value[rip]
	mov	r8, QWORD PTR -16[rbp]
	mov	rax, QWORD PTR -8[rbp]
	mov	QWORD PTR 32[rsp], rdx
	mov	rdx, rax
	call	eb_parse_value
	mov	QWORD PTR -24[rbp], rax
	mov	rax, QWORD PTR -24[rbp]
	add	rsp, 144
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_parse_str_expr
	.def	eb_parse_str_expr;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_parse_str_expr
eb_parse_str_expr:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 144
	.seh_stackalloc	144
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	QWORD PTR 24[rbp], rdx
	mov	QWORD PTR 32[rbp], r8
	mov	QWORD PTR 40[rbp], r9
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -8[rbp], rax
	mov	QWORD PTR -16[rbp], 34
	lea	rax, eb_parse_str_expr2f[rip]
	mov	QWORD PTR -64[rbp], rax
	mov	rax, QWORD PTR 40[rbp]
	mov	QWORD PTR -56[rbp], rax
	mov	rax, QWORD PTR 32[rbp]
	mov	QWORD PTR -48[rbp], rax
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -40[rbp], rax
	lea	rax, eb_parse_str_expr3f[rip]
	mov	QWORD PTR -96[rbp], rax
	mov	rax, QWORD PTR 40[rbp]
	mov	QWORD PTR -88[rbp], rax
	mov	rax, QWORD PTR 32[rbp]
	mov	QWORD PTR -80[rbp], rax
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -72[rbp], rax
	lea	rdx, -96[rbp]
	lea	r9, -64[rbp]
	lea	rcx, eb_parse_value[rip]
	mov	r8, QWORD PTR -16[rbp]
	mov	rax, QWORD PTR -8[rbp]
	mov	QWORD PTR 32[rsp], rdx
	mov	rdx, rax
	call	eb_parse_value
	mov	QWORD PTR -24[rbp], rax
	mov	rax, QWORD PTR -24[rbp]
	add	rsp, 144
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_parse_expr1f1f1f1f
	.def	eb_parse_expr1f1f1f1f;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_parse_expr1f1f1f1f
eb_parse_expr1f1f1f1f:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 48
	.seh_stackalloc	48
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	QWORD PTR 24[rbp], rdx
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -8[rbp], rax
	lea	rcx, eb_is_digit[rip]
	mov	rax, QWORD PTR -8[rbp]
	mov	rdx, rax
	call	eb_is_digit
	mov	QWORD PTR -16[rbp], rax
	mov	rax, QWORD PTR -16[rbp]
	add	rsp, 48
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_parse_expr1f1f1f2f
	.def	eb_parse_expr1f1f1f2f;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_parse_expr1f1f1f2f
eb_parse_expr1f1f1f2f:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 64
	.seh_stackalloc	64
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	QWORD PTR 24[rbp], rdx
	mov	QWORD PTR 32[rbp], r8
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 24
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -8[rbp], rax
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -16[rbp], rax
	mov	rax, QWORD PTR 32[rbp]
	mov	QWORD PTR -24[rbp], rax
	mov	rax, QWORD PTR -8[rbp]
	mov	rax, QWORD PTR [rax]
	mov	r9, rax
	mov	rcx, QWORD PTR -24[rbp]
	mov	rdx, QWORD PTR -16[rbp]
	mov	rax, QWORD PTR -8[rbp]
	mov	r8, rcx
	mov	rcx, rax
	call	r9
	mov	QWORD PTR -32[rbp], rax
	mov	rax, QWORD PTR -32[rbp]
	add	rsp, 64
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_parse_expr1f1f1f3f
	.def	eb_parse_expr1f1f1f3f;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_parse_expr1f1f1f3f
eb_parse_expr1f1f1f3f:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 64
	.seh_stackalloc	64
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	QWORD PTR 24[rbp], rdx
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 16
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -8[rbp], rax
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -16[rbp], rax
	mov	rax, QWORD PTR -8[rbp]
	mov	rax, QWORD PTR [rax]
	mov	r8, rax
	mov	rdx, QWORD PTR -16[rbp]
	mov	rax, QWORD PTR -8[rbp]
	mov	rcx, rax
	call	r8
	mov	QWORD PTR -24[rbp], rax
	mov	rax, QWORD PTR -24[rbp]
	add	rsp, 64
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_parse_expr1f1f1f
	.def	eb_parse_expr1f1f1f;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_parse_expr1f1f1f
eb_parse_expr1f1f1f:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 144
	.seh_stackalloc	144
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	QWORD PTR 24[rbp], rdx
	mov	QWORD PTR 32[rbp], r8
	mov	QWORD PTR 40[rbp], r9
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -8[rbp], rax
	lea	rax, eb_parse_expr1f1f1f1f[rip]
	mov	QWORD PTR -24[rbp], rax
	lea	rax, eb_parse_expr1f1f1f2f[rip]
	mov	QWORD PTR -64[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 16
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -56[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 24
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -48[rbp], rax
	mov	rax, QWORD PTR 32[rbp]
	mov	QWORD PTR -40[rbp], rax
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -32[rbp], rax
	lea	rax, eb_parse_expr1f1f1f3f[rip]
	mov	QWORD PTR -96[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -88[rbp], rax
	mov	rax, QWORD PTR 40[rbp]
	mov	QWORD PTR -80[rbp], rax
	lea	rdx, -96[rbp]
	lea	r9, -64[rbp]
	lea	r8, -24[rbp]
	lea	rcx, eb_parse_if[rip]
	mov	rax, QWORD PTR -8[rbp]
	mov	QWORD PTR 32[rsp], rdx
	mov	rdx, rax
	call	eb_parse_if
	mov	QWORD PTR -16[rbp], rax
	mov	rax, QWORD PTR -16[rbp]
	add	rsp, 144
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_parse_expr1f1f2f
	.def	eb_parse_expr1f1f2f;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_parse_expr1f1f2f
eb_parse_expr1f1f2f:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 96
	.seh_stackalloc	96
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	QWORD PTR 24[rbp], rdx
	mov	QWORD PTR 32[rbp], r8
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -8[rbp], rax
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -16[rbp], rax
	lea	rcx, eb_str_to_num[rip]
	mov	rax, QWORD PTR -16[rbp]
	mov	rdx, rax
	call	eb_str_to_num
	mov	QWORD PTR -24[rbp], rax
	lea	rcx, eb_ast_number[rip]
	mov	rax, QWORD PTR -24[rbp]
	mov	rdx, rax
	call	eb_ast_number
	mov	QWORD PTR -32[rbp], rax
	mov	rax, QWORD PTR 32[rbp]
	mov	QWORD PTR -40[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 16
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -48[rbp], rax
	mov	rax, QWORD PTR -8[rbp]
	mov	rax, QWORD PTR [rax]
	mov	r10, rax
	mov	r8, QWORD PTR -48[rbp]
	mov	rcx, QWORD PTR -40[rbp]
	mov	rdx, QWORD PTR -32[rbp]
	mov	rax, QWORD PTR -8[rbp]
	mov	r9, r8
	mov	r8, rcx
	mov	rcx, rax
	call	r10
	mov	QWORD PTR -56[rbp], rax
	mov	rax, QWORD PTR -56[rbp]
	add	rsp, 96
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_parse_expr1f1f3f1f3f3f2f
	.def	eb_parse_expr1f1f3f1f3f3f2f;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_parse_expr1f1f3f1f3f3f2f
eb_parse_expr1f1f3f1f3f3f2f:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 80
	.seh_stackalloc	80
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	QWORD PTR 24[rbp], rdx
	mov	QWORD PTR 32[rbp], r8
	mov	QWORD PTR 40[rbp], r9
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 72
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -8[rbp], rax
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -16[rbp], rax
	mov	rax, QWORD PTR 32[rbp]
	mov	QWORD PTR -24[rbp], rax
	mov	rax, QWORD PTR 40[rbp]
	mov	QWORD PTR -32[rbp], rax
	mov	rax, QWORD PTR -8[rbp]
	mov	rax, QWORD PTR [rax]
	mov	r10, rax
	mov	r8, QWORD PTR -32[rbp]
	mov	rcx, QWORD PTR -24[rbp]
	mov	rdx, QWORD PTR -16[rbp]
	mov	rax, QWORD PTR -8[rbp]
	mov	r9, r8
	mov	r8, rcx
	mov	rcx, rax
	call	r10
	mov	QWORD PTR -40[rbp], rax
	mov	rax, QWORD PTR -40[rbp]
	add	rsp, 80
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_parse_expr1f1f3f1f3f3f3f
	.def	eb_parse_expr1f1f3f1f3f3f3f;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_parse_expr1f1f3f1f3f3f3f
eb_parse_expr1f1f3f1f3f3f3f:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 64
	.seh_stackalloc	64
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	QWORD PTR 24[rbp], rdx
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 32
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -8[rbp], rax
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -16[rbp], rax
	mov	rax, QWORD PTR -8[rbp]
	mov	rax, QWORD PTR [rax]
	mov	r8, rax
	mov	rdx, QWORD PTR -16[rbp]
	mov	rax, QWORD PTR -8[rbp]
	mov	rcx, rax
	call	r8
	mov	QWORD PTR -24[rbp], rax
	mov	rax, QWORD PTR -24[rbp]
	add	rsp, 64
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_parse_expr1f1f3f1f3f3f
	.def	eb_parse_expr1f1f3f1f3f3f;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_parse_expr1f1f3f1f3f3f
eb_parse_expr1f1f3f1f3f3f:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 224
	.seh_stackalloc	224
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	QWORD PTR 24[rbp], rdx
	mov	QWORD PTR 32[rbp], r8
	mov	QWORD PTR 40[rbp], r9
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 80
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -8[rbp], rax
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -16[rbp], rax
	mov	rax, QWORD PTR 32[rbp]
	mov	QWORD PTR -24[rbp], rax
	lea	rax, eb_parse_expr1f1f3f1f3f3f2f[rip]
	mov	QWORD PTR -128[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 16
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -120[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 24
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -112[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 32
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -104[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 48
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -96[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 56
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -88[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 72
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -80[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 88
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -72[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 96
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -64[rbp], rax
	mov	rax, QWORD PTR 40[rbp]
	mov	QWORD PTR -56[rbp], rax
	mov	rax, QWORD PTR 32[rbp]
	mov	QWORD PTR -48[rbp], rax
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -40[rbp], rax
	lea	rax, eb_parse_expr1f1f3f1f3f3f3f[rip]
	mov	QWORD PTR -176[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -168[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 40
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -160[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 64
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -152[rbp], rax
	mov	rax, QWORD PTR 48[rbp]
	mov	QWORD PTR -144[rbp], rax
	mov	rax, QWORD PTR -8[rbp]
	mov	rax, QWORD PTR [rax]
	mov	r10, rax
	lea	rcx, -176[rbp]
	lea	r9, -128[rbp]
	mov	r8, QWORD PTR -24[rbp]
	mov	rdx, QWORD PTR -16[rbp]
	mov	rax, QWORD PTR -8[rbp]
	mov	QWORD PTR 32[rsp], rcx
	mov	rcx, rax
	call	r10
	mov	QWORD PTR -32[rbp], rax
	mov	rax, QWORD PTR -32[rbp]
	add	rsp, 224
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_parse_expr1f1f3f1f3f4f
	.def	eb_parse_expr1f1f3f1f3f4f;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_parse_expr1f1f3f1f3f4f
eb_parse_expr1f1f3f1f3f4f:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 80
	.seh_stackalloc	80
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	QWORD PTR 24[rbp], rdx
	mov	QWORD PTR 32[rbp], r8
	mov	QWORD PTR 40[rbp], r9
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 48
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -8[rbp], rax
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -16[rbp], rax
	mov	rax, QWORD PTR 32[rbp]
	mov	QWORD PTR -24[rbp], rax
	mov	rax, QWORD PTR 40[rbp]
	mov	QWORD PTR -32[rbp], rax
	mov	rax, QWORD PTR -8[rbp]
	mov	rax, QWORD PTR [rax]
	mov	r10, rax
	mov	r8, QWORD PTR -32[rbp]
	mov	rcx, QWORD PTR -24[rbp]
	mov	rdx, QWORD PTR -16[rbp]
	mov	rax, QWORD PTR -8[rbp]
	mov	r9, r8
	mov	r8, rcx
	mov	rcx, rax
	call	r10
	mov	QWORD PTR -40[rbp], rax
	mov	rax, QWORD PTR -40[rbp]
	add	rsp, 80
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_parse_expr1f1f3f1f3f5f
	.def	eb_parse_expr1f1f3f1f3f5f;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_parse_expr1f1f3f1f3f5f
eb_parse_expr1f1f3f1f3f5f:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 64
	.seh_stackalloc	64
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	QWORD PTR 24[rbp], rdx
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 24
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -8[rbp], rax
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -16[rbp], rax
	mov	rax, QWORD PTR -8[rbp]
	mov	rax, QWORD PTR [rax]
	mov	r8, rax
	mov	rdx, QWORD PTR -16[rbp]
	mov	rax, QWORD PTR -8[rbp]
	mov	rcx, rax
	call	r8
	mov	QWORD PTR -24[rbp], rax
	mov	rax, QWORD PTR -24[rbp]
	add	rsp, 64
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_parse_expr1f1f3f1f3f
	.def	eb_parse_expr1f1f3f1f3f;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_parse_expr1f1f3f1f3f
eb_parse_expr1f1f3f1f3f:
	push	rbp
	.seh_pushreg	rbp
	sub	rsp, 320
	.seh_stackalloc	320
	lea	rbp, 128[rsp]
	.seh_setframe	rbp, 128
	.seh_endprologue
	mov	QWORD PTR 208[rbp], rcx
	mov	QWORD PTR 216[rbp], rdx
	mov	QWORD PTR 224[rbp], r8
	mov	QWORD PTR 232[rbp], r9
	mov	rax, QWORD PTR 216[rbp]
	mov	QWORD PTR 184[rbp], rax
	mov	rax, QWORD PTR 224[rbp]
	mov	QWORD PTR 176[rbp], rax
	mov	rax, QWORD PTR 232[rbp]
	mov	QWORD PTR 168[rbp], rax
	lea	rax, eb_parse_expr1f1f3f1f3f3f[rip]
	mov	QWORD PTR 48[rbp], rax
	mov	rax, QWORD PTR 208[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR 56[rbp], rax
	mov	rax, QWORD PTR 208[rbp]
	add	rax, 16
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR 64[rbp], rax
	mov	rax, QWORD PTR 208[rbp]
	add	rax, 24
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR 72[rbp], rax
	mov	rax, QWORD PTR 208[rbp]
	add	rax, 32
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR 80[rbp], rax
	mov	rax, QWORD PTR 208[rbp]
	add	rax, 40
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR 88[rbp], rax
	mov	rax, QWORD PTR 208[rbp]
	add	rax, 48
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR 96[rbp], rax
	mov	rax, QWORD PTR 208[rbp]
	add	rax, 56
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR 104[rbp], rax
	mov	rax, QWORD PTR 256[rbp]
	mov	QWORD PTR 112[rbp], rax
	mov	rax, QWORD PTR 248[rbp]
	mov	QWORD PTR 120[rbp], rax
	mov	rax, QWORD PTR 240[rbp]
	mov	QWORD PTR 128[rbp], rax
	mov	rax, QWORD PTR 224[rbp]
	mov	QWORD PTR 136[rbp], rax
	mov	rax, QWORD PTR 216[rbp]
	mov	QWORD PTR 144[rbp], rax
	lea	rax, eb_parse_expr1f1f3f1f3f4f[rip]
	mov	QWORD PTR -32[rbp], rax
	mov	rax, QWORD PTR 208[rbp]
	add	rax, 16
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -24[rbp], rax
	mov	rax, QWORD PTR 208[rbp]
	add	rax, 24
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -16[rbp], rax
	mov	rax, QWORD PTR 208[rbp]
	add	rax, 32
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -8[rbp], rax
	mov	rax, QWORD PTR 208[rbp]
	add	rax, 48
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR 0[rbp], rax
	mov	rax, QWORD PTR 208[rbp]
	add	rax, 56
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR 8[rbp], rax
	mov	rax, QWORD PTR 248[rbp]
	mov	QWORD PTR 16[rbp], rax
	mov	rax, QWORD PTR 224[rbp]
	mov	QWORD PTR 24[rbp], rax
	mov	rax, QWORD PTR 216[rbp]
	mov	QWORD PTR 32[rbp], rax
	lea	rax, eb_parse_expr1f1f3f1f3f5f[rip]
	mov	QWORD PTR -64[rbp], rax
	mov	rax, QWORD PTR 208[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -56[rbp], rax
	mov	rax, QWORD PTR 208[rbp]
	add	rax, 40
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -48[rbp], rax
	mov	rax, QWORD PTR 256[rbp]
	mov	QWORD PTR -40[rbp], rax
	lea	r9, -64[rbp]
	lea	r8, -32[rbp]
	lea	rdx, 48[rbp]
	lea	rcx, eb_parse_call[rip]
	mov	r11, QWORD PTR 168[rbp]
	mov	r10, QWORD PTR 176[rbp]
	mov	rax, QWORD PTR 184[rbp]
	mov	QWORD PTR 48[rsp], r9
	mov	QWORD PTR 40[rsp], r8
	mov	QWORD PTR 32[rsp], rdx
	mov	r9, r11
	mov	r8, r10
	mov	rdx, rax
	call	eb_parse_call
	mov	QWORD PTR 160[rbp], rax
	mov	rax, QWORD PTR 160[rbp]
	add	rsp, 320
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_parse_expr1f1f3f1f4f2f
	.def	eb_parse_expr1f1f3f1f4f2f;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_parse_expr1f1f3f1f4f2f
eb_parse_expr1f1f3f1f4f2f:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 80
	.seh_stackalloc	80
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	QWORD PTR 24[rbp], rdx
	mov	QWORD PTR 32[rbp], r8
	mov	QWORD PTR 40[rbp], r9
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 48
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -8[rbp], rax
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -16[rbp], rax
	mov	rax, QWORD PTR 32[rbp]
	mov	QWORD PTR -24[rbp], rax
	mov	rax, QWORD PTR 40[rbp]
	mov	QWORD PTR -32[rbp], rax
	mov	rax, QWORD PTR -8[rbp]
	mov	rax, QWORD PTR [rax]
	mov	r10, rax
	mov	r8, QWORD PTR -32[rbp]
	mov	rcx, QWORD PTR -24[rbp]
	mov	rdx, QWORD PTR -16[rbp]
	mov	rax, QWORD PTR -8[rbp]
	mov	r9, r8
	mov	r8, rcx
	mov	rcx, rax
	call	r10
	mov	QWORD PTR -40[rbp], rax
	mov	rax, QWORD PTR -40[rbp]
	add	rsp, 80
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_parse_expr1f1f3f1f4f3f
	.def	eb_parse_expr1f1f3f1f4f3f;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_parse_expr1f1f3f1f4f3f
eb_parse_expr1f1f3f1f4f3f:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 64
	.seh_stackalloc	64
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	QWORD PTR 24[rbp], rdx
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 24
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -8[rbp], rax
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -16[rbp], rax
	mov	rax, QWORD PTR -8[rbp]
	mov	rax, QWORD PTR [rax]
	mov	r8, rax
	mov	rdx, QWORD PTR -16[rbp]
	mov	rax, QWORD PTR -8[rbp]
	mov	rcx, rax
	call	r8
	mov	QWORD PTR -24[rbp], rax
	mov	rax, QWORD PTR -24[rbp]
	add	rsp, 64
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_parse_expr1f1f3f1f4f
	.def	eb_parse_expr1f1f3f1f4f;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_parse_expr1f1f3f1f4f
eb_parse_expr1f1f3f1f4f:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 176
	.seh_stackalloc	176
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	QWORD PTR 24[rbp], rdx
	mov	QWORD PTR 32[rbp], r8
	mov	QWORD PTR 40[rbp], r9
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -8[rbp], rax
	mov	rax, QWORD PTR 32[rbp]
	mov	QWORD PTR -16[rbp], rax
	lea	rax, eb_parse_expr1f1f3f1f4f2f[rip]
	mov	QWORD PTR -96[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 16
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -88[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 24
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -80[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 32
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -72[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 48
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -64[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 56
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -56[rbp], rax
	mov	rax, QWORD PTR 40[rbp]
	mov	QWORD PTR -48[rbp], rax
	mov	rax, QWORD PTR 32[rbp]
	mov	QWORD PTR -40[rbp], rax
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -32[rbp], rax
	lea	rax, eb_parse_expr1f1f3f1f4f3f[rip]
	mov	QWORD PTR -128[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -120[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 40
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -112[rbp], rax
	mov	rax, QWORD PTR 48[rbp]
	mov	QWORD PTR -104[rbp], rax
	lea	rdx, -128[rbp]
	lea	r9, -96[rbp]
	lea	rcx, eb_parse_expr[rip]
	mov	r8, QWORD PTR -16[rbp]
	mov	rax, QWORD PTR -8[rbp]
	mov	QWORD PTR 32[rsp], rdx
	mov	rdx, rax
	call	eb_parse_expr
	mov	QWORD PTR -24[rbp], rax
	mov	rax, QWORD PTR -24[rbp]
	add	rsp, 176
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_parse_expr1f1f3f1f5f
	.def	eb_parse_expr1f1f3f1f5f;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_parse_expr1f1f3f1f5f
eb_parse_expr1f1f3f1f5f:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 80
	.seh_stackalloc	80
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	QWORD PTR 24[rbp], rdx
	mov	QWORD PTR 32[rbp], r8
	mov	QWORD PTR 40[rbp], r9
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -8[rbp], rax
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -16[rbp], rax
	mov	rax, QWORD PTR 32[rbp]
	mov	QWORD PTR -24[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 32
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -32[rbp], rax
	mov	rax, QWORD PTR -8[rbp]
	mov	rax, QWORD PTR [rax]
	mov	r10, rax
	mov	r8, QWORD PTR -32[rbp]
	mov	rcx, QWORD PTR -24[rbp]
	mov	rdx, QWORD PTR -16[rbp]
	mov	rax, QWORD PTR -8[rbp]
	mov	r9, r8
	mov	r8, rcx
	mov	rcx, rax
	call	r10
	mov	QWORD PTR -40[rbp], rax
	mov	rax, QWORD PTR -40[rbp]
	add	rsp, 80
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_parse_expr1f1f3f1f6f
	.def	eb_parse_expr1f1f3f1f6f;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_parse_expr1f1f3f1f6f
eb_parse_expr1f1f3f1f6f:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 64
	.seh_stackalloc	64
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	QWORD PTR 24[rbp], rdx
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -8[rbp], rax
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -16[rbp], rax
	mov	rax, QWORD PTR -8[rbp]
	mov	rax, QWORD PTR [rax]
	mov	r8, rax
	mov	rdx, QWORD PTR -16[rbp]
	mov	rax, QWORD PTR -8[rbp]
	mov	rcx, rax
	call	r8
	mov	QWORD PTR -24[rbp], rax
	mov	rax, QWORD PTR -24[rbp]
	add	rsp, 64
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_parse_expr1f1f3f1f
	.def	eb_parse_expr1f1f3f1f;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_parse_expr1f1f3f1f
eb_parse_expr1f1f3f1f:
	push	rbp
	.seh_pushreg	rbp
	push	rbx
	.seh_pushreg	rbx
	sub	rsp, 328
	.seh_stackalloc	328
	lea	rbp, 128[rsp]
	.seh_setframe	rbp, 128
	.seh_endprologue
	mov	QWORD PTR 224[rbp], rcx
	mov	QWORD PTR 232[rbp], rdx
	mov	QWORD PTR 240[rbp], r8
	mov	rax, QWORD PTR 240[rbp]
	mov	QWORD PTR 184[rbp], rax
	mov	rax, QWORD PTR 224[rbp]
	add	rax, 24
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR 176[rbp], rax
	mov	rax, QWORD PTR 232[rbp]
	mov	QWORD PTR 168[rbp], rax
	lea	rax, eb_parse_expr1f1f3f1f3f[rip]
	mov	QWORD PTR 96[rbp], rax
	mov	rax, QWORD PTR 224[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR 104[rbp], rax
	mov	rax, QWORD PTR 224[rbp]
	add	rax, 24
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR 112[rbp], rax
	mov	rax, QWORD PTR 224[rbp]
	add	rax, 32
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR 120[rbp], rax
	mov	rax, QWORD PTR 224[rbp]
	add	rax, 40
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR 128[rbp], rax
	mov	rax, QWORD PTR 224[rbp]
	add	rax, 56
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR 136[rbp], rax
	mov	rax, QWORD PTR 240[rbp]
	mov	QWORD PTR 144[rbp], rax
	mov	rax, QWORD PTR 232[rbp]
	mov	QWORD PTR 152[rbp], rax
	lea	rax, eb_parse_expr1f1f3f1f4f[rip]
	mov	QWORD PTR 32[rbp], rax
	mov	rax, QWORD PTR 224[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR 40[rbp], rax
	mov	rax, QWORD PTR 224[rbp]
	add	rax, 24
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR 48[rbp], rax
	mov	rax, QWORD PTR 224[rbp]
	add	rax, 32
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR 56[rbp], rax
	mov	rax, QWORD PTR 224[rbp]
	add	rax, 40
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR 64[rbp], rax
	mov	rax, QWORD PTR 224[rbp]
	add	rax, 56
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR 72[rbp], rax
	mov	rax, QWORD PTR 240[rbp]
	mov	QWORD PTR 80[rbp], rax
	mov	rax, QWORD PTR 232[rbp]
	mov	QWORD PTR 88[rbp], rax
	lea	rax, eb_parse_expr1f1f3f1f5f[rip]
	mov	QWORD PTR -32[rbp], rax
	mov	rax, QWORD PTR 224[rbp]
	add	rax, 16
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -24[rbp], rax
	mov	rax, QWORD PTR 224[rbp]
	add	rax, 32
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -16[rbp], rax
	mov	rax, QWORD PTR 224[rbp]
	add	rax, 40
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -8[rbp], rax
	mov	rax, QWORD PTR 224[rbp]
	add	rax, 48
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR 0[rbp], rax
	mov	rax, QWORD PTR 240[rbp]
	mov	QWORD PTR 8[rbp], rax
	mov	rax, QWORD PTR 232[rbp]
	mov	QWORD PTR 16[rbp], rax
	lea	rax, eb_parse_expr1f1f3f1f6f[rip]
	mov	QWORD PTR -64[rbp], rax
	mov	rax, QWORD PTR 224[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -56[rbp], rax
	mov	rax, QWORD PTR 224[rbp]
	add	rax, 56
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -48[rbp], rax
	lea	r10, -64[rbp]
	lea	r9, -32[rbp]
	lea	r8, 32[rbp]
	lea	rdx, 96[rbp]
	lea	rcx, eb_parse_expr_match[rip]
	mov	rbx, QWORD PTR 168[rbp]
	mov	r11, QWORD PTR 176[rbp]
	mov	rax, QWORD PTR 184[rbp]
	mov	QWORD PTR 56[rsp], r10
	mov	QWORD PTR 48[rsp], r9
	mov	QWORD PTR 40[rsp], r8
	mov	QWORD PTR 32[rsp], rdx
	mov	r9, rbx
	mov	r8, r11
	mov	rdx, rax
	call	eb_parse_expr_match
	mov	QWORD PTR 160[rbp], rax
	mov	rax, QWORD PTR 160[rbp]
	add	rsp, 328
	pop	rbx
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_parse_expr1f1f3f2f1f
	.def	eb_parse_expr1f1f3f2f1f;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_parse_expr1f1f3f2f1f
eb_parse_expr1f1f3f2f1f:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 80
	.seh_stackalloc	80
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	QWORD PTR 24[rbp], rdx
	mov	QWORD PTR 32[rbp], r8
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -8[rbp], rax
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -16[rbp], rax
	mov	rax, QWORD PTR 32[rbp]
	mov	QWORD PTR -24[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 32
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -32[rbp], rax
	mov	rax, QWORD PTR -8[rbp]
	mov	rax, QWORD PTR [rax]
	mov	r10, rax
	mov	r8, QWORD PTR -32[rbp]
	mov	rcx, QWORD PTR -24[rbp]
	mov	rdx, QWORD PTR -16[rbp]
	mov	rax, QWORD PTR -8[rbp]
	mov	r9, r8
	mov	r8, rcx
	mov	rcx, rax
	call	r10
	mov	QWORD PTR -40[rbp], rax
	mov	rax, QWORD PTR -40[rbp]
	add	rsp, 80
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_parse_expr1f1f3f2f2f
	.def	eb_parse_expr1f1f3f2f2f;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_parse_expr1f1f3f2f2f
eb_parse_expr1f1f3f2f2f:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 64
	.seh_stackalloc	64
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	QWORD PTR 24[rbp], rdx
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -8[rbp], rax
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -16[rbp], rax
	mov	rax, QWORD PTR -8[rbp]
	mov	rax, QWORD PTR [rax]
	mov	r8, rax
	mov	rdx, QWORD PTR -16[rbp]
	mov	rax, QWORD PTR -8[rbp]
	mov	rcx, rax
	call	r8
	mov	QWORD PTR -24[rbp], rax
	mov	rax, QWORD PTR -24[rbp]
	add	rsp, 64
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_parse_expr1f1f3f2f
	.def	eb_parse_expr1f1f3f2f;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_parse_expr1f1f3f2f
eb_parse_expr1f1f3f2f:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	add	rsp, -128
	.seh_stackalloc	128
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	QWORD PTR 24[rbp], rdx
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 32
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -8[rbp], rax
	lea	rax, eb_parse_expr1f1f3f2f1f[rip]
	mov	QWORD PTR -64[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 16
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -56[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 24
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -48[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 32
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -40[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 40
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -32[rbp], rax
	lea	rax, eb_parse_expr1f1f3f2f2f[rip]
	mov	QWORD PTR -96[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -88[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 48
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -80[rbp], rax
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -72[rbp], rax
	lea	r8, -96[rbp]
	lea	rdx, -64[rbp]
	lea	rcx, eb_parse_str_expr[rip]
	mov	rax, QWORD PTR -8[rbp]
	mov	r9, r8
	mov	r8, rdx
	mov	rdx, rax
	call	eb_parse_str_expr
	mov	QWORD PTR -16[rbp], rax
	mov	rax, QWORD PTR -16[rbp]
	sub	rsp, -128
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_parse_expr1f1f3f
	.def	eb_parse_expr1f1f3f;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_parse_expr1f1f3f
eb_parse_expr1f1f3f:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 176
	.seh_stackalloc	176
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	QWORD PTR 24[rbp], rdx
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 40
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -8[rbp], rax
	lea	rax, eb_parse_expr1f1f3f1f[rip]
	mov	QWORD PTR -80[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -72[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 16
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -64[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 24
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -56[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 32
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -48[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 40
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -40[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 48
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -32[rbp], rax
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -24[rbp], rax
	lea	rax, eb_parse_expr1f1f3f2f[rip]
	mov	QWORD PTR -144[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -136[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 16
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -128[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 32
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -120[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 40
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -112[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 48
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -104[rbp], rax
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -96[rbp], rax
	lea	r8, -144[rbp]
	lea	rdx, -80[rbp]
	lea	rcx, eb_parse_word[rip]
	mov	rax, QWORD PTR -8[rbp]
	mov	r9, r8
	mov	r8, rdx
	mov	rdx, rax
	call	eb_parse_word
	mov	QWORD PTR -16[rbp], rax
	mov	rax, QWORD PTR -16[rbp]
	add	rsp, 176
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_parse_expr1f1f
	.def	eb_parse_expr1f1f;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_parse_expr1f1f
eb_parse_expr1f1f:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 208
	.seh_stackalloc	208
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	QWORD PTR 24[rbp], rdx
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 40
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -8[rbp], rax
	lea	rax, eb_parse_expr1f1f1f[rip]
	mov	QWORD PTR -48[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -40[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 32
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -32[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 40
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -24[rbp], rax
	lea	rax, eb_parse_expr1f1f2f[rip]
	mov	QWORD PTR -96[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 16
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -88[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 24
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -80[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 32
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -72[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 40
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -64[rbp], rax
	lea	rax, eb_parse_expr1f1f3f[rip]
	mov	QWORD PTR -160[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -152[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 16
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -144[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 24
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -136[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 32
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -128[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 40
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -120[rbp], rax
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -112[rbp], rax
	lea	rdx, -160[rbp]
	lea	r9, -96[rbp]
	lea	r8, -48[rbp]
	lea	rcx, eb_parse_one_or_more[rip]
	mov	rax, QWORD PTR -8[rbp]
	mov	QWORD PTR 32[rsp], rdx
	mov	rdx, rax
	call	eb_parse_one_or_more
	mov	QWORD PTR -16[rbp], rax
	mov	rax, QWORD PTR -16[rbp]
	add	rsp, 208
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_parse_expr1f
	.def	eb_parse_expr1f;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_parse_expr1f
eb_parse_expr1f:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 96
	.seh_stackalloc	96
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	QWORD PTR 24[rbp], rdx
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 24
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -8[rbp], rax
	lea	rax, eb_parse_expr1f1f[rip]
	mov	QWORD PTR -64[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -56[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 16
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -48[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 24
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -40[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 32
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -32[rbp], rax
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -24[rbp], rax
	lea	rdx, -64[rbp]
	lea	rcx, eb_let[rip]
	mov	rax, QWORD PTR -8[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_let
	mov	QWORD PTR -16[rbp], rax
	mov	rax, QWORD PTR -16[rbp]
	add	rsp, 96
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_parse_expr
	.def	eb_parse_expr;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_parse_expr
eb_parse_expr:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 96
	.seh_stackalloc	96
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	QWORD PTR 24[rbp], rdx
	mov	QWORD PTR 32[rbp], r8
	mov	QWORD PTR 40[rbp], r9
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -8[rbp], rax
	lea	rcx, eb_strip[rip]
	mov	rax, QWORD PTR -8[rbp]
	mov	rdx, rax
	call	eb_strip
	mov	QWORD PTR -16[rbp], rax
	lea	rax, eb_parse_expr1f[rip]
	mov	QWORD PTR -64[rbp], rax
	mov	rax, QWORD PTR 48[rbp]
	mov	QWORD PTR -56[rbp], rax
	mov	rax, QWORD PTR 40[rbp]
	mov	QWORD PTR -48[rbp], rax
	mov	rax, QWORD PTR 32[rbp]
	mov	QWORD PTR -40[rbp], rax
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -32[rbp], rax
	lea	rdx, -64[rbp]
	lea	rcx, eb_let[rip]
	mov	rax, QWORD PTR -16[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_let
	mov	QWORD PTR -24[rbp], rax
	mov	rax, QWORD PTR -24[rbp]
	add	rsp, 96
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_parse_toplevel_single1f1f1f1f1f2f
	.def	eb_parse_toplevel_single1f1f1f1f1f2f;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_parse_toplevel_single1f1f1f1f1f2f
eb_parse_toplevel_single1f1f1f1f1f2f:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 80
	.seh_stackalloc	80
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	QWORD PTR 24[rbp], rdx
	mov	QWORD PTR 32[rbp], r8
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -8[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 32
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -16[rbp], rax
	lea	rcx, eb_ast_extern[rip]
	mov	rax, QWORD PTR -16[rbp]
	mov	rdx, rax
	call	eb_ast_extern
	mov	QWORD PTR -24[rbp], rax
	mov	rax, QWORD PTR 32[rbp]
	mov	QWORD PTR -32[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 40
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -40[rbp], rax
	mov	rax, QWORD PTR -8[rbp]
	mov	rax, QWORD PTR [rax]
	mov	r10, rax
	mov	r8, QWORD PTR -40[rbp]
	mov	rcx, QWORD PTR -32[rbp]
	mov	rdx, QWORD PTR -24[rbp]
	mov	rax, QWORD PTR -8[rbp]
	mov	r9, r8
	mov	r8, rcx
	mov	rcx, rax
	call	r10
	mov	QWORD PTR -48[rbp], rax
	mov	rax, QWORD PTR -48[rbp]
	add	rsp, 80
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_parse_toplevel_single1f1f1f1f1f3f02f
	.def	eb_parse_toplevel_single1f1f1f1f1f3f02f;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_parse_toplevel_single1f1f1f1f1f3f02f
eb_parse_toplevel_single1f1f1f1f1f3f02f:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 64
	.seh_stackalloc	64
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	QWORD PTR 24[rbp], rdx
	mov	QWORD PTR 32[rbp], r8
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -8[rbp], rax
	mov	rax, QWORD PTR 32[rbp]
	mov	QWORD PTR -16[rbp], rax
	lea	rcx, eb_binding_table_append[rip]
	mov	rdx, QWORD PTR -16[rbp]
	mov	rax, QWORD PTR -8[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_binding_table_append
	mov	QWORD PTR -24[rbp], rax
	mov	rax, QWORD PTR -24[rbp]
	add	rsp, 64
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_parse_toplevel_single1f1f1f1f1f3f1f2f
	.def	eb_parse_toplevel_single1f1f1f1f1f3f1f2f;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_parse_toplevel_single1f1f1f1f1f3f1f2f
eb_parse_toplevel_single1f1f1f1f1f3f1f2f:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 96
	.seh_stackalloc	96
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	QWORD PTR 24[rbp], rdx
	mov	QWORD PTR 32[rbp], r8
	mov	QWORD PTR 40[rbp], r9
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -8[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 40
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -16[rbp], rax
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -24[rbp], rax
	lea	rcx, eb_ast_function[rip]
	mov	rdx, QWORD PTR -24[rbp]
	mov	rax, QWORD PTR -16[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_ast_function
	mov	QWORD PTR -32[rbp], rax
	mov	rax, QWORD PTR 32[rbp]
	mov	QWORD PTR -40[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 48
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -48[rbp], rax
	mov	rax, QWORD PTR -8[rbp]
	mov	rax, QWORD PTR [rax]
	mov	r10, rax
	mov	r8, QWORD PTR -48[rbp]
	mov	rcx, QWORD PTR -40[rbp]
	mov	rdx, QWORD PTR -32[rbp]
	mov	rax, QWORD PTR -8[rbp]
	mov	r9, r8
	mov	r8, rcx
	mov	rcx, rax
	call	r10
	mov	QWORD PTR -56[rbp], rax
	mov	rax, QWORD PTR -56[rbp]
	add	rsp, 96
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_parse_toplevel_single1f1f1f1f1f3f1f3f
	.def	eb_parse_toplevel_single1f1f1f1f1f3f1f3f;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_parse_toplevel_single1f1f1f1f1f3f1f3f
eb_parse_toplevel_single1f1f1f1f1f3f1f3f:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 64
	.seh_stackalloc	64
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	QWORD PTR 24[rbp], rdx
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -8[rbp], rax
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -16[rbp], rax
	mov	rax, QWORD PTR -8[rbp]
	mov	rax, QWORD PTR [rax]
	mov	r8, rax
	mov	rdx, QWORD PTR -16[rbp]
	mov	rax, QWORD PTR -8[rbp]
	mov	rcx, rax
	call	r8
	mov	QWORD PTR -24[rbp], rax
	mov	rax, QWORD PTR -24[rbp]
	add	rsp, 64
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_parse_toplevel_single1f1f1f1f1f3f1f
	.def	eb_parse_toplevel_single1f1f1f1f1f3f1f;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_parse_toplevel_single1f1f1f1f1f3f1f
eb_parse_toplevel_single1f1f1f1f1f3f1f:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 160
	.seh_stackalloc	160
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	QWORD PTR 24[rbp], rdx
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 32
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -8[rbp], rax
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -16[rbp], rax
	lea	rax, eb_parse_toplevel_single1f1f1f1f1f3f1f2f[rip]
	mov	QWORD PTR -80[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 16
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -72[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 24
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -64[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 32
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -56[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 40
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -48[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 48
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -40[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 56
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -32[rbp], rax
	lea	rax, eb_parse_toplevel_single1f1f1f1f1f3f1f3f[rip]
	mov	QWORD PTR -112[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -104[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 64
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -96[rbp], rax
	lea	rdx, -112[rbp]
	lea	r9, -80[rbp]
	lea	rcx, eb_parse_expr[rip]
	mov	r8, QWORD PTR -16[rbp]
	mov	rax, QWORD PTR -8[rbp]
	mov	QWORD PTR 32[rsp], rdx
	mov	rdx, rax
	call	eb_parse_expr
	mov	QWORD PTR -24[rbp], rax
	mov	rax, QWORD PTR -24[rbp]
	add	rsp, 160
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_parse_toplevel_single1f1f1f1f1f3f
	.def	eb_parse_toplevel_single1f1f1f1f1f3f;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_parse_toplevel_single1f1f1f1f1f3f
eb_parse_toplevel_single1f1f1f1f1f3f:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 160
	.seh_stackalloc	160
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	QWORD PTR 24[rbp], rdx
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 64
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -8[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 48
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -16[rbp], rax
	lea	rcx, eb_get_binding_args[rip]
	mov	rax, QWORD PTR -16[rbp]
	mov	rdx, rax
	call	eb_get_binding_args
	mov	QWORD PTR -24[rbp], rax
	lea	rax, eb_parse_toplevel_single1f1f1f1f1f3f02f[rip]
	mov	QWORD PTR -48[rbp], rax
	lea	r8, -48[rbp]
	lea	rcx, eb_fold[rip]
	mov	rdx, QWORD PTR -24[rbp]
	mov	rax, QWORD PTR -8[rbp]
	mov	r9, r8
	mov	r8, rdx
	mov	rdx, rax
	call	eb_fold
	mov	QWORD PTR -32[rbp], rax
	lea	rax, eb_parse_toplevel_single1f1f1f1f1f3f1f[rip]
	mov	QWORD PTR -128[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -120[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 16
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -112[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 24
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -104[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 32
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -96[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 40
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -88[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 56
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -80[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 64
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -72[rbp], rax
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -64[rbp], rax
	lea	rdx, -128[rbp]
	lea	rcx, eb_let[rip]
	mov	rax, QWORD PTR -32[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_let
	mov	QWORD PTR -40[rbp], rax
	mov	rax, QWORD PTR -40[rbp]
	add	rsp, 160
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_parse_toplevel_single1f1f1f1f1f
	.def	eb_parse_toplevel_single1f1f1f1f1f;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_parse_toplevel_single1f1f1f1f1f
eb_parse_toplevel_single1f1f1f1f1f:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 208
	.seh_stackalloc	208
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	QWORD PTR 24[rbp], rdx
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 32
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -8[rbp], rax
	lea	rcx, eb_strip[rip]
	mov	rax, QWORD PTR -8[rbp]
	mov	rdx, rax
	call	eb_strip
	mov	QWORD PTR -16[rbp], rax
	mov	QWORD PTR -24[rbp], 63
	lea	rax, eb_parse_toplevel_single1f1f1f1f1f2f[rip]
	mov	QWORD PTR -80[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 16
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -72[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 24
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -64[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 32
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -56[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 56
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -48[rbp], rax
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -40[rbp], rax
	lea	rax, eb_parse_toplevel_single1f1f1f1f1f3f[rip]
	mov	QWORD PTR -160[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -152[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 16
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -144[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 24
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -136[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 32
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -128[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 40
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -120[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 48
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -112[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 56
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -104[rbp], rax
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -96[rbp], rax
	lea	rdx, -160[rbp]
	lea	r9, -80[rbp]
	lea	rcx, eb_parse_value[rip]
	mov	r8, QWORD PTR -24[rbp]
	mov	rax, QWORD PTR -16[rbp]
	mov	QWORD PTR 32[rsp], rdx
	mov	rdx, rax
	call	eb_parse_value
	mov	QWORD PTR -32[rbp], rax
	mov	rax, QWORD PTR -32[rbp]
	add	rsp, 208
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_parse_toplevel_single1f1f1f1f
	.def	eb_parse_toplevel_single1f1f1f1f;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_parse_toplevel_single1f1f1f1f
eb_parse_toplevel_single1f1f1f1f:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	add	rsp, -128
	.seh_stackalloc	128
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	QWORD PTR 24[rbp], rdx
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 24
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -8[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 56
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -16[rbp], rax
	lea	rcx, eb_binding_table_append[rip]
	mov	rdx, QWORD PTR -16[rbp]
	mov	rax, QWORD PTR -8[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_binding_table_append
	mov	QWORD PTR -24[rbp], rax
	lea	rax, eb_parse_toplevel_single1f1f1f1f1f[rip]
	mov	QWORD PTR -96[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -88[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 16
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -80[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 32
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -72[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 40
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -64[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 48
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -56[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 56
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -48[rbp], rax
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -40[rbp], rax
	lea	rdx, -96[rbp]
	lea	rcx, eb_let[rip]
	mov	rax, QWORD PTR -24[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_let
	mov	QWORD PTR -32[rbp], rax
	mov	rax, QWORD PTR -32[rbp]
	sub	rsp, -128
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_parse_toplevel_single1f1f1f
	.def	eb_parse_toplevel_single1f1f1f;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_parse_toplevel_single1f1f1f
eb_parse_toplevel_single1f1f1f:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	add	rsp, -128
	.seh_stackalloc	128
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 56
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -8[rbp], rax
	lea	rcx, eb_binding_to_ast[rip]
	mov	rax, QWORD PTR -8[rbp]
	mov	rdx, rax
	call	eb_binding_to_ast
	mov	QWORD PTR -16[rbp], rax
	lea	rax, eb_parse_toplevel_single1f1f1f1f[rip]
	mov	QWORD PTR -96[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -88[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 16
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -80[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 24
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -72[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 32
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -64[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 40
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -56[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 48
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -48[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 56
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -40[rbp], rax
	lea	rdx, -96[rbp]
	lea	rcx, eb_let[rip]
	mov	rax, QWORD PTR -16[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_let
	mov	QWORD PTR -24[rbp], rax
	mov	rax, QWORD PTR -24[rbp]
	sub	rsp, -128
	pop	rbp
	ret
	.seh_endproc
	.section .rdata,"dr"
	.align 8
.LC21:
	.ascii "expected toplevel function, not scalar\0"
	.text
	.globl	eb_parse_toplevel_single1f1f2f
	.def	eb_parse_toplevel_single1f1f2f;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_parse_toplevel_single1f1f2f
eb_parse_toplevel_single1f1f2f:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 80
	.seh_stackalloc	80
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -8[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 24
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -16[rbp], rax
	lea	rcx, eb_state_pos[rip]
	mov	rax, QWORD PTR -16[rbp]
	mov	rdx, rax
	call	eb_state_pos
	mov	QWORD PTR -24[rbp], rax
	lea	rax, .LC21[rip]
	mov	rdx, rax
	lea	rax, eb_parse_toplevel_single1f1f2f01.66[rip]
	mov	rcx, rax
	call	ebz_stol
	mov	rdx, QWORD PTR eb_parse_toplevel_single1f1f2f01.66[rip]
	lea	rcx, eb_error_from_position[rip]
	mov	rax, QWORD PTR -24[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_error_from_position
	mov	QWORD PTR -32[rbp], rax
	mov	rax, QWORD PTR -8[rbp]
	mov	rax, QWORD PTR [rax]
	mov	r8, rax
	mov	rdx, QWORD PTR -32[rbp]
	mov	rax, QWORD PTR -8[rbp]
	mov	rcx, rax
	call	r8
	mov	QWORD PTR -40[rbp], rax
	mov	rax, QWORD PTR -40[rbp]
	add	rsp, 80
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_parse_toplevel_single1f1f
	.def	eb_parse_toplevel_single1f1f;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_parse_toplevel_single1f1f
eb_parse_toplevel_single1f1f:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 160
	.seh_stackalloc	160
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	QWORD PTR 24[rbp], rdx
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -8[rbp], rax
	lea	rcx, eb_binding_is_lambda[rip]
	mov	rax, QWORD PTR -8[rbp]
	mov	rdx, rax
	call	eb_binding_is_lambda
	mov	QWORD PTR -16[rbp], rax
	lea	rax, eb_parse_toplevel_single1f1f1f[rip]
	mov	QWORD PTR -96[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -88[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 16
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -80[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 24
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -72[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 32
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -64[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 40
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -56[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 48
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -48[rbp], rax
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -40[rbp], rax
	lea	rax, eb_parse_toplevel_single1f1f2f[rip]
	mov	QWORD PTR -128[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -120[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 32
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -112[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 40
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -104[rbp], rax
	lea	r8, -128[rbp]
	lea	rdx, -96[rbp]
	lea	rcx, eb_if[rip]
	mov	rax, QWORD PTR -16[rbp]
	mov	r9, r8
	mov	r8, rdx
	mov	rdx, rax
	call	eb_if
	mov	QWORD PTR -24[rbp], rax
	mov	rax, QWORD PTR -24[rbp]
	add	rsp, 160
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_parse_toplevel_single1f
	.def	eb_parse_toplevel_single1f;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_parse_toplevel_single1f
eb_parse_toplevel_single1f:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 112
	.seh_stackalloc	112
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	QWORD PTR 24[rbp], rdx
	mov	QWORD PTR 32[rbp], r8
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -8[rbp], rax
	lea	rax, eb_parse_toplevel_single1f1f[rip]
	mov	QWORD PTR -80[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -72[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 16
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -64[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 24
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -56[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 32
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -48[rbp], rax
	mov	rax, QWORD PTR 32[rbp]
	mov	QWORD PTR -40[rbp], rax
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -32[rbp], rax
	lea	rdx, -80[rbp]
	lea	rcx, eb_let[rip]
	mov	rax, QWORD PTR -8[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_let
	mov	QWORD PTR -16[rbp], rax
	mov	rax, QWORD PTR -16[rbp]
	add	rsp, 112
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_parse_toplevel_single2f
	.def	eb_parse_toplevel_single2f;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_parse_toplevel_single2f
eb_parse_toplevel_single2f:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 64
	.seh_stackalloc	64
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	QWORD PTR 24[rbp], rdx
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -8[rbp], rax
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -16[rbp], rax
	mov	rax, QWORD PTR -8[rbp]
	mov	rax, QWORD PTR [rax]
	mov	r8, rax
	mov	rdx, QWORD PTR -16[rbp]
	mov	rax, QWORD PTR -8[rbp]
	mov	rcx, rax
	call	r8
	mov	QWORD PTR -24[rbp], rax
	mov	rax, QWORD PTR -24[rbp]
	add	rsp, 64
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_parse_toplevel_single
	.def	eb_parse_toplevel_single;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_parse_toplevel_single
eb_parse_toplevel_single:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 112
	.seh_stackalloc	112
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	QWORD PTR 24[rbp], rdx
	mov	QWORD PTR 32[rbp], r8
	mov	QWORD PTR 40[rbp], r9
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -8[rbp], rax
	lea	rax, eb_parse_toplevel_single1f[rip]
	mov	QWORD PTR -64[rbp], rax
	mov	rax, QWORD PTR 48[rbp]
	mov	QWORD PTR -56[rbp], rax
	mov	rax, QWORD PTR 40[rbp]
	mov	QWORD PTR -48[rbp], rax
	mov	rax, QWORD PTR 32[rbp]
	mov	QWORD PTR -40[rbp], rax
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -32[rbp], rax
	lea	rax, eb_parse_toplevel_single2f[rip]
	mov	QWORD PTR -80[rbp], rax
	mov	rax, QWORD PTR 48[rbp]
	mov	QWORD PTR -72[rbp], rax
	lea	r8, -80[rbp]
	lea	rdx, -64[rbp]
	lea	rcx, eb_parse_args[rip]
	mov	rax, QWORD PTR -8[rbp]
	mov	r9, r8
	mov	r8, rdx
	mov	rdx, rax
	call	eb_parse_args
	mov	QWORD PTR -16[rbp], rax
	mov	rax, QWORD PTR -16[rbp]
	add	rsp, 112
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_parse_toplevel1f
	.def	eb_parse_toplevel1f;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_parse_toplevel1f
eb_parse_toplevel1f:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 80
	.seh_stackalloc	80
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -8[rbp], rax
	mov	QWORD PTR -16[rbp], 0
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 24
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -24[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 16
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -32[rbp], rax
	mov	rax, QWORD PTR -8[rbp]
	mov	rax, QWORD PTR [rax]
	mov	r10, rax
	mov	r8, QWORD PTR -32[rbp]
	mov	rcx, QWORD PTR -24[rbp]
	mov	rdx, QWORD PTR -16[rbp]
	mov	rax, QWORD PTR -8[rbp]
	mov	r9, r8
	mov	r8, rcx
	mov	rcx, rax
	call	r10
	mov	QWORD PTR -40[rbp], rax
	mov	rax, QWORD PTR -40[rbp]
	add	rsp, 80
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_parse_toplevel2f2f2f
	.def	eb_parse_toplevel2f2f2f;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_parse_toplevel2f2f2f
eb_parse_toplevel2f2f2f:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 96
	.seh_stackalloc	96
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	QWORD PTR 24[rbp], rdx
	mov	QWORD PTR 32[rbp], r8
	mov	QWORD PTR 40[rbp], r9
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -8[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 48
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -16[rbp], rax
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -24[rbp], rax
	lea	rcx, eb_cons[rip]
	mov	rdx, QWORD PTR -24[rbp]
	mov	rax, QWORD PTR -16[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_cons
	mov	QWORD PTR -32[rbp], rax
	mov	rax, QWORD PTR 32[rbp]
	mov	QWORD PTR -40[rbp], rax
	mov	rax, QWORD PTR 40[rbp]
	mov	QWORD PTR -48[rbp], rax
	mov	rax, QWORD PTR -8[rbp]
	mov	rax, QWORD PTR [rax]
	mov	r10, rax
	mov	r8, QWORD PTR -48[rbp]
	mov	rcx, QWORD PTR -40[rbp]
	mov	rdx, QWORD PTR -32[rbp]
	mov	rax, QWORD PTR -8[rbp]
	mov	r9, r8
	mov	r8, rcx
	mov	rcx, rax
	call	r10
	mov	QWORD PTR -56[rbp], rax
	mov	rax, QWORD PTR -56[rbp]
	add	rsp, 96
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_parse_toplevel2f2f3f
	.def	eb_parse_toplevel2f2f3f;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_parse_toplevel2f2f3f
eb_parse_toplevel2f2f3f:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 64
	.seh_stackalloc	64
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	QWORD PTR 24[rbp], rdx
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -8[rbp], rax
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -16[rbp], rax
	mov	rax, QWORD PTR -8[rbp]
	mov	rax, QWORD PTR [rax]
	mov	r8, rax
	mov	rdx, QWORD PTR -16[rbp]
	mov	rax, QWORD PTR -8[rbp]
	mov	rcx, rax
	call	r8
	mov	QWORD PTR -24[rbp], rax
	mov	rax, QWORD PTR -24[rbp]
	add	rsp, 64
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_parse_toplevel2f2f
	.def	eb_parse_toplevel2f2f;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_parse_toplevel2f2f
eb_parse_toplevel2f2f:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 144
	.seh_stackalloc	144
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	QWORD PTR 24[rbp], rdx
	mov	QWORD PTR 32[rbp], r8
	mov	QWORD PTR 40[rbp], r9
	mov	rax, QWORD PTR 32[rbp]
	mov	QWORD PTR -8[rbp], rax
	mov	rax, QWORD PTR 40[rbp]
	mov	QWORD PTR -16[rbp], rax
	lea	rax, eb_parse_toplevel2f2f2f[rip]
	mov	QWORD PTR -80[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 16
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -72[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 24
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -64[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 32
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -56[rbp], rax
	mov	rax, QWORD PTR 40[rbp]
	mov	QWORD PTR -48[rbp], rax
	mov	rax, QWORD PTR 32[rbp]
	mov	QWORD PTR -40[rbp], rax
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -32[rbp], rax
	lea	rax, eb_parse_toplevel2f2f3f[rip]
	mov	QWORD PTR -96[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -88[rbp], rax
	lea	rdx, -96[rbp]
	lea	r9, -80[rbp]
	lea	rcx, eb_parse_toplevel[rip]
	mov	r8, QWORD PTR -16[rbp]
	mov	rax, QWORD PTR -8[rbp]
	mov	QWORD PTR 32[rsp], rdx
	mov	rdx, rax
	call	eb_parse_toplevel
	mov	QWORD PTR -24[rbp], rax
	mov	rax, QWORD PTR -24[rbp]
	add	rsp, 144
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_parse_toplevel2f3f
	.def	eb_parse_toplevel2f3f;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_parse_toplevel2f3f
eb_parse_toplevel2f3f:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 64
	.seh_stackalloc	64
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	QWORD PTR 24[rbp], rdx
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -8[rbp], rax
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -16[rbp], rax
	mov	rax, QWORD PTR -8[rbp]
	mov	rax, QWORD PTR [rax]
	mov	r8, rax
	mov	rdx, QWORD PTR -16[rbp]
	mov	rax, QWORD PTR -8[rbp]
	mov	rcx, rax
	call	r8
	mov	QWORD PTR -24[rbp], rax
	mov	rax, QWORD PTR -24[rbp]
	add	rsp, 64
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_parse_toplevel2f
	.def	eb_parse_toplevel2f;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_parse_toplevel2f
eb_parse_toplevel2f:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	add	rsp, -128
	.seh_stackalloc	128
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 32
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -8[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 24
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -16[rbp], rax
	lea	rax, eb_parse_toplevel2f2f[rip]
	mov	QWORD PTR -64[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -56[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 16
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -48[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 24
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -40[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 32
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -32[rbp], rax
	lea	rax, eb_parse_toplevel2f3f[rip]
	mov	QWORD PTR -80[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -72[rbp], rax
	lea	rdx, -80[rbp]
	lea	r9, -64[rbp]
	lea	rcx, eb_parse_toplevel_single[rip]
	mov	r8, QWORD PTR -16[rbp]
	mov	rax, QWORD PTR -8[rbp]
	mov	QWORD PTR 32[rsp], rdx
	mov	rdx, rax
	call	eb_parse_toplevel_single
	mov	QWORD PTR -24[rbp], rax
	mov	rax, QWORD PTR -24[rbp]
	sub	rsp, -128
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_parse_toplevel
	.def	eb_parse_toplevel;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_parse_toplevel
eb_parse_toplevel:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 160
	.seh_stackalloc	160
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	QWORD PTR 24[rbp], rdx
	mov	QWORD PTR 32[rbp], r8
	mov	QWORD PTR 40[rbp], r9
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -8[rbp], rax
	lea	rcx, eb_strip[rip]
	mov	rax, QWORD PTR -8[rbp]
	mov	rdx, rax
	call	eb_strip
	mov	QWORD PTR -16[rbp], rax
	lea	rcx, eb_state_has_data[rip]
	mov	rax, QWORD PTR -16[rbp]
	mov	rdx, rax
	call	eb_state_has_data
	mov	QWORD PTR -24[rbp], rax
	lea	rcx, eb_not[rip]
	mov	rax, QWORD PTR -24[rbp]
	mov	rdx, rax
	call	eb_not
	mov	QWORD PTR -32[rbp], rax
	lea	rax, eb_parse_toplevel1f[rip]
	mov	QWORD PTR -80[rbp], rax
	mov	rax, QWORD PTR 40[rbp]
	mov	QWORD PTR -72[rbp], rax
	mov	rax, QWORD PTR 32[rbp]
	mov	QWORD PTR -64[rbp], rax
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -56[rbp], rax
	lea	rax, eb_parse_toplevel2f[rip]
	mov	QWORD PTR -128[rbp], rax
	mov	rax, QWORD PTR 48[rbp]
	mov	QWORD PTR -120[rbp], rax
	mov	rax, QWORD PTR 40[rbp]
	mov	QWORD PTR -112[rbp], rax
	mov	rax, QWORD PTR 32[rbp]
	mov	QWORD PTR -104[rbp], rax
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -96[rbp], rax
	lea	r8, -128[rbp]
	lea	rdx, -80[rbp]
	lea	rcx, eb_if[rip]
	mov	rax, QWORD PTR -32[rbp]
	mov	r9, r8
	mov	r8, rdx
	mov	rdx, rax
	call	eb_if
	mov	QWORD PTR -40[rbp], rax
	mov	rax, QWORD PTR -40[rbp]
	add	rsp, 160
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_defs_append
	.def	eb_defs_append;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_defs_append
eb_defs_append:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 80
	.seh_stackalloc	80
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	QWORD PTR 24[rbp], rdx
	mov	QWORD PTR 32[rbp], r8
	mov	QWORD PTR 40[rbp], r9
	mov	rax, QWORD PTR 32[rbp]
	mov	QWORD PTR -8[rbp], rax
	mov	rax, QWORD PTR 40[rbp]
	mov	QWORD PTR -16[rbp], rax
	lea	rcx, eb_cons[rip]
	mov	rdx, QWORD PTR -16[rbp]
	mov	rax, QWORD PTR -8[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_cons
	mov	QWORD PTR -24[rbp], rax
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -32[rbp], rax
	lea	rcx, eb_cons[rip]
	mov	rdx, QWORD PTR -32[rbp]
	mov	rax, QWORD PTR -24[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_cons
	mov	QWORD PTR -40[rbp], rax
	mov	rax, QWORD PTR -40[rbp]
	add	rsp, 80
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_defs_lookup1f1f
	.def	eb_defs_lookup1f1f;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_defs_lookup1f1f
eb_defs_lookup1f1f:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 64
	.seh_stackalloc	64
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -8[rbp], rax
	lea	rcx, eb_car[rip]
	mov	rax, QWORD PTR -8[rbp]
	mov	rdx, rax
	call	eb_car
	mov	QWORD PTR -16[rbp], rax
	lea	rcx, eb_cdr[rip]
	mov	rax, QWORD PTR -16[rbp]
	mov	rdx, rax
	call	eb_cdr
	mov	QWORD PTR -24[rbp], rax
	mov	rax, QWORD PTR -24[rbp]
	add	rsp, 64
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_defs_lookup1f2f
	.def	eb_defs_lookup1f2f;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_defs_lookup1f2f
eb_defs_lookup1f2f:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 64
	.seh_stackalloc	64
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 16
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -8[rbp], rax
	lea	rcx, eb_cdr[rip]
	mov	rax, QWORD PTR -8[rbp]
	mov	rdx, rax
	call	eb_cdr
	mov	QWORD PTR -16[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -24[rbp], rax
	lea	rcx, eb_defs_lookup[rip]
	mov	rdx, QWORD PTR -24[rbp]
	mov	rax, QWORD PTR -16[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_defs_lookup
	mov	QWORD PTR -32[rbp], rax
	mov	rax, QWORD PTR -32[rbp]
	add	rsp, 64
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_defs_lookup1f
	.def	eb_defs_lookup1f;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_defs_lookup1f
eb_defs_lookup1f:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	add	rsp, -128
	.seh_stackalloc	128
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -8[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 16
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -16[rbp], rax
	lea	rcx, eb_car[rip]
	mov	rax, QWORD PTR -16[rbp]
	mov	rdx, rax
	call	eb_car
	mov	QWORD PTR -24[rbp], rax
	lea	rcx, eb_car[rip]
	mov	rax, QWORD PTR -24[rbp]
	mov	rdx, rax
	call	eb_car
	mov	QWORD PTR -32[rbp], rax
	lea	rcx, eb_str_eq[rip]
	mov	rdx, QWORD PTR -32[rbp]
	mov	rax, QWORD PTR -8[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_str_eq
	mov	QWORD PTR -40[rbp], rax
	lea	rax, eb_defs_lookup1f1f[rip]
	mov	QWORD PTR -64[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 16
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -56[rbp], rax
	lea	rax, eb_defs_lookup1f2f[rip]
	mov	QWORD PTR -96[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -88[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 16
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -80[rbp], rax
	lea	r8, -96[rbp]
	lea	rdx, -64[rbp]
	lea	rcx, eb_if[rip]
	mov	rax, QWORD PTR -40[rbp]
	mov	r9, r8
	mov	r8, rdx
	mov	rdx, rax
	call	eb_if
	mov	QWORD PTR -48[rbp], rax
	mov	rax, QWORD PTR -48[rbp]
	sub	rsp, -128
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_defs_lookup
	.def	eb_defs_lookup;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_defs_lookup
eb_defs_lookup:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 80
	.seh_stackalloc	80
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	QWORD PTR 24[rbp], rdx
	mov	QWORD PTR 32[rbp], r8
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -8[rbp], rax
	lea	rax, eb_defs_lookup1f[rip]
	mov	QWORD PTR -48[rbp], rax
	mov	rax, QWORD PTR 32[rbp]
	mov	QWORD PTR -40[rbp], rax
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -32[rbp], rax
	lea	rdx, -48[rbp]
	lea	rcx, eb_and[rip]
	mov	rax, QWORD PTR -8[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_and
	mov	QWORD PTR -16[rbp], rax
	mov	rax, QWORD PTR -16[rbp]
	add	rsp, 80
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_ir_form_type_error
	.def	eb_ir_form_type_error;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_ir_form_type_error
eb_ir_form_type_error:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 16
	.seh_stackalloc	16
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	QWORD PTR -8[rbp], 0
	mov	rax, QWORD PTR -8[rbp]
	add	rsp, 16
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_ir_form_type_let
	.def	eb_ir_form_type_let;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_ir_form_type_let
eb_ir_form_type_let:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 16
	.seh_stackalloc	16
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	QWORD PTR -8[rbp], 1
	mov	rax, QWORD PTR -8[rbp]
	add	rsp, 16
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_ir_form_type_block
	.def	eb_ir_form_type_block;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_ir_form_type_block
eb_ir_form_type_block:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 16
	.seh_stackalloc	16
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	QWORD PTR -8[rbp], 2
	mov	rax, QWORD PTR -8[rbp]
	add	rsp, 16
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_ir_form_type_call
	.def	eb_ir_form_type_call;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_ir_form_type_call
eb_ir_form_type_call:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 16
	.seh_stackalloc	16
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	QWORD PTR -8[rbp], 3
	mov	rax, QWORD PTR -8[rbp]
	add	rsp, 16
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_ir_form_type_function
	.def	eb_ir_form_type_function;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_ir_form_type_function
eb_ir_form_type_function:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 16
	.seh_stackalloc	16
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	QWORD PTR -8[rbp], 4
	mov	rax, QWORD PTR -8[rbp]
	add	rsp, 16
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_ir_form_type_params
	.def	eb_ir_form_type_params;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_ir_form_type_params
eb_ir_form_type_params:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 16
	.seh_stackalloc	16
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	QWORD PTR -8[rbp], 5
	mov	rax, QWORD PTR -8[rbp]
	add	rsp, 16
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_ir_form_type_let_closure
	.def	eb_ir_form_type_let_closure;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_ir_form_type_let_closure
eb_ir_form_type_let_closure:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 16
	.seh_stackalloc	16
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	QWORD PTR -8[rbp], 6
	mov	rax, QWORD PTR -8[rbp]
	add	rsp, 16
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_ir_form_type_extern
	.def	eb_ir_form_type_extern;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_ir_form_type_extern
eb_ir_form_type_extern:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 16
	.seh_stackalloc	16
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	QWORD PTR -8[rbp], 7
	mov	rax, QWORD PTR -8[rbp]
	add	rsp, 16
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_ir_form_type_return
	.def	eb_ir_form_type_return;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_ir_form_type_return
eb_ir_form_type_return:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 16
	.seh_stackalloc	16
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	QWORD PTR -8[rbp], 8
	mov	rax, QWORD PTR -8[rbp]
	add	rsp, 16
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_ir_form_type_closure_get
	.def	eb_ir_form_type_closure_get;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_ir_form_type_closure_get
eb_ir_form_type_closure_get:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 16
	.seh_stackalloc	16
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	QWORD PTR -8[rbp], 9
	mov	rax, QWORD PTR -8[rbp]
	add	rsp, 16
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_ir_form_type_let_string
	.def	eb_ir_form_type_let_string;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_ir_form_type_let_string
eb_ir_form_type_let_string:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 16
	.seh_stackalloc	16
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	QWORD PTR -8[rbp], 10
	mov	rax, QWORD PTR -8[rbp]
	add	rsp, 16
	pop	rbp
	ret
	.seh_endproc
	.section .rdata,"dr"
.LC22:
	.ascii "error\0"
	.text
	.globl	eb_ir_form_type_to_str1f
	.def	eb_ir_form_type_to_str1f;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_ir_form_type_to_str1f
eb_ir_form_type_to_str1f:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 32
	.seh_stackalloc	32
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	lea	rax, .LC22[rip]
	mov	rdx, rax
	lea	rax, eb_ir_form_type_to_str1f.65[rip]
	mov	rcx, rax
	call	ebz_stol
	mov	rax, QWORD PTR eb_ir_form_type_to_str1f.65[rip]
	add	rsp, 32
	pop	rbp
	ret
	.seh_endproc
	.section .rdata,"dr"
.LC23:
	.ascii "let\0"
	.text
	.globl	eb_ir_form_type_to_str2f1f
	.def	eb_ir_form_type_to_str2f1f;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_ir_form_type_to_str2f1f
eb_ir_form_type_to_str2f1f:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 32
	.seh_stackalloc	32
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	lea	rax, .LC23[rip]
	mov	rdx, rax
	lea	rax, eb_ir_form_type_to_str2f1f.64[rip]
	mov	rcx, rax
	call	ebz_stol
	mov	rax, QWORD PTR eb_ir_form_type_to_str2f1f.64[rip]
	add	rsp, 32
	pop	rbp
	ret
	.seh_endproc
	.section .rdata,"dr"
.LC24:
	.ascii "block\0"
	.text
	.globl	eb_ir_form_type_to_str2f2f1f
	.def	eb_ir_form_type_to_str2f2f1f;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_ir_form_type_to_str2f2f1f
eb_ir_form_type_to_str2f2f1f:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 32
	.seh_stackalloc	32
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	lea	rax, .LC24[rip]
	mov	rdx, rax
	lea	rax, eb_ir_form_type_to_str2f2f1f.63[rip]
	mov	rcx, rax
	call	ebz_stol
	mov	rax, QWORD PTR eb_ir_form_type_to_str2f2f1f.63[rip]
	add	rsp, 32
	pop	rbp
	ret
	.seh_endproc
	.section .rdata,"dr"
.LC25:
	.ascii "call\0"
	.text
	.globl	eb_ir_form_type_to_str2f2f2f1f
	.def	eb_ir_form_type_to_str2f2f2f1f;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_ir_form_type_to_str2f2f2f1f
eb_ir_form_type_to_str2f2f2f1f:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 32
	.seh_stackalloc	32
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	lea	rax, .LC25[rip]
	mov	rdx, rax
	lea	rax, eb_ir_form_type_to_str2f2f2f1f.62[rip]
	mov	rcx, rax
	call	ebz_stol
	mov	rax, QWORD PTR eb_ir_form_type_to_str2f2f2f1f.62[rip]
	add	rsp, 32
	pop	rbp
	ret
	.seh_endproc
	.section .rdata,"dr"
.LC26:
	.ascii "function\0"
	.text
	.globl	eb_ir_form_type_to_str2f2f2f2f1f
	.def	eb_ir_form_type_to_str2f2f2f2f1f;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_ir_form_type_to_str2f2f2f2f1f
eb_ir_form_type_to_str2f2f2f2f1f:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 32
	.seh_stackalloc	32
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	lea	rax, .LC26[rip]
	mov	rdx, rax
	lea	rax, eb_ir_form_type_to_str2f2f2f2f1f.61[rip]
	mov	rcx, rax
	call	ebz_stol
	mov	rax, QWORD PTR eb_ir_form_type_to_str2f2f2f2f1f.61[rip]
	add	rsp, 32
	pop	rbp
	ret
	.seh_endproc
	.section .rdata,"dr"
.LC27:
	.ascii "params\0"
	.text
	.globl	eb_ir_form_type_to_str2f2f2f2f2f1f
	.def	eb_ir_form_type_to_str2f2f2f2f2f1f;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_ir_form_type_to_str2f2f2f2f2f1f
eb_ir_form_type_to_str2f2f2f2f2f1f:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 32
	.seh_stackalloc	32
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	lea	rax, .LC27[rip]
	mov	rdx, rax
	lea	rax, eb_ir_form_type_to_str2f2f2f2f2f1f.60[rip]
	mov	rcx, rax
	call	ebz_stol
	mov	rax, QWORD PTR eb_ir_form_type_to_str2f2f2f2f2f1f.60[rip]
	add	rsp, 32
	pop	rbp
	ret
	.seh_endproc
	.section .rdata,"dr"
.LC28:
	.ascii "let-closure\0"
	.text
	.globl	eb_ir_form_type_to_str2f2f2f2f2f2f1f
	.def	eb_ir_form_type_to_str2f2f2f2f2f2f1f;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_ir_form_type_to_str2f2f2f2f2f2f1f
eb_ir_form_type_to_str2f2f2f2f2f2f1f:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 32
	.seh_stackalloc	32
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	lea	rax, .LC28[rip]
	mov	rdx, rax
	lea	rax, eb_ir_form_type_to_str2f2f2f2f2f2f1f.59[rip]
	mov	rcx, rax
	call	ebz_stol
	mov	rax, QWORD PTR eb_ir_form_type_to_str2f2f2f2f2f2f1f.59[rip]
	add	rsp, 32
	pop	rbp
	ret
	.seh_endproc
	.section .rdata,"dr"
.LC29:
	.ascii "extern\0"
	.text
	.globl	eb_ir_form_type_to_str2f2f2f2f2f2f2f1f
	.def	eb_ir_form_type_to_str2f2f2f2f2f2f2f1f;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_ir_form_type_to_str2f2f2f2f2f2f2f1f
eb_ir_form_type_to_str2f2f2f2f2f2f2f1f:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 32
	.seh_stackalloc	32
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	lea	rax, .LC29[rip]
	mov	rdx, rax
	lea	rax, eb_ir_form_type_to_str2f2f2f2f2f2f2f1f.58[rip]
	mov	rcx, rax
	call	ebz_stol
	mov	rax, QWORD PTR eb_ir_form_type_to_str2f2f2f2f2f2f2f1f.58[rip]
	add	rsp, 32
	pop	rbp
	ret
	.seh_endproc
	.section .rdata,"dr"
.LC30:
	.ascii "return\0"
	.text
	.globl	eb_ir_form_type_to_str2f2f2f2f2f2f2f2f1f
	.def	eb_ir_form_type_to_str2f2f2f2f2f2f2f2f1f;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_ir_form_type_to_str2f2f2f2f2f2f2f2f1f
eb_ir_form_type_to_str2f2f2f2f2f2f2f2f1f:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 32
	.seh_stackalloc	32
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	lea	rax, .LC30[rip]
	mov	rdx, rax
	lea	rax, eb_ir_form_type_to_str2f2f2f2f2f2f2f2f1f.57[rip]
	mov	rcx, rax
	call	ebz_stol
	mov	rax, QWORD PTR eb_ir_form_type_to_str2f2f2f2f2f2f2f2f1f.57[rip]
	add	rsp, 32
	pop	rbp
	ret
	.seh_endproc
	.section .rdata,"dr"
.LC31:
	.ascii "closure-get\0"
	.text
	.globl	eb_ir_form_type_to_str2f2f2f2f2f2f2f2f2f1f
	.def	eb_ir_form_type_to_str2f2f2f2f2f2f2f2f2f1f;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_ir_form_type_to_str2f2f2f2f2f2f2f2f2f1f
eb_ir_form_type_to_str2f2f2f2f2f2f2f2f2f1f:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 32
	.seh_stackalloc	32
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	lea	rax, .LC31[rip]
	mov	rdx, rax
	lea	rax, eb_ir_form_type_to_str2f2f2f2f2f2f2f2f2f1f.56[rip]
	mov	rcx, rax
	call	ebz_stol
	mov	rax, QWORD PTR eb_ir_form_type_to_str2f2f2f2f2f2f2f2f2f1f.56[rip]
	add	rsp, 32
	pop	rbp
	ret
	.seh_endproc
	.section .rdata,"dr"
.LC32:
	.ascii "let-string\0"
	.text
	.globl	eb_ir_form_type_to_str2f2f2f2f2f2f2f2f2f2f1f
	.def	eb_ir_form_type_to_str2f2f2f2f2f2f2f2f2f2f1f;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_ir_form_type_to_str2f2f2f2f2f2f2f2f2f2f1f
eb_ir_form_type_to_str2f2f2f2f2f2f2f2f2f2f1f:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 32
	.seh_stackalloc	32
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	lea	rax, .LC32[rip]
	mov	rdx, rax
	lea	rax, eb_ir_form_type_to_str2f2f2f2f2f2f2f2f2f2f1f.55[rip]
	mov	rcx, rax
	call	ebz_stol
	mov	rax, QWORD PTR eb_ir_form_type_to_str2f2f2f2f2f2f2f2f2f2f1f.55[rip]
	add	rsp, 32
	pop	rbp
	ret
	.seh_endproc
	.section .rdata,"dr"
.LC33:
	.ascii "unknown\0"
	.text
	.globl	eb_ir_form_type_to_str2f2f2f2f2f2f2f2f2f2f2f
	.def	eb_ir_form_type_to_str2f2f2f2f2f2f2f2f2f2f2f;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_ir_form_type_to_str2f2f2f2f2f2f2f2f2f2f2f
eb_ir_form_type_to_str2f2f2f2f2f2f2f2f2f2f2f:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 32
	.seh_stackalloc	32
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	lea	rax, .LC33[rip]
	mov	rdx, rax
	lea	rax, eb_ir_form_type_to_str2f2f2f2f2f2f2f2f2f2f2f.54[rip]
	mov	rcx, rax
	call	ebz_stol
	mov	rax, QWORD PTR eb_ir_form_type_to_str2f2f2f2f2f2f2f2f2f2f2f.54[rip]
	add	rsp, 32
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_ir_form_type_to_str2f2f2f2f2f2f2f2f2f2f
	.def	eb_ir_form_type_to_str2f2f2f2f2f2f2f2f2f2f;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_ir_form_type_to_str2f2f2f2f2f2f2f2f2f2f
eb_ir_form_type_to_str2f2f2f2f2f2f2f2f2f2f:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 80
	.seh_stackalloc	80
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -8[rbp], rax
	lea	rax, eb_ir_form_type_let_string[rip]
	mov	rcx, rax
	call	eb_ir_form_type_let_string
	mov	QWORD PTR -16[rbp], rax
	lea	rcx, eb_equal[rip]
	mov	rdx, QWORD PTR -16[rbp]
	mov	rax, QWORD PTR -8[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_equal
	mov	QWORD PTR -24[rbp], rax
	lea	rax, eb_ir_form_type_to_str2f2f2f2f2f2f2f2f2f2f1f[rip]
	mov	QWORD PTR -40[rbp], rax
	lea	rax, eb_ir_form_type_to_str2f2f2f2f2f2f2f2f2f2f2f[rip]
	mov	QWORD PTR -48[rbp], rax
	lea	r8, -48[rbp]
	lea	rdx, -40[rbp]
	lea	rcx, eb_if[rip]
	mov	rax, QWORD PTR -24[rbp]
	mov	r9, r8
	mov	r8, rdx
	mov	rdx, rax
	call	eb_if
	mov	QWORD PTR -32[rbp], rax
	mov	rax, QWORD PTR -32[rbp]
	add	rsp, 80
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_ir_form_type_to_str2f2f2f2f2f2f2f2f2f
	.def	eb_ir_form_type_to_str2f2f2f2f2f2f2f2f2f;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_ir_form_type_to_str2f2f2f2f2f2f2f2f2f
eb_ir_form_type_to_str2f2f2f2f2f2f2f2f2f:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 96
	.seh_stackalloc	96
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -8[rbp], rax
	lea	rax, eb_ir_form_type_closure_get[rip]
	mov	rcx, rax
	call	eb_ir_form_type_closure_get
	mov	QWORD PTR -16[rbp], rax
	lea	rcx, eb_equal[rip]
	mov	rdx, QWORD PTR -16[rbp]
	mov	rax, QWORD PTR -8[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_equal
	mov	QWORD PTR -24[rbp], rax
	lea	rax, eb_ir_form_type_to_str2f2f2f2f2f2f2f2f2f1f[rip]
	mov	QWORD PTR -40[rbp], rax
	lea	rax, eb_ir_form_type_to_str2f2f2f2f2f2f2f2f2f2f[rip]
	mov	QWORD PTR -64[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -56[rbp], rax
	lea	r8, -64[rbp]
	lea	rdx, -40[rbp]
	lea	rcx, eb_if[rip]
	mov	rax, QWORD PTR -24[rbp]
	mov	r9, r8
	mov	r8, rdx
	mov	rdx, rax
	call	eb_if
	mov	QWORD PTR -32[rbp], rax
	mov	rax, QWORD PTR -32[rbp]
	add	rsp, 96
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_ir_form_type_to_str2f2f2f2f2f2f2f2f
	.def	eb_ir_form_type_to_str2f2f2f2f2f2f2f2f;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_ir_form_type_to_str2f2f2f2f2f2f2f2f
eb_ir_form_type_to_str2f2f2f2f2f2f2f2f:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 96
	.seh_stackalloc	96
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -8[rbp], rax
	lea	rax, eb_ir_form_type_return[rip]
	mov	rcx, rax
	call	eb_ir_form_type_return
	mov	QWORD PTR -16[rbp], rax
	lea	rcx, eb_equal[rip]
	mov	rdx, QWORD PTR -16[rbp]
	mov	rax, QWORD PTR -8[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_equal
	mov	QWORD PTR -24[rbp], rax
	lea	rax, eb_ir_form_type_to_str2f2f2f2f2f2f2f2f1f[rip]
	mov	QWORD PTR -40[rbp], rax
	lea	rax, eb_ir_form_type_to_str2f2f2f2f2f2f2f2f2f[rip]
	mov	QWORD PTR -64[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -56[rbp], rax
	lea	r8, -64[rbp]
	lea	rdx, -40[rbp]
	lea	rcx, eb_if[rip]
	mov	rax, QWORD PTR -24[rbp]
	mov	r9, r8
	mov	r8, rdx
	mov	rdx, rax
	call	eb_if
	mov	QWORD PTR -32[rbp], rax
	mov	rax, QWORD PTR -32[rbp]
	add	rsp, 96
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_ir_form_type_to_str2f2f2f2f2f2f2f
	.def	eb_ir_form_type_to_str2f2f2f2f2f2f2f;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_ir_form_type_to_str2f2f2f2f2f2f2f
eb_ir_form_type_to_str2f2f2f2f2f2f2f:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 96
	.seh_stackalloc	96
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -8[rbp], rax
	lea	rax, eb_ir_form_type_extern[rip]
	mov	rcx, rax
	call	eb_ir_form_type_extern
	mov	QWORD PTR -16[rbp], rax
	lea	rcx, eb_equal[rip]
	mov	rdx, QWORD PTR -16[rbp]
	mov	rax, QWORD PTR -8[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_equal
	mov	QWORD PTR -24[rbp], rax
	lea	rax, eb_ir_form_type_to_str2f2f2f2f2f2f2f1f[rip]
	mov	QWORD PTR -40[rbp], rax
	lea	rax, eb_ir_form_type_to_str2f2f2f2f2f2f2f2f[rip]
	mov	QWORD PTR -64[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -56[rbp], rax
	lea	r8, -64[rbp]
	lea	rdx, -40[rbp]
	lea	rcx, eb_if[rip]
	mov	rax, QWORD PTR -24[rbp]
	mov	r9, r8
	mov	r8, rdx
	mov	rdx, rax
	call	eb_if
	mov	QWORD PTR -32[rbp], rax
	mov	rax, QWORD PTR -32[rbp]
	add	rsp, 96
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_ir_form_type_to_str2f2f2f2f2f2f
	.def	eb_ir_form_type_to_str2f2f2f2f2f2f;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_ir_form_type_to_str2f2f2f2f2f2f
eb_ir_form_type_to_str2f2f2f2f2f2f:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 96
	.seh_stackalloc	96
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -8[rbp], rax
	lea	rax, eb_ir_form_type_let_closure[rip]
	mov	rcx, rax
	call	eb_ir_form_type_let_closure
	mov	QWORD PTR -16[rbp], rax
	lea	rcx, eb_equal[rip]
	mov	rdx, QWORD PTR -16[rbp]
	mov	rax, QWORD PTR -8[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_equal
	mov	QWORD PTR -24[rbp], rax
	lea	rax, eb_ir_form_type_to_str2f2f2f2f2f2f1f[rip]
	mov	QWORD PTR -40[rbp], rax
	lea	rax, eb_ir_form_type_to_str2f2f2f2f2f2f2f[rip]
	mov	QWORD PTR -64[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -56[rbp], rax
	lea	r8, -64[rbp]
	lea	rdx, -40[rbp]
	lea	rcx, eb_if[rip]
	mov	rax, QWORD PTR -24[rbp]
	mov	r9, r8
	mov	r8, rdx
	mov	rdx, rax
	call	eb_if
	mov	QWORD PTR -32[rbp], rax
	mov	rax, QWORD PTR -32[rbp]
	add	rsp, 96
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_ir_form_type_to_str2f2f2f2f2f
	.def	eb_ir_form_type_to_str2f2f2f2f2f;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_ir_form_type_to_str2f2f2f2f2f
eb_ir_form_type_to_str2f2f2f2f2f:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 96
	.seh_stackalloc	96
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -8[rbp], rax
	lea	rax, eb_ir_form_type_params[rip]
	mov	rcx, rax
	call	eb_ir_form_type_params
	mov	QWORD PTR -16[rbp], rax
	lea	rcx, eb_equal[rip]
	mov	rdx, QWORD PTR -16[rbp]
	mov	rax, QWORD PTR -8[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_equal
	mov	QWORD PTR -24[rbp], rax
	lea	rax, eb_ir_form_type_to_str2f2f2f2f2f1f[rip]
	mov	QWORD PTR -40[rbp], rax
	lea	rax, eb_ir_form_type_to_str2f2f2f2f2f2f[rip]
	mov	QWORD PTR -64[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -56[rbp], rax
	lea	r8, -64[rbp]
	lea	rdx, -40[rbp]
	lea	rcx, eb_if[rip]
	mov	rax, QWORD PTR -24[rbp]
	mov	r9, r8
	mov	r8, rdx
	mov	rdx, rax
	call	eb_if
	mov	QWORD PTR -32[rbp], rax
	mov	rax, QWORD PTR -32[rbp]
	add	rsp, 96
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_ir_form_type_to_str2f2f2f2f
	.def	eb_ir_form_type_to_str2f2f2f2f;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_ir_form_type_to_str2f2f2f2f
eb_ir_form_type_to_str2f2f2f2f:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 96
	.seh_stackalloc	96
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -8[rbp], rax
	lea	rax, eb_ir_form_type_function[rip]
	mov	rcx, rax
	call	eb_ir_form_type_function
	mov	QWORD PTR -16[rbp], rax
	lea	rcx, eb_equal[rip]
	mov	rdx, QWORD PTR -16[rbp]
	mov	rax, QWORD PTR -8[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_equal
	mov	QWORD PTR -24[rbp], rax
	lea	rax, eb_ir_form_type_to_str2f2f2f2f1f[rip]
	mov	QWORD PTR -40[rbp], rax
	lea	rax, eb_ir_form_type_to_str2f2f2f2f2f[rip]
	mov	QWORD PTR -64[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -56[rbp], rax
	lea	r8, -64[rbp]
	lea	rdx, -40[rbp]
	lea	rcx, eb_if[rip]
	mov	rax, QWORD PTR -24[rbp]
	mov	r9, r8
	mov	r8, rdx
	mov	rdx, rax
	call	eb_if
	mov	QWORD PTR -32[rbp], rax
	mov	rax, QWORD PTR -32[rbp]
	add	rsp, 96
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_ir_form_type_to_str2f2f2f
	.def	eb_ir_form_type_to_str2f2f2f;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_ir_form_type_to_str2f2f2f
eb_ir_form_type_to_str2f2f2f:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 96
	.seh_stackalloc	96
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -8[rbp], rax
	lea	rax, eb_ir_form_type_call[rip]
	mov	rcx, rax
	call	eb_ir_form_type_call
	mov	QWORD PTR -16[rbp], rax
	lea	rcx, eb_equal[rip]
	mov	rdx, QWORD PTR -16[rbp]
	mov	rax, QWORD PTR -8[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_equal
	mov	QWORD PTR -24[rbp], rax
	lea	rax, eb_ir_form_type_to_str2f2f2f1f[rip]
	mov	QWORD PTR -40[rbp], rax
	lea	rax, eb_ir_form_type_to_str2f2f2f2f[rip]
	mov	QWORD PTR -64[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -56[rbp], rax
	lea	r8, -64[rbp]
	lea	rdx, -40[rbp]
	lea	rcx, eb_if[rip]
	mov	rax, QWORD PTR -24[rbp]
	mov	r9, r8
	mov	r8, rdx
	mov	rdx, rax
	call	eb_if
	mov	QWORD PTR -32[rbp], rax
	mov	rax, QWORD PTR -32[rbp]
	add	rsp, 96
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_ir_form_type_to_str2f2f
	.def	eb_ir_form_type_to_str2f2f;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_ir_form_type_to_str2f2f
eb_ir_form_type_to_str2f2f:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 96
	.seh_stackalloc	96
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -8[rbp], rax
	lea	rax, eb_ir_form_type_block[rip]
	mov	rcx, rax
	call	eb_ir_form_type_block
	mov	QWORD PTR -16[rbp], rax
	lea	rcx, eb_equal[rip]
	mov	rdx, QWORD PTR -16[rbp]
	mov	rax, QWORD PTR -8[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_equal
	mov	QWORD PTR -24[rbp], rax
	lea	rax, eb_ir_form_type_to_str2f2f1f[rip]
	mov	QWORD PTR -40[rbp], rax
	lea	rax, eb_ir_form_type_to_str2f2f2f[rip]
	mov	QWORD PTR -64[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -56[rbp], rax
	lea	r8, -64[rbp]
	lea	rdx, -40[rbp]
	lea	rcx, eb_if[rip]
	mov	rax, QWORD PTR -24[rbp]
	mov	r9, r8
	mov	r8, rdx
	mov	rdx, rax
	call	eb_if
	mov	QWORD PTR -32[rbp], rax
	mov	rax, QWORD PTR -32[rbp]
	add	rsp, 96
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_ir_form_type_to_str2f
	.def	eb_ir_form_type_to_str2f;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_ir_form_type_to_str2f
eb_ir_form_type_to_str2f:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 96
	.seh_stackalloc	96
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -8[rbp], rax
	lea	rax, eb_ir_form_type_let[rip]
	mov	rcx, rax
	call	eb_ir_form_type_let
	mov	QWORD PTR -16[rbp], rax
	lea	rcx, eb_equal[rip]
	mov	rdx, QWORD PTR -16[rbp]
	mov	rax, QWORD PTR -8[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_equal
	mov	QWORD PTR -24[rbp], rax
	lea	rax, eb_ir_form_type_to_str2f1f[rip]
	mov	QWORD PTR -40[rbp], rax
	lea	rax, eb_ir_form_type_to_str2f2f[rip]
	mov	QWORD PTR -64[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -56[rbp], rax
	lea	r8, -64[rbp]
	lea	rdx, -40[rbp]
	lea	rcx, eb_if[rip]
	mov	rax, QWORD PTR -24[rbp]
	mov	r9, r8
	mov	r8, rdx
	mov	rdx, rax
	call	eb_if
	mov	QWORD PTR -32[rbp], rax
	mov	rax, QWORD PTR -32[rbp]
	add	rsp, 96
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_ir_form_type_to_str
	.def	eb_ir_form_type_to_str;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_ir_form_type_to_str
eb_ir_form_type_to_str:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 96
	.seh_stackalloc	96
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	QWORD PTR 24[rbp], rdx
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -8[rbp], rax
	lea	rax, eb_ir_form_type_error[rip]
	mov	rcx, rax
	call	eb_ir_form_type_error
	mov	QWORD PTR -16[rbp], rax
	lea	rcx, eb_equal[rip]
	mov	rdx, QWORD PTR -16[rbp]
	mov	rax, QWORD PTR -8[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_equal
	mov	QWORD PTR -24[rbp], rax
	lea	rax, eb_ir_form_type_to_str1f[rip]
	mov	QWORD PTR -40[rbp], rax
	lea	rax, eb_ir_form_type_to_str2f[rip]
	mov	QWORD PTR -64[rbp], rax
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -56[rbp], rax
	lea	r8, -64[rbp]
	lea	rdx, -40[rbp]
	lea	rcx, eb_if[rip]
	mov	rax, QWORD PTR -24[rbp]
	mov	r9, r8
	mov	r8, rdx
	mov	rdx, rax
	call	eb_if
	mov	QWORD PTR -32[rbp], rax
	mov	rax, QWORD PTR -32[rbp]
	add	rsp, 96
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_ir_of_form
	.def	eb_ir_of_form;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_ir_of_form
eb_ir_of_form:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 80
	.seh_stackalloc	80
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	QWORD PTR 24[rbp], rdx
	mov	QWORD PTR 32[rbp], r8
	mov	QWORD PTR -8[rbp], 0
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -16[rbp], rax
	mov	rax, QWORD PTR 32[rbp]
	mov	QWORD PTR -24[rbp], rax
	lea	rcx, eb_cons[rip]
	mov	rdx, QWORD PTR -24[rbp]
	mov	rax, QWORD PTR -16[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_cons
	mov	QWORD PTR -32[rbp], rax
	lea	rcx, eb_cons[rip]
	mov	rdx, QWORD PTR -32[rbp]
	mov	rax, QWORD PTR -8[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_cons
	mov	QWORD PTR -40[rbp], rax
	mov	rax, QWORD PTR -40[rbp]
	add	rsp, 80
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_ir_is_form
	.def	eb_ir_is_form;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_ir_is_form
eb_ir_is_form:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 64
	.seh_stackalloc	64
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	QWORD PTR 24[rbp], rdx
	mov	QWORD PTR -8[rbp], 0
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -16[rbp], rax
	lea	rcx, eb_car[rip]
	mov	rax, QWORD PTR -16[rbp]
	mov	rdx, rax
	call	eb_car
	mov	QWORD PTR -24[rbp], rax
	lea	rcx, eb_equal[rip]
	mov	rdx, QWORD PTR -24[rbp]
	mov	rax, QWORD PTR -8[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_equal
	mov	QWORD PTR -32[rbp], rax
	mov	rax, QWORD PTR -32[rbp]
	add	rsp, 64
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_ir_form_type
	.def	eb_ir_form_type;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_ir_form_type
eb_ir_form_type:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 64
	.seh_stackalloc	64
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	QWORD PTR 24[rbp], rdx
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -8[rbp], rax
	lea	rcx, eb_cdr[rip]
	mov	rax, QWORD PTR -8[rbp]
	mov	rdx, rax
	call	eb_cdr
	mov	QWORD PTR -16[rbp], rax
	lea	rcx, eb_car[rip]
	mov	rax, QWORD PTR -16[rbp]
	mov	rdx, rax
	call	eb_car
	mov	QWORD PTR -24[rbp], rax
	mov	rax, QWORD PTR -24[rbp]
	add	rsp, 64
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_ir_form_args
	.def	eb_ir_form_args;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_ir_form_args
eb_ir_form_args:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 64
	.seh_stackalloc	64
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	QWORD PTR 24[rbp], rdx
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -8[rbp], rax
	lea	rcx, eb_cdr[rip]
	mov	rax, QWORD PTR -8[rbp]
	mov	rdx, rax
	call	eb_cdr
	mov	QWORD PTR -16[rbp], rax
	lea	rcx, eb_cdr[rip]
	mov	rax, QWORD PTR -16[rbp]
	mov	rdx, rax
	call	eb_cdr
	mov	QWORD PTR -24[rbp], rax
	mov	rax, QWORD PTR -24[rbp]
	add	rsp, 64
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_ir_of_ident
	.def	eb_ir_of_ident;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_ir_of_ident
eb_ir_of_ident:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 64
	.seh_stackalloc	64
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	QWORD PTR 24[rbp], rdx
	mov	QWORD PTR -8[rbp], 1
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -16[rbp], rax
	lea	rcx, eb_cons[rip]
	mov	rdx, QWORD PTR -16[rbp]
	mov	rax, QWORD PTR -8[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_cons
	mov	QWORD PTR -24[rbp], rax
	mov	rax, QWORD PTR -24[rbp]
	add	rsp, 64
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_ir_is_ident
	.def	eb_ir_is_ident;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_ir_is_ident
eb_ir_is_ident:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 64
	.seh_stackalloc	64
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	QWORD PTR 24[rbp], rdx
	mov	QWORD PTR -8[rbp], 1
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -16[rbp], rax
	lea	rcx, eb_car[rip]
	mov	rax, QWORD PTR -16[rbp]
	mov	rdx, rax
	call	eb_car
	mov	QWORD PTR -24[rbp], rax
	lea	rcx, eb_equal[rip]
	mov	rdx, QWORD PTR -24[rbp]
	mov	rax, QWORD PTR -8[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_equal
	mov	QWORD PTR -32[rbp], rax
	mov	rax, QWORD PTR -32[rbp]
	add	rsp, 64
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_ir_ident_text
	.def	eb_ir_ident_text;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_ir_ident_text
eb_ir_ident_text:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 48
	.seh_stackalloc	48
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	QWORD PTR 24[rbp], rdx
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -8[rbp], rax
	lea	rcx, eb_cdr[rip]
	mov	rax, QWORD PTR -8[rbp]
	mov	rdx, rax
	call	eb_cdr
	mov	QWORD PTR -16[rbp], rax
	mov	rax, QWORD PTR -16[rbp]
	add	rsp, 48
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_ir_of_number
	.def	eb_ir_of_number;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_ir_of_number
eb_ir_of_number:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 64
	.seh_stackalloc	64
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	QWORD PTR 24[rbp], rdx
	mov	QWORD PTR -8[rbp], 2
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -16[rbp], rax
	lea	rcx, eb_cons[rip]
	mov	rdx, QWORD PTR -16[rbp]
	mov	rax, QWORD PTR -8[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_cons
	mov	QWORD PTR -24[rbp], rax
	mov	rax, QWORD PTR -24[rbp]
	add	rsp, 64
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_ir_is_number
	.def	eb_ir_is_number;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_ir_is_number
eb_ir_is_number:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 64
	.seh_stackalloc	64
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	QWORD PTR 24[rbp], rdx
	mov	QWORD PTR -8[rbp], 2
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -16[rbp], rax
	lea	rcx, eb_car[rip]
	mov	rax, QWORD PTR -16[rbp]
	mov	rdx, rax
	call	eb_car
	mov	QWORD PTR -24[rbp], rax
	lea	rcx, eb_equal[rip]
	mov	rdx, QWORD PTR -24[rbp]
	mov	rax, QWORD PTR -8[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_equal
	mov	QWORD PTR -32[rbp], rax
	mov	rax, QWORD PTR -32[rbp]
	add	rsp, 64
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_ir_number_value
	.def	eb_ir_number_value;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_ir_number_value
eb_ir_number_value:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 48
	.seh_stackalloc	48
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	QWORD PTR 24[rbp], rdx
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -8[rbp], rax
	lea	rcx, eb_cdr[rip]
	mov	rax, QWORD PTR -8[rbp]
	mov	rdx, rax
	call	eb_cdr
	mov	QWORD PTR -16[rbp], rax
	mov	rax, QWORD PTR -16[rbp]
	add	rsp, 48
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_ir_of_string
	.def	eb_ir_of_string;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_ir_of_string
eb_ir_of_string:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 64
	.seh_stackalloc	64
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	QWORD PTR 24[rbp], rdx
	mov	QWORD PTR -8[rbp], 3
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -16[rbp], rax
	lea	rcx, eb_cons[rip]
	mov	rdx, QWORD PTR -16[rbp]
	mov	rax, QWORD PTR -8[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_cons
	mov	QWORD PTR -24[rbp], rax
	mov	rax, QWORD PTR -24[rbp]
	add	rsp, 64
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_ir_is_string
	.def	eb_ir_is_string;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_ir_is_string
eb_ir_is_string:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 64
	.seh_stackalloc	64
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	QWORD PTR 24[rbp], rdx
	mov	QWORD PTR -8[rbp], 3
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -16[rbp], rax
	lea	rcx, eb_car[rip]
	mov	rax, QWORD PTR -16[rbp]
	mov	rdx, rax
	call	eb_car
	mov	QWORD PTR -24[rbp], rax
	lea	rcx, eb_equal[rip]
	mov	rdx, QWORD PTR -24[rbp]
	mov	rax, QWORD PTR -8[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_equal
	mov	QWORD PTR -32[rbp], rax
	mov	rax, QWORD PTR -32[rbp]
	add	rsp, 64
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_ir_string_value
	.def	eb_ir_string_value;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_ir_string_value
eb_ir_string_value:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 48
	.seh_stackalloc	48
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	QWORD PTR 24[rbp], rdx
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -8[rbp], rax
	lea	rcx, eb_cdr[rip]
	mov	rax, QWORD PTR -8[rbp]
	mov	rdx, rax
	call	eb_cdr
	mov	QWORD PTR -16[rbp], rax
	mov	rax, QWORD PTR -16[rbp]
	add	rsp, 48
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_ir_of_form_block12f001f
	.def	eb_ir_of_form_block12f001f;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_ir_of_form_block12f001f
eb_ir_of_form_block12f001f:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 64
	.seh_stackalloc	64
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	lea	rax, eb_ir_form_type_block[rip]
	mov	rcx, rax
	call	eb_ir_form_type_block
	mov	QWORD PTR -8[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -16[rbp], rax
	lea	rcx, eb_ir_form_type[rip]
	mov	rax, QWORD PTR -16[rbp]
	mov	rdx, rax
	call	eb_ir_form_type
	mov	QWORD PTR -24[rbp], rax
	lea	rcx, eb_equal[rip]
	mov	rdx, QWORD PTR -24[rbp]
	mov	rax, QWORD PTR -8[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_equal
	mov	QWORD PTR -32[rbp], rax
	mov	rax, QWORD PTR -32[rbp]
	add	rsp, 64
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_ir_of_form_block12f01f
	.def	eb_ir_of_form_block12f01f;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_ir_of_form_block12f01f
eb_ir_of_form_block12f01f:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 48
	.seh_stackalloc	48
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -8[rbp], rax
	lea	rcx, eb_ir_form_args[rip]
	mov	rax, QWORD PTR -8[rbp]
	mov	rdx, rax
	call	eb_ir_form_args
	mov	QWORD PTR -16[rbp], rax
	mov	rax, QWORD PTR -16[rbp]
	add	rsp, 48
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_ir_of_form_block12f02f
	.def	eb_ir_of_form_block12f02f;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_ir_of_form_block12f02f
eb_ir_of_form_block12f02f:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 64
	.seh_stackalloc	64
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -8[rbp], rax
	mov	QWORD PTR -16[rbp], 0
	lea	rcx, eb_cons[rip]
	mov	rdx, QWORD PTR -16[rbp]
	mov	rax, QWORD PTR -8[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_cons
	mov	QWORD PTR -24[rbp], rax
	mov	rax, QWORD PTR -24[rbp]
	add	rsp, 64
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_ir_of_form_block12f
	.def	eb_ir_of_form_block12f;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_ir_of_form_block12f
eb_ir_of_form_block12f:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	add	rsp, -128
	.seh_stackalloc	128
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	QWORD PTR 24[rbp], rdx
	mov	QWORD PTR 32[rbp], r8
	mov	rax, QWORD PTR 32[rbp]
	mov	QWORD PTR -8[rbp], rax
	lea	rcx, eb_ir_is_form[rip]
	mov	rax, QWORD PTR -8[rbp]
	mov	rdx, rax
	call	eb_ir_is_form
	mov	QWORD PTR -16[rbp], rax
	lea	rax, eb_ir_of_form_block12f001f[rip]
	mov	QWORD PTR -64[rbp], rax
	mov	rax, QWORD PTR 32[rbp]
	mov	QWORD PTR -56[rbp], rax
	lea	rdx, -64[rbp]
	lea	rcx, eb_and[rip]
	mov	rax, QWORD PTR -16[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_and
	mov	QWORD PTR -24[rbp], rax
	lea	rax, eb_ir_of_form_block12f01f[rip]
	mov	QWORD PTR -80[rbp], rax
	mov	rax, QWORD PTR 32[rbp]
	mov	QWORD PTR -72[rbp], rax
	lea	rax, eb_ir_of_form_block12f02f[rip]
	mov	QWORD PTR -96[rbp], rax
	mov	rax, QWORD PTR 32[rbp]
	mov	QWORD PTR -88[rbp], rax
	lea	r8, -96[rbp]
	lea	rdx, -80[rbp]
	lea	rcx, eb_if[rip]
	mov	rax, QWORD PTR -24[rbp]
	mov	r9, r8
	mov	r8, rdx
	mov	rdx, rax
	call	eb_if
	mov	QWORD PTR -32[rbp], rax
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -40[rbp], rax
	lea	rcx, eb_concat[rip]
	mov	rdx, QWORD PTR -40[rbp]
	mov	rax, QWORD PTR -32[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_concat
	mov	QWORD PTR -48[rbp], rax
	mov	rax, QWORD PTR -48[rbp]
	sub	rsp, -128
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_ir_of_form_block
	.def	eb_ir_of_form_block;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_ir_of_form_block
eb_ir_of_form_block:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 80
	.seh_stackalloc	80
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	QWORD PTR 24[rbp], rdx
	lea	rax, eb_ir_form_type_block[rip]
	mov	rcx, rax
	call	eb_ir_form_type_block
	mov	QWORD PTR -8[rbp], rax
	mov	QWORD PTR -16[rbp], 0
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -24[rbp], rax
	lea	rax, eb_ir_of_form_block12f[rip]
	mov	QWORD PTR -48[rbp], rax
	lea	r8, -48[rbp]
	lea	rcx, eb_fold[rip]
	mov	rdx, QWORD PTR -24[rbp]
	mov	rax, QWORD PTR -16[rbp]
	mov	r9, r8
	mov	r8, rdx
	mov	rdx, rax
	call	eb_fold
	mov	QWORD PTR -32[rbp], rax
	lea	rcx, eb_ir_of_form[rip]
	mov	rdx, QWORD PTR -32[rbp]
	mov	rax, QWORD PTR -8[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_ir_of_form
	mov	QWORD PTR -40[rbp], rax
	mov	rax, QWORD PTR -40[rbp]
	add	rsp, 80
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_ir_print_spaces1f
	.def	eb_ir_print_spaces1f;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_ir_print_spaces1f
eb_ir_print_spaces1f:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 96
	.seh_stackalloc	96
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	QWORD PTR -8[rbp], 32
	lea	rcx, eb_putchar[rip]
	mov	rax, QWORD PTR -8[rbp]
	mov	rdx, rax
	call	eb_putchar
	mov	QWORD PTR -16[rbp], rax
	mov	QWORD PTR -24[rbp], 1
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -32[rbp], rax
	lea	rcx, eb_sub[rip]
	mov	rdx, QWORD PTR -32[rbp]
	mov	rax, QWORD PTR -24[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_sub
	mov	QWORD PTR -40[rbp], rax
	lea	rcx, eb_ir_print_spaces[rip]
	mov	rax, QWORD PTR -40[rbp]
	mov	rdx, rax
	call	eb_ir_print_spaces
	mov	QWORD PTR -48[rbp], rax
	lea	rcx, eb_do[rip]
	mov	rdx, QWORD PTR -48[rbp]
	mov	rax, QWORD PTR -16[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_do
	mov	QWORD PTR -56[rbp], rax
	mov	rax, QWORD PTR -56[rbp]
	add	rsp, 96
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_ir_print_spaces
	.def	eb_ir_print_spaces;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_ir_print_spaces
eb_ir_print_spaces:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 64
	.seh_stackalloc	64
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	QWORD PTR 24[rbp], rdx
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -8[rbp], rax
	lea	rax, eb_ir_print_spaces1f[rip]
	mov	QWORD PTR -32[rbp], rax
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -24[rbp], rax
	lea	rdx, -32[rbp]
	lea	rcx, eb_and[rip]
	mov	rax, QWORD PTR -8[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_and
	mov	QWORD PTR -16[rbp], rax
	mov	rax, QWORD PTR -16[rbp]
	add	rsp, 64
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_ir_print_depth1f1f1f1101f1f
	.def	eb_ir_print_depth1f1f1f1101f1f;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_ir_print_depth1f1f1f1101f1f
eb_ir_print_depth1f1f1f1101f1f:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 96
	.seh_stackalloc	96
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	QWORD PTR 24[rbp], rdx
	lea	rax, eb_put_line[rip]
	mov	rcx, rax
	call	eb_put_line
	mov	QWORD PTR -8[rbp], rax
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -16[rbp], rax
	lea	rcx, eb_ir_print_spaces[rip]
	mov	rax, QWORD PTR -16[rbp]
	mov	rdx, rax
	call	eb_ir_print_spaces
	mov	QWORD PTR -24[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 16
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -32[rbp], rax
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -40[rbp], rax
	lea	rcx, eb_ir_print_depth[rip]
	mov	rdx, QWORD PTR -40[rbp]
	mov	rax, QWORD PTR -32[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_ir_print_depth
	mov	QWORD PTR -48[rbp], rax
	lea	rcx, eb_do[rip]
	mov	rdx, QWORD PTR -48[rbp]
	mov	rax, QWORD PTR -24[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_do
	mov	QWORD PTR -56[rbp], rax
	lea	rcx, eb_do[rip]
	mov	rdx, QWORD PTR -56[rbp]
	mov	rax, QWORD PTR -8[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_do
	mov	QWORD PTR -64[rbp], rax
	mov	rax, QWORD PTR -64[rbp]
	add	rsp, 96
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_ir_print_depth1f1f1f1101f
	.def	eb_ir_print_depth1f1f1f1101f;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_ir_print_depth1f1f1f1101f
eb_ir_print_depth1f1f1f1101f:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 96
	.seh_stackalloc	96
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	QWORD PTR 24[rbp], rdx
	mov	QWORD PTR -8[rbp], 2
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -16[rbp], rax
	lea	rcx, eb_add[rip]
	mov	rdx, QWORD PTR -16[rbp]
	mov	rax, QWORD PTR -8[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_add
	mov	QWORD PTR -24[rbp], rax
	lea	rax, eb_ir_print_depth1f1f1f1101f1f[rip]
	mov	QWORD PTR -64[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -56[rbp], rax
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -48[rbp], rax
	lea	rdx, -64[rbp]
	lea	rcx, eb_let[rip]
	mov	rax, QWORD PTR -24[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_let
	mov	QWORD PTR -32[rbp], rax
	mov	rax, QWORD PTR -32[rbp]
	add	rsp, 96
	pop	rbp
	ret
	.seh_endproc
	.section .rdata,"dr"
.LC34:
	.ascii "(\0"
	.text
	.globl	eb_ir_print_depth1f1f1f
	.def	eb_ir_print_depth1f1f1f;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_ir_print_depth1f1f1f
eb_ir_print_depth1f1f1f:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 144
	.seh_stackalloc	144
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	QWORD PTR 24[rbp], rdx
	lea	rax, .LC34[rip]
	mov	rdx, rax
	lea	rax, eb_ir_print_depth1f1f1f00.53[rip]
	mov	rcx, rax
	call	ebz_stol
	mov	rax, QWORD PTR eb_ir_print_depth1f1f1f00.53[rip]
	lea	rcx, eb_put_str[rip]
	mov	rdx, rax
	call	eb_put_str
	mov	QWORD PTR -8[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 16
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -16[rbp], rax
	lea	rcx, eb_put_str[rip]
	mov	rax, QWORD PTR -16[rbp]
	mov	rdx, rax
	call	eb_put_str
	mov	QWORD PTR -24[rbp], rax
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -32[rbp], rax
	lea	rax, eb_ir_print_depth1f1f1f1101f[rip]
	mov	QWORD PTR -112[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -104[rbp], rax
	lea	rdx, -112[rbp]
	lea	rcx, eb_for[rip]
	mov	rax, QWORD PTR -32[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_for
	mov	QWORD PTR -40[rbp], rax
	lea	rax, .LC8[rip]
	mov	rdx, rax
	lea	rax, eb_ir_print_depth1f1f1f11100.52[rip]
	mov	rcx, rax
	call	ebz_stol
	mov	rax, QWORD PTR eb_ir_print_depth1f1f1f11100.52[rip]
	lea	rcx, eb_put_str[rip]
	mov	rdx, rax
	call	eb_put_str
	mov	QWORD PTR -48[rbp], rax
	mov	QWORD PTR -56[rbp], 0
	lea	rcx, eb_do[rip]
	mov	rdx, QWORD PTR -56[rbp]
	mov	rax, QWORD PTR -48[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_do
	mov	QWORD PTR -64[rbp], rax
	lea	rcx, eb_do[rip]
	mov	rdx, QWORD PTR -64[rbp]
	mov	rax, QWORD PTR -40[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_do
	mov	QWORD PTR -72[rbp], rax
	lea	rcx, eb_do[rip]
	mov	rdx, QWORD PTR -72[rbp]
	mov	rax, QWORD PTR -24[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_do
	mov	QWORD PTR -80[rbp], rax
	lea	rcx, eb_do[rip]
	mov	rdx, QWORD PTR -80[rbp]
	mov	rax, QWORD PTR -8[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_do
	mov	QWORD PTR -88[rbp], rax
	mov	rax, QWORD PTR -88[rbp]
	add	rsp, 144
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_ir_print_depth1f1f
	.def	eb_ir_print_depth1f1f;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_ir_print_depth1f1f
eb_ir_print_depth1f1f:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 80
	.seh_stackalloc	80
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	QWORD PTR 24[rbp], rdx
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 16
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -8[rbp], rax
	lea	rcx, eb_ir_form_args[rip]
	mov	rax, QWORD PTR -8[rbp]
	mov	rdx, rax
	call	eb_ir_form_args
	mov	QWORD PTR -16[rbp], rax
	lea	rax, eb_ir_print_depth1f1f1f[rip]
	mov	QWORD PTR -48[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -40[rbp], rax
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -32[rbp], rax
	lea	rdx, -48[rbp]
	lea	rcx, eb_let[rip]
	mov	rax, QWORD PTR -16[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_let
	mov	QWORD PTR -24[rbp], rax
	mov	rax, QWORD PTR -24[rbp]
	add	rsp, 80
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_ir_print_depth1f
	.def	eb_ir_print_depth1f;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_ir_print_depth1f
eb_ir_print_depth1f:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 96
	.seh_stackalloc	96
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 16
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -8[rbp], rax
	lea	rcx, eb_ir_form_type[rip]
	mov	rax, QWORD PTR -8[rbp]
	mov	rdx, rax
	call	eb_ir_form_type
	mov	QWORD PTR -16[rbp], rax
	lea	rcx, eb_ir_form_type_to_str[rip]
	mov	rax, QWORD PTR -16[rbp]
	mov	rdx, rax
	call	eb_ir_form_type_to_str
	mov	QWORD PTR -24[rbp], rax
	lea	rax, eb_ir_print_depth1f1f[rip]
	mov	QWORD PTR -64[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -56[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 16
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -48[rbp], rax
	lea	rdx, -64[rbp]
	lea	rcx, eb_let[rip]
	mov	rax, QWORD PTR -24[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_let
	mov	QWORD PTR -32[rbp], rax
	mov	rax, QWORD PTR -32[rbp]
	add	rsp, 96
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_ir_print_depth2f1f
	.def	eb_ir_print_depth2f1f;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_ir_print_depth2f1f
eb_ir_print_depth2f1f:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 64
	.seh_stackalloc	64
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -8[rbp], rax
	lea	rcx, eb_ir_ident_text[rip]
	mov	rax, QWORD PTR -8[rbp]
	mov	rdx, rax
	call	eb_ir_ident_text
	mov	QWORD PTR -16[rbp], rax
	lea	rcx, eb_put_str[rip]
	mov	rax, QWORD PTR -16[rbp]
	mov	rdx, rax
	call	eb_put_str
	mov	QWORD PTR -24[rbp], rax
	mov	rax, QWORD PTR -24[rbp]
	add	rsp, 64
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_ir_print_depth2f2f1f
	.def	eb_ir_print_depth2f2f1f;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_ir_print_depth2f2f1f
eb_ir_print_depth2f2f1f:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 64
	.seh_stackalloc	64
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -8[rbp], rax
	lea	rcx, eb_ir_number_value[rip]
	mov	rax, QWORD PTR -8[rbp]
	mov	rdx, rax
	call	eb_ir_number_value
	mov	QWORD PTR -16[rbp], rax
	lea	rcx, eb_put_num[rip]
	mov	rax, QWORD PTR -16[rbp]
	mov	rdx, rax
	call	eb_put_num
	mov	QWORD PTR -24[rbp], rax
	mov	rax, QWORD PTR -24[rbp]
	add	rsp, 64
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_ir_print_depth2f2f2f1f
	.def	eb_ir_print_depth2f2f2f1f;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_ir_print_depth2f2f2f1f
eb_ir_print_depth2f2f2f1f:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 112
	.seh_stackalloc	112
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	QWORD PTR -8[rbp], 34
	lea	rcx, eb_putchar[rip]
	mov	rax, QWORD PTR -8[rbp]
	mov	rdx, rax
	call	eb_putchar
	mov	QWORD PTR -16[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -24[rbp], rax
	lea	rcx, eb_ir_string_value[rip]
	mov	rax, QWORD PTR -24[rbp]
	mov	rdx, rax
	call	eb_ir_string_value
	mov	QWORD PTR -32[rbp], rax
	lea	rcx, eb_put_str[rip]
	mov	rax, QWORD PTR -32[rbp]
	mov	rdx, rax
	call	eb_put_str
	mov	QWORD PTR -40[rbp], rax
	mov	QWORD PTR -48[rbp], 34
	lea	rcx, eb_putchar[rip]
	mov	rax, QWORD PTR -48[rbp]
	mov	rdx, rax
	call	eb_putchar
	mov	QWORD PTR -56[rbp], rax
	lea	rcx, eb_do[rip]
	mov	rdx, QWORD PTR -56[rbp]
	mov	rax, QWORD PTR -40[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_do
	mov	QWORD PTR -64[rbp], rax
	lea	rcx, eb_do[rip]
	mov	rdx, QWORD PTR -64[rbp]
	mov	rax, QWORD PTR -16[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_do
	mov	QWORD PTR -72[rbp], rax
	mov	rax, QWORD PTR -72[rbp]
	add	rsp, 112
	pop	rbp
	ret
	.seh_endproc
	.section .rdata,"dr"
.LC35:
	.ascii "<unk>\0"
	.text
	.globl	eb_ir_print_depth2f2f2f2f
	.def	eb_ir_print_depth2f2f2f2f;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_ir_print_depth2f2f2f2f
eb_ir_print_depth2f2f2f2f:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 48
	.seh_stackalloc	48
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	lea	rax, .LC35[rip]
	mov	rdx, rax
	lea	rax, eb_ir_print_depth2f2f2f2f0.51[rip]
	mov	rcx, rax
	call	ebz_stol
	mov	rax, QWORD PTR eb_ir_print_depth2f2f2f2f0.51[rip]
	lea	rcx, eb_put_str[rip]
	mov	rdx, rax
	call	eb_put_str
	mov	QWORD PTR -8[rbp], rax
	mov	rax, QWORD PTR -8[rbp]
	add	rsp, 48
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_ir_print_depth2f2f2f
	.def	eb_ir_print_depth2f2f2f;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_ir_print_depth2f2f2f
eb_ir_print_depth2f2f2f:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 96
	.seh_stackalloc	96
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -8[rbp], rax
	lea	rcx, eb_ir_is_string[rip]
	mov	rax, QWORD PTR -8[rbp]
	mov	rdx, rax
	call	eb_ir_is_string
	mov	QWORD PTR -16[rbp], rax
	lea	rax, eb_ir_print_depth2f2f2f1f[rip]
	mov	QWORD PTR -48[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -40[rbp], rax
	lea	rax, eb_ir_print_depth2f2f2f2f[rip]
	mov	QWORD PTR -56[rbp], rax
	lea	r8, -56[rbp]
	lea	rdx, -48[rbp]
	lea	rcx, eb_if[rip]
	mov	rax, QWORD PTR -16[rbp]
	mov	r9, r8
	mov	r8, rdx
	mov	rdx, rax
	call	eb_if
	mov	QWORD PTR -24[rbp], rax
	mov	rax, QWORD PTR -24[rbp]
	add	rsp, 96
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_ir_print_depth2f2f
	.def	eb_ir_print_depth2f2f;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_ir_print_depth2f2f
eb_ir_print_depth2f2f:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 96
	.seh_stackalloc	96
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -8[rbp], rax
	lea	rcx, eb_ir_is_number[rip]
	mov	rax, QWORD PTR -8[rbp]
	mov	rdx, rax
	call	eb_ir_is_number
	mov	QWORD PTR -16[rbp], rax
	lea	rax, eb_ir_print_depth2f2f1f[rip]
	mov	QWORD PTR -48[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -40[rbp], rax
	lea	rax, eb_ir_print_depth2f2f2f[rip]
	mov	QWORD PTR -64[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -56[rbp], rax
	lea	r8, -64[rbp]
	lea	rdx, -48[rbp]
	lea	rcx, eb_if[rip]
	mov	rax, QWORD PTR -16[rbp]
	mov	r9, r8
	mov	r8, rdx
	mov	rdx, rax
	call	eb_if
	mov	QWORD PTR -24[rbp], rax
	mov	rax, QWORD PTR -24[rbp]
	add	rsp, 96
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_ir_print_depth2f
	.def	eb_ir_print_depth2f;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_ir_print_depth2f
eb_ir_print_depth2f:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 96
	.seh_stackalloc	96
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -8[rbp], rax
	lea	rcx, eb_ir_is_ident[rip]
	mov	rax, QWORD PTR -8[rbp]
	mov	rdx, rax
	call	eb_ir_is_ident
	mov	QWORD PTR -16[rbp], rax
	lea	rax, eb_ir_print_depth2f1f[rip]
	mov	QWORD PTR -48[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -40[rbp], rax
	lea	rax, eb_ir_print_depth2f2f[rip]
	mov	QWORD PTR -64[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -56[rbp], rax
	lea	r8, -64[rbp]
	lea	rdx, -48[rbp]
	lea	rcx, eb_if[rip]
	mov	rax, QWORD PTR -16[rbp]
	mov	r9, r8
	mov	r8, rdx
	mov	rdx, rax
	call	eb_if
	mov	QWORD PTR -24[rbp], rax
	mov	rax, QWORD PTR -24[rbp]
	add	rsp, 96
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_ir_print_depth
	.def	eb_ir_print_depth;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_ir_print_depth
eb_ir_print_depth:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 96
	.seh_stackalloc	96
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	QWORD PTR 24[rbp], rdx
	mov	QWORD PTR 32[rbp], r8
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -8[rbp], rax
	lea	rcx, eb_ir_is_form[rip]
	mov	rax, QWORD PTR -8[rbp]
	mov	rdx, rax
	call	eb_ir_is_form
	mov	QWORD PTR -16[rbp], rax
	lea	rax, eb_ir_print_depth1f[rip]
	mov	QWORD PTR -48[rbp], rax
	mov	rax, QWORD PTR 32[rbp]
	mov	QWORD PTR -40[rbp], rax
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -32[rbp], rax
	lea	rax, eb_ir_print_depth2f[rip]
	mov	QWORD PTR -64[rbp], rax
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -56[rbp], rax
	lea	r8, -64[rbp]
	lea	rdx, -48[rbp]
	lea	rcx, eb_if[rip]
	mov	rax, QWORD PTR -16[rbp]
	mov	r9, r8
	mov	r8, rdx
	mov	rdx, rax
	call	eb_if
	mov	QWORD PTR -24[rbp], rax
	mov	rax, QWORD PTR -24[rbp]
	add	rsp, 96
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_ir_print
	.def	eb_ir_print;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_ir_print
eb_ir_print:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 64
	.seh_stackalloc	64
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	QWORD PTR 24[rbp], rdx
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -8[rbp], rax
	mov	QWORD PTR -16[rbp], 0
	lea	rcx, eb_ir_print_depth[rip]
	mov	rdx, QWORD PTR -16[rbp]
	mov	rax, QWORD PTR -8[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_ir_print_depth
	mov	QWORD PTR -24[rbp], rax
	mov	rax, QWORD PTR -24[rbp]
	add	rsp, 64
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_scan_ast_captures1f
	.def	eb_scan_ast_captures1f;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_scan_ast_captures1f
eb_scan_ast_captures1f:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 64
	.seh_stackalloc	64
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -8[rbp], rax
	lea	rcx, eb_cdr[rip]
	mov	rax, QWORD PTR -8[rbp]
	mov	rdx, rax
	call	eb_cdr
	mov	QWORD PTR -16[rbp], rax
	mov	QWORD PTR -24[rbp], 0
	lea	rcx, eb_cons[rip]
	mov	rdx, QWORD PTR -24[rbp]
	mov	rax, QWORD PTR -16[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_cons
	mov	QWORD PTR -32[rbp], rax
	mov	rax, QWORD PTR -32[rbp]
	add	rsp, 64
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_scan_ast_captures2f1f001f
	.def	eb_scan_ast_captures2f1f001f;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_scan_ast_captures2f1f001f
eb_scan_ast_captures2f1f001f:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 64
	.seh_stackalloc	64
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	QWORD PTR 24[rbp], rdx
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -8[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -16[rbp], rax
	lea	rcx, eb_scan_ast_captures[rip]
	mov	rdx, QWORD PTR -16[rbp]
	mov	rax, QWORD PTR -8[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_scan_ast_captures
	mov	QWORD PTR -24[rbp], rax
	mov	rax, QWORD PTR -24[rbp]
	add	rsp, 64
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_scan_ast_captures2f1f01f
	.def	eb_scan_ast_captures2f1f01f;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_scan_ast_captures2f1f01f
eb_scan_ast_captures2f1f01f:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 16
	.seh_stackalloc	16
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	QWORD PTR 24[rbp], rdx
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -8[rbp], rax
	mov	rax, QWORD PTR -8[rbp]
	add	rsp, 16
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_scan_ast_captures2f1f
	.def	eb_scan_ast_captures2f1f;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_scan_ast_captures2f1f
eb_scan_ast_captures2f1f:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 112
	.seh_stackalloc	112
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 16
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -8[rbp], rax
	lea	rcx, eb_cdr[rip]
	mov	rax, QWORD PTR -8[rbp]
	mov	rdx, rax
	call	eb_cdr
	mov	QWORD PTR -16[rbp], rax
	lea	rax, eb_scan_ast_captures2f1f001f[rip]
	mov	QWORD PTR -64[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -56[rbp], rax
	lea	rdx, -64[rbp]
	lea	rcx, eb_map[rip]
	mov	rax, QWORD PTR -16[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_map
	mov	QWORD PTR -24[rbp], rax
	lea	rax, eb_scan_ast_captures2f1f01f[rip]
	mov	QWORD PTR -72[rbp], rax
	lea	rdx, -72[rbp]
	lea	rcx, eb_let[rip]
	mov	rax, QWORD PTR -24[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_let
	mov	QWORD PTR -32[rbp], rax
	lea	rcx, eb_flatten[rip]
	mov	rax, QWORD PTR -32[rbp]
	mov	rdx, rax
	call	eb_flatten
	mov	QWORD PTR -40[rbp], rax
	mov	rax, QWORD PTR -40[rbp]
	add	rsp, 112
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_scan_ast_captures2f2f1f002f
	.def	eb_scan_ast_captures2f2f1f002f;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_scan_ast_captures2f2f1f002f
eb_scan_ast_captures2f2f1f002f:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 144
	.seh_stackalloc	144
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	QWORD PTR 24[rbp], rdx
	mov	QWORD PTR 32[rbp], r8
	mov	QWORD PTR -8[rbp], 1
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -16[rbp], rax
	lea	rcx, eb_car[rip]
	mov	rax, QWORD PTR -16[rbp]
	mov	rdx, rax
	call	eb_car
	mov	QWORD PTR -24[rbp], rax
	lea	rcx, eb_add[rip]
	mov	rdx, QWORD PTR -24[rbp]
	mov	rax, QWORD PTR -8[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_add
	mov	QWORD PTR -32[rbp], rax
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -40[rbp], rax
	lea	rcx, eb_cdr[rip]
	mov	rax, QWORD PTR -40[rbp]
	mov	rdx, rax
	call	eb_cdr
	mov	QWORD PTR -48[rbp], rax
	mov	rax, QWORD PTR 32[rbp]
	mov	QWORD PTR -56[rbp], rax
	lea	rcx, eb_car[rip]
	mov	rax, QWORD PTR -56[rbp]
	mov	rdx, rax
	call	eb_car
	mov	QWORD PTR -64[rbp], rax
	mov	QWORD PTR -72[rbp], 1
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -80[rbp], rax
	lea	rcx, eb_car[rip]
	mov	rax, QWORD PTR -80[rbp]
	mov	rdx, rax
	call	eb_car
	mov	QWORD PTR -88[rbp], rax
	lea	rcx, eb_cons[rip]
	mov	rdx, QWORD PTR -88[rbp]
	mov	rax, QWORD PTR -72[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_cons
	mov	QWORD PTR -96[rbp], rax
	lea	rcx, eb_defs_append[rip]
	mov	r8, QWORD PTR -96[rbp]
	mov	rdx, QWORD PTR -64[rbp]
	mov	rax, QWORD PTR -48[rbp]
	mov	r9, r8
	mov	r8, rdx
	mov	rdx, rax
	call	eb_defs_append
	mov	QWORD PTR -104[rbp], rax
	lea	rcx, eb_cons[rip]
	mov	rdx, QWORD PTR -104[rbp]
	mov	rax, QWORD PTR -32[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_cons
	mov	QWORD PTR -112[rbp], rax
	mov	rax, QWORD PTR -112[rbp]
	add	rsp, 144
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_scan_ast_captures2f2f1f1f002f
	.def	eb_scan_ast_captures2f2f1f1f002f;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_scan_ast_captures2f2f1f1f002f
eb_scan_ast_captures2f2f1f1f002f:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 144
	.seh_stackalloc	144
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	QWORD PTR 24[rbp], rdx
	mov	QWORD PTR 32[rbp], r8
	mov	QWORD PTR -8[rbp], 1
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -16[rbp], rax
	lea	rcx, eb_car[rip]
	mov	rax, QWORD PTR -16[rbp]
	mov	rdx, rax
	call	eb_car
	mov	QWORD PTR -24[rbp], rax
	lea	rcx, eb_add[rip]
	mov	rdx, QWORD PTR -24[rbp]
	mov	rax, QWORD PTR -8[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_add
	mov	QWORD PTR -32[rbp], rax
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -40[rbp], rax
	lea	rcx, eb_cdr[rip]
	mov	rax, QWORD PTR -40[rbp]
	mov	rdx, rax
	call	eb_cdr
	mov	QWORD PTR -48[rbp], rax
	mov	rax, QWORD PTR 32[rbp]
	mov	QWORD PTR -56[rbp], rax
	lea	rcx, eb_cdr[rip]
	mov	rax, QWORD PTR -56[rbp]
	mov	rdx, rax
	call	eb_cdr
	mov	QWORD PTR -64[rbp], rax
	mov	QWORD PTR -72[rbp], 0
	mov	rax, QWORD PTR 32[rbp]
	mov	QWORD PTR -80[rbp], rax
	lea	rcx, eb_cdr[rip]
	mov	rax, QWORD PTR -80[rbp]
	mov	rdx, rax
	call	eb_cdr
	mov	QWORD PTR -88[rbp], rax
	lea	rcx, eb_cons[rip]
	mov	rdx, QWORD PTR -88[rbp]
	mov	rax, QWORD PTR -72[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_cons
	mov	QWORD PTR -96[rbp], rax
	lea	rcx, eb_defs_append[rip]
	mov	r8, QWORD PTR -96[rbp]
	mov	rdx, QWORD PTR -64[rbp]
	mov	rax, QWORD PTR -48[rbp]
	mov	r9, r8
	mov	r8, rdx
	mov	rdx, rax
	call	eb_defs_append
	mov	QWORD PTR -104[rbp], rax
	lea	rcx, eb_cons[rip]
	mov	rdx, QWORD PTR -104[rbp]
	mov	rax, QWORD PTR -32[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_cons
	mov	QWORD PTR -112[rbp], rax
	mov	rax, QWORD PTR -112[rbp]
	add	rsp, 144
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_scan_ast_captures2f2f1f1f1f
	.def	eb_scan_ast_captures2f2f1f1f1f;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_scan_ast_captures2f2f1f1f1f
eb_scan_ast_captures2f2f1f1f1f:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 80
	.seh_stackalloc	80
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	QWORD PTR 24[rbp], rdx
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 16
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -8[rbp], rax
	lea	rcx, eb_cdr[rip]
	mov	rax, QWORD PTR -8[rbp]
	mov	rdx, rax
	call	eb_cdr
	mov	QWORD PTR -16[rbp], rax
	lea	rcx, eb_cdr[rip]
	mov	rax, QWORD PTR -16[rbp]
	mov	rdx, rax
	call	eb_cdr
	mov	QWORD PTR -24[rbp], rax
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -32[rbp], rax
	lea	rcx, eb_scan_ast_captures[rip]
	mov	rdx, QWORD PTR -32[rbp]
	mov	rax, QWORD PTR -24[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_scan_ast_captures
	mov	QWORD PTR -40[rbp], rax
	mov	rax, QWORD PTR -40[rbp]
	add	rsp, 80
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_scan_ast_captures2f2f1f1f
	.def	eb_scan_ast_captures2f2f1f1f;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_scan_ast_captures2f2f1f1f
eb_scan_ast_captures2f2f1f1f:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 144
	.seh_stackalloc	144
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	QWORD PTR 24[rbp], rdx
	mov	QWORD PTR -8[rbp], 0
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -16[rbp], rax
	lea	rcx, eb_cons[rip]
	mov	rdx, QWORD PTR -16[rbp]
	mov	rax, QWORD PTR -8[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_cons
	mov	QWORD PTR -24[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 16
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -32[rbp], rax
	lea	rcx, eb_cdr[rip]
	mov	rax, QWORD PTR -32[rbp]
	mov	rdx, rax
	call	eb_cdr
	mov	QWORD PTR -40[rbp], rax
	lea	rcx, eb_car[rip]
	mov	rax, QWORD PTR -40[rbp]
	mov	rdx, rax
	call	eb_car
	mov	QWORD PTR -48[rbp], rax
	lea	rax, eb_scan_ast_captures2f2f1f1f002f[rip]
	mov	QWORD PTR -80[rbp], rax
	lea	r8, -80[rbp]
	lea	rcx, eb_fold[rip]
	mov	rdx, QWORD PTR -48[rbp]
	mov	rax, QWORD PTR -24[rbp]
	mov	r9, r8
	mov	r8, rdx
	mov	rdx, rax
	call	eb_fold
	mov	QWORD PTR -56[rbp], rax
	lea	rcx, eb_cdr[rip]
	mov	rax, QWORD PTR -56[rbp]
	mov	rdx, rax
	call	eb_cdr
	mov	QWORD PTR -64[rbp], rax
	lea	rax, eb_scan_ast_captures2f2f1f1f1f[rip]
	mov	QWORD PTR -112[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -104[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 16
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -96[rbp], rax
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -88[rbp], rax
	lea	rdx, -112[rbp]
	lea	rcx, eb_let[rip]
	mov	rax, QWORD PTR -64[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_let
	mov	QWORD PTR -72[rbp], rax
	mov	rax, QWORD PTR -72[rbp]
	add	rsp, 144
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_scan_ast_captures2f2f1f
	.def	eb_scan_ast_captures2f2f1f;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_scan_ast_captures2f2f1f
eb_scan_ast_captures2f2f1f:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	add	rsp, -128
	.seh_stackalloc	128
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	QWORD PTR -8[rbp], 0
	mov	QWORD PTR -16[rbp], 0
	lea	rcx, eb_cons[rip]
	mov	rdx, QWORD PTR -16[rbp]
	mov	rax, QWORD PTR -8[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_cons
	mov	QWORD PTR -24[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -32[rbp], rax
	lea	rax, eb_scan_ast_captures2f2f1f002f[rip]
	mov	QWORD PTR -64[rbp], rax
	lea	r8, -64[rbp]
	lea	rcx, eb_fold[rip]
	mov	rdx, QWORD PTR -32[rbp]
	mov	rax, QWORD PTR -24[rbp]
	mov	r9, r8
	mov	r8, rdx
	mov	rdx, rax
	call	eb_fold
	mov	QWORD PTR -40[rbp], rax
	lea	rcx, eb_cdr[rip]
	mov	rax, QWORD PTR -40[rbp]
	mov	rdx, rax
	call	eb_cdr
	mov	QWORD PTR -48[rbp], rax
	lea	rax, eb_scan_ast_captures2f2f1f1f[rip]
	mov	QWORD PTR -96[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -88[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 16
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -80[rbp], rax
	lea	rdx, -96[rbp]
	lea	rcx, eb_let[rip]
	mov	rax, QWORD PTR -48[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_let
	mov	QWORD PTR -56[rbp], rax
	mov	rax, QWORD PTR -56[rbp]
	sub	rsp, -128
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_scan_ast_captures2f2f2f
	.def	eb_scan_ast_captures2f2f2f;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_scan_ast_captures2f2f2f
eb_scan_ast_captures2f2f2f:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 16
	.seh_stackalloc	16
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	QWORD PTR -8[rbp], 0
	mov	rax, QWORD PTR -8[rbp]
	add	rsp, 16
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_scan_ast_captures2f2f
	.def	eb_scan_ast_captures2f2f;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_scan_ast_captures2f2f
eb_scan_ast_captures2f2f:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 96
	.seh_stackalloc	96
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 16
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -8[rbp], rax
	lea	rcx, eb_ast_is_lambda[rip]
	mov	rax, QWORD PTR -8[rbp]
	mov	rdx, rax
	call	eb_ast_is_lambda
	mov	QWORD PTR -16[rbp], rax
	lea	rax, eb_scan_ast_captures2f2f1f[rip]
	mov	QWORD PTR -48[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -40[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 16
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -32[rbp], rax
	lea	rax, eb_scan_ast_captures2f2f2f[rip]
	mov	QWORD PTR -56[rbp], rax
	lea	r8, -56[rbp]
	lea	rdx, -48[rbp]
	lea	rcx, eb_if[rip]
	mov	rax, QWORD PTR -16[rbp]
	mov	r9, r8
	mov	r8, rdx
	mov	rdx, rax
	call	eb_if
	mov	QWORD PTR -24[rbp], rax
	mov	rax, QWORD PTR -24[rbp]
	add	rsp, 96
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_scan_ast_captures2f
	.def	eb_scan_ast_captures2f;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_scan_ast_captures2f
eb_scan_ast_captures2f:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 112
	.seh_stackalloc	112
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 16
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -8[rbp], rax
	lea	rcx, eb_ast_is_call[rip]
	mov	rax, QWORD PTR -8[rbp]
	mov	rdx, rax
	call	eb_ast_is_call
	mov	QWORD PTR -16[rbp], rax
	lea	rax, eb_scan_ast_captures2f1f[rip]
	mov	QWORD PTR -48[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -40[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 16
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -32[rbp], rax
	lea	rax, eb_scan_ast_captures2f2f[rip]
	mov	QWORD PTR -80[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -72[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 16
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -64[rbp], rax
	lea	r8, -80[rbp]
	lea	rdx, -48[rbp]
	lea	rcx, eb_if[rip]
	mov	rax, QWORD PTR -16[rbp]
	mov	r9, r8
	mov	r8, rdx
	mov	rdx, rax
	call	eb_if
	mov	QWORD PTR -24[rbp], rax
	mov	rax, QWORD PTR -24[rbp]
	add	rsp, 112
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_scan_ast_captures
	.def	eb_scan_ast_captures;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_scan_ast_captures
eb_scan_ast_captures:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 112
	.seh_stackalloc	112
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	QWORD PTR 24[rbp], rdx
	mov	QWORD PTR 32[rbp], r8
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -8[rbp], rax
	lea	rcx, eb_ast_is_name[rip]
	mov	rax, QWORD PTR -8[rbp]
	mov	rdx, rax
	call	eb_ast_is_name
	mov	QWORD PTR -16[rbp], rax
	lea	rax, eb_scan_ast_captures1f[rip]
	mov	QWORD PTR -48[rbp], rax
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -40[rbp], rax
	lea	rax, eb_scan_ast_captures2f[rip]
	mov	QWORD PTR -80[rbp], rax
	mov	rax, QWORD PTR 32[rbp]
	mov	QWORD PTR -72[rbp], rax
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -64[rbp], rax
	lea	r8, -80[rbp]
	lea	rdx, -48[rbp]
	lea	rcx, eb_if[rip]
	mov	rax, QWORD PTR -16[rbp]
	mov	r9, r8
	mov	r8, rdx
	mov	rdx, rax
	call	eb_if
	mov	QWORD PTR -24[rbp], rax
	mov	rax, QWORD PTR -24[rbp]
	add	rsp, 112
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_defs_filter_keep_used1f1f
	.def	eb_defs_filter_keep_used1f1f;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_defs_filter_keep_used1f1f
eb_defs_filter_keep_used1f1f:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 64
	.seh_stackalloc	64
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	QWORD PTR 24[rbp], rdx
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -8[rbp], rax
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -16[rbp], rax
	lea	rcx, eb_car[rip]
	mov	rax, QWORD PTR -16[rbp]
	mov	rdx, rax
	call	eb_car
	mov	QWORD PTR -24[rbp], rax
	lea	rcx, eb_has_str[rip]
	mov	rdx, QWORD PTR -24[rbp]
	mov	rax, QWORD PTR -8[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_has_str
	mov	QWORD PTR -32[rbp], rax
	mov	rax, QWORD PTR -32[rbp]
	add	rsp, 64
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_defs_filter_keep_used1f
	.def	eb_defs_filter_keep_used1f;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_defs_filter_keep_used1f
eb_defs_filter_keep_used1f:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 64
	.seh_stackalloc	64
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	QWORD PTR 24[rbp], rdx
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -8[rbp], rax
	lea	rax, eb_defs_filter_keep_used1f1f[rip]
	mov	QWORD PTR -32[rbp], rax
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -24[rbp], rax
	lea	rdx, -32[rbp]
	lea	rcx, eb_filter[rip]
	mov	rax, QWORD PTR -8[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_filter
	mov	QWORD PTR -16[rbp], rax
	mov	rax, QWORD PTR -16[rbp]
	add	rsp, 64
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_defs_filter_keep_used
	.def	eb_defs_filter_keep_used;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_defs_filter_keep_used
eb_defs_filter_keep_used:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 80
	.seh_stackalloc	80
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	QWORD PTR 24[rbp], rdx
	mov	QWORD PTR 32[rbp], r8
	mov	QWORD PTR 40[rbp], r9
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -8[rbp], rax
	mov	rax, QWORD PTR 32[rbp]
	mov	QWORD PTR -16[rbp], rax
	lea	rcx, eb_scan_ast_captures[rip]
	mov	rdx, QWORD PTR -16[rbp]
	mov	rax, QWORD PTR -8[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_scan_ast_captures
	mov	QWORD PTR -24[rbp], rax
	lea	rax, eb_defs_filter_keep_used1f[rip]
	mov	QWORD PTR -48[rbp], rax
	mov	rax, QWORD PTR 40[rbp]
	mov	QWORD PTR -40[rbp], rax
	lea	rdx, -48[rbp]
	lea	rcx, eb_let[rip]
	mov	rax, QWORD PTR -24[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_let
	mov	QWORD PTR -32[rbp], rax
	mov	rax, QWORD PTR -32[rbp]
	add	rsp, 80
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_path_to_ident
	.def	eb_path_to_ident;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_path_to_ident
eb_path_to_ident:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 64
	.seh_stackalloc	64
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	QWORD PTR 24[rbp], rdx
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -8[rbp], rax
	lea	rcx, eb_reverse[rip]
	mov	rax, QWORD PTR -8[rbp]
	mov	rdx, rax
	call	eb_reverse
	mov	QWORD PTR -16[rbp], rax
	lea	rcx, eb_ir_of_ident[rip]
	mov	rax, QWORD PTR -16[rbp]
	mov	rdx, rax
	call	eb_ir_of_ident
	mov	QWORD PTR -24[rbp], rax
	mov	rax, QWORD PTR -24[rbp]
	add	rsp, 64
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_compile_ir_pre1f002f1f101f01f
	.def	eb_compile_ir_pre1f002f1f101f01f;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_compile_ir_pre1f002f1f101f01f
eb_compile_ir_pre1f002f1f101f01f:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 16
	.seh_stackalloc	16
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -8[rbp], rax
	mov	rax, QWORD PTR -8[rbp]
	add	rsp, 16
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_compile_ir_pre1f002f1f101f03f1f
	.def	eb_compile_ir_pre1f002f1f101f03f1f;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_compile_ir_pre1f002f1f101f03f1f
eb_compile_ir_pre1f002f1f101f03f1f:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 48
	.seh_stackalloc	48
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 16
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -8[rbp], rax
	mov	rax, QWORD PTR -8[rbp]
	mov	rax, QWORD PTR [rax]
	mov	rdx, rax
	mov	rax, QWORD PTR -8[rbp]
	mov	rcx, rax
	call	rdx
	mov	QWORD PTR -16[rbp], rax
	mov	rax, QWORD PTR -16[rbp]
	add	rsp, 48
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_compile_ir_pre1f002f1f101f03f
	.def	eb_compile_ir_pre1f002f1f101f03f;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_compile_ir_pre1f002f1f101f03f
eb_compile_ir_pre1f002f1f101f03f:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 96
	.seh_stackalloc	96
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	QWORD PTR 24[rbp], rdx
	mov	QWORD PTR 32[rbp], r8
	mov	QWORD PTR 40[rbp], r9
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -8[rbp], rax
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -16[rbp], rax
	lea	rax, eb_compile_ir_pre1f002f1f101f03f1f[rip]
	mov	QWORD PTR -64[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 24
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -56[rbp], rax
	mov	rax, QWORD PTR 32[rbp]
	mov	QWORD PTR -48[rbp], rax
	mov	rax, QWORD PTR 40[rbp]
	mov	QWORD PTR -24[rbp], rax
	mov	rax, QWORD PTR -8[rbp]
	mov	rax, QWORD PTR [rax]
	mov	r10, rax
	lea	rcx, -64[rbp]
	mov	r8, QWORD PTR -24[rbp]
	mov	rdx, QWORD PTR -16[rbp]
	mov	rax, QWORD PTR -8[rbp]
	mov	r9, r8
	mov	r8, rcx
	mov	rcx, rax
	call	r10
	mov	QWORD PTR -32[rbp], rax
	mov	rax, QWORD PTR -32[rbp]
	add	rsp, 96
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_compile_ir_pre1f002f1f101f
	.def	eb_compile_ir_pre1f002f1f101f;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_compile_ir_pre1f002f1f101f
eb_compile_ir_pre1f002f1f101f:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 144
	.seh_stackalloc	144
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	QWORD PTR 24[rbp], rdx
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 40
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -8[rbp], rax
	lea	rax, eb_compile_ir_pre1f002f1f101f01f[rip]
	mov	QWORD PTR -48[rbp], rax
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -40[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 16
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -16[rbp], rax
	lea	rax, eb_compile_ir_pre1f002f1f101f03f[rip]
	mov	QWORD PTR -96[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -88[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 16
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -80[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 24
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -72[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 32
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -64[rbp], rax
	lea	rdx, -96[rbp]
	lea	r8, -48[rbp]
	lea	rcx, eb_compile_ir_pre[rip]
	mov	r9, QWORD PTR -16[rbp]
	mov	rax, QWORD PTR -8[rbp]
	mov	QWORD PTR 32[rsp], rdx
	mov	rdx, rax
	call	eb_compile_ir_pre
	mov	QWORD PTR -24[rbp], rax
	lea	rcx, eb_reverse[rip]
	mov	rax, QWORD PTR -24[rbp]
	mov	rdx, rax
	call	eb_reverse
	mov	QWORD PTR -32[rbp], rax
	mov	rax, QWORD PTR -32[rbp]
	add	rsp, 144
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_compile_ir_pre1f002f1f
	.def	eb_compile_ir_pre1f002f1f;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_compile_ir_pre1f002f1f
eb_compile_ir_pre1f002f1f:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 192
	.seh_stackalloc	192
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	QWORD PTR 24[rbp], rdx
	mov	QWORD PTR -8[rbp], 1
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -16[rbp], rax
	lea	rcx, eb_add[rip]
	mov	rdx, QWORD PTR -16[rbp]
	mov	rax, QWORD PTR -8[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_add
	mov	QWORD PTR -24[rbp], rax
	mov	QWORD PTR -32[rbp], 48
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -40[rbp], rax
	lea	rcx, eb_add[rip]
	mov	rdx, QWORD PTR -40[rbp]
	mov	rax, QWORD PTR -32[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_add
	mov	QWORD PTR -48[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 24
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -56[rbp], rax
	mov	rax, QWORD PTR -56[rbp]
	mov	rax, QWORD PTR [rax]
	mov	rdx, rax
	mov	rax, QWORD PTR -56[rbp]
	mov	rcx, rax
	call	rdx
	mov	QWORD PTR -64[rbp], rax
	lea	rcx, eb_cons[rip]
	mov	rdx, QWORD PTR -64[rbp]
	mov	rax, QWORD PTR -48[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_cons
	mov	QWORD PTR -72[rbp], rax
	lea	rax, eb_compile_ir_pre1f002f1f101f[rip]
	mov	QWORD PTR -160[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -152[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 16
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -144[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 24
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -136[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 32
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -128[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 40
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -120[rbp], rax
	lea	rdx, -160[rbp]
	lea	rcx, eb_let[rip]
	mov	rax, QWORD PTR -72[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_let
	mov	QWORD PTR -80[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 48
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -88[rbp], rax
	lea	rcx, eb_cdr[rip]
	mov	rax, QWORD PTR -88[rbp]
	mov	rdx, rax
	call	eb_cdr
	mov	QWORD PTR -96[rbp], rax
	lea	rcx, eb_concat[rip]
	mov	rdx, QWORD PTR -96[rbp]
	mov	rax, QWORD PTR -80[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_concat
	mov	QWORD PTR -104[rbp], rax
	lea	rcx, eb_cons[rip]
	mov	rdx, QWORD PTR -104[rbp]
	mov	rax, QWORD PTR -24[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_cons
	mov	QWORD PTR -112[rbp], rax
	mov	rax, QWORD PTR -112[rbp]
	add	rsp, 192
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_compile_ir_pre1f002f
	.def	eb_compile_ir_pre1f002f;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_compile_ir_pre1f002f
eb_compile_ir_pre1f002f:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 112
	.seh_stackalloc	112
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	QWORD PTR 24[rbp], rdx
	mov	QWORD PTR 32[rbp], r8
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -8[rbp], rax
	lea	rcx, eb_car[rip]
	mov	rax, QWORD PTR -8[rbp]
	mov	rdx, rax
	call	eb_car
	mov	QWORD PTR -16[rbp], rax
	lea	rax, eb_compile_ir_pre1f002f1f[rip]
	mov	QWORD PTR -80[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -72[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 16
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -64[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 24
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -56[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 32
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -48[rbp], rax
	mov	rax, QWORD PTR 32[rbp]
	mov	QWORD PTR -40[rbp], rax
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -32[rbp], rax
	lea	rdx, -80[rbp]
	lea	rcx, eb_let[rip]
	mov	rax, QWORD PTR -16[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_let
	mov	QWORD PTR -24[rbp], rax
	mov	rax, QWORD PTR -24[rbp]
	add	rsp, 112
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_compile_ir_pre1f
	.def	eb_compile_ir_pre1f;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_compile_ir_pre1f
eb_compile_ir_pre1f:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 160
	.seh_stackalloc	160
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	QWORD PTR -8[rbp], 0
	mov	QWORD PTR -16[rbp], 0
	lea	rcx, eb_cons[rip]
	mov	rdx, QWORD PTR -16[rbp]
	mov	rax, QWORD PTR -8[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_cons
	mov	QWORD PTR -24[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 32
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -32[rbp], rax
	lea	rcx, eb_cdr[rip]
	mov	rax, QWORD PTR -32[rbp]
	mov	rdx, rax
	call	eb_cdr
	mov	QWORD PTR -40[rbp], rax
	lea	rcx, eb_cdr[rip]
	mov	rax, QWORD PTR -40[rbp]
	mov	rdx, rax
	call	eb_cdr
	mov	QWORD PTR -48[rbp], rax
	lea	rcx, eb_reverse[rip]
	mov	rax, QWORD PTR -48[rbp]
	mov	rdx, rax
	call	eb_reverse
	mov	QWORD PTR -56[rbp], rax
	lea	rax, eb_compile_ir_pre1f002f[rip]
	mov	QWORD PTR -128[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -120[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 16
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -112[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 24
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -104[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 32
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -96[rbp], rax
	lea	r8, -128[rbp]
	lea	rcx, eb_fold[rip]
	mov	rdx, QWORD PTR -56[rbp]
	mov	rax, QWORD PTR -24[rbp]
	mov	r9, r8
	mov	r8, rdx
	mov	rdx, rax
	call	eb_fold
	mov	QWORD PTR -64[rbp], rax
	lea	rcx, eb_cdr[rip]
	mov	rax, QWORD PTR -64[rbp]
	mov	rdx, rax
	call	eb_cdr
	mov	QWORD PTR -72[rbp], rax
	lea	rcx, eb_reverse[rip]
	mov	rax, QWORD PTR -72[rbp]
	mov	rdx, rax
	call	eb_reverse
	mov	QWORD PTR -80[rbp], rax
	mov	rax, QWORD PTR -80[rbp]
	add	rsp, 160
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_compile_ir_pre2f1f1f1f002f
	.def	eb_compile_ir_pre2f1f1f1f002f;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_compile_ir_pre2f1f1f1f002f
eb_compile_ir_pre2f1f1f1f002f:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 144
	.seh_stackalloc	144
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	QWORD PTR 24[rbp], rdx
	mov	QWORD PTR 32[rbp], r8
	mov	QWORD PTR -8[rbp], 1
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -16[rbp], rax
	lea	rcx, eb_car[rip]
	mov	rax, QWORD PTR -16[rbp]
	mov	rdx, rax
	call	eb_car
	mov	QWORD PTR -24[rbp], rax
	lea	rcx, eb_add[rip]
	mov	rdx, QWORD PTR -24[rbp]
	mov	rax, QWORD PTR -8[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_add
	mov	QWORD PTR -32[rbp], rax
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -40[rbp], rax
	lea	rcx, eb_cdr[rip]
	mov	rax, QWORD PTR -40[rbp]
	mov	rdx, rax
	call	eb_cdr
	mov	QWORD PTR -48[rbp], rax
	mov	rax, QWORD PTR 32[rbp]
	mov	QWORD PTR -56[rbp], rax
	lea	rcx, eb_car[rip]
	mov	rax, QWORD PTR -56[rbp]
	mov	rdx, rax
	call	eb_car
	mov	QWORD PTR -64[rbp], rax
	mov	QWORD PTR -72[rbp], 1
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -80[rbp], rax
	lea	rcx, eb_car[rip]
	mov	rax, QWORD PTR -80[rbp]
	mov	rdx, rax
	call	eb_car
	mov	QWORD PTR -88[rbp], rax
	lea	rcx, eb_cons[rip]
	mov	rdx, QWORD PTR -88[rbp]
	mov	rax, QWORD PTR -72[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_cons
	mov	QWORD PTR -96[rbp], rax
	lea	rcx, eb_defs_append[rip]
	mov	r8, QWORD PTR -96[rbp]
	mov	rdx, QWORD PTR -64[rbp]
	mov	rax, QWORD PTR -48[rbp]
	mov	r9, r8
	mov	r8, rdx
	mov	rdx, rax
	call	eb_defs_append
	mov	QWORD PTR -104[rbp], rax
	lea	rcx, eb_cons[rip]
	mov	rdx, QWORD PTR -104[rbp]
	mov	rax, QWORD PTR -32[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_cons
	mov	QWORD PTR -112[rbp], rax
	mov	rax, QWORD PTR -112[rbp]
	add	rsp, 144
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_compile_ir_pre2f1f1f1f1f002f
	.def	eb_compile_ir_pre2f1f1f1f1f002f;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_compile_ir_pre2f1f1f1f1f002f
eb_compile_ir_pre2f1f1f1f1f002f:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 144
	.seh_stackalloc	144
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	QWORD PTR 24[rbp], rdx
	mov	QWORD PTR 32[rbp], r8
	mov	QWORD PTR -8[rbp], 1
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -16[rbp], rax
	lea	rcx, eb_car[rip]
	mov	rax, QWORD PTR -16[rbp]
	mov	rdx, rax
	call	eb_car
	mov	QWORD PTR -24[rbp], rax
	lea	rcx, eb_add[rip]
	mov	rdx, QWORD PTR -24[rbp]
	mov	rax, QWORD PTR -8[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_add
	mov	QWORD PTR -32[rbp], rax
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -40[rbp], rax
	lea	rcx, eb_cdr[rip]
	mov	rax, QWORD PTR -40[rbp]
	mov	rdx, rax
	call	eb_cdr
	mov	QWORD PTR -48[rbp], rax
	mov	rax, QWORD PTR 32[rbp]
	mov	QWORD PTR -56[rbp], rax
	lea	rcx, eb_cdr[rip]
	mov	rax, QWORD PTR -56[rbp]
	mov	rdx, rax
	call	eb_cdr
	mov	QWORD PTR -64[rbp], rax
	mov	QWORD PTR -72[rbp], 0
	mov	rax, QWORD PTR 32[rbp]
	mov	QWORD PTR -80[rbp], rax
	lea	rcx, eb_cdr[rip]
	mov	rax, QWORD PTR -80[rbp]
	mov	rdx, rax
	call	eb_cdr
	mov	QWORD PTR -88[rbp], rax
	lea	rcx, eb_cons[rip]
	mov	rdx, QWORD PTR -88[rbp]
	mov	rax, QWORD PTR -72[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_cons
	mov	QWORD PTR -96[rbp], rax
	lea	rcx, eb_defs_append[rip]
	mov	r8, QWORD PTR -96[rbp]
	mov	rdx, QWORD PTR -64[rbp]
	mov	rax, QWORD PTR -48[rbp]
	mov	r9, r8
	mov	r8, rdx
	mov	rdx, rax
	call	eb_defs_append
	mov	QWORD PTR -104[rbp], rax
	lea	rcx, eb_cons[rip]
	mov	rdx, QWORD PTR -104[rbp]
	mov	rax, QWORD PTR -32[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_cons
	mov	QWORD PTR -112[rbp], rax
	mov	rax, QWORD PTR -112[rbp]
	add	rsp, 144
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_compile_ir_pre2f1f1f1f1f1f01f
	.def	eb_compile_ir_pre2f1f1f1f1f1f01f;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_compile_ir_pre2f1f1f1f1f1f01f
eb_compile_ir_pre2f1f1f1f1f1f01f:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 16
	.seh_stackalloc	16
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -8[rbp], rax
	mov	rax, QWORD PTR -8[rbp]
	add	rsp, 16
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_compile_ir_pre2f1f1f1f1f1f03f1f
	.def	eb_compile_ir_pre2f1f1f1f1f1f03f1f;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_compile_ir_pre2f1f1f1f1f1f03f1f
eb_compile_ir_pre2f1f1f1f1f1f03f1f:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 48
	.seh_stackalloc	48
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 16
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -8[rbp], rax
	mov	rax, QWORD PTR -8[rbp]
	mov	rax, QWORD PTR [rax]
	mov	rdx, rax
	mov	rax, QWORD PTR -8[rbp]
	mov	rcx, rax
	call	rdx
	mov	QWORD PTR -16[rbp], rax
	mov	rax, QWORD PTR -16[rbp]
	add	rsp, 48
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_compile_ir_pre2f1f1f1f1f1f03f
	.def	eb_compile_ir_pre2f1f1f1f1f1f03f;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_compile_ir_pre2f1f1f1f1f1f03f
eb_compile_ir_pre2f1f1f1f1f1f03f:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 96
	.seh_stackalloc	96
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	QWORD PTR 24[rbp], rdx
	mov	QWORD PTR 32[rbp], r8
	mov	QWORD PTR 40[rbp], r9
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -8[rbp], rax
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -16[rbp], rax
	lea	rax, eb_compile_ir_pre2f1f1f1f1f1f03f1f[rip]
	mov	QWORD PTR -64[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 24
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -56[rbp], rax
	mov	rax, QWORD PTR 32[rbp]
	mov	QWORD PTR -48[rbp], rax
	mov	rax, QWORD PTR 40[rbp]
	mov	QWORD PTR -24[rbp], rax
	mov	rax, QWORD PTR -8[rbp]
	mov	rax, QWORD PTR [rax]
	mov	r10, rax
	lea	rcx, -64[rbp]
	mov	r8, QWORD PTR -24[rbp]
	mov	rdx, QWORD PTR -16[rbp]
	mov	rax, QWORD PTR -8[rbp]
	mov	r9, r8
	mov	r8, rcx
	mov	rcx, rax
	call	r10
	mov	QWORD PTR -32[rbp], rax
	mov	rax, QWORD PTR -32[rbp]
	add	rsp, 96
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_compile_ir_pre2f1f1f1f1f1f10110111f
	.def	eb_compile_ir_pre2f1f1f1f1f1f10110111f;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_compile_ir_pre2f1f1f1f1f1f10110111f
eb_compile_ir_pre2f1f1f1f1f1f10110111f:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 64
	.seh_stackalloc	64
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	QWORD PTR 24[rbp], rdx
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -8[rbp], rax
	lea	rcx, eb_cdr[rip]
	mov	rax, QWORD PTR -8[rbp]
	mov	rdx, rax
	call	eb_cdr
	mov	QWORD PTR -16[rbp], rax
	lea	rcx, eb_ir_of_ident[rip]
	mov	rax, QWORD PTR -16[rbp]
	mov	rdx, rax
	call	eb_ir_of_ident
	mov	QWORD PTR -24[rbp], rax
	mov	rax, QWORD PTR -24[rbp]
	add	rsp, 64
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_compile_ir_pre2f1f1f1f1f1f101110001f
	.def	eb_compile_ir_pre2f1f1f1f1f1f101110001f;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_compile_ir_pre2f1f1f1f1f1f101110001f
eb_compile_ir_pre2f1f1f1f1f1f101110001f:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 16
	.seh_stackalloc	16
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -8[rbp], rax
	mov	rax, QWORD PTR -8[rbp]
	add	rsp, 16
	pop	rbp
	ret
	.seh_endproc
	.section .rdata,"dr"
.LC36:
	.ascii "closure\0"
	.text
	.globl	eb_compile_ir_pre2f1f1f1f1f1f
	.def	eb_compile_ir_pre2f1f1f1f1f1f;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_compile_ir_pre2f1f1f1f1f1f
eb_compile_ir_pre2f1f1f1f1f1f:
	push	rbp
	.seh_pushreg	rbp
	sub	rsp, 480
	.seh_stackalloc	480
	lea	rbp, 128[rsp]
	.seh_setframe	rbp, 128
	.seh_endprologue
	mov	QWORD PTR 368[rbp], rcx
	mov	QWORD PTR 376[rbp], rdx
	mov	rax, QWORD PTR 368[rbp]
	add	rax, 32
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR 344[rbp], rax
	lea	rcx, eb_cdr[rip]
	mov	rax, QWORD PTR 344[rbp]
	mov	rdx, rax
	call	eb_cdr
	mov	QWORD PTR 336[rbp], rax
	lea	rcx, eb_cdr[rip]
	mov	rax, QWORD PTR 336[rbp]
	mov	rdx, rax
	call	eb_cdr
	mov	QWORD PTR 328[rbp], rax
	lea	rax, eb_compile_ir_pre2f1f1f1f1f1f01f[rip]
	mov	QWORD PTR 16[rbp], rax
	mov	rax, QWORD PTR 368[rbp]
	add	rax, 40
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR 24[rbp], rax
	mov	rax, QWORD PTR 376[rbp]
	mov	QWORD PTR 320[rbp], rax
	lea	rax, eb_compile_ir_pre2f1f1f1f1f1f03f[rip]
	mov	QWORD PTR -48[rbp], rax
	mov	rax, QWORD PTR 368[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -40[rbp], rax
	mov	rax, QWORD PTR 368[rbp]
	add	rax, 16
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -32[rbp], rax
	mov	rax, QWORD PTR 368[rbp]
	add	rax, 24
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -24[rbp], rax
	mov	rax, QWORD PTR 368[rbp]
	add	rax, 32
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -16[rbp], rax
	mov	rax, QWORD PTR 368[rbp]
	add	rax, 48
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -8[rbp], rax
	mov	rax, QWORD PTR 368[rbp]
	add	rax, 56
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR 0[rbp], rax
	mov	rax, QWORD PTR 376[rbp]
	mov	QWORD PTR 8[rbp], rax
	lea	rdx, -48[rbp]
	lea	r8, 16[rbp]
	lea	rcx, eb_compile_ir_pre[rip]
	mov	r9, QWORD PTR 320[rbp]
	mov	rax, QWORD PTR 328[rbp]
	mov	QWORD PTR 32[rsp], rdx
	mov	rdx, rax
	call	eb_compile_ir_pre
	mov	QWORD PTR 312[rbp], rax
	lea	rax, eb_ir_form_type_function[rip]
	mov	rcx, rax
	call	eb_ir_form_type_function
	mov	QWORD PTR 304[rbp], rax
	mov	rax, QWORD PTR 368[rbp]
	add	rax, 40
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR 296[rbp], rax
	lea	rcx, eb_path_to_ident[rip]
	mov	rax, QWORD PTR 296[rbp]
	mov	rdx, rax
	call	eb_path_to_ident
	mov	QWORD PTR 288[rbp], rax
	lea	rax, eb_ir_form_type_params[rip]
	mov	rcx, rax
	call	eb_ir_form_type_params
	mov	QWORD PTR 280[rbp], rax
	lea	rax, .LC36[rip]
	mov	rdx, rax
	lea	rax, eb_compile_ir_pre2f1f1f1f1f1f10110100.50[rip]
	mov	rcx, rax
	call	ebz_stol
	mov	rax, QWORD PTR eb_compile_ir_pre2f1f1f1f1f1f10110100.50[rip]
	lea	rcx, eb_ir_of_ident[rip]
	mov	rdx, rax
	call	eb_ir_of_ident
	mov	QWORD PTR 272[rbp], rax
	mov	rax, QWORD PTR 368[rbp]
	add	rax, 32
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR 264[rbp], rax
	lea	rcx, eb_cdr[rip]
	mov	rax, QWORD PTR 264[rbp]
	mov	rdx, rax
	call	eb_cdr
	mov	QWORD PTR 256[rbp], rax
	lea	rcx, eb_car[rip]
	mov	rax, QWORD PTR 256[rbp]
	mov	rdx, rax
	call	eb_car
	mov	QWORD PTR 248[rbp], rax
	lea	rax, eb_compile_ir_pre2f1f1f1f1f1f10110111f[rip]
	mov	QWORD PTR -56[rbp], rax
	lea	rdx, -56[rbp]
	lea	rcx, eb_map[rip]
	mov	rax, QWORD PTR 248[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_map
	mov	QWORD PTR 240[rbp], rax
	lea	rcx, eb_cons[rip]
	mov	rdx, QWORD PTR 240[rbp]
	mov	rax, QWORD PTR 272[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_cons
	mov	QWORD PTR 232[rbp], rax
	lea	rcx, eb_ir_of_form[rip]
	mov	rdx, QWORD PTR 232[rbp]
	mov	rax, QWORD PTR 280[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_ir_of_form
	mov	QWORD PTR 224[rbp], rax
	mov	rax, QWORD PTR 368[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR 216[rbp], rax
	mov	rax, QWORD PTR 368[rbp]
	add	rax, 32
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR 208[rbp], rax
	lea	rcx, eb_cdr[rip]
	mov	rax, QWORD PTR 208[rbp]
	mov	rdx, rax
	call	eb_cdr
	mov	QWORD PTR 200[rbp], rax
	lea	rcx, eb_cdr[rip]
	mov	rax, QWORD PTR 200[rbp]
	mov	rdx, rax
	call	eb_cdr
	mov	QWORD PTR 192[rbp], rax
	lea	rax, eb_compile_ir_pre2f1f1f1f1f1f101110001f[rip]
	mov	QWORD PTR -80[rbp], rax
	mov	rax, QWORD PTR 368[rbp]
	add	rax, 40
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -72[rbp], rax
	mov	rax, QWORD PTR 376[rbp]
	mov	QWORD PTR 184[rbp], rax
	mov	rax, QWORD PTR 216[rbp]
	mov	rax, QWORD PTR [rax]
	mov	r10, rax
	lea	rcx, -80[rbp]
	mov	r8, QWORD PTR 184[rbp]
	mov	rdx, QWORD PTR 192[rbp]
	mov	rax, QWORD PTR 216[rbp]
	mov	r9, r8
	mov	r8, rcx
	mov	rcx, rax
	call	r10
	mov	QWORD PTR 176[rbp], rax
	lea	rax, eb_ir_form_type_return[rip]
	mov	rcx, rax
	call	eb_ir_form_type_return
	mov	QWORD PTR 168[rbp], rax
	mov	rax, QWORD PTR 368[rbp]
	add	rax, 40
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR 160[rbp], rax
	lea	rcx, eb_path_to_ident[rip]
	mov	rax, QWORD PTR 160[rbp]
	mov	rdx, rax
	call	eb_path_to_ident
	mov	QWORD PTR 152[rbp], rax
	mov	QWORD PTR 144[rbp], 0
	lea	rcx, eb_cons[rip]
	mov	rdx, QWORD PTR 144[rbp]
	mov	rax, QWORD PTR 152[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_cons
	mov	QWORD PTR 136[rbp], rax
	lea	rcx, eb_ir_of_form[rip]
	mov	rdx, QWORD PTR 136[rbp]
	mov	rax, QWORD PTR 168[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_ir_of_form
	mov	QWORD PTR 128[rbp], rax
	mov	QWORD PTR 120[rbp], 0
	lea	rcx, eb_cons[rip]
	mov	rdx, QWORD PTR 120[rbp]
	mov	rax, QWORD PTR 128[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_cons
	mov	QWORD PTR 112[rbp], rax
	lea	rcx, eb_cons[rip]
	mov	rdx, QWORD PTR 112[rbp]
	mov	rax, QWORD PTR 176[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_cons
	mov	QWORD PTR 104[rbp], rax
	lea	rcx, eb_ir_of_form_block[rip]
	mov	rax, QWORD PTR 104[rbp]
	mov	rdx, rax
	call	eb_ir_of_form_block
	mov	QWORD PTR 96[rbp], rax
	mov	QWORD PTR 88[rbp], 0
	lea	rcx, eb_cons[rip]
	mov	rdx, QWORD PTR 88[rbp]
	mov	rax, QWORD PTR 96[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_cons
	mov	QWORD PTR 80[rbp], rax
	lea	rcx, eb_cons[rip]
	mov	rdx, QWORD PTR 80[rbp]
	mov	rax, QWORD PTR 224[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_cons
	mov	QWORD PTR 72[rbp], rax
	lea	rcx, eb_cons[rip]
	mov	rdx, QWORD PTR 72[rbp]
	mov	rax, QWORD PTR 288[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_cons
	mov	QWORD PTR 64[rbp], rax
	lea	rcx, eb_ir_of_form[rip]
	mov	rdx, QWORD PTR 64[rbp]
	mov	rax, QWORD PTR 304[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_ir_of_form
	mov	QWORD PTR 56[rbp], rax
	mov	QWORD PTR 48[rbp], 0
	lea	rcx, eb_cons[rip]
	mov	rdx, QWORD PTR 48[rbp]
	mov	rax, QWORD PTR 56[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_cons
	mov	QWORD PTR 40[rbp], rax
	lea	rcx, eb_concat[rip]
	mov	rdx, QWORD PTR 40[rbp]
	mov	rax, QWORD PTR 312[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_concat
	mov	QWORD PTR 32[rbp], rax
	mov	rax, QWORD PTR 32[rbp]
	add	rsp, 480
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_compile_ir_pre2f1f1f1f1f
	.def	eb_compile_ir_pre2f1f1f1f1f;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_compile_ir_pre2f1f1f1f1f
eb_compile_ir_pre2f1f1f1f1f:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 176
	.seh_stackalloc	176
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	QWORD PTR 24[rbp], rdx
	mov	QWORD PTR -8[rbp], 0
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -16[rbp], rax
	lea	rcx, eb_cons[rip]
	mov	rdx, QWORD PTR -16[rbp]
	mov	rax, QWORD PTR -8[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_cons
	mov	QWORD PTR -24[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 32
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -32[rbp], rax
	lea	rcx, eb_cdr[rip]
	mov	rax, QWORD PTR -32[rbp]
	mov	rdx, rax
	call	eb_cdr
	mov	QWORD PTR -40[rbp], rax
	lea	rcx, eb_car[rip]
	mov	rax, QWORD PTR -40[rbp]
	mov	rdx, rax
	call	eb_car
	mov	QWORD PTR -48[rbp], rax
	lea	rax, eb_compile_ir_pre2f1f1f1f1f002f[rip]
	mov	QWORD PTR -80[rbp], rax
	lea	r8, -80[rbp]
	lea	rcx, eb_fold[rip]
	mov	rdx, QWORD PTR -48[rbp]
	mov	rax, QWORD PTR -24[rbp]
	mov	r9, r8
	mov	r8, rdx
	mov	rdx, rax
	call	eb_fold
	mov	QWORD PTR -56[rbp], rax
	lea	rcx, eb_cdr[rip]
	mov	rax, QWORD PTR -56[rbp]
	mov	rdx, rax
	call	eb_cdr
	mov	QWORD PTR -64[rbp], rax
	lea	rax, eb_compile_ir_pre2f1f1f1f1f1f[rip]
	mov	QWORD PTR -144[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -136[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 16
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -128[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 24
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -120[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 32
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -112[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 40
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -104[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 48
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -96[rbp], rax
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -88[rbp], rax
	lea	rdx, -144[rbp]
	lea	rcx, eb_let[rip]
	mov	rax, QWORD PTR -64[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_let
	mov	QWORD PTR -72[rbp], rax
	mov	rax, QWORD PTR -72[rbp]
	add	rsp, 176
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_compile_ir_pre2f1f1f1f
	.def	eb_compile_ir_pre2f1f1f1f;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_compile_ir_pre2f1f1f1f
eb_compile_ir_pre2f1f1f1f:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 160
	.seh_stackalloc	160
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	QWORD PTR 24[rbp], rdx
	mov	QWORD PTR -8[rbp], 0
	mov	QWORD PTR -16[rbp], 0
	lea	rcx, eb_cons[rip]
	mov	rdx, QWORD PTR -16[rbp]
	mov	rax, QWORD PTR -8[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_cons
	mov	QWORD PTR -24[rbp], rax
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -32[rbp], rax
	lea	rax, eb_compile_ir_pre2f1f1f1f002f[rip]
	mov	QWORD PTR -64[rbp], rax
	lea	r8, -64[rbp]
	lea	rcx, eb_fold[rip]
	mov	rdx, QWORD PTR -32[rbp]
	mov	rax, QWORD PTR -24[rbp]
	mov	r9, r8
	mov	r8, rdx
	mov	rdx, rax
	call	eb_fold
	mov	QWORD PTR -40[rbp], rax
	lea	rcx, eb_cdr[rip]
	mov	rax, QWORD PTR -40[rbp]
	mov	rdx, rax
	call	eb_cdr
	mov	QWORD PTR -48[rbp], rax
	lea	rax, eb_compile_ir_pre2f1f1f1f1f[rip]
	mov	QWORD PTR -128[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -120[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 16
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -112[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 24
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -104[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 32
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -96[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 40
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -88[rbp], rax
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -80[rbp], rax
	lea	rdx, -128[rbp]
	lea	rcx, eb_let[rip]
	mov	rax, QWORD PTR -48[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_let
	mov	QWORD PTR -56[rbp], rax
	mov	rax, QWORD PTR -56[rbp]
	add	rsp, 160
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_compile_ir_pre2f1f1f
	.def	eb_compile_ir_pre2f1f1f;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_compile_ir_pre2f1f1f
eb_compile_ir_pre2f1f1f:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 144
	.seh_stackalloc	144
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	QWORD PTR 24[rbp], rdx
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 32
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -8[rbp], rax
	lea	rcx, eb_cdr[rip]
	mov	rax, QWORD PTR -8[rbp]
	mov	rdx, rax
	call	eb_cdr
	mov	QWORD PTR -16[rbp], rax
	lea	rcx, eb_cdr[rip]
	mov	rax, QWORD PTR -16[rbp]
	mov	rdx, rax
	call	eb_cdr
	mov	QWORD PTR -24[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 16
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -32[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 16
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -40[rbp], rax
	lea	rcx, eb_defs_filter_keep_used[rip]
	mov	r8, QWORD PTR -40[rbp]
	mov	rdx, QWORD PTR -32[rbp]
	mov	rax, QWORD PTR -24[rbp]
	mov	r9, r8
	mov	r8, rdx
	mov	rdx, rax
	call	eb_defs_filter_keep_used
	mov	QWORD PTR -48[rbp], rax
	lea	rax, eb_compile_ir_pre2f1f1f1f[rip]
	mov	QWORD PTR -112[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -104[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 16
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -96[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 24
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -88[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 32
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -80[rbp], rax
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -72[rbp], rax
	lea	rdx, -112[rbp]
	lea	rcx, eb_let[rip]
	mov	rax, QWORD PTR -48[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_let
	mov	QWORD PTR -56[rbp], rax
	mov	rax, QWORD PTR -56[rbp]
	add	rsp, 144
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_compile_ir_pre2f1f
	.def	eb_compile_ir_pre2f1f;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_compile_ir_pre2f1f
eb_compile_ir_pre2f1f:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 112
	.seh_stackalloc	112
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	QWORD PTR -8[rbp], 102
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 24
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -16[rbp], rax
	mov	rax, QWORD PTR -16[rbp]
	mov	rax, QWORD PTR [rax]
	mov	rdx, rax
	mov	rax, QWORD PTR -16[rbp]
	mov	rcx, rax
	call	rdx
	mov	QWORD PTR -24[rbp], rax
	lea	rcx, eb_cons[rip]
	mov	rdx, QWORD PTR -24[rbp]
	mov	rax, QWORD PTR -8[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_cons
	mov	QWORD PTR -32[rbp], rax
	lea	rax, eb_compile_ir_pre2f1f1f[rip]
	mov	QWORD PTR -80[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -72[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 16
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -64[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 24
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -56[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 32
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -48[rbp], rax
	lea	rdx, -80[rbp]
	lea	rcx, eb_let[rip]
	mov	rax, QWORD PTR -32[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_let
	mov	QWORD PTR -40[rbp], rax
	mov	rax, QWORD PTR -40[rbp]
	add	rsp, 112
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_compile_ir_pre2f2f
	.def	eb_compile_ir_pre2f2f;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_compile_ir_pre2f2f
eb_compile_ir_pre2f2f:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 16
	.seh_stackalloc	16
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	QWORD PTR -8[rbp], 0
	mov	rax, QWORD PTR -8[rbp]
	add	rsp, 16
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_compile_ir_pre2f
	.def	eb_compile_ir_pre2f;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_compile_ir_pre2f
eb_compile_ir_pre2f:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 112
	.seh_stackalloc	112
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 32
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -8[rbp], rax
	lea	rcx, eb_ast_is_lambda[rip]
	mov	rax, QWORD PTR -8[rbp]
	mov	rdx, rax
	call	eb_ast_is_lambda
	mov	QWORD PTR -16[rbp], rax
	lea	rax, eb_compile_ir_pre2f1f[rip]
	mov	QWORD PTR -64[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -56[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 16
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -48[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 24
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -40[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 32
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -32[rbp], rax
	lea	rax, eb_compile_ir_pre2f2f[rip]
	mov	QWORD PTR -72[rbp], rax
	lea	r8, -72[rbp]
	lea	rdx, -64[rbp]
	lea	rcx, eb_if[rip]
	mov	rax, QWORD PTR -16[rbp]
	mov	r9, r8
	mov	r8, rdx
	mov	rdx, rax
	call	eb_if
	mov	QWORD PTR -24[rbp], rax
	mov	rax, QWORD PTR -24[rbp]
	add	rsp, 112
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_compile_ir_pre
	.def	eb_compile_ir_pre;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_compile_ir_pre
eb_compile_ir_pre:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 144
	.seh_stackalloc	144
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	QWORD PTR 24[rbp], rdx
	mov	QWORD PTR 32[rbp], r8
	mov	QWORD PTR 40[rbp], r9
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -8[rbp], rax
	lea	rcx, eb_ast_is_call[rip]
	mov	rax, QWORD PTR -8[rbp]
	mov	rdx, rax
	call	eb_ast_is_call
	mov	QWORD PTR -16[rbp], rax
	lea	rax, eb_compile_ir_pre1f[rip]
	mov	QWORD PTR -64[rbp], rax
	mov	rax, QWORD PTR 48[rbp]
	mov	QWORD PTR -56[rbp], rax
	mov	rax, QWORD PTR 40[rbp]
	mov	QWORD PTR -48[rbp], rax
	mov	rax, QWORD PTR 32[rbp]
	mov	QWORD PTR -40[rbp], rax
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -32[rbp], rax
	lea	rax, eb_compile_ir_pre2f[rip]
	mov	QWORD PTR -112[rbp], rax
	mov	rax, QWORD PTR 48[rbp]
	mov	QWORD PTR -104[rbp], rax
	mov	rax, QWORD PTR 40[rbp]
	mov	QWORD PTR -96[rbp], rax
	mov	rax, QWORD PTR 32[rbp]
	mov	QWORD PTR -88[rbp], rax
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -80[rbp], rax
	lea	r8, -112[rbp]
	lea	rdx, -64[rbp]
	lea	rcx, eb_if[rip]
	mov	rax, QWORD PTR -16[rbp]
	mov	r9, r8
	mov	r8, rdx
	mov	rdx, rax
	call	eb_if
	mov	QWORD PTR -24[rbp], rax
	mov	rax, QWORD PTR -24[rbp]
	add	rsp, 144
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_compile_ir1f1f11001f
	.def	eb_compile_ir1f1f11001f;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_compile_ir1f1f11001f
eb_compile_ir1f1f11001f:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 64
	.seh_stackalloc	64
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	QWORD PTR -8[rbp], 1
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -16[rbp], rax
	lea	rcx, eb_car[rip]
	mov	rax, QWORD PTR -16[rbp]
	mov	rdx, rax
	call	eb_car
	mov	QWORD PTR -24[rbp], rax
	lea	rcx, eb_equal[rip]
	mov	rdx, QWORD PTR -24[rbp]
	mov	rax, QWORD PTR -8[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_equal
	mov	QWORD PTR -32[rbp], rax
	mov	rax, QWORD PTR -32[rbp]
	add	rsp, 64
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_compile_ir1f1f1101f
	.def	eb_compile_ir1f1f1101f;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_compile_ir1f1f1101f
eb_compile_ir1f1f1101f:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	add	rsp, -128
	.seh_stackalloc	128
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	lea	rax, eb_ir_form_type_closure_get[rip]
	mov	rcx, rax
	call	eb_ir_form_type_closure_get
	mov	QWORD PTR -8[rbp], rax
	lea	rax, .LC36[rip]
	mov	rdx, rax
	lea	rax, eb_compile_ir1f1f1101f100.49[rip]
	mov	rcx, rax
	call	ebz_stol
	mov	rax, QWORD PTR eb_compile_ir1f1f1101f100.49[rip]
	lea	rcx, eb_ir_of_ident[rip]
	mov	rdx, rax
	call	eb_ir_of_ident
	mov	QWORD PTR -16[rbp], rax
	mov	QWORD PTR -24[rbp], 1
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -32[rbp], rax
	lea	rcx, eb_cdr[rip]
	mov	rax, QWORD PTR -32[rbp]
	mov	rdx, rax
	call	eb_cdr
	mov	QWORD PTR -40[rbp], rax
	lea	rcx, eb_add[rip]
	mov	rdx, QWORD PTR -40[rbp]
	mov	rax, QWORD PTR -24[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_add
	mov	QWORD PTR -48[rbp], rax
	lea	rcx, eb_ir_of_number[rip]
	mov	rax, QWORD PTR -48[rbp]
	mov	rdx, rax
	call	eb_ir_of_number
	mov	QWORD PTR -56[rbp], rax
	mov	QWORD PTR -64[rbp], 0
	lea	rcx, eb_cons[rip]
	mov	rdx, QWORD PTR -64[rbp]
	mov	rax, QWORD PTR -56[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_cons
	mov	QWORD PTR -72[rbp], rax
	lea	rcx, eb_cons[rip]
	mov	rdx, QWORD PTR -72[rbp]
	mov	rax, QWORD PTR -16[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_cons
	mov	QWORD PTR -80[rbp], rax
	lea	rcx, eb_ir_of_form[rip]
	mov	rdx, QWORD PTR -80[rbp]
	mov	rax, QWORD PTR -8[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_ir_of_form
	mov	QWORD PTR -88[rbp], rax
	mov	rax, QWORD PTR -88[rbp]
	sub	rsp, -128
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_compile_ir1f1f1102f
	.def	eb_compile_ir1f1f1102f;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_compile_ir1f1f1102f
eb_compile_ir1f1f1102f:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 64
	.seh_stackalloc	64
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -8[rbp], rax
	lea	rcx, eb_cdr[rip]
	mov	rax, QWORD PTR -8[rbp]
	mov	rdx, rax
	call	eb_cdr
	mov	QWORD PTR -16[rbp], rax
	lea	rcx, eb_ir_of_ident[rip]
	mov	rax, QWORD PTR -16[rbp]
	mov	rdx, rax
	call	eb_ir_of_ident
	mov	QWORD PTR -24[rbp], rax
	mov	rax, QWORD PTR -24[rbp]
	add	rsp, 64
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_compile_ir1f1f
	.def	eb_compile_ir1f1f;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_compile_ir1f1f
eb_compile_ir1f1f:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 176
	.seh_stackalloc	176
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	QWORD PTR 24[rbp], rdx
	lea	rax, eb_ir_form_type_let[rip]
	mov	rcx, rax
	call	eb_ir_form_type_let
	mov	QWORD PTR -8[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -16[rbp], rax
	mov	rax, QWORD PTR -16[rbp]
	mov	rax, QWORD PTR [rax]
	mov	rdx, rax
	mov	rax, QWORD PTR -16[rbp]
	mov	rcx, rax
	call	rdx
	mov	QWORD PTR -24[rbp], rax
	lea	rcx, eb_path_to_ident[rip]
	mov	rax, QWORD PTR -24[rbp]
	mov	rdx, rax
	call	eb_path_to_ident
	mov	QWORD PTR -32[rbp], rax
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -40[rbp], rax
	lea	rax, eb_compile_ir1f1f11001f[rip]
	mov	QWORD PTR -112[rbp], rax
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -104[rbp], rax
	lea	rdx, -112[rbp]
	lea	rcx, eb_and[rip]
	mov	rax, QWORD PTR -40[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_and
	mov	QWORD PTR -48[rbp], rax
	lea	rax, eb_compile_ir1f1f1101f[rip]
	mov	QWORD PTR -128[rbp], rax
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -120[rbp], rax
	lea	rax, eb_compile_ir1f1f1102f[rip]
	mov	QWORD PTR -144[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 16
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -136[rbp], rax
	lea	r8, -144[rbp]
	lea	rdx, -128[rbp]
	lea	rcx, eb_if[rip]
	mov	rax, QWORD PTR -48[rbp]
	mov	r9, r8
	mov	r8, rdx
	mov	rdx, rax
	call	eb_if
	mov	QWORD PTR -56[rbp], rax
	mov	QWORD PTR -64[rbp], 0
	lea	rcx, eb_cons[rip]
	mov	rdx, QWORD PTR -64[rbp]
	mov	rax, QWORD PTR -56[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_cons
	mov	QWORD PTR -72[rbp], rax
	lea	rcx, eb_cons[rip]
	mov	rdx, QWORD PTR -72[rbp]
	mov	rax, QWORD PTR -32[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_cons
	mov	QWORD PTR -80[rbp], rax
	lea	rcx, eb_ir_of_form[rip]
	mov	rdx, QWORD PTR -80[rbp]
	mov	rax, QWORD PTR -8[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_ir_of_form
	mov	QWORD PTR -88[rbp], rax
	mov	rax, QWORD PTR -88[rbp]
	add	rsp, 176
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_compile_ir1f
	.def	eb_compile_ir1f;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_compile_ir1f
eb_compile_ir1f:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 96
	.seh_stackalloc	96
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -8[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 24
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -16[rbp], rax
	lea	rcx, eb_cdr[rip]
	mov	rax, QWORD PTR -16[rbp]
	mov	rdx, rax
	call	eb_cdr
	mov	QWORD PTR -24[rbp], rax
	lea	rcx, eb_defs_lookup[rip]
	mov	rdx, QWORD PTR -24[rbp]
	mov	rax, QWORD PTR -8[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_defs_lookup
	mov	QWORD PTR -32[rbp], rax
	lea	rax, eb_compile_ir1f1f[rip]
	mov	QWORD PTR -64[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 16
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -56[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 24
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -48[rbp], rax
	lea	rdx, -64[rbp]
	lea	rcx, eb_let[rip]
	mov	rax, QWORD PTR -32[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_let
	mov	QWORD PTR -40[rbp], rax
	mov	rax, QWORD PTR -40[rbp]
	add	rsp, 96
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_compile_ir2f1f01f1f01f
	.def	eb_compile_ir2f1f01f1f01f;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_compile_ir2f1f01f1f01f
eb_compile_ir2f1f01f1f01f:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	add	rsp, -128
	.seh_stackalloc	128
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	lea	rax, eb_ir_form_type_closure_get[rip]
	mov	rcx, rax
	call	eb_ir_form_type_closure_get
	mov	QWORD PTR -8[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -16[rbp], rax
	lea	rcx, eb_path_to_ident[rip]
	mov	rax, QWORD PTR -16[rbp]
	mov	rdx, rax
	call	eb_path_to_ident
	mov	QWORD PTR -24[rbp], rax
	mov	QWORD PTR -32[rbp], 0
	lea	rcx, eb_ir_of_number[rip]
	mov	rax, QWORD PTR -32[rbp]
	mov	rdx, rax
	call	eb_ir_of_number
	mov	QWORD PTR -40[rbp], rax
	mov	QWORD PTR -48[rbp], 0
	lea	rcx, eb_cons[rip]
	mov	rdx, QWORD PTR -48[rbp]
	mov	rax, QWORD PTR -40[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_cons
	mov	QWORD PTR -56[rbp], rax
	lea	rcx, eb_cons[rip]
	mov	rdx, QWORD PTR -56[rbp]
	mov	rax, QWORD PTR -24[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_cons
	mov	QWORD PTR -64[rbp], rax
	lea	rcx, eb_ir_of_form[rip]
	mov	rdx, QWORD PTR -64[rbp]
	mov	rax, QWORD PTR -8[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_ir_of_form
	mov	QWORD PTR -72[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -80[rbp], rax
	lea	rcx, eb_path_to_ident[rip]
	mov	rax, QWORD PTR -80[rbp]
	mov	rdx, rax
	call	eb_path_to_ident
	mov	QWORD PTR -88[rbp], rax
	lea	rcx, eb_cons[rip]
	mov	rdx, QWORD PTR -88[rbp]
	mov	rax, QWORD PTR -72[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_cons
	mov	QWORD PTR -96[rbp], rax
	mov	rax, QWORD PTR -96[rbp]
	sub	rsp, -128
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_compile_ir2f1f01f1f02f
	.def	eb_compile_ir2f1f01f1f02f;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_compile_ir2f1f01f1f02f
eb_compile_ir2f1f01f1f02f:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 96
	.seh_stackalloc	96
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 16
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -8[rbp], rax
	lea	rcx, eb_path_to_ident[rip]
	mov	rax, QWORD PTR -8[rbp]
	mov	rdx, rax
	call	eb_path_to_ident
	mov	QWORD PTR -16[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -24[rbp], rax
	lea	rcx, eb_cdr[rip]
	mov	rax, QWORD PTR -24[rbp]
	mov	rdx, rax
	call	eb_cdr
	mov	QWORD PTR -32[rbp], rax
	lea	rcx, eb_car[rip]
	mov	rax, QWORD PTR -32[rbp]
	mov	rdx, rax
	call	eb_car
	mov	QWORD PTR -40[rbp], rax
	lea	rcx, eb_cdr[rip]
	mov	rax, QWORD PTR -40[rbp]
	mov	rdx, rax
	call	eb_cdr
	mov	QWORD PTR -48[rbp], rax
	lea	rcx, eb_ir_of_ident[rip]
	mov	rax, QWORD PTR -48[rbp]
	mov	rdx, rax
	call	eb_ir_of_ident
	mov	QWORD PTR -56[rbp], rax
	lea	rcx, eb_cons[rip]
	mov	rdx, QWORD PTR -56[rbp]
	mov	rax, QWORD PTR -16[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_cons
	mov	QWORD PTR -64[rbp], rax
	mov	rax, QWORD PTR -64[rbp]
	add	rsp, 96
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_compile_ir2f1f01f1f1f01f01f
	.def	eb_compile_ir2f1f01f1f1f01f01f;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_compile_ir2f1f01f1f1f01f01f
eb_compile_ir2f1f01f1f1f01f01f:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 16
	.seh_stackalloc	16
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -8[rbp], rax
	mov	rax, QWORD PTR -8[rbp]
	add	rsp, 16
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_compile_ir2f1f01f1f1f01f
	.def	eb_compile_ir2f1f01f1f1f01f;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_compile_ir2f1f01f1f1f01f
eb_compile_ir2f1f01f1f1f01f:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 112
	.seh_stackalloc	112
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 16
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -8[rbp], rax
	lea	rcx, eb_cdr[rip]
	mov	rax, QWORD PTR -8[rbp]
	mov	rdx, rax
	call	eb_cdr
	mov	QWORD PTR -16[rbp], rax
	lea	rcx, eb_car[rip]
	mov	rax, QWORD PTR -16[rbp]
	mov	rdx, rax
	call	eb_car
	mov	QWORD PTR -24[rbp], rax
	lea	rax, eb_compile_ir2f1f01f1f1f01f01f[rip]
	mov	QWORD PTR -80[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 24
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -72[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -32[rbp], rax
	lea	rdx, -80[rbp]
	lea	rcx, eb_compile_ir[rip]
	mov	r8, QWORD PTR -32[rbp]
	mov	rax, QWORD PTR -24[rbp]
	mov	r9, r8
	mov	r8, rdx
	mov	rdx, rax
	call	eb_compile_ir
	mov	QWORD PTR -40[rbp], rax
	mov	QWORD PTR -48[rbp], 0
	lea	rcx, eb_cons[rip]
	mov	rdx, QWORD PTR -48[rbp]
	mov	rax, QWORD PTR -40[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_cons
	mov	QWORD PTR -56[rbp], rax
	mov	rax, QWORD PTR -56[rbp]
	add	rsp, 112
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_compile_ir2f1f01f1f1f02f
	.def	eb_compile_ir2f1f01f1f1f02f;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_compile_ir2f1f01f1f1f02f
eb_compile_ir2f1f01f1f1f02f:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 16
	.seh_stackalloc	16
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	QWORD PTR -8[rbp], 0
	mov	rax, QWORD PTR -8[rbp]
	add	rsp, 16
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_compile_ir2f1f01f1f1f101f
	.def	eb_compile_ir2f1f01f1f1f101f;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_compile_ir2f1f01f1f1f101f
eb_compile_ir2f1f01f1f1f101f:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 48
	.seh_stackalloc	48
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -8[rbp], rax
	lea	rcx, eb_car[rip]
	mov	rax, QWORD PTR -8[rbp]
	mov	rdx, rax
	call	eb_car
	mov	QWORD PTR -16[rbp], rax
	mov	rax, QWORD PTR -16[rbp]
	add	rsp, 48
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_compile_ir2f1f01f1f1f102f
	.def	eb_compile_ir2f1f01f1f1f102f;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_compile_ir2f1f01f1f1f102f
eb_compile_ir2f1f01f1f1f102f:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 80
	.seh_stackalloc	80
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -8[rbp], rax
	lea	rcx, eb_cdr[rip]
	mov	rax, QWORD PTR -8[rbp]
	mov	rdx, rax
	call	eb_cdr
	mov	QWORD PTR -16[rbp], rax
	lea	rcx, eb_car[rip]
	mov	rax, QWORD PTR -16[rbp]
	mov	rdx, rax
	call	eb_car
	mov	QWORD PTR -24[rbp], rax
	lea	rcx, eb_cdr[rip]
	mov	rax, QWORD PTR -24[rbp]
	mov	rdx, rax
	call	eb_cdr
	mov	QWORD PTR -32[rbp], rax
	lea	rcx, eb_ir_of_ident[rip]
	mov	rax, QWORD PTR -32[rbp]
	mov	rdx, rax
	call	eb_ir_of_ident
	mov	QWORD PTR -40[rbp], rax
	mov	rax, QWORD PTR -40[rbp]
	add	rsp, 80
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_compile_ir2f1f01f1f1f11f00002f1f1f01f
	.def	eb_compile_ir2f1f01f1f1f11f00002f1f1f01f;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_compile_ir2f1f01f1f1f11f00002f1f1f01f
eb_compile_ir2f1f01f1f1f11f00002f1f1f01f:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 16
	.seh_stackalloc	16
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -8[rbp], rax
	mov	rax, QWORD PTR -8[rbp]
	add	rsp, 16
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_compile_ir2f1f01f1f1f11f00002f1f1f1f
	.def	eb_compile_ir2f1f01f1f1f11f00002f1f1f1f;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_compile_ir2f1f01f1f1f11f00002f1f1f1f
eb_compile_ir2f1f01f1f1f11f00002f1f1f1f:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 96
	.seh_stackalloc	96
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	QWORD PTR 24[rbp], rdx
	mov	QWORD PTR -8[rbp], 1
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 16
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -16[rbp], rax
	lea	rcx, eb_add[rip]
	mov	rdx, QWORD PTR -16[rbp]
	mov	rax, QWORD PTR -8[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_add
	mov	QWORD PTR -24[rbp], rax
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -32[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -40[rbp], rax
	lea	rcx, eb_cdr[rip]
	mov	rax, QWORD PTR -40[rbp]
	mov	rdx, rax
	call	eb_cdr
	mov	QWORD PTR -48[rbp], rax
	lea	rcx, eb_cons[rip]
	mov	rdx, QWORD PTR -48[rbp]
	mov	rax, QWORD PTR -32[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_cons
	mov	QWORD PTR -56[rbp], rax
	lea	rcx, eb_cons[rip]
	mov	rdx, QWORD PTR -56[rbp]
	mov	rax, QWORD PTR -24[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_cons
	mov	QWORD PTR -64[rbp], rax
	mov	rax, QWORD PTR -64[rbp]
	add	rsp, 96
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_compile_ir2f1f01f1f1f11f00002f1f1f
	.def	eb_compile_ir2f1f01f1f1f11f00002f1f1f;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_compile_ir2f1f01f1f1f11f00002f1f1f
eb_compile_ir2f1f01f1f1f11f00002f1f1f:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 112
	.seh_stackalloc	112
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	QWORD PTR 24[rbp], rdx
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 16
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -8[rbp], rax
	lea	rax, eb_compile_ir2f1f01f1f1f11f00002f1f1f01f[rip]
	mov	QWORD PTR -48[rbp], rax
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -40[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -16[rbp], rax
	lea	rdx, -48[rbp]
	lea	rcx, eb_compile_ir[rip]
	mov	r8, QWORD PTR -16[rbp]
	mov	rax, QWORD PTR -8[rbp]
	mov	r9, r8
	mov	r8, rdx
	mov	rdx, rax
	call	eb_compile_ir
	mov	QWORD PTR -24[rbp], rax
	lea	rax, eb_compile_ir2f1f01f1f1f11f00002f1f1f1f[rip]
	mov	QWORD PTR -80[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 24
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -72[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 32
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -64[rbp], rax
	lea	rdx, -80[rbp]
	lea	rcx, eb_let[rip]
	mov	rax, QWORD PTR -24[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_let
	mov	QWORD PTR -32[rbp], rax
	mov	rax, QWORD PTR -32[rbp]
	add	rsp, 112
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_compile_ir2f1f01f1f1f11f00002f1f
	.def	eb_compile_ir2f1f01f1f1f11f00002f1f;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_compile_ir2f1f01f1f1f11f00002f1f
eb_compile_ir2f1f01f1f1f11f00002f1f:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	add	rsp, -128
	.seh_stackalloc	128
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	QWORD PTR 24[rbp], rdx
	mov	QWORD PTR -8[rbp], 48
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -16[rbp], rax
	lea	rcx, eb_add[rip]
	mov	rdx, QWORD PTR -16[rbp]
	mov	rax, QWORD PTR -8[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_add
	mov	QWORD PTR -24[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 16
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -32[rbp], rax
	mov	rax, QWORD PTR -32[rbp]
	mov	rax, QWORD PTR [rax]
	mov	rdx, rax
	mov	rax, QWORD PTR -32[rbp]
	mov	rcx, rax
	call	rdx
	mov	QWORD PTR -40[rbp], rax
	lea	rcx, eb_cons[rip]
	mov	rdx, QWORD PTR -40[rbp]
	mov	rax, QWORD PTR -24[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_cons
	mov	QWORD PTR -48[rbp], rax
	lea	rax, eb_compile_ir2f1f01f1f1f11f00002f1f1f[rip]
	mov	QWORD PTR -96[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -88[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 24
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -80[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 32
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -72[rbp], rax
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -64[rbp], rax
	lea	rdx, -96[rbp]
	lea	rcx, eb_let[rip]
	mov	rax, QWORD PTR -48[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_let
	mov	QWORD PTR -56[rbp], rax
	mov	rax, QWORD PTR -56[rbp]
	sub	rsp, -128
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_compile_ir2f1f01f1f1f11f00002f
	.def	eb_compile_ir2f1f01f1f1f11f00002f;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_compile_ir2f1f01f1f1f11f00002f
eb_compile_ir2f1f01f1f1f11f00002f:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 96
	.seh_stackalloc	96
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	QWORD PTR 24[rbp], rdx
	mov	QWORD PTR 32[rbp], r8
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -8[rbp], rax
	lea	rcx, eb_car[rip]
	mov	rax, QWORD PTR -8[rbp]
	mov	rdx, rax
	call	eb_car
	mov	QWORD PTR -16[rbp], rax
	lea	rax, eb_compile_ir2f1f01f1f1f11f00002f1f[rip]
	mov	QWORD PTR -64[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -56[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 16
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -48[rbp], rax
	mov	rax, QWORD PTR 32[rbp]
	mov	QWORD PTR -40[rbp], rax
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -32[rbp], rax
	lea	rdx, -64[rbp]
	lea	rcx, eb_let[rip]
	mov	rax, QWORD PTR -16[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_let
	mov	QWORD PTR -24[rbp], rax
	mov	rax, QWORD PTR -24[rbp]
	add	rsp, 96
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_compile_ir2f1f01f1f1f11f101101102f1f
	.def	eb_compile_ir2f1f01f1f1f11f101101102f1f;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_compile_ir2f1f01f1f1f11f101101102f1f
eb_compile_ir2f1f01f1f1f11f101101102f1f:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 144
	.seh_stackalloc	144
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	QWORD PTR 24[rbp], rdx
	mov	QWORD PTR -8[rbp], 1
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -16[rbp], rax
	lea	rcx, eb_add[rip]
	mov	rdx, QWORD PTR -16[rbp]
	mov	rax, QWORD PTR -8[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_add
	mov	QWORD PTR -24[rbp], rax
	mov	QWORD PTR -32[rbp], 48
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -40[rbp], rax
	lea	rcx, eb_add[rip]
	mov	rdx, QWORD PTR -40[rbp]
	mov	rax, QWORD PTR -32[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_add
	mov	QWORD PTR -48[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -56[rbp], rax
	mov	rax, QWORD PTR -56[rbp]
	mov	rax, QWORD PTR [rax]
	mov	rdx, rax
	mov	rax, QWORD PTR -56[rbp]
	mov	rcx, rax
	call	rdx
	mov	QWORD PTR -64[rbp], rax
	lea	rcx, eb_cons[rip]
	mov	rdx, QWORD PTR -64[rbp]
	mov	rax, QWORD PTR -48[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_cons
	mov	QWORD PTR -72[rbp], rax
	lea	rcx, eb_path_to_ident[rip]
	mov	rax, QWORD PTR -72[rbp]
	mov	rdx, rax
	call	eb_path_to_ident
	mov	QWORD PTR -80[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 16
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -88[rbp], rax
	lea	rcx, eb_cdr[rip]
	mov	rax, QWORD PTR -88[rbp]
	mov	rdx, rax
	call	eb_cdr
	mov	QWORD PTR -96[rbp], rax
	lea	rcx, eb_cons[rip]
	mov	rdx, QWORD PTR -96[rbp]
	mov	rax, QWORD PTR -80[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_cons
	mov	QWORD PTR -104[rbp], rax
	lea	rcx, eb_cons[rip]
	mov	rdx, QWORD PTR -104[rbp]
	mov	rax, QWORD PTR -24[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_cons
	mov	QWORD PTR -112[rbp], rax
	mov	rax, QWORD PTR -112[rbp]
	add	rsp, 144
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_compile_ir2f1f01f1f1f11f101101102f
	.def	eb_compile_ir2f1f01f1f1f11f101101102f;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_compile_ir2f1f01f1f1f11f101101102f
eb_compile_ir2f1f01f1f1f11f101101102f:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 80
	.seh_stackalloc	80
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	QWORD PTR 24[rbp], rdx
	mov	QWORD PTR 32[rbp], r8
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -8[rbp], rax
	lea	rcx, eb_car[rip]
	mov	rax, QWORD PTR -8[rbp]
	mov	rdx, rax
	call	eb_car
	mov	QWORD PTR -16[rbp], rax
	lea	rax, eb_compile_ir2f1f01f1f1f11f101101102f1f[rip]
	mov	QWORD PTR -48[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -40[rbp], rax
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -32[rbp], rax
	lea	rdx, -48[rbp]
	lea	rcx, eb_let[rip]
	mov	rax, QWORD PTR -16[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_let
	mov	QWORD PTR -24[rbp], rax
	mov	rax, QWORD PTR -24[rbp]
	add	rsp, 80
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_compile_ir2f1f01f1f1f11f
	.def	eb_compile_ir2f1f01f1f1f11f;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_compile_ir2f1f01f1f1f11f
eb_compile_ir2f1f01f1f1f11f:
	push	rbp
	.seh_pushreg	rbp
	sub	rsp, 368
	.seh_stackalloc	368
	lea	rbp, 128[rsp]
	.seh_setframe	rbp, 128
	.seh_endprologue
	mov	QWORD PTR 256[rbp], rcx
	mov	QWORD PTR 264[rbp], rdx
	mov	QWORD PTR 232[rbp], 0
	mov	QWORD PTR 224[rbp], 0
	lea	rcx, eb_cons[rip]
	mov	rdx, QWORD PTR 224[rbp]
	mov	rax, QWORD PTR 232[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_cons
	mov	QWORD PTR 216[rbp], rax
	mov	rax, QWORD PTR 256[rbp]
	add	rax, 24
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR 208[rbp], rax
	lea	rcx, eb_cdr[rip]
	mov	rax, QWORD PTR 208[rbp]
	mov	rdx, rax
	call	eb_cdr
	mov	QWORD PTR 200[rbp], rax
	lea	rcx, eb_cdr[rip]
	mov	rax, QWORD PTR 200[rbp]
	mov	rdx, rax
	call	eb_cdr
	mov	QWORD PTR 192[rbp], rax
	lea	rcx, eb_reverse[rip]
	mov	rax, QWORD PTR 192[rbp]
	mov	rdx, rax
	call	eb_reverse
	mov	QWORD PTR 184[rbp], rax
	lea	rax, eb_compile_ir2f1f01f1f1f11f00002f[rip]
	mov	QWORD PTR -80[rbp], rax
	mov	rax, QWORD PTR 256[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -72[rbp], rax
	mov	rax, QWORD PTR 256[rbp]
	add	rax, 16
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -64[rbp], rax
	lea	r8, -80[rbp]
	lea	rcx, eb_fold[rip]
	mov	rdx, QWORD PTR 184[rbp]
	mov	rax, QWORD PTR 216[rbp]
	mov	r9, r8
	mov	r8, rdx
	mov	rdx, rax
	call	eb_fold
	mov	QWORD PTR 176[rbp], rax
	lea	rcx, eb_cdr[rip]
	mov	rax, QWORD PTR 176[rbp]
	mov	rdx, rax
	call	eb_cdr
	mov	QWORD PTR 168[rbp], rax
	lea	rcx, eb_reverse[rip]
	mov	rax, QWORD PTR 168[rbp]
	mov	rdx, rax
	call	eb_reverse
	mov	QWORD PTR 160[rbp], rax
	lea	rcx, eb_ir_of_form_block[rip]
	mov	rax, QWORD PTR 160[rbp]
	mov	rdx, rax
	call	eb_ir_of_form_block
	mov	QWORD PTR 152[rbp], rax
	lea	rax, eb_ir_form_type_let[rip]
	mov	rcx, rax
	call	eb_ir_form_type_let
	mov	QWORD PTR 144[rbp], rax
	mov	rax, QWORD PTR 256[rbp]
	add	rax, 16
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR 136[rbp], rax
	mov	rax, QWORD PTR 136[rbp]
	mov	rax, QWORD PTR [rax]
	mov	rdx, rax
	mov	rax, QWORD PTR 136[rbp]
	mov	rcx, rax
	call	rdx
	mov	QWORD PTR 128[rbp], rax
	lea	rcx, eb_path_to_ident[rip]
	mov	rax, QWORD PTR 128[rbp]
	mov	rdx, rax
	call	eb_path_to_ident
	mov	QWORD PTR 120[rbp], rax
	lea	rax, eb_ir_form_type_call[rip]
	mov	rcx, rax
	call	eb_ir_form_type_call
	mov	QWORD PTR 112[rbp], rax
	mov	rax, QWORD PTR 264[rbp]
	mov	QWORD PTR 104[rbp], rax
	mov	QWORD PTR 96[rbp], 0
	mov	rax, QWORD PTR 256[rbp]
	add	rax, 32
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR 88[rbp], rax
	lea	rcx, eb_cdr[rip]
	mov	rax, QWORD PTR 88[rbp]
	mov	rdx, rax
	call	eb_cdr
	mov	QWORD PTR 80[rbp], rax
	mov	QWORD PTR 72[rbp], 0
	lea	rcx, eb_cons[rip]
	mov	rdx, QWORD PTR 72[rbp]
	mov	rax, QWORD PTR 80[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_cons
	mov	QWORD PTR 64[rbp], rax
	lea	rcx, eb_cons[rip]
	mov	rdx, QWORD PTR 64[rbp]
	mov	rax, QWORD PTR 96[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_cons
	mov	QWORD PTR 56[rbp], rax
	mov	rax, QWORD PTR 256[rbp]
	add	rax, 24
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR 48[rbp], rax
	lea	rcx, eb_cdr[rip]
	mov	rax, QWORD PTR 48[rbp]
	mov	rdx, rax
	call	eb_cdr
	mov	QWORD PTR 40[rbp], rax
	lea	rcx, eb_cdr[rip]
	mov	rax, QWORD PTR 40[rbp]
	mov	rdx, rax
	call	eb_cdr
	mov	QWORD PTR 32[rbp], rax
	lea	rax, eb_compile_ir2f1f01f1f1f11f101101102f[rip]
	mov	QWORD PTR -96[rbp], rax
	mov	rax, QWORD PTR 256[rbp]
	add	rax, 16
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -88[rbp], rax
	lea	r8, -96[rbp]
	lea	rcx, eb_fold[rip]
	mov	rdx, QWORD PTR 32[rbp]
	mov	rax, QWORD PTR 56[rbp]
	mov	r9, r8
	mov	r8, rdx
	mov	rdx, rax
	call	eb_fold
	mov	QWORD PTR 24[rbp], rax
	lea	rcx, eb_cdr[rip]
	mov	rax, QWORD PTR 24[rbp]
	mov	rdx, rax
	call	eb_cdr
	mov	QWORD PTR 16[rbp], rax
	lea	rcx, eb_cons[rip]
	mov	rdx, QWORD PTR 16[rbp]
	mov	rax, QWORD PTR 104[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_cons
	mov	QWORD PTR 8[rbp], rax
	lea	rcx, eb_ir_of_form[rip]
	mov	rdx, QWORD PTR 8[rbp]
	mov	rax, QWORD PTR 112[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_ir_of_form
	mov	QWORD PTR 0[rbp], rax
	mov	QWORD PTR -8[rbp], 0
	lea	rcx, eb_cons[rip]
	mov	rdx, QWORD PTR -8[rbp]
	mov	rax, QWORD PTR 0[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_cons
	mov	QWORD PTR -16[rbp], rax
	lea	rcx, eb_cons[rip]
	mov	rdx, QWORD PTR -16[rbp]
	mov	rax, QWORD PTR 120[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_cons
	mov	QWORD PTR -24[rbp], rax
	lea	rcx, eb_ir_of_form[rip]
	mov	rdx, QWORD PTR -24[rbp]
	mov	rax, QWORD PTR 144[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_ir_of_form
	mov	QWORD PTR -32[rbp], rax
	mov	QWORD PTR -40[rbp], 0
	lea	rcx, eb_cons[rip]
	mov	rdx, QWORD PTR -40[rbp]
	mov	rax, QWORD PTR -32[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_cons
	mov	QWORD PTR -48[rbp], rax
	lea	rcx, eb_cons[rip]
	mov	rdx, QWORD PTR -48[rbp]
	mov	rax, QWORD PTR 152[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_cons
	mov	QWORD PTR -56[rbp], rax
	mov	rax, QWORD PTR -56[rbp]
	add	rsp, 368
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_compile_ir2f1f01f1f1f
	.def	eb_compile_ir2f1f01f1f1f;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_compile_ir2f1f01f1f1f
eb_compile_ir2f1f01f1f1f:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 208
	.seh_stackalloc	208
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	QWORD PTR 24[rbp], rdx
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 32
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -8[rbp], rax
	lea	rax, eb_compile_ir2f1f01f1f1f01f[rip]
	mov	QWORD PTR -80[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -72[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 24
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -64[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 40
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -56[rbp], rax
	lea	rax, eb_compile_ir2f1f01f1f1f02f[rip]
	mov	QWORD PTR -88[rbp], rax
	lea	r8, -88[rbp]
	lea	rdx, -80[rbp]
	lea	rcx, eb_if[rip]
	mov	rax, QWORD PTR -8[rbp]
	mov	r9, r8
	mov	r8, rdx
	mov	rdx, rax
	call	eb_if
	mov	QWORD PTR -16[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 32
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -24[rbp], rax
	lea	rax, eb_compile_ir2f1f01f1f1f101f[rip]
	mov	QWORD PTR -112[rbp], rax
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -104[rbp], rax
	lea	rax, eb_compile_ir2f1f01f1f1f102f[rip]
	mov	QWORD PTR -128[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 24
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -120[rbp], rax
	lea	r8, -128[rbp]
	lea	rdx, -112[rbp]
	lea	rcx, eb_if[rip]
	mov	rax, QWORD PTR -24[rbp]
	mov	r9, r8
	mov	r8, rdx
	mov	rdx, rax
	call	eb_if
	mov	QWORD PTR -32[rbp], rax
	lea	rax, eb_compile_ir2f1f01f1f1f11f[rip]
	mov	QWORD PTR -176[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -168[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 16
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -160[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 24
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -152[rbp], rax
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -144[rbp], rax
	lea	rdx, -176[rbp]
	lea	rcx, eb_let[rip]
	mov	rax, QWORD PTR -32[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_let
	mov	QWORD PTR -40[rbp], rax
	lea	rcx, eb_concat[rip]
	mov	rdx, QWORD PTR -40[rbp]
	mov	rax, QWORD PTR -16[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_concat
	mov	QWORD PTR -48[rbp], rax
	mov	rax, QWORD PTR -48[rbp]
	add	rsp, 208
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_compile_ir2f1f01f1f
	.def	eb_compile_ir2f1f01f1f;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_compile_ir2f1f01f1f
eb_compile_ir2f1f01f1f:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 160
	.seh_stackalloc	160
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	QWORD PTR 24[rbp], rdx
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 32
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -8[rbp], rax
	lea	rax, eb_compile_ir2f1f01f1f01f[rip]
	mov	QWORD PTR -48[rbp], rax
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -40[rbp], rax
	lea	rax, eb_compile_ir2f1f01f1f02f[rip]
	mov	QWORD PTR -80[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 24
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -72[rbp], rax
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -64[rbp], rax
	lea	r8, -80[rbp]
	lea	rdx, -48[rbp]
	lea	rcx, eb_if[rip]
	mov	rax, QWORD PTR -8[rbp]
	mov	r9, r8
	mov	r8, rdx
	mov	rdx, rax
	call	eb_if
	mov	QWORD PTR -16[rbp], rax
	lea	rax, eb_compile_ir2f1f01f1f1f[rip]
	mov	QWORD PTR -128[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -120[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 16
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -112[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 24
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -104[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 32
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -96[rbp], rax
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -88[rbp], rax
	lea	rdx, -128[rbp]
	lea	rcx, eb_let[rip]
	mov	rax, QWORD PTR -16[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_let
	mov	QWORD PTR -24[rbp], rax
	mov	rax, QWORD PTR -24[rbp]
	add	rsp, 160
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_compile_ir2f1f01f
	.def	eb_compile_ir2f1f01f;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_compile_ir2f1f01f
eb_compile_ir2f1f01f:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 112
	.seh_stackalloc	112
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	QWORD PTR 24[rbp], rdx
	mov	QWORD PTR -8[rbp], 99
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 16
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -16[rbp], rax
	mov	rax, QWORD PTR -16[rbp]
	mov	rax, QWORD PTR [rax]
	mov	rdx, rax
	mov	rax, QWORD PTR -16[rbp]
	mov	rcx, rax
	call	rdx
	mov	QWORD PTR -24[rbp], rax
	lea	rcx, eb_cons[rip]
	mov	rdx, QWORD PTR -24[rbp]
	mov	rax, QWORD PTR -8[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_cons
	mov	QWORD PTR -32[rbp], rax
	lea	rax, eb_compile_ir2f1f01f1f[rip]
	mov	QWORD PTR -80[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -72[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 16
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -64[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 24
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -56[rbp], rax
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -48[rbp], rax
	lea	rdx, -80[rbp]
	lea	rcx, eb_let[rip]
	mov	rax, QWORD PTR -32[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_let
	mov	QWORD PTR -40[rbp], rax
	mov	rax, QWORD PTR -40[rbp]
	add	rsp, 112
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_compile_ir2f1f
	.def	eb_compile_ir2f1f;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_compile_ir2f1f
eb_compile_ir2f1f:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	add	rsp, -128
	.seh_stackalloc	128
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -8[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 24
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -16[rbp], rax
	lea	rcx, eb_cdr[rip]
	mov	rax, QWORD PTR -16[rbp]
	mov	rdx, rax
	call	eb_cdr
	mov	QWORD PTR -24[rbp], rax
	lea	rcx, eb_car[rip]
	mov	rax, QWORD PTR -24[rbp]
	mov	rdx, rax
	call	eb_car
	mov	QWORD PTR -32[rbp], rax
	lea	rcx, eb_cdr[rip]
	mov	rax, QWORD PTR -32[rbp]
	mov	rdx, rax
	call	eb_cdr
	mov	QWORD PTR -40[rbp], rax
	lea	rcx, eb_defs_lookup[rip]
	mov	rdx, QWORD PTR -40[rbp]
	mov	rax, QWORD PTR -8[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_defs_lookup
	mov	QWORD PTR -48[rbp], rax
	lea	rax, eb_compile_ir2f1f01f[rip]
	mov	QWORD PTR -96[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -88[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 16
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -80[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 24
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -72[rbp], rax
	lea	rdx, -96[rbp]
	lea	rcx, eb_let[rip]
	mov	rax, QWORD PTR -48[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_let
	mov	QWORD PTR -56[rbp], rax
	lea	rcx, eb_ir_of_form_block[rip]
	mov	rax, QWORD PTR -56[rbp]
	mov	rdx, rax
	call	eb_ir_of_form_block
	mov	QWORD PTR -64[rbp], rax
	mov	rax, QWORD PTR -64[rbp]
	sub	rsp, -128
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_compile_ir2f2f1f1f02f
	.def	eb_compile_ir2f2f1f1f02f;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_compile_ir2f2f1f1f02f
eb_compile_ir2f2f1f1f02f:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 96
	.seh_stackalloc	96
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	QWORD PTR 24[rbp], rdx
	mov	QWORD PTR 32[rbp], r8
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -8[rbp], rax
	mov	rax, QWORD PTR 32[rbp]
	mov	QWORD PTR -16[rbp], rax
	lea	rcx, eb_cdr[rip]
	mov	rax, QWORD PTR -16[rbp]
	mov	rdx, rax
	call	eb_cdr
	mov	QWORD PTR -24[rbp], rax
	mov	QWORD PTR -32[rbp], 0
	mov	rax, QWORD PTR 32[rbp]
	mov	QWORD PTR -40[rbp], rax
	lea	rcx, eb_cdr[rip]
	mov	rax, QWORD PTR -40[rbp]
	mov	rdx, rax
	call	eb_cdr
	mov	QWORD PTR -48[rbp], rax
	lea	rcx, eb_cons[rip]
	mov	rdx, QWORD PTR -48[rbp]
	mov	rax, QWORD PTR -32[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_cons
	mov	QWORD PTR -56[rbp], rax
	lea	rcx, eb_defs_append[rip]
	mov	r8, QWORD PTR -56[rbp]
	mov	rdx, QWORD PTR -24[rbp]
	mov	rax, QWORD PTR -8[rbp]
	mov	r9, r8
	mov	r8, rdx
	mov	rdx, rax
	call	eb_defs_append
	mov	QWORD PTR -64[rbp], rax
	mov	rax, QWORD PTR -64[rbp]
	add	rsp, 96
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_compile_ir2f2f1f1f1f01f
	.def	eb_compile_ir2f2f1f1f1f01f;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_compile_ir2f2f1f1f1f01f
eb_compile_ir2f2f1f1f1f01f:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 16
	.seh_stackalloc	16
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -8[rbp], rax
	mov	rax, QWORD PTR -8[rbp]
	add	rsp, 16
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_compile_ir2f2f1f1f1f03f1f
	.def	eb_compile_ir2f2f1f1f1f03f1f;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_compile_ir2f2f1f1f1f03f1f
eb_compile_ir2f2f1f1f1f03f1f:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 48
	.seh_stackalloc	48
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 16
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -8[rbp], rax
	mov	rax, QWORD PTR -8[rbp]
	mov	rax, QWORD PTR [rax]
	mov	rdx, rax
	mov	rax, QWORD PTR -8[rbp]
	mov	rcx, rax
	call	rdx
	mov	QWORD PTR -16[rbp], rax
	mov	rax, QWORD PTR -16[rbp]
	add	rsp, 48
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_compile_ir2f2f1f1f1f03f
	.def	eb_compile_ir2f2f1f1f1f03f;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_compile_ir2f2f1f1f1f03f
eb_compile_ir2f2f1f1f1f03f:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 80
	.seh_stackalloc	80
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	QWORD PTR 24[rbp], rdx
	mov	QWORD PTR 32[rbp], r8
	mov	QWORD PTR 40[rbp], r9
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -8[rbp], rax
	lea	rax, eb_compile_ir2f2f1f1f1f03f1f[rip]
	mov	QWORD PTR -48[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 16
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -40[rbp], rax
	mov	rax, QWORD PTR 32[rbp]
	mov	QWORD PTR -32[rbp], rax
	mov	rax, QWORD PTR 40[rbp]
	mov	QWORD PTR -16[rbp], rax
	lea	rdx, -48[rbp]
	lea	rcx, eb_compile_ir[rip]
	mov	r8, QWORD PTR -16[rbp]
	mov	rax, QWORD PTR -8[rbp]
	mov	r9, r8
	mov	r8, rdx
	mov	rdx, rax
	call	eb_compile_ir
	mov	QWORD PTR -24[rbp], rax
	mov	rax, QWORD PTR -24[rbp]
	add	rsp, 80
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_compile_ir2f2f1f1f1f1f0110111f
	.def	eb_compile_ir2f2f1f1f1f1f0110111f;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_compile_ir2f2f1f1f1f1f0110111f
eb_compile_ir2f2f1f1f1f1f0110111f:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 64
	.seh_stackalloc	64
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	QWORD PTR 24[rbp], rdx
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -8[rbp], rax
	lea	rcx, eb_cdr[rip]
	mov	rax, QWORD PTR -8[rbp]
	mov	rdx, rax
	call	eb_cdr
	mov	QWORD PTR -16[rbp], rax
	lea	rcx, eb_ir_of_ident[rip]
	mov	rax, QWORD PTR -16[rbp]
	mov	rdx, rax
	call	eb_ir_of_ident
	mov	QWORD PTR -24[rbp], rax
	mov	rax, QWORD PTR -24[rbp]
	add	rsp, 64
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_compile_ir2f2f1f1f1f1f01110001f
	.def	eb_compile_ir2f2f1f1f1f1f01110001f;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_compile_ir2f2f1f1f1f1f01110001f
eb_compile_ir2f2f1f1f1f1f01110001f:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 16
	.seh_stackalloc	16
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -8[rbp], rax
	mov	rax, QWORD PTR -8[rbp]
	add	rsp, 16
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_compile_ir2f2f1f1f1f1f1f
	.def	eb_compile_ir2f2f1f1f1f1f1f;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_compile_ir2f2f1f1f1f1f1f
eb_compile_ir2f2f1f1f1f1f1f:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 80
	.seh_stackalloc	80
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	QWORD PTR 24[rbp], rdx
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -8[rbp], rax
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -16[rbp], rax
	mov	QWORD PTR -24[rbp], 0
	lea	rcx, eb_cons[rip]
	mov	rdx, QWORD PTR -24[rbp]
	mov	rax, QWORD PTR -16[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_cons
	mov	QWORD PTR -32[rbp], rax
	lea	rcx, eb_concat[rip]
	mov	rdx, QWORD PTR -32[rbp]
	mov	rax, QWORD PTR -8[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_concat
	mov	QWORD PTR -40[rbp], rax
	mov	rax, QWORD PTR -40[rbp]
	add	rsp, 80
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_compile_ir2f2f1f1f1f1f
	.def	eb_compile_ir2f2f1f1f1f1f;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_compile_ir2f2f1f1f1f1f
eb_compile_ir2f2f1f1f1f1f:
	push	rbp
	.seh_pushreg	rbp
	sub	rsp, 352
	.seh_stackalloc	352
	lea	rbp, 128[rsp]
	.seh_setframe	rbp, 128
	.seh_endprologue
	mov	QWORD PTR 240[rbp], rcx
	mov	QWORD PTR 248[rbp], rdx
	lea	rax, eb_ir_form_type_function[rip]
	mov	rcx, rax
	call	eb_ir_form_type_function
	mov	QWORD PTR 216[rbp], rax
	mov	rax, QWORD PTR 240[rbp]
	add	rax, 24
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR 208[rbp], rax
	lea	rcx, eb_path_to_ident[rip]
	mov	rax, QWORD PTR 208[rbp]
	mov	rdx, rax
	call	eb_path_to_ident
	mov	QWORD PTR 200[rbp], rax
	lea	rax, eb_ir_form_type_params[rip]
	mov	rcx, rax
	call	eb_ir_form_type_params
	mov	QWORD PTR 192[rbp], rax
	lea	rax, .LC36[rip]
	mov	rdx, rax
	lea	rax, eb_compile_ir2f2f1f1f1f1f0110100.48[rip]
	mov	rcx, rax
	call	ebz_stol
	mov	rax, QWORD PTR eb_compile_ir2f2f1f1f1f1f0110100.48[rip]
	lea	rcx, eb_ir_of_ident[rip]
	mov	rdx, rax
	call	eb_ir_of_ident
	mov	QWORD PTR 184[rbp], rax
	mov	rax, QWORD PTR 240[rbp]
	add	rax, 16
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR 176[rbp], rax
	lea	rcx, eb_cdr[rip]
	mov	rax, QWORD PTR 176[rbp]
	mov	rdx, rax
	call	eb_cdr
	mov	QWORD PTR 168[rbp], rax
	lea	rcx, eb_car[rip]
	mov	rax, QWORD PTR 168[rbp]
	mov	rdx, rax
	call	eb_car
	mov	QWORD PTR 160[rbp], rax
	lea	rcx, eb_cdr[rip]
	mov	rax, QWORD PTR 160[rbp]
	mov	rdx, rax
	call	eb_cdr
	mov	QWORD PTR 152[rbp], rax
	lea	rcx, eb_cdr[rip]
	mov	rax, QWORD PTR 152[rbp]
	mov	rdx, rax
	call	eb_cdr
	mov	QWORD PTR 144[rbp], rax
	lea	rax, eb_compile_ir2f2f1f1f1f1f0110111f[rip]
	mov	QWORD PTR -56[rbp], rax
	lea	rdx, -56[rbp]
	lea	rcx, eb_map[rip]
	mov	rax, QWORD PTR 144[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_map
	mov	QWORD PTR 136[rbp], rax
	lea	rcx, eb_cons[rip]
	mov	rdx, QWORD PTR 136[rbp]
	mov	rax, QWORD PTR 184[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_cons
	mov	QWORD PTR 128[rbp], rax
	lea	rcx, eb_ir_of_form[rip]
	mov	rdx, QWORD PTR 128[rbp]
	mov	rax, QWORD PTR 192[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_ir_of_form
	mov	QWORD PTR 120[rbp], rax
	mov	rax, QWORD PTR 240[rbp]
	add	rax, 16
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR 112[rbp], rax
	lea	rcx, eb_cdr[rip]
	mov	rax, QWORD PTR 112[rbp]
	mov	rdx, rax
	call	eb_cdr
	mov	QWORD PTR 104[rbp], rax
	lea	rcx, eb_cdr[rip]
	mov	rax, QWORD PTR 104[rbp]
	mov	rdx, rax
	call	eb_cdr
	mov	QWORD PTR 96[rbp], rax
	lea	rax, eb_compile_ir2f2f1f1f1f1f01110001f[rip]
	mov	QWORD PTR -80[rbp], rax
	mov	rax, QWORD PTR 240[rbp]
	add	rax, 24
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -72[rbp], rax
	mov	rax, QWORD PTR 240[rbp]
	add	rax, 32
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR 88[rbp], rax
	lea	rdx, -80[rbp]
	lea	rcx, eb_compile_ir[rip]
	mov	r8, QWORD PTR 88[rbp]
	mov	rax, QWORD PTR 96[rbp]
	mov	r9, r8
	mov	r8, rdx
	mov	rdx, rax
	call	eb_compile_ir
	mov	QWORD PTR 80[rbp], rax
	lea	rax, eb_ir_form_type_return[rip]
	mov	rcx, rax
	call	eb_ir_form_type_return
	mov	QWORD PTR 72[rbp], rax
	mov	rax, QWORD PTR 240[rbp]
	add	rax, 24
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR 64[rbp], rax
	lea	rcx, eb_path_to_ident[rip]
	mov	rax, QWORD PTR 64[rbp]
	mov	rdx, rax
	call	eb_path_to_ident
	mov	QWORD PTR 56[rbp], rax
	mov	QWORD PTR 48[rbp], 0
	lea	rcx, eb_cons[rip]
	mov	rdx, QWORD PTR 48[rbp]
	mov	rax, QWORD PTR 56[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_cons
	mov	QWORD PTR 40[rbp], rax
	lea	rcx, eb_ir_of_form[rip]
	mov	rdx, QWORD PTR 40[rbp]
	mov	rax, QWORD PTR 72[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_ir_of_form
	mov	QWORD PTR 32[rbp], rax
	mov	QWORD PTR 24[rbp], 0
	lea	rcx, eb_cons[rip]
	mov	rdx, QWORD PTR 24[rbp]
	mov	rax, QWORD PTR 32[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_cons
	mov	QWORD PTR 16[rbp], rax
	lea	rcx, eb_cons[rip]
	mov	rdx, QWORD PTR 16[rbp]
	mov	rax, QWORD PTR 80[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_cons
	mov	QWORD PTR 8[rbp], rax
	lea	rcx, eb_ir_of_form_block[rip]
	mov	rax, QWORD PTR 8[rbp]
	mov	rdx, rax
	call	eb_ir_of_form_block
	mov	QWORD PTR 0[rbp], rax
	mov	QWORD PTR -8[rbp], 0
	lea	rcx, eb_cons[rip]
	mov	rdx, QWORD PTR -8[rbp]
	mov	rax, QWORD PTR 0[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_cons
	mov	QWORD PTR -16[rbp], rax
	lea	rcx, eb_cons[rip]
	mov	rdx, QWORD PTR -16[rbp]
	mov	rax, QWORD PTR 120[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_cons
	mov	QWORD PTR -24[rbp], rax
	lea	rcx, eb_cons[rip]
	mov	rdx, QWORD PTR -24[rbp]
	mov	rax, QWORD PTR 200[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_cons
	mov	QWORD PTR -32[rbp], rax
	lea	rcx, eb_ir_of_form[rip]
	mov	rdx, QWORD PTR -32[rbp]
	mov	rax, QWORD PTR 216[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_ir_of_form
	mov	QWORD PTR -40[rbp], rax
	lea	rax, eb_compile_ir2f2f1f1f1f1f1f[rip]
	mov	QWORD PTR -96[rbp], rax
	mov	rax, QWORD PTR 248[rbp]
	mov	QWORD PTR -88[rbp], rax
	lea	rdx, -96[rbp]
	lea	rcx, eb_let[rip]
	mov	rax, QWORD PTR -40[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_let
	mov	QWORD PTR -48[rbp], rax
	mov	rax, QWORD PTR -48[rbp]
	add	rsp, 352
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_compile_ir2f2f1f1f1f
	.def	eb_compile_ir2f2f1f1f1f;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_compile_ir2f2f1f1f1f
eb_compile_ir2f2f1f1f1f:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 208
	.seh_stackalloc	208
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	QWORD PTR 24[rbp], rdx
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 24
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -8[rbp], rax
	lea	rcx, eb_cdr[rip]
	mov	rax, QWORD PTR -8[rbp]
	mov	rdx, rax
	call	eb_cdr
	mov	QWORD PTR -16[rbp], rax
	lea	rcx, eb_cdr[rip]
	mov	rax, QWORD PTR -16[rbp]
	mov	rdx, rax
	call	eb_cdr
	mov	QWORD PTR -24[rbp], rax
	lea	rax, eb_compile_ir2f2f1f1f1f01f[rip]
	mov	QWORD PTR -64[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 32
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -56[rbp], rax
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -32[rbp], rax
	lea	rax, eb_compile_ir2f2f1f1f1f03f[rip]
	mov	QWORD PTR -112[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -104[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 16
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -96[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 24
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -88[rbp], rax
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -80[rbp], rax
	lea	rdx, -112[rbp]
	lea	r8, -64[rbp]
	lea	rcx, eb_compile_ir_pre[rip]
	mov	r9, QWORD PTR -32[rbp]
	mov	rax, QWORD PTR -24[rbp]
	mov	QWORD PTR 32[rsp], rdx
	mov	rdx, rax
	call	eb_compile_ir_pre
	mov	QWORD PTR -40[rbp], rax
	lea	rax, eb_compile_ir2f2f1f1f1f1f[rip]
	mov	QWORD PTR -160[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -152[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 24
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -144[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 32
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -136[rbp], rax
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -128[rbp], rax
	lea	rdx, -160[rbp]
	lea	rcx, eb_let[rip]
	mov	rax, QWORD PTR -40[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_let
	mov	QWORD PTR -48[rbp], rax
	mov	rax, QWORD PTR -48[rbp]
	add	rsp, 208
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_compile_ir2f2f1f1f
	.def	eb_compile_ir2f2f1f1f;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_compile_ir2f2f1f1f
eb_compile_ir2f2f1f1f:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 144
	.seh_stackalloc	144
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	QWORD PTR 24[rbp], rdx
	mov	QWORD PTR -8[rbp], 0
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 24
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -16[rbp], rax
	lea	rcx, eb_cdr[rip]
	mov	rax, QWORD PTR -16[rbp]
	mov	rdx, rax
	call	eb_cdr
	mov	QWORD PTR -24[rbp], rax
	lea	rcx, eb_car[rip]
	mov	rax, QWORD PTR -24[rbp]
	mov	rdx, rax
	call	eb_car
	mov	QWORD PTR -32[rbp], rax
	lea	rcx, eb_cdr[rip]
	mov	rax, QWORD PTR -32[rbp]
	mov	rdx, rax
	call	eb_cdr
	mov	QWORD PTR -40[rbp], rax
	lea	rcx, eb_cdr[rip]
	mov	rax, QWORD PTR -40[rbp]
	mov	rdx, rax
	call	eb_cdr
	mov	QWORD PTR -48[rbp], rax
	lea	rax, eb_compile_ir2f2f1f1f02f[rip]
	mov	QWORD PTR -72[rbp], rax
	lea	r8, -72[rbp]
	lea	rcx, eb_fold[rip]
	mov	rdx, QWORD PTR -48[rbp]
	mov	rax, QWORD PTR -8[rbp]
	mov	r9, r8
	mov	r8, rdx
	mov	rdx, rax
	call	eb_fold
	mov	QWORD PTR -56[rbp], rax
	lea	rax, eb_compile_ir2f2f1f1f1f[rip]
	mov	QWORD PTR -112[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -104[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 16
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -96[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 24
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -88[rbp], rax
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -80[rbp], rax
	lea	rdx, -112[rbp]
	lea	rcx, eb_let[rip]
	mov	rax, QWORD PTR -56[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_let
	mov	QWORD PTR -64[rbp], rax
	mov	rax, QWORD PTR -64[rbp]
	add	rsp, 144
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_compile_ir2f2f1f
	.def	eb_compile_ir2f2f1f;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_compile_ir2f2f1f
eb_compile_ir2f2f1f:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	add	rsp, -128
	.seh_stackalloc	128
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 24
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -8[rbp], rax
	lea	rcx, eb_cdr[rip]
	mov	rax, QWORD PTR -8[rbp]
	mov	rdx, rax
	call	eb_cdr
	mov	QWORD PTR -16[rbp], rax
	lea	rcx, eb_car[rip]
	mov	rax, QWORD PTR -16[rbp]
	mov	rdx, rax
	call	eb_car
	mov	QWORD PTR -24[rbp], rax
	lea	rcx, eb_cdr[rip]
	mov	rax, QWORD PTR -24[rbp]
	mov	rdx, rax
	call	eb_cdr
	mov	QWORD PTR -32[rbp], rax
	lea	rcx, eb_car[rip]
	mov	rax, QWORD PTR -32[rbp]
	mov	rdx, rax
	call	eb_car
	mov	QWORD PTR -40[rbp], rax
	lea	rcx, eb_cdr[rip]
	mov	rax, QWORD PTR -40[rbp]
	mov	rdx, rax
	call	eb_cdr
	mov	QWORD PTR -48[rbp], rax
	lea	rcx, eb_reverse[rip]
	mov	rax, QWORD PTR -48[rbp]
	mov	rdx, rax
	call	eb_reverse
	mov	QWORD PTR -56[rbp], rax
	lea	rax, eb_compile_ir2f2f1f1f[rip]
	mov	QWORD PTR -96[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -88[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 16
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -80[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 24
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -72[rbp], rax
	lea	rdx, -96[rbp]
	lea	rcx, eb_let[rip]
	mov	rax, QWORD PTR -56[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_let
	mov	QWORD PTR -64[rbp], rax
	mov	rax, QWORD PTR -64[rbp]
	sub	rsp, -128
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_compile_ir2f2f2f1f
	.def	eb_compile_ir2f2f2f1f;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_compile_ir2f2f2f1f
eb_compile_ir2f2f2f1f:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	add	rsp, -128
	.seh_stackalloc	128
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	lea	rax, eb_ir_form_type_let[rip]
	mov	rcx, rax
	call	eb_ir_form_type_let
	mov	QWORD PTR -8[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -16[rbp], rax
	mov	rax, QWORD PTR -16[rbp]
	mov	rax, QWORD PTR [rax]
	mov	rdx, rax
	mov	rax, QWORD PTR -16[rbp]
	mov	rcx, rax
	call	rdx
	mov	QWORD PTR -24[rbp], rax
	lea	rcx, eb_path_to_ident[rip]
	mov	rax, QWORD PTR -24[rbp]
	mov	rdx, rax
	call	eb_path_to_ident
	mov	QWORD PTR -32[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 16
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -40[rbp], rax
	lea	rcx, eb_cdr[rip]
	mov	rax, QWORD PTR -40[rbp]
	mov	rdx, rax
	call	eb_cdr
	mov	QWORD PTR -48[rbp], rax
	lea	rcx, eb_ir_of_number[rip]
	mov	rax, QWORD PTR -48[rbp]
	mov	rdx, rax
	call	eb_ir_of_number
	mov	QWORD PTR -56[rbp], rax
	mov	QWORD PTR -64[rbp], 0
	lea	rcx, eb_cons[rip]
	mov	rdx, QWORD PTR -64[rbp]
	mov	rax, QWORD PTR -56[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_cons
	mov	QWORD PTR -72[rbp], rax
	lea	rcx, eb_cons[rip]
	mov	rdx, QWORD PTR -72[rbp]
	mov	rax, QWORD PTR -32[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_cons
	mov	QWORD PTR -80[rbp], rax
	lea	rcx, eb_ir_of_form[rip]
	mov	rdx, QWORD PTR -80[rbp]
	mov	rax, QWORD PTR -8[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_ir_of_form
	mov	QWORD PTR -88[rbp], rax
	mov	rax, QWORD PTR -88[rbp]
	sub	rsp, -128
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_compile_ir2f2f2f2f1f011011f
	.def	eb_compile_ir2f2f2f2f1f011011f;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_compile_ir2f2f2f2f1f011011f
eb_compile_ir2f2f2f2f1f011011f:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 64
	.seh_stackalloc	64
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	QWORD PTR 24[rbp], rdx
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -8[rbp], rax
	lea	rcx, eb_cdr[rip]
	mov	rax, QWORD PTR -8[rbp]
	mov	rdx, rax
	call	eb_cdr
	mov	QWORD PTR -16[rbp], rax
	lea	rcx, eb_ir_of_ident[rip]
	mov	rax, QWORD PTR -16[rbp]
	mov	rdx, rax
	call	eb_ir_of_ident
	mov	QWORD PTR -24[rbp], rax
	mov	rax, QWORD PTR -24[rbp]
	add	rsp, 64
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_compile_ir2f2f2f2f1f
	.def	eb_compile_ir2f2f2f2f1f;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_compile_ir2f2f2f2f1f
eb_compile_ir2f2f2f2f1f:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 208
	.seh_stackalloc	208
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	lea	rax, eb_ir_form_type_extern[rip]
	mov	rcx, rax
	call	eb_ir_form_type_extern
	mov	QWORD PTR -8[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -16[rbp], rax
	lea	rcx, eb_cdr[rip]
	mov	rax, QWORD PTR -16[rbp]
	mov	rdx, rax
	call	eb_cdr
	mov	QWORD PTR -24[rbp], rax
	lea	rcx, eb_cdr[rip]
	mov	rax, QWORD PTR -24[rbp]
	mov	rdx, rax
	call	eb_cdr
	mov	QWORD PTR -32[rbp], rax
	lea	rcx, eb_car[rip]
	mov	rax, QWORD PTR -32[rbp]
	mov	rdx, rax
	call	eb_car
	mov	QWORD PTR -40[rbp], rax
	lea	rcx, eb_cdr[rip]
	mov	rax, QWORD PTR -40[rbp]
	mov	rdx, rax
	call	eb_cdr
	mov	QWORD PTR -48[rbp], rax
	lea	rcx, eb_ir_of_ident[rip]
	mov	rax, QWORD PTR -48[rbp]
	mov	rdx, rax
	call	eb_ir_of_ident
	mov	QWORD PTR -56[rbp], rax
	lea	rax, eb_ir_form_type_params[rip]
	mov	rcx, rax
	call	eb_ir_form_type_params
	mov	QWORD PTR -64[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -72[rbp], rax
	lea	rcx, eb_cdr[rip]
	mov	rax, QWORD PTR -72[rbp]
	mov	rdx, rax
	call	eb_cdr
	mov	QWORD PTR -80[rbp], rax
	lea	rcx, eb_cdr[rip]
	mov	rax, QWORD PTR -80[rbp]
	mov	rdx, rax
	call	eb_cdr
	mov	QWORD PTR -88[rbp], rax
	lea	rcx, eb_cdr[rip]
	mov	rax, QWORD PTR -88[rbp]
	mov	rdx, rax
	call	eb_cdr
	mov	QWORD PTR -96[rbp], rax
	lea	rax, eb_compile_ir2f2f2f2f1f011011f[rip]
	mov	QWORD PTR -168[rbp], rax
	lea	rdx, -168[rbp]
	lea	rcx, eb_map[rip]
	mov	rax, QWORD PTR -96[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_map
	mov	QWORD PTR -104[rbp], rax
	lea	rcx, eb_ir_of_form[rip]
	mov	rdx, QWORD PTR -104[rbp]
	mov	rax, QWORD PTR -64[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_ir_of_form
	mov	QWORD PTR -112[rbp], rax
	mov	QWORD PTR -120[rbp], 0
	lea	rcx, eb_cons[rip]
	mov	rdx, QWORD PTR -120[rbp]
	mov	rax, QWORD PTR -112[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_cons
	mov	QWORD PTR -128[rbp], rax
	lea	rcx, eb_cons[rip]
	mov	rdx, QWORD PTR -128[rbp]
	mov	rax, QWORD PTR -56[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_cons
	mov	QWORD PTR -136[rbp], rax
	lea	rcx, eb_ir_of_form[rip]
	mov	rdx, QWORD PTR -136[rbp]
	mov	rax, QWORD PTR -8[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_ir_of_form
	mov	QWORD PTR -144[rbp], rax
	mov	QWORD PTR -152[rbp], 0
	lea	rcx, eb_cons[rip]
	mov	rdx, QWORD PTR -152[rbp]
	mov	rax, QWORD PTR -144[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_cons
	mov	QWORD PTR -160[rbp], rax
	mov	rax, QWORD PTR -160[rbp]
	add	rsp, 208
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_compile_ir2f2f2f2f2f1f1f1f1f002f
	.def	eb_compile_ir2f2f2f2f2f1f1f1f1f002f;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_compile_ir2f2f2f2f2f1f1f1f1f002f
eb_compile_ir2f2f2f2f2f1f1f1f1f002f:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 144
	.seh_stackalloc	144
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	QWORD PTR 24[rbp], rdx
	mov	QWORD PTR 32[rbp], r8
	mov	QWORD PTR -8[rbp], 1
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -16[rbp], rax
	lea	rcx, eb_car[rip]
	mov	rax, QWORD PTR -16[rbp]
	mov	rdx, rax
	call	eb_car
	mov	QWORD PTR -24[rbp], rax
	lea	rcx, eb_add[rip]
	mov	rdx, QWORD PTR -24[rbp]
	mov	rax, QWORD PTR -8[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_add
	mov	QWORD PTR -32[rbp], rax
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -40[rbp], rax
	lea	rcx, eb_cdr[rip]
	mov	rax, QWORD PTR -40[rbp]
	mov	rdx, rax
	call	eb_cdr
	mov	QWORD PTR -48[rbp], rax
	mov	rax, QWORD PTR 32[rbp]
	mov	QWORD PTR -56[rbp], rax
	lea	rcx, eb_car[rip]
	mov	rax, QWORD PTR -56[rbp]
	mov	rdx, rax
	call	eb_car
	mov	QWORD PTR -64[rbp], rax
	mov	QWORD PTR -72[rbp], 1
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -80[rbp], rax
	lea	rcx, eb_car[rip]
	mov	rax, QWORD PTR -80[rbp]
	mov	rdx, rax
	call	eb_car
	mov	QWORD PTR -88[rbp], rax
	lea	rcx, eb_cons[rip]
	mov	rdx, QWORD PTR -88[rbp]
	mov	rax, QWORD PTR -72[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_cons
	mov	QWORD PTR -96[rbp], rax
	lea	rcx, eb_defs_append[rip]
	mov	r8, QWORD PTR -96[rbp]
	mov	rdx, QWORD PTR -64[rbp]
	mov	rax, QWORD PTR -48[rbp]
	mov	r9, r8
	mov	r8, rdx
	mov	rdx, rax
	call	eb_defs_append
	mov	QWORD PTR -104[rbp], rax
	lea	rcx, eb_cons[rip]
	mov	rdx, QWORD PTR -104[rbp]
	mov	rax, QWORD PTR -32[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_cons
	mov	QWORD PTR -112[rbp], rax
	mov	rax, QWORD PTR -112[rbp]
	add	rsp, 144
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_compile_ir2f2f2f2f2f1f1f1f1f1f002f
	.def	eb_compile_ir2f2f2f2f2f1f1f1f1f1f002f;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_compile_ir2f2f2f2f2f1f1f1f1f1f002f
eb_compile_ir2f2f2f2f2f1f1f1f1f1f002f:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 144
	.seh_stackalloc	144
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	QWORD PTR 24[rbp], rdx
	mov	QWORD PTR 32[rbp], r8
	mov	QWORD PTR -8[rbp], 1
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -16[rbp], rax
	lea	rcx, eb_car[rip]
	mov	rax, QWORD PTR -16[rbp]
	mov	rdx, rax
	call	eb_car
	mov	QWORD PTR -24[rbp], rax
	lea	rcx, eb_add[rip]
	mov	rdx, QWORD PTR -24[rbp]
	mov	rax, QWORD PTR -8[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_add
	mov	QWORD PTR -32[rbp], rax
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -40[rbp], rax
	lea	rcx, eb_cdr[rip]
	mov	rax, QWORD PTR -40[rbp]
	mov	rdx, rax
	call	eb_cdr
	mov	QWORD PTR -48[rbp], rax
	mov	rax, QWORD PTR 32[rbp]
	mov	QWORD PTR -56[rbp], rax
	lea	rcx, eb_cdr[rip]
	mov	rax, QWORD PTR -56[rbp]
	mov	rdx, rax
	call	eb_cdr
	mov	QWORD PTR -64[rbp], rax
	mov	QWORD PTR -72[rbp], 0
	mov	rax, QWORD PTR 32[rbp]
	mov	QWORD PTR -80[rbp], rax
	lea	rcx, eb_cdr[rip]
	mov	rax, QWORD PTR -80[rbp]
	mov	rdx, rax
	call	eb_cdr
	mov	QWORD PTR -88[rbp], rax
	lea	rcx, eb_cons[rip]
	mov	rdx, QWORD PTR -88[rbp]
	mov	rax, QWORD PTR -72[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_cons
	mov	QWORD PTR -96[rbp], rax
	lea	rcx, eb_defs_append[rip]
	mov	r8, QWORD PTR -96[rbp]
	mov	rdx, QWORD PTR -64[rbp]
	mov	rax, QWORD PTR -48[rbp]
	mov	r9, r8
	mov	r8, rdx
	mov	rdx, rax
	call	eb_defs_append
	mov	QWORD PTR -104[rbp], rax
	lea	rcx, eb_cons[rip]
	mov	rdx, QWORD PTR -104[rbp]
	mov	rax, QWORD PTR -32[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_cons
	mov	QWORD PTR -112[rbp], rax
	mov	rax, QWORD PTR -112[rbp]
	add	rsp, 144
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_compile_ir2f2f2f2f2f1f1f1f1f1f1f1111f1f1f
	.def	eb_compile_ir2f2f2f2f2f1f1f1f1f1f1f1111f1f1f;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_compile_ir2f2f2f2f2f1f1f1f1f1f1f1111f1f1f
eb_compile_ir2f2f2f2f2f1f1f1f1f1f1f1111f1f1f:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	add	rsp, -128
	.seh_stackalloc	128
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	lea	rax, eb_ir_form_type_closure_get[rip]
	mov	rcx, rax
	call	eb_ir_form_type_closure_get
	mov	QWORD PTR -8[rbp], rax
	lea	rax, .LC36[rip]
	mov	rdx, rax
	lea	rax, eb_compile_ir2f2f2f2f2f1f1f1f1f1f1f1111f1f1f100.47[rip]
	mov	rcx, rax
	call	ebz_stol
	mov	rax, QWORD PTR eb_compile_ir2f2f2f2f2f1f1f1f1f1f1f1111f1f1f100.47[rip]
	lea	rcx, eb_ir_of_ident[rip]
	mov	rdx, rax
	call	eb_ir_of_ident
	mov	QWORD PTR -16[rbp], rax
	mov	QWORD PTR -24[rbp], 1
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -32[rbp], rax
	lea	rcx, eb_cdr[rip]
	mov	rax, QWORD PTR -32[rbp]
	mov	rdx, rax
	call	eb_cdr
	mov	QWORD PTR -40[rbp], rax
	lea	rcx, eb_add[rip]
	mov	rdx, QWORD PTR -40[rbp]
	mov	rax, QWORD PTR -24[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_add
	mov	QWORD PTR -48[rbp], rax
	lea	rcx, eb_ir_of_number[rip]
	mov	rax, QWORD PTR -48[rbp]
	mov	rdx, rax
	call	eb_ir_of_number
	mov	QWORD PTR -56[rbp], rax
	mov	QWORD PTR -64[rbp], 0
	lea	rcx, eb_cons[rip]
	mov	rdx, QWORD PTR -64[rbp]
	mov	rax, QWORD PTR -56[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_cons
	mov	QWORD PTR -72[rbp], rax
	lea	rcx, eb_cons[rip]
	mov	rdx, QWORD PTR -72[rbp]
	mov	rax, QWORD PTR -16[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_cons
	mov	QWORD PTR -80[rbp], rax
	lea	rcx, eb_ir_of_form[rip]
	mov	rdx, QWORD PTR -80[rbp]
	mov	rax, QWORD PTR -8[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_ir_of_form
	mov	QWORD PTR -88[rbp], rax
	mov	rax, QWORD PTR -88[rbp]
	sub	rsp, -128
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_compile_ir2f2f2f2f2f1f1f1f1f1f1f1111f1f2f
	.def	eb_compile_ir2f2f2f2f2f1f1f1f1f1f1f1111f1f2f;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_compile_ir2f2f2f2f2f1f1f1f1f1f1f1111f1f2f
eb_compile_ir2f2f2f2f2f1f1f1f1f1f1f1111f1f2f:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 64
	.seh_stackalloc	64
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -8[rbp], rax
	lea	rcx, eb_cdr[rip]
	mov	rax, QWORD PTR -8[rbp]
	mov	rdx, rax
	call	eb_cdr
	mov	QWORD PTR -16[rbp], rax
	lea	rcx, eb_ir_of_ident[rip]
	mov	rax, QWORD PTR -16[rbp]
	mov	rdx, rax
	call	eb_ir_of_ident
	mov	QWORD PTR -24[rbp], rax
	mov	rax, QWORD PTR -24[rbp]
	add	rsp, 64
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_compile_ir2f2f2f2f2f1f1f1f1f1f1f1111f1f
	.def	eb_compile_ir2f2f2f2f2f1f1f1f1f1f1f1111f1f;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_compile_ir2f2f2f2f2f1f1f1f1f1f1f1111f1f
eb_compile_ir2f2f2f2f2f1f1f1f1f1f1f1111f1f:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 112
	.seh_stackalloc	112
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	QWORD PTR 24[rbp], rdx
	mov	QWORD PTR -8[rbp], 1
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -16[rbp], rax
	lea	rcx, eb_car[rip]
	mov	rax, QWORD PTR -16[rbp]
	mov	rdx, rax
	call	eb_car
	mov	QWORD PTR -24[rbp], rax
	lea	rcx, eb_equal[rip]
	mov	rdx, QWORD PTR -24[rbp]
	mov	rax, QWORD PTR -8[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_equal
	mov	QWORD PTR -32[rbp], rax
	lea	rax, eb_compile_ir2f2f2f2f2f1f1f1f1f1f1f1111f1f1f[rip]
	mov	QWORD PTR -64[rbp], rax
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -56[rbp], rax
	lea	rax, eb_compile_ir2f2f2f2f2f1f1f1f1f1f1f1111f1f2f[rip]
	mov	QWORD PTR -80[rbp], rax
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -72[rbp], rax
	lea	r8, -80[rbp]
	lea	rdx, -64[rbp]
	lea	rcx, eb_if[rip]
	mov	rax, QWORD PTR -32[rbp]
	mov	r9, r8
	mov	r8, rdx
	mov	rdx, rax
	call	eb_if
	mov	QWORD PTR -40[rbp], rax
	mov	rax, QWORD PTR -40[rbp]
	add	rsp, 112
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_compile_ir2f2f2f2f2f1f1f1f1f1f1f1111f
	.def	eb_compile_ir2f2f2f2f2f1f1f1f1f1f1f1111f;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_compile_ir2f2f2f2f2f1f1f1f1f1f1f1111f
eb_compile_ir2f2f2f2f2f1f1f1f1f1f1f1111f:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 64
	.seh_stackalloc	64
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	QWORD PTR 24[rbp], rdx
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -8[rbp], rax
	lea	rcx, eb_cdr[rip]
	mov	rax, QWORD PTR -8[rbp]
	mov	rdx, rax
	call	eb_cdr
	mov	QWORD PTR -16[rbp], rax
	lea	rax, eb_compile_ir2f2f2f2f2f1f1f1f1f1f1f1111f1f[rip]
	mov	QWORD PTR -32[rbp], rax
	lea	rdx, -32[rbp]
	lea	rcx, eb_let[rip]
	mov	rax, QWORD PTR -16[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_let
	mov	QWORD PTR -24[rbp], rax
	mov	rax, QWORD PTR -24[rbp]
	add	rsp, 64
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_compile_ir2f2f2f2f2f1f1f1f1f1f1f
	.def	eb_compile_ir2f2f2f2f2f1f1f1f1f1f1f;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_compile_ir2f2f2f2f2f1f1f1f1f1f1f
eb_compile_ir2f2f2f2f2f1f1f1f1f1f1f:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 144
	.seh_stackalloc	144
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	QWORD PTR 24[rbp], rdx
	lea	rax, eb_ir_form_type_let_closure[rip]
	mov	rcx, rax
	call	eb_ir_form_type_let_closure
	mov	QWORD PTR -8[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -16[rbp], rax
	mov	rax, QWORD PTR -16[rbp]
	mov	rax, QWORD PTR [rax]
	mov	rdx, rax
	mov	rax, QWORD PTR -16[rbp]
	mov	rcx, rax
	call	rdx
	mov	QWORD PTR -24[rbp], rax
	lea	rcx, eb_path_to_ident[rip]
	mov	rax, QWORD PTR -24[rbp]
	mov	rdx, rax
	call	eb_path_to_ident
	mov	QWORD PTR -32[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 16
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -40[rbp], rax
	lea	rcx, eb_path_to_ident[rip]
	mov	rax, QWORD PTR -40[rbp]
	mov	rdx, rax
	call	eb_path_to_ident
	mov	QWORD PTR -48[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 24
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -56[rbp], rax
	lea	rcx, eb_reverse[rip]
	mov	rax, QWORD PTR -56[rbp]
	mov	rdx, rax
	call	eb_reverse
	mov	QWORD PTR -64[rbp], rax
	lea	rax, eb_compile_ir2f2f2f2f2f1f1f1f1f1f1f1111f[rip]
	mov	QWORD PTR -104[rbp], rax
	lea	rdx, -104[rbp]
	lea	rcx, eb_map[rip]
	mov	rax, QWORD PTR -64[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_map
	mov	QWORD PTR -72[rbp], rax
	lea	rcx, eb_cons[rip]
	mov	rdx, QWORD PTR -72[rbp]
	mov	rax, QWORD PTR -48[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_cons
	mov	QWORD PTR -80[rbp], rax
	lea	rcx, eb_cons[rip]
	mov	rdx, QWORD PTR -80[rbp]
	mov	rax, QWORD PTR -32[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_cons
	mov	QWORD PTR -88[rbp], rax
	lea	rcx, eb_ir_of_form[rip]
	mov	rdx, QWORD PTR -88[rbp]
	mov	rax, QWORD PTR -8[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_ir_of_form
	mov	QWORD PTR -96[rbp], rax
	mov	rax, QWORD PTR -96[rbp]
	add	rsp, 144
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_compile_ir2f2f2f2f2f1f1f1f1f1f
	.def	eb_compile_ir2f2f2f2f2f1f1f1f1f1f;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_compile_ir2f2f2f2f2f1f1f1f1f1f
eb_compile_ir2f2f2f2f2f1f1f1f1f1f:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 144
	.seh_stackalloc	144
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	QWORD PTR 24[rbp], rdx
	mov	QWORD PTR -8[rbp], 0
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -16[rbp], rax
	lea	rcx, eb_cons[rip]
	mov	rdx, QWORD PTR -16[rbp]
	mov	rax, QWORD PTR -8[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_cons
	mov	QWORD PTR -24[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 24
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -32[rbp], rax
	lea	rcx, eb_cdr[rip]
	mov	rax, QWORD PTR -32[rbp]
	mov	rdx, rax
	call	eb_cdr
	mov	QWORD PTR -40[rbp], rax
	lea	rcx, eb_car[rip]
	mov	rax, QWORD PTR -40[rbp]
	mov	rdx, rax
	call	eb_car
	mov	QWORD PTR -48[rbp], rax
	lea	rax, eb_compile_ir2f2f2f2f2f1f1f1f1f1f002f[rip]
	mov	QWORD PTR -80[rbp], rax
	lea	r8, -80[rbp]
	lea	rcx, eb_fold[rip]
	mov	rdx, QWORD PTR -48[rbp]
	mov	rax, QWORD PTR -24[rbp]
	mov	r9, r8
	mov	r8, rdx
	mov	rdx, rax
	call	eb_fold
	mov	QWORD PTR -56[rbp], rax
	lea	rcx, eb_cdr[rip]
	mov	rax, QWORD PTR -56[rbp]
	mov	rdx, rax
	call	eb_cdr
	mov	QWORD PTR -64[rbp], rax
	lea	rax, eb_compile_ir2f2f2f2f2f1f1f1f1f1f1f[rip]
	mov	QWORD PTR -112[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 16
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -104[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 32
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -96[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 48
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -88[rbp], rax
	lea	rdx, -112[rbp]
	lea	rcx, eb_let[rip]
	mov	rax, QWORD PTR -64[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_let
	mov	QWORD PTR -72[rbp], rax
	mov	rax, QWORD PTR -72[rbp]
	add	rsp, 144
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_compile_ir2f2f2f2f2f1f1f1f1f
	.def	eb_compile_ir2f2f2f2f2f1f1f1f1f;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_compile_ir2f2f2f2f2f1f1f1f1f
eb_compile_ir2f2f2f2f2f1f1f1f1f:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 160
	.seh_stackalloc	160
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	QWORD PTR 24[rbp], rdx
	mov	QWORD PTR -8[rbp], 0
	mov	QWORD PTR -16[rbp], 0
	lea	rcx, eb_cons[rip]
	mov	rdx, QWORD PTR -16[rbp]
	mov	rax, QWORD PTR -8[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_cons
	mov	QWORD PTR -24[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 40
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -32[rbp], rax
	lea	rax, eb_compile_ir2f2f2f2f2f1f1f1f1f002f[rip]
	mov	QWORD PTR -64[rbp], rax
	lea	r8, -64[rbp]
	lea	rcx, eb_fold[rip]
	mov	rdx, QWORD PTR -32[rbp]
	mov	rax, QWORD PTR -24[rbp]
	mov	r9, r8
	mov	r8, rdx
	mov	rdx, rax
	call	eb_fold
	mov	QWORD PTR -40[rbp], rax
	lea	rcx, eb_cdr[rip]
	mov	rax, QWORD PTR -40[rbp]
	mov	rdx, rax
	call	eb_cdr
	mov	QWORD PTR -48[rbp], rax
	lea	rax, eb_compile_ir2f2f2f2f2f1f1f1f1f1f[rip]
	mov	QWORD PTR -128[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -120[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 16
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -112[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 24
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -104[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 32
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -96[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 40
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -88[rbp], rax
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -80[rbp], rax
	lea	rdx, -128[rbp]
	lea	rcx, eb_let[rip]
	mov	rax, QWORD PTR -48[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_let
	mov	QWORD PTR -56[rbp], rax
	mov	rax, QWORD PTR -56[rbp]
	add	rsp, 160
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_compile_ir2f2f2f2f2f1f1f1f
	.def	eb_compile_ir2f2f2f2f2f1f1f1f;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_compile_ir2f2f2f2f2f1f1f1f
eb_compile_ir2f2f2f2f2f1f1f1f:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 96
	.seh_stackalloc	96
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	QWORD PTR 24[rbp], rdx
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -8[rbp], rax
	lea	rax, eb_compile_ir2f2f2f2f2f1f1f1f1f[rip]
	mov	QWORD PTR -64[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -56[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 16
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -48[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 24
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -40[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 32
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -32[rbp], rax
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -24[rbp], rax
	lea	rdx, -64[rbp]
	lea	rcx, eb_let[rip]
	mov	rax, QWORD PTR -8[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_let
	mov	QWORD PTR -16[rbp], rax
	mov	rax, QWORD PTR -16[rbp]
	add	rsp, 96
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_compile_ir2f2f2f2f2f1f1f
	.def	eb_compile_ir2f2f2f2f2f1f1f;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_compile_ir2f2f2f2f2f1f1f
eb_compile_ir2f2f2f2f2f1f1f:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	add	rsp, -128
	.seh_stackalloc	128
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	QWORD PTR 24[rbp], rdx
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 24
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -8[rbp], rax
	lea	rcx, eb_cdr[rip]
	mov	rax, QWORD PTR -8[rbp]
	mov	rdx, rax
	call	eb_cdr
	mov	QWORD PTR -16[rbp], rax
	lea	rcx, eb_cdr[rip]
	mov	rax, QWORD PTR -16[rbp]
	mov	rdx, rax
	call	eb_cdr
	mov	QWORD PTR -24[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -32[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -40[rbp], rax
	lea	rcx, eb_defs_filter_keep_used[rip]
	mov	r8, QWORD PTR -40[rbp]
	mov	rdx, QWORD PTR -32[rbp]
	mov	rax, QWORD PTR -24[rbp]
	mov	r9, r8
	mov	r8, rdx
	mov	rdx, rax
	call	eb_defs_filter_keep_used
	mov	QWORD PTR -48[rbp], rax
	lea	rax, eb_compile_ir2f2f2f2f2f1f1f1f[rip]
	mov	QWORD PTR -96[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -88[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 16
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -80[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 24
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -72[rbp], rax
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -64[rbp], rax
	lea	rdx, -96[rbp]
	lea	rcx, eb_let[rip]
	mov	rax, QWORD PTR -48[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_let
	mov	QWORD PTR -56[rbp], rax
	mov	rax, QWORD PTR -56[rbp]
	sub	rsp, -128
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_compile_ir2f2f2f2f2f1f
	.def	eb_compile_ir2f2f2f2f2f1f;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_compile_ir2f2f2f2f2f1f
eb_compile_ir2f2f2f2f2f1f:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 112
	.seh_stackalloc	112
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	QWORD PTR -8[rbp], 102
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 16
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -16[rbp], rax
	mov	rax, QWORD PTR -16[rbp]
	mov	rax, QWORD PTR [rax]
	mov	rdx, rax
	mov	rax, QWORD PTR -16[rbp]
	mov	rcx, rax
	call	rdx
	mov	QWORD PTR -24[rbp], rax
	lea	rcx, eb_cons[rip]
	mov	rdx, QWORD PTR -24[rbp]
	mov	rax, QWORD PTR -8[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_cons
	mov	QWORD PTR -32[rbp], rax
	lea	rax, eb_compile_ir2f2f2f2f2f1f1f[rip]
	mov	QWORD PTR -80[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -72[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 16
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -64[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 24
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -56[rbp], rax
	lea	rdx, -80[rbp]
	lea	rcx, eb_let[rip]
	mov	rax, QWORD PTR -32[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_let
	mov	QWORD PTR -40[rbp], rax
	mov	rax, QWORD PTR -40[rbp]
	add	rsp, 112
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_compile_ir2f2f2f2f2f2f1f
	.def	eb_compile_ir2f2f2f2f2f2f1f;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_compile_ir2f2f2f2f2f2f1f
eb_compile_ir2f2f2f2f2f2f1f:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	add	rsp, -128
	.seh_stackalloc	128
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	lea	rax, eb_ir_form_type_let_string[rip]
	mov	rcx, rax
	call	eb_ir_form_type_let_string
	mov	QWORD PTR -8[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -16[rbp], rax
	mov	rax, QWORD PTR -16[rbp]
	mov	rax, QWORD PTR [rax]
	mov	rdx, rax
	mov	rax, QWORD PTR -16[rbp]
	mov	rcx, rax
	call	rdx
	mov	QWORD PTR -24[rbp], rax
	lea	rcx, eb_path_to_ident[rip]
	mov	rax, QWORD PTR -24[rbp]
	mov	rdx, rax
	call	eb_path_to_ident
	mov	QWORD PTR -32[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 16
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -40[rbp], rax
	lea	rcx, eb_cdr[rip]
	mov	rax, QWORD PTR -40[rbp]
	mov	rdx, rax
	call	eb_cdr
	mov	QWORD PTR -48[rbp], rax
	lea	rcx, eb_ir_of_string[rip]
	mov	rax, QWORD PTR -48[rbp]
	mov	rdx, rax
	call	eb_ir_of_string
	mov	QWORD PTR -56[rbp], rax
	mov	QWORD PTR -64[rbp], 0
	lea	rcx, eb_cons[rip]
	mov	rdx, QWORD PTR -64[rbp]
	mov	rax, QWORD PTR -56[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_cons
	mov	QWORD PTR -72[rbp], rax
	lea	rcx, eb_cons[rip]
	mov	rdx, QWORD PTR -72[rbp]
	mov	rax, QWORD PTR -32[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_cons
	mov	QWORD PTR -80[rbp], rax
	lea	rcx, eb_ir_of_form[rip]
	mov	rdx, QWORD PTR -80[rbp]
	mov	rax, QWORD PTR -8[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_ir_of_form
	mov	QWORD PTR -88[rbp], rax
	mov	rax, QWORD PTR -88[rbp]
	sub	rsp, -128
	pop	rbp
	ret
	.seh_endproc
	.section .rdata,"dr"
.LC37:
	.ascii "<TODO: else>\0"
	.text
	.globl	eb_compile_ir2f2f2f2f2f2f2f
	.def	eb_compile_ir2f2f2f2f2f2f2f;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_compile_ir2f2f2f2f2f2f2f
eb_compile_ir2f2f2f2f2f2f2f:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 48
	.seh_stackalloc	48
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	lea	rax, .LC37[rip]
	mov	rdx, rax
	lea	rax, eb_compile_ir2f2f2f2f2f2f2f0.46[rip]
	mov	rcx, rax
	call	ebz_stol
	mov	rax, QWORD PTR eb_compile_ir2f2f2f2f2f2f2f0.46[rip]
	lea	rcx, eb_ir_of_ident[rip]
	mov	rdx, rax
	call	eb_ir_of_ident
	mov	QWORD PTR -8[rbp], rax
	mov	rax, QWORD PTR -8[rbp]
	add	rsp, 48
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_compile_ir2f2f2f2f2f2f
	.def	eb_compile_ir2f2f2f2f2f2f;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_compile_ir2f2f2f2f2f2f
eb_compile_ir2f2f2f2f2f2f:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 96
	.seh_stackalloc	96
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 16
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -8[rbp], rax
	lea	rcx, eb_ast_is_str[rip]
	mov	rax, QWORD PTR -8[rbp]
	mov	rdx, rax
	call	eb_ast_is_str
	mov	QWORD PTR -16[rbp], rax
	lea	rax, eb_compile_ir2f2f2f2f2f2f1f[rip]
	mov	QWORD PTR -48[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -40[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 16
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -32[rbp], rax
	lea	rax, eb_compile_ir2f2f2f2f2f2f2f[rip]
	mov	QWORD PTR -56[rbp], rax
	lea	r8, -56[rbp]
	lea	rdx, -48[rbp]
	lea	rcx, eb_if[rip]
	mov	rax, QWORD PTR -16[rbp]
	mov	r9, r8
	mov	r8, rdx
	mov	rdx, rax
	call	eb_if
	mov	QWORD PTR -24[rbp], rax
	mov	rax, QWORD PTR -24[rbp]
	add	rsp, 96
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_compile_ir2f2f2f2f2f
	.def	eb_compile_ir2f2f2f2f2f;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_compile_ir2f2f2f2f2f
eb_compile_ir2f2f2f2f2f:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	add	rsp, -128
	.seh_stackalloc	128
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 24
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -8[rbp], rax
	lea	rcx, eb_ast_is_lambda[rip]
	mov	rax, QWORD PTR -8[rbp]
	mov	rdx, rax
	call	eb_ast_is_lambda
	mov	QWORD PTR -16[rbp], rax
	lea	rax, eb_compile_ir2f2f2f2f2f1f[rip]
	mov	QWORD PTR -64[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -56[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 16
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -48[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 24
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -40[rbp], rax
	lea	rax, eb_compile_ir2f2f2f2f2f2f[rip]
	mov	QWORD PTR -96[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 16
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -88[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 24
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -80[rbp], rax
	lea	r8, -96[rbp]
	lea	rdx, -64[rbp]
	lea	rcx, eb_if[rip]
	mov	rax, QWORD PTR -16[rbp]
	mov	r9, r8
	mov	r8, rdx
	mov	rdx, rax
	call	eb_if
	mov	QWORD PTR -24[rbp], rax
	mov	rax, QWORD PTR -24[rbp]
	sub	rsp, -128
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_compile_ir2f2f2f2f
	.def	eb_compile_ir2f2f2f2f;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_compile_ir2f2f2f2f
eb_compile_ir2f2f2f2f:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 112
	.seh_stackalloc	112
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 24
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -8[rbp], rax
	lea	rcx, eb_ast_is_extern[rip]
	mov	rax, QWORD PTR -8[rbp]
	mov	rdx, rax
	call	eb_ast_is_extern
	mov	QWORD PTR -16[rbp], rax
	lea	rax, eb_compile_ir2f2f2f2f1f[rip]
	mov	QWORD PTR -48[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 24
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -40[rbp], rax
	lea	rax, eb_compile_ir2f2f2f2f2f[rip]
	mov	QWORD PTR -80[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -72[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 16
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -64[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 24
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -56[rbp], rax
	lea	r8, -80[rbp]
	lea	rdx, -48[rbp]
	lea	rcx, eb_if[rip]
	mov	rax, QWORD PTR -16[rbp]
	mov	r9, r8
	mov	r8, rdx
	mov	rdx, rax
	call	eb_if
	mov	QWORD PTR -24[rbp], rax
	mov	rax, QWORD PTR -24[rbp]
	add	rsp, 112
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_compile_ir2f2f2f
	.def	eb_compile_ir2f2f2f;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_compile_ir2f2f2f
eb_compile_ir2f2f2f:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 112
	.seh_stackalloc	112
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 24
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -8[rbp], rax
	lea	rcx, eb_ast_is_number[rip]
	mov	rax, QWORD PTR -8[rbp]
	mov	rdx, rax
	call	eb_ast_is_number
	mov	QWORD PTR -16[rbp], rax
	lea	rax, eb_compile_ir2f2f2f1f[rip]
	mov	QWORD PTR -48[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 16
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -40[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 24
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -32[rbp], rax
	lea	rax, eb_compile_ir2f2f2f2f[rip]
	mov	QWORD PTR -80[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -72[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 16
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -64[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 24
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -56[rbp], rax
	lea	r8, -80[rbp]
	lea	rdx, -48[rbp]
	lea	rcx, eb_if[rip]
	mov	rax, QWORD PTR -16[rbp]
	mov	r9, r8
	mov	r8, rdx
	mov	rdx, rax
	call	eb_if
	mov	QWORD PTR -24[rbp], rax
	mov	rax, QWORD PTR -24[rbp]
	add	rsp, 112
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_compile_ir2f2f
	.def	eb_compile_ir2f2f;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_compile_ir2f2f
eb_compile_ir2f2f:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	add	rsp, -128
	.seh_stackalloc	128
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 24
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -8[rbp], rax
	lea	rcx, eb_ast_is_function[rip]
	mov	rax, QWORD PTR -8[rbp]
	mov	rdx, rax
	call	eb_ast_is_function
	mov	QWORD PTR -16[rbp], rax
	lea	rax, eb_compile_ir2f2f1f[rip]
	mov	QWORD PTR -64[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -56[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 16
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -48[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 24
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -40[rbp], rax
	lea	rax, eb_compile_ir2f2f2f[rip]
	mov	QWORD PTR -96[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -88[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 16
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -80[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 24
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -72[rbp], rax
	lea	r8, -96[rbp]
	lea	rdx, -64[rbp]
	lea	rcx, eb_if[rip]
	mov	rax, QWORD PTR -16[rbp]
	mov	r9, r8
	mov	r8, rdx
	mov	rdx, rax
	call	eb_if
	mov	QWORD PTR -24[rbp], rax
	mov	rax, QWORD PTR -24[rbp]
	sub	rsp, -128
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_compile_ir2f
	.def	eb_compile_ir2f;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_compile_ir2f
eb_compile_ir2f:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	add	rsp, -128
	.seh_stackalloc	128
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 24
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -8[rbp], rax
	lea	rcx, eb_ast_is_call[rip]
	mov	rax, QWORD PTR -8[rbp]
	mov	rdx, rax
	call	eb_ast_is_call
	mov	QWORD PTR -16[rbp], rax
	lea	rax, eb_compile_ir2f1f[rip]
	mov	QWORD PTR -64[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -56[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 16
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -48[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 24
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -40[rbp], rax
	lea	rax, eb_compile_ir2f2f[rip]
	mov	QWORD PTR -96[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -88[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 16
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -80[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 24
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -72[rbp], rax
	lea	r8, -96[rbp]
	lea	rdx, -64[rbp]
	lea	rcx, eb_if[rip]
	mov	rax, QWORD PTR -16[rbp]
	mov	r9, r8
	mov	r8, rdx
	mov	rdx, rax
	call	eb_if
	mov	QWORD PTR -24[rbp], rax
	mov	rax, QWORD PTR -24[rbp]
	sub	rsp, -128
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_compile_ir
	.def	eb_compile_ir;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_compile_ir
eb_compile_ir:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	add	rsp, -128
	.seh_stackalloc	128
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	QWORD PTR 24[rbp], rdx
	mov	QWORD PTR 32[rbp], r8
	mov	QWORD PTR 40[rbp], r9
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -8[rbp], rax
	lea	rcx, eb_ast_is_name[rip]
	mov	rax, QWORD PTR -8[rbp]
	mov	rdx, rax
	call	eb_ast_is_name
	mov	QWORD PTR -16[rbp], rax
	lea	rax, eb_compile_ir1f[rip]
	mov	QWORD PTR -64[rbp], rax
	mov	rax, QWORD PTR 40[rbp]
	mov	QWORD PTR -56[rbp], rax
	mov	rax, QWORD PTR 32[rbp]
	mov	QWORD PTR -48[rbp], rax
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -40[rbp], rax
	lea	rax, eb_compile_ir2f[rip]
	mov	QWORD PTR -96[rbp], rax
	mov	rax, QWORD PTR 40[rbp]
	mov	QWORD PTR -88[rbp], rax
	mov	rax, QWORD PTR 32[rbp]
	mov	QWORD PTR -80[rbp], rax
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -72[rbp], rax
	lea	r8, -96[rbp]
	lea	rdx, -64[rbp]
	lea	rcx, eb_if[rip]
	mov	rax, QWORD PTR -16[rbp]
	mov	r9, r8
	mov	r8, rdx
	mov	rdx, rax
	call	eb_if
	mov	QWORD PTR -24[rbp], rax
	mov	rax, QWORD PTR -24[rbp]
	sub	rsp, -128
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_for_ir2f1f01f
	.def	eb_for_ir2f1f01f;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_for_ir2f1f01f
eb_for_ir2f1f01f:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 16
	.seh_stackalloc	16
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	QWORD PTR -8[rbp], 0
	mov	rax, QWORD PTR -8[rbp]
	add	rsp, 16
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_for_ir2f1f1f
	.def	eb_for_ir2f1f1f;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_for_ir2f1f1f
eb_for_ir2f1f1f:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 64
	.seh_stackalloc	64
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	QWORD PTR 24[rbp], rdx
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -8[rbp], rax
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -16[rbp], rax
	mov	rax, QWORD PTR -8[rbp]
	mov	rax, QWORD PTR [rax]
	mov	r8, rax
	mov	rdx, QWORD PTR -16[rbp]
	mov	rax, QWORD PTR -8[rbp]
	mov	rcx, rax
	call	r8
	mov	QWORD PTR -24[rbp], rax
	mov	rax, QWORD PTR -24[rbp]
	add	rsp, 64
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_for_ir2f1f
	.def	eb_for_ir2f1f;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_for_ir2f1f
eb_for_ir2f1f:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 96
	.seh_stackalloc	96
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	QWORD PTR 24[rbp], rdx
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -8[rbp], rax
	lea	rax, eb_for_ir2f1f01f[rip]
	mov	QWORD PTR -40[rbp], rax
	mov	QWORD PTR -16[rbp], 0
	lea	rdx, -40[rbp]
	lea	rcx, eb_compile_ir[rip]
	mov	r8, QWORD PTR -16[rbp]
	mov	rax, QWORD PTR -8[rbp]
	mov	r9, r8
	mov	r8, rdx
	mov	rdx, rax
	call	eb_compile_ir
	mov	QWORD PTR -24[rbp], rax
	lea	rax, eb_for_ir2f1f1f[rip]
	mov	QWORD PTR -64[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -56[rbp], rax
	lea	rdx, -64[rbp]
	lea	rcx, eb_for[rip]
	mov	rax, QWORD PTR -24[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_for
	mov	QWORD PTR -32[rbp], rax
	mov	rax, QWORD PTR -32[rbp]
	add	rsp, 96
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_for_ir2f
	.def	eb_for_ir2f;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_for_ir2f
eb_for_ir2f:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 64
	.seh_stackalloc	64
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	QWORD PTR 24[rbp], rdx
	mov	QWORD PTR 32[rbp], r8
	mov	QWORD PTR 40[rbp], r9
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -8[rbp], rax
	lea	rax, eb_for_ir2f1f[rip]
	mov	QWORD PTR -32[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -24[rbp], rax
	lea	rdx, -32[rbp]
	lea	rcx, eb_for[rip]
	mov	rax, QWORD PTR -8[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_for
	mov	QWORD PTR -16[rbp], rax
	mov	rax, QWORD PTR -16[rbp]
	add	rsp, 64
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_for_ir3f
	.def	eb_for_ir3f;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_for_ir3f
eb_for_ir3f:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 48
	.seh_stackalloc	48
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	QWORD PTR 24[rbp], rdx
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -8[rbp], rax
	lea	rcx, eb_put_error[rip]
	mov	rax, QWORD PTR -8[rbp]
	mov	rdx, rax
	call	eb_put_error
	mov	QWORD PTR -16[rbp], rax
	mov	rax, QWORD PTR -16[rbp]
	add	rsp, 48
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_for_ir
	.def	eb_for_ir;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_for_ir
eb_for_ir:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 112
	.seh_stackalloc	112
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	QWORD PTR 24[rbp], rdx
	mov	QWORD PTR 32[rbp], r8
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -8[rbp], rax
	lea	rcx, eb_str_to_state[rip]
	mov	rax, QWORD PTR -8[rbp]
	mov	rdx, rax
	call	eb_str_to_state
	mov	QWORD PTR -16[rbp], rax
	lea	rax, eb_binding_table[rip]
	mov	rcx, rax
	call	eb_binding_table
	mov	QWORD PTR -24[rbp], rax
	lea	rax, eb_for_ir2f[rip]
	mov	QWORD PTR -48[rbp], rax
	mov	rax, QWORD PTR 32[rbp]
	mov	QWORD PTR -40[rbp], rax
	lea	rax, eb_for_ir3f[rip]
	mov	QWORD PTR -56[rbp], rax
	lea	rdx, -56[rbp]
	lea	r9, -48[rbp]
	lea	rcx, eb_parse_toplevel[rip]
	mov	r8, QWORD PTR -24[rbp]
	mov	rax, QWORD PTR -16[rbp]
	mov	QWORD PTR 32[rsp], rdx
	mov	rdx, rax
	call	eb_parse_toplevel
	mov	QWORD PTR -32[rbp], rax
	mov	rax, QWORD PTR -32[rbp]
	add	rsp, 112
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_endline
	.def	eb_endline;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_endline
eb_endline:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 64
	.seh_stackalloc	64
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	QWORD PTR -8[rbp], 10
	mov	QWORD PTR -16[rbp], 0
	lea	rcx, eb_cons[rip]
	mov	rdx, QWORD PTR -16[rbp]
	mov	rax, QWORD PTR -8[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_cons
	mov	QWORD PTR -24[rbp], rax
	mov	rax, QWORD PTR -24[rbp]
	add	rsp, 64
	pop	rbp
	ret
	.seh_endproc
	.section .rdata,"dr"
.LC38:
	.ascii "  size_t \0"
.LC39:
	.ascii " = (size_t) (\0"
.LC40:
	.ascii ");\0"
	.text
	.globl	eb_put_ir_c1f1f1f1f
	.def	eb_put_ir_c1f1f1f1f;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_put_ir_c1f1f1f1f
eb_put_ir_c1f1f1f1f:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 176
	.seh_stackalloc	176
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	lea	rax, .LC38[rip]
	mov	rdx, rax
	lea	rax, eb_put_ir_c1f1f1f1f00.45[rip]
	mov	rcx, rax
	call	ebz_stol
	mov	rax, QWORD PTR eb_put_ir_c1f1f1f1f00.45[rip]
	lea	rcx, eb_put_str[rip]
	mov	rdx, rax
	call	eb_put_str
	mov	QWORD PTR -8[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -16[rbp], rax
	lea	rcx, eb_car[rip]
	mov	rax, QWORD PTR -16[rbp]
	mov	rdx, rax
	call	eb_car
	mov	QWORD PTR -24[rbp], rax
	lea	rcx, eb_put_ir_c[rip]
	mov	rax, QWORD PTR -24[rbp]
	mov	rdx, rax
	call	eb_put_ir_c
	mov	QWORD PTR -32[rbp], rax
	lea	rax, .LC39[rip]
	mov	rdx, rax
	lea	rax, eb_put_ir_c1f1f1f1f1100.44[rip]
	mov	rcx, rax
	call	ebz_stol
	mov	rax, QWORD PTR eb_put_ir_c1f1f1f1f1100.44[rip]
	lea	rcx, eb_put_str[rip]
	mov	rdx, rax
	call	eb_put_str
	mov	QWORD PTR -40[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -48[rbp], rax
	lea	rcx, eb_cdr[rip]
	mov	rax, QWORD PTR -48[rbp]
	mov	rdx, rax
	call	eb_cdr
	mov	QWORD PTR -56[rbp], rax
	lea	rcx, eb_car[rip]
	mov	rax, QWORD PTR -56[rbp]
	mov	rdx, rax
	call	eb_car
	mov	QWORD PTR -64[rbp], rax
	lea	rcx, eb_put_ir_c[rip]
	mov	rax, QWORD PTR -64[rbp]
	mov	rdx, rax
	call	eb_put_ir_c
	mov	QWORD PTR -72[rbp], rax
	lea	rax, .LC40[rip]
	mov	rdx, rax
	lea	rax, eb_put_ir_c1f1f1f1f111100.43[rip]
	mov	rcx, rax
	call	ebz_stol
	mov	rax, QWORD PTR eb_put_ir_c1f1f1f1f111100.43[rip]
	lea	rcx, eb_put_str[rip]
	mov	rdx, rax
	call	eb_put_str
	mov	QWORD PTR -80[rbp], rax
	lea	rax, eb_put_line[rip]
	mov	rcx, rax
	call	eb_put_line
	mov	QWORD PTR -88[rbp], rax
	mov	QWORD PTR -96[rbp], 0
	lea	rcx, eb_do[rip]
	mov	rdx, QWORD PTR -96[rbp]
	mov	rax, QWORD PTR -88[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_do
	mov	QWORD PTR -104[rbp], rax
	lea	rcx, eb_do[rip]
	mov	rdx, QWORD PTR -104[rbp]
	mov	rax, QWORD PTR -80[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_do
	mov	QWORD PTR -112[rbp], rax
	lea	rcx, eb_do[rip]
	mov	rdx, QWORD PTR -112[rbp]
	mov	rax, QWORD PTR -72[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_do
	mov	QWORD PTR -120[rbp], rax
	lea	rcx, eb_do[rip]
	mov	rdx, QWORD PTR -120[rbp]
	mov	rax, QWORD PTR -40[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_do
	mov	QWORD PTR -128[rbp], rax
	lea	rcx, eb_do[rip]
	mov	rdx, QWORD PTR -128[rbp]
	mov	rax, QWORD PTR -32[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_do
	mov	QWORD PTR -136[rbp], rax
	lea	rcx, eb_do[rip]
	mov	rdx, QWORD PTR -136[rbp]
	mov	rax, QWORD PTR -8[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_do
	mov	QWORD PTR -144[rbp], rax
	mov	rax, QWORD PTR -144[rbp]
	add	rsp, 176
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_put_ir_c1f1f1f2f1f1101f
	.def	eb_put_ir_c1f1f1f2f1f1101f;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_put_ir_c1f1f1f2f1f1101f
eb_put_ir_c1f1f1f2f1f1101f:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 48
	.seh_stackalloc	48
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	QWORD PTR 24[rbp], rdx
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -8[rbp], rax
	lea	rcx, eb_put_ir_c[rip]
	mov	rax, QWORD PTR -8[rbp]
	mov	rdx, rax
	call	eb_put_ir_c
	mov	QWORD PTR -16[rbp], rax
	mov	rax, QWORD PTR -16[rbp]
	add	rsp, 48
	pop	rbp
	ret
	.seh_endproc
	.section .rdata,"dr"
.LC41:
	.ascii "{\0"
.LC42:
	.ascii "}\0"
	.text
	.globl	eb_put_ir_c1f1f1f2f1f
	.def	eb_put_ir_c1f1f1f2f1f;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_put_ir_c1f1f1f2f1f
eb_put_ir_c1f1f1f2f1f:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 144
	.seh_stackalloc	144
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	lea	rax, .LC41[rip]
	mov	rdx, rax
	lea	rax, eb_put_ir_c1f1f1f2f1f00.42[rip]
	mov	rcx, rax
	call	ebz_stol
	mov	rax, QWORD PTR eb_put_ir_c1f1f1f2f1f00.42[rip]
	lea	rcx, eb_put_str[rip]
	mov	rdx, rax
	call	eb_put_str
	mov	QWORD PTR -8[rbp], rax
	lea	rax, eb_put_line[rip]
	mov	rcx, rax
	call	eb_put_line
	mov	QWORD PTR -16[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -24[rbp], rax
	lea	rax, eb_put_ir_c1f1f1f2f1f1101f[rip]
	mov	QWORD PTR -104[rbp], rax
	lea	rdx, -104[rbp]
	lea	rcx, eb_for[rip]
	mov	rax, QWORD PTR -24[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_for
	mov	QWORD PTR -32[rbp], rax
	lea	rax, .LC42[rip]
	mov	rdx, rax
	lea	rax, eb_put_ir_c1f1f1f2f1f11100.41[rip]
	mov	rcx, rax
	call	ebz_stol
	mov	rax, QWORD PTR eb_put_ir_c1f1f1f2f1f11100.41[rip]
	lea	rcx, eb_put_str[rip]
	mov	rdx, rax
	call	eb_put_str
	mov	QWORD PTR -40[rbp], rax
	lea	rax, eb_put_line[rip]
	mov	rcx, rax
	call	eb_put_line
	mov	QWORD PTR -48[rbp], rax
	mov	QWORD PTR -56[rbp], 0
	lea	rcx, eb_do[rip]
	mov	rdx, QWORD PTR -56[rbp]
	mov	rax, QWORD PTR -48[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_do
	mov	QWORD PTR -64[rbp], rax
	lea	rcx, eb_do[rip]
	mov	rdx, QWORD PTR -64[rbp]
	mov	rax, QWORD PTR -40[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_do
	mov	QWORD PTR -72[rbp], rax
	lea	rcx, eb_do[rip]
	mov	rdx, QWORD PTR -72[rbp]
	mov	rax, QWORD PTR -32[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_do
	mov	QWORD PTR -80[rbp], rax
	lea	rcx, eb_do[rip]
	mov	rdx, QWORD PTR -80[rbp]
	mov	rax, QWORD PTR -16[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_do
	mov	QWORD PTR -88[rbp], rax
	lea	rcx, eb_do[rip]
	mov	rdx, QWORD PTR -88[rbp]
	mov	rax, QWORD PTR -8[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_do
	mov	QWORD PTR -96[rbp], rax
	mov	rax, QWORD PTR -96[rbp]
	add	rsp, 144
	pop	rbp
	ret
	.seh_endproc
	.section .rdata,"dr"
.LC43:
	.ascii ", \0"
	.text
	.globl	eb_put_ir_c1f1f1f2f2f1f102f01f
	.def	eb_put_ir_c1f1f1f2f2f1f102f01f;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_put_ir_c1f1f1f2f2f1f102f01f
eb_put_ir_c1f1f1f2f2f1f102f01f:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 48
	.seh_stackalloc	48
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	lea	rax, .LC43[rip]
	mov	rdx, rax
	lea	rax, eb_put_ir_c1f1f1f2f2f1f102f01f0.40[rip]
	mov	rcx, rax
	call	ebz_stol
	mov	rax, QWORD PTR eb_put_ir_c1f1f1f2f2f1f102f01f0.40[rip]
	lea	rcx, eb_put_str[rip]
	mov	rdx, rax
	call	eb_put_str
	mov	QWORD PTR -8[rbp], rax
	mov	rax, QWORD PTR -8[rbp]
	add	rsp, 48
	pop	rbp
	ret
	.seh_endproc
	.section .rdata,"dr"
.LC44:
	.ascii "size_t\0"
	.text
	.globl	eb_put_ir_c1f1f1f2f2f1f102f
	.def	eb_put_ir_c1f1f1f2f2f1f102f;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_put_ir_c1f1f1f2f2f1f102f
eb_put_ir_c1f1f1f2f2f1f102f:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 112
	.seh_stackalloc	112
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	QWORD PTR 24[rbp], rdx
	mov	QWORD PTR 32[rbp], r8
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -8[rbp], rax
	lea	rax, eb_put_ir_c1f1f1f2f2f1f102f01f[rip]
	mov	QWORD PTR -72[rbp], rax
	lea	rdx, -72[rbp]
	lea	rcx, eb_and[rip]
	mov	rax, QWORD PTR -8[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_and
	mov	QWORD PTR -16[rbp], rax
	lea	rax, .LC44[rip]
	mov	rdx, rax
	lea	rax, eb_put_ir_c1f1f1f2f2f1f102f100.39[rip]
	mov	rcx, rax
	call	ebz_stol
	mov	rax, QWORD PTR eb_put_ir_c1f1f1f2f2f1f102f100.39[rip]
	lea	rcx, eb_put_str[rip]
	mov	rdx, rax
	call	eb_put_str
	mov	QWORD PTR -24[rbp], rax
	mov	QWORD PTR -32[rbp], 1
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -40[rbp], rax
	lea	rcx, eb_add[rip]
	mov	rdx, QWORD PTR -40[rbp]
	mov	rax, QWORD PTR -32[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_add
	mov	QWORD PTR -48[rbp], rax
	lea	rcx, eb_do[rip]
	mov	rdx, QWORD PTR -48[rbp]
	mov	rax, QWORD PTR -24[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_do
	mov	QWORD PTR -56[rbp], rax
	lea	rcx, eb_do[rip]
	mov	rdx, QWORD PTR -56[rbp]
	mov	rax, QWORD PTR -16[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_do
	mov	QWORD PTR -64[rbp], rax
	mov	rax, QWORD PTR -64[rbp]
	add	rsp, 112
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_put_ir_c1f1f1f2f2f1f1111102f01f
	.def	eb_put_ir_c1f1f1f2f2f1f1111102f01f;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_put_ir_c1f1f1f2f2f1f1111102f01f
eb_put_ir_c1f1f1f2f2f1f1111102f01f:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 48
	.seh_stackalloc	48
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	lea	rax, .LC43[rip]
	mov	rdx, rax
	lea	rax, eb_put_ir_c1f1f1f2f2f1f1111102f01f0.38[rip]
	mov	rcx, rax
	call	ebz_stol
	mov	rax, QWORD PTR eb_put_ir_c1f1f1f2f2f1f1111102f01f0.38[rip]
	lea	rcx, eb_put_str[rip]
	mov	rdx, rax
	call	eb_put_str
	mov	QWORD PTR -8[rbp], rax
	mov	rax, QWORD PTR -8[rbp]
	add	rsp, 48
	pop	rbp
	ret
	.seh_endproc
	.section .rdata,"dr"
.LC45:
	.ascii "(size_t) (\0"
	.text
	.globl	eb_put_ir_c1f1f1f2f2f1f1111102f
	.def	eb_put_ir_c1f1f1f2f2f1f1111102f;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_put_ir_c1f1f1f2f2f1f1111102f
eb_put_ir_c1f1f1f2f2f1f1111102f:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 144
	.seh_stackalloc	144
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	QWORD PTR 24[rbp], rdx
	mov	QWORD PTR 32[rbp], r8
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -8[rbp], rax
	lea	rax, eb_put_ir_c1f1f1f2f2f1f1111102f01f[rip]
	mov	QWORD PTR -112[rbp], rax
	lea	rdx, -112[rbp]
	lea	rcx, eb_and[rip]
	mov	rax, QWORD PTR -8[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_and
	mov	QWORD PTR -16[rbp], rax
	lea	rax, .LC45[rip]
	mov	rdx, rax
	lea	rax, eb_put_ir_c1f1f1f2f2f1f1111102f100.37[rip]
	mov	rcx, rax
	call	ebz_stol
	mov	rax, QWORD PTR eb_put_ir_c1f1f1f2f2f1f1111102f100.37[rip]
	lea	rcx, eb_put_str[rip]
	mov	rdx, rax
	call	eb_put_str
	mov	QWORD PTR -24[rbp], rax
	mov	rax, QWORD PTR 32[rbp]
	mov	QWORD PTR -32[rbp], rax
	lea	rcx, eb_put_ir_c[rip]
	mov	rax, QWORD PTR -32[rbp]
	mov	rdx, rax
	call	eb_put_ir_c
	mov	QWORD PTR -40[rbp], rax
	lea	rax, .LC8[rip]
	mov	rdx, rax
	lea	rax, eb_put_ir_c1f1f1f2f2f1f1111102f11100.36[rip]
	mov	rcx, rax
	call	ebz_stol
	mov	rax, QWORD PTR eb_put_ir_c1f1f1f2f2f1f1111102f11100.36[rip]
	lea	rcx, eb_put_str[rip]
	mov	rdx, rax
	call	eb_put_str
	mov	QWORD PTR -48[rbp], rax
	mov	QWORD PTR -56[rbp], 1
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -64[rbp], rax
	lea	rcx, eb_add[rip]
	mov	rdx, QWORD PTR -64[rbp]
	mov	rax, QWORD PTR -56[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_add
	mov	QWORD PTR -72[rbp], rax
	lea	rcx, eb_do[rip]
	mov	rdx, QWORD PTR -72[rbp]
	mov	rax, QWORD PTR -48[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_do
	mov	QWORD PTR -80[rbp], rax
	lea	rcx, eb_do[rip]
	mov	rdx, QWORD PTR -80[rbp]
	mov	rax, QWORD PTR -40[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_do
	mov	QWORD PTR -88[rbp], rax
	lea	rcx, eb_do[rip]
	mov	rdx, QWORD PTR -88[rbp]
	mov	rax, QWORD PTR -24[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_do
	mov	QWORD PTR -96[rbp], rax
	lea	rcx, eb_do[rip]
	mov	rdx, QWORD PTR -96[rbp]
	mov	rax, QWORD PTR -16[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_do
	mov	QWORD PTR -104[rbp], rax
	mov	rax, QWORD PTR -104[rbp]
	add	rsp, 144
	pop	rbp
	ret
	.seh_endproc
	.section .rdata,"dr"
.LC46:
	.ascii "((size_t (*)(\0"
.LC47:
	.ascii "))\0"
.LC48:
	.ascii ")(\0"
	.text
	.globl	eb_put_ir_c1f1f1f2f2f1f
	.def	eb_put_ir_c1f1f1f2f2f1f;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_put_ir_c1f1f1f2f2f1f
eb_put_ir_c1f1f1f2f2f1f:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 240
	.seh_stackalloc	240
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	lea	rax, .LC46[rip]
	mov	rdx, rax
	lea	rax, eb_put_ir_c1f1f1f2f2f1f00.35[rip]
	mov	rcx, rax
	call	ebz_stol
	mov	rax, QWORD PTR eb_put_ir_c1f1f1f2f2f1f00.35[rip]
	lea	rcx, eb_put_str[rip]
	mov	rdx, rax
	call	eb_put_str
	mov	QWORD PTR -8[rbp], rax
	mov	QWORD PTR -16[rbp], 0
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -24[rbp], rax
	lea	rcx, eb_cdr[rip]
	mov	rax, QWORD PTR -24[rbp]
	mov	rdx, rax
	call	eb_cdr
	mov	QWORD PTR -32[rbp], rax
	lea	rax, eb_put_ir_c1f1f1f2f2f1f102f[rip]
	mov	QWORD PTR -192[rbp], rax
	lea	r8, -192[rbp]
	lea	rcx, eb_fold[rip]
	mov	rdx, QWORD PTR -32[rbp]
	mov	rax, QWORD PTR -16[rbp]
	mov	r9, r8
	mov	r8, rdx
	mov	rdx, rax
	call	eb_fold
	mov	QWORD PTR -40[rbp], rax
	lea	rax, .LC47[rip]
	mov	rdx, rax
	lea	rax, eb_put_ir_c1f1f1f2f2f1f1100.34[rip]
	mov	rcx, rax
	call	ebz_stol
	mov	rax, QWORD PTR eb_put_ir_c1f1f1f2f2f1f1100.34[rip]
	lea	rcx, eb_put_str[rip]
	mov	rdx, rax
	call	eb_put_str
	mov	QWORD PTR -48[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -56[rbp], rax
	lea	rcx, eb_car[rip]
	mov	rax, QWORD PTR -56[rbp]
	mov	rdx, rax
	call	eb_car
	mov	QWORD PTR -64[rbp], rax
	lea	rcx, eb_put_ir_c[rip]
	mov	rax, QWORD PTR -64[rbp]
	mov	rdx, rax
	call	eb_put_ir_c
	mov	QWORD PTR -72[rbp], rax
	lea	rax, .LC48[rip]
	mov	rdx, rax
	lea	rax, eb_put_ir_c1f1f1f2f2f1f111100.33[rip]
	mov	rcx, rax
	call	ebz_stol
	mov	rax, QWORD PTR eb_put_ir_c1f1f1f2f2f1f111100.33[rip]
	lea	rcx, eb_put_str[rip]
	mov	rdx, rax
	call	eb_put_str
	mov	QWORD PTR -80[rbp], rax
	mov	QWORD PTR -88[rbp], 0
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -96[rbp], rax
	lea	rcx, eb_cdr[rip]
	mov	rax, QWORD PTR -96[rbp]
	mov	rdx, rax
	call	eb_cdr
	mov	QWORD PTR -104[rbp], rax
	lea	rax, eb_put_ir_c1f1f1f2f2f1f1111102f[rip]
	mov	QWORD PTR -200[rbp], rax
	lea	r8, -200[rbp]
	lea	rcx, eb_fold[rip]
	mov	rdx, QWORD PTR -104[rbp]
	mov	rax, QWORD PTR -88[rbp]
	mov	r9, r8
	mov	r8, rdx
	mov	rdx, rax
	call	eb_fold
	mov	QWORD PTR -112[rbp], rax
	lea	rax, .LC8[rip]
	mov	rdx, rax
	lea	rax, eb_put_ir_c1f1f1f2f2f1f11111100.32[rip]
	mov	rcx, rax
	call	ebz_stol
	mov	rax, QWORD PTR eb_put_ir_c1f1f1f2f2f1f11111100.32[rip]
	lea	rcx, eb_put_str[rip]
	mov	rdx, rax
	call	eb_put_str
	mov	QWORD PTR -120[rbp], rax
	mov	QWORD PTR -128[rbp], 0
	lea	rcx, eb_do[rip]
	mov	rdx, QWORD PTR -128[rbp]
	mov	rax, QWORD PTR -120[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_do
	mov	QWORD PTR -136[rbp], rax
	lea	rcx, eb_do[rip]
	mov	rdx, QWORD PTR -136[rbp]
	mov	rax, QWORD PTR -112[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_do
	mov	QWORD PTR -144[rbp], rax
	lea	rcx, eb_do[rip]
	mov	rdx, QWORD PTR -144[rbp]
	mov	rax, QWORD PTR -80[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_do
	mov	QWORD PTR -152[rbp], rax
	lea	rcx, eb_do[rip]
	mov	rdx, QWORD PTR -152[rbp]
	mov	rax, QWORD PTR -72[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_do
	mov	QWORD PTR -160[rbp], rax
	lea	rcx, eb_do[rip]
	mov	rdx, QWORD PTR -160[rbp]
	mov	rax, QWORD PTR -48[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_do
	mov	QWORD PTR -168[rbp], rax
	lea	rcx, eb_do[rip]
	mov	rdx, QWORD PTR -168[rbp]
	mov	rax, QWORD PTR -40[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_do
	mov	QWORD PTR -176[rbp], rax
	lea	rcx, eb_do[rip]
	mov	rdx, QWORD PTR -176[rbp]
	mov	rax, QWORD PTR -8[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_do
	mov	QWORD PTR -184[rbp], rax
	mov	rax, QWORD PTR -184[rbp]
	add	rsp, 240
	pop	rbp
	ret
	.seh_endproc
	.section .rdata,"dr"
.LC49:
	.ascii "size_t \0"
	.text
	.globl	eb_put_ir_c1f1f1f2f2f2f1f
	.def	eb_put_ir_c1f1f1f2f2f2f1f;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_put_ir_c1f1f1f2f2f2f1f
eb_put_ir_c1f1f1f2f2f2f1f:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 176
	.seh_stackalloc	176
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	lea	rax, .LC49[rip]
	mov	rdx, rax
	lea	rax, eb_put_ir_c1f1f1f2f2f2f1f00.31[rip]
	mov	rcx, rax
	call	ebz_stol
	mov	rax, QWORD PTR eb_put_ir_c1f1f1f2f2f2f1f00.31[rip]
	lea	rcx, eb_put_str[rip]
	mov	rdx, rax
	call	eb_put_str
	mov	QWORD PTR -8[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -16[rbp], rax
	lea	rcx, eb_car[rip]
	mov	rax, QWORD PTR -16[rbp]
	mov	rdx, rax
	call	eb_car
	mov	QWORD PTR -24[rbp], rax
	lea	rcx, eb_put_ir_c[rip]
	mov	rax, QWORD PTR -24[rbp]
	mov	rdx, rax
	call	eb_put_ir_c
	mov	QWORD PTR -32[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -40[rbp], rax
	lea	rcx, eb_cdr[rip]
	mov	rax, QWORD PTR -40[rbp]
	mov	rdx, rax
	call	eb_cdr
	mov	QWORD PTR -48[rbp], rax
	lea	rcx, eb_car[rip]
	mov	rax, QWORD PTR -48[rbp]
	mov	rdx, rax
	call	eb_car
	mov	QWORD PTR -56[rbp], rax
	lea	rcx, eb_put_ir_c[rip]
	mov	rax, QWORD PTR -56[rbp]
	mov	rdx, rax
	call	eb_put_ir_c
	mov	QWORD PTR -64[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -72[rbp], rax
	lea	rcx, eb_cdr[rip]
	mov	rax, QWORD PTR -72[rbp]
	mov	rdx, rax
	call	eb_cdr
	mov	QWORD PTR -80[rbp], rax
	lea	rcx, eb_cdr[rip]
	mov	rax, QWORD PTR -80[rbp]
	mov	rdx, rax
	call	eb_cdr
	mov	QWORD PTR -88[rbp], rax
	lea	rcx, eb_car[rip]
	mov	rax, QWORD PTR -88[rbp]
	mov	rdx, rax
	call	eb_car
	mov	QWORD PTR -96[rbp], rax
	lea	rcx, eb_put_ir_c[rip]
	mov	rax, QWORD PTR -96[rbp]
	mov	rdx, rax
	call	eb_put_ir_c
	mov	QWORD PTR -104[rbp], rax
	lea	rax, eb_endline[rip]
	mov	rcx, rax
	call	eb_endline
	mov	QWORD PTR -112[rbp], rax
	lea	rcx, eb_do[rip]
	mov	rdx, QWORD PTR -112[rbp]
	mov	rax, QWORD PTR -104[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_do
	mov	QWORD PTR -120[rbp], rax
	lea	rcx, eb_do[rip]
	mov	rdx, QWORD PTR -120[rbp]
	mov	rax, QWORD PTR -64[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_do
	mov	QWORD PTR -128[rbp], rax
	lea	rcx, eb_do[rip]
	mov	rdx, QWORD PTR -128[rbp]
	mov	rax, QWORD PTR -32[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_do
	mov	QWORD PTR -136[rbp], rax
	lea	rcx, eb_do[rip]
	mov	rdx, QWORD PTR -136[rbp]
	mov	rax, QWORD PTR -8[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_do
	mov	QWORD PTR -144[rbp], rax
	mov	rax, QWORD PTR -144[rbp]
	add	rsp, 176
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_put_ir_c1f1f1f2f2f2f2f1f102f01f
	.def	eb_put_ir_c1f1f1f2f2f2f2f1f102f01f;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_put_ir_c1f1f1f2f2f2f2f1f102f01f
eb_put_ir_c1f1f1f2f2f2f2f1f102f01f:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 48
	.seh_stackalloc	48
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	lea	rax, .LC43[rip]
	mov	rdx, rax
	lea	rax, eb_put_ir_c1f1f1f2f2f2f2f1f102f01f0.30[rip]
	mov	rcx, rax
	call	ebz_stol
	mov	rax, QWORD PTR eb_put_ir_c1f1f1f2f2f2f2f1f102f01f0.30[rip]
	lea	rcx, eb_put_str[rip]
	mov	rdx, rax
	call	eb_put_str
	mov	QWORD PTR -8[rbp], rax
	mov	rax, QWORD PTR -8[rbp]
	add	rsp, 48
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_put_ir_c1f1f1f2f2f2f2f1f102f
	.def	eb_put_ir_c1f1f1f2f2f2f2f1f102f;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_put_ir_c1f1f1f2f2f2f2f1f102f
eb_put_ir_c1f1f1f2f2f2f2f1f102f:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	add	rsp, -128
	.seh_stackalloc	128
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	QWORD PTR 24[rbp], rdx
	mov	QWORD PTR 32[rbp], r8
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -8[rbp], rax
	lea	rax, eb_put_ir_c1f1f1f2f2f2f2f1f102f01f[rip]
	mov	QWORD PTR -96[rbp], rax
	lea	rdx, -96[rbp]
	lea	rcx, eb_and[rip]
	mov	rax, QWORD PTR -8[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_and
	mov	QWORD PTR -16[rbp], rax
	lea	rax, .LC49[rip]
	mov	rdx, rax
	lea	rax, eb_put_ir_c1f1f1f2f2f2f2f1f102f100.29[rip]
	mov	rcx, rax
	call	ebz_stol
	mov	rax, QWORD PTR eb_put_ir_c1f1f1f2f2f2f2f1f102f100.29[rip]
	lea	rcx, eb_put_str[rip]
	mov	rdx, rax
	call	eb_put_str
	mov	QWORD PTR -24[rbp], rax
	mov	rax, QWORD PTR 32[rbp]
	mov	QWORD PTR -32[rbp], rax
	lea	rcx, eb_put_ir_c[rip]
	mov	rax, QWORD PTR -32[rbp]
	mov	rdx, rax
	call	eb_put_ir_c
	mov	QWORD PTR -40[rbp], rax
	mov	QWORD PTR -48[rbp], 1
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -56[rbp], rax
	lea	rcx, eb_add[rip]
	mov	rdx, QWORD PTR -56[rbp]
	mov	rax, QWORD PTR -48[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_add
	mov	QWORD PTR -64[rbp], rax
	lea	rcx, eb_do[rip]
	mov	rdx, QWORD PTR -64[rbp]
	mov	rax, QWORD PTR -40[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_do
	mov	QWORD PTR -72[rbp], rax
	lea	rcx, eb_do[rip]
	mov	rdx, QWORD PTR -72[rbp]
	mov	rax, QWORD PTR -24[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_do
	mov	QWORD PTR -80[rbp], rax
	lea	rcx, eb_do[rip]
	mov	rdx, QWORD PTR -80[rbp]
	mov	rax, QWORD PTR -16[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_do
	mov	QWORD PTR -88[rbp], rax
	mov	rax, QWORD PTR -88[rbp]
	sub	rsp, -128
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_put_ir_c1f1f1f2f2f2f2f1f
	.def	eb_put_ir_c1f1f1f2f2f2f2f1f;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_put_ir_c1f1f1f2f2f2f2f1f
eb_put_ir_c1f1f1f2f2f2f2f1f:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	add	rsp, -128
	.seh_stackalloc	128
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	lea	rax, .LC34[rip]
	mov	rdx, rax
	lea	rax, eb_put_ir_c1f1f1f2f2f2f2f1f00.28[rip]
	mov	rcx, rax
	call	ebz_stol
	mov	rax, QWORD PTR eb_put_ir_c1f1f1f2f2f2f2f1f00.28[rip]
	lea	rcx, eb_put_str[rip]
	mov	rdx, rax
	call	eb_put_str
	mov	QWORD PTR -8[rbp], rax
	mov	QWORD PTR -16[rbp], 0
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -24[rbp], rax
	lea	rcx, eb_reverse[rip]
	mov	rax, QWORD PTR -24[rbp]
	mov	rdx, rax
	call	eb_reverse
	mov	QWORD PTR -32[rbp], rax
	lea	rax, eb_put_ir_c1f1f1f2f2f2f2f1f102f[rip]
	mov	QWORD PTR -88[rbp], rax
	lea	r8, -88[rbp]
	lea	rcx, eb_fold[rip]
	mov	rdx, QWORD PTR -32[rbp]
	mov	rax, QWORD PTR -16[rbp]
	mov	r9, r8
	mov	r8, rdx
	mov	rdx, rax
	call	eb_fold
	mov	QWORD PTR -40[rbp], rax
	lea	rax, .LC8[rip]
	mov	rdx, rax
	lea	rax, eb_put_ir_c1f1f1f2f2f2f2f1f1100.27[rip]
	mov	rcx, rax
	call	ebz_stol
	mov	rax, QWORD PTR eb_put_ir_c1f1f1f2f2f2f2f1f1100.27[rip]
	lea	rcx, eb_put_str[rip]
	mov	rdx, rax
	call	eb_put_str
	mov	QWORD PTR -48[rbp], rax
	mov	QWORD PTR -56[rbp], 0
	lea	rcx, eb_do[rip]
	mov	rdx, QWORD PTR -56[rbp]
	mov	rax, QWORD PTR -48[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_do
	mov	QWORD PTR -64[rbp], rax
	lea	rcx, eb_do[rip]
	mov	rdx, QWORD PTR -64[rbp]
	mov	rax, QWORD PTR -40[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_do
	mov	QWORD PTR -72[rbp], rax
	lea	rcx, eb_do[rip]
	mov	rdx, QWORD PTR -72[rbp]
	mov	rax, QWORD PTR -8[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_do
	mov	QWORD PTR -80[rbp], rax
	mov	rax, QWORD PTR -80[rbp]
	sub	rsp, -128
	pop	rbp
	ret
	.seh_endproc
	.section .rdata,"dr"
.LC50:
	.ascii "    (size_t) (\0"
.LC51:
	.ascii "),\0"
	.text
	.globl	eb_put_ir_c1f1f1f2f2f2f2f2f1f11111101f
	.def	eb_put_ir_c1f1f1f2f2f2f2f2f1f11111101f;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_put_ir_c1f1f1f2f2f2f2f2f1f11111101f
eb_put_ir_c1f1f1f2f2f2f2f2f1f11111101f:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 112
	.seh_stackalloc	112
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	QWORD PTR 24[rbp], rdx
	lea	rax, .LC50[rip]
	mov	rdx, rax
	lea	rax, eb_put_ir_c1f1f1f2f2f2f2f2f1f11111101f00.26[rip]
	mov	rcx, rax
	call	ebz_stol
	mov	rax, QWORD PTR eb_put_ir_c1f1f1f2f2f2f2f2f1f11111101f00.26[rip]
	lea	rcx, eb_put_str[rip]
	mov	rdx, rax
	call	eb_put_str
	mov	QWORD PTR -8[rbp], rax
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -16[rbp], rax
	lea	rcx, eb_put_ir_c[rip]
	mov	rax, QWORD PTR -16[rbp]
	mov	rdx, rax
	call	eb_put_ir_c
	mov	QWORD PTR -24[rbp], rax
	lea	rax, .LC51[rip]
	mov	rdx, rax
	lea	rax, eb_put_ir_c1f1f1f2f2f2f2f2f1f11111101f1100.25[rip]
	mov	rcx, rax
	call	ebz_stol
	mov	rax, QWORD PTR eb_put_ir_c1f1f1f2f2f2f2f2f1f11111101f1100.25[rip]
	lea	rcx, eb_put_str[rip]
	mov	rdx, rax
	call	eb_put_str
	mov	QWORD PTR -32[rbp], rax
	lea	rax, eb_put_line[rip]
	mov	rcx, rax
	call	eb_put_line
	mov	QWORD PTR -40[rbp], rax
	mov	QWORD PTR -48[rbp], 0
	lea	rcx, eb_do[rip]
	mov	rdx, QWORD PTR -48[rbp]
	mov	rax, QWORD PTR -40[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_do
	mov	QWORD PTR -56[rbp], rax
	lea	rcx, eb_do[rip]
	mov	rdx, QWORD PTR -56[rbp]
	mov	rax, QWORD PTR -32[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_do
	mov	QWORD PTR -64[rbp], rax
	lea	rcx, eb_do[rip]
	mov	rdx, QWORD PTR -64[rbp]
	mov	rax, QWORD PTR -24[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_do
	mov	QWORD PTR -72[rbp], rax
	lea	rcx, eb_do[rip]
	mov	rdx, QWORD PTR -72[rbp]
	mov	rax, QWORD PTR -8[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_do
	mov	QWORD PTR -80[rbp], rax
	mov	rax, QWORD PTR -80[rbp]
	add	rsp, 112
	pop	rbp
	ret
	.seh_endproc
	.section .rdata,"dr"
.LC52:
	.ascii "[\0"
.LC53:
	.ascii "] = {\0"
.LC54:
	.ascii "  };\0"
	.text
	.globl	eb_put_ir_c1f1f1f2f2f2f2f2f1f
	.def	eb_put_ir_c1f1f1f2f2f2f2f2f1f;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_put_ir_c1f1f1f2f2f2f2f2f1f
eb_put_ir_c1f1f1f2f2f2f2f2f1f:
	push	rbp
	.seh_pushreg	rbp
	sub	rsp, 256
	.seh_stackalloc	256
	lea	rbp, 128[rsp]
	.seh_setframe	rbp, 128
	.seh_endprologue
	mov	QWORD PTR 144[rbp], rcx
	lea	rax, .LC38[rip]
	mov	rdx, rax
	lea	rax, eb_put_ir_c1f1f1f2f2f2f2f2f1f00.24[rip]
	mov	rcx, rax
	call	ebz_stol
	mov	rax, QWORD PTR eb_put_ir_c1f1f1f2f2f2f2f2f1f00.24[rip]
	lea	rcx, eb_put_str[rip]
	mov	rdx, rax
	call	eb_put_str
	mov	QWORD PTR 120[rbp], rax
	mov	rax, QWORD PTR 144[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR 112[rbp], rax
	lea	rcx, eb_car[rip]
	mov	rax, QWORD PTR 112[rbp]
	mov	rdx, rax
	call	eb_car
	mov	QWORD PTR 104[rbp], rax
	lea	rcx, eb_put_ir_c[rip]
	mov	rax, QWORD PTR 104[rbp]
	mov	rdx, rax
	call	eb_put_ir_c
	mov	QWORD PTR 96[rbp], rax
	lea	rax, .LC52[rip]
	mov	rdx, rax
	lea	rax, eb_put_ir_c1f1f1f2f2f2f2f2f1f1100.23[rip]
	mov	rcx, rax
	call	ebz_stol
	mov	rax, QWORD PTR eb_put_ir_c1f1f1f2f2f2f2f2f1f1100.23[rip]
	lea	rcx, eb_put_str[rip]
	mov	rdx, rax
	call	eb_put_str
	mov	QWORD PTR 88[rbp], rax
	mov	rax, QWORD PTR 144[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR 80[rbp], rax
	lea	rcx, eb_cdr[rip]
	mov	rax, QWORD PTR 80[rbp]
	mov	rdx, rax
	call	eb_cdr
	mov	QWORD PTR 72[rbp], rax
	lea	rcx, eb_length[rip]
	mov	rax, QWORD PTR 72[rbp]
	mov	rdx, rax
	call	eb_length
	mov	QWORD PTR 64[rbp], rax
	lea	rcx, eb_put_num[rip]
	mov	rax, QWORD PTR 64[rbp]
	mov	rdx, rax
	call	eb_put_num
	mov	QWORD PTR 56[rbp], rax
	lea	rax, .LC53[rip]
	mov	rdx, rax
	lea	rax, eb_put_ir_c1f1f1f2f2f2f2f2f1f111100.22[rip]
	mov	rcx, rax
	call	ebz_stol
	mov	rax, QWORD PTR eb_put_ir_c1f1f1f2f2f2f2f2f1f111100.22[rip]
	lea	rcx, eb_put_str[rip]
	mov	rdx, rax
	call	eb_put_str
	mov	QWORD PTR 48[rbp], rax
	lea	rax, eb_put_line[rip]
	mov	rcx, rax
	call	eb_put_line
	mov	QWORD PTR 40[rbp], rax
	mov	rax, QWORD PTR 144[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR 32[rbp], rax
	lea	rcx, eb_cdr[rip]
	mov	rax, QWORD PTR 32[rbp]
	mov	rdx, rax
	call	eb_cdr
	mov	QWORD PTR 24[rbp], rax
	lea	rax, eb_put_ir_c1f1f1f2f2f2f2f2f1f11111101f[rip]
	mov	QWORD PTR -88[rbp], rax
	lea	rdx, -88[rbp]
	lea	rcx, eb_for[rip]
	mov	rax, QWORD PTR 24[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_for
	mov	QWORD PTR 16[rbp], rax
	lea	rax, .LC54[rip]
	mov	rdx, rax
	lea	rax, eb_put_ir_c1f1f1f2f2f2f2f2f1f111111100.21[rip]
	mov	rcx, rax
	call	ebz_stol
	mov	rax, QWORD PTR eb_put_ir_c1f1f1f2f2f2f2f2f1f111111100.21[rip]
	lea	rcx, eb_put_str[rip]
	mov	rdx, rax
	call	eb_put_str
	mov	QWORD PTR 8[rbp], rax
	lea	rax, eb_put_line[rip]
	mov	rcx, rax
	call	eb_put_line
	mov	QWORD PTR 0[rbp], rax
	mov	QWORD PTR -8[rbp], 0
	lea	rcx, eb_do[rip]
	mov	rdx, QWORD PTR -8[rbp]
	mov	rax, QWORD PTR 0[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_do
	mov	QWORD PTR -16[rbp], rax
	lea	rcx, eb_do[rip]
	mov	rdx, QWORD PTR -16[rbp]
	mov	rax, QWORD PTR 8[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_do
	mov	QWORD PTR -24[rbp], rax
	lea	rcx, eb_do[rip]
	mov	rdx, QWORD PTR -24[rbp]
	mov	rax, QWORD PTR 16[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_do
	mov	QWORD PTR -32[rbp], rax
	lea	rcx, eb_do[rip]
	mov	rdx, QWORD PTR -32[rbp]
	mov	rax, QWORD PTR 40[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_do
	mov	QWORD PTR -40[rbp], rax
	lea	rcx, eb_do[rip]
	mov	rdx, QWORD PTR -40[rbp]
	mov	rax, QWORD PTR 48[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_do
	mov	QWORD PTR -48[rbp], rax
	lea	rcx, eb_do[rip]
	mov	rdx, QWORD PTR -48[rbp]
	mov	rax, QWORD PTR 56[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_do
	mov	QWORD PTR -56[rbp], rax
	lea	rcx, eb_do[rip]
	mov	rdx, QWORD PTR -56[rbp]
	mov	rax, QWORD PTR 88[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_do
	mov	QWORD PTR -64[rbp], rax
	lea	rcx, eb_do[rip]
	mov	rdx, QWORD PTR -64[rbp]
	mov	rax, QWORD PTR 96[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_do
	mov	QWORD PTR -72[rbp], rax
	lea	rcx, eb_do[rip]
	mov	rdx, QWORD PTR -72[rbp]
	mov	rax, QWORD PTR 120[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_do
	mov	QWORD PTR -80[rbp], rax
	mov	rax, QWORD PTR -80[rbp]
	add	rsp, 256
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_put_ir_c1f1f1f2f2f2f2f2f2f1f
	.def	eb_put_ir_c1f1f1f2f2f2f2f2f2f1f;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_put_ir_c1f1f1f2f2f2f2f2f2f1f
eb_put_ir_c1f1f1f2f2f2f2f2f2f1f:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 16
	.seh_stackalloc	16
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	QWORD PTR -8[rbp], 0
	mov	rax, QWORD PTR -8[rbp]
	add	rsp, 16
	pop	rbp
	ret
	.seh_endproc
	.section .rdata,"dr"
.LC55:
	.ascii "  return \0"
.LC56:
	.ascii ";\0"
	.text
	.globl	eb_put_ir_c1f1f1f2f2f2f2f2f2f2f1f
	.def	eb_put_ir_c1f1f1f2f2f2f2f2f2f2f1f;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_put_ir_c1f1f1f2f2f2f2f2f2f2f1f
eb_put_ir_c1f1f1f2f2f2f2f2f2f2f1f:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	add	rsp, -128
	.seh_stackalloc	128
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	lea	rax, .LC55[rip]
	mov	rdx, rax
	lea	rax, eb_put_ir_c1f1f1f2f2f2f2f2f2f2f1f00.20[rip]
	mov	rcx, rax
	call	ebz_stol
	mov	rax, QWORD PTR eb_put_ir_c1f1f1f2f2f2f2f2f2f2f1f00.20[rip]
	lea	rcx, eb_put_str[rip]
	mov	rdx, rax
	call	eb_put_str
	mov	QWORD PTR -8[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -16[rbp], rax
	lea	rcx, eb_car[rip]
	mov	rax, QWORD PTR -16[rbp]
	mov	rdx, rax
	call	eb_car
	mov	QWORD PTR -24[rbp], rax
	lea	rcx, eb_put_ir_c[rip]
	mov	rax, QWORD PTR -24[rbp]
	mov	rdx, rax
	call	eb_put_ir_c
	mov	QWORD PTR -32[rbp], rax
	lea	rax, .LC56[rip]
	mov	rdx, rax
	lea	rax, eb_put_ir_c1f1f1f2f2f2f2f2f2f2f1f1100.19[rip]
	mov	rcx, rax
	call	ebz_stol
	mov	rax, QWORD PTR eb_put_ir_c1f1f1f2f2f2f2f2f2f2f1f1100.19[rip]
	lea	rcx, eb_put_str[rip]
	mov	rdx, rax
	call	eb_put_str
	mov	QWORD PTR -40[rbp], rax
	lea	rax, eb_put_line[rip]
	mov	rcx, rax
	call	eb_put_line
	mov	QWORD PTR -48[rbp], rax
	mov	QWORD PTR -56[rbp], 0
	lea	rcx, eb_do[rip]
	mov	rdx, QWORD PTR -56[rbp]
	mov	rax, QWORD PTR -48[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_do
	mov	QWORD PTR -64[rbp], rax
	lea	rcx, eb_do[rip]
	mov	rdx, QWORD PTR -64[rbp]
	mov	rax, QWORD PTR -40[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_do
	mov	QWORD PTR -72[rbp], rax
	lea	rcx, eb_do[rip]
	mov	rdx, QWORD PTR -72[rbp]
	mov	rax, QWORD PTR -32[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_do
	mov	QWORD PTR -80[rbp], rax
	lea	rcx, eb_do[rip]
	mov	rdx, QWORD PTR -80[rbp]
	mov	rax, QWORD PTR -8[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_do
	mov	QWORD PTR -88[rbp], rax
	mov	rax, QWORD PTR -88[rbp]
	sub	rsp, -128
	pop	rbp
	ret
	.seh_endproc
	.section .rdata,"dr"
.LC57:
	.ascii "((size_t *)\0"
.LC58:
	.ascii ")[\0"
.LC59:
	.ascii "]\0"
	.text
	.globl	eb_put_ir_c1f1f1f2f2f2f2f2f2f2f2f1f
	.def	eb_put_ir_c1f1f1f2f2f2f2f2f2f2f2f1f;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_put_ir_c1f1f1f2f2f2f2f2f2f2f2f1f
eb_put_ir_c1f1f1f2f2f2f2f2f2f2f2f1f:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 160
	.seh_stackalloc	160
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	lea	rax, .LC57[rip]
	mov	rdx, rax
	lea	rax, eb_put_ir_c1f1f1f2f2f2f2f2f2f2f2f1f00.18[rip]
	mov	rcx, rax
	call	ebz_stol
	mov	rax, QWORD PTR eb_put_ir_c1f1f1f2f2f2f2f2f2f2f2f1f00.18[rip]
	lea	rcx, eb_put_str[rip]
	mov	rdx, rax
	call	eb_put_str
	mov	QWORD PTR -8[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -16[rbp], rax
	lea	rcx, eb_car[rip]
	mov	rax, QWORD PTR -16[rbp]
	mov	rdx, rax
	call	eb_car
	mov	QWORD PTR -24[rbp], rax
	lea	rcx, eb_put_ir_c[rip]
	mov	rax, QWORD PTR -24[rbp]
	mov	rdx, rax
	call	eb_put_ir_c
	mov	QWORD PTR -32[rbp], rax
	lea	rax, .LC58[rip]
	mov	rdx, rax
	lea	rax, eb_put_ir_c1f1f1f2f2f2f2f2f2f2f2f1f1100.17[rip]
	mov	rcx, rax
	call	ebz_stol
	mov	rax, QWORD PTR eb_put_ir_c1f1f1f2f2f2f2f2f2f2f2f1f1100.17[rip]
	lea	rcx, eb_put_str[rip]
	mov	rdx, rax
	call	eb_put_str
	mov	QWORD PTR -40[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -48[rbp], rax
	lea	rcx, eb_cdr[rip]
	mov	rax, QWORD PTR -48[rbp]
	mov	rdx, rax
	call	eb_cdr
	mov	QWORD PTR -56[rbp], rax
	lea	rcx, eb_car[rip]
	mov	rax, QWORD PTR -56[rbp]
	mov	rdx, rax
	call	eb_car
	mov	QWORD PTR -64[rbp], rax
	lea	rcx, eb_put_ir_c[rip]
	mov	rax, QWORD PTR -64[rbp]
	mov	rdx, rax
	call	eb_put_ir_c
	mov	QWORD PTR -72[rbp], rax
	lea	rax, .LC59[rip]
	mov	rdx, rax
	lea	rax, eb_put_ir_c1f1f1f2f2f2f2f2f2f2f2f1f111100.16[rip]
	mov	rcx, rax
	call	ebz_stol
	mov	rax, QWORD PTR eb_put_ir_c1f1f1f2f2f2f2f2f2f2f2f1f111100.16[rip]
	lea	rcx, eb_put_str[rip]
	mov	rdx, rax
	call	eb_put_str
	mov	QWORD PTR -80[rbp], rax
	mov	QWORD PTR -88[rbp], 0
	lea	rcx, eb_do[rip]
	mov	rdx, QWORD PTR -88[rbp]
	mov	rax, QWORD PTR -80[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_do
	mov	QWORD PTR -96[rbp], rax
	lea	rcx, eb_do[rip]
	mov	rdx, QWORD PTR -96[rbp]
	mov	rax, QWORD PTR -72[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_do
	mov	QWORD PTR -104[rbp], rax
	lea	rcx, eb_do[rip]
	mov	rdx, QWORD PTR -104[rbp]
	mov	rax, QWORD PTR -40[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_do
	mov	QWORD PTR -112[rbp], rax
	lea	rcx, eb_do[rip]
	mov	rdx, QWORD PTR -112[rbp]
	mov	rax, QWORD PTR -32[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_do
	mov	QWORD PTR -120[rbp], rax
	lea	rcx, eb_do[rip]
	mov	rdx, QWORD PTR -120[rbp]
	mov	rax, QWORD PTR -8[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_do
	mov	QWORD PTR -128[rbp], rax
	mov	rax, QWORD PTR -128[rbp]
	add	rsp, 160
	pop	rbp
	ret
	.seh_endproc
	.section .rdata,"dr"
.LC60:
	.ascii "  static size_t \0"
.LC61:
	.ascii " = 0;\0"
.LC62:
	.ascii "  ebz_stol(&\0"
	.text
	.globl	eb_put_ir_c1f1f1f2f2f2f2f2f2f2f2f2f1f
	.def	eb_put_ir_c1f1f1f2f2f2f2f2f2f2f2f2f1f;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_put_ir_c1f1f1f2f2f2f2f2f2f2f2f2f1f
eb_put_ir_c1f1f1f2f2f2f2f2f2f2f2f2f1f:
	push	rbp
	.seh_pushreg	rbp
	sub	rsp, 256
	.seh_stackalloc	256
	lea	rbp, 128[rsp]
	.seh_setframe	rbp, 128
	.seh_endprologue
	mov	QWORD PTR 144[rbp], rcx
	lea	rax, .LC60[rip]
	mov	rdx, rax
	lea	rax, eb_put_ir_c1f1f1f2f2f2f2f2f2f2f2f2f1f00.15[rip]
	mov	rcx, rax
	call	ebz_stol
	mov	rax, QWORD PTR eb_put_ir_c1f1f1f2f2f2f2f2f2f2f2f2f1f00.15[rip]
	lea	rcx, eb_put_str[rip]
	mov	rdx, rax
	call	eb_put_str
	mov	QWORD PTR 120[rbp], rax
	mov	rax, QWORD PTR 144[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR 112[rbp], rax
	lea	rcx, eb_car[rip]
	mov	rax, QWORD PTR 112[rbp]
	mov	rdx, rax
	call	eb_car
	mov	QWORD PTR 104[rbp], rax
	lea	rcx, eb_put_ir_c[rip]
	mov	rax, QWORD PTR 104[rbp]
	mov	rdx, rax
	call	eb_put_ir_c
	mov	QWORD PTR 96[rbp], rax
	lea	rax, .LC61[rip]
	mov	rdx, rax
	lea	rax, eb_put_ir_c1f1f1f2f2f2f2f2f2f2f2f2f1f1100.14[rip]
	mov	rcx, rax
	call	ebz_stol
	mov	rax, QWORD PTR eb_put_ir_c1f1f1f2f2f2f2f2f2f2f2f2f1f1100.14[rip]
	lea	rcx, eb_put_str[rip]
	mov	rdx, rax
	call	eb_put_str
	mov	QWORD PTR 88[rbp], rax
	lea	rax, eb_put_line[rip]
	mov	rcx, rax
	call	eb_put_line
	mov	QWORD PTR 80[rbp], rax
	lea	rax, .LC62[rip]
	mov	rdx, rax
	lea	rax, eb_put_ir_c1f1f1f2f2f2f2f2f2f2f2f2f1f111100.13[rip]
	mov	rcx, rax
	call	ebz_stol
	mov	rax, QWORD PTR eb_put_ir_c1f1f1f2f2f2f2f2f2f2f2f2f1f111100.13[rip]
	lea	rcx, eb_put_str[rip]
	mov	rdx, rax
	call	eb_put_str
	mov	QWORD PTR 72[rbp], rax
	mov	rax, QWORD PTR 144[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR 64[rbp], rax
	lea	rcx, eb_car[rip]
	mov	rax, QWORD PTR 64[rbp]
	mov	rdx, rax
	call	eb_car
	mov	QWORD PTR 56[rbp], rax
	lea	rcx, eb_put_ir_c[rip]
	mov	rax, QWORD PTR 56[rbp]
	mov	rdx, rax
	call	eb_put_ir_c
	mov	QWORD PTR 48[rbp], rax
	lea	rax, .LC43[rip]
	mov	rdx, rax
	lea	rax, eb_put_ir_c1f1f1f2f2f2f2f2f2f2f2f2f1f11111100.12[rip]
	mov	rcx, rax
	call	ebz_stol
	mov	rax, QWORD PTR eb_put_ir_c1f1f1f2f2f2f2f2f2f2f2f2f1f11111100.12[rip]
	lea	rcx, eb_put_str[rip]
	mov	rdx, rax
	call	eb_put_str
	mov	QWORD PTR 40[rbp], rax
	mov	rax, QWORD PTR 144[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR 32[rbp], rax
	lea	rcx, eb_cdr[rip]
	mov	rax, QWORD PTR 32[rbp]
	mov	rdx, rax
	call	eb_cdr
	mov	QWORD PTR 24[rbp], rax
	lea	rcx, eb_car[rip]
	mov	rax, QWORD PTR 24[rbp]
	mov	rdx, rax
	call	eb_car
	mov	QWORD PTR 16[rbp], rax
	lea	rcx, eb_put_ir_c[rip]
	mov	rax, QWORD PTR 16[rbp]
	mov	rdx, rax
	call	eb_put_ir_c
	mov	QWORD PTR 8[rbp], rax
	lea	rax, .LC40[rip]
	mov	rdx, rax
	lea	rax, eb_put_ir_c1f1f1f2f2f2f2f2f2f2f2f2f1f1111111100.11[rip]
	mov	rcx, rax
	call	ebz_stol
	mov	rax, QWORD PTR eb_put_ir_c1f1f1f2f2f2f2f2f2f2f2f2f1f1111111100.11[rip]
	lea	rcx, eb_put_str[rip]
	mov	rdx, rax
	call	eb_put_str
	mov	QWORD PTR 0[rbp], rax
	lea	rax, eb_put_line[rip]
	mov	rcx, rax
	call	eb_put_line
	mov	QWORD PTR -8[rbp], rax
	mov	QWORD PTR -16[rbp], 0
	lea	rcx, eb_do[rip]
	mov	rdx, QWORD PTR -16[rbp]
	mov	rax, QWORD PTR -8[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_do
	mov	QWORD PTR -24[rbp], rax
	lea	rcx, eb_do[rip]
	mov	rdx, QWORD PTR -24[rbp]
	mov	rax, QWORD PTR 0[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_do
	mov	QWORD PTR -32[rbp], rax
	lea	rcx, eb_do[rip]
	mov	rdx, QWORD PTR -32[rbp]
	mov	rax, QWORD PTR 8[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_do
	mov	QWORD PTR -40[rbp], rax
	lea	rcx, eb_do[rip]
	mov	rdx, QWORD PTR -40[rbp]
	mov	rax, QWORD PTR 40[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_do
	mov	QWORD PTR -48[rbp], rax
	lea	rcx, eb_do[rip]
	mov	rdx, QWORD PTR -48[rbp]
	mov	rax, QWORD PTR 48[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_do
	mov	QWORD PTR -56[rbp], rax
	lea	rcx, eb_do[rip]
	mov	rdx, QWORD PTR -56[rbp]
	mov	rax, QWORD PTR 72[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_do
	mov	QWORD PTR -64[rbp], rax
	lea	rcx, eb_do[rip]
	mov	rdx, QWORD PTR -64[rbp]
	mov	rax, QWORD PTR 80[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_do
	mov	QWORD PTR -72[rbp], rax
	lea	rcx, eb_do[rip]
	mov	rdx, QWORD PTR -72[rbp]
	mov	rax, QWORD PTR 88[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_do
	mov	QWORD PTR -80[rbp], rax
	lea	rcx, eb_do[rip]
	mov	rdx, QWORD PTR -80[rbp]
	mov	rax, QWORD PTR 96[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_do
	mov	QWORD PTR -88[rbp], rax
	lea	rcx, eb_do[rip]
	mov	rdx, QWORD PTR -88[rbp]
	mov	rax, QWORD PTR 120[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_do
	mov	QWORD PTR -96[rbp], rax
	mov	rax, QWORD PTR -96[rbp]
	add	rsp, 256
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_put_ir_c1f1f1f2f2f2f2f2f2f2f2f2f2f
	.def	eb_put_ir_c1f1f1f2f2f2f2f2f2f2f2f2f2f;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_put_ir_c1f1f1f2f2f2f2f2f2f2f2f2f2f
eb_put_ir_c1f1f1f2f2f2f2f2f2f2f2f2f2f:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 16
	.seh_stackalloc	16
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	QWORD PTR -8[rbp], 0
	mov	rax, QWORD PTR -8[rbp]
	add	rsp, 16
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_put_ir_c1f1f1f2f2f2f2f2f2f2f2f2f
	.def	eb_put_ir_c1f1f1f2f2f2f2f2f2f2f2f2f;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_put_ir_c1f1f1f2f2f2f2f2f2f2f2f2f
eb_put_ir_c1f1f1f2f2f2f2f2f2f2f2f2f:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 96
	.seh_stackalloc	96
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -8[rbp], rax
	lea	rax, eb_ir_form_type_let_string[rip]
	mov	rcx, rax
	call	eb_ir_form_type_let_string
	mov	QWORD PTR -16[rbp], rax
	lea	rcx, eb_equal[rip]
	mov	rdx, QWORD PTR -16[rbp]
	mov	rax, QWORD PTR -8[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_equal
	mov	QWORD PTR -24[rbp], rax
	lea	rax, eb_put_ir_c1f1f1f2f2f2f2f2f2f2f2f2f1f[rip]
	mov	QWORD PTR -48[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 16
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -40[rbp], rax
	lea	rax, eb_put_ir_c1f1f1f2f2f2f2f2f2f2f2f2f2f[rip]
	mov	QWORD PTR -56[rbp], rax
	lea	r8, -56[rbp]
	lea	rdx, -48[rbp]
	lea	rcx, eb_if[rip]
	mov	rax, QWORD PTR -24[rbp]
	mov	r9, r8
	mov	r8, rdx
	mov	rdx, rax
	call	eb_if
	mov	QWORD PTR -32[rbp], rax
	mov	rax, QWORD PTR -32[rbp]
	add	rsp, 96
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_put_ir_c1f1f1f2f2f2f2f2f2f2f2f
	.def	eb_put_ir_c1f1f1f2f2f2f2f2f2f2f2f;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_put_ir_c1f1f1f2f2f2f2f2f2f2f2f
eb_put_ir_c1f1f1f2f2f2f2f2f2f2f2f:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 112
	.seh_stackalloc	112
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -8[rbp], rax
	lea	rax, eb_ir_form_type_closure_get[rip]
	mov	rcx, rax
	call	eb_ir_form_type_closure_get
	mov	QWORD PTR -16[rbp], rax
	lea	rcx, eb_equal[rip]
	mov	rdx, QWORD PTR -16[rbp]
	mov	rax, QWORD PTR -8[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_equal
	mov	QWORD PTR -24[rbp], rax
	lea	rax, eb_put_ir_c1f1f1f2f2f2f2f2f2f2f2f1f[rip]
	mov	QWORD PTR -48[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 16
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -40[rbp], rax
	lea	rax, eb_put_ir_c1f1f1f2f2f2f2f2f2f2f2f2f[rip]
	mov	QWORD PTR -80[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -72[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 16
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -64[rbp], rax
	lea	r8, -80[rbp]
	lea	rdx, -48[rbp]
	lea	rcx, eb_if[rip]
	mov	rax, QWORD PTR -24[rbp]
	mov	r9, r8
	mov	r8, rdx
	mov	rdx, rax
	call	eb_if
	mov	QWORD PTR -32[rbp], rax
	mov	rax, QWORD PTR -32[rbp]
	add	rsp, 112
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_put_ir_c1f1f1f2f2f2f2f2f2f2f
	.def	eb_put_ir_c1f1f1f2f2f2f2f2f2f2f;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_put_ir_c1f1f1f2f2f2f2f2f2f2f
eb_put_ir_c1f1f1f2f2f2f2f2f2f2f:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 112
	.seh_stackalloc	112
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -8[rbp], rax
	lea	rax, eb_ir_form_type_return[rip]
	mov	rcx, rax
	call	eb_ir_form_type_return
	mov	QWORD PTR -16[rbp], rax
	lea	rcx, eb_equal[rip]
	mov	rdx, QWORD PTR -16[rbp]
	mov	rax, QWORD PTR -8[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_equal
	mov	QWORD PTR -24[rbp], rax
	lea	rax, eb_put_ir_c1f1f1f2f2f2f2f2f2f2f1f[rip]
	mov	QWORD PTR -48[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 16
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -40[rbp], rax
	lea	rax, eb_put_ir_c1f1f1f2f2f2f2f2f2f2f2f[rip]
	mov	QWORD PTR -80[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -72[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 16
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -64[rbp], rax
	lea	r8, -80[rbp]
	lea	rdx, -48[rbp]
	lea	rcx, eb_if[rip]
	mov	rax, QWORD PTR -24[rbp]
	mov	r9, r8
	mov	r8, rdx
	mov	rdx, rax
	call	eb_if
	mov	QWORD PTR -32[rbp], rax
	mov	rax, QWORD PTR -32[rbp]
	add	rsp, 112
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_put_ir_c1f1f1f2f2f2f2f2f2f
	.def	eb_put_ir_c1f1f1f2f2f2f2f2f2f;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_put_ir_c1f1f1f2f2f2f2f2f2f
eb_put_ir_c1f1f1f2f2f2f2f2f2f:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 96
	.seh_stackalloc	96
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -8[rbp], rax
	lea	rax, eb_ir_form_type_extern[rip]
	mov	rcx, rax
	call	eb_ir_form_type_extern
	mov	QWORD PTR -16[rbp], rax
	lea	rcx, eb_equal[rip]
	mov	rdx, QWORD PTR -16[rbp]
	mov	rax, QWORD PTR -8[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_equal
	mov	QWORD PTR -24[rbp], rax
	lea	rax, eb_put_ir_c1f1f1f2f2f2f2f2f2f1f[rip]
	mov	QWORD PTR -40[rbp], rax
	lea	rax, eb_put_ir_c1f1f1f2f2f2f2f2f2f2f[rip]
	mov	QWORD PTR -64[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -56[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 16
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -48[rbp], rax
	lea	r8, -64[rbp]
	lea	rdx, -40[rbp]
	lea	rcx, eb_if[rip]
	mov	rax, QWORD PTR -24[rbp]
	mov	r9, r8
	mov	r8, rdx
	mov	rdx, rax
	call	eb_if
	mov	QWORD PTR -32[rbp], rax
	mov	rax, QWORD PTR -32[rbp]
	add	rsp, 96
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_put_ir_c1f1f1f2f2f2f2f2f
	.def	eb_put_ir_c1f1f1f2f2f2f2f2f;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_put_ir_c1f1f1f2f2f2f2f2f
eb_put_ir_c1f1f1f2f2f2f2f2f:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 112
	.seh_stackalloc	112
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -8[rbp], rax
	lea	rax, eb_ir_form_type_let_closure[rip]
	mov	rcx, rax
	call	eb_ir_form_type_let_closure
	mov	QWORD PTR -16[rbp], rax
	lea	rcx, eb_equal[rip]
	mov	rdx, QWORD PTR -16[rbp]
	mov	rax, QWORD PTR -8[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_equal
	mov	QWORD PTR -24[rbp], rax
	lea	rax, eb_put_ir_c1f1f1f2f2f2f2f2f1f[rip]
	mov	QWORD PTR -48[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 16
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -40[rbp], rax
	lea	rax, eb_put_ir_c1f1f1f2f2f2f2f2f2f[rip]
	mov	QWORD PTR -80[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -72[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 16
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -64[rbp], rax
	lea	r8, -80[rbp]
	lea	rdx, -48[rbp]
	lea	rcx, eb_if[rip]
	mov	rax, QWORD PTR -24[rbp]
	mov	r9, r8
	mov	r8, rdx
	mov	rdx, rax
	call	eb_if
	mov	QWORD PTR -32[rbp], rax
	mov	rax, QWORD PTR -32[rbp]
	add	rsp, 112
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_put_ir_c1f1f1f2f2f2f2f
	.def	eb_put_ir_c1f1f1f2f2f2f2f;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_put_ir_c1f1f1f2f2f2f2f
eb_put_ir_c1f1f1f2f2f2f2f:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 112
	.seh_stackalloc	112
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -8[rbp], rax
	lea	rax, eb_ir_form_type_params[rip]
	mov	rcx, rax
	call	eb_ir_form_type_params
	mov	QWORD PTR -16[rbp], rax
	lea	rcx, eb_equal[rip]
	mov	rdx, QWORD PTR -16[rbp]
	mov	rax, QWORD PTR -8[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_equal
	mov	QWORD PTR -24[rbp], rax
	lea	rax, eb_put_ir_c1f1f1f2f2f2f2f1f[rip]
	mov	QWORD PTR -48[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 16
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -40[rbp], rax
	lea	rax, eb_put_ir_c1f1f1f2f2f2f2f2f[rip]
	mov	QWORD PTR -80[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -72[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 16
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -64[rbp], rax
	lea	r8, -80[rbp]
	lea	rdx, -48[rbp]
	lea	rcx, eb_if[rip]
	mov	rax, QWORD PTR -24[rbp]
	mov	r9, r8
	mov	r8, rdx
	mov	rdx, rax
	call	eb_if
	mov	QWORD PTR -32[rbp], rax
	mov	rax, QWORD PTR -32[rbp]
	add	rsp, 112
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_put_ir_c1f1f1f2f2f2f
	.def	eb_put_ir_c1f1f1f2f2f2f;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_put_ir_c1f1f1f2f2f2f
eb_put_ir_c1f1f1f2f2f2f:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 112
	.seh_stackalloc	112
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -8[rbp], rax
	lea	rax, eb_ir_form_type_function[rip]
	mov	rcx, rax
	call	eb_ir_form_type_function
	mov	QWORD PTR -16[rbp], rax
	lea	rcx, eb_equal[rip]
	mov	rdx, QWORD PTR -16[rbp]
	mov	rax, QWORD PTR -8[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_equal
	mov	QWORD PTR -24[rbp], rax
	lea	rax, eb_put_ir_c1f1f1f2f2f2f1f[rip]
	mov	QWORD PTR -48[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 16
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -40[rbp], rax
	lea	rax, eb_put_ir_c1f1f1f2f2f2f2f[rip]
	mov	QWORD PTR -80[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -72[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 16
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -64[rbp], rax
	lea	r8, -80[rbp]
	lea	rdx, -48[rbp]
	lea	rcx, eb_if[rip]
	mov	rax, QWORD PTR -24[rbp]
	mov	r9, r8
	mov	r8, rdx
	mov	rdx, rax
	call	eb_if
	mov	QWORD PTR -32[rbp], rax
	mov	rax, QWORD PTR -32[rbp]
	add	rsp, 112
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_put_ir_c1f1f1f2f2f
	.def	eb_put_ir_c1f1f1f2f2f;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_put_ir_c1f1f1f2f2f
eb_put_ir_c1f1f1f2f2f:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 112
	.seh_stackalloc	112
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -8[rbp], rax
	lea	rax, eb_ir_form_type_call[rip]
	mov	rcx, rax
	call	eb_ir_form_type_call
	mov	QWORD PTR -16[rbp], rax
	lea	rcx, eb_equal[rip]
	mov	rdx, QWORD PTR -16[rbp]
	mov	rax, QWORD PTR -8[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_equal
	mov	QWORD PTR -24[rbp], rax
	lea	rax, eb_put_ir_c1f1f1f2f2f1f[rip]
	mov	QWORD PTR -48[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 16
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -40[rbp], rax
	lea	rax, eb_put_ir_c1f1f1f2f2f2f[rip]
	mov	QWORD PTR -80[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -72[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 16
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -64[rbp], rax
	lea	r8, -80[rbp]
	lea	rdx, -48[rbp]
	lea	rcx, eb_if[rip]
	mov	rax, QWORD PTR -24[rbp]
	mov	r9, r8
	mov	r8, rdx
	mov	rdx, rax
	call	eb_if
	mov	QWORD PTR -32[rbp], rax
	mov	rax, QWORD PTR -32[rbp]
	add	rsp, 112
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_put_ir_c1f1f1f2f
	.def	eb_put_ir_c1f1f1f2f;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_put_ir_c1f1f1f2f
eb_put_ir_c1f1f1f2f:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 112
	.seh_stackalloc	112
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -8[rbp], rax
	lea	rax, eb_ir_form_type_block[rip]
	mov	rcx, rax
	call	eb_ir_form_type_block
	mov	QWORD PTR -16[rbp], rax
	lea	rcx, eb_equal[rip]
	mov	rdx, QWORD PTR -16[rbp]
	mov	rax, QWORD PTR -8[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_equal
	mov	QWORD PTR -24[rbp], rax
	lea	rax, eb_put_ir_c1f1f1f2f1f[rip]
	mov	QWORD PTR -48[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 16
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -40[rbp], rax
	lea	rax, eb_put_ir_c1f1f1f2f2f[rip]
	mov	QWORD PTR -80[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -72[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 16
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -64[rbp], rax
	lea	r8, -80[rbp]
	lea	rdx, -48[rbp]
	lea	rcx, eb_if[rip]
	mov	rax, QWORD PTR -24[rbp]
	mov	r9, r8
	mov	r8, rdx
	mov	rdx, rax
	call	eb_if
	mov	QWORD PTR -32[rbp], rax
	mov	rax, QWORD PTR -32[rbp]
	add	rsp, 112
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_put_ir_c1f1f1f
	.def	eb_put_ir_c1f1f1f;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_put_ir_c1f1f1f
eb_put_ir_c1f1f1f:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 112
	.seh_stackalloc	112
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	QWORD PTR 24[rbp], rdx
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -8[rbp], rax
	lea	rax, eb_ir_form_type_let[rip]
	mov	rcx, rax
	call	eb_ir_form_type_let
	mov	QWORD PTR -16[rbp], rax
	lea	rcx, eb_equal[rip]
	mov	rdx, QWORD PTR -16[rbp]
	mov	rax, QWORD PTR -8[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_equal
	mov	QWORD PTR -24[rbp], rax
	lea	rax, eb_put_ir_c1f1f1f1f[rip]
	mov	QWORD PTR -48[rbp], rax
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -40[rbp], rax
	lea	rax, eb_put_ir_c1f1f1f2f[rip]
	mov	QWORD PTR -80[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -72[rbp], rax
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -64[rbp], rax
	lea	r8, -80[rbp]
	lea	rdx, -48[rbp]
	lea	rcx, eb_if[rip]
	mov	rax, QWORD PTR -24[rbp]
	mov	r9, r8
	mov	r8, rdx
	mov	rdx, rax
	call	eb_if
	mov	QWORD PTR -32[rbp], rax
	mov	rax, QWORD PTR -32[rbp]
	add	rsp, 112
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_put_ir_c1f1f
	.def	eb_put_ir_c1f1f;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_put_ir_c1f1f
eb_put_ir_c1f1f:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 80
	.seh_stackalloc	80
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	QWORD PTR 24[rbp], rdx
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -8[rbp], rax
	lea	rcx, eb_ir_form_args[rip]
	mov	rax, QWORD PTR -8[rbp]
	mov	rdx, rax
	call	eb_ir_form_args
	mov	QWORD PTR -16[rbp], rax
	lea	rax, eb_put_ir_c1f1f1f[rip]
	mov	QWORD PTR -48[rbp], rax
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -40[rbp], rax
	lea	rdx, -48[rbp]
	lea	rcx, eb_let[rip]
	mov	rax, QWORD PTR -16[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_let
	mov	QWORD PTR -24[rbp], rax
	mov	rax, QWORD PTR -24[rbp]
	add	rsp, 80
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_put_ir_c1f
	.def	eb_put_ir_c1f;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_put_ir_c1f
eb_put_ir_c1f:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 80
	.seh_stackalloc	80
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -8[rbp], rax
	lea	rcx, eb_ir_form_type[rip]
	mov	rax, QWORD PTR -8[rbp]
	mov	rdx, rax
	call	eb_ir_form_type
	mov	QWORD PTR -16[rbp], rax
	lea	rax, eb_put_ir_c1f1f[rip]
	mov	QWORD PTR -48[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -40[rbp], rax
	lea	rdx, -48[rbp]
	lea	rcx, eb_let[rip]
	mov	rax, QWORD PTR -16[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_let
	mov	QWORD PTR -24[rbp], rax
	mov	rax, QWORD PTR -24[rbp]
	add	rsp, 80
	pop	rbp
	ret
	.seh_endproc
	.section .rdata,"dr"
.LC63:
	.ascii "_\0"
	.text
	.globl	eb_put_ir_c2f1f11f1f
	.def	eb_put_ir_c2f1f11f1f;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_put_ir_c2f1f11f1f
eb_put_ir_c2f1f11f1f:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 48
	.seh_stackalloc	48
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	lea	rax, .LC63[rip]
	mov	rdx, rax
	lea	rax, eb_put_ir_c2f1f11f1f0.10[rip]
	mov	rcx, rax
	call	ebz_stol
	mov	rax, QWORD PTR eb_put_ir_c2f1f11f1f0.10[rip]
	lea	rcx, eb_put_str[rip]
	mov	rdx, rax
	call	eb_put_str
	mov	QWORD PTR -8[rbp], rax
	mov	rax, QWORD PTR -8[rbp]
	add	rsp, 48
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_put_ir_c2f1f11f2f
	.def	eb_put_ir_c2f1f11f2f;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_put_ir_c2f1f11f2f
eb_put_ir_c2f1f11f2f:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 48
	.seh_stackalloc	48
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -8[rbp], rax
	lea	rcx, eb_putchar[rip]
	mov	rax, QWORD PTR -8[rbp]
	mov	rdx, rax
	call	eb_putchar
	mov	QWORD PTR -16[rbp], rax
	mov	rax, QWORD PTR -16[rbp]
	add	rsp, 48
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_put_ir_c2f1f11f
	.def	eb_put_ir_c2f1f11f;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_put_ir_c2f1f11f
eb_put_ir_c2f1f11f:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 96
	.seh_stackalloc	96
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	QWORD PTR 24[rbp], rdx
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -8[rbp], rax
	mov	QWORD PTR -16[rbp], 45
	lea	rcx, eb_equal[rip]
	mov	rdx, QWORD PTR -16[rbp]
	mov	rax, QWORD PTR -8[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_equal
	mov	QWORD PTR -24[rbp], rax
	lea	rax, eb_put_ir_c2f1f11f1f[rip]
	mov	QWORD PTR -40[rbp], rax
	lea	rax, eb_put_ir_c2f1f11f2f[rip]
	mov	QWORD PTR -64[rbp], rax
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -56[rbp], rax
	lea	r8, -64[rbp]
	lea	rdx, -40[rbp]
	lea	rcx, eb_if[rip]
	mov	rax, QWORD PTR -24[rbp]
	mov	r9, r8
	mov	r8, rdx
	mov	rdx, rax
	call	eb_if
	mov	QWORD PTR -32[rbp], rax
	mov	rax, QWORD PTR -32[rbp]
	add	rsp, 96
	pop	rbp
	ret
	.seh_endproc
	.section .rdata,"dr"
.LC64:
	.ascii "eb_\0"
	.text
	.globl	eb_put_ir_c2f1f
	.def	eb_put_ir_c2f1f;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_put_ir_c2f1f
eb_put_ir_c2f1f:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 80
	.seh_stackalloc	80
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	lea	rax, .LC64[rip]
	mov	rdx, rax
	lea	rax, eb_put_ir_c2f1f00.9[rip]
	mov	rcx, rax
	call	ebz_stol
	mov	rax, QWORD PTR eb_put_ir_c2f1f00.9[rip]
	lea	rcx, eb_put_str[rip]
	mov	rdx, rax
	call	eb_put_str
	mov	QWORD PTR -8[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -16[rbp], rax
	lea	rcx, eb_ir_ident_text[rip]
	mov	rax, QWORD PTR -16[rbp]
	mov	rdx, rax
	call	eb_ir_ident_text
	mov	QWORD PTR -24[rbp], rax
	lea	rax, eb_put_ir_c2f1f11f[rip]
	mov	QWORD PTR -48[rbp], rax
	lea	rdx, -48[rbp]
	lea	rcx, eb_for[rip]
	mov	rax, QWORD PTR -24[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_for
	mov	QWORD PTR -32[rbp], rax
	lea	rcx, eb_do[rip]
	mov	rdx, QWORD PTR -32[rbp]
	mov	rax, QWORD PTR -8[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_do
	mov	QWORD PTR -40[rbp], rax
	mov	rax, QWORD PTR -40[rbp]
	add	rsp, 80
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_put_ir_c2f2f1f
	.def	eb_put_ir_c2f2f1f;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_put_ir_c2f2f1f
eb_put_ir_c2f2f1f:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 64
	.seh_stackalloc	64
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -8[rbp], rax
	lea	rcx, eb_ir_number_value[rip]
	mov	rax, QWORD PTR -8[rbp]
	mov	rdx, rax
	call	eb_ir_number_value
	mov	QWORD PTR -16[rbp], rax
	lea	rcx, eb_put_num[rip]
	mov	rax, QWORD PTR -16[rbp]
	mov	rdx, rax
	call	eb_put_num
	mov	QWORD PTR -24[rbp], rax
	mov	rax, QWORD PTR -24[rbp]
	add	rsp, 64
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_put_ir_c2f2f2f1f
	.def	eb_put_ir_c2f2f2f1f;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_put_ir_c2f2f2f1f
eb_put_ir_c2f2f2f1f:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 160
	.seh_stackalloc	160
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	QWORD PTR -8[rbp], 34
	mov	QWORD PTR -16[rbp], 0
	lea	rcx, eb_cons[rip]
	mov	rdx, QWORD PTR -16[rbp]
	mov	rax, QWORD PTR -8[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_cons
	mov	QWORD PTR -24[rbp], rax
	lea	rcx, eb_put_str[rip]
	mov	rax, QWORD PTR -24[rbp]
	mov	rdx, rax
	call	eb_put_str
	mov	QWORD PTR -32[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -40[rbp], rax
	lea	rcx, eb_ir_string_value[rip]
	mov	rax, QWORD PTR -40[rbp]
	mov	rdx, rax
	call	eb_ir_string_value
	mov	QWORD PTR -48[rbp], rax
	lea	rcx, eb_put_str[rip]
	mov	rax, QWORD PTR -48[rbp]
	mov	rdx, rax
	call	eb_put_str
	mov	QWORD PTR -56[rbp], rax
	mov	QWORD PTR -64[rbp], 34
	mov	QWORD PTR -72[rbp], 0
	lea	rcx, eb_cons[rip]
	mov	rdx, QWORD PTR -72[rbp]
	mov	rax, QWORD PTR -64[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_cons
	mov	QWORD PTR -80[rbp], rax
	lea	rcx, eb_put_str[rip]
	mov	rax, QWORD PTR -80[rbp]
	mov	rdx, rax
	call	eb_put_str
	mov	QWORD PTR -88[rbp], rax
	mov	QWORD PTR -96[rbp], 0
	lea	rcx, eb_do[rip]
	mov	rdx, QWORD PTR -96[rbp]
	mov	rax, QWORD PTR -88[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_do
	mov	QWORD PTR -104[rbp], rax
	lea	rcx, eb_do[rip]
	mov	rdx, QWORD PTR -104[rbp]
	mov	rax, QWORD PTR -56[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_do
	mov	QWORD PTR -112[rbp], rax
	lea	rcx, eb_do[rip]
	mov	rdx, QWORD PTR -112[rbp]
	mov	rax, QWORD PTR -32[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_do
	mov	QWORD PTR -120[rbp], rax
	mov	rax, QWORD PTR -120[rbp]
	add	rsp, 160
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_put_ir_c2f2f2f2f
	.def	eb_put_ir_c2f2f2f2f;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_put_ir_c2f2f2f2f
eb_put_ir_c2f2f2f2f:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 16
	.seh_stackalloc	16
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	QWORD PTR -8[rbp], 0
	mov	rax, QWORD PTR -8[rbp]
	add	rsp, 16
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_put_ir_c2f2f2f
	.def	eb_put_ir_c2f2f2f;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_put_ir_c2f2f2f
eb_put_ir_c2f2f2f:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 96
	.seh_stackalloc	96
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -8[rbp], rax
	lea	rcx, eb_ir_is_string[rip]
	mov	rax, QWORD PTR -8[rbp]
	mov	rdx, rax
	call	eb_ir_is_string
	mov	QWORD PTR -16[rbp], rax
	lea	rax, eb_put_ir_c2f2f2f1f[rip]
	mov	QWORD PTR -48[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -40[rbp], rax
	lea	rax, eb_put_ir_c2f2f2f2f[rip]
	mov	QWORD PTR -56[rbp], rax
	lea	r8, -56[rbp]
	lea	rdx, -48[rbp]
	lea	rcx, eb_if[rip]
	mov	rax, QWORD PTR -16[rbp]
	mov	r9, r8
	mov	r8, rdx
	mov	rdx, rax
	call	eb_if
	mov	QWORD PTR -24[rbp], rax
	mov	rax, QWORD PTR -24[rbp]
	add	rsp, 96
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_put_ir_c2f2f
	.def	eb_put_ir_c2f2f;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_put_ir_c2f2f
eb_put_ir_c2f2f:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 96
	.seh_stackalloc	96
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -8[rbp], rax
	lea	rcx, eb_ir_is_number[rip]
	mov	rax, QWORD PTR -8[rbp]
	mov	rdx, rax
	call	eb_ir_is_number
	mov	QWORD PTR -16[rbp], rax
	lea	rax, eb_put_ir_c2f2f1f[rip]
	mov	QWORD PTR -48[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -40[rbp], rax
	lea	rax, eb_put_ir_c2f2f2f[rip]
	mov	QWORD PTR -64[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -56[rbp], rax
	lea	r8, -64[rbp]
	lea	rdx, -48[rbp]
	lea	rcx, eb_if[rip]
	mov	rax, QWORD PTR -16[rbp]
	mov	r9, r8
	mov	r8, rdx
	mov	rdx, rax
	call	eb_if
	mov	QWORD PTR -24[rbp], rax
	mov	rax, QWORD PTR -24[rbp]
	add	rsp, 96
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_put_ir_c2f
	.def	eb_put_ir_c2f;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_put_ir_c2f
eb_put_ir_c2f:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 96
	.seh_stackalloc	96
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -8[rbp], rax
	lea	rcx, eb_ir_is_ident[rip]
	mov	rax, QWORD PTR -8[rbp]
	mov	rdx, rax
	call	eb_ir_is_ident
	mov	QWORD PTR -16[rbp], rax
	lea	rax, eb_put_ir_c2f1f[rip]
	mov	QWORD PTR -48[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -40[rbp], rax
	lea	rax, eb_put_ir_c2f2f[rip]
	mov	QWORD PTR -64[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -56[rbp], rax
	lea	r8, -64[rbp]
	lea	rdx, -48[rbp]
	lea	rcx, eb_if[rip]
	mov	rax, QWORD PTR -16[rbp]
	mov	r9, r8
	mov	r8, rdx
	mov	rdx, rax
	call	eb_if
	mov	QWORD PTR -24[rbp], rax
	mov	rax, QWORD PTR -24[rbp]
	add	rsp, 96
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_put_ir_c
	.def	eb_put_ir_c;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_put_ir_c
eb_put_ir_c:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 96
	.seh_stackalloc	96
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	QWORD PTR 24[rbp], rdx
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -8[rbp], rax
	lea	rcx, eb_ir_is_form[rip]
	mov	rax, QWORD PTR -8[rbp]
	mov	rdx, rax
	call	eb_ir_is_form
	mov	QWORD PTR -16[rbp], rax
	lea	rax, eb_put_ir_c1f[rip]
	mov	QWORD PTR -48[rbp], rax
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -40[rbp], rax
	lea	rax, eb_put_ir_c2f[rip]
	mov	QWORD PTR -64[rbp], rax
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -56[rbp], rax
	lea	r8, -64[rbp]
	lea	rdx, -48[rbp]
	lea	rcx, eb_if[rip]
	mov	rax, QWORD PTR -16[rbp]
	mov	r9, r8
	mov	r8, rdx
	mov	rdx, rax
	call	eb_if
	mov	QWORD PTR -24[rbp], rax
	mov	rax, QWORD PTR -24[rbp]
	add	rsp, 96
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_put_ir_c_decl01f
	.def	eb_put_ir_c_decl01f;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_put_ir_c_decl01f
eb_put_ir_c_decl01f:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 64
	.seh_stackalloc	64
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -8[rbp], rax
	lea	rcx, eb_ir_form_type[rip]
	mov	rax, QWORD PTR -8[rbp]
	mov	rdx, rax
	call	eb_ir_form_type
	mov	QWORD PTR -16[rbp], rax
	lea	rax, eb_ir_form_type_function[rip]
	mov	rcx, rax
	call	eb_ir_form_type_function
	mov	QWORD PTR -24[rbp], rax
	lea	rcx, eb_equal[rip]
	mov	rdx, QWORD PTR -24[rbp]
	mov	rax, QWORD PTR -16[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_equal
	mov	QWORD PTR -32[rbp], rax
	mov	rax, QWORD PTR -32[rbp]
	add	rsp, 64
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_put_ir_c_decl1f1f
	.def	eb_put_ir_c_decl1f1f;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_put_ir_c_decl1f1f
eb_put_ir_c_decl1f1f:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 160
	.seh_stackalloc	160
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	QWORD PTR 24[rbp], rdx
	lea	rax, .LC49[rip]
	mov	rdx, rax
	lea	rax, eb_put_ir_c_decl1f1f00.8[rip]
	mov	rcx, rax
	call	ebz_stol
	mov	rax, QWORD PTR eb_put_ir_c_decl1f1f00.8[rip]
	lea	rcx, eb_put_str[rip]
	mov	rdx, rax
	call	eb_put_str
	mov	QWORD PTR -8[rbp], rax
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -16[rbp], rax
	lea	rcx, eb_car[rip]
	mov	rax, QWORD PTR -16[rbp]
	mov	rdx, rax
	call	eb_car
	mov	QWORD PTR -24[rbp], rax
	lea	rcx, eb_put_ir_c[rip]
	mov	rax, QWORD PTR -24[rbp]
	mov	rdx, rax
	call	eb_put_ir_c
	mov	QWORD PTR -32[rbp], rax
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -40[rbp], rax
	lea	rcx, eb_cdr[rip]
	mov	rax, QWORD PTR -40[rbp]
	mov	rdx, rax
	call	eb_cdr
	mov	QWORD PTR -48[rbp], rax
	lea	rcx, eb_car[rip]
	mov	rax, QWORD PTR -48[rbp]
	mov	rdx, rax
	call	eb_car
	mov	QWORD PTR -56[rbp], rax
	lea	rcx, eb_put_ir_c[rip]
	mov	rax, QWORD PTR -56[rbp]
	mov	rdx, rax
	call	eb_put_ir_c
	mov	QWORD PTR -64[rbp], rax
	lea	rax, .LC56[rip]
	mov	rdx, rax
	lea	rax, eb_put_ir_c_decl1f1f11100.7[rip]
	mov	rcx, rax
	call	ebz_stol
	mov	rax, QWORD PTR eb_put_ir_c_decl1f1f11100.7[rip]
	lea	rcx, eb_put_str[rip]
	mov	rdx, rax
	call	eb_put_str
	mov	QWORD PTR -72[rbp], rax
	lea	rax, eb_put_line[rip]
	mov	rcx, rax
	call	eb_put_line
	mov	QWORD PTR -80[rbp], rax
	mov	QWORD PTR -88[rbp], 0
	lea	rcx, eb_do[rip]
	mov	rdx, QWORD PTR -88[rbp]
	mov	rax, QWORD PTR -80[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_do
	mov	QWORD PTR -96[rbp], rax
	lea	rcx, eb_do[rip]
	mov	rdx, QWORD PTR -96[rbp]
	mov	rax, QWORD PTR -72[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_do
	mov	QWORD PTR -104[rbp], rax
	lea	rcx, eb_do[rip]
	mov	rdx, QWORD PTR -104[rbp]
	mov	rax, QWORD PTR -64[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_do
	mov	QWORD PTR -112[rbp], rax
	lea	rcx, eb_do[rip]
	mov	rdx, QWORD PTR -112[rbp]
	mov	rax, QWORD PTR -32[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_do
	mov	QWORD PTR -120[rbp], rax
	lea	rcx, eb_do[rip]
	mov	rdx, QWORD PTR -120[rbp]
	mov	rax, QWORD PTR -8[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_do
	mov	QWORD PTR -128[rbp], rax
	mov	rax, QWORD PTR -128[rbp]
	add	rsp, 160
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_put_ir_c_decl1f
	.def	eb_put_ir_c_decl1f;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_put_ir_c_decl1f
eb_put_ir_c_decl1f:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 64
	.seh_stackalloc	64
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -8[rbp], rax
	lea	rcx, eb_ir_form_args[rip]
	mov	rax, QWORD PTR -8[rbp]
	mov	rdx, rax
	call	eb_ir_form_args
	mov	QWORD PTR -16[rbp], rax
	lea	rax, eb_put_ir_c_decl1f1f[rip]
	mov	QWORD PTR -32[rbp], rax
	lea	rdx, -32[rbp]
	lea	rcx, eb_let[rip]
	mov	rax, QWORD PTR -16[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_let
	mov	QWORD PTR -24[rbp], rax
	mov	rax, QWORD PTR -24[rbp]
	add	rsp, 64
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_put_ir_c_decl2f
	.def	eb_put_ir_c_decl2f;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_put_ir_c_decl2f
eb_put_ir_c_decl2f:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 16
	.seh_stackalloc	16
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	QWORD PTR -8[rbp], 0
	mov	rax, QWORD PTR -8[rbp]
	add	rsp, 16
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_put_ir_c_decl
	.def	eb_put_ir_c_decl;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_put_ir_c_decl
eb_put_ir_c_decl:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 112
	.seh_stackalloc	112
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	QWORD PTR 24[rbp], rdx
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -8[rbp], rax
	lea	rcx, eb_ir_is_form[rip]
	mov	rax, QWORD PTR -8[rbp]
	mov	rdx, rax
	call	eb_ir_is_form
	mov	QWORD PTR -16[rbp], rax
	lea	rax, eb_put_ir_c_decl01f[rip]
	mov	QWORD PTR -48[rbp], rax
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -40[rbp], rax
	lea	rdx, -48[rbp]
	lea	rcx, eb_and[rip]
	mov	rax, QWORD PTR -16[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_and
	mov	QWORD PTR -24[rbp], rax
	lea	rax, eb_put_ir_c_decl1f[rip]
	mov	QWORD PTR -64[rbp], rax
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -56[rbp], rax
	lea	rax, eb_put_ir_c_decl2f[rip]
	mov	QWORD PTR -72[rbp], rax
	lea	r8, -72[rbp]
	lea	rdx, -64[rbp]
	lea	rcx, eb_if[rip]
	mov	rax, QWORD PTR -24[rbp]
	mov	r9, r8
	mov	r8, rdx
	mov	rdx, rax
	call	eb_if
	mov	QWORD PTR -32[rbp], rax
	mov	rax, QWORD PTR -32[rbp]
	add	rsp, 112
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_main_lang1f1f
	.def	eb_main_lang1f1f;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_main_lang1f1f
eb_main_lang1f1f:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 80
	.seh_stackalloc	80
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	QWORD PTR 24[rbp], rdx
	lea	rax, eb_put_line[rip]
	mov	rcx, rax
	call	eb_put_line
	mov	QWORD PTR -8[rbp], rax
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -16[rbp], rax
	lea	rcx, eb_ir_print[rip]
	mov	rax, QWORD PTR -16[rbp]
	mov	rdx, rax
	call	eb_ir_print
	mov	QWORD PTR -24[rbp], rax
	lea	rax, eb_put_line[rip]
	mov	rcx, rax
	call	eb_put_line
	mov	QWORD PTR -32[rbp], rax
	lea	rcx, eb_do[rip]
	mov	rdx, QWORD PTR -32[rbp]
	mov	rax, QWORD PTR -24[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_do
	mov	QWORD PTR -40[rbp], rax
	lea	rcx, eb_do[rip]
	mov	rdx, QWORD PTR -40[rbp]
	mov	rax, QWORD PTR -8[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_do
	mov	QWORD PTR -48[rbp], rax
	mov	rax, QWORD PTR -48[rbp]
	add	rsp, 80
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_main_lang1f
	.def	eb_main_lang1f;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_main_lang1f
eb_main_lang1f:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 64
	.seh_stackalloc	64
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -8[rbp], rax
	lea	rax, eb_main_lang1f1f[rip]
	mov	QWORD PTR -24[rbp], rax
	lea	rdx, -24[rbp]
	lea	rcx, eb_for_ir[rip]
	mov	rax, QWORD PTR -8[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_for_ir
	mov	QWORD PTR -16[rbp], rax
	mov	rax, QWORD PTR -16[rbp]
	add	rsp, 64
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_main_lang2f1f2f111f01f
	.def	eb_main_lang2f1f2f111f01f;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_main_lang2f1f2f111f01f
eb_main_lang2f1f2f111f01f:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 16
	.seh_stackalloc	16
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	QWORD PTR -8[rbp], 0
	mov	rax, QWORD PTR -8[rbp]
	add	rsp, 16
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_main_lang2f1f2f111f1f11f
	.def	eb_main_lang2f1f2f111f1f11f;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_main_lang2f1f2f111f1f11f
eb_main_lang2f1f2f111f1f11f:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 48
	.seh_stackalloc	48
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	QWORD PTR 24[rbp], rdx
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -8[rbp], rax
	lea	rcx, eb_put_ir_c[rip]
	mov	rax, QWORD PTR -8[rbp]
	mov	rdx, rax
	call	eb_put_ir_c
	mov	QWORD PTR -16[rbp], rax
	mov	rax, QWORD PTR -16[rbp]
	add	rsp, 48
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_main_lang2f1f2f111f1f
	.def	eb_main_lang2f1f2f111f1f;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_main_lang2f1f2f111f1f
eb_main_lang2f1f2f111f1f:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 96
	.seh_stackalloc	96
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	QWORD PTR 24[rbp], rdx
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -8[rbp], rax
	lea	rcx, eb_reverse[rip]
	mov	rax, QWORD PTR -8[rbp]
	mov	rdx, rax
	call	eb_reverse
	mov	QWORD PTR -16[rbp], rax
	lea	rcx, eb_car[rip]
	mov	rax, QWORD PTR -16[rbp]
	mov	rdx, rax
	call	eb_car
	mov	QWORD PTR -24[rbp], rax
	lea	rcx, eb_put_ir_c_decl[rip]
	mov	rax, QWORD PTR -24[rbp]
	mov	rdx, rax
	call	eb_put_ir_c_decl
	mov	QWORD PTR -32[rbp], rax
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -40[rbp], rax
	lea	rax, eb_main_lang2f1f2f111f1f11f[rip]
	mov	QWORD PTR -64[rbp], rax
	lea	rdx, -64[rbp]
	lea	rcx, eb_for[rip]
	mov	rax, QWORD PTR -40[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_for
	mov	QWORD PTR -48[rbp], rax
	lea	rcx, eb_do[rip]
	mov	rdx, QWORD PTR -48[rbp]
	mov	rax, QWORD PTR -32[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_do
	mov	QWORD PTR -56[rbp], rax
	mov	rax, QWORD PTR -56[rbp]
	add	rsp, 96
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_main_lang2f1f2f111f
	.def	eb_main_lang2f1f2f111f;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_main_lang2f1f2f111f
eb_main_lang2f1f2f111f:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 80
	.seh_stackalloc	80
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	QWORD PTR 24[rbp], rdx
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -8[rbp], rax
	lea	rax, eb_main_lang2f1f2f111f01f[rip]
	mov	QWORD PTR -40[rbp], rax
	mov	QWORD PTR -16[rbp], 0
	lea	rdx, -40[rbp]
	lea	rcx, eb_compile_ir[rip]
	mov	r8, QWORD PTR -16[rbp]
	mov	rax, QWORD PTR -8[rbp]
	mov	r9, r8
	mov	r8, rdx
	mov	rdx, rax
	call	eb_compile_ir
	mov	QWORD PTR -24[rbp], rax
	lea	rax, eb_main_lang2f1f2f111f1f[rip]
	mov	QWORD PTR -48[rbp], rax
	lea	rdx, -48[rbp]
	lea	rcx, eb_let[rip]
	mov	rax, QWORD PTR -24[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_let
	mov	QWORD PTR -32[rbp], rax
	mov	rax, QWORD PTR -32[rbp]
	add	rsp, 80
	pop	rbp
	ret
	.seh_endproc
	.section .rdata,"dr"
.LC65:
	.ascii "#include <include/ebrew.h>\0"
	.text
	.globl	eb_main_lang2f1f2f
	.def	eb_main_lang2f1f2f;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_main_lang2f1f2f
eb_main_lang2f1f2f:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 96
	.seh_stackalloc	96
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	QWORD PTR 24[rbp], rdx
	mov	QWORD PTR 32[rbp], r8
	mov	QWORD PTR 40[rbp], r9
	lea	rax, .LC65[rip]
	mov	rdx, rax
	lea	rax, eb_main_lang2f1f2f00.6[rip]
	mov	rcx, rax
	call	ebz_stol
	mov	rax, QWORD PTR eb_main_lang2f1f2f00.6[rip]
	lea	rcx, eb_put_str[rip]
	mov	rdx, rax
	call	eb_put_str
	mov	QWORD PTR -8[rbp], rax
	lea	rax, eb_put_line[rip]
	mov	rcx, rax
	call	eb_put_line
	mov	QWORD PTR -16[rbp], rax
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -24[rbp], rax
	lea	rax, eb_main_lang2f1f2f111f[rip]
	mov	QWORD PTR -56[rbp], rax
	lea	rdx, -56[rbp]
	lea	rcx, eb_for[rip]
	mov	rax, QWORD PTR -24[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_for
	mov	QWORD PTR -32[rbp], rax
	lea	rcx, eb_do[rip]
	mov	rdx, QWORD PTR -32[rbp]
	mov	rax, QWORD PTR -16[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_do
	mov	QWORD PTR -40[rbp], rax
	lea	rcx, eb_do[rip]
	mov	rdx, QWORD PTR -40[rbp]
	mov	rax, QWORD PTR -8[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_do
	mov	QWORD PTR -48[rbp], rax
	mov	rax, QWORD PTR -48[rbp]
	add	rsp, 96
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_main_lang2f1f3f
	.def	eb_main_lang2f1f3f;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_main_lang2f1f3f
eb_main_lang2f1f3f:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 48
	.seh_stackalloc	48
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	QWORD PTR 24[rbp], rdx
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -8[rbp], rax
	lea	rcx, eb_put_error[rip]
	mov	rax, QWORD PTR -8[rbp]
	mov	rdx, rax
	call	eb_put_error
	mov	QWORD PTR -16[rbp], rax
	mov	rax, QWORD PTR -16[rbp]
	add	rsp, 48
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_main_lang2f1f
	.def	eb_main_lang2f1f;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_main_lang2f1f
eb_main_lang2f1f:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 96
	.seh_stackalloc	96
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -8[rbp], rax
	lea	rcx, eb_str_to_state[rip]
	mov	rax, QWORD PTR -8[rbp]
	mov	rdx, rax
	call	eb_str_to_state
	mov	QWORD PTR -16[rbp], rax
	lea	rax, eb_binding_table[rip]
	mov	rcx, rax
	call	eb_binding_table
	mov	QWORD PTR -24[rbp], rax
	lea	rax, eb_main_lang2f1f2f[rip]
	mov	QWORD PTR -40[rbp], rax
	lea	rax, eb_main_lang2f1f3f[rip]
	mov	QWORD PTR -48[rbp], rax
	lea	rdx, -48[rbp]
	lea	r9, -40[rbp]
	lea	rcx, eb_parse_toplevel[rip]
	mov	r8, QWORD PTR -24[rbp]
	mov	rax, QWORD PTR -16[rbp]
	mov	QWORD PTR 32[rsp], rdx
	mov	rdx, rax
	call	eb_parse_toplevel
	mov	QWORD PTR -32[rbp], rax
	mov	rax, QWORD PTR -32[rbp]
	add	rsp, 96
	pop	rbp
	ret
	.seh_endproc
	.section .rdata,"dr"
.LC66:
	.ascii "unknown target: \0"
	.text
	.globl	eb_main_lang2f2f
	.def	eb_main_lang2f2f;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_main_lang2f2f
eb_main_lang2f2f:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 80
	.seh_stackalloc	80
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	lea	rax, .LC66[rip]
	mov	rdx, rax
	lea	rax, eb_main_lang2f2f00.5[rip]
	mov	rcx, rax
	call	ebz_stol
	mov	rax, QWORD PTR eb_main_lang2f2f00.5[rip]
	lea	rcx, eb_put_str[rip]
	mov	rdx, rax
	call	eb_put_str
	mov	QWORD PTR -8[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -16[rbp], rax
	lea	rcx, eb_put_str[rip]
	mov	rax, QWORD PTR -16[rbp]
	mov	rdx, rax
	call	eb_put_str
	mov	QWORD PTR -24[rbp], rax
	lea	rax, eb_put_line[rip]
	mov	rcx, rax
	call	eb_put_line
	mov	QWORD PTR -32[rbp], rax
	lea	rcx, eb_do[rip]
	mov	rdx, QWORD PTR -32[rbp]
	mov	rax, QWORD PTR -24[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_do
	mov	QWORD PTR -40[rbp], rax
	lea	rcx, eb_do[rip]
	mov	rdx, QWORD PTR -40[rbp]
	mov	rax, QWORD PTR -8[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_do
	mov	QWORD PTR -48[rbp], rax
	mov	rax, QWORD PTR -48[rbp]
	add	rsp, 80
	pop	rbp
	ret
	.seh_endproc
	.section .rdata,"dr"
.LC67:
	.ascii "c\0"
	.text
	.globl	eb_main_lang2f
	.def	eb_main_lang2f;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_main_lang2f
eb_main_lang2f:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 96
	.seh_stackalloc	96
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 16
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -8[rbp], rax
	lea	rax, .LC67[rip]
	mov	rdx, rax
	lea	rax, eb_main_lang2f01.4[rip]
	mov	rcx, rax
	call	ebz_stol
	mov	rdx, QWORD PTR eb_main_lang2f01.4[rip]
	lea	rcx, eb_str_eq[rip]
	mov	rax, QWORD PTR -8[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_str_eq
	mov	QWORD PTR -16[rbp], rax
	lea	rax, eb_main_lang2f1f[rip]
	mov	QWORD PTR -48[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -40[rbp], rax
	lea	rax, eb_main_lang2f2f[rip]
	mov	QWORD PTR -64[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 16
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -56[rbp], rax
	lea	r8, -64[rbp]
	lea	rdx, -48[rbp]
	lea	rcx, eb_if[rip]
	mov	rax, QWORD PTR -16[rbp]
	mov	r9, r8
	mov	r8, rdx
	mov	rdx, rax
	call	eb_if
	mov	QWORD PTR -24[rbp], rax
	mov	rax, QWORD PTR -24[rbp]
	add	rsp, 96
	pop	rbp
	ret
	.seh_endproc
	.section .rdata,"dr"
.LC68:
	.ascii "ir\0"
	.text
	.globl	eb_main_lang
	.def	eb_main_lang;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_main_lang
eb_main_lang:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 112
	.seh_stackalloc	112
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	QWORD PTR 24[rbp], rdx
	mov	QWORD PTR 32[rbp], r8
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -8[rbp], rax
	lea	rax, .LC68[rip]
	mov	rdx, rax
	lea	rax, eb_main_lang01.3[rip]
	mov	rcx, rax
	call	ebz_stol
	mov	rdx, QWORD PTR eb_main_lang01.3[rip]
	lea	rcx, eb_str_eq[rip]
	mov	rax, QWORD PTR -8[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_str_eq
	mov	QWORD PTR -16[rbp], rax
	lea	rax, eb_main_lang1f[rip]
	mov	QWORD PTR -48[rbp], rax
	mov	rax, QWORD PTR 32[rbp]
	mov	QWORD PTR -40[rbp], rax
	lea	rax, eb_main_lang2f[rip]
	mov	QWORD PTR -80[rbp], rax
	mov	rax, QWORD PTR 32[rbp]
	mov	QWORD PTR -72[rbp], rax
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -64[rbp], rax
	lea	r8, -80[rbp]
	lea	rdx, -48[rbp]
	lea	rcx, eb_if[rip]
	mov	rax, QWORD PTR -16[rbp]
	mov	r9, r8
	mov	r8, rdx
	mov	rdx, rax
	call	eb_if
	mov	QWORD PTR -24[rbp], rax
	mov	rax, QWORD PTR -24[rbp]
	add	rsp, 112
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_comp_final
	.def	eb_comp_final;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_comp_final
eb_comp_final:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 64
	.seh_stackalloc	64
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	QWORD PTR 24[rbp], rdx
	mov	QWORD PTR 32[rbp], r8
	mov	rax, QWORD PTR 32[rbp]
	mov	QWORD PTR -8[rbp], rax
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -16[rbp], rax
	lea	rcx, eb_read_file[rip]
	mov	rax, QWORD PTR -16[rbp]
	mov	rdx, rax
	call	eb_read_file
	mov	QWORD PTR -24[rbp], rax
	lea	rcx, eb_main_lang[rip]
	mov	rdx, QWORD PTR -24[rbp]
	mov	rax, QWORD PTR -8[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_main_lang
	mov	QWORD PTR -32[rbp], rax
	mov	rax, QWORD PTR -32[rbp]
	add	rsp, 64
	pop	rbp
	ret
	.seh_endproc
	.section .rdata,"dr"
.LC69:
	.ascii "--target\0"
	.text
	.globl	eb_comp01f
	.def	eb_comp01f;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_comp01f
eb_comp01f:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 64
	.seh_stackalloc	64
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	lea	rax, .LC69[rip]
	mov	rdx, rax
	lea	rax, eb_comp01f0.1[rip]
	mov	rcx, rax
	call	ebz_stol
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -8[rbp], rax
	lea	rcx, eb_car[rip]
	mov	rax, QWORD PTR -8[rbp]
	mov	rdx, rax
	call	eb_car
	mov	QWORD PTR -16[rbp], rax
	mov	rax, QWORD PTR eb_comp01f0.1[rip]
	lea	rcx, eb_str_eq[rip]
	mov	rdx, QWORD PTR -16[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_str_eq
	mov	QWORD PTR -24[rbp], rax
	mov	rax, QWORD PTR -24[rbp]
	add	rsp, 64
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_comp1f
	.def	eb_comp1f;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_comp1f
eb_comp1f:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 96
	.seh_stackalloc	96
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 16
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -8[rbp], rax
	lea	rcx, eb_cdr[rip]
	mov	rax, QWORD PTR -8[rbp]
	mov	rdx, rax
	call	eb_cdr
	mov	QWORD PTR -16[rbp], rax
	lea	rcx, eb_cdr[rip]
	mov	rax, QWORD PTR -16[rbp]
	mov	rdx, rax
	call	eb_cdr
	mov	QWORD PTR -24[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -32[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 16
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -40[rbp], rax
	lea	rcx, eb_cdr[rip]
	mov	rax, QWORD PTR -40[rbp]
	mov	rdx, rax
	call	eb_cdr
	mov	QWORD PTR -48[rbp], rax
	lea	rcx, eb_car[rip]
	mov	rax, QWORD PTR -48[rbp]
	mov	rdx, rax
	call	eb_car
	mov	QWORD PTR -56[rbp], rax
	lea	rcx, eb_comp[rip]
	mov	r8, QWORD PTR -56[rbp]
	mov	rdx, QWORD PTR -32[rbp]
	mov	rax, QWORD PTR -24[rbp]
	mov	r9, r8
	mov	r8, rdx
	mov	rdx, rax
	call	eb_comp
	mov	QWORD PTR -64[rbp], rax
	mov	rax, QWORD PTR -64[rbp]
	add	rsp, 96
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_comp2f
	.def	eb_comp2f;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_comp2f
eb_comp2f:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 64
	.seh_stackalloc	64
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 16
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -8[rbp], rax
	lea	rcx, eb_car[rip]
	mov	rax, QWORD PTR -8[rbp]
	mov	rdx, rax
	call	eb_car
	mov	QWORD PTR -16[rbp], rax
	mov	rax, QWORD PTR 16[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -24[rbp], rax
	lea	rcx, eb_comp_final[rip]
	mov	rdx, QWORD PTR -24[rbp]
	mov	rax, QWORD PTR -16[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_comp_final
	mov	QWORD PTR -32[rbp], rax
	mov	rax, QWORD PTR -32[rbp]
	add	rsp, 64
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_comp
	.def	eb_comp;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_comp
eb_comp:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 144
	.seh_stackalloc	144
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	QWORD PTR 24[rbp], rdx
	mov	QWORD PTR 32[rbp], r8
	mov	QWORD PTR 40[rbp], r9
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -8[rbp], rax
	lea	rax, eb_comp01f[rip]
	mov	QWORD PTR -48[rbp], rax
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -40[rbp], rax
	lea	rdx, -48[rbp]
	lea	rcx, eb_and[rip]
	mov	rax, QWORD PTR -8[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	eb_and
	mov	QWORD PTR -16[rbp], rax
	lea	rax, eb_comp1f[rip]
	mov	QWORD PTR -80[rbp], rax
	mov	rax, QWORD PTR 32[rbp]
	mov	QWORD PTR -72[rbp], rax
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -64[rbp], rax
	lea	rax, eb_comp2f[rip]
	mov	QWORD PTR -112[rbp], rax
	mov	rax, QWORD PTR 40[rbp]
	mov	QWORD PTR -104[rbp], rax
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -96[rbp], rax
	lea	r8, -112[rbp]
	lea	rdx, -80[rbp]
	lea	rcx, eb_if[rip]
	mov	rax, QWORD PTR -16[rbp]
	mov	r9, r8
	mov	r8, rdx
	mov	rdx, rax
	call	eb_if
	mov	QWORD PTR -24[rbp], rax
	mov	rax, QWORD PTR -24[rbp]
	add	rsp, 144
	pop	rbp
	ret
	.seh_endproc
	.globl	eb_main
	.def	eb_main;	.scl	2;	.type	32;	.endef
	.seh_proc	eb_main
eb_main:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 64
	.seh_stackalloc	64
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	QWORD PTR 24[rbp], rdx
	mov	rax, QWORD PTR 24[rbp]
	mov	QWORD PTR -8[rbp], rax
	mov	QWORD PTR -16[rbp], 0
	lea	rax, .LC67[rip]
	mov	rdx, rax
	lea	rax, eb_main2.0[rip]
	mov	rcx, rax
	call	ebz_stol
	mov	r8, QWORD PTR eb_main2.0[rip]
	lea	rcx, eb_comp[rip]
	mov	rdx, QWORD PTR -16[rbp]
	mov	rax, QWORD PTR -8[rbp]
	mov	r9, r8
	mov	r8, rdx
	mov	rdx, rax
	call	eb_comp
	mov	QWORD PTR -24[rbp], rax
	mov	rax, QWORD PTR -24[rbp]
	add	rsp, 64
	pop	rbp
	ret
	.seh_endproc
.lcomm eb_num_to_str2f.87,8,8
.lcomm eb_put_error_body1f1f0.86,8,8
.lcomm eb_put_error_body1f2f1f0.85,8,8
.lcomm eb_put_error_body1f2f2f1f0.84,8,8
.lcomm eb_put_error_body2f2f1f100.83,8,8
.lcomm eb_put_error_body2f2f2f1f00.82,8,8
.lcomm eb_put_error_body2f2f2f1f110.81,8,8
.lcomm eb_put_error_body2f2f2f2f1f00.80,8,8
.lcomm eb_put_error_body2f2f2f2f1f110.79,8,8
.lcomm eb_put_error_body2f2f2f2f2f1f1f00.78,8,8
.lcomm eb_put_error_body2f2f2f2f2f1f1f1100.77,8,8
.lcomm eb_put_error_body2f2f2f2f2f1f1f111100.76,8,8
.lcomm eb_parse_any2f0100.75,8,8
.lcomm eb_parse_if1f2f0100.74,8,8
.lcomm eb_parse_value3f01102f0.73,8,8
.lcomm eb_binding_to_ast2f2f2f0.72,8,8
.lcomm eb_parse_word1f3f01.71,8,8
.lcomm eb_parse_word2f1f3f01.70,8,8
.lcomm eb_parse_expr_match1f1f01.69,8,8
.lcomm eb_parse_expr_match1f2f2f2f2f01.68,8,8
.lcomm eb_parse_call1f1f2f2f2f01.67,8,8
.lcomm eb_parse_toplevel_single1f1f2f01.66,8,8
.lcomm eb_ir_form_type_to_str1f.65,8,8
.lcomm eb_ir_form_type_to_str2f1f.64,8,8
.lcomm eb_ir_form_type_to_str2f2f1f.63,8,8
.lcomm eb_ir_form_type_to_str2f2f2f1f.62,8,8
.lcomm eb_ir_form_type_to_str2f2f2f2f1f.61,8,8
.lcomm eb_ir_form_type_to_str2f2f2f2f2f1f.60,8,8
.lcomm eb_ir_form_type_to_str2f2f2f2f2f2f1f.59,8,8
.lcomm eb_ir_form_type_to_str2f2f2f2f2f2f2f1f.58,8,8
.lcomm eb_ir_form_type_to_str2f2f2f2f2f2f2f2f1f.57,8,8
.lcomm eb_ir_form_type_to_str2f2f2f2f2f2f2f2f2f1f.56,8,8
.lcomm eb_ir_form_type_to_str2f2f2f2f2f2f2f2f2f2f1f.55,8,8
.lcomm eb_ir_form_type_to_str2f2f2f2f2f2f2f2f2f2f2f.54,8,8
.lcomm eb_ir_print_depth1f1f1f00.53,8,8
.lcomm eb_ir_print_depth1f1f1f11100.52,8,8
.lcomm eb_ir_print_depth2f2f2f2f0.51,8,8
.lcomm eb_compile_ir_pre2f1f1f1f1f1f10110100.50,8,8
.lcomm eb_compile_ir1f1f1101f100.49,8,8
.lcomm eb_compile_ir2f2f1f1f1f1f0110100.48,8,8
.lcomm eb_compile_ir2f2f2f2f2f1f1f1f1f1f1f1111f1f1f100.47,8,8
.lcomm eb_compile_ir2f2f2f2f2f2f2f0.46,8,8
.lcomm eb_put_ir_c1f1f1f1f00.45,8,8
.lcomm eb_put_ir_c1f1f1f1f1100.44,8,8
.lcomm eb_put_ir_c1f1f1f1f111100.43,8,8
.lcomm eb_put_ir_c1f1f1f2f1f00.42,8,8
.lcomm eb_put_ir_c1f1f1f2f1f11100.41,8,8
.lcomm eb_put_ir_c1f1f1f2f2f1f102f01f0.40,8,8
.lcomm eb_put_ir_c1f1f1f2f2f1f102f100.39,8,8
.lcomm eb_put_ir_c1f1f1f2f2f1f1111102f01f0.38,8,8
.lcomm eb_put_ir_c1f1f1f2f2f1f1111102f100.37,8,8
.lcomm eb_put_ir_c1f1f1f2f2f1f1111102f11100.36,8,8
.lcomm eb_put_ir_c1f1f1f2f2f1f00.35,8,8
.lcomm eb_put_ir_c1f1f1f2f2f1f1100.34,8,8
.lcomm eb_put_ir_c1f1f1f2f2f1f111100.33,8,8
.lcomm eb_put_ir_c1f1f1f2f2f1f11111100.32,8,8
.lcomm eb_put_ir_c1f1f1f2f2f2f1f00.31,8,8
.lcomm eb_put_ir_c1f1f1f2f2f2f2f1f102f01f0.30,8,8
.lcomm eb_put_ir_c1f1f1f2f2f2f2f1f102f100.29,8,8
.lcomm eb_put_ir_c1f1f1f2f2f2f2f1f00.28,8,8
.lcomm eb_put_ir_c1f1f1f2f2f2f2f1f1100.27,8,8
.lcomm eb_put_ir_c1f1f1f2f2f2f2f2f1f11111101f00.26,8,8
.lcomm eb_put_ir_c1f1f1f2f2f2f2f2f1f11111101f1100.25,8,8
.lcomm eb_put_ir_c1f1f1f2f2f2f2f2f1f00.24,8,8
.lcomm eb_put_ir_c1f1f1f2f2f2f2f2f1f1100.23,8,8
.lcomm eb_put_ir_c1f1f1f2f2f2f2f2f1f111100.22,8,8
.lcomm eb_put_ir_c1f1f1f2f2f2f2f2f1f111111100.21,8,8
.lcomm eb_put_ir_c1f1f1f2f2f2f2f2f2f2f1f00.20,8,8
.lcomm eb_put_ir_c1f1f1f2f2f2f2f2f2f2f1f1100.19,8,8
.lcomm eb_put_ir_c1f1f1f2f2f2f2f2f2f2f2f1f00.18,8,8
.lcomm eb_put_ir_c1f1f1f2f2f2f2f2f2f2f2f1f1100.17,8,8
.lcomm eb_put_ir_c1f1f1f2f2f2f2f2f2f2f2f1f111100.16,8,8
.lcomm eb_put_ir_c1f1f1f2f2f2f2f2f2f2f2f2f1f00.15,8,8
.lcomm eb_put_ir_c1f1f1f2f2f2f2f2f2f2f2f2f1f1100.14,8,8
.lcomm eb_put_ir_c1f1f1f2f2f2f2f2f2f2f2f2f1f111100.13,8,8
.lcomm eb_put_ir_c1f1f1f2f2f2f2f2f2f2f2f2f1f11111100.12,8,8
.lcomm eb_put_ir_c1f1f1f2f2f2f2f2f2f2f2f2f1f1111111100.11,8,8
.lcomm eb_put_ir_c2f1f11f1f0.10,8,8
.lcomm eb_put_ir_c2f1f00.9,8,8
.lcomm eb_put_ir_c_decl1f1f00.8,8,8
.lcomm eb_put_ir_c_decl1f1f11100.7,8,8
.lcomm eb_main_lang2f1f2f00.6,8,8
.lcomm eb_main_lang2f2f00.5,8,8
.lcomm eb_main_lang2f01.4,8,8
.lcomm eb_main_lang01.3,8,8
.lcomm i.2,1048576,32
.lcomm eb_comp01f0.1,8,8
.lcomm eb_main2.0,8,8
	.section .rdata,"dr"
	.align 8
.LC0:
	.long	-137438953
	.long	1073341267
	.def	__main;	.scl	2;	.type	32;	.endef
	.ident	"GCC: (GNU) 14.2.0"
	.def	putchar;	.scl	2;	.type	32;	.endef
	.def	fopen;	.scl	2;	.type	32;	.endef
	.def	fgetc;	.scl	2;	.type	32;	.endef
	.def	feof;	.scl	2;	.type	32;	.endef
	.def	fclose;	.scl	2;	.type	32;	.endef
