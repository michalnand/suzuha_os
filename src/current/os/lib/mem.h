#ifndef _MEM_H_
#define _MEM_H_

#include "../suzuha_os.h"


#ifdef __cplusplus
extern "C" {
#endif

#ifndef NULL
#define NULL  0
#endif

void* malloc_safe(u32 size);
void free_safe(void *ptr);


#ifdef __cplusplus
}
#endif

#ifdef __cplusplus


  #include <stdlib.h>

  __extension__ typedef int __guard __attribute__((mode (__DI__)));

  void * operator new(size_t size);
  void operator delete(void * ptr);

/*
  int __cxa_guard_acquire(__guard *g) {return !*(char *)(g);}
  void __cxa_guard_release (__guard *g) {*(char *)g = 1;}
  void __cxa_guard_abort (__guard *) {}
*/
#endif

#endif
