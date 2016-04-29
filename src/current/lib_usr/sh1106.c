#include "sh1106.h"
#include "font.h"


volatile u16 LCD_SH1106_state, LCD_SH1106_h_ptr;
volatile u8 LCD_SH1106_frame_buffer[LCD_SH1106_HEIGHT>>3][LCD_SH1106_WIDTH];


void LCD_SH1106_write_command(u8 command)
{
	i2c_write_reg(SH1106_ADDRESS, 0x00, command);
}

void LCD_SH1106_write_data(u8 data)
{
	i2c_write_reg(SH1106_ADDRESS, 0x40, data);
}

void LCD_SH1106_set_cursor(u32 x, u32 y)
{
	u8 m_col = x + 2;
	u8 m_row = y;
	LCD_SH1106_write_command(0xb0 + m_row);
	LCD_SH1106_write_command(m_col & 0xf);//set lower column address
	LCD_SH1106_write_command(0x10 | (m_col >> 4));//set higher column address
}

void LCD_SH1106_set_pixel(u32 x, u32 y, u8 value)
{
	sched_off();
	if (value)
		LCD_SH1106_frame_buffer[y>>3][x]|= 1<<(y&7);
	else
		LCD_SH1106_frame_buffer[y>>3][x]&=~(1<<(y&7));
	sched_on();
}

void LCD_SH1106_set8_pixel(u32 x, u32 y, u8 value)
{
	LCD_SH1106_frame_buffer[y][x] = value;
}

u8 LCD_SH1106_get_pixel(u32 x, u32 y)
{
	u8 res = LCD_SH1106_frame_buffer[y>>3][x]&(1<<(y&7));

	if (res)
		return 1;

	return 0;
}

void LCD_SH1106_clear_buffer(u8 value)
{
	volatile u32 j, i;
	for (j = 0; j < (LCD_SH1106_HEIGHT>>3); j++)
		for (i = 0; i < LCD_SH1106_WIDTH; i++)
		{
			LCD_SH1106_frame_buffer[j][i] = value;
		}
}

void LCD_SH1106_flush_buffer()
{
	LCD_SH1106_write_command(SSD1306_SETLOWCOLUMN | 0x0); // low col = 0
	LCD_SH1106_write_command(SSD1306_SETHIGHCOLUMN | 0x0); // hi col = 0
	LCD_SH1106_write_command(SSD1306_SETSTARTLINE | 0x0); // line #0

	volatile u32 i, j, k;
	for (i = 0; i < (LCD_SH1106_HEIGHT>>3); i++)
	{
		// send a bunch of data in one xmission
		LCD_SH1106_write_command(0xB0 + i + 0);		//set page address
		LCD_SH1106_write_command((0 + 2) & 0xf);	//set lower column address
		LCD_SH1106_write_command(0x10 | (0 >> 4));	//set higher column address
		u32 ptr = 0;
		for(j = 0; j < 8; j++)
		{
			i2cStart();
    		i2cWrite(SH1106_ADDRESS);
			i2cWrite(0x40);
			for (k = 0; k < (LCD_SH1106_WIDTH>>3); k++)
				i2cWrite(LCD_SH1106_frame_buffer[i][ptr++]);
			i2cStop();
		}
	}

	LCD_SH1106_set_cursor(0, 0);
}

u32 LCD_SH1106_flush_buffer_partial()
{
	u32 ptr = 0;
	u32 res = 1;
	u32 i, j, k;

	switch (LCD_SH1106_state)
	{
		case 0:
					LCD_SH1106_write_command(SSD1306_SETLOWCOLUMN | 0x0); // low col = 0
					LCD_SH1106_write_command(SSD1306_SETHIGHCOLUMN | 0x0); // hi col = 0
					LCD_SH1106_write_command(SSD1306_SETSTARTLINE | 0x0); // line #0

					LCD_SH1106_h_ptr = 0;
					LCD_SH1106_state = 1;
					break;

		case 1:
					i = LCD_SH1106_h_ptr;
					// send a bunch of data in one xmission
					LCD_SH1106_write_command(0xB0 + i + 0);		//set page address
					LCD_SH1106_write_command((0 + 2) & 0xf);	//set lower column address
					LCD_SH1106_write_command(0x10 | (0 >> 4));	//set higher column address
					ptr = 0;
					for(j = 0; j < 8; j++)
					{

						i2cStart();
						i2cWrite(SH1106_ADDRESS);
						i2cWrite(0x40);
						for (k = 0; k < (LCD_SH1106_WIDTH>>3); k++)
							i2cWrite(LCD_SH1106_frame_buffer[i][ptr++]);
						i2cStop();

						/*
						u8 *tmp;
						tmp = (u8*)&(LCD_SH1106_frame_buffer[i][ptr]);
						i2c_write_block(SH1106_ADDRESS, 0x40, tmp, (LCD_SH1106_WIDTH>>3));
						ptr+= (LCD_SH1106_WIDTH>>3);
						*/
					}

					LCD_SH1106_h_ptr++;

					if (LCD_SH1106_h_ptr >= (LCD_SH1106_HEIGHT>>3))
					{
						LCD_SH1106_state = 2;
					}

					break;

		case 2:
					LCD_SH1106_set_cursor(0, 0);
					LCD_SH1106_state = 0;
					res = 0;
					break;

		default:
					LCD_SH1106_state = 0;
					break;
	}

	return res;
}




