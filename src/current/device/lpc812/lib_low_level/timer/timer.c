#include "timer.h"


volatile long unsigned int __system_time__;

volatile u16 __event_timer_cnt__[EVENT_TIMER_COUNT];
volatile u16 __event_timer_csr__[EVENT_TIMER_COUNT];
volatile u16 __event_timer_flag__[EVENT_TIMER_COUNT];


typedef struct {                            /*!< (@ 0x40028000) WKT Structure          */
  	uint32_t  CTRL;                      /*!< (@ 0x40028000) Alarm/Wakeup Timer Control register */
  	uint32_t  Reserved[2];
	uint32_t  COUNT;                     /*!< (@ 0x4002800C) Alarm/Wakeup TImer counter register */
} LPC_WKT_TypeDef;

#define LPC_WKT_BASE          (0x40000000UL + 0x08000)
#define LPC_WKT               ((LPC_WKT_TypeDef    *) LPC_WKT_BASE)

#define WKT_IRQn				(u32)15

void timer_init()
{
	SYSCON_SYSAHBCLKCTRL |= (0x1 << 9);
	SYSCON_PRESETCTRL &= ~(0x1 << 9);
	SYSCON_PRESETCTRL |= (0x1 << 9);

	//LPC_WKT->CTRL |= (1<<0);
	LPC_WKT->CTRL &=~(1<<0);

  	LPC_WKT->COUNT = CORE_CLOCK/((u32)12000);
	
  	// NVIC_EnableIRQ(WKT_IRQn); 
  	NVIC_ICER0 = (1 << ((uint32_t)(WKT_IRQn) & 0x1F));
  	NVIC_ISER0 = (1 << ((uint32_t)(WKT_IRQn) & 0x1F));
}

void WKT_Handler() 
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

	LPC_WKT->CTRL|= (1<<1);			/* clear interrupt flag */
  	LPC_WKT->COUNT = CORE_CLOCK/((u32)12000); 
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
	// timer_delay_loops(12000*ms); 

	volatile long unsigned int time_end = (long unsigned int)ms + timer_get_time();
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
