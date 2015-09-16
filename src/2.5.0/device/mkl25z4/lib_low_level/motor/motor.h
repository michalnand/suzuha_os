#ifndef _MOTOR_H_
#define _MOTOR_H_

#include "../lib_low_level.h"

#define PWM_PERIOD		(63)
#define PWM_MAX_VALUE	(PWM_PERIOD)
#define SPEED_MIN		(-PWM_MAX_VALUE)
#define SPEED_MAX		(PWM_MAX_VALUE)

void motor_init();
void motor_run(i16 speed_l, i16 speed_r);

#endif