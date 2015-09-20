#ifndef _IMU_H_
#define _IMU_H_

#include "../../device/device.h"
#include "../lsm9ds0.h"

#include "../math.h"


#define IMU_ACCELEROMETER_RANGE                 2       /* 2g range */
#define IMU_MAGNETOETER_RANGE                   2       /* 2 guass range */
#define IMU_GYROSCOPE_RANGE                     2000    /* 2000 degrees/s range */

struct sIMU
{
        i16 roll, pitch, yaw;

        i32 ax_filter, ay_filter, az_filter;
        i32 mx_filter, my_filter, mz_filter;
        i32 gx_filter, gy_filter, gz_filter;
};

struct sIMU g_imu;

void imu_init();
void imu_process(struct sLSM9DS0IMU lsm9ds0_output);

#endif
