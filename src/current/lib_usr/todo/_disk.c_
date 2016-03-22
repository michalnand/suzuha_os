#include "disk.h"

#define SD_CMD00		0		/*reset card*/
#define SD_CMD01		1		/*init card*/
#define SD_CMD12		12		/*stop transmission*/
#define SD_CMD13		13		/*write status*/
#define SD_CMD16		16		/*set block size*/
#define SD_CMD17		17		/*read single block*/
#define SD_CMD18		18		/*read multiple blocks*/
#define SD_CMD24		24		/*write single block*/
	     
#ifdef DISK_BUFFER_ENABLED 

#define DISK_BUFFER_SIZE (BLOCK_SIZE)

u32 g_disk_buffer_ptr;
u8 g_disk_buffer[DISK_BUFFER_SIZE];

#endif

u16 g_sd_bytes_count;
u32 g_sd_rw_adr;

#define SD_CS_INIT() 	SPI_CS_INIT()
#define SD_CS_LOW() 	SPI_CS_LOW()
#define SD_CS_HIGH() 	SPI_CS_HIGH()



u8 sd_command(u8 cmd, u32 arg, u8 crc) 
{
	u8 res, i;
  
	SD_CS_LOW();          

	spib(cmd);
	spib(arg>>24);
	spib(arg>>16);
	spib(arg>>8);
	spib(arg);
	spib(crc);
    
	i = 10;
	while (((res = spib(0xff)) == 0xff) && (i--))
  		__asm("nop");

	SD_CS_HIGH();          
                
	return res;
}

u8 disk_init()
{
	u16 i;
 
	SD_CS_INIT();
	SD_CS_HIGH();						/*disable card select*/

 	/*initialise SPI, low speed*/
	spi_init();

	
	timer_delay_loops(10000);

	for(i = 0; i < 10; i++) /* idle for 1 bytes / 80 clocks */
		spib(0xFF);
                
 	/* [0x40 0x00 0x00 0x00 0x00 0x95 r:8] until we get "1" */
 	for(i = 0; i < 100 && sd_command(0x40|SD_CMD00, 0x00000000, 0x95) != 1; i++) {
		timer_delay_loops(10000);
	}
                        
	if(i == 100) /* card did not respond to initialization */
   		return 1;
               
	/* CMD1 until card comes out of idle, but maximum of 10 times */
	for(i = 0; i<100 && sd_command(0x40|SD_CMD01, 0x00000000, 0xFF) != 0; i++) {
		timer_delay_loops(10000);
	}

	if(i == 100) /* card did not come out of idle */
  		return 2;
                
	/* SET_BLOCKLEN to BLOCK_SIZE (512) */
	sd_command(0x40|SD_CMD16, BLOCK_SIZE, 0xFF);

	#ifdef DISK_BUFFER_ENABLED
	/*clear disk buffer*/
	for (i = 0; i < DISK_BUFFER_SIZE; i++)
		g_disk_buffer[i] = 0;

	g_disk_buffer_ptr = 0;
	#endif

	/*set SPI high speed*/

	return 0;
}

u8 disk_read_init(u32 adr)
{
	#ifdef DISK_BUFFER_ENABLED
	u32 sector = adr>>BLOCK_SIZE_SHIFT;
	u16 i, j;

	g_sd_bytes_count = 0;
	g_sd_rw_adr = sector;

	g_disk_buffer_ptr = 0;
    
    for (j = 0; j < (DISK_BUFFER_SIZE/BLOCK_SIZE); j++)
    {
		SD_CS_LOW();
		 
		spib(0x40 | SD_CMD17);	/* single block read */

		spib(sector>>15); 		/* sector*512 >> 24 */
		spib(sector>>7);  		/* sector*512 >> 16 */
		spib(sector<<1); 		/* sector*512 >> 8 */
		spib(0);          		/* sector*512 */
		spib(0xff);

		for(i = 0; i < 0xfff && spib(0xff) != 0x00; i++) 
	    	__asm("nop"); /* wait for 0 */

		if (i == 0xfff)
			return 4;         

		for(i = 0; i < 0xfff && spib(0xff) != 0xfe; i++) 
			__asm("nop"); /* wait for data start */

		if (i == 0xfff)
			return 5;

		spi_block_read(g_disk_buffer, BLOCK_SIZE);
		g_disk_buffer_ptr+= BLOCK_SIZE;


		/* skip checksum */
	    spib(0xff);		
	    spib(0xff);

	    SD_CS_HIGH();

		sector++;	/*read next sector*/
	}

	g_disk_buffer_ptr = adr;

	#else
	u32 sector = adr>>BLOCK_SIZE_SHIFT;
	u16 offset = adr&BLOCK_MODULO;

	u16 i;

	g_sd_bytes_count = 0;
	g_sd_rw_adr = sector;
    
	SD_CS_LOW();
	spib(0x40 | SD_CMD18);	/*multiple blocks read*/
	spib(sector>>15); /* sector*512 >> 24*/
	spib(sector>>7);  /* sector*512 >> 16*/
	spib(sector<<1);  /* sector*512 >> 8*/
	spib(0);          /* sector*512 */
	spib(0xff);
    
    for(i = 0; i < 0xfff && spib(0xff) != 0x00; i++) 
    	__asm("nop"); /* wait for 0 */

	if (i == 0xfff)
		return 4;         

	for(i = 0; i < 0xfff && spib(0xff) != 0xfe; i++) 
		__asm("nop"); /* wait for data start */

	if (i == 0xfff)
		return 5;


	for(i = 0; i < offset; i++) /* "skip" offset bytes */
	{
		spib(0xff);
		g_sd_bytes_count++;
	}
	#endif

	return 0;
}

