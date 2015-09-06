MEMORY
{
  ram (rwx)   : ORIGIN = 0x20000000, LENGTH = 0x00008000
  rom (rx)    : ORIGIN = 0x00000000, LENGTH = 0x00040000
}

ENTRY(_reset_init)

SECTIONS
{
    .  = 0x0;         /* From 0x00000000 */
    .text :
    {
	_text = .;
	KEEP(*(.isr_vector))
        *(vectors)	/* Vector table */
        *(.text)	/* Program code */
        *(.rodata)	/* Read only data */
	_etext = .;
    } >rom

    .  = 0x20000000;  /* From 0x20000000 */  
    __etext = .;

    .data : 
    {
    __data_start__ = .;
	_data = .;
        *(.data)      /* Data memory */
	_edata = .;
    __data_end__ = .;
    } >ram AT > rom

    .bss :
    {
	_bss = .;
        *(.bss)       /* Zero-filled run time allocate data memory */
	_ebss = .;
    } >ram AT > rom

    /* Set stack top to end of RAM */
    __StackTop = ORIGIN(ram) + LENGTH(ram);
    __StackLimit = __StackTop - 1k;
    PROVIDE(__stack = __StackTop);
}
