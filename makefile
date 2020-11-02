all:
	as -32 $(x).s -o $(x).o
	ld -L /usr/lib32 -m elf_i386 -l c -dynamic-linker /lib/ld-linux.so.2 $(x).o -o $(x).out
clear:
	rm -rf *.o *.out