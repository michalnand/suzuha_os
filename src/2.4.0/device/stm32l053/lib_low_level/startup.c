#include "lib_low_level.h"
#include <stdint.h>


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
static void __attribute__((naked)) HardFault_Handler(void) 
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
    void NMI_Handler() __attribute__((weak, alias("Default_Handler")));
    //    void HardFault_Handler() __attribute__((weak, alias("Default_Handler")));
    void SVC_Handler() __attribute__((weak, alias("Default_Handler")));
    void DebugMon_Handler() __attribute__((weak, alias("Default_Handler")));
    void PendSV_Handler() __attribute__((weak, alias("Default_Handler")));
    void SysTick_Handler() __attribute__((weak, alias("Default_Handler")));
    
    void WWDG_IRQHandler() __attribute__((weak, alias("Default_Handler")));
    void PVD_IRQHandler() __attribute__((weak, alias("Default_Handler")));
    void RTC_IRQHandler() __attribute__((weak, alias("Default_Handler")));
    void FLASH_IRQHandler() __attribute__((weak, alias("Default_Handler")));
    void RCC_CRS_IRQHandler() __attribute__((weak, alias("Default_Handler")));
    void EXTI0_1_IRQHandler() __attribute__((weak, alias("Default_Handler")));
    void EXTI2_3_IRQHandler() __attribute__((weak, alias("Default_Handler")));
    void EXTI4_15_IRQHandler() __attribute__((weak, alias("Default_Handler")));
    void TSC_IRQHandler() __attribute__((weak, alias("Default_Handler")));
    void DMA1_Channel1_IRQHandler() __attribute__((weak, alias("Default_Handler")));
    void DMA1_Channel2_3_IRQHandler() __attribute__((weak, alias("Default_Handler")));
    void DMA1_Channel4_5_6_7_IRQHandler() __attribute__((weak, alias("Default_Handler")));
    void ADC1_COMP_IRQHandler() __attribute__((weak, alias("Default_Handler")));
    void LPTIM1_IRQHandler() __attribute__((weak, alias("Default_Handler")));
    void TIM2_IRQHandler() __attribute__((weak, alias("Default_Handler")));
    void TIM6_DAC_IRQHandler() __attribute__((weak, alias("Default_Handler")));
    void TIM21_IRQHandler() __attribute__((weak, alias("Default_Handler")));
    void TIM22_IRQHandler() __attribute__((weak, alias("Default_Handler")));
    void I2C1_IRQHandler() __attribute__((weak, alias("Default_Handler")));
    void I2C2_IRQHandler() __attribute__((weak, alias("Default_Handler")));
    void SPI1_IRQHandler() __attribute__((weak, alias("Default_Handler")));
    void SPI2_IRQHandler() __attribute__((weak, alias("Default_Handler")));
    void USART1_IRQHandler() __attribute__((weak, alias("Default_Handler")));
    void USART2_IRQHandler() __attribute__((weak, alias("Default_Handler")));
    void RNG_LPUART1_IRQHandler() __attribute__((weak, alias("Default_Handler")));
    void LCD_IRQHandler() __attribute__((weak, alias("Default_Handler")));
    void USB_IRQHandler() __attribute__((weak, alias("Default_Handler")));           






// ----------------------------------------------------------------------------------
// Interrupt vector table (loaded into flash memory at 0x000)
//
void (* const InterruptVector[])() __attribute__ ((section(".isr_vector"), aligned(2))) = {
    (void(*)(void)) (int)__StackTop,                // Initial stack pointer
    _reset_init,
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
    DebugMon_Handler,
    0,
    PendSV_Handler,
    SysTick_Handler,

    WWDG_IRQHandler,                   /* Window WatchDog              */
    PVD_IRQHandler,                    /* PVD through EXTI Line detection */
    RTC_IRQHandler,                    /* RTC through the EXTI line     */
    FLASH_IRQHandler,                  /* FLASH                        */
    RCC_CRS_IRQHandler,                /* RCC and CRS                  */
    EXTI0_1_IRQHandler,                /* EXTI Line 0 and 1            */
    EXTI2_3_IRQHandler,                /* EXTI Line 2 and 3            */
    EXTI4_15_IRQHandler,               /* EXTI Line 4 to 15            */
    TSC_IRQHandler,                     /* TSC                           */
    DMA1_Channel1_IRQHandler,          /* DMA1 Channel 1               */
    DMA1_Channel2_3_IRQHandler,        /* DMA1 Channel 2 and Channel 3 */
    DMA1_Channel4_5_6_7_IRQHandler,    /* DMA1 Channel 4, Channel 5, Channel 6 and Channel 7*/
    ADC1_COMP_IRQHandler,              /* ADC1, COMP1 and COMP2        */
    LPTIM1_IRQHandler,                 /* LPTIM1                       */
    0,                                 /* Reserved                     */
    TIM2_IRQHandler,                   /* TIM2                         */
    0,                                 /* Reserved                     */
    TIM6_DAC_IRQHandler,               /* TIM6 and DAC                 */
    0,                                         /* Reserved                     */
    0,                                         /* Reserved                     */
    TIM21_IRQHandler,                  /* TIM21                        */
    0,                                 /* Reserved                     */
    TIM22_IRQHandler,                  /* TIM22                        */
    I2C1_IRQHandler,                   /* I2C1                         */
    I2C2_IRQHandler,                   /* I2C2                         */
    SPI1_IRQHandler,                   /* SPI1                         */
    SPI2_IRQHandler,                   /* SPI2                         */
    USART1_IRQHandler,                 /* USART1                       */
    USART2_IRQHandler,                 /* USART2                       */
    RNG_LPUART1_IRQHandler,            /* RNG and LPUART1              */
    LCD_IRQHandler,                    /* LCD                          */
    USB_IRQHandler                     /* USB                          */
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