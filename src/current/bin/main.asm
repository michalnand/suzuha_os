
bin/main.elf:     file format elf32-littlearm


Disassembly of section .text:

08000188 <thread_ending>:
 8000188:	b672      	cpsid	i
 800018a:	4b05      	ldr	r3, [pc, #20]	; (80001a0 <thread_ending+0x18>)
 800018c:	681a      	ldr	r2, [r3, #0]
 800018e:	4b05      	ldr	r3, [pc, #20]	; (80001a4 <thread_ending+0x1c>)
 8000190:	210c      	movs	r1, #12
 8000192:	fb01 3302 	mla	r3, r1, r2, r3
 8000196:	2200      	movs	r2, #0
 8000198:	605a      	str	r2, [r3, #4]
 800019a:	b662      	cpsie	i
 800019c:	bf00      	nop
 800019e:	e7fd      	b.n	800019c <thread_ending+0x14>
 80001a0:	20000094 	.word	0x20000094
 80001a4:	20000034 	.word	0x20000034

080001a8 <null_thread>:
 80001a8:	b508      	push	{r3, lr}
 80001aa:	f001 fced 	bl	8001b88 <sleep>
 80001ae:	e7fc      	b.n	80001aa <null_thread+0x2>

080001b0 <scheduler>:
 80001b0:	b570      	push	{r4, r5, r6, lr}
 80001b2:	2200      	movs	r2, #0
 80001b4:	4611      	mov	r1, r2
 80001b6:	4b15      	ldr	r3, [pc, #84]	; (800020c <scheduler+0x5c>)
 80001b8:	200c      	movs	r0, #12
 80001ba:	fb00 f401 	mul.w	r4, r0, r1
 80001be:	191e      	adds	r6, r3, r4
 80001c0:	6875      	ldr	r5, [r6, #4]
 80001c2:	f015 0f02 	tst.w	r5, #2
 80001c6:	461d      	mov	r5, r3
 80001c8:	d10a      	bne.n	80001e0 <scheduler+0x30>
 80001ca:	6876      	ldr	r6, [r6, #4]
 80001cc:	07f6      	lsls	r6, r6, #31
 80001ce:	d507      	bpl.n	80001e0 <scheduler+0x30>
 80001d0:	4350      	muls	r0, r2
 80001d2:	5b1c      	ldrh	r4, [r3, r4]
 80001d4:	5a18      	ldrh	r0, [r3, r0]
 80001d6:	b2a4      	uxth	r4, r4
 80001d8:	b280      	uxth	r0, r0
 80001da:	4284      	cmp	r4, r0
 80001dc:	bf38      	it	cc
 80001de:	460a      	movcc	r2, r1
 80001e0:	200c      	movs	r0, #12
 80001e2:	4348      	muls	r0, r1
 80001e4:	5a1c      	ldrh	r4, [r3, r0]
 80001e6:	b2a4      	uxth	r4, r4
 80001e8:	b11c      	cbz	r4, 80001f2 <scheduler+0x42>
 80001ea:	5a1c      	ldrh	r4, [r3, r0]
 80001ec:	3c01      	subs	r4, #1
 80001ee:	b2a4      	uxth	r4, r4
 80001f0:	521c      	strh	r4, [r3, r0]
 80001f2:	3101      	adds	r1, #1
 80001f4:	2908      	cmp	r1, #8
 80001f6:	d1de      	bne.n	80001b6 <scheduler+0x6>
 80001f8:	230c      	movs	r3, #12
 80001fa:	4353      	muls	r3, r2
 80001fc:	18e9      	adds	r1, r5, r3
 80001fe:	8849      	ldrh	r1, [r1, #2]
 8000200:	b289      	uxth	r1, r1
 8000202:	52e9      	strh	r1, [r5, r3]
 8000204:	4b02      	ldr	r3, [pc, #8]	; (8000210 <scheduler+0x60>)
 8000206:	601a      	str	r2, [r3, #0]
 8000208:	bd70      	pop	{r4, r5, r6, pc}
 800020a:	bf00      	nop
 800020c:	20000034 	.word	0x20000034
 8000210:	20000094 	.word	0x20000094

08000214 <SysTick_Handler>:
 8000214:	e92d 0ff0 	stmdb	sp!, {r4, r5, r6, r7, r8, r9, sl, fp}
 8000218:	f3ef 8308 	mrs	r3, MSP
 800021c:	4c0d      	ldr	r4, [pc, #52]	; (8000254 <SysTick_Handler+0x40>)
 800021e:	4d0e      	ldr	r5, [pc, #56]	; (8000258 <SysTick_Handler+0x44>)
 8000220:	6822      	ldr	r2, [r4, #0]
 8000222:	3201      	adds	r2, #1
 8000224:	bf1d      	ittte	ne
 8000226:	6822      	ldrne	r2, [r4, #0]
 8000228:	210c      	movne	r1, #12
 800022a:	fb01 5202 	mlane	r2, r1, r2, r5
 800022e:	2300      	moveq	r3, #0
 8000230:	bf14      	ite	ne
 8000232:	6093      	strne	r3, [r2, #8]
 8000234:	6023      	streq	r3, [r4, #0]
 8000236:	f7ff ffbb 	bl	80001b0 <scheduler>
 800023a:	6822      	ldr	r2, [r4, #0]
 800023c:	230c      	movs	r3, #12
 800023e:	fb03 5302 	mla	r3, r3, r2, r5
 8000242:	689a      	ldr	r2, [r3, #8]
 8000244:	f06f 0306 	mvn.w	r3, #6
 8000248:	469e      	mov	lr, r3
 800024a:	f382 8808 	msr	MSP, r2
 800024e:	e8bd 0ff0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, fp}
 8000252:	4770      	bx	lr
 8000254:	20000094 	.word	0x20000094
 8000258:	20000034 	.word	0x20000034

0800025c <sched_off>:
 800025c:	b672      	cpsid	i
 800025e:	4770      	bx	lr

08000260 <sched_on>:
 8000260:	b662      	cpsie	i
 8000262:	4770      	bx	lr

08000264 <yield>:
 8000264:	4770      	bx	lr
	...

08000268 <get_thread_id>:
 8000268:	b082      	sub	sp, #8
 800026a:	b672      	cpsid	i
 800026c:	4b03      	ldr	r3, [pc, #12]	; (800027c <get_thread_id+0x14>)
 800026e:	681b      	ldr	r3, [r3, #0]
 8000270:	9301      	str	r3, [sp, #4]
 8000272:	b662      	cpsie	i
 8000274:	9801      	ldr	r0, [sp, #4]
 8000276:	b002      	add	sp, #8
 8000278:	4770      	bx	lr
 800027a:	bf00      	nop
 800027c:	20000094 	.word	0x20000094

08000280 <kernel_start>:
 8000280:	b508      	push	{r3, lr}
 8000282:	f001 fc6f 	bl	8001b64 <sys_tick_init>
 8000286:	bf00      	nop
 8000288:	e7fd      	b.n	8000286 <kernel_start+0x6>
	...

0800028c <create_thread>:
 800028c:	f022 0203 	bic.w	r2, r2, #3
 8000290:	3a40      	subs	r2, #64	; 0x40
 8000292:	e92d 41f0 	stmdb	sp!, {r4, r5, r6, r7, r8, lr}
 8000296:	eb01 0e02 	add.w	lr, r1, r2
 800029a:	f102 0634 	add.w	r6, r2, #52	; 0x34
 800029e:	f102 0738 	add.w	r7, r2, #56	; 0x38
 80002a2:	323c      	adds	r2, #60	; 0x3c
 80002a4:	440e      	add	r6, r1
 80002a6:	440f      	add	r7, r1
 80002a8:	4411      	add	r1, r2
 80002aa:	2200      	movs	r2, #0
 80002ac:	b672      	cpsid	i
 80002ae:	f8df c054 	ldr.w	ip, [pc, #84]	; 8000304 <create_thread+0x78>
 80002b2:	250c      	movs	r5, #12
 80002b4:	4355      	muls	r5, r2
 80002b6:	eb0c 0405 	add.w	r4, ip, r5
 80002ba:	f8d4 8004 	ldr.w	r8, [r4, #4]
 80002be:	f018 0f01 	tst.w	r8, #1
 80002c2:	d114      	bne.n	80002ee <create_thread+0x62>
 80002c4:	f8df 8040 	ldr.w	r8, [pc, #64]	; 8000308 <create_thread+0x7c>
 80002c8:	f8c4 e008 	str.w	lr, [r4, #8]
 80002cc:	2b07      	cmp	r3, #7
 80002ce:	f8c6 8000 	str.w	r8, [r6]
 80002d2:	bf98      	it	ls
 80002d4:	2308      	movls	r3, #8
 80002d6:	f04f 5804 	mov.w	r8, #553648128	; 0x21000000
 80002da:	6038      	str	r0, [r7, #0]
 80002dc:	f8c1 8000 	str.w	r8, [r1]
 80002e0:	8063      	strh	r3, [r4, #2]
 80002e2:	f82c 3005 	strh.w	r3, [ip, r5]
 80002e6:	2501      	movs	r5, #1
 80002e8:	6065      	str	r5, [r4, #4]
 80002ea:	4614      	mov	r4, r2
 80002ec:	e000      	b.n	80002f0 <create_thread+0x64>
 80002ee:	2408      	movs	r4, #8
 80002f0:	b662      	cpsie	i
 80002f2:	3201      	adds	r2, #1
 80002f4:	2a08      	cmp	r2, #8
 80002f6:	d001      	beq.n	80002fc <create_thread+0x70>
 80002f8:	2c08      	cmp	r4, #8
 80002fa:	d0d7      	beq.n	80002ac <create_thread+0x20>
 80002fc:	4620      	mov	r0, r4
 80002fe:	e8bd 81f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, pc}
 8000302:	bf00      	nop
 8000304:	20000034 	.word	0x20000034
 8000308:	08000189 	.word	0x08000189

0800030c <kernel_init>:
 800030c:	b510      	push	{r4, lr}
 800030e:	2300      	movs	r3, #0
 8000310:	490b      	ldr	r1, [pc, #44]	; (8000340 <kernel_init+0x34>)
 8000312:	220c      	movs	r2, #12
 8000314:	435a      	muls	r2, r3
 8000316:	188c      	adds	r4, r1, r2
 8000318:	2000      	movs	r0, #0
 800031a:	6060      	str	r0, [r4, #4]
 800031c:	3301      	adds	r3, #1
 800031e:	2008      	movs	r0, #8
 8000320:	4283      	cmp	r3, r0
 8000322:	8060      	strh	r0, [r4, #2]
 8000324:	5288      	strh	r0, [r1, r2]
 8000326:	d1f3      	bne.n	8000310 <kernel_init+0x4>
 8000328:	4b06      	ldr	r3, [pc, #24]	; (8000344 <kernel_init+0x38>)
 800032a:	4807      	ldr	r0, [pc, #28]	; (8000348 <kernel_init+0x3c>)
 800032c:	4907      	ldr	r1, [pc, #28]	; (800034c <kernel_init+0x40>)
 800032e:	f04f 32ff 	mov.w	r2, #4294967295	; 0xffffffff
 8000332:	601a      	str	r2, [r3, #0]
 8000334:	e8bd 4010 	ldmia.w	sp!, {r4, lr}
 8000338:	2280      	movs	r2, #128	; 0x80
 800033a:	23ff      	movs	r3, #255	; 0xff
 800033c:	f7ff bfa6 	b.w	800028c <create_thread>
 8000340:	20000034 	.word	0x20000034
 8000344:	20000094 	.word	0x20000094
 8000348:	080001a9 	.word	0x080001a9
 800034c:	20000098 	.word	0x20000098

08000350 <set_wait_state>:
 8000350:	b507      	push	{r0, r1, r2, lr}
 8000352:	f7ff ff89 	bl	8000268 <get_thread_id>
 8000356:	9000      	str	r0, [sp, #0]
 8000358:	b672      	cpsid	i
 800035a:	4b0c      	ldr	r3, [pc, #48]	; (800038c <set_wait_state+0x3c>)
 800035c:	9a00      	ldr	r2, [sp, #0]
 800035e:	210c      	movs	r1, #12
 8000360:	fb01 3202 	mla	r2, r1, r2, r3
 8000364:	6851      	ldr	r1, [r2, #4]
 8000366:	f041 0102 	orr.w	r1, r1, #2
 800036a:	6051      	str	r1, [r2, #4]
 800036c:	b672      	cpsid	i
 800036e:	9a00      	ldr	r2, [sp, #0]
 8000370:	210c      	movs	r1, #12
 8000372:	fb01 3202 	mla	r2, r1, r2, r3
 8000376:	6852      	ldr	r2, [r2, #4]
 8000378:	9201      	str	r2, [sp, #4]
 800037a:	b662      	cpsie	i
 800037c:	9a01      	ldr	r2, [sp, #4]
 800037e:	9a01      	ldr	r2, [sp, #4]
 8000380:	0792      	lsls	r2, r2, #30
 8000382:	d4f3      	bmi.n	800036c <set_wait_state+0x1c>
 8000384:	b003      	add	sp, #12
 8000386:	f85d fb04 	ldr.w	pc, [sp], #4
 800038a:	bf00      	nop
 800038c:	20000034 	.word	0x20000034

08000390 <wake_up_threads>:
 8000390:	2300      	movs	r3, #0
 8000392:	b672      	cpsid	i
 8000394:	4906      	ldr	r1, [pc, #24]	; (80003b0 <wake_up_threads+0x20>)
 8000396:	220c      	movs	r2, #12
 8000398:	fb02 1203 	mla	r2, r2, r3, r1
 800039c:	6851      	ldr	r1, [r2, #4]
 800039e:	f021 0102 	bic.w	r1, r1, #2
 80003a2:	6051      	str	r1, [r2, #4]
 80003a4:	b662      	cpsie	i
 80003a6:	3301      	adds	r3, #1
 80003a8:	2b08      	cmp	r3, #8
 80003aa:	d1f2      	bne.n	8000392 <wake_up_threads+0x2>
 80003ac:	4770      	bx	lr
 80003ae:	bf00      	nop
 80003b0:	20000034 	.word	0x20000034

080003b4 <messages_init>:
 80003b4:	b510      	push	{r4, lr}
 80003b6:	2200      	movs	r2, #0
 80003b8:	4909      	ldr	r1, [pc, #36]	; (80003e0 <messages_init+0x2c>)
 80003ba:	2300      	movs	r3, #0
 80003bc:	f841 3022 	str.w	r3, [r1, r2, lsl #2]
 80003c0:	3201      	adds	r2, #1
 80003c2:	2a08      	cmp	r2, #8
 80003c4:	d1f8      	bne.n	80003b8 <messages_init+0x4>
 80003c6:	4c07      	ldr	r4, [pc, #28]	; (80003e4 <messages_init+0x30>)
 80003c8:	0118      	lsls	r0, r3, #4
 80003ca:	1821      	adds	r1, r4, r0
 80003cc:	3301      	adds	r3, #1
 80003ce:	2200      	movs	r2, #0
 80003d0:	2b04      	cmp	r3, #4
 80003d2:	604a      	str	r2, [r1, #4]
 80003d4:	5022      	str	r2, [r4, r0]
 80003d6:	60ca      	str	r2, [r1, #12]
 80003d8:	608a      	str	r2, [r1, #8]
 80003da:	d1f4      	bne.n	80003c6 <messages_init+0x12>
 80003dc:	bd10      	pop	{r4, pc}
 80003de:	bf00      	nop
 80003e0:	20000118 	.word	0x20000118
 80003e4:	20000138 	.word	0x20000138

080003e8 <putc_>:
 80003e8:	b538      	push	{r3, r4, r5, lr}
 80003ea:	4c06      	ldr	r4, [pc, #24]	; (8000404 <putc_+0x1c>)
 80003ec:	4605      	mov	r5, r0
 80003ee:	4620      	mov	r0, r4
 80003f0:	f000 f901 	bl	80005f6 <mutex_lock>
 80003f4:	4628      	mov	r0, r5
 80003f6:	f001 f99b 	bl	8001730 <uart_write>
 80003fa:	4620      	mov	r0, r4
 80003fc:	e8bd 4038 	ldmia.w	sp!, {r3, r4, r5, lr}
 8000400:	f000 b915 	b.w	800062e <mutex_unlock>
 8000404:	20000178 	.word	0x20000178

08000408 <puts_>:
 8000408:	b510      	push	{r4, lr}
 800040a:	4604      	mov	r4, r0
 800040c:	4807      	ldr	r0, [pc, #28]	; (800042c <puts_+0x24>)
 800040e:	f000 f8f2 	bl	80005f6 <mutex_lock>
 8000412:	3c01      	subs	r4, #1
 8000414:	f814 0f01 	ldrb.w	r0, [r4, #1]!
 8000418:	b110      	cbz	r0, 8000420 <puts_+0x18>
 800041a:	f7ff ffe5 	bl	80003e8 <putc_>
 800041e:	e7f9      	b.n	8000414 <puts_+0xc>
 8000420:	4802      	ldr	r0, [pc, #8]	; (800042c <puts_+0x24>)
 8000422:	e8bd 4010 	ldmia.w	sp!, {r4, lr}
 8000426:	f000 b902 	b.w	800062e <mutex_unlock>
 800042a:	bf00      	nop
 800042c:	20000184 	.word	0x20000184

08000430 <puti_>:
 8000430:	b530      	push	{r4, r5, lr}
 8000432:	b085      	sub	sp, #20
 8000434:	1e03      	subs	r3, r0, #0
 8000436:	f04f 0200 	mov.w	r2, #0
 800043a:	bfba      	itte	lt
 800043c:	425b      	neglt	r3, r3
 800043e:	2401      	movlt	r4, #1
 8000440:	4614      	movge	r4, r2
 8000442:	f88d 200f 	strb.w	r2, [sp, #15]
 8000446:	210a      	movs	r1, #10
 8000448:	220a      	movs	r2, #10
 800044a:	a801      	add	r0, sp, #4
 800044c:	fb93 f5f2 	sdiv	r5, r3, r2
 8000450:	fb02 3315 	mls	r3, r2, r5, r3
 8000454:	3330      	adds	r3, #48	; 0x30
 8000456:	540b      	strb	r3, [r1, r0]
 8000458:	1e4a      	subs	r2, r1, #1
 800045a:	462b      	mov	r3, r5
 800045c:	b10d      	cbz	r5, 8000462 <puti_+0x32>
 800045e:	4611      	mov	r1, r2
 8000460:	e7f2      	b.n	8000448 <puti_+0x18>
 8000462:	b12c      	cbz	r4, 8000470 <puti_+0x40>
 8000464:	ab04      	add	r3, sp, #16
 8000466:	4413      	add	r3, r2
 8000468:	212d      	movs	r1, #45	; 0x2d
 800046a:	f803 1c0c 	strb.w	r1, [r3, #-12]
 800046e:	4611      	mov	r1, r2
 8000470:	4408      	add	r0, r1
 8000472:	f7ff ffc9 	bl	8000408 <puts_>
 8000476:	b005      	add	sp, #20
 8000478:	bd30      	pop	{r4, r5, pc}

0800047a <putui_>:
 800047a:	b51f      	push	{r0, r1, r2, r3, r4, lr}
 800047c:	2300      	movs	r3, #0
 800047e:	f88d 300f 	strb.w	r3, [sp, #15]
 8000482:	220a      	movs	r2, #10
 8000484:	230a      	movs	r3, #10
 8000486:	a901      	add	r1, sp, #4
 8000488:	fbb0 f4f3 	udiv	r4, r0, r3
 800048c:	fb03 0314 	mls	r3, r3, r4, r0
 8000490:	3330      	adds	r3, #48	; 0x30
 8000492:	5453      	strb	r3, [r2, r1]
 8000494:	4620      	mov	r0, r4
 8000496:	1e53      	subs	r3, r2, #1
 8000498:	b10c      	cbz	r4, 800049e <putui_+0x24>
 800049a:	461a      	mov	r2, r3
 800049c:	e7f2      	b.n	8000484 <putui_+0xa>
 800049e:	1888      	adds	r0, r1, r2
 80004a0:	f7ff ffb2 	bl	8000408 <puts_>
 80004a4:	b004      	add	sp, #16
 80004a6:	bd10      	pop	{r4, pc}

080004a8 <putx_>:
 80004a8:	b51f      	push	{r0, r1, r2, r3, r4, lr}
 80004aa:	2300      	movs	r3, #0
 80004ac:	f88d 300f 	strb.w	r3, [sp, #15]
 80004b0:	220a      	movs	r2, #10
 80004b2:	f000 030f 	and.w	r3, r0, #15
 80004b6:	2b09      	cmp	r3, #9
 80004b8:	a901      	add	r1, sp, #4
 80004ba:	bf94      	ite	ls
 80004bc:	3330      	addls	r3, #48	; 0x30
 80004be:	3357      	addhi	r3, #87	; 0x57
 80004c0:	0900      	lsrs	r0, r0, #4
 80004c2:	548b      	strb	r3, [r1, r2]
 80004c4:	f102 33ff 	add.w	r3, r2, #4294967295	; 0xffffffff
 80004c8:	d001      	beq.n	80004ce <putx_+0x26>
 80004ca:	461a      	mov	r2, r3
 80004cc:	e7f1      	b.n	80004b2 <putx_+0xa>
 80004ce:	1888      	adds	r0, r1, r2
 80004d0:	f7ff ff9a 	bl	8000408 <puts_>
 80004d4:	b005      	add	sp, #20
 80004d6:	f85d fb04 	ldr.w	pc, [sp], #4
	...

080004dc <printf_>:
 80004dc:	b40f      	push	{r0, r1, r2, r3}
 80004de:	b537      	push	{r0, r1, r2, r4, r5, lr}
 80004e0:	ac06      	add	r4, sp, #24
 80004e2:	4826      	ldr	r0, [pc, #152]	; (800057c <printf_+0xa0>)
 80004e4:	f854 5b04 	ldr.w	r5, [r4], #4
 80004e8:	f000 f885 	bl	80005f6 <mutex_lock>
 80004ec:	9401      	str	r4, [sp, #4]
 80004ee:	2400      	movs	r4, #0
 80004f0:	5d28      	ldrb	r0, [r5, r4]
 80004f2:	2800      	cmp	r0, #0
 80004f4:	d039      	beq.n	800056a <printf_+0x8e>
 80004f6:	2825      	cmp	r0, #37	; 0x25
 80004f8:	d003      	beq.n	8000502 <printf_+0x26>
 80004fa:	f7ff ff75 	bl	80003e8 <putc_>
 80004fe:	3401      	adds	r4, #1
 8000500:	e7f6      	b.n	80004f0 <printf_+0x14>
 8000502:	192b      	adds	r3, r5, r4
 8000504:	7858      	ldrb	r0, [r3, #1]
 8000506:	2869      	cmp	r0, #105	; 0x69
 8000508:	d016      	beq.n	8000538 <printf_+0x5c>
 800050a:	d808      	bhi.n	800051e <printf_+0x42>
 800050c:	2825      	cmp	r0, #37	; 0x25
 800050e:	d028      	beq.n	8000562 <printf_+0x86>
 8000510:	2863      	cmp	r0, #99	; 0x63
 8000512:	d128      	bne.n	8000566 <printf_+0x8a>
 8000514:	9b01      	ldr	r3, [sp, #4]
 8000516:	1d1a      	adds	r2, r3, #4
 8000518:	9201      	str	r2, [sp, #4]
 800051a:	7818      	ldrb	r0, [r3, #0]
 800051c:	e021      	b.n	8000562 <printf_+0x86>
 800051e:	2875      	cmp	r0, #117	; 0x75
 8000520:	d011      	beq.n	8000546 <printf_+0x6a>
 8000522:	2878      	cmp	r0, #120	; 0x78
 8000524:	d016      	beq.n	8000554 <printf_+0x78>
 8000526:	2873      	cmp	r0, #115	; 0x73
 8000528:	d11d      	bne.n	8000566 <printf_+0x8a>
 800052a:	9b01      	ldr	r3, [sp, #4]
 800052c:	1d1a      	adds	r2, r3, #4
 800052e:	6818      	ldr	r0, [r3, #0]
 8000530:	9201      	str	r2, [sp, #4]
 8000532:	f7ff ff69 	bl	8000408 <puts_>
 8000536:	e016      	b.n	8000566 <printf_+0x8a>
 8000538:	9b01      	ldr	r3, [sp, #4]
 800053a:	1d1a      	adds	r2, r3, #4
 800053c:	6818      	ldr	r0, [r3, #0]
 800053e:	9201      	str	r2, [sp, #4]
 8000540:	f7ff ff76 	bl	8000430 <puti_>
 8000544:	e00f      	b.n	8000566 <printf_+0x8a>
 8000546:	9b01      	ldr	r3, [sp, #4]
 8000548:	1d1a      	adds	r2, r3, #4
 800054a:	6818      	ldr	r0, [r3, #0]
 800054c:	9201      	str	r2, [sp, #4]
 800054e:	f7ff ff94 	bl	800047a <putui_>
 8000552:	e008      	b.n	8000566 <printf_+0x8a>
 8000554:	9b01      	ldr	r3, [sp, #4]
 8000556:	1d1a      	adds	r2, r3, #4
 8000558:	6818      	ldr	r0, [r3, #0]
 800055a:	9201      	str	r2, [sp, #4]
 800055c:	f7ff ffa4 	bl	80004a8 <putx_>
 8000560:	e001      	b.n	8000566 <printf_+0x8a>
 8000562:	f7ff ff41 	bl	80003e8 <putc_>
 8000566:	3402      	adds	r4, #2
 8000568:	e7c2      	b.n	80004f0 <printf_+0x14>
 800056a:	4804      	ldr	r0, [pc, #16]	; (800057c <printf_+0xa0>)
 800056c:	f000 f85f 	bl	800062e <mutex_unlock>
 8000570:	b003      	add	sp, #12
 8000572:	e8bd 4030 	ldmia.w	sp!, {r4, r5, lr}
 8000576:	b004      	add	sp, #16
 8000578:	4770      	bx	lr
 800057a:	bf00      	nop
 800057c:	20000180 	.word	0x20000180

08000580 <stdio_init>:
 8000580:	b510      	push	{r4, lr}
 8000582:	480e      	ldr	r0, [pc, #56]	; (80005bc <stdio_init+0x3c>)
 8000584:	f000 f82d 	bl	80005e2 <mutex_init>
 8000588:	480d      	ldr	r0, [pc, #52]	; (80005c0 <stdio_init+0x40>)
 800058a:	f000 f82a 	bl	80005e2 <mutex_init>
 800058e:	480d      	ldr	r0, [pc, #52]	; (80005c4 <stdio_init+0x44>)
 8000590:	f000 f827 	bl	80005e2 <mutex_init>
 8000594:	480c      	ldr	r0, [pc, #48]	; (80005c8 <stdio_init+0x48>)
 8000596:	f000 f824 	bl	80005e2 <mutex_init>
 800059a:	2408      	movs	r4, #8
 800059c:	2020      	movs	r0, #32
 800059e:	f7ff ff23 	bl	80003e8 <putc_>
 80005a2:	3c01      	subs	r4, #1
 80005a4:	d1fa      	bne.n	800059c <stdio_init+0x1c>
 80005a6:	2420      	movs	r4, #32
 80005a8:	200a      	movs	r0, #10
 80005aa:	f7ff ff1d 	bl	80003e8 <putc_>
 80005ae:	3c01      	subs	r4, #1
 80005b0:	d1fa      	bne.n	80005a8 <stdio_init+0x28>
 80005b2:	4806      	ldr	r0, [pc, #24]	; (80005cc <stdio_init+0x4c>)
 80005b4:	e8bd 4010 	ldmia.w	sp!, {r4, lr}
 80005b8:	f7ff bf90 	b.w	80004dc <printf_>
 80005bc:	20000178 	.word	0x20000178
 80005c0:	2000017c 	.word	0x2000017c
 80005c4:	20000184 	.word	0x20000184
 80005c8:	20000180 	.word	0x20000180
 80005cc:	0800200c 	.word	0x0800200c

080005d0 <lib_os_init>:
 80005d0:	b508      	push	{r3, lr}
 80005d2:	f7ff fe9b 	bl	800030c <kernel_init>
 80005d6:	f7ff feed 	bl	80003b4 <messages_init>
 80005da:	e8bd 4008 	ldmia.w	sp!, {r3, lr}
 80005de:	f7ff bfcf 	b.w	8000580 <stdio_init>

080005e2 <mutex_init>:
 80005e2:	b510      	push	{r4, lr}
 80005e4:	4604      	mov	r4, r0
 80005e6:	f7ff fe39 	bl	800025c <sched_off>
 80005ea:	2300      	movs	r3, #0
 80005ec:	6023      	str	r3, [r4, #0]
 80005ee:	e8bd 4010 	ldmia.w	sp!, {r4, lr}
 80005f2:	f7ff be35 	b.w	8000260 <sched_on>

080005f6 <mutex_lock>:
 80005f6:	b513      	push	{r0, r1, r4, lr}
 80005f8:	4604      	mov	r4, r0
 80005fa:	f7ff fe2f 	bl	800025c <sched_off>
 80005fe:	6823      	ldr	r3, [r4, #0]
 8000600:	9301      	str	r3, [sp, #4]
 8000602:	f7ff fe2d 	bl	8000260 <sched_on>
 8000606:	9b01      	ldr	r3, [sp, #4]
 8000608:	b10b      	cbz	r3, 800060e <mutex_lock+0x18>
 800060a:	f7ff fea1 	bl	8000350 <set_wait_state>
 800060e:	9b01      	ldr	r3, [sp, #4]
 8000610:	2b00      	cmp	r3, #0
 8000612:	d1f2      	bne.n	80005fa <mutex_lock+0x4>
 8000614:	f7ff fe22 	bl	800025c <sched_off>
 8000618:	6823      	ldr	r3, [r4, #0]
 800061a:	9301      	str	r3, [sp, #4]
 800061c:	9b01      	ldr	r3, [sp, #4]
 800061e:	2b00      	cmp	r3, #0
 8000620:	d1eb      	bne.n	80005fa <mutex_lock+0x4>
 8000622:	2301      	movs	r3, #1
 8000624:	6023      	str	r3, [r4, #0]
 8000626:	f7ff fe1b 	bl	8000260 <sched_on>
 800062a:	b002      	add	sp, #8
 800062c:	bd10      	pop	{r4, pc}

0800062e <mutex_unlock>:
 800062e:	b508      	push	{r3, lr}
 8000630:	f7ff ffd7 	bl	80005e2 <mutex_init>
 8000634:	f7ff feac 	bl	8000390 <wake_up_threads>
 8000638:	e8bd 4008 	ldmia.w	sp!, {r3, lr}
 800063c:	f7ff be12 	b.w	8000264 <yield>

08000640 <get_g_hmc5883>:
 8000640:	4800      	ldr	r0, [pc, #0]	; (8000644 <get_g_hmc5883+0x4>)
 8000642:	4770      	bx	lr
 8000644:	20000188 	.word	0x20000188

08000648 <hmc5883_init>:
 8000648:	b510      	push	{r4, lr}
 800064a:	4b16      	ldr	r3, [pc, #88]	; (80006a4 <hmc5883_init+0x5c>)
 800064c:	2400      	movs	r4, #0
 800064e:	203c      	movs	r0, #60	; 0x3c
 8000650:	4621      	mov	r1, r4
 8000652:	2218      	movs	r2, #24
 8000654:	801c      	strh	r4, [r3, #0]
 8000656:	805c      	strh	r4, [r3, #2]
 8000658:	809c      	strh	r4, [r3, #4]
 800065a:	f001 f9d9 	bl	8001a10 <i2c_write_reg>
 800065e:	203c      	movs	r0, #60	; 0x3c
 8000660:	2101      	movs	r1, #1
 8000662:	4622      	mov	r2, r4
 8000664:	f001 f9d4 	bl	8001a10 <i2c_write_reg>
 8000668:	203c      	movs	r0, #60	; 0x3c
 800066a:	2102      	movs	r1, #2
 800066c:	4622      	mov	r2, r4
 800066e:	f001 f9cf 	bl	8001a10 <i2c_write_reg>
 8000672:	203c      	movs	r0, #60	; 0x3c
 8000674:	210a      	movs	r1, #10
 8000676:	f001 f9de 	bl	8001a36 <i2c_read_reg>
 800067a:	2848      	cmp	r0, #72	; 0x48
 800067c:	d10e      	bne.n	800069c <hmc5883_init+0x54>
 800067e:	203c      	movs	r0, #60	; 0x3c
 8000680:	210b      	movs	r1, #11
 8000682:	f001 f9d8 	bl	8001a36 <i2c_read_reg>
 8000686:	2834      	cmp	r0, #52	; 0x34
 8000688:	d10a      	bne.n	80006a0 <hmc5883_init+0x58>
 800068a:	210c      	movs	r1, #12
 800068c:	203c      	movs	r0, #60	; 0x3c
 800068e:	f001 f9d2 	bl	8001a36 <i2c_read_reg>
 8000692:	2833      	cmp	r0, #51	; 0x33
 8000694:	bf14      	ite	ne
 8000696:	2003      	movne	r0, #3
 8000698:	4620      	moveq	r0, r4
 800069a:	bd10      	pop	{r4, pc}
 800069c:	2001      	movs	r0, #1
 800069e:	bd10      	pop	{r4, pc}
 80006a0:	2002      	movs	r0, #2
 80006a2:	bd10      	pop	{r4, pc}
 80006a4:	20000188 	.word	0x20000188

080006a8 <hmc5883_read>:
 80006a8:	b510      	push	{r4, lr}
 80006aa:	2103      	movs	r1, #3
 80006ac:	203c      	movs	r0, #60	; 0x3c
 80006ae:	f001 f9c2 	bl	8001a36 <i2c_read_reg>
 80006b2:	4c12      	ldr	r4, [pc, #72]	; (80006fc <hmc5883_read+0x54>)
 80006b4:	0200      	lsls	r0, r0, #8
 80006b6:	8020      	strh	r0, [r4, #0]
 80006b8:	2104      	movs	r1, #4
 80006ba:	203c      	movs	r0, #60	; 0x3c
 80006bc:	f001 f9bb 	bl	8001a36 <i2c_read_reg>
 80006c0:	8823      	ldrh	r3, [r4, #0]
 80006c2:	4318      	orrs	r0, r3
 80006c4:	8020      	strh	r0, [r4, #0]
 80006c6:	2107      	movs	r1, #7
 80006c8:	203c      	movs	r0, #60	; 0x3c
 80006ca:	f001 f9b4 	bl	8001a36 <i2c_read_reg>
 80006ce:	0200      	lsls	r0, r0, #8
 80006d0:	8060      	strh	r0, [r4, #2]
 80006d2:	2108      	movs	r1, #8
 80006d4:	203c      	movs	r0, #60	; 0x3c
 80006d6:	f001 f9ae 	bl	8001a36 <i2c_read_reg>
 80006da:	8863      	ldrh	r3, [r4, #2]
 80006dc:	4318      	orrs	r0, r3
 80006de:	8060      	strh	r0, [r4, #2]
 80006e0:	2105      	movs	r1, #5
 80006e2:	203c      	movs	r0, #60	; 0x3c
 80006e4:	f001 f9a7 	bl	8001a36 <i2c_read_reg>
 80006e8:	0200      	lsls	r0, r0, #8
 80006ea:	80a0      	strh	r0, [r4, #4]
 80006ec:	2106      	movs	r1, #6
 80006ee:	203c      	movs	r0, #60	; 0x3c
 80006f0:	f001 f9a1 	bl	8001a36 <i2c_read_reg>
 80006f4:	88a3      	ldrh	r3, [r4, #4]
 80006f6:	4318      	orrs	r0, r3
 80006f8:	80a0      	strh	r0, [r4, #4]
 80006fa:	bd10      	pop	{r4, pc}
 80006fc:	20000188 	.word	0x20000188

08000700 <get_g_apds9950>:
 8000700:	4800      	ldr	r0, [pc, #0]	; (8000704 <get_g_apds9950+0x4>)
 8000702:	4770      	bx	lr
 8000704:	2000018e 	.word	0x2000018e

08000708 <apds9950_read>:
 8000708:	b510      	push	{r4, lr}
 800070a:	f001 f916 	bl	800193a <i2cStart>
 800070e:	2072      	movs	r0, #114	; 0x72
 8000710:	f001 f931 	bl	8001976 <i2cWrite>
 8000714:	20b4      	movs	r0, #180	; 0xb4
 8000716:	f001 f92e 	bl	8001976 <i2cWrite>
 800071a:	f001 f90e 	bl	800193a <i2cStart>
 800071e:	2073      	movs	r0, #115	; 0x73
 8000720:	f001 f929 	bl	8001976 <i2cWrite>
 8000724:	2001      	movs	r0, #1
 8000726:	f001 f94d 	bl	80019c4 <i2cRead>
 800072a:	4c1c      	ldr	r4, [pc, #112]	; (800079c <apds9950_read+0x94>)
 800072c:	80e0      	strh	r0, [r4, #6]
 800072e:	2001      	movs	r0, #1
 8000730:	f001 f948 	bl	80019c4 <i2cRead>
 8000734:	88e3      	ldrh	r3, [r4, #6]
 8000736:	ea43 2000 	orr.w	r0, r3, r0, lsl #8
 800073a:	80e0      	strh	r0, [r4, #6]
 800073c:	2001      	movs	r0, #1
 800073e:	f001 f941 	bl	80019c4 <i2cRead>
 8000742:	8020      	strh	r0, [r4, #0]
 8000744:	2001      	movs	r0, #1
 8000746:	f001 f93d 	bl	80019c4 <i2cRead>
 800074a:	8823      	ldrh	r3, [r4, #0]
 800074c:	ea43 2000 	orr.w	r0, r3, r0, lsl #8
 8000750:	8020      	strh	r0, [r4, #0]
 8000752:	2001      	movs	r0, #1
 8000754:	f001 f936 	bl	80019c4 <i2cRead>
 8000758:	8060      	strh	r0, [r4, #2]
 800075a:	2001      	movs	r0, #1
 800075c:	f001 f932 	bl	80019c4 <i2cRead>
 8000760:	8863      	ldrh	r3, [r4, #2]
 8000762:	ea43 2000 	orr.w	r0, r3, r0, lsl #8
 8000766:	8060      	strh	r0, [r4, #2]
 8000768:	2001      	movs	r0, #1
 800076a:	f001 f92b 	bl	80019c4 <i2cRead>
 800076e:	80a0      	strh	r0, [r4, #4]
 8000770:	2001      	movs	r0, #1
 8000772:	f001 f927 	bl	80019c4 <i2cRead>
 8000776:	88a3      	ldrh	r3, [r4, #4]
 8000778:	ea43 2000 	orr.w	r0, r3, r0, lsl #8
 800077c:	80a0      	strh	r0, [r4, #4]
 800077e:	2001      	movs	r0, #1
 8000780:	f001 f920 	bl	80019c4 <i2cRead>
 8000784:	8120      	strh	r0, [r4, #8]
 8000786:	2000      	movs	r0, #0
 8000788:	f001 f91c 	bl	80019c4 <i2cRead>
 800078c:	8923      	ldrh	r3, [r4, #8]
 800078e:	ea43 2000 	orr.w	r0, r3, r0, lsl #8
 8000792:	8120      	strh	r0, [r4, #8]
 8000794:	e8bd 4010 	ldmia.w	sp!, {r4, lr}
 8000798:	f001 b8de 	b.w	8001958 <i2cStop>
 800079c:	2000018e 	.word	0x2000018e

080007a0 <apds950_init>:
 80007a0:	b508      	push	{r3, lr}
 80007a2:	2072      	movs	r0, #114	; 0x72
 80007a4:	2181      	movs	r1, #129	; 0x81
 80007a6:	22ff      	movs	r2, #255	; 0xff
 80007a8:	f001 f932 	bl	8001a10 <i2c_write_reg>
 80007ac:	2072      	movs	r0, #114	; 0x72
 80007ae:	2183      	movs	r1, #131	; 0x83
 80007b0:	22ff      	movs	r2, #255	; 0xff
 80007b2:	f001 f92d 	bl	8001a10 <i2c_write_reg>
 80007b6:	2072      	movs	r0, #114	; 0x72
 80007b8:	218d      	movs	r1, #141	; 0x8d
 80007ba:	2200      	movs	r2, #0
 80007bc:	f001 f928 	bl	8001a10 <i2c_write_reg>
 80007c0:	2072      	movs	r0, #114	; 0x72
 80007c2:	2180      	movs	r1, #128	; 0x80
 80007c4:	2203      	movs	r2, #3
 80007c6:	f001 f923 	bl	8001a10 <i2c_write_reg>
 80007ca:	2072      	movs	r0, #114	; 0x72
 80007cc:	218f      	movs	r1, #143	; 0x8f
 80007ce:	2223      	movs	r2, #35	; 0x23
 80007d0:	f001 f91e 	bl	8001a10 <i2c_write_reg>
 80007d4:	2072      	movs	r0, #114	; 0x72
 80007d6:	2180      	movs	r1, #128	; 0x80
 80007d8:	2207      	movs	r2, #7
 80007da:	f001 f919 	bl	8001a10 <i2c_write_reg>
 80007de:	2072      	movs	r0, #114	; 0x72
 80007e0:	218e      	movs	r1, #142	; 0x8e
 80007e2:	2208      	movs	r2, #8
 80007e4:	f001 f914 	bl	8001a10 <i2c_write_reg>
 80007e8:	f7ff ff8e 	bl	8000708 <apds9950_read>
 80007ec:	2000      	movs	r0, #0
 80007ee:	bd08      	pop	{r3, pc}

080007f0 <LCD_SH1106_write_command>:
 80007f0:	4602      	mov	r2, r0
 80007f2:	2100      	movs	r1, #0
 80007f4:	2078      	movs	r0, #120	; 0x78
 80007f6:	f001 b90b 	b.w	8001a10 <i2c_write_reg>

080007fa <LCD_SH1106_set_cursor>:
 80007fa:	b510      	push	{r4, lr}
 80007fc:	3950      	subs	r1, #80	; 0x50
 80007fe:	3002      	adds	r0, #2
 8000800:	b2c4      	uxtb	r4, r0
 8000802:	b2c8      	uxtb	r0, r1
 8000804:	f7ff fff4 	bl	80007f0 <LCD_SH1106_write_command>
 8000808:	f004 000f 	and.w	r0, r4, #15
 800080c:	f7ff fff0 	bl	80007f0 <LCD_SH1106_write_command>
 8000810:	0920      	lsrs	r0, r4, #4
 8000812:	f040 0010 	orr.w	r0, r0, #16
 8000816:	e8bd 4010 	ldmia.w	sp!, {r4, lr}
 800081a:	f7ff bfe9 	b.w	80007f0 <LCD_SH1106_write_command>
	...

08000820 <LCD_SH1106_set_pixel>:
 8000820:	b570      	push	{r4, r5, r6, lr}
 8000822:	460d      	mov	r5, r1
 8000824:	4604      	mov	r4, r0
 8000826:	4616      	mov	r6, r2
 8000828:	f7ff fd18 	bl	800025c <sched_off>
 800082c:	08e8      	lsrs	r0, r5, #3
 800082e:	4909      	ldr	r1, [pc, #36]	; (8000854 <LCD_SH1106_set_pixel+0x34>)
 8000830:	eb04 14c0 	add.w	r4, r4, r0, lsl #7
 8000834:	f005 0507 	and.w	r5, r5, #7
 8000838:	2301      	movs	r3, #1
 800083a:	5d0a      	ldrb	r2, [r1, r4]
 800083c:	40ab      	lsls	r3, r5
 800083e:	b116      	cbz	r6, 8000846 <LCD_SH1106_set_pixel+0x26>
 8000840:	4313      	orrs	r3, r2
 8000842:	b2db      	uxtb	r3, r3
 8000844:	e001      	b.n	800084a <LCD_SH1106_set_pixel+0x2a>
 8000846:	ea22 0303 	bic.w	r3, r2, r3
 800084a:	550b      	strb	r3, [r1, r4]
 800084c:	e8bd 4070 	ldmia.w	sp!, {r4, r5, r6, lr}
 8000850:	f7ff bd06 	b.w	8000260 <sched_on>
 8000854:	2000019a 	.word	0x2000019a

08000858 <LCD_SH1106_clear_buffer>:
 8000858:	b082      	sub	sp, #8
 800085a:	2300      	movs	r3, #0
 800085c:	9300      	str	r3, [sp, #0]
 800085e:	9b00      	ldr	r3, [sp, #0]
 8000860:	2b07      	cmp	r3, #7
 8000862:	d810      	bhi.n	8000886 <LCD_SH1106_clear_buffer+0x2e>
 8000864:	2300      	movs	r3, #0
 8000866:	9301      	str	r3, [sp, #4]
 8000868:	9b01      	ldr	r3, [sp, #4]
 800086a:	2b7f      	cmp	r3, #127	; 0x7f
 800086c:	d808      	bhi.n	8000880 <LCD_SH1106_clear_buffer+0x28>
 800086e:	9a00      	ldr	r2, [sp, #0]
 8000870:	9b01      	ldr	r3, [sp, #4]
 8000872:	eb03 13c2 	add.w	r3, r3, r2, lsl #7
 8000876:	4a05      	ldr	r2, [pc, #20]	; (800088c <LCD_SH1106_clear_buffer+0x34>)
 8000878:	54d0      	strb	r0, [r2, r3]
 800087a:	9b01      	ldr	r3, [sp, #4]
 800087c:	3301      	adds	r3, #1
 800087e:	e7f2      	b.n	8000866 <LCD_SH1106_clear_buffer+0xe>
 8000880:	9b00      	ldr	r3, [sp, #0]
 8000882:	3301      	adds	r3, #1
 8000884:	e7ea      	b.n	800085c <LCD_SH1106_clear_buffer+0x4>
 8000886:	b002      	add	sp, #8
 8000888:	4770      	bx	lr
 800088a:	bf00      	nop
 800088c:	2000019a 	.word	0x2000019a

08000890 <LCD_SH1106_flush_buffer>:
 8000890:	b530      	push	{r4, r5, lr}
 8000892:	2000      	movs	r0, #0
 8000894:	b085      	sub	sp, #20
 8000896:	f7ff ffab 	bl	80007f0 <LCD_SH1106_write_command>
 800089a:	2010      	movs	r0, #16
 800089c:	f7ff ffa8 	bl	80007f0 <LCD_SH1106_write_command>
 80008a0:	2040      	movs	r0, #64	; 0x40
 80008a2:	f7ff ffa5 	bl	80007f0 <LCD_SH1106_write_command>
 80008a6:	2300      	movs	r3, #0
 80008a8:	9301      	str	r3, [sp, #4]
 80008aa:	9b01      	ldr	r3, [sp, #4]
 80008ac:	2b07      	cmp	r3, #7
 80008ae:	d832      	bhi.n	8000916 <LCD_SH1106_flush_buffer+0x86>
 80008b0:	9801      	ldr	r0, [sp, #4]
 80008b2:	3850      	subs	r0, #80	; 0x50
 80008b4:	b2c0      	uxtb	r0, r0
 80008b6:	f7ff ff9b 	bl	80007f0 <LCD_SH1106_write_command>
 80008ba:	2002      	movs	r0, #2
 80008bc:	f7ff ff98 	bl	80007f0 <LCD_SH1106_write_command>
 80008c0:	2400      	movs	r4, #0
 80008c2:	2010      	movs	r0, #16
 80008c4:	f7ff ff94 	bl	80007f0 <LCD_SH1106_write_command>
 80008c8:	9402      	str	r4, [sp, #8]
 80008ca:	9b02      	ldr	r3, [sp, #8]
 80008cc:	2b07      	cmp	r3, #7
 80008ce:	d81f      	bhi.n	8000910 <LCD_SH1106_flush_buffer+0x80>
 80008d0:	f001 f833 	bl	800193a <i2cStart>
 80008d4:	2078      	movs	r0, #120	; 0x78
 80008d6:	f001 f84e 	bl	8001976 <i2cWrite>
 80008da:	2040      	movs	r0, #64	; 0x40
 80008dc:	f001 f84b 	bl	8001976 <i2cWrite>
 80008e0:	2300      	movs	r3, #0
 80008e2:	9303      	str	r3, [sp, #12]
 80008e4:	9b03      	ldr	r3, [sp, #12]
 80008e6:	2b0f      	cmp	r3, #15
 80008e8:	d80c      	bhi.n	8000904 <LCD_SH1106_flush_buffer+0x74>
 80008ea:	9b01      	ldr	r3, [sp, #4]
 80008ec:	1c65      	adds	r5, r4, #1
 80008ee:	eb04 14c3 	add.w	r4, r4, r3, lsl #7
 80008f2:	4b0c      	ldr	r3, [pc, #48]	; (8000924 <LCD_SH1106_flush_buffer+0x94>)
 80008f4:	5d18      	ldrb	r0, [r3, r4]
 80008f6:	f001 f83e 	bl	8001976 <i2cWrite>
 80008fa:	9b03      	ldr	r3, [sp, #12]
 80008fc:	3301      	adds	r3, #1
 80008fe:	9303      	str	r3, [sp, #12]
 8000900:	462c      	mov	r4, r5
 8000902:	e7ef      	b.n	80008e4 <LCD_SH1106_flush_buffer+0x54>
 8000904:	f001 f828 	bl	8001958 <i2cStop>
 8000908:	9b02      	ldr	r3, [sp, #8]
 800090a:	3301      	adds	r3, #1
 800090c:	9302      	str	r3, [sp, #8]
 800090e:	e7dc      	b.n	80008ca <LCD_SH1106_flush_buffer+0x3a>
 8000910:	9b01      	ldr	r3, [sp, #4]
 8000912:	3301      	adds	r3, #1
 8000914:	e7c8      	b.n	80008a8 <LCD_SH1106_flush_buffer+0x18>
 8000916:	2000      	movs	r0, #0
 8000918:	4601      	mov	r1, r0
 800091a:	f7ff ff6e 	bl	80007fa <LCD_SH1106_set_cursor>
 800091e:	b005      	add	sp, #20
 8000920:	bd30      	pop	{r4, r5, pc}
 8000922:	bf00      	nop
 8000924:	2000019a 	.word	0x2000019a

08000928 <LCD_SH1106_flush_buffer_partial>:
 8000928:	e92d 43f8 	stmdb	sp!, {r3, r4, r5, r6, r7, r8, r9, lr}
 800092c:	4d2c      	ldr	r5, [pc, #176]	; (80009e0 <LCD_SH1106_flush_buffer_partial+0xb8>)
 800092e:	882b      	ldrh	r3, [r5, #0]
 8000930:	b29b      	uxth	r3, r3
 8000932:	2b01      	cmp	r3, #1
 8000934:	462e      	mov	r6, r5
 8000936:	d01c      	beq.n	8000972 <LCD_SH1106_flush_buffer_partial+0x4a>
 8000938:	d30b      	bcc.n	8000952 <LCD_SH1106_flush_buffer_partial+0x2a>
 800093a:	2b02      	cmp	r3, #2
 800093c:	f04f 0400 	mov.w	r4, #0
 8000940:	d14a      	bne.n	80009d8 <LCD_SH1106_flush_buffer_partial+0xb0>
 8000942:	4620      	mov	r0, r4
 8000944:	4621      	mov	r1, r4
 8000946:	f7ff ff58 	bl	80007fa <LCD_SH1106_set_cursor>
 800094a:	802c      	strh	r4, [r5, #0]
 800094c:	4620      	mov	r0, r4
 800094e:	e8bd 83f8 	ldmia.w	sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
 8000952:	2000      	movs	r0, #0
 8000954:	f7ff ff4c 	bl	80007f0 <LCD_SH1106_write_command>
 8000958:	2010      	movs	r0, #16
 800095a:	f7ff ff49 	bl	80007f0 <LCD_SH1106_write_command>
 800095e:	2040      	movs	r0, #64	; 0x40
 8000960:	f7ff ff46 	bl	80007f0 <LCD_SH1106_write_command>
 8000964:	4b1f      	ldr	r3, [pc, #124]	; (80009e4 <LCD_SH1106_flush_buffer_partial+0xbc>)
 8000966:	2200      	movs	r2, #0
 8000968:	2001      	movs	r0, #1
 800096a:	801a      	strh	r2, [r3, #0]
 800096c:	8028      	strh	r0, [r5, #0]
 800096e:	e8bd 83f8 	ldmia.w	sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
 8000972:	4d1c      	ldr	r5, [pc, #112]	; (80009e4 <LCD_SH1106_flush_buffer_partial+0xbc>)
 8000974:	882f      	ldrh	r7, [r5, #0]
 8000976:	b2bf      	uxth	r7, r7
 8000978:	f1a7 0050 	sub.w	r0, r7, #80	; 0x50
 800097c:	b2c0      	uxtb	r0, r0
 800097e:	f7ff ff37 	bl	80007f0 <LCD_SH1106_write_command>
 8000982:	2002      	movs	r0, #2
 8000984:	f7ff ff34 	bl	80007f0 <LCD_SH1106_write_command>
 8000988:	2010      	movs	r0, #16
 800098a:	f7ff ff31 	bl	80007f0 <LCD_SH1106_write_command>
 800098e:	2400      	movs	r4, #0
 8000990:	f000 ffd3 	bl	800193a <i2cStart>
 8000994:	2078      	movs	r0, #120	; 0x78
 8000996:	f000 ffee 	bl	8001976 <i2cWrite>
 800099a:	2040      	movs	r0, #64	; 0x40
 800099c:	f000 ffeb 	bl	8001976 <i2cWrite>
 80009a0:	f104 0810 	add.w	r8, r4, #16
 80009a4:	f104 0901 	add.w	r9, r4, #1
 80009a8:	4b0f      	ldr	r3, [pc, #60]	; (80009e8 <LCD_SH1106_flush_buffer_partial+0xc0>)
 80009aa:	eb04 14c7 	add.w	r4, r4, r7, lsl #7
 80009ae:	5d18      	ldrb	r0, [r3, r4]
 80009b0:	f000 ffe1 	bl	8001976 <i2cWrite>
 80009b4:	45c1      	cmp	r9, r8
 80009b6:	464c      	mov	r4, r9
 80009b8:	d1f4      	bne.n	80009a4 <LCD_SH1106_flush_buffer_partial+0x7c>
 80009ba:	f000 ffcd 	bl	8001958 <i2cStop>
 80009be:	2c80      	cmp	r4, #128	; 0x80
 80009c0:	d1e6      	bne.n	8000990 <LCD_SH1106_flush_buffer_partial+0x68>
 80009c2:	882b      	ldrh	r3, [r5, #0]
 80009c4:	3301      	adds	r3, #1
 80009c6:	b29b      	uxth	r3, r3
 80009c8:	802b      	strh	r3, [r5, #0]
 80009ca:	882b      	ldrh	r3, [r5, #0]
 80009cc:	b29b      	uxth	r3, r3
 80009ce:	2b07      	cmp	r3, #7
 80009d0:	d903      	bls.n	80009da <LCD_SH1106_flush_buffer_partial+0xb2>
 80009d2:	2302      	movs	r3, #2
 80009d4:	8033      	strh	r3, [r6, #0]
 80009d6:	e000      	b.n	80009da <LCD_SH1106_flush_buffer_partial+0xb2>
 80009d8:	802c      	strh	r4, [r5, #0]
 80009da:	2001      	movs	r0, #1
 80009dc:	e8bd 83f8 	ldmia.w	sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
 80009e0:	20000198 	.word	0x20000198
 80009e4:	2000059a 	.word	0x2000059a
 80009e8:	2000019a 	.word	0x2000019a

080009ec <LCD_SH1106_init>:
 80009ec:	b508      	push	{r3, lr}
 80009ee:	20ae      	movs	r0, #174	; 0xae
 80009f0:	f7ff fefe 	bl	80007f0 <LCD_SH1106_write_command>
 80009f4:	2002      	movs	r0, #2
 80009f6:	f7ff fefb 	bl	80007f0 <LCD_SH1106_write_command>
 80009fa:	2010      	movs	r0, #16
 80009fc:	f7ff fef8 	bl	80007f0 <LCD_SH1106_write_command>
 8000a00:	2040      	movs	r0, #64	; 0x40
 8000a02:	f7ff fef5 	bl	80007f0 <LCD_SH1106_write_command>
 8000a06:	20b0      	movs	r0, #176	; 0xb0
 8000a08:	f7ff fef2 	bl	80007f0 <LCD_SH1106_write_command>
 8000a0c:	2081      	movs	r0, #129	; 0x81
 8000a0e:	f7ff feef 	bl	80007f0 <LCD_SH1106_write_command>
 8000a12:	2080      	movs	r0, #128	; 0x80
 8000a14:	f7ff feec 	bl	80007f0 <LCD_SH1106_write_command>
 8000a18:	20a1      	movs	r0, #161	; 0xa1
 8000a1a:	f7ff fee9 	bl	80007f0 <LCD_SH1106_write_command>
 8000a1e:	20a6      	movs	r0, #166	; 0xa6
 8000a20:	f7ff fee6 	bl	80007f0 <LCD_SH1106_write_command>
 8000a24:	20a8      	movs	r0, #168	; 0xa8
 8000a26:	f7ff fee3 	bl	80007f0 <LCD_SH1106_write_command>
 8000a2a:	203f      	movs	r0, #63	; 0x3f
 8000a2c:	f7ff fee0 	bl	80007f0 <LCD_SH1106_write_command>
 8000a30:	20ad      	movs	r0, #173	; 0xad
 8000a32:	f7ff fedd 	bl	80007f0 <LCD_SH1106_write_command>
 8000a36:	208b      	movs	r0, #139	; 0x8b
 8000a38:	f7ff feda 	bl	80007f0 <LCD_SH1106_write_command>
 8000a3c:	2030      	movs	r0, #48	; 0x30
 8000a3e:	f7ff fed7 	bl	80007f0 <LCD_SH1106_write_command>
 8000a42:	20c8      	movs	r0, #200	; 0xc8
 8000a44:	f7ff fed4 	bl	80007f0 <LCD_SH1106_write_command>
 8000a48:	20d3      	movs	r0, #211	; 0xd3
 8000a4a:	f7ff fed1 	bl	80007f0 <LCD_SH1106_write_command>
 8000a4e:	2000      	movs	r0, #0
 8000a50:	f7ff fece 	bl	80007f0 <LCD_SH1106_write_command>
 8000a54:	20d5      	movs	r0, #213	; 0xd5
 8000a56:	f7ff fecb 	bl	80007f0 <LCD_SH1106_write_command>
 8000a5a:	2080      	movs	r0, #128	; 0x80
 8000a5c:	f7ff fec8 	bl	80007f0 <LCD_SH1106_write_command>
 8000a60:	20d9      	movs	r0, #217	; 0xd9
 8000a62:	f7ff fec5 	bl	80007f0 <LCD_SH1106_write_command>
 8000a66:	201f      	movs	r0, #31
 8000a68:	f7ff fec2 	bl	80007f0 <LCD_SH1106_write_command>
 8000a6c:	20da      	movs	r0, #218	; 0xda
 8000a6e:	f7ff febf 	bl	80007f0 <LCD_SH1106_write_command>
 8000a72:	2012      	movs	r0, #18
 8000a74:	f7ff febc 	bl	80007f0 <LCD_SH1106_write_command>
 8000a78:	20db      	movs	r0, #219	; 0xdb
 8000a7a:	f7ff feb9 	bl	80007f0 <LCD_SH1106_write_command>
 8000a7e:	2040      	movs	r0, #64	; 0x40
 8000a80:	f7ff feb6 	bl	80007f0 <LCD_SH1106_write_command>
 8000a84:	20af      	movs	r0, #175	; 0xaf
 8000a86:	f7ff feb3 	bl	80007f0 <LCD_SH1106_write_command>
 8000a8a:	2000      	movs	r0, #0
 8000a8c:	f7ff fee4 	bl	8000858 <LCD_SH1106_clear_buffer>
 8000a90:	f7ff fefe 	bl	8000890 <LCD_SH1106_flush_buffer>
 8000a94:	4a02      	ldr	r2, [pc, #8]	; (8000aa0 <LCD_SH1106_init+0xb4>)
 8000a96:	2300      	movs	r3, #0
 8000a98:	8013      	strh	r3, [r2, #0]
 8000a9a:	4a02      	ldr	r2, [pc, #8]	; (8000aa4 <LCD_SH1106_init+0xb8>)
 8000a9c:	8013      	strh	r3, [r2, #0]
 8000a9e:	bd08      	pop	{r3, pc}
 8000aa0:	20000198 	.word	0x20000198
 8000aa4:	2000059a 	.word	0x2000059a

08000aa8 <lcd_put_char_xy>:
 8000aa8:	2a1f      	cmp	r2, #31
 8000aaa:	bf86      	itte	hi
 8000aac:	3a20      	subhi	r2, #32
 8000aae:	b2d2      	uxtbhi	r2, r2
 8000ab0:	2200      	movls	r2, #0
 8000ab2:	e92d 43f8 	stmdb	sp!, {r3, r4, r5, r6, r7, r8, r9, lr}
 8000ab6:	4607      	mov	r7, r0
 8000ab8:	4688      	mov	r8, r1
 8000aba:	0114      	lsls	r4, r2, #4
 8000abc:	f04f 0900 	mov.w	r9, #0
 8000ac0:	2601      	movs	r6, #1
 8000ac2:	fa06 f609 	lsl.w	r6, r6, r9
 8000ac6:	b2f6      	uxtb	r6, r6
 8000ac8:	2500      	movs	r5, #0
 8000aca:	4b0e      	ldr	r3, [pc, #56]	; (8000b04 <lcd_put_char_xy+0x5c>)
 8000acc:	f107 0008 	add.w	r0, r7, #8
 8000ad0:	4423      	add	r3, r4
 8000ad2:	ebc9 0000 	rsb	r0, r9, r0
 8000ad6:	eb05 0108 	add.w	r1, r5, r8
 8000ada:	5d5a      	ldrb	r2, [r3, r5]
 8000adc:	2880      	cmp	r0, #128	; 0x80
 8000ade:	bf28      	it	cs
 8000ae0:	2080      	movcs	r0, #128	; 0x80
 8000ae2:	2940      	cmp	r1, #64	; 0x40
 8000ae4:	bf28      	it	cs
 8000ae6:	2140      	movcs	r1, #64	; 0x40
 8000ae8:	4032      	ands	r2, r6
 8000aea:	3501      	adds	r5, #1
 8000aec:	f7ff fe98 	bl	8000820 <LCD_SH1106_set_pixel>
 8000af0:	2d10      	cmp	r5, #16
 8000af2:	d1ea      	bne.n	8000aca <lcd_put_char_xy+0x22>
 8000af4:	f109 0901 	add.w	r9, r9, #1
 8000af8:	f1b9 0f08 	cmp.w	r9, #8
 8000afc:	d1e0      	bne.n	8000ac0 <lcd_put_char_xy+0x18>
 8000afe:	e8bd 83f8 	ldmia.w	sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
 8000b02:	bf00      	nop
 8000b04:	0800201d 	.word	0x0800201d

08000b08 <lcd_put_int>:
 8000b08:	e92d 43f0 	stmdb	sp!, {r4, r5, r6, r7, r8, r9, lr}
 8000b0c:	b085      	sub	sp, #20
 8000b0e:	2800      	cmp	r0, #0
 8000b10:	f04f 0300 	mov.w	r3, #0
 8000b14:	4690      	mov	r8, r2
 8000b16:	460f      	mov	r7, r1
 8000b18:	bfba      	itte	lt
 8000b1a:	4240      	neglt	r0, r0
 8000b1c:	2201      	movlt	r2, #1
 8000b1e:	461a      	movge	r2, r3
 8000b20:	f88d 300f 	strb.w	r3, [sp, #15]
 8000b24:	250a      	movs	r5, #10
 8000b26:	230a      	movs	r3, #10
 8000b28:	ae01      	add	r6, sp, #4
 8000b2a:	fb90 f1f3 	sdiv	r1, r0, r3
 8000b2e:	fb03 0011 	mls	r0, r3, r1, r0
 8000b32:	3030      	adds	r0, #48	; 0x30
 8000b34:	55a8      	strb	r0, [r5, r6]
 8000b36:	1e6b      	subs	r3, r5, #1
 8000b38:	4608      	mov	r0, r1
 8000b3a:	b109      	cbz	r1, 8000b40 <lcd_put_int+0x38>
 8000b3c:	461d      	mov	r5, r3
 8000b3e:	e7f2      	b.n	8000b26 <lcd_put_int+0x1e>
 8000b40:	b12a      	cbz	r2, 8000b4e <lcd_put_int+0x46>
 8000b42:	aa04      	add	r2, sp, #16
 8000b44:	441a      	add	r2, r3
 8000b46:	212d      	movs	r1, #45	; 0x2d
 8000b48:	f802 1c0c 	strb.w	r1, [r2, #-12]
 8000b4c:	461d      	mov	r5, r3
 8000b4e:	2400      	movs	r4, #0
 8000b50:	1973      	adds	r3, r6, r5
 8000b52:	eb07 00c4 	add.w	r0, r7, r4, lsl #3
 8000b56:	f813 9004 	ldrb.w	r9, [r3, r4]
 8000b5a:	4641      	mov	r1, r8
 8000b5c:	464a      	mov	r2, r9
 8000b5e:	f7ff ffa3 	bl	8000aa8 <lcd_put_char_xy>
 8000b62:	f1b9 0f00 	cmp.w	r9, #0
 8000b66:	d002      	beq.n	8000b6e <lcd_put_int+0x66>
 8000b68:	3401      	adds	r4, #1
 8000b6a:	2c0c      	cmp	r4, #12
 8000b6c:	d1f0      	bne.n	8000b50 <lcd_put_int+0x48>
 8000b6e:	b005      	add	sp, #20
 8000b70:	e8bd 83f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, pc}

08000b74 <get_g_mpu6050>:
 8000b74:	4800      	ldr	r0, [pc, #0]	; (8000b78 <get_g_mpu6050+0x4>)
 8000b76:	4770      	bx	lr
 8000b78:	2000059c 	.word	0x2000059c

08000b7c <mpu6050_read>:
 8000b7c:	b510      	push	{r4, lr}
 8000b7e:	213b      	movs	r1, #59	; 0x3b
 8000b80:	20d0      	movs	r0, #208	; 0xd0
 8000b82:	f000 ff58 	bl	8001a36 <i2c_read_reg>
 8000b86:	4c38      	ldr	r4, [pc, #224]	; (8000c68 <mpu6050_read+0xec>)
 8000b88:	0200      	lsls	r0, r0, #8
 8000b8a:	8020      	strh	r0, [r4, #0]
 8000b8c:	213c      	movs	r1, #60	; 0x3c
 8000b8e:	20d0      	movs	r0, #208	; 0xd0
 8000b90:	f000 ff51 	bl	8001a36 <i2c_read_reg>
 8000b94:	8823      	ldrh	r3, [r4, #0]
 8000b96:	4318      	orrs	r0, r3
 8000b98:	8020      	strh	r0, [r4, #0]
 8000b9a:	213d      	movs	r1, #61	; 0x3d
 8000b9c:	20d0      	movs	r0, #208	; 0xd0
 8000b9e:	f000 ff4a 	bl	8001a36 <i2c_read_reg>
 8000ba2:	0200      	lsls	r0, r0, #8
 8000ba4:	8060      	strh	r0, [r4, #2]
 8000ba6:	213e      	movs	r1, #62	; 0x3e
 8000ba8:	20d0      	movs	r0, #208	; 0xd0
 8000baa:	f000 ff44 	bl	8001a36 <i2c_read_reg>
 8000bae:	8863      	ldrh	r3, [r4, #2]
 8000bb0:	4318      	orrs	r0, r3
 8000bb2:	8060      	strh	r0, [r4, #2]
 8000bb4:	213f      	movs	r1, #63	; 0x3f
 8000bb6:	20d0      	movs	r0, #208	; 0xd0
 8000bb8:	f000 ff3d 	bl	8001a36 <i2c_read_reg>
 8000bbc:	0200      	lsls	r0, r0, #8
 8000bbe:	80a0      	strh	r0, [r4, #4]
 8000bc0:	2140      	movs	r1, #64	; 0x40
 8000bc2:	20d0      	movs	r0, #208	; 0xd0
 8000bc4:	f000 ff37 	bl	8001a36 <i2c_read_reg>
 8000bc8:	88a3      	ldrh	r3, [r4, #4]
 8000bca:	4318      	orrs	r0, r3
 8000bcc:	80a0      	strh	r0, [r4, #4]
 8000bce:	2141      	movs	r1, #65	; 0x41
 8000bd0:	20d0      	movs	r0, #208	; 0xd0
 8000bd2:	f000 ff30 	bl	8001a36 <i2c_read_reg>
 8000bd6:	0200      	lsls	r0, r0, #8
 8000bd8:	8420      	strh	r0, [r4, #32]
 8000bda:	2142      	movs	r1, #66	; 0x42
 8000bdc:	20d0      	movs	r0, #208	; 0xd0
 8000bde:	f000 ff2a 	bl	8001a36 <i2c_read_reg>
 8000be2:	8c23      	ldrh	r3, [r4, #32]
 8000be4:	4318      	orrs	r0, r3
 8000be6:	8420      	strh	r0, [r4, #32]
 8000be8:	2143      	movs	r1, #67	; 0x43
 8000bea:	20d0      	movs	r0, #208	; 0xd0
 8000bec:	f000 ff23 	bl	8001a36 <i2c_read_reg>
 8000bf0:	0200      	lsls	r0, r0, #8
 8000bf2:	80e0      	strh	r0, [r4, #6]
 8000bf4:	2144      	movs	r1, #68	; 0x44
 8000bf6:	20d0      	movs	r0, #208	; 0xd0
 8000bf8:	f000 ff1d 	bl	8001a36 <i2c_read_reg>
 8000bfc:	88e3      	ldrh	r3, [r4, #6]
 8000bfe:	4318      	orrs	r0, r3
 8000c00:	80e0      	strh	r0, [r4, #6]
 8000c02:	2145      	movs	r1, #69	; 0x45
 8000c04:	20d0      	movs	r0, #208	; 0xd0
 8000c06:	f000 ff16 	bl	8001a36 <i2c_read_reg>
 8000c0a:	0200      	lsls	r0, r0, #8
 8000c0c:	8120      	strh	r0, [r4, #8]
 8000c0e:	2146      	movs	r1, #70	; 0x46
 8000c10:	20d0      	movs	r0, #208	; 0xd0
 8000c12:	f000 ff10 	bl	8001a36 <i2c_read_reg>
 8000c16:	8923      	ldrh	r3, [r4, #8]
 8000c18:	4318      	orrs	r0, r3
 8000c1a:	8120      	strh	r0, [r4, #8]
 8000c1c:	2147      	movs	r1, #71	; 0x47
 8000c1e:	20d0      	movs	r0, #208	; 0xd0
 8000c20:	f000 ff09 	bl	8001a36 <i2c_read_reg>
 8000c24:	0200      	lsls	r0, r0, #8
 8000c26:	8160      	strh	r0, [r4, #10]
 8000c28:	2148      	movs	r1, #72	; 0x48
 8000c2a:	20d0      	movs	r0, #208	; 0xd0
 8000c2c:	f000 ff03 	bl	8001a36 <i2c_read_reg>
 8000c30:	8963      	ldrh	r3, [r4, #10]
 8000c32:	f9b4 200c 	ldrsh.w	r2, [r4, #12]
 8000c36:	4318      	orrs	r0, r3
 8000c38:	f9b4 3006 	ldrsh.w	r3, [r4, #6]
 8000c3c:	1a9b      	subs	r3, r3, r2
 8000c3e:	6962      	ldr	r2, [r4, #20]
 8000c40:	4413      	add	r3, r2
 8000c42:	6163      	str	r3, [r4, #20]
 8000c44:	f9b4 200e 	ldrsh.w	r2, [r4, #14]
 8000c48:	f9b4 3008 	ldrsh.w	r3, [r4, #8]
 8000c4c:	1a9b      	subs	r3, r3, r2
 8000c4e:	69a2      	ldr	r2, [r4, #24]
 8000c50:	4413      	add	r3, r2
 8000c52:	b280      	uxth	r0, r0
 8000c54:	61a3      	str	r3, [r4, #24]
 8000c56:	f9b4 3010 	ldrsh.w	r3, [r4, #16]
 8000c5a:	8160      	strh	r0, [r4, #10]
 8000c5c:	b200      	sxth	r0, r0
 8000c5e:	1ac0      	subs	r0, r0, r3
 8000c60:	69e3      	ldr	r3, [r4, #28]
 8000c62:	4418      	add	r0, r3
 8000c64:	61e0      	str	r0, [r4, #28]
 8000c66:	bd10      	pop	{r4, pc}
 8000c68:	2000059c 	.word	0x2000059c

08000c6c <mpu6050_init>:
 8000c6c:	e92d 41f0 	stmdb	sp!, {r4, r5, r6, r7, r8, lr}
 8000c70:	2500      	movs	r5, #0
 8000c72:	4c18      	ldr	r4, [pc, #96]	; (8000cd4 <mpu6050_init+0x68>)
 8000c74:	20d0      	movs	r0, #208	; 0xd0
 8000c76:	216b      	movs	r1, #107	; 0x6b
 8000c78:	462a      	mov	r2, r5
 8000c7a:	8025      	strh	r5, [r4, #0]
 8000c7c:	8065      	strh	r5, [r4, #2]
 8000c7e:	80a5      	strh	r5, [r4, #4]
 8000c80:	80e5      	strh	r5, [r4, #6]
 8000c82:	8125      	strh	r5, [r4, #8]
 8000c84:	8165      	strh	r5, [r4, #10]
 8000c86:	f000 fec3 	bl	8001a10 <i2c_write_reg>
 8000c8a:	2664      	movs	r6, #100	; 0x64
 8000c8c:	462f      	mov	r7, r5
 8000c8e:	46a8      	mov	r8, r5
 8000c90:	f7ff ff74 	bl	8000b7c <mpu6050_read>
 8000c94:	200a      	movs	r0, #10
 8000c96:	f000 fc59 	bl	800154c <timer_delay_ms>
 8000c9a:	f9b4 2006 	ldrsh.w	r2, [r4, #6]
 8000c9e:	4b0d      	ldr	r3, [pc, #52]	; (8000cd4 <mpu6050_init+0x68>)
 8000ca0:	4490      	add	r8, r2
 8000ca2:	f9b4 2008 	ldrsh.w	r2, [r4, #8]
 8000ca6:	4417      	add	r7, r2
 8000ca8:	f9b4 200a 	ldrsh.w	r2, [r4, #10]
 8000cac:	3e01      	subs	r6, #1
 8000cae:	4415      	add	r5, r2
 8000cb0:	d1ee      	bne.n	8000c90 <mpu6050_init+0x24>
 8000cb2:	2264      	movs	r2, #100	; 0x64
 8000cb4:	615e      	str	r6, [r3, #20]
 8000cb6:	fb98 f8f2 	sdiv	r8, r8, r2
 8000cba:	fb97 f7f2 	sdiv	r7, r7, r2
 8000cbe:	fb95 f5f2 	sdiv	r5, r5, r2
 8000cc2:	f8a3 800c 	strh.w	r8, [r3, #12]
 8000cc6:	81df      	strh	r7, [r3, #14]
 8000cc8:	821d      	strh	r5, [r3, #16]
 8000cca:	619e      	str	r6, [r3, #24]
 8000ccc:	61de      	str	r6, [r3, #28]
 8000cce:	e8bd 81f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, pc}
 8000cd2:	bf00      	nop
 8000cd4:	2000059c 	.word	0x2000059c

08000cd8 <i2c_devices_thread>:
 8000cd8:	b508      	push	{r3, lr}
 8000cda:	2132      	movs	r1, #50	; 0x32
 8000cdc:	2000      	movs	r0, #0
 8000cde:	f000 fc45 	bl	800156c <event_timer_set_period>
 8000ce2:	f7ff fcb1 	bl	8000648 <hmc5883_init>
 8000ce6:	f7ff ffc1 	bl	8000c6c <mpu6050_init>
 8000cea:	f7ff fd59 	bl	80007a0 <apds950_init>
 8000cee:	f7ff fe7d 	bl	80009ec <LCD_SH1106_init>
 8000cf2:	2000      	movs	r0, #0
 8000cf4:	f7ff fdb0 	bl	8000858 <LCD_SH1106_clear_buffer>
 8000cf8:	2000      	movs	r0, #0
 8000cfa:	f000 fc4f 	bl	800159c <event_timer_get_flag>
 8000cfe:	b140      	cbz	r0, 8000d12 <i2c_devices_thread+0x3a>
 8000d00:	2000      	movs	r0, #0
 8000d02:	f000 fc59 	bl	80015b8 <event_timer_clear_flag>
 8000d06:	f7ff fccf 	bl	80006a8 <hmc5883_read>
 8000d0a:	f7ff ff37 	bl	8000b7c <mpu6050_read>
 8000d0e:	f7ff fcfb 	bl	8000708 <apds9950_read>
 8000d12:	f7ff fe09 	bl	8000928 <LCD_SH1106_flush_buffer_partial>
 8000d16:	4604      	mov	r4, r0
 8000d18:	2800      	cmp	r0, #0
 8000d1a:	d1ed      	bne.n	8000cf8 <i2c_devices_thread+0x20>
 8000d1c:	f7ff fd9c 	bl	8000858 <LCD_SH1106_clear_buffer>
 8000d20:	f7ff ff28 	bl	8000b74 <get_g_mpu6050>
 8000d24:	4621      	mov	r1, r4
 8000d26:	4622      	mov	r2, r4
 8000d28:	6940      	ldr	r0, [r0, #20]
 8000d2a:	f7ff feed 	bl	8000b08 <lcd_put_int>
 8000d2e:	f7ff ff21 	bl	8000b74 <get_g_mpu6050>
 8000d32:	4621      	mov	r1, r4
 8000d34:	2210      	movs	r2, #16
 8000d36:	6980      	ldr	r0, [r0, #24]
 8000d38:	f7ff fee6 	bl	8000b08 <lcd_put_int>
 8000d3c:	f7ff ff1a 	bl	8000b74 <get_g_mpu6050>
 8000d40:	4621      	mov	r1, r4
 8000d42:	2220      	movs	r2, #32
 8000d44:	69c0      	ldr	r0, [r0, #28]
 8000d46:	f7ff fedf 	bl	8000b08 <lcd_put_int>
 8000d4a:	f7ff fc79 	bl	8000640 <get_g_hmc5883>
 8000d4e:	4622      	mov	r2, r4
 8000d50:	2140      	movs	r1, #64	; 0x40
 8000d52:	f9b0 0000 	ldrsh.w	r0, [r0]
 8000d56:	f7ff fed7 	bl	8000b08 <lcd_put_int>
 8000d5a:	f7ff fc71 	bl	8000640 <get_g_hmc5883>
 8000d5e:	2140      	movs	r1, #64	; 0x40
 8000d60:	2210      	movs	r2, #16
 8000d62:	f9b0 0002 	ldrsh.w	r0, [r0, #2]
 8000d66:	f7ff fecf 	bl	8000b08 <lcd_put_int>
 8000d6a:	f7ff fc69 	bl	8000640 <get_g_hmc5883>
 8000d6e:	2140      	movs	r1, #64	; 0x40
 8000d70:	2220      	movs	r2, #32
 8000d72:	f9b0 0004 	ldrsh.w	r0, [r0, #4]
 8000d76:	f7ff fec7 	bl	8000b08 <lcd_put_int>
 8000d7a:	f7ff fcc1 	bl	8000700 <get_g_apds9950>
 8000d7e:	4621      	mov	r1, r4
 8000d80:	2230      	movs	r2, #48	; 0x30
 8000d82:	88c0      	ldrh	r0, [r0, #6]
 8000d84:	f7ff fec0 	bl	8000b08 <lcd_put_int>
 8000d88:	f000 fbd2 	bl	8001530 <timer_get_time>
 8000d8c:	2140      	movs	r1, #64	; 0x40
 8000d8e:	2230      	movs	r2, #48	; 0x30
 8000d90:	f7ff feba 	bl	8000b08 <lcd_put_int>
 8000d94:	e7b0      	b.n	8000cf8 <i2c_devices_thread+0x20>
	...

08000d98 <main_thread>:
 8000d98:	b508      	push	{r3, lr}
 8000d9a:	f44f 7080 	mov.w	r0, #256	; 0x100
 8000d9e:	f001 f8cd 	bl	8001f3c <led_on>
 8000da2:	4832      	ldr	r0, [pc, #200]	; (8000e6c <main_thread+0xd4>)
 8000da4:	f7ff fb9a 	bl	80004dc <printf_>
 8000da8:	4831      	ldr	r0, [pc, #196]	; (8000e70 <main_thread+0xd8>)
 8000daa:	4932      	ldr	r1, [pc, #200]	; (8000e74 <main_thread+0xdc>)
 8000dac:	f44f 7280 	mov.w	r2, #256	; 0x100
 8000db0:	2308      	movs	r3, #8
 8000db2:	f7ff fa6b 	bl	800028c <create_thread>
 8000db6:	f44f 7080 	mov.w	r0, #256	; 0x100
 8000dba:	f001 f8bf 	bl	8001f3c <led_on>
 8000dbe:	f000 fbb7 	bl	8001530 <timer_get_time>
 8000dc2:	4601      	mov	r1, r0
 8000dc4:	482c      	ldr	r0, [pc, #176]	; (8000e78 <main_thread+0xe0>)
 8000dc6:	f7ff fb89 	bl	80004dc <printf_>
 8000dca:	f7ff fed3 	bl	8000b74 <get_g_mpu6050>
 8000dce:	f9b0 5000 	ldrsh.w	r5, [r0]
 8000dd2:	f7ff fecf 	bl	8000b74 <get_g_mpu6050>
 8000dd6:	f9b0 4002 	ldrsh.w	r4, [r0, #2]
 8000dda:	f7ff fecb 	bl	8000b74 <get_g_mpu6050>
 8000dde:	4629      	mov	r1, r5
 8000de0:	f9b0 3004 	ldrsh.w	r3, [r0, #4]
 8000de4:	4825      	ldr	r0, [pc, #148]	; (8000e7c <main_thread+0xe4>)
 8000de6:	4622      	mov	r2, r4
 8000de8:	f7ff fb78 	bl	80004dc <printf_>
 8000dec:	f7ff fec2 	bl	8000b74 <get_g_mpu6050>
 8000df0:	f9b0 5006 	ldrsh.w	r5, [r0, #6]
 8000df4:	f7ff febe 	bl	8000b74 <get_g_mpu6050>
 8000df8:	f9b0 4008 	ldrsh.w	r4, [r0, #8]
 8000dfc:	f7ff feba 	bl	8000b74 <get_g_mpu6050>
 8000e00:	4629      	mov	r1, r5
 8000e02:	f9b0 300a 	ldrsh.w	r3, [r0, #10]
 8000e06:	481d      	ldr	r0, [pc, #116]	; (8000e7c <main_thread+0xe4>)
 8000e08:	4622      	mov	r2, r4
 8000e0a:	f7ff fb67 	bl	80004dc <printf_>
 8000e0e:	f7ff fc17 	bl	8000640 <get_g_hmc5883>
 8000e12:	f9b0 5000 	ldrsh.w	r5, [r0]
 8000e16:	f7ff fc13 	bl	8000640 <get_g_hmc5883>
 8000e1a:	f9b0 4002 	ldrsh.w	r4, [r0, #2]
 8000e1e:	f7ff fc0f 	bl	8000640 <get_g_hmc5883>
 8000e22:	4629      	mov	r1, r5
 8000e24:	f9b0 3004 	ldrsh.w	r3, [r0, #4]
 8000e28:	4814      	ldr	r0, [pc, #80]	; (8000e7c <main_thread+0xe4>)
 8000e2a:	4622      	mov	r2, r4
 8000e2c:	f7ff fb56 	bl	80004dc <printf_>
 8000e30:	f7ff fc66 	bl	8000700 <get_g_apds9950>
 8000e34:	8805      	ldrh	r5, [r0, #0]
 8000e36:	f7ff fc63 	bl	8000700 <get_g_apds9950>
 8000e3a:	8844      	ldrh	r4, [r0, #2]
 8000e3c:	f7ff fc60 	bl	8000700 <get_g_apds9950>
 8000e40:	4629      	mov	r1, r5
 8000e42:	8883      	ldrh	r3, [r0, #4]
 8000e44:	480d      	ldr	r0, [pc, #52]	; (8000e7c <main_thread+0xe4>)
 8000e46:	4622      	mov	r2, r4
 8000e48:	f7ff fb48 	bl	80004dc <printf_>
 8000e4c:	480c      	ldr	r0, [pc, #48]	; (8000e80 <main_thread+0xe8>)
 8000e4e:	f7ff fb45 	bl	80004dc <printf_>
 8000e52:	2064      	movs	r0, #100	; 0x64
 8000e54:	f000 fb7a 	bl	800154c <timer_delay_ms>
 8000e58:	f44f 7080 	mov.w	r0, #256	; 0x100
 8000e5c:	f001 f876 	bl	8001f4c <led_off>
 8000e60:	f44f 707a 	mov.w	r0, #1000	; 0x3e8
 8000e64:	f000 fb72 	bl	800154c <timer_delay_ms>
 8000e68:	e7a5      	b.n	8000db6 <main_thread+0x1e>
 8000e6a:	bf00      	nop
 8000e6c:	0800261d 	.word	0x0800261d
 8000e70:	08000cd9 	.word	0x08000cd9
 8000e74:	200005c0 	.word	0x200005c0
 8000e78:	08002658 	.word	0x08002658
 8000e7c:	0800265f 	.word	0x0800265f
 8000e80:	080026b8 	.word	0x080026b8

08000e84 <mem_info_print>:
 8000e84:	b538      	push	{r3, r4, r5, lr}
 8000e86:	4c0f      	ldr	r4, [pc, #60]	; (8000ec4 <mem_info_print+0x40>)
 8000e88:	4d0f      	ldr	r5, [pc, #60]	; (8000ec8 <mem_info_print+0x44>)
 8000e8a:	4810      	ldr	r0, [pc, #64]	; (8000ecc <mem_info_print+0x48>)
 8000e8c:	4910      	ldr	r1, [pc, #64]	; (8000ed0 <mem_info_print+0x4c>)
 8000e8e:	f7ff fb25 	bl	80004dc <printf_>
 8000e92:	1b2d      	subs	r5, r5, r4
 8000e94:	4621      	mov	r1, r4
 8000e96:	480f      	ldr	r0, [pc, #60]	; (8000ed4 <mem_info_print+0x50>)
 8000e98:	f7ff fb20 	bl	80004dc <printf_>
 8000e9c:	4629      	mov	r1, r5
 8000e9e:	480e      	ldr	r0, [pc, #56]	; (8000ed8 <mem_info_print+0x54>)
 8000ea0:	f7ff fb1c 	bl	80004dc <printf_>
 8000ea4:	490d      	ldr	r1, [pc, #52]	; (8000edc <mem_info_print+0x58>)
 8000ea6:	480e      	ldr	r0, [pc, #56]	; (8000ee0 <mem_info_print+0x5c>)
 8000ea8:	1a61      	subs	r1, r4, r1
 8000eaa:	4429      	add	r1, r5
 8000eac:	f7ff fb16 	bl	80004dc <printf_>
 8000eb0:	480c      	ldr	r0, [pc, #48]	; (8000ee4 <mem_info_print+0x60>)
 8000eb2:	490d      	ldr	r1, [pc, #52]	; (8000ee8 <mem_info_print+0x64>)
 8000eb4:	f7ff fb12 	bl	80004dc <printf_>
 8000eb8:	480c      	ldr	r0, [pc, #48]	; (8000eec <mem_info_print+0x68>)
 8000eba:	e8bd 4038 	ldmia.w	sp!, {r3, r4, r5, lr}
 8000ebe:	f7ff bb0d 	b.w	80004dc <printf_>
 8000ec2:	bf00      	nop
 8000ec4:	20000000 	.word	0x20000000
 8000ec8:	20004000 	.word	0x20004000
 8000ecc:	0800266b 	.word	0x0800266b
 8000ed0:	08001fdc 	.word	0x08001fdc
 8000ed4:	0800267c 	.word	0x0800267c
 8000ed8:	0800268b 	.word	0x0800268b
 8000edc:	200007f4 	.word	0x200007f4
 8000ee0:	08002699 	.word	0x08002699
 8000ee4:	080026a7 	.word	0x080026a7
 8000ee8:	200007f4 	.word	0x200007f4
 8000eec:	080026b7 	.word	0x080026b7

08000ef0 <main>:
 8000ef0:	b508      	push	{r3, lr}
 8000ef2:	f000 ff8d 	bl	8001e10 <lib_low_level_init>
 8000ef6:	f7ff fb6b 	bl	80005d0 <lib_os_init>
 8000efa:	f7ff ffc3 	bl	8000e84 <mem_info_print>
 8000efe:	4905      	ldr	r1, [pc, #20]	; (8000f14 <main+0x24>)
 8000f00:	4805      	ldr	r0, [pc, #20]	; (8000f18 <main+0x28>)
 8000f02:	f44f 7280 	mov.w	r2, #256	; 0x100
 8000f06:	2308      	movs	r3, #8
 8000f08:	f7ff f9c0 	bl	800028c <create_thread>
 8000f0c:	f7ff f9b8 	bl	8000280 <kernel_start>
 8000f10:	2000      	movs	r0, #0
 8000f12:	bd08      	pop	{r3, pc}
 8000f14:	200006c0 	.word	0x200006c0
 8000f18:	08000d99 	.word	0x08000d99

08000f1c <RCC_GetClocksFreq>:
 8000f1c:	e92d 41f0 	stmdb	sp!, {r4, r5, r6, r7, r8, lr}
 8000f20:	4f9b      	ldr	r7, [pc, #620]	; (8001190 <RCC_GetClocksFreq+0x274>)
 8000f22:	687b      	ldr	r3, [r7, #4]
 8000f24:	f003 030c 	and.w	r3, r3, #12
 8000f28:	2b04      	cmp	r3, #4
 8000f2a:	d005      	beq.n	8000f38 <RCC_GetClocksFreq+0x1c>
 8000f2c:	2b08      	cmp	r3, #8
 8000f2e:	d006      	beq.n	8000f3e <RCC_GetClocksFreq+0x22>
 8000f30:	4a98      	ldr	r2, [pc, #608]	; (8001194 <RCC_GetClocksFreq+0x278>)
 8000f32:	6002      	str	r2, [r0, #0]
 8000f34:	b9b3      	cbnz	r3, 8000f64 <RCC_GetClocksFreq+0x48>
 8000f36:	e016      	b.n	8000f66 <RCC_GetClocksFreq+0x4a>
 8000f38:	4b96      	ldr	r3, [pc, #600]	; (8001194 <RCC_GetClocksFreq+0x278>)
 8000f3a:	6003      	str	r3, [r0, #0]
 8000f3c:	e012      	b.n	8000f64 <RCC_GetClocksFreq+0x48>
 8000f3e:	687b      	ldr	r3, [r7, #4]
 8000f40:	6879      	ldr	r1, [r7, #4]
 8000f42:	f3c3 4383 	ubfx	r3, r3, #18, #4
 8000f46:	1c9a      	adds	r2, r3, #2
 8000f48:	03cb      	lsls	r3, r1, #15
 8000f4a:	bf49      	itett	mi
 8000f4c:	6afb      	ldrmi	r3, [r7, #44]	; 0x2c
 8000f4e:	4b92      	ldrpl	r3, [pc, #584]	; (8001198 <RCC_GetClocksFreq+0x27c>)
 8000f50:	4990      	ldrmi	r1, [pc, #576]	; (8001194 <RCC_GetClocksFreq+0x278>)
 8000f52:	f003 030f 	andmi.w	r3, r3, #15
 8000f56:	bf44      	itt	mi
 8000f58:	3301      	addmi	r3, #1
 8000f5a:	fbb1 f3f3 	udivmi	r3, r1, r3
 8000f5e:	4353      	muls	r3, r2
 8000f60:	6003      	str	r3, [r0, #0]
 8000f62:	e000      	b.n	8000f66 <RCC_GetClocksFreq+0x4a>
 8000f64:	2300      	movs	r3, #0
 8000f66:	687a      	ldr	r2, [r7, #4]
 8000f68:	4e8c      	ldr	r6, [pc, #560]	; (800119c <RCC_GetClocksFreq+0x280>)
 8000f6a:	f8df c234 	ldr.w	ip, [pc, #564]	; 80011a0 <RCC_GetClocksFreq+0x284>
 8000f6e:	f3c2 1203 	ubfx	r2, r2, #4, #4
 8000f72:	5cb4      	ldrb	r4, [r6, r2]
 8000f74:	6802      	ldr	r2, [r0, #0]
 8000f76:	b2e4      	uxtb	r4, r4
 8000f78:	fa22 f104 	lsr.w	r1, r2, r4
 8000f7c:	6041      	str	r1, [r0, #4]
 8000f7e:	687d      	ldr	r5, [r7, #4]
 8000f80:	f3c5 2502 	ubfx	r5, r5, #8, #3
 8000f84:	5d75      	ldrb	r5, [r6, r5]
 8000f86:	fa21 fe05 	lsr.w	lr, r1, r5
 8000f8a:	f8c0 e008 	str.w	lr, [r0, #8]
 8000f8e:	687d      	ldr	r5, [r7, #4]
 8000f90:	f3c5 25c2 	ubfx	r5, r5, #11, #3
 8000f94:	5d75      	ldrb	r5, [r6, r5]
 8000f96:	b2ed      	uxtb	r5, r5
 8000f98:	40e9      	lsrs	r1, r5
 8000f9a:	60c1      	str	r1, [r0, #12]
 8000f9c:	6afe      	ldr	r6, [r7, #44]	; 0x2c
 8000f9e:	f3c6 1804 	ubfx	r8, r6, #4, #5
 8000fa2:	f008 060f 	and.w	r6, r8, #15
 8000fa6:	f018 0f10 	tst.w	r8, #16
 8000faa:	f83c 6016 	ldrh.w	r6, [ip, r6, lsl #1]
 8000fae:	46e0      	mov	r8, ip
 8000fb0:	b2b6      	uxth	r6, r6
 8000fb2:	d004      	beq.n	8000fbe <RCC_GetClocksFreq+0xa2>
 8000fb4:	b11e      	cbz	r6, 8000fbe <RCC_GetClocksFreq+0xa2>
 8000fb6:	fbb3 f6f6 	udiv	r6, r3, r6
 8000fba:	6106      	str	r6, [r0, #16]
 8000fbc:	e000      	b.n	8000fc0 <RCC_GetClocksFreq+0xa4>
 8000fbe:	6102      	str	r2, [r0, #16]
 8000fc0:	6afe      	ldr	r6, [r7, #44]	; 0x2c
 8000fc2:	f3c6 2c44 	ubfx	ip, r6, #9, #5
 8000fc6:	f00c 060f 	and.w	r6, ip, #15
 8000fca:	f01c 0f10 	tst.w	ip, #16
 8000fce:	f838 6016 	ldrh.w	r6, [r8, r6, lsl #1]
 8000fd2:	b2b6      	uxth	r6, r6
 8000fd4:	d004      	beq.n	8000fe0 <RCC_GetClocksFreq+0xc4>
 8000fd6:	b11e      	cbz	r6, 8000fe0 <RCC_GetClocksFreq+0xc4>
 8000fd8:	fbb3 f6f6 	udiv	r6, r3, r6
 8000fdc:	6146      	str	r6, [r0, #20]
 8000fde:	e000      	b.n	8000fe2 <RCC_GetClocksFreq+0xc6>
 8000fe0:	6142      	str	r2, [r0, #20]
 8000fe2:	6b3e      	ldr	r6, [r7, #48]	; 0x30
 8000fe4:	06f6      	lsls	r6, r6, #27
 8000fe6:	bf5a      	itte	pl
 8000fe8:	4e6a      	ldrpl	r6, [pc, #424]	; (8001194 <RCC_GetClocksFreq+0x278>)
 8000fea:	6186      	strpl	r6, [r0, #24]
 8000fec:	6182      	strmi	r2, [r0, #24]
 8000fee:	6b3e      	ldr	r6, [r7, #48]	; 0x30
 8000ff0:	06b6      	lsls	r6, r6, #26
 8000ff2:	bf5a      	itte	pl
 8000ff4:	4e67      	ldrpl	r6, [pc, #412]	; (8001194 <RCC_GetClocksFreq+0x278>)
 8000ff6:	61c6      	strpl	r6, [r0, #28]
 8000ff8:	61c2      	strmi	r2, [r0, #28]
 8000ffa:	6b3e      	ldr	r6, [r7, #48]	; 0x30
 8000ffc:	0676      	lsls	r6, r6, #25
 8000ffe:	bf5a      	itte	pl
 8001000:	4e64      	ldrpl	r6, [pc, #400]	; (8001194 <RCC_GetClocksFreq+0x278>)
 8001002:	6206      	strpl	r6, [r0, #32]
 8001004:	6202      	strmi	r2, [r0, #32]
 8001006:	6b3e      	ldr	r6, [r7, #48]	; 0x30
 8001008:	05f6      	lsls	r6, r6, #23
 800100a:	d506      	bpl.n	800101a <RCC_GetClocksFreq+0xfe>
 800100c:	429a      	cmp	r2, r3
 800100e:	d104      	bne.n	800101a <RCC_GetClocksFreq+0xfe>
 8001010:	42a5      	cmp	r5, r4
 8001012:	d102      	bne.n	800101a <RCC_GetClocksFreq+0xfe>
 8001014:	0056      	lsls	r6, r2, #1
 8001016:	6246      	str	r6, [r0, #36]	; 0x24
 8001018:	e000      	b.n	800101c <RCC_GetClocksFreq+0x100>
 800101a:	6241      	str	r1, [r0, #36]	; 0x24
 800101c:	6b3e      	ldr	r6, [r7, #48]	; 0x30
 800101e:	04f6      	lsls	r6, r6, #19
 8001020:	d506      	bpl.n	8001030 <RCC_GetClocksFreq+0x114>
 8001022:	429a      	cmp	r2, r3
 8001024:	d104      	bne.n	8001030 <RCC_GetClocksFreq+0x114>
 8001026:	42a5      	cmp	r5, r4
 8001028:	d102      	bne.n	8001030 <RCC_GetClocksFreq+0x114>
 800102a:	0056      	lsls	r6, r2, #1
 800102c:	6286      	str	r6, [r0, #40]	; 0x28
 800102e:	e000      	b.n	8001032 <RCC_GetClocksFreq+0x116>
 8001030:	6281      	str	r1, [r0, #40]	; 0x28
 8001032:	6b3e      	ldr	r6, [r7, #48]	; 0x30
 8001034:	05b6      	lsls	r6, r6, #22
 8001036:	d506      	bpl.n	8001046 <RCC_GetClocksFreq+0x12a>
 8001038:	429a      	cmp	r2, r3
 800103a:	d104      	bne.n	8001046 <RCC_GetClocksFreq+0x12a>
 800103c:	42a5      	cmp	r5, r4
 800103e:	d102      	bne.n	8001046 <RCC_GetClocksFreq+0x12a>
 8001040:	0056      	lsls	r6, r2, #1
 8001042:	62c6      	str	r6, [r0, #44]	; 0x2c
 8001044:	e000      	b.n	8001048 <RCC_GetClocksFreq+0x12c>
 8001046:	62c1      	str	r1, [r0, #44]	; 0x2c
 8001048:	6b3e      	ldr	r6, [r7, #48]	; 0x30
 800104a:	0576      	lsls	r6, r6, #21
 800104c:	d506      	bpl.n	800105c <RCC_GetClocksFreq+0x140>
 800104e:	429a      	cmp	r2, r3
 8001050:	d104      	bne.n	800105c <RCC_GetClocksFreq+0x140>
 8001052:	42a5      	cmp	r5, r4
 8001054:	d102      	bne.n	800105c <RCC_GetClocksFreq+0x140>
 8001056:	0056      	lsls	r6, r2, #1
 8001058:	64c6      	str	r6, [r0, #76]	; 0x4c
 800105a:	e000      	b.n	800105e <RCC_GetClocksFreq+0x142>
 800105c:	64c1      	str	r1, [r0, #76]	; 0x4c
 800105e:	6b3e      	ldr	r6, [r7, #48]	; 0x30
 8001060:	0536      	lsls	r6, r6, #20
 8001062:	d506      	bpl.n	8001072 <RCC_GetClocksFreq+0x156>
 8001064:	429a      	cmp	r2, r3
 8001066:	d104      	bne.n	8001072 <RCC_GetClocksFreq+0x156>
 8001068:	42a5      	cmp	r5, r4
 800106a:	d102      	bne.n	8001072 <RCC_GetClocksFreq+0x156>
 800106c:	0056      	lsls	r6, r2, #1
 800106e:	6506      	str	r6, [r0, #80]	; 0x50
 8001070:	e000      	b.n	8001074 <RCC_GetClocksFreq+0x158>
 8001072:	6501      	str	r1, [r0, #80]	; 0x50
 8001074:	6b3e      	ldr	r6, [r7, #48]	; 0x30
 8001076:	04b6      	lsls	r6, r6, #18
 8001078:	d506      	bpl.n	8001088 <RCC_GetClocksFreq+0x16c>
 800107a:	429a      	cmp	r2, r3
 800107c:	d104      	bne.n	8001088 <RCC_GetClocksFreq+0x16c>
 800107e:	42a5      	cmp	r5, r4
 8001080:	d102      	bne.n	8001088 <RCC_GetClocksFreq+0x16c>
 8001082:	0056      	lsls	r6, r2, #1
 8001084:	6546      	str	r6, [r0, #84]	; 0x54
 8001086:	e000      	b.n	800108a <RCC_GetClocksFreq+0x16e>
 8001088:	6501      	str	r1, [r0, #80]	; 0x50
 800108a:	6b3e      	ldr	r6, [r7, #48]	; 0x30
 800108c:	0436      	lsls	r6, r6, #16
 800108e:	d506      	bpl.n	800109e <RCC_GetClocksFreq+0x182>
 8001090:	429a      	cmp	r2, r3
 8001092:	d104      	bne.n	800109e <RCC_GetClocksFreq+0x182>
 8001094:	42a5      	cmp	r5, r4
 8001096:	d102      	bne.n	800109e <RCC_GetClocksFreq+0x182>
 8001098:	0053      	lsls	r3, r2, #1
 800109a:	6583      	str	r3, [r0, #88]	; 0x58
 800109c:	e000      	b.n	80010a0 <RCC_GetClocksFreq+0x184>
 800109e:	6581      	str	r1, [r0, #88]	; 0x58
 80010a0:	6b3c      	ldr	r4, [r7, #48]	; 0x30
 80010a2:	4b3b      	ldr	r3, [pc, #236]	; (8001190 <RCC_GetClocksFreq+0x274>)
 80010a4:	07a4      	lsls	r4, r4, #30
 80010a6:	d101      	bne.n	80010ac <RCC_GetClocksFreq+0x190>
 80010a8:	6381      	str	r1, [r0, #56]	; 0x38
 80010aa:	e015      	b.n	80010d8 <RCC_GetClocksFreq+0x1bc>
 80010ac:	6b19      	ldr	r1, [r3, #48]	; 0x30
 80010ae:	f001 0103 	and.w	r1, r1, #3
 80010b2:	2901      	cmp	r1, #1
 80010b4:	d101      	bne.n	80010ba <RCC_GetClocksFreq+0x19e>
 80010b6:	6382      	str	r2, [r0, #56]	; 0x38
 80010b8:	e00e      	b.n	80010d8 <RCC_GetClocksFreq+0x1bc>
 80010ba:	6b19      	ldr	r1, [r3, #48]	; 0x30
 80010bc:	f001 0103 	and.w	r1, r1, #3
 80010c0:	2902      	cmp	r1, #2
 80010c2:	d102      	bne.n	80010ca <RCC_GetClocksFreq+0x1ae>
 80010c4:	f44f 4300 	mov.w	r3, #32768	; 0x8000
 80010c8:	e005      	b.n	80010d6 <RCC_GetClocksFreq+0x1ba>
 80010ca:	6b1b      	ldr	r3, [r3, #48]	; 0x30
 80010cc:	f003 0303 	and.w	r3, r3, #3
 80010d0:	2b03      	cmp	r3, #3
 80010d2:	d101      	bne.n	80010d8 <RCC_GetClocksFreq+0x1bc>
 80010d4:	4b2f      	ldr	r3, [pc, #188]	; (8001194 <RCC_GetClocksFreq+0x278>)
 80010d6:	6383      	str	r3, [r0, #56]	; 0x38
 80010d8:	6b39      	ldr	r1, [r7, #48]	; 0x30
 80010da:	4b2d      	ldr	r3, [pc, #180]	; (8001190 <RCC_GetClocksFreq+0x274>)
 80010dc:	f411 3f40 	tst.w	r1, #196608	; 0x30000
 80010e0:	d102      	bne.n	80010e8 <RCC_GetClocksFreq+0x1cc>
 80010e2:	f8c0 e03c 	str.w	lr, [r0, #60]	; 0x3c
 80010e6:	e018      	b.n	800111a <RCC_GetClocksFreq+0x1fe>
 80010e8:	6b19      	ldr	r1, [r3, #48]	; 0x30
 80010ea:	f401 3140 	and.w	r1, r1, #196608	; 0x30000
 80010ee:	f5b1 3f80 	cmp.w	r1, #65536	; 0x10000
 80010f2:	d101      	bne.n	80010f8 <RCC_GetClocksFreq+0x1dc>
 80010f4:	63c2      	str	r2, [r0, #60]	; 0x3c
 80010f6:	e010      	b.n	800111a <RCC_GetClocksFreq+0x1fe>
 80010f8:	6b19      	ldr	r1, [r3, #48]	; 0x30
 80010fa:	f401 3140 	and.w	r1, r1, #196608	; 0x30000
 80010fe:	f5b1 3f00 	cmp.w	r1, #131072	; 0x20000
 8001102:	d102      	bne.n	800110a <RCC_GetClocksFreq+0x1ee>
 8001104:	f44f 4300 	mov.w	r3, #32768	; 0x8000
 8001108:	e006      	b.n	8001118 <RCC_GetClocksFreq+0x1fc>
 800110a:	6b1b      	ldr	r3, [r3, #48]	; 0x30
 800110c:	f403 3340 	and.w	r3, r3, #196608	; 0x30000
 8001110:	f5b3 3f40 	cmp.w	r3, #196608	; 0x30000
 8001114:	d101      	bne.n	800111a <RCC_GetClocksFreq+0x1fe>
 8001116:	4b1f      	ldr	r3, [pc, #124]	; (8001194 <RCC_GetClocksFreq+0x278>)
 8001118:	63c3      	str	r3, [r0, #60]	; 0x3c
 800111a:	6b39      	ldr	r1, [r7, #48]	; 0x30
 800111c:	4b1c      	ldr	r3, [pc, #112]	; (8001190 <RCC_GetClocksFreq+0x274>)
 800111e:	f411 2f40 	tst.w	r1, #786432	; 0xc0000
 8001122:	d102      	bne.n	800112a <RCC_GetClocksFreq+0x20e>
 8001124:	f8c0 e040 	str.w	lr, [r0, #64]	; 0x40
 8001128:	e018      	b.n	800115c <RCC_GetClocksFreq+0x240>
 800112a:	6b19      	ldr	r1, [r3, #48]	; 0x30
 800112c:	f401 2140 	and.w	r1, r1, #786432	; 0xc0000
 8001130:	f5b1 2f80 	cmp.w	r1, #262144	; 0x40000
 8001134:	d101      	bne.n	800113a <RCC_GetClocksFreq+0x21e>
 8001136:	6402      	str	r2, [r0, #64]	; 0x40
 8001138:	e010      	b.n	800115c <RCC_GetClocksFreq+0x240>
 800113a:	6b19      	ldr	r1, [r3, #48]	; 0x30
 800113c:	f401 2140 	and.w	r1, r1, #786432	; 0xc0000
 8001140:	f5b1 2f00 	cmp.w	r1, #524288	; 0x80000
 8001144:	d102      	bne.n	800114c <RCC_GetClocksFreq+0x230>
 8001146:	f44f 4300 	mov.w	r3, #32768	; 0x8000
 800114a:	e006      	b.n	800115a <RCC_GetClocksFreq+0x23e>
 800114c:	6b1b      	ldr	r3, [r3, #48]	; 0x30
 800114e:	f403 2340 	and.w	r3, r3, #786432	; 0xc0000
 8001152:	f5b3 2f40 	cmp.w	r3, #786432	; 0xc0000
 8001156:	d101      	bne.n	800115c <RCC_GetClocksFreq+0x240>
 8001158:	4b0e      	ldr	r3, [pc, #56]	; (8001194 <RCC_GetClocksFreq+0x278>)
 800115a:	6403      	str	r3, [r0, #64]	; 0x40
 800115c:	6b39      	ldr	r1, [r7, #48]	; 0x30
 800115e:	4b0c      	ldr	r3, [pc, #48]	; (8001190 <RCC_GetClocksFreq+0x274>)
 8001160:	f411 1f40 	tst.w	r1, #3145728	; 0x300000
 8001164:	d102      	bne.n	800116c <RCC_GetClocksFreq+0x250>
 8001166:	f8c0 e044 	str.w	lr, [r0, #68]	; 0x44
 800116a:	e023      	b.n	80011b4 <RCC_GetClocksFreq+0x298>
 800116c:	6b19      	ldr	r1, [r3, #48]	; 0x30
 800116e:	f401 1140 	and.w	r1, r1, #3145728	; 0x300000
 8001172:	f5b1 1f80 	cmp.w	r1, #1048576	; 0x100000
 8001176:	d101      	bne.n	800117c <RCC_GetClocksFreq+0x260>
 8001178:	6442      	str	r2, [r0, #68]	; 0x44
 800117a:	e01b      	b.n	80011b4 <RCC_GetClocksFreq+0x298>
 800117c:	6b19      	ldr	r1, [r3, #48]	; 0x30
 800117e:	f401 1140 	and.w	r1, r1, #3145728	; 0x300000
 8001182:	f5b1 1f00 	cmp.w	r1, #2097152	; 0x200000
 8001186:	d10d      	bne.n	80011a4 <RCC_GetClocksFreq+0x288>
 8001188:	f44f 4300 	mov.w	r3, #32768	; 0x8000
 800118c:	e011      	b.n	80011b2 <RCC_GetClocksFreq+0x296>
 800118e:	bf00      	nop
 8001190:	40021000 	.word	0x40021000
 8001194:	007a1200 	.word	0x007a1200
 8001198:	003d0900 	.word	0x003d0900
 800119c:	20000020 	.word	0x20000020
 80011a0:	20000000 	.word	0x20000000
 80011a4:	6b1b      	ldr	r3, [r3, #48]	; 0x30
 80011a6:	f403 1340 	and.w	r3, r3, #3145728	; 0x300000
 80011aa:	f5b3 1f40 	cmp.w	r3, #3145728	; 0x300000
 80011ae:	d101      	bne.n	80011b4 <RCC_GetClocksFreq+0x298>
 80011b0:	4b13      	ldr	r3, [pc, #76]	; (8001200 <RCC_GetClocksFreq+0x2e4>)
 80011b2:	6443      	str	r3, [r0, #68]	; 0x44
 80011b4:	6b39      	ldr	r1, [r7, #48]	; 0x30
 80011b6:	4b13      	ldr	r3, [pc, #76]	; (8001204 <RCC_GetClocksFreq+0x2e8>)
 80011b8:	f411 0f40 	tst.w	r1, #12582912	; 0xc00000
 80011bc:	d103      	bne.n	80011c6 <RCC_GetClocksFreq+0x2aa>
 80011be:	f8c0 e048 	str.w	lr, [r0, #72]	; 0x48
 80011c2:	e8bd 81f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, pc}
 80011c6:	6b19      	ldr	r1, [r3, #48]	; 0x30
 80011c8:	f401 0140 	and.w	r1, r1, #12582912	; 0xc00000
 80011cc:	f5b1 0f80 	cmp.w	r1, #4194304	; 0x400000
 80011d0:	d102      	bne.n	80011d8 <RCC_GetClocksFreq+0x2bc>
 80011d2:	6482      	str	r2, [r0, #72]	; 0x48
 80011d4:	e8bd 81f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, pc}
 80011d8:	6b1a      	ldr	r2, [r3, #48]	; 0x30
 80011da:	f402 0240 	and.w	r2, r2, #12582912	; 0xc00000
 80011de:	f5b2 0f00 	cmp.w	r2, #8388608	; 0x800000
 80011e2:	d102      	bne.n	80011ea <RCC_GetClocksFreq+0x2ce>
 80011e4:	f44f 4300 	mov.w	r3, #32768	; 0x8000
 80011e8:	e006      	b.n	80011f8 <RCC_GetClocksFreq+0x2dc>
 80011ea:	6b1b      	ldr	r3, [r3, #48]	; 0x30
 80011ec:	f403 0340 	and.w	r3, r3, #12582912	; 0xc00000
 80011f0:	f5b3 0f40 	cmp.w	r3, #12582912	; 0xc00000
 80011f4:	d101      	bne.n	80011fa <RCC_GetClocksFreq+0x2de>
 80011f6:	4b02      	ldr	r3, [pc, #8]	; (8001200 <RCC_GetClocksFreq+0x2e4>)
 80011f8:	6483      	str	r3, [r0, #72]	; 0x48
 80011fa:	e8bd 81f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, pc}
 80011fe:	bf00      	nop
 8001200:	007a1200 	.word	0x007a1200
 8001204:	40021000 	.word	0x40021000

08001208 <RCC_AHBPeriphClockCmd>:
 8001208:	bf00      	nop
 800120a:	bf00      	nop
 800120c:	4b04      	ldr	r3, [pc, #16]	; (8001220 <RCC_AHBPeriphClockCmd+0x18>)
 800120e:	695a      	ldr	r2, [r3, #20]
 8001210:	b109      	cbz	r1, 8001216 <RCC_AHBPeriphClockCmd+0xe>
 8001212:	4310      	orrs	r0, r2
 8001214:	e001      	b.n	800121a <RCC_AHBPeriphClockCmd+0x12>
 8001216:	ea22 0000 	bic.w	r0, r2, r0
 800121a:	6158      	str	r0, [r3, #20]
 800121c:	4770      	bx	lr
 800121e:	bf00      	nop
 8001220:	40021000 	.word	0x40021000

08001224 <RCC_APB2PeriphClockCmd>:
 8001224:	bf00      	nop
 8001226:	bf00      	nop
 8001228:	4b04      	ldr	r3, [pc, #16]	; (800123c <RCC_APB2PeriphClockCmd+0x18>)
 800122a:	699a      	ldr	r2, [r3, #24]
 800122c:	b109      	cbz	r1, 8001232 <RCC_APB2PeriphClockCmd+0xe>
 800122e:	4310      	orrs	r0, r2
 8001230:	e001      	b.n	8001236 <RCC_APB2PeriphClockCmd+0x12>
 8001232:	ea22 0000 	bic.w	r0, r2, r0
 8001236:	6198      	str	r0, [r3, #24]
 8001238:	4770      	bx	lr
 800123a:	bf00      	nop
 800123c:	40021000 	.word	0x40021000

08001240 <RCC_APB1PeriphClockCmd>:
 8001240:	bf00      	nop
 8001242:	bf00      	nop
 8001244:	4b04      	ldr	r3, [pc, #16]	; (8001258 <RCC_APB1PeriphClockCmd+0x18>)
 8001246:	69da      	ldr	r2, [r3, #28]
 8001248:	b109      	cbz	r1, 800124e <RCC_APB1PeriphClockCmd+0xe>
 800124a:	4310      	orrs	r0, r2
 800124c:	e001      	b.n	8001252 <RCC_APB1PeriphClockCmd+0x12>
 800124e:	ea22 0000 	bic.w	r0, r2, r0
 8001252:	61d8      	str	r0, [r3, #28]
 8001254:	4770      	bx	lr
 8001256:	bf00      	nop
 8001258:	40021000 	.word	0x40021000

0800125c <TIM_TimeBaseInit>:
 800125c:	bf00      	nop
 800125e:	bf00      	nop
 8001260:	bf00      	nop
 8001262:	4a24      	ldr	r2, [pc, #144]	; (80012f4 <TIM_TimeBaseInit+0x98>)
 8001264:	8803      	ldrh	r3, [r0, #0]
 8001266:	4290      	cmp	r0, r2
 8001268:	b29b      	uxth	r3, r3
 800126a:	d012      	beq.n	8001292 <TIM_TimeBaseInit+0x36>
 800126c:	f502 6200 	add.w	r2, r2, #2048	; 0x800
 8001270:	4290      	cmp	r0, r2
 8001272:	d00e      	beq.n	8001292 <TIM_TimeBaseInit+0x36>
 8001274:	f1b0 4f80 	cmp.w	r0, #1073741824	; 0x40000000
 8001278:	d00b      	beq.n	8001292 <TIM_TimeBaseInit+0x36>
 800127a:	f5a2 3298 	sub.w	r2, r2, #77824	; 0x13000
 800127e:	4290      	cmp	r0, r2
 8001280:	d007      	beq.n	8001292 <TIM_TimeBaseInit+0x36>
 8001282:	f502 6280 	add.w	r2, r2, #1024	; 0x400
 8001286:	4290      	cmp	r0, r2
 8001288:	d003      	beq.n	8001292 <TIM_TimeBaseInit+0x36>
 800128a:	f502 32a4 	add.w	r2, r2, #83968	; 0x14800
 800128e:	4290      	cmp	r0, r2
 8001290:	d103      	bne.n	800129a <TIM_TimeBaseInit+0x3e>
 8001292:	884a      	ldrh	r2, [r1, #2]
 8001294:	f023 0370 	bic.w	r3, r3, #112	; 0x70
 8001298:	4313      	orrs	r3, r2
 800129a:	4a17      	ldr	r2, [pc, #92]	; (80012f8 <TIM_TimeBaseInit+0x9c>)
 800129c:	4290      	cmp	r0, r2
 800129e:	d008      	beq.n	80012b2 <TIM_TimeBaseInit+0x56>
 80012a0:	f502 6280 	add.w	r2, r2, #1024	; 0x400
 80012a4:	4290      	cmp	r0, r2
 80012a6:	bf1f      	itttt	ne
 80012a8:	f423 7340 	bicne.w	r3, r3, #768	; 0x300
 80012ac:	890a      	ldrhne	r2, [r1, #8]
 80012ae:	b29b      	uxthne	r3, r3
 80012b0:	4313      	orrne	r3, r2
 80012b2:	8003      	strh	r3, [r0, #0]
 80012b4:	684b      	ldr	r3, [r1, #4]
 80012b6:	62c3      	str	r3, [r0, #44]	; 0x2c
 80012b8:	880b      	ldrh	r3, [r1, #0]
 80012ba:	8503      	strh	r3, [r0, #40]	; 0x28
 80012bc:	4b0d      	ldr	r3, [pc, #52]	; (80012f4 <TIM_TimeBaseInit+0x98>)
 80012be:	4298      	cmp	r0, r3
 80012c0:	d013      	beq.n	80012ea <TIM_TimeBaseInit+0x8e>
 80012c2:	f503 6300 	add.w	r3, r3, #2048	; 0x800
 80012c6:	4298      	cmp	r0, r3
 80012c8:	d00f      	beq.n	80012ea <TIM_TimeBaseInit+0x8e>
 80012ca:	f503 6340 	add.w	r3, r3, #3072	; 0xc00
 80012ce:	4298      	cmp	r0, r3
 80012d0:	d00b      	beq.n	80012ea <TIM_TimeBaseInit+0x8e>
 80012d2:	f503 6380 	add.w	r3, r3, #1024	; 0x400
 80012d6:	4298      	cmp	r0, r3
 80012d8:	d007      	beq.n	80012ea <TIM_TimeBaseInit+0x8e>
 80012da:	f503 6380 	add.w	r3, r3, #1024	; 0x400
 80012de:	4298      	cmp	r0, r3
 80012e0:	d003      	beq.n	80012ea <TIM_TimeBaseInit+0x8e>
 80012e2:	f503 6300 	add.w	r3, r3, #2048	; 0x800
 80012e6:	4298      	cmp	r0, r3
 80012e8:	d101      	bne.n	80012ee <TIM_TimeBaseInit+0x92>
 80012ea:	894b      	ldrh	r3, [r1, #10]
 80012ec:	8603      	strh	r3, [r0, #48]	; 0x30
 80012ee:	2301      	movs	r3, #1
 80012f0:	6143      	str	r3, [r0, #20]
 80012f2:	4770      	bx	lr
 80012f4:	40012c00 	.word	0x40012c00
 80012f8:	40001000 	.word	0x40001000

080012fc <TIM_Cmd>:
 80012fc:	bf00      	nop
 80012fe:	bf00      	nop
 8001300:	8803      	ldrh	r3, [r0, #0]
 8001302:	b119      	cbz	r1, 800130c <TIM_Cmd+0x10>
 8001304:	b29b      	uxth	r3, r3
 8001306:	f043 0301 	orr.w	r3, r3, #1
 800130a:	e003      	b.n	8001314 <TIM_Cmd+0x18>
 800130c:	f023 0301 	bic.w	r3, r3, #1
 8001310:	041b      	lsls	r3, r3, #16
 8001312:	0c1b      	lsrs	r3, r3, #16
 8001314:	8003      	strh	r3, [r0, #0]
 8001316:	4770      	bx	lr

08001318 <TIM_OC1Init>:
 8001318:	b570      	push	{r4, r5, r6, lr}
 800131a:	bf00      	nop
 800131c:	bf00      	nop
 800131e:	bf00      	nop
 8001320:	bf00      	nop
 8001322:	6a03      	ldr	r3, [r0, #32]
 8001324:	680d      	ldr	r5, [r1, #0]
 8001326:	f023 0301 	bic.w	r3, r3, #1
 800132a:	6203      	str	r3, [r0, #32]
 800132c:	6a03      	ldr	r3, [r0, #32]
 800132e:	6844      	ldr	r4, [r0, #4]
 8001330:	6982      	ldr	r2, [r0, #24]
 8001332:	f422 3280 	bic.w	r2, r2, #65536	; 0x10000
 8001336:	f022 0273 	bic.w	r2, r2, #115	; 0x73
 800133a:	4315      	orrs	r5, r2
 800133c:	898a      	ldrh	r2, [r1, #12]
 800133e:	f023 0302 	bic.w	r3, r3, #2
 8001342:	4313      	orrs	r3, r2
 8001344:	888a      	ldrh	r2, [r1, #4]
 8001346:	4313      	orrs	r3, r2
 8001348:	4a15      	ldr	r2, [pc, #84]	; (80013a0 <TIM_OC1Init+0x88>)
 800134a:	4290      	cmp	r0, r2
 800134c:	d00f      	beq.n	800136e <TIM_OC1Init+0x56>
 800134e:	f502 6200 	add.w	r2, r2, #2048	; 0x800
 8001352:	4290      	cmp	r0, r2
 8001354:	d00b      	beq.n	800136e <TIM_OC1Init+0x56>
 8001356:	f502 6240 	add.w	r2, r2, #3072	; 0xc00
 800135a:	4290      	cmp	r0, r2
 800135c:	d007      	beq.n	800136e <TIM_OC1Init+0x56>
 800135e:	f502 6280 	add.w	r2, r2, #1024	; 0x400
 8001362:	4290      	cmp	r0, r2
 8001364:	d003      	beq.n	800136e <TIM_OC1Init+0x56>
 8001366:	f502 6280 	add.w	r2, r2, #1024	; 0x400
 800136a:	4290      	cmp	r0, r2
 800136c:	d111      	bne.n	8001392 <TIM_OC1Init+0x7a>
 800136e:	bf00      	nop
 8001370:	bf00      	nop
 8001372:	bf00      	nop
 8001374:	bf00      	nop
 8001376:	89ca      	ldrh	r2, [r1, #14]
 8001378:	88ce      	ldrh	r6, [r1, #6]
 800137a:	f023 0308 	bic.w	r3, r3, #8
 800137e:	4313      	orrs	r3, r2
 8001380:	8a0a      	ldrh	r2, [r1, #16]
 8001382:	f424 7440 	bic.w	r4, r4, #768	; 0x300
 8001386:	4314      	orrs	r4, r2
 8001388:	8a4a      	ldrh	r2, [r1, #18]
 800138a:	f023 0304 	bic.w	r3, r3, #4
 800138e:	4333      	orrs	r3, r6
 8001390:	4314      	orrs	r4, r2
 8001392:	688a      	ldr	r2, [r1, #8]
 8001394:	6044      	str	r4, [r0, #4]
 8001396:	6185      	str	r5, [r0, #24]
 8001398:	6342      	str	r2, [r0, #52]	; 0x34
 800139a:	6203      	str	r3, [r0, #32]
 800139c:	bd70      	pop	{r4, r5, r6, pc}
 800139e:	bf00      	nop
 80013a0:	40012c00 	.word	0x40012c00

080013a4 <TIM_OC2Init>:
 80013a4:	b570      	push	{r4, r5, r6, lr}
 80013a6:	bf00      	nop
 80013a8:	bf00      	nop
 80013aa:	bf00      	nop
 80013ac:	bf00      	nop
 80013ae:	6a03      	ldr	r3, [r0, #32]
 80013b0:	680d      	ldr	r5, [r1, #0]
 80013b2:	898e      	ldrh	r6, [r1, #12]
 80013b4:	f023 0310 	bic.w	r3, r3, #16
 80013b8:	6203      	str	r3, [r0, #32]
 80013ba:	6a03      	ldr	r3, [r0, #32]
 80013bc:	6844      	ldr	r4, [r0, #4]
 80013be:	6982      	ldr	r2, [r0, #24]
 80013c0:	f022 7280 	bic.w	r2, r2, #16777216	; 0x1000000
 80013c4:	f422 42e6 	bic.w	r2, r2, #29440	; 0x7300
 80013c8:	ea42 2505 	orr.w	r5, r2, r5, lsl #8
 80013cc:	f023 0220 	bic.w	r2, r3, #32
 80013d0:	888b      	ldrh	r3, [r1, #4]
 80013d2:	4333      	orrs	r3, r6
 80013d4:	ea42 1303 	orr.w	r3, r2, r3, lsl #4
 80013d8:	4a10      	ldr	r2, [pc, #64]	; (800141c <TIM_OC2Init+0x78>)
 80013da:	4290      	cmp	r0, r2
 80013dc:	d003      	beq.n	80013e6 <TIM_OC2Init+0x42>
 80013de:	f502 6200 	add.w	r2, r2, #2048	; 0x800
 80013e2:	4290      	cmp	r0, r2
 80013e4:	d114      	bne.n	8001410 <TIM_OC2Init+0x6c>
 80013e6:	bf00      	nop
 80013e8:	bf00      	nop
 80013ea:	bf00      	nop
 80013ec:	bf00      	nop
 80013ee:	89ca      	ldrh	r2, [r1, #14]
 80013f0:	8a0e      	ldrh	r6, [r1, #16]
 80013f2:	f023 0380 	bic.w	r3, r3, #128	; 0x80
 80013f6:	ea43 1302 	orr.w	r3, r3, r2, lsl #4
 80013fa:	88ca      	ldrh	r2, [r1, #6]
 80013fc:	f023 0340 	bic.w	r3, r3, #64	; 0x40
 8001400:	ea43 1302 	orr.w	r3, r3, r2, lsl #4
 8001404:	8a4a      	ldrh	r2, [r1, #18]
 8001406:	f424 6440 	bic.w	r4, r4, #3072	; 0xc00
 800140a:	4332      	orrs	r2, r6
 800140c:	ea44 0482 	orr.w	r4, r4, r2, lsl #2
 8001410:	688a      	ldr	r2, [r1, #8]
 8001412:	6044      	str	r4, [r0, #4]
 8001414:	6185      	str	r5, [r0, #24]
 8001416:	6382      	str	r2, [r0, #56]	; 0x38
 8001418:	6203      	str	r3, [r0, #32]
 800141a:	bd70      	pop	{r4, r5, r6, pc}
 800141c:	40012c00 	.word	0x40012c00

08001420 <TIM_CtrlPWMOutputs>:
 8001420:	bf00      	nop
 8001422:	bf00      	nop
 8001424:	6c43      	ldr	r3, [r0, #68]	; 0x44
 8001426:	b111      	cbz	r1, 800142e <TIM_CtrlPWMOutputs+0xe>
 8001428:	f443 4300 	orr.w	r3, r3, #32768	; 0x8000
 800142c:	e001      	b.n	8001432 <TIM_CtrlPWMOutputs+0x12>
 800142e:	f3c3 030e 	ubfx	r3, r3, #0, #15
 8001432:	6443      	str	r3, [r0, #68]	; 0x44
 8001434:	4770      	bx	lr

08001436 <TIM_ClearITPendingBit>:
 8001436:	bf00      	nop
 8001438:	43c9      	mvns	r1, r1
 800143a:	b289      	uxth	r1, r1
 800143c:	6101      	str	r1, [r0, #16]
 800143e:	4770      	bx	lr

08001440 <timer_init>:
 8001440:	b530      	push	{r4, r5, lr}
 8001442:	2300      	movs	r3, #0
 8001444:	b085      	sub	sp, #20
 8001446:	491f      	ldr	r1, [pc, #124]	; (80014c4 <timer_init+0x84>)
 8001448:	f44f 6280 	mov.w	r2, #1024	; 0x400
 800144c:	f821 2013 	strh.w	r2, [r1, r3, lsl #1]
 8001450:	491d      	ldr	r1, [pc, #116]	; (80014c8 <timer_init+0x88>)
 8001452:	f821 2013 	strh.w	r2, [r1, r3, lsl #1]
 8001456:	4a1d      	ldr	r2, [pc, #116]	; (80014cc <timer_init+0x8c>)
 8001458:	2400      	movs	r4, #0
 800145a:	f822 4013 	strh.w	r4, [r2, r3, lsl #1]
 800145e:	3301      	adds	r3, #1
 8001460:	2b04      	cmp	r3, #4
 8001462:	4625      	mov	r5, r4
 8001464:	d1ef      	bne.n	8001446 <timer_init+0x6>
 8001466:	4b1a      	ldr	r3, [pc, #104]	; (80014d0 <timer_init+0x90>)
 8001468:	2002      	movs	r0, #2
 800146a:	2101      	movs	r1, #1
 800146c:	601c      	str	r4, [r3, #0]
 800146e:	f7ff fee7 	bl	8001240 <RCC_APB1PeriphClockCmd>
 8001472:	f8ad 4006 	strh.w	r4, [sp, #6]
 8001476:	f8ad 400c 	strh.w	r4, [sp, #12]
 800147a:	f8ad 400e 	strh.w	r4, [sp, #14]
 800147e:	4c15      	ldr	r4, [pc, #84]	; (80014d4 <timer_init+0x94>)
 8001480:	f44f 738c 	mov.w	r3, #280	; 0x118
 8001484:	f8ad 3004 	strh.w	r3, [sp, #4]
 8001488:	4620      	mov	r0, r4
 800148a:	2331      	movs	r3, #49	; 0x31
 800148c:	a901      	add	r1, sp, #4
 800148e:	9302      	str	r3, [sp, #8]
 8001490:	f7ff fee4 	bl	800125c <TIM_TimeBaseInit>
 8001494:	4620      	mov	r0, r4
 8001496:	2101      	movs	r1, #1
 8001498:	f7ff ff30 	bl	80012fc <TIM_Cmd>
 800149c:	68e3      	ldr	r3, [r4, #12]
 800149e:	f043 0301 	orr.w	r3, r3, #1
 80014a2:	60e3      	str	r3, [r4, #12]
 80014a4:	231d      	movs	r3, #29
 80014a6:	f88d 3000 	strb.w	r3, [sp]
 80014aa:	4668      	mov	r0, sp
 80014ac:	2301      	movs	r3, #1
 80014ae:	f88d 5001 	strb.w	r5, [sp, #1]
 80014b2:	f88d 3002 	strb.w	r3, [sp, #2]
 80014b6:	f88d 3003 	strb.w	r3, [sp, #3]
 80014ba:	f000 fc6f 	bl	8001d9c <NVIC_Init>
 80014be:	b005      	add	sp, #20
 80014c0:	bd30      	pop	{r4, r5, pc}
 80014c2:	bf00      	nop
 80014c4:	200007d4 	.word	0x200007d4
 80014c8:	200007c8 	.word	0x200007c8
 80014cc:	200007c0 	.word	0x200007c0
 80014d0:	200007d0 	.word	0x200007d0
 80014d4:	40000400 	.word	0x40000400

080014d8 <TIM3_IRQHandler>:
 80014d8:	2300      	movs	r3, #0
 80014da:	4910      	ldr	r1, [pc, #64]	; (800151c <TIM3_IRQHandler+0x44>)
 80014dc:	f831 2013 	ldrh.w	r2, [r1, r3, lsl #1]
 80014e0:	b292      	uxth	r2, r2
 80014e2:	b132      	cbz	r2, 80014f2 <TIM3_IRQHandler+0x1a>
 80014e4:	f831 2013 	ldrh.w	r2, [r1, r3, lsl #1]
 80014e8:	3a01      	subs	r2, #1
 80014ea:	b292      	uxth	r2, r2
 80014ec:	f821 2013 	strh.w	r2, [r1, r3, lsl #1]
 80014f0:	e009      	b.n	8001506 <TIM3_IRQHandler+0x2e>
 80014f2:	4a0b      	ldr	r2, [pc, #44]	; (8001520 <TIM3_IRQHandler+0x48>)
 80014f4:	f832 2013 	ldrh.w	r2, [r2, r3, lsl #1]
 80014f8:	b292      	uxth	r2, r2
 80014fa:	f821 2013 	strh.w	r2, [r1, r3, lsl #1]
 80014fe:	4a09      	ldr	r2, [pc, #36]	; (8001524 <TIM3_IRQHandler+0x4c>)
 8001500:	2101      	movs	r1, #1
 8001502:	f822 1013 	strh.w	r1, [r2, r3, lsl #1]
 8001506:	3301      	adds	r3, #1
 8001508:	2b04      	cmp	r3, #4
 800150a:	d1e6      	bne.n	80014da <TIM3_IRQHandler+0x2>
 800150c:	4a06      	ldr	r2, [pc, #24]	; (8001528 <TIM3_IRQHandler+0x50>)
 800150e:	4807      	ldr	r0, [pc, #28]	; (800152c <TIM3_IRQHandler+0x54>)
 8001510:	6813      	ldr	r3, [r2, #0]
 8001512:	2101      	movs	r1, #1
 8001514:	3301      	adds	r3, #1
 8001516:	6013      	str	r3, [r2, #0]
 8001518:	f7ff bf8d 	b.w	8001436 <TIM_ClearITPendingBit>
 800151c:	200007d4 	.word	0x200007d4
 8001520:	200007c8 	.word	0x200007c8
 8001524:	200007c0 	.word	0x200007c0
 8001528:	200007d0 	.word	0x200007d0
 800152c:	40000400 	.word	0x40000400

08001530 <timer_get_time>:
 8001530:	b082      	sub	sp, #8
 8001532:	b672      	cpsid	i
 8001534:	4b04      	ldr	r3, [pc, #16]	; (8001548 <timer_get_time+0x18>)
 8001536:	681b      	ldr	r3, [r3, #0]
 8001538:	9301      	str	r3, [sp, #4]
 800153a:	b662      	cpsie	i
 800153c:	230a      	movs	r3, #10
 800153e:	9801      	ldr	r0, [sp, #4]
 8001540:	fbb0 f0f3 	udiv	r0, r0, r3
 8001544:	b002      	add	sp, #8
 8001546:	4770      	bx	lr
 8001548:	200007d0 	.word	0x200007d0

0800154c <timer_delay_ms>:
 800154c:	b513      	push	{r0, r1, r4, lr}
 800154e:	4604      	mov	r4, r0
 8001550:	f7ff ffee 	bl	8001530 <timer_get_time>
 8001554:	4420      	add	r0, r4
 8001556:	9001      	str	r0, [sp, #4]
 8001558:	9c01      	ldr	r4, [sp, #4]
 800155a:	f7ff ffe9 	bl	8001530 <timer_get_time>
 800155e:	4284      	cmp	r4, r0
 8001560:	d902      	bls.n	8001568 <timer_delay_ms+0x1c>
 8001562:	f000 fb11 	bl	8001b88 <sleep>
 8001566:	e7f7      	b.n	8001558 <timer_delay_ms+0xc>
 8001568:	b002      	add	sp, #8
 800156a:	bd10      	pop	{r4, pc}

0800156c <event_timer_set_period>:
 800156c:	b672      	cpsid	i
 800156e:	eb01 0181 	add.w	r1, r1, r1, lsl #2
 8001572:	4b07      	ldr	r3, [pc, #28]	; (8001590 <event_timer_set_period+0x24>)
 8001574:	0049      	lsls	r1, r1, #1
 8001576:	b289      	uxth	r1, r1
 8001578:	f823 1010 	strh.w	r1, [r3, r0, lsl #1]
 800157c:	4b05      	ldr	r3, [pc, #20]	; (8001594 <event_timer_set_period+0x28>)
 800157e:	f823 1010 	strh.w	r1, [r3, r0, lsl #1]
 8001582:	4b05      	ldr	r3, [pc, #20]	; (8001598 <event_timer_set_period+0x2c>)
 8001584:	2200      	movs	r2, #0
 8001586:	f823 2010 	strh.w	r2, [r3, r0, lsl #1]
 800158a:	b662      	cpsie	i
 800158c:	4770      	bx	lr
 800158e:	bf00      	nop
 8001590:	200007d4 	.word	0x200007d4
 8001594:	200007c8 	.word	0x200007c8
 8001598:	200007c0 	.word	0x200007c0

0800159c <event_timer_get_flag>:
 800159c:	b082      	sub	sp, #8
 800159e:	b672      	cpsid	i
 80015a0:	4b04      	ldr	r3, [pc, #16]	; (80015b4 <event_timer_get_flag+0x18>)
 80015a2:	f833 3010 	ldrh.w	r3, [r3, r0, lsl #1]
 80015a6:	b29b      	uxth	r3, r3
 80015a8:	9301      	str	r3, [sp, #4]
 80015aa:	b662      	cpsie	i
 80015ac:	9801      	ldr	r0, [sp, #4]
 80015ae:	b002      	add	sp, #8
 80015b0:	4770      	bx	lr
 80015b2:	bf00      	nop
 80015b4:	200007c0 	.word	0x200007c0

080015b8 <event_timer_clear_flag>:
 80015b8:	b672      	cpsid	i
 80015ba:	4b03      	ldr	r3, [pc, #12]	; (80015c8 <event_timer_clear_flag+0x10>)
 80015bc:	2200      	movs	r2, #0
 80015be:	f823 2010 	strh.w	r2, [r3, r0, lsl #1]
 80015c2:	b662      	cpsie	i
 80015c4:	4770      	bx	lr
 80015c6:	bf00      	nop
 80015c8:	200007c0 	.word	0x200007c0

080015cc <USART_Init>:
 80015cc:	b530      	push	{r4, r5, lr}
 80015ce:	4604      	mov	r4, r0
 80015d0:	b099      	sub	sp, #100	; 0x64
 80015d2:	460d      	mov	r5, r1
 80015d4:	bf00      	nop
 80015d6:	bf00      	nop
 80015d8:	bf00      	nop
 80015da:	bf00      	nop
 80015dc:	bf00      	nop
 80015de:	bf00      	nop
 80015e0:	bf00      	nop
 80015e2:	6803      	ldr	r3, [r0, #0]
 80015e4:	f023 0301 	bic.w	r3, r3, #1
 80015e8:	6003      	str	r3, [r0, #0]
 80015ea:	6843      	ldr	r3, [r0, #4]
 80015ec:	f423 5240 	bic.w	r2, r3, #12288	; 0x3000
 80015f0:	688b      	ldr	r3, [r1, #8]
 80015f2:	68c9      	ldr	r1, [r1, #12]
 80015f4:	4313      	orrs	r3, r2
 80015f6:	6043      	str	r3, [r0, #4]
 80015f8:	686a      	ldr	r2, [r5, #4]
 80015fa:	6803      	ldr	r3, [r0, #0]
 80015fc:	4311      	orrs	r1, r2
 80015fe:	692a      	ldr	r2, [r5, #16]
 8001600:	f423 53b0 	bic.w	r3, r3, #5632	; 0x1600
 8001604:	430a      	orrs	r2, r1
 8001606:	f023 030c 	bic.w	r3, r3, #12
 800160a:	4313      	orrs	r3, r2
 800160c:	6003      	str	r3, [r0, #0]
 800160e:	6883      	ldr	r3, [r0, #8]
 8001610:	f423 7240 	bic.w	r2, r3, #768	; 0x300
 8001614:	696b      	ldr	r3, [r5, #20]
 8001616:	4313      	orrs	r3, r2
 8001618:	6083      	str	r3, [r0, #8]
 800161a:	a801      	add	r0, sp, #4
 800161c:	f7ff fc7e 	bl	8000f1c <RCC_GetClocksFreq>
 8001620:	4b17      	ldr	r3, [pc, #92]	; (8001680 <USART_Init+0xb4>)
 8001622:	429c      	cmp	r4, r3
 8001624:	d101      	bne.n	800162a <USART_Init+0x5e>
 8001626:	9b0f      	ldr	r3, [sp, #60]	; 0x3c
 8001628:	e00e      	b.n	8001648 <USART_Init+0x7c>
 800162a:	4b16      	ldr	r3, [pc, #88]	; (8001684 <USART_Init+0xb8>)
 800162c:	429c      	cmp	r4, r3
 800162e:	d101      	bne.n	8001634 <USART_Init+0x68>
 8001630:	9b10      	ldr	r3, [sp, #64]	; 0x40
 8001632:	e009      	b.n	8001648 <USART_Init+0x7c>
 8001634:	4b14      	ldr	r3, [pc, #80]	; (8001688 <USART_Init+0xbc>)
 8001636:	429c      	cmp	r4, r3
 8001638:	d101      	bne.n	800163e <USART_Init+0x72>
 800163a:	9b11      	ldr	r3, [sp, #68]	; 0x44
 800163c:	e004      	b.n	8001648 <USART_Init+0x7c>
 800163e:	4b13      	ldr	r3, [pc, #76]	; (800168c <USART_Init+0xc0>)
 8001640:	429c      	cmp	r4, r3
 8001642:	bf0c      	ite	eq
 8001644:	9b12      	ldreq	r3, [sp, #72]	; 0x48
 8001646:	9b13      	ldrne	r3, [sp, #76]	; 0x4c
 8001648:	6822      	ldr	r2, [r4, #0]
 800164a:	6829      	ldr	r1, [r5, #0]
 800164c:	f412 4f00 	tst.w	r2, #32768	; 0x8000
 8001650:	bf18      	it	ne
 8001652:	005b      	lslne	r3, r3, #1
 8001654:	fbb3 f2f1 	udiv	r2, r3, r1
 8001658:	fb01 3312 	mls	r3, r1, r2, r3
 800165c:	ebb3 0f51 	cmp.w	r3, r1, lsr #1
 8001660:	6823      	ldr	r3, [r4, #0]
 8001662:	bf28      	it	cs
 8001664:	3201      	addcs	r2, #1
 8001666:	041b      	lsls	r3, r3, #16
 8001668:	bf41      	itttt	mi
 800166a:	f64f 73f0 	movwmi	r3, #65520	; 0xfff0
 800166e:	f3c2 0142 	ubfxmi	r1, r2, #1, #3
 8001672:	4013      	andmi	r3, r2
 8001674:	ea41 0203 	orrmi.w	r2, r1, r3
 8001678:	b292      	uxth	r2, r2
 800167a:	81a2      	strh	r2, [r4, #12]
 800167c:	b019      	add	sp, #100	; 0x64
 800167e:	bd30      	pop	{r4, r5, pc}
 8001680:	40013800 	.word	0x40013800
 8001684:	40004400 	.word	0x40004400
 8001688:	40004800 	.word	0x40004800
 800168c:	40004c00 	.word	0x40004c00

08001690 <USART_Cmd>:
 8001690:	bf00      	nop
 8001692:	bf00      	nop
 8001694:	6803      	ldr	r3, [r0, #0]
 8001696:	b111      	cbz	r1, 800169e <USART_Cmd+0xe>
 8001698:	f043 0301 	orr.w	r3, r3, #1
 800169c:	e001      	b.n	80016a2 <USART_Cmd+0x12>
 800169e:	f023 0301 	bic.w	r3, r3, #1
 80016a2:	6003      	str	r3, [r0, #0]
 80016a4:	4770      	bx	lr

080016a6 <USART_ReceiveData>:
 80016a6:	bf00      	nop
 80016a8:	8c80      	ldrh	r0, [r0, #36]	; 0x24
 80016aa:	f3c0 0008 	ubfx	r0, r0, #0, #9
 80016ae:	4770      	bx	lr

080016b0 <USART_ITConfig>:
 80016b0:	b510      	push	{r4, lr}
 80016b2:	bf00      	nop
 80016b4:	bf00      	nop
 80016b6:	bf00      	nop
 80016b8:	f3c1 2407 	ubfx	r4, r1, #8, #8
 80016bc:	2301      	movs	r3, #1
 80016be:	b2c9      	uxtb	r1, r1
 80016c0:	2c02      	cmp	r4, #2
 80016c2:	fa03 f301 	lsl.w	r3, r3, r1
 80016c6:	d101      	bne.n	80016cc <USART_ITConfig+0x1c>
 80016c8:	3004      	adds	r0, #4
 80016ca:	e002      	b.n	80016d2 <USART_ITConfig+0x22>
 80016cc:	2c03      	cmp	r4, #3
 80016ce:	bf08      	it	eq
 80016d0:	3008      	addeq	r0, #8
 80016d2:	b112      	cbz	r2, 80016da <USART_ITConfig+0x2a>
 80016d4:	6802      	ldr	r2, [r0, #0]
 80016d6:	4313      	orrs	r3, r2
 80016d8:	e002      	b.n	80016e0 <USART_ITConfig+0x30>
 80016da:	6802      	ldr	r2, [r0, #0]
 80016dc:	ea22 0303 	bic.w	r3, r2, r3
 80016e0:	6003      	str	r3, [r0, #0]
 80016e2:	bd10      	pop	{r4, pc}

080016e4 <USART_GetITStatus>:
 80016e4:	b510      	push	{r4, lr}
 80016e6:	bf00      	nop
 80016e8:	bf00      	nop
 80016ea:	f3c1 2207 	ubfx	r2, r1, #8, #8
 80016ee:	b2cc      	uxtb	r4, r1
 80016f0:	2301      	movs	r3, #1
 80016f2:	2a01      	cmp	r2, #1
 80016f4:	fa03 f304 	lsl.w	r3, r3, r4
 80016f8:	d101      	bne.n	80016fe <USART_GetITStatus+0x1a>
 80016fa:	6802      	ldr	r2, [r0, #0]
 80016fc:	e003      	b.n	8001706 <USART_GetITStatus+0x22>
 80016fe:	2a02      	cmp	r2, #2
 8001700:	bf0c      	ite	eq
 8001702:	6842      	ldreq	r2, [r0, #4]
 8001704:	6882      	ldrne	r2, [r0, #8]
 8001706:	4013      	ands	r3, r2
 8001708:	69c2      	ldr	r2, [r0, #28]
 800170a:	b13b      	cbz	r3, 800171c <USART_GetITStatus+0x38>
 800170c:	0c09      	lsrs	r1, r1, #16
 800170e:	2301      	movs	r3, #1
 8001710:	408b      	lsls	r3, r1
 8001712:	4213      	tst	r3, r2
 8001714:	bf14      	ite	ne
 8001716:	2001      	movne	r0, #1
 8001718:	2000      	moveq	r0, #0
 800171a:	bd10      	pop	{r4, pc}
 800171c:	4618      	mov	r0, r3
 800171e:	bd10      	pop	{r4, pc}

08001720 <USART_ClearITPendingBit>:
 8001720:	bf00      	nop
 8001722:	bf00      	nop
 8001724:	2301      	movs	r3, #1
 8001726:	0c09      	lsrs	r1, r1, #16
 8001728:	408b      	lsls	r3, r1
 800172a:	6203      	str	r3, [r0, #32]
 800172c:	4770      	bx	lr
	...

08001730 <uart_write>:
 8001730:	4b04      	ldr	r3, [pc, #16]	; (8001744 <uart_write+0x14>)
 8001732:	69da      	ldr	r2, [r3, #28]
 8001734:	0612      	lsls	r2, r2, #24
 8001736:	d401      	bmi.n	800173c <uart_write+0xc>
 8001738:	bf00      	nop
 800173a:	e7f9      	b.n	8001730 <uart_write>
 800173c:	b280      	uxth	r0, r0
 800173e:	8518      	strh	r0, [r3, #40]	; 0x28
 8001740:	4770      	bx	lr
 8001742:	bf00      	nop
 8001744:	40013800 	.word	0x40013800

08001748 <uart_init>:
 8001748:	b530      	push	{r4, r5, lr}
 800174a:	4b2c      	ldr	r3, [pc, #176]	; (80017fc <uart_init+0xb4>)
 800174c:	4d2c      	ldr	r5, [pc, #176]	; (8001800 <uart_init+0xb8>)
 800174e:	2400      	movs	r4, #0
 8001750:	601c      	str	r4, [r3, #0]
 8001752:	4b2c      	ldr	r3, [pc, #176]	; (8001804 <uart_init+0xbc>)
 8001754:	b08b      	sub	sp, #44	; 0x2c
 8001756:	f44f 3000 	mov.w	r0, #131072	; 0x20000
 800175a:	2101      	movs	r1, #1
 800175c:	601c      	str	r4, [r3, #0]
 800175e:	f7ff fd53 	bl	8001208 <RCC_AHBPeriphClockCmd>
 8001762:	f44f 4080 	mov.w	r0, #16384	; 0x4000
 8001766:	2101      	movs	r1, #1
 8001768:	f7ff fd5c 	bl	8001224 <RCC_APB2PeriphClockCmd>
 800176c:	f44f 63c0 	mov.w	r3, #1536	; 0x600
 8001770:	9302      	str	r3, [sp, #8]
 8001772:	2302      	movs	r3, #2
 8001774:	f88d 300c 	strb.w	r3, [sp, #12]
 8001778:	a902      	add	r1, sp, #8
 800177a:	2303      	movs	r3, #3
 800177c:	f04f 4090 	mov.w	r0, #1207959552	; 0x48000000
 8001780:	f88d 300d 	strb.w	r3, [sp, #13]
 8001784:	f88d 400e 	strb.w	r4, [sp, #14]
 8001788:	f88d 400f 	strb.w	r4, [sp, #15]
 800178c:	f000 fb51 	bl	8001e32 <GPIO_Init>
 8001790:	f04f 4090 	mov.w	r0, #1207959552	; 0x48000000
 8001794:	2109      	movs	r1, #9
 8001796:	2207      	movs	r2, #7
 8001798:	f000 fb95 	bl	8001ec6 <GPIO_PinAFConfig>
 800179c:	2207      	movs	r2, #7
 800179e:	f04f 4090 	mov.w	r0, #1207959552	; 0x48000000
 80017a2:	210a      	movs	r1, #10
 80017a4:	f000 fb8f 	bl	8001ec6 <GPIO_PinAFConfig>
 80017a8:	f44f 33e1 	mov.w	r3, #115200	; 0x1c200
 80017ac:	9304      	str	r3, [sp, #16]
 80017ae:	4628      	mov	r0, r5
 80017b0:	230c      	movs	r3, #12
 80017b2:	a904      	add	r1, sp, #16
 80017b4:	9308      	str	r3, [sp, #32]
 80017b6:	9405      	str	r4, [sp, #20]
 80017b8:	9406      	str	r4, [sp, #24]
 80017ba:	9407      	str	r4, [sp, #28]
 80017bc:	9409      	str	r4, [sp, #36]	; 0x24
 80017be:	f7ff ff05 	bl	80015cc <USART_Init>
 80017c2:	4628      	mov	r0, r5
 80017c4:	2101      	movs	r1, #1
 80017c6:	f7ff ff63 	bl	8001690 <USART_Cmd>
 80017ca:	2201      	movs	r2, #1
 80017cc:	4628      	mov	r0, r5
 80017ce:	490e      	ldr	r1, [pc, #56]	; (8001808 <uart_init+0xc0>)
 80017d0:	f7ff ff6e 	bl	80016b0 <USART_ITConfig>
 80017d4:	2325      	movs	r3, #37	; 0x25
 80017d6:	f88d 4005 	strb.w	r4, [sp, #5]
 80017da:	f88d 4006 	strb.w	r4, [sp, #6]
 80017de:	a801      	add	r0, sp, #4
 80017e0:	2401      	movs	r4, #1
 80017e2:	f88d 3004 	strb.w	r3, [sp, #4]
 80017e6:	f88d 4007 	strb.w	r4, [sp, #7]
 80017ea:	f000 fad7 	bl	8001d9c <NVIC_Init>
 80017ee:	4628      	mov	r0, r5
 80017f0:	4621      	mov	r1, r4
 80017f2:	f7ff ff4d 	bl	8001690 <USART_Cmd>
 80017f6:	b00b      	add	sp, #44	; 0x2c
 80017f8:	bd30      	pop	{r4, r5, pc}
 80017fa:	bf00      	nop
 80017fc:	200007ec 	.word	0x200007ec
 8001800:	40013800 	.word	0x40013800
 8001804:	200007f0 	.word	0x200007f0
 8001808:	00050105 	.word	0x00050105

0800180c <USART1_IRQHandler>:
 800180c:	b508      	push	{r3, lr}
 800180e:	480d      	ldr	r0, [pc, #52]	; (8001844 <USART1_IRQHandler+0x38>)
 8001810:	490d      	ldr	r1, [pc, #52]	; (8001848 <USART1_IRQHandler+0x3c>)
 8001812:	f7ff ff67 	bl	80016e4 <USART_GetITStatus>
 8001816:	b178      	cbz	r0, 8001838 <USART1_IRQHandler+0x2c>
 8001818:	480a      	ldr	r0, [pc, #40]	; (8001844 <USART1_IRQHandler+0x38>)
 800181a:	f7ff ff44 	bl	80016a6 <USART_ReceiveData>
 800181e:	4b0b      	ldr	r3, [pc, #44]	; (800184c <USART1_IRQHandler+0x40>)
 8001820:	490b      	ldr	r1, [pc, #44]	; (8001850 <USART1_IRQHandler+0x44>)
 8001822:	681a      	ldr	r2, [r3, #0]
 8001824:	b2c0      	uxtb	r0, r0
 8001826:	5488      	strb	r0, [r1, r2]
 8001828:	681a      	ldr	r2, [r3, #0]
 800182a:	3201      	adds	r2, #1
 800182c:	601a      	str	r2, [r3, #0]
 800182e:	681a      	ldr	r2, [r3, #0]
 8001830:	2a0f      	cmp	r2, #15
 8001832:	bf84      	itt	hi
 8001834:	2200      	movhi	r2, #0
 8001836:	601a      	strhi	r2, [r3, #0]
 8001838:	4802      	ldr	r0, [pc, #8]	; (8001844 <USART1_IRQHandler+0x38>)
 800183a:	4903      	ldr	r1, [pc, #12]	; (8001848 <USART1_IRQHandler+0x3c>)
 800183c:	e8bd 4008 	ldmia.w	sp!, {r3, lr}
 8001840:	f7ff bf6e 	b.w	8001720 <USART_ClearITPendingBit>
 8001844:	40013800 	.word	0x40013800
 8001848:	00050105 	.word	0x00050105
 800184c:	200007ec 	.word	0x200007ec
 8001850:	200007dc 	.word	0x200007dc

08001854 <i2c_delay>:
 8001854:	230b      	movs	r3, #11
 8001856:	3b01      	subs	r3, #1
 8001858:	d001      	beq.n	800185e <i2c_delay+0xa>
 800185a:	bf00      	nop
 800185c:	e7fb      	b.n	8001856 <i2c_delay+0x2>
 800185e:	4770      	bx	lr

08001860 <SetLowSDA>:
 8001860:	b513      	push	{r0, r1, r4, lr}
 8001862:	2301      	movs	r3, #1
 8001864:	2203      	movs	r2, #3
 8001866:	2410      	movs	r4, #16
 8001868:	f88d 3004 	strb.w	r3, [sp, #4]
 800186c:	f88d 3006 	strb.w	r3, [sp, #6]
 8001870:	4669      	mov	r1, sp
 8001872:	2300      	movs	r3, #0
 8001874:	f04f 4090 	mov.w	r0, #1207959552	; 0x48000000
 8001878:	f88d 2005 	strb.w	r2, [sp, #5]
 800187c:	f88d 3007 	strb.w	r3, [sp, #7]
 8001880:	9400      	str	r4, [sp, #0]
 8001882:	f000 fad6 	bl	8001e32 <GPIO_Init>
 8001886:	f04f 4090 	mov.w	r0, #1207959552	; 0x48000000
 800188a:	4621      	mov	r1, r4
 800188c:	f000 fb17 	bl	8001ebe <GPIO_ResetBits>
 8001890:	f7ff ffe0 	bl	8001854 <i2c_delay>
 8001894:	b002      	add	sp, #8
 8001896:	bd10      	pop	{r4, pc}

08001898 <SetHighSDA>:
 8001898:	b513      	push	{r0, r1, r4, lr}
 800189a:	2203      	movs	r2, #3
 800189c:	2300      	movs	r3, #0
 800189e:	2410      	movs	r4, #16
 80018a0:	f88d 2005 	strb.w	r2, [sp, #5]
 80018a4:	4669      	mov	r1, sp
 80018a6:	2201      	movs	r2, #1
 80018a8:	f04f 4090 	mov.w	r0, #1207959552	; 0x48000000
 80018ac:	f88d 3004 	strb.w	r3, [sp, #4]
 80018b0:	f88d 2006 	strb.w	r2, [sp, #6]
 80018b4:	f88d 3007 	strb.w	r3, [sp, #7]
 80018b8:	9400      	str	r4, [sp, #0]
 80018ba:	f000 faba 	bl	8001e32 <GPIO_Init>
 80018be:	f04f 4090 	mov.w	r0, #1207959552	; 0x48000000
 80018c2:	4621      	mov	r1, r4
 80018c4:	f000 faf7 	bl	8001eb6 <GPIO_SetBits>
 80018c8:	f7ff ffc4 	bl	8001854 <i2c_delay>
 80018cc:	b002      	add	sp, #8
 80018ce:	bd10      	pop	{r4, pc}

080018d0 <SetLowSCL>:
 80018d0:	b508      	push	{r3, lr}
 80018d2:	f04f 4090 	mov.w	r0, #1207959552	; 0x48000000
 80018d6:	2120      	movs	r1, #32
 80018d8:	f000 faf1 	bl	8001ebe <GPIO_ResetBits>
 80018dc:	e8bd 4008 	ldmia.w	sp!, {r3, lr}
 80018e0:	f7ff bfb8 	b.w	8001854 <i2c_delay>

080018e4 <SetHighSCL>:
 80018e4:	b508      	push	{r3, lr}
 80018e6:	f04f 4090 	mov.w	r0, #1207959552	; 0x48000000
 80018ea:	2120      	movs	r1, #32
 80018ec:	f000 fae3 	bl	8001eb6 <GPIO_SetBits>
 80018f0:	e8bd 4008 	ldmia.w	sp!, {r3, lr}
 80018f4:	f7ff bfae 	b.w	8001854 <i2c_delay>

080018f8 <i2c_0_init>:
 80018f8:	b507      	push	{r0, r1, r2, lr}
 80018fa:	f44f 3000 	mov.w	r0, #131072	; 0x20000
 80018fe:	2101      	movs	r1, #1
 8001900:	f7ff fc82 	bl	8001208 <RCC_AHBPeriphClockCmd>
 8001904:	2330      	movs	r3, #48	; 0x30
 8001906:	9300      	str	r3, [sp, #0]
 8001908:	2301      	movs	r3, #1
 800190a:	2203      	movs	r2, #3
 800190c:	f04f 4090 	mov.w	r0, #1207959552	; 0x48000000
 8001910:	4669      	mov	r1, sp
 8001912:	f88d 3004 	strb.w	r3, [sp, #4]
 8001916:	f88d 3006 	strb.w	r3, [sp, #6]
 800191a:	2300      	movs	r3, #0
 800191c:	f88d 2005 	strb.w	r2, [sp, #5]
 8001920:	f88d 3007 	strb.w	r3, [sp, #7]
 8001924:	f000 fa85 	bl	8001e32 <GPIO_Init>
 8001928:	f7ff ffdc 	bl	80018e4 <SetHighSCL>
 800192c:	f7ff ff98 	bl	8001860 <SetLowSDA>
 8001930:	f7ff ffb2 	bl	8001898 <SetHighSDA>
 8001934:	b003      	add	sp, #12
 8001936:	f85d fb04 	ldr.w	pc, [sp], #4

0800193a <i2cStart>:
 800193a:	b508      	push	{r3, lr}
 800193c:	f7ff ffd2 	bl	80018e4 <SetHighSCL>
 8001940:	f7ff ffaa 	bl	8001898 <SetHighSDA>
 8001944:	f7ff ffce 	bl	80018e4 <SetHighSCL>
 8001948:	f7ff ff8a 	bl	8001860 <SetLowSDA>
 800194c:	f7ff ffc0 	bl	80018d0 <SetLowSCL>
 8001950:	e8bd 4008 	ldmia.w	sp!, {r3, lr}
 8001954:	f7ff bfa0 	b.w	8001898 <SetHighSDA>

08001958 <i2cStop>:
 8001958:	b508      	push	{r3, lr}
 800195a:	f7ff ffb9 	bl	80018d0 <SetLowSCL>
 800195e:	f7ff ff7f 	bl	8001860 <SetLowSDA>
 8001962:	f7ff ffbf 	bl	80018e4 <SetHighSCL>
 8001966:	f7ff ff7b 	bl	8001860 <SetLowSDA>
 800196a:	f7ff ffbb 	bl	80018e4 <SetHighSCL>
 800196e:	e8bd 4008 	ldmia.w	sp!, {r3, lr}
 8001972:	f7ff bf91 	b.w	8001898 <SetHighSDA>

08001976 <i2cWrite>:
 8001976:	b538      	push	{r3, r4, r5, lr}
 8001978:	4605      	mov	r5, r0
 800197a:	2408      	movs	r4, #8
 800197c:	f7ff ffa8 	bl	80018d0 <SetLowSCL>
 8001980:	062b      	lsls	r3, r5, #24
 8001982:	d502      	bpl.n	800198a <i2cWrite+0x14>
 8001984:	f7ff ff88 	bl	8001898 <SetHighSDA>
 8001988:	e001      	b.n	800198e <i2cWrite+0x18>
 800198a:	f7ff ff69 	bl	8001860 <SetLowSDA>
 800198e:	3c01      	subs	r4, #1
 8001990:	f7ff ffa8 	bl	80018e4 <SetHighSCL>
 8001994:	006d      	lsls	r5, r5, #1
 8001996:	f014 04ff 	ands.w	r4, r4, #255	; 0xff
 800199a:	b2ed      	uxtb	r5, r5
 800199c:	d1ee      	bne.n	800197c <i2cWrite+0x6>
 800199e:	f7ff ff97 	bl	80018d0 <SetLowSCL>
 80019a2:	f7ff ff79 	bl	8001898 <SetHighSDA>
 80019a6:	f7ff ff9d 	bl	80018e4 <SetHighSCL>
 80019aa:	f04f 4390 	mov.w	r3, #1207959552	; 0x48000000
 80019ae:	8a1c      	ldrh	r4, [r3, #16]
 80019b0:	b2a4      	uxth	r4, r4
 80019b2:	f7ff ff8d 	bl	80018d0 <SetLowSCL>
 80019b6:	f7ff ff4d 	bl	8001854 <i2c_delay>
 80019ba:	f084 0010 	eor.w	r0, r4, #16
 80019be:	f3c0 1000 	ubfx	r0, r0, #4, #1
 80019c2:	bd38      	pop	{r3, r4, r5, pc}

080019c4 <i2cRead>:
 80019c4:	b570      	push	{r4, r5, r6, lr}
 80019c6:	4606      	mov	r6, r0
 80019c8:	f7ff ff82 	bl	80018d0 <SetLowSCL>
 80019cc:	f7ff ff64 	bl	8001898 <SetHighSDA>
 80019d0:	2508      	movs	r5, #8
 80019d2:	2400      	movs	r4, #0
 80019d4:	f7ff ff86 	bl	80018e4 <SetHighSCL>
 80019d8:	f04f 4390 	mov.w	r3, #1207959552	; 0x48000000
 80019dc:	0064      	lsls	r4, r4, #1
 80019de:	8a1b      	ldrh	r3, [r3, #16]
 80019e0:	b2e4      	uxtb	r4, r4
 80019e2:	06db      	lsls	r3, r3, #27
 80019e4:	bf48      	it	mi
 80019e6:	3401      	addmi	r4, #1
 80019e8:	f105 35ff 	add.w	r5, r5, #4294967295	; 0xffffffff
 80019ec:	bf48      	it	mi
 80019ee:	b2e4      	uxtbmi	r4, r4
 80019f0:	f7ff ff6e 	bl	80018d0 <SetLowSCL>
 80019f4:	f015 05ff 	ands.w	r5, r5, #255	; 0xff
 80019f8:	d1ec      	bne.n	80019d4 <i2cRead+0x10>
 80019fa:	b10e      	cbz	r6, 8001a00 <i2cRead+0x3c>
 80019fc:	f7ff ff30 	bl	8001860 <SetLowSDA>
 8001a00:	f7ff ff70 	bl	80018e4 <SetHighSCL>
 8001a04:	f7ff ff64 	bl	80018d0 <SetLowSCL>
 8001a08:	f7ff ff24 	bl	8001854 <i2c_delay>
 8001a0c:	4620      	mov	r0, r4
 8001a0e:	bd70      	pop	{r4, r5, r6, pc}

08001a10 <i2c_write_reg>:
 8001a10:	b570      	push	{r4, r5, r6, lr}
 8001a12:	4606      	mov	r6, r0
 8001a14:	460d      	mov	r5, r1
 8001a16:	4614      	mov	r4, r2
 8001a18:	f7ff ff8f 	bl	800193a <i2cStart>
 8001a1c:	4630      	mov	r0, r6
 8001a1e:	f7ff ffaa 	bl	8001976 <i2cWrite>
 8001a22:	4628      	mov	r0, r5
 8001a24:	f7ff ffa7 	bl	8001976 <i2cWrite>
 8001a28:	4620      	mov	r0, r4
 8001a2a:	f7ff ffa4 	bl	8001976 <i2cWrite>
 8001a2e:	e8bd 4070 	ldmia.w	sp!, {r4, r5, r6, lr}
 8001a32:	f7ff bf91 	b.w	8001958 <i2cStop>

08001a36 <i2c_read_reg>:
 8001a36:	b538      	push	{r3, r4, r5, lr}
 8001a38:	4604      	mov	r4, r0
 8001a3a:	460d      	mov	r5, r1
 8001a3c:	f7ff ff7d 	bl	800193a <i2cStart>
 8001a40:	4620      	mov	r0, r4
 8001a42:	f7ff ff98 	bl	8001976 <i2cWrite>
 8001a46:	4628      	mov	r0, r5
 8001a48:	f7ff ff95 	bl	8001976 <i2cWrite>
 8001a4c:	f7ff ff75 	bl	800193a <i2cStart>
 8001a50:	f044 0001 	orr.w	r0, r4, #1
 8001a54:	f7ff ff8f 	bl	8001976 <i2cWrite>
 8001a58:	2000      	movs	r0, #0
 8001a5a:	f7ff ffb3 	bl	80019c4 <i2cRead>
 8001a5e:	4604      	mov	r4, r0
 8001a60:	f7ff ff7a 	bl	8001958 <i2cStop>
 8001a64:	4620      	mov	r0, r4
 8001a66:	bd38      	pop	{r3, r4, r5, pc}

08001a68 <SystemInit>:
 8001a68:	4a39      	ldr	r2, [pc, #228]	; (8001b50 <SystemInit+0xe8>)
 8001a6a:	f8d2 3088 	ldr.w	r3, [r2, #136]	; 0x88
 8001a6e:	f443 0370 	orr.w	r3, r3, #15728640	; 0xf00000
 8001a72:	f8c2 3088 	str.w	r3, [r2, #136]	; 0x88
 8001a76:	4b37      	ldr	r3, [pc, #220]	; (8001b54 <SystemInit+0xec>)
 8001a78:	681a      	ldr	r2, [r3, #0]
 8001a7a:	f042 0201 	orr.w	r2, r2, #1
 8001a7e:	601a      	str	r2, [r3, #0]
 8001a80:	6859      	ldr	r1, [r3, #4]
 8001a82:	4a35      	ldr	r2, [pc, #212]	; (8001b58 <SystemInit+0xf0>)
 8001a84:	400a      	ands	r2, r1
 8001a86:	605a      	str	r2, [r3, #4]
 8001a88:	681a      	ldr	r2, [r3, #0]
 8001a8a:	f022 7284 	bic.w	r2, r2, #17301504	; 0x1080000
 8001a8e:	f422 3280 	bic.w	r2, r2, #65536	; 0x10000
 8001a92:	601a      	str	r2, [r3, #0]
 8001a94:	681a      	ldr	r2, [r3, #0]
 8001a96:	f422 2280 	bic.w	r2, r2, #262144	; 0x40000
 8001a9a:	601a      	str	r2, [r3, #0]
 8001a9c:	685a      	ldr	r2, [r3, #4]
 8001a9e:	f422 02fe 	bic.w	r2, r2, #8323072	; 0x7f0000
 8001aa2:	605a      	str	r2, [r3, #4]
 8001aa4:	6ada      	ldr	r2, [r3, #44]	; 0x2c
 8001aa6:	f022 020f 	bic.w	r2, r2, #15
 8001aaa:	62da      	str	r2, [r3, #44]	; 0x2c
 8001aac:	6b19      	ldr	r1, [r3, #48]	; 0x30
 8001aae:	4a2b      	ldr	r2, [pc, #172]	; (8001b5c <SystemInit+0xf4>)
 8001ab0:	b082      	sub	sp, #8
 8001ab2:	400a      	ands	r2, r1
 8001ab4:	631a      	str	r2, [r3, #48]	; 0x30
 8001ab6:	2200      	movs	r2, #0
 8001ab8:	609a      	str	r2, [r3, #8]
 8001aba:	9200      	str	r2, [sp, #0]
 8001abc:	9201      	str	r2, [sp, #4]
 8001abe:	681a      	ldr	r2, [r3, #0]
 8001ac0:	f442 3280 	orr.w	r2, r2, #65536	; 0x10000
 8001ac4:	601a      	str	r2, [r3, #0]
 8001ac6:	681a      	ldr	r2, [r3, #0]
 8001ac8:	f402 3200 	and.w	r2, r2, #131072	; 0x20000
 8001acc:	9201      	str	r2, [sp, #4]
 8001ace:	9a00      	ldr	r2, [sp, #0]
 8001ad0:	3201      	adds	r2, #1
 8001ad2:	9200      	str	r2, [sp, #0]
 8001ad4:	9a01      	ldr	r2, [sp, #4]
 8001ad6:	b91a      	cbnz	r2, 8001ae0 <SystemInit+0x78>
 8001ad8:	9a00      	ldr	r2, [sp, #0]
 8001ada:	f5b2 4fa0 	cmp.w	r2, #20480	; 0x5000
 8001ade:	d1f2      	bne.n	8001ac6 <SystemInit+0x5e>
 8001ae0:	681a      	ldr	r2, [r3, #0]
 8001ae2:	f412 3200 	ands.w	r2, r2, #131072	; 0x20000
 8001ae6:	bf18      	it	ne
 8001ae8:	2201      	movne	r2, #1
 8001aea:	9201      	str	r2, [sp, #4]
 8001aec:	9a01      	ldr	r2, [sp, #4]
 8001aee:	2a01      	cmp	r2, #1
 8001af0:	d005      	beq.n	8001afe <SystemInit+0x96>
 8001af2:	4b17      	ldr	r3, [pc, #92]	; (8001b50 <SystemInit+0xe8>)
 8001af4:	f04f 6200 	mov.w	r2, #134217728	; 0x8000000
 8001af8:	609a      	str	r2, [r3, #8]
 8001afa:	b002      	add	sp, #8
 8001afc:	4770      	bx	lr
 8001afe:	4a18      	ldr	r2, [pc, #96]	; (8001b60 <SystemInit+0xf8>)
 8001b00:	2112      	movs	r1, #18
 8001b02:	6011      	str	r1, [r2, #0]
 8001b04:	685a      	ldr	r2, [r3, #4]
 8001b06:	605a      	str	r2, [r3, #4]
 8001b08:	685a      	ldr	r2, [r3, #4]
 8001b0a:	605a      	str	r2, [r3, #4]
 8001b0c:	685a      	ldr	r2, [r3, #4]
 8001b0e:	f442 6280 	orr.w	r2, r2, #1024	; 0x400
 8001b12:	605a      	str	r2, [r3, #4]
 8001b14:	685a      	ldr	r2, [r3, #4]
 8001b16:	f422 127c 	bic.w	r2, r2, #4128768	; 0x3f0000
 8001b1a:	605a      	str	r2, [r3, #4]
 8001b1c:	685a      	ldr	r2, [r3, #4]
 8001b1e:	f442 12e8 	orr.w	r2, r2, #1900544	; 0x1d0000
 8001b22:	605a      	str	r2, [r3, #4]
 8001b24:	681a      	ldr	r2, [r3, #0]
 8001b26:	f042 7280 	orr.w	r2, r2, #16777216	; 0x1000000
 8001b2a:	601a      	str	r2, [r3, #0]
 8001b2c:	6819      	ldr	r1, [r3, #0]
 8001b2e:	4a09      	ldr	r2, [pc, #36]	; (8001b54 <SystemInit+0xec>)
 8001b30:	0189      	lsls	r1, r1, #6
 8001b32:	d5fb      	bpl.n	8001b2c <SystemInit+0xc4>
 8001b34:	6851      	ldr	r1, [r2, #4]
 8001b36:	f021 0103 	bic.w	r1, r1, #3
 8001b3a:	6051      	str	r1, [r2, #4]
 8001b3c:	6851      	ldr	r1, [r2, #4]
 8001b3e:	f041 0102 	orr.w	r1, r1, #2
 8001b42:	6051      	str	r1, [r2, #4]
 8001b44:	685a      	ldr	r2, [r3, #4]
 8001b46:	f002 020c 	and.w	r2, r2, #12
 8001b4a:	2a08      	cmp	r2, #8
 8001b4c:	d1fa      	bne.n	8001b44 <SystemInit+0xdc>
 8001b4e:	e7d0      	b.n	8001af2 <SystemInit+0x8a>
 8001b50:	e000ed00 	.word	0xe000ed00
 8001b54:	40021000 	.word	0x40021000
 8001b58:	f87fc00c 	.word	0xf87fc00c
 8001b5c:	ff00fccc 	.word	0xff00fccc
 8001b60:	40022000 	.word	0x40022000

08001b64 <sys_tick_init>:
 8001b64:	4b05      	ldr	r3, [pc, #20]	; (8001b7c <sys_tick_init+0x18>)
 8001b66:	4a06      	ldr	r2, [pc, #24]	; (8001b80 <sys_tick_init+0x1c>)
 8001b68:	605a      	str	r2, [r3, #4]
 8001b6a:	4a06      	ldr	r2, [pc, #24]	; (8001b84 <sys_tick_init+0x20>)
 8001b6c:	21f0      	movs	r1, #240	; 0xf0
 8001b6e:	f882 1023 	strb.w	r1, [r2, #35]	; 0x23
 8001b72:	2200      	movs	r2, #0
 8001b74:	609a      	str	r2, [r3, #8]
 8001b76:	2207      	movs	r2, #7
 8001b78:	601a      	str	r2, [r3, #0]
 8001b7a:	4770      	bx	lr
 8001b7c:	e000e010 	.word	0xe000e010
 8001b80:	00029040 	.word	0x00029040
 8001b84:	e000ed00 	.word	0xe000ed00

08001b88 <sleep>:
 8001b88:	bf30      	wfi
 8001b8a:	4770      	bx	lr

08001b8c <sytem_clock_init>:
 8001b8c:	f7ff bf6c 	b.w	8001a68 <SystemInit>

08001b90 <pwm_set>:
 8001b90:	e92d 41f0 	stmdb	sp!, {r4, r5, r6, r7, r8, lr}
 8001b94:	b086      	sub	sp, #24
 8001b96:	2370      	movs	r3, #112	; 0x70
 8001b98:	9301      	str	r3, [sp, #4]
 8001b9a:	2301      	movs	r3, #1
 8001b9c:	f8ad 3008 	strh.w	r3, [sp, #8]
 8001ba0:	2304      	movs	r3, #4
 8001ba2:	f8ad 300a 	strh.w	r3, [sp, #10]
 8001ba6:	f8df 8064 	ldr.w	r8, [pc, #100]	; 8001c0c <pwm_set+0x7c>
 8001baa:	4c17      	ldr	r4, [pc, #92]	; (8001c08 <pwm_set+0x78>)
 8001bac:	2302      	movs	r3, #2
 8001bae:	f8ad 3010 	strh.w	r3, [sp, #16]
 8001bb2:	2300      	movs	r3, #0
 8001bb4:	f8ad 3012 	strh.w	r3, [sp, #18]
 8001bb8:	f8ad 3016 	strh.w	r3, [sp, #22]
 8001bbc:	f242 7710 	movw	r7, #10000	; 0x2710
 8001bc0:	f8d8 3000 	ldr.w	r3, [r8]
 8001bc4:	fbb3 f3f7 	udiv	r3, r3, r7
 8001bc8:	3b02      	subs	r3, #2
 8001bca:	f44f 7280 	mov.w	r2, #256	; 0x100
 8001bce:	460e      	mov	r6, r1
 8001bd0:	2564      	movs	r5, #100	; 0x64
 8001bd2:	a901      	add	r1, sp, #4
 8001bd4:	4358      	muls	r0, r3
 8001bd6:	fbb0 f3f5 	udiv	r3, r0, r5
 8001bda:	4620      	mov	r0, r4
 8001bdc:	f8ad 2014 	strh.w	r2, [sp, #20]
 8001be0:	9303      	str	r3, [sp, #12]
 8001be2:	f7ff fb99 	bl	8001318 <TIM_OC1Init>
 8001be6:	f8d8 1000 	ldr.w	r1, [r8]
 8001bea:	fbb1 f1f7 	udiv	r1, r1, r7
 8001bee:	3902      	subs	r1, #2
 8001bf0:	4371      	muls	r1, r6
 8001bf2:	4620      	mov	r0, r4
 8001bf4:	fbb1 f1f5 	udiv	r1, r1, r5
 8001bf8:	9103      	str	r1, [sp, #12]
 8001bfa:	a901      	add	r1, sp, #4
 8001bfc:	f7ff fbd2 	bl	80013a4 <TIM_OC2Init>
 8001c00:	b006      	add	sp, #24
 8001c02:	e8bd 81f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, pc}
 8001c06:	bf00      	nop
 8001c08:	40012c00 	.word	0x40012c00
 8001c0c:	20000030 	.word	0x20000030

08001c10 <pwm_init>:
 8001c10:	b530      	push	{r4, r5, lr}
 8001c12:	f44f 6000 	mov.w	r0, #2048	; 0x800
 8001c16:	b087      	sub	sp, #28
 8001c18:	2101      	movs	r1, #1
 8001c1a:	f7ff fb03 	bl	8001224 <RCC_APB2PeriphClockCmd>
 8001c1e:	f44f 2080 	mov.w	r0, #262144	; 0x40000
 8001c22:	2101      	movs	r1, #1
 8001c24:	f7ff faf0 	bl	8001208 <RCC_AHBPeriphClockCmd>
 8001c28:	4c1d      	ldr	r4, [pc, #116]	; (8001ca0 <pwm_init+0x90>)
 8001c2a:	4d1e      	ldr	r5, [pc, #120]	; (8001ca4 <pwm_init+0x94>)
 8001c2c:	f44f 43c0 	mov.w	r3, #24576	; 0x6000
 8001c30:	9301      	str	r3, [sp, #4]
 8001c32:	2302      	movs	r3, #2
 8001c34:	f88d 3008 	strb.w	r3, [sp, #8]
 8001c38:	4620      	mov	r0, r4
 8001c3a:	2303      	movs	r3, #3
 8001c3c:	a901      	add	r1, sp, #4
 8001c3e:	f88d 3009 	strb.w	r3, [sp, #9]
 8001c42:	f000 f8f6 	bl	8001e32 <GPIO_Init>
 8001c46:	4620      	mov	r0, r4
 8001c48:	210d      	movs	r1, #13
 8001c4a:	2206      	movs	r2, #6
 8001c4c:	f000 f93b 	bl	8001ec6 <GPIO_PinAFConfig>
 8001c50:	4620      	mov	r0, r4
 8001c52:	210e      	movs	r1, #14
 8001c54:	2206      	movs	r2, #6
 8001c56:	f000 f936 	bl	8001ec6 <GPIO_PinAFConfig>
 8001c5a:	4b13      	ldr	r3, [pc, #76]	; (8001ca8 <pwm_init+0x98>)
 8001c5c:	2400      	movs	r4, #0
 8001c5e:	f242 7210 	movw	r2, #10000	; 0x2710
 8001c62:	4628      	mov	r0, r5
 8001c64:	a903      	add	r1, sp, #12
 8001c66:	681b      	ldr	r3, [r3, #0]
 8001c68:	fbb3 f3f2 	udiv	r3, r3, r2
 8001c6c:	3b01      	subs	r3, #1
 8001c6e:	9304      	str	r3, [sp, #16]
 8001c70:	f8ad 400c 	strh.w	r4, [sp, #12]
 8001c74:	f8ad 400e 	strh.w	r4, [sp, #14]
 8001c78:	f8ad 4014 	strh.w	r4, [sp, #20]
 8001c7c:	f8ad 4016 	strh.w	r4, [sp, #22]
 8001c80:	f7ff faec 	bl	800125c <TIM_TimeBaseInit>
 8001c84:	4620      	mov	r0, r4
 8001c86:	4621      	mov	r1, r4
 8001c88:	f7ff ff82 	bl	8001b90 <pwm_set>
 8001c8c:	4628      	mov	r0, r5
 8001c8e:	2101      	movs	r1, #1
 8001c90:	f7ff fb34 	bl	80012fc <TIM_Cmd>
 8001c94:	4628      	mov	r0, r5
 8001c96:	2101      	movs	r1, #1
 8001c98:	f7ff fbc2 	bl	8001420 <TIM_CtrlPWMOutputs>
 8001c9c:	b007      	add	sp, #28
 8001c9e:	bd30      	pop	{r4, r5, pc}
 8001ca0:	48000400 	.word	0x48000400
 8001ca4:	40012c00 	.word	0x40012c00
 8001ca8:	20000030 	.word	0x20000030

08001cac <drv8834_run>:
 8001cac:	1e03      	subs	r3, r0, #0
 8001cae:	4819      	ldr	r0, [pc, #100]	; (8001d14 <drv8834_run+0x68>)
 8001cb0:	dd09      	ble.n	8001cc6 <drv8834_run+0x1a>
 8001cb2:	6982      	ldr	r2, [r0, #24]
 8001cb4:	f042 0208 	orr.w	r2, r2, #8
 8001cb8:	6182      	str	r2, [r0, #24]
 8001cba:	f04f 4290 	mov.w	r2, #1207959552	; 0x48000000
 8001cbe:	f44f 4000 	mov.w	r0, #32768	; 0x8000
 8001cc2:	6190      	str	r0, [r2, #24]
 8001cc4:	e00b      	b.n	8001cde <drv8834_run+0x32>
 8001cc6:	8d02      	ldrh	r2, [r0, #40]	; 0x28
 8001cc8:	b292      	uxth	r2, r2
 8001cca:	f042 0208 	orr.w	r2, r2, #8
 8001cce:	8502      	strh	r2, [r0, #40]	; 0x28
 8001cd0:	f04f 4290 	mov.w	r2, #1207959552	; 0x48000000
 8001cd4:	f44f 4000 	mov.w	r0, #32768	; 0x8000
 8001cd8:	425b      	negs	r3, r3
 8001cda:	8510      	strh	r0, [r2, #40]	; 0x28
 8001cdc:	b21b      	sxth	r3, r3
 8001cde:	480d      	ldr	r0, [pc, #52]	; (8001d14 <drv8834_run+0x68>)
 8001ce0:	2900      	cmp	r1, #0
 8001ce2:	bfcd      	iteet	gt
 8001ce4:	8d02      	ldrhgt	r2, [r0, #40]	; 0x28
 8001ce6:	6982      	ldrle	r2, [r0, #24]
 8001ce8:	4249      	negle	r1, r1
 8001cea:	b292      	uxthgt	r2, r2
 8001cec:	bfd5      	itete	le
 8001cee:	b209      	sxthle	r1, r1
 8001cf0:	f042 0220 	orrgt.w	r2, r2, #32
 8001cf4:	f042 0220 	orrle.w	r2, r2, #32
 8001cf8:	8502      	strhgt	r2, [r0, #40]	; 0x28
 8001cfa:	bfd8      	it	le
 8001cfc:	6182      	strle	r2, [r0, #24]
 8001cfe:	2964      	cmp	r1, #100	; 0x64
 8001d00:	bfa8      	it	ge
 8001d02:	2164      	movge	r1, #100	; 0x64
 8001d04:	2b64      	cmp	r3, #100	; 0x64
 8001d06:	bfa8      	it	ge
 8001d08:	2364      	movge	r3, #100	; 0x64
 8001d0a:	4608      	mov	r0, r1
 8001d0c:	4619      	mov	r1, r3
 8001d0e:	f7ff bf3f 	b.w	8001b90 <pwm_set>
 8001d12:	bf00      	nop
 8001d14:	48000400 	.word	0x48000400

08001d18 <drv8834_init>:
 8001d18:	b5f7      	push	{r0, r1, r2, r4, r5, r6, r7, lr}
 8001d1a:	4d1f      	ldr	r5, [pc, #124]	; (8001d98 <drv8834_init+0x80>)
 8001d1c:	2400      	movs	r4, #0
 8001d1e:	2603      	movs	r6, #3
 8001d20:	2338      	movs	r3, #56	; 0x38
 8001d22:	2701      	movs	r7, #1
 8001d24:	4628      	mov	r0, r5
 8001d26:	4669      	mov	r1, sp
 8001d28:	9300      	str	r3, [sp, #0]
 8001d2a:	f88d 7004 	strb.w	r7, [sp, #4]
 8001d2e:	f88d 4006 	strb.w	r4, [sp, #6]
 8001d32:	f88d 6005 	strb.w	r6, [sp, #5]
 8001d36:	f88d 4007 	strb.w	r4, [sp, #7]
 8001d3a:	f000 f87a 	bl	8001e32 <GPIO_Init>
 8001d3e:	2308      	movs	r3, #8
 8001d40:	9300      	str	r3, [sp, #0]
 8001d42:	4628      	mov	r0, r5
 8001d44:	2302      	movs	r3, #2
 8001d46:	4669      	mov	r1, sp
 8001d48:	f88d 3004 	strb.w	r3, [sp, #4]
 8001d4c:	f88d 4006 	strb.w	r4, [sp, #6]
 8001d50:	f88d 6005 	strb.w	r6, [sp, #5]
 8001d54:	f88d 4007 	strb.w	r4, [sp, #7]
 8001d58:	f000 f86b 	bl	8001e32 <GPIO_Init>
 8001d5c:	220f      	movs	r2, #15
 8001d5e:	4628      	mov	r0, r5
 8001d60:	4631      	mov	r1, r6
 8001d62:	f000 f8b0 	bl	8001ec6 <GPIO_PinAFConfig>
 8001d66:	f44f 4300 	mov.w	r3, #32768	; 0x8000
 8001d6a:	4669      	mov	r1, sp
 8001d6c:	f04f 4090 	mov.w	r0, #1207959552	; 0x48000000
 8001d70:	9300      	str	r3, [sp, #0]
 8001d72:	f88d 7004 	strb.w	r7, [sp, #4]
 8001d76:	f88d 4006 	strb.w	r4, [sp, #6]
 8001d7a:	f88d 6005 	strb.w	r6, [sp, #5]
 8001d7e:	f88d 4007 	strb.w	r4, [sp, #7]
 8001d82:	f000 f856 	bl	8001e32 <GPIO_Init>
 8001d86:	2310      	movs	r3, #16
 8001d88:	852b      	strh	r3, [r5, #40]	; 0x28
 8001d8a:	4620      	mov	r0, r4
 8001d8c:	4621      	mov	r1, r4
 8001d8e:	f7ff ff8d 	bl	8001cac <drv8834_run>
 8001d92:	b003      	add	sp, #12
 8001d94:	bdf0      	pop	{r4, r5, r6, r7, pc}
 8001d96:	bf00      	nop
 8001d98:	48000400 	.word	0x48000400

08001d9c <NVIC_Init>:
 8001d9c:	b510      	push	{r4, lr}
 8001d9e:	bf00      	nop
 8001da0:	bf00      	nop
 8001da2:	bf00      	nop
 8001da4:	78c2      	ldrb	r2, [r0, #3]
 8001da6:	7803      	ldrb	r3, [r0, #0]
 8001da8:	b312      	cbz	r2, 8001df0 <NVIC_Init+0x54>
 8001daa:	4a17      	ldr	r2, [pc, #92]	; (8001e08 <NVIC_Init+0x6c>)
 8001dac:	68d1      	ldr	r1, [r2, #12]
 8001dae:	7842      	ldrb	r2, [r0, #1]
 8001db0:	43c9      	mvns	r1, r1
 8001db2:	f3c1 2102 	ubfx	r1, r1, #8, #3
 8001db6:	f1c1 0404 	rsb	r4, r1, #4
 8001dba:	b2e4      	uxtb	r4, r4
 8001dbc:	40a2      	lsls	r2, r4
 8001dbe:	b2d4      	uxtb	r4, r2
 8001dc0:	220f      	movs	r2, #15
 8001dc2:	410a      	asrs	r2, r1
 8001dc4:	7881      	ldrb	r1, [r0, #2]
 8001dc6:	400a      	ands	r2, r1
 8001dc8:	4322      	orrs	r2, r4
 8001dca:	f103 4360 	add.w	r3, r3, #3758096384	; 0xe0000000
 8001dce:	f503 4361 	add.w	r3, r3, #57600	; 0xe100
 8001dd2:	0112      	lsls	r2, r2, #4
 8001dd4:	b2d2      	uxtb	r2, r2
 8001dd6:	f883 2300 	strb.w	r2, [r3, #768]	; 0x300
 8001dda:	7803      	ldrb	r3, [r0, #0]
 8001ddc:	2201      	movs	r2, #1
 8001dde:	0959      	lsrs	r1, r3, #5
 8001de0:	f003 031f 	and.w	r3, r3, #31
 8001de4:	fa02 f303 	lsl.w	r3, r2, r3
 8001de8:	4a08      	ldr	r2, [pc, #32]	; (8001e0c <NVIC_Init+0x70>)
 8001dea:	f842 3021 	str.w	r3, [r2, r1, lsl #2]
 8001dee:	bd10      	pop	{r4, pc}
 8001df0:	095a      	lsrs	r2, r3, #5
 8001df2:	2101      	movs	r1, #1
 8001df4:	f003 031f 	and.w	r3, r3, #31
 8001df8:	4099      	lsls	r1, r3
 8001dfa:	f102 0320 	add.w	r3, r2, #32
 8001dfe:	4a03      	ldr	r2, [pc, #12]	; (8001e0c <NVIC_Init+0x70>)
 8001e00:	f842 1023 	str.w	r1, [r2, r3, lsl #2]
 8001e04:	bd10      	pop	{r4, pc}
 8001e06:	bf00      	nop
 8001e08:	e000ed00 	.word	0xe000ed00
 8001e0c:	e000e100 	.word	0xe000e100

08001e10 <lib_low_level_init>:
 8001e10:	b508      	push	{r3, lr}
 8001e12:	f7ff febb 	bl	8001b8c <sytem_clock_init>
 8001e16:	f000 f86b 	bl	8001ef0 <gpio_init>
 8001e1a:	f7ff fc95 	bl	8001748 <uart_init>
 8001e1e:	f7ff fb0f 	bl	8001440 <timer_init>
 8001e22:	f7ff fef5 	bl	8001c10 <pwm_init>
 8001e26:	f7ff ff77 	bl	8001d18 <drv8834_init>
 8001e2a:	e8bd 4008 	ldmia.w	sp!, {r3, lr}
 8001e2e:	f7ff bd63 	b.w	80018f8 <i2c_0_init>

08001e32 <GPIO_Init>:
 8001e32:	b5f0      	push	{r4, r5, r6, r7, lr}
 8001e34:	bf00      	nop
 8001e36:	bf00      	nop
 8001e38:	bf00      	nop
 8001e3a:	bf00      	nop
 8001e3c:	2300      	movs	r3, #0
 8001e3e:	680e      	ldr	r6, [r1, #0]
 8001e40:	461c      	mov	r4, r3
 8001e42:	2501      	movs	r5, #1
 8001e44:	40a5      	lsls	r5, r4
 8001e46:	ea05 0e06 	and.w	lr, r5, r6
 8001e4a:	45ae      	cmp	lr, r5
 8001e4c:	d12d      	bne.n	8001eaa <GPIO_Init+0x78>
 8001e4e:	790f      	ldrb	r7, [r1, #4]
 8001e50:	1e7a      	subs	r2, r7, #1
 8001e52:	2a01      	cmp	r2, #1
 8001e54:	d817      	bhi.n	8001e86 <GPIO_Init+0x54>
 8001e56:	bf00      	nop
 8001e58:	2203      	movs	r2, #3
 8001e5a:	6885      	ldr	r5, [r0, #8]
 8001e5c:	409a      	lsls	r2, r3
 8001e5e:	ea25 0202 	bic.w	r2, r5, r2
 8001e62:	6082      	str	r2, [r0, #8]
 8001e64:	794d      	ldrb	r5, [r1, #5]
 8001e66:	6882      	ldr	r2, [r0, #8]
 8001e68:	409d      	lsls	r5, r3
 8001e6a:	4315      	orrs	r5, r2
 8001e6c:	6085      	str	r5, [r0, #8]
 8001e6e:	bf00      	nop
 8001e70:	8882      	ldrh	r2, [r0, #4]
 8001e72:	b292      	uxth	r2, r2
 8001e74:	ea22 020e 	bic.w	r2, r2, lr
 8001e78:	8082      	strh	r2, [r0, #4]
 8001e7a:	798a      	ldrb	r2, [r1, #6]
 8001e7c:	8885      	ldrh	r5, [r0, #4]
 8001e7e:	40a2      	lsls	r2, r4
 8001e80:	432a      	orrs	r2, r5
 8001e82:	b292      	uxth	r2, r2
 8001e84:	8082      	strh	r2, [r0, #4]
 8001e86:	2203      	movs	r2, #3
 8001e88:	6805      	ldr	r5, [r0, #0]
 8001e8a:	409a      	lsls	r2, r3
 8001e8c:	43d2      	mvns	r2, r2
 8001e8e:	4015      	ands	r5, r2
 8001e90:	6005      	str	r5, [r0, #0]
 8001e92:	6805      	ldr	r5, [r0, #0]
 8001e94:	409f      	lsls	r7, r3
 8001e96:	432f      	orrs	r7, r5
 8001e98:	6007      	str	r7, [r0, #0]
 8001e9a:	68c7      	ldr	r7, [r0, #12]
 8001e9c:	4017      	ands	r7, r2
 8001e9e:	79ca      	ldrb	r2, [r1, #7]
 8001ea0:	fa02 f503 	lsl.w	r5, r2, r3
 8001ea4:	ea47 0205 	orr.w	r2, r7, r5
 8001ea8:	60c2      	str	r2, [r0, #12]
 8001eaa:	3401      	adds	r4, #1
 8001eac:	2c10      	cmp	r4, #16
 8001eae:	f103 0302 	add.w	r3, r3, #2
 8001eb2:	d1c6      	bne.n	8001e42 <GPIO_Init+0x10>
 8001eb4:	bdf0      	pop	{r4, r5, r6, r7, pc}

08001eb6 <GPIO_SetBits>:
 8001eb6:	bf00      	nop
 8001eb8:	bf00      	nop
 8001eba:	6181      	str	r1, [r0, #24]
 8001ebc:	4770      	bx	lr

08001ebe <GPIO_ResetBits>:
 8001ebe:	bf00      	nop
 8001ec0:	bf00      	nop
 8001ec2:	8501      	strh	r1, [r0, #40]	; 0x28
 8001ec4:	4770      	bx	lr

08001ec6 <GPIO_PinAFConfig>:
 8001ec6:	b510      	push	{r4, lr}
 8001ec8:	bf00      	nop
 8001eca:	bf00      	nop
 8001ecc:	bf00      	nop
 8001ece:	f001 0307 	and.w	r3, r1, #7
 8001ed2:	08c9      	lsrs	r1, r1, #3
 8001ed4:	eb00 0081 	add.w	r0, r0, r1, lsl #2
 8001ed8:	009b      	lsls	r3, r3, #2
 8001eda:	6a04      	ldr	r4, [r0, #32]
 8001edc:	210f      	movs	r1, #15
 8001ede:	4099      	lsls	r1, r3
 8001ee0:	ea24 0101 	bic.w	r1, r4, r1
 8001ee4:	6201      	str	r1, [r0, #32]
 8001ee6:	6a01      	ldr	r1, [r0, #32]
 8001ee8:	409a      	lsls	r2, r3
 8001eea:	430a      	orrs	r2, r1
 8001eec:	6202      	str	r2, [r0, #32]
 8001eee:	bd10      	pop	{r4, pc}

08001ef0 <gpio_init>:
 8001ef0:	b507      	push	{r0, r1, r2, lr}
 8001ef2:	f44f 3000 	mov.w	r0, #131072	; 0x20000
 8001ef6:	2101      	movs	r1, #1
 8001ef8:	f7ff f986 	bl	8001208 <RCC_AHBPeriphClockCmd>
 8001efc:	f44f 2080 	mov.w	r0, #262144	; 0x40000
 8001f00:	2101      	movs	r1, #1
 8001f02:	f7ff f981 	bl	8001208 <RCC_AHBPeriphClockCmd>
 8001f06:	f44f 2000 	mov.w	r0, #524288	; 0x80000
 8001f0a:	2101      	movs	r1, #1
 8001f0c:	f7ff f97c 	bl	8001208 <RCC_AHBPeriphClockCmd>
 8001f10:	f44f 7380 	mov.w	r3, #256	; 0x100
 8001f14:	9300      	str	r3, [sp, #0]
 8001f16:	2301      	movs	r3, #1
 8001f18:	f88d 3004 	strb.w	r3, [sp, #4]
 8001f1c:	2203      	movs	r2, #3
 8001f1e:	2300      	movs	r3, #0
 8001f20:	f04f 4090 	mov.w	r0, #1207959552	; 0x48000000
 8001f24:	4669      	mov	r1, sp
 8001f26:	f88d 3006 	strb.w	r3, [sp, #6]
 8001f2a:	f88d 2005 	strb.w	r2, [sp, #5]
 8001f2e:	f88d 3007 	strb.w	r3, [sp, #7]
 8001f32:	f7ff ff7e 	bl	8001e32 <GPIO_Init>
 8001f36:	b003      	add	sp, #12
 8001f38:	f85d fb04 	ldr.w	pc, [sp], #4

08001f3c <led_on>:
 8001f3c:	05c3      	lsls	r3, r0, #23
 8001f3e:	bf42      	ittt	mi
 8001f40:	f04f 4390 	movmi.w	r3, #1207959552	; 0x48000000
 8001f44:	f44f 7280 	movmi.w	r2, #256	; 0x100
 8001f48:	619a      	strmi	r2, [r3, #24]
 8001f4a:	4770      	bx	lr

08001f4c <led_off>:
 8001f4c:	05c3      	lsls	r3, r0, #23
 8001f4e:	bf42      	ittt	mi
 8001f50:	f04f 4390 	movmi.w	r3, #1207959552	; 0x48000000
 8001f54:	f44f 7280 	movmi.w	r2, #256	; 0x100
 8001f58:	851a      	strhmi	r2, [r3, #40]	; 0x28
 8001f5a:	4770      	bx	lr

08001f5c <Default_Handler>:
 8001f5c:	4668      	mov	r0, sp
 8001f5e:	f020 0107 	bic.w	r1, r0, #7
 8001f62:	468d      	mov	sp, r1
 8001f64:	bf00      	nop
 8001f66:	e7fd      	b.n	8001f64 <Default_Handler+0x8>

08001f68 <HardFault_Handler>:
 8001f68:	f44f 7080 	mov.w	r0, #256	; 0x100
 8001f6c:	f7ff ffe6 	bl	8001f3c <led_on>
 8001f70:	4b06      	ldr	r3, [pc, #24]	; (8001f8c <HardFault_Handler+0x24>)
 8001f72:	3b01      	subs	r3, #1
 8001f74:	d001      	beq.n	8001f7a <HardFault_Handler+0x12>
 8001f76:	bf00      	nop
 8001f78:	e7fb      	b.n	8001f72 <HardFault_Handler+0xa>
 8001f7a:	f44f 7080 	mov.w	r0, #256	; 0x100
 8001f7e:	f7ff ffe5 	bl	8001f4c <led_off>
 8001f82:	4b02      	ldr	r3, [pc, #8]	; (8001f8c <HardFault_Handler+0x24>)
 8001f84:	3b01      	subs	r3, #1
 8001f86:	d0ef      	beq.n	8001f68 <HardFault_Handler>
 8001f88:	bf00      	nop
 8001f8a:	e7fb      	b.n	8001f84 <HardFault_Handler+0x1c>
 8001f8c:	00989681 	.word	0x00989681

08001f90 <_reset_init>:
 8001f90:	490e      	ldr	r1, [pc, #56]	; (8001fcc <_reset_init+0x3c>)
 8001f92:	4b0f      	ldr	r3, [pc, #60]	; (8001fd0 <_reset_init+0x40>)
 8001f94:	1a5b      	subs	r3, r3, r1
 8001f96:	109b      	asrs	r3, r3, #2
 8001f98:	2200      	movs	r2, #0
 8001f9a:	429a      	cmp	r2, r3
 8001f9c:	d006      	beq.n	8001fac <_reset_init+0x1c>
 8001f9e:	480d      	ldr	r0, [pc, #52]	; (8001fd4 <_reset_init+0x44>)
 8001fa0:	f850 0022 	ldr.w	r0, [r0, r2, lsl #2]
 8001fa4:	f841 0022 	str.w	r0, [r1, r2, lsl #2]
 8001fa8:	3201      	adds	r2, #1
 8001faa:	e7f6      	b.n	8001f9a <_reset_init+0xa>
 8001fac:	4a0a      	ldr	r2, [pc, #40]	; (8001fd8 <_reset_init+0x48>)
 8001fae:	f8d2 3088 	ldr.w	r3, [r2, #136]	; 0x88
 8001fb2:	f443 0370 	orr.w	r3, r3, #15728640	; 0xf00000
 8001fb6:	f8c2 3088 	str.w	r3, [r2, #136]	; 0x88
 8001fba:	f502 720c 	add.w	r2, r2, #560	; 0x230
 8001fbe:	6853      	ldr	r3, [r2, #4]
 8001fc0:	f023 4340 	bic.w	r3, r3, #3221225472	; 0xc0000000
 8001fc4:	6053      	str	r3, [r2, #4]
 8001fc6:	f7fe bf93 	b.w	8000ef0 <main>
 8001fca:	bf00      	nop
 8001fcc:	20000000 	.word	0x20000000
 8001fd0:	20000034 	.word	0x20000034
 8001fd4:	080026c0 	.word	0x080026c0
 8001fd8:	e000ed00 	.word	0xe000ed00

08001fdc <_init>:
 8001fdc:	e1a0c00d 	mov	ip, sp
 8001fe0:	e92ddff8 	push	{r3, r4, r5, r6, r7, r8, r9, sl, fp, ip, lr, pc}
 8001fe4:	e24cb004 	sub	fp, ip, #4
 8001fe8:	e24bd028 	sub	sp, fp, #40	; 0x28
 8001fec:	e89d6ff0 	ldm	sp, {r4, r5, r6, r7, r8, r9, sl, fp, sp, lr}
 8001ff0:	e12fff1e 	bx	lr

08001ff4 <_fini>:
 8001ff4:	e1a0c00d 	mov	ip, sp
 8001ff8:	e92ddff8 	push	{r3, r4, r5, r6, r7, r8, r9, sl, fp, ip, lr, pc}
 8001ffc:	e24cb004 	sub	fp, ip, #4
 8002000:	e24bd028 	sub	sp, fp, #40	; 0x28
 8002004:	e89d6ff0 	ldm	sp, {r4, r5, r6, r7, r8, r9, sl, fp, sp, lr}
 8002008:	e12fff1e 	bx	lr
 800200c:	69647473 	.word	0x69647473
 8002010:	6e69206f 	.word	0x6e69206f
 8002014:	64207469 	.word	0x64207469
 8002018:	0a656e6f 	.word	0x0a656e6f
	...

0800201d <font_data>:
	...
 800202d:	3c180000 18183c3c 18180018 00000000     ...<<<..........
 800203d:	63636300 00000022 00000000 00000000     .ccc"...........
 800204d:	36000000 36367f36 36367f36 00000000     ...66.666.66....
 800205d:	633e0c0c 033e6061 3e634303 00000c0c     ..>ca`>..Cc>....
 800206d:	00000000 06636100 6333180c 00000000     .....ac...3c....
 800207d:	1c000000 3b1c3636 3b66666e 00000000     ....66.;nff;....
 800208d:	30303000 00000060 00000000 00000000     .000`...........
 800209d:	180c0000 30303018 0c181830 00000000     .....0000.......
 80020ad:	0c180000 0606060c 180c0c06 00000000     ................
 80020bd:	00000000 ff3c6642 0042663c 00000000     ....Bf<.<fB.....
 80020cd:	00000000 ff181818 00181818 00000000     ................
	...
 80020e5:	18180000 00003018 00000000 ff000000     .....0..........
	...
 8002105:	18180000 00000000 03010000 381c0e07     ...............8
 8002115:	80c0e070 00000000 633e0000 6b6b6363     p.........>ccckk
 8002125:	3e636363 00000000 1c0c0000 0c0c0c3c     ccc>........<...
 8002135:	3f0c0c0c 00000000 633e0000 180c0603     ...?......>c....
 8002145:	7f636130 00000000 633e0000 031e0303     0ac.......>c....
 8002155:	3e630303 00000000 0e060000 6666361e     ..c>.........6ff
 8002165:	0f06067f 00000000 607f0000 037e6060     ...........```~.
 8002175:	3e736303 00000000 301c0000 637e6060     .cs>.......0``~c
 8002185:	3e636363 00000000 637f0000 0c060603     ccc>.......c....
 8002195:	1818180c 00000000 633e0000 633e6363     ..........>ccc>c
 80021a5:	3e636363 00000000 633e0000 3f636363     ccc>......>cccc?
 80021b5:	3c060303 00000000 00000000 00181800     ...<............
 80021c5:	18180000 00000000 00000000 00181800     ................
 80021d5:	18180000 00003018 06000000 6030180c     .....0........0`
 80021e5:	060c1830 00000000 00000000 007e0000     0.............~.
 80021f5:	00007e00 00000000 60000000 060c1830     .~.........`0...
 8002205:	6030180c 00000000 633e0000 0c0c0663     ..0`......>cc...
 8002215:	0c0c000c 00000000 633e0000 6b6b6f63     ..........>ccokk
 8002225:	3e60606e 00000000 1c080000 63636336     n``>........6ccc
 8002235:	6363637f 00000000 337e0000 333e3333     .ccc......~333>3
 8002245:	7e333333 00000000 331e0000 60606061     333~.......3a```
 8002255:	1e336160 00000000 367c0000 33333333     `a3.......|63333
 8002265:	7c363333 00000000 337f0000 343c3431     336|.......314<4
 8002275:	7f333130 00000000 337f0000 343c3431     013........314<4
 8002285:	78303030 00000000 331e0000 6f606061     000x.......3a``o
 8002295:	1d376363 00000000 63630000 637f6363     cc7.......cccc.c
 80022a5:	63636363 00000000 183c0000 18181818     cccc......<.....
 80022b5:	3c181818 00000000 060f0000 06060606     ...<............
 80022c5:	3c666606 00000000 33730000 363c3636     .ff<......s366<6
 80022d5:	73333336 00000000 30780000 30303030     633s......x00000
 80022e5:	7f333130 00000000 77630000 63636b7f     013.......cw.kcc
 80022f5:	63636363 00000000 63630000 6f7f7b73     cccc......ccs{.o
 8002305:	63636367 00000000 361c0000 63636363     gccc.......6cccc
 8002315:	1c366363 00000000 337e0000 303e3333     cc6.......~333>0
 8002325:	78303030 00000000 633e0000 63636363     000x......>ccccc
 8002335:	3e6f6b63 00000706 337e0000 363e3333     cko>......~333>6
 8002345:	73333336 00000000 633e0000 061c3063     633s......>cc0..
 8002355:	3e636303 00000000 dbff0000 18181899     .cc>............
 8002365:	3c181818 00000000 63630000 63636363     ...<......cccccc
 8002375:	3e636363 00000000 63630000 63636363     ccc>......cccccc
 8002385:	081c3663 00000000 63630000 6b636363     c6........ccccck
 8002395:	36367f6b 00000000 c3c30000 18183c66     k.66........f<..
 80023a5:	c3c3663c 00000000 c3c30000 183c66c3     <f...........f<.
 80023b5:	3c181818 00000000 637f0000 180c0643     ...<.......cC...
 80023c5:	7f636130 00000000 303c0000 30303030     0ac.......<00000
 80023d5:	3c303030 00000000 c0800000 1c3870e0     000<.........p8.
 80023e5:	0103070e 00000000 0c3c0000 0c0c0c0c     ..........<.....
 80023f5:	3c0c0c0c 00000000 63361c08 00000000     ...<......6c....
	...
 8002419:	000000ff 000c1818 00000000 00000000     ................
	...
 8002431:	06463c00 3b66663e 00000000 30700000     .<F.>ff;......p0
 8002441:	33363c30 6e333333 00000000 00000000     0<63333n........
 8002451:	60633e00 3e636060 00000000 060e0000     .>c```c>........
 8002461:	66361e06 3b666666 00000000 00000000     ..6ffff;........
 8002471:	63633e00 3e63607e 00000000 361c0000     .>cc~`c>.......6
 8002481:	307c3032 78303030 00000000 00000000     20|0000x........
 8002491:	66663b00 063e6666 00003c66 30700000     .;ffff>.f<....p0
 80024a1:	333b3630 73333333 00000000 0c0c0000     06;3333s........
 80024b1:	0c0c1c00 1e0c0c0c 00000000 06060000     ................
 80024c1:	06060e00 66060606 00003c66 30700000     .......ff<....p0
 80024d1:	36333330 7333363c 00000000 0c1c0000     0336<63s........
 80024e1:	0c0c0c0c 1e0c0c0c 00000000 00000000     ................
 80024f1:	6b7f6e00 6b6b6b6b 00000000 00000000     .n.kkkkk........
 8002501:	33336e00 33333333 00000000 00000000     .n333333........
 8002511:	63633e00 3e636363 00000000 00000000     .>ccccc>........
 8002521:	33336e00 303e3333 00007830 00000000     .n3333>00x......
 8002531:	66663b00 063e6666 00000f06 00000000     .;ffff>.........
 8002541:	333b6e00 78303030 00000000 00000000     .n;3000x........
 8002551:	38633e00 3e63030e 00000000 18080000     .>c8..c>........
 8002561:	18187e18 0e1b1818 00000000 00000000     .~..............
 8002571:	66666600 3b666666 00000000 00000000     .ffffff;........
 8002581:	36636300 081c1c36 00000000 00000000     .cc66...........
 8002591:	63636300 367f6b6b 00000000 00000000     .ccckk.6........
 80025a1:	1c366300 63361c1c 00000000 00000000     .c6...6c........
 80025b1:	63636300 033f6363 00003c06 00000000     .ccccc?..<......
 80025c1:	0c667f00 7f633018 00000000 180e0000     ..f..0c.........
 80025d1:	18701818 0e181818 00000000 18180000     ..p.............
 80025e1:	00181818 18181818 00000018 18700000     ..............p.
 80025f1:	180e1818 70181818 00000000 6e3b0000     .......p......;n
	...
 800260d:	d8d87000 00000070 00000000 00000000     .p..p...........
 800261d:	6c65770a 656d6f63 206f7420 757a7553     .welcome to Suzu
 800262d:	534f6168 5e5f5e20 322e3220 420a302e     haOS ^_^ 2.2.0.B
 800263d:	444c4955 6c754a20 20323220 36313032     UILD Jul 22 2016
 800264d:	3a393020 303a3333 25000a34 203a2075      09:33:04..%u : 
 800265d:	255b000a 69252069 5d692520 6f620020     ..[%i %i %i] .bo
 800266d:	6e69746f 72662067 25206d6f 72000a75     oting from %u..r
 800267d:	73206d61 74726174 20752520 6172000a     am start %u ..ra
 800268d:	6973206d 2520657a 000a2075 206d6172     m size %u ..ram 
 800269d:	65657266 20752520 6568000a 73207061     free %u ..heap s
 80026ad:	74726174 20752520 0a0a000a 00000000              tart %u .......

080026bc <__EH_FRAME_BEGIN__>:
 80026bc:	00000000                                ....
