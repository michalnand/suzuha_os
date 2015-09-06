
bin/main.elf:     file format elf32-littlearm


Disassembly of section .text:

08000188 <main>:
 8000188:	b508      	push	{r3, lr}
 800018a:	f000 fbad 	bl	80008e8 <lib_low_level_init>
 800018e:	f000 f935 	bl	80003fc <lib_os_init>
 8000192:	4905      	ldr	r1, [pc, #20]	; (80001a8 <main+0x20>)
 8000194:	4805      	ldr	r0, [pc, #20]	; (80001ac <main+0x24>)
 8000196:	f44f 7200 	mov.w	r2, #512	; 0x200
 800019a:	2308      	movs	r3, #8
 800019c:	f000 f88a 	bl	80002b4 <create_thread>
 80001a0:	f000 f882 	bl	80002a8 <kernel_start>
 80001a4:	2000      	movs	r0, #0
 80001a6:	bd08      	pop	{r3, pc}
 80001a8:	20000210 	.word	0x20000210
 80001ac:	08000719 	.word	0x08000719

080001b0 <thread_ending>:
 80001b0:	b672      	cpsid	i
 80001b2:	4b05      	ldr	r3, [pc, #20]	; (80001c8 <thread_ending+0x18>)
 80001b4:	4a05      	ldr	r2, [pc, #20]	; (80001cc <thread_ending+0x1c>)
 80001b6:	681b      	ldr	r3, [r3, #0]
 80001b8:	210c      	movs	r1, #12
 80001ba:	fb01 2303 	mla	r3, r1, r3, r2
 80001be:	2200      	movs	r2, #0
 80001c0:	605a      	str	r2, [r3, #4]
 80001c2:	b662      	cpsie	i
 80001c4:	bf00      	nop
 80001c6:	e7fd      	b.n	80001c4 <thread_ending+0x14>
 80001c8:	20000470 	.word	0x20000470
 80001cc:	20000410 	.word	0x20000410

080001d0 <null_thread>:
 80001d0:	b508      	push	{r3, lr}
 80001d2:	f000 fd09 	bl	8000be8 <sleep>
 80001d6:	e7fc      	b.n	80001d2 <null_thread+0x2>

080001d8 <scheduler>:
 80001d8:	b570      	push	{r4, r5, r6, lr}
 80001da:	2200      	movs	r2, #0
 80001dc:	4611      	mov	r1, r2
 80001de:	4b15      	ldr	r3, [pc, #84]	; (8000234 <scheduler+0x5c>)
 80001e0:	200c      	movs	r0, #12
 80001e2:	fb00 f501 	mul.w	r5, r0, r1
 80001e6:	195e      	adds	r6, r3, r5
 80001e8:	6874      	ldr	r4, [r6, #4]
 80001ea:	f014 0f02 	tst.w	r4, #2
 80001ee:	461c      	mov	r4, r3
 80001f0:	d10a      	bne.n	8000208 <scheduler+0x30>
 80001f2:	6876      	ldr	r6, [r6, #4]
 80001f4:	07f6      	lsls	r6, r6, #31
 80001f6:	d507      	bpl.n	8000208 <scheduler+0x30>
 80001f8:	4350      	muls	r0, r2
 80001fa:	5b5d      	ldrh	r5, [r3, r5]
 80001fc:	5a18      	ldrh	r0, [r3, r0]
 80001fe:	b2ad      	uxth	r5, r5
 8000200:	b280      	uxth	r0, r0
 8000202:	4285      	cmp	r5, r0
 8000204:	bf38      	it	cc
 8000206:	460a      	movcc	r2, r1
 8000208:	200c      	movs	r0, #12
 800020a:	4348      	muls	r0, r1
 800020c:	5a1d      	ldrh	r5, [r3, r0]
 800020e:	b2ad      	uxth	r5, r5
 8000210:	b125      	cbz	r5, 800021c <scheduler+0x44>
 8000212:	5a1d      	ldrh	r5, [r3, r0]
 8000214:	b2ad      	uxth	r5, r5
 8000216:	3d01      	subs	r5, #1
 8000218:	b2ad      	uxth	r5, r5
 800021a:	521d      	strh	r5, [r3, r0]
 800021c:	3101      	adds	r1, #1
 800021e:	2908      	cmp	r1, #8
 8000220:	d1dd      	bne.n	80001de <scheduler+0x6>
 8000222:	230c      	movs	r3, #12
 8000224:	4353      	muls	r3, r2
 8000226:	18e1      	adds	r1, r4, r3
 8000228:	8849      	ldrh	r1, [r1, #2]
 800022a:	b289      	uxth	r1, r1
 800022c:	52e1      	strh	r1, [r4, r3]
 800022e:	4b02      	ldr	r3, [pc, #8]	; (8000238 <scheduler+0x60>)
 8000230:	601a      	str	r2, [r3, #0]
 8000232:	bd70      	pop	{r4, r5, r6, pc}
 8000234:	20000410 	.word	0x20000410
 8000238:	20000470 	.word	0x20000470

0800023c <SysTick_Handler>:
 800023c:	e92d 0ff0 	stmdb	sp!, {r4, r5, r6, r7, r8, r9, sl, fp}
 8000240:	f3ef 8208 	mrs	r2, MSP
 8000244:	4c0d      	ldr	r4, [pc, #52]	; (800027c <SysTick_Handler+0x40>)
 8000246:	4d0e      	ldr	r5, [pc, #56]	; (8000280 <SysTick_Handler+0x44>)
 8000248:	6823      	ldr	r3, [r4, #0]
 800024a:	3301      	adds	r3, #1
 800024c:	d005      	beq.n	800025a <SysTick_Handler+0x1e>
 800024e:	6823      	ldr	r3, [r4, #0]
 8000250:	210c      	movs	r1, #12
 8000252:	fb01 5303 	mla	r3, r1, r3, r5
 8000256:	609a      	str	r2, [r3, #8]
 8000258:	e001      	b.n	800025e <SysTick_Handler+0x22>
 800025a:	2300      	movs	r3, #0
 800025c:	6023      	str	r3, [r4, #0]
 800025e:	f7ff ffbb 	bl	80001d8 <scheduler>
 8000262:	6823      	ldr	r3, [r4, #0]
 8000264:	220c      	movs	r2, #12
 8000266:	fb02 5503 	mla	r5, r2, r3, r5
 800026a:	f06f 0306 	mvn.w	r3, #6
 800026e:	68aa      	ldr	r2, [r5, #8]
 8000270:	469e      	mov	lr, r3
 8000272:	f382 8808 	msr	MSP, r2
 8000276:	e8bd 0ff0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, fp}
 800027a:	4770      	bx	lr
 800027c:	20000470 	.word	0x20000470
 8000280:	20000410 	.word	0x20000410

08000284 <sched_off>:
 8000284:	b672      	cpsid	i
 8000286:	4770      	bx	lr

08000288 <sched_on>:
 8000288:	b662      	cpsie	i
 800028a:	4770      	bx	lr

0800028c <yield>:
 800028c:	bf00      	nop
 800028e:	4770      	bx	lr

08000290 <get_thread_id>:
 8000290:	b082      	sub	sp, #8
 8000292:	b672      	cpsid	i
 8000294:	4b03      	ldr	r3, [pc, #12]	; (80002a4 <get_thread_id+0x14>)
 8000296:	681b      	ldr	r3, [r3, #0]
 8000298:	9301      	str	r3, [sp, #4]
 800029a:	b662      	cpsie	i
 800029c:	9801      	ldr	r0, [sp, #4]
 800029e:	b002      	add	sp, #8
 80002a0:	4770      	bx	lr
 80002a2:	bf00      	nop
 80002a4:	20000470 	.word	0x20000470

080002a8 <kernel_start>:
 80002a8:	b508      	push	{r3, lr}
 80002aa:	f000 fc8b 	bl	8000bc4 <sys_tick_init>
 80002ae:	bf00      	nop
 80002b0:	e7fd      	b.n	80002ae <kernel_start+0x6>
	...

080002b4 <create_thread>:
 80002b4:	f022 0203 	bic.w	r2, r2, #3
 80002b8:	3a40      	subs	r2, #64	; 0x40
 80002ba:	e92d 43f0 	stmdb	sp!, {r4, r5, r6, r7, r8, r9, lr}
 80002be:	eb01 0c02 	add.w	ip, r1, r2
 80002c2:	f102 0834 	add.w	r8, r2, #52	; 0x34
 80002c6:	f102 0938 	add.w	r9, r2, #56	; 0x38
 80002ca:	323c      	adds	r2, #60	; 0x3c
 80002cc:	4488      	add	r8, r1
 80002ce:	4489      	add	r9, r1
 80002d0:	4607      	mov	r7, r0
 80002d2:	4411      	add	r1, r2
 80002d4:	2200      	movs	r2, #0
 80002d6:	b672      	cpsid	i
 80002d8:	4e11      	ldr	r6, [pc, #68]	; (8000320 <create_thread+0x6c>)
 80002da:	250c      	movs	r5, #12
 80002dc:	4355      	muls	r5, r2
 80002de:	1974      	adds	r4, r6, r5
 80002e0:	6860      	ldr	r0, [r4, #4]
 80002e2:	07c0      	lsls	r0, r0, #31
 80002e4:	d412      	bmi.n	800030c <create_thread+0x58>
 80002e6:	480f      	ldr	r0, [pc, #60]	; (8000324 <create_thread+0x70>)
 80002e8:	f8c4 c008 	str.w	ip, [r4, #8]
 80002ec:	f8c8 0000 	str.w	r0, [r8]
 80002f0:	f04f 5004 	mov.w	r0, #553648128	; 0x21000000
 80002f4:	f8c9 7000 	str.w	r7, [r9]
 80002f8:	2b07      	cmp	r3, #7
 80002fa:	bf98      	it	ls
 80002fc:	2308      	movls	r3, #8
 80002fe:	6008      	str	r0, [r1, #0]
 8000300:	2001      	movs	r0, #1
 8000302:	8063      	strh	r3, [r4, #2]
 8000304:	5373      	strh	r3, [r6, r5]
 8000306:	6060      	str	r0, [r4, #4]
 8000308:	4610      	mov	r0, r2
 800030a:	e000      	b.n	800030e <create_thread+0x5a>
 800030c:	2008      	movs	r0, #8
 800030e:	b662      	cpsie	i
 8000310:	3201      	adds	r2, #1
 8000312:	2a08      	cmp	r2, #8
 8000314:	d001      	beq.n	800031a <create_thread+0x66>
 8000316:	2808      	cmp	r0, #8
 8000318:	d0dd      	beq.n	80002d6 <create_thread+0x22>
 800031a:	e8bd 83f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, pc}
 800031e:	bf00      	nop
 8000320:	20000410 	.word	0x20000410
 8000324:	080001b1 	.word	0x080001b1

08000328 <kernel_init>:
 8000328:	b510      	push	{r4, lr}
 800032a:	2300      	movs	r3, #0
 800032c:	490b      	ldr	r1, [pc, #44]	; (800035c <kernel_init+0x34>)
 800032e:	220c      	movs	r2, #12
 8000330:	435a      	muls	r2, r3
 8000332:	188c      	adds	r4, r1, r2
 8000334:	2000      	movs	r0, #0
 8000336:	6060      	str	r0, [r4, #4]
 8000338:	3301      	adds	r3, #1
 800033a:	2008      	movs	r0, #8
 800033c:	4283      	cmp	r3, r0
 800033e:	8060      	strh	r0, [r4, #2]
 8000340:	5288      	strh	r0, [r1, r2]
 8000342:	d1f3      	bne.n	800032c <kernel_init+0x4>
 8000344:	4b06      	ldr	r3, [pc, #24]	; (8000360 <kernel_init+0x38>)
 8000346:	4807      	ldr	r0, [pc, #28]	; (8000364 <kernel_init+0x3c>)
 8000348:	4907      	ldr	r1, [pc, #28]	; (8000368 <kernel_init+0x40>)
 800034a:	f04f 32ff 	mov.w	r2, #4294967295
 800034e:	601a      	str	r2, [r3, #0]
 8000350:	e8bd 4010 	ldmia.w	sp!, {r4, lr}
 8000354:	2280      	movs	r2, #128	; 0x80
 8000356:	23ff      	movs	r3, #255	; 0xff
 8000358:	f7ff bfac 	b.w	80002b4 <create_thread>
 800035c:	20000410 	.word	0x20000410
 8000360:	20000470 	.word	0x20000470
 8000364:	080001d1 	.word	0x080001d1
 8000368:	20000474 	.word	0x20000474

0800036c <set_wait_state>:
 800036c:	b507      	push	{r0, r1, r2, lr}
 800036e:	f7ff ff8f 	bl	8000290 <get_thread_id>
 8000372:	9000      	str	r0, [sp, #0]
 8000374:	b672      	cpsid	i
 8000376:	4b0d      	ldr	r3, [pc, #52]	; (80003ac <set_wait_state+0x40>)
 8000378:	9a00      	ldr	r2, [sp, #0]
 800037a:	210c      	movs	r1, #12
 800037c:	fb01 3202 	mla	r2, r1, r2, r3
 8000380:	6851      	ldr	r1, [r2, #4]
 8000382:	f041 0102 	orr.w	r1, r1, #2
 8000386:	6051      	str	r1, [r2, #4]
 8000388:	b672      	cpsid	i
 800038a:	9a00      	ldr	r2, [sp, #0]
 800038c:	210c      	movs	r1, #12
 800038e:	fb01 3202 	mla	r2, r1, r2, r3
 8000392:	6852      	ldr	r2, [r2, #4]
 8000394:	9201      	str	r2, [sp, #4]
 8000396:	b662      	cpsie	i
 8000398:	9a01      	ldr	r2, [sp, #4]
 800039a:	0791      	lsls	r1, r2, #30
 800039c:	d500      	bpl.n	80003a0 <set_wait_state+0x34>
 800039e:	bf00      	nop
 80003a0:	9a01      	ldr	r2, [sp, #4]
 80003a2:	0792      	lsls	r2, r2, #30
 80003a4:	d4f0      	bmi.n	8000388 <set_wait_state+0x1c>
 80003a6:	b003      	add	sp, #12
 80003a8:	f85d fb04 	ldr.w	pc, [sp], #4
 80003ac:	20000410 	.word	0x20000410

080003b0 <wake_up_threads>:
 80003b0:	2300      	movs	r3, #0
 80003b2:	b672      	cpsid	i
 80003b4:	4a06      	ldr	r2, [pc, #24]	; (80003d0 <wake_up_threads+0x20>)
 80003b6:	210c      	movs	r1, #12
 80003b8:	fb01 2203 	mla	r2, r1, r3, r2
 80003bc:	6851      	ldr	r1, [r2, #4]
 80003be:	f021 0102 	bic.w	r1, r1, #2
 80003c2:	6051      	str	r1, [r2, #4]
 80003c4:	b662      	cpsie	i
 80003c6:	3301      	adds	r3, #1
 80003c8:	2b08      	cmp	r3, #8
 80003ca:	d1f2      	bne.n	80003b2 <wake_up_threads+0x2>
 80003cc:	4770      	bx	lr
 80003ce:	bf00      	nop
 80003d0:	20000410 	.word	0x20000410

080003d4 <join>:
 80003d4:	b082      	sub	sp, #8
 80003d6:	9001      	str	r0, [sp, #4]
 80003d8:	bf00      	nop
 80003da:	b672      	cpsid	i
 80003dc:	4a06      	ldr	r2, [pc, #24]	; (80003f8 <join+0x24>)
 80003de:	9b01      	ldr	r3, [sp, #4]
 80003e0:	210c      	movs	r1, #12
 80003e2:	fb01 2303 	mla	r3, r1, r3, r2
 80003e6:	685b      	ldr	r3, [r3, #4]
 80003e8:	9300      	str	r3, [sp, #0]
 80003ea:	b662      	cpsie	i
 80003ec:	9b00      	ldr	r3, [sp, #0]
 80003ee:	07d8      	lsls	r0, r3, #31
 80003f0:	d4f2      	bmi.n	80003d8 <join+0x4>
 80003f2:	b002      	add	sp, #8
 80003f4:	4770      	bx	lr
 80003f6:	bf00      	nop
 80003f8:	20000410 	.word	0x20000410

080003fc <lib_os_init>:
 80003fc:	b508      	push	{r3, lr}
 80003fe:	f7ff ff93 	bl	8000328 <kernel_init>
 8000402:	f000 f8f9 	bl	80005f8 <messages_init>
 8000406:	e8bd 4008 	ldmia.w	sp!, {r3, lr}
 800040a:	f000 b8cd 	b.w	80005a8 <stdio_init>
	...

08000410 <putc_>:
 8000410:	b538      	push	{r3, r4, r5, lr}
 8000412:	4c06      	ldr	r4, [pc, #24]	; (800042c <putc_+0x1c>)
 8000414:	4605      	mov	r5, r0
 8000416:	4620      	mov	r0, r4
 8000418:	f000 f912 	bl	8000640 <mutex_lock>
 800041c:	4628      	mov	r0, r5
 800041e:	f000 f9af 	bl	8000780 <uart_write>
 8000422:	4620      	mov	r0, r4
 8000424:	e8bd 4038 	ldmia.w	sp!, {r3, r4, r5, lr}
 8000428:	f000 b926 	b.w	8000678 <mutex_unlock>
 800042c:	200004f4 	.word	0x200004f4

08000430 <puts_>:
 8000430:	b510      	push	{r4, lr}
 8000432:	4604      	mov	r4, r0
 8000434:	4807      	ldr	r0, [pc, #28]	; (8000454 <puts_+0x24>)
 8000436:	f000 f903 	bl	8000640 <mutex_lock>
 800043a:	3c01      	subs	r4, #1
 800043c:	f814 0f01 	ldrb.w	r0, [r4, #1]!
 8000440:	b110      	cbz	r0, 8000448 <puts_+0x18>
 8000442:	f7ff ffe5 	bl	8000410 <putc_>
 8000446:	e7f9      	b.n	800043c <puts_+0xc>
 8000448:	4802      	ldr	r0, [pc, #8]	; (8000454 <puts_+0x24>)
 800044a:	e8bd 4010 	ldmia.w	sp!, {r4, lr}
 800044e:	f000 b913 	b.w	8000678 <mutex_unlock>
 8000452:	bf00      	nop
 8000454:	20000500 	.word	0x20000500

08000458 <puti_>:
 8000458:	b530      	push	{r4, r5, lr}
 800045a:	b085      	sub	sp, #20
 800045c:	1e03      	subs	r3, r0, #0
 800045e:	f04f 0200 	mov.w	r2, #0
 8000462:	bfa8      	it	ge
 8000464:	4614      	movge	r4, r2
 8000466:	f88d 200f 	strb.w	r2, [sp, #15]
 800046a:	bfbc      	itt	lt
 800046c:	425b      	neglt	r3, r3
 800046e:	2401      	movlt	r4, #1
 8000470:	220a      	movs	r2, #10
 8000472:	210a      	movs	r1, #10
 8000474:	fb93 f5f1 	sdiv	r5, r3, r1
 8000478:	fb01 3315 	mls	r3, r1, r5, r3
 800047c:	a801      	add	r0, sp, #4
 800047e:	3330      	adds	r3, #48	; 0x30
 8000480:	5413      	strb	r3, [r2, r0]
 8000482:	1e51      	subs	r1, r2, #1
 8000484:	462b      	mov	r3, r5
 8000486:	b10d      	cbz	r5, 800048c <puti_+0x34>
 8000488:	460a      	mov	r2, r1
 800048a:	e7f2      	b.n	8000472 <puti_+0x1a>
 800048c:	b12c      	cbz	r4, 800049a <puti_+0x42>
 800048e:	ab04      	add	r3, sp, #16
 8000490:	440b      	add	r3, r1
 8000492:	222d      	movs	r2, #45	; 0x2d
 8000494:	f803 2c0c 	strb.w	r2, [r3, #-12]
 8000498:	460a      	mov	r2, r1
 800049a:	4410      	add	r0, r2
 800049c:	f7ff ffc8 	bl	8000430 <puts_>
 80004a0:	b005      	add	sp, #20
 80004a2:	bd30      	pop	{r4, r5, pc}

080004a4 <putui_>:
 80004a4:	b51f      	push	{r0, r1, r2, r3, r4, lr}
 80004a6:	2300      	movs	r3, #0
 80004a8:	f88d 300f 	strb.w	r3, [sp, #15]
 80004ac:	230a      	movs	r3, #10
 80004ae:	240a      	movs	r4, #10
 80004b0:	fbb0 f1f4 	udiv	r1, r0, r4
 80004b4:	fb04 0011 	mls	r0, r4, r1, r0
 80004b8:	aa01      	add	r2, sp, #4
 80004ba:	3030      	adds	r0, #48	; 0x30
 80004bc:	5498      	strb	r0, [r3, r2]
 80004be:	1e5c      	subs	r4, r3, #1
 80004c0:	4608      	mov	r0, r1
 80004c2:	b109      	cbz	r1, 80004c8 <putui_+0x24>
 80004c4:	4623      	mov	r3, r4
 80004c6:	e7f2      	b.n	80004ae <putui_+0xa>
 80004c8:	18d0      	adds	r0, r2, r3
 80004ca:	f7ff ffb1 	bl	8000430 <puts_>
 80004ce:	b004      	add	sp, #16
 80004d0:	bd10      	pop	{r4, pc}

080004d2 <putx_>:
 80004d2:	b51f      	push	{r0, r1, r2, r3, r4, lr}
 80004d4:	2300      	movs	r3, #0
 80004d6:	f88d 300f 	strb.w	r3, [sp, #15]
 80004da:	230a      	movs	r3, #10
 80004dc:	f000 010f 	and.w	r1, r0, #15
 80004e0:	2909      	cmp	r1, #9
 80004e2:	aa01      	add	r2, sp, #4
 80004e4:	bf94      	ite	ls
 80004e6:	3130      	addls	r1, #48	; 0x30
 80004e8:	3157      	addhi	r1, #87	; 0x57
 80004ea:	0900      	lsrs	r0, r0, #4
 80004ec:	54d1      	strb	r1, [r2, r3]
 80004ee:	f103 31ff 	add.w	r1, r3, #4294967295
 80004f2:	d001      	beq.n	80004f8 <putx_+0x26>
 80004f4:	460b      	mov	r3, r1
 80004f6:	e7f1      	b.n	80004dc <putx_+0xa>
 80004f8:	18d0      	adds	r0, r2, r3
 80004fa:	f7ff ff99 	bl	8000430 <puts_>
 80004fe:	b005      	add	sp, #20
 8000500:	f85d fb04 	ldr.w	pc, [sp], #4

08000504 <printf_>:
 8000504:	b40f      	push	{r0, r1, r2, r3}
 8000506:	b537      	push	{r0, r1, r2, r4, r5, lr}
 8000508:	ac06      	add	r4, sp, #24
 800050a:	4826      	ldr	r0, [pc, #152]	; (80005a4 <printf_+0xa0>)
 800050c:	f854 5b04 	ldr.w	r5, [r4], #4
 8000510:	f000 f896 	bl	8000640 <mutex_lock>
 8000514:	9401      	str	r4, [sp, #4]
 8000516:	2400      	movs	r4, #0
 8000518:	5d28      	ldrb	r0, [r5, r4]
 800051a:	2800      	cmp	r0, #0
 800051c:	d039      	beq.n	8000592 <printf_+0x8e>
 800051e:	2825      	cmp	r0, #37	; 0x25
 8000520:	d003      	beq.n	800052a <printf_+0x26>
 8000522:	f7ff ff75 	bl	8000410 <putc_>
 8000526:	3401      	adds	r4, #1
 8000528:	e7f6      	b.n	8000518 <printf_+0x14>
 800052a:	192b      	adds	r3, r5, r4
 800052c:	7858      	ldrb	r0, [r3, #1]
 800052e:	2869      	cmp	r0, #105	; 0x69
 8000530:	d016      	beq.n	8000560 <printf_+0x5c>
 8000532:	d808      	bhi.n	8000546 <printf_+0x42>
 8000534:	2825      	cmp	r0, #37	; 0x25
 8000536:	d028      	beq.n	800058a <printf_+0x86>
 8000538:	2863      	cmp	r0, #99	; 0x63
 800053a:	d128      	bne.n	800058e <printf_+0x8a>
 800053c:	9b01      	ldr	r3, [sp, #4]
 800053e:	1d1a      	adds	r2, r3, #4
 8000540:	9201      	str	r2, [sp, #4]
 8000542:	7818      	ldrb	r0, [r3, #0]
 8000544:	e021      	b.n	800058a <printf_+0x86>
 8000546:	2875      	cmp	r0, #117	; 0x75
 8000548:	d011      	beq.n	800056e <printf_+0x6a>
 800054a:	2878      	cmp	r0, #120	; 0x78
 800054c:	d016      	beq.n	800057c <printf_+0x78>
 800054e:	2873      	cmp	r0, #115	; 0x73
 8000550:	d11d      	bne.n	800058e <printf_+0x8a>
 8000552:	9b01      	ldr	r3, [sp, #4]
 8000554:	1d1a      	adds	r2, r3, #4
 8000556:	6818      	ldr	r0, [r3, #0]
 8000558:	9201      	str	r2, [sp, #4]
 800055a:	f7ff ff69 	bl	8000430 <puts_>
 800055e:	e016      	b.n	800058e <printf_+0x8a>
 8000560:	9b01      	ldr	r3, [sp, #4]
 8000562:	1d1a      	adds	r2, r3, #4
 8000564:	6818      	ldr	r0, [r3, #0]
 8000566:	9201      	str	r2, [sp, #4]
 8000568:	f7ff ff76 	bl	8000458 <puti_>
 800056c:	e00f      	b.n	800058e <printf_+0x8a>
 800056e:	9b01      	ldr	r3, [sp, #4]
 8000570:	1d1a      	adds	r2, r3, #4
 8000572:	6818      	ldr	r0, [r3, #0]
 8000574:	9201      	str	r2, [sp, #4]
 8000576:	f7ff ff95 	bl	80004a4 <putui_>
 800057a:	e008      	b.n	800058e <printf_+0x8a>
 800057c:	9b01      	ldr	r3, [sp, #4]
 800057e:	1d1a      	adds	r2, r3, #4
 8000580:	6818      	ldr	r0, [r3, #0]
 8000582:	9201      	str	r2, [sp, #4]
 8000584:	f7ff ffa5 	bl	80004d2 <putx_>
 8000588:	e001      	b.n	800058e <printf_+0x8a>
 800058a:	f7ff ff41 	bl	8000410 <putc_>
 800058e:	3402      	adds	r4, #2
 8000590:	e7c2      	b.n	8000518 <printf_+0x14>
 8000592:	4804      	ldr	r0, [pc, #16]	; (80005a4 <printf_+0xa0>)
 8000594:	f000 f870 	bl	8000678 <mutex_unlock>
 8000598:	b003      	add	sp, #12
 800059a:	e8bd 4030 	ldmia.w	sp!, {r4, r5, lr}
 800059e:	b004      	add	sp, #16
 80005a0:	4770      	bx	lr
 80005a2:	bf00      	nop
 80005a4:	200004fc 	.word	0x200004fc

080005a8 <stdio_init>:
 80005a8:	b510      	push	{r4, lr}
 80005aa:	480e      	ldr	r0, [pc, #56]	; (80005e4 <stdio_init+0x3c>)
 80005ac:	f000 f83e 	bl	800062c <mutex_init>
 80005b0:	480d      	ldr	r0, [pc, #52]	; (80005e8 <stdio_init+0x40>)
 80005b2:	f000 f83b 	bl	800062c <mutex_init>
 80005b6:	480d      	ldr	r0, [pc, #52]	; (80005ec <stdio_init+0x44>)
 80005b8:	f000 f838 	bl	800062c <mutex_init>
 80005bc:	480c      	ldr	r0, [pc, #48]	; (80005f0 <stdio_init+0x48>)
 80005be:	f000 f835 	bl	800062c <mutex_init>
 80005c2:	2408      	movs	r4, #8
 80005c4:	2020      	movs	r0, #32
 80005c6:	f7ff ff23 	bl	8000410 <putc_>
 80005ca:	3c01      	subs	r4, #1
 80005cc:	d1fa      	bne.n	80005c4 <stdio_init+0x1c>
 80005ce:	2420      	movs	r4, #32
 80005d0:	200a      	movs	r0, #10
 80005d2:	f7ff ff1d 	bl	8000410 <putc_>
 80005d6:	3c01      	subs	r4, #1
 80005d8:	d1fa      	bne.n	80005d0 <stdio_init+0x28>
 80005da:	4806      	ldr	r0, [pc, #24]	; (80005f4 <stdio_init+0x4c>)
 80005dc:	e8bd 4010 	ldmia.w	sp!, {r4, lr}
 80005e0:	f7ff bf90 	b.w	8000504 <printf_>
 80005e4:	200004f4 	.word	0x200004f4
 80005e8:	200004f8 	.word	0x200004f8
 80005ec:	20000500 	.word	0x20000500
 80005f0:	200004fc 	.word	0x200004fc
 80005f4:	08000f0c 	.word	0x08000f0c

080005f8 <messages_init>:
 80005f8:	b510      	push	{r4, lr}
 80005fa:	2200      	movs	r2, #0
 80005fc:	4909      	ldr	r1, [pc, #36]	; (8000624 <messages_init+0x2c>)
 80005fe:	2300      	movs	r3, #0
 8000600:	f841 3022 	str.w	r3, [r1, r2, lsl #2]
 8000604:	3201      	adds	r2, #1
 8000606:	2a08      	cmp	r2, #8
 8000608:	d1f8      	bne.n	80005fc <messages_init+0x4>
 800060a:	4c07      	ldr	r4, [pc, #28]	; (8000628 <messages_init+0x30>)
 800060c:	0118      	lsls	r0, r3, #4
 800060e:	1821      	adds	r1, r4, r0
 8000610:	3301      	adds	r3, #1
 8000612:	2200      	movs	r2, #0
 8000614:	2b04      	cmp	r3, #4
 8000616:	604a      	str	r2, [r1, #4]
 8000618:	5022      	str	r2, [r4, r0]
 800061a:	60ca      	str	r2, [r1, #12]
 800061c:	608a      	str	r2, [r1, #8]
 800061e:	d1f4      	bne.n	800060a <messages_init+0x12>
 8000620:	bd10      	pop	{r4, pc}
 8000622:	bf00      	nop
 8000624:	20000504 	.word	0x20000504
 8000628:	20000524 	.word	0x20000524

0800062c <mutex_init>:
 800062c:	b510      	push	{r4, lr}
 800062e:	4604      	mov	r4, r0
 8000630:	f7ff fe28 	bl	8000284 <sched_off>
 8000634:	2300      	movs	r3, #0
 8000636:	6023      	str	r3, [r4, #0]
 8000638:	e8bd 4010 	ldmia.w	sp!, {r4, lr}
 800063c:	f7ff be24 	b.w	8000288 <sched_on>

08000640 <mutex_lock>:
 8000640:	b513      	push	{r0, r1, r4, lr}
 8000642:	4604      	mov	r4, r0
 8000644:	f7ff fe1e 	bl	8000284 <sched_off>
 8000648:	6823      	ldr	r3, [r4, #0]
 800064a:	9301      	str	r3, [sp, #4]
 800064c:	f7ff fe1c 	bl	8000288 <sched_on>
 8000650:	9b01      	ldr	r3, [sp, #4]
 8000652:	b10b      	cbz	r3, 8000658 <mutex_lock+0x18>
 8000654:	f7ff fe8a 	bl	800036c <set_wait_state>
 8000658:	9b01      	ldr	r3, [sp, #4]
 800065a:	2b00      	cmp	r3, #0
 800065c:	d1f2      	bne.n	8000644 <mutex_lock+0x4>
 800065e:	f7ff fe11 	bl	8000284 <sched_off>
 8000662:	6823      	ldr	r3, [r4, #0]
 8000664:	9301      	str	r3, [sp, #4]
 8000666:	9b01      	ldr	r3, [sp, #4]
 8000668:	2b00      	cmp	r3, #0
 800066a:	d1eb      	bne.n	8000644 <mutex_lock+0x4>
 800066c:	2301      	movs	r3, #1
 800066e:	6023      	str	r3, [r4, #0]
 8000670:	f7ff fe0a 	bl	8000288 <sched_on>
 8000674:	b002      	add	sp, #8
 8000676:	bd10      	pop	{r4, pc}

08000678 <mutex_unlock>:
 8000678:	b508      	push	{r3, lr}
 800067a:	f7ff ffd7 	bl	800062c <mutex_init>
 800067e:	f7ff fe97 	bl	80003b0 <wake_up_threads>
 8000682:	e8bd 4008 	ldmia.w	sp!, {r3, lr}
 8000686:	f7ff be01 	b.w	800028c <yield>
	...

0800068c <thread_02>:
 800068c:	b510      	push	{r4, lr}
 800068e:	2400      	movs	r4, #0
 8000690:	4621      	mov	r1, r4
 8000692:	4803      	ldr	r0, [pc, #12]	; (80006a0 <thread_02+0x14>)
 8000694:	3401      	adds	r4, #1
 8000696:	f7ff ff35 	bl	8000504 <printf_>
 800069a:	2c0a      	cmp	r4, #10
 800069c:	d1f8      	bne.n	8000690 <thread_02+0x4>
 800069e:	bd10      	pop	{r4, pc}
 80006a0:	08000f1d 	.word	0x08000f1d

080006a4 <thread_01>:
 80006a4:	b510      	push	{r4, lr}
 80006a6:	4810      	ldr	r0, [pc, #64]	; (80006e8 <thread_01+0x44>)
 80006a8:	f7ff ff2c 	bl	8000504 <printf_>
 80006ac:	480f      	ldr	r0, [pc, #60]	; (80006ec <thread_01+0x48>)
 80006ae:	f7ff ff29 	bl	8000504 <printf_>
 80006b2:	480f      	ldr	r0, [pc, #60]	; (80006f0 <thread_01+0x4c>)
 80006b4:	490f      	ldr	r1, [pc, #60]	; (80006f4 <thread_01+0x50>)
 80006b6:	f44f 7200 	mov.w	r2, #512	; 0x200
 80006ba:	2308      	movs	r3, #8
 80006bc:	f7ff fdfa 	bl	80002b4 <create_thread>
 80006c0:	2808      	cmp	r0, #8
 80006c2:	4604      	mov	r4, r0
 80006c4:	d101      	bne.n	80006ca <thread_01+0x26>
 80006c6:	480c      	ldr	r0, [pc, #48]	; (80006f8 <thread_01+0x54>)
 80006c8:	e007      	b.n	80006da <thread_01+0x36>
 80006ca:	480c      	ldr	r0, [pc, #48]	; (80006fc <thread_01+0x58>)
 80006cc:	4621      	mov	r1, r4
 80006ce:	f7ff ff19 	bl	8000504 <printf_>
 80006d2:	4620      	mov	r0, r4
 80006d4:	f7ff fe7e 	bl	80003d4 <join>
 80006d8:	4809      	ldr	r0, [pc, #36]	; (8000700 <thread_01+0x5c>)
 80006da:	f7ff ff13 	bl	8000504 <printf_>
 80006de:	f44f 70fa 	mov.w	r0, #500	; 0x1f4
 80006e2:	f000 fb57 	bl	8000d94 <timer_delay_ms>
 80006e6:	e7de      	b.n	80006a6 <thread_01+0x2>
 80006e8:	08000f3b 	.word	0x08000f3b
 80006ec:	08000f45 	.word	0x08000f45
 80006f0:	0800068d 	.word	0x0800068d
 80006f4:	20000764 	.word	0x20000764
 80006f8:	08000f5c 	.word	0x08000f5c
 80006fc:	08000f73 	.word	0x08000f73
 8000700:	08000f17 	.word	0x08000f17

08000704 <thread_03>:
 8000704:	b508      	push	{r3, lr}
 8000706:	4803      	ldr	r0, [pc, #12]	; (8000714 <thread_03+0x10>)
 8000708:	f7ff fefc 	bl	8000504 <printf_>
 800070c:	2064      	movs	r0, #100	; 0x64
 800070e:	f000 fb41 	bl	8000d94 <timer_delay_ms>
 8000712:	e7f8      	b.n	8000706 <thread_03+0x2>
 8000714:	08000f8f 	.word	0x08000f8f

08000718 <main_thread>:
 8000718:	b508      	push	{r3, lr}
 800071a:	4813      	ldr	r0, [pc, #76]	; (8000768 <main_thread+0x50>)
 800071c:	f7ff fef2 	bl	8000504 <printf_>
 8000720:	4912      	ldr	r1, [pc, #72]	; (800076c <main_thread+0x54>)
 8000722:	4813      	ldr	r0, [pc, #76]	; (8000770 <main_thread+0x58>)
 8000724:	f44f 7200 	mov.w	r2, #512	; 0x200
 8000728:	2308      	movs	r3, #8
 800072a:	f7ff fdc3 	bl	80002b4 <create_thread>
 800072e:	4811      	ldr	r0, [pc, #68]	; (8000774 <main_thread+0x5c>)
 8000730:	4911      	ldr	r1, [pc, #68]	; (8000778 <main_thread+0x60>)
 8000732:	f44f 7200 	mov.w	r2, #512	; 0x200
 8000736:	2308      	movs	r3, #8
 8000738:	f7ff fdbc 	bl	80002b4 <create_thread>
 800073c:	f44f 5000 	mov.w	r0, #8192	; 0x2000
 8000740:	f000 fb6c 	bl	8000e1c <led_on>
 8000744:	f000 fb18 	bl	8000d78 <timer_get_time>
 8000748:	f44f 717a 	mov.w	r1, #1000	; 0x3e8
 800074c:	fbb0 f1f1 	udiv	r1, r0, r1
 8000750:	480a      	ldr	r0, [pc, #40]	; (800077c <main_thread+0x64>)
 8000752:	f7ff fed7 	bl	8000504 <printf_>
 8000756:	f44f 5000 	mov.w	r0, #8192	; 0x2000
 800075a:	f000 fb65 	bl	8000e28 <led_off>
 800075e:	f44f 60fa 	mov.w	r0, #2000	; 0x7d0
 8000762:	f000 fb17 	bl	8000d94 <timer_delay_ms>
 8000766:	e7e9      	b.n	800073c <main_thread+0x24>
 8000768:	08000fa0 	.word	0x08000fa0
 800076c:	20000564 	.word	0x20000564
 8000770:	080006a5 	.word	0x080006a5
 8000774:	08000705 	.word	0x08000705
 8000778:	20000964 	.word	0x20000964
 800077c:	08000fdb 	.word	0x08000fdb

08000780 <uart_write>:
 8000780:	4b03      	ldr	r3, [pc, #12]	; (8000790 <uart_write+0x10>)
 8000782:	881a      	ldrh	r2, [r3, #0]
 8000784:	0652      	lsls	r2, r2, #25
 8000786:	d401      	bmi.n	800078c <uart_write+0xc>
 8000788:	bf00      	nop
 800078a:	e7f9      	b.n	8000780 <uart_write>
 800078c:	8098      	strh	r0, [r3, #4]
 800078e:	4770      	bx	lr
 8000790:	40011000 	.word	0x40011000

08000794 <uart_init>:
 8000794:	b530      	push	{r4, r5, lr}
 8000796:	2010      	movs	r0, #16
 8000798:	b087      	sub	sp, #28
 800079a:	2101      	movs	r1, #1
 800079c:	f000 f90c 	bl	80009b8 <RCC_APB2PeriphClockCmd>
 80007a0:	2001      	movs	r0, #1
 80007a2:	4d1c      	ldr	r5, [pc, #112]	; (8000814 <uart_init+0x80>)
 80007a4:	4601      	mov	r1, r0
 80007a6:	f000 f8ef 	bl	8000988 <RCC_AHB1PeriphClockCmd>
 80007aa:	f44f 63c0 	mov.w	r3, #1536	; 0x600
 80007ae:	2400      	movs	r4, #0
 80007b0:	9300      	str	r3, [sp, #0]
 80007b2:	4628      	mov	r0, r5
 80007b4:	2302      	movs	r3, #2
 80007b6:	4669      	mov	r1, sp
 80007b8:	f88d 3004 	strb.w	r3, [sp, #4]
 80007bc:	f88d 3005 	strb.w	r3, [sp, #5]
 80007c0:	f88d 4006 	strb.w	r4, [sp, #6]
 80007c4:	f88d 4007 	strb.w	r4, [sp, #7]
 80007c8:	f000 fb34 	bl	8000e34 <GPIO_Init>
 80007cc:	4628      	mov	r0, r5
 80007ce:	2109      	movs	r1, #9
 80007d0:	2207      	movs	r2, #7
 80007d2:	f000 fb70 	bl	8000eb6 <GPIO_PinAFConfig>
 80007d6:	2207      	movs	r2, #7
 80007d8:	4628      	mov	r0, r5
 80007da:	210a      	movs	r1, #10
 80007dc:	f000 fb6b 	bl	8000eb6 <GPIO_PinAFConfig>
 80007e0:	f8ad 400c 	strh.w	r4, [sp, #12]
 80007e4:	f8ad 400e 	strh.w	r4, [sp, #14]
 80007e8:	f8ad 4010 	strh.w	r4, [sp, #16]
 80007ec:	f8ad 4014 	strh.w	r4, [sp, #20]
 80007f0:	4c09      	ldr	r4, [pc, #36]	; (8000818 <uart_init+0x84>)
 80007f2:	f44f 33e1 	mov.w	r3, #115200	; 0x1c200
 80007f6:	9302      	str	r3, [sp, #8]
 80007f8:	4620      	mov	r0, r4
 80007fa:	230c      	movs	r3, #12
 80007fc:	a902      	add	r1, sp, #8
 80007fe:	f8ad 3012 	strh.w	r3, [sp, #18]
 8000802:	f000 f80b 	bl	800081c <USART_Init>
 8000806:	4620      	mov	r0, r4
 8000808:	2101      	movs	r1, #1
 800080a:	f000 f861 	bl	80008d0 <USART_Cmd>
 800080e:	b007      	add	sp, #28
 8000810:	bd30      	pop	{r4, r5, pc}
 8000812:	bf00      	nop
 8000814:	40020000 	.word	0x40020000
 8000818:	40011000 	.word	0x40011000

0800081c <USART_Init>:
 800081c:	8a03      	ldrh	r3, [r0, #16]
 800081e:	88ca      	ldrh	r2, [r1, #6]
 8000820:	b29b      	uxth	r3, r3
 8000822:	f423 5340 	bic.w	r3, r3, #12288	; 0x3000
 8000826:	b530      	push	{r4, r5, lr}
 8000828:	4313      	orrs	r3, r2
 800082a:	460d      	mov	r5, r1
 800082c:	8203      	strh	r3, [r0, #16]
 800082e:	8983      	ldrh	r3, [r0, #12]
 8000830:	8909      	ldrh	r1, [r1, #8]
 8000832:	88aa      	ldrh	r2, [r5, #4]
 8000834:	f423 53b0 	bic.w	r3, r3, #5632	; 0x1600
 8000838:	430a      	orrs	r2, r1
 800083a:	8969      	ldrh	r1, [r5, #10]
 800083c:	f023 030c 	bic.w	r3, r3, #12
 8000840:	430a      	orrs	r2, r1
 8000842:	041b      	lsls	r3, r3, #16
 8000844:	b292      	uxth	r2, r2
 8000846:	0c1b      	lsrs	r3, r3, #16
 8000848:	4313      	orrs	r3, r2
 800084a:	8183      	strh	r3, [r0, #12]
 800084c:	8a83      	ldrh	r3, [r0, #20]
 800084e:	89aa      	ldrh	r2, [r5, #12]
 8000850:	b29b      	uxth	r3, r3
 8000852:	f423 7340 	bic.w	r3, r3, #768	; 0x300
 8000856:	4313      	orrs	r3, r2
 8000858:	b085      	sub	sp, #20
 800085a:	8283      	strh	r3, [r0, #20]
 800085c:	4604      	mov	r4, r0
 800085e:	4668      	mov	r0, sp
 8000860:	f000 f84e 	bl	8000900 <RCC_GetClocksFreq>
 8000864:	4b19      	ldr	r3, [pc, #100]	; (80008cc <USART_Init+0xb0>)
 8000866:	429c      	cmp	r4, r3
 8000868:	d003      	beq.n	8000872 <USART_Init+0x56>
 800086a:	f503 6380 	add.w	r3, r3, #1024	; 0x400
 800086e:	429c      	cmp	r4, r3
 8000870:	d101      	bne.n	8000876 <USART_Init+0x5a>
 8000872:	9b03      	ldr	r3, [sp, #12]
 8000874:	e000      	b.n	8000878 <USART_Init+0x5c>
 8000876:	9b02      	ldr	r3, [sp, #8]
 8000878:	89a2      	ldrh	r2, [r4, #12]
 800087a:	b212      	sxth	r2, r2
 800087c:	2a00      	cmp	r2, #0
 800087e:	682a      	ldr	r2, [r5, #0]
 8000880:	f04f 0119 	mov.w	r1, #25
 8000884:	bfb4      	ite	lt
 8000886:	0052      	lsllt	r2, r2, #1
 8000888:	0092      	lslge	r2, r2, #2
 800088a:	4359      	muls	r1, r3
 800088c:	fbb1 f1f2 	udiv	r1, r1, r2
 8000890:	2364      	movs	r3, #100	; 0x64
 8000892:	fbb1 f2f3 	udiv	r2, r1, r3
 8000896:	0112      	lsls	r2, r2, #4
 8000898:	0910      	lsrs	r0, r2, #4
 800089a:	fb03 1110 	mls	r1, r3, r0, r1
 800089e:	89a0      	ldrh	r0, [r4, #12]
 80008a0:	b200      	sxth	r0, r0
 80008a2:	2800      	cmp	r0, #0
 80008a4:	da06      	bge.n	80008b4 <USART_Init+0x98>
 80008a6:	00c9      	lsls	r1, r1, #3
 80008a8:	3132      	adds	r1, #50	; 0x32
 80008aa:	fbb1 f3f3 	udiv	r3, r1, r3
 80008ae:	f003 0307 	and.w	r3, r3, #7
 80008b2:	e005      	b.n	80008c0 <USART_Init+0xa4>
 80008b4:	0109      	lsls	r1, r1, #4
 80008b6:	3132      	adds	r1, #50	; 0x32
 80008b8:	fbb1 f3f3 	udiv	r3, r1, r3
 80008bc:	f003 030f 	and.w	r3, r3, #15
 80008c0:	431a      	orrs	r2, r3
 80008c2:	b292      	uxth	r2, r2
 80008c4:	8122      	strh	r2, [r4, #8]
 80008c6:	b005      	add	sp, #20
 80008c8:	bd30      	pop	{r4, r5, pc}
 80008ca:	bf00      	nop
 80008cc:	40011000 	.word	0x40011000

080008d0 <USART_Cmd>:
 80008d0:	8983      	ldrh	r3, [r0, #12]
 80008d2:	b119      	cbz	r1, 80008dc <USART_Cmd+0xc>
 80008d4:	b29b      	uxth	r3, r3
 80008d6:	f443 5300 	orr.w	r3, r3, #8192	; 0x2000
 80008da:	e003      	b.n	80008e4 <USART_Cmd+0x14>
 80008dc:	f423 5300 	bic.w	r3, r3, #8192	; 0x2000
 80008e0:	041b      	lsls	r3, r3, #16
 80008e2:	0c1b      	lsrs	r3, r3, #16
 80008e4:	8183      	strh	r3, [r0, #12]
 80008e6:	4770      	bx	lr

080008e8 <lib_low_level_init>:
 80008e8:	b508      	push	{r3, lr}
 80008ea:	f000 f97f 	bl	8000bec <sytem_clock_init>
 80008ee:	f000 fa61 	bl	8000db4 <gpio_init>
 80008f2:	f7ff ff4f 	bl	8000794 <uart_init>
 80008f6:	e8bd 4008 	ldmia.w	sp!, {r3, lr}
 80008fa:	f000 b9c7 	b.w	8000c8c <timer_init>
	...

08000900 <RCC_GetClocksFreq>:
 8000900:	4b1d      	ldr	r3, [pc, #116]	; (8000978 <RCC_GetClocksFreq+0x78>)
 8000902:	689a      	ldr	r2, [r3, #8]
 8000904:	f002 020c 	and.w	r2, r2, #12
 8000908:	2a04      	cmp	r2, #4
 800090a:	b510      	push	{r4, lr}
 800090c:	d003      	beq.n	8000916 <RCC_GetClocksFreq+0x16>
 800090e:	2a08      	cmp	r2, #8
 8000910:	d003      	beq.n	800091a <RCC_GetClocksFreq+0x1a>
 8000912:	4b1a      	ldr	r3, [pc, #104]	; (800097c <RCC_GetClocksFreq+0x7c>)
 8000914:	e018      	b.n	8000948 <RCC_GetClocksFreq+0x48>
 8000916:	4b1a      	ldr	r3, [pc, #104]	; (8000980 <RCC_GetClocksFreq+0x80>)
 8000918:	e016      	b.n	8000948 <RCC_GetClocksFreq+0x48>
 800091a:	6859      	ldr	r1, [r3, #4]
 800091c:	685a      	ldr	r2, [r3, #4]
 800091e:	f411 0f80 	tst.w	r1, #4194304	; 0x400000
 8000922:	6859      	ldr	r1, [r3, #4]
 8000924:	bf14      	ite	ne
 8000926:	4b16      	ldrne	r3, [pc, #88]	; (8000980 <RCC_GetClocksFreq+0x80>)
 8000928:	4b14      	ldreq	r3, [pc, #80]	; (800097c <RCC_GetClocksFreq+0x7c>)
 800092a:	f002 023f 	and.w	r2, r2, #63	; 0x3f
 800092e:	fbb3 f3f2 	udiv	r3, r3, r2
 8000932:	4a11      	ldr	r2, [pc, #68]	; (8000978 <RCC_GetClocksFreq+0x78>)
 8000934:	6852      	ldr	r2, [r2, #4]
 8000936:	f3c2 4201 	ubfx	r2, r2, #16, #2
 800093a:	f3c1 1188 	ubfx	r1, r1, #6, #9
 800093e:	3201      	adds	r2, #1
 8000940:	434b      	muls	r3, r1
 8000942:	0052      	lsls	r2, r2, #1
 8000944:	fbb3 f3f2 	udiv	r3, r3, r2
 8000948:	490b      	ldr	r1, [pc, #44]	; (8000978 <RCC_GetClocksFreq+0x78>)
 800094a:	6003      	str	r3, [r0, #0]
 800094c:	688b      	ldr	r3, [r1, #8]
 800094e:	4a0d      	ldr	r2, [pc, #52]	; (8000984 <RCC_GetClocksFreq+0x84>)
 8000950:	f3c3 1303 	ubfx	r3, r3, #4, #4
 8000954:	5cd4      	ldrb	r4, [r2, r3]
 8000956:	6803      	ldr	r3, [r0, #0]
 8000958:	40e3      	lsrs	r3, r4
 800095a:	6043      	str	r3, [r0, #4]
 800095c:	688c      	ldr	r4, [r1, #8]
 800095e:	f3c4 2482 	ubfx	r4, r4, #10, #3
 8000962:	5d14      	ldrb	r4, [r2, r4]
 8000964:	fa23 f404 	lsr.w	r4, r3, r4
 8000968:	6084      	str	r4, [r0, #8]
 800096a:	6889      	ldr	r1, [r1, #8]
 800096c:	f3c1 3142 	ubfx	r1, r1, #13, #3
 8000970:	5c52      	ldrb	r2, [r2, r1]
 8000972:	40d3      	lsrs	r3, r2
 8000974:	60c3      	str	r3, [r0, #12]
 8000976:	bd10      	pop	{r4, pc}
 8000978:	40023800 	.word	0x40023800
 800097c:	00f42400 	.word	0x00f42400
 8000980:	007a1200 	.word	0x007a1200
 8000984:	20000000 	.word	0x20000000

08000988 <RCC_AHB1PeriphClockCmd>:
 8000988:	4b04      	ldr	r3, [pc, #16]	; (800099c <RCC_AHB1PeriphClockCmd+0x14>)
 800098a:	6b1a      	ldr	r2, [r3, #48]	; 0x30
 800098c:	b109      	cbz	r1, 8000992 <RCC_AHB1PeriphClockCmd+0xa>
 800098e:	4310      	orrs	r0, r2
 8000990:	e001      	b.n	8000996 <RCC_AHB1PeriphClockCmd+0xe>
 8000992:	ea22 0000 	bic.w	r0, r2, r0
 8000996:	6318      	str	r0, [r3, #48]	; 0x30
 8000998:	4770      	bx	lr
 800099a:	bf00      	nop
 800099c:	40023800 	.word	0x40023800

080009a0 <RCC_APB1PeriphClockCmd>:
 80009a0:	4b04      	ldr	r3, [pc, #16]	; (80009b4 <RCC_APB1PeriphClockCmd+0x14>)
 80009a2:	6c1a      	ldr	r2, [r3, #64]	; 0x40
 80009a4:	b109      	cbz	r1, 80009aa <RCC_APB1PeriphClockCmd+0xa>
 80009a6:	4310      	orrs	r0, r2
 80009a8:	e001      	b.n	80009ae <RCC_APB1PeriphClockCmd+0xe>
 80009aa:	ea22 0000 	bic.w	r0, r2, r0
 80009ae:	6418      	str	r0, [r3, #64]	; 0x40
 80009b0:	4770      	bx	lr
 80009b2:	bf00      	nop
 80009b4:	40023800 	.word	0x40023800

080009b8 <RCC_APB2PeriphClockCmd>:
 80009b8:	4b04      	ldr	r3, [pc, #16]	; (80009cc <RCC_APB2PeriphClockCmd+0x14>)
 80009ba:	6c5a      	ldr	r2, [r3, #68]	; 0x44
 80009bc:	b109      	cbz	r1, 80009c2 <RCC_APB2PeriphClockCmd+0xa>
 80009be:	4310      	orrs	r0, r2
 80009c0:	e001      	b.n	80009c6 <RCC_APB2PeriphClockCmd+0xe>
 80009c2:	ea22 0000 	bic.w	r0, r2, r0
 80009c6:	6458      	str	r0, [r3, #68]	; 0x44
 80009c8:	4770      	bx	lr
 80009ca:	bf00      	nop
 80009cc:	40023800 	.word	0x40023800

080009d0 <NVIC_Init>:
 80009d0:	78c2      	ldrb	r2, [r0, #3]
 80009d2:	7803      	ldrb	r3, [r0, #0]
 80009d4:	b510      	push	{r4, lr}
 80009d6:	b30a      	cbz	r2, 8000a1c <NVIC_Init+0x4c>
 80009d8:	4a16      	ldr	r2, [pc, #88]	; (8000a34 <NVIC_Init+0x64>)
 80009da:	7844      	ldrb	r4, [r0, #1]
 80009dc:	68d2      	ldr	r2, [r2, #12]
 80009de:	43d2      	mvns	r2, r2
 80009e0:	f3c2 2202 	ubfx	r2, r2, #8, #3
 80009e4:	f1c2 0104 	rsb	r1, r2, #4
 80009e8:	b2c9      	uxtb	r1, r1
 80009ea:	fa04 f101 	lsl.w	r1, r4, r1
 80009ee:	240f      	movs	r4, #15
 80009f0:	fa44 f202 	asr.w	r2, r4, r2
 80009f4:	7884      	ldrb	r4, [r0, #2]
 80009f6:	b2c9      	uxtb	r1, r1
 80009f8:	4022      	ands	r2, r4
 80009fa:	430a      	orrs	r2, r1
 80009fc:	f103 4360 	add.w	r3, r3, #3758096384	; 0xe0000000
 8000a00:	f503 4361 	add.w	r3, r3, #57600	; 0xe100
 8000a04:	0112      	lsls	r2, r2, #4
 8000a06:	b2d2      	uxtb	r2, r2
 8000a08:	f883 2300 	strb.w	r2, [r3, #768]	; 0x300
 8000a0c:	7803      	ldrb	r3, [r0, #0]
 8000a0e:	2201      	movs	r2, #1
 8000a10:	0959      	lsrs	r1, r3, #5
 8000a12:	f003 031f 	and.w	r3, r3, #31
 8000a16:	fa02 f303 	lsl.w	r3, r2, r3
 8000a1a:	e006      	b.n	8000a2a <NVIC_Init+0x5a>
 8000a1c:	0959      	lsrs	r1, r3, #5
 8000a1e:	2201      	movs	r2, #1
 8000a20:	f003 031f 	and.w	r3, r3, #31
 8000a24:	fa02 f303 	lsl.w	r3, r2, r3
 8000a28:	3120      	adds	r1, #32
 8000a2a:	4a03      	ldr	r2, [pc, #12]	; (8000a38 <NVIC_Init+0x68>)
 8000a2c:	f842 3021 	str.w	r3, [r2, r1, lsl #2]
 8000a30:	bd10      	pop	{r4, pc}
 8000a32:	bf00      	nop
 8000a34:	e000ed00 	.word	0xe000ed00
 8000a38:	e000e100 	.word	0xe000e100

08000a3c <Default_Handler>:
 8000a3c:	4668      	mov	r0, sp
 8000a3e:	f020 0107 	bic.w	r1, r0, #7
 8000a42:	468d      	mov	sp, r1
 8000a44:	bf00      	nop
 8000a46:	e7fd      	b.n	8000a44 <Default_Handler+0x8>

08000a48 <HardFault_Handler>:
 8000a48:	f44f 5000 	mov.w	r0, #8192	; 0x2000
 8000a4c:	f000 f9e6 	bl	8000e1c <led_on>
 8000a50:	4b06      	ldr	r3, [pc, #24]	; (8000a6c <HardFault_Handler+0x24>)
 8000a52:	3b01      	subs	r3, #1
 8000a54:	d001      	beq.n	8000a5a <HardFault_Handler+0x12>
 8000a56:	bf00      	nop
 8000a58:	e7fb      	b.n	8000a52 <HardFault_Handler+0xa>
 8000a5a:	f44f 5000 	mov.w	r0, #8192	; 0x2000
 8000a5e:	f000 f9e3 	bl	8000e28 <led_off>
 8000a62:	4b02      	ldr	r3, [pc, #8]	; (8000a6c <HardFault_Handler+0x24>)
 8000a64:	3b01      	subs	r3, #1
 8000a66:	d0ef      	beq.n	8000a48 <HardFault_Handler>
 8000a68:	bf00      	nop
 8000a6a:	e7fb      	b.n	8000a64 <HardFault_Handler+0x1c>
 8000a6c:	00989681 	.word	0x00989681

08000a70 <_reset_init>:
 8000a70:	4a0e      	ldr	r2, [pc, #56]	; (8000aac <_reset_init+0x3c>)
 8000a72:	480f      	ldr	r0, [pc, #60]	; (8000ab0 <_reset_init+0x40>)
 8000a74:	1a80      	subs	r0, r0, r2
 8000a76:	1080      	asrs	r0, r0, #2
 8000a78:	2300      	movs	r3, #0
 8000a7a:	4283      	cmp	r3, r0
 8000a7c:	d006      	beq.n	8000a8c <_reset_init+0x1c>
 8000a7e:	490d      	ldr	r1, [pc, #52]	; (8000ab4 <_reset_init+0x44>)
 8000a80:	f851 1023 	ldr.w	r1, [r1, r3, lsl #2]
 8000a84:	f842 1023 	str.w	r1, [r2, r3, lsl #2]
 8000a88:	3301      	adds	r3, #1
 8000a8a:	e7f6      	b.n	8000a7a <_reset_init+0xa>
 8000a8c:	4b0a      	ldr	r3, [pc, #40]	; (8000ab8 <_reset_init+0x48>)
 8000a8e:	f8d3 2088 	ldr.w	r2, [r3, #136]	; 0x88
 8000a92:	f442 0270 	orr.w	r2, r2, #15728640	; 0xf00000
 8000a96:	f8c3 2088 	str.w	r2, [r3, #136]	; 0x88
 8000a9a:	f503 730c 	add.w	r3, r3, #560	; 0x230
 8000a9e:	685a      	ldr	r2, [r3, #4]
 8000aa0:	f022 4240 	bic.w	r2, r2, #3221225472	; 0xc0000000
 8000aa4:	605a      	str	r2, [r3, #4]
 8000aa6:	f7ff bb6f 	b.w	8000188 <main>
 8000aaa:	bf00      	nop
 8000aac:	20000000 	.word	0x20000000
 8000ab0:	20000010 	.word	0x20000010
 8000ab4:	08000ffc 	.word	0x08000ffc
 8000ab8:	e000ed00 	.word	0xe000ed00

08000abc <SystemInit>:
 8000abc:	4b3b      	ldr	r3, [pc, #236]	; (8000bac <SystemInit+0xf0>)
 8000abe:	f8d3 2088 	ldr.w	r2, [r3, #136]	; 0x88
 8000ac2:	f442 0270 	orr.w	r2, r2, #15728640	; 0xf00000
 8000ac6:	f8c3 2088 	str.w	r2, [r3, #136]	; 0x88
 8000aca:	f8d3 2088 	ldr.w	r2, [r3, #136]	; 0x88
 8000ace:	f442 0270 	orr.w	r2, r2, #15728640	; 0xf00000
 8000ad2:	f8c3 2088 	str.w	r2, [r3, #136]	; 0x88
 8000ad6:	4b36      	ldr	r3, [pc, #216]	; (8000bb0 <SystemInit+0xf4>)
 8000ad8:	681a      	ldr	r2, [r3, #0]
 8000ada:	f042 0201 	orr.w	r2, r2, #1
 8000ade:	601a      	str	r2, [r3, #0]
 8000ae0:	2200      	movs	r2, #0
 8000ae2:	609a      	str	r2, [r3, #8]
 8000ae4:	6819      	ldr	r1, [r3, #0]
 8000ae6:	f021 7184 	bic.w	r1, r1, #17301504	; 0x1080000
 8000aea:	f421 3180 	bic.w	r1, r1, #65536	; 0x10000
 8000aee:	6019      	str	r1, [r3, #0]
 8000af0:	4930      	ldr	r1, [pc, #192]	; (8000bb4 <SystemInit+0xf8>)
 8000af2:	6059      	str	r1, [r3, #4]
 8000af4:	6819      	ldr	r1, [r3, #0]
 8000af6:	b082      	sub	sp, #8
 8000af8:	f421 2180 	bic.w	r1, r1, #262144	; 0x40000
 8000afc:	6019      	str	r1, [r3, #0]
 8000afe:	60da      	str	r2, [r3, #12]
 8000b00:	9200      	str	r2, [sp, #0]
 8000b02:	9201      	str	r2, [sp, #4]
 8000b04:	681a      	ldr	r2, [r3, #0]
 8000b06:	f442 3280 	orr.w	r2, r2, #65536	; 0x10000
 8000b0a:	601a      	str	r2, [r3, #0]
 8000b0c:	4b28      	ldr	r3, [pc, #160]	; (8000bb0 <SystemInit+0xf4>)
 8000b0e:	681a      	ldr	r2, [r3, #0]
 8000b10:	f402 3200 	and.w	r2, r2, #131072	; 0x20000
 8000b14:	9201      	str	r2, [sp, #4]
 8000b16:	9a00      	ldr	r2, [sp, #0]
 8000b18:	3201      	adds	r2, #1
 8000b1a:	9200      	str	r2, [sp, #0]
 8000b1c:	9a01      	ldr	r2, [sp, #4]
 8000b1e:	b91a      	cbnz	r2, 8000b28 <SystemInit+0x6c>
 8000b20:	9a00      	ldr	r2, [sp, #0]
 8000b22:	f5b2 6fa0 	cmp.w	r2, #1280	; 0x500
 8000b26:	d1f1      	bne.n	8000b0c <SystemInit+0x50>
 8000b28:	681b      	ldr	r3, [r3, #0]
 8000b2a:	f413 3300 	ands.w	r3, r3, #131072	; 0x20000
 8000b2e:	bf18      	it	ne
 8000b30:	2301      	movne	r3, #1
 8000b32:	9301      	str	r3, [sp, #4]
 8000b34:	9b01      	ldr	r3, [sp, #4]
 8000b36:	2b01      	cmp	r3, #1
 8000b38:	d005      	beq.n	8000b46 <SystemInit+0x8a>
 8000b3a:	4b1c      	ldr	r3, [pc, #112]	; (8000bac <SystemInit+0xf0>)
 8000b3c:	f04f 6200 	mov.w	r2, #134217728	; 0x8000000
 8000b40:	609a      	str	r2, [r3, #8]
 8000b42:	b002      	add	sp, #8
 8000b44:	4770      	bx	lr
 8000b46:	4b1a      	ldr	r3, [pc, #104]	; (8000bb0 <SystemInit+0xf4>)
 8000b48:	6c1a      	ldr	r2, [r3, #64]	; 0x40
 8000b4a:	f042 5280 	orr.w	r2, r2, #268435456	; 0x10000000
 8000b4e:	641a      	str	r2, [r3, #64]	; 0x40
 8000b50:	4a19      	ldr	r2, [pc, #100]	; (8000bb8 <SystemInit+0xfc>)
 8000b52:	6811      	ldr	r1, [r2, #0]
 8000b54:	f441 4180 	orr.w	r1, r1, #16384	; 0x4000
 8000b58:	6011      	str	r1, [r2, #0]
 8000b5a:	689a      	ldr	r2, [r3, #8]
 8000b5c:	f042 0290 	orr.w	r2, r2, #144	; 0x90
 8000b60:	609a      	str	r2, [r3, #8]
 8000b62:	689a      	ldr	r2, [r3, #8]
 8000b64:	f442 4200 	orr.w	r2, r2, #32768	; 0x8000
 8000b68:	609a      	str	r2, [r3, #8]
 8000b6a:	689a      	ldr	r2, [r3, #8]
 8000b6c:	f442 52a0 	orr.w	r2, r2, #5120	; 0x1400
 8000b70:	609a      	str	r2, [r3, #8]
 8000b72:	4a12      	ldr	r2, [pc, #72]	; (8000bbc <SystemInit+0x100>)
 8000b74:	605a      	str	r2, [r3, #4]
 8000b76:	681a      	ldr	r2, [r3, #0]
 8000b78:	f042 7280 	orr.w	r2, r2, #16777216	; 0x1000000
 8000b7c:	601a      	str	r2, [r3, #0]
 8000b7e:	6819      	ldr	r1, [r3, #0]
 8000b80:	4a0b      	ldr	r2, [pc, #44]	; (8000bb0 <SystemInit+0xf4>)
 8000b82:	0189      	lsls	r1, r1, #6
 8000b84:	d5fb      	bpl.n	8000b7e <SystemInit+0xc2>
 8000b86:	4b0e      	ldr	r3, [pc, #56]	; (8000bc0 <SystemInit+0x104>)
 8000b88:	f240 6105 	movw	r1, #1541	; 0x605
 8000b8c:	6019      	str	r1, [r3, #0]
 8000b8e:	6893      	ldr	r3, [r2, #8]
 8000b90:	f023 0303 	bic.w	r3, r3, #3
 8000b94:	6093      	str	r3, [r2, #8]
 8000b96:	6893      	ldr	r3, [r2, #8]
 8000b98:	f043 0302 	orr.w	r3, r3, #2
 8000b9c:	6093      	str	r3, [r2, #8]
 8000b9e:	4b04      	ldr	r3, [pc, #16]	; (8000bb0 <SystemInit+0xf4>)
 8000ba0:	689b      	ldr	r3, [r3, #8]
 8000ba2:	f003 030c 	and.w	r3, r3, #12
 8000ba6:	2b08      	cmp	r3, #8
 8000ba8:	d1f9      	bne.n	8000b9e <SystemInit+0xe2>
 8000baa:	e7c6      	b.n	8000b3a <SystemInit+0x7e>
 8000bac:	e000ed00 	.word	0xe000ed00
 8000bb0:	40023800 	.word	0x40023800
 8000bb4:	24003010 	.word	0x24003010
 8000bb8:	40007000 	.word	0x40007000
 8000bbc:	07405408 	.word	0x07405408
 8000bc0:	40023c00 	.word	0x40023c00

08000bc4 <sys_tick_init>:
 8000bc4:	4b05      	ldr	r3, [pc, #20]	; (8000bdc <sys_tick_init+0x18>)
 8000bc6:	4a06      	ldr	r2, [pc, #24]	; (8000be0 <sys_tick_init+0x1c>)
 8000bc8:	605a      	str	r2, [r3, #4]
 8000bca:	4a06      	ldr	r2, [pc, #24]	; (8000be4 <sys_tick_init+0x20>)
 8000bcc:	21f0      	movs	r1, #240	; 0xf0
 8000bce:	f882 1023 	strb.w	r1, [r2, #35]	; 0x23
 8000bd2:	2200      	movs	r2, #0
 8000bd4:	609a      	str	r2, [r3, #8]
 8000bd6:	2207      	movs	r2, #7
 8000bd8:	601a      	str	r2, [r3, #0]
 8000bda:	4770      	bx	lr
 8000bdc:	e000e010 	.word	0xe000e010
 8000be0:	00029040 	.word	0x00029040
 8000be4:	e000ed00 	.word	0xe000ed00

08000be8 <sleep>:
 8000be8:	bf30      	wfi
 8000bea:	4770      	bx	lr

08000bec <sytem_clock_init>:
 8000bec:	f7ff bf66 	b.w	8000abc <SystemInit>

08000bf0 <TIM_TimeBaseInit>:
 8000bf0:	4a1c      	ldr	r2, [pc, #112]	; (8000c64 <TIM_TimeBaseInit+0x74>)
 8000bf2:	8803      	ldrh	r3, [r0, #0]
 8000bf4:	4290      	cmp	r0, r2
 8000bf6:	b29b      	uxth	r3, r3
 8000bf8:	d012      	beq.n	8000c20 <TIM_TimeBaseInit+0x30>
 8000bfa:	f502 6280 	add.w	r2, r2, #1024	; 0x400
 8000bfe:	4290      	cmp	r0, r2
 8000c00:	d00e      	beq.n	8000c20 <TIM_TimeBaseInit+0x30>
 8000c02:	f1b0 4f80 	cmp.w	r0, #1073741824	; 0x40000000
 8000c06:	d00b      	beq.n	8000c20 <TIM_TimeBaseInit+0x30>
 8000c08:	f5a2 3280 	sub.w	r2, r2, #65536	; 0x10000
 8000c0c:	4290      	cmp	r0, r2
 8000c0e:	d007      	beq.n	8000c20 <TIM_TimeBaseInit+0x30>
 8000c10:	f502 6280 	add.w	r2, r2, #1024	; 0x400
 8000c14:	4290      	cmp	r0, r2
 8000c16:	d003      	beq.n	8000c20 <TIM_TimeBaseInit+0x30>
 8000c18:	f502 6280 	add.w	r2, r2, #1024	; 0x400
 8000c1c:	4290      	cmp	r0, r2
 8000c1e:	d103      	bne.n	8000c28 <TIM_TimeBaseInit+0x38>
 8000c20:	884a      	ldrh	r2, [r1, #2]
 8000c22:	f023 0370 	bic.w	r3, r3, #112	; 0x70
 8000c26:	4313      	orrs	r3, r2
 8000c28:	4a0f      	ldr	r2, [pc, #60]	; (8000c68 <TIM_TimeBaseInit+0x78>)
 8000c2a:	4290      	cmp	r0, r2
 8000c2c:	d008      	beq.n	8000c40 <TIM_TimeBaseInit+0x50>
 8000c2e:	f502 6280 	add.w	r2, r2, #1024	; 0x400
 8000c32:	4290      	cmp	r0, r2
 8000c34:	d004      	beq.n	8000c40 <TIM_TimeBaseInit+0x50>
 8000c36:	f423 7340 	bic.w	r3, r3, #768	; 0x300
 8000c3a:	890a      	ldrh	r2, [r1, #8]
 8000c3c:	b29b      	uxth	r3, r3
 8000c3e:	4313      	orrs	r3, r2
 8000c40:	8003      	strh	r3, [r0, #0]
 8000c42:	684b      	ldr	r3, [r1, #4]
 8000c44:	62c3      	str	r3, [r0, #44]	; 0x2c
 8000c46:	880b      	ldrh	r3, [r1, #0]
 8000c48:	8503      	strh	r3, [r0, #40]	; 0x28
 8000c4a:	4b06      	ldr	r3, [pc, #24]	; (8000c64 <TIM_TimeBaseInit+0x74>)
 8000c4c:	4298      	cmp	r0, r3
 8000c4e:	d003      	beq.n	8000c58 <TIM_TimeBaseInit+0x68>
 8000c50:	f503 6380 	add.w	r3, r3, #1024	; 0x400
 8000c54:	4298      	cmp	r0, r3
 8000c56:	d101      	bne.n	8000c5c <TIM_TimeBaseInit+0x6c>
 8000c58:	7a8b      	ldrb	r3, [r1, #10]
 8000c5a:	8603      	strh	r3, [r0, #48]	; 0x30
 8000c5c:	2301      	movs	r3, #1
 8000c5e:	8283      	strh	r3, [r0, #20]
 8000c60:	4770      	bx	lr
 8000c62:	bf00      	nop
 8000c64:	40010000 	.word	0x40010000
 8000c68:	40001000 	.word	0x40001000

08000c6c <TIM_Cmd>:
 8000c6c:	8803      	ldrh	r3, [r0, #0]
 8000c6e:	b119      	cbz	r1, 8000c78 <TIM_Cmd+0xc>
 8000c70:	b29b      	uxth	r3, r3
 8000c72:	f043 0301 	orr.w	r3, r3, #1
 8000c76:	e003      	b.n	8000c80 <TIM_Cmd+0x14>
 8000c78:	f023 0301 	bic.w	r3, r3, #1
 8000c7c:	041b      	lsls	r3, r3, #16
 8000c7e:	0c1b      	lsrs	r3, r3, #16
 8000c80:	8003      	strh	r3, [r0, #0]
 8000c82:	4770      	bx	lr

08000c84 <TIM_ClearITPendingBit>:
 8000c84:	43c9      	mvns	r1, r1
 8000c86:	b289      	uxth	r1, r1
 8000c88:	8201      	strh	r1, [r0, #16]
 8000c8a:	4770      	bx	lr

08000c8c <timer_init>:
 8000c8c:	b530      	push	{r4, r5, lr}
 8000c8e:	2000      	movs	r0, #0
 8000c90:	b085      	sub	sp, #20
 8000c92:	4a1e      	ldr	r2, [pc, #120]	; (8000d0c <timer_init+0x80>)
 8000c94:	f44f 6380 	mov.w	r3, #1024	; 0x400
 8000c98:	f822 3010 	strh.w	r3, [r2, r0, lsl #1]
 8000c9c:	4a1c      	ldr	r2, [pc, #112]	; (8000d10 <timer_init+0x84>)
 8000c9e:	f822 3010 	strh.w	r3, [r2, r0, lsl #1]
 8000ca2:	4b1c      	ldr	r3, [pc, #112]	; (8000d14 <timer_init+0x88>)
 8000ca4:	2400      	movs	r4, #0
 8000ca6:	f823 4010 	strh.w	r4, [r3, r0, lsl #1]
 8000caa:	3001      	adds	r0, #1
 8000cac:	2804      	cmp	r0, #4
 8000cae:	4625      	mov	r5, r4
 8000cb0:	d1ef      	bne.n	8000c92 <timer_init+0x6>
 8000cb2:	4b19      	ldr	r3, [pc, #100]	; (8000d18 <timer_init+0x8c>)
 8000cb4:	2101      	movs	r1, #1
 8000cb6:	601c      	str	r4, [r3, #0]
 8000cb8:	f7ff fe72 	bl	80009a0 <RCC_APB1PeriphClockCmd>
 8000cbc:	f8ad 4006 	strh.w	r4, [sp, #6]
 8000cc0:	f8ad 400c 	strh.w	r4, [sp, #12]
 8000cc4:	f88d 400e 	strb.w	r4, [sp, #14]
 8000cc8:	4c14      	ldr	r4, [pc, #80]	; (8000d1c <timer_init+0x90>)
 8000cca:	2353      	movs	r3, #83	; 0x53
 8000ccc:	f8ad 3004 	strh.w	r3, [sp, #4]
 8000cd0:	4620      	mov	r0, r4
 8000cd2:	2331      	movs	r3, #49	; 0x31
 8000cd4:	a901      	add	r1, sp, #4
 8000cd6:	9302      	str	r3, [sp, #8]
 8000cd8:	f7ff ff8a 	bl	8000bf0 <TIM_TimeBaseInit>
 8000cdc:	4620      	mov	r0, r4
 8000cde:	2101      	movs	r1, #1
 8000ce0:	f7ff ffc4 	bl	8000c6c <TIM_Cmd>
 8000ce4:	89a3      	ldrh	r3, [r4, #12]
 8000ce6:	b29b      	uxth	r3, r3
 8000ce8:	f043 0301 	orr.w	r3, r3, #1
 8000cec:	81a3      	strh	r3, [r4, #12]
 8000cee:	231e      	movs	r3, #30
 8000cf0:	f88d 3000 	strb.w	r3, [sp]
 8000cf4:	4668      	mov	r0, sp
 8000cf6:	2301      	movs	r3, #1
 8000cf8:	f88d 5001 	strb.w	r5, [sp, #1]
 8000cfc:	f88d 3002 	strb.w	r3, [sp, #2]
 8000d00:	f88d 3003 	strb.w	r3, [sp, #3]
 8000d04:	f7ff fe64 	bl	80009d0 <NVIC_Init>
 8000d08:	b005      	add	sp, #20
 8000d0a:	bd30      	pop	{r4, r5, pc}
 8000d0c:	20000b78 	.word	0x20000b78
 8000d10:	20000b6c 	.word	0x20000b6c
 8000d14:	20000b64 	.word	0x20000b64
 8000d18:	20000b74 	.word	0x20000b74
 8000d1c:	40000800 	.word	0x40000800

08000d20 <TIM4_IRQHandler>:
 8000d20:	2300      	movs	r3, #0
 8000d22:	4a10      	ldr	r2, [pc, #64]	; (8000d64 <TIM4_IRQHandler+0x44>)
 8000d24:	f832 1013 	ldrh.w	r1, [r2, r3, lsl #1]
 8000d28:	b289      	uxth	r1, r1
 8000d2a:	b129      	cbz	r1, 8000d38 <TIM4_IRQHandler+0x18>
 8000d2c:	f832 1013 	ldrh.w	r1, [r2, r3, lsl #1]
 8000d30:	b289      	uxth	r1, r1
 8000d32:	3901      	subs	r1, #1
 8000d34:	b289      	uxth	r1, r1
 8000d36:	e007      	b.n	8000d48 <TIM4_IRQHandler+0x28>
 8000d38:	490b      	ldr	r1, [pc, #44]	; (8000d68 <TIM4_IRQHandler+0x48>)
 8000d3a:	f831 1013 	ldrh.w	r1, [r1, r3, lsl #1]
 8000d3e:	b289      	uxth	r1, r1
 8000d40:	f822 1013 	strh.w	r1, [r2, r3, lsl #1]
 8000d44:	4a09      	ldr	r2, [pc, #36]	; (8000d6c <TIM4_IRQHandler+0x4c>)
 8000d46:	2101      	movs	r1, #1
 8000d48:	f822 1013 	strh.w	r1, [r2, r3, lsl #1]
 8000d4c:	3301      	adds	r3, #1
 8000d4e:	2b04      	cmp	r3, #4
 8000d50:	d1e7      	bne.n	8000d22 <TIM4_IRQHandler+0x2>
 8000d52:	4b07      	ldr	r3, [pc, #28]	; (8000d70 <TIM4_IRQHandler+0x50>)
 8000d54:	4807      	ldr	r0, [pc, #28]	; (8000d74 <TIM4_IRQHandler+0x54>)
 8000d56:	681a      	ldr	r2, [r3, #0]
 8000d58:	2101      	movs	r1, #1
 8000d5a:	3201      	adds	r2, #1
 8000d5c:	601a      	str	r2, [r3, #0]
 8000d5e:	f7ff bf91 	b.w	8000c84 <TIM_ClearITPendingBit>
 8000d62:	bf00      	nop
 8000d64:	20000b78 	.word	0x20000b78
 8000d68:	20000b6c 	.word	0x20000b6c
 8000d6c:	20000b64 	.word	0x20000b64
 8000d70:	20000b74 	.word	0x20000b74
 8000d74:	40000800 	.word	0x40000800

08000d78 <timer_get_time>:
 8000d78:	b082      	sub	sp, #8
 8000d7a:	b672      	cpsid	i
 8000d7c:	4b04      	ldr	r3, [pc, #16]	; (8000d90 <timer_get_time+0x18>)
 8000d7e:	681b      	ldr	r3, [r3, #0]
 8000d80:	9301      	str	r3, [sp, #4]
 8000d82:	b662      	cpsie	i
 8000d84:	9801      	ldr	r0, [sp, #4]
 8000d86:	230a      	movs	r3, #10
 8000d88:	fbb0 f0f3 	udiv	r0, r0, r3
 8000d8c:	b002      	add	sp, #8
 8000d8e:	4770      	bx	lr
 8000d90:	20000b74 	.word	0x20000b74

08000d94 <timer_delay_ms>:
 8000d94:	b513      	push	{r0, r1, r4, lr}
 8000d96:	4604      	mov	r4, r0
 8000d98:	f7ff ffee 	bl	8000d78 <timer_get_time>
 8000d9c:	4420      	add	r0, r4
 8000d9e:	9001      	str	r0, [sp, #4]
 8000da0:	9c01      	ldr	r4, [sp, #4]
 8000da2:	f7ff ffe9 	bl	8000d78 <timer_get_time>
 8000da6:	4284      	cmp	r4, r0
 8000da8:	d902      	bls.n	8000db0 <timer_delay_ms+0x1c>
 8000daa:	f7ff ff1d 	bl	8000be8 <sleep>
 8000dae:	e7f7      	b.n	8000da0 <timer_delay_ms+0xc>
 8000db0:	b002      	add	sp, #8
 8000db2:	bd10      	pop	{r4, pc}

08000db4 <gpio_init>:
 8000db4:	b513      	push	{r0, r1, r4, lr}
 8000db6:	2001      	movs	r0, #1
 8000db8:	4601      	mov	r1, r0
 8000dba:	f7ff fde5 	bl	8000988 <RCC_AHB1PeriphClockCmd>
 8000dbe:	2002      	movs	r0, #2
 8000dc0:	2101      	movs	r1, #1
 8000dc2:	f7ff fde1 	bl	8000988 <RCC_AHB1PeriphClockCmd>
 8000dc6:	2004      	movs	r0, #4
 8000dc8:	2101      	movs	r1, #1
 8000dca:	f7ff fddd 	bl	8000988 <RCC_AHB1PeriphClockCmd>
 8000dce:	2008      	movs	r0, #8
 8000dd0:	2101      	movs	r1, #1
 8000dd2:	f7ff fdd9 	bl	8000988 <RCC_AHB1PeriphClockCmd>
 8000dd6:	2010      	movs	r0, #16
 8000dd8:	2101      	movs	r1, #1
 8000dda:	f7ff fdd5 	bl	8000988 <RCC_AHB1PeriphClockCmd>
 8000dde:	2020      	movs	r0, #32
 8000de0:	2101      	movs	r1, #1
 8000de2:	f7ff fdd1 	bl	8000988 <RCC_AHB1PeriphClockCmd>
 8000de6:	4c0c      	ldr	r4, [pc, #48]	; (8000e18 <gpio_init+0x64>)
 8000de8:	f44f 4360 	mov.w	r3, #57344	; 0xe000
 8000dec:	9300      	str	r3, [sp, #0]
 8000dee:	2301      	movs	r3, #1
 8000df0:	f88d 3004 	strb.w	r3, [sp, #4]
 8000df4:	2203      	movs	r2, #3
 8000df6:	2300      	movs	r3, #0
 8000df8:	4620      	mov	r0, r4
 8000dfa:	4669      	mov	r1, sp
 8000dfc:	f88d 3006 	strb.w	r3, [sp, #6]
 8000e00:	f88d 3007 	strb.w	r3, [sp, #7]
 8000e04:	f88d 2005 	strb.w	r2, [sp, #5]
 8000e08:	f000 f814 	bl	8000e34 <GPIO_Init>
 8000e0c:	f44f 5300 	mov.w	r3, #8192	; 0x2000
 8000e10:	8363      	strh	r3, [r4, #26]
 8000e12:	b002      	add	sp, #8
 8000e14:	bd10      	pop	{r4, pc}
 8000e16:	bf00      	nop
 8000e18:	40021400 	.word	0x40021400

08000e1c <led_on>:
 8000e1c:	4b01      	ldr	r3, [pc, #4]	; (8000e24 <led_on+0x8>)
 8000e1e:	b280      	uxth	r0, r0
 8000e20:	8318      	strh	r0, [r3, #24]
 8000e22:	4770      	bx	lr
 8000e24:	40021400 	.word	0x40021400

08000e28 <led_off>:
 8000e28:	4b01      	ldr	r3, [pc, #4]	; (8000e30 <led_off+0x8>)
 8000e2a:	b280      	uxth	r0, r0
 8000e2c:	8358      	strh	r0, [r3, #26]
 8000e2e:	4770      	bx	lr
 8000e30:	40021400 	.word	0x40021400

08000e34 <GPIO_Init>:
 8000e34:	e92d 41f0 	stmdb	sp!, {r4, r5, r6, r7, r8, lr}
 8000e38:	680f      	ldr	r7, [r1, #0]
 8000e3a:	2300      	movs	r3, #0
 8000e3c:	2201      	movs	r2, #1
 8000e3e:	409a      	lsls	r2, r3
 8000e40:	ea02 0507 	and.w	r5, r2, r7
 8000e44:	4295      	cmp	r5, r2
 8000e46:	d131      	bne.n	8000eac <GPIO_Init+0x78>
 8000e48:	005a      	lsls	r2, r3, #1
 8000e4a:	2403      	movs	r4, #3
 8000e4c:	6806      	ldr	r6, [r0, #0]
 8000e4e:	4094      	lsls	r4, r2
 8000e50:	43e4      	mvns	r4, r4
 8000e52:	4026      	ands	r6, r4
 8000e54:	6006      	str	r6, [r0, #0]
 8000e56:	790e      	ldrb	r6, [r1, #4]
 8000e58:	f8d0 c000 	ldr.w	ip, [r0]
 8000e5c:	fa06 f802 	lsl.w	r8, r6, r2
 8000e60:	3e01      	subs	r6, #1
 8000e62:	b2f6      	uxtb	r6, r6
 8000e64:	ea48 0c0c 	orr.w	ip, r8, ip
 8000e68:	2e01      	cmp	r6, #1
 8000e6a:	f8c0 c000 	str.w	ip, [r0]
 8000e6e:	d814      	bhi.n	8000e9a <GPIO_Init+0x66>
 8000e70:	6886      	ldr	r6, [r0, #8]
 8000e72:	f891 c005 	ldrb.w	ip, [r1, #5]
 8000e76:	4026      	ands	r6, r4
 8000e78:	6086      	str	r6, [r0, #8]
 8000e7a:	6886      	ldr	r6, [r0, #8]
 8000e7c:	fa0c fc02 	lsl.w	ip, ip, r2
 8000e80:	ea4c 0606 	orr.w	r6, ip, r6
 8000e84:	6086      	str	r6, [r0, #8]
 8000e86:	6846      	ldr	r6, [r0, #4]
 8000e88:	ea26 0505 	bic.w	r5, r6, r5
 8000e8c:	6045      	str	r5, [r0, #4]
 8000e8e:	798d      	ldrb	r5, [r1, #6]
 8000e90:	6846      	ldr	r6, [r0, #4]
 8000e92:	409d      	lsls	r5, r3
 8000e94:	b2ad      	uxth	r5, r5
 8000e96:	4335      	orrs	r5, r6
 8000e98:	6045      	str	r5, [r0, #4]
 8000e9a:	68c5      	ldr	r5, [r0, #12]
 8000e9c:	402c      	ands	r4, r5
 8000e9e:	60c4      	str	r4, [r0, #12]
 8000ea0:	79cd      	ldrb	r5, [r1, #7]
 8000ea2:	68c4      	ldr	r4, [r0, #12]
 8000ea4:	fa05 f202 	lsl.w	r2, r5, r2
 8000ea8:	4322      	orrs	r2, r4
 8000eaa:	60c2      	str	r2, [r0, #12]
 8000eac:	3301      	adds	r3, #1
 8000eae:	2b10      	cmp	r3, #16
 8000eb0:	d1c4      	bne.n	8000e3c <GPIO_Init+0x8>
 8000eb2:	e8bd 81f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, pc}

08000eb6 <GPIO_PinAFConfig>:
 8000eb6:	f001 0307 	and.w	r3, r1, #7
 8000eba:	08c9      	lsrs	r1, r1, #3
 8000ebc:	eb00 0081 	add.w	r0, r0, r1, lsl #2
 8000ec0:	b510      	push	{r4, lr}
 8000ec2:	009b      	lsls	r3, r3, #2
 8000ec4:	6a04      	ldr	r4, [r0, #32]
 8000ec6:	210f      	movs	r1, #15
 8000ec8:	4099      	lsls	r1, r3
 8000eca:	ea24 0101 	bic.w	r1, r4, r1
 8000ece:	6201      	str	r1, [r0, #32]
 8000ed0:	6a01      	ldr	r1, [r0, #32]
 8000ed2:	409a      	lsls	r2, r3
 8000ed4:	4311      	orrs	r1, r2
 8000ed6:	6201      	str	r1, [r0, #32]
 8000ed8:	bd10      	pop	{r4, pc}
	...

08000edc <_init>:
 8000edc:	e1a0c00d 	mov	ip, sp
 8000ee0:	e92ddff8 	push	{r3, r4, r5, r6, r7, r8, r9, sl, fp, ip, lr, pc}
 8000ee4:	e24cb004 	sub	fp, ip, #4
 8000ee8:	e24bd028 	sub	sp, fp, #40	; 0x28
 8000eec:	e89d6ff0 	ldm	sp, {r4, r5, r6, r7, r8, r9, sl, fp, sp, lr}
 8000ef0:	e12fff1e 	bx	lr

08000ef4 <_fini>:
 8000ef4:	e1a0c00d 	mov	ip, sp
 8000ef8:	e92ddff8 	push	{r3, r4, r5, r6, r7, r8, r9, sl, fp, ip, lr, pc}
 8000efc:	e24cb004 	sub	fp, ip, #4
 8000f00:	e24bd028 	sub	sp, fp, #40	; 0x28
 8000f04:	e89d6ff0 	ldm	sp, {r4, r5, r6, r7, r8, r9, sl, fp, sp, lr}
 8000f08:	e12fff1e 	bx	lr
 8000f0c:	69647473 	.word	0x69647473
 8000f10:	6e69206f 	.word	0x6e69206f
 8000f14:	64207469 	.word	0x64207469
 8000f18:	0a656e6f 	.word	0x0a656e6f
 8000f1c:	00          	.byte	0x00
 8000f1d:	61          	.byte	0x61
 8000f1e:	6f6e      	.short	0x6f6e
 8000f20:	72656874 	.word	0x72656874
 8000f24:	69686320 	.word	0x69686320
 8000f28:	7420646c 	.word	0x7420646c
 8000f2c:	61657268 	.word	0x61657268
 8000f30:	72202c64 	.word	0x72202c64
 8000f34:	25207365 	.word	0x25207365
 8000f38:	74000a75 	.word	0x74000a75
 8000f3c:	61657268 	.word	0x61657268
 8000f40:	0a312064 	.word	0x0a312064
 8000f44:	65726300 	.word	0x65726300
 8000f48:	6e697461 	.word	0x6e697461
 8000f4c:	68632067 	.word	0x68632067
 8000f50:	20646c69 	.word	0x20646c69
 8000f54:	65726874 	.word	0x65726874
 8000f58:	000a6461 	.word	0x000a6461
 8000f5c:	65726874 	.word	0x65726874
 8000f60:	63206461 	.word	0x63206461
 8000f64:	74616572 	.word	0x74616572
 8000f68:	20676e69 	.word	0x20676e69
 8000f6c:	6f727265 	.word	0x6f727265
 8000f70:	77000a72 	.word	0x77000a72
 8000f74:	69746961 	.word	0x69746961
 8000f78:	6620676e 	.word	0x6620676e
 8000f7c:	7420726f 	.word	0x7420726f
 8000f80:	61657268 	.word	0x61657268
 8000f84:	75252064 	.word	0x75252064
 8000f88:	6e6f6420 	.word	0x6e6f6420
 8000f8c:	70000a65 	.word	0x70000a65
 8000f90:	6f697265 	.word	0x6f697265
 8000f94:	20636964 	.word	0x20636964
 8000f98:	65726874 	.word	0x65726874
 8000f9c:	000a6461 	.word	0x000a6461
 8000fa0:	6c65770a 	.word	0x6c65770a
 8000fa4:	656d6f63 	.word	0x656d6f63
 8000fa8:	206f7420 	.word	0x206f7420
 8000fac:	757a7553 	.word	0x757a7553
 8000fb0:	534f6168 	.word	0x534f6168
 8000fb4:	5e5f5e20 	.word	0x5e5f5e20
 8000fb8:	322e3220 	.word	0x322e3220
 8000fbc:	420a302e 	.word	0x420a302e
 8000fc0:	444c4955 	.word	0x444c4955
 8000fc4:	70655320 	.word	0x70655320
 8000fc8:	20362020 	.word	0x20362020
 8000fcc:	35313032 	.word	0x35313032
 8000fd0:	3a303120 	.word	0x3a303120
 8000fd4:	303a3135 	.word	0x303a3135
 8000fd8:	6d000a30 	.word	0x6d000a30
 8000fdc:	206e6961 	.word	0x206e6961
 8000fe0:	65726874 	.word	0x65726874
 8000fe4:	69206461 	.word	0x69206461
 8000fe8:	2c656c64 	.word	0x2c656c64
 8000fec:	74707520 	.word	0x74707520
 8000ff0:	20656d69 	.word	0x20656d69
 8000ff4:	000a7525 	.word	0x000a7525

08000ff8 <__EH_FRAME_BEGIN__>:
 8000ff8:	00000000                                ....
