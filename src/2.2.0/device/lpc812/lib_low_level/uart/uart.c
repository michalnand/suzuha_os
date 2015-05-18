#include "uart.h"

volatile u8 g_uart_rx_char, g_uart_rx_flag;

void uart_write(char c)
{ 
	/* wait for transmitter to be ready with timeout */
	while ((USART0_STAT & (1<<2))==0)
		__asm("nop");

	USART0_TXDAT = c;
}

 
char uart_read()
{
	while (g_uart_rx_flag == 0)
		__asm("nop");

	char res = g_uart_rx_char;

	g_uart_rx_flag = 0;

	return res;
}


void UART0_Handler(void)
{	
	if (USART0_INTSTAT & (1<<0))
	{
		g_uart_rx_char = USART0_RXDAT;
		g_uart_rx_flag = 1;
	}
}

void uart_init()
{
	g_uart_rx_char = 0;
	g_uart_rx_flag = 0;


SYSCON_PRESETCTRL &= ~BIT3;   // put uart in reset 
	// initialize the receive buffer
	//RXBuffer.count = RXBuffer.head = RXBuffer.tail = 0;		
	SYSCON_SYSAHBCLKCTRL |= BIT14; // enable USART0 clock
	SYSCON_PRESETCTRL |= BIT3;   // take uart out of reset
	NVIC_ISER0 |= BIT3;  // Enable USART0 IRQ's in NVIC
	// Remap the IO pins for USART0
	// Want RXD on pin8 and TXD on Pin 2 to match the
	// ISP setup.
	PINENABLE0 |= BIT0;	// Ensure special function on pin 8 is disabled
	// Pin doesn't appear to have a default "special" function
	PINASSIGN0 &= 0xffff0000;
	PINASSIGN0 |= 6; // Map TXD to PIO0_4
	PINASSIGN0 &= 0xffff00ff;
	PINASSIGN0 |= 1<<8; // Map RXD to PIO0_0
		
	// Baud rate generation: fixed baud rate of 9600
	// Assuming 12MHz base clock.	
	SYSCON_UARTCLKDIV = 1;
	//SYSCON_UARTFRGDIV = 0;
	//SYSCON_UARTFRGMULT = 0;
	// rx data signal is sampled 16 times faster than baud rate
	// so need to "scale up" by factor of 16 when calculating
	// baud rate
	// USART0_BRG = 78;//(12000000) / (9600*16);

	USART0_BRG = CORE_CLOCK/(BAUD_RATE*(u32)16);
	//SYSCON_UARTFRGDIV=0x;
	//SYSCON_UARTFRGMULT=0x;

	USART0_INTENSET = BIT0; // Enable RX interrupts
	USART0_CTL = 0;
	// Config USART : 8 bit data, 1 stop, no parity.  Enable
	USART0_CFG |= BIT2+BIT9+BIT0;
	
	/*
	SYSCON_PRESETCTRL &= ~BIT3;   // put uart in reset 
	// initialize the receive buffer
	//RXBuffer.count = RXBuffer.head = RXBuffer.tail = 0;		
	SYSCON_SYSAHBCLKCTRL |= BIT14; // enable USART0 clock
	SYSCON_PRESETCTRL |= BIT3;   // take uart out of reset
	
	NVIC_ISER0 |= BIT3;  // Enable USART0 IRQ's in NVIC
	// Remap the IO pins for USART0
	// Want RXD on pin8 and TXD on Pin 2 to match the
	// ISP setup.
	PINENABLE0 |= BIT0;	// Ensure special function on pin 8 is disabled
	// Pin doesn't appear to have a default "special" function
	PINASSIGN0 &= 0xffff0000;
	PINASSIGN0 |= 4; // Map TXD to PIO0_4
	//PINASSIGN0 &= 0xffff00ff;
	//PINASSIGN0 |= 0; // Map RXD to PIO0_0
		
	// Baud rate generation: fixed baud rate of 9600
	// Assuming 12MHz base clock.	
	SYSCON_UARTCLKDIV = 1;
	//SYSCON_UARTFRGDIV = 0;
	//SYSCON_UARTFRGMULT = 0;
	// rx data signal is sampled 16 times faster than baud rate
	// so need to "scale up" by factor of 16 when calculating
	// baud rate
	// USART0_BRG = 78;//(12000000) / (9600*16);

	USART0_BRG = CORE_CLOCK/(BAUD_RATE*(u32)16);

	USART0_INTENSET = BIT0; // Enable RX interrupts
	USART0_CTL = 0;
	// Config USART : 8 bit data, 1 stop, no parity.  Enable
	USART0_CFG |= BIT2+BIT9+BIT0;
	*/
}