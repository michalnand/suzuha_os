#ifndef _GPIO_H_
#define _GPIO_H_

#include "../lib_low_level.h"
//#include "stm32f4xx_gpio.h"

#define GPIO_BASE	GPIOI

#define LED_1	(1<<1)

void gpio_init();
void led_on(u32 led);
void led_off(u32 led);
u32 get_key();

#endif
