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
#   salario: tipo float de 8 bytes
#	Genero: masculino ou feminimo -> M ou F -> 1 byte -> 4 bytes
#	prox: 4 bytes para conter o endereco do proximo registro
#	
#	total de bytes: 232 bytes

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
	pedereajuste: .asciz "\nDigite o percentual de reajuste: "
	pedeNomeArq: .asciz "\nEntre com o nome do arquivo de entrada/saida\n> "
	listvazia:	.asciz	"\nLISTA ESTÁ VAZIA!\n "
	semnome:	.asciz	"\nNAO TEM REGISTRO COM ESSE NOME!\n "
	pergmenu: .asciz	"\n\nMenu do usuário\n----------------\nDigite 1 p/ inserir\n2 p/ consultar\n3 p/ excluir\n4 p/ relatório\n5 p/ Reajuste salarial\n6 p/ carregar arq\n7 p/ gravar em arq\n0 p/ sair: "



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
	mostrasal:	.asciz	"\nSalario: R$ %.2lf"
	mostracpf:	.asciz	"\nCPF: %s"
	mostragenero:	.asciz	"\nGenero: %c"
	mostraprox:	.asciz	"\nEndereco do Proximo: %X\n\n"
	

	tamreg:		.int	232

	tipoint:	.asciz	"%d"
	tipocar:	.asciz	"%c"
	tipostr:	.ASCIZ	"%S"
	tipofloat: .asciz "%lf" 

	lista:		.int	0
	regist:		.int 	0
	registro: 	.space  232
	atual:		.int 	0
	reajuste:	.double 0.0
	cem:		.double 100.0
	nomeArq:	.space  50
	descritor: 	.int 	0 # descritor do arquivo de entrada/saida

	opcao:		.int 	0

	NULL:		.int	0

	O_RDONLY: .int 0x0000 # somente leitura
	O_WRONLY: .int 0x0001 # somente escrita
	O_RDWR:   .int 0x0002 # leitura e escrita
	O_CREAT:  .int 0x0040 # cria o arquivo na abertura, caso ele n�o exista
	O_EXCL:   .int 0x0080 # for�a a cria��o
	O_APPEND: .int 0x0400 # posiciona o cursor do arquivo no final, para adi��o
	O_TRUNC:  .int 0x0200 # reseta o arquivo aberto, deixando com tamanho 0 (zero)


	S_IRWXU: .int 0x01C0# user (file owner) has read, write and execute permission
	S_IRUSR: .int 0x0100 # user has read permission
	S_IWUSR: .int 0x0080 # user has write permission
	S_IXUSR: .int 0x0040 # user has execute permission
	S_IRWXG: .int 0x0038 # group has read, write and execute permission
	S_IRGRP: .int 0x0020 # group has read permission
	S_IWGRP: .int 0x0010 # group has write permission
	S_IXGRP: .int 0x0008 # group has execute permission
	S_IRWXO: .int 0x0007 # others have read, write and execute permission
	S_IROTH: .int 0x0004 # others have read permission
	S_IWOTH: .int 0x0002 # others have write permission
	S_IXOTH: .int 0x0001 # others have execute permission
	S_NADA:  .int 0x0000 # n�o altera a situa��o

	SYS_EXIT: 	.int 1
	SYS_FORK: 	.int 2
	SYS_READ: 	.int 3
	SYS_WRITE: 	.int 4
	SYS_OPEN: 	.int 5
	SYS_CLOSE: 	.int 6
	SYS_CREAT: 	.int 8

.section .text


.globl _start
_start:
	movl	$NULL, %eax
	movl	%eax, lista
	call	menu
_end:
	pushl	$0
	call	exit

menu:
	# pergunta a opcao ao usuario
	pushl	$pergmenu
	call	printf
	# obtem a resposta da opcao
	addl	$4, %esp
	pushl 	$opcao 
	pushl 	$tipoint
	call 	scanf
	addl	$8, %esp
	# veja se quer inserir 
	movl opcao, %eax
	cmpl $1, %eax
	je insere
	# veja se quer consultar
	cmpl $2, %eax
	je consultar
	# veja se quer excluir
	cmpl $3, %eax
	je excluir
	# veja se quer exibir 
	cmpl $4, %eax
	je mostra_todos
	# veja se quer reajustar salario
	cmpl $5, %eax
	je reajustar
	# veja se quer ler arquivo
	cmpl $6, %eax
	je leitura
	# veja se quer escrever arquivo
	cmpl $7, %eax
	je escrita
	# veja se quer sair
	cmpl $0, %eax
	je _end
