#include "st7781_port.h"

#ifdef CPU_STM32F4

#define ST7781_WR_DELAY			((u32)20)
#define ST7781_RD_DELAY			(2*ST7781_WR_DELAY)
#define ST7781_RESET_DELAY		(40000*ST7781_WR_DELAY)

#define ST7781_RS_DELAY			(ST7781_WR_DELAY)
#define ST7781_CS_DELAY			(ST7781_WR_DELAY)


#define ST7781_RS_GPIO	GPIOA
#define ST7781_RS_PIN	4


void st7781_rs_init()
{
	GPIO_InitTypeDef  GPIO_InitStructure;

	GPIO_InitStructure.GPIO_Pin = (1<<ST7781_RS_PIN);
	GPIO_InitStructure.GPIO_Mode = GPIO_Mode_OUT;
	GPIO_InitStructure.GPIO_OType = GPIO_OType_PP;
	GPIO_InitStructure.GPIO_Speed = GPIO_Speed_100MHz;
	GPIO_InitStructure.GPIO_PuPd = GPIO_PuPd_NOPULL;

	GPIO_Init(ST7781_RS_GPIO, &GPIO_InitStructure);

	st7781_rs_set();
}

void st7781_rs_set()
{
	__asm("nop");
	__asm("nop");

	ST7781_RS_GPIO->BSRRL = (1<<ST7781_RS_PIN);

	__asm("nop");
	__asm("nop");

	u32 loops = ST7781_RS_DELAY;
	while (loops--)
		__asm("nop");
}

void st7781_rs_clear()
{
	__asm("nop");
	__asm("nop");

	ST7781_RS_GPIO->BSRRH = (1<<ST7781_RS_PIN);

	__asm("nop");
	__asm("nop");

	u32 loops = ST7781_RS_DELAY;
	while (loops--)
		__asm("nop");
}


#define ST7781_RD_GPIO	GPIOA
#define ST7781_RD_PIN	2

void st7781_rd_init()
{
	GPIO_InitTypeDef  GPIO_InitStructure;

	GPIO_InitStructure.GPIO_Pin = (1<<ST7781_RD_PIN);
	GPIO_InitStructure.GPIO_Mode = GPIO_Mode_OUT;
	GPIO_InitStructure.GPIO_OType = GPIO_OType_PP;
	GPIO_InitStructure.GPIO_Speed = GPIO_Speed_100MHz;
	GPIO_InitStructure.GPIO_PuPd = GPIO_PuPd_NOPULL;

	GPIO_Init(ST7781_RD_GPIO, &GPIO_InitStructure);

	st7781_rd_set();
}

void st7781_rd_set()
{
	ST7781_RD_GPIO->BSRRL = (1<<ST7781_RD_PIN);

	u32 loops = ST7781_RD_DELAY;
	while (loops--)
		__asm("nop");
}

void st7781_rd_clear()
{
	ST7781_RD_GPIO->BSRRH = (1<<ST7781_RD_PIN);

	u32 loops = ST7781_RD_DELAY;
	while (loops--)
		__asm("nop");
}


#define ST7781_WR_GPIO	GPIOA
#define ST7781_WR_PIN	3

void st7781_wr_init()
{
	GPIO_InitTypeDef  GPIO_InitStructure;

	GPIO_InitStructure.GPIO_Pin = (1<<ST7781_WR_PIN);
	GPIO_InitStructure.GPIO_Mode = GPIO_Mode_OUT;
	GPIO_InitStructure.GPIO_OType = GPIO_OType_PP;
	GPIO_InitStructure.GPIO_Speed = GPIO_Speed_100MHz;
	GPIO_InitStructure.GPIO_PuPd = GPIO_PuPd_NOPULL;

	GPIO_Init(ST7781_WR_GPIO, &GPIO_InitStructure);

	st7781_wr_set();
}

