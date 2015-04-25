#ifndef _GPIO_H_
#define _GPIO_H_

#include "../lib_low_level.h"
#include "stm32l1xx_gpio.h"

/*on GPIOB */
#define LED_1	(1<<7)
#define LED_G	(LED_1)


#define LED_2	(1<<6)
#define LED_B	(LED_2)



#define USER_KEY	(1<<9)

void gpio_init();
void led_on(u32 led);
void led_off(u32 led);


u32 get_key();

#endif
