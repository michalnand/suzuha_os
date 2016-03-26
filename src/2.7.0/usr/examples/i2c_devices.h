#ifndef _I2C_DEVICES_H_
#define _I2C_DEVICES_H_

#include "examples.h"

#ifdef EXAMPLE_I2C_DEVICES

#define THREAD_STACK_SIZE	64

thread_stack_t main_thread_stack[THREAD_STACK_SIZE];
thread_stack_t i2c_devices_thread_stack[THREAD_STACK_SIZE];

void main_thread();

#endif

#endif
