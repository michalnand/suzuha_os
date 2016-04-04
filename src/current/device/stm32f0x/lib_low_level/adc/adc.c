#include "adc.h"
#include "../std_periph/stm32f0xx_adc.h"
#include "../std_periph/stm32f0xx_gpio.h"

u32 adc_random_seed__ = 0;

u32 adc_random_seed()
{
    u32 i, j;
    u32 res = 0;

    for (j = 0; j < 8; j++)
    {
      u32 res_tmp = 0;
      for (i = 0; i < 32; i++)
      {
          //enable internal channel
          ADC_TempSensorCmd(ENABLE);

          if (j&1)
            ADC_ChannelConfig(ADC1, ADC_Channel_TempSensor, ADC_SampleTime_1_5Cycles);
          else
            ADC_ChannelConfig(ADC1, ADC_Channel_Vrefint, ADC_SampleTime_1_5Cycles);

          ADC_StartOfConversion(ADC1);
          while (!ADC_GetFlagStatus(ADC1, ADC_FLAG_EOC))
              __asm("nop");

          res_tmp<<= 1;
          res_tmp|= ADC_GetConversionValue(ADC1)&1;
          ADC_ClearFlag(ADC1, ADC_FLAG_EOC);

          ADC_TempSensorCmd(DISABLE);
      }

      res^= res_tmp;
    }

    return res;
}

void adc_init()
{
    GPIO_InitTypeDef        GPIO_InitStructure;
    u32 ad_pins_enable = (1<<0);

    GPIO_InitStructure.GPIO_Pin = ad_pins_enable;
    GPIO_InitStructure.GPIO_Mode = GPIO_Mode_AN;
    GPIO_InitStructure.GPIO_PuPd = GPIO_PuPd_NOPULL;
    GPIO_Init(GPIOA, &GPIO_InitStructure);


    ADC_InitTypeDef ADC_InitStructure;

    //enable ADC1 clock
    RCC_APB2PeriphClockCmd(RCC_APB2Periph_ADC1, ENABLE);

    // Initialize ADC 14MHz RC
    RCC_ADCCLKConfig(RCC_ADCCLK_HSI14);
    RCC_HSI14Cmd(ENABLE);
    while (!RCC_GetFlagStatus(RCC_FLAG_HSI14RDY))
        __asm("nop");

    ADC_DeInit(ADC1);
    ADC_InitStructure.ADC_ContinuousConvMode = DISABLE;
    ADC_InitStructure.ADC_DataAlign = ADC_DataAlign_Right;
    ADC_InitStructure.ADC_Resolution = ADC_Resolution_12b;
    ADC_InitStructure.ADC_ScanDirection = ADC_ScanDirection_Upward;
    ADC_InitStructure.ADC_ExternalTrigConvEdge = ADC_ExternalTrigConvEdge_None;
    ADC_InitStructure.ADC_ExternalTrigConv = ADC_ExternalTrigConv_T1_TRGO; //default
    ADC_Init(ADC1, &ADC_InitStructure);

    ADC_GetCalibrationFactor(ADC1);

    // Enable ADCperipheral
    ADC_Cmd(ADC1, ENABLE);
    while(!ADC_GetFlagStatus(ADC1, ADC_FLAG_ADRDY))
        __asm("nop");


    adc_random_seed__ = adc_random_seed();
}

void adc_config_ch(u32 ch)
{
    ADC_ChannelConfig(ADC1, ch, ADC_SampleTime_1_5Cycles);
    adc_read();
}

u32 adc_read()
{
    ADC1->CR |= (uint32_t)ADC_CR_ADSTART;

    while ((ADC1->ISR&ADC_FLAG_EOC) == 0)
        __asm("nop");

    u32 res = ADC1->DR;
    ADC1->ISR = (u32)ADC_FLAG_EOC;

    return res;
}


u32 adc_random_seed_get()
{
    return adc_random_seed__;
}
