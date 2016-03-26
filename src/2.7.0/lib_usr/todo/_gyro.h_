#ifndef _GYRO_H_
#define _GYRO_H_

#include "../device/device.h"

// #define GYRO_L3G4200D
#define GYRO_ITG3200  
 


#ifdef GYRO_L3G4200D 

#define GYRO_ADDRESS		(0xD0)

/*gyroscope L3G4200D */
#define	GYRO_WHO_AM_I		0x0F
#define	GYRO_WHO_AM_I_ID	211

#define GYRO_CTRL_REG1 		0x20
#define GYRO_CTRL_REG2 		0x21
#define GYRO_CTRL_REG3 		0x22
#define GYRO_CTRL_REG4 		0x23
#define	GYRO_CTRL_REG5		0x24

#define GYRO_OUT_X_LSB 		0x28
#define GYRO_OUT_X_MSB 		0x29
#define GYRO_OUT_Y_LSB 		0x2A
#define GYRO_OUT_Y_MSB 		0x2B
#define GYRO_OUT_Z_LSB 		0x2C
#define GYRO_OUT_Z_MSB 		0x2D

#endif


#ifdef GYRO_ITG3200

/*gyroscope ITG 3200*/
#define GYRO_ADDRESS		0xD2

#define GYRO_WHO_AM_I		0x00
#define GYRO_SMPLRT_DIV 	0x15
#define GYRO_DLPF_FS 		0x16
#define GYRO_INT_CFG 		0x17
#define GYRO_INT_STATUS 	0x1A
#define GYRO_TEMP_OUT_H 	0x1B
#define GYRO_TEMP_OUT_L 	0x1C
#define GYRO_OUT_X_MSB 		0x1D
#define GYRO_OUT_X_LSB 		0x1E
#define GYRO_OUT_Y_MSB 		0x1F
#define GYRO_OUT_Y_LSB 		0x20
#define GYRO_OUT_Z_MSB 		0x21
#define GYRO_OUT_Z_LSB 		0x22
#define GYRO_PWR_MGM 		0x3E

#endif


struct sGyro
{
	i16 x, y, z;
	i16 x_ofs, y_ofs, z_ofs;
	i32 x_lp, y_lp, z_lp;
	i32 x_angle, y_angle, z_angle;
};

struct sGyro g_gyro;

u32 gyro_init();
void gyro_read();

#endif