# funcao que fecha o arq
fechaArq:
	movl 	SYS_CLOSE, %eax
	movl 	descritor, %ebx # recupera o descritor
	int 	$0x80
	ret
# funcao que realiza a leitura dos registros salvo em um arq
leitura:
	movl	$NULL, %eax
	movl	%eax, lista # a lista é reinicializada com o endereço de null

	pushl 	$pedeNomeArq
	call 	printf
	pushl 	$nomeArq # variavel que conterá o nome do arq
	call 	gets
	call 	gets
	addl 	$8, %esp

	call	abreArqE # abre o arquivo para leitura

	call 	lerArq
# funcao que vai realizar a leitura dos registros e salvar na lista
lerArq:
	movl 	SYS_READ, %eax # %eax retorna numero de bytes lidos
	movl 	descritor, %ebx # recupera o descritor
	movl 	$registro, %ecx
	movl 	tamreg, %edx
	int 	$0x80 # le registro do arquivo
	
	cmpl 	$0, %eax # veja se chegou no final do arq
	
	je 		fechaEMenu

	movl	lista, %ecx # conteudo primeiro_elemento da lista
	movl	registro, %edi # novo elemento a ser inserido
	movl	$NULL, %ebx
	call 	insere_lista # insere o conteudo que está em edi na lista

	jmp 	lerArq
# fecha o arquivo e volta para o menu
fechaEMenu:
	call 	fechaArq
	jmp		menu
# abre o arquivo para leitura
abreArqE:
	movl 	SYS_OPEN, %eax 	# system call OPEN: retorna o descritor em %eax
	movl 	$nomeArq, %ebx
	movl 	O_RDONLY, %ecx
	int 	$0x80
	movl 	%eax, descritor # guarda o descritor
	ret

# funcao que realiza a escrita de todos os registros em um arq
escrita:

	pushl 	$pedeNomeArq
	call 	printf
	pushl 	$nomeArq # variavel que conterá o nome do arq
	call 	gets
	call 	gets
	addl 	$8, %esp

	call	abreArq # abre o arquivo

	movl	$lista, %edi # endereco do primeiro elemento da lista em edi
	movl	$NULL, %ebx # endereco do null

	cmpl  	$NULL, (%edi) # verifica se o endereco do null eh igual ao do primeiro elemento da lsita
	je		lista_vazia
# escreve cada registro ate chegar no final da lista
loopescrita:
	movl	$NULL, %ebx # endereco do null
	cmpl  	(%edi), %ebx # lista->proximo == endereco do null	
	jne		gravaReg

	call	fechaArq # fecha o arq
	jmp		menu


# funcao que vai abrir o arq para escrita (sempre sobreescreve o arq antigo, caso exista)
abreArq:
	movl 	SYS_OPEN, %eax 	# system call OPEN: retorna o descritor em %eax
	movl 	$nomeArq, %ebx
	movl 	O_WRONLY, %ecx
	orl 	O_CREAT, %ecx
	orl 	O_TRUNC, %ecx
	movl 	S_IRUSR, %edx
	orl 	S_IWUSR, %edx
	int 	$0x80
	movl 	%eax, descritor # guarda o descritor
	ret
# funcao que vai escrever o reg no arq
gravaReg:
	movl	%edi, %ecx 	# move o endereco que edi está apontando para ecx
	movl 	SYS_WRITE, %eax # abre o arquivo p/ escrita
	movl 	descritor, %ebx # recupera o descritor
	movl 	tamreg, %edx # tam do registro 232
	int 	$0x80
	
	movl	(%edi), %edi # recupera o conteudo que edi está apontando e coloca em edi
	addl	$228, %edi # avanca pro proximo registro, 228 => campo do proximo
	jmp 	loopescrita

# funcao que realiza reajuste salarial
reajustar:
	movl	$lista, %edi # endereco do primeiro elemento da lista em edi
	movl	$NULL, %ebx # endereco do null

	cmpl  	$NULL, (%edi) # verifica se a lista esta vazia
	je		lista_vazia

	pushl	$pedereajuste # solicita ao usuario o percentual a ser reajustado (em porcentagem)
	call	printf
	addl	$4, %esp

	pushl	$reajuste # variavel que contem o percentual de reajuste, ex: 30 equivale a 30%
	pushl	$tipofloat
	call	scanf
	addl	$8, %esp

	finit
	fldl 	cem
	fldl 	reajuste 
	fdiv	%st(1), %st(0) # porcentagem / 100
	fstl 	reajuste # move o conteudo de st(0) e coloca na variavel reajuste

	


