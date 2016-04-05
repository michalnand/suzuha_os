#include "adc_example.h"

#ifdef EXAMPLE_ADC

#define  ADC_CHANNELS_COUNT   4

u32 adc_res[ADC_CHANNELS_COUNT];


void adc_thread()
{
  adc_init(ADC_Channel_0|ADC_Channel_1|ADC_Channel_4|ADC_Channel_5);
  event_timer_set_period(EVENT_TIMER_0_ID, 50);



  while (1)
  {
    event_timer_wait(EVENT_TIMER_0_ID);

    adc_config_ch(ADC_Channel_0);
    adc_res[0] = adc_read();

    adc_config_ch(ADC_Channel_1);
    adc_res[1] = adc_read();

    adc_config_ch(ADC_Channel_3);
    adc_res[2] = adc_read();

    adc_config_ch(ADC_Channel_4);
    adc_res[3] = adc_read();

    led_on(LED_1);
    u32 i;
    for (i = 0; i < ADC_CHANNELS_COUNT; i++)
      printf_("%u ", adc_res[i]);
    printf_("\n");
    led_off(LED_1);
  }
}

void main_thread()
{
  create_thread(adc_thread, adc_thread_stack, sizeof(adc_thread_stack), PRIORITY_MAX);

  while (1)
  {
    event_timer_wait(EVENT_TIMER_0_ID);
    /*
    led_on(LED_1);
    u32 i;
    for (i = 0; i < ADC_CHANNELS_COUNT; i++)
      printf_("%u ", adc_res[i]);
    printf_("\n");
    led_off(LED_1);
    */
  }
}

#endif
