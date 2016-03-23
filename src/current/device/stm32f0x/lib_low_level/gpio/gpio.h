#ifndef _GPIO_H_
#define _GPIO_H_

#include "../lib_low_level.h"


#define GPIO_BASE	GPIOB

#define LED_1		((u32)(1<<3))

#define LED_R_GPIO  GPIOA
#define LED_R   ((u32)(1<<8))

#define LED_G_GPIO GPIOA
#define LED_G   ((u32)(1<<11))

#define LED_B_GPIO GPIOA
#define LED_B   ((u32)(1<<1))

void gpio_init();
void led_on(u32 led);
void led_off(u32 led);
u32 get_key();

#endif
