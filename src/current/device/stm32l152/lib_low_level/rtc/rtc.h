#ifndef _RTC_H_
#define _RTC_H_

#include "../lib_low_level.h"



void rtc_init();

unsigned long int rtc_timer_get_time();
void rtc_timer_delay_ms(u32 ms);

#endif