# segue para o proximo registro p/ reajustar salario
reajusta_proximo:

	movl	$NULL, %ebx # endereco do null
	cmpl  	(%edi), %ebx # lista->proximo == endereco do null

	jne		reajusta_reg
	jmp		menu
# vai mostrar o registro em edi e seguir para reajustar o proximo
reajusta_reg:

	finit
	movl	(%edi), %edi
	addl	$216, %edi # move para posicao do salario
	fldl 	(%edi) 
	fldl 	reajuste # salario esta em %st(1) e percentual de reajuste em %st(0)
	fmul	%st(1), %st(0) # multiplica o salario pelo reajuste
	fldl 	(%edi) # empilha novamente o salario, %st(0) contem o salario e %st(1) o valor pra ser reajustado
	fadd	%st(1), %st(0) # pega o valor do reajuste e soma com o salario
	
	fstl 	(%edi) # move o conteudo de st(0) e coloca no campo salario do registro
	
	
	addl	$12, %edi # avanca pro proximo registro, 216 + 12 = 228 => campo do proximo


	jmp 	reajusta_proximo

# funcao que exclui o registro dado um nome
excluir:
	movl	$lista, %edi # endereco do primeiro elemento da lista em edi
	movl	$NULL, %ebx # endereco do null

	cmpl  	$NULL, (%edi) # verifica se o endereco do null eh igual ao do primeiro elemento da lsita
	je		lista_vazia

	pushl	$pedenome # solicita ao usuario o nome a excluir
	call	printf
	addl	$4, %esp

	pushl	$31 # tam do nome que ser lido
	call	malloc
	movl	%eax, %ecx

	pushl	%ecx # ecx eh onde o nome sera armazenado
	call	gets 
	call	gets 
	popl	%ecx

	movl	lista, %edx # conteudo do primeiro elemento da lista em edx
	movl	$NULL, %ebx # endereco do null
# loop para procurar o elemento a ser excluido
loopexcluir:

	cmpl  	$NULL, %edx # verifica se chegou no final da lista
	je		naoexiste	# chegou no final da lista, ou seja, nao existe esse nome para excluir
	
	pushl	%ebx
	pushl	%ecx # empilha o nome do usuario digitado
	pushl	%edx # empilha o nome do regist
	call	strcmp
	popl	%edx
	popl	%ecx
	popl	%ebx
	cmpl  	$0, %eax # verifica se os nomes sao igauis
	je		delete_reg # nome === lista.nome ?
	
	movl	%edx, %ebx # aramazena o registro anterior
	movl	228(%edx), %edx # avanca pro proximo registro
	
	jmp loopexcluir
# verfica se precisa excluir no comeco ou fim, quando achado o elemento
delete_reg:
	movl	lista, %eax # primeiro elemento da lista
	cmpl  	%eax, %edx # primeiro elemento == elemento atual
	je		remove_prim
	
	movl 	228(%edx), %edi # pega o proximo elemento da lista
	movl	%edi, 228(%ebx)

	jmp		menu
# remove o primeiro elemento da lsita
remove_prim:
	movl	228(%edx), %edi
	movl	%edi, lista
	jmp menu

# funcao para consultar um registro dado um nome
consultar:
	movl	$lista, %ecx # endereco do primeiro elemento da lista em ecx
	movl	$NULL, %ebx # endereco do null

	cmpl  	$NULL, (%ecx) # verifica se a lista esta vazia
	je		lista_vazia

	pushl	$pedenome # solicita ao usuario o nome
	call	printf
	addl	$4, %esp

	pushl	$31 # tam do nome
	call	malloc
	movl	%eax, %edi

	pushl	%edi # onde o nome sera armazenado
	call	gets 
	call	gets # contem o nome do usuario
	popl	%edi

	movl	lista, %edx # conteudo do primeiro elemento da lista em edx
	movl	$NULL, %ebx # endereco do null

# loop para procurar o elemento a ser consultado
loopconsulta:

	movl	$NULL, %ebx # endereco do null
	cmpl  	%edx, %ebx # lista->proximo == NULL ?
	je		naoexiste	# chegou no final da lista, ou seja, nao existe esse nome
	
	pushl	%ebx 
	pushl	%edi # empilha o nome do usuario digitado
	pushl	%edx # empilha o nome do regist
	call	strcmp
	popl	%edx
	popl	%edi
	popl	%ebx
	cmpl  	$0, %eax # verifica se os nomes sao igauis
	je		mostra_singular # os nomes sao iguais, ou seja, mostra o registro
	
	movl	228(%edx), %edx # segue para o proximo registro
	
	jmp loopconsulta

# exibe a mensagem que o usuario nao existe
naoexiste:
	pushl	$semnome
	call	printf
	addl	$4, %esp
	jmp 	menu
