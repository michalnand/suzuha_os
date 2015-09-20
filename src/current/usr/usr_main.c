#include "usr_main.h"
#include "../lib_usr/robot/robot.h"
//#include "../lib_usr/sh1106.h"

// #include "../lib_usr/mp3.h"

thread_stack_t thread_01_stack[THREAD_STACK_SIZE];
thread_stack_t thread_02_stack[THREAD_STACK_SIZE];
thread_stack_t thread_03_stack[THREAD_STACK_SIZE];


void thread_01();
void thread_02();
void thread_03();

void thread_01()
{
	while (1)
	{
		led_on(LED_2);
		printf_("thread 1\n");
		printf_("creating child thread\n");

		u32 thread_id = create_thread(thread_02, thread_02_stack, sizeof(thread_02_stack), PRIORITY_MAX);

		if (thread_id == THREAD_CREATING_ERROR)
			printf_("thread creating error\n");
		else
		{
			printf_("waiting for thread %u done\n", thread_id);
			join(thread_id);
			printf_("done\n");
		}

		led_off(LED_2);
		timer_delay_ms(500);
	}
}

void thread_02()
{
	u32 i;
	for (i = 0; i < 10; i++)
	{
		printf_("another child thread, res %u\n", i);
		//timer_delay_ms(20);
	}
}


void thread_03()
{
	while (1)
	{
		printf_("periodic thread\n");
		timer_delay_ms(100);
	}
}

void main_thread()
{
	printf_(OS_WELCOME_MESSAGE);

	robot_init();

/*
	create_thread(thread_01, thread_01_stack, sizeof(thread_01_stack), PRIORITY_MAX);
	create_thread(thread_03, thread_03_stack, sizeof(thread_03_stack), PRIORITY_MAX);
*/


	robot_main();
}


/*
void julia_set(u32 iterations_max, float cr_)
{
	float cr = -0.8;
	float ci = 0.156;

	cr = cr_;
	ci = 1.0 - cr_*cr_;

	if (cr_ < 0.0)
		ci = -ci;

	u32 j, i;
	for(j = 0; j < LCD_VERTICAL_MAX; j++)
	{
		for(i = 0; i < LCD_HORIZONTAL_MAX; i++)
		{


			float zr = ((1.0*i)/LCD_HORIZONTAL_MAX - 0.5)*4.0;
			float zi = ((1.0*j)/LCD_VERTICAL_MAX - 0.5)*4.0;

			float zr_ = 0.0;
			float zi_ = 0.0;

			u32 iterations = iterations_max;
			do
			{
				zr_ = zr*zr - zi*zi + cr;
				zi_ = 2.0*zr*zi + ci;

				zr = zr_;
				zi = zi_;

				iterations--;
			}
			while (((zr*zr + zi*zi) < 2.0) && (iterations != 0));

			if (iterations == 0)
				lcd_sharp96_put_pixel(i, j, 1);
			else
				lcd_sharp96_put_pixel(i, j, 0);
		}
	}
}

u32 iterations_max;

void lcd_demo()
{
	u32 i, max_iters = 100;


	lcd_sharp96_clear(0xff);
	lcd_sharp96_put_string(OS_WELCOME_MESSAGE);
	lcd_sharp96_flush();

	timer_delay_ms(4000);

	time_t time_total = 0;
	time_t time_max = 0;
	time_t time_min = 1000000;

	for (i = 0; i < (max_iters/4); i++)
	{
		float cr = ((i*2.0)/max_iters) - 1.0;

		time_t tstart = timer_get_time();
		julia_set(iterations_max, cr);
		time_t tstop = timer_get_time();

		time_t dif = tstop - tstart;

		time_total+= dif;

		if (dif > time_max)
			time_max = dif;

		if (dif < time_min)
			time_min = dif;

		lcd_sharp96_flush();
	}

	printf_("%u %u %u %u\n", iterations_max, time_total, time_min, time_max);

	iterations_max++;

	if (iterations_max > 40)
		iterations_max = 4;
}

*/


	/*
	st7781_init();

	u32 x = 0;
	u32 y = 0;
	u32 r = 150;
	u32 g = 100;
	u32 b = 50;

	while (1)
	{
		st7781_put_pixel(x, y, r, g, b);

		x++;
		if (x > 100)
		{
			x = 0;
			y++;
			led_on(LED_3);
		}

		if (y > 100)
		{
			y = 0;
		}

		timer_delay_ms(2);
		led_off(LED_3);
	}
*/
