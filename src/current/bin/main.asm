
bin/main.elf:     file format elf32-littlearm


Disassembly of section .text:

08000188 <mem_info_print>:
 8000188:	b538      	push	{r3, r4, r5, lr}
 800018a:	4c0f      	ldr	r4, [pc, #60]	; (80001c8 <mem_info_print+0x40>)
 800018c:	4d0f      	ldr	r5, [pc, #60]	; (80001cc <mem_info_print+0x44>)
 800018e:	4810      	ldr	r0, [pc, #64]	; (80001d0 <mem_info_print+0x48>)
 8000190:	4910      	ldr	r1, [pc, #64]	; (80001d4 <mem_info_print+0x4c>)
 8000192:	f000 fa07 	bl	80005a4 <printf_>
 8000196:	1b2d      	subs	r5, r5, r4
 8000198:	4621      	mov	r1, r4
 800019a:	480f      	ldr	r0, [pc, #60]	; (80001d8 <mem_info_print+0x50>)
 800019c:	f000 fa02 	bl	80005a4 <printf_>
 80001a0:	4629      	mov	r1, r5
 80001a2:	480e      	ldr	r0, [pc, #56]	; (80001dc <mem_info_print+0x54>)
 80001a4:	f000 f9fe 	bl	80005a4 <printf_>
 80001a8:	4b0d      	ldr	r3, [pc, #52]	; (80001e0 <mem_info_print+0x58>)
 80001aa:	480e      	ldr	r0, [pc, #56]	; (80001e4 <mem_info_print+0x5c>)
 80001ac:	1ae1      	subs	r1, r4, r3
 80001ae:	4429      	add	r1, r5
 80001b0:	f000 f9f8 	bl	80005a4 <printf_>
 80001b4:	480c      	ldr	r0, [pc, #48]	; (80001e8 <mem_info_print+0x60>)
 80001b6:	490d      	ldr	r1, [pc, #52]	; (80001ec <mem_info_print+0x64>)
 80001b8:	f000 f9f4 	bl	80005a4 <printf_>
 80001bc:	480c      	ldr	r0, [pc, #48]	; (80001f0 <mem_info_print+0x68>)
 80001be:	e8bd 4038 	ldmia.w	sp!, {r3, r4, r5, lr}
 80001c2:	f000 b9ef 	b.w	80005a4 <printf_>
 80001c6:	bf00      	nop
 80001c8:	20000000 	.word	0x20000000
 80001cc:	20020000 	.word	0x20020000
 80001d0:	08000fd0 	.word	0x08000fd0
 80001d4:	08000f9e 	.word	0x08000f9e
 80001d8:	08000fe1 	.word	0x08000fe1
 80001dc:	08000ff0 	.word	0x08000ff0
 80001e0:	20000b8c 	.word	0x20000b8c
 80001e4:	08000ffe 	.word	0x08000ffe
 80001e8:	0800100c 	.word	0x0800100c
 80001ec:	20000b8c 	.word	0x20000b8c
 80001f0:	0800101c 	.word	0x0800101c

080001f4 <main>:
 80001f4:	b508      	push	{r3, lr}
 80001f6:	f000 fbcf 	bl	8000998 <lib_low_level_init>
 80001fa:	f44f 5000 	mov.w	r0, #8192	; 0x2000
 80001fe:	f000 fe6f 	bl	8000ee0 <led_on>
 8000202:	f000 f949 	bl	8000498 <lib_os_init>
 8000206:	f7ff ffbf 	bl	8000188 <mem_info_print>
 800020a:	4905      	ldr	r1, [pc, #20]	; (8000220 <main+0x2c>)
 800020c:	4805      	ldr	r0, [pc, #20]	; (8000224 <main+0x30>)
 800020e:	f44f 7200 	mov.w	r2, #512	; 0x200
 8000212:	2308      	movs	r3, #8
 8000214:	f000 f88a 	bl	800032c <create_thread>
 8000218:	f000 f882 	bl	8000320 <kernel_start>
 800021c:	2000      	movs	r0, #0
 800021e:	bd08      	pop	{r3, pc}
 8000220:	20000210 	.word	0x20000210
 8000224:	080007c9 	.word	0x080007c9

08000228 <thread_ending>:
 8000228:	b672      	cpsid	i
 800022a:	4b05      	ldr	r3, [pc, #20]	; (8000240 <thread_ending+0x18>)
 800022c:	4a05      	ldr	r2, [pc, #20]	; (8000244 <thread_ending+0x1c>)
 800022e:	681b      	ldr	r3, [r3, #0]
 8000230:	210c      	movs	r1, #12
 8000232:	fb01 2303 	mla	r3, r1, r3, r2
 8000236:	2200      	movs	r2, #0
 8000238:	605a      	str	r2, [r3, #4]
 800023a:	b662      	cpsie	i
 800023c:	bf00      	nop
 800023e:	e7fd      	b.n	800023c <thread_ending+0x14>
 8000240:	20000470 	.word	0x20000470
 8000244:	20000410 	.word	0x20000410

08000248 <null_thread>:
 8000248:	b508      	push	{r3, lr}
 800024a:	f000 fd25 	bl	8000c98 <sleep>
 800024e:	e7fc      	b.n	800024a <null_thread+0x2>

08000250 <scheduler>:
 8000250:	b570      	push	{r4, r5, r6, lr}
 8000252:	2200      	movs	r2, #0
 8000254:	4611      	mov	r1, r2
 8000256:	4b15      	ldr	r3, [pc, #84]	; (80002ac <scheduler+0x5c>)
 8000258:	200c      	movs	r0, #12
 800025a:	fb00 f501 	mul.w	r5, r0, r1
 800025e:	195e      	adds	r6, r3, r5
 8000260:	6874      	ldr	r4, [r6, #4]
 8000262:	f014 0f02 	tst.w	r4, #2
 8000266:	461c      	mov	r4, r3
 8000268:	d10a      	bne.n	8000280 <scheduler+0x30>
 800026a:	6876      	ldr	r6, [r6, #4]
 800026c:	07f6      	lsls	r6, r6, #31
 800026e:	d507      	bpl.n	8000280 <scheduler+0x30>
 8000270:	4350      	muls	r0, r2
 8000272:	5b5d      	ldrh	r5, [r3, r5]
 8000274:	5a18      	ldrh	r0, [r3, r0]
 8000276:	b2ad      	uxth	r5, r5
 8000278:	b280      	uxth	r0, r0
 800027a:	4285      	cmp	r5, r0
 800027c:	bf38      	it	cc
 800027e:	460a      	movcc	r2, r1
 8000280:	200c      	movs	r0, #12
 8000282:	4348      	muls	r0, r1
 8000284:	5a1d      	ldrh	r5, [r3, r0]
 8000286:	b2ad      	uxth	r5, r5
 8000288:	b125      	cbz	r5, 8000294 <scheduler+0x44>
 800028a:	5a1d      	ldrh	r5, [r3, r0]
 800028c:	b2ad      	uxth	r5, r5
 800028e:	3d01      	subs	r5, #1
 8000290:	b2ad      	uxth	r5, r5
 8000292:	521d      	strh	r5, [r3, r0]
 8000294:	3101      	adds	r1, #1
 8000296:	2908      	cmp	r1, #8
 8000298:	d1dd      	bne.n	8000256 <scheduler+0x6>
 800029a:	230c      	movs	r3, #12
 800029c:	4353      	muls	r3, r2
 800029e:	18e1      	adds	r1, r4, r3
 80002a0:	8849      	ldrh	r1, [r1, #2]
 80002a2:	b289      	uxth	r1, r1
 80002a4:	52e1      	strh	r1, [r4, r3]
 80002a6:	4b02      	ldr	r3, [pc, #8]	; (80002b0 <scheduler+0x60>)
 80002a8:	601a      	str	r2, [r3, #0]
 80002aa:	bd70      	pop	{r4, r5, r6, pc}
 80002ac:	20000410 	.word	0x20000410
 80002b0:	20000470 	.word	0x20000470

080002b4 <SysTick_Handler>:
 80002b4:	e92d 0ff0 	stmdb	sp!, {r4, r5, r6, r7, r8, r9, sl, fp}
 80002b8:	f3ef 8208 	mrs	r2, MSP
 80002bc:	4c0d      	ldr	r4, [pc, #52]	; (80002f4 <SysTick_Handler+0x40>)
 80002be:	4d0e      	ldr	r5, [pc, #56]	; (80002f8 <SysTick_Handler+0x44>)
 80002c0:	6823      	ldr	r3, [r4, #0]
 80002c2:	3301      	adds	r3, #1
 80002c4:	d005      	beq.n	80002d2 <SysTick_Handler+0x1e>
 80002c6:	6823      	ldr	r3, [r4, #0]
 80002c8:	210c      	movs	r1, #12
 80002ca:	fb01 5303 	mla	r3, r1, r3, r5
 80002ce:	609a      	str	r2, [r3, #8]
 80002d0:	e001      	b.n	80002d6 <SysTick_Handler+0x22>
 80002d2:	2300      	movs	r3, #0
 80002d4:	6023      	str	r3, [r4, #0]
 80002d6:	f7ff ffbb 	bl	8000250 <scheduler>
 80002da:	6823      	ldr	r3, [r4, #0]
 80002dc:	220c      	movs	r2, #12
 80002de:	fb02 5503 	mla	r5, r2, r3, r5
 80002e2:	f06f 0306 	mvn.w	r3, #6
 80002e6:	68aa      	ldr	r2, [r5, #8]
 80002e8:	469e      	mov	lr, r3
 80002ea:	f382 8808 	msr	MSP, r2
 80002ee:	e8bd 0ff0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, fp}
 80002f2:	4770      	bx	lr
 80002f4:	20000470 	.word	0x20000470
 80002f8:	20000410 	.word	0x20000410

080002fc <sched_off>:
 80002fc:	b672      	cpsid	i
 80002fe:	4770      	bx	lr

08000300 <sched_on>:
 8000300:	b662      	cpsie	i
 8000302:	4770      	bx	lr

08000304 <yield>:
 8000304:	bf00      	nop
 8000306:	4770      	bx	lr

08000308 <get_thread_id>:
 8000308:	b082      	sub	sp, #8
 800030a:	b672      	cpsid	i
 800030c:	4b03      	ldr	r3, [pc, #12]	; (800031c <get_thread_id+0x14>)
 800030e:	681b      	ldr	r3, [r3, #0]
 8000310:	9301      	str	r3, [sp, #4]
 8000312:	b662      	cpsie	i
 8000314:	9801      	ldr	r0, [sp, #4]
 8000316:	b002      	add	sp, #8
 8000318:	4770      	bx	lr
 800031a:	bf00      	nop
 800031c:	20000470 	.word	0x20000470

08000320 <kernel_start>:
 8000320:	b508      	push	{r3, lr}
 8000322:	f000 fca7 	bl	8000c74 <sys_tick_init>
 8000326:	bf00      	nop
 8000328:	e7fd      	b.n	8000326 <kernel_start+0x6>
	...

0800032c <create_thread>:
 800032c:	f022 0203 	bic.w	r2, r2, #3
 8000330:	3a40      	subs	r2, #64	; 0x40
 8000332:	e92d 43f0 	stmdb	sp!, {r4, r5, r6, r7, r8, r9, lr}
 8000336:	eb01 0c02 	add.w	ip, r1, r2
 800033a:	f102 0834 	add.w	r8, r2, #52	; 0x34
 800033e:	f102 0938 	add.w	r9, r2, #56	; 0x38
 8000342:	323c      	adds	r2, #60	; 0x3c
 8000344:	4488      	add	r8, r1
 8000346:	4489      	add	r9, r1
 8000348:	4607      	mov	r7, r0
 800034a:	4411      	add	r1, r2
 800034c:	2200      	movs	r2, #0
 800034e:	b672      	cpsid	i
 8000350:	4e11      	ldr	r6, [pc, #68]	; (8000398 <create_thread+0x6c>)
 8000352:	250c      	movs	r5, #12
 8000354:	4355      	muls	r5, r2
 8000356:	1974      	adds	r4, r6, r5
 8000358:	6860      	ldr	r0, [r4, #4]
 800035a:	07c0      	lsls	r0, r0, #31
 800035c:	d412      	bmi.n	8000384 <create_thread+0x58>
 800035e:	480f      	ldr	r0, [pc, #60]	; (800039c <create_thread+0x70>)
 8000360:	f8c4 c008 	str.w	ip, [r4, #8]
 8000364:	f8c8 0000 	str.w	r0, [r8]
 8000368:	f04f 5004 	mov.w	r0, #553648128	; 0x21000000
 800036c:	f8c9 7000 	str.w	r7, [r9]
 8000370:	2b07      	cmp	r3, #7
 8000372:	bf98      	it	ls
 8000374:	2308      	movls	r3, #8
 8000376:	6008      	str	r0, [r1, #0]
 8000378:	2001      	movs	r0, #1
 800037a:	8063      	strh	r3, [r4, #2]
 800037c:	5373      	strh	r3, [r6, r5]
 800037e:	6060      	str	r0, [r4, #4]
 8000380:	4610      	mov	r0, r2
 8000382:	e000      	b.n	8000386 <create_thread+0x5a>
 8000384:	2008      	movs	r0, #8
 8000386:	b662      	cpsie	i
 8000388:	3201      	adds	r2, #1
 800038a:	2a08      	cmp	r2, #8
 800038c:	d001      	beq.n	8000392 <create_thread+0x66>
 800038e:	2808      	cmp	r0, #8
 8000390:	d0dd      	beq.n	800034e <create_thread+0x22>
 8000392:	e8bd 83f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, pc}
 8000396:	bf00      	nop
 8000398:	20000410 	.word	0x20000410
 800039c:	08000229 	.word	0x08000229

080003a0 <kernel_init>:
 80003a0:	b510      	push	{r4, lr}
 80003a2:	2300      	movs	r3, #0
 80003a4:	490b      	ldr	r1, [pc, #44]	; (80003d4 <kernel_init+0x34>)
 80003a6:	220c      	movs	r2, #12
 80003a8:	435a      	muls	r2, r3
 80003aa:	188c      	adds	r4, r1, r2
 80003ac:	2000      	movs	r0, #0
 80003ae:	6060      	str	r0, [r4, #4]
 80003b0:	3301      	adds	r3, #1
 80003b2:	2008      	movs	r0, #8
 80003b4:	4283      	cmp	r3, r0
 80003b6:	8060      	strh	r0, [r4, #2]
 80003b8:	5288      	strh	r0, [r1, r2]
 80003ba:	d1f3      	bne.n	80003a4 <kernel_init+0x4>
 80003bc:	4b06      	ldr	r3, [pc, #24]	; (80003d8 <kernel_init+0x38>)
 80003be:	4807      	ldr	r0, [pc, #28]	; (80003dc <kernel_init+0x3c>)
 80003c0:	4907      	ldr	r1, [pc, #28]	; (80003e0 <kernel_init+0x40>)
 80003c2:	f04f 32ff 	mov.w	r2, #4294967295
 80003c6:	601a      	str	r2, [r3, #0]
 80003c8:	e8bd 4010 	ldmia.w	sp!, {r4, lr}
 80003cc:	2280      	movs	r2, #128	; 0x80
 80003ce:	23ff      	movs	r3, #255	; 0xff
 80003d0:	f7ff bfac 	b.w	800032c <create_thread>
 80003d4:	20000410 	.word	0x20000410
 80003d8:	20000470 	.word	0x20000470
 80003dc:	08000249 	.word	0x08000249
 80003e0:	20000474 	.word	0x20000474

080003e4 <set_wait_state>:
 80003e4:	b507      	push	{r0, r1, r2, lr}
 80003e6:	f7ff ff8f 	bl	8000308 <get_thread_id>
 80003ea:	9000      	str	r0, [sp, #0]
 80003ec:	b672      	cpsid	i
 80003ee:	4b0d      	ldr	r3, [pc, #52]	; (8000424 <set_wait_state+0x40>)
 80003f0:	9a00      	ldr	r2, [sp, #0]
 80003f2:	210c      	movs	r1, #12
 80003f4:	fb01 3202 	mla	r2, r1, r2, r3
 80003f8:	6851      	ldr	r1, [r2, #4]
 80003fa:	f041 0102 	orr.w	r1, r1, #2
 80003fe:	6051      	str	r1, [r2, #4]
 8000400:	b672      	cpsid	i
 8000402:	9a00      	ldr	r2, [sp, #0]
 8000404:	210c      	movs	r1, #12
 8000406:	fb01 3202 	mla	r2, r1, r2, r3
 800040a:	6852      	ldr	r2, [r2, #4]
 800040c:	9201      	str	r2, [sp, #4]
 800040e:	b662      	cpsie	i
 8000410:	9a01      	ldr	r2, [sp, #4]
 8000412:	0791      	lsls	r1, r2, #30
 8000414:	d500      	bpl.n	8000418 <set_wait_state+0x34>
 8000416:	bf00      	nop
 8000418:	9a01      	ldr	r2, [sp, #4]
 800041a:	0792      	lsls	r2, r2, #30
 800041c:	d4f0      	bmi.n	8000400 <set_wait_state+0x1c>
 800041e:	b003      	add	sp, #12
 8000420:	f85d fb04 	ldr.w	pc, [sp], #4
 8000424:	20000410 	.word	0x20000410

08000428 <wake_up_threads>:
 8000428:	2300      	movs	r3, #0
 800042a:	b672      	cpsid	i
 800042c:	4a06      	ldr	r2, [pc, #24]	; (8000448 <wake_up_threads+0x20>)
 800042e:	210c      	movs	r1, #12
 8000430:	fb01 2203 	mla	r2, r1, r3, r2
 8000434:	6851      	ldr	r1, [r2, #4]
 8000436:	f021 0102 	bic.w	r1, r1, #2
 800043a:	6051      	str	r1, [r2, #4]
 800043c:	b662      	cpsie	i
 800043e:	3301      	adds	r3, #1
 8000440:	2b08      	cmp	r3, #8
 8000442:	d1f2      	bne.n	800042a <wake_up_threads+0x2>
 8000444:	4770      	bx	lr
 8000446:	bf00      	nop
 8000448:	20000410 	.word	0x20000410

0800044c <join>:
 800044c:	b082      	sub	sp, #8
 800044e:	9001      	str	r0, [sp, #4]
 8000450:	bf00      	nop
 8000452:	b672      	cpsid	i
 8000454:	4a06      	ldr	r2, [pc, #24]	; (8000470 <join+0x24>)
 8000456:	9b01      	ldr	r3, [sp, #4]
 8000458:	210c      	movs	r1, #12
 800045a:	fb01 2303 	mla	r3, r1, r3, r2
 800045e:	685b      	ldr	r3, [r3, #4]
 8000460:	9300      	str	r3, [sp, #0]
 8000462:	b662      	cpsie	i
 8000464:	9b00      	ldr	r3, [sp, #0]
 8000466:	07d8      	lsls	r0, r3, #31
 8000468:	d4f2      	bmi.n	8000450 <join+0x4>
 800046a:	b002      	add	sp, #8
 800046c:	4770      	bx	lr
 800046e:	bf00      	nop
 8000470:	20000410 	.word	0x20000410

08000474 <stdlib_init_>:
 8000474:	b508      	push	{r3, lr}
 8000476:	4804      	ldr	r0, [pc, #16]	; (8000488 <stdlib_init_+0x14>)
 8000478:	f000 f928 	bl	80006cc <mutex_init>
 800047c:	4b03      	ldr	r3, [pc, #12]	; (800048c <stdlib_init_+0x18>)
 800047e:	4a04      	ldr	r2, [pc, #16]	; (8000490 <stdlib_init_+0x1c>)
 8000480:	6013      	str	r3, [r2, #0]
 8000482:	4a04      	ldr	r2, [pc, #16]	; (8000494 <stdlib_init_+0x20>)
 8000484:	6013      	str	r3, [r2, #0]
 8000486:	bd08      	pop	{r3, pc}
 8000488:	200004fc 	.word	0x200004fc
 800048c:	20000b8c 	.word	0x20000b8c
 8000490:	200004f4 	.word	0x200004f4
 8000494:	200004f8 	.word	0x200004f8

08000498 <lib_os_init>:
 8000498:	b508      	push	{r3, lr}
 800049a:	f7ff ff81 	bl	80003a0 <kernel_init>
 800049e:	f7ff ffe9 	bl	8000474 <stdlib_init_>
 80004a2:	f000 f8f9 	bl	8000698 <messages_init>
 80004a6:	e8bd 4008 	ldmia.w	sp!, {r3, lr}
 80004aa:	f000 b8cd 	b.w	8000648 <stdio_init>
	...

080004b0 <putc_>:
 80004b0:	b538      	push	{r3, r4, r5, lr}
 80004b2:	4c06      	ldr	r4, [pc, #24]	; (80004cc <putc_+0x1c>)
 80004b4:	4605      	mov	r5, r0
 80004b6:	4620      	mov	r0, r4
 80004b8:	f000 f912 	bl	80006e0 <mutex_lock>
 80004bc:	4628      	mov	r0, r5
 80004be:	f000 f9b7 	bl	8000830 <uart_write>
 80004c2:	4620      	mov	r0, r4
 80004c4:	e8bd 4038 	ldmia.w	sp!, {r3, r4, r5, lr}
 80004c8:	f000 b926 	b.w	8000718 <mutex_unlock>
 80004cc:	20000500 	.word	0x20000500

080004d0 <puts_>:
 80004d0:	b510      	push	{r4, lr}
 80004d2:	4604      	mov	r4, r0
 80004d4:	4807      	ldr	r0, [pc, #28]	; (80004f4 <puts_+0x24>)
 80004d6:	f000 f903 	bl	80006e0 <mutex_lock>
 80004da:	3c01      	subs	r4, #1
 80004dc:	f814 0f01 	ldrb.w	r0, [r4, #1]!
 80004e0:	b110      	cbz	r0, 80004e8 <puts_+0x18>
 80004e2:	f7ff ffe5 	bl	80004b0 <putc_>
 80004e6:	e7f9      	b.n	80004dc <puts_+0xc>
 80004e8:	4802      	ldr	r0, [pc, #8]	; (80004f4 <puts_+0x24>)
 80004ea:	e8bd 4010 	ldmia.w	sp!, {r4, lr}
 80004ee:	f000 b913 	b.w	8000718 <mutex_unlock>
 80004f2:	bf00      	nop
 80004f4:	2000050c 	.word	0x2000050c

080004f8 <puti_>:
 80004f8:	b530      	push	{r4, r5, lr}
 80004fa:	b085      	sub	sp, #20
 80004fc:	1e03      	subs	r3, r0, #0
 80004fe:	f04f 0200 	mov.w	r2, #0
 8000502:	bfa8      	it	ge
 8000504:	4614      	movge	r4, r2
 8000506:	f88d 200f 	strb.w	r2, [sp, #15]
 800050a:	bfbc      	itt	lt
 800050c:	425b      	neglt	r3, r3
 800050e:	2401      	movlt	r4, #1
 8000510:	220a      	movs	r2, #10
 8000512:	210a      	movs	r1, #10
 8000514:	fb93 f5f1 	sdiv	r5, r3, r1
 8000518:	fb01 3315 	mls	r3, r1, r5, r3
 800051c:	a801      	add	r0, sp, #4
 800051e:	3330      	adds	r3, #48	; 0x30
 8000520:	5413      	strb	r3, [r2, r0]
 8000522:	1e51      	subs	r1, r2, #1
 8000524:	462b      	mov	r3, r5
 8000526:	b10d      	cbz	r5, 800052c <puti_+0x34>
 8000528:	460a      	mov	r2, r1
 800052a:	e7f2      	b.n	8000512 <puti_+0x1a>
 800052c:	b12c      	cbz	r4, 800053a <puti_+0x42>
 800052e:	ab04      	add	r3, sp, #16
 8000530:	440b      	add	r3, r1
 8000532:	222d      	movs	r2, #45	; 0x2d
 8000534:	f803 2c0c 	strb.w	r2, [r3, #-12]
 8000538:	460a      	mov	r2, r1
 800053a:	4410      	add	r0, r2
 800053c:	f7ff ffc8 	bl	80004d0 <puts_>
 8000540:	b005      	add	sp, #20
 8000542:	bd30      	pop	{r4, r5, pc}

08000544 <putui_>:
 8000544:	b51f      	push	{r0, r1, r2, r3, r4, lr}
 8000546:	2300      	movs	r3, #0
 8000548:	f88d 300f 	strb.w	r3, [sp, #15]
 800054c:	230a      	movs	r3, #10
 800054e:	240a      	movs	r4, #10
 8000550:	fbb0 f1f4 	udiv	r1, r0, r4
 8000554:	fb04 0011 	mls	r0, r4, r1, r0
 8000558:	aa01      	add	r2, sp, #4
 800055a:	3030      	adds	r0, #48	; 0x30
 800055c:	5498      	strb	r0, [r3, r2]
 800055e:	1e5c      	subs	r4, r3, #1
 8000560:	4608      	mov	r0, r1
 8000562:	b109      	cbz	r1, 8000568 <putui_+0x24>
 8000564:	4623      	mov	r3, r4
 8000566:	e7f2      	b.n	800054e <putui_+0xa>
 8000568:	18d0      	adds	r0, r2, r3
 800056a:	f7ff ffb1 	bl	80004d0 <puts_>
 800056e:	b004      	add	sp, #16
 8000570:	bd10      	pop	{r4, pc}

08000572 <putx_>:
 8000572:	b51f      	push	{r0, r1, r2, r3, r4, lr}
 8000574:	2300      	movs	r3, #0
 8000576:	f88d 300f 	strb.w	r3, [sp, #15]
 800057a:	230a      	movs	r3, #10
 800057c:	f000 010f 	and.w	r1, r0, #15
 8000580:	2909      	cmp	r1, #9
 8000582:	aa01      	add	r2, sp, #4
 8000584:	bf94      	ite	ls
 8000586:	3130      	addls	r1, #48	; 0x30
 8000588:	3157      	addhi	r1, #87	; 0x57
 800058a:	0900      	lsrs	r0, r0, #4
 800058c:	54d1      	strb	r1, [r2, r3]
 800058e:	f103 31ff 	add.w	r1, r3, #4294967295
 8000592:	d001      	beq.n	8000598 <putx_+0x26>
 8000594:	460b      	mov	r3, r1
 8000596:	e7f1      	b.n	800057c <putx_+0xa>
 8000598:	18d0      	adds	r0, r2, r3
 800059a:	f7ff ff99 	bl	80004d0 <puts_>
 800059e:	b005      	add	sp, #20
 80005a0:	f85d fb04 	ldr.w	pc, [sp], #4

080005a4 <printf_>:
 80005a4:	b40f      	push	{r0, r1, r2, r3}
 80005a6:	b537      	push	{r0, r1, r2, r4, r5, lr}
 80005a8:	ac06      	add	r4, sp, #24
 80005aa:	4826      	ldr	r0, [pc, #152]	; (8000644 <printf_+0xa0>)
 80005ac:	f854 5b04 	ldr.w	r5, [r4], #4
 80005b0:	f000 f896 	bl	80006e0 <mutex_lock>
 80005b4:	9401      	str	r4, [sp, #4]
 80005b6:	2400      	movs	r4, #0
 80005b8:	5d28      	ldrb	r0, [r5, r4]
 80005ba:	2800      	cmp	r0, #0
 80005bc:	d039      	beq.n	8000632 <printf_+0x8e>
 80005be:	2825      	cmp	r0, #37	; 0x25
 80005c0:	d003      	beq.n	80005ca <printf_+0x26>
 80005c2:	f7ff ff75 	bl	80004b0 <putc_>
 80005c6:	3401      	adds	r4, #1
 80005c8:	e7f6      	b.n	80005b8 <printf_+0x14>
 80005ca:	192b      	adds	r3, r5, r4
 80005cc:	7858      	ldrb	r0, [r3, #1]
 80005ce:	2869      	cmp	r0, #105	; 0x69
 80005d0:	d016      	beq.n	8000600 <printf_+0x5c>
 80005d2:	d808      	bhi.n	80005e6 <printf_+0x42>
 80005d4:	2825      	cmp	r0, #37	; 0x25
 80005d6:	d028      	beq.n	800062a <printf_+0x86>
 80005d8:	2863      	cmp	r0, #99	; 0x63
 80005da:	d128      	bne.n	800062e <printf_+0x8a>
 80005dc:	9b01      	ldr	r3, [sp, #4]
 80005de:	1d1a      	adds	r2, r3, #4
 80005e0:	9201      	str	r2, [sp, #4]
 80005e2:	7818      	ldrb	r0, [r3, #0]
 80005e4:	e021      	b.n	800062a <printf_+0x86>
 80005e6:	2875      	cmp	r0, #117	; 0x75
 80005e8:	d011      	beq.n	800060e <printf_+0x6a>
 80005ea:	2878      	cmp	r0, #120	; 0x78
 80005ec:	d016      	beq.n	800061c <printf_+0x78>
 80005ee:	2873      	cmp	r0, #115	; 0x73
 80005f0:	d11d      	bne.n	800062e <printf_+0x8a>
 80005f2:	9b01      	ldr	r3, [sp, #4]
 80005f4:	1d1a      	adds	r2, r3, #4
 80005f6:	6818      	ldr	r0, [r3, #0]
 80005f8:	9201      	str	r2, [sp, #4]
 80005fa:	f7ff ff69 	bl	80004d0 <puts_>
 80005fe:	e016      	b.n	800062e <printf_+0x8a>
 8000600:	9b01      	ldr	r3, [sp, #4]
 8000602:	1d1a      	adds	r2, r3, #4
 8000604:	6818      	ldr	r0, [r3, #0]
 8000606:	9201      	str	r2, [sp, #4]
 8000608:	f7ff ff76 	bl	80004f8 <puti_>
 800060c:	e00f      	b.n	800062e <printf_+0x8a>
 800060e:	9b01      	ldr	r3, [sp, #4]
 8000610:	1d1a      	adds	r2, r3, #4
 8000612:	6818      	ldr	r0, [r3, #0]
 8000614:	9201      	str	r2, [sp, #4]
 8000616:	f7ff ff95 	bl	8000544 <putui_>
 800061a:	e008      	b.n	800062e <printf_+0x8a>
 800061c:	9b01      	ldr	r3, [sp, #4]
 800061e:	1d1a      	adds	r2, r3, #4
 8000620:	6818      	ldr	r0, [r3, #0]
 8000622:	9201      	str	r2, [sp, #4]
 8000624:	f7ff ffa5 	bl	8000572 <putx_>
 8000628:	e001      	b.n	800062e <printf_+0x8a>
 800062a:	f7ff ff41 	bl	80004b0 <putc_>
 800062e:	3402      	adds	r4, #2
 8000630:	e7c2      	b.n	80005b8 <printf_+0x14>
 8000632:	4804      	ldr	r0, [pc, #16]	; (8000644 <printf_+0xa0>)
 8000634:	f000 f870 	bl	8000718 <mutex_unlock>
 8000638:	b003      	add	sp, #12
 800063a:	e8bd 4030 	ldmia.w	sp!, {r4, r5, lr}
 800063e:	b004      	add	sp, #16
 8000640:	4770      	bx	lr
 8000642:	bf00      	nop
 8000644:	20000508 	.word	0x20000508

08000648 <stdio_init>:
 8000648:	b510      	push	{r4, lr}
 800064a:	480e      	ldr	r0, [pc, #56]	; (8000684 <stdio_init+0x3c>)
 800064c:	f000 f83e 	bl	80006cc <mutex_init>
 8000650:	480d      	ldr	r0, [pc, #52]	; (8000688 <stdio_init+0x40>)
 8000652:	f000 f83b 	bl	80006cc <mutex_init>
 8000656:	480d      	ldr	r0, [pc, #52]	; (800068c <stdio_init+0x44>)
 8000658:	f000 f838 	bl	80006cc <mutex_init>
 800065c:	480c      	ldr	r0, [pc, #48]	; (8000690 <stdio_init+0x48>)
 800065e:	f000 f835 	bl	80006cc <mutex_init>
 8000662:	2408      	movs	r4, #8
 8000664:	2020      	movs	r0, #32
 8000666:	f7ff ff23 	bl	80004b0 <putc_>
 800066a:	3c01      	subs	r4, #1
 800066c:	d1fa      	bne.n	8000664 <stdio_init+0x1c>
 800066e:	2420      	movs	r4, #32
 8000670:	200a      	movs	r0, #10
 8000672:	f7ff ff1d 	bl	80004b0 <putc_>
 8000676:	3c01      	subs	r4, #1
 8000678:	d1fa      	bne.n	8000670 <stdio_init+0x28>
 800067a:	4806      	ldr	r0, [pc, #24]	; (8000694 <stdio_init+0x4c>)
 800067c:	e8bd 4010 	ldmia.w	sp!, {r4, lr}
 8000680:	f7ff bf90 	b.w	80005a4 <printf_>
 8000684:	20000500 	.word	0x20000500
 8000688:	20000504 	.word	0x20000504
 800068c:	2000050c 	.word	0x2000050c
 8000690:	20000508 	.word	0x20000508
 8000694:	0800101f 	.word	0x0800101f

08000698 <messages_init>:
 8000698:	b510      	push	{r4, lr}
 800069a:	2200      	movs	r2, #0
 800069c:	4909      	ldr	r1, [pc, #36]	; (80006c4 <messages_init+0x2c>)
 800069e:	2300      	movs	r3, #0
 80006a0:	f841 3022 	str.w	r3, [r1, r2, lsl #2]
 80006a4:	3201      	adds	r2, #1
 80006a6:	2a08      	cmp	r2, #8
 80006a8:	d1f8      	bne.n	800069c <messages_init+0x4>
 80006aa:	4c07      	ldr	r4, [pc, #28]	; (80006c8 <messages_init+0x30>)
 80006ac:	0118      	lsls	r0, r3, #4
 80006ae:	1821      	adds	r1, r4, r0
 80006b0:	3301      	adds	r3, #1
 80006b2:	2200      	movs	r2, #0
 80006b4:	2b04      	cmp	r3, #4
 80006b6:	604a      	str	r2, [r1, #4]
 80006b8:	5022      	str	r2, [r4, r0]
 80006ba:	60ca      	str	r2, [r1, #12]
 80006bc:	608a      	str	r2, [r1, #8]
 80006be:	d1f4      	bne.n	80006aa <messages_init+0x12>
 80006c0:	bd10      	pop	{r4, pc}
 80006c2:	bf00      	nop
 80006c4:	20000510 	.word	0x20000510
 80006c8:	20000530 	.word	0x20000530

080006cc <mutex_init>:
 80006cc:	b510      	push	{r4, lr}
 80006ce:	4604      	mov	r4, r0
 80006d0:	f7ff fe14 	bl	80002fc <sched_off>
 80006d4:	2300      	movs	r3, #0
 80006d6:	6023      	str	r3, [r4, #0]
 80006d8:	e8bd 4010 	ldmia.w	sp!, {r4, lr}
 80006dc:	f7ff be10 	b.w	8000300 <sched_on>

080006e0 <mutex_lock>:
 80006e0:	b513      	push	{r0, r1, r4, lr}
 80006e2:	4604      	mov	r4, r0
 80006e4:	f7ff fe0a 	bl	80002fc <sched_off>
 80006e8:	6823      	ldr	r3, [r4, #0]
 80006ea:	9301      	str	r3, [sp, #4]
 80006ec:	f7ff fe08 	bl	8000300 <sched_on>
 80006f0:	9b01      	ldr	r3, [sp, #4]
 80006f2:	b10b      	cbz	r3, 80006f8 <mutex_lock+0x18>
 80006f4:	f7ff fe76 	bl	80003e4 <set_wait_state>
 80006f8:	9b01      	ldr	r3, [sp, #4]
 80006fa:	2b00      	cmp	r3, #0
 80006fc:	d1f2      	bne.n	80006e4 <mutex_lock+0x4>
 80006fe:	f7ff fdfd 	bl	80002fc <sched_off>
 8000702:	6823      	ldr	r3, [r4, #0]
 8000704:	9301      	str	r3, [sp, #4]
 8000706:	9b01      	ldr	r3, [sp, #4]
 8000708:	2b00      	cmp	r3, #0
 800070a:	d1eb      	bne.n	80006e4 <mutex_lock+0x4>
 800070c:	2301      	movs	r3, #1
 800070e:	6023      	str	r3, [r4, #0]
 8000710:	f7ff fdf6 	bl	8000300 <sched_on>
 8000714:	b002      	add	sp, #8
 8000716:	bd10      	pop	{r4, pc}

08000718 <mutex_unlock>:
 8000718:	b508      	push	{r3, lr}
 800071a:	f7ff ffd7 	bl	80006cc <mutex_init>
 800071e:	f7ff fe83 	bl	8000428 <wake_up_threads>
 8000722:	e8bd 4008 	ldmia.w	sp!, {r3, lr}
 8000726:	f7ff bded 	b.w	8000304 <yield>
	...

0800072c <thread_02>:
 800072c:	b510      	push	{r4, lr}
 800072e:	2400      	movs	r4, #0
 8000730:	4621      	mov	r1, r4
 8000732:	4803      	ldr	r0, [pc, #12]	; (8000740 <thread_02+0x14>)
 8000734:	3401      	adds	r4, #1
 8000736:	f7ff ff35 	bl	80005a4 <printf_>
 800073a:	2c0a      	cmp	r4, #10
 800073c:	d1f8      	bne.n	8000730 <thread_02+0x4>
 800073e:	bd10      	pop	{r4, pc}
 8000740:	08001030 	.word	0x08001030

08000744 <thread_01>:
 8000744:	b510      	push	{r4, lr}
 8000746:	f44f 4080 	mov.w	r0, #16384	; 0x4000
 800074a:	f000 fbc9 	bl	8000ee0 <led_on>
 800074e:	4812      	ldr	r0, [pc, #72]	; (8000798 <thread_01+0x54>)
 8000750:	f7ff ff28 	bl	80005a4 <printf_>
 8000754:	4811      	ldr	r0, [pc, #68]	; (800079c <thread_01+0x58>)
 8000756:	f7ff ff25 	bl	80005a4 <printf_>
 800075a:	4811      	ldr	r0, [pc, #68]	; (80007a0 <thread_01+0x5c>)
 800075c:	4911      	ldr	r1, [pc, #68]	; (80007a4 <thread_01+0x60>)
 800075e:	f44f 7200 	mov.w	r2, #512	; 0x200
 8000762:	2308      	movs	r3, #8
 8000764:	f7ff fde2 	bl	800032c <create_thread>
 8000768:	2808      	cmp	r0, #8
 800076a:	4604      	mov	r4, r0
 800076c:	d101      	bne.n	8000772 <thread_01+0x2e>
 800076e:	480e      	ldr	r0, [pc, #56]	; (80007a8 <thread_01+0x64>)
 8000770:	e007      	b.n	8000782 <thread_01+0x3e>
 8000772:	480e      	ldr	r0, [pc, #56]	; (80007ac <thread_01+0x68>)
 8000774:	4621      	mov	r1, r4
 8000776:	f7ff ff15 	bl	80005a4 <printf_>
 800077a:	4620      	mov	r0, r4
 800077c:	f7ff fe66 	bl	800044c <join>
 8000780:	480b      	ldr	r0, [pc, #44]	; (80007b0 <thread_01+0x6c>)
 8000782:	f7ff ff0f 	bl	80005a4 <printf_>
 8000786:	f44f 4080 	mov.w	r0, #16384	; 0x4000
 800078a:	f000 fbaf 	bl	8000eec <led_off>
 800078e:	f44f 70fa 	mov.w	r0, #500	; 0x1f4
 8000792:	f000 fb57 	bl	8000e44 <timer_delay_ms>
 8000796:	e7d6      	b.n	8000746 <thread_01+0x2>
 8000798:	0800104e 	.word	0x0800104e
 800079c:	08001058 	.word	0x08001058
 80007a0:	0800072d 	.word	0x0800072d
 80007a4:	20000770 	.word	0x20000770
 80007a8:	0800106f 	.word	0x0800106f
 80007ac:	08001086 	.word	0x08001086
 80007b0:	0800102a 	.word	0x0800102a

080007b4 <thread_03>:
 80007b4:	b508      	push	{r3, lr}
 80007b6:	4803      	ldr	r0, [pc, #12]	; (80007c4 <thread_03+0x10>)
 80007b8:	f7ff fef4 	bl	80005a4 <printf_>
 80007bc:	2064      	movs	r0, #100	; 0x64
 80007be:	f000 fb41 	bl	8000e44 <timer_delay_ms>
 80007c2:	e7f8      	b.n	80007b6 <thread_03+0x2>
 80007c4:	080010a2 	.word	0x080010a2

080007c8 <main_thread>:
 80007c8:	b508      	push	{r3, lr}
 80007ca:	4813      	ldr	r0, [pc, #76]	; (8000818 <main_thread+0x50>)
 80007cc:	f7ff feea 	bl	80005a4 <printf_>
 80007d0:	4912      	ldr	r1, [pc, #72]	; (800081c <main_thread+0x54>)
 80007d2:	4813      	ldr	r0, [pc, #76]	; (8000820 <main_thread+0x58>)
 80007d4:	f44f 7200 	mov.w	r2, #512	; 0x200
 80007d8:	2308      	movs	r3, #8
 80007da:	f7ff fda7 	bl	800032c <create_thread>
 80007de:	4811      	ldr	r0, [pc, #68]	; (8000824 <main_thread+0x5c>)
 80007e0:	4911      	ldr	r1, [pc, #68]	; (8000828 <main_thread+0x60>)
 80007e2:	f44f 7200 	mov.w	r2, #512	; 0x200
 80007e6:	2308      	movs	r3, #8
 80007e8:	f7ff fda0 	bl	800032c <create_thread>
 80007ec:	f44f 5000 	mov.w	r0, #8192	; 0x2000
 80007f0:	f000 fb76 	bl	8000ee0 <led_on>
 80007f4:	f000 fb18 	bl	8000e28 <timer_get_time>
 80007f8:	f44f 717a 	mov.w	r1, #1000	; 0x3e8
 80007fc:	fbb0 f1f1 	udiv	r1, r0, r1
 8000800:	480a      	ldr	r0, [pc, #40]	; (800082c <main_thread+0x64>)
 8000802:	f7ff fecf 	bl	80005a4 <printf_>
 8000806:	f44f 5000 	mov.w	r0, #8192	; 0x2000
 800080a:	f000 fb6f 	bl	8000eec <led_off>
 800080e:	f44f 60fa 	mov.w	r0, #2000	; 0x7d0
 8000812:	f000 fb17 	bl	8000e44 <timer_delay_ms>
 8000816:	e7e9      	b.n	80007ec <main_thread+0x24>
 8000818:	080010b3 	.word	0x080010b3
 800081c:	20000570 	.word	0x20000570
 8000820:	08000745 	.word	0x08000745
 8000824:	080007b5 	.word	0x080007b5
 8000828:	20000970 	.word	0x20000970
 800082c:	080010ee 	.word	0x080010ee

08000830 <uart_write>:
 8000830:	4b03      	ldr	r3, [pc, #12]	; (8000840 <uart_write+0x10>)
 8000832:	881a      	ldrh	r2, [r3, #0]
 8000834:	0652      	lsls	r2, r2, #25
 8000836:	d401      	bmi.n	800083c <uart_write+0xc>
 8000838:	bf00      	nop
 800083a:	e7f9      	b.n	8000830 <uart_write>
 800083c:	8098      	strh	r0, [r3, #4]
 800083e:	4770      	bx	lr
 8000840:	40011000 	.word	0x40011000

08000844 <uart_init>:
 8000844:	b530      	push	{r4, r5, lr}
 8000846:	2010      	movs	r0, #16
 8000848:	b087      	sub	sp, #28
 800084a:	2101      	movs	r1, #1
 800084c:	f000 f90c 	bl	8000a68 <RCC_APB2PeriphClockCmd>
 8000850:	2001      	movs	r0, #1
 8000852:	4d1c      	ldr	r5, [pc, #112]	; (80008c4 <uart_init+0x80>)
 8000854:	4601      	mov	r1, r0
 8000856:	f000 f8ef 	bl	8000a38 <RCC_AHB1PeriphClockCmd>
 800085a:	f44f 63c0 	mov.w	r3, #1536	; 0x600
 800085e:	2400      	movs	r4, #0
 8000860:	9300      	str	r3, [sp, #0]
 8000862:	4628      	mov	r0, r5
 8000864:	2302      	movs	r3, #2
 8000866:	4669      	mov	r1, sp
 8000868:	f88d 3004 	strb.w	r3, [sp, #4]
 800086c:	f88d 3005 	strb.w	r3, [sp, #5]
 8000870:	f88d 4006 	strb.w	r4, [sp, #6]
 8000874:	f88d 4007 	strb.w	r4, [sp, #7]
 8000878:	f000 fb3e 	bl	8000ef8 <GPIO_Init>
 800087c:	4628      	mov	r0, r5
 800087e:	2109      	movs	r1, #9
 8000880:	2207      	movs	r2, #7
 8000882:	f000 fb7a 	bl	8000f7a <GPIO_PinAFConfig>
 8000886:	2207      	movs	r2, #7
 8000888:	4628      	mov	r0, r5
 800088a:	210a      	movs	r1, #10
 800088c:	f000 fb75 	bl	8000f7a <GPIO_PinAFConfig>
 8000890:	f8ad 400c 	strh.w	r4, [sp, #12]
 8000894:	f8ad 400e 	strh.w	r4, [sp, #14]
 8000898:	f8ad 4010 	strh.w	r4, [sp, #16]
 800089c:	f8ad 4014 	strh.w	r4, [sp, #20]
 80008a0:	4c09      	ldr	r4, [pc, #36]	; (80008c8 <uart_init+0x84>)
 80008a2:	f44f 33e1 	mov.w	r3, #115200	; 0x1c200
 80008a6:	9302      	str	r3, [sp, #8]
 80008a8:	4620      	mov	r0, r4
 80008aa:	230c      	movs	r3, #12
 80008ac:	a902      	add	r1, sp, #8
 80008ae:	f8ad 3012 	strh.w	r3, [sp, #18]
 80008b2:	f000 f80b 	bl	80008cc <USART_Init>
 80008b6:	4620      	mov	r0, r4
 80008b8:	2101      	movs	r1, #1
 80008ba:	f000 f861 	bl	8000980 <USART_Cmd>
 80008be:	b007      	add	sp, #28
 80008c0:	bd30      	pop	{r4, r5, pc}
 80008c2:	bf00      	nop
 80008c4:	40020000 	.word	0x40020000
 80008c8:	40011000 	.word	0x40011000

080008cc <USART_Init>:
 80008cc:	8a03      	ldrh	r3, [r0, #16]
 80008ce:	88ca      	ldrh	r2, [r1, #6]
 80008d0:	b29b      	uxth	r3, r3
 80008d2:	f423 5340 	bic.w	r3, r3, #12288	; 0x3000
 80008d6:	b530      	push	{r4, r5, lr}
 80008d8:	4313      	orrs	r3, r2
 80008da:	460d      	mov	r5, r1
 80008dc:	8203      	strh	r3, [r0, #16]
 80008de:	8983      	ldrh	r3, [r0, #12]
 80008e0:	8909      	ldrh	r1, [r1, #8]
 80008e2:	88aa      	ldrh	r2, [r5, #4]
 80008e4:	f423 53b0 	bic.w	r3, r3, #5632	; 0x1600
 80008e8:	430a      	orrs	r2, r1
 80008ea:	8969      	ldrh	r1, [r5, #10]
 80008ec:	f023 030c 	bic.w	r3, r3, #12
 80008f0:	430a      	orrs	r2, r1
 80008f2:	041b      	lsls	r3, r3, #16
 80008f4:	b292      	uxth	r2, r2
 80008f6:	0c1b      	lsrs	r3, r3, #16
 80008f8:	4313      	orrs	r3, r2
 80008fa:	8183      	strh	r3, [r0, #12]
 80008fc:	8a83      	ldrh	r3, [r0, #20]
 80008fe:	89aa      	ldrh	r2, [r5, #12]
 8000900:	b29b      	uxth	r3, r3
 8000902:	f423 7340 	bic.w	r3, r3, #768	; 0x300
 8000906:	4313      	orrs	r3, r2
 8000908:	b085      	sub	sp, #20
 800090a:	8283      	strh	r3, [r0, #20]
 800090c:	4604      	mov	r4, r0
 800090e:	4668      	mov	r0, sp
 8000910:	f000 f84e 	bl	80009b0 <RCC_GetClocksFreq>
 8000914:	4b19      	ldr	r3, [pc, #100]	; (800097c <USART_Init+0xb0>)
 8000916:	429c      	cmp	r4, r3
 8000918:	d003      	beq.n	8000922 <USART_Init+0x56>
 800091a:	f503 6380 	add.w	r3, r3, #1024	; 0x400
 800091e:	429c      	cmp	r4, r3
 8000920:	d101      	bne.n	8000926 <USART_Init+0x5a>
 8000922:	9b03      	ldr	r3, [sp, #12]
 8000924:	e000      	b.n	8000928 <USART_Init+0x5c>
 8000926:	9b02      	ldr	r3, [sp, #8]
 8000928:	89a2      	ldrh	r2, [r4, #12]
 800092a:	b212      	sxth	r2, r2
 800092c:	2a00      	cmp	r2, #0
 800092e:	682a      	ldr	r2, [r5, #0]
 8000930:	f04f 0119 	mov.w	r1, #25
 8000934:	bfb4      	ite	lt
 8000936:	0052      	lsllt	r2, r2, #1
 8000938:	0092      	lslge	r2, r2, #2
 800093a:	4359      	muls	r1, r3
 800093c:	fbb1 f1f2 	udiv	r1, r1, r2
 8000940:	2364      	movs	r3, #100	; 0x64
 8000942:	fbb1 f2f3 	udiv	r2, r1, r3
 8000946:	0112      	lsls	r2, r2, #4
 8000948:	0910      	lsrs	r0, r2, #4
 800094a:	fb03 1110 	mls	r1, r3, r0, r1
 800094e:	89a0      	ldrh	r0, [r4, #12]
 8000950:	b200      	sxth	r0, r0
 8000952:	2800      	cmp	r0, #0
 8000954:	da06      	bge.n	8000964 <USART_Init+0x98>
 8000956:	00c9      	lsls	r1, r1, #3
 8000958:	3132      	adds	r1, #50	; 0x32
 800095a:	fbb1 f3f3 	udiv	r3, r1, r3
 800095e:	f003 0307 	and.w	r3, r3, #7
 8000962:	e005      	b.n	8000970 <USART_Init+0xa4>
 8000964:	0109      	lsls	r1, r1, #4
 8000966:	3132      	adds	r1, #50	; 0x32
 8000968:	fbb1 f3f3 	udiv	r3, r1, r3
 800096c:	f003 030f 	and.w	r3, r3, #15
 8000970:	431a      	orrs	r2, r3
 8000972:	b292      	uxth	r2, r2
 8000974:	8122      	strh	r2, [r4, #8]
 8000976:	b005      	add	sp, #20
 8000978:	bd30      	pop	{r4, r5, pc}
 800097a:	bf00      	nop
 800097c:	40011000 	.word	0x40011000

08000980 <USART_Cmd>:
 8000980:	8983      	ldrh	r3, [r0, #12]
 8000982:	b119      	cbz	r1, 800098c <USART_Cmd+0xc>
 8000984:	b29b      	uxth	r3, r3
 8000986:	f443 5300 	orr.w	r3, r3, #8192	; 0x2000
 800098a:	e003      	b.n	8000994 <USART_Cmd+0x14>
 800098c:	f423 5300 	bic.w	r3, r3, #8192	; 0x2000
 8000990:	041b      	lsls	r3, r3, #16
 8000992:	0c1b      	lsrs	r3, r3, #16
 8000994:	8183      	strh	r3, [r0, #12]
 8000996:	4770      	bx	lr

08000998 <lib_low_level_init>:
 8000998:	b508      	push	{r3, lr}
 800099a:	f000 f97f 	bl	8000c9c <sytem_clock_init>
 800099e:	f000 fa61 	bl	8000e64 <gpio_init>
 80009a2:	f7ff ff4f 	bl	8000844 <uart_init>
 80009a6:	e8bd 4008 	ldmia.w	sp!, {r3, lr}
 80009aa:	f000 b9c7 	b.w	8000d3c <timer_init>
	...

080009b0 <RCC_GetClocksFreq>:
 80009b0:	4b1d      	ldr	r3, [pc, #116]	; (8000a28 <RCC_GetClocksFreq+0x78>)
 80009b2:	689a      	ldr	r2, [r3, #8]
 80009b4:	f002 020c 	and.w	r2, r2, #12
 80009b8:	2a04      	cmp	r2, #4
 80009ba:	b510      	push	{r4, lr}
 80009bc:	d003      	beq.n	80009c6 <RCC_GetClocksFreq+0x16>
 80009be:	2a08      	cmp	r2, #8
 80009c0:	d003      	beq.n	80009ca <RCC_GetClocksFreq+0x1a>
 80009c2:	4b1a      	ldr	r3, [pc, #104]	; (8000a2c <RCC_GetClocksFreq+0x7c>)
 80009c4:	e018      	b.n	80009f8 <RCC_GetClocksFreq+0x48>
 80009c6:	4b1a      	ldr	r3, [pc, #104]	; (8000a30 <RCC_GetClocksFreq+0x80>)
 80009c8:	e016      	b.n	80009f8 <RCC_GetClocksFreq+0x48>
 80009ca:	6859      	ldr	r1, [r3, #4]
 80009cc:	685a      	ldr	r2, [r3, #4]
 80009ce:	f411 0f80 	tst.w	r1, #4194304	; 0x400000
 80009d2:	6859      	ldr	r1, [r3, #4]
 80009d4:	bf14      	ite	ne
 80009d6:	4b16      	ldrne	r3, [pc, #88]	; (8000a30 <RCC_GetClocksFreq+0x80>)
 80009d8:	4b14      	ldreq	r3, [pc, #80]	; (8000a2c <RCC_GetClocksFreq+0x7c>)
 80009da:	f002 023f 	and.w	r2, r2, #63	; 0x3f
 80009de:	fbb3 f3f2 	udiv	r3, r3, r2
 80009e2:	4a11      	ldr	r2, [pc, #68]	; (8000a28 <RCC_GetClocksFreq+0x78>)
 80009e4:	6852      	ldr	r2, [r2, #4]
 80009e6:	f3c2 4201 	ubfx	r2, r2, #16, #2
 80009ea:	f3c1 1188 	ubfx	r1, r1, #6, #9
 80009ee:	3201      	adds	r2, #1
 80009f0:	434b      	muls	r3, r1
 80009f2:	0052      	lsls	r2, r2, #1
 80009f4:	fbb3 f3f2 	udiv	r3, r3, r2
 80009f8:	490b      	ldr	r1, [pc, #44]	; (8000a28 <RCC_GetClocksFreq+0x78>)
 80009fa:	6003      	str	r3, [r0, #0]
 80009fc:	688b      	ldr	r3, [r1, #8]
 80009fe:	4a0d      	ldr	r2, [pc, #52]	; (8000a34 <RCC_GetClocksFreq+0x84>)
 8000a00:	f3c3 1303 	ubfx	r3, r3, #4, #4
 8000a04:	5cd4      	ldrb	r4, [r2, r3]
 8000a06:	6803      	ldr	r3, [r0, #0]
 8000a08:	40e3      	lsrs	r3, r4
 8000a0a:	6043      	str	r3, [r0, #4]
 8000a0c:	688c      	ldr	r4, [r1, #8]
 8000a0e:	f3c4 2482 	ubfx	r4, r4, #10, #3
 8000a12:	5d14      	ldrb	r4, [r2, r4]
 8000a14:	fa23 f404 	lsr.w	r4, r3, r4
 8000a18:	6084      	str	r4, [r0, #8]
 8000a1a:	6889      	ldr	r1, [r1, #8]
 8000a1c:	f3c1 3142 	ubfx	r1, r1, #13, #3
 8000a20:	5c52      	ldrb	r2, [r2, r1]
 8000a22:	40d3      	lsrs	r3, r2
 8000a24:	60c3      	str	r3, [r0, #12]
 8000a26:	bd10      	pop	{r4, pc}
 8000a28:	40023800 	.word	0x40023800
 8000a2c:	00f42400 	.word	0x00f42400
 8000a30:	007a1200 	.word	0x007a1200
 8000a34:	20000000 	.word	0x20000000

08000a38 <RCC_AHB1PeriphClockCmd>:
 8000a38:	4b04      	ldr	r3, [pc, #16]	; (8000a4c <RCC_AHB1PeriphClockCmd+0x14>)
 8000a3a:	6b1a      	ldr	r2, [r3, #48]	; 0x30
 8000a3c:	b109      	cbz	r1, 8000a42 <RCC_AHB1PeriphClockCmd+0xa>
 8000a3e:	4310      	orrs	r0, r2
 8000a40:	e001      	b.n	8000a46 <RCC_AHB1PeriphClockCmd+0xe>
 8000a42:	ea22 0000 	bic.w	r0, r2, r0
 8000a46:	6318      	str	r0, [r3, #48]	; 0x30
 8000a48:	4770      	bx	lr
 8000a4a:	bf00      	nop
 8000a4c:	40023800 	.word	0x40023800

08000a50 <RCC_APB1PeriphClockCmd>:
 8000a50:	4b04      	ldr	r3, [pc, #16]	; (8000a64 <RCC_APB1PeriphClockCmd+0x14>)
 8000a52:	6c1a      	ldr	r2, [r3, #64]	; 0x40
 8000a54:	b109      	cbz	r1, 8000a5a <RCC_APB1PeriphClockCmd+0xa>
 8000a56:	4310      	orrs	r0, r2
 8000a58:	e001      	b.n	8000a5e <RCC_APB1PeriphClockCmd+0xe>
 8000a5a:	ea22 0000 	bic.w	r0, r2, r0
 8000a5e:	6418      	str	r0, [r3, #64]	; 0x40
 8000a60:	4770      	bx	lr
 8000a62:	bf00      	nop
 8000a64:	40023800 	.word	0x40023800

08000a68 <RCC_APB2PeriphClockCmd>:
 8000a68:	4b04      	ldr	r3, [pc, #16]	; (8000a7c <RCC_APB2PeriphClockCmd+0x14>)
 8000a6a:	6c5a      	ldr	r2, [r3, #68]	; 0x44
 8000a6c:	b109      	cbz	r1, 8000a72 <RCC_APB2PeriphClockCmd+0xa>
 8000a6e:	4310      	orrs	r0, r2
 8000a70:	e001      	b.n	8000a76 <RCC_APB2PeriphClockCmd+0xe>
 8000a72:	ea22 0000 	bic.w	r0, r2, r0
 8000a76:	6458      	str	r0, [r3, #68]	; 0x44
 8000a78:	4770      	bx	lr
 8000a7a:	bf00      	nop
 8000a7c:	40023800 	.word	0x40023800

08000a80 <NVIC_Init>:
 8000a80:	78c2      	ldrb	r2, [r0, #3]
 8000a82:	7803      	ldrb	r3, [r0, #0]
 8000a84:	b510      	push	{r4, lr}
 8000a86:	b30a      	cbz	r2, 8000acc <NVIC_Init+0x4c>
 8000a88:	4a16      	ldr	r2, [pc, #88]	; (8000ae4 <NVIC_Init+0x64>)
 8000a8a:	7844      	ldrb	r4, [r0, #1]
 8000a8c:	68d2      	ldr	r2, [r2, #12]
 8000a8e:	43d2      	mvns	r2, r2
 8000a90:	f3c2 2202 	ubfx	r2, r2, #8, #3
 8000a94:	f1c2 0104 	rsb	r1, r2, #4
 8000a98:	b2c9      	uxtb	r1, r1
 8000a9a:	fa04 f101 	lsl.w	r1, r4, r1
 8000a9e:	240f      	movs	r4, #15
 8000aa0:	fa44 f202 	asr.w	r2, r4, r2
 8000aa4:	7884      	ldrb	r4, [r0, #2]
 8000aa6:	b2c9      	uxtb	r1, r1
 8000aa8:	4022      	ands	r2, r4
 8000aaa:	430a      	orrs	r2, r1
 8000aac:	f103 4360 	add.w	r3, r3, #3758096384	; 0xe0000000
 8000ab0:	f503 4361 	add.w	r3, r3, #57600	; 0xe100
 8000ab4:	0112      	lsls	r2, r2, #4
 8000ab6:	b2d2      	uxtb	r2, r2
 8000ab8:	f883 2300 	strb.w	r2, [r3, #768]	; 0x300
 8000abc:	7803      	ldrb	r3, [r0, #0]
 8000abe:	2201      	movs	r2, #1
 8000ac0:	0959      	lsrs	r1, r3, #5
 8000ac2:	f003 031f 	and.w	r3, r3, #31
 8000ac6:	fa02 f303 	lsl.w	r3, r2, r3
 8000aca:	e006      	b.n	8000ada <NVIC_Init+0x5a>
 8000acc:	0959      	lsrs	r1, r3, #5
 8000ace:	2201      	movs	r2, #1
 8000ad0:	f003 031f 	and.w	r3, r3, #31
 8000ad4:	fa02 f303 	lsl.w	r3, r2, r3
 8000ad8:	3120      	adds	r1, #32
 8000ada:	4a03      	ldr	r2, [pc, #12]	; (8000ae8 <NVIC_Init+0x68>)
 8000adc:	f842 3021 	str.w	r3, [r2, r1, lsl #2]
 8000ae0:	bd10      	pop	{r4, pc}
 8000ae2:	bf00      	nop
 8000ae4:	e000ed00 	.word	0xe000ed00
 8000ae8:	e000e100 	.word	0xe000e100

08000aec <Default_Handler>:
 8000aec:	4668      	mov	r0, sp
 8000aee:	f020 0107 	bic.w	r1, r0, #7
 8000af2:	468d      	mov	sp, r1
 8000af4:	bf00      	nop
 8000af6:	e7fd      	b.n	8000af4 <Default_Handler+0x8>

08000af8 <HardFault_Handler>:
 8000af8:	f44f 5000 	mov.w	r0, #8192	; 0x2000
 8000afc:	f000 f9f0 	bl	8000ee0 <led_on>
 8000b00:	4b06      	ldr	r3, [pc, #24]	; (8000b1c <HardFault_Handler+0x24>)
 8000b02:	3b01      	subs	r3, #1
 8000b04:	d001      	beq.n	8000b0a <HardFault_Handler+0x12>
 8000b06:	bf00      	nop
 8000b08:	e7fb      	b.n	8000b02 <HardFault_Handler+0xa>
 8000b0a:	f44f 5000 	mov.w	r0, #8192	; 0x2000
 8000b0e:	f000 f9ed 	bl	8000eec <led_off>
 8000b12:	4b02      	ldr	r3, [pc, #8]	; (8000b1c <HardFault_Handler+0x24>)
 8000b14:	3b01      	subs	r3, #1
 8000b16:	d0ef      	beq.n	8000af8 <HardFault_Handler>
 8000b18:	bf00      	nop
 8000b1a:	e7fb      	b.n	8000b14 <HardFault_Handler+0x1c>
 8000b1c:	00989681 	.word	0x00989681

08000b20 <_reset_init>:
 8000b20:	4a0e      	ldr	r2, [pc, #56]	; (8000b5c <_reset_init+0x3c>)
 8000b22:	480f      	ldr	r0, [pc, #60]	; (8000b60 <_reset_init+0x40>)
 8000b24:	1a80      	subs	r0, r0, r2
 8000b26:	1080      	asrs	r0, r0, #2
 8000b28:	2300      	movs	r3, #0
 8000b2a:	4283      	cmp	r3, r0
 8000b2c:	d006      	beq.n	8000b3c <_reset_init+0x1c>
 8000b2e:	490d      	ldr	r1, [pc, #52]	; (8000b64 <_reset_init+0x44>)
 8000b30:	f851 1023 	ldr.w	r1, [r1, r3, lsl #2]
 8000b34:	f842 1023 	str.w	r1, [r2, r3, lsl #2]
 8000b38:	3301      	adds	r3, #1
 8000b3a:	e7f6      	b.n	8000b2a <_reset_init+0xa>
 8000b3c:	4b0a      	ldr	r3, [pc, #40]	; (8000b68 <_reset_init+0x48>)
 8000b3e:	f8d3 2088 	ldr.w	r2, [r3, #136]	; 0x88
 8000b42:	f442 0270 	orr.w	r2, r2, #15728640	; 0xf00000
 8000b46:	f8c3 2088 	str.w	r2, [r3, #136]	; 0x88
 8000b4a:	f503 730c 	add.w	r3, r3, #560	; 0x230
 8000b4e:	685a      	ldr	r2, [r3, #4]
 8000b50:	f022 4240 	bic.w	r2, r2, #3221225472	; 0xc0000000
 8000b54:	605a      	str	r2, [r3, #4]
 8000b56:	f7ff bb4d 	b.w	80001f4 <main>
 8000b5a:	bf00      	nop
 8000b5c:	20000000 	.word	0x20000000
 8000b60:	20000010 	.word	0x20000010
 8000b64:	08001110 	.word	0x08001110
 8000b68:	e000ed00 	.word	0xe000ed00

08000b6c <SystemInit>:
 8000b6c:	4b3b      	ldr	r3, [pc, #236]	; (8000c5c <SystemInit+0xf0>)
 8000b6e:	f8d3 2088 	ldr.w	r2, [r3, #136]	; 0x88
 8000b72:	f442 0270 	orr.w	r2, r2, #15728640	; 0xf00000
 8000b76:	f8c3 2088 	str.w	r2, [r3, #136]	; 0x88
 8000b7a:	f8d3 2088 	ldr.w	r2, [r3, #136]	; 0x88
 8000b7e:	f442 0270 	orr.w	r2, r2, #15728640	; 0xf00000
 8000b82:	f8c3 2088 	str.w	r2, [r3, #136]	; 0x88
 8000b86:	4b36      	ldr	r3, [pc, #216]	; (8000c60 <SystemInit+0xf4>)
 8000b88:	681a      	ldr	r2, [r3, #0]
 8000b8a:	f042 0201 	orr.w	r2, r2, #1
 8000b8e:	601a      	str	r2, [r3, #0]
 8000b90:	2200      	movs	r2, #0
 8000b92:	609a      	str	r2, [r3, #8]
 8000b94:	6819      	ldr	r1, [r3, #0]
 8000b96:	f021 7184 	bic.w	r1, r1, #17301504	; 0x1080000
 8000b9a:	f421 3180 	bic.w	r1, r1, #65536	; 0x10000
 8000b9e:	6019      	str	r1, [r3, #0]
 8000ba0:	4930      	ldr	r1, [pc, #192]	; (8000c64 <SystemInit+0xf8>)
 8000ba2:	6059      	str	r1, [r3, #4]
 8000ba4:	6819      	ldr	r1, [r3, #0]
 8000ba6:	b082      	sub	sp, #8
 8000ba8:	f421 2180 	bic.w	r1, r1, #262144	; 0x40000
 8000bac:	6019      	str	r1, [r3, #0]
 8000bae:	60da      	str	r2, [r3, #12]
 8000bb0:	9200      	str	r2, [sp, #0]
 8000bb2:	9201      	str	r2, [sp, #4]
 8000bb4:	681a      	ldr	r2, [r3, #0]
 8000bb6:	f442 3280 	orr.w	r2, r2, #65536	; 0x10000
 8000bba:	601a      	str	r2, [r3, #0]
 8000bbc:	4b28      	ldr	r3, [pc, #160]	; (8000c60 <SystemInit+0xf4>)
 8000bbe:	681a      	ldr	r2, [r3, #0]
 8000bc0:	f402 3200 	and.w	r2, r2, #131072	; 0x20000
 8000bc4:	9201      	str	r2, [sp, #4]
 8000bc6:	9a00      	ldr	r2, [sp, #0]
 8000bc8:	3201      	adds	r2, #1
 8000bca:	9200      	str	r2, [sp, #0]
 8000bcc:	9a01      	ldr	r2, [sp, #4]
 8000bce:	b91a      	cbnz	r2, 8000bd8 <SystemInit+0x6c>
 8000bd0:	9a00      	ldr	r2, [sp, #0]
 8000bd2:	f5b2 6fa0 	cmp.w	r2, #1280	; 0x500
 8000bd6:	d1f1      	bne.n	8000bbc <SystemInit+0x50>
 8000bd8:	681b      	ldr	r3, [r3, #0]
 8000bda:	f413 3300 	ands.w	r3, r3, #131072	; 0x20000
 8000bde:	bf18      	it	ne
 8000be0:	2301      	movne	r3, #1
 8000be2:	9301      	str	r3, [sp, #4]
 8000be4:	9b01      	ldr	r3, [sp, #4]
 8000be6:	2b01      	cmp	r3, #1
 8000be8:	d005      	beq.n	8000bf6 <SystemInit+0x8a>
 8000bea:	4b1c      	ldr	r3, [pc, #112]	; (8000c5c <SystemInit+0xf0>)
 8000bec:	f04f 6200 	mov.w	r2, #134217728	; 0x8000000
 8000bf0:	609a      	str	r2, [r3, #8]
 8000bf2:	b002      	add	sp, #8
 8000bf4:	4770      	bx	lr
 8000bf6:	4b1a      	ldr	r3, [pc, #104]	; (8000c60 <SystemInit+0xf4>)
 8000bf8:	6c1a      	ldr	r2, [r3, #64]	; 0x40
 8000bfa:	f042 5280 	orr.w	r2, r2, #268435456	; 0x10000000
 8000bfe:	641a      	str	r2, [r3, #64]	; 0x40
 8000c00:	4a19      	ldr	r2, [pc, #100]	; (8000c68 <SystemInit+0xfc>)
 8000c02:	6811      	ldr	r1, [r2, #0]
 8000c04:	f441 4180 	orr.w	r1, r1, #16384	; 0x4000
 8000c08:	6011      	str	r1, [r2, #0]
 8000c0a:	689a      	ldr	r2, [r3, #8]
 8000c0c:	f042 0290 	orr.w	r2, r2, #144	; 0x90
 8000c10:	609a      	str	r2, [r3, #8]
 8000c12:	689a      	ldr	r2, [r3, #8]
 8000c14:	f442 4200 	orr.w	r2, r2, #32768	; 0x8000
 8000c18:	609a      	str	r2, [r3, #8]
 8000c1a:	689a      	ldr	r2, [r3, #8]
 8000c1c:	f442 52a0 	orr.w	r2, r2, #5120	; 0x1400
 8000c20:	609a      	str	r2, [r3, #8]
 8000c22:	4a12      	ldr	r2, [pc, #72]	; (8000c6c <SystemInit+0x100>)
 8000c24:	605a      	str	r2, [r3, #4]
 8000c26:	681a      	ldr	r2, [r3, #0]
 8000c28:	f042 7280 	orr.w	r2, r2, #16777216	; 0x1000000
 8000c2c:	601a      	str	r2, [r3, #0]
 8000c2e:	6819      	ldr	r1, [r3, #0]
 8000c30:	4a0b      	ldr	r2, [pc, #44]	; (8000c60 <SystemInit+0xf4>)
 8000c32:	0189      	lsls	r1, r1, #6
 8000c34:	d5fb      	bpl.n	8000c2e <SystemInit+0xc2>
 8000c36:	4b0e      	ldr	r3, [pc, #56]	; (8000c70 <SystemInit+0x104>)
 8000c38:	f240 6105 	movw	r1, #1541	; 0x605
 8000c3c:	6019      	str	r1, [r3, #0]
 8000c3e:	6893      	ldr	r3, [r2, #8]
 8000c40:	f023 0303 	bic.w	r3, r3, #3
 8000c44:	6093      	str	r3, [r2, #8]
 8000c46:	6893      	ldr	r3, [r2, #8]
 8000c48:	f043 0302 	orr.w	r3, r3, #2
 8000c4c:	6093      	str	r3, [r2, #8]
 8000c4e:	4b04      	ldr	r3, [pc, #16]	; (8000c60 <SystemInit+0xf4>)
 8000c50:	689b      	ldr	r3, [r3, #8]
 8000c52:	f003 030c 	and.w	r3, r3, #12
 8000c56:	2b08      	cmp	r3, #8
 8000c58:	d1f9      	bne.n	8000c4e <SystemInit+0xe2>
 8000c5a:	e7c6      	b.n	8000bea <SystemInit+0x7e>
 8000c5c:	e000ed00 	.word	0xe000ed00
 8000c60:	40023800 	.word	0x40023800
 8000c64:	24003010 	.word	0x24003010
 8000c68:	40007000 	.word	0x40007000
 8000c6c:	07405408 	.word	0x07405408
 8000c70:	40023c00 	.word	0x40023c00

08000c74 <sys_tick_init>:
 8000c74:	4b05      	ldr	r3, [pc, #20]	; (8000c8c <sys_tick_init+0x18>)
 8000c76:	4a06      	ldr	r2, [pc, #24]	; (8000c90 <sys_tick_init+0x1c>)
 8000c78:	605a      	str	r2, [r3, #4]
 8000c7a:	4a06      	ldr	r2, [pc, #24]	; (8000c94 <sys_tick_init+0x20>)
 8000c7c:	21f0      	movs	r1, #240	; 0xf0
 8000c7e:	f882 1023 	strb.w	r1, [r2, #35]	; 0x23
 8000c82:	2200      	movs	r2, #0
 8000c84:	609a      	str	r2, [r3, #8]
 8000c86:	2207      	movs	r2, #7
 8000c88:	601a      	str	r2, [r3, #0]
 8000c8a:	4770      	bx	lr
 8000c8c:	e000e010 	.word	0xe000e010
 8000c90:	00029040 	.word	0x00029040
 8000c94:	e000ed00 	.word	0xe000ed00

08000c98 <sleep>:
 8000c98:	bf30      	wfi
 8000c9a:	4770      	bx	lr

08000c9c <sytem_clock_init>:
 8000c9c:	f7ff bf66 	b.w	8000b6c <SystemInit>

08000ca0 <TIM_TimeBaseInit>:
 8000ca0:	4a1c      	ldr	r2, [pc, #112]	; (8000d14 <TIM_TimeBaseInit+0x74>)
 8000ca2:	8803      	ldrh	r3, [r0, #0]
 8000ca4:	4290      	cmp	r0, r2
 8000ca6:	b29b      	uxth	r3, r3
 8000ca8:	d012      	beq.n	8000cd0 <TIM_TimeBaseInit+0x30>
 8000caa:	f502 6280 	add.w	r2, r2, #1024	; 0x400
 8000cae:	4290      	cmp	r0, r2
 8000cb0:	d00e      	beq.n	8000cd0 <TIM_TimeBaseInit+0x30>
 8000cb2:	f1b0 4f80 	cmp.w	r0, #1073741824	; 0x40000000
 8000cb6:	d00b      	beq.n	8000cd0 <TIM_TimeBaseInit+0x30>
 8000cb8:	f5a2 3280 	sub.w	r2, r2, #65536	; 0x10000
 8000cbc:	4290      	cmp	r0, r2
 8000cbe:	d007      	beq.n	8000cd0 <TIM_TimeBaseInit+0x30>
 8000cc0:	f502 6280 	add.w	r2, r2, #1024	; 0x400
 8000cc4:	4290      	cmp	r0, r2
 8000cc6:	d003      	beq.n	8000cd0 <TIM_TimeBaseInit+0x30>
 8000cc8:	f502 6280 	add.w	r2, r2, #1024	; 0x400
 8000ccc:	4290      	cmp	r0, r2
 8000cce:	d103      	bne.n	8000cd8 <TIM_TimeBaseInit+0x38>
 8000cd0:	884a      	ldrh	r2, [r1, #2]
 8000cd2:	f023 0370 	bic.w	r3, r3, #112	; 0x70
 8000cd6:	4313      	orrs	r3, r2
 8000cd8:	4a0f      	ldr	r2, [pc, #60]	; (8000d18 <TIM_TimeBaseInit+0x78>)
 8000cda:	4290      	cmp	r0, r2
 8000cdc:	d008      	beq.n	8000cf0 <TIM_TimeBaseInit+0x50>
 8000cde:	f502 6280 	add.w	r2, r2, #1024	; 0x400
 8000ce2:	4290      	cmp	r0, r2
 8000ce4:	d004      	beq.n	8000cf0 <TIM_TimeBaseInit+0x50>
 8000ce6:	f423 7340 	bic.w	r3, r3, #768	; 0x300
 8000cea:	890a      	ldrh	r2, [r1, #8]
 8000cec:	b29b      	uxth	r3, r3
 8000cee:	4313      	orrs	r3, r2
 8000cf0:	8003      	strh	r3, [r0, #0]
 8000cf2:	684b      	ldr	r3, [r1, #4]
 8000cf4:	62c3      	str	r3, [r0, #44]	; 0x2c
 8000cf6:	880b      	ldrh	r3, [r1, #0]
 8000cf8:	8503      	strh	r3, [r0, #40]	; 0x28
 8000cfa:	4b06      	ldr	r3, [pc, #24]	; (8000d14 <TIM_TimeBaseInit+0x74>)
 8000cfc:	4298      	cmp	r0, r3
 8000cfe:	d003      	beq.n	8000d08 <TIM_TimeBaseInit+0x68>
 8000d00:	f503 6380 	add.w	r3, r3, #1024	; 0x400
 8000d04:	4298      	cmp	r0, r3
 8000d06:	d101      	bne.n	8000d0c <TIM_TimeBaseInit+0x6c>
 8000d08:	7a8b      	ldrb	r3, [r1, #10]
 8000d0a:	8603      	strh	r3, [r0, #48]	; 0x30
 8000d0c:	2301      	movs	r3, #1
 8000d0e:	8283      	strh	r3, [r0, #20]
 8000d10:	4770      	bx	lr
 8000d12:	bf00      	nop
 8000d14:	40010000 	.word	0x40010000
 8000d18:	40001000 	.word	0x40001000

08000d1c <TIM_Cmd>:
 8000d1c:	8803      	ldrh	r3, [r0, #0]
 8000d1e:	b119      	cbz	r1, 8000d28 <TIM_Cmd+0xc>
 8000d20:	b29b      	uxth	r3, r3
 8000d22:	f043 0301 	orr.w	r3, r3, #1
 8000d26:	e003      	b.n	8000d30 <TIM_Cmd+0x14>
 8000d28:	f023 0301 	bic.w	r3, r3, #1
 8000d2c:	041b      	lsls	r3, r3, #16
 8000d2e:	0c1b      	lsrs	r3, r3, #16
 8000d30:	8003      	strh	r3, [r0, #0]
 8000d32:	4770      	bx	lr

08000d34 <TIM_ClearITPendingBit>:
 8000d34:	43c9      	mvns	r1, r1
 8000d36:	b289      	uxth	r1, r1
 8000d38:	8201      	strh	r1, [r0, #16]
 8000d3a:	4770      	bx	lr

08000d3c <timer_init>:
 8000d3c:	b530      	push	{r4, r5, lr}
 8000d3e:	2000      	movs	r0, #0
 8000d40:	b085      	sub	sp, #20
 8000d42:	4a1e      	ldr	r2, [pc, #120]	; (8000dbc <timer_init+0x80>)
 8000d44:	f44f 6380 	mov.w	r3, #1024	; 0x400
 8000d48:	f822 3010 	strh.w	r3, [r2, r0, lsl #1]
 8000d4c:	4a1c      	ldr	r2, [pc, #112]	; (8000dc0 <timer_init+0x84>)
 8000d4e:	f822 3010 	strh.w	r3, [r2, r0, lsl #1]
 8000d52:	4b1c      	ldr	r3, [pc, #112]	; (8000dc4 <timer_init+0x88>)
 8000d54:	2400      	movs	r4, #0
 8000d56:	f823 4010 	strh.w	r4, [r3, r0, lsl #1]
 8000d5a:	3001      	adds	r0, #1
 8000d5c:	2804      	cmp	r0, #4
 8000d5e:	4625      	mov	r5, r4
 8000d60:	d1ef      	bne.n	8000d42 <timer_init+0x6>
 8000d62:	4b19      	ldr	r3, [pc, #100]	; (8000dc8 <timer_init+0x8c>)
 8000d64:	2101      	movs	r1, #1
 8000d66:	601c      	str	r4, [r3, #0]
 8000d68:	f7ff fe72 	bl	8000a50 <RCC_APB1PeriphClockCmd>
 8000d6c:	f8ad 4006 	strh.w	r4, [sp, #6]
 8000d70:	f8ad 400c 	strh.w	r4, [sp, #12]
 8000d74:	f88d 400e 	strb.w	r4, [sp, #14]
 8000d78:	4c14      	ldr	r4, [pc, #80]	; (8000dcc <timer_init+0x90>)
 8000d7a:	2353      	movs	r3, #83	; 0x53
 8000d7c:	f8ad 3004 	strh.w	r3, [sp, #4]
 8000d80:	4620      	mov	r0, r4
 8000d82:	2331      	movs	r3, #49	; 0x31
 8000d84:	a901      	add	r1, sp, #4
 8000d86:	9302      	str	r3, [sp, #8]
 8000d88:	f7ff ff8a 	bl	8000ca0 <TIM_TimeBaseInit>
 8000d8c:	4620      	mov	r0, r4
 8000d8e:	2101      	movs	r1, #1
 8000d90:	f7ff ffc4 	bl	8000d1c <TIM_Cmd>
 8000d94:	89a3      	ldrh	r3, [r4, #12]
 8000d96:	b29b      	uxth	r3, r3
 8000d98:	f043 0301 	orr.w	r3, r3, #1
 8000d9c:	81a3      	strh	r3, [r4, #12]
 8000d9e:	231e      	movs	r3, #30
 8000da0:	f88d 3000 	strb.w	r3, [sp]
 8000da4:	4668      	mov	r0, sp
 8000da6:	2301      	movs	r3, #1
 8000da8:	f88d 5001 	strb.w	r5, [sp, #1]
 8000dac:	f88d 3002 	strb.w	r3, [sp, #2]
 8000db0:	f88d 3003 	strb.w	r3, [sp, #3]
 8000db4:	f7ff fe64 	bl	8000a80 <NVIC_Init>
 8000db8:	b005      	add	sp, #20
 8000dba:	bd30      	pop	{r4, r5, pc}
 8000dbc:	20000b84 	.word	0x20000b84
 8000dc0:	20000b78 	.word	0x20000b78
 8000dc4:	20000b70 	.word	0x20000b70
 8000dc8:	20000b80 	.word	0x20000b80
 8000dcc:	40000800 	.word	0x40000800

08000dd0 <TIM4_IRQHandler>:
 8000dd0:	2300      	movs	r3, #0
 8000dd2:	4a10      	ldr	r2, [pc, #64]	; (8000e14 <TIM4_IRQHandler+0x44>)
 8000dd4:	f832 1013 	ldrh.w	r1, [r2, r3, lsl #1]
 8000dd8:	b289      	uxth	r1, r1
 8000dda:	b129      	cbz	r1, 8000de8 <TIM4_IRQHandler+0x18>
 8000ddc:	f832 1013 	ldrh.w	r1, [r2, r3, lsl #1]
 8000de0:	b289      	uxth	r1, r1
 8000de2:	3901      	subs	r1, #1
 8000de4:	b289      	uxth	r1, r1
 8000de6:	e007      	b.n	8000df8 <TIM4_IRQHandler+0x28>
 8000de8:	490b      	ldr	r1, [pc, #44]	; (8000e18 <TIM4_IRQHandler+0x48>)
 8000dea:	f831 1013 	ldrh.w	r1, [r1, r3, lsl #1]
 8000dee:	b289      	uxth	r1, r1
 8000df0:	f822 1013 	strh.w	r1, [r2, r3, lsl #1]
 8000df4:	4a09      	ldr	r2, [pc, #36]	; (8000e1c <TIM4_IRQHandler+0x4c>)
 8000df6:	2101      	movs	r1, #1
 8000df8:	f822 1013 	strh.w	r1, [r2, r3, lsl #1]
 8000dfc:	3301      	adds	r3, #1
 8000dfe:	2b04      	cmp	r3, #4
 8000e00:	d1e7      	bne.n	8000dd2 <TIM4_IRQHandler+0x2>
 8000e02:	4b07      	ldr	r3, [pc, #28]	; (8000e20 <TIM4_IRQHandler+0x50>)
 8000e04:	4807      	ldr	r0, [pc, #28]	; (8000e24 <TIM4_IRQHandler+0x54>)
 8000e06:	681a      	ldr	r2, [r3, #0]
 8000e08:	2101      	movs	r1, #1
 8000e0a:	3201      	adds	r2, #1
 8000e0c:	601a      	str	r2, [r3, #0]
 8000e0e:	f7ff bf91 	b.w	8000d34 <TIM_ClearITPendingBit>
 8000e12:	bf00      	nop
 8000e14:	20000b84 	.word	0x20000b84
 8000e18:	20000b78 	.word	0x20000b78
 8000e1c:	20000b70 	.word	0x20000b70
 8000e20:	20000b80 	.word	0x20000b80
 8000e24:	40000800 	.word	0x40000800

08000e28 <timer_get_time>:
 8000e28:	b082      	sub	sp, #8
 8000e2a:	b672      	cpsid	i
 8000e2c:	4b04      	ldr	r3, [pc, #16]	; (8000e40 <timer_get_time+0x18>)
 8000e2e:	681b      	ldr	r3, [r3, #0]
 8000e30:	9301      	str	r3, [sp, #4]
 8000e32:	b662      	cpsie	i
 8000e34:	9801      	ldr	r0, [sp, #4]
 8000e36:	230a      	movs	r3, #10
 8000e38:	fbb0 f0f3 	udiv	r0, r0, r3
 8000e3c:	b002      	add	sp, #8
 8000e3e:	4770      	bx	lr
 8000e40:	20000b80 	.word	0x20000b80

08000e44 <timer_delay_ms>:
 8000e44:	b513      	push	{r0, r1, r4, lr}
 8000e46:	4604      	mov	r4, r0
 8000e48:	f7ff ffee 	bl	8000e28 <timer_get_time>
 8000e4c:	4420      	add	r0, r4
 8000e4e:	9001      	str	r0, [sp, #4]
 8000e50:	9c01      	ldr	r4, [sp, #4]
 8000e52:	f7ff ffe9 	bl	8000e28 <timer_get_time>
 8000e56:	4284      	cmp	r4, r0
 8000e58:	d902      	bls.n	8000e60 <timer_delay_ms+0x1c>
 8000e5a:	f7ff ff1d 	bl	8000c98 <sleep>
 8000e5e:	e7f7      	b.n	8000e50 <timer_delay_ms+0xc>
 8000e60:	b002      	add	sp, #8
 8000e62:	bd10      	pop	{r4, pc}

08000e64 <gpio_init>:
 8000e64:	b513      	push	{r0, r1, r4, lr}
 8000e66:	2001      	movs	r0, #1
 8000e68:	4601      	mov	r1, r0
 8000e6a:	f7ff fde5 	bl	8000a38 <RCC_AHB1PeriphClockCmd>
 8000e6e:	2002      	movs	r0, #2
 8000e70:	2101      	movs	r1, #1
 8000e72:	f7ff fde1 	bl	8000a38 <RCC_AHB1PeriphClockCmd>
 8000e76:	2004      	movs	r0, #4
 8000e78:	2101      	movs	r1, #1
 8000e7a:	f7ff fddd 	bl	8000a38 <RCC_AHB1PeriphClockCmd>
 8000e7e:	2008      	movs	r0, #8
 8000e80:	2101      	movs	r1, #1
 8000e82:	f7ff fdd9 	bl	8000a38 <RCC_AHB1PeriphClockCmd>
 8000e86:	2008      	movs	r0, #8
 8000e88:	2101      	movs	r1, #1
 8000e8a:	f7ff fdd5 	bl	8000a38 <RCC_AHB1PeriphClockCmd>
 8000e8e:	2010      	movs	r0, #16
 8000e90:	2101      	movs	r1, #1
 8000e92:	f7ff fdd1 	bl	8000a38 <RCC_AHB1PeriphClockCmd>
 8000e96:	2020      	movs	r0, #32
 8000e98:	2101      	movs	r1, #1
 8000e9a:	f7ff fdcd 	bl	8000a38 <RCC_AHB1PeriphClockCmd>
 8000e9e:	4c0f      	ldr	r4, [pc, #60]	; (8000edc <gpio_init+0x78>)
 8000ea0:	f44f 4360 	mov.w	r3, #57344	; 0xe000
 8000ea4:	9300      	str	r3, [sp, #0]
 8000ea6:	2301      	movs	r3, #1
 8000ea8:	f88d 3004 	strb.w	r3, [sp, #4]
 8000eac:	2203      	movs	r2, #3
 8000eae:	2300      	movs	r3, #0
 8000eb0:	4620      	mov	r0, r4
 8000eb2:	4669      	mov	r1, sp
 8000eb4:	f88d 3006 	strb.w	r3, [sp, #6]
 8000eb8:	f88d 3007 	strb.w	r3, [sp, #7]
 8000ebc:	f88d 2005 	strb.w	r2, [sp, #5]
 8000ec0:	f000 f81a 	bl	8000ef8 <GPIO_Init>
 8000ec4:	f44f 5300 	mov.w	r3, #8192	; 0x2000
 8000ec8:	8363      	strh	r3, [r4, #26]
 8000eca:	f44f 4380 	mov.w	r3, #16384	; 0x4000
 8000ece:	8363      	strh	r3, [r4, #26]
 8000ed0:	f44f 4300 	mov.w	r3, #32768	; 0x8000
 8000ed4:	8363      	strh	r3, [r4, #26]
 8000ed6:	b002      	add	sp, #8
 8000ed8:	bd10      	pop	{r4, pc}
 8000eda:	bf00      	nop
 8000edc:	40021400 	.word	0x40021400

08000ee0 <led_on>:
 8000ee0:	4b01      	ldr	r3, [pc, #4]	; (8000ee8 <led_on+0x8>)
 8000ee2:	b280      	uxth	r0, r0
 8000ee4:	8318      	strh	r0, [r3, #24]
 8000ee6:	4770      	bx	lr
 8000ee8:	40021400 	.word	0x40021400

08000eec <led_off>:
 8000eec:	4b01      	ldr	r3, [pc, #4]	; (8000ef4 <led_off+0x8>)
 8000eee:	b280      	uxth	r0, r0
 8000ef0:	8358      	strh	r0, [r3, #26]
 8000ef2:	4770      	bx	lr
 8000ef4:	40021400 	.word	0x40021400

08000ef8 <GPIO_Init>:
 8000ef8:	e92d 41f0 	stmdb	sp!, {r4, r5, r6, r7, r8, lr}
 8000efc:	680f      	ldr	r7, [r1, #0]
 8000efe:	2300      	movs	r3, #0
 8000f00:	2201      	movs	r2, #1
 8000f02:	409a      	lsls	r2, r3
 8000f04:	ea02 0507 	and.w	r5, r2, r7
 8000f08:	4295      	cmp	r5, r2
 8000f0a:	d131      	bne.n	8000f70 <GPIO_Init+0x78>
 8000f0c:	005a      	lsls	r2, r3, #1
 8000f0e:	2403      	movs	r4, #3
 8000f10:	6806      	ldr	r6, [r0, #0]
 8000f12:	4094      	lsls	r4, r2
 8000f14:	43e4      	mvns	r4, r4
 8000f16:	4026      	ands	r6, r4
 8000f18:	6006      	str	r6, [r0, #0]
 8000f1a:	790e      	ldrb	r6, [r1, #4]
 8000f1c:	f8d0 c000 	ldr.w	ip, [r0]
 8000f20:	fa06 f802 	lsl.w	r8, r6, r2
 8000f24:	3e01      	subs	r6, #1
 8000f26:	b2f6      	uxtb	r6, r6
 8000f28:	ea48 0c0c 	orr.w	ip, r8, ip
 8000f2c:	2e01      	cmp	r6, #1
 8000f2e:	f8c0 c000 	str.w	ip, [r0]
 8000f32:	d814      	bhi.n	8000f5e <GPIO_Init+0x66>
 8000f34:	6886      	ldr	r6, [r0, #8]
 8000f36:	f891 c005 	ldrb.w	ip, [r1, #5]
 8000f3a:	4026      	ands	r6, r4
 8000f3c:	6086      	str	r6, [r0, #8]
 8000f3e:	6886      	ldr	r6, [r0, #8]
 8000f40:	fa0c fc02 	lsl.w	ip, ip, r2
 8000f44:	ea4c 0606 	orr.w	r6, ip, r6
 8000f48:	6086      	str	r6, [r0, #8]
 8000f4a:	6846      	ldr	r6, [r0, #4]
 8000f4c:	ea26 0505 	bic.w	r5, r6, r5
 8000f50:	6045      	str	r5, [r0, #4]
 8000f52:	798d      	ldrb	r5, [r1, #6]
 8000f54:	6846      	ldr	r6, [r0, #4]
 8000f56:	409d      	lsls	r5, r3
 8000f58:	b2ad      	uxth	r5, r5
 8000f5a:	4335      	orrs	r5, r6
 8000f5c:	6045      	str	r5, [r0, #4]
 8000f5e:	68c5      	ldr	r5, [r0, #12]
 8000f60:	402c      	ands	r4, r5
 8000f62:	60c4      	str	r4, [r0, #12]
 8000f64:	79cd      	ldrb	r5, [r1, #7]
 8000f66:	68c4      	ldr	r4, [r0, #12]
 8000f68:	fa05 f202 	lsl.w	r2, r5, r2
 8000f6c:	4322      	orrs	r2, r4
 8000f6e:	60c2      	str	r2, [r0, #12]
 8000f70:	3301      	adds	r3, #1
 8000f72:	2b10      	cmp	r3, #16
 8000f74:	d1c4      	bne.n	8000f00 <GPIO_Init+0x8>
 8000f76:	e8bd 81f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, pc}

08000f7a <GPIO_PinAFConfig>:
 8000f7a:	f001 0307 	and.w	r3, r1, #7
 8000f7e:	08c9      	lsrs	r1, r1, #3
 8000f80:	eb00 0081 	add.w	r0, r0, r1, lsl #2
 8000f84:	b510      	push	{r4, lr}
 8000f86:	009b      	lsls	r3, r3, #2
 8000f88:	6a04      	ldr	r4, [r0, #32]
 8000f8a:	210f      	movs	r1, #15
 8000f8c:	4099      	lsls	r1, r3
 8000f8e:	ea24 0101 	bic.w	r1, r4, r1
 8000f92:	6201      	str	r1, [r0, #32]
 8000f94:	6a01      	ldr	r1, [r0, #32]
 8000f96:	409a      	lsls	r2, r3
 8000f98:	4311      	orrs	r1, r2
 8000f9a:	6201      	str	r1, [r0, #32]
 8000f9c:	bd10      	pop	{r4, pc}

08000f9e <_text>:
	...

08000fa0 <_init>:
 8000fa0:	e1a0c00d 	mov	ip, sp
 8000fa4:	e92ddff8 	push	{r3, r4, r5, r6, r7, r8, r9, sl, fp, ip, lr, pc}
 8000fa8:	e24cb004 	sub	fp, ip, #4
 8000fac:	e24bd028 	sub	sp, fp, #40	; 0x28
 8000fb0:	e89d6ff0 	ldm	sp, {r4, r5, r6, r7, r8, r9, sl, fp, sp, lr}
 8000fb4:	e12fff1e 	bx	lr

08000fb8 <_fini>:
 8000fb8:	e1a0c00d 	mov	ip, sp
 8000fbc:	e92ddff8 	push	{r3, r4, r5, r6, r7, r8, r9, sl, fp, ip, lr, pc}
 8000fc0:	e24cb004 	sub	fp, ip, #4
 8000fc4:	e24bd028 	sub	sp, fp, #40	; 0x28
 8000fc8:	e89d6ff0 	ldm	sp, {r4, r5, r6, r7, r8, r9, sl, fp, sp, lr}
 8000fcc:	e12fff1e 	bx	lr
 8000fd0:	746f6f62 	.word	0x746f6f62
 8000fd4:	20676e69 	.word	0x20676e69
 8000fd8:	6d6f7266 	.word	0x6d6f7266
 8000fdc:	0a752520 	.word	0x0a752520
 8000fe0:	6d617200 	.word	0x6d617200
 8000fe4:	61747320 	.word	0x61747320
 8000fe8:	25207472 	.word	0x25207472
 8000fec:	000a2075 	.word	0x000a2075
 8000ff0:	206d6172 	.word	0x206d6172
 8000ff4:	657a6973 	.word	0x657a6973
 8000ff8:	20752520 	.word	0x20752520
 8000ffc:	6172000a 	.word	0x6172000a
 8001000:	7266206d 	.word	0x7266206d
 8001004:	25206565 	.word	0x25206565
 8001008:	000a2075 	.word	0x000a2075
 800100c:	70616568 	.word	0x70616568
 8001010:	61747320 	.word	0x61747320
 8001014:	25207472 	.word	0x25207472
 8001018:	000a2075 	.word	0x000a2075
 800101c:	0a0a      	.short	0x0a0a
 800101e:	00          	.byte	0x00
 800101f:	73          	.byte	0x73
 8001020:	6f696474 	.word	0x6f696474
 8001024:	696e6920 	.word	0x696e6920
 8001028:	6f642074 	.word	0x6f642074
 800102c:	000a656e 	.word	0x000a656e
 8001030:	746f6e61 	.word	0x746f6e61
 8001034:	20726568 	.word	0x20726568
 8001038:	6c696863 	.word	0x6c696863
 800103c:	68742064 	.word	0x68742064
 8001040:	64616572 	.word	0x64616572
 8001044:	6572202c 	.word	0x6572202c
 8001048:	75252073 	.word	0x75252073
 800104c:	6874000a 	.word	0x6874000a
 8001050:	64616572 	.word	0x64616572
 8001054:	000a3120 	.word	0x000a3120
 8001058:	61657263 	.word	0x61657263
 800105c:	676e6974 	.word	0x676e6974
 8001060:	69686320 	.word	0x69686320
 8001064:	7420646c 	.word	0x7420646c
 8001068:	61657268 	.word	0x61657268
 800106c:	74000a64 	.word	0x74000a64
 8001070:	61657268 	.word	0x61657268
 8001074:	72632064 	.word	0x72632064
 8001078:	69746165 	.word	0x69746165
 800107c:	6520676e 	.word	0x6520676e
 8001080:	726f7272 	.word	0x726f7272
 8001084:	6177000a 	.word	0x6177000a
 8001088:	6e697469 	.word	0x6e697469
 800108c:	6f662067 	.word	0x6f662067
 8001090:	68742072 	.word	0x68742072
 8001094:	64616572 	.word	0x64616572
 8001098:	20752520 	.word	0x20752520
 800109c:	656e6f64 	.word	0x656e6f64
 80010a0:	6570000a 	.word	0x6570000a
 80010a4:	646f6972 	.word	0x646f6972
 80010a8:	74206369 	.word	0x74206369
 80010ac:	61657268 	.word	0x61657268
 80010b0:	0a000a64 	.word	0x0a000a64
 80010b4:	636c6577 	.word	0x636c6577
 80010b8:	20656d6f 	.word	0x20656d6f
 80010bc:	53206f74 	.word	0x53206f74
 80010c0:	68757a75 	.word	0x68757a75
 80010c4:	20534f61 	.word	0x20534f61
 80010c8:	205e5f5e 	.word	0x205e5f5e
 80010cc:	2e322e32 	.word	0x2e322e32
 80010d0:	55420a30 	.word	0x55420a30
 80010d4:	20444c49 	.word	0x20444c49
 80010d8:	20706553 	.word	0x20706553
 80010dc:	32203620 	.word	0x32203620
 80010e0:	20353130 	.word	0x20353130
 80010e4:	353a3031 	.word	0x353a3031
 80010e8:	34323a37 	.word	0x34323a37
 80010ec:	616d000a 	.word	0x616d000a
 80010f0:	74206e69 	.word	0x74206e69
 80010f4:	61657268 	.word	0x61657268
 80010f8:	64692064 	.word	0x64692064
 80010fc:	202c656c 	.word	0x202c656c
 8001100:	69747075 	.word	0x69747075
 8001104:	2520656d 	.word	0x2520656d
 8001108:	00000a75 	.word	0x00000a75

0800110c <__EH_FRAME_BEGIN__>:
 800110c:	00000000                                ....