void LCD_SH1106_init()
{
	LCD_SH1106_write_command(0xAE); /*display off*/
	LCD_SH1106_write_command(0x02); /*set lower column address*/
	LCD_SH1106_write_command(0x10); /*set higher column address*/
	LCD_SH1106_write_command(0x40); /*set display start line*/
	LCD_SH1106_write_command(0xB0); /*set page address*/
	LCD_SH1106_write_command(0x81); /*contract control*/
	LCD_SH1106_write_command(0x80); /*128*/
	LCD_SH1106_write_command(0xA1); /*set segment remap*/
	LCD_SH1106_write_command(0xA6); /*normal / reverse*/
	LCD_SH1106_write_command(0xA8); /*multiplex ratio*/
	LCD_SH1106_write_command(0x3F); /*duty = 1/32*/
	LCD_SH1106_write_command(0xad); /*set charge pump enable*/
	LCD_SH1106_write_command(0x8b); /*external VCC */
	LCD_SH1106_write_command(0x30); /*0X30---0X33 set VPP 9V liangdu!!!!*/
	LCD_SH1106_write_command(0xC8); /*Com scan direction*/
	LCD_SH1106_write_command(0xD3); /*set display offset*/
	LCD_SH1106_write_command(0x00); /* 0x20 */
	LCD_SH1106_write_command(0xD5); /*set osc division*/
	LCD_SH1106_write_command(0x80);
	LCD_SH1106_write_command(0xD9); /*set pre-charge period*/
	LCD_SH1106_write_command(0x1f); /*0x22*/
	LCD_SH1106_write_command(0xDA); /*set COM pins*/
	LCD_SH1106_write_command(0x12);
	LCD_SH1106_write_command(0xdb); /*set vcomh*/
	LCD_SH1106_write_command(0x40);
	LCD_SH1106_write_command(0xAF); /*display ON*/

 	LCD_SH1106_clear_buffer(0);
	LCD_SH1106_flush_buffer();

	LCD_SH1106_state = 0;
	LCD_SH1106_h_ptr = 0;
}



void lcd_put_char_xy(u32 x, u32 y, u8 c)
{
	u32 j, i;

	if (c < 32)
		c = 0;
	else
		c-= 32;

	/*
	u32 idx = (u32)c*FONT_WIDTH;

	for (j = 0; j < FONT_HEIGHT; j++)
		for (i = 0; i < FONT_WIDTH; i++)
		{
			u32 tmp_x = FONT_HEIGHT - j + x;
			u32 tmp_y = i + y;

			u8 b = font_data[idx + i];
			u8 shift = j;


			if (tmp_x > LCD_SH1106_WIDTH)
				tmp_x = LCD_SH1106_WIDTH;

			if (tmp_y > LCD_SH1106_HEIGHT)
				tmp_y = LCD_SH1106_HEIGHT;

			#ifdef FONT_FLIP
			LCD_SH1106_set_pixel(LCD_SH1106_WIDTH - tmp_x, LCD_SH1106_HEIGHT - tmp_y, b&(1<<shift));
			#else
			LCD_SH1106_set_pixel(tmp_x, tmp_y, b&(1<<shift));
			#endif
		}
	*/
	u32 idx = (u32)c*FONT_WIDTH*(FONT_HEIGHT>>3);

	for (j = 0; j < FONT_HEIGHT; j++)
		for (i = 0; i < FONT_WIDTH; i++)
		{
			u32 tmp_x = FONT_HEIGHT - j + x;
			u32 tmp_y = i + y;

			u8 b = font_data[idx + i + 8*(j/8)];
			u8 shift = j;

			if (tmp_x > LCD_SH1106_WIDTH)
				tmp_x = LCD_SH1106_WIDTH;

			if (tmp_y > LCD_SH1106_HEIGHT)
				tmp_y = LCD_SH1106_HEIGHT;

			#ifdef FONT_FLIP
			LCD_SH1106_set_pixel(LCD_SH1106_WIDTH - tmp_x, LCD_SH1106_HEIGHT - tmp_y, b&(1<<shift));
			#else
			LCD_SH1106_set_pixel(tmp_x, tmp_y, b&(1<<shift));
			#endif
		}
}

void lcd_put_s(char *s)
{
	LCD_SH1106_clear_buffer(0);

	char c;
	u32 x = 0, y = 0;
	while ( (c = *s++) != '\0')
	{
		lcd_put_char_xy(x, y, c);
		x+= FONT_HEIGHT;
		if (x >= LCD_SH1106_WIDTH)
		{
			x = 0;
			y+= FONT_WIDTH;
		}
	}
}


void lcd_put_int(i32 n, u32 x, u32 y)
{
	char flag = 0, s[12];
	u32 ptr;

	if (n < 0)
	{
			n = -n;
		flag = 1;
	}

	s[11] = '\0';
	ptr = 10;

	do
	{
			s[ptr] = '0' + (n%10);
			n/= 10;
			ptr--;
	}
		while (n != 0);

	if (flag)
		s[ptr] = '-';
	else
		ptr++;

	//puts_(s + ptr);
	u32 i;
	for (i = 0; i < 12; i++)
	{
		lcd_put_char_xy(x + i*8, y, s[ptr + i]);
		if (s[ptr + i] == '\0')
			break;
	}
}
