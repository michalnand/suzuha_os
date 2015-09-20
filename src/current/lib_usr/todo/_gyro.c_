#include "gyro.h"

u32 gyro_init()
{ 
	#ifdef GYRO_L3G4200D 
	/*enable gyro, xyz axis, 200Hz, 70Hz cut off*/
	i2c_write_reg(GYRO_ADDRESS, GYRO_CTRL_REG1, (1<<6)|(1<<5)|(1<<4) | (1<<0)|(1<<1)|(1<<2)|(1<<3));
	//imu_write_reg(GYRO_ADDRESS, GYRO_CTRL_REG2, (1<<5)|(1<<1)|(1<<0));/*enable high pass filter, 2Hz*/
	i2c_write_reg(GYRO_ADDRESS, GYRO_CTRL_REG2, 0);		/*dont use high pass filter*/
	i2c_write_reg(GYRO_ADDRESS, GYRO_CTRL_REG3, 0);		/*no interrupt*/
	i2c_write_reg(GYRO_ADDRESS, GYRO_CTRL_REG4, (1<<4));	/*500dpi*/
	i2c_write_reg(GYRO_ADDRESS, GYRO_CTRL_REG5, 0);
	//imu_write_reg(GYRO_ADDRESS, GYRO_CTRL_REG5, (1<<4));	/*enable high pass filter*/

	if (i2c_read_reg(GYRO_ADDRESS, GYRO_WHO_AM_I) != GYRO_WHO_AM_I_ID)
		return 1;
	#endif
	
	#ifdef GYRO_ITG3200
	i2c_write_reg(GYRO_ADDRESS, GYRO_PWR_MGM, (1<<7));	/*reset gyro*/
	i2c_write_reg(GYRO_ADDRESS, GYRO_SMPLRT_DIV, 0);	/*sample rate*/
	i2c_write_reg(GYRO_ADDRESS, GYRO_DLPF_FS, (1<<3)|(1<<4)|(1<<0));	/*2000deg/s, 188Hz low pass filter*/
	i2c_write_reg(GYRO_ADDRESS, GYRO_INT_CFG, 0x05);	/*generate interrupt when device is ready or raw data ready*/
	i2c_write_reg(GYRO_ADDRESS, GYRO_PWR_MGM, 0x00);
 
 
	#endif 

	timer_delay_ms(100); 

	u16 i, max = 10;

	i32 ofs_x = 0;
	i32 ofs_y = 0;
	i32 ofs_z = 0;


	g_gyro.x = 0;
	g_gyro.y = 0;
	g_gyro.z = 0;

	g_gyro.x_ofs = 0;
	g_gyro.y_ofs = 0; 
	g_gyro.z_ofs = 0;

	for (i = 0; i < max; i++)
	{
		gyro_read();
		timer_delay_ms(10); 

		ofs_x+= g_gyro.x;
		ofs_y+= g_gyro.y;
		ofs_z+= g_gyro.z;
	}

	g_gyro.x_ofs = ofs_x/max;
	g_gyro.y_ofs = ofs_y/max;
	g_gyro.z_ofs = ofs_z/max;

	g_gyro.x_lp = 0;
	g_gyro.y_lp = 0;
	g_gyro.z_lp = 0;

	g_gyro.x_angle = 0;
	g_gyro.y_angle = 0;
	g_gyro.z_angle = 0;


	return 0;
}

#define GYRO_LPF_COEF	((i16)15)
#define GYRO_ANGLE_MAX	65553



void gyro_read()
{
	u16 tmp;
	tmp = (u16)i2c_read_reg(GYRO_ADDRESS, GYRO_OUT_X_LSB);
	tmp|= ((u16)i2c_read_reg(GYRO_ADDRESS, GYRO_OUT_X_MSB))<<8;
	g_gyro.x = tmp - g_gyro.x_ofs;

	tmp = (u16)i2c_read_reg(GYRO_ADDRESS, GYRO_OUT_Y_LSB);
	tmp|= ((u16)i2c_read_reg(GYRO_ADDRESS, GYRO_OUT_Y_MSB))<<8;
	g_gyro.y = tmp - g_gyro.y_ofs;

	tmp = (u16)i2c_read_reg(GYRO_ADDRESS, GYRO_OUT_Z_LSB);
	tmp|= ((u16)i2c_read_reg(GYRO_ADDRESS, GYRO_OUT_Z_MSB))<<8;
	g_gyro.z = tmp - g_gyro.z_ofs;


	g_gyro.x_lp = (g_gyro.x_lp*GYRO_LPF_COEF + g_gyro.x)/(GYRO_LPF_COEF+1);
	g_gyro.y_lp = (g_gyro.y_lp*GYRO_LPF_COEF + g_gyro.y)/(GYRO_LPF_COEF+1);
	g_gyro.z_lp = (g_gyro.z_lp*GYRO_LPF_COEF + g_gyro.z)/(GYRO_LPF_COEF+1);
	
	g_gyro.x_angle+= g_gyro.x_lp;
	g_gyro.y_angle+= g_gyro.y_lp;
	g_gyro.z_angle+= g_gyro.z_lp;

	if (g_gyro.x_angle > GYRO_ANGLE_MAX)
		g_gyro.x_angle = GYRO_ANGLE_MAX;

	if (g_gyro.x_angle < -GYRO_ANGLE_MAX)
		g_gyro.x_angle = -GYRO_ANGLE_MAX;

	if (g_gyro.y_angle > GYRO_ANGLE_MAX)
		g_gyro.y_angle = GYRO_ANGLE_MAX;

	if (g_gyro.y_angle < -GYRO_ANGLE_MAX)
		g_gyro.y_angle = -GYRO_ANGLE_MAX;

	if (g_gyro.z_angle > GYRO_ANGLE_MAX)
		g_gyro.z_angle = GYRO_ANGLE_MAX;

	if (g_gyro.z_angle < -GYRO_ANGLE_MAX)
		g_gyro.z_angle = -GYRO_ANGLE_MAX;
}