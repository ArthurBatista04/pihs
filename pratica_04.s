.section .data

    abertura: .asciz "\nProgram\n"
    saida: .asciz "Soma: %d + %d - %d + %d - %d  = %d\n"
    entrada1: .asciz "\nEntre com o valor de n1 = "
    entrada2: .asciz "\nEntre com o valor de n2 = "
    entrada3: .asciz "\nEntre com o valor de n3 = "
	entrada4: .asciz "\nEntre com o valor de n4 = "
	entrada5: .asciz "\nEntre com o valor de n5 = "
    formato: .asciz "%d" #usado pelo scanf para saber
                 #o tipo de dado a ser lido

    n1: .int 0
    n2: .int 0
    n3: .int 0
	n4: .int 0
	n5: .int 0
    res: .int 0

.section .text

.globl _start

_start:
    pushl $abertura
    call printf

    pushl $entrada1
    call printf
    pushl $n1
    pushl $formato
    call scanf

    pushl $entrada2
    call printf
    pushl $n2
    pushl $formato
    call scanf

    pushl $entrada3
    call printf
    pushl $n3
    pushl $formato
    call scanf

	pushl $entrada4
    call printf
    pushl $n4
    pushl $formato
    call scanf

	pushl $entrada5
    call printf
    pushl $n5
    pushl $formato
    call scanf

	movl n1, %eax
    addl n2, %eax
    subl n3, %eax
    addl n4, %eax
	subl n5, %eax
    movl %eax, res

    pushl res
	pushl n5
	pushl n4
    pushl n3
    pushl n2
    pushl n1
    pushl $saida
    call printf

    addl $92, %esp

    pushl $0
    call exit
