
bin/main.elf:     file format elf32-littlearm


Disassembly of section .text:

080000c4 <mem_info_print>:
 80000c4:	b538      	push	{r3, r4, r5, lr}
 80000c6:	480e      	ldr	r0, [pc, #56]	; (8000100 <mem_info_print+0x3c>)
 80000c8:	490e      	ldr	r1, [pc, #56]	; (8000104 <mem_info_print+0x40>)
 80000ca:	f000 fde3 	bl	8000c94 <printf_>
 80000ce:	4c0e      	ldr	r4, [pc, #56]	; (8000108 <mem_info_print+0x44>)
 80000d0:	480e      	ldr	r0, [pc, #56]	; (800010c <mem_info_print+0x48>)
 80000d2:	1c21      	adds	r1, r4, #0
 80000d4:	f000 fdde 	bl	8000c94 <printf_>
 80000d8:	4d0d      	ldr	r5, [pc, #52]	; (8000110 <mem_info_print+0x4c>)
 80000da:	480e      	ldr	r0, [pc, #56]	; (8000114 <mem_info_print+0x50>)
 80000dc:	1b2d      	subs	r5, r5, r4
 80000de:	1c29      	adds	r1, r5, #0
 80000e0:	f000 fdd8 	bl	8000c94 <printf_>
 80000e4:	490c      	ldr	r1, [pc, #48]	; (8000118 <mem_info_print+0x54>)
 80000e6:	480d      	ldr	r0, [pc, #52]	; (800011c <mem_info_print+0x58>)
 80000e8:	1a64      	subs	r4, r4, r1
 80000ea:	1929      	adds	r1, r5, r4
 80000ec:	f000 fdd2 	bl	8000c94 <printf_>
 80000f0:	490b      	ldr	r1, [pc, #44]	; (8000120 <mem_info_print+0x5c>)
 80000f2:	480c      	ldr	r0, [pc, #48]	; (8000124 <mem_info_print+0x60>)
 80000f4:	f000 fdce 	bl	8000c94 <printf_>
 80000f8:	480b      	ldr	r0, [pc, #44]	; (8000128 <mem_info_print+0x64>)
 80000fa:	f000 fdcb 	bl	8000c94 <printf_>
 80000fe:	bd38      	pop	{r3, r4, r5, pc}
 8000100:	080026dc 	.word	0x080026dc
 8000104:	080026c4 	.word	0x080026c4
 8000108:	20000000 	.word	0x20000000
 800010c:	080026ed 	.word	0x080026ed
 8000110:	20001000 	.word	0x20001000
 8000114:	080026fc 	.word	0x080026fc
 8000118:	200008c8 	.word	0x200008c8
 800011c:	0800270a 	.word	0x0800270a
 8000120:	200008c8 	.word	0x200008c8
 8000124:	08002718 	.word	0x08002718
 8000128:	08002728 	.word	0x08002728

0800012c <main>:
 800012c:	b508      	push	{r3, lr}
 800012e:	f001 f873 	bl	8001218 <lib_low_level_init>
 8000132:	f000 fe70 	bl	8000e16 <lib_os_init>
 8000136:	f7ff ffc5 	bl	80000c4 <mem_info_print>
 800013a:	2280      	movs	r2, #128	; 0x80
 800013c:	4904      	ldr	r1, [pc, #16]	; (8000150 <main+0x24>)
 800013e:	0052      	lsls	r2, r2, #1
 8000140:	2308      	movs	r3, #8
 8000142:	4804      	ldr	r0, [pc, #16]	; (8000154 <main+0x28>)
 8000144:	f000 fc9a 	bl	8000a7c <create_thread>
 8000148:	f000 fc92 	bl	8000a70 <kernel_start>
 800014c:	2000      	movs	r0, #0
 800014e:	bd08      	pop	{r3, pc}
 8000150:	200001ec 	.word	0x200001ec
 8000154:	08000219 	.word	0x08000219

08000158 <i2c_devices_thread>:
 8000158:	b538      	push	{r3, r4, r5, lr}
 800015a:	2132      	movs	r1, #50	; 0x32
 800015c:	2000      	movs	r0, #0
 800015e:	f002 f8e9 	bl	8002334 <event_timer_set_period>
 8000162:	f000 fba7 	bl	80008b4 <hmc5883_init>
 8000166:	f000 fb6b 	bl	8000840 <mpu6050_init>
 800016a:	f000 f8ff 	bl	800036c <apds950_init>
 800016e:	f000 fa31 	bl	80005d4 <LCD_SH1106_init>
 8000172:	2000      	movs	r0, #0
 8000174:	f000 f95a 	bl	800042c <LCD_SH1106_clear_buffer>
 8000178:	2000      	movs	r0, #0
 800017a:	f002 f8ed 	bl	8002358 <event_timer_get_flag>
 800017e:	2800      	cmp	r0, #0
 8000180:	d00e      	beq.n	80001a0 <i2c_devices_thread+0x48>
 8000182:	2000      	movs	r0, #0
 8000184:	f002 f8f6 	bl	8002374 <event_timer_clear_flag>
 8000188:	2008      	movs	r0, #8
 800018a:	f000 ffaf 	bl	80010ec <led_on>
 800018e:	f000 fbc1 	bl	8000914 <hmc5883_read>
 8000192:	f000 fadd 	bl	8000750 <mpu6050_read>
 8000196:	f000 f89d 	bl	80002d4 <apds9950_read>
 800019a:	2008      	movs	r0, #8
 800019c:	f000 ffba 	bl	8001114 <led_off>
 80001a0:	f000 f9ac 	bl	80004fc <LCD_SH1106_flush_buffer_partial>
 80001a4:	1e04      	subs	r4, r0, #0
 80001a6:	d1e7      	bne.n	8000178 <i2c_devices_thread+0x20>
 80001a8:	f000 f940 	bl	800042c <LCD_SH1106_clear_buffer>
 80001ac:	4d17      	ldr	r5, [pc, #92]	; (800020c <i2c_devices_thread+0xb4>)
 80001ae:	1c21      	adds	r1, r4, #0
 80001b0:	6968      	ldr	r0, [r5, #20]
 80001b2:	1c22      	adds	r2, r4, #0
 80001b4:	f000 fa98 	bl	80006e8 <lcd_put_int>
 80001b8:	69a8      	ldr	r0, [r5, #24]
 80001ba:	1c21      	adds	r1, r4, #0
 80001bc:	2210      	movs	r2, #16
 80001be:	f000 fa93 	bl	80006e8 <lcd_put_int>
 80001c2:	69e8      	ldr	r0, [r5, #28]
 80001c4:	1c21      	adds	r1, r4, #0
 80001c6:	2220      	movs	r2, #32
 80001c8:	f000 fa8e 	bl	80006e8 <lcd_put_int>
 80001cc:	4d10      	ldr	r5, [pc, #64]	; (8000210 <i2c_devices_thread+0xb8>)
 80001ce:	1c22      	adds	r2, r4, #0
 80001d0:	2300      	movs	r3, #0
 80001d2:	5ee8      	ldrsh	r0, [r5, r3]
 80001d4:	2140      	movs	r1, #64	; 0x40
 80001d6:	f000 fa87 	bl	80006e8 <lcd_put_int>
 80001da:	2302      	movs	r3, #2
 80001dc:	5ee8      	ldrsh	r0, [r5, r3]
 80001de:	2140      	movs	r1, #64	; 0x40
 80001e0:	2210      	movs	r2, #16
 80001e2:	f000 fa81 	bl	80006e8 <lcd_put_int>
 80001e6:	2304      	movs	r3, #4
 80001e8:	5ee8      	ldrsh	r0, [r5, r3]
 80001ea:	2140      	movs	r1, #64	; 0x40
 80001ec:	2220      	movs	r2, #32
 80001ee:	f000 fa7b 	bl	80006e8 <lcd_put_int>
 80001f2:	4b08      	ldr	r3, [pc, #32]	; (8000214 <i2c_devices_thread+0xbc>)
 80001f4:	1c21      	adds	r1, r4, #0
 80001f6:	88d8      	ldrh	r0, [r3, #6]
 80001f8:	2230      	movs	r2, #48	; 0x30
 80001fa:	f000 fa75 	bl	80006e8 <lcd_put_int>
 80001fe:	f002 f87d 	bl	80022fc <timer_get_time>
 8000202:	2140      	movs	r1, #64	; 0x40
 8000204:	2230      	movs	r2, #48	; 0x30
 8000206:	f000 fa6f 	bl	80006e8 <lcd_put_int>
 800020a:	e7b5      	b.n	8000178 <i2c_devices_thread+0x20>
 800020c:	200002fc 	.word	0x200002fc
 8000210:	200002f6 	.word	0x200002f6
 8000214:	200002ec 	.word	0x200002ec

08000218 <main_thread>:
 8000218:	b538      	push	{r3, r4, r5, lr}
 800021a:	2008      	movs	r0, #8
 800021c:	f000 ff66 	bl	80010ec <led_on>
 8000220:	4823      	ldr	r0, [pc, #140]	; (80002b0 <main_thread+0x98>)
 8000222:	f000 fd37 	bl	8000c94 <printf_>
 8000226:	2280      	movs	r2, #128	; 0x80
 8000228:	4922      	ldr	r1, [pc, #136]	; (80002b4 <main_thread+0x9c>)
 800022a:	0052      	lsls	r2, r2, #1
 800022c:	2308      	movs	r3, #8
 800022e:	4822      	ldr	r0, [pc, #136]	; (80002b8 <main_thread+0xa0>)
 8000230:	f000 fc24 	bl	8000a7c <create_thread>
 8000234:	f001 f8be 	bl	80013b4 <ws2812_init>
 8000238:	f001 f902 	bl	8001440 <ws2812_demo>
 800023c:	2008      	movs	r0, #8
 800023e:	f000 ff55 	bl	80010ec <led_on>
 8000242:	f002 f85b 	bl	80022fc <timer_get_time>
 8000246:	1c01      	adds	r1, r0, #0
 8000248:	481c      	ldr	r0, [pc, #112]	; (80002bc <main_thread+0xa4>)
 800024a:	f000 fd23 	bl	8000c94 <printf_>
 800024e:	4c1c      	ldr	r4, [pc, #112]	; (80002c0 <main_thread+0xa8>)
 8000250:	4d1c      	ldr	r5, [pc, #112]	; (80002c4 <main_thread+0xac>)
 8000252:	2302      	movs	r3, #2
 8000254:	5ee2      	ldrsh	r2, [r4, r3]
 8000256:	2000      	movs	r0, #0
 8000258:	5e21      	ldrsh	r1, [r4, r0]
 800025a:	2004      	movs	r0, #4
 800025c:	5e23      	ldrsh	r3, [r4, r0]
 800025e:	1c28      	adds	r0, r5, #0
 8000260:	f000 fd18 	bl	8000c94 <printf_>
 8000264:	2206      	movs	r2, #6
 8000266:	5ea1      	ldrsh	r1, [r4, r2]
 8000268:	2308      	movs	r3, #8
 800026a:	5ee2      	ldrsh	r2, [r4, r3]
 800026c:	200a      	movs	r0, #10
 800026e:	5e23      	ldrsh	r3, [r4, r0]
 8000270:	1c28      	adds	r0, r5, #0
 8000272:	f000 fd0f 	bl	8000c94 <printf_>
 8000276:	4b14      	ldr	r3, [pc, #80]	; (80002c8 <main_thread+0xb0>)
 8000278:	2200      	movs	r2, #0
 800027a:	5e99      	ldrsh	r1, [r3, r2]
 800027c:	2002      	movs	r0, #2
 800027e:	5e1a      	ldrsh	r2, [r3, r0]
 8000280:	2004      	movs	r0, #4
 8000282:	5e1b      	ldrsh	r3, [r3, r0]
 8000284:	1c28      	adds	r0, r5, #0
 8000286:	f000 fd05 	bl	8000c94 <printf_>
 800028a:	4b10      	ldr	r3, [pc, #64]	; (80002cc <main_thread+0xb4>)
 800028c:	1c28      	adds	r0, r5, #0
 800028e:	8819      	ldrh	r1, [r3, #0]
 8000290:	885a      	ldrh	r2, [r3, #2]
 8000292:	889b      	ldrh	r3, [r3, #4]
 8000294:	f000 fcfe 	bl	8000c94 <printf_>
 8000298:	480d      	ldr	r0, [pc, #52]	; (80002d0 <main_thread+0xb8>)
 800029a:	f000 fcfb 	bl	8000c94 <printf_>
 800029e:	2008      	movs	r0, #8
 80002a0:	f000 ff38 	bl	8001114 <led_off>
 80002a4:	20fa      	movs	r0, #250	; 0xfa
 80002a6:	0080      	lsls	r0, r0, #2
 80002a8:	f002 f834 	bl	8002314 <timer_delay_ms>
 80002ac:	e7c4      	b.n	8000238 <main_thread+0x20>
 80002ae:	46c0      	nop			; (mov r8, r8)
 80002b0:	0800272b 	.word	0x0800272b
 80002b4:	200000ec 	.word	0x200000ec
 80002b8:	08000159 	.word	0x08000159
 80002bc:	08002766 	.word	0x08002766
 80002c0:	200002fc 	.word	0x200002fc
 80002c4:	0800276d 	.word	0x0800276d
 80002c8:	200002f6 	.word	0x200002f6
 80002cc:	200002ec 	.word	0x200002ec
 80002d0:	08002729 	.word	0x08002729

080002d4 <apds9950_read>:
 80002d4:	b538      	push	{r3, r4, r5, lr}
 80002d6:	f000 fe28 	bl	8000f2a <i2cStart>
 80002da:	2072      	movs	r0, #114	; 0x72
 80002dc:	f000 fe41 	bl	8000f62 <i2cWrite>
 80002e0:	20b4      	movs	r0, #180	; 0xb4
 80002e2:	f000 fe3e 	bl	8000f62 <i2cWrite>
 80002e6:	f000 fe20 	bl	8000f2a <i2cStart>
 80002ea:	2073      	movs	r0, #115	; 0x73
 80002ec:	f000 fe39 	bl	8000f62 <i2cWrite>
 80002f0:	2001      	movs	r0, #1
 80002f2:	f000 fe5d 	bl	8000fb0 <i2cRead>
 80002f6:	4c1c      	ldr	r4, [pc, #112]	; (8000368 <apds9950_read+0x94>)
 80002f8:	1c05      	adds	r5, r0, #0
 80002fa:	80e0      	strh	r0, [r4, #6]
 80002fc:	2001      	movs	r0, #1
 80002fe:	f000 fe57 	bl	8000fb0 <i2cRead>
 8000302:	0200      	lsls	r0, r0, #8
 8000304:	4305      	orrs	r5, r0
 8000306:	2001      	movs	r0, #1
 8000308:	80e5      	strh	r5, [r4, #6]
 800030a:	f000 fe51 	bl	8000fb0 <i2cRead>
 800030e:	8020      	strh	r0, [r4, #0]
 8000310:	1c05      	adds	r5, r0, #0
 8000312:	2001      	movs	r0, #1
 8000314:	f000 fe4c 	bl	8000fb0 <i2cRead>
 8000318:	0200      	lsls	r0, r0, #8
 800031a:	4305      	orrs	r5, r0
 800031c:	2001      	movs	r0, #1
 800031e:	8025      	strh	r5, [r4, #0]
 8000320:	f000 fe46 	bl	8000fb0 <i2cRead>
 8000324:	8060      	strh	r0, [r4, #2]
 8000326:	1c05      	adds	r5, r0, #0
 8000328:	2001      	movs	r0, #1
 800032a:	f000 fe41 	bl	8000fb0 <i2cRead>
 800032e:	0200      	lsls	r0, r0, #8
 8000330:	4305      	orrs	r5, r0
 8000332:	2001      	movs	r0, #1
 8000334:	8065      	strh	r5, [r4, #2]
 8000336:	f000 fe3b 	bl	8000fb0 <i2cRead>
 800033a:	80a0      	strh	r0, [r4, #4]
 800033c:	1c05      	adds	r5, r0, #0
 800033e:	2001      	movs	r0, #1
 8000340:	f000 fe36 	bl	8000fb0 <i2cRead>
 8000344:	0200      	lsls	r0, r0, #8
 8000346:	4305      	orrs	r5, r0
 8000348:	2001      	movs	r0, #1
 800034a:	80a5      	strh	r5, [r4, #4]
 800034c:	f000 fe30 	bl	8000fb0 <i2cRead>
 8000350:	8120      	strh	r0, [r4, #8]
 8000352:	1c05      	adds	r5, r0, #0
 8000354:	2000      	movs	r0, #0
 8000356:	f000 fe2b 	bl	8000fb0 <i2cRead>
 800035a:	0200      	lsls	r0, r0, #8
 800035c:	4305      	orrs	r5, r0
 800035e:	8125      	strh	r5, [r4, #8]
 8000360:	f000 fdf1 	bl	8000f46 <i2cStop>
 8000364:	bd38      	pop	{r3, r4, r5, pc}
 8000366:	46c0      	nop			; (mov r8, r8)
 8000368:	200002ec 	.word	0x200002ec

0800036c <apds950_init>:
 800036c:	b508      	push	{r3, lr}
 800036e:	2072      	movs	r0, #114	; 0x72
 8000370:	2181      	movs	r1, #129	; 0x81
 8000372:	22ff      	movs	r2, #255	; 0xff
 8000374:	f000 fe41 	bl	8000ffa <i2c_write_reg>
 8000378:	2072      	movs	r0, #114	; 0x72
 800037a:	2183      	movs	r1, #131	; 0x83
 800037c:	22ff      	movs	r2, #255	; 0xff
 800037e:	f000 fe3c 	bl	8000ffa <i2c_write_reg>
 8000382:	2072      	movs	r0, #114	; 0x72
 8000384:	218d      	movs	r1, #141	; 0x8d
 8000386:	2200      	movs	r2, #0
 8000388:	f000 fe37 	bl	8000ffa <i2c_write_reg>
 800038c:	2072      	movs	r0, #114	; 0x72
 800038e:	2180      	movs	r1, #128	; 0x80
 8000390:	2203      	movs	r2, #3
 8000392:	f000 fe32 	bl	8000ffa <i2c_write_reg>
 8000396:	2072      	movs	r0, #114	; 0x72
 8000398:	218f      	movs	r1, #143	; 0x8f
 800039a:	2223      	movs	r2, #35	; 0x23
 800039c:	f000 fe2d 	bl	8000ffa <i2c_write_reg>
 80003a0:	2072      	movs	r0, #114	; 0x72
 80003a2:	2180      	movs	r1, #128	; 0x80
 80003a4:	2207      	movs	r2, #7
 80003a6:	f000 fe28 	bl	8000ffa <i2c_write_reg>
 80003aa:	2072      	movs	r0, #114	; 0x72
 80003ac:	218e      	movs	r1, #142	; 0x8e
 80003ae:	2208      	movs	r2, #8
 80003b0:	f000 fe23 	bl	8000ffa <i2c_write_reg>
 80003b4:	f7ff ff8e 	bl	80002d4 <apds9950_read>
 80003b8:	2000      	movs	r0, #0
 80003ba:	bd08      	pop	{r3, pc}

080003bc <LCD_SH1106_write_command>:
 80003bc:	b508      	push	{r3, lr}
 80003be:	1c02      	adds	r2, r0, #0
 80003c0:	2100      	movs	r1, #0
 80003c2:	2078      	movs	r0, #120	; 0x78
 80003c4:	f000 fe19 	bl	8000ffa <i2c_write_reg>
 80003c8:	bd08      	pop	{r3, pc}

080003ca <LCD_SH1106_set_cursor>:
 80003ca:	b510      	push	{r4, lr}
 80003cc:	1c84      	adds	r4, r0, #2
 80003ce:	1c08      	adds	r0, r1, #0
 80003d0:	3850      	subs	r0, #80	; 0x50
 80003d2:	b2c0      	uxtb	r0, r0
 80003d4:	f7ff fff2 	bl	80003bc <LCD_SH1106_write_command>
 80003d8:	b2e4      	uxtb	r4, r4
 80003da:	200f      	movs	r0, #15
 80003dc:	4020      	ands	r0, r4
 80003de:	f7ff ffed 	bl	80003bc <LCD_SH1106_write_command>
 80003e2:	0924      	lsrs	r4, r4, #4
 80003e4:	2010      	movs	r0, #16
 80003e6:	4320      	orrs	r0, r4
 80003e8:	f7ff ffe8 	bl	80003bc <LCD_SH1106_write_command>
 80003ec:	bd10      	pop	{r4, pc}
	...

080003f0 <LCD_SH1106_set_pixel>:
 80003f0:	b570      	push	{r4, r5, r6, lr}
 80003f2:	1c0c      	adds	r4, r1, #0
 80003f4:	1c05      	adds	r5, r0, #0
 80003f6:	1c16      	adds	r6, r2, #0
 80003f8:	f000 fb28 	bl	8000a4c <sched_off>
 80003fc:	08e2      	lsrs	r2, r4, #3
 80003fe:	2107      	movs	r1, #7
 8000400:	400c      	ands	r4, r1
 8000402:	01d2      	lsls	r2, r2, #7
 8000404:	4b08      	ldr	r3, [pc, #32]	; (8000428 <LCD_SH1106_set_pixel+0x38>)
 8000406:	2101      	movs	r1, #1
 8000408:	1955      	adds	r5, r2, r5
 800040a:	40a1      	lsls	r1, r4
 800040c:	5d5a      	ldrb	r2, [r3, r5]
 800040e:	1c0c      	adds	r4, r1, #0
 8000410:	2e00      	cmp	r6, #0
 8000412:	d003      	beq.n	800041c <LCD_SH1106_set_pixel+0x2c>
 8000414:	4314      	orrs	r4, r2
 8000416:	b2e4      	uxtb	r4, r4
 8000418:	555c      	strb	r4, [r3, r5]
 800041a:	e001      	b.n	8000420 <LCD_SH1106_set_pixel+0x30>
 800041c:	438a      	bics	r2, r1
 800041e:	555a      	strb	r2, [r3, r5]
 8000420:	f000 fb16 	bl	8000a50 <sched_on>
 8000424:	bd70      	pop	{r4, r5, r6, pc}
 8000426:	46c0      	nop			; (mov r8, r8)
 8000428:	20000322 	.word	0x20000322

0800042c <LCD_SH1106_clear_buffer>:
 800042c:	b082      	sub	sp, #8
 800042e:	2300      	movs	r3, #0
 8000430:	9300      	str	r3, [sp, #0]
 8000432:	9b00      	ldr	r3, [sp, #0]
 8000434:	2b07      	cmp	r3, #7
 8000436:	d810      	bhi.n	800045a <LCD_SH1106_clear_buffer+0x2e>
 8000438:	2300      	movs	r3, #0
 800043a:	9301      	str	r3, [sp, #4]
 800043c:	9b01      	ldr	r3, [sp, #4]
 800043e:	2b7f      	cmp	r3, #127	; 0x7f
 8000440:	d808      	bhi.n	8000454 <LCD_SH1106_clear_buffer+0x28>
 8000442:	9a00      	ldr	r2, [sp, #0]
 8000444:	9b01      	ldr	r3, [sp, #4]
 8000446:	01d2      	lsls	r2, r2, #7
 8000448:	18d2      	adds	r2, r2, r3
 800044a:	4b05      	ldr	r3, [pc, #20]	; (8000460 <LCD_SH1106_clear_buffer+0x34>)
 800044c:	54d0      	strb	r0, [r2, r3]
 800044e:	9b01      	ldr	r3, [sp, #4]
 8000450:	3301      	adds	r3, #1
 8000452:	e7f2      	b.n	800043a <LCD_SH1106_clear_buffer+0xe>
 8000454:	9b00      	ldr	r3, [sp, #0]
 8000456:	3301      	adds	r3, #1
 8000458:	e7ea      	b.n	8000430 <LCD_SH1106_clear_buffer+0x4>
 800045a:	b002      	add	sp, #8
 800045c:	4770      	bx	lr
 800045e:	46c0      	nop			; (mov r8, r8)
 8000460:	20000322 	.word	0x20000322

08000464 <LCD_SH1106_flush_buffer>:
 8000464:	b530      	push	{r4, r5, lr}
 8000466:	2000      	movs	r0, #0
 8000468:	b085      	sub	sp, #20
 800046a:	f7ff ffa7 	bl	80003bc <LCD_SH1106_write_command>
 800046e:	2010      	movs	r0, #16
 8000470:	f7ff ffa4 	bl	80003bc <LCD_SH1106_write_command>
 8000474:	2040      	movs	r0, #64	; 0x40
 8000476:	f7ff ffa1 	bl	80003bc <LCD_SH1106_write_command>
 800047a:	2300      	movs	r3, #0
 800047c:	9301      	str	r3, [sp, #4]
 800047e:	9b01      	ldr	r3, [sp, #4]
 8000480:	2b07      	cmp	r3, #7
 8000482:	d833      	bhi.n	80004ec <LCD_SH1106_flush_buffer+0x88>
 8000484:	9801      	ldr	r0, [sp, #4]
 8000486:	2400      	movs	r4, #0
 8000488:	3850      	subs	r0, #80	; 0x50
 800048a:	b2c0      	uxtb	r0, r0
 800048c:	f7ff ff96 	bl	80003bc <LCD_SH1106_write_command>
 8000490:	2002      	movs	r0, #2
 8000492:	f7ff ff93 	bl	80003bc <LCD_SH1106_write_command>
 8000496:	2010      	movs	r0, #16
 8000498:	f7ff ff90 	bl	80003bc <LCD_SH1106_write_command>
 800049c:	9402      	str	r4, [sp, #8]
 800049e:	9b02      	ldr	r3, [sp, #8]
 80004a0:	2b07      	cmp	r3, #7
 80004a2:	d820      	bhi.n	80004e6 <LCD_SH1106_flush_buffer+0x82>
 80004a4:	f000 fd41 	bl	8000f2a <i2cStart>
 80004a8:	2078      	movs	r0, #120	; 0x78
 80004aa:	f000 fd5a 	bl	8000f62 <i2cWrite>
 80004ae:	2040      	movs	r0, #64	; 0x40
 80004b0:	f000 fd57 	bl	8000f62 <i2cWrite>
 80004b4:	2300      	movs	r3, #0
 80004b6:	9303      	str	r3, [sp, #12]
 80004b8:	9b03      	ldr	r3, [sp, #12]
 80004ba:	2b0f      	cmp	r3, #15
 80004bc:	d80d      	bhi.n	80004da <LCD_SH1106_flush_buffer+0x76>
 80004be:	9b01      	ldr	r3, [sp, #4]
 80004c0:	1c65      	adds	r5, r4, #1
 80004c2:	01db      	lsls	r3, r3, #7
 80004c4:	191c      	adds	r4, r3, r4
 80004c6:	4b0c      	ldr	r3, [pc, #48]	; (80004f8 <LCD_SH1106_flush_buffer+0x94>)
 80004c8:	5ce0      	ldrb	r0, [r4, r3]
 80004ca:	1c2c      	adds	r4, r5, #0
 80004cc:	b2c0      	uxtb	r0, r0
 80004ce:	f000 fd48 	bl	8000f62 <i2cWrite>
 80004d2:	9b03      	ldr	r3, [sp, #12]
 80004d4:	3301      	adds	r3, #1
 80004d6:	9303      	str	r3, [sp, #12]
 80004d8:	e7ee      	b.n	80004b8 <LCD_SH1106_flush_buffer+0x54>
 80004da:	f000 fd34 	bl	8000f46 <i2cStop>
 80004de:	9b02      	ldr	r3, [sp, #8]
 80004e0:	3301      	adds	r3, #1
 80004e2:	9302      	str	r3, [sp, #8]
 80004e4:	e7db      	b.n	800049e <LCD_SH1106_flush_buffer+0x3a>
 80004e6:	9b01      	ldr	r3, [sp, #4]
 80004e8:	3301      	adds	r3, #1
 80004ea:	e7c7      	b.n	800047c <LCD_SH1106_flush_buffer+0x18>
 80004ec:	2000      	movs	r0, #0
 80004ee:	1c01      	adds	r1, r0, #0
 80004f0:	f7ff ff6b 	bl	80003ca <LCD_SH1106_set_cursor>
 80004f4:	b005      	add	sp, #20
 80004f6:	bd30      	pop	{r4, r5, pc}
 80004f8:	20000322 	.word	0x20000322

080004fc <LCD_SH1106_flush_buffer_partial>:
 80004fc:	b5f0      	push	{r4, r5, r6, r7, lr}
 80004fe:	4c32      	ldr	r4, [pc, #200]	; (80005c8 <LCD_SH1106_flush_buffer_partial+0xcc>)
 8000500:	b085      	sub	sp, #20
 8000502:	8826      	ldrh	r6, [r4, #0]
 8000504:	1c25      	adds	r5, r4, #0
 8000506:	b2b6      	uxth	r6, r6
 8000508:	2e01      	cmp	r6, #1
 800050a:	d019      	beq.n	8000540 <LCD_SH1106_flush_buffer_partial+0x44>
 800050c:	2e00      	cmp	r6, #0
 800050e:	d009      	beq.n	8000524 <LCD_SH1106_flush_buffer_partial+0x28>
 8000510:	2500      	movs	r5, #0
 8000512:	2e02      	cmp	r6, #2
 8000514:	d154      	bne.n	80005c0 <LCD_SH1106_flush_buffer_partial+0xc4>
 8000516:	1c28      	adds	r0, r5, #0
 8000518:	1c29      	adds	r1, r5, #0
 800051a:	f7ff ff56 	bl	80003ca <LCD_SH1106_set_cursor>
 800051e:	8025      	strh	r5, [r4, #0]
 8000520:	1c28      	adds	r0, r5, #0
 8000522:	e04f      	b.n	80005c4 <LCD_SH1106_flush_buffer_partial+0xc8>
 8000524:	1c30      	adds	r0, r6, #0
 8000526:	f7ff ff49 	bl	80003bc <LCD_SH1106_write_command>
 800052a:	2010      	movs	r0, #16
 800052c:	f7ff ff46 	bl	80003bc <LCD_SH1106_write_command>
 8000530:	2040      	movs	r0, #64	; 0x40
 8000532:	f7ff ff43 	bl	80003bc <LCD_SH1106_write_command>
 8000536:	4b25      	ldr	r3, [pc, #148]	; (80005cc <LCD_SH1106_flush_buffer_partial+0xd0>)
 8000538:	2001      	movs	r0, #1
 800053a:	801e      	strh	r6, [r3, #0]
 800053c:	8020      	strh	r0, [r4, #0]
 800053e:	e041      	b.n	80005c4 <LCD_SH1106_flush_buffer_partial+0xc8>
 8000540:	4c22      	ldr	r4, [pc, #136]	; (80005cc <LCD_SH1106_flush_buffer_partial+0xd0>)
 8000542:	2600      	movs	r6, #0
 8000544:	8823      	ldrh	r3, [r4, #0]
 8000546:	b29b      	uxth	r3, r3
 8000548:	9301      	str	r3, [sp, #4]
 800054a:	9801      	ldr	r0, [sp, #4]
 800054c:	3850      	subs	r0, #80	; 0x50
 800054e:	b2c0      	uxtb	r0, r0
 8000550:	f7ff ff34 	bl	80003bc <LCD_SH1106_write_command>
 8000554:	2002      	movs	r0, #2
 8000556:	f7ff ff31 	bl	80003bc <LCD_SH1106_write_command>
 800055a:	2010      	movs	r0, #16
 800055c:	f7ff ff2e 	bl	80003bc <LCD_SH1106_write_command>
 8000560:	9602      	str	r6, [sp, #8]
 8000562:	9b02      	ldr	r3, [sp, #8]
 8000564:	2b07      	cmp	r3, #7
 8000566:	d820      	bhi.n	80005aa <LCD_SH1106_flush_buffer_partial+0xae>
 8000568:	f000 fcdf 	bl	8000f2a <i2cStart>
 800056c:	2078      	movs	r0, #120	; 0x78
 800056e:	f000 fcf8 	bl	8000f62 <i2cWrite>
 8000572:	2040      	movs	r0, #64	; 0x40
 8000574:	f000 fcf5 	bl	8000f62 <i2cWrite>
 8000578:	2300      	movs	r3, #0
 800057a:	9303      	str	r3, [sp, #12]
 800057c:	9b03      	ldr	r3, [sp, #12]
 800057e:	2b0f      	cmp	r3, #15
 8000580:	d80d      	bhi.n	800059e <LCD_SH1106_flush_buffer_partial+0xa2>
 8000582:	9b01      	ldr	r3, [sp, #4]
 8000584:	1c77      	adds	r7, r6, #1
 8000586:	01db      	lsls	r3, r3, #7
 8000588:	199e      	adds	r6, r3, r6
 800058a:	4b11      	ldr	r3, [pc, #68]	; (80005d0 <LCD_SH1106_flush_buffer_partial+0xd4>)
 800058c:	5cf0      	ldrb	r0, [r6, r3]
 800058e:	1c3e      	adds	r6, r7, #0
 8000590:	b2c0      	uxtb	r0, r0
 8000592:	f000 fce6 	bl	8000f62 <i2cWrite>
 8000596:	9b03      	ldr	r3, [sp, #12]
 8000598:	3301      	adds	r3, #1
 800059a:	9303      	str	r3, [sp, #12]
 800059c:	e7ee      	b.n	800057c <LCD_SH1106_flush_buffer_partial+0x80>
 800059e:	f000 fcd2 	bl	8000f46 <i2cStop>
 80005a2:	9b02      	ldr	r3, [sp, #8]
 80005a4:	3301      	adds	r3, #1
 80005a6:	9302      	str	r3, [sp, #8]
 80005a8:	e7db      	b.n	8000562 <LCD_SH1106_flush_buffer_partial+0x66>
 80005aa:	8823      	ldrh	r3, [r4, #0]
 80005ac:	2001      	movs	r0, #1
 80005ae:	3301      	adds	r3, #1
 80005b0:	b29b      	uxth	r3, r3
 80005b2:	8023      	strh	r3, [r4, #0]
 80005b4:	8823      	ldrh	r3, [r4, #0]
 80005b6:	2b07      	cmp	r3, #7
 80005b8:	d904      	bls.n	80005c4 <LCD_SH1106_flush_buffer_partial+0xc8>
 80005ba:	2302      	movs	r3, #2
 80005bc:	802b      	strh	r3, [r5, #0]
 80005be:	e001      	b.n	80005c4 <LCD_SH1106_flush_buffer_partial+0xc8>
 80005c0:	8025      	strh	r5, [r4, #0]
 80005c2:	2001      	movs	r0, #1
 80005c4:	b005      	add	sp, #20
 80005c6:	bdf0      	pop	{r4, r5, r6, r7, pc}
 80005c8:	20000320 	.word	0x20000320
 80005cc:	20000722 	.word	0x20000722
 80005d0:	20000322 	.word	0x20000322

080005d4 <LCD_SH1106_init>:
 80005d4:	b508      	push	{r3, lr}
 80005d6:	20ae      	movs	r0, #174	; 0xae
 80005d8:	f7ff fef0 	bl	80003bc <LCD_SH1106_write_command>
 80005dc:	2002      	movs	r0, #2
 80005de:	f7ff feed 	bl	80003bc <LCD_SH1106_write_command>
 80005e2:	2010      	movs	r0, #16
 80005e4:	f7ff feea 	bl	80003bc <LCD_SH1106_write_command>
 80005e8:	2040      	movs	r0, #64	; 0x40
 80005ea:	f7ff fee7 	bl	80003bc <LCD_SH1106_write_command>
 80005ee:	20b0      	movs	r0, #176	; 0xb0
 80005f0:	f7ff fee4 	bl	80003bc <LCD_SH1106_write_command>
 80005f4:	2081      	movs	r0, #129	; 0x81
 80005f6:	f7ff fee1 	bl	80003bc <LCD_SH1106_write_command>
 80005fa:	2080      	movs	r0, #128	; 0x80
 80005fc:	f7ff fede 	bl	80003bc <LCD_SH1106_write_command>
 8000600:	20a1      	movs	r0, #161	; 0xa1
 8000602:	f7ff fedb 	bl	80003bc <LCD_SH1106_write_command>
 8000606:	20a6      	movs	r0, #166	; 0xa6
 8000608:	f7ff fed8 	bl	80003bc <LCD_SH1106_write_command>
 800060c:	20a8      	movs	r0, #168	; 0xa8
 800060e:	f7ff fed5 	bl	80003bc <LCD_SH1106_write_command>
 8000612:	203f      	movs	r0, #63	; 0x3f
 8000614:	f7ff fed2 	bl	80003bc <LCD_SH1106_write_command>
 8000618:	20ad      	movs	r0, #173	; 0xad
 800061a:	f7ff fecf 	bl	80003bc <LCD_SH1106_write_command>
 800061e:	208b      	movs	r0, #139	; 0x8b
 8000620:	f7ff fecc 	bl	80003bc <LCD_SH1106_write_command>
 8000624:	2030      	movs	r0, #48	; 0x30
 8000626:	f7ff fec9 	bl	80003bc <LCD_SH1106_write_command>
 800062a:	20c8      	movs	r0, #200	; 0xc8
 800062c:	f7ff fec6 	bl	80003bc <LCD_SH1106_write_command>
 8000630:	20d3      	movs	r0, #211	; 0xd3
 8000632:	f7ff fec3 	bl	80003bc <LCD_SH1106_write_command>
 8000636:	2000      	movs	r0, #0
 8000638:	f7ff fec0 	bl	80003bc <LCD_SH1106_write_command>
 800063c:	20d5      	movs	r0, #213	; 0xd5
 800063e:	f7ff febd 	bl	80003bc <LCD_SH1106_write_command>
 8000642:	2080      	movs	r0, #128	; 0x80
 8000644:	f7ff feba 	bl	80003bc <LCD_SH1106_write_command>
 8000648:	20d9      	movs	r0, #217	; 0xd9
 800064a:	f7ff feb7 	bl	80003bc <LCD_SH1106_write_command>
 800064e:	201f      	movs	r0, #31
 8000650:	f7ff feb4 	bl	80003bc <LCD_SH1106_write_command>
 8000654:	20da      	movs	r0, #218	; 0xda
 8000656:	f7ff feb1 	bl	80003bc <LCD_SH1106_write_command>
 800065a:	2012      	movs	r0, #18
 800065c:	f7ff feae 	bl	80003bc <LCD_SH1106_write_command>
 8000660:	20db      	movs	r0, #219	; 0xdb
 8000662:	f7ff feab 	bl	80003bc <LCD_SH1106_write_command>
 8000666:	2040      	movs	r0, #64	; 0x40
 8000668:	f7ff fea8 	bl	80003bc <LCD_SH1106_write_command>
 800066c:	20af      	movs	r0, #175	; 0xaf
 800066e:	f7ff fea5 	bl	80003bc <LCD_SH1106_write_command>
 8000672:	2000      	movs	r0, #0
 8000674:	f7ff feda 	bl	800042c <LCD_SH1106_clear_buffer>
 8000678:	f7ff fef4 	bl	8000464 <LCD_SH1106_flush_buffer>
 800067c:	4a02      	ldr	r2, [pc, #8]	; (8000688 <LCD_SH1106_init+0xb4>)
 800067e:	2300      	movs	r3, #0
 8000680:	8013      	strh	r3, [r2, #0]
 8000682:	4a02      	ldr	r2, [pc, #8]	; (800068c <LCD_SH1106_init+0xb8>)
 8000684:	8013      	strh	r3, [r2, #0]
 8000686:	bd08      	pop	{r3, pc}
 8000688:	20000320 	.word	0x20000320
 800068c:	20000722 	.word	0x20000722

08000690 <lcd_put_char_xy>:
 8000690:	b5f7      	push	{r0, r1, r2, r4, r5, r6, r7, lr}
 8000692:	2300      	movs	r3, #0
 8000694:	1c06      	adds	r6, r0, #0
 8000696:	1c0f      	adds	r7, r1, #0
 8000698:	2a1f      	cmp	r2, #31
 800069a:	d902      	bls.n	80006a2 <lcd_put_char_xy+0x12>
 800069c:	1c13      	adds	r3, r2, #0
 800069e:	3b20      	subs	r3, #32
 80006a0:	b2db      	uxtb	r3, r3
 80006a2:	011b      	lsls	r3, r3, #4
 80006a4:	9300      	str	r3, [sp, #0]
 80006a6:	2500      	movs	r5, #0
 80006a8:	2301      	movs	r3, #1
 80006aa:	40ab      	lsls	r3, r5
 80006ac:	b2db      	uxtb	r3, r3
 80006ae:	9301      	str	r3, [sp, #4]
 80006b0:	2400      	movs	r4, #0
 80006b2:	1c30      	adds	r0, r6, #0
 80006b4:	3008      	adds	r0, #8
 80006b6:	19e1      	adds	r1, r4, r7
 80006b8:	1b40      	subs	r0, r0, r5
 80006ba:	2880      	cmp	r0, #128	; 0x80
 80006bc:	d900      	bls.n	80006c0 <lcd_put_char_xy+0x30>
 80006be:	2080      	movs	r0, #128	; 0x80
 80006c0:	2940      	cmp	r1, #64	; 0x40
 80006c2:	d900      	bls.n	80006c6 <lcd_put_char_xy+0x36>
 80006c4:	2140      	movs	r1, #64	; 0x40
 80006c6:	9a00      	ldr	r2, [sp, #0]
 80006c8:	4b06      	ldr	r3, [pc, #24]	; (80006e4 <lcd_put_char_xy+0x54>)
 80006ca:	189b      	adds	r3, r3, r2
 80006cc:	5d1a      	ldrb	r2, [r3, r4]
 80006ce:	9b01      	ldr	r3, [sp, #4]
 80006d0:	3401      	adds	r4, #1
 80006d2:	401a      	ands	r2, r3
 80006d4:	f7ff fe8c 	bl	80003f0 <LCD_SH1106_set_pixel>
 80006d8:	2c10      	cmp	r4, #16
 80006da:	d1ea      	bne.n	80006b2 <lcd_put_char_xy+0x22>
 80006dc:	3501      	adds	r5, #1
 80006de:	2d08      	cmp	r5, #8
 80006e0:	d1e2      	bne.n	80006a8 <lcd_put_char_xy+0x18>
 80006e2:	bdf7      	pop	{r0, r1, r2, r4, r5, r6, r7, pc}
 80006e4:	08002779 	.word	0x08002779

080006e8 <lcd_put_int>:
 80006e8:	b5f0      	push	{r4, r5, r6, r7, lr}
 80006ea:	2300      	movs	r3, #0
 80006ec:	b087      	sub	sp, #28
 80006ee:	1c04      	adds	r4, r0, #0
 80006f0:	9100      	str	r1, [sp, #0]
 80006f2:	9201      	str	r2, [sp, #4]
 80006f4:	1c1f      	adds	r7, r3, #0
 80006f6:	4298      	cmp	r0, r3
 80006f8:	da01      	bge.n	80006fe <lcd_put_int+0x16>
 80006fa:	4244      	negs	r4, r0
 80006fc:	2701      	movs	r7, #1
 80006fe:	ae03      	add	r6, sp, #12
 8000700:	72f3      	strb	r3, [r6, #11]
 8000702:	250a      	movs	r5, #10
 8000704:	1c20      	adds	r0, r4, #0
 8000706:	210a      	movs	r1, #10
 8000708:	f001 ffd0 	bl	80026ac <__aeabi_idivmod>
 800070c:	3130      	adds	r1, #48	; 0x30
 800070e:	5571      	strb	r1, [r6, r5]
 8000710:	1c20      	adds	r0, r4, #0
 8000712:	210a      	movs	r1, #10
 8000714:	f001 ff74 	bl	8002600 <__aeabi_idiv>
 8000718:	1e6b      	subs	r3, r5, #1
 800071a:	1e04      	subs	r4, r0, #0
 800071c:	d001      	beq.n	8000722 <lcd_put_int+0x3a>
 800071e:	1c1d      	adds	r5, r3, #0
 8000720:	e7f0      	b.n	8000704 <lcd_put_int+0x1c>
 8000722:	2f00      	cmp	r7, #0
 8000724:	d002      	beq.n	800072c <lcd_put_int+0x44>
 8000726:	222d      	movs	r2, #45	; 0x2d
 8000728:	54f2      	strb	r2, [r6, r3]
 800072a:	1c1d      	adds	r5, r3, #0
 800072c:	2400      	movs	r4, #0
 800072e:	1973      	adds	r3, r6, r5
 8000730:	5d1f      	ldrb	r7, [r3, r4]
 8000732:	9b00      	ldr	r3, [sp, #0]
 8000734:	00e0      	lsls	r0, r4, #3
 8000736:	18c0      	adds	r0, r0, r3
 8000738:	9901      	ldr	r1, [sp, #4]
 800073a:	1c3a      	adds	r2, r7, #0
 800073c:	f7ff ffa8 	bl	8000690 <lcd_put_char_xy>
 8000740:	2f00      	cmp	r7, #0
 8000742:	d002      	beq.n	800074a <lcd_put_int+0x62>
 8000744:	3401      	adds	r4, #1
 8000746:	2c0c      	cmp	r4, #12
 8000748:	d1f1      	bne.n	800072e <lcd_put_int+0x46>
 800074a:	b007      	add	sp, #28
 800074c:	bdf0      	pop	{r4, r5, r6, r7, pc}
	...

08000750 <mpu6050_read>:
 8000750:	b538      	push	{r3, r4, r5, lr}
 8000752:	213b      	movs	r1, #59	; 0x3b
 8000754:	20d0      	movs	r0, #208	; 0xd0
 8000756:	f000 fc62 	bl	800101e <i2c_read_reg>
 800075a:	4c38      	ldr	r4, [pc, #224]	; (800083c <mpu6050_read+0xec>)
 800075c:	0205      	lsls	r5, r0, #8
 800075e:	b2ad      	uxth	r5, r5
 8000760:	213c      	movs	r1, #60	; 0x3c
 8000762:	20d0      	movs	r0, #208	; 0xd0
 8000764:	8025      	strh	r5, [r4, #0]
 8000766:	f000 fc5a 	bl	800101e <i2c_read_reg>
 800076a:	213d      	movs	r1, #61	; 0x3d
 800076c:	4305      	orrs	r5, r0
 800076e:	20d0      	movs	r0, #208	; 0xd0
 8000770:	8025      	strh	r5, [r4, #0]
 8000772:	f000 fc54 	bl	800101e <i2c_read_reg>
 8000776:	0205      	lsls	r5, r0, #8
 8000778:	b2ad      	uxth	r5, r5
 800077a:	213e      	movs	r1, #62	; 0x3e
 800077c:	20d0      	movs	r0, #208	; 0xd0
 800077e:	8065      	strh	r5, [r4, #2]
 8000780:	f000 fc4d 	bl	800101e <i2c_read_reg>
 8000784:	213f      	movs	r1, #63	; 0x3f
 8000786:	4305      	orrs	r5, r0
 8000788:	20d0      	movs	r0, #208	; 0xd0
 800078a:	8065      	strh	r5, [r4, #2]
 800078c:	f000 fc47 	bl	800101e <i2c_read_reg>
 8000790:	0205      	lsls	r5, r0, #8
 8000792:	b2ad      	uxth	r5, r5
 8000794:	2140      	movs	r1, #64	; 0x40
 8000796:	20d0      	movs	r0, #208	; 0xd0
 8000798:	80a5      	strh	r5, [r4, #4]
 800079a:	f000 fc40 	bl	800101e <i2c_read_reg>
 800079e:	2141      	movs	r1, #65	; 0x41
 80007a0:	4305      	orrs	r5, r0
 80007a2:	20d0      	movs	r0, #208	; 0xd0
 80007a4:	80a5      	strh	r5, [r4, #4]
 80007a6:	f000 fc3a 	bl	800101e <i2c_read_reg>
 80007aa:	0205      	lsls	r5, r0, #8
 80007ac:	b2ad      	uxth	r5, r5
 80007ae:	2142      	movs	r1, #66	; 0x42
 80007b0:	20d0      	movs	r0, #208	; 0xd0
 80007b2:	8425      	strh	r5, [r4, #32]
 80007b4:	f000 fc33 	bl	800101e <i2c_read_reg>
 80007b8:	2143      	movs	r1, #67	; 0x43
 80007ba:	4305      	orrs	r5, r0
 80007bc:	20d0      	movs	r0, #208	; 0xd0
 80007be:	8425      	strh	r5, [r4, #32]
 80007c0:	f000 fc2d 	bl	800101e <i2c_read_reg>
 80007c4:	0205      	lsls	r5, r0, #8
 80007c6:	b2ad      	uxth	r5, r5
 80007c8:	2144      	movs	r1, #68	; 0x44
 80007ca:	20d0      	movs	r0, #208	; 0xd0
 80007cc:	80e5      	strh	r5, [r4, #6]
 80007ce:	f000 fc26 	bl	800101e <i2c_read_reg>
 80007d2:	2145      	movs	r1, #69	; 0x45
 80007d4:	4305      	orrs	r5, r0
 80007d6:	20d0      	movs	r0, #208	; 0xd0
 80007d8:	80e5      	strh	r5, [r4, #6]
 80007da:	f000 fc20 	bl	800101e <i2c_read_reg>
 80007de:	0205      	lsls	r5, r0, #8
 80007e0:	b2ad      	uxth	r5, r5
 80007e2:	2146      	movs	r1, #70	; 0x46
 80007e4:	20d0      	movs	r0, #208	; 0xd0
 80007e6:	8125      	strh	r5, [r4, #8]
 80007e8:	f000 fc19 	bl	800101e <i2c_read_reg>
 80007ec:	2147      	movs	r1, #71	; 0x47
 80007ee:	4305      	orrs	r5, r0
 80007f0:	20d0      	movs	r0, #208	; 0xd0
 80007f2:	8125      	strh	r5, [r4, #8]
 80007f4:	f000 fc13 	bl	800101e <i2c_read_reg>
 80007f8:	0205      	lsls	r5, r0, #8
 80007fa:	2148      	movs	r1, #72	; 0x48
 80007fc:	b2ad      	uxth	r5, r5
 80007fe:	20d0      	movs	r0, #208	; 0xd0
 8000800:	8165      	strh	r5, [r4, #10]
 8000802:	f000 fc0c 	bl	800101e <i2c_read_reg>
 8000806:	2106      	movs	r1, #6
 8000808:	5e62      	ldrsh	r2, [r4, r1]
 800080a:	210c      	movs	r1, #12
 800080c:	5e63      	ldrsh	r3, [r4, r1]
 800080e:	4305      	orrs	r5, r0
 8000810:	1ad3      	subs	r3, r2, r3
 8000812:	6962      	ldr	r2, [r4, #20]
 8000814:	b2ad      	uxth	r5, r5
 8000816:	18d3      	adds	r3, r2, r3
 8000818:	6163      	str	r3, [r4, #20]
 800081a:	2308      	movs	r3, #8
 800081c:	5ee2      	ldrsh	r2, [r4, r3]
 800081e:	210e      	movs	r1, #14
 8000820:	5e63      	ldrsh	r3, [r4, r1]
 8000822:	8165      	strh	r5, [r4, #10]
 8000824:	1ad3      	subs	r3, r2, r3
 8000826:	69a2      	ldr	r2, [r4, #24]
 8000828:	b22d      	sxth	r5, r5
 800082a:	18d3      	adds	r3, r2, r3
 800082c:	61a3      	str	r3, [r4, #24]
 800082e:	2110      	movs	r1, #16
 8000830:	5e63      	ldrsh	r3, [r4, r1]
 8000832:	69e2      	ldr	r2, [r4, #28]
 8000834:	1aed      	subs	r5, r5, r3
 8000836:	1955      	adds	r5, r2, r5
 8000838:	61e5      	str	r5, [r4, #28]
 800083a:	bd38      	pop	{r3, r4, r5, pc}
 800083c:	200002fc 	.word	0x200002fc

08000840 <mpu6050_init>:
 8000840:	b5f7      	push	{r0, r1, r2, r4, r5, r6, r7, lr}
 8000842:	2600      	movs	r6, #0
 8000844:	4c1a      	ldr	r4, [pc, #104]	; (80008b0 <mpu6050_init+0x70>)
 8000846:	20d0      	movs	r0, #208	; 0xd0
 8000848:	216b      	movs	r1, #107	; 0x6b
 800084a:	1c32      	adds	r2, r6, #0
 800084c:	8026      	strh	r6, [r4, #0]
 800084e:	8066      	strh	r6, [r4, #2]
 8000850:	80a6      	strh	r6, [r4, #4]
 8000852:	80e6      	strh	r6, [r4, #6]
 8000854:	8126      	strh	r6, [r4, #8]
 8000856:	8166      	strh	r6, [r4, #10]
 8000858:	2564      	movs	r5, #100	; 0x64
 800085a:	f000 fbce 	bl	8000ffa <i2c_write_reg>
 800085e:	1c37      	adds	r7, r6, #0
 8000860:	9601      	str	r6, [sp, #4]
 8000862:	f7ff ff75 	bl	8000750 <mpu6050_read>
 8000866:	200a      	movs	r0, #10
 8000868:	f001 fd54 	bl	8002314 <timer_delay_ms>
 800086c:	2206      	movs	r2, #6
 800086e:	5ea3      	ldrsh	r3, [r4, r2]
 8000870:	3d01      	subs	r5, #1
 8000872:	18ff      	adds	r7, r7, r3
 8000874:	2208      	movs	r2, #8
 8000876:	5ea3      	ldrsh	r3, [r4, r2]
 8000878:	9a01      	ldr	r2, [sp, #4]
 800087a:	18d2      	adds	r2, r2, r3
 800087c:	9201      	str	r2, [sp, #4]
 800087e:	220a      	movs	r2, #10
 8000880:	5ea3      	ldrsh	r3, [r4, r2]
 8000882:	18f6      	adds	r6, r6, r3
 8000884:	2d00      	cmp	r5, #0
 8000886:	d1ec      	bne.n	8000862 <mpu6050_init+0x22>
 8000888:	1c38      	adds	r0, r7, #0
 800088a:	2164      	movs	r1, #100	; 0x64
 800088c:	f001 feb8 	bl	8002600 <__aeabi_idiv>
 8000890:	2164      	movs	r1, #100	; 0x64
 8000892:	81a0      	strh	r0, [r4, #12]
 8000894:	9801      	ldr	r0, [sp, #4]
 8000896:	f001 feb3 	bl	8002600 <__aeabi_idiv>
 800089a:	2164      	movs	r1, #100	; 0x64
 800089c:	81e0      	strh	r0, [r4, #14]
 800089e:	1c30      	adds	r0, r6, #0
 80008a0:	f001 feae 	bl	8002600 <__aeabi_idiv>
 80008a4:	6165      	str	r5, [r4, #20]
 80008a6:	61a5      	str	r5, [r4, #24]
 80008a8:	61e5      	str	r5, [r4, #28]
 80008aa:	8220      	strh	r0, [r4, #16]
 80008ac:	bdf7      	pop	{r0, r1, r2, r4, r5, r6, r7, pc}
 80008ae:	46c0      	nop			; (mov r8, r8)
 80008b0:	200002fc 	.word	0x200002fc

080008b4 <hmc5883_init>:
 80008b4:	b510      	push	{r4, lr}
 80008b6:	4b16      	ldr	r3, [pc, #88]	; (8000910 <hmc5883_init+0x5c>)
 80008b8:	2400      	movs	r4, #0
 80008ba:	203c      	movs	r0, #60	; 0x3c
 80008bc:	1c21      	adds	r1, r4, #0
 80008be:	2218      	movs	r2, #24
 80008c0:	801c      	strh	r4, [r3, #0]
 80008c2:	805c      	strh	r4, [r3, #2]
 80008c4:	809c      	strh	r4, [r3, #4]
 80008c6:	f000 fb98 	bl	8000ffa <i2c_write_reg>
 80008ca:	203c      	movs	r0, #60	; 0x3c
 80008cc:	2101      	movs	r1, #1
 80008ce:	1c22      	adds	r2, r4, #0
 80008d0:	f000 fb93 	bl	8000ffa <i2c_write_reg>
 80008d4:	203c      	movs	r0, #60	; 0x3c
 80008d6:	2102      	movs	r1, #2
 80008d8:	1c22      	adds	r2, r4, #0
 80008da:	f000 fb8e 	bl	8000ffa <i2c_write_reg>
 80008de:	203c      	movs	r0, #60	; 0x3c
 80008e0:	210a      	movs	r1, #10
 80008e2:	f000 fb9c 	bl	800101e <i2c_read_reg>
 80008e6:	2301      	movs	r3, #1
 80008e8:	2848      	cmp	r0, #72	; 0x48
 80008ea:	d10f      	bne.n	800090c <hmc5883_init+0x58>
 80008ec:	203c      	movs	r0, #60	; 0x3c
 80008ee:	210b      	movs	r1, #11
 80008f0:	f000 fb95 	bl	800101e <i2c_read_reg>
 80008f4:	2302      	movs	r3, #2
 80008f6:	2834      	cmp	r0, #52	; 0x34
 80008f8:	d108      	bne.n	800090c <hmc5883_init+0x58>
 80008fa:	203c      	movs	r0, #60	; 0x3c
 80008fc:	210c      	movs	r1, #12
 80008fe:	f000 fb8e 	bl	800101e <i2c_read_reg>
 8000902:	2833      	cmp	r0, #51	; 0x33
 8000904:	d001      	beq.n	800090a <hmc5883_init+0x56>
 8000906:	2303      	movs	r3, #3
 8000908:	e000      	b.n	800090c <hmc5883_init+0x58>
 800090a:	1c23      	adds	r3, r4, #0
 800090c:	1c18      	adds	r0, r3, #0
 800090e:	bd10      	pop	{r4, pc}
 8000910:	200002f6 	.word	0x200002f6

08000914 <hmc5883_read>:
 8000914:	b538      	push	{r3, r4, r5, lr}
 8000916:	2103      	movs	r1, #3
 8000918:	203c      	movs	r0, #60	; 0x3c
 800091a:	f000 fb80 	bl	800101e <i2c_read_reg>
 800091e:	4c12      	ldr	r4, [pc, #72]	; (8000968 <hmc5883_read+0x54>)
 8000920:	0205      	lsls	r5, r0, #8
 8000922:	b2ad      	uxth	r5, r5
 8000924:	2104      	movs	r1, #4
 8000926:	203c      	movs	r0, #60	; 0x3c
 8000928:	8025      	strh	r5, [r4, #0]
 800092a:	f000 fb78 	bl	800101e <i2c_read_reg>
 800092e:	2107      	movs	r1, #7
 8000930:	4305      	orrs	r5, r0
 8000932:	203c      	movs	r0, #60	; 0x3c
 8000934:	8025      	strh	r5, [r4, #0]
 8000936:	f000 fb72 	bl	800101e <i2c_read_reg>
 800093a:	0205      	lsls	r5, r0, #8
 800093c:	b2ad      	uxth	r5, r5
 800093e:	2108      	movs	r1, #8
 8000940:	203c      	movs	r0, #60	; 0x3c
 8000942:	8065      	strh	r5, [r4, #2]
 8000944:	f000 fb6b 	bl	800101e <i2c_read_reg>
 8000948:	2105      	movs	r1, #5
 800094a:	4305      	orrs	r5, r0
 800094c:	203c      	movs	r0, #60	; 0x3c
 800094e:	8065      	strh	r5, [r4, #2]
 8000950:	f000 fb65 	bl	800101e <i2c_read_reg>
 8000954:	0205      	lsls	r5, r0, #8
 8000956:	b2ad      	uxth	r5, r5
 8000958:	2106      	movs	r1, #6
 800095a:	203c      	movs	r0, #60	; 0x3c
 800095c:	80a5      	strh	r5, [r4, #4]
 800095e:	f000 fb5e 	bl	800101e <i2c_read_reg>
 8000962:	4305      	orrs	r5, r0
 8000964:	80a5      	strh	r5, [r4, #4]
 8000966:	bd38      	pop	{r3, r4, r5, pc}
 8000968:	200002f6 	.word	0x200002f6

0800096c <thread_ending>:
 800096c:	b672      	cpsid	i
 800096e:	4b05      	ldr	r3, [pc, #20]	; (8000984 <thread_ending+0x18>)
 8000970:	220c      	movs	r2, #12
 8000972:	681b      	ldr	r3, [r3, #0]
 8000974:	4353      	muls	r3, r2
 8000976:	4a04      	ldr	r2, [pc, #16]	; (8000988 <thread_ending+0x1c>)
 8000978:	18d3      	adds	r3, r2, r3
 800097a:	2200      	movs	r2, #0
 800097c:	605a      	str	r2, [r3, #4]
 800097e:	b662      	cpsie	i
 8000980:	46c0      	nop			; (mov r8, r8)
 8000982:	e7fd      	b.n	8000980 <thread_ending+0x14>
 8000984:	20000784 	.word	0x20000784
 8000988:	20000724 	.word	0x20000724

0800098c <null_thread>:
 800098c:	b508      	push	{r3, lr}
 800098e:	f000 fbe3 	bl	8001158 <sleep>
 8000992:	e7fc      	b.n	800098e <null_thread+0x2>

08000994 <scheduler>:
 8000994:	b5f0      	push	{r4, r5, r6, r7, lr}
 8000996:	2100      	movs	r1, #0
 8000998:	1c0a      	adds	r2, r1, #0
 800099a:	200c      	movs	r0, #12
 800099c:	1c05      	adds	r5, r0, #0
 800099e:	4355      	muls	r5, r2
 80009a0:	4b12      	ldr	r3, [pc, #72]	; (80009ec <scheduler+0x58>)
 80009a2:	195e      	adds	r6, r3, r5
 80009a4:	6874      	ldr	r4, [r6, #4]
 80009a6:	46a4      	mov	ip, r4
 80009a8:	4667      	mov	r7, ip
 80009aa:	1c1c      	adds	r4, r3, #0
 80009ac:	07bf      	lsls	r7, r7, #30
 80009ae:	d408      	bmi.n	80009c2 <scheduler+0x2e>
 80009b0:	6876      	ldr	r6, [r6, #4]
 80009b2:	07f7      	lsls	r7, r6, #31
 80009b4:	d505      	bpl.n	80009c2 <scheduler+0x2e>
 80009b6:	4348      	muls	r0, r1
 80009b8:	5b5d      	ldrh	r5, [r3, r5]
 80009ba:	5a18      	ldrh	r0, [r3, r0]
 80009bc:	4285      	cmp	r5, r0
 80009be:	d200      	bcs.n	80009c2 <scheduler+0x2e>
 80009c0:	1c11      	adds	r1, r2, #0
 80009c2:	200c      	movs	r0, #12
 80009c4:	4350      	muls	r0, r2
 80009c6:	5a1d      	ldrh	r5, [r3, r0]
 80009c8:	2d00      	cmp	r5, #0
 80009ca:	d003      	beq.n	80009d4 <scheduler+0x40>
 80009cc:	5a1d      	ldrh	r5, [r3, r0]
 80009ce:	3d01      	subs	r5, #1
 80009d0:	b2ad      	uxth	r5, r5
 80009d2:	521d      	strh	r5, [r3, r0]
 80009d4:	3201      	adds	r2, #1
 80009d6:	2a08      	cmp	r2, #8
 80009d8:	d1df      	bne.n	800099a <scheduler+0x6>
 80009da:	230c      	movs	r3, #12
 80009dc:	434b      	muls	r3, r1
 80009de:	18e2      	adds	r2, r4, r3
 80009e0:	8852      	ldrh	r2, [r2, #2]
 80009e2:	b292      	uxth	r2, r2
 80009e4:	52e2      	strh	r2, [r4, r3]
 80009e6:	4b02      	ldr	r3, [pc, #8]	; (80009f0 <scheduler+0x5c>)
 80009e8:	6019      	str	r1, [r3, #0]
 80009ea:	bdf0      	pop	{r4, r5, r6, r7, pc}
 80009ec:	20000724 	.word	0x20000724
 80009f0:	20000784 	.word	0x20000784

080009f4 <SysTick_Handler>:
 80009f4:	b4f0      	push	{r4, r5, r6, r7}
 80009f6:	4644      	mov	r4, r8
 80009f8:	464d      	mov	r5, r9
 80009fa:	4656      	mov	r6, sl
 80009fc:	465f      	mov	r7, fp
 80009fe:	b4f0      	push	{r4, r5, r6, r7}
 8000a00:	f3ef 8208 	mrs	r2, MSP
 8000a04:	4c0f      	ldr	r4, [pc, #60]	; (8000a44 <SysTick_Handler+0x50>)
 8000a06:	4d10      	ldr	r5, [pc, #64]	; (8000a48 <SysTick_Handler+0x54>)
 8000a08:	6823      	ldr	r3, [r4, #0]
 8000a0a:	3301      	adds	r3, #1
 8000a0c:	d005      	beq.n	8000a1a <SysTick_Handler+0x26>
 8000a0e:	6823      	ldr	r3, [r4, #0]
 8000a10:	210c      	movs	r1, #12
 8000a12:	434b      	muls	r3, r1
 8000a14:	18eb      	adds	r3, r5, r3
 8000a16:	609a      	str	r2, [r3, #8]
 8000a18:	e001      	b.n	8000a1e <SysTick_Handler+0x2a>
 8000a1a:	2300      	movs	r3, #0
 8000a1c:	6023      	str	r3, [r4, #0]
 8000a1e:	f7ff ffb9 	bl	8000994 <scheduler>
 8000a22:	6823      	ldr	r3, [r4, #0]
 8000a24:	220c      	movs	r2, #12
 8000a26:	4353      	muls	r3, r2
 8000a28:	18ed      	adds	r5, r5, r3
 8000a2a:	2307      	movs	r3, #7
 8000a2c:	68aa      	ldr	r2, [r5, #8]
 8000a2e:	425b      	negs	r3, r3
 8000a30:	469e      	mov	lr, r3
 8000a32:	f382 8808 	msr	MSP, r2
 8000a36:	bcf0      	pop	{r4, r5, r6, r7}
 8000a38:	46a0      	mov	r8, r4
 8000a3a:	46a9      	mov	r9, r5
 8000a3c:	46b2      	mov	sl, r6
 8000a3e:	46bb      	mov	fp, r7
 8000a40:	bcf0      	pop	{r4, r5, r6, r7}
 8000a42:	4770      	bx	lr
 8000a44:	20000784 	.word	0x20000784
 8000a48:	20000724 	.word	0x20000724

08000a4c <sched_off>:
 8000a4c:	b672      	cpsid	i
 8000a4e:	4770      	bx	lr

08000a50 <sched_on>:
 8000a50:	b662      	cpsie	i
 8000a52:	4770      	bx	lr

08000a54 <yield>:
 8000a54:	4770      	bx	lr
	...

08000a58 <get_thread_id>:
 8000a58:	b082      	sub	sp, #8
 8000a5a:	b672      	cpsid	i
 8000a5c:	4b03      	ldr	r3, [pc, #12]	; (8000a6c <get_thread_id+0x14>)
 8000a5e:	681b      	ldr	r3, [r3, #0]
 8000a60:	9301      	str	r3, [sp, #4]
 8000a62:	b662      	cpsie	i
 8000a64:	9801      	ldr	r0, [sp, #4]
 8000a66:	b002      	add	sp, #8
 8000a68:	4770      	bx	lr
 8000a6a:	46c0      	nop			; (mov r8, r8)
 8000a6c:	20000784 	.word	0x20000784

08000a70 <kernel_start>:
 8000a70:	b508      	push	{r3, lr}
 8000a72:	f000 fb65 	bl	8001140 <sys_tick_init>
 8000a76:	46c0      	nop			; (mov r8, r8)
 8000a78:	e7fd      	b.n	8000a76 <kernel_start+0x6>
	...

08000a7c <create_thread>:
 8000a7c:	b5f0      	push	{r4, r5, r6, r7, lr}
 8000a7e:	b085      	sub	sp, #20
 8000a80:	9003      	str	r0, [sp, #12]
 8000a82:	481b      	ldr	r0, [pc, #108]	; (8000af0 <create_thread+0x74>)
 8000a84:	0892      	lsrs	r2, r2, #2
 8000a86:	1812      	adds	r2, r2, r0
 8000a88:	0092      	lsls	r2, r2, #2
 8000a8a:	1888      	adds	r0, r1, r2
 8000a8c:	1c17      	adds	r7, r2, #0
 8000a8e:	9002      	str	r0, [sp, #8]
 8000a90:	1c10      	adds	r0, r2, #0
 8000a92:	323c      	adds	r2, #60	; 0x3c
 8000a94:	188a      	adds	r2, r1, r2
 8000a96:	3034      	adds	r0, #52	; 0x34
 8000a98:	3738      	adds	r7, #56	; 0x38
 8000a9a:	9201      	str	r2, [sp, #4]
 8000a9c:	180e      	adds	r6, r1, r0
 8000a9e:	19cf      	adds	r7, r1, r7
 8000aa0:	2200      	movs	r2, #0
 8000aa2:	b672      	cpsid	i
 8000aa4:	250c      	movs	r5, #12
 8000aa6:	4355      	muls	r5, r2
 8000aa8:	4c12      	ldr	r4, [pc, #72]	; (8000af4 <create_thread+0x78>)
 8000aaa:	2008      	movs	r0, #8
 8000aac:	1965      	adds	r5, r4, r5
 8000aae:	6869      	ldr	r1, [r5, #4]
 8000ab0:	07c9      	lsls	r1, r1, #31
 8000ab2:	d415      	bmi.n	8000ae0 <create_thread+0x64>
 8000ab4:	9902      	ldr	r1, [sp, #8]
 8000ab6:	60a9      	str	r1, [r5, #8]
 8000ab8:	4d0f      	ldr	r5, [pc, #60]	; (8000af8 <create_thread+0x7c>)
 8000aba:	9903      	ldr	r1, [sp, #12]
 8000abc:	6035      	str	r5, [r6, #0]
 8000abe:	6039      	str	r1, [r7, #0]
 8000ac0:	2584      	movs	r5, #132	; 0x84
 8000ac2:	9901      	ldr	r1, [sp, #4]
 8000ac4:	05ad      	lsls	r5, r5, #22
 8000ac6:	600d      	str	r5, [r1, #0]
 8000ac8:	2b07      	cmp	r3, #7
 8000aca:	d800      	bhi.n	8000ace <create_thread+0x52>
 8000acc:	1c03      	adds	r3, r0, #0
 8000ace:	200c      	movs	r0, #12
 8000ad0:	4350      	muls	r0, r2
 8000ad2:	4908      	ldr	r1, [pc, #32]	; (8000af4 <create_thread+0x78>)
 8000ad4:	180d      	adds	r5, r1, r0
 8000ad6:	806b      	strh	r3, [r5, #2]
 8000ad8:	5223      	strh	r3, [r4, r0]
 8000ada:	2001      	movs	r0, #1
 8000adc:	6068      	str	r0, [r5, #4]
 8000ade:	1c10      	adds	r0, r2, #0
 8000ae0:	b662      	cpsie	i
 8000ae2:	3201      	adds	r2, #1
 8000ae4:	2a08      	cmp	r2, #8
 8000ae6:	d001      	beq.n	8000aec <create_thread+0x70>
 8000ae8:	2808      	cmp	r0, #8
 8000aea:	d0da      	beq.n	8000aa2 <create_thread+0x26>
 8000aec:	b005      	add	sp, #20
 8000aee:	bdf0      	pop	{r4, r5, r6, r7, pc}
 8000af0:	3ffffff0 	.word	0x3ffffff0
 8000af4:	20000724 	.word	0x20000724
 8000af8:	0800096d 	.word	0x0800096d

08000afc <kernel_init>:
 8000afc:	b510      	push	{r4, lr}
 8000afe:	2300      	movs	r3, #0
 8000b00:	210c      	movs	r1, #12
 8000b02:	4359      	muls	r1, r3
 8000b04:	4a0a      	ldr	r2, [pc, #40]	; (8000b30 <kernel_init+0x34>)
 8000b06:	2000      	movs	r0, #0
 8000b08:	1854      	adds	r4, r2, r1
 8000b0a:	6060      	str	r0, [r4, #4]
 8000b0c:	3301      	adds	r3, #1
 8000b0e:	2008      	movs	r0, #8
 8000b10:	8060      	strh	r0, [r4, #2]
 8000b12:	5288      	strh	r0, [r1, r2]
 8000b14:	4283      	cmp	r3, r0
 8000b16:	d1f3      	bne.n	8000b00 <kernel_init+0x4>
 8000b18:	4b06      	ldr	r3, [pc, #24]	; (8000b34 <kernel_init+0x38>)
 8000b1a:	2201      	movs	r2, #1
 8000b1c:	4252      	negs	r2, r2
 8000b1e:	601a      	str	r2, [r3, #0]
 8000b20:	4905      	ldr	r1, [pc, #20]	; (8000b38 <kernel_init+0x3c>)
 8000b22:	2280      	movs	r2, #128	; 0x80
 8000b24:	23ff      	movs	r3, #255	; 0xff
 8000b26:	4805      	ldr	r0, [pc, #20]	; (8000b3c <kernel_init+0x40>)
 8000b28:	f7ff ffa8 	bl	8000a7c <create_thread>
 8000b2c:	bd10      	pop	{r4, pc}
 8000b2e:	46c0      	nop			; (mov r8, r8)
 8000b30:	20000724 	.word	0x20000724
 8000b34:	20000784 	.word	0x20000784
 8000b38:	20000788 	.word	0x20000788
 8000b3c:	0800098d 	.word	0x0800098d

08000b40 <set_wait_state>:
 8000b40:	b507      	push	{r0, r1, r2, lr}
 8000b42:	f7ff ff89 	bl	8000a58 <get_thread_id>
 8000b46:	9000      	str	r0, [sp, #0]
 8000b48:	b672      	cpsid	i
 8000b4a:	9a00      	ldr	r2, [sp, #0]
 8000b4c:	210c      	movs	r1, #12
 8000b4e:	434a      	muls	r2, r1
 8000b50:	4b09      	ldr	r3, [pc, #36]	; (8000b78 <set_wait_state+0x38>)
 8000b52:	2002      	movs	r0, #2
 8000b54:	189a      	adds	r2, r3, r2
 8000b56:	6851      	ldr	r1, [r2, #4]
 8000b58:	4301      	orrs	r1, r0
 8000b5a:	6051      	str	r1, [r2, #4]
 8000b5c:	b672      	cpsid	i
 8000b5e:	9a00      	ldr	r2, [sp, #0]
 8000b60:	210c      	movs	r1, #12
 8000b62:	434a      	muls	r2, r1
 8000b64:	189a      	adds	r2, r3, r2
 8000b66:	6852      	ldr	r2, [r2, #4]
 8000b68:	9201      	str	r2, [sp, #4]
 8000b6a:	b662      	cpsie	i
 8000b6c:	9a01      	ldr	r2, [sp, #4]
 8000b6e:	9a01      	ldr	r2, [sp, #4]
 8000b70:	0791      	lsls	r1, r2, #30
 8000b72:	d4f3      	bmi.n	8000b5c <set_wait_state+0x1c>
 8000b74:	bd07      	pop	{r0, r1, r2, pc}
 8000b76:	46c0      	nop			; (mov r8, r8)
 8000b78:	20000724 	.word	0x20000724

08000b7c <wake_up_threads>:
 8000b7c:	2300      	movs	r3, #0
 8000b7e:	b672      	cpsid	i
 8000b80:	220c      	movs	r2, #12
 8000b82:	435a      	muls	r2, r3
 8000b84:	4905      	ldr	r1, [pc, #20]	; (8000b9c <wake_up_threads+0x20>)
 8000b86:	2002      	movs	r0, #2
 8000b88:	188a      	adds	r2, r1, r2
 8000b8a:	6851      	ldr	r1, [r2, #4]
 8000b8c:	4381      	bics	r1, r0
 8000b8e:	6051      	str	r1, [r2, #4]
 8000b90:	b662      	cpsie	i
 8000b92:	3301      	adds	r3, #1
 8000b94:	2b08      	cmp	r3, #8
 8000b96:	d1f2      	bne.n	8000b7e <wake_up_threads+0x2>
 8000b98:	4770      	bx	lr
 8000b9a:	46c0      	nop			; (mov r8, r8)
 8000b9c:	20000724 	.word	0x20000724

08000ba0 <putc_>:
 8000ba0:	b538      	push	{r3, r4, r5, lr}
 8000ba2:	4c06      	ldr	r4, [pc, #24]	; (8000bbc <putc_+0x1c>)
 8000ba4:	1c05      	adds	r5, r0, #0
 8000ba6:	1c20      	adds	r0, r4, #0
 8000ba8:	f000 f911 	bl	8000dce <mutex_lock>
 8000bac:	1c28      	adds	r0, r5, #0
 8000bae:	f000 fb3f 	bl	8001230 <uart_write>
 8000bb2:	1c20      	adds	r0, r4, #0
 8000bb4:	f000 f927 	bl	8000e06 <mutex_unlock>
 8000bb8:	bd38      	pop	{r3, r4, r5, pc}
 8000bba:	46c0      	nop			; (mov r8, r8)
 8000bbc:	20000808 	.word	0x20000808

08000bc0 <puts_>:
 8000bc0:	b538      	push	{r3, r4, r5, lr}
 8000bc2:	4d08      	ldr	r5, [pc, #32]	; (8000be4 <puts_+0x24>)
 8000bc4:	1c04      	adds	r4, r0, #0
 8000bc6:	1c28      	adds	r0, r5, #0
 8000bc8:	f000 f901 	bl	8000dce <mutex_lock>
 8000bcc:	3401      	adds	r4, #1
 8000bce:	1e63      	subs	r3, r4, #1
 8000bd0:	7818      	ldrb	r0, [r3, #0]
 8000bd2:	2800      	cmp	r0, #0
 8000bd4:	d002      	beq.n	8000bdc <puts_+0x1c>
 8000bd6:	f7ff ffe3 	bl	8000ba0 <putc_>
 8000bda:	e7f7      	b.n	8000bcc <puts_+0xc>
 8000bdc:	1c28      	adds	r0, r5, #0
 8000bde:	f000 f912 	bl	8000e06 <mutex_unlock>
 8000be2:	bd38      	pop	{r3, r4, r5, pc}
 8000be4:	20000814 	.word	0x20000814

08000be8 <puti_>:
 8000be8:	b5f0      	push	{r4, r5, r6, r7, lr}
 8000bea:	2300      	movs	r3, #0
 8000bec:	b085      	sub	sp, #20
 8000bee:	1c04      	adds	r4, r0, #0
 8000bf0:	1c1f      	adds	r7, r3, #0
 8000bf2:	4298      	cmp	r0, r3
 8000bf4:	da01      	bge.n	8000bfa <puti_+0x12>
 8000bf6:	4244      	negs	r4, r0
 8000bf8:	2701      	movs	r7, #1
 8000bfa:	ae01      	add	r6, sp, #4
 8000bfc:	72f3      	strb	r3, [r6, #11]
 8000bfe:	250a      	movs	r5, #10
 8000c00:	1c20      	adds	r0, r4, #0
 8000c02:	210a      	movs	r1, #10
 8000c04:	f001 fd52 	bl	80026ac <__aeabi_idivmod>
 8000c08:	3130      	adds	r1, #48	; 0x30
 8000c0a:	5571      	strb	r1, [r6, r5]
 8000c0c:	1c20      	adds	r0, r4, #0
 8000c0e:	210a      	movs	r1, #10
 8000c10:	f001 fcf6 	bl	8002600 <__aeabi_idiv>
 8000c14:	1e6b      	subs	r3, r5, #1
 8000c16:	1e04      	subs	r4, r0, #0
 8000c18:	d001      	beq.n	8000c1e <puti_+0x36>
 8000c1a:	1c1d      	adds	r5, r3, #0
 8000c1c:	e7f0      	b.n	8000c00 <puti_+0x18>
 8000c1e:	2f00      	cmp	r7, #0
 8000c20:	d002      	beq.n	8000c28 <puti_+0x40>
 8000c22:	222d      	movs	r2, #45	; 0x2d
 8000c24:	54f2      	strb	r2, [r6, r3]
 8000c26:	1c1d      	adds	r5, r3, #0
 8000c28:	1970      	adds	r0, r6, r5
 8000c2a:	f7ff ffc9 	bl	8000bc0 <puts_>
 8000c2e:	b005      	add	sp, #20
 8000c30:	bdf0      	pop	{r4, r5, r6, r7, pc}

08000c32 <putui_>:
 8000c32:	b57f      	push	{r0, r1, r2, r3, r4, r5, r6, lr}
 8000c34:	2300      	movs	r3, #0
 8000c36:	ae01      	add	r6, sp, #4
 8000c38:	1c05      	adds	r5, r0, #0
 8000c3a:	72f3      	strb	r3, [r6, #11]
 8000c3c:	240a      	movs	r4, #10
 8000c3e:	1c28      	adds	r0, r5, #0
 8000c40:	210a      	movs	r1, #10
 8000c42:	f001 fcd3 	bl	80025ec <__aeabi_uidivmod>
 8000c46:	3130      	adds	r1, #48	; 0x30
 8000c48:	5531      	strb	r1, [r6, r4]
 8000c4a:	1c28      	adds	r0, r5, #0
 8000c4c:	210a      	movs	r1, #10
 8000c4e:	f001 fc89 	bl	8002564 <__aeabi_uidiv>
 8000c52:	1e63      	subs	r3, r4, #1
 8000c54:	1e05      	subs	r5, r0, #0
 8000c56:	d001      	beq.n	8000c5c <putui_+0x2a>
 8000c58:	1c1c      	adds	r4, r3, #0
 8000c5a:	e7f0      	b.n	8000c3e <putui_+0xc>
 8000c5c:	1930      	adds	r0, r6, r4
 8000c5e:	f7ff ffaf 	bl	8000bc0 <puts_>
 8000c62:	bd7f      	pop	{r0, r1, r2, r3, r4, r5, r6, pc}

08000c64 <putx_>:
 8000c64:	b51f      	push	{r0, r1, r2, r3, r4, lr}
 8000c66:	2300      	movs	r3, #0
 8000c68:	aa01      	add	r2, sp, #4
 8000c6a:	72d3      	strb	r3, [r2, #11]
 8000c6c:	230a      	movs	r3, #10
 8000c6e:	210f      	movs	r1, #15
 8000c70:	4001      	ands	r1, r0
 8000c72:	2909      	cmp	r1, #9
 8000c74:	d801      	bhi.n	8000c7a <putx_+0x16>
 8000c76:	3130      	adds	r1, #48	; 0x30
 8000c78:	e000      	b.n	8000c7c <putx_+0x18>
 8000c7a:	3157      	adds	r1, #87	; 0x57
 8000c7c:	54d1      	strb	r1, [r2, r3]
 8000c7e:	0900      	lsrs	r0, r0, #4
 8000c80:	1e59      	subs	r1, r3, #1
 8000c82:	2800      	cmp	r0, #0
 8000c84:	d001      	beq.n	8000c8a <putx_+0x26>
 8000c86:	1c0b      	adds	r3, r1, #0
 8000c88:	e7f1      	b.n	8000c6e <putx_+0xa>
 8000c8a:	18d0      	adds	r0, r2, r3
 8000c8c:	f7ff ff98 	bl	8000bc0 <puts_>
 8000c90:	b005      	add	sp, #20
 8000c92:	bd00      	pop	{pc}

08000c94 <printf_>:
 8000c94:	b40f      	push	{r0, r1, r2, r3}
 8000c96:	b573      	push	{r0, r1, r4, r5, r6, lr}
 8000c98:	4e25      	ldr	r6, [pc, #148]	; (8000d30 <printf_+0x9c>)
 8000c9a:	ac06      	add	r4, sp, #24
 8000c9c:	cc20      	ldmia	r4!, {r5}
 8000c9e:	1c30      	adds	r0, r6, #0
 8000ca0:	f000 f895 	bl	8000dce <mutex_lock>
 8000ca4:	9401      	str	r4, [sp, #4]
 8000ca6:	2400      	movs	r4, #0
 8000ca8:	5d28      	ldrb	r0, [r5, r4]
 8000caa:	2800      	cmp	r0, #0
 8000cac:	d039      	beq.n	8000d22 <printf_+0x8e>
 8000cae:	2825      	cmp	r0, #37	; 0x25
 8000cb0:	d003      	beq.n	8000cba <printf_+0x26>
 8000cb2:	f7ff ff75 	bl	8000ba0 <putc_>
 8000cb6:	3401      	adds	r4, #1
 8000cb8:	e7f6      	b.n	8000ca8 <printf_+0x14>
 8000cba:	192b      	adds	r3, r5, r4
 8000cbc:	7858      	ldrb	r0, [r3, #1]
 8000cbe:	2869      	cmp	r0, #105	; 0x69
 8000cc0:	d016      	beq.n	8000cf0 <printf_+0x5c>
 8000cc2:	d808      	bhi.n	8000cd6 <printf_+0x42>
 8000cc4:	2825      	cmp	r0, #37	; 0x25
 8000cc6:	d028      	beq.n	8000d1a <printf_+0x86>
 8000cc8:	2863      	cmp	r0, #99	; 0x63
 8000cca:	d128      	bne.n	8000d1e <printf_+0x8a>
 8000ccc:	9b01      	ldr	r3, [sp, #4]
 8000cce:	1d1a      	adds	r2, r3, #4
 8000cd0:	9201      	str	r2, [sp, #4]
 8000cd2:	7818      	ldrb	r0, [r3, #0]
 8000cd4:	e021      	b.n	8000d1a <printf_+0x86>
 8000cd6:	2875      	cmp	r0, #117	; 0x75
 8000cd8:	d011      	beq.n	8000cfe <printf_+0x6a>
 8000cda:	2878      	cmp	r0, #120	; 0x78
 8000cdc:	d016      	beq.n	8000d0c <printf_+0x78>
 8000cde:	2873      	cmp	r0, #115	; 0x73
 8000ce0:	d11d      	bne.n	8000d1e <printf_+0x8a>
 8000ce2:	9b01      	ldr	r3, [sp, #4]
 8000ce4:	1d1a      	adds	r2, r3, #4
 8000ce6:	6818      	ldr	r0, [r3, #0]
 8000ce8:	9201      	str	r2, [sp, #4]
 8000cea:	f7ff ff69 	bl	8000bc0 <puts_>
 8000cee:	e016      	b.n	8000d1e <printf_+0x8a>
 8000cf0:	9b01      	ldr	r3, [sp, #4]
 8000cf2:	1d1a      	adds	r2, r3, #4
 8000cf4:	6818      	ldr	r0, [r3, #0]
 8000cf6:	9201      	str	r2, [sp, #4]
 8000cf8:	f7ff ff76 	bl	8000be8 <puti_>
 8000cfc:	e00f      	b.n	8000d1e <printf_+0x8a>
 8000cfe:	9b01      	ldr	r3, [sp, #4]
 8000d00:	1d1a      	adds	r2, r3, #4
 8000d02:	6818      	ldr	r0, [r3, #0]
 8000d04:	9201      	str	r2, [sp, #4]
 8000d06:	f7ff ff94 	bl	8000c32 <putui_>
 8000d0a:	e008      	b.n	8000d1e <printf_+0x8a>
 8000d0c:	9b01      	ldr	r3, [sp, #4]
 8000d0e:	1d1a      	adds	r2, r3, #4
 8000d10:	6818      	ldr	r0, [r3, #0]
 8000d12:	9201      	str	r2, [sp, #4]
 8000d14:	f7ff ffa6 	bl	8000c64 <putx_>
 8000d18:	e001      	b.n	8000d1e <printf_+0x8a>
 8000d1a:	f7ff ff41 	bl	8000ba0 <putc_>
 8000d1e:	3402      	adds	r4, #2
 8000d20:	e7c2      	b.n	8000ca8 <printf_+0x14>
 8000d22:	1c30      	adds	r0, r6, #0
 8000d24:	f000 f86f 	bl	8000e06 <mutex_unlock>
 8000d28:	bc73      	pop	{r0, r1, r4, r5, r6}
 8000d2a:	bc08      	pop	{r3}
 8000d2c:	b004      	add	sp, #16
 8000d2e:	4718      	bx	r3
 8000d30:	20000810 	.word	0x20000810

08000d34 <stdio_init>:
 8000d34:	b510      	push	{r4, lr}
 8000d36:	480f      	ldr	r0, [pc, #60]	; (8000d74 <stdio_init+0x40>)
 8000d38:	f000 f840 	bl	8000dbc <mutex_init>
 8000d3c:	480e      	ldr	r0, [pc, #56]	; (8000d78 <stdio_init+0x44>)
 8000d3e:	f000 f83d 	bl	8000dbc <mutex_init>
 8000d42:	480e      	ldr	r0, [pc, #56]	; (8000d7c <stdio_init+0x48>)
 8000d44:	f000 f83a 	bl	8000dbc <mutex_init>
 8000d48:	480d      	ldr	r0, [pc, #52]	; (8000d80 <stdio_init+0x4c>)
 8000d4a:	f000 f837 	bl	8000dbc <mutex_init>
 8000d4e:	2408      	movs	r4, #8
 8000d50:	2020      	movs	r0, #32
 8000d52:	3c01      	subs	r4, #1
 8000d54:	f7ff ff24 	bl	8000ba0 <putc_>
 8000d58:	2c00      	cmp	r4, #0
 8000d5a:	d1f9      	bne.n	8000d50 <stdio_init+0x1c>
 8000d5c:	2420      	movs	r4, #32
 8000d5e:	200a      	movs	r0, #10
 8000d60:	3c01      	subs	r4, #1
 8000d62:	f7ff ff1d 	bl	8000ba0 <putc_>
 8000d66:	2c00      	cmp	r4, #0
 8000d68:	d1f9      	bne.n	8000d5e <stdio_init+0x2a>
 8000d6a:	4806      	ldr	r0, [pc, #24]	; (8000d84 <stdio_init+0x50>)
 8000d6c:	f7ff ff92 	bl	8000c94 <printf_>
 8000d70:	bd10      	pop	{r4, pc}
 8000d72:	46c0      	nop			; (mov r8, r8)
 8000d74:	20000808 	.word	0x20000808
 8000d78:	2000080c 	.word	0x2000080c
 8000d7c:	20000814 	.word	0x20000814
 8000d80:	20000810 	.word	0x20000810
 8000d84:	08002d79 	.word	0x08002d79

08000d88 <messages_init>:
 8000d88:	b510      	push	{r4, lr}
 8000d8a:	2200      	movs	r2, #0
 8000d8c:	4909      	ldr	r1, [pc, #36]	; (8000db4 <messages_init+0x2c>)
 8000d8e:	0090      	lsls	r0, r2, #2
 8000d90:	2300      	movs	r3, #0
 8000d92:	3201      	adds	r2, #1
 8000d94:	5043      	str	r3, [r0, r1]
 8000d96:	2a08      	cmp	r2, #8
 8000d98:	d1f8      	bne.n	8000d8c <messages_init+0x4>
 8000d9a:	4807      	ldr	r0, [pc, #28]	; (8000db8 <messages_init+0x30>)
 8000d9c:	011c      	lsls	r4, r3, #4
 8000d9e:	2200      	movs	r2, #0
 8000da0:	1901      	adds	r1, r0, r4
 8000da2:	3301      	adds	r3, #1
 8000da4:	604a      	str	r2, [r1, #4]
 8000da6:	5022      	str	r2, [r4, r0]
 8000da8:	60ca      	str	r2, [r1, #12]
 8000daa:	608a      	str	r2, [r1, #8]
 8000dac:	2b04      	cmp	r3, #4
 8000dae:	d1f4      	bne.n	8000d9a <messages_init+0x12>
 8000db0:	bd10      	pop	{r4, pc}
 8000db2:	46c0      	nop			; (mov r8, r8)
 8000db4:	20000818 	.word	0x20000818
 8000db8:	20000838 	.word	0x20000838

08000dbc <mutex_init>:
 8000dbc:	b510      	push	{r4, lr}
 8000dbe:	1c04      	adds	r4, r0, #0
 8000dc0:	f7ff fe44 	bl	8000a4c <sched_off>
 8000dc4:	2300      	movs	r3, #0
 8000dc6:	6023      	str	r3, [r4, #0]
 8000dc8:	f7ff fe42 	bl	8000a50 <sched_on>
 8000dcc:	bd10      	pop	{r4, pc}

08000dce <mutex_lock>:
 8000dce:	b513      	push	{r0, r1, r4, lr}
 8000dd0:	1c04      	adds	r4, r0, #0
 8000dd2:	f7ff fe3b 	bl	8000a4c <sched_off>
 8000dd6:	6823      	ldr	r3, [r4, #0]
 8000dd8:	9301      	str	r3, [sp, #4]
 8000dda:	f7ff fe39 	bl	8000a50 <sched_on>
 8000dde:	9b01      	ldr	r3, [sp, #4]
 8000de0:	2b00      	cmp	r3, #0
 8000de2:	d001      	beq.n	8000de8 <mutex_lock+0x1a>
 8000de4:	f7ff feac 	bl	8000b40 <set_wait_state>
 8000de8:	9b01      	ldr	r3, [sp, #4]
 8000dea:	2b00      	cmp	r3, #0
 8000dec:	d1f1      	bne.n	8000dd2 <mutex_lock+0x4>
 8000dee:	f7ff fe2d 	bl	8000a4c <sched_off>
 8000df2:	6823      	ldr	r3, [r4, #0]
 8000df4:	9301      	str	r3, [sp, #4]
 8000df6:	9b01      	ldr	r3, [sp, #4]
 8000df8:	2b00      	cmp	r3, #0
 8000dfa:	d1ea      	bne.n	8000dd2 <mutex_lock+0x4>
 8000dfc:	2301      	movs	r3, #1
 8000dfe:	6023      	str	r3, [r4, #0]
 8000e00:	f7ff fe26 	bl	8000a50 <sched_on>
 8000e04:	bd13      	pop	{r0, r1, r4, pc}

08000e06 <mutex_unlock>:
 8000e06:	b508      	push	{r3, lr}
 8000e08:	f7ff ffd8 	bl	8000dbc <mutex_init>
 8000e0c:	f7ff feb6 	bl	8000b7c <wake_up_threads>
 8000e10:	f7ff fe20 	bl	8000a54 <yield>
 8000e14:	bd08      	pop	{r3, pc}

08000e16 <lib_os_init>:
 8000e16:	b508      	push	{r3, lr}
 8000e18:	f7ff fe70 	bl	8000afc <kernel_init>
 8000e1c:	f7ff ffb4 	bl	8000d88 <messages_init>
 8000e20:	f7ff ff88 	bl	8000d34 <stdio_init>
 8000e24:	bd08      	pop	{r3, pc}

08000e26 <Default_Handler>:
 8000e26:	4770      	bx	lr

08000e28 <HardFault_Handler>:
 8000e28:	2008      	movs	r0, #8
 8000e2a:	f000 f95f 	bl	80010ec <led_on>
 8000e2e:	4b07      	ldr	r3, [pc, #28]	; (8000e4c <HardFault_Handler+0x24>)
 8000e30:	3b01      	subs	r3, #1
 8000e32:	2b00      	cmp	r3, #0
 8000e34:	d001      	beq.n	8000e3a <HardFault_Handler+0x12>
 8000e36:	46c0      	nop			; (mov r8, r8)
 8000e38:	e7fa      	b.n	8000e30 <HardFault_Handler+0x8>
 8000e3a:	2008      	movs	r0, #8
 8000e3c:	f000 f96a 	bl	8001114 <led_off>
 8000e40:	4b02      	ldr	r3, [pc, #8]	; (8000e4c <HardFault_Handler+0x24>)
 8000e42:	3b01      	subs	r3, #1
 8000e44:	2b00      	cmp	r3, #0
 8000e46:	d0ef      	beq.n	8000e28 <HardFault_Handler>
 8000e48:	46c0      	nop			; (mov r8, r8)
 8000e4a:	e7fa      	b.n	8000e42 <HardFault_Handler+0x1a>
 8000e4c:	002dc6c1 	.word	0x002dc6c1

08000e50 <_reset_init>:
 8000e50:	4a07      	ldr	r2, [pc, #28]	; (8000e70 <_reset_init+0x20>)
 8000e52:	4908      	ldr	r1, [pc, #32]	; (8000e74 <_reset_init+0x24>)
 8000e54:	2300      	movs	r3, #0
 8000e56:	1a89      	subs	r1, r1, r2
 8000e58:	1089      	asrs	r1, r1, #2
 8000e5a:	1c10      	adds	r0, r2, #0
 8000e5c:	428b      	cmp	r3, r1
 8000e5e:	d005      	beq.n	8000e6c <_reset_init+0x1c>
 8000e60:	4c05      	ldr	r4, [pc, #20]	; (8000e78 <_reset_init+0x28>)
 8000e62:	009a      	lsls	r2, r3, #2
 8000e64:	58a4      	ldr	r4, [r4, r2]
 8000e66:	3301      	adds	r3, #1
 8000e68:	5084      	str	r4, [r0, r2]
 8000e6a:	e7f7      	b.n	8000e5c <_reset_init+0xc>
 8000e6c:	f7ff f95e 	bl	800012c <main>
 8000e70:	20000000 	.word	0x20000000
 8000e74:	20000010 	.word	0x20000010
 8000e78:	08002d90 	.word	0x08002d90

08000e7c <i2c_delay>:
 8000e7c:	46c0      	nop			; (mov r8, r8)
 8000e7e:	46c0      	nop			; (mov r8, r8)
 8000e80:	4770      	bx	lr

08000e82 <SetLowSDA>:
 8000e82:	b508      	push	{r3, lr}
 8000e84:	b672      	cpsid	i
 8000e86:	2390      	movs	r3, #144	; 0x90
 8000e88:	2280      	movs	r2, #128	; 0x80
 8000e8a:	05db      	lsls	r3, r3, #23
 8000e8c:	0112      	lsls	r2, r2, #4
 8000e8e:	851a      	strh	r2, [r3, #40]	; 0x28
 8000e90:	889a      	ldrh	r2, [r3, #4]
 8000e92:	b292      	uxth	r2, r2
 8000e94:	809a      	strh	r2, [r3, #4]
 8000e96:	6819      	ldr	r1, [r3, #0]
 8000e98:	2280      	movs	r2, #128	; 0x80
 8000e9a:	03d2      	lsls	r2, r2, #15
 8000e9c:	430a      	orrs	r2, r1
 8000e9e:	601a      	str	r2, [r3, #0]
 8000ea0:	b662      	cpsie	i
 8000ea2:	f7ff ffeb 	bl	8000e7c <i2c_delay>
 8000ea6:	bd08      	pop	{r3, pc}

08000ea8 <SetHighSDA>:
 8000ea8:	b508      	push	{r3, lr}
 8000eaa:	b672      	cpsid	i
 8000eac:	2390      	movs	r3, #144	; 0x90
 8000eae:	2280      	movs	r2, #128	; 0x80
 8000eb0:	05db      	lsls	r3, r3, #23
 8000eb2:	0112      	lsls	r2, r2, #4
 8000eb4:	619a      	str	r2, [r3, #24]
 8000eb6:	8899      	ldrh	r1, [r3, #4]
 8000eb8:	4a05      	ldr	r2, [pc, #20]	; (8000ed0 <SetHighSDA+0x28>)
 8000eba:	400a      	ands	r2, r1
 8000ebc:	809a      	strh	r2, [r3, #4]
 8000ebe:	6819      	ldr	r1, [r3, #0]
 8000ec0:	4a04      	ldr	r2, [pc, #16]	; (8000ed4 <SetHighSDA+0x2c>)
 8000ec2:	400a      	ands	r2, r1
 8000ec4:	601a      	str	r2, [r3, #0]
 8000ec6:	b662      	cpsie	i
 8000ec8:	f7ff ffd8 	bl	8000e7c <i2c_delay>
 8000ecc:	bd08      	pop	{r3, pc}
 8000ece:	46c0      	nop			; (mov r8, r8)
 8000ed0:	fffff7ff 	.word	0xfffff7ff
 8000ed4:	ff3fffff 	.word	0xff3fffff

08000ed8 <SetLowSCL>:
 8000ed8:	b508      	push	{r3, lr}
 8000eda:	2280      	movs	r2, #128	; 0x80
 8000edc:	2390      	movs	r3, #144	; 0x90
 8000ede:	0052      	lsls	r2, r2, #1
 8000ee0:	05db      	lsls	r3, r3, #23
 8000ee2:	851a      	strh	r2, [r3, #40]	; 0x28
 8000ee4:	f7ff ffca 	bl	8000e7c <i2c_delay>
 8000ee8:	bd08      	pop	{r3, pc}

08000eea <SetHighSCL>:
 8000eea:	b508      	push	{r3, lr}
 8000eec:	2280      	movs	r2, #128	; 0x80
 8000eee:	2390      	movs	r3, #144	; 0x90
 8000ef0:	0052      	lsls	r2, r2, #1
 8000ef2:	05db      	lsls	r3, r3, #23
 8000ef4:	619a      	str	r2, [r3, #24]
 8000ef6:	f7ff ffc1 	bl	8000e7c <i2c_delay>
 8000efa:	bd08      	pop	{r3, pc}

08000efc <i2c_0_init>:
 8000efc:	b507      	push	{r0, r1, r2, lr}
 8000efe:	2390      	movs	r3, #144	; 0x90
 8000f00:	011b      	lsls	r3, r3, #4
 8000f02:	4669      	mov	r1, sp
 8000f04:	9300      	str	r3, [sp, #0]
 8000f06:	2090      	movs	r0, #144	; 0x90
 8000f08:	2301      	movs	r3, #1
 8000f0a:	710b      	strb	r3, [r1, #4]
 8000f0c:	2203      	movs	r2, #3
 8000f0e:	2300      	movs	r3, #0
 8000f10:	05c0      	lsls	r0, r0, #23
 8000f12:	718b      	strb	r3, [r1, #6]
 8000f14:	714a      	strb	r2, [r1, #5]
 8000f16:	71cb      	strb	r3, [r1, #7]
 8000f18:	f000 fd40 	bl	800199c <GPIO_Init>
 8000f1c:	f7ff ffe5 	bl	8000eea <SetHighSCL>
 8000f20:	f7ff ffaf 	bl	8000e82 <SetLowSDA>
 8000f24:	f7ff ffc0 	bl	8000ea8 <SetHighSDA>
 8000f28:	bd07      	pop	{r0, r1, r2, pc}

08000f2a <i2cStart>:
 8000f2a:	b508      	push	{r3, lr}
 8000f2c:	f7ff ffdd 	bl	8000eea <SetHighSCL>
 8000f30:	f7ff ffba 	bl	8000ea8 <SetHighSDA>
 8000f34:	f7ff ffd9 	bl	8000eea <SetHighSCL>
 8000f38:	f7ff ffa3 	bl	8000e82 <SetLowSDA>
 8000f3c:	f7ff ffcc 	bl	8000ed8 <SetLowSCL>
 8000f40:	f7ff ffb2 	bl	8000ea8 <SetHighSDA>
 8000f44:	bd08      	pop	{r3, pc}

08000f46 <i2cStop>:
 8000f46:	b508      	push	{r3, lr}
 8000f48:	f7ff ffc6 	bl	8000ed8 <SetLowSCL>
 8000f4c:	f7ff ff99 	bl	8000e82 <SetLowSDA>
 8000f50:	f7ff ffcb 	bl	8000eea <SetHighSCL>
 8000f54:	f7ff ff95 	bl	8000e82 <SetLowSDA>
 8000f58:	f7ff ffc7 	bl	8000eea <SetHighSCL>
 8000f5c:	f7ff ffa4 	bl	8000ea8 <SetHighSDA>
 8000f60:	bd08      	pop	{r3, pc}

08000f62 <i2cWrite>:
 8000f62:	b538      	push	{r3, r4, r5, lr}
 8000f64:	1c05      	adds	r5, r0, #0
 8000f66:	2408      	movs	r4, #8
 8000f68:	f7ff ffb6 	bl	8000ed8 <SetLowSCL>
 8000f6c:	b26b      	sxtb	r3, r5
 8000f6e:	2b00      	cmp	r3, #0
 8000f70:	da02      	bge.n	8000f78 <i2cWrite+0x16>
 8000f72:	f7ff ff99 	bl	8000ea8 <SetHighSDA>
 8000f76:	e001      	b.n	8000f7c <i2cWrite+0x1a>
 8000f78:	f7ff ff83 	bl	8000e82 <SetLowSDA>
 8000f7c:	3c01      	subs	r4, #1
 8000f7e:	006d      	lsls	r5, r5, #1
 8000f80:	b2e4      	uxtb	r4, r4
 8000f82:	f7ff ffb2 	bl	8000eea <SetHighSCL>
 8000f86:	b2ed      	uxtb	r5, r5
 8000f88:	2c00      	cmp	r4, #0
 8000f8a:	d1ed      	bne.n	8000f68 <i2cWrite+0x6>
 8000f8c:	f7ff ffa4 	bl	8000ed8 <SetLowSCL>
 8000f90:	f7ff ff8a 	bl	8000ea8 <SetHighSDA>
 8000f94:	f7ff ffa9 	bl	8000eea <SetHighSCL>
 8000f98:	2390      	movs	r3, #144	; 0x90
 8000f9a:	05db      	lsls	r3, r3, #23
 8000f9c:	8a1c      	ldrh	r4, [r3, #16]
 8000f9e:	f7ff ff9b 	bl	8000ed8 <SetLowSCL>
 8000fa2:	b2a4      	uxth	r4, r4
 8000fa4:	f7ff ff6a 	bl	8000e7c <i2c_delay>
 8000fa8:	0ae4      	lsrs	r4, r4, #11
 8000faa:	2001      	movs	r0, #1
 8000fac:	43a0      	bics	r0, r4
 8000fae:	bd38      	pop	{r3, r4, r5, pc}

08000fb0 <i2cRead>:
 8000fb0:	b570      	push	{r4, r5, r6, lr}
 8000fb2:	1c06      	adds	r6, r0, #0
 8000fb4:	f7ff ff90 	bl	8000ed8 <SetLowSCL>
 8000fb8:	f7ff ff76 	bl	8000ea8 <SetHighSDA>
 8000fbc:	2508      	movs	r5, #8
 8000fbe:	2400      	movs	r4, #0
 8000fc0:	f7ff ff93 	bl	8000eea <SetHighSCL>
 8000fc4:	2390      	movs	r3, #144	; 0x90
 8000fc6:	05db      	lsls	r3, r3, #23
 8000fc8:	8a1b      	ldrh	r3, [r3, #16]
 8000fca:	0064      	lsls	r4, r4, #1
 8000fcc:	b2e4      	uxtb	r4, r4
 8000fce:	051a      	lsls	r2, r3, #20
 8000fd0:	d501      	bpl.n	8000fd6 <i2cRead+0x26>
 8000fd2:	3401      	adds	r4, #1
 8000fd4:	b2e4      	uxtb	r4, r4
 8000fd6:	3d01      	subs	r5, #1
 8000fd8:	b2ed      	uxtb	r5, r5
 8000fda:	f7ff ff7d 	bl	8000ed8 <SetLowSCL>
 8000fde:	2d00      	cmp	r5, #0
 8000fe0:	d1ee      	bne.n	8000fc0 <i2cRead+0x10>
 8000fe2:	2e00      	cmp	r6, #0
 8000fe4:	d001      	beq.n	8000fea <i2cRead+0x3a>
 8000fe6:	f7ff ff4c 	bl	8000e82 <SetLowSDA>
 8000fea:	f7ff ff7e 	bl	8000eea <SetHighSCL>
 8000fee:	f7ff ff73 	bl	8000ed8 <SetLowSCL>
 8000ff2:	f7ff ff43 	bl	8000e7c <i2c_delay>
 8000ff6:	1c20      	adds	r0, r4, #0
 8000ff8:	bd70      	pop	{r4, r5, r6, pc}

08000ffa <i2c_write_reg>:
 8000ffa:	b570      	push	{r4, r5, r6, lr}
 8000ffc:	1c06      	adds	r6, r0, #0
 8000ffe:	1c0d      	adds	r5, r1, #0
 8001000:	1c14      	adds	r4, r2, #0
 8001002:	f7ff ff92 	bl	8000f2a <i2cStart>
 8001006:	1c30      	adds	r0, r6, #0
 8001008:	f7ff ffab 	bl	8000f62 <i2cWrite>
 800100c:	1c28      	adds	r0, r5, #0
 800100e:	f7ff ffa8 	bl	8000f62 <i2cWrite>
 8001012:	1c20      	adds	r0, r4, #0
 8001014:	f7ff ffa5 	bl	8000f62 <i2cWrite>
 8001018:	f7ff ff95 	bl	8000f46 <i2cStop>
 800101c:	bd70      	pop	{r4, r5, r6, pc}

0800101e <i2c_read_reg>:
 800101e:	b538      	push	{r3, r4, r5, lr}
 8001020:	1c04      	adds	r4, r0, #0
 8001022:	1c0d      	adds	r5, r1, #0
 8001024:	f7ff ff81 	bl	8000f2a <i2cStart>
 8001028:	1c20      	adds	r0, r4, #0
 800102a:	f7ff ff9a 	bl	8000f62 <i2cWrite>
 800102e:	1c28      	adds	r0, r5, #0
 8001030:	f7ff ff97 	bl	8000f62 <i2cWrite>
 8001034:	f7ff ff79 	bl	8000f2a <i2cStart>
 8001038:	2001      	movs	r0, #1
 800103a:	4320      	orrs	r0, r4
 800103c:	f7ff ff91 	bl	8000f62 <i2cWrite>
 8001040:	2000      	movs	r0, #0
 8001042:	f7ff ffb5 	bl	8000fb0 <i2cRead>
 8001046:	1c04      	adds	r4, r0, #0
 8001048:	f7ff ff7d 	bl	8000f46 <i2cStop>
 800104c:	1c20      	adds	r0, r4, #0
 800104e:	bd38      	pop	{r3, r4, r5, pc}

08001050 <gpio_init>:
 8001050:	b5f7      	push	{r0, r1, r2, r4, r5, r6, r7, lr}
 8001052:	2080      	movs	r0, #128	; 0x80
 8001054:	0280      	lsls	r0, r0, #10
 8001056:	2101      	movs	r1, #1
 8001058:	f001 f882 	bl	8002160 <RCC_AHBPeriphClockCmd>
 800105c:	2080      	movs	r0, #128	; 0x80
 800105e:	02c0      	lsls	r0, r0, #11
 8001060:	2101      	movs	r1, #1
 8001062:	f001 f87d 	bl	8002160 <RCC_AHBPeriphClockCmd>
 8001066:	2208      	movs	r2, #8
 8001068:	2400      	movs	r4, #0
 800106a:	466b      	mov	r3, sp
 800106c:	2603      	movs	r6, #3
 800106e:	9200      	str	r2, [sp, #0]
 8001070:	4669      	mov	r1, sp
 8001072:	2201      	movs	r2, #1
 8001074:	481c      	ldr	r0, [pc, #112]	; (80010e8 <gpio_init+0x98>)
 8001076:	715e      	strb	r6, [r3, #5]
 8001078:	711a      	strb	r2, [r3, #4]
 800107a:	719c      	strb	r4, [r3, #6]
 800107c:	71dc      	strb	r4, [r3, #7]
 800107e:	2590      	movs	r5, #144	; 0x90
 8001080:	f000 fc8c 	bl	800199c <GPIO_Init>
 8001084:	2380      	movs	r3, #128	; 0x80
 8001086:	05ed      	lsls	r5, r5, #23
 8001088:	005b      	lsls	r3, r3, #1
 800108a:	466a      	mov	r2, sp
 800108c:	1c28      	adds	r0, r5, #0
 800108e:	9300      	str	r3, [sp, #0]
 8001090:	4669      	mov	r1, sp
 8001092:	2301      	movs	r3, #1
 8001094:	2780      	movs	r7, #128	; 0x80
 8001096:	7156      	strb	r6, [r2, #5]
 8001098:	013f      	lsls	r7, r7, #4
 800109a:	7113      	strb	r3, [r2, #4]
 800109c:	7194      	strb	r4, [r2, #6]
 800109e:	71d4      	strb	r4, [r2, #7]
 80010a0:	f000 fc7c 	bl	800199c <GPIO_Init>
 80010a4:	466a      	mov	r2, sp
 80010a6:	1c28      	adds	r0, r5, #0
 80010a8:	2301      	movs	r3, #1
 80010aa:	4669      	mov	r1, sp
 80010ac:	7156      	strb	r6, [r2, #5]
 80010ae:	9700      	str	r7, [sp, #0]
 80010b0:	7113      	strb	r3, [r2, #4]
 80010b2:	7194      	strb	r4, [r2, #6]
 80010b4:	71d4      	strb	r4, [r2, #7]
 80010b6:	f000 fc71 	bl	800199c <GPIO_Init>
 80010ba:	2202      	movs	r2, #2
 80010bc:	466b      	mov	r3, sp
 80010be:	9200      	str	r2, [sp, #0]
 80010c0:	1c28      	adds	r0, r5, #0
 80010c2:	2201      	movs	r2, #1
 80010c4:	4669      	mov	r1, sp
 80010c6:	715e      	strb	r6, [r3, #5]
 80010c8:	711a      	strb	r2, [r3, #4]
 80010ca:	719c      	strb	r4, [r3, #6]
 80010cc:	71dc      	strb	r4, [r3, #7]
 80010ce:	f000 fc65 	bl	800199c <GPIO_Init>
 80010d2:	4b05      	ldr	r3, [pc, #20]	; (80010e8 <gpio_init+0x98>)
 80010d4:	2208      	movs	r2, #8
 80010d6:	851a      	strh	r2, [r3, #40]	; 0x28
 80010d8:	2380      	movs	r3, #128	; 0x80
 80010da:	005b      	lsls	r3, r3, #1
 80010dc:	2202      	movs	r2, #2
 80010de:	852b      	strh	r3, [r5, #40]	; 0x28
 80010e0:	852f      	strh	r7, [r5, #40]	; 0x28
 80010e2:	852a      	strh	r2, [r5, #40]	; 0x28
 80010e4:	bdf7      	pop	{r0, r1, r2, r4, r5, r6, r7, pc}
 80010e6:	46c0      	nop			; (mov r8, r8)
 80010e8:	48000400 	.word	0x48000400

080010ec <led_on>:
 80010ec:	2808      	cmp	r0, #8
 80010ee:	d101      	bne.n	80010f4 <led_on+0x8>
 80010f0:	4b07      	ldr	r3, [pc, #28]	; (8001110 <led_on+0x24>)
 80010f2:	e00b      	b.n	800110c <led_on+0x20>
 80010f4:	2380      	movs	r3, #128	; 0x80
 80010f6:	005b      	lsls	r3, r3, #1
 80010f8:	4298      	cmp	r0, r3
 80010fa:	d005      	beq.n	8001108 <led_on+0x1c>
 80010fc:	2380      	movs	r3, #128	; 0x80
 80010fe:	011b      	lsls	r3, r3, #4
 8001100:	4298      	cmp	r0, r3
 8001102:	d001      	beq.n	8001108 <led_on+0x1c>
 8001104:	2802      	cmp	r0, #2
 8001106:	d102      	bne.n	800110e <led_on+0x22>
 8001108:	2390      	movs	r3, #144	; 0x90
 800110a:	05db      	lsls	r3, r3, #23
 800110c:	6198      	str	r0, [r3, #24]
 800110e:	4770      	bx	lr
 8001110:	48000400 	.word	0x48000400

08001114 <led_off>:
 8001114:	2808      	cmp	r0, #8
 8001116:	d101      	bne.n	800111c <led_off+0x8>
 8001118:	4b07      	ldr	r3, [pc, #28]	; (8001138 <led_off+0x24>)
 800111a:	e00b      	b.n	8001134 <led_off+0x20>
 800111c:	2380      	movs	r3, #128	; 0x80
 800111e:	005b      	lsls	r3, r3, #1
 8001120:	4298      	cmp	r0, r3
 8001122:	d005      	beq.n	8001130 <led_off+0x1c>
 8001124:	2380      	movs	r3, #128	; 0x80
 8001126:	011b      	lsls	r3, r3, #4
 8001128:	4298      	cmp	r0, r3
 800112a:	d001      	beq.n	8001130 <led_off+0x1c>
 800112c:	2802      	cmp	r0, #2
 800112e:	d102      	bne.n	8001136 <led_off+0x22>
 8001130:	2390      	movs	r3, #144	; 0x90
 8001132:	05db      	lsls	r3, r3, #23
 8001134:	8518      	strh	r0, [r3, #40]	; 0x28
 8001136:	4770      	bx	lr
 8001138:	48000400 	.word	0x48000400

0800113c <assert_param>:
 800113c:	4770      	bx	lr
	...

08001140 <sys_tick_init>:
 8001140:	4b03      	ldr	r3, [pc, #12]	; (8001150 <sys_tick_init+0x10>)
 8001142:	4a04      	ldr	r2, [pc, #16]	; (8001154 <sys_tick_init+0x14>)
 8001144:	605a      	str	r2, [r3, #4]
 8001146:	2200      	movs	r2, #0
 8001148:	609a      	str	r2, [r3, #8]
 800114a:	2207      	movs	r2, #7
 800114c:	601a      	str	r2, [r3, #0]
 800114e:	4770      	bx	lr
 8001150:	e000e010 	.word	0xe000e010
 8001154:	0000bb80 	.word	0x0000bb80

08001158 <sleep>:
 8001158:	bf30      	wfi
 800115a:	4770      	bx	lr

0800115c <SystemInit>:
 800115c:	4b26      	ldr	r3, [pc, #152]	; (80011f8 <SystemInit+0x9c>)
 800115e:	2201      	movs	r2, #1
 8001160:	6819      	ldr	r1, [r3, #0]
 8001162:	b082      	sub	sp, #8
 8001164:	4311      	orrs	r1, r2
 8001166:	6019      	str	r1, [r3, #0]
 8001168:	6858      	ldr	r0, [r3, #4]
 800116a:	4924      	ldr	r1, [pc, #144]	; (80011fc <SystemInit+0xa0>)
 800116c:	4001      	ands	r1, r0
 800116e:	6059      	str	r1, [r3, #4]
 8001170:	6818      	ldr	r0, [r3, #0]
 8001172:	4923      	ldr	r1, [pc, #140]	; (8001200 <SystemInit+0xa4>)
 8001174:	4001      	ands	r1, r0
 8001176:	6019      	str	r1, [r3, #0]
 8001178:	6818      	ldr	r0, [r3, #0]
 800117a:	4922      	ldr	r1, [pc, #136]	; (8001204 <SystemInit+0xa8>)
 800117c:	4001      	ands	r1, r0
 800117e:	6019      	str	r1, [r3, #0]
 8001180:	6858      	ldr	r0, [r3, #4]
 8001182:	4921      	ldr	r1, [pc, #132]	; (8001208 <SystemInit+0xac>)
 8001184:	4001      	ands	r1, r0
 8001186:	6059      	str	r1, [r3, #4]
 8001188:	6ad9      	ldr	r1, [r3, #44]	; 0x2c
 800118a:	200f      	movs	r0, #15
 800118c:	4381      	bics	r1, r0
 800118e:	62d9      	str	r1, [r3, #44]	; 0x2c
 8001190:	6b18      	ldr	r0, [r3, #48]	; 0x30
 8001192:	491e      	ldr	r1, [pc, #120]	; (800120c <SystemInit+0xb0>)
 8001194:	4001      	ands	r1, r0
 8001196:	6319      	str	r1, [r3, #48]	; 0x30
 8001198:	6b59      	ldr	r1, [r3, #52]	; 0x34
 800119a:	4391      	bics	r1, r2
 800119c:	2200      	movs	r2, #0
 800119e:	6359      	str	r1, [r3, #52]	; 0x34
 80011a0:	609a      	str	r2, [r3, #8]
 80011a2:	9200      	str	r2, [sp, #0]
 80011a4:	9201      	str	r2, [sp, #4]
 80011a6:	4a1a      	ldr	r2, [pc, #104]	; (8001210 <SystemInit+0xb4>)
 80011a8:	2111      	movs	r1, #17
 80011aa:	6011      	str	r1, [r2, #0]
 80011ac:	685a      	ldr	r2, [r3, #4]
 80011ae:	605a      	str	r2, [r3, #4]
 80011b0:	685a      	ldr	r2, [r3, #4]
 80011b2:	605a      	str	r2, [r3, #4]
 80011b4:	6859      	ldr	r1, [r3, #4]
 80011b6:	4a17      	ldr	r2, [pc, #92]	; (8001214 <SystemInit+0xb8>)
 80011b8:	400a      	ands	r2, r1
 80011ba:	605a      	str	r2, [r3, #4]
 80011bc:	6859      	ldr	r1, [r3, #4]
 80011be:	22a0      	movs	r2, #160	; 0xa0
 80011c0:	0392      	lsls	r2, r2, #14
 80011c2:	430a      	orrs	r2, r1
 80011c4:	605a      	str	r2, [r3, #4]
 80011c6:	6819      	ldr	r1, [r3, #0]
 80011c8:	2280      	movs	r2, #128	; 0x80
 80011ca:	0452      	lsls	r2, r2, #17
 80011cc:	430a      	orrs	r2, r1
 80011ce:	601a      	str	r2, [r3, #0]
 80011d0:	6819      	ldr	r1, [r3, #0]
 80011d2:	4a09      	ldr	r2, [pc, #36]	; (80011f8 <SystemInit+0x9c>)
 80011d4:	0188      	lsls	r0, r1, #6
 80011d6:	d5fb      	bpl.n	80011d0 <SystemInit+0x74>
 80011d8:	6851      	ldr	r1, [r2, #4]
 80011da:	2003      	movs	r0, #3
 80011dc:	4381      	bics	r1, r0
 80011de:	6051      	str	r1, [r2, #4]
 80011e0:	6851      	ldr	r1, [r2, #4]
 80011e2:	2002      	movs	r0, #2
 80011e4:	4301      	orrs	r1, r0
 80011e6:	6051      	str	r1, [r2, #4]
 80011e8:	6859      	ldr	r1, [r3, #4]
 80011ea:	220c      	movs	r2, #12
 80011ec:	400a      	ands	r2, r1
 80011ee:	2a08      	cmp	r2, #8
 80011f0:	d1fa      	bne.n	80011e8 <SystemInit+0x8c>
 80011f2:	b002      	add	sp, #8
 80011f4:	4770      	bx	lr
 80011f6:	46c0      	nop			; (mov r8, r8)
 80011f8:	40021000 	.word	0x40021000
 80011fc:	f8ffb80c 	.word	0xf8ffb80c
 8001200:	fef6ffff 	.word	0xfef6ffff
 8001204:	fffbffff 	.word	0xfffbffff
 8001208:	ffc0ffff 	.word	0xffc0ffff
 800120c:	fffffeac 	.word	0xfffffeac
 8001210:	40022000 	.word	0x40022000
 8001214:	ffc07fff 	.word	0xffc07fff

08001218 <lib_low_level_init>:
 8001218:	b508      	push	{r3, lr}
 800121a:	f7ff ff9f 	bl	800115c <SystemInit>
 800121e:	f7ff ff17 	bl	8001050 <gpio_init>
 8001222:	f000 f835 	bl	8001290 <uart_init>
 8001226:	f000 fffb 	bl	8002220 <timer_init>
 800122a:	f7ff fe67 	bl	8000efc <i2c_0_init>
 800122e:	bd08      	pop	{r3, pc}

08001230 <uart_write>:
 8001230:	4b03      	ldr	r3, [pc, #12]	; (8001240 <uart_write+0x10>)
 8001232:	69da      	ldr	r2, [r3, #28]
 8001234:	0611      	lsls	r1, r2, #24
 8001236:	d401      	bmi.n	800123c <uart_write+0xc>
 8001238:	46c0      	nop			; (mov r8, r8)
 800123a:	e7f9      	b.n	8001230 <uart_write>
 800123c:	8518      	strh	r0, [r3, #40]	; 0x28
 800123e:	4770      	bx	lr
 8001240:	40013800 	.word	0x40013800

08001244 <USART1_IRQHandler>:
 8001244:	b508      	push	{r3, lr}
 8001246:	480e      	ldr	r0, [pc, #56]	; (8001280 <USART1_IRQHandler+0x3c>)
 8001248:	490e      	ldr	r1, [pc, #56]	; (8001284 <USART1_IRQHandler+0x40>)
 800124a:	f000 fdb9 	bl	8001dc0 <USART_GetITStatus>
 800124e:	2800      	cmp	r0, #0
 8001250:	d011      	beq.n	8001276 <USART1_IRQHandler+0x32>
 8001252:	480b      	ldr	r0, [pc, #44]	; (8001280 <USART1_IRQHandler+0x3c>)
 8001254:	f000 fd80 	bl	8001d58 <USART_ReceiveData>
 8001258:	4b0b      	ldr	r3, [pc, #44]	; (8001288 <USART1_IRQHandler+0x44>)
 800125a:	490c      	ldr	r1, [pc, #48]	; (800128c <USART1_IRQHandler+0x48>)
 800125c:	881a      	ldrh	r2, [r3, #0]
 800125e:	b2c0      	uxtb	r0, r0
 8001260:	b292      	uxth	r2, r2
 8001262:	5488      	strb	r0, [r1, r2]
 8001264:	881a      	ldrh	r2, [r3, #0]
 8001266:	3201      	adds	r2, #1
 8001268:	b292      	uxth	r2, r2
 800126a:	801a      	strh	r2, [r3, #0]
 800126c:	881a      	ldrh	r2, [r3, #0]
 800126e:	2a0f      	cmp	r2, #15
 8001270:	d901      	bls.n	8001276 <USART1_IRQHandler+0x32>
 8001272:	2200      	movs	r2, #0
 8001274:	801a      	strh	r2, [r3, #0]
 8001276:	4802      	ldr	r0, [pc, #8]	; (8001280 <USART1_IRQHandler+0x3c>)
 8001278:	4902      	ldr	r1, [pc, #8]	; (8001284 <USART1_IRQHandler+0x40>)
 800127a:	f000 fe39 	bl	8001ef0 <USART_ClearITPendingBit>
 800127e:	bd08      	pop	{r3, pc}
 8001280:	40013800 	.word	0x40013800
 8001284:	00050105 	.word	0x00050105
 8001288:	20000888 	.word	0x20000888
 800128c:	20000878 	.word	0x20000878

08001290 <uart_init>:
 8001290:	b530      	push	{r4, r5, lr}
 8001292:	4a21      	ldr	r2, [pc, #132]	; (8001318 <uart_init+0x88>)
 8001294:	2300      	movs	r3, #0
 8001296:	8013      	strh	r3, [r2, #0]
 8001298:	4a20      	ldr	r2, [pc, #128]	; (800131c <uart_init+0x8c>)
 800129a:	b089      	sub	sp, #36	; 0x24
 800129c:	8013      	strh	r3, [r2, #0]
 800129e:	4a20      	ldr	r2, [pc, #128]	; (8001320 <uart_init+0x90>)
 80012a0:	2400      	movs	r4, #0
 80012a2:	54d4      	strb	r4, [r2, r3]
 80012a4:	3301      	adds	r3, #1
 80012a6:	2b10      	cmp	r3, #16
 80012a8:	d1f9      	bne.n	800129e <uart_init+0xe>
 80012aa:	2080      	movs	r0, #128	; 0x80
 80012ac:	0280      	lsls	r0, r0, #10
 80012ae:	2101      	movs	r1, #1
 80012b0:	f000 ff56 	bl	8002160 <RCC_AHBPeriphClockCmd>
 80012b4:	2080      	movs	r0, #128	; 0x80
 80012b6:	01c0      	lsls	r0, r0, #7
 80012b8:	2101      	movs	r1, #1
 80012ba:	f000 ff71 	bl	80021a0 <RCC_APB2PeriphClockCmd>
 80012be:	2090      	movs	r0, #144	; 0x90
 80012c0:	05c0      	lsls	r0, r0, #23
 80012c2:	2102      	movs	r1, #2
 80012c4:	2201      	movs	r2, #1
 80012c6:	f000 fbeb 	bl	8001aa0 <GPIO_PinAFConfig>
 80012ca:	2090      	movs	r0, #144	; 0x90
 80012cc:	05c0      	lsls	r0, r0, #23
 80012ce:	210f      	movs	r1, #15
 80012d0:	2201      	movs	r2, #1
 80012d2:	f000 fbe5 	bl	8001aa0 <GPIO_PinAFConfig>
 80012d6:	4b13      	ldr	r3, [pc, #76]	; (8001324 <uart_init+0x94>)
 80012d8:	2090      	movs	r0, #144	; 0x90
 80012da:	466a      	mov	r2, sp
 80012dc:	2501      	movs	r5, #1
 80012de:	9300      	str	r3, [sp, #0]
 80012e0:	4669      	mov	r1, sp
 80012e2:	2302      	movs	r3, #2
 80012e4:	05c0      	lsls	r0, r0, #23
 80012e6:	7113      	strb	r3, [r2, #4]
 80012e8:	7155      	strb	r5, [r2, #5]
 80012ea:	7194      	strb	r4, [r2, #6]
 80012ec:	71d5      	strb	r5, [r2, #7]
 80012ee:	f000 fb55 	bl	800199c <GPIO_Init>
 80012f2:	23e1      	movs	r3, #225	; 0xe1
 80012f4:	025b      	lsls	r3, r3, #9
 80012f6:	9302      	str	r3, [sp, #8]
 80012f8:	a902      	add	r1, sp, #8
 80012fa:	230c      	movs	r3, #12
 80012fc:	480a      	ldr	r0, [pc, #40]	; (8001328 <uart_init+0x98>)
 80012fe:	9306      	str	r3, [sp, #24]
 8001300:	9403      	str	r4, [sp, #12]
 8001302:	9404      	str	r4, [sp, #16]
 8001304:	9405      	str	r4, [sp, #20]
 8001306:	9407      	str	r4, [sp, #28]
 8001308:	f000 fc10 	bl	8001b2c <USART_Init>
 800130c:	4806      	ldr	r0, [pc, #24]	; (8001328 <uart_init+0x98>)
 800130e:	1c29      	adds	r1, r5, #0
 8001310:	f000 fce2 	bl	8001cd8 <USART_Cmd>
 8001314:	b009      	add	sp, #36	; 0x24
 8001316:	bd30      	pop	{r4, r5, pc}
 8001318:	20000888 	.word	0x20000888
 800131c:	2000088a 	.word	0x2000088a
 8001320:	20000878 	.word	0x20000878
 8001324:	00008004 	.word	0x00008004
 8001328:	40013800 	.word	0x40013800

0800132c <ws2812_clear>:
 800132c:	2300      	movs	r3, #0
 800132e:	4905      	ldr	r1, [pc, #20]	; (8001344 <ws2812_clear+0x18>)
 8001330:	2200      	movs	r2, #0
 8001332:	545a      	strb	r2, [r3, r1]
 8001334:	18c9      	adds	r1, r1, r3
 8001336:	3303      	adds	r3, #3
 8001338:	704a      	strb	r2, [r1, #1]
 800133a:	708a      	strb	r2, [r1, #2]
 800133c:	2bc0      	cmp	r3, #192	; 0xc0
 800133e:	d1f6      	bne.n	800132e <ws2812_clear+0x2>
 8001340:	4770      	bx	lr
 8001342:	46c0      	nop			; (mov r8, r8)
 8001344:	20000010 	.word	0x20000010

08001348 <ws2812_refresh>:
 8001348:	b5f0      	push	{r4, r5, r6, r7, lr}
 800134a:	b085      	sub	sp, #20
 800134c:	b672      	cpsid	i
 800134e:	2400      	movs	r4, #0
 8001350:	4a15      	ldr	r2, [pc, #84]	; (80013a8 <ws2812_refresh+0x60>)
 8001352:	ae03      	add	r6, sp, #12
 8001354:	1913      	adds	r3, r2, r4
 8001356:	7859      	ldrb	r1, [r3, #1]
 8001358:	5ca2      	ldrb	r2, [r4, r2]
 800135a:	789b      	ldrb	r3, [r3, #2]
 800135c:	7031      	strb	r1, [r6, #0]
 800135e:	7072      	strb	r2, [r6, #1]
 8001360:	70b3      	strb	r3, [r6, #2]
 8001362:	2500      	movs	r5, #0
 8001364:	2308      	movs	r3, #8
 8001366:	5d77      	ldrb	r7, [r6, r5]
 8001368:	9301      	str	r3, [sp, #4]
 800136a:	b27b      	sxtb	r3, r7
 800136c:	480f      	ldr	r0, [pc, #60]	; (80013ac <ws2812_refresh+0x64>)
 800136e:	21f0      	movs	r1, #240	; 0xf0
 8001370:	2b00      	cmp	r3, #0
 8001372:	db00      	blt.n	8001376 <ws2812_refresh+0x2e>
 8001374:	21c0      	movs	r1, #192	; 0xc0
 8001376:	f000 f9ad 	bl	80016d4 <SPI_SendData8>
 800137a:	9b01      	ldr	r3, [sp, #4]
 800137c:	007f      	lsls	r7, r7, #1
 800137e:	3b01      	subs	r3, #1
 8001380:	b2ff      	uxtb	r7, r7
 8001382:	9301      	str	r3, [sp, #4]
 8001384:	2b00      	cmp	r3, #0
 8001386:	d1f0      	bne.n	800136a <ws2812_refresh+0x22>
 8001388:	3501      	adds	r5, #1
 800138a:	2d03      	cmp	r5, #3
 800138c:	d1ea      	bne.n	8001364 <ws2812_refresh+0x1c>
 800138e:	3403      	adds	r4, #3
 8001390:	2cc0      	cmp	r4, #192	; 0xc0
 8001392:	d1dd      	bne.n	8001350 <ws2812_refresh+0x8>
 8001394:	b662      	cpsie	i
 8001396:	4b06      	ldr	r3, [pc, #24]	; (80013b0 <ws2812_refresh+0x68>)
 8001398:	3b01      	subs	r3, #1
 800139a:	2b00      	cmp	r3, #0
 800139c:	d001      	beq.n	80013a2 <ws2812_refresh+0x5a>
 800139e:	46c0      	nop			; (mov r8, r8)
 80013a0:	e7fa      	b.n	8001398 <ws2812_refresh+0x50>
 80013a2:	b005      	add	sp, #20
 80013a4:	bdf0      	pop	{r4, r5, r6, r7, pc}
 80013a6:	46c0      	nop			; (mov r8, r8)
 80013a8:	20000010 	.word	0x20000010
 80013ac:	40013000 	.word	0x40013000
 80013b0:	00000961 	.word	0x00000961

080013b4 <ws2812_init>:
 80013b4:	b5f0      	push	{r4, r5, r6, r7, lr}
 80013b6:	2680      	movs	r6, #128	; 0x80
 80013b8:	0176      	lsls	r6, r6, #5
 80013ba:	b089      	sub	sp, #36	; 0x24
 80013bc:	1c30      	adds	r0, r6, #0
 80013be:	2101      	movs	r1, #1
 80013c0:	f000 feee 	bl	80021a0 <RCC_APB2PeriphClockCmd>
 80013c4:	4f1c      	ldr	r7, [pc, #112]	; (8001438 <ws2812_init+0x84>)
 80013c6:	2320      	movs	r3, #32
 80013c8:	a901      	add	r1, sp, #4
 80013ca:	9301      	str	r3, [sp, #4]
 80013cc:	2302      	movs	r3, #2
 80013ce:	2400      	movs	r4, #0
 80013d0:	2501      	movs	r5, #1
 80013d2:	710b      	strb	r3, [r1, #4]
 80013d4:	1c38      	adds	r0, r7, #0
 80013d6:	2303      	movs	r3, #3
 80013d8:	714b      	strb	r3, [r1, #5]
 80013da:	718c      	strb	r4, [r1, #6]
 80013dc:	71cd      	strb	r5, [r1, #7]
 80013de:	f000 fadd 	bl	800199c <GPIO_Init>
 80013e2:	1c22      	adds	r2, r4, #0
 80013e4:	1c38      	adds	r0, r7, #0
 80013e6:	2105      	movs	r1, #5
 80013e8:	f000 fb5a 	bl	8001aa0 <GPIO_PinAFConfig>
 80013ec:	2382      	movs	r3, #130	; 0x82
 80013ee:	a903      	add	r1, sp, #12
 80013f0:	40ab      	lsls	r3, r5
 80013f2:	804b      	strh	r3, [r1, #2]
 80013f4:	23e0      	movs	r3, #224	; 0xe0
 80013f6:	00db      	lsls	r3, r3, #3
 80013f8:	808b      	strh	r3, [r1, #4]
 80013fa:	2302      	movs	r3, #2
 80013fc:	80cb      	strh	r3, [r1, #6]
 80013fe:	2380      	movs	r3, #128	; 0x80
 8001400:	800c      	strh	r4, [r1, #0]
 8001402:	81cc      	strh	r4, [r1, #14]
 8001404:	009b      	lsls	r3, r3, #2
 8001406:	4c0d      	ldr	r4, [pc, #52]	; (800143c <ws2812_init+0x88>)
 8001408:	814b      	strh	r3, [r1, #10]
 800140a:	2310      	movs	r3, #16
 800140c:	818b      	strh	r3, [r1, #12]
 800140e:	1c20      	adds	r0, r4, #0
 8001410:	2307      	movs	r3, #7
 8001412:	820b      	strh	r3, [r1, #16]
 8001414:	810d      	strh	r5, [r1, #8]
 8001416:	f000 f865 	bl	80014e4 <SPI_Init>
 800141a:	1c20      	adds	r0, r4, #0
 800141c:	1c31      	adds	r1, r6, #0
 800141e:	f000 f937 	bl	8001690 <SPI_RxFIFOThresholdConfig>
 8001422:	1c20      	adds	r0, r4, #0
 8001424:	1c29      	adds	r1, r5, #0
 8001426:	f000 f911 	bl	800164c <SPI_Cmd>
 800142a:	f7ff ff7f 	bl	800132c <ws2812_clear>
 800142e:	f7ff ff8b 	bl	8001348 <ws2812_refresh>
 8001432:	b009      	add	sp, #36	; 0x24
 8001434:	bdf0      	pop	{r4, r5, r6, r7, pc}
 8001436:	46c0      	nop			; (mov r8, r8)
 8001438:	48000400 	.word	0x48000400
 800143c:	40013000 	.word	0x40013000

08001440 <ws2812_demo>:
 8001440:	b5f0      	push	{r4, r5, r6, r7, lr}
 8001442:	b085      	sub	sp, #20
 8001444:	4668      	mov	r0, sp
 8001446:	2300      	movs	r3, #0
 8001448:	2210      	movs	r2, #16
 800144a:	2101      	movs	r1, #1
 800144c:	466c      	mov	r4, sp
 800144e:	7002      	strb	r2, [r0, #0]
 8001450:	7043      	strb	r3, [r0, #1]
 8001452:	7083      	strb	r3, [r0, #2]
 8001454:	70c3      	strb	r3, [r0, #3]
 8001456:	7101      	strb	r1, [r0, #4]
 8001458:	7143      	strb	r3, [r0, #5]
 800145a:	7182      	strb	r2, [r0, #6]
 800145c:	71c3      	strb	r3, [r0, #7]
 800145e:	7203      	strb	r3, [r0, #8]
 8001460:	203f      	movs	r0, #63	; 0x3f
 8001462:	7260      	strb	r0, [r4, #9]
 8001464:	72a3      	strb	r3, [r4, #10]
 8001466:	72e3      	strb	r3, [r4, #11]
 8001468:	7322      	strb	r2, [r4, #12]
 800146a:	7363      	strb	r3, [r4, #13]
 800146c:	73a1      	strb	r1, [r4, #14]
 800146e:	f7ff ff5d 	bl	800132c <ws2812_clear>
 8001472:	2400      	movs	r4, #0
 8001474:	a800      	add	r0, sp, #0
 8001476:	1903      	adds	r3, r0, r4
 8001478:	78da      	ldrb	r2, [r3, #3]
 800147a:	7919      	ldrb	r1, [r3, #4]
 800147c:	253f      	movs	r5, #63	; 0x3f
 800147e:	1889      	adds	r1, r1, r2
 8001480:	4029      	ands	r1, r5
 8001482:	2603      	movs	r6, #3
 8001484:	70d9      	strb	r1, [r3, #3]
 8001486:	7858      	ldrb	r0, [r3, #1]
 8001488:	789f      	ldrb	r7, [r3, #2]
 800148a:	1c33      	adds	r3, r6, #0
 800148c:	434b      	muls	r3, r1
 800148e:	4669      	mov	r1, sp
 8001490:	4a12      	ldr	r2, [pc, #72]	; (80014dc <ws2812_demo+0x9c>)
 8001492:	5d09      	ldrb	r1, [r1, r4]
 8001494:	3405      	adds	r4, #5
 8001496:	5499      	strb	r1, [r3, r2]
 8001498:	18d3      	adds	r3, r2, r3
 800149a:	7058      	strb	r0, [r3, #1]
 800149c:	709f      	strb	r7, [r3, #2]
 800149e:	f7ff ff53 	bl	8001348 <ws2812_refresh>
 80014a2:	2c0f      	cmp	r4, #15
 80014a4:	d1e6      	bne.n	8001474 <ws2812_demo+0x34>
 80014a6:	480e      	ldr	r0, [pc, #56]	; (80014e0 <ws2812_demo+0xa0>)
 80014a8:	f000 ff22 	bl	80022f0 <timer_delay_loops>
 80014ac:	f000 ff26 	bl	80022fc <timer_get_time>
 80014b0:	2164      	movs	r1, #100	; 0x64
 80014b2:	1c04      	adds	r4, r0, #0
 80014b4:	f001 f89a 	bl	80025ec <__aeabi_uidivmod>
 80014b8:	2900      	cmp	r1, #0
 80014ba:	d1d8      	bne.n	800146e <ws2812_demo+0x2e>
 80014bc:	1c20      	adds	r0, r4, #0
 80014be:	1c31      	adds	r1, r6, #0
 80014c0:	f001 f894 	bl	80025ec <__aeabi_uidivmod>
 80014c4:	2305      	movs	r3, #5
 80014c6:	4359      	muls	r1, r3
 80014c8:	aa00      	add	r2, sp, #0
 80014ca:	1851      	adds	r1, r2, r1
 80014cc:	790b      	ldrb	r3, [r1, #4]
 80014ce:	2b01      	cmp	r3, #1
 80014d0:	d101      	bne.n	80014d6 <ws2812_demo+0x96>
 80014d2:	710d      	strb	r5, [r1, #4]
 80014d4:	e7cb      	b.n	800146e <ws2812_demo+0x2e>
 80014d6:	2301      	movs	r3, #1
 80014d8:	710b      	strb	r3, [r1, #4]
 80014da:	e7c8      	b.n	800146e <ws2812_demo+0x2e>
 80014dc:	20000010 	.word	0x20000010
 80014e0:	00030d40 	.word	0x00030d40

080014e4 <SPI_Init>:
 80014e4:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
 80014e6:	4b4e      	ldr	r3, [pc, #312]	; (8001620 <SPI_Init+0x13c>)
 80014e8:	1c05      	adds	r5, r0, #0
 80014ea:	1c0c      	adds	r4, r1, #0
 80014ec:	4298      	cmp	r0, r3
 80014ee:	d004      	beq.n	80014fa <SPI_Init+0x16>
 80014f0:	494c      	ldr	r1, [pc, #304]	; (8001624 <SPI_Init+0x140>)
 80014f2:	1840      	adds	r0, r0, r1
 80014f4:	4243      	negs	r3, r0
 80014f6:	4158      	adcs	r0, r3
 80014f8:	e000      	b.n	80014fc <SPI_Init+0x18>
 80014fa:	2001      	movs	r0, #1
 80014fc:	f7ff fe1e 	bl	800113c <assert_param>
 8001500:	4e49      	ldr	r6, [pc, #292]	; (8001628 <SPI_Init+0x144>)
 8001502:	8823      	ldrh	r3, [r4, #0]
 8001504:	2001      	movs	r0, #1
 8001506:	4233      	tst	r3, r6
 8001508:	d005      	beq.n	8001516 <SPI_Init+0x32>
 800150a:	4848      	ldr	r0, [pc, #288]	; (800162c <SPI_Init+0x148>)
 800150c:	4a48      	ldr	r2, [pc, #288]	; (8001630 <SPI_Init+0x14c>)
 800150e:	4003      	ands	r3, r0
 8001510:	1898      	adds	r0, r3, r2
 8001512:	4243      	negs	r3, r0
 8001514:	4158      	adcs	r0, r3
 8001516:	f7ff fe11 	bl	800113c <assert_param>
 800151a:	8860      	ldrh	r0, [r4, #2]
 800151c:	2382      	movs	r3, #130	; 0x82
 800151e:	005b      	lsls	r3, r3, #1
 8001520:	4298      	cmp	r0, r3
 8001522:	d002      	beq.n	800152a <SPI_Init+0x46>
 8001524:	4243      	negs	r3, r0
 8001526:	4158      	adcs	r0, r3
 8001528:	e000      	b.n	800152c <SPI_Init+0x48>
 800152a:	2001      	movs	r0, #1
 800152c:	f7ff fe06 	bl	800113c <assert_param>
 8001530:	88a0      	ldrh	r0, [r4, #4]
 8001532:	23c0      	movs	r3, #192	; 0xc0
 8001534:	1c02      	adds	r2, r0, #0
 8001536:	4032      	ands	r2, r6
 8001538:	009b      	lsls	r3, r3, #2
 800153a:	4e3e      	ldr	r6, [pc, #248]	; (8001634 <SPI_Init+0x150>)
 800153c:	429a      	cmp	r2, r3
 800153e:	d016      	beq.n	800156e <SPI_Init+0x8a>
 8001540:	4a3d      	ldr	r2, [pc, #244]	; (8001638 <SPI_Init+0x154>)
 8001542:	2380      	movs	r3, #128	; 0x80
 8001544:	4002      	ands	r2, r0
 8001546:	00db      	lsls	r3, r3, #3
 8001548:	429a      	cmp	r2, r3
 800154a:	d010      	beq.n	800156e <SPI_Init+0x8a>
 800154c:	1c02      	adds	r2, r0, #0
 800154e:	23c0      	movs	r3, #192	; 0xc0
 8001550:	4032      	ands	r2, r6
 8001552:	00db      	lsls	r3, r3, #3
 8001554:	429a      	cmp	r2, r3
 8001556:	d00a      	beq.n	800156e <SPI_Init+0x8a>
 8001558:	4a38      	ldr	r2, [pc, #224]	; (800163c <SPI_Init+0x158>)
 800155a:	2380      	movs	r3, #128	; 0x80
 800155c:	4002      	ands	r2, r0
 800155e:	011b      	lsls	r3, r3, #4
 8001560:	429a      	cmp	r2, r3
 8001562:	d004      	beq.n	800156e <SPI_Init+0x8a>
 8001564:	4b36      	ldr	r3, [pc, #216]	; (8001640 <SPI_Init+0x15c>)
 8001566:	18c0      	adds	r0, r0, r3
 8001568:	4243      	negs	r3, r0
 800156a:	4158      	adcs	r0, r3
 800156c:	e000      	b.n	8001570 <SPI_Init+0x8c>
 800156e:	2001      	movs	r0, #1
 8001570:	f7ff fde4 	bl	800113c <assert_param>
 8001574:	88e0      	ldrh	r0, [r4, #6]
 8001576:	2302      	movs	r3, #2
 8001578:	4398      	bics	r0, r3
 800157a:	4243      	negs	r3, r0
 800157c:	4158      	adcs	r0, r3
 800157e:	f7ff fddd 	bl	800113c <assert_param>
 8001582:	8923      	ldrh	r3, [r4, #8]
 8001584:	2701      	movs	r7, #1
 8001586:	2000      	movs	r0, #0
 8001588:	429f      	cmp	r7, r3
 800158a:	4140      	adcs	r0, r0
 800158c:	f7ff fdd6 	bl	800113c <assert_param>
 8001590:	4b2c      	ldr	r3, [pc, #176]	; (8001644 <SPI_Init+0x160>)
 8001592:	8960      	ldrh	r0, [r4, #10]
 8001594:	4018      	ands	r0, r3
 8001596:	4243      	negs	r3, r0
 8001598:	4158      	adcs	r0, r3
 800159a:	f7ff fdcf 	bl	800113c <assert_param>
 800159e:	89a2      	ldrh	r2, [r4, #12]
 80015a0:	2308      	movs	r3, #8
 80015a2:	1c11      	adds	r1, r2, #0
 80015a4:	4399      	bics	r1, r3
 80015a6:	1c0b      	adds	r3, r1, #0
 80015a8:	2118      	movs	r1, #24
 80015aa:	438a      	bics	r2, r1
 80015ac:	1c38      	adds	r0, r7, #0
 80015ae:	2a00      	cmp	r2, #0
 80015b0:	d005      	beq.n	80015be <SPI_Init+0xda>
 80015b2:	2b20      	cmp	r3, #32
 80015b4:	d003      	beq.n	80015be <SPI_Init+0xda>
 80015b6:	1c18      	adds	r0, r3, #0
 80015b8:	3830      	subs	r0, #48	; 0x30
 80015ba:	4243      	negs	r3, r0
 80015bc:	4158      	adcs	r0, r3
 80015be:	f7ff fdbd 	bl	800113c <assert_param>
 80015c2:	89e0      	ldrh	r0, [r4, #14]
 80015c4:	2380      	movs	r3, #128	; 0x80
 80015c6:	4398      	bics	r0, r3
 80015c8:	4243      	negs	r3, r0
 80015ca:	4158      	adcs	r0, r3
 80015cc:	f7ff fdb6 	bl	800113c <assert_param>
 80015d0:	8a20      	ldrh	r0, [r4, #16]
 80015d2:	1e43      	subs	r3, r0, #1
 80015d4:	4198      	sbcs	r0, r3
 80015d6:	f7ff fdb1 	bl	800113c <assert_param>
 80015da:	882b      	ldrh	r3, [r5, #0]
 80015dc:	22c1      	movs	r2, #193	; 0xc1
 80015de:	0192      	lsls	r2, r2, #6
 80015e0:	89e1      	ldrh	r1, [r4, #14]
 80015e2:	401a      	ands	r2, r3
 80015e4:	8823      	ldrh	r3, [r4, #0]
 80015e6:	430b      	orrs	r3, r1
 80015e8:	88e1      	ldrh	r1, [r4, #6]
 80015ea:	430b      	orrs	r3, r1
 80015ec:	8921      	ldrh	r1, [r4, #8]
 80015ee:	430b      	orrs	r3, r1
 80015f0:	8961      	ldrh	r1, [r4, #10]
 80015f2:	430b      	orrs	r3, r1
 80015f4:	89a1      	ldrh	r1, [r4, #12]
 80015f6:	430b      	orrs	r3, r1
 80015f8:	4313      	orrs	r3, r2
 80015fa:	802b      	strh	r3, [r5, #0]
 80015fc:	88aa      	ldrh	r2, [r5, #4]
 80015fe:	4b12      	ldr	r3, [pc, #72]	; (8001648 <SPI_Init+0x164>)
 8001600:	4013      	ands	r3, r2
 8001602:	88a2      	ldrh	r2, [r4, #4]
 8001604:	4313      	orrs	r3, r2
 8001606:	80ab      	strh	r3, [r5, #4]
 8001608:	8a23      	ldrh	r3, [r4, #16]
 800160a:	2204      	movs	r2, #4
 800160c:	822b      	strh	r3, [r5, #16]
 800160e:	882b      	ldrh	r3, [r5, #0]
 8001610:	4393      	bics	r3, r2
 8001612:	8862      	ldrh	r2, [r4, #2]
 8001614:	4313      	orrs	r3, r2
 8001616:	802b      	strh	r3, [r5, #0]
 8001618:	8bab      	ldrh	r3, [r5, #28]
 800161a:	401e      	ands	r6, r3
 800161c:	83ae      	strh	r6, [r5, #28]
 800161e:	bdf8      	pop	{r3, r4, r5, r6, r7, pc}
 8001620:	40013000 	.word	0x40013000
 8001624:	bfffc800 	.word	0xbfffc800
 8001628:	fffffbff 	.word	0xfffffbff
 800162c:	ffffbfff 	.word	0xffffbfff
 8001630:	ffff8000 	.word	0xffff8000
 8001634:	fffff7ff 	.word	0xfffff7ff
 8001638:	fffff6ff 	.word	0xfffff6ff
 800163c:	fffffcff 	.word	0xfffffcff
 8001640:	fffff100 	.word	0xfffff100
 8001644:	fffffdff 	.word	0xfffffdff
 8001648:	fffff0ff 	.word	0xfffff0ff

0800164c <SPI_Cmd>:
 800164c:	b538      	push	{r3, r4, r5, lr}
 800164e:	4b0e      	ldr	r3, [pc, #56]	; (8001688 <SPI_Cmd+0x3c>)
 8001650:	1c04      	adds	r4, r0, #0
 8001652:	1c0d      	adds	r5, r1, #0
 8001654:	4298      	cmp	r0, r3
 8001656:	d004      	beq.n	8001662 <SPI_Cmd+0x16>
 8001658:	4b0c      	ldr	r3, [pc, #48]	; (800168c <SPI_Cmd+0x40>)
 800165a:	18c0      	adds	r0, r0, r3
 800165c:	4243      	negs	r3, r0
 800165e:	4158      	adcs	r0, r3
 8001660:	e000      	b.n	8001664 <SPI_Cmd+0x18>
 8001662:	2001      	movs	r0, #1
 8001664:	f7ff fd6a 	bl	800113c <assert_param>
 8001668:	2301      	movs	r3, #1
 800166a:	2000      	movs	r0, #0
 800166c:	42ab      	cmp	r3, r5
 800166e:	4140      	adcs	r0, r0
 8001670:	f7ff fd64 	bl	800113c <assert_param>
 8001674:	2340      	movs	r3, #64	; 0x40
 8001676:	8822      	ldrh	r2, [r4, #0]
 8001678:	2d00      	cmp	r5, #0
 800167a:	d001      	beq.n	8001680 <SPI_Cmd+0x34>
 800167c:	4313      	orrs	r3, r2
 800167e:	e001      	b.n	8001684 <SPI_Cmd+0x38>
 8001680:	439a      	bics	r2, r3
 8001682:	1c13      	adds	r3, r2, #0
 8001684:	8023      	strh	r3, [r4, #0]
 8001686:	bd38      	pop	{r3, r4, r5, pc}
 8001688:	40013000 	.word	0x40013000
 800168c:	bfffc800 	.word	0xbfffc800

08001690 <SPI_RxFIFOThresholdConfig>:
 8001690:	4b0d      	ldr	r3, [pc, #52]	; (80016c8 <SPI_RxFIFOThresholdConfig+0x38>)
 8001692:	b570      	push	{r4, r5, r6, lr}
 8001694:	1c04      	adds	r4, r0, #0
 8001696:	1c0d      	adds	r5, r1, #0
 8001698:	4298      	cmp	r0, r3
 800169a:	d004      	beq.n	80016a6 <SPI_RxFIFOThresholdConfig+0x16>
 800169c:	4b0b      	ldr	r3, [pc, #44]	; (80016cc <SPI_RxFIFOThresholdConfig+0x3c>)
 800169e:	18c0      	adds	r0, r0, r3
 80016a0:	4243      	negs	r3, r0
 80016a2:	4158      	adcs	r0, r3
 80016a4:	e000      	b.n	80016a8 <SPI_RxFIFOThresholdConfig+0x18>
 80016a6:	2001      	movs	r0, #1
 80016a8:	4e09      	ldr	r6, [pc, #36]	; (80016d0 <SPI_RxFIFOThresholdConfig+0x40>)
 80016aa:	f7ff fd47 	bl	800113c <assert_param>
 80016ae:	1c28      	adds	r0, r5, #0
 80016b0:	4030      	ands	r0, r6
 80016b2:	4243      	negs	r3, r0
 80016b4:	4158      	adcs	r0, r3
 80016b6:	f7ff fd41 	bl	800113c <assert_param>
 80016ba:	88a3      	ldrh	r3, [r4, #4]
 80016bc:	401e      	ands	r6, r3
 80016be:	80a6      	strh	r6, [r4, #4]
 80016c0:	88a3      	ldrh	r3, [r4, #4]
 80016c2:	431d      	orrs	r5, r3
 80016c4:	80a5      	strh	r5, [r4, #4]
 80016c6:	bd70      	pop	{r4, r5, r6, pc}
 80016c8:	40013000 	.word	0x40013000
 80016cc:	bfffc800 	.word	0xbfffc800
 80016d0:	ffffefff 	.word	0xffffefff

080016d4 <SPI_SendData8>:
 80016d4:	b538      	push	{r3, r4, r5, lr}
 80016d6:	4b07      	ldr	r3, [pc, #28]	; (80016f4 <SPI_SendData8+0x20>)
 80016d8:	1c04      	adds	r4, r0, #0
 80016da:	1c0d      	adds	r5, r1, #0
 80016dc:	4298      	cmp	r0, r3
 80016de:	d004      	beq.n	80016ea <SPI_SendData8+0x16>
 80016e0:	4b05      	ldr	r3, [pc, #20]	; (80016f8 <SPI_SendData8+0x24>)
 80016e2:	18c0      	adds	r0, r0, r3
 80016e4:	4243      	negs	r3, r0
 80016e6:	4158      	adcs	r0, r3
 80016e8:	e000      	b.n	80016ec <SPI_SendData8+0x18>
 80016ea:	2001      	movs	r0, #1
 80016ec:	f7ff fd26 	bl	800113c <assert_param>
 80016f0:	7325      	strb	r5, [r4, #12]
 80016f2:	bd38      	pop	{r3, r4, r5, pc}
 80016f4:	40013000 	.word	0x40013000
 80016f8:	bfffc800 	.word	0xbfffc800

080016fc <NVIC_Init>:
 80016fc:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
 80016fe:	2500      	movs	r5, #0
 8001700:	7883      	ldrb	r3, [r0, #2]
 8001702:	1c04      	adds	r4, r0, #0
 8001704:	2601      	movs	r6, #1
 8001706:	1c28      	adds	r0, r5, #0
 8001708:	429e      	cmp	r6, r3
 800170a:	4168      	adcs	r0, r5
 800170c:	f7ff fd16 	bl	800113c <assert_param>
 8001710:	7863      	ldrb	r3, [r4, #1]
 8001712:	2703      	movs	r7, #3
 8001714:	1c28      	adds	r0, r5, #0
 8001716:	429f      	cmp	r7, r3
 8001718:	4168      	adcs	r0, r5
 800171a:	f7ff fd0f 	bl	800113c <assert_param>
 800171e:	78a2      	ldrb	r2, [r4, #2]
 8001720:	7823      	ldrb	r3, [r4, #0]
 8001722:	42aa      	cmp	r2, r5
 8001724:	d01a      	beq.n	800175c <NVIC_Init+0x60>
 8001726:	0899      	lsrs	r1, r3, #2
 8001728:	4a0f      	ldr	r2, [pc, #60]	; (8001768 <NVIC_Init+0x6c>)
 800172a:	0089      	lsls	r1, r1, #2
 800172c:	1889      	adds	r1, r1, r2
 800172e:	22c0      	movs	r2, #192	; 0xc0
 8001730:	0092      	lsls	r2, r2, #2
 8001732:	401f      	ands	r7, r3
 8001734:	20ff      	movs	r0, #255	; 0xff
 8001736:	588d      	ldr	r5, [r1, r2]
 8001738:	00ff      	lsls	r7, r7, #3
 800173a:	1c03      	adds	r3, r0, #0
 800173c:	40bb      	lsls	r3, r7
 800173e:	439d      	bics	r5, r3
 8001740:	7863      	ldrb	r3, [r4, #1]
 8001742:	019b      	lsls	r3, r3, #6
 8001744:	4018      	ands	r0, r3
 8001746:	40b8      	lsls	r0, r7
 8001748:	1c2f      	adds	r7, r5, #0
 800174a:	4307      	orrs	r7, r0
 800174c:	508f      	str	r7, [r1, r2]
 800174e:	7822      	ldrb	r2, [r4, #0]
 8001750:	231f      	movs	r3, #31
 8001752:	4013      	ands	r3, r2
 8001754:	409e      	lsls	r6, r3
 8001756:	4b04      	ldr	r3, [pc, #16]	; (8001768 <NVIC_Init+0x6c>)
 8001758:	601e      	str	r6, [r3, #0]
 800175a:	e004      	b.n	8001766 <NVIC_Init+0x6a>
 800175c:	271f      	movs	r7, #31
 800175e:	403b      	ands	r3, r7
 8001760:	4a02      	ldr	r2, [pc, #8]	; (800176c <NVIC_Init+0x70>)
 8001762:	409e      	lsls	r6, r3
 8001764:	67d6      	str	r6, [r2, #124]	; 0x7c
 8001766:	bdf8      	pop	{r3, r4, r5, r6, r7, pc}
 8001768:	e000e100 	.word	0xe000e100
 800176c:	e000e104 	.word	0xe000e104

08001770 <TIM_TimeBaseInit>:
 8001770:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
 8001772:	4e34      	ldr	r6, [pc, #208]	; (8001844 <TIM_TimeBaseInit+0xd4>)
 8001774:	1c04      	adds	r4, r0, #0
 8001776:	1c0d      	adds	r5, r1, #0
 8001778:	4f33      	ldr	r7, [pc, #204]	; (8001848 <TIM_TimeBaseInit+0xd8>)
 800177a:	42b0      	cmp	r0, r6
 800177c:	d019      	beq.n	80017b2 <TIM_TimeBaseInit+0x42>
 800177e:	2380      	movs	r3, #128	; 0x80
 8001780:	05db      	lsls	r3, r3, #23
 8001782:	4298      	cmp	r0, r3
 8001784:	d015      	beq.n	80017b2 <TIM_TimeBaseInit+0x42>
 8001786:	4b31      	ldr	r3, [pc, #196]	; (800184c <TIM_TimeBaseInit+0xdc>)
 8001788:	4298      	cmp	r0, r3
 800178a:	d012      	beq.n	80017b2 <TIM_TimeBaseInit+0x42>
 800178c:	42b8      	cmp	r0, r7
 800178e:	d010      	beq.n	80017b2 <TIM_TimeBaseInit+0x42>
 8001790:	4b2f      	ldr	r3, [pc, #188]	; (8001850 <TIM_TimeBaseInit+0xe0>)
 8001792:	4298      	cmp	r0, r3
 8001794:	d00d      	beq.n	80017b2 <TIM_TimeBaseInit+0x42>
 8001796:	4b2f      	ldr	r3, [pc, #188]	; (8001854 <TIM_TimeBaseInit+0xe4>)
 8001798:	4298      	cmp	r0, r3
 800179a:	d00a      	beq.n	80017b2 <TIM_TimeBaseInit+0x42>
 800179c:	4b2e      	ldr	r3, [pc, #184]	; (8001858 <TIM_TimeBaseInit+0xe8>)
 800179e:	4298      	cmp	r0, r3
 80017a0:	d007      	beq.n	80017b2 <TIM_TimeBaseInit+0x42>
 80017a2:	4b2e      	ldr	r3, [pc, #184]	; (800185c <TIM_TimeBaseInit+0xec>)
 80017a4:	4298      	cmp	r0, r3
 80017a6:	d004      	beq.n	80017b2 <TIM_TimeBaseInit+0x42>
 80017a8:	492d      	ldr	r1, [pc, #180]	; (8001860 <TIM_TimeBaseInit+0xf0>)
 80017aa:	1840      	adds	r0, r0, r1
 80017ac:	4243      	negs	r3, r0
 80017ae:	4158      	adcs	r0, r3
 80017b0:	e000      	b.n	80017b4 <TIM_TimeBaseInit+0x44>
 80017b2:	2001      	movs	r0, #1
 80017b4:	f7ff fcc2 	bl	800113c <assert_param>
 80017b8:	886b      	ldrh	r3, [r5, #2]
 80017ba:	2210      	movs	r2, #16
 80017bc:	1c19      	adds	r1, r3, #0
 80017be:	4391      	bics	r1, r2
 80017c0:	2001      	movs	r0, #1
 80017c2:	2900      	cmp	r1, #0
 80017c4:	d007      	beq.n	80017d6 <TIM_TimeBaseInit+0x66>
 80017c6:	2240      	movs	r2, #64	; 0x40
 80017c8:	1c19      	adds	r1, r3, #0
 80017ca:	4391      	bics	r1, r2
 80017cc:	2920      	cmp	r1, #32
 80017ce:	d002      	beq.n	80017d6 <TIM_TimeBaseInit+0x66>
 80017d0:	3b40      	subs	r3, #64	; 0x40
 80017d2:	4258      	negs	r0, r3
 80017d4:	4158      	adcs	r0, r3
 80017d6:	f7ff fcb1 	bl	800113c <assert_param>
 80017da:	892b      	ldrh	r3, [r5, #8]
 80017dc:	4a21      	ldr	r2, [pc, #132]	; (8001864 <TIM_TimeBaseInit+0xf4>)
 80017de:	2001      	movs	r0, #1
 80017e0:	4213      	tst	r3, r2
 80017e2:	d003      	beq.n	80017ec <TIM_TimeBaseInit+0x7c>
 80017e4:	4a20      	ldr	r2, [pc, #128]	; (8001868 <TIM_TimeBaseInit+0xf8>)
 80017e6:	1898      	adds	r0, r3, r2
 80017e8:	4243      	negs	r3, r0
 80017ea:	4158      	adcs	r0, r3
 80017ec:	f7ff fca6 	bl	800113c <assert_param>
 80017f0:	8823      	ldrh	r3, [r4, #0]
 80017f2:	b29b      	uxth	r3, r3
 80017f4:	42b4      	cmp	r4, r6
 80017f6:	d006      	beq.n	8001806 <TIM_TimeBaseInit+0x96>
 80017f8:	2280      	movs	r2, #128	; 0x80
 80017fa:	05d2      	lsls	r2, r2, #23
 80017fc:	4294      	cmp	r4, r2
 80017fe:	d002      	beq.n	8001806 <TIM_TimeBaseInit+0x96>
 8001800:	4a12      	ldr	r2, [pc, #72]	; (800184c <TIM_TimeBaseInit+0xdc>)
 8001802:	4294      	cmp	r4, r2
 8001804:	d103      	bne.n	800180e <TIM_TimeBaseInit+0x9e>
 8001806:	2270      	movs	r2, #112	; 0x70
 8001808:	4393      	bics	r3, r2
 800180a:	886a      	ldrh	r2, [r5, #2]
 800180c:	4313      	orrs	r3, r2
 800180e:	42bc      	cmp	r4, r7
 8001810:	d003      	beq.n	800181a <TIM_TimeBaseInit+0xaa>
 8001812:	4916      	ldr	r1, [pc, #88]	; (800186c <TIM_TimeBaseInit+0xfc>)
 8001814:	892a      	ldrh	r2, [r5, #8]
 8001816:	400b      	ands	r3, r1
 8001818:	4313      	orrs	r3, r2
 800181a:	8023      	strh	r3, [r4, #0]
 800181c:	686b      	ldr	r3, [r5, #4]
 800181e:	62e3      	str	r3, [r4, #44]	; 0x2c
 8001820:	882b      	ldrh	r3, [r5, #0]
 8001822:	8523      	strh	r3, [r4, #40]	; 0x28
 8001824:	42b4      	cmp	r4, r6
 8001826:	d008      	beq.n	800183a <TIM_TimeBaseInit+0xca>
 8001828:	4b0b      	ldr	r3, [pc, #44]	; (8001858 <TIM_TimeBaseInit+0xe8>)
 800182a:	429c      	cmp	r4, r3
 800182c:	d005      	beq.n	800183a <TIM_TimeBaseInit+0xca>
 800182e:	4b0b      	ldr	r3, [pc, #44]	; (800185c <TIM_TimeBaseInit+0xec>)
 8001830:	429c      	cmp	r4, r3
 8001832:	d002      	beq.n	800183a <TIM_TimeBaseInit+0xca>
 8001834:	4b0e      	ldr	r3, [pc, #56]	; (8001870 <TIM_TimeBaseInit+0x100>)
 8001836:	429c      	cmp	r4, r3
 8001838:	d101      	bne.n	800183e <TIM_TimeBaseInit+0xce>
 800183a:	7aab      	ldrb	r3, [r5, #10]
 800183c:	8623      	strh	r3, [r4, #48]	; 0x30
 800183e:	2301      	movs	r3, #1
 8001840:	82a3      	strh	r3, [r4, #20]
 8001842:	bdf8      	pop	{r3, r4, r5, r6, r7, pc}
 8001844:	40012c00 	.word	0x40012c00
 8001848:	40001000 	.word	0x40001000
 800184c:	40000400 	.word	0x40000400
 8001850:	40001400 	.word	0x40001400
 8001854:	40002000 	.word	0x40002000
 8001858:	40014000 	.word	0x40014000
 800185c:	40014400 	.word	0x40014400
 8001860:	bffeb800 	.word	0xbffeb800
 8001864:	fffffeff 	.word	0xfffffeff
 8001868:	fffffe00 	.word	0xfffffe00
 800186c:	fffffcff 	.word	0xfffffcff
 8001870:	40014800 	.word	0x40014800

08001874 <TIM_Cmd>:
 8001874:	4b19      	ldr	r3, [pc, #100]	; (80018dc <TIM_Cmd+0x68>)
 8001876:	b570      	push	{r4, r5, r6, lr}
 8001878:	1c04      	adds	r4, r0, #0
 800187a:	1c0e      	adds	r6, r1, #0
 800187c:	4298      	cmp	r0, r3
 800187e:	d01a      	beq.n	80018b6 <TIM_Cmd+0x42>
 8001880:	2380      	movs	r3, #128	; 0x80
 8001882:	05db      	lsls	r3, r3, #23
 8001884:	4298      	cmp	r0, r3
 8001886:	d016      	beq.n	80018b6 <TIM_Cmd+0x42>
 8001888:	4b15      	ldr	r3, [pc, #84]	; (80018e0 <TIM_Cmd+0x6c>)
 800188a:	4298      	cmp	r0, r3
 800188c:	d013      	beq.n	80018b6 <TIM_Cmd+0x42>
 800188e:	4b15      	ldr	r3, [pc, #84]	; (80018e4 <TIM_Cmd+0x70>)
 8001890:	4298      	cmp	r0, r3
 8001892:	d010      	beq.n	80018b6 <TIM_Cmd+0x42>
 8001894:	4b14      	ldr	r3, [pc, #80]	; (80018e8 <TIM_Cmd+0x74>)
 8001896:	4298      	cmp	r0, r3
 8001898:	d00d      	beq.n	80018b6 <TIM_Cmd+0x42>
 800189a:	4b14      	ldr	r3, [pc, #80]	; (80018ec <TIM_Cmd+0x78>)
 800189c:	4298      	cmp	r0, r3
 800189e:	d00a      	beq.n	80018b6 <TIM_Cmd+0x42>
 80018a0:	4b13      	ldr	r3, [pc, #76]	; (80018f0 <TIM_Cmd+0x7c>)
 80018a2:	4298      	cmp	r0, r3
 80018a4:	d007      	beq.n	80018b6 <TIM_Cmd+0x42>
 80018a6:	4b13      	ldr	r3, [pc, #76]	; (80018f4 <TIM_Cmd+0x80>)
 80018a8:	4298      	cmp	r0, r3
 80018aa:	d004      	beq.n	80018b6 <TIM_Cmd+0x42>
 80018ac:	4b12      	ldr	r3, [pc, #72]	; (80018f8 <TIM_Cmd+0x84>)
 80018ae:	18c0      	adds	r0, r0, r3
 80018b0:	4243      	negs	r3, r0
 80018b2:	4158      	adcs	r0, r3
 80018b4:	e000      	b.n	80018b8 <TIM_Cmd+0x44>
 80018b6:	2001      	movs	r0, #1
 80018b8:	f7ff fc40 	bl	800113c <assert_param>
 80018bc:	2501      	movs	r5, #1
 80018be:	2000      	movs	r0, #0
 80018c0:	42b5      	cmp	r5, r6
 80018c2:	4140      	adcs	r0, r0
 80018c4:	f7ff fc3a 	bl	800113c <assert_param>
 80018c8:	8823      	ldrh	r3, [r4, #0]
 80018ca:	2e00      	cmp	r6, #0
 80018cc:	d002      	beq.n	80018d4 <TIM_Cmd+0x60>
 80018ce:	431d      	orrs	r5, r3
 80018d0:	8025      	strh	r5, [r4, #0]
 80018d2:	e001      	b.n	80018d8 <TIM_Cmd+0x64>
 80018d4:	43ab      	bics	r3, r5
 80018d6:	8023      	strh	r3, [r4, #0]
 80018d8:	bd70      	pop	{r4, r5, r6, pc}
 80018da:	46c0      	nop			; (mov r8, r8)
 80018dc:	40012c00 	.word	0x40012c00
 80018e0:	40000400 	.word	0x40000400
 80018e4:	40001000 	.word	0x40001000
 80018e8:	40001400 	.word	0x40001400
 80018ec:	40002000 	.word	0x40002000
 80018f0:	40014000 	.word	0x40014000
 80018f4:	40014400 	.word	0x40014400
 80018f8:	bffeb800 	.word	0xbffeb800

080018fc <TIM_ITConfig>:
 80018fc:	4b1f      	ldr	r3, [pc, #124]	; (800197c <TIM_ITConfig+0x80>)
 80018fe:	b570      	push	{r4, r5, r6, lr}
 8001900:	1c04      	adds	r4, r0, #0
 8001902:	1c0d      	adds	r5, r1, #0
 8001904:	1c16      	adds	r6, r2, #0
 8001906:	4298      	cmp	r0, r3
 8001908:	d01a      	beq.n	8001940 <TIM_ITConfig+0x44>
 800190a:	2380      	movs	r3, #128	; 0x80
 800190c:	05db      	lsls	r3, r3, #23
 800190e:	4298      	cmp	r0, r3
 8001910:	d016      	beq.n	8001940 <TIM_ITConfig+0x44>
 8001912:	4b1b      	ldr	r3, [pc, #108]	; (8001980 <TIM_ITConfig+0x84>)
 8001914:	4298      	cmp	r0, r3
 8001916:	d013      	beq.n	8001940 <TIM_ITConfig+0x44>
 8001918:	4b1a      	ldr	r3, [pc, #104]	; (8001984 <TIM_ITConfig+0x88>)
 800191a:	4298      	cmp	r0, r3
 800191c:	d010      	beq.n	8001940 <TIM_ITConfig+0x44>
 800191e:	4b1a      	ldr	r3, [pc, #104]	; (8001988 <TIM_ITConfig+0x8c>)
 8001920:	4298      	cmp	r0, r3
 8001922:	d00d      	beq.n	8001940 <TIM_ITConfig+0x44>
 8001924:	4b19      	ldr	r3, [pc, #100]	; (800198c <TIM_ITConfig+0x90>)
 8001926:	4298      	cmp	r0, r3
 8001928:	d00a      	beq.n	8001940 <TIM_ITConfig+0x44>
 800192a:	4b19      	ldr	r3, [pc, #100]	; (8001990 <TIM_ITConfig+0x94>)
 800192c:	4298      	cmp	r0, r3
 800192e:	d007      	beq.n	8001940 <TIM_ITConfig+0x44>
 8001930:	4b18      	ldr	r3, [pc, #96]	; (8001994 <TIM_ITConfig+0x98>)
 8001932:	4298      	cmp	r0, r3
 8001934:	d004      	beq.n	8001940 <TIM_ITConfig+0x44>
 8001936:	4a18      	ldr	r2, [pc, #96]	; (8001998 <TIM_ITConfig+0x9c>)
 8001938:	1880      	adds	r0, r0, r2
 800193a:	4243      	negs	r3, r0
 800193c:	4158      	adcs	r0, r3
 800193e:	e000      	b.n	8001942 <TIM_ITConfig+0x46>
 8001940:	2001      	movs	r0, #1
 8001942:	f7ff fbfb 	bl	800113c <assert_param>
 8001946:	23ff      	movs	r3, #255	; 0xff
 8001948:	1c2a      	adds	r2, r5, #0
 800194a:	2000      	movs	r0, #0
 800194c:	439a      	bics	r2, r3
 800194e:	4282      	cmp	r2, r0
 8001950:	d102      	bne.n	8001958 <TIM_ITConfig+0x5c>
 8001952:	1c28      	adds	r0, r5, #0
 8001954:	1e43      	subs	r3, r0, #1
 8001956:	4198      	sbcs	r0, r3
 8001958:	f7ff fbf0 	bl	800113c <assert_param>
 800195c:	2301      	movs	r3, #1
 800195e:	2000      	movs	r0, #0
 8001960:	42b3      	cmp	r3, r6
 8001962:	4140      	adcs	r0, r0
 8001964:	f7ff fbea 	bl	800113c <assert_param>
 8001968:	89a3      	ldrh	r3, [r4, #12]
 800196a:	2e00      	cmp	r6, #0
 800196c:	d002      	beq.n	8001974 <TIM_ITConfig+0x78>
 800196e:	431d      	orrs	r5, r3
 8001970:	81a5      	strh	r5, [r4, #12]
 8001972:	e001      	b.n	8001978 <TIM_ITConfig+0x7c>
 8001974:	43ab      	bics	r3, r5
 8001976:	81a3      	strh	r3, [r4, #12]
 8001978:	bd70      	pop	{r4, r5, r6, pc}
 800197a:	46c0      	nop			; (mov r8, r8)
 800197c:	40012c00 	.word	0x40012c00
 8001980:	40000400 	.word	0x40000400
 8001984:	40001000 	.word	0x40001000
 8001988:	40001400 	.word	0x40001400
 800198c:	40002000 	.word	0x40002000
 8001990:	40014000 	.word	0x40014000
 8001994:	40014400 	.word	0x40014400
 8001998:	bffeb800 	.word	0xbffeb800

0800199c <GPIO_Init>:
 800199c:	2390      	movs	r3, #144	; 0x90
 800199e:	b5f7      	push	{r0, r1, r2, r4, r5, r6, r7, lr}
 80019a0:	05db      	lsls	r3, r3, #23
 80019a2:	1c04      	adds	r4, r0, #0
 80019a4:	1c0d      	adds	r5, r1, #0
 80019a6:	4298      	cmp	r0, r3
 80019a8:	d010      	beq.n	80019cc <GPIO_Init+0x30>
 80019aa:	4b38      	ldr	r3, [pc, #224]	; (8001a8c <GPIO_Init+0xf0>)
 80019ac:	4298      	cmp	r0, r3
 80019ae:	d00d      	beq.n	80019cc <GPIO_Init+0x30>
 80019b0:	4b37      	ldr	r3, [pc, #220]	; (8001a90 <GPIO_Init+0xf4>)
 80019b2:	4298      	cmp	r0, r3
 80019b4:	d00a      	beq.n	80019cc <GPIO_Init+0x30>
 80019b6:	4b37      	ldr	r3, [pc, #220]	; (8001a94 <GPIO_Init+0xf8>)
 80019b8:	4298      	cmp	r0, r3
 80019ba:	d007      	beq.n	80019cc <GPIO_Init+0x30>
 80019bc:	4b36      	ldr	r3, [pc, #216]	; (8001a98 <GPIO_Init+0xfc>)
 80019be:	4298      	cmp	r0, r3
 80019c0:	d004      	beq.n	80019cc <GPIO_Init+0x30>
 80019c2:	4a36      	ldr	r2, [pc, #216]	; (8001a9c <GPIO_Init+0x100>)
 80019c4:	1880      	adds	r0, r0, r2
 80019c6:	4243      	negs	r3, r0
 80019c8:	4158      	adcs	r0, r3
 80019ca:	e000      	b.n	80019ce <GPIO_Init+0x32>
 80019cc:	2001      	movs	r0, #1
 80019ce:	f7ff fbb5 	bl	800113c <assert_param>
 80019d2:	6828      	ldr	r0, [r5, #0]
 80019d4:	2600      	movs	r6, #0
 80019d6:	1e43      	subs	r3, r0, #1
 80019d8:	4198      	sbcs	r0, r3
 80019da:	f7ff fbaf 	bl	800113c <assert_param>
 80019de:	792b      	ldrb	r3, [r5, #4]
 80019e0:	2203      	movs	r2, #3
 80019e2:	1c30      	adds	r0, r6, #0
 80019e4:	429a      	cmp	r2, r3
 80019e6:	4170      	adcs	r0, r6
 80019e8:	f7ff fba8 	bl	800113c <assert_param>
 80019ec:	79eb      	ldrb	r3, [r5, #7]
 80019ee:	2202      	movs	r2, #2
 80019f0:	1c30      	adds	r0, r6, #0
 80019f2:	429a      	cmp	r2, r3
 80019f4:	4170      	adcs	r0, r6
 80019f6:	f7ff fba1 	bl	800113c <assert_param>
 80019fa:	2001      	movs	r0, #1
 80019fc:	1c03      	adds	r3, r0, #0
 80019fe:	682a      	ldr	r2, [r5, #0]
 8001a00:	40b3      	lsls	r3, r6
 8001a02:	401a      	ands	r2, r3
 8001a04:	9201      	str	r2, [sp, #4]
 8001a06:	429a      	cmp	r2, r3
 8001a08:	d13b      	bne.n	8001a82 <GPIO_Init+0xe6>
 8001a0a:	792b      	ldrb	r3, [r5, #4]
 8001a0c:	0077      	lsls	r7, r6, #1
 8001a0e:	3b01      	subs	r3, #1
 8001a10:	4283      	cmp	r3, r0
 8001a12:	d822      	bhi.n	8001a5a <GPIO_Init+0xbe>
 8001a14:	796b      	ldrb	r3, [r5, #5]
 8001a16:	4283      	cmp	r3, r0
 8001a18:	d902      	bls.n	8001a20 <GPIO_Init+0x84>
 8001a1a:	1ed8      	subs	r0, r3, #3
 8001a1c:	4243      	negs	r3, r0
 8001a1e:	4158      	adcs	r0, r3
 8001a20:	f7ff fb8c 	bl	800113c <assert_param>
 8001a24:	68a3      	ldr	r3, [r4, #8]
 8001a26:	2203      	movs	r2, #3
 8001a28:	40ba      	lsls	r2, r7
 8001a2a:	4393      	bics	r3, r2
 8001a2c:	60a3      	str	r3, [r4, #8]
 8001a2e:	796b      	ldrb	r3, [r5, #5]
 8001a30:	68a2      	ldr	r2, [r4, #8]
 8001a32:	40bb      	lsls	r3, r7
 8001a34:	4313      	orrs	r3, r2
 8001a36:	60a3      	str	r3, [r4, #8]
 8001a38:	79ab      	ldrb	r3, [r5, #6]
 8001a3a:	2201      	movs	r2, #1
 8001a3c:	2000      	movs	r0, #0
 8001a3e:	429a      	cmp	r2, r3
 8001a40:	4140      	adcs	r0, r0
 8001a42:	f7ff fb7b 	bl	800113c <assert_param>
 8001a46:	88a3      	ldrh	r3, [r4, #4]
 8001a48:	9a01      	ldr	r2, [sp, #4]
 8001a4a:	4393      	bics	r3, r2
 8001a4c:	80a3      	strh	r3, [r4, #4]
 8001a4e:	79ab      	ldrb	r3, [r5, #6]
 8001a50:	88a2      	ldrh	r2, [r4, #4]
 8001a52:	40b3      	lsls	r3, r6
 8001a54:	4313      	orrs	r3, r2
 8001a56:	b29b      	uxth	r3, r3
 8001a58:	80a3      	strh	r3, [r4, #4]
 8001a5a:	2303      	movs	r3, #3
 8001a5c:	6822      	ldr	r2, [r4, #0]
 8001a5e:	40bb      	lsls	r3, r7
 8001a60:	43db      	mvns	r3, r3
 8001a62:	401a      	ands	r2, r3
 8001a64:	6022      	str	r2, [r4, #0]
 8001a66:	792a      	ldrb	r2, [r5, #4]
 8001a68:	6821      	ldr	r1, [r4, #0]
 8001a6a:	40ba      	lsls	r2, r7
 8001a6c:	430a      	orrs	r2, r1
 8001a6e:	6022      	str	r2, [r4, #0]
 8001a70:	68e2      	ldr	r2, [r4, #12]
 8001a72:	4013      	ands	r3, r2
 8001a74:	60e3      	str	r3, [r4, #12]
 8001a76:	79ea      	ldrb	r2, [r5, #7]
 8001a78:	68e3      	ldr	r3, [r4, #12]
 8001a7a:	40ba      	lsls	r2, r7
 8001a7c:	1c17      	adds	r7, r2, #0
 8001a7e:	431f      	orrs	r7, r3
 8001a80:	60e7      	str	r7, [r4, #12]
 8001a82:	3601      	adds	r6, #1
 8001a84:	2e10      	cmp	r6, #16
 8001a86:	d1b8      	bne.n	80019fa <GPIO_Init+0x5e>
 8001a88:	bdf7      	pop	{r0, r1, r2, r4, r5, r6, r7, pc}
 8001a8a:	46c0      	nop			; (mov r8, r8)
 8001a8c:	48000400 	.word	0x48000400
 8001a90:	48000800 	.word	0x48000800
 8001a94:	48000c00 	.word	0x48000c00
 8001a98:	48001000 	.word	0x48001000
 8001a9c:	b7ffec00 	.word	0xb7ffec00

08001aa0 <GPIO_PinAFConfig>:
 8001aa0:	b5f7      	push	{r0, r1, r2, r4, r5, r6, r7, lr}
 8001aa2:	2390      	movs	r3, #144	; 0x90
 8001aa4:	1c04      	adds	r4, r0, #0
 8001aa6:	1c0e      	adds	r6, r1, #0
 8001aa8:	9201      	str	r2, [sp, #4]
 8001aaa:	05db      	lsls	r3, r3, #23
 8001aac:	4298      	cmp	r0, r3
 8001aae:	d010      	beq.n	8001ad2 <GPIO_PinAFConfig+0x32>
 8001ab0:	4b19      	ldr	r3, [pc, #100]	; (8001b18 <GPIO_PinAFConfig+0x78>)
 8001ab2:	4298      	cmp	r0, r3
 8001ab4:	d00d      	beq.n	8001ad2 <GPIO_PinAFConfig+0x32>
 8001ab6:	4b19      	ldr	r3, [pc, #100]	; (8001b1c <GPIO_PinAFConfig+0x7c>)
 8001ab8:	4298      	cmp	r0, r3
 8001aba:	d00a      	beq.n	8001ad2 <GPIO_PinAFConfig+0x32>
 8001abc:	4b18      	ldr	r3, [pc, #96]	; (8001b20 <GPIO_PinAFConfig+0x80>)
 8001abe:	4298      	cmp	r0, r3
 8001ac0:	d007      	beq.n	8001ad2 <GPIO_PinAFConfig+0x32>
 8001ac2:	4b18      	ldr	r3, [pc, #96]	; (8001b24 <GPIO_PinAFConfig+0x84>)
 8001ac4:	4298      	cmp	r0, r3
 8001ac6:	d004      	beq.n	8001ad2 <GPIO_PinAFConfig+0x32>
 8001ac8:	4a17      	ldr	r2, [pc, #92]	; (8001b28 <GPIO_PinAFConfig+0x88>)
 8001aca:	1880      	adds	r0, r0, r2
 8001acc:	4243      	negs	r3, r0
 8001ace:	4158      	adcs	r0, r3
 8001ad0:	e000      	b.n	8001ad4 <GPIO_PinAFConfig+0x34>
 8001ad2:	2001      	movs	r0, #1
 8001ad4:	2500      	movs	r5, #0
 8001ad6:	f7ff fb31 	bl	800113c <assert_param>
 8001ada:	230f      	movs	r3, #15
 8001adc:	1c28      	adds	r0, r5, #0
 8001ade:	42b3      	cmp	r3, r6
 8001ae0:	4168      	adcs	r0, r5
 8001ae2:	f7ff fb2b 	bl	800113c <assert_param>
 8001ae6:	9a01      	ldr	r2, [sp, #4]
 8001ae8:	1c28      	adds	r0, r5, #0
 8001aea:	2707      	movs	r7, #7
 8001aec:	4297      	cmp	r7, r2
 8001aee:	4168      	adcs	r0, r5
 8001af0:	4037      	ands	r7, r6
 8001af2:	08f6      	lsrs	r6, r6, #3
 8001af4:	00b6      	lsls	r6, r6, #2
 8001af6:	19a4      	adds	r4, r4, r6
 8001af8:	f7ff fb20 	bl	800113c <assert_param>
 8001afc:	00bf      	lsls	r7, r7, #2
 8001afe:	6a23      	ldr	r3, [r4, #32]
 8001b00:	220f      	movs	r2, #15
 8001b02:	40ba      	lsls	r2, r7
 8001b04:	4393      	bics	r3, r2
 8001b06:	9a01      	ldr	r2, [sp, #4]
 8001b08:	6223      	str	r3, [r4, #32]
 8001b0a:	6a23      	ldr	r3, [r4, #32]
 8001b0c:	40ba      	lsls	r2, r7
 8001b0e:	1c17      	adds	r7, r2, #0
 8001b10:	431f      	orrs	r7, r3
 8001b12:	6227      	str	r7, [r4, #32]
 8001b14:	bdf7      	pop	{r0, r1, r2, r4, r5, r6, r7, pc}
 8001b16:	46c0      	nop			; (mov r8, r8)
 8001b18:	48000400 	.word	0x48000400
 8001b1c:	48000800 	.word	0x48000800
 8001b20:	48000c00 	.word	0x48000c00
 8001b24:	48001000 	.word	0x48001000
 8001b28:	b7ffec00 	.word	0xb7ffec00

08001b2c <USART_Init>:
 8001b2c:	b5f0      	push	{r4, r5, r6, r7, lr}
 8001b2e:	4e55      	ldr	r6, [pc, #340]	; (8001c84 <USART_Init+0x158>)
 8001b30:	b08b      	sub	sp, #44	; 0x2c
 8001b32:	1c04      	adds	r4, r0, #0
 8001b34:	1c0d      	adds	r5, r1, #0
 8001b36:	42b0      	cmp	r0, r6
 8001b38:	d016      	beq.n	8001b68 <USART_Init+0x3c>
 8001b3a:	4b53      	ldr	r3, [pc, #332]	; (8001c88 <USART_Init+0x15c>)
 8001b3c:	4298      	cmp	r0, r3
 8001b3e:	d013      	beq.n	8001b68 <USART_Init+0x3c>
 8001b40:	4b52      	ldr	r3, [pc, #328]	; (8001c8c <USART_Init+0x160>)
 8001b42:	4298      	cmp	r0, r3
 8001b44:	d010      	beq.n	8001b68 <USART_Init+0x3c>
 8001b46:	4b52      	ldr	r3, [pc, #328]	; (8001c90 <USART_Init+0x164>)
 8001b48:	4298      	cmp	r0, r3
 8001b4a:	d00d      	beq.n	8001b68 <USART_Init+0x3c>
 8001b4c:	4b51      	ldr	r3, [pc, #324]	; (8001c94 <USART_Init+0x168>)
 8001b4e:	4298      	cmp	r0, r3
 8001b50:	d00a      	beq.n	8001b68 <USART_Init+0x3c>
 8001b52:	4b51      	ldr	r3, [pc, #324]	; (8001c98 <USART_Init+0x16c>)
 8001b54:	4298      	cmp	r0, r3
 8001b56:	d007      	beq.n	8001b68 <USART_Init+0x3c>
 8001b58:	4b50      	ldr	r3, [pc, #320]	; (8001c9c <USART_Init+0x170>)
 8001b5a:	4298      	cmp	r0, r3
 8001b5c:	d004      	beq.n	8001b68 <USART_Init+0x3c>
 8001b5e:	4950      	ldr	r1, [pc, #320]	; (8001ca0 <USART_Init+0x174>)
 8001b60:	1840      	adds	r0, r0, r1
 8001b62:	4243      	negs	r3, r0
 8001b64:	4158      	adcs	r0, r3
 8001b66:	e000      	b.n	8001b6a <USART_Init+0x3e>
 8001b68:	2001      	movs	r0, #1
 8001b6a:	f7ff fae7 	bl	800113c <assert_param>
 8001b6e:	682b      	ldr	r3, [r5, #0]
 8001b70:	4a4c      	ldr	r2, [pc, #304]	; (8001ca4 <USART_Init+0x178>)
 8001b72:	3b01      	subs	r3, #1
 8001b74:	2000      	movs	r0, #0
 8001b76:	429a      	cmp	r2, r3
 8001b78:	4140      	adcs	r0, r0
 8001b7a:	f7ff fadf 	bl	800113c <assert_param>
 8001b7e:	686b      	ldr	r3, [r5, #4]
 8001b80:	4a49      	ldr	r2, [pc, #292]	; (8001ca8 <USART_Init+0x17c>)
 8001b82:	2001      	movs	r0, #1
 8001b84:	4213      	tst	r3, r2
 8001b86:	d003      	beq.n	8001b90 <USART_Init+0x64>
 8001b88:	4a48      	ldr	r2, [pc, #288]	; (8001cac <USART_Init+0x180>)
 8001b8a:	1898      	adds	r0, r3, r2
 8001b8c:	4243      	negs	r3, r0
 8001b8e:	4158      	adcs	r0, r3
 8001b90:	f7ff fad4 	bl	800113c <assert_param>
 8001b94:	68ab      	ldr	r3, [r5, #8]
 8001b96:	4a46      	ldr	r2, [pc, #280]	; (8001cb0 <USART_Init+0x184>)
 8001b98:	2001      	movs	r0, #1
 8001b9a:	4213      	tst	r3, r2
 8001b9c:	d003      	beq.n	8001ba6 <USART_Init+0x7a>
 8001b9e:	4945      	ldr	r1, [pc, #276]	; (8001cb4 <USART_Init+0x188>)
 8001ba0:	1858      	adds	r0, r3, r1
 8001ba2:	4243      	negs	r3, r0
 8001ba4:	4158      	adcs	r0, r3
 8001ba6:	f7ff fac9 	bl	800113c <assert_param>
 8001baa:	68eb      	ldr	r3, [r5, #12]
 8001bac:	4a42      	ldr	r2, [pc, #264]	; (8001cb8 <USART_Init+0x18c>)
 8001bae:	2001      	movs	r0, #1
 8001bb0:	4213      	tst	r3, r2
 8001bb2:	d003      	beq.n	8001bbc <USART_Init+0x90>
 8001bb4:	4a41      	ldr	r2, [pc, #260]	; (8001cbc <USART_Init+0x190>)
 8001bb6:	1898      	adds	r0, r3, r2
 8001bb8:	4243      	negs	r3, r0
 8001bba:	4158      	adcs	r0, r3
 8001bbc:	f7ff fabe 	bl	800113c <assert_param>
 8001bc0:	692b      	ldr	r3, [r5, #16]
 8001bc2:	220c      	movs	r2, #12
 8001bc4:	1c19      	adds	r1, r3, #0
 8001bc6:	2000      	movs	r0, #0
 8001bc8:	4391      	bics	r1, r2
 8001bca:	4281      	cmp	r1, r0
 8001bcc:	d102      	bne.n	8001bd4 <USART_Init+0xa8>
 8001bce:	1c18      	adds	r0, r3, #0
 8001bd0:	1e43      	subs	r3, r0, #1
 8001bd2:	4198      	sbcs	r0, r3
 8001bd4:	f7ff fab2 	bl	800113c <assert_param>
 8001bd8:	4b39      	ldr	r3, [pc, #228]	; (8001cc0 <USART_Init+0x194>)
 8001bda:	696a      	ldr	r2, [r5, #20]
 8001bdc:	2001      	movs	r0, #1
 8001bde:	4013      	ands	r3, r2
 8001be0:	d003      	beq.n	8001bea <USART_Init+0xbe>
 8001be2:	4938      	ldr	r1, [pc, #224]	; (8001cc4 <USART_Init+0x198>)
 8001be4:	1858      	adds	r0, r3, r1
 8001be6:	4243      	negs	r3, r0
 8001be8:	4158      	adcs	r0, r3
 8001bea:	f7ff faa7 	bl	800113c <assert_param>
 8001bee:	6823      	ldr	r3, [r4, #0]
 8001bf0:	2201      	movs	r2, #1
 8001bf2:	4393      	bics	r3, r2
 8001bf4:	6023      	str	r3, [r4, #0]
 8001bf6:	6862      	ldr	r2, [r4, #4]
 8001bf8:	4b33      	ldr	r3, [pc, #204]	; (8001cc8 <USART_Init+0x19c>)
 8001bfa:	6869      	ldr	r1, [r5, #4]
 8001bfc:	4013      	ands	r3, r2
 8001bfe:	68aa      	ldr	r2, [r5, #8]
 8001c00:	4668      	mov	r0, sp
 8001c02:	4313      	orrs	r3, r2
 8001c04:	6063      	str	r3, [r4, #4]
 8001c06:	6822      	ldr	r2, [r4, #0]
 8001c08:	4b30      	ldr	r3, [pc, #192]	; (8001ccc <USART_Init+0x1a0>)
 8001c0a:	401a      	ands	r2, r3
 8001c0c:	68eb      	ldr	r3, [r5, #12]
 8001c0e:	430b      	orrs	r3, r1
 8001c10:	6929      	ldr	r1, [r5, #16]
 8001c12:	430b      	orrs	r3, r1
 8001c14:	4313      	orrs	r3, r2
 8001c16:	6023      	str	r3, [r4, #0]
 8001c18:	68a2      	ldr	r2, [r4, #8]
 8001c1a:	4b2d      	ldr	r3, [pc, #180]	; (8001cd0 <USART_Init+0x1a4>)
 8001c1c:	4013      	ands	r3, r2
 8001c1e:	696a      	ldr	r2, [r5, #20]
 8001c20:	4313      	orrs	r3, r2
 8001c22:	60a3      	str	r3, [r4, #8]
 8001c24:	f000 f9d8 	bl	8001fd8 <RCC_GetClocksFreq>
 8001c28:	42b4      	cmp	r4, r6
 8001c2a:	d101      	bne.n	8001c30 <USART_Init+0x104>
 8001c2c:	9e06      	ldr	r6, [sp, #24]
 8001c2e:	e00a      	b.n	8001c46 <USART_Init+0x11a>
 8001c30:	4b15      	ldr	r3, [pc, #84]	; (8001c88 <USART_Init+0x15c>)
 8001c32:	429c      	cmp	r4, r3
 8001c34:	d101      	bne.n	8001c3a <USART_Init+0x10e>
 8001c36:	9e07      	ldr	r6, [sp, #28]
 8001c38:	e005      	b.n	8001c46 <USART_Init+0x11a>
 8001c3a:	4b14      	ldr	r3, [pc, #80]	; (8001c8c <USART_Init+0x160>)
 8001c3c:	429c      	cmp	r4, r3
 8001c3e:	d101      	bne.n	8001c44 <USART_Init+0x118>
 8001c40:	9e08      	ldr	r6, [sp, #32]
 8001c42:	e000      	b.n	8001c46 <USART_Init+0x11a>
 8001c44:	9e02      	ldr	r6, [sp, #8]
 8001c46:	6823      	ldr	r3, [r4, #0]
 8001c48:	682f      	ldr	r7, [r5, #0]
 8001c4a:	0419      	lsls	r1, r3, #16
 8001c4c:	d500      	bpl.n	8001c50 <USART_Init+0x124>
 8001c4e:	0076      	lsls	r6, r6, #1
 8001c50:	1c39      	adds	r1, r7, #0
 8001c52:	1c30      	adds	r0, r6, #0
 8001c54:	f000 fc86 	bl	8002564 <__aeabi_uidiv>
 8001c58:	1c39      	adds	r1, r7, #0
 8001c5a:	1c05      	adds	r5, r0, #0
 8001c5c:	1c30      	adds	r0, r6, #0
 8001c5e:	f000 fcc5 	bl	80025ec <__aeabi_uidivmod>
 8001c62:	087f      	lsrs	r7, r7, #1
 8001c64:	2300      	movs	r3, #0
 8001c66:	42b9      	cmp	r1, r7
 8001c68:	415b      	adcs	r3, r3
 8001c6a:	18ed      	adds	r5, r5, r3
 8001c6c:	6823      	ldr	r3, [r4, #0]
 8001c6e:	041a      	lsls	r2, r3, #16
 8001c70:	d504      	bpl.n	8001c7c <USART_Init+0x150>
 8001c72:	4a18      	ldr	r2, [pc, #96]	; (8001cd4 <USART_Init+0x1a8>)
 8001c74:	072b      	lsls	r3, r5, #28
 8001c76:	0f5b      	lsrs	r3, r3, #29
 8001c78:	4015      	ands	r5, r2
 8001c7a:	431d      	orrs	r5, r3
 8001c7c:	b2ad      	uxth	r5, r5
 8001c7e:	81a5      	strh	r5, [r4, #12]
 8001c80:	b00b      	add	sp, #44	; 0x2c
 8001c82:	bdf0      	pop	{r4, r5, r6, r7, pc}
 8001c84:	40013800 	.word	0x40013800
 8001c88:	40004400 	.word	0x40004400
 8001c8c:	40004800 	.word	0x40004800
 8001c90:	40004c00 	.word	0x40004c00
 8001c94:	40005000 	.word	0x40005000
 8001c98:	40011400 	.word	0x40011400
 8001c9c:	40011800 	.word	0x40011800
 8001ca0:	bffee400 	.word	0xbffee400
 8001ca4:	005b8d7f 	.word	0x005b8d7f
 8001ca8:	ffffefff 	.word	0xffffefff
 8001cac:	effff000 	.word	0xeffff000
 8001cb0:	ffffdfff 	.word	0xffffdfff
 8001cb4:	ffffd000 	.word	0xffffd000
 8001cb8:	fffffbff 	.word	0xfffffbff
 8001cbc:	fffffa00 	.word	0xfffffa00
 8001cc0:	fffffeff 	.word	0xfffffeff
 8001cc4:	fffffe00 	.word	0xfffffe00
 8001cc8:	ffffcfff 	.word	0xffffcfff
 8001ccc:	ffffe9f3 	.word	0xffffe9f3
 8001cd0:	fffffcff 	.word	0xfffffcff
 8001cd4:	0000fff0 	.word	0x0000fff0

08001cd8 <USART_Cmd>:
 8001cd8:	4b17      	ldr	r3, [pc, #92]	; (8001d38 <USART_Cmd+0x60>)
 8001cda:	b570      	push	{r4, r5, r6, lr}
 8001cdc:	1c04      	adds	r4, r0, #0
 8001cde:	1c0e      	adds	r6, r1, #0
 8001ce0:	4298      	cmp	r0, r3
 8001ce2:	d016      	beq.n	8001d12 <USART_Cmd+0x3a>
 8001ce4:	4b15      	ldr	r3, [pc, #84]	; (8001d3c <USART_Cmd+0x64>)
 8001ce6:	4298      	cmp	r0, r3
 8001ce8:	d013      	beq.n	8001d12 <USART_Cmd+0x3a>
 8001cea:	4b15      	ldr	r3, [pc, #84]	; (8001d40 <USART_Cmd+0x68>)
 8001cec:	4298      	cmp	r0, r3
 8001cee:	d010      	beq.n	8001d12 <USART_Cmd+0x3a>
 8001cf0:	4b14      	ldr	r3, [pc, #80]	; (8001d44 <USART_Cmd+0x6c>)
 8001cf2:	4298      	cmp	r0, r3
 8001cf4:	d00d      	beq.n	8001d12 <USART_Cmd+0x3a>
 8001cf6:	4b14      	ldr	r3, [pc, #80]	; (8001d48 <USART_Cmd+0x70>)
 8001cf8:	4298      	cmp	r0, r3
 8001cfa:	d00a      	beq.n	8001d12 <USART_Cmd+0x3a>
 8001cfc:	4b13      	ldr	r3, [pc, #76]	; (8001d4c <USART_Cmd+0x74>)
 8001cfe:	4298      	cmp	r0, r3
 8001d00:	d007      	beq.n	8001d12 <USART_Cmd+0x3a>
 8001d02:	4b13      	ldr	r3, [pc, #76]	; (8001d50 <USART_Cmd+0x78>)
 8001d04:	4298      	cmp	r0, r3
 8001d06:	d004      	beq.n	8001d12 <USART_Cmd+0x3a>
 8001d08:	4b12      	ldr	r3, [pc, #72]	; (8001d54 <USART_Cmd+0x7c>)
 8001d0a:	18c0      	adds	r0, r0, r3
 8001d0c:	4243      	negs	r3, r0
 8001d0e:	4158      	adcs	r0, r3
 8001d10:	e000      	b.n	8001d14 <USART_Cmd+0x3c>
 8001d12:	2001      	movs	r0, #1
 8001d14:	f7ff fa12 	bl	800113c <assert_param>
 8001d18:	2501      	movs	r5, #1
 8001d1a:	2000      	movs	r0, #0
 8001d1c:	42b5      	cmp	r5, r6
 8001d1e:	4140      	adcs	r0, r0
 8001d20:	f7ff fa0c 	bl	800113c <assert_param>
 8001d24:	6823      	ldr	r3, [r4, #0]
 8001d26:	2e00      	cmp	r6, #0
 8001d28:	d002      	beq.n	8001d30 <USART_Cmd+0x58>
 8001d2a:	431d      	orrs	r5, r3
 8001d2c:	6025      	str	r5, [r4, #0]
 8001d2e:	e001      	b.n	8001d34 <USART_Cmd+0x5c>
 8001d30:	43ab      	bics	r3, r5
 8001d32:	6023      	str	r3, [r4, #0]
 8001d34:	bd70      	pop	{r4, r5, r6, pc}
 8001d36:	46c0      	nop			; (mov r8, r8)
 8001d38:	40013800 	.word	0x40013800
 8001d3c:	40004400 	.word	0x40004400
 8001d40:	40004800 	.word	0x40004800
 8001d44:	40004c00 	.word	0x40004c00
 8001d48:	40005000 	.word	0x40005000
 8001d4c:	40011400 	.word	0x40011400
 8001d50:	40011800 	.word	0x40011800
 8001d54:	bffee400 	.word	0xbffee400

08001d58 <USART_ReceiveData>:
 8001d58:	4b11      	ldr	r3, [pc, #68]	; (8001da0 <USART_ReceiveData+0x48>)
 8001d5a:	b510      	push	{r4, lr}
 8001d5c:	1e04      	subs	r4, r0, #0
 8001d5e:	429c      	cmp	r4, r3
 8001d60:	d016      	beq.n	8001d90 <USART_ReceiveData+0x38>
 8001d62:	4b10      	ldr	r3, [pc, #64]	; (8001da4 <USART_ReceiveData+0x4c>)
 8001d64:	4298      	cmp	r0, r3
 8001d66:	d013      	beq.n	8001d90 <USART_ReceiveData+0x38>
 8001d68:	4b0f      	ldr	r3, [pc, #60]	; (8001da8 <USART_ReceiveData+0x50>)
 8001d6a:	4298      	cmp	r0, r3
 8001d6c:	d010      	beq.n	8001d90 <USART_ReceiveData+0x38>
 8001d6e:	4b0f      	ldr	r3, [pc, #60]	; (8001dac <USART_ReceiveData+0x54>)
 8001d70:	4298      	cmp	r0, r3
 8001d72:	d00d      	beq.n	8001d90 <USART_ReceiveData+0x38>
 8001d74:	4b0e      	ldr	r3, [pc, #56]	; (8001db0 <USART_ReceiveData+0x58>)
 8001d76:	4298      	cmp	r0, r3
 8001d78:	d00a      	beq.n	8001d90 <USART_ReceiveData+0x38>
 8001d7a:	4b0e      	ldr	r3, [pc, #56]	; (8001db4 <USART_ReceiveData+0x5c>)
 8001d7c:	4298      	cmp	r0, r3
 8001d7e:	d007      	beq.n	8001d90 <USART_ReceiveData+0x38>
 8001d80:	4b0d      	ldr	r3, [pc, #52]	; (8001db8 <USART_ReceiveData+0x60>)
 8001d82:	4298      	cmp	r0, r3
 8001d84:	d004      	beq.n	8001d90 <USART_ReceiveData+0x38>
 8001d86:	4b0d      	ldr	r3, [pc, #52]	; (8001dbc <USART_ReceiveData+0x64>)
 8001d88:	18c0      	adds	r0, r0, r3
 8001d8a:	4243      	negs	r3, r0
 8001d8c:	4158      	adcs	r0, r3
 8001d8e:	e000      	b.n	8001d92 <USART_ReceiveData+0x3a>
 8001d90:	2001      	movs	r0, #1
 8001d92:	f7ff f9d3 	bl	800113c <assert_param>
 8001d96:	8ca0      	ldrh	r0, [r4, #36]	; 0x24
 8001d98:	05c0      	lsls	r0, r0, #23
 8001d9a:	0dc0      	lsrs	r0, r0, #23
 8001d9c:	bd10      	pop	{r4, pc}
 8001d9e:	46c0      	nop			; (mov r8, r8)
 8001da0:	40013800 	.word	0x40013800
 8001da4:	40004400 	.word	0x40004400
 8001da8:	40004800 	.word	0x40004800
 8001dac:	40004c00 	.word	0x40004c00
 8001db0:	40005000 	.word	0x40005000
 8001db4:	40011400 	.word	0x40011400
 8001db8:	40011800 	.word	0x40011800
 8001dbc:	bffee400 	.word	0xbffee400

08001dc0 <USART_GetITStatus>:
 8001dc0:	b538      	push	{r3, r4, r5, lr}
 8001dc2:	4b36      	ldr	r3, [pc, #216]	; (8001e9c <USART_GetITStatus+0xdc>)
 8001dc4:	1c05      	adds	r5, r0, #0
 8001dc6:	1c0c      	adds	r4, r1, #0
 8001dc8:	4298      	cmp	r0, r3
 8001dca:	d016      	beq.n	8001dfa <USART_GetITStatus+0x3a>
 8001dcc:	4b34      	ldr	r3, [pc, #208]	; (8001ea0 <USART_GetITStatus+0xe0>)
 8001dce:	4298      	cmp	r0, r3
 8001dd0:	d013      	beq.n	8001dfa <USART_GetITStatus+0x3a>
 8001dd2:	4b34      	ldr	r3, [pc, #208]	; (8001ea4 <USART_GetITStatus+0xe4>)
 8001dd4:	4298      	cmp	r0, r3
 8001dd6:	d010      	beq.n	8001dfa <USART_GetITStatus+0x3a>
 8001dd8:	4b33      	ldr	r3, [pc, #204]	; (8001ea8 <USART_GetITStatus+0xe8>)
 8001dda:	4298      	cmp	r0, r3
 8001ddc:	d00d      	beq.n	8001dfa <USART_GetITStatus+0x3a>
 8001dde:	4b33      	ldr	r3, [pc, #204]	; (8001eac <USART_GetITStatus+0xec>)
 8001de0:	4298      	cmp	r0, r3
 8001de2:	d00a      	beq.n	8001dfa <USART_GetITStatus+0x3a>
 8001de4:	4b32      	ldr	r3, [pc, #200]	; (8001eb0 <USART_GetITStatus+0xf0>)
 8001de6:	4298      	cmp	r0, r3
 8001de8:	d007      	beq.n	8001dfa <USART_GetITStatus+0x3a>
 8001dea:	4b32      	ldr	r3, [pc, #200]	; (8001eb4 <USART_GetITStatus+0xf4>)
 8001dec:	4298      	cmp	r0, r3
 8001dee:	d004      	beq.n	8001dfa <USART_GetITStatus+0x3a>
 8001df0:	4a31      	ldr	r2, [pc, #196]	; (8001eb8 <USART_GetITStatus+0xf8>)
 8001df2:	1880      	adds	r0, r0, r2
 8001df4:	4243      	negs	r3, r0
 8001df6:	4158      	adcs	r0, r3
 8001df8:	e000      	b.n	8001dfc <USART_GetITStatus+0x3c>
 8001dfa:	2001      	movs	r0, #1
 8001dfc:	f7ff f99e 	bl	800113c <assert_param>
 8001e00:	2384      	movs	r3, #132	; 0x84
 8001e02:	005b      	lsls	r3, r3, #1
 8001e04:	429c      	cmp	r4, r3
 8001e06:	d027      	beq.n	8001e58 <USART_GetITStatus+0x98>
 8001e08:	4b2c      	ldr	r3, [pc, #176]	; (8001ebc <USART_GetITStatus+0xfc>)
 8001e0a:	429c      	cmp	r4, r3
 8001e0c:	d024      	beq.n	8001e58 <USART_GetITStatus+0x98>
 8001e0e:	4b2c      	ldr	r3, [pc, #176]	; (8001ec0 <USART_GetITStatus+0x100>)
 8001e10:	429c      	cmp	r4, r3
 8001e12:	d021      	beq.n	8001e58 <USART_GetITStatus+0x98>
 8001e14:	4b2b      	ldr	r3, [pc, #172]	; (8001ec4 <USART_GetITStatus+0x104>)
 8001e16:	429c      	cmp	r4, r3
 8001e18:	d01e      	beq.n	8001e58 <USART_GetITStatus+0x98>
 8001e1a:	4b2b      	ldr	r3, [pc, #172]	; (8001ec8 <USART_GetITStatus+0x108>)
 8001e1c:	429c      	cmp	r4, r3
 8001e1e:	d01b      	beq.n	8001e58 <USART_GetITStatus+0x98>
 8001e20:	4b2a      	ldr	r3, [pc, #168]	; (8001ecc <USART_GetITStatus+0x10c>)
 8001e22:	429c      	cmp	r4, r3
 8001e24:	d018      	beq.n	8001e58 <USART_GetITStatus+0x98>
 8001e26:	4b2a      	ldr	r3, [pc, #168]	; (8001ed0 <USART_GetITStatus+0x110>)
 8001e28:	429c      	cmp	r4, r3
 8001e2a:	d015      	beq.n	8001e58 <USART_GetITStatus+0x98>
 8001e2c:	4b29      	ldr	r3, [pc, #164]	; (8001ed4 <USART_GetITStatus+0x114>)
 8001e2e:	429c      	cmp	r4, r3
 8001e30:	d012      	beq.n	8001e58 <USART_GetITStatus+0x98>
 8001e32:	4a29      	ldr	r2, [pc, #164]	; (8001ed8 <USART_GetITStatus+0x118>)
 8001e34:	4b29      	ldr	r3, [pc, #164]	; (8001edc <USART_GetITStatus+0x11c>)
 8001e36:	4022      	ands	r2, r4
 8001e38:	429a      	cmp	r2, r3
 8001e3a:	d00d      	beq.n	8001e58 <USART_GetITStatus+0x98>
 8001e3c:	4b28      	ldr	r3, [pc, #160]	; (8001ee0 <USART_GetITStatus+0x120>)
 8001e3e:	429c      	cmp	r4, r3
 8001e40:	d00a      	beq.n	8001e58 <USART_GetITStatus+0x98>
 8001e42:	4b28      	ldr	r3, [pc, #160]	; (8001ee4 <USART_GetITStatus+0x124>)
 8001e44:	429c      	cmp	r4, r3
 8001e46:	d007      	beq.n	8001e58 <USART_GetITStatus+0x98>
 8001e48:	4b27      	ldr	r3, [pc, #156]	; (8001ee8 <USART_GetITStatus+0x128>)
 8001e4a:	429c      	cmp	r4, r3
 8001e4c:	d004      	beq.n	8001e58 <USART_GetITStatus+0x98>
 8001e4e:	4a27      	ldr	r2, [pc, #156]	; (8001eec <USART_GetITStatus+0x12c>)
 8001e50:	18a3      	adds	r3, r4, r2
 8001e52:	4258      	negs	r0, r3
 8001e54:	4158      	adcs	r0, r3
 8001e56:	e000      	b.n	8001e5a <USART_GetITStatus+0x9a>
 8001e58:	2001      	movs	r0, #1
 8001e5a:	f7ff f96f 	bl	800113c <assert_param>
 8001e5e:	b2e3      	uxtb	r3, r4
 8001e60:	2101      	movs	r1, #1
 8001e62:	b2a2      	uxth	r2, r4
 8001e64:	4099      	lsls	r1, r3
 8001e66:	0a12      	lsrs	r2, r2, #8
 8001e68:	1c0b      	adds	r3, r1, #0
 8001e6a:	2a01      	cmp	r2, #1
 8001e6c:	d101      	bne.n	8001e72 <USART_GetITStatus+0xb2>
 8001e6e:	682a      	ldr	r2, [r5, #0]
 8001e70:	e004      	b.n	8001e7c <USART_GetITStatus+0xbc>
 8001e72:	2a02      	cmp	r2, #2
 8001e74:	d101      	bne.n	8001e7a <USART_GetITStatus+0xba>
 8001e76:	686a      	ldr	r2, [r5, #4]
 8001e78:	e000      	b.n	8001e7c <USART_GetITStatus+0xbc>
 8001e7a:	68aa      	ldr	r2, [r5, #8]
 8001e7c:	2000      	movs	r0, #0
 8001e7e:	4013      	ands	r3, r2
 8001e80:	69ea      	ldr	r2, [r5, #28]
 8001e82:	4283      	cmp	r3, r0
 8001e84:	d008      	beq.n	8001e98 <USART_GetITStatus+0xd8>
 8001e86:	0c24      	lsrs	r4, r4, #16
 8001e88:	2001      	movs	r0, #1
 8001e8a:	40a0      	lsls	r0, r4
 8001e8c:	1c04      	adds	r4, r0, #0
 8001e8e:	1c10      	adds	r0, r2, #0
 8001e90:	4020      	ands	r0, r4
 8001e92:	1e44      	subs	r4, r0, #1
 8001e94:	41a0      	sbcs	r0, r4
 8001e96:	b2c0      	uxtb	r0, r0
 8001e98:	bd38      	pop	{r3, r4, r5, pc}
 8001e9a:	46c0      	nop			; (mov r8, r8)
 8001e9c:	40013800 	.word	0x40013800
 8001ea0:	40004400 	.word	0x40004400
 8001ea4:	40004800 	.word	0x40004800
 8001ea8:	40004c00 	.word	0x40004c00
 8001eac:	40005000 	.word	0x40005000
 8001eb0:	40011400 	.word	0x40011400
 8001eb4:	40011800 	.word	0x40011800
 8001eb8:	bffee400 	.word	0xbffee400
 8001ebc:	00070107 	.word	0x00070107
 8001ec0:	00060106 	.word	0x00060106
 8001ec4:	00050105 	.word	0x00050105
 8001ec8:	00040104 	.word	0x00040104
 8001ecc:	00080206 	.word	0x00080206
 8001ed0:	0009030a 	.word	0x0009030a
 8001ed4:	00020300 	.word	0x00020300
 8001ed8:	fffdffff 	.word	0xfffdffff
 8001edc:	00010300 	.word	0x00010300
 8001ee0:	000b011a 	.word	0x000b011a
 8001ee4:	000c011b 	.word	0x000c011b
 8001ee8:	0011010e 	.word	0x0011010e
 8001eec:	ffebfcea 	.word	0xffebfcea

08001ef0 <USART_ClearITPendingBit>:
 8001ef0:	b538      	push	{r3, r4, r5, lr}
 8001ef2:	4b26      	ldr	r3, [pc, #152]	; (8001f8c <USART_ClearITPendingBit+0x9c>)
 8001ef4:	1c05      	adds	r5, r0, #0
 8001ef6:	1c0c      	adds	r4, r1, #0
 8001ef8:	4298      	cmp	r0, r3
 8001efa:	d016      	beq.n	8001f2a <USART_ClearITPendingBit+0x3a>
 8001efc:	4b24      	ldr	r3, [pc, #144]	; (8001f90 <USART_ClearITPendingBit+0xa0>)
 8001efe:	4298      	cmp	r0, r3
 8001f00:	d013      	beq.n	8001f2a <USART_ClearITPendingBit+0x3a>
 8001f02:	4b24      	ldr	r3, [pc, #144]	; (8001f94 <USART_ClearITPendingBit+0xa4>)
 8001f04:	4298      	cmp	r0, r3
 8001f06:	d010      	beq.n	8001f2a <USART_ClearITPendingBit+0x3a>
 8001f08:	4b23      	ldr	r3, [pc, #140]	; (8001f98 <USART_ClearITPendingBit+0xa8>)
 8001f0a:	4298      	cmp	r0, r3
 8001f0c:	d00d      	beq.n	8001f2a <USART_ClearITPendingBit+0x3a>
 8001f0e:	4b23      	ldr	r3, [pc, #140]	; (8001f9c <USART_ClearITPendingBit+0xac>)
 8001f10:	4298      	cmp	r0, r3
 8001f12:	d00a      	beq.n	8001f2a <USART_ClearITPendingBit+0x3a>
 8001f14:	4b22      	ldr	r3, [pc, #136]	; (8001fa0 <USART_ClearITPendingBit+0xb0>)
 8001f16:	4298      	cmp	r0, r3
 8001f18:	d007      	beq.n	8001f2a <USART_ClearITPendingBit+0x3a>
 8001f1a:	4b22      	ldr	r3, [pc, #136]	; (8001fa4 <USART_ClearITPendingBit+0xb4>)
 8001f1c:	4298      	cmp	r0, r3
 8001f1e:	d004      	beq.n	8001f2a <USART_ClearITPendingBit+0x3a>
 8001f20:	4a21      	ldr	r2, [pc, #132]	; (8001fa8 <USART_ClearITPendingBit+0xb8>)
 8001f22:	1880      	adds	r0, r0, r2
 8001f24:	4243      	negs	r3, r0
 8001f26:	4158      	adcs	r0, r3
 8001f28:	e000      	b.n	8001f2c <USART_ClearITPendingBit+0x3c>
 8001f2a:	2001      	movs	r0, #1
 8001f2c:	f7ff f906 	bl	800113c <assert_param>
 8001f30:	4b1e      	ldr	r3, [pc, #120]	; (8001fac <USART_ClearITPendingBit+0xbc>)
 8001f32:	429c      	cmp	r4, r3
 8001f34:	d022      	beq.n	8001f7c <USART_ClearITPendingBit+0x8c>
 8001f36:	2384      	movs	r3, #132	; 0x84
 8001f38:	005b      	lsls	r3, r3, #1
 8001f3a:	429c      	cmp	r4, r3
 8001f3c:	d01e      	beq.n	8001f7c <USART_ClearITPendingBit+0x8c>
 8001f3e:	4a1c      	ldr	r2, [pc, #112]	; (8001fb0 <USART_ClearITPendingBit+0xc0>)
 8001f40:	4b1c      	ldr	r3, [pc, #112]	; (8001fb4 <USART_ClearITPendingBit+0xc4>)
 8001f42:	4022      	ands	r2, r4
 8001f44:	429a      	cmp	r2, r3
 8001f46:	d019      	beq.n	8001f7c <USART_ClearITPendingBit+0x8c>
 8001f48:	4b1b      	ldr	r3, [pc, #108]	; (8001fb8 <USART_ClearITPendingBit+0xc8>)
 8001f4a:	429c      	cmp	r4, r3
 8001f4c:	d016      	beq.n	8001f7c <USART_ClearITPendingBit+0x8c>
 8001f4e:	4b1b      	ldr	r3, [pc, #108]	; (8001fbc <USART_ClearITPendingBit+0xcc>)
 8001f50:	429c      	cmp	r4, r3
 8001f52:	d013      	beq.n	8001f7c <USART_ClearITPendingBit+0x8c>
 8001f54:	4b1a      	ldr	r3, [pc, #104]	; (8001fc0 <USART_ClearITPendingBit+0xd0>)
 8001f56:	429c      	cmp	r4, r3
 8001f58:	d010      	beq.n	8001f7c <USART_ClearITPendingBit+0x8c>
 8001f5a:	4b1a      	ldr	r3, [pc, #104]	; (8001fc4 <USART_ClearITPendingBit+0xd4>)
 8001f5c:	429c      	cmp	r4, r3
 8001f5e:	d00d      	beq.n	8001f7c <USART_ClearITPendingBit+0x8c>
 8001f60:	4b19      	ldr	r3, [pc, #100]	; (8001fc8 <USART_ClearITPendingBit+0xd8>)
 8001f62:	429c      	cmp	r4, r3
 8001f64:	d00a      	beq.n	8001f7c <USART_ClearITPendingBit+0x8c>
 8001f66:	4b19      	ldr	r3, [pc, #100]	; (8001fcc <USART_ClearITPendingBit+0xdc>)
 8001f68:	429c      	cmp	r4, r3
 8001f6a:	d007      	beq.n	8001f7c <USART_ClearITPendingBit+0x8c>
 8001f6c:	4b18      	ldr	r3, [pc, #96]	; (8001fd0 <USART_ClearITPendingBit+0xe0>)
 8001f6e:	429c      	cmp	r4, r3
 8001f70:	d004      	beq.n	8001f7c <USART_ClearITPendingBit+0x8c>
 8001f72:	4a18      	ldr	r2, [pc, #96]	; (8001fd4 <USART_ClearITPendingBit+0xe4>)
 8001f74:	18a3      	adds	r3, r4, r2
 8001f76:	4258      	negs	r0, r3
 8001f78:	4158      	adcs	r0, r3
 8001f7a:	e000      	b.n	8001f7e <USART_ClearITPendingBit+0x8e>
 8001f7c:	2001      	movs	r0, #1
 8001f7e:	f7ff f8dd 	bl	800113c <assert_param>
 8001f82:	0c24      	lsrs	r4, r4, #16
 8001f84:	2301      	movs	r3, #1
 8001f86:	40a3      	lsls	r3, r4
 8001f88:	622b      	str	r3, [r5, #32]
 8001f8a:	bd38      	pop	{r3, r4, r5, pc}
 8001f8c:	40013800 	.word	0x40013800
 8001f90:	40004400 	.word	0x40004400
 8001f94:	40004800 	.word	0x40004800
 8001f98:	40004c00 	.word	0x40004c00
 8001f9c:	40005000 	.word	0x40005000
 8001fa0:	40011400 	.word	0x40011400
 8001fa4:	40011800 	.word	0x40011800
 8001fa8:	bffee400 	.word	0xbffee400
 8001fac:	00060106 	.word	0x00060106
 8001fb0:	fffdffff 	.word	0xfffdffff
 8001fb4:	00010300 	.word	0x00010300
 8001fb8:	00020300 	.word	0x00020300
 8001fbc:	00040104 	.word	0x00040104
 8001fc0:	00080206 	.word	0x00080206
 8001fc4:	0009030a 	.word	0x0009030a
 8001fc8:	000b011a 	.word	0x000b011a
 8001fcc:	000c011b 	.word	0x000c011b
 8001fd0:	0011010e 	.word	0x0011010e
 8001fd4:	ffebfcea 	.word	0xffebfcea

08001fd8 <RCC_GetClocksFreq>:
 8001fd8:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
 8001fda:	4d5a      	ldr	r5, [pc, #360]	; (8002144 <RCC_GetClocksFreq+0x16c>)
 8001fdc:	1c04      	adds	r4, r0, #0
 8001fde:	6868      	ldr	r0, [r5, #4]
 8001fe0:	230c      	movs	r3, #12
 8001fe2:	4018      	ands	r0, r3
 8001fe4:	f000 fab4 	bl	8002550 <__gnu_thumb1_case_uqi>
 8001fe8:	1f1f1f1f 	.word	0x1f1f1f1f
 8001fec:	1f1f1f1f 	.word	0x1f1f1f1f
 8001ff0:	1f1f1f07 	.word	0x1f1f1f07
 8001ff4:	1d          	.byte	0x1d
 8001ff5:	00          	.byte	0x00
 8001ff6:	686e      	ldr	r6, [r5, #4]
 8001ff8:	23c0      	movs	r3, #192	; 0xc0
 8001ffa:	02b6      	lsls	r6, r6, #10
 8001ffc:	686a      	ldr	r2, [r5, #4]
 8001ffe:	0f36      	lsrs	r6, r6, #28
 8002000:	025b      	lsls	r3, r3, #9
 8002002:	3602      	adds	r6, #2
 8002004:	421a      	tst	r2, r3
 8002006:	d101      	bne.n	800200c <RCC_GetClocksFreq+0x34>
 8002008:	484f      	ldr	r0, [pc, #316]	; (8002148 <RCC_GetClocksFreq+0x170>)
 800200a:	e007      	b.n	800201c <RCC_GetClocksFreq+0x44>
 800200c:	4b4d      	ldr	r3, [pc, #308]	; (8002144 <RCC_GetClocksFreq+0x16c>)
 800200e:	484f      	ldr	r0, [pc, #316]	; (800214c <RCC_GetClocksFreq+0x174>)
 8002010:	6ad9      	ldr	r1, [r3, #44]	; 0x2c
 8002012:	230f      	movs	r3, #15
 8002014:	4019      	ands	r1, r3
 8002016:	3101      	adds	r1, #1
 8002018:	f000 faa4 	bl	8002564 <__aeabi_uidiv>
 800201c:	4370      	muls	r0, r6
 800201e:	6020      	str	r0, [r4, #0]
 8002020:	e004      	b.n	800202c <RCC_GetClocksFreq+0x54>
 8002022:	4b4b      	ldr	r3, [pc, #300]	; (8002150 <RCC_GetClocksFreq+0x178>)
 8002024:	e000      	b.n	8002028 <RCC_GetClocksFreq+0x50>
 8002026:	4b49      	ldr	r3, [pc, #292]	; (800214c <RCC_GetClocksFreq+0x174>)
 8002028:	6023      	str	r3, [r4, #0]
 800202a:	2000      	movs	r0, #0
 800202c:	686b      	ldr	r3, [r5, #4]
 800202e:	4a49      	ldr	r2, [pc, #292]	; (8002154 <RCC_GetClocksFreq+0x17c>)
 8002030:	061b      	lsls	r3, r3, #24
 8002032:	0f1b      	lsrs	r3, r3, #28
 8002034:	6821      	ldr	r1, [r4, #0]
 8002036:	5cd3      	ldrb	r3, [r2, r3]
 8002038:	1c0e      	adds	r6, r1, #0
 800203a:	40de      	lsrs	r6, r3
 800203c:	6066      	str	r6, [r4, #4]
 800203e:	1c33      	adds	r3, r6, #0
 8002040:	686e      	ldr	r6, [r5, #4]
 8002042:	0576      	lsls	r6, r6, #21
 8002044:	0f76      	lsrs	r6, r6, #29
 8002046:	5d92      	ldrb	r2, [r2, r6]
 8002048:	40d3      	lsrs	r3, r2
 800204a:	60a3      	str	r3, [r4, #8]
 800204c:	6b2a      	ldr	r2, [r5, #48]	; 0x30
 800204e:	05d6      	lsls	r6, r2, #23
 8002050:	d401      	bmi.n	8002056 <RCC_GetClocksFreq+0x7e>
 8002052:	4a41      	ldr	r2, [pc, #260]	; (8002158 <RCC_GetClocksFreq+0x180>)
 8002054:	e006      	b.n	8002064 <RCC_GetClocksFreq+0x8c>
 8002056:	4a3b      	ldr	r2, [pc, #236]	; (8002144 <RCC_GetClocksFreq+0x16c>)
 8002058:	6852      	ldr	r2, [r2, #4]
 800205a:	0456      	lsls	r6, r2, #17
 800205c:	d401      	bmi.n	8002062 <RCC_GetClocksFreq+0x8a>
 800205e:	085a      	lsrs	r2, r3, #1
 8002060:	e000      	b.n	8002064 <RCC_GetClocksFreq+0x8c>
 8002062:	089a      	lsrs	r2, r3, #2
 8002064:	60e2      	str	r2, [r4, #12]
 8002066:	6b2a      	ldr	r2, [r5, #48]	; 0x30
 8002068:	0656      	lsls	r6, r2, #25
 800206a:	d401      	bmi.n	8002070 <RCC_GetClocksFreq+0x98>
 800206c:	4a3b      	ldr	r2, [pc, #236]	; (800215c <RCC_GetClocksFreq+0x184>)
 800206e:	e001      	b.n	8002074 <RCC_GetClocksFreq+0x9c>
 8002070:	2280      	movs	r2, #128	; 0x80
 8002072:	0212      	lsls	r2, r2, #8
 8002074:	6122      	str	r2, [r4, #16]
 8002076:	6b2a      	ldr	r2, [r5, #48]	; 0x30
 8002078:	06d6      	lsls	r6, r2, #27
 800207a:	d402      	bmi.n	8002082 <RCC_GetClocksFreq+0xaa>
 800207c:	4a33      	ldr	r2, [pc, #204]	; (800214c <RCC_GetClocksFreq+0x174>)
 800207e:	6162      	str	r2, [r4, #20]
 8002080:	e000      	b.n	8002084 <RCC_GetClocksFreq+0xac>
 8002082:	6161      	str	r1, [r4, #20]
 8002084:	6b2f      	ldr	r7, [r5, #48]	; 0x30
 8002086:	2203      	movs	r2, #3
 8002088:	4e2e      	ldr	r6, [pc, #184]	; (8002144 <RCC_GetClocksFreq+0x16c>)
 800208a:	4217      	tst	r7, r2
 800208c:	d101      	bne.n	8002092 <RCC_GetClocksFreq+0xba>
 800208e:	61a3      	str	r3, [r4, #24]
 8002090:	e012      	b.n	80020b8 <RCC_GetClocksFreq+0xe0>
 8002092:	6b37      	ldr	r7, [r6, #48]	; 0x30
 8002094:	4017      	ands	r7, r2
 8002096:	2f01      	cmp	r7, #1
 8002098:	d101      	bne.n	800209e <RCC_GetClocksFreq+0xc6>
 800209a:	61a1      	str	r1, [r4, #24]
 800209c:	e00c      	b.n	80020b8 <RCC_GetClocksFreq+0xe0>
 800209e:	6b37      	ldr	r7, [r6, #48]	; 0x30
 80020a0:	4017      	ands	r7, r2
 80020a2:	2f02      	cmp	r7, #2
 80020a4:	d102      	bne.n	80020ac <RCC_GetClocksFreq+0xd4>
 80020a6:	2280      	movs	r2, #128	; 0x80
 80020a8:	0212      	lsls	r2, r2, #8
 80020aa:	e004      	b.n	80020b6 <RCC_GetClocksFreq+0xde>
 80020ac:	6b36      	ldr	r6, [r6, #48]	; 0x30
 80020ae:	4032      	ands	r2, r6
 80020b0:	2a03      	cmp	r2, #3
 80020b2:	d101      	bne.n	80020b8 <RCC_GetClocksFreq+0xe0>
 80020b4:	4a25      	ldr	r2, [pc, #148]	; (800214c <RCC_GetClocksFreq+0x174>)
 80020b6:	61a2      	str	r2, [r4, #24]
 80020b8:	22c0      	movs	r2, #192	; 0xc0
 80020ba:	6b2f      	ldr	r7, [r5, #48]	; 0x30
 80020bc:	0292      	lsls	r2, r2, #10
 80020be:	4e21      	ldr	r6, [pc, #132]	; (8002144 <RCC_GetClocksFreq+0x16c>)
 80020c0:	4217      	tst	r7, r2
 80020c2:	d101      	bne.n	80020c8 <RCC_GetClocksFreq+0xf0>
 80020c4:	61e3      	str	r3, [r4, #28]
 80020c6:	e018      	b.n	80020fa <RCC_GetClocksFreq+0x122>
 80020c8:	6b37      	ldr	r7, [r6, #48]	; 0x30
 80020ca:	4017      	ands	r7, r2
 80020cc:	46bc      	mov	ip, r7
 80020ce:	2780      	movs	r7, #128	; 0x80
 80020d0:	027f      	lsls	r7, r7, #9
 80020d2:	45bc      	cmp	ip, r7
 80020d4:	d101      	bne.n	80020da <RCC_GetClocksFreq+0x102>
 80020d6:	61e1      	str	r1, [r4, #28]
 80020d8:	e00f      	b.n	80020fa <RCC_GetClocksFreq+0x122>
 80020da:	6b37      	ldr	r7, [r6, #48]	; 0x30
 80020dc:	4017      	ands	r7, r2
 80020de:	46bc      	mov	ip, r7
 80020e0:	2780      	movs	r7, #128	; 0x80
 80020e2:	02bf      	lsls	r7, r7, #10
 80020e4:	45bc      	cmp	ip, r7
 80020e6:	d102      	bne.n	80020ee <RCC_GetClocksFreq+0x116>
 80020e8:	2280      	movs	r2, #128	; 0x80
 80020ea:	0212      	lsls	r2, r2, #8
 80020ec:	e004      	b.n	80020f8 <RCC_GetClocksFreq+0x120>
 80020ee:	6b36      	ldr	r6, [r6, #48]	; 0x30
 80020f0:	4016      	ands	r6, r2
 80020f2:	4296      	cmp	r6, r2
 80020f4:	d101      	bne.n	80020fa <RCC_GetClocksFreq+0x122>
 80020f6:	4a15      	ldr	r2, [pc, #84]	; (800214c <RCC_GetClocksFreq+0x174>)
 80020f8:	61e2      	str	r2, [r4, #28]
 80020fa:	22c0      	movs	r2, #192	; 0xc0
 80020fc:	6b2f      	ldr	r7, [r5, #48]	; 0x30
 80020fe:	0312      	lsls	r2, r2, #12
 8002100:	4e10      	ldr	r6, [pc, #64]	; (8002144 <RCC_GetClocksFreq+0x16c>)
 8002102:	4217      	tst	r7, r2
 8002104:	d015      	beq.n	8002132 <RCC_GetClocksFreq+0x15a>
 8002106:	6b37      	ldr	r7, [r6, #48]	; 0x30
 8002108:	2380      	movs	r3, #128	; 0x80
 800210a:	4017      	ands	r7, r2
 800210c:	02db      	lsls	r3, r3, #11
 800210e:	429f      	cmp	r7, r3
 8002110:	d101      	bne.n	8002116 <RCC_GetClocksFreq+0x13e>
 8002112:	6221      	str	r1, [r4, #32]
 8002114:	e00e      	b.n	8002134 <RCC_GetClocksFreq+0x15c>
 8002116:	6b31      	ldr	r1, [r6, #48]	; 0x30
 8002118:	2380      	movs	r3, #128	; 0x80
 800211a:	4011      	ands	r1, r2
 800211c:	031b      	lsls	r3, r3, #12
 800211e:	4299      	cmp	r1, r3
 8002120:	d102      	bne.n	8002128 <RCC_GetClocksFreq+0x150>
 8002122:	2380      	movs	r3, #128	; 0x80
 8002124:	021b      	lsls	r3, r3, #8
 8002126:	e004      	b.n	8002132 <RCC_GetClocksFreq+0x15a>
 8002128:	6b33      	ldr	r3, [r6, #48]	; 0x30
 800212a:	4013      	ands	r3, r2
 800212c:	4293      	cmp	r3, r2
 800212e:	d101      	bne.n	8002134 <RCC_GetClocksFreq+0x15c>
 8002130:	4b06      	ldr	r3, [pc, #24]	; (800214c <RCC_GetClocksFreq+0x174>)
 8002132:	6223      	str	r3, [r4, #32]
 8002134:	6b2b      	ldr	r3, [r5, #48]	; 0x30
 8002136:	061a      	lsls	r2, r3, #24
 8002138:	d402      	bmi.n	8002140 <RCC_GetClocksFreq+0x168>
 800213a:	4b05      	ldr	r3, [pc, #20]	; (8002150 <RCC_GetClocksFreq+0x178>)
 800213c:	6263      	str	r3, [r4, #36]	; 0x24
 800213e:	e000      	b.n	8002142 <RCC_GetClocksFreq+0x16a>
 8002140:	6260      	str	r0, [r4, #36]	; 0x24
 8002142:	bdf8      	pop	{r3, r4, r5, r6, r7, pc}
 8002144:	40021000 	.word	0x40021000
 8002148:	003d0900 	.word	0x003d0900
 800214c:	007a1200 	.word	0x007a1200
 8002150:	02dc6c00 	.word	0x02dc6c00
 8002154:	20000000 	.word	0x20000000
 8002158:	00d59f80 	.word	0x00d59f80
 800215c:	00008012 	.word	0x00008012

08002160 <RCC_AHBPeriphClockCmd>:
 8002160:	b538      	push	{r3, r4, r5, lr}
 8002162:	4b0d      	ldr	r3, [pc, #52]	; (8002198 <RCC_AHBPeriphClockCmd+0x38>)
 8002164:	1c04      	adds	r4, r0, #0
 8002166:	1c0d      	adds	r5, r1, #0
 8002168:	2000      	movs	r0, #0
 800216a:	421c      	tst	r4, r3
 800216c:	d102      	bne.n	8002174 <RCC_AHBPeriphClockCmd+0x14>
 800216e:	1c20      	adds	r0, r4, #0
 8002170:	1e43      	subs	r3, r0, #1
 8002172:	4198      	sbcs	r0, r3
 8002174:	f7fe ffe2 	bl	800113c <assert_param>
 8002178:	2301      	movs	r3, #1
 800217a:	2000      	movs	r0, #0
 800217c:	42ab      	cmp	r3, r5
 800217e:	4140      	adcs	r0, r0
 8002180:	f7fe ffdc 	bl	800113c <assert_param>
 8002184:	4b05      	ldr	r3, [pc, #20]	; (800219c <RCC_AHBPeriphClockCmd+0x3c>)
 8002186:	695a      	ldr	r2, [r3, #20]
 8002188:	2d00      	cmp	r5, #0
 800218a:	d002      	beq.n	8002192 <RCC_AHBPeriphClockCmd+0x32>
 800218c:	4314      	orrs	r4, r2
 800218e:	615c      	str	r4, [r3, #20]
 8002190:	e001      	b.n	8002196 <RCC_AHBPeriphClockCmd+0x36>
 8002192:	43a2      	bics	r2, r4
 8002194:	615a      	str	r2, [r3, #20]
 8002196:	bd38      	pop	{r3, r4, r5, pc}
 8002198:	fe81ffa8 	.word	0xfe81ffa8
 800219c:	40021000 	.word	0x40021000

080021a0 <RCC_APB2PeriphClockCmd>:
 80021a0:	b538      	push	{r3, r4, r5, lr}
 80021a2:	4b0d      	ldr	r3, [pc, #52]	; (80021d8 <RCC_APB2PeriphClockCmd+0x38>)
 80021a4:	1c04      	adds	r4, r0, #0
 80021a6:	1c0d      	adds	r5, r1, #0
 80021a8:	2000      	movs	r0, #0
 80021aa:	421c      	tst	r4, r3
 80021ac:	d102      	bne.n	80021b4 <RCC_APB2PeriphClockCmd+0x14>
 80021ae:	1c20      	adds	r0, r4, #0
 80021b0:	1e43      	subs	r3, r0, #1
 80021b2:	4198      	sbcs	r0, r3
 80021b4:	f7fe ffc2 	bl	800113c <assert_param>
 80021b8:	2301      	movs	r3, #1
 80021ba:	2000      	movs	r0, #0
 80021bc:	42ab      	cmp	r3, r5
 80021be:	4140      	adcs	r0, r0
 80021c0:	f7fe ffbc 	bl	800113c <assert_param>
 80021c4:	4b05      	ldr	r3, [pc, #20]	; (80021dc <RCC_APB2PeriphClockCmd+0x3c>)
 80021c6:	699a      	ldr	r2, [r3, #24]
 80021c8:	2d00      	cmp	r5, #0
 80021ca:	d002      	beq.n	80021d2 <RCC_APB2PeriphClockCmd+0x32>
 80021cc:	4314      	orrs	r4, r2
 80021ce:	619c      	str	r4, [r3, #24]
 80021d0:	e001      	b.n	80021d6 <RCC_APB2PeriphClockCmd+0x36>
 80021d2:	43a2      	bics	r2, r4
 80021d4:	619a      	str	r2, [r3, #24]
 80021d6:	bd38      	pop	{r3, r4, r5, pc}
 80021d8:	ffb8a51e 	.word	0xffb8a51e
 80021dc:	40021000 	.word	0x40021000

080021e0 <RCC_APB1PeriphClockCmd>:
 80021e0:	b538      	push	{r3, r4, r5, lr}
 80021e2:	4b0d      	ldr	r3, [pc, #52]	; (8002218 <RCC_APB1PeriphClockCmd+0x38>)
 80021e4:	1c04      	adds	r4, r0, #0
 80021e6:	1c0d      	adds	r5, r1, #0
 80021e8:	2000      	movs	r0, #0
 80021ea:	421c      	tst	r4, r3
 80021ec:	d102      	bne.n	80021f4 <RCC_APB1PeriphClockCmd+0x14>
 80021ee:	1c20      	adds	r0, r4, #0
 80021f0:	1e43      	subs	r3, r0, #1
 80021f2:	4198      	sbcs	r0, r3
 80021f4:	f7fe ffa2 	bl	800113c <assert_param>
 80021f8:	2301      	movs	r3, #1
 80021fa:	2000      	movs	r0, #0
 80021fc:	42ab      	cmp	r3, r5
 80021fe:	4140      	adcs	r0, r0
 8002200:	f7fe ff9c 	bl	800113c <assert_param>
 8002204:	4b05      	ldr	r3, [pc, #20]	; (800221c <RCC_APB1PeriphClockCmd+0x3c>)
 8002206:	69da      	ldr	r2, [r3, #28]
 8002208:	2d00      	cmp	r5, #0
 800220a:	d002      	beq.n	8002212 <RCC_APB1PeriphClockCmd+0x32>
 800220c:	4314      	orrs	r4, r2
 800220e:	61dc      	str	r4, [r3, #28]
 8002210:	e001      	b.n	8002216 <RCC_APB1PeriphClockCmd+0x36>
 8002212:	43a2      	bics	r2, r4
 8002214:	61da      	str	r2, [r3, #28]
 8002216:	bd38      	pop	{r3, r4, r5, pc}
 8002218:	8581b6cc 	.word	0x8581b6cc
 800221c:	40021000 	.word	0x40021000

08002220 <timer_init>:
 8002220:	b530      	push	{r4, r5, lr}
 8002222:	2300      	movs	r3, #0
 8002224:	b085      	sub	sp, #20
 8002226:	481b      	ldr	r0, [pc, #108]	; (8002294 <timer_init+0x74>)
 8002228:	2180      	movs	r1, #128	; 0x80
 800222a:	005a      	lsls	r2, r3, #1
 800222c:	00c9      	lsls	r1, r1, #3
 800222e:	5211      	strh	r1, [r2, r0]
 8002230:	4819      	ldr	r0, [pc, #100]	; (8002298 <timer_init+0x78>)
 8002232:	2400      	movs	r4, #0
 8002234:	5211      	strh	r1, [r2, r0]
 8002236:	4919      	ldr	r1, [pc, #100]	; (800229c <timer_init+0x7c>)
 8002238:	3301      	adds	r3, #1
 800223a:	5254      	strh	r4, [r2, r1]
 800223c:	2b04      	cmp	r3, #4
 800223e:	d1f2      	bne.n	8002226 <timer_init+0x6>
 8002240:	4b17      	ldr	r3, [pc, #92]	; (80022a0 <timer_init+0x80>)
 8002242:	2001      	movs	r0, #1
 8002244:	1c01      	adds	r1, r0, #0
 8002246:	601c      	str	r4, [r3, #0]
 8002248:	f7ff ffca 	bl	80021e0 <RCC_APB1PeriphClockCmd>
 800224c:	a901      	add	r1, sp, #4
 800224e:	2330      	movs	r3, #48	; 0x30
 8002250:	800b      	strh	r3, [r1, #0]
 8002252:	2080      	movs	r0, #128	; 0x80
 8002254:	23fa      	movs	r3, #250	; 0xfa
 8002256:	009b      	lsls	r3, r3, #2
 8002258:	05c0      	lsls	r0, r0, #23
 800225a:	604b      	str	r3, [r1, #4]
 800225c:	804c      	strh	r4, [r1, #2]
 800225e:	810c      	strh	r4, [r1, #8]
 8002260:	728c      	strb	r4, [r1, #10]
 8002262:	f7ff fa85 	bl	8001770 <TIM_TimeBaseInit>
 8002266:	2080      	movs	r0, #128	; 0x80
 8002268:	05c0      	lsls	r0, r0, #23
 800226a:	2101      	movs	r1, #1
 800226c:	f7ff fb02 	bl	8001874 <TIM_Cmd>
 8002270:	2080      	movs	r0, #128	; 0x80
 8002272:	2102      	movs	r1, #2
 8002274:	05c0      	lsls	r0, r0, #23
 8002276:	2201      	movs	r2, #1
 8002278:	f7ff fb40 	bl	80018fc <TIM_ITConfig>
 800227c:	466a      	mov	r2, sp
 800227e:	230f      	movs	r3, #15
 8002280:	7013      	strb	r3, [r2, #0]
 8002282:	4668      	mov	r0, sp
 8002284:	2301      	movs	r3, #1
 8002286:	7053      	strb	r3, [r2, #1]
 8002288:	7093      	strb	r3, [r2, #2]
 800228a:	f7ff fa37 	bl	80016fc <NVIC_Init>
 800228e:	b005      	add	sp, #20
 8002290:	bd30      	pop	{r4, r5, pc}
 8002292:	46c0      	nop			; (mov r8, r8)
 8002294:	200008a0 	.word	0x200008a0
 8002298:	20000894 	.word	0x20000894
 800229c:	2000088c 	.word	0x2000088c
 80022a0:	2000089c 	.word	0x2000089c

080022a4 <TIM2_IRQHandler>:
 80022a4:	2200      	movs	r2, #0
 80022a6:	490e      	ldr	r1, [pc, #56]	; (80022e0 <TIM2_IRQHandler+0x3c>)
 80022a8:	0053      	lsls	r3, r2, #1
 80022aa:	5a58      	ldrh	r0, [r3, r1]
 80022ac:	2800      	cmp	r0, #0
 80022ae:	d003      	beq.n	80022b8 <TIM2_IRQHandler+0x14>
 80022b0:	5a58      	ldrh	r0, [r3, r1]
 80022b2:	3801      	subs	r0, #1
 80022b4:	b280      	uxth	r0, r0
 80022b6:	e005      	b.n	80022c4 <TIM2_IRQHandler+0x20>
 80022b8:	480a      	ldr	r0, [pc, #40]	; (80022e4 <TIM2_IRQHandler+0x40>)
 80022ba:	5a18      	ldrh	r0, [r3, r0]
 80022bc:	b280      	uxth	r0, r0
 80022be:	5258      	strh	r0, [r3, r1]
 80022c0:	4909      	ldr	r1, [pc, #36]	; (80022e8 <TIM2_IRQHandler+0x44>)
 80022c2:	2001      	movs	r0, #1
 80022c4:	3201      	adds	r2, #1
 80022c6:	5258      	strh	r0, [r3, r1]
 80022c8:	2a04      	cmp	r2, #4
 80022ca:	d1ec      	bne.n	80022a6 <TIM2_IRQHandler+0x2>
 80022cc:	4b07      	ldr	r3, [pc, #28]	; (80022ec <TIM2_IRQHandler+0x48>)
 80022ce:	681a      	ldr	r2, [r3, #0]
 80022d0:	3201      	adds	r2, #1
 80022d2:	601a      	str	r2, [r3, #0]
 80022d4:	2380      	movs	r3, #128	; 0x80
 80022d6:	2200      	movs	r2, #0
 80022d8:	05db      	lsls	r3, r3, #23
 80022da:	821a      	strh	r2, [r3, #16]
 80022dc:	4770      	bx	lr
 80022de:	46c0      	nop			; (mov r8, r8)
 80022e0:	200008a0 	.word	0x200008a0
 80022e4:	20000894 	.word	0x20000894
 80022e8:	2000088c 	.word	0x2000088c
 80022ec:	2000089c 	.word	0x2000089c

080022f0 <timer_delay_loops>:
 80022f0:	3801      	subs	r0, #1
 80022f2:	d301      	bcc.n	80022f8 <timer_delay_loops+0x8>
 80022f4:	46c0      	nop			; (mov r8, r8)
 80022f6:	e7fb      	b.n	80022f0 <timer_delay_loops>
 80022f8:	4770      	bx	lr
	...

080022fc <timer_get_time>:
 80022fc:	b082      	sub	sp, #8
 80022fe:	b672      	cpsid	i
 8002300:	4b03      	ldr	r3, [pc, #12]	; (8002310 <timer_get_time+0x14>)
 8002302:	681b      	ldr	r3, [r3, #0]
 8002304:	9301      	str	r3, [sp, #4]
 8002306:	b662      	cpsie	i
 8002308:	9801      	ldr	r0, [sp, #4]
 800230a:	b002      	add	sp, #8
 800230c:	4770      	bx	lr
 800230e:	46c0      	nop			; (mov r8, r8)
 8002310:	2000089c 	.word	0x2000089c

08002314 <timer_delay_ms>:
 8002314:	b513      	push	{r0, r1, r4, lr}
 8002316:	1c04      	adds	r4, r0, #0
 8002318:	f7ff fff0 	bl	80022fc <timer_get_time>
 800231c:	1904      	adds	r4, r0, r4
 800231e:	9401      	str	r4, [sp, #4]
 8002320:	9c01      	ldr	r4, [sp, #4]
 8002322:	f7ff ffeb 	bl	80022fc <timer_get_time>
 8002326:	4284      	cmp	r4, r0
 8002328:	d902      	bls.n	8002330 <timer_delay_ms+0x1c>
 800232a:	f7fe ff15 	bl	8001158 <sleep>
 800232e:	e7f7      	b.n	8002320 <timer_delay_ms+0xc>
 8002330:	bd13      	pop	{r0, r1, r4, pc}
	...

08002334 <event_timer_set_period>:
 8002334:	b672      	cpsid	i
 8002336:	4b05      	ldr	r3, [pc, #20]	; (800234c <event_timer_set_period+0x18>)
 8002338:	0040      	lsls	r0, r0, #1
 800233a:	52c1      	strh	r1, [r0, r3]
 800233c:	4b04      	ldr	r3, [pc, #16]	; (8002350 <event_timer_set_period+0x1c>)
 800233e:	2200      	movs	r2, #0
 8002340:	52c1      	strh	r1, [r0, r3]
 8002342:	4b04      	ldr	r3, [pc, #16]	; (8002354 <event_timer_set_period+0x20>)
 8002344:	52c2      	strh	r2, [r0, r3]
 8002346:	b662      	cpsie	i
 8002348:	4770      	bx	lr
 800234a:	46c0      	nop			; (mov r8, r8)
 800234c:	200008a0 	.word	0x200008a0
 8002350:	20000894 	.word	0x20000894
 8002354:	2000088c 	.word	0x2000088c

08002358 <event_timer_get_flag>:
 8002358:	b082      	sub	sp, #8
 800235a:	b672      	cpsid	i
 800235c:	4b04      	ldr	r3, [pc, #16]	; (8002370 <event_timer_get_flag+0x18>)
 800235e:	0040      	lsls	r0, r0, #1
 8002360:	5ac3      	ldrh	r3, [r0, r3]
 8002362:	b29b      	uxth	r3, r3
 8002364:	9301      	str	r3, [sp, #4]
 8002366:	b662      	cpsie	i
 8002368:	9801      	ldr	r0, [sp, #4]
 800236a:	b002      	add	sp, #8
 800236c:	4770      	bx	lr
 800236e:	46c0      	nop			; (mov r8, r8)
 8002370:	2000088c 	.word	0x2000088c

08002374 <event_timer_clear_flag>:
 8002374:	b672      	cpsid	i
 8002376:	4b03      	ldr	r3, [pc, #12]	; (8002384 <event_timer_clear_flag+0x10>)
 8002378:	0040      	lsls	r0, r0, #1
 800237a:	2200      	movs	r2, #0
 800237c:	52c2      	strh	r2, [r0, r3]
 800237e:	b662      	cpsie	i
 8002380:	4770      	bx	lr
 8002382:	46c0      	nop			; (mov r8, r8)
 8002384:	2000088c 	.word	0x2000088c

08002388 <TIM14_IRQHandler>:
 8002388:	b570      	push	{r4, r5, r6, lr}
 800238a:	4b60      	ldr	r3, [pc, #384]	; (800250c <TIM14_IRQHandler+0x184>)
 800238c:	7818      	ldrb	r0, [r3, #0]
 800238e:	b2c0      	uxtb	r0, r0
 8002390:	2803      	cmp	r0, #3
 8002392:	d83f      	bhi.n	8002414 <TIM14_IRQHandler+0x8c>
 8002394:	f000 f8dc 	bl	8002550 <__gnu_thumb1_case_uqi>
 8002398:	32220a02 	.word	0x32220a02
 800239c:	2280      	movs	r2, #128	; 0x80
 800239e:	2390      	movs	r3, #144	; 0x90
 80023a0:	0052      	lsls	r2, r2, #1
 80023a2:	05db      	lsls	r3, r3, #23
 80023a4:	851a      	strh	r2, [r3, #40]	; 0x28
 80023a6:	2200      	movs	r2, #0
 80023a8:	4b59      	ldr	r3, [pc, #356]	; (8002510 <TIM14_IRQHandler+0x188>)
 80023aa:	e032      	b.n	8002412 <TIM14_IRQHandler+0x8a>
 80023ac:	4a58      	ldr	r2, [pc, #352]	; (8002510 <TIM14_IRQHandler+0x188>)
 80023ae:	7811      	ldrb	r1, [r2, #0]
 80023b0:	290d      	cmp	r1, #13
 80023b2:	d901      	bls.n	80023b8 <TIM14_IRQHandler+0x30>
 80023b4:	2200      	movs	r2, #0
 80023b6:	e02c      	b.n	8002412 <TIM14_IRQHandler+0x8a>
 80023b8:	7811      	ldrb	r1, [r2, #0]
 80023ba:	4856      	ldr	r0, [pc, #344]	; (8002514 <TIM14_IRQHandler+0x18c>)
 80023bc:	5c41      	ldrb	r1, [r0, r1]
 80023be:	20ff      	movs	r0, #255	; 0xff
 80023c0:	4388      	bics	r0, r1
 80023c2:	0040      	lsls	r0, r0, #1
 80023c4:	2101      	movs	r1, #1
 80023c6:	4308      	orrs	r0, r1
 80023c8:	4953      	ldr	r1, [pc, #332]	; (8002518 <TIM14_IRQHandler+0x190>)
 80023ca:	8008      	strh	r0, [r1, #0]
 80023cc:	7811      	ldrb	r1, [r2, #0]
 80023ce:	3101      	adds	r1, #1
 80023d0:	b2c9      	uxtb	r1, r1
 80023d2:	7011      	strb	r1, [r2, #0]
 80023d4:	4a51      	ldr	r2, [pc, #324]	; (800251c <TIM14_IRQHandler+0x194>)
 80023d6:	2100      	movs	r1, #0
 80023d8:	7011      	strb	r1, [r2, #0]
 80023da:	e019      	b.n	8002410 <TIM14_IRQHandler+0x88>
 80023dc:	4a4e      	ldr	r2, [pc, #312]	; (8002518 <TIM14_IRQHandler+0x190>)
 80023de:	2190      	movs	r1, #144	; 0x90
 80023e0:	8814      	ldrh	r4, [r2, #0]
 80023e2:	2080      	movs	r0, #128	; 0x80
 80023e4:	05c9      	lsls	r1, r1, #23
 80023e6:	0040      	lsls	r0, r0, #1
 80023e8:	07e5      	lsls	r5, r4, #31
 80023ea:	d501      	bpl.n	80023f0 <TIM14_IRQHandler+0x68>
 80023ec:	6188      	str	r0, [r1, #24]
 80023ee:	e000      	b.n	80023f2 <TIM14_IRQHandler+0x6a>
 80023f0:	8508      	strh	r0, [r1, #40]	; 0x28
 80023f2:	8811      	ldrh	r1, [r2, #0]
 80023f4:	0849      	lsrs	r1, r1, #1
 80023f6:	8011      	strh	r1, [r2, #0]
 80023f8:	2203      	movs	r2, #3
 80023fa:	e00a      	b.n	8002412 <TIM14_IRQHandler+0x8a>
 80023fc:	4a47      	ldr	r2, [pc, #284]	; (800251c <TIM14_IRQHandler+0x194>)
 80023fe:	7811      	ldrb	r1, [r2, #0]
 8002400:	3101      	adds	r1, #1
 8002402:	b2c9      	uxtb	r1, r1
 8002404:	7011      	strb	r1, [r2, #0]
 8002406:	7812      	ldrb	r2, [r2, #0]
 8002408:	2a09      	cmp	r2, #9
 800240a:	d901      	bls.n	8002410 <TIM14_IRQHandler+0x88>
 800240c:	2201      	movs	r2, #1
 800240e:	e000      	b.n	8002412 <TIM14_IRQHandler+0x8a>
 8002410:	2202      	movs	r2, #2
 8002412:	701a      	strb	r2, [r3, #0]
 8002414:	4b42      	ldr	r3, [pc, #264]	; (8002520 <TIM14_IRQHandler+0x198>)
 8002416:	2104      	movs	r1, #4
 8002418:	6c1a      	ldr	r2, [r3, #64]	; 0x40
 800241a:	6019      	str	r1, [r3, #0]
 800241c:	6898      	ldr	r0, [r3, #8]
 800241e:	4301      	orrs	r1, r0
 8002420:	6099      	str	r1, [r3, #8]
 8002422:	4b40      	ldr	r3, [pc, #256]	; (8002524 <TIM14_IRQHandler+0x19c>)
 8002424:	2101      	movs	r1, #1
 8002426:	429a      	cmp	r2, r3
 8002428:	d80b      	bhi.n	8002442 <TIM14_IRQHandler+0xba>
 800242a:	4b3f      	ldr	r3, [pc, #252]	; (8002528 <TIM14_IRQHandler+0x1a0>)
 800242c:	2480      	movs	r4, #128	; 0x80
 800242e:	6818      	ldr	r0, [r3, #0]
 8002430:	0164      	lsls	r4, r4, #5
 8002432:	1901      	adds	r1, r0, r4
 8002434:	1a8a      	subs	r2, r1, r2
 8002436:	601a      	str	r2, [r3, #0]
 8002438:	4b3c      	ldr	r3, [pc, #240]	; (800252c <TIM14_IRQHandler+0x1a4>)
 800243a:	2100      	movs	r1, #0
 800243c:	681a      	ldr	r2, [r3, #0]
 800243e:	3201      	adds	r2, #1
 8002440:	601a      	str	r2, [r3, #0]
 8002442:	4b3b      	ldr	r3, [pc, #236]	; (8002530 <TIM14_IRQHandler+0x1a8>)
 8002444:	7818      	ldrb	r0, [r3, #0]
 8002446:	b2c0      	uxtb	r0, r0
 8002448:	2804      	cmp	r0, #4
 800244a:	d85a      	bhi.n	8002502 <TIM14_IRQHandler+0x17a>
 800244c:	f000 f880 	bl	8002550 <__gnu_thumb1_case_uqi>
 8002450:	36110603 	.word	0x36110603
 8002454:	38          	.byte	0x38
 8002455:	00          	.byte	0x00
 8002456:	2200      	movs	r2, #0
 8002458:	4b36      	ldr	r3, [pc, #216]	; (8002534 <TIM14_IRQHandler+0x1ac>)
 800245a:	e051      	b.n	8002500 <TIM14_IRQHandler+0x178>
 800245c:	4a35      	ldr	r2, [pc, #212]	; (8002534 <TIM14_IRQHandler+0x1ac>)
 800245e:	7811      	ldrb	r1, [r2, #0]
 8002460:	2200      	movs	r2, #0
 8002462:	290d      	cmp	r1, #13
 8002464:	d84c      	bhi.n	8002500 <TIM14_IRQHandler+0x178>
 8002466:	4934      	ldr	r1, [pc, #208]	; (8002538 <TIM14_IRQHandler+0x1b0>)
 8002468:	800a      	strh	r2, [r1, #0]
 800246a:	4934      	ldr	r1, [pc, #208]	; (800253c <TIM14_IRQHandler+0x1b4>)
 800246c:	700a      	strb	r2, [r1, #0]
 800246e:	2202      	movs	r2, #2
 8002470:	e046      	b.n	8002500 <TIM14_IRQHandler+0x178>
 8002472:	4a33      	ldr	r2, [pc, #204]	; (8002540 <TIM14_IRQHandler+0x1b8>)
 8002474:	2900      	cmp	r1, #0
 8002476:	d103      	bne.n	8002480 <TIM14_IRQHandler+0xf8>
 8002478:	2003      	movs	r0, #3
 800247a:	7018      	strb	r0, [r3, #0]
 800247c:	6011      	str	r1, [r2, #0]
 800247e:	e040      	b.n	8002502 <TIM14_IRQHandler+0x17a>
 8002480:	6811      	ldr	r1, [r2, #0]
 8002482:	3101      	adds	r1, #1
 8002484:	6011      	str	r1, [r2, #0]
 8002486:	6810      	ldr	r0, [r2, #0]
 8002488:	21d2      	movs	r1, #210	; 0xd2
 800248a:	0049      	lsls	r1, r1, #1
 800248c:	4288      	cmp	r0, r1
 800248e:	d938      	bls.n	8002502 <TIM14_IRQHandler+0x17a>
 8002490:	2100      	movs	r1, #0
 8002492:	6011      	str	r1, [r2, #0]
 8002494:	4e25      	ldr	r6, [pc, #148]	; (800252c <TIM14_IRQHandler+0x1a4>)
 8002496:	4a27      	ldr	r2, [pc, #156]	; (8002534 <TIM14_IRQHandler+0x1ac>)
 8002498:	4c23      	ldr	r4, [pc, #140]	; (8002528 <TIM14_IRQHandler+0x1a0>)
 800249a:	7011      	strb	r1, [r2, #0]
 800249c:	6831      	ldr	r1, [r6, #0]
 800249e:	2201      	movs	r2, #1
 80024a0:	701a      	strb	r2, [r3, #0]
 80024a2:	4d28      	ldr	r5, [pc, #160]	; (8002544 <TIM14_IRQHandler+0x1bc>)
 80024a4:	2900      	cmp	r1, #0
 80024a6:	d004      	beq.n	80024b2 <TIM14_IRQHandler+0x12a>
 80024a8:	6820      	ldr	r0, [r4, #0]
 80024aa:	f000 f85b 	bl	8002564 <__aeabi_uidiv>
 80024ae:	6028      	str	r0, [r5, #0]
 80024b0:	e000      	b.n	80024b4 <TIM14_IRQHandler+0x12c>
 80024b2:	6029      	str	r1, [r5, #0]
 80024b4:	2300      	movs	r3, #0
 80024b6:	6023      	str	r3, [r4, #0]
 80024b8:	6033      	str	r3, [r6, #0]
 80024ba:	e022      	b.n	8002502 <TIM14_IRQHandler+0x17a>
 80024bc:	2204      	movs	r2, #4
 80024be:	e01f      	b.n	8002500 <TIM14_IRQHandler+0x178>
 80024c0:	4a1e      	ldr	r2, [pc, #120]	; (800253c <TIM14_IRQHandler+0x1b4>)
 80024c2:	2900      	cmp	r1, #0
 80024c4:	d008      	beq.n	80024d8 <TIM14_IRQHandler+0x150>
 80024c6:	491c      	ldr	r1, [pc, #112]	; (8002538 <TIM14_IRQHandler+0x1b0>)
 80024c8:	2501      	movs	r5, #1
 80024ca:	880c      	ldrh	r4, [r1, #0]
 80024cc:	7810      	ldrb	r0, [r2, #0]
 80024ce:	4085      	lsls	r5, r0
 80024d0:	1c28      	adds	r0, r5, #0
 80024d2:	4320      	orrs	r0, r4
 80024d4:	b280      	uxth	r0, r0
 80024d6:	8008      	strh	r0, [r1, #0]
 80024d8:	7811      	ldrb	r1, [r2, #0]
 80024da:	3101      	adds	r1, #1
 80024dc:	b2c9      	uxtb	r1, r1
 80024de:	7011      	strb	r1, [r2, #0]
 80024e0:	7812      	ldrb	r2, [r2, #0]
 80024e2:	2a07      	cmp	r2, #7
 80024e4:	d90b      	bls.n	80024fe <TIM14_IRQHandler+0x176>
 80024e6:	4a13      	ldr	r2, [pc, #76]	; (8002534 <TIM14_IRQHandler+0x1ac>)
 80024e8:	4813      	ldr	r0, [pc, #76]	; (8002538 <TIM14_IRQHandler+0x1b0>)
 80024ea:	7811      	ldrb	r1, [r2, #0]
 80024ec:	8804      	ldrh	r4, [r0, #0]
 80024ee:	4816      	ldr	r0, [pc, #88]	; (8002548 <TIM14_IRQHandler+0x1c0>)
 80024f0:	5444      	strb	r4, [r0, r1]
 80024f2:	7811      	ldrb	r1, [r2, #0]
 80024f4:	3101      	adds	r1, #1
 80024f6:	b2c9      	uxtb	r1, r1
 80024f8:	7011      	strb	r1, [r2, #0]
 80024fa:	2201      	movs	r2, #1
 80024fc:	e000      	b.n	8002500 <TIM14_IRQHandler+0x178>
 80024fe:	2203      	movs	r2, #3
 8002500:	701a      	strb	r2, [r3, #0]
 8002502:	4b12      	ldr	r3, [pc, #72]	; (800254c <TIM14_IRQHandler+0x1c4>)
 8002504:	2200      	movs	r2, #0
 8002506:	821a      	strh	r2, [r3, #16]
 8002508:	bd70      	pop	{r4, r5, r6, pc}
 800250a:	46c0      	nop			; (mov r8, r8)
 800250c:	200008ab 	.word	0x200008ab
 8002510:	200008aa 	.word	0x200008aa
 8002514:	200000de 	.word	0x200000de
 8002518:	200008b2 	.word	0x200008b2
 800251c:	200008c0 	.word	0x200008c0
 8002520:	40012400 	.word	0x40012400
 8002524:	000003e7 	.word	0x000003e7
 8002528:	200008bc 	.word	0x200008bc
 800252c:	200008c4 	.word	0x200008c4
 8002530:	200008b0 	.word	0x200008b0
 8002534:	200008b4 	.word	0x200008b4
 8002538:	200008a8 	.word	0x200008a8
 800253c:	200008b5 	.word	0x200008b5
 8002540:	200008b8 	.word	0x200008b8
 8002544:	200008ac 	.word	0x200008ac
 8002548:	200000d0 	.word	0x200000d0
 800254c:	40002000 	.word	0x40002000

08002550 <__gnu_thumb1_case_uqi>:
 8002550:	b402      	push	{r1}
 8002552:	4671      	mov	r1, lr
 8002554:	0849      	lsrs	r1, r1, #1
 8002556:	0049      	lsls	r1, r1, #1
 8002558:	5c09      	ldrb	r1, [r1, r0]
 800255a:	0049      	lsls	r1, r1, #1
 800255c:	448e      	add	lr, r1
 800255e:	bc02      	pop	{r1}
 8002560:	4770      	bx	lr
 8002562:	46c0      	nop			; (mov r8, r8)

08002564 <__aeabi_uidiv>:
 8002564:	2900      	cmp	r1, #0
 8002566:	d034      	beq.n	80025d2 <.udivsi3_skip_div0_test+0x6a>

08002568 <.udivsi3_skip_div0_test>:
 8002568:	2301      	movs	r3, #1
 800256a:	2200      	movs	r2, #0
 800256c:	b410      	push	{r4}
 800256e:	4288      	cmp	r0, r1
 8002570:	d32c      	bcc.n	80025cc <.udivsi3_skip_div0_test+0x64>
 8002572:	2401      	movs	r4, #1
 8002574:	0724      	lsls	r4, r4, #28
 8002576:	42a1      	cmp	r1, r4
 8002578:	d204      	bcs.n	8002584 <.udivsi3_skip_div0_test+0x1c>
 800257a:	4281      	cmp	r1, r0
 800257c:	d202      	bcs.n	8002584 <.udivsi3_skip_div0_test+0x1c>
 800257e:	0109      	lsls	r1, r1, #4
 8002580:	011b      	lsls	r3, r3, #4
 8002582:	e7f8      	b.n	8002576 <.udivsi3_skip_div0_test+0xe>
 8002584:	00e4      	lsls	r4, r4, #3
 8002586:	42a1      	cmp	r1, r4
 8002588:	d204      	bcs.n	8002594 <.udivsi3_skip_div0_test+0x2c>
 800258a:	4281      	cmp	r1, r0
 800258c:	d202      	bcs.n	8002594 <.udivsi3_skip_div0_test+0x2c>
 800258e:	0049      	lsls	r1, r1, #1
 8002590:	005b      	lsls	r3, r3, #1
 8002592:	e7f8      	b.n	8002586 <.udivsi3_skip_div0_test+0x1e>
 8002594:	4288      	cmp	r0, r1
 8002596:	d301      	bcc.n	800259c <.udivsi3_skip_div0_test+0x34>
 8002598:	1a40      	subs	r0, r0, r1
 800259a:	431a      	orrs	r2, r3
 800259c:	084c      	lsrs	r4, r1, #1
 800259e:	42a0      	cmp	r0, r4
 80025a0:	d302      	bcc.n	80025a8 <.udivsi3_skip_div0_test+0x40>
 80025a2:	1b00      	subs	r0, r0, r4
 80025a4:	085c      	lsrs	r4, r3, #1
 80025a6:	4322      	orrs	r2, r4
 80025a8:	088c      	lsrs	r4, r1, #2
 80025aa:	42a0      	cmp	r0, r4
 80025ac:	d302      	bcc.n	80025b4 <.udivsi3_skip_div0_test+0x4c>
 80025ae:	1b00      	subs	r0, r0, r4
 80025b0:	089c      	lsrs	r4, r3, #2
 80025b2:	4322      	orrs	r2, r4
 80025b4:	08cc      	lsrs	r4, r1, #3
 80025b6:	42a0      	cmp	r0, r4
 80025b8:	d302      	bcc.n	80025c0 <.udivsi3_skip_div0_test+0x58>
 80025ba:	1b00      	subs	r0, r0, r4
 80025bc:	08dc      	lsrs	r4, r3, #3
 80025be:	4322      	orrs	r2, r4
 80025c0:	2800      	cmp	r0, #0
 80025c2:	d003      	beq.n	80025cc <.udivsi3_skip_div0_test+0x64>
 80025c4:	091b      	lsrs	r3, r3, #4
 80025c6:	d001      	beq.n	80025cc <.udivsi3_skip_div0_test+0x64>
 80025c8:	0909      	lsrs	r1, r1, #4
 80025ca:	e7e3      	b.n	8002594 <.udivsi3_skip_div0_test+0x2c>
 80025cc:	1c10      	adds	r0, r2, #0
 80025ce:	bc10      	pop	{r4}
 80025d0:	4770      	bx	lr
 80025d2:	2800      	cmp	r0, #0
 80025d4:	d001      	beq.n	80025da <.udivsi3_skip_div0_test+0x72>
 80025d6:	2000      	movs	r0, #0
 80025d8:	43c0      	mvns	r0, r0
 80025da:	b407      	push	{r0, r1, r2}
 80025dc:	4802      	ldr	r0, [pc, #8]	; (80025e8 <.udivsi3_skip_div0_test+0x80>)
 80025de:	a102      	add	r1, pc, #8	; (adr r1, 80025e8 <.udivsi3_skip_div0_test+0x80>)
 80025e0:	1840      	adds	r0, r0, r1
 80025e2:	9002      	str	r0, [sp, #8]
 80025e4:	bd03      	pop	{r0, r1, pc}
 80025e6:	46c0      	nop			; (mov r8, r8)
 80025e8:	000000d9 	.word	0x000000d9

080025ec <__aeabi_uidivmod>:
 80025ec:	2900      	cmp	r1, #0
 80025ee:	d0f0      	beq.n	80025d2 <.udivsi3_skip_div0_test+0x6a>
 80025f0:	b503      	push	{r0, r1, lr}
 80025f2:	f7ff ffb9 	bl	8002568 <.udivsi3_skip_div0_test>
 80025f6:	bc0e      	pop	{r1, r2, r3}
 80025f8:	4342      	muls	r2, r0
 80025fa:	1a89      	subs	r1, r1, r2
 80025fc:	4718      	bx	r3
 80025fe:	46c0      	nop			; (mov r8, r8)

08002600 <__aeabi_idiv>:
 8002600:	2900      	cmp	r1, #0
 8002602:	d041      	beq.n	8002688 <.divsi3_skip_div0_test+0x84>

08002604 <.divsi3_skip_div0_test>:
 8002604:	b410      	push	{r4}
 8002606:	1c04      	adds	r4, r0, #0
 8002608:	404c      	eors	r4, r1
 800260a:	46a4      	mov	ip, r4
 800260c:	2301      	movs	r3, #1
 800260e:	2200      	movs	r2, #0
 8002610:	2900      	cmp	r1, #0
 8002612:	d500      	bpl.n	8002616 <.divsi3_skip_div0_test+0x12>
 8002614:	4249      	negs	r1, r1
 8002616:	2800      	cmp	r0, #0
 8002618:	d500      	bpl.n	800261c <.divsi3_skip_div0_test+0x18>
 800261a:	4240      	negs	r0, r0
 800261c:	4288      	cmp	r0, r1
 800261e:	d32c      	bcc.n	800267a <.divsi3_skip_div0_test+0x76>
 8002620:	2401      	movs	r4, #1
 8002622:	0724      	lsls	r4, r4, #28
 8002624:	42a1      	cmp	r1, r4
 8002626:	d204      	bcs.n	8002632 <.divsi3_skip_div0_test+0x2e>
 8002628:	4281      	cmp	r1, r0
 800262a:	d202      	bcs.n	8002632 <.divsi3_skip_div0_test+0x2e>
 800262c:	0109      	lsls	r1, r1, #4
 800262e:	011b      	lsls	r3, r3, #4
 8002630:	e7f8      	b.n	8002624 <.divsi3_skip_div0_test+0x20>
 8002632:	00e4      	lsls	r4, r4, #3
 8002634:	42a1      	cmp	r1, r4
 8002636:	d204      	bcs.n	8002642 <.divsi3_skip_div0_test+0x3e>
 8002638:	4281      	cmp	r1, r0
 800263a:	d202      	bcs.n	8002642 <.divsi3_skip_div0_test+0x3e>
 800263c:	0049      	lsls	r1, r1, #1
 800263e:	005b      	lsls	r3, r3, #1
 8002640:	e7f8      	b.n	8002634 <.divsi3_skip_div0_test+0x30>
 8002642:	4288      	cmp	r0, r1
 8002644:	d301      	bcc.n	800264a <.divsi3_skip_div0_test+0x46>
 8002646:	1a40      	subs	r0, r0, r1
 8002648:	431a      	orrs	r2, r3
 800264a:	084c      	lsrs	r4, r1, #1
 800264c:	42a0      	cmp	r0, r4
 800264e:	d302      	bcc.n	8002656 <.divsi3_skip_div0_test+0x52>
 8002650:	1b00      	subs	r0, r0, r4
 8002652:	085c      	lsrs	r4, r3, #1
 8002654:	4322      	orrs	r2, r4
 8002656:	088c      	lsrs	r4, r1, #2
 8002658:	42a0      	cmp	r0, r4
 800265a:	d302      	bcc.n	8002662 <.divsi3_skip_div0_test+0x5e>
 800265c:	1b00      	subs	r0, r0, r4
 800265e:	089c      	lsrs	r4, r3, #2
 8002660:	4322      	orrs	r2, r4
 8002662:	08cc      	lsrs	r4, r1, #3
 8002664:	42a0      	cmp	r0, r4
 8002666:	d302      	bcc.n	800266e <.divsi3_skip_div0_test+0x6a>
 8002668:	1b00      	subs	r0, r0, r4
 800266a:	08dc      	lsrs	r4, r3, #3
 800266c:	4322      	orrs	r2, r4
 800266e:	2800      	cmp	r0, #0
 8002670:	d003      	beq.n	800267a <.divsi3_skip_div0_test+0x76>
 8002672:	091b      	lsrs	r3, r3, #4
 8002674:	d001      	beq.n	800267a <.divsi3_skip_div0_test+0x76>
 8002676:	0909      	lsrs	r1, r1, #4
 8002678:	e7e3      	b.n	8002642 <.divsi3_skip_div0_test+0x3e>
 800267a:	1c10      	adds	r0, r2, #0
 800267c:	4664      	mov	r4, ip
 800267e:	2c00      	cmp	r4, #0
 8002680:	d500      	bpl.n	8002684 <.divsi3_skip_div0_test+0x80>
 8002682:	4240      	negs	r0, r0
 8002684:	bc10      	pop	{r4}
 8002686:	4770      	bx	lr
 8002688:	2800      	cmp	r0, #0
 800268a:	d006      	beq.n	800269a <.divsi3_skip_div0_test+0x96>
 800268c:	db03      	blt.n	8002696 <.divsi3_skip_div0_test+0x92>
 800268e:	2000      	movs	r0, #0
 8002690:	43c0      	mvns	r0, r0
 8002692:	0840      	lsrs	r0, r0, #1
 8002694:	e001      	b.n	800269a <.divsi3_skip_div0_test+0x96>
 8002696:	2080      	movs	r0, #128	; 0x80
 8002698:	0600      	lsls	r0, r0, #24
 800269a:	b407      	push	{r0, r1, r2}
 800269c:	4802      	ldr	r0, [pc, #8]	; (80026a8 <.divsi3_skip_div0_test+0xa4>)
 800269e:	a102      	add	r1, pc, #8	; (adr r1, 80026a8 <.divsi3_skip_div0_test+0xa4>)
 80026a0:	1840      	adds	r0, r0, r1
 80026a2:	9002      	str	r0, [sp, #8]
 80026a4:	bd03      	pop	{r0, r1, pc}
 80026a6:	46c0      	nop			; (mov r8, r8)
 80026a8:	00000019 	.word	0x00000019

080026ac <__aeabi_idivmod>:
 80026ac:	2900      	cmp	r1, #0
 80026ae:	d0eb      	beq.n	8002688 <.divsi3_skip_div0_test+0x84>
 80026b0:	b503      	push	{r0, r1, lr}
 80026b2:	f7ff ffa7 	bl	8002604 <.divsi3_skip_div0_test>
 80026b6:	bc0e      	pop	{r1, r2, r3}
 80026b8:	4342      	muls	r2, r0
 80026ba:	1a89      	subs	r1, r1, r2
 80026bc:	4718      	bx	r3
 80026be:	46c0      	nop			; (mov r8, r8)

080026c0 <__aeabi_idiv0>:
 80026c0:	4770      	bx	lr
 80026c2:	46c0      	nop			; (mov r8, r8)

080026c4 <_init>:
 80026c4:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
 80026c6:	46c0      	nop			; (mov r8, r8)
 80026c8:	bcf8      	pop	{r3, r4, r5, r6, r7}
 80026ca:	bc08      	pop	{r3}
 80026cc:	469e      	mov	lr, r3
 80026ce:	4770      	bx	lr

080026d0 <_fini>:
 80026d0:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
 80026d2:	46c0      	nop			; (mov r8, r8)
 80026d4:	bcf8      	pop	{r3, r4, r5, r6, r7}
 80026d6:	bc08      	pop	{r3}
 80026d8:	469e      	mov	lr, r3
 80026da:	4770      	bx	lr
 80026dc:	746f6f62 	.word	0x746f6f62
 80026e0:	20676e69 	.word	0x20676e69
 80026e4:	6d6f7266 	.word	0x6d6f7266
 80026e8:	0a752520 	.word	0x0a752520
 80026ec:	6d617200 	.word	0x6d617200
 80026f0:	61747320 	.word	0x61747320
 80026f4:	25207472 	.word	0x25207472
 80026f8:	000a2075 	.word	0x000a2075
 80026fc:	206d6172 	.word	0x206d6172
 8002700:	657a6973 	.word	0x657a6973
 8002704:	20752520 	.word	0x20752520
 8002708:	6172000a 	.word	0x6172000a
 800270c:	7266206d 	.word	0x7266206d
 8002710:	25206565 	.word	0x25206565
 8002714:	000a2075 	.word	0x000a2075
 8002718:	70616568 	.word	0x70616568
 800271c:	61747320 	.word	0x61747320
 8002720:	25207472 	.word	0x25207472
 8002724:	000a2075 	.word	0x000a2075
 8002728:	0a0a      	.short	0x0a0a
 800272a:	00          	.byte	0x00
 800272b:	0a          	.byte	0x0a
 800272c:	636c6577 	.word	0x636c6577
 8002730:	20656d6f 	.word	0x20656d6f
 8002734:	53206f74 	.word	0x53206f74
 8002738:	68757a75 	.word	0x68757a75
 800273c:	20534f61 	.word	0x20534f61
 8002740:	205e5f5e 	.word	0x205e5f5e
 8002744:	2e322e32 	.word	0x2e322e32
 8002748:	55420a30 	.word	0x55420a30
 800274c:	20444c49 	.word	0x20444c49
 8002750:	20727041 	.word	0x20727041
 8002754:	32203920 	.word	0x32203920
 8002758:	20363130 	.word	0x20363130
 800275c:	343a3831 	.word	0x343a3831
 8002760:	32303a38 	.word	0x32303a38
 8002764:	7525000a 	.word	0x7525000a
 8002768:	0a203a20 	.word	0x0a203a20
 800276c:	69255b00 	.word	0x69255b00
 8002770:	20692520 	.word	0x20692520
 8002774:	205d6925 	.word	0x205d6925
	...

08002779 <font_data>:
	...
 8002789:	3c180000 18183c3c 18180018 00000000     ...<<<..........
 8002799:	63636300 00000022 00000000 00000000     .ccc"...........
 80027a9:	36000000 36367f36 36367f36 00000000     ...66.666.66....
 80027b9:	633e0c0c 033e6061 3e634303 00000c0c     ..>ca`>..Cc>....
 80027c9:	00000000 06636100 6333180c 00000000     .....ac...3c....
 80027d9:	1c000000 3b1c3636 3b66666e 00000000     ....66.;nff;....
 80027e9:	30303000 00000060 00000000 00000000     .000`...........
 80027f9:	180c0000 30303018 0c181830 00000000     .....0000.......
 8002809:	0c180000 0606060c 180c0c06 00000000     ................
 8002819:	00000000 ff3c6642 0042663c 00000000     ....Bf<.<fB.....
 8002829:	00000000 ff181818 00181818 00000000     ................
	...
 8002841:	18180000 00003018 00000000 ff000000     .....0..........
	...
 8002861:	18180000 00000000 03010000 381c0e07     ...............8
 8002871:	80c0e070 00000000 633e0000 6b6b6363     p.........>ccckk
 8002881:	3e636363 00000000 1c0c0000 0c0c0c3c     ccc>........<...
 8002891:	3f0c0c0c 00000000 633e0000 180c0603     ...?......>c....
 80028a1:	7f636130 00000000 633e0000 031e0303     0ac.......>c....
 80028b1:	3e630303 00000000 0e060000 6666361e     ..c>.........6ff
 80028c1:	0f06067f 00000000 607f0000 037e6060     ...........```~.
 80028d1:	3e736303 00000000 301c0000 637e6060     .cs>.......0``~c
 80028e1:	3e636363 00000000 637f0000 0c060603     ccc>.......c....
 80028f1:	1818180c 00000000 633e0000 633e6363     ..........>ccc>c
 8002901:	3e636363 00000000 633e0000 3f636363     ccc>......>cccc?
 8002911:	3c060303 00000000 00000000 00181800     ...<............
 8002921:	18180000 00000000 00000000 00181800     ................
 8002931:	18180000 00003018 06000000 6030180c     .....0........0`
 8002941:	060c1830 00000000 00000000 007e0000     0.............~.
 8002951:	00007e00 00000000 60000000 060c1830     .~.........`0...
 8002961:	6030180c 00000000 633e0000 0c0c0663     ..0`......>cc...
 8002971:	0c0c000c 00000000 633e0000 6b6b6f63     ..........>ccokk
 8002981:	3e60606e 00000000 1c080000 63636336     n``>........6ccc
 8002991:	6363637f 00000000 337e0000 333e3333     .ccc......~333>3
 80029a1:	7e333333 00000000 331e0000 60606061     333~.......3a```
 80029b1:	1e336160 00000000 367c0000 33333333     `a3.......|63333
 80029c1:	7c363333 00000000 337f0000 343c3431     336|.......314<4
 80029d1:	7f333130 00000000 337f0000 343c3431     013........314<4
 80029e1:	78303030 00000000 331e0000 6f606061     000x.......3a``o
 80029f1:	1d376363 00000000 63630000 637f6363     cc7.......cccc.c
 8002a01:	63636363 00000000 183c0000 18181818     cccc......<.....
 8002a11:	3c181818 00000000 060f0000 06060606     ...<............
 8002a21:	3c666606 00000000 33730000 363c3636     .ff<......s366<6
 8002a31:	73333336 00000000 30780000 30303030     633s......x00000
 8002a41:	7f333130 00000000 77630000 63636b7f     013.......cw.kcc
 8002a51:	63636363 00000000 63630000 6f7f7b73     cccc......ccs{.o
 8002a61:	63636367 00000000 361c0000 63636363     gccc.......6cccc
 8002a71:	1c366363 00000000 337e0000 303e3333     cc6.......~333>0
 8002a81:	78303030 00000000 633e0000 63636363     000x......>ccccc
 8002a91:	3e6f6b63 00000706 337e0000 363e3333     cko>......~333>6
 8002aa1:	73333336 00000000 633e0000 061c3063     633s......>cc0..
 8002ab1:	3e636303 00000000 dbff0000 18181899     .cc>............
 8002ac1:	3c181818 00000000 63630000 63636363     ...<......cccccc
 8002ad1:	3e636363 00000000 63630000 63636363     ccc>......cccccc
 8002ae1:	081c3663 00000000 63630000 6b636363     c6........ccccck
 8002af1:	36367f6b 00000000 c3c30000 18183c66     k.66........f<..
 8002b01:	c3c3663c 00000000 c3c30000 183c66c3     <f...........f<.
 8002b11:	3c181818 00000000 637f0000 180c0643     ...<.......cC...
 8002b21:	7f636130 00000000 303c0000 30303030     0ac.......<00000
 8002b31:	3c303030 00000000 c0800000 1c3870e0     000<.........p8.
 8002b41:	0103070e 00000000 0c3c0000 0c0c0c0c     ..........<.....
 8002b51:	3c0c0c0c 00000000 63361c08 00000000     ...<......6c....
	...
 8002b75:	000000ff 000c1818 00000000 00000000     ................
	...
 8002b8d:	06463c00 3b66663e 00000000 30700000     .<F.>ff;......p0
 8002b9d:	33363c30 6e333333 00000000 00000000     0<63333n........
 8002bad:	60633e00 3e636060 00000000 060e0000     .>c```c>........
 8002bbd:	66361e06 3b666666 00000000 00000000     ..6ffff;........
 8002bcd:	63633e00 3e63607e 00000000 361c0000     .>cc~`c>.......6
 8002bdd:	307c3032 78303030 00000000 00000000     20|0000x........
 8002bed:	66663b00 063e6666 00003c66 30700000     .;ffff>.f<....p0
 8002bfd:	333b3630 73333333 00000000 0c0c0000     06;3333s........
 8002c0d:	0c0c1c00 1e0c0c0c 00000000 06060000     ................
 8002c1d:	06060e00 66060606 00003c66 30700000     .......ff<....p0
 8002c2d:	36333330 7333363c 00000000 0c1c0000     0336<63s........
 8002c3d:	0c0c0c0c 1e0c0c0c 00000000 00000000     ................
 8002c4d:	6b7f6e00 6b6b6b6b 00000000 00000000     .n.kkkkk........
 8002c5d:	33336e00 33333333 00000000 00000000     .n333333........
 8002c6d:	63633e00 3e636363 00000000 00000000     .>ccccc>........
 8002c7d:	33336e00 303e3333 00007830 00000000     .n3333>00x......
 8002c8d:	66663b00 063e6666 00000f06 00000000     .;ffff>.........
 8002c9d:	333b6e00 78303030 00000000 00000000     .n;3000x........
 8002cad:	38633e00 3e63030e 00000000 18080000     .>c8..c>........
 8002cbd:	18187e18 0e1b1818 00000000 00000000     .~..............
 8002ccd:	66666600 3b666666 00000000 00000000     .ffffff;........
 8002cdd:	36636300 081c1c36 00000000 00000000     .cc66...........
 8002ced:	63636300 367f6b6b 00000000 00000000     .ccckk.6........
 8002cfd:	1c366300 63361c1c 00000000 00000000     .c6...6c........
 8002d0d:	63636300 033f6363 00003c06 00000000     .ccccc?..<......
 8002d1d:	0c667f00 7f633018 00000000 180e0000     ..f..0c.........
 8002d2d:	18701818 0e181818 00000000 18180000     ..p.............
 8002d3d:	00181818 18181818 00000018 18700000     ..............p.
 8002d4d:	180e1818 70181818 00000000 6e3b0000     .......p......;n
	...
 8002d69:	d8d87000 00000070 00000000 00000000     .p..p...........
 8002d79:	69647473 6e69206f 64207469 0a656e6f     stdio init done.
 8002d89:	00000000                                         ...

08002d8c <__EH_FRAME_BEGIN__>:
 8002d8c:	00000000                                ....
