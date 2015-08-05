#include "lcd_sharp96.h"
#include "font.h"

u8 lcd_sharp96_mem[SHARP_LCD_VERTICAL_MAX*SHARP_LCD_HORIZONTAL_MAX];

void lcd_sharp96_us_delay(u32 time)
{
	time = (time*48)/6; 

	while (time--)
		__asm("nop");
}

void lcd_sharp96_set_cs()
{
	ROM_GPIOPinWrite(SHARP_LCD_CS_GPIO, SHARP_LCD_CS_PIN, SHARP_LCD_CS_PIN);
	lcd_sharp96_us_delay(1);
}

void lcd_sharp96_clear_cs()
{
	ROM_GPIOPinWrite(SHARP_LCD_CS_GPIO, SHARP_LCD_CS_PIN, 0);	
	lcd_sharp96_us_delay(1);
}

void lcd_sharp96_spib(u8 b)
{
	u8 i;
	for (i = 0; i < 8; i++)
	{
		if (b&(1<<7))
			ROM_GPIOPinWrite(SHARP_LCD_SI_GPIO, SHARP_LCD_SI_PIN, SHARP_LCD_SI_PIN);
		else
			ROM_GPIOPinWrite(SHARP_LCD_SI_GPIO, SHARP_LCD_SI_PIN, 0);

		lcd_sharp96_us_delay(1);
		ROM_GPIOPinWrite(SHARP_LCD_CLK_GPIO, SHARP_LCD_CLK_PIN, SHARP_LCD_CLK_PIN);
		lcd_sharp96_us_delay(1);
		ROM_GPIOPinWrite(SHARP_LCD_CLK_GPIO, SHARP_LCD_CLK_PIN, 0);
		lcd_sharp96_us_delay(1);

		b<<= 1;
	}
}

void lcd_sharp96_init()
{
	ROM_GPIOPinTypeGPIOOutput(SHARP_LCD_POWER_GPIO, SHARP_LCD_POWER_PIN);
	ROM_GPIOPinTypeGPIOOutput(SHARP_LCD_DISP_GPIO, SHARP_LCD_DISP_PIN);
	ROM_GPIOPinTypeGPIOOutput(SHARP_LCD_CS_GPIO, SHARP_LCD_CS_PIN);
	ROM_GPIOPinTypeGPIOOutput(SHARP_LCD_CLK_GPIO, SHARP_LCD_CLK_PIN);
	ROM_GPIOPinTypeGPIOOutput(SHARP_LCD_SI_GPIO, SHARP_LCD_SI_PIN);

    ROM_GPIOPinWrite(SHARP_LCD_POWER_GPIO, SHARP_LCD_POWER_PIN, SHARP_LCD_POWER_PIN);	
    ROM_GPIOPinWrite(SHARP_LCD_DISP_GPIO, SHARP_LCD_DISP_PIN, SHARP_LCD_DISP_PIN);
	
	lcd_sharp96_clear_cs();
	lcd_sharp96_spib(0xff);
}




const u8 lcd_sharp96_referse_data[] = {0x0, 0x8, 0x4, 0xC, 0x2, 0xA, 0x6, 0xE, 0x1, 0x9, 0x5, 0xD, 0x3, 0xB, 0x7, 0xF};
u8 lcd_sharp96_reverse(u8 x)
{
  u8 b = 0;

  b  = lcd_sharp96_referse_data[x & 0xF]<<4;
  b |= lcd_sharp96_referse_data[(x & 0xF0)>>4];
  return b;
}




void lcd_sharp96_flush()
{
	u16 i, j, ptr = 0;

	u8 command = SHARP_LCD_CMD_WRITE_LINE;
	u8 VCOMbit= 0x40;

	command = command^VCOMbit;

	lcd_sharp96_set_cs();

	lcd_sharp96_spib(command);

	for(j = 0; j < LCD_VERTICAL_MAX; j++)
	{
		lcd_sharp96_spib(lcd_sharp96_reverse(j + 1));

		for(i = 0; i < (LCD_HORIZONTAL_MAX>>3); i++)
		{
			lcd_sharp96_spib(lcd_sharp96_mem[ptr]);
			ptr++;
		}

		lcd_sharp96_spib(SHARP_LCD_TRAILER_BYTE);
	}

	lcd_sharp96_spib(SHARP_LCD_TRAILER_BYTE);
    lcd_sharp96_us_delay(2);
	lcd_sharp96_clear_cs();
}

void lcd_sharp96_clear(u8 pattern)
{
	u16 i, j;

	u8 *buffer = (u8*)&(lcd_sharp96_mem[0]);	

	for(j = 0; j < LCD_VERTICAL_MAX; j++)
	{
		for(i = 0; i < (LCD_HORIZONTAL_MAX>>3); i++)
		{
			*buffer = pattern;
			buffer++;
		} 
	}
}


void lcd_sharp96_put_pixel(u32 x, u32 y, u8 pixel)
{
	if (x > LCD_HORIZONTAL_MAX)
		x = LCD_HORIZONTAL_MAX;

	if (y > LCD_VERTICAL_MAX)
		y = LCD_VERTICAL_MAX;

	u32 ptr = (x>>3) + y*(LCD_HORIZONTAL_MAX>>3);

	__disable_irq();

	if (pixel == 0)
		lcd_sharp96_mem[ptr]|= (1<<(7 - (x&7)) );
	else
		lcd_sharp96_mem[ptr]&= ~(1<<(7 - (x&7)) );

	__enable_irq();
}

void lcd_sharp96_put_string(char *str)
{
	u8 *buffer = (u8*)&(lcd_sharp96_mem[0]);

	u16 j,k, str_ptr = 0, buffer_ptr = 0, char_ptr = 0;

	while (str[str_ptr])	
	{
		if (str[str_ptr] != '\n')
		{
			u16 c = (str[str_ptr] - 32)*FONT_WIDTH;
			u8 b = 0;

			for (k = 0; k < FONT_HEIGHT; k++)
			{
				for (j = 0; j < FONT_WIDTH; j++)
				{
					if (lcd_sharp_font_data[c+j]&(1<<k))
						b|=1;
					b<<=1;
				}

				b<<=2;

				buffer[buffer_ptr + k*LCD_CHARS_PER_LINE] = ~b;
			}

			buffer_ptr++;
			str_ptr++;

			char_ptr++;
			if ((char_ptr%LCD_CHARS_PER_LINE) == 0)
				buffer_ptr+= 8*LCD_CHARS_PER_LINE;

		}
		else
		{
			buffer_ptr= (buffer_ptr/(LCD_CHARS_PER_LINE))*(LCD_CHARS_PER_LINE);
			buffer_ptr+= 8*LCD_CHARS_PER_LINE;
			str_ptr++;
			char_ptr = 0;
		}
	}
}