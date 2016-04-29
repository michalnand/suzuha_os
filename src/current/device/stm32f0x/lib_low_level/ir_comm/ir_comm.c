#include "ir_comm.h"

#ifdef IR_COMM_TRANSMITER
volatile u16 ir_comm_tx_byte;
volatile u8 ir_comm_tx_byte_cnt;
volatile u8 ir_comm_tx_state;
volatile u8 ir_comm_tx_ptr;
#endif

#ifdef IR_COMM_RECEIVER
volatile u16 ir_comm_rx_byte;
volatile u8 ir_comm_rx_byte_cnt;
volatile u8 ir_comm_rx_state;
volatile u8 ir_comm_rx_ptr;
volatile u32 ir_comm_rx_deadline_counter;
#endif

u32 _ir_comm_rx_signal_strength;
u32 _ir_comm_adc_received_level;
u32 _ir_comm_adc_received_level_cnt;

#ifdef IR_COMM_TRANSMITER
u8 tx_buffer[IR_COMM_BUFFER_SIZE];
#endif

#ifdef IR_COMM_RECEIVER
u8 rx_buffer[IR_COMM_BUFFER_SIZE];
#endif

#ifdef IR_COMM_TRANSMITER
u8 *get_tx_buffer()
{
  return tx_buffer;
}
#endif


#ifdef IR_COMM_RECEIVER
u8 *get_rx_buffer()
{
  return rx_buffer;
}
#endif


void ir_comm_init()
{
    ir_comm_rx_deadline_counter = 0;

  _ir_comm_rx_signal_strength = 0;
  _ir_comm_adc_received_level = 0;
  _ir_comm_adc_received_level_cnt = 0;

  GPIO_InitTypeDef        GPIO_InitStructure;
  u32 i;

  #ifdef IR_COMM_TRANSMITER
  ir_comm_tx_byte = 0;
  ir_comm_tx_byte_cnt = 0;
  ir_comm_tx_state = 0;
  ir_comm_tx_ptr = 0;

  for (i = 0; i < IR_COMM_BUFFER_SIZE; i++)
    tx_buffer[i] = 0;

  GPIO_InitStructure.GPIO_Pin = IR_COMM_TX;
  GPIO_InitStructure.GPIO_Mode = GPIO_Mode_OUT;
  GPIO_InitStructure.GPIO_OType = GPIO_OType_PP;
  GPIO_InitStructure.GPIO_Speed = GPIO_Speed_50MHz;
  GPIO_InitStructure.GPIO_PuPd = GPIO_PuPd_NOPULL;
  GPIO_Init(IR_COMM_TX_GPIO, &GPIO_InitStructure);

  IR_COM_TX_RESET();
  #endif


  #ifdef IR_COMM_RECEIVER
  ir_comm_rx_byte = 0;
  ir_comm_rx_byte_cnt = 0;
  ir_comm_rx_state = 0;
  ir_comm_rx_ptr = 0;

  for (i = 0; i < IR_COMM_BUFFER_SIZE; i++)
    rx_buffer[i] = 0;


  GPIO_InitStructure.GPIO_Pin = IR_COMM_RX;
  GPIO_InitStructure.GPIO_Mode = GPIO_Mode_AN;
  GPIO_InitStructure.GPIO_PuPd = GPIO_PuPd_NOPULL;
  GPIO_Init(IR_COMM_RX_GPIO, &GPIO_InitStructure);


  adc_config_ch(IR_COMM_RX_ADC_CH);
  #endif

  RCC_APB1PeriphClockCmd(RCC_APB1Periph_TIM14, ENABLE);

	TIM_TimeBaseInitTypeDef timerInitStructure;
	timerInitStructure.TIM_Prescaler = 48;
	timerInitStructure.TIM_CounterMode = TIM_CounterMode_Up;

  //timerInitStructure.TIM_Period = 833;  //600Bd
  timerInitStructure.TIM_Period = 416;  //1200Bd;
	//timerInitStructure.TIM_Period = 208;  //2400Bd

	timerInitStructure.TIM_ClockDivision = TIM_CKD_DIV1;
	timerInitStructure.TIM_RepetitionCounter = 0;
	TIM_TimeBaseInit(TIM14, &timerInitStructure);
	TIM_Cmd(TIM14, ENABLE);

	TIM_ITConfig(TIM14, TIM_IT_CC1, ENABLE);

	NVIC_InitTypeDef nvicStructure;
	nvicStructure.NVIC_IRQChannel = TIM14_IRQn;
	nvicStructure.NVIC_IRQChannelPriority = 4;
	nvicStructure.NVIC_IRQChannelCmd = ENABLE;
	NVIC_Init(&nvicStructure);
}


#ifdef IR_COMM_TRANSMITER

