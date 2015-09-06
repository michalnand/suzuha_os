#ifndef _GPIO_H_
#define _GPIO_H_

#include "../lib_low_level.h"

#define CORE_CLOCK			80000000

#define LED_1	(1<<0)
#define LED_2	(1<<1) 
#define LED_3	(1<<2)


#define LED_0	LED_1
#define LED_R LED_1
#define LED_G LED_2
#define LED_B LED_3


#define KEY_1	(1<<4)	/*PF4*/
#define KEY_2	(1<<0)	/*PF0*/


void gpio_init();
void led_on(u32 led);
void led_off(u32 led);
u32 get_key();
#endif
