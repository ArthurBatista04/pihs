.section .data
    abert: .asciz "\nPrograma para classificar triangulos\n"
    perg: .asciz "\nDigite o tamanho do lado %d: "
	pergre: .asciz "\nDigite 1 para re-executar ou 0 para sair: "

    iso: .asciz "\nTriangulo isosceles\n"
    esc: .asciz "\nTriangulo escaleno\n"
    equi: .asciz "\nTriangulo equilatero\n"



    tipoInt: .asciz "%d"
    lado1: .int 0
    lado2: .int 0
    lado3: .int 0
	re:    .int 0


.section .text

.globl _start

_start:
    pushl $abert
    call printf

volta:
    movl $1, %ecx
    pushl %ecx
    pushl $perg
    call printf
    push $lado1
    push $tipoInt
    call scanf

    movl $2, %ecx
    pushl %ecx
    pushl $perg
    call printf
    push $lado2
    push $tipoInt
    call scanf

    movl $3, %ecx
    pushl %ecx
    pushl $perg
    call printf
    push $lado3
    push $tipoInt
    call scanf

    movl lado1, %eax
    movl lado2, %edx
    movl lado3, %ebx


    cmpl lado1, %edx
    je lado1_2

    cmpl lado2, %ebx
    je isoscoles

    cmpl lado3, %eax
    je isoscoles

    jmp escaleno



lado1_2:
    cmpl lado2, %ebx
    je equilatero
    jmp isoscoles

equilatero:
    pushl $equi
    call printf
    jmp reexecuta

isoscoles:
    pushl $iso
    call printf
    jmp reexecuta

escaleno:
    pushl $esc
    call printf
    jmp reexecuta

reexecuta:
	pushl $pergre
	call printf
	pushl $re 
	pushl $tipoInt
	call scanf

	movl re, %eax
	cmpl $1,%eax
	je volta



_fim:

    movl $1, %eax
    movl $0, %ebx
    int $0x80