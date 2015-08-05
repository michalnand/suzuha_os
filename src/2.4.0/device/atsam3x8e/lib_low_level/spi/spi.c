#include "spi.h"


void spi_init()
{
	u32 i;
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
	/*
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
	*/
	return b;
}


void spi_block_read(u8 *buffer, u32 buffer_size)
{
	u32 i;

	for (i = 0; i < buffer_size; i++)
		buffer[i] = spib(0xff);
}

void SPI_CS_INIT()
{
	

    SPI_CS_HIGH();
}

void SPI_CS_LOW()
{
	//SPI_CS_GPIO->BRR = SPI_CS_PIN;
}

void SPI_CS_HIGH()
{
	//SPI_CS_GPIO->BSRR = SPI_CS_PIN;
}