#ifndef _ROMFS_H_
#define _ROMFS_H_

#include "disk.h"
#include "../os/suzuha_os.h"

#define ROMFS_OPEN_READ         0x00
#define ROMFS_OPEN_LOG          0x01

#define ROMFS_EOF	    		0xff00
#define ROMFS_ERROR             0xfe00


struct sTRFSFile
{
	u32 begin;			/*if file return file DATA begin address, else dirrectory begin address*/
						/*return 0 if error (opening, or doesn't exist*/
    u8 mode;            /*open file mode*/
	u32 size;			/*0 for dirrectory, other for file*/

	u32 ptr;			/*current file pointer*/
	u32 atr;
};

struct sTRFSFile g_openfile; // global open file


u8 romfs_mount();
u8 romfs_umount();

u8 romfs_open(char *file_name, u8 mode);
void romfs_close();

u16 romfs_getc();
u8 romfs_putc(u8 c);
u8 romfs_seek(u32 pos);


#endif
