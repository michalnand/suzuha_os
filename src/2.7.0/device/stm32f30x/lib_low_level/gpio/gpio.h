#ifndef _GPIO_H_
#define _GPIO_H_

#include "../lib_low_level.h"
#include "stm32f30x_gpio.h"


#define GPIO_BASE	GPIOB

#define LED_1		((u32)(1<<15))
#define LED_G		(LED_1)

#define KEY 		(1<<9)



void gpio_init();
void led_on(u32 led);
void led_off(u32 led);
u32 get_key();

#endif
