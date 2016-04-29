#ifndef LIB_LOW_LEVEL_H_
#define LIB_LOW_LEVEL_H_

#include "int_def.h"

#include "core/cortex_cpu.h"
#include "STM32L0xx_HAL_Driver/stm32l0xx_hal.h"

#include "gpio/gpio.h"
#include "timer/timer.h"

#include "uart/uart.h"
#include "i2c/i2c.h"

#include "adc/adc.h"

#include "spi/spi.h"

#include "../../../options.h"


void lib_low_level_init();


#endif
