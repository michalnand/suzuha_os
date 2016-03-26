#include "ir_comm_example.h"

#ifdef EXAMPLE_IR_COMM


void ir_comm_thread()
{
	printf_("comm thread starting\n");

	ir_comm_init();

  //sending packet timer period
	event_timer_set_period(EVENT_TIMER_1_ID, 351);

	struct sIRPacket tx_packet;
	struct sIRPacket rx_packet;

	ir_packet_init(&tx_packet);
	ir_packet_init(&rx_packet);

	u8 state = 0;
	while (1)
	{
		u8 res;
		if ( (res = ir_receive_packet(&rx_packet)) == IR_PACKET_SUCCESS)
		{
			led_on(LED_1);

			printf_("OK : signal %u > ", rx_packet.signal_strength, res);
			u32 i;
			for (i = 0; i < IR_PACKET_PAYLOAD_SIZE; i++)
				printf_("%c", tx_packet.payload[i]);
			printf_("\n");

			led_off(LED_1);
		}

		if (res == IR_PACKET_RX_START_ERROR)
			printf_("RX start error\n");
		else
		  if (res == IR_PACKET_RX_CRC_ERROR)
			   printf_("RX crc error\n");

    //chec if time to data transfer
		if (event_timer_get_flag(EVENT_TIMER_1_ID) != 0)
		{
			event_timer_clear_flag(EVENT_TIMER_1_ID);

      led_on(LED_1);

      //generate some packet data
			if (ir_send_packet(&tx_packet) == IR_PACKET_SUCCESS)
			{
				u32 i;

				switch (state)
				{
					case 0:
									for (i = 0; i < IR_PACKET_PAYLOAD_SIZE; i++)
										tx_packet.payload[i] = 'a' + i;
									break;

					case 1:
									for (i = 0; i < IR_PACKET_PAYLOAD_SIZE; i++)
										tx_packet.payload[i] = 'A' + i;
									break;

					case 2:
									for (i = 0; i < IR_PACKET_PAYLOAD_SIZE; i++)
										tx_packet.payload[i] = '0' + i;
									break;

					case 3:
									for (i = 0; i < IR_PACKET_PAYLOAD_SIZE; i++)
										tx_packet.payload[i] = m_rnd();
									break;
				}
				state = (state+1)&3;

        led_off(LED_1);

			}


		}

	}
}


void main_thread()
{
	led_on(LED_1);
	printf_(OS_WELCOME_MESSAGE);

	create_thread(ir_comm_thread, ir_comm_thread_stack, sizeof(ir_comm_thread_stack), PRIORITY_MAX);


	while (1)
	{
		led_on(LED_1);
		timer_delay_ms(100);

		led_off(LED_1);
		timer_delay_ms(900);
	}
}

#endif
