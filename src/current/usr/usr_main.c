#include "usr_main.h"

#include "../lib_usr/hmc5883.h"
#include "../lib_usr/mpu6050.h"
#include "../lib_usr/sh1106.h"
#include "../lib_usr/apds9950.h"
#include "../lib_usr/math.h"




void lcd_put_int(i32 n, u32 x, u32 y)
{
	char flag = 0, s[12];
	u32 ptr;

	if (n < 0)
	{
			n = -n;
		flag = 1;
	}

	s[11] = '\0';
	ptr = 10;

	do
	{
			s[ptr] = '0' + (n%10);
			n/= 10;
			ptr--;
	}
		while (n != 0);

	if (flag)
		s[ptr] = '-';
	else
		ptr++;

	//puts_(s + ptr);
	u32 i;
	for (i = 0; i < 12; i++)
	{
		lcd_put_char_xy(x + i*8, y, s[ptr + i]);
		if (s[ptr + i] == '\0')
			break;
	}

}



void terminal_thread()
{
	while(1)
	{
		led_on(LED_1);

		printf_("%u : \n", timer_get_time());
		printf_("[%i %i %i] ", g_mpu6050.ax, g_mpu6050.ay, g_mpu6050.az);
		printf_("[%i %i %i] ", g_mpu6050.gx, g_mpu6050.gy, g_mpu6050.gz);
		printf_("[%i %i %i] ", g_hmc5883.mx, g_hmc5883.my, g_hmc5883.mz);
		printf_("[%i %i %i] ", g_apds9950.r, g_apds9950.g, g_apds9950.b);

		printf_("\n");

		led_off(LED_1);
		timer_delay_ms(1000);
	}
}


u32 adc_result = 0;

void adc_thread()
{
	u32 i;

	while(1)
	{
		adc_config_ch(ADC_Channel_1);

		u32 time_start = timer_get_time();
		for (i = 0; i < 10000; i++)
			adc_read();
		u32 time_stop = timer_get_time();


		adc_config_ch(ADC_Channel_0);
		adc_result = adc_read();

		printf_("ADC res %u time %u\n", adc_result, time_stop - time_start);

		timer_delay_ms(50);
	}
}



void main_thread()
{
	led_on(LED_1);

	printf_(OS_WELCOME_MESSAGE);

	hmc5883_init();
	mpu6050_init();
	apds950_init();

	m_srand(adc_random());


	LCD_SH1106_init();
	LCD_SH1106_clear_buffer(0x00);

	create_thread(terminal_thread, terminal_thread_stack, sizeof(terminal_thread_stack), PRIORITY_MAX);
	create_thread(adc_thread, adc_thread_stack, sizeof(adc_thread_stack), PRIORITY_MAX);

	event_timer_set_period(EVENT_TIMER_0_ID, 50);


	while (1)
	{
		if (event_timer_get_flag(EVENT_TIMER_0_ID))
		{
			event_timer_clear_flag(EVENT_TIMER_0_ID);
			hmc5883_read();
			mpu6050_read();
			apds9950_read();
		}


		if (LCD_SH1106_flush_buffer_partial() == 0)
		{
			LCD_SH1106_clear_buffer(0x00);

			lcd_put_int(g_mpu6050.gx_sum, 0, 0);
			lcd_put_int(g_mpu6050.gy_sum, 0, 16);
			lcd_put_int(g_mpu6050.gz_sum, 0, 32);

			lcd_put_int(g_hmc5883.mx, 64, 0);
			lcd_put_int(g_hmc5883.my, 64, 16);
			lcd_put_int(g_hmc5883.mz, 64, 32);

			lcd_put_int(g_apds9950.ambient, 0, 48);
			lcd_put_int(adc_result, 64, 48);
		}
	}
}
