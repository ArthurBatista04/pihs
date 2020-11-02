# exemplo de registro
#	nome: string de ateh 30 caracteres + caractere de final de string = 31 bytes
#   rua: string de ateh 30 caracteres + caractere de final de string = 31 bytes
#   numerorua: tipo inteiro de 4 bytes
#   bairro: string de ateh 20 caracteres + caractere de final de string = 21 bytes
#   cep: string de ateh 8 caracteres + caractere de final de string = 9 bytes
#   cidade: string de ateh 20 caracteres + caractere de final de string = 21 bytes
#   telefone: string de ateh 11 caracteres + caractere de final de string = 12 bytes
#   email: string de ateh 25 caracteres + caractere de final de string = 26 bytes
#	datanas: string de 10 caracteres + caractere de final de string = 11 bytes
#	rg: string de 10 caracteres + caractere de final de string = 11 bytes
#	CPF: 11 caracteres + 1 final de string = 12 bytes
#   datacon: string de 10 caracteres + caractere de final de string = 11 bytes
#   cargo: string 15 caracteres + final de string = 16 bytes
#   salario: tipo inteiro de 4 bytes
#	Genero: masculino ou feminimo -> M ou F -> 1 byte -> 4 bytes
#	prox: 4 bytes para conter o endereco do proximo registro
#	
#	total de bytes: 228 bytes

.section .data

	abertura:	.asciz	"\nLeitura de Registro\n\n"
	exibicao:	.asciz	"\n\nExibição do Registro\n"
	pedenome:	.asciz	"\nDigite o nome: "
	pederua:	.asciz	"\nDigite a rua: "
	pedenumrua:	.asciz	"\nDigite o numero da rua: "
	pedebairro:	.asciz	"\nDigite o nome do bairro: "
	pedecep:	.asciz	"\nDigite o seu cep: "
	pedecidade: .asciz	"\nDigite o nome da cidade: "
	pedetele:   .asciz	"\nDigite seu telefone: "
	pedeemail:  .asciz	"\nDigite seu email: "
	pedenasc:   .asciz	"\nDigite sua data nascimento. Ex: DD/MM/AAAA: "
	pederg:     .asciz	"\nDigite seu RG: "
	pedecon:    .asciz	"\nDigite a data contratação: "
	pedecargo:  .asciz	"\nDigite o nome do seu cargo: "
	pedesal:    .asciz	"\nDigite seu salario: "
	pedecpf:	.asciz	"\nDigite o CPF: "
	pedegenero:	.asciz	"\nDigite o genero <M>asculino/<F>eminino: "

	mostranome:	.asciz	"\nNome: %s"
	mostrarua:	.asciz	"\nRua: %s"
	mostranum:	.asciz	"\nNumero rua: %d"
	mostrabai:	.asciz	"\nBairro: %s"
	mostracep:	.asciz	"\nCEP: %s"
	mostracid:	.asciz	"\nCidade: %s"
	mostratel:	.asciz	"\nTelefone: %s"
	mostramail: .asciz	"\nE-mail: %s"
	mostranasc:	.asciz	"\nData nascimento: %s"
	mostrarg:	.asciz	"\nRG: %s"
	mostracont:	.asciz	"\nData contratação: %s"
	mostracarg:	.asciz	"\nCargo: %s"
	mostrasal:	.asciz	"\nSalario: %d"
	mostracpf:	.asciz	"\nCPF: %s"
	mostragenero:	.asciz	"\nGenero: %c"
	mostraprox:	.asciz	"\nEndereco do Proximo: %X\n\n"

	tamreg:		.int	228

	tipoint:	.asciz	"%d"
	tipocar:	.asciz	"%c"
	tipostr:	.ASCIZ	"%S"

	lista:		.int	0

	NULL:		.int	0

.section .text


.globl _start
_start:

	call	ler_registro
	call	mostrar_registro


	pushl	$0
	call	exit

