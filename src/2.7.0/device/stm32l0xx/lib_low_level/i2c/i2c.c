#include "i2c.h"

#define i2c_delay() __asm("nop")

/*
void i2c_delay()
{
    u32 loops = 0;
    while (loops--)
        __asm("nop");
}
*/

void SetLowSDA()
{
    GPIO_InitTypeDef  GPIO_InitStruct;

    GPIO_InitStruct.Mode  = GPIO_MODE_OUTPUT_PP;
    GPIO_InitStruct.Pull  = GPIO_PULLUP;
    GPIO_InitStruct.Speed = GPIO_SPEED_FREQ_VERY_HIGH;

    GPIO_InitStruct.Pin = (1<<SDA);

    I2C_GPIO->BRR = (1<<SDA);
    HAL_GPIO_Init(I2C_GPIO, &GPIO_InitStruct);

    i2c_delay();
}

void SetHighSDA()
{
  GPIO_InitTypeDef  GPIO_InitStruct;

  GPIO_InitStruct.Mode  = GPIO_MODE_INPUT;
  GPIO_InitStruct.Pull  = GPIO_PULLUP;
  GPIO_InitStruct.Speed = GPIO_SPEED_FREQ_VERY_HIGH;

  GPIO_InitStruct.Pin = (1<<SDA);

  I2C_GPIO->BSRR = (1<<SDA);
  HAL_GPIO_Init(I2C_GPIO, &GPIO_InitStruct);

  i2c_delay();
}

void SetLowSCL()
{
    I2C_GPIO->BRR = (1<<SCL);
    i2c_delay();
}

void SetHighSCL()
{
    I2C_GPIO->BSRR = (1<<SCL);
    i2c_delay();
}

void i2c_init()
{
    RCC->IOPENR |= RCC_AHBPeriph_GPIO_I2C;

    GPIO_InitTypeDef  GPIO_InitStruct;

    GPIO_InitStruct.Mode  = GPIO_MODE_OUTPUT_PP;
    GPIO_InitStruct.Pull  = GPIO_PULLUP;
    GPIO_InitStruct.Speed = GPIO_SPEED_FREQ_VERY_HIGH;

    GPIO_InitStruct.Pin = (1<<SDA)|(1<<SCL);
    HAL_GPIO_Init(I2C_GPIO, &GPIO_InitStruct);

    SetHighSCL();
    SetLowSDA();
    SetHighSDA();
}



void i2cStart()
{
    SetHighSCL();
    SetHighSDA();

    SetHighSCL();
    SetLowSDA();

    SetLowSCL();
    SetHighSDA();
}


void i2cStop()
{
    SetLowSCL();
    SetLowSDA();

    SetHighSCL();
    SetLowSDA();

    SetHighSCL();
    SetHighSDA();
}



int i2cWrite(u8 a)
{
    u8  i;
    u8  return_ack;

    for (i=0; i<8; i++)
    {
        SetLowSCL();

        if (a & 0x80)
            SetHighSDA();
        else
            SetLowSDA();

        SetHighSCL();
        a <<= 1;
    }

    SetLowSCL();
    SetHighSDA();
    SetHighSCL();


    if (I2C_GPIO->IDR&(1<<SDA))
        return_ack = NO_I2C_ACK;
    else
        return_ack = OK_I2C_ACK;

    SetLowSCL();

    i2c_delay();

    return(return_ack);
}


u8 i2cRead(u8  ack)
{
    u8  i;
    u8  caracter = 0x00;

    SetLowSCL();
    SetHighSDA();

    for (i=0; i<8; i++)
    {
        caracter = caracter << 1;
        SetHighSCL();

        if (I2C_GPIO->IDR&(1<<SDA))
            caracter = caracter  + 1;

        SetLowSCL();
    }

    if (ack)
    {
        SetLowSDA();
    }

    SetHighSCL();
    SetLowSCL();

    i2c_delay();

    return (caracter);
}


void i2c_write_reg(u8 dev_adr, u8 reg_adr, u8 value)
{
    i2cStart();
    i2cWrite(dev_adr);  /*slave address, write command*/
    i2cWrite(reg_adr);  /*send reg address*/
    i2cWrite(value);
    i2cStop();
}

u8 i2c_read_reg(u8 dev_adr, u8 reg_adr)
{
    u8 res;

    i2cStart();
    i2cWrite(dev_adr);  /*slave address, write command*/
    i2cWrite(reg_adr);  /*send reg address*/

    i2cStart();
    i2cWrite(dev_adr|0x01); /*slave address, read command*/
    res = i2cRead(0);   /*read data*/
    i2cStop();

    return res;
}
