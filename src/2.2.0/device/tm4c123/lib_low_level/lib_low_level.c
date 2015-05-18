#include "lib_low_level.h"


void sytem_clock_init()
{
	ROM_SysCtlClockSet(SYSCTL_SYSDIV_4|SYSCTL_USE_PLL|SYSCTL_XTAL_16MHZ|SYSCTL_OSC_MAIN);
}

void lib_low_level_init()
{
	sytem_clock_init();

	ROM_FPUEnable();

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

	#ifdef _SPI_H_
	spi_init();
	#endif

	#ifdef _ADC_H_
	adc_init();
	#endif

	#ifdef _LCD_H_
	lcd_init();
	#endif

	#ifdef _LCD_SHARP96_H_
	lcd_sharp96_init();
	#endif
}
