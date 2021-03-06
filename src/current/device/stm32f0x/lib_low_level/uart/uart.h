#ifndef _UART_H_
#define _UART_H_

#include "../lib_low_level.h"

#define UART_BAUD_RATE 		115200

#ifdef __cplusplus
extern "C" {
#endif

void uart_write(char c);
char uart_read();
u16 uart_is_char();
void uart_init();
void uart_clear_buffer();

#ifdef __cplusplus
}
#endif

#endif
