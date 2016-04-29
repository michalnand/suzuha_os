#include "i2c_devices.h"

#ifdef EXAMPLE_I2C_DEVICES

#include "../../lib_usr/hmc5883.h"
#include "../../lib_usr/mpu6050.h"
#include "../../lib_usr/sh1106.h"
#include "../../lib_usr/apds9950.h"
#include "../../lib_usr/math.h"

#include "object_test.h"


#define THREAD_STACK_SIZE	64

thread_stack_t i2c_devices_thread_stack[THREAD_STACK_SIZE];

void i2c_devices_thread()
{
  //50ms paeriod, SW timer 0
  event_timer_set_period(EVENT_TIMER_0_ID, 50);

  hmc5883_init();   //compass
  mpu6050_init();   //gyro+acc
  apds950_init();   //rgb sensor

                      //i2c display
  LCD_SH1106_init();
  LCD_SH1106_clear_buffer(0x00);


  while (1)
  {
    if (event_timer_get_flag(EVENT_TIMER_0_ID))
		{
			event_timer_clear_flag(EVENT_TIMER_0_ID);

      led_on(LED_1);
			hmc5883_read();
			mpu6050_read();
			apds9950_read();
      led_off(LED_1);
		}

    //put data on display
		if (LCD_SH1106_flush_buffer_partial() == 0)
		{
			LCD_SH1106_clear_buffer(0x00);

			lcd_put_int(get_g_mpu6050()->gx_sum, 0, 0);
			lcd_put_int(get_g_mpu6050()->gy_sum, 0, 16);
			lcd_put_int(get_g_mpu6050()->gz_sum, 0, 32);

			lcd_put_int(get_g_hmc5883()->mx, 64, 0);
			lcd_put_int(get_g_hmc5883()->my, 64, 16);
			lcd_put_int(get_g_hmc5883()->mz, 64, 32);

			lcd_put_int(get_g_apds9950()->ambient, 0, 48);
			lcd_put_int(timer_get_time(), 64, 48);
		}
  }


}

void main_thread()
{
	led_on(LED_1);
	printf_(OS_WELCOME_MESSAGE);


	create_thread(i2c_devices_thread, i2c_devices_thread_stack, sizeof(i2c_devices_thread_stack), PRIORITY_MAX);

  ws2812_init();

  object_test_call();

	while (1)
	{
    //ws2812_demo();

    //print into terminal
    led_on(LED_1);

    printf_("%u : \n", timer_get_time());
    printf_("[%i %i %i] ", get_g_mpu6050()->ax, get_g_mpu6050()->ay, get_g_mpu6050()->az);
    printf_("[%i %i %i] ", get_g_mpu6050()->gx, get_g_mpu6050()->gy, get_g_mpu6050()->gz);
    printf_("[%i %i %i] ", get_g_hmc5883()->mx, get_g_hmc5883()->my, get_g_hmc5883()->mz);
    printf_("[%i %i %i] ", get_g_apds9950()->r, get_g_apds9950()->g, get_g_apds9950()->b);

    printf_("\n");

    led_off(LED_1);
    timer_delay_ms(1000);
	}
}

#endif
