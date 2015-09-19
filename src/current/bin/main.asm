
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
 80001a0:	20000074 	.word	0x20000074
 80001a4:	20000014 	.word	0x20000014

080001a8 <null_thread>:
 80001a8:	b508      	push	{r3, lr}
 80001aa:	f001 f9e1 	bl	8001570 <sleep>
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
 800020c:	20000014 	.word	0x20000014
 8000210:	20000074 	.word	0x20000074

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
 8000254:	20000074 	.word	0x20000074
 8000258:	20000014 	.word	0x20000014

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
 800027c:	20000074 	.word	0x20000074

08000280 <kernel_start>:
 8000280:	b508      	push	{r3, lr}
 8000282:	f001 f963 	bl	800154c <sys_tick_init>
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
 80002f8:	20000014 	.word	0x20000014
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
 8000334:	20000014 	.word	0x20000014
 8000338:	20000074 	.word	0x20000074
 800033c:	080001a9 	.word	0x080001a9
 8000340:	20000078 	.word	0x20000078

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
 8000384:	20000014 	.word	0x20000014

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
 80003a8:	20000014 	.word	0x20000014

080003ac <lib_os_init>:
 80003ac:	b508      	push	{r3, lr}
 80003ae:	f7ff ffa7 	bl	8000300 <kernel_init>
 80003b2:	f000 f807 	bl	80003c4 <stdlib_init_>
 80003b6:	f000 f90b 	bl	80005d0 <messages_init>
 80003ba:	e8bd 4008 	ldmia.w	sp!, {r3, lr}
 80003be:	f000 b8df 	b.w	8000580 <stdio_init>
	...

