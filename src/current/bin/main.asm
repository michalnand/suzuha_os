
bin/main.elf:     file format elf32-littlearm


Disassembly of section .text:

08000188 <_sbrk>:
 8000188:	e92d4008 	push	{r3, lr}
 800018c:	e59f3044 	ldr	r3, [pc, #68]	; 80001d8 <_sbrk+0x50>
 8000190:	e5932000 	ldr	r2, [r3]
 8000194:	e3520000 	cmp	r2, #0
 8000198:	059f203c 	ldreq	r2, [pc, #60]	; 80001dc <_sbrk+0x54>
 800019c:	e1a0100d 	mov	r1, sp
 80001a0:	e0820000 	add	r0, r2, r0
 80001a4:	05832000 	streq	r2, [r3]
 80001a8:	e1500001 	cmp	r0, r1
 80001ac:	95830000 	strls	r0, [r3]
 80001b0:	91a00002 	movls	r0, r2
 80001b4:	8a000001 	bhi	80001c0 <_sbrk+0x38>
 80001b8:	e8bd4008 	pop	{r3, lr}
 80001bc:	e12fff1e 	bx	lr
 80001c0:	eb00035d 	bl	8000f3c <__errno>
 80001c4:	e3a0300c 	mov	r3, #12
 80001c8:	e5803000 	str	r3, [r0]
 80001cc:	e3e00000 	mvn	r0, #0
 80001d0:	e8bd4008 	pop	{r3, lr}
 80001d4:	e12fff1e 	bx	lr
 80001d8:	2000084c 	.word	0x2000084c
 80001dc:	200013f8 	.word	0x200013f8

080001e0 <thread_ending>:
 80001e0:	b672      	cpsid	i
 80001e2:	4b05      	ldr	r3, [pc, #20]	; (80001f8 <thread_ending+0x18>)
 80001e4:	4a05      	ldr	r2, [pc, #20]	; (80001fc <thread_ending+0x1c>)
 80001e6:	681b      	ldr	r3, [r3, #0]
 80001e8:	210c      	movs	r1, #12
 80001ea:	fb01 2303 	mla	r3, r1, r3, r2
 80001ee:	2200      	movs	r2, #0
 80001f0:	605a      	str	r2, [r3, #4]
 80001f2:	b662      	cpsie	i
 80001f4:	bf00      	nop
 80001f6:	e7fd      	b.n	80001f4 <thread_ending+0x14>
 80001f8:	200008e4 	.word	0x200008e4
 80001fc:	20000884 	.word	0x20000884

08000200 <null_thread>:
 8000200:	b508      	push	{r3, lr}
 8000202:	f000 fca1 	bl	8000b48 <sleep>
 8000206:	e7fc      	b.n	8000202 <null_thread+0x2>

08000208 <scheduler>:
 8000208:	b570      	push	{r4, r5, r6, lr}
 800020a:	2200      	movs	r2, #0
 800020c:	4611      	mov	r1, r2
 800020e:	4b15      	ldr	r3, [pc, #84]	; (8000264 <scheduler+0x5c>)
 8000210:	200c      	movs	r0, #12
 8000212:	fb00 f501 	mul.w	r5, r0, r1
 8000216:	195e      	adds	r6, r3, r5
 8000218:	6874      	ldr	r4, [r6, #4]
 800021a:	f014 0f02 	tst.w	r4, #2
 800021e:	461c      	mov	r4, r3
 8000220:	d10a      	bne.n	8000238 <scheduler+0x30>
 8000222:	6876      	ldr	r6, [r6, #4]
 8000224:	07f6      	lsls	r6, r6, #31
 8000226:	d507      	bpl.n	8000238 <scheduler+0x30>
 8000228:	4350      	muls	r0, r2
 800022a:	5b5d      	ldrh	r5, [r3, r5]
 800022c:	5a18      	ldrh	r0, [r3, r0]
 800022e:	b2ad      	uxth	r5, r5
 8000230:	b280      	uxth	r0, r0
 8000232:	4285      	cmp	r5, r0
 8000234:	bf38      	it	cc
 8000236:	460a      	movcc	r2, r1
 8000238:	200c      	movs	r0, #12
 800023a:	4348      	muls	r0, r1
 800023c:	5a1d      	ldrh	r5, [r3, r0]
 800023e:	b2ad      	uxth	r5, r5
 8000240:	b125      	cbz	r5, 800024c <scheduler+0x44>
 8000242:	5a1d      	ldrh	r5, [r3, r0]
 8000244:	b2ad      	uxth	r5, r5
 8000246:	3d01      	subs	r5, #1
 8000248:	b2ad      	uxth	r5, r5
 800024a:	521d      	strh	r5, [r3, r0]
 800024c:	3101      	adds	r1, #1
 800024e:	2908      	cmp	r1, #8
 8000250:	d1dd      	bne.n	800020e <scheduler+0x6>
 8000252:	230c      	movs	r3, #12
 8000254:	4353      	muls	r3, r2
 8000256:	18e1      	adds	r1, r4, r3
 8000258:	8849      	ldrh	r1, [r1, #2]
 800025a:	b289      	uxth	r1, r1
 800025c:	52e1      	strh	r1, [r4, r3]
 800025e:	4b02      	ldr	r3, [pc, #8]	; (8000268 <scheduler+0x60>)
 8000260:	601a      	str	r2, [r3, #0]
 8000262:	bd70      	pop	{r4, r5, r6, pc}
 8000264:	20000884 	.word	0x20000884
 8000268:	200008e4 	.word	0x200008e4

0800026c <SysTick_Handler>:
 800026c:	e92d 0ff0 	stmdb	sp!, {r4, r5, r6, r7, r8, r9, sl, fp}
 8000270:	f3ef 8208 	mrs	r2, MSP
 8000274:	4c0d      	ldr	r4, [pc, #52]	; (80002ac <SysTick_Handler+0x40>)
 8000276:	4d0e      	ldr	r5, [pc, #56]	; (80002b0 <SysTick_Handler+0x44>)
 8000278:	6823      	ldr	r3, [r4, #0]
 800027a:	3301      	adds	r3, #1
 800027c:	d005      	beq.n	800028a <SysTick_Handler+0x1e>
 800027e:	6823      	ldr	r3, [r4, #0]
 8000280:	210c      	movs	r1, #12
 8000282:	fb01 5303 	mla	r3, r1, r3, r5
 8000286:	609a      	str	r2, [r3, #8]
 8000288:	e001      	b.n	800028e <SysTick_Handler+0x22>
 800028a:	2300      	movs	r3, #0
 800028c:	6023      	str	r3, [r4, #0]
 800028e:	f7ff ffbb 	bl	8000208 <scheduler>
 8000292:	6823      	ldr	r3, [r4, #0]
 8000294:	220c      	movs	r2, #12
 8000296:	fb02 5503 	mla	r5, r2, r3, r5
 800029a:	f06f 0306 	mvn.w	r3, #6
 800029e:	68aa      	ldr	r2, [r5, #8]
 80002a0:	469e      	mov	lr, r3
 80002a2:	f382 8808 	msr	MSP, r2
 80002a6:	e8bd 0ff0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, fp}
 80002aa:	4770      	bx	lr
 80002ac:	200008e4 	.word	0x200008e4
 80002b0:	20000884 	.word	0x20000884

080002b4 <sched_off>:
 80002b4:	b672      	cpsid	i
 80002b6:	4770      	bx	lr

080002b8 <sched_on>:
 80002b8:	b662      	cpsie	i
 80002ba:	4770      	bx	lr

080002bc <yield>:
 80002bc:	bf00      	nop
 80002be:	4770      	bx	lr

080002c0 <get_thread_id>:
 80002c0:	b082      	sub	sp, #8
 80002c2:	b672      	cpsid	i
 80002c4:	4b03      	ldr	r3, [pc, #12]	; (80002d4 <get_thread_id+0x14>)
 80002c6:	681b      	ldr	r3, [r3, #0]
 80002c8:	9301      	str	r3, [sp, #4]
 80002ca:	b662      	cpsie	i
 80002cc:	9801      	ldr	r0, [sp, #4]
 80002ce:	b002      	add	sp, #8
 80002d0:	4770      	bx	lr
 80002d2:	bf00      	nop
 80002d4:	200008e4 	.word	0x200008e4

080002d8 <kernel_start>:
 80002d8:	b508      	push	{r3, lr}
 80002da:	f000 fc23 	bl	8000b24 <sys_tick_init>
 80002de:	bf00      	nop
 80002e0:	e7fd      	b.n	80002de <kernel_start+0x6>
	...

080002e4 <create_thread>:
 80002e4:	f022 0203 	bic.w	r2, r2, #3
 80002e8:	3a40      	subs	r2, #64	; 0x40
 80002ea:	e92d 43f0 	stmdb	sp!, {r4, r5, r6, r7, r8, r9, lr}
 80002ee:	eb01 0c02 	add.w	ip, r1, r2
 80002f2:	f102 0834 	add.w	r8, r2, #52	; 0x34
 80002f6:	f102 0938 	add.w	r9, r2, #56	; 0x38
 80002fa:	323c      	adds	r2, #60	; 0x3c
 80002fc:	4488      	add	r8, r1
 80002fe:	4489      	add	r9, r1
 8000300:	4607      	mov	r7, r0
 8000302:	4411      	add	r1, r2
 8000304:	2200      	movs	r2, #0
 8000306:	b672      	cpsid	i
 8000308:	4e11      	ldr	r6, [pc, #68]	; (8000350 <create_thread+0x6c>)
 800030a:	250c      	movs	r5, #12
 800030c:	4355      	muls	r5, r2
 800030e:	1974      	adds	r4, r6, r5
 8000310:	6860      	ldr	r0, [r4, #4]
 8000312:	07c0      	lsls	r0, r0, #31
 8000314:	d412      	bmi.n	800033c <create_thread+0x58>
 8000316:	480f      	ldr	r0, [pc, #60]	; (8000354 <create_thread+0x70>)
 8000318:	f8c4 c008 	str.w	ip, [r4, #8]
 800031c:	f8c8 0000 	str.w	r0, [r8]
 8000320:	f04f 5004 	mov.w	r0, #553648128	; 0x21000000
 8000324:	f8c9 7000 	str.w	r7, [r9]
 8000328:	2b07      	cmp	r3, #7
 800032a:	bf98      	it	ls
 800032c:	2308      	movls	r3, #8
 800032e:	6008      	str	r0, [r1, #0]
 8000330:	2001      	movs	r0, #1
 8000332:	8063      	strh	r3, [r4, #2]
 8000334:	5373      	strh	r3, [r6, r5]
 8000336:	6060      	str	r0, [r4, #4]
 8000338:	4610      	mov	r0, r2
 800033a:	e000      	b.n	800033e <create_thread+0x5a>
 800033c:	2008      	movs	r0, #8
 800033e:	b662      	cpsie	i
 8000340:	3201      	adds	r2, #1
 8000342:	2a08      	cmp	r2, #8
 8000344:	d001      	beq.n	800034a <create_thread+0x66>
 8000346:	2808      	cmp	r0, #8
 8000348:	d0dd      	beq.n	8000306 <create_thread+0x22>
 800034a:	e8bd 83f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, pc}
 800034e:	bf00      	nop
 8000350:	20000884 	.word	0x20000884
 8000354:	080001e1 	.word	0x080001e1

08000358 <kernel_init>:
 8000358:	b510      	push	{r4, lr}
 800035a:	2300      	movs	r3, #0
 800035c:	490b      	ldr	r1, [pc, #44]	; (800038c <kernel_init+0x34>)
 800035e:	220c      	movs	r2, #12
 8000360:	435a      	muls	r2, r3
 8000362:	188c      	adds	r4, r1, r2
 8000364:	2000      	movs	r0, #0
 8000366:	6060      	str	r0, [r4, #4]
 8000368:	3301      	adds	r3, #1
 800036a:	2008      	movs	r0, #8
 800036c:	4283      	cmp	r3, r0
 800036e:	8060      	strh	r0, [r4, #2]
 8000370:	5288      	strh	r0, [r1, r2]
 8000372:	d1f3      	bne.n	800035c <kernel_init+0x4>
 8000374:	4b06      	ldr	r3, [pc, #24]	; (8000390 <kernel_init+0x38>)
 8000376:	4807      	ldr	r0, [pc, #28]	; (8000394 <kernel_init+0x3c>)
 8000378:	4907      	ldr	r1, [pc, #28]	; (8000398 <kernel_init+0x40>)
 800037a:	f04f 32ff 	mov.w	r2, #4294967295
 800037e:	601a      	str	r2, [r3, #0]
 8000380:	e8bd 4010 	ldmia.w	sp!, {r4, lr}
 8000384:	2280      	movs	r2, #128	; 0x80
 8000386:	23ff      	movs	r3, #255	; 0xff
 8000388:	f7ff bfac 	b.w	80002e4 <create_thread>
 800038c:	20000884 	.word	0x20000884
 8000390:	200008e4 	.word	0x200008e4
 8000394:	08000201 	.word	0x08000201
 8000398:	200008e8 	.word	0x200008e8

0800039c <set_wait_state>:
 800039c:	b507      	push	{r0, r1, r2, lr}
 800039e:	f7ff ff8f 	bl	80002c0 <get_thread_id>
 80003a2:	9000      	str	r0, [sp, #0]
 80003a4:	b672      	cpsid	i
 80003a6:	4b0d      	ldr	r3, [pc, #52]	; (80003dc <set_wait_state+0x40>)
 80003a8:	9a00      	ldr	r2, [sp, #0]
 80003aa:	210c      	movs	r1, #12
 80003ac:	fb01 3202 	mla	r2, r1, r2, r3
 80003b0:	6851      	ldr	r1, [r2, #4]
 80003b2:	f041 0102 	orr.w	r1, r1, #2
 80003b6:	6051      	str	r1, [r2, #4]
 80003b8:	b672      	cpsid	i
 80003ba:	9a00      	ldr	r2, [sp, #0]
 80003bc:	210c      	movs	r1, #12
 80003be:	fb01 3202 	mla	r2, r1, r2, r3
 80003c2:	6852      	ldr	r2, [r2, #4]
 80003c4:	9201      	str	r2, [sp, #4]
 80003c6:	b662      	cpsie	i
 80003c8:	9a01      	ldr	r2, [sp, #4]
 80003ca:	0791      	lsls	r1, r2, #30
 80003cc:	d500      	bpl.n	80003d0 <set_wait_state+0x34>
 80003ce:	bf00      	nop
 80003d0:	9a01      	ldr	r2, [sp, #4]
 80003d2:	0792      	lsls	r2, r2, #30
 80003d4:	d4f0      	bmi.n	80003b8 <set_wait_state+0x1c>
 80003d6:	b003      	add	sp, #12
 80003d8:	f85d fb04 	ldr.w	pc, [sp], #4
 80003dc:	20000884 	.word	0x20000884

080003e0 <wake_up_threads>:
 80003e0:	2300      	movs	r3, #0
 80003e2:	b672      	cpsid	i
 80003e4:	4a06      	ldr	r2, [pc, #24]	; (8000400 <wake_up_threads+0x20>)
 80003e6:	210c      	movs	r1, #12
 80003e8:	fb01 2203 	mla	r2, r1, r3, r2
 80003ec:	6851      	ldr	r1, [r2, #4]
 80003ee:	f021 0102 	bic.w	r1, r1, #2
 80003f2:	6051      	str	r1, [r2, #4]
 80003f4:	b662      	cpsie	i
 80003f6:	3301      	adds	r3, #1
 80003f8:	2b08      	cmp	r3, #8
 80003fa:	d1f2      	bne.n	80003e2 <wake_up_threads+0x2>
 80003fc:	4770      	bx	lr
 80003fe:	bf00      	nop
 8000400:	20000884 	.word	0x20000884

08000404 <join>:
 8000404:	b082      	sub	sp, #8
 8000406:	9001      	str	r0, [sp, #4]
 8000408:	bf00      	nop
 800040a:	b672      	cpsid	i
 800040c:	4a06      	ldr	r2, [pc, #24]	; (8000428 <join+0x24>)
 800040e:	9b01      	ldr	r3, [sp, #4]
 8000410:	210c      	movs	r1, #12
 8000412:	fb01 2303 	mla	r3, r1, r3, r2
 8000416:	685b      	ldr	r3, [r3, #4]
 8000418:	9300      	str	r3, [sp, #0]
 800041a:	b662      	cpsie	i
 800041c:	9b00      	ldr	r3, [sp, #0]
 800041e:	07d8      	lsls	r0, r3, #31
 8000420:	d4f2      	bmi.n	8000408 <join+0x4>
 8000422:	b002      	add	sp, #8
 8000424:	4770      	bx	lr
 8000426:	bf00      	nop
 8000428:	20000884 	.word	0x20000884

0800042c <lib_os_init>:
 800042c:	b508      	push	{r3, lr}
 800042e:	f7ff ff93 	bl	8000358 <kernel_init>
 8000432:	f000 f805 	bl	8000440 <messages_init>
 8000436:	e8bd 4008 	ldmia.w	sp!, {r3, lr}
 800043a:	f000 b8e7 	b.w	800060c <stdio_init>
	...

08000440 <messages_init>:
 8000440:	b510      	push	{r4, lr}
 8000442:	2200      	movs	r2, #0
 8000444:	4909      	ldr	r1, [pc, #36]	; (800046c <messages_init+0x2c>)
 8000446:	2300      	movs	r3, #0
 8000448:	f841 3022 	str.w	r3, [r1, r2, lsl #2]
 800044c:	3201      	adds	r2, #1
 800044e:	2a08      	cmp	r2, #8
 8000450:	d1f8      	bne.n	8000444 <messages_init+0x4>
 8000452:	4c07      	ldr	r4, [pc, #28]	; (8000470 <messages_init+0x30>)
 8000454:	0118      	lsls	r0, r3, #4
 8000456:	1821      	adds	r1, r4, r0
 8000458:	3301      	adds	r3, #1
 800045a:	2200      	movs	r2, #0
 800045c:	2b04      	cmp	r3, #4
 800045e:	604a      	str	r2, [r1, #4]
 8000460:	5022      	str	r2, [r4, r0]
 8000462:	60ca      	str	r2, [r1, #12]
 8000464:	608a      	str	r2, [r1, #8]
 8000466:	d1f4      	bne.n	8000452 <messages_init+0x12>
 8000468:	bd10      	pop	{r4, pc}
 800046a:	bf00      	nop
 800046c:	20000968 	.word	0x20000968
 8000470:	20000988 	.word	0x20000988

08000474 <putc_>:
 8000474:	b538      	push	{r3, r4, r5, lr}
 8000476:	4c06      	ldr	r4, [pc, #24]	; (8000490 <putc_+0x1c>)
 8000478:	4605      	mov	r5, r0
 800047a:	4620      	mov	r0, r4
 800047c:	f000 f8f8 	bl	8000670 <mutex_lock>
 8000480:	4628      	mov	r0, r5
 8000482:	f000 fa9d 	bl	80009c0 <uart_write>
 8000486:	4620      	mov	r0, r4
 8000488:	e8bd 4038 	ldmia.w	sp!, {r3, r4, r5, lr}
 800048c:	f000 b90c 	b.w	80006a8 <mutex_unlock>
 8000490:	200009c8 	.word	0x200009c8

08000494 <puts_>:
 8000494:	b510      	push	{r4, lr}
 8000496:	4604      	mov	r4, r0
 8000498:	4807      	ldr	r0, [pc, #28]	; (80004b8 <puts_+0x24>)
 800049a:	f000 f8e9 	bl	8000670 <mutex_lock>
 800049e:	3c01      	subs	r4, #1
 80004a0:	f814 0f01 	ldrb.w	r0, [r4, #1]!
 80004a4:	b110      	cbz	r0, 80004ac <puts_+0x18>
 80004a6:	f7ff ffe5 	bl	8000474 <putc_>
 80004aa:	e7f9      	b.n	80004a0 <puts_+0xc>
 80004ac:	4802      	ldr	r0, [pc, #8]	; (80004b8 <puts_+0x24>)
 80004ae:	e8bd 4010 	ldmia.w	sp!, {r4, lr}
 80004b2:	f000 b8f9 	b.w	80006a8 <mutex_unlock>
 80004b6:	bf00      	nop
 80004b8:	200009d4 	.word	0x200009d4

080004bc <puti_>:
 80004bc:	b530      	push	{r4, r5, lr}
 80004be:	b085      	sub	sp, #20
 80004c0:	1e03      	subs	r3, r0, #0
 80004c2:	f04f 0200 	mov.w	r2, #0
 80004c6:	bfa8      	it	ge
 80004c8:	4614      	movge	r4, r2
 80004ca:	f88d 200f 	strb.w	r2, [sp, #15]
 80004ce:	bfbc      	itt	lt
 80004d0:	425b      	neglt	r3, r3
 80004d2:	2401      	movlt	r4, #1
 80004d4:	220a      	movs	r2, #10
 80004d6:	210a      	movs	r1, #10
 80004d8:	fb93 f5f1 	sdiv	r5, r3, r1
 80004dc:	fb01 3315 	mls	r3, r1, r5, r3
 80004e0:	a801      	add	r0, sp, #4
 80004e2:	3330      	adds	r3, #48	; 0x30
 80004e4:	5413      	strb	r3, [r2, r0]
 80004e6:	1e51      	subs	r1, r2, #1
 80004e8:	462b      	mov	r3, r5
 80004ea:	b10d      	cbz	r5, 80004f0 <puti_+0x34>
 80004ec:	460a      	mov	r2, r1
 80004ee:	e7f2      	b.n	80004d6 <puti_+0x1a>
 80004f0:	b12c      	cbz	r4, 80004fe <puti_+0x42>
 80004f2:	ab04      	add	r3, sp, #16
 80004f4:	440b      	add	r3, r1
 80004f6:	222d      	movs	r2, #45	; 0x2d
 80004f8:	f803 2c0c 	strb.w	r2, [r3, #-12]
 80004fc:	460a      	mov	r2, r1
 80004fe:	4410      	add	r0, r2
 8000500:	f7ff ffc8 	bl	8000494 <puts_>
 8000504:	b005      	add	sp, #20
 8000506:	bd30      	pop	{r4, r5, pc}

08000508 <putui_>:
 8000508:	b51f      	push	{r0, r1, r2, r3, r4, lr}
 800050a:	2300      	movs	r3, #0
 800050c:	f88d 300f 	strb.w	r3, [sp, #15]
 8000510:	230a      	movs	r3, #10
 8000512:	240a      	movs	r4, #10
 8000514:	fbb0 f1f4 	udiv	r1, r0, r4
 8000518:	fb04 0011 	mls	r0, r4, r1, r0
 800051c:	aa01      	add	r2, sp, #4
 800051e:	3030      	adds	r0, #48	; 0x30
 8000520:	5498      	strb	r0, [r3, r2]
 8000522:	1e5c      	subs	r4, r3, #1
 8000524:	4608      	mov	r0, r1
 8000526:	b109      	cbz	r1, 800052c <putui_+0x24>
 8000528:	4623      	mov	r3, r4
 800052a:	e7f2      	b.n	8000512 <putui_+0xa>
 800052c:	18d0      	adds	r0, r2, r3
 800052e:	f7ff ffb1 	bl	8000494 <puts_>
 8000532:	b004      	add	sp, #16
 8000534:	bd10      	pop	{r4, pc}

08000536 <putx_>:
 8000536:	b51f      	push	{r0, r1, r2, r3, r4, lr}
 8000538:	2300      	movs	r3, #0
 800053a:	f88d 300f 	strb.w	r3, [sp, #15]
 800053e:	230a      	movs	r3, #10
 8000540:	f000 010f 	and.w	r1, r0, #15
 8000544:	2909      	cmp	r1, #9
 8000546:	aa01      	add	r2, sp, #4
 8000548:	bf94      	ite	ls
 800054a:	3130      	addls	r1, #48	; 0x30
 800054c:	3157      	addhi	r1, #87	; 0x57
 800054e:	0900      	lsrs	r0, r0, #4
 8000550:	54d1      	strb	r1, [r2, r3]
 8000552:	f103 31ff 	add.w	r1, r3, #4294967295
 8000556:	d001      	beq.n	800055c <putx_+0x26>
 8000558:	460b      	mov	r3, r1
 800055a:	e7f1      	b.n	8000540 <putx_+0xa>
 800055c:	18d0      	adds	r0, r2, r3
 800055e:	f7ff ff99 	bl	8000494 <puts_>
 8000562:	b005      	add	sp, #20
 8000564:	f85d fb04 	ldr.w	pc, [sp], #4

08000568 <printf_>:
 8000568:	b40f      	push	{r0, r1, r2, r3}
 800056a:	b537      	push	{r0, r1, r2, r4, r5, lr}
 800056c:	ac06      	add	r4, sp, #24
 800056e:	4826      	ldr	r0, [pc, #152]	; (8000608 <printf_+0xa0>)
 8000570:	f854 5b04 	ldr.w	r5, [r4], #4
 8000574:	f000 f87c 	bl	8000670 <mutex_lock>
 8000578:	9401      	str	r4, [sp, #4]
 800057a:	2400      	movs	r4, #0
 800057c:	5d28      	ldrb	r0, [r5, r4]
 800057e:	2800      	cmp	r0, #0
 8000580:	d039      	beq.n	80005f6 <printf_+0x8e>
 8000582:	2825      	cmp	r0, #37	; 0x25
 8000584:	d003      	beq.n	800058e <printf_+0x26>
 8000586:	f7ff ff75 	bl	8000474 <putc_>
 800058a:	3401      	adds	r4, #1
 800058c:	e7f6      	b.n	800057c <printf_+0x14>
 800058e:	192b      	adds	r3, r5, r4
 8000590:	7858      	ldrb	r0, [r3, #1]
 8000592:	2869      	cmp	r0, #105	; 0x69
 8000594:	d016      	beq.n	80005c4 <printf_+0x5c>
 8000596:	d808      	bhi.n	80005aa <printf_+0x42>
 8000598:	2825      	cmp	r0, #37	; 0x25
 800059a:	d028      	beq.n	80005ee <printf_+0x86>
 800059c:	2863      	cmp	r0, #99	; 0x63
 800059e:	d128      	bne.n	80005f2 <printf_+0x8a>
 80005a0:	9b01      	ldr	r3, [sp, #4]
 80005a2:	1d1a      	adds	r2, r3, #4
 80005a4:	9201      	str	r2, [sp, #4]
 80005a6:	7818      	ldrb	r0, [r3, #0]
 80005a8:	e021      	b.n	80005ee <printf_+0x86>
 80005aa:	2875      	cmp	r0, #117	; 0x75
 80005ac:	d011      	beq.n	80005d2 <printf_+0x6a>
 80005ae:	2878      	cmp	r0, #120	; 0x78
 80005b0:	d016      	beq.n	80005e0 <printf_+0x78>
 80005b2:	2873      	cmp	r0, #115	; 0x73
 80005b4:	d11d      	bne.n	80005f2 <printf_+0x8a>
 80005b6:	9b01      	ldr	r3, [sp, #4]
 80005b8:	1d1a      	adds	r2, r3, #4
 80005ba:	6818      	ldr	r0, [r3, #0]
 80005bc:	9201      	str	r2, [sp, #4]
 80005be:	f7ff ff69 	bl	8000494 <puts_>
 80005c2:	e016      	b.n	80005f2 <printf_+0x8a>
 80005c4:	9b01      	ldr	r3, [sp, #4]
 80005c6:	1d1a      	adds	r2, r3, #4
 80005c8:	6818      	ldr	r0, [r3, #0]
 80005ca:	9201      	str	r2, [sp, #4]
 80005cc:	f7ff ff76 	bl	80004bc <puti_>
 80005d0:	e00f      	b.n	80005f2 <printf_+0x8a>
 80005d2:	9b01      	ldr	r3, [sp, #4]
 80005d4:	1d1a      	adds	r2, r3, #4
 80005d6:	6818      	ldr	r0, [r3, #0]
 80005d8:	9201      	str	r2, [sp, #4]
 80005da:	f7ff ff95 	bl	8000508 <putui_>
 80005de:	e008      	b.n	80005f2 <printf_+0x8a>
 80005e0:	9b01      	ldr	r3, [sp, #4]
 80005e2:	1d1a      	adds	r2, r3, #4
 80005e4:	6818      	ldr	r0, [r3, #0]
 80005e6:	9201      	str	r2, [sp, #4]
 80005e8:	f7ff ffa5 	bl	8000536 <putx_>
 80005ec:	e001      	b.n	80005f2 <printf_+0x8a>
 80005ee:	f7ff ff41 	bl	8000474 <putc_>
 80005f2:	3402      	adds	r4, #2
 80005f4:	e7c2      	b.n	800057c <printf_+0x14>
 80005f6:	4804      	ldr	r0, [pc, #16]	; (8000608 <printf_+0xa0>)
 80005f8:	f000 f856 	bl	80006a8 <mutex_unlock>
 80005fc:	b003      	add	sp, #12
 80005fe:	e8bd 4030 	ldmia.w	sp!, {r4, r5, lr}
 8000602:	b004      	add	sp, #16
 8000604:	4770      	bx	lr
 8000606:	bf00      	nop
 8000608:	200009d0 	.word	0x200009d0

0800060c <stdio_init>:
 800060c:	b510      	push	{r4, lr}
 800060e:	480e      	ldr	r0, [pc, #56]	; (8000648 <stdio_init+0x3c>)
 8000610:	f000 f824 	bl	800065c <mutex_init>
 8000614:	480d      	ldr	r0, [pc, #52]	; (800064c <stdio_init+0x40>)
 8000616:	f000 f821 	bl	800065c <mutex_init>
 800061a:	480d      	ldr	r0, [pc, #52]	; (8000650 <stdio_init+0x44>)
 800061c:	f000 f81e 	bl	800065c <mutex_init>
 8000620:	480c      	ldr	r0, [pc, #48]	; (8000654 <stdio_init+0x48>)
 8000622:	f000 f81b 	bl	800065c <mutex_init>
 8000626:	2408      	movs	r4, #8
 8000628:	2020      	movs	r0, #32
 800062a:	f7ff ff23 	bl	8000474 <putc_>
 800062e:	3c01      	subs	r4, #1
 8000630:	d1fa      	bne.n	8000628 <stdio_init+0x1c>
 8000632:	2420      	movs	r4, #32
 8000634:	200a      	movs	r0, #10
 8000636:	f7ff ff1d 	bl	8000474 <putc_>
 800063a:	3c01      	subs	r4, #1
 800063c:	d1fa      	bne.n	8000634 <stdio_init+0x28>
 800063e:	4806      	ldr	r0, [pc, #24]	; (8000658 <stdio_init+0x4c>)
 8000640:	e8bd 4010 	ldmia.w	sp!, {r4, lr}
 8000644:	f7ff bf90 	b.w	8000568 <printf_>
 8000648:	200009c8 	.word	0x200009c8
 800064c:	200009cc 	.word	0x200009cc
 8000650:	200009d4 	.word	0x200009d4
 8000654:	200009d0 	.word	0x200009d0
 8000658:	08001aa4 	.word	0x08001aa4

0800065c <mutex_init>:
 800065c:	b510      	push	{r4, lr}
 800065e:	4604      	mov	r4, r0
 8000660:	f7ff fe28 	bl	80002b4 <sched_off>
 8000664:	2300      	movs	r3, #0
 8000666:	6023      	str	r3, [r4, #0]
 8000668:	e8bd 4010 	ldmia.w	sp!, {r4, lr}
 800066c:	f7ff be24 	b.w	80002b8 <sched_on>

08000670 <mutex_lock>:
 8000670:	b513      	push	{r0, r1, r4, lr}
 8000672:	4604      	mov	r4, r0
 8000674:	f7ff fe1e 	bl	80002b4 <sched_off>
 8000678:	6823      	ldr	r3, [r4, #0]
 800067a:	9301      	str	r3, [sp, #4]
 800067c:	f7ff fe1c 	bl	80002b8 <sched_on>
 8000680:	9b01      	ldr	r3, [sp, #4]
 8000682:	b10b      	cbz	r3, 8000688 <mutex_lock+0x18>
 8000684:	f7ff fe8a 	bl	800039c <set_wait_state>
 8000688:	9b01      	ldr	r3, [sp, #4]
 800068a:	2b00      	cmp	r3, #0
 800068c:	d1f2      	bne.n	8000674 <mutex_lock+0x4>
 800068e:	f7ff fe11 	bl	80002b4 <sched_off>
 8000692:	6823      	ldr	r3, [r4, #0]
 8000694:	9301      	str	r3, [sp, #4]
 8000696:	9b01      	ldr	r3, [sp, #4]
 8000698:	2b00      	cmp	r3, #0
 800069a:	d1eb      	bne.n	8000674 <mutex_lock+0x4>
 800069c:	2301      	movs	r3, #1
 800069e:	6023      	str	r3, [r4, #0]
 80006a0:	f7ff fe0a 	bl	80002b8 <sched_on>
 80006a4:	b002      	add	sp, #8
 80006a6:	bd10      	pop	{r4, pc}

080006a8 <mutex_unlock>:
 80006a8:	b508      	push	{r3, lr}
 80006aa:	f7ff ffd7 	bl	800065c <mutex_init>
 80006ae:	f7ff fe97 	bl	80003e0 <wake_up_threads>
 80006b2:	e8bd 4008 	ldmia.w	sp!, {r3, lr}
 80006b6:	f7ff be01 	b.w	80002bc <yield>
	...

080006bc <main>:
 80006bc:	b508      	push	{r3, lr}
 80006be:	f000 fb67 	bl	8000d90 <lib_low_level_init>
 80006c2:	f7ff feb3 	bl	800042c <lib_os_init>
 80006c6:	4905      	ldr	r1, [pc, #20]	; (80006dc <main+0x20>)
 80006c8:	4805      	ldr	r0, [pc, #20]	; (80006e0 <main+0x24>)
 80006ca:	f44f 7200 	mov.w	r2, #512	; 0x200
 80006ce:	2308      	movs	r3, #8
 80006d0:	f7ff fe08 	bl	80002e4 <create_thread>
 80006d4:	f7ff fe00 	bl	80002d8 <kernel_start>
 80006d8:	2000      	movs	r0, #0
 80006da:	bd08      	pop	{r3, pc}
 80006dc:	20000bd8 	.word	0x20000bd8
 80006e0:	08000781 	.word	0x08000781

080006e4 <thread_02>:
 80006e4:	b510      	push	{r4, lr}
 80006e6:	2400      	movs	r4, #0
 80006e8:	4621      	mov	r1, r4
 80006ea:	4803      	ldr	r0, [pc, #12]	; (80006f8 <thread_02+0x14>)
 80006ec:	3401      	adds	r4, #1
 80006ee:	f7ff ff3b 	bl	8000568 <printf_>
 80006f2:	2c0a      	cmp	r4, #10
 80006f4:	d1f8      	bne.n	80006e8 <thread_02+0x4>
 80006f6:	bd10      	pop	{r4, pc}
 80006f8:	08001ab5 	.word	0x08001ab5

080006fc <thread_01>:
 80006fc:	b510      	push	{r4, lr}
 80006fe:	f44f 5000 	mov.w	r0, #8192	; 0x2000
 8000702:	f000 fb85 	bl	8000e10 <led_on>
 8000706:	4812      	ldr	r0, [pc, #72]	; (8000750 <thread_01+0x54>)
 8000708:	f7ff ff2e 	bl	8000568 <printf_>
 800070c:	4811      	ldr	r0, [pc, #68]	; (8000754 <thread_01+0x58>)
 800070e:	f7ff ff2b 	bl	8000568 <printf_>
 8000712:	4811      	ldr	r0, [pc, #68]	; (8000758 <thread_01+0x5c>)
 8000714:	4911      	ldr	r1, [pc, #68]	; (800075c <thread_01+0x60>)
 8000716:	f44f 7200 	mov.w	r2, #512	; 0x200
 800071a:	2308      	movs	r3, #8
 800071c:	f7ff fde2 	bl	80002e4 <create_thread>
 8000720:	2808      	cmp	r0, #8
 8000722:	4604      	mov	r4, r0
 8000724:	d101      	bne.n	800072a <thread_01+0x2e>
 8000726:	480e      	ldr	r0, [pc, #56]	; (8000760 <thread_01+0x64>)
 8000728:	e007      	b.n	800073a <thread_01+0x3e>
 800072a:	480e      	ldr	r0, [pc, #56]	; (8000764 <thread_01+0x68>)
 800072c:	4621      	mov	r1, r4
 800072e:	f7ff ff1b 	bl	8000568 <printf_>
 8000732:	4620      	mov	r0, r4
 8000734:	f7ff fe66 	bl	8000404 <join>
 8000738:	480b      	ldr	r0, [pc, #44]	; (8000768 <thread_01+0x6c>)
 800073a:	f7ff ff15 	bl	8000568 <printf_>
 800073e:	f44f 5000 	mov.w	r0, #8192	; 0x2000
 8000742:	f000 fb6b 	bl	8000e1c <led_off>
 8000746:	f44f 70fa 	mov.w	r0, #500	; 0x1f4
 800074a:	f000 f929 	bl	80009a0 <timer_delay_ms>
 800074e:	e7d6      	b.n	80006fe <thread_01+0x2>
 8000750:	08001ad3 	.word	0x08001ad3
 8000754:	08001add 	.word	0x08001add
 8000758:	080006e5 	.word	0x080006e5
 800075c:	20000fd8 	.word	0x20000fd8
 8000760:	08001af4 	.word	0x08001af4
 8000764:	08001b0b 	.word	0x08001b0b
 8000768:	08001aaf 	.word	0x08001aaf

0800076c <thread_03>:
 800076c:	b508      	push	{r3, lr}
 800076e:	4803      	ldr	r0, [pc, #12]	; (800077c <thread_03+0x10>)
 8000770:	f7ff fefa 	bl	8000568 <printf_>
 8000774:	2064      	movs	r0, #100	; 0x64
 8000776:	f000 f913 	bl	80009a0 <timer_delay_ms>
 800077a:	e7f8      	b.n	800076e <thread_03+0x2>
 800077c:	08001b27 	.word	0x08001b27

08000780 <main_thread>:
 8000780:	b508      	push	{r3, lr}
 8000782:	4817      	ldr	r0, [pc, #92]	; (80007e0 <main_thread+0x60>)
 8000784:	f7ff fef0 	bl	8000568 <printf_>
 8000788:	4916      	ldr	r1, [pc, #88]	; (80007e4 <main_thread+0x64>)
 800078a:	4817      	ldr	r0, [pc, #92]	; (80007e8 <main_thread+0x68>)
 800078c:	f44f 7200 	mov.w	r2, #512	; 0x200
 8000790:	2308      	movs	r3, #8
 8000792:	f7ff fda7 	bl	80002e4 <create_thread>
 8000796:	4815      	ldr	r0, [pc, #84]	; (80007ec <main_thread+0x6c>)
 8000798:	4915      	ldr	r1, [pc, #84]	; (80007f0 <main_thread+0x70>)
 800079a:	f44f 7200 	mov.w	r2, #512	; 0x200
 800079e:	2308      	movs	r3, #8
 80007a0:	f7ff fda0 	bl	80002e4 <create_thread>
 80007a4:	f44f 70c8 	mov.w	r0, #400	; 0x190
 80007a8:	f000 fbd0 	bl	8000f4c <malloc>
 80007ac:	b110      	cbz	r0, 80007b4 <main_thread+0x34>
 80007ae:	4811      	ldr	r0, [pc, #68]	; (80007f4 <main_thread+0x74>)
 80007b0:	f7ff feda 	bl	8000568 <printf_>
 80007b4:	f44f 5080 	mov.w	r0, #4096	; 0x1000
 80007b8:	f000 fb2a 	bl	8000e10 <led_on>
 80007bc:	f000 f8e2 	bl	8000984 <timer_get_time>
 80007c0:	f44f 717a 	mov.w	r1, #1000	; 0x3e8
 80007c4:	fbb0 f1f1 	udiv	r1, r0, r1
 80007c8:	480b      	ldr	r0, [pc, #44]	; (80007f8 <main_thread+0x78>)
 80007ca:	f7ff fecd 	bl	8000568 <printf_>
 80007ce:	f44f 5080 	mov.w	r0, #4096	; 0x1000
 80007d2:	f000 fb23 	bl	8000e1c <led_off>
 80007d6:	f44f 60fa 	mov.w	r0, #2000	; 0x7d0
 80007da:	f000 f8e1 	bl	80009a0 <timer_delay_ms>
 80007de:	e7e9      	b.n	80007b4 <main_thread+0x34>
 80007e0:	08001b38 	.word	0x08001b38
 80007e4:	20000dd8 	.word	0x20000dd8
 80007e8:	080006fd 	.word	0x080006fd
 80007ec:	0800076d 	.word	0x0800076d
 80007f0:	200011d8 	.word	0x200011d8
 80007f4:	08001b73 	.word	0x08001b73
 80007f8:	08001b77 	.word	0x08001b77

080007fc <TIM_TimeBaseInit>:
 80007fc:	4a1c      	ldr	r2, [pc, #112]	; (8000870 <TIM_TimeBaseInit+0x74>)
 80007fe:	8803      	ldrh	r3, [r0, #0]
 8000800:	4290      	cmp	r0, r2
 8000802:	b29b      	uxth	r3, r3
 8000804:	d012      	beq.n	800082c <TIM_TimeBaseInit+0x30>
 8000806:	f502 6280 	add.w	r2, r2, #1024	; 0x400
 800080a:	4290      	cmp	r0, r2
 800080c:	d00e      	beq.n	800082c <TIM_TimeBaseInit+0x30>
 800080e:	f1b0 4f80 	cmp.w	r0, #1073741824	; 0x40000000
 8000812:	d00b      	beq.n	800082c <TIM_TimeBaseInit+0x30>
 8000814:	f5a2 3280 	sub.w	r2, r2, #65536	; 0x10000
 8000818:	4290      	cmp	r0, r2
 800081a:	d007      	beq.n	800082c <TIM_TimeBaseInit+0x30>
 800081c:	f502 6280 	add.w	r2, r2, #1024	; 0x400
 8000820:	4290      	cmp	r0, r2
 8000822:	d003      	beq.n	800082c <TIM_TimeBaseInit+0x30>
 8000824:	f502 6280 	add.w	r2, r2, #1024	; 0x400
 8000828:	4290      	cmp	r0, r2
 800082a:	d103      	bne.n	8000834 <TIM_TimeBaseInit+0x38>
 800082c:	884a      	ldrh	r2, [r1, #2]
 800082e:	f023 0370 	bic.w	r3, r3, #112	; 0x70
 8000832:	4313      	orrs	r3, r2
 8000834:	4a0f      	ldr	r2, [pc, #60]	; (8000874 <TIM_TimeBaseInit+0x78>)
 8000836:	4290      	cmp	r0, r2
 8000838:	d008      	beq.n	800084c <TIM_TimeBaseInit+0x50>
 800083a:	f502 6280 	add.w	r2, r2, #1024	; 0x400
 800083e:	4290      	cmp	r0, r2
 8000840:	d004      	beq.n	800084c <TIM_TimeBaseInit+0x50>
 8000842:	f423 7340 	bic.w	r3, r3, #768	; 0x300
 8000846:	890a      	ldrh	r2, [r1, #8]
 8000848:	b29b      	uxth	r3, r3
 800084a:	4313      	orrs	r3, r2
 800084c:	8003      	strh	r3, [r0, #0]
 800084e:	684b      	ldr	r3, [r1, #4]
 8000850:	62c3      	str	r3, [r0, #44]	; 0x2c
 8000852:	880b      	ldrh	r3, [r1, #0]
 8000854:	8503      	strh	r3, [r0, #40]	; 0x28
 8000856:	4b06      	ldr	r3, [pc, #24]	; (8000870 <TIM_TimeBaseInit+0x74>)
 8000858:	4298      	cmp	r0, r3
 800085a:	d003      	beq.n	8000864 <TIM_TimeBaseInit+0x68>
 800085c:	f503 6380 	add.w	r3, r3, #1024	; 0x400
 8000860:	4298      	cmp	r0, r3
 8000862:	d101      	bne.n	8000868 <TIM_TimeBaseInit+0x6c>
 8000864:	7a8b      	ldrb	r3, [r1, #10]
 8000866:	8603      	strh	r3, [r0, #48]	; 0x30
 8000868:	2301      	movs	r3, #1
 800086a:	8283      	strh	r3, [r0, #20]
 800086c:	4770      	bx	lr
 800086e:	bf00      	nop
 8000870:	40010000 	.word	0x40010000
 8000874:	40001000 	.word	0x40001000

08000878 <TIM_Cmd>:
 8000878:	8803      	ldrh	r3, [r0, #0]
 800087a:	b119      	cbz	r1, 8000884 <TIM_Cmd+0xc>
 800087c:	b29b      	uxth	r3, r3
 800087e:	f043 0301 	orr.w	r3, r3, #1
 8000882:	e003      	b.n	800088c <TIM_Cmd+0x14>
 8000884:	f023 0301 	bic.w	r3, r3, #1
 8000888:	041b      	lsls	r3, r3, #16
 800088a:	0c1b      	lsrs	r3, r3, #16
 800088c:	8003      	strh	r3, [r0, #0]
 800088e:	4770      	bx	lr

08000890 <TIM_ClearITPendingBit>:
 8000890:	43c9      	mvns	r1, r1
 8000892:	b289      	uxth	r1, r1
 8000894:	8201      	strh	r1, [r0, #16]
 8000896:	4770      	bx	lr

08000898 <timer_init>:
 8000898:	b530      	push	{r4, r5, lr}
 800089a:	2000      	movs	r0, #0
 800089c:	b085      	sub	sp, #20
 800089e:	4a1e      	ldr	r2, [pc, #120]	; (8000918 <timer_init+0x80>)
 80008a0:	f44f 6380 	mov.w	r3, #1024	; 0x400
 80008a4:	f822 3010 	strh.w	r3, [r2, r0, lsl #1]
 80008a8:	4a1c      	ldr	r2, [pc, #112]	; (800091c <timer_init+0x84>)
 80008aa:	f822 3010 	strh.w	r3, [r2, r0, lsl #1]
 80008ae:	4b1c      	ldr	r3, [pc, #112]	; (8000920 <timer_init+0x88>)
 80008b0:	2400      	movs	r4, #0
 80008b2:	f823 4010 	strh.w	r4, [r3, r0, lsl #1]
 80008b6:	3001      	adds	r0, #1
 80008b8:	2804      	cmp	r0, #4
 80008ba:	4625      	mov	r5, r4
 80008bc:	d1ef      	bne.n	800089e <timer_init+0x6>
 80008be:	4b19      	ldr	r3, [pc, #100]	; (8000924 <timer_init+0x8c>)
 80008c0:	2101      	movs	r1, #1
 80008c2:	601c      	str	r4, [r3, #0]
 80008c4:	f000 fa58 	bl	8000d78 <RCC_APB1PeriphClockCmd>
 80008c8:	f8ad 4006 	strh.w	r4, [sp, #6]
 80008cc:	f8ad 400c 	strh.w	r4, [sp, #12]
 80008d0:	f88d 400e 	strb.w	r4, [sp, #14]
 80008d4:	4c14      	ldr	r4, [pc, #80]	; (8000928 <timer_init+0x90>)
 80008d6:	2353      	movs	r3, #83	; 0x53
 80008d8:	f8ad 3004 	strh.w	r3, [sp, #4]
 80008dc:	4620      	mov	r0, r4
 80008de:	2331      	movs	r3, #49	; 0x31
 80008e0:	a901      	add	r1, sp, #4
 80008e2:	9302      	str	r3, [sp, #8]
 80008e4:	f7ff ff8a 	bl	80007fc <TIM_TimeBaseInit>
 80008e8:	4620      	mov	r0, r4
 80008ea:	2101      	movs	r1, #1
 80008ec:	f7ff ffc4 	bl	8000878 <TIM_Cmd>
 80008f0:	89a3      	ldrh	r3, [r4, #12]
 80008f2:	b29b      	uxth	r3, r3
 80008f4:	f043 0301 	orr.w	r3, r3, #1
 80008f8:	81a3      	strh	r3, [r4, #12]
 80008fa:	231e      	movs	r3, #30
 80008fc:	f88d 3000 	strb.w	r3, [sp]
 8000900:	4668      	mov	r0, sp
 8000902:	2301      	movs	r3, #1
 8000904:	f88d 5001 	strb.w	r5, [sp, #1]
 8000908:	f88d 3002 	strb.w	r3, [sp, #2]
 800090c:	f88d 3003 	strb.w	r3, [sp, #3]
 8000910:	f000 fade 	bl	8000ed0 <NVIC_Init>
 8000914:	b005      	add	sp, #20
 8000916:	bd30      	pop	{r4, r5, pc}
 8000918:	200013ec 	.word	0x200013ec
 800091c:	200013e0 	.word	0x200013e0
 8000920:	200013d8 	.word	0x200013d8
 8000924:	200013e8 	.word	0x200013e8
 8000928:	40000800 	.word	0x40000800

0800092c <TIM4_IRQHandler>:
 800092c:	2300      	movs	r3, #0
 800092e:	4a10      	ldr	r2, [pc, #64]	; (8000970 <TIM4_IRQHandler+0x44>)
 8000930:	f832 1013 	ldrh.w	r1, [r2, r3, lsl #1]
 8000934:	b289      	uxth	r1, r1
 8000936:	b129      	cbz	r1, 8000944 <TIM4_IRQHandler+0x18>
 8000938:	f832 1013 	ldrh.w	r1, [r2, r3, lsl #1]
 800093c:	b289      	uxth	r1, r1
 800093e:	3901      	subs	r1, #1
 8000940:	b289      	uxth	r1, r1
 8000942:	e007      	b.n	8000954 <TIM4_IRQHandler+0x28>
 8000944:	490b      	ldr	r1, [pc, #44]	; (8000974 <TIM4_IRQHandler+0x48>)
 8000946:	f831 1013 	ldrh.w	r1, [r1, r3, lsl #1]
 800094a:	b289      	uxth	r1, r1
 800094c:	f822 1013 	strh.w	r1, [r2, r3, lsl #1]
 8000950:	4a09      	ldr	r2, [pc, #36]	; (8000978 <TIM4_IRQHandler+0x4c>)
 8000952:	2101      	movs	r1, #1
 8000954:	f822 1013 	strh.w	r1, [r2, r3, lsl #1]
 8000958:	3301      	adds	r3, #1
 800095a:	2b04      	cmp	r3, #4
 800095c:	d1e7      	bne.n	800092e <TIM4_IRQHandler+0x2>
 800095e:	4b07      	ldr	r3, [pc, #28]	; (800097c <TIM4_IRQHandler+0x50>)
 8000960:	4807      	ldr	r0, [pc, #28]	; (8000980 <TIM4_IRQHandler+0x54>)
 8000962:	681a      	ldr	r2, [r3, #0]
 8000964:	2101      	movs	r1, #1
 8000966:	3201      	adds	r2, #1
 8000968:	601a      	str	r2, [r3, #0]
 800096a:	f7ff bf91 	b.w	8000890 <TIM_ClearITPendingBit>
 800096e:	bf00      	nop
 8000970:	200013ec 	.word	0x200013ec
 8000974:	200013e0 	.word	0x200013e0
 8000978:	200013d8 	.word	0x200013d8
 800097c:	200013e8 	.word	0x200013e8
 8000980:	40000800 	.word	0x40000800

08000984 <timer_get_time>:
 8000984:	b082      	sub	sp, #8
 8000986:	b672      	cpsid	i
 8000988:	4b04      	ldr	r3, [pc, #16]	; (800099c <timer_get_time+0x18>)
 800098a:	681b      	ldr	r3, [r3, #0]
 800098c:	9301      	str	r3, [sp, #4]
 800098e:	b662      	cpsie	i
 8000990:	9801      	ldr	r0, [sp, #4]
 8000992:	230a      	movs	r3, #10
 8000994:	fbb0 f0f3 	udiv	r0, r0, r3
 8000998:	b002      	add	sp, #8
 800099a:	4770      	bx	lr
 800099c:	200013e8 	.word	0x200013e8

080009a0 <timer_delay_ms>:
 80009a0:	b513      	push	{r0, r1, r4, lr}
 80009a2:	4604      	mov	r4, r0
 80009a4:	f7ff ffee 	bl	8000984 <timer_get_time>
 80009a8:	4420      	add	r0, r4
 80009aa:	9001      	str	r0, [sp, #4]
 80009ac:	9c01      	ldr	r4, [sp, #4]
 80009ae:	f7ff ffe9 	bl	8000984 <timer_get_time>
 80009b2:	4284      	cmp	r4, r0
 80009b4:	d902      	bls.n	80009bc <timer_delay_ms+0x1c>
 80009b6:	f000 f8c7 	bl	8000b48 <sleep>
 80009ba:	e7f7      	b.n	80009ac <timer_delay_ms+0xc>
 80009bc:	b002      	add	sp, #8
 80009be:	bd10      	pop	{r4, pc}

080009c0 <uart_write>:
 80009c0:	4b03      	ldr	r3, [pc, #12]	; (80009d0 <uart_write+0x10>)
 80009c2:	881a      	ldrh	r2, [r3, #0]
 80009c4:	0652      	lsls	r2, r2, #25
 80009c6:	d401      	bmi.n	80009cc <uart_write+0xc>
 80009c8:	bf00      	nop
 80009ca:	e7f9      	b.n	80009c0 <uart_write>
 80009cc:	8098      	strh	r0, [r3, #4]
 80009ce:	4770      	bx	lr
 80009d0:	40004400 	.word	0x40004400

080009d4 <uart_init>:
 80009d4:	b5f0      	push	{r4, r5, r6, r7, lr}
 80009d6:	f44f 3000 	mov.w	r0, #131072	; 0x20000
 80009da:	b087      	sub	sp, #28
 80009dc:	2101      	movs	r1, #1
 80009de:	f000 f9cb 	bl	8000d78 <RCC_APB1PeriphClockCmd>
 80009e2:	4d1b      	ldr	r5, [pc, #108]	; (8000a50 <uart_init+0x7c>)
 80009e4:	2001      	movs	r0, #1
 80009e6:	4601      	mov	r1, r0
 80009e8:	f000 f9ba 	bl	8000d60 <RCC_AHB1PeriphClockCmd>
 80009ec:	2400      	movs	r4, #0
 80009ee:	2602      	movs	r6, #2
 80009f0:	270c      	movs	r7, #12
 80009f2:	4628      	mov	r0, r5
 80009f4:	4669      	mov	r1, sp
 80009f6:	f88d 4006 	strb.w	r4, [sp, #6]
 80009fa:	f88d 4007 	strb.w	r4, [sp, #7]
 80009fe:	9700      	str	r7, [sp, #0]
 8000a00:	f88d 6004 	strb.w	r6, [sp, #4]
 8000a04:	f88d 6005 	strb.w	r6, [sp, #5]
 8000a08:	f000 fa0e 	bl	8000e28 <GPIO_Init>
 8000a0c:	4628      	mov	r0, r5
 8000a0e:	4631      	mov	r1, r6
 8000a10:	2207      	movs	r2, #7
 8000a12:	f000 fa4a 	bl	8000eaa <GPIO_PinAFConfig>
 8000a16:	2207      	movs	r2, #7
 8000a18:	4628      	mov	r0, r5
 8000a1a:	2103      	movs	r1, #3
 8000a1c:	f000 fa45 	bl	8000eaa <GPIO_PinAFConfig>
 8000a20:	f8ad 400c 	strh.w	r4, [sp, #12]
 8000a24:	f8ad 400e 	strh.w	r4, [sp, #14]
 8000a28:	f8ad 4010 	strh.w	r4, [sp, #16]
 8000a2c:	f8ad 4014 	strh.w	r4, [sp, #20]
 8000a30:	4c08      	ldr	r4, [pc, #32]	; (8000a54 <uart_init+0x80>)
 8000a32:	f8ad 7012 	strh.w	r7, [sp, #18]
 8000a36:	f44f 33e1 	mov.w	r3, #115200	; 0x1c200
 8000a3a:	4620      	mov	r0, r4
 8000a3c:	a902      	add	r1, sp, #8
 8000a3e:	9302      	str	r3, [sp, #8]
 8000a40:	f000 f80a 	bl	8000a58 <USART_Init>
 8000a44:	4620      	mov	r0, r4
 8000a46:	2101      	movs	r1, #1
 8000a48:	f000 f860 	bl	8000b0c <USART_Cmd>
 8000a4c:	b007      	add	sp, #28
 8000a4e:	bdf0      	pop	{r4, r5, r6, r7, pc}
 8000a50:	40020000 	.word	0x40020000
 8000a54:	40004400 	.word	0x40004400

08000a58 <USART_Init>:
 8000a58:	8a03      	ldrh	r3, [r0, #16]
 8000a5a:	88ca      	ldrh	r2, [r1, #6]
 8000a5c:	b29b      	uxth	r3, r3
 8000a5e:	f423 5340 	bic.w	r3, r3, #12288	; 0x3000
 8000a62:	b530      	push	{r4, r5, lr}
 8000a64:	4313      	orrs	r3, r2
 8000a66:	460d      	mov	r5, r1
 8000a68:	8203      	strh	r3, [r0, #16]
 8000a6a:	8983      	ldrh	r3, [r0, #12]
 8000a6c:	8909      	ldrh	r1, [r1, #8]
 8000a6e:	88aa      	ldrh	r2, [r5, #4]
 8000a70:	f423 53b0 	bic.w	r3, r3, #5632	; 0x1600
 8000a74:	430a      	orrs	r2, r1
 8000a76:	8969      	ldrh	r1, [r5, #10]
 8000a78:	f023 030c 	bic.w	r3, r3, #12
 8000a7c:	430a      	orrs	r2, r1
 8000a7e:	041b      	lsls	r3, r3, #16
 8000a80:	b292      	uxth	r2, r2
 8000a82:	0c1b      	lsrs	r3, r3, #16
 8000a84:	4313      	orrs	r3, r2
 8000a86:	8183      	strh	r3, [r0, #12]
 8000a88:	8a83      	ldrh	r3, [r0, #20]
 8000a8a:	89aa      	ldrh	r2, [r5, #12]
 8000a8c:	b29b      	uxth	r3, r3
 8000a8e:	f423 7340 	bic.w	r3, r3, #768	; 0x300
 8000a92:	4313      	orrs	r3, r2
 8000a94:	b085      	sub	sp, #20
 8000a96:	8283      	strh	r3, [r0, #20]
 8000a98:	4604      	mov	r4, r0
 8000a9a:	4668      	mov	r0, sp
 8000a9c:	f000 f91c 	bl	8000cd8 <RCC_GetClocksFreq>
 8000aa0:	4b19      	ldr	r3, [pc, #100]	; (8000b08 <USART_Init+0xb0>)
 8000aa2:	429c      	cmp	r4, r3
 8000aa4:	d003      	beq.n	8000aae <USART_Init+0x56>
 8000aa6:	f503 6380 	add.w	r3, r3, #1024	; 0x400
 8000aaa:	429c      	cmp	r4, r3
 8000aac:	d101      	bne.n	8000ab2 <USART_Init+0x5a>
 8000aae:	9b03      	ldr	r3, [sp, #12]
 8000ab0:	e000      	b.n	8000ab4 <USART_Init+0x5c>
 8000ab2:	9b02      	ldr	r3, [sp, #8]
 8000ab4:	89a2      	ldrh	r2, [r4, #12]
 8000ab6:	b212      	sxth	r2, r2
 8000ab8:	2a00      	cmp	r2, #0
 8000aba:	682a      	ldr	r2, [r5, #0]
 8000abc:	f04f 0119 	mov.w	r1, #25
 8000ac0:	bfb4      	ite	lt
 8000ac2:	0052      	lsllt	r2, r2, #1
 8000ac4:	0092      	lslge	r2, r2, #2
 8000ac6:	4359      	muls	r1, r3
 8000ac8:	fbb1 f1f2 	udiv	r1, r1, r2
 8000acc:	2364      	movs	r3, #100	; 0x64
 8000ace:	fbb1 f2f3 	udiv	r2, r1, r3
 8000ad2:	0112      	lsls	r2, r2, #4
 8000ad4:	0910      	lsrs	r0, r2, #4
 8000ad6:	fb03 1110 	mls	r1, r3, r0, r1
 8000ada:	89a0      	ldrh	r0, [r4, #12]
 8000adc:	b200      	sxth	r0, r0
 8000ade:	2800      	cmp	r0, #0
 8000ae0:	da06      	bge.n	8000af0 <USART_Init+0x98>
 8000ae2:	00c9      	lsls	r1, r1, #3
 8000ae4:	3132      	adds	r1, #50	; 0x32
 8000ae6:	fbb1 f3f3 	udiv	r3, r1, r3
 8000aea:	f003 0307 	and.w	r3, r3, #7
 8000aee:	e005      	b.n	8000afc <USART_Init+0xa4>
 8000af0:	0109      	lsls	r1, r1, #4
 8000af2:	3132      	adds	r1, #50	; 0x32
 8000af4:	fbb1 f3f3 	udiv	r3, r1, r3
 8000af8:	f003 030f 	and.w	r3, r3, #15
 8000afc:	431a      	orrs	r2, r3
 8000afe:	b292      	uxth	r2, r2
 8000b00:	8122      	strh	r2, [r4, #8]
 8000b02:	b005      	add	sp, #20
 8000b04:	bd30      	pop	{r4, r5, pc}
 8000b06:	bf00      	nop
 8000b08:	40011000 	.word	0x40011000

08000b0c <USART_Cmd>:
 8000b0c:	8983      	ldrh	r3, [r0, #12]
 8000b0e:	b119      	cbz	r1, 8000b18 <USART_Cmd+0xc>
 8000b10:	b29b      	uxth	r3, r3
 8000b12:	f443 5300 	orr.w	r3, r3, #8192	; 0x2000
 8000b16:	e003      	b.n	8000b20 <USART_Cmd+0x14>
 8000b18:	f423 5300 	bic.w	r3, r3, #8192	; 0x2000
 8000b1c:	041b      	lsls	r3, r3, #16
 8000b1e:	0c1b      	lsrs	r3, r3, #16
 8000b20:	8183      	strh	r3, [r0, #12]
 8000b22:	4770      	bx	lr

08000b24 <sys_tick_init>:
 8000b24:	4b05      	ldr	r3, [pc, #20]	; (8000b3c <sys_tick_init+0x18>)
 8000b26:	4a06      	ldr	r2, [pc, #24]	; (8000b40 <sys_tick_init+0x1c>)
 8000b28:	605a      	str	r2, [r3, #4]
 8000b2a:	4a06      	ldr	r2, [pc, #24]	; (8000b44 <sys_tick_init+0x20>)
 8000b2c:	21f0      	movs	r1, #240	; 0xf0
 8000b2e:	f882 1023 	strb.w	r1, [r2, #35]	; 0x23
 8000b32:	2200      	movs	r2, #0
 8000b34:	609a      	str	r2, [r3, #8]
 8000b36:	2207      	movs	r2, #7
 8000b38:	601a      	str	r2, [r3, #0]
 8000b3a:	4770      	bx	lr
 8000b3c:	e000e010 	.word	0xe000e010
 8000b40:	00029040 	.word	0x00029040
 8000b44:	e000ed00 	.word	0xe000ed00

08000b48 <sleep>:
 8000b48:	bf30      	wfi
 8000b4a:	4770      	bx	lr

08000b4c <sytem_clock_init>:
 8000b4c:	f000 b800 	b.w	8000b50 <SystemInit>

08000b50 <SystemInit>:
 8000b50:	4b3b      	ldr	r3, [pc, #236]	; (8000c40 <SystemInit+0xf0>)
 8000b52:	f8d3 2088 	ldr.w	r2, [r3, #136]	; 0x88
 8000b56:	f442 0270 	orr.w	r2, r2, #15728640	; 0xf00000
 8000b5a:	f8c3 2088 	str.w	r2, [r3, #136]	; 0x88
 8000b5e:	f8d3 2088 	ldr.w	r2, [r3, #136]	; 0x88
 8000b62:	f442 0270 	orr.w	r2, r2, #15728640	; 0xf00000
 8000b66:	f8c3 2088 	str.w	r2, [r3, #136]	; 0x88
 8000b6a:	4b36      	ldr	r3, [pc, #216]	; (8000c44 <SystemInit+0xf4>)
 8000b6c:	681a      	ldr	r2, [r3, #0]
 8000b6e:	f042 0201 	orr.w	r2, r2, #1
 8000b72:	601a      	str	r2, [r3, #0]
 8000b74:	2200      	movs	r2, #0
 8000b76:	609a      	str	r2, [r3, #8]
 8000b78:	6819      	ldr	r1, [r3, #0]
 8000b7a:	f021 7184 	bic.w	r1, r1, #17301504	; 0x1080000
 8000b7e:	f421 3180 	bic.w	r1, r1, #65536	; 0x10000
 8000b82:	6019      	str	r1, [r3, #0]
 8000b84:	4930      	ldr	r1, [pc, #192]	; (8000c48 <SystemInit+0xf8>)
 8000b86:	6059      	str	r1, [r3, #4]
 8000b88:	6819      	ldr	r1, [r3, #0]
 8000b8a:	b082      	sub	sp, #8
 8000b8c:	f421 2180 	bic.w	r1, r1, #262144	; 0x40000
 8000b90:	6019      	str	r1, [r3, #0]
 8000b92:	60da      	str	r2, [r3, #12]
 8000b94:	9200      	str	r2, [sp, #0]
 8000b96:	9201      	str	r2, [sp, #4]
 8000b98:	681a      	ldr	r2, [r3, #0]
 8000b9a:	f442 3280 	orr.w	r2, r2, #65536	; 0x10000
 8000b9e:	601a      	str	r2, [r3, #0]
 8000ba0:	4b28      	ldr	r3, [pc, #160]	; (8000c44 <SystemInit+0xf4>)
 8000ba2:	681a      	ldr	r2, [r3, #0]
 8000ba4:	f402 3200 	and.w	r2, r2, #131072	; 0x20000
 8000ba8:	9201      	str	r2, [sp, #4]
 8000baa:	9a00      	ldr	r2, [sp, #0]
 8000bac:	3201      	adds	r2, #1
 8000bae:	9200      	str	r2, [sp, #0]
 8000bb0:	9a01      	ldr	r2, [sp, #4]
 8000bb2:	b91a      	cbnz	r2, 8000bbc <SystemInit+0x6c>
 8000bb4:	9a00      	ldr	r2, [sp, #0]
 8000bb6:	f5b2 6fa0 	cmp.w	r2, #1280	; 0x500
 8000bba:	d1f1      	bne.n	8000ba0 <SystemInit+0x50>
 8000bbc:	681b      	ldr	r3, [r3, #0]
 8000bbe:	f413 3300 	ands.w	r3, r3, #131072	; 0x20000
 8000bc2:	bf18      	it	ne
 8000bc4:	2301      	movne	r3, #1
 8000bc6:	9301      	str	r3, [sp, #4]
 8000bc8:	9b01      	ldr	r3, [sp, #4]
 8000bca:	2b01      	cmp	r3, #1
 8000bcc:	d005      	beq.n	8000bda <SystemInit+0x8a>
 8000bce:	4b1c      	ldr	r3, [pc, #112]	; (8000c40 <SystemInit+0xf0>)
 8000bd0:	f04f 6200 	mov.w	r2, #134217728	; 0x8000000
 8000bd4:	609a      	str	r2, [r3, #8]
 8000bd6:	b002      	add	sp, #8
 8000bd8:	4770      	bx	lr
 8000bda:	4b1a      	ldr	r3, [pc, #104]	; (8000c44 <SystemInit+0xf4>)
 8000bdc:	6c1a      	ldr	r2, [r3, #64]	; 0x40
 8000bde:	f042 5280 	orr.w	r2, r2, #268435456	; 0x10000000
 8000be2:	641a      	str	r2, [r3, #64]	; 0x40
 8000be4:	4a19      	ldr	r2, [pc, #100]	; (8000c4c <SystemInit+0xfc>)
 8000be6:	6811      	ldr	r1, [r2, #0]
 8000be8:	f441 4180 	orr.w	r1, r1, #16384	; 0x4000
 8000bec:	6011      	str	r1, [r2, #0]
 8000bee:	689a      	ldr	r2, [r3, #8]
 8000bf0:	f042 0290 	orr.w	r2, r2, #144	; 0x90
 8000bf4:	609a      	str	r2, [r3, #8]
 8000bf6:	689a      	ldr	r2, [r3, #8]
 8000bf8:	f442 4200 	orr.w	r2, r2, #32768	; 0x8000
 8000bfc:	609a      	str	r2, [r3, #8]
 8000bfe:	689a      	ldr	r2, [r3, #8]
 8000c00:	f442 52a0 	orr.w	r2, r2, #5120	; 0x1400
 8000c04:	609a      	str	r2, [r3, #8]
 8000c06:	4a12      	ldr	r2, [pc, #72]	; (8000c50 <SystemInit+0x100>)
 8000c08:	605a      	str	r2, [r3, #4]
 8000c0a:	681a      	ldr	r2, [r3, #0]
 8000c0c:	f042 7280 	orr.w	r2, r2, #16777216	; 0x1000000
 8000c10:	601a      	str	r2, [r3, #0]
 8000c12:	6819      	ldr	r1, [r3, #0]
 8000c14:	4a0b      	ldr	r2, [pc, #44]	; (8000c44 <SystemInit+0xf4>)
 8000c16:	0189      	lsls	r1, r1, #6
 8000c18:	d5fb      	bpl.n	8000c12 <SystemInit+0xc2>
 8000c1a:	4b0e      	ldr	r3, [pc, #56]	; (8000c54 <SystemInit+0x104>)
 8000c1c:	f240 6105 	movw	r1, #1541	; 0x605
 8000c20:	6019      	str	r1, [r3, #0]
 8000c22:	6893      	ldr	r3, [r2, #8]
 8000c24:	f023 0303 	bic.w	r3, r3, #3
 8000c28:	6093      	str	r3, [r2, #8]
 8000c2a:	6893      	ldr	r3, [r2, #8]
 8000c2c:	f043 0302 	orr.w	r3, r3, #2
 8000c30:	6093      	str	r3, [r2, #8]
 8000c32:	4b04      	ldr	r3, [pc, #16]	; (8000c44 <SystemInit+0xf4>)
 8000c34:	689b      	ldr	r3, [r3, #8]
 8000c36:	f003 030c 	and.w	r3, r3, #12
 8000c3a:	2b08      	cmp	r3, #8
 8000c3c:	d1f9      	bne.n	8000c32 <SystemInit+0xe2>
 8000c3e:	e7c6      	b.n	8000bce <SystemInit+0x7e>
 8000c40:	e000ed00 	.word	0xe000ed00
 8000c44:	40023800 	.word	0x40023800
 8000c48:	24003010 	.word	0x24003010
 8000c4c:	40007000 	.word	0x40007000
 8000c50:	07405408 	.word	0x07405408
 8000c54:	40023c00 	.word	0x40023c00

08000c58 <Default_Handler>:
 8000c58:	4668      	mov	r0, sp
 8000c5a:	f020 0107 	bic.w	r1, r0, #7
 8000c5e:	468d      	mov	sp, r1
 8000c60:	bf00      	nop
 8000c62:	e7fd      	b.n	8000c60 <Default_Handler+0x8>

08000c64 <HardFault_Handler>:
 8000c64:	f44f 5080 	mov.w	r0, #4096	; 0x1000
 8000c68:	f000 f8d2 	bl	8000e10 <led_on>
 8000c6c:	4b06      	ldr	r3, [pc, #24]	; (8000c88 <HardFault_Handler+0x24>)
 8000c6e:	3b01      	subs	r3, #1
 8000c70:	d001      	beq.n	8000c76 <HardFault_Handler+0x12>
 8000c72:	bf00      	nop
 8000c74:	e7fb      	b.n	8000c6e <HardFault_Handler+0xa>
 8000c76:	f44f 5080 	mov.w	r0, #4096	; 0x1000
 8000c7a:	f000 f8cf 	bl	8000e1c <led_off>
 8000c7e:	4b02      	ldr	r3, [pc, #8]	; (8000c88 <HardFault_Handler+0x24>)
 8000c80:	3b01      	subs	r3, #1
 8000c82:	d0ef      	beq.n	8000c64 <HardFault_Handler>
 8000c84:	bf00      	nop
 8000c86:	e7fb      	b.n	8000c80 <HardFault_Handler+0x1c>
 8000c88:	00989681 	.word	0x00989681

08000c8c <_reset_init>:
 8000c8c:	4a0e      	ldr	r2, [pc, #56]	; (8000cc8 <_reset_init+0x3c>)
 8000c8e:	480f      	ldr	r0, [pc, #60]	; (8000ccc <_reset_init+0x40>)
 8000c90:	1a80      	subs	r0, r0, r2
 8000c92:	1080      	asrs	r0, r0, #2
 8000c94:	2300      	movs	r3, #0
 8000c96:	4283      	cmp	r3, r0
 8000c98:	d006      	beq.n	8000ca8 <_reset_init+0x1c>
 8000c9a:	490d      	ldr	r1, [pc, #52]	; (8000cd0 <_reset_init+0x44>)
 8000c9c:	f851 1023 	ldr.w	r1, [r1, r3, lsl #2]
 8000ca0:	f842 1023 	str.w	r1, [r2, r3, lsl #2]
 8000ca4:	3301      	adds	r3, #1
 8000ca6:	e7f6      	b.n	8000c96 <_reset_init+0xa>
 8000ca8:	4b0a      	ldr	r3, [pc, #40]	; (8000cd4 <_reset_init+0x48>)
 8000caa:	f8d3 2088 	ldr.w	r2, [r3, #136]	; 0x88
 8000cae:	f442 0270 	orr.w	r2, r2, #15728640	; 0xf00000
 8000cb2:	f8c3 2088 	str.w	r2, [r3, #136]	; 0x88
 8000cb6:	f503 730c 	add.w	r3, r3, #560	; 0x230
 8000cba:	685a      	ldr	r2, [r3, #4]
 8000cbc:	f022 4240 	bic.w	r2, r2, #3221225472	; 0xc0000000
 8000cc0:	605a      	str	r2, [r3, #4]
 8000cc2:	f7ff bcfb 	b.w	80006bc <main>
 8000cc6:	bf00      	nop
 8000cc8:	20000000 	.word	0x20000000
 8000ccc:	2000084c 	.word	0x2000084c
 8000cd0:	08001b98 	.word	0x08001b98
 8000cd4:	e000ed00 	.word	0xe000ed00

08000cd8 <RCC_GetClocksFreq>:
 8000cd8:	4b1d      	ldr	r3, [pc, #116]	; (8000d50 <RCC_GetClocksFreq+0x78>)
 8000cda:	689a      	ldr	r2, [r3, #8]
 8000cdc:	f002 020c 	and.w	r2, r2, #12
 8000ce0:	2a04      	cmp	r2, #4
 8000ce2:	b510      	push	{r4, lr}
 8000ce4:	d003      	beq.n	8000cee <RCC_GetClocksFreq+0x16>
 8000ce6:	2a08      	cmp	r2, #8
 8000ce8:	d003      	beq.n	8000cf2 <RCC_GetClocksFreq+0x1a>
 8000cea:	4b1a      	ldr	r3, [pc, #104]	; (8000d54 <RCC_GetClocksFreq+0x7c>)
 8000cec:	e018      	b.n	8000d20 <RCC_GetClocksFreq+0x48>
 8000cee:	4b1a      	ldr	r3, [pc, #104]	; (8000d58 <RCC_GetClocksFreq+0x80>)
 8000cf0:	e016      	b.n	8000d20 <RCC_GetClocksFreq+0x48>
 8000cf2:	6859      	ldr	r1, [r3, #4]
 8000cf4:	685a      	ldr	r2, [r3, #4]
 8000cf6:	f411 0f80 	tst.w	r1, #4194304	; 0x400000
 8000cfa:	6859      	ldr	r1, [r3, #4]
 8000cfc:	bf14      	ite	ne
 8000cfe:	4b16      	ldrne	r3, [pc, #88]	; (8000d58 <RCC_GetClocksFreq+0x80>)
 8000d00:	4b14      	ldreq	r3, [pc, #80]	; (8000d54 <RCC_GetClocksFreq+0x7c>)
 8000d02:	f002 023f 	and.w	r2, r2, #63	; 0x3f
 8000d06:	fbb3 f3f2 	udiv	r3, r3, r2
 8000d0a:	4a11      	ldr	r2, [pc, #68]	; (8000d50 <RCC_GetClocksFreq+0x78>)
 8000d0c:	6852      	ldr	r2, [r2, #4]
 8000d0e:	f3c2 4201 	ubfx	r2, r2, #16, #2
 8000d12:	f3c1 1188 	ubfx	r1, r1, #6, #9
 8000d16:	3201      	adds	r2, #1
 8000d18:	434b      	muls	r3, r1
 8000d1a:	0052      	lsls	r2, r2, #1
 8000d1c:	fbb3 f3f2 	udiv	r3, r3, r2
 8000d20:	490b      	ldr	r1, [pc, #44]	; (8000d50 <RCC_GetClocksFreq+0x78>)
 8000d22:	6003      	str	r3, [r0, #0]
 8000d24:	688b      	ldr	r3, [r1, #8]
 8000d26:	4a0d      	ldr	r2, [pc, #52]	; (8000d5c <RCC_GetClocksFreq+0x84>)
 8000d28:	f3c3 1303 	ubfx	r3, r3, #4, #4
 8000d2c:	5cd4      	ldrb	r4, [r2, r3]
 8000d2e:	6803      	ldr	r3, [r0, #0]
 8000d30:	40e3      	lsrs	r3, r4
 8000d32:	6043      	str	r3, [r0, #4]
 8000d34:	688c      	ldr	r4, [r1, #8]
 8000d36:	f3c4 2482 	ubfx	r4, r4, #10, #3
 8000d3a:	5d14      	ldrb	r4, [r2, r4]
 8000d3c:	fa23 f404 	lsr.w	r4, r3, r4
 8000d40:	6084      	str	r4, [r0, #8]
 8000d42:	6889      	ldr	r1, [r1, #8]
 8000d44:	f3c1 3142 	ubfx	r1, r1, #13, #3
 8000d48:	5c52      	ldrb	r2, [r2, r1]
 8000d4a:	40d3      	lsrs	r3, r2
 8000d4c:	60c3      	str	r3, [r0, #12]
 8000d4e:	bd10      	pop	{r4, pc}
 8000d50:	40023800 	.word	0x40023800
 8000d54:	00f42400 	.word	0x00f42400
 8000d58:	007a1200 	.word	0x007a1200
 8000d5c:	2000042c 	.word	0x2000042c

08000d60 <RCC_AHB1PeriphClockCmd>:
 8000d60:	4b04      	ldr	r3, [pc, #16]	; (8000d74 <RCC_AHB1PeriphClockCmd+0x14>)
 8000d62:	6b1a      	ldr	r2, [r3, #48]	; 0x30
 8000d64:	b109      	cbz	r1, 8000d6a <RCC_AHB1PeriphClockCmd+0xa>
 8000d66:	4310      	orrs	r0, r2
 8000d68:	e001      	b.n	8000d6e <RCC_AHB1PeriphClockCmd+0xe>
 8000d6a:	ea22 0000 	bic.w	r0, r2, r0
 8000d6e:	6318      	str	r0, [r3, #48]	; 0x30
 8000d70:	4770      	bx	lr
 8000d72:	bf00      	nop
 8000d74:	40023800 	.word	0x40023800

08000d78 <RCC_APB1PeriphClockCmd>:
 8000d78:	4b04      	ldr	r3, [pc, #16]	; (8000d8c <RCC_APB1PeriphClockCmd+0x14>)
 8000d7a:	6c1a      	ldr	r2, [r3, #64]	; 0x40
 8000d7c:	b109      	cbz	r1, 8000d82 <RCC_APB1PeriphClockCmd+0xa>
 8000d7e:	4310      	orrs	r0, r2
 8000d80:	e001      	b.n	8000d86 <RCC_APB1PeriphClockCmd+0xe>
 8000d82:	ea22 0000 	bic.w	r0, r2, r0
 8000d86:	6418      	str	r0, [r3, #64]	; 0x40
 8000d88:	4770      	bx	lr
 8000d8a:	bf00      	nop
 8000d8c:	40023800 	.word	0x40023800

08000d90 <lib_low_level_init>:
 8000d90:	b508      	push	{r3, lr}
 8000d92:	f7ff fedb 	bl	8000b4c <sytem_clock_init>
 8000d96:	f000 f807 	bl	8000da8 <gpio_init>
 8000d9a:	f7ff fe1b 	bl	80009d4 <uart_init>
 8000d9e:	e8bd 4008 	ldmia.w	sp!, {r3, lr}
 8000da2:	f7ff bd79 	b.w	8000898 <timer_init>
	...

08000da8 <gpio_init>:
 8000da8:	b513      	push	{r0, r1, r4, lr}
 8000daa:	2001      	movs	r0, #1
 8000dac:	4601      	mov	r1, r0
 8000dae:	f7ff ffd7 	bl	8000d60 <RCC_AHB1PeriphClockCmd>
 8000db2:	2002      	movs	r0, #2
 8000db4:	2101      	movs	r1, #1
 8000db6:	f7ff ffd3 	bl	8000d60 <RCC_AHB1PeriphClockCmd>
 8000dba:	2004      	movs	r0, #4
 8000dbc:	2101      	movs	r1, #1
 8000dbe:	f7ff ffcf 	bl	8000d60 <RCC_AHB1PeriphClockCmd>
 8000dc2:	2008      	movs	r0, #8
 8000dc4:	2101      	movs	r1, #1
 8000dc6:	f7ff ffcb 	bl	8000d60 <RCC_AHB1PeriphClockCmd>
 8000dca:	4c10      	ldr	r4, [pc, #64]	; (8000e0c <gpio_init+0x64>)
 8000dcc:	f44f 4370 	mov.w	r3, #61440	; 0xf000
 8000dd0:	9300      	str	r3, [sp, #0]
 8000dd2:	2301      	movs	r3, #1
 8000dd4:	f88d 3004 	strb.w	r3, [sp, #4]
 8000dd8:	2203      	movs	r2, #3
 8000dda:	2300      	movs	r3, #0
 8000ddc:	4620      	mov	r0, r4
 8000dde:	4669      	mov	r1, sp
 8000de0:	f88d 3006 	strb.w	r3, [sp, #6]
 8000de4:	f88d 3007 	strb.w	r3, [sp, #7]
 8000de8:	f88d 2005 	strb.w	r2, [sp, #5]
 8000dec:	f000 f81c 	bl	8000e28 <GPIO_Init>
 8000df0:	f44f 5380 	mov.w	r3, #4096	; 0x1000
 8000df4:	8363      	strh	r3, [r4, #26]
 8000df6:	f44f 5300 	mov.w	r3, #8192	; 0x2000
 8000dfa:	8363      	strh	r3, [r4, #26]
 8000dfc:	f44f 4380 	mov.w	r3, #16384	; 0x4000
 8000e00:	8363      	strh	r3, [r4, #26]
 8000e02:	f44f 4300 	mov.w	r3, #32768	; 0x8000
 8000e06:	8363      	strh	r3, [r4, #26]
 8000e08:	b002      	add	sp, #8
 8000e0a:	bd10      	pop	{r4, pc}
 8000e0c:	40020c00 	.word	0x40020c00

08000e10 <led_on>:
 8000e10:	4b01      	ldr	r3, [pc, #4]	; (8000e18 <led_on+0x8>)
 8000e12:	b280      	uxth	r0, r0
 8000e14:	8318      	strh	r0, [r3, #24]
 8000e16:	4770      	bx	lr
 8000e18:	40020c00 	.word	0x40020c00

08000e1c <led_off>:
 8000e1c:	4b01      	ldr	r3, [pc, #4]	; (8000e24 <led_off+0x8>)
 8000e1e:	b280      	uxth	r0, r0
 8000e20:	8358      	strh	r0, [r3, #26]
 8000e22:	4770      	bx	lr
 8000e24:	40020c00 	.word	0x40020c00

08000e28 <GPIO_Init>:
 8000e28:	e92d 41f0 	stmdb	sp!, {r4, r5, r6, r7, r8, lr}
 8000e2c:	680f      	ldr	r7, [r1, #0]
 8000e2e:	2300      	movs	r3, #0
 8000e30:	2201      	movs	r2, #1
 8000e32:	409a      	lsls	r2, r3
 8000e34:	ea02 0507 	and.w	r5, r2, r7
 8000e38:	4295      	cmp	r5, r2
 8000e3a:	d131      	bne.n	8000ea0 <GPIO_Init+0x78>
 8000e3c:	005a      	lsls	r2, r3, #1
 8000e3e:	2403      	movs	r4, #3
 8000e40:	6806      	ldr	r6, [r0, #0]
 8000e42:	4094      	lsls	r4, r2
 8000e44:	43e4      	mvns	r4, r4
 8000e46:	4026      	ands	r6, r4
 8000e48:	6006      	str	r6, [r0, #0]
 8000e4a:	790e      	ldrb	r6, [r1, #4]
 8000e4c:	f8d0 c000 	ldr.w	ip, [r0]
 8000e50:	fa06 f802 	lsl.w	r8, r6, r2
 8000e54:	3e01      	subs	r6, #1
 8000e56:	b2f6      	uxtb	r6, r6
 8000e58:	ea48 0c0c 	orr.w	ip, r8, ip
 8000e5c:	2e01      	cmp	r6, #1
 8000e5e:	f8c0 c000 	str.w	ip, [r0]
 8000e62:	d814      	bhi.n	8000e8e <GPIO_Init+0x66>
 8000e64:	6886      	ldr	r6, [r0, #8]
 8000e66:	f891 c005 	ldrb.w	ip, [r1, #5]
 8000e6a:	4026      	ands	r6, r4
 8000e6c:	6086      	str	r6, [r0, #8]
 8000e6e:	6886      	ldr	r6, [r0, #8]
 8000e70:	fa0c fc02 	lsl.w	ip, ip, r2
 8000e74:	ea4c 0606 	orr.w	r6, ip, r6
 8000e78:	6086      	str	r6, [r0, #8]
 8000e7a:	6846      	ldr	r6, [r0, #4]
 8000e7c:	ea26 0505 	bic.w	r5, r6, r5
 8000e80:	6045      	str	r5, [r0, #4]
 8000e82:	798d      	ldrb	r5, [r1, #6]
 8000e84:	6846      	ldr	r6, [r0, #4]
 8000e86:	409d      	lsls	r5, r3
 8000e88:	b2ad      	uxth	r5, r5
 8000e8a:	4335      	orrs	r5, r6
 8000e8c:	6045      	str	r5, [r0, #4]
 8000e8e:	68c5      	ldr	r5, [r0, #12]
 8000e90:	402c      	ands	r4, r5
 8000e92:	60c4      	str	r4, [r0, #12]
 8000e94:	79cd      	ldrb	r5, [r1, #7]
 8000e96:	68c4      	ldr	r4, [r0, #12]
 8000e98:	fa05 f202 	lsl.w	r2, r5, r2
 8000e9c:	4322      	orrs	r2, r4
 8000e9e:	60c2      	str	r2, [r0, #12]
 8000ea0:	3301      	adds	r3, #1
 8000ea2:	2b10      	cmp	r3, #16
 8000ea4:	d1c4      	bne.n	8000e30 <GPIO_Init+0x8>
 8000ea6:	e8bd 81f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, pc}

08000eaa <GPIO_PinAFConfig>:
 8000eaa:	f001 0307 	and.w	r3, r1, #7
 8000eae:	08c9      	lsrs	r1, r1, #3
 8000eb0:	eb00 0081 	add.w	r0, r0, r1, lsl #2
 8000eb4:	b510      	push	{r4, lr}
 8000eb6:	009b      	lsls	r3, r3, #2
 8000eb8:	6a04      	ldr	r4, [r0, #32]
 8000eba:	210f      	movs	r1, #15
 8000ebc:	4099      	lsls	r1, r3
 8000ebe:	ea24 0101 	bic.w	r1, r4, r1
 8000ec2:	6201      	str	r1, [r0, #32]
 8000ec4:	6a01      	ldr	r1, [r0, #32]
 8000ec6:	409a      	lsls	r2, r3
 8000ec8:	4311      	orrs	r1, r2
 8000eca:	6201      	str	r1, [r0, #32]
 8000ecc:	bd10      	pop	{r4, pc}
	...

08000ed0 <NVIC_Init>:
 8000ed0:	78c2      	ldrb	r2, [r0, #3]
 8000ed2:	7803      	ldrb	r3, [r0, #0]
 8000ed4:	b510      	push	{r4, lr}
 8000ed6:	b30a      	cbz	r2, 8000f1c <NVIC_Init+0x4c>
 8000ed8:	4a16      	ldr	r2, [pc, #88]	; (8000f34 <NVIC_Init+0x64>)
 8000eda:	7844      	ldrb	r4, [r0, #1]
 8000edc:	68d2      	ldr	r2, [r2, #12]
 8000ede:	43d2      	mvns	r2, r2
 8000ee0:	f3c2 2202 	ubfx	r2, r2, #8, #3
 8000ee4:	f1c2 0104 	rsb	r1, r2, #4
 8000ee8:	b2c9      	uxtb	r1, r1
 8000eea:	fa04 f101 	lsl.w	r1, r4, r1
 8000eee:	240f      	movs	r4, #15
 8000ef0:	fa44 f202 	asr.w	r2, r4, r2
 8000ef4:	7884      	ldrb	r4, [r0, #2]
 8000ef6:	b2c9      	uxtb	r1, r1
 8000ef8:	4022      	ands	r2, r4
 8000efa:	430a      	orrs	r2, r1
 8000efc:	f103 4360 	add.w	r3, r3, #3758096384	; 0xe0000000
 8000f00:	f503 4361 	add.w	r3, r3, #57600	; 0xe100
 8000f04:	0112      	lsls	r2, r2, #4
 8000f06:	b2d2      	uxtb	r2, r2
 8000f08:	f883 2300 	strb.w	r2, [r3, #768]	; 0x300
 8000f0c:	7803      	ldrb	r3, [r0, #0]
 8000f0e:	2201      	movs	r2, #1
 8000f10:	0959      	lsrs	r1, r3, #5
 8000f12:	f003 031f 	and.w	r3, r3, #31
 8000f16:	fa02 f303 	lsl.w	r3, r2, r3
 8000f1a:	e006      	b.n	8000f2a <NVIC_Init+0x5a>
 8000f1c:	0959      	lsrs	r1, r3, #5
 8000f1e:	2201      	movs	r2, #1
 8000f20:	f003 031f 	and.w	r3, r3, #31
 8000f24:	fa02 f303 	lsl.w	r3, r2, r3
 8000f28:	3120      	adds	r1, #32
 8000f2a:	4a03      	ldr	r2, [pc, #12]	; (8000f38 <NVIC_Init+0x68>)
 8000f2c:	f842 3021 	str.w	r3, [r2, r1, lsl #2]
 8000f30:	bd10      	pop	{r4, pc}
 8000f32:	bf00      	nop
 8000f34:	e000ed00 	.word	0xe000ed00
 8000f38:	e000e100 	.word	0xe000e100

08000f3c <__errno>:
 8000f3c:	e59f3004 	ldr	r3, [pc, #4]	; 8000f48 <__errno+0xc>
 8000f40:	e5930000 	ldr	r0, [r3]
 8000f44:	e12fff1e 	bx	lr
 8000f48:	20000428 	.word	0x20000428

08000f4c <malloc>:
 8000f4c:	e92d4008 	push	{r3, lr}
 8000f50:	e59f3010 	ldr	r3, [pc, #16]	; 8000f68 <malloc+0x1c>
 8000f54:	e1a01000 	mov	r1, r0
 8000f58:	e5930000 	ldr	r0, [r3]
 8000f5c:	eb000002 	bl	8000f6c <_malloc_r>
 8000f60:	e8bd4008 	pop	{r3, lr}
 8000f64:	e12fff1e 	bx	lr
 8000f68:	20000428 	.word	0x20000428

08000f6c <_malloc_r>:
 8000f6c:	e92d4ff0 	push	{r4, r5, r6, r7, r8, r9, sl, fp, lr}
 8000f70:	e281500b 	add	r5, r1, #11
 8000f74:	e3550016 	cmp	r5, #22
 8000f78:	83c55007 	bichi	r5, r5, #7
 8000f7c:	81a03fa5 	lsrhi	r3, r5, #31
 8000f80:	93a03000 	movls	r3, #0
 8000f84:	93a05010 	movls	r5, #16
 8000f88:	e1550001 	cmp	r5, r1
 8000f8c:	21a01003 	movcs	r1, r3
 8000f90:	33831001 	orrcc	r1, r3, #1
 8000f94:	e3510000 	cmp	r1, #0
 8000f98:	13a0300c 	movne	r3, #12
 8000f9c:	e24dd00c 	sub	sp, sp, #12
 8000fa0:	e1a06000 	mov	r6, r0
 8000fa4:	15803000 	strne	r3, [r0]
 8000fa8:	13a04000 	movne	r4, #0
 8000fac:	1a000015 	bne	8001008 <_malloc_r+0x9c>
 8000fb0:	eb0001c0 	bl	80016b8 <__malloc_lock>
 8000fb4:	e3550f7e 	cmp	r5, #504	; 0x1f8
 8000fb8:	2a000016 	bcs	8001018 <_malloc_r+0xac>
 8000fbc:	e59f76d8 	ldr	r7, [pc, #1752]	; 800169c <_malloc_r+0x730>
 8000fc0:	e1a0e1a5 	lsr	lr, r5, #3
 8000fc4:	e087318e 	add	r3, r7, lr, lsl #3
 8000fc8:	e593400c 	ldr	r4, [r3, #12]
 8000fcc:	e1540003 	cmp	r4, r3
 8000fd0:	0a000149 	beq	80014fc <_malloc_r+0x590>
 8000fd4:	e5943004 	ldr	r3, [r4, #4]
 8000fd8:	e3c33003 	bic	r3, r3, #3
 8000fdc:	e0843003 	add	r3, r4, r3
 8000fe0:	e593c004 	ldr	ip, [r3, #4]
 8000fe4:	e2841008 	add	r1, r4, #8
 8000fe8:	e8910006 	ldm	r1, {r1, r2}
 8000fec:	e38cc001 	orr	ip, ip, #1
 8000ff0:	e581200c 	str	r2, [r1, #12]
 8000ff4:	e1a00006 	mov	r0, r6
 8000ff8:	e5821008 	str	r1, [r2, #8]
 8000ffc:	e583c004 	str	ip, [r3, #4]
 8001000:	eb0001ad 	bl	80016bc <__malloc_unlock>
 8001004:	e2844008 	add	r4, r4, #8
 8001008:	e1a00004 	mov	r0, r4
 800100c:	e28dd00c 	add	sp, sp, #12
 8001010:	e8bd4ff0 	pop	{r4, r5, r6, r7, r8, r9, sl, fp, lr}
 8001014:	e12fff1e 	bx	lr
 8001018:	e1b0e4a5 	lsrs	lr, r5, #9
 800101c:	03a0107e 	moveq	r1, #126	; 0x7e
 8001020:	03a0e03f 	moveq	lr, #63	; 0x3f
 8001024:	1a000061 	bne	80011b0 <_malloc_r+0x244>
 8001028:	e59f766c 	ldr	r7, [pc, #1644]	; 800169c <_malloc_r+0x730>
 800102c:	e0871101 	add	r1, r7, r1, lsl #2
 8001030:	e591400c 	ldr	r4, [r1, #12]
 8001034:	e1510004 	cmp	r1, r4
 8001038:	1a000005 	bne	8001054 <_malloc_r+0xe8>
 800103c:	ea00000a 	b	800106c <_malloc_r+0x100>
 8001040:	e3530000 	cmp	r3, #0
 8001044:	aa0000e2 	bge	80013d4 <_malloc_r+0x468>
 8001048:	e594400c 	ldr	r4, [r4, #12]
 800104c:	e1510004 	cmp	r1, r4
 8001050:	0a000005 	beq	800106c <_malloc_r+0x100>
 8001054:	e5942004 	ldr	r2, [r4, #4]
 8001058:	e3c22003 	bic	r2, r2, #3
 800105c:	e0653002 	rsb	r3, r5, r2
 8001060:	e353000f 	cmp	r3, #15
 8001064:	dafffff5 	ble	8001040 <_malloc_r+0xd4>
 8001068:	e24ee001 	sub	lr, lr, #1
 800106c:	e28ee001 	add	lr, lr, #1
 8001070:	e59f3624 	ldr	r3, [pc, #1572]	; 800169c <_malloc_r+0x730>
 8001074:	e5974010 	ldr	r4, [r7, #16]
 8001078:	e2838008 	add	r8, r3, #8
 800107c:	e1540008 	cmp	r4, r8
 8001080:	05931004 	ldreq	r1, [r3, #4]
 8001084:	0a000016 	beq	80010e4 <_malloc_r+0x178>
 8001088:	e5942004 	ldr	r2, [r4, #4]
 800108c:	e3c22003 	bic	r2, r2, #3
 8001090:	e0651002 	rsb	r1, r5, r2
 8001094:	e351000f 	cmp	r1, #15
 8001098:	ca000105 	bgt	80014b4 <_malloc_r+0x548>
 800109c:	e3510000 	cmp	r1, #0
 80010a0:	e5838014 	str	r8, [r3, #20]
 80010a4:	e5838010 	str	r8, [r3, #16]
 80010a8:	aa000046 	bge	80011c8 <_malloc_r+0x25c>
 80010ac:	e3520c02 	cmp	r2, #512	; 0x200
 80010b0:	2a0000e0 	bcs	8001438 <_malloc_r+0x4cc>
 80010b4:	e5930004 	ldr	r0, [r3, #4]
 80010b8:	e1a021a2 	lsr	r2, r2, #3
 80010bc:	e1a01142 	asr	r1, r2, #2
 80010c0:	e3a0c001 	mov	ip, #1
 80010c4:	e180111c 	orr	r1, r0, ip, lsl r1
 80010c8:	e0832182 	add	r2, r3, r2, lsl #3
 80010cc:	e5920008 	ldr	r0, [r2, #8]
 80010d0:	e5831004 	str	r1, [r3, #4]
 80010d4:	e5840008 	str	r0, [r4, #8]
 80010d8:	e584200c 	str	r2, [r4, #12]
 80010dc:	e5824008 	str	r4, [r2, #8]
 80010e0:	e580400c 	str	r4, [r0, #12]
 80010e4:	e1a0314e 	asr	r3, lr, #2
 80010e8:	e3a00001 	mov	r0, #1
 80010ec:	e1a00310 	lsl	r0, r0, r3
 80010f0:	e1500001 	cmp	r0, r1
 80010f4:	8a00003e 	bhi	80011f4 <_malloc_r+0x288>
 80010f8:	e1110000 	tst	r1, r0
 80010fc:	1a000008 	bne	8001124 <_malloc_r+0x1b8>
 8001100:	e1a00080 	lsl	r0, r0, #1
 8001104:	e3cee003 	bic	lr, lr, #3
 8001108:	e1110000 	tst	r1, r0
 800110c:	e28ee004 	add	lr, lr, #4
 8001110:	1a000003 	bne	8001124 <_malloc_r+0x1b8>
 8001114:	e1a00080 	lsl	r0, r0, #1
 8001118:	e1110000 	tst	r1, r0
 800111c:	e28ee004 	add	lr, lr, #4
 8001120:	0afffffb 	beq	8001114 <_malloc_r+0x1a8>
 8001124:	e087418e 	add	r4, r7, lr, lsl #3
 8001128:	e1a0c004 	mov	ip, r4
 800112c:	e1a0900e 	mov	r9, lr
 8001130:	e59c300c 	ldr	r3, [ip, #12]
 8001134:	e15c0003 	cmp	ip, r3
 8001138:	1a000005 	bne	8001154 <_malloc_r+0x1e8>
 800113c:	ea0000e9 	b	80014e8 <_malloc_r+0x57c>
 8001140:	e3520000 	cmp	r2, #0
 8001144:	aa0000f2 	bge	8001514 <_malloc_r+0x5a8>
 8001148:	e593300c 	ldr	r3, [r3, #12]
 800114c:	e15c0003 	cmp	ip, r3
 8001150:	0a0000e4 	beq	80014e8 <_malloc_r+0x57c>
 8001154:	e5931004 	ldr	r1, [r3, #4]
 8001158:	e3c11003 	bic	r1, r1, #3
 800115c:	e0652001 	rsb	r2, r5, r1
 8001160:	e352000f 	cmp	r2, #15
 8001164:	dafffff5 	ble	8001140 <_malloc_r+0x1d4>
 8001168:	e1a04003 	mov	r4, r3
 800116c:	e5b4c008 	ldr	ip, [r4, #8]!
 8001170:	e593100c 	ldr	r1, [r3, #12]
 8001174:	e3859001 	orr	r9, r5, #1
 8001178:	e382e001 	orr	lr, r2, #1
 800117c:	e0835005 	add	r5, r3, r5
 8001180:	e5839004 	str	r9, [r3, #4]
 8001184:	e1a00006 	mov	r0, r6
 8001188:	e58c100c 	str	r1, [ip, #12]
 800118c:	e581c008 	str	ip, [r1, #8]
 8001190:	e5875014 	str	r5, [r7, #20]
 8001194:	e5875010 	str	r5, [r7, #16]
 8001198:	e585800c 	str	r8, [r5, #12]
 800119c:	e5858008 	str	r8, [r5, #8]
 80011a0:	e585e004 	str	lr, [r5, #4]
 80011a4:	e7852002 	str	r2, [r5, r2]
 80011a8:	eb000143 	bl	80016bc <__malloc_unlock>
 80011ac:	eaffff95 	b	8001008 <_malloc_r+0x9c>
 80011b0:	e35e0004 	cmp	lr, #4
 80011b4:	8a000095 	bhi	8001410 <_malloc_r+0x4a4>
 80011b8:	e1a0e325 	lsr	lr, r5, #6
 80011bc:	e28ee038 	add	lr, lr, #56	; 0x38
 80011c0:	e1a0108e 	lsl	r1, lr, #1
 80011c4:	eaffff97 	b	8001028 <_malloc_r+0xbc>
 80011c8:	e0842002 	add	r2, r4, r2
 80011cc:	e5923004 	ldr	r3, [r2, #4]
 80011d0:	e3833001 	orr	r3, r3, #1
 80011d4:	e1a00006 	mov	r0, r6
 80011d8:	e5823004 	str	r3, [r2, #4]
 80011dc:	eb000136 	bl	80016bc <__malloc_unlock>
 80011e0:	e2844008 	add	r4, r4, #8
 80011e4:	e1a00004 	mov	r0, r4
 80011e8:	e28dd00c 	add	sp, sp, #12
 80011ec:	e8bd4ff0 	pop	{r4, r5, r6, r7, r8, r9, sl, fp, lr}
 80011f0:	e12fff1e 	bx	lr
 80011f4:	e5974008 	ldr	r4, [r7, #8]
 80011f8:	e5949004 	ldr	r9, [r4, #4]
 80011fc:	e3c99003 	bic	r9, r9, #3
 8001200:	e1550009 	cmp	r5, r9
 8001204:	8a000002 	bhi	8001214 <_malloc_r+0x2a8>
 8001208:	e0653009 	rsb	r3, r5, r9
 800120c:	e353000f 	cmp	r3, #15
 8001210:	ca000062 	bgt	80013a0 <_malloc_r+0x434>
 8001214:	e59fc484 	ldr	ip, [pc, #1156]	; 80016a0 <_malloc_r+0x734>
 8001218:	e59f2484 	ldr	r2, [pc, #1156]	; 80016a4 <_malloc_r+0x738>
 800121c:	e59c3000 	ldr	r3, [ip]
 8001220:	e592b000 	ldr	fp, [r2]
 8001224:	e3730001 	cmn	r3, #1
 8001228:	e085b00b 	add	fp, r5, fp
 800122c:	128bba01 	addne	fp, fp, #4096	; 0x1000
 8001230:	128bb00f 	addne	fp, fp, #15
 8001234:	13cbbeff 	bicne	fp, fp, #4080	; 0xff0
 8001238:	028bb010 	addeq	fp, fp, #16
 800123c:	13cbb00f 	bicne	fp, fp, #15
 8001240:	e0842009 	add	r2, r4, r9
 8001244:	e1a00006 	mov	r0, r6
 8001248:	e1a0100b 	mov	r1, fp
 800124c:	e58d2004 	str	r2, [sp, #4]
 8001250:	e58dc000 	str	ip, [sp]
 8001254:	eb000119 	bl	80016c0 <_sbrk_r>
 8001258:	e3700001 	cmn	r0, #1
 800125c:	e1a08000 	mov	r8, r0
 8001260:	e59d2004 	ldr	r2, [sp, #4]
 8001264:	e59dc000 	ldr	ip, [sp]
 8001268:	0a0000bb 	beq	800155c <_malloc_r+0x5f0>
 800126c:	e1520000 	cmp	r2, r0
 8001270:	8a0000b7 	bhi	8001554 <_malloc_r+0x5e8>
 8001274:	e59fa42c 	ldr	sl, [pc, #1068]	; 80016a8 <_malloc_r+0x73c>
 8001278:	e59a3000 	ldr	r3, [sl]
 800127c:	e1520008 	cmp	r2, r8
 8001280:	e08b3003 	add	r3, fp, r3
 8001284:	e58a3000 	str	r3, [sl]
 8001288:	0a0000e8 	beq	8001630 <_malloc_r+0x6c4>
 800128c:	e59c1000 	ldr	r1, [ip]
 8001290:	e3710001 	cmn	r1, #1
 8001294:	10622008 	rsbne	r2, r2, r8
 8001298:	e59f1400 	ldr	r1, [pc, #1024]	; 80016a0 <_malloc_r+0x734>
 800129c:	10833002 	addne	r3, r3, r2
 80012a0:	05818000 	streq	r8, [r1]
 80012a4:	158a3000 	strne	r3, [sl]
 80012a8:	e2183007 	ands	r3, r8, #7
 80012ac:	12632008 	rsbne	r2, r3, #8
 80012b0:	10888002 	addne	r8, r8, r2
 80012b4:	12633a01 	rsbne	r3, r3, #4096	; 0x1000
 80012b8:	12832008 	addne	r2, r3, #8
 80012bc:	e088300b 	add	r3, r8, fp
 80012c0:	03a02a01 	moveq	r2, #4096	; 0x1000
 80012c4:	e1a03a03 	lsl	r3, r3, #20
 80012c8:	e042ba23 	sub	fp, r2, r3, lsr #20
 80012cc:	e1a0100b 	mov	r1, fp
 80012d0:	e1a00006 	mov	r0, r6
 80012d4:	eb0000f9 	bl	80016c0 <_sbrk_r>
 80012d8:	e3700001 	cmn	r0, #1
 80012dc:	10682000 	rsbne	r2, r8, r0
 80012e0:	e59a3000 	ldr	r3, [sl]
 80012e4:	108b2002 	addne	r2, fp, r2
 80012e8:	03a0b000 	moveq	fp, #0
 80012ec:	13822001 	orrne	r2, r2, #1
 80012f0:	03a02001 	moveq	r2, #1
 80012f4:	e08b3003 	add	r3, fp, r3
 80012f8:	e1540007 	cmp	r4, r7
 80012fc:	e5878008 	str	r8, [r7, #8]
 8001300:	e58a3000 	str	r3, [sl]
 8001304:	e5882004 	str	r2, [r8, #4]
 8001308:	e59fa398 	ldr	sl, [pc, #920]	; 80016a8 <_malloc_r+0x73c>
 800130c:	0a00000d 	beq	8001348 <_malloc_r+0x3dc>
 8001310:	e359000f 	cmp	r9, #15
 8001314:	9a0000b1 	bls	80015e0 <_malloc_r+0x674>
 8001318:	e5940004 	ldr	r0, [r4, #4]
 800131c:	e249200c 	sub	r2, r9, #12
 8001320:	e3c22007 	bic	r2, r2, #7
 8001324:	e2000001 	and	r0, r0, #1
 8001328:	e1820000 	orr	r0, r2, r0
 800132c:	e3a01005 	mov	r1, #5
 8001330:	e352000f 	cmp	r2, #15
 8001334:	e0842002 	add	r2, r4, r2
 8001338:	e5840004 	str	r0, [r4, #4]
 800133c:	e5821004 	str	r1, [r2, #4]
 8001340:	e5821008 	str	r1, [r2, #8]
 8001344:	8a0000c0 	bhi	800164c <_malloc_r+0x6e0>
 8001348:	e59f235c 	ldr	r2, [pc, #860]	; 80016ac <_malloc_r+0x740>
 800134c:	e5921000 	ldr	r1, [r2]
 8001350:	e1530001 	cmp	r3, r1
 8001354:	85823000 	strhi	r3, [r2]
 8001358:	e59f2350 	ldr	r2, [pc, #848]	; 80016b0 <_malloc_r+0x744>
 800135c:	e5921000 	ldr	r1, [r2]
 8001360:	e5974008 	ldr	r4, [r7, #8]
 8001364:	e1530001 	cmp	r3, r1
 8001368:	95943004 	ldrls	r3, [r4, #4]
 800136c:	85941004 	ldrhi	r1, [r4, #4]
 8001370:	85823000 	strhi	r3, [r2]
 8001374:	93c33003 	bicls	r3, r3, #3
 8001378:	83c13003 	bichi	r3, r1, #3
 800137c:	e1550003 	cmp	r5, r3
 8001380:	e0653003 	rsb	r3, r5, r3
 8001384:	8a000001 	bhi	8001390 <_malloc_r+0x424>
 8001388:	e353000f 	cmp	r3, #15
 800138c:	ca000003 	bgt	80013a0 <_malloc_r+0x434>
 8001390:	e1a00006 	mov	r0, r6
 8001394:	eb0000c8 	bl	80016bc <__malloc_unlock>
 8001398:	e3a04000 	mov	r4, #0
 800139c:	eaffff19 	b	8001008 <_malloc_r+0x9c>
 80013a0:	e3852001 	orr	r2, r5, #1
 80013a4:	e3833001 	orr	r3, r3, #1
 80013a8:	e0845005 	add	r5, r4, r5
 80013ac:	e5842004 	str	r2, [r4, #4]
 80013b0:	e1a00006 	mov	r0, r6
 80013b4:	e5875008 	str	r5, [r7, #8]
 80013b8:	e5853004 	str	r3, [r5, #4]
 80013bc:	eb0000be 	bl	80016bc <__malloc_unlock>
 80013c0:	e2844008 	add	r4, r4, #8
 80013c4:	e1a00004 	mov	r0, r4
 80013c8:	e28dd00c 	add	sp, sp, #12
 80013cc:	e8bd4ff0 	pop	{r4, r5, r6, r7, r8, r9, sl, fp, lr}
 80013d0:	e12fff1e 	bx	lr
 80013d4:	e0842002 	add	r2, r4, r2
 80013d8:	e592c004 	ldr	ip, [r2, #4]
 80013dc:	e2841008 	add	r1, r4, #8
 80013e0:	e891000a 	ldm	r1, {r1, r3}
 80013e4:	e38cc001 	orr	ip, ip, #1
 80013e8:	e581300c 	str	r3, [r1, #12]
 80013ec:	e1a00006 	mov	r0, r6
 80013f0:	e5831008 	str	r1, [r3, #8]
 80013f4:	e582c004 	str	ip, [r2, #4]
 80013f8:	eb0000af 	bl	80016bc <__malloc_unlock>
 80013fc:	e2844008 	add	r4, r4, #8
 8001400:	e1a00004 	mov	r0, r4
 8001404:	e28dd00c 	add	sp, sp, #12
 8001408:	e8bd4ff0 	pop	{r4, r5, r6, r7, r8, r9, sl, fp, lr}
 800140c:	e12fff1e 	bx	lr
 8001410:	e35e0014 	cmp	lr, #20
 8001414:	928ee05b 	addls	lr, lr, #91	; 0x5b
 8001418:	91a0108e 	lslls	r1, lr, #1
 800141c:	9affff01 	bls	8001028 <_malloc_r+0xbc>
 8001420:	e35e0054 	cmp	lr, #84	; 0x54
 8001424:	8a000067 	bhi	80015c8 <_malloc_r+0x65c>
 8001428:	e1a0e625 	lsr	lr, r5, #12
 800142c:	e28ee06e 	add	lr, lr, #110	; 0x6e
 8001430:	e1a0108e 	lsl	r1, lr, #1
 8001434:	eafffefb 	b	8001028 <_malloc_r+0xbc>
 8001438:	e1a034a2 	lsr	r3, r2, #9
 800143c:	e3530004 	cmp	r3, #4
 8001440:	9a00003f 	bls	8001544 <_malloc_r+0x5d8>
 8001444:	e3530014 	cmp	r3, #20
 8001448:	9283105b 	addls	r1, r3, #91	; 0x5b
 800144c:	91a00081 	lslls	r0, r1, #1
 8001450:	9a000004 	bls	8001468 <_malloc_r+0x4fc>
 8001454:	e3530054 	cmp	r3, #84	; 0x54
 8001458:	8a000080 	bhi	8001660 <_malloc_r+0x6f4>
 800145c:	e1a01622 	lsr	r1, r2, #12
 8001460:	e281106e 	add	r1, r1, #110	; 0x6e
 8001464:	e1a00081 	lsl	r0, r1, #1
 8001468:	e0870100 	add	r0, r7, r0, lsl #2
 800146c:	e5903008 	ldr	r3, [r0, #8]
 8001470:	e1530000 	cmp	r3, r0
 8001474:	e59fc220 	ldr	ip, [pc, #544]	; 800169c <_malloc_r+0x730>
 8001478:	0a00005d 	beq	80015f4 <_malloc_r+0x688>
 800147c:	e5931004 	ldr	r1, [r3, #4]
 8001480:	e3c11003 	bic	r1, r1, #3
 8001484:	e1520001 	cmp	r2, r1
 8001488:	2a000002 	bcs	8001498 <_malloc_r+0x52c>
 800148c:	e5933008 	ldr	r3, [r3, #8]
 8001490:	e1500003 	cmp	r0, r3
 8001494:	1afffff8 	bne	800147c <_malloc_r+0x510>
 8001498:	e593200c 	ldr	r2, [r3, #12]
 800149c:	e5971004 	ldr	r1, [r7, #4]
 80014a0:	e584200c 	str	r2, [r4, #12]
 80014a4:	e5843008 	str	r3, [r4, #8]
 80014a8:	e5824008 	str	r4, [r2, #8]
 80014ac:	e583400c 	str	r4, [r3, #12]
 80014b0:	eaffff0b 	b	80010e4 <_malloc_r+0x178>
 80014b4:	e385c001 	orr	ip, r5, #1
 80014b8:	e3812001 	orr	r2, r1, #1
 80014bc:	e0845005 	add	r5, r4, r5
 80014c0:	e584c004 	str	ip, [r4, #4]
 80014c4:	e1a00006 	mov	r0, r6
 80014c8:	e5835014 	str	r5, [r3, #20]
 80014cc:	e5835010 	str	r5, [r3, #16]
 80014d0:	e585800c 	str	r8, [r5, #12]
 80014d4:	e9850104 	stmib	r5, {r2, r8}
 80014d8:	e7851001 	str	r1, [r5, r1]
 80014dc:	e2844008 	add	r4, r4, #8
 80014e0:	eb000075 	bl	80016bc <__malloc_unlock>
 80014e4:	eafffec7 	b	8001008 <_malloc_r+0x9c>
 80014e8:	e2899001 	add	r9, r9, #1
 80014ec:	e3190003 	tst	r9, #3
 80014f0:	e28cc008 	add	ip, ip, #8
 80014f4:	1affff0d 	bne	8001130 <_malloc_r+0x1c4>
 80014f8:	ea00001f 	b	800157c <_malloc_r+0x610>
 80014fc:	e2843008 	add	r3, r4, #8
 8001500:	e5944014 	ldr	r4, [r4, #20]
 8001504:	e1530004 	cmp	r3, r4
 8001508:	028ee002 	addeq	lr, lr, #2
 800150c:	0afffed7 	beq	8001070 <_malloc_r+0x104>
 8001510:	eafffeaf 	b	8000fd4 <_malloc_r+0x68>
 8001514:	e0831001 	add	r1, r3, r1
 8001518:	e591c004 	ldr	ip, [r1, #4]
 800151c:	e1a04003 	mov	r4, r3
 8001520:	e5b42008 	ldr	r2, [r4, #8]!
 8001524:	e593300c 	ldr	r3, [r3, #12]
 8001528:	e38cc001 	orr	ip, ip, #1
 800152c:	e581c004 	str	ip, [r1, #4]
 8001530:	e1a00006 	mov	r0, r6
 8001534:	e582300c 	str	r3, [r2, #12]
 8001538:	e5832008 	str	r2, [r3, #8]
 800153c:	eb00005e 	bl	80016bc <__malloc_unlock>
 8001540:	eafffeb0 	b	8001008 <_malloc_r+0x9c>
 8001544:	e1a01322 	lsr	r1, r2, #6
 8001548:	e2811038 	add	r1, r1, #56	; 0x38
 800154c:	e1a00081 	lsl	r0, r1, #1
 8001550:	eaffffc4 	b	8001468 <_malloc_r+0x4fc>
 8001554:	e1540007 	cmp	r4, r7
 8001558:	0affff45 	beq	8001274 <_malloc_r+0x308>
 800155c:	e5974008 	ldr	r4, [r7, #8]
 8001560:	e5943004 	ldr	r3, [r4, #4]
 8001564:	e3c33003 	bic	r3, r3, #3
 8001568:	eaffff83 	b	800137c <_malloc_r+0x410>
 800156c:	e5944000 	ldr	r4, [r4]
 8001570:	e1540003 	cmp	r4, r3
 8001574:	e24ee001 	sub	lr, lr, #1
 8001578:	1a000045 	bne	8001694 <_malloc_r+0x728>
 800157c:	e31e0003 	tst	lr, #3
 8001580:	e2443008 	sub	r3, r4, #8
 8001584:	1afffff8 	bne	800156c <_malloc_r+0x600>
 8001588:	e5973004 	ldr	r3, [r7, #4]
 800158c:	e1c33000 	bic	r3, r3, r0
 8001590:	e5873004 	str	r3, [r7, #4]
 8001594:	e1a00080 	lsl	r0, r0, #1
 8001598:	e1500003 	cmp	r0, r3
 800159c:	8affff14 	bhi	80011f4 <_malloc_r+0x288>
 80015a0:	e3500000 	cmp	r0, #0
 80015a4:	0affff12 	beq	80011f4 <_malloc_r+0x288>
 80015a8:	e1130000 	tst	r3, r0
 80015ac:	e1a0e009 	mov	lr, r9
 80015b0:	1afffedb 	bne	8001124 <_malloc_r+0x1b8>
 80015b4:	e1a00080 	lsl	r0, r0, #1
 80015b8:	e1130000 	tst	r3, r0
 80015bc:	e28ee004 	add	lr, lr, #4
 80015c0:	0afffffb 	beq	80015b4 <_malloc_r+0x648>
 80015c4:	eafffed6 	b	8001124 <_malloc_r+0x1b8>
 80015c8:	e35e0f55 	cmp	lr, #340	; 0x154
 80015cc:	8a00000f 	bhi	8001610 <_malloc_r+0x6a4>
 80015d0:	e1a0e7a5 	lsr	lr, r5, #15
 80015d4:	e28ee077 	add	lr, lr, #119	; 0x77
 80015d8:	e1a0108e 	lsl	r1, lr, #1
 80015dc:	eafffe91 	b	8001028 <_malloc_r+0xbc>
 80015e0:	e3a03001 	mov	r3, #1
 80015e4:	e5883004 	str	r3, [r8, #4]
 80015e8:	e1a04008 	mov	r4, r8
 80015ec:	e3a03000 	mov	r3, #0
 80015f0:	eaffff61 	b	800137c <_malloc_r+0x410>
 80015f4:	e59c2004 	ldr	r2, [ip, #4]
 80015f8:	e1a01141 	asr	r1, r1, #2
 80015fc:	e3a00001 	mov	r0, #1
 8001600:	e1821110 	orr	r1, r2, r0, lsl r1
 8001604:	e1a02003 	mov	r2, r3
 8001608:	e58c1004 	str	r1, [ip, #4]
 800160c:	eaffffa3 	b	80014a0 <_malloc_r+0x534>
 8001610:	e59f309c 	ldr	r3, [pc, #156]	; 80016b4 <_malloc_r+0x748>
 8001614:	e15e0003 	cmp	lr, r3
 8001618:	91a0e925 	lsrls	lr, r5, #18
 800161c:	928ee07c 	addls	lr, lr, #124	; 0x7c
 8001620:	91a0108e 	lslls	r1, lr, #1
 8001624:	83a010fc 	movhi	r1, #252	; 0xfc
 8001628:	83a0e07e 	movhi	lr, #126	; 0x7e
 800162c:	eafffe7d 	b	8001028 <_malloc_r+0xbc>
 8001630:	e1b01a02 	lsls	r1, r2, #20
 8001634:	1affff14 	bne	800128c <_malloc_r+0x320>
 8001638:	e08b1009 	add	r1, fp, r9
 800163c:	e5972008 	ldr	r2, [r7, #8]
 8001640:	e3811001 	orr	r1, r1, #1
 8001644:	e5821004 	str	r1, [r2, #4]
 8001648:	eaffff3e 	b	8001348 <_malloc_r+0x3dc>
 800164c:	e2841008 	add	r1, r4, #8
 8001650:	e1a00006 	mov	r0, r6
 8001654:	eb00006a 	bl	8001804 <_free_r>
 8001658:	e59a3000 	ldr	r3, [sl]
 800165c:	eaffff39 	b	8001348 <_malloc_r+0x3dc>
 8001660:	e3530f55 	cmp	r3, #340	; 0x154
 8001664:	91a017a2 	lsrls	r1, r2, #15
 8001668:	92811077 	addls	r1, r1, #119	; 0x77
 800166c:	91a00081 	lslls	r0, r1, #1
 8001670:	9affff7c 	bls	8001468 <_malloc_r+0x4fc>
 8001674:	e59f1038 	ldr	r1, [pc, #56]	; 80016b4 <_malloc_r+0x748>
 8001678:	e1530001 	cmp	r3, r1
 800167c:	91a01922 	lsrls	r1, r2, #18
 8001680:	9281107c 	addls	r1, r1, #124	; 0x7c
 8001684:	91a00081 	lslls	r0, r1, #1
 8001688:	83a000fc 	movhi	r0, #252	; 0xfc
 800168c:	83a0107e 	movhi	r1, #126	; 0x7e
 8001690:	eaffff74 	b	8001468 <_malloc_r+0x4fc>
 8001694:	e5973004 	ldr	r3, [r7, #4]
 8001698:	eaffffbd 	b	8001594 <_malloc_r+0x628>
 800169c:	2000043c 	.word	0x2000043c
 80016a0:	20000848 	.word	0x20000848
 80016a4:	20000858 	.word	0x20000858
 80016a8:	2000085c 	.word	0x2000085c
 80016ac:	20000854 	.word	0x20000854
 80016b0:	20000850 	.word	0x20000850
 80016b4:	00000554 	.word	0x00000554

080016b8 <__malloc_lock>:
 80016b8:	e12fff1e 	bx	lr

080016bc <__malloc_unlock>:
 80016bc:	e12fff1e 	bx	lr

080016c0 <_sbrk_r>:
 80016c0:	e92d4038 	push	{r3, r4, r5, lr}
 80016c4:	e59f4034 	ldr	r4, [pc, #52]	; 8001700 <_sbrk_r+0x40>
 80016c8:	e3a03000 	mov	r3, #0
 80016cc:	e1a05000 	mov	r5, r0
 80016d0:	e1a00001 	mov	r0, r1
 80016d4:	e5843000 	str	r3, [r4]
 80016d8:	ebfffaaa 	bl	8000188 <_sbrk>
 80016dc:	e3700001 	cmn	r0, #1
 80016e0:	0a000001 	beq	80016ec <_sbrk_r+0x2c>
 80016e4:	e8bd4038 	pop	{r3, r4, r5, lr}
 80016e8:	e12fff1e 	bx	lr
 80016ec:	e5943000 	ldr	r3, [r4]
 80016f0:	e3530000 	cmp	r3, #0
 80016f4:	15853000 	strne	r3, [r5]
 80016f8:	e8bd4038 	pop	{r3, r4, r5, lr}
 80016fc:	e12fff1e 	bx	lr
 8001700:	200013f4 	.word	0x200013f4

08001704 <_malloc_trim_r>:
 8001704:	e92d40f8 	push	{r3, r4, r5, r6, r7, lr}
 8001708:	e59f50e8 	ldr	r5, [pc, #232]	; 80017f8 <_malloc_trim_r+0xf4>
 800170c:	e1a07001 	mov	r7, r1
 8001710:	e1a04000 	mov	r4, r0
 8001714:	ebffffe7 	bl	80016b8 <__malloc_lock>
 8001718:	e5953008 	ldr	r3, [r5, #8]
 800171c:	e5936004 	ldr	r6, [r3, #4]
 8001720:	e3c66003 	bic	r6, r6, #3
 8001724:	e0677006 	rsb	r7, r7, r6
 8001728:	e2877efe 	add	r7, r7, #4064	; 0xfe0
 800172c:	e287700f 	add	r7, r7, #15
 8001730:	e1a07627 	lsr	r7, r7, #12
 8001734:	e2477001 	sub	r7, r7, #1
 8001738:	e1a07607 	lsl	r7, r7, #12
 800173c:	e3570a01 	cmp	r7, #4096	; 0x1000
 8001740:	ba000006 	blt	8001760 <_malloc_trim_r+0x5c>
 8001744:	e1a00004 	mov	r0, r4
 8001748:	e3a01000 	mov	r1, #0
 800174c:	ebffffdb 	bl	80016c0 <_sbrk_r>
 8001750:	e5953008 	ldr	r3, [r5, #8]
 8001754:	e0833006 	add	r3, r3, r6
 8001758:	e1500003 	cmp	r0, r3
 800175c:	0a000004 	beq	8001774 <_malloc_trim_r+0x70>
 8001760:	e1a00004 	mov	r0, r4
 8001764:	ebffffd4 	bl	80016bc <__malloc_unlock>
 8001768:	e3a00000 	mov	r0, #0
 800176c:	e8bd40f8 	pop	{r3, r4, r5, r6, r7, lr}
 8001770:	e12fff1e 	bx	lr
 8001774:	e1a00004 	mov	r0, r4
 8001778:	e2671000 	rsb	r1, r7, #0
 800177c:	ebffffcf 	bl	80016c0 <_sbrk_r>
 8001780:	e3700001 	cmn	r0, #1
 8001784:	0a00000c 	beq	80017bc <_malloc_trim_r+0xb8>
 8001788:	e59f306c 	ldr	r3, [pc, #108]	; 80017fc <_malloc_trim_r+0xf8>
 800178c:	e5951008 	ldr	r1, [r5, #8]
 8001790:	e5932000 	ldr	r2, [r3]
 8001794:	e0676006 	rsb	r6, r7, r6
 8001798:	e3866001 	orr	r6, r6, #1
 800179c:	e1a00004 	mov	r0, r4
 80017a0:	e0677002 	rsb	r7, r7, r2
 80017a4:	e5816004 	str	r6, [r1, #4]
 80017a8:	e5837000 	str	r7, [r3]
 80017ac:	ebffffc2 	bl	80016bc <__malloc_unlock>
 80017b0:	e3a00001 	mov	r0, #1
 80017b4:	e8bd40f8 	pop	{r3, r4, r5, r6, r7, lr}
 80017b8:	e12fff1e 	bx	lr
 80017bc:	e1a00004 	mov	r0, r4
 80017c0:	e3a01000 	mov	r1, #0
 80017c4:	ebffffbd 	bl	80016c0 <_sbrk_r>
 80017c8:	e5953008 	ldr	r3, [r5, #8]
 80017cc:	e0632000 	rsb	r2, r3, r0
 80017d0:	e352000f 	cmp	r2, #15
 80017d4:	daffffe1 	ble	8001760 <_malloc_trim_r+0x5c>
 80017d8:	e59f1020 	ldr	r1, [pc, #32]	; 8001800 <_malloc_trim_r+0xfc>
 80017dc:	e591c000 	ldr	ip, [r1]
 80017e0:	e59f1014 	ldr	r1, [pc, #20]	; 80017fc <_malloc_trim_r+0xf8>
 80017e4:	e3822001 	orr	r2, r2, #1
 80017e8:	e06c0000 	rsb	r0, ip, r0
 80017ec:	e5832004 	str	r2, [r3, #4]
 80017f0:	e5810000 	str	r0, [r1]
 80017f4:	eaffffd9 	b	8001760 <_malloc_trim_r+0x5c>
 80017f8:	2000043c 	.word	0x2000043c
 80017fc:	2000085c 	.word	0x2000085c
 8001800:	20000848 	.word	0x20000848

08001804 <_free_r>:
 8001804:	e92d40f8 	push	{r3, r4, r5, r6, r7, lr}
 8001808:	e2514000 	subs	r4, r1, #0
 800180c:	e1a06000 	mov	r6, r0
 8001810:	0a000046 	beq	8001930 <_free_r+0x12c>
 8001814:	ebffffa7 	bl	80016b8 <__malloc_lock>
 8001818:	e514e004 	ldr	lr, [r4, #-4]
 800181c:	e59f1238 	ldr	r1, [pc, #568]	; 8001a5c <_free_r+0x258>
 8001820:	e3ce3001 	bic	r3, lr, #1
 8001824:	e244c008 	sub	ip, r4, #8
 8001828:	e08c2003 	add	r2, ip, r3
 800182c:	e5910008 	ldr	r0, [r1, #8]
 8001830:	e5925004 	ldr	r5, [r2, #4]
 8001834:	e1500002 	cmp	r0, r2
 8001838:	e3c55003 	bic	r5, r5, #3
 800183c:	0a00004a 	beq	800196c <_free_r+0x168>
 8001840:	e21ee001 	ands	lr, lr, #1
 8001844:	e5825004 	str	r5, [r2, #4]
 8001848:	13a0e000 	movne	lr, #0
 800184c:	1a000009 	bne	8001878 <_free_r+0x74>
 8001850:	e5144008 	ldr	r4, [r4, #-8]
 8001854:	e064c00c 	rsb	ip, r4, ip
 8001858:	e59c0008 	ldr	r0, [ip, #8]
 800185c:	e2817008 	add	r7, r1, #8
 8001860:	e1500007 	cmp	r0, r7
 8001864:	e0833004 	add	r3, r3, r4
 8001868:	159c400c 	ldrne	r4, [ip, #12]
 800186c:	1580400c 	strne	r4, [r0, #12]
 8001870:	15840008 	strne	r0, [r4, #8]
 8001874:	03a0e001 	moveq	lr, #1
 8001878:	e0820005 	add	r0, r2, r5
 800187c:	e5900004 	ldr	r0, [r0, #4]
 8001880:	e3100001 	tst	r0, #1
 8001884:	1a000009 	bne	80018b0 <_free_r+0xac>
 8001888:	e35e0000 	cmp	lr, #0
 800188c:	e5920008 	ldr	r0, [r2, #8]
 8001890:	e0833005 	add	r3, r3, r5
 8001894:	1a000002 	bne	80018a4 <_free_r+0xa0>
 8001898:	e59f41c0 	ldr	r4, [pc, #448]	; 8001a60 <_free_r+0x25c>
 800189c:	e1500004 	cmp	r0, r4
 80018a0:	0a000047 	beq	80019c4 <_free_r+0x1c0>
 80018a4:	e592200c 	ldr	r2, [r2, #12]
 80018a8:	e580200c 	str	r2, [r0, #12]
 80018ac:	e5820008 	str	r0, [r2, #8]
 80018b0:	e3832001 	orr	r2, r3, #1
 80018b4:	e35e0000 	cmp	lr, #0
 80018b8:	e58c2004 	str	r2, [ip, #4]
 80018bc:	e78c3003 	str	r3, [ip, r3]
 80018c0:	1a000018 	bne	8001928 <_free_r+0x124>
 80018c4:	e3530c02 	cmp	r3, #512	; 0x200
 80018c8:	3a00001a 	bcc	8001938 <_free_r+0x134>
 80018cc:	e1a024a3 	lsr	r2, r3, #9
 80018d0:	e3520004 	cmp	r2, #4
 80018d4:	8a000042 	bhi	80019e4 <_free_r+0x1e0>
 80018d8:	e1a0e323 	lsr	lr, r3, #6
 80018dc:	e28ee038 	add	lr, lr, #56	; 0x38
 80018e0:	e1a0008e 	lsl	r0, lr, #1
 80018e4:	e0810100 	add	r0, r1, r0, lsl #2
 80018e8:	e5902008 	ldr	r2, [r0, #8]
 80018ec:	e1520000 	cmp	r2, r0
 80018f0:	e59f1164 	ldr	r1, [pc, #356]	; 8001a5c <_free_r+0x258>
 80018f4:	0a000044 	beq	8001a0c <_free_r+0x208>
 80018f8:	e5921004 	ldr	r1, [r2, #4]
 80018fc:	e3c11003 	bic	r1, r1, #3
 8001900:	e1530001 	cmp	r3, r1
 8001904:	2a000002 	bcs	8001914 <_free_r+0x110>
 8001908:	e5922008 	ldr	r2, [r2, #8]
 800190c:	e1500002 	cmp	r0, r2
 8001910:	1afffff8 	bne	80018f8 <_free_r+0xf4>
 8001914:	e592300c 	ldr	r3, [r2, #12]
 8001918:	e58c300c 	str	r3, [ip, #12]
 800191c:	e58c2008 	str	r2, [ip, #8]
 8001920:	e583c008 	str	ip, [r3, #8]
 8001924:	e582c00c 	str	ip, [r2, #12]
 8001928:	e1a00006 	mov	r0, r6
 800192c:	ebffff62 	bl	80016bc <__malloc_unlock>
 8001930:	e8bd40f8 	pop	{r3, r4, r5, r6, r7, lr}
 8001934:	e12fff1e 	bx	lr
 8001938:	e5912004 	ldr	r2, [r1, #4]
 800193c:	e1a031a3 	lsr	r3, r3, #3
 8001940:	e1a00143 	asr	r0, r3, #2
 8001944:	e3a0e001 	mov	lr, #1
 8001948:	e182001e 	orr	r0, r2, lr, lsl r0
 800194c:	e0813183 	add	r3, r1, r3, lsl #3
 8001950:	e5932008 	ldr	r2, [r3, #8]
 8001954:	e5810004 	str	r0, [r1, #4]
 8001958:	e58c2008 	str	r2, [ip, #8]
 800195c:	e58c300c 	str	r3, [ip, #12]
 8001960:	e583c008 	str	ip, [r3, #8]
 8001964:	e582c00c 	str	ip, [r2, #12]
 8001968:	eaffffee 	b	8001928 <_free_r+0x124>
 800196c:	e31e0001 	tst	lr, #1
 8001970:	e0853003 	add	r3, r5, r3
 8001974:	1a000006 	bne	8001994 <_free_r+0x190>
 8001978:	e5142008 	ldr	r2, [r4, #-8]
 800197c:	e062c00c 	rsb	ip, r2, ip
 8001980:	e59c000c 	ldr	r0, [ip, #12]
 8001984:	e59ce008 	ldr	lr, [ip, #8]
 8001988:	e58e000c 	str	r0, [lr, #12]
 800198c:	e580e008 	str	lr, [r0, #8]
 8001990:	e0833002 	add	r3, r3, r2
 8001994:	e59f20c8 	ldr	r2, [pc, #200]	; 8001a64 <_free_r+0x260>
 8001998:	e5920000 	ldr	r0, [r2]
 800199c:	e3832001 	orr	r2, r3, #1
 80019a0:	e1530000 	cmp	r3, r0
 80019a4:	e58c2004 	str	r2, [ip, #4]
 80019a8:	e581c008 	str	ip, [r1, #8]
 80019ac:	3affffdd 	bcc	8001928 <_free_r+0x124>
 80019b0:	e59f30b0 	ldr	r3, [pc, #176]	; 8001a68 <_free_r+0x264>
 80019b4:	e1a00006 	mov	r0, r6
 80019b8:	e5931000 	ldr	r1, [r3]
 80019bc:	ebffff50 	bl	8001704 <_malloc_trim_r>
 80019c0:	eaffffd8 	b	8001928 <_free_r+0x124>
 80019c4:	e3832001 	orr	r2, r3, #1
 80019c8:	e581c014 	str	ip, [r1, #20]
 80019cc:	e581c010 	str	ip, [r1, #16]
 80019d0:	e58c000c 	str	r0, [ip, #12]
 80019d4:	e58c0008 	str	r0, [ip, #8]
 80019d8:	e58c2004 	str	r2, [ip, #4]
 80019dc:	e78c3003 	str	r3, [ip, r3]
 80019e0:	eaffffd0 	b	8001928 <_free_r+0x124>
 80019e4:	e3520014 	cmp	r2, #20
 80019e8:	9282e05b 	addls	lr, r2, #91	; 0x5b
 80019ec:	91a0008e 	lslls	r0, lr, #1
 80019f0:	9affffbb 	bls	80018e4 <_free_r+0xe0>
 80019f4:	e3520054 	cmp	r2, #84	; 0x54
 80019f8:	8a00000a 	bhi	8001a28 <_free_r+0x224>
 80019fc:	e1a0e623 	lsr	lr, r3, #12
 8001a00:	e28ee06e 	add	lr, lr, #110	; 0x6e
 8001a04:	e1a0008e 	lsl	r0, lr, #1
 8001a08:	eaffffb5 	b	80018e4 <_free_r+0xe0>
 8001a0c:	e5913004 	ldr	r3, [r1, #4]
 8001a10:	e1a0e14e 	asr	lr, lr, #2
 8001a14:	e3a00001 	mov	r0, #1
 8001a18:	e1830e10 	orr	r0, r3, r0, lsl lr
 8001a1c:	e1a03002 	mov	r3, r2
 8001a20:	e5810004 	str	r0, [r1, #4]
 8001a24:	eaffffbb 	b	8001918 <_free_r+0x114>
 8001a28:	e3520f55 	cmp	r2, #340	; 0x154
 8001a2c:	91a0e7a3 	lsrls	lr, r3, #15
 8001a30:	928ee077 	addls	lr, lr, #119	; 0x77
 8001a34:	91a0008e 	lslls	r0, lr, #1
 8001a38:	9affffa9 	bls	80018e4 <_free_r+0xe0>
 8001a3c:	e59f0028 	ldr	r0, [pc, #40]	; 8001a6c <_free_r+0x268>
 8001a40:	e1520000 	cmp	r2, r0
 8001a44:	91a0e923 	lsrls	lr, r3, #18
 8001a48:	928ee07c 	addls	lr, lr, #124	; 0x7c
 8001a4c:	91a0008e 	lslls	r0, lr, #1
 8001a50:	83a000fc 	movhi	r0, #252	; 0xfc
 8001a54:	83a0e07e 	movhi	lr, #126	; 0x7e
 8001a58:	eaffffa1 	b	80018e4 <_free_r+0xe0>
 8001a5c:	2000043c 	.word	0x2000043c
 8001a60:	20000444 	.word	0x20000444
 8001a64:	20000844 	.word	0x20000844
 8001a68:	20000858 	.word	0x20000858
 8001a6c:	00000554 	.word	0x00000554

08001a70 <_init>:
 8001a70:	e1a0c00d 	mov	ip, sp
 8001a74:	e92ddff8 	push	{r3, r4, r5, r6, r7, r8, r9, sl, fp, ip, lr, pc}
 8001a78:	e24cb004 	sub	fp, ip, #4
 8001a7c:	e24bd028 	sub	sp, fp, #40	; 0x28
 8001a80:	e89d6ff0 	ldm	sp, {r4, r5, r6, r7, r8, r9, sl, fp, sp, lr}
 8001a84:	e12fff1e 	bx	lr

08001a88 <_fini>:
 8001a88:	e1a0c00d 	mov	ip, sp
 8001a8c:	e92ddff8 	push	{r3, r4, r5, r6, r7, r8, r9, sl, fp, ip, lr, pc}
 8001a90:	e24cb004 	sub	fp, ip, #4
 8001a94:	e24bd028 	sub	sp, fp, #40	; 0x28
 8001a98:	e89d6ff0 	ldm	sp, {r4, r5, r6, r7, r8, r9, sl, fp, sp, lr}
 8001a9c:	e12fff1e 	bx	lr
 8001aa0:	00000043 	.word	0x00000043
 8001aa4:	69647473 	.word	0x69647473
 8001aa8:	6e69206f 	.word	0x6e69206f
 8001aac:	64207469 	.word	0x64207469
 8001ab0:	0a656e6f 	.word	0x0a656e6f
 8001ab4:	00          	.byte	0x00
 8001ab5:	61          	.byte	0x61
 8001ab6:	6f6e      	.short	0x6f6e
 8001ab8:	72656874 	.word	0x72656874
 8001abc:	69686320 	.word	0x69686320
 8001ac0:	7420646c 	.word	0x7420646c
 8001ac4:	61657268 	.word	0x61657268
 8001ac8:	72202c64 	.word	0x72202c64
 8001acc:	25207365 	.word	0x25207365
 8001ad0:	74000a75 	.word	0x74000a75
 8001ad4:	61657268 	.word	0x61657268
 8001ad8:	0a312064 	.word	0x0a312064
 8001adc:	65726300 	.word	0x65726300
 8001ae0:	6e697461 	.word	0x6e697461
 8001ae4:	68632067 	.word	0x68632067
 8001ae8:	20646c69 	.word	0x20646c69
 8001aec:	65726874 	.word	0x65726874
 8001af0:	000a6461 	.word	0x000a6461
 8001af4:	65726874 	.word	0x65726874
 8001af8:	63206461 	.word	0x63206461
 8001afc:	74616572 	.word	0x74616572
 8001b00:	20676e69 	.word	0x20676e69
 8001b04:	6f727265 	.word	0x6f727265
 8001b08:	77000a72 	.word	0x77000a72
 8001b0c:	69746961 	.word	0x69746961
 8001b10:	6620676e 	.word	0x6620676e
 8001b14:	7420726f 	.word	0x7420726f
 8001b18:	61657268 	.word	0x61657268
 8001b1c:	75252064 	.word	0x75252064
 8001b20:	6e6f6420 	.word	0x6e6f6420
 8001b24:	70000a65 	.word	0x70000a65
 8001b28:	6f697265 	.word	0x6f697265
 8001b2c:	20636964 	.word	0x20636964
 8001b30:	65726874 	.word	0x65726874
 8001b34:	000a6461 	.word	0x000a6461
 8001b38:	6c65770a 	.word	0x6c65770a
 8001b3c:	656d6f63 	.word	0x656d6f63
 8001b40:	206f7420 	.word	0x206f7420
 8001b44:	757a7553 	.word	0x757a7553
 8001b48:	534f6168 	.word	0x534f6168
 8001b4c:	5e5f5e20 	.word	0x5e5f5e20
 8001b50:	322e3220 	.word	0x322e3220
 8001b54:	420a302e 	.word	0x420a302e
 8001b58:	444c4955 	.word	0x444c4955
 8001b5c:	67754120 	.word	0x67754120
 8001b60:	20352020 	.word	0x20352020
 8001b64:	35313032 	.word	0x35313032
 8001b68:	3a383020 	.word	0x3a383020
 8001b6c:	353a3732 	.word	0x353a3732
 8001b70:	4f000a37 	.word	0x4f000a37
 8001b74:	6d000a4b 	.word	0x6d000a4b
 8001b78:	206e6961 	.word	0x206e6961
 8001b7c:	65726874 	.word	0x65726874
 8001b80:	69206461 	.word	0x69206461
 8001b84:	2c656c64 	.word	0x2c656c64
 8001b88:	74707520 	.word	0x74707520
 8001b8c:	20656d69 	.word	0x20656d69
 8001b90:	000a7525 	.word	0x000a7525

08001b94 <__EH_FRAME_BEGIN__>:
 8001b94:	00000000                                ....
