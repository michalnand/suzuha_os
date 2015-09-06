/**************************************************************************/
/* Configure memory regions */
MEMORY
{
  VECTORS (rx)      : ORIGIN = 0x0,         LENGTH = 0x00c0
  FLASHCFG (rx)     : ORIGIN = 0x00000400,  LENGTH = 0x00000010
  FLASH (rx)        : ORIGIN = 0x00000410,  LENGTH = 128K - 0x410
  RAM  (rwx)        : ORIGIN = 0x1FFFF000,  LENGTH = 16K
}

/* Config Libraries */
/*
    GROUP(libgcc.a libc.a libm.a libnosys.a)
*/

/* Linker script to place sections and symbol values. Should be used together
 * with other linker script that defines memory regions FLASH and RAM.
 * It references following symbols, which must be defined in code:
 *   _reset_init : Entry of reset handler
 * 
 * It defines following symbols, which code can use without definition:
 *   __exidx_start
 *   __exidx_end
 *   __etext
 *   __data_start__
 *   __preinit_array_start
 *   __preinit_array_end
 *   __init_array_start
 *   __init_array_end
 *   __fini_array_start
 *   __fini_array_end
 *   __data_end__
 *   __bss_start__
 *   __bss_end__
 *   __end__
 *   end
 *   __HeapLimit
 *   __StackLimit
 *   __StackTop
 *   __stack
 */
ENTRY(_reset_init)


SECTIONS
{
  /* The startup code goes first into INTERNAL_FLASH */
  .isr_vector :
  {
    __vector_table = .;
    . = ALIGN(4);
    KEEP(*(.isr_vector))
    . = ALIGN(4);
  } > VECTORS

  .cfmprotect :
  {
    . = ALIGN(4);
        KEEP(*(.cfmconfig))     /* Flash Configuration Field (FCF) */
    . = ALIGN(4);
  } > FLASHCFG

    .text :
    {
        *(.text*)

        KEEP(*(.init))
        KEEP(*(.fini))

        /* .ctors */
        *crtbegin.o(.ctors)
        *crtbegin?.o(.ctors)
        *(EXCLUDE_FILE(*crtend?.o *crtend.o) .ctors)
        *(SORT(.ctors.*))
        *(.ctors)

        /* .dtors */
        *crtbegin.o(.dtors)
        *crtbegin?.o(.dtors)
        *(EXCLUDE_FILE(*crtend?.o *crtend.o) .dtors)
        *(SORT(.dtors.*))
        *(.dtors)

        *(.rodata*)

        KEEP(*(.eh_frame*))
    } > FLASH

    .ARM.extab : 
    {
        *(.ARM.extab* .gnu.linkonce.armextab.*)
    } > FLASH

    __exidx_start = .;
    .ARM.exidx :
    {
        *(.ARM.exidx* .gnu.linkonce.armexidx.*)
    } > FLASH
    __exidx_end = .;

    __etext = .;

    .data : 
    {
    __data_start__ = .;
    _data = .;
        *(.data)      /* Data memory */
    _edata = .;
    __data_end__ = .;
    } >RAM 

    /* AT > rom */

    
    .bss :
    {
        __bss_start__ = .;
        *(.bss*)
        *(COMMON)
        __bss_end__ = .;
    } > RAM


    /* Set stack top to end of RAM */
    __StackTop = ORIGIN(RAM) + LENGTH(RAM);
    __StackLimit = __StackTop - 128;
    PROVIDE(__stack = __StackTop);
    
    /* Check if data + __bss_end__ + stack exceeds RAM limit */
    /* ASSERT(__StackLimit >= __bss_end__, "region RAM overflowed with stack") */
}