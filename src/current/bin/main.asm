
bin/main.elf:     file format elf32-littlearm


Disassembly of section .text:

08000188 <mem_info_print>:
 8000188:	b538      	push	{r3, r4, r5, lr}
 800018a:	4c0f      	ldr	r4, [pc, #60]	; (80001c8 <mem_info_print+0x40>)
 800018c:	4d0f      	ldr	r5, [pc, #60]	; (80001cc <mem_info_print+0x44>)
 800018e:	4810      	ldr	r0, [pc, #64]	; (80001d0 <mem_info_print+0x48>)
 8000190:	4910      	ldr	r1, [pc, #64]	; (80001d4 <mem_info_print+0x4c>)
 8000192:	f000 fa09 	bl	80005a8 <printf_>
 8000196:	1b2d      	subs	r5, r5, r4
 8000198:	4621      	mov	r1, r4
 800019a:	480f      	ldr	r0, [pc, #60]	; (80001d8 <mem_info_print+0x50>)
 800019c:	f000 fa04 	bl	80005a8 <printf_>
 80001a0:	4629      	mov	r1, r5
 80001a2:	480e      	ldr	r0, [pc, #56]	; (80001dc <mem_info_print+0x54>)
 80001a4:	f000 fa00 	bl	80005a8 <printf_>
 80001a8:	4b0d      	ldr	r3, [pc, #52]	; (80001e0 <mem_info_print+0x58>)
 80001aa:	480e      	ldr	r0, [pc, #56]	; (80001e4 <mem_info_print+0x5c>)
 80001ac:	1ae1      	subs	r1, r4, r3
 80001ae:	4429      	add	r1, r5
 80001b0:	f000 f9fa 	bl	80005a8 <printf_>
 80001b4:	480c      	ldr	r0, [pc, #48]	; (80001e8 <mem_info_print+0x60>)
 80001b6:	490d      	ldr	r1, [pc, #52]	; (80001ec <mem_info_print+0x64>)
 80001b8:	f000 f9f6 	bl	80005a8 <printf_>
 80001bc:	480c      	ldr	r0, [pc, #48]	; (80001f0 <mem_info_print+0x68>)
 80001be:	e8bd 4038 	ldmia.w	sp!, {r3, r4, r5, lr}
 80001c2:	f000 b9f1 	b.w	80005a8 <printf_>
 80001c6:	bf00      	nop
 80001c8:	20000000 	.word	0x20000000
 80001cc:	20020000 	.word	0x20020000
 80001d0:	080017bc 	.word	0x080017bc
 80001d4:	0800178a 	.word	0x0800178a
 80001d8:	080017cd 	.word	0x080017cd
 80001dc:	080017dc 	.word	0x080017dc
 80001e0:	20000640 	.word	0x20000640
 80001e4:	080017ea 	.word	0x080017ea
 80001e8:	080017f8 	.word	0x080017f8
 80001ec:	20000640 	.word	0x20000640
 80001f0:	08001808 	.word	0x08001808

080001f4 <main>:
 80001f4:	b508      	push	{r3, lr}
 80001f6:	f000 fe8b 	bl	8000f10 <lib_low_level_init>
 80001fa:	f000 f935 	bl	8000468 <lib_os_init>
 80001fe:	f7ff ffc3 	bl	8000188 <mem_info_print>
 8000202:	4905      	ldr	r1, [pc, #20]	; (8000218 <main+0x24>)
 8000204:	4805      	ldr	r0, [pc, #20]	; (800021c <main+0x28>)
 8000206:	f44f 7200 	mov.w	r2, #512	; 0x200
 800020a:	2308      	movs	r3, #8
 800020c:	f000 f88a 	bl	8000324 <create_thread>
 8000210:	f000 f882 	bl	8000318 <kernel_start>
 8000214:	2000      	movs	r0, #0
 8000216:	bd08      	pop	{r3, pc}
 8000218:	20000210 	.word	0x20000210
 800021c:	08000d91 	.word	0x08000d91

08000220 <thread_ending>:
 8000220:	b672      	cpsid	i
 8000222:	4b05      	ldr	r3, [pc, #20]	; (8000238 <thread_ending+0x18>)
 8000224:	4a05      	ldr	r2, [pc, #20]	; (800023c <thread_ending+0x1c>)
 8000226:	681b      	ldr	r3, [r3, #0]
 8000228:	210c      	movs	r1, #12
 800022a:	fb01 2303 	mla	r3, r1, r3, r2
 800022e:	2200      	movs	r2, #0
 8000230:	605a      	str	r2, [r3, #4]
 8000232:	b662      	cpsie	i
 8000234:	bf00      	nop
 8000236:	e7fd      	b.n	8000234 <thread_ending+0x14>
 8000238:	20000470 	.word	0x20000470
 800023c:	20000410 	.word	0x20000410

08000240 <null_thread>:
 8000240:	b508      	push	{r3, lr}
 8000242:	f001 f8f9 	bl	8001438 <sleep>
 8000246:	e7fc      	b.n	8000242 <null_thread+0x2>

08000248 <scheduler>:
 8000248:	b570      	push	{r4, r5, r6, lr}
 800024a:	2200      	movs	r2, #0
 800024c:	4611      	mov	r1, r2
 800024e:	4b15      	ldr	r3, [pc, #84]	; (80002a4 <scheduler+0x5c>)
 8000250:	200c      	movs	r0, #12
 8000252:	fb00 f501 	mul.w	r5, r0, r1
 8000256:	195e      	adds	r6, r3, r5
 8000258:	6874      	ldr	r4, [r6, #4]
 800025a:	f014 0f02 	tst.w	r4, #2
 800025e:	461c      	mov	r4, r3
 8000260:	d10a      	bne.n	8000278 <scheduler+0x30>
 8000262:	6876      	ldr	r6, [r6, #4]
 8000264:	07f6      	lsls	r6, r6, #31
 8000266:	d507      	bpl.n	8000278 <scheduler+0x30>
 8000268:	4350      	muls	r0, r2
 800026a:	5b5d      	ldrh	r5, [r3, r5]
 800026c:	5a18      	ldrh	r0, [r3, r0]
 800026e:	b2ad      	uxth	r5, r5
 8000270:	b280      	uxth	r0, r0
 8000272:	4285      	cmp	r5, r0
 8000274:	bf38      	it	cc
 8000276:	460a      	movcc	r2, r1
 8000278:	200c      	movs	r0, #12
 800027a:	4348      	muls	r0, r1
 800027c:	5a1d      	ldrh	r5, [r3, r0]
 800027e:	b2ad      	uxth	r5, r5
 8000280:	b125      	cbz	r5, 800028c <scheduler+0x44>
 8000282:	5a1d      	ldrh	r5, [r3, r0]
 8000284:	b2ad      	uxth	r5, r5
 8000286:	3d01      	subs	r5, #1
 8000288:	b2ad      	uxth	r5, r5
 800028a:	521d      	strh	r5, [r3, r0]
 800028c:	3101      	adds	r1, #1
 800028e:	2908      	cmp	r1, #8
 8000290:	d1dd      	bne.n	800024e <scheduler+0x6>
 8000292:	230c      	movs	r3, #12
 8000294:	4353      	muls	r3, r2
 8000296:	18e1      	adds	r1, r4, r3
 8000298:	8849      	ldrh	r1, [r1, #2]
 800029a:	b289      	uxth	r1, r1
 800029c:	52e1      	strh	r1, [r4, r3]
 800029e:	4b02      	ldr	r3, [pc, #8]	; (80002a8 <scheduler+0x60>)
 80002a0:	601a      	str	r2, [r3, #0]
 80002a2:	bd70      	pop	{r4, r5, r6, pc}
 80002a4:	20000410 	.word	0x20000410
 80002a8:	20000470 	.word	0x20000470

080002ac <SysTick_Handler>:
 80002ac:	e92d 0ff0 	stmdb	sp!, {r4, r5, r6, r7, r8, r9, sl, fp}
 80002b0:	f3ef 8208 	mrs	r2, MSP
 80002b4:	4c0d      	ldr	r4, [pc, #52]	; (80002ec <SysTick_Handler+0x40>)
 80002b6:	4d0e      	ldr	r5, [pc, #56]	; (80002f0 <SysTick_Handler+0x44>)
 80002b8:	6823      	ldr	r3, [r4, #0]
 80002ba:	3301      	adds	r3, #1
 80002bc:	d005      	beq.n	80002ca <SysTick_Handler+0x1e>
 80002be:	6823      	ldr	r3, [r4, #0]
 80002c0:	210c      	movs	r1, #12
 80002c2:	fb01 5303 	mla	r3, r1, r3, r5
 80002c6:	609a      	str	r2, [r3, #8]
 80002c8:	e001      	b.n	80002ce <SysTick_Handler+0x22>
 80002ca:	2300      	movs	r3, #0
 80002cc:	6023      	str	r3, [r4, #0]
 80002ce:	f7ff ffbb 	bl	8000248 <scheduler>
 80002d2:	6823      	ldr	r3, [r4, #0]
 80002d4:	220c      	movs	r2, #12
 80002d6:	fb02 5503 	mla	r5, r2, r3, r5
 80002da:	f06f 0306 	mvn.w	r3, #6
 80002de:	68aa      	ldr	r2, [r5, #8]
 80002e0:	469e      	mov	lr, r3
 80002e2:	f382 8808 	msr	MSP, r2
 80002e6:	e8bd 0ff0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, fp}
 80002ea:	4770      	bx	lr
 80002ec:	20000470 	.word	0x20000470
 80002f0:	20000410 	.word	0x20000410

080002f4 <sched_off>:
 80002f4:	b672      	cpsid	i
 80002f6:	4770      	bx	lr

080002f8 <sched_on>:
 80002f8:	b662      	cpsie	i
 80002fa:	4770      	bx	lr

080002fc <yield>:
 80002fc:	bf00      	nop
 80002fe:	4770      	bx	lr

08000300 <get_thread_id>:
 8000300:	b082      	sub	sp, #8
 8000302:	b672      	cpsid	i
 8000304:	4b03      	ldr	r3, [pc, #12]	; (8000314 <get_thread_id+0x14>)
 8000306:	681b      	ldr	r3, [r3, #0]
 8000308:	9301      	str	r3, [sp, #4]
 800030a:	b662      	cpsie	i
 800030c:	9801      	ldr	r0, [sp, #4]
 800030e:	b002      	add	sp, #8
 8000310:	4770      	bx	lr
 8000312:	bf00      	nop
 8000314:	20000470 	.word	0x20000470

08000318 <kernel_start>:
 8000318:	b508      	push	{r3, lr}
 800031a:	f001 f87b 	bl	8001414 <sys_tick_init>
 800031e:	bf00      	nop
 8000320:	e7fd      	b.n	800031e <kernel_start+0x6>
	...

08000324 <create_thread>:
 8000324:	f022 0203 	bic.w	r2, r2, #3
 8000328:	3a40      	subs	r2, #64	; 0x40
 800032a:	e92d 43f0 	stmdb	sp!, {r4, r5, r6, r7, r8, r9, lr}
 800032e:	eb01 0c02 	add.w	ip, r1, r2
 8000332:	f102 0834 	add.w	r8, r2, #52	; 0x34
 8000336:	f102 0938 	add.w	r9, r2, #56	; 0x38
 800033a:	323c      	adds	r2, #60	; 0x3c
 800033c:	4488      	add	r8, r1
 800033e:	4489      	add	r9, r1
 8000340:	4607      	mov	r7, r0
 8000342:	4411      	add	r1, r2
 8000344:	2200      	movs	r2, #0
 8000346:	b672      	cpsid	i
 8000348:	4e11      	ldr	r6, [pc, #68]	; (8000390 <create_thread+0x6c>)
 800034a:	250c      	movs	r5, #12
 800034c:	4355      	muls	r5, r2
 800034e:	1974      	adds	r4, r6, r5
 8000350:	6860      	ldr	r0, [r4, #4]
 8000352:	07c0      	lsls	r0, r0, #31
 8000354:	d412      	bmi.n	800037c <create_thread+0x58>
 8000356:	480f      	ldr	r0, [pc, #60]	; (8000394 <create_thread+0x70>)
 8000358:	f8c4 c008 	str.w	ip, [r4, #8]
 800035c:	f8c8 0000 	str.w	r0, [r8]
 8000360:	f04f 5004 	mov.w	r0, #553648128	; 0x21000000
 8000364:	f8c9 7000 	str.w	r7, [r9]
 8000368:	2b07      	cmp	r3, #7
 800036a:	bf98      	it	ls
 800036c:	2308      	movls	r3, #8
 800036e:	6008      	str	r0, [r1, #0]
 8000370:	2001      	movs	r0, #1
 8000372:	8063      	strh	r3, [r4, #2]
 8000374:	5373      	strh	r3, [r6, r5]
 8000376:	6060      	str	r0, [r4, #4]
 8000378:	4610      	mov	r0, r2
 800037a:	e000      	b.n	800037e <create_thread+0x5a>
 800037c:	2008      	movs	r0, #8
 800037e:	b662      	cpsie	i
 8000380:	3201      	adds	r2, #1
 8000382:	2a08      	cmp	r2, #8
 8000384:	d001      	beq.n	800038a <create_thread+0x66>
 8000386:	2808      	cmp	r0, #8
 8000388:	d0dd      	beq.n	8000346 <create_thread+0x22>
 800038a:	e8bd 83f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, pc}
 800038e:	bf00      	nop
 8000390:	20000410 	.word	0x20000410
 8000394:	08000221 	.word	0x08000221

08000398 <kernel_init>:
 8000398:	b510      	push	{r4, lr}
 800039a:	2300      	movs	r3, #0
 800039c:	490b      	ldr	r1, [pc, #44]	; (80003cc <kernel_init+0x34>)
 800039e:	220c      	movs	r2, #12
 80003a0:	435a      	muls	r2, r3
 80003a2:	188c      	adds	r4, r1, r2
 80003a4:	2000      	movs	r0, #0
 80003a6:	6060      	str	r0, [r4, #4]
 80003a8:	3301      	adds	r3, #1
 80003aa:	2008      	movs	r0, #8
 80003ac:	4283      	cmp	r3, r0
 80003ae:	8060      	strh	r0, [r4, #2]
 80003b0:	5288      	strh	r0, [r1, r2]
 80003b2:	d1f3      	bne.n	800039c <kernel_init+0x4>
 80003b4:	4b06      	ldr	r3, [pc, #24]	; (80003d0 <kernel_init+0x38>)
 80003b6:	4807      	ldr	r0, [pc, #28]	; (80003d4 <kernel_init+0x3c>)
 80003b8:	4907      	ldr	r1, [pc, #28]	; (80003d8 <kernel_init+0x40>)
 80003ba:	f04f 32ff 	mov.w	r2, #4294967295
 80003be:	601a      	str	r2, [r3, #0]
 80003c0:	e8bd 4010 	ldmia.w	sp!, {r4, lr}
 80003c4:	2280      	movs	r2, #128	; 0x80
 80003c6:	23ff      	movs	r3, #255	; 0xff
 80003c8:	f7ff bfac 	b.w	8000324 <create_thread>
 80003cc:	20000410 	.word	0x20000410
 80003d0:	20000470 	.word	0x20000470
 80003d4:	08000241 	.word	0x08000241
 80003d8:	20000474 	.word	0x20000474

080003dc <set_wait_state>:
 80003dc:	b507      	push	{r0, r1, r2, lr}
 80003de:	f7ff ff8f 	bl	8000300 <get_thread_id>
 80003e2:	9000      	str	r0, [sp, #0]
 80003e4:	b672      	cpsid	i
 80003e6:	4b0d      	ldr	r3, [pc, #52]	; (800041c <set_wait_state+0x40>)
 80003e8:	9a00      	ldr	r2, [sp, #0]
 80003ea:	210c      	movs	r1, #12
 80003ec:	fb01 3202 	mla	r2, r1, r2, r3
 80003f0:	6851      	ldr	r1, [r2, #4]
 80003f2:	f041 0102 	orr.w	r1, r1, #2
 80003f6:	6051      	str	r1, [r2, #4]
 80003f8:	b672      	cpsid	i
 80003fa:	9a00      	ldr	r2, [sp, #0]
 80003fc:	210c      	movs	r1, #12
 80003fe:	fb01 3202 	mla	r2, r1, r2, r3
 8000402:	6852      	ldr	r2, [r2, #4]
 8000404:	9201      	str	r2, [sp, #4]
 8000406:	b662      	cpsie	i
 8000408:	9a01      	ldr	r2, [sp, #4]
 800040a:	0791      	lsls	r1, r2, #30
 800040c:	d500      	bpl.n	8000410 <set_wait_state+0x34>
 800040e:	bf00      	nop
 8000410:	9a01      	ldr	r2, [sp, #4]
 8000412:	0792      	lsls	r2, r2, #30
 8000414:	d4f0      	bmi.n	80003f8 <set_wait_state+0x1c>
 8000416:	b003      	add	sp, #12
 8000418:	f85d fb04 	ldr.w	pc, [sp], #4
 800041c:	20000410 	.word	0x20000410

08000420 <wake_up_threads>:
 8000420:	2300      	movs	r3, #0
 8000422:	b672      	cpsid	i
 8000424:	4a06      	ldr	r2, [pc, #24]	; (8000440 <wake_up_threads+0x20>)
 8000426:	210c      	movs	r1, #12
 8000428:	fb01 2203 	mla	r2, r1, r3, r2
 800042c:	6851      	ldr	r1, [r2, #4]
 800042e:	f021 0102 	bic.w	r1, r1, #2
 8000432:	6051      	str	r1, [r2, #4]
 8000434:	b662      	cpsie	i
 8000436:	3301      	adds	r3, #1
 8000438:	2b08      	cmp	r3, #8
 800043a:	d1f2      	bne.n	8000422 <wake_up_threads+0x2>
 800043c:	4770      	bx	lr
 800043e:	bf00      	nop
 8000440:	20000410 	.word	0x20000410

08000444 <stdlib_init_>:
 8000444:	b508      	push	{r3, lr}
 8000446:	4804      	ldr	r0, [pc, #16]	; (8000458 <stdlib_init_+0x14>)
 8000448:	f000 f928 	bl	800069c <mutex_init>
 800044c:	4b03      	ldr	r3, [pc, #12]	; (800045c <stdlib_init_+0x18>)
 800044e:	4a04      	ldr	r2, [pc, #16]	; (8000460 <stdlib_init_+0x1c>)
 8000450:	6013      	str	r3, [r2, #0]
 8000452:	4a04      	ldr	r2, [pc, #16]	; (8000464 <stdlib_init_+0x20>)
 8000454:	6013      	str	r3, [r2, #0]
 8000456:	bd08      	pop	{r3, pc}
 8000458:	200004fc 	.word	0x200004fc
 800045c:	20000640 	.word	0x20000640
 8000460:	200004f4 	.word	0x200004f4
 8000464:	200004f8 	.word	0x200004f8

08000468 <lib_os_init>:
 8000468:	b508      	push	{r3, lr}
 800046a:	f7ff ff95 	bl	8000398 <kernel_init>
 800046e:	f7ff ffe9 	bl	8000444 <stdlib_init_>
 8000472:	f000 f805 	bl	8000480 <messages_init>
 8000476:	e8bd 4008 	ldmia.w	sp!, {r3, lr}
 800047a:	f000 b8e7 	b.w	800064c <stdio_init>
	...

08000480 <messages_init>:
 8000480:	b510      	push	{r4, lr}
 8000482:	2200      	movs	r2, #0
 8000484:	4909      	ldr	r1, [pc, #36]	; (80004ac <messages_init+0x2c>)
 8000486:	2300      	movs	r3, #0
 8000488:	f841 3022 	str.w	r3, [r1, r2, lsl #2]
 800048c:	3201      	adds	r2, #1
 800048e:	2a08      	cmp	r2, #8
 8000490:	d1f8      	bne.n	8000484 <messages_init+0x4>
 8000492:	4c07      	ldr	r4, [pc, #28]	; (80004b0 <messages_init+0x30>)
 8000494:	0118      	lsls	r0, r3, #4
 8000496:	1821      	adds	r1, r4, r0
 8000498:	3301      	adds	r3, #1
 800049a:	2200      	movs	r2, #0
 800049c:	2b04      	cmp	r3, #4
 800049e:	604a      	str	r2, [r1, #4]
 80004a0:	5022      	str	r2, [r4, r0]
 80004a2:	60ca      	str	r2, [r1, #12]
 80004a4:	608a      	str	r2, [r1, #8]
 80004a6:	d1f4      	bne.n	8000492 <messages_init+0x12>
 80004a8:	bd10      	pop	{r4, pc}
 80004aa:	bf00      	nop
 80004ac:	20000500 	.word	0x20000500
 80004b0:	20000520 	.word	0x20000520

080004b4 <putc_>:
 80004b4:	b538      	push	{r3, r4, r5, lr}
 80004b6:	4c06      	ldr	r4, [pc, #24]	; (80004d0 <putc_+0x1c>)
 80004b8:	4605      	mov	r5, r0
 80004ba:	4620      	mov	r0, r4
 80004bc:	f000 f8f8 	bl	80006b0 <mutex_lock>
 80004c0:	4628      	mov	r0, r5
 80004c2:	f000 fc71 	bl	8000da8 <uart_write>
 80004c6:	4620      	mov	r0, r4
 80004c8:	e8bd 4038 	ldmia.w	sp!, {r3, r4, r5, lr}
 80004cc:	f000 b90c 	b.w	80006e8 <mutex_unlock>
 80004d0:	20000560 	.word	0x20000560

080004d4 <puts_>:
 80004d4:	b510      	push	{r4, lr}
 80004d6:	4604      	mov	r4, r0
 80004d8:	4807      	ldr	r0, [pc, #28]	; (80004f8 <puts_+0x24>)
 80004da:	f000 f8e9 	bl	80006b0 <mutex_lock>
 80004de:	3c01      	subs	r4, #1
 80004e0:	f814 0f01 	ldrb.w	r0, [r4, #1]!
 80004e4:	b110      	cbz	r0, 80004ec <puts_+0x18>
 80004e6:	f7ff ffe5 	bl	80004b4 <putc_>
 80004ea:	e7f9      	b.n	80004e0 <puts_+0xc>
 80004ec:	4802      	ldr	r0, [pc, #8]	; (80004f8 <puts_+0x24>)
 80004ee:	e8bd 4010 	ldmia.w	sp!, {r4, lr}
 80004f2:	f000 b8f9 	b.w	80006e8 <mutex_unlock>
 80004f6:	bf00      	nop
 80004f8:	2000056c 	.word	0x2000056c

080004fc <puti_>:
 80004fc:	b530      	push	{r4, r5, lr}
 80004fe:	b085      	sub	sp, #20
 8000500:	1e03      	subs	r3, r0, #0
 8000502:	f04f 0200 	mov.w	r2, #0
 8000506:	bfa8      	it	ge
 8000508:	4614      	movge	r4, r2
 800050a:	f88d 200f 	strb.w	r2, [sp, #15]
 800050e:	bfbc      	itt	lt
 8000510:	425b      	neglt	r3, r3
 8000512:	2401      	movlt	r4, #1
 8000514:	220a      	movs	r2, #10
 8000516:	210a      	movs	r1, #10
 8000518:	fb93 f5f1 	sdiv	r5, r3, r1
 800051c:	fb01 3315 	mls	r3, r1, r5, r3
 8000520:	a801      	add	r0, sp, #4
 8000522:	3330      	adds	r3, #48	; 0x30
 8000524:	5413      	strb	r3, [r2, r0]
 8000526:	1e51      	subs	r1, r2, #1
 8000528:	462b      	mov	r3, r5
 800052a:	b10d      	cbz	r5, 8000530 <puti_+0x34>
 800052c:	460a      	mov	r2, r1
 800052e:	e7f2      	b.n	8000516 <puti_+0x1a>
 8000530:	b12c      	cbz	r4, 800053e <puti_+0x42>
 8000532:	ab04      	add	r3, sp, #16
 8000534:	440b      	add	r3, r1
 8000536:	222d      	movs	r2, #45	; 0x2d
 8000538:	f803 2c0c 	strb.w	r2, [r3, #-12]
 800053c:	460a      	mov	r2, r1
 800053e:	4410      	add	r0, r2
 8000540:	f7ff ffc8 	bl	80004d4 <puts_>
 8000544:	b005      	add	sp, #20
 8000546:	bd30      	pop	{r4, r5, pc}

08000548 <putui_>:
 8000548:	b51f      	push	{r0, r1, r2, r3, r4, lr}
 800054a:	2300      	movs	r3, #0
 800054c:	f88d 300f 	strb.w	r3, [sp, #15]
 8000550:	230a      	movs	r3, #10
 8000552:	240a      	movs	r4, #10
 8000554:	fbb0 f1f4 	udiv	r1, r0, r4
 8000558:	fb04 0011 	mls	r0, r4, r1, r0
 800055c:	aa01      	add	r2, sp, #4
 800055e:	3030      	adds	r0, #48	; 0x30
 8000560:	5498      	strb	r0, [r3, r2]
 8000562:	1e5c      	subs	r4, r3, #1
 8000564:	4608      	mov	r0, r1
 8000566:	b109      	cbz	r1, 800056c <putui_+0x24>
 8000568:	4623      	mov	r3, r4
 800056a:	e7f2      	b.n	8000552 <putui_+0xa>
 800056c:	18d0      	adds	r0, r2, r3
 800056e:	f7ff ffb1 	bl	80004d4 <puts_>
 8000572:	b004      	add	sp, #16
 8000574:	bd10      	pop	{r4, pc}

08000576 <putx_>:
 8000576:	b51f      	push	{r0, r1, r2, r3, r4, lr}
 8000578:	2300      	movs	r3, #0
 800057a:	f88d 300f 	strb.w	r3, [sp, #15]
 800057e:	230a      	movs	r3, #10
 8000580:	f000 010f 	and.w	r1, r0, #15
 8000584:	2909      	cmp	r1, #9
 8000586:	aa01      	add	r2, sp, #4
 8000588:	bf94      	ite	ls
 800058a:	3130      	addls	r1, #48	; 0x30
 800058c:	3157      	addhi	r1, #87	; 0x57
 800058e:	0900      	lsrs	r0, r0, #4
 8000590:	54d1      	strb	r1, [r2, r3]
 8000592:	f103 31ff 	add.w	r1, r3, #4294967295
 8000596:	d001      	beq.n	800059c <putx_+0x26>
 8000598:	460b      	mov	r3, r1
 800059a:	e7f1      	b.n	8000580 <putx_+0xa>
 800059c:	18d0      	adds	r0, r2, r3
 800059e:	f7ff ff99 	bl	80004d4 <puts_>
 80005a2:	b005      	add	sp, #20
 80005a4:	f85d fb04 	ldr.w	pc, [sp], #4

080005a8 <printf_>:
 80005a8:	b40f      	push	{r0, r1, r2, r3}
 80005aa:	b537      	push	{r0, r1, r2, r4, r5, lr}
 80005ac:	ac06      	add	r4, sp, #24
 80005ae:	4826      	ldr	r0, [pc, #152]	; (8000648 <printf_+0xa0>)
 80005b0:	f854 5b04 	ldr.w	r5, [r4], #4
 80005b4:	f000 f87c 	bl	80006b0 <mutex_lock>
 80005b8:	9401      	str	r4, [sp, #4]
 80005ba:	2400      	movs	r4, #0
 80005bc:	5d28      	ldrb	r0, [r5, r4]
 80005be:	2800      	cmp	r0, #0
 80005c0:	d039      	beq.n	8000636 <printf_+0x8e>
 80005c2:	2825      	cmp	r0, #37	; 0x25
 80005c4:	d003      	beq.n	80005ce <printf_+0x26>
 80005c6:	f7ff ff75 	bl	80004b4 <putc_>
 80005ca:	3401      	adds	r4, #1
 80005cc:	e7f6      	b.n	80005bc <printf_+0x14>
 80005ce:	192b      	adds	r3, r5, r4
 80005d0:	7858      	ldrb	r0, [r3, #1]
 80005d2:	2869      	cmp	r0, #105	; 0x69
 80005d4:	d016      	beq.n	8000604 <printf_+0x5c>
 80005d6:	d808      	bhi.n	80005ea <printf_+0x42>
 80005d8:	2825      	cmp	r0, #37	; 0x25
 80005da:	d028      	beq.n	800062e <printf_+0x86>
 80005dc:	2863      	cmp	r0, #99	; 0x63
 80005de:	d128      	bne.n	8000632 <printf_+0x8a>
 80005e0:	9b01      	ldr	r3, [sp, #4]
 80005e2:	1d1a      	adds	r2, r3, #4
 80005e4:	9201      	str	r2, [sp, #4]
 80005e6:	7818      	ldrb	r0, [r3, #0]
 80005e8:	e021      	b.n	800062e <printf_+0x86>
 80005ea:	2875      	cmp	r0, #117	; 0x75
 80005ec:	d011      	beq.n	8000612 <printf_+0x6a>
 80005ee:	2878      	cmp	r0, #120	; 0x78
 80005f0:	d016      	beq.n	8000620 <printf_+0x78>
 80005f2:	2873      	cmp	r0, #115	; 0x73
 80005f4:	d11d      	bne.n	8000632 <printf_+0x8a>
 80005f6:	9b01      	ldr	r3, [sp, #4]
 80005f8:	1d1a      	adds	r2, r3, #4
 80005fa:	6818      	ldr	r0, [r3, #0]
 80005fc:	9201      	str	r2, [sp, #4]
 80005fe:	f7ff ff69 	bl	80004d4 <puts_>
 8000602:	e016      	b.n	8000632 <printf_+0x8a>
 8000604:	9b01      	ldr	r3, [sp, #4]
 8000606:	1d1a      	adds	r2, r3, #4
 8000608:	6818      	ldr	r0, [r3, #0]
 800060a:	9201      	str	r2, [sp, #4]
 800060c:	f7ff ff76 	bl	80004fc <puti_>
 8000610:	e00f      	b.n	8000632 <printf_+0x8a>
 8000612:	9b01      	ldr	r3, [sp, #4]
 8000614:	1d1a      	adds	r2, r3, #4
 8000616:	6818      	ldr	r0, [r3, #0]
 8000618:	9201      	str	r2, [sp, #4]
 800061a:	f7ff ff95 	bl	8000548 <putui_>
 800061e:	e008      	b.n	8000632 <printf_+0x8a>
 8000620:	9b01      	ldr	r3, [sp, #4]
 8000622:	1d1a      	adds	r2, r3, #4
 8000624:	6818      	ldr	r0, [r3, #0]
 8000626:	9201      	str	r2, [sp, #4]
 8000628:	f7ff ffa5 	bl	8000576 <putx_>
 800062c:	e001      	b.n	8000632 <printf_+0x8a>
 800062e:	f7ff ff41 	bl	80004b4 <putc_>
 8000632:	3402      	adds	r4, #2
 8000634:	e7c2      	b.n	80005bc <printf_+0x14>
 8000636:	4804      	ldr	r0, [pc, #16]	; (8000648 <printf_+0xa0>)
 8000638:	f000 f856 	bl	80006e8 <mutex_unlock>
 800063c:	b003      	add	sp, #12
 800063e:	e8bd 4030 	ldmia.w	sp!, {r4, r5, lr}
 8000642:	b004      	add	sp, #16
 8000644:	4770      	bx	lr
 8000646:	bf00      	nop
 8000648:	20000568 	.word	0x20000568

0800064c <stdio_init>:
 800064c:	b510      	push	{r4, lr}
 800064e:	480e      	ldr	r0, [pc, #56]	; (8000688 <stdio_init+0x3c>)
 8000650:	f000 f824 	bl	800069c <mutex_init>
 8000654:	480d      	ldr	r0, [pc, #52]	; (800068c <stdio_init+0x40>)
 8000656:	f000 f821 	bl	800069c <mutex_init>
 800065a:	480d      	ldr	r0, [pc, #52]	; (8000690 <stdio_init+0x44>)
 800065c:	f000 f81e 	bl	800069c <mutex_init>
 8000660:	480c      	ldr	r0, [pc, #48]	; (8000694 <stdio_init+0x48>)
 8000662:	f000 f81b 	bl	800069c <mutex_init>
 8000666:	2408      	movs	r4, #8
 8000668:	2020      	movs	r0, #32
 800066a:	f7ff ff23 	bl	80004b4 <putc_>
 800066e:	3c01      	subs	r4, #1
 8000670:	d1fa      	bne.n	8000668 <stdio_init+0x1c>
 8000672:	2420      	movs	r4, #32
 8000674:	200a      	movs	r0, #10
 8000676:	f7ff ff1d 	bl	80004b4 <putc_>
 800067a:	3c01      	subs	r4, #1
 800067c:	d1fa      	bne.n	8000674 <stdio_init+0x28>
 800067e:	4806      	ldr	r0, [pc, #24]	; (8000698 <stdio_init+0x4c>)
 8000680:	e8bd 4010 	ldmia.w	sp!, {r4, lr}
 8000684:	f7ff bf90 	b.w	80005a8 <printf_>
 8000688:	20000560 	.word	0x20000560
 800068c:	20000564 	.word	0x20000564
 8000690:	2000056c 	.word	0x2000056c
 8000694:	20000568 	.word	0x20000568
 8000698:	0800180b 	.word	0x0800180b

0800069c <mutex_init>:
 800069c:	b510      	push	{r4, lr}
 800069e:	4604      	mov	r4, r0
 80006a0:	f7ff fe28 	bl	80002f4 <sched_off>
 80006a4:	2300      	movs	r3, #0
 80006a6:	6023      	str	r3, [r4, #0]
 80006a8:	e8bd 4010 	ldmia.w	sp!, {r4, lr}
 80006ac:	f7ff be24 	b.w	80002f8 <sched_on>

080006b0 <mutex_lock>:
 80006b0:	b513      	push	{r0, r1, r4, lr}
 80006b2:	4604      	mov	r4, r0
 80006b4:	f7ff fe1e 	bl	80002f4 <sched_off>
 80006b8:	6823      	ldr	r3, [r4, #0]
 80006ba:	9301      	str	r3, [sp, #4]
 80006bc:	f7ff fe1c 	bl	80002f8 <sched_on>
 80006c0:	9b01      	ldr	r3, [sp, #4]
 80006c2:	b10b      	cbz	r3, 80006c8 <mutex_lock+0x18>
 80006c4:	f7ff fe8a 	bl	80003dc <set_wait_state>
 80006c8:	9b01      	ldr	r3, [sp, #4]
 80006ca:	2b00      	cmp	r3, #0
 80006cc:	d1f2      	bne.n	80006b4 <mutex_lock+0x4>
 80006ce:	f7ff fe11 	bl	80002f4 <sched_off>
 80006d2:	6823      	ldr	r3, [r4, #0]
 80006d4:	9301      	str	r3, [sp, #4]
 80006d6:	9b01      	ldr	r3, [sp, #4]
 80006d8:	2b00      	cmp	r3, #0
 80006da:	d1eb      	bne.n	80006b4 <mutex_lock+0x4>
 80006dc:	2301      	movs	r3, #1
 80006de:	6023      	str	r3, [r4, #0]
 80006e0:	f7ff fe0a 	bl	80002f8 <sched_on>
 80006e4:	b002      	add	sp, #8
 80006e6:	bd10      	pop	{r4, pc}

080006e8 <mutex_unlock>:
 80006e8:	b508      	push	{r3, lr}
 80006ea:	f7ff ffd7 	bl	800069c <mutex_init>
 80006ee:	f7ff fe97 	bl	8000420 <wake_up_threads>
 80006f2:	e8bd 4008 	ldmia.w	sp!, {r3, lr}
 80006f6:	f7ff be01 	b.w	80002fc <yield>
	...

080006fc <lsm9ds0_read>:
 80006fc:	b538      	push	{r3, r4, r5, lr}
 80006fe:	2128      	movs	r1, #40	; 0x28
 8000700:	20d4      	movs	r0, #212	; 0xd4
 8000702:	f000 fdac 	bl	800125e <i2c_read_reg>
 8000706:	2129      	movs	r1, #41	; 0x29
 8000708:	4605      	mov	r5, r0
 800070a:	20d4      	movs	r0, #212	; 0xd4
 800070c:	f000 fda7 	bl	800125e <i2c_read_reg>
 8000710:	4c38      	ldr	r4, [pc, #224]	; (80007f4 <lsm9ds0_read+0xf8>)
 8000712:	ea45 2000 	orr.w	r0, r5, r0, lsl #8
 8000716:	81a0      	strh	r0, [r4, #12]
 8000718:	212a      	movs	r1, #42	; 0x2a
 800071a:	20d4      	movs	r0, #212	; 0xd4
 800071c:	f000 fd9f 	bl	800125e <i2c_read_reg>
 8000720:	212b      	movs	r1, #43	; 0x2b
 8000722:	4605      	mov	r5, r0
 8000724:	20d4      	movs	r0, #212	; 0xd4
 8000726:	f000 fd9a 	bl	800125e <i2c_read_reg>
 800072a:	ea45 2000 	orr.w	r0, r5, r0, lsl #8
 800072e:	81e0      	strh	r0, [r4, #14]
 8000730:	212c      	movs	r1, #44	; 0x2c
 8000732:	20d4      	movs	r0, #212	; 0xd4
 8000734:	f000 fd93 	bl	800125e <i2c_read_reg>
 8000738:	212d      	movs	r1, #45	; 0x2d
 800073a:	4605      	mov	r5, r0
 800073c:	20d4      	movs	r0, #212	; 0xd4
 800073e:	f000 fd8e 	bl	800125e <i2c_read_reg>
 8000742:	ea45 2000 	orr.w	r0, r5, r0, lsl #8
 8000746:	8220      	strh	r0, [r4, #16]
 8000748:	2108      	movs	r1, #8
 800074a:	203c      	movs	r0, #60	; 0x3c
 800074c:	f000 fd87 	bl	800125e <i2c_read_reg>
 8000750:	2109      	movs	r1, #9
 8000752:	4605      	mov	r5, r0
 8000754:	203c      	movs	r0, #60	; 0x3c
 8000756:	f000 fd82 	bl	800125e <i2c_read_reg>
 800075a:	ea45 2000 	orr.w	r0, r5, r0, lsl #8
 800075e:	80e0      	strh	r0, [r4, #6]
 8000760:	210a      	movs	r1, #10
 8000762:	203c      	movs	r0, #60	; 0x3c
 8000764:	f000 fd7b 	bl	800125e <i2c_read_reg>
 8000768:	210b      	movs	r1, #11
 800076a:	4605      	mov	r5, r0
 800076c:	203c      	movs	r0, #60	; 0x3c
 800076e:	f000 fd76 	bl	800125e <i2c_read_reg>
 8000772:	ea45 2000 	orr.w	r0, r5, r0, lsl #8
 8000776:	8120      	strh	r0, [r4, #8]
 8000778:	210c      	movs	r1, #12
 800077a:	203c      	movs	r0, #60	; 0x3c
 800077c:	f000 fd6f 	bl	800125e <i2c_read_reg>
 8000780:	210d      	movs	r1, #13
 8000782:	4605      	mov	r5, r0
 8000784:	203c      	movs	r0, #60	; 0x3c
 8000786:	f000 fd6a 	bl	800125e <i2c_read_reg>
 800078a:	ea45 2000 	orr.w	r0, r5, r0, lsl #8
 800078e:	8160      	strh	r0, [r4, #10]
 8000790:	2128      	movs	r1, #40	; 0x28
 8000792:	203c      	movs	r0, #60	; 0x3c
 8000794:	f000 fd63 	bl	800125e <i2c_read_reg>
 8000798:	2129      	movs	r1, #41	; 0x29
 800079a:	4605      	mov	r5, r0
 800079c:	203c      	movs	r0, #60	; 0x3c
 800079e:	f000 fd5e 	bl	800125e <i2c_read_reg>
 80007a2:	ea45 2000 	orr.w	r0, r5, r0, lsl #8
 80007a6:	8020      	strh	r0, [r4, #0]
 80007a8:	212a      	movs	r1, #42	; 0x2a
 80007aa:	203c      	movs	r0, #60	; 0x3c
 80007ac:	f000 fd57 	bl	800125e <i2c_read_reg>
 80007b0:	212b      	movs	r1, #43	; 0x2b
 80007b2:	4605      	mov	r5, r0
 80007b4:	203c      	movs	r0, #60	; 0x3c
 80007b6:	f000 fd52 	bl	800125e <i2c_read_reg>
 80007ba:	ea45 2000 	orr.w	r0, r5, r0, lsl #8
 80007be:	8060      	strh	r0, [r4, #2]
 80007c0:	212c      	movs	r1, #44	; 0x2c
 80007c2:	203c      	movs	r0, #60	; 0x3c
 80007c4:	f000 fd4b 	bl	800125e <i2c_read_reg>
 80007c8:	212d      	movs	r1, #45	; 0x2d
 80007ca:	4605      	mov	r5, r0
 80007cc:	203c      	movs	r0, #60	; 0x3c
 80007ce:	f000 fd46 	bl	800125e <i2c_read_reg>
 80007d2:	ea45 2000 	orr.w	r0, r5, r0, lsl #8
 80007d6:	80a0      	strh	r0, [r4, #4]
 80007d8:	2105      	movs	r1, #5
 80007da:	203c      	movs	r0, #60	; 0x3c
 80007dc:	f000 fd3f 	bl	800125e <i2c_read_reg>
 80007e0:	2106      	movs	r1, #6
 80007e2:	4605      	mov	r5, r0
 80007e4:	203c      	movs	r0, #60	; 0x3c
 80007e6:	f000 fd3a 	bl	800125e <i2c_read_reg>
 80007ea:	ea45 2000 	orr.w	r0, r5, r0, lsl #8
 80007ee:	8320      	strh	r0, [r4, #24]
 80007f0:	bd38      	pop	{r3, r4, r5, pc}
 80007f2:	bf00      	nop
 80007f4:	20000570 	.word	0x20000570

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
 800081e:	f000 fd1e 	bl	800125e <i2c_read_reg>
 8000822:	28d4      	cmp	r0, #212	; 0xd4
 8000824:	4606      	mov	r6, r0
 8000826:	d14e      	bne.n	80008c6 <lsm9ds0_init+0xce>
 8000828:	203c      	movs	r0, #60	; 0x3c
 800082a:	210f      	movs	r1, #15
 800082c:	f000 fd17 	bl	800125e <i2c_read_reg>
 8000830:	2849      	cmp	r0, #73	; 0x49
 8000832:	bf18      	it	ne
 8000834:	2602      	movne	r6, #2
 8000836:	d147      	bne.n	80008c8 <lsm9ds0_init+0xd0>
 8000838:	4630      	mov	r0, r6
 800083a:	2120      	movs	r1, #32
 800083c:	22ff      	movs	r2, #255	; 0xff
 800083e:	f000 fcfb 	bl	8001238 <i2c_write_reg>
 8000842:	4630      	mov	r0, r6
 8000844:	2123      	movs	r1, #35	; 0x23
 8000846:	2218      	movs	r2, #24
 8000848:	f000 fcf6 	bl	8001238 <i2c_write_reg>
 800084c:	203c      	movs	r0, #60	; 0x3c
 800084e:	211f      	movs	r1, #31
 8000850:	4622      	mov	r2, r4
 8000852:	f000 fcf1 	bl	8001238 <i2c_write_reg>
 8000856:	203c      	movs	r0, #60	; 0x3c
 8000858:	2120      	movs	r1, #32
 800085a:	2267      	movs	r2, #103	; 0x67
 800085c:	f000 fcec 	bl	8001238 <i2c_write_reg>
 8000860:	203c      	movs	r0, #60	; 0x3c
 8000862:	2121      	movs	r1, #33	; 0x21
 8000864:	4622      	mov	r2, r4
 8000866:	f000 fce7 	bl	8001238 <i2c_write_reg>
 800086a:	203c      	movs	r0, #60	; 0x3c
 800086c:	2124      	movs	r1, #36	; 0x24
 800086e:	22f4      	movs	r2, #244	; 0xf4
 8000870:	f000 fce2 	bl	8001238 <i2c_write_reg>
 8000874:	203c      	movs	r0, #60	; 0x3c
 8000876:	2125      	movs	r1, #37	; 0x25
 8000878:	4622      	mov	r2, r4
 800087a:	f000 fcdd 	bl	8001238 <i2c_write_reg>
 800087e:	203c      	movs	r0, #60	; 0x3c
 8000880:	2126      	movs	r1, #38	; 0x26
 8000882:	2280      	movs	r2, #128	; 0x80
 8000884:	f000 fcd8 	bl	8001238 <i2c_write_reg>
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
 80008d0:	20000570 	.word	0x20000570

080008d4 <motor_run>:
 80008d4:	f640 73ff 	movw	r3, #4095	; 0xfff
 80008d8:	4298      	cmp	r0, r3
 80008da:	b510      	push	{r4, lr}
 80008dc:	4604      	mov	r4, r0
 80008de:	dc04      	bgt.n	80008ea <motor_run+0x16>
 80008e0:	4a2a      	ldr	r2, [pc, #168]	; (800098c <motor_run+0xb8>)
 80008e2:	4294      	cmp	r4, r2
 80008e4:	bfb8      	it	lt
 80008e6:	4614      	movlt	r4, r2
 80008e8:	e000      	b.n	80008ec <motor_run+0x18>
 80008ea:	461c      	mov	r4, r3
 80008ec:	4299      	cmp	r1, r3
 80008ee:	dc1a      	bgt.n	8000926 <motor_run+0x52>
 80008f0:	4b26      	ldr	r3, [pc, #152]	; (800098c <motor_run+0xb8>)
 80008f2:	4299      	cmp	r1, r3
 80008f4:	bfb8      	it	lt
 80008f6:	4619      	movlt	r1, r3
 80008f8:	db09      	blt.n	800090e <motor_run+0x3a>
 80008fa:	2900      	cmp	r1, #0
 80008fc:	d106      	bne.n	800090c <motor_run+0x38>
 80008fe:	2002      	movs	r0, #2
 8000900:	f000 f89f 	bl	8000a42 <pca9685_send>
 8000904:	2009      	movs	r0, #9
 8000906:	f640 71ff 	movw	r1, #4095	; 0xfff
 800090a:	e006      	b.n	800091a <motor_run+0x46>
 800090c:	da0d      	bge.n	800092a <motor_run+0x56>
 800090e:	2008      	movs	r0, #8
 8000910:	4249      	negs	r1, r1
 8000912:	f000 f896 	bl	8000a42 <pca9685_send>
 8000916:	2009      	movs	r0, #9
 8000918:	2100      	movs	r1, #0
 800091a:	f000 f892 	bl	8000a42 <pca9685_send>
 800091e:	200a      	movs	r0, #10
 8000920:	f640 71ff 	movw	r1, #4095	; 0xfff
 8000924:	e00b      	b.n	800093e <motor_run+0x6a>
 8000926:	f640 71ff 	movw	r1, #4095	; 0xfff
 800092a:	2008      	movs	r0, #8
 800092c:	f000 f889 	bl	8000a42 <pca9685_send>
 8000930:	2009      	movs	r0, #9
 8000932:	f640 71ff 	movw	r1, #4095	; 0xfff
 8000936:	f000 f884 	bl	8000a42 <pca9685_send>
 800093a:	200a      	movs	r0, #10
 800093c:	2100      	movs	r1, #0
 800093e:	f000 f880 	bl	8000a42 <pca9685_send>
 8000942:	2c00      	cmp	r4, #0
 8000944:	f04f 000d 	mov.w	r0, #13
 8000948:	d106      	bne.n	8000958 <motor_run+0x84>
 800094a:	4621      	mov	r1, r4
 800094c:	f000 f879 	bl	8000a42 <pca9685_send>
 8000950:	200b      	movs	r0, #11
 8000952:	f640 71ff 	movw	r1, #4095	; 0xfff
 8000956:	e010      	b.n	800097a <motor_run+0xa6>
 8000958:	da0a      	bge.n	8000970 <motor_run+0x9c>
 800095a:	4261      	negs	r1, r4
 800095c:	f000 f871 	bl	8000a42 <pca9685_send>
 8000960:	200b      	movs	r0, #11
 8000962:	f640 71ff 	movw	r1, #4095	; 0xfff
 8000966:	f000 f86c 	bl	8000a42 <pca9685_send>
 800096a:	200c      	movs	r0, #12
 800096c:	2100      	movs	r1, #0
 800096e:	e009      	b.n	8000984 <motor_run+0xb0>
 8000970:	4621      	mov	r1, r4
 8000972:	f000 f866 	bl	8000a42 <pca9685_send>
 8000976:	200b      	movs	r0, #11
 8000978:	2100      	movs	r1, #0
 800097a:	f000 f862 	bl	8000a42 <pca9685_send>
 800097e:	200c      	movs	r0, #12
 8000980:	f640 71ff 	movw	r1, #4095	; 0xfff
 8000984:	e8bd 4010 	ldmia.w	sp!, {r4, lr}
 8000988:	f000 b85b 	b.w	8000a42 <pca9685_send>
 800098c:	fffff001 	.word	0xfffff001

08000990 <motor_init>:
 8000990:	2000      	movs	r0, #0
 8000992:	4601      	mov	r1, r0
 8000994:	f7ff bf9e 	b.w	80008d4 <motor_run>

08000998 <imu_init>:
 8000998:	4b07      	ldr	r3, [pc, #28]	; (80009b8 <imu_init+0x20>)
 800099a:	2200      	movs	r2, #0
 800099c:	801a      	strh	r2, [r3, #0]
 800099e:	805a      	strh	r2, [r3, #2]
 80009a0:	809a      	strh	r2, [r3, #4]
 80009a2:	609a      	str	r2, [r3, #8]
 80009a4:	60da      	str	r2, [r3, #12]
 80009a6:	611a      	str	r2, [r3, #16]
 80009a8:	615a      	str	r2, [r3, #20]
 80009aa:	619a      	str	r2, [r3, #24]
 80009ac:	61da      	str	r2, [r3, #28]
 80009ae:	621a      	str	r2, [r3, #32]
 80009b0:	625a      	str	r2, [r3, #36]	; 0x24
 80009b2:	629a      	str	r2, [r3, #40]	; 0x28
 80009b4:	4770      	bx	lr
 80009b6:	bf00      	nop
 80009b8:	200005f8 	.word	0x200005f8

080009bc <pca9685_init>:
 80009bc:	b508      	push	{r3, lr}
 80009be:	f000 fbcd 	bl	800115c <i2cStart>
 80009c2:	20c0      	movs	r0, #192	; 0xc0
 80009c4:	f000 fbe8 	bl	8001198 <i2cWrite>
 80009c8:	2000      	movs	r0, #0
 80009ca:	f000 fbe5 	bl	8001198 <i2cWrite>
 80009ce:	2031      	movs	r0, #49	; 0x31
 80009d0:	f000 fbe2 	bl	8001198 <i2cWrite>
 80009d4:	f000 fbd1 	bl	800117a <i2cStop>
 80009d8:	2002      	movs	r0, #2
 80009da:	f000 fe03 	bl	80015e4 <timer_delay_ms>
 80009de:	f000 fbbd 	bl	800115c <i2cStart>
 80009e2:	20c0      	movs	r0, #192	; 0xc0
 80009e4:	f000 fbd8 	bl	8001198 <i2cWrite>
 80009e8:	20fe      	movs	r0, #254	; 0xfe
 80009ea:	f000 fbd5 	bl	8001198 <i2cWrite>
 80009ee:	2001      	movs	r0, #1
 80009f0:	f000 fbd2 	bl	8001198 <i2cWrite>
 80009f4:	f000 fbc1 	bl	800117a <i2cStop>
 80009f8:	2002      	movs	r0, #2
 80009fa:	f000 fdf3 	bl	80015e4 <timer_delay_ms>
 80009fe:	f000 fbad 	bl	800115c <i2cStart>
 8000a02:	20c0      	movs	r0, #192	; 0xc0
 8000a04:	f000 fbc8 	bl	8001198 <i2cWrite>
 8000a08:	2000      	movs	r0, #0
 8000a0a:	f000 fbc5 	bl	8001198 <i2cWrite>
 8000a0e:	20a1      	movs	r0, #161	; 0xa1
 8000a10:	f000 fbc2 	bl	8001198 <i2cWrite>
 8000a14:	f000 fbb1 	bl	800117a <i2cStop>
 8000a18:	2002      	movs	r0, #2
 8000a1a:	f000 fde3 	bl	80015e4 <timer_delay_ms>
 8000a1e:	f000 fb9d 	bl	800115c <i2cStart>
 8000a22:	20c0      	movs	r0, #192	; 0xc0
 8000a24:	f000 fbb8 	bl	8001198 <i2cWrite>
 8000a28:	2001      	movs	r0, #1
 8000a2a:	f000 fbb5 	bl	8001198 <i2cWrite>
 8000a2e:	2004      	movs	r0, #4
 8000a30:	f000 fbb2 	bl	8001198 <i2cWrite>
 8000a34:	f000 fba1 	bl	800117a <i2cStop>
 8000a38:	2002      	movs	r0, #2
 8000a3a:	e8bd 4008 	ldmia.w	sp!, {r3, lr}
 8000a3e:	f000 bdd1 	b.w	80015e4 <timer_delay_ms>

08000a42 <pca9685_send>:
 8000a42:	b538      	push	{r3, r4, r5, lr}
 8000a44:	4605      	mov	r5, r0
 8000a46:	f640 74ff 	movw	r4, #4095	; 0xfff
 8000a4a:	42a1      	cmp	r1, r4
 8000a4c:	bf38      	it	cc
 8000a4e:	460c      	movcc	r4, r1
 8000a50:	00ad      	lsls	r5, r5, #2
 8000a52:	f000 fb83 	bl	800115c <i2cStart>
 8000a56:	20c0      	movs	r0, #192	; 0xc0
 8000a58:	f000 fb9e 	bl	8001198 <i2cWrite>
 8000a5c:	1da8      	adds	r0, r5, #6
 8000a5e:	f000 00fe 	and.w	r0, r0, #254	; 0xfe
 8000a62:	f000 fb99 	bl	8001198 <i2cWrite>
 8000a66:	2000      	movs	r0, #0
 8000a68:	f000 fb96 	bl	8001198 <i2cWrite>
 8000a6c:	2000      	movs	r0, #0
 8000a6e:	f000 fb93 	bl	8001198 <i2cWrite>
 8000a72:	b2e0      	uxtb	r0, r4
 8000a74:	f000 fb90 	bl	8001198 <i2cWrite>
 8000a78:	f3c4 2007 	ubfx	r0, r4, #8, #8
 8000a7c:	f000 fb8c 	bl	8001198 <i2cWrite>
 8000a80:	e8bd 4038 	ldmia.w	sp!, {r3, r4, r5, lr}
 8000a84:	f000 bb79 	b.w	800117a <i2cStop>

08000a88 <robot_init>:
 8000a88:	b508      	push	{r3, lr}
 8000a8a:	f7ff ff97 	bl	80009bc <pca9685_init>
 8000a8e:	f7ff ff7f 	bl	8000990 <motor_init>
 8000a92:	f7ff feb1 	bl	80007f8 <lsm9ds0_init>
 8000a96:	e8bd 4008 	ldmia.w	sp!, {r3, lr}
 8000a9a:	f7ff bf7d 	b.w	8000998 <imu_init>
	...

08000aa0 <robot_test_lsm9ds0>:
 8000aa0:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
 8000aa2:	ed2d 8b02 	vpush	{d8}
 8000aa6:	f7ff fea7 	bl	80007f8 <lsm9ds0_init>
 8000aaa:	4605      	mov	r5, r0
 8000aac:	2040      	movs	r0, #64	; 0x40
 8000aae:	f000 fda9 	bl	8001604 <led_on>
 8000ab2:	f000 fd89 	bl	80015c8 <timer_get_time>
 8000ab6:	4606      	mov	r6, r0
 8000ab8:	f7ff fe20 	bl	80006fc <lsm9ds0_read>
 8000abc:	f000 fd84 	bl	80015c8 <timer_get_time>
 8000ac0:	4c3b      	ldr	r4, [pc, #236]	; (8000bb0 <robot_test_lsm9ds0+0x110>)
 8000ac2:	4607      	mov	r7, r0
 8000ac4:	2040      	movs	r0, #64	; 0x40
 8000ac6:	f000 fda5 	bl	8001614 <led_off>
 8000aca:	1bbb      	subs	r3, r7, r6
 8000acc:	4629      	mov	r1, r5
 8000ace:	f9b4 2018 	ldrsh.w	r2, [r4, #24]
 8000ad2:	4838      	ldr	r0, [pc, #224]	; (8000bb4 <robot_test_lsm9ds0+0x114>)
 8000ad4:	f7ff fd68 	bl	80005a8 <printf_>
 8000ad8:	f9b4 1000 	ldrsh.w	r1, [r4]
 8000adc:	f9b4 2002 	ldrsh.w	r2, [r4, #2]
 8000ae0:	f9b4 3004 	ldrsh.w	r3, [r4, #4]
 8000ae4:	4834      	ldr	r0, [pc, #208]	; (8000bb8 <robot_test_lsm9ds0+0x118>)
 8000ae6:	f7ff fd5f 	bl	80005a8 <printf_>
 8000aea:	f9b4 1006 	ldrsh.w	r1, [r4, #6]
 8000aee:	f9b4 2008 	ldrsh.w	r2, [r4, #8]
 8000af2:	f9b4 300a 	ldrsh.w	r3, [r4, #10]
 8000af6:	4830      	ldr	r0, [pc, #192]	; (8000bb8 <robot_test_lsm9ds0+0x118>)
 8000af8:	f7ff fd56 	bl	80005a8 <printf_>
 8000afc:	f9b4 e00c 	ldrsh.w	lr, [r4, #12]
 8000b00:	f9b4 1012 	ldrsh.w	r1, [r4, #18]
 8000b04:	f9b4 700e 	ldrsh.w	r7, [r4, #14]
 8000b08:	f9b4 2014 	ldrsh.w	r2, [r4, #20]
 8000b0c:	f9b4 6010 	ldrsh.w	r6, [r4, #16]
 8000b10:	f9b4 3016 	ldrsh.w	r3, [r4, #22]
 8000b14:	4828      	ldr	r0, [pc, #160]	; (8000bb8 <robot_test_lsm9ds0+0x118>)
 8000b16:	ebc1 010e 	rsb	r1, r1, lr
 8000b1a:	1af3      	subs	r3, r6, r3
 8000b1c:	1aba      	subs	r2, r7, r2
 8000b1e:	f7ff fd43 	bl	80005a8 <printf_>
 8000b22:	f9b4 0000 	ldrsh.w	r0, [r4]
 8000b26:	f9b4 1004 	ldrsh.w	r1, [r4, #4]
 8000b2a:	ee06 0a90 	vmov	s13, r0
 8000b2e:	ee07 1a90 	vmov	s15, r1
 8000b32:	eef8 6ae6 	vcvt.f32.s32	s13, s13
 8000b36:	eef8 7ae7 	vcvt.f32.s32	s15, s15
 8000b3a:	ee16 0a90 	vmov	r0, s13
 8000b3e:	ee17 1a90 	vmov	r1, s15
 8000b42:	f000 f8b5 	bl	8000cb0 <m_atan2>
 8000b46:	f9b4 1006 	ldrsh.w	r1, [r4, #6]
 8000b4a:	ee08 0a10 	vmov	s16, r0
 8000b4e:	f9b4 0008 	ldrsh.w	r0, [r4, #8]
 8000b52:	ee07 1a90 	vmov	s15, r1
 8000b56:	ee06 0a90 	vmov	s13, r0
 8000b5a:	eef8 7ae7 	vcvt.f32.s32	s15, s15
 8000b5e:	eef8 6ae6 	vcvt.f32.s32	s13, s13
 8000b62:	ee17 1a90 	vmov	r1, s15
 8000b66:	ee16 0a90 	vmov	r0, s13
 8000b6a:	f000 f8a1 	bl	8000cb0 <m_atan2>
 8000b6e:	ed9f 7a13 	vldr	s14, [pc, #76]	; 8000bbc <robot_test_lsm9ds0+0x11c>
 8000b72:	ee06 0a90 	vmov	s13, r0
 8000b76:	ee28 8a07 	vmul.f32	s16, s16, s14
 8000b7a:	eddf 7a11 	vldr	s15, [pc, #68]	; 8000bc0 <robot_test_lsm9ds0+0x120>
 8000b7e:	ee26 7a87 	vmul.f32	s14, s13, s14
 8000b82:	ee88 8a27 	vdiv.f32	s16, s16, s15
 8000b86:	480f      	ldr	r0, [pc, #60]	; (8000bc4 <robot_test_lsm9ds0+0x124>)
 8000b88:	eec7 7a27 	vdiv.f32	s15, s14, s15
 8000b8c:	eebd 8ac8 	vcvt.s32.f32	s16, s16
 8000b90:	eefd 7ae7 	vcvt.s32.f32	s15, s15
 8000b94:	ee18 1a10 	vmov	r1, s16
 8000b98:	ee17 2a90 	vmov	r2, s15
 8000b9c:	f7ff fd04 	bl	80005a8 <printf_>
 8000ba0:	4809      	ldr	r0, [pc, #36]	; (8000bc8 <robot_test_lsm9ds0+0x128>)
 8000ba2:	f7ff fd01 	bl	80005a8 <printf_>
 8000ba6:	2064      	movs	r0, #100	; 0x64
 8000ba8:	f000 fd1c 	bl	80015e4 <timer_delay_ms>
 8000bac:	e77e      	b.n	8000aac <robot_test_lsm9ds0+0xc>
 8000bae:	bf00      	nop
 8000bb0:	20000570 	.word	0x20000570
 8000bb4:	0800181c 	.word	0x0800181c
 8000bb8:	08001827 	.word	0x08001827
 8000bbc:	43340000 	.word	0x43340000
 8000bc0:	40490fdb 	.word	0x40490fdb
 8000bc4:	08001835 	.word	0x08001835
 8000bc8:	08001809 	.word	0x08001809

08000bcc <robot_main>:
 8000bcc:	b508      	push	{r3, lr}
 8000bce:	f7ff ff67 	bl	8000aa0 <robot_test_lsm9ds0>
	...

08000bd4 <m_atan>:
 8000bd4:	ee07 0a90 	vmov	s15, r0
 8000bd8:	eef5 7a40 	vcmp.f32	s15, #0.0
 8000bdc:	eef1 fa10 	vmrs	APSR_nzcv, fpscr
 8000be0:	d04a      	beq.n	8000c78 <m_atan+0xa4>
 8000be2:	eef5 7ac0 	vcmpe.f32	s15, #0.0
 8000be6:	eef1 fa10 	vmrs	APSR_nzcv, fpscr
 8000bea:	ed9f 7a24 	vldr	s14, [pc, #144]	; 8000c7c <m_atan+0xa8>
 8000bee:	bf48      	it	mi
 8000bf0:	eef1 7a67 	vnegmi.f32	s15, s15
 8000bf4:	ee77 6ac7 	vsub.f32	s13, s15, s14
 8000bf8:	ee77 7a87 	vadd.f32	s15, s15, s14
 8000bfc:	eddf 5a20 	vldr	s11, [pc, #128]	; 8000c80 <m_atan+0xac>
 8000c00:	eec6 6aa7 	vdiv.f32	s13, s13, s15
 8000c04:	ed9f 6a1f 	vldr	s12, [pc, #124]	; 8000c84 <m_atan+0xb0>
 8000c08:	ee66 7aa6 	vmul.f32	s15, s13, s13
 8000c0c:	bf58      	it	pl
 8000c0e:	eeb0 5a47 	vmovpl.f32	s10, s14
 8000c12:	ee17 6aa5 	vnmls.f32	s12, s15, s11
 8000c16:	eddf 5a1c 	vldr	s11, [pc, #112]	; 8000c88 <m_atan+0xb4>
 8000c1a:	ee46 5a27 	vmla.f32	s11, s12, s15
 8000c1e:	ed9f 6a1b 	vldr	s12, [pc, #108]	; 8000c8c <m_atan+0xb8>
 8000c22:	ee15 6aa7 	vnmls.f32	s12, s11, s15
 8000c26:	eddf 5a1a 	vldr	s11, [pc, #104]	; 8000c90 <m_atan+0xbc>
 8000c2a:	ee46 5a27 	vmla.f32	s11, s12, s15
 8000c2e:	ed9f 6a19 	vldr	s12, [pc, #100]	; 8000c94 <m_atan+0xc0>
 8000c32:	ee15 6aa7 	vnmls.f32	s12, s11, s15
 8000c36:	eddf 5a18 	vldr	s11, [pc, #96]	; 8000c98 <m_atan+0xc4>
 8000c3a:	ee46 5a27 	vmla.f32	s11, s12, s15
 8000c3e:	ed9f 6a17 	vldr	s12, [pc, #92]	; 8000c9c <m_atan+0xc8>
 8000c42:	ee15 6aa7 	vnmls.f32	s12, s11, s15
 8000c46:	bf48      	it	mi
 8000c48:	ed9f 5a15 	vldrmi	s10, [pc, #84]	; 8000ca0 <m_atan+0xcc>
 8000c4c:	ee06 7a27 	vmla.f32	s14, s12, s15
 8000c50:	eddf 7a14 	vldr	s15, [pc, #80]	; 8000ca4 <m_atan+0xd0>
 8000c54:	ee67 6a26 	vmul.f32	s13, s14, s13
 8000c58:	ed9f 7a13 	vldr	s14, [pc, #76]	; 8000ca8 <m_atan+0xd4>
 8000c5c:	ee05 7a26 	vmla.f32	s14, s10, s13
 8000c60:	eeb4 7a67 	vcmp.f32	s14, s15
 8000c64:	eddf 7a11 	vldr	s15, [pc, #68]	; 8000cac <m_atan+0xd8>
 8000c68:	eef1 fa10 	vmrs	APSR_nzcv, fpscr
 8000c6c:	bf4c      	ite	mi
 8000c6e:	ee17 0a90 	vmovmi	r0, s15
 8000c72:	ee17 0a10 	vmovpl	r0, s14
 8000c76:	4770      	bx	lr
 8000c78:	2000      	movs	r0, #0
 8000c7a:	4770      	bx	lr
 8000c7c:	3f800000 	.word	0x3f800000
 8000c80:	3b3bd74a 	.word	0x3b3bd74a
 8000c84:	3c846e02 	.word	0x3c846e02
 8000c88:	3d2fc1fe 	.word	0x3d2fc1fe
 8000c8c:	3d9a3174 	.word	0x3d9a3174
 8000c90:	3dda3d83 	.word	0x3dda3d83
 8000c94:	3e117fc7 	.word	0x3e117fc7
 8000c98:	3e4cbbe5 	.word	0x3e4cbbe5
 8000c9c:	3eaaaa6c 	.word	0x3eaaaa6c
 8000ca0:	bf800000 	.word	0xbf800000
 8000ca4:	2edbe6ff 	.word	0x2edbe6ff
 8000ca8:	3f490fdb 	.word	0x3f490fdb
 8000cac:	00000000 	.word	0x00000000

08000cb0 <m_atan2>:
 8000cb0:	ee07 1a10 	vmov	s14, r1
 8000cb4:	eeb5 7ac0 	vcmpe.f32	s14, #0.0
 8000cb8:	eef1 fa10 	vmrs	APSR_nzcv, fpscr
 8000cbc:	ed9f 6a31 	vldr	s12, [pc, #196]	; 8000d84 <m_atan2+0xd4>
 8000cc0:	bf4c      	ite	mi
 8000cc2:	eef1 7a47 	vnegmi.f32	s15, s14
 8000cc6:	eef0 7a47 	vmovpl.f32	s15, s14
 8000cca:	eef4 7ac6 	vcmpe.f32	s15, s12
 8000cce:	eef1 fa10 	vmrs	APSR_nzcv, fpscr
 8000cd2:	b508      	push	{r3, lr}
 8000cd4:	ee06 0a90 	vmov	s13, r0
 8000cd8:	d50b      	bpl.n	8000cf2 <m_atan2+0x42>
 8000cda:	eef5 6ac0 	vcmpe.f32	s13, #0.0
 8000cde:	eddf 7a2a 	vldr	s15, [pc, #168]	; 8000d88 <m_atan2+0xd8>
 8000ce2:	ed9f 7a2a 	vldr	s14, [pc, #168]	; 8000d8c <m_atan2+0xdc>
 8000ce6:	eef1 fa10 	vmrs	APSR_nzcv, fpscr
 8000cea:	bfa8      	it	ge
 8000cec:	eef0 7a47 	vmovge.f32	s15, s14
 8000cf0:	e044      	b.n	8000d7c <m_atan2+0xcc>
 8000cf2:	eec6 7a87 	vdiv.f32	s15, s13, s14
 8000cf6:	eef5 7ac0 	vcmpe.f32	s15, #0.0
 8000cfa:	eef1 fa10 	vmrs	APSR_nzcv, fpscr
 8000cfe:	eef5 6ac0 	vcmpe.f32	s13, #0.0
 8000d02:	bf48      	it	mi
 8000d04:	eef1 7a67 	vnegmi.f32	s15, s15
 8000d08:	eef1 fa10 	vmrs	APSR_nzcv, fpscr
 8000d0c:	db0a      	blt.n	8000d24 <m_atan2+0x74>
 8000d0e:	eeb5 7ac0 	vcmpe.f32	s14, #0.0
 8000d12:	eef1 fa10 	vmrs	APSR_nzcv, fpscr
 8000d16:	db06      	blt.n	8000d26 <m_atan2+0x76>
 8000d18:	ee17 0a90 	vmov	r0, s15
 8000d1c:	e8bd 4008 	ldmia.w	sp!, {r3, lr}
 8000d20:	f7ff bf58 	b.w	8000bd4 <m_atan>
 8000d24:	db0f      	blt.n	8000d46 <m_atan2+0x96>
 8000d26:	eeb5 7ac0 	vcmpe.f32	s14, #0.0
 8000d2a:	eef1 fa10 	vmrs	APSR_nzcv, fpscr
 8000d2e:	d80a      	bhi.n	8000d46 <m_atan2+0x96>
 8000d30:	ee17 0a90 	vmov	r0, s15
 8000d34:	f7ff ff4e 	bl	8000bd4 <m_atan>
 8000d38:	eddf 7a14 	vldr	s15, [pc, #80]	; 8000d8c <m_atan2+0xdc>
 8000d3c:	ee07 0a10 	vmov	s14, r0
 8000d40:	ee77 7ac7 	vsub.f32	s15, s15, s14
 8000d44:	e01a      	b.n	8000d7c <m_atan2+0xcc>
 8000d46:	eef5 6ac0 	vcmpe.f32	s13, #0.0
 8000d4a:	eef1 fa10 	vmrs	APSR_nzcv, fpscr
 8000d4e:	ee17 0a90 	vmov	r0, s15
 8000d52:	d80d      	bhi.n	8000d70 <m_atan2+0xc0>
 8000d54:	eeb5 7ac0 	vcmpe.f32	s14, #0.0
 8000d58:	eef1 fa10 	vmrs	APSR_nzcv, fpscr
 8000d5c:	d808      	bhi.n	8000d70 <m_atan2+0xc0>
 8000d5e:	f7ff ff39 	bl	8000bd4 <m_atan>
 8000d62:	eddf 7a0a 	vldr	s15, [pc, #40]	; 8000d8c <m_atan2+0xdc>
 8000d66:	ee07 0a10 	vmov	s14, r0
 8000d6a:	ee77 7a67 	vsub.f32	s15, s14, s15
 8000d6e:	e005      	b.n	8000d7c <m_atan2+0xcc>
 8000d70:	f7ff ff30 	bl	8000bd4 <m_atan>
 8000d74:	ee07 0a10 	vmov	s14, r0
 8000d78:	eef1 7a47 	vneg.f32	s15, s14
 8000d7c:	ee17 0a90 	vmov	r0, s15
 8000d80:	bd08      	pop	{r3, pc}
 8000d82:	bf00      	nop
 8000d84:	2edbe6ff 	.word	0x2edbe6ff
 8000d88:	c0490fdb 	.word	0xc0490fdb
 8000d8c:	40490fdb 	.word	0x40490fdb

08000d90 <main_thread>:
 8000d90:	b508      	push	{r3, lr}
 8000d92:	4804      	ldr	r0, [pc, #16]	; (8000da4 <main_thread+0x14>)
 8000d94:	f7ff fc08 	bl	80005a8 <printf_>
 8000d98:	f7ff fe76 	bl	8000a88 <robot_init>
 8000d9c:	e8bd 4008 	ldmia.w	sp!, {r3, lr}
 8000da0:	f7ff bf14 	b.w	8000bcc <robot_main>
 8000da4:	080018c6 	.word	0x080018c6

08000da8 <uart_write>:
 8000da8:	4b03      	ldr	r3, [pc, #12]	; (8000db8 <uart_write+0x10>)
 8000daa:	881a      	ldrh	r2, [r3, #0]
 8000dac:	0652      	lsls	r2, r2, #25
 8000dae:	d401      	bmi.n	8000db4 <uart_write+0xc>
 8000db0:	bf00      	nop
 8000db2:	e7f9      	b.n	8000da8 <uart_write>
 8000db4:	8098      	strh	r0, [r3, #4]
 8000db6:	4770      	bx	lr
 8000db8:	40011000 	.word	0x40011000

08000dbc <uart_init>:
 8000dbc:	b530      	push	{r4, r5, lr}
 8000dbe:	2010      	movs	r0, #16
 8000dc0:	b087      	sub	sp, #28
 8000dc2:	2101      	movs	r1, #1
 8000dc4:	f000 f90e 	bl	8000fe4 <RCC_APB2PeriphClockCmd>
 8000dc8:	2001      	movs	r0, #1
 8000dca:	4d1c      	ldr	r5, [pc, #112]	; (8000e3c <uart_init+0x80>)
 8000dcc:	4601      	mov	r1, r0
 8000dce:	f000 f8f1 	bl	8000fb4 <RCC_AHB1PeriphClockCmd>
 8000dd2:	f44f 63c0 	mov.w	r3, #1536	; 0x600
 8000dd6:	2400      	movs	r4, #0
 8000dd8:	9300      	str	r3, [sp, #0]
 8000dda:	4628      	mov	r0, r5
 8000ddc:	2302      	movs	r3, #2
 8000dde:	4669      	mov	r1, sp
 8000de0:	f88d 3004 	strb.w	r3, [sp, #4]
 8000de4:	f88d 3005 	strb.w	r3, [sp, #5]
 8000de8:	f88d 4006 	strb.w	r4, [sp, #6]
 8000dec:	f88d 4007 	strb.w	r4, [sp, #7]
 8000df0:	f000 fc74 	bl	80016dc <GPIO_Init>
 8000df4:	4628      	mov	r0, r5
 8000df6:	2109      	movs	r1, #9
 8000df8:	2207      	movs	r2, #7
 8000dfa:	f000 fcb4 	bl	8001766 <GPIO_PinAFConfig>
 8000dfe:	2207      	movs	r2, #7
 8000e00:	4628      	mov	r0, r5
 8000e02:	210a      	movs	r1, #10
 8000e04:	f000 fcaf 	bl	8001766 <GPIO_PinAFConfig>
 8000e08:	f8ad 400c 	strh.w	r4, [sp, #12]
 8000e0c:	f8ad 400e 	strh.w	r4, [sp, #14]
 8000e10:	f8ad 4010 	strh.w	r4, [sp, #16]
 8000e14:	f8ad 4014 	strh.w	r4, [sp, #20]
 8000e18:	4c09      	ldr	r4, [pc, #36]	; (8000e40 <uart_init+0x84>)
 8000e1a:	f44f 33e1 	mov.w	r3, #115200	; 0x1c200
 8000e1e:	9302      	str	r3, [sp, #8]
 8000e20:	4620      	mov	r0, r4
 8000e22:	230c      	movs	r3, #12
 8000e24:	a902      	add	r1, sp, #8
 8000e26:	f8ad 3012 	strh.w	r3, [sp, #18]
 8000e2a:	f000 f80b 	bl	8000e44 <USART_Init>
 8000e2e:	4620      	mov	r0, r4
 8000e30:	2101      	movs	r1, #1
 8000e32:	f000 f861 	bl	8000ef8 <USART_Cmd>
 8000e36:	b007      	add	sp, #28
 8000e38:	bd30      	pop	{r4, r5, pc}
 8000e3a:	bf00      	nop
 8000e3c:	40020000 	.word	0x40020000
 8000e40:	40011000 	.word	0x40011000

08000e44 <USART_Init>:
 8000e44:	8a03      	ldrh	r3, [r0, #16]
 8000e46:	88ca      	ldrh	r2, [r1, #6]
 8000e48:	b29b      	uxth	r3, r3
 8000e4a:	f423 5340 	bic.w	r3, r3, #12288	; 0x3000
 8000e4e:	b530      	push	{r4, r5, lr}
 8000e50:	4313      	orrs	r3, r2
 8000e52:	460d      	mov	r5, r1
 8000e54:	8203      	strh	r3, [r0, #16]
 8000e56:	8983      	ldrh	r3, [r0, #12]
 8000e58:	8909      	ldrh	r1, [r1, #8]
 8000e5a:	88aa      	ldrh	r2, [r5, #4]
 8000e5c:	f423 53b0 	bic.w	r3, r3, #5632	; 0x1600
 8000e60:	430a      	orrs	r2, r1
 8000e62:	8969      	ldrh	r1, [r5, #10]
 8000e64:	f023 030c 	bic.w	r3, r3, #12
 8000e68:	430a      	orrs	r2, r1
 8000e6a:	041b      	lsls	r3, r3, #16
 8000e6c:	b292      	uxth	r2, r2
 8000e6e:	0c1b      	lsrs	r3, r3, #16
 8000e70:	4313      	orrs	r3, r2
 8000e72:	8183      	strh	r3, [r0, #12]
 8000e74:	8a83      	ldrh	r3, [r0, #20]
 8000e76:	89aa      	ldrh	r2, [r5, #12]
 8000e78:	b29b      	uxth	r3, r3
 8000e7a:	f423 7340 	bic.w	r3, r3, #768	; 0x300
 8000e7e:	4313      	orrs	r3, r2
 8000e80:	b085      	sub	sp, #20
 8000e82:	8283      	strh	r3, [r0, #20]
 8000e84:	4604      	mov	r4, r0
 8000e86:	4668      	mov	r0, sp
 8000e88:	f000 f850 	bl	8000f2c <RCC_GetClocksFreq>
 8000e8c:	4b19      	ldr	r3, [pc, #100]	; (8000ef4 <USART_Init+0xb0>)
 8000e8e:	429c      	cmp	r4, r3
 8000e90:	d003      	beq.n	8000e9a <USART_Init+0x56>
 8000e92:	f503 6380 	add.w	r3, r3, #1024	; 0x400
 8000e96:	429c      	cmp	r4, r3
 8000e98:	d101      	bne.n	8000e9e <USART_Init+0x5a>
 8000e9a:	9b03      	ldr	r3, [sp, #12]
 8000e9c:	e000      	b.n	8000ea0 <USART_Init+0x5c>
 8000e9e:	9b02      	ldr	r3, [sp, #8]
 8000ea0:	89a2      	ldrh	r2, [r4, #12]
 8000ea2:	b212      	sxth	r2, r2
 8000ea4:	2a00      	cmp	r2, #0
 8000ea6:	682a      	ldr	r2, [r5, #0]
 8000ea8:	f04f 0119 	mov.w	r1, #25
 8000eac:	bfb4      	ite	lt
 8000eae:	0052      	lsllt	r2, r2, #1
 8000eb0:	0092      	lslge	r2, r2, #2
 8000eb2:	4359      	muls	r1, r3
 8000eb4:	fbb1 f1f2 	udiv	r1, r1, r2
 8000eb8:	2364      	movs	r3, #100	; 0x64
 8000eba:	fbb1 f2f3 	udiv	r2, r1, r3
 8000ebe:	0112      	lsls	r2, r2, #4
 8000ec0:	0910      	lsrs	r0, r2, #4
 8000ec2:	fb03 1110 	mls	r1, r3, r0, r1
 8000ec6:	89a0      	ldrh	r0, [r4, #12]
 8000ec8:	b200      	sxth	r0, r0
 8000eca:	2800      	cmp	r0, #0
 8000ecc:	da06      	bge.n	8000edc <USART_Init+0x98>
 8000ece:	00c9      	lsls	r1, r1, #3
 8000ed0:	3132      	adds	r1, #50	; 0x32
 8000ed2:	fbb1 f3f3 	udiv	r3, r1, r3
 8000ed6:	f003 0307 	and.w	r3, r3, #7
 8000eda:	e005      	b.n	8000ee8 <USART_Init+0xa4>
 8000edc:	0109      	lsls	r1, r1, #4
 8000ede:	3132      	adds	r1, #50	; 0x32
 8000ee0:	fbb1 f3f3 	udiv	r3, r1, r3
 8000ee4:	f003 030f 	and.w	r3, r3, #15
 8000ee8:	431a      	orrs	r2, r3
 8000eea:	b292      	uxth	r2, r2
 8000eec:	8122      	strh	r2, [r4, #8]
 8000eee:	b005      	add	sp, #20
 8000ef0:	bd30      	pop	{r4, r5, pc}
 8000ef2:	bf00      	nop
 8000ef4:	40011000 	.word	0x40011000

08000ef8 <USART_Cmd>:
 8000ef8:	8983      	ldrh	r3, [r0, #12]
 8000efa:	b119      	cbz	r1, 8000f04 <USART_Cmd+0xc>
 8000efc:	b29b      	uxth	r3, r3
 8000efe:	f443 5300 	orr.w	r3, r3, #8192	; 0x2000
 8000f02:	e003      	b.n	8000f0c <USART_Cmd+0x14>
 8000f04:	f423 5300 	bic.w	r3, r3, #8192	; 0x2000
 8000f08:	041b      	lsls	r3, r3, #16
 8000f0a:	0c1b      	lsrs	r3, r3, #16
 8000f0c:	8183      	strh	r3, [r0, #12]
 8000f0e:	4770      	bx	lr

08000f10 <lib_low_level_init>:
 8000f10:	b508      	push	{r3, lr}
 8000f12:	f000 fa93 	bl	800143c <sytem_clock_init>
 8000f16:	f000 fb85 	bl	8001624 <gpio_init>
 8000f1a:	f7ff ff4f 	bl	8000dbc <uart_init>
 8000f1e:	f000 fadd 	bl	80014dc <timer_init>
 8000f22:	e8bd 4008 	ldmia.w	sp!, {r3, lr}
 8000f26:	f000 b8f7 	b.w	8001118 <i2c_0_init>
	...

08000f2c <RCC_GetClocksFreq>:
 8000f2c:	4b1d      	ldr	r3, [pc, #116]	; (8000fa4 <RCC_GetClocksFreq+0x78>)
 8000f2e:	689a      	ldr	r2, [r3, #8]
 8000f30:	f002 020c 	and.w	r2, r2, #12
 8000f34:	2a04      	cmp	r2, #4
 8000f36:	b510      	push	{r4, lr}
 8000f38:	d003      	beq.n	8000f42 <RCC_GetClocksFreq+0x16>
 8000f3a:	2a08      	cmp	r2, #8
 8000f3c:	d003      	beq.n	8000f46 <RCC_GetClocksFreq+0x1a>
 8000f3e:	4b1a      	ldr	r3, [pc, #104]	; (8000fa8 <RCC_GetClocksFreq+0x7c>)
 8000f40:	e018      	b.n	8000f74 <RCC_GetClocksFreq+0x48>
 8000f42:	4b1a      	ldr	r3, [pc, #104]	; (8000fac <RCC_GetClocksFreq+0x80>)
 8000f44:	e016      	b.n	8000f74 <RCC_GetClocksFreq+0x48>
 8000f46:	6859      	ldr	r1, [r3, #4]
 8000f48:	685a      	ldr	r2, [r3, #4]
 8000f4a:	f411 0f80 	tst.w	r1, #4194304	; 0x400000
 8000f4e:	6859      	ldr	r1, [r3, #4]
 8000f50:	bf14      	ite	ne
 8000f52:	4b16      	ldrne	r3, [pc, #88]	; (8000fac <RCC_GetClocksFreq+0x80>)
 8000f54:	4b14      	ldreq	r3, [pc, #80]	; (8000fa8 <RCC_GetClocksFreq+0x7c>)
 8000f56:	f002 023f 	and.w	r2, r2, #63	; 0x3f
 8000f5a:	fbb3 f3f2 	udiv	r3, r3, r2
 8000f5e:	4a11      	ldr	r2, [pc, #68]	; (8000fa4 <RCC_GetClocksFreq+0x78>)
 8000f60:	6852      	ldr	r2, [r2, #4]
 8000f62:	f3c2 4201 	ubfx	r2, r2, #16, #2
 8000f66:	f3c1 1188 	ubfx	r1, r1, #6, #9
 8000f6a:	3201      	adds	r2, #1
 8000f6c:	434b      	muls	r3, r1
 8000f6e:	0052      	lsls	r2, r2, #1
 8000f70:	fbb3 f3f2 	udiv	r3, r3, r2
 8000f74:	490b      	ldr	r1, [pc, #44]	; (8000fa4 <RCC_GetClocksFreq+0x78>)
 8000f76:	6003      	str	r3, [r0, #0]
 8000f78:	688b      	ldr	r3, [r1, #8]
 8000f7a:	4a0d      	ldr	r2, [pc, #52]	; (8000fb0 <RCC_GetClocksFreq+0x84>)
 8000f7c:	f3c3 1303 	ubfx	r3, r3, #4, #4
 8000f80:	5cd4      	ldrb	r4, [r2, r3]
 8000f82:	6803      	ldr	r3, [r0, #0]
 8000f84:	40e3      	lsrs	r3, r4
 8000f86:	6043      	str	r3, [r0, #4]
 8000f88:	688c      	ldr	r4, [r1, #8]
 8000f8a:	f3c4 2482 	ubfx	r4, r4, #10, #3
 8000f8e:	5d14      	ldrb	r4, [r2, r4]
 8000f90:	fa23 f404 	lsr.w	r4, r3, r4
 8000f94:	6084      	str	r4, [r0, #8]
 8000f96:	6889      	ldr	r1, [r1, #8]
 8000f98:	f3c1 3142 	ubfx	r1, r1, #13, #3
 8000f9c:	5c52      	ldrb	r2, [r2, r1]
 8000f9e:	40d3      	lsrs	r3, r2
 8000fa0:	60c3      	str	r3, [r0, #12]
 8000fa2:	bd10      	pop	{r4, pc}
 8000fa4:	40023800 	.word	0x40023800
 8000fa8:	00f42400 	.word	0x00f42400
 8000fac:	007a1200 	.word	0x007a1200
 8000fb0:	20000000 	.word	0x20000000

08000fb4 <RCC_AHB1PeriphClockCmd>:
 8000fb4:	4b04      	ldr	r3, [pc, #16]	; (8000fc8 <RCC_AHB1PeriphClockCmd+0x14>)
 8000fb6:	6b1a      	ldr	r2, [r3, #48]	; 0x30
 8000fb8:	b109      	cbz	r1, 8000fbe <RCC_AHB1PeriphClockCmd+0xa>
 8000fba:	4310      	orrs	r0, r2
 8000fbc:	e001      	b.n	8000fc2 <RCC_AHB1PeriphClockCmd+0xe>
 8000fbe:	ea22 0000 	bic.w	r0, r2, r0
 8000fc2:	6318      	str	r0, [r3, #48]	; 0x30
 8000fc4:	4770      	bx	lr
 8000fc6:	bf00      	nop
 8000fc8:	40023800 	.word	0x40023800

08000fcc <RCC_APB1PeriphClockCmd>:
 8000fcc:	4b04      	ldr	r3, [pc, #16]	; (8000fe0 <RCC_APB1PeriphClockCmd+0x14>)
 8000fce:	6c1a      	ldr	r2, [r3, #64]	; 0x40
 8000fd0:	b109      	cbz	r1, 8000fd6 <RCC_APB1PeriphClockCmd+0xa>
 8000fd2:	4310      	orrs	r0, r2
 8000fd4:	e001      	b.n	8000fda <RCC_APB1PeriphClockCmd+0xe>
 8000fd6:	ea22 0000 	bic.w	r0, r2, r0
 8000fda:	6418      	str	r0, [r3, #64]	; 0x40
 8000fdc:	4770      	bx	lr
 8000fde:	bf00      	nop
 8000fe0:	40023800 	.word	0x40023800

08000fe4 <RCC_APB2PeriphClockCmd>:
 8000fe4:	4b04      	ldr	r3, [pc, #16]	; (8000ff8 <RCC_APB2PeriphClockCmd+0x14>)
 8000fe6:	6c5a      	ldr	r2, [r3, #68]	; 0x44
 8000fe8:	b109      	cbz	r1, 8000fee <RCC_APB2PeriphClockCmd+0xa>
 8000fea:	4310      	orrs	r0, r2
 8000fec:	e001      	b.n	8000ff2 <RCC_APB2PeriphClockCmd+0xe>
 8000fee:	ea22 0000 	bic.w	r0, r2, r0
 8000ff2:	6458      	str	r0, [r3, #68]	; 0x44
 8000ff4:	4770      	bx	lr
 8000ff6:	bf00      	nop
 8000ff8:	40023800 	.word	0x40023800

08000ffc <NVIC_Init>:
 8000ffc:	78c2      	ldrb	r2, [r0, #3]
 8000ffe:	7803      	ldrb	r3, [r0, #0]
 8001000:	b510      	push	{r4, lr}
 8001002:	b30a      	cbz	r2, 8001048 <NVIC_Init+0x4c>
 8001004:	4a16      	ldr	r2, [pc, #88]	; (8001060 <NVIC_Init+0x64>)
 8001006:	7844      	ldrb	r4, [r0, #1]
 8001008:	68d2      	ldr	r2, [r2, #12]
 800100a:	43d2      	mvns	r2, r2
 800100c:	f3c2 2202 	ubfx	r2, r2, #8, #3
 8001010:	f1c2 0104 	rsb	r1, r2, #4
 8001014:	b2c9      	uxtb	r1, r1
 8001016:	fa04 f101 	lsl.w	r1, r4, r1
 800101a:	240f      	movs	r4, #15
 800101c:	fa44 f202 	asr.w	r2, r4, r2
 8001020:	7884      	ldrb	r4, [r0, #2]
 8001022:	b2c9      	uxtb	r1, r1
 8001024:	4022      	ands	r2, r4
 8001026:	430a      	orrs	r2, r1
 8001028:	f103 4360 	add.w	r3, r3, #3758096384	; 0xe0000000
 800102c:	f503 4361 	add.w	r3, r3, #57600	; 0xe100
 8001030:	0112      	lsls	r2, r2, #4
 8001032:	b2d2      	uxtb	r2, r2
 8001034:	f883 2300 	strb.w	r2, [r3, #768]	; 0x300
 8001038:	7803      	ldrb	r3, [r0, #0]
 800103a:	2201      	movs	r2, #1
 800103c:	0959      	lsrs	r1, r3, #5
 800103e:	f003 031f 	and.w	r3, r3, #31
 8001042:	fa02 f303 	lsl.w	r3, r2, r3
 8001046:	e006      	b.n	8001056 <NVIC_Init+0x5a>
 8001048:	0959      	lsrs	r1, r3, #5
 800104a:	2201      	movs	r2, #1
 800104c:	f003 031f 	and.w	r3, r3, #31
 8001050:	fa02 f303 	lsl.w	r3, r2, r3
 8001054:	3120      	adds	r1, #32
 8001056:	4a03      	ldr	r2, [pc, #12]	; (8001064 <NVIC_Init+0x68>)
 8001058:	f842 3021 	str.w	r3, [r2, r1, lsl #2]
 800105c:	bd10      	pop	{r4, pc}
 800105e:	bf00      	nop
 8001060:	e000ed00 	.word	0xe000ed00
 8001064:	e000e100 	.word	0xe000e100

08001068 <i2c_delay>:
 8001068:	bf00      	nop
 800106a:	bf00      	nop
 800106c:	4770      	bx	lr
	...

08001070 <SetLowSDA>:
 8001070:	b537      	push	{r0, r1, r2, r4, r5, lr}
 8001072:	4d0d      	ldr	r5, [pc, #52]	; (80010a8 <SetLowSDA+0x38>)
 8001074:	2301      	movs	r3, #1
 8001076:	2202      	movs	r2, #2
 8001078:	f44f 4480 	mov.w	r4, #16384	; 0x4000
 800107c:	f88d 3004 	strb.w	r3, [sp, #4]
 8001080:	f88d 3006 	strb.w	r3, [sp, #6]
 8001084:	4628      	mov	r0, r5
 8001086:	2300      	movs	r3, #0
 8001088:	4669      	mov	r1, sp
 800108a:	f88d 2005 	strb.w	r2, [sp, #5]
 800108e:	f88d 3007 	strb.w	r3, [sp, #7]
 8001092:	9400      	str	r4, [sp, #0]
 8001094:	f000 fb22 	bl	80016dc <GPIO_Init>
 8001098:	4628      	mov	r0, r5
 800109a:	4621      	mov	r1, r4
 800109c:	f000 fb61 	bl	8001762 <GPIO_ResetBits>
 80010a0:	f7ff ffe2 	bl	8001068 <i2c_delay>
 80010a4:	b003      	add	sp, #12
 80010a6:	bd30      	pop	{r4, r5, pc}
 80010a8:	40020400 	.word	0x40020400

080010ac <SetHighSDA>:
 80010ac:	b537      	push	{r0, r1, r2, r4, r5, lr}
 80010ae:	4d0d      	ldr	r5, [pc, #52]	; (80010e4 <SetHighSDA+0x38>)
 80010b0:	2202      	movs	r2, #2
 80010b2:	2300      	movs	r3, #0
 80010b4:	f44f 4480 	mov.w	r4, #16384	; 0x4000
 80010b8:	f88d 2005 	strb.w	r2, [sp, #5]
 80010bc:	4628      	mov	r0, r5
 80010be:	2201      	movs	r2, #1
 80010c0:	4669      	mov	r1, sp
 80010c2:	f88d 3004 	strb.w	r3, [sp, #4]
 80010c6:	f88d 2006 	strb.w	r2, [sp, #6]
 80010ca:	f88d 3007 	strb.w	r3, [sp, #7]
 80010ce:	9400      	str	r4, [sp, #0]
 80010d0:	f000 fb04 	bl	80016dc <GPIO_Init>
 80010d4:	4628      	mov	r0, r5
 80010d6:	4621      	mov	r1, r4
 80010d8:	f000 fb41 	bl	800175e <GPIO_SetBits>
 80010dc:	f7ff ffc4 	bl	8001068 <i2c_delay>
 80010e0:	b003      	add	sp, #12
 80010e2:	bd30      	pop	{r4, r5, pc}
 80010e4:	40020400 	.word	0x40020400

080010e8 <SetLowSCL>:
 80010e8:	b508      	push	{r3, lr}
 80010ea:	4804      	ldr	r0, [pc, #16]	; (80010fc <SetLowSCL+0x14>)
 80010ec:	f44f 4100 	mov.w	r1, #32768	; 0x8000
 80010f0:	f000 fb37 	bl	8001762 <GPIO_ResetBits>
 80010f4:	e8bd 4008 	ldmia.w	sp!, {r3, lr}
 80010f8:	f7ff bfb6 	b.w	8001068 <i2c_delay>
 80010fc:	40020400 	.word	0x40020400

08001100 <SetHighSCL>:
 8001100:	b508      	push	{r3, lr}
 8001102:	4804      	ldr	r0, [pc, #16]	; (8001114 <SetHighSCL+0x14>)
 8001104:	f44f 4100 	mov.w	r1, #32768	; 0x8000
 8001108:	f000 fb29 	bl	800175e <GPIO_SetBits>
 800110c:	e8bd 4008 	ldmia.w	sp!, {r3, lr}
 8001110:	f7ff bfaa 	b.w	8001068 <i2c_delay>
 8001114:	40020400 	.word	0x40020400

08001118 <i2c_0_init>:
 8001118:	b507      	push	{r0, r1, r2, lr}
 800111a:	2002      	movs	r0, #2
 800111c:	2101      	movs	r1, #1
 800111e:	f7ff ff49 	bl	8000fb4 <RCC_AHB1PeriphClockCmd>
 8001122:	f44f 4340 	mov.w	r3, #49152	; 0xc000
 8001126:	9300      	str	r3, [sp, #0]
 8001128:	2301      	movs	r3, #1
 800112a:	2202      	movs	r2, #2
 800112c:	480a      	ldr	r0, [pc, #40]	; (8001158 <i2c_0_init+0x40>)
 800112e:	f88d 3004 	strb.w	r3, [sp, #4]
 8001132:	4669      	mov	r1, sp
 8001134:	f88d 3006 	strb.w	r3, [sp, #6]
 8001138:	2300      	movs	r3, #0
 800113a:	f88d 2005 	strb.w	r2, [sp, #5]
 800113e:	f88d 3007 	strb.w	r3, [sp, #7]
 8001142:	f000 facb 	bl	80016dc <GPIO_Init>
 8001146:	f7ff ffdb 	bl	8001100 <SetHighSCL>
 800114a:	f7ff ff91 	bl	8001070 <SetLowSDA>
 800114e:	f7ff ffad 	bl	80010ac <SetHighSDA>
 8001152:	b003      	add	sp, #12
 8001154:	f85d fb04 	ldr.w	pc, [sp], #4
 8001158:	40020400 	.word	0x40020400

0800115c <i2cStart>:
 800115c:	b508      	push	{r3, lr}
 800115e:	f7ff ffcf 	bl	8001100 <SetHighSCL>
 8001162:	f7ff ffa3 	bl	80010ac <SetHighSDA>
 8001166:	f7ff ffcb 	bl	8001100 <SetHighSCL>
 800116a:	f7ff ff81 	bl	8001070 <SetLowSDA>
 800116e:	f7ff ffbb 	bl	80010e8 <SetLowSCL>
 8001172:	e8bd 4008 	ldmia.w	sp!, {r3, lr}
 8001176:	f7ff bf99 	b.w	80010ac <SetHighSDA>

0800117a <i2cStop>:
 800117a:	b508      	push	{r3, lr}
 800117c:	f7ff ffb4 	bl	80010e8 <SetLowSCL>
 8001180:	f7ff ff76 	bl	8001070 <SetLowSDA>
 8001184:	f7ff ffbc 	bl	8001100 <SetHighSCL>
 8001188:	f7ff ff72 	bl	8001070 <SetLowSDA>
 800118c:	f7ff ffb8 	bl	8001100 <SetHighSCL>
 8001190:	e8bd 4008 	ldmia.w	sp!, {r3, lr}
 8001194:	f7ff bf8a 	b.w	80010ac <SetHighSDA>

08001198 <i2cWrite>:
 8001198:	b538      	push	{r3, r4, r5, lr}
 800119a:	4604      	mov	r4, r0
 800119c:	2508      	movs	r5, #8
 800119e:	f7ff ffa3 	bl	80010e8 <SetLowSCL>
 80011a2:	0623      	lsls	r3, r4, #24
 80011a4:	d502      	bpl.n	80011ac <i2cWrite+0x14>
 80011a6:	f7ff ff81 	bl	80010ac <SetHighSDA>
 80011aa:	e001      	b.n	80011b0 <i2cWrite+0x18>
 80011ac:	f7ff ff60 	bl	8001070 <SetLowSDA>
 80011b0:	3d01      	subs	r5, #1
 80011b2:	f7ff ffa5 	bl	8001100 <SetHighSCL>
 80011b6:	0064      	lsls	r4, r4, #1
 80011b8:	f015 05ff 	ands.w	r5, r5, #255	; 0xff
 80011bc:	b2e4      	uxtb	r4, r4
 80011be:	d1ee      	bne.n	800119e <i2cWrite+0x6>
 80011c0:	f7ff ff92 	bl	80010e8 <SetLowSCL>
 80011c4:	f7ff ff72 	bl	80010ac <SetHighSDA>
 80011c8:	f7ff ff9a 	bl	8001100 <SetHighSCL>
 80011cc:	4b05      	ldr	r3, [pc, #20]	; (80011e4 <i2cWrite+0x4c>)
 80011ce:	691c      	ldr	r4, [r3, #16]
 80011d0:	f7ff ff8a 	bl	80010e8 <SetLowSCL>
 80011d4:	f7ff ff48 	bl	8001068 <i2c_delay>
 80011d8:	f484 4080 	eor.w	r0, r4, #16384	; 0x4000
 80011dc:	f3c0 3080 	ubfx	r0, r0, #14, #1
 80011e0:	bd38      	pop	{r3, r4, r5, pc}
 80011e2:	bf00      	nop
 80011e4:	40020400 	.word	0x40020400

080011e8 <i2cRead>:
 80011e8:	b570      	push	{r4, r5, r6, lr}
 80011ea:	4606      	mov	r6, r0
 80011ec:	f7ff ff7c 	bl	80010e8 <SetLowSCL>
 80011f0:	f7ff ff5c 	bl	80010ac <SetHighSDA>
 80011f4:	2508      	movs	r5, #8
 80011f6:	2400      	movs	r4, #0
 80011f8:	f7ff ff82 	bl	8001100 <SetHighSCL>
 80011fc:	4b0d      	ldr	r3, [pc, #52]	; (8001234 <i2cRead+0x4c>)
 80011fe:	691b      	ldr	r3, [r3, #16]
 8001200:	0064      	lsls	r4, r4, #1
 8001202:	045a      	lsls	r2, r3, #17
 8001204:	b2e4      	uxtb	r4, r4
 8001206:	bf48      	it	mi
 8001208:	3401      	addmi	r4, #1
 800120a:	f105 35ff 	add.w	r5, r5, #4294967295
 800120e:	bf48      	it	mi
 8001210:	b2e4      	uxtbmi	r4, r4
 8001212:	f7ff ff69 	bl	80010e8 <SetLowSCL>
 8001216:	f015 05ff 	ands.w	r5, r5, #255	; 0xff
 800121a:	d1ed      	bne.n	80011f8 <i2cRead+0x10>
 800121c:	b10e      	cbz	r6, 8001222 <i2cRead+0x3a>
 800121e:	f7ff ff27 	bl	8001070 <SetLowSDA>
 8001222:	f7ff ff6d 	bl	8001100 <SetHighSCL>
 8001226:	f7ff ff5f 	bl	80010e8 <SetLowSCL>
 800122a:	f7ff ff1d 	bl	8001068 <i2c_delay>
 800122e:	4620      	mov	r0, r4
 8001230:	bd70      	pop	{r4, r5, r6, pc}
 8001232:	bf00      	nop
 8001234:	40020400 	.word	0x40020400

08001238 <i2c_write_reg>:
 8001238:	b570      	push	{r4, r5, r6, lr}
 800123a:	4605      	mov	r5, r0
 800123c:	460c      	mov	r4, r1
 800123e:	4616      	mov	r6, r2
 8001240:	f7ff ff8c 	bl	800115c <i2cStart>
 8001244:	4628      	mov	r0, r5
 8001246:	f7ff ffa7 	bl	8001198 <i2cWrite>
 800124a:	4620      	mov	r0, r4
 800124c:	f7ff ffa4 	bl	8001198 <i2cWrite>
 8001250:	4630      	mov	r0, r6
 8001252:	f7ff ffa1 	bl	8001198 <i2cWrite>
 8001256:	e8bd 4070 	ldmia.w	sp!, {r4, r5, r6, lr}
 800125a:	f7ff bf8e 	b.w	800117a <i2cStop>

0800125e <i2c_read_reg>:
 800125e:	b538      	push	{r3, r4, r5, lr}
 8001260:	4604      	mov	r4, r0
 8001262:	460d      	mov	r5, r1
 8001264:	f7ff ff7a 	bl	800115c <i2cStart>
 8001268:	4620      	mov	r0, r4
 800126a:	f7ff ff95 	bl	8001198 <i2cWrite>
 800126e:	4628      	mov	r0, r5
 8001270:	f7ff ff92 	bl	8001198 <i2cWrite>
 8001274:	f7ff ff72 	bl	800115c <i2cStart>
 8001278:	f044 0001 	orr.w	r0, r4, #1
 800127c:	f7ff ff8c 	bl	8001198 <i2cWrite>
 8001280:	2000      	movs	r0, #0
 8001282:	f7ff ffb1 	bl	80011e8 <i2cRead>
 8001286:	4604      	mov	r4, r0
 8001288:	f7ff ff77 	bl	800117a <i2cStop>
 800128c:	4620      	mov	r0, r4
 800128e:	bd38      	pop	{r3, r4, r5, pc}

08001290 <Default_Handler>:
 8001290:	4668      	mov	r0, sp
 8001292:	f020 0107 	bic.w	r1, r0, #7
 8001296:	468d      	mov	sp, r1
 8001298:	bf00      	nop
 800129a:	e7fd      	b.n	8001298 <Default_Handler+0x8>

0800129c <HardFault_Handler>:
 800129c:	2010      	movs	r0, #16
 800129e:	f000 f9b1 	bl	8001604 <led_on>
 80012a2:	4b06      	ldr	r3, [pc, #24]	; (80012bc <HardFault_Handler+0x20>)
 80012a4:	3b01      	subs	r3, #1
 80012a6:	d001      	beq.n	80012ac <HardFault_Handler+0x10>
 80012a8:	bf00      	nop
 80012aa:	e7fb      	b.n	80012a4 <HardFault_Handler+0x8>
 80012ac:	2010      	movs	r0, #16
 80012ae:	f000 f9b1 	bl	8001614 <led_off>
 80012b2:	4b02      	ldr	r3, [pc, #8]	; (80012bc <HardFault_Handler+0x20>)
 80012b4:	3b01      	subs	r3, #1
 80012b6:	d0f1      	beq.n	800129c <HardFault_Handler>
 80012b8:	bf00      	nop
 80012ba:	e7fb      	b.n	80012b4 <HardFault_Handler+0x18>
 80012bc:	00989681 	.word	0x00989681

080012c0 <_reset_init>:
 80012c0:	4a0e      	ldr	r2, [pc, #56]	; (80012fc <_reset_init+0x3c>)
 80012c2:	480f      	ldr	r0, [pc, #60]	; (8001300 <_reset_init+0x40>)
 80012c4:	1a80      	subs	r0, r0, r2
 80012c6:	1080      	asrs	r0, r0, #2
 80012c8:	2300      	movs	r3, #0
 80012ca:	4283      	cmp	r3, r0
 80012cc:	d006      	beq.n	80012dc <_reset_init+0x1c>
 80012ce:	490d      	ldr	r1, [pc, #52]	; (8001304 <_reset_init+0x44>)
 80012d0:	f851 1023 	ldr.w	r1, [r1, r3, lsl #2]
 80012d4:	f842 1023 	str.w	r1, [r2, r3, lsl #2]
 80012d8:	3301      	adds	r3, #1
 80012da:	e7f6      	b.n	80012ca <_reset_init+0xa>
 80012dc:	4b0a      	ldr	r3, [pc, #40]	; (8001308 <_reset_init+0x48>)
 80012de:	f8d3 2088 	ldr.w	r2, [r3, #136]	; 0x88
 80012e2:	f442 0270 	orr.w	r2, r2, #15728640	; 0xf00000
 80012e6:	f8c3 2088 	str.w	r2, [r3, #136]	; 0x88
 80012ea:	f503 730c 	add.w	r3, r3, #560	; 0x230
 80012ee:	685a      	ldr	r2, [r3, #4]
 80012f0:	f022 4240 	bic.w	r2, r2, #3221225472	; 0xc0000000
 80012f4:	605a      	str	r2, [r3, #4]
 80012f6:	f7fe bf7d 	b.w	80001f4 <main>
 80012fa:	bf00      	nop
 80012fc:	20000000 	.word	0x20000000
 8001300:	20000010 	.word	0x20000010
 8001304:	08001908 	.word	0x08001908
 8001308:	e000ed00 	.word	0xe000ed00

0800130c <SystemInit>:
 800130c:	4b3b      	ldr	r3, [pc, #236]	; (80013fc <SystemInit+0xf0>)
 800130e:	f8d3 2088 	ldr.w	r2, [r3, #136]	; 0x88
 8001312:	f442 0270 	orr.w	r2, r2, #15728640	; 0xf00000
 8001316:	f8c3 2088 	str.w	r2, [r3, #136]	; 0x88
 800131a:	f8d3 2088 	ldr.w	r2, [r3, #136]	; 0x88
 800131e:	f442 0270 	orr.w	r2, r2, #15728640	; 0xf00000
 8001322:	f8c3 2088 	str.w	r2, [r3, #136]	; 0x88
 8001326:	4b36      	ldr	r3, [pc, #216]	; (8001400 <SystemInit+0xf4>)
 8001328:	681a      	ldr	r2, [r3, #0]
 800132a:	f042 0201 	orr.w	r2, r2, #1
 800132e:	601a      	str	r2, [r3, #0]
 8001330:	2200      	movs	r2, #0
 8001332:	609a      	str	r2, [r3, #8]
 8001334:	6819      	ldr	r1, [r3, #0]
 8001336:	f021 7184 	bic.w	r1, r1, #17301504	; 0x1080000
 800133a:	f421 3180 	bic.w	r1, r1, #65536	; 0x10000
 800133e:	6019      	str	r1, [r3, #0]
 8001340:	4930      	ldr	r1, [pc, #192]	; (8001404 <SystemInit+0xf8>)
 8001342:	6059      	str	r1, [r3, #4]
 8001344:	6819      	ldr	r1, [r3, #0]
 8001346:	b082      	sub	sp, #8
 8001348:	f421 2180 	bic.w	r1, r1, #262144	; 0x40000
 800134c:	6019      	str	r1, [r3, #0]
 800134e:	60da      	str	r2, [r3, #12]
 8001350:	9200      	str	r2, [sp, #0]
 8001352:	9201      	str	r2, [sp, #4]
 8001354:	681a      	ldr	r2, [r3, #0]
 8001356:	f442 3280 	orr.w	r2, r2, #65536	; 0x10000
 800135a:	601a      	str	r2, [r3, #0]
 800135c:	4b28      	ldr	r3, [pc, #160]	; (8001400 <SystemInit+0xf4>)
 800135e:	681a      	ldr	r2, [r3, #0]
 8001360:	f402 3200 	and.w	r2, r2, #131072	; 0x20000
 8001364:	9201      	str	r2, [sp, #4]
 8001366:	9a00      	ldr	r2, [sp, #0]
 8001368:	3201      	adds	r2, #1
 800136a:	9200      	str	r2, [sp, #0]
 800136c:	9a01      	ldr	r2, [sp, #4]
 800136e:	b91a      	cbnz	r2, 8001378 <SystemInit+0x6c>
 8001370:	9a00      	ldr	r2, [sp, #0]
 8001372:	f5b2 6fa0 	cmp.w	r2, #1280	; 0x500
 8001376:	d1f1      	bne.n	800135c <SystemInit+0x50>
 8001378:	681b      	ldr	r3, [r3, #0]
 800137a:	f413 3300 	ands.w	r3, r3, #131072	; 0x20000
 800137e:	bf18      	it	ne
 8001380:	2301      	movne	r3, #1
 8001382:	9301      	str	r3, [sp, #4]
 8001384:	9b01      	ldr	r3, [sp, #4]
 8001386:	2b01      	cmp	r3, #1
 8001388:	d005      	beq.n	8001396 <SystemInit+0x8a>
 800138a:	4b1c      	ldr	r3, [pc, #112]	; (80013fc <SystemInit+0xf0>)
 800138c:	f04f 6200 	mov.w	r2, #134217728	; 0x8000000
 8001390:	609a      	str	r2, [r3, #8]
 8001392:	b002      	add	sp, #8
 8001394:	4770      	bx	lr
 8001396:	4b1a      	ldr	r3, [pc, #104]	; (8001400 <SystemInit+0xf4>)
 8001398:	6c1a      	ldr	r2, [r3, #64]	; 0x40
 800139a:	f042 5280 	orr.w	r2, r2, #268435456	; 0x10000000
 800139e:	641a      	str	r2, [r3, #64]	; 0x40
 80013a0:	4a19      	ldr	r2, [pc, #100]	; (8001408 <SystemInit+0xfc>)
 80013a2:	6811      	ldr	r1, [r2, #0]
 80013a4:	f441 4180 	orr.w	r1, r1, #16384	; 0x4000
 80013a8:	6011      	str	r1, [r2, #0]
 80013aa:	689a      	ldr	r2, [r3, #8]
 80013ac:	f042 0290 	orr.w	r2, r2, #144	; 0x90
 80013b0:	609a      	str	r2, [r3, #8]
 80013b2:	689a      	ldr	r2, [r3, #8]
 80013b4:	f442 4200 	orr.w	r2, r2, #32768	; 0x8000
 80013b8:	609a      	str	r2, [r3, #8]
 80013ba:	689a      	ldr	r2, [r3, #8]
 80013bc:	f442 52a0 	orr.w	r2, r2, #5120	; 0x1400
 80013c0:	609a      	str	r2, [r3, #8]
 80013c2:	4a12      	ldr	r2, [pc, #72]	; (800140c <SystemInit+0x100>)
 80013c4:	605a      	str	r2, [r3, #4]
 80013c6:	681a      	ldr	r2, [r3, #0]
 80013c8:	f042 7280 	orr.w	r2, r2, #16777216	; 0x1000000
 80013cc:	601a      	str	r2, [r3, #0]
 80013ce:	6819      	ldr	r1, [r3, #0]
 80013d0:	4a0b      	ldr	r2, [pc, #44]	; (8001400 <SystemInit+0xf4>)
 80013d2:	0189      	lsls	r1, r1, #6
 80013d4:	d5fb      	bpl.n	80013ce <SystemInit+0xc2>
 80013d6:	4b0e      	ldr	r3, [pc, #56]	; (8001410 <SystemInit+0x104>)
 80013d8:	f240 6105 	movw	r1, #1541	; 0x605
 80013dc:	6019      	str	r1, [r3, #0]
 80013de:	6893      	ldr	r3, [r2, #8]
 80013e0:	f023 0303 	bic.w	r3, r3, #3
 80013e4:	6093      	str	r3, [r2, #8]
 80013e6:	6893      	ldr	r3, [r2, #8]
 80013e8:	f043 0302 	orr.w	r3, r3, #2
 80013ec:	6093      	str	r3, [r2, #8]
 80013ee:	4b04      	ldr	r3, [pc, #16]	; (8001400 <SystemInit+0xf4>)
 80013f0:	689b      	ldr	r3, [r3, #8]
 80013f2:	f003 030c 	and.w	r3, r3, #12
 80013f6:	2b08      	cmp	r3, #8
 80013f8:	d1f9      	bne.n	80013ee <SystemInit+0xe2>
 80013fa:	e7c6      	b.n	800138a <SystemInit+0x7e>
 80013fc:	e000ed00 	.word	0xe000ed00
 8001400:	40023800 	.word	0x40023800
 8001404:	24003010 	.word	0x24003010
 8001408:	40007000 	.word	0x40007000
 800140c:	07405408 	.word	0x07405408
 8001410:	40023c00 	.word	0x40023c00

08001414 <sys_tick_init>:
 8001414:	4b05      	ldr	r3, [pc, #20]	; (800142c <sys_tick_init+0x18>)
 8001416:	4a06      	ldr	r2, [pc, #24]	; (8001430 <sys_tick_init+0x1c>)
 8001418:	605a      	str	r2, [r3, #4]
 800141a:	4a06      	ldr	r2, [pc, #24]	; (8001434 <sys_tick_init+0x20>)
 800141c:	21f0      	movs	r1, #240	; 0xf0
 800141e:	f882 1023 	strb.w	r1, [r2, #35]	; 0x23
 8001422:	2200      	movs	r2, #0
 8001424:	609a      	str	r2, [r3, #8]
 8001426:	2207      	movs	r2, #7
 8001428:	601a      	str	r2, [r3, #0]
 800142a:	4770      	bx	lr
 800142c:	e000e010 	.word	0xe000e010
 8001430:	00029040 	.word	0x00029040
 8001434:	e000ed00 	.word	0xe000ed00

08001438 <sleep>:
 8001438:	bf30      	wfi
 800143a:	4770      	bx	lr

0800143c <sytem_clock_init>:
 800143c:	f7ff bf66 	b.w	800130c <SystemInit>

08001440 <TIM_TimeBaseInit>:
 8001440:	4a1c      	ldr	r2, [pc, #112]	; (80014b4 <TIM_TimeBaseInit+0x74>)
 8001442:	8803      	ldrh	r3, [r0, #0]
 8001444:	4290      	cmp	r0, r2
 8001446:	b29b      	uxth	r3, r3
 8001448:	d012      	beq.n	8001470 <TIM_TimeBaseInit+0x30>
 800144a:	f502 6280 	add.w	r2, r2, #1024	; 0x400
 800144e:	4290      	cmp	r0, r2
 8001450:	d00e      	beq.n	8001470 <TIM_TimeBaseInit+0x30>
 8001452:	f1b0 4f80 	cmp.w	r0, #1073741824	; 0x40000000
 8001456:	d00b      	beq.n	8001470 <TIM_TimeBaseInit+0x30>
 8001458:	f5a2 3280 	sub.w	r2, r2, #65536	; 0x10000
 800145c:	4290      	cmp	r0, r2
 800145e:	d007      	beq.n	8001470 <TIM_TimeBaseInit+0x30>
 8001460:	f502 6280 	add.w	r2, r2, #1024	; 0x400
 8001464:	4290      	cmp	r0, r2
 8001466:	d003      	beq.n	8001470 <TIM_TimeBaseInit+0x30>
 8001468:	f502 6280 	add.w	r2, r2, #1024	; 0x400
 800146c:	4290      	cmp	r0, r2
 800146e:	d103      	bne.n	8001478 <TIM_TimeBaseInit+0x38>
 8001470:	884a      	ldrh	r2, [r1, #2]
 8001472:	f023 0370 	bic.w	r3, r3, #112	; 0x70
 8001476:	4313      	orrs	r3, r2
 8001478:	4a0f      	ldr	r2, [pc, #60]	; (80014b8 <TIM_TimeBaseInit+0x78>)
 800147a:	4290      	cmp	r0, r2
 800147c:	d008      	beq.n	8001490 <TIM_TimeBaseInit+0x50>
 800147e:	f502 6280 	add.w	r2, r2, #1024	; 0x400
 8001482:	4290      	cmp	r0, r2
 8001484:	d004      	beq.n	8001490 <TIM_TimeBaseInit+0x50>
 8001486:	f423 7340 	bic.w	r3, r3, #768	; 0x300
 800148a:	890a      	ldrh	r2, [r1, #8]
 800148c:	b29b      	uxth	r3, r3
 800148e:	4313      	orrs	r3, r2
 8001490:	8003      	strh	r3, [r0, #0]
 8001492:	684b      	ldr	r3, [r1, #4]
 8001494:	62c3      	str	r3, [r0, #44]	; 0x2c
 8001496:	880b      	ldrh	r3, [r1, #0]
 8001498:	8503      	strh	r3, [r0, #40]	; 0x28
 800149a:	4b06      	ldr	r3, [pc, #24]	; (80014b4 <TIM_TimeBaseInit+0x74>)
 800149c:	4298      	cmp	r0, r3
 800149e:	d003      	beq.n	80014a8 <TIM_TimeBaseInit+0x68>
 80014a0:	f503 6380 	add.w	r3, r3, #1024	; 0x400
 80014a4:	4298      	cmp	r0, r3
 80014a6:	d101      	bne.n	80014ac <TIM_TimeBaseInit+0x6c>
 80014a8:	7a8b      	ldrb	r3, [r1, #10]
 80014aa:	8603      	strh	r3, [r0, #48]	; 0x30
 80014ac:	2301      	movs	r3, #1
 80014ae:	8283      	strh	r3, [r0, #20]
 80014b0:	4770      	bx	lr
 80014b2:	bf00      	nop
 80014b4:	40010000 	.word	0x40010000
 80014b8:	40001000 	.word	0x40001000

080014bc <TIM_Cmd>:
 80014bc:	8803      	ldrh	r3, [r0, #0]
 80014be:	b119      	cbz	r1, 80014c8 <TIM_Cmd+0xc>
 80014c0:	b29b      	uxth	r3, r3
 80014c2:	f043 0301 	orr.w	r3, r3, #1
 80014c6:	e003      	b.n	80014d0 <TIM_Cmd+0x14>
 80014c8:	f023 0301 	bic.w	r3, r3, #1
 80014cc:	041b      	lsls	r3, r3, #16
 80014ce:	0c1b      	lsrs	r3, r3, #16
 80014d0:	8003      	strh	r3, [r0, #0]
 80014d2:	4770      	bx	lr

080014d4 <TIM_ClearITPendingBit>:
 80014d4:	43c9      	mvns	r1, r1
 80014d6:	b289      	uxth	r1, r1
 80014d8:	8201      	strh	r1, [r0, #16]
 80014da:	4770      	bx	lr

080014dc <timer_init>:
 80014dc:	b530      	push	{r4, r5, lr}
 80014de:	2000      	movs	r0, #0
 80014e0:	b085      	sub	sp, #20
 80014e2:	4a1e      	ldr	r2, [pc, #120]	; (800155c <timer_init+0x80>)
 80014e4:	f44f 6380 	mov.w	r3, #1024	; 0x400
 80014e8:	f822 3010 	strh.w	r3, [r2, r0, lsl #1]
 80014ec:	4a1c      	ldr	r2, [pc, #112]	; (8001560 <timer_init+0x84>)
 80014ee:	f822 3010 	strh.w	r3, [r2, r0, lsl #1]
 80014f2:	4b1c      	ldr	r3, [pc, #112]	; (8001564 <timer_init+0x88>)
 80014f4:	2400      	movs	r4, #0
 80014f6:	f823 4010 	strh.w	r4, [r3, r0, lsl #1]
 80014fa:	3001      	adds	r0, #1
 80014fc:	2804      	cmp	r0, #4
 80014fe:	4625      	mov	r5, r4
 8001500:	d1ef      	bne.n	80014e2 <timer_init+0x6>
 8001502:	4b19      	ldr	r3, [pc, #100]	; (8001568 <timer_init+0x8c>)
 8001504:	2101      	movs	r1, #1
 8001506:	601c      	str	r4, [r3, #0]
 8001508:	f7ff fd60 	bl	8000fcc <RCC_APB1PeriphClockCmd>
 800150c:	f8ad 4006 	strh.w	r4, [sp, #6]
 8001510:	f8ad 400c 	strh.w	r4, [sp, #12]
 8001514:	f88d 400e 	strb.w	r4, [sp, #14]
 8001518:	4c14      	ldr	r4, [pc, #80]	; (800156c <timer_init+0x90>)
 800151a:	2353      	movs	r3, #83	; 0x53
 800151c:	f8ad 3004 	strh.w	r3, [sp, #4]
 8001520:	4620      	mov	r0, r4
 8001522:	2331      	movs	r3, #49	; 0x31
 8001524:	a901      	add	r1, sp, #4
 8001526:	9302      	str	r3, [sp, #8]
 8001528:	f7ff ff8a 	bl	8001440 <TIM_TimeBaseInit>
 800152c:	4620      	mov	r0, r4
 800152e:	2101      	movs	r1, #1
 8001530:	f7ff ffc4 	bl	80014bc <TIM_Cmd>
 8001534:	89a3      	ldrh	r3, [r4, #12]
 8001536:	b29b      	uxth	r3, r3
 8001538:	f043 0301 	orr.w	r3, r3, #1
 800153c:	81a3      	strh	r3, [r4, #12]
 800153e:	231e      	movs	r3, #30
 8001540:	f88d 3000 	strb.w	r3, [sp]
 8001544:	4668      	mov	r0, sp
 8001546:	2301      	movs	r3, #1
 8001548:	f88d 5001 	strb.w	r5, [sp, #1]
 800154c:	f88d 3002 	strb.w	r3, [sp, #2]
 8001550:	f88d 3003 	strb.w	r3, [sp, #3]
 8001554:	f7ff fd52 	bl	8000ffc <NVIC_Init>
 8001558:	b005      	add	sp, #20
 800155a:	bd30      	pop	{r4, r5, pc}
 800155c:	20000638 	.word	0x20000638
 8001560:	2000062c 	.word	0x2000062c
 8001564:	20000624 	.word	0x20000624
 8001568:	20000634 	.word	0x20000634
 800156c:	40000800 	.word	0x40000800

08001570 <TIM4_IRQHandler>:
 8001570:	2300      	movs	r3, #0
 8001572:	4a10      	ldr	r2, [pc, #64]	; (80015b4 <TIM4_IRQHandler+0x44>)
 8001574:	f832 1013 	ldrh.w	r1, [r2, r3, lsl #1]
 8001578:	b289      	uxth	r1, r1
 800157a:	b129      	cbz	r1, 8001588 <TIM4_IRQHandler+0x18>
 800157c:	f832 1013 	ldrh.w	r1, [r2, r3, lsl #1]
 8001580:	b289      	uxth	r1, r1
 8001582:	3901      	subs	r1, #1
 8001584:	b289      	uxth	r1, r1
 8001586:	e007      	b.n	8001598 <TIM4_IRQHandler+0x28>
 8001588:	490b      	ldr	r1, [pc, #44]	; (80015b8 <TIM4_IRQHandler+0x48>)
 800158a:	f831 1013 	ldrh.w	r1, [r1, r3, lsl #1]
 800158e:	b289      	uxth	r1, r1
 8001590:	f822 1013 	strh.w	r1, [r2, r3, lsl #1]
 8001594:	4a09      	ldr	r2, [pc, #36]	; (80015bc <TIM4_IRQHandler+0x4c>)
 8001596:	2101      	movs	r1, #1
 8001598:	f822 1013 	strh.w	r1, [r2, r3, lsl #1]
 800159c:	3301      	adds	r3, #1
 800159e:	2b04      	cmp	r3, #4
 80015a0:	d1e7      	bne.n	8001572 <TIM4_IRQHandler+0x2>
 80015a2:	4b07      	ldr	r3, [pc, #28]	; (80015c0 <TIM4_IRQHandler+0x50>)
 80015a4:	4807      	ldr	r0, [pc, #28]	; (80015c4 <TIM4_IRQHandler+0x54>)
 80015a6:	681a      	ldr	r2, [r3, #0]
 80015a8:	2101      	movs	r1, #1
 80015aa:	3201      	adds	r2, #1
 80015ac:	601a      	str	r2, [r3, #0]
 80015ae:	f7ff bf91 	b.w	80014d4 <TIM_ClearITPendingBit>
 80015b2:	bf00      	nop
 80015b4:	20000638 	.word	0x20000638
 80015b8:	2000062c 	.word	0x2000062c
 80015bc:	20000624 	.word	0x20000624
 80015c0:	20000634 	.word	0x20000634
 80015c4:	40000800 	.word	0x40000800

080015c8 <timer_get_time>:
 80015c8:	b082      	sub	sp, #8
 80015ca:	b672      	cpsid	i
 80015cc:	4b04      	ldr	r3, [pc, #16]	; (80015e0 <timer_get_time+0x18>)
 80015ce:	681b      	ldr	r3, [r3, #0]
 80015d0:	9301      	str	r3, [sp, #4]
 80015d2:	b662      	cpsie	i
 80015d4:	9801      	ldr	r0, [sp, #4]
 80015d6:	230a      	movs	r3, #10
 80015d8:	fbb0 f0f3 	udiv	r0, r0, r3
 80015dc:	b002      	add	sp, #8
 80015de:	4770      	bx	lr
 80015e0:	20000634 	.word	0x20000634

080015e4 <timer_delay_ms>:
 80015e4:	b513      	push	{r0, r1, r4, lr}
 80015e6:	4604      	mov	r4, r0
 80015e8:	f7ff ffee 	bl	80015c8 <timer_get_time>
 80015ec:	4420      	add	r0, r4
 80015ee:	9001      	str	r0, [sp, #4]
 80015f0:	9c01      	ldr	r4, [sp, #4]
 80015f2:	f7ff ffe9 	bl	80015c8 <timer_get_time>
 80015f6:	4284      	cmp	r4, r0
 80015f8:	d902      	bls.n	8001600 <timer_delay_ms+0x1c>
 80015fa:	f7ff ff1d 	bl	8001438 <sleep>
 80015fe:	e7f7      	b.n	80015f0 <timer_delay_ms+0xc>
 8001600:	b002      	add	sp, #8
 8001602:	bd10      	pop	{r4, pc}

08001604 <led_on>:
 8001604:	b672      	cpsid	i
 8001606:	4b02      	ldr	r3, [pc, #8]	; (8001610 <led_on+0xc>)
 8001608:	b280      	uxth	r0, r0
 800160a:	8318      	strh	r0, [r3, #24]
 800160c:	b662      	cpsie	i
 800160e:	4770      	bx	lr
 8001610:	40020400 	.word	0x40020400

08001614 <led_off>:
 8001614:	b672      	cpsid	i
 8001616:	4b02      	ldr	r3, [pc, #8]	; (8001620 <led_off+0xc>)
 8001618:	b280      	uxth	r0, r0
 800161a:	8358      	strh	r0, [r3, #26]
 800161c:	b662      	cpsie	i
 800161e:	4770      	bx	lr
 8001620:	40020400 	.word	0x40020400

08001624 <gpio_init>:
 8001624:	b5f7      	push	{r0, r1, r2, r4, r5, r6, r7, lr}
 8001626:	2001      	movs	r0, #1
 8001628:	4601      	mov	r1, r0
 800162a:	f7ff fcc3 	bl	8000fb4 <RCC_AHB1PeriphClockCmd>
 800162e:	2002      	movs	r0, #2
 8001630:	2101      	movs	r1, #1
 8001632:	f7ff fcbf 	bl	8000fb4 <RCC_AHB1PeriphClockCmd>
 8001636:	2004      	movs	r0, #4
 8001638:	2101      	movs	r1, #1
 800163a:	f7ff fcbb 	bl	8000fb4 <RCC_AHB1PeriphClockCmd>
 800163e:	2008      	movs	r0, #8
 8001640:	2101      	movs	r1, #1
 8001642:	f7ff fcb7 	bl	8000fb4 <RCC_AHB1PeriphClockCmd>
 8001646:	2008      	movs	r0, #8
 8001648:	2101      	movs	r1, #1
 800164a:	f7ff fcb3 	bl	8000fb4 <RCC_AHB1PeriphClockCmd>
 800164e:	2010      	movs	r0, #16
 8001650:	2101      	movs	r1, #1
 8001652:	f7ff fcaf 	bl	8000fb4 <RCC_AHB1PeriphClockCmd>
 8001656:	2020      	movs	r0, #32
 8001658:	2101      	movs	r1, #1
 800165a:	f7ff fcab 	bl	8000fb4 <RCC_AHB1PeriphClockCmd>
 800165e:	2400      	movs	r4, #0
 8001660:	2601      	movs	r6, #1
 8001662:	2370      	movs	r3, #112	; 0x70
 8001664:	2703      	movs	r7, #3
 8001666:	4669      	mov	r1, sp
 8001668:	4819      	ldr	r0, [pc, #100]	; (80016d0 <gpio_init+0xac>)
 800166a:	9300      	str	r3, [sp, #0]
 800166c:	f88d 4006 	strb.w	r4, [sp, #6]
 8001670:	f88d 4007 	strb.w	r4, [sp, #7]
 8001674:	f88d 6004 	strb.w	r6, [sp, #4]
 8001678:	f88d 7005 	strb.w	r7, [sp, #5]
 800167c:	f000 f82e 	bl	80016dc <GPIO_Init>
 8001680:	2302      	movs	r3, #2
 8001682:	4669      	mov	r1, sp
 8001684:	4813      	ldr	r0, [pc, #76]	; (80016d4 <gpio_init+0xb0>)
 8001686:	f88d 3005 	strb.w	r3, [sp, #5]
 800168a:	f88d 4004 	strb.w	r4, [sp, #4]
 800168e:	9600      	str	r6, [sp, #0]
 8001690:	f000 f824 	bl	80016dc <GPIO_Init>
 8001694:	f88d 4006 	strb.w	r4, [sp, #6]
 8001698:	f88d 4007 	strb.w	r4, [sp, #7]
 800169c:	4c0e      	ldr	r4, [pc, #56]	; (80016d8 <gpio_init+0xb4>)
 800169e:	f88d 6004 	strb.w	r6, [sp, #4]
 80016a2:	2520      	movs	r5, #32
 80016a4:	4620      	mov	r0, r4
 80016a6:	4669      	mov	r1, sp
 80016a8:	9500      	str	r5, [sp, #0]
 80016aa:	f88d 7005 	strb.w	r7, [sp, #5]
 80016ae:	f000 f815 	bl	80016dc <GPIO_Init>
 80016b2:	4629      	mov	r1, r5
 80016b4:	4620      	mov	r0, r4
 80016b6:	f000 f852 	bl	800175e <GPIO_SetBits>
 80016ba:	2010      	movs	r0, #16
 80016bc:	f7ff ffaa 	bl	8001614 <led_off>
 80016c0:	4628      	mov	r0, r5
 80016c2:	f7ff ffa7 	bl	8001614 <led_off>
 80016c6:	2040      	movs	r0, #64	; 0x40
 80016c8:	f7ff ffa4 	bl	8001614 <led_off>
 80016cc:	b003      	add	sp, #12
 80016ce:	bdf0      	pop	{r4, r5, r6, r7, pc}
 80016d0:	40020400 	.word	0x40020400
 80016d4:	40020000 	.word	0x40020000
 80016d8:	40020800 	.word	0x40020800

080016dc <GPIO_Init>:
 80016dc:	e92d 41f0 	stmdb	sp!, {r4, r5, r6, r7, r8, lr}
 80016e0:	680f      	ldr	r7, [r1, #0]
 80016e2:	2300      	movs	r3, #0
 80016e4:	2201      	movs	r2, #1
 80016e6:	409a      	lsls	r2, r3
 80016e8:	ea02 0507 	and.w	r5, r2, r7
 80016ec:	4295      	cmp	r5, r2
 80016ee:	d131      	bne.n	8001754 <GPIO_Init+0x78>
 80016f0:	005a      	lsls	r2, r3, #1
 80016f2:	2403      	movs	r4, #3
 80016f4:	6806      	ldr	r6, [r0, #0]
 80016f6:	4094      	lsls	r4, r2
 80016f8:	43e4      	mvns	r4, r4
 80016fa:	4026      	ands	r6, r4
 80016fc:	6006      	str	r6, [r0, #0]
 80016fe:	790e      	ldrb	r6, [r1, #4]
 8001700:	f8d0 c000 	ldr.w	ip, [r0]
 8001704:	fa06 f802 	lsl.w	r8, r6, r2
 8001708:	3e01      	subs	r6, #1
 800170a:	b2f6      	uxtb	r6, r6
 800170c:	ea48 0c0c 	orr.w	ip, r8, ip
 8001710:	2e01      	cmp	r6, #1
 8001712:	f8c0 c000 	str.w	ip, [r0]
 8001716:	d814      	bhi.n	8001742 <GPIO_Init+0x66>
 8001718:	6886      	ldr	r6, [r0, #8]
 800171a:	f891 c005 	ldrb.w	ip, [r1, #5]
 800171e:	4026      	ands	r6, r4
 8001720:	6086      	str	r6, [r0, #8]
 8001722:	6886      	ldr	r6, [r0, #8]
 8001724:	fa0c fc02 	lsl.w	ip, ip, r2
 8001728:	ea4c 0606 	orr.w	r6, ip, r6
 800172c:	6086      	str	r6, [r0, #8]
 800172e:	6846      	ldr	r6, [r0, #4]
 8001730:	ea26 0505 	bic.w	r5, r6, r5
 8001734:	6045      	str	r5, [r0, #4]
 8001736:	798d      	ldrb	r5, [r1, #6]
 8001738:	6846      	ldr	r6, [r0, #4]
 800173a:	409d      	lsls	r5, r3
 800173c:	b2ad      	uxth	r5, r5
 800173e:	4335      	orrs	r5, r6
 8001740:	6045      	str	r5, [r0, #4]
 8001742:	68c5      	ldr	r5, [r0, #12]
 8001744:	402c      	ands	r4, r5
 8001746:	60c4      	str	r4, [r0, #12]
 8001748:	79cd      	ldrb	r5, [r1, #7]
 800174a:	68c4      	ldr	r4, [r0, #12]
 800174c:	fa05 f202 	lsl.w	r2, r5, r2
 8001750:	4322      	orrs	r2, r4
 8001752:	60c2      	str	r2, [r0, #12]
 8001754:	3301      	adds	r3, #1
 8001756:	2b10      	cmp	r3, #16
 8001758:	d1c4      	bne.n	80016e4 <GPIO_Init+0x8>
 800175a:	e8bd 81f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, pc}

0800175e <GPIO_SetBits>:
 800175e:	8301      	strh	r1, [r0, #24]
 8001760:	4770      	bx	lr

08001762 <GPIO_ResetBits>:
 8001762:	8341      	strh	r1, [r0, #26]
 8001764:	4770      	bx	lr

08001766 <GPIO_PinAFConfig>:
 8001766:	f001 0307 	and.w	r3, r1, #7
 800176a:	08c9      	lsrs	r1, r1, #3
 800176c:	eb00 0081 	add.w	r0, r0, r1, lsl #2
 8001770:	b510      	push	{r4, lr}
 8001772:	009b      	lsls	r3, r3, #2
 8001774:	6a04      	ldr	r4, [r0, #32]
 8001776:	210f      	movs	r1, #15
 8001778:	4099      	lsls	r1, r3
 800177a:	ea24 0101 	bic.w	r1, r4, r1
 800177e:	6201      	str	r1, [r0, #32]
 8001780:	6a01      	ldr	r1, [r0, #32]
 8001782:	409a      	lsls	r2, r3
 8001784:	4311      	orrs	r1, r2
 8001786:	6201      	str	r1, [r0, #32]
 8001788:	bd10      	pop	{r4, pc}

0800178a <_text>:
	...

0800178c <_init>:
 800178c:	e1a0c00d 	mov	ip, sp
 8001790:	e92ddff8 	push	{r3, r4, r5, r6, r7, r8, r9, sl, fp, ip, lr, pc}
 8001794:	e24cb004 	sub	fp, ip, #4
 8001798:	e24bd028 	sub	sp, fp, #40	; 0x28
 800179c:	e89d6ff0 	ldm	sp, {r4, r5, r6, r7, r8, r9, sl, fp, sp, lr}
 80017a0:	e12fff1e 	bx	lr

080017a4 <_fini>:
 80017a4:	e1a0c00d 	mov	ip, sp
 80017a8:	e92ddff8 	push	{r3, r4, r5, r6, r7, r8, r9, sl, fp, ip, lr, pc}
 80017ac:	e24cb004 	sub	fp, ip, #4
 80017b0:	e24bd028 	sub	sp, fp, #40	; 0x28
 80017b4:	e89d6ff0 	ldm	sp, {r4, r5, r6, r7, r8, r9, sl, fp, sp, lr}
 80017b8:	e12fff1e 	bx	lr
 80017bc:	746f6f62 	.word	0x746f6f62
 80017c0:	20676e69 	.word	0x20676e69
 80017c4:	6d6f7266 	.word	0x6d6f7266
 80017c8:	0a752520 	.word	0x0a752520
 80017cc:	6d617200 	.word	0x6d617200
 80017d0:	61747320 	.word	0x61747320
 80017d4:	25207472 	.word	0x25207472
 80017d8:	000a2075 	.word	0x000a2075
 80017dc:	206d6172 	.word	0x206d6172
 80017e0:	657a6973 	.word	0x657a6973
 80017e4:	20752520 	.word	0x20752520
 80017e8:	6172000a 	.word	0x6172000a
 80017ec:	7266206d 	.word	0x7266206d
 80017f0:	25206565 	.word	0x25206565
 80017f4:	000a2075 	.word	0x000a2075
 80017f8:	70616568 	.word	0x70616568
 80017fc:	61747320 	.word	0x61747320
 8001800:	25207472 	.word	0x25207472
 8001804:	000a2075 	.word	0x000a2075
 8001808:	0a0a      	.short	0x0a0a
 800180a:	00          	.byte	0x00
 800180b:	73          	.byte	0x73
 800180c:	6f696474 	.word	0x6f696474
 8001810:	696e6920 	.word	0x696e6920
 8001814:	6f642074 	.word	0x6f642074
 8001818:	000a656e 	.word	0x000a656e
 800181c:	25207525 	.word	0x25207525
 8001820:	69252069 	.word	0x69252069
 8001824:	5b00203a 	.word	0x5b00203a
 8001828:	20692520 	.word	0x20692520
 800182c:	25206925 	.word	0x25206925
 8001830:	205d2069 	.word	0x205d2069
 8001834:	25203e00 	.word	0x25203e00
 8001838:	3e3e2069 	.word	0x3e3e2069
 800183c:	69253e3e 	.word	0x69253e3e
 8001840:	3c20      	.short	0x3c20
 8001842:	00          	.byte	0x00
 8001843:	61          	.byte	0x61
 8001844:	68746f6e 	.word	0x68746f6e
 8001848:	63207265 	.word	0x63207265
 800184c:	646c6968 	.word	0x646c6968
 8001850:	72687420 	.word	0x72687420
 8001854:	2c646165 	.word	0x2c646165
 8001858:	73657220 	.word	0x73657220
 800185c:	0a752520 	.word	0x0a752520
 8001860:	72687400 	.word	0x72687400
 8001864:	20646165 	.word	0x20646165
 8001868:	63000a31 	.word	0x63000a31
 800186c:	74616572 	.word	0x74616572
 8001870:	20676e69 	.word	0x20676e69
 8001874:	6c696863 	.word	0x6c696863
 8001878:	68742064 	.word	0x68742064
 800187c:	64616572 	.word	0x64616572
 8001880:	6874000a 	.word	0x6874000a
 8001884:	64616572 	.word	0x64616572
 8001888:	65726320 	.word	0x65726320
 800188c:	6e697461 	.word	0x6e697461
 8001890:	72652067 	.word	0x72652067
 8001894:	0a726f72 	.word	0x0a726f72
 8001898:	69617700 	.word	0x69617700
 800189c:	676e6974 	.word	0x676e6974
 80018a0:	726f6620 	.word	0x726f6620
 80018a4:	72687420 	.word	0x72687420
 80018a8:	20646165 	.word	0x20646165
 80018ac:	64207525 	.word	0x64207525
 80018b0:	0a656e6f 	.word	0x0a656e6f
 80018b4:	72657000 	.word	0x72657000
 80018b8:	69646f69 	.word	0x69646f69
 80018bc:	68742063 	.word	0x68742063
 80018c0:	64616572 	.word	0x64616572
 80018c4:	770a000a 	.word	0x770a000a
 80018c8:	6f636c65 	.word	0x6f636c65
 80018cc:	7420656d 	.word	0x7420656d
 80018d0:	7553206f 	.word	0x7553206f
 80018d4:	6168757a 	.word	0x6168757a
 80018d8:	5e20534f 	.word	0x5e20534f
 80018dc:	32205e5f 	.word	0x32205e5f
 80018e0:	302e322e 	.word	0x302e322e
 80018e4:	4955420a 	.word	0x4955420a
 80018e8:	5320444c 	.word	0x5320444c
 80018ec:	32207065 	.word	0x32207065
 80018f0:	30322030 	.word	0x30322030
 80018f4:	31203531 	.word	0x31203531
 80018f8:	33313a30 	.word	0x33313a30
 80018fc:	0a36353a 	.word	0x0a36353a
 8001900:	00000000 	.word	0x00000000

08001904 <__EH_FRAME_BEGIN__>:
 8001904:	00000000                                ....
