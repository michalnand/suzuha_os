#include "apds9950.h"

struct sAPDS9950 g_apds9950;

struct sAPDS9950* get_g_apds9950()
{
	return &g_apds9950;
}

u32 apds950_init()
{
	i2c_write_reg(RGB_ADDRESS, RGB_COMMAND|RGB_ATIME, 0xFF); 			/*2.4ms time*/
	i2c_write_reg(RGB_ADDRESS, RGB_COMMAND|RGB_WTIME, 0xFF); 			/*2.4ms time*/

	i2c_write_reg(RGB_ADDRESS, RGB_COMMAND|RGB_CONFIG, 0); 				/*dont wait long*/
    i2c_write_reg(RGB_ADDRESS, RGB_COMMAND|RGB_ENABLE, (1<<1)|(1<<0));  /*power on, RGBC enable*/


    /*
    	proximity sensor setup
    	100mA LED current
    	use IR diode
    	60x GAIN
    */
    i2c_write_reg(RGB_ADDRESS, RGB_COMMAND|RGB_CONTROL, (1<<5)|(1<<0)|(1<<1));


    /*proximity enable*/
    i2c_write_reg(RGB_ADDRESS, RGB_COMMAND|RGB_ENABLE, (1<<2)|(1<<1)|(1<<0));  /*power on, RGBC enable*/
    i2c_write_reg(RGB_ADDRESS, RGB_COMMAND|RGB_PPULSE, 8);

    apds9950_read();

    return 0;
}

void apds9950_read()
{
    i2cStart();
    i2cWrite(RGB_ADDRESS);
    i2cWrite(RGB_COMMAND|RGB_CDATAL|(1<<5));

    i2cStart();
    i2cWrite(RGB_ADDRESS|0x01);

    g_apds9950.ambient = i2cRead(1);
    g_apds9950.ambient|= ((u16)i2cRead(1))<<8;;

    g_apds9950.r = i2cRead(1);
    g_apds9950.r|= ((u16)i2cRead(1))<<8;;

    g_apds9950.g = i2cRead(1);
    g_apds9950.g|= ((u16)i2cRead(1))<<8;;

    g_apds9950.b = i2cRead(1);
    g_apds9950.b|= ((u16)i2cRead(1))<<8;;

    g_apds9950.proximity = i2cRead(1);
    g_apds9950.proximity|= ((u16)i2cRead(0))<<8;

    i2cStop();
}
