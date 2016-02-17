#ifndef _PWM_H_
#define _PWM_H_

#include "../lib_low_level.h" 

#include "../stm32f4xx_rcc.h"
#include "../gpio/stm32f4xx_gpio.h"
#include "../timer/stm32f4xx_tim.h"


void pwm_init();
void pwm_set(u32 ch0, u32 ch1);

#endif
