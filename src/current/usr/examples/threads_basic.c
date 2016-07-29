#include "threads_basic.h"

#include "../../lib_usr/ad9833.h"

#ifdef EXAMPLE_THREADS_BASIC

#define THREAD_STACK_SIZE	64

thread_stack_t child1_thread_stack[THREAD_STACK_SIZE];
thread_stack_t child2_thread_stack[THREAD_STACK_SIZE];

void child1_thread()
{
  while (1)
  {
    char c = uart_read();
    printf_("char >%c<\n", c);

    led_on(LED_1);
    printf_("child 1 thread 1111111\n");
    led_off(LED_1);

    timer_delay_ms(300);
  }
}

void child2_thread()
{
  while (1)
  {
    led_on(LED_1);
    printf_("child 2 thread 2222222\n");
    led_off(LED_1);

    timer_delay_ms(700);
  }
}

void main_thread()
{
  led_on(LED_1);

  printf_(OS_WELCOME_MESSAGE);

/*
  create_thread(child1_thread, child1_thread_stack, sizeof(child1_thread_stack), PRIORITY_MAX);
  create_thread(child2_thread, child2_thread_stack, sizeof(child2_thread_stack), PRIORITY_MAX);
*/

  ad9833_init();
  ad9833_set_frequency(1000, AD9833_SINE);
  //ad9833_set_gain(int gain);


  while (1)
  {

    led_off(LED_1);
    ad9833_set_frequency(1000000, AD9833_SINE);
    ad9833_set_gain(200);
    timer_delay_ms(300);

    led_on(LED_1);
    ad9833_set_frequency(1000000, AD9833_SINE);
    ad9833_set_gain(255);
    timer_delay_ms(300);

    /*
    led_on(LED_1);
    ad9833_set_frequency(500, AD9833_SINE);
    timer_delay_ms(300);

    led_off(LED_1);
    ad9833_set_frequency(4000, AD9833_SINE);
    timer_delay_ms(300);
    */
  }
}

#endif
