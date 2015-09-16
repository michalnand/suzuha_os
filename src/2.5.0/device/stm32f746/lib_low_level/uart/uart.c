#include "uart.h"

#define USART   USART1

UART_HandleTypeDef UartHandle;


void uart_write(char c)
{
//  HAL_UART_Transmit(&UartHandle, &c, 1, 100);
}


char uart_read()
{
  char res = '\0';
  //HAL_UART_Receive(&UartHandle, &res, 1, 0x1FFFFFF);
  return res;
}

void uart_init()
{
  UartHandle.Instance        = USART;

  UartHandle.Init.BaudRate   = 115200;
  UartHandle.Init.WordLength = UART_WORDLENGTH_8B;
  UartHandle.Init.StopBits   = UART_STOPBITS_1;
  UartHandle.Init.Parity     = UART_PARITY_NONE;
  UartHandle.Init.HwFlowCtl  = UART_HWCONTROL_NONE;
  UartHandle.Init.Mode       = UART_MODE_TX_RX;
  UartHandle.AdvancedInit.AdvFeatureInit = UART_ADVFEATURE_NO_INIT;

  HAL_UART_DeInit(&UartHandle);
  HAL_UART_Init(&UartHandle);
}
