.section .data

	titulo: .asciz "\n*** Programa Ordena Vetor 1.0 ***\n\n"

	pedetam: .asciz "Digite o tamanho do vetor (maximo=20) => "

	formato: .asciz "%d"

	pedenum: .asciz "Entre com o elemento %d => "

	mostra1: .asciz "Elementos Lidos:"

	mostra2: .asciz " %d"

	mostra3: .asciz "\nElementos Ordenados:"

	pulalin: .asciz "\n"

	maxtam: .int 20

	tam: .int 0

	num: .int 0

	soma: .int 0

	vetor: .space 80



.section .text

.globl _start

_start:



	pushl $titulo

	call printf

	addl $4, %esp

	call letam

	call lenum

	movl $mostra1, %eax
	call mostravet

	call ordenavetor

	movl $mostra3, %eax
	call mostravet

	jmp fim


letam:

	pushl $pedetam

	call printf

	pushl $tam

	pushl $formato

	call scanf

	pushl $pulalin

	call printf

	movl tam, %ecx

	cmpl $0, %ecx

	jle letam

	cmpl maxtam, %ecx

	jg letam

	movl $vetor,%edi

	addl $16, %esp

	movl $0, %ebx

	ret


lenum:

	incl %ebx

	pushl %edi

	pushl %ecx

	pushl %ebx

	pushl $pedenum

	call printf

	pushl $num

	pushl $formato

	call scanf

	pushl $pulalin

	call printf

	addl $16, %esp

	popl %ebx

	popl %ecx

	popl %edi

	movl num, %eax

	movl %eax, (%edi)

	addl $4, %edi

	loop lenum

	ret



mostravet:

	pushl %eax

	call printf
	
	addl $4, %esp

	movl tam, %ecx

	movl $vetor, %edi





mostranum:

	movl (%edi), %ebx

	addl $4, %edi

	pushl %edi

	pushl %ecx

	pushl %ebx

	pushl $mostra2

	call printf

	addl $8, %esp

	popl %ecx

	popl %edi

	loop mostranum

	movl tam, %ecx

	cmpl $1, %ecx

	ret 




ordenavetor:

	movl $vetor, %edi # inicia a posicao do primeiro

	movl %edi, %edx # inicia a posicao do menor

	movl %edi, %esi # inicia a posicao do proximo a ser comparado

	subl $1, %ecx

	pushl %ecx # backup do nro de elementos a comparar
	



giro:

	addl $4, %esi # avanca para o proximo

	movl (%edx), %eax # contem o menor valor ateh entao identificado

	movl (%esi), %ebx # contem o valor do proximo

	cmpl %eax, %ebx
	

	jl trocaposicao



volta:

	loop giro




trocaelem:

	movl (%edi), %ebx

	movl (%edx), %eax

	movl %eax, (%edi)

	movl %ebx, (%edx)

	addl $4, %edi # avanca o primeiro

	movl %edi, %edx # inicia a posicao do menor

	movl %edi, %esi # inicia a posicao do proximo a ser comparado

	popl %ecx

	subl $1, %ecx

	pushl %ecx # backup do nro de elementos a comparar

	cmpl $0, %ecx
	

	jle fim_ord # nao tem mais oque fazer

	jmp giro



trocaposicao:
	
	movl %esi, %edx # troca a posicao do menor

	jmp volta


fim_ord:
	addl $4, %esp
	ret


fim:

	pushl $0

	call exit


