#ifndef _CORTEX_CPU_H_
#define _CORTEX_CPU_H_

#include "../lib_low_level.h"

//#define SYSTICK_FREQUENCY	((u32)CORE_CLOCK/(u32)40000) 
#define SYSTICK_FREQUENCY	((u32)CORE_CLOCK/(u32)10000)  

static inline void __enable_irq(void)		{ __asm volatile ("cpsie i"); }
static inline void __disable_irq(void)  	{ __asm volatile ("cpsid i"); }

void sys_tick_init();
uint32_t __get_MSP(void) __attribute__( ( naked ) );

void sleep();

#endif