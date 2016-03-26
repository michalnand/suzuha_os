#include "lib_low_level.h"

// Memory locations defined by the linker
extern unsigned int __heap_start[];
extern unsigned int __StackTop[];
extern unsigned int __data_start__[], __data_end__[];
extern unsigned int __bss_start__[], __bss_end__[];
extern unsigned int __etext[];                // End of code/flash

void _reset_init(void)    __attribute__((naked, aligned(2)));
extern int main(void);

//  Default interrupt handler
void __attribute__((interrupt("IRQ"))) Default_Handler()
{

}

// Handle hard faults
static void __attribute__((naked)) HardFault_Handler(void)
{
    u32 loops;
    while (1)
    {
        led_on(LED_1);
        loops = 3000000;
        while (loops--)
            __asm("nop");


        led_off(LED_1);
        loops = 3000000;
        while (loops--)
            __asm("nop");
    }
}

/* Weak definitions of handlers point to Default_Handler if not implemented */
void NMI_Handler()          __attribute__ ((weak, alias("Default_Handler")));
void SVC_Handler()          __attribute__ ((weak, alias("Default_Handler")));
void PendSV_Handler()          __attribute__ ((weak, alias("Default_Handler")));
void SysTick_Handler()          __attribute__ ((weak, alias("Default_Handler")));

void WWDG_IRQHandler() __attribute__ ((weak, alias("Default_Handler")));
void PVD_IRQHandler() __attribute__ ((weak, alias("Default_Handler")));
void RTC_IRQHandler() __attribute__ ((weak, alias("Default_Handler")));
void FLASH_IRQHandler() __attribute__ ((weak, alias("Default_Handler")));
void RCC_IRQHandler() __attribute__ ((weak, alias("Default_Handler")));
void EXTI0_1_IRQHandler() __attribute__ ((weak, alias("Default_Handler")));
void EXTI2_3_IRQHandler() __attribute__ ((weak, alias("Default_Handler")));
void EXTI4_15_IRQHandler() __attribute__ ((weak, alias("Default_Handler")));
void DMA1_Channel1_IRQHandler() __attribute__ ((weak, alias("Default_Handler")));
void DMA1_Channel2_3_IRQHandler() __attribute__ ((weak, alias("Default_Handler")));
void DMA1_Channel4_5_IRQHandler() __attribute__ ((weak, alias("Default_Handler")));
void ADC1_IRQHandler() __attribute__ ((weak, alias("Default_Handler")));
void TIM1_BRK_UP_TRG_COM_IRQHandler() __attribute__ ((weak, alias("Default_Handler")));
void TIM1_CC_IRQHandler() __attribute__ ((weak, alias("Default_Handler")));
void TIM2_IRQHandler() __attribute__ ((weak, alias("Default_Handler")));
void TIM3_IRQHandler() __attribute__ ((weak, alias("Default_Handler")));
void TIM14_IRQHandler() __attribute__ ((weak, alias("Default_Handler")));
void TIM16_IRQHandler() __attribute__ ((weak, alias("Default_Handler")));
void TIM17_IRQHandler() __attribute__ ((weak, alias("Default_Handler")));
void I2C1_IRQHandler() __attribute__ ((weak, alias("Default_Handler")));
void SPI1_IRQHandler() __attribute__ ((weak, alias("Default_Handler")));
void USART1_IRQHandler() __attribute__ ((weak, alias("Default_Handler")));
void BootRAM_IRQHandler() __attribute__ ((weak, alias("Default_Handler")));


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

	   WWDG_IRQHandler,
	   PVD_IRQHandler,
	   RTC_IRQHandler,
	   FLASH_IRQHandler,
	   RCC_IRQHandler,
	   EXTI0_1_IRQHandler,
	   EXTI2_3_IRQHandler,
	   EXTI4_15_IRQHandler,
	   0,
	   DMA1_Channel1_IRQHandler,
	   DMA1_Channel2_3_IRQHandler,
	   DMA1_Channel4_5_IRQHandler,
	   ADC1_IRQHandler,
	   TIM1_BRK_UP_TRG_COM_IRQHandler,
	   TIM1_CC_IRQHandler,
	   TIM2_IRQHandler,
	   TIM3_IRQHandler,
	   0,
	   0,
	   TIM14_IRQHandler,
	   0,
	   TIM16_IRQHandler,
	   TIM17_IRQHandler,
	   I2C1_IRQHandler,
	   0,
	   SPI1_IRQHandler,
	   0,
	   USART1_IRQHandler,
	   0,
	   0,
	   0,
	   0,
	   BootRAM_IRQHandler         /* @0x108. This is for boot in RAM mode for
	                             STM32F0xx devices. */
};


void _reset_init(void)
{
    // Copy values to initialize data segment
    unsigned int *fr = __etext;
    unsigned int *to = __data_start__;
    unsigned int len = __data_end__ - __data_start__;
    while(len--)
        *to++ = *fr++;

    main();
}
