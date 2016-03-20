
bin/main.elf:     file format elf32-littlearm


Disassembly of section .text:

08000188 <thread_ending>:
 8000188:	b672      	cpsid	i
 800018a:	4b05      	ldr	r3, [pc, #20]	; (80001a0 <thread_ending+0x18>)
 800018c:	4a05      	ldr	r2, [pc, #20]	; (80001a4 <thread_ending+0x1c>)
 800018e:	681b      	ldr	r3, [r3, #0]
 8000190:	210c      	movs	r1, #12
 8000192:	fb01 2303 	mla	r3, r1, r3, r2
 8000196:	2200      	movs	r2, #0
 8000198:	605a      	str	r2, [r3, #4]
 800019a:	b662      	cpsie	i
 800019c:	bf00      	nop
 800019e:	e7fd      	b.n	800019c <thread_ending+0x14>
 80001a0:	20000094 	.word	0x20000094
 80001a4:	20000034 	.word	0x20000034

080001a8 <null_thread>:
 80001a8:	b508      	push	{r3, lr}
 80001aa:	f001 fbeb 	bl	8001984 <sleep>
 80001ae:	e7fc      	b.n	80001aa <null_thread+0x2>

080001b0 <scheduler>:
 80001b0:	b570      	push	{r4, r5, r6, lr}
 80001b2:	2200      	movs	r2, #0
 80001b4:	4611      	mov	r1, r2
 80001b6:	4b15      	ldr	r3, [pc, #84]	; (800020c <scheduler+0x5c>)
 80001b8:	200c      	movs	r0, #12
 80001ba:	fb00 f501 	mul.w	r5, r0, r1
 80001be:	195e      	adds	r6, r3, r5
 80001c0:	6874      	ldr	r4, [r6, #4]
 80001c2:	f014 0f02 	tst.w	r4, #2
 80001c6:	461c      	mov	r4, r3
 80001c8:	d10a      	bne.n	80001e0 <scheduler+0x30>
 80001ca:	6876      	ldr	r6, [r6, #4]
 80001cc:	07f6      	lsls	r6, r6, #31
 80001ce:	d507      	bpl.n	80001e0 <scheduler+0x30>
 80001d0:	4350      	muls	r0, r2
 80001d2:	5b5d      	ldrh	r5, [r3, r5]
 80001d4:	5a18      	ldrh	r0, [r3, r0]
 80001d6:	b2ad      	uxth	r5, r5
 80001d8:	b280      	uxth	r0, r0
 80001da:	4285      	cmp	r5, r0
 80001dc:	bf38      	it	cc
 80001de:	460a      	movcc	r2, r1
 80001e0:	200c      	movs	r0, #12
 80001e2:	4348      	muls	r0, r1
 80001e4:	5a1d      	ldrh	r5, [r3, r0]
 80001e6:	b2ad      	uxth	r5, r5
 80001e8:	b125      	cbz	r5, 80001f4 <scheduler+0x44>
 80001ea:	5a1d      	ldrh	r5, [r3, r0]
 80001ec:	b2ad      	uxth	r5, r5
 80001ee:	3d01      	subs	r5, #1
 80001f0:	b2ad      	uxth	r5, r5
 80001f2:	521d      	strh	r5, [r3, r0]
 80001f4:	3101      	adds	r1, #1
 80001f6:	2908      	cmp	r1, #8
 80001f8:	d1dd      	bne.n	80001b6 <scheduler+0x6>
 80001fa:	230c      	movs	r3, #12
 80001fc:	4353      	muls	r3, r2
 80001fe:	18e1      	adds	r1, r4, r3
 8000200:	8849      	ldrh	r1, [r1, #2]
 8000202:	b289      	uxth	r1, r1
 8000204:	52e1      	strh	r1, [r4, r3]
 8000206:	4b02      	ldr	r3, [pc, #8]	; (8000210 <scheduler+0x60>)
 8000208:	601a      	str	r2, [r3, #0]
 800020a:	bd70      	pop	{r4, r5, r6, pc}
 800020c:	20000034 	.word	0x20000034
 8000210:	20000094 	.word	0x20000094

08000214 <SysTick_Handler>:
 8000214:	e92d 0ff0 	stmdb	sp!, {r4, r5, r6, r7, r8, r9, sl, fp}
 8000218:	f3ef 8208 	mrs	r2, MSP
 800021c:	4c0f      	ldr	r4, [pc, #60]	; (800025c <SysTick_Handler+0x48>)
 800021e:	4d10      	ldr	r5, [pc, #64]	; (8000260 <SysTick_Handler+0x4c>)
 8000220:	6823      	ldr	r3, [r4, #0]
 8000222:	3301      	adds	r3, #1
 8000224:	d005      	beq.n	8000232 <SysTick_Handler+0x1e>
 8000226:	6823      	ldr	r3, [r4, #0]
 8000228:	210c      	movs	r1, #12
 800022a:	fb01 5303 	mla	r3, r1, r3, r5
 800022e:	609a      	str	r2, [r3, #8]
 8000230:	e001      	b.n	8000236 <SysTick_Handler+0x22>
 8000232:	2300      	movs	r3, #0
 8000234:	6023      	str	r3, [r4, #0]
 8000236:	f44f 4000 	mov.w	r0, #32768	; 0x8000
 800023a:	f001 fd8d 	bl	8001d58 <led_on>
 800023e:	f7ff ffb7 	bl	80001b0 <scheduler>
 8000242:	6823      	ldr	r3, [r4, #0]
 8000244:	220c      	movs	r2, #12
 8000246:	fb02 5503 	mla	r5, r2, r3, r5
 800024a:	f06f 0306 	mvn.w	r3, #6
 800024e:	68aa      	ldr	r2, [r5, #8]
 8000250:	469e      	mov	lr, r3
 8000252:	f382 8808 	msr	MSP, r2
 8000256:	e8bd 0ff0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, fp}
 800025a:	4770      	bx	lr
 800025c:	20000094 	.word	0x20000094
 8000260:	20000034 	.word	0x20000034

08000264 <sched_off>:
 8000264:	b672      	cpsid	i
 8000266:	4770      	bx	lr

08000268 <sched_on>:
 8000268:	b662      	cpsie	i
 800026a:	4770      	bx	lr

0800026c <yield>:
 800026c:	bf00      	nop
 800026e:	4770      	bx	lr

08000270 <get_thread_id>:
 8000270:	b082      	sub	sp, #8
 8000272:	b672      	cpsid	i
 8000274:	4b03      	ldr	r3, [pc, #12]	; (8000284 <get_thread_id+0x14>)
 8000276:	681b      	ldr	r3, [r3, #0]
 8000278:	9301      	str	r3, [sp, #4]
 800027a:	b662      	cpsie	i
 800027c:	9801      	ldr	r0, [sp, #4]
 800027e:	b002      	add	sp, #8
 8000280:	4770      	bx	lr
 8000282:	bf00      	nop
 8000284:	20000094 	.word	0x20000094

08000288 <kernel_start>:
 8000288:	b508      	push	{r3, lr}
 800028a:	f001 fb69 	bl	8001960 <sys_tick_init>
 800028e:	bf00      	nop
 8000290:	e7fd      	b.n	800028e <kernel_start+0x6>
	...

08000294 <create_thread>:
 8000294:	f022 0203 	bic.w	r2, r2, #3
 8000298:	3a40      	subs	r2, #64	; 0x40
 800029a:	e92d 43f0 	stmdb	sp!, {r4, r5, r6, r7, r8, r9, lr}
 800029e:	eb01 0c02 	add.w	ip, r1, r2
 80002a2:	f102 0834 	add.w	r8, r2, #52	; 0x34
 80002a6:	f102 0938 	add.w	r9, r2, #56	; 0x38
 80002aa:	323c      	adds	r2, #60	; 0x3c
 80002ac:	4488      	add	r8, r1
 80002ae:	4489      	add	r9, r1
 80002b0:	4607      	mov	r7, r0
 80002b2:	4411      	add	r1, r2
 80002b4:	2200      	movs	r2, #0
 80002b6:	b672      	cpsid	i
 80002b8:	4e11      	ldr	r6, [pc, #68]	; (8000300 <create_thread+0x6c>)
 80002ba:	250c      	movs	r5, #12
 80002bc:	4355      	muls	r5, r2
 80002be:	1974      	adds	r4, r6, r5
 80002c0:	6860      	ldr	r0, [r4, #4]
 80002c2:	07c0      	lsls	r0, r0, #31
 80002c4:	d412      	bmi.n	80002ec <create_thread+0x58>
 80002c6:	480f      	ldr	r0, [pc, #60]	; (8000304 <create_thread+0x70>)
 80002c8:	f8c4 c008 	str.w	ip, [r4, #8]
 80002cc:	f8c8 0000 	str.w	r0, [r8]
 80002d0:	f04f 5004 	mov.w	r0, #553648128	; 0x21000000
 80002d4:	f8c9 7000 	str.w	r7, [r9]
 80002d8:	2b07      	cmp	r3, #7
 80002da:	bf98      	it	ls
 80002dc:	2308      	movls	r3, #8
 80002de:	6008      	str	r0, [r1, #0]
 80002e0:	2001      	movs	r0, #1
 80002e2:	8063      	strh	r3, [r4, #2]
 80002e4:	5373      	strh	r3, [r6, r5]
 80002e6:	6060      	str	r0, [r4, #4]
 80002e8:	4610      	mov	r0, r2
 80002ea:	e000      	b.n	80002ee <create_thread+0x5a>
 80002ec:	2008      	movs	r0, #8
 80002ee:	b662      	cpsie	i
 80002f0:	3201      	adds	r2, #1
 80002f2:	2a08      	cmp	r2, #8
 80002f4:	d001      	beq.n	80002fa <create_thread+0x66>
 80002f6:	2808      	cmp	r0, #8
 80002f8:	d0dd      	beq.n	80002b6 <create_thread+0x22>
 80002fa:	e8bd 83f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, pc}
 80002fe:	bf00      	nop
 8000300:	20000034 	.word	0x20000034
 8000304:	08000189 	.word	0x08000189

08000308 <kernel_init>:
 8000308:	b510      	push	{r4, lr}
 800030a:	2300      	movs	r3, #0
 800030c:	490b      	ldr	r1, [pc, #44]	; (800033c <kernel_init+0x34>)
 800030e:	220c      	movs	r2, #12
 8000310:	435a      	muls	r2, r3
 8000312:	188c      	adds	r4, r1, r2
 8000314:	2000      	movs	r0, #0
 8000316:	6060      	str	r0, [r4, #4]
 8000318:	3301      	adds	r3, #1
 800031a:	2008      	movs	r0, #8
 800031c:	4283      	cmp	r3, r0
 800031e:	8060      	strh	r0, [r4, #2]
 8000320:	5288      	strh	r0, [r1, r2]
 8000322:	d1f3      	bne.n	800030c <kernel_init+0x4>
 8000324:	4b06      	ldr	r3, [pc, #24]	; (8000340 <kernel_init+0x38>)
 8000326:	4807      	ldr	r0, [pc, #28]	; (8000344 <kernel_init+0x3c>)
 8000328:	4907      	ldr	r1, [pc, #28]	; (8000348 <kernel_init+0x40>)
 800032a:	f04f 32ff 	mov.w	r2, #4294967295
 800032e:	601a      	str	r2, [r3, #0]
 8000330:	e8bd 4010 	ldmia.w	sp!, {r4, lr}
 8000334:	2280      	movs	r2, #128	; 0x80
 8000336:	23ff      	movs	r3, #255	; 0xff
 8000338:	f7ff bfac 	b.w	8000294 <create_thread>
 800033c:	20000034 	.word	0x20000034
 8000340:	20000094 	.word	0x20000094
 8000344:	080001a9 	.word	0x080001a9
 8000348:	20000098 	.word	0x20000098

0800034c <set_wait_state>:
 800034c:	b507      	push	{r0, r1, r2, lr}
 800034e:	f7ff ff8f 	bl	8000270 <get_thread_id>
 8000352:	9000      	str	r0, [sp, #0]
 8000354:	b672      	cpsid	i
 8000356:	4b0d      	ldr	r3, [pc, #52]	; (800038c <set_wait_state+0x40>)
 8000358:	9a00      	ldr	r2, [sp, #0]
 800035a:	210c      	movs	r1, #12
 800035c:	fb01 3202 	mla	r2, r1, r2, r3
 8000360:	6851      	ldr	r1, [r2, #4]
 8000362:	f041 0102 	orr.w	r1, r1, #2
 8000366:	6051      	str	r1, [r2, #4]
 8000368:	b672      	cpsid	i
 800036a:	9a00      	ldr	r2, [sp, #0]
 800036c:	210c      	movs	r1, #12
 800036e:	fb01 3202 	mla	r2, r1, r2, r3
 8000372:	6852      	ldr	r2, [r2, #4]
 8000374:	9201      	str	r2, [sp, #4]
 8000376:	b662      	cpsie	i
 8000378:	9a01      	ldr	r2, [sp, #4]
 800037a:	0791      	lsls	r1, r2, #30
 800037c:	d500      	bpl.n	8000380 <set_wait_state+0x34>
 800037e:	bf00      	nop
 8000380:	9a01      	ldr	r2, [sp, #4]
 8000382:	0792      	lsls	r2, r2, #30
 8000384:	d4f0      	bmi.n	8000368 <set_wait_state+0x1c>
 8000386:	b003      	add	sp, #12
 8000388:	f85d fb04 	ldr.w	pc, [sp], #4
 800038c:	20000034 	.word	0x20000034

08000390 <wake_up_threads>:
 8000390:	2300      	movs	r3, #0
 8000392:	b672      	cpsid	i
 8000394:	4a06      	ldr	r2, [pc, #24]	; (80003b0 <wake_up_threads+0x20>)
 8000396:	210c      	movs	r1, #12
 8000398:	fb01 2203 	mla	r2, r1, r3, r2
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
 80003f6:	f001 f88b 	bl	8001510 <uart_write>
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
 800043a:	bfa8      	it	ge
 800043c:	4614      	movge	r4, r2
 800043e:	f88d 200f 	strb.w	r2, [sp, #15]
 8000442:	bfbc      	itt	lt
 8000444:	425b      	neglt	r3, r3
 8000446:	2401      	movlt	r4, #1
 8000448:	220a      	movs	r2, #10
 800044a:	210a      	movs	r1, #10
 800044c:	fb93 f5f1 	sdiv	r5, r3, r1
 8000450:	fb01 3315 	mls	r3, r1, r5, r3
 8000454:	a801      	add	r0, sp, #4
 8000456:	3330      	adds	r3, #48	; 0x30
 8000458:	5413      	strb	r3, [r2, r0]
 800045a:	1e51      	subs	r1, r2, #1
 800045c:	462b      	mov	r3, r5
 800045e:	b10d      	cbz	r5, 8000464 <puti_+0x34>
 8000460:	460a      	mov	r2, r1
 8000462:	e7f2      	b.n	800044a <puti_+0x1a>
 8000464:	b12c      	cbz	r4, 8000472 <puti_+0x42>
 8000466:	ab04      	add	r3, sp, #16
 8000468:	440b      	add	r3, r1
 800046a:	222d      	movs	r2, #45	; 0x2d
 800046c:	f803 2c0c 	strb.w	r2, [r3, #-12]
 8000470:	460a      	mov	r2, r1
 8000472:	4410      	add	r0, r2
 8000474:	f7ff ffc8 	bl	8000408 <puts_>
 8000478:	b005      	add	sp, #20
 800047a:	bd30      	pop	{r4, r5, pc}

0800047c <putui_>:
 800047c:	b51f      	push	{r0, r1, r2, r3, r4, lr}
 800047e:	2300      	movs	r3, #0
 8000480:	f88d 300f 	strb.w	r3, [sp, #15]
 8000484:	230a      	movs	r3, #10
 8000486:	240a      	movs	r4, #10
 8000488:	fbb0 f1f4 	udiv	r1, r0, r4
 800048c:	fb04 0011 	mls	r0, r4, r1, r0
 8000490:	aa01      	add	r2, sp, #4
 8000492:	3030      	adds	r0, #48	; 0x30
 8000494:	5498      	strb	r0, [r3, r2]
 8000496:	1e5c      	subs	r4, r3, #1
 8000498:	4608      	mov	r0, r1
 800049a:	b109      	cbz	r1, 80004a0 <putui_+0x24>
 800049c:	4623      	mov	r3, r4
 800049e:	e7f2      	b.n	8000486 <putui_+0xa>
 80004a0:	18d0      	adds	r0, r2, r3
 80004a2:	f7ff ffb1 	bl	8000408 <puts_>
 80004a6:	b004      	add	sp, #16
 80004a8:	bd10      	pop	{r4, pc}

080004aa <putx_>:
 80004aa:	b51f      	push	{r0, r1, r2, r3, r4, lr}
 80004ac:	2300      	movs	r3, #0
 80004ae:	f88d 300f 	strb.w	r3, [sp, #15]
 80004b2:	230a      	movs	r3, #10
 80004b4:	f000 010f 	and.w	r1, r0, #15
 80004b8:	2909      	cmp	r1, #9
 80004ba:	aa01      	add	r2, sp, #4
 80004bc:	bf94      	ite	ls
 80004be:	3130      	addls	r1, #48	; 0x30
 80004c0:	3157      	addhi	r1, #87	; 0x57
 80004c2:	0900      	lsrs	r0, r0, #4
 80004c4:	54d1      	strb	r1, [r2, r3]
 80004c6:	f103 31ff 	add.w	r1, r3, #4294967295
 80004ca:	d001      	beq.n	80004d0 <putx_+0x26>
 80004cc:	460b      	mov	r3, r1
 80004ce:	e7f1      	b.n	80004b4 <putx_+0xa>
 80004d0:	18d0      	adds	r0, r2, r3
 80004d2:	f7ff ff99 	bl	8000408 <puts_>
 80004d6:	b005      	add	sp, #20
 80004d8:	f85d fb04 	ldr.w	pc, [sp], #4

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
 800054e:	f7ff ff95 	bl	800047c <putui_>
 8000552:	e008      	b.n	8000566 <printf_+0x8a>
 8000554:	9b01      	ldr	r3, [sp, #4]
 8000556:	1d1a      	adds	r2, r3, #4
 8000558:	6818      	ldr	r0, [r3, #0]
 800055a:	9201      	str	r2, [sp, #4]
 800055c:	f7ff ffa5 	bl	80004aa <putx_>
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
 80005cc:	08001e30 	.word	0x08001e30

080005d0 <lib_os_init>:
 80005d0:	b508      	push	{r3, lr}
 80005d2:	f7ff fe99 	bl	8000308 <kernel_init>
 80005d6:	f7ff feed 	bl	80003b4 <messages_init>
 80005da:	e8bd 4008 	ldmia.w	sp!, {r3, lr}
 80005de:	f7ff bfcf 	b.w	8000580 <stdio_init>

080005e2 <mutex_init>:
 80005e2:	b510      	push	{r4, lr}
 80005e4:	4604      	mov	r4, r0
 80005e6:	f7ff fe3d 	bl	8000264 <sched_off>
 80005ea:	2300      	movs	r3, #0
 80005ec:	6023      	str	r3, [r4, #0]
 80005ee:	e8bd 4010 	ldmia.w	sp!, {r4, lr}
 80005f2:	f7ff be39 	b.w	8000268 <sched_on>

080005f6 <mutex_lock>:
 80005f6:	b513      	push	{r0, r1, r4, lr}
 80005f8:	4604      	mov	r4, r0
 80005fa:	f7ff fe33 	bl	8000264 <sched_off>
 80005fe:	6823      	ldr	r3, [r4, #0]
 8000600:	9301      	str	r3, [sp, #4]
 8000602:	f7ff fe31 	bl	8000268 <sched_on>
 8000606:	9b01      	ldr	r3, [sp, #4]
 8000608:	b10b      	cbz	r3, 800060e <mutex_lock+0x18>
 800060a:	f7ff fe9f 	bl	800034c <set_wait_state>
 800060e:	9b01      	ldr	r3, [sp, #4]
 8000610:	2b00      	cmp	r3, #0
 8000612:	d1f2      	bne.n	80005fa <mutex_lock+0x4>
 8000614:	f7ff fe26 	bl	8000264 <sched_off>
 8000618:	6823      	ldr	r3, [r4, #0]
 800061a:	9301      	str	r3, [sp, #4]
 800061c:	9b01      	ldr	r3, [sp, #4]
 800061e:	2b00      	cmp	r3, #0
 8000620:	d1eb      	bne.n	80005fa <mutex_lock+0x4>
 8000622:	2301      	movs	r3, #1
 8000624:	6023      	str	r3, [r4, #0]
 8000626:	f7ff fe1f 	bl	8000268 <sched_on>
 800062a:	b002      	add	sp, #8
 800062c:	bd10      	pop	{r4, pc}

0800062e <mutex_unlock>:
 800062e:	b508      	push	{r3, lr}
 8000630:	f7ff ffd7 	bl	80005e2 <mutex_init>
 8000634:	f7ff feac 	bl	8000390 <wake_up_threads>
 8000638:	e8bd 4008 	ldmia.w	sp!, {r3, lr}
 800063c:	f7ff be16 	b.w	800026c <yield>

08000640 <hmc5883_init>:
 8000640:	b510      	push	{r4, lr}
 8000642:	4b16      	ldr	r3, [pc, #88]	; (800069c <hmc5883_init+0x5c>)
 8000644:	2400      	movs	r4, #0
 8000646:	203c      	movs	r0, #60	; 0x3c
 8000648:	4621      	mov	r1, r4
 800064a:	2218      	movs	r2, #24
 800064c:	801c      	strh	r4, [r3, #0]
 800064e:	805c      	strh	r4, [r3, #2]
 8000650:	809c      	strh	r4, [r3, #4]
 8000652:	f001 f8d7 	bl	8001804 <i2c_write_reg>
 8000656:	203c      	movs	r0, #60	; 0x3c
 8000658:	2101      	movs	r1, #1
 800065a:	4622      	mov	r2, r4
 800065c:	f001 f8d2 	bl	8001804 <i2c_write_reg>
 8000660:	203c      	movs	r0, #60	; 0x3c
 8000662:	2102      	movs	r1, #2
 8000664:	4622      	mov	r2, r4
 8000666:	f001 f8cd 	bl	8001804 <i2c_write_reg>
 800066a:	203c      	movs	r0, #60	; 0x3c
 800066c:	210a      	movs	r1, #10
 800066e:	f001 f8dc 	bl	800182a <i2c_read_reg>
 8000672:	2848      	cmp	r0, #72	; 0x48
 8000674:	d10e      	bne.n	8000694 <hmc5883_init+0x54>
 8000676:	203c      	movs	r0, #60	; 0x3c
 8000678:	210b      	movs	r1, #11
 800067a:	f001 f8d6 	bl	800182a <i2c_read_reg>
 800067e:	2834      	cmp	r0, #52	; 0x34
 8000680:	d10a      	bne.n	8000698 <hmc5883_init+0x58>
 8000682:	210c      	movs	r1, #12
 8000684:	203c      	movs	r0, #60	; 0x3c
 8000686:	f001 f8d0 	bl	800182a <i2c_read_reg>
 800068a:	2833      	cmp	r0, #51	; 0x33
 800068c:	bf14      	ite	ne
 800068e:	2003      	movne	r0, #3
 8000690:	4620      	moveq	r0, r4
 8000692:	bd10      	pop	{r4, pc}
 8000694:	2001      	movs	r0, #1
 8000696:	bd10      	pop	{r4, pc}
 8000698:	2002      	movs	r0, #2
 800069a:	bd10      	pop	{r4, pc}
 800069c:	20000188 	.word	0x20000188

080006a0 <hmc5883_read>:
 80006a0:	b538      	push	{r3, r4, r5, lr}
 80006a2:	2103      	movs	r1, #3
 80006a4:	203c      	movs	r0, #60	; 0x3c
 80006a6:	f001 f8c0 	bl	800182a <i2c_read_reg>
 80006aa:	4c12      	ldr	r4, [pc, #72]	; (80006f4 <hmc5883_read+0x54>)
 80006ac:	0200      	lsls	r0, r0, #8
 80006ae:	b285      	uxth	r5, r0
 80006b0:	2104      	movs	r1, #4
 80006b2:	203c      	movs	r0, #60	; 0x3c
 80006b4:	8025      	strh	r5, [r4, #0]
 80006b6:	f001 f8b8 	bl	800182a <i2c_read_reg>
 80006ba:	4328      	orrs	r0, r5
 80006bc:	8020      	strh	r0, [r4, #0]
 80006be:	2107      	movs	r1, #7
 80006c0:	203c      	movs	r0, #60	; 0x3c
 80006c2:	f001 f8b2 	bl	800182a <i2c_read_reg>
 80006c6:	0200      	lsls	r0, r0, #8
 80006c8:	b285      	uxth	r5, r0
 80006ca:	2108      	movs	r1, #8
 80006cc:	203c      	movs	r0, #60	; 0x3c
 80006ce:	8065      	strh	r5, [r4, #2]
 80006d0:	f001 f8ab 	bl	800182a <i2c_read_reg>
 80006d4:	4328      	orrs	r0, r5
 80006d6:	8060      	strh	r0, [r4, #2]
 80006d8:	2105      	movs	r1, #5
 80006da:	203c      	movs	r0, #60	; 0x3c
 80006dc:	f001 f8a5 	bl	800182a <i2c_read_reg>
 80006e0:	0200      	lsls	r0, r0, #8
 80006e2:	b285      	uxth	r5, r0
 80006e4:	2106      	movs	r1, #6
 80006e6:	203c      	movs	r0, #60	; 0x3c
 80006e8:	80a5      	strh	r5, [r4, #4]
 80006ea:	f001 f89e 	bl	800182a <i2c_read_reg>
 80006ee:	4328      	orrs	r0, r5
 80006f0:	80a0      	strh	r0, [r4, #4]
 80006f2:	bd38      	pop	{r3, r4, r5, pc}
 80006f4:	20000188 	.word	0x20000188

080006f8 <LCD_SH1106_write_command>:
 80006f8:	4602      	mov	r2, r0
 80006fa:	2100      	movs	r1, #0
 80006fc:	2078      	movs	r0, #120	; 0x78
 80006fe:	f001 b881 	b.w	8001804 <i2c_write_reg>

08000702 <LCD_SH1106_set_cursor>:
 8000702:	b510      	push	{r4, lr}
 8000704:	3950      	subs	r1, #80	; 0x50
 8000706:	3002      	adds	r0, #2
 8000708:	b2c4      	uxtb	r4, r0
 800070a:	b2c8      	uxtb	r0, r1
 800070c:	f7ff fff4 	bl	80006f8 <LCD_SH1106_write_command>
 8000710:	f004 000f 	and.w	r0, r4, #15
 8000714:	f7ff fff0 	bl	80006f8 <LCD_SH1106_write_command>
 8000718:	0920      	lsrs	r0, r4, #4
 800071a:	f040 0010 	orr.w	r0, r0, #16
 800071e:	e8bd 4010 	ldmia.w	sp!, {r4, lr}
 8000722:	f7ff bfe9 	b.w	80006f8 <LCD_SH1106_write_command>
	...

08000728 <LCD_SH1106_set_pixel>:
 8000728:	b570      	push	{r4, r5, r6, lr}
 800072a:	460d      	mov	r5, r1
 800072c:	4604      	mov	r4, r0
 800072e:	4616      	mov	r6, r2
 8000730:	f7ff fd98 	bl	8000264 <sched_off>
 8000734:	08e9      	lsrs	r1, r5, #3
 8000736:	eb04 14c1 	add.w	r4, r4, r1, lsl #7
 800073a:	4b09      	ldr	r3, [pc, #36]	; (8000760 <LCD_SH1106_set_pixel+0x38>)
 800073c:	f005 0507 	and.w	r5, r5, #7
 8000740:	2101      	movs	r1, #1
 8000742:	5d1a      	ldrb	r2, [r3, r4]
 8000744:	fa01 f505 	lsl.w	r5, r1, r5
 8000748:	b116      	cbz	r6, 8000750 <LCD_SH1106_set_pixel+0x28>
 800074a:	4315      	orrs	r5, r2
 800074c:	b2ed      	uxtb	r5, r5
 800074e:	e001      	b.n	8000754 <LCD_SH1106_set_pixel+0x2c>
 8000750:	ea22 0505 	bic.w	r5, r2, r5
 8000754:	551d      	strb	r5, [r3, r4]
 8000756:	e8bd 4070 	ldmia.w	sp!, {r4, r5, r6, lr}
 800075a:	f7ff bd85 	b.w	8000268 <sched_on>
 800075e:	bf00      	nop
 8000760:	20000190 	.word	0x20000190

08000764 <LCD_SH1106_clear_buffer>:
 8000764:	b082      	sub	sp, #8
 8000766:	2300      	movs	r3, #0
 8000768:	9300      	str	r3, [sp, #0]
 800076a:	9b00      	ldr	r3, [sp, #0]
 800076c:	2b07      	cmp	r3, #7
 800076e:	d810      	bhi.n	8000792 <LCD_SH1106_clear_buffer+0x2e>
 8000770:	2300      	movs	r3, #0
 8000772:	9301      	str	r3, [sp, #4]
 8000774:	9b01      	ldr	r3, [sp, #4]
 8000776:	2b7f      	cmp	r3, #127	; 0x7f
 8000778:	d808      	bhi.n	800078c <LCD_SH1106_clear_buffer+0x28>
 800077a:	9a00      	ldr	r2, [sp, #0]
 800077c:	9b01      	ldr	r3, [sp, #4]
 800077e:	eb03 13c2 	add.w	r3, r3, r2, lsl #7
 8000782:	4a05      	ldr	r2, [pc, #20]	; (8000798 <LCD_SH1106_clear_buffer+0x34>)
 8000784:	54d0      	strb	r0, [r2, r3]
 8000786:	9b01      	ldr	r3, [sp, #4]
 8000788:	3301      	adds	r3, #1
 800078a:	e7f2      	b.n	8000772 <LCD_SH1106_clear_buffer+0xe>
 800078c:	9b00      	ldr	r3, [sp, #0]
 800078e:	3301      	adds	r3, #1
 8000790:	e7ea      	b.n	8000768 <LCD_SH1106_clear_buffer+0x4>
 8000792:	b002      	add	sp, #8
 8000794:	4770      	bx	lr
 8000796:	bf00      	nop
 8000798:	20000190 	.word	0x20000190

0800079c <LCD_SH1106_flush_buffer>:
 800079c:	b530      	push	{r4, r5, lr}
 800079e:	2000      	movs	r0, #0
 80007a0:	b085      	sub	sp, #20
 80007a2:	f7ff ffa9 	bl	80006f8 <LCD_SH1106_write_command>
 80007a6:	2010      	movs	r0, #16
 80007a8:	f7ff ffa6 	bl	80006f8 <LCD_SH1106_write_command>
 80007ac:	2040      	movs	r0, #64	; 0x40
 80007ae:	f7ff ffa3 	bl	80006f8 <LCD_SH1106_write_command>
 80007b2:	2300      	movs	r3, #0
 80007b4:	9301      	str	r3, [sp, #4]
 80007b6:	9b01      	ldr	r3, [sp, #4]
 80007b8:	2b07      	cmp	r3, #7
 80007ba:	d832      	bhi.n	8000822 <LCD_SH1106_flush_buffer+0x86>
 80007bc:	9801      	ldr	r0, [sp, #4]
 80007be:	3850      	subs	r0, #80	; 0x50
 80007c0:	b2c0      	uxtb	r0, r0
 80007c2:	f7ff ff99 	bl	80006f8 <LCD_SH1106_write_command>
 80007c6:	2002      	movs	r0, #2
 80007c8:	f7ff ff96 	bl	80006f8 <LCD_SH1106_write_command>
 80007cc:	2400      	movs	r4, #0
 80007ce:	2010      	movs	r0, #16
 80007d0:	f7ff ff92 	bl	80006f8 <LCD_SH1106_write_command>
 80007d4:	9402      	str	r4, [sp, #8]
 80007d6:	9b02      	ldr	r3, [sp, #8]
 80007d8:	2b07      	cmp	r3, #7
 80007da:	d81f      	bhi.n	800081c <LCD_SH1106_flush_buffer+0x80>
 80007dc:	f000 ffa4 	bl	8001728 <i2cStart>
 80007e0:	2078      	movs	r0, #120	; 0x78
 80007e2:	f000 ffbf 	bl	8001764 <i2cWrite>
 80007e6:	2040      	movs	r0, #64	; 0x40
 80007e8:	f000 ffbc 	bl	8001764 <i2cWrite>
 80007ec:	2300      	movs	r3, #0
 80007ee:	9303      	str	r3, [sp, #12]
 80007f0:	9b03      	ldr	r3, [sp, #12]
 80007f2:	2b0f      	cmp	r3, #15
 80007f4:	d80c      	bhi.n	8000810 <LCD_SH1106_flush_buffer+0x74>
 80007f6:	9b01      	ldr	r3, [sp, #4]
 80007f8:	1c65      	adds	r5, r4, #1
 80007fa:	eb04 14c3 	add.w	r4, r4, r3, lsl #7
 80007fe:	4b0c      	ldr	r3, [pc, #48]	; (8000830 <LCD_SH1106_flush_buffer+0x94>)
 8000800:	5d18      	ldrb	r0, [r3, r4]
 8000802:	f000 ffaf 	bl	8001764 <i2cWrite>
 8000806:	9b03      	ldr	r3, [sp, #12]
 8000808:	3301      	adds	r3, #1
 800080a:	9303      	str	r3, [sp, #12]
 800080c:	462c      	mov	r4, r5
 800080e:	e7ef      	b.n	80007f0 <LCD_SH1106_flush_buffer+0x54>
 8000810:	f000 ff99 	bl	8001746 <i2cStop>
 8000814:	9b02      	ldr	r3, [sp, #8]
 8000816:	3301      	adds	r3, #1
 8000818:	9302      	str	r3, [sp, #8]
 800081a:	e7dc      	b.n	80007d6 <LCD_SH1106_flush_buffer+0x3a>
 800081c:	9b01      	ldr	r3, [sp, #4]
 800081e:	3301      	adds	r3, #1
 8000820:	e7c8      	b.n	80007b4 <LCD_SH1106_flush_buffer+0x18>
 8000822:	2000      	movs	r0, #0
 8000824:	4601      	mov	r1, r0
 8000826:	f7ff ff6c 	bl	8000702 <LCD_SH1106_set_cursor>
 800082a:	b005      	add	sp, #20
 800082c:	bd30      	pop	{r4, r5, pc}
 800082e:	bf00      	nop
 8000830:	20000190 	.word	0x20000190

08000834 <LCD_SH1106_flush_buffer_partial>:
 8000834:	b5f0      	push	{r4, r5, r6, r7, lr}
 8000836:	4c33      	ldr	r4, [pc, #204]	; (8000904 <LCD_SH1106_flush_buffer_partial+0xd0>)
 8000838:	8823      	ldrh	r3, [r4, #0]
 800083a:	b29b      	uxth	r3, r3
 800083c:	2b01      	cmp	r3, #1
 800083e:	b085      	sub	sp, #20
 8000840:	4626      	mov	r6, r4
 8000842:	d01a      	beq.n	800087a <LCD_SH1106_flush_buffer_partial+0x46>
 8000844:	d30a      	bcc.n	800085c <LCD_SH1106_flush_buffer_partial+0x28>
 8000846:	2b02      	cmp	r3, #2
 8000848:	f04f 0500 	mov.w	r5, #0
 800084c:	d155      	bne.n	80008fa <LCD_SH1106_flush_buffer_partial+0xc6>
 800084e:	4628      	mov	r0, r5
 8000850:	4629      	mov	r1, r5
 8000852:	f7ff ff56 	bl	8000702 <LCD_SH1106_set_cursor>
 8000856:	8025      	strh	r5, [r4, #0]
 8000858:	4628      	mov	r0, r5
 800085a:	e050      	b.n	80008fe <LCD_SH1106_flush_buffer_partial+0xca>
 800085c:	2000      	movs	r0, #0
 800085e:	f7ff ff4b 	bl	80006f8 <LCD_SH1106_write_command>
 8000862:	2010      	movs	r0, #16
 8000864:	f7ff ff48 	bl	80006f8 <LCD_SH1106_write_command>
 8000868:	2040      	movs	r0, #64	; 0x40
 800086a:	f7ff ff45 	bl	80006f8 <LCD_SH1106_write_command>
 800086e:	4b26      	ldr	r3, [pc, #152]	; (8000908 <LCD_SH1106_flush_buffer_partial+0xd4>)
 8000870:	2200      	movs	r2, #0
 8000872:	2001      	movs	r0, #1
 8000874:	801a      	strh	r2, [r3, #0]
 8000876:	8020      	strh	r0, [r4, #0]
 8000878:	e041      	b.n	80008fe <LCD_SH1106_flush_buffer_partial+0xca>
 800087a:	4c23      	ldr	r4, [pc, #140]	; (8000908 <LCD_SH1106_flush_buffer_partial+0xd4>)
 800087c:	8823      	ldrh	r3, [r4, #0]
 800087e:	b29b      	uxth	r3, r3
 8000880:	9301      	str	r3, [sp, #4]
 8000882:	9801      	ldr	r0, [sp, #4]
 8000884:	3850      	subs	r0, #80	; 0x50
 8000886:	b2c0      	uxtb	r0, r0
 8000888:	f7ff ff36 	bl	80006f8 <LCD_SH1106_write_command>
 800088c:	2002      	movs	r0, #2
 800088e:	f7ff ff33 	bl	80006f8 <LCD_SH1106_write_command>
 8000892:	2500      	movs	r5, #0
 8000894:	2010      	movs	r0, #16
 8000896:	f7ff ff2f 	bl	80006f8 <LCD_SH1106_write_command>
 800089a:	9502      	str	r5, [sp, #8]
 800089c:	9b02      	ldr	r3, [sp, #8]
 800089e:	2b07      	cmp	r3, #7
 80008a0:	d81f      	bhi.n	80008e2 <LCD_SH1106_flush_buffer_partial+0xae>
 80008a2:	f000 ff41 	bl	8001728 <i2cStart>
 80008a6:	2078      	movs	r0, #120	; 0x78
 80008a8:	f000 ff5c 	bl	8001764 <i2cWrite>
 80008ac:	2040      	movs	r0, #64	; 0x40
 80008ae:	f000 ff59 	bl	8001764 <i2cWrite>
 80008b2:	2300      	movs	r3, #0
 80008b4:	9303      	str	r3, [sp, #12]
 80008b6:	9b03      	ldr	r3, [sp, #12]
 80008b8:	2b0f      	cmp	r3, #15
 80008ba:	d80c      	bhi.n	80008d6 <LCD_SH1106_flush_buffer_partial+0xa2>
 80008bc:	9b01      	ldr	r3, [sp, #4]
 80008be:	1c6f      	adds	r7, r5, #1
 80008c0:	eb05 15c3 	add.w	r5, r5, r3, lsl #7
 80008c4:	4b11      	ldr	r3, [pc, #68]	; (800090c <LCD_SH1106_flush_buffer_partial+0xd8>)
 80008c6:	5d58      	ldrb	r0, [r3, r5]
 80008c8:	f000 ff4c 	bl	8001764 <i2cWrite>
 80008cc:	9b03      	ldr	r3, [sp, #12]
 80008ce:	3301      	adds	r3, #1
 80008d0:	9303      	str	r3, [sp, #12]
 80008d2:	463d      	mov	r5, r7
 80008d4:	e7ef      	b.n	80008b6 <LCD_SH1106_flush_buffer_partial+0x82>
 80008d6:	f000 ff36 	bl	8001746 <i2cStop>
 80008da:	9b02      	ldr	r3, [sp, #8]
 80008dc:	3301      	adds	r3, #1
 80008de:	9302      	str	r3, [sp, #8]
 80008e0:	e7dc      	b.n	800089c <LCD_SH1106_flush_buffer_partial+0x68>
 80008e2:	8823      	ldrh	r3, [r4, #0]
 80008e4:	b29b      	uxth	r3, r3
 80008e6:	3301      	adds	r3, #1
 80008e8:	b29b      	uxth	r3, r3
 80008ea:	8023      	strh	r3, [r4, #0]
 80008ec:	8823      	ldrh	r3, [r4, #0]
 80008ee:	b29b      	uxth	r3, r3
 80008f0:	2b07      	cmp	r3, #7
 80008f2:	d903      	bls.n	80008fc <LCD_SH1106_flush_buffer_partial+0xc8>
 80008f4:	2302      	movs	r3, #2
 80008f6:	8033      	strh	r3, [r6, #0]
 80008f8:	e000      	b.n	80008fc <LCD_SH1106_flush_buffer_partial+0xc8>
 80008fa:	8025      	strh	r5, [r4, #0]
 80008fc:	2001      	movs	r0, #1
 80008fe:	b005      	add	sp, #20
 8000900:	bdf0      	pop	{r4, r5, r6, r7, pc}
 8000902:	bf00      	nop
 8000904:	2000018e 	.word	0x2000018e
 8000908:	20000590 	.word	0x20000590
 800090c:	20000190 	.word	0x20000190

08000910 <LCD_SH1106_init>:
 8000910:	b508      	push	{r3, lr}
 8000912:	20ae      	movs	r0, #174	; 0xae
 8000914:	f7ff fef0 	bl	80006f8 <LCD_SH1106_write_command>
 8000918:	2002      	movs	r0, #2
 800091a:	f7ff feed 	bl	80006f8 <LCD_SH1106_write_command>
 800091e:	2010      	movs	r0, #16
 8000920:	f7ff feea 	bl	80006f8 <LCD_SH1106_write_command>
 8000924:	2040      	movs	r0, #64	; 0x40
 8000926:	f7ff fee7 	bl	80006f8 <LCD_SH1106_write_command>
 800092a:	20b0      	movs	r0, #176	; 0xb0
 800092c:	f7ff fee4 	bl	80006f8 <LCD_SH1106_write_command>
 8000930:	2081      	movs	r0, #129	; 0x81
 8000932:	f7ff fee1 	bl	80006f8 <LCD_SH1106_write_command>
 8000936:	2080      	movs	r0, #128	; 0x80
 8000938:	f7ff fede 	bl	80006f8 <LCD_SH1106_write_command>
 800093c:	20a1      	movs	r0, #161	; 0xa1
 800093e:	f7ff fedb 	bl	80006f8 <LCD_SH1106_write_command>
 8000942:	20a6      	movs	r0, #166	; 0xa6
 8000944:	f7ff fed8 	bl	80006f8 <LCD_SH1106_write_command>
 8000948:	20a8      	movs	r0, #168	; 0xa8
 800094a:	f7ff fed5 	bl	80006f8 <LCD_SH1106_write_command>
 800094e:	203f      	movs	r0, #63	; 0x3f
 8000950:	f7ff fed2 	bl	80006f8 <LCD_SH1106_write_command>
 8000954:	20ad      	movs	r0, #173	; 0xad
 8000956:	f7ff fecf 	bl	80006f8 <LCD_SH1106_write_command>
 800095a:	208b      	movs	r0, #139	; 0x8b
 800095c:	f7ff fecc 	bl	80006f8 <LCD_SH1106_write_command>
 8000960:	2030      	movs	r0, #48	; 0x30
 8000962:	f7ff fec9 	bl	80006f8 <LCD_SH1106_write_command>
 8000966:	20c8      	movs	r0, #200	; 0xc8
 8000968:	f7ff fec6 	bl	80006f8 <LCD_SH1106_write_command>
 800096c:	20d3      	movs	r0, #211	; 0xd3
 800096e:	f7ff fec3 	bl	80006f8 <LCD_SH1106_write_command>
 8000972:	2000      	movs	r0, #0
 8000974:	f7ff fec0 	bl	80006f8 <LCD_SH1106_write_command>
 8000978:	20d5      	movs	r0, #213	; 0xd5
 800097a:	f7ff febd 	bl	80006f8 <LCD_SH1106_write_command>
 800097e:	2080      	movs	r0, #128	; 0x80
 8000980:	f7ff feba 	bl	80006f8 <LCD_SH1106_write_command>
 8000984:	20d9      	movs	r0, #217	; 0xd9
 8000986:	f7ff feb7 	bl	80006f8 <LCD_SH1106_write_command>
 800098a:	201f      	movs	r0, #31
 800098c:	f7ff feb4 	bl	80006f8 <LCD_SH1106_write_command>
 8000990:	20da      	movs	r0, #218	; 0xda
 8000992:	f7ff feb1 	bl	80006f8 <LCD_SH1106_write_command>
 8000996:	2012      	movs	r0, #18
 8000998:	f7ff feae 	bl	80006f8 <LCD_SH1106_write_command>
 800099c:	20db      	movs	r0, #219	; 0xdb
 800099e:	f7ff feab 	bl	80006f8 <LCD_SH1106_write_command>
 80009a2:	2040      	movs	r0, #64	; 0x40
 80009a4:	f7ff fea8 	bl	80006f8 <LCD_SH1106_write_command>
 80009a8:	20af      	movs	r0, #175	; 0xaf
 80009aa:	f7ff fea5 	bl	80006f8 <LCD_SH1106_write_command>
 80009ae:	2000      	movs	r0, #0
 80009b0:	f7ff fed8 	bl	8000764 <LCD_SH1106_clear_buffer>
 80009b4:	f7ff fef2 	bl	800079c <LCD_SH1106_flush_buffer>
 80009b8:	4a02      	ldr	r2, [pc, #8]	; (80009c4 <LCD_SH1106_init+0xb4>)
 80009ba:	2300      	movs	r3, #0
 80009bc:	8013      	strh	r3, [r2, #0]
 80009be:	4a02      	ldr	r2, [pc, #8]	; (80009c8 <LCD_SH1106_init+0xb8>)
 80009c0:	8013      	strh	r3, [r2, #0]
 80009c2:	bd08      	pop	{r3, pc}
 80009c4:	2000018e 	.word	0x2000018e
 80009c8:	20000590 	.word	0x20000590

080009cc <lcd_put_char_xy>:
 80009cc:	2a1f      	cmp	r2, #31
 80009ce:	bf86      	itte	hi
 80009d0:	3a20      	subhi	r2, #32
 80009d2:	b2d2      	uxtbhi	r2, r2
 80009d4:	2200      	movls	r2, #0
 80009d6:	e92d 43f8 	stmdb	sp!, {r3, r4, r5, r6, r7, r8, r9, lr}
 80009da:	4680      	mov	r8, r0
 80009dc:	4689      	mov	r9, r1
 80009de:	0117      	lsls	r7, r2, #4
 80009e0:	2500      	movs	r5, #0
 80009e2:	2601      	movs	r6, #1
 80009e4:	40ae      	lsls	r6, r5
 80009e6:	b2f6      	uxtb	r6, r6
 80009e8:	2400      	movs	r4, #0
 80009ea:	4b0c      	ldr	r3, [pc, #48]	; (8000a1c <lcd_put_char_xy+0x50>)
 80009ec:	443b      	add	r3, r7
 80009ee:	f108 0008 	add.w	r0, r8, #8
 80009f2:	5d1a      	ldrb	r2, [r3, r4]
 80009f4:	eb04 0109 	add.w	r1, r4, r9
 80009f8:	1b40      	subs	r0, r0, r5
 80009fa:	2880      	cmp	r0, #128	; 0x80
 80009fc:	bf28      	it	cs
 80009fe:	2080      	movcs	r0, #128	; 0x80
 8000a00:	2940      	cmp	r1, #64	; 0x40
 8000a02:	bf28      	it	cs
 8000a04:	2140      	movcs	r1, #64	; 0x40
 8000a06:	4032      	ands	r2, r6
 8000a08:	3401      	adds	r4, #1
 8000a0a:	f7ff fe8d 	bl	8000728 <LCD_SH1106_set_pixel>
 8000a0e:	2c10      	cmp	r4, #16
 8000a10:	d1eb      	bne.n	80009ea <lcd_put_char_xy+0x1e>
 8000a12:	3501      	adds	r5, #1
 8000a14:	2d08      	cmp	r5, #8
 8000a16:	d1e4      	bne.n	80009e2 <lcd_put_char_xy+0x16>
 8000a18:	e8bd 83f8 	ldmia.w	sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
 8000a1c:	08001e41 	.word	0x08001e41

08000a20 <mpu6050_init>:
 8000a20:	4b05      	ldr	r3, [pc, #20]	; (8000a38 <mpu6050_init+0x18>)
 8000a22:	2200      	movs	r2, #0
 8000a24:	20d0      	movs	r0, #208	; 0xd0
 8000a26:	216b      	movs	r1, #107	; 0x6b
 8000a28:	801a      	strh	r2, [r3, #0]
 8000a2a:	805a      	strh	r2, [r3, #2]
 8000a2c:	809a      	strh	r2, [r3, #4]
 8000a2e:	80da      	strh	r2, [r3, #6]
 8000a30:	811a      	strh	r2, [r3, #8]
 8000a32:	815a      	strh	r2, [r3, #10]
 8000a34:	f000 bee6 	b.w	8001804 <i2c_write_reg>
 8000a38:	20000592 	.word	0x20000592

08000a3c <mpu6050_read>:
 8000a3c:	b538      	push	{r3, r4, r5, lr}
 8000a3e:	213b      	movs	r1, #59	; 0x3b
 8000a40:	20d0      	movs	r0, #208	; 0xd0
 8000a42:	f000 fef2 	bl	800182a <i2c_read_reg>
 8000a46:	4c2c      	ldr	r4, [pc, #176]	; (8000af8 <mpu6050_read+0xbc>)
 8000a48:	0200      	lsls	r0, r0, #8
 8000a4a:	b285      	uxth	r5, r0
 8000a4c:	213c      	movs	r1, #60	; 0x3c
 8000a4e:	20d0      	movs	r0, #208	; 0xd0
 8000a50:	8025      	strh	r5, [r4, #0]
 8000a52:	f000 feea 	bl	800182a <i2c_read_reg>
 8000a56:	4328      	orrs	r0, r5
 8000a58:	8020      	strh	r0, [r4, #0]
 8000a5a:	213d      	movs	r1, #61	; 0x3d
 8000a5c:	20d0      	movs	r0, #208	; 0xd0
 8000a5e:	f000 fee4 	bl	800182a <i2c_read_reg>
 8000a62:	0200      	lsls	r0, r0, #8
 8000a64:	b285      	uxth	r5, r0
 8000a66:	213e      	movs	r1, #62	; 0x3e
 8000a68:	20d0      	movs	r0, #208	; 0xd0
 8000a6a:	8065      	strh	r5, [r4, #2]
 8000a6c:	f000 fedd 	bl	800182a <i2c_read_reg>
 8000a70:	4328      	orrs	r0, r5
 8000a72:	8060      	strh	r0, [r4, #2]
 8000a74:	213f      	movs	r1, #63	; 0x3f
 8000a76:	20d0      	movs	r0, #208	; 0xd0
 8000a78:	f000 fed7 	bl	800182a <i2c_read_reg>
 8000a7c:	0200      	lsls	r0, r0, #8
 8000a7e:	b285      	uxth	r5, r0
 8000a80:	2140      	movs	r1, #64	; 0x40
 8000a82:	20d0      	movs	r0, #208	; 0xd0
 8000a84:	80a5      	strh	r5, [r4, #4]
 8000a86:	f000 fed0 	bl	800182a <i2c_read_reg>
 8000a8a:	4328      	orrs	r0, r5
 8000a8c:	80a0      	strh	r0, [r4, #4]
 8000a8e:	2141      	movs	r1, #65	; 0x41
 8000a90:	20d0      	movs	r0, #208	; 0xd0
 8000a92:	f000 feca 	bl	800182a <i2c_read_reg>
 8000a96:	0200      	lsls	r0, r0, #8
 8000a98:	b285      	uxth	r5, r0
 8000a9a:	2142      	movs	r1, #66	; 0x42
 8000a9c:	20d0      	movs	r0, #208	; 0xd0
 8000a9e:	81a5      	strh	r5, [r4, #12]
 8000aa0:	f000 fec3 	bl	800182a <i2c_read_reg>
 8000aa4:	4328      	orrs	r0, r5
 8000aa6:	81a0      	strh	r0, [r4, #12]
 8000aa8:	2143      	movs	r1, #67	; 0x43
 8000aaa:	20d0      	movs	r0, #208	; 0xd0
 8000aac:	f000 febd 	bl	800182a <i2c_read_reg>
 8000ab0:	0200      	lsls	r0, r0, #8
 8000ab2:	b285      	uxth	r5, r0
 8000ab4:	2144      	movs	r1, #68	; 0x44
 8000ab6:	20d0      	movs	r0, #208	; 0xd0
 8000ab8:	80e5      	strh	r5, [r4, #6]
 8000aba:	f000 feb6 	bl	800182a <i2c_read_reg>
 8000abe:	4328      	orrs	r0, r5
 8000ac0:	80e0      	strh	r0, [r4, #6]
 8000ac2:	2145      	movs	r1, #69	; 0x45
 8000ac4:	20d0      	movs	r0, #208	; 0xd0
 8000ac6:	f000 feb0 	bl	800182a <i2c_read_reg>
 8000aca:	0200      	lsls	r0, r0, #8
 8000acc:	b285      	uxth	r5, r0
 8000ace:	2146      	movs	r1, #70	; 0x46
 8000ad0:	20d0      	movs	r0, #208	; 0xd0
 8000ad2:	8125      	strh	r5, [r4, #8]
 8000ad4:	f000 fea9 	bl	800182a <i2c_read_reg>
 8000ad8:	4328      	orrs	r0, r5
 8000ada:	8120      	strh	r0, [r4, #8]
 8000adc:	2147      	movs	r1, #71	; 0x47
 8000ade:	20d0      	movs	r0, #208	; 0xd0
 8000ae0:	f000 fea3 	bl	800182a <i2c_read_reg>
 8000ae4:	0200      	lsls	r0, r0, #8
 8000ae6:	b285      	uxth	r5, r0
 8000ae8:	2148      	movs	r1, #72	; 0x48
 8000aea:	20d0      	movs	r0, #208	; 0xd0
 8000aec:	8165      	strh	r5, [r4, #10]
 8000aee:	f000 fe9c 	bl	800182a <i2c_read_reg>
 8000af2:	4328      	orrs	r0, r5
 8000af4:	8160      	strh	r0, [r4, #10]
 8000af6:	bd38      	pop	{r3, r4, r5, pc}
 8000af8:	20000592 	.word	0x20000592

08000afc <child_thread>:
 8000afc:	b508      	push	{r3, lr}
 8000afe:	f44f 4000 	mov.w	r0, #32768	; 0x8000
 8000b02:	f001 f929 	bl	8001d58 <led_on>
 8000b06:	f000 fc33 	bl	8001370 <timer_get_time>
 8000b0a:	4c16      	ldr	r4, [pc, #88]	; (8000b64 <child_thread+0x68>)
 8000b0c:	4601      	mov	r1, r0
 8000b0e:	4816      	ldr	r0, [pc, #88]	; (8000b68 <child_thread+0x6c>)
 8000b10:	f7ff fce4 	bl	80004dc <printf_>
 8000b14:	f9b4 1000 	ldrsh.w	r1, [r4]
 8000b18:	f9b4 2002 	ldrsh.w	r2, [r4, #2]
 8000b1c:	f9b4 3004 	ldrsh.w	r3, [r4, #4]
 8000b20:	4812      	ldr	r0, [pc, #72]	; (8000b6c <child_thread+0x70>)
 8000b22:	f7ff fcdb 	bl	80004dc <printf_>
 8000b26:	f9b4 1006 	ldrsh.w	r1, [r4, #6]
 8000b2a:	f9b4 2008 	ldrsh.w	r2, [r4, #8]
 8000b2e:	f9b4 300a 	ldrsh.w	r3, [r4, #10]
 8000b32:	480e      	ldr	r0, [pc, #56]	; (8000b6c <child_thread+0x70>)
 8000b34:	f7ff fcd2 	bl	80004dc <printf_>
 8000b38:	4b0d      	ldr	r3, [pc, #52]	; (8000b70 <child_thread+0x74>)
 8000b3a:	480c      	ldr	r0, [pc, #48]	; (8000b6c <child_thread+0x70>)
 8000b3c:	f9b3 1000 	ldrsh.w	r1, [r3]
 8000b40:	f9b3 2002 	ldrsh.w	r2, [r3, #2]
 8000b44:	f9b3 3004 	ldrsh.w	r3, [r3, #4]
 8000b48:	f7ff fcc8 	bl	80004dc <printf_>
 8000b4c:	4809      	ldr	r0, [pc, #36]	; (8000b74 <child_thread+0x78>)
 8000b4e:	f7ff fcc5 	bl	80004dc <printf_>
 8000b52:	f44f 4000 	mov.w	r0, #32768	; 0x8000
 8000b56:	f001 f909 	bl	8001d6c <led_off>
 8000b5a:	f44f 7096 	mov.w	r0, #300	; 0x12c
 8000b5e:	f000 fc15 	bl	800138c <timer_delay_ms>
 8000b62:	e7cc      	b.n	8000afe <child_thread+0x2>
 8000b64:	20000592 	.word	0x20000592
 8000b68:	08002441 	.word	0x08002441
 8000b6c:	08002448 	.word	0x08002448
 8000b70:	20000188 	.word	0x20000188
 8000b74:	080024dc 	.word	0x080024dc

08000b78 <lcd_put_int>:
 8000b78:	e92d 43f0 	stmdb	sp!, {r4, r5, r6, r7, r8, r9, lr}
 8000b7c:	b085      	sub	sp, #20
 8000b7e:	2800      	cmp	r0, #0
 8000b80:	f04f 0300 	mov.w	r3, #0
 8000b84:	4688      	mov	r8, r1
 8000b86:	4691      	mov	r9, r2
 8000b88:	bfba      	itte	lt
 8000b8a:	4240      	neglt	r0, r0
 8000b8c:	2401      	movlt	r4, #1
 8000b8e:	461c      	movge	r4, r3
 8000b90:	f88d 300f 	strb.w	r3, [sp, #15]
 8000b94:	250a      	movs	r5, #10
 8000b96:	230a      	movs	r3, #10
 8000b98:	fb90 f7f3 	sdiv	r7, r0, r3
 8000b9c:	fb03 0317 	mls	r3, r3, r7, r0
 8000ba0:	ae01      	add	r6, sp, #4
 8000ba2:	3330      	adds	r3, #48	; 0x30
 8000ba4:	55ab      	strb	r3, [r5, r6]
 8000ba6:	4638      	mov	r0, r7
 8000ba8:	1e6b      	subs	r3, r5, #1
 8000baa:	b10f      	cbz	r7, 8000bb0 <lcd_put_int+0x38>
 8000bac:	461d      	mov	r5, r3
 8000bae:	e7f2      	b.n	8000b96 <lcd_put_int+0x1e>
 8000bb0:	b12c      	cbz	r4, 8000bbe <lcd_put_int+0x46>
 8000bb2:	aa04      	add	r2, sp, #16
 8000bb4:	441a      	add	r2, r3
 8000bb6:	212d      	movs	r1, #45	; 0x2d
 8000bb8:	f802 1c0c 	strb.w	r1, [r2, #-12]
 8000bbc:	461d      	mov	r5, r3
 8000bbe:	2400      	movs	r4, #0
 8000bc0:	1973      	adds	r3, r6, r5
 8000bc2:	eb08 00c4 	add.w	r0, r8, r4, lsl #3
 8000bc6:	5d1f      	ldrb	r7, [r3, r4]
 8000bc8:	4649      	mov	r1, r9
 8000bca:	463a      	mov	r2, r7
 8000bcc:	f7ff fefe 	bl	80009cc <lcd_put_char_xy>
 8000bd0:	b117      	cbz	r7, 8000bd8 <lcd_put_int+0x60>
 8000bd2:	3401      	adds	r4, #1
 8000bd4:	2c0c      	cmp	r4, #12
 8000bd6:	d1f3      	bne.n	8000bc0 <lcd_put_int+0x48>
 8000bd8:	b005      	add	sp, #20
 8000bda:	e8bd 83f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, pc}
	...

08000be0 <main_thread>:
 8000be0:	b538      	push	{r3, r4, r5, lr}
 8000be2:	f44f 4000 	mov.w	r0, #32768	; 0x8000
 8000be6:	f001 f8b7 	bl	8001d58 <led_on>
 8000bea:	4826      	ldr	r0, [pc, #152]	; (8000c84 <main_thread+0xa4>)
 8000bec:	f7ff fc76 	bl	80004dc <printf_>
 8000bf0:	f7ff fd26 	bl	8000640 <hmc5883_init>
 8000bf4:	f7ff ff14 	bl	8000a20 <mpu6050_init>
 8000bf8:	f7ff fe8a 	bl	8000910 <LCD_SH1106_init>
 8000bfc:	20ff      	movs	r0, #255	; 0xff
 8000bfe:	f7ff fdb1 	bl	8000764 <LCD_SH1106_clear_buffer>
 8000c02:	4821      	ldr	r0, [pc, #132]	; (8000c88 <main_thread+0xa8>)
 8000c04:	4921      	ldr	r1, [pc, #132]	; (8000c8c <main_thread+0xac>)
 8000c06:	f44f 6280 	mov.w	r2, #1024	; 0x400
 8000c0a:	2308      	movs	r3, #8
 8000c0c:	f7ff fb42 	bl	8000294 <create_thread>
 8000c10:	f7ff fd46 	bl	80006a0 <hmc5883_read>
 8000c14:	f7ff ff12 	bl	8000a3c <mpu6050_read>
 8000c18:	f7ff fe0c 	bl	8000834 <LCD_SH1106_flush_buffer_partial>
 8000c1c:	4604      	mov	r4, r0
 8000c1e:	bb68      	cbnz	r0, 8000c7c <main_thread+0x9c>
 8000c20:	4d1b      	ldr	r5, [pc, #108]	; (8000c90 <main_thread+0xb0>)
 8000c22:	f7ff fd9f 	bl	8000764 <LCD_SH1106_clear_buffer>
 8000c26:	f9b5 0006 	ldrsh.w	r0, [r5, #6]
 8000c2a:	4621      	mov	r1, r4
 8000c2c:	4622      	mov	r2, r4
 8000c2e:	f7ff ffa3 	bl	8000b78 <lcd_put_int>
 8000c32:	f9b5 0008 	ldrsh.w	r0, [r5, #8]
 8000c36:	4621      	mov	r1, r4
 8000c38:	2210      	movs	r2, #16
 8000c3a:	f7ff ff9d 	bl	8000b78 <lcd_put_int>
 8000c3e:	f9b5 000a 	ldrsh.w	r0, [r5, #10]
 8000c42:	4d14      	ldr	r5, [pc, #80]	; (8000c94 <main_thread+0xb4>)
 8000c44:	4621      	mov	r1, r4
 8000c46:	2220      	movs	r2, #32
 8000c48:	f7ff ff96 	bl	8000b78 <lcd_put_int>
 8000c4c:	f9b5 0000 	ldrsh.w	r0, [r5]
 8000c50:	2140      	movs	r1, #64	; 0x40
 8000c52:	4622      	mov	r2, r4
 8000c54:	f7ff ff90 	bl	8000b78 <lcd_put_int>
 8000c58:	f9b5 0002 	ldrsh.w	r0, [r5, #2]
 8000c5c:	2140      	movs	r1, #64	; 0x40
 8000c5e:	2210      	movs	r2, #16
 8000c60:	f7ff ff8a 	bl	8000b78 <lcd_put_int>
 8000c64:	2140      	movs	r1, #64	; 0x40
 8000c66:	2220      	movs	r2, #32
 8000c68:	f9b5 0004 	ldrsh.w	r0, [r5, #4]
 8000c6c:	f7ff ff84 	bl	8000b78 <lcd_put_int>
 8000c70:	f000 fb7e 	bl	8001370 <timer_get_time>
 8000c74:	4621      	mov	r1, r4
 8000c76:	2230      	movs	r2, #48	; 0x30
 8000c78:	f7ff ff7e 	bl	8000b78 <lcd_put_int>
 8000c7c:	2064      	movs	r0, #100	; 0x64
 8000c7e:	f000 fb85 	bl	800138c <timer_delay_ms>
 8000c82:	e7c5      	b.n	8000c10 <main_thread+0x30>
 8000c84:	08002454 	.word	0x08002454
 8000c88:	08000afd 	.word	0x08000afd
 8000c8c:	200005a0 	.word	0x200005a0
 8000c90:	20000592 	.word	0x20000592
 8000c94:	20000188 	.word	0x20000188

08000c98 <mem_info_print>:
 8000c98:	b538      	push	{r3, r4, r5, lr}
 8000c9a:	4c0f      	ldr	r4, [pc, #60]	; (8000cd8 <mem_info_print+0x40>)
 8000c9c:	4d0f      	ldr	r5, [pc, #60]	; (8000cdc <mem_info_print+0x44>)
 8000c9e:	4810      	ldr	r0, [pc, #64]	; (8000ce0 <mem_info_print+0x48>)
 8000ca0:	4910      	ldr	r1, [pc, #64]	; (8000ce4 <mem_info_print+0x4c>)
 8000ca2:	f7ff fc1b 	bl	80004dc <printf_>
 8000ca6:	1b2d      	subs	r5, r5, r4
 8000ca8:	4621      	mov	r1, r4
 8000caa:	480f      	ldr	r0, [pc, #60]	; (8000ce8 <mem_info_print+0x50>)
 8000cac:	f7ff fc16 	bl	80004dc <printf_>
 8000cb0:	4629      	mov	r1, r5
 8000cb2:	480e      	ldr	r0, [pc, #56]	; (8000cec <mem_info_print+0x54>)
 8000cb4:	f7ff fc12 	bl	80004dc <printf_>
 8000cb8:	4b0d      	ldr	r3, [pc, #52]	; (8000cf0 <mem_info_print+0x58>)
 8000cba:	480e      	ldr	r0, [pc, #56]	; (8000cf4 <mem_info_print+0x5c>)
 8000cbc:	1ae1      	subs	r1, r4, r3
 8000cbe:	4429      	add	r1, r5
 8000cc0:	f7ff fc0c 	bl	80004dc <printf_>
 8000cc4:	480c      	ldr	r0, [pc, #48]	; (8000cf8 <mem_info_print+0x60>)
 8000cc6:	490d      	ldr	r1, [pc, #52]	; (8000cfc <mem_info_print+0x64>)
 8000cc8:	f7ff fc08 	bl	80004dc <printf_>
 8000ccc:	480c      	ldr	r0, [pc, #48]	; (8000d00 <mem_info_print+0x68>)
 8000cce:	e8bd 4038 	ldmia.w	sp!, {r3, r4, r5, lr}
 8000cd2:	f7ff bc03 	b.w	80004dc <printf_>
 8000cd6:	bf00      	nop
 8000cd8:	20000000 	.word	0x20000000
 8000cdc:	20004000 	.word	0x20004000
 8000ce0:	0800248f 	.word	0x0800248f
 8000ce4:	08001e00 	.word	0x08001e00
 8000ce8:	080024a0 	.word	0x080024a0
 8000cec:	080024af 	.word	0x080024af
 8000cf0:	20000dd4 	.word	0x20000dd4
 8000cf4:	080024bd 	.word	0x080024bd
 8000cf8:	080024cb 	.word	0x080024cb
 8000cfc:	20000dd4 	.word	0x20000dd4
 8000d00:	080024db 	.word	0x080024db

08000d04 <main>:
 8000d04:	b508      	push	{r3, lr}
 8000d06:	f000 ff7b 	bl	8001c00 <lib_low_level_init>
 8000d0a:	f7ff fc61 	bl	80005d0 <lib_os_init>
 8000d0e:	f7ff ffc3 	bl	8000c98 <mem_info_print>
 8000d12:	4905      	ldr	r1, [pc, #20]	; (8000d28 <main+0x24>)
 8000d14:	4805      	ldr	r0, [pc, #20]	; (8000d2c <main+0x28>)
 8000d16:	f44f 6280 	mov.w	r2, #1024	; 0x400
 8000d1a:	2308      	movs	r3, #8
 8000d1c:	f7ff faba 	bl	8000294 <create_thread>
 8000d20:	f7ff fab2 	bl	8000288 <kernel_start>
 8000d24:	2000      	movs	r0, #0
 8000d26:	bd08      	pop	{r3, pc}
 8000d28:	200009a0 	.word	0x200009a0
 8000d2c:	08000be1 	.word	0x08000be1

08000d30 <RCC_GetClocksFreq>:
 8000d30:	4ba5      	ldr	r3, [pc, #660]	; (8000fc8 <RCC_GetClocksFreq+0x298>)
 8000d32:	685a      	ldr	r2, [r3, #4]
 8000d34:	f002 020c 	and.w	r2, r2, #12
 8000d38:	2a04      	cmp	r2, #4
 8000d3a:	e92d 43f0 	stmdb	sp!, {r4, r5, r6, r7, r8, r9, lr}
 8000d3e:	d005      	beq.n	8000d4c <RCC_GetClocksFreq+0x1c>
 8000d40:	2a08      	cmp	r2, #8
 8000d42:	d006      	beq.n	8000d52 <RCC_GetClocksFreq+0x22>
 8000d44:	4ba1      	ldr	r3, [pc, #644]	; (8000fcc <RCC_GetClocksFreq+0x29c>)
 8000d46:	6003      	str	r3, [r0, #0]
 8000d48:	b9ba      	cbnz	r2, 8000d7a <RCC_GetClocksFreq+0x4a>
 8000d4a:	e017      	b.n	8000d7c <RCC_GetClocksFreq+0x4c>
 8000d4c:	4b9f      	ldr	r3, [pc, #636]	; (8000fcc <RCC_GetClocksFreq+0x29c>)
 8000d4e:	6003      	str	r3, [r0, #0]
 8000d50:	e013      	b.n	8000d7a <RCC_GetClocksFreq+0x4a>
 8000d52:	6859      	ldr	r1, [r3, #4]
 8000d54:	685c      	ldr	r4, [r3, #4]
 8000d56:	f3c1 4183 	ubfx	r1, r1, #18, #4
 8000d5a:	03e2      	lsls	r2, r4, #15
 8000d5c:	f101 0102 	add.w	r1, r1, #2
 8000d60:	d401      	bmi.n	8000d66 <RCC_GetClocksFreq+0x36>
 8000d62:	4a9b      	ldr	r2, [pc, #620]	; (8000fd0 <RCC_GetClocksFreq+0x2a0>)
 8000d64:	e006      	b.n	8000d74 <RCC_GetClocksFreq+0x44>
 8000d66:	6ada      	ldr	r2, [r3, #44]	; 0x2c
 8000d68:	4b98      	ldr	r3, [pc, #608]	; (8000fcc <RCC_GetClocksFreq+0x29c>)
 8000d6a:	f002 020f 	and.w	r2, r2, #15
 8000d6e:	3201      	adds	r2, #1
 8000d70:	fbb3 f2f2 	udiv	r2, r3, r2
 8000d74:	434a      	muls	r2, r1
 8000d76:	6002      	str	r2, [r0, #0]
 8000d78:	e000      	b.n	8000d7c <RCC_GetClocksFreq+0x4c>
 8000d7a:	2200      	movs	r2, #0
 8000d7c:	4f92      	ldr	r7, [pc, #584]	; (8000fc8 <RCC_GetClocksFreq+0x298>)
 8000d7e:	4d95      	ldr	r5, [pc, #596]	; (8000fd4 <RCC_GetClocksFreq+0x2a4>)
 8000d80:	687b      	ldr	r3, [r7, #4]
 8000d82:	f8df 8254 	ldr.w	r8, [pc, #596]	; 8000fd8 <RCC_GetClocksFreq+0x2a8>
 8000d86:	f3c3 1303 	ubfx	r3, r3, #4, #4
 8000d8a:	5cec      	ldrb	r4, [r5, r3]
 8000d8c:	6803      	ldr	r3, [r0, #0]
 8000d8e:	b2e4      	uxtb	r4, r4
 8000d90:	fa23 f104 	lsr.w	r1, r3, r4
 8000d94:	6041      	str	r1, [r0, #4]
 8000d96:	687e      	ldr	r6, [r7, #4]
 8000d98:	f3c6 2602 	ubfx	r6, r6, #8, #3
 8000d9c:	5dae      	ldrb	r6, [r5, r6]
 8000d9e:	fa21 f606 	lsr.w	r6, r1, r6
 8000da2:	6086      	str	r6, [r0, #8]
 8000da4:	f8d7 c004 	ldr.w	ip, [r7, #4]
 8000da8:	f3cc 2cc2 	ubfx	ip, ip, #11, #3
 8000dac:	f815 500c 	ldrb.w	r5, [r5, ip]
 8000db0:	b2ed      	uxtb	r5, r5
 8000db2:	40e9      	lsrs	r1, r5
 8000db4:	60c1      	str	r1, [r0, #12]
 8000db6:	f8d7 902c 	ldr.w	r9, [r7, #44]	; 0x2c
 8000dba:	f3c9 1904 	ubfx	r9, r9, #4, #5
 8000dbe:	f009 0c0f 	and.w	ip, r9, #15
 8000dc2:	f019 0f10 	tst.w	r9, #16
 8000dc6:	f838 c01c 	ldrh.w	ip, [r8, ip, lsl #1]
 8000dca:	fa1f fc8c 	uxth.w	ip, ip
 8000dce:	d007      	beq.n	8000de0 <RCC_GetClocksFreq+0xb0>
 8000dd0:	f1bc 0f00 	cmp.w	ip, #0
 8000dd4:	d004      	beq.n	8000de0 <RCC_GetClocksFreq+0xb0>
 8000dd6:	fbb2 fcfc 	udiv	ip, r2, ip
 8000dda:	f8c0 c010 	str.w	ip, [r0, #16]
 8000dde:	e000      	b.n	8000de2 <RCC_GetClocksFreq+0xb2>
 8000de0:	6103      	str	r3, [r0, #16]
 8000de2:	6aff      	ldr	r7, [r7, #44]	; 0x2c
 8000de4:	f3c7 2c44 	ubfx	ip, r7, #9, #5
 8000de8:	f00c 070f 	and.w	r7, ip, #15
 8000dec:	f01c 0f10 	tst.w	ip, #16
 8000df0:	f838 7017 	ldrh.w	r7, [r8, r7, lsl #1]
 8000df4:	b2bf      	uxth	r7, r7
 8000df6:	d004      	beq.n	8000e02 <RCC_GetClocksFreq+0xd2>
 8000df8:	b11f      	cbz	r7, 8000e02 <RCC_GetClocksFreq+0xd2>
 8000dfa:	fbb2 f7f7 	udiv	r7, r2, r7
 8000dfe:	6147      	str	r7, [r0, #20]
 8000e00:	e000      	b.n	8000e04 <RCC_GetClocksFreq+0xd4>
 8000e02:	6143      	str	r3, [r0, #20]
 8000e04:	4f70      	ldr	r7, [pc, #448]	; (8000fc8 <RCC_GetClocksFreq+0x298>)
 8000e06:	f8d7 c030 	ldr.w	ip, [r7, #48]	; 0x30
 8000e0a:	f01c 0f10 	tst.w	ip, #16
 8000e0e:	bf0a      	itet	eq
 8000e10:	f8df c1b8 	ldreq.w	ip, [pc, #440]	; 8000fcc <RCC_GetClocksFreq+0x29c>
 8000e14:	6183      	strne	r3, [r0, #24]
 8000e16:	f8c0 c018 	streq.w	ip, [r0, #24]
 8000e1a:	6b3f      	ldr	r7, [r7, #48]	; 0x30
 8000e1c:	06bf      	lsls	r7, r7, #26
 8000e1e:	bf56      	itet	pl
 8000e20:	4f6a      	ldrpl	r7, [pc, #424]	; (8000fcc <RCC_GetClocksFreq+0x29c>)
 8000e22:	61c3      	strmi	r3, [r0, #28]
 8000e24:	61c7      	strpl	r7, [r0, #28]
 8000e26:	4f68      	ldr	r7, [pc, #416]	; (8000fc8 <RCC_GetClocksFreq+0x298>)
 8000e28:	f8d7 c030 	ldr.w	ip, [r7, #48]	; 0x30
 8000e2c:	f01c 0f40 	tst.w	ip, #64	; 0x40
 8000e30:	bf0a      	itet	eq
 8000e32:	f8df c198 	ldreq.w	ip, [pc, #408]	; 8000fcc <RCC_GetClocksFreq+0x29c>
 8000e36:	6203      	strne	r3, [r0, #32]
 8000e38:	f8c0 c020 	streq.w	ip, [r0, #32]
 8000e3c:	6b3f      	ldr	r7, [r7, #48]	; 0x30
 8000e3e:	05ff      	lsls	r7, r7, #23
 8000e40:	d506      	bpl.n	8000e50 <RCC_GetClocksFreq+0x120>
 8000e42:	4293      	cmp	r3, r2
 8000e44:	d104      	bne.n	8000e50 <RCC_GetClocksFreq+0x120>
 8000e46:	42a5      	cmp	r5, r4
 8000e48:	d102      	bne.n	8000e50 <RCC_GetClocksFreq+0x120>
 8000e4a:	005f      	lsls	r7, r3, #1
 8000e4c:	6247      	str	r7, [r0, #36]	; 0x24
 8000e4e:	e000      	b.n	8000e52 <RCC_GetClocksFreq+0x122>
 8000e50:	6241      	str	r1, [r0, #36]	; 0x24
 8000e52:	4f5d      	ldr	r7, [pc, #372]	; (8000fc8 <RCC_GetClocksFreq+0x298>)
 8000e54:	f8d7 c030 	ldr.w	ip, [r7, #48]	; 0x30
 8000e58:	f41c 5f80 	tst.w	ip, #4096	; 0x1000
 8000e5c:	d008      	beq.n	8000e70 <RCC_GetClocksFreq+0x140>
 8000e5e:	4293      	cmp	r3, r2
 8000e60:	d106      	bne.n	8000e70 <RCC_GetClocksFreq+0x140>
 8000e62:	42a5      	cmp	r5, r4
 8000e64:	d104      	bne.n	8000e70 <RCC_GetClocksFreq+0x140>
 8000e66:	ea4f 0c43 	mov.w	ip, r3, lsl #1
 8000e6a:	f8c0 c028 	str.w	ip, [r0, #40]	; 0x28
 8000e6e:	e000      	b.n	8000e72 <RCC_GetClocksFreq+0x142>
 8000e70:	6281      	str	r1, [r0, #40]	; 0x28
 8000e72:	6b3f      	ldr	r7, [r7, #48]	; 0x30
 8000e74:	05bf      	lsls	r7, r7, #22
 8000e76:	d506      	bpl.n	8000e86 <RCC_GetClocksFreq+0x156>
 8000e78:	4293      	cmp	r3, r2
 8000e7a:	d104      	bne.n	8000e86 <RCC_GetClocksFreq+0x156>
 8000e7c:	42a5      	cmp	r5, r4
 8000e7e:	d102      	bne.n	8000e86 <RCC_GetClocksFreq+0x156>
 8000e80:	005f      	lsls	r7, r3, #1
 8000e82:	62c7      	str	r7, [r0, #44]	; 0x2c
 8000e84:	e000      	b.n	8000e88 <RCC_GetClocksFreq+0x158>
 8000e86:	62c1      	str	r1, [r0, #44]	; 0x2c
 8000e88:	4f4f      	ldr	r7, [pc, #316]	; (8000fc8 <RCC_GetClocksFreq+0x298>)
 8000e8a:	f8d7 c030 	ldr.w	ip, [r7, #48]	; 0x30
 8000e8e:	f41c 6f80 	tst.w	ip, #1024	; 0x400
 8000e92:	d008      	beq.n	8000ea6 <RCC_GetClocksFreq+0x176>
 8000e94:	4293      	cmp	r3, r2
 8000e96:	d106      	bne.n	8000ea6 <RCC_GetClocksFreq+0x176>
 8000e98:	42a5      	cmp	r5, r4
 8000e9a:	d104      	bne.n	8000ea6 <RCC_GetClocksFreq+0x176>
 8000e9c:	ea4f 0c43 	mov.w	ip, r3, lsl #1
 8000ea0:	f8c0 c04c 	str.w	ip, [r0, #76]	; 0x4c
 8000ea4:	e000      	b.n	8000ea8 <RCC_GetClocksFreq+0x178>
 8000ea6:	64c1      	str	r1, [r0, #76]	; 0x4c
 8000ea8:	6b3f      	ldr	r7, [r7, #48]	; 0x30
 8000eaa:	053f      	lsls	r7, r7, #20
 8000eac:	d506      	bpl.n	8000ebc <RCC_GetClocksFreq+0x18c>
 8000eae:	4293      	cmp	r3, r2
 8000eb0:	d104      	bne.n	8000ebc <RCC_GetClocksFreq+0x18c>
 8000eb2:	42a5      	cmp	r5, r4
 8000eb4:	d102      	bne.n	8000ebc <RCC_GetClocksFreq+0x18c>
 8000eb6:	005f      	lsls	r7, r3, #1
 8000eb8:	6507      	str	r7, [r0, #80]	; 0x50
 8000eba:	e000      	b.n	8000ebe <RCC_GetClocksFreq+0x18e>
 8000ebc:	6501      	str	r1, [r0, #80]	; 0x50
 8000ebe:	4f42      	ldr	r7, [pc, #264]	; (8000fc8 <RCC_GetClocksFreq+0x298>)
 8000ec0:	f8d7 c030 	ldr.w	ip, [r7, #48]	; 0x30
 8000ec4:	f41c 5f00 	tst.w	ip, #8192	; 0x2000
 8000ec8:	d008      	beq.n	8000edc <RCC_GetClocksFreq+0x1ac>
 8000eca:	4293      	cmp	r3, r2
 8000ecc:	d106      	bne.n	8000edc <RCC_GetClocksFreq+0x1ac>
 8000ece:	42a5      	cmp	r5, r4
 8000ed0:	d104      	bne.n	8000edc <RCC_GetClocksFreq+0x1ac>
 8000ed2:	ea4f 0c43 	mov.w	ip, r3, lsl #1
 8000ed6:	f8c0 c054 	str.w	ip, [r0, #84]	; 0x54
 8000eda:	e000      	b.n	8000ede <RCC_GetClocksFreq+0x1ae>
 8000edc:	6501      	str	r1, [r0, #80]	; 0x50
 8000ede:	6b3f      	ldr	r7, [r7, #48]	; 0x30
 8000ee0:	043f      	lsls	r7, r7, #16
 8000ee2:	d506      	bpl.n	8000ef2 <RCC_GetClocksFreq+0x1c2>
 8000ee4:	4293      	cmp	r3, r2
 8000ee6:	d104      	bne.n	8000ef2 <RCC_GetClocksFreq+0x1c2>
 8000ee8:	42a5      	cmp	r5, r4
 8000eea:	d102      	bne.n	8000ef2 <RCC_GetClocksFreq+0x1c2>
 8000eec:	005a      	lsls	r2, r3, #1
 8000eee:	6582      	str	r2, [r0, #88]	; 0x58
 8000ef0:	e000      	b.n	8000ef4 <RCC_GetClocksFreq+0x1c4>
 8000ef2:	6581      	str	r1, [r0, #88]	; 0x58
 8000ef4:	4a34      	ldr	r2, [pc, #208]	; (8000fc8 <RCC_GetClocksFreq+0x298>)
 8000ef6:	6b14      	ldr	r4, [r2, #48]	; 0x30
 8000ef8:	07a4      	lsls	r4, r4, #30
 8000efa:	d014      	beq.n	8000f26 <RCC_GetClocksFreq+0x1f6>
 8000efc:	6b11      	ldr	r1, [r2, #48]	; 0x30
 8000efe:	f001 0103 	and.w	r1, r1, #3
 8000f02:	2901      	cmp	r1, #1
 8000f04:	d101      	bne.n	8000f0a <RCC_GetClocksFreq+0x1da>
 8000f06:	6383      	str	r3, [r0, #56]	; 0x38
 8000f08:	e00e      	b.n	8000f28 <RCC_GetClocksFreq+0x1f8>
 8000f0a:	6b11      	ldr	r1, [r2, #48]	; 0x30
 8000f0c:	f001 0103 	and.w	r1, r1, #3
 8000f10:	2902      	cmp	r1, #2
 8000f12:	d102      	bne.n	8000f1a <RCC_GetClocksFreq+0x1ea>
 8000f14:	f44f 4100 	mov.w	r1, #32768	; 0x8000
 8000f18:	e005      	b.n	8000f26 <RCC_GetClocksFreq+0x1f6>
 8000f1a:	6b11      	ldr	r1, [r2, #48]	; 0x30
 8000f1c:	f001 0103 	and.w	r1, r1, #3
 8000f20:	2903      	cmp	r1, #3
 8000f22:	d101      	bne.n	8000f28 <RCC_GetClocksFreq+0x1f8>
 8000f24:	4929      	ldr	r1, [pc, #164]	; (8000fcc <RCC_GetClocksFreq+0x29c>)
 8000f26:	6381      	str	r1, [r0, #56]	; 0x38
 8000f28:	6b12      	ldr	r2, [r2, #48]	; 0x30
 8000f2a:	4927      	ldr	r1, [pc, #156]	; (8000fc8 <RCC_GetClocksFreq+0x298>)
 8000f2c:	f412 3f40 	tst.w	r2, #196608	; 0x30000
 8000f30:	d101      	bne.n	8000f36 <RCC_GetClocksFreq+0x206>
 8000f32:	63c6      	str	r6, [r0, #60]	; 0x3c
 8000f34:	e018      	b.n	8000f68 <RCC_GetClocksFreq+0x238>
 8000f36:	6b0a      	ldr	r2, [r1, #48]	; 0x30
 8000f38:	f402 3240 	and.w	r2, r2, #196608	; 0x30000
 8000f3c:	f5b2 3f80 	cmp.w	r2, #65536	; 0x10000
 8000f40:	d101      	bne.n	8000f46 <RCC_GetClocksFreq+0x216>
 8000f42:	63c3      	str	r3, [r0, #60]	; 0x3c
 8000f44:	e010      	b.n	8000f68 <RCC_GetClocksFreq+0x238>
 8000f46:	6b0a      	ldr	r2, [r1, #48]	; 0x30
 8000f48:	f402 3240 	and.w	r2, r2, #196608	; 0x30000
 8000f4c:	f5b2 3f00 	cmp.w	r2, #131072	; 0x20000
 8000f50:	d102      	bne.n	8000f58 <RCC_GetClocksFreq+0x228>
 8000f52:	f44f 4200 	mov.w	r2, #32768	; 0x8000
 8000f56:	e006      	b.n	8000f66 <RCC_GetClocksFreq+0x236>
 8000f58:	6b0a      	ldr	r2, [r1, #48]	; 0x30
 8000f5a:	f402 3240 	and.w	r2, r2, #196608	; 0x30000
 8000f5e:	f5b2 3f40 	cmp.w	r2, #196608	; 0x30000
 8000f62:	d101      	bne.n	8000f68 <RCC_GetClocksFreq+0x238>
 8000f64:	4a19      	ldr	r2, [pc, #100]	; (8000fcc <RCC_GetClocksFreq+0x29c>)
 8000f66:	63c2      	str	r2, [r0, #60]	; 0x3c
 8000f68:	4a17      	ldr	r2, [pc, #92]	; (8000fc8 <RCC_GetClocksFreq+0x298>)
 8000f6a:	6b11      	ldr	r1, [r2, #48]	; 0x30
 8000f6c:	f411 2f40 	tst.w	r1, #786432	; 0xc0000
 8000f70:	d101      	bne.n	8000f76 <RCC_GetClocksFreq+0x246>
 8000f72:	6406      	str	r6, [r0, #64]	; 0x40
 8000f74:	e018      	b.n	8000fa8 <RCC_GetClocksFreq+0x278>
 8000f76:	6b11      	ldr	r1, [r2, #48]	; 0x30
 8000f78:	f401 2140 	and.w	r1, r1, #786432	; 0xc0000
 8000f7c:	f5b1 2f80 	cmp.w	r1, #262144	; 0x40000
 8000f80:	d101      	bne.n	8000f86 <RCC_GetClocksFreq+0x256>
 8000f82:	6403      	str	r3, [r0, #64]	; 0x40
 8000f84:	e010      	b.n	8000fa8 <RCC_GetClocksFreq+0x278>
 8000f86:	6b11      	ldr	r1, [r2, #48]	; 0x30
 8000f88:	f401 2140 	and.w	r1, r1, #786432	; 0xc0000
 8000f8c:	f5b1 2f00 	cmp.w	r1, #524288	; 0x80000
 8000f90:	d102      	bne.n	8000f98 <RCC_GetClocksFreq+0x268>
 8000f92:	f44f 4100 	mov.w	r1, #32768	; 0x8000
 8000f96:	e006      	b.n	8000fa6 <RCC_GetClocksFreq+0x276>
 8000f98:	6b11      	ldr	r1, [r2, #48]	; 0x30
 8000f9a:	f401 2140 	and.w	r1, r1, #786432	; 0xc0000
 8000f9e:	f5b1 2f40 	cmp.w	r1, #786432	; 0xc0000
 8000fa2:	d101      	bne.n	8000fa8 <RCC_GetClocksFreq+0x278>
 8000fa4:	4909      	ldr	r1, [pc, #36]	; (8000fcc <RCC_GetClocksFreq+0x29c>)
 8000fa6:	6401      	str	r1, [r0, #64]	; 0x40
 8000fa8:	6b12      	ldr	r2, [r2, #48]	; 0x30
 8000faa:	4907      	ldr	r1, [pc, #28]	; (8000fc8 <RCC_GetClocksFreq+0x298>)
 8000fac:	f412 1f40 	tst.w	r2, #3145728	; 0x300000
 8000fb0:	d101      	bne.n	8000fb6 <RCC_GetClocksFreq+0x286>
 8000fb2:	6446      	str	r6, [r0, #68]	; 0x44
 8000fb4:	e023      	b.n	8000ffe <RCC_GetClocksFreq+0x2ce>
 8000fb6:	6b0a      	ldr	r2, [r1, #48]	; 0x30
 8000fb8:	f402 1240 	and.w	r2, r2, #3145728	; 0x300000
 8000fbc:	f5b2 1f80 	cmp.w	r2, #1048576	; 0x100000
 8000fc0:	d10c      	bne.n	8000fdc <RCC_GetClocksFreq+0x2ac>
 8000fc2:	6443      	str	r3, [r0, #68]	; 0x44
 8000fc4:	e01b      	b.n	8000ffe <RCC_GetClocksFreq+0x2ce>
 8000fc6:	bf00      	nop
 8000fc8:	40021000 	.word	0x40021000
 8000fcc:	007a1200 	.word	0x007a1200
 8000fd0:	003d0900 	.word	0x003d0900
 8000fd4:	20000020 	.word	0x20000020
 8000fd8:	20000000 	.word	0x20000000
 8000fdc:	6b0a      	ldr	r2, [r1, #48]	; 0x30
 8000fde:	f402 1240 	and.w	r2, r2, #3145728	; 0x300000
 8000fe2:	f5b2 1f00 	cmp.w	r2, #2097152	; 0x200000
 8000fe6:	d102      	bne.n	8000fee <RCC_GetClocksFreq+0x2be>
 8000fe8:	f44f 4200 	mov.w	r2, #32768	; 0x8000
 8000fec:	e006      	b.n	8000ffc <RCC_GetClocksFreq+0x2cc>
 8000fee:	6b0a      	ldr	r2, [r1, #48]	; 0x30
 8000ff0:	f402 1240 	and.w	r2, r2, #3145728	; 0x300000
 8000ff4:	f5b2 1f40 	cmp.w	r2, #3145728	; 0x300000
 8000ff8:	d101      	bne.n	8000ffe <RCC_GetClocksFreq+0x2ce>
 8000ffa:	4a11      	ldr	r2, [pc, #68]	; (8001040 <RCC_GetClocksFreq+0x310>)
 8000ffc:	6442      	str	r2, [r0, #68]	; 0x44
 8000ffe:	4a11      	ldr	r2, [pc, #68]	; (8001044 <RCC_GetClocksFreq+0x314>)
 8001000:	6b11      	ldr	r1, [r2, #48]	; 0x30
 8001002:	f411 0f40 	tst.w	r1, #12582912	; 0xc00000
 8001006:	d102      	bne.n	800100e <RCC_GetClocksFreq+0x2de>
 8001008:	6486      	str	r6, [r0, #72]	; 0x48
 800100a:	e8bd 83f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, pc}
 800100e:	6b11      	ldr	r1, [r2, #48]	; 0x30
 8001010:	f401 0140 	and.w	r1, r1, #12582912	; 0xc00000
 8001014:	f5b1 0f80 	cmp.w	r1, #4194304	; 0x400000
 8001018:	d00f      	beq.n	800103a <RCC_GetClocksFreq+0x30a>
 800101a:	6b13      	ldr	r3, [r2, #48]	; 0x30
 800101c:	f403 0340 	and.w	r3, r3, #12582912	; 0xc00000
 8001020:	f5b3 0f00 	cmp.w	r3, #8388608	; 0x800000
 8001024:	d102      	bne.n	800102c <RCC_GetClocksFreq+0x2fc>
 8001026:	f44f 4300 	mov.w	r3, #32768	; 0x8000
 800102a:	e006      	b.n	800103a <RCC_GetClocksFreq+0x30a>
 800102c:	6b13      	ldr	r3, [r2, #48]	; 0x30
 800102e:	f403 0340 	and.w	r3, r3, #12582912	; 0xc00000
 8001032:	f5b3 0f40 	cmp.w	r3, #12582912	; 0xc00000
 8001036:	d101      	bne.n	800103c <RCC_GetClocksFreq+0x30c>
 8001038:	4b01      	ldr	r3, [pc, #4]	; (8001040 <RCC_GetClocksFreq+0x310>)
 800103a:	6483      	str	r3, [r0, #72]	; 0x48
 800103c:	e8bd 83f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, pc}
 8001040:	007a1200 	.word	0x007a1200
 8001044:	40021000 	.word	0x40021000

08001048 <RCC_AHBPeriphClockCmd>:
 8001048:	bf00      	nop
 800104a:	bf00      	nop
 800104c:	4b04      	ldr	r3, [pc, #16]	; (8001060 <RCC_AHBPeriphClockCmd+0x18>)
 800104e:	695a      	ldr	r2, [r3, #20]
 8001050:	b109      	cbz	r1, 8001056 <RCC_AHBPeriphClockCmd+0xe>
 8001052:	4310      	orrs	r0, r2
 8001054:	e001      	b.n	800105a <RCC_AHBPeriphClockCmd+0x12>
 8001056:	ea22 0000 	bic.w	r0, r2, r0
 800105a:	6158      	str	r0, [r3, #20]
 800105c:	4770      	bx	lr
 800105e:	bf00      	nop
 8001060:	40021000 	.word	0x40021000

08001064 <RCC_APB2PeriphClockCmd>:
 8001064:	bf00      	nop
 8001066:	bf00      	nop
 8001068:	4b04      	ldr	r3, [pc, #16]	; (800107c <RCC_APB2PeriphClockCmd+0x18>)
 800106a:	699a      	ldr	r2, [r3, #24]
 800106c:	b109      	cbz	r1, 8001072 <RCC_APB2PeriphClockCmd+0xe>
 800106e:	4310      	orrs	r0, r2
 8001070:	e001      	b.n	8001076 <RCC_APB2PeriphClockCmd+0x12>
 8001072:	ea22 0000 	bic.w	r0, r2, r0
 8001076:	6198      	str	r0, [r3, #24]
 8001078:	4770      	bx	lr
 800107a:	bf00      	nop
 800107c:	40021000 	.word	0x40021000

08001080 <RCC_APB1PeriphClockCmd>:
 8001080:	bf00      	nop
 8001082:	bf00      	nop
 8001084:	4b04      	ldr	r3, [pc, #16]	; (8001098 <RCC_APB1PeriphClockCmd+0x18>)
 8001086:	69da      	ldr	r2, [r3, #28]
 8001088:	b109      	cbz	r1, 800108e <RCC_APB1PeriphClockCmd+0xe>
 800108a:	4310      	orrs	r0, r2
 800108c:	e001      	b.n	8001092 <RCC_APB1PeriphClockCmd+0x12>
 800108e:	ea22 0000 	bic.w	r0, r2, r0
 8001092:	61d8      	str	r0, [r3, #28]
 8001094:	4770      	bx	lr
 8001096:	bf00      	nop
 8001098:	40021000 	.word	0x40021000

0800109c <TIM_TimeBaseInit>:
 800109c:	bf00      	nop
 800109e:	bf00      	nop
 80010a0:	bf00      	nop
 80010a2:	4a24      	ldr	r2, [pc, #144]	; (8001134 <TIM_TimeBaseInit+0x98>)
 80010a4:	8803      	ldrh	r3, [r0, #0]
 80010a6:	4290      	cmp	r0, r2
 80010a8:	b29b      	uxth	r3, r3
 80010aa:	d012      	beq.n	80010d2 <TIM_TimeBaseInit+0x36>
 80010ac:	f502 6200 	add.w	r2, r2, #2048	; 0x800
 80010b0:	4290      	cmp	r0, r2
 80010b2:	d00e      	beq.n	80010d2 <TIM_TimeBaseInit+0x36>
 80010b4:	f1b0 4f80 	cmp.w	r0, #1073741824	; 0x40000000
 80010b8:	d00b      	beq.n	80010d2 <TIM_TimeBaseInit+0x36>
 80010ba:	f5a2 3298 	sub.w	r2, r2, #77824	; 0x13000
 80010be:	4290      	cmp	r0, r2
 80010c0:	d007      	beq.n	80010d2 <TIM_TimeBaseInit+0x36>
 80010c2:	f502 6280 	add.w	r2, r2, #1024	; 0x400
 80010c6:	4290      	cmp	r0, r2
 80010c8:	d003      	beq.n	80010d2 <TIM_TimeBaseInit+0x36>
 80010ca:	f502 32a4 	add.w	r2, r2, #83968	; 0x14800
 80010ce:	4290      	cmp	r0, r2
 80010d0:	d103      	bne.n	80010da <TIM_TimeBaseInit+0x3e>
 80010d2:	884a      	ldrh	r2, [r1, #2]
 80010d4:	f023 0370 	bic.w	r3, r3, #112	; 0x70
 80010d8:	4313      	orrs	r3, r2
 80010da:	4a17      	ldr	r2, [pc, #92]	; (8001138 <TIM_TimeBaseInit+0x9c>)
 80010dc:	4290      	cmp	r0, r2
 80010de:	d008      	beq.n	80010f2 <TIM_TimeBaseInit+0x56>
 80010e0:	f502 6280 	add.w	r2, r2, #1024	; 0x400
 80010e4:	4290      	cmp	r0, r2
 80010e6:	d004      	beq.n	80010f2 <TIM_TimeBaseInit+0x56>
 80010e8:	f423 7340 	bic.w	r3, r3, #768	; 0x300
 80010ec:	890a      	ldrh	r2, [r1, #8]
 80010ee:	b29b      	uxth	r3, r3
 80010f0:	4313      	orrs	r3, r2
 80010f2:	8003      	strh	r3, [r0, #0]
 80010f4:	684b      	ldr	r3, [r1, #4]
 80010f6:	62c3      	str	r3, [r0, #44]	; 0x2c
 80010f8:	880b      	ldrh	r3, [r1, #0]
 80010fa:	8503      	strh	r3, [r0, #40]	; 0x28
 80010fc:	4b0d      	ldr	r3, [pc, #52]	; (8001134 <TIM_TimeBaseInit+0x98>)
 80010fe:	4298      	cmp	r0, r3
 8001100:	d013      	beq.n	800112a <TIM_TimeBaseInit+0x8e>
 8001102:	f503 6300 	add.w	r3, r3, #2048	; 0x800
 8001106:	4298      	cmp	r0, r3
 8001108:	d00f      	beq.n	800112a <TIM_TimeBaseInit+0x8e>
 800110a:	f503 6340 	add.w	r3, r3, #3072	; 0xc00
 800110e:	4298      	cmp	r0, r3
 8001110:	d00b      	beq.n	800112a <TIM_TimeBaseInit+0x8e>
 8001112:	f503 6380 	add.w	r3, r3, #1024	; 0x400
 8001116:	4298      	cmp	r0, r3
 8001118:	d007      	beq.n	800112a <TIM_TimeBaseInit+0x8e>
 800111a:	f503 6380 	add.w	r3, r3, #1024	; 0x400
 800111e:	4298      	cmp	r0, r3
 8001120:	d003      	beq.n	800112a <TIM_TimeBaseInit+0x8e>
 8001122:	f503 6300 	add.w	r3, r3, #2048	; 0x800
 8001126:	4298      	cmp	r0, r3
 8001128:	d101      	bne.n	800112e <TIM_TimeBaseInit+0x92>
 800112a:	894b      	ldrh	r3, [r1, #10]
 800112c:	8603      	strh	r3, [r0, #48]	; 0x30
 800112e:	2301      	movs	r3, #1
 8001130:	6143      	str	r3, [r0, #20]
 8001132:	4770      	bx	lr
 8001134:	40012c00 	.word	0x40012c00
 8001138:	40001000 	.word	0x40001000

0800113c <TIM_Cmd>:
 800113c:	bf00      	nop
 800113e:	bf00      	nop
 8001140:	8803      	ldrh	r3, [r0, #0]
 8001142:	b119      	cbz	r1, 800114c <TIM_Cmd+0x10>
 8001144:	b29b      	uxth	r3, r3
 8001146:	f043 0301 	orr.w	r3, r3, #1
 800114a:	e003      	b.n	8001154 <TIM_Cmd+0x18>
 800114c:	f023 0301 	bic.w	r3, r3, #1
 8001150:	041b      	lsls	r3, r3, #16
 8001152:	0c1b      	lsrs	r3, r3, #16
 8001154:	8003      	strh	r3, [r0, #0]
 8001156:	4770      	bx	lr

08001158 <TIM_OC1Init>:
 8001158:	b530      	push	{r4, r5, lr}
 800115a:	bf00      	nop
 800115c:	bf00      	nop
 800115e:	bf00      	nop
 8001160:	bf00      	nop
 8001162:	6a03      	ldr	r3, [r0, #32]
 8001164:	680c      	ldr	r4, [r1, #0]
 8001166:	f023 0301 	bic.w	r3, r3, #1
 800116a:	6203      	str	r3, [r0, #32]
 800116c:	6a03      	ldr	r3, [r0, #32]
 800116e:	6842      	ldr	r2, [r0, #4]
 8001170:	6985      	ldr	r5, [r0, #24]
 8001172:	f425 3580 	bic.w	r5, r5, #65536	; 0x10000
 8001176:	f025 0573 	bic.w	r5, r5, #115	; 0x73
 800117a:	432c      	orrs	r4, r5
 800117c:	898d      	ldrh	r5, [r1, #12]
 800117e:	f023 0302 	bic.w	r3, r3, #2
 8001182:	432b      	orrs	r3, r5
 8001184:	888d      	ldrh	r5, [r1, #4]
 8001186:	432b      	orrs	r3, r5
 8001188:	4d15      	ldr	r5, [pc, #84]	; (80011e0 <TIM_OC1Init+0x88>)
 800118a:	42a8      	cmp	r0, r5
 800118c:	d00f      	beq.n	80011ae <TIM_OC1Init+0x56>
 800118e:	f505 6500 	add.w	r5, r5, #2048	; 0x800
 8001192:	42a8      	cmp	r0, r5
 8001194:	d00b      	beq.n	80011ae <TIM_OC1Init+0x56>
 8001196:	f505 6540 	add.w	r5, r5, #3072	; 0xc00
 800119a:	42a8      	cmp	r0, r5
 800119c:	d007      	beq.n	80011ae <TIM_OC1Init+0x56>
 800119e:	f505 6580 	add.w	r5, r5, #1024	; 0x400
 80011a2:	42a8      	cmp	r0, r5
 80011a4:	d003      	beq.n	80011ae <TIM_OC1Init+0x56>
 80011a6:	f505 6580 	add.w	r5, r5, #1024	; 0x400
 80011aa:	42a8      	cmp	r0, r5
 80011ac:	d111      	bne.n	80011d2 <TIM_OC1Init+0x7a>
 80011ae:	bf00      	nop
 80011b0:	bf00      	nop
 80011b2:	bf00      	nop
 80011b4:	bf00      	nop
 80011b6:	89cd      	ldrh	r5, [r1, #14]
 80011b8:	f023 0308 	bic.w	r3, r3, #8
 80011bc:	432b      	orrs	r3, r5
 80011be:	88cd      	ldrh	r5, [r1, #6]
 80011c0:	f023 0304 	bic.w	r3, r3, #4
 80011c4:	432b      	orrs	r3, r5
 80011c6:	8a0d      	ldrh	r5, [r1, #16]
 80011c8:	f422 7240 	bic.w	r2, r2, #768	; 0x300
 80011cc:	432a      	orrs	r2, r5
 80011ce:	8a4d      	ldrh	r5, [r1, #18]
 80011d0:	432a      	orrs	r2, r5
 80011d2:	6042      	str	r2, [r0, #4]
 80011d4:	688a      	ldr	r2, [r1, #8]
 80011d6:	6184      	str	r4, [r0, #24]
 80011d8:	6342      	str	r2, [r0, #52]	; 0x34
 80011da:	6203      	str	r3, [r0, #32]
 80011dc:	bd30      	pop	{r4, r5, pc}
 80011de:	bf00      	nop
 80011e0:	40012c00 	.word	0x40012c00

080011e4 <TIM_OC2Init>:
 80011e4:	b570      	push	{r4, r5, r6, lr}
 80011e6:	bf00      	nop
 80011e8:	bf00      	nop
 80011ea:	bf00      	nop
 80011ec:	bf00      	nop
 80011ee:	6a03      	ldr	r3, [r0, #32]
 80011f0:	680c      	ldr	r4, [r1, #0]
 80011f2:	898e      	ldrh	r6, [r1, #12]
 80011f4:	f023 0310 	bic.w	r3, r3, #16
 80011f8:	6203      	str	r3, [r0, #32]
 80011fa:	6a05      	ldr	r5, [r0, #32]
 80011fc:	6842      	ldr	r2, [r0, #4]
 80011fe:	6983      	ldr	r3, [r0, #24]
 8001200:	f023 7380 	bic.w	r3, r3, #16777216	; 0x1000000
 8001204:	f423 43e6 	bic.w	r3, r3, #29440	; 0x7300
 8001208:	ea43 2404 	orr.w	r4, r3, r4, lsl #8
 800120c:	888b      	ldrh	r3, [r1, #4]
 800120e:	f025 0520 	bic.w	r5, r5, #32
 8001212:	4333      	orrs	r3, r6
 8001214:	ea45 1303 	orr.w	r3, r5, r3, lsl #4
 8001218:	4d10      	ldr	r5, [pc, #64]	; (800125c <TIM_OC2Init+0x78>)
 800121a:	42a8      	cmp	r0, r5
 800121c:	d003      	beq.n	8001226 <TIM_OC2Init+0x42>
 800121e:	f505 6500 	add.w	r5, r5, #2048	; 0x800
 8001222:	42a8      	cmp	r0, r5
 8001224:	d114      	bne.n	8001250 <TIM_OC2Init+0x6c>
 8001226:	bf00      	nop
 8001228:	bf00      	nop
 800122a:	bf00      	nop
 800122c:	bf00      	nop
 800122e:	89cd      	ldrh	r5, [r1, #14]
 8001230:	8a0e      	ldrh	r6, [r1, #16]
 8001232:	f023 0380 	bic.w	r3, r3, #128	; 0x80
 8001236:	ea43 1305 	orr.w	r3, r3, r5, lsl #4
 800123a:	88cd      	ldrh	r5, [r1, #6]
 800123c:	f023 0340 	bic.w	r3, r3, #64	; 0x40
 8001240:	ea43 1305 	orr.w	r3, r3, r5, lsl #4
 8001244:	8a4d      	ldrh	r5, [r1, #18]
 8001246:	f422 6240 	bic.w	r2, r2, #3072	; 0xc00
 800124a:	4335      	orrs	r5, r6
 800124c:	ea42 0285 	orr.w	r2, r2, r5, lsl #2
 8001250:	6042      	str	r2, [r0, #4]
 8001252:	688a      	ldr	r2, [r1, #8]
 8001254:	6184      	str	r4, [r0, #24]
 8001256:	6382      	str	r2, [r0, #56]	; 0x38
 8001258:	6203      	str	r3, [r0, #32]
 800125a:	bd70      	pop	{r4, r5, r6, pc}
 800125c:	40012c00 	.word	0x40012c00

08001260 <TIM_CtrlPWMOutputs>:
 8001260:	bf00      	nop
 8001262:	bf00      	nop
 8001264:	6c43      	ldr	r3, [r0, #68]	; 0x44
 8001266:	b111      	cbz	r1, 800126e <TIM_CtrlPWMOutputs+0xe>
 8001268:	f443 4300 	orr.w	r3, r3, #32768	; 0x8000
 800126c:	e001      	b.n	8001272 <TIM_CtrlPWMOutputs+0x12>
 800126e:	f3c3 030e 	ubfx	r3, r3, #0, #15
 8001272:	6443      	str	r3, [r0, #68]	; 0x44
 8001274:	4770      	bx	lr

08001276 <TIM_ClearITPendingBit>:
 8001276:	bf00      	nop
 8001278:	43c9      	mvns	r1, r1
 800127a:	b289      	uxth	r1, r1
 800127c:	6101      	str	r1, [r0, #16]
 800127e:	4770      	bx	lr

08001280 <timer_init>:
 8001280:	b530      	push	{r4, r5, lr}
 8001282:	2300      	movs	r3, #0
 8001284:	b085      	sub	sp, #20
 8001286:	491f      	ldr	r1, [pc, #124]	; (8001304 <timer_init+0x84>)
 8001288:	f44f 6280 	mov.w	r2, #1024	; 0x400
 800128c:	f821 2013 	strh.w	r2, [r1, r3, lsl #1]
 8001290:	491d      	ldr	r1, [pc, #116]	; (8001308 <timer_init+0x88>)
 8001292:	f821 2013 	strh.w	r2, [r1, r3, lsl #1]
 8001296:	4a1d      	ldr	r2, [pc, #116]	; (800130c <timer_init+0x8c>)
 8001298:	2400      	movs	r4, #0
 800129a:	f822 4013 	strh.w	r4, [r2, r3, lsl #1]
 800129e:	3301      	adds	r3, #1
 80012a0:	2b04      	cmp	r3, #4
 80012a2:	4625      	mov	r5, r4
 80012a4:	d1ef      	bne.n	8001286 <timer_init+0x6>
 80012a6:	4b1a      	ldr	r3, [pc, #104]	; (8001310 <timer_init+0x90>)
 80012a8:	2002      	movs	r0, #2
 80012aa:	2101      	movs	r1, #1
 80012ac:	601c      	str	r4, [r3, #0]
 80012ae:	f7ff fee7 	bl	8001080 <RCC_APB1PeriphClockCmd>
 80012b2:	f8ad 4006 	strh.w	r4, [sp, #6]
 80012b6:	f8ad 400c 	strh.w	r4, [sp, #12]
 80012ba:	f8ad 400e 	strh.w	r4, [sp, #14]
 80012be:	4c15      	ldr	r4, [pc, #84]	; (8001314 <timer_init+0x94>)
 80012c0:	f44f 738c 	mov.w	r3, #280	; 0x118
 80012c4:	f8ad 3004 	strh.w	r3, [sp, #4]
 80012c8:	4620      	mov	r0, r4
 80012ca:	2331      	movs	r3, #49	; 0x31
 80012cc:	a901      	add	r1, sp, #4
 80012ce:	9302      	str	r3, [sp, #8]
 80012d0:	f7ff fee4 	bl	800109c <TIM_TimeBaseInit>
 80012d4:	4620      	mov	r0, r4
 80012d6:	2101      	movs	r1, #1
 80012d8:	f7ff ff30 	bl	800113c <TIM_Cmd>
 80012dc:	68e3      	ldr	r3, [r4, #12]
 80012de:	f043 0301 	orr.w	r3, r3, #1
 80012e2:	60e3      	str	r3, [r4, #12]
 80012e4:	231d      	movs	r3, #29
 80012e6:	f88d 3000 	strb.w	r3, [sp]
 80012ea:	4668      	mov	r0, sp
 80012ec:	2301      	movs	r3, #1
 80012ee:	f88d 5001 	strb.w	r5, [sp, #1]
 80012f2:	f88d 3002 	strb.w	r3, [sp, #2]
 80012f6:	f88d 3003 	strb.w	r3, [sp, #3]
 80012fa:	f000 fc49 	bl	8001b90 <NVIC_Init>
 80012fe:	b005      	add	sp, #20
 8001300:	bd30      	pop	{r4, r5, pc}
 8001302:	bf00      	nop
 8001304:	20000db4 	.word	0x20000db4
 8001308:	20000da8 	.word	0x20000da8
 800130c:	20000da0 	.word	0x20000da0
 8001310:	20000db0 	.word	0x20000db0
 8001314:	40000400 	.word	0x40000400

08001318 <TIM3_IRQHandler>:
 8001318:	2300      	movs	r3, #0
 800131a:	4a10      	ldr	r2, [pc, #64]	; (800135c <TIM3_IRQHandler+0x44>)
 800131c:	f832 1013 	ldrh.w	r1, [r2, r3, lsl #1]
 8001320:	b289      	uxth	r1, r1
 8001322:	b129      	cbz	r1, 8001330 <TIM3_IRQHandler+0x18>
 8001324:	f832 1013 	ldrh.w	r1, [r2, r3, lsl #1]
 8001328:	b289      	uxth	r1, r1
 800132a:	3901      	subs	r1, #1
 800132c:	b289      	uxth	r1, r1
 800132e:	e007      	b.n	8001340 <TIM3_IRQHandler+0x28>
 8001330:	490b      	ldr	r1, [pc, #44]	; (8001360 <TIM3_IRQHandler+0x48>)
 8001332:	f831 1013 	ldrh.w	r1, [r1, r3, lsl #1]
 8001336:	b289      	uxth	r1, r1
 8001338:	f822 1013 	strh.w	r1, [r2, r3, lsl #1]
 800133c:	4a09      	ldr	r2, [pc, #36]	; (8001364 <TIM3_IRQHandler+0x4c>)
 800133e:	2101      	movs	r1, #1
 8001340:	f822 1013 	strh.w	r1, [r2, r3, lsl #1]
 8001344:	3301      	adds	r3, #1
 8001346:	2b04      	cmp	r3, #4
 8001348:	d1e7      	bne.n	800131a <TIM3_IRQHandler+0x2>
 800134a:	4b07      	ldr	r3, [pc, #28]	; (8001368 <TIM3_IRQHandler+0x50>)
 800134c:	4807      	ldr	r0, [pc, #28]	; (800136c <TIM3_IRQHandler+0x54>)
 800134e:	681a      	ldr	r2, [r3, #0]
 8001350:	2101      	movs	r1, #1
 8001352:	3201      	adds	r2, #1
 8001354:	601a      	str	r2, [r3, #0]
 8001356:	f7ff bf8e 	b.w	8001276 <TIM_ClearITPendingBit>
 800135a:	bf00      	nop
 800135c:	20000db4 	.word	0x20000db4
 8001360:	20000da8 	.word	0x20000da8
 8001364:	20000da0 	.word	0x20000da0
 8001368:	20000db0 	.word	0x20000db0
 800136c:	40000400 	.word	0x40000400

08001370 <timer_get_time>:
 8001370:	b082      	sub	sp, #8
 8001372:	b672      	cpsid	i
 8001374:	4b04      	ldr	r3, [pc, #16]	; (8001388 <timer_get_time+0x18>)
 8001376:	681b      	ldr	r3, [r3, #0]
 8001378:	9301      	str	r3, [sp, #4]
 800137a:	b662      	cpsie	i
 800137c:	9801      	ldr	r0, [sp, #4]
 800137e:	230a      	movs	r3, #10
 8001380:	fbb0 f0f3 	udiv	r0, r0, r3
 8001384:	b002      	add	sp, #8
 8001386:	4770      	bx	lr
 8001388:	20000db0 	.word	0x20000db0

0800138c <timer_delay_ms>:
 800138c:	b513      	push	{r0, r1, r4, lr}
 800138e:	4604      	mov	r4, r0
 8001390:	f7ff ffee 	bl	8001370 <timer_get_time>
 8001394:	4420      	add	r0, r4
 8001396:	9001      	str	r0, [sp, #4]
 8001398:	9c01      	ldr	r4, [sp, #4]
 800139a:	f7ff ffe9 	bl	8001370 <timer_get_time>
 800139e:	4284      	cmp	r4, r0
 80013a0:	d902      	bls.n	80013a8 <timer_delay_ms+0x1c>
 80013a2:	f000 faef 	bl	8001984 <sleep>
 80013a6:	e7f7      	b.n	8001398 <timer_delay_ms+0xc>
 80013a8:	b002      	add	sp, #8
 80013aa:	bd10      	pop	{r4, pc}

080013ac <USART_Init>:
 80013ac:	b530      	push	{r4, r5, lr}
 80013ae:	4604      	mov	r4, r0
 80013b0:	b099      	sub	sp, #100	; 0x64
 80013b2:	460d      	mov	r5, r1
 80013b4:	bf00      	nop
 80013b6:	bf00      	nop
 80013b8:	bf00      	nop
 80013ba:	bf00      	nop
 80013bc:	bf00      	nop
 80013be:	bf00      	nop
 80013c0:	bf00      	nop
 80013c2:	6803      	ldr	r3, [r0, #0]
 80013c4:	f023 0301 	bic.w	r3, r3, #1
 80013c8:	6003      	str	r3, [r0, #0]
 80013ca:	6842      	ldr	r2, [r0, #4]
 80013cc:	688b      	ldr	r3, [r1, #8]
 80013ce:	f422 5240 	bic.w	r2, r2, #12288	; 0x3000
 80013d2:	4313      	orrs	r3, r2
 80013d4:	6043      	str	r3, [r0, #4]
 80013d6:	686a      	ldr	r2, [r5, #4]
 80013d8:	68eb      	ldr	r3, [r5, #12]
 80013da:	6801      	ldr	r1, [r0, #0]
 80013dc:	431a      	orrs	r2, r3
 80013de:	692b      	ldr	r3, [r5, #16]
 80013e0:	f421 51b0 	bic.w	r1, r1, #5632	; 0x1600
 80013e4:	f021 010c 	bic.w	r1, r1, #12
 80013e8:	4313      	orrs	r3, r2
 80013ea:	430b      	orrs	r3, r1
 80013ec:	6003      	str	r3, [r0, #0]
 80013ee:	6882      	ldr	r2, [r0, #8]
 80013f0:	696b      	ldr	r3, [r5, #20]
 80013f2:	f422 7240 	bic.w	r2, r2, #768	; 0x300
 80013f6:	4313      	orrs	r3, r2
 80013f8:	6083      	str	r3, [r0, #8]
 80013fa:	a801      	add	r0, sp, #4
 80013fc:	f7ff fc98 	bl	8000d30 <RCC_GetClocksFreq>
 8001400:	4b17      	ldr	r3, [pc, #92]	; (8001460 <USART_Init+0xb4>)
 8001402:	429c      	cmp	r4, r3
 8001404:	d101      	bne.n	800140a <USART_Init+0x5e>
 8001406:	9a0f      	ldr	r2, [sp, #60]	; 0x3c
 8001408:	e00e      	b.n	8001428 <USART_Init+0x7c>
 800140a:	4b16      	ldr	r3, [pc, #88]	; (8001464 <USART_Init+0xb8>)
 800140c:	429c      	cmp	r4, r3
 800140e:	d101      	bne.n	8001414 <USART_Init+0x68>
 8001410:	9a10      	ldr	r2, [sp, #64]	; 0x40
 8001412:	e009      	b.n	8001428 <USART_Init+0x7c>
 8001414:	4b14      	ldr	r3, [pc, #80]	; (8001468 <USART_Init+0xbc>)
 8001416:	429c      	cmp	r4, r3
 8001418:	d101      	bne.n	800141e <USART_Init+0x72>
 800141a:	9a11      	ldr	r2, [sp, #68]	; 0x44
 800141c:	e004      	b.n	8001428 <USART_Init+0x7c>
 800141e:	4b13      	ldr	r3, [pc, #76]	; (800146c <USART_Init+0xc0>)
 8001420:	429c      	cmp	r4, r3
 8001422:	bf0c      	ite	eq
 8001424:	9a12      	ldreq	r2, [sp, #72]	; 0x48
 8001426:	9a13      	ldrne	r2, [sp, #76]	; 0x4c
 8001428:	6823      	ldr	r3, [r4, #0]
 800142a:	6829      	ldr	r1, [r5, #0]
 800142c:	f413 4f00 	tst.w	r3, #32768	; 0x8000
 8001430:	bf18      	it	ne
 8001432:	0052      	lslne	r2, r2, #1
 8001434:	fbb2 f3f1 	udiv	r3, r2, r1
 8001438:	fb01 2213 	mls	r2, r1, r3, r2
 800143c:	ebb2 0f51 	cmp.w	r2, r1, lsr #1
 8001440:	6822      	ldr	r2, [r4, #0]
 8001442:	bf28      	it	cs
 8001444:	3301      	addcs	r3, #1
 8001446:	0412      	lsls	r2, r2, #16
 8001448:	d506      	bpl.n	8001458 <USART_Init+0xac>
 800144a:	f64f 72f0 	movw	r2, #65520	; 0xfff0
 800144e:	f3c3 0142 	ubfx	r1, r3, #1, #3
 8001452:	401a      	ands	r2, r3
 8001454:	ea41 0302 	orr.w	r3, r1, r2
 8001458:	b29b      	uxth	r3, r3
 800145a:	81a3      	strh	r3, [r4, #12]
 800145c:	b019      	add	sp, #100	; 0x64
 800145e:	bd30      	pop	{r4, r5, pc}
 8001460:	40013800 	.word	0x40013800
 8001464:	40004400 	.word	0x40004400
 8001468:	40004800 	.word	0x40004800
 800146c:	40004c00 	.word	0x40004c00

08001470 <USART_Cmd>:
 8001470:	bf00      	nop
 8001472:	bf00      	nop
 8001474:	6803      	ldr	r3, [r0, #0]
 8001476:	b111      	cbz	r1, 800147e <USART_Cmd+0xe>
 8001478:	f043 0301 	orr.w	r3, r3, #1
 800147c:	e001      	b.n	8001482 <USART_Cmd+0x12>
 800147e:	f023 0301 	bic.w	r3, r3, #1
 8001482:	6003      	str	r3, [r0, #0]
 8001484:	4770      	bx	lr

08001486 <USART_ReceiveData>:
 8001486:	bf00      	nop
 8001488:	8c80      	ldrh	r0, [r0, #36]	; 0x24
 800148a:	f3c0 0008 	ubfx	r0, r0, #0, #9
 800148e:	4770      	bx	lr

08001490 <USART_ITConfig>:
 8001490:	b510      	push	{r4, lr}
 8001492:	bf00      	nop
 8001494:	bf00      	nop
 8001496:	bf00      	nop
 8001498:	f3c1 2307 	ubfx	r3, r1, #8, #8
 800149c:	2401      	movs	r4, #1
 800149e:	b2c9      	uxtb	r1, r1
 80014a0:	2b02      	cmp	r3, #2
 80014a2:	fa04 f101 	lsl.w	r1, r4, r1
 80014a6:	d101      	bne.n	80014ac <USART_ITConfig+0x1c>
 80014a8:	3004      	adds	r0, #4
 80014aa:	e002      	b.n	80014b2 <USART_ITConfig+0x22>
 80014ac:	2b03      	cmp	r3, #3
 80014ae:	bf08      	it	eq
 80014b0:	3008      	addeq	r0, #8
 80014b2:	6803      	ldr	r3, [r0, #0]
 80014b4:	b10a      	cbz	r2, 80014ba <USART_ITConfig+0x2a>
 80014b6:	4319      	orrs	r1, r3
 80014b8:	e001      	b.n	80014be <USART_ITConfig+0x2e>
 80014ba:	ea23 0101 	bic.w	r1, r3, r1
 80014be:	6001      	str	r1, [r0, #0]
 80014c0:	bd10      	pop	{r4, pc}

080014c2 <USART_GetITStatus>:
 80014c2:	b510      	push	{r4, lr}
 80014c4:	bf00      	nop
 80014c6:	bf00      	nop
 80014c8:	2401      	movs	r4, #1
 80014ca:	f3c1 2207 	ubfx	r2, r1, #8, #8
 80014ce:	b2cb      	uxtb	r3, r1
 80014d0:	42a2      	cmp	r2, r4
 80014d2:	fa04 f303 	lsl.w	r3, r4, r3
 80014d6:	d101      	bne.n	80014dc <USART_GetITStatus+0x1a>
 80014d8:	6802      	ldr	r2, [r0, #0]
 80014da:	e003      	b.n	80014e4 <USART_GetITStatus+0x22>
 80014dc:	2a02      	cmp	r2, #2
 80014de:	bf0c      	ite	eq
 80014e0:	6842      	ldreq	r2, [r0, #4]
 80014e2:	6882      	ldrne	r2, [r0, #8]
 80014e4:	4013      	ands	r3, r2
 80014e6:	69c2      	ldr	r2, [r0, #28]
 80014e8:	b143      	cbz	r3, 80014fc <USART_GetITStatus+0x3a>
 80014ea:	2301      	movs	r3, #1
 80014ec:	0c09      	lsrs	r1, r1, #16
 80014ee:	fa03 f101 	lsl.w	r1, r3, r1
 80014f2:	4211      	tst	r1, r2
 80014f4:	bf0c      	ite	eq
 80014f6:	2000      	moveq	r0, #0
 80014f8:	2001      	movne	r0, #1
 80014fa:	bd10      	pop	{r4, pc}
 80014fc:	4618      	mov	r0, r3
 80014fe:	bd10      	pop	{r4, pc}

08001500 <USART_ClearITPendingBit>:
 8001500:	bf00      	nop
 8001502:	bf00      	nop
 8001504:	2301      	movs	r3, #1
 8001506:	0c09      	lsrs	r1, r1, #16
 8001508:	fa03 f101 	lsl.w	r1, r3, r1
 800150c:	6201      	str	r1, [r0, #32]
 800150e:	4770      	bx	lr

08001510 <uart_write>:
 8001510:	4b03      	ldr	r3, [pc, #12]	; (8001520 <uart_write+0x10>)
 8001512:	69da      	ldr	r2, [r3, #28]
 8001514:	0612      	lsls	r2, r2, #24
 8001516:	d401      	bmi.n	800151c <uart_write+0xc>
 8001518:	bf00      	nop
 800151a:	e7f9      	b.n	8001510 <uart_write>
 800151c:	8518      	strh	r0, [r3, #40]	; 0x28
 800151e:	4770      	bx	lr
 8001520:	40013800 	.word	0x40013800

08001524 <uart_init>:
 8001524:	b530      	push	{r4, r5, lr}
 8001526:	4b2c      	ldr	r3, [pc, #176]	; (80015d8 <uart_init+0xb4>)
 8001528:	4d2c      	ldr	r5, [pc, #176]	; (80015dc <uart_init+0xb8>)
 800152a:	2400      	movs	r4, #0
 800152c:	601c      	str	r4, [r3, #0]
 800152e:	4b2c      	ldr	r3, [pc, #176]	; (80015e0 <uart_init+0xbc>)
 8001530:	b08b      	sub	sp, #44	; 0x2c
 8001532:	f44f 3000 	mov.w	r0, #131072	; 0x20000
 8001536:	2101      	movs	r1, #1
 8001538:	601c      	str	r4, [r3, #0]
 800153a:	f7ff fd85 	bl	8001048 <RCC_AHBPeriphClockCmd>
 800153e:	f44f 4080 	mov.w	r0, #16384	; 0x4000
 8001542:	2101      	movs	r1, #1
 8001544:	f7ff fd8e 	bl	8001064 <RCC_APB2PeriphClockCmd>
 8001548:	f44f 63c0 	mov.w	r3, #1536	; 0x600
 800154c:	9302      	str	r3, [sp, #8]
 800154e:	2302      	movs	r3, #2
 8001550:	f88d 300c 	strb.w	r3, [sp, #12]
 8001554:	a902      	add	r1, sp, #8
 8001556:	2303      	movs	r3, #3
 8001558:	f04f 4090 	mov.w	r0, #1207959552	; 0x48000000
 800155c:	f88d 300d 	strb.w	r3, [sp, #13]
 8001560:	f88d 400e 	strb.w	r4, [sp, #14]
 8001564:	f88d 400f 	strb.w	r4, [sp, #15]
 8001568:	f000 fb5b 	bl	8001c22 <GPIO_Init>
 800156c:	f04f 4090 	mov.w	r0, #1207959552	; 0x48000000
 8001570:	2109      	movs	r1, #9
 8001572:	2207      	movs	r2, #7
 8001574:	f000 fba3 	bl	8001cbe <GPIO_PinAFConfig>
 8001578:	2207      	movs	r2, #7
 800157a:	f04f 4090 	mov.w	r0, #1207959552	; 0x48000000
 800157e:	210a      	movs	r1, #10
 8001580:	f000 fb9d 	bl	8001cbe <GPIO_PinAFConfig>
 8001584:	f44f 33e1 	mov.w	r3, #115200	; 0x1c200
 8001588:	9304      	str	r3, [sp, #16]
 800158a:	4628      	mov	r0, r5
 800158c:	230c      	movs	r3, #12
 800158e:	a904      	add	r1, sp, #16
 8001590:	9308      	str	r3, [sp, #32]
 8001592:	9405      	str	r4, [sp, #20]
 8001594:	9406      	str	r4, [sp, #24]
 8001596:	9407      	str	r4, [sp, #28]
 8001598:	9409      	str	r4, [sp, #36]	; 0x24
 800159a:	f7ff ff07 	bl	80013ac <USART_Init>
 800159e:	4628      	mov	r0, r5
 80015a0:	2101      	movs	r1, #1
 80015a2:	f7ff ff65 	bl	8001470 <USART_Cmd>
 80015a6:	2201      	movs	r2, #1
 80015a8:	4628      	mov	r0, r5
 80015aa:	490e      	ldr	r1, [pc, #56]	; (80015e4 <uart_init+0xc0>)
 80015ac:	f7ff ff70 	bl	8001490 <USART_ITConfig>
 80015b0:	2325      	movs	r3, #37	; 0x25
 80015b2:	f88d 4005 	strb.w	r4, [sp, #5]
 80015b6:	f88d 4006 	strb.w	r4, [sp, #6]
 80015ba:	a801      	add	r0, sp, #4
 80015bc:	2401      	movs	r4, #1
 80015be:	f88d 3004 	strb.w	r3, [sp, #4]
 80015c2:	f88d 4007 	strb.w	r4, [sp, #7]
 80015c6:	f000 fae3 	bl	8001b90 <NVIC_Init>
 80015ca:	4628      	mov	r0, r5
 80015cc:	4621      	mov	r1, r4
 80015ce:	f7ff ff4f 	bl	8001470 <USART_Cmd>
 80015d2:	b00b      	add	sp, #44	; 0x2c
 80015d4:	bd30      	pop	{r4, r5, pc}
 80015d6:	bf00      	nop
 80015d8:	20000dcc 	.word	0x20000dcc
 80015dc:	40013800 	.word	0x40013800
 80015e0:	20000dd0 	.word	0x20000dd0
 80015e4:	00050105 	.word	0x00050105

080015e8 <USART1_IRQHandler>:
 80015e8:	b508      	push	{r3, lr}
 80015ea:	480d      	ldr	r0, [pc, #52]	; (8001620 <USART1_IRQHandler+0x38>)
 80015ec:	490d      	ldr	r1, [pc, #52]	; (8001624 <USART1_IRQHandler+0x3c>)
 80015ee:	f7ff ff68 	bl	80014c2 <USART_GetITStatus>
 80015f2:	b178      	cbz	r0, 8001614 <USART1_IRQHandler+0x2c>
 80015f4:	480a      	ldr	r0, [pc, #40]	; (8001620 <USART1_IRQHandler+0x38>)
 80015f6:	f7ff ff46 	bl	8001486 <USART_ReceiveData>
 80015fa:	4b0b      	ldr	r3, [pc, #44]	; (8001628 <USART1_IRQHandler+0x40>)
 80015fc:	490b      	ldr	r1, [pc, #44]	; (800162c <USART1_IRQHandler+0x44>)
 80015fe:	681a      	ldr	r2, [r3, #0]
 8001600:	b2c0      	uxtb	r0, r0
 8001602:	5488      	strb	r0, [r1, r2]
 8001604:	681a      	ldr	r2, [r3, #0]
 8001606:	3201      	adds	r2, #1
 8001608:	601a      	str	r2, [r3, #0]
 800160a:	681a      	ldr	r2, [r3, #0]
 800160c:	2a0f      	cmp	r2, #15
 800160e:	bf84      	itt	hi
 8001610:	2200      	movhi	r2, #0
 8001612:	601a      	strhi	r2, [r3, #0]
 8001614:	4802      	ldr	r0, [pc, #8]	; (8001620 <USART1_IRQHandler+0x38>)
 8001616:	4903      	ldr	r1, [pc, #12]	; (8001624 <USART1_IRQHandler+0x3c>)
 8001618:	e8bd 4008 	ldmia.w	sp!, {r3, lr}
 800161c:	f7ff bf70 	b.w	8001500 <USART_ClearITPendingBit>
 8001620:	40013800 	.word	0x40013800
 8001624:	00050105 	.word	0x00050105
 8001628:	20000dcc 	.word	0x20000dcc
 800162c:	20000dbc 	.word	0x20000dbc

08001630 <i2c_delay>:
 8001630:	230b      	movs	r3, #11
 8001632:	3b01      	subs	r3, #1
 8001634:	d001      	beq.n	800163a <i2c_delay+0xa>
 8001636:	bf00      	nop
 8001638:	e7fb      	b.n	8001632 <i2c_delay+0x2>
 800163a:	4770      	bx	lr

0800163c <SetLowSDA>:
 800163c:	b537      	push	{r0, r1, r2, r4, r5, lr}
 800163e:	4d0d      	ldr	r5, [pc, #52]	; (8001674 <SetLowSDA+0x38>)
 8001640:	2301      	movs	r3, #1
 8001642:	2203      	movs	r2, #3
 8001644:	2480      	movs	r4, #128	; 0x80
 8001646:	f88d 3004 	strb.w	r3, [sp, #4]
 800164a:	f88d 3006 	strb.w	r3, [sp, #6]
 800164e:	4628      	mov	r0, r5
 8001650:	2300      	movs	r3, #0
 8001652:	4669      	mov	r1, sp
 8001654:	f88d 2005 	strb.w	r2, [sp, #5]
 8001658:	f88d 3007 	strb.w	r3, [sp, #7]
 800165c:	9400      	str	r4, [sp, #0]
 800165e:	f000 fae0 	bl	8001c22 <GPIO_Init>
 8001662:	4628      	mov	r0, r5
 8001664:	4621      	mov	r1, r4
 8001666:	f000 fb26 	bl	8001cb6 <GPIO_ResetBits>
 800166a:	f7ff ffe1 	bl	8001630 <i2c_delay>
 800166e:	b003      	add	sp, #12
 8001670:	bd30      	pop	{r4, r5, pc}
 8001672:	bf00      	nop
 8001674:	48000400 	.word	0x48000400

08001678 <SetHighSDA>:
 8001678:	b537      	push	{r0, r1, r2, r4, r5, lr}
 800167a:	4d0d      	ldr	r5, [pc, #52]	; (80016b0 <SetHighSDA+0x38>)
 800167c:	2203      	movs	r2, #3
 800167e:	2300      	movs	r3, #0
 8001680:	2480      	movs	r4, #128	; 0x80
 8001682:	f88d 2005 	strb.w	r2, [sp, #5]
 8001686:	4628      	mov	r0, r5
 8001688:	2201      	movs	r2, #1
 800168a:	4669      	mov	r1, sp
 800168c:	f88d 3004 	strb.w	r3, [sp, #4]
 8001690:	f88d 2006 	strb.w	r2, [sp, #6]
 8001694:	f88d 3007 	strb.w	r3, [sp, #7]
 8001698:	9400      	str	r4, [sp, #0]
 800169a:	f000 fac2 	bl	8001c22 <GPIO_Init>
 800169e:	4628      	mov	r0, r5
 80016a0:	4621      	mov	r1, r4
 80016a2:	f000 fb04 	bl	8001cae <GPIO_SetBits>
 80016a6:	f7ff ffc3 	bl	8001630 <i2c_delay>
 80016aa:	b003      	add	sp, #12
 80016ac:	bd30      	pop	{r4, r5, pc}
 80016ae:	bf00      	nop
 80016b0:	48000400 	.word	0x48000400

080016b4 <SetLowSCL>:
 80016b4:	b508      	push	{r3, lr}
 80016b6:	4804      	ldr	r0, [pc, #16]	; (80016c8 <SetLowSCL+0x14>)
 80016b8:	2140      	movs	r1, #64	; 0x40
 80016ba:	f000 fafc 	bl	8001cb6 <GPIO_ResetBits>
 80016be:	e8bd 4008 	ldmia.w	sp!, {r3, lr}
 80016c2:	f7ff bfb5 	b.w	8001630 <i2c_delay>
 80016c6:	bf00      	nop
 80016c8:	48000400 	.word	0x48000400

080016cc <SetHighSCL>:
 80016cc:	b508      	push	{r3, lr}
 80016ce:	4804      	ldr	r0, [pc, #16]	; (80016e0 <SetHighSCL+0x14>)
 80016d0:	2140      	movs	r1, #64	; 0x40
 80016d2:	f000 faec 	bl	8001cae <GPIO_SetBits>
 80016d6:	e8bd 4008 	ldmia.w	sp!, {r3, lr}
 80016da:	f7ff bfa9 	b.w	8001630 <i2c_delay>
 80016de:	bf00      	nop
 80016e0:	48000400 	.word	0x48000400

080016e4 <i2c_0_init>:
 80016e4:	b507      	push	{r0, r1, r2, lr}
 80016e6:	f44f 2080 	mov.w	r0, #262144	; 0x40000
 80016ea:	2101      	movs	r1, #1
 80016ec:	f7ff fcac 	bl	8001048 <RCC_AHBPeriphClockCmd>
 80016f0:	23c0      	movs	r3, #192	; 0xc0
 80016f2:	9300      	str	r3, [sp, #0]
 80016f4:	2301      	movs	r3, #1
 80016f6:	2203      	movs	r2, #3
 80016f8:	480a      	ldr	r0, [pc, #40]	; (8001724 <i2c_0_init+0x40>)
 80016fa:	f88d 3004 	strb.w	r3, [sp, #4]
 80016fe:	4669      	mov	r1, sp
 8001700:	f88d 3006 	strb.w	r3, [sp, #6]
 8001704:	2300      	movs	r3, #0
 8001706:	f88d 2005 	strb.w	r2, [sp, #5]
 800170a:	f88d 3007 	strb.w	r3, [sp, #7]
 800170e:	f000 fa88 	bl	8001c22 <GPIO_Init>
 8001712:	f7ff ffdb 	bl	80016cc <SetHighSCL>
 8001716:	f7ff ff91 	bl	800163c <SetLowSDA>
 800171a:	f7ff ffad 	bl	8001678 <SetHighSDA>
 800171e:	b003      	add	sp, #12
 8001720:	f85d fb04 	ldr.w	pc, [sp], #4
 8001724:	48000400 	.word	0x48000400

08001728 <i2cStart>:
 8001728:	b508      	push	{r3, lr}
 800172a:	f7ff ffcf 	bl	80016cc <SetHighSCL>
 800172e:	f7ff ffa3 	bl	8001678 <SetHighSDA>
 8001732:	f7ff ffcb 	bl	80016cc <SetHighSCL>
 8001736:	f7ff ff81 	bl	800163c <SetLowSDA>
 800173a:	f7ff ffbb 	bl	80016b4 <SetLowSCL>
 800173e:	e8bd 4008 	ldmia.w	sp!, {r3, lr}
 8001742:	f7ff bf99 	b.w	8001678 <SetHighSDA>

08001746 <i2cStop>:
 8001746:	b508      	push	{r3, lr}
 8001748:	f7ff ffb4 	bl	80016b4 <SetLowSCL>
 800174c:	f7ff ff76 	bl	800163c <SetLowSDA>
 8001750:	f7ff ffbc 	bl	80016cc <SetHighSCL>
 8001754:	f7ff ff72 	bl	800163c <SetLowSDA>
 8001758:	f7ff ffb8 	bl	80016cc <SetHighSCL>
 800175c:	e8bd 4008 	ldmia.w	sp!, {r3, lr}
 8001760:	f7ff bf8a 	b.w	8001678 <SetHighSDA>

08001764 <i2cWrite>:
 8001764:	b538      	push	{r3, r4, r5, lr}
 8001766:	4604      	mov	r4, r0
 8001768:	2508      	movs	r5, #8
 800176a:	f7ff ffa3 	bl	80016b4 <SetLowSCL>
 800176e:	0623      	lsls	r3, r4, #24
 8001770:	d502      	bpl.n	8001778 <i2cWrite+0x14>
 8001772:	f7ff ff81 	bl	8001678 <SetHighSDA>
 8001776:	e001      	b.n	800177c <i2cWrite+0x18>
 8001778:	f7ff ff60 	bl	800163c <SetLowSDA>
 800177c:	3d01      	subs	r5, #1
 800177e:	f7ff ffa5 	bl	80016cc <SetHighSCL>
 8001782:	0064      	lsls	r4, r4, #1
 8001784:	f015 05ff 	ands.w	r5, r5, #255	; 0xff
 8001788:	b2e4      	uxtb	r4, r4
 800178a:	d1ee      	bne.n	800176a <i2cWrite+0x6>
 800178c:	f7ff ff92 	bl	80016b4 <SetLowSCL>
 8001790:	f7ff ff72 	bl	8001678 <SetHighSDA>
 8001794:	f7ff ff9a 	bl	80016cc <SetHighSCL>
 8001798:	4b05      	ldr	r3, [pc, #20]	; (80017b0 <i2cWrite+0x4c>)
 800179a:	8a1c      	ldrh	r4, [r3, #16]
 800179c:	b2a4      	uxth	r4, r4
 800179e:	f7ff ff89 	bl	80016b4 <SetLowSCL>
 80017a2:	f7ff ff45 	bl	8001630 <i2c_delay>
 80017a6:	f084 0080 	eor.w	r0, r4, #128	; 0x80
 80017aa:	f3c0 10c0 	ubfx	r0, r0, #7, #1
 80017ae:	bd38      	pop	{r3, r4, r5, pc}
 80017b0:	48000400 	.word	0x48000400

080017b4 <i2cRead>:
 80017b4:	b570      	push	{r4, r5, r6, lr}
 80017b6:	4606      	mov	r6, r0
 80017b8:	f7ff ff7c 	bl	80016b4 <SetLowSCL>
 80017bc:	f7ff ff5c 	bl	8001678 <SetHighSDA>
 80017c0:	2508      	movs	r5, #8
 80017c2:	2400      	movs	r4, #0
 80017c4:	f7ff ff82 	bl	80016cc <SetHighSCL>
 80017c8:	4b0d      	ldr	r3, [pc, #52]	; (8001800 <i2cRead+0x4c>)
 80017ca:	8a1b      	ldrh	r3, [r3, #16]
 80017cc:	0064      	lsls	r4, r4, #1
 80017ce:	061a      	lsls	r2, r3, #24
 80017d0:	b2e4      	uxtb	r4, r4
 80017d2:	bf48      	it	mi
 80017d4:	3401      	addmi	r4, #1
 80017d6:	f105 35ff 	add.w	r5, r5, #4294967295
 80017da:	bf48      	it	mi
 80017dc:	b2e4      	uxtbmi	r4, r4
 80017de:	f7ff ff69 	bl	80016b4 <SetLowSCL>
 80017e2:	f015 05ff 	ands.w	r5, r5, #255	; 0xff
 80017e6:	d1ed      	bne.n	80017c4 <i2cRead+0x10>
 80017e8:	b10e      	cbz	r6, 80017ee <i2cRead+0x3a>
 80017ea:	f7ff ff27 	bl	800163c <SetLowSDA>
 80017ee:	f7ff ff6d 	bl	80016cc <SetHighSCL>
 80017f2:	f7ff ff5f 	bl	80016b4 <SetLowSCL>
 80017f6:	f7ff ff1b 	bl	8001630 <i2c_delay>
 80017fa:	4620      	mov	r0, r4
 80017fc:	bd70      	pop	{r4, r5, r6, pc}
 80017fe:	bf00      	nop
 8001800:	48000400 	.word	0x48000400

08001804 <i2c_write_reg>:
 8001804:	b570      	push	{r4, r5, r6, lr}
 8001806:	4605      	mov	r5, r0
 8001808:	460c      	mov	r4, r1
 800180a:	4616      	mov	r6, r2
 800180c:	f7ff ff8c 	bl	8001728 <i2cStart>
 8001810:	4628      	mov	r0, r5
 8001812:	f7ff ffa7 	bl	8001764 <i2cWrite>
 8001816:	4620      	mov	r0, r4
 8001818:	f7ff ffa4 	bl	8001764 <i2cWrite>
 800181c:	4630      	mov	r0, r6
 800181e:	f7ff ffa1 	bl	8001764 <i2cWrite>
 8001822:	e8bd 4070 	ldmia.w	sp!, {r4, r5, r6, lr}
 8001826:	f7ff bf8e 	b.w	8001746 <i2cStop>

0800182a <i2c_read_reg>:
 800182a:	b538      	push	{r3, r4, r5, lr}
 800182c:	4604      	mov	r4, r0
 800182e:	460d      	mov	r5, r1
 8001830:	f7ff ff7a 	bl	8001728 <i2cStart>
 8001834:	4620      	mov	r0, r4
 8001836:	f7ff ff95 	bl	8001764 <i2cWrite>
 800183a:	4628      	mov	r0, r5
 800183c:	f7ff ff92 	bl	8001764 <i2cWrite>
 8001840:	f7ff ff72 	bl	8001728 <i2cStart>
 8001844:	f044 0001 	orr.w	r0, r4, #1
 8001848:	f7ff ff8c 	bl	8001764 <i2cWrite>
 800184c:	2000      	movs	r0, #0
 800184e:	f7ff ffb1 	bl	80017b4 <i2cRead>
 8001852:	4604      	mov	r4, r0
 8001854:	f7ff ff77 	bl	8001746 <i2cStop>
 8001858:	4620      	mov	r0, r4
 800185a:	bd38      	pop	{r3, r4, r5, pc}

0800185c <SystemInit>:
 800185c:	4b3b      	ldr	r3, [pc, #236]	; (800194c <SystemInit+0xf0>)
 800185e:	f8d3 2088 	ldr.w	r2, [r3, #136]	; 0x88
 8001862:	f442 0270 	orr.w	r2, r2, #15728640	; 0xf00000
 8001866:	f8c3 2088 	str.w	r2, [r3, #136]	; 0x88
 800186a:	4b39      	ldr	r3, [pc, #228]	; (8001950 <SystemInit+0xf4>)
 800186c:	681a      	ldr	r2, [r3, #0]
 800186e:	f042 0201 	orr.w	r2, r2, #1
 8001872:	601a      	str	r2, [r3, #0]
 8001874:	6859      	ldr	r1, [r3, #4]
 8001876:	4a37      	ldr	r2, [pc, #220]	; (8001954 <SystemInit+0xf8>)
 8001878:	400a      	ands	r2, r1
 800187a:	605a      	str	r2, [r3, #4]
 800187c:	681a      	ldr	r2, [r3, #0]
 800187e:	f022 7284 	bic.w	r2, r2, #17301504	; 0x1080000
 8001882:	f422 3280 	bic.w	r2, r2, #65536	; 0x10000
 8001886:	601a      	str	r2, [r3, #0]
 8001888:	681a      	ldr	r2, [r3, #0]
 800188a:	f422 2280 	bic.w	r2, r2, #262144	; 0x40000
 800188e:	601a      	str	r2, [r3, #0]
 8001890:	685a      	ldr	r2, [r3, #4]
 8001892:	f422 02fe 	bic.w	r2, r2, #8323072	; 0x7f0000
 8001896:	605a      	str	r2, [r3, #4]
 8001898:	6ada      	ldr	r2, [r3, #44]	; 0x2c
 800189a:	f022 020f 	bic.w	r2, r2, #15
 800189e:	62da      	str	r2, [r3, #44]	; 0x2c
 80018a0:	6b19      	ldr	r1, [r3, #48]	; 0x30
 80018a2:	4a2d      	ldr	r2, [pc, #180]	; (8001958 <SystemInit+0xfc>)
 80018a4:	b082      	sub	sp, #8
 80018a6:	400a      	ands	r2, r1
 80018a8:	631a      	str	r2, [r3, #48]	; 0x30
 80018aa:	2200      	movs	r2, #0
 80018ac:	609a      	str	r2, [r3, #8]
 80018ae:	9200      	str	r2, [sp, #0]
 80018b0:	9201      	str	r2, [sp, #4]
 80018b2:	681a      	ldr	r2, [r3, #0]
 80018b4:	f442 3280 	orr.w	r2, r2, #65536	; 0x10000
 80018b8:	601a      	str	r2, [r3, #0]
 80018ba:	4b25      	ldr	r3, [pc, #148]	; (8001950 <SystemInit+0xf4>)
 80018bc:	681a      	ldr	r2, [r3, #0]
 80018be:	f402 3200 	and.w	r2, r2, #131072	; 0x20000
 80018c2:	9201      	str	r2, [sp, #4]
 80018c4:	9a00      	ldr	r2, [sp, #0]
 80018c6:	3201      	adds	r2, #1
 80018c8:	9200      	str	r2, [sp, #0]
 80018ca:	9a01      	ldr	r2, [sp, #4]
 80018cc:	b91a      	cbnz	r2, 80018d6 <SystemInit+0x7a>
 80018ce:	9a00      	ldr	r2, [sp, #0]
 80018d0:	f5b2 4fa0 	cmp.w	r2, #20480	; 0x5000
 80018d4:	d1f1      	bne.n	80018ba <SystemInit+0x5e>
 80018d6:	681b      	ldr	r3, [r3, #0]
 80018d8:	f413 3300 	ands.w	r3, r3, #131072	; 0x20000
 80018dc:	bf18      	it	ne
 80018de:	2301      	movne	r3, #1
 80018e0:	9301      	str	r3, [sp, #4]
 80018e2:	9b01      	ldr	r3, [sp, #4]
 80018e4:	2b01      	cmp	r3, #1
 80018e6:	d005      	beq.n	80018f4 <SystemInit+0x98>
 80018e8:	4b18      	ldr	r3, [pc, #96]	; (800194c <SystemInit+0xf0>)
 80018ea:	f04f 6200 	mov.w	r2, #134217728	; 0x8000000
 80018ee:	609a      	str	r2, [r3, #8]
 80018f0:	b002      	add	sp, #8
 80018f2:	4770      	bx	lr
 80018f4:	4b19      	ldr	r3, [pc, #100]	; (800195c <SystemInit+0x100>)
 80018f6:	2212      	movs	r2, #18
 80018f8:	601a      	str	r2, [r3, #0]
 80018fa:	f5a3 5380 	sub.w	r3, r3, #4096	; 0x1000
 80018fe:	685a      	ldr	r2, [r3, #4]
 8001900:	605a      	str	r2, [r3, #4]
 8001902:	685a      	ldr	r2, [r3, #4]
 8001904:	605a      	str	r2, [r3, #4]
 8001906:	685a      	ldr	r2, [r3, #4]
 8001908:	f442 6280 	orr.w	r2, r2, #1024	; 0x400
 800190c:	605a      	str	r2, [r3, #4]
 800190e:	685a      	ldr	r2, [r3, #4]
 8001910:	f422 127c 	bic.w	r2, r2, #4128768	; 0x3f0000
 8001914:	605a      	str	r2, [r3, #4]
 8001916:	685a      	ldr	r2, [r3, #4]
 8001918:	f442 12e8 	orr.w	r2, r2, #1900544	; 0x1d0000
 800191c:	605a      	str	r2, [r3, #4]
 800191e:	681a      	ldr	r2, [r3, #0]
 8001920:	f042 7280 	orr.w	r2, r2, #16777216	; 0x1000000
 8001924:	601a      	str	r2, [r3, #0]
 8001926:	6819      	ldr	r1, [r3, #0]
 8001928:	4a09      	ldr	r2, [pc, #36]	; (8001950 <SystemInit+0xf4>)
 800192a:	0189      	lsls	r1, r1, #6
 800192c:	d5fb      	bpl.n	8001926 <SystemInit+0xca>
 800192e:	6853      	ldr	r3, [r2, #4]
 8001930:	f023 0303 	bic.w	r3, r3, #3
 8001934:	6053      	str	r3, [r2, #4]
 8001936:	6853      	ldr	r3, [r2, #4]
 8001938:	f043 0302 	orr.w	r3, r3, #2
 800193c:	6053      	str	r3, [r2, #4]
 800193e:	4b04      	ldr	r3, [pc, #16]	; (8001950 <SystemInit+0xf4>)
 8001940:	685b      	ldr	r3, [r3, #4]
 8001942:	f003 030c 	and.w	r3, r3, #12
 8001946:	2b08      	cmp	r3, #8
 8001948:	d1f9      	bne.n	800193e <SystemInit+0xe2>
 800194a:	e7cd      	b.n	80018e8 <SystemInit+0x8c>
 800194c:	e000ed00 	.word	0xe000ed00
 8001950:	40021000 	.word	0x40021000
 8001954:	f87fc00c 	.word	0xf87fc00c
 8001958:	ff00fccc 	.word	0xff00fccc
 800195c:	40022000 	.word	0x40022000

08001960 <sys_tick_init>:
 8001960:	4b05      	ldr	r3, [pc, #20]	; (8001978 <sys_tick_init+0x18>)
 8001962:	4a06      	ldr	r2, [pc, #24]	; (800197c <sys_tick_init+0x1c>)
 8001964:	605a      	str	r2, [r3, #4]
 8001966:	4a06      	ldr	r2, [pc, #24]	; (8001980 <sys_tick_init+0x20>)
 8001968:	21f0      	movs	r1, #240	; 0xf0
 800196a:	f882 1023 	strb.w	r1, [r2, #35]	; 0x23
 800196e:	2200      	movs	r2, #0
 8001970:	609a      	str	r2, [r3, #8]
 8001972:	2207      	movs	r2, #7
 8001974:	601a      	str	r2, [r3, #0]
 8001976:	4770      	bx	lr
 8001978:	e000e010 	.word	0xe000e010
 800197c:	00029040 	.word	0x00029040
 8001980:	e000ed00 	.word	0xe000ed00

08001984 <sleep>:
 8001984:	bf30      	wfi
 8001986:	4770      	bx	lr

08001988 <sytem_clock_init>:
 8001988:	f7ff bf68 	b.w	800185c <SystemInit>

0800198c <pwm_set>:
 800198c:	e92d 41f0 	stmdb	sp!, {r4, r5, r6, r7, r8, lr}
 8001990:	b086      	sub	sp, #24
 8001992:	2370      	movs	r3, #112	; 0x70
 8001994:	9301      	str	r3, [sp, #4]
 8001996:	2301      	movs	r3, #1
 8001998:	f8ad 3008 	strh.w	r3, [sp, #8]
 800199c:	2304      	movs	r3, #4
 800199e:	f8ad 300a 	strh.w	r3, [sp, #10]
 80019a2:	4f17      	ldr	r7, [pc, #92]	; (8001a00 <pwm_set+0x74>)
 80019a4:	4c17      	ldr	r4, [pc, #92]	; (8001a04 <pwm_set+0x78>)
 80019a6:	2302      	movs	r3, #2
 80019a8:	f8ad 3010 	strh.w	r3, [sp, #16]
 80019ac:	2300      	movs	r3, #0
 80019ae:	f8ad 3012 	strh.w	r3, [sp, #18]
 80019b2:	f8ad 3016 	strh.w	r3, [sp, #22]
 80019b6:	683b      	ldr	r3, [r7, #0]
 80019b8:	f242 7610 	movw	r6, #10000	; 0x2710
 80019bc:	fbb3 f3f6 	udiv	r3, r3, r6
 80019c0:	3b02      	subs	r3, #2
 80019c2:	4358      	muls	r0, r3
 80019c4:	2564      	movs	r5, #100	; 0x64
 80019c6:	fbb0 f3f5 	udiv	r3, r0, r5
 80019ca:	f44f 7280 	mov.w	r2, #256	; 0x100
 80019ce:	4620      	mov	r0, r4
 80019d0:	4688      	mov	r8, r1
 80019d2:	a901      	add	r1, sp, #4
 80019d4:	f8ad 2014 	strh.w	r2, [sp, #20]
 80019d8:	9303      	str	r3, [sp, #12]
 80019da:	f7ff fbbd 	bl	8001158 <TIM_OC1Init>
 80019de:	683b      	ldr	r3, [r7, #0]
 80019e0:	fbb3 f6f6 	udiv	r6, r3, r6
 80019e4:	3e02      	subs	r6, #2
 80019e6:	fb06 f808 	mul.w	r8, r6, r8
 80019ea:	fbb8 f5f5 	udiv	r5, r8, r5
 80019ee:	4620      	mov	r0, r4
 80019f0:	a901      	add	r1, sp, #4
 80019f2:	9503      	str	r5, [sp, #12]
 80019f4:	f7ff fbf6 	bl	80011e4 <TIM_OC2Init>
 80019f8:	b006      	add	sp, #24
 80019fa:	e8bd 81f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, pc}
 80019fe:	bf00      	nop
 8001a00:	20000030 	.word	0x20000030
 8001a04:	40012c00 	.word	0x40012c00

08001a08 <pwm_init>:
 8001a08:	b530      	push	{r4, r5, lr}
 8001a0a:	f44f 6000 	mov.w	r0, #2048	; 0x800
 8001a0e:	b087      	sub	sp, #28
 8001a10:	2101      	movs	r1, #1
 8001a12:	f7ff fb27 	bl	8001064 <RCC_APB2PeriphClockCmd>
 8001a16:	f44f 2080 	mov.w	r0, #262144	; 0x40000
 8001a1a:	2101      	movs	r1, #1
 8001a1c:	f7ff fb14 	bl	8001048 <RCC_AHBPeriphClockCmd>
 8001a20:	4c1d      	ldr	r4, [pc, #116]	; (8001a98 <pwm_init+0x90>)
 8001a22:	4d1e      	ldr	r5, [pc, #120]	; (8001a9c <pwm_init+0x94>)
 8001a24:	f44f 43c0 	mov.w	r3, #24576	; 0x6000
 8001a28:	9301      	str	r3, [sp, #4]
 8001a2a:	2302      	movs	r3, #2
 8001a2c:	f88d 3008 	strb.w	r3, [sp, #8]
 8001a30:	4620      	mov	r0, r4
 8001a32:	2303      	movs	r3, #3
 8001a34:	a901      	add	r1, sp, #4
 8001a36:	f88d 3009 	strb.w	r3, [sp, #9]
 8001a3a:	f000 f8f2 	bl	8001c22 <GPIO_Init>
 8001a3e:	4620      	mov	r0, r4
 8001a40:	210d      	movs	r1, #13
 8001a42:	2206      	movs	r2, #6
 8001a44:	f000 f93b 	bl	8001cbe <GPIO_PinAFConfig>
 8001a48:	4620      	mov	r0, r4
 8001a4a:	210e      	movs	r1, #14
 8001a4c:	2206      	movs	r2, #6
 8001a4e:	f000 f936 	bl	8001cbe <GPIO_PinAFConfig>
 8001a52:	4b13      	ldr	r3, [pc, #76]	; (8001aa0 <pwm_init+0x98>)
 8001a54:	681a      	ldr	r2, [r3, #0]
 8001a56:	f242 7310 	movw	r3, #10000	; 0x2710
 8001a5a:	fbb2 f3f3 	udiv	r3, r2, r3
 8001a5e:	2400      	movs	r4, #0
 8001a60:	3b01      	subs	r3, #1
 8001a62:	4628      	mov	r0, r5
 8001a64:	a903      	add	r1, sp, #12
 8001a66:	9304      	str	r3, [sp, #16]
 8001a68:	f8ad 400c 	strh.w	r4, [sp, #12]
 8001a6c:	f8ad 400e 	strh.w	r4, [sp, #14]
 8001a70:	f8ad 4014 	strh.w	r4, [sp, #20]
 8001a74:	f8ad 4016 	strh.w	r4, [sp, #22]
 8001a78:	f7ff fb10 	bl	800109c <TIM_TimeBaseInit>
 8001a7c:	4620      	mov	r0, r4
 8001a7e:	4621      	mov	r1, r4
 8001a80:	f7ff ff84 	bl	800198c <pwm_set>
 8001a84:	4628      	mov	r0, r5
 8001a86:	2101      	movs	r1, #1
 8001a88:	f7ff fb58 	bl	800113c <TIM_Cmd>
 8001a8c:	4628      	mov	r0, r5
 8001a8e:	2101      	movs	r1, #1
 8001a90:	f7ff fbe6 	bl	8001260 <TIM_CtrlPWMOutputs>
 8001a94:	b007      	add	sp, #28
 8001a96:	bd30      	pop	{r4, r5, pc}
 8001a98:	48000400 	.word	0x48000400
 8001a9c:	40012c00 	.word	0x40012c00
 8001aa0:	20000030 	.word	0x20000030

08001aa4 <drv8834_run>:
 8001aa4:	1e02      	subs	r2, r0, #0
 8001aa6:	4b18      	ldr	r3, [pc, #96]	; (8001b08 <drv8834_run+0x64>)
 8001aa8:	dd09      	ble.n	8001abe <drv8834_run+0x1a>
 8001aaa:	6998      	ldr	r0, [r3, #24]
 8001aac:	f040 0008 	orr.w	r0, r0, #8
 8001ab0:	6198      	str	r0, [r3, #24]
 8001ab2:	f04f 4390 	mov.w	r3, #1207959552	; 0x48000000
 8001ab6:	f44f 4000 	mov.w	r0, #32768	; 0x8000
 8001aba:	6198      	str	r0, [r3, #24]
 8001abc:	e00b      	b.n	8001ad6 <drv8834_run+0x32>
 8001abe:	8d18      	ldrh	r0, [r3, #40]	; 0x28
 8001ac0:	b280      	uxth	r0, r0
 8001ac2:	f040 0008 	orr.w	r0, r0, #8
 8001ac6:	8518      	strh	r0, [r3, #40]	; 0x28
 8001ac8:	f04f 4390 	mov.w	r3, #1207959552	; 0x48000000
 8001acc:	f44f 4000 	mov.w	r0, #32768	; 0x8000
 8001ad0:	4252      	negs	r2, r2
 8001ad2:	8518      	strh	r0, [r3, #40]	; 0x28
 8001ad4:	b212      	sxth	r2, r2
 8001ad6:	2900      	cmp	r1, #0
 8001ad8:	4b0b      	ldr	r3, [pc, #44]	; (8001b08 <drv8834_run+0x64>)
 8001ada:	dd05      	ble.n	8001ae8 <drv8834_run+0x44>
 8001adc:	8d18      	ldrh	r0, [r3, #40]	; 0x28
 8001ade:	b280      	uxth	r0, r0
 8001ae0:	f040 0020 	orr.w	r0, r0, #32
 8001ae4:	8518      	strh	r0, [r3, #40]	; 0x28
 8001ae6:	e005      	b.n	8001af4 <drv8834_run+0x50>
 8001ae8:	6998      	ldr	r0, [r3, #24]
 8001aea:	4249      	negs	r1, r1
 8001aec:	f040 0020 	orr.w	r0, r0, #32
 8001af0:	6198      	str	r0, [r3, #24]
 8001af2:	b209      	sxth	r1, r1
 8001af4:	2964      	cmp	r1, #100	; 0x64
 8001af6:	bfb4      	ite	lt
 8001af8:	4608      	movlt	r0, r1
 8001afa:	2064      	movge	r0, #100	; 0x64
 8001afc:	2a64      	cmp	r2, #100	; 0x64
 8001afe:	bfb4      	ite	lt
 8001b00:	4611      	movlt	r1, r2
 8001b02:	2164      	movge	r1, #100	; 0x64
 8001b04:	f7ff bf42 	b.w	800198c <pwm_set>
 8001b08:	48000400 	.word	0x48000400

08001b0c <drv8834_init>:
 8001b0c:	b5f7      	push	{r0, r1, r2, r4, r5, r6, r7, lr}
 8001b0e:	4d1f      	ldr	r5, [pc, #124]	; (8001b8c <drv8834_init+0x80>)
 8001b10:	2400      	movs	r4, #0
 8001b12:	2603      	movs	r6, #3
 8001b14:	2338      	movs	r3, #56	; 0x38
 8001b16:	2701      	movs	r7, #1
 8001b18:	4628      	mov	r0, r5
 8001b1a:	4669      	mov	r1, sp
 8001b1c:	9300      	str	r3, [sp, #0]
 8001b1e:	f88d 7004 	strb.w	r7, [sp, #4]
 8001b22:	f88d 4006 	strb.w	r4, [sp, #6]
 8001b26:	f88d 6005 	strb.w	r6, [sp, #5]
 8001b2a:	f88d 4007 	strb.w	r4, [sp, #7]
 8001b2e:	f000 f878 	bl	8001c22 <GPIO_Init>
 8001b32:	2308      	movs	r3, #8
 8001b34:	9300      	str	r3, [sp, #0]
 8001b36:	4628      	mov	r0, r5
 8001b38:	2302      	movs	r3, #2
 8001b3a:	4669      	mov	r1, sp
 8001b3c:	f88d 3004 	strb.w	r3, [sp, #4]
 8001b40:	f88d 4006 	strb.w	r4, [sp, #6]
 8001b44:	f88d 6005 	strb.w	r6, [sp, #5]
 8001b48:	f88d 4007 	strb.w	r4, [sp, #7]
 8001b4c:	f000 f869 	bl	8001c22 <GPIO_Init>
 8001b50:	220f      	movs	r2, #15
 8001b52:	4628      	mov	r0, r5
 8001b54:	4631      	mov	r1, r6
 8001b56:	f000 f8b2 	bl	8001cbe <GPIO_PinAFConfig>
 8001b5a:	f44f 4300 	mov.w	r3, #32768	; 0x8000
 8001b5e:	4669      	mov	r1, sp
 8001b60:	f04f 4090 	mov.w	r0, #1207959552	; 0x48000000
 8001b64:	9300      	str	r3, [sp, #0]
 8001b66:	f88d 7004 	strb.w	r7, [sp, #4]
 8001b6a:	f88d 4006 	strb.w	r4, [sp, #6]
 8001b6e:	f88d 6005 	strb.w	r6, [sp, #5]
 8001b72:	f88d 4007 	strb.w	r4, [sp, #7]
 8001b76:	f000 f854 	bl	8001c22 <GPIO_Init>
 8001b7a:	2310      	movs	r3, #16
 8001b7c:	852b      	strh	r3, [r5, #40]	; 0x28
 8001b7e:	4620      	mov	r0, r4
 8001b80:	4621      	mov	r1, r4
 8001b82:	f7ff ff8f 	bl	8001aa4 <drv8834_run>
 8001b86:	b003      	add	sp, #12
 8001b88:	bdf0      	pop	{r4, r5, r6, r7, pc}
 8001b8a:	bf00      	nop
 8001b8c:	48000400 	.word	0x48000400

08001b90 <NVIC_Init>:
 8001b90:	b510      	push	{r4, lr}
 8001b92:	bf00      	nop
 8001b94:	bf00      	nop
 8001b96:	bf00      	nop
 8001b98:	78c2      	ldrb	r2, [r0, #3]
 8001b9a:	7803      	ldrb	r3, [r0, #0]
 8001b9c:	b30a      	cbz	r2, 8001be2 <NVIC_Init+0x52>
 8001b9e:	4a16      	ldr	r2, [pc, #88]	; (8001bf8 <NVIC_Init+0x68>)
 8001ba0:	7844      	ldrb	r4, [r0, #1]
 8001ba2:	68d2      	ldr	r2, [r2, #12]
 8001ba4:	43d2      	mvns	r2, r2
 8001ba6:	f3c2 2202 	ubfx	r2, r2, #8, #3
 8001baa:	f1c2 0104 	rsb	r1, r2, #4
 8001bae:	b2c9      	uxtb	r1, r1
 8001bb0:	fa04 f101 	lsl.w	r1, r4, r1
 8001bb4:	240f      	movs	r4, #15
 8001bb6:	fa44 f202 	asr.w	r2, r4, r2
 8001bba:	7884      	ldrb	r4, [r0, #2]
 8001bbc:	b2c9      	uxtb	r1, r1
 8001bbe:	4022      	ands	r2, r4
 8001bc0:	430a      	orrs	r2, r1
 8001bc2:	f103 4360 	add.w	r3, r3, #3758096384	; 0xe0000000
 8001bc6:	f503 4361 	add.w	r3, r3, #57600	; 0xe100
 8001bca:	0112      	lsls	r2, r2, #4
 8001bcc:	b2d2      	uxtb	r2, r2
 8001bce:	f883 2300 	strb.w	r2, [r3, #768]	; 0x300
 8001bd2:	7803      	ldrb	r3, [r0, #0]
 8001bd4:	2201      	movs	r2, #1
 8001bd6:	0959      	lsrs	r1, r3, #5
 8001bd8:	f003 031f 	and.w	r3, r3, #31
 8001bdc:	fa02 f303 	lsl.w	r3, r2, r3
 8001be0:	e006      	b.n	8001bf0 <NVIC_Init+0x60>
 8001be2:	0959      	lsrs	r1, r3, #5
 8001be4:	2201      	movs	r2, #1
 8001be6:	f003 031f 	and.w	r3, r3, #31
 8001bea:	fa02 f303 	lsl.w	r3, r2, r3
 8001bee:	3120      	adds	r1, #32
 8001bf0:	4a02      	ldr	r2, [pc, #8]	; (8001bfc <NVIC_Init+0x6c>)
 8001bf2:	f842 3021 	str.w	r3, [r2, r1, lsl #2]
 8001bf6:	bd10      	pop	{r4, pc}
 8001bf8:	e000ed00 	.word	0xe000ed00
 8001bfc:	e000e100 	.word	0xe000e100

08001c00 <lib_low_level_init>:
 8001c00:	b508      	push	{r3, lr}
 8001c02:	f7ff fec1 	bl	8001988 <sytem_clock_init>
 8001c06:	f000 f871 	bl	8001cec <gpio_init>
 8001c0a:	f7ff fc8b 	bl	8001524 <uart_init>
 8001c0e:	f7ff fb37 	bl	8001280 <timer_init>
 8001c12:	f7ff fef9 	bl	8001a08 <pwm_init>
 8001c16:	f7ff ff79 	bl	8001b0c <drv8834_init>
 8001c1a:	e8bd 4008 	ldmia.w	sp!, {r3, lr}
 8001c1e:	f7ff bd61 	b.w	80016e4 <i2c_0_init>

08001c22 <GPIO_Init>:
 8001c22:	b5f0      	push	{r4, r5, r6, r7, lr}
 8001c24:	bf00      	nop
 8001c26:	bf00      	nop
 8001c28:	bf00      	nop
 8001c2a:	bf00      	nop
 8001c2c:	2300      	movs	r3, #0
 8001c2e:	680e      	ldr	r6, [r1, #0]
 8001c30:	461a      	mov	r2, r3
 8001c32:	2501      	movs	r5, #1
 8001c34:	4095      	lsls	r5, r2
 8001c36:	ea05 0406 	and.w	r4, r5, r6
 8001c3a:	42ac      	cmp	r4, r5
 8001c3c:	d131      	bne.n	8001ca2 <GPIO_Init+0x80>
 8001c3e:	790d      	ldrb	r5, [r1, #4]
 8001c40:	1e6f      	subs	r7, r5, #1
 8001c42:	b2ff      	uxtb	r7, r7
 8001c44:	2f01      	cmp	r7, #1
 8001c46:	d81c      	bhi.n	8001c82 <GPIO_Init+0x60>
 8001c48:	bf00      	nop
 8001c4a:	f04f 0c03 	mov.w	ip, #3
 8001c4e:	6887      	ldr	r7, [r0, #8]
 8001c50:	fa0c fc03 	lsl.w	ip, ip, r3
 8001c54:	ea27 070c 	bic.w	r7, r7, ip
 8001c58:	6087      	str	r7, [r0, #8]
 8001c5a:	f891 c005 	ldrb.w	ip, [r1, #5]
 8001c5e:	6887      	ldr	r7, [r0, #8]
 8001c60:	fa0c fc03 	lsl.w	ip, ip, r3
 8001c64:	ea4c 0707 	orr.w	r7, ip, r7
 8001c68:	6087      	str	r7, [r0, #8]
 8001c6a:	bf00      	nop
 8001c6c:	8887      	ldrh	r7, [r0, #4]
 8001c6e:	b2bf      	uxth	r7, r7
 8001c70:	ea27 0404 	bic.w	r4, r7, r4
 8001c74:	8084      	strh	r4, [r0, #4]
 8001c76:	798c      	ldrb	r4, [r1, #6]
 8001c78:	8887      	ldrh	r7, [r0, #4]
 8001c7a:	4094      	lsls	r4, r2
 8001c7c:	433c      	orrs	r4, r7
 8001c7e:	b2a4      	uxth	r4, r4
 8001c80:	8084      	strh	r4, [r0, #4]
 8001c82:	2403      	movs	r4, #3
 8001c84:	6807      	ldr	r7, [r0, #0]
 8001c86:	409c      	lsls	r4, r3
 8001c88:	43e4      	mvns	r4, r4
 8001c8a:	4027      	ands	r7, r4
 8001c8c:	6007      	str	r7, [r0, #0]
 8001c8e:	6807      	ldr	r7, [r0, #0]
 8001c90:	409d      	lsls	r5, r3
 8001c92:	433d      	orrs	r5, r7
 8001c94:	6005      	str	r5, [r0, #0]
 8001c96:	68c5      	ldr	r5, [r0, #12]
 8001c98:	402c      	ands	r4, r5
 8001c9a:	79cd      	ldrb	r5, [r1, #7]
 8001c9c:	409d      	lsls	r5, r3
 8001c9e:	432c      	orrs	r4, r5
 8001ca0:	60c4      	str	r4, [r0, #12]
 8001ca2:	3201      	adds	r2, #1
 8001ca4:	2a10      	cmp	r2, #16
 8001ca6:	f103 0302 	add.w	r3, r3, #2
 8001caa:	d1c2      	bne.n	8001c32 <GPIO_Init+0x10>
 8001cac:	bdf0      	pop	{r4, r5, r6, r7, pc}

08001cae <GPIO_SetBits>:
 8001cae:	bf00      	nop
 8001cb0:	bf00      	nop
 8001cb2:	6181      	str	r1, [r0, #24]
 8001cb4:	4770      	bx	lr

08001cb6 <GPIO_ResetBits>:
 8001cb6:	bf00      	nop
 8001cb8:	bf00      	nop
 8001cba:	8501      	strh	r1, [r0, #40]	; 0x28
 8001cbc:	4770      	bx	lr

08001cbe <GPIO_PinAFConfig>:
 8001cbe:	b510      	push	{r4, lr}
 8001cc0:	bf00      	nop
 8001cc2:	bf00      	nop
 8001cc4:	bf00      	nop
 8001cc6:	f001 0307 	and.w	r3, r1, #7
 8001cca:	08c9      	lsrs	r1, r1, #3
 8001ccc:	eb00 0081 	add.w	r0, r0, r1, lsl #2
 8001cd0:	009b      	lsls	r3, r3, #2
 8001cd2:	6a04      	ldr	r4, [r0, #32]
 8001cd4:	210f      	movs	r1, #15
 8001cd6:	4099      	lsls	r1, r3
 8001cd8:	ea24 0101 	bic.w	r1, r4, r1
 8001cdc:	6201      	str	r1, [r0, #32]
 8001cde:	6a01      	ldr	r1, [r0, #32]
 8001ce0:	fa02 f303 	lsl.w	r3, r2, r3
 8001ce4:	430b      	orrs	r3, r1
 8001ce6:	6203      	str	r3, [r0, #32]
 8001ce8:	bd10      	pop	{r4, pc}
	...

08001cec <gpio_init>:
 8001cec:	b5f7      	push	{r0, r1, r2, r4, r5, r6, r7, lr}
 8001cee:	f44f 3000 	mov.w	r0, #131072	; 0x20000
 8001cf2:	2101      	movs	r1, #1
 8001cf4:	f7ff f9a8 	bl	8001048 <RCC_AHBPeriphClockCmd>
 8001cf8:	4d16      	ldr	r5, [pc, #88]	; (8001d54 <gpio_init+0x68>)
 8001cfa:	f44f 2080 	mov.w	r0, #262144	; 0x40000
 8001cfe:	2101      	movs	r1, #1
 8001d00:	f7ff f9a2 	bl	8001048 <RCC_AHBPeriphClockCmd>
 8001d04:	f44f 2000 	mov.w	r0, #524288	; 0x80000
 8001d08:	2101      	movs	r1, #1
 8001d0a:	f7ff f99d 	bl	8001048 <RCC_AHBPeriphClockCmd>
 8001d0e:	2400      	movs	r4, #0
 8001d10:	f44f 4600 	mov.w	r6, #32768	; 0x8000
 8001d14:	2301      	movs	r3, #1
 8001d16:	2703      	movs	r7, #3
 8001d18:	4628      	mov	r0, r5
 8001d1a:	4669      	mov	r1, sp
 8001d1c:	f88d 3004 	strb.w	r3, [sp, #4]
 8001d20:	9600      	str	r6, [sp, #0]
 8001d22:	f88d 4006 	strb.w	r4, [sp, #6]
 8001d26:	f88d 7005 	strb.w	r7, [sp, #5]
 8001d2a:	f88d 4007 	strb.w	r4, [sp, #7]
 8001d2e:	f7ff ff78 	bl	8001c22 <GPIO_Init>
 8001d32:	f44f 7300 	mov.w	r3, #512	; 0x200
 8001d36:	4628      	mov	r0, r5
 8001d38:	4669      	mov	r1, sp
 8001d3a:	9300      	str	r3, [sp, #0]
 8001d3c:	f88d 4004 	strb.w	r4, [sp, #4]
 8001d40:	f88d 7005 	strb.w	r7, [sp, #5]
 8001d44:	f88d 4007 	strb.w	r4, [sp, #7]
 8001d48:	f7ff ff6b 	bl	8001c22 <GPIO_Init>
 8001d4c:	61ae      	str	r6, [r5, #24]
 8001d4e:	b003      	add	sp, #12
 8001d50:	bdf0      	pop	{r4, r5, r6, r7, pc}
 8001d52:	bf00      	nop
 8001d54:	48000400 	.word	0x48000400

08001d58 <led_on>:
 8001d58:	0403      	lsls	r3, r0, #16
 8001d5a:	d503      	bpl.n	8001d64 <led_on+0xc>
 8001d5c:	4b02      	ldr	r3, [pc, #8]	; (8001d68 <led_on+0x10>)
 8001d5e:	f44f 4200 	mov.w	r2, #32768	; 0x8000
 8001d62:	619a      	str	r2, [r3, #24]
 8001d64:	4770      	bx	lr
 8001d66:	bf00      	nop
 8001d68:	48000400 	.word	0x48000400

08001d6c <led_off>:
 8001d6c:	0402      	lsls	r2, r0, #16
 8001d6e:	d503      	bpl.n	8001d78 <led_off+0xc>
 8001d70:	4b02      	ldr	r3, [pc, #8]	; (8001d7c <led_off+0x10>)
 8001d72:	f44f 4200 	mov.w	r2, #32768	; 0x8000
 8001d76:	851a      	strh	r2, [r3, #40]	; 0x28
 8001d78:	4770      	bx	lr
 8001d7a:	bf00      	nop
 8001d7c:	48000400 	.word	0x48000400

08001d80 <Default_Handler>:
 8001d80:	4668      	mov	r0, sp
 8001d82:	f020 0107 	bic.w	r1, r0, #7
 8001d86:	468d      	mov	sp, r1
 8001d88:	bf00      	nop
 8001d8a:	e7fd      	b.n	8001d88 <Default_Handler+0x8>

08001d8c <HardFault_Handler>:
 8001d8c:	f44f 4000 	mov.w	r0, #32768	; 0x8000
 8001d90:	f7ff ffe2 	bl	8001d58 <led_on>
 8001d94:	4b06      	ldr	r3, [pc, #24]	; (8001db0 <HardFault_Handler+0x24>)
 8001d96:	3b01      	subs	r3, #1
 8001d98:	d001      	beq.n	8001d9e <HardFault_Handler+0x12>
 8001d9a:	bf00      	nop
 8001d9c:	e7fb      	b.n	8001d96 <HardFault_Handler+0xa>
 8001d9e:	f44f 4000 	mov.w	r0, #32768	; 0x8000
 8001da2:	f7ff ffe3 	bl	8001d6c <led_off>
 8001da6:	4b02      	ldr	r3, [pc, #8]	; (8001db0 <HardFault_Handler+0x24>)
 8001da8:	3b01      	subs	r3, #1
 8001daa:	d0ef      	beq.n	8001d8c <HardFault_Handler>
 8001dac:	bf00      	nop
 8001dae:	e7fb      	b.n	8001da8 <HardFault_Handler+0x1c>
 8001db0:	00989681 	.word	0x00989681

08001db4 <_reset_init>:
 8001db4:	4a0e      	ldr	r2, [pc, #56]	; (8001df0 <_reset_init+0x3c>)
 8001db6:	480f      	ldr	r0, [pc, #60]	; (8001df4 <_reset_init+0x40>)
 8001db8:	1a80      	subs	r0, r0, r2
 8001dba:	1080      	asrs	r0, r0, #2
 8001dbc:	2300      	movs	r3, #0
 8001dbe:	4283      	cmp	r3, r0
 8001dc0:	d006      	beq.n	8001dd0 <_reset_init+0x1c>
 8001dc2:	490d      	ldr	r1, [pc, #52]	; (8001df8 <_reset_init+0x44>)
 8001dc4:	f851 1023 	ldr.w	r1, [r1, r3, lsl #2]
 8001dc8:	f842 1023 	str.w	r1, [r2, r3, lsl #2]
 8001dcc:	3301      	adds	r3, #1
 8001dce:	e7f6      	b.n	8001dbe <_reset_init+0xa>
 8001dd0:	4b0a      	ldr	r3, [pc, #40]	; (8001dfc <_reset_init+0x48>)
 8001dd2:	f8d3 2088 	ldr.w	r2, [r3, #136]	; 0x88
 8001dd6:	f442 0270 	orr.w	r2, r2, #15728640	; 0xf00000
 8001dda:	f8c3 2088 	str.w	r2, [r3, #136]	; 0x88
 8001dde:	f503 730c 	add.w	r3, r3, #560	; 0x230
 8001de2:	685a      	ldr	r2, [r3, #4]
 8001de4:	f022 4240 	bic.w	r2, r2, #3221225472	; 0xc0000000
 8001de8:	605a      	str	r2, [r3, #4]
 8001dea:	f7fe bf8b 	b.w	8000d04 <main>
 8001dee:	bf00      	nop
 8001df0:	20000000 	.word	0x20000000
 8001df4:	20000034 	.word	0x20000034
 8001df8:	080024e4 	.word	0x080024e4
 8001dfc:	e000ed00 	.word	0xe000ed00

08001e00 <_init>:
 8001e00:	e1a0c00d 	mov	ip, sp
 8001e04:	e92ddff8 	push	{r3, r4, r5, r6, r7, r8, r9, sl, fp, ip, lr, pc}
 8001e08:	e24cb004 	sub	fp, ip, #4
 8001e0c:	e24bd028 	sub	sp, fp, #40	; 0x28
 8001e10:	e89d6ff0 	ldm	sp, {r4, r5, r6, r7, r8, r9, sl, fp, sp, lr}
 8001e14:	e12fff1e 	bx	lr

08001e18 <_fini>:
 8001e18:	e1a0c00d 	mov	ip, sp
 8001e1c:	e92ddff8 	push	{r3, r4, r5, r6, r7, r8, r9, sl, fp, ip, lr, pc}
 8001e20:	e24cb004 	sub	fp, ip, #4
 8001e24:	e24bd028 	sub	sp, fp, #40	; 0x28
 8001e28:	e89d6ff0 	ldm	sp, {r4, r5, r6, r7, r8, r9, sl, fp, sp, lr}
 8001e2c:	e12fff1e 	bx	lr
 8001e30:	69647473 	.word	0x69647473
 8001e34:	6e69206f 	.word	0x6e69206f
 8001e38:	64207469 	.word	0x64207469
 8001e3c:	0a656e6f 	.word	0x0a656e6f
	...

08001e41 <font_data>:
	...
 8001e51:	3c180000 18183c3c 18180018 00000000     ...<<<..........
 8001e61:	63636300 00000022 00000000 00000000     .ccc"...........
 8001e71:	36000000 36367f36 36367f36 00000000     ...66.666.66....
 8001e81:	633e0c0c 033e6061 3e634303 00000c0c     ..>ca`>..Cc>....
 8001e91:	00000000 06636100 6333180c 00000000     .....ac...3c....
 8001ea1:	1c000000 3b1c3636 3b66666e 00000000     ....66.;nff;....
 8001eb1:	30303000 00000060 00000000 00000000     .000`...........
 8001ec1:	180c0000 30303018 0c181830 00000000     .....0000.......
 8001ed1:	0c180000 0606060c 180c0c06 00000000     ................
 8001ee1:	00000000 ff3c6642 0042663c 00000000     ....Bf<.<fB.....
 8001ef1:	00000000 ff181818 00181818 00000000     ................
	...
 8001f09:	18180000 00003018 00000000 ff000000     .....0..........
	...
 8001f29:	18180000 00000000 03010000 381c0e07     ...............8
 8001f39:	80c0e070 00000000 633e0000 6b6b6363     p.........>ccckk
 8001f49:	3e636363 00000000 1c0c0000 0c0c0c3c     ccc>........<...
 8001f59:	3f0c0c0c 00000000 633e0000 180c0603     ...?......>c....
 8001f69:	7f636130 00000000 633e0000 031e0303     0ac.......>c....
 8001f79:	3e630303 00000000 0e060000 6666361e     ..c>.........6ff
 8001f89:	0f06067f 00000000 607f0000 037e6060     ...........```~.
 8001f99:	3e736303 00000000 301c0000 637e6060     .cs>.......0``~c
 8001fa9:	3e636363 00000000 637f0000 0c060603     ccc>.......c....
 8001fb9:	1818180c 00000000 633e0000 633e6363     ..........>ccc>c
 8001fc9:	3e636363 00000000 633e0000 3f636363     ccc>......>cccc?
 8001fd9:	3c060303 00000000 00000000 00181800     ...<............
 8001fe9:	18180000 00000000 00000000 00181800     ................
 8001ff9:	18180000 00003018 06000000 6030180c     .....0........0`
 8002009:	060c1830 00000000 00000000 007e0000     0.............~.
 8002019:	00007e00 00000000 60000000 060c1830     .~.........`0...
 8002029:	6030180c 00000000 633e0000 0c0c0663     ..0`......>cc...
 8002039:	0c0c000c 00000000 633e0000 6b6b6f63     ..........>ccokk
 8002049:	3e60606e 00000000 1c080000 63636336     n``>........6ccc
 8002059:	6363637f 00000000 337e0000 333e3333     .ccc......~333>3
 8002069:	7e333333 00000000 331e0000 60606061     333~.......3a```
 8002079:	1e336160 00000000 367c0000 33333333     `a3.......|63333
 8002089:	7c363333 00000000 337f0000 343c3431     336|.......314<4
 8002099:	7f333130 00000000 337f0000 343c3431     013........314<4
 80020a9:	78303030 00000000 331e0000 6f606061     000x.......3a``o
 80020b9:	1d376363 00000000 63630000 637f6363     cc7.......cccc.c
 80020c9:	63636363 00000000 183c0000 18181818     cccc......<.....
 80020d9:	3c181818 00000000 060f0000 06060606     ...<............
 80020e9:	3c666606 00000000 33730000 363c3636     .ff<......s366<6
 80020f9:	73333336 00000000 30780000 30303030     633s......x00000
 8002109:	7f333130 00000000 77630000 63636b7f     013.......cw.kcc
 8002119:	63636363 00000000 63630000 6f7f7b73     cccc......ccs{.o
 8002129:	63636367 00000000 361c0000 63636363     gccc.......6cccc
 8002139:	1c366363 00000000 337e0000 303e3333     cc6.......~333>0
 8002149:	78303030 00000000 633e0000 63636363     000x......>ccccc
 8002159:	3e6f6b63 00000706 337e0000 363e3333     cko>......~333>6
 8002169:	73333336 00000000 633e0000 061c3063     633s......>cc0..
 8002179:	3e636303 00000000 dbff0000 18181899     .cc>............
 8002189:	3c181818 00000000 63630000 63636363     ...<......cccccc
 8002199:	3e636363 00000000 63630000 63636363     ccc>......cccccc
 80021a9:	081c3663 00000000 63630000 6b636363     c6........ccccck
 80021b9:	36367f6b 00000000 c3c30000 18183c66     k.66........f<..
 80021c9:	c3c3663c 00000000 c3c30000 183c66c3     <f...........f<.
 80021d9:	3c181818 00000000 637f0000 180c0643     ...<.......cC...
 80021e9:	7f636130 00000000 303c0000 30303030     0ac.......<00000
 80021f9:	3c303030 00000000 c0800000 1c3870e0     000<.........p8.
 8002209:	0103070e 00000000 0c3c0000 0c0c0c0c     ..........<.....
 8002219:	3c0c0c0c 00000000 63361c08 00000000     ...<......6c....
	...
 800223d:	000000ff 000c1818 00000000 00000000     ................
	...
 8002255:	06463c00 3b66663e 00000000 30700000     .<F.>ff;......p0
 8002265:	33363c30 6e333333 00000000 00000000     0<63333n........
 8002275:	60633e00 3e636060 00000000 060e0000     .>c```c>........
 8002285:	66361e06 3b666666 00000000 00000000     ..6ffff;........
 8002295:	63633e00 3e63607e 00000000 361c0000     .>cc~`c>.......6
 80022a5:	307c3032 78303030 00000000 00000000     20|0000x........
 80022b5:	66663b00 063e6666 00003c66 30700000     .;ffff>.f<....p0
 80022c5:	333b3630 73333333 00000000 0c0c0000     06;3333s........
 80022d5:	0c0c1c00 1e0c0c0c 00000000 06060000     ................
 80022e5:	06060e00 66060606 00003c66 30700000     .......ff<....p0
 80022f5:	36333330 7333363c 00000000 0c1c0000     0336<63s........
 8002305:	0c0c0c0c 1e0c0c0c 00000000 00000000     ................
 8002315:	6b7f6e00 6b6b6b6b 00000000 00000000     .n.kkkkk........
 8002325:	33336e00 33333333 00000000 00000000     .n333333........
 8002335:	63633e00 3e636363 00000000 00000000     .>ccccc>........
 8002345:	33336e00 303e3333 00007830 00000000     .n3333>00x......
 8002355:	66663b00 063e6666 00000f06 00000000     .;ffff>.........
 8002365:	333b6e00 78303030 00000000 00000000     .n;3000x........
 8002375:	38633e00 3e63030e 00000000 18080000     .>c8..c>........
 8002385:	18187e18 0e1b1818 00000000 00000000     .~..............
 8002395:	66666600 3b666666 00000000 00000000     .ffffff;........
 80023a5:	36636300 081c1c36 00000000 00000000     .cc66...........
 80023b5:	63636300 367f6b6b 00000000 00000000     .ccckk.6........
 80023c5:	1c366300 63361c1c 00000000 00000000     .c6...6c........
 80023d5:	63636300 033f6363 00003c06 00000000     .ccccc?..<......
 80023e5:	0c667f00 7f633018 00000000 180e0000     ..f..0c.........
 80023f5:	18701818 0e181818 00000000 18180000     ..p.............
 8002405:	00181818 18181818 00000018 18700000     ..............p.
 8002415:	180e1818 70181818 00000000 6e3b0000     .......p......;n
	...
 8002431:	d8d87000 00000070 00000000 00000000     .p..p...........
 8002441:	3a207525 5b000a20 25206925 69252069     %u : ..[%i %i %i
 8002451:	0a00205d 636c6577 20656d6f 53206f74     ] ..welcome to S
 8002461:	68757a75 20534f61 205e5f5e 2e322e32     uzuhaOS ^_^ 2.2.
 8002471:	55420a30 20444c49 2072614d 32203032     0.BUILD Mar 20 2
 8002481:	20363130 333a3931 30353a37 6f62000a     016 19:37:50..bo
 8002491:	6e69746f 72662067 25206d6f 72000a75     oting from %u..r
 80024a1:	73206d61 74726174 20752520 6172000a     am start %u ..ra
 80024b1:	6973206d 2520657a 000a2075 206d6172     m size %u ..ram 
 80024c1:	65657266 20752520 6568000a 73207061     free %u ..heap s
 80024d1:	74726174 20752520 0a0a000a 00000000              tart %u .......

080024e0 <__EH_FRAME_BEGIN__>:
 80024e0:	00000000                                ....
