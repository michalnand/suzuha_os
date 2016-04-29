#ifndef _WS2812_H_
#define _WS2812_H_

#include "../lib_low_level.h"

#define WS2812_NUM_LEDS				((u32)64)

typedef struct
{
	u8 red;
	u8 green;
	u8 blue;
}
	RGB_LED;

void ws2812_init();
void ws2812_demo();
void ws2812_clear();
void ws2812_refresh();

void ws2812_set_led(u32 p, u8 r, u8 g, u8 b);
void ws2812_get_led(u32 p, u8 *r, u8 *g, u8 *b);


#endif
