#include "gpio.h"

 
void gpio_init()
{
  ROM_SysCtlPeripheralEnable(SYSCTL_PERIPH_GPIOA);
  ROM_SysCtlPeripheralEnable(SYSCTL_PERIPH_GPIOB);
  ROM_SysCtlPeripheralEnable(SYSCTL_PERIPH_GPIOC);
  ROM_SysCtlPeripheralEnable(SYSCTL_PERIPH_GPIOD);
  ROM_SysCtlPeripheralEnable(SYSCTL_PERIPH_GPIOE);
  ROM_SysCtlPeripheralEnable(SYSCTL_PERIPH_GPIOF);
  
	ROM_GPIOPinTypeGPIOOutput(GPIO_PORTF_BASE, GPIO_PIN_1|GPIO_PIN_2|GPIO_PIN_3);
  

  ROM_GPIOPinTypeGPIOInput(GPIO_PORTF_BASE, KEY_1|KEY_2);
  ROM_GPIOPadConfigSet(GPIO_PORTF_BASE, KEY_1, GPIO_STRENGTH_2MA, GPIO_PIN_TYPE_STD_WPU);
  ROM_GPIOPadConfigSet(GPIO_PORTF_BASE, KEY_2, GPIO_STRENGTH_2MA, GPIO_PIN_TYPE_STD_WPU);
       
 	led_off(LED_1|LED_2|LED_3); 
}  

/*turn on selected leds*/
void led_on(u32 led)
{
  if (led&LED_1)
    ROM_GPIOPinWrite(GPIO_PORTF_BASE, GPIO_PIN_1, GPIO_PIN_1);	

  if (led&LED_2)
    ROM_GPIOPinWrite(GPIO_PORTF_BASE, GPIO_PIN_3, GPIO_PIN_3);

  if (led&LED_3)
    ROM_GPIOPinWrite(GPIO_PORTF_BASE, GPIO_PIN_2, GPIO_PIN_2);
}

/*turn off selected leds*/
void led_off(u32 led)
{
  if (led&LED_1)
    ROM_GPIOPinWrite(GPIO_PORTF_BASE, GPIO_PIN_1, 0);	

  if (led&LED_2)
    ROM_GPIOPinWrite(GPIO_PORTF_BASE, GPIO_PIN_3, 0);

  if (led&LED_3)
    ROM_GPIOPinWrite(GPIO_PORTF_BASE, GPIO_PIN_2, 0);
}

/*return bitmask with pressed keys*/
u32 get_key()
{
  return (~GPIOPinRead(GPIO_PORTF_BASE, KEY_1)&KEY_1) | (~GPIOPinRead(GPIO_PORTF_BASE, KEY_2)&KEY_2);
}