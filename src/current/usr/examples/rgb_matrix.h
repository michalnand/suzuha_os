#ifndef _RGB_MATRIX_H_
#define _RGB_MATRIX_H_

#include "examples.h"

#ifdef RGB_MATRIX

#define THREAD_STACK_SIZE	64

thread_stack_t main_thread_stack[THREAD_STACK_SIZE];
void main_thread();

#endif

#endif
