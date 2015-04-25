#ifndef _GPIO_H_
#define _GPIO_H_

#include "../lib_low_level.h"

#define LED_1	(19)
#define LED_2	(18)
#define LED_3	(17) 

#define LED_R	(LED_1)
#define LED_G	(LED_2)
#define LED_B	(LED_3)

#define KEY_USER_1	(16)
#define KEY_USER_2	(11)

void gpio_init();
void led_on(u32 led);
void led_off(u32 led);
u32 get_key();

#endif
