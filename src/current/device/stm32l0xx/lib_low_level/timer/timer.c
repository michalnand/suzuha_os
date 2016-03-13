#include "timer.h"
#include "../../../../os/kernel/kernel.h"

volatile time_t __system_time__;

volatile u16 __event_timer_cnt__[EVENT_TIMER_COUNT];
volatile u16 __event_timer_csr__[EVENT_TIMER_COUNT];
volatile u16 __event_timer_flag__[EVENT_TIMER_COUNT];

LPTIM_HandleTypeDef             LptimHandle;

static void LSI_ClockEnable(void)
{
  RCC_OscInitTypeDef RCC_OscInitStruct;

  /* Enable LSI clock */
  RCC_OscInitStruct.OscillatorType = RCC_OSCILLATORTYPE_LSI;
  RCC_OscInitStruct.LSIState = RCC_LSI_ON;
  RCC_OscInitStruct.PLL.PLLState = RCC_PLL_NONE;

  HAL_RCC_OscConfig(&RCC_OscInitStruct);
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

  LSI_ClockEnable();

  RCC_PeriphCLKInitTypeDef        RCC_PeriphCLKInitStruct;
  RCC_PeriphCLKInitStruct.PeriphClockSelection = RCC_PERIPHCLK_LPTIM1;
  RCC_PeriphCLKInitStruct.LptimClockSelection = RCC_LPTIM1CLKSOURCE_LSI;
  HAL_RCCEx_PeriphCLKConfig(&RCC_PeriphCLKInitStruct);

  LptimHandle.Instance = LPTIM1;

  LptimHandle.Init.Clock.Source       = LPTIM_CLOCKSOURCE_APBCLOCK_LPOSC;
  LptimHandle.Init.Clock.Prescaler    = LPTIM_PRESCALER_DIV1;
  LptimHandle.Init.Trigger.Source     = LPTIM_TRIGSOURCE_0;
  LptimHandle.Init.Trigger.ActiveEdge = LPTIM_ACTIVEEDGE_RISING;
  LptimHandle.Init.CounterSource      = LPTIM_COUNTERSOURCE_INTERNAL;

  HAL_LPTIM_Init(&LptimHandle);

  #define Period               (uint32_t) 65535
  #define Timeout              (uint32_t) (32768 - 1)

  HAL_LPTIM_TimeOut_Start_IT(&LptimHandle, Period, Timeout);


  // HAL_NVIC_SetPriority(LPTIM1_IRQn, 0 ,0);
  //HAL_NVIC_EnableIRQ(LPTIM1_IRQn);

  led_on(LED_1);

  while (1)
  {
    timer_delay_loops(1000);
  }
}

volatile u32 tmp = 0;

//void HAL_LPTIM_CompareMatchCallback(LPTIM_HandleTypeDef *hlptim)
void LPTIM1_IRQHandler()
{
  led_off(LED_1);
/*
  if ((tmp%8) == 0)
    led_on(LED_1);
  else
    led_off(LED_1);
*/
  tmp++;

    LPTIM1->ICR = LPTIM_FLAG_CMPM;
//  __HAL_LPTIM_CLEAR_FLAG(&LptimHandle, LPTIM_FLAG_CMPM);
}


/*
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

  // __HAL_LPTIM_CLEAR_FLAG(&LptimHandle, LPTIM_FLAG_CMPM);
}
*/

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
