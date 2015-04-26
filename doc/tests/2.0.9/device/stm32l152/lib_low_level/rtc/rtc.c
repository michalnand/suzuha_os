#include "rtc.h"
#include "stm32l1xx_rtc.h" 


volatile unsigned long int  __rtc_system_time__;


void rtc_init()
{
	NVIC_InitTypeDef NVIC_InitStructure;
	EXTI_InitTypeDef EXTI_InitStructure;
	RTC_InitTypeDef RTC_InitStructure;

	__rtc_system_time__ = 0;

	/* Enable the PWR clock */
	RCC_APB1PeriphClockCmd(RCC_APB1Periph_PWR, ENABLE);

	/* Allow access to RTC */
	PWR_RTCAccessCmd(ENABLE);
 
	/* LSI used as RTC source clock */
	/* The RTC Clock may varies due to LSI frequency dispersion. */  
	/* Enable the LSI OSC */
	//RCC_LSICmd(ENABLE);
	RCC_LSEConfig(RCC_LSE_ON);
  
	/* Wait till LSI is ready */ 
	while(RCC_GetFlagStatus(RCC_FLAG_LSERDY) == RESET)
		__asm("nop");

	/* Select the RTC Clock Source */
	RCC_RTCCLKConfig(RCC_RTCCLKSource_LSE);
   
	/* Enable the RTC Clock */
	RCC_RTCCLKCmd(ENABLE);
	
	/* Wait for RTC APB registers synchronisation */
	RTC_WaitForSynchro();
	
	/* Calendar Configuration */
	RTC_InitStructure.RTC_AsynchPrediv = 16; //0x7F;
	RTC_InitStructure.RTC_SynchPrediv =  32; //0x120; /* (37KHz / 128) - 1 = 0x120*/
	RTC_InitStructure.RTC_HourFormat = RTC_HourFormat_24;
	RTC_Init(&RTC_InitStructure); 

	/*
39.  To enable the RTC Wakeup interrupt, the following sequence is required:
40.  1. Configure and enable the EXTI Line 20 in interrupt mode and select the rising edge
41.  sensitivity.
42.  2. Configure and enable the RTC_WKUP IRQ channel in the NVIC.
43.  3. Configure the RTC to generate the RTC wakeup timer event.
44.   
45.  System reset, as well as low power modes (Sleep, Stop and Standby) have no influence on
46.  the wakeup timer.
47.  */

	/* EXTI configuration *******************************************************/
	EXTI_ClearITPendingBit(EXTI_Line20);
	EXTI_InitStructure.EXTI_Line = EXTI_Line20;
	EXTI_InitStructure.EXTI_Mode = EXTI_Mode_Interrupt;
	EXTI_InitStructure.EXTI_Trigger = EXTI_Trigger_Rising;
	EXTI_InitStructure.EXTI_LineCmd = ENABLE;
	EXTI_Init(&EXTI_InitStructure);
  
	/* Enable the RTC Wakeup Interrupt */
	NVIC_InitStructure.NVIC_IRQChannel = RTC_WKUP_IRQn;
	NVIC_InitStructure.NVIC_IRQChannelPreemptionPriority = 0;
	NVIC_InitStructure.NVIC_IRQChannelSubPriority = 0;
	NVIC_InitStructure.NVIC_IRQChannelCmd = ENABLE;
	NVIC_Init(&NVIC_InitStructure);
  
	RTC_WakeUpCmd(DISABLE);
	PWR_RTCAccessCmd(ENABLE);

	/* 3.1.3 from AN3371 using hardware RTC
	RTC->CR
	WUCKSEL -> (only when RTC->CR WUTE = 0; RTC->ISR WUTWF = 1)
	000: RTC/16 clock is selected
	001: RTC/8 clock is selected
	010: RTC/4 clock is selected
	011: RTC/2 clock is selected
	10x: ck_spre (usually 1 Hz) clock is selected
	11x: ck_spre (usually 1 Hz) clock is selected and 216 is added to the WUT counter value
	from 1s to 18 hours when WUCKSEL [2:1] = 10
	WUTE - Enable Control Bit
	WUTIE - Interrupt enable bit
	RTC->ISR
	WUTF - efent flag
	*/


	RTC_WakeUpClockConfig(RTC_WakeUpClock_CK_SPRE_16bits);
	RTC_SetWakeUpCounter(0x0);

	//The WUTF flag must then be cleared by software.
	RTC_ClearITPendingBit(RTC_IT_WUT); //ClearITPendingBit clears also the flag
	//RTC_ClearFlag(RTC_FLAG_WUTF); //MANDATORY!
	RTC_ITConfig(RTC_IT_WUT, ENABLE); //enable interrupt
	RTC_WakeUpCmd(ENABLE);
	PWR_RTCAccessCmd(DISABLE); //just in case
}
 


void RTC_WKUP_IRQHandler(void)
{
	if (RTC_GetITStatus(RTC_IT_WUT) != RESET) 
	{
		EXTI_ClearITPendingBit(EXTI_Line20); //OK
		PWR_RTCAccessCmd(ENABLE);
		RTC_ClearITPendingBit(RTC_IT_WUT);
		RTC_ClearFlag(RTC_FLAG_WUTF);
		PWR_RTCAccessCmd(DISABLE);
		

		// GPIO_ToggleBits( GPIOB, GPIO_Pin_6 );

		__rtc_system_time__+= 32;
	}
}


time_t rtc_timer_get_time()
{
	volatile unsigned long int  time;
	
	__disable_irq();
	time = __rtc_system_time__;
	__enable_irq();
	
	return (time);
}

void rtc_timer_delay_ms(u32 ms)
{
	volatile unsigned long int  time_end = (unsigned long int )ms + rtc_timer_get_time();
	while (time_end > rtc_timer_get_time())
		//sleep();
	{
		PWR->CR |= PWR_CR_LPSDSR;
		PWR_EnterSTOPMode(PWR_Regulator_LowPower, PWR_STOPEntry_WFI);
		 
		}
		
}