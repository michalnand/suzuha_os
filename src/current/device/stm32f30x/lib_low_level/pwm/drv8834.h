#ifndef _DRV8834_H_
#define _DRV8834_H_

#include "pwm.h"

#ifdef __cplusplus
extern "C" {
#endif

#define SPEED_MAX	((i32)100)

void drv8834_init();
void drv8834_run(i16 left_pwm, i16 right_pwm);

#ifdef __cplusplus
}
#endif

#endif
