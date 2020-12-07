.section .data
	titulo: .asciz "\n*** Programa Inverte Vetor 1.0 ***\n\n"
	pedeTam: .asciz "Digite o tamanho do vetor => "
	pedeNum: .asciz "Entre com o elemento %d => "
	
	tipoNum: .asciz	"%d"
	numneg: .asciz "\nNumero eh negativo, digite novamente\n"
	numLido: .asciz "\nDigite o numero a ser procurado: "
	pos: .asciz "O indice do numero do numero eh: %d\n"
	naoen: .asciz "O numero nao foi encontrado\n "
	perg: .asciz	"\n\nDeseja reexecutar o programa (1 para sim e 0 p/ nao):"
	maiormenor: .asciz	"O maior numero eh %d e o menor numero eh %d \n"

	mostraVet: 	.asciz "Vetor Original:"
	mostraElem: 	.asciz " %d"
	mostraVetInv: 	.asciz "Vetor Invertido:"
	pulaLin: 	.asciz "\n"


	tam: 	.int 0
	opcao: 	.int 0
	num: 	.int 0
	soma: 	.int 0
	maior: 	.int -99999
	menor: 	.int 99999
	valor4: .int 4

	vetor: 	.int 0

.section .text

.globl _start

_start:

	pushl	$titulo
	call	printf

	call	leTam
	call	leVetor
	movl	$mostraVet, %eax
	call	mostraVetor
	movl	$mostraVetInv, %eax
	call	mostraVetorInv
	
	call 	procura

	call 	promaiormenor

	pushl	$perg
	call	printf
	# obtem a resposta da opcao
	addl	$4, %esp
	pushl 	$opcao 
	pushl 	$tipoNum
	call 	scanf
	addl	$8, %esp
	movl 	opcao, %eax
	cmpl 	$1, %eax
	je _start

	

fim:
	pushl 	$0
	call 	exit

leTam:
	pushl	$pedeTam
	call	printf
	pushl	$tam
	pushl	$tipoNum
	call	scanf
	addl	$12,%esp

	movl	tam, %eax
	cmpl	$0, %eax
	jle		leTam
	

	movl	$0, %edx
	movl	$0, %ecx
	movl 	$4, %eax
	mull	tam # aloca 4 * tam de eleementos

	pushl   %eax
	call    malloc
	addl	$4,%esp

	movl    %eax, vetor

	ret

leVetor:

	movl	tam, %ecx
	movl	$vetor, %edi
	movl	$1, %ebx

leNum:

	pushl	%ebx
	pushl	%ecx
	pushl	%edi

	pushl	%ebx
	pushl	$pedeNum
	call	printf
	pushl	%edi
	pushl	$tipoNum	
	call	scanf
	
	addl	$16, %esp

	cmpl	$0, (%edi) # ve se o numero eh negativo
	jl		numNeg

	popl	%edi
	popl	%ecx
	popl	%ebx


	incl	%ebx
	addl	$4, %edi
	loop	leNum

	ret

numNeg:
	pushl 	$numneg
	call	printf
	addl	$4, %esp

	popl	%edi
	popl	%ecx
	popl	%ebx
	jmp 	leNum

mostraVetor:

	pushl	%eax
	call	printf
	addl	$4, %esp
	movl	$vetor, %edi
	movl	tam, %ecx

volta:

	pushl	%ecx
	pushl	%edi

	movl	(%edi), %eax
	pushl	%eax
	pushl	$mostraElem
	call	printf
	addl	$8, %esp

	popl	%edi
	popl	%ecx

	addl	$4, %edi
	loop	volta

	pushl	$pulaLin
	call	printf
	addl	$4, %esp

	ret

mostraVetorInv:

	pushl	%eax
	call	printf
	addl	$4, %esp
	movl	$vetor, %edi
	movl	tam, %ecx
	movl	tam, %eax
	
	movl	$0, %edx
	decl	%eax	
	mull	valor4
	addl	%eax, %edi # comeca pelo final
	

	

volta2:
	pushl	%ecx
	pushl	%edi

	movl	(%edi), %eax
	pushl	%eax
	pushl	$mostraElem
	call	printf
	addl	$8, %esp

	popl	%edi
	popl	%ecx

	subl	$4, %edi
	loop	volta2

	pushl	$pulaLin
	call	printf
	addl	$4, %esp

	ret


procura:
	pushl	$numLido
	call	printf
	pushl	$num # contem o numero lido
	pushl	$tipoNum	
	call	scanf


	addl	$12, %esp
	movl	$vetor, %edi
	movl	tam, %ecx
	movl	num, %ebx

	
volta4:
	
	movl	(%edi), %eax
	cmpl	%ebx, %eax # compara o numero lido com o do vetor
	je		printpos
	addl	$4, %edi
	loop	volta4

	pushl	$naoen
	call	printf
	addl	$4, %esp

	ret

printpos:
	movl	%ecx, %eax
	movl	tam, %ebx
	subl	%eax, %ebx
	pushl	%ebx
	pushl	$pos
	call	printf
	addl 	$8, %esp
	ret



promaiormenor:
	movl	$vetor, %edi
	movl	tam, %ecx

	
volta5:
	
	movl	(%edi), %eax
	cmpl	maior, %eax # compara o numero do vetor com o maior atual
	jg		trocamaior
voltamaior:
	cmpl	menor, %eax # compara o numero do vetor com o maior atual
	jl		trocamenor

voltamenor:
	addl	$4, %edi
	loop	volta5

	pushl	menor
	pushl	maior
	pushl	$maiormenor
	call printf
	
	addl $12, %esp

	movl	$99999, %eax
	movl 	%eax, menor
	movl	$-99999, %eax
	movl 	%eax, maior

	ret

trocamaior:
	movl 	%eax, maior
	jmp 	voltamaior

trocamenor:
	movl 	%eax, menor
	jmp 	voltamenor
	
