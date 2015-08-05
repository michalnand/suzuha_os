//
// _startup.c -- Reset initialization
//
//  Copyright (c) 2012-2013 Andrew Payne <andy@payne.org>
//

#include "lib_low_level.h"


// Memory locations defined by the linker
extern uint32_t __heap_start[];
extern uint32_t __StackTop[];
extern uint32_t __data_start__[], __data_end__[];
extern uint32_t __bss_start__[], __bss_end__[];
extern uint32_t __etext[];                // End of code/flash

void _reset_init(void)    __attribute__((naked, aligned(8)));
extern int main(void);       

// ----------------------------------------------------------------------------------
// Flash configuration field (loaded into flash memory at 0x400)
//
//      Note:  RESET_PIN_CFG is set to enable external RESET signal
//
__attribute__ ((section (".cfmconfig"))) const uint8_t _cfm[0x10] = {
    0xFF,  /* NV_BACKKEY3: KEY=0xFF */
    0xFF,  /* NV_BACKKEY2: KEY=0xFF */
    0xFF,  /* NV_BACKKEY1: KEY=0xFF */
    0xFF,  /* NV_BACKKEY0: KEY=0xFF */
    0xFF,  /* NV_BACKKEY7: KEY=0xFF */
    0xFF,  /* NV_BACKKEY6: KEY=0xFF */
    0xFF,  /* NV_BACKKEY5: KEY=0xFF */
    0xFF,  /* NV_BACKKEY4: KEY=0xFF */
    0xFF,  /* NV_FPROT3: PROT=0xFF */
    0xFF,  /* NV_FPROT2: PROT=0xFF */
    0xFF,  /* NV_FPROT1: PROT=0xFF */
    0xFF,  /* NV_FPROT0: PROT=0xFF */
    0x7E,  /* NV_FSEC: KEYEN=1,MEEN=3,FSLACC=3,SEC=2 */
    0xFF,  /* NV_FOPT: ??=1,??=1,FAST_INIT=1,LPBOOT1=1,RESET_PIN_CFG=1,
                        NMI_DIS=1,EZPORT_DIS=1,LPBOOT0=1 */
    0xFF,
    0xFF
  };

// ----------------------------------------------------------------------------------
//  Default interrupt handler
void __attribute__((interrupt("IRQ"))) Default_Handler()
{
	while (1)
	{
		__asm("nop");
	}
}

// The register frame pushed onto the stack during exceptions
typedef struct {
    uint32_t r0;
    uint32_t r1;
    uint32_t r2;
    uint32_t r3;
    uint32_t r12;
    uint32_t lr;
    void *pc;
    uint32_t psr;
} hw_stackframe_t; 

// Handle hard faults:  print debugging information and halt
static void __attribute__((naked)) HardFault_Handler(void) 
{
    PTB_BASE_PTR->PCOR = 1 << 19; //red len on
    u32 i;

    while (1)
    {
        i = 1000000;
        while (i--)
            __asm("nop");

        PTB_BASE_PTR->PTOR = 1 << 19;   /*toogle red led*/
    }

    while (1)
        __asm("nop");
}

/* Weak definitions of handlers point to Default_Handler if not implemented */
void NMI_Handler()          __attribute__ ((weak, alias("Default_Handler")));
void PendSV_Handler()       __attribute__ ((weak, alias("Default_Handler")));
void SVC_Handler()          __attribute__ ((weak, alias("Default_Handler")));
void SysTick_Handler()      __attribute__ ((weak, alias("Default_Handler")));
void DMA0_IRQHandler()      __attribute__ ((weak, alias("Default_Handler")));
void DMA1_IRQHandler()      __attribute__ ((weak, alias("Default_Handler")));
void DMA2_IRQHandler()      __attribute__ ((weak, alias("Default_Handler")));
void DMA3_IRQHandler()      __attribute__ ((weak, alias("Default_Handler")));
void MCM_IRQHandler()       __attribute__ ((weak, alias("Default_Handler")));
void FTFL_IRQHandler()      __attribute__ ((weak, alias("Default_Handler")));
void PMC_IRQHandler()       __attribute__ ((weak, alias("Default_Handler")));
void LLW_IRQHandler()       __attribute__ ((weak, alias("Default_Handler")));
void I2C0_IRQHandler()      __attribute__ ((weak, alias("Default_Handler")));
void I2C1_IRQHandler()      __attribute__ ((weak, alias("Default_Handler")));
void SPI0_IRQHandler()      __attribute__ ((weak, alias("Default_Handler")));
void SPI1_IRQHandler()      __attribute__ ((weak, alias("Default_Handler")));
void UART0_IRQHandler()     __attribute__ ((weak, alias("Default_Handler")));
void UART1_IRQHandler()     __attribute__ ((weak, alias("Default_Handler")));
void UART2_IRQHandler()     __attribute__ ((weak, alias("Default_Handler")));
void ADC0_IRQHandler()      __attribute__ ((weak, alias("Default_Handler")));
void CMP0_IRQHandler()      __attribute__ ((weak, alias("Default_Handler")));
void FTM0_IRQHandler()      __attribute__ ((weak, alias("Default_Handler")));
void FTM1_IRQHandler()      __attribute__ ((weak, alias("Default_Handler")));
void FTM2_IRQHandler()      __attribute__ ((weak, alias("Default_Handler")));
void RTC_Alarm_IRQHandler() __attribute__ ((weak, alias("Default_Handler")));
void RTC_Seconds_IRQHandler() __attribute__ ((weak, alias("Default_Handler")));
void PIT_IRQHandler()       __attribute__ ((weak, alias("Default_Handler")));
void USBOTG_IRQHandler()    __attribute__ ((weak, alias("Default_Handler")));
void DAC0_IRQHandler()      __attribute__ ((weak, alias("Default_Handler")));
void TSI0_IRQHandler()      __attribute__ ((weak, alias("Default_Handler")));
void MCG_IRQHandler()       __attribute__ ((weak, alias("Default_Handler")));
void LPTimer_IRQHandler()   __attribute__ ((weak, alias("Default_Handler")));
void PORTA_IRQHandler()     __attribute__ ((weak, alias("Default_Handler")));
void PORTD_IRQHandler()     __attribute__ ((weak, alias("Default_Handler")));

