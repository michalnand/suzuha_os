#include "os/suzuha_os.h"
#include "usr/usr_main.h"


#include "lib_usr/st7781/st7781.h"

int main(void) 
{
	
	lib_low_level_init();
	lib_os_init();


	create_thread(main_thread, main_thread_stack, sizeof(main_thread_stack), PRIORITY_MAX);
	kernel_start();

	return 0;
}