#include "os/suzuha_os.h"
#include "usr/usr_main.h"


void mem_info_print()
{
	extern char _text;
	extern char _data;
	extern char __StackTop;
	extern char _ebss;
	extern char _heap;

	printf_("booting from %u\n", &_text);
	printf_("ram start %u \n", &_data);
	printf_("ram size %u \n", &__StackTop - &_data);
	printf_("ram free %u \n", (&__StackTop - &_data) - (&_ebss - &_data) );
	printf_("heap start %u \n", &_heap);

	printf_("\n\n");
}


int main(void)
{
	lib_low_level_init();
	lib_os_init();
	mem_info_print();

	create_thread(main_thread, main_thread_stack, sizeof(main_thread_stack), PRIORITY_MAX);
	kernel_start();

	return 0;
}
