#include "lib_low_level.h"


void lib_low_level_init()
{
  SystemInit();

	#ifdef _GPIO_H_
	gpio_init();
	#endif

	#ifdef _UART_H_
	uart_init();
	#endif

	#ifdef _TIMER_H_
	timer_init();
	#endif

	#ifdef _I2C_H_
	i2c_0_init();
	#endif

/*
  while (11)
  {
    led_on(LED_1);
    timer_delay_ms(100);
    led_off(LED_1);
    timer_delay_ms(900);
  }
  */
}
