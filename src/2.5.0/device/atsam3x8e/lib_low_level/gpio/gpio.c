#include "gpio.h"

  
void gpio_init()
{
	LED_G_PIO->PIO_PER = LED_G;
	LED_G_PIO->PIO_OER = LED_G;
	LED_G_PIO->PIO_PUDR = LED_G;

    led_off(LED_G);
}

void led_on(u32 led)
{
	LED_G_PIO->PIO_SODR = led;   
}

void led_off(u32 led)
{
	LED_G_PIO->PIO_CODR = led; 
}


u32 get_key()
{
   return 0;
}