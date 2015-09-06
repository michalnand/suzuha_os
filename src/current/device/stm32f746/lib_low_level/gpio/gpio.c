#include "gpio.h"


void gpio_init()
{



	led_off(LED_1);
  led_off(LED_2);
  led_off(LED_3);
}

void led_on(u32 led)
{
}

void led_off(u32 led)
{

}

u32 get_key()
{
	return 0;
}
