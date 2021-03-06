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

			printf_("OK : ", res);
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

	event_timer_set_period(EVENT_TIMER_0_ID, 50);

	LCD_SH1106_init();
	LCD_SH1106_clear_buffer(0x00);

	while (1)
	{
		if (LCD_SH1106_flush_buffer_partial() == 0)
		{
			LCD_SH1106_clear_buffer(0x00);

      /*
			lcd_put_int(g_mpu6050.gx_sum, 0, 0);
			lcd_put_int(g_mpu6050.gy_sum, 0, 16);
			lcd_put_int(g_mpu6050.gz_sum, 0, 32);

			lcd_put_int(g_hmc5883.mx, 64, 0);
			lcd_put_int(g_hmc5883.my, 64, 16);
			lcd_put_int(g_hmc5883.mz, 64, 32);

			lcd_put_int(g_apds9950.ambient, 0, 48);
      */

			lcd_put_int(get_received_signal_level(), 64, 48);
		}
	}
}

#endif
