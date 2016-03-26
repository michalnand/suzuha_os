#ifndef _PWM_H_
#define _PWM_H_

#include "../lib_low_level.h"


#define PWM_CH_0_GPIO	GPIOA
#define PWM_CH_0		((u32)(1<<8))

#define PWM_CH_1_GPIO	GPIOA
#define PWM_CH_1		((u32)(1<<11))

#define PWM_CH_2_GPIO	GPIOA
#define PWM_CH_2		((u32)(1<<1))

#define PWM_CH_COUNT 3

#define PWM_MAX			16

struct sPWM
{
	u8 pwm_ch[PWM_CH_COUNT];
	u8 pwm_cnt[PWM_CH_COUNT];
	u8 cnt;
};

struct sPWM g_pwm;

void pwm_init();



#endif
