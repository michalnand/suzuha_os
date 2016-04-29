#include "threads_basic.h"

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

  create_thread(child1_thread, child1_thread_stack, sizeof(child1_thread_stack), PRIORITY_MAX);
  create_thread(child2_thread, child2_thread_stack, sizeof(child2_thread_stack), PRIORITY_MAX);


  while (1)
  {
    led_on(LED_1);
    printf_("main thread\n");
    led_off(LED_1);

    object_test_call();


    timer_delay_ms(500);
  }
}

#endif
