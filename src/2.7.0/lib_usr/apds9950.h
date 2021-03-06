#ifndef _APDS9950_H_
#define _APDS9950_H_

#include "../device/device.h"

struct sAPDS9950
{
    u16 r, g, b, ambient, proximity;
};

struct sAPDS9950 g_apds9950;


/*APDS-9950 RGB sensor*/
#define RGB_ADDRESS		(0x39<<1)

#define RGB_COMMAND			(1<<7)

#define RGB_ENABLE			0x00
#define RGB_ATIME			0x01
#define RGB_WTIME			0x03
#define RGB_AILTL			0x04
#define RGB_AILTH			0x05

#define RGB_AIHTL			0x06
#define RGB_AIHTH			0x07

#define RGB_PILTL			0x08
#define RGB_PILTH			0x09

#define RGB_PIHTL			0x0A
#define RGB_PIHTH			0x0B

#define RGB_PERS			0x0C
#define RGB_CONFIG			0x0D
#define RGB_PPULSE			0x0E

#define RGB_CONTROL			0x0F
#define RGB_ID				0x12
#define RGB_ID_VALUE				0x69

#define RGB_STATUS 			0x13

#define RGB_CDATAL			0x14
#define RGB_CDATAH			0x15
#define RGB_RDATAL			0x16
#define RGB_RDATAH			0x17
#define RGB_GDATAL			0x18
#define RGB_GDATAH			0x19
#define RGB_BDATAL			0x1A
#define RGB_BDATAH			0x1B
#define RGB_PDATAL 			0x1C
#define RGB_PDATAH 			0x1D


u32 apds950_init();
void apds9950_read();

#endif
