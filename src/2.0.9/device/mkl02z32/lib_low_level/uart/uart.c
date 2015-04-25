#include "uart.h"


struct sUart
{
    volatile u32  rx_char, rx_state;
};  

volatile struct sUart __uart__;

void UART0_IRQHandler()
{
	if (__uart__.rx_state == 0)
    {
        __uart__.rx_char = UART0->D;
        __uart__.rx_state = 1;
    }
}


void uart_write(char c)
{
	UART0->D = c;

	while ((UART0->S1&UART0_S1_TC_MASK) == 0)
		__asm("nop");
}


char uart_read()
{
    //UART0_C2|= UART_C2_RIE_MASK;

    /* Wait until character has been received */
    while (__uart__.rx_state == 0)
        __asm("nop");

    volatile u32 res = __uart__.rx_char;
    __uart__.rx_state = 0;

    return res;
}


#define TX_PIN	(1)
#define RX_PIN	(2)

void uart_init()
{
	__uart__.rx_state = 0;
	__uart__.rx_char = 0;

    // Select "Alt 2" usage to enable UART0 on pins
    PORTB->PCR[TX_PIN] = PORT_PCR_MUX(2);
    PORTB->PCR[RX_PIN] = PORT_PCR_MUX(2);



	SIM->SCGC4|= SIM_SCGC4_UART0_MASK;  

	SIM->SOPT2&= ~SIM_SOPT2_UART0SRC_MASK;
	#if CLOCK_SETUP==2
	SIM->SOPT2|= SIM_SOPT2_UART0SRC(3);		/*uart in low power mode - 9600Bd */
	#else
	SIM->SOPT2|= SIM_SOPT2_UART0SRC(1);		/*normal uart mode, 115200Bd */
	#endif


	/*48MHz/((UART0->C4+1)*BAUD_RATE)*/
	UART0->BDH = 0;
	UART0->BDL = 46;

	UART0->C1 = 0;
	//UART0->C2 = UART0_C2_RE_MASK | UART0_C2_TE_MASK;
	//UART0->C2 = UART0_C2_TE_MASK;
	UART0->C3 = 0;
	UART0->C4 = 8;	//4X OVERSAMPLING
	UART0->C5 = 0;

	    // Enable the transmitter, receiver, and receive interrupts
    UART0->C2|= UART0_C2_RE_MASK | UART0_C2_TE_MASK | UART0_C2_RIE_MASK;
    

   	NVIC_ClearPendingIRQ(UART0_IRQn);
	NVIC_EnableIRQ(UART0_IRQn);

}