#include "spi.h"

#define SCK		(1<<4) // PB4
#define MOSI	(1<<7) // PB7
#define MISO	(1<<6) // PB6 

void spi_init()
{
	u32 i;

	SPI_CS_INIT();
 
	ROM_GPIOPinTypeGPIOOutput(GPIO_PORTB_BASE, SCK|MOSI);
  

  	ROM_GPIOPinTypeGPIOInput(GPIO_PORTB_BASE, MISO);
	ROM_GPIOPadConfigSet(GPIO_PORTB_BASE, MISO, GPIO_STRENGTH_2MA, GPIO_PIN_TYPE_STD_WPU);


	for (i = 0; i < 10; i++)
		spib(0xff);
}


void SPI_CS_INIT()
{
   SPI_CS_HIGH();
}

void SPI_CS_LOW()
{

}

void SPI_CS_HIGH()
{
	
}




#if SPI_DELAY_CYCLES != 0

void spi_delay()
{
	u32 i = 4;
	while (i--)
		__asm("nop");
}

#else

void spi_delay()
{
	__asm("nop");
}

#endif

u8 spib(u8 b)
{
	u32 i;

	for (i = 0; i < 8; i++)
	{
		if (b&(1<<7))
			ROM_GPIOPinWrite(GPIO_PORTB_BASE, MOSI, MOSI);
		else
			ROM_GPIOPinWrite(GPIO_PORTB_BASE, MOSI, 0);

		spi_delay();


		ROM_GPIOPinWrite(GPIO_PORTB_BASE, SCK, SCK);

		spi_delay();
		
		b<<= 1;

		if (GPIOPinRead(GPIO_PORTB_BASE, MISO)&MISO)
			b|=(1<<0);

		ROM_GPIOPinWrite(GPIO_PORTB_BASE, SCK, 0);

		spi_delay();
	}

	return b;
}

void spi_block_read(u8 *buffer, u32 buffer_size)
{
	u32 i;

	for (i = 0; i < buffer_size; i++)
		buffer[i] = spib(0xff);
}