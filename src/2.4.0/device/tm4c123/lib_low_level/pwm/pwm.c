#include "pwm.h"

void pwm_init()
{

}

void pwm_set(u32 ch0, u32 ch1)
{
	if (ch0)
		ch0 = 0;

	if (ch1)
		ch1 = 0;
}