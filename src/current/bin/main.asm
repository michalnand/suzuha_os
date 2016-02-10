
bin/main.elf:     file format elf32-littlearm


Disassembly of section .text:

080001c8 <mem_info_print>:
 80001c8:	b538      	push	{r3, r4, r5, lr}
 80001ca:	4c0f      	ldr	r4, [pc, #60]	; (8000208 <mem_info_print+0x40>)
 80001cc:	4d0f      	ldr	r5, [pc, #60]	; (800020c <mem_info_print+0x44>)
 80001ce:	4910      	ldr	r1, [pc, #64]	; (8000210 <mem_info_print+0x48>)
 80001d0:	4810      	ldr	r0, [pc, #64]	; (8000214 <mem_info_print+0x4c>)
 80001d2:	f000 fa11 	bl	80005f8 <printf_>
 80001d6:	1b2d      	subs	r5, r5, r4
 80001d8:	4621      	mov	r1, r4
 80001da:	480f      	ldr	r0, [pc, #60]	; (8000218 <mem_info_print+0x50>)
 80001dc:	f000 fa0c 	bl	80005f8 <printf_>
 80001e0:	4629      	mov	r1, r5
 80001e2:	480e      	ldr	r0, [pc, #56]	; (800021c <mem_info_print+0x54>)
 80001e4:	f000 fa08 	bl	80005f8 <printf_>
 80001e8:	4b0d      	ldr	r3, [pc, #52]	; (8000220 <mem_info_print+0x58>)
 80001ea:	480e      	ldr	r0, [pc, #56]	; (8000224 <mem_info_print+0x5c>)
 80001ec:	1ae1      	subs	r1, r4, r3
 80001ee:	4429      	add	r1, r5
 80001f0:	f000 fa02 	bl	80005f8 <printf_>
 80001f4:	480c      	ldr	r0, [pc, #48]	; (8000228 <mem_info_print+0x60>)
 80001f6:	490d      	ldr	r1, [pc, #52]	; (800022c <mem_info_print+0x64>)
 80001f8:	f000 f9fe 	bl	80005f8 <printf_>
 80001fc:	480c      	ldr	r0, [pc, #48]	; (8000230 <mem_info_print+0x68>)
 80001fe:	e8bd 4038 	ldmia.w	sp!, {r3, r4, r5, lr}
 8000202:	f000 b9f9 	b.w	80005f8 <printf_>
 8000206:	bf00      	nop
 8000208:	20000000 	.word	0x20000000
 800020c:	20050000 	.word	0x20050000
 8000210:	08001cc0 	.word	0x08001cc0
 8000214:	08001cf0 	.word	0x08001cf0
 8000218:	08001d01 	.word	0x08001d01
 800021c:	08001d10 	.word	0x08001d10
 8000220:	200009fc 	.word	0x200009fc
 8000224:	08001d1e 	.word	0x08001d1e
 8000228:	08001d2c 	.word	0x08001d2c
 800022c:	200009fc 	.word	0x200009fc
 8000230:	08001d3c 	.word	0x08001d3c

08000234 <main>:
 8000234:	b508      	push	{r3, lr}
 8000236:	f000 fb8f 	bl	8000958 <lib_low_level_init>
 800023a:	f000 f93d 	bl	80004b8 <lib_os_init>
 800023e:	f7ff ffc3 	bl	80001c8 <mem_info_print>
 8000242:	4905      	ldr	r1, [pc, #20]	; (8000258 <main+0x24>)
 8000244:	4805      	ldr	r0, [pc, #20]	; (800025c <main+0x28>)
 8000246:	f44f 6280 	mov.w	r2, #1024	; 0x400
 800024a:	2308      	movs	r3, #8
 800024c:	f000 f892 	bl	8000374 <create_thread>
 8000250:	f000 f88a 	bl	8000368 <kernel_start>
 8000254:	2000      	movs	r0, #0
 8000256:	bd08      	pop	{r3, pc}
 8000258:	20000408 	.word	0x20000408
 800025c:	08000805 	.word	0x08000805

08000260 <thread_ending>:
 8000260:	b672      	cpsid	i
 8000262:	4b05      	ldr	r3, [pc, #20]	; (8000278 <thread_ending+0x18>)
 8000264:	4a05      	ldr	r2, [pc, #20]	; (800027c <thread_ending+0x1c>)
 8000266:	681b      	ldr	r3, [r3, #0]
 8000268:	210c      	movs	r1, #12
 800026a:	fb01 2303 	mla	r3, r1, r3, r2
 800026e:	2200      	movs	r2, #0
 8000270:	605a      	str	r2, [r3, #4]
 8000272:	b662      	cpsie	i
 8000274:	bf00      	nop
 8000276:	e7fd      	b.n	8000274 <thread_ending+0x14>
 8000278:	20000868 	.word	0x20000868
 800027c:	20000808 	.word	0x20000808

08000280 <null_thread>:
 8000280:	b508      	push	{r3, lr}
 8000282:	f001 fc7b 	bl	8001b7c <sleep>
 8000286:	e7fc      	b.n	8000282 <null_thread+0x2>

08000288 <scheduler>:
 8000288:	b570      	push	{r4, r5, r6, lr}
 800028a:	2200      	movs	r2, #0
 800028c:	4611      	mov	r1, r2
 800028e:	4b15      	ldr	r3, [pc, #84]	; (80002e4 <scheduler+0x5c>)
 8000290:	200c      	movs	r0, #12
 8000292:	fb00 f501 	mul.w	r5, r0, r1
 8000296:	195e      	adds	r6, r3, r5
 8000298:	6874      	ldr	r4, [r6, #4]
 800029a:	f014 0f02 	tst.w	r4, #2
 800029e:	461c      	mov	r4, r3
 80002a0:	d10a      	bne.n	80002b8 <scheduler+0x30>
 80002a2:	6876      	ldr	r6, [r6, #4]
 80002a4:	07f6      	lsls	r6, r6, #31
 80002a6:	d507      	bpl.n	80002b8 <scheduler+0x30>
 80002a8:	4350      	muls	r0, r2
 80002aa:	5b5d      	ldrh	r5, [r3, r5]
 80002ac:	5a18      	ldrh	r0, [r3, r0]
 80002ae:	b2ad      	uxth	r5, r5
 80002b0:	b280      	uxth	r0, r0
 80002b2:	4285      	cmp	r5, r0
 80002b4:	bf38      	it	cc
 80002b6:	460a      	movcc	r2, r1
 80002b8:	200c      	movs	r0, #12
 80002ba:	4348      	muls	r0, r1
 80002bc:	5a1d      	ldrh	r5, [r3, r0]
 80002be:	b2ad      	uxth	r5, r5
 80002c0:	b125      	cbz	r5, 80002cc <scheduler+0x44>
 80002c2:	5a1d      	ldrh	r5, [r3, r0]
 80002c4:	b2ad      	uxth	r5, r5
 80002c6:	3d01      	subs	r5, #1
 80002c8:	b2ad      	uxth	r5, r5
 80002ca:	521d      	strh	r5, [r3, r0]
 80002cc:	3101      	adds	r1, #1
 80002ce:	2908      	cmp	r1, #8
 80002d0:	d1dd      	bne.n	800028e <scheduler+0x6>
 80002d2:	230c      	movs	r3, #12
 80002d4:	4353      	muls	r3, r2
 80002d6:	18e1      	adds	r1, r4, r3
 80002d8:	8849      	ldrh	r1, [r1, #2]
 80002da:	b289      	uxth	r1, r1
 80002dc:	52e1      	strh	r1, [r4, r3]
 80002de:	4b02      	ldr	r3, [pc, #8]	; (80002e8 <scheduler+0x60>)
 80002e0:	601a      	str	r2, [r3, #0]
 80002e2:	bd70      	pop	{r4, r5, r6, pc}
 80002e4:	20000808 	.word	0x20000808
 80002e8:	20000868 	.word	0x20000868

080002ec <SysTick_Handler>:
 80002ec:	b4f0      	push	{r4, r5, r6, r7}
 80002ee:	4644      	mov	r4, r8
 80002f0:	464d      	mov	r5, r9
 80002f2:	4656      	mov	r6, sl
 80002f4:	465f      	mov	r7, fp
 80002f6:	b4f0      	push	{r4, r5, r6, r7}
 80002f8:	f3ef 8208 	mrs	r2, MSP
 80002fc:	4c0f      	ldr	r4, [pc, #60]	; (800033c <SysTick_Handler+0x50>)
 80002fe:	4d10      	ldr	r5, [pc, #64]	; (8000340 <SysTick_Handler+0x54>)
 8000300:	6823      	ldr	r3, [r4, #0]
 8000302:	3301      	adds	r3, #1
 8000304:	d005      	beq.n	8000312 <SysTick_Handler+0x26>
 8000306:	6823      	ldr	r3, [r4, #0]
 8000308:	210c      	movs	r1, #12
 800030a:	fb01 5303 	mla	r3, r1, r3, r5
 800030e:	609a      	str	r2, [r3, #8]
 8000310:	e001      	b.n	8000316 <SysTick_Handler+0x2a>
 8000312:	2300      	movs	r3, #0
 8000314:	6023      	str	r3, [r4, #0]
 8000316:	f7ff ffb7 	bl	8000288 <scheduler>
 800031a:	6823      	ldr	r3, [r4, #0]
 800031c:	220c      	movs	r2, #12
 800031e:	fb02 5503 	mla	r5, r2, r3, r5
 8000322:	f06f 0306 	mvn.w	r3, #6
 8000326:	68aa      	ldr	r2, [r5, #8]
 8000328:	469e      	mov	lr, r3
 800032a:	f382 8808 	msr	MSP, r2
 800032e:	bcf0      	pop	{r4, r5, r6, r7}
 8000330:	46a0      	mov	r8, r4
 8000332:	46a9      	mov	r9, r5
 8000334:	46b2      	mov	sl, r6
 8000336:	46bb      	mov	fp, r7
 8000338:	bcf0      	pop	{r4, r5, r6, r7}
 800033a:	4770      	bx	lr
 800033c:	20000868 	.word	0x20000868
 8000340:	20000808 	.word	0x20000808

08000344 <sched_off>:
 8000344:	b672      	cpsid	i
 8000346:	4770      	bx	lr

08000348 <sched_on>:
 8000348:	b662      	cpsie	i
 800034a:	4770      	bx	lr

0800034c <yield>:
 800034c:	bf00      	nop
 800034e:	4770      	bx	lr

08000350 <get_thread_id>:
 8000350:	b082      	sub	sp, #8
 8000352:	b672      	cpsid	i
 8000354:	4b03      	ldr	r3, [pc, #12]	; (8000364 <get_thread_id+0x14>)
 8000356:	681b      	ldr	r3, [r3, #0]
 8000358:	9301      	str	r3, [sp, #4]
 800035a:	b662      	cpsie	i
 800035c:	9801      	ldr	r0, [sp, #4]
 800035e:	b002      	add	sp, #8
 8000360:	4770      	bx	lr
 8000362:	bf00      	nop
 8000364:	20000868 	.word	0x20000868

08000368 <kernel_start>:
 8000368:	b508      	push	{r3, lr}
 800036a:	f001 fbf5 	bl	8001b58 <sys_tick_init>
 800036e:	bf00      	nop
 8000370:	e7fd      	b.n	800036e <kernel_start+0x6>
	...

08000374 <create_thread>:
 8000374:	f022 0203 	bic.w	r2, r2, #3
 8000378:	3a40      	subs	r2, #64	; 0x40
 800037a:	e92d 43f0 	stmdb	sp!, {r4, r5, r6, r7, r8, r9, lr}
 800037e:	eb01 0c02 	add.w	ip, r1, r2
 8000382:	f102 0834 	add.w	r8, r2, #52	; 0x34
 8000386:	f102 0938 	add.w	r9, r2, #56	; 0x38
 800038a:	323c      	adds	r2, #60	; 0x3c
 800038c:	4488      	add	r8, r1
 800038e:	4489      	add	r9, r1
 8000390:	4607      	mov	r7, r0
 8000392:	4411      	add	r1, r2
 8000394:	2200      	movs	r2, #0
 8000396:	b672      	cpsid	i
 8000398:	4e11      	ldr	r6, [pc, #68]	; (80003e0 <create_thread+0x6c>)
 800039a:	250c      	movs	r5, #12
 800039c:	4355      	muls	r5, r2
 800039e:	1974      	adds	r4, r6, r5
 80003a0:	6860      	ldr	r0, [r4, #4]
 80003a2:	07c0      	lsls	r0, r0, #31
 80003a4:	d412      	bmi.n	80003cc <create_thread+0x58>
 80003a6:	480f      	ldr	r0, [pc, #60]	; (80003e4 <create_thread+0x70>)
 80003a8:	f8c4 c008 	str.w	ip, [r4, #8]
 80003ac:	f8c8 0000 	str.w	r0, [r8]
 80003b0:	f04f 5004 	mov.w	r0, #553648128	; 0x21000000
 80003b4:	f8c9 7000 	str.w	r7, [r9]
 80003b8:	2b07      	cmp	r3, #7
 80003ba:	bf98      	it	ls
 80003bc:	2308      	movls	r3, #8
 80003be:	6008      	str	r0, [r1, #0]
 80003c0:	2001      	movs	r0, #1
 80003c2:	8063      	strh	r3, [r4, #2]
 80003c4:	5373      	strh	r3, [r6, r5]
 80003c6:	6060      	str	r0, [r4, #4]
 80003c8:	4610      	mov	r0, r2
 80003ca:	e000      	b.n	80003ce <create_thread+0x5a>
 80003cc:	2008      	movs	r0, #8
 80003ce:	b662      	cpsie	i
 80003d0:	3201      	adds	r2, #1
 80003d2:	2a08      	cmp	r2, #8
 80003d4:	d001      	beq.n	80003da <create_thread+0x66>
 80003d6:	2808      	cmp	r0, #8
 80003d8:	d0dd      	beq.n	8000396 <create_thread+0x22>
 80003da:	e8bd 83f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, pc}
 80003de:	bf00      	nop
 80003e0:	20000808 	.word	0x20000808
 80003e4:	08000261 	.word	0x08000261

080003e8 <kernel_init>:
 80003e8:	b510      	push	{r4, lr}
 80003ea:	2300      	movs	r3, #0
 80003ec:	490b      	ldr	r1, [pc, #44]	; (800041c <kernel_init+0x34>)
 80003ee:	220c      	movs	r2, #12
 80003f0:	435a      	muls	r2, r3
 80003f2:	188c      	adds	r4, r1, r2
 80003f4:	2000      	movs	r0, #0
 80003f6:	6060      	str	r0, [r4, #4]
 80003f8:	3301      	adds	r3, #1
 80003fa:	2008      	movs	r0, #8
 80003fc:	4283      	cmp	r3, r0
 80003fe:	8060      	strh	r0, [r4, #2]
 8000400:	5288      	strh	r0, [r1, r2]
 8000402:	d1f3      	bne.n	80003ec <kernel_init+0x4>
 8000404:	4b06      	ldr	r3, [pc, #24]	; (8000420 <kernel_init+0x38>)
 8000406:	4807      	ldr	r0, [pc, #28]	; (8000424 <kernel_init+0x3c>)
 8000408:	4907      	ldr	r1, [pc, #28]	; (8000428 <kernel_init+0x40>)
 800040a:	f04f 32ff 	mov.w	r2, #4294967295
 800040e:	601a      	str	r2, [r3, #0]
 8000410:	e8bd 4010 	ldmia.w	sp!, {r4, lr}
 8000414:	2280      	movs	r2, #128	; 0x80
 8000416:	23ff      	movs	r3, #255	; 0xff
 8000418:	f7ff bfac 	b.w	8000374 <create_thread>
 800041c:	20000808 	.word	0x20000808
 8000420:	20000868 	.word	0x20000868
 8000424:	08000281 	.word	0x08000281
 8000428:	2000086c 	.word	0x2000086c

0800042c <set_wait_state>:
 800042c:	b507      	push	{r0, r1, r2, lr}
 800042e:	f7ff ff8f 	bl	8000350 <get_thread_id>
 8000432:	9000      	str	r0, [sp, #0]
 8000434:	b672      	cpsid	i
 8000436:	4b0d      	ldr	r3, [pc, #52]	; (800046c <set_wait_state+0x40>)
 8000438:	9a00      	ldr	r2, [sp, #0]
 800043a:	210c      	movs	r1, #12
 800043c:	fb01 3202 	mla	r2, r1, r2, r3
 8000440:	6851      	ldr	r1, [r2, #4]
 8000442:	f041 0102 	orr.w	r1, r1, #2
 8000446:	6051      	str	r1, [r2, #4]
 8000448:	b672      	cpsid	i
 800044a:	9a00      	ldr	r2, [sp, #0]
 800044c:	210c      	movs	r1, #12
 800044e:	fb01 3202 	mla	r2, r1, r2, r3
 8000452:	6852      	ldr	r2, [r2, #4]
 8000454:	9201      	str	r2, [sp, #4]
 8000456:	b662      	cpsie	i
 8000458:	9a01      	ldr	r2, [sp, #4]
 800045a:	0791      	lsls	r1, r2, #30
 800045c:	d500      	bpl.n	8000460 <set_wait_state+0x34>
 800045e:	bf00      	nop
 8000460:	9a01      	ldr	r2, [sp, #4]
 8000462:	0792      	lsls	r2, r2, #30
 8000464:	d4f0      	bmi.n	8000448 <set_wait_state+0x1c>
 8000466:	b003      	add	sp, #12
 8000468:	f85d fb04 	ldr.w	pc, [sp], #4
 800046c:	20000808 	.word	0x20000808

08000470 <wake_up_threads>:
 8000470:	2300      	movs	r3, #0
 8000472:	b672      	cpsid	i
 8000474:	4a06      	ldr	r2, [pc, #24]	; (8000490 <wake_up_threads+0x20>)
 8000476:	210c      	movs	r1, #12
 8000478:	fb01 2203 	mla	r2, r1, r3, r2
 800047c:	6851      	ldr	r1, [r2, #4]
 800047e:	f021 0102 	bic.w	r1, r1, #2
 8000482:	6051      	str	r1, [r2, #4]
 8000484:	b662      	cpsie	i
 8000486:	3301      	adds	r3, #1
 8000488:	2b08      	cmp	r3, #8
 800048a:	d1f2      	bne.n	8000472 <wake_up_threads+0x2>
 800048c:	4770      	bx	lr
 800048e:	bf00      	nop
 8000490:	20000808 	.word	0x20000808

08000494 <stdlib_init_>:
 8000494:	b508      	push	{r3, lr}
 8000496:	4804      	ldr	r0, [pc, #16]	; (80004a8 <stdlib_init_+0x14>)
 8000498:	f000 f928 	bl	80006ec <mutex_init>
 800049c:	4b03      	ldr	r3, [pc, #12]	; (80004ac <stdlib_init_+0x18>)
 800049e:	4a04      	ldr	r2, [pc, #16]	; (80004b0 <stdlib_init_+0x1c>)
 80004a0:	6013      	str	r3, [r2, #0]
 80004a2:	4a04      	ldr	r2, [pc, #16]	; (80004b4 <stdlib_init_+0x20>)
 80004a4:	6013      	str	r3, [r2, #0]
 80004a6:	bd08      	pop	{r3, pc}
 80004a8:	200008f4 	.word	0x200008f4
 80004ac:	200009fc 	.word	0x200009fc
 80004b0:	200008ec 	.word	0x200008ec
 80004b4:	200008f0 	.word	0x200008f0

080004b8 <lib_os_init>:
 80004b8:	b508      	push	{r3, lr}
 80004ba:	f7ff ff95 	bl	80003e8 <kernel_init>
 80004be:	f7ff ffe9 	bl	8000494 <stdlib_init_>
 80004c2:	f000 f805 	bl	80004d0 <messages_init>
 80004c6:	e8bd 4008 	ldmia.w	sp!, {r3, lr}
 80004ca:	f000 b8e7 	b.w	800069c <stdio_init>
	...

080004d0 <messages_init>:
 80004d0:	b510      	push	{r4, lr}
 80004d2:	2200      	movs	r2, #0
 80004d4:	4909      	ldr	r1, [pc, #36]	; (80004fc <messages_init+0x2c>)
 80004d6:	2300      	movs	r3, #0
 80004d8:	f841 3022 	str.w	r3, [r1, r2, lsl #2]
 80004dc:	3201      	adds	r2, #1
 80004de:	2a08      	cmp	r2, #8
 80004e0:	d1f8      	bne.n	80004d4 <messages_init+0x4>
 80004e2:	4c07      	ldr	r4, [pc, #28]	; (8000500 <messages_init+0x30>)
 80004e4:	0118      	lsls	r0, r3, #4
 80004e6:	1821      	adds	r1, r4, r0
 80004e8:	3301      	adds	r3, #1
 80004ea:	2200      	movs	r2, #0
 80004ec:	2b04      	cmp	r3, #4
 80004ee:	604a      	str	r2, [r1, #4]
 80004f0:	5022      	str	r2, [r4, r0]
 80004f2:	60ca      	str	r2, [r1, #12]
 80004f4:	608a      	str	r2, [r1, #8]
 80004f6:	d1f4      	bne.n	80004e2 <messages_init+0x12>
 80004f8:	bd10      	pop	{r4, pc}
 80004fa:	bf00      	nop
 80004fc:	200008f8 	.word	0x200008f8
 8000500:	20000918 	.word	0x20000918

08000504 <putc_>:
 8000504:	b538      	push	{r3, r4, r5, lr}
 8000506:	4c06      	ldr	r4, [pc, #24]	; (8000520 <putc_+0x1c>)
 8000508:	4605      	mov	r5, r0
 800050a:	4620      	mov	r0, r4
 800050c:	f000 f8f8 	bl	8000700 <mutex_lock>
 8000510:	4628      	mov	r0, r5
 8000512:	f000 f997 	bl	8000844 <uart_write>
 8000516:	4620      	mov	r0, r4
 8000518:	e8bd 4038 	ldmia.w	sp!, {r3, r4, r5, lr}
 800051c:	f000 b90c 	b.w	8000738 <mutex_unlock>
 8000520:	20000958 	.word	0x20000958

08000524 <puts_>:
 8000524:	b510      	push	{r4, lr}
 8000526:	4604      	mov	r4, r0
 8000528:	4807      	ldr	r0, [pc, #28]	; (8000548 <puts_+0x24>)
 800052a:	f000 f8e9 	bl	8000700 <mutex_lock>
 800052e:	3c01      	subs	r4, #1
 8000530:	f814 0f01 	ldrb.w	r0, [r4, #1]!
 8000534:	b110      	cbz	r0, 800053c <puts_+0x18>
 8000536:	f7ff ffe5 	bl	8000504 <putc_>
 800053a:	e7f9      	b.n	8000530 <puts_+0xc>
 800053c:	4802      	ldr	r0, [pc, #8]	; (8000548 <puts_+0x24>)
 800053e:	e8bd 4010 	ldmia.w	sp!, {r4, lr}
 8000542:	f000 b8f9 	b.w	8000738 <mutex_unlock>
 8000546:	bf00      	nop
 8000548:	20000964 	.word	0x20000964

0800054c <puti_>:
 800054c:	b530      	push	{r4, r5, lr}
 800054e:	b085      	sub	sp, #20
 8000550:	1e03      	subs	r3, r0, #0
 8000552:	f04f 0200 	mov.w	r2, #0
 8000556:	bfa8      	it	ge
 8000558:	4614      	movge	r4, r2
 800055a:	f88d 200f 	strb.w	r2, [sp, #15]
 800055e:	bfbc      	itt	lt
 8000560:	425b      	neglt	r3, r3
 8000562:	2401      	movlt	r4, #1
 8000564:	220a      	movs	r2, #10
 8000566:	210a      	movs	r1, #10
 8000568:	fb93 f5f1 	sdiv	r5, r3, r1
 800056c:	fb01 3315 	mls	r3, r1, r5, r3
 8000570:	a801      	add	r0, sp, #4
 8000572:	3330      	adds	r3, #48	; 0x30
 8000574:	5413      	strb	r3, [r2, r0]
 8000576:	1e51      	subs	r1, r2, #1
 8000578:	462b      	mov	r3, r5
 800057a:	b10d      	cbz	r5, 8000580 <puti_+0x34>
 800057c:	460a      	mov	r2, r1
 800057e:	e7f2      	b.n	8000566 <puti_+0x1a>
 8000580:	b12c      	cbz	r4, 800058e <puti_+0x42>
 8000582:	ab04      	add	r3, sp, #16
 8000584:	440b      	add	r3, r1
 8000586:	222d      	movs	r2, #45	; 0x2d
 8000588:	f803 2c0c 	strb.w	r2, [r3, #-12]
 800058c:	460a      	mov	r2, r1
 800058e:	4410      	add	r0, r2
 8000590:	f7ff ffc8 	bl	8000524 <puts_>
 8000594:	b005      	add	sp, #20
 8000596:	bd30      	pop	{r4, r5, pc}

08000598 <putui_>:
 8000598:	b51f      	push	{r0, r1, r2, r3, r4, lr}
 800059a:	2300      	movs	r3, #0
 800059c:	f88d 300f 	strb.w	r3, [sp, #15]
 80005a0:	230a      	movs	r3, #10
 80005a2:	240a      	movs	r4, #10
 80005a4:	fbb0 f1f4 	udiv	r1, r0, r4
 80005a8:	fb04 0011 	mls	r0, r4, r1, r0
 80005ac:	aa01      	add	r2, sp, #4
 80005ae:	3030      	adds	r0, #48	; 0x30
 80005b0:	5498      	strb	r0, [r3, r2]
 80005b2:	1e5c      	subs	r4, r3, #1
 80005b4:	4608      	mov	r0, r1
 80005b6:	b109      	cbz	r1, 80005bc <putui_+0x24>
 80005b8:	4623      	mov	r3, r4
 80005ba:	e7f2      	b.n	80005a2 <putui_+0xa>
 80005bc:	18d0      	adds	r0, r2, r3
 80005be:	f7ff ffb1 	bl	8000524 <puts_>
 80005c2:	b004      	add	sp, #16
 80005c4:	bd10      	pop	{r4, pc}

080005c6 <putx_>:
 80005c6:	b51f      	push	{r0, r1, r2, r3, r4, lr}
 80005c8:	2300      	movs	r3, #0
 80005ca:	f88d 300f 	strb.w	r3, [sp, #15]
 80005ce:	230a      	movs	r3, #10
 80005d0:	f000 010f 	and.w	r1, r0, #15
 80005d4:	2909      	cmp	r1, #9
 80005d6:	aa01      	add	r2, sp, #4
 80005d8:	bf94      	ite	ls
 80005da:	3130      	addls	r1, #48	; 0x30
 80005dc:	3157      	addhi	r1, #87	; 0x57
 80005de:	0900      	lsrs	r0, r0, #4
 80005e0:	54d1      	strb	r1, [r2, r3]
 80005e2:	f103 31ff 	add.w	r1, r3, #4294967295
 80005e6:	d001      	beq.n	80005ec <putx_+0x26>
 80005e8:	460b      	mov	r3, r1
 80005ea:	e7f1      	b.n	80005d0 <putx_+0xa>
 80005ec:	18d0      	adds	r0, r2, r3
 80005ee:	f7ff ff99 	bl	8000524 <puts_>
 80005f2:	b005      	add	sp, #20
 80005f4:	f85d fb04 	ldr.w	pc, [sp], #4

080005f8 <printf_>:
 80005f8:	b40f      	push	{r0, r1, r2, r3}
 80005fa:	b537      	push	{r0, r1, r2, r4, r5, lr}
 80005fc:	ac06      	add	r4, sp, #24
 80005fe:	4826      	ldr	r0, [pc, #152]	; (8000698 <printf_+0xa0>)
 8000600:	f854 5b04 	ldr.w	r5, [r4], #4
 8000604:	f000 f87c 	bl	8000700 <mutex_lock>
 8000608:	9401      	str	r4, [sp, #4]
 800060a:	2400      	movs	r4, #0
 800060c:	5d28      	ldrb	r0, [r5, r4]
 800060e:	2800      	cmp	r0, #0
 8000610:	d039      	beq.n	8000686 <printf_+0x8e>
 8000612:	2825      	cmp	r0, #37	; 0x25
 8000614:	d003      	beq.n	800061e <printf_+0x26>
 8000616:	f7ff ff75 	bl	8000504 <putc_>
 800061a:	3401      	adds	r4, #1
 800061c:	e7f6      	b.n	800060c <printf_+0x14>
 800061e:	192b      	adds	r3, r5, r4
 8000620:	7858      	ldrb	r0, [r3, #1]
 8000622:	2869      	cmp	r0, #105	; 0x69
 8000624:	d016      	beq.n	8000654 <printf_+0x5c>
 8000626:	d808      	bhi.n	800063a <printf_+0x42>
 8000628:	2825      	cmp	r0, #37	; 0x25
 800062a:	d028      	beq.n	800067e <printf_+0x86>
 800062c:	2863      	cmp	r0, #99	; 0x63
 800062e:	d128      	bne.n	8000682 <printf_+0x8a>
 8000630:	9b01      	ldr	r3, [sp, #4]
 8000632:	1d1a      	adds	r2, r3, #4
 8000634:	9201      	str	r2, [sp, #4]
 8000636:	7818      	ldrb	r0, [r3, #0]
 8000638:	e021      	b.n	800067e <printf_+0x86>
 800063a:	2875      	cmp	r0, #117	; 0x75
 800063c:	d011      	beq.n	8000662 <printf_+0x6a>
 800063e:	2878      	cmp	r0, #120	; 0x78
 8000640:	d016      	beq.n	8000670 <printf_+0x78>
 8000642:	2873      	cmp	r0, #115	; 0x73
 8000644:	d11d      	bne.n	8000682 <printf_+0x8a>
 8000646:	9b01      	ldr	r3, [sp, #4]
 8000648:	1d1a      	adds	r2, r3, #4
 800064a:	6818      	ldr	r0, [r3, #0]
 800064c:	9201      	str	r2, [sp, #4]
 800064e:	f7ff ff69 	bl	8000524 <puts_>
 8000652:	e016      	b.n	8000682 <printf_+0x8a>
 8000654:	9b01      	ldr	r3, [sp, #4]
 8000656:	1d1a      	adds	r2, r3, #4
 8000658:	6818      	ldr	r0, [r3, #0]
 800065a:	9201      	str	r2, [sp, #4]
 800065c:	f7ff ff76 	bl	800054c <puti_>
 8000660:	e00f      	b.n	8000682 <printf_+0x8a>
 8000662:	9b01      	ldr	r3, [sp, #4]
 8000664:	1d1a      	adds	r2, r3, #4
 8000666:	6818      	ldr	r0, [r3, #0]
 8000668:	9201      	str	r2, [sp, #4]
 800066a:	f7ff ff95 	bl	8000598 <putui_>
 800066e:	e008      	b.n	8000682 <printf_+0x8a>
 8000670:	9b01      	ldr	r3, [sp, #4]
 8000672:	1d1a      	adds	r2, r3, #4
 8000674:	6818      	ldr	r0, [r3, #0]
 8000676:	9201      	str	r2, [sp, #4]
 8000678:	f7ff ffa5 	bl	80005c6 <putx_>
 800067c:	e001      	b.n	8000682 <printf_+0x8a>
 800067e:	f7ff ff41 	bl	8000504 <putc_>
 8000682:	3402      	adds	r4, #2
 8000684:	e7c2      	b.n	800060c <printf_+0x14>
 8000686:	4804      	ldr	r0, [pc, #16]	; (8000698 <printf_+0xa0>)
 8000688:	f000 f856 	bl	8000738 <mutex_unlock>
 800068c:	b003      	add	sp, #12
 800068e:	e8bd 4030 	ldmia.w	sp!, {r4, r5, lr}
 8000692:	b004      	add	sp, #16
 8000694:	4770      	bx	lr
 8000696:	bf00      	nop
 8000698:	20000960 	.word	0x20000960

0800069c <stdio_init>:
 800069c:	b510      	push	{r4, lr}
 800069e:	480e      	ldr	r0, [pc, #56]	; (80006d8 <stdio_init+0x3c>)
 80006a0:	f000 f824 	bl	80006ec <mutex_init>
 80006a4:	480d      	ldr	r0, [pc, #52]	; (80006dc <stdio_init+0x40>)
 80006a6:	f000 f821 	bl	80006ec <mutex_init>
 80006aa:	480d      	ldr	r0, [pc, #52]	; (80006e0 <stdio_init+0x44>)
 80006ac:	f000 f81e 	bl	80006ec <mutex_init>
 80006b0:	480c      	ldr	r0, [pc, #48]	; (80006e4 <stdio_init+0x48>)
 80006b2:	f000 f81b 	bl	80006ec <mutex_init>
 80006b6:	2408      	movs	r4, #8
 80006b8:	2020      	movs	r0, #32
 80006ba:	f7ff ff23 	bl	8000504 <putc_>
 80006be:	3c01      	subs	r4, #1
 80006c0:	d1fa      	bne.n	80006b8 <stdio_init+0x1c>
 80006c2:	2420      	movs	r4, #32
 80006c4:	200a      	movs	r0, #10
 80006c6:	f7ff ff1d 	bl	8000504 <putc_>
 80006ca:	3c01      	subs	r4, #1
 80006cc:	d1fa      	bne.n	80006c4 <stdio_init+0x28>
 80006ce:	4806      	ldr	r0, [pc, #24]	; (80006e8 <stdio_init+0x4c>)
 80006d0:	e8bd 4010 	ldmia.w	sp!, {r4, lr}
 80006d4:	f7ff bf90 	b.w	80005f8 <printf_>
 80006d8:	20000958 	.word	0x20000958
 80006dc:	2000095c 	.word	0x2000095c
 80006e0:	20000964 	.word	0x20000964
 80006e4:	20000960 	.word	0x20000960
 80006e8:	08001d3f 	.word	0x08001d3f

080006ec <mutex_init>:
 80006ec:	b510      	push	{r4, lr}
 80006ee:	4604      	mov	r4, r0
 80006f0:	f7ff fe28 	bl	8000344 <sched_off>
 80006f4:	2300      	movs	r3, #0
 80006f6:	6023      	str	r3, [r4, #0]
 80006f8:	e8bd 4010 	ldmia.w	sp!, {r4, lr}
 80006fc:	f7ff be24 	b.w	8000348 <sched_on>

08000700 <mutex_lock>:
 8000700:	b513      	push	{r0, r1, r4, lr}
 8000702:	4604      	mov	r4, r0
 8000704:	f7ff fe1e 	bl	8000344 <sched_off>
 8000708:	6823      	ldr	r3, [r4, #0]
 800070a:	9301      	str	r3, [sp, #4]
 800070c:	f7ff fe1c 	bl	8000348 <sched_on>
 8000710:	9b01      	ldr	r3, [sp, #4]
 8000712:	b10b      	cbz	r3, 8000718 <mutex_lock+0x18>
 8000714:	f7ff fe8a 	bl	800042c <set_wait_state>
 8000718:	9b01      	ldr	r3, [sp, #4]
 800071a:	2b00      	cmp	r3, #0
 800071c:	d1f2      	bne.n	8000704 <mutex_lock+0x4>
 800071e:	f7ff fe11 	bl	8000344 <sched_off>
 8000722:	6823      	ldr	r3, [r4, #0]
 8000724:	9301      	str	r3, [sp, #4]
 8000726:	9b01      	ldr	r3, [sp, #4]
 8000728:	2b00      	cmp	r3, #0
 800072a:	d1eb      	bne.n	8000704 <mutex_lock+0x4>
 800072c:	2301      	movs	r3, #1
 800072e:	6023      	str	r3, [r4, #0]
 8000730:	f7ff fe0a 	bl	8000348 <sched_on>
 8000734:	b002      	add	sp, #8
 8000736:	bd10      	pop	{r4, pc}

08000738 <mutex_unlock>:
 8000738:	b508      	push	{r3, lr}
 800073a:	f7ff ffd7 	bl	80006ec <mutex_init>
 800073e:	f7ff fe97 	bl	8000470 <wake_up_threads>
 8000742:	e8bd 4008 	ldmia.w	sp!, {r3, lr}
 8000746:	f7ff be01 	b.w	800034c <yield>
	...

0800074c <hmc5883_init>:
 800074c:	b510      	push	{r4, lr}
 800074e:	4b16      	ldr	r3, [pc, #88]	; (80007a8 <hmc5883_init+0x5c>)
 8000750:	2400      	movs	r4, #0
 8000752:	203c      	movs	r0, #60	; 0x3c
 8000754:	4621      	mov	r1, r4
 8000756:	2218      	movs	r2, #24
 8000758:	801c      	strh	r4, [r3, #0]
 800075a:	805c      	strh	r4, [r3, #2]
 800075c:	809c      	strh	r4, [r3, #4]
 800075e:	f000 fcd0 	bl	8001102 <i2c_write_reg>
 8000762:	203c      	movs	r0, #60	; 0x3c
 8000764:	2101      	movs	r1, #1
 8000766:	2280      	movs	r2, #128	; 0x80
 8000768:	f000 fccb 	bl	8001102 <i2c_write_reg>
 800076c:	203c      	movs	r0, #60	; 0x3c
 800076e:	2102      	movs	r1, #2
 8000770:	4622      	mov	r2, r4
 8000772:	f000 fcc6 	bl	8001102 <i2c_write_reg>
 8000776:	203c      	movs	r0, #60	; 0x3c
 8000778:	210a      	movs	r1, #10
 800077a:	f000 fcd5 	bl	8001128 <i2c_read_reg>
 800077e:	2848      	cmp	r0, #72	; 0x48
 8000780:	d10e      	bne.n	80007a0 <hmc5883_init+0x54>
 8000782:	203c      	movs	r0, #60	; 0x3c
 8000784:	210b      	movs	r1, #11
 8000786:	f000 fccf 	bl	8001128 <i2c_read_reg>
 800078a:	2834      	cmp	r0, #52	; 0x34
 800078c:	d10a      	bne.n	80007a4 <hmc5883_init+0x58>
 800078e:	210c      	movs	r1, #12
 8000790:	203c      	movs	r0, #60	; 0x3c
 8000792:	f000 fcc9 	bl	8001128 <i2c_read_reg>
 8000796:	2833      	cmp	r0, #51	; 0x33
 8000798:	bf14      	ite	ne
 800079a:	2003      	movne	r0, #3
 800079c:	4620      	moveq	r0, r4
 800079e:	bd10      	pop	{r4, pc}
 80007a0:	2001      	movs	r0, #1
 80007a2:	bd10      	pop	{r4, pc}
 80007a4:	2002      	movs	r0, #2
 80007a6:	bd10      	pop	{r4, pc}
 80007a8:	20000968 	.word	0x20000968

080007ac <hmc5883_read>:
 80007ac:	b538      	push	{r3, r4, r5, lr}
 80007ae:	2103      	movs	r1, #3
 80007b0:	203c      	movs	r0, #60	; 0x3c
 80007b2:	f000 fcb9 	bl	8001128 <i2c_read_reg>
 80007b6:	4c12      	ldr	r4, [pc, #72]	; (8000800 <hmc5883_read+0x54>)
 80007b8:	0200      	lsls	r0, r0, #8
 80007ba:	b285      	uxth	r5, r0
 80007bc:	2104      	movs	r1, #4
 80007be:	203c      	movs	r0, #60	; 0x3c
 80007c0:	8025      	strh	r5, [r4, #0]
 80007c2:	f000 fcb1 	bl	8001128 <i2c_read_reg>
 80007c6:	4328      	orrs	r0, r5
 80007c8:	8020      	strh	r0, [r4, #0]
 80007ca:	2107      	movs	r1, #7
 80007cc:	203c      	movs	r0, #60	; 0x3c
 80007ce:	f000 fcab 	bl	8001128 <i2c_read_reg>
 80007d2:	0200      	lsls	r0, r0, #8
 80007d4:	b285      	uxth	r5, r0
 80007d6:	2108      	movs	r1, #8
 80007d8:	203c      	movs	r0, #60	; 0x3c
 80007da:	8065      	strh	r5, [r4, #2]
 80007dc:	f000 fca4 	bl	8001128 <i2c_read_reg>
 80007e0:	4328      	orrs	r0, r5
 80007e2:	8060      	strh	r0, [r4, #2]
 80007e4:	2105      	movs	r1, #5
 80007e6:	203c      	movs	r0, #60	; 0x3c
 80007e8:	f000 fc9e 	bl	8001128 <i2c_read_reg>
 80007ec:	0200      	lsls	r0, r0, #8
 80007ee:	b285      	uxth	r5, r0
 80007f0:	2106      	movs	r1, #6
 80007f2:	203c      	movs	r0, #60	; 0x3c
 80007f4:	80a5      	strh	r5, [r4, #4]
 80007f6:	f000 fc97 	bl	8001128 <i2c_read_reg>
 80007fa:	4328      	orrs	r0, r5
 80007fc:	80a0      	strh	r0, [r4, #4]
 80007fe:	bd38      	pop	{r3, r4, r5, pc}
 8000800:	20000968 	.word	0x20000968

08000804 <main_thread>:
 8000804:	b510      	push	{r4, lr}
 8000806:	480c      	ldr	r0, [pc, #48]	; (8000838 <main_thread+0x34>)
 8000808:	f7ff fef6 	bl	80005f8 <printf_>
 800080c:	f7ff ff9e 	bl	800074c <hmc5883_init>
 8000810:	4604      	mov	r4, r0
 8000812:	2002      	movs	r0, #2
 8000814:	f001 fa1a 	bl	8001c4c <led_on>
 8000818:	f7ff ffc8 	bl	80007ac <hmc5883_read>
 800081c:	4b07      	ldr	r3, [pc, #28]	; (800083c <main_thread+0x38>)
 800081e:	4808      	ldr	r0, [pc, #32]	; (8000840 <main_thread+0x3c>)
 8000820:	f9b3 2004 	ldrsh.w	r2, [r3, #4]
 8000824:	4621      	mov	r1, r4
 8000826:	f7ff fee7 	bl	80005f8 <printf_>
 800082a:	2002      	movs	r0, #2
 800082c:	f001 fa18 	bl	8001c60 <led_off>
 8000830:	2064      	movs	r0, #100	; 0x64
 8000832:	f001 f9fb 	bl	8001c2c <timer_delay_ms>
 8000836:	e7ec      	b.n	8000812 <main_thread+0xe>
 8000838:	08001d50 	.word	0x08001d50
 800083c:	20000968 	.word	0x20000968
 8000840:	08001d8b 	.word	0x08001d8b

08000844 <uart_write>:
 8000844:	b507      	push	{r0, r1, r2, lr}
 8000846:	a902      	add	r1, sp, #8
 8000848:	2201      	movs	r2, #1
 800084a:	f801 0d01 	strb.w	r0, [r1, #-1]!
 800084e:	2364      	movs	r3, #100	; 0x64
 8000850:	4802      	ldr	r0, [pc, #8]	; (800085c <uart_write+0x18>)
 8000852:	f000 f965 	bl	8000b20 <HAL_UART_Transmit>
 8000856:	b003      	add	sp, #12
 8000858:	f85d fb04 	ldr.w	pc, [sp], #4
 800085c:	20000970 	.word	0x20000970

08000860 <uart_init>:
 8000860:	4b22      	ldr	r3, [pc, #136]	; (80008ec <uart_init+0x8c>)
 8000862:	b570      	push	{r4, r5, r6, lr}
 8000864:	6b1a      	ldr	r2, [r3, #48]	; 0x30
 8000866:	4d22      	ldr	r5, [pc, #136]	; (80008f0 <uart_init+0x90>)
 8000868:	f042 0204 	orr.w	r2, r2, #4
 800086c:	631a      	str	r2, [r3, #48]	; 0x30
 800086e:	6b1a      	ldr	r2, [r3, #48]	; 0x30
 8000870:	b088      	sub	sp, #32
 8000872:	f002 0204 	and.w	r2, r2, #4
 8000876:	9200      	str	r2, [sp, #0]
 8000878:	9a00      	ldr	r2, [sp, #0]
 800087a:	6b1a      	ldr	r2, [r3, #48]	; 0x30
 800087c:	f042 0204 	orr.w	r2, r2, #4
 8000880:	631a      	str	r2, [r3, #48]	; 0x30
 8000882:	6b1a      	ldr	r2, [r3, #48]	; 0x30
 8000884:	f002 0204 	and.w	r2, r2, #4
 8000888:	9201      	str	r2, [sp, #4]
 800088a:	9a01      	ldr	r2, [sp, #4]
 800088c:	6c5a      	ldr	r2, [r3, #68]	; 0x44
 800088e:	f042 0220 	orr.w	r2, r2, #32
 8000892:	645a      	str	r2, [r3, #68]	; 0x44
 8000894:	6c5b      	ldr	r3, [r3, #68]	; 0x44
 8000896:	f003 0320 	and.w	r3, r3, #32
 800089a:	9302      	str	r3, [sp, #8]
 800089c:	9b02      	ldr	r3, [sp, #8]
 800089e:	2340      	movs	r3, #64	; 0x40
 80008a0:	2402      	movs	r4, #2
 80008a2:	9303      	str	r3, [sp, #12]
 80008a4:	2608      	movs	r6, #8
 80008a6:	2301      	movs	r3, #1
 80008a8:	4628      	mov	r0, r5
 80008aa:	a903      	add	r1, sp, #12
 80008ac:	9404      	str	r4, [sp, #16]
 80008ae:	9406      	str	r4, [sp, #24]
 80008b0:	9305      	str	r3, [sp, #20]
 80008b2:	9607      	str	r6, [sp, #28]
 80008b4:	f001 f85e 	bl	8001974 <HAL_GPIO_Init>
 80008b8:	2380      	movs	r3, #128	; 0x80
 80008ba:	4628      	mov	r0, r5
 80008bc:	a903      	add	r1, sp, #12
 80008be:	9303      	str	r3, [sp, #12]
 80008c0:	9404      	str	r4, [sp, #16]
 80008c2:	9607      	str	r6, [sp, #28]
 80008c4:	f001 f856 	bl	8001974 <HAL_GPIO_Init>
 80008c8:	480a      	ldr	r0, [pc, #40]	; (80008f4 <uart_init+0x94>)
 80008ca:	4b0b      	ldr	r3, [pc, #44]	; (80008f8 <uart_init+0x98>)
 80008cc:	f44f 34e1 	mov.w	r4, #115200	; 0x1c200
 80008d0:	e880 0018 	stmia.w	r0, {r3, r4}
 80008d4:	220c      	movs	r2, #12
 80008d6:	2300      	movs	r3, #0
 80008d8:	6083      	str	r3, [r0, #8]
 80008da:	60c3      	str	r3, [r0, #12]
 80008dc:	6103      	str	r3, [r0, #16]
 80008de:	6183      	str	r3, [r0, #24]
 80008e0:	6142      	str	r2, [r0, #20]
 80008e2:	6243      	str	r3, [r0, #36]	; 0x24
 80008e4:	f000 fb20 	bl	8000f28 <HAL_UART_Init>
 80008e8:	b008      	add	sp, #32
 80008ea:	bd70      	pop	{r4, r5, r6, pc}
 80008ec:	40023800 	.word	0x40023800
 80008f0:	40020800 	.word	0x40020800
 80008f4:	20000970 	.word	0x20000970
 80008f8:	40011400 	.word	0x40011400

080008fc <SystemClock_Config>:
 80008fc:	b510      	push	{r4, lr}
 80008fe:	b092      	sub	sp, #72	; 0x48
 8000900:	2301      	movs	r3, #1
 8000902:	9306      	str	r3, [sp, #24]
 8000904:	f44f 3380 	mov.w	r3, #65536	; 0x10000
 8000908:	9307      	str	r3, [sp, #28]
 800090a:	f44f 0380 	mov.w	r3, #4194304	; 0x400000
 800090e:	930d      	str	r3, [sp, #52]	; 0x34
 8000910:	2319      	movs	r3, #25
 8000912:	930e      	str	r3, [sp, #56]	; 0x38
 8000914:	f44f 73d8 	mov.w	r3, #432	; 0x1b0
 8000918:	2402      	movs	r4, #2
 800091a:	930f      	str	r3, [sp, #60]	; 0x3c
 800091c:	a806      	add	r0, sp, #24
 800091e:	2309      	movs	r3, #9
 8000920:	940c      	str	r4, [sp, #48]	; 0x30
 8000922:	9410      	str	r4, [sp, #64]	; 0x40
 8000924:	9311      	str	r3, [sp, #68]	; 0x44
 8000926:	f000 fc19 	bl	800115c <HAL_RCC_OscConfig>
 800092a:	b100      	cbz	r0, 800092e <SystemClock_Config+0x32>
 800092c:	e7fe      	b.n	800092c <SystemClock_Config+0x30>
 800092e:	f000 fb57 	bl	8000fe0 <HAL_PWREx_EnableOverDrive>
 8000932:	b100      	cbz	r0, 8000936 <SystemClock_Config+0x3a>
 8000934:	e7fe      	b.n	8000934 <SystemClock_Config+0x38>
 8000936:	230f      	movs	r3, #15
 8000938:	9301      	str	r3, [sp, #4]
 800093a:	9003      	str	r0, [sp, #12]
 800093c:	f44f 53a0 	mov.w	r3, #5120	; 0x1400
 8000940:	9005      	str	r0, [sp, #20]
 8000942:	2107      	movs	r1, #7
 8000944:	a801      	add	r0, sp, #4
 8000946:	9402      	str	r4, [sp, #8]
 8000948:	9304      	str	r3, [sp, #16]
 800094a:	f000 fddb 	bl	8001504 <HAL_RCC_ClockConfig>
 800094e:	b100      	cbz	r0, 8000952 <SystemClock_Config+0x56>
 8000950:	e7fe      	b.n	8000950 <SystemClock_Config+0x54>
 8000952:	b012      	add	sp, #72	; 0x48
 8000954:	bd10      	pop	{r4, pc}
	...

08000958 <lib_low_level_init>:
 8000958:	b5f0      	push	{r4, r5, r6, r7, lr}
 800095a:	4c49      	ldr	r4, [pc, #292]	; (8000a80 <lib_low_level_init+0x128>)
 800095c:	4d49      	ldr	r5, [pc, #292]	; (8000a84 <lib_low_level_init+0x12c>)
 800095e:	6a63      	ldr	r3, [r4, #36]	; 0x24
 8000960:	f423 3380 	bic.w	r3, r3, #65536	; 0x10000
 8000964:	6263      	str	r3, [r4, #36]	; 0x24
 8000966:	686b      	ldr	r3, [r5, #4]
 8000968:	f023 0301 	bic.w	r3, r3, #1
 800096c:	b085      	sub	sp, #20
 800096e:	606b      	str	r3, [r5, #4]
 8000970:	4b45      	ldr	r3, [pc, #276]	; (8000a88 <lib_low_level_init+0x130>)
 8000972:	9301      	str	r3, [sp, #4]
 8000974:	2311      	movs	r3, #17
 8000976:	f88d 3008 	strb.w	r3, [sp, #8]
 800097a:	2303      	movs	r3, #3
 800097c:	2201      	movs	r2, #1
 800097e:	f88d 300b 	strb.w	r3, [sp, #11]
 8000982:	4668      	mov	r0, sp
 8000984:	2300      	movs	r3, #0
 8000986:	f88d 300f 	strb.w	r3, [sp, #15]
 800098a:	f88d 300d 	strb.w	r3, [sp, #13]
 800098e:	f88d 3001 	strb.w	r3, [sp, #1]
 8000992:	f88d 300a 	strb.w	r3, [sp, #10]
 8000996:	f88d 3009 	strb.w	r3, [sp, #9]
 800099a:	f88d 300c 	strb.w	r3, [sp, #12]
 800099e:	f88d 2000 	strb.w	r2, [sp]
 80009a2:	f88d 200e 	strb.w	r2, [sp, #14]
 80009a6:	f000 ff81 	bl	80018ac <HAL_MPU_ConfigRegion>
 80009aa:	2305      	movs	r3, #5
 80009ac:	606b      	str	r3, [r5, #4]
 80009ae:	6a63      	ldr	r3, [r4, #36]	; 0x24
 80009b0:	f443 3380 	orr.w	r3, r3, #65536	; 0x10000
 80009b4:	6263      	str	r3, [r4, #36]	; 0x24
 80009b6:	f3bf 8f4f 	dsb	sy
 80009ba:	f3bf 8f6f 	isb	sy
 80009be:	4b30      	ldr	r3, [pc, #192]	; (8000a80 <lib_low_level_init+0x128>)
 80009c0:	2200      	movs	r2, #0
 80009c2:	f8c3 2250 	str.w	r2, [r3, #592]	; 0x250
 80009c6:	695a      	ldr	r2, [r3, #20]
 80009c8:	f442 3200 	orr.w	r2, r2, #131072	; 0x20000
 80009cc:	615a      	str	r2, [r3, #20]
 80009ce:	f3bf 8f4f 	dsb	sy
 80009d2:	f3bf 8f6f 	isb	sy
 80009d6:	2200      	movs	r2, #0
 80009d8:	f8c3 2084 	str.w	r2, [r3, #132]	; 0x84
 80009dc:	f8d3 2080 	ldr.w	r2, [r3, #128]	; 0x80
 80009e0:	f002 0407 	and.w	r4, r2, #7
 80009e4:	f3c2 334e 	ubfx	r3, r2, #13, #15
 80009e8:	3404      	adds	r4, #4
 80009ea:	f3c2 00c9 	ubfx	r0, r2, #3, #10
 80009ee:	fab0 f580 	clz	r5, r0
 80009f2:	f005 051f 	and.w	r5, r5, #31
 80009f6:	f3bf 8f4f 	dsb	sy
 80009fa:	fa03 f704 	lsl.w	r7, r3, r4
 80009fe:	4602      	mov	r2, r0
 8000a00:	fa02 f605 	lsl.w	r6, r2, r5
 8000a04:	491e      	ldr	r1, [pc, #120]	; (8000a80 <lib_low_level_init+0x128>)
 8000a06:	433e      	orrs	r6, r7
 8000a08:	f112 32ff 	adds.w	r2, r2, #4294967295
 8000a0c:	f8c1 6260 	str.w	r6, [r1, #608]	; 0x260
 8000a10:	d2f6      	bcs.n	8000a00 <lib_low_level_init+0xa8>
 8000a12:	f113 33ff 	adds.w	r3, r3, #4294967295
 8000a16:	d2f0      	bcs.n	80009fa <lib_low_level_init+0xa2>
 8000a18:	f3bf 8f4f 	dsb	sy
 8000a1c:	694b      	ldr	r3, [r1, #20]
 8000a1e:	f443 3380 	orr.w	r3, r3, #65536	; 0x10000
 8000a22:	614b      	str	r3, [r1, #20]
 8000a24:	f3bf 8f4f 	dsb	sy
 8000a28:	f3bf 8f6f 	isb	sy
 8000a2c:	f000 fac0 	bl	8000fb0 <HAL_Init>
 8000a30:	f7ff ff64 	bl	80008fc <SystemClock_Config>
 8000a34:	f001 f91e 	bl	8001c74 <gpio_init>
 8000a38:	f7ff ff12 	bl	8000860 <uart_init>
 8000a3c:	f001 f8a0 	bl	8001b80 <timer_init>
 8000a40:	2041      	movs	r0, #65	; 0x41
 8000a42:	f7ff feff 	bl	8000844 <uart_write>
 8000a46:	2042      	movs	r0, #66	; 0x42
 8000a48:	f7ff fefc 	bl	8000844 <uart_write>
 8000a4c:	2043      	movs	r0, #67	; 0x43
 8000a4e:	f7ff fef9 	bl	8000844 <uart_write>
 8000a52:	2044      	movs	r0, #68	; 0x44
 8000a54:	f7ff fef6 	bl	8000844 <uart_write>
 8000a58:	2002      	movs	r0, #2
 8000a5a:	f001 f8f7 	bl	8001c4c <led_on>
 8000a5e:	480b      	ldr	r0, [pc, #44]	; (8000a8c <lib_low_level_init+0x134>)
 8000a60:	f001 f8d0 	bl	8001c04 <timer_delay_loops>
 8000a64:	2002      	movs	r0, #2
 8000a66:	f001 f8fb 	bl	8001c60 <led_off>
 8000a6a:	4809      	ldr	r0, [pc, #36]	; (8000a90 <lib_low_level_init+0x138>)
 8000a6c:	f001 f8ca 	bl	8001c04 <timer_delay_loops>
 8000a70:	2441      	movs	r4, #65	; 0x41
 8000a72:	b2e0      	uxtb	r0, r4
 8000a74:	3401      	adds	r4, #1
 8000a76:	f7ff fee5 	bl	8000844 <uart_write>
 8000a7a:	2c5a      	cmp	r4, #90	; 0x5a
 8000a7c:	d1f9      	bne.n	8000a72 <lib_low_level_init+0x11a>
 8000a7e:	e7eb      	b.n	8000a58 <lib_low_level_init+0x100>
 8000a80:	e000ed00 	.word	0xe000ed00
 8000a84:	e000ed90 	.word	0xe000ed90
 8000a88:	20010000 	.word	0x20010000
 8000a8c:	000f4240 	.word	0x000f4240
 8000a90:	00989680 	.word	0x00989680

08000a94 <HAL_UART_MspInit>:
 8000a94:	4770      	bx	lr

08000a96 <UART_WaitOnFlagUntilTimeout>:
 8000a96:	e92d 41f0 	stmdb	sp!, {r4, r5, r6, r7, r8, lr}
 8000a9a:	4604      	mov	r4, r0
 8000a9c:	460e      	mov	r6, r1
 8000a9e:	4690      	mov	r8, r2
 8000aa0:	461d      	mov	r5, r3
 8000aa2:	f000 fa97 	bl	8000fd4 <HAL_GetTick>
 8000aa6:	4607      	mov	r7, r0
 8000aa8:	f1b8 0f00 	cmp.w	r8, #0
 8000aac:	d136      	bne.n	8000b1c <UART_WaitOnFlagUntilTimeout+0x86>
 8000aae:	6822      	ldr	r2, [r4, #0]
 8000ab0:	69d3      	ldr	r3, [r2, #28]
 8000ab2:	4033      	ands	r3, r6
 8000ab4:	42b3      	cmp	r3, r6
 8000ab6:	d00e      	beq.n	8000ad6 <UART_WaitOnFlagUntilTimeout+0x40>
 8000ab8:	1c69      	adds	r1, r5, #1
 8000aba:	d0f9      	beq.n	8000ab0 <UART_WaitOnFlagUntilTimeout+0x1a>
 8000abc:	b17d      	cbz	r5, 8000ade <UART_WaitOnFlagUntilTimeout+0x48>
 8000abe:	f000 fa89 	bl	8000fd4 <HAL_GetTick>
 8000ac2:	1bc0      	subs	r0, r0, r7
 8000ac4:	42a8      	cmp	r0, r5
 8000ac6:	d3f2      	bcc.n	8000aae <UART_WaitOnFlagUntilTimeout+0x18>
 8000ac8:	e009      	b.n	8000ade <UART_WaitOnFlagUntilTimeout+0x48>
 8000aca:	1c6b      	adds	r3, r5, #1
 8000acc:	d106      	bne.n	8000adc <UART_WaitOnFlagUntilTimeout+0x46>
 8000ace:	69d3      	ldr	r3, [r2, #28]
 8000ad0:	4033      	ands	r3, r6
 8000ad2:	42b3      	cmp	r3, r6
 8000ad4:	d0f9      	beq.n	8000aca <UART_WaitOnFlagUntilTimeout+0x34>
 8000ad6:	2000      	movs	r0, #0
 8000ad8:	e8bd 81f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, pc}
 8000adc:	b9cd      	cbnz	r5, 8000b12 <UART_WaitOnFlagUntilTimeout+0x7c>
 8000ade:	6823      	ldr	r3, [r4, #0]
 8000ae0:	681a      	ldr	r2, [r3, #0]
 8000ae2:	f022 0280 	bic.w	r2, r2, #128	; 0x80
 8000ae6:	601a      	str	r2, [r3, #0]
 8000ae8:	681a      	ldr	r2, [r3, #0]
 8000aea:	f022 0220 	bic.w	r2, r2, #32
 8000aee:	601a      	str	r2, [r3, #0]
 8000af0:	681a      	ldr	r2, [r3, #0]
 8000af2:	f422 7280 	bic.w	r2, r2, #256	; 0x100
 8000af6:	601a      	str	r2, [r3, #0]
 8000af8:	689a      	ldr	r2, [r3, #8]
 8000afa:	f022 0201 	bic.w	r2, r2, #1
 8000afe:	609a      	str	r2, [r3, #8]
 8000b00:	2301      	movs	r3, #1
 8000b02:	f884 3069 	strb.w	r3, [r4, #105]	; 0x69
 8000b06:	2300      	movs	r3, #0
 8000b08:	f884 3068 	strb.w	r3, [r4, #104]	; 0x68
 8000b0c:	2003      	movs	r0, #3
 8000b0e:	e8bd 81f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, pc}
 8000b12:	f000 fa5f 	bl	8000fd4 <HAL_GetTick>
 8000b16:	1bc0      	subs	r0, r0, r7
 8000b18:	42a8      	cmp	r0, r5
 8000b1a:	d2e0      	bcs.n	8000ade <UART_WaitOnFlagUntilTimeout+0x48>
 8000b1c:	6822      	ldr	r2, [r4, #0]
 8000b1e:	e7d6      	b.n	8000ace <UART_WaitOnFlagUntilTimeout+0x38>

08000b20 <HAL_UART_Transmit>:
 8000b20:	b570      	push	{r4, r5, r6, lr}
 8000b22:	461e      	mov	r6, r3
 8000b24:	f890 3069 	ldrb.w	r3, [r0, #105]	; 0x69
 8000b28:	2b01      	cmp	r3, #1
 8000b2a:	4604      	mov	r4, r0
 8000b2c:	460d      	mov	r5, r1
 8000b2e:	d003      	beq.n	8000b38 <HAL_UART_Transmit+0x18>
 8000b30:	f890 3069 	ldrb.w	r3, [r0, #105]	; 0x69
 8000b34:	2b22      	cmp	r3, #34	; 0x22
 8000b36:	d14e      	bne.n	8000bd6 <HAL_UART_Transmit+0xb6>
 8000b38:	2d00      	cmp	r5, #0
 8000b3a:	d04a      	beq.n	8000bd2 <HAL_UART_Transmit+0xb2>
 8000b3c:	2a00      	cmp	r2, #0
 8000b3e:	d048      	beq.n	8000bd2 <HAL_UART_Transmit+0xb2>
 8000b40:	f894 3068 	ldrb.w	r3, [r4, #104]	; 0x68
 8000b44:	2b01      	cmp	r3, #1
 8000b46:	d046      	beq.n	8000bd6 <HAL_UART_Transmit+0xb6>
 8000b48:	2301      	movs	r3, #1
 8000b4a:	f884 3068 	strb.w	r3, [r4, #104]	; 0x68
 8000b4e:	2300      	movs	r3, #0
 8000b50:	66e3      	str	r3, [r4, #108]	; 0x6c
 8000b52:	f894 3069 	ldrb.w	r3, [r4, #105]	; 0x69
 8000b56:	f8a4 2050 	strh.w	r2, [r4, #80]	; 0x50
 8000b5a:	2b22      	cmp	r3, #34	; 0x22
 8000b5c:	bf0c      	ite	eq
 8000b5e:	2332      	moveq	r3, #50	; 0x32
 8000b60:	2312      	movne	r3, #18
 8000b62:	f884 3069 	strb.w	r3, [r4, #105]	; 0x69
 8000b66:	f8a4 2052 	strh.w	r2, [r4, #82]	; 0x52
 8000b6a:	f8b4 2052 	ldrh.w	r2, [r4, #82]	; 0x52
 8000b6e:	b1ea      	cbz	r2, 8000bac <HAL_UART_Transmit+0x8c>
 8000b70:	3a01      	subs	r2, #1
 8000b72:	f8a4 2052 	strh.w	r2, [r4, #82]	; 0x52
 8000b76:	4620      	mov	r0, r4
 8000b78:	2180      	movs	r1, #128	; 0x80
 8000b7a:	2200      	movs	r2, #0
 8000b7c:	4633      	mov	r3, r6
 8000b7e:	f7ff ff8a 	bl	8000a96 <UART_WaitOnFlagUntilTimeout>
 8000b82:	b108      	cbz	r0, 8000b88 <HAL_UART_Transmit+0x68>
 8000b84:	2003      	movs	r0, #3
 8000b86:	bd70      	pop	{r4, r5, r6, pc}
 8000b88:	68a3      	ldr	r3, [r4, #8]
 8000b8a:	f5b3 5f80 	cmp.w	r3, #4096	; 0x1000
 8000b8e:	6823      	ldr	r3, [r4, #0]
 8000b90:	d108      	bne.n	8000ba4 <HAL_UART_Transmit+0x84>
 8000b92:	6922      	ldr	r2, [r4, #16]
 8000b94:	b932      	cbnz	r2, 8000ba4 <HAL_UART_Transmit+0x84>
 8000b96:	f835 2b02 	ldrh.w	r2, [r5], #2
 8000b9a:	f3c2 0208 	ubfx	r2, r2, #0, #9
 8000b9e:	b292      	uxth	r2, r2
 8000ba0:	629a      	str	r2, [r3, #40]	; 0x28
 8000ba2:	e7e2      	b.n	8000b6a <HAL_UART_Transmit+0x4a>
 8000ba4:	782a      	ldrb	r2, [r5, #0]
 8000ba6:	3501      	adds	r5, #1
 8000ba8:	629a      	str	r2, [r3, #40]	; 0x28
 8000baa:	e7de      	b.n	8000b6a <HAL_UART_Transmit+0x4a>
 8000bac:	4620      	mov	r0, r4
 8000bae:	2140      	movs	r1, #64	; 0x40
 8000bb0:	4633      	mov	r3, r6
 8000bb2:	f7ff ff70 	bl	8000a96 <UART_WaitOnFlagUntilTimeout>
 8000bb6:	2800      	cmp	r0, #0
 8000bb8:	d1e4      	bne.n	8000b84 <HAL_UART_Transmit+0x64>
 8000bba:	f894 3069 	ldrb.w	r3, [r4, #105]	; 0x69
 8000bbe:	2b32      	cmp	r3, #50	; 0x32
 8000bc0:	bf0c      	ite	eq
 8000bc2:	2322      	moveq	r3, #34	; 0x22
 8000bc4:	2301      	movne	r3, #1
 8000bc6:	2000      	movs	r0, #0
 8000bc8:	f884 3069 	strb.w	r3, [r4, #105]	; 0x69
 8000bcc:	f884 0068 	strb.w	r0, [r4, #104]	; 0x68
 8000bd0:	bd70      	pop	{r4, r5, r6, pc}
 8000bd2:	2001      	movs	r0, #1
 8000bd4:	bd70      	pop	{r4, r5, r6, pc}
 8000bd6:	2002      	movs	r0, #2
 8000bd8:	bd70      	pop	{r4, r5, r6, pc}
	...

08000bdc <UART_SetConfig>:
 8000bdc:	b538      	push	{r3, r4, r5, lr}
 8000bde:	4604      	mov	r4, r0
 8000be0:	6805      	ldr	r5, [r0, #0]
 8000be2:	68a2      	ldr	r2, [r4, #8]
 8000be4:	6921      	ldr	r1, [r4, #16]
 8000be6:	69c3      	ldr	r3, [r0, #28]
 8000be8:	6828      	ldr	r0, [r5, #0]
 8000bea:	4311      	orrs	r1, r2
 8000bec:	6962      	ldr	r2, [r4, #20]
 8000bee:	430a      	orrs	r2, r1
 8000bf0:	ea42 0103 	orr.w	r1, r2, r3
 8000bf4:	4a81      	ldr	r2, [pc, #516]	; (8000dfc <UART_SetConfig+0x220>)
 8000bf6:	4002      	ands	r2, r0
 8000bf8:	430a      	orrs	r2, r1
 8000bfa:	602a      	str	r2, [r5, #0]
 8000bfc:	6869      	ldr	r1, [r5, #4]
 8000bfe:	68e2      	ldr	r2, [r4, #12]
 8000c00:	f421 5140 	bic.w	r1, r1, #12288	; 0x3000
 8000c04:	430a      	orrs	r2, r1
 8000c06:	606a      	str	r2, [r5, #4]
 8000c08:	68a8      	ldr	r0, [r5, #8]
 8000c0a:	6a21      	ldr	r1, [r4, #32]
 8000c0c:	69a2      	ldr	r2, [r4, #24]
 8000c0e:	f420 6030 	bic.w	r0, r0, #2816	; 0xb00
 8000c12:	430a      	orrs	r2, r1
 8000c14:	4302      	orrs	r2, r0
 8000c16:	60aa      	str	r2, [r5, #8]
 8000c18:	4a79      	ldr	r2, [pc, #484]	; (8000e00 <UART_SetConfig+0x224>)
 8000c1a:	4295      	cmp	r5, r2
 8000c1c:	d107      	bne.n	8000c2e <UART_SetConfig+0x52>
 8000c1e:	f502 3294 	add.w	r2, r2, #75776	; 0x12800
 8000c22:	4978      	ldr	r1, [pc, #480]	; (8000e04 <UART_SetConfig+0x228>)
 8000c24:	f8d2 2090 	ldr.w	r2, [r2, #144]	; 0x90
 8000c28:	f002 0203 	and.w	r2, r2, #3
 8000c2c:	e009      	b.n	8000c42 <UART_SetConfig+0x66>
 8000c2e:	4a76      	ldr	r2, [pc, #472]	; (8000e08 <UART_SetConfig+0x22c>)
 8000c30:	4295      	cmp	r5, r2
 8000c32:	d10c      	bne.n	8000c4e <UART_SetConfig+0x72>
 8000c34:	f502 32fa 	add.w	r2, r2, #128000	; 0x1f400
 8000c38:	4974      	ldr	r1, [pc, #464]	; (8000e0c <UART_SetConfig+0x230>)
 8000c3a:	f8d2 2090 	ldr.w	r2, [r2, #144]	; 0x90
 8000c3e:	f002 020c 	and.w	r2, r2, #12
 8000c42:	f5b3 4f00 	cmp.w	r3, #32768	; 0x8000
 8000c46:	5c8a      	ldrb	r2, [r1, r2]
 8000c48:	f040 80b1 	bne.w	8000dae <UART_SetConfig+0x1d2>
 8000c4c:	e072      	b.n	8000d34 <UART_SetConfig+0x158>
 8000c4e:	4a70      	ldr	r2, [pc, #448]	; (8000e10 <UART_SetConfig+0x234>)
 8000c50:	4295      	cmp	r5, r2
 8000c52:	d10d      	bne.n	8000c70 <UART_SetConfig+0x94>
 8000c54:	f502 32f8 	add.w	r2, r2, #126976	; 0x1f000
 8000c58:	f8d2 2090 	ldr.w	r2, [r2, #144]	; 0x90
 8000c5c:	f002 0230 	and.w	r2, r2, #48	; 0x30
 8000c60:	2a10      	cmp	r2, #16
 8000c62:	f000 8082 	beq.w	8000d6a <UART_SetConfig+0x18e>
 8000c66:	d95d      	bls.n	8000d24 <UART_SetConfig+0x148>
 8000c68:	2a20      	cmp	r2, #32
 8000c6a:	d078      	beq.n	8000d5e <UART_SetConfig+0x182>
 8000c6c:	2a30      	cmp	r2, #48	; 0x30
 8000c6e:	e00e      	b.n	8000c8e <UART_SetConfig+0xb2>
 8000c70:	4a68      	ldr	r2, [pc, #416]	; (8000e14 <UART_SetConfig+0x238>)
 8000c72:	4295      	cmp	r5, r2
 8000c74:	d10d      	bne.n	8000c92 <UART_SetConfig+0xb6>
 8000c76:	f502 32f6 	add.w	r2, r2, #125952	; 0x1ec00
 8000c7a:	f8d2 2090 	ldr.w	r2, [r2, #144]	; 0x90
 8000c7e:	f002 02c0 	and.w	r2, r2, #192	; 0xc0
 8000c82:	2a40      	cmp	r2, #64	; 0x40
 8000c84:	d071      	beq.n	8000d6a <UART_SetConfig+0x18e>
 8000c86:	d94d      	bls.n	8000d24 <UART_SetConfig+0x148>
 8000c88:	2a80      	cmp	r2, #128	; 0x80
 8000c8a:	d068      	beq.n	8000d5e <UART_SetConfig+0x182>
 8000c8c:	2ac0      	cmp	r2, #192	; 0xc0
 8000c8e:	d076      	beq.n	8000d7e <UART_SetConfig+0x1a2>
 8000c90:	e080      	b.n	8000d94 <UART_SetConfig+0x1b8>
 8000c92:	4a61      	ldr	r2, [pc, #388]	; (8000e18 <UART_SetConfig+0x23c>)
 8000c94:	4295      	cmp	r5, r2
 8000c96:	d10f      	bne.n	8000cb8 <UART_SetConfig+0xdc>
 8000c98:	f502 32f4 	add.w	r2, r2, #124928	; 0x1e800
 8000c9c:	f8d2 2090 	ldr.w	r2, [r2, #144]	; 0x90
 8000ca0:	f402 7240 	and.w	r2, r2, #768	; 0x300
 8000ca4:	f5b2 7f80 	cmp.w	r2, #256	; 0x100
 8000ca8:	d05f      	beq.n	8000d6a <UART_SetConfig+0x18e>
 8000caa:	d93b      	bls.n	8000d24 <UART_SetConfig+0x148>
 8000cac:	f5b2 7f00 	cmp.w	r2, #512	; 0x200
 8000cb0:	d055      	beq.n	8000d5e <UART_SetConfig+0x182>
 8000cb2:	f5b2 7f40 	cmp.w	r2, #768	; 0x300
 8000cb6:	e7ea      	b.n	8000c8e <UART_SetConfig+0xb2>
 8000cb8:	4a58      	ldr	r2, [pc, #352]	; (8000e1c <UART_SetConfig+0x240>)
 8000cba:	4295      	cmp	r5, r2
 8000cbc:	d112      	bne.n	8000ce4 <UART_SetConfig+0x108>
 8000cbe:	f502 3292 	add.w	r2, r2, #74752	; 0x12400
 8000cc2:	f8d2 2090 	ldr.w	r2, [r2, #144]	; 0x90
 8000cc6:	f402 6240 	and.w	r2, r2, #3072	; 0xc00
 8000cca:	f5b2 6f80 	cmp.w	r2, #1024	; 0x400
 8000cce:	d04c      	beq.n	8000d6a <UART_SetConfig+0x18e>
 8000cd0:	d802      	bhi.n	8000cd8 <UART_SetConfig+0xfc>
 8000cd2:	2a00      	cmp	r2, #0
 8000cd4:	d03d      	beq.n	8000d52 <UART_SetConfig+0x176>
 8000cd6:	e05d      	b.n	8000d94 <UART_SetConfig+0x1b8>
 8000cd8:	f5b2 6f00 	cmp.w	r2, #2048	; 0x800
 8000cdc:	d03f      	beq.n	8000d5e <UART_SetConfig+0x182>
 8000cde:	f5b2 6f40 	cmp.w	r2, #3072	; 0xc00
 8000ce2:	e7d4      	b.n	8000c8e <UART_SetConfig+0xb2>
 8000ce4:	4a4e      	ldr	r2, [pc, #312]	; (8000e20 <UART_SetConfig+0x244>)
 8000ce6:	4295      	cmp	r5, r2
 8000ce8:	d10f      	bne.n	8000d0a <UART_SetConfig+0x12e>
 8000cea:	f502 32e0 	add.w	r2, r2, #114688	; 0x1c000
 8000cee:	f8d2 2090 	ldr.w	r2, [r2, #144]	; 0x90
 8000cf2:	f402 5240 	and.w	r2, r2, #12288	; 0x3000
 8000cf6:	f5b2 5f80 	cmp.w	r2, #4096	; 0x1000
 8000cfa:	d036      	beq.n	8000d6a <UART_SetConfig+0x18e>
 8000cfc:	d912      	bls.n	8000d24 <UART_SetConfig+0x148>
 8000cfe:	f5b2 5f00 	cmp.w	r2, #8192	; 0x2000
 8000d02:	d02c      	beq.n	8000d5e <UART_SetConfig+0x182>
 8000d04:	f5b2 5f40 	cmp.w	r2, #12288	; 0x3000
 8000d08:	e7c1      	b.n	8000c8e <UART_SetConfig+0xb2>
 8000d0a:	4a46      	ldr	r2, [pc, #280]	; (8000e24 <UART_SetConfig+0x248>)
 8000d0c:	4295      	cmp	r5, r2
 8000d0e:	d141      	bne.n	8000d94 <UART_SetConfig+0x1b8>
 8000d10:	f502 32de 	add.w	r2, r2, #113664	; 0x1bc00
 8000d14:	f8d2 2090 	ldr.w	r2, [r2, #144]	; 0x90
 8000d18:	f402 4240 	and.w	r2, r2, #49152	; 0xc000
 8000d1c:	f5b2 4f80 	cmp.w	r2, #16384	; 0x4000
 8000d20:	d023      	beq.n	8000d6a <UART_SetConfig+0x18e>
 8000d22:	d801      	bhi.n	8000d28 <UART_SetConfig+0x14c>
 8000d24:	b17a      	cbz	r2, 8000d46 <UART_SetConfig+0x16a>
 8000d26:	e035      	b.n	8000d94 <UART_SetConfig+0x1b8>
 8000d28:	f5b2 4f00 	cmp.w	r2, #32768	; 0x8000
 8000d2c:	d017      	beq.n	8000d5e <UART_SetConfig+0x182>
 8000d2e:	f5b2 4f40 	cmp.w	r2, #49152	; 0xc000
 8000d32:	e7ac      	b.n	8000c8e <UART_SetConfig+0xb2>
 8000d34:	2a08      	cmp	r2, #8
 8000d36:	d830      	bhi.n	8000d9a <UART_SetConfig+0x1be>
 8000d38:	e8df f002 	tbb	[pc, r2]
 8000d3c:	2f140e08 	.word	0x2f140e08
 8000d40:	2f2f2f1a 	.word	0x2f2f2f1a
 8000d44:	24          	.byte	0x24
 8000d45:	00          	.byte	0x00
 8000d46:	f5b3 4f00 	cmp.w	r3, #32768	; 0x8000
 8000d4a:	d139      	bne.n	8000dc0 <UART_SetConfig+0x1e4>
 8000d4c:	f000 fd24 	bl	8001798 <HAL_RCC_GetPCLK1Freq>
 8000d50:	e010      	b.n	8000d74 <UART_SetConfig+0x198>
 8000d52:	f5b3 4f00 	cmp.w	r3, #32768	; 0x8000
 8000d56:	d136      	bne.n	8000dc6 <UART_SetConfig+0x1ea>
 8000d58:	f000 fd36 	bl	80017c8 <HAL_RCC_GetPCLK2Freq>
 8000d5c:	e00a      	b.n	8000d74 <UART_SetConfig+0x198>
 8000d5e:	f5b3 4f00 	cmp.w	r3, #32768	; 0x8000
 8000d62:	d133      	bne.n	8000dcc <UART_SetConfig+0x1f0>
 8000d64:	6863      	ldr	r3, [r4, #4]
 8000d66:	4a30      	ldr	r2, [pc, #192]	; (8000e28 <UART_SetConfig+0x24c>)
 8000d68:	e00f      	b.n	8000d8a <UART_SetConfig+0x1ae>
 8000d6a:	f5b3 4f00 	cmp.w	r3, #32768	; 0x8000
 8000d6e:	d133      	bne.n	8000dd8 <UART_SetConfig+0x1fc>
 8000d70:	f000 fcb0 	bl	80016d4 <HAL_RCC_GetSysClockFreq>
 8000d74:	6863      	ldr	r3, [r4, #4]
 8000d76:	0040      	lsls	r0, r0, #1
 8000d78:	fbb0 f3f3 	udiv	r3, r0, r3
 8000d7c:	e007      	b.n	8000d8e <UART_SetConfig+0x1b2>
 8000d7e:	f5b3 4f00 	cmp.w	r3, #32768	; 0x8000
 8000d82:	d130      	bne.n	8000de6 <UART_SetConfig+0x20a>
 8000d84:	6863      	ldr	r3, [r4, #4]
 8000d86:	f44f 3280 	mov.w	r2, #65536	; 0x10000
 8000d8a:	fbb2 f3f3 	udiv	r3, r2, r3
 8000d8e:	b29b      	uxth	r3, r3
 8000d90:	2000      	movs	r0, #0
 8000d92:	e004      	b.n	8000d9e <UART_SetConfig+0x1c2>
 8000d94:	f5b3 4f00 	cmp.w	r3, #32768	; 0x8000
 8000d98:	d12d      	bne.n	8000df6 <UART_SetConfig+0x21a>
 8000d9a:	2001      	movs	r0, #1
 8000d9c:	2300      	movs	r3, #0
 8000d9e:	f023 010f 	bic.w	r1, r3, #15
 8000da2:	6822      	ldr	r2, [r4, #0]
 8000da4:	f3c3 0342 	ubfx	r3, r3, #1, #3
 8000da8:	430b      	orrs	r3, r1
 8000daa:	60d3      	str	r3, [r2, #12]
 8000dac:	bd38      	pop	{r3, r4, r5, pc}
 8000dae:	2a08      	cmp	r2, #8
 8000db0:	d821      	bhi.n	8000df6 <UART_SetConfig+0x21a>
 8000db2:	e8df f002 	tbb	[pc, r2]
 8000db6:	0805      	.short	0x0805
 8000db8:	2011200b 	.word	0x2011200b
 8000dbc:	2020      	.short	0x2020
 8000dbe:	18          	.byte	0x18
 8000dbf:	00          	.byte	0x00
 8000dc0:	f000 fcea 	bl	8001798 <HAL_RCC_GetPCLK1Freq>
 8000dc4:	e00a      	b.n	8000ddc <UART_SetConfig+0x200>
 8000dc6:	f000 fcff 	bl	80017c8 <HAL_RCC_GetPCLK2Freq>
 8000dca:	e007      	b.n	8000ddc <UART_SetConfig+0x200>
 8000dcc:	6863      	ldr	r3, [r4, #4]
 8000dce:	4a17      	ldr	r2, [pc, #92]	; (8000e2c <UART_SetConfig+0x250>)
 8000dd0:	fbb2 f3f3 	udiv	r3, r2, r3
 8000dd4:	b29b      	uxth	r3, r3
 8000dd6:	e00b      	b.n	8000df0 <UART_SetConfig+0x214>
 8000dd8:	f000 fc7c 	bl	80016d4 <HAL_RCC_GetSysClockFreq>
 8000ddc:	6863      	ldr	r3, [r4, #4]
 8000dde:	fbb0 f0f3 	udiv	r0, r0, r3
 8000de2:	b283      	uxth	r3, r0
 8000de4:	e004      	b.n	8000df0 <UART_SetConfig+0x214>
 8000de6:	6863      	ldr	r3, [r4, #4]
 8000de8:	f44f 4200 	mov.w	r2, #32768	; 0x8000
 8000dec:	fbb2 f3f3 	udiv	r3, r2, r3
 8000df0:	60eb      	str	r3, [r5, #12]
 8000df2:	2000      	movs	r0, #0
 8000df4:	bd38      	pop	{r3, r4, r5, pc}
 8000df6:	2001      	movs	r0, #1
 8000df8:	bd38      	pop	{r3, r4, r5, pc}
 8000dfa:	bf00      	nop
 8000dfc:	efff69f3 	.word	0xefff69f3
 8000e00:	40011000 	.word	0x40011000
 8000e04:	08001da2 	.word	0x08001da2
 8000e08:	40004400 	.word	0x40004400
 8000e0c:	08001d95 	.word	0x08001d95
 8000e10:	40004800 	.word	0x40004800
 8000e14:	40004c00 	.word	0x40004c00
 8000e18:	40005000 	.word	0x40005000
 8000e1c:	40011400 	.word	0x40011400
 8000e20:	40007800 	.word	0x40007800
 8000e24:	40007c00 	.word	0x40007c00
 8000e28:	01e84800 	.word	0x01e84800
 8000e2c:	00f42400 	.word	0x00f42400

08000e30 <UART_AdvFeatureConfig>:
 8000e30:	6a43      	ldr	r3, [r0, #36]	; 0x24
 8000e32:	b510      	push	{r4, lr}
 8000e34:	07dc      	lsls	r4, r3, #31
 8000e36:	d506      	bpl.n	8000e46 <UART_AdvFeatureConfig+0x16>
 8000e38:	6802      	ldr	r2, [r0, #0]
 8000e3a:	6a81      	ldr	r1, [r0, #40]	; 0x28
 8000e3c:	6854      	ldr	r4, [r2, #4]
 8000e3e:	f424 3400 	bic.w	r4, r4, #131072	; 0x20000
 8000e42:	4321      	orrs	r1, r4
 8000e44:	6051      	str	r1, [r2, #4]
 8000e46:	0799      	lsls	r1, r3, #30
 8000e48:	d506      	bpl.n	8000e58 <UART_AdvFeatureConfig+0x28>
 8000e4a:	6802      	ldr	r2, [r0, #0]
 8000e4c:	6ac1      	ldr	r1, [r0, #44]	; 0x2c
 8000e4e:	6854      	ldr	r4, [r2, #4]
 8000e50:	f424 3480 	bic.w	r4, r4, #65536	; 0x10000
 8000e54:	4321      	orrs	r1, r4
 8000e56:	6051      	str	r1, [r2, #4]
 8000e58:	075a      	lsls	r2, r3, #29
 8000e5a:	d506      	bpl.n	8000e6a <UART_AdvFeatureConfig+0x3a>
 8000e5c:	6802      	ldr	r2, [r0, #0]
 8000e5e:	6b01      	ldr	r1, [r0, #48]	; 0x30
 8000e60:	6854      	ldr	r4, [r2, #4]
 8000e62:	f424 2480 	bic.w	r4, r4, #262144	; 0x40000
 8000e66:	4321      	orrs	r1, r4
 8000e68:	6051      	str	r1, [r2, #4]
 8000e6a:	071c      	lsls	r4, r3, #28
 8000e6c:	d506      	bpl.n	8000e7c <UART_AdvFeatureConfig+0x4c>
 8000e6e:	6802      	ldr	r2, [r0, #0]
 8000e70:	6b41      	ldr	r1, [r0, #52]	; 0x34
 8000e72:	6854      	ldr	r4, [r2, #4]
 8000e74:	f424 4400 	bic.w	r4, r4, #32768	; 0x8000
 8000e78:	4321      	orrs	r1, r4
 8000e7a:	6051      	str	r1, [r2, #4]
 8000e7c:	06d9      	lsls	r1, r3, #27
 8000e7e:	d506      	bpl.n	8000e8e <UART_AdvFeatureConfig+0x5e>
 8000e80:	6802      	ldr	r2, [r0, #0]
 8000e82:	6b81      	ldr	r1, [r0, #56]	; 0x38
 8000e84:	6894      	ldr	r4, [r2, #8]
 8000e86:	f424 5480 	bic.w	r4, r4, #4096	; 0x1000
 8000e8a:	4321      	orrs	r1, r4
 8000e8c:	6091      	str	r1, [r2, #8]
 8000e8e:	069a      	lsls	r2, r3, #26
 8000e90:	d506      	bpl.n	8000ea0 <UART_AdvFeatureConfig+0x70>
 8000e92:	6802      	ldr	r2, [r0, #0]
 8000e94:	6bc1      	ldr	r1, [r0, #60]	; 0x3c
 8000e96:	6894      	ldr	r4, [r2, #8]
 8000e98:	f424 5400 	bic.w	r4, r4, #8192	; 0x2000
 8000e9c:	4321      	orrs	r1, r4
 8000e9e:	6091      	str	r1, [r2, #8]
 8000ea0:	065c      	lsls	r4, r3, #25
 8000ea2:	d50f      	bpl.n	8000ec4 <UART_AdvFeatureConfig+0x94>
 8000ea4:	6802      	ldr	r2, [r0, #0]
 8000ea6:	6c01      	ldr	r1, [r0, #64]	; 0x40
 8000ea8:	6854      	ldr	r4, [r2, #4]
 8000eaa:	f424 1480 	bic.w	r4, r4, #1048576	; 0x100000
 8000eae:	430c      	orrs	r4, r1
 8000eb0:	f5b1 1f80 	cmp.w	r1, #1048576	; 0x100000
 8000eb4:	6054      	str	r4, [r2, #4]
 8000eb6:	d105      	bne.n	8000ec4 <UART_AdvFeatureConfig+0x94>
 8000eb8:	6854      	ldr	r4, [r2, #4]
 8000eba:	6c41      	ldr	r1, [r0, #68]	; 0x44
 8000ebc:	f424 04c0 	bic.w	r4, r4, #6291456	; 0x600000
 8000ec0:	4321      	orrs	r1, r4
 8000ec2:	6051      	str	r1, [r2, #4]
 8000ec4:	0619      	lsls	r1, r3, #24
 8000ec6:	d506      	bpl.n	8000ed6 <UART_AdvFeatureConfig+0xa6>
 8000ec8:	6803      	ldr	r3, [r0, #0]
 8000eca:	6c81      	ldr	r1, [r0, #72]	; 0x48
 8000ecc:	685a      	ldr	r2, [r3, #4]
 8000ece:	f422 2200 	bic.w	r2, r2, #524288	; 0x80000
 8000ed2:	430a      	orrs	r2, r1
 8000ed4:	605a      	str	r2, [r3, #4]
 8000ed6:	bd10      	pop	{r4, pc}

08000ed8 <UART_CheckIdleState>:
 8000ed8:	2200      	movs	r2, #0
 8000eda:	6803      	ldr	r3, [r0, #0]
 8000edc:	b510      	push	{r4, lr}
 8000ede:	66c2      	str	r2, [r0, #108]	; 0x6c
 8000ee0:	681b      	ldr	r3, [r3, #0]
 8000ee2:	0719      	lsls	r1, r3, #28
 8000ee4:	4604      	mov	r4, r0
 8000ee6:	d404      	bmi.n	8000ef2 <UART_CheckIdleState+0x1a>
 8000ee8:	6823      	ldr	r3, [r4, #0]
 8000eea:	681b      	ldr	r3, [r3, #0]
 8000eec:	075b      	lsls	r3, r3, #29
 8000eee:	d514      	bpl.n	8000f1a <UART_CheckIdleState+0x42>
 8000ef0:	e009      	b.n	8000f06 <UART_CheckIdleState+0x2e>
 8000ef2:	f44f 1100 	mov.w	r1, #2097152	; 0x200000
 8000ef6:	f06f 437e 	mvn.w	r3, #4261412864	; 0xfe000000
 8000efa:	f7ff fdcc 	bl	8000a96 <UART_WaitOnFlagUntilTimeout>
 8000efe:	2800      	cmp	r0, #0
 8000f00:	d0f2      	beq.n	8000ee8 <UART_CheckIdleState+0x10>
 8000f02:	2003      	movs	r0, #3
 8000f04:	bd10      	pop	{r4, pc}
 8000f06:	4620      	mov	r0, r4
 8000f08:	f44f 0180 	mov.w	r1, #4194304	; 0x400000
 8000f0c:	2200      	movs	r2, #0
 8000f0e:	f06f 437e 	mvn.w	r3, #4261412864	; 0xfe000000
 8000f12:	f7ff fdc0 	bl	8000a96 <UART_WaitOnFlagUntilTimeout>
 8000f16:	2800      	cmp	r0, #0
 8000f18:	d1f3      	bne.n	8000f02 <UART_CheckIdleState+0x2a>
 8000f1a:	2301      	movs	r3, #1
 8000f1c:	2000      	movs	r0, #0
 8000f1e:	f884 3069 	strb.w	r3, [r4, #105]	; 0x69
 8000f22:	f884 0068 	strb.w	r0, [r4, #104]	; 0x68
 8000f26:	bd10      	pop	{r4, pc}

08000f28 <HAL_UART_Init>:
 8000f28:	b510      	push	{r4, lr}
 8000f2a:	4604      	mov	r4, r0
 8000f2c:	b360      	cbz	r0, 8000f88 <HAL_UART_Init+0x60>
 8000f2e:	f890 3069 	ldrb.w	r3, [r0, #105]	; 0x69
 8000f32:	f003 02ff 	and.w	r2, r3, #255	; 0xff
 8000f36:	b91b      	cbnz	r3, 8000f40 <HAL_UART_Init+0x18>
 8000f38:	f880 2068 	strb.w	r2, [r0, #104]	; 0x68
 8000f3c:	f7ff fdaa 	bl	8000a94 <HAL_UART_MspInit>
 8000f40:	2302      	movs	r3, #2
 8000f42:	f884 3069 	strb.w	r3, [r4, #105]	; 0x69
 8000f46:	6823      	ldr	r3, [r4, #0]
 8000f48:	681a      	ldr	r2, [r3, #0]
 8000f4a:	f022 0201 	bic.w	r2, r2, #1
 8000f4e:	601a      	str	r2, [r3, #0]
 8000f50:	4620      	mov	r0, r4
 8000f52:	f7ff fe43 	bl	8000bdc <UART_SetConfig>
 8000f56:	2801      	cmp	r0, #1
 8000f58:	d016      	beq.n	8000f88 <HAL_UART_Init+0x60>
 8000f5a:	6a63      	ldr	r3, [r4, #36]	; 0x24
 8000f5c:	b113      	cbz	r3, 8000f64 <HAL_UART_Init+0x3c>
 8000f5e:	4620      	mov	r0, r4
 8000f60:	f7ff ff66 	bl	8000e30 <UART_AdvFeatureConfig>
 8000f64:	6823      	ldr	r3, [r4, #0]
 8000f66:	685a      	ldr	r2, [r3, #4]
 8000f68:	f422 4290 	bic.w	r2, r2, #18432	; 0x4800
 8000f6c:	605a      	str	r2, [r3, #4]
 8000f6e:	689a      	ldr	r2, [r3, #8]
 8000f70:	f022 022a 	bic.w	r2, r2, #42	; 0x2a
 8000f74:	609a      	str	r2, [r3, #8]
 8000f76:	681a      	ldr	r2, [r3, #0]
 8000f78:	f042 0201 	orr.w	r2, r2, #1
 8000f7c:	4620      	mov	r0, r4
 8000f7e:	601a      	str	r2, [r3, #0]
 8000f80:	e8bd 4010 	ldmia.w	sp!, {r4, lr}
 8000f84:	f7ff bfa8 	b.w	8000ed8 <UART_CheckIdleState>
 8000f88:	2001      	movs	r0, #1
 8000f8a:	bd10      	pop	{r4, pc}

08000f8c <HAL_InitTick>:
 8000f8c:	b510      	push	{r4, lr}
 8000f8e:	4604      	mov	r4, r0
 8000f90:	f000 fbe8 	bl	8001764 <HAL_RCC_GetHCLKFreq>
 8000f94:	f44f 737a 	mov.w	r3, #1000	; 0x3e8
 8000f98:	fbb0 f0f3 	udiv	r0, r0, r3
 8000f9c:	f000 fc70 	bl	8001880 <HAL_SYSTICK_Config>
 8000fa0:	f04f 30ff 	mov.w	r0, #4294967295
 8000fa4:	4621      	mov	r1, r4
 8000fa6:	2200      	movs	r2, #0
 8000fa8:	f000 fc38 	bl	800181c <HAL_NVIC_SetPriority>
 8000fac:	2000      	movs	r0, #0
 8000fae:	bd10      	pop	{r4, pc}

08000fb0 <HAL_Init>:
 8000fb0:	b508      	push	{r3, lr}
 8000fb2:	4b07      	ldr	r3, [pc, #28]	; (8000fd0 <HAL_Init+0x20>)
 8000fb4:	681a      	ldr	r2, [r3, #0]
 8000fb6:	f442 7200 	orr.w	r2, r2, #512	; 0x200
 8000fba:	601a      	str	r2, [r3, #0]
 8000fbc:	2003      	movs	r0, #3
 8000fbe:	f000 fc1b 	bl	80017f8 <HAL_NVIC_SetPriorityGrouping>
 8000fc2:	200f      	movs	r0, #15
 8000fc4:	f7ff ffe2 	bl	8000f8c <HAL_InitTick>
 8000fc8:	f000 f842 	bl	8001050 <HAL_MspInit>
 8000fcc:	2000      	movs	r0, #0
 8000fce:	bd08      	pop	{r3, pc}
 8000fd0:	40023c00 	.word	0x40023c00

08000fd4 <HAL_GetTick>:
 8000fd4:	4b01      	ldr	r3, [pc, #4]	; (8000fdc <HAL_GetTick+0x8>)
 8000fd6:	6818      	ldr	r0, [r3, #0]
 8000fd8:	4770      	bx	lr
 8000fda:	bf00      	nop
 8000fdc:	20000004 	.word	0x20000004

08000fe0 <HAL_PWREx_EnableOverDrive>:
 8000fe0:	4b19      	ldr	r3, [pc, #100]	; (8001048 <HAL_PWREx_EnableOverDrive+0x68>)
 8000fe2:	6c1a      	ldr	r2, [r3, #64]	; 0x40
 8000fe4:	b513      	push	{r0, r1, r4, lr}
 8000fe6:	f042 5280 	orr.w	r2, r2, #268435456	; 0x10000000
 8000fea:	641a      	str	r2, [r3, #64]	; 0x40
 8000fec:	6c1b      	ldr	r3, [r3, #64]	; 0x40
 8000fee:	f003 5380 	and.w	r3, r3, #268435456	; 0x10000000
 8000ff2:	9301      	str	r3, [sp, #4]
 8000ff4:	9b01      	ldr	r3, [sp, #4]
 8000ff6:	4b15      	ldr	r3, [pc, #84]	; (800104c <HAL_PWREx_EnableOverDrive+0x6c>)
 8000ff8:	681a      	ldr	r2, [r3, #0]
 8000ffa:	f442 3280 	orr.w	r2, r2, #65536	; 0x10000
 8000ffe:	601a      	str	r2, [r3, #0]
 8001000:	f7ff ffe8 	bl	8000fd4 <HAL_GetTick>
 8001004:	4604      	mov	r4, r0
 8001006:	4b11      	ldr	r3, [pc, #68]	; (800104c <HAL_PWREx_EnableOverDrive+0x6c>)
 8001008:	685a      	ldr	r2, [r3, #4]
 800100a:	03d1      	lsls	r1, r2, #15
 800100c:	d407      	bmi.n	800101e <HAL_PWREx_EnableOverDrive+0x3e>
 800100e:	f7ff ffe1 	bl	8000fd4 <HAL_GetTick>
 8001012:	1b00      	subs	r0, r0, r4
 8001014:	f5b0 7f7a 	cmp.w	r0, #1000	; 0x3e8
 8001018:	d9f5      	bls.n	8001006 <HAL_PWREx_EnableOverDrive+0x26>
 800101a:	2003      	movs	r0, #3
 800101c:	e012      	b.n	8001044 <HAL_PWREx_EnableOverDrive+0x64>
 800101e:	681a      	ldr	r2, [r3, #0]
 8001020:	f442 3200 	orr.w	r2, r2, #131072	; 0x20000
 8001024:	601a      	str	r2, [r3, #0]
 8001026:	f7ff ffd5 	bl	8000fd4 <HAL_GetTick>
 800102a:	4604      	mov	r4, r0
 800102c:	4b07      	ldr	r3, [pc, #28]	; (800104c <HAL_PWREx_EnableOverDrive+0x6c>)
 800102e:	685b      	ldr	r3, [r3, #4]
 8001030:	039a      	lsls	r2, r3, #14
 8001032:	d406      	bmi.n	8001042 <HAL_PWREx_EnableOverDrive+0x62>
 8001034:	f7ff ffce 	bl	8000fd4 <HAL_GetTick>
 8001038:	1b00      	subs	r0, r0, r4
 800103a:	f5b0 7f7a 	cmp.w	r0, #1000	; 0x3e8
 800103e:	d9f5      	bls.n	800102c <HAL_PWREx_EnableOverDrive+0x4c>
 8001040:	e7eb      	b.n	800101a <HAL_PWREx_EnableOverDrive+0x3a>
 8001042:	2000      	movs	r0, #0
 8001044:	b002      	add	sp, #8
 8001046:	bd10      	pop	{r4, pc}
 8001048:	40023800 	.word	0x40023800
 800104c:	40007000 	.word	0x40007000

08001050 <HAL_MspInit>:
 8001050:	4770      	bx	lr

08001052 <i2c_delay>:
 8001052:	bf00      	nop
 8001054:	bf00      	nop
 8001056:	4770      	bx	lr

08001058 <i2cStart>:
 8001058:	b508      	push	{r3, lr}
 800105a:	f7ff fffa 	bl	8001052 <i2c_delay>
 800105e:	f7ff fff8 	bl	8001052 <i2c_delay>
 8001062:	f7ff fff6 	bl	8001052 <i2c_delay>
 8001066:	f7ff fff4 	bl	8001052 <i2c_delay>
 800106a:	f7ff fff2 	bl	8001052 <i2c_delay>
 800106e:	e8bd 4008 	ldmia.w	sp!, {r3, lr}
 8001072:	f7ff bfee 	b.w	8001052 <i2c_delay>

08001076 <i2cStop>:
 8001076:	b508      	push	{r3, lr}
 8001078:	f7ff ffeb 	bl	8001052 <i2c_delay>
 800107c:	f7ff ffe9 	bl	8001052 <i2c_delay>
 8001080:	f7ff ffe7 	bl	8001052 <i2c_delay>
 8001084:	f7ff ffe5 	bl	8001052 <i2c_delay>
 8001088:	f7ff ffe3 	bl	8001052 <i2c_delay>
 800108c:	e8bd 4008 	ldmia.w	sp!, {r3, lr}
 8001090:	f7ff bfdf 	b.w	8001052 <i2c_delay>

08001094 <i2cWrite>:
 8001094:	b510      	push	{r4, lr}
 8001096:	2408      	movs	r4, #8
 8001098:	3c01      	subs	r4, #1
 800109a:	f7ff ffda 	bl	8001052 <i2c_delay>
 800109e:	f7ff ffd8 	bl	8001052 <i2c_delay>
 80010a2:	f7ff ffd6 	bl	8001052 <i2c_delay>
 80010a6:	f014 04ff 	ands.w	r4, r4, #255	; 0xff
 80010aa:	d1f5      	bne.n	8001098 <i2cWrite+0x4>
 80010ac:	f7ff ffd1 	bl	8001052 <i2c_delay>
 80010b0:	f7ff ffcf 	bl	8001052 <i2c_delay>
 80010b4:	f7ff ffcd 	bl	8001052 <i2c_delay>
 80010b8:	f7ff ffcb 	bl	8001052 <i2c_delay>
 80010bc:	f7ff ffc9 	bl	8001052 <i2c_delay>
 80010c0:	4620      	mov	r0, r4
 80010c2:	bd10      	pop	{r4, pc}

080010c4 <i2cRead>:
 80010c4:	b570      	push	{r4, r5, r6, lr}
 80010c6:	4606      	mov	r6, r0
 80010c8:	f7ff ffc3 	bl	8001052 <i2c_delay>
 80010cc:	f7ff ffc1 	bl	8001052 <i2c_delay>
 80010d0:	2508      	movs	r5, #8
 80010d2:	2400      	movs	r4, #0
 80010d4:	0064      	lsls	r4, r4, #1
 80010d6:	b2e4      	uxtb	r4, r4
 80010d8:	3d01      	subs	r5, #1
 80010da:	f7ff ffba 	bl	8001052 <i2c_delay>
 80010de:	3401      	adds	r4, #1
 80010e0:	f7ff ffb7 	bl	8001052 <i2c_delay>
 80010e4:	f015 05ff 	ands.w	r5, r5, #255	; 0xff
 80010e8:	b2e4      	uxtb	r4, r4
 80010ea:	d1f3      	bne.n	80010d4 <i2cRead+0x10>
 80010ec:	b10e      	cbz	r6, 80010f2 <i2cRead+0x2e>
 80010ee:	f7ff ffb0 	bl	8001052 <i2c_delay>
 80010f2:	f7ff ffae 	bl	8001052 <i2c_delay>
 80010f6:	f7ff ffac 	bl	8001052 <i2c_delay>
 80010fa:	f7ff ffaa 	bl	8001052 <i2c_delay>
 80010fe:	4620      	mov	r0, r4
 8001100:	bd70      	pop	{r4, r5, r6, pc}

08001102 <i2c_write_reg>:
 8001102:	b570      	push	{r4, r5, r6, lr}
 8001104:	4605      	mov	r5, r0
 8001106:	460c      	mov	r4, r1
 8001108:	4616      	mov	r6, r2
 800110a:	f7ff ffa5 	bl	8001058 <i2cStart>
 800110e:	4628      	mov	r0, r5
 8001110:	f7ff ffc0 	bl	8001094 <i2cWrite>
 8001114:	4620      	mov	r0, r4
 8001116:	f7ff ffbd 	bl	8001094 <i2cWrite>
 800111a:	4630      	mov	r0, r6
 800111c:	f7ff ffba 	bl	8001094 <i2cWrite>
 8001120:	e8bd 4070 	ldmia.w	sp!, {r4, r5, r6, lr}
 8001124:	f7ff bfa7 	b.w	8001076 <i2cStop>

08001128 <i2c_read_reg>:
 8001128:	b538      	push	{r3, r4, r5, lr}
 800112a:	4604      	mov	r4, r0
 800112c:	460d      	mov	r5, r1
 800112e:	f7ff ff93 	bl	8001058 <i2cStart>
 8001132:	4620      	mov	r0, r4
 8001134:	f7ff ffae 	bl	8001094 <i2cWrite>
 8001138:	4628      	mov	r0, r5
 800113a:	f7ff ffab 	bl	8001094 <i2cWrite>
 800113e:	f7ff ff8b 	bl	8001058 <i2cStart>
 8001142:	f044 0001 	orr.w	r0, r4, #1
 8001146:	f7ff ffa5 	bl	8001094 <i2cWrite>
 800114a:	2000      	movs	r0, #0
 800114c:	f7ff ffba 	bl	80010c4 <i2cRead>
 8001150:	4604      	mov	r4, r0
 8001152:	f7ff ff90 	bl	8001076 <i2cStop>
 8001156:	4620      	mov	r0, r4
 8001158:	bd38      	pop	{r3, r4, r5, pc}
	...

0800115c <HAL_RCC_OscConfig>:
 800115c:	6803      	ldr	r3, [r0, #0]
 800115e:	b5f7      	push	{r0, r1, r2, r4, r5, r6, r7, lr}
 8001160:	4604      	mov	r4, r0
 8001162:	07d8      	lsls	r0, r3, #31
 8001164:	d403      	bmi.n	800116e <HAL_RCC_OscConfig+0x12>
 8001166:	6823      	ldr	r3, [r4, #0]
 8001168:	0799      	lsls	r1, r3, #30
 800116a:	d473      	bmi.n	8001254 <HAL_RCC_OscConfig+0xf8>
 800116c:	e0bb      	b.n	80012e6 <HAL_RCC_OscConfig+0x18a>
 800116e:	4ba0      	ldr	r3, [pc, #640]	; (80013f0 <HAL_RCC_OscConfig+0x294>)
 8001170:	689a      	ldr	r2, [r3, #8]
 8001172:	f002 020c 	and.w	r2, r2, #12
 8001176:	2a04      	cmp	r2, #4
 8001178:	d007      	beq.n	800118a <HAL_RCC_OscConfig+0x2e>
 800117a:	689a      	ldr	r2, [r3, #8]
 800117c:	f002 020c 	and.w	r2, r2, #12
 8001180:	2a08      	cmp	r2, #8
 8001182:	d10b      	bne.n	800119c <HAL_RCC_OscConfig+0x40>
 8001184:	685b      	ldr	r3, [r3, #4]
 8001186:	025a      	lsls	r2, r3, #9
 8001188:	d508      	bpl.n	800119c <HAL_RCC_OscConfig+0x40>
 800118a:	4b99      	ldr	r3, [pc, #612]	; (80013f0 <HAL_RCC_OscConfig+0x294>)
 800118c:	681b      	ldr	r3, [r3, #0]
 800118e:	039b      	lsls	r3, r3, #14
 8001190:	d5e9      	bpl.n	8001166 <HAL_RCC_OscConfig+0xa>
 8001192:	6863      	ldr	r3, [r4, #4]
 8001194:	2b00      	cmp	r3, #0
 8001196:	d1e6      	bne.n	8001166 <HAL_RCC_OscConfig+0xa>
 8001198:	2001      	movs	r0, #1
 800119a:	e1af      	b.n	80014fc <HAL_RCC_OscConfig+0x3a0>
 800119c:	4b94      	ldr	r3, [pc, #592]	; (80013f0 <HAL_RCC_OscConfig+0x294>)
 800119e:	681a      	ldr	r2, [r3, #0]
 80011a0:	f422 3280 	bic.w	r2, r2, #65536	; 0x10000
 80011a4:	601a      	str	r2, [r3, #0]
 80011a6:	681a      	ldr	r2, [r3, #0]
 80011a8:	f422 2280 	bic.w	r2, r2, #262144	; 0x40000
 80011ac:	601a      	str	r2, [r3, #0]
 80011ae:	681a      	ldr	r2, [r3, #0]
 80011b0:	f422 3280 	bic.w	r2, r2, #65536	; 0x10000
 80011b4:	601a      	str	r2, [r3, #0]
 80011b6:	f7ff ff0d 	bl	8000fd4 <HAL_GetTick>
 80011ba:	4605      	mov	r5, r0
 80011bc:	4b8c      	ldr	r3, [pc, #560]	; (80013f0 <HAL_RCC_OscConfig+0x294>)
 80011be:	681a      	ldr	r2, [r3, #0]
 80011c0:	0397      	lsls	r7, r2, #14
 80011c2:	d508      	bpl.n	80011d6 <HAL_RCC_OscConfig+0x7a>
 80011c4:	f7ff ff06 	bl	8000fd4 <HAL_GetTick>
 80011c8:	f241 3388 	movw	r3, #5000	; 0x1388
 80011cc:	1b40      	subs	r0, r0, r5
 80011ce:	4298      	cmp	r0, r3
 80011d0:	d9f4      	bls.n	80011bc <HAL_RCC_OscConfig+0x60>
 80011d2:	2003      	movs	r0, #3
 80011d4:	e192      	b.n	80014fc <HAL_RCC_OscConfig+0x3a0>
 80011d6:	681a      	ldr	r2, [r3, #0]
 80011d8:	f422 3280 	bic.w	r2, r2, #65536	; 0x10000
 80011dc:	601a      	str	r2, [r3, #0]
 80011de:	6862      	ldr	r2, [r4, #4]
 80011e0:	f5b2 3f80 	cmp.w	r2, #65536	; 0x10000
 80011e4:	d103      	bne.n	80011ee <HAL_RCC_OscConfig+0x92>
 80011e6:	681a      	ldr	r2, [r3, #0]
 80011e8:	f422 2280 	bic.w	r2, r2, #262144	; 0x40000
 80011ec:	e005      	b.n	80011fa <HAL_RCC_OscConfig+0x9e>
 80011ee:	f5b2 2fa0 	cmp.w	r2, #327680	; 0x50000
 80011f2:	d108      	bne.n	8001206 <HAL_RCC_OscConfig+0xaa>
 80011f4:	681a      	ldr	r2, [r3, #0]
 80011f6:	f442 2280 	orr.w	r2, r2, #262144	; 0x40000
 80011fa:	601a      	str	r2, [r3, #0]
 80011fc:	681a      	ldr	r2, [r3, #0]
 80011fe:	f442 3280 	orr.w	r2, r2, #65536	; 0x10000
 8001202:	601a      	str	r2, [r3, #0]
 8001204:	e008      	b.n	8001218 <HAL_RCC_OscConfig+0xbc>
 8001206:	6819      	ldr	r1, [r3, #0]
 8001208:	f421 2180 	bic.w	r1, r1, #262144	; 0x40000
 800120c:	6019      	str	r1, [r3, #0]
 800120e:	6819      	ldr	r1, [r3, #0]
 8001210:	f421 3180 	bic.w	r1, r1, #65536	; 0x10000
 8001214:	6019      	str	r1, [r3, #0]
 8001216:	b172      	cbz	r2, 8001236 <HAL_RCC_OscConfig+0xda>
 8001218:	f7ff fedc 	bl	8000fd4 <HAL_GetTick>
 800121c:	4605      	mov	r5, r0
 800121e:	4b74      	ldr	r3, [pc, #464]	; (80013f0 <HAL_RCC_OscConfig+0x294>)
 8001220:	681b      	ldr	r3, [r3, #0]
 8001222:	039e      	lsls	r6, r3, #14
 8001224:	d49f      	bmi.n	8001166 <HAL_RCC_OscConfig+0xa>
 8001226:	f7ff fed5 	bl	8000fd4 <HAL_GetTick>
 800122a:	f241 3388 	movw	r3, #5000	; 0x1388
 800122e:	1b40      	subs	r0, r0, r5
 8001230:	4298      	cmp	r0, r3
 8001232:	d9f4      	bls.n	800121e <HAL_RCC_OscConfig+0xc2>
 8001234:	e7cd      	b.n	80011d2 <HAL_RCC_OscConfig+0x76>
 8001236:	f7ff fecd 	bl	8000fd4 <HAL_GetTick>
 800123a:	4605      	mov	r5, r0
 800123c:	4b6c      	ldr	r3, [pc, #432]	; (80013f0 <HAL_RCC_OscConfig+0x294>)
 800123e:	681b      	ldr	r3, [r3, #0]
 8001240:	0398      	lsls	r0, r3, #14
 8001242:	d590      	bpl.n	8001166 <HAL_RCC_OscConfig+0xa>
 8001244:	f7ff fec6 	bl	8000fd4 <HAL_GetTick>
 8001248:	f241 3388 	movw	r3, #5000	; 0x1388
 800124c:	1b40      	subs	r0, r0, r5
 800124e:	4298      	cmp	r0, r3
 8001250:	d9f4      	bls.n	800123c <HAL_RCC_OscConfig+0xe0>
 8001252:	e7be      	b.n	80011d2 <HAL_RCC_OscConfig+0x76>
 8001254:	4b66      	ldr	r3, [pc, #408]	; (80013f0 <HAL_RCC_OscConfig+0x294>)
 8001256:	689a      	ldr	r2, [r3, #8]
 8001258:	f012 0f0c 	tst.w	r2, #12
 800125c:	d007      	beq.n	800126e <HAL_RCC_OscConfig+0x112>
 800125e:	689a      	ldr	r2, [r3, #8]
 8001260:	f002 020c 	and.w	r2, r2, #12
 8001264:	2a08      	cmp	r2, #8
 8001266:	d10a      	bne.n	800127e <HAL_RCC_OscConfig+0x122>
 8001268:	685b      	ldr	r3, [r3, #4]
 800126a:	0259      	lsls	r1, r3, #9
 800126c:	d407      	bmi.n	800127e <HAL_RCC_OscConfig+0x122>
 800126e:	4b60      	ldr	r3, [pc, #384]	; (80013f0 <HAL_RCC_OscConfig+0x294>)
 8001270:	681a      	ldr	r2, [r3, #0]
 8001272:	0792      	lsls	r2, r2, #30
 8001274:	d517      	bpl.n	80012a6 <HAL_RCC_OscConfig+0x14a>
 8001276:	68e2      	ldr	r2, [r4, #12]
 8001278:	2a01      	cmp	r2, #1
 800127a:	d18d      	bne.n	8001198 <HAL_RCC_OscConfig+0x3c>
 800127c:	e013      	b.n	80012a6 <HAL_RCC_OscConfig+0x14a>
 800127e:	68e2      	ldr	r2, [r4, #12]
 8001280:	4b5b      	ldr	r3, [pc, #364]	; (80013f0 <HAL_RCC_OscConfig+0x294>)
 8001282:	b1fa      	cbz	r2, 80012c4 <HAL_RCC_OscConfig+0x168>
 8001284:	681a      	ldr	r2, [r3, #0]
 8001286:	f042 0201 	orr.w	r2, r2, #1
 800128a:	601a      	str	r2, [r3, #0]
 800128c:	f7ff fea2 	bl	8000fd4 <HAL_GetTick>
 8001290:	4605      	mov	r5, r0
 8001292:	4b57      	ldr	r3, [pc, #348]	; (80013f0 <HAL_RCC_OscConfig+0x294>)
 8001294:	681a      	ldr	r2, [r3, #0]
 8001296:	0797      	lsls	r7, r2, #30
 8001298:	d405      	bmi.n	80012a6 <HAL_RCC_OscConfig+0x14a>
 800129a:	f7ff fe9b 	bl	8000fd4 <HAL_GetTick>
 800129e:	1b40      	subs	r0, r0, r5
 80012a0:	2864      	cmp	r0, #100	; 0x64
 80012a2:	d9f6      	bls.n	8001292 <HAL_RCC_OscConfig+0x136>
 80012a4:	e795      	b.n	80011d2 <HAL_RCC_OscConfig+0x76>
 80012a6:	681a      	ldr	r2, [r3, #0]
 80012a8:	21f8      	movs	r1, #248	; 0xf8
 80012aa:	fa91 f1a1 	rbit	r1, r1
 80012ae:	fab1 f181 	clz	r1, r1
 80012b2:	6923      	ldr	r3, [r4, #16]
 80012b4:	b2c9      	uxtb	r1, r1
 80012b6:	f022 02f8 	bic.w	r2, r2, #248	; 0xf8
 80012ba:	408b      	lsls	r3, r1
 80012bc:	4313      	orrs	r3, r2
 80012be:	4a4c      	ldr	r2, [pc, #304]	; (80013f0 <HAL_RCC_OscConfig+0x294>)
 80012c0:	6013      	str	r3, [r2, #0]
 80012c2:	e010      	b.n	80012e6 <HAL_RCC_OscConfig+0x18a>
 80012c4:	681a      	ldr	r2, [r3, #0]
 80012c6:	f022 0201 	bic.w	r2, r2, #1
 80012ca:	601a      	str	r2, [r3, #0]
 80012cc:	f7ff fe82 	bl	8000fd4 <HAL_GetTick>
 80012d0:	4605      	mov	r5, r0
 80012d2:	4b47      	ldr	r3, [pc, #284]	; (80013f0 <HAL_RCC_OscConfig+0x294>)
 80012d4:	681b      	ldr	r3, [r3, #0]
 80012d6:	079e      	lsls	r6, r3, #30
 80012d8:	d505      	bpl.n	80012e6 <HAL_RCC_OscConfig+0x18a>
 80012da:	f7ff fe7b 	bl	8000fd4 <HAL_GetTick>
 80012de:	1b40      	subs	r0, r0, r5
 80012e0:	2864      	cmp	r0, #100	; 0x64
 80012e2:	d9f6      	bls.n	80012d2 <HAL_RCC_OscConfig+0x176>
 80012e4:	e775      	b.n	80011d2 <HAL_RCC_OscConfig+0x76>
 80012e6:	6823      	ldr	r3, [r4, #0]
 80012e8:	071d      	lsls	r5, r3, #28
 80012ea:	d403      	bmi.n	80012f4 <HAL_RCC_OscConfig+0x198>
 80012ec:	6823      	ldr	r3, [r4, #0]
 80012ee:	0758      	lsls	r0, r3, #29
 80012f0:	d565      	bpl.n	80013be <HAL_RCC_OscConfig+0x262>
 80012f2:	e024      	b.n	800133e <HAL_RCC_OscConfig+0x1e2>
 80012f4:	6962      	ldr	r2, [r4, #20]
 80012f6:	4b3e      	ldr	r3, [pc, #248]	; (80013f0 <HAL_RCC_OscConfig+0x294>)
 80012f8:	b182      	cbz	r2, 800131c <HAL_RCC_OscConfig+0x1c0>
 80012fa:	6f5a      	ldr	r2, [r3, #116]	; 0x74
 80012fc:	f042 0201 	orr.w	r2, r2, #1
 8001300:	675a      	str	r2, [r3, #116]	; 0x74
 8001302:	f7ff fe67 	bl	8000fd4 <HAL_GetTick>
 8001306:	4605      	mov	r5, r0
 8001308:	4b39      	ldr	r3, [pc, #228]	; (80013f0 <HAL_RCC_OscConfig+0x294>)
 800130a:	6f5b      	ldr	r3, [r3, #116]	; 0x74
 800130c:	0799      	lsls	r1, r3, #30
 800130e:	d4ed      	bmi.n	80012ec <HAL_RCC_OscConfig+0x190>
 8001310:	f7ff fe60 	bl	8000fd4 <HAL_GetTick>
 8001314:	1b40      	subs	r0, r0, r5
 8001316:	2864      	cmp	r0, #100	; 0x64
 8001318:	d9f6      	bls.n	8001308 <HAL_RCC_OscConfig+0x1ac>
 800131a:	e75a      	b.n	80011d2 <HAL_RCC_OscConfig+0x76>
 800131c:	6f5a      	ldr	r2, [r3, #116]	; 0x74
 800131e:	f022 0201 	bic.w	r2, r2, #1
 8001322:	675a      	str	r2, [r3, #116]	; 0x74
 8001324:	f7ff fe56 	bl	8000fd4 <HAL_GetTick>
 8001328:	4605      	mov	r5, r0
 800132a:	4b31      	ldr	r3, [pc, #196]	; (80013f0 <HAL_RCC_OscConfig+0x294>)
 800132c:	6f5b      	ldr	r3, [r3, #116]	; 0x74
 800132e:	079a      	lsls	r2, r3, #30
 8001330:	d5dc      	bpl.n	80012ec <HAL_RCC_OscConfig+0x190>
 8001332:	f7ff fe4f 	bl	8000fd4 <HAL_GetTick>
 8001336:	1b40      	subs	r0, r0, r5
 8001338:	2864      	cmp	r0, #100	; 0x64
 800133a:	d9f6      	bls.n	800132a <HAL_RCC_OscConfig+0x1ce>
 800133c:	e749      	b.n	80011d2 <HAL_RCC_OscConfig+0x76>
 800133e:	4b2c      	ldr	r3, [pc, #176]	; (80013f0 <HAL_RCC_OscConfig+0x294>)
 8001340:	6c1a      	ldr	r2, [r3, #64]	; 0x40
 8001342:	f042 5280 	orr.w	r2, r2, #268435456	; 0x10000000
 8001346:	641a      	str	r2, [r3, #64]	; 0x40
 8001348:	6c1b      	ldr	r3, [r3, #64]	; 0x40
 800134a:	f003 5380 	and.w	r3, r3, #268435456	; 0x10000000
 800134e:	9301      	str	r3, [sp, #4]
 8001350:	9b01      	ldr	r3, [sp, #4]
 8001352:	4b28      	ldr	r3, [pc, #160]	; (80013f4 <HAL_RCC_OscConfig+0x298>)
 8001354:	681a      	ldr	r2, [r3, #0]
 8001356:	f442 7280 	orr.w	r2, r2, #256	; 0x100
 800135a:	601a      	str	r2, [r3, #0]
 800135c:	f7ff fe3a 	bl	8000fd4 <HAL_GetTick>
 8001360:	4605      	mov	r5, r0
 8001362:	4b24      	ldr	r3, [pc, #144]	; (80013f4 <HAL_RCC_OscConfig+0x298>)
 8001364:	681b      	ldr	r3, [r3, #0]
 8001366:	05db      	lsls	r3, r3, #23
 8001368:	d52d      	bpl.n	80013c6 <HAL_RCC_OscConfig+0x26a>
 800136a:	4b21      	ldr	r3, [pc, #132]	; (80013f0 <HAL_RCC_OscConfig+0x294>)
 800136c:	6f1a      	ldr	r2, [r3, #112]	; 0x70
 800136e:	f022 0201 	bic.w	r2, r2, #1
 8001372:	671a      	str	r2, [r3, #112]	; 0x70
 8001374:	6f1a      	ldr	r2, [r3, #112]	; 0x70
 8001376:	f022 0204 	bic.w	r2, r2, #4
 800137a:	671a      	str	r2, [r3, #112]	; 0x70
 800137c:	6f1a      	ldr	r2, [r3, #112]	; 0x70
 800137e:	f022 0201 	bic.w	r2, r2, #1
 8001382:	671a      	str	r2, [r3, #112]	; 0x70
 8001384:	f7ff fe26 	bl	8000fd4 <HAL_GetTick>
 8001388:	4605      	mov	r5, r0
 800138a:	4b19      	ldr	r3, [pc, #100]	; (80013f0 <HAL_RCC_OscConfig+0x294>)
 800138c:	6f1a      	ldr	r2, [r3, #112]	; 0x70
 800138e:	0797      	lsls	r7, r2, #30
 8001390:	d41f      	bmi.n	80013d2 <HAL_RCC_OscConfig+0x276>
 8001392:	6f1a      	ldr	r2, [r3, #112]	; 0x70
 8001394:	f022 0201 	bic.w	r2, r2, #1
 8001398:	671a      	str	r2, [r3, #112]	; 0x70
 800139a:	68a2      	ldr	r2, [r4, #8]
 800139c:	2a01      	cmp	r2, #1
 800139e:	d120      	bne.n	80013e2 <HAL_RCC_OscConfig+0x286>
 80013a0:	6f1a      	ldr	r2, [r3, #112]	; 0x70
 80013a2:	f022 0204 	bic.w	r2, r2, #4
 80013a6:	671a      	str	r2, [r3, #112]	; 0x70
 80013a8:	6f1a      	ldr	r2, [r3, #112]	; 0x70
 80013aa:	f042 0201 	orr.w	r2, r2, #1
 80013ae:	671a      	str	r2, [r3, #112]	; 0x70
 80013b0:	f7ff fe10 	bl	8000fd4 <HAL_GetTick>
 80013b4:	4605      	mov	r5, r0
 80013b6:	4b0e      	ldr	r3, [pc, #56]	; (80013f0 <HAL_RCC_OscConfig+0x294>)
 80013b8:	6f1b      	ldr	r3, [r3, #112]	; 0x70
 80013ba:	079e      	lsls	r6, r3, #30
 80013bc:	d526      	bpl.n	800140c <HAL_RCC_OscConfig+0x2b0>
 80013be:	69a2      	ldr	r2, [r4, #24]
 80013c0:	2a00      	cmp	r2, #0
 80013c2:	d13a      	bne.n	800143a <HAL_RCC_OscConfig+0x2de>
 80013c4:	e07f      	b.n	80014c6 <HAL_RCC_OscConfig+0x36a>
 80013c6:	f7ff fe05 	bl	8000fd4 <HAL_GetTick>
 80013ca:	1b40      	subs	r0, r0, r5
 80013cc:	2864      	cmp	r0, #100	; 0x64
 80013ce:	d9c8      	bls.n	8001362 <HAL_RCC_OscConfig+0x206>
 80013d0:	e6ff      	b.n	80011d2 <HAL_RCC_OscConfig+0x76>
 80013d2:	f7ff fdff 	bl	8000fd4 <HAL_GetTick>
 80013d6:	f241 3388 	movw	r3, #5000	; 0x1388
 80013da:	1b40      	subs	r0, r0, r5
 80013dc:	4298      	cmp	r0, r3
 80013de:	d9d4      	bls.n	800138a <HAL_RCC_OscConfig+0x22e>
 80013e0:	e6f7      	b.n	80011d2 <HAL_RCC_OscConfig+0x76>
 80013e2:	2a05      	cmp	r2, #5
 80013e4:	d108      	bne.n	80013f8 <HAL_RCC_OscConfig+0x29c>
 80013e6:	6f1a      	ldr	r2, [r3, #112]	; 0x70
 80013e8:	f042 0204 	orr.w	r2, r2, #4
 80013ec:	e7db      	b.n	80013a6 <HAL_RCC_OscConfig+0x24a>
 80013ee:	bf00      	nop
 80013f0:	40023800 	.word	0x40023800
 80013f4:	40007000 	.word	0x40007000
 80013f8:	6f19      	ldr	r1, [r3, #112]	; 0x70
 80013fa:	f021 0104 	bic.w	r1, r1, #4
 80013fe:	6719      	str	r1, [r3, #112]	; 0x70
 8001400:	6f19      	ldr	r1, [r3, #112]	; 0x70
 8001402:	f021 0101 	bic.w	r1, r1, #1
 8001406:	6719      	str	r1, [r3, #112]	; 0x70
 8001408:	b142      	cbz	r2, 800141c <HAL_RCC_OscConfig+0x2c0>
 800140a:	e7d1      	b.n	80013b0 <HAL_RCC_OscConfig+0x254>
 800140c:	f7ff fde2 	bl	8000fd4 <HAL_GetTick>
 8001410:	f241 3388 	movw	r3, #5000	; 0x1388
 8001414:	1b40      	subs	r0, r0, r5
 8001416:	4298      	cmp	r0, r3
 8001418:	d9cd      	bls.n	80013b6 <HAL_RCC_OscConfig+0x25a>
 800141a:	e6da      	b.n	80011d2 <HAL_RCC_OscConfig+0x76>
 800141c:	f7ff fdda 	bl	8000fd4 <HAL_GetTick>
 8001420:	4605      	mov	r5, r0
 8001422:	4b37      	ldr	r3, [pc, #220]	; (8001500 <HAL_RCC_OscConfig+0x3a4>)
 8001424:	6f1b      	ldr	r3, [r3, #112]	; 0x70
 8001426:	0798      	lsls	r0, r3, #30
 8001428:	d5c9      	bpl.n	80013be <HAL_RCC_OscConfig+0x262>
 800142a:	f7ff fdd3 	bl	8000fd4 <HAL_GetTick>
 800142e:	f241 3388 	movw	r3, #5000	; 0x1388
 8001432:	1b40      	subs	r0, r0, r5
 8001434:	4298      	cmp	r0, r3
 8001436:	d9f4      	bls.n	8001422 <HAL_RCC_OscConfig+0x2c6>
 8001438:	e6cb      	b.n	80011d2 <HAL_RCC_OscConfig+0x76>
 800143a:	4b31      	ldr	r3, [pc, #196]	; (8001500 <HAL_RCC_OscConfig+0x3a4>)
 800143c:	6899      	ldr	r1, [r3, #8]
 800143e:	f001 010c 	and.w	r1, r1, #12
 8001442:	2908      	cmp	r1, #8
 8001444:	f43f aea8 	beq.w	8001198 <HAL_RCC_OscConfig+0x3c>
 8001448:	2a02      	cmp	r2, #2
 800144a:	681a      	ldr	r2, [r3, #0]
 800144c:	f022 7280 	bic.w	r2, r2, #16777216	; 0x1000000
 8001450:	601a      	str	r2, [r3, #0]
 8001452:	d146      	bne.n	80014e2 <HAL_RCC_OscConfig+0x386>
 8001454:	f7ff fdbe 	bl	8000fd4 <HAL_GetTick>
 8001458:	4605      	mov	r5, r0
 800145a:	4b29      	ldr	r3, [pc, #164]	; (8001500 <HAL_RCC_OscConfig+0x3a4>)
 800145c:	681b      	ldr	r3, [r3, #0]
 800145e:	0199      	lsls	r1, r3, #6
 8001460:	d433      	bmi.n	80014ca <HAL_RCC_OscConfig+0x36e>
 8001462:	f647 77c0 	movw	r7, #32704	; 0x7fc0
 8001466:	fa97 f7a7 	rbit	r7, r7
 800146a:	fab7 f787 	clz	r7, r7
 800146e:	f44f 3640 	mov.w	r6, #196608	; 0x30000
 8001472:	b2ff      	uxtb	r7, r7
 8001474:	fa96 f6a6 	rbit	r6, r6
 8001478:	fab6 f686 	clz	r6, r6
 800147c:	f04f 6570 	mov.w	r5, #251658240	; 0xf000000
 8001480:	b2f6      	uxtb	r6, r6
 8001482:	fa95 f5a5 	rbit	r5, r5
 8001486:	fab5 f585 	clz	r5, r5
 800148a:	6a20      	ldr	r0, [r4, #32]
 800148c:	69e1      	ldr	r1, [r4, #28]
 800148e:	6aa3      	ldr	r3, [r4, #40]	; 0x28
 8001490:	6a62      	ldr	r2, [r4, #36]	; 0x24
 8001492:	6ae4      	ldr	r4, [r4, #44]	; 0x2c
 8001494:	4301      	orrs	r1, r0
 8001496:	085b      	lsrs	r3, r3, #1
 8001498:	f041 5100 	orr.w	r1, r1, #536870912	; 0x20000000
 800149c:	40ba      	lsls	r2, r7
 800149e:	3b01      	subs	r3, #1
 80014a0:	430a      	orrs	r2, r1
 80014a2:	40b3      	lsls	r3, r6
 80014a4:	b2ed      	uxtb	r5, r5
 80014a6:	431a      	orrs	r2, r3
 80014a8:	40ac      	lsls	r4, r5
 80014aa:	4b15      	ldr	r3, [pc, #84]	; (8001500 <HAL_RCC_OscConfig+0x3a4>)
 80014ac:	4322      	orrs	r2, r4
 80014ae:	605a      	str	r2, [r3, #4]
 80014b0:	681a      	ldr	r2, [r3, #0]
 80014b2:	f042 7280 	orr.w	r2, r2, #16777216	; 0x1000000
 80014b6:	601a      	str	r2, [r3, #0]
 80014b8:	f7ff fd8c 	bl	8000fd4 <HAL_GetTick>
 80014bc:	4604      	mov	r4, r0
 80014be:	4b10      	ldr	r3, [pc, #64]	; (8001500 <HAL_RCC_OscConfig+0x3a4>)
 80014c0:	681b      	ldr	r3, [r3, #0]
 80014c2:	019a      	lsls	r2, r3, #6
 80014c4:	d507      	bpl.n	80014d6 <HAL_RCC_OscConfig+0x37a>
 80014c6:	2000      	movs	r0, #0
 80014c8:	e018      	b.n	80014fc <HAL_RCC_OscConfig+0x3a0>
 80014ca:	f7ff fd83 	bl	8000fd4 <HAL_GetTick>
 80014ce:	1b40      	subs	r0, r0, r5
 80014d0:	2864      	cmp	r0, #100	; 0x64
 80014d2:	d9c2      	bls.n	800145a <HAL_RCC_OscConfig+0x2fe>
 80014d4:	e67d      	b.n	80011d2 <HAL_RCC_OscConfig+0x76>
 80014d6:	f7ff fd7d 	bl	8000fd4 <HAL_GetTick>
 80014da:	1b00      	subs	r0, r0, r4
 80014dc:	2864      	cmp	r0, #100	; 0x64
 80014de:	d9ee      	bls.n	80014be <HAL_RCC_OscConfig+0x362>
 80014e0:	e677      	b.n	80011d2 <HAL_RCC_OscConfig+0x76>
 80014e2:	f7ff fd77 	bl	8000fd4 <HAL_GetTick>
 80014e6:	4604      	mov	r4, r0
 80014e8:	4b05      	ldr	r3, [pc, #20]	; (8001500 <HAL_RCC_OscConfig+0x3a4>)
 80014ea:	681b      	ldr	r3, [r3, #0]
 80014ec:	019b      	lsls	r3, r3, #6
 80014ee:	d5ea      	bpl.n	80014c6 <HAL_RCC_OscConfig+0x36a>
 80014f0:	f7ff fd70 	bl	8000fd4 <HAL_GetTick>
 80014f4:	1b00      	subs	r0, r0, r4
 80014f6:	2864      	cmp	r0, #100	; 0x64
 80014f8:	d9f6      	bls.n	80014e8 <HAL_RCC_OscConfig+0x38c>
 80014fa:	e66a      	b.n	80011d2 <HAL_RCC_OscConfig+0x76>
 80014fc:	b003      	add	sp, #12
 80014fe:	bdf0      	pop	{r4, r5, r6, r7, pc}
 8001500:	40023800 	.word	0x40023800

08001504 <HAL_RCC_ClockConfig>:
 8001504:	4b71      	ldr	r3, [pc, #452]	; (80016cc <HAL_RCC_ClockConfig+0x1c8>)
 8001506:	681a      	ldr	r2, [r3, #0]
 8001508:	f002 020f 	and.w	r2, r2, #15
 800150c:	4291      	cmp	r1, r2
 800150e:	b570      	push	{r4, r5, r6, lr}
 8001510:	4604      	mov	r4, r0
 8001512:	460d      	mov	r5, r1
 8001514:	d96b      	bls.n	80015ee <HAL_RCC_ClockConfig+0xea>
 8001516:	681a      	ldr	r2, [r3, #0]
 8001518:	f022 020f 	bic.w	r2, r2, #15
 800151c:	430a      	orrs	r2, r1
 800151e:	601a      	str	r2, [r3, #0]
 8001520:	681b      	ldr	r3, [r3, #0]
 8001522:	f003 030f 	and.w	r3, r3, #15
 8001526:	428b      	cmp	r3, r1
 8001528:	d001      	beq.n	800152e <HAL_RCC_ClockConfig+0x2a>
 800152a:	2001      	movs	r0, #1
 800152c:	bd70      	pop	{r4, r5, r6, pc}
 800152e:	6803      	ldr	r3, [r0, #0]
 8001530:	079d      	lsls	r5, r3, #30
 8001532:	d506      	bpl.n	8001542 <HAL_RCC_ClockConfig+0x3e>
 8001534:	4a66      	ldr	r2, [pc, #408]	; (80016d0 <HAL_RCC_ClockConfig+0x1cc>)
 8001536:	68a1      	ldr	r1, [r4, #8]
 8001538:	6890      	ldr	r0, [r2, #8]
 800153a:	f020 00f0 	bic.w	r0, r0, #240	; 0xf0
 800153e:	4301      	orrs	r1, r0
 8001540:	6091      	str	r1, [r2, #8]
 8001542:	07d8      	lsls	r0, r3, #31
 8001544:	d40b      	bmi.n	800155e <HAL_RCC_ClockConfig+0x5a>
 8001546:	6823      	ldr	r3, [r4, #0]
 8001548:	0759      	lsls	r1, r3, #29
 800154a:	f140 80b0 	bpl.w	80016ae <HAL_RCC_ClockConfig+0x1aa>
 800154e:	4a60      	ldr	r2, [pc, #384]	; (80016d0 <HAL_RCC_ClockConfig+0x1cc>)
 8001550:	68e1      	ldr	r1, [r4, #12]
 8001552:	6890      	ldr	r0, [r2, #8]
 8001554:	f420 50e0 	bic.w	r0, r0, #7168	; 0x1c00
 8001558:	4301      	orrs	r1, r0
 800155a:	6091      	str	r1, [r2, #8]
 800155c:	e0a7      	b.n	80016ae <HAL_RCC_ClockConfig+0x1aa>
 800155e:	6862      	ldr	r2, [r4, #4]
 8001560:	4b5b      	ldr	r3, [pc, #364]	; (80016d0 <HAL_RCC_ClockConfig+0x1cc>)
 8001562:	2a01      	cmp	r2, #1
 8001564:	6819      	ldr	r1, [r3, #0]
 8001566:	d102      	bne.n	800156e <HAL_RCC_ClockConfig+0x6a>
 8001568:	f411 3f00 	tst.w	r1, #131072	; 0x20000
 800156c:	e006      	b.n	800157c <HAL_RCC_ClockConfig+0x78>
 800156e:	2a02      	cmp	r2, #2
 8001570:	d102      	bne.n	8001578 <HAL_RCC_ClockConfig+0x74>
 8001572:	f011 7f00 	tst.w	r1, #33554432	; 0x2000000
 8001576:	e001      	b.n	800157c <HAL_RCC_ClockConfig+0x78>
 8001578:	f011 0f02 	tst.w	r1, #2
 800157c:	d0d5      	beq.n	800152a <HAL_RCC_ClockConfig+0x26>
 800157e:	6899      	ldr	r1, [r3, #8]
 8001580:	f021 0103 	bic.w	r1, r1, #3
 8001584:	430a      	orrs	r2, r1
 8001586:	609a      	str	r2, [r3, #8]
 8001588:	f7ff fd24 	bl	8000fd4 <HAL_GetTick>
 800158c:	6863      	ldr	r3, [r4, #4]
 800158e:	2b01      	cmp	r3, #1
 8001590:	4605      	mov	r5, r0
 8001592:	d10e      	bne.n	80015b2 <HAL_RCC_ClockConfig+0xae>
 8001594:	4b4e      	ldr	r3, [pc, #312]	; (80016d0 <HAL_RCC_ClockConfig+0x1cc>)
 8001596:	689b      	ldr	r3, [r3, #8]
 8001598:	f003 030c 	and.w	r3, r3, #12
 800159c:	2b04      	cmp	r3, #4
 800159e:	d0d2      	beq.n	8001546 <HAL_RCC_ClockConfig+0x42>
 80015a0:	f7ff fd18 	bl	8000fd4 <HAL_GetTick>
 80015a4:	f241 3388 	movw	r3, #5000	; 0x1388
 80015a8:	1b40      	subs	r0, r0, r5
 80015aa:	4298      	cmp	r0, r3
 80015ac:	d9f2      	bls.n	8001594 <HAL_RCC_ClockConfig+0x90>
 80015ae:	2003      	movs	r0, #3
 80015b0:	bd70      	pop	{r4, r5, r6, pc}
 80015b2:	2b02      	cmp	r3, #2
 80015b4:	d00c      	beq.n	80015d0 <HAL_RCC_ClockConfig+0xcc>
 80015b6:	4b46      	ldr	r3, [pc, #280]	; (80016d0 <HAL_RCC_ClockConfig+0x1cc>)
 80015b8:	689b      	ldr	r3, [r3, #8]
 80015ba:	f013 0f0c 	tst.w	r3, #12
 80015be:	d10e      	bne.n	80015de <HAL_RCC_ClockConfig+0xda>
 80015c0:	e7c1      	b.n	8001546 <HAL_RCC_ClockConfig+0x42>
 80015c2:	f7ff fd07 	bl	8000fd4 <HAL_GetTick>
 80015c6:	f241 3388 	movw	r3, #5000	; 0x1388
 80015ca:	1b40      	subs	r0, r0, r5
 80015cc:	4298      	cmp	r0, r3
 80015ce:	d8ee      	bhi.n	80015ae <HAL_RCC_ClockConfig+0xaa>
 80015d0:	4b3f      	ldr	r3, [pc, #252]	; (80016d0 <HAL_RCC_ClockConfig+0x1cc>)
 80015d2:	689b      	ldr	r3, [r3, #8]
 80015d4:	f003 030c 	and.w	r3, r3, #12
 80015d8:	2b08      	cmp	r3, #8
 80015da:	d1f2      	bne.n	80015c2 <HAL_RCC_ClockConfig+0xbe>
 80015dc:	e7b3      	b.n	8001546 <HAL_RCC_ClockConfig+0x42>
 80015de:	f7ff fcf9 	bl	8000fd4 <HAL_GetTick>
 80015e2:	f241 3388 	movw	r3, #5000	; 0x1388
 80015e6:	1b40      	subs	r0, r0, r5
 80015e8:	4298      	cmp	r0, r3
 80015ea:	d9e4      	bls.n	80015b6 <HAL_RCC_ClockConfig+0xb2>
 80015ec:	e7df      	b.n	80015ae <HAL_RCC_ClockConfig+0xaa>
 80015ee:	6803      	ldr	r3, [r0, #0]
 80015f0:	079a      	lsls	r2, r3, #30
 80015f2:	d506      	bpl.n	8001602 <HAL_RCC_ClockConfig+0xfe>
 80015f4:	4a36      	ldr	r2, [pc, #216]	; (80016d0 <HAL_RCC_ClockConfig+0x1cc>)
 80015f6:	68a1      	ldr	r1, [r4, #8]
 80015f8:	6890      	ldr	r0, [r2, #8]
 80015fa:	f020 00f0 	bic.w	r0, r0, #240	; 0xf0
 80015fe:	4301      	orrs	r1, r0
 8001600:	6091      	str	r1, [r2, #8]
 8001602:	07de      	lsls	r6, r3, #31
 8001604:	d40b      	bmi.n	800161e <HAL_RCC_ClockConfig+0x11a>
 8001606:	4b31      	ldr	r3, [pc, #196]	; (80016cc <HAL_RCC_ClockConfig+0x1c8>)
 8001608:	681a      	ldr	r2, [r3, #0]
 800160a:	f022 020f 	bic.w	r2, r2, #15
 800160e:	432a      	orrs	r2, r5
 8001610:	601a      	str	r2, [r3, #0]
 8001612:	681b      	ldr	r3, [r3, #0]
 8001614:	f003 030f 	and.w	r3, r3, #15
 8001618:	42ab      	cmp	r3, r5
 800161a:	d186      	bne.n	800152a <HAL_RCC_ClockConfig+0x26>
 800161c:	e793      	b.n	8001546 <HAL_RCC_ClockConfig+0x42>
 800161e:	6862      	ldr	r2, [r4, #4]
 8001620:	4b2b      	ldr	r3, [pc, #172]	; (80016d0 <HAL_RCC_ClockConfig+0x1cc>)
 8001622:	2a01      	cmp	r2, #1
 8001624:	6819      	ldr	r1, [r3, #0]
 8001626:	d102      	bne.n	800162e <HAL_RCC_ClockConfig+0x12a>
 8001628:	f411 3f00 	tst.w	r1, #131072	; 0x20000
 800162c:	e006      	b.n	800163c <HAL_RCC_ClockConfig+0x138>
 800162e:	2a02      	cmp	r2, #2
 8001630:	d102      	bne.n	8001638 <HAL_RCC_ClockConfig+0x134>
 8001632:	f011 7f00 	tst.w	r1, #33554432	; 0x2000000
 8001636:	e001      	b.n	800163c <HAL_RCC_ClockConfig+0x138>
 8001638:	f011 0f02 	tst.w	r1, #2
 800163c:	f43f af75 	beq.w	800152a <HAL_RCC_ClockConfig+0x26>
 8001640:	6899      	ldr	r1, [r3, #8]
 8001642:	f021 0103 	bic.w	r1, r1, #3
 8001646:	430a      	orrs	r2, r1
 8001648:	609a      	str	r2, [r3, #8]
 800164a:	f7ff fcc3 	bl	8000fd4 <HAL_GetTick>
 800164e:	6863      	ldr	r3, [r4, #4]
 8001650:	2b01      	cmp	r3, #1
 8001652:	4606      	mov	r6, r0
 8001654:	d10d      	bne.n	8001672 <HAL_RCC_ClockConfig+0x16e>
 8001656:	4b1e      	ldr	r3, [pc, #120]	; (80016d0 <HAL_RCC_ClockConfig+0x1cc>)
 8001658:	689b      	ldr	r3, [r3, #8]
 800165a:	f003 030c 	and.w	r3, r3, #12
 800165e:	2b04      	cmp	r3, #4
 8001660:	d0d1      	beq.n	8001606 <HAL_RCC_ClockConfig+0x102>
 8001662:	f7ff fcb7 	bl	8000fd4 <HAL_GetTick>
 8001666:	f241 3388 	movw	r3, #5000	; 0x1388
 800166a:	1b80      	subs	r0, r0, r6
 800166c:	4298      	cmp	r0, r3
 800166e:	d9f2      	bls.n	8001656 <HAL_RCC_ClockConfig+0x152>
 8001670:	e79d      	b.n	80015ae <HAL_RCC_ClockConfig+0xaa>
 8001672:	2b02      	cmp	r3, #2
 8001674:	d00c      	beq.n	8001690 <HAL_RCC_ClockConfig+0x18c>
 8001676:	4b16      	ldr	r3, [pc, #88]	; (80016d0 <HAL_RCC_ClockConfig+0x1cc>)
 8001678:	689b      	ldr	r3, [r3, #8]
 800167a:	f013 0f0c 	tst.w	r3, #12
 800167e:	d10e      	bne.n	800169e <HAL_RCC_ClockConfig+0x19a>
 8001680:	e7c1      	b.n	8001606 <HAL_RCC_ClockConfig+0x102>
 8001682:	f7ff fca7 	bl	8000fd4 <HAL_GetTick>
 8001686:	f241 3388 	movw	r3, #5000	; 0x1388
 800168a:	1b80      	subs	r0, r0, r6
 800168c:	4298      	cmp	r0, r3
 800168e:	d88e      	bhi.n	80015ae <HAL_RCC_ClockConfig+0xaa>
 8001690:	4b0f      	ldr	r3, [pc, #60]	; (80016d0 <HAL_RCC_ClockConfig+0x1cc>)
 8001692:	689b      	ldr	r3, [r3, #8]
 8001694:	f003 030c 	and.w	r3, r3, #12
 8001698:	2b08      	cmp	r3, #8
 800169a:	d1f2      	bne.n	8001682 <HAL_RCC_ClockConfig+0x17e>
 800169c:	e7b3      	b.n	8001606 <HAL_RCC_ClockConfig+0x102>
 800169e:	f7ff fc99 	bl	8000fd4 <HAL_GetTick>
 80016a2:	f241 3388 	movw	r3, #5000	; 0x1388
 80016a6:	1b80      	subs	r0, r0, r6
 80016a8:	4298      	cmp	r0, r3
 80016aa:	d9e4      	bls.n	8001676 <HAL_RCC_ClockConfig+0x172>
 80016ac:	e77f      	b.n	80015ae <HAL_RCC_ClockConfig+0xaa>
 80016ae:	071d      	lsls	r5, r3, #28
 80016b0:	d507      	bpl.n	80016c2 <HAL_RCC_ClockConfig+0x1be>
 80016b2:	4b07      	ldr	r3, [pc, #28]	; (80016d0 <HAL_RCC_ClockConfig+0x1cc>)
 80016b4:	6921      	ldr	r1, [r4, #16]
 80016b6:	689a      	ldr	r2, [r3, #8]
 80016b8:	f422 4260 	bic.w	r2, r2, #57344	; 0xe000
 80016bc:	ea42 02c1 	orr.w	r2, r2, r1, lsl #3
 80016c0:	609a      	str	r2, [r3, #8]
 80016c2:	200f      	movs	r0, #15
 80016c4:	f7ff fc62 	bl	8000f8c <HAL_InitTick>
 80016c8:	2000      	movs	r0, #0
 80016ca:	bd70      	pop	{r4, r5, r6, pc}
 80016cc:	40023c00 	.word	0x40023c00
 80016d0:	40023800 	.word	0x40023800

080016d4 <HAL_RCC_GetSysClockFreq>:
 80016d4:	4b20      	ldr	r3, [pc, #128]	; (8001758 <HAL_RCC_GetSysClockFreq+0x84>)
 80016d6:	689a      	ldr	r2, [r3, #8]
 80016d8:	f002 020c 	and.w	r2, r2, #12
 80016dc:	2a04      	cmp	r2, #4
 80016de:	b510      	push	{r4, lr}
 80016e0:	d037      	beq.n	8001752 <HAL_RCC_GetSysClockFreq+0x7e>
 80016e2:	2a08      	cmp	r2, #8
 80016e4:	d001      	beq.n	80016ea <HAL_RCC_GetSysClockFreq+0x16>
 80016e6:	481d      	ldr	r0, [pc, #116]	; (800175c <HAL_RCC_GetSysClockFreq+0x88>)
 80016e8:	bd10      	pop	{r4, pc}
 80016ea:	6859      	ldr	r1, [r3, #4]
 80016ec:	685a      	ldr	r2, [r3, #4]
 80016ee:	685c      	ldr	r4, [r3, #4]
 80016f0:	f412 0f80 	tst.w	r2, #4194304	; 0x400000
 80016f4:	f001 013f 	and.w	r1, r1, #63	; 0x3f
 80016f8:	f647 72c0 	movw	r2, #32704	; 0x7fc0
 80016fc:	d00b      	beq.n	8001716 <HAL_RCC_GetSysClockFreq+0x42>
 80016fe:	fa92 f3a2 	rbit	r3, r2
 8001702:	fab3 f383 	clz	r3, r3
 8001706:	b2db      	uxtb	r3, r3
 8001708:	4022      	ands	r2, r4
 800170a:	40da      	lsrs	r2, r3
 800170c:	4b14      	ldr	r3, [pc, #80]	; (8001760 <HAL_RCC_GetSysClockFreq+0x8c>)
 800170e:	fbb3 f3f1 	udiv	r3, r3, r1
 8001712:	4353      	muls	r3, r2
 8001714:	e00c      	b.n	8001730 <HAL_RCC_GetSysClockFreq+0x5c>
 8001716:	fa92 f2a2 	rbit	r2, r2
 800171a:	fab2 f282 	clz	r2, r2
 800171e:	f647 73c0 	movw	r3, #32704	; 0x7fc0
 8001722:	480e      	ldr	r0, [pc, #56]	; (800175c <HAL_RCC_GetSysClockFreq+0x88>)
 8001724:	b2d2      	uxtb	r2, r2
 8001726:	4023      	ands	r3, r4
 8001728:	40d3      	lsrs	r3, r2
 800172a:	fbb0 f1f1 	udiv	r1, r0, r1
 800172e:	434b      	muls	r3, r1
 8001730:	4a09      	ldr	r2, [pc, #36]	; (8001758 <HAL_RCC_GetSysClockFreq+0x84>)
 8001732:	6850      	ldr	r0, [r2, #4]
 8001734:	f44f 3240 	mov.w	r2, #196608	; 0x30000
 8001738:	fa92 f2a2 	rbit	r2, r2
 800173c:	fab2 f282 	clz	r2, r2
 8001740:	b2d2      	uxtb	r2, r2
 8001742:	f400 3040 	and.w	r0, r0, #196608	; 0x30000
 8001746:	40d0      	lsrs	r0, r2
 8001748:	3001      	adds	r0, #1
 800174a:	0040      	lsls	r0, r0, #1
 800174c:	fbb3 f0f0 	udiv	r0, r3, r0
 8001750:	bd10      	pop	{r4, pc}
 8001752:	4803      	ldr	r0, [pc, #12]	; (8001760 <HAL_RCC_GetSysClockFreq+0x8c>)
 8001754:	bd10      	pop	{r4, pc}
 8001756:	bf00      	nop
 8001758:	40023800 	.word	0x40023800
 800175c:	00f42400 	.word	0x00f42400
 8001760:	017d7840 	.word	0x017d7840

08001764 <HAL_RCC_GetHCLKFreq>:
 8001764:	b508      	push	{r3, lr}
 8001766:	f7ff ffb5 	bl	80016d4 <HAL_RCC_GetSysClockFreq>
 800176a:	4b08      	ldr	r3, [pc, #32]	; (800178c <HAL_RCC_GetHCLKFreq+0x28>)
 800176c:	22f0      	movs	r2, #240	; 0xf0
 800176e:	689b      	ldr	r3, [r3, #8]
 8001770:	fa92 f2a2 	rbit	r2, r2
 8001774:	fab2 f282 	clz	r2, r2
 8001778:	b2d2      	uxtb	r2, r2
 800177a:	f003 03f0 	and.w	r3, r3, #240	; 0xf0
 800177e:	40d3      	lsrs	r3, r2
 8001780:	4a03      	ldr	r2, [pc, #12]	; (8001790 <HAL_RCC_GetHCLKFreq+0x2c>)
 8001782:	5cd3      	ldrb	r3, [r2, r3]
 8001784:	40d8      	lsrs	r0, r3
 8001786:	4b03      	ldr	r3, [pc, #12]	; (8001794 <HAL_RCC_GetHCLKFreq+0x30>)
 8001788:	6018      	str	r0, [r3, #0]
 800178a:	bd08      	pop	{r3, pc}
 800178c:	40023800 	.word	0x40023800
 8001790:	08001da6 	.word	0x08001da6
 8001794:	20000000 	.word	0x20000000

08001798 <HAL_RCC_GetPCLK1Freq>:
 8001798:	b508      	push	{r3, lr}
 800179a:	f7ff ffe3 	bl	8001764 <HAL_RCC_GetHCLKFreq>
 800179e:	4b08      	ldr	r3, [pc, #32]	; (80017c0 <HAL_RCC_GetPCLK1Freq+0x28>)
 80017a0:	f44f 52e0 	mov.w	r2, #7168	; 0x1c00
 80017a4:	689b      	ldr	r3, [r3, #8]
 80017a6:	fa92 f2a2 	rbit	r2, r2
 80017aa:	fab2 f282 	clz	r2, r2
 80017ae:	b2d2      	uxtb	r2, r2
 80017b0:	f403 53e0 	and.w	r3, r3, #7168	; 0x1c00
 80017b4:	40d3      	lsrs	r3, r2
 80017b6:	4a03      	ldr	r2, [pc, #12]	; (80017c4 <HAL_RCC_GetPCLK1Freq+0x2c>)
 80017b8:	5cd3      	ldrb	r3, [r2, r3]
 80017ba:	40d8      	lsrs	r0, r3
 80017bc:	bd08      	pop	{r3, pc}
 80017be:	bf00      	nop
 80017c0:	40023800 	.word	0x40023800
 80017c4:	08001da6 	.word	0x08001da6

080017c8 <HAL_RCC_GetPCLK2Freq>:
 80017c8:	b508      	push	{r3, lr}
 80017ca:	f7ff ffcb 	bl	8001764 <HAL_RCC_GetHCLKFreq>
 80017ce:	4b08      	ldr	r3, [pc, #32]	; (80017f0 <HAL_RCC_GetPCLK2Freq+0x28>)
 80017d0:	f44f 4260 	mov.w	r2, #57344	; 0xe000
 80017d4:	689b      	ldr	r3, [r3, #8]
 80017d6:	fa92 f2a2 	rbit	r2, r2
 80017da:	fab2 f282 	clz	r2, r2
 80017de:	b2d2      	uxtb	r2, r2
 80017e0:	f403 4360 	and.w	r3, r3, #57344	; 0xe000
 80017e4:	40d3      	lsrs	r3, r2
 80017e6:	4a03      	ldr	r2, [pc, #12]	; (80017f4 <HAL_RCC_GetPCLK2Freq+0x2c>)
 80017e8:	5cd3      	ldrb	r3, [r2, r3]
 80017ea:	40d8      	lsrs	r0, r3
 80017ec:	bd08      	pop	{r3, pc}
 80017ee:	bf00      	nop
 80017f0:	40023800 	.word	0x40023800
 80017f4:	08001da6 	.word	0x08001da6

080017f8 <HAL_NVIC_SetPriorityGrouping>:
 80017f8:	4a07      	ldr	r2, [pc, #28]	; (8001818 <HAL_NVIC_SetPriorityGrouping+0x20>)
 80017fa:	68d1      	ldr	r1, [r2, #12]
 80017fc:	f64f 03ff 	movw	r3, #63743	; 0xf8ff
 8001800:	400b      	ands	r3, r1
 8001802:	f043 63bf 	orr.w	r3, r3, #100139008	; 0x5f80000
 8001806:	f443 3300 	orr.w	r3, r3, #131072	; 0x20000
 800180a:	f000 0007 	and.w	r0, r0, #7
 800180e:	ea43 2300 	orr.w	r3, r3, r0, lsl #8
 8001812:	60d3      	str	r3, [r2, #12]
 8001814:	4770      	bx	lr
 8001816:	bf00      	nop
 8001818:	e000ed00 	.word	0xe000ed00

0800181c <HAL_NVIC_SetPriority>:
 800181c:	4b16      	ldr	r3, [pc, #88]	; (8001878 <HAL_NVIC_SetPriority+0x5c>)
 800181e:	68db      	ldr	r3, [r3, #12]
 8001820:	f3c3 2302 	ubfx	r3, r3, #8, #3
 8001824:	b570      	push	{r4, r5, r6, lr}
 8001826:	1d1d      	adds	r5, r3, #4
 8001828:	f1c3 0407 	rsb	r4, r3, #7
 800182c:	2c04      	cmp	r4, #4
 800182e:	bf28      	it	cs
 8001830:	2404      	movcs	r4, #4
 8001832:	2d06      	cmp	r5, #6
 8001834:	f04f 0501 	mov.w	r5, #1
 8001838:	bf8c      	ite	hi
 800183a:	3b03      	subhi	r3, #3
 800183c:	2300      	movls	r3, #0
 800183e:	fa05 f404 	lsl.w	r4, r5, r4
 8001842:	fa05 f603 	lsl.w	r6, r5, r3
 8001846:	3c01      	subs	r4, #1
 8001848:	3e01      	subs	r6, #1
 800184a:	4021      	ands	r1, r4
 800184c:	4032      	ands	r2, r6
 800184e:	fa01 f303 	lsl.w	r3, r1, r3
 8001852:	4313      	orrs	r3, r2
 8001854:	2800      	cmp	r0, #0
 8001856:	ea4f 1303 	mov.w	r3, r3, lsl #4
 800185a:	da05      	bge.n	8001868 <HAL_NVIC_SetPriority+0x4c>
 800185c:	b2da      	uxtb	r2, r3
 800185e:	f000 000f 	and.w	r0, r0, #15
 8001862:	4b06      	ldr	r3, [pc, #24]	; (800187c <HAL_NVIC_SetPriority+0x60>)
 8001864:	541a      	strb	r2, [r3, r0]
 8001866:	bd70      	pop	{r4, r5, r6, pc}
 8001868:	f100 4060 	add.w	r0, r0, #3758096384	; 0xe0000000
 800186c:	f500 4061 	add.w	r0, r0, #57600	; 0xe100
 8001870:	b2db      	uxtb	r3, r3
 8001872:	f880 3300 	strb.w	r3, [r0, #768]	; 0x300
 8001876:	bd70      	pop	{r4, r5, r6, pc}
 8001878:	e000ed00 	.word	0xe000ed00
 800187c:	e000ed14 	.word	0xe000ed14

08001880 <HAL_SYSTICK_Config>:
 8001880:	3801      	subs	r0, #1
 8001882:	f1b0 7f80 	cmp.w	r0, #16777216	; 0x1000000
 8001886:	d20a      	bcs.n	800189e <HAL_SYSTICK_Config+0x1e>
 8001888:	4b06      	ldr	r3, [pc, #24]	; (80018a4 <HAL_SYSTICK_Config+0x24>)
 800188a:	4a07      	ldr	r2, [pc, #28]	; (80018a8 <HAL_SYSTICK_Config+0x28>)
 800188c:	6058      	str	r0, [r3, #4]
 800188e:	21f0      	movs	r1, #240	; 0xf0
 8001890:	f882 1023 	strb.w	r1, [r2, #35]	; 0x23
 8001894:	2000      	movs	r0, #0
 8001896:	2207      	movs	r2, #7
 8001898:	6098      	str	r0, [r3, #8]
 800189a:	601a      	str	r2, [r3, #0]
 800189c:	4770      	bx	lr
 800189e:	2001      	movs	r0, #1
 80018a0:	4770      	bx	lr
 80018a2:	bf00      	nop
 80018a4:	e000e010 	.word	0xe000e010
 80018a8:	e000ed00 	.word	0xe000ed00

080018ac <HAL_MPU_ConfigRegion>:
 80018ac:	7842      	ldrb	r2, [r0, #1]
 80018ae:	4b11      	ldr	r3, [pc, #68]	; (80018f4 <HAL_MPU_ConfigRegion+0x48>)
 80018b0:	609a      	str	r2, [r3, #8]
 80018b2:	7802      	ldrb	r2, [r0, #0]
 80018b4:	b1da      	cbz	r2, 80018ee <HAL_MPU_ConfigRegion+0x42>
 80018b6:	6842      	ldr	r2, [r0, #4]
 80018b8:	60da      	str	r2, [r3, #12]
 80018ba:	7ac2      	ldrb	r2, [r0, #11]
 80018bc:	7b01      	ldrb	r1, [r0, #12]
 80018be:	0612      	lsls	r2, r2, #24
 80018c0:	ea42 7201 	orr.w	r2, r2, r1, lsl #28
 80018c4:	7801      	ldrb	r1, [r0, #0]
 80018c6:	430a      	orrs	r2, r1
 80018c8:	7a81      	ldrb	r1, [r0, #10]
 80018ca:	ea42 42c1 	orr.w	r2, r2, r1, lsl #19
 80018ce:	7b41      	ldrb	r1, [r0, #13]
 80018d0:	ea42 4281 	orr.w	r2, r2, r1, lsl #18
 80018d4:	7b81      	ldrb	r1, [r0, #14]
 80018d6:	ea42 4241 	orr.w	r2, r2, r1, lsl #17
 80018da:	7bc1      	ldrb	r1, [r0, #15]
 80018dc:	ea42 4201 	orr.w	r2, r2, r1, lsl #16
 80018e0:	7a41      	ldrb	r1, [r0, #9]
 80018e2:	ea42 2201 	orr.w	r2, r2, r1, lsl #8
 80018e6:	7a01      	ldrb	r1, [r0, #8]
 80018e8:	ea42 0241 	orr.w	r2, r2, r1, lsl #1
 80018ec:	e000      	b.n	80018f0 <HAL_MPU_ConfigRegion+0x44>
 80018ee:	60da      	str	r2, [r3, #12]
 80018f0:	611a      	str	r2, [r3, #16]
 80018f2:	4770      	bx	lr
 80018f4:	e000ed90 	.word	0xe000ed90

080018f8 <Default_Handler>:
 80018f8:	4668      	mov	r0, sp
 80018fa:	f020 0107 	bic.w	r1, r0, #7
 80018fe:	468d      	mov	sp, r1
 8001900:	bf00      	nop
 8001902:	e7fd      	b.n	8001900 <Default_Handler+0x8>

08001904 <HardFault_Handler>:
 8001904:	2002      	movs	r0, #2
 8001906:	f000 f9a1 	bl	8001c4c <led_on>
 800190a:	4b06      	ldr	r3, [pc, #24]	; (8001924 <HardFault_Handler+0x20>)
 800190c:	3b01      	subs	r3, #1
 800190e:	d001      	beq.n	8001914 <HardFault_Handler+0x10>
 8001910:	bf00      	nop
 8001912:	e7fb      	b.n	800190c <HardFault_Handler+0x8>
 8001914:	2002      	movs	r0, #2
 8001916:	f000 f9a3 	bl	8001c60 <led_off>
 800191a:	4b02      	ldr	r3, [pc, #8]	; (8001924 <HardFault_Handler+0x20>)
 800191c:	3b01      	subs	r3, #1
 800191e:	d0f1      	beq.n	8001904 <HardFault_Handler>
 8001920:	bf00      	nop
 8001922:	e7fb      	b.n	800191c <HardFault_Handler+0x18>
 8001924:	01312d01 	.word	0x01312d01

08001928 <_reset_init>:
 8001928:	4a0e      	ldr	r2, [pc, #56]	; (8001964 <_reset_init+0x3c>)
 800192a:	480f      	ldr	r0, [pc, #60]	; (8001968 <_reset_init+0x40>)
 800192c:	1a80      	subs	r0, r0, r2
 800192e:	1080      	asrs	r0, r0, #2
 8001930:	2300      	movs	r3, #0
 8001932:	4283      	cmp	r3, r0
 8001934:	d006      	beq.n	8001944 <_reset_init+0x1c>
 8001936:	490d      	ldr	r1, [pc, #52]	; (800196c <_reset_init+0x44>)
 8001938:	f851 1023 	ldr.w	r1, [r1, r3, lsl #2]
 800193c:	f842 1023 	str.w	r1, [r2, r3, lsl #2]
 8001940:	3301      	adds	r3, #1
 8001942:	e7f6      	b.n	8001932 <_reset_init+0xa>
 8001944:	4b0a      	ldr	r3, [pc, #40]	; (8001970 <_reset_init+0x48>)
 8001946:	f8d3 2088 	ldr.w	r2, [r3, #136]	; 0x88
 800194a:	f442 0270 	orr.w	r2, r2, #15728640	; 0xf00000
 800194e:	f8c3 2088 	str.w	r2, [r3, #136]	; 0x88
 8001952:	f503 730c 	add.w	r3, r3, #560	; 0x230
 8001956:	685a      	ldr	r2, [r3, #4]
 8001958:	f022 4240 	bic.w	r2, r2, #3221225472	; 0xc0000000
 800195c:	605a      	str	r2, [r3, #4]
 800195e:	f7fe bc69 	b.w	8000234 <main>
 8001962:	bf00      	nop
 8001964:	20000000 	.word	0x20000000
 8001968:	20000004 	.word	0x20000004
 800196c:	08001dbc 	.word	0x08001dbc
 8001970:	e000ed00 	.word	0xe000ed00

08001974 <HAL_GPIO_Init>:
 8001974:	e92d 43f7 	stmdb	sp!, {r0, r1, r2, r4, r5, r6, r7, r8, r9, lr}
 8001978:	680f      	ldr	r7, [r1, #0]
 800197a:	2300      	movs	r3, #0
 800197c:	2201      	movs	r2, #1
 800197e:	409a      	lsls	r2, r3
 8001980:	ea02 0507 	and.w	r5, r2, r7
 8001984:	4295      	cmp	r5, r2
 8001986:	f040 80d5 	bne.w	8001b34 <HAL_GPIO_Init+0x1c0>
 800198a:	684c      	ldr	r4, [r1, #4]
 800198c:	f024 0610 	bic.w	r6, r4, #16
 8001990:	2e02      	cmp	r6, #2
 8001992:	d116      	bne.n	80019c2 <HAL_GPIO_Init+0x4e>
 8001994:	ea4f 0cd3 	mov.w	ip, r3, lsr #3
 8001998:	eb00 0c8c 	add.w	ip, r0, ip, lsl #2
 800199c:	f003 0807 	and.w	r8, r3, #7
 80019a0:	f8dc 2020 	ldr.w	r2, [ip, #32]
 80019a4:	ea4f 0888 	mov.w	r8, r8, lsl #2
 80019a8:	f04f 090f 	mov.w	r9, #15
 80019ac:	fa09 f908 	lsl.w	r9, r9, r8
 80019b0:	ea22 0909 	bic.w	r9, r2, r9
 80019b4:	690a      	ldr	r2, [r1, #16]
 80019b6:	fa02 f808 	lsl.w	r8, r2, r8
 80019ba:	ea49 0208 	orr.w	r2, r9, r8
 80019be:	f8cc 2020 	str.w	r2, [ip, #32]
 80019c2:	005a      	lsls	r2, r3, #1
 80019c4:	f04f 0c03 	mov.w	ip, #3
 80019c8:	f8d0 9000 	ldr.w	r9, [r0]
 80019cc:	fa0c fc02 	lsl.w	ip, ip, r2
 80019d0:	ea6f 0c0c 	mvn.w	ip, ip
 80019d4:	f004 0803 	and.w	r8, r4, #3
 80019d8:	ea0c 0909 	and.w	r9, ip, r9
 80019dc:	fa08 f802 	lsl.w	r8, r8, r2
 80019e0:	3e01      	subs	r6, #1
 80019e2:	ea49 0808 	orr.w	r8, r9, r8
 80019e6:	2e01      	cmp	r6, #1
 80019e8:	f8c0 8000 	str.w	r8, [r0]
 80019ec:	d810      	bhi.n	8001a10 <HAL_GPIO_Init+0x9c>
 80019ee:	6886      	ldr	r6, [r0, #8]
 80019f0:	ea0c 0806 	and.w	r8, ip, r6
 80019f4:	68ce      	ldr	r6, [r1, #12]
 80019f6:	4096      	lsls	r6, r2
 80019f8:	ea48 0606 	orr.w	r6, r8, r6
 80019fc:	6086      	str	r6, [r0, #8]
 80019fe:	6846      	ldr	r6, [r0, #4]
 8001a00:	ea26 0805 	bic.w	r8, r6, r5
 8001a04:	f3c4 1600 	ubfx	r6, r4, #4, #1
 8001a08:	409e      	lsls	r6, r3
 8001a0a:	ea48 0606 	orr.w	r6, r8, r6
 8001a0e:	6046      	str	r6, [r0, #4]
 8001a10:	68c6      	ldr	r6, [r0, #12]
 8001a12:	ea0c 0c06 	and.w	ip, ip, r6
 8001a16:	688e      	ldr	r6, [r1, #8]
 8001a18:	4096      	lsls	r6, r2
 8001a1a:	ea4c 0206 	orr.w	r2, ip, r6
 8001a1e:	60c2      	str	r2, [r0, #12]
 8001a20:	00e2      	lsls	r2, r4, #3
 8001a22:	f140 8087 	bpl.w	8001b34 <HAL_GPIO_Init+0x1c0>
 8001a26:	4a47      	ldr	r2, [pc, #284]	; (8001b44 <HAL_GPIO_Init+0x1d0>)
 8001a28:	6c56      	ldr	r6, [r2, #68]	; 0x44
 8001a2a:	f446 4680 	orr.w	r6, r6, #16384	; 0x4000
 8001a2e:	6456      	str	r6, [r2, #68]	; 0x44
 8001a30:	6c52      	ldr	r2, [r2, #68]	; 0x44
 8001a32:	f023 0603 	bic.w	r6, r3, #3
 8001a36:	f106 4680 	add.w	r6, r6, #1073741824	; 0x40000000
 8001a3a:	f402 4280 	and.w	r2, r2, #16384	; 0x4000
 8001a3e:	f506 369c 	add.w	r6, r6, #79872	; 0x13800
 8001a42:	9201      	str	r2, [sp, #4]
 8001a44:	f003 0c03 	and.w	ip, r3, #3
 8001a48:	9a01      	ldr	r2, [sp, #4]
 8001a4a:	68b2      	ldr	r2, [r6, #8]
 8001a4c:	ea4f 0c8c 	mov.w	ip, ip, lsl #2
 8001a50:	f04f 080f 	mov.w	r8, #15
 8001a54:	fa08 f80c 	lsl.w	r8, r8, ip
 8001a58:	ea22 0808 	bic.w	r8, r2, r8
 8001a5c:	4a3a      	ldr	r2, [pc, #232]	; (8001b48 <HAL_GPIO_Init+0x1d4>)
 8001a5e:	4290      	cmp	r0, r2
 8001a60:	d026      	beq.n	8001ab0 <HAL_GPIO_Init+0x13c>
 8001a62:	f502 6280 	add.w	r2, r2, #1024	; 0x400
 8001a66:	4290      	cmp	r0, r2
 8001a68:	d024      	beq.n	8001ab4 <HAL_GPIO_Init+0x140>
 8001a6a:	f502 6280 	add.w	r2, r2, #1024	; 0x400
 8001a6e:	4290      	cmp	r0, r2
 8001a70:	d022      	beq.n	8001ab8 <HAL_GPIO_Init+0x144>
 8001a72:	f502 6280 	add.w	r2, r2, #1024	; 0x400
 8001a76:	4290      	cmp	r0, r2
 8001a78:	d020      	beq.n	8001abc <HAL_GPIO_Init+0x148>
 8001a7a:	f502 6280 	add.w	r2, r2, #1024	; 0x400
 8001a7e:	4290      	cmp	r0, r2
 8001a80:	d01e      	beq.n	8001ac0 <HAL_GPIO_Init+0x14c>
 8001a82:	f502 6280 	add.w	r2, r2, #1024	; 0x400
 8001a86:	4290      	cmp	r0, r2
 8001a88:	d01c      	beq.n	8001ac4 <HAL_GPIO_Init+0x150>
 8001a8a:	f502 6280 	add.w	r2, r2, #1024	; 0x400
 8001a8e:	4290      	cmp	r0, r2
 8001a90:	d01a      	beq.n	8001ac8 <HAL_GPIO_Init+0x154>
 8001a92:	f502 6280 	add.w	r2, r2, #1024	; 0x400
 8001a96:	4290      	cmp	r0, r2
 8001a98:	d018      	beq.n	8001acc <HAL_GPIO_Init+0x158>
 8001a9a:	f502 6280 	add.w	r2, r2, #1024	; 0x400
 8001a9e:	4290      	cmp	r0, r2
 8001aa0:	d016      	beq.n	8001ad0 <HAL_GPIO_Init+0x15c>
 8001aa2:	f502 6280 	add.w	r2, r2, #1024	; 0x400
 8001aa6:	4290      	cmp	r0, r2
 8001aa8:	bf14      	ite	ne
 8001aaa:	220a      	movne	r2, #10
 8001aac:	2209      	moveq	r2, #9
 8001aae:	e010      	b.n	8001ad2 <HAL_GPIO_Init+0x15e>
 8001ab0:	2200      	movs	r2, #0
 8001ab2:	e00e      	b.n	8001ad2 <HAL_GPIO_Init+0x15e>
 8001ab4:	2201      	movs	r2, #1
 8001ab6:	e00c      	b.n	8001ad2 <HAL_GPIO_Init+0x15e>
 8001ab8:	2202      	movs	r2, #2
 8001aba:	e00a      	b.n	8001ad2 <HAL_GPIO_Init+0x15e>
 8001abc:	2203      	movs	r2, #3
 8001abe:	e008      	b.n	8001ad2 <HAL_GPIO_Init+0x15e>
 8001ac0:	2204      	movs	r2, #4
 8001ac2:	e006      	b.n	8001ad2 <HAL_GPIO_Init+0x15e>
 8001ac4:	2205      	movs	r2, #5
 8001ac6:	e004      	b.n	8001ad2 <HAL_GPIO_Init+0x15e>
 8001ac8:	2206      	movs	r2, #6
 8001aca:	e002      	b.n	8001ad2 <HAL_GPIO_Init+0x15e>
 8001acc:	2207      	movs	r2, #7
 8001ace:	e000      	b.n	8001ad2 <HAL_GPIO_Init+0x15e>
 8001ad0:	2208      	movs	r2, #8
 8001ad2:	fa02 f20c 	lsl.w	r2, r2, ip
 8001ad6:	ea42 0208 	orr.w	r2, r2, r8
 8001ada:	60b2      	str	r2, [r6, #8]
 8001adc:	4e1b      	ldr	r6, [pc, #108]	; (8001b4c <HAL_GPIO_Init+0x1d8>)
 8001ade:	f8d6 c000 	ldr.w	ip, [r6]
 8001ae2:	43ea      	mvns	r2, r5
 8001ae4:	f414 3f80 	tst.w	r4, #65536	; 0x10000
 8001ae8:	bf14      	ite	ne
 8001aea:	ea45 0c0c 	orrne.w	ip, r5, ip
 8001aee:	ea02 0c0c 	andeq.w	ip, r2, ip
 8001af2:	f8c6 c000 	str.w	ip, [r6]
 8001af6:	6876      	ldr	r6, [r6, #4]
 8001af8:	f414 3f00 	tst.w	r4, #131072	; 0x20000
 8001afc:	bf14      	ite	ne
 8001afe:	ea45 0c06 	orrne.w	ip, r5, r6
 8001b02:	ea02 0c06 	andeq.w	ip, r2, r6
 8001b06:	4e11      	ldr	r6, [pc, #68]	; (8001b4c <HAL_GPIO_Init+0x1d8>)
 8001b08:	f8c6 c004 	str.w	ip, [r6, #4]
 8001b0c:	f8d6 c008 	ldr.w	ip, [r6, #8]
 8001b10:	f414 1f80 	tst.w	r4, #1048576	; 0x100000
 8001b14:	bf14      	ite	ne
 8001b16:	ea45 0c0c 	orrne.w	ip, r5, ip
 8001b1a:	ea02 0c0c 	andeq.w	ip, r2, ip
 8001b1e:	f8c6 c008 	str.w	ip, [r6, #8]
 8001b22:	68f6      	ldr	r6, [r6, #12]
 8001b24:	02a4      	lsls	r4, r4, #10
 8001b26:	bf58      	it	pl
 8001b28:	ea02 0506 	andpl.w	r5, r2, r6
 8001b2c:	4a07      	ldr	r2, [pc, #28]	; (8001b4c <HAL_GPIO_Init+0x1d8>)
 8001b2e:	bf48      	it	mi
 8001b30:	4335      	orrmi	r5, r6
 8001b32:	60d5      	str	r5, [r2, #12]
 8001b34:	3301      	adds	r3, #1
 8001b36:	2b10      	cmp	r3, #16
 8001b38:	f47f af20 	bne.w	800197c <HAL_GPIO_Init+0x8>
 8001b3c:	b003      	add	sp, #12
 8001b3e:	e8bd 83f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, pc}
 8001b42:	bf00      	nop
 8001b44:	40023800 	.word	0x40023800
 8001b48:	40020000 	.word	0x40020000
 8001b4c:	40013c00 	.word	0x40013c00

08001b50 <HAL_GPIO_WritePin>:
 8001b50:	b902      	cbnz	r2, 8001b54 <HAL_GPIO_WritePin+0x4>
 8001b52:	0409      	lsls	r1, r1, #16
 8001b54:	6181      	str	r1, [r0, #24]
 8001b56:	4770      	bx	lr

08001b58 <sys_tick_init>:
 8001b58:	4b05      	ldr	r3, [pc, #20]	; (8001b70 <sys_tick_init+0x18>)
 8001b5a:	4a06      	ldr	r2, [pc, #24]	; (8001b74 <sys_tick_init+0x1c>)
 8001b5c:	605a      	str	r2, [r3, #4]
 8001b5e:	4a06      	ldr	r2, [pc, #24]	; (8001b78 <sys_tick_init+0x20>)
 8001b60:	21f0      	movs	r1, #240	; 0xf0
 8001b62:	f882 1023 	strb.w	r1, [r2, #35]	; 0x23
 8001b66:	2200      	movs	r2, #0
 8001b68:	609a      	str	r2, [r3, #8]
 8001b6a:	2207      	movs	r2, #7
 8001b6c:	601a      	str	r2, [r3, #0]
 8001b6e:	4770      	bx	lr
 8001b70:	e000e010 	.word	0xe000e010
 8001b74:	00029040 	.word	0x00029040
 8001b78:	e000ed00 	.word	0xe000ed00

08001b7c <sleep>:
 8001b7c:	bf30      	wfi
 8001b7e:	4770      	bx	lr

08001b80 <timer_init>:
 8001b80:	2300      	movs	r3, #0
 8001b82:	4909      	ldr	r1, [pc, #36]	; (8001ba8 <timer_init+0x28>)
 8001b84:	f44f 6280 	mov.w	r2, #1024	; 0x400
 8001b88:	f821 2013 	strh.w	r2, [r1, r3, lsl #1]
 8001b8c:	4907      	ldr	r1, [pc, #28]	; (8001bac <timer_init+0x2c>)
 8001b8e:	f821 2013 	strh.w	r2, [r1, r3, lsl #1]
 8001b92:	4907      	ldr	r1, [pc, #28]	; (8001bb0 <timer_init+0x30>)
 8001b94:	2200      	movs	r2, #0
 8001b96:	f821 2013 	strh.w	r2, [r1, r3, lsl #1]
 8001b9a:	3301      	adds	r3, #1
 8001b9c:	2b04      	cmp	r3, #4
 8001b9e:	d1f0      	bne.n	8001b82 <timer_init+0x2>
 8001ba0:	4b04      	ldr	r3, [pc, #16]	; (8001bb4 <timer_init+0x34>)
 8001ba2:	601a      	str	r2, [r3, #0]
 8001ba4:	4770      	bx	lr
 8001ba6:	bf00      	nop
 8001ba8:	200009f4 	.word	0x200009f4
 8001bac:	200009e8 	.word	0x200009e8
 8001bb0:	200009e0 	.word	0x200009e0
 8001bb4:	200009f0 	.word	0x200009f0

08001bb8 <TIM4_IRQHandler>:
 8001bb8:	2300      	movs	r3, #0
 8001bba:	4a0e      	ldr	r2, [pc, #56]	; (8001bf4 <TIM4_IRQHandler+0x3c>)
 8001bbc:	f832 1013 	ldrh.w	r1, [r2, r3, lsl #1]
 8001bc0:	b289      	uxth	r1, r1
 8001bc2:	b129      	cbz	r1, 8001bd0 <TIM4_IRQHandler+0x18>
 8001bc4:	f832 1013 	ldrh.w	r1, [r2, r3, lsl #1]
 8001bc8:	b289      	uxth	r1, r1
 8001bca:	3901      	subs	r1, #1
 8001bcc:	b289      	uxth	r1, r1
 8001bce:	e007      	b.n	8001be0 <TIM4_IRQHandler+0x28>
 8001bd0:	4909      	ldr	r1, [pc, #36]	; (8001bf8 <TIM4_IRQHandler+0x40>)
 8001bd2:	f831 1013 	ldrh.w	r1, [r1, r3, lsl #1]
 8001bd6:	b289      	uxth	r1, r1
 8001bd8:	f822 1013 	strh.w	r1, [r2, r3, lsl #1]
 8001bdc:	4a07      	ldr	r2, [pc, #28]	; (8001bfc <TIM4_IRQHandler+0x44>)
 8001bde:	2101      	movs	r1, #1
 8001be0:	f822 1013 	strh.w	r1, [r2, r3, lsl #1]
 8001be4:	3301      	adds	r3, #1
 8001be6:	2b04      	cmp	r3, #4
 8001be8:	d1e7      	bne.n	8001bba <TIM4_IRQHandler+0x2>
 8001bea:	4b05      	ldr	r3, [pc, #20]	; (8001c00 <TIM4_IRQHandler+0x48>)
 8001bec:	681a      	ldr	r2, [r3, #0]
 8001bee:	3201      	adds	r2, #1
 8001bf0:	601a      	str	r2, [r3, #0]
 8001bf2:	4770      	bx	lr
 8001bf4:	200009f4 	.word	0x200009f4
 8001bf8:	200009e8 	.word	0x200009e8
 8001bfc:	200009e0 	.word	0x200009e0
 8001c00:	200009f0 	.word	0x200009f0

08001c04 <timer_delay_loops>:
 8001c04:	f110 30ff 	adds.w	r0, r0, #4294967295
 8001c08:	d301      	bcc.n	8001c0e <timer_delay_loops+0xa>
 8001c0a:	bf00      	nop
 8001c0c:	e7fa      	b.n	8001c04 <timer_delay_loops>
 8001c0e:	4770      	bx	lr

08001c10 <timer_get_time>:
 8001c10:	b082      	sub	sp, #8
 8001c12:	b672      	cpsid	i
 8001c14:	4b04      	ldr	r3, [pc, #16]	; (8001c28 <timer_get_time+0x18>)
 8001c16:	681b      	ldr	r3, [r3, #0]
 8001c18:	9301      	str	r3, [sp, #4]
 8001c1a:	b662      	cpsie	i
 8001c1c:	9801      	ldr	r0, [sp, #4]
 8001c1e:	230a      	movs	r3, #10
 8001c20:	fbb0 f0f3 	udiv	r0, r0, r3
 8001c24:	b002      	add	sp, #8
 8001c26:	4770      	bx	lr
 8001c28:	200009f0 	.word	0x200009f0

08001c2c <timer_delay_ms>:
 8001c2c:	b513      	push	{r0, r1, r4, lr}
 8001c2e:	4604      	mov	r4, r0
 8001c30:	f7ff ffee 	bl	8001c10 <timer_get_time>
 8001c34:	4420      	add	r0, r4
 8001c36:	9001      	str	r0, [sp, #4]
 8001c38:	9c01      	ldr	r4, [sp, #4]
 8001c3a:	f7ff ffe9 	bl	8001c10 <timer_get_time>
 8001c3e:	4284      	cmp	r4, r0
 8001c40:	d902      	bls.n	8001c48 <timer_delay_ms+0x1c>
 8001c42:	f7ff ff9b 	bl	8001b7c <sleep>
 8001c46:	e7f7      	b.n	8001c38 <timer_delay_ms+0xc>
 8001c48:	b002      	add	sp, #8
 8001c4a:	bd10      	pop	{r4, pc}

08001c4c <led_on>:
 8001c4c:	2802      	cmp	r0, #2
 8001c4e:	4601      	mov	r1, r0
 8001c50:	d103      	bne.n	8001c5a <led_on+0xe>
 8001c52:	4802      	ldr	r0, [pc, #8]	; (8001c5c <led_on+0x10>)
 8001c54:	2201      	movs	r2, #1
 8001c56:	f7ff bf7b 	b.w	8001b50 <HAL_GPIO_WritePin>
 8001c5a:	4770      	bx	lr
 8001c5c:	40022000 	.word	0x40022000

08001c60 <led_off>:
 8001c60:	2802      	cmp	r0, #2
 8001c62:	4601      	mov	r1, r0
 8001c64:	d103      	bne.n	8001c6e <led_off+0xe>
 8001c66:	4802      	ldr	r0, [pc, #8]	; (8001c70 <led_off+0x10>)
 8001c68:	2200      	movs	r2, #0
 8001c6a:	f7ff bf71 	b.w	8001b50 <HAL_GPIO_WritePin>
 8001c6e:	4770      	bx	lr
 8001c70:	40022000 	.word	0x40022000

08001c74 <gpio_init>:
 8001c74:	4b10      	ldr	r3, [pc, #64]	; (8001cb8 <gpio_init+0x44>)
 8001c76:	b530      	push	{r4, r5, lr}
 8001c78:	6b1a      	ldr	r2, [r3, #48]	; 0x30
 8001c7a:	4d10      	ldr	r5, [pc, #64]	; (8001cbc <gpio_init+0x48>)
 8001c7c:	f442 7280 	orr.w	r2, r2, #256	; 0x100
 8001c80:	631a      	str	r2, [r3, #48]	; 0x30
 8001c82:	6b1b      	ldr	r3, [r3, #48]	; 0x30
 8001c84:	b087      	sub	sp, #28
 8001c86:	f403 7380 	and.w	r3, r3, #256	; 0x100
 8001c8a:	9300      	str	r3, [sp, #0]
 8001c8c:	9b00      	ldr	r3, [sp, #0]
 8001c8e:	2301      	movs	r3, #1
 8001c90:	2402      	movs	r4, #2
 8001c92:	9302      	str	r3, [sp, #8]
 8001c94:	9303      	str	r3, [sp, #12]
 8001c96:	4628      	mov	r0, r5
 8001c98:	2303      	movs	r3, #3
 8001c9a:	a901      	add	r1, sp, #4
 8001c9c:	9304      	str	r3, [sp, #16]
 8001c9e:	9401      	str	r4, [sp, #4]
 8001ca0:	f7ff fe68 	bl	8001974 <HAL_GPIO_Init>
 8001ca4:	4628      	mov	r0, r5
 8001ca6:	4621      	mov	r1, r4
 8001ca8:	2200      	movs	r2, #0
 8001caa:	f7ff ff51 	bl	8001b50 <HAL_GPIO_WritePin>
 8001cae:	4620      	mov	r0, r4
 8001cb0:	f7ff ffd6 	bl	8001c60 <led_off>
 8001cb4:	b007      	add	sp, #28
 8001cb6:	bd30      	pop	{r4, r5, pc}
 8001cb8:	40023800 	.word	0x40023800
 8001cbc:	40022000 	.word	0x40022000

08001cc0 <_init>:
 8001cc0:	e1a0c00d 	mov	ip, sp
 8001cc4:	e92ddff8 	push	{r3, r4, r5, r6, r7, r8, r9, sl, fp, ip, lr, pc}
 8001cc8:	e24cb004 	sub	fp, ip, #4
 8001ccc:	e24bd028 	sub	sp, fp, #40	; 0x28
 8001cd0:	e89d6ff0 	ldm	sp, {r4, r5, r6, r7, r8, r9, sl, fp, sp, lr}
 8001cd4:	e12fff1e 	bx	lr

08001cd8 <_fini>:
 8001cd8:	e1a0c00d 	mov	ip, sp
 8001cdc:	e92ddff8 	push	{r3, r4, r5, r6, r7, r8, r9, sl, fp, ip, lr, pc}
 8001ce0:	e24cb004 	sub	fp, ip, #4
 8001ce4:	e24bd028 	sub	sp, fp, #40	; 0x28
 8001ce8:	e89d6ff0 	ldm	sp, {r4, r5, r6, r7, r8, r9, sl, fp, sp, lr}
 8001cec:	e12fff1e 	bx	lr
 8001cf0:	746f6f62 	.word	0x746f6f62
 8001cf4:	20676e69 	.word	0x20676e69
 8001cf8:	6d6f7266 	.word	0x6d6f7266
 8001cfc:	0a752520 	.word	0x0a752520
 8001d00:	6d617200 	.word	0x6d617200
 8001d04:	61747320 	.word	0x61747320
 8001d08:	25207472 	.word	0x25207472
 8001d0c:	000a2075 	.word	0x000a2075
 8001d10:	206d6172 	.word	0x206d6172
 8001d14:	657a6973 	.word	0x657a6973
 8001d18:	20752520 	.word	0x20752520
 8001d1c:	6172000a 	.word	0x6172000a
 8001d20:	7266206d 	.word	0x7266206d
 8001d24:	25206565 	.word	0x25206565
 8001d28:	000a2075 	.word	0x000a2075
 8001d2c:	70616568 	.word	0x70616568
 8001d30:	61747320 	.word	0x61747320
 8001d34:	25207472 	.word	0x25207472
 8001d38:	000a2075 	.word	0x000a2075
 8001d3c:	0a0a      	.short	0x0a0a
 8001d3e:	00          	.byte	0x00
 8001d3f:	73          	.byte	0x73
 8001d40:	6f696474 	.word	0x6f696474
 8001d44:	696e6920 	.word	0x696e6920
 8001d48:	6f642074 	.word	0x6f642074
 8001d4c:	000a656e 	.word	0x000a656e
 8001d50:	6c65770a 	.word	0x6c65770a
 8001d54:	656d6f63 	.word	0x656d6f63
 8001d58:	206f7420 	.word	0x206f7420
 8001d5c:	757a7553 	.word	0x757a7553
 8001d60:	534f6168 	.word	0x534f6168
 8001d64:	5e5f5e20 	.word	0x5e5f5e20
 8001d68:	322e3220 	.word	0x322e3220
 8001d6c:	420a302e 	.word	0x420a302e
 8001d70:	444c4955 	.word	0x444c4955
 8001d74:	62654620 	.word	0x62654620
 8001d78:	20303120 	.word	0x20303120
 8001d7c:	36313032 	.word	0x36313032
 8001d80:	3a303220 	.word	0x3a303220
 8001d84:	343a3135 	.word	0x343a3135
 8001d88:	25000a30 	.word	0x25000a30
 8001d8c:	203a2075 	.word	0x203a2075
 8001d90:	0a206925 	.word	0x0a206925
	...

08001d95 <CSWTCH.36>:
 8001d95:	10101000 10101004 10101002 02040108              .............

08001da2 <CSWTCH.35>:
 8001da2:	08020401                                ....

08001da6 <APBAHBPrescTable>:
 8001da6:	00000000 04030201 04030201 09080706     ................
	...

08001db8 <__EH_FRAME_BEGIN__>:
 8001db8:	00000000                                ....
