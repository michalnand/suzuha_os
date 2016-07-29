#ifndef _SPI_H_
#define _SPI_H_

#include "../lib_low_level.h"

#ifdef __cplusplus
extern "C" {
#endif


#define SPI_SCK_GPIO	GPIOB
#define SPI_SCK_PIN   (1<<4)

#define SPI_MOSI_GPIO	GPIOA
#define SPI_MOSI_PIN  (1<<15)

#define SPI_MISO_GPIO	GPIOB
#define SPI_MISO_PIN  (1<<3)


#define SPI_DELAY_CYCLES	1



#define SPI_EDGE_RISING     0
#define SPI_EDGE_FALLING    1


void spi_init();
u8 spib(u8 b);
void spi_block_read(u8 *buffer, u32 buffer_size);



#ifdef __cplusplus
}
#endif

#endif
