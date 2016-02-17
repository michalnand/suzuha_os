#include "lib_low_level.h"

void SystemClock_Config_MSI(void)
{
  RCC->ICSCR = (RCC->ICSCR & ~RCC_ICSCR_MSIRANGE) | RCC_ICSCR_MSIRANGE_4;
  RCC->CFGR =  RCC_CFGR_SW_MSI;

/*
* Set the recommended flash settings for <= 2MHz clock.
*
* The 3 bits must be programmed strictly sequentially, but it
* is faster not to read-back the value of the ACR register in
* the middle of the sequence so use a temporary variable.
*/
  u32 tmp_acr = FLASH->ACR;
  /* Flash 0 wait state */
  tmp_acr &= ~FLASH_ACR_LATENCY;
  FLASH->ACR = tmp_acr;
  /* Disable prefetch Buffer */
  tmp_acr &= ~FLASH_ACR_PRFTEN;
  FLASH->ACR = tmp_acr;
  /* Disable 64-bit access */
 // tmp_acr &= ~FLASH_ACR_ACC64;
  FLASH->ACR = tmp_acr;
  /* Disable HSI */
  RCC->CR &= RCC_CR_HSION;
  /* Enable LPSDSR */
  PWR->CR |= PWR_CR_LPSDSR;

  u32 loops = 5000;
  while (loops--)
    __asm("nop");
}


/**
  * @brief  System Clock Configuration
  *         The system Clock is configured as follow :
  *            System Clock source            = MSI
  *            SYSCLK(Hz)                     = 2000000
  *            HCLK(Hz)                       = 2000000
  *            AHB Prescaler                  = 1
  *            APB1 Prescaler                 = 1
  *            APB2 Prescaler                 = 1
  *            Flash Latency(WS)              = 0
  *            Main regulator output voltage  = Scale3 mode
  * @retval None
  */
void SystemClock_Config(void)
{
  RCC_ClkInitTypeDef RCC_ClkInitStruct = {0};
  RCC_OscInitTypeDef RCC_OscInitStruct = {0};

  /* Enable MSI Oscillator */
  RCC_OscInitStruct.OscillatorType = RCC_OSCILLATORTYPE_MSI;
  RCC_OscInitStruct.MSIState = RCC_MSI_ON;
  RCC_OscInitStruct.MSIClockRange = RCC_MSIRANGE_5;
  RCC_OscInitStruct.MSICalibrationValue=0x00;
  RCC_OscInitStruct.PLL.PLLState = RCC_PLL_NONE;
  if (HAL_RCC_OscConfig(&RCC_OscInitStruct)!= HAL_OK)
  {
    /* Initialization Error */
    while(1);
  }

  /* Select MSI as system clock source and configure the HCLK, PCLK1 and PCLK2
     clocks dividers */
  RCC_ClkInitStruct.ClockType = (RCC_CLOCKTYPE_SYSCLK | RCC_CLOCKTYPE_HCLK | RCC_CLOCKTYPE_PCLK1 | RCC_CLOCKTYPE_PCLK2);
  RCC_ClkInitStruct.SYSCLKSource = RCC_SYSCLKSOURCE_MSI;
  RCC_ClkInitStruct.AHBCLKDivider = RCC_SYSCLK_DIV1;
  RCC_ClkInitStruct.APB1CLKDivider = RCC_HCLK_DIV1;
  RCC_ClkInitStruct.APB2CLKDivider = RCC_HCLK_DIV1;
  if (HAL_RCC_ClockConfig(&RCC_ClkInitStruct, FLASH_LATENCY_0)!= HAL_OK)
  {
    /* Initialization Error */
    while(1);
  }
  /* Enable Power Control clock */
  __HAL_RCC_PWR_CLK_ENABLE();

  /* The voltage scaling allows optimizing the power consumption when the device is
     clocked below the maximum system frequency, to update the voltage scaling value
     regarding system frequency refer to product datasheet.  */
  __HAL_PWR_VOLTAGESCALING_CONFIG(PWR_REGULATOR_VOLTAGE_SCALE3);

  /* Disable Power Control clock */
  __HAL_RCC_PWR_CLK_DISABLE();

}


void lib_low_level_init()
{
	SystemInit();
	SystemClock_Config_MSI();
  SystemClock_Config();

	#ifdef _GPIO_H_
	gpio_init();
	#endif

	#ifdef _UART_H_
	uart_init();
	#endif

	#ifdef _TIMER_H_
	timer_init();
	#endif

	#ifdef _PWM_H_
	pwm_init();
	#endif

	#ifdef _I2C_H_
	i2c_0_init();
	#endif

	#ifdef _ADC_H_
	adc_init();
	#endif

/*
  while(1)
  {
    __asm("nop");
  }*/

  u32 loops;
  while (1)
  {
    led_off(LED_1);

    loops = 100000;
    while (loops--)
      __asm("nop");

    led_on(LED_1);

    loops = 10000;
    while (loops--)
      __asm("nop");

    putc_('A');
  }
}
