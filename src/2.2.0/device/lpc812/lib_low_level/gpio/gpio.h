#ifndef _GPIO_H_
#define _GPIO_H_

#include "../lib_low_level.h"

/*on GPIOB */
#define LED_G	(1<<17)
#define LED_1	(LED_G)

#define LED_B	(1<<16)
#define LED_2	(LED_B)

#define LED_R	(1<<7)
#define LED_3	(LED_R)


#define USER_KEY	(1<<9)

void gpio_init();
void led_on(u32 led);
void led_off(u32 led);


u32 get_key();

#endif