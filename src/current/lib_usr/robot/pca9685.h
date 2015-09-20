#ifndef _PCA9685_H_
#define _PCA9685_H_

#include "../../device/device.h"

#define PCA9685_ADDRESS		((1<<7)|(1<<6))

#define PCA9685_Reset   0x01         // Reset the device
#define PCA9685_MODE1   0x00          // 0x00 location for Mode1 register address
#define PCA9685_MODE2   0x01          // 0x01 location for Mode2 reigster address
#define PCA9685_LED0    0x06          // location for start of LED0 registers
#define PCA9685_LEDCOUNT 15          // number of LEDS to light 15 max

/* Devices */
#define PCA9685_LEDDRV1    0xb80                // 1st PCA9685
#define PCA9685_LEDDRV2    0xb82                // 2nd PCA9685
#define PCA9685_LEDDRV3    0xd84                // 3rd PCA9685
#define PCA9685_LEDDRV4    0xd86                // 4th PCA9685
#define PCA9685_LEDDRV5    0xc88                // 5th PCA9685
#define PCA9685_LEDDRV6    0xc8a                // 6th PCA9685
#define PCA9685_LEDDRV7    0xc8c                // 7th PCA9685
#define PCA9685_LEDDRV8    0xc8e                // 8th PCA9685
#define PCA9685_LEDDRV9    0xc90                // 9th PCA9685
/* MODE1 bits */
#define PCA9685_RESTART 0x80
#define PCA9685_EXTCLK  0x40
#define PCA9685_AI      0x20
#define PCA9685_SLEEP   0x10
#define PCA9685_SUB1    0x08
#define PCA9685_SUB2    0x04
#define PCA9685_SUB3    0x02
#define PCA9685_ALLCALL 0x01

/* MODE2 bits */
#define PCA9685_INVRT   0x10
#define PCA9685_OCH     0x08
#define PCA9685_OUTDRV  0x04
#define PCA9685_OUTNE1  0x02
#define PCA9685_OUTNE0  0x01

/* LEDX_ON_H bits */
#define PCA9685_LED_ON 0x10

/* LEDX_OFF_H bits */
#define PCA9685_LED_OFF 0x10


#define PCA9685_PWM_MAX     4095

void pca9685_init();
void pca9685_send(u32 channel, u32 value);

#endif
