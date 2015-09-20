#include "motor_shield.h"

#include "pca9685.h"

void motor_init()
{
    motor_run(0, 0);
}

void motor_run(i16 left, i16 right)
{
    if (left > PCA9685_PWM_MAX)
        left = PCA9685_PWM_MAX;

    if (left < -PCA9685_PWM_MAX)
        left = -PCA9685_PWM_MAX;

    if (right > PCA9685_PWM_MAX)
        right = PCA9685_PWM_MAX;

    if (right < -PCA9685_PWM_MAX)
        right = -PCA9685_PWM_MAX;

    if (right == 0)
    {
        pca9685_send(2, right);
        pca9685_send(9, PCA9685_PWM_MAX);
        pca9685_send(10, PCA9685_PWM_MAX);
    }
    else
    if (right < 0)
    {
        pca9685_send(8, -right);
        pca9685_send(9, 0);
        pca9685_send(10, PCA9685_PWM_MAX);
    }
    else
    {
        pca9685_send(8, right);
        pca9685_send(9, PCA9685_PWM_MAX);
        pca9685_send(10, 0);
    }


    if (left == 0)
    {
        pca9685_send(13, left);
        pca9685_send(11, PCA9685_PWM_MAX);
        pca9685_send(12, PCA9685_PWM_MAX);
    }
    else
    if (left < 0)
    {
        pca9685_send(13, -left);
        pca9685_send(11, PCA9685_PWM_MAX);
        pca9685_send(12, 0);
    }
    else
    {
        pca9685_send(13, left);
        pca9685_send(11, 0);
        pca9685_send(12, PCA9685_PWM_MAX);
    }
}
