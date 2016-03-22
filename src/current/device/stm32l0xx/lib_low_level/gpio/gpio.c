#include "gpio.h"



void gpio_init()
{
		//clock enable
		RCC->IOPENR |= RCC_IOPENR_GPIOAEN | RCC_IOPENR_GPIOBEN; /* (1) */

		GPIO_InitTypeDef  GPIO_InitStruct;

		GPIO_InitStruct.Mode  = GPIO_MODE_OUTPUT_PP;
		GPIO_InitStruct.Pull  = GPIO_PULLUP;
		GPIO_InitStruct.Speed = GPIO_SPEED_FREQ_VERY_HIGH;

		GPIO_InitStruct.Pin = LED_1;
		HAL_GPIO_Init(GPIOB, &GPIO_InitStruct);

		led_off(LED_1);
} 

void led_on(u32 led)
{
	GPIOB->BSRR = led;
}

void led_off(u32 led)
{
	GPIOB->BRR = led;
}

u32 get_key()
{
	return 0;
}
