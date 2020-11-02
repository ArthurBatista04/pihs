.section .data
    mostra1: .asciz "\nTeste %d: o contéudo do Registrador eh = %X\n"
    mostra2: .asciz "\nTeste %d:\nEAX = %X\nEBX = %X\nECX = %X\nEDB = %X\nESI = %X\nEDI = %X\n"
	mostra3: .asciz "\nTeste %d:\nREG1 = %X\nREG2 = %X\n"

	tipo: .asciz "%d"
.section .text

.globl _start

_start:
    # teste 1
    movl $0x12345678, %ebx

    pushl %ebx
    pushl $1
    pushl $mostra1
    call printf

    # teste 2

    movw $0xABCD, %bx

    pushl %ebx
    pushl $2
    pushl $mostra1
    call printf

    # teste 3

    movb $0xFF, %bh
    movb $0xEE, %bl

    pushl %ebx
    pushl $3
    pushl $mostra1
    call printf

    # teste 4

    pushw %bx
    pushw %bx

    pushl $4
    pushl $mostra1
    call printf

    # teste 5

    movl $0x12345678, %ebx

    roll $16, %ebx
    pushl %ebx
    pushl $5
    pushl $mostra1
    call printf

    # teste 6

    rolw $8, %bx
    pushl %ebx
    pushl $6
    pushl $mostra1
    call printf

    # teste 7

    rolb $4, %bl
    pushl %ebx
    pushl $7
    pushl $mostra1
    call printf

    # teste 8

    movl $0x12345678, %ebx

    rorl $16, %ebx
    pushl %ebx
    pushl $8
    pushl $mostra1
    call printf

    # teste 9

    rorw $8, %bx
    pushl %ebx
    pushl $9
    pushl $mostra1
    call printf

    # teste 10

    rorb $4, %bl
    pushl %ebx
    pushl $10
    pushl $mostra1
    call printf

    # teste 11

    movl $0x12345678, %ebx

    sall $16, %ebx
    pushl %ebx
    pushl $11
    pushl $mostra1
    call printf

    # teste 12

    movl $0x12345678, %ebx

    salw $8, %bx
    pushl %ebx
    pushl $12
    pushl $mostra1
    call printf

    # teste 13

    movl $0x12345678, %ebx

    salb $4, %bl
    pushl %ebx
    pushl $13
    pushl $mostra1
    call printf

    # teste 14

    movl $0x12345678, %ebx

    sarl $16, %ebx
    pushl %ebx
    pushl $14
    pushl $mostra1
    call printf

    # teste 15

    movl $0x12345678, %ebx

    sarw $8, %bx
    pushl %ebx
    pushl $15
    pushl $mostra1
    call printf

    # teste 16

    movl $0x12345678, %ebx

    sarb $4, %bl
    pushl %ebx
    pushl $16
    pushl $mostra1
    call printf

    # teste 17

    movl $0xAAAAAAAA, %eax
    movl $0xBBBBBBBB, %ebx
    movl $0xCCCCCCCC, %ecx
    movl $0xDDDDDDDD, %edx
    movl $0xEEEEEEEE, %esi
    movl $0xFFFFFFFF, %edi

	pushl %edi
	pushl %esi
	pushl %edx
	pushl %ecx
	pushl %ebx
	pushl %eax
	pushl $17
	pushl $mostra2
	call printf

	# teste 18
	
	addl $8, %esp

	popl %eax
	popl %ebx
	popl %ecx
	popl %edx
	popl %esi
	popl %edi


	pushl %edi
	pushl %esi
	pushl %edx
	pushl %ecx
	pushl %ebx
	pushl %eax
	pushl $18
	pushl $mostra2
	call printf

	# teste 19

	movl $0xAAAAAAAA, %ebx
	movl $0xBBBBBBBB, %esi

	push %esi
	push %ebx
	pushl $19
	pushl $mostra3
	call printf

	xchgl %ebx, %esi
	xchgw %bx , %si
	
	# teste 20
	
	push %esi
	push %ebx
	pushl $20
	pushl $mostra3
	call printf

    pushl $0
    call exit