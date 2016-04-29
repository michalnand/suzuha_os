#include "ws2812.h"

#define SPI               SPI1
#define SPI_RCC						RCC_APB2Periph_SPI1
#define SPI_MOSI_PIN      (1<<5)
#define SPI_MOSI_SOURCE   GPIO_PinSource5
#define SPI_GPIO          GPIOB




RGB_LED ws2812_leds[WS2812_NUM_LEDS] = {{0,0,0}};


void ws2812_init(void)
{
  GPIO_InitTypeDef        GPIO_InitStructure;
  SPI_InitTypeDef   SPI_InitStructure;

  /* Periph clock enable */
  RCC_APB2PeriphClockCmd(SPI_RCC, ENABLE);

  /* Configure SPI pins: MOSI */
  GPIO_InitStructure.GPIO_Pin = SPI_MOSI_PIN;
  GPIO_InitStructure.GPIO_Mode = GPIO_Mode_AF;
  GPIO_InitStructure.GPIO_Speed = GPIO_Speed_50MHz;
  GPIO_InitStructure.GPIO_OType = GPIO_OType_PP;
  GPIO_InitStructure.GPIO_PuPd  = GPIO_PuPd_UP;
  GPIO_Init(SPI_GPIO, &GPIO_InitStructure);

  GPIO_PinAFConfig(SPI_GPIO, SPI_MOSI_SOURCE, GPIO_AF_0);



  SPI_InitStructure.SPI_Direction = SPI_Direction_2Lines_FullDuplex;
  SPI_InitStructure.SPI_Mode = SPI_Mode_Master;
  SPI_InitStructure.SPI_DataSize = SPI_DataSize_8b;
  SPI_InitStructure.SPI_CPOL = SPI_CPOL_High;
  SPI_InitStructure.SPI_CPHA = SPI_CPHA_2Edge;
  SPI_InitStructure.SPI_NSS = SPI_NSS_Soft;
  SPI_InitStructure.SPI_BaudRatePrescaler = SPI_BaudRatePrescaler_8;

  SPI_InitStructure.SPI_FirstBit = SPI_FirstBit_MSB;
  SPI_InitStructure.SPI_CRCPolynomial = 7;
  SPI_Init(SPI, &SPI_InitStructure);

  SPI_RxFIFOThresholdConfig(SPI, SPI_RxFIFOThreshold_QF);

  SPI_Cmd(SPI, ENABLE);

	ws2812_clear();
	ws2812_refresh();
}



void ws2812_demo()
{
	u32 i;

	struct sLed
	{
		u8 r, g, b;
		u8 state;
		u8 way;
	}
	 leds[3];

	leds[0].r = 16;
	leds[0].g = 0;
	leds[0].b = 0;
	leds[0].state = 0;
	leds[0].way = 1;

	leds[1].r = 0;
	leds[1].g = 16;
	leds[1].b = 0;
	leds[1].state = 0;
	leds[1].way = WS2812_NUM_LEDS-1;


	leds[2].r = 0;
	leds[2].g = 0;
	leds[2].b = 16;
	leds[2].state = 0;
	leds[2].way = 1;

	while (1)
	{
		ws2812_clear();

		for (i = 0; i < 3; i++)
		{
			leds[i].state = (leds[i].state + leds[i].way)%WS2812_NUM_LEDS;

			ws2812_set_led(leds[i].state, leds[i].r, leds[i].g, leds[i].b);
		  ws2812_refresh();
		}

		timer_delay_loops(200000);

		u32 time = timer_get_time();
		if ((time%100) == 0)
		{
			if (leds[time%3].way == 1)
				leds[time%3].way = WS2812_NUM_LEDS-1;
			else
				leds[time%3].way = 1;
		}
	}
}


// Set the color of a certain LED
void ws2812_set_led(u32 p, u8 r, u8 g, u8 b)
{
  ws2812_leds[p].red = r;
	ws2812_leds[p].green = g;
	ws2812_leds[p].blue = b;
}

void ws2812_get_led(u32 p, u8 *r, u8 *g, u8 *b)
{
  *r = ws2812_leds[p].red;
	*g = ws2812_leds[p].green;
	*b = ws2812_leds[p].blue;
}

void ws2812_clear()
{
	u32 i;
	for (i = 0; i < WS2812_NUM_LEDS; i++)
	{
		ws2812_leds[i].red = 0;
		ws2812_leds[i].green = 0;
		ws2812_leds[i].blue = 0;
	}
}

void ws2812_refresh()
{
  u32 led, i, j;

  __disable_irq();

  for (led = 0; led < WS2812_NUM_LEDS; led++)
  {
    u8 rgb[3] = {ws2812_leds[led].green, ws2812_leds[led].red, ws2812_leds[led].blue};

    for (j = 0; j < 3; j++)
    {
      // check each of the 8 bits
      u8 b =  rgb[j];

      for (i = 0; i < 8; i++)
      {
        if (b & (1<<7))
        {
					SPI_SendData8(SPI, 0xF0);		//send ONE
        }
        else
        {
					SPI_SendData8(SPI, 0xC0);		//send ONE
        }

        b<<= 1;
      }
    }
	}

  __enable_irq();

	u32 cycles = 2400;
	while (cycles--)
		__asm("nop");
}
