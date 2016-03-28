#ifndef _EXAMPLES_H_
#define _EXAMPLES_H_

#include "../../os/suzuha_os.h"

/* #define EXAMPLE_THREADS_BASIC */
 #define EXAMPLE_I2C_DEVICES  
/* #define EXAMPLE_IR_COMM */


#ifdef EXAMPLE_THREADS_BASIC
#include "threads_basic.h"
#endif

#ifdef EXAMPLE_I2C_DEVICES
#include "i2c_devices.h"
#endif

#ifdef EXAMPLE_IR_COMM
#include "ir_comm_example.h"
#endif

#endif
