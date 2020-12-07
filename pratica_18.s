

.section .data
	pedidoa: .asciz "\nEntrada de Dados:\n\nDigite o coef a: "
	pedidob: .asciz "\nDigite o coef b: "
	pedidoc: .asciz "\nDigite o coef c: "
	
	mostradelta: .asciz "\nValor de delta = %.2lf\n"
	mostrares: .asciz "\nValor de x1 = %.2lf\n e x2 = %.2lf\n"
	pulalin: .asciz "\n"
	
	formato: .asciz "%lf" # para dupla precis�o

	floata: .space 8 # aqui tbem pode ser .double 0
	floatb: .space 8 # aqui tbem pode ser .double 0
	floatc: .space 8 # aqui tbem pode ser .double 0
	float4: .double -4
	floatdelta1: .space 8 # aqui tbem pode ser .double 0
	floatdelta2: .space 8 # aqui tbem pode ser .double 0
	floatdelta: .space 8 # aqui tbem pode ser .double 0

.section .text
.globl _start
_start:

	pushl $pedidoa
	call printf
	pushl $floata
	pushl $formato
	call scanf 		# le um valor em simples precisao (4 bytes)
	addl $12, %esp 		# limpa a Pilha do Sistema de 3 pushls
	
	pushl $pedidob
	call printf
	pushl $floatb
	pushl $formato
	call scanf 		# le um valor em simples precisao (4 bytes)
	addl $12, %esp 		# limpa a Pilha do Sistema de 3 pushls
	

	pushl $pedidoc
	call printf
	pushl $floatc
	pushl $formato
	call scanf 		# le um valor em simples precisao (4 bytes)
	addl $12, %esp 		# limpa a Pilha do Sistema de 3 pushls
	

	fldl floatb		
	fldl floatb		

	
	
	fmul	%st(1), %st(0) # st(0) = bxb
	fstl	floatdelta1

		
	fldl floata	
	fldl floatc
	fldl float4		

	fmul	%st(1), %st(0) # st(0) = st(0) x c
	fmul	%st(2), %st(0) 

	fstl	floatdelta2
	finit

	fldl floatdelta1
	fldl floatdelta2

	fadd 	%st(1), %st(0) 	# faz %st(0) = st(1) - st(0)

	subl	$8, %esp
	fstpl	(%esp)

	pushl	$mostradelta
	call	printf
	



	pushl $0
	call exit

