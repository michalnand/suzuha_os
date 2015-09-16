#include "adc.h"

void adc_init()
{
        /* enable ADC clock */
        SIM_SCGC6 |= SIM_SCGC6_ADC0_MASK;
        /* enable port B & C clock */
        SIM_SCGC5 |= SIM_SCGC5_PORTB_MASK | SIM_SCGC5_PORTC_MASK;

        /* set ports as analog */
        PORTB_PCR3 = PORT_PCR_MUX(0);   /* ADC0_SE13 - SC1n[ADCH] = 01101 */
        PORTC_PCR2 = PORT_PCR_MUX(0);   /* ADC0_SE11 - SC1n[ADCH] = 01011 */
        PORTC_PCR1 = PORT_PCR_MUX(0);   /* ADC0_SE15 - SC1n[ADCH] = 01111 */

        /* 16 bits, long sample time, using asynchronous clock */
        ADC0_CFG1 = 0x1F;

        /* enable asynchronous clock output and slowest adc sampling */
            //ADC0_CFG2 = 0x08;

        ADC0_CFG2 = ADC_CFG2_ADHSC_MASK;
        
        /* software triggered and default voltage reference pins */
        ADC0_SC2 = 0x00;
       
        /* single conversion, 32 samples averaged */
            //ADC0_SC3 = 0x07;

        ADC0_SC3 =  ADC_SC3_AVGE_MASK;        


        /* start adc calibration */
        ADC0_SC3 |= 1<<7;
       
        /* wait until done */
        while (ADC0_SC3 & 1<<7)
            __asm("nop");


        u32 x = ADC0_CLPS + ADC0_CLP0 + ADC0_CLP1 + ADC0_CLP2 + ADC0_CLP3 + ADC0_CLP4;
        x = (x >> 1) | 0x8000;
        ADC0_PG = x;
               
        x = ADC0_CLMS + ADC0_CLM0 + ADC0_CLM1 + ADC0_CLM2 + ADC0_CLM3 + ADC0_CLM4;
        x = (x >> 1) | 0x8000;
        ADC0_MG = x;
}

u16 adc_read(u32 ch)
{
    ADC0_SC1A = 0x0B;
    while (ADC0_SC2&(1 << 7))
        __asm("nop");

    return  ADC0_RA;
    return ch;
}