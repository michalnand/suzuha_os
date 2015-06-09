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
	while (1)
		__asm("nop");
}


// Handle hard faults
void __attribute__((naked)) HardFault_Handler(void) 
{
    u32 loops;
    while (1)
    {
        led_on(LED_1);
        loops = 10000000;
        while (loops--)
            __asm("nop");
        

        led_off(LED_1);
        loops = 10000000;
        while (loops--)
            __asm("nop");
    }

    while (1)
        __asm("nop");
}

/* Weak definitions of handlers point to Default_Handler if not implemented */
void NMI_Handler()          __attribute__ ((weak, alias("Default_Handler")));
void MemManage_Handler()          __attribute__ ((weak, alias("Default_Handler")));
void BusFault_Handler()          __attribute__ ((weak, alias("Default_Handler")));
void UsageFault_Handler()          __attribute__ ((weak, alias("Default_Handler")));
void DebugMon_Handler()          __attribute__ ((weak, alias("Default_Handler")));
void PendSV_Handler()       __attribute__ ((weak, alias("Default_Handler")));
void SVC_Handler()          __attribute__ ((weak, alias("Default_Handler")));
void SysTick_Handler()      __attribute__ ((weak, alias("Default_Handler")));


void SUPC_Handler() __attribute__ ((weak, alias ("Default_Handler")));    /*  0  Supply Controller */
void RSTC_Handler() __attribute__ ((weak, alias ("Default_Handler")));    /*  1  Reset Controller */
void RTC_Handler() __attribute__ ((weak, alias ("Default_Handler")));     /*  2  Real Time Clock */
void RTT_Handler() __attribute__ ((weak, alias ("Default_Handler")));     /*  3  Real Time Timer */
void WDT_Handler() __attribute__ ((weak, alias ("Default_Handler")));     /*  4  Watchdog Timer */
void PMC_Handler() __attribute__ ((weak, alias ("Default_Handler")));     /*  5  PMC */
void EFC0_Handler() __attribute__ ((weak, alias ("Default_Handler")));    /*  6  EFC 0 */
void EFC1_Handler() __attribute__ ((weak, alias ("Default_Handler")));    /*  7  EFC 1 */
void UART_Handler() __attribute__ ((weak, alias ("Default_Handler")));    /*  8  UART */

#ifdef _SAM3XA_SMC_INSTANCE_
void SMC_Handler() __attribute__ ((weak, alias ("Default_Handler")));     /*  9  SMC */
#endif /* _SAM3XA_SMC_INSTANCE_ */

#ifdef _SAM3XA_SDRAMC_INSTANCE_
void SDRAMC_Handler() __attribute__ ((weak, alias ("Default_Handler")));  /* 10  SDRAMC */
#endif /* _SAM3XA_SDRAMC_INSTANCE_ */

void PIOA_Handler() __attribute__ ((weak, alias ("Default_Handler")));    /* 11 Parallel IO Controller A */
void PIOB_Handler() __attribute__ ((weak, alias ("Default_Handler")));    /* 12 Parallel IO Controller B */
 
#ifdef _SAM3XA_PIOC_INSTANCE_
void PIOC_Handler() __attribute__ ((weak, alias ("Default_Handler")));    /* 13 Parallel IO Controller C */
#endif /* _SAM3XA_PIOC_INSTANCE_ */

#ifdef _SAM3XA_PIOD_INSTANCE_
void PIOD_Handler() __attribute__ ((weak, alias ("Default_Handler")));    /* 14 Parallel IO Controller D */
#endif /* _SAM3XA_PIOD_INSTANCE_ */

#ifdef _SAM3XA_PIOE_INSTANCE_
void PIOE_Handler() __attribute__ ((weak, alias ("Default_Handler")));    /* 15 Parallel IO Controller E */
#endif /* _SAM3XA_PIOE_INSTANCE_ */

#ifdef _SAM3XA_PIOF_INSTANCE_
void PIOF_Handler() __attribute__ ((weak, alias ("Default_Handler")));    /* 16 Parallel IO Controller F */
#endif /* _SAM3XA_PIOF_INSTANCE_ */

void USART0_Handler() __attribute__ ((weak, alias ("Default_Handler")));  /* 17 USART 0 */
void USART1_Handler() __attribute__ ((weak, alias ("Default_Handler")));  /* 18 USART 1 */
void USART2_Handler() __attribute__ ((weak, alias ("Default_Handler")));  /* 19 USART 2 */

