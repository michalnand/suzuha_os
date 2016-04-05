#ifndef _ADC_EXMAPLE_H_
#define _ADC_EXMAPLE_H_

#include "examples.h"


#ifdef EXAMPLE_ADC

#define THREAD_STACK_SIZE	64

thread_stack_t main_thread_stack[THREAD_STACK_SIZE];
thread_stack_t adc_thread_stack[THREAD_STACK_SIZE];

void main_thread();

#endif


#endif