ler_registro:

	pushl	$abertura
	call	printf

	# alocação do registro
	pushl	tamreg
	call	malloc
	movl	%eax, lista
	addl	$8, %esp

	# leitura do nome
	pushl	$pedenome
	call	printf
	addl	$4, %esp

	movl	lista, %edi
	pushl	%edi
	call	gets

	popl	%edi
	addl	$31, %edi # prossegue 31 bytes do nome

	pushl	%edi

	# leitura da rua
	pushl	$pederua
	call	printf
	addl	$4, %esp

	call	gets

	popl	%edi
	addl	$31, %edi # prossegue 31 bytes da rua

	pushl	%edi

	# leitura numero da rua

	pushl	$pedenumrua
	call	printf
	addl	$4, %esp

	pushl	$tipoint
	call	scanf
	addl	$4, %esp

	popl	%edi
	addl	$4, %edi # prossegue 4 bytes do numero da rua

	pushl	%edi

	# leitura do bairro

	pushl	$pedebairro
	call	printf
	addl	$4, %esp

	call	gets
	call	gets

	popl	%edi
	addl	$21, %edi # prossegue 21 bytes do bairro

	pushl	%edi

	# leitura do cep

	pushl	$pedecep
	call	printf
	addl	$4, %esp

	call	gets

	popl	%edi
	addl	$9, %edi # prossegue 9 bytes do cep

	pushl	%edi

	# leitura do cidade

	pushl	$pedecidade
	call	printf
	addl	$4, %esp

	call	gets

	popl	%edi
	addl	$21, %edi # prossegue 21 bytes do cidade

	pushl	%edi

	# leitura do telefone

	pushl	$pedetele
	call	printf
	addl	$4, %esp

	call	gets

	popl	%edi
	addl	$12, %edi # prossegue 12 bytes do telefone

	pushl	%edi

	# leitura do email

	pushl	$pedeemail
	call	printf
	addl	$4, %esp

	call	gets

	popl	%edi
	addl	$26, %edi # prossegue 26 bytes do email

	pushl	%edi

	# leitura da data nascimento

	pushl	$pedenasc
	call	printf
	addl	$4, %esp

	call	gets

	popl	%edi
	addl	$11, %edi # prossegue 11 bytes da data de nascimento

	pushl	%edi

	# leitura do RG

	pushl	$pederg
	call	printf
	addl	$4, %esp

	call	gets

	popl	%edi
	addl	$11, %edi # prossegue 11 bytes do rg

	pushl	%edi

	# leitura do CPF

	pushl	$pedecpf
	call	printf
	addl	$4, %esp

	call	gets

	popl	%edi
	addl	$12, %edi # prossegue 12 bytes do CPF

	pushl	%edi

	# leitura da data contratação

	pushl	$pedecon
	call	printf
	addl	$4, %esp

	call	gets

	popl	%edi
	addl	$11, %edi # prossegue 11 bytes da data contratação

	pushl	%edi

	# leitura do cargo

	pushl	$pedecargo
	call	printf
	addl	$4, %esp

	call	gets


	popl	%edi
	addl	$16, %edi # prossegue 16 bytes do cargo
	pushl	%edi

	# leitura do salario

	pushl	$pedesal
	call	printf
	addl	$4, %esp

	pushl	$tipoint
	call	scanf
	addl	$4, %esp

	popl	%edi
	addl	$4, %edi # prossegue 4 bytes do salario

	pushl	%edi

	# leitura do genero

	pushl	$pedegenero
	call	printf
	addl	$4, %esp

	pushl	$tipocar
	call	scanf
	addl	$4, %esp
	
	popl	%edi

	# colocar o endereco do null
	addl	$4, %edi

	movl	$NULL, (%edi)
	
	ret

mostrar_registro:

	pushl	$exibicao
	call	printf
	addl	$4, %esp


	movl	lista, %edi

	pushl	%edi

	# mostra nome
	pushl	$mostranome
	call	printf
	addl	$4, %esp

	popl	%edi
	addl	$31, %edi # prossegue 31 bytes do nome
	pushl	%edi

	# mostra rua
	pushl	$mostrarua
	call	printf
	addl	$4, %esp

	popl	%edi
	addl	$31, %edi # prossegue 31 bytes da rua
	pushl	%edi


	# mostra numero da rua
	movl	(%edi), %eax
	pushl	%eax
	pushl	$mostranum
	call	printf
	addl	$8, %esp

	popl	%edi
	addl	$4, %edi # prossegue 4 bytes do numero da rua
	pushl	%edi

	# mostra bairro
	pushl	$mostrabai
	call	printf
	addl	$4, %esp

	popl	%edi
	addl	$21, %edi # prossegue 21 bytes do bairro
	pushl	%edi

	# mostra bairro
	pushl	$mostracep
	call	printf
	addl	$4, %esp

	popl	%edi
	addl	$9, %edi # prossegue 9 bytes do cep
	pushl	%edi

	# mostra cidade
	pushl	$mostracid
	call	printf
	addl	$4, %esp

	popl	%edi
	addl	$21, %edi # prossegue 21 bytes da cidade
	pushl	%edi

	# mostra telefone
	pushl	$mostratel
	call	printf
	addl	$4, %esp

	popl	%edi
	addl	$12, %edi # prossegue 12 bytes do telefone
	pushl	%edi

	# mostra email
	pushl	$mostramail
	call	printf
	addl	$4, %esp

	popl	%edi
	addl	$26, %edi # prossegue 26 bytes do email
	pushl	%edi

	# mostra data de nascimento
	pushl	$mostranasc
	call	printf
	addl	$4, %esp

	popl	%edi
	addl	$11, %edi # prossegue 11 bytes da data de nascimento
	pushl	%edi

	# mostra RG
	pushl	$mostrarg
	call	printf
	addl	$4, %esp

	popl	%edi
	addl	$11, %edi # prossegue 11 bytes do RG
	pushl	%edi

	# mostra CPF
	pushl	$mostracpf
	call	printf
	addl	$4, %esp

	popl	%edi
	addl	$12, %edi # prossegue 12 bytes do CPF
	pushl	%edi

	# mostra data de contratação
	pushl	$mostracont
	call	printf
	addl	$4, %esp

	popl	%edi
	addl	$11, %edi # prossegue 11 bytes da data de contratação
	pushl	%edi

	# mostra cargo
	pushl	$mostracarg
	call	printf
	addl	$4, %esp

	popl	%edi
	addl	$16, %edi # prossegue 16 bytes da data de contratação
	pushl	%edi

	# mostra salario
	movl	(%edi), %eax
	pushl	%eax
	pushl	$mostrasal
	call	printf
	addl	$8, %esp

	popl	%edi
	addl	$4, %edi # prossegue 4 bytes do salario
	pushl	%edi

	# mostra genero
	movl	(%edi), %eax
	pushl	%eax
	pushl	$mostragenero
	call	printf
	addl	$8, %esp

	popl	%edi
	addl	$4, %edi # prossegue 4 bytes do genero
	pushl	%edi

	# mostra endereco de proximo registro
	pushl	$mostraprox
	call	printf
	addl	$4, %esp

	popl	%edi

	ret


