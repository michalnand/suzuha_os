#ifndef _IR_COMM_EXAMPLE_H_
#define _IR_COMM_EXAMPLE_H_

#include "examples.h"

#ifdef EXAMPLE_IR_COMM

#define THREAD_STACK_SIZE	64

thread_stack_t main_thread_stack[THREAD_STACK_SIZE];
thread_stack_t ir_comm_thread_stack[THREAD_STACK_SIZE];

void main_thread();

#endif

#endif
