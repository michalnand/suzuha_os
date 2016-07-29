#include "ad9833.h"

void ad9833_delay()
{
  unsigned int loops = 100;
  while (loops--)
    __asm("nop");
}

void ad9833_send_word(unsigned int word)
{
  unsigned int i;

  AD9833_SCK_GPIO->BSRR = AD9833_SCK_PIN;
  ad9833_delay();

  AD9833_FSYNC_GPIO->BRR= AD9833_FSYNC_PIN;
  ad9833_delay();

  for (i = 0; i < 16; i++)
  {
    if (word&(1<<15))                   //msb first
      AD9833_DAT_GPIO->BSRR = AD9833_DAT_PIN;
    else
      AD9833_DAT_GPIO->BRR = AD9833_DAT_PIN;
    word<<=1;

    ad9833_delay();

    AD9833_SCK_GPIO->BRR = AD9833_SCK_PIN;    //falling edge writes data
    ad9833_delay();

    AD9833_SCK_GPIO->BSRR = AD9833_SCK_PIN;
    ad9833_delay();
  }


  AD9833_FSYNC_GPIO->BSRR = AD9833_FSYNC_PIN;
  ad9833_delay();
}



void ad9833_set_frequency(u32 frequency, u16 waveform)
{
  //u32 freq_word = frequency*((u32)(1<<28)/(u32)25000000);
  u32 freq_word = frequency*(float)10.73741824;

  u32 MSB = (u32)((freq_word & 0xFFFC000) >> 14);    //Only lower 14 bits are used for data
  u32 LSB = (u32)(freq_word & 0x3FFF);

  //Set control bits 15 and 14 to 0 and 1, respectively, for frequency register 0
  LSB |= 0x4000;
  MSB |= 0x4000;

  ad9833_send_word(0x2100);
  ad9833_send_word(LSB);                  // Write lower 16 bits to AD9833 registers
  ad9833_send_word(MSB);                  // Write upper 16 bits to AD9833 registers.
  ad9833_send_word(0xC000);               // Phase register
  ad9833_send_word(waveform);             // Exit & Reset to SINE, SQUARE or TRIANGLE
}

void ad9833_set_gain(u8 gain)
{
  unsigned int i;
  unsigned int word = gain|(1<<12)|(1<<9)|(1<<8); //write data, both potetiometers

  AD9833_SCK_GPIO->BRR = AD9833_SCK_PIN;
  ad9833_delay();

  AD9833_CS_GPIO->BRR= AD9833_CS_PIN;
  ad9833_delay();

  for (i = 0; i < 16; i++)
  {
    if (word&(1<<15))
      AD9833_DAT_GPIO->BSRR = AD9833_DAT_PIN;
    else
      AD9833_DAT_GPIO->BRR = AD9833_DAT_PIN;
    word<<=1;

    ad9833_delay();

    AD9833_SCK_GPIO->BSRR = AD9833_SCK_PIN;
    ad9833_delay();

    AD9833_SCK_GPIO->BRR = AD9833_SCK_PIN;
    ad9833_delay();
  }


  AD9833_CS_GPIO->BSRR = AD9833_CS_PIN;
  ad9833_delay();
}

void ad9833_init()
{
  GPIO_InitTypeDef  GPIO_InitStructure;

  GPIO_InitStructure.GPIO_Pin = AD9833_FSYNC_PIN;
  GPIO_InitStructure.GPIO_Mode = GPIO_Mode_OUT;
  GPIO_InitStructure.GPIO_OType = GPIO_OType_PP;
  GPIO_InitStructure.GPIO_Speed = GPIO_Speed_50MHz;
  GPIO_InitStructure.GPIO_PuPd = GPIO_PuPd_NOPULL;

	GPIO_Init(AD9833_FSYNC_GPIO, &GPIO_InitStructure);
  AD9833_FSYNC_GPIO->BSRR = AD9833_FSYNC_PIN;


  GPIO_InitStructure.GPIO_Pin = AD9833_CS_PIN;
  GPIO_InitStructure.GPIO_Mode = GPIO_Mode_OUT;
  GPIO_InitStructure.GPIO_OType = GPIO_OType_PP;
  GPIO_InitStructure.GPIO_Speed = GPIO_Speed_50MHz;
  GPIO_InitStructure.GPIO_PuPd = GPIO_PuPd_NOPULL;

	GPIO_Init(AD9833_CS_GPIO, &GPIO_InitStructure);
  AD9833_CS_GPIO->BSRR = AD9833_CS_PIN;



  GPIO_InitStructure.GPIO_Pin = AD9833_SCK_PIN;
  GPIO_InitStructure.GPIO_Mode = GPIO_Mode_OUT;
  GPIO_InitStructure.GPIO_OType = GPIO_OType_PP;
  GPIO_InitStructure.GPIO_Speed = GPIO_Speed_50MHz;
  GPIO_InitStructure.GPIO_PuPd = GPIO_PuPd_NOPULL;
  GPIO_Init(AD9833_SCK_GPIO, &GPIO_InitStructure);

  AD9833_SCK_GPIO->BSRR = AD9833_SCK_PIN;



  GPIO_InitStructure.GPIO_Pin = AD9833_DAT_PIN;
  GPIO_InitStructure.GPIO_Mode = GPIO_Mode_OUT;
  GPIO_InitStructure.GPIO_OType = GPIO_OType_PP;
  GPIO_InitStructure.GPIO_Speed = GPIO_Speed_50MHz;
  GPIO_InitStructure.GPIO_PuPd = GPIO_PuPd_NOPULL;
  GPIO_Init(AD9833_DAT_GPIO, &GPIO_InitStructure);

  AD9833_SCK_GPIO->BSRR = AD9833_SCK_PIN;


  unsigned long int loops = 1000;
  while (loops--)
    __asm("nop");
}
