#ifndef _IR_PACKET_H_
#define _IR_PACKET_H_

#include "ir_comm.h"

#define IR_COMM_BUFFER_SIZE_      (u32)(6 + 8)

#define IR_PACKET_PAYLOAD_SIZE    ((u32)(IR_COMM_BUFFER_SIZE_ - 6))

struct sIRPacket
{
  u16 id;
  u16 type;
  u8 payload[IR_PACKET_PAYLOAD_SIZE];
  u16 signal_strength;
};

#define IR_PACKET_SUCCESS           ((u32)0)
#define IR_PACKET_TX_BUSY           ((u32)1)

#define IR_PACKET_RX_START_ERROR    ((u32)(1<<0))
#define IR_PACKET_RX_CRC_ERROR      ((u32)(1<<1))
#define IR_PACKET_RX_NO_DATA        ((u32)(1<<2))



#define IR_PACKET_START_BYTE        ((u8)0xAB)


void ir_packet_init(struct sIRPacket *ir_packet);

//noblocking
//return IR_PACKET_SUCCESS if success, IR_PACKET_TX_BUSY if busy
u8 ir_send_packet(struct sIRPacket *ir_packet);

//noblocking
//return IR_PACKET_SUCCESS if sucess,
//IR_PACKET_RX_NO_DATA if no data received yet
//IR_PACKET_RX_START_ERROR if star byte error
//IR_PACKET_RX_CRC_ERROR if crc error
u8 ir_receive_packet(struct sIRPacket *ir_packet);

#endif
