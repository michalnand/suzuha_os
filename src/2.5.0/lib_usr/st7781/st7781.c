#include "st7781.h"


void st7781_write(u8 command, u8 *data, u32 size)
{
	st7781_rd_set();

	st7781_rs_clear();

	st7781_cs_clear();

	st7781_wr_clear();
	st7781_d_set(command);
	st7781_wr_set();


	if (size != 0)
	{
		st7781_rs_set();
		u32 i;
		for (i = 0; i < size; i++)
		{
			st7781_wr_clear();
			st7781_d_set(data[i]);
			st7781_wr_set();
		}

	}

	st7781_cs_set();
}

void st7781_write_command(u16 cmd)
{
	st7781_cs_clear();
	st7781_rs_clear();
  	st7781_rd_set();
  	st7781_wr_set();


	st7781_d_set(cmd >> 8);
	st7781_wr_clear();
	st7781_wr_set();


	st7781_d_set(cmd);
  	st7781_wr_clear();
	st7781_wr_set();

 	st7781_cs_set();
 }


void st7781_write_data(u16 data)
{
	st7781_cs_clear();
	st7781_rs_set();
   	st7781_rd_set();
  	st7781_wr_set();

	st7781_d_set(data >> 8);
	st7781_wr_clear();
	st7781_wr_set();

	st7781_d_set(data);
  	st7781_wr_clear();
	st7781_wr_set();

 	st7781_cs_set();
 }



 void st7781_write_data_unsafe(u16 data)
 {
	st7781_d_set(data >> 8);
	st7781_wr_clear();
	st7781_wr_set();

	st7781_d_set(data);
	st7781_wr_clear();
	st7781_wr_set();
}

void st7781_write_register(u16 addr, u16 data)
{
 	st7781_write_command(addr);
	st7781_write_data(data);

	//u8 data_[1];
	//data_[0] = data;
	//st7781_write(addr, data_, 1);
}





void st7781_put_pixel(u32 x, u32 y, u8 r, u8 g, u8 b)
{
	u16 c;
  	c = r >> 3;
  	c <<= 6;
  	c |= g >> 2;
  	c <<= 5;
  	c |= b >> 3;


	st7781_write_register(TFTLCD_GRAM_HOR_AD, x);
	st7781_write_register(TFTLCD_GRAM_VER_AD, y);
	st7781_write_command(TFTLCD_RW_GRAM);
	st7781_write_data(c);
}



#define  ST7781_CONFIG_SIZE (37*2)

volatile u16 const st7781_config[ST7781_CONFIG_SIZE] = {
TFTLCD_DRIV_OUT_CTRL, 0x0100,
TFTLCD_DRIV_WAV_CTRL, 0x0700,
TFTLCD_ENTRY_MOD,  0x1030,
TFTLCD_DISP_CTRL2, 0x0302,
TFTLCD_DISP_CTRL3, 0x0000,
TFTLCD_DISP_CTRL4, 0x0008,

//*******POWER CONTROL REGISTER INITIAL*******//
TFTLCD_POW_CTRL1, 0x0790,
TFTLCD_POW_CTRL2, 0x0005,
TFTLCD_POW_CTRL3, 0x0000,
TFTLCD_POW_CTRL4, 0x0000,

 //delayms(50,
0xff, 50,
//********POWER SUPPPLY STARTUP 1 SETTING*******//
TFTLCD_POW_CTRL1, 0x12B0,
// delayms(50,
 0xff, 50,
 TFTLCD_POW_CTRL2, 0x0007,
 //delayms(50,
 0xff, 50,
//********POWER SUPPLY STARTUP 2 SETTING******//
TFTLCD_POW_CTRL3, 0x008C,
TFTLCD_POW_CTRL4, 0x1700,
TFTLCD_VCOMH_CTRL, 0x0022,
// delayms(50,
0xff, 50,
//******GAMMA CLUSTER SETTING******//
TFTLCD_GAMMA_CTRL1, 0x0000,
TFTLCD_GAMMA_CTRL2, 0x0505,
TFTLCD_GAMMA_CTRL3, 0x0205,
TFTLCD_GAMMA_CTRL4, 0x0206,
TFTLCD_GAMMA_CTRL5, 0x0408,
TFTLCD_GAMMA_CTRL6, 0x0000,
TFTLCD_GAMMA_CTRL7, 0x0504,
TFTLCD_GAMMA_CTRL8, 0x0206,
TFTLCD_GAMMA_CTRL9, 0x0206,
TFTLCD_GAMMA_CTRL10, 0x0408,
// -----------DISPLAY WINDOWS 240*320-------------//
TFTLCD_HOR_START_AD, 0x0000,
TFTLCD_HOR_END_AD, 0x00EF,
TFTLCD_VER_START_AD, 0x0000,
TFTLCD_VER_END_AD, 0x013F,
//-----FRAME RATE SETTING-------//
TFTLCD_GATE_SCAN_CTRL1, 0xA700,
TFTLCD_GATE_SCAN_CTRL2, 0x0001,
TFTLCD_PANEL_IF_CTRL1, 0x0033, //RTNI setting
//-------DISPLAY ON------//
TFTLCD_DISP_CTRL1, 0x0133,
};






void st7781_init()
{
	st7781_rs_init();
	st7781_rd_init();
	st7781_wr_init();
	st7781_cs_init();
	st7781_d_init();

	st7781_reset_init();

	st7781_reset_clear();
	timer_delay_ms(3);
	st7781_reset_set();
	timer_delay_ms(3);

	st7781_write_data(0);
	st7781_write_data(0);
	st7781_write_data(0);
	st7781_write_data(0);


	u32 i;
	for (i = 0; i < ST7781_CONFIG_SIZE; i+= 2)
	{
    	u16 a = st7781_config[i];
    	u16 d = st7781_config[i + 1];

   		if (a == 0xFF)
   		{
			if (d > 100)
				d = 100;
			timer_delay_ms(d);
   		}
    	else
      		st7781_write_register(a, d);
     }

	 /*
	 while (1)
	 {
		 st7781_write_register(TFTLCD_GRAM_HOR_AD, 0);     // GRAM Address Set (Horizontal Address) (R20h)
		 st7781_write_register(TFTLCD_GRAM_VER_AD, 0);     // GRAM Address Set (Vertical Address) (R21h)
		 st7781_write_command(TFTLCD_RW_GRAM);            // Write Data to GRAM (R22h)



		 u16 color = 13454;

		 st7781_cs_clear();
		 st7781_rs_clear();
		 st7781_rd_set();
		 st7781_wr_set();

		 for (i = 0; i < 320*240; i++)
		 {
			 st7781_write_data_unsafe(color);
			 color++;
		 }

		 st7781_cs_set();

		 timer_delay_ms(100);
 	}
	*/
}
