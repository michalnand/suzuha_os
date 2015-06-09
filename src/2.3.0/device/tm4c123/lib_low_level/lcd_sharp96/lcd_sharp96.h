#ifndef _LCD_SHARP96_H_
#define _LCD_SHARP96_H_
 
#include "../lib_low_level.h"

#define SHARP_LCD_POWER_GPIO	GPIO_PORTB_BASE
#define SHARP_LCD_POWER_PIN		GPIO_PIN_5

#define SHARP_LCD_DISP_GPIO		GPIO_PORTE_BASE
#define SHARP_LCD_DISP_PIN		GPIO_PIN_4

#define SHARP_LCD_CS_GPIO		GPIO_PORTE_BASE
#define SHARP_LCD_CS_PIN		GPIO_PIN_5

#define SHARP_LCD_CLK_GPIO		GPIO_PORTB_BASE
#define SHARP_LCD_CLK_PIN		GPIO_PIN_4

#define SHARP_LCD_SI_GPIO		GPIO_PORTB_BASE
#define SHARP_LCD_SI_PIN		GPIO_PIN_7



// LCD Screen Dimensions
#define SHARP_LCD_VERTICAL_MAX                   (u32)96
#define SHARP_LCD_HORIZONTAL_MAX                 (u32)96




#define SHARP_MAX_PALETTE_COLORS  			2

#define SHARP_BLACK             			0x00
#define SHARP_WHITE             			0xFF

#define SHARP_SEND_TOGGLE_VCOM_COMMAND    	0x01
#define SHARP_SKIP_TOGGLE_VCOM_COMMAND    	0x00

#define SHARP_LCD_TRAILER_BYTE        		0x00

#define SHARP_VCOM_TOGGLE_BIT           	0x40

#define SHARP_LCD_CMD_CHANGE_VCOM     		0x00
#define SHARP_LCD_CMD_CLEAR_SCREEN      	0x20
#define SHARP_LCD_CMD_WRITE_LINE      		0x80


void lcd_sharp96_init();

void lcd_sharp96_init();
void lcd_sharp96_flush();

void lcd_sharp96_clear(u8 pattern);

void lcd_sharp96_put_pixel(u32 x, u32 y, u8 pixel);
void lcd_sharp96_put_string(char *str);


#endif