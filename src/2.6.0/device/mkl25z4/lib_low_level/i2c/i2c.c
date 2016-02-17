#include "i2c.h"

void i2c_delay()
{
	u32 loops = 30;
	while (loops--)
		__asm("nop"); 
}

void SetLowSDA() 
{
	__disable_irq();
	PTE_BASE_PTR->PCOR = (1<<SDA);
	PTE_BASE_PTR->PDDR|= (1<<SDA);
	__enable_irq();
	i2c_delay();
}

void SetHighSDA() 
{	
	__disable_irq();
	PTE_BASE_PTR->PSOR = (1<<SDA);
	PTE_BASE_PTR->PDDR&=~(1<<SDA);
	__enable_irq(); 
	i2c_delay(); 
}

void SetLowSCL() 
{	
	PTE_BASE_PTR->PCOR = (1<<SCL);
	i2c_delay();
}

void SetHighSCL()
{
	PTE_BASE_PTR->PSOR = (1<<SCL);
	i2c_delay();
}

void i2c_init()
{
	SIM_BASE_PTR->SCGC5 |= SIM_SCGC5_PORTE_MASK;

	PORTE_BASE_PTR->PCR[SCL] = PORT_PCR_MUX(1);
  	PORTE_BASE_PTR->PCR[SDA] = PORT_PCR_MUX(1); 

  	PTE_BASE_PTR->PCOR = (1<<SDA)|(1<<SCL);	/*outputs to low*/

  	PTE_BASE_PTR->PDDR|= 1 << SCL;		/*output*/
  	PTE_BASE_PTR->PDDR&=~(1 << SDA);	/*hi Z input*/

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

	if (PTE_BASE_PTR->PDIR&(1 << SDA))
		return_ack = NO_I2C_ACK;      
	else
		return_ack = OK_I2C_ACK;
	
	SetLowSCL();

	i2c_delay();
  
	return(return_ack);
}


u8  i2cRead(u8  ack)
{
	u8  i;
	u8  caracter = 0x00;

	SetLowSCL();
	SetHighSDA();

	for (i=0; i<8; i++)
	{
		caracter = caracter << 1;
		SetHighSCL();
		if (PTE_BASE_PTR->PDIR&(1 << SDA))
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
	i2cWrite(dev_adr);	/*slave address, write command*/
	i2cWrite(reg_adr);	/*send reg address*/
	i2cWrite(value);
	i2cStop();
}

u8 i2c_read_reg(u8 dev_adr, u8 reg_adr)
{
	u8 res;
	
	i2cStart();
	i2cWrite(dev_adr);	/*slave address, write command*/
	i2cWrite(reg_adr);	/*send reg address*/
	
	i2cStart();
	i2cWrite(dev_adr|0x01);	/*slave address, read command*/
	res = i2cRead(0);	/*read data*/
	i2cStop();
		
	return res;
}