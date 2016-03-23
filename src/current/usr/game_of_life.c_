#include "game_of_life.h"
#include "../lib_usr/math.h"

u8 gol_buffer[LCD_SH1106_HEIGHT>>3][LCD_SH1106_WIDTH];

void gol_set_pixel(u32 x, u32 y, u8 value)
{
	if (value)
		gol_buffer[y>>3][x]|= 1<<(y&7);
	else
		gol_buffer[y>>3][x]&=~(1<<(y&7));
}


u8 gol_get_pixel(u32 x, u32 y)
{
	u8 res = gol_buffer[y>>3][x]&(1<<(y&7));

	if (res)
		return 1;

	return 0;
}

void game_of_life_init()
{
  u32 x, y, i;

  for (y = 0; y < LCD_SH1106_HEIGHT; y++)
    for (x = 0; x < LCD_SH1106_WIDTH; x++)
      gol_set_pixel(x, y, 0);

  for (i = 0; i < 1; i++)
  {
    y = m_rnd()%LCD_SH1106_HEIGHT;
    x = m_rnd()%LCD_SH1106_WIDTH;
    gol_set_pixel((x+1)%LCD_SH1106_WIDTH, (y+0)%LCD_SH1106_HEIGHT, 1);
    gol_set_pixel((x+2)%LCD_SH1106_WIDTH, (y+0)%LCD_SH1106_HEIGHT, 1);
    gol_set_pixel((x+0)%LCD_SH1106_WIDTH, (y+1)%LCD_SH1106_HEIGHT, 1);
    gol_set_pixel((x+1)%LCD_SH1106_WIDTH, (y+1)%LCD_SH1106_HEIGHT, 1);
    gol_set_pixel((x+1)%LCD_SH1106_WIDTH, (y+2)%LCD_SH1106_HEIGHT, 1);
  }

  LCD_SH1106_clear_buffer(0);

  for (y = 0; y < LCD_SH1106_HEIGHT; y++)
    for (x = 0; x < LCD_SH1106_WIDTH; x++)
      LCD_SH1106_set_pixel(x, y, gol_get_pixel(x,y));
}

void game_of_life_process()
{
  i32 y, x;

  for (y = 0; y < (i32)LCD_SH1106_HEIGHT; y++)
    for (x = 0; x < (i32)LCD_SH1106_WIDTH; x++)
    {
      u8 value = 0;
      u8 cnt = 0;

      if (gol_get_pixel((x+1)%LCD_SH1106_WIDTH, y) != 0)
        cnt++;

      if (gol_get_pixel((x+LCD_SH1106_WIDTH-1)%LCD_SH1106_WIDTH, y) != 0)
        cnt++;

      if (gol_get_pixel(x, (y+1)%LCD_SH1106_HEIGHT) != 0)
        cnt++;

      if (gol_get_pixel(x, (y+LCD_SH1106_HEIGHT-1)%LCD_SH1106_HEIGHT) != 0)
        cnt++;



      if (gol_get_pixel((x+1)%LCD_SH1106_WIDTH, (y+1)%LCD_SH1106_HEIGHT) != 0)
        cnt++;

      if (gol_get_pixel((x+LCD_SH1106_WIDTH-1)%LCD_SH1106_WIDTH, (y+1)%LCD_SH1106_HEIGHT) != 0)
        cnt++;

      if (gol_get_pixel((x+1)%LCD_SH1106_WIDTH, (y+LCD_SH1106_HEIGHT-1)%LCD_SH1106_HEIGHT) != 0)
          cnt++;

      if (gol_get_pixel((x+LCD_SH1106_WIDTH-1)%LCD_SH1106_WIDTH, (y+LCD_SH1106_HEIGHT-1)%LCD_SH1106_HEIGHT) != 0)
          cnt++;


      if (gol_get_pixel(x, y) != 0)
      {
        if (cnt < 2)
          value = 0;
        if ((cnt == 2) || (cnt == 3))
          value = 1;
        if (cnt > 3)
          value = 0;
      }
      else
      {
        if (cnt == 3)
          value = 1;
      }

      LCD_SH1106_set_pixel(x, y, value);
    }

  for (y = 0; y < (i32)LCD_SH1106_HEIGHT; y++)
    for (x = 0; x < (i32)LCD_SH1106_WIDTH; x++)
    {
      u8 value = LCD_SH1106_get_pixel(x, y);
      gol_set_pixel(x, y, value);
    }
}
