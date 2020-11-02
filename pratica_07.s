.section .data
    saida:  .asciz "Valor do registrador: %d\n\n"
    res: .asciz "\n2^%d = %d\n"
    n:  .int 0

.section .text
.globl _start
_start:
       
    movl    $0x00010001, %ebx
    movl    %ebx, %ecx
    movl    %ebx, %edx

    sarl    $16, %ecx 

    sall    $16, %edx 
    rorl    $16, %edx 

    
    addl    %ecx, %edx 
    sall    $4, %edx 

    pushl %edx
    pushl $saida
    call printf

    addl    $8, %esp

    pushl   $0
    call    exit
