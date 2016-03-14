#include "usr_main.h"

#include "../lib_usr/hmc5883.h"
#include "../lib_usr/mpu6050.h"
#include "../lib_usr/sh1106.h"
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

void child_thread()
{
	while(1)
	{
		led_on(LED_1);

		printf_("%u : \n", timer_get_time());
		printf_("[%i %i %i] ", g_mpu6050.ax, g_mpu6050.ay, g_mpu6050.az);
		printf_("[%i %i %i] ", g_mpu6050.gx, g_mpu6050.gy, g_mpu6050.gz);
		printf_("[%i %i %i] ", g_hmc5883.mx, g_hmc5883.my, g_hmc5883.mz);
		printf_("\n");

		led_off(LED_1);
		timer_delay_ms(300);
	}
}

void main_thread()
{
	led_on(LED_1);

	printf_(OS_WELCOME_MESSAGE);

	u32 res = hmc5883_init();

	mpu6050_init();
	LCD_SH1106_init();
	LCD_SH1106_clear_buffer(0xFF);

	create_thread(child_thread, child_thread_stack, sizeof(child_thread_stack), PRIORITY_MAX);


	while (1)
	{
		hmc5883_read();
		mpu6050_read();

		if (LCD_SH1106_flush_buffer_partial() == 0)
		{
			LCD_SH1106_clear_buffer(0);
			lcd_put_int(g_mpu6050.gx, 0, 0);
			lcd_put_int(g_mpu6050.gy, 0, 16);
			lcd_put_int(g_mpu6050.gz, 0, 32);

			lcd_put_int(g_hmc5883.mx, 64, 0);
			lcd_put_int(g_hmc5883.my, 64, 16);
			lcd_put_int(g_hmc5883.mz, 64, 32);

			u32 time = timer_get_time();
			lcd_put_int(time, 0, 48);
		}
	}
}
