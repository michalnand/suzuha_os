#include "i2c.h"

void i2c_delay()
{
    u32 loops = 2;
    while (loops--)
        __asm("nop");
}

void SetLowSDA()
{
  __disable_irq();
  I2C_GPIO->BRR = (1<<SDA);

  I2C_GPIO->OTYPER |= (uint16_t)(((uint16_t)GPIO_OType_PP) << ((uint16_t)SDA));
  I2C_GPIO->MODER |= (((uint32_t)GPIO_Mode_OUT) << (SDA * 2));

  __enable_irq();

  /*
  GPIO_InitTypeDef        GPIO_InitStructure;

  I2C_GPIO->BRR = (1<<SDA);

  GPIO_InitStructure.GPIO_Pin = (1<<SDA);
  GPIO_InitStructure.GPIO_Mode = GPIO_Mode_OUT;
  GPIO_InitStructure.GPIO_OType = GPIO_OType_PP;
  GPIO_InitStructure.GPIO_Speed = GPIO_Speed_50MHz;
  GPIO_InitStructure.GPIO_PuPd = GPIO_PuPd_NOPULL;
  GPIO_Init(I2C_GPIO, &GPIO_InitStructure);
  */
  i2c_delay();
}

void SetHighSDA()
{
  __disable_irq();
  I2C_GPIO->BSRR = (1<<SDA);

  I2C_GPIO->OTYPER &= ~((GPIO_OTYPER_OT_0) << ((uint16_t)SDA));
  I2C_GPIO->MODER  &= ~(GPIO_MODER_MODER0 << (SDA * 2));
  __enable_irq();

/*
  I2C_GPIO->BSRR = (1<<SDA);

  GPIO_InitTypeDef        GPIO_InitStructure;

  GPIO_InitStructure.GPIO_Pin = (1<<SDA);
  GPIO_InitStructure.GPIO_Mode = GPIO_Mode_IN;
  GPIO_InitStructure.GPIO_OType = GPIO_OType_PP;
  GPIO_InitStructure.GPIO_Speed = GPIO_Speed_50MHz;
  GPIO_InitStructure.GPIO_PuPd = GPIO_PuPd_NOPULL;
  GPIO_Init(I2C_GPIO, &GPIO_InitStructure);
*/

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

void i2c_0_init()
{
  GPIO_InitTypeDef        GPIO_InitStructure;

  GPIO_InitStructure.GPIO_Pin = (1<<SCL) | (1<<SDA);
  GPIO_InitStructure.GPIO_Mode = GPIO_Mode_OUT;
  GPIO_InitStructure.GPIO_OType = GPIO_OType_PP;
  GPIO_InitStructure.GPIO_Speed = GPIO_Speed_50MHz;
  GPIO_InitStructure.GPIO_PuPd = GPIO_PuPd_NOPULL;
  GPIO_Init(I2C_GPIO, &GPIO_InitStructure);

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
