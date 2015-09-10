
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
 80001aa:	f000 ffd9 	bl	8001160 <sleep>
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
 8000264:	bf00      	nop
 8000266:	4770      	bx	lr

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
 8000282:	f000 ff5b 	bl	800113c <sys_tick_init>
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
 800034e:	4b0d      	ldr	r3, [pc, #52]	; (8000384 <set_wait_state+0x40>)
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
 8000372:	0791      	lsls	r1, r2, #30
 8000374:	d500      	bpl.n	8000378 <set_wait_state+0x34>
 8000376:	bf00      	nop
 8000378:	9a01      	ldr	r2, [sp, #4]
 800037a:	0792      	lsls	r2, r2, #30
 800037c:	d4f0      	bmi.n	8000360 <set_wait_state+0x1c>
 800037e:	b003      	add	sp, #12
 8000380:	f85d fb04 	ldr.w	pc, [sp], #4
 8000384:	20000010 	.word	0x20000010

08000388 <wake_up_threads>:
 8000388:	2300      	movs	r3, #0
 800038a:	b672      	cpsid	i
 800038c:	4a06      	ldr	r2, [pc, #24]	; (80003a8 <wake_up_threads+0x20>)
 800038e:	210c      	movs	r1, #12
 8000390:	fb01 2203 	mla	r2, r1, r3, r2
 8000394:	6851      	ldr	r1, [r2, #4]
 8000396:	f021 0102 	bic.w	r1, r1, #2
 800039a:	6051      	str	r1, [r2, #4]
 800039c:	b662      	cpsie	i
 800039e:	3301      	adds	r3, #1
 80003a0:	2b08      	cmp	r3, #8
 80003a2:	d1f2      	bne.n	800038a <wake_up_threads+0x2>
 80003a4:	4770      	bx	lr
 80003a6:	bf00      	nop
 80003a8:	20000010 	.word	0x20000010

080003ac <join>:
 80003ac:	b082      	sub	sp, #8
 80003ae:	9001      	str	r0, [sp, #4]
 80003b0:	bf00      	nop
 80003b2:	b672      	cpsid	i
 80003b4:	4a06      	ldr	r2, [pc, #24]	; (80003d0 <join+0x24>)
 80003b6:	9b01      	ldr	r3, [sp, #4]
 80003b8:	210c      	movs	r1, #12
 80003ba:	fb01 2303 	mla	r3, r1, r3, r2
 80003be:	685b      	ldr	r3, [r3, #4]
 80003c0:	9300      	str	r3, [sp, #0]
 80003c2:	b662      	cpsie	i
 80003c4:	9b00      	ldr	r3, [sp, #0]
 80003c6:	07d8      	lsls	r0, r3, #31
 80003c8:	d4f2      	bmi.n	80003b0 <join+0x4>
 80003ca:	b002      	add	sp, #8
 80003cc:	4770      	bx	lr
 80003ce:	bf00      	nop
 80003d0:	20000010 	.word	0x20000010

080003d4 <lib_os_init>:
 80003d4:	b508      	push	{r3, lr}
 80003d6:	f7ff ff93 	bl	8000300 <kernel_init>
 80003da:	f000 f807 	bl	80003ec <stdlib_init_>
 80003de:	f000 f90b 	bl	80005f8 <messages_init>
 80003e2:	e8bd 4008 	ldmia.w	sp!, {r3, lr}
 80003e6:	f000 b8df 	b.w	80005a8 <stdio_init>
	...

080003ec <stdlib_init_>:
 80003ec:	b508      	push	{r3, lr}
 80003ee:	4804      	ldr	r0, [pc, #16]	; (8000400 <stdlib_init_+0x14>)
 80003f0:	f000 f91c 	bl	800062c <mutex_init>
 80003f4:	4b03      	ldr	r3, [pc, #12]	; (8000404 <stdlib_init_+0x18>)
 80003f6:	4a04      	ldr	r2, [pc, #16]	; (8000408 <stdlib_init_+0x1c>)
 80003f8:	6013      	str	r3, [r2, #0]
 80003fa:	4a04      	ldr	r2, [pc, #16]	; (800040c <stdlib_init_+0x20>)
 80003fc:	6013      	str	r3, [r2, #0]
 80003fe:	bd08      	pop	{r3, pc}
 8000400:	200000fc 	.word	0x200000fc
 8000404:	20000bb0 	.word	0x20000bb0
 8000408:	200000f4 	.word	0x200000f4
 800040c:	200000f8 	.word	0x200000f8

08000410 <putc_>:
 8000410:	b538      	push	{r3, r4, r5, lr}
 8000412:	4c06      	ldr	r4, [pc, #24]	; (800042c <putc_+0x1c>)
 8000414:	4605      	mov	r5, r0
 8000416:	4620      	mov	r0, r4
 8000418:	f000 f912 	bl	8000640 <mutex_lock>
 800041c:	4628      	mov	r0, r5
 800041e:	f000 fdd9 	bl	8000fd4 <uart_write>
 8000422:	4620      	mov	r0, r4
 8000424:	e8bd 4038 	ldmia.w	sp!, {r3, r4, r5, lr}
 8000428:	f000 b926 	b.w	8000678 <mutex_unlock>
 800042c:	20000100 	.word	0x20000100

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
 8000454:	2000010c 	.word	0x2000010c

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
 80005a4:	20000108 	.word	0x20000108

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
 80005e4:	20000100 	.word	0x20000100
 80005e8:	20000104 	.word	0x20000104
 80005ec:	2000010c 	.word	0x2000010c
 80005f0:	20000108 	.word	0x20000108
 80005f4:	080015f0 	.word	0x080015f0

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
 8000624:	20000110 	.word	0x20000110
 8000628:	20000130 	.word	0x20000130

0800062c <mutex_init>:
 800062c:	b510      	push	{r4, lr}
 800062e:	4604      	mov	r4, r0
 8000630:	f7ff fe14 	bl	800025c <sched_off>
 8000634:	2300      	movs	r3, #0
 8000636:	6023      	str	r3, [r4, #0]
 8000638:	e8bd 4010 	ldmia.w	sp!, {r4, lr}
 800063c:	f7ff be10 	b.w	8000260 <sched_on>

08000640 <mutex_lock>:
 8000640:	b513      	push	{r0, r1, r4, lr}
 8000642:	4604      	mov	r4, r0
 8000644:	f7ff fe0a 	bl	800025c <sched_off>
 8000648:	6823      	ldr	r3, [r4, #0]
 800064a:	9301      	str	r3, [sp, #4]
 800064c:	f7ff fe08 	bl	8000260 <sched_on>
 8000650:	9b01      	ldr	r3, [sp, #4]
 8000652:	b10b      	cbz	r3, 8000658 <mutex_lock+0x18>
 8000654:	f7ff fe76 	bl	8000344 <set_wait_state>
 8000658:	9b01      	ldr	r3, [sp, #4]
 800065a:	2b00      	cmp	r3, #0
 800065c:	d1f2      	bne.n	8000644 <mutex_lock+0x4>
 800065e:	f7ff fdfd 	bl	800025c <sched_off>
 8000662:	6823      	ldr	r3, [r4, #0]
 8000664:	9301      	str	r3, [sp, #4]
 8000666:	9b01      	ldr	r3, [sp, #4]
 8000668:	2b00      	cmp	r3, #0
 800066a:	d1eb      	bne.n	8000644 <mutex_lock+0x4>
 800066c:	2301      	movs	r3, #1
 800066e:	6023      	str	r3, [r4, #0]
 8000670:	f7ff fdf6 	bl	8000260 <sched_on>
 8000674:	b002      	add	sp, #8
 8000676:	bd10      	pop	{r4, pc}

08000678 <mutex_unlock>:
 8000678:	b508      	push	{r3, lr}
 800067a:	f7ff ffd7 	bl	800062c <mutex_init>
 800067e:	f7ff fe83 	bl	8000388 <wake_up_threads>
 8000682:	e8bd 4008 	ldmia.w	sp!, {r3, lr}
 8000686:	f7ff bded 	b.w	8000264 <yield>
	...

0800068c <mem_info_print>:
 800068c:	b538      	push	{r3, r4, r5, lr}
 800068e:	4c0f      	ldr	r4, [pc, #60]	; (80006cc <mem_info_print+0x40>)
 8000690:	4d0f      	ldr	r5, [pc, #60]	; (80006d0 <mem_info_print+0x44>)
 8000692:	4810      	ldr	r0, [pc, #64]	; (80006d4 <mem_info_print+0x48>)
 8000694:	4910      	ldr	r1, [pc, #64]	; (80006d8 <mem_info_print+0x4c>)
 8000696:	f7ff ff35 	bl	8000504 <printf_>
 800069a:	1b2d      	subs	r5, r5, r4
 800069c:	4621      	mov	r1, r4
 800069e:	480f      	ldr	r0, [pc, #60]	; (80006dc <mem_info_print+0x50>)
 80006a0:	f7ff ff30 	bl	8000504 <printf_>
 80006a4:	4629      	mov	r1, r5
 80006a6:	480e      	ldr	r0, [pc, #56]	; (80006e0 <mem_info_print+0x54>)
 80006a8:	f7ff ff2c 	bl	8000504 <printf_>
 80006ac:	4b0d      	ldr	r3, [pc, #52]	; (80006e4 <mem_info_print+0x58>)
 80006ae:	480e      	ldr	r0, [pc, #56]	; (80006e8 <mem_info_print+0x5c>)
 80006b0:	1ae1      	subs	r1, r4, r3
 80006b2:	4429      	add	r1, r5
 80006b4:	f7ff ff26 	bl	8000504 <printf_>
 80006b8:	480c      	ldr	r0, [pc, #48]	; (80006ec <mem_info_print+0x60>)
 80006ba:	490d      	ldr	r1, [pc, #52]	; (80006f0 <mem_info_print+0x64>)
 80006bc:	f7ff ff22 	bl	8000504 <printf_>
 80006c0:	480c      	ldr	r0, [pc, #48]	; (80006f4 <mem_info_print+0x68>)
 80006c2:	e8bd 4038 	ldmia.w	sp!, {r3, r4, r5, lr}
 80006c6:	f7ff bf1d 	b.w	8000504 <printf_>
 80006ca:	bf00      	nop
 80006cc:	20000000 	.word	0x20000000
 80006d0:	20020000 	.word	0x20020000
 80006d4:	08001601 	.word	0x08001601
 80006d8:	080015c0 	.word	0x080015c0
 80006dc:	08001612 	.word	0x08001612
 80006e0:	08001621 	.word	0x08001621
 80006e4:	20000bb0 	.word	0x20000bb0
 80006e8:	0800162f 	.word	0x0800162f
 80006ec:	0800163d 	.word	0x0800163d
 80006f0:	20000bb0 	.word	0x20000bb0
 80006f4:	0800164d 	.word	0x0800164d

080006f8 <main>:
 80006f8:	b508      	push	{r3, lr}
 80006fa:	f000 fe61 	bl	80013c0 <lib_low_level_init>
 80006fe:	f7ff fe69 	bl	80003d4 <lib_os_init>
 8000702:	f7ff ffc3 	bl	800068c <mem_info_print>
 8000706:	4905      	ldr	r1, [pc, #20]	; (800071c <main+0x24>)
 8000708:	4805      	ldr	r0, [pc, #20]	; (8000720 <main+0x28>)
 800070a:	f44f 7200 	mov.w	r2, #512	; 0x200
 800070e:	2308      	movs	r3, #8
 8000710:	f7ff fdbc 	bl	800028c <create_thread>
 8000714:	f7ff fdb4 	bl	8000280 <kernel_start>
 8000718:	2000      	movs	r0, #0
 800071a:	bd08      	pop	{r3, pc}
 800071c:	20000370 	.word	0x20000370
 8000720:	08000ae5 	.word	0x08000ae5

08000724 <gyro_read>:
 8000724:	b570      	push	{r4, r5, r6, lr}
 8000726:	211e      	movs	r1, #30
 8000728:	20d2      	movs	r0, #210	; 0xd2
 800072a:	f000 fc3a 	bl	8000fa2 <i2c_read_reg>
 800072e:	211d      	movs	r1, #29
 8000730:	4605      	mov	r5, r0
 8000732:	20d2      	movs	r0, #210	; 0xd2
 8000734:	4c33      	ldr	r4, [pc, #204]	; (8000804 <gyro_read+0xe0>)
 8000736:	f000 fc34 	bl	8000fa2 <i2c_read_reg>
 800073a:	88e3      	ldrh	r3, [r4, #6]
 800073c:	ea45 2000 	orr.w	r0, r5, r0, lsl #8
 8000740:	1ac5      	subs	r5, r0, r3
 8000742:	2120      	movs	r1, #32
 8000744:	20d2      	movs	r0, #210	; 0xd2
 8000746:	8025      	strh	r5, [r4, #0]
 8000748:	f000 fc2b 	bl	8000fa2 <i2c_read_reg>
 800074c:	211f      	movs	r1, #31
 800074e:	4605      	mov	r5, r0
 8000750:	20d2      	movs	r0, #210	; 0xd2
 8000752:	f000 fc26 	bl	8000fa2 <i2c_read_reg>
 8000756:	8923      	ldrh	r3, [r4, #8]
 8000758:	ea45 2000 	orr.w	r0, r5, r0, lsl #8
 800075c:	1ac5      	subs	r5, r0, r3
 800075e:	2122      	movs	r1, #34	; 0x22
 8000760:	20d2      	movs	r0, #210	; 0xd2
 8000762:	8065      	strh	r5, [r4, #2]
 8000764:	f000 fc1d 	bl	8000fa2 <i2c_read_reg>
 8000768:	2121      	movs	r1, #33	; 0x21
 800076a:	4605      	mov	r5, r0
 800076c:	20d2      	movs	r0, #210	; 0xd2
 800076e:	f000 fc18 	bl	8000fa2 <i2c_read_reg>
 8000772:	8963      	ldrh	r3, [r4, #10]
 8000774:	f9b4 6002 	ldrsh.w	r6, [r4, #2]
 8000778:	ea45 2000 	orr.w	r0, r5, r0, lsl #8
 800077c:	1ac1      	subs	r1, r0, r3
 800077e:	6920      	ldr	r0, [r4, #16]
 8000780:	68e3      	ldr	r3, [r4, #12]
 8000782:	f9b4 5000 	ldrsh.w	r5, [r4]
 8000786:	220f      	movs	r2, #15
 8000788:	fb02 6000 	mla	r0, r2, r0, r6
 800078c:	b289      	uxth	r1, r1
 800078e:	6966      	ldr	r6, [r4, #20]
 8000790:	80a1      	strh	r1, [r4, #4]
 8000792:	b209      	sxth	r1, r1
 8000794:	fb02 5503 	mla	r5, r2, r3, r5
 8000798:	2310      	movs	r3, #16
 800079a:	fb02 1206 	mla	r2, r2, r6, r1
 800079e:	fb95 f5f3 	sdiv	r5, r5, r3
 80007a2:	fb90 f0f3 	sdiv	r0, r0, r3
 80007a6:	fb92 f3f3 	sdiv	r3, r2, r3
 80007aa:	69a2      	ldr	r2, [r4, #24]
 80007ac:	4916      	ldr	r1, [pc, #88]	; (8000808 <gyro_read+0xe4>)
 80007ae:	60e5      	str	r5, [r4, #12]
 80007b0:	4415      	add	r5, r2
 80007b2:	69e2      	ldr	r2, [r4, #28]
 80007b4:	6120      	str	r0, [r4, #16]
 80007b6:	428d      	cmp	r5, r1
 80007b8:	4410      	add	r0, r2
 80007ba:	6a22      	ldr	r2, [r4, #32]
 80007bc:	61a5      	str	r5, [r4, #24]
 80007be:	bfc8      	it	gt
 80007c0:	61a1      	strgt	r1, [r4, #24]
 80007c2:	69a5      	ldr	r5, [r4, #24]
 80007c4:	6163      	str	r3, [r4, #20]
 80007c6:	4413      	add	r3, r2
 80007c8:	4a10      	ldr	r2, [pc, #64]	; (800080c <gyro_read+0xe8>)
 80007ca:	61e0      	str	r0, [r4, #28]
 80007cc:	4295      	cmp	r5, r2
 80007ce:	bfb8      	it	lt
 80007d0:	4d0c      	ldrlt	r5, [pc, #48]	; (8000804 <gyro_read+0xe0>)
 80007d2:	6223      	str	r3, [r4, #32]
 80007d4:	bfb8      	it	lt
 80007d6:	61aa      	strlt	r2, [r5, #24]
 80007d8:	4288      	cmp	r0, r1
 80007da:	bfc4      	itt	gt
 80007dc:	490a      	ldrgt	r1, [pc, #40]	; (8000808 <gyro_read+0xe4>)
 80007de:	61e1      	strgt	r1, [r4, #28]
 80007e0:	69e1      	ldr	r1, [r4, #28]
 80007e2:	4291      	cmp	r1, r2
 80007e4:	da02      	bge.n	80007ec <gyro_read+0xc8>
 80007e6:	4909      	ldr	r1, [pc, #36]	; (800080c <gyro_read+0xe8>)
 80007e8:	4a06      	ldr	r2, [pc, #24]	; (8000804 <gyro_read+0xe0>)
 80007ea:	61d1      	str	r1, [r2, #28]
 80007ec:	4906      	ldr	r1, [pc, #24]	; (8000808 <gyro_read+0xe4>)
 80007ee:	428b      	cmp	r3, r1
 80007f0:	bfc8      	it	gt
 80007f2:	6221      	strgt	r1, [r4, #32]
 80007f4:	6a22      	ldr	r2, [r4, #32]
 80007f6:	4b05      	ldr	r3, [pc, #20]	; (800080c <gyro_read+0xe8>)
 80007f8:	429a      	cmp	r2, r3
 80007fa:	bfbc      	itt	lt
 80007fc:	4a01      	ldrlt	r2, [pc, #4]	; (8000804 <gyro_read+0xe0>)
 80007fe:	6213      	strlt	r3, [r2, #32]
 8000800:	bd70      	pop	{r4, r5, r6, pc}
 8000802:	bf00      	nop
 8000804:	20000570 	.word	0x20000570
 8000808:	00010011 	.word	0x00010011
 800080c:	fffeffef 	.word	0xfffeffef

08000810 <gyro_init>:
 8000810:	e92d 41f0 	stmdb	sp!, {r4, r5, r6, r7, r8, lr}
 8000814:	20d2      	movs	r0, #210	; 0xd2
 8000816:	213e      	movs	r1, #62	; 0x3e
 8000818:	2280      	movs	r2, #128	; 0x80
 800081a:	f000 fbaf 	bl	8000f7c <i2c_write_reg>
 800081e:	20d2      	movs	r0, #210	; 0xd2
 8000820:	2115      	movs	r1, #21
 8000822:	2200      	movs	r2, #0
 8000824:	f000 fbaa 	bl	8000f7c <i2c_write_reg>
 8000828:	20d2      	movs	r0, #210	; 0xd2
 800082a:	2116      	movs	r1, #22
 800082c:	2219      	movs	r2, #25
 800082e:	f000 fba5 	bl	8000f7c <i2c_write_reg>
 8000832:	20d2      	movs	r0, #210	; 0xd2
 8000834:	2117      	movs	r1, #23
 8000836:	2205      	movs	r2, #5
 8000838:	f000 fba0 	bl	8000f7c <i2c_write_reg>
 800083c:	2200      	movs	r2, #0
 800083e:	20d2      	movs	r0, #210	; 0xd2
 8000840:	213e      	movs	r1, #62	; 0x3e
 8000842:	f000 fb9b 	bl	8000f7c <i2c_write_reg>
 8000846:	2064      	movs	r0, #100	; 0x64
 8000848:	f000 faa0 	bl	8000d8c <timer_delay_ms>
 800084c:	4b19      	ldr	r3, [pc, #100]	; (80008b4 <gyro_init+0xa4>)
 800084e:	2200      	movs	r2, #0
 8000850:	801a      	strh	r2, [r3, #0]
 8000852:	805a      	strh	r2, [r3, #2]
 8000854:	809a      	strh	r2, [r3, #4]
 8000856:	80da      	strh	r2, [r3, #6]
 8000858:	811a      	strh	r2, [r3, #8]
 800085a:	815a      	strh	r2, [r3, #10]
 800085c:	240a      	movs	r4, #10
 800085e:	4615      	mov	r5, r2
 8000860:	4616      	mov	r6, r2
 8000862:	4617      	mov	r7, r2
 8000864:	4698      	mov	r8, r3
 8000866:	f7ff ff5d 	bl	8000724 <gyro_read>
 800086a:	200a      	movs	r0, #10
 800086c:	f000 fa8e 	bl	8000d8c <timer_delay_ms>
 8000870:	f9b8 2000 	ldrsh.w	r2, [r8]
 8000874:	4b0f      	ldr	r3, [pc, #60]	; (80008b4 <gyro_init+0xa4>)
 8000876:	4417      	add	r7, r2
 8000878:	f9b8 2002 	ldrsh.w	r2, [r8, #2]
 800087c:	3c01      	subs	r4, #1
 800087e:	4416      	add	r6, r2
 8000880:	f9b8 2004 	ldrsh.w	r2, [r8, #4]
 8000884:	b2a4      	uxth	r4, r4
 8000886:	4415      	add	r5, r2
 8000888:	2c00      	cmp	r4, #0
 800088a:	d1ec      	bne.n	8000866 <gyro_init+0x56>
 800088c:	220a      	movs	r2, #10
 800088e:	fb97 f7f2 	sdiv	r7, r7, r2
 8000892:	fb96 f6f2 	sdiv	r6, r6, r2
 8000896:	fb95 f2f2 	sdiv	r2, r5, r2
 800089a:	80df      	strh	r7, [r3, #6]
 800089c:	811e      	strh	r6, [r3, #8]
 800089e:	815a      	strh	r2, [r3, #10]
 80008a0:	60dc      	str	r4, [r3, #12]
 80008a2:	611c      	str	r4, [r3, #16]
 80008a4:	615c      	str	r4, [r3, #20]
 80008a6:	619c      	str	r4, [r3, #24]
 80008a8:	61dc      	str	r4, [r3, #28]
 80008aa:	621c      	str	r4, [r3, #32]
 80008ac:	4620      	mov	r0, r4
 80008ae:	e8bd 81f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, pc}
 80008b2:	bf00      	nop
 80008b4:	20000570 	.word	0x20000570

080008b8 <motor_run>:
 80008b8:	f640 73ff 	movw	r3, #4095	; 0xfff
 80008bc:	4298      	cmp	r0, r3
 80008be:	b510      	push	{r4, lr}
 80008c0:	4604      	mov	r4, r0
 80008c2:	dc04      	bgt.n	80008ce <motor_run+0x16>
 80008c4:	4a2a      	ldr	r2, [pc, #168]	; (8000970 <motor_run+0xb8>)
 80008c6:	4294      	cmp	r4, r2
 80008c8:	bfb8      	it	lt
 80008ca:	4614      	movlt	r4, r2
 80008cc:	e000      	b.n	80008d0 <motor_run+0x18>
 80008ce:	461c      	mov	r4, r3
 80008d0:	4299      	cmp	r1, r3
 80008d2:	dc1a      	bgt.n	800090a <motor_run+0x52>
 80008d4:	4b26      	ldr	r3, [pc, #152]	; (8000970 <motor_run+0xb8>)
 80008d6:	4299      	cmp	r1, r3
 80008d8:	bfb8      	it	lt
 80008da:	4619      	movlt	r1, r3
 80008dc:	db09      	blt.n	80008f2 <motor_run+0x3a>
 80008de:	2900      	cmp	r1, #0
 80008e0:	d106      	bne.n	80008f0 <motor_run+0x38>
 80008e2:	2002      	movs	r0, #2
 80008e4:	f000 f88d 	bl	8000a02 <pca9685_send>
 80008e8:	2009      	movs	r0, #9
 80008ea:	f640 71ff 	movw	r1, #4095	; 0xfff
 80008ee:	e006      	b.n	80008fe <motor_run+0x46>
 80008f0:	da0d      	bge.n	800090e <motor_run+0x56>
 80008f2:	2008      	movs	r0, #8
 80008f4:	4249      	negs	r1, r1
 80008f6:	f000 f884 	bl	8000a02 <pca9685_send>
 80008fa:	2009      	movs	r0, #9
 80008fc:	2100      	movs	r1, #0
 80008fe:	f000 f880 	bl	8000a02 <pca9685_send>
 8000902:	200a      	movs	r0, #10
 8000904:	f640 71ff 	movw	r1, #4095	; 0xfff
 8000908:	e00b      	b.n	8000922 <motor_run+0x6a>
 800090a:	f640 71ff 	movw	r1, #4095	; 0xfff
 800090e:	2008      	movs	r0, #8
 8000910:	f000 f877 	bl	8000a02 <pca9685_send>
 8000914:	2009      	movs	r0, #9
 8000916:	f640 71ff 	movw	r1, #4095	; 0xfff
 800091a:	f000 f872 	bl	8000a02 <pca9685_send>
 800091e:	200a      	movs	r0, #10
 8000920:	2100      	movs	r1, #0
 8000922:	f000 f86e 	bl	8000a02 <pca9685_send>
 8000926:	2c00      	cmp	r4, #0
 8000928:	f04f 000d 	mov.w	r0, #13
 800092c:	d106      	bne.n	800093c <motor_run+0x84>
 800092e:	4621      	mov	r1, r4
 8000930:	f000 f867 	bl	8000a02 <pca9685_send>
 8000934:	200b      	movs	r0, #11
 8000936:	f640 71ff 	movw	r1, #4095	; 0xfff
 800093a:	e010      	b.n	800095e <motor_run+0xa6>
 800093c:	da0a      	bge.n	8000954 <motor_run+0x9c>
 800093e:	4261      	negs	r1, r4
 8000940:	f000 f85f 	bl	8000a02 <pca9685_send>
 8000944:	200b      	movs	r0, #11
 8000946:	f640 71ff 	movw	r1, #4095	; 0xfff
 800094a:	f000 f85a 	bl	8000a02 <pca9685_send>
 800094e:	200c      	movs	r0, #12
 8000950:	2100      	movs	r1, #0
 8000952:	e009      	b.n	8000968 <motor_run+0xb0>
 8000954:	4621      	mov	r1, r4
 8000956:	f000 f854 	bl	8000a02 <pca9685_send>
 800095a:	200b      	movs	r0, #11
 800095c:	2100      	movs	r1, #0
 800095e:	f000 f850 	bl	8000a02 <pca9685_send>
 8000962:	200c      	movs	r0, #12
 8000964:	f640 71ff 	movw	r1, #4095	; 0xfff
 8000968:	e8bd 4010 	ldmia.w	sp!, {r4, lr}
 800096c:	f000 b849 	b.w	8000a02 <pca9685_send>
 8000970:	fffff001 	.word	0xfffff001

08000974 <motor_init>:
 8000974:	2000      	movs	r0, #0
 8000976:	4601      	mov	r1, r0
 8000978:	f7ff bf9e 	b.w	80008b8 <motor_run>

0800097c <pca9685_init>:
 800097c:	b508      	push	{r3, lr}
 800097e:	f000 fa8f 	bl	8000ea0 <i2cStart>
 8000982:	20c0      	movs	r0, #192	; 0xc0
 8000984:	f000 faaa 	bl	8000edc <i2cWrite>
 8000988:	2000      	movs	r0, #0
 800098a:	f000 faa7 	bl	8000edc <i2cWrite>
 800098e:	2031      	movs	r0, #49	; 0x31
 8000990:	f000 faa4 	bl	8000edc <i2cWrite>
 8000994:	f000 fa93 	bl	8000ebe <i2cStop>
 8000998:	2002      	movs	r0, #2
 800099a:	f000 f9f7 	bl	8000d8c <timer_delay_ms>
 800099e:	f000 fa7f 	bl	8000ea0 <i2cStart>
 80009a2:	20c0      	movs	r0, #192	; 0xc0
 80009a4:	f000 fa9a 	bl	8000edc <i2cWrite>
 80009a8:	20fe      	movs	r0, #254	; 0xfe
 80009aa:	f000 fa97 	bl	8000edc <i2cWrite>
 80009ae:	2001      	movs	r0, #1
 80009b0:	f000 fa94 	bl	8000edc <i2cWrite>
 80009b4:	f000 fa83 	bl	8000ebe <i2cStop>
 80009b8:	2002      	movs	r0, #2
 80009ba:	f000 f9e7 	bl	8000d8c <timer_delay_ms>
 80009be:	f000 fa6f 	bl	8000ea0 <i2cStart>
 80009c2:	20c0      	movs	r0, #192	; 0xc0
 80009c4:	f000 fa8a 	bl	8000edc <i2cWrite>
 80009c8:	2000      	movs	r0, #0
 80009ca:	f000 fa87 	bl	8000edc <i2cWrite>
 80009ce:	20a1      	movs	r0, #161	; 0xa1
 80009d0:	f000 fa84 	bl	8000edc <i2cWrite>
 80009d4:	f000 fa73 	bl	8000ebe <i2cStop>
 80009d8:	2002      	movs	r0, #2
 80009da:	f000 f9d7 	bl	8000d8c <timer_delay_ms>
 80009de:	f000 fa5f 	bl	8000ea0 <i2cStart>
 80009e2:	20c0      	movs	r0, #192	; 0xc0
 80009e4:	f000 fa7a 	bl	8000edc <i2cWrite>
 80009e8:	2001      	movs	r0, #1
 80009ea:	f000 fa77 	bl	8000edc <i2cWrite>
 80009ee:	2004      	movs	r0, #4
 80009f0:	f000 fa74 	bl	8000edc <i2cWrite>
 80009f4:	f000 fa63 	bl	8000ebe <i2cStop>
 80009f8:	2002      	movs	r0, #2
 80009fa:	e8bd 4008 	ldmia.w	sp!, {r3, lr}
 80009fe:	f000 b9c5 	b.w	8000d8c <timer_delay_ms>

08000a02 <pca9685_send>:
 8000a02:	b538      	push	{r3, r4, r5, lr}
 8000a04:	4605      	mov	r5, r0
 8000a06:	f640 74ff 	movw	r4, #4095	; 0xfff
 8000a0a:	42a1      	cmp	r1, r4
 8000a0c:	bf38      	it	cc
 8000a0e:	460c      	movcc	r4, r1
 8000a10:	00ad      	lsls	r5, r5, #2
 8000a12:	f000 fa45 	bl	8000ea0 <i2cStart>
 8000a16:	20c0      	movs	r0, #192	; 0xc0
 8000a18:	f000 fa60 	bl	8000edc <i2cWrite>
 8000a1c:	1da8      	adds	r0, r5, #6
 8000a1e:	f000 00fe 	and.w	r0, r0, #254	; 0xfe
 8000a22:	f000 fa5b 	bl	8000edc <i2cWrite>
 8000a26:	2000      	movs	r0, #0
 8000a28:	f000 fa58 	bl	8000edc <i2cWrite>
 8000a2c:	2000      	movs	r0, #0
 8000a2e:	f000 fa55 	bl	8000edc <i2cWrite>
 8000a32:	b2e0      	uxtb	r0, r4
 8000a34:	f000 fa52 	bl	8000edc <i2cWrite>
 8000a38:	f3c4 2007 	ubfx	r0, r4, #8, #8
 8000a3c:	f000 fa4e 	bl	8000edc <i2cWrite>
 8000a40:	e8bd 4038 	ldmia.w	sp!, {r3, r4, r5, lr}
 8000a44:	f000 ba3b 	b.w	8000ebe <i2cStop>

08000a48 <thread_02>:
 8000a48:	b510      	push	{r4, lr}
 8000a4a:	2400      	movs	r4, #0
 8000a4c:	4621      	mov	r1, r4
 8000a4e:	4803      	ldr	r0, [pc, #12]	; (8000a5c <thread_02+0x14>)
 8000a50:	3401      	adds	r4, #1
 8000a52:	f7ff fd57 	bl	8000504 <printf_>
 8000a56:	2c0a      	cmp	r4, #10
 8000a58:	d1f8      	bne.n	8000a4c <thread_02+0x4>
 8000a5a:	bd10      	pop	{r4, pc}
 8000a5c:	08001650 	.word	0x08001650

08000a60 <thread_01>:
 8000a60:	b510      	push	{r4, lr}
 8000a62:	f44f 4080 	mov.w	r0, #16384	; 0x4000
 8000a66:	f000 fd03 	bl	8001470 <led_on>
 8000a6a:	4812      	ldr	r0, [pc, #72]	; (8000ab4 <thread_01+0x54>)
 8000a6c:	f7ff fd4a 	bl	8000504 <printf_>
 8000a70:	4811      	ldr	r0, [pc, #68]	; (8000ab8 <thread_01+0x58>)
 8000a72:	f7ff fd47 	bl	8000504 <printf_>
 8000a76:	4811      	ldr	r0, [pc, #68]	; (8000abc <thread_01+0x5c>)
 8000a78:	4911      	ldr	r1, [pc, #68]	; (8000ac0 <thread_01+0x60>)
 8000a7a:	f44f 7200 	mov.w	r2, #512	; 0x200
 8000a7e:	2308      	movs	r3, #8
 8000a80:	f7ff fc04 	bl	800028c <create_thread>
 8000a84:	2808      	cmp	r0, #8
 8000a86:	4604      	mov	r4, r0
 8000a88:	d101      	bne.n	8000a8e <thread_01+0x2e>
 8000a8a:	480e      	ldr	r0, [pc, #56]	; (8000ac4 <thread_01+0x64>)
 8000a8c:	e007      	b.n	8000a9e <thread_01+0x3e>
 8000a8e:	480e      	ldr	r0, [pc, #56]	; (8000ac8 <thread_01+0x68>)
 8000a90:	4621      	mov	r1, r4
 8000a92:	f7ff fd37 	bl	8000504 <printf_>
 8000a96:	4620      	mov	r0, r4
 8000a98:	f7ff fc88 	bl	80003ac <join>
 8000a9c:	480b      	ldr	r0, [pc, #44]	; (8000acc <thread_01+0x6c>)
 8000a9e:	f7ff fd31 	bl	8000504 <printf_>
 8000aa2:	f44f 4080 	mov.w	r0, #16384	; 0x4000
 8000aa6:	f000 fce9 	bl	800147c <led_off>
 8000aaa:	f44f 70fa 	mov.w	r0, #500	; 0x1f4
 8000aae:	f000 f96d 	bl	8000d8c <timer_delay_ms>
 8000ab2:	e7d6      	b.n	8000a62 <thread_01+0x2>
 8000ab4:	0800166e 	.word	0x0800166e
 8000ab8:	08001678 	.word	0x08001678
 8000abc:	08000a49 	.word	0x08000a49
 8000ac0:	20000794 	.word	0x20000794
 8000ac4:	0800168f 	.word	0x0800168f
 8000ac8:	080016a6 	.word	0x080016a6
 8000acc:	080015fb 	.word	0x080015fb

08000ad0 <thread_03>:
 8000ad0:	b508      	push	{r3, lr}
 8000ad2:	4803      	ldr	r0, [pc, #12]	; (8000ae0 <thread_03+0x10>)
 8000ad4:	f7ff fd16 	bl	8000504 <printf_>
 8000ad8:	2064      	movs	r0, #100	; 0x64
 8000ada:	f000 f957 	bl	8000d8c <timer_delay_ms>
 8000ade:	e7f8      	b.n	8000ad2 <thread_03+0x2>
 8000ae0:	080016c2 	.word	0x080016c2

08000ae4 <main_thread>:
 8000ae4:	b508      	push	{r3, lr}
 8000ae6:	4839      	ldr	r0, [pc, #228]	; (8000bcc <main_thread+0xe8>)
 8000ae8:	f7ff fd0c 	bl	8000504 <printf_>
 8000aec:	f7ff fe90 	bl	8000810 <gyro_init>
 8000af0:	f7ff ff44 	bl	800097c <pca9685_init>
 8000af4:	f7ff ff3e 	bl	8000974 <motor_init>
 8000af8:	4935      	ldr	r1, [pc, #212]	; (8000bd0 <main_thread+0xec>)
 8000afa:	4836      	ldr	r0, [pc, #216]	; (8000bd4 <main_thread+0xf0>)
 8000afc:	f44f 7200 	mov.w	r2, #512	; 0x200
 8000b00:	2308      	movs	r3, #8
 8000b02:	f7ff fbc3 	bl	800028c <create_thread>
 8000b06:	4834      	ldr	r0, [pc, #208]	; (8000bd8 <main_thread+0xf4>)
 8000b08:	4934      	ldr	r1, [pc, #208]	; (8000bdc <main_thread+0xf8>)
 8000b0a:	f44f 7200 	mov.w	r2, #512	; 0x200
 8000b0e:	2308      	movs	r3, #8
 8000b10:	f7ff fbbc 	bl	800028c <create_thread>
 8000b14:	f000 fcb8 	bl	8001488 <get_key>
 8000b18:	b970      	cbnz	r0, 8000b38 <main_thread+0x54>
 8000b1a:	f44f 5000 	mov.w	r0, #8192	; 0x2000
 8000b1e:	f000 fca7 	bl	8001470 <led_on>
 8000b22:	20c8      	movs	r0, #200	; 0xc8
 8000b24:	f000 f932 	bl	8000d8c <timer_delay_ms>
 8000b28:	f44f 5000 	mov.w	r0, #8192	; 0x2000
 8000b2c:	f000 fca6 	bl	800147c <led_off>
 8000b30:	20c8      	movs	r0, #200	; 0xc8
 8000b32:	f000 f92b 	bl	8000d8c <timer_delay_ms>
 8000b36:	e7ed      	b.n	8000b14 <main_thread+0x30>
 8000b38:	f44f 7048 	mov.w	r0, #800	; 0x320
 8000b3c:	f000 f926 	bl	8000d8c <timer_delay_ms>
 8000b40:	2100      	movs	r1, #0
 8000b42:	f240 70ff 	movw	r0, #2047	; 0x7ff
 8000b46:	f7ff feb7 	bl	80008b8 <motor_run>
 8000b4a:	f44f 7048 	mov.w	r0, #800	; 0x320
 8000b4e:	f000 f91d 	bl	8000d8c <timer_delay_ms>
 8000b52:	2100      	movs	r1, #0
 8000b54:	4822      	ldr	r0, [pc, #136]	; (8000be0 <main_thread+0xfc>)
 8000b56:	f7ff feaf 	bl	80008b8 <motor_run>
 8000b5a:	f44f 7048 	mov.w	r0, #800	; 0x320
 8000b5e:	f000 f915 	bl	8000d8c <timer_delay_ms>
 8000b62:	f240 71ff 	movw	r1, #2047	; 0x7ff
 8000b66:	2000      	movs	r0, #0
 8000b68:	f7ff fea6 	bl	80008b8 <motor_run>
 8000b6c:	f44f 7048 	mov.w	r0, #800	; 0x320
 8000b70:	f000 f90c 	bl	8000d8c <timer_delay_ms>
 8000b74:	491a      	ldr	r1, [pc, #104]	; (8000be0 <main_thread+0xfc>)
 8000b76:	2000      	movs	r0, #0
 8000b78:	f7ff fe9e 	bl	80008b8 <motor_run>
 8000b7c:	f44f 7048 	mov.w	r0, #800	; 0x320
 8000b80:	f000 f904 	bl	8000d8c <timer_delay_ms>
 8000b84:	f240 70ff 	movw	r0, #2047	; 0x7ff
 8000b88:	4601      	mov	r1, r0
 8000b8a:	f7ff fe95 	bl	80008b8 <motor_run>
 8000b8e:	f44f 7048 	mov.w	r0, #800	; 0x320
 8000b92:	f000 f8fb 	bl	8000d8c <timer_delay_ms>
 8000b96:	2000      	movs	r0, #0
 8000b98:	4601      	mov	r1, r0
 8000b9a:	f7ff fe8d 	bl	80008b8 <motor_run>
 8000b9e:	f44f 5000 	mov.w	r0, #8192	; 0x2000
 8000ba2:	f000 fc65 	bl	8001470 <led_on>
 8000ba6:	f000 f8e3 	bl	8000d70 <timer_get_time>
 8000baa:	f44f 717a 	mov.w	r1, #1000	; 0x3e8
 8000bae:	fbb0 f1f1 	udiv	r1, r0, r1
 8000bb2:	480c      	ldr	r0, [pc, #48]	; (8000be4 <main_thread+0x100>)
 8000bb4:	f7ff fca6 	bl	8000504 <printf_>
 8000bb8:	f44f 5000 	mov.w	r0, #8192	; 0x2000
 8000bbc:	f000 fc5e 	bl	800147c <led_off>
 8000bc0:	f44f 60fa 	mov.w	r0, #2000	; 0x7d0
 8000bc4:	f000 f8e2 	bl	8000d8c <timer_delay_ms>
 8000bc8:	e7e9      	b.n	8000b9e <main_thread+0xba>
 8000bca:	bf00      	nop
 8000bcc:	080016d3 	.word	0x080016d3
 8000bd0:	20000594 	.word	0x20000594
 8000bd4:	08000a61 	.word	0x08000a61
 8000bd8:	08000ad1 	.word	0x08000ad1
 8000bdc:	20000994 	.word	0x20000994
 8000be0:	fffff801 	.word	0xfffff801
 8000be4:	0800170e 	.word	0x0800170e

08000be8 <TIM_TimeBaseInit>:
 8000be8:	4a1c      	ldr	r2, [pc, #112]	; (8000c5c <TIM_TimeBaseInit+0x74>)
 8000bea:	8803      	ldrh	r3, [r0, #0]
 8000bec:	4290      	cmp	r0, r2
 8000bee:	b29b      	uxth	r3, r3
 8000bf0:	d012      	beq.n	8000c18 <TIM_TimeBaseInit+0x30>
 8000bf2:	f502 6280 	add.w	r2, r2, #1024	; 0x400
 8000bf6:	4290      	cmp	r0, r2
 8000bf8:	d00e      	beq.n	8000c18 <TIM_TimeBaseInit+0x30>
 8000bfa:	f1b0 4f80 	cmp.w	r0, #1073741824	; 0x40000000
 8000bfe:	d00b      	beq.n	8000c18 <TIM_TimeBaseInit+0x30>
 8000c00:	f5a2 3280 	sub.w	r2, r2, #65536	; 0x10000
 8000c04:	4290      	cmp	r0, r2
 8000c06:	d007      	beq.n	8000c18 <TIM_TimeBaseInit+0x30>
 8000c08:	f502 6280 	add.w	r2, r2, #1024	; 0x400
 8000c0c:	4290      	cmp	r0, r2
 8000c0e:	d003      	beq.n	8000c18 <TIM_TimeBaseInit+0x30>
 8000c10:	f502 6280 	add.w	r2, r2, #1024	; 0x400
 8000c14:	4290      	cmp	r0, r2
 8000c16:	d103      	bne.n	8000c20 <TIM_TimeBaseInit+0x38>
 8000c18:	884a      	ldrh	r2, [r1, #2]
 8000c1a:	f023 0370 	bic.w	r3, r3, #112	; 0x70
 8000c1e:	4313      	orrs	r3, r2
 8000c20:	4a0f      	ldr	r2, [pc, #60]	; (8000c60 <TIM_TimeBaseInit+0x78>)
 8000c22:	4290      	cmp	r0, r2
 8000c24:	d008      	beq.n	8000c38 <TIM_TimeBaseInit+0x50>
 8000c26:	f502 6280 	add.w	r2, r2, #1024	; 0x400
 8000c2a:	4290      	cmp	r0, r2
 8000c2c:	d004      	beq.n	8000c38 <TIM_TimeBaseInit+0x50>
 8000c2e:	f423 7340 	bic.w	r3, r3, #768	; 0x300
 8000c32:	890a      	ldrh	r2, [r1, #8]
 8000c34:	b29b      	uxth	r3, r3
 8000c36:	4313      	orrs	r3, r2
 8000c38:	8003      	strh	r3, [r0, #0]
 8000c3a:	684b      	ldr	r3, [r1, #4]
 8000c3c:	62c3      	str	r3, [r0, #44]	; 0x2c
 8000c3e:	880b      	ldrh	r3, [r1, #0]
 8000c40:	8503      	strh	r3, [r0, #40]	; 0x28
 8000c42:	4b06      	ldr	r3, [pc, #24]	; (8000c5c <TIM_TimeBaseInit+0x74>)
 8000c44:	4298      	cmp	r0, r3
 8000c46:	d003      	beq.n	8000c50 <TIM_TimeBaseInit+0x68>
 8000c48:	f503 6380 	add.w	r3, r3, #1024	; 0x400
 8000c4c:	4298      	cmp	r0, r3
 8000c4e:	d101      	bne.n	8000c54 <TIM_TimeBaseInit+0x6c>
 8000c50:	7a8b      	ldrb	r3, [r1, #10]
 8000c52:	8603      	strh	r3, [r0, #48]	; 0x30
 8000c54:	2301      	movs	r3, #1
 8000c56:	8283      	strh	r3, [r0, #20]
 8000c58:	4770      	bx	lr
 8000c5a:	bf00      	nop
 8000c5c:	40010000 	.word	0x40010000
 8000c60:	40001000 	.word	0x40001000

08000c64 <TIM_Cmd>:
 8000c64:	8803      	ldrh	r3, [r0, #0]
 8000c66:	b119      	cbz	r1, 8000c70 <TIM_Cmd+0xc>
 8000c68:	b29b      	uxth	r3, r3
 8000c6a:	f043 0301 	orr.w	r3, r3, #1
 8000c6e:	e003      	b.n	8000c78 <TIM_Cmd+0x14>
 8000c70:	f023 0301 	bic.w	r3, r3, #1
 8000c74:	041b      	lsls	r3, r3, #16
 8000c76:	0c1b      	lsrs	r3, r3, #16
 8000c78:	8003      	strh	r3, [r0, #0]
 8000c7a:	4770      	bx	lr

08000c7c <TIM_ClearITPendingBit>:
 8000c7c:	43c9      	mvns	r1, r1
 8000c7e:	b289      	uxth	r1, r1
 8000c80:	8201      	strh	r1, [r0, #16]
 8000c82:	4770      	bx	lr

08000c84 <timer_init>:
 8000c84:	b530      	push	{r4, r5, lr}
 8000c86:	2000      	movs	r0, #0
 8000c88:	b085      	sub	sp, #20
 8000c8a:	4a1e      	ldr	r2, [pc, #120]	; (8000d04 <timer_init+0x80>)
 8000c8c:	f44f 6380 	mov.w	r3, #1024	; 0x400
 8000c90:	f822 3010 	strh.w	r3, [r2, r0, lsl #1]
 8000c94:	4a1c      	ldr	r2, [pc, #112]	; (8000d08 <timer_init+0x84>)
 8000c96:	f822 3010 	strh.w	r3, [r2, r0, lsl #1]
 8000c9a:	4b1c      	ldr	r3, [pc, #112]	; (8000d0c <timer_init+0x88>)
 8000c9c:	2400      	movs	r4, #0
 8000c9e:	f823 4010 	strh.w	r4, [r3, r0, lsl #1]
 8000ca2:	3001      	adds	r0, #1
 8000ca4:	2804      	cmp	r0, #4
 8000ca6:	4625      	mov	r5, r4
 8000ca8:	d1ef      	bne.n	8000c8a <timer_init+0x6>
 8000caa:	4b19      	ldr	r3, [pc, #100]	; (8000d10 <timer_init+0x8c>)
 8000cac:	2101      	movs	r1, #1
 8000cae:	601c      	str	r4, [r3, #0]
 8000cb0:	f000 fb6e 	bl	8001390 <RCC_APB1PeriphClockCmd>
 8000cb4:	f8ad 4006 	strh.w	r4, [sp, #6]
 8000cb8:	f8ad 400c 	strh.w	r4, [sp, #12]
 8000cbc:	f88d 400e 	strb.w	r4, [sp, #14]
 8000cc0:	4c14      	ldr	r4, [pc, #80]	; (8000d14 <timer_init+0x90>)
 8000cc2:	2353      	movs	r3, #83	; 0x53
 8000cc4:	f8ad 3004 	strh.w	r3, [sp, #4]
 8000cc8:	4620      	mov	r0, r4
 8000cca:	2331      	movs	r3, #49	; 0x31
 8000ccc:	a901      	add	r1, sp, #4
 8000cce:	9302      	str	r3, [sp, #8]
 8000cd0:	f7ff ff8a 	bl	8000be8 <TIM_TimeBaseInit>
 8000cd4:	4620      	mov	r0, r4
 8000cd6:	2101      	movs	r1, #1
 8000cd8:	f7ff ffc4 	bl	8000c64 <TIM_Cmd>
 8000cdc:	89a3      	ldrh	r3, [r4, #12]
 8000cde:	b29b      	uxth	r3, r3
 8000ce0:	f043 0301 	orr.w	r3, r3, #1
 8000ce4:	81a3      	strh	r3, [r4, #12]
 8000ce6:	231e      	movs	r3, #30
 8000ce8:	f88d 3000 	strb.w	r3, [sp]
 8000cec:	4668      	mov	r0, sp
 8000cee:	2301      	movs	r3, #1
 8000cf0:	f88d 5001 	strb.w	r5, [sp, #1]
 8000cf4:	f88d 3002 	strb.w	r3, [sp, #2]
 8000cf8:	f88d 3003 	strb.w	r3, [sp, #3]
 8000cfc:	f000 fc2a 	bl	8001554 <NVIC_Init>
 8000d00:	b005      	add	sp, #20
 8000d02:	bd30      	pop	{r4, r5, pc}
 8000d04:	20000ba8 	.word	0x20000ba8
 8000d08:	20000b9c 	.word	0x20000b9c
 8000d0c:	20000b94 	.word	0x20000b94
 8000d10:	20000ba4 	.word	0x20000ba4
 8000d14:	40000800 	.word	0x40000800

08000d18 <TIM4_IRQHandler>:
 8000d18:	2300      	movs	r3, #0
 8000d1a:	4a10      	ldr	r2, [pc, #64]	; (8000d5c <TIM4_IRQHandler+0x44>)
 8000d1c:	f832 1013 	ldrh.w	r1, [r2, r3, lsl #1]
 8000d20:	b289      	uxth	r1, r1
 8000d22:	b129      	cbz	r1, 8000d30 <TIM4_IRQHandler+0x18>
 8000d24:	f832 1013 	ldrh.w	r1, [r2, r3, lsl #1]
 8000d28:	b289      	uxth	r1, r1
 8000d2a:	3901      	subs	r1, #1
 8000d2c:	b289      	uxth	r1, r1
 8000d2e:	e007      	b.n	8000d40 <TIM4_IRQHandler+0x28>
 8000d30:	490b      	ldr	r1, [pc, #44]	; (8000d60 <TIM4_IRQHandler+0x48>)
 8000d32:	f831 1013 	ldrh.w	r1, [r1, r3, lsl #1]
 8000d36:	b289      	uxth	r1, r1
 8000d38:	f822 1013 	strh.w	r1, [r2, r3, lsl #1]
 8000d3c:	4a09      	ldr	r2, [pc, #36]	; (8000d64 <TIM4_IRQHandler+0x4c>)
 8000d3e:	2101      	movs	r1, #1
 8000d40:	f822 1013 	strh.w	r1, [r2, r3, lsl #1]
 8000d44:	3301      	adds	r3, #1
 8000d46:	2b04      	cmp	r3, #4
 8000d48:	d1e7      	bne.n	8000d1a <TIM4_IRQHandler+0x2>
 8000d4a:	4b07      	ldr	r3, [pc, #28]	; (8000d68 <TIM4_IRQHandler+0x50>)
 8000d4c:	4807      	ldr	r0, [pc, #28]	; (8000d6c <TIM4_IRQHandler+0x54>)
 8000d4e:	681a      	ldr	r2, [r3, #0]
 8000d50:	2101      	movs	r1, #1
 8000d52:	3201      	adds	r2, #1
 8000d54:	601a      	str	r2, [r3, #0]
 8000d56:	f7ff bf91 	b.w	8000c7c <TIM_ClearITPendingBit>
 8000d5a:	bf00      	nop
 8000d5c:	20000ba8 	.word	0x20000ba8
 8000d60:	20000b9c 	.word	0x20000b9c
 8000d64:	20000b94 	.word	0x20000b94
 8000d68:	20000ba4 	.word	0x20000ba4
 8000d6c:	40000800 	.word	0x40000800

08000d70 <timer_get_time>:
 8000d70:	b082      	sub	sp, #8
 8000d72:	b672      	cpsid	i
 8000d74:	4b04      	ldr	r3, [pc, #16]	; (8000d88 <timer_get_time+0x18>)
 8000d76:	681b      	ldr	r3, [r3, #0]
 8000d78:	9301      	str	r3, [sp, #4]
 8000d7a:	b662      	cpsie	i
 8000d7c:	9801      	ldr	r0, [sp, #4]
 8000d7e:	230a      	movs	r3, #10
 8000d80:	fbb0 f0f3 	udiv	r0, r0, r3
 8000d84:	b002      	add	sp, #8
 8000d86:	4770      	bx	lr
 8000d88:	20000ba4 	.word	0x20000ba4

08000d8c <timer_delay_ms>:
 8000d8c:	b513      	push	{r0, r1, r4, lr}
 8000d8e:	4604      	mov	r4, r0
 8000d90:	f7ff ffee 	bl	8000d70 <timer_get_time>
 8000d94:	4420      	add	r0, r4
 8000d96:	9001      	str	r0, [sp, #4]
 8000d98:	9c01      	ldr	r4, [sp, #4]
 8000d9a:	f7ff ffe9 	bl	8000d70 <timer_get_time>
 8000d9e:	4284      	cmp	r4, r0
 8000da0:	d902      	bls.n	8000da8 <timer_delay_ms+0x1c>
 8000da2:	f000 f9dd 	bl	8001160 <sleep>
 8000da6:	e7f7      	b.n	8000d98 <timer_delay_ms+0xc>
 8000da8:	b002      	add	sp, #8
 8000daa:	bd10      	pop	{r4, pc}

08000dac <i2c_delay>:
 8000dac:	bf00      	nop
 8000dae:	bf00      	nop
 8000db0:	4770      	bx	lr
	...

08000db4 <SetLowSDA>:
 8000db4:	b537      	push	{r0, r1, r2, r4, r5, lr}
 8000db6:	4d0d      	ldr	r5, [pc, #52]	; (8000dec <SetLowSDA+0x38>)
 8000db8:	2301      	movs	r3, #1
 8000dba:	2202      	movs	r2, #2
 8000dbc:	2440      	movs	r4, #64	; 0x40
 8000dbe:	f88d 3004 	strb.w	r3, [sp, #4]
 8000dc2:	f88d 3006 	strb.w	r3, [sp, #6]
 8000dc6:	4628      	mov	r0, r5
 8000dc8:	2300      	movs	r3, #0
 8000dca:	4669      	mov	r1, sp
 8000dcc:	f88d 2005 	strb.w	r2, [sp, #5]
 8000dd0:	f88d 3007 	strb.w	r3, [sp, #7]
 8000dd4:	9400      	str	r4, [sp, #0]
 8000dd6:	f000 fb63 	bl	80014a0 <GPIO_Init>
 8000dda:	4628      	mov	r0, r5
 8000ddc:	4621      	mov	r1, r4
 8000dde:	f000 fba5 	bl	800152c <GPIO_ResetBits>
 8000de2:	f7ff ffe3 	bl	8000dac <i2c_delay>
 8000de6:	b003      	add	sp, #12
 8000de8:	bd30      	pop	{r4, r5, pc}
 8000dea:	bf00      	nop
 8000dec:	40020000 	.word	0x40020000

08000df0 <SetHighSDA>:
 8000df0:	b537      	push	{r0, r1, r2, r4, r5, lr}
 8000df2:	4d0d      	ldr	r5, [pc, #52]	; (8000e28 <SetHighSDA+0x38>)
 8000df4:	2202      	movs	r2, #2
 8000df6:	2300      	movs	r3, #0
 8000df8:	2440      	movs	r4, #64	; 0x40
 8000dfa:	f88d 2005 	strb.w	r2, [sp, #5]
 8000dfe:	4628      	mov	r0, r5
 8000e00:	2201      	movs	r2, #1
 8000e02:	4669      	mov	r1, sp
 8000e04:	f88d 3004 	strb.w	r3, [sp, #4]
 8000e08:	f88d 2006 	strb.w	r2, [sp, #6]
 8000e0c:	f88d 3007 	strb.w	r3, [sp, #7]
 8000e10:	9400      	str	r4, [sp, #0]
 8000e12:	f000 fb45 	bl	80014a0 <GPIO_Init>
 8000e16:	4628      	mov	r0, r5
 8000e18:	4621      	mov	r1, r4
 8000e1a:	f000 fb85 	bl	8001528 <GPIO_SetBits>
 8000e1e:	f7ff ffc5 	bl	8000dac <i2c_delay>
 8000e22:	b003      	add	sp, #12
 8000e24:	bd30      	pop	{r4, r5, pc}
 8000e26:	bf00      	nop
 8000e28:	40020000 	.word	0x40020000

08000e2c <SetLowSCL>:
 8000e2c:	b508      	push	{r3, lr}
 8000e2e:	4804      	ldr	r0, [pc, #16]	; (8000e40 <SetLowSCL+0x14>)
 8000e30:	2180      	movs	r1, #128	; 0x80
 8000e32:	f000 fb7b 	bl	800152c <GPIO_ResetBits>
 8000e36:	e8bd 4008 	ldmia.w	sp!, {r3, lr}
 8000e3a:	f7ff bfb7 	b.w	8000dac <i2c_delay>
 8000e3e:	bf00      	nop
 8000e40:	40020000 	.word	0x40020000

08000e44 <SetHighSCL>:
 8000e44:	b508      	push	{r3, lr}
 8000e46:	4804      	ldr	r0, [pc, #16]	; (8000e58 <SetHighSCL+0x14>)
 8000e48:	2180      	movs	r1, #128	; 0x80
 8000e4a:	f000 fb6d 	bl	8001528 <GPIO_SetBits>
 8000e4e:	e8bd 4008 	ldmia.w	sp!, {r3, lr}
 8000e52:	f7ff bfab 	b.w	8000dac <i2c_delay>
 8000e56:	bf00      	nop
 8000e58:	40020000 	.word	0x40020000

08000e5c <i2c_0_init>:
 8000e5c:	b507      	push	{r0, r1, r2, lr}
 8000e5e:	2001      	movs	r0, #1
 8000e60:	4601      	mov	r1, r0
 8000e62:	f000 fa89 	bl	8001378 <RCC_AHB1PeriphClockCmd>
 8000e66:	23c0      	movs	r3, #192	; 0xc0
 8000e68:	9300      	str	r3, [sp, #0]
 8000e6a:	2301      	movs	r3, #1
 8000e6c:	2202      	movs	r2, #2
 8000e6e:	480b      	ldr	r0, [pc, #44]	; (8000e9c <i2c_0_init+0x40>)
 8000e70:	f88d 3004 	strb.w	r3, [sp, #4]
 8000e74:	4669      	mov	r1, sp
 8000e76:	f88d 3006 	strb.w	r3, [sp, #6]
 8000e7a:	2300      	movs	r3, #0
 8000e7c:	f88d 2005 	strb.w	r2, [sp, #5]
 8000e80:	f88d 3007 	strb.w	r3, [sp, #7]
 8000e84:	f000 fb0c 	bl	80014a0 <GPIO_Init>
 8000e88:	f7ff ffdc 	bl	8000e44 <SetHighSCL>
 8000e8c:	f7ff ff92 	bl	8000db4 <SetLowSDA>
 8000e90:	f7ff ffae 	bl	8000df0 <SetHighSDA>
 8000e94:	b003      	add	sp, #12
 8000e96:	f85d fb04 	ldr.w	pc, [sp], #4
 8000e9a:	bf00      	nop
 8000e9c:	40020000 	.word	0x40020000

08000ea0 <i2cStart>:
 8000ea0:	b508      	push	{r3, lr}
 8000ea2:	f7ff ffcf 	bl	8000e44 <SetHighSCL>
 8000ea6:	f7ff ffa3 	bl	8000df0 <SetHighSDA>
 8000eaa:	f7ff ffcb 	bl	8000e44 <SetHighSCL>
 8000eae:	f7ff ff81 	bl	8000db4 <SetLowSDA>
 8000eb2:	f7ff ffbb 	bl	8000e2c <SetLowSCL>
 8000eb6:	e8bd 4008 	ldmia.w	sp!, {r3, lr}
 8000eba:	f7ff bf99 	b.w	8000df0 <SetHighSDA>

08000ebe <i2cStop>:
 8000ebe:	b508      	push	{r3, lr}
 8000ec0:	f7ff ffb4 	bl	8000e2c <SetLowSCL>
 8000ec4:	f7ff ff76 	bl	8000db4 <SetLowSDA>
 8000ec8:	f7ff ffbc 	bl	8000e44 <SetHighSCL>
 8000ecc:	f7ff ff72 	bl	8000db4 <SetLowSDA>
 8000ed0:	f7ff ffb8 	bl	8000e44 <SetHighSCL>
 8000ed4:	e8bd 4008 	ldmia.w	sp!, {r3, lr}
 8000ed8:	f7ff bf8a 	b.w	8000df0 <SetHighSDA>

08000edc <i2cWrite>:
 8000edc:	b538      	push	{r3, r4, r5, lr}
 8000ede:	4604      	mov	r4, r0
 8000ee0:	2508      	movs	r5, #8
 8000ee2:	f7ff ffa3 	bl	8000e2c <SetLowSCL>
 8000ee6:	0623      	lsls	r3, r4, #24
 8000ee8:	d502      	bpl.n	8000ef0 <i2cWrite+0x14>
 8000eea:	f7ff ff81 	bl	8000df0 <SetHighSDA>
 8000eee:	e001      	b.n	8000ef4 <i2cWrite+0x18>
 8000ef0:	f7ff ff60 	bl	8000db4 <SetLowSDA>
 8000ef4:	3d01      	subs	r5, #1
 8000ef6:	f7ff ffa5 	bl	8000e44 <SetHighSCL>
 8000efa:	0064      	lsls	r4, r4, #1
 8000efc:	f015 05ff 	ands.w	r5, r5, #255	; 0xff
 8000f00:	b2e4      	uxtb	r4, r4
 8000f02:	d1ee      	bne.n	8000ee2 <i2cWrite+0x6>
 8000f04:	f7ff ff92 	bl	8000e2c <SetLowSCL>
 8000f08:	f7ff ff72 	bl	8000df0 <SetHighSDA>
 8000f0c:	f7ff ff9a 	bl	8000e44 <SetHighSCL>
 8000f10:	4b05      	ldr	r3, [pc, #20]	; (8000f28 <i2cWrite+0x4c>)
 8000f12:	691c      	ldr	r4, [r3, #16]
 8000f14:	f7ff ff8a 	bl	8000e2c <SetLowSCL>
 8000f18:	f7ff ff48 	bl	8000dac <i2c_delay>
 8000f1c:	f084 0040 	eor.w	r0, r4, #64	; 0x40
 8000f20:	f3c0 1080 	ubfx	r0, r0, #6, #1
 8000f24:	bd38      	pop	{r3, r4, r5, pc}
 8000f26:	bf00      	nop
 8000f28:	40020000 	.word	0x40020000

08000f2c <i2cRead>:
 8000f2c:	b570      	push	{r4, r5, r6, lr}
 8000f2e:	4606      	mov	r6, r0
 8000f30:	f7ff ff7c 	bl	8000e2c <SetLowSCL>
 8000f34:	f7ff ff5c 	bl	8000df0 <SetHighSDA>
 8000f38:	2508      	movs	r5, #8
 8000f3a:	2400      	movs	r4, #0
 8000f3c:	f7ff ff82 	bl	8000e44 <SetHighSCL>
 8000f40:	4b0d      	ldr	r3, [pc, #52]	; (8000f78 <i2cRead+0x4c>)
 8000f42:	691b      	ldr	r3, [r3, #16]
 8000f44:	0064      	lsls	r4, r4, #1
 8000f46:	065a      	lsls	r2, r3, #25
 8000f48:	b2e4      	uxtb	r4, r4
 8000f4a:	bf48      	it	mi
 8000f4c:	3401      	addmi	r4, #1
 8000f4e:	f105 35ff 	add.w	r5, r5, #4294967295
 8000f52:	bf48      	it	mi
 8000f54:	b2e4      	uxtbmi	r4, r4
 8000f56:	f7ff ff69 	bl	8000e2c <SetLowSCL>
 8000f5a:	f015 05ff 	ands.w	r5, r5, #255	; 0xff
 8000f5e:	d1ed      	bne.n	8000f3c <i2cRead+0x10>
 8000f60:	b10e      	cbz	r6, 8000f66 <i2cRead+0x3a>
 8000f62:	f7ff ff27 	bl	8000db4 <SetLowSDA>
 8000f66:	f7ff ff6d 	bl	8000e44 <SetHighSCL>
 8000f6a:	f7ff ff5f 	bl	8000e2c <SetLowSCL>
 8000f6e:	f7ff ff1d 	bl	8000dac <i2c_delay>
 8000f72:	4620      	mov	r0, r4
 8000f74:	bd70      	pop	{r4, r5, r6, pc}
 8000f76:	bf00      	nop
 8000f78:	40020000 	.word	0x40020000

08000f7c <i2c_write_reg>:
 8000f7c:	b570      	push	{r4, r5, r6, lr}
 8000f7e:	4605      	mov	r5, r0
 8000f80:	460c      	mov	r4, r1
 8000f82:	4616      	mov	r6, r2
 8000f84:	f7ff ff8c 	bl	8000ea0 <i2cStart>
 8000f88:	4628      	mov	r0, r5
 8000f8a:	f7ff ffa7 	bl	8000edc <i2cWrite>
 8000f8e:	4620      	mov	r0, r4
 8000f90:	f7ff ffa4 	bl	8000edc <i2cWrite>
 8000f94:	4630      	mov	r0, r6
 8000f96:	f7ff ffa1 	bl	8000edc <i2cWrite>
 8000f9a:	e8bd 4070 	ldmia.w	sp!, {r4, r5, r6, lr}
 8000f9e:	f7ff bf8e 	b.w	8000ebe <i2cStop>

08000fa2 <i2c_read_reg>:
 8000fa2:	b538      	push	{r3, r4, r5, lr}
 8000fa4:	4604      	mov	r4, r0
 8000fa6:	460d      	mov	r5, r1
 8000fa8:	f7ff ff7a 	bl	8000ea0 <i2cStart>
 8000fac:	4620      	mov	r0, r4
 8000fae:	f7ff ff95 	bl	8000edc <i2cWrite>
 8000fb2:	4628      	mov	r0, r5
 8000fb4:	f7ff ff92 	bl	8000edc <i2cWrite>
 8000fb8:	f7ff ff72 	bl	8000ea0 <i2cStart>
 8000fbc:	f044 0001 	orr.w	r0, r4, #1
 8000fc0:	f7ff ff8c 	bl	8000edc <i2cWrite>
 8000fc4:	2000      	movs	r0, #0
 8000fc6:	f7ff ffb1 	bl	8000f2c <i2cRead>
 8000fca:	4604      	mov	r4, r0
 8000fcc:	f7ff ff77 	bl	8000ebe <i2cStop>
 8000fd0:	4620      	mov	r0, r4
 8000fd2:	bd38      	pop	{r3, r4, r5, pc}

08000fd4 <uart_write>:
 8000fd4:	4b03      	ldr	r3, [pc, #12]	; (8000fe4 <uart_write+0x10>)
 8000fd6:	881a      	ldrh	r2, [r3, #0]
 8000fd8:	0652      	lsls	r2, r2, #25
 8000fda:	d401      	bmi.n	8000fe0 <uart_write+0xc>
 8000fdc:	bf00      	nop
 8000fde:	e7f9      	b.n	8000fd4 <uart_write>
 8000fe0:	8098      	strh	r0, [r3, #4]
 8000fe2:	4770      	bx	lr
 8000fe4:	40011000 	.word	0x40011000

08000fe8 <uart_init>:
 8000fe8:	b530      	push	{r4, r5, lr}
 8000fea:	2010      	movs	r0, #16
 8000fec:	b087      	sub	sp, #28
 8000fee:	2101      	movs	r1, #1
 8000ff0:	f000 f9da 	bl	80013a8 <RCC_APB2PeriphClockCmd>
 8000ff4:	2001      	movs	r0, #1
 8000ff6:	4d1c      	ldr	r5, [pc, #112]	; (8001068 <uart_init+0x80>)
 8000ff8:	4601      	mov	r1, r0
 8000ffa:	f000 f9bd 	bl	8001378 <RCC_AHB1PeriphClockCmd>
 8000ffe:	f44f 63c0 	mov.w	r3, #1536	; 0x600
 8001002:	2400      	movs	r4, #0
 8001004:	9300      	str	r3, [sp, #0]
 8001006:	4628      	mov	r0, r5
 8001008:	2302      	movs	r3, #2
 800100a:	4669      	mov	r1, sp
 800100c:	f88d 3004 	strb.w	r3, [sp, #4]
 8001010:	f88d 3005 	strb.w	r3, [sp, #5]
 8001014:	f88d 4006 	strb.w	r4, [sp, #6]
 8001018:	f88d 4007 	strb.w	r4, [sp, #7]
 800101c:	f000 fa40 	bl	80014a0 <GPIO_Init>
 8001020:	4628      	mov	r0, r5
 8001022:	2109      	movs	r1, #9
 8001024:	2207      	movs	r2, #7
 8001026:	f000 fa83 	bl	8001530 <GPIO_PinAFConfig>
 800102a:	2207      	movs	r2, #7
 800102c:	4628      	mov	r0, r5
 800102e:	210a      	movs	r1, #10
 8001030:	f000 fa7e 	bl	8001530 <GPIO_PinAFConfig>
 8001034:	f8ad 400c 	strh.w	r4, [sp, #12]
 8001038:	f8ad 400e 	strh.w	r4, [sp, #14]
 800103c:	f8ad 4010 	strh.w	r4, [sp, #16]
 8001040:	f8ad 4014 	strh.w	r4, [sp, #20]
 8001044:	4c09      	ldr	r4, [pc, #36]	; (800106c <uart_init+0x84>)
 8001046:	f44f 33e1 	mov.w	r3, #115200	; 0x1c200
 800104a:	9302      	str	r3, [sp, #8]
 800104c:	4620      	mov	r0, r4
 800104e:	230c      	movs	r3, #12
 8001050:	a902      	add	r1, sp, #8
 8001052:	f8ad 3012 	strh.w	r3, [sp, #18]
 8001056:	f000 f80b 	bl	8001070 <USART_Init>
 800105a:	4620      	mov	r0, r4
 800105c:	2101      	movs	r1, #1
 800105e:	f000 f861 	bl	8001124 <USART_Cmd>
 8001062:	b007      	add	sp, #28
 8001064:	bd30      	pop	{r4, r5, pc}
 8001066:	bf00      	nop
 8001068:	40020000 	.word	0x40020000
 800106c:	40011000 	.word	0x40011000

08001070 <USART_Init>:
 8001070:	8a03      	ldrh	r3, [r0, #16]
 8001072:	88ca      	ldrh	r2, [r1, #6]
 8001074:	b29b      	uxth	r3, r3
 8001076:	f423 5340 	bic.w	r3, r3, #12288	; 0x3000
 800107a:	b530      	push	{r4, r5, lr}
 800107c:	4313      	orrs	r3, r2
 800107e:	460d      	mov	r5, r1
 8001080:	8203      	strh	r3, [r0, #16]
 8001082:	8983      	ldrh	r3, [r0, #12]
 8001084:	8909      	ldrh	r1, [r1, #8]
 8001086:	88aa      	ldrh	r2, [r5, #4]
 8001088:	f423 53b0 	bic.w	r3, r3, #5632	; 0x1600
 800108c:	430a      	orrs	r2, r1
 800108e:	8969      	ldrh	r1, [r5, #10]
 8001090:	f023 030c 	bic.w	r3, r3, #12
 8001094:	430a      	orrs	r2, r1
 8001096:	041b      	lsls	r3, r3, #16
 8001098:	b292      	uxth	r2, r2
 800109a:	0c1b      	lsrs	r3, r3, #16
 800109c:	4313      	orrs	r3, r2
 800109e:	8183      	strh	r3, [r0, #12]
 80010a0:	8a83      	ldrh	r3, [r0, #20]
 80010a2:	89aa      	ldrh	r2, [r5, #12]
 80010a4:	b29b      	uxth	r3, r3
 80010a6:	f423 7340 	bic.w	r3, r3, #768	; 0x300
 80010aa:	4313      	orrs	r3, r2
 80010ac:	b085      	sub	sp, #20
 80010ae:	8283      	strh	r3, [r0, #20]
 80010b0:	4604      	mov	r4, r0
 80010b2:	4668      	mov	r0, sp
 80010b4:	f000 f91c 	bl	80012f0 <RCC_GetClocksFreq>
 80010b8:	4b19      	ldr	r3, [pc, #100]	; (8001120 <USART_Init+0xb0>)
 80010ba:	429c      	cmp	r4, r3
 80010bc:	d003      	beq.n	80010c6 <USART_Init+0x56>
 80010be:	f503 6380 	add.w	r3, r3, #1024	; 0x400
 80010c2:	429c      	cmp	r4, r3
 80010c4:	d101      	bne.n	80010ca <USART_Init+0x5a>
 80010c6:	9b03      	ldr	r3, [sp, #12]
 80010c8:	e000      	b.n	80010cc <USART_Init+0x5c>
 80010ca:	9b02      	ldr	r3, [sp, #8]
 80010cc:	89a2      	ldrh	r2, [r4, #12]
 80010ce:	b212      	sxth	r2, r2
 80010d0:	2a00      	cmp	r2, #0
 80010d2:	682a      	ldr	r2, [r5, #0]
 80010d4:	f04f 0119 	mov.w	r1, #25
 80010d8:	bfb4      	ite	lt
 80010da:	0052      	lsllt	r2, r2, #1
 80010dc:	0092      	lslge	r2, r2, #2
 80010de:	4359      	muls	r1, r3
 80010e0:	fbb1 f1f2 	udiv	r1, r1, r2
 80010e4:	2364      	movs	r3, #100	; 0x64
 80010e6:	fbb1 f2f3 	udiv	r2, r1, r3
 80010ea:	0112      	lsls	r2, r2, #4
 80010ec:	0910      	lsrs	r0, r2, #4
 80010ee:	fb03 1110 	mls	r1, r3, r0, r1
 80010f2:	89a0      	ldrh	r0, [r4, #12]
 80010f4:	b200      	sxth	r0, r0
 80010f6:	2800      	cmp	r0, #0
 80010f8:	da06      	bge.n	8001108 <USART_Init+0x98>
 80010fa:	00c9      	lsls	r1, r1, #3
 80010fc:	3132      	adds	r1, #50	; 0x32
 80010fe:	fbb1 f3f3 	udiv	r3, r1, r3
 8001102:	f003 0307 	and.w	r3, r3, #7
 8001106:	e005      	b.n	8001114 <USART_Init+0xa4>
 8001108:	0109      	lsls	r1, r1, #4
 800110a:	3132      	adds	r1, #50	; 0x32
 800110c:	fbb1 f3f3 	udiv	r3, r1, r3
 8001110:	f003 030f 	and.w	r3, r3, #15
 8001114:	431a      	orrs	r2, r3
 8001116:	b292      	uxth	r2, r2
 8001118:	8122      	strh	r2, [r4, #8]
 800111a:	b005      	add	sp, #20
 800111c:	bd30      	pop	{r4, r5, pc}
 800111e:	bf00      	nop
 8001120:	40011000 	.word	0x40011000

08001124 <USART_Cmd>:
 8001124:	8983      	ldrh	r3, [r0, #12]
 8001126:	b119      	cbz	r1, 8001130 <USART_Cmd+0xc>
 8001128:	b29b      	uxth	r3, r3
 800112a:	f443 5300 	orr.w	r3, r3, #8192	; 0x2000
 800112e:	e003      	b.n	8001138 <USART_Cmd+0x14>
 8001130:	f423 5300 	bic.w	r3, r3, #8192	; 0x2000
 8001134:	041b      	lsls	r3, r3, #16
 8001136:	0c1b      	lsrs	r3, r3, #16
 8001138:	8183      	strh	r3, [r0, #12]
 800113a:	4770      	bx	lr

0800113c <sys_tick_init>:
 800113c:	4b05      	ldr	r3, [pc, #20]	; (8001154 <sys_tick_init+0x18>)
 800113e:	4a06      	ldr	r2, [pc, #24]	; (8001158 <sys_tick_init+0x1c>)
 8001140:	605a      	str	r2, [r3, #4]
 8001142:	4a06      	ldr	r2, [pc, #24]	; (800115c <sys_tick_init+0x20>)
 8001144:	21f0      	movs	r1, #240	; 0xf0
 8001146:	f882 1023 	strb.w	r1, [r2, #35]	; 0x23
 800114a:	2200      	movs	r2, #0
 800114c:	609a      	str	r2, [r3, #8]
 800114e:	2207      	movs	r2, #7
 8001150:	601a      	str	r2, [r3, #0]
 8001152:	4770      	bx	lr
 8001154:	e000e010 	.word	0xe000e010
 8001158:	00029040 	.word	0x00029040
 800115c:	e000ed00 	.word	0xe000ed00

08001160 <sleep>:
 8001160:	bf30      	wfi
 8001162:	4770      	bx	lr

08001164 <sytem_clock_init>:
 8001164:	f000 b800 	b.w	8001168 <SystemInit>

08001168 <SystemInit>:
 8001168:	4b3b      	ldr	r3, [pc, #236]	; (8001258 <SystemInit+0xf0>)
 800116a:	f8d3 2088 	ldr.w	r2, [r3, #136]	; 0x88
 800116e:	f442 0270 	orr.w	r2, r2, #15728640	; 0xf00000
 8001172:	f8c3 2088 	str.w	r2, [r3, #136]	; 0x88
 8001176:	f8d3 2088 	ldr.w	r2, [r3, #136]	; 0x88
 800117a:	f442 0270 	orr.w	r2, r2, #15728640	; 0xf00000
 800117e:	f8c3 2088 	str.w	r2, [r3, #136]	; 0x88
 8001182:	4b36      	ldr	r3, [pc, #216]	; (800125c <SystemInit+0xf4>)
 8001184:	681a      	ldr	r2, [r3, #0]
 8001186:	f042 0201 	orr.w	r2, r2, #1
 800118a:	601a      	str	r2, [r3, #0]
 800118c:	2200      	movs	r2, #0
 800118e:	609a      	str	r2, [r3, #8]
 8001190:	6819      	ldr	r1, [r3, #0]
 8001192:	f021 7184 	bic.w	r1, r1, #17301504	; 0x1080000
 8001196:	f421 3180 	bic.w	r1, r1, #65536	; 0x10000
 800119a:	6019      	str	r1, [r3, #0]
 800119c:	4930      	ldr	r1, [pc, #192]	; (8001260 <SystemInit+0xf8>)
 800119e:	6059      	str	r1, [r3, #4]
 80011a0:	6819      	ldr	r1, [r3, #0]
 80011a2:	b082      	sub	sp, #8
 80011a4:	f421 2180 	bic.w	r1, r1, #262144	; 0x40000
 80011a8:	6019      	str	r1, [r3, #0]
 80011aa:	60da      	str	r2, [r3, #12]
 80011ac:	9200      	str	r2, [sp, #0]
 80011ae:	9201      	str	r2, [sp, #4]
 80011b0:	681a      	ldr	r2, [r3, #0]
 80011b2:	f442 3280 	orr.w	r2, r2, #65536	; 0x10000
 80011b6:	601a      	str	r2, [r3, #0]
 80011b8:	4b28      	ldr	r3, [pc, #160]	; (800125c <SystemInit+0xf4>)
 80011ba:	681a      	ldr	r2, [r3, #0]
 80011bc:	f402 3200 	and.w	r2, r2, #131072	; 0x20000
 80011c0:	9201      	str	r2, [sp, #4]
 80011c2:	9a00      	ldr	r2, [sp, #0]
 80011c4:	3201      	adds	r2, #1
 80011c6:	9200      	str	r2, [sp, #0]
 80011c8:	9a01      	ldr	r2, [sp, #4]
 80011ca:	b91a      	cbnz	r2, 80011d4 <SystemInit+0x6c>
 80011cc:	9a00      	ldr	r2, [sp, #0]
 80011ce:	f5b2 6fa0 	cmp.w	r2, #1280	; 0x500
 80011d2:	d1f1      	bne.n	80011b8 <SystemInit+0x50>
 80011d4:	681b      	ldr	r3, [r3, #0]
 80011d6:	f413 3300 	ands.w	r3, r3, #131072	; 0x20000
 80011da:	bf18      	it	ne
 80011dc:	2301      	movne	r3, #1
 80011de:	9301      	str	r3, [sp, #4]
 80011e0:	9b01      	ldr	r3, [sp, #4]
 80011e2:	2b01      	cmp	r3, #1
 80011e4:	d005      	beq.n	80011f2 <SystemInit+0x8a>
 80011e6:	4b1c      	ldr	r3, [pc, #112]	; (8001258 <SystemInit+0xf0>)
 80011e8:	f04f 6200 	mov.w	r2, #134217728	; 0x8000000
 80011ec:	609a      	str	r2, [r3, #8]
 80011ee:	b002      	add	sp, #8
 80011f0:	4770      	bx	lr
 80011f2:	4b1a      	ldr	r3, [pc, #104]	; (800125c <SystemInit+0xf4>)
 80011f4:	6c1a      	ldr	r2, [r3, #64]	; 0x40
 80011f6:	f042 5280 	orr.w	r2, r2, #268435456	; 0x10000000
 80011fa:	641a      	str	r2, [r3, #64]	; 0x40
 80011fc:	4a19      	ldr	r2, [pc, #100]	; (8001264 <SystemInit+0xfc>)
 80011fe:	6811      	ldr	r1, [r2, #0]
 8001200:	f441 4180 	orr.w	r1, r1, #16384	; 0x4000
 8001204:	6011      	str	r1, [r2, #0]
 8001206:	689a      	ldr	r2, [r3, #8]
 8001208:	f042 0290 	orr.w	r2, r2, #144	; 0x90
 800120c:	609a      	str	r2, [r3, #8]
 800120e:	689a      	ldr	r2, [r3, #8]
 8001210:	f442 4200 	orr.w	r2, r2, #32768	; 0x8000
 8001214:	609a      	str	r2, [r3, #8]
 8001216:	689a      	ldr	r2, [r3, #8]
 8001218:	f442 52a0 	orr.w	r2, r2, #5120	; 0x1400
 800121c:	609a      	str	r2, [r3, #8]
 800121e:	4a12      	ldr	r2, [pc, #72]	; (8001268 <SystemInit+0x100>)
 8001220:	605a      	str	r2, [r3, #4]
 8001222:	681a      	ldr	r2, [r3, #0]
 8001224:	f042 7280 	orr.w	r2, r2, #16777216	; 0x1000000
 8001228:	601a      	str	r2, [r3, #0]
 800122a:	6819      	ldr	r1, [r3, #0]
 800122c:	4a0b      	ldr	r2, [pc, #44]	; (800125c <SystemInit+0xf4>)
 800122e:	0189      	lsls	r1, r1, #6
 8001230:	d5fb      	bpl.n	800122a <SystemInit+0xc2>
 8001232:	4b0e      	ldr	r3, [pc, #56]	; (800126c <SystemInit+0x104>)
 8001234:	f240 6105 	movw	r1, #1541	; 0x605
 8001238:	6019      	str	r1, [r3, #0]
 800123a:	6893      	ldr	r3, [r2, #8]
 800123c:	f023 0303 	bic.w	r3, r3, #3
 8001240:	6093      	str	r3, [r2, #8]
 8001242:	6893      	ldr	r3, [r2, #8]
 8001244:	f043 0302 	orr.w	r3, r3, #2
 8001248:	6093      	str	r3, [r2, #8]
 800124a:	4b04      	ldr	r3, [pc, #16]	; (800125c <SystemInit+0xf4>)
 800124c:	689b      	ldr	r3, [r3, #8]
 800124e:	f003 030c 	and.w	r3, r3, #12
 8001252:	2b08      	cmp	r3, #8
 8001254:	d1f9      	bne.n	800124a <SystemInit+0xe2>
 8001256:	e7c6      	b.n	80011e6 <SystemInit+0x7e>
 8001258:	e000ed00 	.word	0xe000ed00
 800125c:	40023800 	.word	0x40023800
 8001260:	24003010 	.word	0x24003010
 8001264:	40007000 	.word	0x40007000
 8001268:	07405408 	.word	0x07405408
 800126c:	40023c00 	.word	0x40023c00

08001270 <Default_Handler>:
 8001270:	4668      	mov	r0, sp
 8001272:	f020 0107 	bic.w	r1, r0, #7
 8001276:	468d      	mov	sp, r1
 8001278:	bf00      	nop
 800127a:	e7fd      	b.n	8001278 <Default_Handler+0x8>

0800127c <HardFault_Handler>:
 800127c:	f44f 5000 	mov.w	r0, #8192	; 0x2000
 8001280:	f000 f8f6 	bl	8001470 <led_on>
 8001284:	4b06      	ldr	r3, [pc, #24]	; (80012a0 <HardFault_Handler+0x24>)
 8001286:	3b01      	subs	r3, #1
 8001288:	d001      	beq.n	800128e <HardFault_Handler+0x12>
 800128a:	bf00      	nop
 800128c:	e7fb      	b.n	8001286 <HardFault_Handler+0xa>
 800128e:	f44f 5000 	mov.w	r0, #8192	; 0x2000
 8001292:	f000 f8f3 	bl	800147c <led_off>
 8001296:	4b02      	ldr	r3, [pc, #8]	; (80012a0 <HardFault_Handler+0x24>)
 8001298:	3b01      	subs	r3, #1
 800129a:	d0ef      	beq.n	800127c <HardFault_Handler>
 800129c:	bf00      	nop
 800129e:	e7fb      	b.n	8001298 <HardFault_Handler+0x1c>
 80012a0:	00989681 	.word	0x00989681

080012a4 <_reset_init>:
 80012a4:	4a0e      	ldr	r2, [pc, #56]	; (80012e0 <_reset_init+0x3c>)
 80012a6:	480f      	ldr	r0, [pc, #60]	; (80012e4 <_reset_init+0x40>)
 80012a8:	1a80      	subs	r0, r0, r2
 80012aa:	1080      	asrs	r0, r0, #2
 80012ac:	2300      	movs	r3, #0
 80012ae:	4283      	cmp	r3, r0
 80012b0:	d006      	beq.n	80012c0 <_reset_init+0x1c>
 80012b2:	490d      	ldr	r1, [pc, #52]	; (80012e8 <_reset_init+0x44>)
 80012b4:	f851 1023 	ldr.w	r1, [r1, r3, lsl #2]
 80012b8:	f842 1023 	str.w	r1, [r2, r3, lsl #2]
 80012bc:	3301      	adds	r3, #1
 80012be:	e7f6      	b.n	80012ae <_reset_init+0xa>
 80012c0:	4b0a      	ldr	r3, [pc, #40]	; (80012ec <_reset_init+0x48>)
 80012c2:	f8d3 2088 	ldr.w	r2, [r3, #136]	; 0x88
 80012c6:	f442 0270 	orr.w	r2, r2, #15728640	; 0xf00000
 80012ca:	f8c3 2088 	str.w	r2, [r3, #136]	; 0x88
 80012ce:	f503 730c 	add.w	r3, r3, #560	; 0x230
 80012d2:	685a      	ldr	r2, [r3, #4]
 80012d4:	f022 4240 	bic.w	r2, r2, #3221225472	; 0xc0000000
 80012d8:	605a      	str	r2, [r3, #4]
 80012da:	f7ff ba0d 	b.w	80006f8 <main>
 80012de:	bf00      	nop
 80012e0:	20000000 	.word	0x20000000
 80012e4:	20000010 	.word	0x20000010
 80012e8:	08001730 	.word	0x08001730
 80012ec:	e000ed00 	.word	0xe000ed00

080012f0 <RCC_GetClocksFreq>:
 80012f0:	4b1d      	ldr	r3, [pc, #116]	; (8001368 <RCC_GetClocksFreq+0x78>)
 80012f2:	689a      	ldr	r2, [r3, #8]
 80012f4:	f002 020c 	and.w	r2, r2, #12
 80012f8:	2a04      	cmp	r2, #4
 80012fa:	b510      	push	{r4, lr}
 80012fc:	d003      	beq.n	8001306 <RCC_GetClocksFreq+0x16>
 80012fe:	2a08      	cmp	r2, #8
 8001300:	d003      	beq.n	800130a <RCC_GetClocksFreq+0x1a>
 8001302:	4b1a      	ldr	r3, [pc, #104]	; (800136c <RCC_GetClocksFreq+0x7c>)
 8001304:	e018      	b.n	8001338 <RCC_GetClocksFreq+0x48>
 8001306:	4b1a      	ldr	r3, [pc, #104]	; (8001370 <RCC_GetClocksFreq+0x80>)
 8001308:	e016      	b.n	8001338 <RCC_GetClocksFreq+0x48>
 800130a:	6859      	ldr	r1, [r3, #4]
 800130c:	685a      	ldr	r2, [r3, #4]
 800130e:	f411 0f80 	tst.w	r1, #4194304	; 0x400000
 8001312:	6859      	ldr	r1, [r3, #4]
 8001314:	bf14      	ite	ne
 8001316:	4b16      	ldrne	r3, [pc, #88]	; (8001370 <RCC_GetClocksFreq+0x80>)
 8001318:	4b14      	ldreq	r3, [pc, #80]	; (800136c <RCC_GetClocksFreq+0x7c>)
 800131a:	f002 023f 	and.w	r2, r2, #63	; 0x3f
 800131e:	fbb3 f3f2 	udiv	r3, r3, r2
 8001322:	4a11      	ldr	r2, [pc, #68]	; (8001368 <RCC_GetClocksFreq+0x78>)
 8001324:	6852      	ldr	r2, [r2, #4]
 8001326:	f3c2 4201 	ubfx	r2, r2, #16, #2
 800132a:	f3c1 1188 	ubfx	r1, r1, #6, #9
 800132e:	3201      	adds	r2, #1
 8001330:	434b      	muls	r3, r1
 8001332:	0052      	lsls	r2, r2, #1
 8001334:	fbb3 f3f2 	udiv	r3, r3, r2
 8001338:	490b      	ldr	r1, [pc, #44]	; (8001368 <RCC_GetClocksFreq+0x78>)
 800133a:	6003      	str	r3, [r0, #0]
 800133c:	688b      	ldr	r3, [r1, #8]
 800133e:	4a0d      	ldr	r2, [pc, #52]	; (8001374 <RCC_GetClocksFreq+0x84>)
 8001340:	f3c3 1303 	ubfx	r3, r3, #4, #4
 8001344:	5cd4      	ldrb	r4, [r2, r3]
 8001346:	6803      	ldr	r3, [r0, #0]
 8001348:	40e3      	lsrs	r3, r4
 800134a:	6043      	str	r3, [r0, #4]
 800134c:	688c      	ldr	r4, [r1, #8]
 800134e:	f3c4 2482 	ubfx	r4, r4, #10, #3
 8001352:	5d14      	ldrb	r4, [r2, r4]
 8001354:	fa23 f404 	lsr.w	r4, r3, r4
 8001358:	6084      	str	r4, [r0, #8]
 800135a:	6889      	ldr	r1, [r1, #8]
 800135c:	f3c1 3142 	ubfx	r1, r1, #13, #3
 8001360:	5c52      	ldrb	r2, [r2, r1]
 8001362:	40d3      	lsrs	r3, r2
 8001364:	60c3      	str	r3, [r0, #12]
 8001366:	bd10      	pop	{r4, pc}
 8001368:	40023800 	.word	0x40023800
 800136c:	00f42400 	.word	0x00f42400
 8001370:	007a1200 	.word	0x007a1200
 8001374:	20000000 	.word	0x20000000

08001378 <RCC_AHB1PeriphClockCmd>:
 8001378:	4b04      	ldr	r3, [pc, #16]	; (800138c <RCC_AHB1PeriphClockCmd+0x14>)
 800137a:	6b1a      	ldr	r2, [r3, #48]	; 0x30
 800137c:	b109      	cbz	r1, 8001382 <RCC_AHB1PeriphClockCmd+0xa>
 800137e:	4310      	orrs	r0, r2
 8001380:	e001      	b.n	8001386 <RCC_AHB1PeriphClockCmd+0xe>
 8001382:	ea22 0000 	bic.w	r0, r2, r0
 8001386:	6318      	str	r0, [r3, #48]	; 0x30
 8001388:	4770      	bx	lr
 800138a:	bf00      	nop
 800138c:	40023800 	.word	0x40023800

08001390 <RCC_APB1PeriphClockCmd>:
 8001390:	4b04      	ldr	r3, [pc, #16]	; (80013a4 <RCC_APB1PeriphClockCmd+0x14>)
 8001392:	6c1a      	ldr	r2, [r3, #64]	; 0x40
 8001394:	b109      	cbz	r1, 800139a <RCC_APB1PeriphClockCmd+0xa>
 8001396:	4310      	orrs	r0, r2
 8001398:	e001      	b.n	800139e <RCC_APB1PeriphClockCmd+0xe>
 800139a:	ea22 0000 	bic.w	r0, r2, r0
 800139e:	6418      	str	r0, [r3, #64]	; 0x40
 80013a0:	4770      	bx	lr
 80013a2:	bf00      	nop
 80013a4:	40023800 	.word	0x40023800

080013a8 <RCC_APB2PeriphClockCmd>:
 80013a8:	4b04      	ldr	r3, [pc, #16]	; (80013bc <RCC_APB2PeriphClockCmd+0x14>)
 80013aa:	6c5a      	ldr	r2, [r3, #68]	; 0x44
 80013ac:	b109      	cbz	r1, 80013b2 <RCC_APB2PeriphClockCmd+0xa>
 80013ae:	4310      	orrs	r0, r2
 80013b0:	e001      	b.n	80013b6 <RCC_APB2PeriphClockCmd+0xe>
 80013b2:	ea22 0000 	bic.w	r0, r2, r0
 80013b6:	6458      	str	r0, [r3, #68]	; 0x44
 80013b8:	4770      	bx	lr
 80013ba:	bf00      	nop
 80013bc:	40023800 	.word	0x40023800

080013c0 <lib_low_level_init>:
 80013c0:	b508      	push	{r3, lr}
 80013c2:	f7ff fecf 	bl	8001164 <sytem_clock_init>
 80013c6:	f000 f809 	bl	80013dc <gpio_init>
 80013ca:	f7ff fe0d 	bl	8000fe8 <uart_init>
 80013ce:	f7ff fc59 	bl	8000c84 <timer_init>
 80013d2:	e8bd 4008 	ldmia.w	sp!, {r3, lr}
 80013d6:	f7ff bd41 	b.w	8000e5c <i2c_0_init>
	...

080013dc <gpio_init>:
 80013dc:	b573      	push	{r0, r1, r4, r5, r6, lr}
 80013de:	2001      	movs	r0, #1
 80013e0:	4601      	mov	r1, r0
 80013e2:	f7ff ffc9 	bl	8001378 <RCC_AHB1PeriphClockCmd>
 80013e6:	2002      	movs	r0, #2
 80013e8:	2101      	movs	r1, #1
 80013ea:	f7ff ffc5 	bl	8001378 <RCC_AHB1PeriphClockCmd>
 80013ee:	2004      	movs	r0, #4
 80013f0:	2101      	movs	r1, #1
 80013f2:	f7ff ffc1 	bl	8001378 <RCC_AHB1PeriphClockCmd>
 80013f6:	2008      	movs	r0, #8
 80013f8:	2101      	movs	r1, #1
 80013fa:	f7ff ffbd 	bl	8001378 <RCC_AHB1PeriphClockCmd>
 80013fe:	2008      	movs	r0, #8
 8001400:	2101      	movs	r1, #1
 8001402:	f7ff ffb9 	bl	8001378 <RCC_AHB1PeriphClockCmd>
 8001406:	2010      	movs	r0, #16
 8001408:	2101      	movs	r1, #1
 800140a:	f7ff ffb5 	bl	8001378 <RCC_AHB1PeriphClockCmd>
 800140e:	4c16      	ldr	r4, [pc, #88]	; (8001468 <gpio_init+0x8c>)
 8001410:	2020      	movs	r0, #32
 8001412:	2101      	movs	r1, #1
 8001414:	f7ff ffb0 	bl	8001378 <RCC_AHB1PeriphClockCmd>
 8001418:	f44f 4360 	mov.w	r3, #57344	; 0xe000
 800141c:	2500      	movs	r5, #0
 800141e:	9300      	str	r3, [sp, #0]
 8001420:	2601      	movs	r6, #1
 8001422:	2303      	movs	r3, #3
 8001424:	4620      	mov	r0, r4
 8001426:	4669      	mov	r1, sp
 8001428:	f88d 3005 	strb.w	r3, [sp, #5]
 800142c:	f88d 6004 	strb.w	r6, [sp, #4]
 8001430:	f88d 5006 	strb.w	r5, [sp, #6]
 8001434:	f88d 5007 	strb.w	r5, [sp, #7]
 8001438:	f000 f832 	bl	80014a0 <GPIO_Init>
 800143c:	2302      	movs	r3, #2
 800143e:	480b      	ldr	r0, [pc, #44]	; (800146c <gpio_init+0x90>)
 8001440:	f88d 3005 	strb.w	r3, [sp, #5]
 8001444:	4669      	mov	r1, sp
 8001446:	9600      	str	r6, [sp, #0]
 8001448:	f88d 5004 	strb.w	r5, [sp, #4]
 800144c:	f000 f828 	bl	80014a0 <GPIO_Init>
 8001450:	f44f 5300 	mov.w	r3, #8192	; 0x2000
 8001454:	8363      	strh	r3, [r4, #26]
 8001456:	f44f 4380 	mov.w	r3, #16384	; 0x4000
 800145a:	8363      	strh	r3, [r4, #26]
 800145c:	f44f 4300 	mov.w	r3, #32768	; 0x8000
 8001460:	8363      	strh	r3, [r4, #26]
 8001462:	b002      	add	sp, #8
 8001464:	bd70      	pop	{r4, r5, r6, pc}
 8001466:	bf00      	nop
 8001468:	40021400 	.word	0x40021400
 800146c:	40020000 	.word	0x40020000

08001470 <led_on>:
 8001470:	4b01      	ldr	r3, [pc, #4]	; (8001478 <led_on+0x8>)
 8001472:	b280      	uxth	r0, r0
 8001474:	8318      	strh	r0, [r3, #24]
 8001476:	4770      	bx	lr
 8001478:	40021400 	.word	0x40021400

0800147c <led_off>:
 800147c:	4b01      	ldr	r3, [pc, #4]	; (8001484 <led_off+0x8>)
 800147e:	b280      	uxth	r0, r0
 8001480:	8358      	strh	r0, [r3, #26]
 8001482:	4770      	bx	lr
 8001484:	40021400 	.word	0x40021400

08001488 <get_key>:
 8001488:	b508      	push	{r3, lr}
 800148a:	4804      	ldr	r0, [pc, #16]	; (800149c <get_key+0x14>)
 800148c:	f000 f849 	bl	8001522 <GPIO_ReadInputData>
 8001490:	f000 0001 	and.w	r0, r0, #1
 8001494:	f080 0001 	eor.w	r0, r0, #1
 8001498:	bd08      	pop	{r3, pc}
 800149a:	bf00      	nop
 800149c:	40020000 	.word	0x40020000

080014a0 <GPIO_Init>:
 80014a0:	e92d 41f0 	stmdb	sp!, {r4, r5, r6, r7, r8, lr}
 80014a4:	680f      	ldr	r7, [r1, #0]
 80014a6:	2300      	movs	r3, #0
 80014a8:	2201      	movs	r2, #1
 80014aa:	409a      	lsls	r2, r3
 80014ac:	ea02 0507 	and.w	r5, r2, r7
 80014b0:	4295      	cmp	r5, r2
 80014b2:	d131      	bne.n	8001518 <GPIO_Init+0x78>
 80014b4:	005a      	lsls	r2, r3, #1
 80014b6:	2403      	movs	r4, #3
 80014b8:	6806      	ldr	r6, [r0, #0]
 80014ba:	4094      	lsls	r4, r2
 80014bc:	43e4      	mvns	r4, r4
 80014be:	4026      	ands	r6, r4
 80014c0:	6006      	str	r6, [r0, #0]
 80014c2:	790e      	ldrb	r6, [r1, #4]
 80014c4:	f8d0 c000 	ldr.w	ip, [r0]
 80014c8:	fa06 f802 	lsl.w	r8, r6, r2
 80014cc:	3e01      	subs	r6, #1
 80014ce:	b2f6      	uxtb	r6, r6
 80014d0:	ea48 0c0c 	orr.w	ip, r8, ip
 80014d4:	2e01      	cmp	r6, #1
 80014d6:	f8c0 c000 	str.w	ip, [r0]
 80014da:	d814      	bhi.n	8001506 <GPIO_Init+0x66>
 80014dc:	6886      	ldr	r6, [r0, #8]
 80014de:	f891 c005 	ldrb.w	ip, [r1, #5]
 80014e2:	4026      	ands	r6, r4
 80014e4:	6086      	str	r6, [r0, #8]
 80014e6:	6886      	ldr	r6, [r0, #8]
 80014e8:	fa0c fc02 	lsl.w	ip, ip, r2
 80014ec:	ea4c 0606 	orr.w	r6, ip, r6
 80014f0:	6086      	str	r6, [r0, #8]
 80014f2:	6846      	ldr	r6, [r0, #4]
 80014f4:	ea26 0505 	bic.w	r5, r6, r5
 80014f8:	6045      	str	r5, [r0, #4]
 80014fa:	798d      	ldrb	r5, [r1, #6]
 80014fc:	6846      	ldr	r6, [r0, #4]
 80014fe:	409d      	lsls	r5, r3
 8001500:	b2ad      	uxth	r5, r5
 8001502:	4335      	orrs	r5, r6
 8001504:	6045      	str	r5, [r0, #4]
 8001506:	68c5      	ldr	r5, [r0, #12]
 8001508:	402c      	ands	r4, r5
 800150a:	60c4      	str	r4, [r0, #12]
 800150c:	79cd      	ldrb	r5, [r1, #7]
 800150e:	68c4      	ldr	r4, [r0, #12]
 8001510:	fa05 f202 	lsl.w	r2, r5, r2
 8001514:	4322      	orrs	r2, r4
 8001516:	60c2      	str	r2, [r0, #12]
 8001518:	3301      	adds	r3, #1
 800151a:	2b10      	cmp	r3, #16
 800151c:	d1c4      	bne.n	80014a8 <GPIO_Init+0x8>
 800151e:	e8bd 81f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, pc}

08001522 <GPIO_ReadInputData>:
 8001522:	6900      	ldr	r0, [r0, #16]
 8001524:	b280      	uxth	r0, r0
 8001526:	4770      	bx	lr

08001528 <GPIO_SetBits>:
 8001528:	8301      	strh	r1, [r0, #24]
 800152a:	4770      	bx	lr

0800152c <GPIO_ResetBits>:
 800152c:	8341      	strh	r1, [r0, #26]
 800152e:	4770      	bx	lr

08001530 <GPIO_PinAFConfig>:
 8001530:	f001 0307 	and.w	r3, r1, #7
 8001534:	08c9      	lsrs	r1, r1, #3
 8001536:	eb00 0081 	add.w	r0, r0, r1, lsl #2
 800153a:	b510      	push	{r4, lr}
 800153c:	009b      	lsls	r3, r3, #2
 800153e:	6a04      	ldr	r4, [r0, #32]
 8001540:	210f      	movs	r1, #15
 8001542:	4099      	lsls	r1, r3
 8001544:	ea24 0101 	bic.w	r1, r4, r1
 8001548:	6201      	str	r1, [r0, #32]
 800154a:	6a01      	ldr	r1, [r0, #32]
 800154c:	409a      	lsls	r2, r3
 800154e:	4311      	orrs	r1, r2
 8001550:	6201      	str	r1, [r0, #32]
 8001552:	bd10      	pop	{r4, pc}

08001554 <NVIC_Init>:
 8001554:	78c2      	ldrb	r2, [r0, #3]
 8001556:	7803      	ldrb	r3, [r0, #0]
 8001558:	b510      	push	{r4, lr}
 800155a:	b30a      	cbz	r2, 80015a0 <NVIC_Init+0x4c>
 800155c:	4a16      	ldr	r2, [pc, #88]	; (80015b8 <NVIC_Init+0x64>)
 800155e:	7844      	ldrb	r4, [r0, #1]
 8001560:	68d2      	ldr	r2, [r2, #12]
 8001562:	43d2      	mvns	r2, r2
 8001564:	f3c2 2202 	ubfx	r2, r2, #8, #3
 8001568:	f1c2 0104 	rsb	r1, r2, #4
 800156c:	b2c9      	uxtb	r1, r1
 800156e:	fa04 f101 	lsl.w	r1, r4, r1
 8001572:	240f      	movs	r4, #15
 8001574:	fa44 f202 	asr.w	r2, r4, r2
 8001578:	7884      	ldrb	r4, [r0, #2]
 800157a:	b2c9      	uxtb	r1, r1
 800157c:	4022      	ands	r2, r4
 800157e:	430a      	orrs	r2, r1
 8001580:	f103 4360 	add.w	r3, r3, #3758096384	; 0xe0000000
 8001584:	f503 4361 	add.w	r3, r3, #57600	; 0xe100
 8001588:	0112      	lsls	r2, r2, #4
 800158a:	b2d2      	uxtb	r2, r2
 800158c:	f883 2300 	strb.w	r2, [r3, #768]	; 0x300
 8001590:	7803      	ldrb	r3, [r0, #0]
 8001592:	2201      	movs	r2, #1
 8001594:	0959      	lsrs	r1, r3, #5
 8001596:	f003 031f 	and.w	r3, r3, #31
 800159a:	fa02 f303 	lsl.w	r3, r2, r3
 800159e:	e006      	b.n	80015ae <NVIC_Init+0x5a>
 80015a0:	0959      	lsrs	r1, r3, #5
 80015a2:	2201      	movs	r2, #1
 80015a4:	f003 031f 	and.w	r3, r3, #31
 80015a8:	fa02 f303 	lsl.w	r3, r2, r3
 80015ac:	3120      	adds	r1, #32
 80015ae:	4a03      	ldr	r2, [pc, #12]	; (80015bc <NVIC_Init+0x68>)
 80015b0:	f842 3021 	str.w	r3, [r2, r1, lsl #2]
 80015b4:	bd10      	pop	{r4, pc}
 80015b6:	bf00      	nop
 80015b8:	e000ed00 	.word	0xe000ed00
 80015bc:	e000e100 	.word	0xe000e100

080015c0 <_init>:
 80015c0:	e1a0c00d 	mov	ip, sp
 80015c4:	e92ddff8 	push	{r3, r4, r5, r6, r7, r8, r9, sl, fp, ip, lr, pc}
 80015c8:	e24cb004 	sub	fp, ip, #4
 80015cc:	e24bd028 	sub	sp, fp, #40	; 0x28
 80015d0:	e89d6ff0 	ldm	sp, {r4, r5, r6, r7, r8, r9, sl, fp, sp, lr}
 80015d4:	e12fff1e 	bx	lr

080015d8 <_fini>:
 80015d8:	e1a0c00d 	mov	ip, sp
 80015dc:	e92ddff8 	push	{r3, r4, r5, r6, r7, r8, r9, sl, fp, ip, lr, pc}
 80015e0:	e24cb004 	sub	fp, ip, #4
 80015e4:	e24bd028 	sub	sp, fp, #40	; 0x28
 80015e8:	e89d6ff0 	ldm	sp, {r4, r5, r6, r7, r8, r9, sl, fp, sp, lr}
 80015ec:	e12fff1e 	bx	lr
 80015f0:	69647473 	.word	0x69647473
 80015f4:	6e69206f 	.word	0x6e69206f
 80015f8:	64207469 	.word	0x64207469
 80015fc:	0a656e6f 	.word	0x0a656e6f
 8001600:	00          	.byte	0x00
 8001601:	62          	.byte	0x62
 8001602:	6f6f      	.short	0x6f6f
 8001604:	676e6974 	.word	0x676e6974
 8001608:	6f726620 	.word	0x6f726620
 800160c:	7525206d 	.word	0x7525206d
 8001610:	6172000a 	.word	0x6172000a
 8001614:	7473206d 	.word	0x7473206d
 8001618:	20747261 	.word	0x20747261
 800161c:	0a207525 	.word	0x0a207525
 8001620:	6d617200 	.word	0x6d617200
 8001624:	7a697320 	.word	0x7a697320
 8001628:	75252065 	.word	0x75252065
 800162c:	72000a20 	.word	0x72000a20
 8001630:	66206d61 	.word	0x66206d61
 8001634:	20656572 	.word	0x20656572
 8001638:	0a207525 	.word	0x0a207525
 800163c:	61656800 	.word	0x61656800
 8001640:	74732070 	.word	0x74732070
 8001644:	20747261 	.word	0x20747261
 8001648:	0a207525 	.word	0x0a207525
 800164c:	000a0a00 	.word	0x000a0a00
 8001650:	746f6e61 	.word	0x746f6e61
 8001654:	20726568 	.word	0x20726568
 8001658:	6c696863 	.word	0x6c696863
 800165c:	68742064 	.word	0x68742064
 8001660:	64616572 	.word	0x64616572
 8001664:	6572202c 	.word	0x6572202c
 8001668:	75252073 	.word	0x75252073
 800166c:	6874000a 	.word	0x6874000a
 8001670:	64616572 	.word	0x64616572
 8001674:	000a3120 	.word	0x000a3120
 8001678:	61657263 	.word	0x61657263
 800167c:	676e6974 	.word	0x676e6974
 8001680:	69686320 	.word	0x69686320
 8001684:	7420646c 	.word	0x7420646c
 8001688:	61657268 	.word	0x61657268
 800168c:	74000a64 	.word	0x74000a64
 8001690:	61657268 	.word	0x61657268
 8001694:	72632064 	.word	0x72632064
 8001698:	69746165 	.word	0x69746165
 800169c:	6520676e 	.word	0x6520676e
 80016a0:	726f7272 	.word	0x726f7272
 80016a4:	6177000a 	.word	0x6177000a
 80016a8:	6e697469 	.word	0x6e697469
 80016ac:	6f662067 	.word	0x6f662067
 80016b0:	68742072 	.word	0x68742072
 80016b4:	64616572 	.word	0x64616572
 80016b8:	20752520 	.word	0x20752520
 80016bc:	656e6f64 	.word	0x656e6f64
 80016c0:	6570000a 	.word	0x6570000a
 80016c4:	646f6972 	.word	0x646f6972
 80016c8:	74206369 	.word	0x74206369
 80016cc:	61657268 	.word	0x61657268
 80016d0:	0a000a64 	.word	0x0a000a64
 80016d4:	636c6577 	.word	0x636c6577
 80016d8:	20656d6f 	.word	0x20656d6f
 80016dc:	53206f74 	.word	0x53206f74
 80016e0:	68757a75 	.word	0x68757a75
 80016e4:	20534f61 	.word	0x20534f61
 80016e8:	205e5f5e 	.word	0x205e5f5e
 80016ec:	2e322e32 	.word	0x2e322e32
 80016f0:	55420a30 	.word	0x55420a30
 80016f4:	20444c49 	.word	0x20444c49
 80016f8:	20706553 	.word	0x20706553
 80016fc:	32203031 	.word	0x32203031
 8001700:	20353130 	.word	0x20353130
 8001704:	343a3231 	.word	0x343a3231
 8001708:	33303a33 	.word	0x33303a33
 800170c:	616d000a 	.word	0x616d000a
 8001710:	74206e69 	.word	0x74206e69
 8001714:	61657268 	.word	0x61657268
 8001718:	64692064 	.word	0x64692064
 800171c:	202c656c 	.word	0x202c656c
 8001720:	69747075 	.word	0x69747075
 8001724:	2520656d 	.word	0x2520656d
 8001728:	00000a75 	.word	0x00000a75

0800172c <__EH_FRAME_BEGIN__>:
 800172c:	00000000                                ....
