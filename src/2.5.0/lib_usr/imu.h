#ifndef _IMU_H_
#define _IMU_H_

#include "../device/device.h"


#define IMU_ACCELEROMETER_RANGE                 2       /* 2g range */
#define IMU_MAGNETOETER_RANGE                   2       /* 2 guass range */
#define IMU_GYROSCOPE_RANGE                     2000    /* 2000 degrees/s range */

struct sIMU
{
        i16 roll, pitch, yaw;
};

void imu_init();
void imu_process(struct sIMU lsm9ds0_output);

#endif
