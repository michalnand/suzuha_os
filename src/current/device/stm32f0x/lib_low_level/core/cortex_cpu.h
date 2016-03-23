#ifndef _CORTEX_CPU_H_
#define _CORTEX_CPU_H_

#include "../lib_low_level.h"

#include "stm32f0xx.h"
#include "system_stm32f0xx.h"

#define CORE_CLOCK			48000000

static inline void __enable_irq(void)		{ __asm volatile ("cpsie i"); }
static inline void __disable_irq(void)  	{ __asm volatile ("cpsid i"); }

static inline void * __get_MSP(void)
{
  void * result=0;
  __asm volatile("MRS %0, msp\n\t"
      : "=r" (result) );
  return result;
}

static inline void __set_MSP(u32  topOfMainStack)
{
    __asm volatile("MSR psp, %0\n\t" : : "r" (topOfMainStack) );
}

void assert_param(u32 param);
void sys_tick_init();
void sleep();

void sys_tick_trigger();

#endif
