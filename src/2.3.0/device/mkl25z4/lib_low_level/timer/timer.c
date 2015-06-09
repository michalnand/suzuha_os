#include "timer.h"

volatile time_t __system_time__;

volatile u16 __event_timer_cnt__[EVENT_TIMER_COUNT];
volatile u16 __event_timer_csr__[EVENT_TIMER_COUNT];
volatile u16 __event_timer_flag__[EVENT_TIMER_COUNT];


void timer_init()
{
	u32 i;
	for (i = 0; i < EVENT_TIMER_COUNT; i++)
	{
		__event_timer_cnt__[i] = 1024;
		__event_timer_csr__[i] = 1024;
		__event_timer_flag__[i] = 0;
	}

	__system_time__ = 0;
	

	SIM_SCGC6 |= SIM_SCGC6_PIT_MASK;         	// Turn on clock to to the PIT module
	
	/*use periodic interval timer*/
	PIT_LDVAL0 = (u32)24000000/EVENT_TIMER_FREQUENCY;// timer frequency 10000Hz, using 24MHz clock
	PIT_MCR = PIT_MCR_FRZ_MASK;              	// Enable clock for PIT, freeze PIT in debug mode
	PIT_TCTRL0 = PIT_TCTRL_TIE_MASK |        	// Enable PIT interrupt
	PIT_TCTRL_TEN_MASK;          // and PIT

  	//Enable PIT interrupt on NVIC   
	NVIC_ICPR |= 1 << ((INT_PIT - 16) % 32);
	NVIC_ISER |= 1 << ((INT_PIT - 16) % 32); 
}

void PIT_IRQHandler()
{
	u32 i;
	for (i = 0; i < EVENT_TIMER_COUNT; i++)
	{
		if (__event_timer_cnt__[i])
			__event_timer_cnt__[i]--;
		else
		{
			__event_timer_cnt__[i] = __event_timer_csr__[i];
			__event_timer_flag__[i] = 1;
		}
	}
	__system_time__++;
	PIT_TFLG0 |= PIT_TFLG_TIF_MASK;              // Clear PIT interrupt flag
}


void timer_delay_loops(u32 loops)
{
	while (loops--)
		__asm("nop");
}

time_t timer_get_time()
{
	volatile time_t time;
	
	__disable_irq();
	time = __system_time__;
	__enable_irq();
	
	return (time/10);	/*1ms resolution*/
}

void timer_delay_ms(u32 ms)
{
	volatile time_t time_end = (time_t)ms + timer_get_time();
	while (time_end > timer_get_time())
		sleep();
}


void event_timer_set_period(u32 id, u16 period)
{
	__disable_irq();
	__event_timer_cnt__[id] = period;
	__event_timer_csr__[id] = period;
	__event_timer_flag__[id] = 0;
	__enable_irq();
}

void event_timer_wait(u32 id)
{
	while (__event_timer_flag__[id] == 0)
		sleep();

	__disable_irq();
	__event_timer_flag__[id] = 0;
	__enable_irq();
}

u32 event_timer_get_flag(u32 id)
{
	volatile u32 res;
	__disable_irq();
	res = __event_timer_flag__[id];
	__enable_irq();

	return res;
}

void event_timer_clear_flag(u32 id)
{
	__disable_irq();
	__event_timer_flag__[id] = 0;
	__enable_irq();
}