#ifndef _THREADS_BASIC_
#define _THREADS_BASIC_

#include "examples.h"

#ifdef EXAMPLE_THREADS_BASIC

#define THREAD_STACK_SIZE	64

thread_stack_t main_thread_stack[THREAD_STACK_SIZE];
thread_stack_t child1_thread_stack[THREAD_STACK_SIZE];
thread_stack_t child2_thread_stack[THREAD_STACK_SIZE];

void main_thread();

#endif

#endif
