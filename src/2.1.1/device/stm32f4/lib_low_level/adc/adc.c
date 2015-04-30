#include "adc.h"

#include "stm32f4xx_adc.h"

#define ADC0_PIN 	(1<<0)
#define ADC1_PIN 	(1<<1)
#define ADC2_PIN 	(1<<2)
#define ADC3_PIN 	(1<<3)
#define ADC4_PIN 	(1<<4)
#define ADC5_PIN 	(1<<5)
#define ADC6_PIN 	(1<<6)
#define ADC7_PIN 	(1<<7)

void adc_init()
{
	ADC_InitTypeDef       ADC_InitStructure;
	ADC_CommonInitTypeDef ADC_CommonInitStructure;
	GPIO_InitTypeDef      GPIO_InitStructure;

	/* Enable peripheral clocks */
	 RCC_APB2PeriphClockCmd(RCC_APB2Periph_ADC1, ENABLE); // | RCC_APB2Periph_ADC2 | RCC_APB2Periph_ADC3 , ENABLE);
	 
	/* Configure ADC Channel 12 pin as analog input */
	GPIO_InitStructure.GPIO_Pin = ADC0_PIN | ADC1_PIN | ADC2_PIN | ADC3_PIN | ADC4_PIN | ADC5_PIN | ADC6_PIN | ADC7_PIN;
	GPIO_InitStructure.GPIO_Mode = GPIO_Mode_AN;
	GPIO_InitStructure.GPIO_PuPd = GPIO_PuPd_NOPULL ;
	GPIO_Init(GPIOA, &GPIO_InitStructure);
	 
	/* ADC Common configuration *************************************************/
	ADC_CommonInitStructure.ADC_Mode = ADC_Mode_Independent;
	ADC_CommonInit(&ADC_CommonInitStructure);
	
	/* ADC1 regular channel 10 to 15 configuration ************************************/
	ADC_InitStructure.ADC_Resolution = ADC_Resolution_12b;
	ADC_InitStructure.ADC_ScanConvMode = DISABLE;
	ADC_InitStructure.ADC_ContinuousConvMode = DISABLE;
	ADC_InitStructure.ADC_ExternalTrigConvEdge = ADC_ExternalTrigConvEdge_None;
	ADC_InitStructure.ADC_DataAlign = ADC_DataAlign_Right;
	ADC_Init(ADC1, &ADC_InitStructure);
	//ADC_Init(ADC2, &ADC_InitStructure);
	//ADC_Init(ADC3, &ADC_InitStructure);
	 
	  ADC_RegularChannelConfig(ADC1, ADC_Channel_10, 1, ADC_SampleTime_3Cycles);
	//ADC_RegularChannelConfig(ADC2, ADC_Channel_11, 1, ADC_SampleTime_3Cycles);
	//ADC_RegularChannelConfig(ADC3, ADC_Channel_12, 1, ADC_SampleTime_3Cycles);
	 
	/* Enable ADC1 to ADC3*/
	ADC_Cmd(ADC1, ENABLE);
	//ADC_Cmd(ADC2, ENABLE);
	//ADC_Cmd(ADC3, ENABLE);
}


u16 adc_read(u32 ch)
{
	ADC_RegularChannelConfig(ADC1, ch, 1, ADC_SampleTime_3Cycles);

	/*
	ADC_SoftwareStartConv(ADC1);
    while(ADC_GetSoftwareStartConvStatus(ADC1) != RESET)
    	__asm("nop");
    */

//    ADC_SoftwareStartConvCmd(ADC1, ENABLE);
    ADC_SoftwareStartConv(ADC1);
  // Wait until conversion completion
  while(ADC_GetFlagStatus(ADC1, ADC_FLAG_EOC) == RESET) 
  	__asm("nop");
  
    
    u16 res = ADC_GetConversionValue(ADC1);
	
	return res;
}