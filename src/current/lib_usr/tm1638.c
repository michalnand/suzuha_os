#include "tm1638.h"

void tm1638_send(u8 b);
void tm1638_send_command(u8 command);
void tm1638_send_data(u8 address, u8 data);



void tm1638_init()
{
  GPIO_InitTypeDef        GPIO_InitStructure;

  GPIO_InitStructure.GPIO_Pin = TM_1638_STB;
  GPIO_InitStructure.GPIO_Mode = GPIO_Mode_OUT;
  GPIO_InitStructure.GPIO_OType = GPIO_OType_PP;
  GPIO_InitStructure.GPIO_Speed = GPIO_Speed_50MHz;
  GPIO_InitStructure.GPIO_PuPd = GPIO_PuPd_NOPULL;
  GPIO_Init(TM_1638_STB_GPIO, &GPIO_InitStructure);

  TM_1638_STB_GPIO->BSRR = TM_1638_STB;

  GPIO_InitStructure.GPIO_Pin = TM_1638_CLK;
  GPIO_InitStructure.GPIO_Mode = GPIO_Mode_OUT;
  GPIO_InitStructure.GPIO_OType = GPIO_OType_PP;
  GPIO_InitStructure.GPIO_Speed = GPIO_Speed_50MHz;
  GPIO_InitStructure.GPIO_PuPd = GPIO_PuPd_NOPULL;
  GPIO_Init(TM_1638_CLK_GPIO, &GPIO_InitStructure);

  TM_1638_CLK_GPIO->BSRR = TM_1638_CLK;


  GPIO_InitStructure.GPIO_Pin = TM_1638_DIO;
  GPIO_InitStructure.GPIO_Mode = GPIO_Mode_OUT;
  GPIO_InitStructure.GPIO_OType = GPIO_OType_PP;
  GPIO_InitStructure.GPIO_Speed = GPIO_Speed_50MHz;
  GPIO_InitStructure.GPIO_PuPd = GPIO_PuPd_NOPULL;
  GPIO_Init(TM_1638_DIO_GPIO, &GPIO_InitStructure);

  TM_1638_DIO_GPIO->BRR = TM_1638_DIO;


  u8 i;
  TM_1638_STB_GPIO->BRR = TM_1638_STB;
  tm1638_send(0xC0);
  for (i = 0; i < 16; i++)
    tm1638_send(0x00);
  TM_1638_STB_GPIO->BSRR = TM_1638_STB;

  send_display();
}


void send_display()
{
  u8 data = 0xAB;
  u8 i;
  for ( i = 0; i < 8; i++)
    tm1638_send_data(i << 1, data);
}

/*
u8 tm1638_get_keys()
{
  u8 keys = 0;

  digitalWrite(strobePin, LOW);
  send(0x42);
  for (int i = 0; i < 4; i++) {
    keys |= receive() << i;
  }
  digitalWrite(strobePin, HIGH);

  return keys;
}
*/

void tm1638_send(u8 b)
{
  u8 i;
  for (i = 0; i < 8; i++)
  {
    TM_1638_CLK_GPIO->BRR = TM_1638_CLK;

    if (b&0x01)
      TM_1638_DIO_GPIO->BSRR = TM_1638_DIO;
    else
      TM_1638_DIO_GPIO->BRR = TM_1638_DIO;

    b>>=1;
    TM_1638_CLK_GPIO->BSRR = TM_1638_CLK;

    u32 tmp = 100;
    while (tmp--)
      __asm("nop");
  }
}


u8 tm1638_read()
{
  u8 tmp = 0;

  GPIO_InitTypeDef        GPIO_InitStructure;
  GPIO_InitStructure.GPIO_Pin = TM_1638_DIO;
  GPIO_InitStructure.GPIO_Mode = GPIO_Mode_IN;
  GPIO_InitStructure.GPIO_OType = GPIO_OType_PP;
  GPIO_InitStructure.GPIO_Speed = GPIO_Speed_50MHz;
  GPIO_InitStructure.GPIO_PuPd = GPIO_PuPd_UP;
  GPIO_Init(TM_1638_DIO_GPIO, &GPIO_InitStructure);


  u8 i;
  for (i = 0; i < 8; i++)
  {
    tmp>>= 1;

    TM_1638_CLK_GPIO->BRR = TM_1638_CLK;

    if (TM_1638_DIO_GPIO->IDR&TM_1638_DIO)
      tmp |= (1<<7);

    TM_1638_CLK_GPIO->BSRR = TM_1638_CLK;
  }

  GPIO_InitStructure.GPIO_Pin = TM_1638_DIO;
  GPIO_InitStructure.GPIO_Mode = GPIO_Mode_OUT;
  GPIO_InitStructure.GPIO_OType = GPIO_OType_PP;
  GPIO_InitStructure.GPIO_Speed = GPIO_Speed_50MHz;
  GPIO_InitStructure.GPIO_PuPd = GPIO_PuPd_NOPULL;
  GPIO_Init(TM_1638_DIO_GPIO, &GPIO_InitStructure);

  TM_1638_DIO_GPIO->BSRR = TM_1638_DIO;

  return tmp;
}

void tm1638_send_command(u8 command)
{
  TM_1638_STB_GPIO->BRR = TM_1638_STB;
  tm1638_send(command);
  TM_1638_STB_GPIO->BSRR = TM_1638_STB;
}

void tm1638_send_data(u8 address, u8 data)
{
  tm1638_send_command(0x44);
  TM_1638_STB_GPIO->BRR = TM_1638_STB;
  tm1638_send(0xC0 | address);
  tm1638_send(data);
  TM_1638_STB_GPIO->BSRR = TM_1638_STB;
}
