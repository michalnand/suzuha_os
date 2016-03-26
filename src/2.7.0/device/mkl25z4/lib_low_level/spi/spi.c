#include "spi.h"

#define SPI_SCK_PIN      15
#define SPI_MOSI_PIN     16
#define SPI_MISO_PIN     17

#define SPI_SCK_HIGH()      GPIOA_PSOR = (1<<SPI_SCK_PIN)
#define SPI_SCK_LOW()       GPIOA_PCOR = (1<<SPI_SCK_PIN)
#define SPI_MOSI_HIGH()     GPIOA_PSOR = (1<<SPI_MOSI_PIN)
#define SPI_MOSI_LOW()      GPIOA_PCOR = (1<<SPI_MOSI_PIN)

#define SPI_MISO()			(GPIOA_PDIR&(1<<SPI_MISO_PIN))


u8 spib(u8 b)  
{  
    __disable_irq();
    u32 i;
    for (i = 0; i < 8; i++)
    {
        SPI_MOSI_LOW();
    	if (b & (1<<7))
    		SPI_MOSI_HIGH();
    	
    	SPI_SCK_HIGH();

        b<<=1;
    	
        if (SPI_MISO())
    		b|= 0x01;

    	SPI_SCK_LOW();
    } 

    SPI_MOSI_LOW(); 
    __enable_irq();

    return b;
}


void spi_init()
{
	SIM_SCGC5 |= SIM_SCGC5_PORTA_MASK;
 
    PORTA_BASE_PTR->PCR[SPI_SCK_PIN] = PORT_PCR_MUX(1);
    PORTA_BASE_PTR->PCR[SPI_MOSI_PIN] = PORT_PCR_MUX(1);
    PORTA_BASE_PTR->PCR[SPI_MISO_PIN] = PORT_PCR_MUX(1); 

    PTA_BASE_PTR->PDDR |= 1 << SPI_SCK_PIN;
    PTA_BASE_PTR->PDDR |= 1 << SPI_MOSI_PIN;
    PTA_BASE_PTR->PDDR &= ~(1<<SPI_MISO_PIN);

	SPI_SCK_LOW();
	SPI_MOSI_LOW();

    u32 i;
    for (i = 0; i < 10; i++)
        spib(0xff);
}