#ifndef _MPU6050_H_
#define _MPU6050_H_

#include "../device/device.h"

#ifdef __cplusplus
extern "C" {
#endif


struct sMPU6050
{
  i16 ax, ay, az;
  i16 gx, gy, gz;
  i16 gx_ofs, gy_ofs, gz_ofs;
  i32 gx_sum, gy_sum, gz_sum;
  i16 temperature;
};


#define MPU6050_ADDRESS       (0x68<<1)

struct sMPU6050* get_g_mpu6050();

void mpu6050_init();
void mpu6050_read();

#ifdef __cplusplus
}
#endif

#endif
