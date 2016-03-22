#include "romfs.h"

#define ROMFS_DIR_ROOT 	0x20	/*internal constant - disk starting root dir*/
#define ROMFS_NULL 			0

#define ROMFS_OFS_ADR	0
#define ROMFS_OFS_SIZE	8
#define	ROMFS_OFS_NAME	16
#define ROMFS_OFS_DATA 	32

#define ROMFS_ATR				0x0000000f //file attribute mask
#define	ROMFS_ATR_DIR			(1<<0)
#define	ROMFS_ATR_FILE			(1<<1)

//map four u8 to u32
u32 btou_be(u8 *b)
{
	u32 res;
	res = b[0];
	res = (res<<8) + b[1];
	res = (res<<8) + b[2];
	res = (res<<8) + b[3];

	return res;
}

u8 romfs_mount_()
{
	u8 i, buf[8];
	
	if ((i = disk_init()) !=0 ) 	/*disk hardware init error*/
		return i;

	disk_read_init(0);				/*init read disk first block*/

	for (i = 0; i < 8; i++)				/*read romfs ID string*/
		buf[i] = disk_get_c();

	disk_read_stop();

	// check ID string
	if ((buf[0]=='-') &&		
		(buf[1]=='r') &&
		(buf[2]=='o') &&
		(buf[3]=='m') &&
		(buf[4]=='1') &&
		(buf[5]=='f') &&
		(buf[6]=='s') &&
		(buf[7]=='-'))
	{
	    g_openfile.begin = ROMFS_NULL;
	    return 0;
	} 
	
	return 3;
}

u8 romfs_mount_try()
{
	u32 mount_loops = 16, res;
	while ( ((res = romfs_mount_()) != 0) && (mount_loops) )
	{
		mount_loops--;
		
		u32 loops = 1000;
		while (loops--)
			__asm("nop");
	}

	return res;
}


u8 romfs_mount()
{
	return romfs_mount_try();
}

u8 romfs_umount()
{
	return 0;	
}

u8 romfs_name_cmp(char *name, u32 adr)
{
	u16 ofs = 0;
	u8 c;

	disk_read_init(adr); 

	while (((c = disk_get_c()) != '\0') && (name[ofs] != '\0') && (name[ofs] != '/'))
	{
		if (c != name[ofs])
			break;
			
		ofs++;
	}

	disk_read_stop();

	if ((c=='\0') && ((name[ofs] == '\0') || (name[ofs] == '/')))
		return ofs;

	return 0;
}

u8 romfs_open(char *file_name, u8 mode)
{
    if (g_openfile.begin != ROMFS_NULL) // file already opened
        return 9;

	u32 adr = ROMFS_DIR_ROOT;
	u16 len = 0, file_name_len = 0, name_ptr = 0;
	u8 i, buf[4];

	while (file_name[file_name_len])
		file_name_len++;
    
    g_openfile.mode = mode;
	g_openfile.ptr = 0;

	while ((name_ptr < file_name_len) && (*(file_name + name_ptr) != '\0') && (adr != 0))
	{
		disk_read_init(adr + ROMFS_OFS_ADR);	/*read address*/
		
		for (i = 0; i < 4; i++)
			buf[i] = disk_get_c();

		disk_read_stop();
		g_openfile.atr = buf[3] & ROMFS_ATR;		/*fill attributes*/

		if ((len = romfs_name_cmp(file_name + name_ptr, adr + ROMFS_OFS_NAME)) != 0)
		{
			/*extract size*/	
			disk_read_init(adr + ROMFS_OFS_SIZE);
			
			for (i = 0; i < 4; i++)
				buf[i] = disk_get_c();

			disk_read_stop();
			g_openfile.size	= btou_be(buf);	

			/*calc file begining address from offset of header begin and name length aligment to 16*/
			g_openfile.begin = adr + 16 + (((ROMFS_OFS_NAME + len) >> 4) << 4);	

			name_ptr += 1 + len;
			adr = g_openfile.begin;
		}
		else
		{
			adr	= btou_be(buf) &~ ROMFS_ATR;	/*we need read next block*/
		}
	}

	if (adr == 0)
	{
		return 1;
	}
	else
	{
		disk_read_init(g_openfile.begin); 
	}
	
	if (mode == ROMFS_OPEN_LOG)
	{
	    disk_read_stop();
	    g_openfile.ptr = 512;
	    disk_write_init(g_openfile.begin + 512);
	}
	
	return 0;
}

void romfs_close()
{
    if (g_openfile.begin == ROMFS_NULL)
        return;
        
    if (g_openfile.mode == ROMFS_OPEN_READ)
	    disk_read_stop();
	else
	    disk_write_stop();
	    
    g_openfile.begin = ROMFS_NULL;
}

/*return char from current file possition, if end of file return ROMFS_EOF or if error return ROMFS_ERROR*/
u16 romfs_getc() 
{
	/*
	u16 res = 0;
	
    if ((g_openfile.begin == ROMFS_NULL) || (g_openfile.mode == ROMFS_OPEN_LOG))
        return ROMFS_ERROR;
*/
    u16 res; 
	if (g_openfile.ptr < g_openfile.size)
	{
		g_openfile.ptr++;
		res = disk_get_c();
	}
	else
		res = ROMFS_EOF;
	
	return res;
}

extern u8 *g_disk_buffer;

u8* romfs_block_read()
{
	return g_disk_buffer;
}

u8 romfs_putc(u8 c)
{
	u8 ret;
	
    if ((g_openfile.begin == ROMFS_NULL) || (g_openfile.mode == ROMFS_OPEN_READ))
        return 6;
    
	if (g_openfile.ptr < g_openfile.size)
	{
		g_openfile.ptr++;
		
		if ((ret = disk_put_c(c)) != 0)
		    return ret;
	}
	else
		return 5;
	
	return 0;
}

/*seek to position from file begin*/
u8 romfs_seek(u32 pos)
{
    if ((g_openfile.begin == ROMFS_NULL) || (g_openfile.mode == ROMFS_OPEN_READ))
    {
	    disk_read_stop();
	    disk_read_init(g_openfile.begin + pos);
	    g_openfile.ptr = pos;
	}
	else
	{
	    disk_write_stop();
	    
	    if (pos < 512)
	    {
	        return 1;
	    }
	    else
	    { 
	        disk_write_init(g_openfile.begin + pos);
	    }
	}
	
	return 0;
}