void disk_read_stop()
{	
	u8 i;
	#ifdef DISK_BUFFER_ENABLED
	
	SD_CS_HIGH(); 

	for(i = 0; i < 10; i++) /* idle for 1 bytes / 80 clocks */
		spib(0xff); 

	#else
	spib(0xff);
	spib(0xff);  

	/*terminate reading command*/
	spib(0x40|SD_CMD12);
	spib(0);
 	spib(0);
	spib(0);
	spib(0);
	spib(0xff);  

	SD_CS_HIGH(); 

	for(i = 0; i < 10; i++) /* idle for 1 bytes / 80 clocks */
		spib(0xff); 
	#endif
}



u8 disk_read_sector(u8 *buffer, u32 adr)
{
	u32 sector = adr>>BLOCK_SIZE_SHIFT;
	u16 i;


	   

		SD_CS_LOW();
		 
		spib(0x40 | SD_CMD17);	/* single block read */

		spib(sector>>15); 		/* sector*512 >> 24 */
		spib(sector>>7);  		/* sector*512 >> 16 */
		spib(sector<<1); 		/* sector*512 >> 8 */
		spib(0);          		/* sector*512 */
		spib(0xff);

		for(i = 0; i < 0xfff && spib(0xff) != 0x00; i++) 
	    	__asm("nop"); /* wait for 0 */

		if (i == 0xfff)
			return 4;         

		for(i = 0; i < 0xfff && spib(0xff) != 0xfe; i++) 
			__asm("nop"); /* wait for data start */

		if (i == 0xfff)
			return 5;

		spi_block_read(buffer, BLOCK_SIZE);

		/* skip checksum */
	    spib(0xff);		
	    spib(0xff);

	    SD_CS_HIGH();

	return 0;
}

u8 disk_get_c()
{
	#ifdef DISK_BUFFER_ENABLED
	
	u8 res = g_disk_buffer[g_disk_buffer_ptr&(DISK_BUFFER_SIZE-1)];
	g_disk_buffer_ptr++;

	if ((g_disk_buffer_ptr&(DISK_BUFFER_SIZE-1)) == 0)	/*new block begin*/
		disk_read_init(g_disk_buffer_ptr);

	return res;

	#else
	u16 i;

	if (g_sd_bytes_count > BLOCK_MODULO)	/*new block begin*/
	{
		g_sd_bytes_count = 0;

		/* skip checksum */
    	spib(0xff);		
    	spib(0xff);

		/*wait for correct response*/
		i=0xff;
 		while ( (spib(0xff) != 0xfe) && (--i) );
	}

	g_sd_bytes_count++;
	return spib(0xff);	/*return data*/
	#endif
}


u8 disk_write_init(u32 adr) {
	u32 sector = adr>>BLOCK_SIZE_SHIFT;
	u16 offset = adr&BLOCK_MODULO;

	u16 i;

	g_sd_bytes_count = 0;
	g_sd_rw_adr = sector << BLOCK_SIZE_SHIFT;
    
    SD_CS_LOW();
	spib(0x40 | SD_CMD24);	/* block write*/
    spib(sector>>15); /* sector*512 >> 24*/
    spib(sector>>7);  /* sector*512 >> 16*/
    spib(sector<<1);  /* sector*512 >> 8*/
    spib(0);          /* sector*512 */
    spib(0xff);
    
    for(i = 0; i < 0xfff && spib(0xff) != 0x00; i++) 
    	__asm("nop"); /* wait for 0 */

	if (i == 0xfff)
		return 4;        
	
	spib(0xfe); // start write flag
	
	for(i = 0; i < offset; i++) // "skip" offset bytes
	{
		spib(0x00);
		g_sd_bytes_count++;
	}
	
	return 0;
}

void disk_write_stop() {
    u32 i;
    
    while (g_sd_bytes_count <= BLOCK_MODULO) {
        spib(0x00); // write dummy zeroes
        g_sd_bytes_count++;
    }
    
    spib(0xff);		
    spib(0xff);
    i = 0xffff;
    	
 	while ( (spib(0xff) != 0xff) && (--i) )
 	    __asm("nop");
}

u8 disk_put_c(u8 data) {
    u32 i;
    
	g_sd_bytes_count++;
	spib(data);	/*write data*/
    
	if (g_sd_bytes_count > BLOCK_MODULO)	/*new block begin*/
	{
		/* skip checksum */
    	spib(0xff);		
    	spib(0xff);
    	i = 0xffff;
    	
 		while ( (spib(0xff) != 0xff) && (--i) )
 		    __asm("nop");
 		    
 		if (i == 0)
 		    return 2;
 		    
 		if (disk_write_init(g_sd_rw_adr + 512) != 0)
 		    return 3;
	}
	
	
	return 0;
}