#ifndef _FLAGS_H_
#define _FLAGS_H_

#include "../suzuha_os.h"


typedef volatile u8 flag_t;

#define LIB_FLAGS			1

#define FLAG_SET 			255
#define FLAG_RESET	 		0

void flag_init(flag_t *flag);
void flag_set(flag_t *flag);
void flag_clear(flag_t *flag);
u8 flag_check(flag_t *flag);

#endif