#include "imu.h"

#define IMU_ACC_FILTER_COEF         (i32)15
#define IMU_MAG_FILTER_COEF         (i32)15
#define IMU_GYR_FILTER_COEF         (i32)15

void imu_init()
{
    g_imu.roll = 0;
    g_imu.pitch = 0;
    g_imu.yaw = 0;

    g_imu.ax_filter = 0;
    g_imu.ay_filter = 0;
    g_imu.az_filter = 0;

    g_imu.mx_filter = 0;
    g_imu.my_filter = 0;
    g_imu.mz_filter = 0;

    g_imu.gx_filter = 0;
    g_imu.gy_filter = 0;
    g_imu.gz_filter = 0;
}

void imu_process(struct sLSM9DS0IMU lsm9ds0_output)
{
    g_imu.ax_filter = (IMU_ACC_FILTER_COEF*g_imu.ax_filter)/(IMU_ACC_FILTER_COEF + 1) + lsm9ds0_output.ax;
    g_imu.ay_filter = (IMU_ACC_FILTER_COEF*g_imu.ay_filter)/(IMU_ACC_FILTER_COEF + 1) + lsm9ds0_output.ay;
    g_imu.az_filter = (IMU_ACC_FILTER_COEF*g_imu.az_filter)/(IMU_ACC_FILTER_COEF + 1) + lsm9ds0_output.az;
}
