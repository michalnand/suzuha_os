#ifndef _MPU6050_H_
#define _MPU6050_H_

#include "../device/device.h"


struct sMPU6050
{
  i16 ax, ay, az;
  i16 gx, gy, gz; 
  i16 gx_ofs, gy_ofs, gz_ofs;
  i32 gx_sum, gy_sum, gz_sum;
  i16 temperature;
};

struct sMPU6050 g_mpu6050;


#define MPU6050_ADDRESS       (0x68<<1)

void mpu6050_init();
void mpu6050_read();

#endif
