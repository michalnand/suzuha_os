#include "timer.h"
#include "../../../../os/kernel/kernel.h"

volatile time_t __system_time__;

volatile u16 __event_timer_cnt__[EVENT_TIMER_COUNT];
volatile u16 __event_timer_csr__[EVENT_TIMER_COUNT];
volatile u16 __event_timer_flag__[EVENT_TIMER_COUNT];


static void LSI_ClockEnable(void)
{
  RCC_OscInitTypeDef RCC_OscInitStruct;

  RCC_OscInitStruct.OscillatorType = RCC_OSCILLATORTYPE_LSI;
  RCC_OscInitStruct.LSIState = RCC_LSI_ON;
  RCC_OscInitStruct.PLL.PLLState = RCC_PLL_NONE;

  HAL_RCC_OscConfig(&RCC_OscInitStruct);
}

static void LSE_ClockEnable(void)
{
  RCC_OscInitTypeDef RCC_OscInitStruct;

  /* Enable LSE clock */
  RCC_OscInitStruct.OscillatorType = RCC_OSCILLATORTYPE_LSE;
  RCC_OscInitStruct.LSEState = RCC_LSE_ON;
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

  /*
  TIM_HandleTypeDef    TimHandle;

  __HAL_RCC_TIM2_CLK_ENABLE();

   TimHandle.Instance = TIM2;
   TimHandle.Init.Period            = 250-1;
   TimHandle.Init.Prescaler         = 8*16;
   TimHandle.Init.ClockDivision     = 0;
   TimHandle.Init.CounterMode       = TIM_COUNTERMODE_UP;

   HAL_TIM_Base_Init(&TimHandle);

   HAL_TIM_Base_Start_IT(&TimHandle);

   HAL_NVIC_SetPriority(TIM2_IRQn, 4, 0);

   HAL_NVIC_EnableIRQ(TIM2_IRQn);

   return;
   */

   u32 Period  = 1000;
   u32 Timeout = 500 - 1;

   LSI_ClockEnable();

   RCC_PeriphCLKInitTypeDef        RCC_PeriphCLKInitStruct;

   /* ### - 1 - Re-target the LSE to Clock the LPTIM Counter ################# */
   /* Select the LSI clock as LPTIM peripheral clock */
   RCC_PeriphCLKInitStruct.PeriphClockSelection = RCC_PERIPHCLK_LPTIM1;
   RCC_PeriphCLKInitStruct.LptimClockSelection = RCC_LPTIM1CLKSOURCE_HSI;
   HAL_RCCEx_PeriphCLKConfig(&RCC_PeriphCLKInitStruct);

   LPTIM_HandleTypeDef             LptimHandle;


   LptimHandle.Instance = LPTIM1;

   LptimHandle.Init.Clock.Source       = LPTIM_CLOCKSOURCE_APBCLOCK_LPOSC;
   LptimHandle.Init.Clock.Prescaler    = LPTIM_PRESCALER_DIV1;
   LptimHandle.Init.Trigger.Source     = LPTIM_TRIGSOURCE_0;
   LptimHandle.Init.Trigger.ActiveEdge = LPTIM_ACTIVEEDGE_RISING;
   LptimHandle.Init.CounterSource      = LPTIM_COUNTERSOURCE_INTERNAL;

   /* Initialize LPTIM peripheral according to the passed parameters */
   HAL_LPTIM_Init(&LptimHandle);


   /* ### - 3 - Start the Timeout function in interrupt mode ################# */
   /*
    *  Period = 65535
    *  Pulse  = 32767
    *  According to this configuration (LPTIMER clocked by LSE & compare = 32767,
    *  the Timeout period = (compare + 1)/LSE_Frequency = 1s
    */
    HAL_LPTIM_TimeOut_Start_IT(&LptimHandle, Period, Timeout);

   /* ### - 4 - Enter in Stop mode ########################################### */
   //HAL_PWR_EnterSTOPMode(PWR_LOWPOWERREGULATOR_ON, PWR_STOPENTRY_WFI);



   /* Initialize LPTIM peripheral according to the passed parameters */

   HAL_LPTIM_Init(&LptimHandle);
   HAL_LPTIM_TimeOut_Start_IT(&LptimHandle, Period, Timeout);

   HAL_NVIC_EnableIRQ(LPTIM1_IRQn);
}


void LPTIM1_IRQHandler()
{
  led_on(LED_1);
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

  //led_off(LED_1);
  __system_time__+= 10;

  LPTIM1->ICR = LPTIM_FLAG_CMPM;
}


void TIM2_IRQHandler()
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

  TIM2->SR = 0;
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
	__event_timer_cnt__[id] = period/10;
	__event_timer_csr__[id] = period/10;
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
