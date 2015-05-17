#include "uart.h"
#include "stm32f4xx_usart.h"


#define USART   USART1

void uart_write(char c)
{
	while( !(USART->SR & 0x00000040) )
		__asm("nop");
	
	USART->DR = c;
}


char uart_read()
{
	char res;

	while( !(USART->SR & USART_SR_RXNE) )
		__asm("nop");

	res = USART->DR;

    return res;
}

void uart_init()
{
	GPIO_InitTypeDef  GPIO_InitStructure;
	USART_InitTypeDef USART_InitStructure;


	RCC_APB2PeriphClockCmd(RCC_APB2Periph_USART1, ENABLE);
	RCC_AHB1PeriphClockCmd(RCC_AHB1Periph_GPIOA, ENABLE);

 
   //Connect USART pins to A
  	GPIO_InitStructure.GPIO_Pin = GPIO_Pin_9 | GPIO_Pin_10;
  	GPIO_InitStructure.GPIO_Mode = GPIO_Mode_AF;
  	GPIO_InitStructure.GPIO_OType = GPIO_OType_PP;
  	GPIO_InitStructure.GPIO_PuPd = GPIO_PuPd_NOPULL;
  	GPIO_InitStructure.GPIO_Speed = GPIO_Speed_50MHz;
  	GPIO_Init(GPIOA, &GPIO_InitStructure);
 

  	GPIO_PinAFConfig(GPIOA, GPIO_PinSource9, GPIO_AF_USART1);
  	GPIO_PinAFConfig(GPIOA, GPIO_PinSource10, GPIO_AF_USART1); 

  USART_InitStructure.USART_BaudRate = UART_BAUD_RATE;
  USART_InitStructure.USART_WordLength = USART_WordLength_8b;
  USART_InitStructure.USART_StopBits = USART_StopBits_1;
  USART_InitStructure.USART_Parity = USART_Parity_No;
  USART_InitStructure.USART_HardwareFlowControl = USART_HardwareFlowControl_None;
 
  USART_InitStructure.USART_Mode = USART_Mode_Rx | USART_Mode_Tx;
 
  USART_Init(USART, &USART_InitStructure);
 
  USART_Cmd(USART, ENABLE);

/*
  USART_InitTypeDef USART_InitStructure;


  RCC_AHB1PeriphClockCmd(RCC_AHB1Periph_GPIOA, ENABLE);//使う機能にクロック供給
 RCC_APB1PeriphClockCmd(RCC_APB1Periph_USART2, ENABLE);
 GPIO_InitTypeDef GPIO_InitStructure;   //GPIOA_2の設定
 GPIO_InitStructure.GPIO_Pin = GPIO_Pin_2 | GPIO_Pin_3;
 GPIO_InitStructure.GPIO_Mode = GPIO_Mode_AF;
 GPIO_InitStructure.GPIO_Speed = GPIO_Speed_100MHz;
 GPIO_InitStructure.GPIO_OType = GPIO_OType_PP;
 GPIO_InitStructure.GPIO_PuPd = GPIO_PuPd_NOPULL;
 GPIO_Init(GPIOA, &GPIO_InitStructure);   
 GPIO_PinAFConfig(GPIOA , GPIO_PinSource2 , GPIO_AF_USART2); //オルタネィテブファンクションの設定
 
USART_InitStructure.USART_BaudRate = UART_BAUD_RATE;
  USART_InitStructure.USART_WordLength = USART_WordLength_8b;
  USART_InitStructure.USART_StopBits = USART_StopBits_1;
  USART_InitStructure.USART_Parity = USART_Parity_No;
  USART_InitStructure.USART_HardwareFlowControl = USART_HardwareFlowControl_None;
 
  USART_InitStructure.USART_Mode = USART_Mode_Rx | USART_Mode_Tx;
 
  USART_Init(USART, &USART_InitStructure);
 
  USART_Cmd(USART, ENABLE);

*/

}