080003c4 <stdlib_init_>:
 80003c4:	b508      	push	{r3, lr}
 80003c6:	4804      	ldr	r0, [pc, #16]	; (80003d8 <stdlib_init_+0x14>)
 80003c8:	f000 f91c 	bl	8000604 <mutex_init>
 80003cc:	4b03      	ldr	r3, [pc, #12]	; (80003dc <stdlib_init_+0x18>)
 80003ce:	4a04      	ldr	r2, [pc, #16]	; (80003e0 <stdlib_init_+0x1c>)
 80003d0:	6013      	str	r3, [r2, #0]
 80003d2:	4a04      	ldr	r2, [pc, #16]	; (80003e4 <stdlib_init_+0x20>)
 80003d4:	6013      	str	r3, [r2, #0]
 80003d6:	bd08      	pop	{r3, pc}
 80003d8:	20000100 	.word	0x20000100
 80003dc:	200005d8 	.word	0x200005d8
 80003e0:	200000f8 	.word	0x200000f8
 80003e4:	200000fc 	.word	0x200000fc

080003e8 <putc_>:
 80003e8:	b538      	push	{r3, r4, r5, lr}
 80003ea:	4c06      	ldr	r4, [pc, #24]	; (8000404 <putc_+0x1c>)
 80003ec:	4605      	mov	r5, r0
 80003ee:	4620      	mov	r0, r4
 80003f0:	f000 f912 	bl	8000618 <mutex_lock>
 80003f4:	4628      	mov	r0, r5
 80003f6:	f000 fff5 	bl	80013e4 <uart_write>
 80003fa:	4620      	mov	r0, r4
 80003fc:	e8bd 4038 	ldmia.w	sp!, {r3, r4, r5, lr}
 8000400:	f000 b926 	b.w	8000650 <mutex_unlock>
 8000404:	20000104 	.word	0x20000104

08000408 <puts_>:
 8000408:	b510      	push	{r4, lr}
 800040a:	4604      	mov	r4, r0
 800040c:	4807      	ldr	r0, [pc, #28]	; (800042c <puts_+0x24>)
 800040e:	f000 f903 	bl	8000618 <mutex_lock>
 8000412:	3c01      	subs	r4, #1
 8000414:	f814 0f01 	ldrb.w	r0, [r4, #1]!
 8000418:	b110      	cbz	r0, 8000420 <puts_+0x18>
 800041a:	f7ff ffe5 	bl	80003e8 <putc_>
 800041e:	e7f9      	b.n	8000414 <puts_+0xc>
 8000420:	4802      	ldr	r0, [pc, #8]	; (800042c <puts_+0x24>)
 8000422:	e8bd 4010 	ldmia.w	sp!, {r4, lr}
 8000426:	f000 b913 	b.w	8000650 <mutex_unlock>
 800042a:	bf00      	nop
 800042c:	20000110 	.word	0x20000110

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
 80004e8:	f000 f896 	bl	8000618 <mutex_lock>
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
 800056c:	f000 f870 	bl	8000650 <mutex_unlock>
 8000570:	b003      	add	sp, #12
 8000572:	e8bd 4030 	ldmia.w	sp!, {r4, r5, lr}
 8000576:	b004      	add	sp, #16
 8000578:	4770      	bx	lr
 800057a:	bf00      	nop
 800057c:	2000010c 	.word	0x2000010c

08000580 <stdio_init>:
 8000580:	b510      	push	{r4, lr}
 8000582:	480e      	ldr	r0, [pc, #56]	; (80005bc <stdio_init+0x3c>)
 8000584:	f000 f83e 	bl	8000604 <mutex_init>
 8000588:	480d      	ldr	r0, [pc, #52]	; (80005c0 <stdio_init+0x40>)
 800058a:	f000 f83b 	bl	8000604 <mutex_init>
 800058e:	480d      	ldr	r0, [pc, #52]	; (80005c4 <stdio_init+0x44>)
 8000590:	f000 f838 	bl	8000604 <mutex_init>
 8000594:	480c      	ldr	r0, [pc, #48]	; (80005c8 <stdio_init+0x48>)
 8000596:	f000 f835 	bl	8000604 <mutex_init>
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
 80005bc:	20000104 	.word	0x20000104
 80005c0:	20000108 	.word	0x20000108
 80005c4:	20000110 	.word	0x20000110
 80005c8:	2000010c 	.word	0x2000010c
 80005cc:	08001a10 	.word	0x08001a10

080005d0 <messages_init>:
 80005d0:	b510      	push	{r4, lr}
 80005d2:	2200      	movs	r2, #0
 80005d4:	4909      	ldr	r1, [pc, #36]	; (80005fc <messages_init+0x2c>)
 80005d6:	2300      	movs	r3, #0
 80005d8:	f841 3022 	str.w	r3, [r1, r2, lsl #2]
 80005dc:	3201      	adds	r2, #1
 80005de:	2a08      	cmp	r2, #8
 80005e0:	d1f8      	bne.n	80005d4 <messages_init+0x4>
 80005e2:	4c07      	ldr	r4, [pc, #28]	; (8000600 <messages_init+0x30>)
 80005e4:	0118      	lsls	r0, r3, #4
 80005e6:	1821      	adds	r1, r4, r0
 80005e8:	3301      	adds	r3, #1
 80005ea:	2200      	movs	r2, #0
 80005ec:	2b04      	cmp	r3, #4
 80005ee:	604a      	str	r2, [r1, #4]
 80005f0:	5022      	str	r2, [r4, r0]
 80005f2:	60ca      	str	r2, [r1, #12]
 80005f4:	608a      	str	r2, [r1, #8]
 80005f6:	d1f4      	bne.n	80005e2 <messages_init+0x12>
 80005f8:	bd10      	pop	{r4, pc}
 80005fa:	bf00      	nop
 80005fc:	20000114 	.word	0x20000114
 8000600:	20000134 	.word	0x20000134

08000604 <mutex_init>:
 8000604:	b510      	push	{r4, lr}
 8000606:	4604      	mov	r4, r0
 8000608:	f7ff fe28 	bl	800025c <sched_off>
 800060c:	2300      	movs	r3, #0
 800060e:	6023      	str	r3, [r4, #0]
 8000610:	e8bd 4010 	ldmia.w	sp!, {r4, lr}
 8000614:	f7ff be24 	b.w	8000260 <sched_on>

08000618 <mutex_lock>:
 8000618:	b513      	push	{r0, r1, r4, lr}
 800061a:	4604      	mov	r4, r0
 800061c:	f7ff fe1e 	bl	800025c <sched_off>
 8000620:	6823      	ldr	r3, [r4, #0]
 8000622:	9301      	str	r3, [sp, #4]
 8000624:	f7ff fe1c 	bl	8000260 <sched_on>
 8000628:	9b01      	ldr	r3, [sp, #4]
 800062a:	b10b      	cbz	r3, 8000630 <mutex_lock+0x18>
 800062c:	f7ff fe8a 	bl	8000344 <set_wait_state>
 8000630:	9b01      	ldr	r3, [sp, #4]
 8000632:	2b00      	cmp	r3, #0
 8000634:	d1f2      	bne.n	800061c <mutex_lock+0x4>
 8000636:	f7ff fe11 	bl	800025c <sched_off>
 800063a:	6823      	ldr	r3, [r4, #0]
 800063c:	9301      	str	r3, [sp, #4]
 800063e:	9b01      	ldr	r3, [sp, #4]
 8000640:	2b00      	cmp	r3, #0
 8000642:	d1eb      	bne.n	800061c <mutex_lock+0x4>
 8000644:	2301      	movs	r3, #1
 8000646:	6023      	str	r3, [r4, #0]
 8000648:	f7ff fe0a 	bl	8000260 <sched_on>
 800064c:	b002      	add	sp, #8
 800064e:	bd10      	pop	{r4, pc}

08000650 <mutex_unlock>:
 8000650:	b508      	push	{r3, lr}
 8000652:	f7ff ffd7 	bl	8000604 <mutex_init>
 8000656:	f7ff fe97 	bl	8000388 <wake_up_threads>
 800065a:	e8bd 4008 	ldmia.w	sp!, {r3, lr}
 800065e:	f7ff be01 	b.w	8000264 <yield>
	...

08000664 <mem_info_print>:
 8000664:	b538      	push	{r3, r4, r5, lr}
 8000666:	4c0f      	ldr	r4, [pc, #60]	; (80006a4 <mem_info_print+0x40>)
 8000668:	4d0f      	ldr	r5, [pc, #60]	; (80006a8 <mem_info_print+0x44>)
 800066a:	4810      	ldr	r0, [pc, #64]	; (80006ac <mem_info_print+0x48>)
 800066c:	4910      	ldr	r1, [pc, #64]	; (80006b0 <mem_info_print+0x4c>)
 800066e:	f7ff ff35 	bl	80004dc <printf_>
 8000672:	1b2d      	subs	r5, r5, r4
 8000674:	4621      	mov	r1, r4
 8000676:	480f      	ldr	r0, [pc, #60]	; (80006b4 <mem_info_print+0x50>)
 8000678:	f7ff ff30 	bl	80004dc <printf_>
 800067c:	4629      	mov	r1, r5
 800067e:	480e      	ldr	r0, [pc, #56]	; (80006b8 <mem_info_print+0x54>)
 8000680:	f7ff ff2c 	bl	80004dc <printf_>
 8000684:	4b0d      	ldr	r3, [pc, #52]	; (80006bc <mem_info_print+0x58>)
 8000686:	480e      	ldr	r0, [pc, #56]	; (80006c0 <mem_info_print+0x5c>)
 8000688:	1ae1      	subs	r1, r4, r3
 800068a:	4429      	add	r1, r5
 800068c:	f7ff ff26 	bl	80004dc <printf_>
 8000690:	480c      	ldr	r0, [pc, #48]	; (80006c4 <mem_info_print+0x60>)
 8000692:	490d      	ldr	r1, [pc, #52]	; (80006c8 <mem_info_print+0x64>)
 8000694:	f7ff ff22 	bl	80004dc <printf_>
 8000698:	480c      	ldr	r0, [pc, #48]	; (80006cc <mem_info_print+0x68>)
 800069a:	e8bd 4038 	ldmia.w	sp!, {r3, r4, r5, lr}
 800069e:	f7ff bf1d 	b.w	80004dc <printf_>
 80006a2:	bf00      	nop
 80006a4:	20000000 	.word	0x20000000
 80006a8:	20020000 	.word	0x20020000
 80006ac:	08001a21 	.word	0x08001a21
 80006b0:	080019e0 	.word	0x080019e0
 80006b4:	08001a32 	.word	0x08001a32
 80006b8:	08001a41 	.word	0x08001a41
 80006bc:	200005d8 	.word	0x200005d8
 80006c0:	08001a4f 	.word	0x08001a4f
 80006c4:	08001a5d 	.word	0x08001a5d
 80006c8:	200005d8 	.word	0x200005d8
 80006cc:	08001a6d 	.word	0x08001a6d

080006d0 <main>:
 80006d0:	b508      	push	{r3, lr}
 80006d2:	f001 f87b 	bl	80017cc <lib_low_level_init>
 80006d6:	f7ff fe69 	bl	80003ac <lib_os_init>
 80006da:	f7ff ffc3 	bl	8000664 <mem_info_print>
 80006de:	4905      	ldr	r1, [pc, #20]	; (80006f4 <main+0x24>)
 80006e0:	4805      	ldr	r0, [pc, #20]	; (80006f8 <main+0x28>)
 80006e2:	f44f 7200 	mov.w	r2, #512	; 0x200
 80006e6:	2308      	movs	r3, #8
 80006e8:	f7ff fdd0 	bl	800028c <create_thread>
 80006ec:	f7ff fdc8 	bl	8000280 <kernel_start>
 80006f0:	2000      	movs	r0, #0
 80006f2:	bd08      	pop	{r3, pc}
 80006f4:	20000374 	.word	0x20000374
 80006f8:	08000d91 	.word	0x08000d91

080006fc <lsm9ds0_read>:
 80006fc:	b538      	push	{r3, r4, r5, lr}
 80006fe:	2128      	movs	r1, #40	; 0x28
 8000700:	20d4      	movs	r0, #212	; 0xd4
 8000702:	f000 fe56 	bl	80013b2 <i2c_read_reg>
 8000706:	2129      	movs	r1, #41	; 0x29
 8000708:	4605      	mov	r5, r0
 800070a:	20d4      	movs	r0, #212	; 0xd4
 800070c:	f000 fe51 	bl	80013b2 <i2c_read_reg>
 8000710:	4c38      	ldr	r4, [pc, #224]	; (80007f4 <lsm9ds0_read+0xf8>)
 8000712:	ea45 2000 	orr.w	r0, r5, r0, lsl #8
 8000716:	81a0      	strh	r0, [r4, #12]
 8000718:	212a      	movs	r1, #42	; 0x2a
 800071a:	20d4      	movs	r0, #212	; 0xd4
 800071c:	f000 fe49 	bl	80013b2 <i2c_read_reg>
 8000720:	212b      	movs	r1, #43	; 0x2b
 8000722:	4605      	mov	r5, r0
 8000724:	20d4      	movs	r0, #212	; 0xd4
 8000726:	f000 fe44 	bl	80013b2 <i2c_read_reg>
 800072a:	ea45 2000 	orr.w	r0, r5, r0, lsl #8
 800072e:	81e0      	strh	r0, [r4, #14]
 8000730:	212c      	movs	r1, #44	; 0x2c
 8000732:	20d4      	movs	r0, #212	; 0xd4
 8000734:	f000 fe3d 	bl	80013b2 <i2c_read_reg>
 8000738:	212d      	movs	r1, #45	; 0x2d
 800073a:	4605      	mov	r5, r0
 800073c:	20d4      	movs	r0, #212	; 0xd4
 800073e:	f000 fe38 	bl	80013b2 <i2c_read_reg>
 8000742:	ea45 2000 	orr.w	r0, r5, r0, lsl #8
 8000746:	8220      	strh	r0, [r4, #16]
 8000748:	2108      	movs	r1, #8
 800074a:	203c      	movs	r0, #60	; 0x3c
 800074c:	f000 fe31 	bl	80013b2 <i2c_read_reg>
 8000750:	2109      	movs	r1, #9
 8000752:	4605      	mov	r5, r0
 8000754:	203c      	movs	r0, #60	; 0x3c
 8000756:	f000 fe2c 	bl	80013b2 <i2c_read_reg>
 800075a:	ea45 2000 	orr.w	r0, r5, r0, lsl #8
 800075e:	80e0      	strh	r0, [r4, #6]
 8000760:	210a      	movs	r1, #10
 8000762:	203c      	movs	r0, #60	; 0x3c
 8000764:	f000 fe25 	bl	80013b2 <i2c_read_reg>
 8000768:	210b      	movs	r1, #11
 800076a:	4605      	mov	r5, r0
 800076c:	203c      	movs	r0, #60	; 0x3c
 800076e:	f000 fe20 	bl	80013b2 <i2c_read_reg>
 8000772:	ea45 2000 	orr.w	r0, r5, r0, lsl #8
 8000776:	8120      	strh	r0, [r4, #8]
 8000778:	210c      	movs	r1, #12
 800077a:	203c      	movs	r0, #60	; 0x3c
 800077c:	f000 fe19 	bl	80013b2 <i2c_read_reg>
 8000780:	210d      	movs	r1, #13
 8000782:	4605      	mov	r5, r0
 8000784:	203c      	movs	r0, #60	; 0x3c
 8000786:	f000 fe14 	bl	80013b2 <i2c_read_reg>
 800078a:	ea45 2000 	orr.w	r0, r5, r0, lsl #8
 800078e:	8160      	strh	r0, [r4, #10]
 8000790:	2128      	movs	r1, #40	; 0x28
 8000792:	203c      	movs	r0, #60	; 0x3c
 8000794:	f000 fe0d 	bl	80013b2 <i2c_read_reg>
 8000798:	2129      	movs	r1, #41	; 0x29
 800079a:	4605      	mov	r5, r0
 800079c:	203c      	movs	r0, #60	; 0x3c
 800079e:	f000 fe08 	bl	80013b2 <i2c_read_reg>
 80007a2:	ea45 2000 	orr.w	r0, r5, r0, lsl #8
 80007a6:	8020      	strh	r0, [r4, #0]
 80007a8:	212a      	movs	r1, #42	; 0x2a
 80007aa:	203c      	movs	r0, #60	; 0x3c
 80007ac:	f000 fe01 	bl	80013b2 <i2c_read_reg>
 80007b0:	212b      	movs	r1, #43	; 0x2b
 80007b2:	4605      	mov	r5, r0
 80007b4:	203c      	movs	r0, #60	; 0x3c
 80007b6:	f000 fdfc 	bl	80013b2 <i2c_read_reg>
 80007ba:	ea45 2000 	orr.w	r0, r5, r0, lsl #8
 80007be:	8060      	strh	r0, [r4, #2]
 80007c0:	212c      	movs	r1, #44	; 0x2c
 80007c2:	203c      	movs	r0, #60	; 0x3c
 80007c4:	f000 fdf5 	bl	80013b2 <i2c_read_reg>
 80007c8:	212d      	movs	r1, #45	; 0x2d
 80007ca:	4605      	mov	r5, r0
 80007cc:	203c      	movs	r0, #60	; 0x3c
 80007ce:	f000 fdf0 	bl	80013b2 <i2c_read_reg>
 80007d2:	ea45 2000 	orr.w	r0, r5, r0, lsl #8
 80007d6:	80a0      	strh	r0, [r4, #4]
 80007d8:	2105      	movs	r1, #5
 80007da:	203c      	movs	r0, #60	; 0x3c
 80007dc:	f000 fde9 	bl	80013b2 <i2c_read_reg>
 80007e0:	2106      	movs	r1, #6
 80007e2:	4605      	mov	r5, r0
 80007e4:	203c      	movs	r0, #60	; 0x3c
 80007e6:	f000 fde4 	bl	80013b2 <i2c_read_reg>
 80007ea:	ea45 2000 	orr.w	r0, r5, r0, lsl #8
 80007ee:	8320      	strh	r0, [r4, #24]
 80007f0:	bd38      	pop	{r3, r4, r5, pc}
 80007f2:	bf00      	nop
 80007f4:	20000574 	.word	0x20000574

080007f8 <lsm9ds0_init>:
 80007f8:	e92d 41f0 	stmdb	sp!, {r4, r5, r6, r7, r8, lr}
 80007fc:	4d34      	ldr	r5, [pc, #208]	; (80008d0 <lsm9ds0_init+0xd8>)
 80007fe:	2400      	movs	r4, #0
 8000800:	20d4      	movs	r0, #212	; 0xd4
 8000802:	210f      	movs	r1, #15
 8000804:	802c      	strh	r4, [r5, #0]
 8000806:	806c      	strh	r4, [r5, #2]
 8000808:	80ac      	strh	r4, [r5, #4]
 800080a:	80ec      	strh	r4, [r5, #6]
 800080c:	812c      	strh	r4, [r5, #8]
 800080e:	816c      	strh	r4, [r5, #10]
 8000810:	81ac      	strh	r4, [r5, #12]
 8000812:	81ec      	strh	r4, [r5, #14]
 8000814:	822c      	strh	r4, [r5, #16]
 8000816:	826c      	strh	r4, [r5, #18]
 8000818:	82ac      	strh	r4, [r5, #20]
 800081a:	82ec      	strh	r4, [r5, #22]
 800081c:	832c      	strh	r4, [r5, #24]
 800081e:	f000 fdc8 	bl	80013b2 <i2c_read_reg>
 8000822:	28d4      	cmp	r0, #212	; 0xd4
 8000824:	4606      	mov	r6, r0
 8000826:	d14e      	bne.n	80008c6 <lsm9ds0_init+0xce>
 8000828:	203c      	movs	r0, #60	; 0x3c
 800082a:	210f      	movs	r1, #15
 800082c:	f000 fdc1 	bl	80013b2 <i2c_read_reg>
 8000830:	2849      	cmp	r0, #73	; 0x49
 8000832:	bf18      	it	ne
 8000834:	2602      	movne	r6, #2
 8000836:	d147      	bne.n	80008c8 <lsm9ds0_init+0xd0>
 8000838:	4630      	mov	r0, r6
 800083a:	2120      	movs	r1, #32
 800083c:	22ff      	movs	r2, #255	; 0xff
 800083e:	f000 fda5 	bl	800138c <i2c_write_reg>
 8000842:	4630      	mov	r0, r6
 8000844:	2123      	movs	r1, #35	; 0x23
 8000846:	2218      	movs	r2, #24
 8000848:	f000 fda0 	bl	800138c <i2c_write_reg>
 800084c:	203c      	movs	r0, #60	; 0x3c
 800084e:	211f      	movs	r1, #31
 8000850:	4622      	mov	r2, r4
 8000852:	f000 fd9b 	bl	800138c <i2c_write_reg>
 8000856:	203c      	movs	r0, #60	; 0x3c
 8000858:	2120      	movs	r1, #32
 800085a:	2267      	movs	r2, #103	; 0x67
 800085c:	f000 fd96 	bl	800138c <i2c_write_reg>
 8000860:	203c      	movs	r0, #60	; 0x3c
 8000862:	2121      	movs	r1, #33	; 0x21
 8000864:	4622      	mov	r2, r4
 8000866:	f000 fd91 	bl	800138c <i2c_write_reg>
 800086a:	203c      	movs	r0, #60	; 0x3c
 800086c:	2124      	movs	r1, #36	; 0x24
 800086e:	22f4      	movs	r2, #244	; 0xf4
 8000870:	f000 fd8c 	bl	800138c <i2c_write_reg>
 8000874:	203c      	movs	r0, #60	; 0x3c
 8000876:	2125      	movs	r1, #37	; 0x25
 8000878:	4622      	mov	r2, r4
 800087a:	f000 fd87 	bl	800138c <i2c_write_reg>
 800087e:	203c      	movs	r0, #60	; 0x3c
 8000880:	2126      	movs	r1, #38	; 0x26
 8000882:	2280      	movs	r2, #128	; 0x80
 8000884:	f000 fd82 	bl	800138c <i2c_write_reg>
 8000888:	f7ff ff38 	bl	80006fc <lsm9ds0_read>
 800088c:	2664      	movs	r6, #100	; 0x64
 800088e:	4627      	mov	r7, r4
 8000890:	46a0      	mov	r8, r4
 8000892:	f7ff ff33 	bl	80006fc <lsm9ds0_read>
 8000896:	f9b5 200c 	ldrsh.w	r2, [r5, #12]
 800089a:	4b0d      	ldr	r3, [pc, #52]	; (80008d0 <lsm9ds0_init+0xd8>)
 800089c:	4490      	add	r8, r2
 800089e:	f9b5 200e 	ldrsh.w	r2, [r5, #14]
 80008a2:	4417      	add	r7, r2
 80008a4:	f9b5 2010 	ldrsh.w	r2, [r5, #16]
 80008a8:	3e01      	subs	r6, #1
 80008aa:	4414      	add	r4, r2
 80008ac:	d1f1      	bne.n	8000892 <lsm9ds0_init+0x9a>
 80008ae:	2264      	movs	r2, #100	; 0x64
 80008b0:	fb98 f8f2 	sdiv	r8, r8, r2
 80008b4:	fb97 f7f2 	sdiv	r7, r7, r2
 80008b8:	fb94 f4f2 	sdiv	r4, r4, r2
 80008bc:	f8a3 8012 	strh.w	r8, [r3, #18]
 80008c0:	829f      	strh	r7, [r3, #20]
 80008c2:	82dc      	strh	r4, [r3, #22]
 80008c4:	e000      	b.n	80008c8 <lsm9ds0_init+0xd0>
 80008c6:	2601      	movs	r6, #1
 80008c8:	4630      	mov	r0, r6
 80008ca:	e8bd 81f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, pc}
 80008ce:	bf00      	nop
 80008d0:	20000574 	.word	0x20000574

080008d4 <imu_init>:
 80008d4:	4b07      	ldr	r3, [pc, #28]	; (80008f4 <imu_init+0x20>)
 80008d6:	2200      	movs	r2, #0
 80008d8:	801a      	strh	r2, [r3, #0]
 80008da:	805a      	strh	r2, [r3, #2]
 80008dc:	809a      	strh	r2, [r3, #4]
 80008de:	609a      	str	r2, [r3, #8]
 80008e0:	60da      	str	r2, [r3, #12]
 80008e2:	611a      	str	r2, [r3, #16]
 80008e4:	615a      	str	r2, [r3, #20]
 80008e6:	619a      	str	r2, [r3, #24]
 80008e8:	61da      	str	r2, [r3, #28]
 80008ea:	621a      	str	r2, [r3, #32]
 80008ec:	625a      	str	r2, [r3, #36]	; 0x24
 80008ee:	629a      	str	r2, [r3, #40]	; 0x28
 80008f0:	4770      	bx	lr
 80008f2:	bf00      	nop
 80008f4:	20000590 	.word	0x20000590

080008f8 <motor_run>:
 80008f8:	f640 73ff 	movw	r3, #4095	; 0xfff
 80008fc:	4298      	cmp	r0, r3
 80008fe:	b510      	push	{r4, lr}
 8000900:	4604      	mov	r4, r0
 8000902:	dc04      	bgt.n	800090e <motor_run+0x16>
 8000904:	4a2a      	ldr	r2, [pc, #168]	; (80009b0 <motor_run+0xb8>)
 8000906:	4294      	cmp	r4, r2
 8000908:	bfb8      	it	lt
 800090a:	4614      	movlt	r4, r2
 800090c:	e000      	b.n	8000910 <motor_run+0x18>
 800090e:	461c      	mov	r4, r3
 8000910:	4299      	cmp	r1, r3
 8000912:	dc1a      	bgt.n	800094a <motor_run+0x52>
 8000914:	4b26      	ldr	r3, [pc, #152]	; (80009b0 <motor_run+0xb8>)
 8000916:	4299      	cmp	r1, r3
 8000918:	bfb8      	it	lt
 800091a:	4619      	movlt	r1, r3
 800091c:	db09      	blt.n	8000932 <motor_run+0x3a>
 800091e:	2900      	cmp	r1, #0
 8000920:	d106      	bne.n	8000930 <motor_run+0x38>
 8000922:	2002      	movs	r0, #2
 8000924:	f000 f88d 	bl	8000a42 <pca9685_send>
 8000928:	2009      	movs	r0, #9
 800092a:	f640 71ff 	movw	r1, #4095	; 0xfff
 800092e:	e006      	b.n	800093e <motor_run+0x46>
 8000930:	da0d      	bge.n	800094e <motor_run+0x56>
 8000932:	2008      	movs	r0, #8
 8000934:	4249      	negs	r1, r1
 8000936:	f000 f884 	bl	8000a42 <pca9685_send>
 800093a:	2009      	movs	r0, #9
 800093c:	2100      	movs	r1, #0
 800093e:	f000 f880 	bl	8000a42 <pca9685_send>
 8000942:	200a      	movs	r0, #10
 8000944:	f640 71ff 	movw	r1, #4095	; 0xfff
 8000948:	e00b      	b.n	8000962 <motor_run+0x6a>
 800094a:	f640 71ff 	movw	r1, #4095	; 0xfff
 800094e:	2008      	movs	r0, #8
 8000950:	f000 f877 	bl	8000a42 <pca9685_send>
 8000954:	2009      	movs	r0, #9
 8000956:	f640 71ff 	movw	r1, #4095	; 0xfff
 800095a:	f000 f872 	bl	8000a42 <pca9685_send>
 800095e:	200a      	movs	r0, #10
 8000960:	2100      	movs	r1, #0
 8000962:	f000 f86e 	bl	8000a42 <pca9685_send>
 8000966:	2c00      	cmp	r4, #0
 8000968:	f04f 000d 	mov.w	r0, #13
 800096c:	d106      	bne.n	800097c <motor_run+0x84>
 800096e:	4621      	mov	r1, r4
 8000970:	f000 f867 	bl	8000a42 <pca9685_send>
 8000974:	200b      	movs	r0, #11
 8000976:	f640 71ff 	movw	r1, #4095	; 0xfff
 800097a:	e010      	b.n	800099e <motor_run+0xa6>
 800097c:	da0a      	bge.n	8000994 <motor_run+0x9c>
 800097e:	4261      	negs	r1, r4
 8000980:	f000 f85f 	bl	8000a42 <pca9685_send>
 8000984:	200b      	movs	r0, #11
 8000986:	f640 71ff 	movw	r1, #4095	; 0xfff
 800098a:	f000 f85a 	bl	8000a42 <pca9685_send>
 800098e:	200c      	movs	r0, #12
 8000990:	2100      	movs	r1, #0
 8000992:	e009      	b.n	80009a8 <motor_run+0xb0>
 8000994:	4621      	mov	r1, r4
 8000996:	f000 f854 	bl	8000a42 <pca9685_send>
 800099a:	200b      	movs	r0, #11
 800099c:	2100      	movs	r1, #0
 800099e:	f000 f850 	bl	8000a42 <pca9685_send>
 80009a2:	200c      	movs	r0, #12
 80009a4:	f640 71ff 	movw	r1, #4095	; 0xfff
 80009a8:	e8bd 4010 	ldmia.w	sp!, {r4, lr}
 80009ac:	f000 b849 	b.w	8000a42 <pca9685_send>
 80009b0:	fffff001 	.word	0xfffff001

080009b4 <motor_init>:
 80009b4:	2000      	movs	r0, #0
 80009b6:	4601      	mov	r1, r0
 80009b8:	f7ff bf9e 	b.w	80008f8 <motor_run>

080009bc <pca9685_init>:
 80009bc:	b508      	push	{r3, lr}
 80009be:	f000 fc77 	bl	80012b0 <i2cStart>
 80009c2:	20c0      	movs	r0, #192	; 0xc0
 80009c4:	f000 fc92 	bl	80012ec <i2cWrite>
 80009c8:	2000      	movs	r0, #0
 80009ca:	f000 fc8f 	bl	80012ec <i2cWrite>
 80009ce:	2031      	movs	r0, #49	; 0x31
 80009d0:	f000 fc8c 	bl	80012ec <i2cWrite>
 80009d4:	f000 fc7b 	bl	80012ce <i2cStop>
 80009d8:	2002      	movs	r0, #2
 80009da:	f000 fbdf 	bl	800119c <timer_delay_ms>
 80009de:	f000 fc67 	bl	80012b0 <i2cStart>
 80009e2:	20c0      	movs	r0, #192	; 0xc0
 80009e4:	f000 fc82 	bl	80012ec <i2cWrite>
 80009e8:	20fe      	movs	r0, #254	; 0xfe
 80009ea:	f000 fc7f 	bl	80012ec <i2cWrite>
 80009ee:	2001      	movs	r0, #1
 80009f0:	f000 fc7c 	bl	80012ec <i2cWrite>
 80009f4:	f000 fc6b 	bl	80012ce <i2cStop>
 80009f8:	2002      	movs	r0, #2
 80009fa:	f000 fbcf 	bl	800119c <timer_delay_ms>
 80009fe:	f000 fc57 	bl	80012b0 <i2cStart>
 8000a02:	20c0      	movs	r0, #192	; 0xc0
 8000a04:	f000 fc72 	bl	80012ec <i2cWrite>
 8000a08:	2000      	movs	r0, #0
 8000a0a:	f000 fc6f 	bl	80012ec <i2cWrite>
 8000a0e:	20a1      	movs	r0, #161	; 0xa1
 8000a10:	f000 fc6c 	bl	80012ec <i2cWrite>
 8000a14:	f000 fc5b 	bl	80012ce <i2cStop>
 8000a18:	2002      	movs	r0, #2
 8000a1a:	f000 fbbf 	bl	800119c <timer_delay_ms>
 8000a1e:	f000 fc47 	bl	80012b0 <i2cStart>
 8000a22:	20c0      	movs	r0, #192	; 0xc0
 8000a24:	f000 fc62 	bl	80012ec <i2cWrite>
 8000a28:	2001      	movs	r0, #1
 8000a2a:	f000 fc5f 	bl	80012ec <i2cWrite>
 8000a2e:	2004      	movs	r0, #4
 8000a30:	f000 fc5c 	bl	80012ec <i2cWrite>
 8000a34:	f000 fc4b 	bl	80012ce <i2cStop>
 8000a38:	2002      	movs	r0, #2
 8000a3a:	e8bd 4008 	ldmia.w	sp!, {r3, lr}
 8000a3e:	f000 bbad 	b.w	800119c <timer_delay_ms>

08000a42 <pca9685_send>:
 8000a42:	b538      	push	{r3, r4, r5, lr}
 8000a44:	4605      	mov	r5, r0
 8000a46:	f640 74ff 	movw	r4, #4095	; 0xfff
 8000a4a:	42a1      	cmp	r1, r4
 8000a4c:	bf38      	it	cc
 8000a4e:	460c      	movcc	r4, r1
 8000a50:	00ad      	lsls	r5, r5, #2
 8000a52:	f000 fc2d 	bl	80012b0 <i2cStart>
 8000a56:	20c0      	movs	r0, #192	; 0xc0
 8000a58:	f000 fc48 	bl	80012ec <i2cWrite>
 8000a5c:	1da8      	adds	r0, r5, #6
 8000a5e:	f000 00fe 	and.w	r0, r0, #254	; 0xfe
 8000a62:	f000 fc43 	bl	80012ec <i2cWrite>
 8000a66:	2000      	movs	r0, #0
 8000a68:	f000 fc40 	bl	80012ec <i2cWrite>
 8000a6c:	2000      	movs	r0, #0
 8000a6e:	f000 fc3d 	bl	80012ec <i2cWrite>
 8000a72:	b2e0      	uxtb	r0, r4
 8000a74:	f000 fc3a 	bl	80012ec <i2cWrite>
 8000a78:	f3c4 2007 	ubfx	r0, r4, #8, #8
 8000a7c:	f000 fc36 	bl	80012ec <i2cWrite>
 8000a80:	e8bd 4038 	ldmia.w	sp!, {r3, r4, r5, lr}
 8000a84:	f000 bc23 	b.w	80012ce <i2cStop>

08000a88 <m_atan>:
 8000a88:	ee07 0a90 	vmov	s15, r0
 8000a8c:	eef5 7a40 	vcmp.f32	s15, #0.0
 8000a90:	eef1 fa10 	vmrs	APSR_nzcv, fpscr
 8000a94:	d04a      	beq.n	8000b2c <m_atan+0xa4>
 8000a96:	eef5 7ac0 	vcmpe.f32	s15, #0.0
 8000a9a:	eef1 fa10 	vmrs	APSR_nzcv, fpscr
 8000a9e:	ed9f 7a24 	vldr	s14, [pc, #144]	; 8000b30 <m_atan+0xa8>
 8000aa2:	bf48      	it	mi
 8000aa4:	eef1 7a67 	vnegmi.f32	s15, s15
 8000aa8:	ee77 6ac7 	vsub.f32	s13, s15, s14
 8000aac:	ee77 7a87 	vadd.f32	s15, s15, s14
 8000ab0:	eddf 5a20 	vldr	s11, [pc, #128]	; 8000b34 <m_atan+0xac>
 8000ab4:	eec6 6aa7 	vdiv.f32	s13, s13, s15
 8000ab8:	ed9f 6a1f 	vldr	s12, [pc, #124]	; 8000b38 <m_atan+0xb0>
 8000abc:	ee66 7aa6 	vmul.f32	s15, s13, s13
 8000ac0:	bf58      	it	pl
 8000ac2:	eeb0 5a47 	vmovpl.f32	s10, s14
 8000ac6:	ee17 6aa5 	vnmls.f32	s12, s15, s11
 8000aca:	eddf 5a1c 	vldr	s11, [pc, #112]	; 8000b3c <m_atan+0xb4>
 8000ace:	ee46 5a27 	vmla.f32	s11, s12, s15
 8000ad2:	ed9f 6a1b 	vldr	s12, [pc, #108]	; 8000b40 <m_atan+0xb8>
 8000ad6:	ee15 6aa7 	vnmls.f32	s12, s11, s15
 8000ada:	eddf 5a1a 	vldr	s11, [pc, #104]	; 8000b44 <m_atan+0xbc>
 8000ade:	ee46 5a27 	vmla.f32	s11, s12, s15
 8000ae2:	ed9f 6a19 	vldr	s12, [pc, #100]	; 8000b48 <m_atan+0xc0>
 8000ae6:	ee15 6aa7 	vnmls.f32	s12, s11, s15
 8000aea:	eddf 5a18 	vldr	s11, [pc, #96]	; 8000b4c <m_atan+0xc4>
 8000aee:	ee46 5a27 	vmla.f32	s11, s12, s15
 8000af2:	ed9f 6a17 	vldr	s12, [pc, #92]	; 8000b50 <m_atan+0xc8>
 8000af6:	ee15 6aa7 	vnmls.f32	s12, s11, s15
 8000afa:	bf48      	it	mi
 8000afc:	ed9f 5a15 	vldrmi	s10, [pc, #84]	; 8000b54 <m_atan+0xcc>
 8000b00:	ee06 7a27 	vmla.f32	s14, s12, s15
 8000b04:	eddf 7a14 	vldr	s15, [pc, #80]	; 8000b58 <m_atan+0xd0>
 8000b08:	ee67 6a26 	vmul.f32	s13, s14, s13
 8000b0c:	ed9f 7a13 	vldr	s14, [pc, #76]	; 8000b5c <m_atan+0xd4>
 8000b10:	ee05 7a26 	vmla.f32	s14, s10, s13
 8000b14:	eeb4 7a67 	vcmp.f32	s14, s15
 8000b18:	eddf 7a11 	vldr	s15, [pc, #68]	; 8000b60 <m_atan+0xd8>
 8000b1c:	eef1 fa10 	vmrs	APSR_nzcv, fpscr
 8000b20:	bf4c      	ite	mi
 8000b22:	ee17 0a90 	vmovmi	r0, s15
 8000b26:	ee17 0a10 	vmovpl	r0, s14
 8000b2a:	4770      	bx	lr
 8000b2c:	2000      	movs	r0, #0
 8000b2e:	4770      	bx	lr
 8000b30:	3f800000 	.word	0x3f800000
 8000b34:	3b3bd74a 	.word	0x3b3bd74a
 8000b38:	3c846e02 	.word	0x3c846e02
 8000b3c:	3d2fc1fe 	.word	0x3d2fc1fe
 8000b40:	3d9a3174 	.word	0x3d9a3174
 8000b44:	3dda3d83 	.word	0x3dda3d83
 8000b48:	3e117fc7 	.word	0x3e117fc7
 8000b4c:	3e4cbbe5 	.word	0x3e4cbbe5
 8000b50:	3eaaaa6c 	.word	0x3eaaaa6c
 8000b54:	bf800000 	.word	0xbf800000
 8000b58:	2edbe6ff 	.word	0x2edbe6ff
 8000b5c:	3f490fdb 	.word	0x3f490fdb
 8000b60:	00000000 	.word	0x00000000

08000b64 <m_atan2>:
 8000b64:	ee07 1a10 	vmov	s14, r1
 8000b68:	eeb5 7ac0 	vcmpe.f32	s14, #0.0
 8000b6c:	eef1 fa10 	vmrs	APSR_nzcv, fpscr
 8000b70:	ed9f 6a31 	vldr	s12, [pc, #196]	; 8000c38 <m_atan2+0xd4>
 8000b74:	bf4c      	ite	mi
 8000b76:	eef1 7a47 	vnegmi.f32	s15, s14
 8000b7a:	eef0 7a47 	vmovpl.f32	s15, s14
 8000b7e:	eef4 7ac6 	vcmpe.f32	s15, s12
 8000b82:	eef1 fa10 	vmrs	APSR_nzcv, fpscr
 8000b86:	b508      	push	{r3, lr}
 8000b88:	ee06 0a90 	vmov	s13, r0
 8000b8c:	d50b      	bpl.n	8000ba6 <m_atan2+0x42>
 8000b8e:	eef5 6ac0 	vcmpe.f32	s13, #0.0
 8000b92:	eddf 7a2a 	vldr	s15, [pc, #168]	; 8000c3c <m_atan2+0xd8>
 8000b96:	ed9f 7a2a 	vldr	s14, [pc, #168]	; 8000c40 <m_atan2+0xdc>
 8000b9a:	eef1 fa10 	vmrs	APSR_nzcv, fpscr
 8000b9e:	bfa8      	it	ge
 8000ba0:	eef0 7a47 	vmovge.f32	s15, s14
 8000ba4:	e044      	b.n	8000c30 <m_atan2+0xcc>
 8000ba6:	eec6 7a87 	vdiv.f32	s15, s13, s14
 8000baa:	eef5 7ac0 	vcmpe.f32	s15, #0.0
 8000bae:	eef1 fa10 	vmrs	APSR_nzcv, fpscr
 8000bb2:	eef5 6ac0 	vcmpe.f32	s13, #0.0
 8000bb6:	bf48      	it	mi
 8000bb8:	eef1 7a67 	vnegmi.f32	s15, s15
 8000bbc:	eef1 fa10 	vmrs	APSR_nzcv, fpscr
 8000bc0:	db0a      	blt.n	8000bd8 <m_atan2+0x74>
 8000bc2:	eeb5 7ac0 	vcmpe.f32	s14, #0.0
 8000bc6:	eef1 fa10 	vmrs	APSR_nzcv, fpscr
 8000bca:	db06      	blt.n	8000bda <m_atan2+0x76>
 8000bcc:	ee17 0a90 	vmov	r0, s15
 8000bd0:	e8bd 4008 	ldmia.w	sp!, {r3, lr}
 8000bd4:	f7ff bf58 	b.w	8000a88 <m_atan>
 8000bd8:	db0f      	blt.n	8000bfa <m_atan2+0x96>
 8000bda:	eeb5 7ac0 	vcmpe.f32	s14, #0.0
 8000bde:	eef1 fa10 	vmrs	APSR_nzcv, fpscr
 8000be2:	d80a      	bhi.n	8000bfa <m_atan2+0x96>
 8000be4:	ee17 0a90 	vmov	r0, s15
 8000be8:	f7ff ff4e 	bl	8000a88 <m_atan>
 8000bec:	eddf 7a14 	vldr	s15, [pc, #80]	; 8000c40 <m_atan2+0xdc>
 8000bf0:	ee07 0a10 	vmov	s14, r0
 8000bf4:	ee77 7ac7 	vsub.f32	s15, s15, s14
 8000bf8:	e01a      	b.n	8000c30 <m_atan2+0xcc>
 8000bfa:	eef5 6ac0 	vcmpe.f32	s13, #0.0
 8000bfe:	eef1 fa10 	vmrs	APSR_nzcv, fpscr
 8000c02:	ee17 0a90 	vmov	r0, s15
 8000c06:	d80d      	bhi.n	8000c24 <m_atan2+0xc0>
 8000c08:	eeb5 7ac0 	vcmpe.f32	s14, #0.0
 8000c0c:	eef1 fa10 	vmrs	APSR_nzcv, fpscr
 8000c10:	d808      	bhi.n	8000c24 <m_atan2+0xc0>
 8000c12:	f7ff ff39 	bl	8000a88 <m_atan>
 8000c16:	eddf 7a0a 	vldr	s15, [pc, #40]	; 8000c40 <m_atan2+0xdc>
 8000c1a:	ee07 0a10 	vmov	s14, r0
 8000c1e:	ee77 7a67 	vsub.f32	s15, s14, s15
 8000c22:	e005      	b.n	8000c30 <m_atan2+0xcc>
 8000c24:	f7ff ff30 	bl	8000a88 <m_atan>
 8000c28:	ee07 0a10 	vmov	s14, r0
 8000c2c:	eef1 7a47 	vneg.f32	s15, s14
 8000c30:	ee17 0a90 	vmov	r0, s15
 8000c34:	bd08      	pop	{r3, pc}
 8000c36:	bf00      	nop
 8000c38:	2edbe6ff 	.word	0x2edbe6ff
 8000c3c:	c0490fdb 	.word	0xc0490fdb
 8000c40:	40490fdb 	.word	0x40490fdb

08000c44 <robot_init>:
 8000c44:	b508      	push	{r3, lr}
 8000c46:	f7ff feb9 	bl	80009bc <pca9685_init>
 8000c4a:	f7ff feb3 	bl	80009b4 <motor_init>
 8000c4e:	f7ff fdd3 	bl	80007f8 <lsm9ds0_init>
 8000c52:	e8bd 4008 	ldmia.w	sp!, {r3, lr}
 8000c56:	f7ff be3d 	b.w	80008d4 <imu_init>
	...

08000c5c <robot_test_lsm9ds0>:
 8000c5c:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
 8000c5e:	ed2d 8b02 	vpush	{d8}
 8000c62:	f7ff fdc9 	bl	80007f8 <lsm9ds0_init>
 8000c66:	4605      	mov	r5, r0
 8000c68:	2040      	movs	r0, #64	; 0x40
 8000c6a:	f000 fdbf 	bl	80017ec <led_on>
 8000c6e:	f000 fa87 	bl	8001180 <timer_get_time>
 8000c72:	4606      	mov	r6, r0
 8000c74:	f7ff fd42 	bl	80006fc <lsm9ds0_read>
 8000c78:	f000 fa82 	bl	8001180 <timer_get_time>
 8000c7c:	4c3b      	ldr	r4, [pc, #236]	; (8000d6c <robot_test_lsm9ds0+0x110>)
 8000c7e:	4607      	mov	r7, r0
 8000c80:	2040      	movs	r0, #64	; 0x40
 8000c82:	f000 fdbb 	bl	80017fc <led_off>
 8000c86:	1bbb      	subs	r3, r7, r6
 8000c88:	4629      	mov	r1, r5
 8000c8a:	f9b4 2018 	ldrsh.w	r2, [r4, #24]
 8000c8e:	4838      	ldr	r0, [pc, #224]	; (8000d70 <robot_test_lsm9ds0+0x114>)
 8000c90:	f7ff fc24 	bl	80004dc <printf_>
 8000c94:	f9b4 1000 	ldrsh.w	r1, [r4]
 8000c98:	f9b4 2002 	ldrsh.w	r2, [r4, #2]
 8000c9c:	f9b4 3004 	ldrsh.w	r3, [r4, #4]
 8000ca0:	4834      	ldr	r0, [pc, #208]	; (8000d74 <robot_test_lsm9ds0+0x118>)
 8000ca2:	f7ff fc1b 	bl	80004dc <printf_>
 8000ca6:	f9b4 1006 	ldrsh.w	r1, [r4, #6]
 8000caa:	f9b4 2008 	ldrsh.w	r2, [r4, #8]
 8000cae:	f9b4 300a 	ldrsh.w	r3, [r4, #10]
 8000cb2:	4830      	ldr	r0, [pc, #192]	; (8000d74 <robot_test_lsm9ds0+0x118>)
 8000cb4:	f7ff fc12 	bl	80004dc <printf_>
 8000cb8:	f9b4 e00c 	ldrsh.w	lr, [r4, #12]
 8000cbc:	f9b4 1012 	ldrsh.w	r1, [r4, #18]
 8000cc0:	f9b4 700e 	ldrsh.w	r7, [r4, #14]
 8000cc4:	f9b4 2014 	ldrsh.w	r2, [r4, #20]
 8000cc8:	f9b4 6010 	ldrsh.w	r6, [r4, #16]
 8000ccc:	f9b4 3016 	ldrsh.w	r3, [r4, #22]
 8000cd0:	4828      	ldr	r0, [pc, #160]	; (8000d74 <robot_test_lsm9ds0+0x118>)
 8000cd2:	ebc1 010e 	rsb	r1, r1, lr
 8000cd6:	1af3      	subs	r3, r6, r3
 8000cd8:	1aba      	subs	r2, r7, r2
 8000cda:	f7ff fbff 	bl	80004dc <printf_>
 8000cde:	f9b4 0000 	ldrsh.w	r0, [r4]
 8000ce2:	f9b4 1004 	ldrsh.w	r1, [r4, #4]
 8000ce6:	ee06 0a90 	vmov	s13, r0
 8000cea:	ee07 1a90 	vmov	s15, r1
 8000cee:	eef8 6ae6 	vcvt.f32.s32	s13, s13
 8000cf2:	eef8 7ae7 	vcvt.f32.s32	s15, s15
 8000cf6:	ee16 0a90 	vmov	r0, s13
 8000cfa:	ee17 1a90 	vmov	r1, s15
 8000cfe:	f7ff ff31 	bl	8000b64 <m_atan2>
 8000d02:	f9b4 1006 	ldrsh.w	r1, [r4, #6]
 8000d06:	ee08 0a10 	vmov	s16, r0
 8000d0a:	f9b4 0008 	ldrsh.w	r0, [r4, #8]
 8000d0e:	ee07 1a90 	vmov	s15, r1
 8000d12:	ee06 0a90 	vmov	s13, r0
 8000d16:	eef8 7ae7 	vcvt.f32.s32	s15, s15
 8000d1a:	eef8 6ae6 	vcvt.f32.s32	s13, s13
 8000d1e:	ee17 1a90 	vmov	r1, s15
 8000d22:	ee16 0a90 	vmov	r0, s13
 8000d26:	f7ff ff1d 	bl	8000b64 <m_atan2>
 8000d2a:	ed9f 7a13 	vldr	s14, [pc, #76]	; 8000d78 <robot_test_lsm9ds0+0x11c>
 8000d2e:	ee06 0a90 	vmov	s13, r0
 8000d32:	ee28 8a07 	vmul.f32	s16, s16, s14
 8000d36:	eddf 7a11 	vldr	s15, [pc, #68]	; 8000d7c <robot_test_lsm9ds0+0x120>
 8000d3a:	ee26 7a87 	vmul.f32	s14, s13, s14
 8000d3e:	ee88 8a27 	vdiv.f32	s16, s16, s15
 8000d42:	480f      	ldr	r0, [pc, #60]	; (8000d80 <robot_test_lsm9ds0+0x124>)
 8000d44:	eec7 7a27 	vdiv.f32	s15, s14, s15
 8000d48:	eebd 8ac8 	vcvt.s32.f32	s16, s16
 8000d4c:	eefd 7ae7 	vcvt.s32.f32	s15, s15
 8000d50:	ee18 1a10 	vmov	r1, s16
 8000d54:	ee17 2a90 	vmov	r2, s15
 8000d58:	f7ff fbc0 	bl	80004dc <printf_>
 8000d5c:	4809      	ldr	r0, [pc, #36]	; (8000d84 <robot_test_lsm9ds0+0x128>)
 8000d5e:	f7ff fbbd 	bl	80004dc <printf_>
 8000d62:	2064      	movs	r0, #100	; 0x64
 8000d64:	f000 fa1a 	bl	800119c <timer_delay_ms>
 8000d68:	e77e      	b.n	8000c68 <robot_test_lsm9ds0+0xc>
 8000d6a:	bf00      	nop
 8000d6c:	20000574 	.word	0x20000574
 8000d70:	08001a70 	.word	0x08001a70
 8000d74:	08001a7b 	.word	0x08001a7b
 8000d78:	43340000 	.word	0x43340000
 8000d7c:	40490fdb 	.word	0x40490fdb
 8000d80:	08001a89 	.word	0x08001a89
 8000d84:	08001a6e 	.word	0x08001a6e

08000d88 <robot_main>:
 8000d88:	b508      	push	{r3, lr}
 8000d8a:	f7ff ff67 	bl	8000c5c <robot_test_lsm9ds0>
	...

08000d90 <main_thread>:
 8000d90:	b508      	push	{r3, lr}
 8000d92:	4804      	ldr	r0, [pc, #16]	; (8000da4 <main_thread+0x14>)
 8000d94:	f7ff fba2 	bl	80004dc <printf_>
 8000d98:	f7ff ff54 	bl	8000c44 <robot_init>
 8000d9c:	e8bd 4008 	ldmia.w	sp!, {r3, lr}
 8000da0:	f7ff bff2 	b.w	8000d88 <robot_main>
 8000da4:	08001b1a 	.word	0x08001b1a

08000da8 <pwm_set>:
 8000da8:	e92d 41f0 	stmdb	sp!, {r4, r5, r6, r7, r8, lr}
 8000dac:	b086      	sub	sp, #24
 8000dae:	2370      	movs	r3, #112	; 0x70
 8000db0:	f8ad 3004 	strh.w	r3, [sp, #4]
 8000db4:	2301      	movs	r3, #1
 8000db6:	f8ad 3006 	strh.w	r3, [sp, #6]
 8000dba:	2304      	movs	r3, #4
 8000dbc:	f8ad 3008 	strh.w	r3, [sp, #8]
 8000dc0:	4f16      	ldr	r7, [pc, #88]	; (8000e1c <pwm_set+0x74>)
 8000dc2:	4c17      	ldr	r4, [pc, #92]	; (8000e20 <pwm_set+0x78>)
 8000dc4:	2302      	movs	r3, #2
 8000dc6:	f8ad 3010 	strh.w	r3, [sp, #16]
 8000dca:	2300      	movs	r3, #0
 8000dcc:	f8ad 3012 	strh.w	r3, [sp, #18]
 8000dd0:	f8ad 3016 	strh.w	r3, [sp, #22]
 8000dd4:	683b      	ldr	r3, [r7, #0]
 8000dd6:	f242 7610 	movw	r6, #10000	; 0x2710
 8000dda:	fbb3 f3f6 	udiv	r3, r3, r6
 8000dde:	3b02      	subs	r3, #2
 8000de0:	4358      	muls	r0, r3
 8000de2:	2564      	movs	r5, #100	; 0x64
 8000de4:	fbb0 f3f5 	udiv	r3, r0, r5
 8000de8:	f44f 7280 	mov.w	r2, #256	; 0x100
 8000dec:	4620      	mov	r0, r4
 8000dee:	4688      	mov	r8, r1
 8000df0:	a901      	add	r1, sp, #4
 8000df2:	f8ad 2014 	strh.w	r2, [sp, #20]
 8000df6:	9303      	str	r3, [sp, #12]
 8000df8:	f000 f8be 	bl	8000f78 <TIM_OC1Init>
 8000dfc:	683b      	ldr	r3, [r7, #0]
 8000dfe:	fbb3 f6f6 	udiv	r6, r3, r6
 8000e02:	3e02      	subs	r6, #2
 8000e04:	fb06 f808 	mul.w	r8, r6, r8
 8000e08:	fbb8 f5f5 	udiv	r5, r8, r5
 8000e0c:	4620      	mov	r0, r4
 8000e0e:	a901      	add	r1, sp, #4
 8000e10:	9503      	str	r5, [sp, #12]
 8000e12:	f000 f8e9 	bl	8000fe8 <TIM_OC2Init>
 8000e16:	b006      	add	sp, #24
 8000e18:	e8bd 81f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, pc}
 8000e1c:	20000000 	.word	0x20000000
 8000e20:	40000c00 	.word	0x40000c00

08000e24 <pwm_init>:
 8000e24:	b570      	push	{r4, r5, r6, lr}
 8000e26:	2008      	movs	r0, #8
 8000e28:	b086      	sub	sp, #24
 8000e2a:	2101      	movs	r1, #1
 8000e2c:	f000 fcb6 	bl	800179c <RCC_APB1PeriphClockCmd>
 8000e30:	4d29      	ldr	r5, [pc, #164]	; (8000ed8 <pwm_init+0xb4>)
 8000e32:	2001      	movs	r0, #1
 8000e34:	4601      	mov	r1, r0
 8000e36:	f000 fca5 	bl	8001784 <RCC_AHB1PeriphClockCmd>
 8000e3a:	2402      	movs	r4, #2
 8000e3c:	2603      	movs	r6, #3
 8000e3e:	4628      	mov	r0, r5
 8000e40:	a901      	add	r1, sp, #4
 8000e42:	f88d 4008 	strb.w	r4, [sp, #8]
 8000e46:	f88d 4009 	strb.w	r4, [sp, #9]
 8000e4a:	9601      	str	r6, [sp, #4]
 8000e4c:	f000 fd3a 	bl	80018c4 <GPIO_Init>
 8000e50:	4628      	mov	r0, r5
 8000e52:	4622      	mov	r2, r4
 8000e54:	2100      	movs	r1, #0
 8000e56:	f000 fd7a 	bl	800194e <GPIO_PinAFConfig>
 8000e5a:	4628      	mov	r0, r5
 8000e5c:	4622      	mov	r2, r4
 8000e5e:	2101      	movs	r1, #1
 8000e60:	f000 fd75 	bl	800194e <GPIO_PinAFConfig>
 8000e64:	4b1d      	ldr	r3, [pc, #116]	; (8000edc <pwm_init+0xb8>)
 8000e66:	681a      	ldr	r2, [r3, #0]
 8000e68:	f242 7310 	movw	r3, #10000	; 0x2710
 8000e6c:	fbb2 f3f3 	udiv	r3, r2, r3
 8000e70:	f5a5 35fa 	sub.w	r5, r5, #128000	; 0x1f400
 8000e74:	2400      	movs	r4, #0
 8000e76:	3b01      	subs	r3, #1
 8000e78:	4628      	mov	r0, r5
 8000e7a:	a903      	add	r1, sp, #12
 8000e7c:	9304      	str	r3, [sp, #16]
 8000e7e:	f8ad 400c 	strh.w	r4, [sp, #12]
 8000e82:	f8ad 400e 	strh.w	r4, [sp, #14]
 8000e86:	f8ad 4014 	strh.w	r4, [sp, #20]
 8000e8a:	f88d 4016 	strb.w	r4, [sp, #22]
 8000e8e:	f000 f829 	bl	8000ee4 <TIM_TimeBaseInit>
 8000e92:	2032      	movs	r0, #50	; 0x32
 8000e94:	211e      	movs	r1, #30
 8000e96:	f7ff ff87 	bl	8000da8 <pwm_set>
 8000e9a:	4628      	mov	r0, r5
 8000e9c:	2101      	movs	r1, #1
 8000e9e:	f000 f85f 	bl	8000f60 <TIM_Cmd>
 8000ea2:	4628      	mov	r0, r5
 8000ea4:	2101      	movs	r1, #1
 8000ea6:	f000 f8e3 	bl	8001070 <TIM_CtrlPWMOutputs>
 8000eaa:	f88d 400a 	strb.w	r4, [sp, #10]
 8000eae:	f88d 400b 	strb.w	r4, [sp, #11]
 8000eb2:	4c0b      	ldr	r4, [pc, #44]	; (8000ee0 <pwm_init+0xbc>)
 8000eb4:	f88d 6009 	strb.w	r6, [sp, #9]
 8000eb8:	2301      	movs	r3, #1
 8000eba:	250c      	movs	r5, #12
 8000ebc:	4620      	mov	r0, r4
 8000ebe:	a901      	add	r1, sp, #4
 8000ec0:	f88d 3008 	strb.w	r3, [sp, #8]
 8000ec4:	9501      	str	r5, [sp, #4]
 8000ec6:	f000 fcfd 	bl	80018c4 <GPIO_Init>
 8000eca:	4620      	mov	r0, r4
 8000ecc:	4629      	mov	r1, r5
 8000ece:	f000 fd3a 	bl	8001946 <GPIO_SetBits>
 8000ed2:	b006      	add	sp, #24
 8000ed4:	bd70      	pop	{r4, r5, r6, pc}
 8000ed6:	bf00      	nop
 8000ed8:	40020000 	.word	0x40020000
 8000edc:	20000000 	.word	0x20000000
 8000ee0:	40020800 	.word	0x40020800

08000ee4 <TIM_TimeBaseInit>:
 8000ee4:	4a1c      	ldr	r2, [pc, #112]	; (8000f58 <TIM_TimeBaseInit+0x74>)
 8000ee6:	8803      	ldrh	r3, [r0, #0]
 8000ee8:	4290      	cmp	r0, r2
 8000eea:	b29b      	uxth	r3, r3
 8000eec:	d012      	beq.n	8000f14 <TIM_TimeBaseInit+0x30>
 8000eee:	f502 6280 	add.w	r2, r2, #1024	; 0x400
 8000ef2:	4290      	cmp	r0, r2
 8000ef4:	d00e      	beq.n	8000f14 <TIM_TimeBaseInit+0x30>
 8000ef6:	f1b0 4f80 	cmp.w	r0, #1073741824	; 0x40000000
 8000efa:	d00b      	beq.n	8000f14 <TIM_TimeBaseInit+0x30>
 8000efc:	f5a2 3280 	sub.w	r2, r2, #65536	; 0x10000
 8000f00:	4290      	cmp	r0, r2
 8000f02:	d007      	beq.n	8000f14 <TIM_TimeBaseInit+0x30>
 8000f04:	f502 6280 	add.w	r2, r2, #1024	; 0x400
 8000f08:	4290      	cmp	r0, r2
 8000f0a:	d003      	beq.n	8000f14 <TIM_TimeBaseInit+0x30>
 8000f0c:	f502 6280 	add.w	r2, r2, #1024	; 0x400
 8000f10:	4290      	cmp	r0, r2
 8000f12:	d103      	bne.n	8000f1c <TIM_TimeBaseInit+0x38>
 8000f14:	884a      	ldrh	r2, [r1, #2]
 8000f16:	f023 0370 	bic.w	r3, r3, #112	; 0x70
 8000f1a:	4313      	orrs	r3, r2
 8000f1c:	4a0f      	ldr	r2, [pc, #60]	; (8000f5c <TIM_TimeBaseInit+0x78>)
 8000f1e:	4290      	cmp	r0, r2
 8000f20:	d008      	beq.n	8000f34 <TIM_TimeBaseInit+0x50>
 8000f22:	f502 6280 	add.w	r2, r2, #1024	; 0x400
 8000f26:	4290      	cmp	r0, r2
 8000f28:	d004      	beq.n	8000f34 <TIM_TimeBaseInit+0x50>
 8000f2a:	f423 7340 	bic.w	r3, r3, #768	; 0x300
 8000f2e:	890a      	ldrh	r2, [r1, #8]
 8000f30:	b29b      	uxth	r3, r3
 8000f32:	4313      	orrs	r3, r2
 8000f34:	8003      	strh	r3, [r0, #0]
 8000f36:	684b      	ldr	r3, [r1, #4]
 8000f38:	62c3      	str	r3, [r0, #44]	; 0x2c
 8000f3a:	880b      	ldrh	r3, [r1, #0]
 8000f3c:	8503      	strh	r3, [r0, #40]	; 0x28
 8000f3e:	4b06      	ldr	r3, [pc, #24]	; (8000f58 <TIM_TimeBaseInit+0x74>)
 8000f40:	4298      	cmp	r0, r3
 8000f42:	d003      	beq.n	8000f4c <TIM_TimeBaseInit+0x68>
 8000f44:	f503 6380 	add.w	r3, r3, #1024	; 0x400
 8000f48:	4298      	cmp	r0, r3
 8000f4a:	d101      	bne.n	8000f50 <TIM_TimeBaseInit+0x6c>
 8000f4c:	7a8b      	ldrb	r3, [r1, #10]
 8000f4e:	8603      	strh	r3, [r0, #48]	; 0x30
 8000f50:	2301      	movs	r3, #1
 8000f52:	8283      	strh	r3, [r0, #20]
 8000f54:	4770      	bx	lr
 8000f56:	bf00      	nop
 8000f58:	40010000 	.word	0x40010000
 8000f5c:	40001000 	.word	0x40001000

08000f60 <TIM_Cmd>:
 8000f60:	8803      	ldrh	r3, [r0, #0]
 8000f62:	b119      	cbz	r1, 8000f6c <TIM_Cmd+0xc>
 8000f64:	b29b      	uxth	r3, r3
 8000f66:	f043 0301 	orr.w	r3, r3, #1
 8000f6a:	e003      	b.n	8000f74 <TIM_Cmd+0x14>
 8000f6c:	f023 0301 	bic.w	r3, r3, #1
 8000f70:	041b      	lsls	r3, r3, #16
 8000f72:	0c1b      	lsrs	r3, r3, #16
 8000f74:	8003      	strh	r3, [r0, #0]
 8000f76:	4770      	bx	lr

08000f78 <TIM_OC1Init>:
 8000f78:	8c03      	ldrh	r3, [r0, #32]
 8000f7a:	f023 0301 	bic.w	r3, r3, #1
 8000f7e:	041b      	lsls	r3, r3, #16
 8000f80:	0c1b      	lsrs	r3, r3, #16
 8000f82:	8403      	strh	r3, [r0, #32]
 8000f84:	b570      	push	{r4, r5, r6, lr}
 8000f86:	8c03      	ldrh	r3, [r0, #32]
 8000f88:	8884      	ldrh	r4, [r0, #4]
 8000f8a:	8b02      	ldrh	r2, [r0, #24]
 8000f8c:	880d      	ldrh	r5, [r1, #0]
 8000f8e:	884e      	ldrh	r6, [r1, #2]
 8000f90:	f022 0273 	bic.w	r2, r2, #115	; 0x73
 8000f94:	0412      	lsls	r2, r2, #16
 8000f96:	0c12      	lsrs	r2, r2, #16
 8000f98:	432a      	orrs	r2, r5
 8000f9a:	898d      	ldrh	r5, [r1, #12]
 8000f9c:	f023 0302 	bic.w	r3, r3, #2
 8000fa0:	041b      	lsls	r3, r3, #16
 8000fa2:	4335      	orrs	r5, r6
 8000fa4:	b2ad      	uxth	r5, r5
 8000fa6:	0c1b      	lsrs	r3, r3, #16
 8000fa8:	432b      	orrs	r3, r5
 8000faa:	4d0e      	ldr	r5, [pc, #56]	; (8000fe4 <TIM_OC1Init+0x6c>)
 8000fac:	42a8      	cmp	r0, r5
 8000fae:	b2a4      	uxth	r4, r4
 8000fb0:	d003      	beq.n	8000fba <TIM_OC1Init+0x42>
 8000fb2:	f505 6580 	add.w	r5, r5, #1024	; 0x400
 8000fb6:	42a8      	cmp	r0, r5
 8000fb8:	d10e      	bne.n	8000fd8 <TIM_OC1Init+0x60>
 8000fba:	89cd      	ldrh	r5, [r1, #14]
 8000fbc:	8a4e      	ldrh	r6, [r1, #18]
 8000fbe:	f023 0308 	bic.w	r3, r3, #8
 8000fc2:	432b      	orrs	r3, r5
 8000fc4:	888d      	ldrh	r5, [r1, #4]
 8000fc6:	f023 0304 	bic.w	r3, r3, #4
 8000fca:	432b      	orrs	r3, r5
 8000fcc:	8a0d      	ldrh	r5, [r1, #16]
 8000fce:	4335      	orrs	r5, r6
 8000fd0:	f424 7440 	bic.w	r4, r4, #768	; 0x300
 8000fd4:	b2ad      	uxth	r5, r5
 8000fd6:	432c      	orrs	r4, r5
 8000fd8:	8084      	strh	r4, [r0, #4]
 8000fda:	8302      	strh	r2, [r0, #24]
 8000fdc:	688a      	ldr	r2, [r1, #8]
 8000fde:	6342      	str	r2, [r0, #52]	; 0x34
 8000fe0:	8403      	strh	r3, [r0, #32]
 8000fe2:	bd70      	pop	{r4, r5, r6, pc}
 8000fe4:	40010000 	.word	0x40010000

08000fe8 <TIM_OC2Init>:
 8000fe8:	8c03      	ldrh	r3, [r0, #32]
 8000fea:	f023 0310 	bic.w	r3, r3, #16
 8000fee:	041b      	lsls	r3, r3, #16
 8000ff0:	0c1b      	lsrs	r3, r3, #16
 8000ff2:	8403      	strh	r3, [r0, #32]
 8000ff4:	8c03      	ldrh	r3, [r0, #32]
 8000ff6:	8882      	ldrh	r2, [r0, #4]
 8000ff8:	b530      	push	{r4, r5, lr}
 8000ffa:	8b04      	ldrh	r4, [r0, #24]
 8000ffc:	880d      	ldrh	r5, [r1, #0]
 8000ffe:	f424 44e6 	bic.w	r4, r4, #29440	; 0x7300
 8001002:	0424      	lsls	r4, r4, #16
 8001004:	0c24      	lsrs	r4, r4, #16
 8001006:	f023 0320 	bic.w	r3, r3, #32
 800100a:	ea44 2405 	orr.w	r4, r4, r5, lsl #8
 800100e:	041b      	lsls	r3, r3, #16
 8001010:	898d      	ldrh	r5, [r1, #12]
 8001012:	0c1b      	lsrs	r3, r3, #16
 8001014:	ea43 1305 	orr.w	r3, r3, r5, lsl #4
 8001018:	884d      	ldrh	r5, [r1, #2]
 800101a:	ea43 1305 	orr.w	r3, r3, r5, lsl #4
 800101e:	4d13      	ldr	r5, [pc, #76]	; (800106c <TIM_OC2Init+0x84>)
 8001020:	42a8      	cmp	r0, r5
 8001022:	b292      	uxth	r2, r2
 8001024:	b2a4      	uxth	r4, r4
 8001026:	b29b      	uxth	r3, r3
 8001028:	d003      	beq.n	8001032 <TIM_OC2Init+0x4a>
 800102a:	f505 6580 	add.w	r5, r5, #1024	; 0x400
 800102e:	42a8      	cmp	r0, r5
 8001030:	d115      	bne.n	800105e <TIM_OC2Init+0x76>
 8001032:	89cd      	ldrh	r5, [r1, #14]
 8001034:	f023 0380 	bic.w	r3, r3, #128	; 0x80
 8001038:	b29b      	uxth	r3, r3
 800103a:	ea43 1305 	orr.w	r3, r3, r5, lsl #4
 800103e:	f64f 75bf 	movw	r5, #65471	; 0xffbf
 8001042:	401d      	ands	r5, r3
 8001044:	888b      	ldrh	r3, [r1, #4]
 8001046:	ea45 1303 	orr.w	r3, r5, r3, lsl #4
 800104a:	8a0d      	ldrh	r5, [r1, #16]
 800104c:	f422 6240 	bic.w	r2, r2, #3072	; 0xc00
 8001050:	ea42 0285 	orr.w	r2, r2, r5, lsl #2
 8001054:	8a4d      	ldrh	r5, [r1, #18]
 8001056:	ea42 0285 	orr.w	r2, r2, r5, lsl #2
 800105a:	b29b      	uxth	r3, r3
 800105c:	b292      	uxth	r2, r2
 800105e:	8082      	strh	r2, [r0, #4]
 8001060:	688a      	ldr	r2, [r1, #8]
 8001062:	8304      	strh	r4, [r0, #24]
 8001064:	6382      	str	r2, [r0, #56]	; 0x38
 8001066:	8403      	strh	r3, [r0, #32]
 8001068:	bd30      	pop	{r4, r5, pc}
 800106a:	bf00      	nop
 800106c:	40010000 	.word	0x40010000

08001070 <TIM_CtrlPWMOutputs>:
 8001070:	f8b0 3044 	ldrh.w	r3, [r0, #68]	; 0x44
 8001074:	b129      	cbz	r1, 8001082 <TIM_CtrlPWMOutputs+0x12>
 8001076:	ea6f 4343 	mvn.w	r3, r3, lsl #17
 800107a:	ea6f 4353 	mvn.w	r3, r3, lsr #17
 800107e:	b29b      	uxth	r3, r3
 8001080:	e001      	b.n	8001086 <TIM_CtrlPWMOutputs+0x16>
 8001082:	f3c3 030e 	ubfx	r3, r3, #0, #15
 8001086:	f8a0 3044 	strh.w	r3, [r0, #68]	; 0x44
 800108a:	4770      	bx	lr

0800108c <TIM_ClearITPendingBit>:
 800108c:	43c9      	mvns	r1, r1
 800108e:	b289      	uxth	r1, r1
 8001090:	8201      	strh	r1, [r0, #16]
 8001092:	4770      	bx	lr

08001094 <timer_init>:
 8001094:	b530      	push	{r4, r5, lr}
 8001096:	2000      	movs	r0, #0
 8001098:	b085      	sub	sp, #20
 800109a:	4a1e      	ldr	r2, [pc, #120]	; (8001114 <timer_init+0x80>)
 800109c:	f44f 6380 	mov.w	r3, #1024	; 0x400
 80010a0:	f822 3010 	strh.w	r3, [r2, r0, lsl #1]
 80010a4:	4a1c      	ldr	r2, [pc, #112]	; (8001118 <timer_init+0x84>)
 80010a6:	f822 3010 	strh.w	r3, [r2, r0, lsl #1]
 80010aa:	4b1c      	ldr	r3, [pc, #112]	; (800111c <timer_init+0x88>)
 80010ac:	2400      	movs	r4, #0
 80010ae:	f823 4010 	strh.w	r4, [r3, r0, lsl #1]
 80010b2:	3001      	adds	r0, #1
 80010b4:	2804      	cmp	r0, #4
 80010b6:	4625      	mov	r5, r4
 80010b8:	d1ef      	bne.n	800109a <timer_init+0x6>
 80010ba:	4b19      	ldr	r3, [pc, #100]	; (8001120 <timer_init+0x8c>)
 80010bc:	2101      	movs	r1, #1
 80010be:	601c      	str	r4, [r3, #0]
 80010c0:	f000 fb6c 	bl	800179c <RCC_APB1PeriphClockCmd>
 80010c4:	f8ad 4006 	strh.w	r4, [sp, #6]
 80010c8:	f8ad 400c 	strh.w	r4, [sp, #12]
 80010cc:	f88d 400e 	strb.w	r4, [sp, #14]
 80010d0:	4c14      	ldr	r4, [pc, #80]	; (8001124 <timer_init+0x90>)
 80010d2:	2353      	movs	r3, #83	; 0x53
 80010d4:	f8ad 3004 	strh.w	r3, [sp, #4]
 80010d8:	4620      	mov	r0, r4
 80010da:	2331      	movs	r3, #49	; 0x31
 80010dc:	a901      	add	r1, sp, #4
 80010de:	9302      	str	r3, [sp, #8]
 80010e0:	f7ff ff00 	bl	8000ee4 <TIM_TimeBaseInit>
 80010e4:	4620      	mov	r0, r4
 80010e6:	2101      	movs	r1, #1
 80010e8:	f7ff ff3a 	bl	8000f60 <TIM_Cmd>
 80010ec:	89a3      	ldrh	r3, [r4, #12]
 80010ee:	b29b      	uxth	r3, r3
 80010f0:	f043 0301 	orr.w	r3, r3, #1
 80010f4:	81a3      	strh	r3, [r4, #12]
 80010f6:	231e      	movs	r3, #30
 80010f8:	f88d 3000 	strb.w	r3, [sp]
 80010fc:	4668      	mov	r0, sp
 80010fe:	2301      	movs	r3, #1
 8001100:	f88d 5001 	strb.w	r5, [sp, #1]
 8001104:	f88d 3002 	strb.w	r3, [sp, #2]
 8001108:	f88d 3003 	strb.w	r3, [sp, #3]
 800110c:	f000 fc32 	bl	8001974 <NVIC_Init>
 8001110:	b005      	add	sp, #20
 8001112:	bd30      	pop	{r4, r5, pc}
 8001114:	200005d0 	.word	0x200005d0
 8001118:	200005c4 	.word	0x200005c4
 800111c:	200005bc 	.word	0x200005bc
 8001120:	200005cc 	.word	0x200005cc
 8001124:	40000800 	.word	0x40000800

08001128 <TIM4_IRQHandler>:
 8001128:	2300      	movs	r3, #0
 800112a:	4a10      	ldr	r2, [pc, #64]	; (800116c <TIM4_IRQHandler+0x44>)
 800112c:	f832 1013 	ldrh.w	r1, [r2, r3, lsl #1]
 8001130:	b289      	uxth	r1, r1
 8001132:	b129      	cbz	r1, 8001140 <TIM4_IRQHandler+0x18>
 8001134:	f832 1013 	ldrh.w	r1, [r2, r3, lsl #1]
 8001138:	b289      	uxth	r1, r1
 800113a:	3901      	subs	r1, #1
 800113c:	b289      	uxth	r1, r1
 800113e:	e007      	b.n	8001150 <TIM4_IRQHandler+0x28>
 8001140:	490b      	ldr	r1, [pc, #44]	; (8001170 <TIM4_IRQHandler+0x48>)
 8001142:	f831 1013 	ldrh.w	r1, [r1, r3, lsl #1]
 8001146:	b289      	uxth	r1, r1
 8001148:	f822 1013 	strh.w	r1, [r2, r3, lsl #1]
 800114c:	4a09      	ldr	r2, [pc, #36]	; (8001174 <TIM4_IRQHandler+0x4c>)
 800114e:	2101      	movs	r1, #1
 8001150:	f822 1013 	strh.w	r1, [r2, r3, lsl #1]
 8001154:	3301      	adds	r3, #1
 8001156:	2b04      	cmp	r3, #4
 8001158:	d1e7      	bne.n	800112a <TIM4_IRQHandler+0x2>
 800115a:	4b07      	ldr	r3, [pc, #28]	; (8001178 <TIM4_IRQHandler+0x50>)
 800115c:	4807      	ldr	r0, [pc, #28]	; (800117c <TIM4_IRQHandler+0x54>)
 800115e:	681a      	ldr	r2, [r3, #0]
 8001160:	2101      	movs	r1, #1
 8001162:	3201      	adds	r2, #1
 8001164:	601a      	str	r2, [r3, #0]
 8001166:	f7ff bf91 	b.w	800108c <TIM_ClearITPendingBit>
 800116a:	bf00      	nop
 800116c:	200005d0 	.word	0x200005d0
 8001170:	200005c4 	.word	0x200005c4
 8001174:	200005bc 	.word	0x200005bc
 8001178:	200005cc 	.word	0x200005cc
 800117c:	40000800 	.word	0x40000800

08001180 <timer_get_time>:
 8001180:	b082      	sub	sp, #8
 8001182:	b672      	cpsid	i
 8001184:	4b04      	ldr	r3, [pc, #16]	; (8001198 <timer_get_time+0x18>)
 8001186:	681b      	ldr	r3, [r3, #0]
 8001188:	9301      	str	r3, [sp, #4]
 800118a:	b662      	cpsie	i
 800118c:	9801      	ldr	r0, [sp, #4]
 800118e:	230a      	movs	r3, #10
 8001190:	fbb0 f0f3 	udiv	r0, r0, r3
 8001194:	b002      	add	sp, #8
 8001196:	4770      	bx	lr
 8001198:	200005cc 	.word	0x200005cc

0800119c <timer_delay_ms>:
 800119c:	b513      	push	{r0, r1, r4, lr}
 800119e:	4604      	mov	r4, r0
 80011a0:	f7ff ffee 	bl	8001180 <timer_get_time>
 80011a4:	4420      	add	r0, r4
 80011a6:	9001      	str	r0, [sp, #4]
 80011a8:	9c01      	ldr	r4, [sp, #4]
 80011aa:	f7ff ffe9 	bl	8001180 <timer_get_time>
 80011ae:	4284      	cmp	r4, r0
 80011b0:	d902      	bls.n	80011b8 <timer_delay_ms+0x1c>
 80011b2:	f000 f9dd 	bl	8001570 <sleep>
 80011b6:	e7f7      	b.n	80011a8 <timer_delay_ms+0xc>
 80011b8:	b002      	add	sp, #8
 80011ba:	bd10      	pop	{r4, pc}

080011bc <i2c_delay>:
 80011bc:	bf00      	nop
 80011be:	bf00      	nop
 80011c0:	4770      	bx	lr
	...

080011c4 <SetLowSDA>:
 80011c4:	b537      	push	{r0, r1, r2, r4, r5, lr}
 80011c6:	4d0d      	ldr	r5, [pc, #52]	; (80011fc <SetLowSDA+0x38>)
 80011c8:	2301      	movs	r3, #1
 80011ca:	2202      	movs	r2, #2
 80011cc:	f44f 4480 	mov.w	r4, #16384	; 0x4000
 80011d0:	f88d 3004 	strb.w	r3, [sp, #4]
 80011d4:	f88d 3006 	strb.w	r3, [sp, #6]
 80011d8:	4628      	mov	r0, r5
 80011da:	2300      	movs	r3, #0
 80011dc:	4669      	mov	r1, sp
 80011de:	f88d 2005 	strb.w	r2, [sp, #5]
 80011e2:	f88d 3007 	strb.w	r3, [sp, #7]
 80011e6:	9400      	str	r4, [sp, #0]
 80011e8:	f000 fb6c 	bl	80018c4 <GPIO_Init>
 80011ec:	4628      	mov	r0, r5
 80011ee:	4621      	mov	r1, r4
 80011f0:	f000 fbab 	bl	800194a <GPIO_ResetBits>
 80011f4:	f7ff ffe2 	bl	80011bc <i2c_delay>
 80011f8:	b003      	add	sp, #12
 80011fa:	bd30      	pop	{r4, r5, pc}
 80011fc:	40020400 	.word	0x40020400

08001200 <SetHighSDA>:
 8001200:	b537      	push	{r0, r1, r2, r4, r5, lr}
 8001202:	4d0d      	ldr	r5, [pc, #52]	; (8001238 <SetHighSDA+0x38>)
 8001204:	2202      	movs	r2, #2
 8001206:	2300      	movs	r3, #0
 8001208:	f44f 4480 	mov.w	r4, #16384	; 0x4000
 800120c:	f88d 2005 	strb.w	r2, [sp, #5]
 8001210:	4628      	mov	r0, r5
 8001212:	2201      	movs	r2, #1
 8001214:	4669      	mov	r1, sp
 8001216:	f88d 3004 	strb.w	r3, [sp, #4]
 800121a:	f88d 2006 	strb.w	r2, [sp, #6]
 800121e:	f88d 3007 	strb.w	r3, [sp, #7]
 8001222:	9400      	str	r4, [sp, #0]
 8001224:	f000 fb4e 	bl	80018c4 <GPIO_Init>
 8001228:	4628      	mov	r0, r5
 800122a:	4621      	mov	r1, r4
 800122c:	f000 fb8b 	bl	8001946 <GPIO_SetBits>
 8001230:	f7ff ffc4 	bl	80011bc <i2c_delay>
 8001234:	b003      	add	sp, #12
 8001236:	bd30      	pop	{r4, r5, pc}
 8001238:	40020400 	.word	0x40020400

0800123c <SetLowSCL>:
 800123c:	b508      	push	{r3, lr}
 800123e:	4804      	ldr	r0, [pc, #16]	; (8001250 <SetLowSCL+0x14>)
 8001240:	f44f 4100 	mov.w	r1, #32768	; 0x8000
 8001244:	f000 fb81 	bl	800194a <GPIO_ResetBits>
 8001248:	e8bd 4008 	ldmia.w	sp!, {r3, lr}
 800124c:	f7ff bfb6 	b.w	80011bc <i2c_delay>
 8001250:	40020400 	.word	0x40020400

08001254 <SetHighSCL>:
 8001254:	b508      	push	{r3, lr}
 8001256:	4804      	ldr	r0, [pc, #16]	; (8001268 <SetHighSCL+0x14>)
 8001258:	f44f 4100 	mov.w	r1, #32768	; 0x8000
 800125c:	f000 fb73 	bl	8001946 <GPIO_SetBits>
 8001260:	e8bd 4008 	ldmia.w	sp!, {r3, lr}
 8001264:	f7ff bfaa 	b.w	80011bc <i2c_delay>
 8001268:	40020400 	.word	0x40020400

0800126c <i2c_0_init>:
 800126c:	b507      	push	{r0, r1, r2, lr}
 800126e:	2002      	movs	r0, #2
 8001270:	2101      	movs	r1, #1
 8001272:	f000 fa87 	bl	8001784 <RCC_AHB1PeriphClockCmd>
 8001276:	f44f 4340 	mov.w	r3, #49152	; 0xc000
 800127a:	9300      	str	r3, [sp, #0]
 800127c:	2301      	movs	r3, #1
 800127e:	2202      	movs	r2, #2
 8001280:	480a      	ldr	r0, [pc, #40]	; (80012ac <i2c_0_init+0x40>)
 8001282:	f88d 3004 	strb.w	r3, [sp, #4]
 8001286:	4669      	mov	r1, sp
 8001288:	f88d 3006 	strb.w	r3, [sp, #6]
 800128c:	2300      	movs	r3, #0
 800128e:	f88d 2005 	strb.w	r2, [sp, #5]
 8001292:	f88d 3007 	strb.w	r3, [sp, #7]
 8001296:	f000 fb15 	bl	80018c4 <GPIO_Init>
 800129a:	f7ff ffdb 	bl	8001254 <SetHighSCL>
 800129e:	f7ff ff91 	bl	80011c4 <SetLowSDA>
 80012a2:	f7ff ffad 	bl	8001200 <SetHighSDA>
 80012a6:	b003      	add	sp, #12
 80012a8:	f85d fb04 	ldr.w	pc, [sp], #4
 80012ac:	40020400 	.word	0x40020400

080012b0 <i2cStart>:
 80012b0:	b508      	push	{r3, lr}
 80012b2:	f7ff ffcf 	bl	8001254 <SetHighSCL>
 80012b6:	f7ff ffa3 	bl	8001200 <SetHighSDA>
 80012ba:	f7ff ffcb 	bl	8001254 <SetHighSCL>
 80012be:	f7ff ff81 	bl	80011c4 <SetLowSDA>
 80012c2:	f7ff ffbb 	bl	800123c <SetLowSCL>
 80012c6:	e8bd 4008 	ldmia.w	sp!, {r3, lr}
 80012ca:	f7ff bf99 	b.w	8001200 <SetHighSDA>

080012ce <i2cStop>:
 80012ce:	b508      	push	{r3, lr}
 80012d0:	f7ff ffb4 	bl	800123c <SetLowSCL>
 80012d4:	f7ff ff76 	bl	80011c4 <SetLowSDA>
 80012d8:	f7ff ffbc 	bl	8001254 <SetHighSCL>
 80012dc:	f7ff ff72 	bl	80011c4 <SetLowSDA>
 80012e0:	f7ff ffb8 	bl	8001254 <SetHighSCL>
 80012e4:	e8bd 4008 	ldmia.w	sp!, {r3, lr}
 80012e8:	f7ff bf8a 	b.w	8001200 <SetHighSDA>

080012ec <i2cWrite>:
 80012ec:	b538      	push	{r3, r4, r5, lr}
 80012ee:	4604      	mov	r4, r0
 80012f0:	2508      	movs	r5, #8
 80012f2:	f7ff ffa3 	bl	800123c <SetLowSCL>
 80012f6:	0623      	lsls	r3, r4, #24
 80012f8:	d502      	bpl.n	8001300 <i2cWrite+0x14>
 80012fa:	f7ff ff81 	bl	8001200 <SetHighSDA>
 80012fe:	e001      	b.n	8001304 <i2cWrite+0x18>
 8001300:	f7ff ff60 	bl	80011c4 <SetLowSDA>
 8001304:	3d01      	subs	r5, #1
 8001306:	f7ff ffa5 	bl	8001254 <SetHighSCL>
 800130a:	0064      	lsls	r4, r4, #1
 800130c:	f015 05ff 	ands.w	r5, r5, #255	; 0xff
 8001310:	b2e4      	uxtb	r4, r4
 8001312:	d1ee      	bne.n	80012f2 <i2cWrite+0x6>
 8001314:	f7ff ff92 	bl	800123c <SetLowSCL>
 8001318:	f7ff ff72 	bl	8001200 <SetHighSDA>
 800131c:	f7ff ff9a 	bl	8001254 <SetHighSCL>
 8001320:	4b05      	ldr	r3, [pc, #20]	; (8001338 <i2cWrite+0x4c>)
 8001322:	691c      	ldr	r4, [r3, #16]
 8001324:	f7ff ff8a 	bl	800123c <SetLowSCL>
 8001328:	f7ff ff48 	bl	80011bc <i2c_delay>
 800132c:	f484 4080 	eor.w	r0, r4, #16384	; 0x4000
 8001330:	f3c0 3080 	ubfx	r0, r0, #14, #1
 8001334:	bd38      	pop	{r3, r4, r5, pc}
 8001336:	bf00      	nop
 8001338:	40020400 	.word	0x40020400

0800133c <i2cRead>:
 800133c:	b570      	push	{r4, r5, r6, lr}
 800133e:	4606      	mov	r6, r0
 8001340:	f7ff ff7c 	bl	800123c <SetLowSCL>
 8001344:	f7ff ff5c 	bl	8001200 <SetHighSDA>
 8001348:	2508      	movs	r5, #8
 800134a:	2400      	movs	r4, #0
 800134c:	f7ff ff82 	bl	8001254 <SetHighSCL>
 8001350:	4b0d      	ldr	r3, [pc, #52]	; (8001388 <i2cRead+0x4c>)
 8001352:	691b      	ldr	r3, [r3, #16]
 8001354:	0064      	lsls	r4, r4, #1
 8001356:	045a      	lsls	r2, r3, #17
 8001358:	b2e4      	uxtb	r4, r4
 800135a:	bf48      	it	mi
 800135c:	3401      	addmi	r4, #1
 800135e:	f105 35ff 	add.w	r5, r5, #4294967295
 8001362:	bf48      	it	mi
 8001364:	b2e4      	uxtbmi	r4, r4
 8001366:	f7ff ff69 	bl	800123c <SetLowSCL>
 800136a:	f015 05ff 	ands.w	r5, r5, #255	; 0xff
 800136e:	d1ed      	bne.n	800134c <i2cRead+0x10>
 8001370:	b10e      	cbz	r6, 8001376 <i2cRead+0x3a>
 8001372:	f7ff ff27 	bl	80011c4 <SetLowSDA>
 8001376:	f7ff ff6d 	bl	8001254 <SetHighSCL>
 800137a:	f7ff ff5f 	bl	800123c <SetLowSCL>
 800137e:	f7ff ff1d 	bl	80011bc <i2c_delay>
 8001382:	4620      	mov	r0, r4
 8001384:	bd70      	pop	{r4, r5, r6, pc}
 8001386:	bf00      	nop
 8001388:	40020400 	.word	0x40020400

0800138c <i2c_write_reg>:
 800138c:	b570      	push	{r4, r5, r6, lr}
 800138e:	4605      	mov	r5, r0
 8001390:	460c      	mov	r4, r1
 8001392:	4616      	mov	r6, r2
 8001394:	f7ff ff8c 	bl	80012b0 <i2cStart>
 8001398:	4628      	mov	r0, r5
 800139a:	f7ff ffa7 	bl	80012ec <i2cWrite>
 800139e:	4620      	mov	r0, r4
 80013a0:	f7ff ffa4 	bl	80012ec <i2cWrite>
 80013a4:	4630      	mov	r0, r6
 80013a6:	f7ff ffa1 	bl	80012ec <i2cWrite>
 80013aa:	e8bd 4070 	ldmia.w	sp!, {r4, r5, r6, lr}
 80013ae:	f7ff bf8e 	b.w	80012ce <i2cStop>

080013b2 <i2c_read_reg>:
 80013b2:	b538      	push	{r3, r4, r5, lr}
 80013b4:	4604      	mov	r4, r0
 80013b6:	460d      	mov	r5, r1
 80013b8:	f7ff ff7a 	bl	80012b0 <i2cStart>
 80013bc:	4620      	mov	r0, r4
 80013be:	f7ff ff95 	bl	80012ec <i2cWrite>
 80013c2:	4628      	mov	r0, r5
 80013c4:	f7ff ff92 	bl	80012ec <i2cWrite>
 80013c8:	f7ff ff72 	bl	80012b0 <i2cStart>
 80013cc:	f044 0001 	orr.w	r0, r4, #1
 80013d0:	f7ff ff8c 	bl	80012ec <i2cWrite>
 80013d4:	2000      	movs	r0, #0
 80013d6:	f7ff ffb1 	bl	800133c <i2cRead>
 80013da:	4604      	mov	r4, r0
 80013dc:	f7ff ff77 	bl	80012ce <i2cStop>
 80013e0:	4620      	mov	r0, r4
 80013e2:	bd38      	pop	{r3, r4, r5, pc}

080013e4 <uart_write>:
 80013e4:	4b03      	ldr	r3, [pc, #12]	; (80013f4 <uart_write+0x10>)
 80013e6:	881a      	ldrh	r2, [r3, #0]
 80013e8:	0652      	lsls	r2, r2, #25
 80013ea:	d401      	bmi.n	80013f0 <uart_write+0xc>
 80013ec:	bf00      	nop
 80013ee:	e7f9      	b.n	80013e4 <uart_write>
 80013f0:	8098      	strh	r0, [r3, #4]
 80013f2:	4770      	bx	lr
 80013f4:	40011000 	.word	0x40011000

080013f8 <uart_init>:
 80013f8:	b530      	push	{r4, r5, lr}
 80013fa:	2010      	movs	r0, #16
 80013fc:	b087      	sub	sp, #28
 80013fe:	2101      	movs	r1, #1
 8001400:	f000 f9d8 	bl	80017b4 <RCC_APB2PeriphClockCmd>
 8001404:	2001      	movs	r0, #1
 8001406:	4d1c      	ldr	r5, [pc, #112]	; (8001478 <uart_init+0x80>)
 8001408:	4601      	mov	r1, r0
 800140a:	f000 f9bb 	bl	8001784 <RCC_AHB1PeriphClockCmd>
 800140e:	f44f 63c0 	mov.w	r3, #1536	; 0x600
 8001412:	2400      	movs	r4, #0
 8001414:	9300      	str	r3, [sp, #0]
 8001416:	4628      	mov	r0, r5
 8001418:	2302      	movs	r3, #2
 800141a:	4669      	mov	r1, sp
 800141c:	f88d 3004 	strb.w	r3, [sp, #4]
 8001420:	f88d 3005 	strb.w	r3, [sp, #5]
 8001424:	f88d 4006 	strb.w	r4, [sp, #6]
 8001428:	f88d 4007 	strb.w	r4, [sp, #7]
 800142c:	f000 fa4a 	bl	80018c4 <GPIO_Init>
 8001430:	4628      	mov	r0, r5
 8001432:	2109      	movs	r1, #9
 8001434:	2207      	movs	r2, #7
 8001436:	f000 fa8a 	bl	800194e <GPIO_PinAFConfig>
 800143a:	2207      	movs	r2, #7
 800143c:	4628      	mov	r0, r5
 800143e:	210a      	movs	r1, #10
 8001440:	f000 fa85 	bl	800194e <GPIO_PinAFConfig>
 8001444:	f8ad 400c 	strh.w	r4, [sp, #12]
 8001448:	f8ad 400e 	strh.w	r4, [sp, #14]
 800144c:	f8ad 4010 	strh.w	r4, [sp, #16]
 8001450:	f8ad 4014 	strh.w	r4, [sp, #20]
 8001454:	4c09      	ldr	r4, [pc, #36]	; (800147c <uart_init+0x84>)
 8001456:	f44f 33e1 	mov.w	r3, #115200	; 0x1c200
 800145a:	9302      	str	r3, [sp, #8]
 800145c:	4620      	mov	r0, r4
 800145e:	230c      	movs	r3, #12
 8001460:	a902      	add	r1, sp, #8
 8001462:	f8ad 3012 	strh.w	r3, [sp, #18]
 8001466:	f000 f80b 	bl	8001480 <USART_Init>
 800146a:	4620      	mov	r0, r4
 800146c:	2101      	movs	r1, #1
 800146e:	f000 f861 	bl	8001534 <USART_Cmd>
 8001472:	b007      	add	sp, #28
 8001474:	bd30      	pop	{r4, r5, pc}
 8001476:	bf00      	nop
 8001478:	40020000 	.word	0x40020000
 800147c:	40011000 	.word	0x40011000

08001480 <USART_Init>:
 8001480:	8a03      	ldrh	r3, [r0, #16]
 8001482:	88ca      	ldrh	r2, [r1, #6]
 8001484:	b29b      	uxth	r3, r3
 8001486:	f423 5340 	bic.w	r3, r3, #12288	; 0x3000
 800148a:	b530      	push	{r4, r5, lr}
 800148c:	4313      	orrs	r3, r2
 800148e:	460d      	mov	r5, r1
 8001490:	8203      	strh	r3, [r0, #16]
 8001492:	8983      	ldrh	r3, [r0, #12]
 8001494:	8909      	ldrh	r1, [r1, #8]
 8001496:	88aa      	ldrh	r2, [r5, #4]
 8001498:	f423 53b0 	bic.w	r3, r3, #5632	; 0x1600
 800149c:	430a      	orrs	r2, r1
 800149e:	8969      	ldrh	r1, [r5, #10]
 80014a0:	f023 030c 	bic.w	r3, r3, #12
 80014a4:	430a      	orrs	r2, r1
 80014a6:	041b      	lsls	r3, r3, #16
 80014a8:	b292      	uxth	r2, r2
 80014aa:	0c1b      	lsrs	r3, r3, #16
 80014ac:	4313      	orrs	r3, r2
 80014ae:	8183      	strh	r3, [r0, #12]
 80014b0:	8a83      	ldrh	r3, [r0, #20]
 80014b2:	89aa      	ldrh	r2, [r5, #12]
 80014b4:	b29b      	uxth	r3, r3
 80014b6:	f423 7340 	bic.w	r3, r3, #768	; 0x300
 80014ba:	4313      	orrs	r3, r2
 80014bc:	b085      	sub	sp, #20
 80014be:	8283      	strh	r3, [r0, #20]
 80014c0:	4604      	mov	r4, r0
 80014c2:	4668      	mov	r0, sp
 80014c4:	f000 f91a 	bl	80016fc <RCC_GetClocksFreq>
 80014c8:	4b19      	ldr	r3, [pc, #100]	; (8001530 <USART_Init+0xb0>)
 80014ca:	429c      	cmp	r4, r3
 80014cc:	d003      	beq.n	80014d6 <USART_Init+0x56>
 80014ce:	f503 6380 	add.w	r3, r3, #1024	; 0x400
 80014d2:	429c      	cmp	r4, r3
 80014d4:	d101      	bne.n	80014da <USART_Init+0x5a>
 80014d6:	9b03      	ldr	r3, [sp, #12]
 80014d8:	e000      	b.n	80014dc <USART_Init+0x5c>
 80014da:	9b02      	ldr	r3, [sp, #8]
 80014dc:	89a2      	ldrh	r2, [r4, #12]
 80014de:	b212      	sxth	r2, r2
 80014e0:	2a00      	cmp	r2, #0
 80014e2:	682a      	ldr	r2, [r5, #0]
 80014e4:	f04f 0119 	mov.w	r1, #25
 80014e8:	bfb4      	ite	lt
 80014ea:	0052      	lsllt	r2, r2, #1
 80014ec:	0092      	lslge	r2, r2, #2
 80014ee:	4359      	muls	r1, r3
 80014f0:	fbb1 f1f2 	udiv	r1, r1, r2
 80014f4:	2364      	movs	r3, #100	; 0x64
 80014f6:	fbb1 f2f3 	udiv	r2, r1, r3
 80014fa:	0112      	lsls	r2, r2, #4
 80014fc:	0910      	lsrs	r0, r2, #4
 80014fe:	fb03 1110 	mls	r1, r3, r0, r1
 8001502:	89a0      	ldrh	r0, [r4, #12]
 8001504:	b200      	sxth	r0, r0
 8001506:	2800      	cmp	r0, #0
 8001508:	da06      	bge.n	8001518 <USART_Init+0x98>
 800150a:	00c9      	lsls	r1, r1, #3
 800150c:	3132      	adds	r1, #50	; 0x32
 800150e:	fbb1 f3f3 	udiv	r3, r1, r3
 8001512:	f003 0307 	and.w	r3, r3, #7
 8001516:	e005      	b.n	8001524 <USART_Init+0xa4>
 8001518:	0109      	lsls	r1, r1, #4
 800151a:	3132      	adds	r1, #50	; 0x32
 800151c:	fbb1 f3f3 	udiv	r3, r1, r3
 8001520:	f003 030f 	and.w	r3, r3, #15
 8001524:	431a      	orrs	r2, r3
 8001526:	b292      	uxth	r2, r2
 8001528:	8122      	strh	r2, [r4, #8]
 800152a:	b005      	add	sp, #20
 800152c:	bd30      	pop	{r4, r5, pc}
 800152e:	bf00      	nop
 8001530:	40011000 	.word	0x40011000

08001534 <USART_Cmd>:
 8001534:	8983      	ldrh	r3, [r0, #12]
 8001536:	b119      	cbz	r1, 8001540 <USART_Cmd+0xc>
 8001538:	b29b      	uxth	r3, r3
 800153a:	f443 5300 	orr.w	r3, r3, #8192	; 0x2000
 800153e:	e003      	b.n	8001548 <USART_Cmd+0x14>
 8001540:	f423 5300 	bic.w	r3, r3, #8192	; 0x2000
 8001544:	041b      	lsls	r3, r3, #16
 8001546:	0c1b      	lsrs	r3, r3, #16
 8001548:	8183      	strh	r3, [r0, #12]
 800154a:	4770      	bx	lr

0800154c <sys_tick_init>:
 800154c:	4b05      	ldr	r3, [pc, #20]	; (8001564 <sys_tick_init+0x18>)
 800154e:	4a06      	ldr	r2, [pc, #24]	; (8001568 <sys_tick_init+0x1c>)
 8001550:	605a      	str	r2, [r3, #4]
 8001552:	4a06      	ldr	r2, [pc, #24]	; (800156c <sys_tick_init+0x20>)
 8001554:	21f0      	movs	r1, #240	; 0xf0
 8001556:	f882 1023 	strb.w	r1, [r2, #35]	; 0x23
 800155a:	2200      	movs	r2, #0
 800155c:	609a      	str	r2, [r3, #8]
 800155e:	2207      	movs	r2, #7
 8001560:	601a      	str	r2, [r3, #0]
 8001562:	4770      	bx	lr
 8001564:	e000e010 	.word	0xe000e010
 8001568:	00029040 	.word	0x00029040
 800156c:	e000ed00 	.word	0xe000ed00

08001570 <sleep>:
 8001570:	bf30      	wfi
 8001572:	4770      	bx	lr

08001574 <sytem_clock_init>:
 8001574:	f000 b800 	b.w	8001578 <SystemInit>

08001578 <SystemInit>:
 8001578:	4b3b      	ldr	r3, [pc, #236]	; (8001668 <SystemInit+0xf0>)
 800157a:	f8d3 2088 	ldr.w	r2, [r3, #136]	; 0x88
 800157e:	f442 0270 	orr.w	r2, r2, #15728640	; 0xf00000
 8001582:	f8c3 2088 	str.w	r2, [r3, #136]	; 0x88
 8001586:	f8d3 2088 	ldr.w	r2, [r3, #136]	; 0x88
 800158a:	f442 0270 	orr.w	r2, r2, #15728640	; 0xf00000
 800158e:	f8c3 2088 	str.w	r2, [r3, #136]	; 0x88
 8001592:	4b36      	ldr	r3, [pc, #216]	; (800166c <SystemInit+0xf4>)
 8001594:	681a      	ldr	r2, [r3, #0]
 8001596:	f042 0201 	orr.w	r2, r2, #1
 800159a:	601a      	str	r2, [r3, #0]
 800159c:	2200      	movs	r2, #0
 800159e:	609a      	str	r2, [r3, #8]
 80015a0:	6819      	ldr	r1, [r3, #0]
 80015a2:	f021 7184 	bic.w	r1, r1, #17301504	; 0x1080000
 80015a6:	f421 3180 	bic.w	r1, r1, #65536	; 0x10000
 80015aa:	6019      	str	r1, [r3, #0]
 80015ac:	4930      	ldr	r1, [pc, #192]	; (8001670 <SystemInit+0xf8>)
 80015ae:	6059      	str	r1, [r3, #4]
 80015b0:	6819      	ldr	r1, [r3, #0]
 80015b2:	b082      	sub	sp, #8
 80015b4:	f421 2180 	bic.w	r1, r1, #262144	; 0x40000
 80015b8:	6019      	str	r1, [r3, #0]
 80015ba:	60da      	str	r2, [r3, #12]
 80015bc:	9200      	str	r2, [sp, #0]
 80015be:	9201      	str	r2, [sp, #4]
 80015c0:	681a      	ldr	r2, [r3, #0]
 80015c2:	f442 3280 	orr.w	r2, r2, #65536	; 0x10000
 80015c6:	601a      	str	r2, [r3, #0]
 80015c8:	4b28      	ldr	r3, [pc, #160]	; (800166c <SystemInit+0xf4>)
 80015ca:	681a      	ldr	r2, [r3, #0]
 80015cc:	f402 3200 	and.w	r2, r2, #131072	; 0x20000
 80015d0:	9201      	str	r2, [sp, #4]
 80015d2:	9a00      	ldr	r2, [sp, #0]
 80015d4:	3201      	adds	r2, #1
 80015d6:	9200      	str	r2, [sp, #0]
 80015d8:	9a01      	ldr	r2, [sp, #4]
 80015da:	b91a      	cbnz	r2, 80015e4 <SystemInit+0x6c>
 80015dc:	9a00      	ldr	r2, [sp, #0]
 80015de:	f5b2 6fa0 	cmp.w	r2, #1280	; 0x500
 80015e2:	d1f1      	bne.n	80015c8 <SystemInit+0x50>
 80015e4:	681b      	ldr	r3, [r3, #0]
 80015e6:	f413 3300 	ands.w	r3, r3, #131072	; 0x20000
 80015ea:	bf18      	it	ne
 80015ec:	2301      	movne	r3, #1
 80015ee:	9301      	str	r3, [sp, #4]
 80015f0:	9b01      	ldr	r3, [sp, #4]
 80015f2:	2b01      	cmp	r3, #1
 80015f4:	d005      	beq.n	8001602 <SystemInit+0x8a>
 80015f6:	4b1c      	ldr	r3, [pc, #112]	; (8001668 <SystemInit+0xf0>)
 80015f8:	f04f 6200 	mov.w	r2, #134217728	; 0x8000000
 80015fc:	609a      	str	r2, [r3, #8]
 80015fe:	b002      	add	sp, #8
 8001600:	4770      	bx	lr
 8001602:	4b1a      	ldr	r3, [pc, #104]	; (800166c <SystemInit+0xf4>)
 8001604:	6c1a      	ldr	r2, [r3, #64]	; 0x40
 8001606:	f042 5280 	orr.w	r2, r2, #268435456	; 0x10000000
 800160a:	641a      	str	r2, [r3, #64]	; 0x40
 800160c:	4a19      	ldr	r2, [pc, #100]	; (8001674 <SystemInit+0xfc>)
 800160e:	6811      	ldr	r1, [r2, #0]
 8001610:	f441 4180 	orr.w	r1, r1, #16384	; 0x4000
 8001614:	6011      	str	r1, [r2, #0]
 8001616:	689a      	ldr	r2, [r3, #8]
 8001618:	f042 0290 	orr.w	r2, r2, #144	; 0x90
 800161c:	609a      	str	r2, [r3, #8]
 800161e:	689a      	ldr	r2, [r3, #8]
 8001620:	f442 4200 	orr.w	r2, r2, #32768	; 0x8000
 8001624:	609a      	str	r2, [r3, #8]
 8001626:	689a      	ldr	r2, [r3, #8]
 8001628:	f442 52a0 	orr.w	r2, r2, #5120	; 0x1400
 800162c:	609a      	str	r2, [r3, #8]
 800162e:	4a12      	ldr	r2, [pc, #72]	; (8001678 <SystemInit+0x100>)
 8001630:	605a      	str	r2, [r3, #4]
 8001632:	681a      	ldr	r2, [r3, #0]
 8001634:	f042 7280 	orr.w	r2, r2, #16777216	; 0x1000000
 8001638:	601a      	str	r2, [r3, #0]
 800163a:	6819      	ldr	r1, [r3, #0]
 800163c:	4a0b      	ldr	r2, [pc, #44]	; (800166c <SystemInit+0xf4>)
 800163e:	0189      	lsls	r1, r1, #6
 8001640:	d5fb      	bpl.n	800163a <SystemInit+0xc2>
 8001642:	4b0e      	ldr	r3, [pc, #56]	; (800167c <SystemInit+0x104>)
 8001644:	f240 6105 	movw	r1, #1541	; 0x605
 8001648:	6019      	str	r1, [r3, #0]
 800164a:	6893      	ldr	r3, [r2, #8]
 800164c:	f023 0303 	bic.w	r3, r3, #3
 8001650:	6093      	str	r3, [r2, #8]
 8001652:	6893      	ldr	r3, [r2, #8]
 8001654:	f043 0302 	orr.w	r3, r3, #2
 8001658:	6093      	str	r3, [r2, #8]
 800165a:	4b04      	ldr	r3, [pc, #16]	; (800166c <SystemInit+0xf4>)
 800165c:	689b      	ldr	r3, [r3, #8]
 800165e:	f003 030c 	and.w	r3, r3, #12
 8001662:	2b08      	cmp	r3, #8
 8001664:	d1f9      	bne.n	800165a <SystemInit+0xe2>
 8001666:	e7c6      	b.n	80015f6 <SystemInit+0x7e>
 8001668:	e000ed00 	.word	0xe000ed00
 800166c:	40023800 	.word	0x40023800
 8001670:	24003010 	.word	0x24003010
 8001674:	40007000 	.word	0x40007000
 8001678:	07405408 	.word	0x07405408
 800167c:	40023c00 	.word	0x40023c00

08001680 <Default_Handler>:
 8001680:	4668      	mov	r0, sp
 8001682:	f020 0107 	bic.w	r1, r0, #7
 8001686:	468d      	mov	sp, r1
 8001688:	bf00      	nop
 800168a:	e7fd      	b.n	8001688 <Default_Handler+0x8>

0800168c <HardFault_Handler>:
 800168c:	2010      	movs	r0, #16
 800168e:	f000 f8ad 	bl	80017ec <led_on>
 8001692:	4b06      	ldr	r3, [pc, #24]	; (80016ac <HardFault_Handler+0x20>)
 8001694:	3b01      	subs	r3, #1
 8001696:	d001      	beq.n	800169c <HardFault_Handler+0x10>
 8001698:	bf00      	nop
 800169a:	e7fb      	b.n	8001694 <HardFault_Handler+0x8>
 800169c:	2010      	movs	r0, #16
 800169e:	f000 f8ad 	bl	80017fc <led_off>
 80016a2:	4b02      	ldr	r3, [pc, #8]	; (80016ac <HardFault_Handler+0x20>)
 80016a4:	3b01      	subs	r3, #1
 80016a6:	d0f1      	beq.n	800168c <HardFault_Handler>
 80016a8:	bf00      	nop
 80016aa:	e7fb      	b.n	80016a4 <HardFault_Handler+0x18>
 80016ac:	00989681 	.word	0x00989681

080016b0 <_reset_init>:
 80016b0:	4a0e      	ldr	r2, [pc, #56]	; (80016ec <_reset_init+0x3c>)
 80016b2:	480f      	ldr	r0, [pc, #60]	; (80016f0 <_reset_init+0x40>)
 80016b4:	1a80      	subs	r0, r0, r2
 80016b6:	1080      	asrs	r0, r0, #2
 80016b8:	2300      	movs	r3, #0
 80016ba:	4283      	cmp	r3, r0
 80016bc:	d006      	beq.n	80016cc <_reset_init+0x1c>
 80016be:	490d      	ldr	r1, [pc, #52]	; (80016f4 <_reset_init+0x44>)
 80016c0:	f851 1023 	ldr.w	r1, [r1, r3, lsl #2]
 80016c4:	f842 1023 	str.w	r1, [r2, r3, lsl #2]
 80016c8:	3301      	adds	r3, #1
 80016ca:	e7f6      	b.n	80016ba <_reset_init+0xa>
 80016cc:	4b0a      	ldr	r3, [pc, #40]	; (80016f8 <_reset_init+0x48>)
 80016ce:	f8d3 2088 	ldr.w	r2, [r3, #136]	; 0x88
 80016d2:	f442 0270 	orr.w	r2, r2, #15728640	; 0xf00000
 80016d6:	f8c3 2088 	str.w	r2, [r3, #136]	; 0x88
 80016da:	f503 730c 	add.w	r3, r3, #560	; 0x230
 80016de:	685a      	ldr	r2, [r3, #4]
 80016e0:	f022 4240 	bic.w	r2, r2, #3221225472	; 0xc0000000
 80016e4:	605a      	str	r2, [r3, #4]
 80016e6:	f7fe bff3 	b.w	80006d0 <main>
 80016ea:	bf00      	nop
 80016ec:	20000000 	.word	0x20000000
 80016f0:	20000014 	.word	0x20000014
 80016f4:	08001b5c 	.word	0x08001b5c
 80016f8:	e000ed00 	.word	0xe000ed00

080016fc <RCC_GetClocksFreq>:
 80016fc:	4b1d      	ldr	r3, [pc, #116]	; (8001774 <RCC_GetClocksFreq+0x78>)
 80016fe:	689a      	ldr	r2, [r3, #8]
 8001700:	f002 020c 	and.w	r2, r2, #12
 8001704:	2a04      	cmp	r2, #4
 8001706:	b510      	push	{r4, lr}
 8001708:	d003      	beq.n	8001712 <RCC_GetClocksFreq+0x16>
 800170a:	2a08      	cmp	r2, #8
 800170c:	d003      	beq.n	8001716 <RCC_GetClocksFreq+0x1a>
 800170e:	4b1a      	ldr	r3, [pc, #104]	; (8001778 <RCC_GetClocksFreq+0x7c>)
 8001710:	e018      	b.n	8001744 <RCC_GetClocksFreq+0x48>
 8001712:	4b1a      	ldr	r3, [pc, #104]	; (800177c <RCC_GetClocksFreq+0x80>)
 8001714:	e016      	b.n	8001744 <RCC_GetClocksFreq+0x48>
 8001716:	6859      	ldr	r1, [r3, #4]
 8001718:	685a      	ldr	r2, [r3, #4]
 800171a:	f411 0f80 	tst.w	r1, #4194304	; 0x400000
 800171e:	6859      	ldr	r1, [r3, #4]
 8001720:	bf14      	ite	ne
 8001722:	4b16      	ldrne	r3, [pc, #88]	; (800177c <RCC_GetClocksFreq+0x80>)
 8001724:	4b14      	ldreq	r3, [pc, #80]	; (8001778 <RCC_GetClocksFreq+0x7c>)
 8001726:	f002 023f 	and.w	r2, r2, #63	; 0x3f
 800172a:	fbb3 f3f2 	udiv	r3, r3, r2
 800172e:	4a11      	ldr	r2, [pc, #68]	; (8001774 <RCC_GetClocksFreq+0x78>)
 8001730:	6852      	ldr	r2, [r2, #4]
 8001732:	f3c2 4201 	ubfx	r2, r2, #16, #2
 8001736:	f3c1 1188 	ubfx	r1, r1, #6, #9
 800173a:	3201      	adds	r2, #1
 800173c:	434b      	muls	r3, r1
 800173e:	0052      	lsls	r2, r2, #1
 8001740:	fbb3 f3f2 	udiv	r3, r3, r2
 8001744:	490b      	ldr	r1, [pc, #44]	; (8001774 <RCC_GetClocksFreq+0x78>)
 8001746:	6003      	str	r3, [r0, #0]
 8001748:	688b      	ldr	r3, [r1, #8]
 800174a:	4a0d      	ldr	r2, [pc, #52]	; (8001780 <RCC_GetClocksFreq+0x84>)
 800174c:	f3c3 1303 	ubfx	r3, r3, #4, #4
 8001750:	5cd4      	ldrb	r4, [r2, r3]
 8001752:	6803      	ldr	r3, [r0, #0]
 8001754:	40e3      	lsrs	r3, r4
 8001756:	6043      	str	r3, [r0, #4]
 8001758:	688c      	ldr	r4, [r1, #8]
 800175a:	f3c4 2482 	ubfx	r4, r4, #10, #3
 800175e:	5d14      	ldrb	r4, [r2, r4]
 8001760:	fa23 f404 	lsr.w	r4, r3, r4
 8001764:	6084      	str	r4, [r0, #8]
 8001766:	6889      	ldr	r1, [r1, #8]
 8001768:	f3c1 3142 	ubfx	r1, r1, #13, #3
 800176c:	5c52      	ldrb	r2, [r2, r1]
 800176e:	40d3      	lsrs	r3, r2
 8001770:	60c3      	str	r3, [r0, #12]
 8001772:	bd10      	pop	{r4, pc}
 8001774:	40023800 	.word	0x40023800
 8001778:	00f42400 	.word	0x00f42400
 800177c:	007a1200 	.word	0x007a1200
 8001780:	20000004 	.word	0x20000004

08001784 <RCC_AHB1PeriphClockCmd>:
 8001784:	4b04      	ldr	r3, [pc, #16]	; (8001798 <RCC_AHB1PeriphClockCmd+0x14>)
 8001786:	6b1a      	ldr	r2, [r3, #48]	; 0x30
 8001788:	b109      	cbz	r1, 800178e <RCC_AHB1PeriphClockCmd+0xa>
 800178a:	4310      	orrs	r0, r2
 800178c:	e001      	b.n	8001792 <RCC_AHB1PeriphClockCmd+0xe>
 800178e:	ea22 0000 	bic.w	r0, r2, r0
 8001792:	6318      	str	r0, [r3, #48]	; 0x30
 8001794:	4770      	bx	lr
 8001796:	bf00      	nop
 8001798:	40023800 	.word	0x40023800

0800179c <RCC_APB1PeriphClockCmd>:
 800179c:	4b04      	ldr	r3, [pc, #16]	; (80017b0 <RCC_APB1PeriphClockCmd+0x14>)
 800179e:	6c1a      	ldr	r2, [r3, #64]	; 0x40
 80017a0:	b109      	cbz	r1, 80017a6 <RCC_APB1PeriphClockCmd+0xa>
 80017a2:	4310      	orrs	r0, r2
 80017a4:	e001      	b.n	80017aa <RCC_APB1PeriphClockCmd+0xe>
 80017a6:	ea22 0000 	bic.w	r0, r2, r0
 80017aa:	6418      	str	r0, [r3, #64]	; 0x40
 80017ac:	4770      	bx	lr
 80017ae:	bf00      	nop
 80017b0:	40023800 	.word	0x40023800

080017b4 <RCC_APB2PeriphClockCmd>:
 80017b4:	4b04      	ldr	r3, [pc, #16]	; (80017c8 <RCC_APB2PeriphClockCmd+0x14>)
 80017b6:	6c5a      	ldr	r2, [r3, #68]	; 0x44
 80017b8:	b109      	cbz	r1, 80017be <RCC_APB2PeriphClockCmd+0xa>
 80017ba:	4310      	orrs	r0, r2
 80017bc:	e001      	b.n	80017c2 <RCC_APB2PeriphClockCmd+0xe>
 80017be:	ea22 0000 	bic.w	r0, r2, r0
 80017c2:	6458      	str	r0, [r3, #68]	; 0x44
 80017c4:	4770      	bx	lr
 80017c6:	bf00      	nop
 80017c8:	40023800 	.word	0x40023800

080017cc <lib_low_level_init>:
 80017cc:	b508      	push	{r3, lr}
 80017ce:	f7ff fed1 	bl	8001574 <sytem_clock_init>
 80017d2:	f000 f81b 	bl	800180c <gpio_init>
 80017d6:	f7ff fe0f 	bl	80013f8 <uart_init>
 80017da:	f7ff fc5b 	bl	8001094 <timer_init>
 80017de:	f7ff fb21 	bl	8000e24 <pwm_init>
 80017e2:	e8bd 4008 	ldmia.w	sp!, {r3, lr}
 80017e6:	f7ff bd41 	b.w	800126c <i2c_0_init>
	...

080017ec <led_on>:
 80017ec:	b672      	cpsid	i
 80017ee:	4b02      	ldr	r3, [pc, #8]	; (80017f8 <led_on+0xc>)
 80017f0:	b280      	uxth	r0, r0
 80017f2:	8318      	strh	r0, [r3, #24]
 80017f4:	b662      	cpsie	i
 80017f6:	4770      	bx	lr
 80017f8:	40020400 	.word	0x40020400

080017fc <led_off>:
 80017fc:	b672      	cpsid	i
 80017fe:	4b02      	ldr	r3, [pc, #8]	; (8001808 <led_off+0xc>)
 8001800:	b280      	uxth	r0, r0
 8001802:	8358      	strh	r0, [r3, #26]
 8001804:	b662      	cpsie	i
 8001806:	4770      	bx	lr
 8001808:	40020400 	.word	0x40020400

0800180c <gpio_init>:
 800180c:	b5f7      	push	{r0, r1, r2, r4, r5, r6, r7, lr}
 800180e:	2001      	movs	r0, #1
 8001810:	4601      	mov	r1, r0
 8001812:	f7ff ffb7 	bl	8001784 <RCC_AHB1PeriphClockCmd>
 8001816:	2002      	movs	r0, #2
 8001818:	2101      	movs	r1, #1
 800181a:	f7ff ffb3 	bl	8001784 <RCC_AHB1PeriphClockCmd>
 800181e:	2004      	movs	r0, #4
 8001820:	2101      	movs	r1, #1
 8001822:	f7ff ffaf 	bl	8001784 <RCC_AHB1PeriphClockCmd>
 8001826:	2008      	movs	r0, #8
 8001828:	2101      	movs	r1, #1
 800182a:	f7ff ffab 	bl	8001784 <RCC_AHB1PeriphClockCmd>
 800182e:	2008      	movs	r0, #8
 8001830:	2101      	movs	r1, #1
 8001832:	f7ff ffa7 	bl	8001784 <RCC_AHB1PeriphClockCmd>
 8001836:	2010      	movs	r0, #16
 8001838:	2101      	movs	r1, #1
 800183a:	f7ff ffa3 	bl	8001784 <RCC_AHB1PeriphClockCmd>
 800183e:	2020      	movs	r0, #32
 8001840:	2101      	movs	r1, #1
 8001842:	f7ff ff9f 	bl	8001784 <RCC_AHB1PeriphClockCmd>
 8001846:	2400      	movs	r4, #0
 8001848:	2601      	movs	r6, #1
 800184a:	2370      	movs	r3, #112	; 0x70
 800184c:	2703      	movs	r7, #3
 800184e:	4669      	mov	r1, sp
 8001850:	4819      	ldr	r0, [pc, #100]	; (80018b8 <gpio_init+0xac>)
 8001852:	9300      	str	r3, [sp, #0]
 8001854:	f88d 4006 	strb.w	r4, [sp, #6]
 8001858:	f88d 4007 	strb.w	r4, [sp, #7]
 800185c:	f88d 6004 	strb.w	r6, [sp, #4]
 8001860:	f88d 7005 	strb.w	r7, [sp, #5]
 8001864:	f000 f82e 	bl	80018c4 <GPIO_Init>
 8001868:	2302      	movs	r3, #2
 800186a:	4669      	mov	r1, sp
 800186c:	4813      	ldr	r0, [pc, #76]	; (80018bc <gpio_init+0xb0>)
 800186e:	f88d 3005 	strb.w	r3, [sp, #5]
 8001872:	f88d 4004 	strb.w	r4, [sp, #4]
 8001876:	9600      	str	r6, [sp, #0]
 8001878:	f000 f824 	bl	80018c4 <GPIO_Init>
 800187c:	f88d 4006 	strb.w	r4, [sp, #6]
 8001880:	f88d 4007 	strb.w	r4, [sp, #7]
 8001884:	4c0e      	ldr	r4, [pc, #56]	; (80018c0 <gpio_init+0xb4>)
 8001886:	f88d 6004 	strb.w	r6, [sp, #4]
 800188a:	2520      	movs	r5, #32
 800188c:	4620      	mov	r0, r4
 800188e:	4669      	mov	r1, sp
 8001890:	9500      	str	r5, [sp, #0]
 8001892:	f88d 7005 	strb.w	r7, [sp, #5]
 8001896:	f000 f815 	bl	80018c4 <GPIO_Init>
 800189a:	4629      	mov	r1, r5
 800189c:	4620      	mov	r0, r4
 800189e:	f000 f852 	bl	8001946 <GPIO_SetBits>
 80018a2:	2010      	movs	r0, #16
 80018a4:	f7ff ffaa 	bl	80017fc <led_off>
 80018a8:	4628      	mov	r0, r5
 80018aa:	f7ff ffa7 	bl	80017fc <led_off>
 80018ae:	2040      	movs	r0, #64	; 0x40
 80018b0:	f7ff ffa4 	bl	80017fc <led_off>
 80018b4:	b003      	add	sp, #12
 80018b6:	bdf0      	pop	{r4, r5, r6, r7, pc}
 80018b8:	40020400 	.word	0x40020400
 80018bc:	40020000 	.word	0x40020000
 80018c0:	40020800 	.word	0x40020800

080018c4 <GPIO_Init>:
 80018c4:	e92d 41f0 	stmdb	sp!, {r4, r5, r6, r7, r8, lr}
 80018c8:	680f      	ldr	r7, [r1, #0]
 80018ca:	2300      	movs	r3, #0
 80018cc:	2201      	movs	r2, #1
 80018ce:	409a      	lsls	r2, r3
 80018d0:	ea02 0507 	and.w	r5, r2, r7
 80018d4:	4295      	cmp	r5, r2
 80018d6:	d131      	bne.n	800193c <GPIO_Init+0x78>
 80018d8:	005a      	lsls	r2, r3, #1
 80018da:	2403      	movs	r4, #3
 80018dc:	6806      	ldr	r6, [r0, #0]
 80018de:	4094      	lsls	r4, r2
 80018e0:	43e4      	mvns	r4, r4
 80018e2:	4026      	ands	r6, r4
 80018e4:	6006      	str	r6, [r0, #0]
 80018e6:	790e      	ldrb	r6, [r1, #4]
 80018e8:	f8d0 c000 	ldr.w	ip, [r0]
 80018ec:	fa06 f802 	lsl.w	r8, r6, r2
 80018f0:	3e01      	subs	r6, #1
 80018f2:	b2f6      	uxtb	r6, r6
 80018f4:	ea48 0c0c 	orr.w	ip, r8, ip
 80018f8:	2e01      	cmp	r6, #1
 80018fa:	f8c0 c000 	str.w	ip, [r0]
 80018fe:	d814      	bhi.n	800192a <GPIO_Init+0x66>
 8001900:	6886      	ldr	r6, [r0, #8]
 8001902:	f891 c005 	ldrb.w	ip, [r1, #5]
 8001906:	4026      	ands	r6, r4
 8001908:	6086      	str	r6, [r0, #8]
 800190a:	6886      	ldr	r6, [r0, #8]
 800190c:	fa0c fc02 	lsl.w	ip, ip, r2
 8001910:	ea4c 0606 	orr.w	r6, ip, r6
 8001914:	6086      	str	r6, [r0, #8]
 8001916:	6846      	ldr	r6, [r0, #4]
 8001918:	ea26 0505 	bic.w	r5, r6, r5
 800191c:	6045      	str	r5, [r0, #4]
 800191e:	798d      	ldrb	r5, [r1, #6]
 8001920:	6846      	ldr	r6, [r0, #4]
 8001922:	409d      	lsls	r5, r3
 8001924:	b2ad      	uxth	r5, r5
 8001926:	4335      	orrs	r5, r6
 8001928:	6045      	str	r5, [r0, #4]
 800192a:	68c5      	ldr	r5, [r0, #12]
 800192c:	402c      	ands	r4, r5
 800192e:	60c4      	str	r4, [r0, #12]
 8001930:	79cd      	ldrb	r5, [r1, #7]
 8001932:	68c4      	ldr	r4, [r0, #12]
 8001934:	fa05 f202 	lsl.w	r2, r5, r2
 8001938:	4322      	orrs	r2, r4
 800193a:	60c2      	str	r2, [r0, #12]
 800193c:	3301      	adds	r3, #1
 800193e:	2b10      	cmp	r3, #16
 8001940:	d1c4      	bne.n	80018cc <GPIO_Init+0x8>
 8001942:	e8bd 81f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, pc}

08001946 <GPIO_SetBits>:
 8001946:	8301      	strh	r1, [r0, #24]
 8001948:	4770      	bx	lr

0800194a <GPIO_ResetBits>:
 800194a:	8341      	strh	r1, [r0, #26]
 800194c:	4770      	bx	lr

0800194e <GPIO_PinAFConfig>:
 800194e:	f001 0307 	and.w	r3, r1, #7
 8001952:	08c9      	lsrs	r1, r1, #3
 8001954:	eb00 0081 	add.w	r0, r0, r1, lsl #2
 8001958:	b510      	push	{r4, lr}
 800195a:	009b      	lsls	r3, r3, #2
 800195c:	6a04      	ldr	r4, [r0, #32]
 800195e:	210f      	movs	r1, #15
 8001960:	4099      	lsls	r1, r3
 8001962:	ea24 0101 	bic.w	r1, r4, r1
 8001966:	6201      	str	r1, [r0, #32]
 8001968:	6a01      	ldr	r1, [r0, #32]
 800196a:	409a      	lsls	r2, r3
 800196c:	4311      	orrs	r1, r2
 800196e:	6201      	str	r1, [r0, #32]
 8001970:	bd10      	pop	{r4, pc}
	...

08001974 <NVIC_Init>:
 8001974:	78c2      	ldrb	r2, [r0, #3]
 8001976:	7803      	ldrb	r3, [r0, #0]
 8001978:	b510      	push	{r4, lr}
 800197a:	b30a      	cbz	r2, 80019c0 <NVIC_Init+0x4c>
 800197c:	4a16      	ldr	r2, [pc, #88]	; (80019d8 <NVIC_Init+0x64>)
 800197e:	7844      	ldrb	r4, [r0, #1]
 8001980:	68d2      	ldr	r2, [r2, #12]
 8001982:	43d2      	mvns	r2, r2
 8001984:	f3c2 2202 	ubfx	r2, r2, #8, #3
 8001988:	f1c2 0104 	rsb	r1, r2, #4
 800198c:	b2c9      	uxtb	r1, r1
 800198e:	fa04 f101 	lsl.w	r1, r4, r1
 8001992:	240f      	movs	r4, #15
 8001994:	fa44 f202 	asr.w	r2, r4, r2
 8001998:	7884      	ldrb	r4, [r0, #2]
 800199a:	b2c9      	uxtb	r1, r1
 800199c:	4022      	ands	r2, r4
 800199e:	430a      	orrs	r2, r1
 80019a0:	f103 4360 	add.w	r3, r3, #3758096384	; 0xe0000000
 80019a4:	f503 4361 	add.w	r3, r3, #57600	; 0xe100
 80019a8:	0112      	lsls	r2, r2, #4
 80019aa:	b2d2      	uxtb	r2, r2
 80019ac:	f883 2300 	strb.w	r2, [r3, #768]	; 0x300
 80019b0:	7803      	ldrb	r3, [r0, #0]
 80019b2:	2201      	movs	r2, #1
 80019b4:	0959      	lsrs	r1, r3, #5
 80019b6:	f003 031f 	and.w	r3, r3, #31
 80019ba:	fa02 f303 	lsl.w	r3, r2, r3
 80019be:	e006      	b.n	80019ce <NVIC_Init+0x5a>
 80019c0:	0959      	lsrs	r1, r3, #5
 80019c2:	2201      	movs	r2, #1
 80019c4:	f003 031f 	and.w	r3, r3, #31
 80019c8:	fa02 f303 	lsl.w	r3, r2, r3
 80019cc:	3120      	adds	r1, #32
 80019ce:	4a03      	ldr	r2, [pc, #12]	; (80019dc <NVIC_Init+0x68>)
 80019d0:	f842 3021 	str.w	r3, [r2, r1, lsl #2]
 80019d4:	bd10      	pop	{r4, pc}
 80019d6:	bf00      	nop
 80019d8:	e000ed00 	.word	0xe000ed00
 80019dc:	e000e100 	.word	0xe000e100

080019e0 <_init>:
 80019e0:	e1a0c00d 	mov	ip, sp
 80019e4:	e92ddff8 	push	{r3, r4, r5, r6, r7, r8, r9, sl, fp, ip, lr, pc}
 80019e8:	e24cb004 	sub	fp, ip, #4
 80019ec:	e24bd028 	sub	sp, fp, #40	; 0x28
 80019f0:	e89d6ff0 	ldm	sp, {r4, r5, r6, r7, r8, r9, sl, fp, sp, lr}
 80019f4:	e12fff1e 	bx	lr

080019f8 <_fini>:
 80019f8:	e1a0c00d 	mov	ip, sp
 80019fc:	e92ddff8 	push	{r3, r4, r5, r6, r7, r8, r9, sl, fp, ip, lr, pc}
 8001a00:	e24cb004 	sub	fp, ip, #4
 8001a04:	e24bd028 	sub	sp, fp, #40	; 0x28
 8001a08:	e89d6ff0 	ldm	sp, {r4, r5, r6, r7, r8, r9, sl, fp, sp, lr}
 8001a0c:	e12fff1e 	bx	lr
 8001a10:	69647473 	.word	0x69647473
 8001a14:	6e69206f 	.word	0x6e69206f
 8001a18:	64207469 	.word	0x64207469
 8001a1c:	0a656e6f 	.word	0x0a656e6f
 8001a20:	00          	.byte	0x00
 8001a21:	62          	.byte	0x62
 8001a22:	6f6f      	.short	0x6f6f
 8001a24:	676e6974 	.word	0x676e6974
 8001a28:	6f726620 	.word	0x6f726620
 8001a2c:	7525206d 	.word	0x7525206d
 8001a30:	6172000a 	.word	0x6172000a
 8001a34:	7473206d 	.word	0x7473206d
 8001a38:	20747261 	.word	0x20747261
 8001a3c:	0a207525 	.word	0x0a207525
 8001a40:	6d617200 	.word	0x6d617200
 8001a44:	7a697320 	.word	0x7a697320
 8001a48:	75252065 	.word	0x75252065
 8001a4c:	72000a20 	.word	0x72000a20
 8001a50:	66206d61 	.word	0x66206d61
 8001a54:	20656572 	.word	0x20656572
 8001a58:	0a207525 	.word	0x0a207525
 8001a5c:	61656800 	.word	0x61656800
 8001a60:	74732070 	.word	0x74732070
 8001a64:	20747261 	.word	0x20747261
 8001a68:	0a207525 	.word	0x0a207525
 8001a6c:	000a0a00 	.word	0x000a0a00
 8001a70:	25207525 	.word	0x25207525
 8001a74:	69252069 	.word	0x69252069
 8001a78:	5b00203a 	.word	0x5b00203a
 8001a7c:	20692520 	.word	0x20692520
 8001a80:	25206925 	.word	0x25206925
 8001a84:	205d2069 	.word	0x205d2069
 8001a88:	25203e00 	.word	0x25203e00
 8001a8c:	3e3e2069 	.word	0x3e3e2069
 8001a90:	69253e3e 	.word	0x69253e3e
 8001a94:	3c20      	.short	0x3c20
 8001a96:	00          	.byte	0x00
 8001a97:	61          	.byte	0x61
 8001a98:	68746f6e 	.word	0x68746f6e
 8001a9c:	63207265 	.word	0x63207265
 8001aa0:	646c6968 	.word	0x646c6968
 8001aa4:	72687420 	.word	0x72687420
 8001aa8:	2c646165 	.word	0x2c646165
 8001aac:	73657220 	.word	0x73657220
 8001ab0:	0a752520 	.word	0x0a752520
 8001ab4:	72687400 	.word	0x72687400
 8001ab8:	20646165 	.word	0x20646165
 8001abc:	63000a31 	.word	0x63000a31
 8001ac0:	74616572 	.word	0x74616572
 8001ac4:	20676e69 	.word	0x20676e69
 8001ac8:	6c696863 	.word	0x6c696863
 8001acc:	68742064 	.word	0x68742064
 8001ad0:	64616572 	.word	0x64616572
 8001ad4:	6874000a 	.word	0x6874000a
 8001ad8:	64616572 	.word	0x64616572
 8001adc:	65726320 	.word	0x65726320
 8001ae0:	6e697461 	.word	0x6e697461
 8001ae4:	72652067 	.word	0x72652067
 8001ae8:	0a726f72 	.word	0x0a726f72
 8001aec:	69617700 	.word	0x69617700
 8001af0:	676e6974 	.word	0x676e6974
 8001af4:	726f6620 	.word	0x726f6620
 8001af8:	72687420 	.word	0x72687420
 8001afc:	20646165 	.word	0x20646165
 8001b00:	64207525 	.word	0x64207525
 8001b04:	0a656e6f 	.word	0x0a656e6f
 8001b08:	72657000 	.word	0x72657000
 8001b0c:	69646f69 	.word	0x69646f69
 8001b10:	68742063 	.word	0x68742063
 8001b14:	64616572 	.word	0x64616572
 8001b18:	770a000a 	.word	0x770a000a
 8001b1c:	6f636c65 	.word	0x6f636c65
 8001b20:	7420656d 	.word	0x7420656d
 8001b24:	7553206f 	.word	0x7553206f
 8001b28:	6168757a 	.word	0x6168757a
 8001b2c:	5e20534f 	.word	0x5e20534f
 8001b30:	32205e5f 	.word	0x32205e5f
 8001b34:	302e322e 	.word	0x302e322e
 8001b38:	4955420a 	.word	0x4955420a
 8001b3c:	5320444c 	.word	0x5320444c
 8001b40:	31207065 	.word	0x31207065
 8001b44:	30322038 	.word	0x30322038
 8001b48:	31203531 	.word	0x31203531
 8001b4c:	35303a34 	.word	0x35303a34
 8001b50:	0a35303a 	.word	0x0a35303a
 8001b54:	00000000 	.word	0x00000000

08001b58 <__EH_FRAME_BEGIN__>:
 8001b58:	00000000                                ....
