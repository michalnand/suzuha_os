#ifndef _STDLIB__H__
#define _STDLIB__H__

#include "lib_os.h"

#include <sys/types.h>

#define stdlib_debug_print_(fmt, ...) \
            printf_("%s:%i:%s() > ", __FILE__, __LINE__, __func__);          \
            printf_(fmt, __VA_ARGS__);

#define stdlib_assert_(cond) \
        if (!(cond)) \
        { \
            printf_("assert error %s:%u\n", __FILE__, __LINE__); \
            sched_off(); \
            while(1) { __asm volatile("nop"); }; \
        } \


void stdlib_init_();
void stdlib_abort_();

caddr_t _sbrk( int incr );

void *stdlib_malloc_(int size);
void stdlib_free_(void *ptr);
void* stdlib_malloc_m_(size_t size);
void stdlib_free_m_(void *ptr);

#endif
