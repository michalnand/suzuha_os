#include "gpio.h"

  
void gpio_init() 
{
	GPIO_InitTypeDef  GPIO_InitStructure;

	RCC_AHB1PeriphClockCmd(RCC_AHB1Periph_GPIOA, ENABLE);
	RCC_AHB1PeriphClockCmd(RCC_AHB1Periph_GPIOB, ENABLE);
	RCC_AHB1PeriphClockCmd(RCC_AHB1Periph_GPIOC, ENABLE);

 
	GPIO_InitStructure.GPIO_Pin = LED_1;// | LED_2 | LED_3;
	GPIO_InitStructure.GPIO_Mode = GPIO_Mode_OUT;
	GPIO_InitStructure.GPIO_OType = GPIO_OType_PP;
	GPIO_InitStructure.GPIO_Speed = GPIO_Speed_100MHz;
	GPIO_InitStructure.GPIO_PuPd = GPIO_PuPd_NOPULL;

	GPIO_Init(GPIO_BASE, &GPIO_InitStructure);

 

	led_off(LED_1);
	//led_off(LED_2);
	//led_off(LED_3);
}

void led_on(u32 led)
{
	GPIO_BASE->BSRRL = led;
}

void led_off(u32 led)
{
	GPIO_BASE->BSRRH = led;
}

u32 get_key()
{
	return 0;
}