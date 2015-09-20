#include "mag.h"

void mag_init()
{
	g_mag.x = 0;
	g_mag.y = 0;
	g_mag.z = 0;

	g_mag.x_ = 0;
	g_mag.y_ = 0;
	g_mag.z_ = 0;

	g_mag.x_hp = 0;
	g_mag.y_hp = 0;
	g_mag.z_hp = 0;
 
	#ifdef  MAG_3110
	 
	//i2c_write_reg(MAG3110_ADDR, MAG3110_CTRL_REG1, 0x81);	/*5Hz active mode*/
	i2c_write_reg(MAG3110_ADDR, MAG3110_CTRL_REG1, (1<<0)); /*active mode*/
	//mag_write(MAG3110_CTRL_REG1, 0xA1);
	i2c_write_reg(MAG3110_ADDR, MAG3110_CTRL_REG2, (1<<7)|(1<<5));			/*active mode, raw mode*/

	#endif 

	#ifdef HMC5883

	i2c_write_reg(HMC5883_ADDR, HMC5883_CONFIG_A_REG, (1<<4)|(1<<3));
	i2c_write_reg(HMC5883_ADDR, HMC5883_CONFIG_B_REG, 0); 
	i2c_write_reg(HMC5883_ADDR, HMC5883_MODE_REG, 0);

	#endif
	
} 

 
void mag_read()
{ 
	u16 tmp;

	g_mag.x_ = g_mag.x;
	g_mag.y_ = g_mag.y;
	g_mag.z_ = g_mag.z;


	#ifdef  MAG_3110

	tmp = ((u16)i2c_read_reg(MAG3110_ADDR, MAG3110_X_MSB))<<8;
	tmp|= ((u16)i2c_read_reg(MAG3110_ADDR, MAG3110_X_LSB));
	g_mag.x = tmp;

		
	tmp = ((u16)i2c_read_reg(MAG3110_ADDR, MAG3110_Y_MSB))<<8;
	tmp|= ((u16)i2c_read_reg(MAG3110_ADDR, MAG3110_Y_LSB));
	g_mag.y = tmp;

	tmp = ((u16)i2c_read_reg(MAG3110_ADDR, MAG3110_Z_MSB))<<8;
	tmp|= ((u16)i2c_read_reg(MAG3110_ADDR, MAG3110_Z_LSB));
	g_mag.z = tmp;

	#endif



	#ifdef  HMC5883

	tmp = ((u16)i2c_read_reg(HMC5883_ADDR, HMC5883_X_MSB))<<8;
	tmp|= ((u16)i2c_read_reg(HMC5883_ADDR, HMC5883_X_LSB));
	g_mag.x = tmp;

		
	tmp = ((u16)i2c_read_reg(HMC5883_ADDR, HMC5883_Y_MSB))<<8;
	tmp|= ((u16)i2c_read_reg(HMC5883_ADDR, HMC5883_Y_LSB));
	g_mag.y = tmp;

	tmp = ((u16)i2c_read_reg(HMC5883_ADDR, HMC5883_Z_MSB))<<8;
	tmp|= ((u16)i2c_read_reg(HMC5883_ADDR, HMC5883_Z_LSB));
	g_mag.z = tmp;

	#endif


	g_mag.x_hp = g_mag.x - g_mag.x_;
	g_mag.y_hp = g_mag.y - g_mag.y_;
	g_mag.z_hp = g_mag.z - g_mag.z_;

}