//start transmission
void ir_comm_start_tx()
{
  ir_comm_tx_ptr = 0;
  ir_comm_tx_state = 1;
}

u8 ir_comm_get_tx_flag()
{
  if (ir_comm_tx_state == 0)
    return 0;

  return ir_comm_tx_state;
}

#endif


#ifdef IR_COMM_RECEIVER

void ir_comm_start_rx()
{
  ir_comm_rx_ptr = 0;
  ir_comm_rx_state = 1;
}

u8 ir_comm_get_rx_flag()
{
  if (ir_comm_rx_state == 0)
    return 0;

  return ir_comm_rx_state;
}

#endif

u16 ir_comm_received_signal_strength()
{
  return _ir_comm_rx_signal_strength;
}


void TIM14_IRQHandler()
{
  #ifdef IR_COMM_TRANSMITER

  switch (ir_comm_tx_state)
  {
    case 0:
            IR_COM_TX_RESET();

            ir_comm_tx_ptr = 0;           //wait for start
            break;

    case 1:
            if (ir_comm_tx_ptr >= IR_COMM_BUFFER_SIZE)
            {
              ir_comm_tx_state = 0;
            }
            else
            {
              ir_comm_tx_byte = (((~tx_buffer[ir_comm_tx_ptr])&0xff)<<1)|0x01;
              ir_comm_tx_ptr++;
              ir_comm_tx_byte_cnt = 0;
              ir_comm_tx_state = 2;
            }
            break;

    case 2:
            if (ir_comm_tx_byte&(1<<0))
            {
              IR_COM_TX_SET();
            }
            else
            {
              IR_COM_TX_RESET();
            }

            ir_comm_tx_byte>>=1;
            ir_comm_tx_state = 3;
            break;

    case 3:
            ir_comm_tx_byte_cnt++;
            if (ir_comm_tx_byte_cnt > 9)
            {
              ir_comm_tx_state = 1;
            }
            else
            {
              ir_comm_tx_state = 2;
            }
            break;
  }


  #endif

  #ifdef IR_COMM_RECEIVER

//  u8 rx_input = IR_COMM_RX_GPIO->IDR&IR_COMM_RX;

  u8 rx_input = 1;

  u32 adc_res = ADC1->DR;


  ADC1->ISR = (u32)ADC_FLAG_EOC;
  ADC1->CR |= (uint32_t)ADC_CR_ADSTART;

  /*
  i32 dif = (ir_comm_adc_level>>6) - adc_res;

  if (dif > 300)
    rx_input = 0;
  */

  if (adc_res < 1000)
  {
      rx_input = 0;
      _ir_comm_adc_received_level+= 4096 - adc_res;
      _ir_comm_adc_received_level_cnt++;
  }


  switch (ir_comm_rx_state)
  {
    case 0:
            ir_comm_rx_ptr = 0;       //wait for bytes

            break;

    case 1:
            if (ir_comm_rx_ptr >= IR_COMM_BUFFER_SIZE)
            {
              ir_comm_rx_state = 0;
            }
            else
            {
              ir_comm_rx_byte = 0;
              ir_comm_rx_byte_cnt = 0;
              ir_comm_rx_state = 2;
            }
            break;

    case 2:
            if (rx_input == 0)       //wait for start bit
            {
              ir_comm_rx_state = 3;
              ir_comm_rx_deadline_counter = 0;
            }
            else
            {
              ir_comm_rx_deadline_counter++;
              if (ir_comm_rx_deadline_counter > (30*IR_COMM_BUFFER_SIZE))
                {
                  ir_comm_rx_deadline_counter = 0;
                  ir_comm_rx_ptr = 0;
                  ir_comm_rx_state = 1;

                  if (_ir_comm_adc_received_level_cnt != 0)
                    _ir_comm_rx_signal_strength = _ir_comm_adc_received_level/_ir_comm_adc_received_level_cnt;
                  else
                    _ir_comm_rx_signal_strength = 0;

                  _ir_comm_adc_received_level = 0;
                  _ir_comm_adc_received_level_cnt = 0;
                }
            }
            break;

    case 3:
            ir_comm_rx_state = 4;
            break;

    case 4:
            if (rx_input != 0)
              ir_comm_rx_byte|= (1<<ir_comm_rx_byte_cnt);
            ir_comm_rx_byte_cnt++;

            if (ir_comm_rx_byte_cnt >= 8)
            {
              rx_buffer[ir_comm_rx_ptr] = (ir_comm_rx_byte)&0xff; //((~ir_comm_rx_byte>>1)&0xff);
              ir_comm_rx_ptr++;
              ir_comm_rx_state = 1;
            }
            else
              ir_comm_rx_state = 3;

            break;
  }


  #endif


  TIM14->SR = 0;
}
