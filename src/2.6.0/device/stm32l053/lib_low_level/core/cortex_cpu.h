#ifndef _CORTEX_CPU_H_
#define _CORTEX_CPU_H_

#include "../lib_low_level.h"

#include "../stm32l0xx.h"
#include "system_stm32l0xx.h"

#define CORE_CLOCK			48000000


#define NVIC_VectTab_FLASH      (0x08000000)
#define NVIC_VectTab_RAM        (0x20000000)


static inline void __enable_irq(void)		{ __asm volatile ("cpsie i"); }
static inline void __disable_irq(void)  	{ __asm volatile ("cpsid i"); }


uint32_t __get_MSP(void) __attribute__( ( naked ) );
void __set_MSP_(u32 topOfMainStack) __attribute__( ( naked ) );   

void sys_tick_init();
void sleep();
void system_clock_init();

#endif