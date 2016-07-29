
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
 80001aa:	f001 f915 	bl	80013d8 <sleep>
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
 8000282:	f001 f897 	bl	80013b4 <sys_tick_init>
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
 80003f6:	f000 fe63 	bl	80010c0 <uart_write>
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
 80005cc:	0800185c 	.word	0x0800185c

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

08000640 <ad9833_delay>:
 8000640:	2365      	movs	r3, #101	; 0x65
 8000642:	3b01      	subs	r3, #1
 8000644:	d001      	beq.n	800064a <ad9833_delay+0xa>
 8000646:	bf00      	nop
 8000648:	e7fb      	b.n	8000642 <ad9833_delay+0x2>
 800064a:	4770      	bx	lr

0800064c <ad9833_send_word>:
 800064c:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
 800064e:	4d14      	ldr	r5, [pc, #80]	; (80006a0 <ad9833_send_word+0x54>)
 8000650:	2410      	movs	r4, #16
 8000652:	61ac      	str	r4, [r5, #24]
 8000654:	4606      	mov	r6, r0
 8000656:	f7ff fff3 	bl	8000640 <ad9833_delay>
 800065a:	f44f 4380 	mov.w	r3, #16384	; 0x4000
 800065e:	852b      	strh	r3, [r5, #40]	; 0x28
 8000660:	f7ff ffee 	bl	8000640 <ad9833_delay>
 8000664:	f04f 4390 	mov.w	r3, #1207959552	; 0x48000000
 8000668:	f416 4f00 	tst.w	r6, #32768	; 0x8000
 800066c:	f44f 4200 	mov.w	r2, #32768	; 0x8000
 8000670:	4d0b      	ldr	r5, [pc, #44]	; (80006a0 <ad9833_send_word+0x54>)
 8000672:	bf14      	ite	ne
 8000674:	619a      	strne	r2, [r3, #24]
 8000676:	851a      	strheq	r2, [r3, #40]	; 0x28
 8000678:	2710      	movs	r7, #16
 800067a:	f7ff ffe1 	bl	8000640 <ad9833_delay>
 800067e:	852f      	strh	r7, [r5, #40]	; 0x28
 8000680:	f7ff ffde 	bl	8000640 <ad9833_delay>
 8000684:	61af      	str	r7, [r5, #24]
 8000686:	f7ff ffdb 	bl	8000640 <ad9833_delay>
 800068a:	3c01      	subs	r4, #1
 800068c:	ea4f 0646 	mov.w	r6, r6, lsl #1
 8000690:	d1e8      	bne.n	8000664 <ad9833_send_word+0x18>
 8000692:	f44f 4380 	mov.w	r3, #16384	; 0x4000
 8000696:	61ab      	str	r3, [r5, #24]
 8000698:	e8bd 40f8 	ldmia.w	sp!, {r3, r4, r5, r6, r7, lr}
 800069c:	f7ff bfd0 	b.w	8000640 <ad9833_delay>
 80006a0:	48000400 	.word	0x48000400

080006a4 <ad9833_set_frequency>:
 80006a4:	ee07 0a90 	vmov	s15, r0
 80006a8:	ed9f 7a12 	vldr	s14, [pc, #72]	; 80006f4 <ad9833_set_frequency+0x50>
 80006ac:	eef8 7a67 	vcvt.f32.u32	s15, s15
 80006b0:	b570      	push	{r4, r5, r6, lr}
 80006b2:	ee67 7a87 	vmul.f32	s15, s15, s14
 80006b6:	460d      	mov	r5, r1
 80006b8:	eefc 7ae7 	vcvt.u32.f32	s15, s15
 80006bc:	ee17 0a90 	vmov	r0, s15
 80006c0:	f3c0 368d 	ubfx	r6, r0, #14, #14
 80006c4:	f3c0 040d 	ubfx	r4, r0, #0, #14
 80006c8:	f44f 5004 	mov.w	r0, #8448	; 0x2100
 80006cc:	f7ff ffbe 	bl	800064c <ad9833_send_word>
 80006d0:	f444 4080 	orr.w	r0, r4, #16384	; 0x4000
 80006d4:	f7ff ffba 	bl	800064c <ad9833_send_word>
 80006d8:	f446 4080 	orr.w	r0, r6, #16384	; 0x4000
 80006dc:	f7ff ffb6 	bl	800064c <ad9833_send_word>
 80006e0:	f44f 4040 	mov.w	r0, #49152	; 0xc000
 80006e4:	f7ff ffb2 	bl	800064c <ad9833_send_word>
 80006e8:	4628      	mov	r0, r5
 80006ea:	e8bd 4070 	ldmia.w	sp!, {r4, r5, r6, lr}
 80006ee:	f7ff bfad 	b.w	800064c <ad9833_send_word>
 80006f2:	bf00      	nop
 80006f4:	412bcc77 	.word	0x412bcc77

080006f8 <ad9833_set_gain>:
 80006f8:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
 80006fa:	4d15      	ldr	r5, [pc, #84]	; (8000750 <ad9833_set_gain+0x58>)
 80006fc:	2410      	movs	r4, #16
 80006fe:	852c      	strh	r4, [r5, #40]	; 0x28
 8000700:	f440 5698 	orr.w	r6, r0, #4864	; 0x1300
 8000704:	f7ff ff9c 	bl	8000640 <ad9833_delay>
 8000708:	f44f 5300 	mov.w	r3, #8192	; 0x2000
 800070c:	852b      	strh	r3, [r5, #40]	; 0x28
 800070e:	f7ff ff97 	bl	8000640 <ad9833_delay>
 8000712:	f04f 4390 	mov.w	r3, #1207959552	; 0x48000000
 8000716:	f416 4f00 	tst.w	r6, #32768	; 0x8000
 800071a:	f44f 4200 	mov.w	r2, #32768	; 0x8000
 800071e:	4d0c      	ldr	r5, [pc, #48]	; (8000750 <ad9833_set_gain+0x58>)
 8000720:	bf14      	ite	ne
 8000722:	619a      	strne	r2, [r3, #24]
 8000724:	851a      	strheq	r2, [r3, #40]	; 0x28
 8000726:	2710      	movs	r7, #16
 8000728:	f7ff ff8a 	bl	8000640 <ad9833_delay>
 800072c:	61af      	str	r7, [r5, #24]
 800072e:	f7ff ff87 	bl	8000640 <ad9833_delay>
 8000732:	852f      	strh	r7, [r5, #40]	; 0x28
 8000734:	f7ff ff84 	bl	8000640 <ad9833_delay>
 8000738:	3c01      	subs	r4, #1
 800073a:	ea4f 0646 	mov.w	r6, r6, lsl #1
 800073e:	d1e8      	bne.n	8000712 <ad9833_set_gain+0x1a>
 8000740:	f44f 5300 	mov.w	r3, #8192	; 0x2000
 8000744:	61ab      	str	r3, [r5, #24]
 8000746:	e8bd 40f8 	ldmia.w	sp!, {r3, r4, r5, r6, r7, lr}
 800074a:	f7ff bf79 	b.w	8000640 <ad9833_delay>
 800074e:	bf00      	nop
 8000750:	48000400 	.word	0x48000400

08000754 <ad9833_init>:
 8000754:	e92d 41f3 	stmdb	sp!, {r0, r1, r4, r5, r6, r7, r8, lr}
 8000758:	4d2a      	ldr	r5, [pc, #168]	; (8000804 <ad9833_init+0xb0>)
 800075a:	2400      	movs	r4, #0
 800075c:	2701      	movs	r7, #1
 800075e:	2603      	movs	r6, #3
 8000760:	f44f 4880 	mov.w	r8, #16384	; 0x4000
 8000764:	4628      	mov	r0, r5
 8000766:	4669      	mov	r1, sp
 8000768:	f8cd 8000 	str.w	r8, [sp]
 800076c:	f88d 7004 	strb.w	r7, [sp, #4]
 8000770:	f88d 4006 	strb.w	r4, [sp, #6]
 8000774:	f88d 6005 	strb.w	r6, [sp, #5]
 8000778:	f88d 4007 	strb.w	r4, [sp, #7]
 800077c:	f000 ff81 	bl	8001682 <GPIO_Init>
 8000780:	f8c5 8018 	str.w	r8, [r5, #24]
 8000784:	4628      	mov	r0, r5
 8000786:	f44f 5800 	mov.w	r8, #8192	; 0x2000
 800078a:	4669      	mov	r1, sp
 800078c:	f8cd 8000 	str.w	r8, [sp]
 8000790:	f88d 7004 	strb.w	r7, [sp, #4]
 8000794:	f88d 4006 	strb.w	r4, [sp, #6]
 8000798:	f88d 6005 	strb.w	r6, [sp, #5]
 800079c:	f88d 4007 	strb.w	r4, [sp, #7]
 80007a0:	f000 ff6f 	bl	8001682 <GPIO_Init>
 80007a4:	f8c5 8018 	str.w	r8, [r5, #24]
 80007a8:	4628      	mov	r0, r5
 80007aa:	f04f 0810 	mov.w	r8, #16
 80007ae:	4669      	mov	r1, sp
 80007b0:	f8cd 8000 	str.w	r8, [sp]
 80007b4:	f88d 7004 	strb.w	r7, [sp, #4]
 80007b8:	f88d 4006 	strb.w	r4, [sp, #6]
 80007bc:	f88d 6005 	strb.w	r6, [sp, #5]
 80007c0:	f88d 4007 	strb.w	r4, [sp, #7]
 80007c4:	f000 ff5d 	bl	8001682 <GPIO_Init>
 80007c8:	f8c5 8018 	str.w	r8, [r5, #24]
 80007cc:	f44f 4300 	mov.w	r3, #32768	; 0x8000
 80007d0:	f04f 4090 	mov.w	r0, #1207959552	; 0x48000000
 80007d4:	4669      	mov	r1, sp
 80007d6:	9300      	str	r3, [sp, #0]
 80007d8:	f88d 7004 	strb.w	r7, [sp, #4]
 80007dc:	f88d 4006 	strb.w	r4, [sp, #6]
 80007e0:	f88d 6005 	strb.w	r6, [sp, #5]
 80007e4:	f88d 4007 	strb.w	r4, [sp, #7]
 80007e8:	f000 ff4b 	bl	8001682 <GPIO_Init>
 80007ec:	f8c5 8018 	str.w	r8, [r5, #24]
 80007f0:	f240 33e9 	movw	r3, #1001	; 0x3e9
 80007f4:	3b01      	subs	r3, #1
 80007f6:	d001      	beq.n	80007fc <ad9833_init+0xa8>
 80007f8:	bf00      	nop
 80007fa:	e7fb      	b.n	80007f4 <ad9833_init+0xa0>
 80007fc:	b002      	add	sp, #8
 80007fe:	e8bd 81f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, pc}
 8000802:	bf00      	nop
 8000804:	48000400 	.word	0x48000400

08000808 <main_thread>:
 8000808:	b508      	push	{r3, lr}
 800080a:	f44f 7080 	mov.w	r0, #256	; 0x100
 800080e:	f000 ffbd 	bl	800178c <led_on>
 8000812:	4816      	ldr	r0, [pc, #88]	; (800086c <main_thread+0x64>)
 8000814:	f7ff fe62 	bl	80004dc <printf_>
 8000818:	f7ff ff9c 	bl	8000754 <ad9833_init>
 800081c:	f44f 707a 	mov.w	r0, #1000	; 0x3e8
 8000820:	f44f 5100 	mov.w	r1, #8192	; 0x2000
 8000824:	f7ff ff3e 	bl	80006a4 <ad9833_set_frequency>
 8000828:	f44f 7080 	mov.w	r0, #256	; 0x100
 800082c:	f000 ffb6 	bl	800179c <led_off>
 8000830:	f44f 5100 	mov.w	r1, #8192	; 0x2000
 8000834:	480e      	ldr	r0, [pc, #56]	; (8000870 <main_thread+0x68>)
 8000836:	f7ff ff35 	bl	80006a4 <ad9833_set_frequency>
 800083a:	20c8      	movs	r0, #200	; 0xc8
 800083c:	f7ff ff5c 	bl	80006f8 <ad9833_set_gain>
 8000840:	f44f 7096 	mov.w	r0, #300	; 0x12c
 8000844:	f000 fb7a 	bl	8000f3c <timer_delay_ms>
 8000848:	f44f 7080 	mov.w	r0, #256	; 0x100
 800084c:	f000 ff9e 	bl	800178c <led_on>
 8000850:	f44f 5100 	mov.w	r1, #8192	; 0x2000
 8000854:	4806      	ldr	r0, [pc, #24]	; (8000870 <main_thread+0x68>)
 8000856:	f7ff ff25 	bl	80006a4 <ad9833_set_frequency>
 800085a:	20ff      	movs	r0, #255	; 0xff
 800085c:	f7ff ff4c 	bl	80006f8 <ad9833_set_gain>
 8000860:	f44f 7096 	mov.w	r0, #300	; 0x12c
 8000864:	f000 fb6a 	bl	8000f3c <timer_delay_ms>
 8000868:	e7de      	b.n	8000828 <main_thread+0x20>
 800086a:	bf00      	nop
 800086c:	080018a8 	.word	0x080018a8
 8000870:	000f4240 	.word	0x000f4240

08000874 <mem_info_print>:
 8000874:	b538      	push	{r3, r4, r5, lr}
 8000876:	4c0f      	ldr	r4, [pc, #60]	; (80008b4 <mem_info_print+0x40>)
 8000878:	4d0f      	ldr	r5, [pc, #60]	; (80008b8 <mem_info_print+0x44>)
 800087a:	4810      	ldr	r0, [pc, #64]	; (80008bc <mem_info_print+0x48>)
 800087c:	4910      	ldr	r1, [pc, #64]	; (80008c0 <mem_info_print+0x4c>)
 800087e:	f7ff fe2d 	bl	80004dc <printf_>
 8000882:	1b2d      	subs	r5, r5, r4
 8000884:	4621      	mov	r1, r4
 8000886:	480f      	ldr	r0, [pc, #60]	; (80008c4 <mem_info_print+0x50>)
 8000888:	f7ff fe28 	bl	80004dc <printf_>
 800088c:	4629      	mov	r1, r5
 800088e:	480e      	ldr	r0, [pc, #56]	; (80008c8 <mem_info_print+0x54>)
 8000890:	f7ff fe24 	bl	80004dc <printf_>
 8000894:	490d      	ldr	r1, [pc, #52]	; (80008cc <mem_info_print+0x58>)
 8000896:	480e      	ldr	r0, [pc, #56]	; (80008d0 <mem_info_print+0x5c>)
 8000898:	1a61      	subs	r1, r4, r1
 800089a:	4429      	add	r1, r5
 800089c:	f7ff fe1e 	bl	80004dc <printf_>
 80008a0:	480c      	ldr	r0, [pc, #48]	; (80008d4 <mem_info_print+0x60>)
 80008a2:	490d      	ldr	r1, [pc, #52]	; (80008d8 <mem_info_print+0x64>)
 80008a4:	f7ff fe1a 	bl	80004dc <printf_>
 80008a8:	480c      	ldr	r0, [pc, #48]	; (80008dc <mem_info_print+0x68>)
 80008aa:	e8bd 4038 	ldmia.w	sp!, {r3, r4, r5, lr}
 80008ae:	f7ff be15 	b.w	80004dc <printf_>
 80008b2:	bf00      	nop
 80008b4:	20000000 	.word	0x20000000
 80008b8:	20004000 	.word	0x20004000
 80008bc:	080018e3 	.word	0x080018e3
 80008c0:	0800182c 	.word	0x0800182c
 80008c4:	080018f4 	.word	0x080018f4
 80008c8:	08001903 	.word	0x08001903
 80008cc:	200002bc 	.word	0x200002bc
 80008d0:	08001911 	.word	0x08001911
 80008d4:	0800191f 	.word	0x0800191f
 80008d8:	200002bc 	.word	0x200002bc
 80008dc:	0800192f 	.word	0x0800192f

080008e0 <main>:
 80008e0:	b508      	push	{r3, lr}
 80008e2:	f000 febd 	bl	8001660 <lib_low_level_init>
 80008e6:	f7ff fe73 	bl	80005d0 <lib_os_init>
 80008ea:	f7ff ffc3 	bl	8000874 <mem_info_print>
 80008ee:	4905      	ldr	r1, [pc, #20]	; (8000904 <main+0x24>)
 80008f0:	4805      	ldr	r0, [pc, #20]	; (8000908 <main+0x28>)
 80008f2:	f44f 7280 	mov.w	r2, #256	; 0x100
 80008f6:	2308      	movs	r3, #8
 80008f8:	f7ff fcc8 	bl	800028c <create_thread>
 80008fc:	f7ff fcc0 	bl	8000280 <kernel_start>
 8000900:	2000      	movs	r0, #0
 8000902:	bd08      	pop	{r3, pc}
 8000904:	20000188 	.word	0x20000188
 8000908:	08000809 	.word	0x08000809

0800090c <RCC_GetClocksFreq>:
 800090c:	e92d 41f0 	stmdb	sp!, {r4, r5, r6, r7, r8, lr}
 8000910:	4f9b      	ldr	r7, [pc, #620]	; (8000b80 <RCC_GetClocksFreq+0x274>)
 8000912:	687b      	ldr	r3, [r7, #4]
 8000914:	f003 030c 	and.w	r3, r3, #12
 8000918:	2b04      	cmp	r3, #4
 800091a:	d005      	beq.n	8000928 <RCC_GetClocksFreq+0x1c>
 800091c:	2b08      	cmp	r3, #8
 800091e:	d006      	beq.n	800092e <RCC_GetClocksFreq+0x22>
 8000920:	4a98      	ldr	r2, [pc, #608]	; (8000b84 <RCC_GetClocksFreq+0x278>)
 8000922:	6002      	str	r2, [r0, #0]
 8000924:	b9b3      	cbnz	r3, 8000954 <RCC_GetClocksFreq+0x48>
 8000926:	e016      	b.n	8000956 <RCC_GetClocksFreq+0x4a>
 8000928:	4b96      	ldr	r3, [pc, #600]	; (8000b84 <RCC_GetClocksFreq+0x278>)
 800092a:	6003      	str	r3, [r0, #0]
 800092c:	e012      	b.n	8000954 <RCC_GetClocksFreq+0x48>
 800092e:	687b      	ldr	r3, [r7, #4]
 8000930:	6879      	ldr	r1, [r7, #4]
 8000932:	f3c3 4383 	ubfx	r3, r3, #18, #4
 8000936:	1c9a      	adds	r2, r3, #2
 8000938:	03cb      	lsls	r3, r1, #15
 800093a:	bf49      	itett	mi
 800093c:	6afb      	ldrmi	r3, [r7, #44]	; 0x2c
 800093e:	4b92      	ldrpl	r3, [pc, #584]	; (8000b88 <RCC_GetClocksFreq+0x27c>)
 8000940:	4990      	ldrmi	r1, [pc, #576]	; (8000b84 <RCC_GetClocksFreq+0x278>)
 8000942:	f003 030f 	andmi.w	r3, r3, #15
 8000946:	bf44      	itt	mi
 8000948:	3301      	addmi	r3, #1
 800094a:	fbb1 f3f3 	udivmi	r3, r1, r3
 800094e:	4353      	muls	r3, r2
 8000950:	6003      	str	r3, [r0, #0]
 8000952:	e000      	b.n	8000956 <RCC_GetClocksFreq+0x4a>
 8000954:	2300      	movs	r3, #0
 8000956:	687a      	ldr	r2, [r7, #4]
 8000958:	4e8c      	ldr	r6, [pc, #560]	; (8000b8c <RCC_GetClocksFreq+0x280>)
 800095a:	f8df c234 	ldr.w	ip, [pc, #564]	; 8000b90 <RCC_GetClocksFreq+0x284>
 800095e:	f3c2 1203 	ubfx	r2, r2, #4, #4
 8000962:	5cb4      	ldrb	r4, [r6, r2]
 8000964:	6802      	ldr	r2, [r0, #0]
 8000966:	b2e4      	uxtb	r4, r4
 8000968:	fa22 f104 	lsr.w	r1, r2, r4
 800096c:	6041      	str	r1, [r0, #4]
 800096e:	687d      	ldr	r5, [r7, #4]
 8000970:	f3c5 2502 	ubfx	r5, r5, #8, #3
 8000974:	5d75      	ldrb	r5, [r6, r5]
 8000976:	fa21 fe05 	lsr.w	lr, r1, r5
 800097a:	f8c0 e008 	str.w	lr, [r0, #8]
 800097e:	687d      	ldr	r5, [r7, #4]
 8000980:	f3c5 25c2 	ubfx	r5, r5, #11, #3
 8000984:	5d75      	ldrb	r5, [r6, r5]
 8000986:	b2ed      	uxtb	r5, r5
 8000988:	40e9      	lsrs	r1, r5
 800098a:	60c1      	str	r1, [r0, #12]
 800098c:	6afe      	ldr	r6, [r7, #44]	; 0x2c
 800098e:	f3c6 1804 	ubfx	r8, r6, #4, #5
 8000992:	f008 060f 	and.w	r6, r8, #15
 8000996:	f018 0f10 	tst.w	r8, #16
 800099a:	f83c 6016 	ldrh.w	r6, [ip, r6, lsl #1]
 800099e:	46e0      	mov	r8, ip
 80009a0:	b2b6      	uxth	r6, r6
 80009a2:	d004      	beq.n	80009ae <RCC_GetClocksFreq+0xa2>
 80009a4:	b11e      	cbz	r6, 80009ae <RCC_GetClocksFreq+0xa2>
 80009a6:	fbb3 f6f6 	udiv	r6, r3, r6
 80009aa:	6106      	str	r6, [r0, #16]
 80009ac:	e000      	b.n	80009b0 <RCC_GetClocksFreq+0xa4>
 80009ae:	6102      	str	r2, [r0, #16]
 80009b0:	6afe      	ldr	r6, [r7, #44]	; 0x2c
 80009b2:	f3c6 2c44 	ubfx	ip, r6, #9, #5
 80009b6:	f00c 060f 	and.w	r6, ip, #15
 80009ba:	f01c 0f10 	tst.w	ip, #16
 80009be:	f838 6016 	ldrh.w	r6, [r8, r6, lsl #1]
 80009c2:	b2b6      	uxth	r6, r6
 80009c4:	d004      	beq.n	80009d0 <RCC_GetClocksFreq+0xc4>
 80009c6:	b11e      	cbz	r6, 80009d0 <RCC_GetClocksFreq+0xc4>
 80009c8:	fbb3 f6f6 	udiv	r6, r3, r6
 80009cc:	6146      	str	r6, [r0, #20]
 80009ce:	e000      	b.n	80009d2 <RCC_GetClocksFreq+0xc6>
 80009d0:	6142      	str	r2, [r0, #20]
 80009d2:	6b3e      	ldr	r6, [r7, #48]	; 0x30
 80009d4:	06f6      	lsls	r6, r6, #27
 80009d6:	bf5a      	itte	pl
 80009d8:	4e6a      	ldrpl	r6, [pc, #424]	; (8000b84 <RCC_GetClocksFreq+0x278>)
 80009da:	6186      	strpl	r6, [r0, #24]
 80009dc:	6182      	strmi	r2, [r0, #24]
 80009de:	6b3e      	ldr	r6, [r7, #48]	; 0x30
 80009e0:	06b6      	lsls	r6, r6, #26
 80009e2:	bf5a      	itte	pl
 80009e4:	4e67      	ldrpl	r6, [pc, #412]	; (8000b84 <RCC_GetClocksFreq+0x278>)
 80009e6:	61c6      	strpl	r6, [r0, #28]
 80009e8:	61c2      	strmi	r2, [r0, #28]
 80009ea:	6b3e      	ldr	r6, [r7, #48]	; 0x30
 80009ec:	0676      	lsls	r6, r6, #25
 80009ee:	bf5a      	itte	pl
 80009f0:	4e64      	ldrpl	r6, [pc, #400]	; (8000b84 <RCC_GetClocksFreq+0x278>)
 80009f2:	6206      	strpl	r6, [r0, #32]
 80009f4:	6202      	strmi	r2, [r0, #32]
 80009f6:	6b3e      	ldr	r6, [r7, #48]	; 0x30
 80009f8:	05f6      	lsls	r6, r6, #23
 80009fa:	d506      	bpl.n	8000a0a <RCC_GetClocksFreq+0xfe>
 80009fc:	429a      	cmp	r2, r3
 80009fe:	d104      	bne.n	8000a0a <RCC_GetClocksFreq+0xfe>
 8000a00:	42a5      	cmp	r5, r4
 8000a02:	d102      	bne.n	8000a0a <RCC_GetClocksFreq+0xfe>
 8000a04:	0056      	lsls	r6, r2, #1
 8000a06:	6246      	str	r6, [r0, #36]	; 0x24
 8000a08:	e000      	b.n	8000a0c <RCC_GetClocksFreq+0x100>
 8000a0a:	6241      	str	r1, [r0, #36]	; 0x24
 8000a0c:	6b3e      	ldr	r6, [r7, #48]	; 0x30
 8000a0e:	04f6      	lsls	r6, r6, #19
 8000a10:	d506      	bpl.n	8000a20 <RCC_GetClocksFreq+0x114>
 8000a12:	429a      	cmp	r2, r3
 8000a14:	d104      	bne.n	8000a20 <RCC_GetClocksFreq+0x114>
 8000a16:	42a5      	cmp	r5, r4
 8000a18:	d102      	bne.n	8000a20 <RCC_GetClocksFreq+0x114>
 8000a1a:	0056      	lsls	r6, r2, #1
 8000a1c:	6286      	str	r6, [r0, #40]	; 0x28
 8000a1e:	e000      	b.n	8000a22 <RCC_GetClocksFreq+0x116>
 8000a20:	6281      	str	r1, [r0, #40]	; 0x28
 8000a22:	6b3e      	ldr	r6, [r7, #48]	; 0x30
 8000a24:	05b6      	lsls	r6, r6, #22
 8000a26:	d506      	bpl.n	8000a36 <RCC_GetClocksFreq+0x12a>
 8000a28:	429a      	cmp	r2, r3
 8000a2a:	d104      	bne.n	8000a36 <RCC_GetClocksFreq+0x12a>
 8000a2c:	42a5      	cmp	r5, r4
 8000a2e:	d102      	bne.n	8000a36 <RCC_GetClocksFreq+0x12a>
 8000a30:	0056      	lsls	r6, r2, #1
 8000a32:	62c6      	str	r6, [r0, #44]	; 0x2c
 8000a34:	e000      	b.n	8000a38 <RCC_GetClocksFreq+0x12c>
 8000a36:	62c1      	str	r1, [r0, #44]	; 0x2c
 8000a38:	6b3e      	ldr	r6, [r7, #48]	; 0x30
 8000a3a:	0576      	lsls	r6, r6, #21
 8000a3c:	d506      	bpl.n	8000a4c <RCC_GetClocksFreq+0x140>
 8000a3e:	429a      	cmp	r2, r3
 8000a40:	d104      	bne.n	8000a4c <RCC_GetClocksFreq+0x140>
 8000a42:	42a5      	cmp	r5, r4
 8000a44:	d102      	bne.n	8000a4c <RCC_GetClocksFreq+0x140>
 8000a46:	0056      	lsls	r6, r2, #1
 8000a48:	64c6      	str	r6, [r0, #76]	; 0x4c
 8000a4a:	e000      	b.n	8000a4e <RCC_GetClocksFreq+0x142>
 8000a4c:	64c1      	str	r1, [r0, #76]	; 0x4c
 8000a4e:	6b3e      	ldr	r6, [r7, #48]	; 0x30
 8000a50:	0536      	lsls	r6, r6, #20
 8000a52:	d506      	bpl.n	8000a62 <RCC_GetClocksFreq+0x156>
 8000a54:	429a      	cmp	r2, r3
 8000a56:	d104      	bne.n	8000a62 <RCC_GetClocksFreq+0x156>
 8000a58:	42a5      	cmp	r5, r4
 8000a5a:	d102      	bne.n	8000a62 <RCC_GetClocksFreq+0x156>
 8000a5c:	0056      	lsls	r6, r2, #1
 8000a5e:	6506      	str	r6, [r0, #80]	; 0x50
 8000a60:	e000      	b.n	8000a64 <RCC_GetClocksFreq+0x158>
 8000a62:	6501      	str	r1, [r0, #80]	; 0x50
 8000a64:	6b3e      	ldr	r6, [r7, #48]	; 0x30
 8000a66:	04b6      	lsls	r6, r6, #18
 8000a68:	d506      	bpl.n	8000a78 <RCC_GetClocksFreq+0x16c>
 8000a6a:	429a      	cmp	r2, r3
 8000a6c:	d104      	bne.n	8000a78 <RCC_GetClocksFreq+0x16c>
 8000a6e:	42a5      	cmp	r5, r4
 8000a70:	d102      	bne.n	8000a78 <RCC_GetClocksFreq+0x16c>
 8000a72:	0056      	lsls	r6, r2, #1
 8000a74:	6546      	str	r6, [r0, #84]	; 0x54
 8000a76:	e000      	b.n	8000a7a <RCC_GetClocksFreq+0x16e>
 8000a78:	6501      	str	r1, [r0, #80]	; 0x50
 8000a7a:	6b3e      	ldr	r6, [r7, #48]	; 0x30
 8000a7c:	0436      	lsls	r6, r6, #16
 8000a7e:	d506      	bpl.n	8000a8e <RCC_GetClocksFreq+0x182>
 8000a80:	429a      	cmp	r2, r3
 8000a82:	d104      	bne.n	8000a8e <RCC_GetClocksFreq+0x182>
 8000a84:	42a5      	cmp	r5, r4
 8000a86:	d102      	bne.n	8000a8e <RCC_GetClocksFreq+0x182>
 8000a88:	0053      	lsls	r3, r2, #1
 8000a8a:	6583      	str	r3, [r0, #88]	; 0x58
 8000a8c:	e000      	b.n	8000a90 <RCC_GetClocksFreq+0x184>
 8000a8e:	6581      	str	r1, [r0, #88]	; 0x58
 8000a90:	6b3c      	ldr	r4, [r7, #48]	; 0x30
 8000a92:	4b3b      	ldr	r3, [pc, #236]	; (8000b80 <RCC_GetClocksFreq+0x274>)
 8000a94:	07a4      	lsls	r4, r4, #30
 8000a96:	d101      	bne.n	8000a9c <RCC_GetClocksFreq+0x190>
 8000a98:	6381      	str	r1, [r0, #56]	; 0x38
 8000a9a:	e015      	b.n	8000ac8 <RCC_GetClocksFreq+0x1bc>
 8000a9c:	6b19      	ldr	r1, [r3, #48]	; 0x30
 8000a9e:	f001 0103 	and.w	r1, r1, #3
 8000aa2:	2901      	cmp	r1, #1
 8000aa4:	d101      	bne.n	8000aaa <RCC_GetClocksFreq+0x19e>
 8000aa6:	6382      	str	r2, [r0, #56]	; 0x38
 8000aa8:	e00e      	b.n	8000ac8 <RCC_GetClocksFreq+0x1bc>
 8000aaa:	6b19      	ldr	r1, [r3, #48]	; 0x30
 8000aac:	f001 0103 	and.w	r1, r1, #3
 8000ab0:	2902      	cmp	r1, #2
 8000ab2:	d102      	bne.n	8000aba <RCC_GetClocksFreq+0x1ae>
 8000ab4:	f44f 4300 	mov.w	r3, #32768	; 0x8000
 8000ab8:	e005      	b.n	8000ac6 <RCC_GetClocksFreq+0x1ba>
 8000aba:	6b1b      	ldr	r3, [r3, #48]	; 0x30
 8000abc:	f003 0303 	and.w	r3, r3, #3
 8000ac0:	2b03      	cmp	r3, #3
 8000ac2:	d101      	bne.n	8000ac8 <RCC_GetClocksFreq+0x1bc>
 8000ac4:	4b2f      	ldr	r3, [pc, #188]	; (8000b84 <RCC_GetClocksFreq+0x278>)
 8000ac6:	6383      	str	r3, [r0, #56]	; 0x38
 8000ac8:	6b39      	ldr	r1, [r7, #48]	; 0x30
 8000aca:	4b2d      	ldr	r3, [pc, #180]	; (8000b80 <RCC_GetClocksFreq+0x274>)
 8000acc:	f411 3f40 	tst.w	r1, #196608	; 0x30000
 8000ad0:	d102      	bne.n	8000ad8 <RCC_GetClocksFreq+0x1cc>
 8000ad2:	f8c0 e03c 	str.w	lr, [r0, #60]	; 0x3c
 8000ad6:	e018      	b.n	8000b0a <RCC_GetClocksFreq+0x1fe>
 8000ad8:	6b19      	ldr	r1, [r3, #48]	; 0x30
 8000ada:	f401 3140 	and.w	r1, r1, #196608	; 0x30000
 8000ade:	f5b1 3f80 	cmp.w	r1, #65536	; 0x10000
 8000ae2:	d101      	bne.n	8000ae8 <RCC_GetClocksFreq+0x1dc>
 8000ae4:	63c2      	str	r2, [r0, #60]	; 0x3c
 8000ae6:	e010      	b.n	8000b0a <RCC_GetClocksFreq+0x1fe>
 8000ae8:	6b19      	ldr	r1, [r3, #48]	; 0x30
 8000aea:	f401 3140 	and.w	r1, r1, #196608	; 0x30000
 8000aee:	f5b1 3f00 	cmp.w	r1, #131072	; 0x20000
 8000af2:	d102      	bne.n	8000afa <RCC_GetClocksFreq+0x1ee>
 8000af4:	f44f 4300 	mov.w	r3, #32768	; 0x8000
 8000af8:	e006      	b.n	8000b08 <RCC_GetClocksFreq+0x1fc>
 8000afa:	6b1b      	ldr	r3, [r3, #48]	; 0x30
 8000afc:	f403 3340 	and.w	r3, r3, #196608	; 0x30000
 8000b00:	f5b3 3f40 	cmp.w	r3, #196608	; 0x30000
 8000b04:	d101      	bne.n	8000b0a <RCC_GetClocksFreq+0x1fe>
 8000b06:	4b1f      	ldr	r3, [pc, #124]	; (8000b84 <RCC_GetClocksFreq+0x278>)
 8000b08:	63c3      	str	r3, [r0, #60]	; 0x3c
 8000b0a:	6b39      	ldr	r1, [r7, #48]	; 0x30
 8000b0c:	4b1c      	ldr	r3, [pc, #112]	; (8000b80 <RCC_GetClocksFreq+0x274>)
 8000b0e:	f411 2f40 	tst.w	r1, #786432	; 0xc0000
 8000b12:	d102      	bne.n	8000b1a <RCC_GetClocksFreq+0x20e>
 8000b14:	f8c0 e040 	str.w	lr, [r0, #64]	; 0x40
 8000b18:	e018      	b.n	8000b4c <RCC_GetClocksFreq+0x240>
 8000b1a:	6b19      	ldr	r1, [r3, #48]	; 0x30
 8000b1c:	f401 2140 	and.w	r1, r1, #786432	; 0xc0000
 8000b20:	f5b1 2f80 	cmp.w	r1, #262144	; 0x40000
 8000b24:	d101      	bne.n	8000b2a <RCC_GetClocksFreq+0x21e>
 8000b26:	6402      	str	r2, [r0, #64]	; 0x40
 8000b28:	e010      	b.n	8000b4c <RCC_GetClocksFreq+0x240>
 8000b2a:	6b19      	ldr	r1, [r3, #48]	; 0x30
 8000b2c:	f401 2140 	and.w	r1, r1, #786432	; 0xc0000
 8000b30:	f5b1 2f00 	cmp.w	r1, #524288	; 0x80000
 8000b34:	d102      	bne.n	8000b3c <RCC_GetClocksFreq+0x230>
 8000b36:	f44f 4300 	mov.w	r3, #32768	; 0x8000
 8000b3a:	e006      	b.n	8000b4a <RCC_GetClocksFreq+0x23e>
 8000b3c:	6b1b      	ldr	r3, [r3, #48]	; 0x30
 8000b3e:	f403 2340 	and.w	r3, r3, #786432	; 0xc0000
 8000b42:	f5b3 2f40 	cmp.w	r3, #786432	; 0xc0000
 8000b46:	d101      	bne.n	8000b4c <RCC_GetClocksFreq+0x240>
 8000b48:	4b0e      	ldr	r3, [pc, #56]	; (8000b84 <RCC_GetClocksFreq+0x278>)
 8000b4a:	6403      	str	r3, [r0, #64]	; 0x40
 8000b4c:	6b39      	ldr	r1, [r7, #48]	; 0x30
 8000b4e:	4b0c      	ldr	r3, [pc, #48]	; (8000b80 <RCC_GetClocksFreq+0x274>)
 8000b50:	f411 1f40 	tst.w	r1, #3145728	; 0x300000
 8000b54:	d102      	bne.n	8000b5c <RCC_GetClocksFreq+0x250>
 8000b56:	f8c0 e044 	str.w	lr, [r0, #68]	; 0x44
 8000b5a:	e023      	b.n	8000ba4 <RCC_GetClocksFreq+0x298>
 8000b5c:	6b19      	ldr	r1, [r3, #48]	; 0x30
 8000b5e:	f401 1140 	and.w	r1, r1, #3145728	; 0x300000
 8000b62:	f5b1 1f80 	cmp.w	r1, #1048576	; 0x100000
 8000b66:	d101      	bne.n	8000b6c <RCC_GetClocksFreq+0x260>
 8000b68:	6442      	str	r2, [r0, #68]	; 0x44
 8000b6a:	e01b      	b.n	8000ba4 <RCC_GetClocksFreq+0x298>
 8000b6c:	6b19      	ldr	r1, [r3, #48]	; 0x30
 8000b6e:	f401 1140 	and.w	r1, r1, #3145728	; 0x300000
 8000b72:	f5b1 1f00 	cmp.w	r1, #2097152	; 0x200000
 8000b76:	d10d      	bne.n	8000b94 <RCC_GetClocksFreq+0x288>
 8000b78:	f44f 4300 	mov.w	r3, #32768	; 0x8000
 8000b7c:	e011      	b.n	8000ba2 <RCC_GetClocksFreq+0x296>
 8000b7e:	bf00      	nop
 8000b80:	40021000 	.word	0x40021000
 8000b84:	007a1200 	.word	0x007a1200
 8000b88:	003d0900 	.word	0x003d0900
 8000b8c:	20000020 	.word	0x20000020
 8000b90:	20000000 	.word	0x20000000
 8000b94:	6b1b      	ldr	r3, [r3, #48]	; 0x30
 8000b96:	f403 1340 	and.w	r3, r3, #3145728	; 0x300000
 8000b9a:	f5b3 1f40 	cmp.w	r3, #3145728	; 0x300000
 8000b9e:	d101      	bne.n	8000ba4 <RCC_GetClocksFreq+0x298>
 8000ba0:	4b13      	ldr	r3, [pc, #76]	; (8000bf0 <RCC_GetClocksFreq+0x2e4>)
 8000ba2:	6443      	str	r3, [r0, #68]	; 0x44
 8000ba4:	6b39      	ldr	r1, [r7, #48]	; 0x30
 8000ba6:	4b13      	ldr	r3, [pc, #76]	; (8000bf4 <RCC_GetClocksFreq+0x2e8>)
 8000ba8:	f411 0f40 	tst.w	r1, #12582912	; 0xc00000
 8000bac:	d103      	bne.n	8000bb6 <RCC_GetClocksFreq+0x2aa>
 8000bae:	f8c0 e048 	str.w	lr, [r0, #72]	; 0x48
 8000bb2:	e8bd 81f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, pc}
 8000bb6:	6b19      	ldr	r1, [r3, #48]	; 0x30
 8000bb8:	f401 0140 	and.w	r1, r1, #12582912	; 0xc00000
 8000bbc:	f5b1 0f80 	cmp.w	r1, #4194304	; 0x400000
 8000bc0:	d102      	bne.n	8000bc8 <RCC_GetClocksFreq+0x2bc>
 8000bc2:	6482      	str	r2, [r0, #72]	; 0x48
 8000bc4:	e8bd 81f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, pc}
 8000bc8:	6b1a      	ldr	r2, [r3, #48]	; 0x30
 8000bca:	f402 0240 	and.w	r2, r2, #12582912	; 0xc00000
 8000bce:	f5b2 0f00 	cmp.w	r2, #8388608	; 0x800000
 8000bd2:	d102      	bne.n	8000bda <RCC_GetClocksFreq+0x2ce>
 8000bd4:	f44f 4300 	mov.w	r3, #32768	; 0x8000
 8000bd8:	e006      	b.n	8000be8 <RCC_GetClocksFreq+0x2dc>
 8000bda:	6b1b      	ldr	r3, [r3, #48]	; 0x30
 8000bdc:	f403 0340 	and.w	r3, r3, #12582912	; 0xc00000
 8000be0:	f5b3 0f40 	cmp.w	r3, #12582912	; 0xc00000
 8000be4:	d101      	bne.n	8000bea <RCC_GetClocksFreq+0x2de>
 8000be6:	4b02      	ldr	r3, [pc, #8]	; (8000bf0 <RCC_GetClocksFreq+0x2e4>)
 8000be8:	6483      	str	r3, [r0, #72]	; 0x48
 8000bea:	e8bd 81f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, pc}
 8000bee:	bf00      	nop
 8000bf0:	007a1200 	.word	0x007a1200
 8000bf4:	40021000 	.word	0x40021000

08000bf8 <RCC_AHBPeriphClockCmd>:
 8000bf8:	bf00      	nop
 8000bfa:	bf00      	nop
 8000bfc:	4b04      	ldr	r3, [pc, #16]	; (8000c10 <RCC_AHBPeriphClockCmd+0x18>)
 8000bfe:	695a      	ldr	r2, [r3, #20]
 8000c00:	b109      	cbz	r1, 8000c06 <RCC_AHBPeriphClockCmd+0xe>
 8000c02:	4310      	orrs	r0, r2
 8000c04:	e001      	b.n	8000c0a <RCC_AHBPeriphClockCmd+0x12>
 8000c06:	ea22 0000 	bic.w	r0, r2, r0
 8000c0a:	6158      	str	r0, [r3, #20]
 8000c0c:	4770      	bx	lr
 8000c0e:	bf00      	nop
 8000c10:	40021000 	.word	0x40021000

08000c14 <RCC_APB2PeriphClockCmd>:
 8000c14:	bf00      	nop
 8000c16:	bf00      	nop
 8000c18:	4b04      	ldr	r3, [pc, #16]	; (8000c2c <RCC_APB2PeriphClockCmd+0x18>)
 8000c1a:	699a      	ldr	r2, [r3, #24]
 8000c1c:	b109      	cbz	r1, 8000c22 <RCC_APB2PeriphClockCmd+0xe>
 8000c1e:	4310      	orrs	r0, r2
 8000c20:	e001      	b.n	8000c26 <RCC_APB2PeriphClockCmd+0x12>
 8000c22:	ea22 0000 	bic.w	r0, r2, r0
 8000c26:	6198      	str	r0, [r3, #24]
 8000c28:	4770      	bx	lr
 8000c2a:	bf00      	nop
 8000c2c:	40021000 	.word	0x40021000

08000c30 <RCC_APB1PeriphClockCmd>:
 8000c30:	bf00      	nop
 8000c32:	bf00      	nop
 8000c34:	4b04      	ldr	r3, [pc, #16]	; (8000c48 <RCC_APB1PeriphClockCmd+0x18>)
 8000c36:	69da      	ldr	r2, [r3, #28]
 8000c38:	b109      	cbz	r1, 8000c3e <RCC_APB1PeriphClockCmd+0xe>
 8000c3a:	4310      	orrs	r0, r2
 8000c3c:	e001      	b.n	8000c42 <RCC_APB1PeriphClockCmd+0x12>
 8000c3e:	ea22 0000 	bic.w	r0, r2, r0
 8000c42:	61d8      	str	r0, [r3, #28]
 8000c44:	4770      	bx	lr
 8000c46:	bf00      	nop
 8000c48:	40021000 	.word	0x40021000

08000c4c <TIM_TimeBaseInit>:
 8000c4c:	bf00      	nop
 8000c4e:	bf00      	nop
 8000c50:	bf00      	nop
 8000c52:	4a24      	ldr	r2, [pc, #144]	; (8000ce4 <TIM_TimeBaseInit+0x98>)
 8000c54:	8803      	ldrh	r3, [r0, #0]
 8000c56:	4290      	cmp	r0, r2
 8000c58:	b29b      	uxth	r3, r3
 8000c5a:	d012      	beq.n	8000c82 <TIM_TimeBaseInit+0x36>
 8000c5c:	f502 6200 	add.w	r2, r2, #2048	; 0x800
 8000c60:	4290      	cmp	r0, r2
 8000c62:	d00e      	beq.n	8000c82 <TIM_TimeBaseInit+0x36>
 8000c64:	f1b0 4f80 	cmp.w	r0, #1073741824	; 0x40000000
 8000c68:	d00b      	beq.n	8000c82 <TIM_TimeBaseInit+0x36>
 8000c6a:	f5a2 3298 	sub.w	r2, r2, #77824	; 0x13000
 8000c6e:	4290      	cmp	r0, r2
 8000c70:	d007      	beq.n	8000c82 <TIM_TimeBaseInit+0x36>
 8000c72:	f502 6280 	add.w	r2, r2, #1024	; 0x400
 8000c76:	4290      	cmp	r0, r2
 8000c78:	d003      	beq.n	8000c82 <TIM_TimeBaseInit+0x36>
 8000c7a:	f502 32a4 	add.w	r2, r2, #83968	; 0x14800
 8000c7e:	4290      	cmp	r0, r2
 8000c80:	d103      	bne.n	8000c8a <TIM_TimeBaseInit+0x3e>
 8000c82:	884a      	ldrh	r2, [r1, #2]
 8000c84:	f023 0370 	bic.w	r3, r3, #112	; 0x70
 8000c88:	4313      	orrs	r3, r2
 8000c8a:	4a17      	ldr	r2, [pc, #92]	; (8000ce8 <TIM_TimeBaseInit+0x9c>)
 8000c8c:	4290      	cmp	r0, r2
 8000c8e:	d008      	beq.n	8000ca2 <TIM_TimeBaseInit+0x56>
 8000c90:	f502 6280 	add.w	r2, r2, #1024	; 0x400
 8000c94:	4290      	cmp	r0, r2
 8000c96:	bf1f      	itttt	ne
 8000c98:	f423 7340 	bicne.w	r3, r3, #768	; 0x300
 8000c9c:	890a      	ldrhne	r2, [r1, #8]
 8000c9e:	b29b      	uxthne	r3, r3
 8000ca0:	4313      	orrne	r3, r2
 8000ca2:	8003      	strh	r3, [r0, #0]
 8000ca4:	684b      	ldr	r3, [r1, #4]
 8000ca6:	62c3      	str	r3, [r0, #44]	; 0x2c
 8000ca8:	880b      	ldrh	r3, [r1, #0]
 8000caa:	8503      	strh	r3, [r0, #40]	; 0x28
 8000cac:	4b0d      	ldr	r3, [pc, #52]	; (8000ce4 <TIM_TimeBaseInit+0x98>)
 8000cae:	4298      	cmp	r0, r3
 8000cb0:	d013      	beq.n	8000cda <TIM_TimeBaseInit+0x8e>
 8000cb2:	f503 6300 	add.w	r3, r3, #2048	; 0x800
 8000cb6:	4298      	cmp	r0, r3
 8000cb8:	d00f      	beq.n	8000cda <TIM_TimeBaseInit+0x8e>
 8000cba:	f503 6340 	add.w	r3, r3, #3072	; 0xc00
 8000cbe:	4298      	cmp	r0, r3
 8000cc0:	d00b      	beq.n	8000cda <TIM_TimeBaseInit+0x8e>
 8000cc2:	f503 6380 	add.w	r3, r3, #1024	; 0x400
 8000cc6:	4298      	cmp	r0, r3
 8000cc8:	d007      	beq.n	8000cda <TIM_TimeBaseInit+0x8e>
 8000cca:	f503 6380 	add.w	r3, r3, #1024	; 0x400
 8000cce:	4298      	cmp	r0, r3
 8000cd0:	d003      	beq.n	8000cda <TIM_TimeBaseInit+0x8e>
 8000cd2:	f503 6300 	add.w	r3, r3, #2048	; 0x800
 8000cd6:	4298      	cmp	r0, r3
 8000cd8:	d101      	bne.n	8000cde <TIM_TimeBaseInit+0x92>
 8000cda:	894b      	ldrh	r3, [r1, #10]
 8000cdc:	8603      	strh	r3, [r0, #48]	; 0x30
 8000cde:	2301      	movs	r3, #1
 8000ce0:	6143      	str	r3, [r0, #20]
 8000ce2:	4770      	bx	lr
 8000ce4:	40012c00 	.word	0x40012c00
 8000ce8:	40001000 	.word	0x40001000

08000cec <TIM_Cmd>:
 8000cec:	bf00      	nop
 8000cee:	bf00      	nop
 8000cf0:	8803      	ldrh	r3, [r0, #0]
 8000cf2:	b119      	cbz	r1, 8000cfc <TIM_Cmd+0x10>
 8000cf4:	b29b      	uxth	r3, r3
 8000cf6:	f043 0301 	orr.w	r3, r3, #1
 8000cfa:	e003      	b.n	8000d04 <TIM_Cmd+0x18>
 8000cfc:	f023 0301 	bic.w	r3, r3, #1
 8000d00:	041b      	lsls	r3, r3, #16
 8000d02:	0c1b      	lsrs	r3, r3, #16
 8000d04:	8003      	strh	r3, [r0, #0]
 8000d06:	4770      	bx	lr

08000d08 <TIM_OC1Init>:
 8000d08:	b570      	push	{r4, r5, r6, lr}
 8000d0a:	bf00      	nop
 8000d0c:	bf00      	nop
 8000d0e:	bf00      	nop
 8000d10:	bf00      	nop
 8000d12:	6a03      	ldr	r3, [r0, #32]
 8000d14:	680d      	ldr	r5, [r1, #0]
 8000d16:	f023 0301 	bic.w	r3, r3, #1
 8000d1a:	6203      	str	r3, [r0, #32]
 8000d1c:	6a03      	ldr	r3, [r0, #32]
 8000d1e:	6844      	ldr	r4, [r0, #4]
 8000d20:	6982      	ldr	r2, [r0, #24]
 8000d22:	f422 3280 	bic.w	r2, r2, #65536	; 0x10000
 8000d26:	f022 0273 	bic.w	r2, r2, #115	; 0x73
 8000d2a:	4315      	orrs	r5, r2
 8000d2c:	898a      	ldrh	r2, [r1, #12]
 8000d2e:	f023 0302 	bic.w	r3, r3, #2
 8000d32:	4313      	orrs	r3, r2
 8000d34:	888a      	ldrh	r2, [r1, #4]
 8000d36:	4313      	orrs	r3, r2
 8000d38:	4a15      	ldr	r2, [pc, #84]	; (8000d90 <TIM_OC1Init+0x88>)
 8000d3a:	4290      	cmp	r0, r2
 8000d3c:	d00f      	beq.n	8000d5e <TIM_OC1Init+0x56>
 8000d3e:	f502 6200 	add.w	r2, r2, #2048	; 0x800
 8000d42:	4290      	cmp	r0, r2
 8000d44:	d00b      	beq.n	8000d5e <TIM_OC1Init+0x56>
 8000d46:	f502 6240 	add.w	r2, r2, #3072	; 0xc00
 8000d4a:	4290      	cmp	r0, r2
 8000d4c:	d007      	beq.n	8000d5e <TIM_OC1Init+0x56>
 8000d4e:	f502 6280 	add.w	r2, r2, #1024	; 0x400
 8000d52:	4290      	cmp	r0, r2
 8000d54:	d003      	beq.n	8000d5e <TIM_OC1Init+0x56>
 8000d56:	f502 6280 	add.w	r2, r2, #1024	; 0x400
 8000d5a:	4290      	cmp	r0, r2
 8000d5c:	d111      	bne.n	8000d82 <TIM_OC1Init+0x7a>
 8000d5e:	bf00      	nop
 8000d60:	bf00      	nop
 8000d62:	bf00      	nop
 8000d64:	bf00      	nop
 8000d66:	89ca      	ldrh	r2, [r1, #14]
 8000d68:	88ce      	ldrh	r6, [r1, #6]
 8000d6a:	f023 0308 	bic.w	r3, r3, #8
 8000d6e:	4313      	orrs	r3, r2
 8000d70:	8a0a      	ldrh	r2, [r1, #16]
 8000d72:	f424 7440 	bic.w	r4, r4, #768	; 0x300
 8000d76:	4314      	orrs	r4, r2
 8000d78:	8a4a      	ldrh	r2, [r1, #18]
 8000d7a:	f023 0304 	bic.w	r3, r3, #4
 8000d7e:	4333      	orrs	r3, r6
 8000d80:	4314      	orrs	r4, r2
 8000d82:	688a      	ldr	r2, [r1, #8]
 8000d84:	6044      	str	r4, [r0, #4]
 8000d86:	6185      	str	r5, [r0, #24]
 8000d88:	6342      	str	r2, [r0, #52]	; 0x34
 8000d8a:	6203      	str	r3, [r0, #32]
 8000d8c:	bd70      	pop	{r4, r5, r6, pc}
 8000d8e:	bf00      	nop
 8000d90:	40012c00 	.word	0x40012c00

08000d94 <TIM_OC2Init>:
 8000d94:	b570      	push	{r4, r5, r6, lr}
 8000d96:	bf00      	nop
 8000d98:	bf00      	nop
 8000d9a:	bf00      	nop
 8000d9c:	bf00      	nop
 8000d9e:	6a03      	ldr	r3, [r0, #32]
 8000da0:	680d      	ldr	r5, [r1, #0]
 8000da2:	898e      	ldrh	r6, [r1, #12]
 8000da4:	f023 0310 	bic.w	r3, r3, #16
 8000da8:	6203      	str	r3, [r0, #32]
 8000daa:	6a03      	ldr	r3, [r0, #32]
 8000dac:	6844      	ldr	r4, [r0, #4]
 8000dae:	6982      	ldr	r2, [r0, #24]
 8000db0:	f022 7280 	bic.w	r2, r2, #16777216	; 0x1000000
 8000db4:	f422 42e6 	bic.w	r2, r2, #29440	; 0x7300
 8000db8:	ea42 2505 	orr.w	r5, r2, r5, lsl #8
 8000dbc:	f023 0220 	bic.w	r2, r3, #32
 8000dc0:	888b      	ldrh	r3, [r1, #4]
 8000dc2:	4333      	orrs	r3, r6
 8000dc4:	ea42 1303 	orr.w	r3, r2, r3, lsl #4
 8000dc8:	4a10      	ldr	r2, [pc, #64]	; (8000e0c <TIM_OC2Init+0x78>)
 8000dca:	4290      	cmp	r0, r2
 8000dcc:	d003      	beq.n	8000dd6 <TIM_OC2Init+0x42>
 8000dce:	f502 6200 	add.w	r2, r2, #2048	; 0x800
 8000dd2:	4290      	cmp	r0, r2
 8000dd4:	d114      	bne.n	8000e00 <TIM_OC2Init+0x6c>
 8000dd6:	bf00      	nop
 8000dd8:	bf00      	nop
 8000dda:	bf00      	nop
 8000ddc:	bf00      	nop
 8000dde:	89ca      	ldrh	r2, [r1, #14]
 8000de0:	8a0e      	ldrh	r6, [r1, #16]
 8000de2:	f023 0380 	bic.w	r3, r3, #128	; 0x80
 8000de6:	ea43 1302 	orr.w	r3, r3, r2, lsl #4
 8000dea:	88ca      	ldrh	r2, [r1, #6]
 8000dec:	f023 0340 	bic.w	r3, r3, #64	; 0x40
 8000df0:	ea43 1302 	orr.w	r3, r3, r2, lsl #4
 8000df4:	8a4a      	ldrh	r2, [r1, #18]
 8000df6:	f424 6440 	bic.w	r4, r4, #3072	; 0xc00
 8000dfa:	4332      	orrs	r2, r6
 8000dfc:	ea44 0482 	orr.w	r4, r4, r2, lsl #2
 8000e00:	688a      	ldr	r2, [r1, #8]
 8000e02:	6044      	str	r4, [r0, #4]
 8000e04:	6185      	str	r5, [r0, #24]
 8000e06:	6382      	str	r2, [r0, #56]	; 0x38
 8000e08:	6203      	str	r3, [r0, #32]
 8000e0a:	bd70      	pop	{r4, r5, r6, pc}
 8000e0c:	40012c00 	.word	0x40012c00

08000e10 <TIM_CtrlPWMOutputs>:
 8000e10:	bf00      	nop
 8000e12:	bf00      	nop
 8000e14:	6c43      	ldr	r3, [r0, #68]	; 0x44
 8000e16:	b111      	cbz	r1, 8000e1e <TIM_CtrlPWMOutputs+0xe>
 8000e18:	f443 4300 	orr.w	r3, r3, #32768	; 0x8000
 8000e1c:	e001      	b.n	8000e22 <TIM_CtrlPWMOutputs+0x12>
 8000e1e:	f3c3 030e 	ubfx	r3, r3, #0, #15
 8000e22:	6443      	str	r3, [r0, #68]	; 0x44
 8000e24:	4770      	bx	lr

08000e26 <TIM_ClearITPendingBit>:
 8000e26:	bf00      	nop
 8000e28:	43c9      	mvns	r1, r1
 8000e2a:	b289      	uxth	r1, r1
 8000e2c:	6101      	str	r1, [r0, #16]
 8000e2e:	4770      	bx	lr

08000e30 <timer_init>:
 8000e30:	b530      	push	{r4, r5, lr}
 8000e32:	2300      	movs	r3, #0
 8000e34:	b085      	sub	sp, #20
 8000e36:	491f      	ldr	r1, [pc, #124]	; (8000eb4 <timer_init+0x84>)
 8000e38:	f44f 6280 	mov.w	r2, #1024	; 0x400
 8000e3c:	f821 2013 	strh.w	r2, [r1, r3, lsl #1]
 8000e40:	491d      	ldr	r1, [pc, #116]	; (8000eb8 <timer_init+0x88>)
 8000e42:	f821 2013 	strh.w	r2, [r1, r3, lsl #1]
 8000e46:	4a1d      	ldr	r2, [pc, #116]	; (8000ebc <timer_init+0x8c>)
 8000e48:	2400      	movs	r4, #0
 8000e4a:	f822 4013 	strh.w	r4, [r2, r3, lsl #1]
 8000e4e:	3301      	adds	r3, #1
 8000e50:	2b04      	cmp	r3, #4
 8000e52:	4625      	mov	r5, r4
 8000e54:	d1ef      	bne.n	8000e36 <timer_init+0x6>
 8000e56:	4b1a      	ldr	r3, [pc, #104]	; (8000ec0 <timer_init+0x90>)
 8000e58:	2002      	movs	r0, #2
 8000e5a:	2101      	movs	r1, #1
 8000e5c:	601c      	str	r4, [r3, #0]
 8000e5e:	f7ff fee7 	bl	8000c30 <RCC_APB1PeriphClockCmd>
 8000e62:	f8ad 4006 	strh.w	r4, [sp, #6]
 8000e66:	f8ad 400c 	strh.w	r4, [sp, #12]
 8000e6a:	f8ad 400e 	strh.w	r4, [sp, #14]
 8000e6e:	4c15      	ldr	r4, [pc, #84]	; (8000ec4 <timer_init+0x94>)
 8000e70:	f44f 738c 	mov.w	r3, #280	; 0x118
 8000e74:	f8ad 3004 	strh.w	r3, [sp, #4]
 8000e78:	4620      	mov	r0, r4
 8000e7a:	2331      	movs	r3, #49	; 0x31
 8000e7c:	a901      	add	r1, sp, #4
 8000e7e:	9302      	str	r3, [sp, #8]
 8000e80:	f7ff fee4 	bl	8000c4c <TIM_TimeBaseInit>
 8000e84:	4620      	mov	r0, r4
 8000e86:	2101      	movs	r1, #1
 8000e88:	f7ff ff30 	bl	8000cec <TIM_Cmd>
 8000e8c:	68e3      	ldr	r3, [r4, #12]
 8000e8e:	f043 0301 	orr.w	r3, r3, #1
 8000e92:	60e3      	str	r3, [r4, #12]
 8000e94:	231d      	movs	r3, #29
 8000e96:	f88d 3000 	strb.w	r3, [sp]
 8000e9a:	4668      	mov	r0, sp
 8000e9c:	2301      	movs	r3, #1
 8000e9e:	f88d 5001 	strb.w	r5, [sp, #1]
 8000ea2:	f88d 3002 	strb.w	r3, [sp, #2]
 8000ea6:	f88d 3003 	strb.w	r3, [sp, #3]
 8000eaa:	f000 fb9f 	bl	80015ec <NVIC_Init>
 8000eae:	b005      	add	sp, #20
 8000eb0:	bd30      	pop	{r4, r5, pc}
 8000eb2:	bf00      	nop
 8000eb4:	2000029c 	.word	0x2000029c
 8000eb8:	20000290 	.word	0x20000290
 8000ebc:	20000288 	.word	0x20000288
 8000ec0:	20000298 	.word	0x20000298
 8000ec4:	40000400 	.word	0x40000400

08000ec8 <TIM3_IRQHandler>:
 8000ec8:	2300      	movs	r3, #0
 8000eca:	4910      	ldr	r1, [pc, #64]	; (8000f0c <TIM3_IRQHandler+0x44>)
 8000ecc:	f831 2013 	ldrh.w	r2, [r1, r3, lsl #1]
 8000ed0:	b292      	uxth	r2, r2
 8000ed2:	b132      	cbz	r2, 8000ee2 <TIM3_IRQHandler+0x1a>
 8000ed4:	f831 2013 	ldrh.w	r2, [r1, r3, lsl #1]
 8000ed8:	3a01      	subs	r2, #1
 8000eda:	b292      	uxth	r2, r2
 8000edc:	f821 2013 	strh.w	r2, [r1, r3, lsl #1]
 8000ee0:	e009      	b.n	8000ef6 <TIM3_IRQHandler+0x2e>
 8000ee2:	4a0b      	ldr	r2, [pc, #44]	; (8000f10 <TIM3_IRQHandler+0x48>)
 8000ee4:	f832 2013 	ldrh.w	r2, [r2, r3, lsl #1]
 8000ee8:	b292      	uxth	r2, r2
 8000eea:	f821 2013 	strh.w	r2, [r1, r3, lsl #1]
 8000eee:	4a09      	ldr	r2, [pc, #36]	; (8000f14 <TIM3_IRQHandler+0x4c>)
 8000ef0:	2101      	movs	r1, #1
 8000ef2:	f822 1013 	strh.w	r1, [r2, r3, lsl #1]
 8000ef6:	3301      	adds	r3, #1
 8000ef8:	2b04      	cmp	r3, #4
 8000efa:	d1e6      	bne.n	8000eca <TIM3_IRQHandler+0x2>
 8000efc:	4a06      	ldr	r2, [pc, #24]	; (8000f18 <TIM3_IRQHandler+0x50>)
 8000efe:	4807      	ldr	r0, [pc, #28]	; (8000f1c <TIM3_IRQHandler+0x54>)
 8000f00:	6813      	ldr	r3, [r2, #0]
 8000f02:	2101      	movs	r1, #1
 8000f04:	3301      	adds	r3, #1
 8000f06:	6013      	str	r3, [r2, #0]
 8000f08:	f7ff bf8d 	b.w	8000e26 <TIM_ClearITPendingBit>
 8000f0c:	2000029c 	.word	0x2000029c
 8000f10:	20000290 	.word	0x20000290
 8000f14:	20000288 	.word	0x20000288
 8000f18:	20000298 	.word	0x20000298
 8000f1c:	40000400 	.word	0x40000400

08000f20 <timer_get_time>:
 8000f20:	b082      	sub	sp, #8
 8000f22:	b672      	cpsid	i
 8000f24:	4b04      	ldr	r3, [pc, #16]	; (8000f38 <timer_get_time+0x18>)
 8000f26:	681b      	ldr	r3, [r3, #0]
 8000f28:	9301      	str	r3, [sp, #4]
 8000f2a:	b662      	cpsie	i
 8000f2c:	230a      	movs	r3, #10
 8000f2e:	9801      	ldr	r0, [sp, #4]
 8000f30:	fbb0 f0f3 	udiv	r0, r0, r3
 8000f34:	b002      	add	sp, #8
 8000f36:	4770      	bx	lr
 8000f38:	20000298 	.word	0x20000298

08000f3c <timer_delay_ms>:
 8000f3c:	b513      	push	{r0, r1, r4, lr}
 8000f3e:	4604      	mov	r4, r0
 8000f40:	f7ff ffee 	bl	8000f20 <timer_get_time>
 8000f44:	4420      	add	r0, r4
 8000f46:	9001      	str	r0, [sp, #4]
 8000f48:	9c01      	ldr	r4, [sp, #4]
 8000f4a:	f7ff ffe9 	bl	8000f20 <timer_get_time>
 8000f4e:	4284      	cmp	r4, r0
 8000f50:	d902      	bls.n	8000f58 <timer_delay_ms+0x1c>
 8000f52:	f000 fa41 	bl	80013d8 <sleep>
 8000f56:	e7f7      	b.n	8000f48 <timer_delay_ms+0xc>
 8000f58:	b002      	add	sp, #8
 8000f5a:	bd10      	pop	{r4, pc}

08000f5c <USART_Init>:
 8000f5c:	b530      	push	{r4, r5, lr}
 8000f5e:	4604      	mov	r4, r0
 8000f60:	b099      	sub	sp, #100	; 0x64
 8000f62:	460d      	mov	r5, r1
 8000f64:	bf00      	nop
 8000f66:	bf00      	nop
 8000f68:	bf00      	nop
 8000f6a:	bf00      	nop
 8000f6c:	bf00      	nop
 8000f6e:	bf00      	nop
 8000f70:	bf00      	nop
 8000f72:	6803      	ldr	r3, [r0, #0]
 8000f74:	f023 0301 	bic.w	r3, r3, #1
 8000f78:	6003      	str	r3, [r0, #0]
 8000f7a:	6843      	ldr	r3, [r0, #4]
 8000f7c:	f423 5240 	bic.w	r2, r3, #12288	; 0x3000
 8000f80:	688b      	ldr	r3, [r1, #8]
 8000f82:	68c9      	ldr	r1, [r1, #12]
 8000f84:	4313      	orrs	r3, r2
 8000f86:	6043      	str	r3, [r0, #4]
 8000f88:	686a      	ldr	r2, [r5, #4]
 8000f8a:	6803      	ldr	r3, [r0, #0]
 8000f8c:	4311      	orrs	r1, r2
 8000f8e:	692a      	ldr	r2, [r5, #16]
 8000f90:	f423 53b0 	bic.w	r3, r3, #5632	; 0x1600
 8000f94:	430a      	orrs	r2, r1
 8000f96:	f023 030c 	bic.w	r3, r3, #12
 8000f9a:	4313      	orrs	r3, r2
 8000f9c:	6003      	str	r3, [r0, #0]
 8000f9e:	6883      	ldr	r3, [r0, #8]
 8000fa0:	f423 7240 	bic.w	r2, r3, #768	; 0x300
 8000fa4:	696b      	ldr	r3, [r5, #20]
 8000fa6:	4313      	orrs	r3, r2
 8000fa8:	6083      	str	r3, [r0, #8]
 8000faa:	a801      	add	r0, sp, #4
 8000fac:	f7ff fcae 	bl	800090c <RCC_GetClocksFreq>
 8000fb0:	4b17      	ldr	r3, [pc, #92]	; (8001010 <USART_Init+0xb4>)
 8000fb2:	429c      	cmp	r4, r3
 8000fb4:	d101      	bne.n	8000fba <USART_Init+0x5e>
 8000fb6:	9b0f      	ldr	r3, [sp, #60]	; 0x3c
 8000fb8:	e00e      	b.n	8000fd8 <USART_Init+0x7c>
 8000fba:	4b16      	ldr	r3, [pc, #88]	; (8001014 <USART_Init+0xb8>)
 8000fbc:	429c      	cmp	r4, r3
 8000fbe:	d101      	bne.n	8000fc4 <USART_Init+0x68>
 8000fc0:	9b10      	ldr	r3, [sp, #64]	; 0x40
 8000fc2:	e009      	b.n	8000fd8 <USART_Init+0x7c>
 8000fc4:	4b14      	ldr	r3, [pc, #80]	; (8001018 <USART_Init+0xbc>)
 8000fc6:	429c      	cmp	r4, r3
 8000fc8:	d101      	bne.n	8000fce <USART_Init+0x72>
 8000fca:	9b11      	ldr	r3, [sp, #68]	; 0x44
 8000fcc:	e004      	b.n	8000fd8 <USART_Init+0x7c>
 8000fce:	4b13      	ldr	r3, [pc, #76]	; (800101c <USART_Init+0xc0>)
 8000fd0:	429c      	cmp	r4, r3
 8000fd2:	bf0c      	ite	eq
 8000fd4:	9b12      	ldreq	r3, [sp, #72]	; 0x48
 8000fd6:	9b13      	ldrne	r3, [sp, #76]	; 0x4c
 8000fd8:	6822      	ldr	r2, [r4, #0]
 8000fda:	6829      	ldr	r1, [r5, #0]
 8000fdc:	f412 4f00 	tst.w	r2, #32768	; 0x8000
 8000fe0:	bf18      	it	ne
 8000fe2:	005b      	lslne	r3, r3, #1
 8000fe4:	fbb3 f2f1 	udiv	r2, r3, r1
 8000fe8:	fb01 3312 	mls	r3, r1, r2, r3
 8000fec:	ebb3 0f51 	cmp.w	r3, r1, lsr #1
 8000ff0:	6823      	ldr	r3, [r4, #0]
 8000ff2:	bf28      	it	cs
 8000ff4:	3201      	addcs	r2, #1
 8000ff6:	041b      	lsls	r3, r3, #16
 8000ff8:	bf41      	itttt	mi
 8000ffa:	f64f 73f0 	movwmi	r3, #65520	; 0xfff0
 8000ffe:	f3c2 0142 	ubfxmi	r1, r2, #1, #3
 8001002:	4013      	andmi	r3, r2
 8001004:	ea41 0203 	orrmi.w	r2, r1, r3
 8001008:	b292      	uxth	r2, r2
 800100a:	81a2      	strh	r2, [r4, #12]
 800100c:	b019      	add	sp, #100	; 0x64
 800100e:	bd30      	pop	{r4, r5, pc}
 8001010:	40013800 	.word	0x40013800
 8001014:	40004400 	.word	0x40004400
 8001018:	40004800 	.word	0x40004800
 800101c:	40004c00 	.word	0x40004c00

08001020 <USART_Cmd>:
 8001020:	bf00      	nop
 8001022:	bf00      	nop
 8001024:	6803      	ldr	r3, [r0, #0]
 8001026:	b111      	cbz	r1, 800102e <USART_Cmd+0xe>
 8001028:	f043 0301 	orr.w	r3, r3, #1
 800102c:	e001      	b.n	8001032 <USART_Cmd+0x12>
 800102e:	f023 0301 	bic.w	r3, r3, #1
 8001032:	6003      	str	r3, [r0, #0]
 8001034:	4770      	bx	lr

08001036 <USART_ReceiveData>:
 8001036:	bf00      	nop
 8001038:	8c80      	ldrh	r0, [r0, #36]	; 0x24
 800103a:	f3c0 0008 	ubfx	r0, r0, #0, #9
 800103e:	4770      	bx	lr

08001040 <USART_ITConfig>:
 8001040:	b510      	push	{r4, lr}
 8001042:	bf00      	nop
 8001044:	bf00      	nop
 8001046:	bf00      	nop
 8001048:	f3c1 2407 	ubfx	r4, r1, #8, #8
 800104c:	2301      	movs	r3, #1
 800104e:	b2c9      	uxtb	r1, r1
 8001050:	2c02      	cmp	r4, #2
 8001052:	fa03 f301 	lsl.w	r3, r3, r1
 8001056:	d101      	bne.n	800105c <USART_ITConfig+0x1c>
 8001058:	3004      	adds	r0, #4
 800105a:	e002      	b.n	8001062 <USART_ITConfig+0x22>
 800105c:	2c03      	cmp	r4, #3
 800105e:	bf08      	it	eq
 8001060:	3008      	addeq	r0, #8
 8001062:	b112      	cbz	r2, 800106a <USART_ITConfig+0x2a>
 8001064:	6802      	ldr	r2, [r0, #0]
 8001066:	4313      	orrs	r3, r2
 8001068:	e002      	b.n	8001070 <USART_ITConfig+0x30>
 800106a:	6802      	ldr	r2, [r0, #0]
 800106c:	ea22 0303 	bic.w	r3, r2, r3
 8001070:	6003      	str	r3, [r0, #0]
 8001072:	bd10      	pop	{r4, pc}

08001074 <USART_GetITStatus>:
 8001074:	b510      	push	{r4, lr}
 8001076:	bf00      	nop
 8001078:	bf00      	nop
 800107a:	f3c1 2207 	ubfx	r2, r1, #8, #8
 800107e:	b2cc      	uxtb	r4, r1
 8001080:	2301      	movs	r3, #1
 8001082:	2a01      	cmp	r2, #1
 8001084:	fa03 f304 	lsl.w	r3, r3, r4
 8001088:	d101      	bne.n	800108e <USART_GetITStatus+0x1a>
 800108a:	6802      	ldr	r2, [r0, #0]
 800108c:	e003      	b.n	8001096 <USART_GetITStatus+0x22>
 800108e:	2a02      	cmp	r2, #2
 8001090:	bf0c      	ite	eq
 8001092:	6842      	ldreq	r2, [r0, #4]
 8001094:	6882      	ldrne	r2, [r0, #8]
 8001096:	4013      	ands	r3, r2
 8001098:	69c2      	ldr	r2, [r0, #28]
 800109a:	b13b      	cbz	r3, 80010ac <USART_GetITStatus+0x38>
 800109c:	0c09      	lsrs	r1, r1, #16
 800109e:	2301      	movs	r3, #1
 80010a0:	408b      	lsls	r3, r1
 80010a2:	4213      	tst	r3, r2
 80010a4:	bf14      	ite	ne
 80010a6:	2001      	movne	r0, #1
 80010a8:	2000      	moveq	r0, #0
 80010aa:	bd10      	pop	{r4, pc}
 80010ac:	4618      	mov	r0, r3
 80010ae:	bd10      	pop	{r4, pc}

080010b0 <USART_ClearITPendingBit>:
 80010b0:	bf00      	nop
 80010b2:	bf00      	nop
 80010b4:	2301      	movs	r3, #1
 80010b6:	0c09      	lsrs	r1, r1, #16
 80010b8:	408b      	lsls	r3, r1
 80010ba:	6203      	str	r3, [r0, #32]
 80010bc:	4770      	bx	lr
	...

080010c0 <uart_write>:
 80010c0:	4b04      	ldr	r3, [pc, #16]	; (80010d4 <uart_write+0x14>)
 80010c2:	69da      	ldr	r2, [r3, #28]
 80010c4:	0612      	lsls	r2, r2, #24
 80010c6:	d401      	bmi.n	80010cc <uart_write+0xc>
 80010c8:	bf00      	nop
 80010ca:	e7f9      	b.n	80010c0 <uart_write>
 80010cc:	b280      	uxth	r0, r0
 80010ce:	8518      	strh	r0, [r3, #40]	; 0x28
 80010d0:	4770      	bx	lr
 80010d2:	bf00      	nop
 80010d4:	40013800 	.word	0x40013800

080010d8 <uart_init>:
 80010d8:	b530      	push	{r4, r5, lr}
 80010da:	4b2c      	ldr	r3, [pc, #176]	; (800118c <uart_init+0xb4>)
 80010dc:	4d2c      	ldr	r5, [pc, #176]	; (8001190 <uart_init+0xb8>)
 80010de:	2400      	movs	r4, #0
 80010e0:	601c      	str	r4, [r3, #0]
 80010e2:	4b2c      	ldr	r3, [pc, #176]	; (8001194 <uart_init+0xbc>)
 80010e4:	b08b      	sub	sp, #44	; 0x2c
 80010e6:	f44f 3000 	mov.w	r0, #131072	; 0x20000
 80010ea:	2101      	movs	r1, #1
 80010ec:	601c      	str	r4, [r3, #0]
 80010ee:	f7ff fd83 	bl	8000bf8 <RCC_AHBPeriphClockCmd>
 80010f2:	f44f 4080 	mov.w	r0, #16384	; 0x4000
 80010f6:	2101      	movs	r1, #1
 80010f8:	f7ff fd8c 	bl	8000c14 <RCC_APB2PeriphClockCmd>
 80010fc:	f44f 63c0 	mov.w	r3, #1536	; 0x600
 8001100:	9302      	str	r3, [sp, #8]
 8001102:	2302      	movs	r3, #2
 8001104:	f88d 300c 	strb.w	r3, [sp, #12]
 8001108:	a902      	add	r1, sp, #8
 800110a:	2303      	movs	r3, #3
 800110c:	f04f 4090 	mov.w	r0, #1207959552	; 0x48000000
 8001110:	f88d 300d 	strb.w	r3, [sp, #13]
 8001114:	f88d 400e 	strb.w	r4, [sp, #14]
 8001118:	f88d 400f 	strb.w	r4, [sp, #15]
 800111c:	f000 fab1 	bl	8001682 <GPIO_Init>
 8001120:	f04f 4090 	mov.w	r0, #1207959552	; 0x48000000
 8001124:	2109      	movs	r1, #9
 8001126:	2207      	movs	r2, #7
 8001128:	f000 faf5 	bl	8001716 <GPIO_PinAFConfig>
 800112c:	2207      	movs	r2, #7
 800112e:	f04f 4090 	mov.w	r0, #1207959552	; 0x48000000
 8001132:	210a      	movs	r1, #10
 8001134:	f000 faef 	bl	8001716 <GPIO_PinAFConfig>
 8001138:	f44f 33e1 	mov.w	r3, #115200	; 0x1c200
 800113c:	9304      	str	r3, [sp, #16]
 800113e:	4628      	mov	r0, r5
 8001140:	230c      	movs	r3, #12
 8001142:	a904      	add	r1, sp, #16
 8001144:	9308      	str	r3, [sp, #32]
 8001146:	9405      	str	r4, [sp, #20]
 8001148:	9406      	str	r4, [sp, #24]
 800114a:	9407      	str	r4, [sp, #28]
 800114c:	9409      	str	r4, [sp, #36]	; 0x24
 800114e:	f7ff ff05 	bl	8000f5c <USART_Init>
 8001152:	4628      	mov	r0, r5
 8001154:	2101      	movs	r1, #1
 8001156:	f7ff ff63 	bl	8001020 <USART_Cmd>
 800115a:	2201      	movs	r2, #1
 800115c:	4628      	mov	r0, r5
 800115e:	490e      	ldr	r1, [pc, #56]	; (8001198 <uart_init+0xc0>)
 8001160:	f7ff ff6e 	bl	8001040 <USART_ITConfig>
 8001164:	2325      	movs	r3, #37	; 0x25
 8001166:	f88d 4005 	strb.w	r4, [sp, #5]
 800116a:	f88d 4006 	strb.w	r4, [sp, #6]
 800116e:	a801      	add	r0, sp, #4
 8001170:	2401      	movs	r4, #1
 8001172:	f88d 3004 	strb.w	r3, [sp, #4]
 8001176:	f88d 4007 	strb.w	r4, [sp, #7]
 800117a:	f000 fa37 	bl	80015ec <NVIC_Init>
 800117e:	4628      	mov	r0, r5
 8001180:	4621      	mov	r1, r4
 8001182:	f7ff ff4d 	bl	8001020 <USART_Cmd>
 8001186:	b00b      	add	sp, #44	; 0x2c
 8001188:	bd30      	pop	{r4, r5, pc}
 800118a:	bf00      	nop
 800118c:	200002b4 	.word	0x200002b4
 8001190:	40013800 	.word	0x40013800
 8001194:	200002b8 	.word	0x200002b8
 8001198:	00050105 	.word	0x00050105

0800119c <USART1_IRQHandler>:
 800119c:	b508      	push	{r3, lr}
 800119e:	480d      	ldr	r0, [pc, #52]	; (80011d4 <USART1_IRQHandler+0x38>)
 80011a0:	490d      	ldr	r1, [pc, #52]	; (80011d8 <USART1_IRQHandler+0x3c>)
 80011a2:	f7ff ff67 	bl	8001074 <USART_GetITStatus>
 80011a6:	b178      	cbz	r0, 80011c8 <USART1_IRQHandler+0x2c>
 80011a8:	480a      	ldr	r0, [pc, #40]	; (80011d4 <USART1_IRQHandler+0x38>)
 80011aa:	f7ff ff44 	bl	8001036 <USART_ReceiveData>
 80011ae:	4b0b      	ldr	r3, [pc, #44]	; (80011dc <USART1_IRQHandler+0x40>)
 80011b0:	490b      	ldr	r1, [pc, #44]	; (80011e0 <USART1_IRQHandler+0x44>)
 80011b2:	681a      	ldr	r2, [r3, #0]
 80011b4:	b2c0      	uxtb	r0, r0
 80011b6:	5488      	strb	r0, [r1, r2]
 80011b8:	681a      	ldr	r2, [r3, #0]
 80011ba:	3201      	adds	r2, #1
 80011bc:	601a      	str	r2, [r3, #0]
 80011be:	681a      	ldr	r2, [r3, #0]
 80011c0:	2a0f      	cmp	r2, #15
 80011c2:	bf84      	itt	hi
 80011c4:	2200      	movhi	r2, #0
 80011c6:	601a      	strhi	r2, [r3, #0]
 80011c8:	4802      	ldr	r0, [pc, #8]	; (80011d4 <USART1_IRQHandler+0x38>)
 80011ca:	4903      	ldr	r1, [pc, #12]	; (80011d8 <USART1_IRQHandler+0x3c>)
 80011cc:	e8bd 4008 	ldmia.w	sp!, {r3, lr}
 80011d0:	f7ff bf6e 	b.w	80010b0 <USART_ClearITPendingBit>
 80011d4:	40013800 	.word	0x40013800
 80011d8:	00050105 	.word	0x00050105
 80011dc:	200002b4 	.word	0x200002b4
 80011e0:	200002a4 	.word	0x200002a4

080011e4 <i2c_delay>:
 80011e4:	230b      	movs	r3, #11
 80011e6:	3b01      	subs	r3, #1
 80011e8:	d001      	beq.n	80011ee <i2c_delay+0xa>
 80011ea:	bf00      	nop
 80011ec:	e7fb      	b.n	80011e6 <i2c_delay+0x2>
 80011ee:	4770      	bx	lr

080011f0 <SetLowSDA>:
 80011f0:	b513      	push	{r0, r1, r4, lr}
 80011f2:	2301      	movs	r3, #1
 80011f4:	2203      	movs	r2, #3
 80011f6:	2410      	movs	r4, #16
 80011f8:	f88d 3004 	strb.w	r3, [sp, #4]
 80011fc:	f88d 3006 	strb.w	r3, [sp, #6]
 8001200:	4669      	mov	r1, sp
 8001202:	2300      	movs	r3, #0
 8001204:	f04f 4090 	mov.w	r0, #1207959552	; 0x48000000
 8001208:	f88d 2005 	strb.w	r2, [sp, #5]
 800120c:	f88d 3007 	strb.w	r3, [sp, #7]
 8001210:	9400      	str	r4, [sp, #0]
 8001212:	f000 fa36 	bl	8001682 <GPIO_Init>
 8001216:	f04f 4090 	mov.w	r0, #1207959552	; 0x48000000
 800121a:	4621      	mov	r1, r4
 800121c:	f000 fa77 	bl	800170e <GPIO_ResetBits>
 8001220:	f7ff ffe0 	bl	80011e4 <i2c_delay>
 8001224:	b002      	add	sp, #8
 8001226:	bd10      	pop	{r4, pc}

08001228 <SetHighSDA>:
 8001228:	b513      	push	{r0, r1, r4, lr}
 800122a:	2203      	movs	r2, #3
 800122c:	2300      	movs	r3, #0
 800122e:	2410      	movs	r4, #16
 8001230:	f88d 2005 	strb.w	r2, [sp, #5]
 8001234:	4669      	mov	r1, sp
 8001236:	2201      	movs	r2, #1
 8001238:	f04f 4090 	mov.w	r0, #1207959552	; 0x48000000
 800123c:	f88d 3004 	strb.w	r3, [sp, #4]
 8001240:	f88d 2006 	strb.w	r2, [sp, #6]
 8001244:	f88d 3007 	strb.w	r3, [sp, #7]
 8001248:	9400      	str	r4, [sp, #0]
 800124a:	f000 fa1a 	bl	8001682 <GPIO_Init>
 800124e:	f04f 4090 	mov.w	r0, #1207959552	; 0x48000000
 8001252:	4621      	mov	r1, r4
 8001254:	f000 fa57 	bl	8001706 <GPIO_SetBits>
 8001258:	f7ff ffc4 	bl	80011e4 <i2c_delay>
 800125c:	b002      	add	sp, #8
 800125e:	bd10      	pop	{r4, pc}

08001260 <SetHighSCL>:
 8001260:	b508      	push	{r3, lr}
 8001262:	f04f 4090 	mov.w	r0, #1207959552	; 0x48000000
 8001266:	2120      	movs	r1, #32
 8001268:	f000 fa4d 	bl	8001706 <GPIO_SetBits>
 800126c:	e8bd 4008 	ldmia.w	sp!, {r3, lr}
 8001270:	f7ff bfb8 	b.w	80011e4 <i2c_delay>

08001274 <i2c_0_init>:
 8001274:	b507      	push	{r0, r1, r2, lr}
 8001276:	f44f 3000 	mov.w	r0, #131072	; 0x20000
 800127a:	2101      	movs	r1, #1
 800127c:	f7ff fcbc 	bl	8000bf8 <RCC_AHBPeriphClockCmd>
 8001280:	2330      	movs	r3, #48	; 0x30
 8001282:	9300      	str	r3, [sp, #0]
 8001284:	2301      	movs	r3, #1
 8001286:	2203      	movs	r2, #3
 8001288:	f04f 4090 	mov.w	r0, #1207959552	; 0x48000000
 800128c:	4669      	mov	r1, sp
 800128e:	f88d 3004 	strb.w	r3, [sp, #4]
 8001292:	f88d 3006 	strb.w	r3, [sp, #6]
 8001296:	2300      	movs	r3, #0
 8001298:	f88d 2005 	strb.w	r2, [sp, #5]
 800129c:	f88d 3007 	strb.w	r3, [sp, #7]
 80012a0:	f000 f9ef 	bl	8001682 <GPIO_Init>
 80012a4:	f7ff ffdc 	bl	8001260 <SetHighSCL>
 80012a8:	f7ff ffa2 	bl	80011f0 <SetLowSDA>
 80012ac:	f7ff ffbc 	bl	8001228 <SetHighSDA>
 80012b0:	b003      	add	sp, #12
 80012b2:	f85d fb04 	ldr.w	pc, [sp], #4
	...

080012b8 <SystemInit>:
 80012b8:	4a39      	ldr	r2, [pc, #228]	; (80013a0 <SystemInit+0xe8>)
 80012ba:	f8d2 3088 	ldr.w	r3, [r2, #136]	; 0x88
 80012be:	f443 0370 	orr.w	r3, r3, #15728640	; 0xf00000
 80012c2:	f8c2 3088 	str.w	r3, [r2, #136]	; 0x88
 80012c6:	4b37      	ldr	r3, [pc, #220]	; (80013a4 <SystemInit+0xec>)
 80012c8:	681a      	ldr	r2, [r3, #0]
 80012ca:	f042 0201 	orr.w	r2, r2, #1
 80012ce:	601a      	str	r2, [r3, #0]
 80012d0:	6859      	ldr	r1, [r3, #4]
 80012d2:	4a35      	ldr	r2, [pc, #212]	; (80013a8 <SystemInit+0xf0>)
 80012d4:	400a      	ands	r2, r1
 80012d6:	605a      	str	r2, [r3, #4]
 80012d8:	681a      	ldr	r2, [r3, #0]
 80012da:	f022 7284 	bic.w	r2, r2, #17301504	; 0x1080000
 80012de:	f422 3280 	bic.w	r2, r2, #65536	; 0x10000
 80012e2:	601a      	str	r2, [r3, #0]
 80012e4:	681a      	ldr	r2, [r3, #0]
 80012e6:	f422 2280 	bic.w	r2, r2, #262144	; 0x40000
 80012ea:	601a      	str	r2, [r3, #0]
 80012ec:	685a      	ldr	r2, [r3, #4]
 80012ee:	f422 02fe 	bic.w	r2, r2, #8323072	; 0x7f0000
 80012f2:	605a      	str	r2, [r3, #4]
 80012f4:	6ada      	ldr	r2, [r3, #44]	; 0x2c
 80012f6:	f022 020f 	bic.w	r2, r2, #15
 80012fa:	62da      	str	r2, [r3, #44]	; 0x2c
 80012fc:	6b19      	ldr	r1, [r3, #48]	; 0x30
 80012fe:	4a2b      	ldr	r2, [pc, #172]	; (80013ac <SystemInit+0xf4>)
 8001300:	b082      	sub	sp, #8
 8001302:	400a      	ands	r2, r1
 8001304:	631a      	str	r2, [r3, #48]	; 0x30
 8001306:	2200      	movs	r2, #0
 8001308:	609a      	str	r2, [r3, #8]
 800130a:	9200      	str	r2, [sp, #0]
 800130c:	9201      	str	r2, [sp, #4]
 800130e:	681a      	ldr	r2, [r3, #0]
 8001310:	f442 3280 	orr.w	r2, r2, #65536	; 0x10000
 8001314:	601a      	str	r2, [r3, #0]
 8001316:	681a      	ldr	r2, [r3, #0]
 8001318:	f402 3200 	and.w	r2, r2, #131072	; 0x20000
 800131c:	9201      	str	r2, [sp, #4]
 800131e:	9a00      	ldr	r2, [sp, #0]
 8001320:	3201      	adds	r2, #1
 8001322:	9200      	str	r2, [sp, #0]
 8001324:	9a01      	ldr	r2, [sp, #4]
 8001326:	b91a      	cbnz	r2, 8001330 <SystemInit+0x78>
 8001328:	9a00      	ldr	r2, [sp, #0]
 800132a:	f5b2 4fa0 	cmp.w	r2, #20480	; 0x5000
 800132e:	d1f2      	bne.n	8001316 <SystemInit+0x5e>
 8001330:	681a      	ldr	r2, [r3, #0]
 8001332:	f412 3200 	ands.w	r2, r2, #131072	; 0x20000
 8001336:	bf18      	it	ne
 8001338:	2201      	movne	r2, #1
 800133a:	9201      	str	r2, [sp, #4]
 800133c:	9a01      	ldr	r2, [sp, #4]
 800133e:	2a01      	cmp	r2, #1
 8001340:	d005      	beq.n	800134e <SystemInit+0x96>
 8001342:	4b17      	ldr	r3, [pc, #92]	; (80013a0 <SystemInit+0xe8>)
 8001344:	f04f 6200 	mov.w	r2, #134217728	; 0x8000000
 8001348:	609a      	str	r2, [r3, #8]
 800134a:	b002      	add	sp, #8
 800134c:	4770      	bx	lr
 800134e:	4a18      	ldr	r2, [pc, #96]	; (80013b0 <SystemInit+0xf8>)
 8001350:	2112      	movs	r1, #18
 8001352:	6011      	str	r1, [r2, #0]
 8001354:	685a      	ldr	r2, [r3, #4]
 8001356:	605a      	str	r2, [r3, #4]
 8001358:	685a      	ldr	r2, [r3, #4]
 800135a:	605a      	str	r2, [r3, #4]
 800135c:	685a      	ldr	r2, [r3, #4]
 800135e:	f442 6280 	orr.w	r2, r2, #1024	; 0x400
 8001362:	605a      	str	r2, [r3, #4]
 8001364:	685a      	ldr	r2, [r3, #4]
 8001366:	f422 127c 	bic.w	r2, r2, #4128768	; 0x3f0000
 800136a:	605a      	str	r2, [r3, #4]
 800136c:	685a      	ldr	r2, [r3, #4]
 800136e:	f442 12e8 	orr.w	r2, r2, #1900544	; 0x1d0000
 8001372:	605a      	str	r2, [r3, #4]
 8001374:	681a      	ldr	r2, [r3, #0]
 8001376:	f042 7280 	orr.w	r2, r2, #16777216	; 0x1000000
 800137a:	601a      	str	r2, [r3, #0]
 800137c:	6819      	ldr	r1, [r3, #0]
 800137e:	4a09      	ldr	r2, [pc, #36]	; (80013a4 <SystemInit+0xec>)
 8001380:	0189      	lsls	r1, r1, #6
 8001382:	d5fb      	bpl.n	800137c <SystemInit+0xc4>
 8001384:	6851      	ldr	r1, [r2, #4]
 8001386:	f021 0103 	bic.w	r1, r1, #3
 800138a:	6051      	str	r1, [r2, #4]
 800138c:	6851      	ldr	r1, [r2, #4]
 800138e:	f041 0102 	orr.w	r1, r1, #2
 8001392:	6051      	str	r1, [r2, #4]
 8001394:	685a      	ldr	r2, [r3, #4]
 8001396:	f002 020c 	and.w	r2, r2, #12
 800139a:	2a08      	cmp	r2, #8
 800139c:	d1fa      	bne.n	8001394 <SystemInit+0xdc>
 800139e:	e7d0      	b.n	8001342 <SystemInit+0x8a>
 80013a0:	e000ed00 	.word	0xe000ed00
 80013a4:	40021000 	.word	0x40021000
 80013a8:	f87fc00c 	.word	0xf87fc00c
 80013ac:	ff00fccc 	.word	0xff00fccc
 80013b0:	40022000 	.word	0x40022000

080013b4 <sys_tick_init>:
 80013b4:	4b05      	ldr	r3, [pc, #20]	; (80013cc <sys_tick_init+0x18>)
 80013b6:	4a06      	ldr	r2, [pc, #24]	; (80013d0 <sys_tick_init+0x1c>)
 80013b8:	605a      	str	r2, [r3, #4]
 80013ba:	4a06      	ldr	r2, [pc, #24]	; (80013d4 <sys_tick_init+0x20>)
 80013bc:	21f0      	movs	r1, #240	; 0xf0
 80013be:	f882 1023 	strb.w	r1, [r2, #35]	; 0x23
 80013c2:	2200      	movs	r2, #0
 80013c4:	609a      	str	r2, [r3, #8]
 80013c6:	2207      	movs	r2, #7
 80013c8:	601a      	str	r2, [r3, #0]
 80013ca:	4770      	bx	lr
 80013cc:	e000e010 	.word	0xe000e010
 80013d0:	00029040 	.word	0x00029040
 80013d4:	e000ed00 	.word	0xe000ed00

080013d8 <sleep>:
 80013d8:	bf30      	wfi
 80013da:	4770      	bx	lr

080013dc <sytem_clock_init>:
 80013dc:	f7ff bf6c 	b.w	80012b8 <SystemInit>

080013e0 <pwm_set>:
 80013e0:	e92d 41f0 	stmdb	sp!, {r4, r5, r6, r7, r8, lr}
 80013e4:	b086      	sub	sp, #24
 80013e6:	2370      	movs	r3, #112	; 0x70
 80013e8:	9301      	str	r3, [sp, #4]
 80013ea:	2301      	movs	r3, #1
 80013ec:	f8ad 3008 	strh.w	r3, [sp, #8]
 80013f0:	2304      	movs	r3, #4
 80013f2:	f8ad 300a 	strh.w	r3, [sp, #10]
 80013f6:	f8df 8064 	ldr.w	r8, [pc, #100]	; 800145c <pwm_set+0x7c>
 80013fa:	4c17      	ldr	r4, [pc, #92]	; (8001458 <pwm_set+0x78>)
 80013fc:	2302      	movs	r3, #2
 80013fe:	f8ad 3010 	strh.w	r3, [sp, #16]
 8001402:	2300      	movs	r3, #0
 8001404:	f8ad 3012 	strh.w	r3, [sp, #18]
 8001408:	f8ad 3016 	strh.w	r3, [sp, #22]
 800140c:	f242 7710 	movw	r7, #10000	; 0x2710
 8001410:	f8d8 3000 	ldr.w	r3, [r8]
 8001414:	fbb3 f3f7 	udiv	r3, r3, r7
 8001418:	3b02      	subs	r3, #2
 800141a:	f44f 7280 	mov.w	r2, #256	; 0x100
 800141e:	460e      	mov	r6, r1
 8001420:	2564      	movs	r5, #100	; 0x64
 8001422:	a901      	add	r1, sp, #4
 8001424:	4358      	muls	r0, r3
 8001426:	fbb0 f3f5 	udiv	r3, r0, r5
 800142a:	4620      	mov	r0, r4
 800142c:	f8ad 2014 	strh.w	r2, [sp, #20]
 8001430:	9303      	str	r3, [sp, #12]
 8001432:	f7ff fc69 	bl	8000d08 <TIM_OC1Init>
 8001436:	f8d8 1000 	ldr.w	r1, [r8]
 800143a:	fbb1 f1f7 	udiv	r1, r1, r7
 800143e:	3902      	subs	r1, #2
 8001440:	4371      	muls	r1, r6
 8001442:	4620      	mov	r0, r4
 8001444:	fbb1 f1f5 	udiv	r1, r1, r5
 8001448:	9103      	str	r1, [sp, #12]
 800144a:	a901      	add	r1, sp, #4
 800144c:	f7ff fca2 	bl	8000d94 <TIM_OC2Init>
 8001450:	b006      	add	sp, #24
 8001452:	e8bd 81f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, pc}
 8001456:	bf00      	nop
 8001458:	40012c00 	.word	0x40012c00
 800145c:	20000030 	.word	0x20000030

08001460 <pwm_init>:
 8001460:	b530      	push	{r4, r5, lr}
 8001462:	f44f 6000 	mov.w	r0, #2048	; 0x800
 8001466:	b087      	sub	sp, #28
 8001468:	2101      	movs	r1, #1
 800146a:	f7ff fbd3 	bl	8000c14 <RCC_APB2PeriphClockCmd>
 800146e:	f44f 2080 	mov.w	r0, #262144	; 0x40000
 8001472:	2101      	movs	r1, #1
 8001474:	f7ff fbc0 	bl	8000bf8 <RCC_AHBPeriphClockCmd>
 8001478:	4c1d      	ldr	r4, [pc, #116]	; (80014f0 <pwm_init+0x90>)
 800147a:	4d1e      	ldr	r5, [pc, #120]	; (80014f4 <pwm_init+0x94>)
 800147c:	f44f 43c0 	mov.w	r3, #24576	; 0x6000
 8001480:	9301      	str	r3, [sp, #4]
 8001482:	2302      	movs	r3, #2
 8001484:	f88d 3008 	strb.w	r3, [sp, #8]
 8001488:	4620      	mov	r0, r4
 800148a:	2303      	movs	r3, #3
 800148c:	a901      	add	r1, sp, #4
 800148e:	f88d 3009 	strb.w	r3, [sp, #9]
 8001492:	f000 f8f6 	bl	8001682 <GPIO_Init>
 8001496:	4620      	mov	r0, r4
 8001498:	210d      	movs	r1, #13
 800149a:	2206      	movs	r2, #6
 800149c:	f000 f93b 	bl	8001716 <GPIO_PinAFConfig>
 80014a0:	4620      	mov	r0, r4
 80014a2:	210e      	movs	r1, #14
 80014a4:	2206      	movs	r2, #6
 80014a6:	f000 f936 	bl	8001716 <GPIO_PinAFConfig>
 80014aa:	4b13      	ldr	r3, [pc, #76]	; (80014f8 <pwm_init+0x98>)
 80014ac:	2400      	movs	r4, #0
 80014ae:	f242 7210 	movw	r2, #10000	; 0x2710
 80014b2:	4628      	mov	r0, r5
 80014b4:	a903      	add	r1, sp, #12
 80014b6:	681b      	ldr	r3, [r3, #0]
 80014b8:	fbb3 f3f2 	udiv	r3, r3, r2
 80014bc:	3b01      	subs	r3, #1
 80014be:	9304      	str	r3, [sp, #16]
 80014c0:	f8ad 400c 	strh.w	r4, [sp, #12]
 80014c4:	f8ad 400e 	strh.w	r4, [sp, #14]
 80014c8:	f8ad 4014 	strh.w	r4, [sp, #20]
 80014cc:	f8ad 4016 	strh.w	r4, [sp, #22]
 80014d0:	f7ff fbbc 	bl	8000c4c <TIM_TimeBaseInit>
 80014d4:	4620      	mov	r0, r4
 80014d6:	4621      	mov	r1, r4
 80014d8:	f7ff ff82 	bl	80013e0 <pwm_set>
 80014dc:	4628      	mov	r0, r5
 80014de:	2101      	movs	r1, #1
 80014e0:	f7ff fc04 	bl	8000cec <TIM_Cmd>
 80014e4:	4628      	mov	r0, r5
 80014e6:	2101      	movs	r1, #1
 80014e8:	f7ff fc92 	bl	8000e10 <TIM_CtrlPWMOutputs>
 80014ec:	b007      	add	sp, #28
 80014ee:	bd30      	pop	{r4, r5, pc}
 80014f0:	48000400 	.word	0x48000400
 80014f4:	40012c00 	.word	0x40012c00
 80014f8:	20000030 	.word	0x20000030

080014fc <drv8834_run>:
 80014fc:	1e03      	subs	r3, r0, #0
 80014fe:	4819      	ldr	r0, [pc, #100]	; (8001564 <drv8834_run+0x68>)
 8001500:	dd09      	ble.n	8001516 <drv8834_run+0x1a>
 8001502:	6982      	ldr	r2, [r0, #24]
 8001504:	f042 0208 	orr.w	r2, r2, #8
 8001508:	6182      	str	r2, [r0, #24]
 800150a:	f04f 4290 	mov.w	r2, #1207959552	; 0x48000000
 800150e:	f44f 4000 	mov.w	r0, #32768	; 0x8000
 8001512:	6190      	str	r0, [r2, #24]
 8001514:	e00b      	b.n	800152e <drv8834_run+0x32>
 8001516:	8d02      	ldrh	r2, [r0, #40]	; 0x28
 8001518:	b292      	uxth	r2, r2
 800151a:	f042 0208 	orr.w	r2, r2, #8
 800151e:	8502      	strh	r2, [r0, #40]	; 0x28
 8001520:	f04f 4290 	mov.w	r2, #1207959552	; 0x48000000
 8001524:	f44f 4000 	mov.w	r0, #32768	; 0x8000
 8001528:	425b      	negs	r3, r3
 800152a:	8510      	strh	r0, [r2, #40]	; 0x28
 800152c:	b21b      	sxth	r3, r3
 800152e:	480d      	ldr	r0, [pc, #52]	; (8001564 <drv8834_run+0x68>)
 8001530:	2900      	cmp	r1, #0
 8001532:	bfcd      	iteet	gt
 8001534:	8d02      	ldrhgt	r2, [r0, #40]	; 0x28
 8001536:	6982      	ldrle	r2, [r0, #24]
 8001538:	4249      	negle	r1, r1
 800153a:	b292      	uxthgt	r2, r2
 800153c:	bfd5      	itete	le
 800153e:	b209      	sxthle	r1, r1
 8001540:	f042 0220 	orrgt.w	r2, r2, #32
 8001544:	f042 0220 	orrle.w	r2, r2, #32
 8001548:	8502      	strhgt	r2, [r0, #40]	; 0x28
 800154a:	bfd8      	it	le
 800154c:	6182      	strle	r2, [r0, #24]
 800154e:	2964      	cmp	r1, #100	; 0x64
 8001550:	bfa8      	it	ge
 8001552:	2164      	movge	r1, #100	; 0x64
 8001554:	2b64      	cmp	r3, #100	; 0x64
 8001556:	bfa8      	it	ge
 8001558:	2364      	movge	r3, #100	; 0x64
 800155a:	4608      	mov	r0, r1
 800155c:	4619      	mov	r1, r3
 800155e:	f7ff bf3f 	b.w	80013e0 <pwm_set>
 8001562:	bf00      	nop
 8001564:	48000400 	.word	0x48000400

08001568 <drv8834_init>:
 8001568:	b5f7      	push	{r0, r1, r2, r4, r5, r6, r7, lr}
 800156a:	4d1f      	ldr	r5, [pc, #124]	; (80015e8 <drv8834_init+0x80>)
 800156c:	2400      	movs	r4, #0
 800156e:	2603      	movs	r6, #3
 8001570:	2338      	movs	r3, #56	; 0x38
 8001572:	2701      	movs	r7, #1
 8001574:	4628      	mov	r0, r5
 8001576:	4669      	mov	r1, sp
 8001578:	9300      	str	r3, [sp, #0]
 800157a:	f88d 7004 	strb.w	r7, [sp, #4]
 800157e:	f88d 4006 	strb.w	r4, [sp, #6]
 8001582:	f88d 6005 	strb.w	r6, [sp, #5]
 8001586:	f88d 4007 	strb.w	r4, [sp, #7]
 800158a:	f000 f87a 	bl	8001682 <GPIO_Init>
 800158e:	2308      	movs	r3, #8
 8001590:	9300      	str	r3, [sp, #0]
 8001592:	4628      	mov	r0, r5
 8001594:	2302      	movs	r3, #2
 8001596:	4669      	mov	r1, sp
 8001598:	f88d 3004 	strb.w	r3, [sp, #4]
 800159c:	f88d 4006 	strb.w	r4, [sp, #6]
 80015a0:	f88d 6005 	strb.w	r6, [sp, #5]
 80015a4:	f88d 4007 	strb.w	r4, [sp, #7]
 80015a8:	f000 f86b 	bl	8001682 <GPIO_Init>
 80015ac:	220f      	movs	r2, #15
 80015ae:	4628      	mov	r0, r5
 80015b0:	4631      	mov	r1, r6
 80015b2:	f000 f8b0 	bl	8001716 <GPIO_PinAFConfig>
 80015b6:	f44f 4300 	mov.w	r3, #32768	; 0x8000
 80015ba:	4669      	mov	r1, sp
 80015bc:	f04f 4090 	mov.w	r0, #1207959552	; 0x48000000
 80015c0:	9300      	str	r3, [sp, #0]
 80015c2:	f88d 7004 	strb.w	r7, [sp, #4]
 80015c6:	f88d 4006 	strb.w	r4, [sp, #6]
 80015ca:	f88d 6005 	strb.w	r6, [sp, #5]
 80015ce:	f88d 4007 	strb.w	r4, [sp, #7]
 80015d2:	f000 f856 	bl	8001682 <GPIO_Init>
 80015d6:	2310      	movs	r3, #16
 80015d8:	852b      	strh	r3, [r5, #40]	; 0x28
 80015da:	4620      	mov	r0, r4
 80015dc:	4621      	mov	r1, r4
 80015de:	f7ff ff8d 	bl	80014fc <drv8834_run>
 80015e2:	b003      	add	sp, #12
 80015e4:	bdf0      	pop	{r4, r5, r6, r7, pc}
 80015e6:	bf00      	nop
 80015e8:	48000400 	.word	0x48000400

080015ec <NVIC_Init>:
 80015ec:	b510      	push	{r4, lr}
 80015ee:	bf00      	nop
 80015f0:	bf00      	nop
 80015f2:	bf00      	nop
 80015f4:	78c2      	ldrb	r2, [r0, #3]
 80015f6:	7803      	ldrb	r3, [r0, #0]
 80015f8:	b312      	cbz	r2, 8001640 <NVIC_Init+0x54>
 80015fa:	4a17      	ldr	r2, [pc, #92]	; (8001658 <NVIC_Init+0x6c>)
 80015fc:	68d1      	ldr	r1, [r2, #12]
 80015fe:	7842      	ldrb	r2, [r0, #1]
 8001600:	43c9      	mvns	r1, r1
 8001602:	f3c1 2102 	ubfx	r1, r1, #8, #3
 8001606:	f1c1 0404 	rsb	r4, r1, #4
 800160a:	b2e4      	uxtb	r4, r4
 800160c:	40a2      	lsls	r2, r4
 800160e:	b2d4      	uxtb	r4, r2
 8001610:	220f      	movs	r2, #15
 8001612:	410a      	asrs	r2, r1
 8001614:	7881      	ldrb	r1, [r0, #2]
 8001616:	400a      	ands	r2, r1
 8001618:	4322      	orrs	r2, r4
 800161a:	f103 4360 	add.w	r3, r3, #3758096384	; 0xe0000000
 800161e:	f503 4361 	add.w	r3, r3, #57600	; 0xe100
 8001622:	0112      	lsls	r2, r2, #4
 8001624:	b2d2      	uxtb	r2, r2
 8001626:	f883 2300 	strb.w	r2, [r3, #768]	; 0x300
 800162a:	7803      	ldrb	r3, [r0, #0]
 800162c:	2201      	movs	r2, #1
 800162e:	0959      	lsrs	r1, r3, #5
 8001630:	f003 031f 	and.w	r3, r3, #31
 8001634:	fa02 f303 	lsl.w	r3, r2, r3
 8001638:	4a08      	ldr	r2, [pc, #32]	; (800165c <NVIC_Init+0x70>)
 800163a:	f842 3021 	str.w	r3, [r2, r1, lsl #2]
 800163e:	bd10      	pop	{r4, pc}
 8001640:	095a      	lsrs	r2, r3, #5
 8001642:	2101      	movs	r1, #1
 8001644:	f003 031f 	and.w	r3, r3, #31
 8001648:	4099      	lsls	r1, r3
 800164a:	f102 0320 	add.w	r3, r2, #32
 800164e:	4a03      	ldr	r2, [pc, #12]	; (800165c <NVIC_Init+0x70>)
 8001650:	f842 1023 	str.w	r1, [r2, r3, lsl #2]
 8001654:	bd10      	pop	{r4, pc}
 8001656:	bf00      	nop
 8001658:	e000ed00 	.word	0xe000ed00
 800165c:	e000e100 	.word	0xe000e100

08001660 <lib_low_level_init>:
 8001660:	b508      	push	{r3, lr}
 8001662:	f7ff febb 	bl	80013dc <sytem_clock_init>
 8001666:	f000 f86b 	bl	8001740 <gpio_init>
 800166a:	f7ff fd35 	bl	80010d8 <uart_init>
 800166e:	f7ff fbdf 	bl	8000e30 <timer_init>
 8001672:	f7ff fef5 	bl	8001460 <pwm_init>
 8001676:	f7ff ff77 	bl	8001568 <drv8834_init>
 800167a:	e8bd 4008 	ldmia.w	sp!, {r3, lr}
 800167e:	f7ff bdf9 	b.w	8001274 <i2c_0_init>

08001682 <GPIO_Init>:
 8001682:	b5f0      	push	{r4, r5, r6, r7, lr}
 8001684:	bf00      	nop
 8001686:	bf00      	nop
 8001688:	bf00      	nop
 800168a:	bf00      	nop
 800168c:	2300      	movs	r3, #0
 800168e:	680e      	ldr	r6, [r1, #0]
 8001690:	461c      	mov	r4, r3
 8001692:	2501      	movs	r5, #1
 8001694:	40a5      	lsls	r5, r4
 8001696:	ea05 0e06 	and.w	lr, r5, r6
 800169a:	45ae      	cmp	lr, r5
 800169c:	d12d      	bne.n	80016fa <GPIO_Init+0x78>
 800169e:	790f      	ldrb	r7, [r1, #4]
 80016a0:	1e7a      	subs	r2, r7, #1
 80016a2:	2a01      	cmp	r2, #1
 80016a4:	d817      	bhi.n	80016d6 <GPIO_Init+0x54>
 80016a6:	bf00      	nop
 80016a8:	2203      	movs	r2, #3
 80016aa:	6885      	ldr	r5, [r0, #8]
 80016ac:	409a      	lsls	r2, r3
 80016ae:	ea25 0202 	bic.w	r2, r5, r2
 80016b2:	6082      	str	r2, [r0, #8]
 80016b4:	794d      	ldrb	r5, [r1, #5]
 80016b6:	6882      	ldr	r2, [r0, #8]
 80016b8:	409d      	lsls	r5, r3
 80016ba:	4315      	orrs	r5, r2
 80016bc:	6085      	str	r5, [r0, #8]
 80016be:	bf00      	nop
 80016c0:	8882      	ldrh	r2, [r0, #4]
 80016c2:	b292      	uxth	r2, r2
 80016c4:	ea22 020e 	bic.w	r2, r2, lr
 80016c8:	8082      	strh	r2, [r0, #4]
 80016ca:	798a      	ldrb	r2, [r1, #6]
 80016cc:	8885      	ldrh	r5, [r0, #4]
 80016ce:	40a2      	lsls	r2, r4
 80016d0:	432a      	orrs	r2, r5
 80016d2:	b292      	uxth	r2, r2
 80016d4:	8082      	strh	r2, [r0, #4]
 80016d6:	2203      	movs	r2, #3
 80016d8:	6805      	ldr	r5, [r0, #0]
 80016da:	409a      	lsls	r2, r3
 80016dc:	43d2      	mvns	r2, r2
 80016de:	4015      	ands	r5, r2
 80016e0:	6005      	str	r5, [r0, #0]
 80016e2:	6805      	ldr	r5, [r0, #0]
 80016e4:	409f      	lsls	r7, r3
 80016e6:	432f      	orrs	r7, r5
 80016e8:	6007      	str	r7, [r0, #0]
 80016ea:	68c7      	ldr	r7, [r0, #12]
 80016ec:	4017      	ands	r7, r2
 80016ee:	79ca      	ldrb	r2, [r1, #7]
 80016f0:	fa02 f503 	lsl.w	r5, r2, r3
 80016f4:	ea47 0205 	orr.w	r2, r7, r5
 80016f8:	60c2      	str	r2, [r0, #12]
 80016fa:	3401      	adds	r4, #1
 80016fc:	2c10      	cmp	r4, #16
 80016fe:	f103 0302 	add.w	r3, r3, #2
 8001702:	d1c6      	bne.n	8001692 <GPIO_Init+0x10>
 8001704:	bdf0      	pop	{r4, r5, r6, r7, pc}

08001706 <GPIO_SetBits>:
 8001706:	bf00      	nop
 8001708:	bf00      	nop
 800170a:	6181      	str	r1, [r0, #24]
 800170c:	4770      	bx	lr

0800170e <GPIO_ResetBits>:
 800170e:	bf00      	nop
 8001710:	bf00      	nop
 8001712:	8501      	strh	r1, [r0, #40]	; 0x28
 8001714:	4770      	bx	lr

08001716 <GPIO_PinAFConfig>:
 8001716:	b510      	push	{r4, lr}
 8001718:	bf00      	nop
 800171a:	bf00      	nop
 800171c:	bf00      	nop
 800171e:	f001 0307 	and.w	r3, r1, #7
 8001722:	08c9      	lsrs	r1, r1, #3
 8001724:	eb00 0081 	add.w	r0, r0, r1, lsl #2
 8001728:	009b      	lsls	r3, r3, #2
 800172a:	6a04      	ldr	r4, [r0, #32]
 800172c:	210f      	movs	r1, #15
 800172e:	4099      	lsls	r1, r3
 8001730:	ea24 0101 	bic.w	r1, r4, r1
 8001734:	6201      	str	r1, [r0, #32]
 8001736:	6a01      	ldr	r1, [r0, #32]
 8001738:	409a      	lsls	r2, r3
 800173a:	430a      	orrs	r2, r1
 800173c:	6202      	str	r2, [r0, #32]
 800173e:	bd10      	pop	{r4, pc}

08001740 <gpio_init>:
 8001740:	b507      	push	{r0, r1, r2, lr}
 8001742:	f44f 3000 	mov.w	r0, #131072	; 0x20000
 8001746:	2101      	movs	r1, #1
 8001748:	f7ff fa56 	bl	8000bf8 <RCC_AHBPeriphClockCmd>
 800174c:	f44f 2080 	mov.w	r0, #262144	; 0x40000
 8001750:	2101      	movs	r1, #1
 8001752:	f7ff fa51 	bl	8000bf8 <RCC_AHBPeriphClockCmd>
 8001756:	f44f 2000 	mov.w	r0, #524288	; 0x80000
 800175a:	2101      	movs	r1, #1
 800175c:	f7ff fa4c 	bl	8000bf8 <RCC_AHBPeriphClockCmd>
 8001760:	f44f 7380 	mov.w	r3, #256	; 0x100
 8001764:	9300      	str	r3, [sp, #0]
 8001766:	2301      	movs	r3, #1
 8001768:	f88d 3004 	strb.w	r3, [sp, #4]
 800176c:	2203      	movs	r2, #3
 800176e:	2300      	movs	r3, #0
 8001770:	f04f 4090 	mov.w	r0, #1207959552	; 0x48000000
 8001774:	4669      	mov	r1, sp
 8001776:	f88d 3006 	strb.w	r3, [sp, #6]
 800177a:	f88d 2005 	strb.w	r2, [sp, #5]
 800177e:	f88d 3007 	strb.w	r3, [sp, #7]
 8001782:	f7ff ff7e 	bl	8001682 <GPIO_Init>
 8001786:	b003      	add	sp, #12
 8001788:	f85d fb04 	ldr.w	pc, [sp], #4

0800178c <led_on>:
 800178c:	05c3      	lsls	r3, r0, #23
 800178e:	bf42      	ittt	mi
 8001790:	f04f 4390 	movmi.w	r3, #1207959552	; 0x48000000
 8001794:	f44f 7280 	movmi.w	r2, #256	; 0x100
 8001798:	619a      	strmi	r2, [r3, #24]
 800179a:	4770      	bx	lr

0800179c <led_off>:
 800179c:	05c3      	lsls	r3, r0, #23
 800179e:	bf42      	ittt	mi
 80017a0:	f04f 4390 	movmi.w	r3, #1207959552	; 0x48000000
 80017a4:	f44f 7280 	movmi.w	r2, #256	; 0x100
 80017a8:	851a      	strhmi	r2, [r3, #40]	; 0x28
 80017aa:	4770      	bx	lr

080017ac <Default_Handler>:
 80017ac:	4668      	mov	r0, sp
 80017ae:	f020 0107 	bic.w	r1, r0, #7
 80017b2:	468d      	mov	sp, r1
 80017b4:	bf00      	nop
 80017b6:	e7fd      	b.n	80017b4 <Default_Handler+0x8>

080017b8 <HardFault_Handler>:
 80017b8:	f44f 7080 	mov.w	r0, #256	; 0x100
 80017bc:	f7ff ffe6 	bl	800178c <led_on>
 80017c0:	4b06      	ldr	r3, [pc, #24]	; (80017dc <HardFault_Handler+0x24>)
 80017c2:	3b01      	subs	r3, #1
 80017c4:	d001      	beq.n	80017ca <HardFault_Handler+0x12>
 80017c6:	bf00      	nop
 80017c8:	e7fb      	b.n	80017c2 <HardFault_Handler+0xa>
 80017ca:	f44f 7080 	mov.w	r0, #256	; 0x100
 80017ce:	f7ff ffe5 	bl	800179c <led_off>
 80017d2:	4b02      	ldr	r3, [pc, #8]	; (80017dc <HardFault_Handler+0x24>)
 80017d4:	3b01      	subs	r3, #1
 80017d6:	d0ef      	beq.n	80017b8 <HardFault_Handler>
 80017d8:	bf00      	nop
 80017da:	e7fb      	b.n	80017d4 <HardFault_Handler+0x1c>
 80017dc:	00989681 	.word	0x00989681

080017e0 <_reset_init>:
 80017e0:	490e      	ldr	r1, [pc, #56]	; (800181c <_reset_init+0x3c>)
 80017e2:	4b0f      	ldr	r3, [pc, #60]	; (8001820 <_reset_init+0x40>)
 80017e4:	1a5b      	subs	r3, r3, r1
 80017e6:	109b      	asrs	r3, r3, #2
 80017e8:	2200      	movs	r2, #0
 80017ea:	429a      	cmp	r2, r3
 80017ec:	d006      	beq.n	80017fc <_reset_init+0x1c>
 80017ee:	480d      	ldr	r0, [pc, #52]	; (8001824 <_reset_init+0x44>)
 80017f0:	f850 0022 	ldr.w	r0, [r0, r2, lsl #2]
 80017f4:	f841 0022 	str.w	r0, [r1, r2, lsl #2]
 80017f8:	3201      	adds	r2, #1
 80017fa:	e7f6      	b.n	80017ea <_reset_init+0xa>
 80017fc:	4a0a      	ldr	r2, [pc, #40]	; (8001828 <_reset_init+0x48>)
 80017fe:	f8d2 3088 	ldr.w	r3, [r2, #136]	; 0x88
 8001802:	f443 0370 	orr.w	r3, r3, #15728640	; 0xf00000
 8001806:	f8c2 3088 	str.w	r3, [r2, #136]	; 0x88
 800180a:	f502 720c 	add.w	r2, r2, #560	; 0x230
 800180e:	6853      	ldr	r3, [r2, #4]
 8001810:	f023 4340 	bic.w	r3, r3, #3221225472	; 0xc0000000
 8001814:	6053      	str	r3, [r2, #4]
 8001816:	f7ff b863 	b.w	80008e0 <main>
 800181a:	bf00      	nop
 800181c:	20000000 	.word	0x20000000
 8001820:	20000034 	.word	0x20000034
 8001824:	08001938 	.word	0x08001938
 8001828:	e000ed00 	.word	0xe000ed00

0800182c <_init>:
 800182c:	e1a0c00d 	mov	ip, sp
 8001830:	e92ddff8 	push	{r3, r4, r5, r6, r7, r8, r9, sl, fp, ip, lr, pc}
 8001834:	e24cb004 	sub	fp, ip, #4
 8001838:	e24bd028 	sub	sp, fp, #40	; 0x28
 800183c:	e89d6ff0 	ldm	sp, {r4, r5, r6, r7, r8, r9, sl, fp, sp, lr}
 8001840:	e12fff1e 	bx	lr

08001844 <_fini>:
 8001844:	e1a0c00d 	mov	ip, sp
 8001848:	e92ddff8 	push	{r3, r4, r5, r6, r7, r8, r9, sl, fp, ip, lr, pc}
 800184c:	e24cb004 	sub	fp, ip, #4
 8001850:	e24bd028 	sub	sp, fp, #40	; 0x28
 8001854:	e89d6ff0 	ldm	sp, {r4, r5, r6, r7, r8, r9, sl, fp, sp, lr}
 8001858:	e12fff1e 	bx	lr
 800185c:	69647473 	.word	0x69647473
 8001860:	6e69206f 	.word	0x6e69206f
 8001864:	64207469 	.word	0x64207469
 8001868:	0a656e6f 	.word	0x0a656e6f
 800186c:	00          	.byte	0x00
 800186d:	63          	.byte	0x63
 800186e:	6168      	.short	0x6168
 8001870:	253e2072 	.word	0x253e2072
 8001874:	000a3c63 	.word	0x000a3c63
 8001878:	6c696863 	.word	0x6c696863
 800187c:	20312064 	.word	0x20312064
 8001880:	65726874 	.word	0x65726874
 8001884:	31206461 	.word	0x31206461
 8001888:	31313131 	.word	0x31313131
 800188c:	000a3131 	.word	0x000a3131
 8001890:	6c696863 	.word	0x6c696863
 8001894:	20322064 	.word	0x20322064
 8001898:	65726874 	.word	0x65726874
 800189c:	32206461 	.word	0x32206461
 80018a0:	32323232 	.word	0x32323232
 80018a4:	000a3232 	.word	0x000a3232
 80018a8:	6c65770a 	.word	0x6c65770a
 80018ac:	656d6f63 	.word	0x656d6f63
 80018b0:	206f7420 	.word	0x206f7420
 80018b4:	757a7553 	.word	0x757a7553
 80018b8:	534f6168 	.word	0x534f6168
 80018bc:	5e5f5e20 	.word	0x5e5f5e20
 80018c0:	322e3220 	.word	0x322e3220
 80018c4:	420a302e 	.word	0x420a302e
 80018c8:	444c4955 	.word	0x444c4955
 80018cc:	6c754a20 	.word	0x6c754a20
 80018d0:	20383220 	.word	0x20383220
 80018d4:	36313032 	.word	0x36313032
 80018d8:	3a393120 	.word	0x3a393120
 80018dc:	343a3434 	.word	0x343a3434
 80018e0:	0a37      	.short	0x0a37
 80018e2:	00          	.byte	0x00
 80018e3:	62          	.byte	0x62
 80018e4:	69746f6f 	.word	0x69746f6f
 80018e8:	6620676e 	.word	0x6620676e
 80018ec:	206d6f72 	.word	0x206d6f72
 80018f0:	000a7525 	.word	0x000a7525
 80018f4:	206d6172 	.word	0x206d6172
 80018f8:	72617473 	.word	0x72617473
 80018fc:	75252074 	.word	0x75252074
 8001900:	72000a20 	.word	0x72000a20
 8001904:	73206d61 	.word	0x73206d61
 8001908:	20657a69 	.word	0x20657a69
 800190c:	0a207525 	.word	0x0a207525
 8001910:	6d617200 	.word	0x6d617200
 8001914:	65726620 	.word	0x65726620
 8001918:	75252065 	.word	0x75252065
 800191c:	68000a20 	.word	0x68000a20
 8001920:	20706165 	.word	0x20706165
 8001924:	72617473 	.word	0x72617473
 8001928:	75252074 	.word	0x75252074
 800192c:	0a000a20 	.word	0x0a000a20
 8001930:	0000000a 	.word	0x0000000a

08001934 <__EH_FRAME_BEGIN__>:
 8001934:	00000000                                ....
