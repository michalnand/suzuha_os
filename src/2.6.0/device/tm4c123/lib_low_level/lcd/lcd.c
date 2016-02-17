#include "lcd.h"

#define LCD_POWER_ON() ROM_GPIOPinWrite(GPIO_PORTB_BASE, (1<<LCD_ON), (1<<LCD_ON));
#define LCD_POWER_OFF() ROM_GPIOPinWrite(GPIO_PORTB_BASE, (1<<LCD_ON), 0);



#define SHARP_LCD_TRAILER_BYTE        0x00

#define SHARP_VCOM_TOGGLE_BIT           0x40

#define SHARP_LCD_CMD_CHANGE_VCOM     0x00
#define SHARP_LCD_CMD_CLEAR_SCREEN      0x20
#define SHARP_LCD_CMD_WRITE_LINE      0x80


void LCD_CS_HIGH() 
{
	ROM_GPIOPinWrite(GPIO_PORTE_BASE, (1<<LCD_CS), (1<<LCD_CS));
	u32 i = 100;
	while (i--)
		__asm("nop");
}

void LCD_CS_LOW() 
{
	ROM_GPIOPinWrite(GPIO_PORTE_BASE, (1<<LCD_CS), 0);
	u32 i = 100;
	while (i--)
		__asm("nop");
}






void lcd_init()
{
	ROM_GPIOPinTypeGPIOOutput(GPIO_PORTE_BASE, (1<<LCD_CS));
	ROM_GPIOPinTypeGPIOOutput(GPIO_PORTB_BASE, (1<<LCD_ON));

	LCD_CS_LOW();

	LCD_POWER_ON();


	lcd_clear_screen(video_mem, 0xFF);
	lcd_send_mem(video_mem);
}

	const u8 referse_data[] = {0x0, 0x8, 0x4, 0xC, 0x2, 0xA, 0x6, 0xE, 0x1, 0x9, 0x5, 0xD, 0x3, 0xB, 0x7, 0xF};

u8 reverse(u8 x)
{
  u8 b = 0;

  b  = referse_data[x & 0xF]<<4;
  b |= referse_data[(x & 0xF0)>>4];
  return b;
}
 

void lcd_send_mem(u8 *mem)
{
	u32 i, j, ptr = 0;

	LCD_CS_HIGH();

	spib(SHARP_LCD_CMD_WRITE_LINE^0x40);

	for(j = 0; j < LCD_VERTICAL_MAX; j++)
	{
		spib(reverse(j + 1));

		for(i = 0; i < (LCD_HORIZONTAL_MAX>>3); i++)
		{
			spib(mem[ptr]);
			ptr++;
		}

		spib(SHARP_LCD_TRAILER_BYTE);
	}


	spib(SHARP_LCD_TRAILER_BYTE);

    // Ensure a 2us min delay to meet the LCD's thSCS
    i = 200;
    while (i--)
    	__asm("nop");	

    LCD_CS_LOW();
}



void lcd_clear_screen(u8 *mem, u8 pattern)
{
	u32 i, j, ptr = 0;

	for(j = 0; j < LCD_VERTICAL_MAX; j++)
	{
		for(i = 0; i < (LCD_HORIZONTAL_MAX>>3); i++)
		{
			mem[ptr] = pattern;
			ptr++;
		} 
	}
}



void lcd_put_pixel(u8 *mem, u32 x, u32 y, u32 value)
{
	u32 bit = 7 - (x&7);

	u32 idx = (x>>3) + (LCD_HORIZONTAL_MAX>>3)*y;
 

 	__disable_irq(); 


	if (value)
		mem[idx]&=~(1<<bit);
	else
		mem[idx]|=(1<<bit);

	__enable_irq();
}