#ifndef _GPIO_H_
#define _GPIO_H_

#include "../lib_low_level.h"

#define GPIO_BASE	GPIOA

#define LED_1	(1<<3)


#define USER_KEY	(1<<4)

void gpio_init();
void led_on(u32 led);
void led_off(u32 led);


u32 get_key();

#endif
