#ifndef _IR_COMM_H_
#define _IR_COMM_H_

#include "../lib_low_level.h"

// #define IR_COMM_DEBUG
#define IR_COMM_TRANSMITER
#define IR_COMM_RECEIVER

#define IR_COMM_TX_GPIO         GPIOA
#define IR_COMM_TX              (1<<8)

#define IR_COM_TX_SET()         IR_COMM_TX_GPIO->BSRR = IR_COMM_TX
#define IR_COM_TX_RESET()       IR_COMM_TX_GPIO->BRR = IR_COMM_TX

#define IR_COMM_RX_GPIO         GPIOA
#define IR_COMM_RX              (1<<0)
#define IR_COMM_RX_ADC_CH       ADC_Channel_0

#define IR_COMM_BUFFER_SIZE     (u32)(6+8)



u8 *get_tx_buffer();
u8 *get_rx_buffer();

void ir_comm_init();



void ir_comm_start_tx();
//return 0 if tx done
u8 ir_comm_get_tx_flag();


void ir_comm_start_rx();
//return 0 if rx done
u8 ir_comm_get_rx_flag();


u16 ir_comm_received_signal_strength();


#endif
