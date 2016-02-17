#include "cortex_cpu.h"
#include "../stm32l0xx.h"


/**
 @brief return main stack pointer value

 @return stack pointer value
*/
uint32_t __get_MSP(void)
{
  uint32_t result;

  __asm volatile ("MRS %0, msp\n\t" 
                  "MOV r0, %0 \n\t"
                  "BX  lr     \n\t"  : "=r" (result) );
  return(result);
} 

/*set main stack pointer value*/

/**
 @brief set main stack pointer value

 @param topOfMainStack stack pointer value
*/
void __set_MSP_(u32 topOfMainStack)   
{   
  __asm volatile ("MSR msp, %0\n\t"   
                  "BX  lr     \n\t" : : "r" (topOfMainStack) );   
} 

void sys_tick_init()
{  
  SysTick->LOAD  = 5000;                       /* set reload register */
  SysTick->VAL   = 0;                                          /* Load the SysTick Counter Value */
  SysTick->CTRL  = //SysTick_CTRL_CLKSOURCE_Msk |
                   SysTick_CTRL_TICKINT_Msk   |
                   SysTick_CTRL_ENABLE_Msk;                    /* Enable SysTick IRQ and SysTi */
  
} 

void NVIC_SetVectorTable(unsigned long NVIC_VectTab, unsigned long Offset)
{
  SCB->VTOR = NVIC_VectTab | (Offset & (unsigned int)0x1FFFFF80);
}

/* sleep cpu */
void sleep()
{
 // SysTick->CTRL&=~(SysTick_CTRL_TICKINT_Msk | SysTick_CTRL_ENABLE_Msk);

  SCB->SCR |= SCB_SCR_SLEEPDEEP_Msk;
 
  PWR->CR  = (PWR->CR & (uint32_t)(~(PWR_CR_PDDS))) | PWR_CR_LPSDSR;
  PWR->CSR&=~PWR_CSR_WUF;
 
  __asm volatile("wfi");

//  SysTick->CTRL|= (SysTick_CTRL_TICKINT_Msk | SysTick_CTRL_ENABLE_Msk);
}