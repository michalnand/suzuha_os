#ifndef _ADC_H_
#define _ADC_H_

#include "../lib_low_level.h"

void adc_init(u32 channels_mask);
void adc_config_ch(u32 ch);
u32 adc_read();
u32 adc_random_seed();
u32 adc_random_seed_get();


#endif
