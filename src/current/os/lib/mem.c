#include "mem.h"

extern char _heap;


mutex_t mutex_mem_;

void mem_init()
{
  mutex_init(&mutex_mem_);
}

void* malloc_safe(u32 size)
{
  (void)size;

  #ifdef LIB_MUTEX
  mutex_lock(&mutex_mem_);
  #endif


  void *res;
  res = (void*)&_heap;


  #ifdef LIB_MUTEX
  mutex_unlock(&mutex_mem_);
  #endif

  return res;
}

void free_safe(void *ptr)
{
  #ifdef LIB_MUTEX
  mutex_lock(&mutex_mem_);
  #endif

  (void)ptr;

  #ifdef LIB_MUTEX
  mutex_unlock(&mutex_mem_);
  #endif
}
