#include "gpio.h"
#include "../std_periph/std_periph.h"

void gpio_init()
{
  GPIO_InitTypeDef        GPIO_InitStructure;

  RCC_AHBPeriphClockCmd(RCC_AHBPeriph_GPIOA, ENABLE);
  RCC_AHBPeriphClockCmd(RCC_AHBPeriph_GPIOB, ENABLE);

  GPIO_InitStructure.GPIO_Pin = LED_1;
  GPIO_InitStructure.GPIO_Mode = GPIO_Mode_OUT;
  GPIO_InitStructure.GPIO_OType = GPIO_OType_PP;
  GPIO_InitStructure.GPIO_Speed = GPIO_Speed_50MHz;
  GPIO_InitStructure.GPIO_PuPd = GPIO_PuPd_NOPULL;
  GPIO_Init(GPIO_BASE, &GPIO_InitStructure);


  GPIO_InitStructure.GPIO_Pin = LED_R;
  GPIO_InitStructure.GPIO_Mode = GPIO_Mode_OUT;
  GPIO_InitStructure.GPIO_OType = GPIO_OType_PP;
  GPIO_InitStructure.GPIO_Speed = GPIO_Speed_50MHz;
  GPIO_InitStructure.GPIO_PuPd = GPIO_PuPd_NOPULL;
  GPIO_Init(LED_R_GPIO, &GPIO_InitStructure);

  GPIO_InitStructure.GPIO_Pin = LED_G;
  GPIO_InitStructure.GPIO_Mode = GPIO_Mode_OUT;
  GPIO_InitStructure.GPIO_OType = GPIO_OType_PP;
  GPIO_InitStructure.GPIO_Speed = GPIO_Speed_50MHz;
  GPIO_InitStructure.GPIO_PuPd = GPIO_PuPd_NOPULL;
  GPIO_Init(LED_G_GPIO, &GPIO_InitStructure);

  GPIO_InitStructure.GPIO_Pin = LED_B;
  GPIO_InitStructure.GPIO_Mode = GPIO_Mode_OUT;
  GPIO_InitStructure.GPIO_OType = GPIO_OType_PP;
  GPIO_InitStructure.GPIO_Speed = GPIO_Speed_50MHz;
  GPIO_InitStructure.GPIO_PuPd = GPIO_PuPd_NOPULL;
  GPIO_Init(LED_B_GPIO, &GPIO_InitStructure);

  led_off(LED_1);

  led_off(LED_R);
  led_off(LED_G);
  led_off(LED_B);


} 

void led_on(u32 led)
{
  if (led == LED_1)
    GPIO_BASE->BSRR = LED_1;

  if (led == LED_R)
    LED_R_GPIO->BSRR = LED_R;

  if (led == LED_G)
    LED_G_GPIO->BSRR = LED_G;

  if (led == LED_B)
    LED_B_GPIO->BSRR = LED_B;
}

void led_off(u32 led)
{
  if (led == LED_1)
    GPIO_BASE->BRR = LED_1;

  if (led == LED_R)
    LED_R_GPIO->BRR = LED_R;

  if (led == LED_G)
    LED_G_GPIO->BRR = LED_G;

  if (led == LED_B)
    LED_B_GPIO->BRR = LED_B;
}

u32 get_key()
{
 return 0;
}
