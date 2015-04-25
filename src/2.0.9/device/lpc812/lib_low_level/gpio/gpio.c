#include "gpio.h"
 

void gpio_init()
{
	GPIO_DIRP0 |= LED_1 | LED_2 | LED_3;
	GPIO_SETP0 |= LED_1 | LED_2 | LED_3;
}

void led_on(u32 led)
{
	if (led&LED_1)	
		GPIO_CLRP0|= LED_1;

	if (led&LED_2)	
		GPIO_CLRP0|= LED_2;

	if (led&LED_3)	
		GPIO_CLRP0|= LED_3;
}

void led_off(u32 led)
{
	if (led&LED_1)	
		GPIO_SETP0|= LED_1;

	if (led&LED_2)	
		GPIO_SETP0|= LED_2;

	if (led&LED_3)	
		GPIO_SETP0|= LED_3;
}

u32 get_key()
{
    return 0;
}