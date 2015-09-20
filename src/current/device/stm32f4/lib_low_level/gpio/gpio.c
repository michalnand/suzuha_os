#include "gpio.h"


void gpio_init()
{
	GPIO_InitTypeDef  GPIO_InitStructure;

	RCC_AHB1PeriphClockCmd(RCC_AHB1Periph_GPIOA, ENABLE);
	RCC_AHB1PeriphClockCmd(RCC_AHB1Periph_GPIOB, ENABLE);
	RCC_AHB1PeriphClockCmd(RCC_AHB1Periph_GPIOC, ENABLE);
	RCC_AHB1PeriphClockCmd(RCC_AHB1Periph_GPIOD, ENABLE);
  RCC_AHB1PeriphClockCmd(RCC_AHB1Periph_GPIOD, ENABLE);
	RCC_AHB1PeriphClockCmd(RCC_AHB1Periph_GPIOE, ENABLE);
	RCC_AHB1PeriphClockCmd(RCC_AHB1Periph_GPIOF, ENABLE);

	GPIO_InitStructure.GPIO_Pin = LED_1 | LED_2 | LED_3;
	GPIO_InitStructure.GPIO_Mode = GPIO_Mode_OUT;
	GPIO_InitStructure.GPIO_OType = GPIO_OType_PP;
	GPIO_InitStructure.GPIO_Speed = GPIO_Speed_100MHz;
	GPIO_InitStructure.GPIO_PuPd = GPIO_PuPd_NOPULL;

	GPIO_Init(GPIO_BASE, &GPIO_InitStructure);


	GPIO_InitStructure.GPIO_Pin = KEY_1;
    GPIO_InitStructure.GPIO_Mode = GPIO_Mode_IN;
    GPIO_InitStructure.GPIO_Speed = GPIO_Speed_50MHz;
    GPIO_Init(KEY_GPIO, &GPIO_InitStructure);



	GPIO_InitStructure.GPIO_Pin = LED_W;
	GPIO_InitStructure.GPIO_Mode = GPIO_Mode_OUT;
	GPIO_InitStructure.GPIO_OType = GPIO_OType_PP;
	GPIO_InitStructure.GPIO_Speed = GPIO_Speed_100MHz;
	GPIO_InitStructure.GPIO_PuPd = GPIO_PuPd_NOPULL;

	GPIO_Init(LED_W_GPIO_BASE, &GPIO_InitStructure);

	//LED_W_GPIO_BASE->BSRRL = LED_W;
	GPIO_SetBits(LED_W_GPIO_BASE, LED_W);

	led_off(LED_1);
  	led_off(LED_2);
  	led_off(LED_3);
}

void led_on(u32 led)
{
	__disable_irq();

	GPIO_BASE->BSRRL = led;

	__enable_irq();
}

void led_off(u32 led)
{
	__disable_irq();

	GPIO_BASE->BSRRH = led;

	__enable_irq();
}

u32 get_key()
{
	return ((~GPIO_ReadInputData(KEY_GPIO))&KEY_1);
}
