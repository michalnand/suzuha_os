#ifndef _ADC_H_
#define _ADC_H_

#include "../lib_low_level.h"

void adc_init();
void adc_config_ch(u32 ch);
u32 adc_read();
u32 adc_random();


#endif
