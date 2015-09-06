MEMORY
{
  RAM (rwx)   : ORIGIN = 0x20000000, LENGTH = 0x00008000
  ROM (rx)    : ORIGIN = 0x00000000, LENGTH = 0x00040000
}

ENTRY(_reset_init)

SECTIONS
{
    /* .  = 0x0; */         /* From 0x00000000 */
    .text :
    {
	_text = .;
	KEEP(*(.isr_vector))
        _start_text = .;
        *(vectors)	/* Vector table */
        *(.text)	/* Program code */
        *(.rodata)	/* Read only data */
        _end_text = .;
	_etext = .;
    __etext = .;

    } >ROM

    /* .  = 0x20000000; */  /* From 0x20000000 */
    .data : /* AT (_etext) */
    {
        __data_start__ = .;
        _data = .;
        *(vtable)
        *(.data*)

        . = ALIGN(4);
        /* preinit data */
        PROVIDE_HIDDEN (__preinit_array_start = .);
        KEEP(*(.preinit_array))
        PROVIDE_HIDDEN (__preinit_array_end = .);



        . = ALIGN(4);
        /* All data end */
        __data_end__ = .;
        _edata = .;
    } > RAM

    .bss :
    {
        __bss_start__ = .;
        _bss = .;
        *(.bss*)
        *(COMMON)
        __bss_end__ = .;
        _ebss = .;
    } > RAM

    .heap :
    {
        __end__ = .;
        _heap = __end__;
        end = __end__;
        *(.heap*)
        __HeapLimit = .;
    } > RAM

    /* .stack_dummy section doesn't contains any symbols. It is only
     * used for linker to calculate size of stack sections, and assign
     * values to stack symbols later */
    .stack_dummy :
    {
        *(.stack)
    } > RAM

    /* Set stack top to end of RAM, and stack limit move down by
     * size of stack_dummy section */
    __StackTop = ORIGIN(RAM) + LENGTH(RAM);
    __StackLimit = __StackTop - SIZEOF(.stack_dummy);
    PROVIDE(__stack = __StackTop);

    /* Check if data + heap + stack exceeds RAM limit */
    ASSERT(__StackLimit >= __HeapLimit, "region RAM overflowed with stack")
}
