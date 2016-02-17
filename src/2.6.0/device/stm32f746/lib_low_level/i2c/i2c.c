#include "i2c.h"


void i2c_delay()
{
    u32 loops = 2;
    while (loops--)
        __asm("nop");
}

void SetLowSDA()
{
  /*
    GPIO_InitTypeDef GPIO_InitStruct;

    GPIO_InitStruct.GPIO_Pin = (1<<SDA);
    GPIO_InitStruct.GPIO_Mode = GPIO_Mode_OUT;
    GPIO_InitStruct.GPIO_Speed = GPIO_Speed_50MHz;//this sets the GPIO modules clock speed
    GPIO_InitStruct.GPIO_OType = GPIO_OType_OD; // this sets the pin type to open drain
    GPIO_InitStruct.GPIO_PuPd = GPIO_PuPd_NOPULL; // this disables resistor
    GPIO_Init(I2C_GPIO, &GPIO_InitStruct);

    GPIO_ResetBits(I2C_GPIO, 1<<SDA);
    */

    i2c_delay();
}

void SetHighSDA()
{
  /*
    GPIO_InitTypeDef GPIO_InitStruct;

    GPIO_InitStruct.GPIO_Pin = (1<<SDA);
    GPIO_InitStruct.GPIO_Mode = GPIO_Mode_IN;
    GPIO_InitStruct.GPIO_Speed = GPIO_Speed_50MHz;//this sets the GPIO modules clock speed
    GPIO_InitStruct.GPIO_OType = GPIO_OType_OD; // this sets the pin type to open drain
    GPIO_InitStruct.GPIO_PuPd = GPIO_PuPd_NOPULL; // this disables resistor
    GPIO_Init(I2C_GPIO, &GPIO_InitStruct);


    GPIO_SetBits(I2C_GPIO, 1<<SDA);
    */

    i2c_delay();
}

void SetLowSCL()
{
  //  GPIO_ResetBits(I2C_GPIO, 1<<SCL);
    i2c_delay();
}

void SetHighSCL()
{
  //  GPIO_SetBits(I2C_GPIO, 1<<SCL);
    i2c_delay();
}

void i2c_0_init()
{
  /*
    RCC_AHB1PeriphClockCmd(RCC_AHB1Periph_GPIO_I2C, ENABLE);

    GPIO_InitTypeDef GPIO_InitStruct;

    GPIO_InitStruct.GPIO_Pin = (1<<SDA)|(1<<SCL);
    GPIO_InitStruct.GPIO_Mode = GPIO_Mode_OUT;
    GPIO_InitStruct.GPIO_Speed = GPIO_Speed_50MHz;//this sets the GPIO modules clock speed
    GPIO_InitStruct.GPIO_OType = GPIO_OType_OD; // this sets the pin type to open drain
    GPIO_InitStruct.GPIO_PuPd = GPIO_PuPd_NOPULL; // this disables resistor
    GPIO_Init(I2C_GPIO, &GPIO_InitStruct);
*/

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
    u8  return_ack = 0;

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

    /*
    if (I2C_GPIO->IDR&(1<<SDA))
        return_ack = NO_I2C_ACK;
    else
        return_ack = OK_I2C_ACK;
      */

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

        //if (I2C_GPIO->IDR&(1<<SDA))
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
