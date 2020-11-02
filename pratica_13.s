# Programa para Calculo de Areas de Figuras Geometricas

.section .data

    abertP:	.asciz	"\nPrograma para Calculo Area de Figuras Geometricas\n\n"
    menuOp:	.asciz	"\nMenu de Opcoes:\n<1> Retangulo \n<2> Triangulo\n<0>Sair \n>  "
    abertR:	.asciz	"\nCalculo da Area de Retangulo\n"
    abertT:	.asciz	"\nCalculo da Area de Triangulo\n"

    pergR:	.asciz	"\nDigite o lado %d = "
    pergT1:	.asciz	"\nDigite a base = "
    pergT2:	.asciz	"\nDigite a altura = "

    resp:	.asciz	"\nArea = %d\n\n"

    tipo:	.asciz	"%d"

    opcao:	.int	0
    lado1:	.int	0
    lado2:	.int	0
    base:	.int	0
    altura:	.int	0
    
    areaR:	.int	0
    areaT:	.int	0
    

    



.section .text

.globl _start

_start:

    pushl	$abertP
    call	printf
    pushl	$menuOp
    call	printf
    pushl	$opcao
    pushl	$tipo
    call	scanf

    movl	opcao, %eax
    cmpl	$1, %eax
    je	_calc_ret

    cmpl	$2, %eax
    je	_calc_tri

    jmp	fim


_calc_ret:

    call	calc_ret
    jmp	_start

_calc_tri:
	call	calc_tri
    jmp	_start

calc_tri:

    pushl	$abertT
    call	printf

    pushl	$pergT1
    call	printf
    pushl	$base
    pushl	$tipo
    call	scanf

    pushl	$pergT2
    call	printf
    pushl	$altura
    pushl	$tipo
    call	scanf

    movl	base,%eax
    mull	altura
	movl    $0, %edx
	movl    $2, %ebx
	divl    %ebx

    movl	%eax, areaT

    pushl	%eax
    pushl	$resp
    call	printf

    addl	$36, %esp

    ret



calc_ret:

    pushl	$abertR
    call	printf

    pushl	$1
    pushl	$pergR
    call	printf
    pushl	$lado1
    pushl	$tipo
    call	scanf

    pushl	$2
    pushl	$pergR
    call	printf
    pushl	$lado2
    pushl	$tipo
    call	scanf

    movl	lado2,%eax
    mull	lado1

    movl	%eax, areaR

    pushl	%eax
    pushl	$resp
    call	printf

    addl	$44, %esp

    ret


fim:

    pushl	$0
    call	exit