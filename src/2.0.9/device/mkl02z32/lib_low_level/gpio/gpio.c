#include "gpio.h"

void gpio_init()
{
  SIM->SCGC5 = SIM_SCGC5_PORTB_MASK | SIM_SCGC5_PORTA_MASK;
  
  PORTB->PCR[LED_R] = PORT_PCR_MUX(1);
  PORTB->PCR[LED_G] = PORT_PCR_MUX(1);
  PORTB->PCR[LED_B] = PORT_PCR_MUX(1);

  PTB->PDDR = (1 << LED_R) | (1 << LED_G) | (1 << LED_B);

  led_off(LED_R);
  led_off(LED_G);
  led_off(LED_B);
}

void led_on(u32 led)
{
  PTB->PCOR = (1<<led);
}

void led_off(u32 led)
{
  PTB->PSOR = (1<<led);
}

u32 get_key()
{
	return 0;
}
