#include "usr_main.h"
#include "../lib_usr/gyro.h"
#include "../lib_usr/mag.h"
#include "../lib_usr/accelerometer.h"
#include "../lib_usr/ir.h"
// #include "../lib_usr/sh1106.h"
// #include "../lib_usr/mp3.h"

// #include "../lib_usr/st7781/st7781.h"
#include "../lib_usr/math.h"


thread_stack_t thread_01_stack[THREAD_STACK_SIZE];
thread_stack_t thread_02_stack[THREAD_STACK_SIZE];
thread_stack_t thread_03_stack[THREAD_STACK_SIZE];
thread_stack_t thread_04_stack[THREAD_STACK_SIZE];
thread_stack_t thread_05_stack[THREAD_STACK_SIZE];
thread_stack_t thread_06_stack[THREAD_STACK_SIZE];


volatile u32 thread_period;


#define FILTER_COEF		(u32)1
#define AVERAGE_LOOPS	(u32)100


volatile time_t thread_01_time;

void thread_01()
{
	while (1)
	{
		time_t time_start = timer_get_time();

		time_t time_off = time_start + thread_period;

		timer_delay_ms(thread_period);

		time_t time_stop = timer_get_time();
		time_t dif = time_stop - time_start;

		//thread_01_time = thread_01_time + dif - thread_01_time/FILTER_COEF;
		if (dif > thread_01_time)
			thread_01_time = dif;
	}
}

volatile time_t thread_02_time;

void thread_02()
{
	while (1)
	{
		time_t time_start = timer_get_time();

		time_t time_off = time_start + thread_period;

		timer_delay_ms(thread_period);

		time_t time_stop = timer_get_time();
		time_t dif = time_stop - time_start;

		//thread_02_time = thread_02_time + dif - thread_02_time/FILTER_COEF;
		if (dif > thread_02_time)
			thread_02_time = dif;
	}
}

volatile time_t thread_03_time;

void thread_03()
{
	while (1)
	{
		time_t time_start = timer_get_time();

		time_t time_off = time_start + thread_period;

		timer_delay_ms(thread_period);

		time_t time_stop = timer_get_time();
		time_t dif = time_stop - time_start;

		//thread_03_time = thread_03_time + dif - thread_03_time/FILTER_COEF;
		if (dif > thread_03_time)
			thread_03_time = dif;
	}
}


volatile time_t thread_04_time;

void thread_04()
{
	while (1)
	{
		time_t time_start = timer_get_time();

		time_t time_off = time_start + thread_period;

		timer_delay_ms(thread_period);

		time_t time_stop = timer_get_time();
		time_t dif = time_stop - time_start;

		// thread_04_time = thread_04_time + dif - thread_04_time/FILTER_COEF;
		if (dif > thread_04_time)
			thread_04_time = dif;
	}
}

volatile time_t thread_05_time;

void thread_05()
{
	while (1)
	{
		time_t time_start = timer_get_time();

		time_t time_off = time_start + thread_period;

		timer_delay_ms(thread_period);

		time_t time_stop = timer_get_time();
		time_t dif = time_stop - time_start;

		// thread_05_time = thread_05_time + dif - thread_05_time/FILTER_COEF;
		if (dif > thread_05_time)
			thread_05_time = dif;
	}
}

volatile time_t thread_06_time;

void thread_06()
{
	while (1)
	{
		time_t time_start = timer_get_time();

		time_t time_off = time_start + thread_period;

		timer_delay_ms(thread_period);

		time_t time_stop = timer_get_time();
		time_t dif = time_stop - time_start;

		//thread_06_time = thread_06_time + dif - thread_06_time/FILTER_COEF;
		if (dif > thread_06_time)
			thread_06_time = dif;
	}
}

/*
flag_t flag_01, flag_02, flag_03;
 
void thread_01()
{
	while (1)
	{
		u32 i;
		if (flag_check(&flag_01))
		{
			for (i = 0; i < 4; i++)
			{
				led_on(LED_1);
				// printf_("thread_01 %u\n", i);
				timer_delay_ms(10);
				led_off(LED_1); 
				timer_delay_ms(200);
			}
		
			flag_clear(&flag_01);
			flag_set(&flag_02);
		}
	}
} 

void thread_02()
{
	while (1)
	{
		u32 i;
		if (flag_check(&flag_02))
		{
			for (i = 0; i < 4; i++)
			{
				led_on(LED_2);
				// printf_("thread_02 %u\n", i);
				timer_delay_ms(10);
				led_off(LED_2); 
				timer_delay_ms(200);
			}
		
			flag_clear(&flag_02);
			flag_set(&flag_03);
		}
	}
}

void thread_03()
{
	while (1)
	{
		u32 i;
		if (flag_check(&flag_03))
		{
			for (i = 0; i < 4; i++)
			{
				led_on(LED_3);
				// printf_("thread_03 %u\n", i);
				timer_delay_ms(10);
				led_off(LED_3); 
				timer_delay_ms(200);
			}
		
			flag_clear(&flag_03);
			flag_set(&flag_01);
		}
	}
}

*/

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
*/

/*
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

void main_thread()
{
	printf_(OS_WELCOME_MESSAGE);

	/*
	flag_init(&flag_01);
	flag_init(&flag_02);
	flag_init(&flag_03);
	
	flag_set(&flag_01);
	*/

	/*
	thread_period = 10;

	thread_01_time = 0;
	thread_02_time = 0;
	thread_03_time = 0;
	thread_04_time = 0;
	thread_05_time = 0;
	thread_06_time = 0;

	

	create_thread(thread_01, thread_01_stack, sizeof(thread_01_stack), PRIORITY_MAX);
	create_thread(thread_02, thread_02_stack, sizeof(thread_02_stack), PRIORITY_MAX);
	create_thread(thread_03, thread_03_stack, sizeof(thread_03_stack), 128);
	create_thread(thread_04, thread_04_stack, sizeof(thread_04_stack), 128);
	create_thread(thread_05, thread_05_stack, sizeof(thread_05_stack), PRIORITY_MIN);
	create_thread(thread_06, thread_06_stack, sizeof(thread_06_stack), PRIORITY_MIN);
*/
	
	/*
	create_thread(thread_01, thread_01_stack, sizeof(thread_01_stack), PRIORITY_MAX);
	create_thread(thread_02, thread_02_stack, sizeof(thread_02_stack), PRIORITY_MAX+1);
	create_thread(thread_03, thread_03_stack, sizeof(thread_03_stack), PRIORITY_MAX+2);
	create_thread(thread_04, thread_04_stack, sizeof(thread_04_stack), PRIORITY_MAX+3);
	create_thread(thread_05, thread_05_stack, sizeof(thread_05_stack), PRIORITY_MAX+4);
	create_thread(thread_06, thread_06_stack, sizeof(thread_06_stack), PRIORITY_MAX+5);
	*/


	u32 i;
 	while (1)
	{

		led_on(LED_0);
		printf_("main thread idle, uptime %u\n", timer_get_time()/1000);
		led_off(LED_0);
		timer_delay_ms(100);
	}
}
