#include "mpu6050.h"

void mpu6050_init()
{
  g_mpu6050.ax = 0;
  g_mpu6050.ay = 0;
  g_mpu6050.az = 0;


  g_mpu6050.gx = 0;
  g_mpu6050.gy = 0;
  g_mpu6050.gz = 0;

  i2c_write_reg(MPU6050_ADDRESS, 0x6B, 0);

  u32 i, ofs_cnt = 100;
  i32 gx_ofs = 0;
  i32 gy_ofs = 0;
  i32 gz_ofs = 0;
  for (i = 0; i < ofs_cnt; i++)
  {
    mpu6050_read();
    timer_delay_ms(10);

    gx_ofs+= g_mpu6050.gx;
    gy_ofs+= g_mpu6050.gy;
    gz_ofs+= g_mpu6050.gz;
  }

  gx_ofs = gx_ofs/(i32)ofs_cnt;
  gy_ofs = gy_ofs/(i32)ofs_cnt;
  gz_ofs = gz_ofs/(i32)ofs_cnt;

  g_mpu6050.gx_ofs = gx_ofs;
  g_mpu6050.gy_ofs = gy_ofs;
  g_mpu6050.gz_ofs = gz_ofs;
}

void mpu6050_read()
{
  g_mpu6050.ax = ((u16)i2c_read_reg(MPU6050_ADDRESS, 0x3B))<<8;
	g_mpu6050.ax|= ((u16)i2c_read_reg(MPU6050_ADDRESS, 0x3C));

	g_mpu6050.ay = ((u16)i2c_read_reg(MPU6050_ADDRESS, 0x3D))<<8;
	g_mpu6050.ay|= ((u16)i2c_read_reg(MPU6050_ADDRESS, 0x3E));

	g_mpu6050.az = ((u16)i2c_read_reg(MPU6050_ADDRESS, 0x3F))<<8;
	g_mpu6050.az|= ((u16)i2c_read_reg(MPU6050_ADDRESS, 0x40));

  g_mpu6050.temperature = ((u16)i2c_read_reg(MPU6050_ADDRESS, 0x41))<<8;
  g_mpu6050.temperature|= ((u16)i2c_read_reg(MPU6050_ADDRESS, 0x42));


  g_mpu6050.gx = ((u16)i2c_read_reg(MPU6050_ADDRESS, 0x43))<<8;
  g_mpu6050.gx|= ((u16)i2c_read_reg(MPU6050_ADDRESS, 0x44));

  g_mpu6050.gy = ((u16)i2c_read_reg(MPU6050_ADDRESS, 0x45))<<8;
  g_mpu6050.gy|= ((u16)i2c_read_reg(MPU6050_ADDRESS, 0x46));

  g_mpu6050.gz = ((u16)i2c_read_reg(MPU6050_ADDRESS, 0x47))<<8;
  g_mpu6050.gz|= ((u16)i2c_read_reg(MPU6050_ADDRESS, 0x48));
}
