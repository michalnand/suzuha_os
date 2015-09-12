
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
 80001a0:	20000104 	.word	0x20000104
 80001a4:	200000a4 	.word	0x200000a4

080001a8 <null_thread>:
 80001a8:	b508      	push	{r3, lr}
 80001aa:	f001 f9bf 	bl	800152c <sleep>
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
 800020c:	200000a4 	.word	0x200000a4
 8000210:	20000104 	.word	0x20000104

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
 8000254:	20000104 	.word	0x20000104
 8000258:	200000a4 	.word	0x200000a4

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
 800027c:	20000104 	.word	0x20000104

08000280 <kernel_start>:
 8000280:	b508      	push	{r3, lr}
 8000282:	f001 f941 	bl	8001508 <sys_tick_init>
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
 80002f8:	200000a4 	.word	0x200000a4
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
 8000334:	200000a4 	.word	0x200000a4
 8000338:	20000104 	.word	0x20000104
 800033c:	080001a9 	.word	0x080001a9
 8000340:	20000108 	.word	0x20000108

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
 8000384:	200000a4 	.word	0x200000a4

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
 80003a8:	200000a4 	.word	0x200000a4

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
 80003d0:	200000a4 	.word	0x200000a4

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
 8000400:	20000190 	.word	0x20000190
 8000404:	20000c44 	.word	0x20000c44
 8000408:	20000188 	.word	0x20000188
 800040c:	2000018c 	.word	0x2000018c

