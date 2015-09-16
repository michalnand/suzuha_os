#include "uart.h"

#include "driverlib/gpio.h"

#include "driverlib/uart.h"


void uart_write(char c)
{
	ROM_UARTCharPut(UART0_BASE, c);
}


char uart_read()
{
    return	ROM_UARTCharGet(UART0_BASE)&0xff;
}

void uart_init()
{
	ROM_SysCtlPeripheralEnable(SYSCTL_PERIPH_UART0);
	ROM_SysCtlPeripheralEnable(SYSCTL_PERIPH_GPIOA);

	/*
	ROM_GPIOPinConfigure(GPIO_PA0_U0RX);
	ROM_GPIOPinConfigure(GPIO_PA1_U0TX);
	*/

	/*
	ROM_GPIOPinConfigure(GPIO_PA0);
	ROM_GPIOPinConfigure(GPIO_PA1);
	*/

	ROM_GPIOPinTypeUART(GPIO_PORTA_BASE, GPIO_PIN_0 | GPIO_PIN_1);

	ROM_UARTConfigSetExpClk(UART0_BASE, ROM_SysCtlClockGet(), UART_BAUD_RATE,
                            (UART_CONFIG_WLEN_8 | UART_CONFIG_STOP_ONE |
                             UART_CONFIG_PAR_NONE));  
}