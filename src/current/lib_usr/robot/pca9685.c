#include "pca9685.h"

void pca9685_init()
{
    i2cStart();                // Start
    i2cWrite(PCA9685_ADDRESS);         // Slave address
    i2cWrite(PCA9685_MODE1);           // Mode 1 address
    i2cWrite((1<<0)|(1<<4)|(1<<5));      // Setting mode to sleep so we can change teh default PWM frequency, 0b00110001
    i2cStop();                 // Stop
    timer_delay_ms(2);                // Required 50 us delay

    i2cStart();                // Start
    i2cWrite(PCA9685_ADDRESS);         // Slave address
    i2cWrite(0xfe);            // PWM frequency PRE_SCALE address
    i2cWrite(0x01);            // osc_clk/(4096*update_rate) // 25000000/(4096*1500)= 4.069 ~4
    i2cStop();                 // Stop
    timer_delay_ms(2);                // delay at least 500 us

    i2cStart();                // Start
    i2cWrite(PCA9685_ADDRESS);         // Slave address
    i2cWrite(PCA9685_MODE1);           // Mode 1 register address
    i2cWrite(0xa1);            // Set to our prefered mode[ Reset, INT_CLK, Auto-Increment, Normal Mode]
    i2cStop();                 // Stop
    timer_delay_ms(2);                // delay at least 500 us

    i2cStart();                // Start
    i2cWrite(PCA9685_ADDRESS);         // Slave Address
    i2cWrite(PCA9685_MODE2);           // Mode2 register address
    i2cWrite(1<<2);      // Set to our prefered mode[Output logic state not inverted, Outputs change on STOP, 0b00000100
    i2cStop();                 // totem pole structure, When OE = 1 (output drivers not enabled), LEDn = 0]
    timer_delay_ms(2);
}

void pca9685_send(u32 channel, u32 value)
{
    if(value > PCA9685_PWM_MAX)            // if larger than PCA9685_PWM_MAX than full on
        value = PCA9685_PWM_MAX;       // cant be larger than PCA9685_PWM_MAX

    i2cStart();
    i2cWrite(PCA9685_ADDRESS);
    i2cWrite(PCA9685_LED0 + 4*channel);  // select slected LED address
    i2cWrite(0x00);            // LED_ON_L
    i2cWrite(0x00);            // LED_ON_H

    i2cWrite(value&0xff);             // LED_OFF_L
    i2cWrite(value>>8);             // LED_OFF_H
    i2cStop();                 // STop
}
