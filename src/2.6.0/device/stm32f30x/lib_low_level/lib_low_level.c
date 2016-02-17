#include "lib_low_level.h"


void lib_low_level_init()
{
	sytem_clock_init();

	#ifdef _GPIO_H_
	gpio_init();
	#endif

	#ifdef _UART_H_
	uart_init();  
	#endif

	#ifdef _TIMER_H_
	timer_init();
	#endif

	#ifdef _PWM_H_
	pwm_init();
	#endif
 

	#ifdef _I2C_H_
	i2c_0_init();
	#endif

/*
	#ifdef _SPI_H_
	spi_init();
	#endif

	#ifdef _ADC_H_
	adc_init();
	#endif
*/
/*
 		 while (1)
    {
        led_on(LED_1);
        u32 loops = 900000;
        while (loops--)
            __asm("nop");
        

        led_off(LED_1);
        loops = 5000000;
        while (loops--)
            __asm("nop");

       uart_write('A');
    }
*/ 
}