void st7781_wr_set()
{
	ST7781_WR_GPIO->BSRRL = (1<<ST7781_WR_PIN);

	u32 loops = ST7781_WR_DELAY;
	while (loops--)
		__asm("nop");
}

void st7781_wr_clear()
{
	ST7781_WR_GPIO->BSRRH = (1<<ST7781_WR_PIN);

	u32 loops = ST7781_WR_DELAY;
	while (loops--)
		__asm("nop");
}

#define ST7781_CS_GPIO	GPIOA
#define ST7781_CS_PIN	5

void st7781_cs_init()
{
	GPIO_InitTypeDef  GPIO_InitStructure;

	GPIO_InitStructure.GPIO_Pin = (1<<ST7781_CS_PIN);
	GPIO_InitStructure.GPIO_Mode = GPIO_Mode_OUT;
	GPIO_InitStructure.GPIO_OType = GPIO_OType_PP;
	GPIO_InitStructure.GPIO_Speed = GPIO_Speed_100MHz;
	GPIO_InitStructure.GPIO_PuPd = GPIO_PuPd_NOPULL;

	GPIO_Init(ST7781_CS_GPIO, &GPIO_InitStructure);

	st7781_cs_set();
}

void st7781_cs_set()
{
	__asm("nop");
	__asm("nop");

	ST7781_CS_GPIO->BSRRL = (1<<ST7781_CS_PIN);

	__asm("nop");
	__asm("nop");

	u32 loops = ST7781_CS_DELAY;
	while (loops--)
		__asm("nop");
}

void st7781_cs_clear()
{
	__asm("nop");
	__asm("nop");

	ST7781_CS_GPIO->BSRRH = (1<<ST7781_CS_PIN);

	__asm("nop");
	__asm("nop");

	u32 loops = ST7781_CS_DELAY;
	while (loops--)
		__asm("nop");
}


#define ST7781_RES_GPIO	GPIOC
#define ST7781_RES_PIN	7

void st7781_reset_init()
{
	GPIO_InitTypeDef  GPIO_InitStructure;

	GPIO_InitStructure.GPIO_Pin = (1<<ST7781_RES_PIN);
	GPIO_InitStructure.GPIO_Mode = GPIO_Mode_OUT;
	GPIO_InitStructure.GPIO_OType = GPIO_OType_PP;
	GPIO_InitStructure.GPIO_Speed = GPIO_Speed_100MHz;
	GPIO_InitStructure.GPIO_PuPd = GPIO_PuPd_NOPULL;

	GPIO_Init(ST7781_RES_GPIO, &GPIO_InitStructure);

	st7781_reset_clear();
	st7781_reset_set();
}

void st7781_reset_set()
{
	ST7781_RES_GPIO->BSRRL = (1<<ST7781_RES_PIN);

	u32 loops = ST7781_RESET_DELAY;
	while (loops--)
		__asm("nop");
}

void st7781_reset_clear()
{
	ST7781_RES_GPIO->BSRRH = (1<<ST7781_RES_PIN);

	u32 loops = ST7781_RESET_DELAY;
	while (loops--)
		__asm("nop");
}


#define ST7781_LD2_GPIO	GPIOF
#define ST7781_LD2_PIN	0

#define ST7781_LD3_GPIO	GPIOF
#define ST7781_LD3_PIN	1

#define ST7781_LD4_GPIO	GPIOF
#define ST7781_LD4_PIN	2

#define ST7781_LD5_GPIO	GPIOF
#define ST7781_LD5_PIN	3

#define ST7781_LD6_GPIO	GPIOF
#define ST7781_LD6_PIN	4

#define ST7781_LD7_GPIO	GPIOF
#define ST7781_LD7_PIN	5

#define ST7781_LD0_GPIO	GPIOF
#define ST7781_LD0_PIN	6

#define ST7781_LD1_GPIO	GPIOF
#define ST7781_LD1_PIN	7

