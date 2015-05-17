#include "gpio.h"

void gpio_init()
{
  SIM_BASE_PTR->SCGC5 |= SIM_SCGC5_PORTA_MASK;
  SIM_BASE_PTR->SCGC5 |= SIM_SCGC5_PORTB_MASK;
  SIM_BASE_PTR->SCGC5 |= SIM_SCGC5_PORTC_MASK;
  SIM_BASE_PTR->SCGC5 |= SIM_SCGC5_PORTD_MASK;
  SIM_BASE_PTR->SCGC5 |= SIM_SCGC5_PORTE_MASK;


  PORTB_BASE_PTR->PCR[LED_1] = PORT_PCR_MUX(1);
  PORTB_BASE_PTR->PCR[LED_2] = PORT_PCR_MUX(1); 
  PORTB_BASE_PTR->PCR[LED_3] = PORT_PCR_MUX(1);

  PORTB_BASE_PTR->PCR[KEY_USER_1] = PORT_PCR_MUX(1);
  PORTB_BASE_PTR->PCR[KEY_USER_2] = PORT_PCR_MUX(1);

    

  PTB_BASE_PTR->PDDR |= 1 << LED_1;
  PTB_BASE_PTR->PDDR |= 1 << LED_2;
  PTB_BASE_PTR->PDDR |= 1 << LED_3;

  PTB_BASE_PTR->PDDR &= ~(1<<KEY_USER_1);
  PTB_BASE_PTR->PDDR &= ~(1<<KEY_USER_2);

  led_off(LED_1);
  led_off(LED_2);
  led_off(LED_3);
}

void led_on(u32 led)
{
  PTB_BASE_PTR->PSOR = 1 << led;  /* led on */
}

void led_off(u32 led)
{
  PTB_BASE_PTR->PCOR = 1 << led;  /* led off */
}

u32 get_key()
{
  return (~PTB_BASE_PTR->PDIR)&((1<<KEY_USER_1)|(1<<KEY_USER_2));
}