08000410 <putc_>:
 8000410:	b538      	push	{r3, r4, r5, lr}
 8000412:	4c06      	ldr	r4, [pc, #24]	; (800042c <putc_+0x1c>)
 8000414:	4605      	mov	r5, r0
 8000416:	4620      	mov	r0, r4
 8000418:	f000 f912 	bl	8000640 <mutex_lock>
 800041c:	4628      	mov	r0, r5
 800041e:	f000 ffbf 	bl	80013a0 <uart_write>
 8000422:	4620      	mov	r0, r4
 8000424:	e8bd 4038 	ldmia.w	sp!, {r3, r4, r5, lr}
 8000428:	f000 b926 	b.w	8000678 <mutex_unlock>
 800042c:	20000194 	.word	0x20000194

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
 8000454:	200001a0 	.word	0x200001a0

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
 80005a4:	2000019c 	.word	0x2000019c

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
 80005e4:	20000194 	.word	0x20000194
 80005e8:	20000198 	.word	0x20000198
 80005ec:	200001a0 	.word	0x200001a0
 80005f0:	2000019c 	.word	0x2000019c
 80005f4:	080019ac 	.word	0x080019ac

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
 8000624:	200001a4 	.word	0x200001a4
 8000628:	200001c4 	.word	0x200001c4

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
 80006d4:	080019bd 	.word	0x080019bd
 80006d8:	0800197c 	.word	0x0800197c
 80006dc:	080019ce 	.word	0x080019ce
 80006e0:	080019dd 	.word	0x080019dd
 80006e4:	20000c44 	.word	0x20000c44
 80006e8:	080019eb 	.word	0x080019eb
 80006ec:	080019f9 	.word	0x080019f9
 80006f0:	20000c44 	.word	0x20000c44
 80006f4:	08001a09 	.word	0x08001a09

080006f8 <main>:
 80006f8:	b508      	push	{r3, lr}
 80006fa:	f001 f847 	bl	800178c <lib_low_level_init>
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
 800071c:	20000404 	.word	0x20000404
 8000720:	08000f31 	.word	0x08000f31

08000724 <gyro_read>:
 8000724:	b570      	push	{r4, r5, r6, lr}
 8000726:	211e      	movs	r1, #30
 8000728:	20d2      	movs	r0, #210	; 0xd2
 800072a:	f000 fe20 	bl	800136e <i2c_read_reg>
 800072e:	211d      	movs	r1, #29
 8000730:	4605      	mov	r5, r0
 8000732:	20d2      	movs	r0, #210	; 0xd2
 8000734:	4c33      	ldr	r4, [pc, #204]	; (8000804 <gyro_read+0xe0>)
 8000736:	f000 fe1a 	bl	800136e <i2c_read_reg>
 800073a:	88e3      	ldrh	r3, [r4, #6]
 800073c:	ea45 2000 	orr.w	r0, r5, r0, lsl #8
 8000740:	1ac5      	subs	r5, r0, r3
 8000742:	2120      	movs	r1, #32
 8000744:	20d2      	movs	r0, #210	; 0xd2
 8000746:	8025      	strh	r5, [r4, #0]
 8000748:	f000 fe11 	bl	800136e <i2c_read_reg>
 800074c:	211f      	movs	r1, #31
 800074e:	4605      	mov	r5, r0
 8000750:	20d2      	movs	r0, #210	; 0xd2
 8000752:	f000 fe0c 	bl	800136e <i2c_read_reg>
 8000756:	8923      	ldrh	r3, [r4, #8]
 8000758:	ea45 2000 	orr.w	r0, r5, r0, lsl #8
 800075c:	1ac5      	subs	r5, r0, r3
 800075e:	2122      	movs	r1, #34	; 0x22
 8000760:	20d2      	movs	r0, #210	; 0xd2
 8000762:	8065      	strh	r5, [r4, #2]
 8000764:	f000 fe03 	bl	800136e <i2c_read_reg>
 8000768:	2121      	movs	r1, #33	; 0x21
 800076a:	4605      	mov	r5, r0
 800076c:	20d2      	movs	r0, #210	; 0xd2
 800076e:	f000 fdfe 	bl	800136e <i2c_read_reg>
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
 8000804:	20000604 	.word	0x20000604
 8000808:	00010011 	.word	0x00010011
 800080c:	fffeffef 	.word	0xfffeffef

08000810 <gyro_init>:
 8000810:	e92d 41f0 	stmdb	sp!, {r4, r5, r6, r7, r8, lr}
 8000814:	20d2      	movs	r0, #210	; 0xd2
 8000816:	213e      	movs	r1, #62	; 0x3e
 8000818:	2280      	movs	r2, #128	; 0x80
 800081a:	f000 fd95 	bl	8001348 <i2c_write_reg>
 800081e:	20d2      	movs	r0, #210	; 0xd2
 8000820:	2115      	movs	r1, #21
 8000822:	2200      	movs	r2, #0
 8000824:	f000 fd90 	bl	8001348 <i2c_write_reg>
 8000828:	20d2      	movs	r0, #210	; 0xd2
 800082a:	2116      	movs	r1, #22
 800082c:	2219      	movs	r2, #25
 800082e:	f000 fd8b 	bl	8001348 <i2c_write_reg>
 8000832:	20d2      	movs	r0, #210	; 0xd2
 8000834:	2117      	movs	r1, #23
 8000836:	2205      	movs	r2, #5
 8000838:	f000 fd86 	bl	8001348 <i2c_write_reg>
 800083c:	2200      	movs	r2, #0
 800083e:	20d2      	movs	r0, #210	; 0xd2
 8000840:	213e      	movs	r1, #62	; 0x3e
 8000842:	f000 fd81 	bl	8001348 <i2c_write_reg>
 8000846:	2064      	movs	r0, #100	; 0x64
 8000848:	f000 fc86 	bl	8001158 <timer_delay_ms>
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
 800086c:	f000 fc74 	bl	8001158 <timer_delay_ms>
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
 80008b4:	20000604 	.word	0x20000604

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
 800097e:	f000 fc75 	bl	800126c <i2cStart>
 8000982:	20c0      	movs	r0, #192	; 0xc0
 8000984:	f000 fc90 	bl	80012a8 <i2cWrite>
 8000988:	2000      	movs	r0, #0
 800098a:	f000 fc8d 	bl	80012a8 <i2cWrite>
 800098e:	2031      	movs	r0, #49	; 0x31
 8000990:	f000 fc8a 	bl	80012a8 <i2cWrite>
 8000994:	f000 fc79 	bl	800128a <i2cStop>
 8000998:	2002      	movs	r0, #2
 800099a:	f000 fbdd 	bl	8001158 <timer_delay_ms>
 800099e:	f000 fc65 	bl	800126c <i2cStart>
 80009a2:	20c0      	movs	r0, #192	; 0xc0
 80009a4:	f000 fc80 	bl	80012a8 <i2cWrite>
 80009a8:	20fe      	movs	r0, #254	; 0xfe
 80009aa:	f000 fc7d 	bl	80012a8 <i2cWrite>
 80009ae:	2001      	movs	r0, #1
 80009b0:	f000 fc7a 	bl	80012a8 <i2cWrite>
 80009b4:	f000 fc69 	bl	800128a <i2cStop>
 80009b8:	2002      	movs	r0, #2
 80009ba:	f000 fbcd 	bl	8001158 <timer_delay_ms>
 80009be:	f000 fc55 	bl	800126c <i2cStart>
 80009c2:	20c0      	movs	r0, #192	; 0xc0
 80009c4:	f000 fc70 	bl	80012a8 <i2cWrite>
 80009c8:	2000      	movs	r0, #0
 80009ca:	f000 fc6d 	bl	80012a8 <i2cWrite>
 80009ce:	20a1      	movs	r0, #161	; 0xa1
 80009d0:	f000 fc6a 	bl	80012a8 <i2cWrite>
 80009d4:	f000 fc59 	bl	800128a <i2cStop>
 80009d8:	2002      	movs	r0, #2
 80009da:	f000 fbbd 	bl	8001158 <timer_delay_ms>
 80009de:	f000 fc45 	bl	800126c <i2cStart>
 80009e2:	20c0      	movs	r0, #192	; 0xc0
 80009e4:	f000 fc60 	bl	80012a8 <i2cWrite>
 80009e8:	2001      	movs	r0, #1
 80009ea:	f000 fc5d 	bl	80012a8 <i2cWrite>
 80009ee:	2004      	movs	r0, #4
 80009f0:	f000 fc5a 	bl	80012a8 <i2cWrite>
 80009f4:	f000 fc49 	bl	800128a <i2cStop>
 80009f8:	2002      	movs	r0, #2
 80009fa:	e8bd 4008 	ldmia.w	sp!, {r3, lr}
 80009fe:	f000 bbab 	b.w	8001158 <timer_delay_ms>

08000a02 <pca9685_send>:
 8000a02:	b538      	push	{r3, r4, r5, lr}
 8000a04:	4605      	mov	r5, r0
 8000a06:	f640 74ff 	movw	r4, #4095	; 0xfff
 8000a0a:	42a1      	cmp	r1, r4
 8000a0c:	bf38      	it	cc
 8000a0e:	460c      	movcc	r4, r1
 8000a10:	00ad      	lsls	r5, r5, #2
 8000a12:	f000 fc2b 	bl	800126c <i2cStart>
 8000a16:	20c0      	movs	r0, #192	; 0xc0
 8000a18:	f000 fc46 	bl	80012a8 <i2cWrite>
 8000a1c:	1da8      	adds	r0, r5, #6
 8000a1e:	f000 00fe 	and.w	r0, r0, #254	; 0xfe
 8000a22:	f000 fc41 	bl	80012a8 <i2cWrite>
 8000a26:	2000      	movs	r0, #0
 8000a28:	f000 fc3e 	bl	80012a8 <i2cWrite>
 8000a2c:	2000      	movs	r0, #0
 8000a2e:	f000 fc3b 	bl	80012a8 <i2cWrite>
 8000a32:	b2e0      	uxtb	r0, r4
 8000a34:	f000 fc38 	bl	80012a8 <i2cWrite>
 8000a38:	f3c4 2007 	ubfx	r0, r4, #8, #8
 8000a3c:	f000 fc34 	bl	80012a8 <i2cWrite>
 8000a40:	e8bd 4038 	ldmia.w	sp!, {r3, r4, r5, lr}
 8000a44:	f000 bc21 	b.w	800128a <i2cStop>

08000a48 <st7781_write_command>:
 8000a48:	b510      	push	{r4, lr}
 8000a4a:	4604      	mov	r4, r0
 8000a4c:	f000 f952 	bl	8000cf4 <st7781_cs_clear>
 8000a50:	f000 f8be 	bl	8000bd0 <st7781_rs_clear>
 8000a54:	f000 f8cc 	bl	8000bf0 <st7781_rd_set>
 8000a58:	f000 f8f0 	bl	8000c3c <st7781_wr_set>
 8000a5c:	0a20      	lsrs	r0, r4, #8
 8000a5e:	f000 f991 	bl	8000d84 <st7781_d_set>
 8000a62:	f000 f911 	bl	8000c88 <st7781_wr_clear>
 8000a66:	f000 f8e9 	bl	8000c3c <st7781_wr_set>
 8000a6a:	b2e0      	uxtb	r0, r4
 8000a6c:	f000 f98a 	bl	8000d84 <st7781_d_set>
 8000a70:	f000 f90a 	bl	8000c88 <st7781_wr_clear>
 8000a74:	f000 f8e2 	bl	8000c3c <st7781_wr_set>
 8000a78:	e8bd 4010 	ldmia.w	sp!, {r4, lr}
 8000a7c:	f000 b910 	b.w	8000ca0 <st7781_cs_set>

08000a80 <st7781_write_data>:
 8000a80:	b510      	push	{r4, lr}
 8000a82:	4604      	mov	r4, r0
 8000a84:	f000 f936 	bl	8000cf4 <st7781_cs_clear>
 8000a88:	f000 f878 	bl	8000b7c <st7781_rs_set>
 8000a8c:	f000 f8b0 	bl	8000bf0 <st7781_rd_set>
 8000a90:	f000 f8d4 	bl	8000c3c <st7781_wr_set>
 8000a94:	0a20      	lsrs	r0, r4, #8
 8000a96:	f000 f975 	bl	8000d84 <st7781_d_set>
 8000a9a:	f000 f8f5 	bl	8000c88 <st7781_wr_clear>
 8000a9e:	f000 f8cd 	bl	8000c3c <st7781_wr_set>
 8000aa2:	b2e0      	uxtb	r0, r4
 8000aa4:	f000 f96e 	bl	8000d84 <st7781_d_set>
 8000aa8:	f000 f8ee 	bl	8000c88 <st7781_wr_clear>
 8000aac:	f000 f8c6 	bl	8000c3c <st7781_wr_set>
 8000ab0:	e8bd 4010 	ldmia.w	sp!, {r4, lr}
 8000ab4:	f000 b8f4 	b.w	8000ca0 <st7781_cs_set>

08000ab8 <st7781_write_register>:
 8000ab8:	b510      	push	{r4, lr}
 8000aba:	460c      	mov	r4, r1
 8000abc:	f7ff ffc4 	bl	8000a48 <st7781_write_command>
 8000ac0:	4620      	mov	r0, r4
 8000ac2:	e8bd 4010 	ldmia.w	sp!, {r4, lr}
 8000ac6:	f7ff bfdb 	b.w	8000a80 <st7781_write_data>

08000aca <st7781_put_pixel>:
 8000aca:	b538      	push	{r3, r4, r5, lr}
 8000acc:	460c      	mov	r4, r1
 8000ace:	f89d 1010 	ldrb.w	r1, [sp, #16]
 8000ad2:	089b      	lsrs	r3, r3, #2
 8000ad4:	08d2      	lsrs	r2, r2, #3
 8000ad6:	ea43 1582 	orr.w	r5, r3, r2, lsl #6
 8000ada:	08c9      	lsrs	r1, r1, #3
 8000adc:	ea41 1545 	orr.w	r5, r1, r5, lsl #5
 8000ae0:	b281      	uxth	r1, r0
 8000ae2:	2020      	movs	r0, #32
 8000ae4:	f7ff ffe8 	bl	8000ab8 <st7781_write_register>
 8000ae8:	b2a1      	uxth	r1, r4
 8000aea:	2021      	movs	r0, #33	; 0x21
 8000aec:	f7ff ffe4 	bl	8000ab8 <st7781_write_register>
 8000af0:	2022      	movs	r0, #34	; 0x22
 8000af2:	f7ff ffa9 	bl	8000a48 <st7781_write_command>
 8000af6:	4628      	mov	r0, r5
 8000af8:	e8bd 4038 	ldmia.w	sp!, {r3, r4, r5, lr}
 8000afc:	f7ff bfc0 	b.w	8000a80 <st7781_write_data>

08000b00 <st7781_init>:
 8000b00:	b510      	push	{r4, lr}
 8000b02:	f000 f84b 	bl	8000b9c <st7781_rs_init>
 8000b06:	f000 f87f 	bl	8000c08 <st7781_rd_init>
 8000b0a:	f000 f8a3 	bl	8000c54 <st7781_wr_init>
 8000b0e:	f000 f8d7 	bl	8000cc0 <st7781_cs_init>
 8000b12:	f000 f979 	bl	8000e08 <st7781_d_init>
 8000b16:	f000 f919 	bl	8000d4c <st7781_reset_init>
 8000b1a:	f000 f909 	bl	8000d30 <st7781_reset_clear>
 8000b1e:	2003      	movs	r0, #3
 8000b20:	f000 fb1a 	bl	8001158 <timer_delay_ms>
 8000b24:	f000 f8f6 	bl	8000d14 <st7781_reset_set>
 8000b28:	2003      	movs	r0, #3
 8000b2a:	f000 fb15 	bl	8001158 <timer_delay_ms>
 8000b2e:	2000      	movs	r0, #0
 8000b30:	f7ff ffa6 	bl	8000a80 <st7781_write_data>
 8000b34:	2000      	movs	r0, #0
 8000b36:	f7ff ffa3 	bl	8000a80 <st7781_write_data>
 8000b3a:	2000      	movs	r0, #0
 8000b3c:	f7ff ffa0 	bl	8000a80 <st7781_write_data>
 8000b40:	2000      	movs	r0, #0
 8000b42:	f7ff ff9d 	bl	8000a80 <st7781_write_data>
 8000b46:	2400      	movs	r4, #0
 8000b48:	4b0b      	ldr	r3, [pc, #44]	; (8000b78 <st7781_init+0x78>)
 8000b4a:	1c62      	adds	r2, r4, #1
 8000b4c:	f833 0014 	ldrh.w	r0, [r3, r4, lsl #1]
 8000b50:	f833 1012 	ldrh.w	r1, [r3, r2, lsl #1]
 8000b54:	b280      	uxth	r0, r0
 8000b56:	28ff      	cmp	r0, #255	; 0xff
 8000b58:	b289      	uxth	r1, r1
 8000b5a:	d106      	bne.n	8000b6a <st7781_init+0x6a>
 8000b5c:	2964      	cmp	r1, #100	; 0x64
 8000b5e:	bf34      	ite	cc
 8000b60:	4608      	movcc	r0, r1
 8000b62:	2064      	movcs	r0, #100	; 0x64
 8000b64:	f000 faf8 	bl	8001158 <timer_delay_ms>
 8000b68:	e001      	b.n	8000b6e <st7781_init+0x6e>
 8000b6a:	f7ff ffa5 	bl	8000ab8 <st7781_write_register>
 8000b6e:	3402      	adds	r4, #2
 8000b70:	2c4a      	cmp	r4, #74	; 0x4a
 8000b72:	d1e9      	bne.n	8000b48 <st7781_init+0x48>
 8000b74:	bd10      	pop	{r4, pc}
 8000b76:	bf00      	nop
 8000b78:	20000000 	.word	0x20000000

08000b7c <st7781_rs_set>:
 8000b7c:	bf00      	nop
 8000b7e:	bf00      	nop
 8000b80:	4b05      	ldr	r3, [pc, #20]	; (8000b98 <st7781_rs_set+0x1c>)
 8000b82:	2210      	movs	r2, #16
 8000b84:	831a      	strh	r2, [r3, #24]
 8000b86:	bf00      	nop
 8000b88:	bf00      	nop
 8000b8a:	2315      	movs	r3, #21
 8000b8c:	3b01      	subs	r3, #1
 8000b8e:	d001      	beq.n	8000b94 <st7781_rs_set+0x18>
 8000b90:	bf00      	nop
 8000b92:	e7fb      	b.n	8000b8c <st7781_rs_set+0x10>
 8000b94:	4770      	bx	lr
 8000b96:	bf00      	nop
 8000b98:	40020000 	.word	0x40020000

08000b9c <st7781_rs_init>:
 8000b9c:	b507      	push	{r0, r1, r2, lr}
 8000b9e:	2310      	movs	r3, #16
 8000ba0:	9300      	str	r3, [sp, #0]
 8000ba2:	2301      	movs	r3, #1
 8000ba4:	2203      	movs	r2, #3
 8000ba6:	f88d 3004 	strb.w	r3, [sp, #4]
 8000baa:	4808      	ldr	r0, [pc, #32]	; (8000bcc <st7781_rs_init+0x30>)
 8000bac:	f88d 2005 	strb.w	r2, [sp, #5]
 8000bb0:	2300      	movs	r3, #0
 8000bb2:	4669      	mov	r1, sp
 8000bb4:	f88d 3006 	strb.w	r3, [sp, #6]
 8000bb8:	f88d 3007 	strb.w	r3, [sp, #7]
 8000bbc:	f000 fe50 	bl	8001860 <GPIO_Init>
 8000bc0:	f7ff ffdc 	bl	8000b7c <st7781_rs_set>
 8000bc4:	b003      	add	sp, #12
 8000bc6:	f85d fb04 	ldr.w	pc, [sp], #4
 8000bca:	bf00      	nop
 8000bcc:	40020000 	.word	0x40020000

08000bd0 <st7781_rs_clear>:
 8000bd0:	bf00      	nop
 8000bd2:	bf00      	nop
 8000bd4:	4b05      	ldr	r3, [pc, #20]	; (8000bec <st7781_rs_clear+0x1c>)
 8000bd6:	2210      	movs	r2, #16
 8000bd8:	835a      	strh	r2, [r3, #26]
 8000bda:	bf00      	nop
 8000bdc:	bf00      	nop
 8000bde:	2315      	movs	r3, #21
 8000be0:	3b01      	subs	r3, #1
 8000be2:	d001      	beq.n	8000be8 <st7781_rs_clear+0x18>
 8000be4:	bf00      	nop
 8000be6:	e7fb      	b.n	8000be0 <st7781_rs_clear+0x10>
 8000be8:	4770      	bx	lr
 8000bea:	bf00      	nop
 8000bec:	40020000 	.word	0x40020000

08000bf0 <st7781_rd_set>:
 8000bf0:	4b04      	ldr	r3, [pc, #16]	; (8000c04 <st7781_rd_set+0x14>)
 8000bf2:	2204      	movs	r2, #4
 8000bf4:	831a      	strh	r2, [r3, #24]
 8000bf6:	2329      	movs	r3, #41	; 0x29
 8000bf8:	3b01      	subs	r3, #1
 8000bfa:	d001      	beq.n	8000c00 <st7781_rd_set+0x10>
 8000bfc:	bf00      	nop
 8000bfe:	e7fb      	b.n	8000bf8 <st7781_rd_set+0x8>
 8000c00:	4770      	bx	lr
 8000c02:	bf00      	nop
 8000c04:	40020000 	.word	0x40020000

08000c08 <st7781_rd_init>:
 8000c08:	b507      	push	{r0, r1, r2, lr}
 8000c0a:	2304      	movs	r3, #4
 8000c0c:	9300      	str	r3, [sp, #0]
 8000c0e:	2301      	movs	r3, #1
 8000c10:	2203      	movs	r2, #3
 8000c12:	f88d 3004 	strb.w	r3, [sp, #4]
 8000c16:	4808      	ldr	r0, [pc, #32]	; (8000c38 <st7781_rd_init+0x30>)
 8000c18:	f88d 2005 	strb.w	r2, [sp, #5]
 8000c1c:	2300      	movs	r3, #0
 8000c1e:	4669      	mov	r1, sp
 8000c20:	f88d 3006 	strb.w	r3, [sp, #6]
 8000c24:	f88d 3007 	strb.w	r3, [sp, #7]
 8000c28:	f000 fe1a 	bl	8001860 <GPIO_Init>
 8000c2c:	f7ff ffe0 	bl	8000bf0 <st7781_rd_set>
 8000c30:	b003      	add	sp, #12
 8000c32:	f85d fb04 	ldr.w	pc, [sp], #4
 8000c36:	bf00      	nop
 8000c38:	40020000 	.word	0x40020000

08000c3c <st7781_wr_set>:
 8000c3c:	4b04      	ldr	r3, [pc, #16]	; (8000c50 <st7781_wr_set+0x14>)
 8000c3e:	2208      	movs	r2, #8
 8000c40:	831a      	strh	r2, [r3, #24]
 8000c42:	2315      	movs	r3, #21
 8000c44:	3b01      	subs	r3, #1
 8000c46:	d001      	beq.n	8000c4c <st7781_wr_set+0x10>
 8000c48:	bf00      	nop
 8000c4a:	e7fb      	b.n	8000c44 <st7781_wr_set+0x8>
 8000c4c:	4770      	bx	lr
 8000c4e:	bf00      	nop
 8000c50:	40020000 	.word	0x40020000

08000c54 <st7781_wr_init>:
 8000c54:	b507      	push	{r0, r1, r2, lr}
 8000c56:	2308      	movs	r3, #8
 8000c58:	9300      	str	r3, [sp, #0]
 8000c5a:	2301      	movs	r3, #1
 8000c5c:	2203      	movs	r2, #3
 8000c5e:	f88d 3004 	strb.w	r3, [sp, #4]
 8000c62:	4808      	ldr	r0, [pc, #32]	; (8000c84 <st7781_wr_init+0x30>)
 8000c64:	f88d 2005 	strb.w	r2, [sp, #5]
 8000c68:	2300      	movs	r3, #0
 8000c6a:	4669      	mov	r1, sp
 8000c6c:	f88d 3006 	strb.w	r3, [sp, #6]
 8000c70:	f88d 3007 	strb.w	r3, [sp, #7]
 8000c74:	f000 fdf4 	bl	8001860 <GPIO_Init>
 8000c78:	f7ff ffe0 	bl	8000c3c <st7781_wr_set>
 8000c7c:	b003      	add	sp, #12
 8000c7e:	f85d fb04 	ldr.w	pc, [sp], #4
 8000c82:	bf00      	nop
 8000c84:	40020000 	.word	0x40020000

08000c88 <st7781_wr_clear>:
 8000c88:	4b04      	ldr	r3, [pc, #16]	; (8000c9c <st7781_wr_clear+0x14>)
 8000c8a:	2208      	movs	r2, #8
 8000c8c:	835a      	strh	r2, [r3, #26]
 8000c8e:	2315      	movs	r3, #21
 8000c90:	3b01      	subs	r3, #1
 8000c92:	d001      	beq.n	8000c98 <st7781_wr_clear+0x10>
 8000c94:	bf00      	nop
 8000c96:	e7fb      	b.n	8000c90 <st7781_wr_clear+0x8>
 8000c98:	4770      	bx	lr
 8000c9a:	bf00      	nop
 8000c9c:	40020000 	.word	0x40020000

08000ca0 <st7781_cs_set>:
 8000ca0:	bf00      	nop
 8000ca2:	bf00      	nop
 8000ca4:	4b05      	ldr	r3, [pc, #20]	; (8000cbc <st7781_cs_set+0x1c>)
 8000ca6:	2220      	movs	r2, #32
 8000ca8:	831a      	strh	r2, [r3, #24]
 8000caa:	bf00      	nop
 8000cac:	bf00      	nop
 8000cae:	2315      	movs	r3, #21
 8000cb0:	3b01      	subs	r3, #1
 8000cb2:	d001      	beq.n	8000cb8 <st7781_cs_set+0x18>
 8000cb4:	bf00      	nop
 8000cb6:	e7fb      	b.n	8000cb0 <st7781_cs_set+0x10>
 8000cb8:	4770      	bx	lr
 8000cba:	bf00      	nop
 8000cbc:	40020000 	.word	0x40020000

08000cc0 <st7781_cs_init>:
 8000cc0:	b507      	push	{r0, r1, r2, lr}
 8000cc2:	2320      	movs	r3, #32
 8000cc4:	9300      	str	r3, [sp, #0]
 8000cc6:	2301      	movs	r3, #1
 8000cc8:	2203      	movs	r2, #3
 8000cca:	f88d 3004 	strb.w	r3, [sp, #4]
 8000cce:	4808      	ldr	r0, [pc, #32]	; (8000cf0 <st7781_cs_init+0x30>)
 8000cd0:	f88d 2005 	strb.w	r2, [sp, #5]
 8000cd4:	2300      	movs	r3, #0
 8000cd6:	4669      	mov	r1, sp
 8000cd8:	f88d 3006 	strb.w	r3, [sp, #6]
 8000cdc:	f88d 3007 	strb.w	r3, [sp, #7]
 8000ce0:	f000 fdbe 	bl	8001860 <GPIO_Init>
 8000ce4:	f7ff ffdc 	bl	8000ca0 <st7781_cs_set>
 8000ce8:	b003      	add	sp, #12
 8000cea:	f85d fb04 	ldr.w	pc, [sp], #4
 8000cee:	bf00      	nop
 8000cf0:	40020000 	.word	0x40020000

08000cf4 <st7781_cs_clear>:
 8000cf4:	bf00      	nop
 8000cf6:	bf00      	nop
 8000cf8:	4b05      	ldr	r3, [pc, #20]	; (8000d10 <st7781_cs_clear+0x1c>)
 8000cfa:	2220      	movs	r2, #32
 8000cfc:	835a      	strh	r2, [r3, #26]
 8000cfe:	bf00      	nop
 8000d00:	bf00      	nop
 8000d02:	2315      	movs	r3, #21
 8000d04:	3b01      	subs	r3, #1
 8000d06:	d001      	beq.n	8000d0c <st7781_cs_clear+0x18>
 8000d08:	bf00      	nop
 8000d0a:	e7fb      	b.n	8000d04 <st7781_cs_clear+0x10>
 8000d0c:	4770      	bx	lr
 8000d0e:	bf00      	nop
 8000d10:	40020000 	.word	0x40020000

08000d14 <st7781_reset_set>:
 8000d14:	4b04      	ldr	r3, [pc, #16]	; (8000d28 <st7781_reset_set+0x14>)
 8000d16:	2280      	movs	r2, #128	; 0x80
 8000d18:	831a      	strh	r2, [r3, #24]
 8000d1a:	4b04      	ldr	r3, [pc, #16]	; (8000d2c <st7781_reset_set+0x18>)
 8000d1c:	3b01      	subs	r3, #1
 8000d1e:	d001      	beq.n	8000d24 <st7781_reset_set+0x10>
 8000d20:	bf00      	nop
 8000d22:	e7fb      	b.n	8000d1c <st7781_reset_set+0x8>
 8000d24:	4770      	bx	lr
 8000d26:	bf00      	nop
 8000d28:	40020800 	.word	0x40020800
 8000d2c:	000c3501 	.word	0x000c3501

08000d30 <st7781_reset_clear>:
 8000d30:	4b04      	ldr	r3, [pc, #16]	; (8000d44 <st7781_reset_clear+0x14>)
 8000d32:	2280      	movs	r2, #128	; 0x80
 8000d34:	835a      	strh	r2, [r3, #26]
 8000d36:	4b04      	ldr	r3, [pc, #16]	; (8000d48 <st7781_reset_clear+0x18>)
 8000d38:	3b01      	subs	r3, #1
 8000d3a:	d001      	beq.n	8000d40 <st7781_reset_clear+0x10>
 8000d3c:	bf00      	nop
 8000d3e:	e7fb      	b.n	8000d38 <st7781_reset_clear+0x8>
 8000d40:	4770      	bx	lr
 8000d42:	bf00      	nop
 8000d44:	40020800 	.word	0x40020800
 8000d48:	000c3501 	.word	0x000c3501

08000d4c <st7781_reset_init>:
 8000d4c:	b507      	push	{r0, r1, r2, lr}
 8000d4e:	2380      	movs	r3, #128	; 0x80
 8000d50:	9300      	str	r3, [sp, #0]
 8000d52:	2301      	movs	r3, #1
 8000d54:	2203      	movs	r2, #3
 8000d56:	480a      	ldr	r0, [pc, #40]	; (8000d80 <st7781_reset_init+0x34>)
 8000d58:	f88d 3004 	strb.w	r3, [sp, #4]
 8000d5c:	4669      	mov	r1, sp
 8000d5e:	2300      	movs	r3, #0
 8000d60:	f88d 3006 	strb.w	r3, [sp, #6]
 8000d64:	f88d 2005 	strb.w	r2, [sp, #5]
 8000d68:	f88d 3007 	strb.w	r3, [sp, #7]
 8000d6c:	f000 fd78 	bl	8001860 <GPIO_Init>
 8000d70:	f7ff ffde 	bl	8000d30 <st7781_reset_clear>
 8000d74:	f7ff ffce 	bl	8000d14 <st7781_reset_set>
 8000d78:	b003      	add	sp, #12
 8000d7a:	f85d fb04 	ldr.w	pc, [sp], #4
 8000d7e:	bf00      	nop
 8000d80:	40020800 	.word	0x40020800

08000d84 <st7781_d_set>:
 8000d84:	4b1f      	ldr	r3, [pc, #124]	; (8000e04 <st7781_d_set+0x80>)
 8000d86:	f010 0f01 	tst.w	r0, #1
 8000d8a:	f04f 0240 	mov.w	r2, #64	; 0x40
 8000d8e:	bf14      	ite	ne
 8000d90:	831a      	strhne	r2, [r3, #24]
 8000d92:	835a      	strheq	r2, [r3, #26]
 8000d94:	f010 0f02 	tst.w	r0, #2
 8000d98:	f04f 0280 	mov.w	r2, #128	; 0x80
 8000d9c:	bf14      	ite	ne
 8000d9e:	831a      	strhne	r2, [r3, #24]
 8000da0:	835a      	strheq	r2, [r3, #26]
 8000da2:	4b18      	ldr	r3, [pc, #96]	; (8000e04 <st7781_d_set+0x80>)
 8000da4:	f010 0f04 	tst.w	r0, #4
 8000da8:	f04f 0201 	mov.w	r2, #1
 8000dac:	bf14      	ite	ne
 8000dae:	831a      	strhne	r2, [r3, #24]
 8000db0:	835a      	strheq	r2, [r3, #26]
 8000db2:	f010 0f08 	tst.w	r0, #8
 8000db6:	f04f 0202 	mov.w	r2, #2
 8000dba:	bf14      	ite	ne
 8000dbc:	831a      	strhne	r2, [r3, #24]
 8000dbe:	835a      	strheq	r2, [r3, #26]
 8000dc0:	4b10      	ldr	r3, [pc, #64]	; (8000e04 <st7781_d_set+0x80>)
 8000dc2:	f010 0f10 	tst.w	r0, #16
 8000dc6:	f04f 0204 	mov.w	r2, #4
 8000dca:	bf14      	ite	ne
 8000dcc:	831a      	strhne	r2, [r3, #24]
 8000dce:	835a      	strheq	r2, [r3, #26]
 8000dd0:	f010 0f20 	tst.w	r0, #32
 8000dd4:	f04f 0208 	mov.w	r2, #8
 8000dd8:	bf14      	ite	ne
 8000dda:	831a      	strhne	r2, [r3, #24]
 8000ddc:	835a      	strheq	r2, [r3, #26]
 8000dde:	4b09      	ldr	r3, [pc, #36]	; (8000e04 <st7781_d_set+0x80>)
 8000de0:	f010 0f40 	tst.w	r0, #64	; 0x40
 8000de4:	f04f 0210 	mov.w	r2, #16
 8000de8:	bf14      	ite	ne
 8000dea:	831a      	strhne	r2, [r3, #24]
 8000dec:	835a      	strheq	r2, [r3, #26]
 8000dee:	f010 0f80 	tst.w	r0, #128	; 0x80
 8000df2:	f04f 0220 	mov.w	r2, #32
 8000df6:	bf14      	ite	ne
 8000df8:	831a      	strhne	r2, [r3, #24]
 8000dfa:	835a      	strheq	r2, [r3, #26]
 8000dfc:	bf00      	nop
 8000dfe:	bf00      	nop
 8000e00:	4770      	bx	lr
 8000e02:	bf00      	nop
 8000e04:	40021400 	.word	0x40021400

08000e08 <st7781_d_init>:
 8000e08:	b5f7      	push	{r0, r1, r2, r4, r5, r6, r7, lr}
 8000e0a:	4d21      	ldr	r5, [pc, #132]	; (8000e90 <st7781_d_init+0x88>)
 8000e0c:	2303      	movs	r3, #3
 8000e0e:	ac02      	add	r4, sp, #8
 8000e10:	2600      	movs	r6, #0
 8000e12:	2701      	movs	r7, #1
 8000e14:	f88d 3005 	strb.w	r3, [sp, #5]
 8000e18:	4628      	mov	r0, r5
 8000e1a:	2340      	movs	r3, #64	; 0x40
 8000e1c:	4669      	mov	r1, sp
 8000e1e:	f844 3d08 	str.w	r3, [r4, #-8]!
 8000e22:	f88d 7004 	strb.w	r7, [sp, #4]
 8000e26:	f88d 6006 	strb.w	r6, [sp, #6]
 8000e2a:	f88d 6007 	strb.w	r6, [sp, #7]
 8000e2e:	f000 fd17 	bl	8001860 <GPIO_Init>
 8000e32:	2380      	movs	r3, #128	; 0x80
 8000e34:	4628      	mov	r0, r5
 8000e36:	4669      	mov	r1, sp
 8000e38:	9300      	str	r3, [sp, #0]
 8000e3a:	f000 fd11 	bl	8001860 <GPIO_Init>
 8000e3e:	4628      	mov	r0, r5
 8000e40:	4669      	mov	r1, sp
 8000e42:	9700      	str	r7, [sp, #0]
 8000e44:	f000 fd0c 	bl	8001860 <GPIO_Init>
 8000e48:	2302      	movs	r3, #2
 8000e4a:	4628      	mov	r0, r5
 8000e4c:	4669      	mov	r1, sp
 8000e4e:	9300      	str	r3, [sp, #0]
 8000e50:	f000 fd06 	bl	8001860 <GPIO_Init>
 8000e54:	2304      	movs	r3, #4
 8000e56:	4628      	mov	r0, r5
 8000e58:	4669      	mov	r1, sp
 8000e5a:	9300      	str	r3, [sp, #0]
 8000e5c:	f000 fd00 	bl	8001860 <GPIO_Init>
 8000e60:	2308      	movs	r3, #8
 8000e62:	4628      	mov	r0, r5
 8000e64:	4669      	mov	r1, sp
 8000e66:	9300      	str	r3, [sp, #0]
 8000e68:	f000 fcfa 	bl	8001860 <GPIO_Init>
 8000e6c:	2310      	movs	r3, #16
 8000e6e:	4628      	mov	r0, r5
 8000e70:	4669      	mov	r1, sp
 8000e72:	9300      	str	r3, [sp, #0]
 8000e74:	f000 fcf4 	bl	8001860 <GPIO_Init>
 8000e78:	2320      	movs	r3, #32
 8000e7a:	4628      	mov	r0, r5
 8000e7c:	4669      	mov	r1, sp
 8000e7e:	9300      	str	r3, [sp, #0]
 8000e80:	f000 fcee 	bl	8001860 <GPIO_Init>
 8000e84:	4630      	mov	r0, r6
 8000e86:	f7ff ff7d 	bl	8000d84 <st7781_d_set>
 8000e8a:	b003      	add	sp, #12
 8000e8c:	bdf0      	pop	{r4, r5, r6, r7, pc}
 8000e8e:	bf00      	nop
 8000e90:	40021400 	.word	0x40021400

08000e94 <thread_02>:
 8000e94:	b510      	push	{r4, lr}
 8000e96:	2400      	movs	r4, #0
 8000e98:	4621      	mov	r1, r4
 8000e9a:	4803      	ldr	r0, [pc, #12]	; (8000ea8 <thread_02+0x14>)
 8000e9c:	3401      	adds	r4, #1
 8000e9e:	f7ff fb31 	bl	8000504 <printf_>
 8000ea2:	2c0a      	cmp	r4, #10
 8000ea4:	d1f8      	bne.n	8000e98 <thread_02+0x4>
 8000ea6:	bd10      	pop	{r4, pc}
 8000ea8:	08001a0c 	.word	0x08001a0c

08000eac <thread_01>:
 8000eac:	b510      	push	{r4, lr}
 8000eae:	f44f 4080 	mov.w	r0, #16384	; 0x4000
 8000eb2:	f000 fc79 	bl	80017a8 <led_on>
 8000eb6:	4812      	ldr	r0, [pc, #72]	; (8000f00 <thread_01+0x54>)
 8000eb8:	f7ff fb24 	bl	8000504 <printf_>
 8000ebc:	4811      	ldr	r0, [pc, #68]	; (8000f04 <thread_01+0x58>)
 8000ebe:	f7ff fb21 	bl	8000504 <printf_>
 8000ec2:	4811      	ldr	r0, [pc, #68]	; (8000f08 <thread_01+0x5c>)
 8000ec4:	4911      	ldr	r1, [pc, #68]	; (8000f0c <thread_01+0x60>)
 8000ec6:	f44f 7200 	mov.w	r2, #512	; 0x200
 8000eca:	2308      	movs	r3, #8
 8000ecc:	f7ff f9de 	bl	800028c <create_thread>
 8000ed0:	2808      	cmp	r0, #8
 8000ed2:	4604      	mov	r4, r0
 8000ed4:	d101      	bne.n	8000eda <thread_01+0x2e>
 8000ed6:	480e      	ldr	r0, [pc, #56]	; (8000f10 <thread_01+0x64>)
 8000ed8:	e007      	b.n	8000eea <thread_01+0x3e>
 8000eda:	480e      	ldr	r0, [pc, #56]	; (8000f14 <thread_01+0x68>)
 8000edc:	4621      	mov	r1, r4
 8000ede:	f7ff fb11 	bl	8000504 <printf_>
 8000ee2:	4620      	mov	r0, r4
 8000ee4:	f7ff fa62 	bl	80003ac <join>
 8000ee8:	480b      	ldr	r0, [pc, #44]	; (8000f18 <thread_01+0x6c>)
 8000eea:	f7ff fb0b 	bl	8000504 <printf_>
 8000eee:	f44f 4080 	mov.w	r0, #16384	; 0x4000
 8000ef2:	f000 fc61 	bl	80017b8 <led_off>
 8000ef6:	f44f 70fa 	mov.w	r0, #500	; 0x1f4
 8000efa:	f000 f92d 	bl	8001158 <timer_delay_ms>
 8000efe:	e7d6      	b.n	8000eae <thread_01+0x2>
 8000f00:	08001a2a 	.word	0x08001a2a
 8000f04:	08001a34 	.word	0x08001a34
 8000f08:	08000e95 	.word	0x08000e95
 8000f0c:	20000828 	.word	0x20000828
 8000f10:	08001a4b 	.word	0x08001a4b
 8000f14:	08001a62 	.word	0x08001a62
 8000f18:	080019b7 	.word	0x080019b7

08000f1c <thread_03>:
 8000f1c:	b508      	push	{r3, lr}
 8000f1e:	4803      	ldr	r0, [pc, #12]	; (8000f2c <thread_03+0x10>)
 8000f20:	f7ff faf0 	bl	8000504 <printf_>
 8000f24:	2064      	movs	r0, #100	; 0x64
 8000f26:	f000 f917 	bl	8001158 <timer_delay_ms>
 8000f2a:	e7f8      	b.n	8000f1e <thread_03+0x2>
 8000f2c:	08001a7e 	.word	0x08001a7e

08000f30 <main_thread>:
 8000f30:	b537      	push	{r0, r1, r2, r4, r5, lr}
 8000f32:	481b      	ldr	r0, [pc, #108]	; (8000fa0 <main_thread+0x70>)
 8000f34:	f7ff fae6 	bl	8000504 <printf_>
 8000f38:	f7ff fc6a 	bl	8000810 <gyro_init>
 8000f3c:	f7ff fd1e 	bl	800097c <pca9685_init>
 8000f40:	f7ff fd18 	bl	8000974 <motor_init>
 8000f44:	4917      	ldr	r1, [pc, #92]	; (8000fa4 <main_thread+0x74>)
 8000f46:	4818      	ldr	r0, [pc, #96]	; (8000fa8 <main_thread+0x78>)
 8000f48:	f44f 7200 	mov.w	r2, #512	; 0x200
 8000f4c:	2308      	movs	r3, #8
 8000f4e:	f7ff f99d 	bl	800028c <create_thread>
 8000f52:	4916      	ldr	r1, [pc, #88]	; (8000fac <main_thread+0x7c>)
 8000f54:	4816      	ldr	r0, [pc, #88]	; (8000fb0 <main_thread+0x80>)
 8000f56:	f44f 7200 	mov.w	r2, #512	; 0x200
 8000f5a:	2308      	movs	r3, #8
 8000f5c:	f7ff f996 	bl	800028c <create_thread>
 8000f60:	f7ff fdce 	bl	8000b00 <st7781_init>
 8000f64:	2400      	movs	r4, #0
 8000f66:	4625      	mov	r5, r4
 8000f68:	2332      	movs	r3, #50	; 0x32
 8000f6a:	9300      	str	r3, [sp, #0]
 8000f6c:	4628      	mov	r0, r5
 8000f6e:	4621      	mov	r1, r4
 8000f70:	2296      	movs	r2, #150	; 0x96
 8000f72:	2364      	movs	r3, #100	; 0x64
 8000f74:	3501      	adds	r5, #1
 8000f76:	f7ff fda8 	bl	8000aca <st7781_put_pixel>
 8000f7a:	2d64      	cmp	r5, #100	; 0x64
 8000f7c:	d905      	bls.n	8000f8a <main_thread+0x5a>
 8000f7e:	f44f 4000 	mov.w	r0, #32768	; 0x8000
 8000f82:	f000 fc11 	bl	80017a8 <led_on>
 8000f86:	3401      	adds	r4, #1
 8000f88:	2500      	movs	r5, #0
 8000f8a:	2002      	movs	r0, #2
 8000f8c:	f000 f8e4 	bl	8001158 <timer_delay_ms>
 8000f90:	f44f 4000 	mov.w	r0, #32768	; 0x8000
 8000f94:	2c64      	cmp	r4, #100	; 0x64
 8000f96:	bf88      	it	hi
 8000f98:	2400      	movhi	r4, #0
 8000f9a:	f000 fc0d 	bl	80017b8 <led_off>
 8000f9e:	e7e3      	b.n	8000f68 <main_thread+0x38>
 8000fa0:	08001a8f 	.word	0x08001a8f
 8000fa4:	20000628 	.word	0x20000628
 8000fa8:	08000ead 	.word	0x08000ead
 8000fac:	20000a28 	.word	0x20000a28
 8000fb0:	08000f1d 	.word	0x08000f1d

08000fb4 <TIM_TimeBaseInit>:
 8000fb4:	4a1c      	ldr	r2, [pc, #112]	; (8001028 <TIM_TimeBaseInit+0x74>)
 8000fb6:	8803      	ldrh	r3, [r0, #0]
 8000fb8:	4290      	cmp	r0, r2
 8000fba:	b29b      	uxth	r3, r3
 8000fbc:	d012      	beq.n	8000fe4 <TIM_TimeBaseInit+0x30>
 8000fbe:	f502 6280 	add.w	r2, r2, #1024	; 0x400
 8000fc2:	4290      	cmp	r0, r2
 8000fc4:	d00e      	beq.n	8000fe4 <TIM_TimeBaseInit+0x30>
 8000fc6:	f1b0 4f80 	cmp.w	r0, #1073741824	; 0x40000000
 8000fca:	d00b      	beq.n	8000fe4 <TIM_TimeBaseInit+0x30>
 8000fcc:	f5a2 3280 	sub.w	r2, r2, #65536	; 0x10000
 8000fd0:	4290      	cmp	r0, r2
 8000fd2:	d007      	beq.n	8000fe4 <TIM_TimeBaseInit+0x30>
 8000fd4:	f502 6280 	add.w	r2, r2, #1024	; 0x400
 8000fd8:	4290      	cmp	r0, r2
 8000fda:	d003      	beq.n	8000fe4 <TIM_TimeBaseInit+0x30>
 8000fdc:	f502 6280 	add.w	r2, r2, #1024	; 0x400
 8000fe0:	4290      	cmp	r0, r2
 8000fe2:	d103      	bne.n	8000fec <TIM_TimeBaseInit+0x38>
 8000fe4:	884a      	ldrh	r2, [r1, #2]
 8000fe6:	f023 0370 	bic.w	r3, r3, #112	; 0x70
 8000fea:	4313      	orrs	r3, r2
 8000fec:	4a0f      	ldr	r2, [pc, #60]	; (800102c <TIM_TimeBaseInit+0x78>)
 8000fee:	4290      	cmp	r0, r2
 8000ff0:	d008      	beq.n	8001004 <TIM_TimeBaseInit+0x50>
 8000ff2:	f502 6280 	add.w	r2, r2, #1024	; 0x400
 8000ff6:	4290      	cmp	r0, r2
 8000ff8:	d004      	beq.n	8001004 <TIM_TimeBaseInit+0x50>
 8000ffa:	f423 7340 	bic.w	r3, r3, #768	; 0x300
 8000ffe:	890a      	ldrh	r2, [r1, #8]
 8001000:	b29b      	uxth	r3, r3
 8001002:	4313      	orrs	r3, r2
 8001004:	8003      	strh	r3, [r0, #0]
 8001006:	684b      	ldr	r3, [r1, #4]
 8001008:	62c3      	str	r3, [r0, #44]	; 0x2c
 800100a:	880b      	ldrh	r3, [r1, #0]
 800100c:	8503      	strh	r3, [r0, #40]	; 0x28
 800100e:	4b06      	ldr	r3, [pc, #24]	; (8001028 <TIM_TimeBaseInit+0x74>)
 8001010:	4298      	cmp	r0, r3
 8001012:	d003      	beq.n	800101c <TIM_TimeBaseInit+0x68>
 8001014:	f503 6380 	add.w	r3, r3, #1024	; 0x400
 8001018:	4298      	cmp	r0, r3
 800101a:	d101      	bne.n	8001020 <TIM_TimeBaseInit+0x6c>
 800101c:	7a8b      	ldrb	r3, [r1, #10]
 800101e:	8603      	strh	r3, [r0, #48]	; 0x30
 8001020:	2301      	movs	r3, #1
 8001022:	8283      	strh	r3, [r0, #20]
 8001024:	4770      	bx	lr
 8001026:	bf00      	nop
 8001028:	40010000 	.word	0x40010000
 800102c:	40001000 	.word	0x40001000

08001030 <TIM_Cmd>:
 8001030:	8803      	ldrh	r3, [r0, #0]
 8001032:	b119      	cbz	r1, 800103c <TIM_Cmd+0xc>
 8001034:	b29b      	uxth	r3, r3
 8001036:	f043 0301 	orr.w	r3, r3, #1
 800103a:	e003      	b.n	8001044 <TIM_Cmd+0x14>
 800103c:	f023 0301 	bic.w	r3, r3, #1
 8001040:	041b      	lsls	r3, r3, #16
 8001042:	0c1b      	lsrs	r3, r3, #16
 8001044:	8003      	strh	r3, [r0, #0]
 8001046:	4770      	bx	lr

08001048 <TIM_ClearITPendingBit>:
 8001048:	43c9      	mvns	r1, r1
 800104a:	b289      	uxth	r1, r1
 800104c:	8201      	strh	r1, [r0, #16]
 800104e:	4770      	bx	lr

08001050 <timer_init>:
 8001050:	b530      	push	{r4, r5, lr}
 8001052:	2000      	movs	r0, #0
 8001054:	b085      	sub	sp, #20
 8001056:	4a1e      	ldr	r2, [pc, #120]	; (80010d0 <timer_init+0x80>)
 8001058:	f44f 6380 	mov.w	r3, #1024	; 0x400
 800105c:	f822 3010 	strh.w	r3, [r2, r0, lsl #1]
 8001060:	4a1c      	ldr	r2, [pc, #112]	; (80010d4 <timer_init+0x84>)
 8001062:	f822 3010 	strh.w	r3, [r2, r0, lsl #1]
 8001066:	4b1c      	ldr	r3, [pc, #112]	; (80010d8 <timer_init+0x88>)
 8001068:	2400      	movs	r4, #0
 800106a:	f823 4010 	strh.w	r4, [r3, r0, lsl #1]
 800106e:	3001      	adds	r0, #1
 8001070:	2804      	cmp	r0, #4
 8001072:	4625      	mov	r5, r4
 8001074:	d1ef      	bne.n	8001056 <timer_init+0x6>
 8001076:	4b19      	ldr	r3, [pc, #100]	; (80010dc <timer_init+0x8c>)
 8001078:	2101      	movs	r1, #1
 800107a:	601c      	str	r4, [r3, #0]
 800107c:	f000 fb6e 	bl	800175c <RCC_APB1PeriphClockCmd>
 8001080:	f8ad 4006 	strh.w	r4, [sp, #6]
 8001084:	f8ad 400c 	strh.w	r4, [sp, #12]
 8001088:	f88d 400e 	strb.w	r4, [sp, #14]
 800108c:	4c14      	ldr	r4, [pc, #80]	; (80010e0 <timer_init+0x90>)
 800108e:	2353      	movs	r3, #83	; 0x53
 8001090:	f8ad 3004 	strh.w	r3, [sp, #4]
 8001094:	4620      	mov	r0, r4
 8001096:	2331      	movs	r3, #49	; 0x31
 8001098:	a901      	add	r1, sp, #4
 800109a:	9302      	str	r3, [sp, #8]
 800109c:	f7ff ff8a 	bl	8000fb4 <TIM_TimeBaseInit>
 80010a0:	4620      	mov	r0, r4
 80010a2:	2101      	movs	r1, #1
 80010a4:	f7ff ffc4 	bl	8001030 <TIM_Cmd>
 80010a8:	89a3      	ldrh	r3, [r4, #12]
 80010aa:	b29b      	uxth	r3, r3
 80010ac:	f043 0301 	orr.w	r3, r3, #1
 80010b0:	81a3      	strh	r3, [r4, #12]
 80010b2:	231e      	movs	r3, #30
 80010b4:	f88d 3000 	strb.w	r3, [sp]
 80010b8:	4668      	mov	r0, sp
 80010ba:	2301      	movs	r3, #1
 80010bc:	f88d 5001 	strb.w	r5, [sp, #1]
 80010c0:	f88d 3002 	strb.w	r3, [sp, #2]
 80010c4:	f88d 3003 	strb.w	r3, [sp, #3]
 80010c8:	f000 fc22 	bl	8001910 <NVIC_Init>
 80010cc:	b005      	add	sp, #20
 80010ce:	bd30      	pop	{r4, r5, pc}
 80010d0:	20000c3c 	.word	0x20000c3c
 80010d4:	20000c30 	.word	0x20000c30
 80010d8:	20000c28 	.word	0x20000c28
 80010dc:	20000c38 	.word	0x20000c38
 80010e0:	40000800 	.word	0x40000800

080010e4 <TIM4_IRQHandler>:
 80010e4:	2300      	movs	r3, #0
 80010e6:	4a10      	ldr	r2, [pc, #64]	; (8001128 <TIM4_IRQHandler+0x44>)
 80010e8:	f832 1013 	ldrh.w	r1, [r2, r3, lsl #1]
 80010ec:	b289      	uxth	r1, r1
 80010ee:	b129      	cbz	r1, 80010fc <TIM4_IRQHandler+0x18>
 80010f0:	f832 1013 	ldrh.w	r1, [r2, r3, lsl #1]
 80010f4:	b289      	uxth	r1, r1
 80010f6:	3901      	subs	r1, #1
 80010f8:	b289      	uxth	r1, r1
 80010fa:	e007      	b.n	800110c <TIM4_IRQHandler+0x28>
 80010fc:	490b      	ldr	r1, [pc, #44]	; (800112c <TIM4_IRQHandler+0x48>)
 80010fe:	f831 1013 	ldrh.w	r1, [r1, r3, lsl #1]
 8001102:	b289      	uxth	r1, r1
 8001104:	f822 1013 	strh.w	r1, [r2, r3, lsl #1]
 8001108:	4a09      	ldr	r2, [pc, #36]	; (8001130 <TIM4_IRQHandler+0x4c>)
 800110a:	2101      	movs	r1, #1
 800110c:	f822 1013 	strh.w	r1, [r2, r3, lsl #1]
 8001110:	3301      	adds	r3, #1
 8001112:	2b04      	cmp	r3, #4
 8001114:	d1e7      	bne.n	80010e6 <TIM4_IRQHandler+0x2>
 8001116:	4b07      	ldr	r3, [pc, #28]	; (8001134 <TIM4_IRQHandler+0x50>)
 8001118:	4807      	ldr	r0, [pc, #28]	; (8001138 <TIM4_IRQHandler+0x54>)
 800111a:	681a      	ldr	r2, [r3, #0]
 800111c:	2101      	movs	r1, #1
 800111e:	3201      	adds	r2, #1
 8001120:	601a      	str	r2, [r3, #0]
 8001122:	f7ff bf91 	b.w	8001048 <TIM_ClearITPendingBit>
 8001126:	bf00      	nop
 8001128:	20000c3c 	.word	0x20000c3c
 800112c:	20000c30 	.word	0x20000c30
 8001130:	20000c28 	.word	0x20000c28
 8001134:	20000c38 	.word	0x20000c38
 8001138:	40000800 	.word	0x40000800

0800113c <timer_get_time>:
 800113c:	b082      	sub	sp, #8
 800113e:	b672      	cpsid	i
 8001140:	4b04      	ldr	r3, [pc, #16]	; (8001154 <timer_get_time+0x18>)
 8001142:	681b      	ldr	r3, [r3, #0]
 8001144:	9301      	str	r3, [sp, #4]
 8001146:	b662      	cpsie	i
 8001148:	9801      	ldr	r0, [sp, #4]
 800114a:	230a      	movs	r3, #10
 800114c:	fbb0 f0f3 	udiv	r0, r0, r3
 8001150:	b002      	add	sp, #8
 8001152:	4770      	bx	lr
 8001154:	20000c38 	.word	0x20000c38

08001158 <timer_delay_ms>:
 8001158:	b513      	push	{r0, r1, r4, lr}
 800115a:	4604      	mov	r4, r0
 800115c:	f7ff ffee 	bl	800113c <timer_get_time>
 8001160:	4420      	add	r0, r4
 8001162:	9001      	str	r0, [sp, #4]
 8001164:	9c01      	ldr	r4, [sp, #4]
 8001166:	f7ff ffe9 	bl	800113c <timer_get_time>
 800116a:	4284      	cmp	r4, r0
 800116c:	d902      	bls.n	8001174 <timer_delay_ms+0x1c>
 800116e:	f000 f9dd 	bl	800152c <sleep>
 8001172:	e7f7      	b.n	8001164 <timer_delay_ms+0xc>
 8001174:	b002      	add	sp, #8
 8001176:	bd10      	pop	{r4, pc}

08001178 <i2c_delay>:
 8001178:	bf00      	nop
 800117a:	bf00      	nop
 800117c:	4770      	bx	lr
	...

08001180 <SetLowSDA>:
 8001180:	b537      	push	{r0, r1, r2, r4, r5, lr}
 8001182:	4d0d      	ldr	r5, [pc, #52]	; (80011b8 <SetLowSDA+0x38>)
 8001184:	2301      	movs	r3, #1
 8001186:	2202      	movs	r2, #2
 8001188:	2440      	movs	r4, #64	; 0x40
 800118a:	f88d 3004 	strb.w	r3, [sp, #4]
 800118e:	f88d 3006 	strb.w	r3, [sp, #6]
 8001192:	4628      	mov	r0, r5
 8001194:	2300      	movs	r3, #0
 8001196:	4669      	mov	r1, sp
 8001198:	f88d 2005 	strb.w	r2, [sp, #5]
 800119c:	f88d 3007 	strb.w	r3, [sp, #7]
 80011a0:	9400      	str	r4, [sp, #0]
 80011a2:	f000 fb5d 	bl	8001860 <GPIO_Init>
 80011a6:	4628      	mov	r0, r5
 80011a8:	4621      	mov	r1, r4
 80011aa:	f000 fb9c 	bl	80018e6 <GPIO_ResetBits>
 80011ae:	f7ff ffe3 	bl	8001178 <i2c_delay>
 80011b2:	b003      	add	sp, #12
 80011b4:	bd30      	pop	{r4, r5, pc}
 80011b6:	bf00      	nop
 80011b8:	40020000 	.word	0x40020000

080011bc <SetHighSDA>:
 80011bc:	b537      	push	{r0, r1, r2, r4, r5, lr}
 80011be:	4d0d      	ldr	r5, [pc, #52]	; (80011f4 <SetHighSDA+0x38>)
 80011c0:	2202      	movs	r2, #2
 80011c2:	2300      	movs	r3, #0
 80011c4:	2440      	movs	r4, #64	; 0x40
 80011c6:	f88d 2005 	strb.w	r2, [sp, #5]
 80011ca:	4628      	mov	r0, r5
 80011cc:	2201      	movs	r2, #1
 80011ce:	4669      	mov	r1, sp
 80011d0:	f88d 3004 	strb.w	r3, [sp, #4]
 80011d4:	f88d 2006 	strb.w	r2, [sp, #6]
 80011d8:	f88d 3007 	strb.w	r3, [sp, #7]
 80011dc:	9400      	str	r4, [sp, #0]
 80011de:	f000 fb3f 	bl	8001860 <GPIO_Init>
 80011e2:	4628      	mov	r0, r5
 80011e4:	4621      	mov	r1, r4
 80011e6:	f000 fb7c 	bl	80018e2 <GPIO_SetBits>
 80011ea:	f7ff ffc5 	bl	8001178 <i2c_delay>
 80011ee:	b003      	add	sp, #12
 80011f0:	bd30      	pop	{r4, r5, pc}
 80011f2:	bf00      	nop
 80011f4:	40020000 	.word	0x40020000

080011f8 <SetLowSCL>:
 80011f8:	b508      	push	{r3, lr}
 80011fa:	4804      	ldr	r0, [pc, #16]	; (800120c <SetLowSCL+0x14>)
 80011fc:	2180      	movs	r1, #128	; 0x80
 80011fe:	f000 fb72 	bl	80018e6 <GPIO_ResetBits>
 8001202:	e8bd 4008 	ldmia.w	sp!, {r3, lr}
 8001206:	f7ff bfb7 	b.w	8001178 <i2c_delay>
 800120a:	bf00      	nop
 800120c:	40020000 	.word	0x40020000

08001210 <SetHighSCL>:
 8001210:	b508      	push	{r3, lr}
 8001212:	4804      	ldr	r0, [pc, #16]	; (8001224 <SetHighSCL+0x14>)
 8001214:	2180      	movs	r1, #128	; 0x80
 8001216:	f000 fb64 	bl	80018e2 <GPIO_SetBits>
 800121a:	e8bd 4008 	ldmia.w	sp!, {r3, lr}
 800121e:	f7ff bfab 	b.w	8001178 <i2c_delay>
 8001222:	bf00      	nop
 8001224:	40020000 	.word	0x40020000

08001228 <i2c_0_init>:
 8001228:	b507      	push	{r0, r1, r2, lr}
 800122a:	2001      	movs	r0, #1
 800122c:	4601      	mov	r1, r0
 800122e:	f000 fa89 	bl	8001744 <RCC_AHB1PeriphClockCmd>
 8001232:	23c0      	movs	r3, #192	; 0xc0
 8001234:	9300      	str	r3, [sp, #0]
 8001236:	2301      	movs	r3, #1
 8001238:	2202      	movs	r2, #2
 800123a:	480b      	ldr	r0, [pc, #44]	; (8001268 <i2c_0_init+0x40>)
 800123c:	f88d 3004 	strb.w	r3, [sp, #4]
 8001240:	4669      	mov	r1, sp
 8001242:	f88d 3006 	strb.w	r3, [sp, #6]
 8001246:	2300      	movs	r3, #0
 8001248:	f88d 2005 	strb.w	r2, [sp, #5]
 800124c:	f88d 3007 	strb.w	r3, [sp, #7]
 8001250:	f000 fb06 	bl	8001860 <GPIO_Init>
 8001254:	f7ff ffdc 	bl	8001210 <SetHighSCL>
 8001258:	f7ff ff92 	bl	8001180 <SetLowSDA>
 800125c:	f7ff ffae 	bl	80011bc <SetHighSDA>
 8001260:	b003      	add	sp, #12
 8001262:	f85d fb04 	ldr.w	pc, [sp], #4
 8001266:	bf00      	nop
 8001268:	40020000 	.word	0x40020000

0800126c <i2cStart>:
 800126c:	b508      	push	{r3, lr}
 800126e:	f7ff ffcf 	bl	8001210 <SetHighSCL>
 8001272:	f7ff ffa3 	bl	80011bc <SetHighSDA>
 8001276:	f7ff ffcb 	bl	8001210 <SetHighSCL>
 800127a:	f7ff ff81 	bl	8001180 <SetLowSDA>
 800127e:	f7ff ffbb 	bl	80011f8 <SetLowSCL>
 8001282:	e8bd 4008 	ldmia.w	sp!, {r3, lr}
 8001286:	f7ff bf99 	b.w	80011bc <SetHighSDA>

0800128a <i2cStop>:
 800128a:	b508      	push	{r3, lr}
 800128c:	f7ff ffb4 	bl	80011f8 <SetLowSCL>
 8001290:	f7ff ff76 	bl	8001180 <SetLowSDA>
 8001294:	f7ff ffbc 	bl	8001210 <SetHighSCL>
 8001298:	f7ff ff72 	bl	8001180 <SetLowSDA>
 800129c:	f7ff ffb8 	bl	8001210 <SetHighSCL>
 80012a0:	e8bd 4008 	ldmia.w	sp!, {r3, lr}
 80012a4:	f7ff bf8a 	b.w	80011bc <SetHighSDA>

080012a8 <i2cWrite>:
 80012a8:	b538      	push	{r3, r4, r5, lr}
 80012aa:	4604      	mov	r4, r0
 80012ac:	2508      	movs	r5, #8
 80012ae:	f7ff ffa3 	bl	80011f8 <SetLowSCL>
 80012b2:	0623      	lsls	r3, r4, #24
 80012b4:	d502      	bpl.n	80012bc <i2cWrite+0x14>
 80012b6:	f7ff ff81 	bl	80011bc <SetHighSDA>
 80012ba:	e001      	b.n	80012c0 <i2cWrite+0x18>
 80012bc:	f7ff ff60 	bl	8001180 <SetLowSDA>
 80012c0:	3d01      	subs	r5, #1
 80012c2:	f7ff ffa5 	bl	8001210 <SetHighSCL>
 80012c6:	0064      	lsls	r4, r4, #1
 80012c8:	f015 05ff 	ands.w	r5, r5, #255	; 0xff
 80012cc:	b2e4      	uxtb	r4, r4
 80012ce:	d1ee      	bne.n	80012ae <i2cWrite+0x6>
 80012d0:	f7ff ff92 	bl	80011f8 <SetLowSCL>
 80012d4:	f7ff ff72 	bl	80011bc <SetHighSDA>
 80012d8:	f7ff ff9a 	bl	8001210 <SetHighSCL>
 80012dc:	4b05      	ldr	r3, [pc, #20]	; (80012f4 <i2cWrite+0x4c>)
 80012de:	691c      	ldr	r4, [r3, #16]
 80012e0:	f7ff ff8a 	bl	80011f8 <SetLowSCL>
 80012e4:	f7ff ff48 	bl	8001178 <i2c_delay>
 80012e8:	f084 0040 	eor.w	r0, r4, #64	; 0x40
 80012ec:	f3c0 1080 	ubfx	r0, r0, #6, #1
 80012f0:	bd38      	pop	{r3, r4, r5, pc}
 80012f2:	bf00      	nop
 80012f4:	40020000 	.word	0x40020000

080012f8 <i2cRead>:
 80012f8:	b570      	push	{r4, r5, r6, lr}
 80012fa:	4606      	mov	r6, r0
 80012fc:	f7ff ff7c 	bl	80011f8 <SetLowSCL>
 8001300:	f7ff ff5c 	bl	80011bc <SetHighSDA>
 8001304:	2508      	movs	r5, #8
 8001306:	2400      	movs	r4, #0
 8001308:	f7ff ff82 	bl	8001210 <SetHighSCL>
 800130c:	4b0d      	ldr	r3, [pc, #52]	; (8001344 <i2cRead+0x4c>)
 800130e:	691b      	ldr	r3, [r3, #16]
 8001310:	0064      	lsls	r4, r4, #1
 8001312:	065a      	lsls	r2, r3, #25
 8001314:	b2e4      	uxtb	r4, r4
 8001316:	bf48      	it	mi
 8001318:	3401      	addmi	r4, #1
 800131a:	f105 35ff 	add.w	r5, r5, #4294967295
 800131e:	bf48      	it	mi
 8001320:	b2e4      	uxtbmi	r4, r4
 8001322:	f7ff ff69 	bl	80011f8 <SetLowSCL>
 8001326:	f015 05ff 	ands.w	r5, r5, #255	; 0xff
 800132a:	d1ed      	bne.n	8001308 <i2cRead+0x10>
 800132c:	b10e      	cbz	r6, 8001332 <i2cRead+0x3a>
 800132e:	f7ff ff27 	bl	8001180 <SetLowSDA>
 8001332:	f7ff ff6d 	bl	8001210 <SetHighSCL>
 8001336:	f7ff ff5f 	bl	80011f8 <SetLowSCL>
 800133a:	f7ff ff1d 	bl	8001178 <i2c_delay>
 800133e:	4620      	mov	r0, r4
 8001340:	bd70      	pop	{r4, r5, r6, pc}
 8001342:	bf00      	nop
 8001344:	40020000 	.word	0x40020000

08001348 <i2c_write_reg>:
 8001348:	b570      	push	{r4, r5, r6, lr}
 800134a:	4605      	mov	r5, r0
 800134c:	460c      	mov	r4, r1
 800134e:	4616      	mov	r6, r2
 8001350:	f7ff ff8c 	bl	800126c <i2cStart>
 8001354:	4628      	mov	r0, r5
 8001356:	f7ff ffa7 	bl	80012a8 <i2cWrite>
 800135a:	4620      	mov	r0, r4
 800135c:	f7ff ffa4 	bl	80012a8 <i2cWrite>
 8001360:	4630      	mov	r0, r6
 8001362:	f7ff ffa1 	bl	80012a8 <i2cWrite>
 8001366:	e8bd 4070 	ldmia.w	sp!, {r4, r5, r6, lr}
 800136a:	f7ff bf8e 	b.w	800128a <i2cStop>

0800136e <i2c_read_reg>:
 800136e:	b538      	push	{r3, r4, r5, lr}
 8001370:	4604      	mov	r4, r0
 8001372:	460d      	mov	r5, r1
 8001374:	f7ff ff7a 	bl	800126c <i2cStart>
 8001378:	4620      	mov	r0, r4
 800137a:	f7ff ff95 	bl	80012a8 <i2cWrite>
 800137e:	4628      	mov	r0, r5
 8001380:	f7ff ff92 	bl	80012a8 <i2cWrite>
 8001384:	f7ff ff72 	bl	800126c <i2cStart>
 8001388:	f044 0001 	orr.w	r0, r4, #1
 800138c:	f7ff ff8c 	bl	80012a8 <i2cWrite>
 8001390:	2000      	movs	r0, #0
 8001392:	f7ff ffb1 	bl	80012f8 <i2cRead>
 8001396:	4604      	mov	r4, r0
 8001398:	f7ff ff77 	bl	800128a <i2cStop>
 800139c:	4620      	mov	r0, r4
 800139e:	bd38      	pop	{r3, r4, r5, pc}

080013a0 <uart_write>:
 80013a0:	4b03      	ldr	r3, [pc, #12]	; (80013b0 <uart_write+0x10>)
 80013a2:	881a      	ldrh	r2, [r3, #0]
 80013a4:	0652      	lsls	r2, r2, #25
 80013a6:	d401      	bmi.n	80013ac <uart_write+0xc>
 80013a8:	bf00      	nop
 80013aa:	e7f9      	b.n	80013a0 <uart_write>
 80013ac:	8098      	strh	r0, [r3, #4]
 80013ae:	4770      	bx	lr
 80013b0:	40011000 	.word	0x40011000

080013b4 <uart_init>:
 80013b4:	b530      	push	{r4, r5, lr}
 80013b6:	2010      	movs	r0, #16
 80013b8:	b087      	sub	sp, #28
 80013ba:	2101      	movs	r1, #1
 80013bc:	f000 f9da 	bl	8001774 <RCC_APB2PeriphClockCmd>
 80013c0:	2001      	movs	r0, #1
 80013c2:	4d1c      	ldr	r5, [pc, #112]	; (8001434 <uart_init+0x80>)
 80013c4:	4601      	mov	r1, r0
 80013c6:	f000 f9bd 	bl	8001744 <RCC_AHB1PeriphClockCmd>
 80013ca:	f44f 63c0 	mov.w	r3, #1536	; 0x600
 80013ce:	2400      	movs	r4, #0
 80013d0:	9300      	str	r3, [sp, #0]
 80013d2:	4628      	mov	r0, r5
 80013d4:	2302      	movs	r3, #2
 80013d6:	4669      	mov	r1, sp
 80013d8:	f88d 3004 	strb.w	r3, [sp, #4]
 80013dc:	f88d 3005 	strb.w	r3, [sp, #5]
 80013e0:	f88d 4006 	strb.w	r4, [sp, #6]
 80013e4:	f88d 4007 	strb.w	r4, [sp, #7]
 80013e8:	f000 fa3a 	bl	8001860 <GPIO_Init>
 80013ec:	4628      	mov	r0, r5
 80013ee:	2109      	movs	r1, #9
 80013f0:	2207      	movs	r2, #7
 80013f2:	f000 fa7a 	bl	80018ea <GPIO_PinAFConfig>
 80013f6:	2207      	movs	r2, #7
 80013f8:	4628      	mov	r0, r5
 80013fa:	210a      	movs	r1, #10
 80013fc:	f000 fa75 	bl	80018ea <GPIO_PinAFConfig>
 8001400:	f8ad 400c 	strh.w	r4, [sp, #12]
 8001404:	f8ad 400e 	strh.w	r4, [sp, #14]
 8001408:	f8ad 4010 	strh.w	r4, [sp, #16]
 800140c:	f8ad 4014 	strh.w	r4, [sp, #20]
 8001410:	4c09      	ldr	r4, [pc, #36]	; (8001438 <uart_init+0x84>)
 8001412:	f44f 33e1 	mov.w	r3, #115200	; 0x1c200
 8001416:	9302      	str	r3, [sp, #8]
 8001418:	4620      	mov	r0, r4
 800141a:	230c      	movs	r3, #12
 800141c:	a902      	add	r1, sp, #8
 800141e:	f8ad 3012 	strh.w	r3, [sp, #18]
 8001422:	f000 f80b 	bl	800143c <USART_Init>
 8001426:	4620      	mov	r0, r4
 8001428:	2101      	movs	r1, #1
 800142a:	f000 f861 	bl	80014f0 <USART_Cmd>
 800142e:	b007      	add	sp, #28
 8001430:	bd30      	pop	{r4, r5, pc}
 8001432:	bf00      	nop
 8001434:	40020000 	.word	0x40020000
 8001438:	40011000 	.word	0x40011000

0800143c <USART_Init>:
 800143c:	8a03      	ldrh	r3, [r0, #16]
 800143e:	88ca      	ldrh	r2, [r1, #6]
 8001440:	b29b      	uxth	r3, r3
 8001442:	f423 5340 	bic.w	r3, r3, #12288	; 0x3000
 8001446:	b530      	push	{r4, r5, lr}
 8001448:	4313      	orrs	r3, r2
 800144a:	460d      	mov	r5, r1
 800144c:	8203      	strh	r3, [r0, #16]
 800144e:	8983      	ldrh	r3, [r0, #12]
 8001450:	8909      	ldrh	r1, [r1, #8]
 8001452:	88aa      	ldrh	r2, [r5, #4]
 8001454:	f423 53b0 	bic.w	r3, r3, #5632	; 0x1600
 8001458:	430a      	orrs	r2, r1
 800145a:	8969      	ldrh	r1, [r5, #10]
 800145c:	f023 030c 	bic.w	r3, r3, #12
 8001460:	430a      	orrs	r2, r1
 8001462:	041b      	lsls	r3, r3, #16
 8001464:	b292      	uxth	r2, r2
 8001466:	0c1b      	lsrs	r3, r3, #16
 8001468:	4313      	orrs	r3, r2
 800146a:	8183      	strh	r3, [r0, #12]
 800146c:	8a83      	ldrh	r3, [r0, #20]
 800146e:	89aa      	ldrh	r2, [r5, #12]
 8001470:	b29b      	uxth	r3, r3
 8001472:	f423 7340 	bic.w	r3, r3, #768	; 0x300
 8001476:	4313      	orrs	r3, r2
 8001478:	b085      	sub	sp, #20
 800147a:	8283      	strh	r3, [r0, #20]
 800147c:	4604      	mov	r4, r0
 800147e:	4668      	mov	r0, sp
 8001480:	f000 f91c 	bl	80016bc <RCC_GetClocksFreq>
 8001484:	4b19      	ldr	r3, [pc, #100]	; (80014ec <USART_Init+0xb0>)
 8001486:	429c      	cmp	r4, r3
 8001488:	d003      	beq.n	8001492 <USART_Init+0x56>
 800148a:	f503 6380 	add.w	r3, r3, #1024	; 0x400
 800148e:	429c      	cmp	r4, r3
 8001490:	d101      	bne.n	8001496 <USART_Init+0x5a>
 8001492:	9b03      	ldr	r3, [sp, #12]
 8001494:	e000      	b.n	8001498 <USART_Init+0x5c>
 8001496:	9b02      	ldr	r3, [sp, #8]
 8001498:	89a2      	ldrh	r2, [r4, #12]
 800149a:	b212      	sxth	r2, r2
 800149c:	2a00      	cmp	r2, #0
 800149e:	682a      	ldr	r2, [r5, #0]
 80014a0:	f04f 0119 	mov.w	r1, #25
 80014a4:	bfb4      	ite	lt
 80014a6:	0052      	lsllt	r2, r2, #1
 80014a8:	0092      	lslge	r2, r2, #2
 80014aa:	4359      	muls	r1, r3
 80014ac:	fbb1 f1f2 	udiv	r1, r1, r2
 80014b0:	2364      	movs	r3, #100	; 0x64
 80014b2:	fbb1 f2f3 	udiv	r2, r1, r3
 80014b6:	0112      	lsls	r2, r2, #4
 80014b8:	0910      	lsrs	r0, r2, #4
 80014ba:	fb03 1110 	mls	r1, r3, r0, r1
 80014be:	89a0      	ldrh	r0, [r4, #12]
 80014c0:	b200      	sxth	r0, r0
 80014c2:	2800      	cmp	r0, #0
 80014c4:	da06      	bge.n	80014d4 <USART_Init+0x98>
 80014c6:	00c9      	lsls	r1, r1, #3
 80014c8:	3132      	adds	r1, #50	; 0x32
 80014ca:	fbb1 f3f3 	udiv	r3, r1, r3
 80014ce:	f003 0307 	and.w	r3, r3, #7
 80014d2:	e005      	b.n	80014e0 <USART_Init+0xa4>
 80014d4:	0109      	lsls	r1, r1, #4
 80014d6:	3132      	adds	r1, #50	; 0x32
 80014d8:	fbb1 f3f3 	udiv	r3, r1, r3
 80014dc:	f003 030f 	and.w	r3, r3, #15
 80014e0:	431a      	orrs	r2, r3
 80014e2:	b292      	uxth	r2, r2
 80014e4:	8122      	strh	r2, [r4, #8]
 80014e6:	b005      	add	sp, #20
 80014e8:	bd30      	pop	{r4, r5, pc}
 80014ea:	bf00      	nop
 80014ec:	40011000 	.word	0x40011000

080014f0 <USART_Cmd>:
 80014f0:	8983      	ldrh	r3, [r0, #12]
 80014f2:	b119      	cbz	r1, 80014fc <USART_Cmd+0xc>
 80014f4:	b29b      	uxth	r3, r3
 80014f6:	f443 5300 	orr.w	r3, r3, #8192	; 0x2000
 80014fa:	e003      	b.n	8001504 <USART_Cmd+0x14>
 80014fc:	f423 5300 	bic.w	r3, r3, #8192	; 0x2000
 8001500:	041b      	lsls	r3, r3, #16
 8001502:	0c1b      	lsrs	r3, r3, #16
 8001504:	8183      	strh	r3, [r0, #12]
 8001506:	4770      	bx	lr

08001508 <sys_tick_init>:
 8001508:	4b05      	ldr	r3, [pc, #20]	; (8001520 <sys_tick_init+0x18>)
 800150a:	4a06      	ldr	r2, [pc, #24]	; (8001524 <sys_tick_init+0x1c>)
 800150c:	605a      	str	r2, [r3, #4]
 800150e:	4a06      	ldr	r2, [pc, #24]	; (8001528 <sys_tick_init+0x20>)
 8001510:	21f0      	movs	r1, #240	; 0xf0
 8001512:	f882 1023 	strb.w	r1, [r2, #35]	; 0x23
 8001516:	2200      	movs	r2, #0
 8001518:	609a      	str	r2, [r3, #8]
 800151a:	2207      	movs	r2, #7
 800151c:	601a      	str	r2, [r3, #0]
 800151e:	4770      	bx	lr
 8001520:	e000e010 	.word	0xe000e010
 8001524:	00029040 	.word	0x00029040
 8001528:	e000ed00 	.word	0xe000ed00

0800152c <sleep>:
 800152c:	bf30      	wfi
 800152e:	4770      	bx	lr

08001530 <sytem_clock_init>:
 8001530:	f000 b800 	b.w	8001534 <SystemInit>

08001534 <SystemInit>:
 8001534:	4b3b      	ldr	r3, [pc, #236]	; (8001624 <SystemInit+0xf0>)
 8001536:	f8d3 2088 	ldr.w	r2, [r3, #136]	; 0x88
 800153a:	f442 0270 	orr.w	r2, r2, #15728640	; 0xf00000
 800153e:	f8c3 2088 	str.w	r2, [r3, #136]	; 0x88
 8001542:	f8d3 2088 	ldr.w	r2, [r3, #136]	; 0x88
 8001546:	f442 0270 	orr.w	r2, r2, #15728640	; 0xf00000
 800154a:	f8c3 2088 	str.w	r2, [r3, #136]	; 0x88
 800154e:	4b36      	ldr	r3, [pc, #216]	; (8001628 <SystemInit+0xf4>)
 8001550:	681a      	ldr	r2, [r3, #0]
 8001552:	f042 0201 	orr.w	r2, r2, #1
 8001556:	601a      	str	r2, [r3, #0]
 8001558:	2200      	movs	r2, #0
 800155a:	609a      	str	r2, [r3, #8]
 800155c:	6819      	ldr	r1, [r3, #0]
 800155e:	f021 7184 	bic.w	r1, r1, #17301504	; 0x1080000
 8001562:	f421 3180 	bic.w	r1, r1, #65536	; 0x10000
 8001566:	6019      	str	r1, [r3, #0]
 8001568:	4930      	ldr	r1, [pc, #192]	; (800162c <SystemInit+0xf8>)
 800156a:	6059      	str	r1, [r3, #4]
 800156c:	6819      	ldr	r1, [r3, #0]
 800156e:	b082      	sub	sp, #8
 8001570:	f421 2180 	bic.w	r1, r1, #262144	; 0x40000
 8001574:	6019      	str	r1, [r3, #0]
 8001576:	60da      	str	r2, [r3, #12]
 8001578:	9200      	str	r2, [sp, #0]
 800157a:	9201      	str	r2, [sp, #4]
 800157c:	681a      	ldr	r2, [r3, #0]
 800157e:	f442 3280 	orr.w	r2, r2, #65536	; 0x10000
 8001582:	601a      	str	r2, [r3, #0]
 8001584:	4b28      	ldr	r3, [pc, #160]	; (8001628 <SystemInit+0xf4>)
 8001586:	681a      	ldr	r2, [r3, #0]
 8001588:	f402 3200 	and.w	r2, r2, #131072	; 0x20000
 800158c:	9201      	str	r2, [sp, #4]
 800158e:	9a00      	ldr	r2, [sp, #0]
 8001590:	3201      	adds	r2, #1
 8001592:	9200      	str	r2, [sp, #0]
 8001594:	9a01      	ldr	r2, [sp, #4]
 8001596:	b91a      	cbnz	r2, 80015a0 <SystemInit+0x6c>
 8001598:	9a00      	ldr	r2, [sp, #0]
 800159a:	f5b2 6fa0 	cmp.w	r2, #1280	; 0x500
 800159e:	d1f1      	bne.n	8001584 <SystemInit+0x50>
 80015a0:	681b      	ldr	r3, [r3, #0]
 80015a2:	f413 3300 	ands.w	r3, r3, #131072	; 0x20000
 80015a6:	bf18      	it	ne
 80015a8:	2301      	movne	r3, #1
 80015aa:	9301      	str	r3, [sp, #4]
 80015ac:	9b01      	ldr	r3, [sp, #4]
 80015ae:	2b01      	cmp	r3, #1
 80015b0:	d005      	beq.n	80015be <SystemInit+0x8a>
 80015b2:	4b1c      	ldr	r3, [pc, #112]	; (8001624 <SystemInit+0xf0>)
 80015b4:	f04f 6200 	mov.w	r2, #134217728	; 0x8000000
 80015b8:	609a      	str	r2, [r3, #8]
 80015ba:	b002      	add	sp, #8
 80015bc:	4770      	bx	lr
 80015be:	4b1a      	ldr	r3, [pc, #104]	; (8001628 <SystemInit+0xf4>)
 80015c0:	6c1a      	ldr	r2, [r3, #64]	; 0x40
 80015c2:	f042 5280 	orr.w	r2, r2, #268435456	; 0x10000000
 80015c6:	641a      	str	r2, [r3, #64]	; 0x40
 80015c8:	4a19      	ldr	r2, [pc, #100]	; (8001630 <SystemInit+0xfc>)
 80015ca:	6811      	ldr	r1, [r2, #0]
 80015cc:	f441 4180 	orr.w	r1, r1, #16384	; 0x4000
 80015d0:	6011      	str	r1, [r2, #0]
 80015d2:	689a      	ldr	r2, [r3, #8]
 80015d4:	f042 0290 	orr.w	r2, r2, #144	; 0x90
 80015d8:	609a      	str	r2, [r3, #8]
 80015da:	689a      	ldr	r2, [r3, #8]
 80015dc:	f442 4200 	orr.w	r2, r2, #32768	; 0x8000
 80015e0:	609a      	str	r2, [r3, #8]
 80015e2:	689a      	ldr	r2, [r3, #8]
 80015e4:	f442 52a0 	orr.w	r2, r2, #5120	; 0x1400
 80015e8:	609a      	str	r2, [r3, #8]
 80015ea:	4a12      	ldr	r2, [pc, #72]	; (8001634 <SystemInit+0x100>)
 80015ec:	605a      	str	r2, [r3, #4]
 80015ee:	681a      	ldr	r2, [r3, #0]
 80015f0:	f042 7280 	orr.w	r2, r2, #16777216	; 0x1000000
 80015f4:	601a      	str	r2, [r3, #0]
 80015f6:	6819      	ldr	r1, [r3, #0]
 80015f8:	4a0b      	ldr	r2, [pc, #44]	; (8001628 <SystemInit+0xf4>)
 80015fa:	0189      	lsls	r1, r1, #6
 80015fc:	d5fb      	bpl.n	80015f6 <SystemInit+0xc2>
 80015fe:	4b0e      	ldr	r3, [pc, #56]	; (8001638 <SystemInit+0x104>)
 8001600:	f240 6105 	movw	r1, #1541	; 0x605
 8001604:	6019      	str	r1, [r3, #0]
 8001606:	6893      	ldr	r3, [r2, #8]
 8001608:	f023 0303 	bic.w	r3, r3, #3
 800160c:	6093      	str	r3, [r2, #8]
 800160e:	6893      	ldr	r3, [r2, #8]
 8001610:	f043 0302 	orr.w	r3, r3, #2
 8001614:	6093      	str	r3, [r2, #8]
 8001616:	4b04      	ldr	r3, [pc, #16]	; (8001628 <SystemInit+0xf4>)
 8001618:	689b      	ldr	r3, [r3, #8]
 800161a:	f003 030c 	and.w	r3, r3, #12
 800161e:	2b08      	cmp	r3, #8
 8001620:	d1f9      	bne.n	8001616 <SystemInit+0xe2>
 8001622:	e7c6      	b.n	80015b2 <SystemInit+0x7e>
 8001624:	e000ed00 	.word	0xe000ed00
 8001628:	40023800 	.word	0x40023800
 800162c:	24003010 	.word	0x24003010
 8001630:	40007000 	.word	0x40007000
 8001634:	07405408 	.word	0x07405408
 8001638:	40023c00 	.word	0x40023c00

0800163c <Default_Handler>:
 800163c:	4668      	mov	r0, sp
 800163e:	f020 0107 	bic.w	r1, r0, #7
 8001642:	468d      	mov	sp, r1
 8001644:	bf00      	nop
 8001646:	e7fd      	b.n	8001644 <Default_Handler+0x8>

08001648 <HardFault_Handler>:
 8001648:	f44f 5000 	mov.w	r0, #8192	; 0x2000
 800164c:	f000 f8ac 	bl	80017a8 <led_on>
 8001650:	4b06      	ldr	r3, [pc, #24]	; (800166c <HardFault_Handler+0x24>)
 8001652:	3b01      	subs	r3, #1
 8001654:	d001      	beq.n	800165a <HardFault_Handler+0x12>
 8001656:	bf00      	nop
 8001658:	e7fb      	b.n	8001652 <HardFault_Handler+0xa>
 800165a:	f44f 5000 	mov.w	r0, #8192	; 0x2000
 800165e:	f000 f8ab 	bl	80017b8 <led_off>
 8001662:	4b02      	ldr	r3, [pc, #8]	; (800166c <HardFault_Handler+0x24>)
 8001664:	3b01      	subs	r3, #1
 8001666:	d0ef      	beq.n	8001648 <HardFault_Handler>
 8001668:	bf00      	nop
 800166a:	e7fb      	b.n	8001664 <HardFault_Handler+0x1c>
 800166c:	00989681 	.word	0x00989681

08001670 <_reset_init>:
 8001670:	4a0e      	ldr	r2, [pc, #56]	; (80016ac <_reset_init+0x3c>)
 8001672:	480f      	ldr	r0, [pc, #60]	; (80016b0 <_reset_init+0x40>)
 8001674:	1a80      	subs	r0, r0, r2
 8001676:	1080      	asrs	r0, r0, #2
 8001678:	2300      	movs	r3, #0
 800167a:	4283      	cmp	r3, r0
 800167c:	d006      	beq.n	800168c <_reset_init+0x1c>
 800167e:	490d      	ldr	r1, [pc, #52]	; (80016b4 <_reset_init+0x44>)
 8001680:	f851 1023 	ldr.w	r1, [r1, r3, lsl #2]
 8001684:	f842 1023 	str.w	r1, [r2, r3, lsl #2]
 8001688:	3301      	adds	r3, #1
 800168a:	e7f6      	b.n	800167a <_reset_init+0xa>
 800168c:	4b0a      	ldr	r3, [pc, #40]	; (80016b8 <_reset_init+0x48>)
 800168e:	f8d3 2088 	ldr.w	r2, [r3, #136]	; 0x88
 8001692:	f442 0270 	orr.w	r2, r2, #15728640	; 0xf00000
 8001696:	f8c3 2088 	str.w	r2, [r3, #136]	; 0x88
 800169a:	f503 730c 	add.w	r3, r3, #560	; 0x230
 800169e:	685a      	ldr	r2, [r3, #4]
 80016a0:	f022 4240 	bic.w	r2, r2, #3221225472	; 0xc0000000
 80016a4:	605a      	str	r2, [r3, #4]
 80016a6:	f7ff b827 	b.w	80006f8 <main>
 80016aa:	bf00      	nop
 80016ac:	20000000 	.word	0x20000000
 80016b0:	200000a4 	.word	0x200000a4
 80016b4:	08001ad0 	.word	0x08001ad0
 80016b8:	e000ed00 	.word	0xe000ed00

080016bc <RCC_GetClocksFreq>:
 80016bc:	4b1d      	ldr	r3, [pc, #116]	; (8001734 <RCC_GetClocksFreq+0x78>)
 80016be:	689a      	ldr	r2, [r3, #8]
 80016c0:	f002 020c 	and.w	r2, r2, #12
 80016c4:	2a04      	cmp	r2, #4
 80016c6:	b510      	push	{r4, lr}
 80016c8:	d003      	beq.n	80016d2 <RCC_GetClocksFreq+0x16>
 80016ca:	2a08      	cmp	r2, #8
 80016cc:	d003      	beq.n	80016d6 <RCC_GetClocksFreq+0x1a>
 80016ce:	4b1a      	ldr	r3, [pc, #104]	; (8001738 <RCC_GetClocksFreq+0x7c>)
 80016d0:	e018      	b.n	8001704 <RCC_GetClocksFreq+0x48>
 80016d2:	4b1a      	ldr	r3, [pc, #104]	; (800173c <RCC_GetClocksFreq+0x80>)
 80016d4:	e016      	b.n	8001704 <RCC_GetClocksFreq+0x48>
 80016d6:	6859      	ldr	r1, [r3, #4]
 80016d8:	685a      	ldr	r2, [r3, #4]
 80016da:	f411 0f80 	tst.w	r1, #4194304	; 0x400000
 80016de:	6859      	ldr	r1, [r3, #4]
 80016e0:	bf14      	ite	ne
 80016e2:	4b16      	ldrne	r3, [pc, #88]	; (800173c <RCC_GetClocksFreq+0x80>)
 80016e4:	4b14      	ldreq	r3, [pc, #80]	; (8001738 <RCC_GetClocksFreq+0x7c>)
 80016e6:	f002 023f 	and.w	r2, r2, #63	; 0x3f
 80016ea:	fbb3 f3f2 	udiv	r3, r3, r2
 80016ee:	4a11      	ldr	r2, [pc, #68]	; (8001734 <RCC_GetClocksFreq+0x78>)
 80016f0:	6852      	ldr	r2, [r2, #4]
 80016f2:	f3c2 4201 	ubfx	r2, r2, #16, #2
 80016f6:	f3c1 1188 	ubfx	r1, r1, #6, #9
 80016fa:	3201      	adds	r2, #1
 80016fc:	434b      	muls	r3, r1
 80016fe:	0052      	lsls	r2, r2, #1
 8001700:	fbb3 f3f2 	udiv	r3, r3, r2
 8001704:	490b      	ldr	r1, [pc, #44]	; (8001734 <RCC_GetClocksFreq+0x78>)
 8001706:	6003      	str	r3, [r0, #0]
 8001708:	688b      	ldr	r3, [r1, #8]
 800170a:	4a0d      	ldr	r2, [pc, #52]	; (8001740 <RCC_GetClocksFreq+0x84>)
 800170c:	f3c3 1303 	ubfx	r3, r3, #4, #4
 8001710:	5cd4      	ldrb	r4, [r2, r3]
 8001712:	6803      	ldr	r3, [r0, #0]
 8001714:	40e3      	lsrs	r3, r4
 8001716:	6043      	str	r3, [r0, #4]
 8001718:	688c      	ldr	r4, [r1, #8]
 800171a:	f3c4 2482 	ubfx	r4, r4, #10, #3
 800171e:	5d14      	ldrb	r4, [r2, r4]
 8001720:	fa23 f404 	lsr.w	r4, r3, r4
 8001724:	6084      	str	r4, [r0, #8]
 8001726:	6889      	ldr	r1, [r1, #8]
 8001728:	f3c1 3142 	ubfx	r1, r1, #13, #3
 800172c:	5c52      	ldrb	r2, [r2, r1]
 800172e:	40d3      	lsrs	r3, r2
 8001730:	60c3      	str	r3, [r0, #12]
 8001732:	bd10      	pop	{r4, pc}
 8001734:	40023800 	.word	0x40023800
 8001738:	00f42400 	.word	0x00f42400
 800173c:	007a1200 	.word	0x007a1200
 8001740:	20000094 	.word	0x20000094

08001744 <RCC_AHB1PeriphClockCmd>:
 8001744:	4b04      	ldr	r3, [pc, #16]	; (8001758 <RCC_AHB1PeriphClockCmd+0x14>)
 8001746:	6b1a      	ldr	r2, [r3, #48]	; 0x30
 8001748:	b109      	cbz	r1, 800174e <RCC_AHB1PeriphClockCmd+0xa>
 800174a:	4310      	orrs	r0, r2
 800174c:	e001      	b.n	8001752 <RCC_AHB1PeriphClockCmd+0xe>
 800174e:	ea22 0000 	bic.w	r0, r2, r0
 8001752:	6318      	str	r0, [r3, #48]	; 0x30
 8001754:	4770      	bx	lr
 8001756:	bf00      	nop
 8001758:	40023800 	.word	0x40023800

0800175c <RCC_APB1PeriphClockCmd>:
 800175c:	4b04      	ldr	r3, [pc, #16]	; (8001770 <RCC_APB1PeriphClockCmd+0x14>)
 800175e:	6c1a      	ldr	r2, [r3, #64]	; 0x40
 8001760:	b109      	cbz	r1, 8001766 <RCC_APB1PeriphClockCmd+0xa>
 8001762:	4310      	orrs	r0, r2
 8001764:	e001      	b.n	800176a <RCC_APB1PeriphClockCmd+0xe>
 8001766:	ea22 0000 	bic.w	r0, r2, r0
 800176a:	6418      	str	r0, [r3, #64]	; 0x40
 800176c:	4770      	bx	lr
 800176e:	bf00      	nop
 8001770:	40023800 	.word	0x40023800

08001774 <RCC_APB2PeriphClockCmd>:
 8001774:	4b04      	ldr	r3, [pc, #16]	; (8001788 <RCC_APB2PeriphClockCmd+0x14>)
 8001776:	6c5a      	ldr	r2, [r3, #68]	; 0x44
 8001778:	b109      	cbz	r1, 800177e <RCC_APB2PeriphClockCmd+0xa>
 800177a:	4310      	orrs	r0, r2
 800177c:	e001      	b.n	8001782 <RCC_APB2PeriphClockCmd+0xe>
 800177e:	ea22 0000 	bic.w	r0, r2, r0
 8001782:	6458      	str	r0, [r3, #68]	; 0x44
 8001784:	4770      	bx	lr
 8001786:	bf00      	nop
 8001788:	40023800 	.word	0x40023800

0800178c <lib_low_level_init>:
 800178c:	b508      	push	{r3, lr}
 800178e:	f7ff fecf 	bl	8001530 <sytem_clock_init>
 8001792:	f000 f819 	bl	80017c8 <gpio_init>
 8001796:	f7ff fe0d 	bl	80013b4 <uart_init>
 800179a:	f7ff fc59 	bl	8001050 <timer_init>
 800179e:	e8bd 4008 	ldmia.w	sp!, {r3, lr}
 80017a2:	f7ff bd41 	b.w	8001228 <i2c_0_init>
	...

080017a8 <led_on>:
 80017a8:	b672      	cpsid	i
 80017aa:	4b02      	ldr	r3, [pc, #8]	; (80017b4 <led_on+0xc>)
 80017ac:	b280      	uxth	r0, r0
 80017ae:	8318      	strh	r0, [r3, #24]
 80017b0:	b662      	cpsie	i
 80017b2:	4770      	bx	lr
 80017b4:	40021400 	.word	0x40021400

080017b8 <led_off>:
 80017b8:	b672      	cpsid	i
 80017ba:	4b02      	ldr	r3, [pc, #8]	; (80017c4 <led_off+0xc>)
 80017bc:	b280      	uxth	r0, r0
 80017be:	8358      	strh	r0, [r3, #26]
 80017c0:	b662      	cpsie	i
 80017c2:	4770      	bx	lr
 80017c4:	40021400 	.word	0x40021400

080017c8 <gpio_init>:
 80017c8:	b537      	push	{r0, r1, r2, r4, r5, lr}
 80017ca:	2001      	movs	r0, #1
 80017cc:	4601      	mov	r1, r0
 80017ce:	f7ff ffb9 	bl	8001744 <RCC_AHB1PeriphClockCmd>
 80017d2:	2002      	movs	r0, #2
 80017d4:	2101      	movs	r1, #1
 80017d6:	f7ff ffb5 	bl	8001744 <RCC_AHB1PeriphClockCmd>
 80017da:	2004      	movs	r0, #4
 80017dc:	2101      	movs	r1, #1
 80017de:	f7ff ffb1 	bl	8001744 <RCC_AHB1PeriphClockCmd>
 80017e2:	2008      	movs	r0, #8
 80017e4:	2101      	movs	r1, #1
 80017e6:	f7ff ffad 	bl	8001744 <RCC_AHB1PeriphClockCmd>
 80017ea:	2008      	movs	r0, #8
 80017ec:	2101      	movs	r1, #1
 80017ee:	f7ff ffa9 	bl	8001744 <RCC_AHB1PeriphClockCmd>
 80017f2:	2010      	movs	r0, #16
 80017f4:	2101      	movs	r1, #1
 80017f6:	f7ff ffa5 	bl	8001744 <RCC_AHB1PeriphClockCmd>
 80017fa:	2020      	movs	r0, #32
 80017fc:	2101      	movs	r1, #1
 80017fe:	f7ff ffa1 	bl	8001744 <RCC_AHB1PeriphClockCmd>
 8001802:	f44f 4360 	mov.w	r3, #57344	; 0xe000
 8001806:	2400      	movs	r4, #0
 8001808:	9300      	str	r3, [sp, #0]
 800180a:	2501      	movs	r5, #1
 800180c:	2303      	movs	r3, #3
 800180e:	4669      	mov	r1, sp
 8001810:	4811      	ldr	r0, [pc, #68]	; (8001858 <gpio_init+0x90>)
 8001812:	f88d 3005 	strb.w	r3, [sp, #5]
 8001816:	f88d 5004 	strb.w	r5, [sp, #4]
 800181a:	f88d 4006 	strb.w	r4, [sp, #6]
 800181e:	f88d 4007 	strb.w	r4, [sp, #7]
 8001822:	f000 f81d 	bl	8001860 <GPIO_Init>
 8001826:	2302      	movs	r3, #2
 8001828:	4669      	mov	r1, sp
 800182a:	480c      	ldr	r0, [pc, #48]	; (800185c <gpio_init+0x94>)
 800182c:	f88d 3005 	strb.w	r3, [sp, #5]
 8001830:	9500      	str	r5, [sp, #0]
 8001832:	f88d 4004 	strb.w	r4, [sp, #4]
 8001836:	f000 f813 	bl	8001860 <GPIO_Init>
 800183a:	f44f 5000 	mov.w	r0, #8192	; 0x2000
 800183e:	f7ff ffbb 	bl	80017b8 <led_off>
 8001842:	f44f 4080 	mov.w	r0, #16384	; 0x4000
 8001846:	f7ff ffb7 	bl	80017b8 <led_off>
 800184a:	f44f 4000 	mov.w	r0, #32768	; 0x8000
 800184e:	f7ff ffb3 	bl	80017b8 <led_off>
 8001852:	b003      	add	sp, #12
 8001854:	bd30      	pop	{r4, r5, pc}
 8001856:	bf00      	nop
 8001858:	40021400 	.word	0x40021400
 800185c:	40020000 	.word	0x40020000

08001860 <GPIO_Init>:
 8001860:	e92d 41f0 	stmdb	sp!, {r4, r5, r6, r7, r8, lr}
 8001864:	680f      	ldr	r7, [r1, #0]
 8001866:	2300      	movs	r3, #0
 8001868:	2201      	movs	r2, #1
 800186a:	409a      	lsls	r2, r3
 800186c:	ea02 0507 	and.w	r5, r2, r7
 8001870:	4295      	cmp	r5, r2
 8001872:	d131      	bne.n	80018d8 <GPIO_Init+0x78>
 8001874:	005a      	lsls	r2, r3, #1
 8001876:	2403      	movs	r4, #3
 8001878:	6806      	ldr	r6, [r0, #0]
 800187a:	4094      	lsls	r4, r2
 800187c:	43e4      	mvns	r4, r4
 800187e:	4026      	ands	r6, r4
 8001880:	6006      	str	r6, [r0, #0]
 8001882:	790e      	ldrb	r6, [r1, #4]
 8001884:	f8d0 c000 	ldr.w	ip, [r0]
 8001888:	fa06 f802 	lsl.w	r8, r6, r2
 800188c:	3e01      	subs	r6, #1
 800188e:	b2f6      	uxtb	r6, r6
 8001890:	ea48 0c0c 	orr.w	ip, r8, ip
 8001894:	2e01      	cmp	r6, #1
 8001896:	f8c0 c000 	str.w	ip, [r0]
 800189a:	d814      	bhi.n	80018c6 <GPIO_Init+0x66>
 800189c:	6886      	ldr	r6, [r0, #8]
 800189e:	f891 c005 	ldrb.w	ip, [r1, #5]
 80018a2:	4026      	ands	r6, r4
 80018a4:	6086      	str	r6, [r0, #8]
 80018a6:	6886      	ldr	r6, [r0, #8]
 80018a8:	fa0c fc02 	lsl.w	ip, ip, r2
 80018ac:	ea4c 0606 	orr.w	r6, ip, r6
 80018b0:	6086      	str	r6, [r0, #8]
 80018b2:	6846      	ldr	r6, [r0, #4]
 80018b4:	ea26 0505 	bic.w	r5, r6, r5
 80018b8:	6045      	str	r5, [r0, #4]
 80018ba:	798d      	ldrb	r5, [r1, #6]
 80018bc:	6846      	ldr	r6, [r0, #4]
 80018be:	409d      	lsls	r5, r3
 80018c0:	b2ad      	uxth	r5, r5
 80018c2:	4335      	orrs	r5, r6
 80018c4:	6045      	str	r5, [r0, #4]
 80018c6:	68c5      	ldr	r5, [r0, #12]
 80018c8:	402c      	ands	r4, r5
 80018ca:	60c4      	str	r4, [r0, #12]
 80018cc:	79cd      	ldrb	r5, [r1, #7]
 80018ce:	68c4      	ldr	r4, [r0, #12]
 80018d0:	fa05 f202 	lsl.w	r2, r5, r2
 80018d4:	4322      	orrs	r2, r4
 80018d6:	60c2      	str	r2, [r0, #12]
 80018d8:	3301      	adds	r3, #1
 80018da:	2b10      	cmp	r3, #16
 80018dc:	d1c4      	bne.n	8001868 <GPIO_Init+0x8>
 80018de:	e8bd 81f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, pc}

080018e2 <GPIO_SetBits>:
 80018e2:	8301      	strh	r1, [r0, #24]
 80018e4:	4770      	bx	lr

080018e6 <GPIO_ResetBits>:
 80018e6:	8341      	strh	r1, [r0, #26]
 80018e8:	4770      	bx	lr

080018ea <GPIO_PinAFConfig>:
 80018ea:	f001 0307 	and.w	r3, r1, #7
 80018ee:	08c9      	lsrs	r1, r1, #3
 80018f0:	eb00 0081 	add.w	r0, r0, r1, lsl #2
 80018f4:	b510      	push	{r4, lr}
 80018f6:	009b      	lsls	r3, r3, #2
 80018f8:	6a04      	ldr	r4, [r0, #32]
 80018fa:	210f      	movs	r1, #15
 80018fc:	4099      	lsls	r1, r3
 80018fe:	ea24 0101 	bic.w	r1, r4, r1
 8001902:	6201      	str	r1, [r0, #32]
 8001904:	6a01      	ldr	r1, [r0, #32]
 8001906:	409a      	lsls	r2, r3
 8001908:	4311      	orrs	r1, r2
 800190a:	6201      	str	r1, [r0, #32]
 800190c:	bd10      	pop	{r4, pc}
	...

08001910 <NVIC_Init>:
 8001910:	78c2      	ldrb	r2, [r0, #3]
 8001912:	7803      	ldrb	r3, [r0, #0]
 8001914:	b510      	push	{r4, lr}
 8001916:	b30a      	cbz	r2, 800195c <NVIC_Init+0x4c>
 8001918:	4a16      	ldr	r2, [pc, #88]	; (8001974 <NVIC_Init+0x64>)
 800191a:	7844      	ldrb	r4, [r0, #1]
 800191c:	68d2      	ldr	r2, [r2, #12]
 800191e:	43d2      	mvns	r2, r2
 8001920:	f3c2 2202 	ubfx	r2, r2, #8, #3
 8001924:	f1c2 0104 	rsb	r1, r2, #4
 8001928:	b2c9      	uxtb	r1, r1
 800192a:	fa04 f101 	lsl.w	r1, r4, r1
 800192e:	240f      	movs	r4, #15
 8001930:	fa44 f202 	asr.w	r2, r4, r2
 8001934:	7884      	ldrb	r4, [r0, #2]
 8001936:	b2c9      	uxtb	r1, r1
 8001938:	4022      	ands	r2, r4
 800193a:	430a      	orrs	r2, r1
 800193c:	f103 4360 	add.w	r3, r3, #3758096384	; 0xe0000000
 8001940:	f503 4361 	add.w	r3, r3, #57600	; 0xe100
 8001944:	0112      	lsls	r2, r2, #4
 8001946:	b2d2      	uxtb	r2, r2
 8001948:	f883 2300 	strb.w	r2, [r3, #768]	; 0x300
 800194c:	7803      	ldrb	r3, [r0, #0]
 800194e:	2201      	movs	r2, #1
 8001950:	0959      	lsrs	r1, r3, #5
 8001952:	f003 031f 	and.w	r3, r3, #31
 8001956:	fa02 f303 	lsl.w	r3, r2, r3
 800195a:	e006      	b.n	800196a <NVIC_Init+0x5a>
 800195c:	0959      	lsrs	r1, r3, #5
 800195e:	2201      	movs	r2, #1
 8001960:	f003 031f 	and.w	r3, r3, #31
 8001964:	fa02 f303 	lsl.w	r3, r2, r3
 8001968:	3120      	adds	r1, #32
 800196a:	4a03      	ldr	r2, [pc, #12]	; (8001978 <NVIC_Init+0x68>)
 800196c:	f842 3021 	str.w	r3, [r2, r1, lsl #2]
 8001970:	bd10      	pop	{r4, pc}
 8001972:	bf00      	nop
 8001974:	e000ed00 	.word	0xe000ed00
 8001978:	e000e100 	.word	0xe000e100

0800197c <_init>:
 800197c:	e1a0c00d 	mov	ip, sp
 8001980:	e92ddff8 	push	{r3, r4, r5, r6, r7, r8, r9, sl, fp, ip, lr, pc}
 8001984:	e24cb004 	sub	fp, ip, #4
 8001988:	e24bd028 	sub	sp, fp, #40	; 0x28
 800198c:	e89d6ff0 	ldm	sp, {r4, r5, r6, r7, r8, r9, sl, fp, sp, lr}
 8001990:	e12fff1e 	bx	lr

08001994 <_fini>:
 8001994:	e1a0c00d 	mov	ip, sp
 8001998:	e92ddff8 	push	{r3, r4, r5, r6, r7, r8, r9, sl, fp, ip, lr, pc}
 800199c:	e24cb004 	sub	fp, ip, #4
 80019a0:	e24bd028 	sub	sp, fp, #40	; 0x28
 80019a4:	e89d6ff0 	ldm	sp, {r4, r5, r6, r7, r8, r9, sl, fp, sp, lr}
 80019a8:	e12fff1e 	bx	lr
 80019ac:	69647473 	.word	0x69647473
 80019b0:	6e69206f 	.word	0x6e69206f
 80019b4:	64207469 	.word	0x64207469
 80019b8:	0a656e6f 	.word	0x0a656e6f
 80019bc:	00          	.byte	0x00
 80019bd:	62          	.byte	0x62
 80019be:	6f6f      	.short	0x6f6f
 80019c0:	676e6974 	.word	0x676e6974
 80019c4:	6f726620 	.word	0x6f726620
 80019c8:	7525206d 	.word	0x7525206d
 80019cc:	6172000a 	.word	0x6172000a
 80019d0:	7473206d 	.word	0x7473206d
 80019d4:	20747261 	.word	0x20747261
 80019d8:	0a207525 	.word	0x0a207525
 80019dc:	6d617200 	.word	0x6d617200
 80019e0:	7a697320 	.word	0x7a697320
 80019e4:	75252065 	.word	0x75252065
 80019e8:	72000a20 	.word	0x72000a20
 80019ec:	66206d61 	.word	0x66206d61
 80019f0:	20656572 	.word	0x20656572
 80019f4:	0a207525 	.word	0x0a207525
 80019f8:	61656800 	.word	0x61656800
 80019fc:	74732070 	.word	0x74732070
 8001a00:	20747261 	.word	0x20747261
 8001a04:	0a207525 	.word	0x0a207525
 8001a08:	000a0a00 	.word	0x000a0a00
 8001a0c:	746f6e61 	.word	0x746f6e61
 8001a10:	20726568 	.word	0x20726568
 8001a14:	6c696863 	.word	0x6c696863
 8001a18:	68742064 	.word	0x68742064
 8001a1c:	64616572 	.word	0x64616572
 8001a20:	6572202c 	.word	0x6572202c
 8001a24:	75252073 	.word	0x75252073
 8001a28:	6874000a 	.word	0x6874000a
 8001a2c:	64616572 	.word	0x64616572
 8001a30:	000a3120 	.word	0x000a3120
 8001a34:	61657263 	.word	0x61657263
 8001a38:	676e6974 	.word	0x676e6974
 8001a3c:	69686320 	.word	0x69686320
 8001a40:	7420646c 	.word	0x7420646c
 8001a44:	61657268 	.word	0x61657268
 8001a48:	74000a64 	.word	0x74000a64
 8001a4c:	61657268 	.word	0x61657268
 8001a50:	72632064 	.word	0x72632064
 8001a54:	69746165 	.word	0x69746165
 8001a58:	6520676e 	.word	0x6520676e
 8001a5c:	726f7272 	.word	0x726f7272
 8001a60:	6177000a 	.word	0x6177000a
 8001a64:	6e697469 	.word	0x6e697469
 8001a68:	6f662067 	.word	0x6f662067
 8001a6c:	68742072 	.word	0x68742072
 8001a70:	64616572 	.word	0x64616572
 8001a74:	20752520 	.word	0x20752520
 8001a78:	656e6f64 	.word	0x656e6f64
 8001a7c:	6570000a 	.word	0x6570000a
 8001a80:	646f6972 	.word	0x646f6972
 8001a84:	74206369 	.word	0x74206369
 8001a88:	61657268 	.word	0x61657268
 8001a8c:	0a000a64 	.word	0x0a000a64
 8001a90:	636c6577 	.word	0x636c6577
 8001a94:	20656d6f 	.word	0x20656d6f
 8001a98:	53206f74 	.word	0x53206f74
 8001a9c:	68757a75 	.word	0x68757a75
 8001aa0:	20534f61 	.word	0x20534f61
 8001aa4:	205e5f5e 	.word	0x205e5f5e
 8001aa8:	2e322e32 	.word	0x2e322e32
 8001aac:	55420a30 	.word	0x55420a30
 8001ab0:	20444c49 	.word	0x20444c49
 8001ab4:	20706553 	.word	0x20706553
 8001ab8:	32203131 	.word	0x32203131
 8001abc:	20353130 	.word	0x20353130
 8001ac0:	343a3131 	.word	0x343a3131
 8001ac4:	32323a35 	.word	0x32323a35
 8001ac8:	0000000a 	.word	0x0000000a

08001acc <__EH_FRAME_BEGIN__>:
 8001acc:	00000000                                ....
