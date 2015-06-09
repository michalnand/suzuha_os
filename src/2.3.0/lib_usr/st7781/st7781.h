#ifndef _ST7781_H_
#define _ST7781_H_

#include "st7781_port.h"
 


#define TFTLCD_DRIV_ID_READ		0x00
#define TFTLCD_DRIV_OUT_CTRL		0x01
#define TFTLCD_DRIV_WAV_CTRL		0x02
#define TFTLCD_ENTRY_MOD		0x03
#define TFTLCD_RESIZE_CTRL		0x04
#define TFTLCD_DISP_CTRL1		0x07
#define TFTLCD_DISP_CTRL2		0x08
#define TFTLCD_DISP_CTRL3		0x09
#define TFTLCD_DISP_CTRL4		0x0A
#define TFTLCD_FRM_MARKER_POS		0x0D
#define TFTLCD_POW_CTRL1		0x10
#define TFTLCD_POW_CTRL2		0x11
#define TFTLCD_POW_CTRL3		0x12
#define TFTLCD_POW_CTRL4		0x13
#define TFTLCD_GRAM_HOR_AD		0x20
#define TFTLCD_GRAM_VER_AD		0x21
#define TFTLCD_RW_GRAM			0x22
#define TFTLCD_VCOMH_CTRL		0x29
#define TFTLCD_FRM_RATE_COL_CTRL	0x2B
#define TFTLCD_GAMMA_CTRL1		0x30
#define TFTLCD_GAMMA_CTRL2		0x31
#define TFTLCD_GAMMA_CTRL3		0x32
#define TFTLCD_GAMMA_CTRL4		0x35
#define TFTLCD_GAMMA_CTRL5		0x36
#define TFTLCD_GAMMA_CTRL6		0x37
#define TFTLCD_GAMMA_CTRL7		0x38
#define TFTLCD_GAMMA_CTRL8		0x39
#define TFTLCD_GAMMA_CTRL9		0x3C
#define TFTLCD_GAMMA_CTRL10		0x3D
#define TFTLCD_HOR_START_AD		0x50
#define TFTLCD_HOR_END_AD		0x51
#define TFTLCD_VER_START_AD		0x52
#define TFTLCD_VER_END_AD		0x53
#define TFTLCD_GATE_SCAN_CTRL1		0x60
#define TFTLCD_GATE_SCAN_CTRL2		0x61
#define TFTLCD_PART_IMG1_DISP_POS	0x80
#define TFTLCD_PART_IMG1_START_AD	0x81
#define TFTLCD_PART_IMG1_END_AD		0x82
#define TFTLCD_PART_IMG2_DISP_POS	0x83
#define TFTLCD_PART_IMG2_START_AD	0x84
#define TFTLCD_PART_IMG2_END_AD		0x85
#define TFTLCD_PANEL_IF_CTRL1		0x90
#define TFTLCD_PANEL_IF_CTRL2		0x92

#define TFTWIDTH  240
#define TFTHEIGHT  320










void st7781_init();
void st7781_put_pixel(u32 x, u32 y, u8 r, u8 g, u8 b);

#endif