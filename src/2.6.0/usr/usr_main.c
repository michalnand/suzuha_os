#include "usr_main.h"

#include "../lib_usr/hmc5883.h"

void main_thread()
{
	printf_(OS_WELCOME_MESSAGE);

	u32 res = hmc5883_init();

	while (1)
	{
		led_on(LED_1);
		hmc5883_read();
		//printf_("%u : %i %i %i\n", res, g_hmc5883.mx, g_hmc5883.my, g_hmc5883.mz);
		printf_("%u : %i \n", res, g_hmc5883.mz);
		led_off(LED_1);


		timer_delay_ms(100);
	}

	robot_main();
}
