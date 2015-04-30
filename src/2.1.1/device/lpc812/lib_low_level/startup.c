#include "lib_low_level.h"


// Memory locations defined by the linker
extern uint32_t __heap_start[];
extern uint32_t __StackTop[];
extern uint32_t __data_start__[], __data_end__[];
extern uint32_t __bss_start__[], __bss_end__[];
extern uint32_t __etext[];                // End of code/flash

void _reset_init(void)    __attribute__((naked, aligned(2)));
extern int main(void);       


//  Default interrupt handler
void __attribute__((interrupt("IRQ"))) Default_Handler()
{
    //printf("default handler\n" );

    while (1)
		__asm("nop");
}

void __attribute__((interrupt("IRQ"))) Testing_Handler()
{
    // printf("inside testing handler\n" );

    while (1)
        __asm("nop");
}


/* Weak definitions of handlers point to Default_Handler if not implemented */
void NMI_Handler()          __attribute__ ((weak, alias("Default_Handler")));
void HardFault_Handler()          __attribute__ ((weak, alias("Default_Handler")));
void SVC_Handler()          __attribute__ ((weak, alias("Default_Handler")));
void PendSV_Handler()          __attribute__ ((weak, alias("Default_Handler")));
void SysTick_Handler()          __attribute__ ((weak, alias("Default_Handler")));
 
void SPI0_Handler()          __attribute__ ((weak, alias("Default_Handler")));
void SPI1_Handler()          __attribute__ ((weak, alias("Default_Handler")));
void UART0_Handler()          __attribute__ ((weak, alias("Default_Handler")));
void UART1_Handler()          __attribute__ ((weak, alias("Default_Handler")));
void UART2_Handler()          __attribute__ ((weak, alias("Default_Handler")));
void I2C_Handler()          __attribute__ ((weak, alias("Default_Handler")));
void SCT_Handler()          __attribute__ ((weak, alias("Default_Handler")));
void MRT_Handler()          __attribute__ ((weak, alias("Default_Handler")));
void CMP_Handler()          __attribute__ ((weak, alias("Default_Handler")));
void WDT_Handler()          __attribute__ ((weak, alias("Default_Handler")));
void BOD_Handler()          __attribute__ ((weak, alias("Default_Handler")));
void WKT_Handler()          __attribute__ ((weak, alias("Default_Handler")));
void PININT0_Handler()          __attribute__ ((weak, alias("Default_Handler")));
void PININT1_Handler()          __attribute__ ((weak, alias("Default_Handler")));
void PININT2_Handler()          __attribute__ ((weak, alias("Default_Handler")));
void PININT3_Handler()          __attribute__ ((weak, alias("Default_Handler")));
void PININT4_Handler()          __attribute__ ((weak, alias("Default_Handler")));
void PININT5_Handler()          __attribute__ ((weak, alias("Default_Handler")));
void PININT6_Handler()          __attribute__ ((weak, alias("Default_Handler")));
void PININT7_Handler()          __attribute__ ((weak, alias("Default_Handler")));

                                   // Reserved


 
// ----------------------------------------------------------------------------------
// Interrupt vector table (loaded into flash memory at 0x000)
// 


void (* const InterruptVector[])() __attribute__ ((section(".isr_vector"), aligned(2))) = {
    (void(*)(void)) (int)__StackTop,                // Initial stack pointer
    _reset_init,                                    // Reset handler
    NMI_Handler,
    HardFault_Handler,
    0,
    0,
    0,
    0,
    0,
    0, 
    0,
    SVC_Handler,
    0,
    0,
    PendSV_Handler,
    SysTick_Handler,
    
    // Chip Level - LPC8xx
    SPI0_Handler,                         // SPI0 controller
    SPI1_Handler,                         // SPI1 controller
    0,                                       // Reserved
    UART0_Handler,                        // UART0
    UART1_Handler,                        // UART1
    UART2_Handler,                        // UART2
    0,                                       // Reserved
    0,                                       // Reserved
    I2C_Handler,                          // I2C controller
    SCT_Handler,                          // Smart Counter Timer
    MRT_Handler,                          // Multi-Rate Timer
    CMP_Handler,                          // Comparator
    WDT_Handler,                          // PIO1 (0:11)
    BOD_Handler,                          // Brown Out Detect
    0,                                       // Reserved
    WKT_Handler,                          // Wakeup timer
    0,                                       // Reserved
    0,                                       // Reserved
    0,                                       // Reserved
    0,                                       // Reserved
    0,                                       // Reserved
    0,                                       // Reserved
    0,                                       // Reserved
    0,                                       // Reserved
    PININT0_Handler,                      // PIO INT0
    PININT1_Handler,                      // PIO INT1
    PININT2_Handler,                      // PIO INT2
    PININT3_Handler,                      // PIO INT3
    PININT4_Handler,                      // PIO INT4
    PININT5_Handler,                      // PIO INT5
    PININT6_Handler,                      // PIO INT6
    PININT7_Handler                      // PIO INT7
};


void _reset_init(void)
{
    // Copy values to initialize data segment
    uint32_t *fr = __etext;
    uint32_t *to = __data_start__;
    unsigned int len = __data_end__ - __data_start__;
    while(len--)
        *to++ = *fr++;

    main(); 
}