#include "rgb_matrix.h"

#include "../../lib_usr/math.h"
#include "../../lib_usr/sh1106.h"


#ifdef RGB_MATRIX

#define MATRIX_SIZE         (u32)8

u8 matrix[MATRIX_SIZE][MATRIX_SIZE];


void plasma_init()
{
  u32 x, y;
  for (y = 0; y < MATRIX_SIZE; y++)
    for (x = 0; x < MATRIX_SIZE; x++)
      matrix[y][x] = 0;
}

void plasma_process()
{
  u32 x, y;

  u32 time = timer_get_time()/10;

  for(y = 0; y < MATRIX_SIZE; y++)
    for(x = 0; x < MATRIX_SIZE; x++)
    {
      u32 res = 0;

      res+= cos_table[(3*x + time/10)%COS_TABLE_SIZE];
      res+= cos_table[(17*x + 1*time)%COS_TABLE_SIZE];
      res+= cos_table[(6*x + 2*time)%COS_TABLE_SIZE];
      res+= cos_table[(23*(x*y) + 3*time)%COS_TABLE_SIZE];

      res+= cos_table[(4*y + time/13)%COS_TABLE_SIZE];
      res+= cos_table[(18*y + 3*time)%COS_TABLE_SIZE];
      res+= cos_table[(17*y + 2*time)%COS_TABLE_SIZE];
      res+= cos_table[(7*(x-y) + 1*time)%COS_TABLE_SIZE];


      matrix[y][x] = (res/8);
    }
}

void main_thread()
{
  ws2812_init();

  LCD_SH1106_init();
  LCD_SH1106_clear_buffer(0x00);

  plasma_init();

  while (1)
  {
    ws2812_clear();

    u32 x, y, ptr = 0;
    for (y = 0; y < MATRIX_SIZE; y++)
      for (x = 0; x < MATRIX_SIZE; x++)
      {
        u32 r = (matrix[y][x] + 0)%256;
        u32 g = (matrix[y][x] + 85)%256;
        u32 b = (matrix[y][x] + 170)%256;
        ws2812_set_led(ptr, r/32, g/32, b/32);
        ptr++;
      }

    ws2812_refresh();

    plasma_process();

    timer_delay_ms(100);
  }
}



