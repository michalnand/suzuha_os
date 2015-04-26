#include "lib_low_level.h"







/**
  * Brief   This function configures the system clock @16MHz and voltage scale 1
  *         assuming the registers have their reset value before the call.
  *         POWER SCALE   = RANGE 1
  *         SYSTEM CLOCK  = PLL MUL8 DIV2
  *         PLL SOURCE    = HSI/4
  *         FLASH LATENCY = 0
  * Param   None
  * Retval  None
  */
void SystemClock_Config(void)
{
  /* (1) Enable power interface clock */
  /* (2) Select voltage scale 1 (1.65V - 1.95V) 
         i.e. (01)  for VOS bits in PWR_CR */
  /* (3) Enable HSI divided by 4 in RCC-> CR */
  /* (4) Wait for HSI ready flag and HSIDIV flag */
  /* (5) Set PLL on HSI, multiply by 8 and divided by 2 */
  /* (6) Enable the PLL in RCC_CR register */
  /* (7) Wait for PLL ready flag */
  /* (8) Select PLL as system clock */
  /* (9) Wait for clock switched on PLL */
  RCC->APB1ENR |= (RCC_APB1ENR_PWREN); /* (1) */
  PWR->CR = (PWR->CR & ~(PWR_CR_VOS)) | PWR_CR_VOS_0; /* (2) */
  
  RCC->CR |= RCC_CR_HSION | RCC_CR_HSIDIVEN; /* (3) */
  while ((RCC->CR & (RCC_CR_HSIRDY |RCC_CR_HSIDIVF)) != (RCC_CR_HSIRDY |RCC_CR_HSIDIVF)) /* (4) */
  {
    __asm("nop");   
  }
 
  RCC->CFGR |= RCC_CFGR_PLLSRC_HSI | RCC_CFGR_PLLMUL8 | RCC_CFGR_PLLDIV2; /* (5) */

 // RCC->CFGR |= RCC_CFGR_PLLSRC_HSI |  RCC_CFGR_PLLDIV4; /* (5) */
  RCC->CR |= RCC_CR_PLLON; /* (6) */
  while ((RCC->CR & RCC_CR_PLLRDY)  == 0) /* (7) */
  {
    __asm("nop");     
  }
  RCC->CFGR |= RCC_CFGR_SW_PLL; /* (8) */
  while ((RCC->CFGR & RCC_CFGR_SWS_PLL)  == 0) /* (9) */
  {
    __asm("nop");      
  }
}

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

void lib_low_level_init()
{
	SystemInit();
	SystemClock_Config_MSI();

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
}
