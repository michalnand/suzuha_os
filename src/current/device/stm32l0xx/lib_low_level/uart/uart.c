#include "uart.h"


void uart_write(char c)
{
  USART2->TDR = c;

   while((USART2->ISR & USART_ISR_TC) != USART_ISR_TC)
    __asm("nop");

}


char uart_read()
{
	return 0;
}

void uart_init()
{
  /*
  UartHandle.Instance        = USART2;

  UartHandle.Init.BaudRate   = 9600;
  UartHandle.Init.WordLength = UART_WORDLENGTH_8B;
  UartHandle.Init.StopBits   = UART_STOPBITS_1;
  UartHandle.Init.Parity     = UART_PARITY_NONE;
  UartHandle.Init.HwFlowCtl  = UART_HWCONTROL_NONE;
  UartHandle.Init.Mode       = UART_MODE_TX_RX;

  HAL_UART_DeInit(&UartHandle);
  HAL_UART_Init(&UartHandle);

  return;
  */


  /* Enable the peripheral clock of GPIOA */
  RCC->IOPENR |= RCC_IOPENR_GPIOAEN;

  /* GPIO configuration for USART1 signals */
  /* (1) Select AF mode (10) on PA9 and PA10 */
  /* (2) AF4 for USART1 signals */
  GPIOA->MODER = (GPIOA->MODER & ~(GPIO_MODER_MODE2|GPIO_MODER_MODE10))\
                 | (GPIO_MODER_MODE2_1 | GPIO_MODER_MODE10_1); /* (1) */

  GPIOA->AFR[1] = (GPIOA->AFR[1] &~ (0x00000FF0))\
                  | (4 << (1 * 4)) | (4 << (2 * 4)); /* (2) */

  /* Enable the peripheral clock USART2 */
  RCC->APB1ENR |= RCC_APB1ENR_USART2EN;

  /* Configure USART1 */
  /* (1) oversampling by 16, 9600 baud */
  /* (2) 8 data bit, 1 start bit, 1 stop bit, no parity */
  //USART1->BRR = 160000 / 96; /* (1) */
  USART2->BRR = 10000 / 96; /* (1) */
  USART2->CR1 = USART_CR1_TE | USART_CR1_RE | USART_CR1_UE; /* (2) */

  // USART2->CR1 |= USART_CR1_TCIE;/* Enable TC interrupt */

  /* polling idle frame Transmission */
  /*
  while((USART2->ISR & USART_ISR_TC) != USART_ISR_TC)
  {
  }
  */

  USART2->ICR |= USART_ICR_TCCF;/* clear TC flag */
}
