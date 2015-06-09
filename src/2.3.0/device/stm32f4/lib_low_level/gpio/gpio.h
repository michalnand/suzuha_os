#ifndef _GPIO_H_
#define _GPIO_H_

#include "../lib_low_level.h"
#include "stm32f4xx_gpio.h"

/*on GPIOC */

/*

#define GPIO_BASE	GPIOC

#define LED_1	(1<<5)
#define LED_2	(1<<4)
#define LED_3	(1<<3) 
*/

/*on GPIOA*/

#define GPIO_BASE	GPIOA

#define LED_1	(1<<5)
#define LED_2	(1<<6)
#define LED_3	(1<<7) 

#define LED_0 	LED_1



#define LED_R	(LED_1)
#define LED_G	(LED_2)
#define LED_B	(LED_3) 

void gpio_init();
void led_on(u32 led);
void led_off(u32 led);
u32 get_key();

#endif