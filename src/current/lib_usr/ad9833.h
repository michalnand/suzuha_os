#ifndef _AD9833_H_
#define _AD9833_H_

#include "../device/device.h"

#ifdef __cplusplus
extern "C" {
#endif

#define AD9833_CS_GPIO        GPIOB
#define AD9833_CS_PIN         (1<<13)

#define AD9833_FSYNC_GPIO     GPIOB
#define AD9833_FSYNC_PIN      (1<<14)


#define AD9833_SCK_GPIO	      GPIOB
#define AD9833_SCK_PIN        (1<<4)

#define AD9833_DAT_GPIO	      GPIOA
#define AD9833_DAT_PIN        (1<<15)

#define AD9833_SINE           ((u16)0x2000)
#define AD9833_SQUARE         ((u16)0x2020)
#define AD9833_TRIANGLE       ((u16)0x2002)

void ad9833_init();
void ad9833_set_frequency(u32 frequency, u16 waveform);
void ad9833_set_gain(u8 gain);

#ifdef __cplusplus
}
#endif

#endif
