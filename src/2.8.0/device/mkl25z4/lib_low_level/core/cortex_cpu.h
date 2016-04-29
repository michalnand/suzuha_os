#ifndef _CORTEX_CPU_H_
#define _CORTEX_CPU_H_

#include "../lib_low_level.h"


#ifdef LOW_POWER_MODE
#define CORE_CLOCK			10000000
#else
#define CORE_CLOCK			48000000
#endif

static inline void __enable_irq(void)		{ __asm volatile ("cpsie i"); }
static inline void __disable_irq(void)  	{ __asm volatile ("cpsid i"); }

static inline void enable_irq(int n) {
    NVIC_ICPR |= 1 << (n - 16);
    NVIC_ISER |= 1 << (n - 16);			
}

uint32_t __get_MSP(void) __attribute__( ( naked ) );
void __set_MSP_(u32 topOfMainStack) __attribute__( ( naked ) );   

void sys_tick_init();
void sleep();
void sytem_clock_init();
int pll_init(int crystal_val, unsigned char hgo_val, unsigned char erefs_val, signed char prdiv_val, signed char vdiv_val, unsigned char mcgout_select);

#endif