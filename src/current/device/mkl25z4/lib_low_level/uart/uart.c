#include "uart.h"

struct sUart
{
    volatile u32  rx_char, rx_state;
};  

volatile struct sUart __uart__;

void UART0_IRQHandler()
{
    // (UART0_S1 & UART_S1_RDRF_MASK) &&    /*fuck them all for fuc*ing datashit*/
    if (__uart__.rx_state == 0)
    {
        __uart__.rx_char = UART0_D;
        __uart__.rx_state = 1;
    }
}



void uart_write(char c)
{
    while(!(UART0_S1 & UARTLP_S1_TDRE_MASK ))
        __asm("nop");

    UART0_D = c;

    u32 loops = 4200; 
    while (loops--)
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

void uart_init()
{
    __uart__.rx_state = 0;
    __uart__.rx_char = 0;


    SIM_SCGC5 |= SIM_SCGC5_PORTA_MASK;
    // Select "Alt 2" usage to enable UART0 on pins
    PORTA_PCR1 = PORT_PCR_MUX(2);
    PORTA_PCR2 = PORT_PCR_MUX(2);



    // Turn on clock to UART0 module and select 48MHz clock (FLL/PLL source)
    SIM_SCGC4 |= SIM_SCGC4_UART0_MASK;
    SIM_SOPT2 &= ~SIM_SOPT2_UART0SRC_MASK;
    SIM_SOPT2 |= SIM_SOPT2_UART0SRC(1);                 // FLL/PLL source


    
    UART0_C2 = 0;
    UART0_C1 = 0;
    UART0_C3 = 0;
    UART0_S2 = 0;     

    // Set the baud rate divisor
    #define OVER_SAMPLE 16

    uint32_t divisor =  (CORE_CLOCK / OVER_SAMPLE) / UART_BAUD_RATE;

    UART0_C4 = UARTLP_C4_OSR(OVER_SAMPLE - 1);
    UART0_BDH = ((divisor >> 8) & UARTLP_BDH_SBR_MASK);
    UART0_BDL = (divisor & UARTLP_BDL_SBR_MASK);


    // Enable the transmitter, receiver, and receive interrupts
    UART0_C2|= UARTLP_C2_RE_MASK | UARTLP_C2_TE_MASK | UART_C2_RIE_MASK;

    enable_irq(INT_UART0);
}