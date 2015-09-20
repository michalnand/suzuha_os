#include "robot.h"

void robot_init()
{
    pca9685_init();
    motor_init();

    lsm9ds0_init();
    imu_init();
}

void robot_main()
{
    /*
    while (get_key() == 0)
    {
        led_on(LED_1);
        timer_delay_ms(200);

        led_off(LED_1);
        timer_delay_ms(200);
    }

    timer_delay_ms(800);
    */

    robot_test_lsm9ds0();
    robot_test_navigation();
}

void robot_test_motors()
{
    led_on(LED_1);

    motor_run(PCA9685_PWM_MAX/2, 0);
    timer_delay_ms(800);

    motor_run(-PCA9685_PWM_MAX/2, 0);
    timer_delay_ms(800);

    motor_run(0, PCA9685_PWM_MAX/2);
    timer_delay_ms(800);

    motor_run(0, -PCA9685_PWM_MAX/2);
    timer_delay_ms(800);

    motor_run(PCA9685_PWM_MAX/2, PCA9685_PWM_MAX/2);
    timer_delay_ms(800);

    motor_run(0, 0);

    led_off(LED_1);
    while (1)
    {
        __asm("nop");
    }
}


void robot_test_lsm9ds0()
{
    u32 tmp = lsm9ds0_init();

    while (1)
    {
        led_on(LED_3);
        time_t timer_start = timer_get_time();
        lsm9ds0_read();
        time_t timer_stop = timer_get_time();
        led_off(LED_3);

        printf_("%u %i %i: ", tmp, g_lsm9ds0_imu.temp, timer_stop - timer_start);
        printf_("[ %i %i %i ] ", g_lsm9ds0_imu.ax, g_lsm9ds0_imu.ay, g_lsm9ds0_imu.az);
        printf_("[ %i %i %i ] ", g_lsm9ds0_imu.mx, g_lsm9ds0_imu.my, g_lsm9ds0_imu.mz);
        printf_("[ %i %i %i ] ", g_lsm9ds0_imu.gx - g_lsm9ds0_imu.gx_ofs, g_lsm9ds0_imu.gy - g_lsm9ds0_imu.gy_ofs, g_lsm9ds0_imu.gz - g_lsm9ds0_imu.gz_ofs);
        printf_("> %i >>>>%i <", (i32)(m_atan2(g_lsm9ds0_imu.ax, g_lsm9ds0_imu.az)*180.0/PI_) , (i32)(m_atan2(g_lsm9ds0_imu.my, g_lsm9ds0_imu.mx)*180.0/PI_) );
        printf_("\n");

        timer_delay_ms(100);
    }
}

void robot_test_navigation()
{
    float e0 = 0.0;
    float e1 = 0.0;

    //PD controller parameters
    float p = 0.4;
    float d = 0.4;

    //gyro low pass filter
    float gyro_filter = 0.0;

    //low pass filter time constant
    float k = 0.8;

    while (1)
    {
        led_on(LED_3);
        lsm9ds0_read();
        led_off(LED_3);

        gyro_filter = k*gyro_filter + (1.0 - k)*(g_lsm9ds0_imu.gz - g_lsm9ds0_imu.gz_ofs); //120? gyro offset error

        e1 = e0;
        e0 = 0.0 - gyro_filter;

        float base = PCA9685_PWM_MAX*0.5;       //base forward speed
        float dif = p*e0 + d*(e0 - e1);         //course correction

        i32 left = base - dif;
        i32 right = base + dif;
        motor_run(left, right);
    }
}
