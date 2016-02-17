#include "uart.h"


void uart_write(char c)
{
  USART1->TDR = c;

   while((USART1->ISR & USART_ISR_TC) != USART_ISR_TC)
    __asm("nop");

} 

 
char uart_read()
{
	return 0;
}

void uart_init()
{
  /* Enable the peripheral clock of GPIOA */
  RCC->IOPENR |= RCC_IOPENR_GPIOAEN;
	
  /* GPIO configuration for USART1 signals */
  /* (1) Select AF mode (10) on PA9 and PA10 */
  /* (2) AF4 for USART1 signals */
  GPIOA->MODER = (GPIOA->MODER & ~(GPIO_MODER_MODE9|GPIO_MODER_MODE10))\
                 | (GPIO_MODER_MODE9_1 | GPIO_MODER_MODE10_1); /* (1) */
  GPIOA->AFR[1] = (GPIOA->AFR[1] &~ (0x00000FF0))\
                  | (4 << (1 * 4)) | (4 << (2 * 4)); /* (2) */

  /* Enable the peripheral clock USART1 */
  RCC->APB2ENR |= RCC_APB2ENR_USART1EN;

  /* Configure USART1 */
  /* (1) oversampling by 16, 9600 baud */
  /* (2) 8 data bit, 1 start bit, 1 stop bit, no parity */
  //USART1->BRR = 160000 / 96; /* (1) */  
  USART1->BRR = 10000 / 96; /* (1) */   
  USART1->CR1 = USART_CR1_TE | USART_CR1_RE | USART_CR1_UE; /* (2) */

  USART1->CR1 |= USART_CR1_TCIE;/* Enable TC interrupt */
  
  /* polling idle frame Transmission */
  while((USART1->ISR & USART_ISR_TC) != USART_ISR_TC)
  { 
    /* add time out here for a robust application */
  }

  USART1->ICR |= USART_ICR_TCCF;/* clear TC flag */
}  