#ifndef _ROBOT_H_
#define _ROBOT_H_

#include "../os/suzuha_os.h"

#include "../lib_usr/math.h"

#include "../lib_usr/pca9685.h"
#include "../lib_usr/motor_shield.h"

#include "../lib_usr/lsm9ds0.h"
#include "../lib_usr/imu.h"

void robot_init();
void robot_main();

void robot_test_motors();
void robot_test_lsm9ds0();
void robot_test_navigation();

#endif
