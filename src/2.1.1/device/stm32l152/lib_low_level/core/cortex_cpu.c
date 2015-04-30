#include "cortex_cpu.h"



void sys_tick_init()
{
  SysTick->LOAD  = 20000;                          /* set reload register */
  SysTick->VAL   = 0;                             /* Load the SysTick Counter Value */
  SysTick->CTRL  = SysTick_CTRL_CLKSOURCE_Msk |
                   SysTick_CTRL_TICKINT_Msk   |
                   SysTick_CTRL_ENABLE_Msk;       /* Enable SysTick IRQ and SysTick */
}

/* sleep cpu */
void sleep()
{
  __asm volatile("wfi");
}


void msi_clock_setup()
{
  /* Configure the System Clock to MSI*/

  /* RCC system reset */
  RCC_DeInit();

  /* Enable the PWR APB1 Clock */
  RCC_APB1PeriphClockCmd(RCC_APB1Periph_PWR, ENABLE);
  
  /* Select the Voltage Range 2 (1.5V) */
  PWR_VoltageScalingConfig(PWR_VoltageScaling_Range2);
  
  /* Wait Until the Voltage Regulator is ready */
  while(PWR_GetFlagStatus(PWR_FLAG_VOS) != RESET)
  	__asm("nop");
        
  /* HCLK = SYSCLK/2 = ~32KHz */
  RCC_HCLKConfig(RCC_SYSCLK_Div2);

  /* PCLK2 = HCLK */
  RCC_PCLK2Config(RCC_HCLK_Div1);

  /* PCLK1 = HCLK */
  RCC_PCLK1Config(RCC_HCLK_Div1);

  /* Set MSI clock range to 2.097 MHz */
  					//RCC_MSIRangeConfig(RCC_MSIRange_5);

  /* Set MSI clock range to 1.048 MHz */
  RCC_MSIRangeConfig(RCC_MSIRange_4);

  
  /* Select MSI as system clock source */
  RCC_SYSCLKConfig(RCC_SYSCLKSource_MSI);

  /* Wait till PLL is used as system clock source */
  while (RCC_GetSYSCLKSource() != 0x00)
  	__asm("nop");
}

void system_clock_init(void) 
{ 
	SystemInit(); 
	msi_clock_setup();
}