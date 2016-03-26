#include "ir_packet.h"

void ir_packet_init(struct sIRPacket *ir_packet)
{
  ir_packet->id = 0;
  ir_packet->type = 0;
  ir_packet->payload[0] = 0;
  ir_packet->payload[1] = 0;
  ir_packet->payload[2] = 0;
  ir_packet->payload[3] = 0;
}
 
// Fletcher16 CRC
u8 ir_packet_crc(u8 *buffer, u32 size)
 {
   u16 sum1 = 0;
   u16 sum2 = 0;

   u32 i;
   for(i = 0; i < size; i++)
   {
     sum1 = (sum1 + buffer[i])&0xff;
     sum2 = (sum2 + sum1)&0xff;
   }

    return /*(sum2 << 8) |*/ sum1;
}

//return IR_PACKET_SUCCESS if success, IR_PACKET_TX_BUSY if busy
u8 ir_send_packet(struct sIRPacket *ir_packet)
{
  if (ir_comm_get_tx_flag() == 0)
  {
    tx_buffer[0] = IR_PACKET_START_BYTE;

    tx_buffer[1] = ir_packet->id>>8;
    tx_buffer[2] = ir_packet->id&0xff;
    tx_buffer[3] = ir_packet->type>>8;
    tx_buffer[4] = ir_packet->type&0xff;

    u32 i;
    for (i = 0; i < IR_PACKET_PAYLOAD_SIZE; i++)
      tx_buffer[5 + i] = ir_packet->payload[i];

    tx_buffer[IR_COMM_BUFFER_SIZE-1] = ir_packet_crc(tx_buffer, IR_COMM_BUFFER_SIZE-1);

    ir_comm_start_tx();
    return IR_PACKET_SUCCESS;
  }
  else
    return IR_PACKET_TX_BUSY;
}

//return IR_PACKET_SUCCESS if sucess,
//IR_PACKET_RX_START_ERROR if star byte error
//IR_PACKET_RX_CRC_ERROR if crc error
u8 ir_receive_packet(struct sIRPacket *ir_packet)
{
  u8 res = IR_PACKET_RX_NO_DATA;
  if (ir_comm_get_rx_flag() == 0)
  {
    u8 crc = ir_packet_crc(rx_buffer, IR_COMM_BUFFER_SIZE-1);

    ir_packet->id = ((u16)rx_buffer[1])<<8;
    ir_packet->id|= ((u16)rx_buffer[2]);

    ir_packet->type = ((u16)rx_buffer[3])<<8;
    ir_packet->type|= ((u16)rx_buffer[4]);

    u32 i;
    for (i = 0; i < IR_PACKET_PAYLOAD_SIZE; i++)
      ir_packet->payload[i] = rx_buffer[5 + i];


    if (rx_buffer[0] != IR_PACKET_START_BYTE)
      res = IR_PACKET_RX_START_ERROR;
    else
    if (rx_buffer[IR_COMM_BUFFER_SIZE-1] != crc)
      res = IR_PACKET_RX_CRC_ERROR;
    else
      res = IR_PACKET_SUCCESS;

    ir_comm_start_rx();
  }

  return res;
}
