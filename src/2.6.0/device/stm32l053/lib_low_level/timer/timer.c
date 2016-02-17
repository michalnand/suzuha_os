#include "timer.h"
#include "../../../../os/kernel/kernel.h"

volatile time_t __system_time__;

volatile long unsigned int __system_time__;

volatile u16 __event_timer_cnt__[EVENT_TIMER_COUNT];
volatile u16 __event_timer_csr__[EVENT_TIMER_COUNT];
volatile u16 __event_timer_flag__[EVENT_TIMER_COUNT];


/**
  * Brief   This function configures RTC.
  * Param   uint32_t New time
  * Retval  None
  */
void init_rtc(u32 time)
{
  /* RTC init mode */
  /* Configure RTC */
  /* (1) Write access for RTC registers */
  /* (2) Enable init phase */
  /* (3) Wait until it is allow to modify RTC register values */
  /* (4) set prescaler, 40kHz/64 => 625 Hz, 625Hz/625 => 1Hz */
  /* (5) New time in TR */
  /* (6) Disable init phase */
  /* (7) Disable write access for RTC registers */
  RTC->WPR = 0xCA; /* (1) */ 
  RTC->WPR = 0x53; /* (1) */
  RTC->ISR |= RTC_ISR_INIT; /* (2) */
  while((RTC->ISR & RTC_ISR_INITF)!=RTC_ISR_INITF) /* (3) */
  { 
    /* add time out here for a robust application */
  }
  RTC->PRER = 0x00010001; /* (4) */  
  RTC->TR = RTC_TR_PM | time; /* (5) */
  RTC->ISR &=~ RTC_ISR_INIT; /* (6) */
  RTC->WPR = 0xFE; /* (7) */
  RTC->WPR = 0x64; /* (7) */
 }

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

  /* Enable the peripheral clock RTC */
  /* (1) Enable the LSI */
  /* (2) Wait while it is not ready */
  /* (3) Enable PWR clock */
  /* (4) Enable write in RTC domain control register */
  /* (5) LSI for RTC clock */
  /* (6) Disable PWR clock */
  RCC->CSR |= RCC_CSR_LSION; /* (1) */
  while((RCC->CSR & RCC_CSR_LSIRDY)!=RCC_CSR_LSIRDY) /* (2) */
  { 
    /* add time out here for a robust application */
  }
  RCC->APB1ENR |= RCC_APB1ENR_PWREN; /* (3) */
  PWR->CR |= PWR_CR_DBP; /* (4) */
  RCC->CSR = (RCC->CSR & ~RCC_CSR_RTCSEL) | RCC_CSR_RTCEN | RCC_CSR_RTCSEL_1; /* (5) */
  RCC->APB1ENR &=~ RCC_APB1ENR_PWREN; /* (7) */

  /* Configure RTC */
  /* (7) Write access for RTC regsiters */
  /* (8) Disable wake up timerto modify it */
  /* (9) Wait until it is allow to modify wake up reload value */
  /* (10) Modify wake upvalue reload counter to have a wake up each 1Hz */
  /* (11) Enable wake up counter and wake up interrupt */
  /* (12) Disable write access */
  RTC->WPR = 0xCA; /* (7) */
  RTC->WPR = 0x53; /* (7) */
  RTC->CR &=~ RTC_CR_WUTE; /* (8) */
  while((RTC->ISR & RTC_ISR_WUTWF) != RTC_ISR_WUTWF) /* (9) */
  { 
    /* add time out here for a robust application */
  }
  // RTC->WUTR = 0x9C0; /* (10) */
  RTC->WUTR = 25; /* (10) */
  RTC->CR = RTC_CR_WUTE | RTC_CR_WUTIE; /* (11) */
  RTC->WPR = 0xFE; /* (12) */
  RTC->WPR = 0x64; /* (12) */
  
  /* Configure exti and nvic for RTC IT */
  /* Note: the define for the EXTI20 are not done in the stm32l053xx.h */
  /* (13) unmask line 20 */
  /* (14) Rising edge for line 20 */
  /* (15) Set priority */
  /* (16) Enable RTC_IRQn */
  EXTI->IMR |= ((uint32_t)0x00100000); /* (13) */ 
  EXTI->RTSR |= ((uint32_t)0x00100000); /* (14) */ 
  NVIC_SetPriority(RTC_IRQn, 0); /* (15) */ 
  NVIC_EnableIRQ(RTC_IRQn); /* (16) */ 
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
