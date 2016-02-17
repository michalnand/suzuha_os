#ifndef _ADC_H_
#define _ADC_H_

#include "../lib_low_level.h"

void adc_init();

u16 adc_read(u32 ch);


void adc_start(u32 ch);
u16 adc_get();

void adc_set_channel(u32 ch);
u32 adc_read_current_channel();

#endif
