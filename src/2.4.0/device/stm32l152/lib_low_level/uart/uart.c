#include "uart.h"
#include "stm32l1xx_usart.h"


#define USART_BASE  USART3 
 
void uart_write(char c) 
{
	while( !(USART_BASE->SR & 0x00000040) )
		__asm("nop");
	
	USART_BASE->DR = c;
}


char uart_read()
{
	char res;

	while( !(USART_BASE->SR & USART_SR_RXNE) )
		__asm("nop");

	res = USART_BASE->DR;

  return res; 
}

void uart_init()
{
  GPIO_InitTypeDef GPIO_InitStructure;
  USART_InitTypeDef USART_InitStructure;

  RCC_APB1PeriphClockCmd(RCC_APB1Periph_USART3, ENABLE );


  /* Configure USART Rx & Tx as alternate function */
  GPIO_InitStructure.GPIO_Pin = GPIO_Pin_10 | GPIO_Pin_11;
  GPIO_InitStructure.GPIO_Mode = GPIO_Mode_AF;
  GPIO_InitStructure.GPIO_Speed = GPIO_Speed_40MHz;
  GPIO_InitStructure.GPIO_OType = GPIO_OType_PP;
  GPIO_InitStructure.GPIO_PuPd = GPIO_PuPd_UP;
  GPIO_Init(GPIOC, &GPIO_InitStructure);
 
  GPIO_PinAFConfig(GPIOC, GPIO_PinSource10, GPIO_AF_USART3 );
  GPIO_PinAFConfig(GPIOC, GPIO_PinSource11, GPIO_AF_USART3 );




  /* USART1 configuration ------------------------------------------------------*/
  /* USART1 configured as follow:
    - BaudRate = 115200 baud  
    - Word Length = 8 Bits
    - One Stop Bit
    - No parity
    - Hardware flow control disabled (RTS and CTS signals)
    - Receive and transmit enabled
  */
  USART_InitStructure.USART_BaudRate = UART_BAUD_RATE;
  USART_InitStructure.USART_WordLength = USART_WordLength_8b;
  USART_InitStructure.USART_StopBits = USART_StopBits_1;
  USART_InitStructure.USART_Parity = USART_Parity_No;
  USART_InitStructure.USART_HardwareFlowControl = USART_HardwareFlowControl_None;
  USART_InitStructure.USART_Mode = USART_Mode_Rx | USART_Mode_Tx;

  /* Configure the USART1 */
  USART_Init(USART_BASE, &USART_InitStructure);

  /* Enable the USART1 */
  USART_Cmd(USART_BASE, ENABLE);
}
