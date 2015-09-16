#include "adc.h"

void adc_init()
{
	SIM->SCGC6|= SIM_SCGC6_ADC0_MASK;		/*enable adc clock*/

	ADC0->CFG1 = ADC_CFG1_MODE(1) | ADC_CFG1_ADICLK(1) | ADC_CFG1_ADIV(1) ;	/*12 bit mode, bus clock/2, adiv = 1*/
	
	ADC0->CFG2 = 0;

	/*software trigger, VREF and VREFL pins as reference*/
	ADC0->SC2 = 0; 
	ADC0->SC3 = 0;

	/* start adc calibration */
	ADC0->SC3 |= ADC_SC3_CAL_MASK;
       
	/* wait until done */
	while (ADC0->SC3 & ADC_SC3_CAL_MASK)
		__asm("nop");
}

u16 adc_read(u32 ch)
{
	//ADC0->SC1[0] = (ch&ADC_SC1_ADCH_MASK);
	ADC0->SC1[0] =  ADC_SC1_ADCH(ch);

 	while ((ADC0->SC1[0]&ADC_SC1_COCO_MASK) == 0)
 		__asm("nop");

    return ADC0->R[0];
}


u16 adc_average(u32 ch, u32 count)
{
	u32 i, sum = 0;
	for (i = 0; i <count; i++)
		sum+= adc_read(ch);

	sum = sum/count;
	return sum;
}