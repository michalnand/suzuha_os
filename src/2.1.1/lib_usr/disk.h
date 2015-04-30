#ifndef _DISK_H_
#define _DISK_H_
 
#include "../os/suzuha_os.h"
#include "../device/device.h" 

#define	DISK_BUFFER_ENABLED		1

#define	BLOCK_MODULO			511
#define	BLOCK_SIZE_SHIFT		9 
#define BLOCK_SIZE				(1<<BLOCK_SIZE_SHIFT)



u8 disk_init();
u8 disk_read_init(u32 adr);
void disk_read_stop();
u8 disk_read_sector(u8 *buffer, u32 adr);
u8 disk_get_c();

u8 disk_write_init(u32 adr);
void disk_write_stop();
u8 disk_put_c(u8 data);

u32 getReadCount();
u32 getWriteCount();

#endif
