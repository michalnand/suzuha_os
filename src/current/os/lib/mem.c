#include "mem.h"

mutex_t mutex_mem_;


#define M_USED_FLAG       (1<<0)

unsigned int *m_heap_start;
unsigned int *m_heap_end;
unsigned int m_heap_size;


void mem_init()
{
	extern unsigned int _data;
	extern unsigned int __StackTop;
	extern unsigned int _ebss;
	extern unsigned int _heap;

  m_heap_size = ((&__StackTop - &_data) - (&_ebss - &_data))/sizeof(unsigned int);

  m_heap_start = (unsigned int*)(&_heap);
  m_heap_end = (unsigned int*)(&__StackTop - &_data);

  m_heap_start[0] = 0;            /*clear flag - this block is free*/
  m_heap_start[1] = (m_heap_size-2)*sizeof(unsigned int);  /*size of this block*/


  /*
  printf_("m_heap_start %u\n", m_heap_start);
  printf_("m_heap_end %u\n", m_heap_end);
  printf_("m_heap_size %u\n", m_heap_size);
  */
  mutex_init(&mutex_mem_);
}

void* malloc_safe(u32 size)
{
  #ifdef LIB_MUTEX
  mutex_lock(&mutex_mem_);
  #endif

  void *res = NULL;


  unsigned int * ptr = m_heap_start;
  size = (size/sizeof(unsigned int))+ 1;

  /* find next free block with sufficient size */
  while ( ((*ptr)&M_USED_FLAG) || (*(ptr+1) < size) )
  {
    ptr = ptr + (*(ptr+1)) + 2; /*next block*/

    if (ptr >= m_heap_end)
    {
      #ifdef LIB_MUTEX
      mutex_unlock(&mutex_mem_);
      #endif
      return res;
    }
  }

  unsigned int size_prev = *(ptr+1);
  unsigned int next = size+2;

  *(ptr+0)|= M_USED_FLAG;
  *(ptr+1) = size;

  *(ptr+0+next) = 0;
  *(ptr+1+next) = size_prev - size - 2;

  res  = (ptr+2);


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
