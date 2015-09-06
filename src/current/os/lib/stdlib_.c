#include "stdlib_.h"
#include <sys/types.h>
// #include <stdlib.h>


mutex_t g_stdlib_malloc_mutex;
char* heap_ptr_prev;
char* heap_ptr;


void stdlib_init_()
{
    mutex_init(&g_stdlib_malloc_mutex);

    extern char _heap;
    heap_ptr = &_heap;
    heap_ptr_prev = heap_ptr;
} 

void stdlib_abort_()
{
    stdlib_debug_print_("aborted\n", NULL);

    while (1)
    {
        __asm("nop");
    }
}

caddr_t _sbrk( int incr )
{
    heap_ptr_prev = heap_ptr;

    heap_ptr += incr;

    return (caddr_t)heap_ptr_prev;
}

void *stdlib_malloc_(int size)
{
    void *res;
    res = (void*)_sbrk(size);

    stdlib_debug_print_("alocated %u\n", (u32)res);

    return (void*)_sbrk(size);
    //return malloc(size);
}

void stdlib_free_(void *ptr)
{
    heap_ptr = ptr;
    stdlib_debug_print_("free %u\n", heap_ptr);
    //free(ptr);
}

void* stdlib_malloc_m_(size_t size)
{
    void *res;
    mutex_lock(&g_stdlib_malloc_mutex);
    res = stdlib_malloc_(size);
    mutex_unlock(&g_stdlib_malloc_mutex);

    stdlib_assert_(res != NULL);

    return res;
}

void stdlib_free_m_(void *ptr)
{
    mutex_lock(&g_stdlib_malloc_mutex);
    stdlib_free_(ptr);
    mutex_unlock(&g_stdlib_malloc_mutex);
}







/*
void* operator new(size_t size) noexcept
{
    return malloc(size);
}

void operator delete(void *p) noexcept
{
    free(p);
}

void* operator new[](size_t size) noexcept
{
    return operator new(size); // Same as regular new
}

void operator delete[](void *p) noexcept
{
    operator delete(p); // Same as regular delete
}

void* operator new(size_t size, std::nothrow_t) noexcept
{
    return operator new(size); // Same as regular new
}

void operator delete(void *p,  std::nothrow_t) noexcept
{
    operator delete(p); // Same as regular delete
}

void* operator new[](size_t size, std::nothrow_t) noexcept
{
    return operator new(size); // Same as regular new
}

void operator delete[](void *p,  std::nothrow_t) noexcept
{
    operator delete(p); // Same as regular delete
}
*/