#ifdef _SAM3XA_USART3_INSTANCE_
void USART3_Handler() __attribute__ ((weak, alias ("Default_Handler")));  /* 20 USART 3 */
#endif /* _SAM3XA_USART3_INSTANCE_ */

void HSMCI_Handler() __attribute__ ((weak, alias ("Default_Handler")));   /* 21 MCI */
void TWI0_Handler() __attribute__ ((weak, alias ("Default_Handler")));    /* 22 TWI 0 */
void TWI1_Handler() __attribute__ ((weak, alias ("Default_Handler")));    /* 23 TWI 1 */
void SPI0_Handler() __attribute__ ((weak, alias ("Default_Handler")));    /* 24 SPI 0 */

#ifdef _SAM3XA_SPI1_INSTANCE_
void SPI1_Handler() __attribute__ ((weak, alias ("Default_Handler")));    /* 25 SPI 1 */
#endif /* _SAM3XA_SPI1_INSTANCE_ */

void SSC_Handler() __attribute__ ((weak, alias ("Default_Handler")));     /* 26 SSC */
void TC0_Handler() __attribute__ ((weak, alias ("Default_Handler")));     /* 27 Timer Counter 0 */
void TC1_Handler() __attribute__ ((weak, alias ("Default_Handler")));     /* 28 Timer Counter 1 */
void TC2_Handler() __attribute__ ((weak, alias ("Default_Handler")));     /* 29 Timer Counter 2 */
void TC3_Handler() __attribute__ ((weak, alias ("Default_Handler")));     /* 30 Timer Counter 3 */
void TC4_Handler() __attribute__ ((weak, alias ("Default_Handler")));     /* 31 Timer Counter 4 */
void TC5_Handler() __attribute__ ((weak, alias ("Default_Handler")));     /* 32 Timer Counter 5 */

#ifdef _SAM3XA_TC2_INSTANCE_
void TC6_Handler() __attribute__ ((weak, alias ("Default_Handler")));     /* 33 Timer Counter 6 */
void TC7_Handler() __attribute__ ((weak, alias ("Default_Handler")));     /* 34 Timer Counter 7 */
void TC8_Handler() __attribute__ ((weak, alias ("Default_Handler")));     /* 35 Timer Counter 8 */
#endif /* _SAM3XA_TC2_INSTANCE_ */

void PWM_Handler() __attribute__ ((weak, alias ("Default_Handler")));     /* 36 PWM */
void ADC_Handler() __attribute__ ((weak, alias ("Default_Handler")));     /* 37 ADC controller */
void DACC_Handler() __attribute__ ((weak, alias ("Default_Handler")));    /* 38 DAC controller */
void DMAC_Handler() __attribute__ ((weak, alias ("Default_Handler")));    /* 39 DMA Controller */
void UOTGHS_Handler() __attribute__ ((weak, alias ("Default_Handler")));  /* 40 USB OTG High Speed */
void TRNG_Handler() __attribute__ ((weak, alias ("Default_Handler")));    /* 41 True Random Number Generator */

#ifdef _SAM3XA_EMAC_INSTANCE_
void EMAC_Handler() __attribute__ ((weak, alias ("Default_Handler")));    /* 42 Ethernet MAC */
#endif /* _SAM3XA_EMAC_INSTANCE_ */

void CAN0_Handler() __attribute__ ((weak, alias ("Default_Handler")));    /* 43 CAN Controller 0 */
void CAN1_Handler() __attribute__ ((weak, alias ("Default_Handler")));     /* 44 CAN Controller 1 */





