#include "lib_os.h"

void lib_os_init()
{
	kernel_init();

	#ifdef _LIB_OS_H_
	stdlib_init_();
	#endif

	#ifdef _MESSAGES_F_H
	messages_init();
	#endif

	#ifdef _STDIO_H_
	stdio_init();
	#endif
}
