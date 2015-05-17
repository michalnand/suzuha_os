#include "uart.h"

void uart_write(char c)
{
	if (!(UART1->UART_SR & UART_SR_TXRDY))
		return 1;

	UART1->UART_THR = c;

}


char uart_read()
{
	char res = 0;

	while ((p_uart->UART_SR & UART_SR_RXRDY) == 0)
		__asm("nop");


	res = (uint8_t) p_uart->UART_RHR;
	
  	return res;
}

void uart_init()
{
	PMC->PMC_PCER0 = (1 << ID_UART0); 

	PIOA->PIO_ABCDSR[0] &= ~(UTXD|URXD); 
	PIOA->PIO_ABCDSR[1] &= ~(UTXD|URXD); 
	PIOA->PIO_PDR = UTXD | URXD; 


		uint32_t cd = 0;

	/* Reset and disable receiver & transmitter */
	p_uart->UART_CR = UART_CR_RSTRX | UART_CR_RSTTX
			| UART_CR_RXDIS | UART_CR_TXDIS;

	/* Check and configure baudrate */
	/* Asynchronous, no oversampling */
	cd = (p_uart_opt->ul_mck / p_uart_opt->ul_baudrate) / UART_MCK_DIV;
	if (cd < UART_MCK_DIV_MIN_FACTOR || cd > UART_MCK_DIV_MAX_FACTOR)
		return 1;

	p_uart->UART_BRGR = cd;
	/* Configure mode */
	p_uart->UART_MR = p_uart_opt->ul_mode;

	/* Disable PDC channel */
	p_uart->UART_PTCR = UART_PTCR_RXTDIS | UART_PTCR_TXTDIS;

	/* Enable receiver and transmitter */
	p_uart->UART_CR = UART_CR_RXEN | UART_CR_TXEN;

}