// ----------------------------------------------------------------------------------
// Interrupt vector table (loaded into flash memory at 0x000)
//
void (* const InterruptVector[])() __attribute__ ((section(".isr_vector"), aligned(2))) = {
    (void(*)(void)) (int)__StackTop,                // Initial stack pointer
    _reset_init,                                    // Reset handler
    NMI_Handler,
    HardFault_Handler,
    MemManage_Handler,
    BusFault_Handler,
    UsageFault_Handler,
    0,
    0,
    0,
    0,
    SVC_Handler,
    DebugMon_Handler,
    0,
    PendSV_Handler,
    SysTick_Handler,

    /* Interrupts */
    SUPC_Handler,    /*  0  Supply Controller */
    RSTC_Handler,    /*  1  Reset Controller */
    RTC_Handler,     /*  2  Real Time Clock */
    RTT_Handler,     /*  3  Real Time Timer */
    WDT_Handler,     /*  4  Watchdog Timer */
    PMC_Handler,     /*  5  PMC */
    EFC0_Handler,    /*  6  EFC 0 */
    EFC1_Handler,    /*  7  EFC 1 */
    UART_Handler,    /*  8  UART */
    #ifdef _SAM3XA_SMC_INSTANCE_
    SMC_Handler,     /*  9  SMC */
    #else
    0,           /*  9 Reserved */
    #endif /* _SAM3XA_SMC_INSTANCE_ */
    #ifdef _SAM3XA_SDRAMC_INSTANCE_
    SDRAMC_Handler,  /* 10  SDRAMC */
    #else
    0,           /* 10 Reserved */
    #endif /* _SAM3XA_SDRAMC_INSTANCE_ */
    PIOA_Handler,    /* 11 Parallel IO Controller A */
    PIOB_Handler,    /* 12 Parallel IO Controller B */
    #ifdef _SAM3XA_PIOC_INSTANCE_
    PIOC_Handler,    /* 13 Parallel IO Controller C */
    #else
    0,           /* 13 Reserved */
    #endif /* _SAM3XA_PIOC_INSTANCE_ */
    #ifdef _SAM3XA_PIOD_INSTANCE_
    PIOD_Handler,    /* 14 Parallel IO Controller D */
    #else
    0,           /* 14 Reserved */
    #endif /* _SAM3XA_PIOD_INSTANCE_ */
    #ifdef _SAM3XA_PIOE_INSTANCE_
    PIOE_Handler,    /* 15 Parallel IO Controller E */
    #else
    0,           /* 15 Reserved */
    #endif /* _SAM3XA_PIOE_INSTANCE_ */
    #ifdef _SAM3XA_PIOF_INSTANCE_
    PIOF_Handler,    /* 16 Parallel IO Controller F */
    #else
    0,           /* 16 Reserved */
    #endif /* _SAM3XA_PIOF_INSTANCE_ */
    USART0_Handler,  /* 17 USART 0 */
    USART1_Handler,  /* 18 USART 1 */
    USART2_Handler,  /* 19 USART 2 */
    #ifdef _SAM3XA_USART3_INSTANCE_
    USART3_Handler,  /* 20 USART 3 */
    #else
    0,           /* 20 Reserved */
    #endif /* _SAM3XA_USART3_INSTANCE_ */
    HSMCI_Handler,   /* 21 MCI */
    TWI0_Handler,    /* 22 TWI 0 */
    TWI1_Handler,    /* 23 TWI 1 */
    SPI0_Handler,    /* 24 SPI 0 */
    #ifdef _SAM3XA_SPI1_INSTANCE_
    SPI1_Handler,    /* 25 SPI 1 */
    #else
    0,          /* 25 Reserved */
    #endif /* _SAM3XA_SPI1_INSTANCE_ */
    SSC_Handler,     /* 26 SSC */
    TC0_Handler,     /* 27 Timer Counter 0 */
    TC1_Handler,     /* 28 Timer Counter 1 */
    TC2_Handler,     /* 29 Timer Counter 2 */
    TC3_Handler,     /* 30 Timer Counter 3 */
    TC4_Handler,     /* 31 Timer Counter 4 */
    TC5_Handler,     /* 32 Timer Counter 5 */
    #ifdef _SAM3XA_TC2_INSTANCE_
    TC6_Handler,     /* 33 Timer Counter 6 */
    TC7_Handler,     /* 34 Timer Counter 7 */
    TC8_Handler,     /* 35 Timer Counter 8 */
    #else
    0,           /* 33 Reserved */
    0,           /* 34 Reserved */
    0,           /* 35 Reserved */
    #endif /* _SAM3XA_TC2_INSTANCE_ */
    PWM_Handler,     /* 36 PWM */
    ADC_Handler,     /* 37 ADC controller */
    DACC_Handler,    /* 38 DAC controller */
    DMAC_Handler,    /* 39 DMA Controller */
    UOTGHS_Handler,  /* 40 USB OTG High Speed */
    TRNG_Handler,    /* 41 True Random Number Generator */
    #ifdef _SAM3XA_EMAC_INSTANCE_
    EMAC_Handler,    /* 42 Ethernet MAC */
    #else
    0,          /* 42 Reserved */
    #endif /* _SAM3XA_EMAC_INSTANCE_ */
    CAN0_Handler,    /* 43 CAN Controller 0 */
    CAN1_Handler     /* 44 CAN Controller 1 */
};


void _reset_init(void)
{
    // Copy values to initialize data segment
    uint32_t *fr = __etext;
    uint32_t *to = __data_start__;
    unsigned int len = __data_end__ - __data_start__;
    while(len--)
        *to++ = *fr++;

    WDT->WDT_MR = WDT_MR_WDDIS;

    main();
}