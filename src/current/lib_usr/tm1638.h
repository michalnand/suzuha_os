#ifndef _TM_1638_H_
#define _TM_1638_H_

#include "../device/device.h"

#define TM_1638_DIO_GPIO    GPIOB
#define TM_1638_DIO         (1<<6)

#define TM_1638_CLK_GPIO    GPIOB
#define TM_1638_CLK         (1<<7)

#define TM_1638_STB_GPIO    GPIOB
#define TM_1638_STB         (1<<0)

void tm1638_init();

#endif
