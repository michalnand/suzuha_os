#ifndef _USR_MAIN_H_
#define _USR_MAIN_H_


#include "../os/suzuha_os.h"


#define THREAD_STACK_SIZE	128

thread_stack_t main_thread_stack[THREAD_STACK_SIZE];
thread_stack_t sensor_thread_stack[THREAD_STACK_SIZE];

void main_lp_test();
void main_thread();

#endif
