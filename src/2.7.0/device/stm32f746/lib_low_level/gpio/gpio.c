#include "gpio.h"


void gpio_init()
{
	GPIO_InitTypeDef  GPIO_InitStructure;

	__HAL_RCC_GPIOI_CLK_ENABLE();

	GPIO_InitStructure.Pin = LED_1;
	GPIO_InitStructure.Mode = GPIO_MODE_OUTPUT_PP;
	GPIO_InitStructure.Pull = GPIO_PULLUP;
	GPIO_InitStructure.Speed = GPIO_SPEED_HIGH;

	HAL_GPIO_Init(GPIOI, &GPIO_InitStructure);

	/* By default, turn off LED */
	HAL_GPIO_WritePin(GPIOI, LED_1, GPIO_PIN_RESET);


	led_off(LED_1);

}

void led_on(u32 led)
{
	if (led == LED_1)
		HAL_GPIO_WritePin(GPIOI, LED_1, GPIO_PIN_SET);
}

void led_off(u32 led)
{
	if (led == LED_1)
		HAL_GPIO_WritePin(GPIOI, LED_1, GPIO_PIN_RESET);

}

u32 get_key()
{
	return 0;
}
