#include "gpio.h"

 
  
void gpio_init()
{
	  /* (1) Enable the peripheral clock of GPIOA and GPIOB */
	  /* (2) Select input mode (00) on GPIOA pin 0 
	         and output mode (01) on GPIOA pin 5 */
	  /* (3) Select output mode (01) on GPIOB pin 4 */
	  /* (4) Select Pull-down (10) for PA0 */
	  
	  RCC->IOPENR |= RCC_IOPENR_GPIOAEN | RCC_IOPENR_GPIOBEN; /* (1) */  
	  
	  GPIOA->MODER = (GPIOA->MODER & ~(GPIO_MODER_MODE0 | GPIO_MODER_MODE5)) 
	               | (GPIO_MODER_MODE5_0); /* (2) */  
	  
	  GPIOB->MODER = (GPIOB->MODER & ~(GPIO_MODER_MODE4)) 
	               | (GPIO_MODER_MODE4_0); /* (3) */ 

	  GPIOA->PUPDR = (GPIOA->PUPDR & ~(GPIO_PUPDR_PUPD0)); /* (4) */


    led_off(LED_1);
    led_off(LED_2);
    led_off(LED_3);
}

void led_on(u32 led)
{
	GPIOA->BSRR = led;
}

void led_off(u32 led)
{
	GPIOA->BRR = led;
}

u32 get_key()
{
	return 0;
}