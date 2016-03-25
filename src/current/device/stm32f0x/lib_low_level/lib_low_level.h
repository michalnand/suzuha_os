#ifndef LIB_LOW_LEVEL_H_
#define LIB_LOW_LEVEL_H_

#include "int_def.h"

#include "std_periph/std_periph.h"
#include "core/cortex_cpu.h"

#include "gpio/gpio.h"
#include "timer/timer.h"
#include "uart/uart.h"
#include "i2c/i2c.h"
#include "pwm/pwm.h"
#include "adc/adc.h"
#include "ir_comm/ir_comm.h"
#include "ir_comm/ir_packet.h"

#include "../../../options.h"


void lib_low_level_init();

#endif
