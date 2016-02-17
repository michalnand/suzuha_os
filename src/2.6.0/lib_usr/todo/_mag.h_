#ifndef _MAG_H_
#define _MAG_H_

#include "../device/device.h"


// #define MAG_3110 1
#define HMC5883 1


#ifdef  MAG_3110
#define	MAG3110_ADDR	(0x0E<<1) 	/*device address*/


/*register name				address		default value*/
#define MAG3110_DR_STATUS	0x00		/*0x00*/
#define MAG3110_X_MSB		0x01		/*data*/
#define MAG3110_X_LSB		0x02		/*data*/
#define MAG3110_Y_MSB		0x03		/*data*/
#define MAG3110_Y_LSB		0x04		/*data*/
#define MAG3110_Z_MSB		0x05		/*data*/
#define MAG3110_Z_LSB		0x06		/*data*/
#define MAG3110_WHO_AM_I	0x07		/*0xC4*/
#define MAG3110_SYSMOD		0x08		/*data*/

#define MAG3110_OFF_X_MSB	0x09		/*0x00*/
#define MAG3110_OFF_X_LSB	0x0A		/*0x00*/
#define MAG3110_OFF_Y_MSB	0x0B		/*0x00*/
#define MAG3110_OFF_Y_LSB	0x0C		/*0x00*/
#define MAG3110_OFF_Z_MSB	0x0D		/*0x00*/
#define MAG3110_OFF_Z_LSB	0x0E		/*0x00*/

#define MAG3110_DIE_TEMP	0x0F		/*data*/
#define MAG3110_CTRL_REG1	0x10		/*0x00*/
#define MAG3110_CTRL_REG2	0x11		/*0x00*/

#endif


#ifdef HMC5883
#define	HMC5883_ADDR			(0x1E<<1) 	/*device address*/


#define HMC5883_CONFIG_A_REG	0x00
#define HMC5883_CONFIG_B_REG	0x01
#define HMC5883_MODE_REG		0x02
#define HMC5883_X_MSB			0x03
#define HMC5883_X_LSB			0x04
#define HMC5883_Y_MSB			0x05
#define HMC5883_Y_LSB			0x06
#define HMC5883_Z_MSB			0x07
#define HMC5883_Z_LSB			0x08
#define HMC5883_STATUS_REG		0x09
#define HMC5883_ID_A_REG		0x0A
#define HMC5883_ID_B_REG		0x0B
#define HMC5883_ID_C_REG		0x0C


#endif



struct sMag
{
	i16 x, y, z;
	i16 x_, y_, z_;
	i16 x_hp, y_hp, z_hp;
};

struct sMag g_mag;

void mag_init();
void mag_read();

#endif