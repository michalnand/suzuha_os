#ifndef _SH1106_H_
#define _SH1106_H_


#include "../device/device.h"

#define LCD_SH1106_WIDTH	((u32)128)
#define LCD_SH1106_HEIGHT	((u32)64)


#define SH1106_ADDRESS		(0x78)

#define SSD1306_SETCONTRAST 0x81
#define SSD1306_DISPLAYALLON_RESUME 0xA4
#define SSD1306_DISPLAYALLON 0xA5
#define SSD1306_NORMALDISPLAY 0xA6
#define SSD1306_INVERTDISPLAY 0xA7
#define SSD1306_DISPLAYOFF 0xAE
#define SSD1306_DISPLAYON 0xAF
#define SSD1306_SETDISPLAYOFFSET 0xD3
#define SSD1306_SETCOMPINS 0xDA
#define SSD1306_SETVCOMDETECT 0xDB
#define SSD1306_SETDISPLAYCLOCKDIV 0xD5
#define SSD1306_SETPRECHARGE 0xD9
#define SSD1306_SETMULTIPLEX 0xA8
#define SSD1306_SETLOWCOLUMN 0x00
#define SSD1306_SETHIGHCOLUMN 0x10
#define SSD1306_SETSTARTLINE 0x40
#define SSD1306_MEMORYMODE 0x20
#define SSD1306_COMSCANINC 0xC0
#define SSD1306_COMSCANDEC 0xC8
#define SSD1306_SEGREMAP 0xA0
#define SSD1306_CHARGEPUMP 0x8D
#define SSD1306_EXTERNALVCC 0x1
#define SSD1306_SWITCHCAPVCC 0x2


void LCD_SH1106_init();
void LCD_SH1106_set_cursor(u32 x, u32 y);
void LCD_SH1106_clear_buffer(u8 value);

void LCD_SH1106_flush_buffer();
u32 LCD_SH1106_flush_buffer_partial();

void LCD_SH1106_set_pixel(u32 x, u32 y, u8 value);
u8 LCD_SH1106_get_pixel(u32 x, u32 y);

void lcd_put_char_xy(u32 x, u32 y, u8 c);
void lcd_put_s(char *s);

void lcd_put_int(i32 n, u32 x, u32 y);


#endif