// ----------------------------------------------------------------------------------
// Interrupt vector table (loaded into flash memory at 0x000)
//
void (* const InterruptVector[])() __attribute__ ((section(".isr_vector"))) = {
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
    DMA0_IRQHandler, /* DMA Channel 0 Transfer Complete and Error */
    DMA1_IRQHandler, /* DMA Channel 1 Transfer Complete and Error */
    DMA2_IRQHandler, /* DMA Channel 2 Transfer Complete and Error */
    DMA3_IRQHandler, /* DMA Channel 3 Transfer Complete and Error */
    MCM_IRQHandler, /* Normal Interrupt */
    FTFL_IRQHandler, /* FTFL Interrupt */
    PMC_IRQHandler, /* PMC Interrupt */
    LLW_IRQHandler, /* Low Leakage Wake-up */
    I2C0_IRQHandler, /* I2C0 interrupt */
    I2C1_IRQHandler, /* I2C1 interrupt */
    SPI0_IRQHandler, /* SPI0 Interrupt */
    SPI1_IRQHandler, /* SPI1 Interrupt */
    UART0_IRQHandler, /* UART0 Status and Error interrupt */
    UART1_IRQHandler, /* UART1 Status and Error interrupt */
    UART2_IRQHandler, /* UART2 Status and Error interrupt */
    ADC0_IRQHandler, /* ADC0 interrupt */
    CMP0_IRQHandler, /* CMP0 interrupt */
    FTM0_IRQHandler, /* FTM0 fault, overflow and channels interrupt */
    FTM1_IRQHandler, /* FTM1 fault, overflow and channels interrupt */
    FTM2_IRQHandler, /* FTM2 fault, overflow and channels interrupt */
    RTC_Alarm_IRQHandler, /* RTC Alarm interrupt */
    RTC_Seconds_IRQHandler, /* RTC Seconds interrupt */
    PIT_IRQHandler, /* PIT timer all channels interrupt */
    Default_Handler, /* Reserved interrupt 39/23 */
    USBOTG_IRQHandler, /* USB interrupt */
    DAC0_IRQHandler, /* DAC0 interrupt */
    TSI0_IRQHandler, /* TSI0 Interrupt */
    MCG_IRQHandler, /* MCG Interrupt */
    LPTimer_IRQHandler, /* LPTimer interrupt */
    Default_Handler, /* Reserved interrupt 45/29 */
    PORTA_IRQHandler, /* Port A interrupt */
    PORTD_IRQHandler /* Port D interrupt */
};


// ----------------------------------------------------------------------------------
//
// _reset_init() -- Reset entry point.  
//
//      The CPU reset vector points here.  Initialize the CPU, and jump
//      to the C runtime start, which will eventually invoke main()
//
void _reset_init(void)
{
    SIM_COPC = 0;                       // Disable the watchdog timer   
    SCB_VTOR = (uint32_t)InterruptVector;

    // Copy values to initialize data segment
    uint32_t *fr = __etext;
    uint32_t *to = __data_start__;
    unsigned int len = __data_end__ - __data_start__;
    while(len--)
        *to++ = *fr++;

    main();
}

/*
void _exit()
{
    while (1)
        __asm("nop");
}
*/