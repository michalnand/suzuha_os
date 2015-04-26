#include "cortex_cpu.h"
#include "systick.h" 
/**
 @brief return main stack pointer value

 @return stack pointer value
*/
uint32_t __get_MSP(void)
{
  uint32_t result = 0;

  __asm volatile ("MOV %0, sp\n\t" 
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
  __asm volatile ("MOV sp, %0\n\t"   
                  "BX  lr     \n\t" : : "r" (topOfMainStack) );   
} 


void sys_tick_init()
{  
  SYST_RVR = 2000;
  SYST_CVR = 0;
  SYST_CSR = SysTick_CSR_ENABLE_MASK | SysTick_CSR_TICKINT_MASK | SysTick_CSR_CLKSOURCE_MASK;
} 


/* sleep cpu */
void sleep()
{
  
}


void sytem_clock_init()
{
  
}