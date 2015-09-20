#include "pwm.h"

#define PWM_BASE_CLOCK  SystemCoreClock
//#define PWM_FREQUENCY   4096
#define PWM_FREQUENCY   10000
#define PWM_PERIOD      ((SystemCoreClock/PWM_FREQUENCY) - 1)


void pwm_init()
{
    RCC_APB1PeriphClockCmd(RCC_APB1Periph_TIM5, ENABLE);
   	RCC_AHB1PeriphClockCmd(RCC_AHB1Periph_GPIOA, ENABLE);


    GPIO_InitTypeDef GPIO_InitStructure;


    GPIO_InitStructure.GPIO_Pin = GPIO_Pin_0|GPIO_Pin_1;

    GPIO_InitStructure.GPIO_Mode = GPIO_Mode_AF;
    GPIO_InitStructure.GPIO_Speed = GPIO_Speed_50MHz;

    GPIO_Init(GPIOA, &GPIO_InitStructure);


    GPIO_PinAFConfig(GPIOA, GPIO_PinSource0, GPIO_AF_TIM5);
    GPIO_PinAFConfig(GPIOA, GPIO_PinSource1, GPIO_AF_TIM5);

    /* TIM1 Full remapping pins */
  // GPIO_PinRemapConfig(GPIO_FullRemap_TIM5, ENABLE);

    TIM_TimeBaseInitTypeDef  TIM_TimeBaseStructure;


  /* Time Base configuration */
  TIM_TimeBaseStructure.TIM_Prescaler = 0;
  TIM_TimeBaseStructure.TIM_CounterMode = TIM_CounterMode_Up;
  TIM_TimeBaseStructure.TIM_Period = PWM_PERIOD;
  TIM_TimeBaseStructure.TIM_ClockDivision = 0;
  TIM_TimeBaseStructure.TIM_RepetitionCounter = 0;

  TIM_TimeBaseInit(TIM5, &TIM_TimeBaseStructure);


  pwm_set(50, 30);

  /* TIM1 counter enable */
  TIM_Cmd(TIM5, ENABLE);

  /* TIM1 Main Output Enable */
  TIM_CtrlPWMOutputs(TIM5, ENABLE);



  GPIO_InitStructure.GPIO_Pin = (1<<2)|(1<<3);
  GPIO_InitStructure.GPIO_Mode = GPIO_Mode_OUT;
  GPIO_InitStructure.GPIO_OType = GPIO_OType_PP;
  GPIO_InitStructure.GPIO_Speed = GPIO_Speed_100MHz;
  GPIO_InitStructure.GPIO_PuPd = GPIO_PuPd_NOPULL;

  GPIO_Init(GPIOC, &GPIO_InitStructure);
  GPIO_SetBits(GPIOC, (1<<2)|(1<<3));

}

void pwm_set(u32 ch1, u32 ch2)
{
    TIM_OCInitTypeDef  TIM_OCInitStructure;


    TIM_OCInitStructure.TIM_OCMode = TIM_OCMode_PWM2;
    TIM_OCInitStructure.TIM_OutputState = TIM_OutputState_Enable;
    TIM_OCInitStructure.TIM_OutputNState = TIM_OutputNState_Enable;
    TIM_OCInitStructure.TIM_Pulse = 0;
    TIM_OCInitStructure.TIM_OCPolarity = TIM_OCPolarity_Low;
    TIM_OCInitStructure.TIM_OCNPolarity = TIM_OCNPolarity_High;
    TIM_OCInitStructure.TIM_OCIdleState = TIM_OCIdleState_Set;
    TIM_OCInitStructure.TIM_OCNIdleState = TIM_OCIdleState_Reset;


    TIM_OCInitStructure.TIM_Pulse = (ch1*(PWM_PERIOD-1))/100;
    TIM_OC1Init(TIM5, &TIM_OCInitStructure);

    TIM_OCInitStructure.TIM_Pulse = (ch2*(PWM_PERIOD-1))/100;
    TIM_OC2Init(TIM5, &TIM_OCInitStructure);
}
