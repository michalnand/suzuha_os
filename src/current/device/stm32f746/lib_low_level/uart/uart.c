#include "uart.h"


#define USART                          USART6
#define USART_CLK_ENABLE()             __HAL_RCC_USART6_CLK_ENABLE()
#define USART_CLK_DISABLE()            __HAL_RCC_USART6_CLK_DISABLE()

#define USART_TX_PIN                   GPIO_PIN_6
#define USART_TX_GPIO_PORT             GPIOC
#define USART_TX_GPIO_CLK_ENABLE()     __HAL_RCC_GPIOC_CLK_ENABLE()
#define USART_TX_GPIO_CLK_DISABLE()    __HAL_RCC_GPIOC_CLK_DISABLE()
#define USART_TX_AF                    GPIO_AF8_USART6

#define USART_RX_PIN                   GPIO_PIN_7
#define USART_RX_GPIO_PORT             GPIOC
#define USART_RX_GPIO_CLK_ENABLE()     __HAL_RCC_GPIOC_CLK_ENABLE()
#define USART_RX_GPIO_CLK_DISABLE()    __HAL_RCC_GPIOC_CLK_DISABLE()
#define USART_RX_AF                    GPIO_AF8_USART6

#define USART_IRQn                     USART1_IRQn


UART_HandleTypeDef UartHandle;


void uart_write(char c)
{
  HAL_UART_Transmit(&UartHandle, (uint8_t*)&c, 1, 100);
}


char uart_read()
{
  char res = '\0';
  HAL_UART_Receive(&UartHandle, (uint8_t*)&res, 1, 0x1FFFFFF);
  return res;
}

void uart_init()
{
  GPIO_InitTypeDef gpio_init_structure;

  /* Enable GPIO clock */
  USART_TX_GPIO_CLK_ENABLE();
  USART_RX_GPIO_CLK_ENABLE();

  /* Enable USART clock */
  USART_CLK_ENABLE();

  /* Configure USART Tx as alternate function */
  gpio_init_structure.Pin = USART_TX_PIN;
  gpio_init_structure.Mode = GPIO_MODE_AF_PP;
  gpio_init_structure.Speed = GPIO_SPEED_FAST;
  gpio_init_structure.Pull = GPIO_PULLUP;
  gpio_init_structure.Alternate = USART_TX_AF;
  HAL_GPIO_Init(USART_TX_GPIO_PORT, &gpio_init_structure);

  /* Configure USART Rx as alternate function */
  gpio_init_structure.Pin = USART_RX_PIN;
  gpio_init_structure.Mode = GPIO_MODE_AF_PP;
  gpio_init_structure.Alternate = USART_RX_AF;
  HAL_GPIO_Init(USART_RX_GPIO_PORT, &gpio_init_structure);


  /* USART configuration */
  UartHandle.Instance      = USART;
  UartHandle.Init.BaudRate = UART_BAUD_RATE;
  UartHandle.Init.WordLength = UART_WORDLENGTH_8B;
  UartHandle.Init.StopBits = UART_STOPBITS_1;
  UartHandle.Init.Parity = UART_PARITY_NONE;
  UartHandle.Init.HwFlowCtl = UART_HWCONTROL_NONE;
  UartHandle.Init.Mode = UART_MODE_TX_RX;
  UartHandle.AdvancedInit.AdvFeatureInit = UART_ADVFEATURE_NO_INIT;

  HAL_UART_Init(&UartHandle);
}
