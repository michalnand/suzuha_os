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
      u32 tmp = 0;
      for (i = 0; i < 32; i++)
      {
        ADC_TempSensorCmd(ENABLE);
        ADC_VrefintCmd(ENABLE);

        if (j&1)
          adc_config_ch(ADC_Channel_TempSensor);
        else
          adc_config_ch(ADC_Channel_Vrefint);

        tmp<<= 1;
        tmp|= adc_read()&(1<<0);


        ADC_TempSensorCmd(DISABLE);
        ADC_VrefintCmd(DISABLE);
      }

      res^=tmp;
    }

    return res;
}

void adc_init(u32 channels_mask)
{
    u32 ad_pins_enable = channels_mask;

    GPIO_InitTypeDef        GPIO_InitStructure;
    GPIO_InitStructure.GPIO_Pin = ad_pins_enable;
    GPIO_InitStructure.GPIO_Mode = GPIO_Mode_AN;
    GPIO_InitStructure.GPIO_PuPd = GPIO_PuPd_NOPULL;
    GPIO_Init(GPIOA, &GPIO_InitStructure);

    ADC_InitTypeDef ADC_InitStructure;

    //enable ADC1 clock
    RCC_APB2PeriphClockCmd(RCC_APB2Periph_ADC1, ENABLE);

    RCC_ADCCLKConfig(RCC_ADCCLK_PCLK_Div2);

    ADC_DeInit(ADC1);
    ADC_InitStructure.ADC_ContinuousConvMode = DISABLE;
    ADC_InitStructure.ADC_DataAlign = ADC_DataAlign_Right;
    ADC_InitStructure.ADC_Resolution = ADC_Resolution_12b;
    ADC_InitStructure.ADC_ScanDirection = ADC_ScanDirection_Upward;
    ADC_InitStructure.ADC_ExternalTrigConvEdge = ADC_ExternalTrigConvEdge_None;
    ADC_InitStructure.ADC_ExternalTrigConv = ADC_ExternalTrigConv_T1_TRGO;
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
  u32 tmp = 0;

  ADC1->CHSELR = (u32)ch;
  tmp &= ~ADC_SMPR1_SMPR;
  tmp |= (u32)ADC_SampleTime_7_5Cycles;
  ADC1->SMPR = tmp;
}

u32 adc_read()
{
    ADC1->CR|= (u32)ADC_CR_ADSTART;

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
