#ifndef _LCD_H_
#define _LCD_H_


#include "../lib_low_level.h"

#define LCD_CS		5 	//	PORTE 5
#define LCD_ON		5	//	PORTB 5


#define LCD_HORIZONTAL_MAX	(u32)96
#define LCD_VERTICAL_MAX	(u32)96


u8 video_mem[(LCD_HORIZONTAL_MAX*LCD_VERTICAL_MAX)/(u32)8];

void lcd_init();
void lcd_send_mem(u8 *mem);
void lcd_clear_screen(u8 *mem, u8 pattern);

void lcd_put_pixel(u8 *mem, u32 x, u32 y, u32 value);

#endif