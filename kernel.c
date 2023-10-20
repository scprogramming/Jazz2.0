#include "vga.h"
#include "gdt.h"

void kmain(void);

void kmain(void){
    initGdt();
    print("GDT is done!\r\n");
}