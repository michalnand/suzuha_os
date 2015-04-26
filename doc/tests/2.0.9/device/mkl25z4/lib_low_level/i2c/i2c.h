#ifndef _I2C_H_
#define _I2C_H_

#include "../lib_low_level.h"

#define SDA       (25)	/*PTE25*/
#define SCL       (24)	/*PTE24*/

//#define SDA       (2)	/*PTE3*/
//#define SCL       (3)	/*PTE3*/


#define NO_I2C_ACK 0
#define OK_I2C_ACK 1


void i2c_init();
void i2cStart();
void i2cStop();
int i2cWrite(u8 a);
u8  i2cRead(u8  ack);


void i2c_write_reg(u8 dev_adr, u8 reg_adr, u8 value);
u8 i2c_read_reg(u8 dev_adr, u8 reg_adr);

#endif