void st7781_d_init()
{
	GPIO_InitTypeDef  GPIO_InitStructure;

	GPIO_InitStructure.GPIO_Mode = GPIO_Mode_OUT;
	GPIO_InitStructure.GPIO_OType = GPIO_OType_PP;
	GPIO_InitStructure.GPIO_Speed = GPIO_Speed_100MHz;
	GPIO_InitStructure.GPIO_PuPd = GPIO_PuPd_NOPULL;

	GPIO_InitStructure.GPIO_Pin = (1<<ST7781_LD0_PIN);
	GPIO_Init(ST7781_LD0_GPIO, &GPIO_InitStructure);

	GPIO_InitStructure.GPIO_Pin = (1<<ST7781_LD1_PIN);
	GPIO_Init(ST7781_LD1_GPIO, &GPIO_InitStructure);

	GPIO_InitStructure.GPIO_Pin = (1<<ST7781_LD2_PIN);
	GPIO_Init(ST7781_LD2_GPIO, &GPIO_InitStructure);

	GPIO_InitStructure.GPIO_Pin = (1<<ST7781_LD3_PIN);
	GPIO_Init(ST7781_LD3_GPIO, &GPIO_InitStructure);

	GPIO_InitStructure.GPIO_Pin = (1<<ST7781_LD4_PIN);
	GPIO_Init(ST7781_LD4_GPIO, &GPIO_InitStructure);

	GPIO_InitStructure.GPIO_Pin = (1<<ST7781_LD5_PIN);
	GPIO_Init(ST7781_LD5_GPIO, &GPIO_InitStructure);

	GPIO_InitStructure.GPIO_Pin = (1<<ST7781_LD6_PIN);
	GPIO_Init(ST7781_LD6_GPIO, &GPIO_InitStructure);

	GPIO_InitStructure.GPIO_Pin = (1<<ST7781_LD7_PIN);
	GPIO_Init(ST7781_LD7_GPIO, &GPIO_InitStructure);

	st7781_d_set(0x00);
}

void st7781_d_set(unsigned char b)
{
	if (b&(1<<0))
		ST7781_LD0_GPIO->BSRRL = (1<<ST7781_LD0_PIN);
	else
		ST7781_LD0_GPIO->BSRRH = (1<<ST7781_LD0_PIN);

	if (b&(1<<1))
		ST7781_LD1_GPIO->BSRRL = (1<<ST7781_LD1_PIN);
	else
		ST7781_LD1_GPIO->BSRRH = (1<<ST7781_LD1_PIN);

	if (b&(1<<2))
		ST7781_LD2_GPIO->BSRRL = (1<<ST7781_LD2_PIN);
	else
		ST7781_LD2_GPIO->BSRRH = (1<<ST7781_LD2_PIN);

	if (b&(1<<3))
		ST7781_LD3_GPIO->BSRRL = (1<<ST7781_LD3_PIN);
	else
		ST7781_LD3_GPIO->BSRRH = (1<<ST7781_LD3_PIN);

	if (b&(1<<4))
		ST7781_LD4_GPIO->BSRRL = (1<<ST7781_LD4_PIN);
	else
		ST7781_LD4_GPIO->BSRRH = (1<<ST7781_LD4_PIN);

	if (b&(1<<5))
		ST7781_LD5_GPIO->BSRRL = (1<<ST7781_LD5_PIN);
	else
		ST7781_LD5_GPIO->BSRRH = (1<<ST7781_LD5_PIN);

	if (b&(1<<6))
		ST7781_LD6_GPIO->BSRRL = (1<<ST7781_LD6_PIN);
	else
		ST7781_LD6_GPIO->BSRRH = (1<<ST7781_LD6_PIN);

	if (b&(1<<7))
		ST7781_LD7_GPIO->BSRRL = (1<<ST7781_LD7_PIN);
	else
		ST7781_LD7_GPIO->BSRRH = (1<<ST7781_LD7_PIN);

	__asm("nop");
	__asm("nop");
}

#endif
