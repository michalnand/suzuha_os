
bin/main.elf:     file format elf32-littlearm


Disassembly of section .text:

080000c8 <_ZdlPv>:
 80000c8:	b508      	push	{r3, lr}
 80000ca:	f000 fa71 	bl	80005b0 <free_safe>
 80000ce:	bd08      	pop	{r3, pc}

080000d0 <_ZN7CParent7processEj>:
 80000d0:	b508      	push	{r3, lr}
 80000d2:	4802      	ldr	r0, [pc, #8]	; (80000dc <_ZN7CParent7processEj+0xc>)
 80000d4:	f000 f9f2 	bl	80004bc <printf_>
 80000d8:	bd08      	pop	{r3, pc}
 80000da:	46c0      	nop			; (mov r8, r8)
 80000dc:	0800278c 	.word	0x0800278c

080000e0 <_ZN13CTestingClass7processEj>:
 80000e0:	b538      	push	{r3, r4, r5, lr}
 80000e2:	1c0d      	adds	r5, r1, #0
 80000e4:	2400      	movs	r4, #0
 80000e6:	42ac      	cmp	r4, r5
 80000e8:	d011      	beq.n	800010e <_ZN13CTestingClass7processEj+0x2e>
 80000ea:	2008      	movs	r0, #8
 80000ec:	f001 f8bc 	bl	8001268 <led_on>
 80000f0:	1c21      	adds	r1, r4, #0
 80000f2:	4807      	ldr	r0, [pc, #28]	; (8000110 <_ZN13CTestingClass7processEj+0x30>)
 80000f4:	f000 f9e2 	bl	80004bc <printf_>
 80000f8:	200a      	movs	r0, #10
 80000fa:	f000 fbbb 	bl	8000874 <timer_delay_ms>
 80000fe:	2008      	movs	r0, #8
 8000100:	f001 f8c6 	bl	8001290 <led_off>
 8000104:	2064      	movs	r0, #100	; 0x64
 8000106:	f000 fbb5 	bl	8000874 <timer_delay_ms>
 800010a:	3401      	adds	r4, #1
 800010c:	e7eb      	b.n	80000e6 <_ZN13CTestingClass7processEj+0x6>
 800010e:	bd38      	pop	{r3, r4, r5, pc}
 8000110:	080027a3 	.word	0x080027a3

08000114 <_ZN13CTestingClassC1Ev>:
 8000114:	4b07      	ldr	r3, [pc, #28]	; (8000134 <_ZN13CTestingClassC1Ev+0x20>)
 8000116:	b510      	push	{r4, lr}
 8000118:	1c04      	adds	r4, r0, #0
 800011a:	6003      	str	r3, [r0, #0]
 800011c:	4806      	ldr	r0, [pc, #24]	; (8000138 <_ZN13CTestingClassC1Ev+0x24>)
 800011e:	f000 f9cd 	bl	80004bc <printf_>
 8000122:	4b06      	ldr	r3, [pc, #24]	; (800013c <_ZN13CTestingClassC1Ev+0x28>)
 8000124:	4806      	ldr	r0, [pc, #24]	; (8000140 <_ZN13CTestingClassC1Ev+0x2c>)
 8000126:	3308      	adds	r3, #8
 8000128:	6023      	str	r3, [r4, #0]
 800012a:	f000 f9c7 	bl	80004bc <printf_>
 800012e:	1c20      	adds	r0, r4, #0
 8000130:	bd10      	pop	{r4, pc}
 8000132:	46c0      	nop			; (mov r8, r8)
 8000134:	08002778 	.word	0x08002778
 8000138:	080027b5 	.word	0x080027b5
 800013c:	080027e0 	.word	0x080027e0
 8000140:	080027c9 	.word	0x080027c9

08000144 <object_test_call>:
 8000144:	b507      	push	{r0, r1, r2, lr}
 8000146:	a801      	add	r0, sp, #4
 8000148:	f7ff ffe4 	bl	8000114 <_ZN13CTestingClassC1Ev>
 800014c:	a801      	add	r0, sp, #4
 800014e:	210a      	movs	r1, #10
 8000150:	f7ff ffc6 	bl	80000e0 <_ZN13CTestingClass7processEj>
 8000154:	bd07      	pop	{r0, r1, r2, pc}
	...

08000158 <thread_ending>:
 8000158:	b672      	cpsid	i
 800015a:	4b05      	ldr	r3, [pc, #20]	; (8000170 <thread_ending+0x18>)
 800015c:	220c      	movs	r2, #12
 800015e:	681b      	ldr	r3, [r3, #0]
 8000160:	4353      	muls	r3, r2
 8000162:	4a04      	ldr	r2, [pc, #16]	; (8000174 <thread_ending+0x1c>)
 8000164:	18d3      	adds	r3, r2, r3
 8000166:	2200      	movs	r2, #0
 8000168:	605a      	str	r2, [r3, #4]
 800016a:	b662      	cpsie	i
 800016c:	46c0      	nop			; (mov r8, r8)
 800016e:	e7fd      	b.n	800016c <thread_ending+0x14>
 8000170:	2000049c 	.word	0x2000049c
 8000174:	2000043c 	.word	0x2000043c

08000178 <null_thread>:
 8000178:	b508      	push	{r3, lr}
 800017a:	f000 fc81 	bl	8000a80 <sleep>
 800017e:	e7fc      	b.n	800017a <null_thread+0x2>

08000180 <scheduler>:
 8000180:	b5f0      	push	{r4, r5, r6, r7, lr}
 8000182:	2100      	movs	r1, #0
 8000184:	1c0a      	adds	r2, r1, #0
 8000186:	200c      	movs	r0, #12
 8000188:	1c05      	adds	r5, r0, #0
 800018a:	4355      	muls	r5, r2
 800018c:	4b14      	ldr	r3, [pc, #80]	; (80001e0 <scheduler+0x60>)
 800018e:	195e      	adds	r6, r3, r5
 8000190:	6874      	ldr	r4, [r6, #4]
 8000192:	46a4      	mov	ip, r4
 8000194:	4667      	mov	r7, ip
 8000196:	1c1c      	adds	r4, r3, #0
 8000198:	07bf      	lsls	r7, r7, #30
 800019a:	d40a      	bmi.n	80001b2 <scheduler+0x32>
 800019c:	6876      	ldr	r6, [r6, #4]
 800019e:	07f7      	lsls	r7, r6, #31
 80001a0:	d507      	bpl.n	80001b2 <scheduler+0x32>
 80001a2:	4348      	muls	r0, r1
 80001a4:	595d      	ldr	r5, [r3, r5]
 80001a6:	5818      	ldr	r0, [r3, r0]
 80001a8:	b2ad      	uxth	r5, r5
 80001aa:	b280      	uxth	r0, r0
 80001ac:	4285      	cmp	r5, r0
 80001ae:	d200      	bcs.n	80001b2 <scheduler+0x32>
 80001b0:	1c11      	adds	r1, r2, #0
 80001b2:	200c      	movs	r0, #12
 80001b4:	4350      	muls	r0, r2
 80001b6:	581d      	ldr	r5, [r3, r0]
 80001b8:	b2ad      	uxth	r5, r5
 80001ba:	2d00      	cmp	r5, #0
 80001bc:	d004      	beq.n	80001c8 <scheduler+0x48>
 80001be:	581d      	ldr	r5, [r3, r0]
 80001c0:	b2ad      	uxth	r5, r5
 80001c2:	3d01      	subs	r5, #1
 80001c4:	b2ad      	uxth	r5, r5
 80001c6:	521d      	strh	r5, [r3, r0]
 80001c8:	3201      	adds	r2, #1
 80001ca:	2a08      	cmp	r2, #8
 80001cc:	d1db      	bne.n	8000186 <scheduler+0x6>
 80001ce:	230c      	movs	r3, #12
 80001d0:	434b      	muls	r3, r1
 80001d2:	58e2      	ldr	r2, [r4, r3]
 80001d4:	0c12      	lsrs	r2, r2, #16
 80001d6:	52e2      	strh	r2, [r4, r3]
 80001d8:	4b02      	ldr	r3, [pc, #8]	; (80001e4 <scheduler+0x64>)
 80001da:	6019      	str	r1, [r3, #0]
 80001dc:	bdf0      	pop	{r4, r5, r6, r7, pc}
 80001de:	46c0      	nop			; (mov r8, r8)
 80001e0:	2000043c 	.word	0x2000043c
 80001e4:	2000049c 	.word	0x2000049c

080001e8 <SysTick_Handler>:
 80001e8:	b4f0      	push	{r4, r5, r6, r7}
 80001ea:	4644      	mov	r4, r8
 80001ec:	464d      	mov	r5, r9
 80001ee:	4656      	mov	r6, sl
 80001f0:	465f      	mov	r7, fp
 80001f2:	b4f0      	push	{r4, r5, r6, r7}
 80001f4:	f3ef 8208 	mrs	r2, MSP
 80001f8:	4c0f      	ldr	r4, [pc, #60]	; (8000238 <SysTick_Handler+0x50>)
 80001fa:	4d10      	ldr	r5, [pc, #64]	; (800023c <SysTick_Handler+0x54>)
 80001fc:	6823      	ldr	r3, [r4, #0]
 80001fe:	3301      	adds	r3, #1
 8000200:	d005      	beq.n	800020e <SysTick_Handler+0x26>
 8000202:	6823      	ldr	r3, [r4, #0]
 8000204:	210c      	movs	r1, #12
 8000206:	434b      	muls	r3, r1
 8000208:	18eb      	adds	r3, r5, r3
 800020a:	609a      	str	r2, [r3, #8]
 800020c:	e001      	b.n	8000212 <SysTick_Handler+0x2a>
 800020e:	2300      	movs	r3, #0
 8000210:	6023      	str	r3, [r4, #0]
 8000212:	f7ff ffb5 	bl	8000180 <scheduler>
 8000216:	6823      	ldr	r3, [r4, #0]
 8000218:	220c      	movs	r2, #12
 800021a:	4353      	muls	r3, r2
 800021c:	18ed      	adds	r5, r5, r3
 800021e:	2307      	movs	r3, #7
 8000220:	68aa      	ldr	r2, [r5, #8]
 8000222:	425b      	negs	r3, r3
 8000224:	469e      	mov	lr, r3
 8000226:	f382 8808 	msr	MSP, r2
 800022a:	bcf0      	pop	{r4, r5, r6, r7}
 800022c:	46a0      	mov	r8, r4
 800022e:	46a9      	mov	r9, r5
 8000230:	46b2      	mov	sl, r6
 8000232:	46bb      	mov	fp, r7
 8000234:	bcf0      	pop	{r4, r5, r6, r7}
 8000236:	4770      	bx	lr
 8000238:	2000049c 	.word	0x2000049c
 800023c:	2000043c 	.word	0x2000043c

08000240 <sched_off>:
 8000240:	b672      	cpsid	i
 8000242:	4770      	bx	lr

08000244 <sched_on>:
 8000244:	b662      	cpsie	i
 8000246:	4770      	bx	lr

08000248 <yield>:
 8000248:	4770      	bx	lr
	...

0800024c <get_thread_id>:
 800024c:	b082      	sub	sp, #8
 800024e:	b672      	cpsid	i
 8000250:	4b03      	ldr	r3, [pc, #12]	; (8000260 <get_thread_id+0x14>)
 8000252:	681b      	ldr	r3, [r3, #0]
 8000254:	9301      	str	r3, [sp, #4]
 8000256:	b662      	cpsie	i
 8000258:	9801      	ldr	r0, [sp, #4]
 800025a:	b002      	add	sp, #8
 800025c:	4770      	bx	lr
 800025e:	46c0      	nop			; (mov r8, r8)
 8000260:	2000049c 	.word	0x2000049c

08000264 <kernel_start>:
 8000264:	b508      	push	{r3, lr}
 8000266:	f000 fbff 	bl	8000a68 <sys_tick_init>
 800026a:	46c0      	nop			; (mov r8, r8)
 800026c:	e7fd      	b.n	800026a <kernel_start+0x6>
	...

08000270 <create_thread>:
 8000270:	b5f0      	push	{r4, r5, r6, r7, lr}
 8000272:	b085      	sub	sp, #20
 8000274:	9003      	str	r0, [sp, #12]
 8000276:	481b      	ldr	r0, [pc, #108]	; (80002e4 <create_thread+0x74>)
 8000278:	0892      	lsrs	r2, r2, #2
 800027a:	1812      	adds	r2, r2, r0
 800027c:	0092      	lsls	r2, r2, #2
 800027e:	1888      	adds	r0, r1, r2
 8000280:	1c17      	adds	r7, r2, #0
 8000282:	9002      	str	r0, [sp, #8]
 8000284:	1c10      	adds	r0, r2, #0
 8000286:	323c      	adds	r2, #60	; 0x3c
 8000288:	188a      	adds	r2, r1, r2
 800028a:	3034      	adds	r0, #52	; 0x34
 800028c:	3738      	adds	r7, #56	; 0x38
 800028e:	9201      	str	r2, [sp, #4]
 8000290:	180e      	adds	r6, r1, r0
 8000292:	19cf      	adds	r7, r1, r7
 8000294:	2200      	movs	r2, #0
 8000296:	b672      	cpsid	i
 8000298:	250c      	movs	r5, #12
 800029a:	4355      	muls	r5, r2
 800029c:	4c12      	ldr	r4, [pc, #72]	; (80002e8 <create_thread+0x78>)
 800029e:	2008      	movs	r0, #8
 80002a0:	1965      	adds	r5, r4, r5
 80002a2:	6869      	ldr	r1, [r5, #4]
 80002a4:	07c9      	lsls	r1, r1, #31
 80002a6:	d415      	bmi.n	80002d4 <create_thread+0x64>
 80002a8:	9902      	ldr	r1, [sp, #8]
 80002aa:	60a9      	str	r1, [r5, #8]
 80002ac:	4d0f      	ldr	r5, [pc, #60]	; (80002ec <create_thread+0x7c>)
 80002ae:	9903      	ldr	r1, [sp, #12]
 80002b0:	6035      	str	r5, [r6, #0]
 80002b2:	6039      	str	r1, [r7, #0]
 80002b4:	2584      	movs	r5, #132	; 0x84
 80002b6:	9901      	ldr	r1, [sp, #4]
 80002b8:	05ad      	lsls	r5, r5, #22
 80002ba:	600d      	str	r5, [r1, #0]
 80002bc:	2b07      	cmp	r3, #7
 80002be:	d800      	bhi.n	80002c2 <create_thread+0x52>
 80002c0:	1c03      	adds	r3, r0, #0
 80002c2:	200c      	movs	r0, #12
 80002c4:	4350      	muls	r0, r2
 80002c6:	4908      	ldr	r1, [pc, #32]	; (80002e8 <create_thread+0x78>)
 80002c8:	180d      	adds	r5, r1, r0
 80002ca:	806b      	strh	r3, [r5, #2]
 80002cc:	5223      	strh	r3, [r4, r0]
 80002ce:	2001      	movs	r0, #1
 80002d0:	6068      	str	r0, [r5, #4]
 80002d2:	1c10      	adds	r0, r2, #0
 80002d4:	b662      	cpsie	i
 80002d6:	3201      	adds	r2, #1
 80002d8:	2a08      	cmp	r2, #8
 80002da:	d001      	beq.n	80002e0 <create_thread+0x70>
 80002dc:	2808      	cmp	r0, #8
 80002de:	d0da      	beq.n	8000296 <create_thread+0x26>
 80002e0:	b005      	add	sp, #20
 80002e2:	bdf0      	pop	{r4, r5, r6, r7, pc}
 80002e4:	3ffffff0 	.word	0x3ffffff0
 80002e8:	2000043c 	.word	0x2000043c
 80002ec:	08000159 	.word	0x08000159

080002f0 <kernel_init>:
 80002f0:	b510      	push	{r4, lr}
 80002f2:	2300      	movs	r3, #0
 80002f4:	210c      	movs	r1, #12
 80002f6:	4359      	muls	r1, r3
 80002f8:	4a0a      	ldr	r2, [pc, #40]	; (8000324 <kernel_init+0x34>)
 80002fa:	2000      	movs	r0, #0
 80002fc:	1854      	adds	r4, r2, r1
 80002fe:	6060      	str	r0, [r4, #4]
 8000300:	3301      	adds	r3, #1
 8000302:	2008      	movs	r0, #8
 8000304:	8060      	strh	r0, [r4, #2]
 8000306:	5288      	strh	r0, [r1, r2]
 8000308:	4283      	cmp	r3, r0
 800030a:	d1f3      	bne.n	80002f4 <kernel_init+0x4>
 800030c:	4b06      	ldr	r3, [pc, #24]	; (8000328 <kernel_init+0x38>)
 800030e:	2201      	movs	r2, #1
 8000310:	4252      	negs	r2, r2
 8000312:	601a      	str	r2, [r3, #0]
 8000314:	4905      	ldr	r1, [pc, #20]	; (800032c <kernel_init+0x3c>)
 8000316:	2280      	movs	r2, #128	; 0x80
 8000318:	23ff      	movs	r3, #255	; 0xff
 800031a:	4805      	ldr	r0, [pc, #20]	; (8000330 <kernel_init+0x40>)
 800031c:	f7ff ffa8 	bl	8000270 <create_thread>
 8000320:	bd10      	pop	{r4, pc}
 8000322:	46c0      	nop			; (mov r8, r8)
 8000324:	2000043c 	.word	0x2000043c
 8000328:	2000049c 	.word	0x2000049c
 800032c:	200004a0 	.word	0x200004a0
 8000330:	08000179 	.word	0x08000179

08000334 <set_wait_state>:
 8000334:	b507      	push	{r0, r1, r2, lr}
 8000336:	f7ff ff89 	bl	800024c <get_thread_id>
 800033a:	9000      	str	r0, [sp, #0]
 800033c:	b672      	cpsid	i
 800033e:	9a00      	ldr	r2, [sp, #0]
 8000340:	210c      	movs	r1, #12
 8000342:	434a      	muls	r2, r1
 8000344:	4b09      	ldr	r3, [pc, #36]	; (800036c <set_wait_state+0x38>)
 8000346:	2002      	movs	r0, #2
 8000348:	189a      	adds	r2, r3, r2
 800034a:	6851      	ldr	r1, [r2, #4]
 800034c:	4301      	orrs	r1, r0
 800034e:	6051      	str	r1, [r2, #4]
 8000350:	b672      	cpsid	i
 8000352:	9a00      	ldr	r2, [sp, #0]
 8000354:	210c      	movs	r1, #12
 8000356:	434a      	muls	r2, r1
 8000358:	189a      	adds	r2, r3, r2
 800035a:	6852      	ldr	r2, [r2, #4]
 800035c:	9201      	str	r2, [sp, #4]
 800035e:	b662      	cpsie	i
 8000360:	9a01      	ldr	r2, [sp, #4]
 8000362:	9a01      	ldr	r2, [sp, #4]
 8000364:	0791      	lsls	r1, r2, #30
 8000366:	d4f3      	bmi.n	8000350 <set_wait_state+0x1c>
 8000368:	bd07      	pop	{r0, r1, r2, pc}
 800036a:	46c0      	nop			; (mov r8, r8)
 800036c:	2000043c 	.word	0x2000043c

08000370 <wake_up_threads>:
 8000370:	2300      	movs	r3, #0
 8000372:	b672      	cpsid	i
 8000374:	220c      	movs	r2, #12
 8000376:	435a      	muls	r2, r3
 8000378:	4905      	ldr	r1, [pc, #20]	; (8000390 <wake_up_threads+0x20>)
 800037a:	2002      	movs	r0, #2
 800037c:	188a      	adds	r2, r1, r2
 800037e:	6851      	ldr	r1, [r2, #4]
 8000380:	4381      	bics	r1, r0
 8000382:	6051      	str	r1, [r2, #4]
 8000384:	b662      	cpsie	i
 8000386:	3301      	adds	r3, #1
 8000388:	2b08      	cmp	r3, #8
 800038a:	d1f2      	bne.n	8000372 <wake_up_threads+0x2>
 800038c:	4770      	bx	lr
 800038e:	46c0      	nop			; (mov r8, r8)
 8000390:	2000043c 	.word	0x2000043c

08000394 <messages_init>:
 8000394:	b510      	push	{r4, lr}
 8000396:	2200      	movs	r2, #0
 8000398:	4909      	ldr	r1, [pc, #36]	; (80003c0 <messages_init+0x2c>)
 800039a:	0090      	lsls	r0, r2, #2
 800039c:	2300      	movs	r3, #0
 800039e:	3201      	adds	r2, #1
 80003a0:	5043      	str	r3, [r0, r1]
 80003a2:	2a08      	cmp	r2, #8
 80003a4:	d1f8      	bne.n	8000398 <messages_init+0x4>
 80003a6:	4807      	ldr	r0, [pc, #28]	; (80003c4 <messages_init+0x30>)
 80003a8:	011c      	lsls	r4, r3, #4
 80003aa:	2200      	movs	r2, #0
 80003ac:	1901      	adds	r1, r0, r4
 80003ae:	3301      	adds	r3, #1
 80003b0:	604a      	str	r2, [r1, #4]
 80003b2:	5022      	str	r2, [r4, r0]
 80003b4:	60ca      	str	r2, [r1, #12]
 80003b6:	608a      	str	r2, [r1, #8]
 80003b8:	2b04      	cmp	r3, #4
 80003ba:	d1f4      	bne.n	80003a6 <messages_init+0x12>
 80003bc:	bd10      	pop	{r4, pc}
 80003be:	46c0      	nop			; (mov r8, r8)
 80003c0:	20000520 	.word	0x20000520
 80003c4:	20000540 	.word	0x20000540

080003c8 <putc_>:
 80003c8:	b538      	push	{r3, r4, r5, lr}
 80003ca:	4c06      	ldr	r4, [pc, #24]	; (80003e4 <putc_+0x1c>)
 80003cc:	1c05      	adds	r5, r0, #0
 80003ce:	1c20      	adds	r0, r4, #0
 80003d0:	f000 f90b 	bl	80005ea <mutex_lock>
 80003d4:	1c28      	adds	r0, r5, #0
 80003d6:	f000 fa5d 	bl	8000894 <uart_write>
 80003da:	1c20      	adds	r0, r4, #0
 80003dc:	f000 f921 	bl	8000622 <mutex_unlock>
 80003e0:	bd38      	pop	{r3, r4, r5, pc}
 80003e2:	46c0      	nop			; (mov r8, r8)
 80003e4:	20000580 	.word	0x20000580

080003e8 <puts_>:
 80003e8:	b538      	push	{r3, r4, r5, lr}
 80003ea:	4d08      	ldr	r5, [pc, #32]	; (800040c <puts_+0x24>)
 80003ec:	1c04      	adds	r4, r0, #0
 80003ee:	1c28      	adds	r0, r5, #0
 80003f0:	f000 f8fb 	bl	80005ea <mutex_lock>
 80003f4:	3401      	adds	r4, #1
 80003f6:	1e63      	subs	r3, r4, #1
 80003f8:	7818      	ldrb	r0, [r3, #0]
 80003fa:	2800      	cmp	r0, #0
 80003fc:	d002      	beq.n	8000404 <puts_+0x1c>
 80003fe:	f7ff ffe3 	bl	80003c8 <putc_>
 8000402:	e7f7      	b.n	80003f4 <puts_+0xc>
 8000404:	1c28      	adds	r0, r5, #0
 8000406:	f000 f90c 	bl	8000622 <mutex_unlock>
 800040a:	bd38      	pop	{r3, r4, r5, pc}
 800040c:	2000058c 	.word	0x2000058c

08000410 <puti_>:
 8000410:	b5f0      	push	{r4, r5, r6, r7, lr}
 8000412:	2300      	movs	r3, #0
 8000414:	b085      	sub	sp, #20
 8000416:	1c04      	adds	r4, r0, #0
 8000418:	1c1f      	adds	r7, r3, #0
 800041a:	4298      	cmp	r0, r3
 800041c:	da01      	bge.n	8000422 <puti_+0x12>
 800041e:	4244      	negs	r4, r0
 8000420:	2701      	movs	r7, #1
 8000422:	ae01      	add	r6, sp, #4
 8000424:	72f3      	strb	r3, [r6, #11]
 8000426:	250a      	movs	r5, #10
 8000428:	1c20      	adds	r0, r4, #0
 800042a:	210a      	movs	r1, #10
 800042c:	f001 f94c 	bl	80016c8 <__aeabi_idivmod>
 8000430:	3130      	adds	r1, #48	; 0x30
 8000432:	5571      	strb	r1, [r6, r5]
 8000434:	1c20      	adds	r0, r4, #0
 8000436:	210a      	movs	r1, #10
 8000438:	f001 f8f0 	bl	800161c <__aeabi_idiv>
 800043c:	1e6b      	subs	r3, r5, #1
 800043e:	1e04      	subs	r4, r0, #0
 8000440:	d001      	beq.n	8000446 <puti_+0x36>
 8000442:	1c1d      	adds	r5, r3, #0
 8000444:	e7f0      	b.n	8000428 <puti_+0x18>
 8000446:	2f00      	cmp	r7, #0
 8000448:	d002      	beq.n	8000450 <puti_+0x40>
 800044a:	222d      	movs	r2, #45	; 0x2d
 800044c:	54f2      	strb	r2, [r6, r3]
 800044e:	1c1d      	adds	r5, r3, #0
 8000450:	1970      	adds	r0, r6, r5
 8000452:	f7ff ffc9 	bl	80003e8 <puts_>
 8000456:	b005      	add	sp, #20
 8000458:	bdf0      	pop	{r4, r5, r6, r7, pc}

0800045a <putui_>:
 800045a:	b57f      	push	{r0, r1, r2, r3, r4, r5, r6, lr}
 800045c:	2300      	movs	r3, #0
 800045e:	ae01      	add	r6, sp, #4
 8000460:	1c05      	adds	r5, r0, #0
 8000462:	72f3      	strb	r3, [r6, #11]
 8000464:	240a      	movs	r4, #10
 8000466:	1c28      	adds	r0, r5, #0
 8000468:	210a      	movs	r1, #10
 800046a:	f001 f8cd 	bl	8001608 <__aeabi_uidivmod>
 800046e:	3130      	adds	r1, #48	; 0x30
 8000470:	5531      	strb	r1, [r6, r4]
 8000472:	1c28      	adds	r0, r5, #0
 8000474:	210a      	movs	r1, #10
 8000476:	f001 f883 	bl	8001580 <__aeabi_uidiv>
 800047a:	1e63      	subs	r3, r4, #1
 800047c:	1e05      	subs	r5, r0, #0
 800047e:	d001      	beq.n	8000484 <putui_+0x2a>
 8000480:	1c1c      	adds	r4, r3, #0
 8000482:	e7f0      	b.n	8000466 <putui_+0xc>
 8000484:	1930      	adds	r0, r6, r4
 8000486:	f7ff ffaf 	bl	80003e8 <puts_>
 800048a:	bd7f      	pop	{r0, r1, r2, r3, r4, r5, r6, pc}

0800048c <putx_>:
 800048c:	b51f      	push	{r0, r1, r2, r3, r4, lr}
 800048e:	2300      	movs	r3, #0
 8000490:	aa01      	add	r2, sp, #4
 8000492:	72d3      	strb	r3, [r2, #11]
 8000494:	230a      	movs	r3, #10
 8000496:	210f      	movs	r1, #15
 8000498:	4001      	ands	r1, r0
 800049a:	2909      	cmp	r1, #9
 800049c:	d801      	bhi.n	80004a2 <putx_+0x16>
 800049e:	3130      	adds	r1, #48	; 0x30
 80004a0:	e000      	b.n	80004a4 <putx_+0x18>
 80004a2:	3157      	adds	r1, #87	; 0x57
 80004a4:	54d1      	strb	r1, [r2, r3]
 80004a6:	0900      	lsrs	r0, r0, #4
 80004a8:	1e59      	subs	r1, r3, #1
 80004aa:	2800      	cmp	r0, #0
 80004ac:	d001      	beq.n	80004b2 <putx_+0x26>
 80004ae:	1c0b      	adds	r3, r1, #0
 80004b0:	e7f1      	b.n	8000496 <putx_+0xa>
 80004b2:	18d0      	adds	r0, r2, r3
 80004b4:	f7ff ff98 	bl	80003e8 <puts_>
 80004b8:	b005      	add	sp, #20
 80004ba:	bd00      	pop	{pc}

080004bc <printf_>:
 80004bc:	b40f      	push	{r0, r1, r2, r3}
 80004be:	b573      	push	{r0, r1, r4, r5, r6, lr}
 80004c0:	4e25      	ldr	r6, [pc, #148]	; (8000558 <printf_+0x9c>)
 80004c2:	ac06      	add	r4, sp, #24
 80004c4:	cc20      	ldmia	r4!, {r5}
 80004c6:	1c30      	adds	r0, r6, #0
 80004c8:	f000 f88f 	bl	80005ea <mutex_lock>
 80004cc:	9401      	str	r4, [sp, #4]
 80004ce:	2400      	movs	r4, #0
 80004d0:	5d28      	ldrb	r0, [r5, r4]
 80004d2:	2800      	cmp	r0, #0
 80004d4:	d039      	beq.n	800054a <printf_+0x8e>
 80004d6:	2825      	cmp	r0, #37	; 0x25
 80004d8:	d003      	beq.n	80004e2 <printf_+0x26>
 80004da:	f7ff ff75 	bl	80003c8 <putc_>
 80004de:	3401      	adds	r4, #1
 80004e0:	e7f6      	b.n	80004d0 <printf_+0x14>
 80004e2:	192b      	adds	r3, r5, r4
 80004e4:	7858      	ldrb	r0, [r3, #1]
 80004e6:	2869      	cmp	r0, #105	; 0x69
 80004e8:	d016      	beq.n	8000518 <printf_+0x5c>
 80004ea:	d808      	bhi.n	80004fe <printf_+0x42>
 80004ec:	2825      	cmp	r0, #37	; 0x25
 80004ee:	d028      	beq.n	8000542 <printf_+0x86>
 80004f0:	2863      	cmp	r0, #99	; 0x63
 80004f2:	d128      	bne.n	8000546 <printf_+0x8a>
 80004f4:	9b01      	ldr	r3, [sp, #4]
 80004f6:	1d1a      	adds	r2, r3, #4
 80004f8:	9201      	str	r2, [sp, #4]
 80004fa:	7818      	ldrb	r0, [r3, #0]
 80004fc:	e021      	b.n	8000542 <printf_+0x86>
 80004fe:	2875      	cmp	r0, #117	; 0x75
 8000500:	d011      	beq.n	8000526 <printf_+0x6a>
 8000502:	2878      	cmp	r0, #120	; 0x78
 8000504:	d016      	beq.n	8000534 <printf_+0x78>
 8000506:	2873      	cmp	r0, #115	; 0x73
 8000508:	d11d      	bne.n	8000546 <printf_+0x8a>
 800050a:	9b01      	ldr	r3, [sp, #4]
 800050c:	1d1a      	adds	r2, r3, #4
 800050e:	6818      	ldr	r0, [r3, #0]
 8000510:	9201      	str	r2, [sp, #4]
 8000512:	f7ff ff69 	bl	80003e8 <puts_>
 8000516:	e016      	b.n	8000546 <printf_+0x8a>
 8000518:	9b01      	ldr	r3, [sp, #4]
 800051a:	1d1a      	adds	r2, r3, #4
 800051c:	6818      	ldr	r0, [r3, #0]
 800051e:	9201      	str	r2, [sp, #4]
 8000520:	f7ff ff76 	bl	8000410 <puti_>
 8000524:	e00f      	b.n	8000546 <printf_+0x8a>
 8000526:	9b01      	ldr	r3, [sp, #4]
 8000528:	1d1a      	adds	r2, r3, #4
 800052a:	6818      	ldr	r0, [r3, #0]
 800052c:	9201      	str	r2, [sp, #4]
 800052e:	f7ff ff94 	bl	800045a <putui_>
 8000532:	e008      	b.n	8000546 <printf_+0x8a>
 8000534:	9b01      	ldr	r3, [sp, #4]
 8000536:	1d1a      	adds	r2, r3, #4
 8000538:	6818      	ldr	r0, [r3, #0]
 800053a:	9201      	str	r2, [sp, #4]
 800053c:	f7ff ffa6 	bl	800048c <putx_>
 8000540:	e001      	b.n	8000546 <printf_+0x8a>
 8000542:	f7ff ff41 	bl	80003c8 <putc_>
 8000546:	3402      	adds	r4, #2
 8000548:	e7c2      	b.n	80004d0 <printf_+0x14>
 800054a:	1c30      	adds	r0, r6, #0
 800054c:	f000 f869 	bl	8000622 <mutex_unlock>
 8000550:	bc73      	pop	{r0, r1, r4, r5, r6}
 8000552:	bc08      	pop	{r3}
 8000554:	b004      	add	sp, #16
 8000556:	4718      	bx	r3
 8000558:	20000588 	.word	0x20000588

0800055c <stdio_init>:
 800055c:	b510      	push	{r4, lr}
 800055e:	480f      	ldr	r0, [pc, #60]	; (800059c <stdio_init+0x40>)
 8000560:	f000 f83a 	bl	80005d8 <mutex_init>
 8000564:	480e      	ldr	r0, [pc, #56]	; (80005a0 <stdio_init+0x44>)
 8000566:	f000 f837 	bl	80005d8 <mutex_init>
 800056a:	480e      	ldr	r0, [pc, #56]	; (80005a4 <stdio_init+0x48>)
 800056c:	f000 f834 	bl	80005d8 <mutex_init>
 8000570:	480d      	ldr	r0, [pc, #52]	; (80005a8 <stdio_init+0x4c>)
 8000572:	f000 f831 	bl	80005d8 <mutex_init>
 8000576:	2408      	movs	r4, #8
 8000578:	2020      	movs	r0, #32
 800057a:	3c01      	subs	r4, #1
 800057c:	f7ff ff24 	bl	80003c8 <putc_>
 8000580:	2c00      	cmp	r4, #0
 8000582:	d1f9      	bne.n	8000578 <stdio_init+0x1c>
 8000584:	2420      	movs	r4, #32
 8000586:	200a      	movs	r0, #10
 8000588:	3c01      	subs	r4, #1
 800058a:	f7ff ff1d 	bl	80003c8 <putc_>
 800058e:	2c00      	cmp	r4, #0
 8000590:	d1f9      	bne.n	8000586 <stdio_init+0x2a>
 8000592:	4806      	ldr	r0, [pc, #24]	; (80005ac <stdio_init+0x50>)
 8000594:	f7ff ff92 	bl	80004bc <printf_>
 8000598:	bd10      	pop	{r4, pc}
 800059a:	46c0      	nop			; (mov r8, r8)
 800059c:	20000580 	.word	0x20000580
 80005a0:	20000584 	.word	0x20000584
 80005a4:	2000058c 	.word	0x2000058c
 80005a8:	20000588 	.word	0x20000588
 80005ac:	08002800 	.word	0x08002800

080005b0 <free_safe>:
 80005b0:	b510      	push	{r4, lr}
 80005b2:	4c04      	ldr	r4, [pc, #16]	; (80005c4 <free_safe+0x14>)
 80005b4:	1c20      	adds	r0, r4, #0
 80005b6:	f000 f818 	bl	80005ea <mutex_lock>
 80005ba:	1c20      	adds	r0, r4, #0
 80005bc:	f000 f831 	bl	8000622 <mutex_unlock>
 80005c0:	bd10      	pop	{r4, pc}
 80005c2:	46c0      	nop			; (mov r8, r8)
 80005c4:	20000590 	.word	0x20000590

080005c8 <lib_os_init>:
 80005c8:	b508      	push	{r3, lr}
 80005ca:	f7ff fe91 	bl	80002f0 <kernel_init>
 80005ce:	f7ff fee1 	bl	8000394 <messages_init>
 80005d2:	f7ff ffc3 	bl	800055c <stdio_init>
 80005d6:	bd08      	pop	{r3, pc}

080005d8 <mutex_init>:
 80005d8:	b510      	push	{r4, lr}
 80005da:	1c04      	adds	r4, r0, #0
 80005dc:	f7ff fe30 	bl	8000240 <sched_off>
 80005e0:	2300      	movs	r3, #0
 80005e2:	6023      	str	r3, [r4, #0]
 80005e4:	f7ff fe2e 	bl	8000244 <sched_on>
 80005e8:	bd10      	pop	{r4, pc}

080005ea <mutex_lock>:
 80005ea:	b513      	push	{r0, r1, r4, lr}
 80005ec:	1c04      	adds	r4, r0, #0
 80005ee:	f7ff fe27 	bl	8000240 <sched_off>
 80005f2:	6823      	ldr	r3, [r4, #0]
 80005f4:	9301      	str	r3, [sp, #4]
 80005f6:	f7ff fe25 	bl	8000244 <sched_on>
 80005fa:	9b01      	ldr	r3, [sp, #4]
 80005fc:	2b00      	cmp	r3, #0
 80005fe:	d001      	beq.n	8000604 <mutex_lock+0x1a>
 8000600:	f7ff fe98 	bl	8000334 <set_wait_state>
 8000604:	9b01      	ldr	r3, [sp, #4]
 8000606:	2b00      	cmp	r3, #0
 8000608:	d1f1      	bne.n	80005ee <mutex_lock+0x4>
 800060a:	f7ff fe19 	bl	8000240 <sched_off>
 800060e:	6823      	ldr	r3, [r4, #0]
 8000610:	9301      	str	r3, [sp, #4]
 8000612:	9b01      	ldr	r3, [sp, #4]
 8000614:	2b00      	cmp	r3, #0
 8000616:	d1ea      	bne.n	80005ee <mutex_lock+0x4>
 8000618:	2301      	movs	r3, #1
 800061a:	6023      	str	r3, [r4, #0]
 800061c:	f7ff fe12 	bl	8000244 <sched_on>
 8000620:	bd13      	pop	{r0, r1, r4, pc}

08000622 <mutex_unlock>:
 8000622:	b508      	push	{r3, lr}
 8000624:	f7ff ffd8 	bl	80005d8 <mutex_init>
 8000628:	f7ff fea2 	bl	8000370 <wake_up_threads>
 800062c:	f7ff fe0c 	bl	8000248 <yield>
 8000630:	bd08      	pop	{r3, pc}
	...

08000634 <child1_thread>:
 8000634:	b508      	push	{r3, lr}
 8000636:	f000 f937 	bl	80008a8 <uart_read>
 800063a:	1c01      	adds	r1, r0, #0
 800063c:	4808      	ldr	r0, [pc, #32]	; (8000660 <child1_thread+0x2c>)
 800063e:	f7ff ff3d 	bl	80004bc <printf_>
 8000642:	2008      	movs	r0, #8
 8000644:	f000 fe10 	bl	8001268 <led_on>
 8000648:	4806      	ldr	r0, [pc, #24]	; (8000664 <child1_thread+0x30>)
 800064a:	f7ff ff37 	bl	80004bc <printf_>
 800064e:	2008      	movs	r0, #8
 8000650:	f000 fe1e 	bl	8001290 <led_off>
 8000654:	2096      	movs	r0, #150	; 0x96
 8000656:	0040      	lsls	r0, r0, #1
 8000658:	f000 f90c 	bl	8000874 <timer_delay_ms>
 800065c:	e7eb      	b.n	8000636 <child1_thread+0x2>
 800065e:	46c0      	nop			; (mov r8, r8)
 8000660:	08002811 	.word	0x08002811
 8000664:	0800281c 	.word	0x0800281c

08000668 <child2_thread>:
 8000668:	b508      	push	{r3, lr}
 800066a:	2008      	movs	r0, #8
 800066c:	f000 fdfc 	bl	8001268 <led_on>
 8000670:	4805      	ldr	r0, [pc, #20]	; (8000688 <child2_thread+0x20>)
 8000672:	f7ff ff23 	bl	80004bc <printf_>
 8000676:	2008      	movs	r0, #8
 8000678:	f000 fe0a 	bl	8001290 <led_off>
 800067c:	20af      	movs	r0, #175	; 0xaf
 800067e:	0080      	lsls	r0, r0, #2
 8000680:	f000 f8f8 	bl	8000874 <timer_delay_ms>
 8000684:	e7f1      	b.n	800066a <child2_thread+0x2>
 8000686:	46c0      	nop			; (mov r8, r8)
 8000688:	08002834 	.word	0x08002834

0800068c <main_thread>:
 800068c:	b508      	push	{r3, lr}
 800068e:	2008      	movs	r0, #8
 8000690:	f000 fdea 	bl	8001268 <led_on>
 8000694:	4810      	ldr	r0, [pc, #64]	; (80006d8 <main_thread+0x4c>)
 8000696:	f7ff ff11 	bl	80004bc <printf_>
 800069a:	2280      	movs	r2, #128	; 0x80
 800069c:	490f      	ldr	r1, [pc, #60]	; (80006dc <main_thread+0x50>)
 800069e:	0052      	lsls	r2, r2, #1
 80006a0:	2308      	movs	r3, #8
 80006a2:	480f      	ldr	r0, [pc, #60]	; (80006e0 <main_thread+0x54>)
 80006a4:	f7ff fde4 	bl	8000270 <create_thread>
 80006a8:	2280      	movs	r2, #128	; 0x80
 80006aa:	480e      	ldr	r0, [pc, #56]	; (80006e4 <main_thread+0x58>)
 80006ac:	490e      	ldr	r1, [pc, #56]	; (80006e8 <main_thread+0x5c>)
 80006ae:	0052      	lsls	r2, r2, #1
 80006b0:	2308      	movs	r3, #8
 80006b2:	f7ff fddd 	bl	8000270 <create_thread>
 80006b6:	2008      	movs	r0, #8
 80006b8:	f000 fdd6 	bl	8001268 <led_on>
 80006bc:	480b      	ldr	r0, [pc, #44]	; (80006ec <main_thread+0x60>)
 80006be:	f7ff fefd 	bl	80004bc <printf_>
 80006c2:	2008      	movs	r0, #8
 80006c4:	f000 fde4 	bl	8001290 <led_off>
 80006c8:	f7ff fd3c 	bl	8000144 <object_test_call>
 80006cc:	20fa      	movs	r0, #250	; 0xfa
 80006ce:	0040      	lsls	r0, r0, #1
 80006d0:	f000 f8d0 	bl	8000874 <timer_delay_ms>
 80006d4:	e7ef      	b.n	80006b6 <main_thread+0x2a>
 80006d6:	46c0      	nop			; (mov r8, r8)
 80006d8:	0800284c 	.word	0x0800284c
 80006dc:	20000694 	.word	0x20000694
 80006e0:	08000635 	.word	0x08000635
 80006e4:	08000669 	.word	0x08000669
 80006e8:	20000594 	.word	0x20000594
 80006ec:	08002887 	.word	0x08002887

080006f0 <_exit>:
 80006f0:	4770      	bx	lr

080006f2 <_kill>:
 80006f2:	4770      	bx	lr

080006f4 <_getpid>:
 80006f4:	2000      	movs	r0, #0
 80006f6:	4770      	bx	lr

080006f8 <mem_info_print>:
 80006f8:	b538      	push	{r3, r4, r5, lr}
 80006fa:	480e      	ldr	r0, [pc, #56]	; (8000734 <mem_info_print+0x3c>)
 80006fc:	490e      	ldr	r1, [pc, #56]	; (8000738 <mem_info_print+0x40>)
 80006fe:	f7ff fedd 	bl	80004bc <printf_>
 8000702:	4c0e      	ldr	r4, [pc, #56]	; (800073c <mem_info_print+0x44>)
 8000704:	480e      	ldr	r0, [pc, #56]	; (8000740 <mem_info_print+0x48>)
 8000706:	1c21      	adds	r1, r4, #0
 8000708:	f7ff fed8 	bl	80004bc <printf_>
 800070c:	4d0d      	ldr	r5, [pc, #52]	; (8000744 <mem_info_print+0x4c>)
 800070e:	480e      	ldr	r0, [pc, #56]	; (8000748 <mem_info_print+0x50>)
 8000710:	1b2d      	subs	r5, r5, r4
 8000712:	1c29      	adds	r1, r5, #0
 8000714:	f7ff fed2 	bl	80004bc <printf_>
 8000718:	490c      	ldr	r1, [pc, #48]	; (800074c <mem_info_print+0x54>)
 800071a:	480d      	ldr	r0, [pc, #52]	; (8000750 <mem_info_print+0x58>)
 800071c:	1a64      	subs	r4, r4, r1
 800071e:	1929      	adds	r1, r5, r4
 8000720:	f7ff fecc 	bl	80004bc <printf_>
 8000724:	490b      	ldr	r1, [pc, #44]	; (8000754 <mem_info_print+0x5c>)
 8000726:	480c      	ldr	r0, [pc, #48]	; (8000758 <mem_info_print+0x60>)
 8000728:	f7ff fec8 	bl	80004bc <printf_>
 800072c:	480b      	ldr	r0, [pc, #44]	; (800075c <mem_info_print+0x64>)
 800072e:	f7ff fec5 	bl	80004bc <printf_>
 8000732:	bd38      	pop	{r3, r4, r5, pc}
 8000734:	08002894 	.word	0x08002894
 8000738:	08002744 	.word	0x08002744
 800073c:	20000000 	.word	0x20000000
 8000740:	080028a5 	.word	0x080028a5
 8000744:	20001000 	.word	0x20001000
 8000748:	080028b4 	.word	0x080028b4
 800074c:	20000904 	.word	0x20000904
 8000750:	080028c2 	.word	0x080028c2
 8000754:	20000904 	.word	0x20000904
 8000758:	080028d0 	.word	0x080028d0
 800075c:	080028e0 	.word	0x080028e0

08000760 <main>:
 8000760:	b508      	push	{r3, lr}
 8000762:	f000 f9f5 	bl	8000b50 <lib_low_level_init>
 8000766:	f7ff ff2f 	bl	80005c8 <lib_os_init>
 800076a:	f7ff ffc5 	bl	80006f8 <mem_info_print>
 800076e:	2280      	movs	r2, #128	; 0x80
 8000770:	4904      	ldr	r1, [pc, #16]	; (8000784 <main+0x24>)
 8000772:	0052      	lsls	r2, r2, #1
 8000774:	2308      	movs	r3, #8
 8000776:	4804      	ldr	r0, [pc, #16]	; (8000788 <main+0x28>)
 8000778:	f7ff fd7a 	bl	8000270 <create_thread>
 800077c:	f7ff fd72 	bl	8000264 <kernel_start>
 8000780:	2000      	movs	r0, #0
 8000782:	bd08      	pop	{r3, pc}
 8000784:	20000794 	.word	0x20000794
 8000788:	0800068d 	.word	0x0800068d

0800078c <timer_init>:
 800078c:	b530      	push	{r4, r5, lr}
 800078e:	2300      	movs	r3, #0
 8000790:	b085      	sub	sp, #20
 8000792:	481b      	ldr	r0, [pc, #108]	; (8000800 <timer_init+0x74>)
 8000794:	2180      	movs	r1, #128	; 0x80
 8000796:	005a      	lsls	r2, r3, #1
 8000798:	00c9      	lsls	r1, r1, #3
 800079a:	5211      	strh	r1, [r2, r0]
 800079c:	4819      	ldr	r0, [pc, #100]	; (8000804 <timer_init+0x78>)
 800079e:	2400      	movs	r4, #0
 80007a0:	5211      	strh	r1, [r2, r0]
 80007a2:	4919      	ldr	r1, [pc, #100]	; (8000808 <timer_init+0x7c>)
 80007a4:	3301      	adds	r3, #1
 80007a6:	5254      	strh	r4, [r2, r1]
 80007a8:	2b04      	cmp	r3, #4
 80007aa:	d1f2      	bne.n	8000792 <timer_init+0x6>
 80007ac:	4b17      	ldr	r3, [pc, #92]	; (800080c <timer_init+0x80>)
 80007ae:	2001      	movs	r0, #1
 80007b0:	1c01      	adds	r1, r0, #0
 80007b2:	601c      	str	r4, [r3, #0]
 80007b4:	f000 fcfe 	bl	80011b4 <RCC_APB1PeriphClockCmd>
 80007b8:	a901      	add	r1, sp, #4
 80007ba:	2330      	movs	r3, #48	; 0x30
 80007bc:	800b      	strh	r3, [r1, #0]
 80007be:	2080      	movs	r0, #128	; 0x80
 80007c0:	23fa      	movs	r3, #250	; 0xfa
 80007c2:	009b      	lsls	r3, r3, #2
 80007c4:	05c0      	lsls	r0, r0, #23
 80007c6:	604b      	str	r3, [r1, #4]
 80007c8:	804c      	strh	r4, [r1, #2]
 80007ca:	810c      	strh	r4, [r1, #8]
 80007cc:	728c      	strb	r4, [r1, #10]
 80007ce:	f000 fb01 	bl	8000dd4 <TIM_TimeBaseInit>
 80007d2:	2080      	movs	r0, #128	; 0x80
 80007d4:	05c0      	lsls	r0, r0, #23
 80007d6:	2101      	movs	r1, #1
 80007d8:	f000 fb38 	bl	8000e4c <TIM_Cmd>
 80007dc:	2080      	movs	r0, #128	; 0x80
 80007de:	2102      	movs	r1, #2
 80007e0:	05c0      	lsls	r0, r0, #23
 80007e2:	2201      	movs	r2, #1
 80007e4:	f000 fb3d 	bl	8000e62 <TIM_ITConfig>
 80007e8:	466a      	mov	r2, sp
 80007ea:	230f      	movs	r3, #15
 80007ec:	7013      	strb	r3, [r2, #0]
 80007ee:	4668      	mov	r0, sp
 80007f0:	2301      	movs	r3, #1
 80007f2:	7053      	strb	r3, [r2, #1]
 80007f4:	7093      	strb	r3, [r2, #2]
 80007f6:	f000 fbd1 	bl	8000f9c <NVIC_Init>
 80007fa:	b005      	add	sp, #20
 80007fc:	bd30      	pop	{r4, r5, pc}
 80007fe:	46c0      	nop			; (mov r8, r8)
 8000800:	200008a8 	.word	0x200008a8
 8000804:	2000089c 	.word	0x2000089c
 8000808:	20000894 	.word	0x20000894
 800080c:	200008a4 	.word	0x200008a4

08000810 <TIM2_IRQHandler>:
 8000810:	2200      	movs	r2, #0
 8000812:	490e      	ldr	r1, [pc, #56]	; (800084c <TIM2_IRQHandler+0x3c>)
 8000814:	0053      	lsls	r3, r2, #1
 8000816:	5a58      	ldrh	r0, [r3, r1]
 8000818:	2800      	cmp	r0, #0
 800081a:	d003      	beq.n	8000824 <TIM2_IRQHandler+0x14>
 800081c:	5a58      	ldrh	r0, [r3, r1]
 800081e:	3801      	subs	r0, #1
 8000820:	b280      	uxth	r0, r0
 8000822:	e005      	b.n	8000830 <TIM2_IRQHandler+0x20>
 8000824:	480a      	ldr	r0, [pc, #40]	; (8000850 <TIM2_IRQHandler+0x40>)
 8000826:	5a18      	ldrh	r0, [r3, r0]
 8000828:	b280      	uxth	r0, r0
 800082a:	5258      	strh	r0, [r3, r1]
 800082c:	4909      	ldr	r1, [pc, #36]	; (8000854 <TIM2_IRQHandler+0x44>)
 800082e:	2001      	movs	r0, #1
 8000830:	3201      	adds	r2, #1
 8000832:	5258      	strh	r0, [r3, r1]
 8000834:	2a04      	cmp	r2, #4
 8000836:	d1ec      	bne.n	8000812 <TIM2_IRQHandler+0x2>
 8000838:	4b07      	ldr	r3, [pc, #28]	; (8000858 <TIM2_IRQHandler+0x48>)
 800083a:	681a      	ldr	r2, [r3, #0]
 800083c:	3201      	adds	r2, #1
 800083e:	601a      	str	r2, [r3, #0]
 8000840:	2380      	movs	r3, #128	; 0x80
 8000842:	2200      	movs	r2, #0
 8000844:	05db      	lsls	r3, r3, #23
 8000846:	821a      	strh	r2, [r3, #16]
 8000848:	4770      	bx	lr
 800084a:	46c0      	nop			; (mov r8, r8)
 800084c:	200008a8 	.word	0x200008a8
 8000850:	2000089c 	.word	0x2000089c
 8000854:	20000894 	.word	0x20000894
 8000858:	200008a4 	.word	0x200008a4

0800085c <timer_get_time>:
 800085c:	b082      	sub	sp, #8
 800085e:	b672      	cpsid	i
 8000860:	4b03      	ldr	r3, [pc, #12]	; (8000870 <timer_get_time+0x14>)
 8000862:	681b      	ldr	r3, [r3, #0]
 8000864:	9301      	str	r3, [sp, #4]
 8000866:	b662      	cpsie	i
 8000868:	9801      	ldr	r0, [sp, #4]
 800086a:	b002      	add	sp, #8
 800086c:	4770      	bx	lr
 800086e:	46c0      	nop			; (mov r8, r8)
 8000870:	200008a4 	.word	0x200008a4

08000874 <timer_delay_ms>:
 8000874:	b513      	push	{r0, r1, r4, lr}
 8000876:	1c04      	adds	r4, r0, #0
 8000878:	f7ff fff0 	bl	800085c <timer_get_time>
 800087c:	1904      	adds	r4, r0, r4
 800087e:	9401      	str	r4, [sp, #4]
 8000880:	9c01      	ldr	r4, [sp, #4]
 8000882:	f7ff ffeb 	bl	800085c <timer_get_time>
 8000886:	4284      	cmp	r4, r0
 8000888:	d902      	bls.n	8000890 <timer_delay_ms+0x1c>
 800088a:	f000 f8f9 	bl	8000a80 <sleep>
 800088e:	e7f7      	b.n	8000880 <timer_delay_ms+0xc>
 8000890:	bd13      	pop	{r0, r1, r4, pc}
	...

08000894 <uart_write>:
 8000894:	4b03      	ldr	r3, [pc, #12]	; (80008a4 <uart_write+0x10>)
 8000896:	69da      	ldr	r2, [r3, #28]
 8000898:	0611      	lsls	r1, r2, #24
 800089a:	d401      	bmi.n	80008a0 <uart_write+0xc>
 800089c:	46c0      	nop			; (mov r8, r8)
 800089e:	e7f9      	b.n	8000894 <uart_write>
 80008a0:	8518      	strh	r0, [r3, #40]	; 0x28
 80008a2:	4770      	bx	lr
 80008a4:	40013800 	.word	0x40013800

080008a8 <uart_read>:
 80008a8:	4b0b      	ldr	r3, [pc, #44]	; (80008d8 <uart_read+0x30>)
 80008aa:	8819      	ldrh	r1, [r3, #0]
 80008ac:	4b0b      	ldr	r3, [pc, #44]	; (80008dc <uart_read+0x34>)
 80008ae:	881a      	ldrh	r2, [r3, #0]
 80008b0:	4291      	cmp	r1, r2
 80008b2:	d101      	bne.n	80008b8 <uart_read+0x10>
 80008b4:	46c0      	nop			; (mov r8, r8)
 80008b6:	e7f7      	b.n	80008a8 <uart_read>
 80008b8:	881a      	ldrh	r2, [r3, #0]
 80008ba:	4909      	ldr	r1, [pc, #36]	; (80008e0 <uart_read+0x38>)
 80008bc:	b292      	uxth	r2, r2
 80008be:	5c88      	ldrb	r0, [r1, r2]
 80008c0:	881a      	ldrh	r2, [r3, #0]
 80008c2:	b2c0      	uxtb	r0, r0
 80008c4:	3201      	adds	r2, #1
 80008c6:	b292      	uxth	r2, r2
 80008c8:	801a      	strh	r2, [r3, #0]
 80008ca:	881a      	ldrh	r2, [r3, #0]
 80008cc:	2a0f      	cmp	r2, #15
 80008ce:	d901      	bls.n	80008d4 <uart_read+0x2c>
 80008d0:	2200      	movs	r2, #0
 80008d2:	801a      	strh	r2, [r3, #0]
 80008d4:	4770      	bx	lr
 80008d6:	46c0      	nop			; (mov r8, r8)
 80008d8:	200008c0 	.word	0x200008c0
 80008dc:	200008c2 	.word	0x200008c2
 80008e0:	200008b0 	.word	0x200008b0

080008e4 <USART1_IRQHandler>:
 80008e4:	b508      	push	{r3, lr}
 80008e6:	480e      	ldr	r0, [pc, #56]	; (8000920 <USART1_IRQHandler+0x3c>)
 80008e8:	490e      	ldr	r1, [pc, #56]	; (8000924 <USART1_IRQHandler+0x40>)
 80008ea:	f000 fb33 	bl	8000f54 <USART_GetITStatus>
 80008ee:	2800      	cmp	r0, #0
 80008f0:	d011      	beq.n	8000916 <USART1_IRQHandler+0x32>
 80008f2:	480b      	ldr	r0, [pc, #44]	; (8000920 <USART1_IRQHandler+0x3c>)
 80008f4:	f000 fb2a 	bl	8000f4c <USART_ReceiveData>
 80008f8:	4b0b      	ldr	r3, [pc, #44]	; (8000928 <USART1_IRQHandler+0x44>)
 80008fa:	490c      	ldr	r1, [pc, #48]	; (800092c <USART1_IRQHandler+0x48>)
 80008fc:	881a      	ldrh	r2, [r3, #0]
 80008fe:	b2c0      	uxtb	r0, r0
 8000900:	b292      	uxth	r2, r2
 8000902:	5488      	strb	r0, [r1, r2]
 8000904:	881a      	ldrh	r2, [r3, #0]
 8000906:	3201      	adds	r2, #1
 8000908:	b292      	uxth	r2, r2
 800090a:	801a      	strh	r2, [r3, #0]
 800090c:	881a      	ldrh	r2, [r3, #0]
 800090e:	2a0f      	cmp	r2, #15
 8000910:	d901      	bls.n	8000916 <USART1_IRQHandler+0x32>
 8000912:	2200      	movs	r2, #0
 8000914:	801a      	strh	r2, [r3, #0]
 8000916:	4802      	ldr	r0, [pc, #8]	; (8000920 <USART1_IRQHandler+0x3c>)
 8000918:	4902      	ldr	r1, [pc, #8]	; (8000924 <USART1_IRQHandler+0x40>)
 800091a:	f000 fb3a 	bl	8000f92 <USART_ClearITPendingBit>
 800091e:	bd08      	pop	{r3, pc}
 8000920:	40013800 	.word	0x40013800
 8000924:	00050105 	.word	0x00050105
 8000928:	200008c0 	.word	0x200008c0
 800092c:	200008b0 	.word	0x200008b0

08000930 <uart_init>:
 8000930:	b530      	push	{r4, r5, lr}
 8000932:	4a21      	ldr	r2, [pc, #132]	; (80009b8 <uart_init+0x88>)
 8000934:	2300      	movs	r3, #0
 8000936:	8013      	strh	r3, [r2, #0]
 8000938:	4a20      	ldr	r2, [pc, #128]	; (80009bc <uart_init+0x8c>)
 800093a:	b089      	sub	sp, #36	; 0x24
 800093c:	8013      	strh	r3, [r2, #0]
 800093e:	4a20      	ldr	r2, [pc, #128]	; (80009c0 <uart_init+0x90>)
 8000940:	2400      	movs	r4, #0
 8000942:	54d4      	strb	r4, [r2, r3]
 8000944:	3301      	adds	r3, #1
 8000946:	2b10      	cmp	r3, #16
 8000948:	d1f9      	bne.n	800093e <uart_init+0xe>
 800094a:	2080      	movs	r0, #128	; 0x80
 800094c:	0280      	lsls	r0, r0, #10
 800094e:	2101      	movs	r1, #1
 8000950:	f000 fc18 	bl	8001184 <RCC_AHBPeriphClockCmd>
 8000954:	2080      	movs	r0, #128	; 0x80
 8000956:	01c0      	lsls	r0, r0, #7
 8000958:	2101      	movs	r1, #1
 800095a:	f000 fc1f 	bl	800119c <RCC_APB2PeriphClockCmd>
 800095e:	2090      	movs	r0, #144	; 0x90
 8000960:	05c0      	lsls	r0, r0, #23
 8000962:	2102      	movs	r1, #2
 8000964:	2201      	movs	r2, #1
 8000966:	f000 fa22 	bl	8000dae <GPIO_PinAFConfig>
 800096a:	2090      	movs	r0, #144	; 0x90
 800096c:	05c0      	lsls	r0, r0, #23
 800096e:	210f      	movs	r1, #15
 8000970:	2201      	movs	r2, #1
 8000972:	f000 fa1c 	bl	8000dae <GPIO_PinAFConfig>
 8000976:	4b13      	ldr	r3, [pc, #76]	; (80009c4 <uart_init+0x94>)
 8000978:	2090      	movs	r0, #144	; 0x90
 800097a:	466a      	mov	r2, sp
 800097c:	2501      	movs	r5, #1
 800097e:	9300      	str	r3, [sp, #0]
 8000980:	4669      	mov	r1, sp
 8000982:	2302      	movs	r3, #2
 8000984:	05c0      	lsls	r0, r0, #23
 8000986:	7113      	strb	r3, [r2, #4]
 8000988:	7155      	strb	r5, [r2, #5]
 800098a:	7194      	strb	r4, [r2, #6]
 800098c:	71d5      	strb	r5, [r2, #7]
 800098e:	f000 f9cf 	bl	8000d30 <GPIO_Init>
 8000992:	23e1      	movs	r3, #225	; 0xe1
 8000994:	025b      	lsls	r3, r3, #9
 8000996:	9302      	str	r3, [sp, #8]
 8000998:	a902      	add	r1, sp, #8
 800099a:	230c      	movs	r3, #12
 800099c:	480a      	ldr	r0, [pc, #40]	; (80009c8 <uart_init+0x98>)
 800099e:	9306      	str	r3, [sp, #24]
 80009a0:	9403      	str	r4, [sp, #12]
 80009a2:	9404      	str	r4, [sp, #16]
 80009a4:	9405      	str	r4, [sp, #20]
 80009a6:	9407      	str	r4, [sp, #28]
 80009a8:	f000 fa66 	bl	8000e78 <USART_Init>
 80009ac:	4806      	ldr	r0, [pc, #24]	; (80009c8 <uart_init+0x98>)
 80009ae:	1c29      	adds	r1, r5, #0
 80009b0:	f000 fac2 	bl	8000f38 <USART_Cmd>
 80009b4:	b009      	add	sp, #36	; 0x24
 80009b6:	bd30      	pop	{r4, r5, pc}
 80009b8:	200008c0 	.word	0x200008c0
 80009bc:	200008c2 	.word	0x200008c2
 80009c0:	200008b0 	.word	0x200008b0
 80009c4:	00008004 	.word	0x00008004
 80009c8:	40013800 	.word	0x40013800

080009cc <i2c_delay>:
 80009cc:	46c0      	nop			; (mov r8, r8)
 80009ce:	46c0      	nop			; (mov r8, r8)
 80009d0:	4770      	bx	lr

080009d2 <SetLowSDA>:
 80009d2:	b508      	push	{r3, lr}
 80009d4:	b672      	cpsid	i
 80009d6:	2390      	movs	r3, #144	; 0x90
 80009d8:	2280      	movs	r2, #128	; 0x80
 80009da:	05db      	lsls	r3, r3, #23
 80009dc:	0112      	lsls	r2, r2, #4
 80009de:	851a      	strh	r2, [r3, #40]	; 0x28
 80009e0:	685a      	ldr	r2, [r3, #4]
 80009e2:	b292      	uxth	r2, r2
 80009e4:	809a      	strh	r2, [r3, #4]
 80009e6:	6819      	ldr	r1, [r3, #0]
 80009e8:	2280      	movs	r2, #128	; 0x80
 80009ea:	03d2      	lsls	r2, r2, #15
 80009ec:	430a      	orrs	r2, r1
 80009ee:	601a      	str	r2, [r3, #0]
 80009f0:	b662      	cpsie	i
 80009f2:	f7ff ffeb 	bl	80009cc <i2c_delay>
 80009f6:	bd08      	pop	{r3, pc}

080009f8 <SetHighSDA>:
 80009f8:	b508      	push	{r3, lr}
 80009fa:	b672      	cpsid	i
 80009fc:	2390      	movs	r3, #144	; 0x90
 80009fe:	2280      	movs	r2, #128	; 0x80
 8000a00:	05db      	lsls	r3, r3, #23
 8000a02:	0112      	lsls	r2, r2, #4
 8000a04:	619a      	str	r2, [r3, #24]
 8000a06:	6859      	ldr	r1, [r3, #4]
 8000a08:	4a05      	ldr	r2, [pc, #20]	; (8000a20 <SetHighSDA+0x28>)
 8000a0a:	400a      	ands	r2, r1
 8000a0c:	809a      	strh	r2, [r3, #4]
 8000a0e:	6819      	ldr	r1, [r3, #0]
 8000a10:	4a04      	ldr	r2, [pc, #16]	; (8000a24 <SetHighSDA+0x2c>)
 8000a12:	400a      	ands	r2, r1
 8000a14:	601a      	str	r2, [r3, #0]
 8000a16:	b662      	cpsie	i
 8000a18:	f7ff ffd8 	bl	80009cc <i2c_delay>
 8000a1c:	bd08      	pop	{r3, pc}
 8000a1e:	46c0      	nop			; (mov r8, r8)
 8000a20:	0000f7ff 	.word	0x0000f7ff
 8000a24:	ff3fffff 	.word	0xff3fffff

08000a28 <SetHighSCL>:
 8000a28:	b508      	push	{r3, lr}
 8000a2a:	2280      	movs	r2, #128	; 0x80
 8000a2c:	2390      	movs	r3, #144	; 0x90
 8000a2e:	0052      	lsls	r2, r2, #1
 8000a30:	05db      	lsls	r3, r3, #23
 8000a32:	619a      	str	r2, [r3, #24]
 8000a34:	f7ff ffca 	bl	80009cc <i2c_delay>
 8000a38:	bd08      	pop	{r3, pc}

08000a3a <i2c_0_init>:
 8000a3a:	b507      	push	{r0, r1, r2, lr}
 8000a3c:	2390      	movs	r3, #144	; 0x90
 8000a3e:	011b      	lsls	r3, r3, #4
 8000a40:	4669      	mov	r1, sp
 8000a42:	9300      	str	r3, [sp, #0]
 8000a44:	2090      	movs	r0, #144	; 0x90
 8000a46:	2301      	movs	r3, #1
 8000a48:	710b      	strb	r3, [r1, #4]
 8000a4a:	2203      	movs	r2, #3
 8000a4c:	2300      	movs	r3, #0
 8000a4e:	05c0      	lsls	r0, r0, #23
 8000a50:	718b      	strb	r3, [r1, #6]
 8000a52:	714a      	strb	r2, [r1, #5]
 8000a54:	71cb      	strb	r3, [r1, #7]
 8000a56:	f000 f96b 	bl	8000d30 <GPIO_Init>
 8000a5a:	f7ff ffe5 	bl	8000a28 <SetHighSCL>
 8000a5e:	f7ff ffb8 	bl	80009d2 <SetLowSDA>
 8000a62:	f7ff ffc9 	bl	80009f8 <SetHighSDA>
 8000a66:	bd07      	pop	{r0, r1, r2, pc}

08000a68 <sys_tick_init>:
 8000a68:	4b03      	ldr	r3, [pc, #12]	; (8000a78 <sys_tick_init+0x10>)
 8000a6a:	4a04      	ldr	r2, [pc, #16]	; (8000a7c <sys_tick_init+0x14>)
 8000a6c:	605a      	str	r2, [r3, #4]
 8000a6e:	2200      	movs	r2, #0
 8000a70:	609a      	str	r2, [r3, #8]
 8000a72:	2207      	movs	r2, #7
 8000a74:	601a      	str	r2, [r3, #0]
 8000a76:	4770      	bx	lr
 8000a78:	e000e010 	.word	0xe000e010
 8000a7c:	0000bb80 	.word	0x0000bb80

08000a80 <sleep>:
 8000a80:	bf30      	wfi
 8000a82:	4770      	bx	lr

08000a84 <SetSysClock>:
 8000a84:	2300      	movs	r3, #0
 8000a86:	b082      	sub	sp, #8
 8000a88:	9300      	str	r3, [sp, #0]
 8000a8a:	9301      	str	r3, [sp, #4]
 8000a8c:	4b14      	ldr	r3, [pc, #80]	; (8000ae0 <SetSysClock+0x5c>)
 8000a8e:	2211      	movs	r2, #17
 8000a90:	601a      	str	r2, [r3, #0]
 8000a92:	4b14      	ldr	r3, [pc, #80]	; (8000ae4 <SetSysClock+0x60>)
 8000a94:	685a      	ldr	r2, [r3, #4]
 8000a96:	605a      	str	r2, [r3, #4]
 8000a98:	685a      	ldr	r2, [r3, #4]
 8000a9a:	605a      	str	r2, [r3, #4]
 8000a9c:	6859      	ldr	r1, [r3, #4]
 8000a9e:	4a12      	ldr	r2, [pc, #72]	; (8000ae8 <SetSysClock+0x64>)
 8000aa0:	400a      	ands	r2, r1
 8000aa2:	605a      	str	r2, [r3, #4]
 8000aa4:	6859      	ldr	r1, [r3, #4]
 8000aa6:	22a0      	movs	r2, #160	; 0xa0
 8000aa8:	0392      	lsls	r2, r2, #14
 8000aaa:	430a      	orrs	r2, r1
 8000aac:	605a      	str	r2, [r3, #4]
 8000aae:	6819      	ldr	r1, [r3, #0]
 8000ab0:	2280      	movs	r2, #128	; 0x80
 8000ab2:	0452      	lsls	r2, r2, #17
 8000ab4:	430a      	orrs	r2, r1
 8000ab6:	601a      	str	r2, [r3, #0]
 8000ab8:	6819      	ldr	r1, [r3, #0]
 8000aba:	4a0a      	ldr	r2, [pc, #40]	; (8000ae4 <SetSysClock+0x60>)
 8000abc:	0188      	lsls	r0, r1, #6
 8000abe:	d5fb      	bpl.n	8000ab8 <SetSysClock+0x34>
 8000ac0:	6851      	ldr	r1, [r2, #4]
 8000ac2:	2003      	movs	r0, #3
 8000ac4:	4381      	bics	r1, r0
 8000ac6:	6051      	str	r1, [r2, #4]
 8000ac8:	6851      	ldr	r1, [r2, #4]
 8000aca:	2002      	movs	r0, #2
 8000acc:	4301      	orrs	r1, r0
 8000ace:	6051      	str	r1, [r2, #4]
 8000ad0:	6859      	ldr	r1, [r3, #4]
 8000ad2:	220c      	movs	r2, #12
 8000ad4:	400a      	ands	r2, r1
 8000ad6:	2a08      	cmp	r2, #8
 8000ad8:	d1fa      	bne.n	8000ad0 <SetSysClock+0x4c>
 8000ada:	b002      	add	sp, #8
 8000adc:	4770      	bx	lr
 8000ade:	46c0      	nop			; (mov r8, r8)
 8000ae0:	40022000 	.word	0x40022000
 8000ae4:	40021000 	.word	0x40021000
 8000ae8:	ffc07fff 	.word	0xffc07fff

08000aec <SystemInit>:
 8000aec:	b508      	push	{r3, lr}
 8000aee:	4b12      	ldr	r3, [pc, #72]	; (8000b38 <SystemInit+0x4c>)
 8000af0:	2201      	movs	r2, #1
 8000af2:	6819      	ldr	r1, [r3, #0]
 8000af4:	4311      	orrs	r1, r2
 8000af6:	6019      	str	r1, [r3, #0]
 8000af8:	6858      	ldr	r0, [r3, #4]
 8000afa:	4910      	ldr	r1, [pc, #64]	; (8000b3c <SystemInit+0x50>)
 8000afc:	4001      	ands	r1, r0
 8000afe:	6059      	str	r1, [r3, #4]
 8000b00:	6818      	ldr	r0, [r3, #0]
 8000b02:	490f      	ldr	r1, [pc, #60]	; (8000b40 <SystemInit+0x54>)
 8000b04:	4001      	ands	r1, r0
 8000b06:	6019      	str	r1, [r3, #0]
 8000b08:	6818      	ldr	r0, [r3, #0]
 8000b0a:	490e      	ldr	r1, [pc, #56]	; (8000b44 <SystemInit+0x58>)
 8000b0c:	4001      	ands	r1, r0
 8000b0e:	6019      	str	r1, [r3, #0]
 8000b10:	6858      	ldr	r0, [r3, #4]
 8000b12:	490d      	ldr	r1, [pc, #52]	; (8000b48 <SystemInit+0x5c>)
 8000b14:	4001      	ands	r1, r0
 8000b16:	6059      	str	r1, [r3, #4]
 8000b18:	6ad9      	ldr	r1, [r3, #44]	; 0x2c
 8000b1a:	200f      	movs	r0, #15
 8000b1c:	4381      	bics	r1, r0
 8000b1e:	62d9      	str	r1, [r3, #44]	; 0x2c
 8000b20:	6b18      	ldr	r0, [r3, #48]	; 0x30
 8000b22:	490a      	ldr	r1, [pc, #40]	; (8000b4c <SystemInit+0x60>)
 8000b24:	4001      	ands	r1, r0
 8000b26:	6319      	str	r1, [r3, #48]	; 0x30
 8000b28:	6b59      	ldr	r1, [r3, #52]	; 0x34
 8000b2a:	4391      	bics	r1, r2
 8000b2c:	2200      	movs	r2, #0
 8000b2e:	6359      	str	r1, [r3, #52]	; 0x34
 8000b30:	609a      	str	r2, [r3, #8]
 8000b32:	f7ff ffa7 	bl	8000a84 <SetSysClock>
 8000b36:	bd08      	pop	{r3, pc}
 8000b38:	40021000 	.word	0x40021000
 8000b3c:	f8ffb80c 	.word	0xf8ffb80c
 8000b40:	fef6ffff 	.word	0xfef6ffff
 8000b44:	fffbffff 	.word	0xfffbffff
 8000b48:	ffc0ffff 	.word	0xffc0ffff
 8000b4c:	fffffeac 	.word	0xfffffeac

08000b50 <lib_low_level_init>:
 8000b50:	b508      	push	{r3, lr}
 8000b52:	f7ff ffcb 	bl	8000aec <SystemInit>
 8000b56:	f000 fb39 	bl	80011cc <gpio_init>
 8000b5a:	f7ff fee9 	bl	8000930 <uart_init>
 8000b5e:	f7ff fe15 	bl	800078c <timer_init>
 8000b62:	f7ff ff6a 	bl	8000a3a <i2c_0_init>
 8000b66:	bd08      	pop	{r3, pc}

08000b68 <TIM14_IRQHandler>:
 8000b68:	b570      	push	{r4, r5, r6, lr}
 8000b6a:	4b60      	ldr	r3, [pc, #384]	; (8000cec <TIM14_IRQHandler+0x184>)
 8000b6c:	7818      	ldrb	r0, [r3, #0]
 8000b6e:	b2c0      	uxtb	r0, r0
 8000b70:	2803      	cmp	r0, #3
 8000b72:	d83f      	bhi.n	8000bf4 <TIM14_IRQHandler+0x8c>
 8000b74:	f000 fcfa 	bl	800156c <__gnu_thumb1_case_uqi>
 8000b78:	32220a02 	.word	0x32220a02
 8000b7c:	2280      	movs	r2, #128	; 0x80
 8000b7e:	2390      	movs	r3, #144	; 0x90
 8000b80:	0052      	lsls	r2, r2, #1
 8000b82:	05db      	lsls	r3, r3, #23
 8000b84:	851a      	strh	r2, [r3, #40]	; 0x28
 8000b86:	2200      	movs	r2, #0
 8000b88:	4b59      	ldr	r3, [pc, #356]	; (8000cf0 <TIM14_IRQHandler+0x188>)
 8000b8a:	e032      	b.n	8000bf2 <TIM14_IRQHandler+0x8a>
 8000b8c:	4a58      	ldr	r2, [pc, #352]	; (8000cf0 <TIM14_IRQHandler+0x188>)
 8000b8e:	7811      	ldrb	r1, [r2, #0]
 8000b90:	290d      	cmp	r1, #13
 8000b92:	d901      	bls.n	8000b98 <TIM14_IRQHandler+0x30>
 8000b94:	2200      	movs	r2, #0
 8000b96:	e02c      	b.n	8000bf2 <TIM14_IRQHandler+0x8a>
 8000b98:	7811      	ldrb	r1, [r2, #0]
 8000b9a:	4856      	ldr	r0, [pc, #344]	; (8000cf4 <TIM14_IRQHandler+0x18c>)
 8000b9c:	5c41      	ldrb	r1, [r0, r1]
 8000b9e:	20ff      	movs	r0, #255	; 0xff
 8000ba0:	4388      	bics	r0, r1
 8000ba2:	0040      	lsls	r0, r0, #1
 8000ba4:	2101      	movs	r1, #1
 8000ba6:	4308      	orrs	r0, r1
 8000ba8:	4953      	ldr	r1, [pc, #332]	; (8000cf8 <TIM14_IRQHandler+0x190>)
 8000baa:	8008      	strh	r0, [r1, #0]
 8000bac:	7811      	ldrb	r1, [r2, #0]
 8000bae:	3101      	adds	r1, #1
 8000bb0:	b2c9      	uxtb	r1, r1
 8000bb2:	7011      	strb	r1, [r2, #0]
 8000bb4:	4a51      	ldr	r2, [pc, #324]	; (8000cfc <TIM14_IRQHandler+0x194>)
 8000bb6:	2100      	movs	r1, #0
 8000bb8:	7011      	strb	r1, [r2, #0]
 8000bba:	e019      	b.n	8000bf0 <TIM14_IRQHandler+0x88>
 8000bbc:	4a4e      	ldr	r2, [pc, #312]	; (8000cf8 <TIM14_IRQHandler+0x190>)
 8000bbe:	2190      	movs	r1, #144	; 0x90
 8000bc0:	8814      	ldrh	r4, [r2, #0]
 8000bc2:	2080      	movs	r0, #128	; 0x80
 8000bc4:	05c9      	lsls	r1, r1, #23
 8000bc6:	0040      	lsls	r0, r0, #1
 8000bc8:	07e5      	lsls	r5, r4, #31
 8000bca:	d501      	bpl.n	8000bd0 <TIM14_IRQHandler+0x68>
 8000bcc:	6188      	str	r0, [r1, #24]
 8000bce:	e000      	b.n	8000bd2 <TIM14_IRQHandler+0x6a>
 8000bd0:	8508      	strh	r0, [r1, #40]	; 0x28
 8000bd2:	8811      	ldrh	r1, [r2, #0]
 8000bd4:	0849      	lsrs	r1, r1, #1
 8000bd6:	8011      	strh	r1, [r2, #0]
 8000bd8:	2203      	movs	r2, #3
 8000bda:	e00a      	b.n	8000bf2 <TIM14_IRQHandler+0x8a>
 8000bdc:	4a47      	ldr	r2, [pc, #284]	; (8000cfc <TIM14_IRQHandler+0x194>)
 8000bde:	7811      	ldrb	r1, [r2, #0]
 8000be0:	3101      	adds	r1, #1
 8000be2:	b2c9      	uxtb	r1, r1
 8000be4:	7011      	strb	r1, [r2, #0]
 8000be6:	7812      	ldrb	r2, [r2, #0]
 8000be8:	2a09      	cmp	r2, #9
 8000bea:	d901      	bls.n	8000bf0 <TIM14_IRQHandler+0x88>
 8000bec:	2201      	movs	r2, #1
 8000bee:	e000      	b.n	8000bf2 <TIM14_IRQHandler+0x8a>
 8000bf0:	2202      	movs	r2, #2
 8000bf2:	701a      	strb	r2, [r3, #0]
 8000bf4:	4b42      	ldr	r3, [pc, #264]	; (8000d00 <TIM14_IRQHandler+0x198>)
 8000bf6:	2104      	movs	r1, #4
 8000bf8:	6c1a      	ldr	r2, [r3, #64]	; 0x40
 8000bfa:	6019      	str	r1, [r3, #0]
 8000bfc:	6898      	ldr	r0, [r3, #8]
 8000bfe:	4301      	orrs	r1, r0
 8000c00:	6099      	str	r1, [r3, #8]
 8000c02:	4b40      	ldr	r3, [pc, #256]	; (8000d04 <TIM14_IRQHandler+0x19c>)
 8000c04:	2101      	movs	r1, #1
 8000c06:	429a      	cmp	r2, r3
 8000c08:	d80b      	bhi.n	8000c22 <TIM14_IRQHandler+0xba>
 8000c0a:	4b3f      	ldr	r3, [pc, #252]	; (8000d08 <TIM14_IRQHandler+0x1a0>)
 8000c0c:	2480      	movs	r4, #128	; 0x80
 8000c0e:	6818      	ldr	r0, [r3, #0]
 8000c10:	0164      	lsls	r4, r4, #5
 8000c12:	1901      	adds	r1, r0, r4
 8000c14:	1a8a      	subs	r2, r1, r2
 8000c16:	601a      	str	r2, [r3, #0]
 8000c18:	4b3c      	ldr	r3, [pc, #240]	; (8000d0c <TIM14_IRQHandler+0x1a4>)
 8000c1a:	2100      	movs	r1, #0
 8000c1c:	681a      	ldr	r2, [r3, #0]
 8000c1e:	3201      	adds	r2, #1
 8000c20:	601a      	str	r2, [r3, #0]
 8000c22:	4b3b      	ldr	r3, [pc, #236]	; (8000d10 <TIM14_IRQHandler+0x1a8>)
 8000c24:	7818      	ldrb	r0, [r3, #0]
 8000c26:	b2c0      	uxtb	r0, r0
 8000c28:	2804      	cmp	r0, #4
 8000c2a:	d85a      	bhi.n	8000ce2 <TIM14_IRQHandler+0x17a>
 8000c2c:	f000 fc9e 	bl	800156c <__gnu_thumb1_case_uqi>
 8000c30:	36110603 	.word	0x36110603
 8000c34:	38          	.byte	0x38
 8000c35:	00          	.byte	0x00
 8000c36:	2200      	movs	r2, #0
 8000c38:	4b36      	ldr	r3, [pc, #216]	; (8000d14 <TIM14_IRQHandler+0x1ac>)
 8000c3a:	e051      	b.n	8000ce0 <TIM14_IRQHandler+0x178>
 8000c3c:	4a35      	ldr	r2, [pc, #212]	; (8000d14 <TIM14_IRQHandler+0x1ac>)
 8000c3e:	7811      	ldrb	r1, [r2, #0]
 8000c40:	2200      	movs	r2, #0
 8000c42:	290d      	cmp	r1, #13
 8000c44:	d84c      	bhi.n	8000ce0 <TIM14_IRQHandler+0x178>
 8000c46:	4934      	ldr	r1, [pc, #208]	; (8000d18 <TIM14_IRQHandler+0x1b0>)
 8000c48:	800a      	strh	r2, [r1, #0]
 8000c4a:	4934      	ldr	r1, [pc, #208]	; (8000d1c <TIM14_IRQHandler+0x1b4>)
 8000c4c:	700a      	strb	r2, [r1, #0]
 8000c4e:	2202      	movs	r2, #2
 8000c50:	e046      	b.n	8000ce0 <TIM14_IRQHandler+0x178>
 8000c52:	4a33      	ldr	r2, [pc, #204]	; (8000d20 <TIM14_IRQHandler+0x1b8>)
 8000c54:	2900      	cmp	r1, #0
 8000c56:	d103      	bne.n	8000c60 <TIM14_IRQHandler+0xf8>
 8000c58:	2003      	movs	r0, #3
 8000c5a:	7018      	strb	r0, [r3, #0]
 8000c5c:	6011      	str	r1, [r2, #0]
 8000c5e:	e040      	b.n	8000ce2 <TIM14_IRQHandler+0x17a>
 8000c60:	6811      	ldr	r1, [r2, #0]
 8000c62:	3101      	adds	r1, #1
 8000c64:	6011      	str	r1, [r2, #0]
 8000c66:	6810      	ldr	r0, [r2, #0]
 8000c68:	21d2      	movs	r1, #210	; 0xd2
 8000c6a:	0049      	lsls	r1, r1, #1
 8000c6c:	4288      	cmp	r0, r1
 8000c6e:	d938      	bls.n	8000ce2 <TIM14_IRQHandler+0x17a>
 8000c70:	2100      	movs	r1, #0
 8000c72:	6011      	str	r1, [r2, #0]
 8000c74:	4e25      	ldr	r6, [pc, #148]	; (8000d0c <TIM14_IRQHandler+0x1a4>)
 8000c76:	4a27      	ldr	r2, [pc, #156]	; (8000d14 <TIM14_IRQHandler+0x1ac>)
 8000c78:	4c23      	ldr	r4, [pc, #140]	; (8000d08 <TIM14_IRQHandler+0x1a0>)
 8000c7a:	7011      	strb	r1, [r2, #0]
 8000c7c:	6831      	ldr	r1, [r6, #0]
 8000c7e:	2201      	movs	r2, #1
 8000c80:	701a      	strb	r2, [r3, #0]
 8000c82:	4d28      	ldr	r5, [pc, #160]	; (8000d24 <TIM14_IRQHandler+0x1bc>)
 8000c84:	2900      	cmp	r1, #0
 8000c86:	d004      	beq.n	8000c92 <TIM14_IRQHandler+0x12a>
 8000c88:	6820      	ldr	r0, [r4, #0]
 8000c8a:	f000 fc79 	bl	8001580 <__aeabi_uidiv>
 8000c8e:	6028      	str	r0, [r5, #0]
 8000c90:	e000      	b.n	8000c94 <TIM14_IRQHandler+0x12c>
 8000c92:	6029      	str	r1, [r5, #0]
 8000c94:	2300      	movs	r3, #0
 8000c96:	6023      	str	r3, [r4, #0]
 8000c98:	6033      	str	r3, [r6, #0]
 8000c9a:	e022      	b.n	8000ce2 <TIM14_IRQHandler+0x17a>
 8000c9c:	2204      	movs	r2, #4
 8000c9e:	e01f      	b.n	8000ce0 <TIM14_IRQHandler+0x178>
 8000ca0:	4a1e      	ldr	r2, [pc, #120]	; (8000d1c <TIM14_IRQHandler+0x1b4>)
 8000ca2:	2900      	cmp	r1, #0
 8000ca4:	d008      	beq.n	8000cb8 <TIM14_IRQHandler+0x150>
 8000ca6:	491c      	ldr	r1, [pc, #112]	; (8000d18 <TIM14_IRQHandler+0x1b0>)
 8000ca8:	2501      	movs	r5, #1
 8000caa:	880c      	ldrh	r4, [r1, #0]
 8000cac:	7810      	ldrb	r0, [r2, #0]
 8000cae:	4085      	lsls	r5, r0
 8000cb0:	1c28      	adds	r0, r5, #0
 8000cb2:	4320      	orrs	r0, r4
 8000cb4:	b280      	uxth	r0, r0
 8000cb6:	8008      	strh	r0, [r1, #0]
 8000cb8:	7811      	ldrb	r1, [r2, #0]
 8000cba:	3101      	adds	r1, #1
 8000cbc:	b2c9      	uxtb	r1, r1
 8000cbe:	7011      	strb	r1, [r2, #0]
 8000cc0:	7812      	ldrb	r2, [r2, #0]
 8000cc2:	2a07      	cmp	r2, #7
 8000cc4:	d90b      	bls.n	8000cde <TIM14_IRQHandler+0x176>
 8000cc6:	4a13      	ldr	r2, [pc, #76]	; (8000d14 <TIM14_IRQHandler+0x1ac>)
 8000cc8:	4813      	ldr	r0, [pc, #76]	; (8000d18 <TIM14_IRQHandler+0x1b0>)
 8000cca:	7811      	ldrb	r1, [r2, #0]
 8000ccc:	8804      	ldrh	r4, [r0, #0]
 8000cce:	4816      	ldr	r0, [pc, #88]	; (8000d28 <TIM14_IRQHandler+0x1c0>)
 8000cd0:	5444      	strb	r4, [r0, r1]
 8000cd2:	7811      	ldrb	r1, [r2, #0]
 8000cd4:	3101      	adds	r1, #1
 8000cd6:	b2c9      	uxtb	r1, r1
 8000cd8:	7011      	strb	r1, [r2, #0]
 8000cda:	2201      	movs	r2, #1
 8000cdc:	e000      	b.n	8000ce0 <TIM14_IRQHandler+0x178>
 8000cde:	2203      	movs	r2, #3
 8000ce0:	701a      	strb	r2, [r3, #0]
 8000ce2:	4b12      	ldr	r3, [pc, #72]	; (8000d2c <TIM14_IRQHandler+0x1c4>)
 8000ce4:	2200      	movs	r2, #0
 8000ce6:	821a      	strh	r2, [r3, #16]
 8000ce8:	bd70      	pop	{r4, r5, r6, pc}
 8000cea:	46c0      	nop			; (mov r8, r8)
 8000cec:	200008e3 	.word	0x200008e3
 8000cf0:	200008c6 	.word	0x200008c6
 8000cf4:	200008d5 	.word	0x200008d5
 8000cf8:	200008ea 	.word	0x200008ea
 8000cfc:	200008f8 	.word	0x200008f8
 8000d00:	40012400 	.word	0x40012400
 8000d04:	000003e7 	.word	0x000003e7
 8000d08:	200008f4 	.word	0x200008f4
 8000d0c:	200008fc 	.word	0x200008fc
 8000d10:	200008e8 	.word	0x200008e8
 8000d14:	200008ec 	.word	0x200008ec
 8000d18:	200008c4 	.word	0x200008c4
 8000d1c:	200008ed 	.word	0x200008ed
 8000d20:	200008f0 	.word	0x200008f0
 8000d24:	200008e4 	.word	0x200008e4
 8000d28:	200008c7 	.word	0x200008c7
 8000d2c:	40002000 	.word	0x40002000

08000d30 <GPIO_Init>:
 8000d30:	b5f7      	push	{r0, r1, r2, r4, r5, r6, r7, lr}
 8000d32:	680b      	ldr	r3, [r1, #0]
 8000d34:	9301      	str	r3, [sp, #4]
 8000d36:	2300      	movs	r3, #0
 8000d38:	2201      	movs	r2, #1
 8000d3a:	9c01      	ldr	r4, [sp, #4]
 8000d3c:	409a      	lsls	r2, r3
 8000d3e:	4014      	ands	r4, r2
 8000d40:	4294      	cmp	r4, r2
 8000d42:	d130      	bne.n	8000da6 <GPIO_Init+0x76>
 8000d44:	790a      	ldrb	r2, [r1, #4]
 8000d46:	1e55      	subs	r5, r2, #1
 8000d48:	b2ed      	uxtb	r5, r5
 8000d4a:	2d01      	cmp	r5, #1
 8000d4c:	d817      	bhi.n	8000d7e <GPIO_Init+0x4e>
 8000d4e:	794d      	ldrb	r5, [r1, #5]
 8000d50:	6887      	ldr	r7, [r0, #8]
 8000d52:	9500      	str	r5, [sp, #0]
 8000d54:	2603      	movs	r6, #3
 8000d56:	005d      	lsls	r5, r3, #1
 8000d58:	40ae      	lsls	r6, r5
 8000d5a:	43b7      	bics	r7, r6
 8000d5c:	9e00      	ldr	r6, [sp, #0]
 8000d5e:	6087      	str	r7, [r0, #8]
 8000d60:	6887      	ldr	r7, [r0, #8]
 8000d62:	40ae      	lsls	r6, r5
 8000d64:	1c35      	adds	r5, r6, #0
 8000d66:	433d      	orrs	r5, r7
 8000d68:	6085      	str	r5, [r0, #8]
 8000d6a:	6845      	ldr	r5, [r0, #4]
 8000d6c:	b2ad      	uxth	r5, r5
 8000d6e:	43a5      	bics	r5, r4
 8000d70:	8085      	strh	r5, [r0, #4]
 8000d72:	798c      	ldrb	r4, [r1, #6]
 8000d74:	6845      	ldr	r5, [r0, #4]
 8000d76:	409c      	lsls	r4, r3
 8000d78:	432c      	orrs	r4, r5
 8000d7a:	b2a4      	uxth	r4, r4
 8000d7c:	8084      	strh	r4, [r0, #4]
 8000d7e:	005c      	lsls	r4, r3, #1
 8000d80:	2503      	movs	r5, #3
 8000d82:	6806      	ldr	r6, [r0, #0]
 8000d84:	40a5      	lsls	r5, r4
 8000d86:	43ed      	mvns	r5, r5
 8000d88:	402e      	ands	r6, r5
 8000d8a:	6006      	str	r6, [r0, #0]
 8000d8c:	6806      	ldr	r6, [r0, #0]
 8000d8e:	40a2      	lsls	r2, r4
 8000d90:	4332      	orrs	r2, r6
 8000d92:	6002      	str	r2, [r0, #0]
 8000d94:	68c2      	ldr	r2, [r0, #12]
 8000d96:	4015      	ands	r5, r2
 8000d98:	60c5      	str	r5, [r0, #12]
 8000d9a:	79cd      	ldrb	r5, [r1, #7]
 8000d9c:	68c2      	ldr	r2, [r0, #12]
 8000d9e:	40a5      	lsls	r5, r4
 8000da0:	1c2c      	adds	r4, r5, #0
 8000da2:	4314      	orrs	r4, r2
 8000da4:	60c4      	str	r4, [r0, #12]
 8000da6:	3301      	adds	r3, #1
 8000da8:	2b10      	cmp	r3, #16
 8000daa:	d1c5      	bne.n	8000d38 <GPIO_Init+0x8>
 8000dac:	bdf7      	pop	{r0, r1, r2, r4, r5, r6, r7, pc}

08000dae <GPIO_PinAFConfig>:
 8000dae:	2307      	movs	r3, #7
 8000db0:	400b      	ands	r3, r1
 8000db2:	08c9      	lsrs	r1, r1, #3
 8000db4:	0089      	lsls	r1, r1, #2
 8000db6:	1840      	adds	r0, r0, r1
 8000db8:	b510      	push	{r4, lr}
 8000dba:	6a01      	ldr	r1, [r0, #32]
 8000dbc:	009b      	lsls	r3, r3, #2
 8000dbe:	240f      	movs	r4, #15
 8000dc0:	409c      	lsls	r4, r3
 8000dc2:	43a1      	bics	r1, r4
 8000dc4:	6201      	str	r1, [r0, #32]
 8000dc6:	6a01      	ldr	r1, [r0, #32]
 8000dc8:	409a      	lsls	r2, r3
 8000dca:	1c13      	adds	r3, r2, #0
 8000dcc:	430b      	orrs	r3, r1
 8000dce:	6203      	str	r3, [r0, #32]
 8000dd0:	bd10      	pop	{r4, pc}
	...

08000dd4 <TIM_TimeBaseInit>:
 8000dd4:	6803      	ldr	r3, [r0, #0]
 8000dd6:	4a16      	ldr	r2, [pc, #88]	; (8000e30 <TIM_TimeBaseInit+0x5c>)
 8000dd8:	b570      	push	{r4, r5, r6, lr}
 8000dda:	b29b      	uxth	r3, r3
 8000ddc:	884d      	ldrh	r5, [r1, #2]
 8000dde:	890c      	ldrh	r4, [r1, #8]
 8000de0:	4290      	cmp	r0, r2
 8000de2:	d006      	beq.n	8000df2 <TIM_TimeBaseInit+0x1e>
 8000de4:	2680      	movs	r6, #128	; 0x80
 8000de6:	05f6      	lsls	r6, r6, #23
 8000de8:	42b0      	cmp	r0, r6
 8000dea:	d002      	beq.n	8000df2 <TIM_TimeBaseInit+0x1e>
 8000dec:	4e11      	ldr	r6, [pc, #68]	; (8000e34 <TIM_TimeBaseInit+0x60>)
 8000dee:	42b0      	cmp	r0, r6
 8000df0:	d102      	bne.n	8000df8 <TIM_TimeBaseInit+0x24>
 8000df2:	2670      	movs	r6, #112	; 0x70
 8000df4:	43b3      	bics	r3, r6
 8000df6:	432b      	orrs	r3, r5
 8000df8:	4d0f      	ldr	r5, [pc, #60]	; (8000e38 <TIM_TimeBaseInit+0x64>)
 8000dfa:	42a8      	cmp	r0, r5
 8000dfc:	d002      	beq.n	8000e04 <TIM_TimeBaseInit+0x30>
 8000dfe:	4d0f      	ldr	r5, [pc, #60]	; (8000e3c <TIM_TimeBaseInit+0x68>)
 8000e00:	402b      	ands	r3, r5
 8000e02:	4323      	orrs	r3, r4
 8000e04:	8003      	strh	r3, [r0, #0]
 8000e06:	684b      	ldr	r3, [r1, #4]
 8000e08:	62c3      	str	r3, [r0, #44]	; 0x2c
 8000e0a:	880b      	ldrh	r3, [r1, #0]
 8000e0c:	8503      	strh	r3, [r0, #40]	; 0x28
 8000e0e:	4290      	cmp	r0, r2
 8000e10:	d008      	beq.n	8000e24 <TIM_TimeBaseInit+0x50>
 8000e12:	4b0b      	ldr	r3, [pc, #44]	; (8000e40 <TIM_TimeBaseInit+0x6c>)
 8000e14:	4298      	cmp	r0, r3
 8000e16:	d005      	beq.n	8000e24 <TIM_TimeBaseInit+0x50>
 8000e18:	4b0a      	ldr	r3, [pc, #40]	; (8000e44 <TIM_TimeBaseInit+0x70>)
 8000e1a:	4298      	cmp	r0, r3
 8000e1c:	d002      	beq.n	8000e24 <TIM_TimeBaseInit+0x50>
 8000e1e:	4b0a      	ldr	r3, [pc, #40]	; (8000e48 <TIM_TimeBaseInit+0x74>)
 8000e20:	4298      	cmp	r0, r3
 8000e22:	d101      	bne.n	8000e28 <TIM_TimeBaseInit+0x54>
 8000e24:	7a8b      	ldrb	r3, [r1, #10]
 8000e26:	8603      	strh	r3, [r0, #48]	; 0x30
 8000e28:	2301      	movs	r3, #1
 8000e2a:	8283      	strh	r3, [r0, #20]
 8000e2c:	bd70      	pop	{r4, r5, r6, pc}
 8000e2e:	46c0      	nop			; (mov r8, r8)
 8000e30:	40012c00 	.word	0x40012c00
 8000e34:	40000400 	.word	0x40000400
 8000e38:	40001000 	.word	0x40001000
 8000e3c:	fffffcff 	.word	0xfffffcff
 8000e40:	40014000 	.word	0x40014000
 8000e44:	40014400 	.word	0x40014400
 8000e48:	40014800 	.word	0x40014800

08000e4c <TIM_Cmd>:
 8000e4c:	6802      	ldr	r2, [r0, #0]
 8000e4e:	2301      	movs	r3, #1
 8000e50:	b292      	uxth	r2, r2
 8000e52:	2900      	cmp	r1, #0
 8000e54:	d001      	beq.n	8000e5a <TIM_Cmd+0xe>
 8000e56:	4313      	orrs	r3, r2
 8000e58:	e001      	b.n	8000e5e <TIM_Cmd+0x12>
 8000e5a:	439a      	bics	r2, r3
 8000e5c:	1c13      	adds	r3, r2, #0
 8000e5e:	8003      	strh	r3, [r0, #0]
 8000e60:	4770      	bx	lr

08000e62 <TIM_ITConfig>:
 8000e62:	68c3      	ldr	r3, [r0, #12]
 8000e64:	b29b      	uxth	r3, r3
 8000e66:	2a00      	cmp	r2, #0
 8000e68:	d002      	beq.n	8000e70 <TIM_ITConfig+0xe>
 8000e6a:	4319      	orrs	r1, r3
 8000e6c:	8181      	strh	r1, [r0, #12]
 8000e6e:	e001      	b.n	8000e74 <TIM_ITConfig+0x12>
 8000e70:	438b      	bics	r3, r1
 8000e72:	8183      	strh	r3, [r0, #12]
 8000e74:	4770      	bx	lr
	...

08000e78 <USART_Init>:
 8000e78:	b5f0      	push	{r4, r5, r6, r7, lr}
 8000e7a:	68ca      	ldr	r2, [r1, #12]
 8000e7c:	1c04      	adds	r4, r0, #0
 8000e7e:	b08d      	sub	sp, #52	; 0x34
 8000e80:	688f      	ldr	r7, [r1, #8]
 8000e82:	6908      	ldr	r0, [r1, #16]
 8000e84:	684e      	ldr	r6, [r1, #4]
 8000e86:	9201      	str	r2, [sp, #4]
 8000e88:	1c0d      	adds	r5, r1, #0
 8000e8a:	694a      	ldr	r2, [r1, #20]
 8000e8c:	6821      	ldr	r1, [r4, #0]
 8000e8e:	2301      	movs	r3, #1
 8000e90:	4399      	bics	r1, r3
 8000e92:	6021      	str	r1, [r4, #0]
 8000e94:	6863      	ldr	r3, [r4, #4]
 8000e96:	4921      	ldr	r1, [pc, #132]	; (8000f1c <USART_Init+0xa4>)
 8000e98:	4019      	ands	r1, r3
 8000e9a:	4339      	orrs	r1, r7
 8000e9c:	6061      	str	r1, [r4, #4]
 8000e9e:	9b01      	ldr	r3, [sp, #4]
 8000ea0:	6827      	ldr	r7, [r4, #0]
 8000ea2:	491f      	ldr	r1, [pc, #124]	; (8000f20 <USART_Init+0xa8>)
 8000ea4:	4333      	orrs	r3, r6
 8000ea6:	4039      	ands	r1, r7
 8000ea8:	4303      	orrs	r3, r0
 8000eaa:	430b      	orrs	r3, r1
 8000eac:	6023      	str	r3, [r4, #0]
 8000eae:	68a1      	ldr	r1, [r4, #8]
 8000eb0:	4b1c      	ldr	r3, [pc, #112]	; (8000f24 <USART_Init+0xac>)
 8000eb2:	a802      	add	r0, sp, #8
 8000eb4:	400b      	ands	r3, r1
 8000eb6:	4313      	orrs	r3, r2
 8000eb8:	60a3      	str	r3, [r4, #8]
 8000eba:	f000 f89f 	bl	8000ffc <RCC_GetClocksFreq>
 8000ebe:	4b1a      	ldr	r3, [pc, #104]	; (8000f28 <USART_Init+0xb0>)
 8000ec0:	429c      	cmp	r4, r3
 8000ec2:	d101      	bne.n	8000ec8 <USART_Init+0x50>
 8000ec4:	9e08      	ldr	r6, [sp, #32]
 8000ec6:	e00a      	b.n	8000ede <USART_Init+0x66>
 8000ec8:	4b18      	ldr	r3, [pc, #96]	; (8000f2c <USART_Init+0xb4>)
 8000eca:	429c      	cmp	r4, r3
 8000ecc:	d101      	bne.n	8000ed2 <USART_Init+0x5a>
 8000ece:	9e09      	ldr	r6, [sp, #36]	; 0x24
 8000ed0:	e005      	b.n	8000ede <USART_Init+0x66>
 8000ed2:	4b17      	ldr	r3, [pc, #92]	; (8000f30 <USART_Init+0xb8>)
 8000ed4:	429c      	cmp	r4, r3
 8000ed6:	d101      	bne.n	8000edc <USART_Init+0x64>
 8000ed8:	9e0a      	ldr	r6, [sp, #40]	; 0x28
 8000eda:	e000      	b.n	8000ede <USART_Init+0x66>
 8000edc:	9e04      	ldr	r6, [sp, #16]
 8000ede:	6823      	ldr	r3, [r4, #0]
 8000ee0:	682f      	ldr	r7, [r5, #0]
 8000ee2:	041a      	lsls	r2, r3, #16
 8000ee4:	d500      	bpl.n	8000ee8 <USART_Init+0x70>
 8000ee6:	0076      	lsls	r6, r6, #1
 8000ee8:	1c39      	adds	r1, r7, #0
 8000eea:	1c30      	adds	r0, r6, #0
 8000eec:	f000 fb48 	bl	8001580 <__aeabi_uidiv>
 8000ef0:	1c39      	adds	r1, r7, #0
 8000ef2:	1c05      	adds	r5, r0, #0
 8000ef4:	1c30      	adds	r0, r6, #0
 8000ef6:	f000 fb87 	bl	8001608 <__aeabi_uidivmod>
 8000efa:	087f      	lsrs	r7, r7, #1
 8000efc:	2300      	movs	r3, #0
 8000efe:	42b9      	cmp	r1, r7
 8000f00:	415b      	adcs	r3, r3
 8000f02:	18ed      	adds	r5, r5, r3
 8000f04:	6823      	ldr	r3, [r4, #0]
 8000f06:	041a      	lsls	r2, r3, #16
 8000f08:	d504      	bpl.n	8000f14 <USART_Init+0x9c>
 8000f0a:	4a0a      	ldr	r2, [pc, #40]	; (8000f34 <USART_Init+0xbc>)
 8000f0c:	072b      	lsls	r3, r5, #28
 8000f0e:	0f5b      	lsrs	r3, r3, #29
 8000f10:	4015      	ands	r5, r2
 8000f12:	431d      	orrs	r5, r3
 8000f14:	b2ad      	uxth	r5, r5
 8000f16:	81a5      	strh	r5, [r4, #12]
 8000f18:	b00d      	add	sp, #52	; 0x34
 8000f1a:	bdf0      	pop	{r4, r5, r6, r7, pc}
 8000f1c:	ffffcfff 	.word	0xffffcfff
 8000f20:	ffffe9f3 	.word	0xffffe9f3
 8000f24:	fffffcff 	.word	0xfffffcff
 8000f28:	40013800 	.word	0x40013800
 8000f2c:	40004400 	.word	0x40004400
 8000f30:	40004800 	.word	0x40004800
 8000f34:	0000fff0 	.word	0x0000fff0

08000f38 <USART_Cmd>:
 8000f38:	2301      	movs	r3, #1
 8000f3a:	6802      	ldr	r2, [r0, #0]
 8000f3c:	2900      	cmp	r1, #0
 8000f3e:	d001      	beq.n	8000f44 <USART_Cmd+0xc>
 8000f40:	4313      	orrs	r3, r2
 8000f42:	e001      	b.n	8000f48 <USART_Cmd+0x10>
 8000f44:	439a      	bics	r2, r3
 8000f46:	1c13      	adds	r3, r2, #0
 8000f48:	6003      	str	r3, [r0, #0]
 8000f4a:	4770      	bx	lr

08000f4c <USART_ReceiveData>:
 8000f4c:	6a40      	ldr	r0, [r0, #36]	; 0x24
 8000f4e:	05c0      	lsls	r0, r0, #23
 8000f50:	0dc0      	lsrs	r0, r0, #23
 8000f52:	4770      	bx	lr

08000f54 <USART_GetITStatus>:
 8000f54:	b2cb      	uxtb	r3, r1
 8000f56:	b510      	push	{r4, lr}
 8000f58:	2401      	movs	r4, #1
 8000f5a:	b28a      	uxth	r2, r1
 8000f5c:	409c      	lsls	r4, r3
 8000f5e:	0a12      	lsrs	r2, r2, #8
 8000f60:	1c23      	adds	r3, r4, #0
 8000f62:	2a01      	cmp	r2, #1
 8000f64:	d101      	bne.n	8000f6a <USART_GetITStatus+0x16>
 8000f66:	6802      	ldr	r2, [r0, #0]
 8000f68:	e004      	b.n	8000f74 <USART_GetITStatus+0x20>
 8000f6a:	2a02      	cmp	r2, #2
 8000f6c:	d101      	bne.n	8000f72 <USART_GetITStatus+0x1e>
 8000f6e:	6842      	ldr	r2, [r0, #4]
 8000f70:	e000      	b.n	8000f74 <USART_GetITStatus+0x20>
 8000f72:	6882      	ldr	r2, [r0, #8]
 8000f74:	4013      	ands	r3, r2
 8000f76:	69c2      	ldr	r2, [r0, #28]
 8000f78:	2000      	movs	r0, #0
 8000f7a:	4283      	cmp	r3, r0
 8000f7c:	d008      	beq.n	8000f90 <USART_GetITStatus+0x3c>
 8000f7e:	0c09      	lsrs	r1, r1, #16
 8000f80:	2001      	movs	r0, #1
 8000f82:	4088      	lsls	r0, r1
 8000f84:	1c01      	adds	r1, r0, #0
 8000f86:	1c10      	adds	r0, r2, #0
 8000f88:	4008      	ands	r0, r1
 8000f8a:	1e41      	subs	r1, r0, #1
 8000f8c:	4188      	sbcs	r0, r1
 8000f8e:	b2c0      	uxtb	r0, r0
 8000f90:	bd10      	pop	{r4, pc}

08000f92 <USART_ClearITPendingBit>:
 8000f92:	0c09      	lsrs	r1, r1, #16
 8000f94:	2301      	movs	r3, #1
 8000f96:	408b      	lsls	r3, r1
 8000f98:	6203      	str	r3, [r0, #32]
 8000f9a:	4770      	bx	lr

08000f9c <NVIC_Init>:
 8000f9c:	7882      	ldrb	r2, [r0, #2]
 8000f9e:	b570      	push	{r4, r5, r6, lr}
 8000fa0:	7803      	ldrb	r3, [r0, #0]
 8000fa2:	2a00      	cmp	r2, #0
 8000fa4:	d01d      	beq.n	8000fe2 <NVIC_Init+0x46>
 8000fa6:	0899      	lsrs	r1, r3, #2
 8000fa8:	4a12      	ldr	r2, [pc, #72]	; (8000ff4 <NVIC_Init+0x58>)
 8000faa:	2403      	movs	r4, #3
 8000fac:	0089      	lsls	r1, r1, #2
 8000fae:	1889      	adds	r1, r1, r2
 8000fb0:	4023      	ands	r3, r4
 8000fb2:	22c0      	movs	r2, #192	; 0xc0
 8000fb4:	40a3      	lsls	r3, r4
 8000fb6:	0092      	lsls	r2, r2, #2
 8000fb8:	24ff      	movs	r4, #255	; 0xff
 8000fba:	588d      	ldr	r5, [r1, r2]
 8000fbc:	1c26      	adds	r6, r4, #0
 8000fbe:	409e      	lsls	r6, r3
 8000fc0:	43b5      	bics	r5, r6
 8000fc2:	7846      	ldrb	r6, [r0, #1]
 8000fc4:	01b6      	lsls	r6, r6, #6
 8000fc6:	4034      	ands	r4, r6
 8000fc8:	409c      	lsls	r4, r3
 8000fca:	1c2b      	adds	r3, r5, #0
 8000fcc:	4323      	orrs	r3, r4
 8000fce:	508b      	str	r3, [r1, r2]
 8000fd0:	7802      	ldrb	r2, [r0, #0]
 8000fd2:	231f      	movs	r3, #31
 8000fd4:	401a      	ands	r2, r3
 8000fd6:	2301      	movs	r3, #1
 8000fd8:	4093      	lsls	r3, r2
 8000fda:	1c1a      	adds	r2, r3, #0
 8000fdc:	4b05      	ldr	r3, [pc, #20]	; (8000ff4 <NVIC_Init+0x58>)
 8000fde:	601a      	str	r2, [r3, #0]
 8000fe0:	e006      	b.n	8000ff0 <NVIC_Init+0x54>
 8000fe2:	221f      	movs	r2, #31
 8000fe4:	4013      	ands	r3, r2
 8000fe6:	2201      	movs	r2, #1
 8000fe8:	409a      	lsls	r2, r3
 8000fea:	1c13      	adds	r3, r2, #0
 8000fec:	4a02      	ldr	r2, [pc, #8]	; (8000ff8 <NVIC_Init+0x5c>)
 8000fee:	67d3      	str	r3, [r2, #124]	; 0x7c
 8000ff0:	bd70      	pop	{r4, r5, r6, pc}
 8000ff2:	46c0      	nop			; (mov r8, r8)
 8000ff4:	e000e100 	.word	0xe000e100
 8000ff8:	e000e104 	.word	0xe000e104

08000ffc <RCC_GetClocksFreq>:
 8000ffc:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
 8000ffe:	4d5a      	ldr	r5, [pc, #360]	; (8001168 <RCC_GetClocksFreq+0x16c>)
 8001000:	1c04      	adds	r4, r0, #0
 8001002:	6868      	ldr	r0, [r5, #4]
 8001004:	230c      	movs	r3, #12
 8001006:	4018      	ands	r0, r3
 8001008:	f000 fab0 	bl	800156c <__gnu_thumb1_case_uqi>
 800100c:	1f1f1f1f 	.word	0x1f1f1f1f
 8001010:	1f1f1f1f 	.word	0x1f1f1f1f
 8001014:	1f1f1f07 	.word	0x1f1f1f07
 8001018:	1d          	.byte	0x1d
 8001019:	00          	.byte	0x00
 800101a:	686e      	ldr	r6, [r5, #4]
 800101c:	23c0      	movs	r3, #192	; 0xc0
 800101e:	02b6      	lsls	r6, r6, #10
 8001020:	686a      	ldr	r2, [r5, #4]
 8001022:	0f36      	lsrs	r6, r6, #28
 8001024:	025b      	lsls	r3, r3, #9
 8001026:	3602      	adds	r6, #2
 8001028:	421a      	tst	r2, r3
 800102a:	d101      	bne.n	8001030 <RCC_GetClocksFreq+0x34>
 800102c:	484f      	ldr	r0, [pc, #316]	; (800116c <RCC_GetClocksFreq+0x170>)
 800102e:	e007      	b.n	8001040 <RCC_GetClocksFreq+0x44>
 8001030:	4b4d      	ldr	r3, [pc, #308]	; (8001168 <RCC_GetClocksFreq+0x16c>)
 8001032:	484f      	ldr	r0, [pc, #316]	; (8001170 <RCC_GetClocksFreq+0x174>)
 8001034:	6ad9      	ldr	r1, [r3, #44]	; 0x2c
 8001036:	230f      	movs	r3, #15
 8001038:	4019      	ands	r1, r3
 800103a:	3101      	adds	r1, #1
 800103c:	f000 faa0 	bl	8001580 <__aeabi_uidiv>
 8001040:	4370      	muls	r0, r6
 8001042:	6020      	str	r0, [r4, #0]
 8001044:	e004      	b.n	8001050 <RCC_GetClocksFreq+0x54>
 8001046:	4b4b      	ldr	r3, [pc, #300]	; (8001174 <RCC_GetClocksFreq+0x178>)
 8001048:	e000      	b.n	800104c <RCC_GetClocksFreq+0x50>
 800104a:	4b49      	ldr	r3, [pc, #292]	; (8001170 <RCC_GetClocksFreq+0x174>)
 800104c:	6023      	str	r3, [r4, #0]
 800104e:	2000      	movs	r0, #0
 8001050:	686b      	ldr	r3, [r5, #4]
 8001052:	4a49      	ldr	r2, [pc, #292]	; (8001178 <RCC_GetClocksFreq+0x17c>)
 8001054:	061b      	lsls	r3, r3, #24
 8001056:	0f1b      	lsrs	r3, r3, #28
 8001058:	6821      	ldr	r1, [r4, #0]
 800105a:	5cd3      	ldrb	r3, [r2, r3]
 800105c:	1c0e      	adds	r6, r1, #0
 800105e:	40de      	lsrs	r6, r3
 8001060:	6066      	str	r6, [r4, #4]
 8001062:	1c33      	adds	r3, r6, #0
 8001064:	686e      	ldr	r6, [r5, #4]
 8001066:	0576      	lsls	r6, r6, #21
 8001068:	0f76      	lsrs	r6, r6, #29
 800106a:	5d92      	ldrb	r2, [r2, r6]
 800106c:	40d3      	lsrs	r3, r2
 800106e:	60a3      	str	r3, [r4, #8]
 8001070:	6b2a      	ldr	r2, [r5, #48]	; 0x30
 8001072:	05d6      	lsls	r6, r2, #23
 8001074:	d401      	bmi.n	800107a <RCC_GetClocksFreq+0x7e>
 8001076:	4a41      	ldr	r2, [pc, #260]	; (800117c <RCC_GetClocksFreq+0x180>)
 8001078:	e006      	b.n	8001088 <RCC_GetClocksFreq+0x8c>
 800107a:	4a3b      	ldr	r2, [pc, #236]	; (8001168 <RCC_GetClocksFreq+0x16c>)
 800107c:	6852      	ldr	r2, [r2, #4]
 800107e:	0456      	lsls	r6, r2, #17
 8001080:	d401      	bmi.n	8001086 <RCC_GetClocksFreq+0x8a>
 8001082:	085a      	lsrs	r2, r3, #1
 8001084:	e000      	b.n	8001088 <RCC_GetClocksFreq+0x8c>
 8001086:	089a      	lsrs	r2, r3, #2
 8001088:	60e2      	str	r2, [r4, #12]
 800108a:	6b2a      	ldr	r2, [r5, #48]	; 0x30
 800108c:	0656      	lsls	r6, r2, #25
 800108e:	d401      	bmi.n	8001094 <RCC_GetClocksFreq+0x98>
 8001090:	4a3b      	ldr	r2, [pc, #236]	; (8001180 <RCC_GetClocksFreq+0x184>)
 8001092:	e001      	b.n	8001098 <RCC_GetClocksFreq+0x9c>
 8001094:	2280      	movs	r2, #128	; 0x80
 8001096:	0212      	lsls	r2, r2, #8
 8001098:	6122      	str	r2, [r4, #16]
 800109a:	6b2a      	ldr	r2, [r5, #48]	; 0x30
 800109c:	06d6      	lsls	r6, r2, #27
 800109e:	d402      	bmi.n	80010a6 <RCC_GetClocksFreq+0xaa>
 80010a0:	4a33      	ldr	r2, [pc, #204]	; (8001170 <RCC_GetClocksFreq+0x174>)
 80010a2:	6162      	str	r2, [r4, #20]
 80010a4:	e000      	b.n	80010a8 <RCC_GetClocksFreq+0xac>
 80010a6:	6161      	str	r1, [r4, #20]
 80010a8:	6b2f      	ldr	r7, [r5, #48]	; 0x30
 80010aa:	2203      	movs	r2, #3
 80010ac:	4e2e      	ldr	r6, [pc, #184]	; (8001168 <RCC_GetClocksFreq+0x16c>)
 80010ae:	4217      	tst	r7, r2
 80010b0:	d101      	bne.n	80010b6 <RCC_GetClocksFreq+0xba>
 80010b2:	61a3      	str	r3, [r4, #24]
 80010b4:	e012      	b.n	80010dc <RCC_GetClocksFreq+0xe0>
 80010b6:	6b37      	ldr	r7, [r6, #48]	; 0x30
 80010b8:	4017      	ands	r7, r2
 80010ba:	2f01      	cmp	r7, #1
 80010bc:	d101      	bne.n	80010c2 <RCC_GetClocksFreq+0xc6>
 80010be:	61a1      	str	r1, [r4, #24]
 80010c0:	e00c      	b.n	80010dc <RCC_GetClocksFreq+0xe0>
 80010c2:	6b37      	ldr	r7, [r6, #48]	; 0x30
 80010c4:	4017      	ands	r7, r2
 80010c6:	2f02      	cmp	r7, #2
 80010c8:	d102      	bne.n	80010d0 <RCC_GetClocksFreq+0xd4>
 80010ca:	2280      	movs	r2, #128	; 0x80
 80010cc:	0212      	lsls	r2, r2, #8
 80010ce:	e004      	b.n	80010da <RCC_GetClocksFreq+0xde>
 80010d0:	6b36      	ldr	r6, [r6, #48]	; 0x30
 80010d2:	4032      	ands	r2, r6
 80010d4:	2a03      	cmp	r2, #3
 80010d6:	d101      	bne.n	80010dc <RCC_GetClocksFreq+0xe0>
 80010d8:	4a25      	ldr	r2, [pc, #148]	; (8001170 <RCC_GetClocksFreq+0x174>)
 80010da:	61a2      	str	r2, [r4, #24]
 80010dc:	22c0      	movs	r2, #192	; 0xc0
 80010de:	6b2f      	ldr	r7, [r5, #48]	; 0x30
 80010e0:	0292      	lsls	r2, r2, #10
 80010e2:	4e21      	ldr	r6, [pc, #132]	; (8001168 <RCC_GetClocksFreq+0x16c>)
 80010e4:	4217      	tst	r7, r2
 80010e6:	d101      	bne.n	80010ec <RCC_GetClocksFreq+0xf0>
 80010e8:	61e3      	str	r3, [r4, #28]
 80010ea:	e018      	b.n	800111e <RCC_GetClocksFreq+0x122>
 80010ec:	6b37      	ldr	r7, [r6, #48]	; 0x30
 80010ee:	4017      	ands	r7, r2
 80010f0:	46bc      	mov	ip, r7
 80010f2:	2780      	movs	r7, #128	; 0x80
 80010f4:	027f      	lsls	r7, r7, #9
 80010f6:	45bc      	cmp	ip, r7
 80010f8:	d101      	bne.n	80010fe <RCC_GetClocksFreq+0x102>
 80010fa:	61e1      	str	r1, [r4, #28]
 80010fc:	e00f      	b.n	800111e <RCC_GetClocksFreq+0x122>
 80010fe:	6b37      	ldr	r7, [r6, #48]	; 0x30
 8001100:	4017      	ands	r7, r2
 8001102:	46bc      	mov	ip, r7
 8001104:	2780      	movs	r7, #128	; 0x80
 8001106:	02bf      	lsls	r7, r7, #10
 8001108:	45bc      	cmp	ip, r7
 800110a:	d102      	bne.n	8001112 <RCC_GetClocksFreq+0x116>
 800110c:	2280      	movs	r2, #128	; 0x80
 800110e:	0212      	lsls	r2, r2, #8
 8001110:	e004      	b.n	800111c <RCC_GetClocksFreq+0x120>
 8001112:	6b36      	ldr	r6, [r6, #48]	; 0x30
 8001114:	4016      	ands	r6, r2
 8001116:	4296      	cmp	r6, r2
 8001118:	d101      	bne.n	800111e <RCC_GetClocksFreq+0x122>
 800111a:	4a15      	ldr	r2, [pc, #84]	; (8001170 <RCC_GetClocksFreq+0x174>)
 800111c:	61e2      	str	r2, [r4, #28]
 800111e:	22c0      	movs	r2, #192	; 0xc0
 8001120:	6b2f      	ldr	r7, [r5, #48]	; 0x30
 8001122:	0312      	lsls	r2, r2, #12
 8001124:	4e10      	ldr	r6, [pc, #64]	; (8001168 <RCC_GetClocksFreq+0x16c>)
 8001126:	4217      	tst	r7, r2
 8001128:	d015      	beq.n	8001156 <RCC_GetClocksFreq+0x15a>
 800112a:	6b37      	ldr	r7, [r6, #48]	; 0x30
 800112c:	2380      	movs	r3, #128	; 0x80
 800112e:	4017      	ands	r7, r2
 8001130:	02db      	lsls	r3, r3, #11
 8001132:	429f      	cmp	r7, r3
 8001134:	d101      	bne.n	800113a <RCC_GetClocksFreq+0x13e>
 8001136:	6221      	str	r1, [r4, #32]
 8001138:	e00e      	b.n	8001158 <RCC_GetClocksFreq+0x15c>
 800113a:	6b31      	ldr	r1, [r6, #48]	; 0x30
 800113c:	2380      	movs	r3, #128	; 0x80
 800113e:	4011      	ands	r1, r2
 8001140:	031b      	lsls	r3, r3, #12
 8001142:	4299      	cmp	r1, r3
 8001144:	d102      	bne.n	800114c <RCC_GetClocksFreq+0x150>
 8001146:	2380      	movs	r3, #128	; 0x80
 8001148:	021b      	lsls	r3, r3, #8
 800114a:	e004      	b.n	8001156 <RCC_GetClocksFreq+0x15a>
 800114c:	6b33      	ldr	r3, [r6, #48]	; 0x30
 800114e:	4013      	ands	r3, r2
 8001150:	4293      	cmp	r3, r2
 8001152:	d101      	bne.n	8001158 <RCC_GetClocksFreq+0x15c>
 8001154:	4b06      	ldr	r3, [pc, #24]	; (8001170 <RCC_GetClocksFreq+0x174>)
 8001156:	6223      	str	r3, [r4, #32]
 8001158:	6b2b      	ldr	r3, [r5, #48]	; 0x30
 800115a:	061a      	lsls	r2, r3, #24
 800115c:	d402      	bmi.n	8001164 <RCC_GetClocksFreq+0x168>
 800115e:	4b05      	ldr	r3, [pc, #20]	; (8001174 <RCC_GetClocksFreq+0x178>)
 8001160:	6263      	str	r3, [r4, #36]	; 0x24
 8001162:	e000      	b.n	8001166 <RCC_GetClocksFreq+0x16a>
 8001164:	6260      	str	r0, [r4, #36]	; 0x24
 8001166:	bdf8      	pop	{r3, r4, r5, r6, r7, pc}
 8001168:	40021000 	.word	0x40021000
 800116c:	003d0900 	.word	0x003d0900
 8001170:	007a1200 	.word	0x007a1200
 8001174:	02dc6c00 	.word	0x02dc6c00
 8001178:	20000000 	.word	0x20000000
 800117c:	00d59f80 	.word	0x00d59f80
 8001180:	00008012 	.word	0x00008012

08001184 <RCC_AHBPeriphClockCmd>:
 8001184:	4b04      	ldr	r3, [pc, #16]	; (8001198 <RCC_AHBPeriphClockCmd+0x14>)
 8001186:	695a      	ldr	r2, [r3, #20]
 8001188:	2900      	cmp	r1, #0
 800118a:	d002      	beq.n	8001192 <RCC_AHBPeriphClockCmd+0xe>
 800118c:	4310      	orrs	r0, r2
 800118e:	6158      	str	r0, [r3, #20]
 8001190:	e001      	b.n	8001196 <RCC_AHBPeriphClockCmd+0x12>
 8001192:	4382      	bics	r2, r0
 8001194:	615a      	str	r2, [r3, #20]
 8001196:	4770      	bx	lr
 8001198:	40021000 	.word	0x40021000

0800119c <RCC_APB2PeriphClockCmd>:
 800119c:	4b04      	ldr	r3, [pc, #16]	; (80011b0 <RCC_APB2PeriphClockCmd+0x14>)
 800119e:	699a      	ldr	r2, [r3, #24]
 80011a0:	2900      	cmp	r1, #0
 80011a2:	d002      	beq.n	80011aa <RCC_APB2PeriphClockCmd+0xe>
 80011a4:	4310      	orrs	r0, r2
 80011a6:	6198      	str	r0, [r3, #24]
 80011a8:	e001      	b.n	80011ae <RCC_APB2PeriphClockCmd+0x12>
 80011aa:	4382      	bics	r2, r0
 80011ac:	619a      	str	r2, [r3, #24]
 80011ae:	4770      	bx	lr
 80011b0:	40021000 	.word	0x40021000

080011b4 <RCC_APB1PeriphClockCmd>:
 80011b4:	4b04      	ldr	r3, [pc, #16]	; (80011c8 <RCC_APB1PeriphClockCmd+0x14>)
 80011b6:	69da      	ldr	r2, [r3, #28]
 80011b8:	2900      	cmp	r1, #0
 80011ba:	d002      	beq.n	80011c2 <RCC_APB1PeriphClockCmd+0xe>
 80011bc:	4310      	orrs	r0, r2
 80011be:	61d8      	str	r0, [r3, #28]
 80011c0:	e001      	b.n	80011c6 <RCC_APB1PeriphClockCmd+0x12>
 80011c2:	4382      	bics	r2, r0
 80011c4:	61da      	str	r2, [r3, #28]
 80011c6:	4770      	bx	lr
 80011c8:	40021000 	.word	0x40021000

080011cc <gpio_init>:
 80011cc:	b5f7      	push	{r0, r1, r2, r4, r5, r6, r7, lr}
 80011ce:	2080      	movs	r0, #128	; 0x80
 80011d0:	0280      	lsls	r0, r0, #10
 80011d2:	2101      	movs	r1, #1
 80011d4:	f7ff ffd6 	bl	8001184 <RCC_AHBPeriphClockCmd>
 80011d8:	2080      	movs	r0, #128	; 0x80
 80011da:	02c0      	lsls	r0, r0, #11
 80011dc:	2101      	movs	r1, #1
 80011de:	f7ff ffd1 	bl	8001184 <RCC_AHBPeriphClockCmd>
 80011e2:	2208      	movs	r2, #8
 80011e4:	2400      	movs	r4, #0
 80011e6:	466b      	mov	r3, sp
 80011e8:	2603      	movs	r6, #3
 80011ea:	9200      	str	r2, [sp, #0]
 80011ec:	4669      	mov	r1, sp
 80011ee:	2201      	movs	r2, #1
 80011f0:	481c      	ldr	r0, [pc, #112]	; (8001264 <gpio_init+0x98>)
 80011f2:	715e      	strb	r6, [r3, #5]
 80011f4:	711a      	strb	r2, [r3, #4]
 80011f6:	719c      	strb	r4, [r3, #6]
 80011f8:	71dc      	strb	r4, [r3, #7]
 80011fa:	2590      	movs	r5, #144	; 0x90
 80011fc:	f7ff fd98 	bl	8000d30 <GPIO_Init>
 8001200:	2380      	movs	r3, #128	; 0x80
 8001202:	05ed      	lsls	r5, r5, #23
 8001204:	005b      	lsls	r3, r3, #1
 8001206:	466a      	mov	r2, sp
 8001208:	1c28      	adds	r0, r5, #0
 800120a:	9300      	str	r3, [sp, #0]
 800120c:	4669      	mov	r1, sp
 800120e:	2301      	movs	r3, #1
 8001210:	2780      	movs	r7, #128	; 0x80
 8001212:	7156      	strb	r6, [r2, #5]
 8001214:	013f      	lsls	r7, r7, #4
 8001216:	7113      	strb	r3, [r2, #4]
 8001218:	7194      	strb	r4, [r2, #6]
 800121a:	71d4      	strb	r4, [r2, #7]
 800121c:	f7ff fd88 	bl	8000d30 <GPIO_Init>
 8001220:	466a      	mov	r2, sp
 8001222:	1c28      	adds	r0, r5, #0
 8001224:	2301      	movs	r3, #1
 8001226:	4669      	mov	r1, sp
 8001228:	7156      	strb	r6, [r2, #5]
 800122a:	9700      	str	r7, [sp, #0]
 800122c:	7113      	strb	r3, [r2, #4]
 800122e:	7194      	strb	r4, [r2, #6]
 8001230:	71d4      	strb	r4, [r2, #7]
 8001232:	f7ff fd7d 	bl	8000d30 <GPIO_Init>
 8001236:	2202      	movs	r2, #2
 8001238:	466b      	mov	r3, sp
 800123a:	9200      	str	r2, [sp, #0]
 800123c:	1c28      	adds	r0, r5, #0
 800123e:	2201      	movs	r2, #1
 8001240:	4669      	mov	r1, sp
 8001242:	715e      	strb	r6, [r3, #5]
 8001244:	711a      	strb	r2, [r3, #4]
 8001246:	719c      	strb	r4, [r3, #6]
 8001248:	71dc      	strb	r4, [r3, #7]
 800124a:	f7ff fd71 	bl	8000d30 <GPIO_Init>
 800124e:	4b05      	ldr	r3, [pc, #20]	; (8001264 <gpio_init+0x98>)
 8001250:	2208      	movs	r2, #8
 8001252:	851a      	strh	r2, [r3, #40]	; 0x28
 8001254:	2380      	movs	r3, #128	; 0x80
 8001256:	005b      	lsls	r3, r3, #1
 8001258:	2202      	movs	r2, #2
 800125a:	852b      	strh	r3, [r5, #40]	; 0x28
 800125c:	852f      	strh	r7, [r5, #40]	; 0x28
 800125e:	852a      	strh	r2, [r5, #40]	; 0x28
 8001260:	bdf7      	pop	{r0, r1, r2, r4, r5, r6, r7, pc}
 8001262:	46c0      	nop			; (mov r8, r8)
 8001264:	48000400 	.word	0x48000400

08001268 <led_on>:
 8001268:	2808      	cmp	r0, #8
 800126a:	d101      	bne.n	8001270 <led_on+0x8>
 800126c:	4b07      	ldr	r3, [pc, #28]	; (800128c <led_on+0x24>)
 800126e:	e00b      	b.n	8001288 <led_on+0x20>
 8001270:	2380      	movs	r3, #128	; 0x80
 8001272:	005b      	lsls	r3, r3, #1
 8001274:	4298      	cmp	r0, r3
 8001276:	d005      	beq.n	8001284 <led_on+0x1c>
 8001278:	2380      	movs	r3, #128	; 0x80
 800127a:	011b      	lsls	r3, r3, #4
 800127c:	4298      	cmp	r0, r3
 800127e:	d001      	beq.n	8001284 <led_on+0x1c>
 8001280:	2802      	cmp	r0, #2
 8001282:	d102      	bne.n	800128a <led_on+0x22>
 8001284:	2390      	movs	r3, #144	; 0x90
 8001286:	05db      	lsls	r3, r3, #23
 8001288:	6198      	str	r0, [r3, #24]
 800128a:	4770      	bx	lr
 800128c:	48000400 	.word	0x48000400

08001290 <led_off>:
 8001290:	2808      	cmp	r0, #8
 8001292:	d101      	bne.n	8001298 <led_off+0x8>
 8001294:	4b07      	ldr	r3, [pc, #28]	; (80012b4 <led_off+0x24>)
 8001296:	e00b      	b.n	80012b0 <led_off+0x20>
 8001298:	2380      	movs	r3, #128	; 0x80
 800129a:	005b      	lsls	r3, r3, #1
 800129c:	4298      	cmp	r0, r3
 800129e:	d005      	beq.n	80012ac <led_off+0x1c>
 80012a0:	2380      	movs	r3, #128	; 0x80
 80012a2:	011b      	lsls	r3, r3, #4
 80012a4:	4298      	cmp	r0, r3
 80012a6:	d001      	beq.n	80012ac <led_off+0x1c>
 80012a8:	2802      	cmp	r0, #2
 80012aa:	d102      	bne.n	80012b2 <led_off+0x22>
 80012ac:	2390      	movs	r3, #144	; 0x90
 80012ae:	05db      	lsls	r3, r3, #23
 80012b0:	8518      	strh	r0, [r3, #40]	; 0x28
 80012b2:	4770      	bx	lr
 80012b4:	48000400 	.word	0x48000400

080012b8 <Default_Handler>:
 80012b8:	4770      	bx	lr
	...

080012bc <HardFault_Handler>:
 80012bc:	2008      	movs	r0, #8
 80012be:	f7ff ffd3 	bl	8001268 <led_on>
 80012c2:	4b07      	ldr	r3, [pc, #28]	; (80012e0 <HardFault_Handler+0x24>)
 80012c4:	3b01      	subs	r3, #1
 80012c6:	2b00      	cmp	r3, #0
 80012c8:	d001      	beq.n	80012ce <HardFault_Handler+0x12>
 80012ca:	46c0      	nop			; (mov r8, r8)
 80012cc:	e7fa      	b.n	80012c4 <HardFault_Handler+0x8>
 80012ce:	2008      	movs	r0, #8
 80012d0:	f7ff ffde 	bl	8001290 <led_off>
 80012d4:	4b02      	ldr	r3, [pc, #8]	; (80012e0 <HardFault_Handler+0x24>)
 80012d6:	3b01      	subs	r3, #1
 80012d8:	2b00      	cmp	r3, #0
 80012da:	d0ef      	beq.n	80012bc <HardFault_Handler>
 80012dc:	46c0      	nop			; (mov r8, r8)
 80012de:	e7fa      	b.n	80012d6 <HardFault_Handler+0x1a>
 80012e0:	002dc6c1 	.word	0x002dc6c1

080012e4 <_reset_init>:
 80012e4:	4a07      	ldr	r2, [pc, #28]	; (8001304 <_reset_init+0x20>)
 80012e6:	4908      	ldr	r1, [pc, #32]	; (8001308 <_reset_init+0x24>)
 80012e8:	2300      	movs	r3, #0
 80012ea:	1a89      	subs	r1, r1, r2
 80012ec:	1089      	asrs	r1, r1, #2
 80012ee:	1c10      	adds	r0, r2, #0
 80012f0:	428b      	cmp	r3, r1
 80012f2:	d005      	beq.n	8001300 <_reset_init+0x1c>
 80012f4:	4c05      	ldr	r4, [pc, #20]	; (800130c <_reset_init+0x28>)
 80012f6:	009a      	lsls	r2, r3, #2
 80012f8:	58a4      	ldr	r4, [r4, r2]
 80012fa:	3301      	adds	r3, #1
 80012fc:	5084      	str	r4, [r0, r2]
 80012fe:	e7f7      	b.n	80012f0 <_reset_init+0xc>
 8001300:	f7ff fa2e 	bl	8000760 <main>
 8001304:	20000000 	.word	0x20000000
 8001308:	2000043c 	.word	0x2000043c
 800130c:	08002c04 	.word	0x08002c04

08001310 <_ZN10__cxxabiv120__si_class_type_infoD1Ev>:
 8001310:	b510      	push	{r4, lr}
 8001312:	1c04      	adds	r4, r0, #0
 8001314:	4b03      	ldr	r3, [pc, #12]	; (8001324 <_ZN10__cxxabiv120__si_class_type_infoD1Ev+0x14>)
 8001316:	3308      	adds	r3, #8
 8001318:	6003      	str	r3, [r0, #0]
 800131a:	f000 f8cb 	bl	80014b4 <_ZN10__cxxabiv117__class_type_infoD1Ev>
 800131e:	1c20      	adds	r0, r4, #0
 8001320:	bd10      	pop	{r4, pc}
 8001322:	46c0      	nop			; (mov r8, r8)
 8001324:	080028e8 	.word	0x080028e8

08001328 <_ZN10__cxxabiv120__si_class_type_infoD0Ev>:
 8001328:	b510      	push	{r4, lr}
 800132a:	1c04      	adds	r4, r0, #0
 800132c:	4b04      	ldr	r3, [pc, #16]	; (8001340 <_ZN10__cxxabiv120__si_class_type_infoD0Ev+0x18>)
 800132e:	3308      	adds	r3, #8
 8001330:	6003      	str	r3, [r0, #0]
 8001332:	f000 f8bf 	bl	80014b4 <_ZN10__cxxabiv117__class_type_infoD1Ev>
 8001336:	1c20      	adds	r0, r4, #0
 8001338:	f7fe fec6 	bl	80000c8 <_ZdlPv>
 800133c:	1c20      	adds	r0, r4, #0
 800133e:	bd10      	pop	{r4, pc}
 8001340:	080028e8 	.word	0x080028e8

08001344 <_ZNK10__cxxabiv120__si_class_type_info20__do_find_public_srcEiPKvPKNS_17__class_type_infoES2_>:
 8001344:	b5f0      	push	{r4, r5, r6, r7, lr}
 8001346:	b083      	sub	sp, #12
 8001348:	1c1d      	adds	r5, r3, #0
 800134a:	9b08      	ldr	r3, [sp, #32]
 800134c:	1c06      	adds	r6, r0, #0
 800134e:	1c0f      	adds	r7, r1, #0
 8001350:	1c14      	adds	r4, r2, #0
 8001352:	4293      	cmp	r3, r2
 8001354:	d00a      	beq.n	800136c <_ZNK10__cxxabiv120__si_class_type_info20__do_find_public_srcEiPKvPKNS_17__class_type_infoES2_+0x28>
 8001356:	68b0      	ldr	r0, [r6, #8]
 8001358:	9a08      	ldr	r2, [sp, #32]
 800135a:	6803      	ldr	r3, [r0, #0]
 800135c:	9200      	str	r2, [sp, #0]
 800135e:	6a1e      	ldr	r6, [r3, #32]
 8001360:	1c39      	adds	r1, r7, #0
 8001362:	1c22      	adds	r2, r4, #0
 8001364:	1c2b      	adds	r3, r5, #0
 8001366:	47b0      	blx	r6
 8001368:	b003      	add	sp, #12
 800136a:	bdf0      	pop	{r4, r5, r6, r7, pc}
 800136c:	1c29      	adds	r1, r5, #0
 800136e:	f000 f865 	bl	800143c <_ZNKSt9type_infoeqERKS_>
 8001372:	2800      	cmp	r0, #0
 8001374:	d0ef      	beq.n	8001356 <_ZNK10__cxxabiv120__si_class_type_info20__do_find_public_srcEiPKvPKNS_17__class_type_infoES2_+0x12>
 8001376:	2006      	movs	r0, #6
 8001378:	e7f6      	b.n	8001368 <_ZNK10__cxxabiv120__si_class_type_info20__do_find_public_srcEiPKvPKNS_17__class_type_infoES2_+0x24>
 800137a:	46c0      	nop			; (mov r8, r8)

0800137c <_ZNK10__cxxabiv120__si_class_type_info12__do_dyncastEiNS_17__class_type_info10__sub_kindEPKS1_PKvS4_S6_RNS1_16__dyncast_resultE>:
 800137c:	b5f0      	push	{r4, r5, r6, r7, lr}
 800137e:	4647      	mov	r7, r8
 8001380:	b480      	push	{r7}
 8001382:	1c0d      	adds	r5, r1, #0
 8001384:	b084      	sub	sp, #16
 8001386:	1c19      	adds	r1, r3, #0
 8001388:	1c07      	adds	r7, r0, #0
 800138a:	1c16      	adds	r6, r2, #0
 800138c:	4698      	mov	r8, r3
 800138e:	f000 f855 	bl	800143c <_ZNKSt9type_infoeqERKS_>
 8001392:	1e04      	subs	r4, r0, #0
 8001394:	d00f      	beq.n	80013b6 <_ZNK10__cxxabiv120__si_class_type_info12__do_dyncastEiNS_17__class_type_info10__sub_kindEPKS1_PKvS4_S6_RNS1_16__dyncast_resultE+0x3a>
 8001396:	9b0d      	ldr	r3, [sp, #52]	; 0x34
 8001398:	9a0a      	ldr	r2, [sp, #40]	; 0x28
 800139a:	711e      	strb	r6, [r3, #4]
 800139c:	601a      	str	r2, [r3, #0]
 800139e:	2d00      	cmp	r5, #0
 80013a0:	db22      	blt.n	80013e8 <_ZNK10__cxxabiv120__si_class_type_info12__do_dyncastEiNS_17__class_type_info10__sub_kindEPKS1_PKvS4_S6_RNS1_16__dyncast_resultE+0x6c>
 80013a2:	4694      	mov	ip, r2
 80013a4:	9b0c      	ldr	r3, [sp, #48]	; 0x30
 80013a6:	4465      	add	r5, ip
 80013a8:	42ab      	cmp	r3, r5
 80013aa:	d02d      	beq.n	8001408 <_ZNK10__cxxabiv120__si_class_type_info12__do_dyncastEiNS_17__class_type_info10__sub_kindEPKS1_PKvS4_S6_RNS1_16__dyncast_resultE+0x8c>
 80013ac:	2301      	movs	r3, #1
 80013ae:	9a0d      	ldr	r2, [sp, #52]	; 0x34
 80013b0:	2400      	movs	r4, #0
 80013b2:	7193      	strb	r3, [r2, #6]
 80013b4:	e013      	b.n	80013de <_ZNK10__cxxabiv120__si_class_type_info12__do_dyncastEiNS_17__class_type_info10__sub_kindEPKS1_PKvS4_S6_RNS1_16__dyncast_resultE+0x62>
 80013b6:	9b0a      	ldr	r3, [sp, #40]	; 0x28
 80013b8:	9a0c      	ldr	r2, [sp, #48]	; 0x30
 80013ba:	4293      	cmp	r3, r2
 80013bc:	d01b      	beq.n	80013f6 <_ZNK10__cxxabiv120__si_class_type_info12__do_dyncastEiNS_17__class_type_info10__sub_kindEPKS1_PKvS4_S6_RNS1_16__dyncast_resultE+0x7a>
 80013be:	68b8      	ldr	r0, [r7, #8]
 80013c0:	9a0a      	ldr	r2, [sp, #40]	; 0x28
 80013c2:	6803      	ldr	r3, [r0, #0]
 80013c4:	9200      	str	r2, [sp, #0]
 80013c6:	9a0b      	ldr	r2, [sp, #44]	; 0x2c
 80013c8:	1c29      	adds	r1, r5, #0
 80013ca:	9201      	str	r2, [sp, #4]
 80013cc:	9a0c      	ldr	r2, [sp, #48]	; 0x30
 80013ce:	9202      	str	r2, [sp, #8]
 80013d0:	9a0d      	ldr	r2, [sp, #52]	; 0x34
 80013d2:	9203      	str	r2, [sp, #12]
 80013d4:	69dc      	ldr	r4, [r3, #28]
 80013d6:	1c32      	adds	r2, r6, #0
 80013d8:	4643      	mov	r3, r8
 80013da:	47a0      	blx	r4
 80013dc:	1c04      	adds	r4, r0, #0
 80013de:	1c20      	adds	r0, r4, #0
 80013e0:	b004      	add	sp, #16
 80013e2:	bc04      	pop	{r2}
 80013e4:	4690      	mov	r8, r2
 80013e6:	bdf0      	pop	{r4, r5, r6, r7, pc}
 80013e8:	2400      	movs	r4, #0
 80013ea:	1cab      	adds	r3, r5, #2
 80013ec:	d1f7      	bne.n	80013de <_ZNK10__cxxabiv120__si_class_type_info12__do_dyncastEiNS_17__class_type_info10__sub_kindEPKS1_PKvS4_S6_RNS1_16__dyncast_resultE+0x62>
 80013ee:	2301      	movs	r3, #1
 80013f0:	9a0d      	ldr	r2, [sp, #52]	; 0x34
 80013f2:	7193      	strb	r3, [r2, #6]
 80013f4:	e7f3      	b.n	80013de <_ZNK10__cxxabiv120__si_class_type_info12__do_dyncastEiNS_17__class_type_info10__sub_kindEPKS1_PKvS4_S6_RNS1_16__dyncast_resultE+0x62>
 80013f6:	1c38      	adds	r0, r7, #0
 80013f8:	990b      	ldr	r1, [sp, #44]	; 0x2c
 80013fa:	f000 f81f 	bl	800143c <_ZNKSt9type_infoeqERKS_>
 80013fe:	2800      	cmp	r0, #0
 8001400:	d0dd      	beq.n	80013be <_ZNK10__cxxabiv120__si_class_type_info12__do_dyncastEiNS_17__class_type_info10__sub_kindEPKS1_PKvS4_S6_RNS1_16__dyncast_resultE+0x42>
 8001402:	9b0d      	ldr	r3, [sp, #52]	; 0x34
 8001404:	715e      	strb	r6, [r3, #5]
 8001406:	e7ea      	b.n	80013de <_ZNK10__cxxabiv120__si_class_type_info12__do_dyncastEiNS_17__class_type_info10__sub_kindEPKS1_PKvS4_S6_RNS1_16__dyncast_resultE+0x62>
 8001408:	2306      	movs	r3, #6
 800140a:	e7d0      	b.n	80013ae <_ZNK10__cxxabiv120__si_class_type_info12__do_dyncastEiNS_17__class_type_info10__sub_kindEPKS1_PKvS4_S6_RNS1_16__dyncast_resultE+0x32>

0800140c <_ZNK10__cxxabiv120__si_class_type_info11__do_upcastEPKNS_17__class_type_infoEPKvRNS1_15__upcast_resultE>:
 800140c:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
 800140e:	1c07      	adds	r7, r0, #0
 8001410:	1c0e      	adds	r6, r1, #0
 8001412:	1c15      	adds	r5, r2, #0
 8001414:	1c1c      	adds	r4, r3, #0
 8001416:	f000 f867 	bl	80014e8 <_ZNK10__cxxabiv117__class_type_info11__do_upcastEPKS0_PKvRNS0_15__upcast_resultE>
 800141a:	2800      	cmp	r0, #0
 800141c:	d106      	bne.n	800142c <_ZNK10__cxxabiv120__si_class_type_info11__do_upcastEPKNS_17__class_type_infoEPKvRNS1_15__upcast_resultE+0x20>
 800141e:	68b8      	ldr	r0, [r7, #8]
 8001420:	1c31      	adds	r1, r6, #0
 8001422:	6803      	ldr	r3, [r0, #0]
 8001424:	1c2a      	adds	r2, r5, #0
 8001426:	699f      	ldr	r7, [r3, #24]
 8001428:	1c23      	adds	r3, r4, #0
 800142a:	47b8      	blx	r7
 800142c:	bdf8      	pop	{r3, r4, r5, r6, r7, pc}
 800142e:	46c0      	nop			; (mov r8, r8)

08001430 <_ZNSt9type_infoD1Ev>:
 8001430:	4770      	bx	lr
 8001432:	46c0      	nop			; (mov r8, r8)

08001434 <_ZNKSt9type_info14__is_pointer_pEv>:
 8001434:	2000      	movs	r0, #0
 8001436:	4770      	bx	lr

08001438 <_ZNKSt9type_info15__is_function_pEv>:
 8001438:	2000      	movs	r0, #0
 800143a:	4770      	bx	lr

0800143c <_ZNKSt9type_infoeqERKS_>:
 800143c:	b508      	push	{r3, lr}
 800143e:	4281      	cmp	r1, r0
 8001440:	d011      	beq.n	8001466 <_ZNKSt9type_infoeqERKS_+0x2a>
 8001442:	6840      	ldr	r0, [r0, #4]
 8001444:	7803      	ldrb	r3, [r0, #0]
 8001446:	2b2a      	cmp	r3, #42	; 0x2a
 8001448:	d00b      	beq.n	8001462 <_ZNKSt9type_infoeqERKS_+0x26>
 800144a:	6849      	ldr	r1, [r1, #4]
 800144c:	780b      	ldrb	r3, [r1, #0]
 800144e:	3b2a      	subs	r3, #42	; 0x2a
 8001450:	425a      	negs	r2, r3
 8001452:	4153      	adcs	r3, r2
 8001454:	18c9      	adds	r1, r1, r3
 8001456:	f001 f96b 	bl	8002730 <strcmp>
 800145a:	4243      	negs	r3, r0
 800145c:	4158      	adcs	r0, r3
 800145e:	b2c0      	uxtb	r0, r0
 8001460:	bd08      	pop	{r3, pc}
 8001462:	2000      	movs	r0, #0
 8001464:	e7fc      	b.n	8001460 <_ZNKSt9type_infoeqERKS_+0x24>
 8001466:	2001      	movs	r0, #1
 8001468:	e7fa      	b.n	8001460 <_ZNKSt9type_infoeqERKS_+0x24>
 800146a:	46c0      	nop			; (mov r8, r8)

0800146c <_ZNK10__cxxabiv117__class_type_info11__do_upcastEPKS0_PPv>:
 800146c:	b530      	push	{r4, r5, lr}
 800146e:	b085      	sub	sp, #20
 8001470:	2300      	movs	r3, #0
 8001472:	1c14      	adds	r4, r2, #0
 8001474:	466a      	mov	r2, sp
 8001476:	7113      	strb	r3, [r2, #4]
 8001478:	2210      	movs	r2, #16
 800147a:	9300      	str	r3, [sp, #0]
 800147c:	9303      	str	r3, [sp, #12]
 800147e:	6803      	ldr	r3, [r0, #0]
 8001480:	9202      	str	r2, [sp, #8]
 8001482:	699d      	ldr	r5, [r3, #24]
 8001484:	6822      	ldr	r2, [r4, #0]
 8001486:	466b      	mov	r3, sp
 8001488:	47a8      	blx	r5
 800148a:	466b      	mov	r3, sp
 800148c:	2206      	movs	r2, #6
 800148e:	791b      	ldrb	r3, [r3, #4]
 8001490:	2000      	movs	r0, #0
 8001492:	4013      	ands	r3, r2
 8001494:	2b06      	cmp	r3, #6
 8001496:	d102      	bne.n	800149e <_ZNK10__cxxabiv117__class_type_info11__do_upcastEPKS0_PPv+0x32>
 8001498:	9b00      	ldr	r3, [sp, #0]
 800149a:	3001      	adds	r0, #1
 800149c:	6023      	str	r3, [r4, #0]
 800149e:	b005      	add	sp, #20
 80014a0:	bd30      	pop	{r4, r5, pc}
 80014a2:	46c0      	nop			; (mov r8, r8)

080014a4 <_ZNK10__cxxabiv117__class_type_info20__do_find_public_srcEiPKvPKS0_S2_>:
 80014a4:	9b00      	ldr	r3, [sp, #0]
 80014a6:	4293      	cmp	r3, r2
 80014a8:	d001      	beq.n	80014ae <_ZNK10__cxxabiv117__class_type_info20__do_find_public_srcEiPKvPKS0_S2_+0xa>
 80014aa:	2001      	movs	r0, #1
 80014ac:	4770      	bx	lr
 80014ae:	2006      	movs	r0, #6
 80014b0:	e7fc      	b.n	80014ac <_ZNK10__cxxabiv117__class_type_info20__do_find_public_srcEiPKvPKS0_S2_+0x8>
 80014b2:	46c0      	nop			; (mov r8, r8)

080014b4 <_ZN10__cxxabiv117__class_type_infoD1Ev>:
 80014b4:	b510      	push	{r4, lr}
 80014b6:	1c04      	adds	r4, r0, #0
 80014b8:	4b03      	ldr	r3, [pc, #12]	; (80014c8 <_ZN10__cxxabiv117__class_type_infoD1Ev+0x14>)
 80014ba:	3308      	adds	r3, #8
 80014bc:	6003      	str	r3, [r0, #0]
 80014be:	f7ff ffb7 	bl	8001430 <_ZNSt9type_infoD1Ev>
 80014c2:	1c20      	adds	r0, r4, #0
 80014c4:	bd10      	pop	{r4, pc}
 80014c6:	46c0      	nop			; (mov r8, r8)
 80014c8:	08002968 	.word	0x08002968

080014cc <_ZN10__cxxabiv117__class_type_infoD0Ev>:
 80014cc:	b510      	push	{r4, lr}
 80014ce:	1c04      	adds	r4, r0, #0
 80014d0:	4b04      	ldr	r3, [pc, #16]	; (80014e4 <_ZN10__cxxabiv117__class_type_infoD0Ev+0x18>)
 80014d2:	3308      	adds	r3, #8
 80014d4:	6003      	str	r3, [r0, #0]
 80014d6:	f7ff ffab 	bl	8001430 <_ZNSt9type_infoD1Ev>
 80014da:	1c20      	adds	r0, r4, #0
 80014dc:	f7fe fdf4 	bl	80000c8 <_ZdlPv>
 80014e0:	1c20      	adds	r0, r4, #0
 80014e2:	bd10      	pop	{r4, pc}
 80014e4:	08002968 	.word	0x08002968

080014e8 <_ZNK10__cxxabiv117__class_type_info11__do_upcastEPKS0_PKvRNS0_15__upcast_resultE>:
 80014e8:	b538      	push	{r3, r4, r5, lr}
 80014ea:	1c15      	adds	r5, r2, #0
 80014ec:	1c1c      	adds	r4, r3, #0
 80014ee:	f7ff ffa5 	bl	800143c <_ZNKSt9type_infoeqERKS_>
 80014f2:	2800      	cmp	r0, #0
 80014f4:	d004      	beq.n	8001500 <_ZNK10__cxxabiv117__class_type_info11__do_upcastEPKS0_PKvRNS0_15__upcast_resultE+0x18>
 80014f6:	2308      	movs	r3, #8
 80014f8:	60e3      	str	r3, [r4, #12]
 80014fa:	3b02      	subs	r3, #2
 80014fc:	6025      	str	r5, [r4, #0]
 80014fe:	7123      	strb	r3, [r4, #4]
 8001500:	bd38      	pop	{r3, r4, r5, pc}
 8001502:	46c0      	nop			; (mov r8, r8)

08001504 <_ZNK10__cxxabiv117__class_type_info10__do_catchEPKSt9type_infoPPvj>:
 8001504:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
 8001506:	1c05      	adds	r5, r0, #0
 8001508:	1c0c      	adds	r4, r1, #0
 800150a:	1c17      	adds	r7, r2, #0
 800150c:	1c1e      	adds	r6, r3, #0
 800150e:	f7ff ff95 	bl	800143c <_ZNKSt9type_infoeqERKS_>
 8001512:	2800      	cmp	r0, #0
 8001514:	d101      	bne.n	800151a <_ZNK10__cxxabiv117__class_type_info10__do_catchEPKSt9type_infoPPvj+0x16>
 8001516:	2e03      	cmp	r6, #3
 8001518:	d900      	bls.n	800151c <_ZNK10__cxxabiv117__class_type_info10__do_catchEPKSt9type_infoPPvj+0x18>
 800151a:	bdf8      	pop	{r3, r4, r5, r6, r7, pc}
 800151c:	6823      	ldr	r3, [r4, #0]
 800151e:	1c20      	adds	r0, r4, #0
 8001520:	695b      	ldr	r3, [r3, #20]
 8001522:	1c29      	adds	r1, r5, #0
 8001524:	1c3a      	adds	r2, r7, #0
 8001526:	4798      	blx	r3
 8001528:	e7f7      	b.n	800151a <_ZNK10__cxxabiv117__class_type_info10__do_catchEPKSt9type_infoPPvj+0x16>
 800152a:	46c0      	nop			; (mov r8, r8)

0800152c <_ZNK10__cxxabiv117__class_type_info12__do_dyncastEiNS0_10__sub_kindEPKS0_PKvS3_S5_RNS0_16__dyncast_resultE>:
 800152c:	b570      	push	{r4, r5, r6, lr}
 800152e:	1c16      	adds	r6, r2, #0
 8001530:	1c1d      	adds	r5, r3, #0
 8001532:	9a06      	ldr	r2, [sp, #24]
 8001534:	9b04      	ldr	r3, [sp, #16]
 8001536:	1c04      	adds	r4, r0, #0
 8001538:	4293      	cmp	r3, r2
 800153a:	d00e      	beq.n	800155a <_ZNK10__cxxabiv117__class_type_info12__do_dyncastEiNS0_10__sub_kindEPKS0_PKvS3_S5_RNS0_16__dyncast_resultE+0x2e>
 800153c:	1c20      	adds	r0, r4, #0
 800153e:	1c29      	adds	r1, r5, #0
 8001540:	f7ff ff7c 	bl	800143c <_ZNKSt9type_infoeqERKS_>
 8001544:	2800      	cmp	r0, #0
 8001546:	d006      	beq.n	8001556 <_ZNK10__cxxabiv117__class_type_info12__do_dyncastEiNS0_10__sub_kindEPKS0_PKvS3_S5_RNS0_16__dyncast_resultE+0x2a>
 8001548:	9b07      	ldr	r3, [sp, #28]
 800154a:	9a04      	ldr	r2, [sp, #16]
 800154c:	711e      	strb	r6, [r3, #4]
 800154e:	601a      	str	r2, [r3, #0]
 8001550:	2301      	movs	r3, #1
 8001552:	9a07      	ldr	r2, [sp, #28]
 8001554:	7193      	strb	r3, [r2, #6]
 8001556:	2000      	movs	r0, #0
 8001558:	bd70      	pop	{r4, r5, r6, pc}
 800155a:	9905      	ldr	r1, [sp, #20]
 800155c:	f7ff ff6e 	bl	800143c <_ZNKSt9type_infoeqERKS_>
 8001560:	2800      	cmp	r0, #0
 8001562:	d0eb      	beq.n	800153c <_ZNK10__cxxabiv117__class_type_info12__do_dyncastEiNS0_10__sub_kindEPKS0_PKvS3_S5_RNS0_16__dyncast_resultE+0x10>
 8001564:	9b07      	ldr	r3, [sp, #28]
 8001566:	715e      	strb	r6, [r3, #5]
 8001568:	e7f5      	b.n	8001556 <_ZNK10__cxxabiv117__class_type_info12__do_dyncastEiNS0_10__sub_kindEPKS0_PKvS3_S5_RNS0_16__dyncast_resultE+0x2a>
 800156a:	46c0      	nop			; (mov r8, r8)

0800156c <__gnu_thumb1_case_uqi>:
 800156c:	b402      	push	{r1}
 800156e:	4671      	mov	r1, lr
 8001570:	0849      	lsrs	r1, r1, #1
 8001572:	0049      	lsls	r1, r1, #1
 8001574:	5c09      	ldrb	r1, [r1, r0]
 8001576:	0049      	lsls	r1, r1, #1
 8001578:	448e      	add	lr, r1
 800157a:	bc02      	pop	{r1}
 800157c:	4770      	bx	lr
 800157e:	46c0      	nop			; (mov r8, r8)

08001580 <__aeabi_uidiv>:
 8001580:	2900      	cmp	r1, #0
 8001582:	d034      	beq.n	80015ee <.udivsi3_skip_div0_test+0x6a>

08001584 <.udivsi3_skip_div0_test>:
 8001584:	2301      	movs	r3, #1
 8001586:	2200      	movs	r2, #0
 8001588:	b410      	push	{r4}
 800158a:	4288      	cmp	r0, r1
 800158c:	d32c      	bcc.n	80015e8 <.udivsi3_skip_div0_test+0x64>
 800158e:	2401      	movs	r4, #1
 8001590:	0724      	lsls	r4, r4, #28
 8001592:	42a1      	cmp	r1, r4
 8001594:	d204      	bcs.n	80015a0 <.udivsi3_skip_div0_test+0x1c>
 8001596:	4281      	cmp	r1, r0
 8001598:	d202      	bcs.n	80015a0 <.udivsi3_skip_div0_test+0x1c>
 800159a:	0109      	lsls	r1, r1, #4
 800159c:	011b      	lsls	r3, r3, #4
 800159e:	e7f8      	b.n	8001592 <.udivsi3_skip_div0_test+0xe>
 80015a0:	00e4      	lsls	r4, r4, #3
 80015a2:	42a1      	cmp	r1, r4
 80015a4:	d204      	bcs.n	80015b0 <.udivsi3_skip_div0_test+0x2c>
 80015a6:	4281      	cmp	r1, r0
 80015a8:	d202      	bcs.n	80015b0 <.udivsi3_skip_div0_test+0x2c>
 80015aa:	0049      	lsls	r1, r1, #1
 80015ac:	005b      	lsls	r3, r3, #1
 80015ae:	e7f8      	b.n	80015a2 <.udivsi3_skip_div0_test+0x1e>
 80015b0:	4288      	cmp	r0, r1
 80015b2:	d301      	bcc.n	80015b8 <.udivsi3_skip_div0_test+0x34>
 80015b4:	1a40      	subs	r0, r0, r1
 80015b6:	431a      	orrs	r2, r3
 80015b8:	084c      	lsrs	r4, r1, #1
 80015ba:	42a0      	cmp	r0, r4
 80015bc:	d302      	bcc.n	80015c4 <.udivsi3_skip_div0_test+0x40>
 80015be:	1b00      	subs	r0, r0, r4
 80015c0:	085c      	lsrs	r4, r3, #1
 80015c2:	4322      	orrs	r2, r4
 80015c4:	088c      	lsrs	r4, r1, #2
 80015c6:	42a0      	cmp	r0, r4
 80015c8:	d302      	bcc.n	80015d0 <.udivsi3_skip_div0_test+0x4c>
 80015ca:	1b00      	subs	r0, r0, r4
 80015cc:	089c      	lsrs	r4, r3, #2
 80015ce:	4322      	orrs	r2, r4
 80015d0:	08cc      	lsrs	r4, r1, #3
 80015d2:	42a0      	cmp	r0, r4
 80015d4:	d302      	bcc.n	80015dc <.udivsi3_skip_div0_test+0x58>
 80015d6:	1b00      	subs	r0, r0, r4
 80015d8:	08dc      	lsrs	r4, r3, #3
 80015da:	4322      	orrs	r2, r4
 80015dc:	2800      	cmp	r0, #0
 80015de:	d003      	beq.n	80015e8 <.udivsi3_skip_div0_test+0x64>
 80015e0:	091b      	lsrs	r3, r3, #4
 80015e2:	d001      	beq.n	80015e8 <.udivsi3_skip_div0_test+0x64>
 80015e4:	0909      	lsrs	r1, r1, #4
 80015e6:	e7e3      	b.n	80015b0 <.udivsi3_skip_div0_test+0x2c>
 80015e8:	1c10      	adds	r0, r2, #0
 80015ea:	bc10      	pop	{r4}
 80015ec:	4770      	bx	lr
 80015ee:	2800      	cmp	r0, #0
 80015f0:	d001      	beq.n	80015f6 <.udivsi3_skip_div0_test+0x72>
 80015f2:	2000      	movs	r0, #0
 80015f4:	43c0      	mvns	r0, r0
 80015f6:	b407      	push	{r0, r1, r2}
 80015f8:	4802      	ldr	r0, [pc, #8]	; (8001604 <.udivsi3_skip_div0_test+0x80>)
 80015fa:	a102      	add	r1, pc, #8	; (adr r1, 8001604 <.udivsi3_skip_div0_test+0x80>)
 80015fc:	1840      	adds	r0, r0, r1
 80015fe:	9002      	str	r0, [sp, #8]
 8001600:	bd03      	pop	{r0, r1, pc}
 8001602:	46c0      	nop			; (mov r8, r8)
 8001604:	000000d9 	.word	0x000000d9

08001608 <__aeabi_uidivmod>:
 8001608:	2900      	cmp	r1, #0
 800160a:	d0f0      	beq.n	80015ee <.udivsi3_skip_div0_test+0x6a>
 800160c:	b503      	push	{r0, r1, lr}
 800160e:	f7ff ffb9 	bl	8001584 <.udivsi3_skip_div0_test>
 8001612:	bc0e      	pop	{r1, r2, r3}
 8001614:	4342      	muls	r2, r0
 8001616:	1a89      	subs	r1, r1, r2
 8001618:	4718      	bx	r3
 800161a:	46c0      	nop			; (mov r8, r8)

0800161c <__aeabi_idiv>:
 800161c:	2900      	cmp	r1, #0
 800161e:	d041      	beq.n	80016a4 <.divsi3_skip_div0_test+0x84>

08001620 <.divsi3_skip_div0_test>:
 8001620:	b410      	push	{r4}
 8001622:	1c04      	adds	r4, r0, #0
 8001624:	404c      	eors	r4, r1
 8001626:	46a4      	mov	ip, r4
 8001628:	2301      	movs	r3, #1
 800162a:	2200      	movs	r2, #0
 800162c:	2900      	cmp	r1, #0
 800162e:	d500      	bpl.n	8001632 <.divsi3_skip_div0_test+0x12>
 8001630:	4249      	negs	r1, r1
 8001632:	2800      	cmp	r0, #0
 8001634:	d500      	bpl.n	8001638 <.divsi3_skip_div0_test+0x18>
 8001636:	4240      	negs	r0, r0
 8001638:	4288      	cmp	r0, r1
 800163a:	d32c      	bcc.n	8001696 <.divsi3_skip_div0_test+0x76>
 800163c:	2401      	movs	r4, #1
 800163e:	0724      	lsls	r4, r4, #28
 8001640:	42a1      	cmp	r1, r4
 8001642:	d204      	bcs.n	800164e <.divsi3_skip_div0_test+0x2e>
 8001644:	4281      	cmp	r1, r0
 8001646:	d202      	bcs.n	800164e <.divsi3_skip_div0_test+0x2e>
 8001648:	0109      	lsls	r1, r1, #4
 800164a:	011b      	lsls	r3, r3, #4
 800164c:	e7f8      	b.n	8001640 <.divsi3_skip_div0_test+0x20>
 800164e:	00e4      	lsls	r4, r4, #3
 8001650:	42a1      	cmp	r1, r4
 8001652:	d204      	bcs.n	800165e <.divsi3_skip_div0_test+0x3e>
 8001654:	4281      	cmp	r1, r0
 8001656:	d202      	bcs.n	800165e <.divsi3_skip_div0_test+0x3e>
 8001658:	0049      	lsls	r1, r1, #1
 800165a:	005b      	lsls	r3, r3, #1
 800165c:	e7f8      	b.n	8001650 <.divsi3_skip_div0_test+0x30>
 800165e:	4288      	cmp	r0, r1
 8001660:	d301      	bcc.n	8001666 <.divsi3_skip_div0_test+0x46>
 8001662:	1a40      	subs	r0, r0, r1
 8001664:	431a      	orrs	r2, r3
 8001666:	084c      	lsrs	r4, r1, #1
 8001668:	42a0      	cmp	r0, r4
 800166a:	d302      	bcc.n	8001672 <.divsi3_skip_div0_test+0x52>
 800166c:	1b00      	subs	r0, r0, r4
 800166e:	085c      	lsrs	r4, r3, #1
 8001670:	4322      	orrs	r2, r4
 8001672:	088c      	lsrs	r4, r1, #2
 8001674:	42a0      	cmp	r0, r4
 8001676:	d302      	bcc.n	800167e <.divsi3_skip_div0_test+0x5e>
 8001678:	1b00      	subs	r0, r0, r4
 800167a:	089c      	lsrs	r4, r3, #2
 800167c:	4322      	orrs	r2, r4
 800167e:	08cc      	lsrs	r4, r1, #3
 8001680:	42a0      	cmp	r0, r4
 8001682:	d302      	bcc.n	800168a <.divsi3_skip_div0_test+0x6a>
 8001684:	1b00      	subs	r0, r0, r4
 8001686:	08dc      	lsrs	r4, r3, #3
 8001688:	4322      	orrs	r2, r4
 800168a:	2800      	cmp	r0, #0
 800168c:	d003      	beq.n	8001696 <.divsi3_skip_div0_test+0x76>
 800168e:	091b      	lsrs	r3, r3, #4
 8001690:	d001      	beq.n	8001696 <.divsi3_skip_div0_test+0x76>
 8001692:	0909      	lsrs	r1, r1, #4
 8001694:	e7e3      	b.n	800165e <.divsi3_skip_div0_test+0x3e>
 8001696:	1c10      	adds	r0, r2, #0
 8001698:	4664      	mov	r4, ip
 800169a:	2c00      	cmp	r4, #0
 800169c:	d500      	bpl.n	80016a0 <.divsi3_skip_div0_test+0x80>
 800169e:	4240      	negs	r0, r0
 80016a0:	bc10      	pop	{r4}
 80016a2:	4770      	bx	lr
 80016a4:	2800      	cmp	r0, #0
 80016a6:	d006      	beq.n	80016b6 <.divsi3_skip_div0_test+0x96>
 80016a8:	db03      	blt.n	80016b2 <.divsi3_skip_div0_test+0x92>
 80016aa:	2000      	movs	r0, #0
 80016ac:	43c0      	mvns	r0, r0
 80016ae:	0840      	lsrs	r0, r0, #1
 80016b0:	e001      	b.n	80016b6 <.divsi3_skip_div0_test+0x96>
 80016b2:	2080      	movs	r0, #128	; 0x80
 80016b4:	0600      	lsls	r0, r0, #24
 80016b6:	b407      	push	{r0, r1, r2}
 80016b8:	4802      	ldr	r0, [pc, #8]	; (80016c4 <.divsi3_skip_div0_test+0xa4>)
 80016ba:	a102      	add	r1, pc, #8	; (adr r1, 80016c4 <.divsi3_skip_div0_test+0xa4>)
 80016bc:	1840      	adds	r0, r0, r1
 80016be:	9002      	str	r0, [sp, #8]
 80016c0:	bd03      	pop	{r0, r1, pc}
 80016c2:	46c0      	nop			; (mov r8, r8)
 80016c4:	00000019 	.word	0x00000019

080016c8 <__aeabi_idivmod>:
 80016c8:	2900      	cmp	r1, #0
 80016ca:	d0eb      	beq.n	80016a4 <.divsi3_skip_div0_test+0x84>
 80016cc:	b503      	push	{r0, r1, lr}
 80016ce:	f7ff ffa7 	bl	8001620 <.divsi3_skip_div0_test>
 80016d2:	bc0e      	pop	{r1, r2, r3}
 80016d4:	4342      	muls	r2, r0
 80016d6:	1a89      	subs	r1, r1, r2
 80016d8:	4718      	bx	r3
 80016da:	46c0      	nop			; (mov r8, r8)

080016dc <__aeabi_idiv0>:
 80016dc:	4770      	bx	lr
 80016de:	46c0      	nop			; (mov r8, r8)

080016e0 <selfrel_offset31>:
 80016e0:	6803      	ldr	r3, [r0, #0]
 80016e2:	005a      	lsls	r2, r3, #1
 80016e4:	d403      	bmi.n	80016ee <selfrel_offset31+0xe>
 80016e6:	005b      	lsls	r3, r3, #1
 80016e8:	085b      	lsrs	r3, r3, #1
 80016ea:	18c0      	adds	r0, r0, r3
 80016ec:	4770      	bx	lr
 80016ee:	2280      	movs	r2, #128	; 0x80
 80016f0:	0612      	lsls	r2, r2, #24
 80016f2:	4313      	orrs	r3, r2
 80016f4:	e7f9      	b.n	80016ea <selfrel_offset31+0xa>
 80016f6:	46c0      	nop			; (mov r8, r8)

080016f8 <search_EIT_table>:
 80016f8:	b5f0      	push	{r4, r5, r6, r7, lr}
 80016fa:	465f      	mov	r7, fp
 80016fc:	4644      	mov	r4, r8
 80016fe:	4656      	mov	r6, sl
 8001700:	464d      	mov	r5, r9
 8001702:	b4f0      	push	{r4, r5, r6, r7}
 8001704:	4680      	mov	r8, r0
 8001706:	b083      	sub	sp, #12
 8001708:	4693      	mov	fp, r2
 800170a:	2900      	cmp	r1, #0
 800170c:	d023      	beq.n	8001756 <search_EIT_table+0x5e>
 800170e:	3901      	subs	r1, #1
 8001710:	9101      	str	r1, [sp, #4]
 8001712:	468a      	mov	sl, r1
 8001714:	2700      	movs	r7, #0
 8001716:	4652      	mov	r2, sl
 8001718:	18bb      	adds	r3, r7, r2
 800171a:	0fdc      	lsrs	r4, r3, #31
 800171c:	18e4      	adds	r4, r4, r3
 800171e:	1064      	asrs	r4, r4, #1
 8001720:	4643      	mov	r3, r8
 8001722:	00e5      	lsls	r5, r4, #3
 8001724:	195e      	adds	r6, r3, r5
 8001726:	1c30      	adds	r0, r6, #0
 8001728:	f7ff ffda 	bl	80016e0 <selfrel_offset31>
 800172c:	9a01      	ldr	r2, [sp, #4]
 800172e:	4681      	mov	r9, r0
 8001730:	42a2      	cmp	r2, r4
 8001732:	d019      	beq.n	8001768 <search_EIT_table+0x70>
 8001734:	3508      	adds	r5, #8
 8001736:	4643      	mov	r3, r8
 8001738:	1958      	adds	r0, r3, r5
 800173a:	f7ff ffd1 	bl	80016e0 <selfrel_offset31>
 800173e:	45d9      	cmp	r9, fp
 8001740:	d904      	bls.n	800174c <search_EIT_table+0x54>
 8001742:	42bc      	cmp	r4, r7
 8001744:	d007      	beq.n	8001756 <search_EIT_table+0x5e>
 8001746:	3c01      	subs	r4, #1
 8001748:	46a2      	mov	sl, r4
 800174a:	e7e4      	b.n	8001716 <search_EIT_table+0x1e>
 800174c:	3801      	subs	r0, #1
 800174e:	4558      	cmp	r0, fp
 8001750:	d202      	bcs.n	8001758 <search_EIT_table+0x60>
 8001752:	1c67      	adds	r7, r4, #1
 8001754:	e7df      	b.n	8001716 <search_EIT_table+0x1e>
 8001756:	2600      	movs	r6, #0
 8001758:	1c30      	adds	r0, r6, #0
 800175a:	b003      	add	sp, #12
 800175c:	bc3c      	pop	{r2, r3, r4, r5}
 800175e:	4690      	mov	r8, r2
 8001760:	4699      	mov	r9, r3
 8001762:	46a2      	mov	sl, r4
 8001764:	46ab      	mov	fp, r5
 8001766:	bdf0      	pop	{r4, r5, r6, r7, pc}
 8001768:	4558      	cmp	r0, fp
 800176a:	d8ea      	bhi.n	8001742 <search_EIT_table+0x4a>
 800176c:	e7f4      	b.n	8001758 <search_EIT_table+0x60>
 800176e:	46c0      	nop			; (mov r8, r8)

08001770 <__gnu_unwind_get_pr_addr>:
 8001770:	2801      	cmp	r0, #1
 8001772:	d009      	beq.n	8001788 <__gnu_unwind_get_pr_addr+0x18>
 8001774:	2802      	cmp	r0, #2
 8001776:	d005      	beq.n	8001784 <__gnu_unwind_get_pr_addr+0x14>
 8001778:	2800      	cmp	r0, #0
 800177a:	d001      	beq.n	8001780 <__gnu_unwind_get_pr_addr+0x10>
 800177c:	2000      	movs	r0, #0
 800177e:	4770      	bx	lr
 8001780:	4802      	ldr	r0, [pc, #8]	; (800178c <__gnu_unwind_get_pr_addr+0x1c>)
 8001782:	e7fc      	b.n	800177e <__gnu_unwind_get_pr_addr+0xe>
 8001784:	4802      	ldr	r0, [pc, #8]	; (8001790 <__gnu_unwind_get_pr_addr+0x20>)
 8001786:	e7fa      	b.n	800177e <__gnu_unwind_get_pr_addr+0xe>
 8001788:	4802      	ldr	r0, [pc, #8]	; (8001794 <__gnu_unwind_get_pr_addr+0x24>)
 800178a:	e7f8      	b.n	800177e <__gnu_unwind_get_pr_addr+0xe>
 800178c:	08001e8d 	.word	0x08001e8d
 8001790:	08001ea5 	.word	0x08001ea5
 8001794:	08001e99 	.word	0x08001e99

08001798 <get_eit_entry>:
 8001798:	b530      	push	{r4, r5, lr}
 800179a:	4b24      	ldr	r3, [pc, #144]	; (800182c <get_eit_entry+0x94>)
 800179c:	b083      	sub	sp, #12
 800179e:	1c04      	adds	r4, r0, #0
 80017a0:	1e8d      	subs	r5, r1, #2
 80017a2:	2b00      	cmp	r3, #0
 80017a4:	d03c      	beq.n	8001820 <get_eit_entry+0x88>
 80017a6:	1c28      	adds	r0, r5, #0
 80017a8:	a901      	add	r1, sp, #4
 80017aa:	e000      	b.n	80017ae <get_eit_entry+0x16>
 80017ac:	bf00      	nop
 80017ae:	1c03      	adds	r3, r0, #0
 80017b0:	2b00      	cmp	r3, #0
 80017b2:	d020      	beq.n	80017f6 <get_eit_entry+0x5e>
 80017b4:	1c2a      	adds	r2, r5, #0
 80017b6:	9901      	ldr	r1, [sp, #4]
 80017b8:	f7ff ff9e 	bl	80016f8 <search_EIT_table>
 80017bc:	1e05      	subs	r5, r0, #0
 80017be:	d01d      	beq.n	80017fc <get_eit_entry+0x64>
 80017c0:	f7ff ff8e 	bl	80016e0 <selfrel_offset31>
 80017c4:	686b      	ldr	r3, [r5, #4]
 80017c6:	64a0      	str	r0, [r4, #72]	; 0x48
 80017c8:	2b01      	cmp	r3, #1
 80017ca:	d010      	beq.n	80017ee <get_eit_entry+0x56>
 80017cc:	1d28      	adds	r0, r5, #4
 80017ce:	2b00      	cmp	r3, #0
 80017d0:	db20      	blt.n	8001814 <get_eit_entry+0x7c>
 80017d2:	f7ff ff85 	bl	80016e0 <selfrel_offset31>
 80017d6:	2300      	movs	r3, #0
 80017d8:	64e0      	str	r0, [r4, #76]	; 0x4c
 80017da:	6523      	str	r3, [r4, #80]	; 0x50
 80017dc:	6803      	ldr	r3, [r0, #0]
 80017de:	2b00      	cmp	r3, #0
 80017e0:	db0f      	blt.n	8001802 <get_eit_entry+0x6a>
 80017e2:	f7ff ff7d 	bl	80016e0 <selfrel_offset31>
 80017e6:	6120      	str	r0, [r4, #16]
 80017e8:	2000      	movs	r0, #0
 80017ea:	b003      	add	sp, #12
 80017ec:	bd30      	pop	{r4, r5, pc}
 80017ee:	2300      	movs	r3, #0
 80017f0:	6123      	str	r3, [r4, #16]
 80017f2:	2005      	movs	r0, #5
 80017f4:	e7f9      	b.n	80017ea <get_eit_entry+0x52>
 80017f6:	6123      	str	r3, [r4, #16]
 80017f8:	2009      	movs	r0, #9
 80017fa:	e7f6      	b.n	80017ea <get_eit_entry+0x52>
 80017fc:	6120      	str	r0, [r4, #16]
 80017fe:	2009      	movs	r0, #9
 8001800:	e7f3      	b.n	80017ea <get_eit_entry+0x52>
 8001802:	011b      	lsls	r3, r3, #4
 8001804:	0f18      	lsrs	r0, r3, #28
 8001806:	f7ff ffb3 	bl	8001770 <__gnu_unwind_get_pr_addr>
 800180a:	6120      	str	r0, [r4, #16]
 800180c:	2800      	cmp	r0, #0
 800180e:	d105      	bne.n	800181c <get_eit_entry+0x84>
 8001810:	2009      	movs	r0, #9
 8001812:	e7ea      	b.n	80017ea <get_eit_entry+0x52>
 8001814:	2301      	movs	r3, #1
 8001816:	64e0      	str	r0, [r4, #76]	; 0x4c
 8001818:	6523      	str	r3, [r4, #80]	; 0x50
 800181a:	e7df      	b.n	80017dc <get_eit_entry+0x44>
 800181c:	2000      	movs	r0, #0
 800181e:	e7e4      	b.n	80017ea <get_eit_entry+0x52>
 8001820:	4803      	ldr	r0, [pc, #12]	; (8001830 <get_eit_entry+0x98>)
 8001822:	4b04      	ldr	r3, [pc, #16]	; (8001834 <get_eit_entry+0x9c>)
 8001824:	1a1b      	subs	r3, r3, r0
 8001826:	10db      	asrs	r3, r3, #3
 8001828:	9301      	str	r3, [sp, #4]
 800182a:	e7c3      	b.n	80017b4 <get_eit_entry+0x1c>
 800182c:	00000000 	.word	0x00000000
 8001830:	08002a9c 	.word	0x08002a9c
 8001834:	08002c04 	.word	0x08002c04

08001838 <restore_non_core_regs>:
 8001838:	6803      	ldr	r3, [r0, #0]
 800183a:	b510      	push	{r4, lr}
 800183c:	1c04      	adds	r4, r0, #0
 800183e:	07da      	lsls	r2, r3, #31
 8001840:	d405      	bmi.n	800184e <restore_non_core_regs+0x16>
 8001842:	079a      	lsls	r2, r3, #30
 8001844:	d50f      	bpl.n	8001866 <restore_non_core_regs+0x2e>
 8001846:	3048      	adds	r0, #72	; 0x48
 8001848:	f000 fc7e 	bl	8002148 <__gnu_Unwind_Restore_VFP_D>
 800184c:	6823      	ldr	r3, [r4, #0]
 800184e:	075a      	lsls	r2, r3, #29
 8001850:	d50f      	bpl.n	8001872 <restore_non_core_regs+0x3a>
 8001852:	071a      	lsls	r2, r3, #28
 8001854:	d514      	bpl.n	8001880 <restore_non_core_regs+0x48>
 8001856:	06da      	lsls	r2, r3, #27
 8001858:	d404      	bmi.n	8001864 <restore_non_core_regs+0x2c>
 800185a:	23e8      	movs	r3, #232	; 0xe8
 800185c:	005b      	lsls	r3, r3, #1
 800185e:	18e0      	adds	r0, r4, r3
 8001860:	f000 fc7e 	bl	8002160 <__gnu_Unwind_Restore_WMMXC>
 8001864:	bd10      	pop	{r4, pc}
 8001866:	3048      	adds	r0, #72	; 0x48
 8001868:	f000 fc6a 	bl	8002140 <__gnu_Unwind_Restore_VFP>
 800186c:	6823      	ldr	r3, [r4, #0]
 800186e:	075a      	lsls	r2, r3, #29
 8001870:	d4ef      	bmi.n	8001852 <restore_non_core_regs+0x1a>
 8001872:	1c20      	adds	r0, r4, #0
 8001874:	30d0      	adds	r0, #208	; 0xd0
 8001876:	f000 fc6b 	bl	8002150 <__gnu_Unwind_Restore_VFP_D_16_to_31>
 800187a:	6823      	ldr	r3, [r4, #0]
 800187c:	071a      	lsls	r2, r3, #28
 800187e:	d4ea      	bmi.n	8001856 <restore_non_core_regs+0x1e>
 8001880:	23a8      	movs	r3, #168	; 0xa8
 8001882:	005b      	lsls	r3, r3, #1
 8001884:	18e0      	adds	r0, r4, r3
 8001886:	f000 fc67 	bl	8002158 <__gnu_Unwind_Restore_WMMXD>
 800188a:	6823      	ldr	r3, [r4, #0]
 800188c:	e7e3      	b.n	8001856 <restore_non_core_regs+0x1e>
 800188e:	46c0      	nop			; (mov r8, r8)

08001890 <_Unwind_decode_typeinfo_ptr.isra.0>:
 8001890:	6802      	ldr	r2, [r0, #0]
 8001892:	2300      	movs	r3, #0
 8001894:	2a00      	cmp	r2, #0
 8001896:	d000      	beq.n	800189a <_Unwind_decode_typeinfo_ptr.isra.0+0xa>
 8001898:	1813      	adds	r3, r2, r0
 800189a:	1c18      	adds	r0, r3, #0
 800189c:	4770      	bx	lr
 800189e:	46c0      	nop			; (mov r8, r8)

080018a0 <__gnu_unwind_24bit.isra.1>:
 80018a0:	2009      	movs	r0, #9
 80018a2:	4770      	bx	lr

080018a4 <_Unwind_DebugHook>:
 80018a4:	4770      	bx	lr
 80018a6:	46c0      	nop			; (mov r8, r8)

080018a8 <unwind_phase2>:
 80018a8:	b538      	push	{r3, r4, r5, lr}
 80018aa:	1c04      	adds	r4, r0, #0
 80018ac:	1c0d      	adds	r5, r1, #0
 80018ae:	e008      	b.n	80018c2 <unwind_phase2+0x1a>
 80018b0:	6c2b      	ldr	r3, [r5, #64]	; 0x40
 80018b2:	2001      	movs	r0, #1
 80018b4:	6163      	str	r3, [r4, #20]
 80018b6:	1c21      	adds	r1, r4, #0
 80018b8:	1c2a      	adds	r2, r5, #0
 80018ba:	6923      	ldr	r3, [r4, #16]
 80018bc:	4798      	blx	r3
 80018be:	2808      	cmp	r0, #8
 80018c0:	d107      	bne.n	80018d2 <unwind_phase2+0x2a>
 80018c2:	1c20      	adds	r0, r4, #0
 80018c4:	6c29      	ldr	r1, [r5, #64]	; 0x40
 80018c6:	f7ff ff67 	bl	8001798 <get_eit_entry>
 80018ca:	2800      	cmp	r0, #0
 80018cc:	d0f0      	beq.n	80018b0 <unwind_phase2+0x8>
 80018ce:	f000 fe95 	bl	80025fc <abort>
 80018d2:	2807      	cmp	r0, #7
 80018d4:	d1fb      	bne.n	80018ce <unwind_phase2+0x26>
 80018d6:	2000      	movs	r0, #0
 80018d8:	6c29      	ldr	r1, [r5, #64]	; 0x40
 80018da:	f7ff ffe3 	bl	80018a4 <_Unwind_DebugHook>
 80018de:	1d28      	adds	r0, r5, #4
 80018e0:	f000 fc18 	bl	8002114 <__restore_core_regs>

080018e4 <unwind_phase2_forced>:
 80018e4:	b5f0      	push	{r4, r5, r6, r7, lr}
 80018e6:	464f      	mov	r7, r9
 80018e8:	4646      	mov	r6, r8
 80018ea:	b4c0      	push	{r6, r7}
 80018ec:	68c3      	ldr	r3, [r0, #12]
 80018ee:	4c31      	ldr	r4, [pc, #196]	; (80019b4 <unwind_phase2_forced+0xd0>)
 80018f0:	4698      	mov	r8, r3
 80018f2:	44a5      	add	sp, r4
 80018f4:	6983      	ldr	r3, [r0, #24]
 80018f6:	1c05      	adds	r5, r0, #0
 80018f8:	1c17      	adds	r7, r2, #0
 80018fa:	3104      	adds	r1, #4
 80018fc:	2240      	movs	r2, #64	; 0x40
 80018fe:	ac02      	add	r4, sp, #8
 8001900:	a803      	add	r0, sp, #12
 8001902:	4699      	mov	r9, r3
 8001904:	f000 fe82 	bl	800260c <memcpy>
 8001908:	2300      	movs	r3, #0
 800190a:	1c28      	adds	r0, r5, #0
 800190c:	6c21      	ldr	r1, [r4, #64]	; 0x40
 800190e:	9302      	str	r3, [sp, #8]
 8001910:	f7ff ff42 	bl	8001798 <get_eit_entry>
 8001914:	1e7b      	subs	r3, r7, #1
 8001916:	419f      	sbcs	r7, r3
 8001918:	1c06      	adds	r6, r0, #0
 800191a:	3709      	adds	r7, #9
 800191c:	2e00      	cmp	r6, #0
 800191e:	d014      	beq.n	800194a <unwind_phase2_forced+0x66>
 8001920:	6ba3      	ldr	r3, [r4, #56]	; 0x38
 8001922:	2110      	movs	r1, #16
 8001924:	6463      	str	r3, [r4, #68]	; 0x44
 8001926:	464b      	mov	r3, r9
 8001928:	9301      	str	r3, [sp, #4]
 800192a:	4339      	orrs	r1, r7
 800192c:	9400      	str	r4, [sp, #0]
 800192e:	2001      	movs	r0, #1
 8001930:	1c2a      	adds	r2, r5, #0
 8001932:	1c2b      	adds	r3, r5, #0
 8001934:	47c0      	blx	r8
 8001936:	2800      	cmp	r0, #0
 8001938:	d132      	bne.n	80019a0 <unwind_phase2_forced+0xbc>
 800193a:	1c30      	adds	r0, r6, #0
 800193c:	23f3      	movs	r3, #243	; 0xf3
 800193e:	009b      	lsls	r3, r3, #2
 8001940:	449d      	add	sp, r3
 8001942:	bc0c      	pop	{r2, r3}
 8001944:	4690      	mov	r8, r2
 8001946:	4699      	mov	r9, r3
 8001948:	bdf0      	pop	{r4, r5, r6, r7, pc}
 800194a:	6c23      	ldr	r3, [r4, #64]	; 0x40
 800194c:	22f0      	movs	r2, #240	; 0xf0
 800194e:	616b      	str	r3, [r5, #20]
 8001950:	1c21      	adds	r1, r4, #0
 8001952:	0052      	lsls	r2, r2, #1
 8001954:	a87a      	add	r0, sp, #488	; 0x1e8
 8001956:	f000 fe59 	bl	800260c <memcpy>
 800195a:	1c29      	adds	r1, r5, #0
 800195c:	aa7a      	add	r2, sp, #488	; 0x1e8
 800195e:	692b      	ldr	r3, [r5, #16]
 8001960:	1c38      	adds	r0, r7, #0
 8001962:	4798      	blx	r3
 8001964:	9b88      	ldr	r3, [sp, #544]	; 0x220
 8001966:	1c06      	adds	r6, r0, #0
 8001968:	6463      	str	r3, [r4, #68]	; 0x44
 800196a:	464b      	mov	r3, r9
 800196c:	9301      	str	r3, [sp, #4]
 800196e:	9400      	str	r4, [sp, #0]
 8001970:	2001      	movs	r0, #1
 8001972:	1c39      	adds	r1, r7, #0
 8001974:	1c2a      	adds	r2, r5, #0
 8001976:	1c2b      	adds	r3, r5, #0
 8001978:	47c0      	blx	r8
 800197a:	2800      	cmp	r0, #0
 800197c:	d110      	bne.n	80019a0 <unwind_phase2_forced+0xbc>
 800197e:	22f0      	movs	r2, #240	; 0xf0
 8001980:	1c20      	adds	r0, r4, #0
 8001982:	a97a      	add	r1, sp, #488	; 0x1e8
 8001984:	0052      	lsls	r2, r2, #1
 8001986:	f000 fe41 	bl	800260c <memcpy>
 800198a:	2e08      	cmp	r6, #8
 800198c:	d106      	bne.n	800199c <unwind_phase2_forced+0xb8>
 800198e:	1c28      	adds	r0, r5, #0
 8001990:	6c21      	ldr	r1, [r4, #64]	; 0x40
 8001992:	f7ff ff01 	bl	8001798 <get_eit_entry>
 8001996:	2709      	movs	r7, #9
 8001998:	1c06      	adds	r6, r0, #0
 800199a:	e7bf      	b.n	800191c <unwind_phase2_forced+0x38>
 800199c:	2e07      	cmp	r6, #7
 800199e:	d001      	beq.n	80019a4 <unwind_phase2_forced+0xc0>
 80019a0:	2009      	movs	r0, #9
 80019a2:	e7cb      	b.n	800193c <unwind_phase2_forced+0x58>
 80019a4:	2000      	movs	r0, #0
 80019a6:	6c21      	ldr	r1, [r4, #64]	; 0x40
 80019a8:	f7ff ff7c 	bl	80018a4 <_Unwind_DebugHook>
 80019ac:	a803      	add	r0, sp, #12
 80019ae:	f000 fbb1 	bl	8002114 <__restore_core_regs>
 80019b2:	46c0      	nop			; (mov r8, r8)
 80019b4:	fffffc34 	.word	0xfffffc34

080019b8 <_Unwind_GetCFA>:
 80019b8:	6c40      	ldr	r0, [r0, #68]	; 0x44
 80019ba:	4770      	bx	lr

080019bc <__gnu_Unwind_RaiseException>:
 80019bc:	b570      	push	{r4, r5, r6, lr}
 80019be:	6bcb      	ldr	r3, [r1, #60]	; 0x3c
 80019c0:	b0f8      	sub	sp, #480	; 0x1e0
 80019c2:	640b      	str	r3, [r1, #64]	; 0x40
 80019c4:	1c04      	adds	r4, r0, #0
 80019c6:	1c0e      	adds	r6, r1, #0
 80019c8:	a801      	add	r0, sp, #4
 80019ca:	3104      	adds	r1, #4
 80019cc:	2240      	movs	r2, #64	; 0x40
 80019ce:	f000 fe1d 	bl	800260c <memcpy>
 80019d2:	2301      	movs	r3, #1
 80019d4:	425b      	negs	r3, r3
 80019d6:	9300      	str	r3, [sp, #0]
 80019d8:	e006      	b.n	80019e8 <__gnu_Unwind_RaiseException+0x2c>
 80019da:	1c21      	adds	r1, r4, #0
 80019dc:	466a      	mov	r2, sp
 80019de:	6923      	ldr	r3, [r4, #16]
 80019e0:	4798      	blx	r3
 80019e2:	1e05      	subs	r5, r0, #0
 80019e4:	2d08      	cmp	r5, #8
 80019e6:	d108      	bne.n	80019fa <__gnu_Unwind_RaiseException+0x3e>
 80019e8:	1c20      	adds	r0, r4, #0
 80019ea:	9910      	ldr	r1, [sp, #64]	; 0x40
 80019ec:	f7ff fed4 	bl	8001798 <get_eit_entry>
 80019f0:	2800      	cmp	r0, #0
 80019f2:	d0f2      	beq.n	80019da <__gnu_Unwind_RaiseException+0x1e>
 80019f4:	2009      	movs	r0, #9
 80019f6:	b078      	add	sp, #480	; 0x1e0
 80019f8:	bd70      	pop	{r4, r5, r6, pc}
 80019fa:	4668      	mov	r0, sp
 80019fc:	f7ff ff1c 	bl	8001838 <restore_non_core_regs>
 8001a00:	2d06      	cmp	r5, #6
 8001a02:	d1f7      	bne.n	80019f4 <__gnu_Unwind_RaiseException+0x38>
 8001a04:	1c20      	adds	r0, r4, #0
 8001a06:	1c31      	adds	r1, r6, #0
 8001a08:	f7ff ff4e 	bl	80018a8 <unwind_phase2>

08001a0c <__gnu_Unwind_ForcedUnwind>:
 8001a0c:	b508      	push	{r3, lr}
 8001a0e:	6182      	str	r2, [r0, #24]
 8001a10:	6bda      	ldr	r2, [r3, #60]	; 0x3c
 8001a12:	60c1      	str	r1, [r0, #12]
 8001a14:	641a      	str	r2, [r3, #64]	; 0x40
 8001a16:	1c19      	adds	r1, r3, #0
 8001a18:	2200      	movs	r2, #0
 8001a1a:	f7ff ff63 	bl	80018e4 <unwind_phase2_forced>
 8001a1e:	bd08      	pop	{r3, pc}

08001a20 <__gnu_Unwind_Resume>:
 8001a20:	b538      	push	{r3, r4, r5, lr}
 8001a22:	6943      	ldr	r3, [r0, #20]
 8001a24:	1c04      	adds	r4, r0, #0
 8001a26:	640b      	str	r3, [r1, #64]	; 0x40
 8001a28:	68c3      	ldr	r3, [r0, #12]
 8001a2a:	1c0d      	adds	r5, r1, #0
 8001a2c:	2b00      	cmp	r3, #0
 8001a2e:	d004      	beq.n	8001a3a <__gnu_Unwind_Resume+0x1a>
 8001a30:	2201      	movs	r2, #1
 8001a32:	f7ff ff57 	bl	80018e4 <unwind_phase2_forced>
 8001a36:	f000 fde1 	bl	80025fc <abort>
 8001a3a:	2002      	movs	r0, #2
 8001a3c:	1c21      	adds	r1, r4, #0
 8001a3e:	1c2a      	adds	r2, r5, #0
 8001a40:	6923      	ldr	r3, [r4, #16]
 8001a42:	4798      	blx	r3
 8001a44:	2807      	cmp	r0, #7
 8001a46:	d007      	beq.n	8001a58 <__gnu_Unwind_Resume+0x38>
 8001a48:	2808      	cmp	r0, #8
 8001a4a:	d103      	bne.n	8001a54 <__gnu_Unwind_Resume+0x34>
 8001a4c:	1c20      	adds	r0, r4, #0
 8001a4e:	1c29      	adds	r1, r5, #0
 8001a50:	f7ff ff2a 	bl	80018a8 <unwind_phase2>
 8001a54:	f000 fdd2 	bl	80025fc <abort>
 8001a58:	2000      	movs	r0, #0
 8001a5a:	6c29      	ldr	r1, [r5, #64]	; 0x40
 8001a5c:	f7ff ff22 	bl	80018a4 <_Unwind_DebugHook>
 8001a60:	1d28      	adds	r0, r5, #4
 8001a62:	f000 fb57 	bl	8002114 <__restore_core_regs>
 8001a66:	46c0      	nop			; (mov r8, r8)

08001a68 <__gnu_Unwind_Resume_or_Rethrow>:
 8001a68:	b508      	push	{r3, lr}
 8001a6a:	68c3      	ldr	r3, [r0, #12]
 8001a6c:	2b00      	cmp	r3, #0
 8001a6e:	d005      	beq.n	8001a7c <__gnu_Unwind_Resume_or_Rethrow+0x14>
 8001a70:	6bcb      	ldr	r3, [r1, #60]	; 0x3c
 8001a72:	2200      	movs	r2, #0
 8001a74:	640b      	str	r3, [r1, #64]	; 0x40
 8001a76:	f7ff ff35 	bl	80018e4 <unwind_phase2_forced>
 8001a7a:	bd08      	pop	{r3, pc}
 8001a7c:	f7ff ff9e 	bl	80019bc <__gnu_Unwind_RaiseException>
 8001a80:	e7fb      	b.n	8001a7a <__gnu_Unwind_Resume_or_Rethrow+0x12>
 8001a82:	46c0      	nop			; (mov r8, r8)

08001a84 <_Unwind_Complete>:
 8001a84:	4770      	bx	lr
 8001a86:	46c0      	nop			; (mov r8, r8)

08001a88 <_Unwind_DeleteException>:
 8001a88:	b508      	push	{r3, lr}
 8001a8a:	6883      	ldr	r3, [r0, #8]
 8001a8c:	1c01      	adds	r1, r0, #0
 8001a8e:	2b00      	cmp	r3, #0
 8001a90:	d001      	beq.n	8001a96 <_Unwind_DeleteException+0xe>
 8001a92:	2001      	movs	r0, #1
 8001a94:	4798      	blx	r3
 8001a96:	bd08      	pop	{r3, pc}

08001a98 <_Unwind_VRS_Get>:
 8001a98:	b510      	push	{r4, lr}
 8001a9a:	2901      	cmp	r1, #1
 8001a9c:	d008      	beq.n	8001ab0 <_Unwind_VRS_Get+0x18>
 8001a9e:	2900      	cmp	r1, #0
 8001aa0:	d008      	beq.n	8001ab4 <_Unwind_VRS_Get+0x1c>
 8001aa2:	3903      	subs	r1, #3
 8001aa4:	b2c9      	uxtb	r1, r1
 8001aa6:	2402      	movs	r4, #2
 8001aa8:	2901      	cmp	r1, #1
 8001aaa:	d901      	bls.n	8001ab0 <_Unwind_VRS_Get+0x18>
 8001aac:	1c20      	adds	r0, r4, #0
 8001aae:	bd10      	pop	{r4, pc}
 8001ab0:	2401      	movs	r4, #1
 8001ab2:	e7fb      	b.n	8001aac <_Unwind_VRS_Get+0x14>
 8001ab4:	2402      	movs	r4, #2
 8001ab6:	2b00      	cmp	r3, #0
 8001ab8:	d1f8      	bne.n	8001aac <_Unwind_VRS_Get+0x14>
 8001aba:	2a0f      	cmp	r2, #15
 8001abc:	d8f6      	bhi.n	8001aac <_Unwind_VRS_Get+0x14>
 8001abe:	0092      	lsls	r2, r2, #2
 8001ac0:	1880      	adds	r0, r0, r2
 8001ac2:	6842      	ldr	r2, [r0, #4]
 8001ac4:	9b02      	ldr	r3, [sp, #8]
 8001ac6:	2400      	movs	r4, #0
 8001ac8:	601a      	str	r2, [r3, #0]
 8001aca:	e7ef      	b.n	8001aac <_Unwind_VRS_Get+0x14>

08001acc <_Unwind_GetGR>:
 8001acc:	b500      	push	{lr}
 8001ace:	b085      	sub	sp, #20
 8001ad0:	ab03      	add	r3, sp, #12
 8001ad2:	1c0a      	adds	r2, r1, #0
 8001ad4:	9300      	str	r3, [sp, #0]
 8001ad6:	2100      	movs	r1, #0
 8001ad8:	2300      	movs	r3, #0
 8001ada:	f7ff ffdd 	bl	8001a98 <_Unwind_VRS_Get>
 8001ade:	9803      	ldr	r0, [sp, #12]
 8001ae0:	b005      	add	sp, #20
 8001ae2:	bd00      	pop	{pc}

08001ae4 <_Unwind_VRS_Set>:
 8001ae4:	b510      	push	{r4, lr}
 8001ae6:	2901      	cmp	r1, #1
 8001ae8:	d008      	beq.n	8001afc <_Unwind_VRS_Set+0x18>
 8001aea:	2900      	cmp	r1, #0
 8001aec:	d008      	beq.n	8001b00 <_Unwind_VRS_Set+0x1c>
 8001aee:	3903      	subs	r1, #3
 8001af0:	b2c9      	uxtb	r1, r1
 8001af2:	2402      	movs	r4, #2
 8001af4:	2901      	cmp	r1, #1
 8001af6:	d901      	bls.n	8001afc <_Unwind_VRS_Set+0x18>
 8001af8:	1c20      	adds	r0, r4, #0
 8001afa:	bd10      	pop	{r4, pc}
 8001afc:	2401      	movs	r4, #1
 8001afe:	e7fb      	b.n	8001af8 <_Unwind_VRS_Set+0x14>
 8001b00:	2402      	movs	r4, #2
 8001b02:	2b00      	cmp	r3, #0
 8001b04:	d1f8      	bne.n	8001af8 <_Unwind_VRS_Set+0x14>
 8001b06:	2a0f      	cmp	r2, #15
 8001b08:	d8f6      	bhi.n	8001af8 <_Unwind_VRS_Set+0x14>
 8001b0a:	9b02      	ldr	r3, [sp, #8]
 8001b0c:	0092      	lsls	r2, r2, #2
 8001b0e:	681b      	ldr	r3, [r3, #0]
 8001b10:	1880      	adds	r0, r0, r2
 8001b12:	6043      	str	r3, [r0, #4]
 8001b14:	2400      	movs	r4, #0
 8001b16:	e7ef      	b.n	8001af8 <_Unwind_VRS_Set+0x14>

08001b18 <_Unwind_SetGR>:
 8001b18:	b500      	push	{lr}
 8001b1a:	b085      	sub	sp, #20
 8001b1c:	1c0b      	adds	r3, r1, #0
 8001b1e:	9203      	str	r2, [sp, #12]
 8001b20:	aa03      	add	r2, sp, #12
 8001b22:	9200      	str	r2, [sp, #0]
 8001b24:	2100      	movs	r1, #0
 8001b26:	1c1a      	adds	r2, r3, #0
 8001b28:	2300      	movs	r3, #0
 8001b2a:	f7ff ffdb 	bl	8001ae4 <_Unwind_VRS_Set>
 8001b2e:	b005      	add	sp, #20
 8001b30:	bd00      	pop	{pc}
 8001b32:	46c0      	nop			; (mov r8, r8)

08001b34 <__gnu_Unwind_Backtrace>:
 8001b34:	b570      	push	{r4, r5, r6, lr}
 8001b36:	4c19      	ldr	r4, [pc, #100]	; (8001b9c <__gnu_Unwind_Backtrace+0x68>)
 8001b38:	6bd3      	ldr	r3, [r2, #60]	; 0x3c
 8001b3a:	44a5      	add	sp, r4
 8001b3c:	6413      	str	r3, [r2, #64]	; 0x40
 8001b3e:	1c06      	adds	r6, r0, #0
 8001b40:	1c0d      	adds	r5, r1, #0
 8001b42:	a817      	add	r0, sp, #92	; 0x5c
 8001b44:	1d11      	adds	r1, r2, #4
 8001b46:	2240      	movs	r2, #64	; 0x40
 8001b48:	f000 fd60 	bl	800260c <memcpy>
 8001b4c:	2301      	movs	r3, #1
 8001b4e:	425b      	negs	r3, r3
 8001b50:	9316      	str	r3, [sp, #88]	; 0x58
 8001b52:	e013      	b.n	8001b7c <__gnu_Unwind_Backtrace+0x48>
 8001b54:	a816      	add	r0, sp, #88	; 0x58
 8001b56:	210c      	movs	r1, #12
 8001b58:	466a      	mov	r2, sp
 8001b5a:	f7ff ffdd 	bl	8001b18 <_Unwind_SetGR>
 8001b5e:	a816      	add	r0, sp, #88	; 0x58
 8001b60:	1c29      	adds	r1, r5, #0
 8001b62:	47b0      	blx	r6
 8001b64:	2800      	cmp	r0, #0
 8001b66:	d10f      	bne.n	8001b88 <__gnu_Unwind_Backtrace+0x54>
 8001b68:	2008      	movs	r0, #8
 8001b6a:	4669      	mov	r1, sp
 8001b6c:	aa16      	add	r2, sp, #88	; 0x58
 8001b6e:	9b04      	ldr	r3, [sp, #16]
 8001b70:	4798      	blx	r3
 8001b72:	1e04      	subs	r4, r0, #0
 8001b74:	2c05      	cmp	r4, #5
 8001b76:	d008      	beq.n	8001b8a <__gnu_Unwind_Backtrace+0x56>
 8001b78:	2809      	cmp	r0, #9
 8001b7a:	d005      	beq.n	8001b88 <__gnu_Unwind_Backtrace+0x54>
 8001b7c:	4668      	mov	r0, sp
 8001b7e:	9926      	ldr	r1, [sp, #152]	; 0x98
 8001b80:	f7ff fe0a 	bl	8001798 <get_eit_entry>
 8001b84:	2800      	cmp	r0, #0
 8001b86:	d0e5      	beq.n	8001b54 <__gnu_Unwind_Backtrace+0x20>
 8001b88:	2409      	movs	r4, #9
 8001b8a:	a816      	add	r0, sp, #88	; 0x58
 8001b8c:	f7ff fe54 	bl	8001838 <restore_non_core_regs>
 8001b90:	1c20      	adds	r0, r4, #0
 8001b92:	238e      	movs	r3, #142	; 0x8e
 8001b94:	009b      	lsls	r3, r3, #2
 8001b96:	449d      	add	sp, r3
 8001b98:	bd70      	pop	{r4, r5, r6, pc}
 8001b9a:	46c0      	nop			; (mov r8, r8)
 8001b9c:	fffffdc8 	.word	0xfffffdc8

08001ba0 <__gnu_unwind_pr_common>:
 8001ba0:	b5f0      	push	{r4, r5, r6, r7, lr}
 8001ba2:	465f      	mov	r7, fp
 8001ba4:	4656      	mov	r6, sl
 8001ba6:	464d      	mov	r5, r9
 8001ba8:	4644      	mov	r4, r8
 8001baa:	b4f0      	push	{r4, r5, r6, r7}
 8001bac:	1c0c      	adds	r4, r1, #0
 8001bae:	1c1d      	adds	r5, r3, #0
 8001bb0:	6ce3      	ldr	r3, [r4, #76]	; 0x4c
 8001bb2:	4693      	mov	fp, r2
 8001bb4:	2203      	movs	r2, #3
 8001bb6:	1d1e      	adds	r6, r3, #4
 8001bb8:	1c11      	adds	r1, r2, #0
 8001bba:	681b      	ldr	r3, [r3, #0]
 8001bbc:	b08b      	sub	sp, #44	; 0x2c
 8001bbe:	4001      	ands	r1, r0
 8001bc0:	9101      	str	r1, [sp, #4]
 8001bc2:	9307      	str	r3, [sp, #28]
 8001bc4:	9608      	str	r6, [sp, #32]
 8001bc6:	2d00      	cmp	r5, #0
 8001bc8:	d169      	bne.n	8001c9e <__gnu_unwind_pr_common+0xfe>
 8001bca:	021b      	lsls	r3, r3, #8
 8001bcc:	9307      	str	r3, [sp, #28]
 8001bce:	2325      	movs	r3, #37	; 0x25
 8001bd0:	446b      	add	r3, sp
 8001bd2:	a909      	add	r1, sp, #36	; 0x24
 8001bd4:	701d      	strb	r5, [r3, #0]
 8001bd6:	700a      	strb	r2, [r1, #0]
 8001bd8:	9a01      	ldr	r2, [sp, #4]
 8001bda:	2a02      	cmp	r2, #2
 8001bdc:	d100      	bne.n	8001be0 <__gnu_unwind_pr_common+0x40>
 8001bde:	e071      	b.n	8001cc4 <__gnu_unwind_pr_common+0x124>
 8001be0:	6d23      	ldr	r3, [r4, #80]	; 0x50
 8001be2:	07db      	lsls	r3, r3, #31
 8001be4:	d448      	bmi.n	8001c78 <__gnu_unwind_pr_common+0xd8>
 8001be6:	2308      	movs	r3, #8
 8001be8:	2100      	movs	r1, #0
 8001bea:	4003      	ands	r3, r0
 8001bec:	9102      	str	r1, [sp, #8]
 8001bee:	9303      	str	r3, [sp, #12]
 8001bf0:	46a9      	mov	r9, r5
 8001bf2:	6835      	ldr	r5, [r6, #0]
 8001bf4:	2d00      	cmp	r5, #0
 8001bf6:	d100      	bne.n	8001bfa <__gnu_unwind_pr_common+0x5a>
 8001bf8:	e127      	b.n	8001e4a <__gnu_unwind_pr_common+0x2aa>
 8001bfa:	464a      	mov	r2, r9
 8001bfc:	2a02      	cmp	r2, #2
 8001bfe:	d04b      	beq.n	8001c98 <__gnu_unwind_pr_common+0xf8>
 8001c00:	8835      	ldrh	r5, [r6, #0]
 8001c02:	8877      	ldrh	r7, [r6, #2]
 8001c04:	3604      	adds	r6, #4
 8001c06:	2301      	movs	r3, #1
 8001c08:	469a      	mov	sl, r3
 8001c0a:	4651      	mov	r1, sl
 8001c0c:	6ca2      	ldr	r2, [r4, #72]	; 0x48
 8001c0e:	1c3b      	adds	r3, r7, #0
 8001c10:	438b      	bics	r3, r1
 8001c12:	18d2      	adds	r2, r2, r3
 8001c14:	4658      	mov	r0, fp
 8001c16:	210f      	movs	r1, #15
 8001c18:	4690      	mov	r8, r2
 8001c1a:	f7ff ff57 	bl	8001acc <_Unwind_GetGR>
 8001c1e:	2200      	movs	r2, #0
 8001c20:	4580      	cmp	r8, r0
 8001c22:	d806      	bhi.n	8001c32 <__gnu_unwind_pr_common+0x92>
 8001c24:	1c2a      	adds	r2, r5, #0
 8001c26:	4653      	mov	r3, sl
 8001c28:	439a      	bics	r2, r3
 8001c2a:	4442      	add	r2, r8
 8001c2c:	4290      	cmp	r0, r2
 8001c2e:	4180      	sbcs	r0, r0
 8001c30:	4242      	negs	r2, r0
 8001c32:	2301      	movs	r3, #1
 8001c34:	401f      	ands	r7, r3
 8001c36:	007f      	lsls	r7, r7, #1
 8001c38:	401d      	ands	r5, r3
 8001c3a:	433d      	orrs	r5, r7
 8001c3c:	2d01      	cmp	r5, #1
 8001c3e:	d043      	beq.n	8001cc8 <__gnu_unwind_pr_common+0x128>
 8001c40:	2d00      	cmp	r5, #0
 8001c42:	d060      	beq.n	8001d06 <__gnu_unwind_pr_common+0x166>
 8001c44:	2d02      	cmp	r5, #2
 8001c46:	d11f      	bne.n	8001c88 <__gnu_unwind_pr_common+0xe8>
 8001c48:	6833      	ldr	r3, [r6, #0]
 8001c4a:	0059      	lsls	r1, r3, #1
 8001c4c:	0849      	lsrs	r1, r1, #1
 8001c4e:	468a      	mov	sl, r1
 8001c50:	9901      	ldr	r1, [sp, #4]
 8001c52:	2900      	cmp	r1, #0
 8001c54:	d16a      	bne.n	8001d2c <__gnu_unwind_pr_common+0x18c>
 8001c56:	2a00      	cmp	r2, #0
 8001c58:	d007      	beq.n	8001c6a <__gnu_unwind_pr_common+0xca>
 8001c5a:	9a03      	ldr	r2, [sp, #12]
 8001c5c:	2a00      	cmp	r2, #0
 8001c5e:	d100      	bne.n	8001c62 <__gnu_unwind_pr_common+0xc2>
 8001c60:	e089      	b.n	8001d76 <__gnu_unwind_pr_common+0x1d6>
 8001c62:	4651      	mov	r1, sl
 8001c64:	2900      	cmp	r1, #0
 8001c66:	d100      	bne.n	8001c6a <__gnu_unwind_pr_common+0xca>
 8001c68:	e0b1      	b.n	8001dce <__gnu_unwind_pr_common+0x22e>
 8001c6a:	2b00      	cmp	r3, #0
 8001c6c:	db68      	blt.n	8001d40 <__gnu_unwind_pr_common+0x1a0>
 8001c6e:	4653      	mov	r3, sl
 8001c70:	3301      	adds	r3, #1
 8001c72:	009b      	lsls	r3, r3, #2
 8001c74:	18f6      	adds	r6, r6, r3
 8001c76:	e7bc      	b.n	8001bf2 <__gnu_unwind_pr_common+0x52>
 8001c78:	2200      	movs	r2, #0
 8001c7a:	9202      	str	r2, [sp, #8]
 8001c7c:	2d02      	cmp	r5, #2
 8001c7e:	dd4a      	ble.n	8001d16 <__gnu_unwind_pr_common+0x176>
 8001c80:	f7ff fe0e 	bl	80018a0 <__gnu_unwind_24bit.isra.1>
 8001c84:	2800      	cmp	r0, #0
 8001c86:	d04c      	beq.n	8001d22 <__gnu_unwind_pr_common+0x182>
 8001c88:	2009      	movs	r0, #9
 8001c8a:	b00b      	add	sp, #44	; 0x2c
 8001c8c:	bc3c      	pop	{r2, r3, r4, r5}
 8001c8e:	4690      	mov	r8, r2
 8001c90:	4699      	mov	r9, r3
 8001c92:	46a2      	mov	sl, r4
 8001c94:	46ab      	mov	fp, r5
 8001c96:	bdf0      	pop	{r4, r5, r6, r7, pc}
 8001c98:	6877      	ldr	r7, [r6, #4]
 8001c9a:	3608      	adds	r6, #8
 8001c9c:	e7b3      	b.n	8001c06 <__gnu_unwind_pr_common+0x66>
 8001c9e:	2d02      	cmp	r5, #2
 8001ca0:	dc9a      	bgt.n	8001bd8 <__gnu_unwind_pr_common+0x38>
 8001ca2:	2125      	movs	r1, #37	; 0x25
 8001ca4:	0c1a      	lsrs	r2, r3, #16
 8001ca6:	4469      	add	r1, sp
 8001ca8:	041b      	lsls	r3, r3, #16
 8001caa:	700a      	strb	r2, [r1, #0]
 8001cac:	9307      	str	r3, [sp, #28]
 8001cae:	a909      	add	r1, sp, #36	; 0x24
 8001cb0:	2302      	movs	r3, #2
 8001cb2:	700b      	strb	r3, [r1, #0]
 8001cb4:	23ff      	movs	r3, #255	; 0xff
 8001cb6:	401a      	ands	r2, r3
 8001cb8:	0092      	lsls	r2, r2, #2
 8001cba:	18b6      	adds	r6, r6, r2
 8001cbc:	9a01      	ldr	r2, [sp, #4]
 8001cbe:	2a02      	cmp	r2, #2
 8001cc0:	d000      	beq.n	8001cc4 <__gnu_unwind_pr_common+0x124>
 8001cc2:	e78d      	b.n	8001be0 <__gnu_unwind_pr_common+0x40>
 8001cc4:	6ba6      	ldr	r6, [r4, #56]	; 0x38
 8001cc6:	e78b      	b.n	8001be0 <__gnu_unwind_pr_common+0x40>
 8001cc8:	9b01      	ldr	r3, [sp, #4]
 8001cca:	2b00      	cmp	r3, #0
 8001ccc:	d13a      	bne.n	8001d44 <__gnu_unwind_pr_common+0x1a4>
 8001cce:	2a00      	cmp	r2, #0
 8001cd0:	d017      	beq.n	8001d02 <__gnu_unwind_pr_common+0x162>
 8001cd2:	6831      	ldr	r1, [r6, #0]
 8001cd4:	6873      	ldr	r3, [r6, #4]
 8001cd6:	0fcd      	lsrs	r5, r1, #31
 8001cd8:	1c9a      	adds	r2, r3, #2
 8001cda:	d0d5      	beq.n	8001c88 <__gnu_unwind_pr_common+0xe8>
 8001cdc:	1c21      	adds	r1, r4, #0
 8001cde:	3158      	adds	r1, #88	; 0x58
 8001ce0:	9106      	str	r1, [sp, #24]
 8001ce2:	3301      	adds	r3, #1
 8001ce4:	d100      	bne.n	8001ce8 <__gnu_unwind_pr_common+0x148>
 8001ce6:	e0b2      	b.n	8001e4e <__gnu_unwind_pr_common+0x2ae>
 8001ce8:	1d30      	adds	r0, r6, #4
 8001cea:	f7ff fdd1 	bl	8001890 <_Unwind_decode_typeinfo_ptr.isra.0>
 8001cee:	ab06      	add	r3, sp, #24
 8001cf0:	1c01      	adds	r1, r0, #0
 8001cf2:	1c2a      	adds	r2, r5, #0
 8001cf4:	1c20      	adds	r0, r4, #0
 8001cf6:	9300      	str	r3, [sp, #0]
 8001cf8:	e000      	b.n	8001cfc <__gnu_unwind_pr_common+0x15c>
 8001cfa:	bf00      	nop
 8001cfc:	2800      	cmp	r0, #0
 8001cfe:	d000      	beq.n	8001d02 <__gnu_unwind_pr_common+0x162>
 8001d00:	e0b4      	b.n	8001e6c <__gnu_unwind_pr_common+0x2cc>
 8001d02:	3608      	adds	r6, #8
 8001d04:	e775      	b.n	8001bf2 <__gnu_unwind_pr_common+0x52>
 8001d06:	9901      	ldr	r1, [sp, #4]
 8001d08:	2900      	cmp	r1, #0
 8001d0a:	d002      	beq.n	8001d12 <__gnu_unwind_pr_common+0x172>
 8001d0c:	2a00      	cmp	r2, #0
 8001d0e:	d000      	beq.n	8001d12 <__gnu_unwind_pr_common+0x172>
 8001d10:	e088      	b.n	8001e24 <__gnu_unwind_pr_common+0x284>
 8001d12:	3604      	adds	r6, #4
 8001d14:	e76d      	b.n	8001bf2 <__gnu_unwind_pr_common+0x52>
 8001d16:	4658      	mov	r0, fp
 8001d18:	a907      	add	r1, sp, #28
 8001d1a:	f000 fac7 	bl	80022ac <__gnu_unwind_execute>
 8001d1e:	2800      	cmp	r0, #0
 8001d20:	d1b2      	bne.n	8001c88 <__gnu_unwind_pr_common+0xe8>
 8001d22:	9b02      	ldr	r3, [sp, #8]
 8001d24:	2b00      	cmp	r3, #0
 8001d26:	d15c      	bne.n	8001de2 <__gnu_unwind_pr_common+0x242>
 8001d28:	2008      	movs	r0, #8
 8001d2a:	e7ae      	b.n	8001c8a <__gnu_unwind_pr_common+0xea>
 8001d2c:	4658      	mov	r0, fp
 8001d2e:	210d      	movs	r1, #13
 8001d30:	6a25      	ldr	r5, [r4, #32]
 8001d32:	f7ff fecb 	bl	8001acc <_Unwind_GetGR>
 8001d36:	4285      	cmp	r5, r0
 8001d38:	d063      	beq.n	8001e02 <__gnu_unwind_pr_common+0x262>
 8001d3a:	6833      	ldr	r3, [r6, #0]
 8001d3c:	2b00      	cmp	r3, #0
 8001d3e:	da96      	bge.n	8001c6e <__gnu_unwind_pr_common+0xce>
 8001d40:	3604      	adds	r6, #4
 8001d42:	e794      	b.n	8001c6e <__gnu_unwind_pr_common+0xce>
 8001d44:	4658      	mov	r0, fp
 8001d46:	210d      	movs	r1, #13
 8001d48:	6a25      	ldr	r5, [r4, #32]
 8001d4a:	f7ff febf 	bl	8001acc <_Unwind_GetGR>
 8001d4e:	4285      	cmp	r5, r0
 8001d50:	d1d7      	bne.n	8001d02 <__gnu_unwind_pr_common+0x162>
 8001d52:	6aa3      	ldr	r3, [r4, #40]	; 0x28
 8001d54:	429e      	cmp	r6, r3
 8001d56:	d1d4      	bne.n	8001d02 <__gnu_unwind_pr_common+0x162>
 8001d58:	1c30      	adds	r0, r6, #0
 8001d5a:	f7ff fcc1 	bl	80016e0 <selfrel_offset31>
 8001d5e:	210f      	movs	r1, #15
 8001d60:	1c02      	adds	r2, r0, #0
 8001d62:	4658      	mov	r0, fp
 8001d64:	f7ff fed8 	bl	8001b18 <_Unwind_SetGR>
 8001d68:	4658      	mov	r0, fp
 8001d6a:	2100      	movs	r1, #0
 8001d6c:	1c22      	adds	r2, r4, #0
 8001d6e:	f7ff fed3 	bl	8001b18 <_Unwind_SetGR>
 8001d72:	2007      	movs	r0, #7
 8001d74:	e789      	b.n	8001c8a <__gnu_unwind_pr_common+0xea>
 8001d76:	4653      	mov	r3, sl
 8001d78:	2b00      	cmp	r3, #0
 8001d7a:	d028      	beq.n	8001dce <__gnu_unwind_pr_common+0x22e>
 8001d7c:	1c25      	adds	r5, r4, #0
 8001d7e:	2300      	movs	r3, #0
 8001d80:	3558      	adds	r5, #88	; 0x58
 8001d82:	1d37      	adds	r7, r6, #4
 8001d84:	a906      	add	r1, sp, #24
 8001d86:	9604      	str	r6, [sp, #16]
 8001d88:	1c1e      	adds	r6, r3, #0
 8001d8a:	464b      	mov	r3, r9
 8001d8c:	46a0      	mov	r8, r4
 8001d8e:	9305      	str	r3, [sp, #20]
 8001d90:	1c2c      	adds	r4, r5, #0
 8001d92:	4689      	mov	r9, r1
 8001d94:	e003      	b.n	8001d9e <__gnu_unwind_pr_common+0x1fe>
 8001d96:	3704      	adds	r7, #4
 8001d98:	4555      	cmp	r5, sl
 8001d9a:	d016      	beq.n	8001dca <__gnu_unwind_pr_common+0x22a>
 8001d9c:	1c2e      	adds	r6, r5, #0
 8001d9e:	1c38      	adds	r0, r7, #0
 8001da0:	9406      	str	r4, [sp, #24]
 8001da2:	f7ff fd75 	bl	8001890 <_Unwind_decode_typeinfo_ptr.isra.0>
 8001da6:	2200      	movs	r2, #0
 8001da8:	1c01      	adds	r1, r0, #0
 8001daa:	464b      	mov	r3, r9
 8001dac:	4640      	mov	r0, r8
 8001dae:	1c75      	adds	r5, r6, #1
 8001db0:	e000      	b.n	8001db4 <__gnu_unwind_pr_common+0x214>
 8001db2:	bf00      	nop
 8001db4:	2800      	cmp	r0, #0
 8001db6:	d0ee      	beq.n	8001d96 <__gnu_unwind_pr_common+0x1f6>
 8001db8:	9a05      	ldr	r2, [sp, #20]
 8001dba:	4644      	mov	r4, r8
 8001dbc:	46b0      	mov	r8, r6
 8001dbe:	4691      	mov	r9, r2
 8001dc0:	9e04      	ldr	r6, [sp, #16]
 8001dc2:	45c2      	cmp	sl, r8
 8001dc4:	d003      	beq.n	8001dce <__gnu_unwind_pr_common+0x22e>
 8001dc6:	6833      	ldr	r3, [r6, #0]
 8001dc8:	e7b8      	b.n	8001d3c <__gnu_unwind_pr_common+0x19c>
 8001dca:	9e04      	ldr	r6, [sp, #16]
 8001dcc:	4644      	mov	r4, r8
 8001dce:	4658      	mov	r0, fp
 8001dd0:	210d      	movs	r1, #13
 8001dd2:	f7ff fe7b 	bl	8001acc <_Unwind_GetGR>
 8001dd6:	9a06      	ldr	r2, [sp, #24]
 8001dd8:	6220      	str	r0, [r4, #32]
 8001dda:	6262      	str	r2, [r4, #36]	; 0x24
 8001ddc:	62a6      	str	r6, [r4, #40]	; 0x28
 8001dde:	2006      	movs	r0, #6
 8001de0:	e753      	b.n	8001c8a <__gnu_unwind_pr_common+0xea>
 8001de2:	210f      	movs	r1, #15
 8001de4:	4658      	mov	r0, fp
 8001de6:	f7ff fe71 	bl	8001acc <_Unwind_GetGR>
 8001dea:	210e      	movs	r1, #14
 8001dec:	1c02      	adds	r2, r0, #0
 8001dee:	4658      	mov	r0, fp
 8001df0:	f7ff fe92 	bl	8001b18 <_Unwind_SetGR>
 8001df4:	4658      	mov	r0, fp
 8001df6:	210f      	movs	r1, #15
 8001df8:	4a23      	ldr	r2, [pc, #140]	; (8001e88 <__gnu_unwind_pr_common+0x2e8>)
 8001dfa:	f7ff fe8d 	bl	8001b18 <_Unwind_SetGR>
 8001dfe:	2007      	movs	r0, #7
 8001e00:	e743      	b.n	8001c8a <__gnu_unwind_pr_common+0xea>
 8001e02:	6aa1      	ldr	r1, [r4, #40]	; 0x28
 8001e04:	428e      	cmp	r6, r1
 8001e06:	d198      	bne.n	8001d3a <__gnu_unwind_pr_common+0x19a>
 8001e08:	2300      	movs	r3, #0
 8001e0a:	62e3      	str	r3, [r4, #44]	; 0x2c
 8001e0c:	2304      	movs	r3, #4
 8001e0e:	6323      	str	r3, [r4, #48]	; 0x30
 8001e10:	4652      	mov	r2, sl
 8001e12:	1d33      	adds	r3, r6, #4
 8001e14:	62a2      	str	r2, [r4, #40]	; 0x28
 8001e16:	6363      	str	r3, [r4, #52]	; 0x34
 8001e18:	6833      	ldr	r3, [r6, #0]
 8001e1a:	2b00      	cmp	r3, #0
 8001e1c:	db21      	blt.n	8001e62 <__gnu_unwind_pr_common+0x2c2>
 8001e1e:	2101      	movs	r1, #1
 8001e20:	9102      	str	r1, [sp, #8]
 8001e22:	e724      	b.n	8001c6e <__gnu_unwind_pr_common+0xce>
 8001e24:	1c30      	adds	r0, r6, #0
 8001e26:	f7ff fc5b 	bl	80016e0 <selfrel_offset31>
 8001e2a:	3604      	adds	r6, #4
 8001e2c:	1c05      	adds	r5, r0, #0
 8001e2e:	63a6      	str	r6, [r4, #56]	; 0x38
 8001e30:	1c20      	adds	r0, r4, #0
 8001e32:	e000      	b.n	8001e36 <__gnu_unwind_pr_common+0x296>
 8001e34:	bf00      	nop
 8001e36:	2800      	cmp	r0, #0
 8001e38:	d100      	bne.n	8001e3c <__gnu_unwind_pr_common+0x29c>
 8001e3a:	e725      	b.n	8001c88 <__gnu_unwind_pr_common+0xe8>
 8001e3c:	4658      	mov	r0, fp
 8001e3e:	210f      	movs	r1, #15
 8001e40:	1c2a      	adds	r2, r5, #0
 8001e42:	f7ff fe69 	bl	8001b18 <_Unwind_SetGR>
 8001e46:	2007      	movs	r0, #7
 8001e48:	e71f      	b.n	8001c8a <__gnu_unwind_pr_common+0xea>
 8001e4a:	464d      	mov	r5, r9
 8001e4c:	e716      	b.n	8001c7c <__gnu_unwind_pr_common+0xdc>
 8001e4e:	4658      	mov	r0, fp
 8001e50:	210d      	movs	r1, #13
 8001e52:	f7ff fe3b 	bl	8001acc <_Unwind_GetGR>
 8001e56:	6220      	str	r0, [r4, #32]
 8001e58:	9a06      	ldr	r2, [sp, #24]
 8001e5a:	6262      	str	r2, [r4, #36]	; 0x24
 8001e5c:	62a6      	str	r6, [r4, #40]	; 0x28
 8001e5e:	2006      	movs	r0, #6
 8001e60:	e713      	b.n	8001c8a <__gnu_unwind_pr_common+0xea>
 8001e62:	4650      	mov	r0, sl
 8001e64:	3001      	adds	r0, #1
 8001e66:	0080      	lsls	r0, r0, #2
 8001e68:	1830      	adds	r0, r6, r0
 8001e6a:	e776      	b.n	8001d5a <__gnu_unwind_pr_common+0x1ba>
 8001e6c:	1c07      	adds	r7, r0, #0
 8001e6e:	210d      	movs	r1, #13
 8001e70:	4658      	mov	r0, fp
 8001e72:	f7ff fe2b 	bl	8001acc <_Unwind_GetGR>
 8001e76:	6220      	str	r0, [r4, #32]
 8001e78:	2f02      	cmp	r7, #2
 8001e7a:	d1ed      	bne.n	8001e58 <__gnu_unwind_pr_common+0x2b8>
 8001e7c:	9906      	ldr	r1, [sp, #24]
 8001e7e:	1c23      	adds	r3, r4, #0
 8001e80:	332c      	adds	r3, #44	; 0x2c
 8001e82:	62e1      	str	r1, [r4, #44]	; 0x2c
 8001e84:	6263      	str	r3, [r4, #36]	; 0x24
 8001e86:	e7e9      	b.n	8001e5c <__gnu_unwind_pr_common+0x2bc>
 8001e88:	00000000 	.word	0x00000000

08001e8c <__aeabi_unwind_cpp_pr0>:
 8001e8c:	b508      	push	{r3, lr}
 8001e8e:	2300      	movs	r3, #0
 8001e90:	f7ff fe86 	bl	8001ba0 <__gnu_unwind_pr_common>
 8001e94:	bd08      	pop	{r3, pc}
 8001e96:	46c0      	nop			; (mov r8, r8)

08001e98 <__aeabi_unwind_cpp_pr1>:
 8001e98:	b508      	push	{r3, lr}
 8001e9a:	2301      	movs	r3, #1
 8001e9c:	f7ff fe80 	bl	8001ba0 <__gnu_unwind_pr_common>
 8001ea0:	bd08      	pop	{r3, pc}
 8001ea2:	46c0      	nop			; (mov r8, r8)

08001ea4 <__aeabi_unwind_cpp_pr2>:
 8001ea4:	b508      	push	{r3, lr}
 8001ea6:	2302      	movs	r3, #2
 8001ea8:	f7ff fe7a 	bl	8001ba0 <__gnu_unwind_pr_common>
 8001eac:	bd08      	pop	{r3, pc}
 8001eae:	46c0      	nop			; (mov r8, r8)

08001eb0 <_Unwind_VRS_Pop>:
 8001eb0:	b5f0      	push	{r4, r5, r6, r7, lr}
 8001eb2:	4647      	mov	r7, r8
 8001eb4:	b480      	push	{r7}
 8001eb6:	1c06      	adds	r6, r0, #0
 8001eb8:	b0c2      	sub	sp, #264	; 0x108
 8001eba:	1c15      	adds	r5, r2, #0
 8001ebc:	1c1c      	adds	r4, r3, #0
 8001ebe:	2901      	cmp	r1, #1
 8001ec0:	d04c      	beq.n	8001f5c <_Unwind_VRS_Pop+0xac>
 8001ec2:	2900      	cmp	r1, #0
 8001ec4:	d031      	beq.n	8001f2a <_Unwind_VRS_Pop+0x7a>
 8001ec6:	2903      	cmp	r1, #3
 8001ec8:	d008      	beq.n	8001edc <_Unwind_VRS_Pop+0x2c>
 8001eca:	2904      	cmp	r1, #4
 8001ecc:	d101      	bne.n	8001ed2 <_Unwind_VRS_Pop+0x22>
 8001ece:	2b00      	cmp	r3, #0
 8001ed0:	d058      	beq.n	8001f84 <_Unwind_VRS_Pop+0xd4>
 8001ed2:	2002      	movs	r0, #2
 8001ed4:	b042      	add	sp, #264	; 0x108
 8001ed6:	bc04      	pop	{r2}
 8001ed8:	4690      	mov	r8, r2
 8001eda:	bdf0      	pop	{r4, r5, r6, r7, pc}
 8001edc:	2b03      	cmp	r3, #3
 8001ede:	d1f8      	bne.n	8001ed2 <_Unwind_VRS_Pop+0x22>
 8001ee0:	0415      	lsls	r5, r2, #16
 8001ee2:	0c17      	lsrs	r7, r2, #16
 8001ee4:	0c2d      	lsrs	r5, r5, #16
 8001ee6:	19eb      	adds	r3, r5, r7
 8001ee8:	2b10      	cmp	r3, #16
 8001eea:	d8f2      	bhi.n	8001ed2 <_Unwind_VRS_Pop+0x22>
 8001eec:	6803      	ldr	r3, [r0, #0]
 8001eee:	2208      	movs	r2, #8
 8001ef0:	421a      	tst	r2, r3
 8001ef2:	d000      	beq.n	8001ef6 <_Unwind_VRS_Pop+0x46>
 8001ef4:	e0ef      	b.n	80020d6 <_Unwind_VRS_Pop+0x226>
 8001ef6:	ac20      	add	r4, sp, #128	; 0x80
 8001ef8:	1c20      	adds	r0, r4, #0
 8001efa:	f000 f92f 	bl	800215c <__gnu_Unwind_Save_WMMXD>
 8001efe:	6bb0      	ldr	r0, [r6, #56]	; 0x38
 8001f00:	00ff      	lsls	r7, r7, #3
 8001f02:	006d      	lsls	r5, r5, #1
 8001f04:	1c03      	adds	r3, r0, #0
 8001f06:	19e7      	adds	r7, r4, r7
 8001f08:	1e6a      	subs	r2, r5, #1
 8001f0a:	2d00      	cmp	r5, #0
 8001f0c:	d007      	beq.n	8001f1e <_Unwind_VRS_Pop+0x6e>
 8001f0e:	1a39      	subs	r1, r7, r0
 8001f10:	681f      	ldr	r7, [r3, #0]
 8001f12:	50cf      	str	r7, [r1, r3]
 8001f14:	3304      	adds	r3, #4
 8001f16:	3a01      	subs	r2, #1
 8001f18:	d2fa      	bcs.n	8001f10 <_Unwind_VRS_Pop+0x60>
 8001f1a:	00ad      	lsls	r5, r5, #2
 8001f1c:	1943      	adds	r3, r0, r5
 8001f1e:	63b3      	str	r3, [r6, #56]	; 0x38
 8001f20:	1c20      	adds	r0, r4, #0
 8001f22:	f000 f919 	bl	8002158 <__gnu_Unwind_Restore_WMMXD>
 8001f26:	2000      	movs	r0, #0
 8001f28:	e7d4      	b.n	8001ed4 <_Unwind_VRS_Pop+0x24>
 8001f2a:	2002      	movs	r0, #2
 8001f2c:	2b00      	cmp	r3, #0
 8001f2e:	d1d1      	bne.n	8001ed4 <_Unwind_VRS_Pop+0x24>
 8001f30:	0417      	lsls	r7, r2, #16
 8001f32:	6bb2      	ldr	r2, [r6, #56]	; 0x38
 8001f34:	0c3f      	lsrs	r7, r7, #16
 8001f36:	1c31      	adds	r1, r6, #0
 8001f38:	2300      	movs	r3, #0
 8001f3a:	2001      	movs	r0, #1
 8001f3c:	1c04      	adds	r4, r0, #0
 8001f3e:	409c      	lsls	r4, r3
 8001f40:	4227      	tst	r7, r4
 8001f42:	d002      	beq.n	8001f4a <_Unwind_VRS_Pop+0x9a>
 8001f44:	6814      	ldr	r4, [r2, #0]
 8001f46:	3204      	adds	r2, #4
 8001f48:	604c      	str	r4, [r1, #4]
 8001f4a:	3301      	adds	r3, #1
 8001f4c:	3104      	adds	r1, #4
 8001f4e:	2b10      	cmp	r3, #16
 8001f50:	d1f4      	bne.n	8001f3c <_Unwind_VRS_Pop+0x8c>
 8001f52:	2000      	movs	r0, #0
 8001f54:	04af      	lsls	r7, r5, #18
 8001f56:	d4bd      	bmi.n	8001ed4 <_Unwind_VRS_Pop+0x24>
 8001f58:	63b2      	str	r2, [r6, #56]	; 0x38
 8001f5a:	e7bb      	b.n	8001ed4 <_Unwind_VRS_Pop+0x24>
 8001f5c:	0415      	lsls	r5, r2, #16
 8001f5e:	0c17      	lsrs	r7, r2, #16
 8001f60:	0c2d      	lsrs	r5, r5, #16
 8001f62:	2b01      	cmp	r3, #1
 8001f64:	d02d      	beq.n	8001fc2 <_Unwind_VRS_Pop+0x112>
 8001f66:	2b05      	cmp	r3, #5
 8001f68:	d1b3      	bne.n	8001ed2 <_Unwind_VRS_Pop+0x22>
 8001f6a:	19eb      	adds	r3, r5, r7
 8001f6c:	2b20      	cmp	r3, #32
 8001f6e:	d8b0      	bhi.n	8001ed2 <_Unwind_VRS_Pop+0x22>
 8001f70:	2f0f      	cmp	r7, #15
 8001f72:	d800      	bhi.n	8001f76 <_Unwind_VRS_Pop+0xc6>
 8001f74:	e097      	b.n	80020a6 <_Unwind_VRS_Pop+0x1f6>
 8001f76:	46a8      	mov	r8, r5
 8001f78:	2d00      	cmp	r5, #0
 8001f7a:	d100      	bne.n	8001f7e <_Unwind_VRS_Pop+0xce>
 8001f7c:	e091      	b.n	80020a2 <_Unwind_VRS_Pop+0x1f2>
 8001f7e:	2f0f      	cmp	r7, #15
 8001f80:	d83a      	bhi.n	8001ff8 <_Unwind_VRS_Pop+0x148>
 8001f82:	e027      	b.n	8001fd4 <_Unwind_VRS_Pop+0x124>
 8001f84:	2a10      	cmp	r2, #16
 8001f86:	d8a4      	bhi.n	8001ed2 <_Unwind_VRS_Pop+0x22>
 8001f88:	6803      	ldr	r3, [r0, #0]
 8001f8a:	2210      	movs	r2, #16
 8001f8c:	421a      	tst	r2, r3
 8001f8e:	d000      	beq.n	8001f92 <_Unwind_VRS_Pop+0xe2>
 8001f90:	e08e      	b.n	80020b0 <_Unwind_VRS_Pop+0x200>
 8001f92:	ac20      	add	r4, sp, #128	; 0x80
 8001f94:	1c20      	adds	r0, r4, #0
 8001f96:	f000 f8e5 	bl	8002164 <__gnu_Unwind_Save_WMMXC>
 8001f9a:	6bb1      	ldr	r1, [r6, #56]	; 0x38
 8001f9c:	2300      	movs	r3, #0
 8001f9e:	2001      	movs	r0, #1
 8001fa0:	1c02      	adds	r2, r0, #0
 8001fa2:	409a      	lsls	r2, r3
 8001fa4:	4215      	tst	r5, r2
 8001fa6:	d003      	beq.n	8001fb0 <_Unwind_VRS_Pop+0x100>
 8001fa8:	680f      	ldr	r7, [r1, #0]
 8001faa:	009a      	lsls	r2, r3, #2
 8001fac:	50a7      	str	r7, [r4, r2]
 8001fae:	3104      	adds	r1, #4
 8001fb0:	3301      	adds	r3, #1
 8001fb2:	2b04      	cmp	r3, #4
 8001fb4:	d1f4      	bne.n	8001fa0 <_Unwind_VRS_Pop+0xf0>
 8001fb6:	1c20      	adds	r0, r4, #0
 8001fb8:	63b1      	str	r1, [r6, #56]	; 0x38
 8001fba:	f000 f8d1 	bl	8002160 <__gnu_Unwind_Restore_WMMXC>
 8001fbe:	2000      	movs	r0, #0
 8001fc0:	e788      	b.n	8001ed4 <_Unwind_VRS_Pop+0x24>
 8001fc2:	19eb      	adds	r3, r5, r7
 8001fc4:	2b10      	cmp	r3, #16
 8001fc6:	d900      	bls.n	8001fca <_Unwind_VRS_Pop+0x11a>
 8001fc8:	e783      	b.n	8001ed2 <_Unwind_VRS_Pop+0x22>
 8001fca:	2f0f      	cmp	r7, #15
 8001fcc:	d900      	bls.n	8001fd0 <_Unwind_VRS_Pop+0x120>
 8001fce:	e780      	b.n	8001ed2 <_Unwind_VRS_Pop+0x22>
 8001fd0:	2100      	movs	r1, #0
 8001fd2:	4688      	mov	r8, r1
 8001fd4:	6833      	ldr	r3, [r6, #0]
 8001fd6:	2201      	movs	r2, #1
 8001fd8:	421a      	tst	r2, r3
 8001fda:	d00d      	beq.n	8001ff8 <_Unwind_VRS_Pop+0x148>
 8001fdc:	1c19      	adds	r1, r3, #0
 8001fde:	4391      	bics	r1, r2
 8001fe0:	1c0a      	adds	r2, r1, #0
 8001fe2:	6031      	str	r1, [r6, #0]
 8001fe4:	2c05      	cmp	r4, #5
 8001fe6:	d100      	bne.n	8001fea <_Unwind_VRS_Pop+0x13a>
 8001fe8:	e08b      	b.n	8002102 <_Unwind_VRS_Pop+0x252>
 8001fea:	2203      	movs	r2, #3
 8001fec:	4393      	bics	r3, r2
 8001fee:	1c30      	adds	r0, r6, #0
 8001ff0:	6033      	str	r3, [r6, #0]
 8001ff2:	3048      	adds	r0, #72	; 0x48
 8001ff4:	f000 f8a6 	bl	8002144 <__gnu_Unwind_Save_VFP>
 8001ff8:	4642      	mov	r2, r8
 8001ffa:	2a00      	cmp	r2, #0
 8001ffc:	d003      	beq.n	8002006 <_Unwind_VRS_Pop+0x156>
 8001ffe:	6833      	ldr	r3, [r6, #0]
 8002000:	2204      	movs	r2, #4
 8002002:	421a      	tst	r2, r3
 8002004:	d176      	bne.n	80020f4 <_Unwind_VRS_Pop+0x244>
 8002006:	2c01      	cmp	r4, #1
 8002008:	d045      	beq.n	8002096 <_Unwind_VRS_Pop+0x1e6>
 800200a:	2f0f      	cmp	r7, #15
 800200c:	d96b      	bls.n	80020e6 <_Unwind_VRS_Pop+0x236>
 800200e:	4641      	mov	r1, r8
 8002010:	2900      	cmp	r1, #0
 8002012:	d046      	beq.n	80020a2 <_Unwind_VRS_Pop+0x1f2>
 8002014:	4668      	mov	r0, sp
 8002016:	f000 f89d 	bl	8002154 <__gnu_Unwind_Save_VFP_D_16_to_31>
 800201a:	2310      	movs	r3, #16
 800201c:	1bdb      	subs	r3, r3, r7
 800201e:	6bb5      	ldr	r5, [r6, #56]	; 0x38
 8002020:	1c29      	adds	r1, r5, #0
 8002022:	2b00      	cmp	r3, #0
 8002024:	dd10      	ble.n	8002048 <_Unwind_VRS_Pop+0x198>
 8002026:	005b      	lsls	r3, r3, #1
 8002028:	aa20      	add	r2, sp, #128	; 0x80
 800202a:	00f8      	lsls	r0, r7, #3
 800202c:	1810      	adds	r0, r2, r0
 800202e:	1c1a      	adds	r2, r3, #0
 8002030:	469c      	mov	ip, r3
 8002032:	3a01      	subs	r2, #1
 8002034:	1c2b      	adds	r3, r5, #0
 8002036:	1b40      	subs	r0, r0, r5
 8002038:	6819      	ldr	r1, [r3, #0]
 800203a:	50c1      	str	r1, [r0, r3]
 800203c:	3304      	adds	r3, #4
 800203e:	3a01      	subs	r2, #1
 8002040:	d2fa      	bcs.n	8002038 <_Unwind_VRS_Pop+0x188>
 8002042:	4662      	mov	r2, ip
 8002044:	0091      	lsls	r1, r2, #2
 8002046:	1869      	adds	r1, r5, r1
 8002048:	4643      	mov	r3, r8
 800204a:	2b00      	cmp	r3, #0
 800204c:	d015      	beq.n	800207a <_Unwind_VRS_Pop+0x1ca>
 800204e:	005b      	lsls	r3, r3, #1
 8002050:	469c      	mov	ip, r3
 8002052:	1e3b      	subs	r3, r7, #0
 8002054:	2b10      	cmp	r3, #16
 8002056:	d200      	bcs.n	800205a <_Unwind_VRS_Pop+0x1aa>
 8002058:	2310      	movs	r3, #16
 800205a:	1c18      	adds	r0, r3, #0
 800205c:	3810      	subs	r0, #16
 800205e:	00c0      	lsls	r0, r0, #3
 8002060:	ad00      	add	r5, sp, #0
 8002062:	4662      	mov	r2, ip
 8002064:	1828      	adds	r0, r5, r0
 8002066:	3a01      	subs	r2, #1
 8002068:	2300      	movs	r3, #0
 800206a:	58cd      	ldr	r5, [r1, r3]
 800206c:	50c5      	str	r5, [r0, r3]
 800206e:	3304      	adds	r3, #4
 8002070:	3a01      	subs	r2, #1
 8002072:	d2fa      	bcs.n	800206a <_Unwind_VRS_Pop+0x1ba>
 8002074:	4662      	mov	r2, ip
 8002076:	0095      	lsls	r5, r2, #2
 8002078:	1949      	adds	r1, r1, r5
 800207a:	2c01      	cmp	r4, #1
 800207c:	d020      	beq.n	80020c0 <_Unwind_VRS_Pop+0x210>
 800207e:	63b1      	str	r1, [r6, #56]	; 0x38
 8002080:	2f0f      	cmp	r7, #15
 8002082:	d924      	bls.n	80020ce <_Unwind_VRS_Pop+0x21e>
 8002084:	4643      	mov	r3, r8
 8002086:	2b00      	cmp	r3, #0
 8002088:	d100      	bne.n	800208c <_Unwind_VRS_Pop+0x1dc>
 800208a:	e74c      	b.n	8001f26 <_Unwind_VRS_Pop+0x76>
 800208c:	4668      	mov	r0, sp
 800208e:	f000 f85f 	bl	8002150 <__gnu_Unwind_Restore_VFP_D_16_to_31>
 8002092:	2000      	movs	r0, #0
 8002094:	e71e      	b.n	8001ed4 <_Unwind_VRS_Pop+0x24>
 8002096:	a820      	add	r0, sp, #128	; 0x80
 8002098:	f000 f854 	bl	8002144 <__gnu_Unwind_Save_VFP>
 800209c:	4643      	mov	r3, r8
 800209e:	2b00      	cmp	r3, #0
 80020a0:	d1bb      	bne.n	800201a <_Unwind_VRS_Pop+0x16a>
 80020a2:	1c2b      	adds	r3, r5, #0
 80020a4:	e7bb      	b.n	800201e <_Unwind_VRS_Pop+0x16e>
 80020a6:	2b10      	cmp	r3, #16
 80020a8:	d921      	bls.n	80020ee <_Unwind_VRS_Pop+0x23e>
 80020aa:	3b10      	subs	r3, #16
 80020ac:	4698      	mov	r8, r3
 80020ae:	e766      	b.n	8001f7e <_Unwind_VRS_Pop+0xce>
 80020b0:	21e8      	movs	r1, #232	; 0xe8
 80020b2:	4393      	bics	r3, r2
 80020b4:	0049      	lsls	r1, r1, #1
 80020b6:	6003      	str	r3, [r0, #0]
 80020b8:	1840      	adds	r0, r0, r1
 80020ba:	f000 f853 	bl	8002164 <__gnu_Unwind_Save_WMMXC>
 80020be:	e768      	b.n	8001f92 <_Unwind_VRS_Pop+0xe2>
 80020c0:	3104      	adds	r1, #4
 80020c2:	a820      	add	r0, sp, #128	; 0x80
 80020c4:	63b1      	str	r1, [r6, #56]	; 0x38
 80020c6:	f000 f83b 	bl	8002140 <__gnu_Unwind_Restore_VFP>
 80020ca:	2000      	movs	r0, #0
 80020cc:	e702      	b.n	8001ed4 <_Unwind_VRS_Pop+0x24>
 80020ce:	a820      	add	r0, sp, #128	; 0x80
 80020d0:	f000 f83a 	bl	8002148 <__gnu_Unwind_Restore_VFP_D>
 80020d4:	e7d6      	b.n	8002084 <_Unwind_VRS_Pop+0x1d4>
 80020d6:	24a8      	movs	r4, #168	; 0xa8
 80020d8:	4393      	bics	r3, r2
 80020da:	0064      	lsls	r4, r4, #1
 80020dc:	6003      	str	r3, [r0, #0]
 80020de:	1900      	adds	r0, r0, r4
 80020e0:	f000 f83c 	bl	800215c <__gnu_Unwind_Save_WMMXD>
 80020e4:	e707      	b.n	8001ef6 <_Unwind_VRS_Pop+0x46>
 80020e6:	a820      	add	r0, sp, #128	; 0x80
 80020e8:	f000 f830 	bl	800214c <__gnu_Unwind_Save_VFP_D>
 80020ec:	e78f      	b.n	800200e <_Unwind_VRS_Pop+0x15e>
 80020ee:	2200      	movs	r2, #0
 80020f0:	4690      	mov	r8, r2
 80020f2:	e76f      	b.n	8001fd4 <_Unwind_VRS_Pop+0x124>
 80020f4:	4393      	bics	r3, r2
 80020f6:	1c30      	adds	r0, r6, #0
 80020f8:	6033      	str	r3, [r6, #0]
 80020fa:	30d0      	adds	r0, #208	; 0xd0
 80020fc:	f000 f82a 	bl	8002154 <__gnu_Unwind_Save_VFP_D_16_to_31>
 8002100:	e781      	b.n	8002006 <_Unwind_VRS_Pop+0x156>
 8002102:	2302      	movs	r3, #2
 8002104:	431a      	orrs	r2, r3
 8002106:	1c30      	adds	r0, r6, #0
 8002108:	6032      	str	r2, [r6, #0]
 800210a:	3048      	adds	r0, #72	; 0x48
 800210c:	f000 f81e 	bl	800214c <__gnu_Unwind_Save_VFP_D>
 8002110:	e772      	b.n	8001ff8 <_Unwind_VRS_Pop+0x148>
 8002112:	46c0      	nop			; (mov r8, r8)

08002114 <__restore_core_regs>:
 8002114:	1c01      	adds	r1, r0, #0
 8002116:	3134      	adds	r1, #52	; 0x34
 8002118:	c938      	ldmia	r1!, {r3, r4, r5}
 800211a:	3b04      	subs	r3, #4
 800211c:	469c      	mov	ip, r3
 800211e:	601d      	str	r5, [r3, #0]
 8002120:	46a6      	mov	lr, r4
 8002122:	1c01      	adds	r1, r0, #0
 8002124:	3120      	adds	r1, #32
 8002126:	c93c      	ldmia	r1!, {r2, r3, r4, r5}
 8002128:	4690      	mov	r8, r2
 800212a:	4699      	mov	r9, r3
 800212c:	46a2      	mov	sl, r4
 800212e:	46ab      	mov	fp, r5
 8002130:	1c01      	adds	r1, r0, #0
 8002132:	3108      	adds	r1, #8
 8002134:	c9fc      	ldmia	r1!, {r2, r3, r4, r5, r6, r7}
 8002136:	6841      	ldr	r1, [r0, #4]
 8002138:	6800      	ldr	r0, [r0, #0]
 800213a:	46e5      	mov	sp, ip
 800213c:	bd00      	pop	{pc}
 800213e:	46c0      	nop			; (mov r8, r8)

08002140 <__gnu_Unwind_Restore_VFP>:
 8002140:	4770      	bx	lr
 8002142:	46c0      	nop			; (mov r8, r8)

08002144 <__gnu_Unwind_Save_VFP>:
 8002144:	4770      	bx	lr
 8002146:	46c0      	nop			; (mov r8, r8)

08002148 <__gnu_Unwind_Restore_VFP_D>:
 8002148:	4770      	bx	lr
 800214a:	46c0      	nop			; (mov r8, r8)

0800214c <__gnu_Unwind_Save_VFP_D>:
 800214c:	4770      	bx	lr
 800214e:	46c0      	nop			; (mov r8, r8)

08002150 <__gnu_Unwind_Restore_VFP_D_16_to_31>:
 8002150:	4770      	bx	lr
 8002152:	46c0      	nop			; (mov r8, r8)

08002154 <__gnu_Unwind_Save_VFP_D_16_to_31>:
 8002154:	4770      	bx	lr
 8002156:	46c0      	nop			; (mov r8, r8)

08002158 <__gnu_Unwind_Restore_WMMXD>:
 8002158:	4770      	bx	lr
 800215a:	46c0      	nop			; (mov r8, r8)

0800215c <__gnu_Unwind_Save_WMMXD>:
 800215c:	4770      	bx	lr
 800215e:	46c0      	nop			; (mov r8, r8)

08002160 <__gnu_Unwind_Restore_WMMXC>:
 8002160:	4770      	bx	lr
 8002162:	46c0      	nop			; (mov r8, r8)

08002164 <__gnu_Unwind_Save_WMMXC>:
 8002164:	4770      	bx	lr
 8002166:	46c0      	nop			; (mov r8, r8)

08002168 <_Unwind_RaiseException>:
 8002168:	b401      	push	{r0}
 800216a:	a801      	add	r0, sp, #4
 800216c:	b501      	push	{r0, lr}
 800216e:	b085      	sub	sp, #20
 8002170:	b4ff      	push	{r0, r1, r2, r3, r4, r5, r6, r7}
 8002172:	a808      	add	r0, sp, #32
 8002174:	4641      	mov	r1, r8
 8002176:	464a      	mov	r2, r9
 8002178:	4653      	mov	r3, sl
 800217a:	465c      	mov	r4, fp
 800217c:	4665      	mov	r5, ip
 800217e:	c03e      	stmia	r0!, {r1, r2, r3, r4, r5}
 8002180:	a801      	add	r0, sp, #4
 8002182:	c83e      	ldmia	r0!, {r1, r2, r3, r4, r5}
 8002184:	980f      	ldr	r0, [sp, #60]	; 0x3c
 8002186:	9000      	str	r0, [sp, #0]
 8002188:	2300      	movs	r3, #0
 800218a:	b40c      	push	{r2, r3}
 800218c:	a901      	add	r1, sp, #4
 800218e:	f7ff fc15 	bl	80019bc <__gnu_Unwind_RaiseException>
 8002192:	9b10      	ldr	r3, [sp, #64]	; 0x40
 8002194:	b012      	add	sp, #72	; 0x48
 8002196:	4718      	bx	r3

08002198 <_Unwind_Resume>:
 8002198:	b401      	push	{r0}
 800219a:	a801      	add	r0, sp, #4
 800219c:	b501      	push	{r0, lr}
 800219e:	b085      	sub	sp, #20
 80021a0:	b4ff      	push	{r0, r1, r2, r3, r4, r5, r6, r7}
 80021a2:	a808      	add	r0, sp, #32
 80021a4:	4641      	mov	r1, r8
 80021a6:	464a      	mov	r2, r9
 80021a8:	4653      	mov	r3, sl
 80021aa:	465c      	mov	r4, fp
 80021ac:	4665      	mov	r5, ip
 80021ae:	c03e      	stmia	r0!, {r1, r2, r3, r4, r5}
 80021b0:	a801      	add	r0, sp, #4
 80021b2:	c83e      	ldmia	r0!, {r1, r2, r3, r4, r5}
 80021b4:	980f      	ldr	r0, [sp, #60]	; 0x3c
 80021b6:	9000      	str	r0, [sp, #0]
 80021b8:	2300      	movs	r3, #0
 80021ba:	b40c      	push	{r2, r3}
 80021bc:	a901      	add	r1, sp, #4
 80021be:	f7ff fc2f 	bl	8001a20 <__gnu_Unwind_Resume>
 80021c2:	9b10      	ldr	r3, [sp, #64]	; 0x40
 80021c4:	b012      	add	sp, #72	; 0x48
 80021c6:	4718      	bx	r3

080021c8 <_Unwind_Resume_or_Rethrow>:
 80021c8:	b401      	push	{r0}
 80021ca:	a801      	add	r0, sp, #4
 80021cc:	b501      	push	{r0, lr}
 80021ce:	b085      	sub	sp, #20
 80021d0:	b4ff      	push	{r0, r1, r2, r3, r4, r5, r6, r7}
 80021d2:	a808      	add	r0, sp, #32
 80021d4:	4641      	mov	r1, r8
 80021d6:	464a      	mov	r2, r9
 80021d8:	4653      	mov	r3, sl
 80021da:	465c      	mov	r4, fp
 80021dc:	4665      	mov	r5, ip
 80021de:	c03e      	stmia	r0!, {r1, r2, r3, r4, r5}
 80021e0:	a801      	add	r0, sp, #4
 80021e2:	c83e      	ldmia	r0!, {r1, r2, r3, r4, r5}
 80021e4:	980f      	ldr	r0, [sp, #60]	; 0x3c
 80021e6:	9000      	str	r0, [sp, #0]
 80021e8:	2300      	movs	r3, #0
 80021ea:	b40c      	push	{r2, r3}
 80021ec:	a901      	add	r1, sp, #4
 80021ee:	f7ff fc3b 	bl	8001a68 <__gnu_Unwind_Resume_or_Rethrow>
 80021f2:	9b10      	ldr	r3, [sp, #64]	; 0x40
 80021f4:	b012      	add	sp, #72	; 0x48
 80021f6:	4718      	bx	r3

080021f8 <_Unwind_ForcedUnwind>:
 80021f8:	b401      	push	{r0}
 80021fa:	a801      	add	r0, sp, #4
 80021fc:	b501      	push	{r0, lr}
 80021fe:	b085      	sub	sp, #20
 8002200:	b4ff      	push	{r0, r1, r2, r3, r4, r5, r6, r7}
 8002202:	a808      	add	r0, sp, #32
 8002204:	4641      	mov	r1, r8
 8002206:	464a      	mov	r2, r9
 8002208:	4653      	mov	r3, sl
 800220a:	465c      	mov	r4, fp
 800220c:	4665      	mov	r5, ip
 800220e:	c03e      	stmia	r0!, {r1, r2, r3, r4, r5}
 8002210:	a801      	add	r0, sp, #4
 8002212:	c83e      	ldmia	r0!, {r1, r2, r3, r4, r5}
 8002214:	980f      	ldr	r0, [sp, #60]	; 0x3c
 8002216:	9000      	str	r0, [sp, #0]
 8002218:	2300      	movs	r3, #0
 800221a:	b40c      	push	{r2, r3}
 800221c:	ab01      	add	r3, sp, #4
 800221e:	f7ff fbf5 	bl	8001a0c <__gnu_Unwind_ForcedUnwind>
 8002222:	9b10      	ldr	r3, [sp, #64]	; 0x40
 8002224:	b012      	add	sp, #72	; 0x48
 8002226:	4718      	bx	r3

08002228 <_Unwind_Backtrace>:
 8002228:	b401      	push	{r0}
 800222a:	a801      	add	r0, sp, #4
 800222c:	b501      	push	{r0, lr}
 800222e:	b085      	sub	sp, #20
 8002230:	b4ff      	push	{r0, r1, r2, r3, r4, r5, r6, r7}
 8002232:	a808      	add	r0, sp, #32
 8002234:	4641      	mov	r1, r8
 8002236:	464a      	mov	r2, r9
 8002238:	4653      	mov	r3, sl
 800223a:	465c      	mov	r4, fp
 800223c:	4665      	mov	r5, ip
 800223e:	c03e      	stmia	r0!, {r1, r2, r3, r4, r5}
 8002240:	a801      	add	r0, sp, #4
 8002242:	c83e      	ldmia	r0!, {r1, r2, r3, r4, r5}
 8002244:	980f      	ldr	r0, [sp, #60]	; 0x3c
 8002246:	9000      	str	r0, [sp, #0]
 8002248:	2300      	movs	r3, #0
 800224a:	b40c      	push	{r2, r3}
 800224c:	aa01      	add	r2, sp, #4
 800224e:	f7ff fc71 	bl	8001b34 <__gnu_Unwind_Backtrace>
 8002252:	9b10      	ldr	r3, [sp, #64]	; 0x40
 8002254:	b012      	add	sp, #72	; 0x48
 8002256:	4718      	bx	r3

08002258 <next_unwind_byte>:
 8002258:	7a02      	ldrb	r2, [r0, #8]
 800225a:	1c03      	adds	r3, r0, #0
 800225c:	2a00      	cmp	r2, #0
 800225e:	d104      	bne.n	800226a <next_unwind_byte+0x12>
 8002260:	7a42      	ldrb	r2, [r0, #9]
 8002262:	20b0      	movs	r0, #176	; 0xb0
 8002264:	2a00      	cmp	r2, #0
 8002266:	d107      	bne.n	8002278 <next_unwind_byte+0x20>
 8002268:	4770      	bx	lr
 800226a:	3a01      	subs	r2, #1
 800226c:	7202      	strb	r2, [r0, #8]
 800226e:	6800      	ldr	r0, [r0, #0]
 8002270:	0202      	lsls	r2, r0, #8
 8002272:	601a      	str	r2, [r3, #0]
 8002274:	0e00      	lsrs	r0, r0, #24
 8002276:	e7f7      	b.n	8002268 <next_unwind_byte+0x10>
 8002278:	3a01      	subs	r2, #1
 800227a:	725a      	strb	r2, [r3, #9]
 800227c:	685a      	ldr	r2, [r3, #4]
 800227e:	1d11      	adds	r1, r2, #4
 8002280:	6810      	ldr	r0, [r2, #0]
 8002282:	2203      	movs	r2, #3
 8002284:	6059      	str	r1, [r3, #4]
 8002286:	721a      	strb	r2, [r3, #8]
 8002288:	e7f2      	b.n	8002270 <next_unwind_byte+0x18>
 800228a:	46c0      	nop			; (mov r8, r8)

0800228c <_Unwind_GetGR.constprop.0>:
 800228c:	b500      	push	{lr}
 800228e:	b085      	sub	sp, #20
 8002290:	ab03      	add	r3, sp, #12
 8002292:	9300      	str	r3, [sp, #0]
 8002294:	2100      	movs	r1, #0
 8002296:	220c      	movs	r2, #12
 8002298:	2300      	movs	r3, #0
 800229a:	f7ff fbfd 	bl	8001a98 <_Unwind_VRS_Get>
 800229e:	9803      	ldr	r0, [sp, #12]
 80022a0:	b005      	add	sp, #20
 80022a2:	bd00      	pop	{pc}

080022a4 <unwind_UCB_from_context>:
 80022a4:	b508      	push	{r3, lr}
 80022a6:	f7ff fff1 	bl	800228c <_Unwind_GetGR.constprop.0>
 80022aa:	bd08      	pop	{r3, pc}

080022ac <__gnu_unwind_execute>:
 80022ac:	b5f0      	push	{r4, r5, r6, r7, lr}
 80022ae:	464d      	mov	r5, r9
 80022b0:	465f      	mov	r7, fp
 80022b2:	4656      	mov	r6, sl
 80022b4:	4644      	mov	r4, r8
 80022b6:	b4f0      	push	{r4, r5, r6, r7}
 80022b8:	220f      	movs	r2, #15
 80022ba:	b087      	sub	sp, #28
 80022bc:	1c0d      	adds	r5, r1, #0
 80022be:	2307      	movs	r3, #7
 80022c0:	2100      	movs	r1, #0
 80022c2:	1c06      	adds	r6, r0, #0
 80022c4:	9103      	str	r1, [sp, #12]
 80022c6:	277f      	movs	r7, #127	; 0x7f
 80022c8:	4690      	mov	r8, r2
 80022ca:	4699      	mov	r9, r3
 80022cc:	1c28      	adds	r0, r5, #0
 80022ce:	f7ff ffc3 	bl	8002258 <next_unwind_byte>
 80022d2:	1e04      	subs	r4, r0, #0
 80022d4:	2cb0      	cmp	r4, #176	; 0xb0
 80022d6:	d100      	bne.n	80022da <__gnu_unwind_execute+0x2e>
 80022d8:	e0c8      	b.n	800246c <__gnu_unwind_execute+0x1c0>
 80022da:	1c03      	adds	r3, r0, #0
 80022dc:	43bb      	bics	r3, r7
 80022de:	b2db      	uxtb	r3, r3
 80022e0:	2b00      	cmp	r3, #0
 80022e2:	d02a      	beq.n	800233a <__gnu_unwind_execute+0x8e>
 80022e4:	1c03      	adds	r3, r0, #0
 80022e6:	4641      	mov	r1, r8
 80022e8:	438b      	bics	r3, r1
 80022ea:	b2db      	uxtb	r3, r3
 80022ec:	2b80      	cmp	r3, #128	; 0x80
 80022ee:	d100      	bne.n	80022f2 <__gnu_unwind_execute+0x46>
 80022f0:	e081      	b.n	80023f6 <__gnu_unwind_execute+0x14a>
 80022f2:	2b90      	cmp	r3, #144	; 0x90
 80022f4:	d042      	beq.n	800237c <__gnu_unwind_execute+0xd0>
 80022f6:	2ba0      	cmp	r3, #160	; 0xa0
 80022f8:	d04f      	beq.n	800239a <__gnu_unwind_execute+0xee>
 80022fa:	2bb0      	cmp	r3, #176	; 0xb0
 80022fc:	d062      	beq.n	80023c4 <__gnu_unwind_execute+0x118>
 80022fe:	2bc0      	cmp	r3, #192	; 0xc0
 8002300:	d100      	bne.n	8002304 <__gnu_unwind_execute+0x58>
 8002302:	e095      	b.n	8002430 <__gnu_unwind_execute+0x184>
 8002304:	1c03      	adds	r3, r0, #0
 8002306:	4649      	mov	r1, r9
 8002308:	438b      	bics	r3, r1
 800230a:	b2db      	uxtb	r3, r3
 800230c:	2bd0      	cmp	r3, #208	; 0xd0
 800230e:	d10b      	bne.n	8002328 <__gnu_unwind_execute+0x7c>
 8002310:	400c      	ands	r4, r1
 8002312:	2280      	movs	r2, #128	; 0x80
 8002314:	3401      	adds	r4, #1
 8002316:	0312      	lsls	r2, r2, #12
 8002318:	4322      	orrs	r2, r4
 800231a:	1c30      	adds	r0, r6, #0
 800231c:	2101      	movs	r1, #1
 800231e:	2305      	movs	r3, #5
 8002320:	f7ff fdc6 	bl	8001eb0 <_Unwind_VRS_Pop>
 8002324:	2800      	cmp	r0, #0
 8002326:	d0d1      	beq.n	80022cc <__gnu_unwind_execute+0x20>
 8002328:	2409      	movs	r4, #9
 800232a:	1c20      	adds	r0, r4, #0
 800232c:	b007      	add	sp, #28
 800232e:	bc3c      	pop	{r2, r3, r4, r5}
 8002330:	4690      	mov	r8, r2
 8002332:	4699      	mov	r9, r3
 8002334:	46a2      	mov	sl, r4
 8002336:	46ab      	mov	fp, r5
 8002338:	bdf0      	pop	{r4, r5, r6, r7, pc}
 800233a:	0083      	lsls	r3, r0, #2
 800233c:	22ff      	movs	r2, #255	; 0xff
 800233e:	4013      	ands	r3, r2
 8002340:	3304      	adds	r3, #4
 8002342:	aa05      	add	r2, sp, #20
 8002344:	9200      	str	r2, [sp, #0]
 8002346:	2100      	movs	r1, #0
 8002348:	469b      	mov	fp, r3
 800234a:	4692      	mov	sl, r2
 800234c:	1c30      	adds	r0, r6, #0
 800234e:	220d      	movs	r2, #13
 8002350:	2300      	movs	r3, #0
 8002352:	f7ff fba1 	bl	8001a98 <_Unwind_VRS_Get>
 8002356:	9905      	ldr	r1, [sp, #20]
 8002358:	0663      	lsls	r3, r4, #25
 800235a:	d40b      	bmi.n	8002374 <__gnu_unwind_execute+0xc8>
 800235c:	1c0b      	adds	r3, r1, #0
 800235e:	445b      	add	r3, fp
 8002360:	9305      	str	r3, [sp, #20]
 8002362:	4652      	mov	r2, sl
 8002364:	9200      	str	r2, [sp, #0]
 8002366:	1c30      	adds	r0, r6, #0
 8002368:	2100      	movs	r1, #0
 800236a:	220d      	movs	r2, #13
 800236c:	2300      	movs	r3, #0
 800236e:	f7ff fbb9 	bl	8001ae4 <_Unwind_VRS_Set>
 8002372:	e7ab      	b.n	80022cc <__gnu_unwind_execute+0x20>
 8002374:	465a      	mov	r2, fp
 8002376:	1a8b      	subs	r3, r1, r2
 8002378:	9305      	str	r3, [sp, #20]
 800237a:	e7f2      	b.n	8002362 <__gnu_unwind_execute+0xb6>
 800237c:	230d      	movs	r3, #13
 800237e:	4003      	ands	r3, r0
 8002380:	2b0d      	cmp	r3, #13
 8002382:	d0d1      	beq.n	8002328 <__gnu_unwind_execute+0x7c>
 8002384:	ac05      	add	r4, sp, #20
 8002386:	4642      	mov	r2, r8
 8002388:	4002      	ands	r2, r0
 800238a:	9400      	str	r4, [sp, #0]
 800238c:	1c30      	adds	r0, r6, #0
 800238e:	2100      	movs	r1, #0
 8002390:	2300      	movs	r3, #0
 8002392:	f7ff fb81 	bl	8001a98 <_Unwind_VRS_Get>
 8002396:	9400      	str	r4, [sp, #0]
 8002398:	e7e5      	b.n	8002366 <__gnu_unwind_execute+0xba>
 800239a:	23ff      	movs	r3, #255	; 0xff
 800239c:	011b      	lsls	r3, r3, #4
 800239e:	464a      	mov	r2, r9
 80023a0:	4382      	bics	r2, r0
 80023a2:	1c19      	adds	r1, r3, #0
 80023a4:	4111      	asrs	r1, r2
 80023a6:	1c0a      	adds	r2, r1, #0
 80023a8:	401a      	ands	r2, r3
 80023aa:	0703      	lsls	r3, r0, #28
 80023ac:	d502      	bpl.n	80023b4 <__gnu_unwind_execute+0x108>
 80023ae:	2380      	movs	r3, #128	; 0x80
 80023b0:	01db      	lsls	r3, r3, #7
 80023b2:	431a      	orrs	r2, r3
 80023b4:	1c30      	adds	r0, r6, #0
 80023b6:	2100      	movs	r1, #0
 80023b8:	2300      	movs	r3, #0
 80023ba:	f7ff fd79 	bl	8001eb0 <_Unwind_VRS_Pop>
 80023be:	2800      	cmp	r0, #0
 80023c0:	d1b2      	bne.n	8002328 <__gnu_unwind_execute+0x7c>
 80023c2:	e783      	b.n	80022cc <__gnu_unwind_execute+0x20>
 80023c4:	28b1      	cmp	r0, #177	; 0xb1
 80023c6:	d065      	beq.n	8002494 <__gnu_unwind_execute+0x1e8>
 80023c8:	28b2      	cmp	r0, #178	; 0xb2
 80023ca:	d078      	beq.n	80024be <__gnu_unwind_execute+0x212>
 80023cc:	28b3      	cmp	r0, #179	; 0xb3
 80023ce:	d100      	bne.n	80023d2 <__gnu_unwind_execute+0x126>
 80023d0:	e0a0      	b.n	8002514 <__gnu_unwind_execute+0x268>
 80023d2:	23fc      	movs	r3, #252	; 0xfc
 80023d4:	4003      	ands	r3, r0
 80023d6:	2bb4      	cmp	r3, #180	; 0xb4
 80023d8:	d0a6      	beq.n	8002328 <__gnu_unwind_execute+0x7c>
 80023da:	464a      	mov	r2, r9
 80023dc:	4014      	ands	r4, r2
 80023de:	2280      	movs	r2, #128	; 0x80
 80023e0:	3401      	adds	r4, #1
 80023e2:	0312      	lsls	r2, r2, #12
 80023e4:	4322      	orrs	r2, r4
 80023e6:	1c30      	adds	r0, r6, #0
 80023e8:	2101      	movs	r1, #1
 80023ea:	2301      	movs	r3, #1
 80023ec:	f7ff fd60 	bl	8001eb0 <_Unwind_VRS_Pop>
 80023f0:	2800      	cmp	r0, #0
 80023f2:	d199      	bne.n	8002328 <__gnu_unwind_execute+0x7c>
 80023f4:	e76a      	b.n	80022cc <__gnu_unwind_execute+0x20>
 80023f6:	0204      	lsls	r4, r0, #8
 80023f8:	1c28      	adds	r0, r5, #0
 80023fa:	f7ff ff2d 	bl	8002258 <next_unwind_byte>
 80023fe:	4320      	orrs	r0, r4
 8002400:	2480      	movs	r4, #128	; 0x80
 8002402:	0224      	lsls	r4, r4, #8
 8002404:	42a0      	cmp	r0, r4
 8002406:	d100      	bne.n	800240a <__gnu_unwind_execute+0x15e>
 8002408:	e78e      	b.n	8002328 <__gnu_unwind_execute+0x7c>
 800240a:	0102      	lsls	r2, r0, #4
 800240c:	0500      	lsls	r0, r0, #20
 800240e:	4692      	mov	sl, r2
 8002410:	2100      	movs	r1, #0
 8002412:	0c02      	lsrs	r2, r0, #16
 8002414:	2300      	movs	r3, #0
 8002416:	1c30      	adds	r0, r6, #0
 8002418:	f7ff fd4a 	bl	8001eb0 <_Unwind_VRS_Pop>
 800241c:	2800      	cmp	r0, #0
 800241e:	d000      	beq.n	8002422 <__gnu_unwind_execute+0x176>
 8002420:	e782      	b.n	8002328 <__gnu_unwind_execute+0x7c>
 8002422:	4653      	mov	r3, sl
 8002424:	4223      	tst	r3, r4
 8002426:	d100      	bne.n	800242a <__gnu_unwind_execute+0x17e>
 8002428:	e750      	b.n	80022cc <__gnu_unwind_execute+0x20>
 800242a:	2101      	movs	r1, #1
 800242c:	9103      	str	r1, [sp, #12]
 800242e:	e74d      	b.n	80022cc <__gnu_unwind_execute+0x20>
 8002430:	28c6      	cmp	r0, #198	; 0xc6
 8002432:	d07b      	beq.n	800252c <__gnu_unwind_execute+0x280>
 8002434:	28c7      	cmp	r0, #199	; 0xc7
 8002436:	d100      	bne.n	800243a <__gnu_unwind_execute+0x18e>
 8002438:	e08c      	b.n	8002554 <__gnu_unwind_execute+0x2a8>
 800243a:	1c03      	adds	r3, r0, #0
 800243c:	464a      	mov	r2, r9
 800243e:	4393      	bics	r3, r2
 8002440:	b2db      	uxtb	r3, r3
 8002442:	2bc0      	cmp	r3, #192	; 0xc0
 8002444:	d100      	bne.n	8002448 <__gnu_unwind_execute+0x19c>
 8002446:	e09a      	b.n	800257e <__gnu_unwind_execute+0x2d2>
 8002448:	28c8      	cmp	r0, #200	; 0xc8
 800244a:	d100      	bne.n	800244e <__gnu_unwind_execute+0x1a2>
 800244c:	e09d      	b.n	800258a <__gnu_unwind_execute+0x2de>
 800244e:	28c9      	cmp	r0, #201	; 0xc9
 8002450:	d000      	beq.n	8002454 <__gnu_unwind_execute+0x1a8>
 8002452:	e769      	b.n	8002328 <__gnu_unwind_execute+0x7c>
 8002454:	1c28      	adds	r0, r5, #0
 8002456:	f7ff feff 	bl	8002258 <next_unwind_byte>
 800245a:	4642      	mov	r2, r8
 800245c:	4643      	mov	r3, r8
 800245e:	4002      	ands	r2, r0
 8002460:	4398      	bics	r0, r3
 8002462:	b2c0      	uxtb	r0, r0
 8002464:	3201      	adds	r2, #1
 8002466:	0300      	lsls	r0, r0, #12
 8002468:	4302      	orrs	r2, r0
 800246a:	e756      	b.n	800231a <__gnu_unwind_execute+0x6e>
 800246c:	9903      	ldr	r1, [sp, #12]
 800246e:	2400      	movs	r4, #0
 8002470:	2900      	cmp	r1, #0
 8002472:	d000      	beq.n	8002476 <__gnu_unwind_execute+0x1ca>
 8002474:	e759      	b.n	800232a <__gnu_unwind_execute+0x7e>
 8002476:	ad05      	add	r5, sp, #20
 8002478:	9500      	str	r5, [sp, #0]
 800247a:	1c30      	adds	r0, r6, #0
 800247c:	220e      	movs	r2, #14
 800247e:	2300      	movs	r3, #0
 8002480:	f7ff fb0a 	bl	8001a98 <_Unwind_VRS_Get>
 8002484:	9500      	str	r5, [sp, #0]
 8002486:	1c30      	adds	r0, r6, #0
 8002488:	2100      	movs	r1, #0
 800248a:	220f      	movs	r2, #15
 800248c:	2300      	movs	r3, #0
 800248e:	f7ff fb29 	bl	8001ae4 <_Unwind_VRS_Set>
 8002492:	e74a      	b.n	800232a <__gnu_unwind_execute+0x7e>
 8002494:	1c28      	adds	r0, r5, #0
 8002496:	f7ff fedf 	bl	8002258 <next_unwind_byte>
 800249a:	1e02      	subs	r2, r0, #0
 800249c:	d100      	bne.n	80024a0 <__gnu_unwind_execute+0x1f4>
 800249e:	e743      	b.n	8002328 <__gnu_unwind_execute+0x7c>
 80024a0:	1c03      	adds	r3, r0, #0
 80024a2:	4641      	mov	r1, r8
 80024a4:	438b      	bics	r3, r1
 80024a6:	b2db      	uxtb	r3, r3
 80024a8:	2b00      	cmp	r3, #0
 80024aa:	d000      	beq.n	80024ae <__gnu_unwind_execute+0x202>
 80024ac:	e73c      	b.n	8002328 <__gnu_unwind_execute+0x7c>
 80024ae:	1c30      	adds	r0, r6, #0
 80024b0:	2100      	movs	r1, #0
 80024b2:	f7ff fcfd 	bl	8001eb0 <_Unwind_VRS_Pop>
 80024b6:	2800      	cmp	r0, #0
 80024b8:	d000      	beq.n	80024bc <__gnu_unwind_execute+0x210>
 80024ba:	e735      	b.n	8002328 <__gnu_unwind_execute+0x7c>
 80024bc:	e706      	b.n	80022cc <__gnu_unwind_execute+0x20>
 80024be:	aa05      	add	r2, sp, #20
 80024c0:	2300      	movs	r3, #0
 80024c2:	9200      	str	r2, [sp, #0]
 80024c4:	2100      	movs	r1, #0
 80024c6:	4692      	mov	sl, r2
 80024c8:	1c30      	adds	r0, r6, #0
 80024ca:	220d      	movs	r2, #13
 80024cc:	f7ff fae4 	bl	8001a98 <_Unwind_VRS_Get>
 80024d0:	1c28      	adds	r0, r5, #0
 80024d2:	f7ff fec1 	bl	8002258 <next_unwind_byte>
 80024d6:	1c03      	adds	r3, r0, #0
 80024d8:	43bb      	bics	r3, r7
 80024da:	b2db      	uxtb	r3, r3
 80024dc:	2402      	movs	r4, #2
 80024de:	2b00      	cmp	r3, #0
 80024e0:	d00d      	beq.n	80024fe <__gnu_unwind_execute+0x252>
 80024e2:	9b05      	ldr	r3, [sp, #20]
 80024e4:	4038      	ands	r0, r7
 80024e6:	40a0      	lsls	r0, r4
 80024e8:	1818      	adds	r0, r3, r0
 80024ea:	9005      	str	r0, [sp, #20]
 80024ec:	1c28      	adds	r0, r5, #0
 80024ee:	f7ff feb3 	bl	8002258 <next_unwind_byte>
 80024f2:	1c03      	adds	r3, r0, #0
 80024f4:	43bb      	bics	r3, r7
 80024f6:	b2db      	uxtb	r3, r3
 80024f8:	3407      	adds	r4, #7
 80024fa:	2b00      	cmp	r3, #0
 80024fc:	d1f1      	bne.n	80024e2 <__gnu_unwind_execute+0x236>
 80024fe:	9905      	ldr	r1, [sp, #20]
 8002500:	2281      	movs	r2, #129	; 0x81
 8002502:	0092      	lsls	r2, r2, #2
 8002504:	4038      	ands	r0, r7
 8002506:	188b      	adds	r3, r1, r2
 8002508:	40a0      	lsls	r0, r4
 800250a:	181c      	adds	r4, r3, r0
 800250c:	4653      	mov	r3, sl
 800250e:	9405      	str	r4, [sp, #20]
 8002510:	9300      	str	r3, [sp, #0]
 8002512:	e728      	b.n	8002366 <__gnu_unwind_execute+0xba>
 8002514:	1c28      	adds	r0, r5, #0
 8002516:	f7ff fe9f 	bl	8002258 <next_unwind_byte>
 800251a:	4642      	mov	r2, r8
 800251c:	4641      	mov	r1, r8
 800251e:	4002      	ands	r2, r0
 8002520:	4388      	bics	r0, r1
 8002522:	b2c3      	uxtb	r3, r0
 8002524:	3201      	adds	r2, #1
 8002526:	031b      	lsls	r3, r3, #12
 8002528:	431a      	orrs	r2, r3
 800252a:	e75c      	b.n	80023e6 <__gnu_unwind_execute+0x13a>
 800252c:	1c28      	adds	r0, r5, #0
 800252e:	f7ff fe93 	bl	8002258 <next_unwind_byte>
 8002532:	4643      	mov	r3, r8
 8002534:	4642      	mov	r2, r8
 8002536:	4002      	ands	r2, r0
 8002538:	4398      	bics	r0, r3
 800253a:	b2c3      	uxtb	r3, r0
 800253c:	3201      	adds	r2, #1
 800253e:	031b      	lsls	r3, r3, #12
 8002540:	431a      	orrs	r2, r3
 8002542:	1c30      	adds	r0, r6, #0
 8002544:	2103      	movs	r1, #3
 8002546:	2303      	movs	r3, #3
 8002548:	f7ff fcb2 	bl	8001eb0 <_Unwind_VRS_Pop>
 800254c:	2800      	cmp	r0, #0
 800254e:	d000      	beq.n	8002552 <__gnu_unwind_execute+0x2a6>
 8002550:	e6ea      	b.n	8002328 <__gnu_unwind_execute+0x7c>
 8002552:	e6bb      	b.n	80022cc <__gnu_unwind_execute+0x20>
 8002554:	1c28      	adds	r0, r5, #0
 8002556:	f7ff fe7f 	bl	8002258 <next_unwind_byte>
 800255a:	1e02      	subs	r2, r0, #0
 800255c:	d100      	bne.n	8002560 <__gnu_unwind_execute+0x2b4>
 800255e:	e6e3      	b.n	8002328 <__gnu_unwind_execute+0x7c>
 8002560:	1c03      	adds	r3, r0, #0
 8002562:	4641      	mov	r1, r8
 8002564:	438b      	bics	r3, r1
 8002566:	b2db      	uxtb	r3, r3
 8002568:	2b00      	cmp	r3, #0
 800256a:	d000      	beq.n	800256e <__gnu_unwind_execute+0x2c2>
 800256c:	e6dc      	b.n	8002328 <__gnu_unwind_execute+0x7c>
 800256e:	1c30      	adds	r0, r6, #0
 8002570:	2104      	movs	r1, #4
 8002572:	f7ff fc9d 	bl	8001eb0 <_Unwind_VRS_Pop>
 8002576:	2800      	cmp	r0, #0
 8002578:	d000      	beq.n	800257c <__gnu_unwind_execute+0x2d0>
 800257a:	e6d5      	b.n	8002328 <__gnu_unwind_execute+0x7c>
 800257c:	e6a6      	b.n	80022cc <__gnu_unwind_execute+0x20>
 800257e:	400c      	ands	r4, r1
 8002580:	22a0      	movs	r2, #160	; 0xa0
 8002582:	3401      	adds	r4, #1
 8002584:	0312      	lsls	r2, r2, #12
 8002586:	4322      	orrs	r2, r4
 8002588:	e7db      	b.n	8002542 <__gnu_unwind_execute+0x296>
 800258a:	1c28      	adds	r0, r5, #0
 800258c:	f7ff fe64 	bl	8002258 <next_unwind_byte>
 8002590:	4641      	mov	r1, r8
 8002592:	1c02      	adds	r2, r0, #0
 8002594:	438a      	bics	r2, r1
 8002596:	b2d2      	uxtb	r2, r2
 8002598:	3210      	adds	r2, #16
 800259a:	4008      	ands	r0, r1
 800259c:	0312      	lsls	r2, r2, #12
 800259e:	3001      	adds	r0, #1
 80025a0:	4302      	orrs	r2, r0
 80025a2:	e6ba      	b.n	800231a <__gnu_unwind_execute+0x6e>

080025a4 <__gnu_unwind_frame>:
 80025a4:	b510      	push	{r4, lr}
 80025a6:	6cc2      	ldr	r2, [r0, #76]	; 0x4c
 80025a8:	b084      	sub	sp, #16
 80025aa:	6854      	ldr	r4, [r2, #4]
 80025ac:	ab01      	add	r3, sp, #4
 80025ae:	0220      	lsls	r0, r4, #8
 80025b0:	9001      	str	r0, [sp, #4]
 80025b2:	1c10      	adds	r0, r2, #0
 80025b4:	3008      	adds	r0, #8
 80025b6:	9002      	str	r0, [sp, #8]
 80025b8:	2003      	movs	r0, #3
 80025ba:	7218      	strb	r0, [r3, #8]
 80025bc:	79d2      	ldrb	r2, [r2, #7]
 80025be:	1c08      	adds	r0, r1, #0
 80025c0:	1c19      	adds	r1, r3, #0
 80025c2:	725a      	strb	r2, [r3, #9]
 80025c4:	f7ff fe72 	bl	80022ac <__gnu_unwind_execute>
 80025c8:	b004      	add	sp, #16
 80025ca:	bd10      	pop	{r4, pc}

080025cc <_Unwind_GetRegionStart>:
 80025cc:	b508      	push	{r3, lr}
 80025ce:	f7ff fe69 	bl	80022a4 <unwind_UCB_from_context>
 80025d2:	6c80      	ldr	r0, [r0, #72]	; 0x48
 80025d4:	bd08      	pop	{r3, pc}
 80025d6:	46c0      	nop			; (mov r8, r8)

080025d8 <_Unwind_GetLanguageSpecificData>:
 80025d8:	b508      	push	{r3, lr}
 80025da:	f7ff fe63 	bl	80022a4 <unwind_UCB_from_context>
 80025de:	6cc3      	ldr	r3, [r0, #76]	; 0x4c
 80025e0:	79d8      	ldrb	r0, [r3, #7]
 80025e2:	1d1a      	adds	r2, r3, #4
 80025e4:	3001      	adds	r0, #1
 80025e6:	0080      	lsls	r0, r0, #2
 80025e8:	1810      	adds	r0, r2, r0
 80025ea:	bd08      	pop	{r3, pc}

080025ec <_Unwind_GetDataRelBase>:
 80025ec:	b508      	push	{r3, lr}
 80025ee:	f000 f805 	bl	80025fc <abort>
 80025f2:	46c0      	nop			; (mov r8, r8)

080025f4 <_Unwind_GetTextRelBase>:
 80025f4:	b508      	push	{r3, lr}
 80025f6:	f000 f801 	bl	80025fc <abort>
 80025fa:	46c0      	nop			; (mov r8, r8)

080025fc <abort>:
 80025fc:	b508      	push	{r3, lr}
 80025fe:	2006      	movs	r0, #6
 8002600:	f000 f874 	bl	80026ec <raise>
 8002604:	2001      	movs	r0, #1
 8002606:	f7fe f873 	bl	80006f0 <_exit>
 800260a:	46c0      	nop			; (mov r8, r8)

0800260c <memcpy>:
 800260c:	b5f0      	push	{r4, r5, r6, r7, lr}
 800260e:	2a0f      	cmp	r2, #15
 8002610:	d935      	bls.n	800267e <memcpy+0x72>
 8002612:	1c03      	adds	r3, r0, #0
 8002614:	430b      	orrs	r3, r1
 8002616:	079c      	lsls	r4, r3, #30
 8002618:	d135      	bne.n	8002686 <memcpy+0x7a>
 800261a:	1c16      	adds	r6, r2, #0
 800261c:	3e10      	subs	r6, #16
 800261e:	0936      	lsrs	r6, r6, #4
 8002620:	0135      	lsls	r5, r6, #4
 8002622:	1945      	adds	r5, r0, r5
 8002624:	3510      	adds	r5, #16
 8002626:	1c0c      	adds	r4, r1, #0
 8002628:	1c03      	adds	r3, r0, #0
 800262a:	6827      	ldr	r7, [r4, #0]
 800262c:	601f      	str	r7, [r3, #0]
 800262e:	6867      	ldr	r7, [r4, #4]
 8002630:	605f      	str	r7, [r3, #4]
 8002632:	68a7      	ldr	r7, [r4, #8]
 8002634:	609f      	str	r7, [r3, #8]
 8002636:	68e7      	ldr	r7, [r4, #12]
 8002638:	3410      	adds	r4, #16
 800263a:	60df      	str	r7, [r3, #12]
 800263c:	3310      	adds	r3, #16
 800263e:	42ab      	cmp	r3, r5
 8002640:	d1f3      	bne.n	800262a <memcpy+0x1e>
 8002642:	1c73      	adds	r3, r6, #1
 8002644:	011b      	lsls	r3, r3, #4
 8002646:	18c5      	adds	r5, r0, r3
 8002648:	18c9      	adds	r1, r1, r3
 800264a:	230f      	movs	r3, #15
 800264c:	4013      	ands	r3, r2
 800264e:	2b03      	cmp	r3, #3
 8002650:	d91b      	bls.n	800268a <memcpy+0x7e>
 8002652:	1f1c      	subs	r4, r3, #4
 8002654:	08a4      	lsrs	r4, r4, #2
 8002656:	3401      	adds	r4, #1
 8002658:	00a4      	lsls	r4, r4, #2
 800265a:	2300      	movs	r3, #0
 800265c:	58ce      	ldr	r6, [r1, r3]
 800265e:	50ee      	str	r6, [r5, r3]
 8002660:	3304      	adds	r3, #4
 8002662:	42a3      	cmp	r3, r4
 8002664:	d1fa      	bne.n	800265c <memcpy+0x50>
 8002666:	18ed      	adds	r5, r5, r3
 8002668:	18c9      	adds	r1, r1, r3
 800266a:	2303      	movs	r3, #3
 800266c:	401a      	ands	r2, r3
 800266e:	d005      	beq.n	800267c <memcpy+0x70>
 8002670:	2300      	movs	r3, #0
 8002672:	5ccc      	ldrb	r4, [r1, r3]
 8002674:	54ec      	strb	r4, [r5, r3]
 8002676:	3301      	adds	r3, #1
 8002678:	4293      	cmp	r3, r2
 800267a:	d1fa      	bne.n	8002672 <memcpy+0x66>
 800267c:	bdf0      	pop	{r4, r5, r6, r7, pc}
 800267e:	1c05      	adds	r5, r0, #0
 8002680:	2a00      	cmp	r2, #0
 8002682:	d1f5      	bne.n	8002670 <memcpy+0x64>
 8002684:	e7fa      	b.n	800267c <memcpy+0x70>
 8002686:	1c05      	adds	r5, r0, #0
 8002688:	e7f2      	b.n	8002670 <memcpy+0x64>
 800268a:	1c1a      	adds	r2, r3, #0
 800268c:	e7f8      	b.n	8002680 <memcpy+0x74>
 800268e:	46c0      	nop			; (mov r8, r8)

08002690 <_raise_r>:
 8002690:	b538      	push	{r3, r4, r5, lr}
 8002692:	1c05      	adds	r5, r0, #0
 8002694:	1e0c      	subs	r4, r1, #0
 8002696:	2c1f      	cmp	r4, #31
 8002698:	d822      	bhi.n	80026e0 <_raise_r+0x50>
 800269a:	23b7      	movs	r3, #183	; 0xb7
 800269c:	009b      	lsls	r3, r3, #2
 800269e:	58c3      	ldr	r3, [r0, r3]
 80026a0:	2b00      	cmp	r3, #0
 80026a2:	d014      	beq.n	80026ce <_raise_r+0x3e>
 80026a4:	008a      	lsls	r2, r1, #2
 80026a6:	189a      	adds	r2, r3, r2
 80026a8:	6813      	ldr	r3, [r2, #0]
 80026aa:	2b00      	cmp	r3, #0
 80026ac:	d00f      	beq.n	80026ce <_raise_r+0x3e>
 80026ae:	2b01      	cmp	r3, #1
 80026b0:	d00b      	beq.n	80026ca <_raise_r+0x3a>
 80026b2:	1c59      	adds	r1, r3, #1
 80026b4:	d005      	beq.n	80026c2 <_raise_r+0x32>
 80026b6:	2100      	movs	r1, #0
 80026b8:	1c20      	adds	r0, r4, #0
 80026ba:	6011      	str	r1, [r2, #0]
 80026bc:	4798      	blx	r3
 80026be:	2000      	movs	r0, #0
 80026c0:	bd38      	pop	{r3, r4, r5, pc}
 80026c2:	2316      	movs	r3, #22
 80026c4:	6003      	str	r3, [r0, #0]
 80026c6:	2001      	movs	r0, #1
 80026c8:	e7fa      	b.n	80026c0 <_raise_r+0x30>
 80026ca:	2000      	movs	r0, #0
 80026cc:	e7f8      	b.n	80026c0 <_raise_r+0x30>
 80026ce:	1c28      	adds	r0, r5, #0
 80026d0:	f000 f82a 	bl	8002728 <_getpid_r>
 80026d4:	1c22      	adds	r2, r4, #0
 80026d6:	1c01      	adds	r1, r0, #0
 80026d8:	1c28      	adds	r0, r5, #0
 80026da:	f000 f811 	bl	8002700 <_kill_r>
 80026de:	e7ef      	b.n	80026c0 <_raise_r+0x30>
 80026e0:	2316      	movs	r3, #22
 80026e2:	6003      	str	r3, [r0, #0]
 80026e4:	2001      	movs	r0, #1
 80026e6:	4240      	negs	r0, r0
 80026e8:	e7ea      	b.n	80026c0 <_raise_r+0x30>
 80026ea:	46c0      	nop			; (mov r8, r8)

080026ec <raise>:
 80026ec:	b508      	push	{r3, lr}
 80026ee:	4b03      	ldr	r3, [pc, #12]	; (80026fc <raise+0x10>)
 80026f0:	1c01      	adds	r1, r0, #0
 80026f2:	6818      	ldr	r0, [r3, #0]
 80026f4:	f7ff ffcc 	bl	8002690 <_raise_r>
 80026f8:	bd08      	pop	{r3, pc}
 80026fa:	46c0      	nop			; (mov r8, r8)
 80026fc:	20000438 	.word	0x20000438

08002700 <_kill_r>:
 8002700:	b538      	push	{r3, r4, r5, lr}
 8002702:	4c08      	ldr	r4, [pc, #32]	; (8002724 <_kill_r+0x24>)
 8002704:	2300      	movs	r3, #0
 8002706:	1c05      	adds	r5, r0, #0
 8002708:	1c08      	adds	r0, r1, #0
 800270a:	1c11      	adds	r1, r2, #0
 800270c:	6023      	str	r3, [r4, #0]
 800270e:	f7fd fff0 	bl	80006f2 <_kill>
 8002712:	1c43      	adds	r3, r0, #1
 8002714:	d000      	beq.n	8002718 <_kill_r+0x18>
 8002716:	bd38      	pop	{r3, r4, r5, pc}
 8002718:	6823      	ldr	r3, [r4, #0]
 800271a:	2b00      	cmp	r3, #0
 800271c:	d0fb      	beq.n	8002716 <_kill_r+0x16>
 800271e:	602b      	str	r3, [r5, #0]
 8002720:	e7f9      	b.n	8002716 <_kill_r+0x16>
 8002722:	46c0      	nop			; (mov r8, r8)
 8002724:	20000900 	.word	0x20000900

08002728 <_getpid_r>:
 8002728:	b508      	push	{r3, lr}
 800272a:	f7fd ffe3 	bl	80006f4 <_getpid>
 800272e:	bd08      	pop	{r3, pc}

08002730 <strcmp>:
 8002730:	7802      	ldrb	r2, [r0, #0]
 8002732:	780b      	ldrb	r3, [r1, #0]
 8002734:	3001      	adds	r0, #1
 8002736:	3101      	adds	r1, #1
 8002738:	2a00      	cmp	r2, #0
 800273a:	d001      	beq.n	8002740 <strcmp+0x10>
 800273c:	429a      	cmp	r2, r3
 800273e:	d0f7      	beq.n	8002730 <strcmp>
 8002740:	1ad0      	subs	r0, r2, r3
 8002742:	4770      	bx	lr

08002744 <_init>:
 8002744:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
 8002746:	46c0      	nop			; (mov r8, r8)
 8002748:	bcf8      	pop	{r3, r4, r5, r6, r7}
 800274a:	bc08      	pop	{r3}
 800274c:	469e      	mov	lr, r3
 800274e:	4770      	bx	lr

08002750 <_fini>:
 8002750:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
 8002752:	46c0      	nop			; (mov r8, r8)
 8002754:	bcf8      	pop	{r3, r4, r5, r6, r7}
 8002756:	bc08      	pop	{r3}
 8002758:	469e      	mov	lr, r3
 800275a:	4770      	bx	lr

0800275c <_ZTI7CParent>:
 800275c:	2970 0800 2764 0800                         p)..d'..

08002764 <_ZTS7CParent>:
 8002764:	4337 6150 6572 746e 0000 0000               7CParent....

08002770 <_ZTV7CParent>:
 8002770:	0000 0000 275c 0800 00d1 0800 0000 0000     ....\'..........

08002780 <_ZTI13CTestingClass>:
 8002780:	28f0 0800 27f0 0800 275c 0800 6976 7472     .(...'..\'..virt
 8002790:	6175 206c 656d 6874 646f 3e20 3e3e 2520     ual method >>> %
 80027a0:	0a75 6900 736e 6469 2065 656d 6874 646f     u..inside method
 80027b0:	2520 0a75 7000 7261 6e65 2074 6f63 736e      %u..parent cons
 80027c0:	7274 6375 6f74 0a72 6300 6e6f 7473 7572     tructor..constru
 80027d0:	7463 726f 6320 6c61 656c 0a64 0000 0000     ctor called.....

080027e0 <_ZTV13CTestingClass>:
 80027e0:	0000 0000 2780 0800 00e1 0800 0000 0000     .....'..........

080027f0 <_ZTS13CTestingClass>:
 80027f0:	3331 5443 7365 6974 676e 6c43 7361 0073     13CTestingClass.
 8002800:	7473 6964 206f 6e69 7469 6420 6e6f 0a65     stdio init done.
 8002810:	6300 6168 2072 253e 3c63 000a 6863 6c69     .char >%c<..chil
 8002820:	2064 2031 6874 6572 6461 3120 3131 3131     d 1 thread 11111
 8002830:	3131 000a 6863 6c69 2064 2032 6874 6572     11..child 2 thre
 8002840:	6461 3220 3232 3232 3232 000a 770a 6c65     ad 2222222...wel
 8002850:	6f63 656d 7420 206f 7553 757a 6168 534f     come to SuzuhaOS
 8002860:	5e20 5e5f 3220 322e 302e 420a 4955 444c      ^_^ 2.2.0.BUILD
 8002870:	4120 7270 3220 2039 3032 3631 3220 3a32      Apr 29 2016 22:
 8002880:	3135 323a 0a36 6d00 6961 206e 6874 6572     51:26..main thre
 8002890:	6461 000a 6f62 746f 6e69 2067 7266 6d6f     ad..booting from
 80028a0:	2520 0a75 7200 6d61 7320 6174 7472 2520      %u..ram start %
 80028b0:	2075 000a 6172 206d 6973 657a 2520 2075     u ..ram size %u 
 80028c0:	000a 6172 206d 7266 6565 2520 2075 000a     ..ram free %u ..
 80028d0:	6568 7061 7320 6174 7472 2520 2075 000a     heap start %u ..
 80028e0:	0a0a 0000 0000 0000                         ........

080028e8 <_ZTVN10__cxxabiv120__si_class_type_infoE>:
 80028e8:	0000 0000 2918 0800 1311 0800 1329 0800     .....)......)...
 80028f8:	1435 0800 1439 0800 1505 0800 146d 0800     5...9.......m...
 8002908:	140d 0800 137d 0800 1345 0800 0000 0000     ....}...E.......

08002918 <_ZTIN10__cxxabiv120__si_class_type_infoE>:
 8002918:	28f0 0800 2924 0800 2998 0800               .(..$)...)..

08002924 <_ZTSN10__cxxabiv120__si_class_type_infoE>:
 8002924:	314e 5f30 635f 7878 6261 7669 3231 5f30     N10__cxxabiv120_
 8002934:	735f 5f69 6c63 7361 5f73 7974 6570 695f     _si_class_type_i
 8002944:	666e 456f 0000 0000                         nfoE....

0800294c <_ZTISt9type_info>:
 800294c:	2970 0800 2954 0800                         p)..T)..

08002954 <_ZTSSt9type_info>:
 8002954:	7453 7439 7079 5f65 6e69 6f66 0000 0000     St9type_info....
 8002964:	0000 0000                                   ....

08002968 <_ZTVN10__cxxabiv117__class_type_infoE>:
 8002968:	0000 0000 2998 0800 14b5 0800 14cd 0800     .....)..........
 8002978:	1435 0800 1439 0800 1505 0800 146d 0800     5...9.......m...
 8002988:	14e9 0800 152d 0800 14a5 0800 0000 0000     ....-...........

08002998 <_ZTIN10__cxxabiv117__class_type_infoE>:
 8002998:	28f0 0800 29a4 0800 294c 0800               .(...)..L)..

080029a4 <_ZTSN10__cxxabiv117__class_type_infoE>:
 80029a4:	314e 5f30 635f 7878 6261 7669 3131 5f37     N10__cxxabiv117_
 80029b4:	635f 616c 7373 745f 7079 5f65 6e69 6f66     _class_type_info
 80029c4:	0045 0000 0043 0000                         E...C...

080029cc <__EH_FRAME_BEGIN__>:
 80029cc:	0000 0000                                   ....
