#ifndef _I2C_H_
#define _I2C_H_

#include "../lib_low_level.h"


#define RCC_AHBPeriph_GPIO_I2C RCC_IOPENR_GPIOBEN


#define SCL     	   5
#define SDA     	   4
#define I2C_GPIO    GPIOB

/*
#define SCL     	   6
#define SDA     	   7
#define I2C_GPIO    GPIOB
*/

#define NO_I2C_ACK 0
#define OK_I2C_ACK 1

void i2c_init();
u8 i2c_read_reg(u8 dev_addr, u8 reg_addr);
void i2c_write_reg(u8 dev_addr, u8 reg_addr, u8 data);


void i2cStart();
void i2cStop();
int i2cWrite(u8 a);
u8 i2cRead(u8  ack);

#endif
