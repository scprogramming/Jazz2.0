#include "vga.h"
#include "gdt.h"
#include "interrupts/idt.h"

void kmain(void);

void kmain(void){
    initGdt();
    print("GDT is done!\r\n");
    initIdt();
    print(1/0);
}