# mostra em detalhes o registro que esta em edx
mostra_singular:
	movl	%edx, (%edi)
	call 	mostrar_registro
	jmp		menu

# mostra todos os registros que estao em lista
mostra_todos:
	movl	$lista, %edi # endereco do primeiro elemento da lista em edi
	movl	$NULL, %ebx # endereco do null

	cmpl  	$NULL, (%edi) # verifica se a lista esta vazia
	je		lista_vazia

# mostra o proximo registro
mostra_proximo:


	movl	$NULL, %ebx # endereco do null
	cmpl  	(%edi), %ebx # lista->proximo == endereco do null

	jne		mostra_reg
	jmp		menu
# vai mostrar o registro em edi e seguir para mostrar o proximo
mostra_reg:
	call 	mostrar_registro
	jmp 	mostra_proximo

# exibe mensagem que a lista está vazia
lista_vazia:
	pushl 	$listvazia
	call printf
	addl	$4, %esp
	jmp		menu
# funcao que insere um elemento ordenado por nome na lista
insere:
	# cria um registro e armazena em regist
	call 	ler_registro
	# armazena o comeco da lista e endereco do null
	movl	lista, %ecx # conteudo primeiro_elemento da lista
	movl	regist, %edi # novo elemento a ser inserido
	movl	$NULL, %ebx
	call 	insere_lista
	jmp 	menu
# verifica se vai inserir no comeco ou vai percorrer a lista para inserir ordenado
insere_lista:
	
	# verifica se insere no comeco da lista
	cmpl  	%ecx, %ebx
	je		comeco_lista

	# verfica se o regist possui nome menor que o que esta no comeco da lista
	pushl	%ecx	# empilha o nome do primeiro elemento da lista
	pushl	%edi # empilha o nome do regist
	call	strcmp
	popl	%edi
	popl	%ecx

	cmpl  	$0, %eax 
	jle		troca_comeco # regist.nome < lista.nome ?
# procura a posição na qual regist será introduzido, de forma ordenada
loop_insere:
	
	cmpl  	$NULL, %ecx # verifica se esta no final 
	je		insere_ordenado # insere no final

	pushl	%ebx
	pushl	%ecx	# empilha o nome do primeiro elemento da lista
	pushl	%edi # empilha o nome do regist
	call	strcmp
	popl	%edi
	popl	%ecx
	popl	%ebx

	cmpl  	$0, %eax 

	jle		insere_ordenado # regist.nome < lista.nome ?
	
	movl	%ecx, %ebx # element anteiror = elemento atual

	movl	228(%ecx), %ecx # avanca pro prox element
	jmp loop_insere
# realiza a troca ordenada
insere_ordenado:
	
	movl	%ecx, 228(%edi) # regist->prox = elemento atual
	movl	%edi, 228(%ebx) # elemento anterior->proximo = regist
	ret
# caso que precisa trocar o regist com o elemento do comeco da lista
troca_comeco:
	movl	%edi, lista # lista = regist
	movl	%ecx, 228(%edi) # regist->proximo = primeiro_element_lista
	ret

# caso base, insere no comeco se nao tiver elemento na lista
comeco_lista:
	movl	%edi, lista
	ret

# vai ler o registro e colocar na variavel regist
ler_registro:

	pushl	$abertura
	call	printf

	# alocação do registro
	pushl	tamreg
	call	malloc
	movl	%eax, regist
	addl	$8, %esp

	# leitura do nome
	pushl	$pedenome
	call	printf
	addl	$4, %esp

	movl	regist, %edi
	pushl	%edi
	call	gets
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

	pushl	$tipofloat
	call	scanf
	addl	$4, %esp

	popl	%edi
	addl	$8, %edi # prossegue 8 bytes do salario

	pushl	%edi

	# leitura do genero

	pushl	$pedegenero
	call	printf
	addl	$4, %esp

	pushl	$tipocar
	call	scanf
	call	scanf
	addl	$4, %esp 
	
	popl	%edi

	addl	$4, %edi # prossegue 4 bytes do genero

	# colocar o endereco do null
	movl	$NULL, (%edi)
	
	ret


# vai mostrar o registro que esta em edi
mostrar_registro:

	pushl	$exibicao
	call	printf
	addl	$4, %esp

	movl	(%edi), %edi

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
	fldl 	(%edi)
	subl 	$8, %esp
	fstpl 	(%esp)
	pushl 	$mostrasal
	call 	printf
	addl	$12, %esp # 4 do pushl + 8 que abriu para printar o float

	popl	%edi
	addl	$8, %edi # prossegue 8 bytes do salario
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


