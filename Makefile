all: clean kernel boot image

clean:
	rm -rf *.o

kernel:
	gcc -m32 -fno-stack-protector -fno-builtin -c kernel.c -o kernel.o
	gcc -m32 -fno-stack-protector -fno-builtin -c vga.c -o vga.o
	gcc -m32 -fno-stack-protector -fno-builtin -c gdt.c -o gdt.o

boot:
	nasm -f elf32 boot.s -o boot.o
	nasm -f elf32 gdt.s -o gdts.o
image:
	ld -m elf_i386 -T linker.ld -o kernel boot.o kernel.o vga.o gdt.o gdts.o
	mv kernel Jazz/boot/kernel
	grub-mkrescue -o kernel.iso Jazz/
	rm *.o


