#include "flags.h"


void flag_init(flag_t *flag)
{
	sched_off();
	*flag = FLAG_RESET;
  	sched_on();
}

void flag_set(flag_t *flag)
{
	sched_off();
	*flag = FLAG_SET;
  	sched_on();
}

void flag_clear(flag_t *flag)
{
	sched_off();
	*flag = FLAG_RESET;
  	sched_on();
}

u8 flag_check(flag_t *flag)
{
	flag_t flag_tmp;
	sched_off();
	flag_tmp = *flag;
  	sched_on();

	return flag_tmp;
}
