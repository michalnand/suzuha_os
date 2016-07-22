#include "spi.h"


void spi_init()
{
	u32 i;

	GPIO_InitTypeDef  GPIO_InitStructure;

	GPIO_InitStructure.Pin = SCK|MOSI;
  GPIO_InitStructure.Mode = GPIO_MODE_OUTPUT_PP;
  GPIO_InitStructure.Speed = GPIO_SPEED_FREQ_HIGH;
	GPIO_InitStructure.Pull = GPIO_NOPULL;
  GPIO_Init(SPI_GPIO, &GPIO_InitStructure);

  GPIO_InitStructure.Pin = MISO;
  GPIO_InitStructure.Mode = GPIO_MODE_INPUT;
  GPIO_InitStructure.Speed = GPIO_SPEED_FREQ_HIGH;
	GPIO_InitStructure.Pull = GPIO_PULLDOWN;
  GPIO_Init(SPI_GPIO, &GPIO_InitStructure);

	GPIO_ResetBits(SPI_GPIO, SCK);
	GPIO_ResetBits(SPI_GPIO, MOSI);

	spi_cs_init();

	for (i = 0; i < 32; i++)
		spib(0xff);
}

#if SPI_DELAY_CYCLES > 1
	void spi_delay()
	{
		u32 i = SPI_DELAY_CYCLES;
		while (i--)
			__asm("nop");
	}
#else
	#define spi_delay() __asm("nop");
#endif

u8 spib(u8 b)
{
	u32 i;

	for (i = 0; i < 8; i++)
	{
		if (b&(1<<7))
			SPI_GPIO->BSRR = MOSI;
		else
			SPI_GPIO->BRR = MOSI;

		spi_delay();

		SPI_GPIO->BSRR = SCK;

		spi_delay();

		b<<=1;

		if ((SPI_GPIO->IDR&MISO) != 0)
			b|= (1<<0);

		SPI_GPIO->BRR = SCK;

		spi_delay();
	}

	SPI_GPIO->BRR = MOSI;
	spi_delay();
	return b;
}


void spi_block_read(u8 *buffer, u32 buffer_size)
{
	u32 i;

	for (i = 0; i < buffer_size; i++)
		buffer[i] = spib(0xff);
}

void spi_cs_init()
{
	GPIO_InitTypeDef  GPIO_InitStructure;

	GPIO_InitStructure.Pin = SPI_CS0_PIN;
  GPIO_InitStructure.Mode = GPIO_MODE_OUTPUT_PP;
  GPIO_InitStructure.Speed = GPIO_SPEED_FREQ_HIGH;
	GPIO_InitStructure.Pull = GPIO_NOPULL;
  GPIO_Init(SPI_CS0_GPIO, &GPIO_InitStructure);

	GPIO_InitStructure.Pin = SPI_CS1_PIN;
  GPIO_InitStructure.Mode = GPIO_MODE_OUTPUT_PP;
  GPIO_InitStructure.Speed = GPIO_SPEED_FREQ_HIGH;
	GPIO_InitStructure.Pull = GPIO_NOPULL;
  GPIO_Init(SPI_CS1_GPIO, &GPIO_InitStructure);

	GPIO_InitStructure.Pin = SPI_CS2_PIN;
	GPIO_InitStructure.Mode = GPIO_MODE_OUTPUT_PP;
	GPIO_InitStructure.Speed = GPIO_SPEED_FREQ_HIGH;
	GPIO_InitStructure.Pull = GPIO_NOPULL;
	GPIO_Init(SPI_CS2_GPIO, &GPIO_InitStructure);

  spi_cs0_high();
	spi_cs1_high();
	spi_cs2_high();
}

void spi_cs0_low()
{
	SPI_CS0_GPIO->BRR = SPI_CS0_PIN;
}

void spi_cs0_high()
{
	SPI_CS0_GPIO->BSRR = SPI_CS0_PIN;
}

void spi_cs1_low()
{
	SPI_CS1_GPIO->BRR = SPI_CS0_PIN;
}

void spi_cs1_high()
{
	SPI_CS1_GPIO->BSRR = SPI_CS0_PIN;
}


void spi_cs2_low()
{
	SPI_CS2_GPIO->BRR = SPI_CS2_PIN;
}

void spi_cs2_high()
{
	SPI_CS2_GPIO->BSRR = SPI_CS2_PIN;
}
