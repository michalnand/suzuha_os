#ifndef _ST7181_PORT_H_
#define _ST7181_PORT_H_

#include "../../os/suzuha_os.h"


void st7781_rs_init();
void st7781_rs_set();
void st7781_rs_clear();

void st7781_rd_init();
void st7781_rd_set();
void st7781_rd_clear();

void st7781_wr_init();
void st7781_wr_set();
void st7781_wr_clear();

void st7781_cs_init();
void st7781_cs_set();
void st7781_cs_clear();

void st7781_reset_init();
void st7781_reset_set();
void st7781_reset_clear();

void st7781_d_init();
void st7781_d_set(unsigned char b);


#endif