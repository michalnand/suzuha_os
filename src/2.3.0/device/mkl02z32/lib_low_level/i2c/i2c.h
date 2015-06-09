#ifndef _I2C_H_
#define _I2C_H_

#include "../lib_low_level.h"

#define  I2C_BASE	((I2C_Type *)I2C0_BASE)

#define I2C_READ 	1
#define I2C_WRITE 	0


void i2c_0_init();
u8 i2c_read_reg(u8 dev_addr, u8 reg_addr);
void i2c_write_reg(u8 dev_addr, u8 reg_addr, u8 data);

#endif