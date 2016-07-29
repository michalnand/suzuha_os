#include "spi.h"


void spi_init()
{
	u32 i;


	GPIO_InitTypeDef  GPIO_InitStructure;

	GPIO_InitStructure.GPIO_Pin = SPI_SCK_PIN;
	GPIO_InitStructure.GPIO_Mode = GPIO_Mode_OUT;
  GPIO_InitStructure.GPIO_OType = GPIO_OType_PP;
  GPIO_InitStructure.GPIO_Speed = GPIO_Speed_50MHz;
  GPIO_InitStructure.GPIO_PuPd = GPIO_PuPd_NOPULL;
	GPIO_Init(SPI_SCK_GPIO, &GPIO_InitStructure);

	GPIO_InitStructure.GPIO_Pin = SPI_MOSI_PIN;
	GPIO_InitStructure.GPIO_Mode = GPIO_Mode_OUT;
  GPIO_InitStructure.GPIO_OType = GPIO_OType_PP;
  GPIO_InitStructure.GPIO_Speed = GPIO_Speed_50MHz;
  GPIO_InitStructure.GPIO_PuPd = GPIO_PuPd_NOPULL;
	GPIO_Init(SPI_MOSI_GPIO, &GPIO_InitStructure);


	GPIO_InitStructure.GPIO_Pin = SPI_MISO_PIN;
	GPIO_InitStructure.GPIO_Mode = GPIO_Mode_IN;
	GPIO_InitStructure.GPIO_Speed = GPIO_Speed_50MHz;
	GPIO_Init(SPI_MISO_GPIO, &GPIO_InitStructure);

	GPIO_ResetBits(SPI_SCK_GPIO, SPI_SCK_PIN);
	GPIO_ResetBits(SPI_MOSI_GPIO, SPI_MOSI_PIN);

	SPI_SCK_GPIO->BSRR = SPI_SCK_PIN;

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
			SPI_MOSI_GPIO->BSRR = SPI_MOSI_PIN;
		else
			SPI_MOSI_GPIO->BRR = SPI_MOSI_PIN;

		spi_delay();

		SPI_SCK_GPIO->BSRR = SPI_SCK_PIN;
		spi_delay();


		b<<=1;

		if (SPI_MISO_GPIO->IDR&SPI_MISO_PIN)
			b|= (1<<0);


		SPI_SCK_GPIO->BRR = SPI_SCK_PIN;
		spi_delay();
	}

	SPI_MOSI_GPIO->BRR = SPI_MOSI_PIN;
	spi_delay();

	return b;
} 

void spi_block_read(u8 *buffer, u32 buffer_size)
{
	u32 i;

	for (i = 0; i < buffer_size; i++)
		buffer[i] = spib(0xff);
}
