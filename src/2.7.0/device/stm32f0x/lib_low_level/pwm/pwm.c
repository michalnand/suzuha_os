#include "pwm.h"


#define PWM_CH_0_GPIO	GPIOA
#define PWM_CH_0		((u32)(1<<8))

#define PWM_CH_1_GPIO	GPIOA
#define PWM_CH_1		((u32)(1<<11))

#define PWM_CH_2_GPIO	GPIOA
#define PWM_CH_2		((u32)(1<<1))

#define PWM_CH_COUNT 3

void pwm_init()
{
	u32 i;
	for (i = 0; i < PWM_CH_COUNT; i++)
	{
		g_pwm.pwm_cnt[i] = 0;
		g_pwm.pwm_ch[i] = 0;
	}

	g_pwm.cnt = 0;

	RCC_APB2PeriphClockCmd(RCC_APB2Periph_TIM16, ENABLE);

	TIM_TimeBaseInitTypeDef timerInitStructure;
	timerInitStructure.TIM_Prescaler = 8;
	timerInitStructure.TIM_CounterMode = TIM_CounterMode_Up;
	timerInitStructure.TIM_Period = 1000;
	timerInitStructure.TIM_ClockDivision = TIM_CKD_DIV1;
	timerInitStructure.TIM_RepetitionCounter = 0;
	TIM_TimeBaseInit(TIM16, &timerInitStructure);
	TIM_Cmd(TIM16, ENABLE);

	TIM_ITConfig(TIM16, TIM_IT_CC1, ENABLE);

	NVIC_InitTypeDef nvicStructure;
	nvicStructure.NVIC_IRQChannel = TIM16_IRQn;
	nvicStructure.NVIC_IRQChannelPriority = 1;
	nvicStructure.NVIC_IRQChannelCmd = ENABLE;
	NVIC_Init(&nvicStructure);
}


void TIM16_IRQHandler()
{
	if (g_pwm.pwm_cnt[0] <= g_pwm.cnt)
		PWM_CH_0_GPIO->BRR = PWM_CH_0;
	else
		if (g_pwm.cnt == 0)
		{
			PWM_CH_0_GPIO->BSRR = PWM_CH_0;
		}

	if (g_pwm.pwm_cnt[1] <= g_pwm.cnt)
		PWM_CH_1_GPIO->BRR = PWM_CH_1;
	else
		if (g_pwm.cnt == 0)
		{
			PWM_CH_1_GPIO->BSRR = PWM_CH_1;
		}

	if (g_pwm.pwm_cnt[2] <= g_pwm.cnt)
		PWM_CH_2_GPIO->BRR = PWM_CH_2;
	else
		if (g_pwm.cnt == 0)
		{
			PWM_CH_2_GPIO->BSRR = PWM_CH_2;
		}

	if (g_pwm.cnt == 0)
	{
		g_pwm.pwm_cnt[0] = g_pwm.pwm_ch[0];
		g_pwm.pwm_cnt[1] = g_pwm.pwm_ch[1];
		g_pwm.pwm_cnt[2] = g_pwm.pwm_ch[2];
	}


	g_pwm.cnt++;
	if (g_pwm.cnt > PWM_MAX)
		g_pwm.cnt = 0;

	TIM16->SR = 0;
}
