#include "uart.h"


#define USARTx                           USART2
#define USARTx_CLK_ENABLE()              __HAL_RCC_USART2_CLK_ENABLE();
#define USARTx_RX_GPIO_CLK_ENABLE()      __HAL_RCC_GPIOA_CLK_ENABLE()
#define USARTx_TX_GPIO_CLK_ENABLE()      __HAL_RCC_GPIOA_CLK_ENABLE()

#define USARTx_FORCE_RESET()             __HAL_RCC_USART2_FORCE_RESET()
#define USARTx_RELEASE_RESET()           __HAL_RCC_USART2_RELEASE_RESET()

/* Definition for USARTx Pins */
#define USARTx_TX_PIN                    GPIO_PIN_2
#define USARTx_TX_GPIO_PORT              GPIOA
#define USARTx_TX_AF                     GPIO_AF4_USART2
#define USARTx_RX_PIN                    GPIO_PIN_3
#define USARTx_RX_GPIO_PORT              GPIOA
#define USARTx_RX_AF                     GPIO_AF4_USART2


void uart_write(char c)
{
  USARTx->TDR = c;
   while((USARTx->ISR & USART_ISR_TC) != USART_ISR_TC)
    __asm("nop");
}


char uart_read()
{
  /*
   while((USARTx->ISR & UART_FLAG_RXNE) == 0)
    __asm("nop");

  char res = USARTx->RDR;

//  USARTx->ISR&=~UART_FLAG_RXNE;

	return res;
  */

  return 0;
}

void uart_init()
{
  GPIO_InitTypeDef  GPIO_InitStruct;

  /*##-1- Enable peripherals and GPIO Clocks #################################*/
  /* Enable GPIO TX/RX clock */
  USARTx_TX_GPIO_CLK_ENABLE();
  USARTx_RX_GPIO_CLK_ENABLE();

  /* Enable USARTx clock */
  USARTx_CLK_ENABLE();

  /*##-2- Configure peripheral GPIO ##########################################*/
  /* UART TX GPIO pin configuration  */
  GPIO_InitStruct.Pin       = USARTx_TX_PIN;
  GPIO_InitStruct.Mode      = GPIO_MODE_AF_PP;
  GPIO_InitStruct.Pull      = GPIO_PULLUP;
  GPIO_InitStruct.Speed     = GPIO_SPEED_FREQ_VERY_HIGH;
  GPIO_InitStruct.Alternate = USARTx_TX_AF;
  HAL_GPIO_Init(USARTx_TX_GPIO_PORT, &GPIO_InitStruct);

  /* UART RX GPIO pin configuration  */
  GPIO_InitStruct.Pin = USARTx_RX_PIN;
  GPIO_InitStruct.Alternate = USARTx_RX_AF;
  HAL_GPIO_Init(USARTx_RX_GPIO_PORT, &GPIO_InitStruct);


  /* Configure USART1 */
  /* (1) oversampling by 16, 9600 baud */
  USARTx->BRR =  20000 / 96; /* (1) */

  /* (2) 8 data bit, 1 start bit, 1 stop bit, no parity */
  USARTx->CR1 = USART_CR1_TE | USART_CR1_RE | USART_CR1_UE; /* (2) */

//  USARTx->CR1 |= USART_CR1_TCIE;/* Enable TC interrupt */

  /* polling idle frame Transmission */
  while((USARTx->ISR & USART_ISR_TC) != USART_ISR_TC)
  {
    /* add time out here for a robust application */
  }

  USARTx->ICR |= USART_ICR_TCCF;/* clear TC flag */
}
