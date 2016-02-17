#include "i2c.h"

#define I2C_OFF_TEST    1


void i2c_0_init()
{
    
 //enable I2C module 0
    ROM_SysCtlPeripheralEnable(SYSCTL_PERIPH_I2C0);
 
    //reset module
    ROM_SysCtlPeripheralReset(SYSCTL_PERIPH_I2C0);
     
    //enable GPIO peripheral that contains I2C 0
    // SysCtlPeripheralEnable(SYSCTL_PERIPH_GPIOB);
 
    // Configure the pin muxing for I2C0 functions on port B2 and B3.
    ROM_GPIOPinConfigure(GPIO_PIN_2);
    ROM_GPIOPinConfigure(GPIO_PIN_3);
     
    // Select the I2C function for these pins.
    GPIOPinTypeI2CSCL(GPIO_PORTB_BASE, GPIO_PIN_2);
    GPIOPinTypeI2C(GPIO_PORTB_BASE, GPIO_PIN_3);
 
    // Enable and initialize the I2C0 master module.  Use the system clock for
    // the I2C0 module.  The last parameter sets the I2C data transfer rate.
    // If false the data rate is set to 100kbps and if true the data rate will
    // be set to 400kbps.
    ROM_I2CMasterInitExpClk(I2C0_BASE, SysCtlClockGet(), true);
     
    //clear I2C FIFOs
    // HWREG(I2C0_BASE + I2C_O_FIFOCTL) = 80008000;
}
   


u8 i2c_read_reg(u8 dev_addr, u8 reg_addr)
{
    dev_addr>>=1;
    //specify that we are writing (a register address) to the
    //slave device
    ROM_I2CMasterSlaveAddrSet(I2C0_BASE, dev_addr, false);
 
    //specify register to be read
    ROM_I2CMasterDataPut(I2C0_BASE, reg_addr);
 
    //send control byte and register address byte to slave device
    ROM_I2CMasterControl(I2C0_BASE, I2C_MASTER_CMD_BURST_SEND_START);
     
    //wait for MCU to finish transaction
    while(ROM_I2CMasterBusy(I2C0_BASE))
        __asm("nop");
     
    //specify that we are going to read from slave device
    ROM_I2CMasterSlaveAddrSet(I2C0_BASE, dev_addr, true);
     
    //send control byte and read from the register we
    //specified
    ROM_I2CMasterControl(I2C0_BASE, I2C_MASTER_CMD_SINGLE_RECEIVE);
     
    //wait for MCU to finish transaction
    while(ROM_I2CMasterBusy(I2C0_BASE))
        __asm("nop");
     
    //return data pulled from the specified register
    return ROM_I2CMasterDataGet(I2C0_BASE);
}

void i2c_write_reg(u8 dev_addr, u8 reg_addr, u8 data)
{
    dev_addr>>=1;
    // Tell the master module what address it will place on the bus when
    // communicating with the slave.
    I2CMasterSlaveAddrSet(I2C0_BASE, dev_addr, false);
     
    //put data to be sent into FIFO
    I2CMasterDataPut(I2C0_BASE, reg_addr);

    //send control byte and register address byte to slave device
    ROM_I2CMasterControl(I2C0_BASE, I2C_MASTER_CMD_BURST_SEND_START);
     
    //wait for MCU to finish transaction
    while(ROM_I2CMasterBusy(I2C0_BASE))
        __asm("nop");


    //put last piece of data into I2C FIFO
    I2CMasterDataPut(I2C0_BASE, data);

    //send next data that was just placed into FIFO
    I2CMasterControl(I2C0_BASE, I2C_MASTER_CMD_BURST_SEND_FINISH);

    // Wait until MCU is done transferring.
    while(I2CMasterBusy(I2C0_BASE))
        __asm("nop");;
}

void i2cStart()
{

}

void i2cStop()
{

}

int i2cWrite(u8 a)
{
    return 0;
}

u8 i2cRead(u8  ack)
{
    return 0;
}
