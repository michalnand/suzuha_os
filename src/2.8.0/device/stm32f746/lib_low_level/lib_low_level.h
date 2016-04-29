#ifndef LIB_LOW_LEVEL_H_
#define LIB_LOW_LEVEL_H_

#include "int_def.h"
#include "stm32f746xx.h"
#include "core/cortex_cpu.h"
#include "core_cm7.h"

// #include "misc.h"
#include "stm32f7xx_hal.h"


#include "gpio/gpio.h"
#include "timer/timer.h"
#include "pwm/pwm.h"

#include "uart/uart.h"
#include "i2c/i2c.h"


/*todo*/
#include "adc/adc.h"
#include "spi/spi.h"



#include "../../../options.h"


void test();
void lib_low_level_init();

#endif
