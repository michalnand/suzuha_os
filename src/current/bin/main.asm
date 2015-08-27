
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
 80001aa:	f000 fce9 	bl	8000b80 <sleep>
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
 8000282:	f000 fc6b 	bl	8000b5c <sys_tick_init>
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
 80003de:	f000 f817 	bl	8000410 <messages_init>
 80003e2:	e8bd 4008 	ldmia.w	sp!, {r3, lr}
 80003e6:	f000 b8f9 	b.w	80005dc <stdio_init>
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
 8000404:	20000b8c 	.word	0x20000b8c
 8000408:	200000f4 	.word	0x200000f4
 800040c:	200000f8 	.word	0x200000f8

08000410 <messages_init>:
 8000410:	b510      	push	{r4, lr}
 8000412:	2200      	movs	r2, #0
 8000414:	4909      	ldr	r1, [pc, #36]	; (800043c <messages_init+0x2c>)
 8000416:	2300      	movs	r3, #0
 8000418:	f841 3022 	str.w	r3, [r1, r2, lsl #2]
 800041c:	3201      	adds	r2, #1
 800041e:	2a08      	cmp	r2, #8
 8000420:	d1f8      	bne.n	8000414 <messages_init+0x4>
 8000422:	4c07      	ldr	r4, [pc, #28]	; (8000440 <messages_init+0x30>)
 8000424:	0118      	lsls	r0, r3, #4
 8000426:	1821      	adds	r1, r4, r0
 8000428:	3301      	adds	r3, #1
 800042a:	2200      	movs	r2, #0
 800042c:	2b04      	cmp	r3, #4
 800042e:	604a      	str	r2, [r1, #4]
 8000430:	5022      	str	r2, [r4, r0]
 8000432:	60ca      	str	r2, [r1, #12]
 8000434:	608a      	str	r2, [r1, #8]
 8000436:	d1f4      	bne.n	8000422 <messages_init+0x12>
 8000438:	bd10      	pop	{r4, pc}
 800043a:	bf00      	nop
 800043c:	20000100 	.word	0x20000100
 8000440:	20000120 	.word	0x20000120

08000444 <putc_>:
 8000444:	b538      	push	{r3, r4, r5, lr}
 8000446:	4c06      	ldr	r4, [pc, #24]	; (8000460 <putc_+0x1c>)
 8000448:	4605      	mov	r5, r0
 800044a:	4620      	mov	r0, r4
 800044c:	f000 f8f8 	bl	8000640 <mutex_lock>
 8000450:	4628      	mov	r0, r5
 8000452:	f000 facf 	bl	80009f4 <uart_write>
 8000456:	4620      	mov	r0, r4
 8000458:	e8bd 4038 	ldmia.w	sp!, {r3, r4, r5, lr}
 800045c:	f000 b90c 	b.w	8000678 <mutex_unlock>
 8000460:	20000160 	.word	0x20000160

08000464 <puts_>:
 8000464:	b510      	push	{r4, lr}
 8000466:	4604      	mov	r4, r0
 8000468:	4807      	ldr	r0, [pc, #28]	; (8000488 <puts_+0x24>)
 800046a:	f000 f8e9 	bl	8000640 <mutex_lock>
 800046e:	3c01      	subs	r4, #1
 8000470:	f814 0f01 	ldrb.w	r0, [r4, #1]!
 8000474:	b110      	cbz	r0, 800047c <puts_+0x18>
 8000476:	f7ff ffe5 	bl	8000444 <putc_>
 800047a:	e7f9      	b.n	8000470 <puts_+0xc>
 800047c:	4802      	ldr	r0, [pc, #8]	; (8000488 <puts_+0x24>)
 800047e:	e8bd 4010 	ldmia.w	sp!, {r4, lr}
 8000482:	f000 b8f9 	b.w	8000678 <mutex_unlock>
 8000486:	bf00      	nop
 8000488:	2000016c 	.word	0x2000016c

0800048c <puti_>:
 800048c:	b530      	push	{r4, r5, lr}
 800048e:	b085      	sub	sp, #20
 8000490:	1e03      	subs	r3, r0, #0
 8000492:	f04f 0200 	mov.w	r2, #0
 8000496:	bfa8      	it	ge
 8000498:	4614      	movge	r4, r2
 800049a:	f88d 200f 	strb.w	r2, [sp, #15]
 800049e:	bfbc      	itt	lt
 80004a0:	425b      	neglt	r3, r3
 80004a2:	2401      	movlt	r4, #1
 80004a4:	220a      	movs	r2, #10
 80004a6:	210a      	movs	r1, #10
 80004a8:	fb93 f5f1 	sdiv	r5, r3, r1
 80004ac:	fb01 3315 	mls	r3, r1, r5, r3
 80004b0:	a801      	add	r0, sp, #4
 80004b2:	3330      	adds	r3, #48	; 0x30
 80004b4:	5413      	strb	r3, [r2, r0]
 80004b6:	1e51      	subs	r1, r2, #1
 80004b8:	462b      	mov	r3, r5
 80004ba:	b10d      	cbz	r5, 80004c0 <puti_+0x34>
 80004bc:	460a      	mov	r2, r1
 80004be:	e7f2      	b.n	80004a6 <puti_+0x1a>
 80004c0:	b12c      	cbz	r4, 80004ce <puti_+0x42>
 80004c2:	ab04      	add	r3, sp, #16
 80004c4:	440b      	add	r3, r1
 80004c6:	222d      	movs	r2, #45	; 0x2d
 80004c8:	f803 2c0c 	strb.w	r2, [r3, #-12]
 80004cc:	460a      	mov	r2, r1
 80004ce:	4410      	add	r0, r2
 80004d0:	f7ff ffc8 	bl	8000464 <puts_>
 80004d4:	b005      	add	sp, #20
 80004d6:	bd30      	pop	{r4, r5, pc}

080004d8 <putui_>:
 80004d8:	b51f      	push	{r0, r1, r2, r3, r4, lr}
 80004da:	2300      	movs	r3, #0
 80004dc:	f88d 300f 	strb.w	r3, [sp, #15]
 80004e0:	230a      	movs	r3, #10
 80004e2:	240a      	movs	r4, #10
 80004e4:	fbb0 f1f4 	udiv	r1, r0, r4
 80004e8:	fb04 0011 	mls	r0, r4, r1, r0
 80004ec:	aa01      	add	r2, sp, #4
 80004ee:	3030      	adds	r0, #48	; 0x30
 80004f0:	5498      	strb	r0, [r3, r2]
 80004f2:	1e5c      	subs	r4, r3, #1
 80004f4:	4608      	mov	r0, r1
 80004f6:	b109      	cbz	r1, 80004fc <putui_+0x24>
 80004f8:	4623      	mov	r3, r4
 80004fa:	e7f2      	b.n	80004e2 <putui_+0xa>
 80004fc:	18d0      	adds	r0, r2, r3
 80004fe:	f7ff ffb1 	bl	8000464 <puts_>
 8000502:	b004      	add	sp, #16
 8000504:	bd10      	pop	{r4, pc}

08000506 <putx_>:
 8000506:	b51f      	push	{r0, r1, r2, r3, r4, lr}
 8000508:	2300      	movs	r3, #0
 800050a:	f88d 300f 	strb.w	r3, [sp, #15]
 800050e:	230a      	movs	r3, #10
 8000510:	f000 010f 	and.w	r1, r0, #15
 8000514:	2909      	cmp	r1, #9
 8000516:	aa01      	add	r2, sp, #4
 8000518:	bf94      	ite	ls
 800051a:	3130      	addls	r1, #48	; 0x30
 800051c:	3157      	addhi	r1, #87	; 0x57
 800051e:	0900      	lsrs	r0, r0, #4
 8000520:	54d1      	strb	r1, [r2, r3]
 8000522:	f103 31ff 	add.w	r1, r3, #4294967295
 8000526:	d001      	beq.n	800052c <putx_+0x26>
 8000528:	460b      	mov	r3, r1
 800052a:	e7f1      	b.n	8000510 <putx_+0xa>
 800052c:	18d0      	adds	r0, r2, r3
 800052e:	f7ff ff99 	bl	8000464 <puts_>
 8000532:	b005      	add	sp, #20
 8000534:	f85d fb04 	ldr.w	pc, [sp], #4

08000538 <printf_>:
 8000538:	b40f      	push	{r0, r1, r2, r3}
 800053a:	b537      	push	{r0, r1, r2, r4, r5, lr}
 800053c:	ac06      	add	r4, sp, #24
 800053e:	4826      	ldr	r0, [pc, #152]	; (80005d8 <printf_+0xa0>)
 8000540:	f854 5b04 	ldr.w	r5, [r4], #4
 8000544:	f000 f87c 	bl	8000640 <mutex_lock>
 8000548:	9401      	str	r4, [sp, #4]
 800054a:	2400      	movs	r4, #0
 800054c:	5d28      	ldrb	r0, [r5, r4]
 800054e:	2800      	cmp	r0, #0
 8000550:	d039      	beq.n	80005c6 <printf_+0x8e>
 8000552:	2825      	cmp	r0, #37	; 0x25
 8000554:	d003      	beq.n	800055e <printf_+0x26>
 8000556:	f7ff ff75 	bl	8000444 <putc_>
 800055a:	3401      	adds	r4, #1
 800055c:	e7f6      	b.n	800054c <printf_+0x14>
 800055e:	192b      	adds	r3, r5, r4
 8000560:	7858      	ldrb	r0, [r3, #1]
 8000562:	2869      	cmp	r0, #105	; 0x69
 8000564:	d016      	beq.n	8000594 <printf_+0x5c>
 8000566:	d808      	bhi.n	800057a <printf_+0x42>
 8000568:	2825      	cmp	r0, #37	; 0x25
 800056a:	d028      	beq.n	80005be <printf_+0x86>
 800056c:	2863      	cmp	r0, #99	; 0x63
 800056e:	d128      	bne.n	80005c2 <printf_+0x8a>
 8000570:	9b01      	ldr	r3, [sp, #4]
 8000572:	1d1a      	adds	r2, r3, #4
 8000574:	9201      	str	r2, [sp, #4]
 8000576:	7818      	ldrb	r0, [r3, #0]
 8000578:	e021      	b.n	80005be <printf_+0x86>
 800057a:	2875      	cmp	r0, #117	; 0x75
 800057c:	d011      	beq.n	80005a2 <printf_+0x6a>
 800057e:	2878      	cmp	r0, #120	; 0x78
 8000580:	d016      	beq.n	80005b0 <printf_+0x78>
 8000582:	2873      	cmp	r0, #115	; 0x73
 8000584:	d11d      	bne.n	80005c2 <printf_+0x8a>
 8000586:	9b01      	ldr	r3, [sp, #4]
 8000588:	1d1a      	adds	r2, r3, #4
 800058a:	6818      	ldr	r0, [r3, #0]
 800058c:	9201      	str	r2, [sp, #4]
 800058e:	f7ff ff69 	bl	8000464 <puts_>
 8000592:	e016      	b.n	80005c2 <printf_+0x8a>
 8000594:	9b01      	ldr	r3, [sp, #4]
 8000596:	1d1a      	adds	r2, r3, #4
 8000598:	6818      	ldr	r0, [r3, #0]
 800059a:	9201      	str	r2, [sp, #4]
 800059c:	f7ff ff76 	bl	800048c <puti_>
 80005a0:	e00f      	b.n	80005c2 <printf_+0x8a>
 80005a2:	9b01      	ldr	r3, [sp, #4]
 80005a4:	1d1a      	adds	r2, r3, #4
 80005a6:	6818      	ldr	r0, [r3, #0]
 80005a8:	9201      	str	r2, [sp, #4]
 80005aa:	f7ff ff95 	bl	80004d8 <putui_>
 80005ae:	e008      	b.n	80005c2 <printf_+0x8a>
 80005b0:	9b01      	ldr	r3, [sp, #4]
 80005b2:	1d1a      	adds	r2, r3, #4
 80005b4:	6818      	ldr	r0, [r3, #0]
 80005b6:	9201      	str	r2, [sp, #4]
 80005b8:	f7ff ffa5 	bl	8000506 <putx_>
 80005bc:	e001      	b.n	80005c2 <printf_+0x8a>
 80005be:	f7ff ff41 	bl	8000444 <putc_>
 80005c2:	3402      	adds	r4, #2
 80005c4:	e7c2      	b.n	800054c <printf_+0x14>
 80005c6:	4804      	ldr	r0, [pc, #16]	; (80005d8 <printf_+0xa0>)
 80005c8:	f000 f856 	bl	8000678 <mutex_unlock>
 80005cc:	b003      	add	sp, #12
 80005ce:	e8bd 4030 	ldmia.w	sp!, {r4, r5, lr}
 80005d2:	b004      	add	sp, #16
 80005d4:	4770      	bx	lr
 80005d6:	bf00      	nop
 80005d8:	20000168 	.word	0x20000168

080005dc <stdio_init>:
 80005dc:	b510      	push	{r4, lr}
 80005de:	480e      	ldr	r0, [pc, #56]	; (8000618 <stdio_init+0x3c>)
 80005e0:	f000 f824 	bl	800062c <mutex_init>
 80005e4:	480d      	ldr	r0, [pc, #52]	; (800061c <stdio_init+0x40>)
 80005e6:	f000 f821 	bl	800062c <mutex_init>
 80005ea:	480d      	ldr	r0, [pc, #52]	; (8000620 <stdio_init+0x44>)
 80005ec:	f000 f81e 	bl	800062c <mutex_init>
 80005f0:	480c      	ldr	r0, [pc, #48]	; (8000624 <stdio_init+0x48>)
 80005f2:	f000 f81b 	bl	800062c <mutex_init>
 80005f6:	2408      	movs	r4, #8
 80005f8:	2020      	movs	r0, #32
 80005fa:	f7ff ff23 	bl	8000444 <putc_>
 80005fe:	3c01      	subs	r4, #1
 8000600:	d1fa      	bne.n	80005f8 <stdio_init+0x1c>
 8000602:	2420      	movs	r4, #32
 8000604:	200a      	movs	r0, #10
 8000606:	f7ff ff1d 	bl	8000444 <putc_>
 800060a:	3c01      	subs	r4, #1
 800060c:	d1fa      	bne.n	8000604 <stdio_init+0x28>
 800060e:	4806      	ldr	r0, [pc, #24]	; (8000628 <stdio_init+0x4c>)
 8000610:	e8bd 4010 	ldmia.w	sp!, {r4, lr}
 8000614:	f7ff bf90 	b.w	8000538 <printf_>
 8000618:	20000160 	.word	0x20000160
 800061c:	20000164 	.word	0x20000164
 8000620:	2000016c 	.word	0x2000016c
 8000624:	20000168 	.word	0x20000168
 8000628:	08000fc8 	.word	0x08000fc8

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
 8000696:	f7ff ff4f 	bl	8000538 <printf_>
 800069a:	1b2d      	subs	r5, r5, r4
 800069c:	4621      	mov	r1, r4
 800069e:	480f      	ldr	r0, [pc, #60]	; (80006dc <mem_info_print+0x50>)
 80006a0:	f7ff ff4a 	bl	8000538 <printf_>
 80006a4:	4629      	mov	r1, r5
 80006a6:	480e      	ldr	r0, [pc, #56]	; (80006e0 <mem_info_print+0x54>)
 80006a8:	f7ff ff46 	bl	8000538 <printf_>
 80006ac:	4b0d      	ldr	r3, [pc, #52]	; (80006e4 <mem_info_print+0x58>)
 80006ae:	480e      	ldr	r0, [pc, #56]	; (80006e8 <mem_info_print+0x5c>)
 80006b0:	1ae1      	subs	r1, r4, r3
 80006b2:	4429      	add	r1, r5
 80006b4:	f7ff ff40 	bl	8000538 <printf_>
 80006b8:	480c      	ldr	r0, [pc, #48]	; (80006ec <mem_info_print+0x60>)
 80006ba:	490d      	ldr	r1, [pc, #52]	; (80006f0 <mem_info_print+0x64>)
 80006bc:	f7ff ff3c 	bl	8000538 <printf_>
 80006c0:	480c      	ldr	r0, [pc, #48]	; (80006f4 <mem_info_print+0x68>)
 80006c2:	e8bd 4038 	ldmia.w	sp!, {r3, r4, r5, lr}
 80006c6:	f7ff bf37 	b.w	8000538 <printf_>
 80006ca:	bf00      	nop
 80006cc:	20000000 	.word	0x20000000
 80006d0:	20020000 	.word	0x20020000
 80006d4:	08000fd9 	.word	0x08000fd9
 80006d8:	08000f98 	.word	0x08000f98
 80006dc:	08000fea 	.word	0x08000fea
 80006e0:	08000ff9 	.word	0x08000ff9
 80006e4:	20000b8c 	.word	0x20000b8c
 80006e8:	08001007 	.word	0x08001007
 80006ec:	08001015 	.word	0x08001015
 80006f0:	20000b8c 	.word	0x20000b8c
 80006f4:	08001025 	.word	0x08001025

080006f8 <main>:
 80006f8:	b508      	push	{r3, lr}
 80006fa:	f000 fb71 	bl	8000de0 <lib_low_level_init>
 80006fe:	f44f 5000 	mov.w	r0, #8192	; 0x2000
 8000702:	f000 fbb3 	bl	8000e6c <led_on>
 8000706:	f7ff fe65 	bl	80003d4 <lib_os_init>
 800070a:	f7ff ffbf 	bl	800068c <mem_info_print>
 800070e:	4905      	ldr	r1, [pc, #20]	; (8000724 <main+0x2c>)
 8000710:	4805      	ldr	r0, [pc, #20]	; (8000728 <main+0x30>)
 8000712:	f44f 7200 	mov.w	r2, #512	; 0x200
 8000716:	2308      	movs	r3, #8
 8000718:	f7ff fdb8 	bl	800028c <create_thread>
 800071c:	f7ff fdb0 	bl	8000280 <kernel_start>
 8000720:	2000      	movs	r0, #0
 8000722:	bd08      	pop	{r3, pc}
 8000724:	20000370 	.word	0x20000370
 8000728:	080007c9 	.word	0x080007c9

0800072c <thread_02>:
 800072c:	b510      	push	{r4, lr}
 800072e:	2400      	movs	r4, #0
 8000730:	4621      	mov	r1, r4
 8000732:	4803      	ldr	r0, [pc, #12]	; (8000740 <thread_02+0x14>)
 8000734:	3401      	adds	r4, #1
 8000736:	f7ff feff 	bl	8000538 <printf_>
 800073a:	2c0a      	cmp	r4, #10
 800073c:	d1f8      	bne.n	8000730 <thread_02+0x4>
 800073e:	bd10      	pop	{r4, pc}
 8000740:	08001028 	.word	0x08001028

08000744 <thread_01>:
 8000744:	b510      	push	{r4, lr}
 8000746:	f44f 4080 	mov.w	r0, #16384	; 0x4000
 800074a:	f000 fb8f 	bl	8000e6c <led_on>
 800074e:	4812      	ldr	r0, [pc, #72]	; (8000798 <thread_01+0x54>)
 8000750:	f7ff fef2 	bl	8000538 <printf_>
 8000754:	4811      	ldr	r0, [pc, #68]	; (800079c <thread_01+0x58>)
 8000756:	f7ff feef 	bl	8000538 <printf_>
 800075a:	4811      	ldr	r0, [pc, #68]	; (80007a0 <thread_01+0x5c>)
 800075c:	4911      	ldr	r1, [pc, #68]	; (80007a4 <thread_01+0x60>)
 800075e:	f44f 7200 	mov.w	r2, #512	; 0x200
 8000762:	2308      	movs	r3, #8
 8000764:	f7ff fd92 	bl	800028c <create_thread>
 8000768:	2808      	cmp	r0, #8
 800076a:	4604      	mov	r4, r0
 800076c:	d101      	bne.n	8000772 <thread_01+0x2e>
 800076e:	480e      	ldr	r0, [pc, #56]	; (80007a8 <thread_01+0x64>)
 8000770:	e007      	b.n	8000782 <thread_01+0x3e>
 8000772:	480e      	ldr	r0, [pc, #56]	; (80007ac <thread_01+0x68>)
 8000774:	4621      	mov	r1, r4
 8000776:	f7ff fedf 	bl	8000538 <printf_>
 800077a:	4620      	mov	r0, r4
 800077c:	f7ff fe16 	bl	80003ac <join>
 8000780:	480b      	ldr	r0, [pc, #44]	; (80007b0 <thread_01+0x6c>)
 8000782:	f7ff fed9 	bl	8000538 <printf_>
 8000786:	f44f 4080 	mov.w	r0, #16384	; 0x4000
 800078a:	f000 fb75 	bl	8000e78 <led_off>
 800078e:	f44f 70fa 	mov.w	r0, #500	; 0x1f4
 8000792:	f000 f91f 	bl	80009d4 <timer_delay_ms>
 8000796:	e7d6      	b.n	8000746 <thread_01+0x2>
 8000798:	08001046 	.word	0x08001046
 800079c:	08001050 	.word	0x08001050
 80007a0:	0800072d 	.word	0x0800072d
 80007a4:	20000770 	.word	0x20000770
 80007a8:	08001067 	.word	0x08001067
 80007ac:	0800107e 	.word	0x0800107e
 80007b0:	08000fd3 	.word	0x08000fd3

080007b4 <thread_03>:
 80007b4:	b508      	push	{r3, lr}
 80007b6:	4803      	ldr	r0, [pc, #12]	; (80007c4 <thread_03+0x10>)
 80007b8:	f7ff febe 	bl	8000538 <printf_>
 80007bc:	2064      	movs	r0, #100	; 0x64
 80007be:	f000 f909 	bl	80009d4 <timer_delay_ms>
 80007c2:	e7f8      	b.n	80007b6 <thread_03+0x2>
 80007c4:	0800109a 	.word	0x0800109a

080007c8 <main_thread>:
 80007c8:	b508      	push	{r3, lr}
 80007ca:	4813      	ldr	r0, [pc, #76]	; (8000818 <main_thread+0x50>)
 80007cc:	f7ff feb4 	bl	8000538 <printf_>
 80007d0:	4912      	ldr	r1, [pc, #72]	; (800081c <main_thread+0x54>)
 80007d2:	4813      	ldr	r0, [pc, #76]	; (8000820 <main_thread+0x58>)
 80007d4:	f44f 7200 	mov.w	r2, #512	; 0x200
 80007d8:	2308      	movs	r3, #8
 80007da:	f7ff fd57 	bl	800028c <create_thread>
 80007de:	4811      	ldr	r0, [pc, #68]	; (8000824 <main_thread+0x5c>)
 80007e0:	4911      	ldr	r1, [pc, #68]	; (8000828 <main_thread+0x60>)
 80007e2:	f44f 7200 	mov.w	r2, #512	; 0x200
 80007e6:	2308      	movs	r3, #8
 80007e8:	f7ff fd50 	bl	800028c <create_thread>
 80007ec:	f44f 5000 	mov.w	r0, #8192	; 0x2000
 80007f0:	f000 fb3c 	bl	8000e6c <led_on>
 80007f4:	f000 f8e0 	bl	80009b8 <timer_get_time>
 80007f8:	f44f 717a 	mov.w	r1, #1000	; 0x3e8
 80007fc:	fbb0 f1f1 	udiv	r1, r0, r1
 8000800:	480a      	ldr	r0, [pc, #40]	; (800082c <main_thread+0x64>)
 8000802:	f7ff fe99 	bl	8000538 <printf_>
 8000806:	f44f 5000 	mov.w	r0, #8192	; 0x2000
 800080a:	f000 fb35 	bl	8000e78 <led_off>
 800080e:	f44f 60fa 	mov.w	r0, #2000	; 0x7d0
 8000812:	f000 f8df 	bl	80009d4 <timer_delay_ms>
 8000816:	e7e9      	b.n	80007ec <main_thread+0x24>
 8000818:	080010ab 	.word	0x080010ab
 800081c:	20000570 	.word	0x20000570
 8000820:	08000745 	.word	0x08000745
 8000824:	080007b5 	.word	0x080007b5
 8000828:	20000970 	.word	0x20000970
 800082c:	080010e6 	.word	0x080010e6

08000830 <TIM_TimeBaseInit>:
 8000830:	4a1c      	ldr	r2, [pc, #112]	; (80008a4 <TIM_TimeBaseInit+0x74>)
 8000832:	8803      	ldrh	r3, [r0, #0]
 8000834:	4290      	cmp	r0, r2
 8000836:	b29b      	uxth	r3, r3
 8000838:	d012      	beq.n	8000860 <TIM_TimeBaseInit+0x30>
 800083a:	f502 6280 	add.w	r2, r2, #1024	; 0x400
 800083e:	4290      	cmp	r0, r2
 8000840:	d00e      	beq.n	8000860 <TIM_TimeBaseInit+0x30>
 8000842:	f1b0 4f80 	cmp.w	r0, #1073741824	; 0x40000000
 8000846:	d00b      	beq.n	8000860 <TIM_TimeBaseInit+0x30>
 8000848:	f5a2 3280 	sub.w	r2, r2, #65536	; 0x10000
 800084c:	4290      	cmp	r0, r2
 800084e:	d007      	beq.n	8000860 <TIM_TimeBaseInit+0x30>
 8000850:	f502 6280 	add.w	r2, r2, #1024	; 0x400
 8000854:	4290      	cmp	r0, r2
 8000856:	d003      	beq.n	8000860 <TIM_TimeBaseInit+0x30>
 8000858:	f502 6280 	add.w	r2, r2, #1024	; 0x400
 800085c:	4290      	cmp	r0, r2
 800085e:	d103      	bne.n	8000868 <TIM_TimeBaseInit+0x38>
 8000860:	884a      	ldrh	r2, [r1, #2]
 8000862:	f023 0370 	bic.w	r3, r3, #112	; 0x70
 8000866:	4313      	orrs	r3, r2
 8000868:	4a0f      	ldr	r2, [pc, #60]	; (80008a8 <TIM_TimeBaseInit+0x78>)
 800086a:	4290      	cmp	r0, r2
 800086c:	d008      	beq.n	8000880 <TIM_TimeBaseInit+0x50>
 800086e:	f502 6280 	add.w	r2, r2, #1024	; 0x400
 8000872:	4290      	cmp	r0, r2
 8000874:	d004      	beq.n	8000880 <TIM_TimeBaseInit+0x50>
 8000876:	f423 7340 	bic.w	r3, r3, #768	; 0x300
 800087a:	890a      	ldrh	r2, [r1, #8]
 800087c:	b29b      	uxth	r3, r3
 800087e:	4313      	orrs	r3, r2
 8000880:	8003      	strh	r3, [r0, #0]
 8000882:	684b      	ldr	r3, [r1, #4]
 8000884:	62c3      	str	r3, [r0, #44]	; 0x2c
 8000886:	880b      	ldrh	r3, [r1, #0]
 8000888:	8503      	strh	r3, [r0, #40]	; 0x28
 800088a:	4b06      	ldr	r3, [pc, #24]	; (80008a4 <TIM_TimeBaseInit+0x74>)
 800088c:	4298      	cmp	r0, r3
 800088e:	d003      	beq.n	8000898 <TIM_TimeBaseInit+0x68>
 8000890:	f503 6380 	add.w	r3, r3, #1024	; 0x400
 8000894:	4298      	cmp	r0, r3
 8000896:	d101      	bne.n	800089c <TIM_TimeBaseInit+0x6c>
 8000898:	7a8b      	ldrb	r3, [r1, #10]
 800089a:	8603      	strh	r3, [r0, #48]	; 0x30
 800089c:	2301      	movs	r3, #1
 800089e:	8283      	strh	r3, [r0, #20]
 80008a0:	4770      	bx	lr
 80008a2:	bf00      	nop
 80008a4:	40010000 	.word	0x40010000
 80008a8:	40001000 	.word	0x40001000

080008ac <TIM_Cmd>:
 80008ac:	8803      	ldrh	r3, [r0, #0]
 80008ae:	b119      	cbz	r1, 80008b8 <TIM_Cmd+0xc>
 80008b0:	b29b      	uxth	r3, r3
 80008b2:	f043 0301 	orr.w	r3, r3, #1
 80008b6:	e003      	b.n	80008c0 <TIM_Cmd+0x14>
 80008b8:	f023 0301 	bic.w	r3, r3, #1
 80008bc:	041b      	lsls	r3, r3, #16
 80008be:	0c1b      	lsrs	r3, r3, #16
 80008c0:	8003      	strh	r3, [r0, #0]
 80008c2:	4770      	bx	lr

080008c4 <TIM_ClearITPendingBit>:
 80008c4:	43c9      	mvns	r1, r1
 80008c6:	b289      	uxth	r1, r1
 80008c8:	8201      	strh	r1, [r0, #16]
 80008ca:	4770      	bx	lr

080008cc <timer_init>:
 80008cc:	b530      	push	{r4, r5, lr}
 80008ce:	2000      	movs	r0, #0
 80008d0:	b085      	sub	sp, #20
 80008d2:	4a1e      	ldr	r2, [pc, #120]	; (800094c <timer_init+0x80>)
 80008d4:	f44f 6380 	mov.w	r3, #1024	; 0x400
 80008d8:	f822 3010 	strh.w	r3, [r2, r0, lsl #1]
 80008dc:	4a1c      	ldr	r2, [pc, #112]	; (8000950 <timer_init+0x84>)
 80008de:	f822 3010 	strh.w	r3, [r2, r0, lsl #1]
 80008e2:	4b1c      	ldr	r3, [pc, #112]	; (8000954 <timer_init+0x88>)
 80008e4:	2400      	movs	r4, #0
 80008e6:	f823 4010 	strh.w	r4, [r3, r0, lsl #1]
 80008ea:	3001      	adds	r0, #1
 80008ec:	2804      	cmp	r0, #4
 80008ee:	4625      	mov	r5, r4
 80008f0:	d1ef      	bne.n	80008d2 <timer_init+0x6>
 80008f2:	4b19      	ldr	r3, [pc, #100]	; (8000958 <timer_init+0x8c>)
 80008f4:	2101      	movs	r1, #1
 80008f6:	601c      	str	r4, [r3, #0]
 80008f8:	f000 fa5a 	bl	8000db0 <RCC_APB1PeriphClockCmd>
 80008fc:	f8ad 4006 	strh.w	r4, [sp, #6]
 8000900:	f8ad 400c 	strh.w	r4, [sp, #12]
 8000904:	f88d 400e 	strb.w	r4, [sp, #14]
 8000908:	4c14      	ldr	r4, [pc, #80]	; (800095c <timer_init+0x90>)
 800090a:	2353      	movs	r3, #83	; 0x53
 800090c:	f8ad 3004 	strh.w	r3, [sp, #4]
 8000910:	4620      	mov	r0, r4
 8000912:	2331      	movs	r3, #49	; 0x31
 8000914:	a901      	add	r1, sp, #4
 8000916:	9302      	str	r3, [sp, #8]
 8000918:	f7ff ff8a 	bl	8000830 <TIM_TimeBaseInit>
 800091c:	4620      	mov	r0, r4
 800091e:	2101      	movs	r1, #1
 8000920:	f7ff ffc4 	bl	80008ac <TIM_Cmd>
 8000924:	89a3      	ldrh	r3, [r4, #12]
 8000926:	b29b      	uxth	r3, r3
 8000928:	f043 0301 	orr.w	r3, r3, #1
 800092c:	81a3      	strh	r3, [r4, #12]
 800092e:	231e      	movs	r3, #30
 8000930:	f88d 3000 	strb.w	r3, [sp]
 8000934:	4668      	mov	r0, sp
 8000936:	2301      	movs	r3, #1
 8000938:	f88d 5001 	strb.w	r5, [sp, #1]
 800093c:	f88d 3002 	strb.w	r3, [sp, #2]
 8000940:	f88d 3003 	strb.w	r3, [sp, #3]
 8000944:	f000 faf2 	bl	8000f2c <NVIC_Init>
 8000948:	b005      	add	sp, #20
 800094a:	bd30      	pop	{r4, r5, pc}
 800094c:	20000b84 	.word	0x20000b84
 8000950:	20000b78 	.word	0x20000b78
 8000954:	20000b70 	.word	0x20000b70
 8000958:	20000b80 	.word	0x20000b80
 800095c:	40000800 	.word	0x40000800

08000960 <TIM4_IRQHandler>:
 8000960:	2300      	movs	r3, #0
 8000962:	4a10      	ldr	r2, [pc, #64]	; (80009a4 <TIM4_IRQHandler+0x44>)
 8000964:	f832 1013 	ldrh.w	r1, [r2, r3, lsl #1]
 8000968:	b289      	uxth	r1, r1
 800096a:	b129      	cbz	r1, 8000978 <TIM4_IRQHandler+0x18>
 800096c:	f832 1013 	ldrh.w	r1, [r2, r3, lsl #1]
 8000970:	b289      	uxth	r1, r1
 8000972:	3901      	subs	r1, #1
 8000974:	b289      	uxth	r1, r1
 8000976:	e007      	b.n	8000988 <TIM4_IRQHandler+0x28>
 8000978:	490b      	ldr	r1, [pc, #44]	; (80009a8 <TIM4_IRQHandler+0x48>)
 800097a:	f831 1013 	ldrh.w	r1, [r1, r3, lsl #1]
 800097e:	b289      	uxth	r1, r1
 8000980:	f822 1013 	strh.w	r1, [r2, r3, lsl #1]
 8000984:	4a09      	ldr	r2, [pc, #36]	; (80009ac <TIM4_IRQHandler+0x4c>)
 8000986:	2101      	movs	r1, #1
 8000988:	f822 1013 	strh.w	r1, [r2, r3, lsl #1]
 800098c:	3301      	adds	r3, #1
 800098e:	2b04      	cmp	r3, #4
 8000990:	d1e7      	bne.n	8000962 <TIM4_IRQHandler+0x2>
 8000992:	4b07      	ldr	r3, [pc, #28]	; (80009b0 <TIM4_IRQHandler+0x50>)
 8000994:	4807      	ldr	r0, [pc, #28]	; (80009b4 <TIM4_IRQHandler+0x54>)
 8000996:	681a      	ldr	r2, [r3, #0]
 8000998:	2101      	movs	r1, #1
 800099a:	3201      	adds	r2, #1
 800099c:	601a      	str	r2, [r3, #0]
 800099e:	f7ff bf91 	b.w	80008c4 <TIM_ClearITPendingBit>
 80009a2:	bf00      	nop
 80009a4:	20000b84 	.word	0x20000b84
 80009a8:	20000b78 	.word	0x20000b78
 80009ac:	20000b70 	.word	0x20000b70
 80009b0:	20000b80 	.word	0x20000b80
 80009b4:	40000800 	.word	0x40000800

080009b8 <timer_get_time>:
 80009b8:	b082      	sub	sp, #8
 80009ba:	b672      	cpsid	i
 80009bc:	4b04      	ldr	r3, [pc, #16]	; (80009d0 <timer_get_time+0x18>)
 80009be:	681b      	ldr	r3, [r3, #0]
 80009c0:	9301      	str	r3, [sp, #4]
 80009c2:	b662      	cpsie	i
 80009c4:	9801      	ldr	r0, [sp, #4]
 80009c6:	230a      	movs	r3, #10
 80009c8:	fbb0 f0f3 	udiv	r0, r0, r3
 80009cc:	b002      	add	sp, #8
 80009ce:	4770      	bx	lr
 80009d0:	20000b80 	.word	0x20000b80

080009d4 <timer_delay_ms>:
 80009d4:	b513      	push	{r0, r1, r4, lr}
 80009d6:	4604      	mov	r4, r0
 80009d8:	f7ff ffee 	bl	80009b8 <timer_get_time>
 80009dc:	4420      	add	r0, r4
 80009de:	9001      	str	r0, [sp, #4]
 80009e0:	9c01      	ldr	r4, [sp, #4]
 80009e2:	f7ff ffe9 	bl	80009b8 <timer_get_time>
 80009e6:	4284      	cmp	r4, r0
 80009e8:	d902      	bls.n	80009f0 <timer_delay_ms+0x1c>
 80009ea:	f000 f8c9 	bl	8000b80 <sleep>
 80009ee:	e7f7      	b.n	80009e0 <timer_delay_ms+0xc>
 80009f0:	b002      	add	sp, #8
 80009f2:	bd10      	pop	{r4, pc}

080009f4 <uart_write>:
 80009f4:	4b03      	ldr	r3, [pc, #12]	; (8000a04 <uart_write+0x10>)
 80009f6:	881a      	ldrh	r2, [r3, #0]
 80009f8:	0652      	lsls	r2, r2, #25
 80009fa:	d401      	bmi.n	8000a00 <uart_write+0xc>
 80009fc:	bf00      	nop
 80009fe:	e7f9      	b.n	80009f4 <uart_write>
 8000a00:	8098      	strh	r0, [r3, #4]
 8000a02:	4770      	bx	lr
 8000a04:	40011000 	.word	0x40011000

08000a08 <uart_init>:
 8000a08:	b530      	push	{r4, r5, lr}
 8000a0a:	2010      	movs	r0, #16
 8000a0c:	b087      	sub	sp, #28
 8000a0e:	2101      	movs	r1, #1
 8000a10:	f000 f9da 	bl	8000dc8 <RCC_APB2PeriphClockCmd>
 8000a14:	2001      	movs	r0, #1
 8000a16:	4d1c      	ldr	r5, [pc, #112]	; (8000a88 <uart_init+0x80>)
 8000a18:	4601      	mov	r1, r0
 8000a1a:	f000 f9bd 	bl	8000d98 <RCC_AHB1PeriphClockCmd>
 8000a1e:	f44f 63c0 	mov.w	r3, #1536	; 0x600
 8000a22:	2400      	movs	r4, #0
 8000a24:	9300      	str	r3, [sp, #0]
 8000a26:	4628      	mov	r0, r5
 8000a28:	2302      	movs	r3, #2
 8000a2a:	4669      	mov	r1, sp
 8000a2c:	f88d 3004 	strb.w	r3, [sp, #4]
 8000a30:	f88d 3005 	strb.w	r3, [sp, #5]
 8000a34:	f88d 4006 	strb.w	r4, [sp, #6]
 8000a38:	f88d 4007 	strb.w	r4, [sp, #7]
 8000a3c:	f000 fa22 	bl	8000e84 <GPIO_Init>
 8000a40:	4628      	mov	r0, r5
 8000a42:	2109      	movs	r1, #9
 8000a44:	2207      	movs	r2, #7
 8000a46:	f000 fa5e 	bl	8000f06 <GPIO_PinAFConfig>
 8000a4a:	2207      	movs	r2, #7
 8000a4c:	4628      	mov	r0, r5
 8000a4e:	210a      	movs	r1, #10
 8000a50:	f000 fa59 	bl	8000f06 <GPIO_PinAFConfig>
 8000a54:	f8ad 400c 	strh.w	r4, [sp, #12]
 8000a58:	f8ad 400e 	strh.w	r4, [sp, #14]
 8000a5c:	f8ad 4010 	strh.w	r4, [sp, #16]
 8000a60:	f8ad 4014 	strh.w	r4, [sp, #20]
 8000a64:	4c09      	ldr	r4, [pc, #36]	; (8000a8c <uart_init+0x84>)
 8000a66:	f44f 33e1 	mov.w	r3, #115200	; 0x1c200
 8000a6a:	9302      	str	r3, [sp, #8]
 8000a6c:	4620      	mov	r0, r4
 8000a6e:	230c      	movs	r3, #12
 8000a70:	a902      	add	r1, sp, #8
 8000a72:	f8ad 3012 	strh.w	r3, [sp, #18]
 8000a76:	f000 f80b 	bl	8000a90 <USART_Init>
 8000a7a:	4620      	mov	r0, r4
 8000a7c:	2101      	movs	r1, #1
 8000a7e:	f000 f861 	bl	8000b44 <USART_Cmd>
 8000a82:	b007      	add	sp, #28
 8000a84:	bd30      	pop	{r4, r5, pc}
 8000a86:	bf00      	nop
 8000a88:	40020000 	.word	0x40020000
 8000a8c:	40011000 	.word	0x40011000

08000a90 <USART_Init>:
 8000a90:	8a03      	ldrh	r3, [r0, #16]
 8000a92:	88ca      	ldrh	r2, [r1, #6]
 8000a94:	b29b      	uxth	r3, r3
 8000a96:	f423 5340 	bic.w	r3, r3, #12288	; 0x3000
 8000a9a:	b530      	push	{r4, r5, lr}
 8000a9c:	4313      	orrs	r3, r2
 8000a9e:	460d      	mov	r5, r1
 8000aa0:	8203      	strh	r3, [r0, #16]
 8000aa2:	8983      	ldrh	r3, [r0, #12]
 8000aa4:	8909      	ldrh	r1, [r1, #8]
 8000aa6:	88aa      	ldrh	r2, [r5, #4]
 8000aa8:	f423 53b0 	bic.w	r3, r3, #5632	; 0x1600
 8000aac:	430a      	orrs	r2, r1
 8000aae:	8969      	ldrh	r1, [r5, #10]
 8000ab0:	f023 030c 	bic.w	r3, r3, #12
 8000ab4:	430a      	orrs	r2, r1
 8000ab6:	041b      	lsls	r3, r3, #16
 8000ab8:	b292      	uxth	r2, r2
 8000aba:	0c1b      	lsrs	r3, r3, #16
 8000abc:	4313      	orrs	r3, r2
 8000abe:	8183      	strh	r3, [r0, #12]
 8000ac0:	8a83      	ldrh	r3, [r0, #20]
 8000ac2:	89aa      	ldrh	r2, [r5, #12]
 8000ac4:	b29b      	uxth	r3, r3
 8000ac6:	f423 7340 	bic.w	r3, r3, #768	; 0x300
 8000aca:	4313      	orrs	r3, r2
 8000acc:	b085      	sub	sp, #20
 8000ace:	8283      	strh	r3, [r0, #20]
 8000ad0:	4604      	mov	r4, r0
 8000ad2:	4668      	mov	r0, sp
 8000ad4:	f000 f91c 	bl	8000d10 <RCC_GetClocksFreq>
 8000ad8:	4b19      	ldr	r3, [pc, #100]	; (8000b40 <USART_Init+0xb0>)
 8000ada:	429c      	cmp	r4, r3
 8000adc:	d003      	beq.n	8000ae6 <USART_Init+0x56>
 8000ade:	f503 6380 	add.w	r3, r3, #1024	; 0x400
 8000ae2:	429c      	cmp	r4, r3
 8000ae4:	d101      	bne.n	8000aea <USART_Init+0x5a>
 8000ae6:	9b03      	ldr	r3, [sp, #12]
 8000ae8:	e000      	b.n	8000aec <USART_Init+0x5c>
 8000aea:	9b02      	ldr	r3, [sp, #8]
 8000aec:	89a2      	ldrh	r2, [r4, #12]
 8000aee:	b212      	sxth	r2, r2
 8000af0:	2a00      	cmp	r2, #0
 8000af2:	682a      	ldr	r2, [r5, #0]
 8000af4:	f04f 0119 	mov.w	r1, #25
 8000af8:	bfb4      	ite	lt
 8000afa:	0052      	lsllt	r2, r2, #1
 8000afc:	0092      	lslge	r2, r2, #2
 8000afe:	4359      	muls	r1, r3
 8000b00:	fbb1 f1f2 	udiv	r1, r1, r2
 8000b04:	2364      	movs	r3, #100	; 0x64
 8000b06:	fbb1 f2f3 	udiv	r2, r1, r3
 8000b0a:	0112      	lsls	r2, r2, #4
 8000b0c:	0910      	lsrs	r0, r2, #4
 8000b0e:	fb03 1110 	mls	r1, r3, r0, r1
 8000b12:	89a0      	ldrh	r0, [r4, #12]
 8000b14:	b200      	sxth	r0, r0
 8000b16:	2800      	cmp	r0, #0
 8000b18:	da06      	bge.n	8000b28 <USART_Init+0x98>
 8000b1a:	00c9      	lsls	r1, r1, #3
 8000b1c:	3132      	adds	r1, #50	; 0x32
 8000b1e:	fbb1 f3f3 	udiv	r3, r1, r3
 8000b22:	f003 0307 	and.w	r3, r3, #7
 8000b26:	e005      	b.n	8000b34 <USART_Init+0xa4>
 8000b28:	0109      	lsls	r1, r1, #4
 8000b2a:	3132      	adds	r1, #50	; 0x32
 8000b2c:	fbb1 f3f3 	udiv	r3, r1, r3
 8000b30:	f003 030f 	and.w	r3, r3, #15
 8000b34:	431a      	orrs	r2, r3
 8000b36:	b292      	uxth	r2, r2
 8000b38:	8122      	strh	r2, [r4, #8]
 8000b3a:	b005      	add	sp, #20
 8000b3c:	bd30      	pop	{r4, r5, pc}
 8000b3e:	bf00      	nop
 8000b40:	40011000 	.word	0x40011000

08000b44 <USART_Cmd>:
 8000b44:	8983      	ldrh	r3, [r0, #12]
 8000b46:	b119      	cbz	r1, 8000b50 <USART_Cmd+0xc>
 8000b48:	b29b      	uxth	r3, r3
 8000b4a:	f443 5300 	orr.w	r3, r3, #8192	; 0x2000
 8000b4e:	e003      	b.n	8000b58 <USART_Cmd+0x14>
 8000b50:	f423 5300 	bic.w	r3, r3, #8192	; 0x2000
 8000b54:	041b      	lsls	r3, r3, #16
 8000b56:	0c1b      	lsrs	r3, r3, #16
 8000b58:	8183      	strh	r3, [r0, #12]
 8000b5a:	4770      	bx	lr

08000b5c <sys_tick_init>:
 8000b5c:	4b05      	ldr	r3, [pc, #20]	; (8000b74 <sys_tick_init+0x18>)
 8000b5e:	4a06      	ldr	r2, [pc, #24]	; (8000b78 <sys_tick_init+0x1c>)
 8000b60:	605a      	str	r2, [r3, #4]
 8000b62:	4a06      	ldr	r2, [pc, #24]	; (8000b7c <sys_tick_init+0x20>)
 8000b64:	21f0      	movs	r1, #240	; 0xf0
 8000b66:	f882 1023 	strb.w	r1, [r2, #35]	; 0x23
 8000b6a:	2200      	movs	r2, #0
 8000b6c:	609a      	str	r2, [r3, #8]
 8000b6e:	2207      	movs	r2, #7
 8000b70:	601a      	str	r2, [r3, #0]
 8000b72:	4770      	bx	lr
 8000b74:	e000e010 	.word	0xe000e010
 8000b78:	00029040 	.word	0x00029040
 8000b7c:	e000ed00 	.word	0xe000ed00

08000b80 <sleep>:
 8000b80:	bf30      	wfi
 8000b82:	4770      	bx	lr

08000b84 <sytem_clock_init>:
 8000b84:	f000 b800 	b.w	8000b88 <SystemInit>

08000b88 <SystemInit>:
 8000b88:	4b3b      	ldr	r3, [pc, #236]	; (8000c78 <SystemInit+0xf0>)
 8000b8a:	f8d3 2088 	ldr.w	r2, [r3, #136]	; 0x88
 8000b8e:	f442 0270 	orr.w	r2, r2, #15728640	; 0xf00000
 8000b92:	f8c3 2088 	str.w	r2, [r3, #136]	; 0x88
 8000b96:	f8d3 2088 	ldr.w	r2, [r3, #136]	; 0x88
 8000b9a:	f442 0270 	orr.w	r2, r2, #15728640	; 0xf00000
 8000b9e:	f8c3 2088 	str.w	r2, [r3, #136]	; 0x88
 8000ba2:	4b36      	ldr	r3, [pc, #216]	; (8000c7c <SystemInit+0xf4>)
 8000ba4:	681a      	ldr	r2, [r3, #0]
 8000ba6:	f042 0201 	orr.w	r2, r2, #1
 8000baa:	601a      	str	r2, [r3, #0]
 8000bac:	2200      	movs	r2, #0
 8000bae:	609a      	str	r2, [r3, #8]
 8000bb0:	6819      	ldr	r1, [r3, #0]
 8000bb2:	f021 7184 	bic.w	r1, r1, #17301504	; 0x1080000
 8000bb6:	f421 3180 	bic.w	r1, r1, #65536	; 0x10000
 8000bba:	6019      	str	r1, [r3, #0]
 8000bbc:	4930      	ldr	r1, [pc, #192]	; (8000c80 <SystemInit+0xf8>)
 8000bbe:	6059      	str	r1, [r3, #4]
 8000bc0:	6819      	ldr	r1, [r3, #0]
 8000bc2:	b082      	sub	sp, #8
 8000bc4:	f421 2180 	bic.w	r1, r1, #262144	; 0x40000
 8000bc8:	6019      	str	r1, [r3, #0]
 8000bca:	60da      	str	r2, [r3, #12]
 8000bcc:	9200      	str	r2, [sp, #0]
 8000bce:	9201      	str	r2, [sp, #4]
 8000bd0:	681a      	ldr	r2, [r3, #0]
 8000bd2:	f442 3280 	orr.w	r2, r2, #65536	; 0x10000
 8000bd6:	601a      	str	r2, [r3, #0]
 8000bd8:	4b28      	ldr	r3, [pc, #160]	; (8000c7c <SystemInit+0xf4>)
 8000bda:	681a      	ldr	r2, [r3, #0]
 8000bdc:	f402 3200 	and.w	r2, r2, #131072	; 0x20000
 8000be0:	9201      	str	r2, [sp, #4]
 8000be2:	9a00      	ldr	r2, [sp, #0]
 8000be4:	3201      	adds	r2, #1
 8000be6:	9200      	str	r2, [sp, #0]
 8000be8:	9a01      	ldr	r2, [sp, #4]
 8000bea:	b91a      	cbnz	r2, 8000bf4 <SystemInit+0x6c>
 8000bec:	9a00      	ldr	r2, [sp, #0]
 8000bee:	f5b2 6fa0 	cmp.w	r2, #1280	; 0x500
 8000bf2:	d1f1      	bne.n	8000bd8 <SystemInit+0x50>
 8000bf4:	681b      	ldr	r3, [r3, #0]
 8000bf6:	f413 3300 	ands.w	r3, r3, #131072	; 0x20000
 8000bfa:	bf18      	it	ne
 8000bfc:	2301      	movne	r3, #1
 8000bfe:	9301      	str	r3, [sp, #4]
 8000c00:	9b01      	ldr	r3, [sp, #4]
 8000c02:	2b01      	cmp	r3, #1
 8000c04:	d005      	beq.n	8000c12 <SystemInit+0x8a>
 8000c06:	4b1c      	ldr	r3, [pc, #112]	; (8000c78 <SystemInit+0xf0>)
 8000c08:	f04f 6200 	mov.w	r2, #134217728	; 0x8000000
 8000c0c:	609a      	str	r2, [r3, #8]
 8000c0e:	b002      	add	sp, #8
 8000c10:	4770      	bx	lr
 8000c12:	4b1a      	ldr	r3, [pc, #104]	; (8000c7c <SystemInit+0xf4>)
 8000c14:	6c1a      	ldr	r2, [r3, #64]	; 0x40
 8000c16:	f042 5280 	orr.w	r2, r2, #268435456	; 0x10000000
 8000c1a:	641a      	str	r2, [r3, #64]	; 0x40
 8000c1c:	4a19      	ldr	r2, [pc, #100]	; (8000c84 <SystemInit+0xfc>)
 8000c1e:	6811      	ldr	r1, [r2, #0]
 8000c20:	f441 4180 	orr.w	r1, r1, #16384	; 0x4000
 8000c24:	6011      	str	r1, [r2, #0]
 8000c26:	689a      	ldr	r2, [r3, #8]
 8000c28:	f042 0290 	orr.w	r2, r2, #144	; 0x90
 8000c2c:	609a      	str	r2, [r3, #8]
 8000c2e:	689a      	ldr	r2, [r3, #8]
 8000c30:	f442 4200 	orr.w	r2, r2, #32768	; 0x8000
 8000c34:	609a      	str	r2, [r3, #8]
 8000c36:	689a      	ldr	r2, [r3, #8]
 8000c38:	f442 52a0 	orr.w	r2, r2, #5120	; 0x1400
 8000c3c:	609a      	str	r2, [r3, #8]
 8000c3e:	4a12      	ldr	r2, [pc, #72]	; (8000c88 <SystemInit+0x100>)
 8000c40:	605a      	str	r2, [r3, #4]
 8000c42:	681a      	ldr	r2, [r3, #0]
 8000c44:	f042 7280 	orr.w	r2, r2, #16777216	; 0x1000000
 8000c48:	601a      	str	r2, [r3, #0]
 8000c4a:	6819      	ldr	r1, [r3, #0]
 8000c4c:	4a0b      	ldr	r2, [pc, #44]	; (8000c7c <SystemInit+0xf4>)
 8000c4e:	0189      	lsls	r1, r1, #6
 8000c50:	d5fb      	bpl.n	8000c4a <SystemInit+0xc2>
 8000c52:	4b0e      	ldr	r3, [pc, #56]	; (8000c8c <SystemInit+0x104>)
 8000c54:	f240 6105 	movw	r1, #1541	; 0x605
 8000c58:	6019      	str	r1, [r3, #0]
 8000c5a:	6893      	ldr	r3, [r2, #8]
 8000c5c:	f023 0303 	bic.w	r3, r3, #3
 8000c60:	6093      	str	r3, [r2, #8]
 8000c62:	6893      	ldr	r3, [r2, #8]
 8000c64:	f043 0302 	orr.w	r3, r3, #2
 8000c68:	6093      	str	r3, [r2, #8]
 8000c6a:	4b04      	ldr	r3, [pc, #16]	; (8000c7c <SystemInit+0xf4>)
 8000c6c:	689b      	ldr	r3, [r3, #8]
 8000c6e:	f003 030c 	and.w	r3, r3, #12
 8000c72:	2b08      	cmp	r3, #8
 8000c74:	d1f9      	bne.n	8000c6a <SystemInit+0xe2>
 8000c76:	e7c6      	b.n	8000c06 <SystemInit+0x7e>
 8000c78:	e000ed00 	.word	0xe000ed00
 8000c7c:	40023800 	.word	0x40023800
 8000c80:	24003010 	.word	0x24003010
 8000c84:	40007000 	.word	0x40007000
 8000c88:	07405408 	.word	0x07405408
 8000c8c:	40023c00 	.word	0x40023c00

08000c90 <Default_Handler>:
 8000c90:	4668      	mov	r0, sp
 8000c92:	f020 0107 	bic.w	r1, r0, #7
 8000c96:	468d      	mov	sp, r1
 8000c98:	bf00      	nop
 8000c9a:	e7fd      	b.n	8000c98 <Default_Handler+0x8>

08000c9c <HardFault_Handler>:
 8000c9c:	f44f 5000 	mov.w	r0, #8192	; 0x2000
 8000ca0:	f000 f8e4 	bl	8000e6c <led_on>
 8000ca4:	4b06      	ldr	r3, [pc, #24]	; (8000cc0 <HardFault_Handler+0x24>)
 8000ca6:	3b01      	subs	r3, #1
 8000ca8:	d001      	beq.n	8000cae <HardFault_Handler+0x12>
 8000caa:	bf00      	nop
 8000cac:	e7fb      	b.n	8000ca6 <HardFault_Handler+0xa>
 8000cae:	f44f 5000 	mov.w	r0, #8192	; 0x2000
 8000cb2:	f000 f8e1 	bl	8000e78 <led_off>
 8000cb6:	4b02      	ldr	r3, [pc, #8]	; (8000cc0 <HardFault_Handler+0x24>)
 8000cb8:	3b01      	subs	r3, #1
 8000cba:	d0ef      	beq.n	8000c9c <HardFault_Handler>
 8000cbc:	bf00      	nop
 8000cbe:	e7fb      	b.n	8000cb8 <HardFault_Handler+0x1c>
 8000cc0:	00989681 	.word	0x00989681

08000cc4 <_reset_init>:
 8000cc4:	4a0e      	ldr	r2, [pc, #56]	; (8000d00 <_reset_init+0x3c>)
 8000cc6:	480f      	ldr	r0, [pc, #60]	; (8000d04 <_reset_init+0x40>)
 8000cc8:	1a80      	subs	r0, r0, r2
 8000cca:	1080      	asrs	r0, r0, #2
 8000ccc:	2300      	movs	r3, #0
 8000cce:	4283      	cmp	r3, r0
 8000cd0:	d006      	beq.n	8000ce0 <_reset_init+0x1c>
 8000cd2:	490d      	ldr	r1, [pc, #52]	; (8000d08 <_reset_init+0x44>)
 8000cd4:	f851 1023 	ldr.w	r1, [r1, r3, lsl #2]
 8000cd8:	f842 1023 	str.w	r1, [r2, r3, lsl #2]
 8000cdc:	3301      	adds	r3, #1
 8000cde:	e7f6      	b.n	8000cce <_reset_init+0xa>
 8000ce0:	4b0a      	ldr	r3, [pc, #40]	; (8000d0c <_reset_init+0x48>)
 8000ce2:	f8d3 2088 	ldr.w	r2, [r3, #136]	; 0x88
 8000ce6:	f442 0270 	orr.w	r2, r2, #15728640	; 0xf00000
 8000cea:	f8c3 2088 	str.w	r2, [r3, #136]	; 0x88
 8000cee:	f503 730c 	add.w	r3, r3, #560	; 0x230
 8000cf2:	685a      	ldr	r2, [r3, #4]
 8000cf4:	f022 4240 	bic.w	r2, r2, #3221225472	; 0xc0000000
 8000cf8:	605a      	str	r2, [r3, #4]
 8000cfa:	f7ff bcfd 	b.w	80006f8 <main>
 8000cfe:	bf00      	nop
 8000d00:	20000000 	.word	0x20000000
 8000d04:	20000010 	.word	0x20000010
 8000d08:	08001108 	.word	0x08001108
 8000d0c:	e000ed00 	.word	0xe000ed00

08000d10 <RCC_GetClocksFreq>:
 8000d10:	4b1d      	ldr	r3, [pc, #116]	; (8000d88 <RCC_GetClocksFreq+0x78>)
 8000d12:	689a      	ldr	r2, [r3, #8]
 8000d14:	f002 020c 	and.w	r2, r2, #12
 8000d18:	2a04      	cmp	r2, #4
 8000d1a:	b510      	push	{r4, lr}
 8000d1c:	d003      	beq.n	8000d26 <RCC_GetClocksFreq+0x16>
 8000d1e:	2a08      	cmp	r2, #8
 8000d20:	d003      	beq.n	8000d2a <RCC_GetClocksFreq+0x1a>
 8000d22:	4b1a      	ldr	r3, [pc, #104]	; (8000d8c <RCC_GetClocksFreq+0x7c>)
 8000d24:	e018      	b.n	8000d58 <RCC_GetClocksFreq+0x48>
 8000d26:	4b1a      	ldr	r3, [pc, #104]	; (8000d90 <RCC_GetClocksFreq+0x80>)
 8000d28:	e016      	b.n	8000d58 <RCC_GetClocksFreq+0x48>
 8000d2a:	6859      	ldr	r1, [r3, #4]
 8000d2c:	685a      	ldr	r2, [r3, #4]
 8000d2e:	f411 0f80 	tst.w	r1, #4194304	; 0x400000
 8000d32:	6859      	ldr	r1, [r3, #4]
 8000d34:	bf14      	ite	ne
 8000d36:	4b16      	ldrne	r3, [pc, #88]	; (8000d90 <RCC_GetClocksFreq+0x80>)
 8000d38:	4b14      	ldreq	r3, [pc, #80]	; (8000d8c <RCC_GetClocksFreq+0x7c>)
 8000d3a:	f002 023f 	and.w	r2, r2, #63	; 0x3f
 8000d3e:	fbb3 f3f2 	udiv	r3, r3, r2
 8000d42:	4a11      	ldr	r2, [pc, #68]	; (8000d88 <RCC_GetClocksFreq+0x78>)
 8000d44:	6852      	ldr	r2, [r2, #4]
 8000d46:	f3c2 4201 	ubfx	r2, r2, #16, #2
 8000d4a:	f3c1 1188 	ubfx	r1, r1, #6, #9
 8000d4e:	3201      	adds	r2, #1
 8000d50:	434b      	muls	r3, r1
 8000d52:	0052      	lsls	r2, r2, #1
 8000d54:	fbb3 f3f2 	udiv	r3, r3, r2
 8000d58:	490b      	ldr	r1, [pc, #44]	; (8000d88 <RCC_GetClocksFreq+0x78>)
 8000d5a:	6003      	str	r3, [r0, #0]
 8000d5c:	688b      	ldr	r3, [r1, #8]
 8000d5e:	4a0d      	ldr	r2, [pc, #52]	; (8000d94 <RCC_GetClocksFreq+0x84>)
 8000d60:	f3c3 1303 	ubfx	r3, r3, #4, #4
 8000d64:	5cd4      	ldrb	r4, [r2, r3]
 8000d66:	6803      	ldr	r3, [r0, #0]
 8000d68:	40e3      	lsrs	r3, r4
 8000d6a:	6043      	str	r3, [r0, #4]
 8000d6c:	688c      	ldr	r4, [r1, #8]
 8000d6e:	f3c4 2482 	ubfx	r4, r4, #10, #3
 8000d72:	5d14      	ldrb	r4, [r2, r4]
 8000d74:	fa23 f404 	lsr.w	r4, r3, r4
 8000d78:	6084      	str	r4, [r0, #8]
 8000d7a:	6889      	ldr	r1, [r1, #8]
 8000d7c:	f3c1 3142 	ubfx	r1, r1, #13, #3
 8000d80:	5c52      	ldrb	r2, [r2, r1]
 8000d82:	40d3      	lsrs	r3, r2
 8000d84:	60c3      	str	r3, [r0, #12]
 8000d86:	bd10      	pop	{r4, pc}
 8000d88:	40023800 	.word	0x40023800
 8000d8c:	00f42400 	.word	0x00f42400
 8000d90:	007a1200 	.word	0x007a1200
 8000d94:	20000000 	.word	0x20000000

08000d98 <RCC_AHB1PeriphClockCmd>:
 8000d98:	4b04      	ldr	r3, [pc, #16]	; (8000dac <RCC_AHB1PeriphClockCmd+0x14>)
 8000d9a:	6b1a      	ldr	r2, [r3, #48]	; 0x30
 8000d9c:	b109      	cbz	r1, 8000da2 <RCC_AHB1PeriphClockCmd+0xa>
 8000d9e:	4310      	orrs	r0, r2
 8000da0:	e001      	b.n	8000da6 <RCC_AHB1PeriphClockCmd+0xe>
 8000da2:	ea22 0000 	bic.w	r0, r2, r0
 8000da6:	6318      	str	r0, [r3, #48]	; 0x30
 8000da8:	4770      	bx	lr
 8000daa:	bf00      	nop
 8000dac:	40023800 	.word	0x40023800

08000db0 <RCC_APB1PeriphClockCmd>:
 8000db0:	4b04      	ldr	r3, [pc, #16]	; (8000dc4 <RCC_APB1PeriphClockCmd+0x14>)
 8000db2:	6c1a      	ldr	r2, [r3, #64]	; 0x40
 8000db4:	b109      	cbz	r1, 8000dba <RCC_APB1PeriphClockCmd+0xa>
 8000db6:	4310      	orrs	r0, r2
 8000db8:	e001      	b.n	8000dbe <RCC_APB1PeriphClockCmd+0xe>
 8000dba:	ea22 0000 	bic.w	r0, r2, r0
 8000dbe:	6418      	str	r0, [r3, #64]	; 0x40
 8000dc0:	4770      	bx	lr
 8000dc2:	bf00      	nop
 8000dc4:	40023800 	.word	0x40023800

08000dc8 <RCC_APB2PeriphClockCmd>:
 8000dc8:	4b04      	ldr	r3, [pc, #16]	; (8000ddc <RCC_APB2PeriphClockCmd+0x14>)
 8000dca:	6c5a      	ldr	r2, [r3, #68]	; 0x44
 8000dcc:	b109      	cbz	r1, 8000dd2 <RCC_APB2PeriphClockCmd+0xa>
 8000dce:	4310      	orrs	r0, r2
 8000dd0:	e001      	b.n	8000dd6 <RCC_APB2PeriphClockCmd+0xe>
 8000dd2:	ea22 0000 	bic.w	r0, r2, r0
 8000dd6:	6458      	str	r0, [r3, #68]	; 0x44
 8000dd8:	4770      	bx	lr
 8000dda:	bf00      	nop
 8000ddc:	40023800 	.word	0x40023800

08000de0 <lib_low_level_init>:
 8000de0:	b508      	push	{r3, lr}
 8000de2:	f7ff fecf 	bl	8000b84 <sytem_clock_init>
 8000de6:	f000 f807 	bl	8000df8 <gpio_init>
 8000dea:	f7ff fe0d 	bl	8000a08 <uart_init>
 8000dee:	e8bd 4008 	ldmia.w	sp!, {r3, lr}
 8000df2:	f7ff bd6b 	b.w	80008cc <timer_init>
	...

08000df8 <gpio_init>:
 8000df8:	b513      	push	{r0, r1, r4, lr}
 8000dfa:	2001      	movs	r0, #1
 8000dfc:	4601      	mov	r1, r0
 8000dfe:	f7ff ffcb 	bl	8000d98 <RCC_AHB1PeriphClockCmd>
 8000e02:	2002      	movs	r0, #2
 8000e04:	2101      	movs	r1, #1
 8000e06:	f7ff ffc7 	bl	8000d98 <RCC_AHB1PeriphClockCmd>
 8000e0a:	2004      	movs	r0, #4
 8000e0c:	2101      	movs	r1, #1
 8000e0e:	f7ff ffc3 	bl	8000d98 <RCC_AHB1PeriphClockCmd>
 8000e12:	2008      	movs	r0, #8
 8000e14:	2101      	movs	r1, #1
 8000e16:	f7ff ffbf 	bl	8000d98 <RCC_AHB1PeriphClockCmd>
 8000e1a:	2010      	movs	r0, #16
 8000e1c:	2101      	movs	r1, #1
 8000e1e:	f7ff ffbb 	bl	8000d98 <RCC_AHB1PeriphClockCmd>
 8000e22:	2020      	movs	r0, #32
 8000e24:	2101      	movs	r1, #1
 8000e26:	f7ff ffb7 	bl	8000d98 <RCC_AHB1PeriphClockCmd>
 8000e2a:	4c0f      	ldr	r4, [pc, #60]	; (8000e68 <gpio_init+0x70>)
 8000e2c:	f44f 4360 	mov.w	r3, #57344	; 0xe000
 8000e30:	9300      	str	r3, [sp, #0]
 8000e32:	2301      	movs	r3, #1
 8000e34:	f88d 3004 	strb.w	r3, [sp, #4]
 8000e38:	2203      	movs	r2, #3
 8000e3a:	2300      	movs	r3, #0
 8000e3c:	4620      	mov	r0, r4
 8000e3e:	4669      	mov	r1, sp
 8000e40:	f88d 3006 	strb.w	r3, [sp, #6]
 8000e44:	f88d 3007 	strb.w	r3, [sp, #7]
 8000e48:	f88d 2005 	strb.w	r2, [sp, #5]
 8000e4c:	f000 f81a 	bl	8000e84 <GPIO_Init>
 8000e50:	f44f 5300 	mov.w	r3, #8192	; 0x2000
 8000e54:	8363      	strh	r3, [r4, #26]
 8000e56:	f44f 4380 	mov.w	r3, #16384	; 0x4000
 8000e5a:	8363      	strh	r3, [r4, #26]
 8000e5c:	f44f 4300 	mov.w	r3, #32768	; 0x8000
 8000e60:	8363      	strh	r3, [r4, #26]
 8000e62:	b002      	add	sp, #8
 8000e64:	bd10      	pop	{r4, pc}
 8000e66:	bf00      	nop
 8000e68:	40021400 	.word	0x40021400

08000e6c <led_on>:
 8000e6c:	4b01      	ldr	r3, [pc, #4]	; (8000e74 <led_on+0x8>)
 8000e6e:	b280      	uxth	r0, r0
 8000e70:	8318      	strh	r0, [r3, #24]
 8000e72:	4770      	bx	lr
 8000e74:	40021400 	.word	0x40021400

08000e78 <led_off>:
 8000e78:	4b01      	ldr	r3, [pc, #4]	; (8000e80 <led_off+0x8>)
 8000e7a:	b280      	uxth	r0, r0
 8000e7c:	8358      	strh	r0, [r3, #26]
 8000e7e:	4770      	bx	lr
 8000e80:	40021400 	.word	0x40021400

08000e84 <GPIO_Init>:
 8000e84:	e92d 41f0 	stmdb	sp!, {r4, r5, r6, r7, r8, lr}
 8000e88:	680f      	ldr	r7, [r1, #0]
 8000e8a:	2300      	movs	r3, #0
 8000e8c:	2201      	movs	r2, #1
 8000e8e:	409a      	lsls	r2, r3
 8000e90:	ea02 0507 	and.w	r5, r2, r7
 8000e94:	4295      	cmp	r5, r2
 8000e96:	d131      	bne.n	8000efc <GPIO_Init+0x78>
 8000e98:	005a      	lsls	r2, r3, #1
 8000e9a:	2403      	movs	r4, #3
 8000e9c:	6806      	ldr	r6, [r0, #0]
 8000e9e:	4094      	lsls	r4, r2
 8000ea0:	43e4      	mvns	r4, r4
 8000ea2:	4026      	ands	r6, r4
 8000ea4:	6006      	str	r6, [r0, #0]
 8000ea6:	790e      	ldrb	r6, [r1, #4]
 8000ea8:	f8d0 c000 	ldr.w	ip, [r0]
 8000eac:	fa06 f802 	lsl.w	r8, r6, r2
 8000eb0:	3e01      	subs	r6, #1
 8000eb2:	b2f6      	uxtb	r6, r6
 8000eb4:	ea48 0c0c 	orr.w	ip, r8, ip
 8000eb8:	2e01      	cmp	r6, #1
 8000eba:	f8c0 c000 	str.w	ip, [r0]
 8000ebe:	d814      	bhi.n	8000eea <GPIO_Init+0x66>
 8000ec0:	6886      	ldr	r6, [r0, #8]
 8000ec2:	f891 c005 	ldrb.w	ip, [r1, #5]
 8000ec6:	4026      	ands	r6, r4
 8000ec8:	6086      	str	r6, [r0, #8]
 8000eca:	6886      	ldr	r6, [r0, #8]
 8000ecc:	fa0c fc02 	lsl.w	ip, ip, r2
 8000ed0:	ea4c 0606 	orr.w	r6, ip, r6
 8000ed4:	6086      	str	r6, [r0, #8]
 8000ed6:	6846      	ldr	r6, [r0, #4]
 8000ed8:	ea26 0505 	bic.w	r5, r6, r5
 8000edc:	6045      	str	r5, [r0, #4]
 8000ede:	798d      	ldrb	r5, [r1, #6]
 8000ee0:	6846      	ldr	r6, [r0, #4]
 8000ee2:	409d      	lsls	r5, r3
 8000ee4:	b2ad      	uxth	r5, r5
 8000ee6:	4335      	orrs	r5, r6
 8000ee8:	6045      	str	r5, [r0, #4]
 8000eea:	68c5      	ldr	r5, [r0, #12]
 8000eec:	402c      	ands	r4, r5
 8000eee:	60c4      	str	r4, [r0, #12]
 8000ef0:	79cd      	ldrb	r5, [r1, #7]
 8000ef2:	68c4      	ldr	r4, [r0, #12]
 8000ef4:	fa05 f202 	lsl.w	r2, r5, r2
 8000ef8:	4322      	orrs	r2, r4
 8000efa:	60c2      	str	r2, [r0, #12]
 8000efc:	3301      	adds	r3, #1
 8000efe:	2b10      	cmp	r3, #16
 8000f00:	d1c4      	bne.n	8000e8c <GPIO_Init+0x8>
 8000f02:	e8bd 81f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, pc}

08000f06 <GPIO_PinAFConfig>:
 8000f06:	f001 0307 	and.w	r3, r1, #7
 8000f0a:	08c9      	lsrs	r1, r1, #3
 8000f0c:	eb00 0081 	add.w	r0, r0, r1, lsl #2
 8000f10:	b510      	push	{r4, lr}
 8000f12:	009b      	lsls	r3, r3, #2
 8000f14:	6a04      	ldr	r4, [r0, #32]
 8000f16:	210f      	movs	r1, #15
 8000f18:	4099      	lsls	r1, r3
 8000f1a:	ea24 0101 	bic.w	r1, r4, r1
 8000f1e:	6201      	str	r1, [r0, #32]
 8000f20:	6a01      	ldr	r1, [r0, #32]
 8000f22:	409a      	lsls	r2, r3
 8000f24:	4311      	orrs	r1, r2
 8000f26:	6201      	str	r1, [r0, #32]
 8000f28:	bd10      	pop	{r4, pc}
	...

08000f2c <NVIC_Init>:
 8000f2c:	78c2      	ldrb	r2, [r0, #3]
 8000f2e:	7803      	ldrb	r3, [r0, #0]
 8000f30:	b510      	push	{r4, lr}
 8000f32:	b30a      	cbz	r2, 8000f78 <NVIC_Init+0x4c>
 8000f34:	4a16      	ldr	r2, [pc, #88]	; (8000f90 <NVIC_Init+0x64>)
 8000f36:	7844      	ldrb	r4, [r0, #1]
 8000f38:	68d2      	ldr	r2, [r2, #12]
 8000f3a:	43d2      	mvns	r2, r2
 8000f3c:	f3c2 2202 	ubfx	r2, r2, #8, #3
 8000f40:	f1c2 0104 	rsb	r1, r2, #4
 8000f44:	b2c9      	uxtb	r1, r1
 8000f46:	fa04 f101 	lsl.w	r1, r4, r1
 8000f4a:	240f      	movs	r4, #15
 8000f4c:	fa44 f202 	asr.w	r2, r4, r2
 8000f50:	7884      	ldrb	r4, [r0, #2]
 8000f52:	b2c9      	uxtb	r1, r1
 8000f54:	4022      	ands	r2, r4
 8000f56:	430a      	orrs	r2, r1
 8000f58:	f103 4360 	add.w	r3, r3, #3758096384	; 0xe0000000
 8000f5c:	f503 4361 	add.w	r3, r3, #57600	; 0xe100
 8000f60:	0112      	lsls	r2, r2, #4
 8000f62:	b2d2      	uxtb	r2, r2
 8000f64:	f883 2300 	strb.w	r2, [r3, #768]	; 0x300
 8000f68:	7803      	ldrb	r3, [r0, #0]
 8000f6a:	2201      	movs	r2, #1
 8000f6c:	0959      	lsrs	r1, r3, #5
 8000f6e:	f003 031f 	and.w	r3, r3, #31
 8000f72:	fa02 f303 	lsl.w	r3, r2, r3
 8000f76:	e006      	b.n	8000f86 <NVIC_Init+0x5a>
 8000f78:	0959      	lsrs	r1, r3, #5
 8000f7a:	2201      	movs	r2, #1
 8000f7c:	f003 031f 	and.w	r3, r3, #31
 8000f80:	fa02 f303 	lsl.w	r3, r2, r3
 8000f84:	3120      	adds	r1, #32
 8000f86:	4a03      	ldr	r2, [pc, #12]	; (8000f94 <NVIC_Init+0x68>)
 8000f88:	f842 3021 	str.w	r3, [r2, r1, lsl #2]
 8000f8c:	bd10      	pop	{r4, pc}
 8000f8e:	bf00      	nop
 8000f90:	e000ed00 	.word	0xe000ed00
 8000f94:	e000e100 	.word	0xe000e100

08000f98 <_init>:
 8000f98:	e1a0c00d 	mov	ip, sp
 8000f9c:	e92ddff8 	push	{r3, r4, r5, r6, r7, r8, r9, sl, fp, ip, lr, pc}
 8000fa0:	e24cb004 	sub	fp, ip, #4
 8000fa4:	e24bd028 	sub	sp, fp, #40	; 0x28
 8000fa8:	e89d6ff0 	ldm	sp, {r4, r5, r6, r7, r8, r9, sl, fp, sp, lr}
 8000fac:	e12fff1e 	bx	lr

08000fb0 <_fini>:
 8000fb0:	e1a0c00d 	mov	ip, sp
 8000fb4:	e92ddff8 	push	{r3, r4, r5, r6, r7, r8, r9, sl, fp, ip, lr, pc}
 8000fb8:	e24cb004 	sub	fp, ip, #4
 8000fbc:	e24bd028 	sub	sp, fp, #40	; 0x28
 8000fc0:	e89d6ff0 	ldm	sp, {r4, r5, r6, r7, r8, r9, sl, fp, sp, lr}
 8000fc4:	e12fff1e 	bx	lr
 8000fc8:	69647473 	.word	0x69647473
 8000fcc:	6e69206f 	.word	0x6e69206f
 8000fd0:	64207469 	.word	0x64207469
 8000fd4:	0a656e6f 	.word	0x0a656e6f
 8000fd8:	00          	.byte	0x00
 8000fd9:	62          	.byte	0x62
 8000fda:	6f6f      	.short	0x6f6f
 8000fdc:	676e6974 	.word	0x676e6974
 8000fe0:	6f726620 	.word	0x6f726620
 8000fe4:	7525206d 	.word	0x7525206d
 8000fe8:	6172000a 	.word	0x6172000a
 8000fec:	7473206d 	.word	0x7473206d
 8000ff0:	20747261 	.word	0x20747261
 8000ff4:	0a207525 	.word	0x0a207525
 8000ff8:	6d617200 	.word	0x6d617200
 8000ffc:	7a697320 	.word	0x7a697320
 8001000:	75252065 	.word	0x75252065
 8001004:	72000a20 	.word	0x72000a20
 8001008:	66206d61 	.word	0x66206d61
 800100c:	20656572 	.word	0x20656572
 8001010:	0a207525 	.word	0x0a207525
 8001014:	61656800 	.word	0x61656800
 8001018:	74732070 	.word	0x74732070
 800101c:	20747261 	.word	0x20747261
 8001020:	0a207525 	.word	0x0a207525
 8001024:	000a0a00 	.word	0x000a0a00
 8001028:	746f6e61 	.word	0x746f6e61
 800102c:	20726568 	.word	0x20726568
 8001030:	6c696863 	.word	0x6c696863
 8001034:	68742064 	.word	0x68742064
 8001038:	64616572 	.word	0x64616572
 800103c:	6572202c 	.word	0x6572202c
 8001040:	75252073 	.word	0x75252073
 8001044:	6874000a 	.word	0x6874000a
 8001048:	64616572 	.word	0x64616572
 800104c:	000a3120 	.word	0x000a3120
 8001050:	61657263 	.word	0x61657263
 8001054:	676e6974 	.word	0x676e6974
 8001058:	69686320 	.word	0x69686320
 800105c:	7420646c 	.word	0x7420646c
 8001060:	61657268 	.word	0x61657268
 8001064:	74000a64 	.word	0x74000a64
 8001068:	61657268 	.word	0x61657268
 800106c:	72632064 	.word	0x72632064
 8001070:	69746165 	.word	0x69746165
 8001074:	6520676e 	.word	0x6520676e
 8001078:	726f7272 	.word	0x726f7272
 800107c:	6177000a 	.word	0x6177000a
 8001080:	6e697469 	.word	0x6e697469
 8001084:	6f662067 	.word	0x6f662067
 8001088:	68742072 	.word	0x68742072
 800108c:	64616572 	.word	0x64616572
 8001090:	20752520 	.word	0x20752520
 8001094:	656e6f64 	.word	0x656e6f64
 8001098:	6570000a 	.word	0x6570000a
 800109c:	646f6972 	.word	0x646f6972
 80010a0:	74206369 	.word	0x74206369
 80010a4:	61657268 	.word	0x61657268
 80010a8:	0a000a64 	.word	0x0a000a64
 80010ac:	636c6577 	.word	0x636c6577
 80010b0:	20656d6f 	.word	0x20656d6f
 80010b4:	53206f74 	.word	0x53206f74
 80010b8:	68757a75 	.word	0x68757a75
 80010bc:	20534f61 	.word	0x20534f61
 80010c0:	205e5f5e 	.word	0x205e5f5e
 80010c4:	2e322e32 	.word	0x2e322e32
 80010c8:	55420a30 	.word	0x55420a30
 80010cc:	20444c49 	.word	0x20444c49
 80010d0:	20677541 	.word	0x20677541
 80010d4:	32203732 	.word	0x32203732
 80010d8:	20353130 	.word	0x20353130
 80010dc:	343a3131 	.word	0x343a3131
 80010e0:	37313a30 	.word	0x37313a30
 80010e4:	616d000a 	.word	0x616d000a
 80010e8:	74206e69 	.word	0x74206e69
 80010ec:	61657268 	.word	0x61657268
 80010f0:	64692064 	.word	0x64692064
 80010f4:	202c656c 	.word	0x202c656c
 80010f8:	69747075 	.word	0x69747075
 80010fc:	2520656d 	.word	0x2520656d
 8001100:	00000a75 	.word	0x00000a75

08001104 <__EH_FRAME_BEGIN__>:
 8001104:	00000000                                ....
