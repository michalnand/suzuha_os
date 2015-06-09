#ifndef _ACCEL_H_
#define _ACCEL_H_

#include "../device/device.h"

#define ACCEL_LP_COEF	31

#define ACC_MMA8452 	1

#ifdef ACC_MMA8452

#define ACC_MMA8452_ADR					(0x38)			/*slave address for write*/


#define ACC_MMA8452_SYSMOD				0x0B
#define	ACC_MMA8452_XYZ_DATA_CFG		0x0E
#define ACC_MMA8452_HP_FILTER_CUTOFF	0x0F
#define ACC_MMA8452_CTRL_REG1			0x2A
#define ACC_MMA8452_CTRL_REG2			0x2B
#define ACC_MMA8452_WHO_AM_I			0x0D
#define ACC_MMA8452_WHO_AM_I_ID			0x3A


#define ACC_MMA8452_OUT_X_MSB			0x01
#define ACC_MMA8452_OUT_X_LSB			0x02
#define ACC_MMA8452_OUT_Y_MSB			0x03
#define ACC_MMA8452_OUT_Y_LSB			0x04
#define ACC_MMA8452_OUT_Z_MSB			0x05
#define ACC_MMA8452_OUT_Z_LSB			0x06

#endif

struct sAccel
{
	i16 x, y, z;
	i16 x_lp, y_lp, z_lp;
};

struct sAccel g_accel;

void accel_init();
void accel_read();

#endif