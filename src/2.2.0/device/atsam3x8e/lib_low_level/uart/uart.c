#include "uart.h"

void uart_write(char c)
{
	while (!(UART->UART_SR & UART_SR_TXRDY))
		__asm("nop");

	UART->UART_THR = c;
}
 

char uart_read()
{
	char res;

	 // Check if the receiver is ready
    while ((UART->UART_SR & UART_SR_RXRDY) == 0)
    	__asm("nop");
 
    // Read the character
    res = UART->UART_RHR;  

  	return res;
}

void uart_init()
{
	u32 ul_sr;
 
    // ==> Pin configuration
    // Disable interrupts on Rx and Tx
    PIOA->PIO_IDR = PIO_PA8A_URXD | PIO_PA9A_UTXD;
 
    // Read current peripheral AB select register and set the Rx and Tx pins to 0 (Peripheral A function)
    ul_sr = PIOA->PIO_ABSR;
    PIOA->PIO_ABSR &= ~(PIO_PA8A_URXD | PIO_PA9A_UTXD) & ul_sr;
 
    // Disable the PIO of the Rx and Tx pins so that the peripheral controller can use them
    PIOA->PIO_PDR = PIO_PA8A_URXD | PIO_PA9A_UTXD;
 
    // Enable the pull up on the Rx and Tx pin
    PIOA->PIO_PUER = PIO_PA8A_URXD | PIO_PA9A_UTXD;
 
    
    // ==> Actual uart configuration
    // Enable the peripheral uart controller
    PMC->PMC_PCER0 = 1 << ID_UART;
 
    // Reset and disable receiver & transmitter
    UART->UART_CR = UART_CR_RSTRX | UART_CR_RSTTX | UART_CR_RXDIS | UART_CR_TXDIS;
 
    // Set the baudrate to 115200
    UART->UART_BRGR = 84000000/(16*UART_BAUD_RATE);

    //45; // 84000000 / 16 * x = BaudRate (write x into UART_BRGR)
 
    // No Parity
    UART->UART_MR = UART_MR_PAR_NO;
 
    // Disable PDC channel requests
    UART->UART_PTCR = UART_PTCR_RXTDIS | UART_PTCR_TXTDIS;
 
    // Disable / Enable interrupts on end of receive

    /*
    UART->UART_IDR = 0xFFFFFFFF;
    NVIC_EnableIRQ((IRQn_Type) ID_UART);
    UART->UART_IER = UART_IER_RXRDY;
    */

    // Enable receiver and transmitter
    UART->UART_CR = UART_CR_RXEN | UART_CR_TXEN;
}
