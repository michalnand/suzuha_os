#ifndef _ROBOT_H_
#define _ROBOT_H_

#include "../../os/suzuha_os.h"


#include "pca9685.h"
#include "motor_shield.h"
#include "../lsm9ds0.h"
#include "imu.h"


void robot_init();
void robot_main();

void robot_test_motors();
void robot_test_lsm9ds0();
void robot_test_navigation();

#endif
