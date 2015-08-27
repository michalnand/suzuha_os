#include "mem_test.h"



void mem_test()
{
    stdlib_debug_print_("mem test start\n", NULL);

    u32 i, j;
    u32 array_size_b = 8;
    u32 array_size_a = 100;

    u32 **array;

    array = (u32**)stdlib_malloc_(array_size_b*sizeof(u32*));

    for (j = 0; j < array_size_b; j++)
    {
        array[j] = (u32*)stdlib_malloc_(array_size_a*sizeof(u32));
        for (i = 0; i < array_size_a; i++)
            array[j][i] = i ;
    }

    for (j = 0; j < array_size_b; j++)
        stdlib_free_(array[j]);

    stdlib_free_(array);

    stdlib_debug_print_("mem test done\n", NULL);
}
