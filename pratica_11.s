.section .data
    abert: .asciz "\nPrograma para calculo de media de turma\n"
	pedeN: .asciz "\n\nDigite o numero de alunos:"
	perg: .asciz "\nDigite a media do aluno %d: "
	mostra: .asciz "\nA media da turma: %d\n"
	maiorNota: .asciz "\nA maior nota eh %d\n"
	menorNota: .asciz "\nA menor nota eh %d\n"
	tipoInt: .asciz "%d"

	nroAl: .int 0
	mediaA: .int 0
	mediaT: .int 0
	menorN: .int 11
	maiorN: .int -1


.section .text

.globl _start

_start:
	pushl $abert
	call printf

	pushl $pedeN
	call printf

	push $nroAl
	push $tipoInt
	call scanf

	movl nroAl, %ecx
	movl $1, %ebx

volta:
	
	pushl %ecx

	pushl %ebx
	pushl $perg
	call printf
	push $mediaA
	push $tipoInt
	call scanf

	movl mediaT, %eax
	movl mediaA, %edx

	cmpl menorN, %edx
	jl menor
	cmpl maiorN, %edx
	jg maior

	jmp volta2

menor:
	movl %edx, menorN
	jmp volta2 

maior: 
	movl %edx, maiorN

volta2:
	addl mediaA, %eax
	movl %eax, mediaT

	addl $12, %esp
	popl %ebx
	popl %ecx

	incl %ebx

	loop volta

	movl $0, %edx
	movl mediaT, %eax
	divl nroAl
	movl %eax, mediaT

	pushl %eax
	pushl $mostra
	call printf

	movl menorN, %eax
	pushl %eax
	pushl $menorNota
	call printf

	movl maiorN, %eax
	pushl %eax
	pushl $maiorNota
	call printf

_fim: 

	movl $1, %eax
	movl $0, %ebx
	int $0x80