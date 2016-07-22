#ifndef _SPI_H_
#define _SPI_H_

#include "../lib_low_level.h"

#define SPI_GPIO	GPIOA
#define SCK     	(1<<3)
#define MOSI     	(1<<4)
#define MISO     	(1<<5)

#define SPI_CS0_GPIO	   GPIOA
#define SPI_CS0_PIN	    (1<<7)

#define SPI_CS1_GPIO	   GPIOA
#define SPI_CS1_PIN	    (1<<6)

#define SPI_CS2_GPIO	   GPIOB
#define SPI_CS2_PIN	    (1<<0)

#define SPI_DELAY_CYCLES	1




void spi_init();
u8 spib(u8 b);
void spi_block_write(u8 *buffer, u32 buffer_size);
void spi_block_read(u8 *buffer, u32 buffer_size);

void spi_cs_init();
void spi_cs0_low();
void spi_cs0_high();
void spi_cs1_low();
void spi_cs1_high();
void spi_cs2_low();
void spi_cs2_high();


#endif
