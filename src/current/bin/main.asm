
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
 80001a0:	20000070 	.word	0x20000070
 80001a4:	20000010 	.word	0x20000010

080001a8 <null_thread>:
 80001a8:	b508      	push	{r3, lr}
 80001aa:	f000 fdd1 	bl	8000d50 <sleep>
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
 800020c:	20000010 	.word	0x20000010
 8000210:	20000070 	.word	0x20000070

08000214 <SysTick_Handler>:
 8000214:	e92d 0ff0 	stmdb	sp!, {r4, r5, r6, r7, r8, r9, sl, fp}
 8000218:	f3ef 8208 	mrs	r2, MSP
 800021c:	4c0d      	ldr	r4, [pc, #52]	; (8000254 <SysTick_Handler+0x40>)
 800021e:	4d0e      	ldr	r5, [pc, #56]	; (8000258 <SysTick_Handler+0x44>)
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
 8000236:	f7ff ffbb 	bl	80001b0 <scheduler>
 800023a:	6823      	ldr	r3, [r4, #0]
 800023c:	220c      	movs	r2, #12
 800023e:	fb02 5503 	mla	r5, r2, r3, r5
 8000242:	f06f 0306 	mvn.w	r3, #6
 8000246:	68aa      	ldr	r2, [r5, #8]
 8000248:	469e      	mov	lr, r3
 800024a:	f382 8808 	msr	MSP, r2
 800024e:	e8bd 0ff0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, fp}
 8000252:	4770      	bx	lr
 8000254:	20000070 	.word	0x20000070
 8000258:	20000010 	.word	0x20000010

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
 800027c:	20000070 	.word	0x20000070

08000280 <kernel_start>:
 8000280:	b508      	push	{r3, lr}
 8000282:	f000 fd53 	bl	8000d2c <sys_tick_init>
 8000286:	bf00      	nop
 8000288:	e7fd      	b.n	8000286 <kernel_start+0x6>
	...

0800028c <create_thread>:
 800028c:	f022 0203 	bic.w	r2, r2, #3
 8000290:	3a40      	subs	r2, #64	; 0x40
 8000292:	e92d 43f0 	stmdb	sp!, {r4, r5, r6, r7, r8, r9, lr}
 8000296:	eb01 0c02 	add.w	ip, r1, r2
 800029a:	f102 0834 	add.w	r8, r2, #52	; 0x34
 800029e:	f102 0938 	add.w	r9, r2, #56	; 0x38
 80002a2:	323c      	adds	r2, #60	; 0x3c
 80002a4:	4488      	add	r8, r1
 80002a6:	4489      	add	r9, r1
 80002a8:	4607      	mov	r7, r0
 80002aa:	4411      	add	r1, r2
 80002ac:	2200      	movs	r2, #0
 80002ae:	b672      	cpsid	i
 80002b0:	4e11      	ldr	r6, [pc, #68]	; (80002f8 <create_thread+0x6c>)
 80002b2:	250c      	movs	r5, #12
 80002b4:	4355      	muls	r5, r2
 80002b6:	1974      	adds	r4, r6, r5
 80002b8:	6860      	ldr	r0, [r4, #4]
 80002ba:	07c0      	lsls	r0, r0, #31
 80002bc:	d412      	bmi.n	80002e4 <create_thread+0x58>
 80002be:	480f      	ldr	r0, [pc, #60]	; (80002fc <create_thread+0x70>)
 80002c0:	f8c4 c008 	str.w	ip, [r4, #8]
 80002c4:	f8c8 0000 	str.w	r0, [r8]
 80002c8:	f04f 5004 	mov.w	r0, #553648128	; 0x21000000
 80002cc:	f8c9 7000 	str.w	r7, [r9]
 80002d0:	2b07      	cmp	r3, #7
 80002d2:	bf98      	it	ls
 80002d4:	2308      	movls	r3, #8
 80002d6:	6008      	str	r0, [r1, #0]
 80002d8:	2001      	movs	r0, #1
 80002da:	8063      	strh	r3, [r4, #2]
 80002dc:	5373      	strh	r3, [r6, r5]
 80002de:	6060      	str	r0, [r4, #4]
 80002e0:	4610      	mov	r0, r2
 80002e2:	e000      	b.n	80002e6 <create_thread+0x5a>
 80002e4:	2008      	movs	r0, #8
 80002e6:	b662      	cpsie	i
 80002e8:	3201      	adds	r2, #1
 80002ea:	2a08      	cmp	r2, #8
 80002ec:	d001      	beq.n	80002f2 <create_thread+0x66>
 80002ee:	2808      	cmp	r0, #8
 80002f0:	d0dd      	beq.n	80002ae <create_thread+0x22>
 80002f2:	e8bd 83f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, pc}
 80002f6:	bf00      	nop
 80002f8:	20000010 	.word	0x20000010
 80002fc:	08000189 	.word	0x08000189

08000300 <kernel_init>:
 8000300:	b510      	push	{r4, lr}
 8000302:	2300      	movs	r3, #0
 8000304:	490b      	ldr	r1, [pc, #44]	; (8000334 <kernel_init+0x34>)
 8000306:	220c      	movs	r2, #12
 8000308:	435a      	muls	r2, r3
 800030a:	188c      	adds	r4, r1, r2
 800030c:	2000      	movs	r0, #0
 800030e:	6060      	str	r0, [r4, #4]
 8000310:	3301      	adds	r3, #1
 8000312:	2008      	movs	r0, #8
 8000314:	4283      	cmp	r3, r0
 8000316:	8060      	strh	r0, [r4, #2]
 8000318:	5288      	strh	r0, [r1, r2]
 800031a:	d1f3      	bne.n	8000304 <kernel_init+0x4>
 800031c:	4b06      	ldr	r3, [pc, #24]	; (8000338 <kernel_init+0x38>)
 800031e:	4807      	ldr	r0, [pc, #28]	; (800033c <kernel_init+0x3c>)
 8000320:	4907      	ldr	r1, [pc, #28]	; (8000340 <kernel_init+0x40>)
 8000322:	f04f 32ff 	mov.w	r2, #4294967295
 8000326:	601a      	str	r2, [r3, #0]
 8000328:	e8bd 4010 	ldmia.w	sp!, {r4, lr}
 800032c:	2280      	movs	r2, #128	; 0x80
 800032e:	23ff      	movs	r3, #255	; 0xff
 8000330:	f7ff bfac 	b.w	800028c <create_thread>
 8000334:	20000010 	.word	0x20000010
 8000338:	20000070 	.word	0x20000070
 800033c:	080001a9 	.word	0x080001a9
 8000340:	20000074 	.word	0x20000074

08000344 <set_wait_state>:
 8000344:	b507      	push	{r0, r1, r2, lr}
 8000346:	f7ff ff8f 	bl	8000268 <get_thread_id>
 800034a:	9000      	str	r0, [sp, #0]
 800034c:	b672      	cpsid	i
 800034e:	4b0c      	ldr	r3, [pc, #48]	; (8000380 <set_wait_state+0x3c>)
 8000350:	9a00      	ldr	r2, [sp, #0]
 8000352:	210c      	movs	r1, #12
 8000354:	fb01 3202 	mla	r2, r1, r2, r3
 8000358:	6851      	ldr	r1, [r2, #4]
 800035a:	f041 0102 	orr.w	r1, r1, #2
 800035e:	6051      	str	r1, [r2, #4]
 8000360:	b672      	cpsid	i
 8000362:	9a00      	ldr	r2, [sp, #0]
 8000364:	210c      	movs	r1, #12
 8000366:	fb01 3202 	mla	r2, r1, r2, r3
 800036a:	6852      	ldr	r2, [r2, #4]
 800036c:	9201      	str	r2, [sp, #4]
 800036e:	b662      	cpsie	i
 8000370:	9a01      	ldr	r2, [sp, #4]
 8000372:	9a01      	ldr	r2, [sp, #4]
 8000374:	0792      	lsls	r2, r2, #30
 8000376:	d4f3      	bmi.n	8000360 <set_wait_state+0x1c>
 8000378:	b003      	add	sp, #12
 800037a:	f85d fb04 	ldr.w	pc, [sp], #4
 800037e:	bf00      	nop
 8000380:	20000010 	.word	0x20000010

08000384 <wake_up_threads>:
 8000384:	2300      	movs	r3, #0
 8000386:	b672      	cpsid	i
 8000388:	4a06      	ldr	r2, [pc, #24]	; (80003a4 <wake_up_threads+0x20>)
 800038a:	210c      	movs	r1, #12
 800038c:	fb01 2203 	mla	r2, r1, r3, r2
 8000390:	6851      	ldr	r1, [r2, #4]
 8000392:	f021 0102 	bic.w	r1, r1, #2
 8000396:	6051      	str	r1, [r2, #4]
 8000398:	b662      	cpsie	i
 800039a:	3301      	adds	r3, #1
 800039c:	2b08      	cmp	r3, #8
 800039e:	d1f2      	bne.n	8000386 <wake_up_threads+0x2>
 80003a0:	4770      	bx	lr
 80003a2:	bf00      	nop
 80003a4:	20000010 	.word	0x20000010

080003a8 <messages_init>:
 80003a8:	b510      	push	{r4, lr}
 80003aa:	2200      	movs	r2, #0
 80003ac:	4909      	ldr	r1, [pc, #36]	; (80003d4 <messages_init+0x2c>)
 80003ae:	2300      	movs	r3, #0
 80003b0:	f841 3022 	str.w	r3, [r1, r2, lsl #2]
 80003b4:	3201      	adds	r2, #1
 80003b6:	2a08      	cmp	r2, #8
 80003b8:	d1f8      	bne.n	80003ac <messages_init+0x4>
 80003ba:	4c07      	ldr	r4, [pc, #28]	; (80003d8 <messages_init+0x30>)
 80003bc:	0118      	lsls	r0, r3, #4
 80003be:	1821      	adds	r1, r4, r0
 80003c0:	3301      	adds	r3, #1
 80003c2:	2200      	movs	r2, #0
 80003c4:	2b04      	cmp	r3, #4
 80003c6:	604a      	str	r2, [r1, #4]
 80003c8:	5022      	str	r2, [r4, r0]
 80003ca:	60ca      	str	r2, [r1, #12]
 80003cc:	608a      	str	r2, [r1, #8]
 80003ce:	d1f4      	bne.n	80003ba <messages_init+0x12>
 80003d0:	bd10      	pop	{r4, pc}
 80003d2:	bf00      	nop
 80003d4:	200000f4 	.word	0x200000f4
 80003d8:	20000114 	.word	0x20000114

080003dc <putc_>:
 80003dc:	b538      	push	{r3, r4, r5, lr}
 80003de:	4c06      	ldr	r4, [pc, #24]	; (80003f8 <putc_+0x1c>)
 80003e0:	4605      	mov	r5, r0
 80003e2:	4620      	mov	r0, r4
 80003e4:	f000 f901 	bl	80005ea <mutex_lock>
 80003e8:	4628      	mov	r0, r5
 80003ea:	f000 fb19 	bl	8000a20 <uart_write>
 80003ee:	4620      	mov	r0, r4
 80003f0:	e8bd 4038 	ldmia.w	sp!, {r3, r4, r5, lr}
 80003f4:	f000 b915 	b.w	8000622 <mutex_unlock>
 80003f8:	20000154 	.word	0x20000154

080003fc <puts_>:
 80003fc:	b510      	push	{r4, lr}
 80003fe:	4604      	mov	r4, r0
 8000400:	4807      	ldr	r0, [pc, #28]	; (8000420 <puts_+0x24>)
 8000402:	f000 f8f2 	bl	80005ea <mutex_lock>
 8000406:	3c01      	subs	r4, #1
 8000408:	f814 0f01 	ldrb.w	r0, [r4, #1]!
 800040c:	b110      	cbz	r0, 8000414 <puts_+0x18>
 800040e:	f7ff ffe5 	bl	80003dc <putc_>
 8000412:	e7f9      	b.n	8000408 <puts_+0xc>
 8000414:	4802      	ldr	r0, [pc, #8]	; (8000420 <puts_+0x24>)
 8000416:	e8bd 4010 	ldmia.w	sp!, {r4, lr}
 800041a:	f000 b902 	b.w	8000622 <mutex_unlock>
 800041e:	bf00      	nop
 8000420:	20000160 	.word	0x20000160

08000424 <puti_>:
 8000424:	b530      	push	{r4, r5, lr}
 8000426:	b085      	sub	sp, #20
 8000428:	1e03      	subs	r3, r0, #0
 800042a:	f04f 0200 	mov.w	r2, #0
 800042e:	bfa8      	it	ge
 8000430:	4614      	movge	r4, r2
 8000432:	f88d 200f 	strb.w	r2, [sp, #15]
 8000436:	bfbc      	itt	lt
 8000438:	425b      	neglt	r3, r3
 800043a:	2401      	movlt	r4, #1
 800043c:	220a      	movs	r2, #10
 800043e:	210a      	movs	r1, #10
 8000440:	fb93 f5f1 	sdiv	r5, r3, r1
 8000444:	fb01 3315 	mls	r3, r1, r5, r3
 8000448:	a801      	add	r0, sp, #4
 800044a:	3330      	adds	r3, #48	; 0x30
 800044c:	5413      	strb	r3, [r2, r0]
 800044e:	1e51      	subs	r1, r2, #1
 8000450:	462b      	mov	r3, r5
 8000452:	b10d      	cbz	r5, 8000458 <puti_+0x34>
 8000454:	460a      	mov	r2, r1
 8000456:	e7f2      	b.n	800043e <puti_+0x1a>
 8000458:	b12c      	cbz	r4, 8000466 <puti_+0x42>
 800045a:	ab04      	add	r3, sp, #16
 800045c:	440b      	add	r3, r1
 800045e:	222d      	movs	r2, #45	; 0x2d
 8000460:	f803 2c0c 	strb.w	r2, [r3, #-12]
 8000464:	460a      	mov	r2, r1
 8000466:	4410      	add	r0, r2
 8000468:	f7ff ffc8 	bl	80003fc <puts_>
 800046c:	b005      	add	sp, #20
 800046e:	bd30      	pop	{r4, r5, pc}

08000470 <putui_>:
 8000470:	b51f      	push	{r0, r1, r2, r3, r4, lr}
 8000472:	2300      	movs	r3, #0
 8000474:	f88d 300f 	strb.w	r3, [sp, #15]
 8000478:	230a      	movs	r3, #10
 800047a:	240a      	movs	r4, #10
 800047c:	fbb0 f1f4 	udiv	r1, r0, r4
 8000480:	fb04 0011 	mls	r0, r4, r1, r0
 8000484:	aa01      	add	r2, sp, #4
 8000486:	3030      	adds	r0, #48	; 0x30
 8000488:	5498      	strb	r0, [r3, r2]
 800048a:	1e5c      	subs	r4, r3, #1
 800048c:	4608      	mov	r0, r1
 800048e:	b109      	cbz	r1, 8000494 <putui_+0x24>
 8000490:	4623      	mov	r3, r4
 8000492:	e7f2      	b.n	800047a <putui_+0xa>
 8000494:	18d0      	adds	r0, r2, r3
 8000496:	f7ff ffb1 	bl	80003fc <puts_>
 800049a:	b004      	add	sp, #16
 800049c:	bd10      	pop	{r4, pc}

0800049e <putx_>:
 800049e:	b51f      	push	{r0, r1, r2, r3, r4, lr}
 80004a0:	2300      	movs	r3, #0
 80004a2:	f88d 300f 	strb.w	r3, [sp, #15]
 80004a6:	230a      	movs	r3, #10
 80004a8:	f000 010f 	and.w	r1, r0, #15
 80004ac:	2909      	cmp	r1, #9
 80004ae:	aa01      	add	r2, sp, #4
 80004b0:	bf94      	ite	ls
 80004b2:	3130      	addls	r1, #48	; 0x30
 80004b4:	3157      	addhi	r1, #87	; 0x57
 80004b6:	0900      	lsrs	r0, r0, #4
 80004b8:	54d1      	strb	r1, [r2, r3]
 80004ba:	f103 31ff 	add.w	r1, r3, #4294967295
 80004be:	d001      	beq.n	80004c4 <putx_+0x26>
 80004c0:	460b      	mov	r3, r1
 80004c2:	e7f1      	b.n	80004a8 <putx_+0xa>
 80004c4:	18d0      	adds	r0, r2, r3
 80004c6:	f7ff ff99 	bl	80003fc <puts_>
 80004ca:	b005      	add	sp, #20
 80004cc:	f85d fb04 	ldr.w	pc, [sp], #4

080004d0 <printf_>:
 80004d0:	b40f      	push	{r0, r1, r2, r3}
 80004d2:	b537      	push	{r0, r1, r2, r4, r5, lr}
 80004d4:	ac06      	add	r4, sp, #24
 80004d6:	4826      	ldr	r0, [pc, #152]	; (8000570 <printf_+0xa0>)
 80004d8:	f854 5b04 	ldr.w	r5, [r4], #4
 80004dc:	f000 f885 	bl	80005ea <mutex_lock>
 80004e0:	9401      	str	r4, [sp, #4]
 80004e2:	2400      	movs	r4, #0
 80004e4:	5d28      	ldrb	r0, [r5, r4]
 80004e6:	2800      	cmp	r0, #0
 80004e8:	d039      	beq.n	800055e <printf_+0x8e>
 80004ea:	2825      	cmp	r0, #37	; 0x25
 80004ec:	d003      	beq.n	80004f6 <printf_+0x26>
 80004ee:	f7ff ff75 	bl	80003dc <putc_>
 80004f2:	3401      	adds	r4, #1
 80004f4:	e7f6      	b.n	80004e4 <printf_+0x14>
 80004f6:	192b      	adds	r3, r5, r4
 80004f8:	7858      	ldrb	r0, [r3, #1]
 80004fa:	2869      	cmp	r0, #105	; 0x69
 80004fc:	d016      	beq.n	800052c <printf_+0x5c>
 80004fe:	d808      	bhi.n	8000512 <printf_+0x42>
 8000500:	2825      	cmp	r0, #37	; 0x25
 8000502:	d028      	beq.n	8000556 <printf_+0x86>
 8000504:	2863      	cmp	r0, #99	; 0x63
 8000506:	d128      	bne.n	800055a <printf_+0x8a>
 8000508:	9b01      	ldr	r3, [sp, #4]
 800050a:	1d1a      	adds	r2, r3, #4
 800050c:	9201      	str	r2, [sp, #4]
 800050e:	7818      	ldrb	r0, [r3, #0]
 8000510:	e021      	b.n	8000556 <printf_+0x86>
 8000512:	2875      	cmp	r0, #117	; 0x75
 8000514:	d011      	beq.n	800053a <printf_+0x6a>
 8000516:	2878      	cmp	r0, #120	; 0x78
 8000518:	d016      	beq.n	8000548 <printf_+0x78>
 800051a:	2873      	cmp	r0, #115	; 0x73
 800051c:	d11d      	bne.n	800055a <printf_+0x8a>
 800051e:	9b01      	ldr	r3, [sp, #4]
 8000520:	1d1a      	adds	r2, r3, #4
 8000522:	6818      	ldr	r0, [r3, #0]
 8000524:	9201      	str	r2, [sp, #4]
 8000526:	f7ff ff69 	bl	80003fc <puts_>
 800052a:	e016      	b.n	800055a <printf_+0x8a>
 800052c:	9b01      	ldr	r3, [sp, #4]
 800052e:	1d1a      	adds	r2, r3, #4
 8000530:	6818      	ldr	r0, [r3, #0]
 8000532:	9201      	str	r2, [sp, #4]
 8000534:	f7ff ff76 	bl	8000424 <puti_>
 8000538:	e00f      	b.n	800055a <printf_+0x8a>
 800053a:	9b01      	ldr	r3, [sp, #4]
 800053c:	1d1a      	adds	r2, r3, #4
 800053e:	6818      	ldr	r0, [r3, #0]
 8000540:	9201      	str	r2, [sp, #4]
 8000542:	f7ff ff95 	bl	8000470 <putui_>
 8000546:	e008      	b.n	800055a <printf_+0x8a>
 8000548:	9b01      	ldr	r3, [sp, #4]
 800054a:	1d1a      	adds	r2, r3, #4
 800054c:	6818      	ldr	r0, [r3, #0]
 800054e:	9201      	str	r2, [sp, #4]
 8000550:	f7ff ffa5 	bl	800049e <putx_>
 8000554:	e001      	b.n	800055a <printf_+0x8a>
 8000556:	f7ff ff41 	bl	80003dc <putc_>
 800055a:	3402      	adds	r4, #2
 800055c:	e7c2      	b.n	80004e4 <printf_+0x14>
 800055e:	4804      	ldr	r0, [pc, #16]	; (8000570 <printf_+0xa0>)
 8000560:	f000 f85f 	bl	8000622 <mutex_unlock>
 8000564:	b003      	add	sp, #12
 8000566:	e8bd 4030 	ldmia.w	sp!, {r4, r5, lr}
 800056a:	b004      	add	sp, #16
 800056c:	4770      	bx	lr
 800056e:	bf00      	nop
 8000570:	2000015c 	.word	0x2000015c

08000574 <stdio_init>:
 8000574:	b510      	push	{r4, lr}
 8000576:	480e      	ldr	r0, [pc, #56]	; (80005b0 <stdio_init+0x3c>)
 8000578:	f000 f82d 	bl	80005d6 <mutex_init>
 800057c:	480d      	ldr	r0, [pc, #52]	; (80005b4 <stdio_init+0x40>)
 800057e:	f000 f82a 	bl	80005d6 <mutex_init>
 8000582:	480d      	ldr	r0, [pc, #52]	; (80005b8 <stdio_init+0x44>)
 8000584:	f000 f827 	bl	80005d6 <mutex_init>
 8000588:	480c      	ldr	r0, [pc, #48]	; (80005bc <stdio_init+0x48>)
 800058a:	f000 f824 	bl	80005d6 <mutex_init>
 800058e:	2408      	movs	r4, #8
 8000590:	2020      	movs	r0, #32
 8000592:	f7ff ff23 	bl	80003dc <putc_>
 8000596:	3c01      	subs	r4, #1
 8000598:	d1fa      	bne.n	8000590 <stdio_init+0x1c>
 800059a:	2420      	movs	r4, #32
 800059c:	200a      	movs	r0, #10
 800059e:	f7ff ff1d 	bl	80003dc <putc_>
 80005a2:	3c01      	subs	r4, #1
 80005a4:	d1fa      	bne.n	800059c <stdio_init+0x28>
 80005a6:	4806      	ldr	r0, [pc, #24]	; (80005c0 <stdio_init+0x4c>)
 80005a8:	e8bd 4010 	ldmia.w	sp!, {r4, lr}
 80005ac:	f7ff bf90 	b.w	80004d0 <printf_>
 80005b0:	20000154 	.word	0x20000154
 80005b4:	20000158 	.word	0x20000158
 80005b8:	20000160 	.word	0x20000160
 80005bc:	2000015c 	.word	0x2000015c
 80005c0:	080011d4 	.word	0x080011d4

080005c4 <lib_os_init>:
 80005c4:	b508      	push	{r3, lr}
 80005c6:	f7ff fe9b 	bl	8000300 <kernel_init>
 80005ca:	f7ff feed 	bl	80003a8 <messages_init>
 80005ce:	e8bd 4008 	ldmia.w	sp!, {r3, lr}
 80005d2:	f7ff bfcf 	b.w	8000574 <stdio_init>

080005d6 <mutex_init>:
 80005d6:	b510      	push	{r4, lr}
 80005d8:	4604      	mov	r4, r0
 80005da:	f7ff fe3f 	bl	800025c <sched_off>
 80005de:	2300      	movs	r3, #0
 80005e0:	6023      	str	r3, [r4, #0]
 80005e2:	e8bd 4010 	ldmia.w	sp!, {r4, lr}
 80005e6:	f7ff be3b 	b.w	8000260 <sched_on>

080005ea <mutex_lock>:
 80005ea:	b513      	push	{r0, r1, r4, lr}
 80005ec:	4604      	mov	r4, r0
 80005ee:	f7ff fe35 	bl	800025c <sched_off>
 80005f2:	6823      	ldr	r3, [r4, #0]
 80005f4:	9301      	str	r3, [sp, #4]
 80005f6:	f7ff fe33 	bl	8000260 <sched_on>
 80005fa:	9b01      	ldr	r3, [sp, #4]
 80005fc:	b10b      	cbz	r3, 8000602 <mutex_lock+0x18>
 80005fe:	f7ff fea1 	bl	8000344 <set_wait_state>
 8000602:	9b01      	ldr	r3, [sp, #4]
 8000604:	2b00      	cmp	r3, #0
 8000606:	d1f2      	bne.n	80005ee <mutex_lock+0x4>
 8000608:	f7ff fe28 	bl	800025c <sched_off>
 800060c:	6823      	ldr	r3, [r4, #0]
 800060e:	9301      	str	r3, [sp, #4]
 8000610:	9b01      	ldr	r3, [sp, #4]
 8000612:	2b00      	cmp	r3, #0
 8000614:	d1eb      	bne.n	80005ee <mutex_lock+0x4>
 8000616:	2301      	movs	r3, #1
 8000618:	6023      	str	r3, [r4, #0]
 800061a:	f7ff fe21 	bl	8000260 <sched_on>
 800061e:	b002      	add	sp, #8
 8000620:	bd10      	pop	{r4, pc}

08000622 <mutex_unlock>:
 8000622:	b508      	push	{r3, lr}
 8000624:	f7ff ffd7 	bl	80005d6 <mutex_init>
 8000628:	f7ff feac 	bl	8000384 <wake_up_threads>
 800062c:	e8bd 4008 	ldmia.w	sp!, {r3, lr}
 8000630:	f7ff be18 	b.w	8000264 <yield>

08000634 <child1_thread>:
 8000634:	b508      	push	{r3, lr}
 8000636:	f000 f9fd 	bl	8000a34 <uart_read>
 800063a:	4601      	mov	r1, r0
 800063c:	4809      	ldr	r0, [pc, #36]	; (8000664 <child1_thread+0x30>)
 800063e:	f7ff ff47 	bl	80004d0 <printf_>
 8000642:	f44f 5080 	mov.w	r0, #4096	; 0x1000
 8000646:	f000 fd11 	bl	800106c <led_on>
 800064a:	4807      	ldr	r0, [pc, #28]	; (8000668 <child1_thread+0x34>)
 800064c:	f7ff ff40 	bl	80004d0 <printf_>
 8000650:	f44f 5080 	mov.w	r0, #4096	; 0x1000
 8000654:	f000 fd12 	bl	800107c <led_off>
 8000658:	f44f 7096 	mov.w	r0, #300	; 0x12c
 800065c:	f000 f96a 	bl	8000934 <timer_delay_ms>
 8000660:	e7e9      	b.n	8000636 <child1_thread+0x2>
 8000662:	bf00      	nop
 8000664:	080011e5 	.word	0x080011e5
 8000668:	080011f0 	.word	0x080011f0

0800066c <child2_thread>:
 800066c:	b508      	push	{r3, lr}
 800066e:	f44f 5080 	mov.w	r0, #4096	; 0x1000
 8000672:	f000 fcfb 	bl	800106c <led_on>
 8000676:	4806      	ldr	r0, [pc, #24]	; (8000690 <child2_thread+0x24>)
 8000678:	f7ff ff2a 	bl	80004d0 <printf_>
 800067c:	f44f 5080 	mov.w	r0, #4096	; 0x1000
 8000680:	f000 fcfc 	bl	800107c <led_off>
 8000684:	f44f 702f 	mov.w	r0, #700	; 0x2bc
 8000688:	f000 f954 	bl	8000934 <timer_delay_ms>
 800068c:	e7ef      	b.n	800066e <child2_thread+0x2>
 800068e:	bf00      	nop
 8000690:	08001208 	.word	0x08001208

08000694 <main_thread>:
 8000694:	b508      	push	{r3, lr}
 8000696:	f44f 5080 	mov.w	r0, #4096	; 0x1000
 800069a:	f000 fce7 	bl	800106c <led_on>
 800069e:	4810      	ldr	r0, [pc, #64]	; (80006e0 <main_thread+0x4c>)
 80006a0:	f7ff ff16 	bl	80004d0 <printf_>
 80006a4:	490f      	ldr	r1, [pc, #60]	; (80006e4 <main_thread+0x50>)
 80006a6:	4810      	ldr	r0, [pc, #64]	; (80006e8 <main_thread+0x54>)
 80006a8:	f44f 7280 	mov.w	r2, #256	; 0x100
 80006ac:	2308      	movs	r3, #8
 80006ae:	f7ff fded 	bl	800028c <create_thread>
 80006b2:	480e      	ldr	r0, [pc, #56]	; (80006ec <main_thread+0x58>)
 80006b4:	490e      	ldr	r1, [pc, #56]	; (80006f0 <main_thread+0x5c>)
 80006b6:	f44f 7280 	mov.w	r2, #256	; 0x100
 80006ba:	2308      	movs	r3, #8
 80006bc:	f7ff fde6 	bl	800028c <create_thread>
 80006c0:	f44f 5080 	mov.w	r0, #4096	; 0x1000
 80006c4:	f000 fcd2 	bl	800106c <led_on>
 80006c8:	480a      	ldr	r0, [pc, #40]	; (80006f4 <main_thread+0x60>)
 80006ca:	f7ff ff01 	bl	80004d0 <printf_>
 80006ce:	f44f 5080 	mov.w	r0, #4096	; 0x1000
 80006d2:	f000 fcd3 	bl	800107c <led_off>
 80006d6:	f44f 70fa 	mov.w	r0, #500	; 0x1f4
 80006da:	f000 f92b 	bl	8000934 <timer_delay_ms>
 80006de:	e7ef      	b.n	80006c0 <main_thread+0x2c>
 80006e0:	08001220 	.word	0x08001220
 80006e4:	20000264 	.word	0x20000264
 80006e8:	08000635 	.word	0x08000635
 80006ec:	0800066d 	.word	0x0800066d
 80006f0:	20000164 	.word	0x20000164
 80006f4:	0800125b 	.word	0x0800125b

080006f8 <mem_info_print>:
 80006f8:	b538      	push	{r3, r4, r5, lr}
 80006fa:	4c0f      	ldr	r4, [pc, #60]	; (8000738 <mem_info_print+0x40>)
 80006fc:	4d0f      	ldr	r5, [pc, #60]	; (800073c <mem_info_print+0x44>)
 80006fe:	4810      	ldr	r0, [pc, #64]	; (8000740 <mem_info_print+0x48>)
 8000700:	4910      	ldr	r1, [pc, #64]	; (8000744 <mem_info_print+0x4c>)
 8000702:	f7ff fee5 	bl	80004d0 <printf_>
 8000706:	1b2d      	subs	r5, r5, r4
 8000708:	4621      	mov	r1, r4
 800070a:	480f      	ldr	r0, [pc, #60]	; (8000748 <mem_info_print+0x50>)
 800070c:	f7ff fee0 	bl	80004d0 <printf_>
 8000710:	4629      	mov	r1, r5
 8000712:	480e      	ldr	r0, [pc, #56]	; (800074c <mem_info_print+0x54>)
 8000714:	f7ff fedc 	bl	80004d0 <printf_>
 8000718:	4b0d      	ldr	r3, [pc, #52]	; (8000750 <mem_info_print+0x58>)
 800071a:	480e      	ldr	r0, [pc, #56]	; (8000754 <mem_info_print+0x5c>)
 800071c:	1ae1      	subs	r1, r4, r3
 800071e:	4429      	add	r1, r5
 8000720:	f7ff fed6 	bl	80004d0 <printf_>
 8000724:	480c      	ldr	r0, [pc, #48]	; (8000758 <mem_info_print+0x60>)
 8000726:	490d      	ldr	r1, [pc, #52]	; (800075c <mem_info_print+0x64>)
 8000728:	f7ff fed2 	bl	80004d0 <printf_>
 800072c:	480c      	ldr	r0, [pc, #48]	; (8000760 <mem_info_print+0x68>)
 800072e:	e8bd 4038 	ldmia.w	sp!, {r3, r4, r5, lr}
 8000732:	f7ff becd 	b.w	80004d0 <printf_>
 8000736:	bf00      	nop
 8000738:	20000000 	.word	0x20000000
 800073c:	20020000 	.word	0x20020000
 8000740:	08001268 	.word	0x08001268
 8000744:	080011a4 	.word	0x080011a4
 8000748:	08001279 	.word	0x08001279
 800074c:	08001288 	.word	0x08001288
 8000750:	20000480 	.word	0x20000480
 8000754:	08001296 	.word	0x08001296
 8000758:	080012a4 	.word	0x080012a4
 800075c:	20000480 	.word	0x20000480
 8000760:	080012b4 	.word	0x080012b4

08000764 <main>:
 8000764:	b508      	push	{r3, lr}
 8000766:	f000 fbb1 	bl	8000ecc <lib_low_level_init>
 800076a:	f7ff ff2b 	bl	80005c4 <lib_os_init>
 800076e:	f7ff ffc3 	bl	80006f8 <mem_info_print>
 8000772:	4905      	ldr	r1, [pc, #20]	; (8000788 <main+0x24>)
 8000774:	4805      	ldr	r0, [pc, #20]	; (800078c <main+0x28>)
 8000776:	f44f 7280 	mov.w	r2, #256	; 0x100
 800077a:	2308      	movs	r3, #8
 800077c:	f7ff fd86 	bl	800028c <create_thread>
 8000780:	f7ff fd7e 	bl	8000280 <kernel_start>
 8000784:	2000      	movs	r0, #0
 8000786:	bd08      	pop	{r3, pc}
 8000788:	20000364 	.word	0x20000364
 800078c:	08000695 	.word	0x08000695

08000790 <TIM_TimeBaseInit>:
 8000790:	4a1c      	ldr	r2, [pc, #112]	; (8000804 <TIM_TimeBaseInit+0x74>)
 8000792:	8803      	ldrh	r3, [r0, #0]
 8000794:	4290      	cmp	r0, r2
 8000796:	b29b      	uxth	r3, r3
 8000798:	d012      	beq.n	80007c0 <TIM_TimeBaseInit+0x30>
 800079a:	f502 6280 	add.w	r2, r2, #1024	; 0x400
 800079e:	4290      	cmp	r0, r2
 80007a0:	d00e      	beq.n	80007c0 <TIM_TimeBaseInit+0x30>
 80007a2:	f1b0 4f80 	cmp.w	r0, #1073741824	; 0x40000000
 80007a6:	d00b      	beq.n	80007c0 <TIM_TimeBaseInit+0x30>
 80007a8:	f5a2 3280 	sub.w	r2, r2, #65536	; 0x10000
 80007ac:	4290      	cmp	r0, r2
 80007ae:	d007      	beq.n	80007c0 <TIM_TimeBaseInit+0x30>
 80007b0:	f502 6280 	add.w	r2, r2, #1024	; 0x400
 80007b4:	4290      	cmp	r0, r2
 80007b6:	d003      	beq.n	80007c0 <TIM_TimeBaseInit+0x30>
 80007b8:	f502 6280 	add.w	r2, r2, #1024	; 0x400
 80007bc:	4290      	cmp	r0, r2
 80007be:	d103      	bne.n	80007c8 <TIM_TimeBaseInit+0x38>
 80007c0:	884a      	ldrh	r2, [r1, #2]
 80007c2:	f023 0370 	bic.w	r3, r3, #112	; 0x70
 80007c6:	4313      	orrs	r3, r2
 80007c8:	4a0f      	ldr	r2, [pc, #60]	; (8000808 <TIM_TimeBaseInit+0x78>)
 80007ca:	4290      	cmp	r0, r2
 80007cc:	d008      	beq.n	80007e0 <TIM_TimeBaseInit+0x50>
 80007ce:	f502 6280 	add.w	r2, r2, #1024	; 0x400
 80007d2:	4290      	cmp	r0, r2
 80007d4:	d004      	beq.n	80007e0 <TIM_TimeBaseInit+0x50>
 80007d6:	f423 7340 	bic.w	r3, r3, #768	; 0x300
 80007da:	890a      	ldrh	r2, [r1, #8]
 80007dc:	b29b      	uxth	r3, r3
 80007de:	4313      	orrs	r3, r2
 80007e0:	8003      	strh	r3, [r0, #0]
 80007e2:	684b      	ldr	r3, [r1, #4]
 80007e4:	62c3      	str	r3, [r0, #44]	; 0x2c
 80007e6:	880b      	ldrh	r3, [r1, #0]
 80007e8:	8503      	strh	r3, [r0, #40]	; 0x28
 80007ea:	4b06      	ldr	r3, [pc, #24]	; (8000804 <TIM_TimeBaseInit+0x74>)
 80007ec:	4298      	cmp	r0, r3
 80007ee:	d003      	beq.n	80007f8 <TIM_TimeBaseInit+0x68>
 80007f0:	f503 6380 	add.w	r3, r3, #1024	; 0x400
 80007f4:	4298      	cmp	r0, r3
 80007f6:	d101      	bne.n	80007fc <TIM_TimeBaseInit+0x6c>
 80007f8:	7a8b      	ldrb	r3, [r1, #10]
 80007fa:	8603      	strh	r3, [r0, #48]	; 0x30
 80007fc:	2301      	movs	r3, #1
 80007fe:	8283      	strh	r3, [r0, #20]
 8000800:	4770      	bx	lr
 8000802:	bf00      	nop
 8000804:	40010000 	.word	0x40010000
 8000808:	40001000 	.word	0x40001000

0800080c <TIM_Cmd>:
 800080c:	8803      	ldrh	r3, [r0, #0]
 800080e:	b119      	cbz	r1, 8000818 <TIM_Cmd+0xc>
 8000810:	b29b      	uxth	r3, r3
 8000812:	f043 0301 	orr.w	r3, r3, #1
 8000816:	e003      	b.n	8000820 <TIM_Cmd+0x14>
 8000818:	f023 0301 	bic.w	r3, r3, #1
 800081c:	041b      	lsls	r3, r3, #16
 800081e:	0c1b      	lsrs	r3, r3, #16
 8000820:	8003      	strh	r3, [r0, #0]
 8000822:	4770      	bx	lr

08000824 <TIM_ClearITPendingBit>:
 8000824:	43c9      	mvns	r1, r1
 8000826:	b289      	uxth	r1, r1
 8000828:	8201      	strh	r1, [r0, #16]
 800082a:	4770      	bx	lr

0800082c <timer_init>:
 800082c:	b530      	push	{r4, r5, lr}
 800082e:	2000      	movs	r0, #0
 8000830:	b085      	sub	sp, #20
 8000832:	4a1e      	ldr	r2, [pc, #120]	; (80008ac <timer_init+0x80>)
 8000834:	f44f 6380 	mov.w	r3, #1024	; 0x400
 8000838:	f822 3010 	strh.w	r3, [r2, r0, lsl #1]
 800083c:	4a1c      	ldr	r2, [pc, #112]	; (80008b0 <timer_init+0x84>)
 800083e:	f822 3010 	strh.w	r3, [r2, r0, lsl #1]
 8000842:	4b1c      	ldr	r3, [pc, #112]	; (80008b4 <timer_init+0x88>)
 8000844:	2400      	movs	r4, #0
 8000846:	f823 4010 	strh.w	r4, [r3, r0, lsl #1]
 800084a:	3001      	adds	r0, #1
 800084c:	2804      	cmp	r0, #4
 800084e:	4625      	mov	r5, r4
 8000850:	d1ef      	bne.n	8000832 <timer_init+0x6>
 8000852:	4b19      	ldr	r3, [pc, #100]	; (80008b8 <timer_init+0x8c>)
 8000854:	2101      	movs	r1, #1
 8000856:	601c      	str	r4, [r3, #0]
 8000858:	f000 fb98 	bl	8000f8c <RCC_APB1PeriphClockCmd>
 800085c:	f8ad 4006 	strh.w	r4, [sp, #6]
 8000860:	f8ad 400c 	strh.w	r4, [sp, #12]
 8000864:	f88d 400e 	strb.w	r4, [sp, #14]
 8000868:	4c14      	ldr	r4, [pc, #80]	; (80008bc <timer_init+0x90>)
 800086a:	2353      	movs	r3, #83	; 0x53
 800086c:	f8ad 3004 	strh.w	r3, [sp, #4]
 8000870:	4620      	mov	r0, r4
 8000872:	2331      	movs	r3, #49	; 0x31
 8000874:	a901      	add	r1, sp, #4
 8000876:	9302      	str	r3, [sp, #8]
 8000878:	f7ff ff8a 	bl	8000790 <TIM_TimeBaseInit>
 800087c:	4620      	mov	r0, r4
 800087e:	2101      	movs	r1, #1
 8000880:	f7ff ffc4 	bl	800080c <TIM_Cmd>
 8000884:	89a3      	ldrh	r3, [r4, #12]
 8000886:	b29b      	uxth	r3, r3
 8000888:	f043 0301 	orr.w	r3, r3, #1
 800088c:	81a3      	strh	r3, [r4, #12]
 800088e:	231e      	movs	r3, #30
 8000890:	f88d 3000 	strb.w	r3, [sp]
 8000894:	4668      	mov	r0, sp
 8000896:	2301      	movs	r3, #1
 8000898:	f88d 5001 	strb.w	r5, [sp, #1]
 800089c:	f88d 3002 	strb.w	r3, [sp, #2]
 80008a0:	f88d 3003 	strb.w	r3, [sp, #3]
 80008a4:	f000 fadc 	bl	8000e60 <NVIC_Init>
 80008a8:	b005      	add	sp, #20
 80008aa:	bd30      	pop	{r4, r5, pc}
 80008ac:	20000478 	.word	0x20000478
 80008b0:	2000046c 	.word	0x2000046c
 80008b4:	20000464 	.word	0x20000464
 80008b8:	20000474 	.word	0x20000474
 80008bc:	40000800 	.word	0x40000800

080008c0 <TIM4_IRQHandler>:
 80008c0:	2300      	movs	r3, #0
 80008c2:	4a10      	ldr	r2, [pc, #64]	; (8000904 <TIM4_IRQHandler+0x44>)
 80008c4:	f832 1013 	ldrh.w	r1, [r2, r3, lsl #1]
 80008c8:	b289      	uxth	r1, r1
 80008ca:	b129      	cbz	r1, 80008d8 <TIM4_IRQHandler+0x18>
 80008cc:	f832 1013 	ldrh.w	r1, [r2, r3, lsl #1]
 80008d0:	b289      	uxth	r1, r1
 80008d2:	3901      	subs	r1, #1
 80008d4:	b289      	uxth	r1, r1
 80008d6:	e007      	b.n	80008e8 <TIM4_IRQHandler+0x28>
 80008d8:	490b      	ldr	r1, [pc, #44]	; (8000908 <TIM4_IRQHandler+0x48>)
 80008da:	f831 1013 	ldrh.w	r1, [r1, r3, lsl #1]
 80008de:	b289      	uxth	r1, r1
 80008e0:	f822 1013 	strh.w	r1, [r2, r3, lsl #1]
 80008e4:	4a09      	ldr	r2, [pc, #36]	; (800090c <TIM4_IRQHandler+0x4c>)
 80008e6:	2101      	movs	r1, #1
 80008e8:	f822 1013 	strh.w	r1, [r2, r3, lsl #1]
 80008ec:	3301      	adds	r3, #1
 80008ee:	2b04      	cmp	r3, #4
 80008f0:	d1e7      	bne.n	80008c2 <TIM4_IRQHandler+0x2>
 80008f2:	4b07      	ldr	r3, [pc, #28]	; (8000910 <TIM4_IRQHandler+0x50>)
 80008f4:	4807      	ldr	r0, [pc, #28]	; (8000914 <TIM4_IRQHandler+0x54>)
 80008f6:	681a      	ldr	r2, [r3, #0]
 80008f8:	2101      	movs	r1, #1
 80008fa:	3201      	adds	r2, #1
 80008fc:	601a      	str	r2, [r3, #0]
 80008fe:	f7ff bf91 	b.w	8000824 <TIM_ClearITPendingBit>
 8000902:	bf00      	nop
 8000904:	20000478 	.word	0x20000478
 8000908:	2000046c 	.word	0x2000046c
 800090c:	20000464 	.word	0x20000464
 8000910:	20000474 	.word	0x20000474
 8000914:	40000800 	.word	0x40000800

08000918 <timer_get_time>:
 8000918:	b082      	sub	sp, #8
 800091a:	b672      	cpsid	i
 800091c:	4b04      	ldr	r3, [pc, #16]	; (8000930 <timer_get_time+0x18>)
 800091e:	681b      	ldr	r3, [r3, #0]
 8000920:	9301      	str	r3, [sp, #4]
 8000922:	b662      	cpsie	i
 8000924:	9801      	ldr	r0, [sp, #4]
 8000926:	230a      	movs	r3, #10
 8000928:	fbb0 f0f3 	udiv	r0, r0, r3
 800092c:	b002      	add	sp, #8
 800092e:	4770      	bx	lr
 8000930:	20000474 	.word	0x20000474

08000934 <timer_delay_ms>:
 8000934:	b513      	push	{r0, r1, r4, lr}
 8000936:	4604      	mov	r4, r0
 8000938:	f7ff ffee 	bl	8000918 <timer_get_time>
 800093c:	4420      	add	r0, r4
 800093e:	9001      	str	r0, [sp, #4]
 8000940:	9c01      	ldr	r4, [sp, #4]
 8000942:	f7ff ffe9 	bl	8000918 <timer_get_time>
 8000946:	4284      	cmp	r4, r0
 8000948:	d902      	bls.n	8000950 <timer_delay_ms+0x1c>
 800094a:	f000 fa01 	bl	8000d50 <sleep>
 800094e:	e7f7      	b.n	8000940 <timer_delay_ms+0xc>
 8000950:	b002      	add	sp, #8
 8000952:	bd10      	pop	{r4, pc}

08000954 <USART_Init>:
 8000954:	8a03      	ldrh	r3, [r0, #16]
 8000956:	88ca      	ldrh	r2, [r1, #6]
 8000958:	b29b      	uxth	r3, r3
 800095a:	f423 5340 	bic.w	r3, r3, #12288	; 0x3000
 800095e:	b530      	push	{r4, r5, lr}
 8000960:	4313      	orrs	r3, r2
 8000962:	460d      	mov	r5, r1
 8000964:	8203      	strh	r3, [r0, #16]
 8000966:	8983      	ldrh	r3, [r0, #12]
 8000968:	8909      	ldrh	r1, [r1, #8]
 800096a:	88aa      	ldrh	r2, [r5, #4]
 800096c:	f423 53b0 	bic.w	r3, r3, #5632	; 0x1600
 8000970:	430a      	orrs	r2, r1
 8000972:	8969      	ldrh	r1, [r5, #10]
 8000974:	f023 030c 	bic.w	r3, r3, #12
 8000978:	430a      	orrs	r2, r1
 800097a:	041b      	lsls	r3, r3, #16
 800097c:	b292      	uxth	r2, r2
 800097e:	0c1b      	lsrs	r3, r3, #16
 8000980:	4313      	orrs	r3, r2
 8000982:	8183      	strh	r3, [r0, #12]
 8000984:	8a83      	ldrh	r3, [r0, #20]
 8000986:	89aa      	ldrh	r2, [r5, #12]
 8000988:	b29b      	uxth	r3, r3
 800098a:	f423 7340 	bic.w	r3, r3, #768	; 0x300
 800098e:	4313      	orrs	r3, r2
 8000990:	b085      	sub	sp, #20
 8000992:	8283      	strh	r3, [r0, #20]
 8000994:	4604      	mov	r4, r0
 8000996:	4668      	mov	r0, sp
 8000998:	f000 faa8 	bl	8000eec <RCC_GetClocksFreq>
 800099c:	4b19      	ldr	r3, [pc, #100]	; (8000a04 <USART_Init+0xb0>)
 800099e:	429c      	cmp	r4, r3
 80009a0:	d003      	beq.n	80009aa <USART_Init+0x56>
 80009a2:	f503 6380 	add.w	r3, r3, #1024	; 0x400
 80009a6:	429c      	cmp	r4, r3
 80009a8:	d101      	bne.n	80009ae <USART_Init+0x5a>
 80009aa:	9b03      	ldr	r3, [sp, #12]
 80009ac:	e000      	b.n	80009b0 <USART_Init+0x5c>
 80009ae:	9b02      	ldr	r3, [sp, #8]
 80009b0:	89a2      	ldrh	r2, [r4, #12]
 80009b2:	b212      	sxth	r2, r2
 80009b4:	2a00      	cmp	r2, #0
 80009b6:	682a      	ldr	r2, [r5, #0]
 80009b8:	f04f 0119 	mov.w	r1, #25
 80009bc:	bfb4      	ite	lt
 80009be:	0052      	lsllt	r2, r2, #1
 80009c0:	0092      	lslge	r2, r2, #2
 80009c2:	4359      	muls	r1, r3
 80009c4:	fbb1 f1f2 	udiv	r1, r1, r2
 80009c8:	2364      	movs	r3, #100	; 0x64
 80009ca:	fbb1 f2f3 	udiv	r2, r1, r3
 80009ce:	0112      	lsls	r2, r2, #4
 80009d0:	0910      	lsrs	r0, r2, #4
 80009d2:	fb03 1110 	mls	r1, r3, r0, r1
 80009d6:	89a0      	ldrh	r0, [r4, #12]
 80009d8:	b200      	sxth	r0, r0
 80009da:	2800      	cmp	r0, #0
 80009dc:	da06      	bge.n	80009ec <USART_Init+0x98>
 80009de:	00c9      	lsls	r1, r1, #3
 80009e0:	3132      	adds	r1, #50	; 0x32
 80009e2:	fbb1 f3f3 	udiv	r3, r1, r3
 80009e6:	f003 0307 	and.w	r3, r3, #7
 80009ea:	e005      	b.n	80009f8 <USART_Init+0xa4>
 80009ec:	0109      	lsls	r1, r1, #4
 80009ee:	3132      	adds	r1, #50	; 0x32
 80009f0:	fbb1 f3f3 	udiv	r3, r1, r3
 80009f4:	f003 030f 	and.w	r3, r3, #15
 80009f8:	431a      	orrs	r2, r3
 80009fa:	b292      	uxth	r2, r2
 80009fc:	8122      	strh	r2, [r4, #8]
 80009fe:	b005      	add	sp, #20
 8000a00:	bd30      	pop	{r4, r5, pc}
 8000a02:	bf00      	nop
 8000a04:	40011000 	.word	0x40011000

08000a08 <USART_Cmd>:
 8000a08:	8983      	ldrh	r3, [r0, #12]
 8000a0a:	b119      	cbz	r1, 8000a14 <USART_Cmd+0xc>
 8000a0c:	b29b      	uxth	r3, r3
 8000a0e:	f443 5300 	orr.w	r3, r3, #8192	; 0x2000
 8000a12:	e003      	b.n	8000a1c <USART_Cmd+0x14>
 8000a14:	f423 5300 	bic.w	r3, r3, #8192	; 0x2000
 8000a18:	041b      	lsls	r3, r3, #16
 8000a1a:	0c1b      	lsrs	r3, r3, #16
 8000a1c:	8183      	strh	r3, [r0, #12]
 8000a1e:	4770      	bx	lr

08000a20 <uart_write>:
 8000a20:	4b03      	ldr	r3, [pc, #12]	; (8000a30 <uart_write+0x10>)
 8000a22:	881a      	ldrh	r2, [r3, #0]
 8000a24:	0652      	lsls	r2, r2, #25
 8000a26:	d401      	bmi.n	8000a2c <uart_write+0xc>
 8000a28:	bf00      	nop
 8000a2a:	e7f9      	b.n	8000a20 <uart_write>
 8000a2c:	8098      	strh	r0, [r3, #4]
 8000a2e:	4770      	bx	lr
 8000a30:	40011000 	.word	0x40011000

08000a34 <uart_read>:
 8000a34:	4b04      	ldr	r3, [pc, #16]	; (8000a48 <uart_read+0x14>)
 8000a36:	881a      	ldrh	r2, [r3, #0]
 8000a38:	0691      	lsls	r1, r2, #26
 8000a3a:	d401      	bmi.n	8000a40 <uart_read+0xc>
 8000a3c:	bf00      	nop
 8000a3e:	e7f9      	b.n	8000a34 <uart_read>
 8000a40:	8898      	ldrh	r0, [r3, #4]
 8000a42:	b2c0      	uxtb	r0, r0
 8000a44:	4770      	bx	lr
 8000a46:	bf00      	nop
 8000a48:	40011000 	.word	0x40011000

08000a4c <uart_init>:
 8000a4c:	b530      	push	{r4, r5, lr}
 8000a4e:	2010      	movs	r0, #16
 8000a50:	b087      	sub	sp, #28
 8000a52:	2101      	movs	r1, #1
 8000a54:	f000 faa6 	bl	8000fa4 <RCC_APB2PeriphClockCmd>
 8000a58:	4d1b      	ldr	r5, [pc, #108]	; (8000ac8 <uart_init+0x7c>)
 8000a5a:	2002      	movs	r0, #2
 8000a5c:	2101      	movs	r1, #1
 8000a5e:	f000 fa89 	bl	8000f74 <RCC_AHB1PeriphClockCmd>
 8000a62:	23c0      	movs	r3, #192	; 0xc0
 8000a64:	2400      	movs	r4, #0
 8000a66:	9300      	str	r3, [sp, #0]
 8000a68:	4628      	mov	r0, r5
 8000a6a:	2302      	movs	r3, #2
 8000a6c:	4669      	mov	r1, sp
 8000a6e:	f88d 3004 	strb.w	r3, [sp, #4]
 8000a72:	f88d 3005 	strb.w	r3, [sp, #5]
 8000a76:	f88d 4006 	strb.w	r4, [sp, #6]
 8000a7a:	f88d 4007 	strb.w	r4, [sp, #7]
 8000a7e:	f000 fa9d 	bl	8000fbc <GPIO_Init>
 8000a82:	4628      	mov	r0, r5
 8000a84:	2106      	movs	r1, #6
 8000a86:	2207      	movs	r2, #7
 8000a88:	f000 fadd 	bl	8001046 <GPIO_PinAFConfig>
 8000a8c:	2107      	movs	r1, #7
 8000a8e:	460a      	mov	r2, r1
 8000a90:	4628      	mov	r0, r5
 8000a92:	f000 fad8 	bl	8001046 <GPIO_PinAFConfig>
 8000a96:	f8ad 400c 	strh.w	r4, [sp, #12]
 8000a9a:	f8ad 400e 	strh.w	r4, [sp, #14]
 8000a9e:	f8ad 4010 	strh.w	r4, [sp, #16]
 8000aa2:	f8ad 4014 	strh.w	r4, [sp, #20]
 8000aa6:	4c09      	ldr	r4, [pc, #36]	; (8000acc <uart_init+0x80>)
 8000aa8:	f44f 33e1 	mov.w	r3, #115200	; 0x1c200
 8000aac:	9302      	str	r3, [sp, #8]
 8000aae:	4620      	mov	r0, r4
 8000ab0:	230c      	movs	r3, #12
 8000ab2:	a902      	add	r1, sp, #8
 8000ab4:	f8ad 3012 	strh.w	r3, [sp, #18]
 8000ab8:	f7ff ff4c 	bl	8000954 <USART_Init>
 8000abc:	4620      	mov	r0, r4
 8000abe:	2101      	movs	r1, #1
 8000ac0:	f7ff ffa2 	bl	8000a08 <USART_Cmd>
 8000ac4:	b007      	add	sp, #28
 8000ac6:	bd30      	pop	{r4, r5, pc}
 8000ac8:	40020400 	.word	0x40020400
 8000acc:	40011000 	.word	0x40011000

08000ad0 <i2c_delay>:
 8000ad0:	bf00      	nop
 8000ad2:	bf00      	nop
 8000ad4:	4770      	bx	lr
	...

08000ad8 <SetLowSDA>:
 8000ad8:	b537      	push	{r0, r1, r2, r4, r5, lr}
 8000ada:	4d0d      	ldr	r5, [pc, #52]	; (8000b10 <SetLowSDA+0x38>)
 8000adc:	2301      	movs	r3, #1
 8000ade:	2202      	movs	r2, #2
 8000ae0:	2408      	movs	r4, #8
 8000ae2:	f88d 3004 	strb.w	r3, [sp, #4]
 8000ae6:	f88d 3006 	strb.w	r3, [sp, #6]
 8000aea:	4628      	mov	r0, r5
 8000aec:	2300      	movs	r3, #0
 8000aee:	4669      	mov	r1, sp
 8000af0:	f88d 2005 	strb.w	r2, [sp, #5]
 8000af4:	f88d 3007 	strb.w	r3, [sp, #7]
 8000af8:	9400      	str	r4, [sp, #0]
 8000afa:	f000 fa5f 	bl	8000fbc <GPIO_Init>
 8000afe:	4628      	mov	r0, r5
 8000b00:	4621      	mov	r1, r4
 8000b02:	f000 fa9e 	bl	8001042 <GPIO_ResetBits>
 8000b06:	f7ff ffe3 	bl	8000ad0 <i2c_delay>
 8000b0a:	b003      	add	sp, #12
 8000b0c:	bd30      	pop	{r4, r5, pc}
 8000b0e:	bf00      	nop
 8000b10:	40020000 	.word	0x40020000

08000b14 <SetHighSDA>:
 8000b14:	b537      	push	{r0, r1, r2, r4, r5, lr}
 8000b16:	4d0d      	ldr	r5, [pc, #52]	; (8000b4c <SetHighSDA+0x38>)
 8000b18:	2202      	movs	r2, #2
 8000b1a:	2300      	movs	r3, #0
 8000b1c:	2408      	movs	r4, #8
 8000b1e:	f88d 2005 	strb.w	r2, [sp, #5]
 8000b22:	4628      	mov	r0, r5
 8000b24:	2201      	movs	r2, #1
 8000b26:	4669      	mov	r1, sp
 8000b28:	f88d 3004 	strb.w	r3, [sp, #4]
 8000b2c:	f88d 2006 	strb.w	r2, [sp, #6]
 8000b30:	f88d 3007 	strb.w	r3, [sp, #7]
 8000b34:	9400      	str	r4, [sp, #0]
 8000b36:	f000 fa41 	bl	8000fbc <GPIO_Init>
 8000b3a:	4628      	mov	r0, r5
 8000b3c:	4621      	mov	r1, r4
 8000b3e:	f000 fa7e 	bl	800103e <GPIO_SetBits>
 8000b42:	f7ff ffc5 	bl	8000ad0 <i2c_delay>
 8000b46:	b003      	add	sp, #12
 8000b48:	bd30      	pop	{r4, r5, pc}
 8000b4a:	bf00      	nop
 8000b4c:	40020000 	.word	0x40020000

08000b50 <SetHighSCL>:
 8000b50:	b508      	push	{r3, lr}
 8000b52:	4804      	ldr	r0, [pc, #16]	; (8000b64 <SetHighSCL+0x14>)
 8000b54:	2104      	movs	r1, #4
 8000b56:	f000 fa72 	bl	800103e <GPIO_SetBits>
 8000b5a:	e8bd 4008 	ldmia.w	sp!, {r3, lr}
 8000b5e:	f7ff bfb7 	b.w	8000ad0 <i2c_delay>
 8000b62:	bf00      	nop
 8000b64:	40020000 	.word	0x40020000

08000b68 <i2c_0_init>:
 8000b68:	b507      	push	{r0, r1, r2, lr}
 8000b6a:	2001      	movs	r0, #1
 8000b6c:	4601      	mov	r1, r0
 8000b6e:	f000 fa01 	bl	8000f74 <RCC_AHB1PeriphClockCmd>
 8000b72:	230c      	movs	r3, #12
 8000b74:	9300      	str	r3, [sp, #0]
 8000b76:	2301      	movs	r3, #1
 8000b78:	2202      	movs	r2, #2
 8000b7a:	480b      	ldr	r0, [pc, #44]	; (8000ba8 <i2c_0_init+0x40>)
 8000b7c:	f88d 3004 	strb.w	r3, [sp, #4]
 8000b80:	4669      	mov	r1, sp
 8000b82:	f88d 3006 	strb.w	r3, [sp, #6]
 8000b86:	2300      	movs	r3, #0
 8000b88:	f88d 2005 	strb.w	r2, [sp, #5]
 8000b8c:	f88d 3007 	strb.w	r3, [sp, #7]
 8000b90:	f000 fa14 	bl	8000fbc <GPIO_Init>
 8000b94:	f7ff ffdc 	bl	8000b50 <SetHighSCL>
 8000b98:	f7ff ff9e 	bl	8000ad8 <SetLowSDA>
 8000b9c:	f7ff ffba 	bl	8000b14 <SetHighSDA>
 8000ba0:	b003      	add	sp, #12
 8000ba2:	f85d fb04 	ldr.w	pc, [sp], #4
 8000ba6:	bf00      	nop
 8000ba8:	40020000 	.word	0x40020000

08000bac <adc_init>:
 8000bac:	b530      	push	{r4, r5, lr}
 8000bae:	f44f 7080 	mov.w	r0, #256	; 0x100
 8000bb2:	b08d      	sub	sp, #52	; 0x34
 8000bb4:	2101      	movs	r1, #1
 8000bb6:	f000 f9f5 	bl	8000fa4 <RCC_APB2PeriphClockCmd>
 8000bba:	23ff      	movs	r3, #255	; 0xff
 8000bbc:	2400      	movs	r4, #0
 8000bbe:	4669      	mov	r1, sp
 8000bc0:	9300      	str	r3, [sp, #0]
 8000bc2:	4812      	ldr	r0, [pc, #72]	; (8000c0c <adc_init+0x60>)
 8000bc4:	f88d 4007 	strb.w	r4, [sp, #7]
 8000bc8:	2303      	movs	r3, #3
 8000bca:	f88d 3004 	strb.w	r3, [sp, #4]
 8000bce:	f000 f9f5 	bl	8000fbc <GPIO_Init>
 8000bd2:	a80c      	add	r0, sp, #48	; 0x30
 8000bd4:	4d0e      	ldr	r5, [pc, #56]	; (8000c10 <adc_init+0x64>)
 8000bd6:	f840 4d28 	str.w	r4, [r0, #-40]!
 8000bda:	f000 f841 	bl	8000c60 <ADC_CommonInit>
 8000bde:	4628      	mov	r0, r5
 8000be0:	a906      	add	r1, sp, #24
 8000be2:	9406      	str	r4, [sp, #24]
 8000be4:	f88d 401c 	strb.w	r4, [sp, #28]
 8000be8:	f88d 401d 	strb.w	r4, [sp, #29]
 8000bec:	9408      	str	r4, [sp, #32]
 8000bee:	940a      	str	r4, [sp, #40]	; 0x28
 8000bf0:	f000 f810 	bl	8000c14 <ADC_Init>
 8000bf4:	4628      	mov	r0, r5
 8000bf6:	2201      	movs	r2, #1
 8000bf8:	4623      	mov	r3, r4
 8000bfa:	210a      	movs	r1, #10
 8000bfc:	f000 f84d 	bl	8000c9a <ADC_RegularChannelConfig>
 8000c00:	4628      	mov	r0, r5
 8000c02:	2101      	movs	r1, #1
 8000c04:	f000 f840 	bl	8000c88 <ADC_Cmd>
 8000c08:	b00d      	add	sp, #52	; 0x34
 8000c0a:	bd30      	pop	{r4, r5, pc}
 8000c0c:	40020000 	.word	0x40020000
 8000c10:	40012000 	.word	0x40012000

08000c14 <ADC_Init>:
 8000c14:	6842      	ldr	r2, [r0, #4]
 8000c16:	680b      	ldr	r3, [r1, #0]
 8000c18:	f022 7240 	bic.w	r2, r2, #50331648	; 0x3000000
 8000c1c:	f422 7280 	bic.w	r2, r2, #256	; 0x100
 8000c20:	4313      	orrs	r3, r2
 8000c22:	790a      	ldrb	r2, [r1, #4]
 8000c24:	ea43 2302 	orr.w	r3, r3, r2, lsl #8
 8000c28:	6043      	str	r3, [r0, #4]
 8000c2a:	68ca      	ldr	r2, [r1, #12]
 8000c2c:	690b      	ldr	r3, [r1, #16]
 8000c2e:	431a      	orrs	r2, r3
 8000c30:	688b      	ldr	r3, [r1, #8]
 8000c32:	b510      	push	{r4, lr}
 8000c34:	431a      	orrs	r2, r3
 8000c36:	6884      	ldr	r4, [r0, #8]
 8000c38:	4b08      	ldr	r3, [pc, #32]	; (8000c5c <ADC_Init+0x48>)
 8000c3a:	4023      	ands	r3, r4
 8000c3c:	4313      	orrs	r3, r2
 8000c3e:	794a      	ldrb	r2, [r1, #5]
 8000c40:	ea43 0342 	orr.w	r3, r3, r2, lsl #1
 8000c44:	6083      	str	r3, [r0, #8]
 8000c46:	7d0b      	ldrb	r3, [r1, #20]
 8000c48:	6ac2      	ldr	r2, [r0, #44]	; 0x2c
 8000c4a:	3b01      	subs	r3, #1
 8000c4c:	f422 0270 	bic.w	r2, r2, #15728640	; 0xf00000
 8000c50:	b2db      	uxtb	r3, r3
 8000c52:	ea42 5303 	orr.w	r3, r2, r3, lsl #20
 8000c56:	62c3      	str	r3, [r0, #44]	; 0x2c
 8000c58:	bd10      	pop	{r4, pc}
 8000c5a:	bf00      	nop
 8000c5c:	c0fff7fd 	.word	0xc0fff7fd

08000c60 <ADC_CommonInit>:
 8000c60:	4a07      	ldr	r2, [pc, #28]	; (8000c80 <ADC_CommonInit+0x20>)
 8000c62:	4b08      	ldr	r3, [pc, #32]	; (8000c84 <ADC_CommonInit+0x24>)
 8000c64:	6851      	ldr	r1, [r2, #4]
 8000c66:	b510      	push	{r4, lr}
 8000c68:	400b      	ands	r3, r1
 8000c6a:	e890 0012 	ldmia.w	r0, {r1, r4}
 8000c6e:	430c      	orrs	r4, r1
 8000c70:	6881      	ldr	r1, [r0, #8]
 8000c72:	68c0      	ldr	r0, [r0, #12]
 8000c74:	4321      	orrs	r1, r4
 8000c76:	4301      	orrs	r1, r0
 8000c78:	430b      	orrs	r3, r1
 8000c7a:	6053      	str	r3, [r2, #4]
 8000c7c:	bd10      	pop	{r4, pc}
 8000c7e:	bf00      	nop
 8000c80:	40012300 	.word	0x40012300
 8000c84:	fffc30e0 	.word	0xfffc30e0

08000c88 <ADC_Cmd>:
 8000c88:	6883      	ldr	r3, [r0, #8]
 8000c8a:	b111      	cbz	r1, 8000c92 <ADC_Cmd+0xa>
 8000c8c:	f043 0301 	orr.w	r3, r3, #1
 8000c90:	e001      	b.n	8000c96 <ADC_Cmd+0xe>
 8000c92:	f023 0301 	bic.w	r3, r3, #1
 8000c96:	6083      	str	r3, [r0, #8]
 8000c98:	4770      	bx	lr

08000c9a <ADC_RegularChannelConfig>:
 8000c9a:	2909      	cmp	r1, #9
 8000c9c:	b570      	push	{r4, r5, r6, lr}
 8000c9e:	d90d      	bls.n	8000cbc <ADC_RegularChannelConfig+0x22>
 8000ca0:	2503      	movs	r5, #3
 8000ca2:	f1a1 040a 	sub.w	r4, r1, #10
 8000ca6:	436c      	muls	r4, r5
 8000ca8:	68c6      	ldr	r6, [r0, #12]
 8000caa:	2507      	movs	r5, #7
 8000cac:	40a5      	lsls	r5, r4
 8000cae:	ea26 0505 	bic.w	r5, r6, r5
 8000cb2:	40a3      	lsls	r3, r4
 8000cb4:	ea45 0403 	orr.w	r4, r5, r3
 8000cb8:	60c4      	str	r4, [r0, #12]
 8000cba:	e00b      	b.n	8000cd4 <ADC_RegularChannelConfig+0x3a>
 8000cbc:	6906      	ldr	r6, [r0, #16]
 8000cbe:	eb01 0441 	add.w	r4, r1, r1, lsl #1
 8000cc2:	2507      	movs	r5, #7
 8000cc4:	40a5      	lsls	r5, r4
 8000cc6:	ea26 0505 	bic.w	r5, r6, r5
 8000cca:	fa03 f404 	lsl.w	r4, r3, r4
 8000cce:	ea45 0304 	orr.w	r3, r5, r4
 8000cd2:	6103      	str	r3, [r0, #16]
 8000cd4:	2a06      	cmp	r2, #6
 8000cd6:	d80c      	bhi.n	8000cf2 <ADC_RegularChannelConfig+0x58>
 8000cd8:	2305      	movs	r3, #5
 8000cda:	3a01      	subs	r2, #1
 8000cdc:	435a      	muls	r2, r3
 8000cde:	6b44      	ldr	r4, [r0, #52]	; 0x34
 8000ce0:	231f      	movs	r3, #31
 8000ce2:	4093      	lsls	r3, r2
 8000ce4:	ea24 0303 	bic.w	r3, r4, r3
 8000ce8:	fa01 f202 	lsl.w	r2, r1, r2
 8000cec:	431a      	orrs	r2, r3
 8000cee:	6342      	str	r2, [r0, #52]	; 0x34
 8000cf0:	bd70      	pop	{r4, r5, r6, pc}
 8000cf2:	2a0c      	cmp	r2, #12
 8000cf4:	f04f 0305 	mov.w	r3, #5
 8000cf8:	d80b      	bhi.n	8000d12 <ADC_RegularChannelConfig+0x78>
 8000cfa:	3a07      	subs	r2, #7
 8000cfc:	6b05      	ldr	r5, [r0, #48]	; 0x30
 8000cfe:	4353      	muls	r3, r2
 8000d00:	241f      	movs	r4, #31
 8000d02:	409c      	lsls	r4, r3
 8000d04:	ea25 0404 	bic.w	r4, r5, r4
 8000d08:	fa01 f303 	lsl.w	r3, r1, r3
 8000d0c:	4323      	orrs	r3, r4
 8000d0e:	6303      	str	r3, [r0, #48]	; 0x30
 8000d10:	bd70      	pop	{r4, r5, r6, pc}
 8000d12:	3a0d      	subs	r2, #13
 8000d14:	435a      	muls	r2, r3
 8000d16:	6ac4      	ldr	r4, [r0, #44]	; 0x2c
 8000d18:	231f      	movs	r3, #31
 8000d1a:	4093      	lsls	r3, r2
 8000d1c:	ea24 0303 	bic.w	r3, r4, r3
 8000d20:	fa01 f202 	lsl.w	r2, r1, r2
 8000d24:	431a      	orrs	r2, r3
 8000d26:	62c2      	str	r2, [r0, #44]	; 0x2c
 8000d28:	bd70      	pop	{r4, r5, r6, pc}
	...

08000d2c <sys_tick_init>:
 8000d2c:	4b05      	ldr	r3, [pc, #20]	; (8000d44 <sys_tick_init+0x18>)
 8000d2e:	4a06      	ldr	r2, [pc, #24]	; (8000d48 <sys_tick_init+0x1c>)
 8000d30:	605a      	str	r2, [r3, #4]
 8000d32:	4a06      	ldr	r2, [pc, #24]	; (8000d4c <sys_tick_init+0x20>)
 8000d34:	21f0      	movs	r1, #240	; 0xf0
 8000d36:	f882 1023 	strb.w	r1, [r2, #35]	; 0x23
 8000d3a:	2200      	movs	r2, #0
 8000d3c:	609a      	str	r2, [r3, #8]
 8000d3e:	2207      	movs	r2, #7
 8000d40:	601a      	str	r2, [r3, #0]
 8000d42:	4770      	bx	lr
 8000d44:	e000e010 	.word	0xe000e010
 8000d48:	00029040 	.word	0x00029040
 8000d4c:	e000ed00 	.word	0xe000ed00

08000d50 <sleep>:
 8000d50:	bf30      	wfi
 8000d52:	4770      	bx	lr

08000d54 <sytem_clock_init>:
 8000d54:	f000 b800 	b.w	8000d58 <SystemInit>

08000d58 <SystemInit>:
 8000d58:	4b3b      	ldr	r3, [pc, #236]	; (8000e48 <SystemInit+0xf0>)
 8000d5a:	f8d3 2088 	ldr.w	r2, [r3, #136]	; 0x88
 8000d5e:	f442 0270 	orr.w	r2, r2, #15728640	; 0xf00000
 8000d62:	f8c3 2088 	str.w	r2, [r3, #136]	; 0x88
 8000d66:	f8d3 2088 	ldr.w	r2, [r3, #136]	; 0x88
 8000d6a:	f442 0270 	orr.w	r2, r2, #15728640	; 0xf00000
 8000d6e:	f8c3 2088 	str.w	r2, [r3, #136]	; 0x88
 8000d72:	4b36      	ldr	r3, [pc, #216]	; (8000e4c <SystemInit+0xf4>)
 8000d74:	681a      	ldr	r2, [r3, #0]
 8000d76:	f042 0201 	orr.w	r2, r2, #1
 8000d7a:	601a      	str	r2, [r3, #0]
 8000d7c:	2200      	movs	r2, #0
 8000d7e:	609a      	str	r2, [r3, #8]
 8000d80:	6819      	ldr	r1, [r3, #0]
 8000d82:	f021 7184 	bic.w	r1, r1, #17301504	; 0x1080000
 8000d86:	f421 3180 	bic.w	r1, r1, #65536	; 0x10000
 8000d8a:	6019      	str	r1, [r3, #0]
 8000d8c:	4930      	ldr	r1, [pc, #192]	; (8000e50 <SystemInit+0xf8>)
 8000d8e:	6059      	str	r1, [r3, #4]
 8000d90:	6819      	ldr	r1, [r3, #0]
 8000d92:	b082      	sub	sp, #8
 8000d94:	f421 2180 	bic.w	r1, r1, #262144	; 0x40000
 8000d98:	6019      	str	r1, [r3, #0]
 8000d9a:	60da      	str	r2, [r3, #12]
 8000d9c:	9200      	str	r2, [sp, #0]
 8000d9e:	9201      	str	r2, [sp, #4]
 8000da0:	681a      	ldr	r2, [r3, #0]
 8000da2:	f442 3280 	orr.w	r2, r2, #65536	; 0x10000
 8000da6:	601a      	str	r2, [r3, #0]
 8000da8:	4b28      	ldr	r3, [pc, #160]	; (8000e4c <SystemInit+0xf4>)
 8000daa:	681a      	ldr	r2, [r3, #0]
 8000dac:	f402 3200 	and.w	r2, r2, #131072	; 0x20000
 8000db0:	9201      	str	r2, [sp, #4]
 8000db2:	9a00      	ldr	r2, [sp, #0]
 8000db4:	3201      	adds	r2, #1
 8000db6:	9200      	str	r2, [sp, #0]
 8000db8:	9a01      	ldr	r2, [sp, #4]
 8000dba:	b91a      	cbnz	r2, 8000dc4 <SystemInit+0x6c>
 8000dbc:	9a00      	ldr	r2, [sp, #0]
 8000dbe:	f5b2 6fa0 	cmp.w	r2, #1280	; 0x500
 8000dc2:	d1f1      	bne.n	8000da8 <SystemInit+0x50>
 8000dc4:	681b      	ldr	r3, [r3, #0]
 8000dc6:	f413 3300 	ands.w	r3, r3, #131072	; 0x20000
 8000dca:	bf18      	it	ne
 8000dcc:	2301      	movne	r3, #1
 8000dce:	9301      	str	r3, [sp, #4]
 8000dd0:	9b01      	ldr	r3, [sp, #4]
 8000dd2:	2b01      	cmp	r3, #1
 8000dd4:	d005      	beq.n	8000de2 <SystemInit+0x8a>
 8000dd6:	4b1c      	ldr	r3, [pc, #112]	; (8000e48 <SystemInit+0xf0>)
 8000dd8:	f04f 6200 	mov.w	r2, #134217728	; 0x8000000
 8000ddc:	609a      	str	r2, [r3, #8]
 8000dde:	b002      	add	sp, #8
 8000de0:	4770      	bx	lr
 8000de2:	4b1a      	ldr	r3, [pc, #104]	; (8000e4c <SystemInit+0xf4>)
 8000de4:	6c1a      	ldr	r2, [r3, #64]	; 0x40
 8000de6:	f042 5280 	orr.w	r2, r2, #268435456	; 0x10000000
 8000dea:	641a      	str	r2, [r3, #64]	; 0x40
 8000dec:	4a19      	ldr	r2, [pc, #100]	; (8000e54 <SystemInit+0xfc>)
 8000dee:	6811      	ldr	r1, [r2, #0]
 8000df0:	f441 4180 	orr.w	r1, r1, #16384	; 0x4000
 8000df4:	6011      	str	r1, [r2, #0]
 8000df6:	689a      	ldr	r2, [r3, #8]
 8000df8:	f042 0290 	orr.w	r2, r2, #144	; 0x90
 8000dfc:	609a      	str	r2, [r3, #8]
 8000dfe:	689a      	ldr	r2, [r3, #8]
 8000e00:	f442 4200 	orr.w	r2, r2, #32768	; 0x8000
 8000e04:	609a      	str	r2, [r3, #8]
 8000e06:	689a      	ldr	r2, [r3, #8]
 8000e08:	f442 52a0 	orr.w	r2, r2, #5120	; 0x1400
 8000e0c:	609a      	str	r2, [r3, #8]
 8000e0e:	4a12      	ldr	r2, [pc, #72]	; (8000e58 <SystemInit+0x100>)
 8000e10:	605a      	str	r2, [r3, #4]
 8000e12:	681a      	ldr	r2, [r3, #0]
 8000e14:	f042 7280 	orr.w	r2, r2, #16777216	; 0x1000000
 8000e18:	601a      	str	r2, [r3, #0]
 8000e1a:	6819      	ldr	r1, [r3, #0]
 8000e1c:	4a0b      	ldr	r2, [pc, #44]	; (8000e4c <SystemInit+0xf4>)
 8000e1e:	0189      	lsls	r1, r1, #6
 8000e20:	d5fb      	bpl.n	8000e1a <SystemInit+0xc2>
 8000e22:	4b0e      	ldr	r3, [pc, #56]	; (8000e5c <SystemInit+0x104>)
 8000e24:	f240 6105 	movw	r1, #1541	; 0x605
 8000e28:	6019      	str	r1, [r3, #0]
 8000e2a:	6893      	ldr	r3, [r2, #8]
 8000e2c:	f023 0303 	bic.w	r3, r3, #3
 8000e30:	6093      	str	r3, [r2, #8]
 8000e32:	6893      	ldr	r3, [r2, #8]
 8000e34:	f043 0302 	orr.w	r3, r3, #2
 8000e38:	6093      	str	r3, [r2, #8]
 8000e3a:	4b04      	ldr	r3, [pc, #16]	; (8000e4c <SystemInit+0xf4>)
 8000e3c:	689b      	ldr	r3, [r3, #8]
 8000e3e:	f003 030c 	and.w	r3, r3, #12
 8000e42:	2b08      	cmp	r3, #8
 8000e44:	d1f9      	bne.n	8000e3a <SystemInit+0xe2>
 8000e46:	e7c6      	b.n	8000dd6 <SystemInit+0x7e>
 8000e48:	e000ed00 	.word	0xe000ed00
 8000e4c:	40023800 	.word	0x40023800
 8000e50:	24003010 	.word	0x24003010
 8000e54:	40007000 	.word	0x40007000
 8000e58:	07405408 	.word	0x07405408
 8000e5c:	40023c00 	.word	0x40023c00

08000e60 <NVIC_Init>:
 8000e60:	78c2      	ldrb	r2, [r0, #3]
 8000e62:	7803      	ldrb	r3, [r0, #0]
 8000e64:	b510      	push	{r4, lr}
 8000e66:	b30a      	cbz	r2, 8000eac <NVIC_Init+0x4c>
 8000e68:	4a16      	ldr	r2, [pc, #88]	; (8000ec4 <NVIC_Init+0x64>)
 8000e6a:	7844      	ldrb	r4, [r0, #1]
 8000e6c:	68d2      	ldr	r2, [r2, #12]
 8000e6e:	43d2      	mvns	r2, r2
 8000e70:	f3c2 2202 	ubfx	r2, r2, #8, #3
 8000e74:	f1c2 0104 	rsb	r1, r2, #4
 8000e78:	b2c9      	uxtb	r1, r1
 8000e7a:	fa04 f101 	lsl.w	r1, r4, r1
 8000e7e:	240f      	movs	r4, #15
 8000e80:	fa44 f202 	asr.w	r2, r4, r2
 8000e84:	7884      	ldrb	r4, [r0, #2]
 8000e86:	b2c9      	uxtb	r1, r1
 8000e88:	4022      	ands	r2, r4
 8000e8a:	430a      	orrs	r2, r1
 8000e8c:	f103 4360 	add.w	r3, r3, #3758096384	; 0xe0000000
 8000e90:	f503 4361 	add.w	r3, r3, #57600	; 0xe100
 8000e94:	0112      	lsls	r2, r2, #4
 8000e96:	b2d2      	uxtb	r2, r2
 8000e98:	f883 2300 	strb.w	r2, [r3, #768]	; 0x300
 8000e9c:	7803      	ldrb	r3, [r0, #0]
 8000e9e:	2201      	movs	r2, #1
 8000ea0:	0959      	lsrs	r1, r3, #5
 8000ea2:	f003 031f 	and.w	r3, r3, #31
 8000ea6:	fa02 f303 	lsl.w	r3, r2, r3
 8000eaa:	e006      	b.n	8000eba <NVIC_Init+0x5a>
 8000eac:	0959      	lsrs	r1, r3, #5
 8000eae:	2201      	movs	r2, #1
 8000eb0:	f003 031f 	and.w	r3, r3, #31
 8000eb4:	fa02 f303 	lsl.w	r3, r2, r3
 8000eb8:	3120      	adds	r1, #32
 8000eba:	4a03      	ldr	r2, [pc, #12]	; (8000ec8 <NVIC_Init+0x68>)
 8000ebc:	f842 3021 	str.w	r3, [r2, r1, lsl #2]
 8000ec0:	bd10      	pop	{r4, pc}
 8000ec2:	bf00      	nop
 8000ec4:	e000ed00 	.word	0xe000ed00
 8000ec8:	e000e100 	.word	0xe000e100

08000ecc <lib_low_level_init>:
 8000ecc:	b508      	push	{r3, lr}
 8000ece:	f7ff ff41 	bl	8000d54 <sytem_clock_init>
 8000ed2:	f000 f8db 	bl	800108c <gpio_init>
 8000ed6:	f7ff fdb9 	bl	8000a4c <uart_init>
 8000eda:	f7ff fca7 	bl	800082c <timer_init>
 8000ede:	f7ff fe65 	bl	8000bac <adc_init>
 8000ee2:	e8bd 4008 	ldmia.w	sp!, {r3, lr}
 8000ee6:	f7ff be3f 	b.w	8000b68 <i2c_0_init>
	...

08000eec <RCC_GetClocksFreq>:
 8000eec:	4b1d      	ldr	r3, [pc, #116]	; (8000f64 <RCC_GetClocksFreq+0x78>)
 8000eee:	689a      	ldr	r2, [r3, #8]
 8000ef0:	f002 020c 	and.w	r2, r2, #12
 8000ef4:	2a04      	cmp	r2, #4
 8000ef6:	b510      	push	{r4, lr}
 8000ef8:	d003      	beq.n	8000f02 <RCC_GetClocksFreq+0x16>
 8000efa:	2a08      	cmp	r2, #8
 8000efc:	d003      	beq.n	8000f06 <RCC_GetClocksFreq+0x1a>
 8000efe:	4b1a      	ldr	r3, [pc, #104]	; (8000f68 <RCC_GetClocksFreq+0x7c>)
 8000f00:	e018      	b.n	8000f34 <RCC_GetClocksFreq+0x48>
 8000f02:	4b1a      	ldr	r3, [pc, #104]	; (8000f6c <RCC_GetClocksFreq+0x80>)
 8000f04:	e016      	b.n	8000f34 <RCC_GetClocksFreq+0x48>
 8000f06:	6859      	ldr	r1, [r3, #4]
 8000f08:	685a      	ldr	r2, [r3, #4]
 8000f0a:	f411 0f80 	tst.w	r1, #4194304	; 0x400000
 8000f0e:	6859      	ldr	r1, [r3, #4]
 8000f10:	bf14      	ite	ne
 8000f12:	4b16      	ldrne	r3, [pc, #88]	; (8000f6c <RCC_GetClocksFreq+0x80>)
 8000f14:	4b14      	ldreq	r3, [pc, #80]	; (8000f68 <RCC_GetClocksFreq+0x7c>)
 8000f16:	f002 023f 	and.w	r2, r2, #63	; 0x3f
 8000f1a:	fbb3 f3f2 	udiv	r3, r3, r2
 8000f1e:	4a11      	ldr	r2, [pc, #68]	; (8000f64 <RCC_GetClocksFreq+0x78>)
 8000f20:	6852      	ldr	r2, [r2, #4]
 8000f22:	f3c2 4201 	ubfx	r2, r2, #16, #2
 8000f26:	f3c1 1188 	ubfx	r1, r1, #6, #9
 8000f2a:	3201      	adds	r2, #1
 8000f2c:	434b      	muls	r3, r1
 8000f2e:	0052      	lsls	r2, r2, #1
 8000f30:	fbb3 f3f2 	udiv	r3, r3, r2
 8000f34:	490b      	ldr	r1, [pc, #44]	; (8000f64 <RCC_GetClocksFreq+0x78>)
 8000f36:	6003      	str	r3, [r0, #0]
 8000f38:	688b      	ldr	r3, [r1, #8]
 8000f3a:	4a0d      	ldr	r2, [pc, #52]	; (8000f70 <RCC_GetClocksFreq+0x84>)
 8000f3c:	f3c3 1303 	ubfx	r3, r3, #4, #4
 8000f40:	5cd4      	ldrb	r4, [r2, r3]
 8000f42:	6803      	ldr	r3, [r0, #0]
 8000f44:	40e3      	lsrs	r3, r4
 8000f46:	6043      	str	r3, [r0, #4]
 8000f48:	688c      	ldr	r4, [r1, #8]
 8000f4a:	f3c4 2482 	ubfx	r4, r4, #10, #3
 8000f4e:	5d14      	ldrb	r4, [r2, r4]
 8000f50:	fa23 f404 	lsr.w	r4, r3, r4
 8000f54:	6084      	str	r4, [r0, #8]
 8000f56:	6889      	ldr	r1, [r1, #8]
 8000f58:	f3c1 3142 	ubfx	r1, r1, #13, #3
 8000f5c:	5c52      	ldrb	r2, [r2, r1]
 8000f5e:	40d3      	lsrs	r3, r2
 8000f60:	60c3      	str	r3, [r0, #12]
 8000f62:	bd10      	pop	{r4, pc}
 8000f64:	40023800 	.word	0x40023800
 8000f68:	00f42400 	.word	0x00f42400
 8000f6c:	007a1200 	.word	0x007a1200
 8000f70:	20000000 	.word	0x20000000

08000f74 <RCC_AHB1PeriphClockCmd>:
 8000f74:	4b04      	ldr	r3, [pc, #16]	; (8000f88 <RCC_AHB1PeriphClockCmd+0x14>)
 8000f76:	6b1a      	ldr	r2, [r3, #48]	; 0x30
 8000f78:	b109      	cbz	r1, 8000f7e <RCC_AHB1PeriphClockCmd+0xa>
 8000f7a:	4310      	orrs	r0, r2
 8000f7c:	e001      	b.n	8000f82 <RCC_AHB1PeriphClockCmd+0xe>
 8000f7e:	ea22 0000 	bic.w	r0, r2, r0
 8000f82:	6318      	str	r0, [r3, #48]	; 0x30
 8000f84:	4770      	bx	lr
 8000f86:	bf00      	nop
 8000f88:	40023800 	.word	0x40023800

08000f8c <RCC_APB1PeriphClockCmd>:
 8000f8c:	4b04      	ldr	r3, [pc, #16]	; (8000fa0 <RCC_APB1PeriphClockCmd+0x14>)
 8000f8e:	6c1a      	ldr	r2, [r3, #64]	; 0x40
 8000f90:	b109      	cbz	r1, 8000f96 <RCC_APB1PeriphClockCmd+0xa>
 8000f92:	4310      	orrs	r0, r2
 8000f94:	e001      	b.n	8000f9a <RCC_APB1PeriphClockCmd+0xe>
 8000f96:	ea22 0000 	bic.w	r0, r2, r0
 8000f9a:	6418      	str	r0, [r3, #64]	; 0x40
 8000f9c:	4770      	bx	lr
 8000f9e:	bf00      	nop
 8000fa0:	40023800 	.word	0x40023800

08000fa4 <RCC_APB2PeriphClockCmd>:
 8000fa4:	4b04      	ldr	r3, [pc, #16]	; (8000fb8 <RCC_APB2PeriphClockCmd+0x14>)
 8000fa6:	6c5a      	ldr	r2, [r3, #68]	; 0x44
 8000fa8:	b109      	cbz	r1, 8000fae <RCC_APB2PeriphClockCmd+0xa>
 8000faa:	4310      	orrs	r0, r2
 8000fac:	e001      	b.n	8000fb2 <RCC_APB2PeriphClockCmd+0xe>
 8000fae:	ea22 0000 	bic.w	r0, r2, r0
 8000fb2:	6458      	str	r0, [r3, #68]	; 0x44
 8000fb4:	4770      	bx	lr
 8000fb6:	bf00      	nop
 8000fb8:	40023800 	.word	0x40023800

08000fbc <GPIO_Init>:
 8000fbc:	e92d 41f0 	stmdb	sp!, {r4, r5, r6, r7, r8, lr}
 8000fc0:	680f      	ldr	r7, [r1, #0]
 8000fc2:	2300      	movs	r3, #0
 8000fc4:	2201      	movs	r2, #1
 8000fc6:	409a      	lsls	r2, r3
 8000fc8:	ea02 0507 	and.w	r5, r2, r7
 8000fcc:	4295      	cmp	r5, r2
 8000fce:	d131      	bne.n	8001034 <GPIO_Init+0x78>
 8000fd0:	005a      	lsls	r2, r3, #1
 8000fd2:	2403      	movs	r4, #3
 8000fd4:	6806      	ldr	r6, [r0, #0]
 8000fd6:	4094      	lsls	r4, r2
 8000fd8:	43e4      	mvns	r4, r4
 8000fda:	4026      	ands	r6, r4
 8000fdc:	6006      	str	r6, [r0, #0]
 8000fde:	790e      	ldrb	r6, [r1, #4]
 8000fe0:	f8d0 c000 	ldr.w	ip, [r0]
 8000fe4:	fa06 f802 	lsl.w	r8, r6, r2
 8000fe8:	3e01      	subs	r6, #1
 8000fea:	b2f6      	uxtb	r6, r6
 8000fec:	ea48 0c0c 	orr.w	ip, r8, ip
 8000ff0:	2e01      	cmp	r6, #1
 8000ff2:	f8c0 c000 	str.w	ip, [r0]
 8000ff6:	d814      	bhi.n	8001022 <GPIO_Init+0x66>
 8000ff8:	6886      	ldr	r6, [r0, #8]
 8000ffa:	f891 c005 	ldrb.w	ip, [r1, #5]
 8000ffe:	4026      	ands	r6, r4
 8001000:	6086      	str	r6, [r0, #8]
 8001002:	6886      	ldr	r6, [r0, #8]
 8001004:	fa0c fc02 	lsl.w	ip, ip, r2
 8001008:	ea4c 0606 	orr.w	r6, ip, r6
 800100c:	6086      	str	r6, [r0, #8]
 800100e:	6846      	ldr	r6, [r0, #4]
 8001010:	ea26 0505 	bic.w	r5, r6, r5
 8001014:	6045      	str	r5, [r0, #4]
 8001016:	798d      	ldrb	r5, [r1, #6]
 8001018:	6846      	ldr	r6, [r0, #4]
 800101a:	409d      	lsls	r5, r3
 800101c:	b2ad      	uxth	r5, r5
 800101e:	4335      	orrs	r5, r6
 8001020:	6045      	str	r5, [r0, #4]
 8001022:	68c5      	ldr	r5, [r0, #12]
 8001024:	402c      	ands	r4, r5
 8001026:	60c4      	str	r4, [r0, #12]
 8001028:	79cd      	ldrb	r5, [r1, #7]
 800102a:	68c4      	ldr	r4, [r0, #12]
 800102c:	fa05 f202 	lsl.w	r2, r5, r2
 8001030:	4322      	orrs	r2, r4
 8001032:	60c2      	str	r2, [r0, #12]
 8001034:	3301      	adds	r3, #1
 8001036:	2b10      	cmp	r3, #16
 8001038:	d1c4      	bne.n	8000fc4 <GPIO_Init+0x8>
 800103a:	e8bd 81f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, pc}

0800103e <GPIO_SetBits>:
 800103e:	8301      	strh	r1, [r0, #24]
 8001040:	4770      	bx	lr

08001042 <GPIO_ResetBits>:
 8001042:	8341      	strh	r1, [r0, #26]
 8001044:	4770      	bx	lr

08001046 <GPIO_PinAFConfig>:
 8001046:	f001 0307 	and.w	r3, r1, #7
 800104a:	08c9      	lsrs	r1, r1, #3
 800104c:	eb00 0081 	add.w	r0, r0, r1, lsl #2
 8001050:	b510      	push	{r4, lr}
 8001052:	009b      	lsls	r3, r3, #2
 8001054:	6a04      	ldr	r4, [r0, #32]
 8001056:	210f      	movs	r1, #15
 8001058:	4099      	lsls	r1, r3
 800105a:	ea24 0101 	bic.w	r1, r4, r1
 800105e:	6201      	str	r1, [r0, #32]
 8001060:	6a01      	ldr	r1, [r0, #32]
 8001062:	409a      	lsls	r2, r3
 8001064:	4311      	orrs	r1, r2
 8001066:	6201      	str	r1, [r0, #32]
 8001068:	bd10      	pop	{r4, pc}
	...

0800106c <led_on>:
 800106c:	b672      	cpsid	i
 800106e:	4b02      	ldr	r3, [pc, #8]	; (8001078 <led_on+0xc>)
 8001070:	b280      	uxth	r0, r0
 8001072:	8318      	strh	r0, [r3, #24]
 8001074:	b662      	cpsie	i
 8001076:	4770      	bx	lr
 8001078:	40020c00 	.word	0x40020c00

0800107c <led_off>:
 800107c:	b672      	cpsid	i
 800107e:	4b02      	ldr	r3, [pc, #8]	; (8001088 <led_off+0xc>)
 8001080:	b280      	uxth	r0, r0
 8001082:	8358      	strh	r0, [r3, #26]
 8001084:	b662      	cpsie	i
 8001086:	4770      	bx	lr
 8001088:	40020c00 	.word	0x40020c00

0800108c <gpio_init>:
 800108c:	b537      	push	{r0, r1, r2, r4, r5, lr}
 800108e:	2001      	movs	r0, #1
 8001090:	4601      	mov	r1, r0
 8001092:	f7ff ff6f 	bl	8000f74 <RCC_AHB1PeriphClockCmd>
 8001096:	2002      	movs	r0, #2
 8001098:	2101      	movs	r1, #1
 800109a:	f7ff ff6b 	bl	8000f74 <RCC_AHB1PeriphClockCmd>
 800109e:	2004      	movs	r0, #4
 80010a0:	2101      	movs	r1, #1
 80010a2:	f7ff ff67 	bl	8000f74 <RCC_AHB1PeriphClockCmd>
 80010a6:	2008      	movs	r0, #8
 80010a8:	2101      	movs	r1, #1
 80010aa:	f7ff ff63 	bl	8000f74 <RCC_AHB1PeriphClockCmd>
 80010ae:	2008      	movs	r0, #8
 80010b0:	2101      	movs	r1, #1
 80010b2:	f7ff ff5f 	bl	8000f74 <RCC_AHB1PeriphClockCmd>
 80010b6:	2010      	movs	r0, #16
 80010b8:	2101      	movs	r1, #1
 80010ba:	f7ff ff5b 	bl	8000f74 <RCC_AHB1PeriphClockCmd>
 80010be:	2020      	movs	r0, #32
 80010c0:	2101      	movs	r1, #1
 80010c2:	f7ff ff57 	bl	8000f74 <RCC_AHB1PeriphClockCmd>
 80010c6:	f44f 43e0 	mov.w	r3, #28672	; 0x7000
 80010ca:	2400      	movs	r4, #0
 80010cc:	9300      	str	r3, [sp, #0]
 80010ce:	2501      	movs	r5, #1
 80010d0:	2303      	movs	r3, #3
 80010d2:	4669      	mov	r1, sp
 80010d4:	4811      	ldr	r0, [pc, #68]	; (800111c <gpio_init+0x90>)
 80010d6:	f88d 3005 	strb.w	r3, [sp, #5]
 80010da:	f88d 5004 	strb.w	r5, [sp, #4]
 80010de:	f88d 4006 	strb.w	r4, [sp, #6]
 80010e2:	f88d 4007 	strb.w	r4, [sp, #7]
 80010e6:	f7ff ff69 	bl	8000fbc <GPIO_Init>
 80010ea:	2302      	movs	r3, #2
 80010ec:	4669      	mov	r1, sp
 80010ee:	480c      	ldr	r0, [pc, #48]	; (8001120 <gpio_init+0x94>)
 80010f0:	f88d 3005 	strb.w	r3, [sp, #5]
 80010f4:	9500      	str	r5, [sp, #0]
 80010f6:	f88d 4004 	strb.w	r4, [sp, #4]
 80010fa:	f7ff ff5f 	bl	8000fbc <GPIO_Init>
 80010fe:	f44f 5080 	mov.w	r0, #4096	; 0x1000
 8001102:	f7ff ffbb 	bl	800107c <led_off>
 8001106:	f44f 5000 	mov.w	r0, #8192	; 0x2000
 800110a:	f7ff ffb7 	bl	800107c <led_off>
 800110e:	f44f 4080 	mov.w	r0, #16384	; 0x4000
 8001112:	f7ff ffb3 	bl	800107c <led_off>
 8001116:	b003      	add	sp, #12
 8001118:	bd30      	pop	{r4, r5, pc}
 800111a:	bf00      	nop
 800111c:	40020c00 	.word	0x40020c00
 8001120:	40020000 	.word	0x40020000

08001124 <Default_Handler>:
 8001124:	4668      	mov	r0, sp
 8001126:	f020 0107 	bic.w	r1, r0, #7
 800112a:	468d      	mov	sp, r1
 800112c:	bf00      	nop
 800112e:	e7fd      	b.n	800112c <Default_Handler+0x8>

08001130 <HardFault_Handler>:
 8001130:	f44f 5080 	mov.w	r0, #4096	; 0x1000
 8001134:	f7ff ff9a 	bl	800106c <led_on>
 8001138:	4b06      	ldr	r3, [pc, #24]	; (8001154 <HardFault_Handler+0x24>)
 800113a:	3b01      	subs	r3, #1
 800113c:	d001      	beq.n	8001142 <HardFault_Handler+0x12>
 800113e:	bf00      	nop
 8001140:	e7fb      	b.n	800113a <HardFault_Handler+0xa>
 8001142:	f44f 5080 	mov.w	r0, #4096	; 0x1000
 8001146:	f7ff ff99 	bl	800107c <led_off>
 800114a:	4b02      	ldr	r3, [pc, #8]	; (8001154 <HardFault_Handler+0x24>)
 800114c:	3b01      	subs	r3, #1
 800114e:	d0ef      	beq.n	8001130 <HardFault_Handler>
 8001150:	bf00      	nop
 8001152:	e7fb      	b.n	800114c <HardFault_Handler+0x1c>
 8001154:	00989681 	.word	0x00989681

08001158 <_reset_init>:
 8001158:	4a0e      	ldr	r2, [pc, #56]	; (8001194 <_reset_init+0x3c>)
 800115a:	480f      	ldr	r0, [pc, #60]	; (8001198 <_reset_init+0x40>)
 800115c:	1a80      	subs	r0, r0, r2
 800115e:	1080      	asrs	r0, r0, #2
 8001160:	2300      	movs	r3, #0
 8001162:	4283      	cmp	r3, r0
 8001164:	d006      	beq.n	8001174 <_reset_init+0x1c>
 8001166:	490d      	ldr	r1, [pc, #52]	; (800119c <_reset_init+0x44>)
 8001168:	f851 1023 	ldr.w	r1, [r1, r3, lsl #2]
 800116c:	f842 1023 	str.w	r1, [r2, r3, lsl #2]
 8001170:	3301      	adds	r3, #1
 8001172:	e7f6      	b.n	8001162 <_reset_init+0xa>
 8001174:	4b0a      	ldr	r3, [pc, #40]	; (80011a0 <_reset_init+0x48>)
 8001176:	f8d3 2088 	ldr.w	r2, [r3, #136]	; 0x88
 800117a:	f442 0270 	orr.w	r2, r2, #15728640	; 0xf00000
 800117e:	f8c3 2088 	str.w	r2, [r3, #136]	; 0x88
 8001182:	f503 730c 	add.w	r3, r3, #560	; 0x230
 8001186:	685a      	ldr	r2, [r3, #4]
 8001188:	f022 4240 	bic.w	r2, r2, #3221225472	; 0xc0000000
 800118c:	605a      	str	r2, [r3, #4]
 800118e:	f7ff bae9 	b.w	8000764 <main>
 8001192:	bf00      	nop
 8001194:	20000000 	.word	0x20000000
 8001198:	20000010 	.word	0x20000010
 800119c:	080012bc 	.word	0x080012bc
 80011a0:	e000ed00 	.word	0xe000ed00

080011a4 <_init>:
 80011a4:	e1a0c00d 	mov	ip, sp
 80011a8:	e92ddff8 	push	{r3, r4, r5, r6, r7, r8, r9, sl, fp, ip, lr, pc}
 80011ac:	e24cb004 	sub	fp, ip, #4
 80011b0:	e24bd028 	sub	sp, fp, #40	; 0x28
 80011b4:	e89d6ff0 	ldm	sp, {r4, r5, r6, r7, r8, r9, sl, fp, sp, lr}
 80011b8:	e12fff1e 	bx	lr

080011bc <_fini>:
 80011bc:	e1a0c00d 	mov	ip, sp
 80011c0:	e92ddff8 	push	{r3, r4, r5, r6, r7, r8, r9, sl, fp, ip, lr, pc}
 80011c4:	e24cb004 	sub	fp, ip, #4
 80011c8:	e24bd028 	sub	sp, fp, #40	; 0x28
 80011cc:	e89d6ff0 	ldm	sp, {r4, r5, r6, r7, r8, r9, sl, fp, sp, lr}
 80011d0:	e12fff1e 	bx	lr
 80011d4:	69647473 	.word	0x69647473
 80011d8:	6e69206f 	.word	0x6e69206f
 80011dc:	64207469 	.word	0x64207469
 80011e0:	0a656e6f 	.word	0x0a656e6f
 80011e4:	00          	.byte	0x00
 80011e5:	63          	.byte	0x63
 80011e6:	6168      	.short	0x6168
 80011e8:	253e2072 	.word	0x253e2072
 80011ec:	000a3c63 	.word	0x000a3c63
 80011f0:	6c696863 	.word	0x6c696863
 80011f4:	20312064 	.word	0x20312064
 80011f8:	65726874 	.word	0x65726874
 80011fc:	31206461 	.word	0x31206461
 8001200:	31313131 	.word	0x31313131
 8001204:	000a3131 	.word	0x000a3131
 8001208:	6c696863 	.word	0x6c696863
 800120c:	20322064 	.word	0x20322064
 8001210:	65726874 	.word	0x65726874
 8001214:	32206461 	.word	0x32206461
 8001218:	32323232 	.word	0x32323232
 800121c:	000a3232 	.word	0x000a3232
 8001220:	6c65770a 	.word	0x6c65770a
 8001224:	656d6f63 	.word	0x656d6f63
 8001228:	206f7420 	.word	0x206f7420
 800122c:	757a7553 	.word	0x757a7553
 8001230:	534f6168 	.word	0x534f6168
 8001234:	5e5f5e20 	.word	0x5e5f5e20
 8001238:	322e3220 	.word	0x322e3220
 800123c:	420a302e 	.word	0x420a302e
 8001240:	444c4955 	.word	0x444c4955
 8001244:	72704120 	.word	0x72704120
 8001248:	20373220 	.word	0x20373220
 800124c:	36313032 	.word	0x36313032
 8001250:	3a333120 	.word	0x3a333120
 8001254:	323a3432 	.word	0x323a3432
 8001258:	6d000a38 	.word	0x6d000a38
 800125c:	206e6961 	.word	0x206e6961
 8001260:	65726874 	.word	0x65726874
 8001264:	000a6461 	.word	0x000a6461
 8001268:	746f6f62 	.word	0x746f6f62
 800126c:	20676e69 	.word	0x20676e69
 8001270:	6d6f7266 	.word	0x6d6f7266
 8001274:	0a752520 	.word	0x0a752520
 8001278:	6d617200 	.word	0x6d617200
 800127c:	61747320 	.word	0x61747320
 8001280:	25207472 	.word	0x25207472
 8001284:	000a2075 	.word	0x000a2075
 8001288:	206d6172 	.word	0x206d6172
 800128c:	657a6973 	.word	0x657a6973
 8001290:	20752520 	.word	0x20752520
 8001294:	6172000a 	.word	0x6172000a
 8001298:	7266206d 	.word	0x7266206d
 800129c:	25206565 	.word	0x25206565
 80012a0:	000a2075 	.word	0x000a2075
 80012a4:	70616568 	.word	0x70616568
 80012a8:	61747320 	.word	0x61747320
 80012ac:	25207472 	.word	0x25207472
 80012b0:	000a2075 	.word	0x000a2075
 80012b4:	00000a0a 	.word	0x00000a0a

080012b8 <__EH_FRAME_BEGIN__>:
 80012b8:	00000000                                ....
