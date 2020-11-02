# xchgl
.section .data
    abert: .asciz "\nPrograma para ordenar 3 números\n"
	pedeN: .asciz "\n\nDigite N%d:"
	mostra: .asciz "\nSequência ordenanda crescentemente: %d %d %d\n"
	perg: .asciz "\nDeseja nova execução <s>im ou <n>ao>? "

	tipoN: .asciz "%d"
	tipoC: .asciz " %c"

	n1: .int 0
	n2: .int 0
	n3: .int 0

	resp: .byte 'n'


.section .text

.globl _start
_start: 

	pushl $abert
	call printf

	pushl $1
	pushl $pedeN
	call printf
	pushl $n1
	pushl $tipoN
	call scanf

	pushl $2
	pushl $pedeN
	call printf
	pushl $n2
	pushl $tipoN
	call scanf

	pushl $3
	pushl $pedeN
	call printf
	pushl $n3
	pushl $tipoN
	call scanf

	movl n2, %eax
	cmpl n1, %eax
	jg   n1_n2



	
n2_n1:
	movl n3, %eax
	cmpl n1, %eax
	jg   n2_n1_n3

	movl n3, %eax
	cmpl n2, %eax
	jg   n2_n3_n1

n3_n2_n1:
	pushl n1
	pushl n2
	pushl n3
	pushl $mostra
	call printf
	jmp fim

n2_n3_n1:
	pushl n1
	pushl n3
	pushl n1
	pushl $mostra
	call printf
	jmp fim

n2_n1_n3:
	pushl n3
	pushl n1
	pushl n2
	pushl $mostra
	call printf
	jmp fim

n1_n2:
	movl n3, %eax
	cmpl n2, %eax
	jg   n1_n2_n3

	movl n3, %eax
	cmpl n1, %eax
	jg   n1_n3_n2

n3_n1_n2:
	pushl n2
	pushl n1
	pushl n3
	pushl $mostra
	call printf
	jmp fim

n1_n3_n2:
	pushl n2
	pushl n3
	pushl n1
	pushl $mostra
	call printf
	jmp fim

n1_n2_n3:
	pushl n3
	pushl n2
	pushl n1
	pushl $mostra
	call printf
	jmp fim

fim:

	pushl $perg
	call printf
	pushl $resp 
	pushl $tipoC
	call scanf
	

	addl $28, %esp

	movb resp,%al
	cmpb $'s',%al
	je _start


    pushl $0
    call exit
