#include "cortex_cpu.h"
#include "stm32f0xx.h"

/*
void assert_param(u32 param)
{
  (void)param;
}
*/
void sys_tick_init()
{
  SysTick->LOAD  = 48000;                       /* set reload register */
  SysTick->VAL   = 0;                             /* Load the SysTick Counter Value */
  SysTick->CTRL  = SysTick_CTRL_CLKSOURCE_Msk |
                   SysTick_CTRL_TICKINT_Msk   |
                   SysTick_CTRL_ENABLE_Msk;       /* Enable SysTick IRQ */

}

/* sleep cpu */
void sleep()
{
  __asm volatile("wfi");
}


void sys_tick_trigger()
{
  /*
  __disable_irq();
  SCB->ICSR|= (1<<26);
  __enable_irq();
  __asm("nop");
  __asm("nop");
  __asm("nop");
  __asm("nop");
  */
}
