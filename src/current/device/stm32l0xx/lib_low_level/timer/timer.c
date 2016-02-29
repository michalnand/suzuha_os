#include "timer.h"
#include "../../../../os/kernel/kernel.h"

#define RTC_CLOCK_SOURCE_LSI
/*#define RTC_CLOCK_SOURCE_LSE*/

#ifdef RTC_CLOCK_SOURCE_LSI
#define RTC_ASYNCH_PREDIV    0x7F
#define RTC_SYNCH_PREDIV     0x0130
#endif

#ifdef RTC_CLOCK_SOURCE_LSE
#define RTC_ASYNCH_PREDIV  0x7F
#define RTC_SYNCH_PREDIV   0x00FF
#endif


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

}

void RTC_IRQHandler()
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

	__system_time__+= 10;


	RTC->ISR &=~ RTC_ISR_WUTF; /* Reset Wake up flag */
  EXTI->PR |= ((uint32_t)0x00100000); /* clear exti line 20 flag */
}

void timer_delay_loops(u32 loops)
{
	while (loops--)
		__asm("nop");
}

long unsigned int timer_get_time()
{
	volatile long unsigned int time;

	__disable_irq();
	time = __system_time__;
	__enable_irq();

	return (time);
}

void timer_delay_ms(u32 ms)
{
	volatile long unsigned int time_end = (long unsigned int)ms + timer_get_time();
	while (time_end > timer_get_time())
  {
    yield();
		sleep();
  }
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
