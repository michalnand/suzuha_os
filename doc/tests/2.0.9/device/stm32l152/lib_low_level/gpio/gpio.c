#include "gpio.h"
 
  
void gpio_init()
{
	GPIO_InitTypeDef  GPIO_InitStructure;

    RCC_AHBPeriphClockCmd(RCC_AHBPeriph_GPIOA, ENABLE);
    RCC_AHBPeriphClockCmd(RCC_AHBPeriph_GPIOB, ENABLE);
    RCC_AHBPeriphClockCmd(RCC_AHBPeriph_GPIOC, ENABLE);


    /* Configure the GPIO_LED pin */                   
    GPIO_InitStructure.GPIO_Pin = LED_1 | LED_2;
    GPIO_InitStructure.GPIO_Mode = GPIO_Mode_OUT;
    GPIO_InitStructure.GPIO_Speed = GPIO_Speed_10MHz;
    GPIO_Init(GPIOB, &GPIO_InitStructure);
 

    /* Configure the GPIO_KEY pin */                 
    GPIO_InitStructure.GPIO_Pin = USER_KEY;
    GPIO_InitStructure.GPIO_Mode = GPIO_Mode_IN;
    GPIO_InitStructure.GPIO_Speed = GPIO_Speed_10MHz;
    GPIO_Init(GPIOB, &GPIO_InitStructure);

    GPIO_WriteBit(GPIOB, LED_1, Bit_RESET);

	
	led_off(LED_1);
	led_off(LED_2);
}

void led_on(u32 led)
{
	GPIO_SetBits(GPIOB, led);
}

void led_off(u32 led)
{
	GPIO_ResetBits(GPIOB, led);
}


u32 get_key()
{
    return ((~GPIO_ReadInputData(GPIOB))&USER_KEY);
}
