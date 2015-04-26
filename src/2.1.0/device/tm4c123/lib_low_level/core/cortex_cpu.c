#include "cortex_cpu.h"

/**
 @brief return main stack pointer value

 @return stack pointer value
*/

void sys_tick_init()
{
  ROM_SysTickPeriodSet(SYSTICK_FREQUENCY);

  ROM_SysTickIntEnable();
  ROM_SysTickEnable();
  ROM_IntMasterEnable();
}

uint32_t __get_MSP(void)
{
  uint32_t result = 0;

  __asm volatile ("MRS %0, msp\n\t" 
                  "MOV r0, %0 \n\t"
                  "BX  lr     \n\t"  : "=r" (result) );
  return(result);
}

void sleep()
{
    /* sleep cpu */
	__asm("WFI"); 
}