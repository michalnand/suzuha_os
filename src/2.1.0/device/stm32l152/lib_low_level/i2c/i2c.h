#ifndef _I2C_H_
#define _I2C_H_

#include "../lib_low_level.h"

#include "stm32l1xx_i2c.h"

#define NO_I2C_ACK 0
#define OK_I2C_ACK 1

void i2c_0_init();
u8 i2c_read_reg(u8 dev_addr, u8 reg_addr);
void i2c_write_reg(u8 dev_addr, u8 reg_addr, u8 data);

#endif