/*
#define MATRIX_INTENSITY    (u32)4

RGB_LED matrix[MATRIX_SIZE][MATRIX_SIZE];


#define BLUE_BASE_X     (u32)0
#define BLUE_BASE_Y     (u32)0

#define RED_BASE_X     (u32)(MATRIX_SIZE-1)
#define RED_BASE_Y     (u32)(MATRIX_SIZE-1)

#define PLAYER_BLUE     (u32)0
#define PLAYER_RED     (u32)0


u32 g_red_score, g_blue_score;


void matrix_init()
{
  u32 x, y;
  for (y = 0; y < MATRIX_SIZE; y++)
    for (x = 0; x < MATRIX_SIZE; x++)
    {
      matrix[y][x].red = 0;
      matrix[y][x].green = 0;
      matrix[y][x].blue = 0;
    }

  matrix[BLUE_BASE_Y][BLUE_BASE_X].blue = 255/2;
  matrix[RED_BASE_Y][RED_BASE_X].red = 255/2;
}

i32 matrix_get_avrg_distance(u32 y0, u32 x0, u32 player)
{
  u32 x, y;

  i32 dist = 0, cnt = 0;
  i32 center_x = 0; i32 center_y = 0;

  if (player == PLAYER_BLUE)
  {
    for (y = 0; y < MATRIX_SIZE; y++)
    for (x = 0; x < MATRIX_SIZE; x++)
      if (matrix[y][x].blue != 0)
      {
        center_x+= x;
        center_y+= y;
        cnt++;
      }

    center_x = center_x/cnt;
    center_y = center_y/cnt;

    dist = m_abs((i32)y0 - (i32)center_y) + m_abs((i32)x0 - (i32)center_x);
  }

  if (player == PLAYER_RED)
  {
    for (y = 0; y < MATRIX_SIZE; y++)
    for (x = 0; x < MATRIX_SIZE; x++)
      if (matrix[y][x].red != 0)
      {
        center_x+= x;
        center_y+= y;
        cnt++;
      }

    center_x = center_x/cnt;
    center_y = center_y/cnt;

    dist = m_abs((i32)y0 - (i32)center_y) + m_abs((i32)x0 - (i32)center_x);
  }


  return dist;
}


void matrix_red()
{
  u32 x, y;

  i32 center_x = 0;
  i32 center_y = 0;
  i32 cnt = 0;
  for (y = 0; y < MATRIX_SIZE; y++)
  for (x = 0; x < MATRIX_SIZE; x++)
    if (matrix[y][x].red != 0)
    {
      center_x+= x;
      center_y+= y;
      cnt++;
    }

  center_x/= cnt;
  center_y/= cnt;

  i32 dist_min = MATRIX_SIZE*MATRIX_SIZE;
  u32 x_place = 0;
  u32 y_place = 0;


  for (y = 0; y < MATRIX_SIZE; y++)
  for (x = 0; x < MATRIX_SIZE; x++)
  if ((matrix[y][x].red == 0) && (matrix[y][x].blue == 0))
  {
    i32 dist = m_abs((i32)y - (i32)center_y) + m_abs((i32)x - (i32)center_x);
    if (dist < dist_min)
    {
      dist_min = dist;
      x_place = x;
      y_place = y;
    }
  }

  if ((matrix[y_place][x_place].red == 0) && (matrix[y_place][x_place].blue == 0))
    matrix[y_place][x_place].red = MATRIX_INTENSITY;
}

void matrix_blue()
{
  u32 x, y;

  i32 center_x = 0;
  i32 center_y = 0;
  i32 cnt = 0;
  for (y = 0; y < MATRIX_SIZE; y++)
  for (x = 0; x < MATRIX_SIZE; x++)
    if (matrix[y][x].blue != 0)
    {
      center_x+= x;
      center_y+= y;
      cnt++;
    }

  center_x/= cnt;
  center_y/= cnt;

  i32 dist_min = MATRIX_SIZE*MATRIX_SIZE;
  u32 x_place = 0;
  u32 y_place = 0;


  for (y = 0; y < MATRIX_SIZE; y++)
  for (x = 0; x < MATRIX_SIZE; x++)
  if ((matrix[y][x].red == 0) && (matrix[y][x].blue == 0))
  {
    i32 dist = m_abs((i32)y - (i32)center_y) + m_abs((i32)x - (i32)center_x);
    if (dist < dist_min)
    {
      dist_min = dist;
      x_place = x;
      y_place = y;
    }
  }

  if ((matrix[y_place][x_place].red == 0) && (matrix[y_place][x_place].blue == 0))
    matrix[y_place][x_place].blue = MATRIX_INTENSITY;
}

void matrix_play()
{
  matrix_red();
  matrix_blue();
}

void matrix_process()
{
  u32 x, y;

  for (y = 0; y < MATRIX_SIZE; y++)
  for (x = 0; x < MATRIX_SIZE; x++)
    matrix[y][x].green = 0;

  for (y = 0; y < MATRIX_SIZE; y++)
  for (x = 0; x < MATRIX_SIZE; x++)
    if  ((y!= BLUE_BASE_Y) && (x!= BLUE_BASE_X))
    if  (matrix[y][x].blue != 0)
    {
      u32 avrg_distance = matrix_get_avrg_distance(y, x, PLAYER_BLUE);
      if ((m_rnd()%100) < avrg_distance)
      {
        matrix[y][x].blue = 0;
      }
    }

  for (y = 0; y < MATRIX_SIZE; y++)
  for (x = 0; x < MATRIX_SIZE; x++)
    if  ((y!= RED_BASE_Y) && (x!= RED_BASE_X))
    if  (matrix[y][x].red != 0)
    {
      u32 avrg_distance = matrix_get_avrg_distance(y, x, PLAYER_RED);
      if ((m_rnd()%100) < avrg_distance)
      {
        matrix[y][x].red = 0;
      }
    }

  u32 red = 0, blue = 0;
  for (y = 0; y < MATRIX_SIZE; y++)
  for (x = 0; x < MATRIX_SIZE; x++)
  {
    if  (matrix[y][x].red != 0)
      red++;
    if  (matrix[y][x].blue != 0)
      blue++;
  }

  g_red_score = red;
  g_blue_score = blue;
}

void main_thread()
{
  ws2812_init();
  matrix_init();

  LCD_SH1106_init();
  LCD_SH1106_clear_buffer(0x00);

  while (1)
  {
    ws2812_clear();

    u32 x, y, ptr = 0;
    for (y = 0; y < MATRIX_SIZE; y++)
      for (x = 0; x < MATRIX_SIZE; x++)
      {
        ws2812_set_led(ptr, matrix[y][x].red, matrix[y][x].green, matrix[y][x].blue);
        ptr++;
      }

    ws2812_refresh();

    matrix_play();
    matrix_process();

    timer_delay_ms(100);


    //put data on display
    if (LCD_SH1106_flush_buffer_partial() == 0)
    {
      LCD_SH1106_clear_buffer(0x00);

      lcd_put_int(g_red_score, 64, 0);
      lcd_put_int(g_blue_score, 64, 16);
      lcd_put_int(timer_get_time(), 64, 32);
    }


  }
}
*/



#endif
