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

	// Enable TC0 (27 is TC0)
    PMC->PMC_PCER0 = 1 << 27;
 
    // Disable TC clock
    TC0->TC_CHANNEL->TC_CCR = TC_CCR_CLKDIS;
 
    // Disable interrupts
    TC0->TC_CHANNEL->TC_IDR = 0xFFFFFFFF;
 
    // Clear status register
    TC0->TC_CHANNEL->TC_SR;
 
    // Set Mode
    TC0->TC_CHANNEL->TC_CMR = TC_CMR_CPCTRG | TC_CMR_TCCLKS_TIMER_CLOCK5;
 
 	//TODO clock setup to 1ms
    // Compare Value
    TC0->TC_CHANNEL[0].TC_RC = 31;

    //24; // 1ms
 
    // Configure and enable interrupt on RC compare
    NVIC_EnableIRQ((IRQn_Type) ID_TC0);
    TC0->TC_CHANNEL->TC_IER = TC_IER_CPCS;
 
    // Reset counter (SWTRG) and enable counter clock (CLKEN)
    TC0->TC_CHANNEL[0].TC_CCR = TC_CCR_CLKEN | TC_CCR_SWTRG;

}

void TC0_Handler()
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


	volatile u32 timer_status;
     // read status from TC0 status register
    timer_status = TC0->TC_CHANNEL->TC_SR;

    if (timer_status)
    	timer_status = 0;
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
	
	return (time);
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
