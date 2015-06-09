#include "i2c.h"


inline void i2c_set_tx()    {I2C_BASE->C1 |= I2C_C1_TX_MASK;}
inline void i2c_set_rx()    {I2C_BASE->C1 &= ~I2C_C1_TX_MASK;}
inline void i2c_set_slave() {I2C_BASE->C1 &= ~I2C_C1_MST_MASK;}
inline void i2c_set_master() {I2C_BASE->C1 |=  I2C_C1_MST_MASK;}
inline void i2c_give_nack() {I2C_BASE->C1 |= I2C_C1_TXAK_MASK;}
inline void i2c_give_ack()  {I2C_BASE->C1 &= ~I2C_C1_TXAK_MASK;}
inline void i2c_repeated_start() {I2C_BASE->C1 |= I2C_C1_RSTA_MASK;}
inline uint8_t i2c_read() {return I2C_BASE->D;}

inline void i2c_start(){
    i2c_set_master();
    i2c_set_tx();
}

inline void i2c_stop(){
    i2c_set_slave();
    i2c_set_rx();
}

inline void i2c_wait(){
    // Spin wait for the interrupt flag to be set
    while((I2C_BASE->S & I2C_S_IICIF_MASK) == 0)
        __asm("nop");

    I2C_BASE->S |= I2C_S_IICIF_MASK;           // Clear flag
}

inline int i2c_write(uint8_t data)
{
    // Send data, wait, and return ACK status
    I2C_BASE->D = data;
    i2c_wait();
    return ((I2C_BASE->S & I2C_S_RXAK_MASK) == 0);
}

void i2c_0_init()
{
    // Enable clocks
    SIM->SCGC4 |= SIM_SCGC4_I2C0_MASK;
    
    // Configure GPIO for I2C
    PORTB->PCR[3] = PORT_PCR_MUX(2);
    PORTB->PCR[4] = PORT_PCR_MUX(2);
    
    I2C0->F  = 0x14;                   // Baudrate settings:  ICR=0x14, MULT=0
    I2C0->C1 = I2C_C1_IICEN_MASK;      // Enable:  IICEN=1
}


u8 i2c_read_reg(u8 dev_addr, u8 reg_addr)
{
    timer_delay_loops(1000);

    i2c_start();
    i2c_write(dev_addr | I2C_WRITE);
    i2c_write(reg_addr);
    i2c_repeated_start();
    i2c_write(dev_addr | I2C_READ);
    i2c_set_rx();
    i2c_give_nack();
    i2c_read();
    i2c_wait();
    i2c_stop();
    return i2c_read();
}


void i2c_write_reg(u8 dev_addr, u8 reg_addr, u8 data)
{
    timer_delay_loops(10000);
    
    i2c_start();
    i2c_write(dev_addr | I2C_WRITE);
    i2c_write(reg_addr);
    i2c_write(data);
    i2c_stop();
}

