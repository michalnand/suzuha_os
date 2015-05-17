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


	/*use low power timer*/
	SIM->SCGC5|= SIM_SCGC5_LPTMR_MASK;         // Enable access to LPTMR
 	LPTMR0->CSR = 0;                        	/* turn off lptrm*/

	NVIC_ClearPendingIRQ(28);
	NVIC_EnableIRQ(28);

	LPTMR0->CSR  = LPTMR_CSR_TIE_MASK;          /* enable LPTMR0 interrupt */
  	
  	#if CLOCK_SETUP==2
  	LPTMR0->PSR  = LPTMR_PSR_PCS(1);            /* input clock: MCGIRCLK = 1kHz */
  	LPTMR0->CMR  = 9;							/* interrupt 1kHz/10 = 100Hz*/
  	#else
  	LPTMR0->PSR  = LPTMR_PSR_PCS(2);            /* input clock: MCGIRCLK = 32.768kHz */
  	LPTMR0->CMR  = 7;							/* interrupt 32.768kHz/8 = 4.096kHz*/
  	#endif


	LPTMR0->CSR|= LPTMR_CSR_TEN_MASK;          /* turn on LPTMR0 */

}
	 
void LPTimer_IRQHandler()
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

	LPTMR0->CSR|= LPTMR_CSR_TCF_MASK;
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

	#if CLOCK_SETUP==2
	return time*20;
	#else
	return (time>>1);
	#endif
}

void timer_delay_ms(u32 ms)
{
	#if CLOCK_SETUP==2
	if (ms < 10)
		ms = 10;
	#endif

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
