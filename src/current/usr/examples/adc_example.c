#include "adc_example.h"

#ifdef EXAMPLE_ADC
 
#define  ADC_CHANNELS_COUNT   4

u32 adc_res[ADC_CHANNELS_COUNT];


void adc_thread()
{
  adc_init(ADC_Channel_0|ADC_Channel_1|ADC_Channel_4|ADC_Channel_5);

  pwm_init();

  u32 dac_out = 0;
  while (1)
  {
    event_timer_wait(EVENT_TIMER_0_ID);

    adc_config_ch(ADC_Channel_0);
    adc_res[0] = adc_read();

    adc_config_ch(ADC_Channel_1);
    adc_res[1] = adc_read();

    adc_config_ch(ADC_Channel_4);
    adc_res[2] = adc_read();

    adc_config_ch(ADC_Channel_5);
    adc_res[3] = adc_read();



    if (dac_out == 0)
      dac_out = 100;
    else
      dac_out = 0;

    pwm_set(dac_out);
  }
}

void main_thread()
{
  printf_("main thread\n");
  event_timer_set_period(EVENT_TIMER_0_ID, 10);
  create_thread(adc_thread, adc_thread_stack, sizeof(adc_thread_stack), PRIORITY_MAX);

  while (1)
  {

    event_timer_wait(EVENT_TIMER_0_ID);

    led_on(LED_1);
    u32 i;
    for (i = 0; i < ADC_CHANNELS_COUNT; i++)
      printf_("%u ", adc_res[i]);
    printf_("\n");
    led_off(LED_1);
  }
}

#endif
