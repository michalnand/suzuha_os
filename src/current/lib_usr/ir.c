#include "ir.h"


u32 ir_init()
{
	g_ir.ch0 = 0;
	g_ir.ch1 = 0;
	g_ir.ch2 = 0;

	if (i2c_read_reg(IR_ADDRESS, IR_WHO_AM_I) != IR_WHO_AM_I_ID)
		return 1;

	return 0;
}


void ir_read()
{
	g_ir.ch0 = i2c_read_reg(IR_ADDRESS, IR_CH0_REG);
	g_ir.ch1 = i2c_read_reg(IR_ADDRESS, IR_CH1_REG);
	g_ir.ch2 = i2c_read_reg(IR_ADDRESS, IR_CH2_REG);
}