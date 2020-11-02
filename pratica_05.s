.section .data
	lado1: .int 0
	lado2: .int 0
	area: .int 0
	
	abert: .asciz "\n Programa para Calculo da Area de Triangulo\n"
	perg1: .asciz "\n Digite a base = "
	perg2: .asciz "\n Digite a altura = "
	res: .asciz "\nArea do Triangulo = %d\n"

	tipo: .asciz "%d"

.section .text

.globl _start

_start:

	pushl $abert
	call printf

	pushl $perg1
	call printf

	movl $lado1, %eax
	pushl %eax
	pushl $tipo
	call scanf

	pushl $perg2
	call printf

	movl $lado2, %eax
	pushl %eax
	pushl $tipo
	call scanf

	movl lado1, %eax
	mull lado2
	movl $2, %ebx
	divl %ebx
	

	movl %eax, area

	pushl %eax
	pushl $res
	call printf

	addl $36, %esp

	pushl $0
	call exit
