#include "accelerometer.h"

void accel_init()
{
    g_accel.x = 0;
    g_accel.y = 0;
    g_accel.z = 0;

    g_accel.x_lp = g_accel.x;
    g_accel.y_lp = g_accel.y;
    g_accel.z_lp = g_accel.z;

    #ifdef ACC_MMA8452

    i2c_write_reg(ACC_MMA8452_ADR, ACC_MMA8452_SYSMOD, (1<<0));     /*wake up accelerometer*/
    i2c_write_reg(ACC_MMA8452_ADR, ACC_MMA8452_HP_FILTER_CUTOFF, (1<<5));    /*high pass filter bypassed*/
    i2c_write_reg(ACC_MMA8452_ADR, ACC_MMA8452_CTRL_REG1, (1<<4)|(1<<0));   /*200Hz data rate, active mode*/
    i2c_write_reg(ACC_MMA8452_ADR, ACC_MMA8452_CTRL_REG2, 0);      /*high resolution mode*/
    i2c_write_reg(ACC_MMA8452_ADR, ACC_MMA8452_XYZ_DATA_CFG, 0);        /*2g range*/

    #endif
}



void accel_read()
{
	 #ifdef ACC_MMA8452
    u16 tmp;
    tmp = ((u16)i2c_read_reg(ACC_MMA8452_ADR, ACC_MMA8452_OUT_X_MSB))<<8;
    tmp|= (u16)i2c_read_reg(ACC_MMA8452_ADR, ACC_MMA8452_OUT_X_LSB);
    g_accel.x = tmp;

    tmp = ((u16)i2c_read_reg(ACC_MMA8452_ADR, ACC_MMA8452_OUT_Y_MSB))<<8;
    tmp|= (u16)i2c_read_reg(ACC_MMA8452_ADR, ACC_MMA8452_OUT_Y_LSB);
    g_accel.y = tmp;

    tmp = ((u16)i2c_read_reg(ACC_MMA8452_ADR, ACC_MMA8452_OUT_Z_MSB))<<8;
    tmp|= (u16)i2c_read_reg(ACC_MMA8452_ADR, ACC_MMA8452_OUT_Z_LSB);
    g_accel.z = tmp;

    #endif

    g_accel.x_lp = (g_accel.x_lp*ACCEL_LP_COEF + g_accel.x)/32;
    g_accel.y_lp = (g_accel.y_lp*ACCEL_LP_COEF + g_accel.y)/32;
    g_accel.z_lp = (g_accel.z_lp*ACCEL_LP_COEF + g_accel.z)/32;
}