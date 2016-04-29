#include "lib_low_level.h"


// Memory locations defined by the linker
extern uint32_t __heap_start[];
extern uint32_t __StackTop[];
extern uint32_t __data_start__[], __data_end__[];
extern uint32_t __bss_start__[], __bss_end__[];
extern uint32_t __etext[];                // End of code/flash

void _reset_init(void)    __attribute__((naked, aligned(2)));
extern int main(void);       

__attribute__ ((section (".kinetis_flash_config_field"), aligned(2))) const uint8_t _cfm[0x10] = {
    0xFF,
    0xFF,
    0xFF,
    0xFF,

    0xFF,
    0xFF,
    0xFF,
    0xFF,

    0xFF,
    0xFF,
    0xFF,
    0xFF,

    0xFE,
    0xFF,
    0xFF,
    0xFF
};



//  Default interrupt handler
void __attribute__((interrupt("IRQ"))) Default_Handler()
{
	while (1)
		__asm("nop");
}


// Handle hard faults
static void __attribute__((naked)) HardFault_Handler(void) 
{
        PTB->PCOR = (1<<6);

    while (1)
        __asm("nop");
}

/* Weak definitions of handlers point to Default_Handler if not implemented */
void NMI_Handler()          __attribute__ ((weak, alias("Default_Handler")));
void PendSV_Handler()       __attribute__ ((weak, alias("Default_Handler")));
void SVC_Handler()          __attribute__ ((weak, alias("Default_Handler")));
void SysTick_Handler()      __attribute__ ((weak, alias("Default_Handler")));
void FTFA_IRQHandler()      __attribute__ ((weak, alias("Default_Handler")));
void LVD_LVW_IRQHandler()   __attribute__ ((weak, alias("Default_Handler")));
void I2C0_IRQHandler()      __attribute__ ((weak, alias("Default_Handler")));
void I2C1_IRQHandler()      __attribute__ ((weak, alias("Default_Handler")));
void SPI0_IRQHandler()      __attribute__ ((weak, alias("Default_Handler")));
void UART0_IRQHandler()     __attribute__ ((weak, alias("Default_Handler")));
void ADC0_IRQHandler()      __attribute__ ((weak, alias("Default_Handler")));
void CMP0_IRQHandler()      __attribute__ ((weak, alias("Default_Handler")));
void TPM0_IRQHandler()      __attribute__ ((weak, alias("Default_Handler")));
void TPM1_IRQHandler()      __attribute__ ((weak, alias("Default_Handler")));
void MCG_IRQHandler()       __attribute__ ((weak, alias("Default_Handler")));
void LPTimer_IRQHandler()   __attribute__ ((weak, alias("Default_Handler")));
void PORTA_IRQHandler()     __attribute__ ((weak, alias("Default_Handler")));
void PORTD_IRQHandler()     __attribute__ ((weak, alias("Default_Handler")));

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

    /* Interrupts */
    Default_Handler,         /* Reserved interrupt 16 */
    Default_Handler,         /* Reserved interrupt 17 */
    Default_Handler,         /* Reserved interrupt 18 */
    Default_Handler,         /* Reserved interrupt 19 */
    Default_Handler,         /* Reserved interrupt 20 */
    FTFA_IRQHandler,         /* FTFA interrupt */
    LVD_LVW_IRQHandler,      /* Low Voltage Detect, Low Voltage Warning */
    Default_Handler,         /* Reserved interrupt 23 */
    I2C0_IRQHandler,         /* I2C0 interrupt */
    I2C1_IRQHandler,         /* I2C0 interrupt 25 */
    SPI0_IRQHandler,         /* SPI0 interrupt */
    Default_Handler,         /* Reserved interrupt 27 */
    UART0_IRQHandler,        /* UART0 status/error interrupt */
    Default_Handler,        /* Reserved interrupt 29 */
    Default_Handler,        /* Reserved interrupt 30 */
    ADC0_IRQHandler,         /* ADC0 interrupt */
    CMP0_IRQHandler,         /* CMP0 interrupt */
    TPM0_IRQHandler,         /* TPM0 fault, overflow and channels interrupt */
    TPM1_IRQHandler,         /* TPM1 fault, overflow and channels interrupt */
    Default_Handler,         /* Reserved interrupt 35 */
    Default_Handler,         /* Reserved interrupt 36 */
    Default_Handler,         /* Reserved interrupt 37 */
    Default_Handler,         /* Reserved interrupt 38 */
    Default_Handler,         /* Reserved interrupt 39 */
    Default_Handler,         /* Reserved interrupt 40 */
    Default_Handler,         /* Reserved interrupt 41 */
    Default_Handler,         /* Reserved interrupt 42 */
    MCG_IRQHandler,          /* MCG interrupt */
    LPTimer_IRQHandler,      /* LPTimer interrupt */
    Default_Handler,         /* Reserved interrupt 45 */
    PORTA_IRQHandler,        /* Port A interrupt */
    PORTD_IRQHandler,        /* Port D interrupt */
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