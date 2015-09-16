#ifndef _IR_H_
#define _IR_H_

#include "../device/device.h"

#define IR_ADDRESS			(0x86)

#define	IR_WHO_AM_I			0x00
#define	IR_WHO_AM_I_ID		0xCD

#define	IR_CH0_REG			0x02
#define	IR_CH1_REG			0x03
#define	IR_CH2_REG			0x04

struct sIR
{
	u8 ch0, ch1, ch2;
};

struct sIR g_ir;

u32 ir_init();
void ir_read();

#endif