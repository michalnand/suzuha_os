
bin/main.elf:     file format elf32-littlearm


Disassembly of section .text:

08000188 <mem_info_print>:
 8000188:	b538      	push	{r3, r4, r5, lr}
 800018a:	4c0f      	ldr	r4, [pc, #60]	; (80001c8 <mem_info_print+0x40>)
 800018c:	4d0f      	ldr	r5, [pc, #60]	; (80001cc <mem_info_print+0x44>)
 800018e:	4810      	ldr	r0, [pc, #64]	; (80001d0 <mem_info_print+0x48>)
 8000190:	4910      	ldr	r1, [pc, #64]	; (80001d4 <mem_info_print+0x4c>)
 8000192:	f000 fb31 	bl	80007f8 <printf_>
 8000196:	1b2d      	subs	r5, r5, r4
 8000198:	4621      	mov	r1, r4
 800019a:	480f      	ldr	r0, [pc, #60]	; (80001d8 <mem_info_print+0x50>)
 800019c:	f000 fb2c 	bl	80007f8 <printf_>
 80001a0:	4629      	mov	r1, r5
 80001a2:	480e      	ldr	r0, [pc, #56]	; (80001dc <mem_info_print+0x54>)
 80001a4:	f000 fb28 	bl	80007f8 <printf_>
 80001a8:	4b0d      	ldr	r3, [pc, #52]	; (80001e0 <mem_info_print+0x58>)
 80001aa:	480e      	ldr	r0, [pc, #56]	; (80001e4 <mem_info_print+0x5c>)
 80001ac:	1ae1      	subs	r1, r4, r3
 80001ae:	4429      	add	r1, r5
 80001b0:	f000 fb22 	bl	80007f8 <printf_>
 80001b4:	480c      	ldr	r0, [pc, #48]	; (80001e8 <mem_info_print+0x60>)
 80001b6:	490d      	ldr	r1, [pc, #52]	; (80001ec <mem_info_print+0x64>)
 80001b8:	f000 fb1e 	bl	80007f8 <printf_>
 80001bc:	480c      	ldr	r0, [pc, #48]	; (80001f0 <mem_info_print+0x68>)
 80001be:	e8bd 4038 	ldmia.w	sp!, {r3, r4, r5, lr}
 80001c2:	f000 bb19 	b.w	80007f8 <printf_>
 80001c6:	bf00      	nop
 80001c8:	20000000 	.word	0x20000000
 80001cc:	20004000 	.word	0x20004000
 80001d0:	08001978 	.word	0x08001978
 80001d4:	08001948 	.word	0x08001948
 80001d8:	08001989 	.word	0x08001989
 80001dc:	08001998 	.word	0x08001998
 80001e0:	200004bc 	.word	0x200004bc
 80001e4:	080019a6 	.word	0x080019a6
 80001e8:	080019b4 	.word	0x080019b4
 80001ec:	200004bc 	.word	0x200004bc
 80001f0:	080019c4 	.word	0x080019c4

080001f4 <main>:
 80001f4:	b508      	push	{r3, lr}
 80001f6:	f000 fda1 	bl	8000d3c <lib_low_level_init>
 80001fa:	f000 fbc0 	bl	800097e <lib_os_init>
 80001fe:	f7ff ffc3 	bl	8000188 <mem_info_print>
 8000202:	4905      	ldr	r1, [pc, #20]	; (8000218 <main+0x24>)
 8000204:	4805      	ldr	r0, [pc, #20]	; (800021c <main+0x28>)
 8000206:	f44f 7280 	mov.w	r2, #256	; 0x100
 800020a:	2308      	movs	r3, #8
 800020c:	f000 f9ec 	bl	80005e8 <create_thread>
 8000210:	f000 f9e4 	bl	80005dc <kernel_start>
 8000214:	2000      	movs	r0, #0
 8000216:	bd08      	pop	{r3, pc}
 8000218:	20000034 	.word	0x20000034
 800021c:	08000281 	.word	0x08000281

08000220 <child1_thread>:
 8000220:	b508      	push	{r3, lr}
 8000222:	f000 ff8d 	bl	8001140 <uart_read>
 8000226:	4601      	mov	r1, r0
 8000228:	4809      	ldr	r0, [pc, #36]	; (8000250 <child1_thread+0x30>)
 800022a:	f000 fae5 	bl	80007f8 <printf_>
 800022e:	f44f 7080 	mov.w	r0, #256	; 0x100
 8000232:	f000 fc7c 	bl	8000b2e <led_on>
 8000236:	4807      	ldr	r0, [pc, #28]	; (8000254 <child1_thread+0x34>)
 8000238:	f000 fade 	bl	80007f8 <printf_>
 800023c:	f44f 7080 	mov.w	r0, #256	; 0x100
 8000240:	f000 fc7d 	bl	8000b3e <led_off>
 8000244:	f44f 7096 	mov.w	r0, #300	; 0x12c
 8000248:	f001 fb6e 	bl	8001928 <timer_delay_ms>
 800024c:	e7e9      	b.n	8000222 <child1_thread+0x2>
 800024e:	bf00      	nop
 8000250:	080019c7 	.word	0x080019c7
 8000254:	080019d2 	.word	0x080019d2

08000258 <child2_thread>:
 8000258:	b508      	push	{r3, lr}
 800025a:	f44f 7080 	mov.w	r0, #256	; 0x100
 800025e:	f000 fc66 	bl	8000b2e <led_on>
 8000262:	4806      	ldr	r0, [pc, #24]	; (800027c <child2_thread+0x24>)
 8000264:	f000 fac8 	bl	80007f8 <printf_>
 8000268:	f44f 7080 	mov.w	r0, #256	; 0x100
 800026c:	f000 fc67 	bl	8000b3e <led_off>
 8000270:	f44f 702f 	mov.w	r0, #700	; 0x2bc
 8000274:	f001 fb58 	bl	8001928 <timer_delay_ms>
 8000278:	e7ef      	b.n	800025a <child2_thread+0x2>
 800027a:	bf00      	nop
 800027c:	080019ea 	.word	0x080019ea

08000280 <main_thread>:
 8000280:	b510      	push	{r4, lr}
 8000282:	f44f 7080 	mov.w	r0, #256	; 0x100
 8000286:	f000 fc52 	bl	8000b2e <led_on>
 800028a:	481d      	ldr	r0, [pc, #116]	; (8000300 <main_thread+0x80>)
 800028c:	4c1d      	ldr	r4, [pc, #116]	; (8000304 <main_thread+0x84>)
 800028e:	f000 fab3 	bl	80007f8 <printf_>
 8000292:	491d      	ldr	r1, [pc, #116]	; (8000308 <main_thread+0x88>)
 8000294:	481d      	ldr	r0, [pc, #116]	; (800030c <main_thread+0x8c>)
 8000296:	f44f 7280 	mov.w	r2, #256	; 0x100
 800029a:	2308      	movs	r3, #8
 800029c:	f000 f9a4 	bl	80005e8 <create_thread>
 80002a0:	f44f 7280 	mov.w	r2, #256	; 0x100
 80002a4:	2308      	movs	r3, #8
 80002a6:	491a      	ldr	r1, [pc, #104]	; (8000310 <main_thread+0x90>)
 80002a8:	481a      	ldr	r0, [pc, #104]	; (8000314 <main_thread+0x94>)
 80002aa:	f000 f99d 	bl	80005e8 <create_thread>
 80002ae:	f000 f8bf 	bl	8000430 <ad9833_init>
 80002b2:	f44f 5100 	mov.w	r1, #8192	; 0x2000
 80002b6:	f44f 707a 	mov.w	r0, #1000	; 0x3e8
 80002ba:	f000 f861 	bl	8000380 <ad9833_set_frequency>
 80002be:	20c8      	movs	r0, #200	; 0xc8
 80002c0:	f000 f888 	bl	80003d4 <ad9833_set_gain>
 80002c4:	f44f 707a 	mov.w	r0, #1000	; 0x3e8
 80002c8:	f001 fb2e 	bl	8001928 <timer_delay_ms>
 80002cc:	f44f 7080 	mov.w	r0, #256	; 0x100
 80002d0:	f000 fc2d 	bl	8000b2e <led_on>
 80002d4:	4620      	mov	r0, r4
 80002d6:	f44f 5100 	mov.w	r1, #8192	; 0x2000
 80002da:	f000 f851 	bl	8000380 <ad9833_set_frequency>
 80002de:	f44f 7080 	mov.w	r0, #256	; 0x100
 80002e2:	f000 fc2c 	bl	8000b3e <led_off>
 80002e6:	200a      	movs	r0, #10
 80002e8:	f001 fb1e 	bl	8001928 <timer_delay_ms>
 80002ec:	f504 541c 	add.w	r4, r4, #9984	; 0x2700
 80002f0:	4b04      	ldr	r3, [pc, #16]	; (8000304 <main_thread+0x84>)
 80002f2:	4a09      	ldr	r2, [pc, #36]	; (8000318 <main_thread+0x98>)
 80002f4:	3410      	adds	r4, #16
 80002f6:	4294      	cmp	r4, r2
 80002f8:	bf88      	it	hi
 80002fa:	461c      	movhi	r4, r3
 80002fc:	e7e6      	b.n	80002cc <main_thread+0x4c>
 80002fe:	bf00      	nop
 8000300:	08001a02 	.word	0x08001a02
 8000304:	000f4240 	.word	0x000f4240
 8000308:	20000234 	.word	0x20000234
 800030c:	08000221 	.word	0x08000221
 8000310:	20000134 	.word	0x20000134
 8000314:	08000259 	.word	0x08000259
 8000318:	0098967f 	.word	0x0098967f

0800031c <ad9833_delay>:
 800031c:	230b      	movs	r3, #11
 800031e:	3b01      	subs	r3, #1
 8000320:	d001      	beq.n	8000326 <ad9833_delay+0xa>
 8000322:	bf00      	nop
 8000324:	e7fb      	b.n	800031e <ad9833_delay+0x2>
 8000326:	4770      	bx	lr

08000328 <ad9833_send_word>:
 8000328:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
 800032a:	4c14      	ldr	r4, [pc, #80]	; (800037c <ad9833_send_word+0x54>)
 800032c:	2510      	movs	r5, #16
 800032e:	61a5      	str	r5, [r4, #24]
 8000330:	4606      	mov	r6, r0
 8000332:	f7ff fff3 	bl	800031c <ad9833_delay>
 8000336:	f44f 4380 	mov.w	r3, #16384	; 0x4000
 800033a:	8523      	strh	r3, [r4, #40]	; 0x28
 800033c:	f7ff ffee 	bl	800031c <ad9833_delay>
 8000340:	f04f 4390 	mov.w	r3, #1207959552	; 0x48000000
 8000344:	f416 4f00 	tst.w	r6, #32768	; 0x8000
 8000348:	f44f 4200 	mov.w	r2, #32768	; 0x8000
 800034c:	4c0b      	ldr	r4, [pc, #44]	; (800037c <ad9833_send_word+0x54>)
 800034e:	bf14      	ite	ne
 8000350:	619a      	strne	r2, [r3, #24]
 8000352:	851a      	strheq	r2, [r3, #40]	; 0x28
 8000354:	2710      	movs	r7, #16
 8000356:	f7ff ffe1 	bl	800031c <ad9833_delay>
 800035a:	8527      	strh	r7, [r4, #40]	; 0x28
 800035c:	f7ff ffde 	bl	800031c <ad9833_delay>
 8000360:	61a7      	str	r7, [r4, #24]
 8000362:	f7ff ffdb 	bl	800031c <ad9833_delay>
 8000366:	3d01      	subs	r5, #1
 8000368:	ea4f 0646 	mov.w	r6, r6, lsl #1
 800036c:	d1e8      	bne.n	8000340 <ad9833_send_word+0x18>
 800036e:	f44f 4380 	mov.w	r3, #16384	; 0x4000
 8000372:	61a3      	str	r3, [r4, #24]
 8000374:	e8bd 40f8 	ldmia.w	sp!, {r3, r4, r5, r6, r7, lr}
 8000378:	f7ff bfd0 	b.w	800031c <ad9833_delay>
 800037c:	48000400 	.word	0x48000400

08000380 <ad9833_set_frequency>:
 8000380:	ee07 0a90 	vmov	s15, r0
 8000384:	eeb8 7a67 	vcvt.f32.u32	s14, s15
 8000388:	eddf 7a11 	vldr	s15, [pc, #68]	; 80003d0 <ad9833_set_frequency+0x50>
 800038c:	ee67 7a27 	vmul.f32	s15, s14, s15
 8000390:	b570      	push	{r4, r5, r6, lr}
 8000392:	eefc 7ae7 	vcvt.u32.f32	s15, s15
 8000396:	f44f 5004 	mov.w	r0, #8448	; 0x2100
 800039a:	ee17 3a90 	vmov	r3, s15
 800039e:	f3c3 060d 	ubfx	r6, r3, #0, #14
 80003a2:	460c      	mov	r4, r1
 80003a4:	f3c3 358d 	ubfx	r5, r3, #14, #14
 80003a8:	f7ff ffbe 	bl	8000328 <ad9833_send_word>
 80003ac:	f446 4080 	orr.w	r0, r6, #16384	; 0x4000
 80003b0:	f7ff ffba 	bl	8000328 <ad9833_send_word>
 80003b4:	f445 4080 	orr.w	r0, r5, #16384	; 0x4000
 80003b8:	f7ff ffb6 	bl	8000328 <ad9833_send_word>
 80003bc:	f44f 4040 	mov.w	r0, #49152	; 0xc000
 80003c0:	f7ff ffb2 	bl	8000328 <ad9833_send_word>
 80003c4:	4620      	mov	r0, r4
 80003c6:	e8bd 4070 	ldmia.w	sp!, {r4, r5, r6, lr}
 80003ca:	f7ff bfad 	b.w	8000328 <ad9833_send_word>
 80003ce:	bf00      	nop
 80003d0:	412bcc77 	.word	0x412bcc77

080003d4 <ad9833_set_gain>:
 80003d4:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
 80003d6:	4c15      	ldr	r4, [pc, #84]	; (800042c <ad9833_set_gain+0x58>)
 80003d8:	2510      	movs	r5, #16
 80003da:	8525      	strh	r5, [r4, #40]	; 0x28
 80003dc:	f440 5698 	orr.w	r6, r0, #4864	; 0x1300
 80003e0:	f7ff ff9c 	bl	800031c <ad9833_delay>
 80003e4:	f44f 5300 	mov.w	r3, #8192	; 0x2000
 80003e8:	8523      	strh	r3, [r4, #40]	; 0x28
 80003ea:	f7ff ff97 	bl	800031c <ad9833_delay>
 80003ee:	f04f 4390 	mov.w	r3, #1207959552	; 0x48000000
 80003f2:	f416 4f00 	tst.w	r6, #32768	; 0x8000
 80003f6:	f44f 4200 	mov.w	r2, #32768	; 0x8000
 80003fa:	4c0c      	ldr	r4, [pc, #48]	; (800042c <ad9833_set_gain+0x58>)
 80003fc:	bf14      	ite	ne
 80003fe:	619a      	strne	r2, [r3, #24]
 8000400:	851a      	strheq	r2, [r3, #40]	; 0x28
 8000402:	2710      	movs	r7, #16
 8000404:	f7ff ff8a 	bl	800031c <ad9833_delay>
 8000408:	61a7      	str	r7, [r4, #24]
 800040a:	f7ff ff87 	bl	800031c <ad9833_delay>
 800040e:	8527      	strh	r7, [r4, #40]	; 0x28
 8000410:	f7ff ff84 	bl	800031c <ad9833_delay>
 8000414:	3d01      	subs	r5, #1
 8000416:	ea4f 0646 	mov.w	r6, r6, lsl #1
 800041a:	d1e8      	bne.n	80003ee <ad9833_set_gain+0x1a>
 800041c:	f44f 5300 	mov.w	r3, #8192	; 0x2000
 8000420:	61a3      	str	r3, [r4, #24]
 8000422:	e8bd 40f8 	ldmia.w	sp!, {r3, r4, r5, r6, r7, lr}
 8000426:	f7ff bf79 	b.w	800031c <ad9833_delay>
 800042a:	bf00      	nop
 800042c:	48000400 	.word	0x48000400

08000430 <ad9833_init>:
 8000430:	e92d 41f3 	stmdb	sp!, {r0, r1, r4, r5, r6, r7, r8, lr}
 8000434:	4d2a      	ldr	r5, [pc, #168]	; (80004e0 <ad9833_init+0xb0>)
 8000436:	2400      	movs	r4, #0
 8000438:	2701      	movs	r7, #1
 800043a:	2603      	movs	r6, #3
 800043c:	f44f 4880 	mov.w	r8, #16384	; 0x4000
 8000440:	4628      	mov	r0, r5
 8000442:	4669      	mov	r1, sp
 8000444:	f8cd 8000 	str.w	r8, [sp]
 8000448:	f88d 7004 	strb.w	r7, [sp, #4]
 800044c:	f88d 4006 	strb.w	r4, [sp, #6]
 8000450:	f88d 6005 	strb.w	r6, [sp, #5]
 8000454:	f88d 4007 	strb.w	r4, [sp, #7]
 8000458:	f000 fb79 	bl	8000b4e <GPIO_Init>
 800045c:	f8c5 8018 	str.w	r8, [r5, #24]
 8000460:	4628      	mov	r0, r5
 8000462:	f44f 5800 	mov.w	r8, #8192	; 0x2000
 8000466:	4669      	mov	r1, sp
 8000468:	f8cd 8000 	str.w	r8, [sp]
 800046c:	f88d 7004 	strb.w	r7, [sp, #4]
 8000470:	f88d 4006 	strb.w	r4, [sp, #6]
 8000474:	f88d 6005 	strb.w	r6, [sp, #5]
 8000478:	f88d 4007 	strb.w	r4, [sp, #7]
 800047c:	f000 fb67 	bl	8000b4e <GPIO_Init>
 8000480:	f8c5 8018 	str.w	r8, [r5, #24]
 8000484:	4628      	mov	r0, r5
 8000486:	f04f 0810 	mov.w	r8, #16
 800048a:	4669      	mov	r1, sp
 800048c:	f8cd 8000 	str.w	r8, [sp]
 8000490:	f88d 7004 	strb.w	r7, [sp, #4]
 8000494:	f88d 4006 	strb.w	r4, [sp, #6]
 8000498:	f88d 6005 	strb.w	r6, [sp, #5]
 800049c:	f88d 4007 	strb.w	r4, [sp, #7]
 80004a0:	f000 fb55 	bl	8000b4e <GPIO_Init>
 80004a4:	f8c5 8018 	str.w	r8, [r5, #24]
 80004a8:	f44f 4300 	mov.w	r3, #32768	; 0x8000
 80004ac:	f04f 4090 	mov.w	r0, #1207959552	; 0x48000000
 80004b0:	4669      	mov	r1, sp
 80004b2:	9300      	str	r3, [sp, #0]
 80004b4:	f88d 7004 	strb.w	r7, [sp, #4]
 80004b8:	f88d 4006 	strb.w	r4, [sp, #6]
 80004bc:	f88d 6005 	strb.w	r6, [sp, #5]
 80004c0:	f88d 4007 	strb.w	r4, [sp, #7]
 80004c4:	f000 fb43 	bl	8000b4e <GPIO_Init>
 80004c8:	f8c5 8018 	str.w	r8, [r5, #24]
 80004cc:	f240 33e9 	movw	r3, #1001	; 0x3e9
 80004d0:	3b01      	subs	r3, #1
 80004d2:	d001      	beq.n	80004d8 <ad9833_init+0xa8>
 80004d4:	bf00      	nop
 80004d6:	e7fb      	b.n	80004d0 <ad9833_init+0xa0>
 80004d8:	b002      	add	sp, #8
 80004da:	e8bd 81f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, pc}
 80004de:	bf00      	nop
 80004e0:	48000400 	.word	0x48000400

080004e4 <thread_ending>:
 80004e4:	b672      	cpsid	i
 80004e6:	4b05      	ldr	r3, [pc, #20]	; (80004fc <thread_ending+0x18>)
 80004e8:	4a05      	ldr	r2, [pc, #20]	; (8000500 <thread_ending+0x1c>)
 80004ea:	681b      	ldr	r3, [r3, #0]
 80004ec:	210c      	movs	r1, #12
 80004ee:	fb01 2303 	mla	r3, r1, r3, r2
 80004f2:	2200      	movs	r2, #0
 80004f4:	605a      	str	r2, [r3, #4]
 80004f6:	b662      	cpsie	i
 80004f8:	bf00      	nop
 80004fa:	e7fd      	b.n	80004f8 <thread_ending+0x14>
 80004fc:	20000394 	.word	0x20000394
 8000500:	20000334 	.word	0x20000334

08000504 <null_thread>:
 8000504:	b508      	push	{r3, lr}
 8000506:	f000 fc15 	bl	8000d34 <sleep>
 800050a:	e7fc      	b.n	8000506 <null_thread+0x2>

0800050c <scheduler>:
 800050c:	b570      	push	{r4, r5, r6, lr}
 800050e:	2200      	movs	r2, #0
 8000510:	4611      	mov	r1, r2
 8000512:	4b15      	ldr	r3, [pc, #84]	; (8000568 <scheduler+0x5c>)
 8000514:	200c      	movs	r0, #12
 8000516:	fb00 f501 	mul.w	r5, r0, r1
 800051a:	195e      	adds	r6, r3, r5
 800051c:	6874      	ldr	r4, [r6, #4]
 800051e:	f014 0f02 	tst.w	r4, #2
 8000522:	461c      	mov	r4, r3
 8000524:	d10a      	bne.n	800053c <scheduler+0x30>
 8000526:	6876      	ldr	r6, [r6, #4]
 8000528:	07f6      	lsls	r6, r6, #31
 800052a:	d507      	bpl.n	800053c <scheduler+0x30>
 800052c:	4350      	muls	r0, r2
 800052e:	5b5d      	ldrh	r5, [r3, r5]
 8000530:	5a18      	ldrh	r0, [r3, r0]
 8000532:	b2ad      	uxth	r5, r5
 8000534:	b280      	uxth	r0, r0
 8000536:	4285      	cmp	r5, r0
 8000538:	bf38      	it	cc
 800053a:	460a      	movcc	r2, r1
 800053c:	200c      	movs	r0, #12
 800053e:	4348      	muls	r0, r1
 8000540:	5a1d      	ldrh	r5, [r3, r0]
 8000542:	b2ad      	uxth	r5, r5
 8000544:	b11d      	cbz	r5, 800054e <scheduler+0x42>
 8000546:	5a1d      	ldrh	r5, [r3, r0]
 8000548:	3d01      	subs	r5, #1
 800054a:	b2ad      	uxth	r5, r5
 800054c:	521d      	strh	r5, [r3, r0]
 800054e:	3101      	adds	r1, #1
 8000550:	2908      	cmp	r1, #8
 8000552:	d1de      	bne.n	8000512 <scheduler+0x6>
 8000554:	230c      	movs	r3, #12
 8000556:	4353      	muls	r3, r2
 8000558:	18e1      	adds	r1, r4, r3
 800055a:	8849      	ldrh	r1, [r1, #2]
 800055c:	b289      	uxth	r1, r1
 800055e:	52e1      	strh	r1, [r4, r3]
 8000560:	4b02      	ldr	r3, [pc, #8]	; (800056c <scheduler+0x60>)
 8000562:	601a      	str	r2, [r3, #0]
 8000564:	bd70      	pop	{r4, r5, r6, pc}
 8000566:	bf00      	nop
 8000568:	20000334 	.word	0x20000334
 800056c:	20000394 	.word	0x20000394

08000570 <SysTick_Handler>:
 8000570:	e92d 0ff0 	stmdb	sp!, {r4, r5, r6, r7, r8, r9, sl, fp}
 8000574:	f3ef 8208 	mrs	r2, MSP
 8000578:	4c0d      	ldr	r4, [pc, #52]	; (80005b0 <SysTick_Handler+0x40>)
 800057a:	4d0e      	ldr	r5, [pc, #56]	; (80005b4 <SysTick_Handler+0x44>)
 800057c:	6823      	ldr	r3, [r4, #0]
 800057e:	3301      	adds	r3, #1
 8000580:	d005      	beq.n	800058e <SysTick_Handler+0x1e>
 8000582:	6823      	ldr	r3, [r4, #0]
 8000584:	210c      	movs	r1, #12
 8000586:	fb01 5303 	mla	r3, r1, r3, r5
 800058a:	609a      	str	r2, [r3, #8]
 800058c:	e001      	b.n	8000592 <SysTick_Handler+0x22>
 800058e:	2300      	movs	r3, #0
 8000590:	6023      	str	r3, [r4, #0]
 8000592:	f7ff ffbb 	bl	800050c <scheduler>
 8000596:	6823      	ldr	r3, [r4, #0]
 8000598:	220c      	movs	r2, #12
 800059a:	fb02 5503 	mla	r5, r2, r3, r5
 800059e:	f06f 0306 	mvn.w	r3, #6
 80005a2:	68aa      	ldr	r2, [r5, #8]
 80005a4:	469e      	mov	lr, r3
 80005a6:	f382 8808 	msr	MSP, r2
 80005aa:	e8bd 0ff0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, fp}
 80005ae:	4770      	bx	lr
 80005b0:	20000394 	.word	0x20000394
 80005b4:	20000334 	.word	0x20000334

080005b8 <sched_off>:
 80005b8:	b672      	cpsid	i
 80005ba:	4770      	bx	lr

080005bc <sched_on>:
 80005bc:	b662      	cpsie	i
 80005be:	4770      	bx	lr

080005c0 <yield>:
 80005c0:	4770      	bx	lr
	...

080005c4 <get_thread_id>:
 80005c4:	b082      	sub	sp, #8
 80005c6:	b672      	cpsid	i
 80005c8:	4b03      	ldr	r3, [pc, #12]	; (80005d8 <get_thread_id+0x14>)
 80005ca:	681b      	ldr	r3, [r3, #0]
 80005cc:	9301      	str	r3, [sp, #4]
 80005ce:	b662      	cpsie	i
 80005d0:	9801      	ldr	r0, [sp, #4]
 80005d2:	b002      	add	sp, #8
 80005d4:	4770      	bx	lr
 80005d6:	bf00      	nop
 80005d8:	20000394 	.word	0x20000394

080005dc <kernel_start>:
 80005dc:	b508      	push	{r3, lr}
 80005de:	f000 fb97 	bl	8000d10 <sys_tick_init>
 80005e2:	bf00      	nop
 80005e4:	e7fd      	b.n	80005e2 <kernel_start+0x6>
	...

080005e8 <create_thread>:
 80005e8:	f022 0203 	bic.w	r2, r2, #3
 80005ec:	3a40      	subs	r2, #64	; 0x40
 80005ee:	e92d 43f0 	stmdb	sp!, {r4, r5, r6, r7, r8, r9, lr}
 80005f2:	eb01 0c02 	add.w	ip, r1, r2
 80005f6:	f102 0834 	add.w	r8, r2, #52	; 0x34
 80005fa:	f102 0938 	add.w	r9, r2, #56	; 0x38
 80005fe:	323c      	adds	r2, #60	; 0x3c
 8000600:	4488      	add	r8, r1
 8000602:	4489      	add	r9, r1
 8000604:	4607      	mov	r7, r0
 8000606:	4411      	add	r1, r2
 8000608:	2200      	movs	r2, #0
 800060a:	b672      	cpsid	i
 800060c:	4e11      	ldr	r6, [pc, #68]	; (8000654 <create_thread+0x6c>)
 800060e:	250c      	movs	r5, #12
 8000610:	4355      	muls	r5, r2
 8000612:	1974      	adds	r4, r6, r5
 8000614:	6860      	ldr	r0, [r4, #4]
 8000616:	07c0      	lsls	r0, r0, #31
 8000618:	d412      	bmi.n	8000640 <create_thread+0x58>
 800061a:	480f      	ldr	r0, [pc, #60]	; (8000658 <create_thread+0x70>)
 800061c:	f8c4 c008 	str.w	ip, [r4, #8]
 8000620:	2b07      	cmp	r3, #7
 8000622:	f8c8 0000 	str.w	r0, [r8]
 8000626:	f04f 5004 	mov.w	r0, #553648128	; 0x21000000
 800062a:	f8c9 7000 	str.w	r7, [r9]
 800062e:	bf98      	it	ls
 8000630:	2308      	movls	r3, #8
 8000632:	6008      	str	r0, [r1, #0]
 8000634:	2001      	movs	r0, #1
 8000636:	8063      	strh	r3, [r4, #2]
 8000638:	5373      	strh	r3, [r6, r5]
 800063a:	6060      	str	r0, [r4, #4]
 800063c:	4610      	mov	r0, r2
 800063e:	e000      	b.n	8000642 <create_thread+0x5a>
 8000640:	2008      	movs	r0, #8
 8000642:	b662      	cpsie	i
 8000644:	3201      	adds	r2, #1
 8000646:	2a08      	cmp	r2, #8
 8000648:	d001      	beq.n	800064e <create_thread+0x66>
 800064a:	2808      	cmp	r0, #8
 800064c:	d0dd      	beq.n	800060a <create_thread+0x22>
 800064e:	e8bd 83f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, pc}
 8000652:	bf00      	nop
 8000654:	20000334 	.word	0x20000334
 8000658:	080004e5 	.word	0x080004e5

0800065c <kernel_init>:
 800065c:	b510      	push	{r4, lr}
 800065e:	2300      	movs	r3, #0
 8000660:	490b      	ldr	r1, [pc, #44]	; (8000690 <kernel_init+0x34>)
 8000662:	220c      	movs	r2, #12
 8000664:	435a      	muls	r2, r3
 8000666:	188c      	adds	r4, r1, r2
 8000668:	2000      	movs	r0, #0
 800066a:	6060      	str	r0, [r4, #4]
 800066c:	3301      	adds	r3, #1
 800066e:	2008      	movs	r0, #8
 8000670:	4283      	cmp	r3, r0
 8000672:	8060      	strh	r0, [r4, #2]
 8000674:	5288      	strh	r0, [r1, r2]
 8000676:	d1f3      	bne.n	8000660 <kernel_init+0x4>
 8000678:	4b06      	ldr	r3, [pc, #24]	; (8000694 <kernel_init+0x38>)
 800067a:	4807      	ldr	r0, [pc, #28]	; (8000698 <kernel_init+0x3c>)
 800067c:	4907      	ldr	r1, [pc, #28]	; (800069c <kernel_init+0x40>)
 800067e:	f04f 32ff 	mov.w	r2, #4294967295
 8000682:	601a      	str	r2, [r3, #0]
 8000684:	e8bd 4010 	ldmia.w	sp!, {r4, lr}
 8000688:	2280      	movs	r2, #128	; 0x80
 800068a:	23ff      	movs	r3, #255	; 0xff
 800068c:	f7ff bfac 	b.w	80005e8 <create_thread>
 8000690:	20000334 	.word	0x20000334
 8000694:	20000394 	.word	0x20000394
 8000698:	08000505 	.word	0x08000505
 800069c:	20000398 	.word	0x20000398

080006a0 <set_wait_state>:
 80006a0:	b507      	push	{r0, r1, r2, lr}
 80006a2:	f7ff ff8f 	bl	80005c4 <get_thread_id>
 80006a6:	9000      	str	r0, [sp, #0]
 80006a8:	b672      	cpsid	i
 80006aa:	4b0c      	ldr	r3, [pc, #48]	; (80006dc <set_wait_state+0x3c>)
 80006ac:	9a00      	ldr	r2, [sp, #0]
 80006ae:	210c      	movs	r1, #12
 80006b0:	fb01 3202 	mla	r2, r1, r2, r3
 80006b4:	6851      	ldr	r1, [r2, #4]
 80006b6:	f041 0102 	orr.w	r1, r1, #2
 80006ba:	6051      	str	r1, [r2, #4]
 80006bc:	b672      	cpsid	i
 80006be:	9a00      	ldr	r2, [sp, #0]
 80006c0:	210c      	movs	r1, #12
 80006c2:	fb01 3202 	mla	r2, r1, r2, r3
 80006c6:	6852      	ldr	r2, [r2, #4]
 80006c8:	9201      	str	r2, [sp, #4]
 80006ca:	b662      	cpsie	i
 80006cc:	9a01      	ldr	r2, [sp, #4]
 80006ce:	9a01      	ldr	r2, [sp, #4]
 80006d0:	0792      	lsls	r2, r2, #30
 80006d2:	d4f3      	bmi.n	80006bc <set_wait_state+0x1c>
 80006d4:	b003      	add	sp, #12
 80006d6:	f85d fb04 	ldr.w	pc, [sp], #4
 80006da:	bf00      	nop
 80006dc:	20000334 	.word	0x20000334

080006e0 <wake_up_threads>:
 80006e0:	2300      	movs	r3, #0
 80006e2:	b672      	cpsid	i
 80006e4:	4a06      	ldr	r2, [pc, #24]	; (8000700 <wake_up_threads+0x20>)
 80006e6:	210c      	movs	r1, #12
 80006e8:	fb01 2203 	mla	r2, r1, r3, r2
 80006ec:	6851      	ldr	r1, [r2, #4]
 80006ee:	f021 0102 	bic.w	r1, r1, #2
 80006f2:	6051      	str	r1, [r2, #4]
 80006f4:	b662      	cpsie	i
 80006f6:	3301      	adds	r3, #1
 80006f8:	2b08      	cmp	r3, #8
 80006fa:	d1f2      	bne.n	80006e2 <wake_up_threads+0x2>
 80006fc:	4770      	bx	lr
 80006fe:	bf00      	nop
 8000700:	20000334 	.word	0x20000334

08000704 <putc_>:
 8000704:	b538      	push	{r3, r4, r5, lr}
 8000706:	4c06      	ldr	r4, [pc, #24]	; (8000720 <putc_+0x1c>)
 8000708:	4605      	mov	r5, r0
 800070a:	4620      	mov	r0, r4
 800070c:	f000 f912 	bl	8000934 <mutex_lock>
 8000710:	4628      	mov	r0, r5
 8000712:	f000 fcef 	bl	80010f4 <uart_write>
 8000716:	4620      	mov	r0, r4
 8000718:	e8bd 4038 	ldmia.w	sp!, {r3, r4, r5, lr}
 800071c:	f000 b926 	b.w	800096c <mutex_unlock>
 8000720:	20000418 	.word	0x20000418

08000724 <puts_>:
 8000724:	b510      	push	{r4, lr}
 8000726:	4604      	mov	r4, r0
 8000728:	4807      	ldr	r0, [pc, #28]	; (8000748 <puts_+0x24>)
 800072a:	f000 f903 	bl	8000934 <mutex_lock>
 800072e:	3c01      	subs	r4, #1
 8000730:	f814 0f01 	ldrb.w	r0, [r4, #1]!
 8000734:	b110      	cbz	r0, 800073c <puts_+0x18>
 8000736:	f7ff ffe5 	bl	8000704 <putc_>
 800073a:	e7f9      	b.n	8000730 <puts_+0xc>
 800073c:	4802      	ldr	r0, [pc, #8]	; (8000748 <puts_+0x24>)
 800073e:	e8bd 4010 	ldmia.w	sp!, {r4, lr}
 8000742:	f000 b913 	b.w	800096c <mutex_unlock>
 8000746:	bf00      	nop
 8000748:	20000424 	.word	0x20000424

0800074c <puti_>:
 800074c:	b530      	push	{r4, r5, lr}
 800074e:	b085      	sub	sp, #20
 8000750:	1e03      	subs	r3, r0, #0
 8000752:	f04f 0200 	mov.w	r2, #0
 8000756:	bfa8      	it	ge
 8000758:	4614      	movge	r4, r2
 800075a:	f88d 200f 	strb.w	r2, [sp, #15]
 800075e:	bfbc      	itt	lt
 8000760:	425b      	neglt	r3, r3
 8000762:	2401      	movlt	r4, #1
 8000764:	220a      	movs	r2, #10
 8000766:	210a      	movs	r1, #10
 8000768:	fb93 f5f1 	sdiv	r5, r3, r1
 800076c:	fb01 3315 	mls	r3, r1, r5, r3
 8000770:	a801      	add	r0, sp, #4
 8000772:	3330      	adds	r3, #48	; 0x30
 8000774:	5413      	strb	r3, [r2, r0]
 8000776:	1e51      	subs	r1, r2, #1
 8000778:	462b      	mov	r3, r5
 800077a:	b10d      	cbz	r5, 8000780 <puti_+0x34>
 800077c:	460a      	mov	r2, r1
 800077e:	e7f2      	b.n	8000766 <puti_+0x1a>
 8000780:	b12c      	cbz	r4, 800078e <puti_+0x42>
 8000782:	ab04      	add	r3, sp, #16
 8000784:	440b      	add	r3, r1
 8000786:	222d      	movs	r2, #45	; 0x2d
 8000788:	f803 2c0c 	strb.w	r2, [r3, #-12]
 800078c:	460a      	mov	r2, r1
 800078e:	4410      	add	r0, r2
 8000790:	f7ff ffc8 	bl	8000724 <puts_>
 8000794:	b005      	add	sp, #20
 8000796:	bd30      	pop	{r4, r5, pc}

08000798 <putui_>:
 8000798:	b51f      	push	{r0, r1, r2, r3, r4, lr}
 800079a:	2300      	movs	r3, #0
 800079c:	f88d 300f 	strb.w	r3, [sp, #15]
 80007a0:	230a      	movs	r3, #10
 80007a2:	240a      	movs	r4, #10
 80007a4:	fbb0 f1f4 	udiv	r1, r0, r4
 80007a8:	fb04 0011 	mls	r0, r4, r1, r0
 80007ac:	aa01      	add	r2, sp, #4
 80007ae:	3030      	adds	r0, #48	; 0x30
 80007b0:	5498      	strb	r0, [r3, r2]
 80007b2:	1e5c      	subs	r4, r3, #1
 80007b4:	4608      	mov	r0, r1
 80007b6:	b109      	cbz	r1, 80007bc <putui_+0x24>
 80007b8:	4623      	mov	r3, r4
 80007ba:	e7f2      	b.n	80007a2 <putui_+0xa>
 80007bc:	18d0      	adds	r0, r2, r3
 80007be:	f7ff ffb1 	bl	8000724 <puts_>
 80007c2:	b004      	add	sp, #16
 80007c4:	bd10      	pop	{r4, pc}

080007c6 <putx_>:
 80007c6:	b51f      	push	{r0, r1, r2, r3, r4, lr}
 80007c8:	2300      	movs	r3, #0
 80007ca:	f88d 300f 	strb.w	r3, [sp, #15]
 80007ce:	230a      	movs	r3, #10
 80007d0:	f000 010f 	and.w	r1, r0, #15
 80007d4:	2909      	cmp	r1, #9
 80007d6:	aa01      	add	r2, sp, #4
 80007d8:	bf94      	ite	ls
 80007da:	3130      	addls	r1, #48	; 0x30
 80007dc:	3157      	addhi	r1, #87	; 0x57
 80007de:	0900      	lsrs	r0, r0, #4
 80007e0:	54d1      	strb	r1, [r2, r3]
 80007e2:	f103 31ff 	add.w	r1, r3, #4294967295
 80007e6:	d001      	beq.n	80007ec <putx_+0x26>
 80007e8:	460b      	mov	r3, r1
 80007ea:	e7f1      	b.n	80007d0 <putx_+0xa>
 80007ec:	18d0      	adds	r0, r2, r3
 80007ee:	f7ff ff99 	bl	8000724 <puts_>
 80007f2:	b005      	add	sp, #20
 80007f4:	f85d fb04 	ldr.w	pc, [sp], #4

080007f8 <printf_>:
 80007f8:	b40f      	push	{r0, r1, r2, r3}
 80007fa:	b537      	push	{r0, r1, r2, r4, r5, lr}
 80007fc:	ac06      	add	r4, sp, #24
 80007fe:	4826      	ldr	r0, [pc, #152]	; (8000898 <printf_+0xa0>)
 8000800:	f854 5b04 	ldr.w	r5, [r4], #4
 8000804:	f000 f896 	bl	8000934 <mutex_lock>
 8000808:	9401      	str	r4, [sp, #4]
 800080a:	2400      	movs	r4, #0
 800080c:	5d28      	ldrb	r0, [r5, r4]
 800080e:	2800      	cmp	r0, #0
 8000810:	d039      	beq.n	8000886 <printf_+0x8e>
 8000812:	2825      	cmp	r0, #37	; 0x25
 8000814:	d003      	beq.n	800081e <printf_+0x26>
 8000816:	f7ff ff75 	bl	8000704 <putc_>
 800081a:	3401      	adds	r4, #1
 800081c:	e7f6      	b.n	800080c <printf_+0x14>
 800081e:	192b      	adds	r3, r5, r4
 8000820:	7858      	ldrb	r0, [r3, #1]
 8000822:	2869      	cmp	r0, #105	; 0x69
 8000824:	d016      	beq.n	8000854 <printf_+0x5c>
 8000826:	d808      	bhi.n	800083a <printf_+0x42>
 8000828:	2825      	cmp	r0, #37	; 0x25
 800082a:	d028      	beq.n	800087e <printf_+0x86>
 800082c:	2863      	cmp	r0, #99	; 0x63
 800082e:	d128      	bne.n	8000882 <printf_+0x8a>
 8000830:	9b01      	ldr	r3, [sp, #4]
 8000832:	1d1a      	adds	r2, r3, #4
 8000834:	9201      	str	r2, [sp, #4]
 8000836:	7818      	ldrb	r0, [r3, #0]
 8000838:	e021      	b.n	800087e <printf_+0x86>
 800083a:	2875      	cmp	r0, #117	; 0x75
 800083c:	d011      	beq.n	8000862 <printf_+0x6a>
 800083e:	2878      	cmp	r0, #120	; 0x78
 8000840:	d016      	beq.n	8000870 <printf_+0x78>
 8000842:	2873      	cmp	r0, #115	; 0x73
 8000844:	d11d      	bne.n	8000882 <printf_+0x8a>
 8000846:	9b01      	ldr	r3, [sp, #4]
 8000848:	1d1a      	adds	r2, r3, #4
 800084a:	6818      	ldr	r0, [r3, #0]
 800084c:	9201      	str	r2, [sp, #4]
 800084e:	f7ff ff69 	bl	8000724 <puts_>
 8000852:	e016      	b.n	8000882 <printf_+0x8a>
 8000854:	9b01      	ldr	r3, [sp, #4]
 8000856:	1d1a      	adds	r2, r3, #4
 8000858:	6818      	ldr	r0, [r3, #0]
 800085a:	9201      	str	r2, [sp, #4]
 800085c:	f7ff ff76 	bl	800074c <puti_>
 8000860:	e00f      	b.n	8000882 <printf_+0x8a>
 8000862:	9b01      	ldr	r3, [sp, #4]
 8000864:	1d1a      	adds	r2, r3, #4
 8000866:	6818      	ldr	r0, [r3, #0]
 8000868:	9201      	str	r2, [sp, #4]
 800086a:	f7ff ff95 	bl	8000798 <putui_>
 800086e:	e008      	b.n	8000882 <printf_+0x8a>
 8000870:	9b01      	ldr	r3, [sp, #4]
 8000872:	1d1a      	adds	r2, r3, #4
 8000874:	6818      	ldr	r0, [r3, #0]
 8000876:	9201      	str	r2, [sp, #4]
 8000878:	f7ff ffa5 	bl	80007c6 <putx_>
 800087c:	e001      	b.n	8000882 <printf_+0x8a>
 800087e:	f7ff ff41 	bl	8000704 <putc_>
 8000882:	3402      	adds	r4, #2
 8000884:	e7c2      	b.n	800080c <printf_+0x14>
 8000886:	4804      	ldr	r0, [pc, #16]	; (8000898 <printf_+0xa0>)
 8000888:	f000 f870 	bl	800096c <mutex_unlock>
 800088c:	b003      	add	sp, #12
 800088e:	e8bd 4030 	ldmia.w	sp!, {r4, r5, lr}
 8000892:	b004      	add	sp, #16
 8000894:	4770      	bx	lr
 8000896:	bf00      	nop
 8000898:	20000420 	.word	0x20000420

0800089c <stdio_init>:
 800089c:	b510      	push	{r4, lr}
 800089e:	480e      	ldr	r0, [pc, #56]	; (80008d8 <stdio_init+0x3c>)
 80008a0:	f000 f83e 	bl	8000920 <mutex_init>
 80008a4:	480d      	ldr	r0, [pc, #52]	; (80008dc <stdio_init+0x40>)
 80008a6:	f000 f83b 	bl	8000920 <mutex_init>
 80008aa:	480d      	ldr	r0, [pc, #52]	; (80008e0 <stdio_init+0x44>)
 80008ac:	f000 f838 	bl	8000920 <mutex_init>
 80008b0:	480c      	ldr	r0, [pc, #48]	; (80008e4 <stdio_init+0x48>)
 80008b2:	f000 f835 	bl	8000920 <mutex_init>
 80008b6:	2408      	movs	r4, #8
 80008b8:	2020      	movs	r0, #32
 80008ba:	f7ff ff23 	bl	8000704 <putc_>
 80008be:	3c01      	subs	r4, #1
 80008c0:	d1fa      	bne.n	80008b8 <stdio_init+0x1c>
 80008c2:	2420      	movs	r4, #32
 80008c4:	200a      	movs	r0, #10
 80008c6:	f7ff ff1d 	bl	8000704 <putc_>
 80008ca:	3c01      	subs	r4, #1
 80008cc:	d1fa      	bne.n	80008c4 <stdio_init+0x28>
 80008ce:	4806      	ldr	r0, [pc, #24]	; (80008e8 <stdio_init+0x4c>)
 80008d0:	e8bd 4010 	ldmia.w	sp!, {r4, lr}
 80008d4:	f7ff bf90 	b.w	80007f8 <printf_>
 80008d8:	20000418 	.word	0x20000418
 80008dc:	2000041c 	.word	0x2000041c
 80008e0:	20000424 	.word	0x20000424
 80008e4:	20000420 	.word	0x20000420
 80008e8:	08001a3d 	.word	0x08001a3d

080008ec <messages_init>:
 80008ec:	b510      	push	{r4, lr}
 80008ee:	2200      	movs	r2, #0
 80008f0:	4909      	ldr	r1, [pc, #36]	; (8000918 <messages_init+0x2c>)
 80008f2:	2300      	movs	r3, #0
 80008f4:	f841 3022 	str.w	r3, [r1, r2, lsl #2]
 80008f8:	3201      	adds	r2, #1
 80008fa:	2a08      	cmp	r2, #8
 80008fc:	d1f8      	bne.n	80008f0 <messages_init+0x4>
 80008fe:	4c07      	ldr	r4, [pc, #28]	; (800091c <messages_init+0x30>)
 8000900:	0118      	lsls	r0, r3, #4
 8000902:	1821      	adds	r1, r4, r0
 8000904:	3301      	adds	r3, #1
 8000906:	2200      	movs	r2, #0
 8000908:	2b04      	cmp	r3, #4
 800090a:	604a      	str	r2, [r1, #4]
 800090c:	5022      	str	r2, [r4, r0]
 800090e:	60ca      	str	r2, [r1, #12]
 8000910:	608a      	str	r2, [r1, #8]
 8000912:	d1f4      	bne.n	80008fe <messages_init+0x12>
 8000914:	bd10      	pop	{r4, pc}
 8000916:	bf00      	nop
 8000918:	20000428 	.word	0x20000428
 800091c:	20000448 	.word	0x20000448

08000920 <mutex_init>:
 8000920:	b510      	push	{r4, lr}
 8000922:	4604      	mov	r4, r0
 8000924:	f7ff fe48 	bl	80005b8 <sched_off>
 8000928:	2300      	movs	r3, #0
 800092a:	6023      	str	r3, [r4, #0]
 800092c:	e8bd 4010 	ldmia.w	sp!, {r4, lr}
 8000930:	f7ff be44 	b.w	80005bc <sched_on>

08000934 <mutex_lock>:
 8000934:	b513      	push	{r0, r1, r4, lr}
 8000936:	4604      	mov	r4, r0
 8000938:	f7ff fe3e 	bl	80005b8 <sched_off>
 800093c:	6823      	ldr	r3, [r4, #0]
 800093e:	9301      	str	r3, [sp, #4]
 8000940:	f7ff fe3c 	bl	80005bc <sched_on>
 8000944:	9b01      	ldr	r3, [sp, #4]
 8000946:	b10b      	cbz	r3, 800094c <mutex_lock+0x18>
 8000948:	f7ff feaa 	bl	80006a0 <set_wait_state>
 800094c:	9b01      	ldr	r3, [sp, #4]
 800094e:	2b00      	cmp	r3, #0
 8000950:	d1f2      	bne.n	8000938 <mutex_lock+0x4>
 8000952:	f7ff fe31 	bl	80005b8 <sched_off>
 8000956:	6823      	ldr	r3, [r4, #0]
 8000958:	9301      	str	r3, [sp, #4]
 800095a:	9b01      	ldr	r3, [sp, #4]
 800095c:	2b00      	cmp	r3, #0
 800095e:	d1eb      	bne.n	8000938 <mutex_lock+0x4>
 8000960:	2301      	movs	r3, #1
 8000962:	6023      	str	r3, [r4, #0]
 8000964:	f7ff fe2a 	bl	80005bc <sched_on>
 8000968:	b002      	add	sp, #8
 800096a:	bd10      	pop	{r4, pc}

0800096c <mutex_unlock>:
 800096c:	b508      	push	{r3, lr}
 800096e:	f7ff ffd7 	bl	8000920 <mutex_init>
 8000972:	f7ff feb5 	bl	80006e0 <wake_up_threads>
 8000976:	e8bd 4008 	ldmia.w	sp!, {r3, lr}
 800097a:	f7ff be21 	b.w	80005c0 <yield>

0800097e <lib_os_init>:
 800097e:	b508      	push	{r3, lr}
 8000980:	f7ff fe6c 	bl	800065c <kernel_init>
 8000984:	f7ff ffb2 	bl	80008ec <messages_init>
 8000988:	e8bd 4008 	ldmia.w	sp!, {r3, lr}
 800098c:	f7ff bf86 	b.w	800089c <stdio_init>

08000990 <Default_Handler>:
 8000990:	4668      	mov	r0, sp
 8000992:	f020 0107 	bic.w	r1, r0, #7
 8000996:	468d      	mov	sp, r1
 8000998:	bf00      	nop
 800099a:	e7fd      	b.n	8000998 <Default_Handler+0x8>

0800099c <HardFault_Handler>:
 800099c:	f44f 7080 	mov.w	r0, #256	; 0x100
 80009a0:	f000 f8c5 	bl	8000b2e <led_on>
 80009a4:	4b06      	ldr	r3, [pc, #24]	; (80009c0 <HardFault_Handler+0x24>)
 80009a6:	3b01      	subs	r3, #1
 80009a8:	d001      	beq.n	80009ae <HardFault_Handler+0x12>
 80009aa:	bf00      	nop
 80009ac:	e7fb      	b.n	80009a6 <HardFault_Handler+0xa>
 80009ae:	f44f 7080 	mov.w	r0, #256	; 0x100
 80009b2:	f000 f8c4 	bl	8000b3e <led_off>
 80009b6:	4b02      	ldr	r3, [pc, #8]	; (80009c0 <HardFault_Handler+0x24>)
 80009b8:	3b01      	subs	r3, #1
 80009ba:	d0ef      	beq.n	800099c <HardFault_Handler>
 80009bc:	bf00      	nop
 80009be:	e7fb      	b.n	80009b8 <HardFault_Handler+0x1c>
 80009c0:	00989681 	.word	0x00989681

080009c4 <_reset_init>:
 80009c4:	4a0e      	ldr	r2, [pc, #56]	; (8000a00 <_reset_init+0x3c>)
 80009c6:	480f      	ldr	r0, [pc, #60]	; (8000a04 <_reset_init+0x40>)
 80009c8:	1a80      	subs	r0, r0, r2
 80009ca:	1080      	asrs	r0, r0, #2
 80009cc:	2300      	movs	r3, #0
 80009ce:	4283      	cmp	r3, r0
 80009d0:	d006      	beq.n	80009e0 <_reset_init+0x1c>
 80009d2:	490d      	ldr	r1, [pc, #52]	; (8000a08 <_reset_init+0x44>)
 80009d4:	f851 1023 	ldr.w	r1, [r1, r3, lsl #2]
 80009d8:	f842 1023 	str.w	r1, [r2, r3, lsl #2]
 80009dc:	3301      	adds	r3, #1
 80009de:	e7f6      	b.n	80009ce <_reset_init+0xa>
 80009e0:	4b0a      	ldr	r3, [pc, #40]	; (8000a0c <_reset_init+0x48>)
 80009e2:	f8d3 2088 	ldr.w	r2, [r3, #136]	; 0x88
 80009e6:	f442 0270 	orr.w	r2, r2, #15728640	; 0xf00000
 80009ea:	f8c3 2088 	str.w	r2, [r3, #136]	; 0x88
 80009ee:	f503 730c 	add.w	r3, r3, #560	; 0x230
 80009f2:	685a      	ldr	r2, [r3, #4]
 80009f4:	f022 4240 	bic.w	r2, r2, #3221225472	; 0xc0000000
 80009f8:	605a      	str	r2, [r3, #4]
 80009fa:	f7ff bbfb 	b.w	80001f4 <main>
 80009fe:	bf00      	nop
 8000a00:	20000000 	.word	0x20000000
 8000a04:	20000034 	.word	0x20000034
 8000a08:	08001a54 	.word	0x08001a54
 8000a0c:	e000ed00 	.word	0xe000ed00

08000a10 <i2c_delay>:
 8000a10:	230b      	movs	r3, #11
 8000a12:	3b01      	subs	r3, #1
 8000a14:	d001      	beq.n	8000a1a <i2c_delay+0xa>
 8000a16:	bf00      	nop
 8000a18:	e7fb      	b.n	8000a12 <i2c_delay+0x2>
 8000a1a:	4770      	bx	lr

08000a1c <SetLowSDA>:
 8000a1c:	b513      	push	{r0, r1, r4, lr}
 8000a1e:	2301      	movs	r3, #1
 8000a20:	2203      	movs	r2, #3
 8000a22:	2410      	movs	r4, #16
 8000a24:	f88d 3004 	strb.w	r3, [sp, #4]
 8000a28:	f88d 3006 	strb.w	r3, [sp, #6]
 8000a2c:	4669      	mov	r1, sp
 8000a2e:	2300      	movs	r3, #0
 8000a30:	f04f 4090 	mov.w	r0, #1207959552	; 0x48000000
 8000a34:	f88d 2005 	strb.w	r2, [sp, #5]
 8000a38:	f88d 3007 	strb.w	r3, [sp, #7]
 8000a3c:	9400      	str	r4, [sp, #0]
 8000a3e:	f000 f886 	bl	8000b4e <GPIO_Init>
 8000a42:	f04f 4090 	mov.w	r0, #1207959552	; 0x48000000
 8000a46:	4621      	mov	r1, r4
 8000a48:	f000 f8ca 	bl	8000be0 <GPIO_ResetBits>
 8000a4c:	f7ff ffe0 	bl	8000a10 <i2c_delay>
 8000a50:	b002      	add	sp, #8
 8000a52:	bd10      	pop	{r4, pc}

08000a54 <SetHighSDA>:
 8000a54:	b513      	push	{r0, r1, r4, lr}
 8000a56:	2203      	movs	r2, #3
 8000a58:	2300      	movs	r3, #0
 8000a5a:	2410      	movs	r4, #16
 8000a5c:	f88d 2005 	strb.w	r2, [sp, #5]
 8000a60:	4669      	mov	r1, sp
 8000a62:	2201      	movs	r2, #1
 8000a64:	f04f 4090 	mov.w	r0, #1207959552	; 0x48000000
 8000a68:	f88d 3004 	strb.w	r3, [sp, #4]
 8000a6c:	f88d 2006 	strb.w	r2, [sp, #6]
 8000a70:	f88d 3007 	strb.w	r3, [sp, #7]
 8000a74:	9400      	str	r4, [sp, #0]
 8000a76:	f000 f86a 	bl	8000b4e <GPIO_Init>
 8000a7a:	f04f 4090 	mov.w	r0, #1207959552	; 0x48000000
 8000a7e:	4621      	mov	r1, r4
 8000a80:	f000 f8aa 	bl	8000bd8 <GPIO_SetBits>
 8000a84:	f7ff ffc4 	bl	8000a10 <i2c_delay>
 8000a88:	b002      	add	sp, #8
 8000a8a:	bd10      	pop	{r4, pc}

08000a8c <SetHighSCL>:
 8000a8c:	b508      	push	{r3, lr}
 8000a8e:	f04f 4090 	mov.w	r0, #1207959552	; 0x48000000
 8000a92:	2120      	movs	r1, #32
 8000a94:	f000 f8a0 	bl	8000bd8 <GPIO_SetBits>
 8000a98:	e8bd 4008 	ldmia.w	sp!, {r3, lr}
 8000a9c:	f7ff bfb8 	b.w	8000a10 <i2c_delay>

08000aa0 <i2c_0_init>:
 8000aa0:	b507      	push	{r0, r1, r2, lr}
 8000aa2:	f44f 3000 	mov.w	r0, #131072	; 0x20000
 8000aa6:	2101      	movs	r1, #1
 8000aa8:	f000 fafa 	bl	80010a0 <RCC_AHBPeriphClockCmd>
 8000aac:	2330      	movs	r3, #48	; 0x30
 8000aae:	9300      	str	r3, [sp, #0]
 8000ab0:	2301      	movs	r3, #1
 8000ab2:	2203      	movs	r2, #3
 8000ab4:	f04f 4090 	mov.w	r0, #1207959552	; 0x48000000
 8000ab8:	4669      	mov	r1, sp
 8000aba:	f88d 3004 	strb.w	r3, [sp, #4]
 8000abe:	f88d 3006 	strb.w	r3, [sp, #6]
 8000ac2:	2300      	movs	r3, #0
 8000ac4:	f88d 2005 	strb.w	r2, [sp, #5]
 8000ac8:	f88d 3007 	strb.w	r3, [sp, #7]
 8000acc:	f000 f83f 	bl	8000b4e <GPIO_Init>
 8000ad0:	f7ff ffdc 	bl	8000a8c <SetHighSCL>
 8000ad4:	f7ff ffa2 	bl	8000a1c <SetLowSDA>
 8000ad8:	f7ff ffbc 	bl	8000a54 <SetHighSDA>
 8000adc:	b003      	add	sp, #12
 8000ade:	f85d fb04 	ldr.w	pc, [sp], #4

08000ae2 <gpio_init>:
 8000ae2:	b507      	push	{r0, r1, r2, lr}
 8000ae4:	f44f 3000 	mov.w	r0, #131072	; 0x20000
 8000ae8:	2101      	movs	r1, #1
 8000aea:	f000 fad9 	bl	80010a0 <RCC_AHBPeriphClockCmd>
 8000aee:	f44f 2080 	mov.w	r0, #262144	; 0x40000
 8000af2:	2101      	movs	r1, #1
 8000af4:	f000 fad4 	bl	80010a0 <RCC_AHBPeriphClockCmd>
 8000af8:	f44f 2000 	mov.w	r0, #524288	; 0x80000
 8000afc:	2101      	movs	r1, #1
 8000afe:	f000 facf 	bl	80010a0 <RCC_AHBPeriphClockCmd>
 8000b02:	f44f 7380 	mov.w	r3, #256	; 0x100
 8000b06:	9300      	str	r3, [sp, #0]
 8000b08:	2301      	movs	r3, #1
 8000b0a:	f88d 3004 	strb.w	r3, [sp, #4]
 8000b0e:	2203      	movs	r2, #3
 8000b10:	2300      	movs	r3, #0
 8000b12:	f04f 4090 	mov.w	r0, #1207959552	; 0x48000000
 8000b16:	4669      	mov	r1, sp
 8000b18:	f88d 3006 	strb.w	r3, [sp, #6]
 8000b1c:	f88d 2005 	strb.w	r2, [sp, #5]
 8000b20:	f88d 3007 	strb.w	r3, [sp, #7]
 8000b24:	f000 f813 	bl	8000b4e <GPIO_Init>
 8000b28:	b003      	add	sp, #12
 8000b2a:	f85d fb04 	ldr.w	pc, [sp], #4

08000b2e <led_on>:
 8000b2e:	05c3      	lsls	r3, r0, #23
 8000b30:	d504      	bpl.n	8000b3c <led_on+0xe>
 8000b32:	f04f 4390 	mov.w	r3, #1207959552	; 0x48000000
 8000b36:	f44f 7280 	mov.w	r2, #256	; 0x100
 8000b3a:	619a      	str	r2, [r3, #24]
 8000b3c:	4770      	bx	lr

08000b3e <led_off>:
 8000b3e:	05c3      	lsls	r3, r0, #23
 8000b40:	d504      	bpl.n	8000b4c <led_off+0xe>
 8000b42:	f04f 4390 	mov.w	r3, #1207959552	; 0x48000000
 8000b46:	f44f 7280 	mov.w	r2, #256	; 0x100
 8000b4a:	851a      	strh	r2, [r3, #40]	; 0x28
 8000b4c:	4770      	bx	lr

08000b4e <GPIO_Init>:
 8000b4e:	b5f0      	push	{r4, r5, r6, r7, lr}
 8000b50:	bf00      	nop
 8000b52:	bf00      	nop
 8000b54:	bf00      	nop
 8000b56:	bf00      	nop
 8000b58:	2300      	movs	r3, #0
 8000b5a:	680e      	ldr	r6, [r1, #0]
 8000b5c:	461a      	mov	r2, r3
 8000b5e:	2501      	movs	r5, #1
 8000b60:	4095      	lsls	r5, r2
 8000b62:	ea05 0406 	and.w	r4, r5, r6
 8000b66:	42ac      	cmp	r4, r5
 8000b68:	d130      	bne.n	8000bcc <GPIO_Init+0x7e>
 8000b6a:	790d      	ldrb	r5, [r1, #4]
 8000b6c:	1e6f      	subs	r7, r5, #1
 8000b6e:	2f01      	cmp	r7, #1
 8000b70:	d81c      	bhi.n	8000bac <GPIO_Init+0x5e>
 8000b72:	bf00      	nop
 8000b74:	f04f 0c03 	mov.w	ip, #3
 8000b78:	6887      	ldr	r7, [r0, #8]
 8000b7a:	fa0c fc03 	lsl.w	ip, ip, r3
 8000b7e:	ea27 070c 	bic.w	r7, r7, ip
 8000b82:	6087      	str	r7, [r0, #8]
 8000b84:	f891 c005 	ldrb.w	ip, [r1, #5]
 8000b88:	6887      	ldr	r7, [r0, #8]
 8000b8a:	fa0c fc03 	lsl.w	ip, ip, r3
 8000b8e:	ea4c 0707 	orr.w	r7, ip, r7
 8000b92:	6087      	str	r7, [r0, #8]
 8000b94:	bf00      	nop
 8000b96:	8887      	ldrh	r7, [r0, #4]
 8000b98:	b2bf      	uxth	r7, r7
 8000b9a:	ea27 0404 	bic.w	r4, r7, r4
 8000b9e:	8084      	strh	r4, [r0, #4]
 8000ba0:	798c      	ldrb	r4, [r1, #6]
 8000ba2:	8887      	ldrh	r7, [r0, #4]
 8000ba4:	4094      	lsls	r4, r2
 8000ba6:	433c      	orrs	r4, r7
 8000ba8:	b2a4      	uxth	r4, r4
 8000baa:	8084      	strh	r4, [r0, #4]
 8000bac:	2403      	movs	r4, #3
 8000bae:	6807      	ldr	r7, [r0, #0]
 8000bb0:	409c      	lsls	r4, r3
 8000bb2:	43e4      	mvns	r4, r4
 8000bb4:	4027      	ands	r7, r4
 8000bb6:	6007      	str	r7, [r0, #0]
 8000bb8:	6807      	ldr	r7, [r0, #0]
 8000bba:	409d      	lsls	r5, r3
 8000bbc:	433d      	orrs	r5, r7
 8000bbe:	6005      	str	r5, [r0, #0]
 8000bc0:	68c5      	ldr	r5, [r0, #12]
 8000bc2:	402c      	ands	r4, r5
 8000bc4:	79cd      	ldrb	r5, [r1, #7]
 8000bc6:	409d      	lsls	r5, r3
 8000bc8:	432c      	orrs	r4, r5
 8000bca:	60c4      	str	r4, [r0, #12]
 8000bcc:	3201      	adds	r2, #1
 8000bce:	2a10      	cmp	r2, #16
 8000bd0:	f103 0302 	add.w	r3, r3, #2
 8000bd4:	d1c3      	bne.n	8000b5e <GPIO_Init+0x10>
 8000bd6:	bdf0      	pop	{r4, r5, r6, r7, pc}

08000bd8 <GPIO_SetBits>:
 8000bd8:	bf00      	nop
 8000bda:	bf00      	nop
 8000bdc:	6181      	str	r1, [r0, #24]
 8000bde:	4770      	bx	lr

08000be0 <GPIO_ResetBits>:
 8000be0:	bf00      	nop
 8000be2:	bf00      	nop
 8000be4:	8501      	strh	r1, [r0, #40]	; 0x28
 8000be6:	4770      	bx	lr

08000be8 <GPIO_PinAFConfig>:
 8000be8:	b510      	push	{r4, lr}
 8000bea:	bf00      	nop
 8000bec:	bf00      	nop
 8000bee:	bf00      	nop
 8000bf0:	f001 0307 	and.w	r3, r1, #7
 8000bf4:	08c9      	lsrs	r1, r1, #3
 8000bf6:	eb00 0081 	add.w	r0, r0, r1, lsl #2
 8000bfa:	009b      	lsls	r3, r3, #2
 8000bfc:	6a04      	ldr	r4, [r0, #32]
 8000bfe:	210f      	movs	r1, #15
 8000c00:	4099      	lsls	r1, r3
 8000c02:	ea24 0101 	bic.w	r1, r4, r1
 8000c06:	6201      	str	r1, [r0, #32]
 8000c08:	6a01      	ldr	r1, [r0, #32]
 8000c0a:	fa02 f303 	lsl.w	r3, r2, r3
 8000c0e:	430b      	orrs	r3, r1
 8000c10:	6203      	str	r3, [r0, #32]
 8000c12:	bd10      	pop	{r4, pc}

08000c14 <SystemInit>:
 8000c14:	4b39      	ldr	r3, [pc, #228]	; (8000cfc <SystemInit+0xe8>)
 8000c16:	f8d3 2088 	ldr.w	r2, [r3, #136]	; 0x88
 8000c1a:	f442 0270 	orr.w	r2, r2, #15728640	; 0xf00000
 8000c1e:	f8c3 2088 	str.w	r2, [r3, #136]	; 0x88
 8000c22:	4b37      	ldr	r3, [pc, #220]	; (8000d00 <SystemInit+0xec>)
 8000c24:	681a      	ldr	r2, [r3, #0]
 8000c26:	f042 0201 	orr.w	r2, r2, #1
 8000c2a:	601a      	str	r2, [r3, #0]
 8000c2c:	6859      	ldr	r1, [r3, #4]
 8000c2e:	4a35      	ldr	r2, [pc, #212]	; (8000d04 <SystemInit+0xf0>)
 8000c30:	400a      	ands	r2, r1
 8000c32:	605a      	str	r2, [r3, #4]
 8000c34:	681a      	ldr	r2, [r3, #0]
 8000c36:	f022 7284 	bic.w	r2, r2, #17301504	; 0x1080000
 8000c3a:	f422 3280 	bic.w	r2, r2, #65536	; 0x10000
 8000c3e:	601a      	str	r2, [r3, #0]
 8000c40:	681a      	ldr	r2, [r3, #0]
 8000c42:	f422 2280 	bic.w	r2, r2, #262144	; 0x40000
 8000c46:	601a      	str	r2, [r3, #0]
 8000c48:	685a      	ldr	r2, [r3, #4]
 8000c4a:	f422 02fe 	bic.w	r2, r2, #8323072	; 0x7f0000
 8000c4e:	605a      	str	r2, [r3, #4]
 8000c50:	6ada      	ldr	r2, [r3, #44]	; 0x2c
 8000c52:	f022 020f 	bic.w	r2, r2, #15
 8000c56:	62da      	str	r2, [r3, #44]	; 0x2c
 8000c58:	6b19      	ldr	r1, [r3, #48]	; 0x30
 8000c5a:	4a2b      	ldr	r2, [pc, #172]	; (8000d08 <SystemInit+0xf4>)
 8000c5c:	b082      	sub	sp, #8
 8000c5e:	400a      	ands	r2, r1
 8000c60:	631a      	str	r2, [r3, #48]	; 0x30
 8000c62:	2200      	movs	r2, #0
 8000c64:	609a      	str	r2, [r3, #8]
 8000c66:	9200      	str	r2, [sp, #0]
 8000c68:	9201      	str	r2, [sp, #4]
 8000c6a:	681a      	ldr	r2, [r3, #0]
 8000c6c:	f442 3280 	orr.w	r2, r2, #65536	; 0x10000
 8000c70:	601a      	str	r2, [r3, #0]
 8000c72:	681a      	ldr	r2, [r3, #0]
 8000c74:	f402 3200 	and.w	r2, r2, #131072	; 0x20000
 8000c78:	9201      	str	r2, [sp, #4]
 8000c7a:	9a00      	ldr	r2, [sp, #0]
 8000c7c:	3201      	adds	r2, #1
 8000c7e:	9200      	str	r2, [sp, #0]
 8000c80:	9a01      	ldr	r2, [sp, #4]
 8000c82:	b91a      	cbnz	r2, 8000c8c <SystemInit+0x78>
 8000c84:	9a00      	ldr	r2, [sp, #0]
 8000c86:	f5b2 4fa0 	cmp.w	r2, #20480	; 0x5000
 8000c8a:	d1f2      	bne.n	8000c72 <SystemInit+0x5e>
 8000c8c:	681a      	ldr	r2, [r3, #0]
 8000c8e:	f412 3200 	ands.w	r2, r2, #131072	; 0x20000
 8000c92:	bf18      	it	ne
 8000c94:	2201      	movne	r2, #1
 8000c96:	9201      	str	r2, [sp, #4]
 8000c98:	9a01      	ldr	r2, [sp, #4]
 8000c9a:	2a01      	cmp	r2, #1
 8000c9c:	d005      	beq.n	8000caa <SystemInit+0x96>
 8000c9e:	4b17      	ldr	r3, [pc, #92]	; (8000cfc <SystemInit+0xe8>)
 8000ca0:	f04f 6200 	mov.w	r2, #134217728	; 0x8000000
 8000ca4:	609a      	str	r2, [r3, #8]
 8000ca6:	b002      	add	sp, #8
 8000ca8:	4770      	bx	lr
 8000caa:	4a18      	ldr	r2, [pc, #96]	; (8000d0c <SystemInit+0xf8>)
 8000cac:	2112      	movs	r1, #18
 8000cae:	6011      	str	r1, [r2, #0]
 8000cb0:	685a      	ldr	r2, [r3, #4]
 8000cb2:	605a      	str	r2, [r3, #4]
 8000cb4:	685a      	ldr	r2, [r3, #4]
 8000cb6:	605a      	str	r2, [r3, #4]
 8000cb8:	685a      	ldr	r2, [r3, #4]
 8000cba:	f442 6280 	orr.w	r2, r2, #1024	; 0x400
 8000cbe:	605a      	str	r2, [r3, #4]
 8000cc0:	685a      	ldr	r2, [r3, #4]
 8000cc2:	f422 127c 	bic.w	r2, r2, #4128768	; 0x3f0000
 8000cc6:	605a      	str	r2, [r3, #4]
 8000cc8:	685a      	ldr	r2, [r3, #4]
 8000cca:	f442 12e8 	orr.w	r2, r2, #1900544	; 0x1d0000
 8000cce:	605a      	str	r2, [r3, #4]
 8000cd0:	681a      	ldr	r2, [r3, #0]
 8000cd2:	f042 7280 	orr.w	r2, r2, #16777216	; 0x1000000
 8000cd6:	601a      	str	r2, [r3, #0]
 8000cd8:	6819      	ldr	r1, [r3, #0]
 8000cda:	4a09      	ldr	r2, [pc, #36]	; (8000d00 <SystemInit+0xec>)
 8000cdc:	0189      	lsls	r1, r1, #6
 8000cde:	d5fb      	bpl.n	8000cd8 <SystemInit+0xc4>
 8000ce0:	6851      	ldr	r1, [r2, #4]
 8000ce2:	f021 0103 	bic.w	r1, r1, #3
 8000ce6:	6051      	str	r1, [r2, #4]
 8000ce8:	6851      	ldr	r1, [r2, #4]
 8000cea:	f041 0102 	orr.w	r1, r1, #2
 8000cee:	6051      	str	r1, [r2, #4]
 8000cf0:	685a      	ldr	r2, [r3, #4]
 8000cf2:	f002 020c 	and.w	r2, r2, #12
 8000cf6:	2a08      	cmp	r2, #8
 8000cf8:	d1fa      	bne.n	8000cf0 <SystemInit+0xdc>
 8000cfa:	e7d0      	b.n	8000c9e <SystemInit+0x8a>
 8000cfc:	e000ed00 	.word	0xe000ed00
 8000d00:	40021000 	.word	0x40021000
 8000d04:	f87fc00c 	.word	0xf87fc00c
 8000d08:	ff00fccc 	.word	0xff00fccc
 8000d0c:	40022000 	.word	0x40022000

08000d10 <sys_tick_init>:
 8000d10:	4b05      	ldr	r3, [pc, #20]	; (8000d28 <sys_tick_init+0x18>)
 8000d12:	4a06      	ldr	r2, [pc, #24]	; (8000d2c <sys_tick_init+0x1c>)
 8000d14:	605a      	str	r2, [r3, #4]
 8000d16:	4a06      	ldr	r2, [pc, #24]	; (8000d30 <sys_tick_init+0x20>)
 8000d18:	21f0      	movs	r1, #240	; 0xf0
 8000d1a:	f882 1023 	strb.w	r1, [r2, #35]	; 0x23
 8000d1e:	2200      	movs	r2, #0
 8000d20:	609a      	str	r2, [r3, #8]
 8000d22:	2207      	movs	r2, #7
 8000d24:	601a      	str	r2, [r3, #0]
 8000d26:	4770      	bx	lr
 8000d28:	e000e010 	.word	0xe000e010
 8000d2c:	00029040 	.word	0x00029040
 8000d30:	e000ed00 	.word	0xe000ed00

08000d34 <sleep>:
 8000d34:	bf30      	wfi
 8000d36:	4770      	bx	lr

08000d38 <sytem_clock_init>:
 8000d38:	f7ff bf6c 	b.w	8000c14 <SystemInit>

08000d3c <lib_low_level_init>:
 8000d3c:	b508      	push	{r3, lr}
 8000d3e:	f7ff fffb 	bl	8000d38 <sytem_clock_init>
 8000d42:	f7ff fece 	bl	8000ae2 <gpio_init>
 8000d46:	f000 fa07 	bl	8001158 <uart_init>
 8000d4a:	f000 fd69 	bl	8001820 <timer_init>
 8000d4e:	f000 fbef 	bl	8001530 <pwm_init>
 8000d52:	f000 fb6d 	bl	8001430 <drv8834_init>
 8000d56:	e8bd 4008 	ldmia.w	sp!, {r3, lr}
 8000d5a:	f7ff bea1 	b.w	8000aa0 <i2c_0_init>
	...

08000d60 <RCC_GetClocksFreq>:
 8000d60:	4aaf      	ldr	r2, [pc, #700]	; (8001020 <RCC_GetClocksFreq+0x2c0>)
 8000d62:	6851      	ldr	r1, [r2, #4]
 8000d64:	f001 010c 	and.w	r1, r1, #12
 8000d68:	2904      	cmp	r1, #4
 8000d6a:	e92d 43f0 	stmdb	sp!, {r4, r5, r6, r7, r8, r9, lr}
 8000d6e:	d005      	beq.n	8000d7c <RCC_GetClocksFreq+0x1c>
 8000d70:	2908      	cmp	r1, #8
 8000d72:	d006      	beq.n	8000d82 <RCC_GetClocksFreq+0x22>
 8000d74:	4bab      	ldr	r3, [pc, #684]	; (8001024 <RCC_GetClocksFreq+0x2c4>)
 8000d76:	6003      	str	r3, [r0, #0]
 8000d78:	b9b9      	cbnz	r1, 8000daa <RCC_GetClocksFreq+0x4a>
 8000d7a:	e017      	b.n	8000dac <RCC_GetClocksFreq+0x4c>
 8000d7c:	4ba9      	ldr	r3, [pc, #676]	; (8001024 <RCC_GetClocksFreq+0x2c4>)
 8000d7e:	6003      	str	r3, [r0, #0]
 8000d80:	e013      	b.n	8000daa <RCC_GetClocksFreq+0x4a>
 8000d82:	6853      	ldr	r3, [r2, #4]
 8000d84:	6854      	ldr	r4, [r2, #4]
 8000d86:	f3c3 4383 	ubfx	r3, r3, #18, #4
 8000d8a:	03e6      	lsls	r6, r4, #15
 8000d8c:	f103 0302 	add.w	r3, r3, #2
 8000d90:	d401      	bmi.n	8000d96 <RCC_GetClocksFreq+0x36>
 8000d92:	49a5      	ldr	r1, [pc, #660]	; (8001028 <RCC_GetClocksFreq+0x2c8>)
 8000d94:	e006      	b.n	8000da4 <RCC_GetClocksFreq+0x44>
 8000d96:	6ad1      	ldr	r1, [r2, #44]	; 0x2c
 8000d98:	4ca2      	ldr	r4, [pc, #648]	; (8001024 <RCC_GetClocksFreq+0x2c4>)
 8000d9a:	f001 010f 	and.w	r1, r1, #15
 8000d9e:	3101      	adds	r1, #1
 8000da0:	fbb4 f1f1 	udiv	r1, r4, r1
 8000da4:	4359      	muls	r1, r3
 8000da6:	6001      	str	r1, [r0, #0]
 8000da8:	e000      	b.n	8000dac <RCC_GetClocksFreq+0x4c>
 8000daa:	2100      	movs	r1, #0
 8000dac:	6853      	ldr	r3, [r2, #4]
 8000dae:	4e9f      	ldr	r6, [pc, #636]	; (800102c <RCC_GetClocksFreq+0x2cc>)
 8000db0:	f8df 827c 	ldr.w	r8, [pc, #636]	; 8001030 <RCC_GetClocksFreq+0x2d0>
 8000db4:	f3c3 1303 	ubfx	r3, r3, #4, #4
 8000db8:	5cf5      	ldrb	r5, [r6, r3]
 8000dba:	6803      	ldr	r3, [r0, #0]
 8000dbc:	b2ed      	uxtb	r5, r5
 8000dbe:	fa23 f405 	lsr.w	r4, r3, r5
 8000dc2:	6044      	str	r4, [r0, #4]
 8000dc4:	6857      	ldr	r7, [r2, #4]
 8000dc6:	f3c7 2702 	ubfx	r7, r7, #8, #3
 8000dca:	5df7      	ldrb	r7, [r6, r7]
 8000dcc:	fa24 f707 	lsr.w	r7, r4, r7
 8000dd0:	6087      	str	r7, [r0, #8]
 8000dd2:	f8d2 c004 	ldr.w	ip, [r2, #4]
 8000dd6:	f3cc 2cc2 	ubfx	ip, ip, #11, #3
 8000dda:	f816 600c 	ldrb.w	r6, [r6, ip]
 8000dde:	b2f6      	uxtb	r6, r6
 8000de0:	40f4      	lsrs	r4, r6
 8000de2:	60c4      	str	r4, [r0, #12]
 8000de4:	f8d2 902c 	ldr.w	r9, [r2, #44]	; 0x2c
 8000de8:	f3c9 1904 	ubfx	r9, r9, #4, #5
 8000dec:	f009 0c0f 	and.w	ip, r9, #15
 8000df0:	f019 0f10 	tst.w	r9, #16
 8000df4:	f838 c01c 	ldrh.w	ip, [r8, ip, lsl #1]
 8000df8:	46c1      	mov	r9, r8
 8000dfa:	fa1f fc8c 	uxth.w	ip, ip
 8000dfe:	d007      	beq.n	8000e10 <RCC_GetClocksFreq+0xb0>
 8000e00:	f1bc 0f00 	cmp.w	ip, #0
 8000e04:	d004      	beq.n	8000e10 <RCC_GetClocksFreq+0xb0>
 8000e06:	fbb1 fcfc 	udiv	ip, r1, ip
 8000e0a:	f8c0 c010 	str.w	ip, [r0, #16]
 8000e0e:	e000      	b.n	8000e12 <RCC_GetClocksFreq+0xb2>
 8000e10:	6103      	str	r3, [r0, #16]
 8000e12:	f8d2 802c 	ldr.w	r8, [r2, #44]	; 0x2c
 8000e16:	f3c8 2844 	ubfx	r8, r8, #9, #5
 8000e1a:	f008 0c0f 	and.w	ip, r8, #15
 8000e1e:	f018 0f10 	tst.w	r8, #16
 8000e22:	f839 c01c 	ldrh.w	ip, [r9, ip, lsl #1]
 8000e26:	fa1f fc8c 	uxth.w	ip, ip
 8000e2a:	d007      	beq.n	8000e3c <RCC_GetClocksFreq+0xdc>
 8000e2c:	f1bc 0f00 	cmp.w	ip, #0
 8000e30:	d004      	beq.n	8000e3c <RCC_GetClocksFreq+0xdc>
 8000e32:	fbb1 fcfc 	udiv	ip, r1, ip
 8000e36:	f8c0 c014 	str.w	ip, [r0, #20]
 8000e3a:	e000      	b.n	8000e3e <RCC_GetClocksFreq+0xde>
 8000e3c:	6143      	str	r3, [r0, #20]
 8000e3e:	f8d2 c030 	ldr.w	ip, [r2, #48]	; 0x30
 8000e42:	f01c 0f10 	tst.w	ip, #16
 8000e46:	bf06      	itte	eq
 8000e48:	f8df c1d8 	ldreq.w	ip, [pc, #472]	; 8001024 <RCC_GetClocksFreq+0x2c4>
 8000e4c:	f8c0 c018 	streq.w	ip, [r0, #24]
 8000e50:	6183      	strne	r3, [r0, #24]
 8000e52:	f8d2 c030 	ldr.w	ip, [r2, #48]	; 0x30
 8000e56:	f01c 0f20 	tst.w	ip, #32
 8000e5a:	bf06      	itte	eq
 8000e5c:	f8df c1c4 	ldreq.w	ip, [pc, #452]	; 8001024 <RCC_GetClocksFreq+0x2c4>
 8000e60:	f8c0 c01c 	streq.w	ip, [r0, #28]
 8000e64:	61c3      	strne	r3, [r0, #28]
 8000e66:	f8d2 c030 	ldr.w	ip, [r2, #48]	; 0x30
 8000e6a:	f01c 0f40 	tst.w	ip, #64	; 0x40
 8000e6e:	bf06      	itte	eq
 8000e70:	f8df c1b0 	ldreq.w	ip, [pc, #432]	; 8001024 <RCC_GetClocksFreq+0x2c4>
 8000e74:	f8c0 c020 	streq.w	ip, [r0, #32]
 8000e78:	6203      	strne	r3, [r0, #32]
 8000e7a:	f8d2 c030 	ldr.w	ip, [r2, #48]	; 0x30
 8000e7e:	f41c 7f80 	tst.w	ip, #256	; 0x100
 8000e82:	d008      	beq.n	8000e96 <RCC_GetClocksFreq+0x136>
 8000e84:	428b      	cmp	r3, r1
 8000e86:	d106      	bne.n	8000e96 <RCC_GetClocksFreq+0x136>
 8000e88:	42ae      	cmp	r6, r5
 8000e8a:	d104      	bne.n	8000e96 <RCC_GetClocksFreq+0x136>
 8000e8c:	ea4f 0c43 	mov.w	ip, r3, lsl #1
 8000e90:	f8c0 c024 	str.w	ip, [r0, #36]	; 0x24
 8000e94:	e000      	b.n	8000e98 <RCC_GetClocksFreq+0x138>
 8000e96:	6244      	str	r4, [r0, #36]	; 0x24
 8000e98:	f8d2 c030 	ldr.w	ip, [r2, #48]	; 0x30
 8000e9c:	f41c 5f80 	tst.w	ip, #4096	; 0x1000
 8000ea0:	d008      	beq.n	8000eb4 <RCC_GetClocksFreq+0x154>
 8000ea2:	428b      	cmp	r3, r1
 8000ea4:	d106      	bne.n	8000eb4 <RCC_GetClocksFreq+0x154>
 8000ea6:	42ae      	cmp	r6, r5
 8000ea8:	d104      	bne.n	8000eb4 <RCC_GetClocksFreq+0x154>
 8000eaa:	ea4f 0c43 	mov.w	ip, r3, lsl #1
 8000eae:	f8c0 c028 	str.w	ip, [r0, #40]	; 0x28
 8000eb2:	e000      	b.n	8000eb6 <RCC_GetClocksFreq+0x156>
 8000eb4:	6284      	str	r4, [r0, #40]	; 0x28
 8000eb6:	f8d2 c030 	ldr.w	ip, [r2, #48]	; 0x30
 8000eba:	f41c 7f00 	tst.w	ip, #512	; 0x200
 8000ebe:	d008      	beq.n	8000ed2 <RCC_GetClocksFreq+0x172>
 8000ec0:	428b      	cmp	r3, r1
 8000ec2:	d106      	bne.n	8000ed2 <RCC_GetClocksFreq+0x172>
 8000ec4:	42ae      	cmp	r6, r5
 8000ec6:	d104      	bne.n	8000ed2 <RCC_GetClocksFreq+0x172>
 8000ec8:	ea4f 0c43 	mov.w	ip, r3, lsl #1
 8000ecc:	f8c0 c02c 	str.w	ip, [r0, #44]	; 0x2c
 8000ed0:	e000      	b.n	8000ed4 <RCC_GetClocksFreq+0x174>
 8000ed2:	62c4      	str	r4, [r0, #44]	; 0x2c
 8000ed4:	f8d2 c030 	ldr.w	ip, [r2, #48]	; 0x30
 8000ed8:	f41c 6f80 	tst.w	ip, #1024	; 0x400
 8000edc:	d008      	beq.n	8000ef0 <RCC_GetClocksFreq+0x190>
 8000ede:	428b      	cmp	r3, r1
 8000ee0:	d106      	bne.n	8000ef0 <RCC_GetClocksFreq+0x190>
 8000ee2:	42ae      	cmp	r6, r5
 8000ee4:	d104      	bne.n	8000ef0 <RCC_GetClocksFreq+0x190>
 8000ee6:	ea4f 0c43 	mov.w	ip, r3, lsl #1
 8000eea:	f8c0 c04c 	str.w	ip, [r0, #76]	; 0x4c
 8000eee:	e000      	b.n	8000ef2 <RCC_GetClocksFreq+0x192>
 8000ef0:	64c4      	str	r4, [r0, #76]	; 0x4c
 8000ef2:	f8d2 c030 	ldr.w	ip, [r2, #48]	; 0x30
 8000ef6:	f41c 6f00 	tst.w	ip, #2048	; 0x800
 8000efa:	d008      	beq.n	8000f0e <RCC_GetClocksFreq+0x1ae>
 8000efc:	428b      	cmp	r3, r1
 8000efe:	d106      	bne.n	8000f0e <RCC_GetClocksFreq+0x1ae>
 8000f00:	42ae      	cmp	r6, r5
 8000f02:	d104      	bne.n	8000f0e <RCC_GetClocksFreq+0x1ae>
 8000f04:	ea4f 0c43 	mov.w	ip, r3, lsl #1
 8000f08:	f8c0 c050 	str.w	ip, [r0, #80]	; 0x50
 8000f0c:	e000      	b.n	8000f10 <RCC_GetClocksFreq+0x1b0>
 8000f0e:	6504      	str	r4, [r0, #80]	; 0x50
 8000f10:	f8d2 c030 	ldr.w	ip, [r2, #48]	; 0x30
 8000f14:	f41c 5f00 	tst.w	ip, #8192	; 0x2000
 8000f18:	d008      	beq.n	8000f2c <RCC_GetClocksFreq+0x1cc>
 8000f1a:	428b      	cmp	r3, r1
 8000f1c:	d106      	bne.n	8000f2c <RCC_GetClocksFreq+0x1cc>
 8000f1e:	42ae      	cmp	r6, r5
 8000f20:	d104      	bne.n	8000f2c <RCC_GetClocksFreq+0x1cc>
 8000f22:	ea4f 0c43 	mov.w	ip, r3, lsl #1
 8000f26:	f8c0 c054 	str.w	ip, [r0, #84]	; 0x54
 8000f2a:	e000      	b.n	8000f2e <RCC_GetClocksFreq+0x1ce>
 8000f2c:	6504      	str	r4, [r0, #80]	; 0x50
 8000f2e:	f8d2 c030 	ldr.w	ip, [r2, #48]	; 0x30
 8000f32:	f41c 4f00 	tst.w	ip, #32768	; 0x8000
 8000f36:	d006      	beq.n	8000f46 <RCC_GetClocksFreq+0x1e6>
 8000f38:	428b      	cmp	r3, r1
 8000f3a:	d104      	bne.n	8000f46 <RCC_GetClocksFreq+0x1e6>
 8000f3c:	42ae      	cmp	r6, r5
 8000f3e:	d102      	bne.n	8000f46 <RCC_GetClocksFreq+0x1e6>
 8000f40:	0059      	lsls	r1, r3, #1
 8000f42:	6581      	str	r1, [r0, #88]	; 0x58
 8000f44:	e000      	b.n	8000f48 <RCC_GetClocksFreq+0x1e8>
 8000f46:	6584      	str	r4, [r0, #88]	; 0x58
 8000f48:	6b15      	ldr	r5, [r2, #48]	; 0x30
 8000f4a:	4935      	ldr	r1, [pc, #212]	; (8001020 <RCC_GetClocksFreq+0x2c0>)
 8000f4c:	07ad      	lsls	r5, r5, #30
 8000f4e:	d101      	bne.n	8000f54 <RCC_GetClocksFreq+0x1f4>
 8000f50:	6384      	str	r4, [r0, #56]	; 0x38
 8000f52:	e015      	b.n	8000f80 <RCC_GetClocksFreq+0x220>
 8000f54:	6b0c      	ldr	r4, [r1, #48]	; 0x30
 8000f56:	f004 0403 	and.w	r4, r4, #3
 8000f5a:	2c01      	cmp	r4, #1
 8000f5c:	d101      	bne.n	8000f62 <RCC_GetClocksFreq+0x202>
 8000f5e:	6383      	str	r3, [r0, #56]	; 0x38
 8000f60:	e00e      	b.n	8000f80 <RCC_GetClocksFreq+0x220>
 8000f62:	6b0c      	ldr	r4, [r1, #48]	; 0x30
 8000f64:	f004 0403 	and.w	r4, r4, #3
 8000f68:	2c02      	cmp	r4, #2
 8000f6a:	d102      	bne.n	8000f72 <RCC_GetClocksFreq+0x212>
 8000f6c:	f44f 4100 	mov.w	r1, #32768	; 0x8000
 8000f70:	e005      	b.n	8000f7e <RCC_GetClocksFreq+0x21e>
 8000f72:	6b09      	ldr	r1, [r1, #48]	; 0x30
 8000f74:	f001 0103 	and.w	r1, r1, #3
 8000f78:	2903      	cmp	r1, #3
 8000f7a:	d101      	bne.n	8000f80 <RCC_GetClocksFreq+0x220>
 8000f7c:	4929      	ldr	r1, [pc, #164]	; (8001024 <RCC_GetClocksFreq+0x2c4>)
 8000f7e:	6381      	str	r1, [r0, #56]	; 0x38
 8000f80:	6b14      	ldr	r4, [r2, #48]	; 0x30
 8000f82:	4927      	ldr	r1, [pc, #156]	; (8001020 <RCC_GetClocksFreq+0x2c0>)
 8000f84:	f414 3f40 	tst.w	r4, #196608	; 0x30000
 8000f88:	d101      	bne.n	8000f8e <RCC_GetClocksFreq+0x22e>
 8000f8a:	63c7      	str	r7, [r0, #60]	; 0x3c
 8000f8c:	e018      	b.n	8000fc0 <RCC_GetClocksFreq+0x260>
 8000f8e:	6b0c      	ldr	r4, [r1, #48]	; 0x30
 8000f90:	f404 3440 	and.w	r4, r4, #196608	; 0x30000
 8000f94:	f5b4 3f80 	cmp.w	r4, #65536	; 0x10000
 8000f98:	d101      	bne.n	8000f9e <RCC_GetClocksFreq+0x23e>
 8000f9a:	63c3      	str	r3, [r0, #60]	; 0x3c
 8000f9c:	e010      	b.n	8000fc0 <RCC_GetClocksFreq+0x260>
 8000f9e:	6b0c      	ldr	r4, [r1, #48]	; 0x30
 8000fa0:	f404 3440 	and.w	r4, r4, #196608	; 0x30000
 8000fa4:	f5b4 3f00 	cmp.w	r4, #131072	; 0x20000
 8000fa8:	d102      	bne.n	8000fb0 <RCC_GetClocksFreq+0x250>
 8000faa:	f44f 4100 	mov.w	r1, #32768	; 0x8000
 8000fae:	e006      	b.n	8000fbe <RCC_GetClocksFreq+0x25e>
 8000fb0:	6b09      	ldr	r1, [r1, #48]	; 0x30
 8000fb2:	f401 3140 	and.w	r1, r1, #196608	; 0x30000
 8000fb6:	f5b1 3f40 	cmp.w	r1, #196608	; 0x30000
 8000fba:	d101      	bne.n	8000fc0 <RCC_GetClocksFreq+0x260>
 8000fbc:	4919      	ldr	r1, [pc, #100]	; (8001024 <RCC_GetClocksFreq+0x2c4>)
 8000fbe:	63c1      	str	r1, [r0, #60]	; 0x3c
 8000fc0:	6b14      	ldr	r4, [r2, #48]	; 0x30
 8000fc2:	4917      	ldr	r1, [pc, #92]	; (8001020 <RCC_GetClocksFreq+0x2c0>)
 8000fc4:	f414 2f40 	tst.w	r4, #786432	; 0xc0000
 8000fc8:	d101      	bne.n	8000fce <RCC_GetClocksFreq+0x26e>
 8000fca:	6407      	str	r7, [r0, #64]	; 0x40
 8000fcc:	e018      	b.n	8001000 <RCC_GetClocksFreq+0x2a0>
 8000fce:	6b0c      	ldr	r4, [r1, #48]	; 0x30
 8000fd0:	f404 2440 	and.w	r4, r4, #786432	; 0xc0000
 8000fd4:	f5b4 2f80 	cmp.w	r4, #262144	; 0x40000
 8000fd8:	d101      	bne.n	8000fde <RCC_GetClocksFreq+0x27e>
 8000fda:	6403      	str	r3, [r0, #64]	; 0x40
 8000fdc:	e010      	b.n	8001000 <RCC_GetClocksFreq+0x2a0>
 8000fde:	6b0c      	ldr	r4, [r1, #48]	; 0x30
 8000fe0:	f404 2440 	and.w	r4, r4, #786432	; 0xc0000
 8000fe4:	f5b4 2f00 	cmp.w	r4, #524288	; 0x80000
 8000fe8:	d102      	bne.n	8000ff0 <RCC_GetClocksFreq+0x290>
 8000fea:	f44f 4100 	mov.w	r1, #32768	; 0x8000
 8000fee:	e006      	b.n	8000ffe <RCC_GetClocksFreq+0x29e>
 8000ff0:	6b09      	ldr	r1, [r1, #48]	; 0x30
 8000ff2:	f401 2140 	and.w	r1, r1, #786432	; 0xc0000
 8000ff6:	f5b1 2f40 	cmp.w	r1, #786432	; 0xc0000
 8000ffa:	d101      	bne.n	8001000 <RCC_GetClocksFreq+0x2a0>
 8000ffc:	4909      	ldr	r1, [pc, #36]	; (8001024 <RCC_GetClocksFreq+0x2c4>)
 8000ffe:	6401      	str	r1, [r0, #64]	; 0x40
 8001000:	6b14      	ldr	r4, [r2, #48]	; 0x30
 8001002:	4907      	ldr	r1, [pc, #28]	; (8001020 <RCC_GetClocksFreq+0x2c0>)
 8001004:	f414 1f40 	tst.w	r4, #3145728	; 0x300000
 8001008:	d101      	bne.n	800100e <RCC_GetClocksFreq+0x2ae>
 800100a:	6447      	str	r7, [r0, #68]	; 0x44
 800100c:	e023      	b.n	8001056 <RCC_GetClocksFreq+0x2f6>
 800100e:	6b0c      	ldr	r4, [r1, #48]	; 0x30
 8001010:	f404 1440 	and.w	r4, r4, #3145728	; 0x300000
 8001014:	f5b4 1f80 	cmp.w	r4, #1048576	; 0x100000
 8001018:	d10c      	bne.n	8001034 <RCC_GetClocksFreq+0x2d4>
 800101a:	6443      	str	r3, [r0, #68]	; 0x44
 800101c:	e01b      	b.n	8001056 <RCC_GetClocksFreq+0x2f6>
 800101e:	bf00      	nop
 8001020:	40021000 	.word	0x40021000
 8001024:	007a1200 	.word	0x007a1200
 8001028:	003d0900 	.word	0x003d0900
 800102c:	20000024 	.word	0x20000024
 8001030:	20000004 	.word	0x20000004
 8001034:	6b0c      	ldr	r4, [r1, #48]	; 0x30
 8001036:	f404 1440 	and.w	r4, r4, #3145728	; 0x300000
 800103a:	f5b4 1f00 	cmp.w	r4, #2097152	; 0x200000
 800103e:	d102      	bne.n	8001046 <RCC_GetClocksFreq+0x2e6>
 8001040:	f44f 4100 	mov.w	r1, #32768	; 0x8000
 8001044:	e006      	b.n	8001054 <RCC_GetClocksFreq+0x2f4>
 8001046:	6b09      	ldr	r1, [r1, #48]	; 0x30
 8001048:	f401 1140 	and.w	r1, r1, #3145728	; 0x300000
 800104c:	f5b1 1f40 	cmp.w	r1, #3145728	; 0x300000
 8001050:	d101      	bne.n	8001056 <RCC_GetClocksFreq+0x2f6>
 8001052:	4911      	ldr	r1, [pc, #68]	; (8001098 <RCC_GetClocksFreq+0x338>)
 8001054:	6441      	str	r1, [r0, #68]	; 0x44
 8001056:	6b12      	ldr	r2, [r2, #48]	; 0x30
 8001058:	4910      	ldr	r1, [pc, #64]	; (800109c <RCC_GetClocksFreq+0x33c>)
 800105a:	f412 0f40 	tst.w	r2, #12582912	; 0xc00000
 800105e:	d102      	bne.n	8001066 <RCC_GetClocksFreq+0x306>
 8001060:	6487      	str	r7, [r0, #72]	; 0x48
 8001062:	e8bd 83f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, pc}
 8001066:	6b0a      	ldr	r2, [r1, #48]	; 0x30
 8001068:	f402 0240 	and.w	r2, r2, #12582912	; 0xc00000
 800106c:	f5b2 0f80 	cmp.w	r2, #4194304	; 0x400000
 8001070:	d00f      	beq.n	8001092 <RCC_GetClocksFreq+0x332>
 8001072:	6b0b      	ldr	r3, [r1, #48]	; 0x30
 8001074:	f403 0340 	and.w	r3, r3, #12582912	; 0xc00000
 8001078:	f5b3 0f00 	cmp.w	r3, #8388608	; 0x800000
 800107c:	d102      	bne.n	8001084 <RCC_GetClocksFreq+0x324>
 800107e:	f44f 4300 	mov.w	r3, #32768	; 0x8000
 8001082:	e006      	b.n	8001092 <RCC_GetClocksFreq+0x332>
 8001084:	6b0b      	ldr	r3, [r1, #48]	; 0x30
 8001086:	f403 0340 	and.w	r3, r3, #12582912	; 0xc00000
 800108a:	f5b3 0f40 	cmp.w	r3, #12582912	; 0xc00000
 800108e:	d101      	bne.n	8001094 <RCC_GetClocksFreq+0x334>
 8001090:	4b01      	ldr	r3, [pc, #4]	; (8001098 <RCC_GetClocksFreq+0x338>)
 8001092:	6483      	str	r3, [r0, #72]	; 0x48
 8001094:	e8bd 83f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, pc}
 8001098:	007a1200 	.word	0x007a1200
 800109c:	40021000 	.word	0x40021000

080010a0 <RCC_AHBPeriphClockCmd>:
 80010a0:	bf00      	nop
 80010a2:	bf00      	nop
 80010a4:	4b04      	ldr	r3, [pc, #16]	; (80010b8 <RCC_AHBPeriphClockCmd+0x18>)
 80010a6:	695a      	ldr	r2, [r3, #20]
 80010a8:	b109      	cbz	r1, 80010ae <RCC_AHBPeriphClockCmd+0xe>
 80010aa:	4310      	orrs	r0, r2
 80010ac:	e001      	b.n	80010b2 <RCC_AHBPeriphClockCmd+0x12>
 80010ae:	ea22 0000 	bic.w	r0, r2, r0
 80010b2:	6158      	str	r0, [r3, #20]
 80010b4:	4770      	bx	lr
 80010b6:	bf00      	nop
 80010b8:	40021000 	.word	0x40021000

080010bc <RCC_APB2PeriphClockCmd>:
 80010bc:	bf00      	nop
 80010be:	bf00      	nop
 80010c0:	4b04      	ldr	r3, [pc, #16]	; (80010d4 <RCC_APB2PeriphClockCmd+0x18>)
 80010c2:	699a      	ldr	r2, [r3, #24]
 80010c4:	b109      	cbz	r1, 80010ca <RCC_APB2PeriphClockCmd+0xe>
 80010c6:	4310      	orrs	r0, r2
 80010c8:	e001      	b.n	80010ce <RCC_APB2PeriphClockCmd+0x12>
 80010ca:	ea22 0000 	bic.w	r0, r2, r0
 80010ce:	6198      	str	r0, [r3, #24]
 80010d0:	4770      	bx	lr
 80010d2:	bf00      	nop
 80010d4:	40021000 	.word	0x40021000

080010d8 <RCC_APB1PeriphClockCmd>:
 80010d8:	bf00      	nop
 80010da:	bf00      	nop
 80010dc:	4b04      	ldr	r3, [pc, #16]	; (80010f0 <RCC_APB1PeriphClockCmd+0x18>)
 80010de:	69da      	ldr	r2, [r3, #28]
 80010e0:	b109      	cbz	r1, 80010e6 <RCC_APB1PeriphClockCmd+0xe>
 80010e2:	4310      	orrs	r0, r2
 80010e4:	e001      	b.n	80010ea <RCC_APB1PeriphClockCmd+0x12>
 80010e6:	ea22 0000 	bic.w	r0, r2, r0
 80010ea:	61d8      	str	r0, [r3, #28]
 80010ec:	4770      	bx	lr
 80010ee:	bf00      	nop
 80010f0:	40021000 	.word	0x40021000

080010f4 <uart_write>:
 80010f4:	4b03      	ldr	r3, [pc, #12]	; (8001104 <uart_write+0x10>)
 80010f6:	69da      	ldr	r2, [r3, #28]
 80010f8:	0612      	lsls	r2, r2, #24
 80010fa:	d401      	bmi.n	8001100 <uart_write+0xc>
 80010fc:	bf00      	nop
 80010fe:	e7f9      	b.n	80010f4 <uart_write>
 8001100:	8518      	strh	r0, [r3, #40]	; 0x28
 8001102:	4770      	bx	lr
 8001104:	40013800 	.word	0x40013800

08001108 <uart_is_char>:
 8001108:	4b0a      	ldr	r3, [pc, #40]	; (8001134 <uart_is_char+0x2c>)
 800110a:	4a0b      	ldr	r2, [pc, #44]	; (8001138 <uart_is_char+0x30>)
 800110c:	6819      	ldr	r1, [r3, #0]
 800110e:	6812      	ldr	r2, [r2, #0]
 8001110:	4291      	cmp	r1, r2
 8001112:	d00c      	beq.n	800112e <uart_is_char+0x26>
 8001114:	681a      	ldr	r2, [r3, #0]
 8001116:	4909      	ldr	r1, [pc, #36]	; (800113c <uart_is_char+0x34>)
 8001118:	5c88      	ldrb	r0, [r1, r2]
 800111a:	681a      	ldr	r2, [r3, #0]
 800111c:	3201      	adds	r2, #1
 800111e:	601a      	str	r2, [r3, #0]
 8001120:	681a      	ldr	r2, [r3, #0]
 8001122:	2a0f      	cmp	r2, #15
 8001124:	b2c0      	uxtb	r0, r0
 8001126:	d904      	bls.n	8001132 <uart_is_char+0x2a>
 8001128:	2200      	movs	r2, #0
 800112a:	601a      	str	r2, [r3, #0]
 800112c:	4770      	bx	lr
 800112e:	f64f 70ff 	movw	r0, #65535	; 0xffff
 8001132:	4770      	bx	lr
 8001134:	2000049c 	.word	0x2000049c
 8001138:	20000498 	.word	0x20000498
 800113c:	20000488 	.word	0x20000488

08001140 <uart_read>:
 8001140:	b508      	push	{r3, lr}
 8001142:	f7ff ffe1 	bl	8001108 <uart_is_char>
 8001146:	f64f 73ff 	movw	r3, #65535	; 0xffff
 800114a:	4298      	cmp	r0, r3
 800114c:	d101      	bne.n	8001152 <uart_read+0x12>
 800114e:	bf00      	nop
 8001150:	e7f7      	b.n	8001142 <uart_read+0x2>
 8001152:	b2c0      	uxtb	r0, r0
 8001154:	bd08      	pop	{r3, pc}
	...

08001158 <uart_init>:
 8001158:	b530      	push	{r4, r5, lr}
 800115a:	4b2c      	ldr	r3, [pc, #176]	; (800120c <uart_init+0xb4>)
 800115c:	4d2c      	ldr	r5, [pc, #176]	; (8001210 <uart_init+0xb8>)
 800115e:	2400      	movs	r4, #0
 8001160:	601c      	str	r4, [r3, #0]
 8001162:	4b2c      	ldr	r3, [pc, #176]	; (8001214 <uart_init+0xbc>)
 8001164:	b08b      	sub	sp, #44	; 0x2c
 8001166:	f44f 3000 	mov.w	r0, #131072	; 0x20000
 800116a:	2101      	movs	r1, #1
 800116c:	601c      	str	r4, [r3, #0]
 800116e:	f7ff ff97 	bl	80010a0 <RCC_AHBPeriphClockCmd>
 8001172:	f44f 4080 	mov.w	r0, #16384	; 0x4000
 8001176:	2101      	movs	r1, #1
 8001178:	f7ff ffa0 	bl	80010bc <RCC_APB2PeriphClockCmd>
 800117c:	f44f 63c0 	mov.w	r3, #1536	; 0x600
 8001180:	9302      	str	r3, [sp, #8]
 8001182:	2302      	movs	r3, #2
 8001184:	f88d 300c 	strb.w	r3, [sp, #12]
 8001188:	a902      	add	r1, sp, #8
 800118a:	2303      	movs	r3, #3
 800118c:	f04f 4090 	mov.w	r0, #1207959552	; 0x48000000
 8001190:	f88d 300d 	strb.w	r3, [sp, #13]
 8001194:	f88d 400e 	strb.w	r4, [sp, #14]
 8001198:	f88d 400f 	strb.w	r4, [sp, #15]
 800119c:	f7ff fcd7 	bl	8000b4e <GPIO_Init>
 80011a0:	f04f 4090 	mov.w	r0, #1207959552	; 0x48000000
 80011a4:	2109      	movs	r1, #9
 80011a6:	2207      	movs	r2, #7
 80011a8:	f7ff fd1e 	bl	8000be8 <GPIO_PinAFConfig>
 80011ac:	2207      	movs	r2, #7
 80011ae:	f04f 4090 	mov.w	r0, #1207959552	; 0x48000000
 80011b2:	210a      	movs	r1, #10
 80011b4:	f7ff fd18 	bl	8000be8 <GPIO_PinAFConfig>
 80011b8:	f44f 33e1 	mov.w	r3, #115200	; 0x1c200
 80011bc:	9304      	str	r3, [sp, #16]
 80011be:	4628      	mov	r0, r5
 80011c0:	230c      	movs	r3, #12
 80011c2:	a904      	add	r1, sp, #16
 80011c4:	9308      	str	r3, [sp, #32]
 80011c6:	9405      	str	r4, [sp, #20]
 80011c8:	9406      	str	r4, [sp, #24]
 80011ca:	9407      	str	r4, [sp, #28]
 80011cc:	9409      	str	r4, [sp, #36]	; 0x24
 80011ce:	f000 f849 	bl	8001264 <USART_Init>
 80011d2:	4628      	mov	r0, r5
 80011d4:	2101      	movs	r1, #1
 80011d6:	f000 f8a7 	bl	8001328 <USART_Cmd>
 80011da:	2201      	movs	r2, #1
 80011dc:	4628      	mov	r0, r5
 80011de:	490e      	ldr	r1, [pc, #56]	; (8001218 <uart_init+0xc0>)
 80011e0:	f000 f8b2 	bl	8001348 <USART_ITConfig>
 80011e4:	2325      	movs	r3, #37	; 0x25
 80011e6:	f88d 4005 	strb.w	r4, [sp, #5]
 80011ea:	f88d 4006 	strb.w	r4, [sp, #6]
 80011ee:	a801      	add	r0, sp, #4
 80011f0:	2401      	movs	r4, #1
 80011f2:	f88d 3004 	strb.w	r3, [sp, #4]
 80011f6:	f88d 4007 	strb.w	r4, [sp, #7]
 80011fa:	f000 f9e7 	bl	80015cc <NVIC_Init>
 80011fe:	4628      	mov	r0, r5
 8001200:	4621      	mov	r1, r4
 8001202:	f000 f891 	bl	8001328 <USART_Cmd>
 8001206:	b00b      	add	sp, #44	; 0x2c
 8001208:	bd30      	pop	{r4, r5, pc}
 800120a:	bf00      	nop
 800120c:	20000498 	.word	0x20000498
 8001210:	40013800 	.word	0x40013800
 8001214:	2000049c 	.word	0x2000049c
 8001218:	00050105 	.word	0x00050105

0800121c <USART1_IRQHandler>:
 800121c:	b508      	push	{r3, lr}
 800121e:	480d      	ldr	r0, [pc, #52]	; (8001254 <USART1_IRQHandler+0x38>)
 8001220:	490d      	ldr	r1, [pc, #52]	; (8001258 <USART1_IRQHandler+0x3c>)
 8001222:	f000 f8aa 	bl	800137a <USART_GetITStatus>
 8001226:	b178      	cbz	r0, 8001248 <USART1_IRQHandler+0x2c>
 8001228:	480a      	ldr	r0, [pc, #40]	; (8001254 <USART1_IRQHandler+0x38>)
 800122a:	f000 f888 	bl	800133e <USART_ReceiveData>
 800122e:	4b0b      	ldr	r3, [pc, #44]	; (800125c <USART1_IRQHandler+0x40>)
 8001230:	490b      	ldr	r1, [pc, #44]	; (8001260 <USART1_IRQHandler+0x44>)
 8001232:	681a      	ldr	r2, [r3, #0]
 8001234:	b2c0      	uxtb	r0, r0
 8001236:	5488      	strb	r0, [r1, r2]
 8001238:	681a      	ldr	r2, [r3, #0]
 800123a:	3201      	adds	r2, #1
 800123c:	601a      	str	r2, [r3, #0]
 800123e:	681a      	ldr	r2, [r3, #0]
 8001240:	2a0f      	cmp	r2, #15
 8001242:	bf84      	itt	hi
 8001244:	2200      	movhi	r2, #0
 8001246:	601a      	strhi	r2, [r3, #0]
 8001248:	4802      	ldr	r0, [pc, #8]	; (8001254 <USART1_IRQHandler+0x38>)
 800124a:	4903      	ldr	r1, [pc, #12]	; (8001258 <USART1_IRQHandler+0x3c>)
 800124c:	e8bd 4008 	ldmia.w	sp!, {r3, lr}
 8001250:	f000 b8b2 	b.w	80013b8 <USART_ClearITPendingBit>
 8001254:	40013800 	.word	0x40013800
 8001258:	00050105 	.word	0x00050105
 800125c:	20000498 	.word	0x20000498
 8001260:	20000488 	.word	0x20000488

08001264 <USART_Init>:
 8001264:	b530      	push	{r4, r5, lr}
 8001266:	4604      	mov	r4, r0
 8001268:	b099      	sub	sp, #100	; 0x64
 800126a:	460d      	mov	r5, r1
 800126c:	bf00      	nop
 800126e:	bf00      	nop
 8001270:	bf00      	nop
 8001272:	bf00      	nop
 8001274:	bf00      	nop
 8001276:	bf00      	nop
 8001278:	bf00      	nop
 800127a:	6803      	ldr	r3, [r0, #0]
 800127c:	f023 0301 	bic.w	r3, r3, #1
 8001280:	6003      	str	r3, [r0, #0]
 8001282:	6842      	ldr	r2, [r0, #4]
 8001284:	688b      	ldr	r3, [r1, #8]
 8001286:	68c9      	ldr	r1, [r1, #12]
 8001288:	f422 5240 	bic.w	r2, r2, #12288	; 0x3000
 800128c:	4313      	orrs	r3, r2
 800128e:	6043      	str	r3, [r0, #4]
 8001290:	686a      	ldr	r2, [r5, #4]
 8001292:	6803      	ldr	r3, [r0, #0]
 8001294:	4311      	orrs	r1, r2
 8001296:	692a      	ldr	r2, [r5, #16]
 8001298:	f423 53b0 	bic.w	r3, r3, #5632	; 0x1600
 800129c:	430a      	orrs	r2, r1
 800129e:	f023 030c 	bic.w	r3, r3, #12
 80012a2:	4313      	orrs	r3, r2
 80012a4:	6003      	str	r3, [r0, #0]
 80012a6:	6882      	ldr	r2, [r0, #8]
 80012a8:	696b      	ldr	r3, [r5, #20]
 80012aa:	f422 7240 	bic.w	r2, r2, #768	; 0x300
 80012ae:	4313      	orrs	r3, r2
 80012b0:	6083      	str	r3, [r0, #8]
 80012b2:	a801      	add	r0, sp, #4
 80012b4:	f7ff fd54 	bl	8000d60 <RCC_GetClocksFreq>
 80012b8:	4b17      	ldr	r3, [pc, #92]	; (8001318 <USART_Init+0xb4>)
 80012ba:	429c      	cmp	r4, r3
 80012bc:	d101      	bne.n	80012c2 <USART_Init+0x5e>
 80012be:	9a0f      	ldr	r2, [sp, #60]	; 0x3c
 80012c0:	e00e      	b.n	80012e0 <USART_Init+0x7c>
 80012c2:	4b16      	ldr	r3, [pc, #88]	; (800131c <USART_Init+0xb8>)
 80012c4:	429c      	cmp	r4, r3
 80012c6:	d101      	bne.n	80012cc <USART_Init+0x68>
 80012c8:	9a10      	ldr	r2, [sp, #64]	; 0x40
 80012ca:	e009      	b.n	80012e0 <USART_Init+0x7c>
 80012cc:	4b14      	ldr	r3, [pc, #80]	; (8001320 <USART_Init+0xbc>)
 80012ce:	429c      	cmp	r4, r3
 80012d0:	d101      	bne.n	80012d6 <USART_Init+0x72>
 80012d2:	9a11      	ldr	r2, [sp, #68]	; 0x44
 80012d4:	e004      	b.n	80012e0 <USART_Init+0x7c>
 80012d6:	4b13      	ldr	r3, [pc, #76]	; (8001324 <USART_Init+0xc0>)
 80012d8:	429c      	cmp	r4, r3
 80012da:	bf0c      	ite	eq
 80012dc:	9a12      	ldreq	r2, [sp, #72]	; 0x48
 80012de:	9a13      	ldrne	r2, [sp, #76]	; 0x4c
 80012e0:	6823      	ldr	r3, [r4, #0]
 80012e2:	6829      	ldr	r1, [r5, #0]
 80012e4:	f413 4f00 	tst.w	r3, #32768	; 0x8000
 80012e8:	bf18      	it	ne
 80012ea:	0052      	lslne	r2, r2, #1
 80012ec:	fbb2 f3f1 	udiv	r3, r2, r1
 80012f0:	fb01 2213 	mls	r2, r1, r3, r2
 80012f4:	ebb2 0f51 	cmp.w	r2, r1, lsr #1
 80012f8:	6822      	ldr	r2, [r4, #0]
 80012fa:	bf28      	it	cs
 80012fc:	3301      	addcs	r3, #1
 80012fe:	0412      	lsls	r2, r2, #16
 8001300:	d506      	bpl.n	8001310 <USART_Init+0xac>
 8001302:	f64f 72f0 	movw	r2, #65520	; 0xfff0
 8001306:	f3c3 0142 	ubfx	r1, r3, #1, #3
 800130a:	401a      	ands	r2, r3
 800130c:	ea41 0302 	orr.w	r3, r1, r2
 8001310:	b29b      	uxth	r3, r3
 8001312:	81a3      	strh	r3, [r4, #12]
 8001314:	b019      	add	sp, #100	; 0x64
 8001316:	bd30      	pop	{r4, r5, pc}
 8001318:	40013800 	.word	0x40013800
 800131c:	40004400 	.word	0x40004400
 8001320:	40004800 	.word	0x40004800
 8001324:	40004c00 	.word	0x40004c00

08001328 <USART_Cmd>:
 8001328:	bf00      	nop
 800132a:	bf00      	nop
 800132c:	6803      	ldr	r3, [r0, #0]
 800132e:	b111      	cbz	r1, 8001336 <USART_Cmd+0xe>
 8001330:	f043 0301 	orr.w	r3, r3, #1
 8001334:	e001      	b.n	800133a <USART_Cmd+0x12>
 8001336:	f023 0301 	bic.w	r3, r3, #1
 800133a:	6003      	str	r3, [r0, #0]
 800133c:	4770      	bx	lr

0800133e <USART_ReceiveData>:
 800133e:	bf00      	nop
 8001340:	8c80      	ldrh	r0, [r0, #36]	; 0x24
 8001342:	f3c0 0008 	ubfx	r0, r0, #0, #9
 8001346:	4770      	bx	lr

08001348 <USART_ITConfig>:
 8001348:	b510      	push	{r4, lr}
 800134a:	bf00      	nop
 800134c:	bf00      	nop
 800134e:	bf00      	nop
 8001350:	f3c1 2307 	ubfx	r3, r1, #8, #8
 8001354:	2401      	movs	r4, #1
 8001356:	b2c9      	uxtb	r1, r1
 8001358:	2b02      	cmp	r3, #2
 800135a:	fa04 f101 	lsl.w	r1, r4, r1
 800135e:	d101      	bne.n	8001364 <USART_ITConfig+0x1c>
 8001360:	3004      	adds	r0, #4
 8001362:	e002      	b.n	800136a <USART_ITConfig+0x22>
 8001364:	2b03      	cmp	r3, #3
 8001366:	bf08      	it	eq
 8001368:	3008      	addeq	r0, #8
 800136a:	6803      	ldr	r3, [r0, #0]
 800136c:	b10a      	cbz	r2, 8001372 <USART_ITConfig+0x2a>
 800136e:	4319      	orrs	r1, r3
 8001370:	e001      	b.n	8001376 <USART_ITConfig+0x2e>
 8001372:	ea23 0101 	bic.w	r1, r3, r1
 8001376:	6001      	str	r1, [r0, #0]
 8001378:	bd10      	pop	{r4, pc}

0800137a <USART_GetITStatus>:
 800137a:	b510      	push	{r4, lr}
 800137c:	bf00      	nop
 800137e:	bf00      	nop
 8001380:	2401      	movs	r4, #1
 8001382:	f3c1 2207 	ubfx	r2, r1, #8, #8
 8001386:	b2cb      	uxtb	r3, r1
 8001388:	42a2      	cmp	r2, r4
 800138a:	fa04 f303 	lsl.w	r3, r4, r3
 800138e:	d101      	bne.n	8001394 <USART_GetITStatus+0x1a>
 8001390:	6802      	ldr	r2, [r0, #0]
 8001392:	e003      	b.n	800139c <USART_GetITStatus+0x22>
 8001394:	2a02      	cmp	r2, #2
 8001396:	bf0c      	ite	eq
 8001398:	6842      	ldreq	r2, [r0, #4]
 800139a:	6882      	ldrne	r2, [r0, #8]
 800139c:	4013      	ands	r3, r2
 800139e:	69c2      	ldr	r2, [r0, #28]
 80013a0:	b143      	cbz	r3, 80013b4 <USART_GetITStatus+0x3a>
 80013a2:	2301      	movs	r3, #1
 80013a4:	0c09      	lsrs	r1, r1, #16
 80013a6:	fa03 f101 	lsl.w	r1, r3, r1
 80013aa:	4211      	tst	r1, r2
 80013ac:	bf0c      	ite	eq
 80013ae:	2000      	moveq	r0, #0
 80013b0:	2001      	movne	r0, #1
 80013b2:	bd10      	pop	{r4, pc}
 80013b4:	4618      	mov	r0, r3
 80013b6:	bd10      	pop	{r4, pc}

080013b8 <USART_ClearITPendingBit>:
 80013b8:	bf00      	nop
 80013ba:	bf00      	nop
 80013bc:	2301      	movs	r3, #1
 80013be:	0c09      	lsrs	r1, r1, #16
 80013c0:	fa03 f101 	lsl.w	r1, r3, r1
 80013c4:	6201      	str	r1, [r0, #32]
 80013c6:	4770      	bx	lr

080013c8 <drv8834_run>:
 80013c8:	1e02      	subs	r2, r0, #0
 80013ca:	4b18      	ldr	r3, [pc, #96]	; (800142c <drv8834_run+0x64>)
 80013cc:	dd09      	ble.n	80013e2 <drv8834_run+0x1a>
 80013ce:	6998      	ldr	r0, [r3, #24]
 80013d0:	f040 0008 	orr.w	r0, r0, #8
 80013d4:	6198      	str	r0, [r3, #24]
 80013d6:	f04f 4390 	mov.w	r3, #1207959552	; 0x48000000
 80013da:	f44f 4000 	mov.w	r0, #32768	; 0x8000
 80013de:	6198      	str	r0, [r3, #24]
 80013e0:	e00b      	b.n	80013fa <drv8834_run+0x32>
 80013e2:	8d18      	ldrh	r0, [r3, #40]	; 0x28
 80013e4:	b280      	uxth	r0, r0
 80013e6:	f040 0008 	orr.w	r0, r0, #8
 80013ea:	8518      	strh	r0, [r3, #40]	; 0x28
 80013ec:	f04f 4390 	mov.w	r3, #1207959552	; 0x48000000
 80013f0:	f44f 4000 	mov.w	r0, #32768	; 0x8000
 80013f4:	4252      	negs	r2, r2
 80013f6:	8518      	strh	r0, [r3, #40]	; 0x28
 80013f8:	b212      	sxth	r2, r2
 80013fa:	2900      	cmp	r1, #0
 80013fc:	4b0b      	ldr	r3, [pc, #44]	; (800142c <drv8834_run+0x64>)
 80013fe:	dd05      	ble.n	800140c <drv8834_run+0x44>
 8001400:	8d18      	ldrh	r0, [r3, #40]	; 0x28
 8001402:	b280      	uxth	r0, r0
 8001404:	f040 0020 	orr.w	r0, r0, #32
 8001408:	8518      	strh	r0, [r3, #40]	; 0x28
 800140a:	e005      	b.n	8001418 <drv8834_run+0x50>
 800140c:	6998      	ldr	r0, [r3, #24]
 800140e:	4249      	negs	r1, r1
 8001410:	f040 0020 	orr.w	r0, r0, #32
 8001414:	6198      	str	r0, [r3, #24]
 8001416:	b209      	sxth	r1, r1
 8001418:	2964      	cmp	r1, #100	; 0x64
 800141a:	bfb4      	ite	lt
 800141c:	4608      	movlt	r0, r1
 800141e:	2064      	movge	r0, #100	; 0x64
 8001420:	2a64      	cmp	r2, #100	; 0x64
 8001422:	bfb4      	ite	lt
 8001424:	4611      	movlt	r1, r2
 8001426:	2164      	movge	r1, #100	; 0x64
 8001428:	f000 b844 	b.w	80014b4 <pwm_set>
 800142c:	48000400 	.word	0x48000400

08001430 <drv8834_init>:
 8001430:	b5f7      	push	{r0, r1, r2, r4, r5, r6, r7, lr}
 8001432:	4d1f      	ldr	r5, [pc, #124]	; (80014b0 <drv8834_init+0x80>)
 8001434:	2400      	movs	r4, #0
 8001436:	2603      	movs	r6, #3
 8001438:	2338      	movs	r3, #56	; 0x38
 800143a:	2701      	movs	r7, #1
 800143c:	4628      	mov	r0, r5
 800143e:	4669      	mov	r1, sp
 8001440:	9300      	str	r3, [sp, #0]
 8001442:	f88d 7004 	strb.w	r7, [sp, #4]
 8001446:	f88d 4006 	strb.w	r4, [sp, #6]
 800144a:	f88d 6005 	strb.w	r6, [sp, #5]
 800144e:	f88d 4007 	strb.w	r4, [sp, #7]
 8001452:	f7ff fb7c 	bl	8000b4e <GPIO_Init>
 8001456:	2308      	movs	r3, #8
 8001458:	9300      	str	r3, [sp, #0]
 800145a:	4628      	mov	r0, r5
 800145c:	2302      	movs	r3, #2
 800145e:	4669      	mov	r1, sp
 8001460:	f88d 3004 	strb.w	r3, [sp, #4]
 8001464:	f88d 4006 	strb.w	r4, [sp, #6]
 8001468:	f88d 6005 	strb.w	r6, [sp, #5]
 800146c:	f88d 4007 	strb.w	r4, [sp, #7]
 8001470:	f7ff fb6d 	bl	8000b4e <GPIO_Init>
 8001474:	220f      	movs	r2, #15
 8001476:	4628      	mov	r0, r5
 8001478:	4631      	mov	r1, r6
 800147a:	f7ff fbb5 	bl	8000be8 <GPIO_PinAFConfig>
 800147e:	f44f 4300 	mov.w	r3, #32768	; 0x8000
 8001482:	4669      	mov	r1, sp
 8001484:	f04f 4090 	mov.w	r0, #1207959552	; 0x48000000
 8001488:	9300      	str	r3, [sp, #0]
 800148a:	f88d 7004 	strb.w	r7, [sp, #4]
 800148e:	f88d 4006 	strb.w	r4, [sp, #6]
 8001492:	f88d 6005 	strb.w	r6, [sp, #5]
 8001496:	f88d 4007 	strb.w	r4, [sp, #7]
 800149a:	f7ff fb58 	bl	8000b4e <GPIO_Init>
 800149e:	2310      	movs	r3, #16
 80014a0:	852b      	strh	r3, [r5, #40]	; 0x28
 80014a2:	4620      	mov	r0, r4
 80014a4:	4621      	mov	r1, r4
 80014a6:	f7ff ff8f 	bl	80013c8 <drv8834_run>
 80014aa:	b003      	add	sp, #12
 80014ac:	bdf0      	pop	{r4, r5, r6, r7, pc}
 80014ae:	bf00      	nop
 80014b0:	48000400 	.word	0x48000400

080014b4 <pwm_set>:
 80014b4:	e92d 41f0 	stmdb	sp!, {r4, r5, r6, r7, r8, lr}
 80014b8:	b086      	sub	sp, #24
 80014ba:	2370      	movs	r3, #112	; 0x70
 80014bc:	9301      	str	r3, [sp, #4]
 80014be:	2301      	movs	r3, #1
 80014c0:	f8ad 3008 	strh.w	r3, [sp, #8]
 80014c4:	2304      	movs	r3, #4
 80014c6:	f8ad 300a 	strh.w	r3, [sp, #10]
 80014ca:	4f17      	ldr	r7, [pc, #92]	; (8001528 <pwm_set+0x74>)
 80014cc:	4c17      	ldr	r4, [pc, #92]	; (800152c <pwm_set+0x78>)
 80014ce:	2302      	movs	r3, #2
 80014d0:	f8ad 3010 	strh.w	r3, [sp, #16]
 80014d4:	2300      	movs	r3, #0
 80014d6:	f8ad 3012 	strh.w	r3, [sp, #18]
 80014da:	f8ad 3016 	strh.w	r3, [sp, #22]
 80014de:	683b      	ldr	r3, [r7, #0]
 80014e0:	f242 7610 	movw	r6, #10000	; 0x2710
 80014e4:	fbb3 f3f6 	udiv	r3, r3, r6
 80014e8:	3b02      	subs	r3, #2
 80014ea:	4358      	muls	r0, r3
 80014ec:	2564      	movs	r5, #100	; 0x64
 80014ee:	fbb0 f3f5 	udiv	r3, r0, r5
 80014f2:	f44f 7280 	mov.w	r2, #256	; 0x100
 80014f6:	4620      	mov	r0, r4
 80014f8:	4688      	mov	r8, r1
 80014fa:	a901      	add	r1, sp, #4
 80014fc:	f8ad 2014 	strh.w	r2, [sp, #20]
 8001500:	9303      	str	r3, [sp, #12]
 8001502:	f000 f8f9 	bl	80016f8 <TIM_OC1Init>
 8001506:	683b      	ldr	r3, [r7, #0]
 8001508:	fbb3 f6f6 	udiv	r6, r3, r6
 800150c:	3e02      	subs	r6, #2
 800150e:	fb06 f808 	mul.w	r8, r6, r8
 8001512:	fbb8 f5f5 	udiv	r5, r8, r5
 8001516:	4620      	mov	r0, r4
 8001518:	a901      	add	r1, sp, #4
 800151a:	9503      	str	r5, [sp, #12]
 800151c:	f000 f932 	bl	8001784 <TIM_OC2Init>
 8001520:	b006      	add	sp, #24
 8001522:	e8bd 81f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, pc}
 8001526:	bf00      	nop
 8001528:	20000000 	.word	0x20000000
 800152c:	40012c00 	.word	0x40012c00

08001530 <pwm_init>:
 8001530:	b530      	push	{r4, r5, lr}
 8001532:	f44f 6000 	mov.w	r0, #2048	; 0x800
 8001536:	b087      	sub	sp, #28
 8001538:	2101      	movs	r1, #1
 800153a:	f7ff fdbf 	bl	80010bc <RCC_APB2PeriphClockCmd>
 800153e:	f44f 2080 	mov.w	r0, #262144	; 0x40000
 8001542:	2101      	movs	r1, #1
 8001544:	f7ff fdac 	bl	80010a0 <RCC_AHBPeriphClockCmd>
 8001548:	4c1d      	ldr	r4, [pc, #116]	; (80015c0 <pwm_init+0x90>)
 800154a:	4d1e      	ldr	r5, [pc, #120]	; (80015c4 <pwm_init+0x94>)
 800154c:	f44f 43c0 	mov.w	r3, #24576	; 0x6000
 8001550:	9301      	str	r3, [sp, #4]
 8001552:	2302      	movs	r3, #2
 8001554:	f88d 3008 	strb.w	r3, [sp, #8]
 8001558:	4620      	mov	r0, r4
 800155a:	2303      	movs	r3, #3
 800155c:	a901      	add	r1, sp, #4
 800155e:	f88d 3009 	strb.w	r3, [sp, #9]
 8001562:	f7ff faf4 	bl	8000b4e <GPIO_Init>
 8001566:	4620      	mov	r0, r4
 8001568:	210d      	movs	r1, #13
 800156a:	2206      	movs	r2, #6
 800156c:	f7ff fb3c 	bl	8000be8 <GPIO_PinAFConfig>
 8001570:	4620      	mov	r0, r4
 8001572:	210e      	movs	r1, #14
 8001574:	2206      	movs	r2, #6
 8001576:	f7ff fb37 	bl	8000be8 <GPIO_PinAFConfig>
 800157a:	4b13      	ldr	r3, [pc, #76]	; (80015c8 <pwm_init+0x98>)
 800157c:	681a      	ldr	r2, [r3, #0]
 800157e:	f242 7310 	movw	r3, #10000	; 0x2710
 8001582:	fbb2 f3f3 	udiv	r3, r2, r3
 8001586:	2400      	movs	r4, #0
 8001588:	3b01      	subs	r3, #1
 800158a:	4628      	mov	r0, r5
 800158c:	a903      	add	r1, sp, #12
 800158e:	9304      	str	r3, [sp, #16]
 8001590:	f8ad 400c 	strh.w	r4, [sp, #12]
 8001594:	f8ad 400e 	strh.w	r4, [sp, #14]
 8001598:	f8ad 4014 	strh.w	r4, [sp, #20]
 800159c:	f8ad 4016 	strh.w	r4, [sp, #22]
 80015a0:	f000 f84c 	bl	800163c <TIM_TimeBaseInit>
 80015a4:	4620      	mov	r0, r4
 80015a6:	4621      	mov	r1, r4
 80015a8:	f7ff ff84 	bl	80014b4 <pwm_set>
 80015ac:	4628      	mov	r0, r5
 80015ae:	2101      	movs	r1, #1
 80015b0:	f000 f894 	bl	80016dc <TIM_Cmd>
 80015b4:	4628      	mov	r0, r5
 80015b6:	2101      	movs	r1, #1
 80015b8:	f000 f922 	bl	8001800 <TIM_CtrlPWMOutputs>
 80015bc:	b007      	add	sp, #28
 80015be:	bd30      	pop	{r4, r5, pc}
 80015c0:	48000400 	.word	0x48000400
 80015c4:	40012c00 	.word	0x40012c00
 80015c8:	20000000 	.word	0x20000000

080015cc <NVIC_Init>:
 80015cc:	b510      	push	{r4, lr}
 80015ce:	bf00      	nop
 80015d0:	bf00      	nop
 80015d2:	bf00      	nop
 80015d4:	78c2      	ldrb	r2, [r0, #3]
 80015d6:	7803      	ldrb	r3, [r0, #0]
 80015d8:	b30a      	cbz	r2, 800161e <NVIC_Init+0x52>
 80015da:	4a16      	ldr	r2, [pc, #88]	; (8001634 <NVIC_Init+0x68>)
 80015dc:	7844      	ldrb	r4, [r0, #1]
 80015de:	68d2      	ldr	r2, [r2, #12]
 80015e0:	43d2      	mvns	r2, r2
 80015e2:	f3c2 2202 	ubfx	r2, r2, #8, #3
 80015e6:	f1c2 0104 	rsb	r1, r2, #4
 80015ea:	b2c9      	uxtb	r1, r1
 80015ec:	fa04 f101 	lsl.w	r1, r4, r1
 80015f0:	240f      	movs	r4, #15
 80015f2:	fa44 f202 	asr.w	r2, r4, r2
 80015f6:	7884      	ldrb	r4, [r0, #2]
 80015f8:	b2c9      	uxtb	r1, r1
 80015fa:	4022      	ands	r2, r4
 80015fc:	430a      	orrs	r2, r1
 80015fe:	f103 4360 	add.w	r3, r3, #3758096384	; 0xe0000000
 8001602:	f503 4361 	add.w	r3, r3, #57600	; 0xe100
 8001606:	0112      	lsls	r2, r2, #4
 8001608:	b2d2      	uxtb	r2, r2
 800160a:	f883 2300 	strb.w	r2, [r3, #768]	; 0x300
 800160e:	7803      	ldrb	r3, [r0, #0]
 8001610:	2201      	movs	r2, #1
 8001612:	0959      	lsrs	r1, r3, #5
 8001614:	f003 031f 	and.w	r3, r3, #31
 8001618:	fa02 f303 	lsl.w	r3, r2, r3
 800161c:	e006      	b.n	800162c <NVIC_Init+0x60>
 800161e:	0959      	lsrs	r1, r3, #5
 8001620:	2201      	movs	r2, #1
 8001622:	f003 031f 	and.w	r3, r3, #31
 8001626:	fa02 f303 	lsl.w	r3, r2, r3
 800162a:	3120      	adds	r1, #32
 800162c:	4a02      	ldr	r2, [pc, #8]	; (8001638 <NVIC_Init+0x6c>)
 800162e:	f842 3021 	str.w	r3, [r2, r1, lsl #2]
 8001632:	bd10      	pop	{r4, pc}
 8001634:	e000ed00 	.word	0xe000ed00
 8001638:	e000e100 	.word	0xe000e100

0800163c <TIM_TimeBaseInit>:
 800163c:	bf00      	nop
 800163e:	bf00      	nop
 8001640:	bf00      	nop
 8001642:	4a24      	ldr	r2, [pc, #144]	; (80016d4 <TIM_TimeBaseInit+0x98>)
 8001644:	8803      	ldrh	r3, [r0, #0]
 8001646:	4290      	cmp	r0, r2
 8001648:	b29b      	uxth	r3, r3
 800164a:	d012      	beq.n	8001672 <TIM_TimeBaseInit+0x36>
 800164c:	f502 6200 	add.w	r2, r2, #2048	; 0x800
 8001650:	4290      	cmp	r0, r2
 8001652:	d00e      	beq.n	8001672 <TIM_TimeBaseInit+0x36>
 8001654:	f1b0 4f80 	cmp.w	r0, #1073741824	; 0x40000000
 8001658:	d00b      	beq.n	8001672 <TIM_TimeBaseInit+0x36>
 800165a:	f5a2 3298 	sub.w	r2, r2, #77824	; 0x13000
 800165e:	4290      	cmp	r0, r2
 8001660:	d007      	beq.n	8001672 <TIM_TimeBaseInit+0x36>
 8001662:	f502 6280 	add.w	r2, r2, #1024	; 0x400
 8001666:	4290      	cmp	r0, r2
 8001668:	d003      	beq.n	8001672 <TIM_TimeBaseInit+0x36>
 800166a:	f502 32a4 	add.w	r2, r2, #83968	; 0x14800
 800166e:	4290      	cmp	r0, r2
 8001670:	d103      	bne.n	800167a <TIM_TimeBaseInit+0x3e>
 8001672:	884a      	ldrh	r2, [r1, #2]
 8001674:	f023 0370 	bic.w	r3, r3, #112	; 0x70
 8001678:	4313      	orrs	r3, r2
 800167a:	4a17      	ldr	r2, [pc, #92]	; (80016d8 <TIM_TimeBaseInit+0x9c>)
 800167c:	4290      	cmp	r0, r2
 800167e:	d008      	beq.n	8001692 <TIM_TimeBaseInit+0x56>
 8001680:	f502 6280 	add.w	r2, r2, #1024	; 0x400
 8001684:	4290      	cmp	r0, r2
 8001686:	d004      	beq.n	8001692 <TIM_TimeBaseInit+0x56>
 8001688:	f423 7340 	bic.w	r3, r3, #768	; 0x300
 800168c:	890a      	ldrh	r2, [r1, #8]
 800168e:	b29b      	uxth	r3, r3
 8001690:	4313      	orrs	r3, r2
 8001692:	8003      	strh	r3, [r0, #0]
 8001694:	684b      	ldr	r3, [r1, #4]
 8001696:	62c3      	str	r3, [r0, #44]	; 0x2c
 8001698:	880b      	ldrh	r3, [r1, #0]
 800169a:	8503      	strh	r3, [r0, #40]	; 0x28
 800169c:	4b0d      	ldr	r3, [pc, #52]	; (80016d4 <TIM_TimeBaseInit+0x98>)
 800169e:	4298      	cmp	r0, r3
 80016a0:	d013      	beq.n	80016ca <TIM_TimeBaseInit+0x8e>
 80016a2:	f503 6300 	add.w	r3, r3, #2048	; 0x800
 80016a6:	4298      	cmp	r0, r3
 80016a8:	d00f      	beq.n	80016ca <TIM_TimeBaseInit+0x8e>
 80016aa:	f503 6340 	add.w	r3, r3, #3072	; 0xc00
 80016ae:	4298      	cmp	r0, r3
 80016b0:	d00b      	beq.n	80016ca <TIM_TimeBaseInit+0x8e>
 80016b2:	f503 6380 	add.w	r3, r3, #1024	; 0x400
 80016b6:	4298      	cmp	r0, r3
 80016b8:	d007      	beq.n	80016ca <TIM_TimeBaseInit+0x8e>
 80016ba:	f503 6380 	add.w	r3, r3, #1024	; 0x400
 80016be:	4298      	cmp	r0, r3
 80016c0:	d003      	beq.n	80016ca <TIM_TimeBaseInit+0x8e>
 80016c2:	f503 6300 	add.w	r3, r3, #2048	; 0x800
 80016c6:	4298      	cmp	r0, r3
 80016c8:	d101      	bne.n	80016ce <TIM_TimeBaseInit+0x92>
 80016ca:	894b      	ldrh	r3, [r1, #10]
 80016cc:	8603      	strh	r3, [r0, #48]	; 0x30
 80016ce:	2301      	movs	r3, #1
 80016d0:	6143      	str	r3, [r0, #20]
 80016d2:	4770      	bx	lr
 80016d4:	40012c00 	.word	0x40012c00
 80016d8:	40001000 	.word	0x40001000

080016dc <TIM_Cmd>:
 80016dc:	bf00      	nop
 80016de:	bf00      	nop
 80016e0:	8803      	ldrh	r3, [r0, #0]
 80016e2:	b119      	cbz	r1, 80016ec <TIM_Cmd+0x10>
 80016e4:	b29b      	uxth	r3, r3
 80016e6:	f043 0301 	orr.w	r3, r3, #1
 80016ea:	e003      	b.n	80016f4 <TIM_Cmd+0x18>
 80016ec:	f023 0301 	bic.w	r3, r3, #1
 80016f0:	041b      	lsls	r3, r3, #16
 80016f2:	0c1b      	lsrs	r3, r3, #16
 80016f4:	8003      	strh	r3, [r0, #0]
 80016f6:	4770      	bx	lr

080016f8 <TIM_OC1Init>:
 80016f8:	b530      	push	{r4, r5, lr}
 80016fa:	bf00      	nop
 80016fc:	bf00      	nop
 80016fe:	bf00      	nop
 8001700:	bf00      	nop
 8001702:	6a03      	ldr	r3, [r0, #32]
 8001704:	680d      	ldr	r5, [r1, #0]
 8001706:	f023 0301 	bic.w	r3, r3, #1
 800170a:	6203      	str	r3, [r0, #32]
 800170c:	6a03      	ldr	r3, [r0, #32]
 800170e:	6842      	ldr	r2, [r0, #4]
 8001710:	6984      	ldr	r4, [r0, #24]
 8001712:	f424 3480 	bic.w	r4, r4, #65536	; 0x10000
 8001716:	f024 0473 	bic.w	r4, r4, #115	; 0x73
 800171a:	432c      	orrs	r4, r5
 800171c:	898d      	ldrh	r5, [r1, #12]
 800171e:	f023 0302 	bic.w	r3, r3, #2
 8001722:	432b      	orrs	r3, r5
 8001724:	888d      	ldrh	r5, [r1, #4]
 8001726:	432b      	orrs	r3, r5
 8001728:	4d15      	ldr	r5, [pc, #84]	; (8001780 <TIM_OC1Init+0x88>)
 800172a:	42a8      	cmp	r0, r5
 800172c:	d00f      	beq.n	800174e <TIM_OC1Init+0x56>
 800172e:	f505 6500 	add.w	r5, r5, #2048	; 0x800
 8001732:	42a8      	cmp	r0, r5
 8001734:	d00b      	beq.n	800174e <TIM_OC1Init+0x56>
 8001736:	f505 6540 	add.w	r5, r5, #3072	; 0xc00
 800173a:	42a8      	cmp	r0, r5
 800173c:	d007      	beq.n	800174e <TIM_OC1Init+0x56>
 800173e:	f505 6580 	add.w	r5, r5, #1024	; 0x400
 8001742:	42a8      	cmp	r0, r5
 8001744:	d003      	beq.n	800174e <TIM_OC1Init+0x56>
 8001746:	f505 6580 	add.w	r5, r5, #1024	; 0x400
 800174a:	42a8      	cmp	r0, r5
 800174c:	d111      	bne.n	8001772 <TIM_OC1Init+0x7a>
 800174e:	bf00      	nop
 8001750:	bf00      	nop
 8001752:	bf00      	nop
 8001754:	bf00      	nop
 8001756:	89cd      	ldrh	r5, [r1, #14]
 8001758:	f023 0308 	bic.w	r3, r3, #8
 800175c:	432b      	orrs	r3, r5
 800175e:	88cd      	ldrh	r5, [r1, #6]
 8001760:	f023 0304 	bic.w	r3, r3, #4
 8001764:	432b      	orrs	r3, r5
 8001766:	8a0d      	ldrh	r5, [r1, #16]
 8001768:	f422 7240 	bic.w	r2, r2, #768	; 0x300
 800176c:	432a      	orrs	r2, r5
 800176e:	8a4d      	ldrh	r5, [r1, #18]
 8001770:	432a      	orrs	r2, r5
 8001772:	6042      	str	r2, [r0, #4]
 8001774:	688a      	ldr	r2, [r1, #8]
 8001776:	6184      	str	r4, [r0, #24]
 8001778:	6342      	str	r2, [r0, #52]	; 0x34
 800177a:	6203      	str	r3, [r0, #32]
 800177c:	bd30      	pop	{r4, r5, pc}
 800177e:	bf00      	nop
 8001780:	40012c00 	.word	0x40012c00

08001784 <TIM_OC2Init>:
 8001784:	b570      	push	{r4, r5, r6, lr}
 8001786:	bf00      	nop
 8001788:	bf00      	nop
 800178a:	bf00      	nop
 800178c:	bf00      	nop
 800178e:	6a03      	ldr	r3, [r0, #32]
 8001790:	680d      	ldr	r5, [r1, #0]
 8001792:	898e      	ldrh	r6, [r1, #12]
 8001794:	f023 0310 	bic.w	r3, r3, #16
 8001798:	6203      	str	r3, [r0, #32]
 800179a:	6a03      	ldr	r3, [r0, #32]
 800179c:	6842      	ldr	r2, [r0, #4]
 800179e:	6984      	ldr	r4, [r0, #24]
 80017a0:	f024 7480 	bic.w	r4, r4, #16777216	; 0x1000000
 80017a4:	f424 44e6 	bic.w	r4, r4, #29440	; 0x7300
 80017a8:	ea44 2405 	orr.w	r4, r4, r5, lsl #8
 80017ac:	f023 0520 	bic.w	r5, r3, #32
 80017b0:	888b      	ldrh	r3, [r1, #4]
 80017b2:	4333      	orrs	r3, r6
 80017b4:	ea45 1303 	orr.w	r3, r5, r3, lsl #4
 80017b8:	4d10      	ldr	r5, [pc, #64]	; (80017fc <TIM_OC2Init+0x78>)
 80017ba:	42a8      	cmp	r0, r5
 80017bc:	d003      	beq.n	80017c6 <TIM_OC2Init+0x42>
 80017be:	f505 6500 	add.w	r5, r5, #2048	; 0x800
 80017c2:	42a8      	cmp	r0, r5
 80017c4:	d114      	bne.n	80017f0 <TIM_OC2Init+0x6c>
 80017c6:	bf00      	nop
 80017c8:	bf00      	nop
 80017ca:	bf00      	nop
 80017cc:	bf00      	nop
 80017ce:	89cd      	ldrh	r5, [r1, #14]
 80017d0:	8a0e      	ldrh	r6, [r1, #16]
 80017d2:	f023 0380 	bic.w	r3, r3, #128	; 0x80
 80017d6:	ea43 1305 	orr.w	r3, r3, r5, lsl #4
 80017da:	88cd      	ldrh	r5, [r1, #6]
 80017dc:	f023 0340 	bic.w	r3, r3, #64	; 0x40
 80017e0:	ea43 1305 	orr.w	r3, r3, r5, lsl #4
 80017e4:	8a4d      	ldrh	r5, [r1, #18]
 80017e6:	f422 6240 	bic.w	r2, r2, #3072	; 0xc00
 80017ea:	4335      	orrs	r5, r6
 80017ec:	ea42 0285 	orr.w	r2, r2, r5, lsl #2
 80017f0:	6042      	str	r2, [r0, #4]
 80017f2:	688a      	ldr	r2, [r1, #8]
 80017f4:	6184      	str	r4, [r0, #24]
 80017f6:	6382      	str	r2, [r0, #56]	; 0x38
 80017f8:	6203      	str	r3, [r0, #32]
 80017fa:	bd70      	pop	{r4, r5, r6, pc}
 80017fc:	40012c00 	.word	0x40012c00

08001800 <TIM_CtrlPWMOutputs>:
 8001800:	bf00      	nop
 8001802:	bf00      	nop
 8001804:	6c43      	ldr	r3, [r0, #68]	; 0x44
 8001806:	b111      	cbz	r1, 800180e <TIM_CtrlPWMOutputs+0xe>
 8001808:	f443 4300 	orr.w	r3, r3, #32768	; 0x8000
 800180c:	e001      	b.n	8001812 <TIM_CtrlPWMOutputs+0x12>
 800180e:	f3c3 030e 	ubfx	r3, r3, #0, #15
 8001812:	6443      	str	r3, [r0, #68]	; 0x44
 8001814:	4770      	bx	lr

08001816 <TIM_ClearITPendingBit>:
 8001816:	bf00      	nop
 8001818:	43c9      	mvns	r1, r1
 800181a:	b289      	uxth	r1, r1
 800181c:	6101      	str	r1, [r0, #16]
 800181e:	4770      	bx	lr

08001820 <timer_init>:
 8001820:	b530      	push	{r4, r5, lr}
 8001822:	2300      	movs	r3, #0
 8001824:	b085      	sub	sp, #20
 8001826:	491f      	ldr	r1, [pc, #124]	; (80018a4 <timer_init+0x84>)
 8001828:	f44f 6280 	mov.w	r2, #1024	; 0x400
 800182c:	f821 2013 	strh.w	r2, [r1, r3, lsl #1]
 8001830:	491d      	ldr	r1, [pc, #116]	; (80018a8 <timer_init+0x88>)
 8001832:	f821 2013 	strh.w	r2, [r1, r3, lsl #1]
 8001836:	4a1d      	ldr	r2, [pc, #116]	; (80018ac <timer_init+0x8c>)
 8001838:	2400      	movs	r4, #0
 800183a:	f822 4013 	strh.w	r4, [r2, r3, lsl #1]
 800183e:	3301      	adds	r3, #1
 8001840:	2b04      	cmp	r3, #4
 8001842:	4625      	mov	r5, r4
 8001844:	d1ef      	bne.n	8001826 <timer_init+0x6>
 8001846:	4b1a      	ldr	r3, [pc, #104]	; (80018b0 <timer_init+0x90>)
 8001848:	2002      	movs	r0, #2
 800184a:	2101      	movs	r1, #1
 800184c:	601c      	str	r4, [r3, #0]
 800184e:	f7ff fc43 	bl	80010d8 <RCC_APB1PeriphClockCmd>
 8001852:	f8ad 4006 	strh.w	r4, [sp, #6]
 8001856:	f8ad 400c 	strh.w	r4, [sp, #12]
 800185a:	f8ad 400e 	strh.w	r4, [sp, #14]
 800185e:	4c15      	ldr	r4, [pc, #84]	; (80018b4 <timer_init+0x94>)
 8001860:	f44f 738c 	mov.w	r3, #280	; 0x118
 8001864:	f8ad 3004 	strh.w	r3, [sp, #4]
 8001868:	4620      	mov	r0, r4
 800186a:	2331      	movs	r3, #49	; 0x31
 800186c:	a901      	add	r1, sp, #4
 800186e:	9302      	str	r3, [sp, #8]
 8001870:	f7ff fee4 	bl	800163c <TIM_TimeBaseInit>
 8001874:	4620      	mov	r0, r4
 8001876:	2101      	movs	r1, #1
 8001878:	f7ff ff30 	bl	80016dc <TIM_Cmd>
 800187c:	68e3      	ldr	r3, [r4, #12]
 800187e:	f043 0301 	orr.w	r3, r3, #1
 8001882:	60e3      	str	r3, [r4, #12]
 8001884:	231d      	movs	r3, #29
 8001886:	f88d 3000 	strb.w	r3, [sp]
 800188a:	4668      	mov	r0, sp
 800188c:	2301      	movs	r3, #1
 800188e:	f88d 5001 	strb.w	r5, [sp, #1]
 8001892:	f88d 3002 	strb.w	r3, [sp, #2]
 8001896:	f88d 3003 	strb.w	r3, [sp, #3]
 800189a:	f7ff fe97 	bl	80015cc <NVIC_Init>
 800189e:	b005      	add	sp, #20
 80018a0:	bd30      	pop	{r4, r5, pc}
 80018a2:	bf00      	nop
 80018a4:	200004b4 	.word	0x200004b4
 80018a8:	200004a8 	.word	0x200004a8
 80018ac:	200004a0 	.word	0x200004a0
 80018b0:	200004b0 	.word	0x200004b0
 80018b4:	40000400 	.word	0x40000400

080018b8 <TIM3_IRQHandler>:
 80018b8:	2300      	movs	r3, #0
 80018ba:	4a0f      	ldr	r2, [pc, #60]	; (80018f8 <TIM3_IRQHandler+0x40>)
 80018bc:	f832 1013 	ldrh.w	r1, [r2, r3, lsl #1]
 80018c0:	b289      	uxth	r1, r1
 80018c2:	b121      	cbz	r1, 80018ce <TIM3_IRQHandler+0x16>
 80018c4:	f832 1013 	ldrh.w	r1, [r2, r3, lsl #1]
 80018c8:	3901      	subs	r1, #1
 80018ca:	b289      	uxth	r1, r1
 80018cc:	e007      	b.n	80018de <TIM3_IRQHandler+0x26>
 80018ce:	490b      	ldr	r1, [pc, #44]	; (80018fc <TIM3_IRQHandler+0x44>)
 80018d0:	f831 1013 	ldrh.w	r1, [r1, r3, lsl #1]
 80018d4:	b289      	uxth	r1, r1
 80018d6:	f822 1013 	strh.w	r1, [r2, r3, lsl #1]
 80018da:	4a09      	ldr	r2, [pc, #36]	; (8001900 <TIM3_IRQHandler+0x48>)
 80018dc:	2101      	movs	r1, #1
 80018de:	f822 1013 	strh.w	r1, [r2, r3, lsl #1]
 80018e2:	3301      	adds	r3, #1
 80018e4:	2b04      	cmp	r3, #4
 80018e6:	d1e8      	bne.n	80018ba <TIM3_IRQHandler+0x2>
 80018e8:	4b06      	ldr	r3, [pc, #24]	; (8001904 <TIM3_IRQHandler+0x4c>)
 80018ea:	4807      	ldr	r0, [pc, #28]	; (8001908 <TIM3_IRQHandler+0x50>)
 80018ec:	681a      	ldr	r2, [r3, #0]
 80018ee:	2101      	movs	r1, #1
 80018f0:	3201      	adds	r2, #1
 80018f2:	601a      	str	r2, [r3, #0]
 80018f4:	f7ff bf8f 	b.w	8001816 <TIM_ClearITPendingBit>
 80018f8:	200004b4 	.word	0x200004b4
 80018fc:	200004a8 	.word	0x200004a8
 8001900:	200004a0 	.word	0x200004a0
 8001904:	200004b0 	.word	0x200004b0
 8001908:	40000400 	.word	0x40000400

0800190c <timer_get_time>:
 800190c:	b082      	sub	sp, #8
 800190e:	b672      	cpsid	i
 8001910:	4b04      	ldr	r3, [pc, #16]	; (8001924 <timer_get_time+0x18>)
 8001912:	681b      	ldr	r3, [r3, #0]
 8001914:	9301      	str	r3, [sp, #4]
 8001916:	b662      	cpsie	i
 8001918:	9801      	ldr	r0, [sp, #4]
 800191a:	230a      	movs	r3, #10
 800191c:	fbb0 f0f3 	udiv	r0, r0, r3
 8001920:	b002      	add	sp, #8
 8001922:	4770      	bx	lr
 8001924:	200004b0 	.word	0x200004b0

08001928 <timer_delay_ms>:
 8001928:	b513      	push	{r0, r1, r4, lr}
 800192a:	4604      	mov	r4, r0
 800192c:	f7ff ffee 	bl	800190c <timer_get_time>
 8001930:	4420      	add	r0, r4
 8001932:	9001      	str	r0, [sp, #4]
 8001934:	9c01      	ldr	r4, [sp, #4]
 8001936:	f7ff ffe9 	bl	800190c <timer_get_time>
 800193a:	4284      	cmp	r4, r0
 800193c:	d902      	bls.n	8001944 <timer_delay_ms+0x1c>
 800193e:	f7ff f9f9 	bl	8000d34 <sleep>
 8001942:	e7f7      	b.n	8001934 <timer_delay_ms+0xc>
 8001944:	b002      	add	sp, #8
 8001946:	bd10      	pop	{r4, pc}

08001948 <_init>:
 8001948:	e1a0c00d 	mov	ip, sp
 800194c:	e92ddff8 	push	{r3, r4, r5, r6, r7, r8, r9, sl, fp, ip, lr, pc}
 8001950:	e24cb004 	sub	fp, ip, #4
 8001954:	e24bd028 	sub	sp, fp, #40	; 0x28
 8001958:	e89d6ff0 	ldm	sp, {r4, r5, r6, r7, r8, r9, sl, fp, sp, lr}
 800195c:	e12fff1e 	bx	lr

08001960 <_fini>:
 8001960:	e1a0c00d 	mov	ip, sp
 8001964:	e92ddff8 	push	{r3, r4, r5, r6, r7, r8, r9, sl, fp, ip, lr, pc}
 8001968:	e24cb004 	sub	fp, ip, #4
 800196c:	e24bd028 	sub	sp, fp, #40	; 0x28
 8001970:	e89d6ff0 	ldm	sp, {r4, r5, r6, r7, r8, r9, sl, fp, sp, lr}
 8001974:	e12fff1e 	bx	lr
 8001978:	746f6f62 	.word	0x746f6f62
 800197c:	20676e69 	.word	0x20676e69
 8001980:	6d6f7266 	.word	0x6d6f7266
 8001984:	0a752520 	.word	0x0a752520
 8001988:	6d617200 	.word	0x6d617200
 800198c:	61747320 	.word	0x61747320
 8001990:	25207472 	.word	0x25207472
 8001994:	000a2075 	.word	0x000a2075
 8001998:	206d6172 	.word	0x206d6172
 800199c:	657a6973 	.word	0x657a6973
 80019a0:	20752520 	.word	0x20752520
 80019a4:	6172000a 	.word	0x6172000a
 80019a8:	7266206d 	.word	0x7266206d
 80019ac:	25206565 	.word	0x25206565
 80019b0:	000a2075 	.word	0x000a2075
 80019b4:	70616568 	.word	0x70616568
 80019b8:	61747320 	.word	0x61747320
 80019bc:	25207472 	.word	0x25207472
 80019c0:	000a2075 	.word	0x000a2075
 80019c4:	0a0a      	.short	0x0a0a
 80019c6:	00          	.byte	0x00
 80019c7:	63          	.byte	0x63
 80019c8:	20726168 	.word	0x20726168
 80019cc:	3c63253e 	.word	0x3c63253e
 80019d0:	6863000a 	.word	0x6863000a
 80019d4:	20646c69 	.word	0x20646c69
 80019d8:	68742031 	.word	0x68742031
 80019dc:	64616572 	.word	0x64616572
 80019e0:	31313120 	.word	0x31313120
 80019e4:	31313131 	.word	0x31313131
 80019e8:	6863000a 	.word	0x6863000a
 80019ec:	20646c69 	.word	0x20646c69
 80019f0:	68742032 	.word	0x68742032
 80019f4:	64616572 	.word	0x64616572
 80019f8:	32323220 	.word	0x32323220
 80019fc:	32323232 	.word	0x32323232
 8001a00:	770a000a 	.word	0x770a000a
 8001a04:	6f636c65 	.word	0x6f636c65
 8001a08:	7420656d 	.word	0x7420656d
 8001a0c:	7553206f 	.word	0x7553206f
 8001a10:	6168757a 	.word	0x6168757a
 8001a14:	5e20534f 	.word	0x5e20534f
 8001a18:	32205e5f 	.word	0x32205e5f
 8001a1c:	302e322e 	.word	0x302e322e
 8001a20:	4955420a 	.word	0x4955420a
 8001a24:	4a20444c 	.word	0x4a20444c
 8001a28:	32206c75 	.word	0x32206c75
 8001a2c:	30322039 	.word	0x30322039
 8001a30:	31203631 	.word	0x31203631
 8001a34:	33353a30 	.word	0x33353a30
 8001a38:	0a30353a 	.word	0x0a30353a
 8001a3c:	00          	.byte	0x00
 8001a3d:	73          	.byte	0x73
 8001a3e:	6474      	.short	0x6474
 8001a40:	69206f69 	.word	0x69206f69
 8001a44:	2074696e 	.word	0x2074696e
 8001a48:	656e6f64 	.word	0x656e6f64
 8001a4c:	0000000a 	.word	0x0000000a

08001a50 <__EH_FRAME_BEGIN__>:
 8001a50:	00000000                                ....
