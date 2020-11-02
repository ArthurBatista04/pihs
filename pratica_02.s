.section .data
	output: .ascii "O fabricante 'xxxxxxxxxxxx' foi identificado\n"
	output2: .ascii "###############"

.section .text

.globl _start
_start:
	movl $0, %eax
	cpuid
	movl $output,%edi
_b1:
	movl %ebx, 14(%edi) 
_b2:
	movl %edx, 18(%edi) 
	movl %ecx, 22(%edi) 
	movl $4, %eax
	movl $1, %ebx
	movl $output, %ecx
	movl $60, %edx
	int $0x80
	movl $1, %eax 
_b3:
	movl $0, %ebx 
	int $0x80 
