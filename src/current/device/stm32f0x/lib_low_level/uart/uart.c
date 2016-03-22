#include "uart.h"
#include "../std_periph/std_periph.h"

#define USART         USART1
#define USART_GPIO    GPIOA
#define USART_CLOCK   RCC_APB2Periph_USART1


void uart_write(char c)
{

  while( !(USART->ISR & USART_FLAG_TXE) )
		__asm("nop");

	USART->TDR = c;
}


char uart_read()
{
	u16 res = 0;


  return res;
}



void uart_init()
{
	GPIO_InitTypeDef        GPIO_InitStructure;
	USART_InitTypeDef USART_InitStructure;

  RCC_AHBPeriphClockCmd(RCC_AHBPeriph_GPIOA, ENABLE);
  RCC_APB2PeriphClockCmd(USART_CLOCK, ENABLE);

  /*
  GPIO_PinAFConfig(USART_GPIO, GPIO_PinSource9, GPIO_AF_1);
  GPIO_PinAFConfig(USART_GPIO, GPIO_PinSource10, GPIO_AF_1);

	GPIO_InitStructure.GPIO_Pin = (1<<9)|(1<<10);
	GPIO_InitStructure.GPIO_Mode = GPIO_Mode_AF;
	GPIO_InitStructure.GPIO_Speed = GPIO_Speed_10MHz;
	GPIO_InitStructure.GPIO_OType = GPIO_OType_PP;
	GPIO_InitStructure.GPIO_PuPd = GPIO_PuPd_UP;
	GPIO_Init(GPIOA, &GPIO_InitStructure);
	GPIO_InitStructure.GPIO_Pin = 1<<10;
	GPIO_Init(GPIOA, &GPIO_InitStructure);
  */


  GPIO_PinAFConfig(USART_GPIO, GPIO_PinSource2, GPIO_AF_1);
  GPIO_PinAFConfig(USART_GPIO, GPIO_PinSource15, GPIO_AF_1);

	GPIO_InitStructure.GPIO_Pin = (1<<2)|(1<<15);
	GPIO_InitStructure.GPIO_Mode = GPIO_Mode_AF;
	GPIO_InitStructure.GPIO_Speed = GPIO_Speed_10MHz;
	GPIO_InitStructure.GPIO_OType = GPIO_OType_PP;
	GPIO_InitStructure.GPIO_PuPd = GPIO_PuPd_UP;
	GPIO_Init(GPIOA, &GPIO_InitStructure);


	/* USARTx configured as follow:
	  - BaudRate = 115200 baud
	  - Word Length = 8 Bits
	  - Stop Bit = 1 Stop Bit
	  - Parity = No Parity
	  - Hardware flow control disabled (RTS and CTS signals)
	  - Receive and transmit enabled
	*/ 
	USART_InitStructure.USART_BaudRate = 115200;
	USART_InitStructure.USART_WordLength = USART_WordLength_8b;
	USART_InitStructure.USART_StopBits = USART_StopBits_1;
	USART_InitStructure.USART_Parity = USART_Parity_No;
	USART_InitStructure.USART_HardwareFlowControl = USART_HardwareFlowControl_None;
	USART_InitStructure.USART_Mode = USART_Mode_Rx | USART_Mode_Tx;

	/* USART configuration */
	USART_Init(USART, &USART_InitStructure);

	/* Enable USART */
	USART_Cmd(USART, ENABLE);
}

void USART1_IRQHandler(void)
{
  /*
  if (USART_GetITStatus(USART, USART_IT_RXNE) != RESET) // Received character?
  {
    char rx =  USART_ReceiveData(USART);

    g_uart_rx_buffer[g_uart_wr_ptr] = rx;
      g_uart_wr_ptr++;
    if (g_uart_wr_ptr >= UART_RX_BUFFER_SIZE)
      g_uart_wr_ptr = 0;
  }
  */
  USART_ClearITPendingBit(USART, USART_IT_RXNE);
}
