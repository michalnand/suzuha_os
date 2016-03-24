
bin/main.elf:     file format elf32-littlearm


Disassembly of section .text:

080000c4 <thread_ending>:
 80000c4:	b672      	cpsid	i
 80000c6:	4b05      	ldr	r3, [pc, #20]	; (80000dc <thread_ending+0x18>)
 80000c8:	220c      	movs	r2, #12
 80000ca:	681b      	ldr	r3, [r3, #0]
 80000cc:	4353      	muls	r3, r2
 80000ce:	4a04      	ldr	r2, [pc, #16]	; (80000e0 <thread_ending+0x1c>)
 80000d0:	18d3      	adds	r3, r2, r3
 80000d2:	2200      	movs	r2, #0
 80000d4:	605a      	str	r2, [r3, #4]
 80000d6:	b662      	cpsie	i
 80000d8:	46c0      	nop			; (mov r8, r8)
 80000da:	e7fd      	b.n	80000d8 <thread_ending+0x14>
 80000dc:	20000088 	.word	0x20000088
 80000e0:	20000020 	.word	0x20000020

080000e4 <null_thread>:
 80000e4:	b508      	push	{r3, lr}
 80000e6:	f001 f9bf 	bl	8001468 <sleep>
 80000ea:	e7fc      	b.n	80000e6 <null_thread+0x2>

080000ec <scheduler>:
 80000ec:	b5f0      	push	{r4, r5, r6, r7, lr}
 80000ee:	2100      	movs	r1, #0
 80000f0:	1c0a      	adds	r2, r1, #0
 80000f2:	200c      	movs	r0, #12
 80000f4:	1c05      	adds	r5, r0, #0
 80000f6:	4355      	muls	r5, r2
 80000f8:	4b14      	ldr	r3, [pc, #80]	; (800014c <scheduler+0x60>)
 80000fa:	195e      	adds	r6, r3, r5
 80000fc:	6874      	ldr	r4, [r6, #4]
 80000fe:	46a4      	mov	ip, r4
 8000100:	4667      	mov	r7, ip
 8000102:	1c1c      	adds	r4, r3, #0
 8000104:	07bf      	lsls	r7, r7, #30
 8000106:	d40a      	bmi.n	800011e <scheduler+0x32>
 8000108:	6876      	ldr	r6, [r6, #4]
 800010a:	07f7      	lsls	r7, r6, #31
 800010c:	d507      	bpl.n	800011e <scheduler+0x32>
 800010e:	4348      	muls	r0, r1
 8000110:	595d      	ldr	r5, [r3, r5]
 8000112:	5818      	ldr	r0, [r3, r0]
 8000114:	b2ad      	uxth	r5, r5
 8000116:	b280      	uxth	r0, r0
 8000118:	4285      	cmp	r5, r0
 800011a:	d200      	bcs.n	800011e <scheduler+0x32>
 800011c:	1c11      	adds	r1, r2, #0
 800011e:	200c      	movs	r0, #12
 8000120:	4350      	muls	r0, r2
 8000122:	581d      	ldr	r5, [r3, r0]
 8000124:	b2ad      	uxth	r5, r5
 8000126:	2d00      	cmp	r5, #0
 8000128:	d004      	beq.n	8000134 <scheduler+0x48>
 800012a:	581d      	ldr	r5, [r3, r0]
 800012c:	b2ad      	uxth	r5, r5
 800012e:	3d01      	subs	r5, #1
 8000130:	b2ad      	uxth	r5, r5
 8000132:	521d      	strh	r5, [r3, r0]
 8000134:	3201      	adds	r2, #1
 8000136:	2a08      	cmp	r2, #8
 8000138:	d1db      	bne.n	80000f2 <scheduler+0x6>
 800013a:	230c      	movs	r3, #12
 800013c:	434b      	muls	r3, r1
 800013e:	58e2      	ldr	r2, [r4, r3]
 8000140:	0c12      	lsrs	r2, r2, #16
 8000142:	52e2      	strh	r2, [r4, r3]
 8000144:	4b02      	ldr	r3, [pc, #8]	; (8000150 <scheduler+0x64>)
 8000146:	6019      	str	r1, [r3, #0]
 8000148:	bdf0      	pop	{r4, r5, r6, r7, pc}
 800014a:	46c0      	nop			; (mov r8, r8)
 800014c:	20000020 	.word	0x20000020
 8000150:	20000088 	.word	0x20000088

08000154 <SysTick_Handler>:
 8000154:	b4f0      	push	{r4, r5, r6, r7}
 8000156:	4644      	mov	r4, r8
 8000158:	464d      	mov	r5, r9
 800015a:	4656      	mov	r6, sl
 800015c:	465f      	mov	r7, fp
 800015e:	b4f0      	push	{r4, r5, r6, r7}
 8000160:	f3ef 8208 	mrs	r2, MSP
 8000164:	4c0f      	ldr	r4, [pc, #60]	; (80001a4 <SysTick_Handler+0x50>)
 8000166:	4d10      	ldr	r5, [pc, #64]	; (80001a8 <SysTick_Handler+0x54>)
 8000168:	6823      	ldr	r3, [r4, #0]
 800016a:	3301      	adds	r3, #1
 800016c:	d005      	beq.n	800017a <SysTick_Handler+0x26>
 800016e:	6823      	ldr	r3, [r4, #0]
 8000170:	210c      	movs	r1, #12
 8000172:	434b      	muls	r3, r1
 8000174:	18eb      	adds	r3, r5, r3
 8000176:	609a      	str	r2, [r3, #8]
 8000178:	e001      	b.n	800017e <SysTick_Handler+0x2a>
 800017a:	2300      	movs	r3, #0
 800017c:	6023      	str	r3, [r4, #0]
 800017e:	f7ff ffb5 	bl	80000ec <scheduler>
 8000182:	6823      	ldr	r3, [r4, #0]
 8000184:	220c      	movs	r2, #12
 8000186:	4353      	muls	r3, r2
 8000188:	18ed      	adds	r5, r5, r3
 800018a:	2307      	movs	r3, #7
 800018c:	68aa      	ldr	r2, [r5, #8]
 800018e:	425b      	negs	r3, r3
 8000190:	469e      	mov	lr, r3
 8000192:	f382 8808 	msr	MSP, r2
 8000196:	bcf0      	pop	{r4, r5, r6, r7}
 8000198:	46a0      	mov	r8, r4
 800019a:	46a9      	mov	r9, r5
 800019c:	46b2      	mov	sl, r6
 800019e:	46bb      	mov	fp, r7
 80001a0:	bcf0      	pop	{r4, r5, r6, r7}
 80001a2:	4770      	bx	lr
 80001a4:	20000088 	.word	0x20000088
 80001a8:	20000020 	.word	0x20000020

080001ac <sched_off>:
 80001ac:	b672      	cpsid	i
 80001ae:	4770      	bx	lr

080001b0 <sched_on>:
 80001b0:	b662      	cpsie	i
 80001b2:	4770      	bx	lr

080001b4 <yield>:
 80001b4:	b508      	push	{r3, lr}
 80001b6:	f001 f959 	bl	800146c <sys_tick_trigger>
 80001ba:	bd08      	pop	{r3, pc}

080001bc <get_thread_id>:
 80001bc:	b082      	sub	sp, #8
 80001be:	b672      	cpsid	i
 80001c0:	4b03      	ldr	r3, [pc, #12]	; (80001d0 <get_thread_id+0x14>)
 80001c2:	681b      	ldr	r3, [r3, #0]
 80001c4:	9301      	str	r3, [sp, #4]
 80001c6:	b662      	cpsie	i
 80001c8:	9801      	ldr	r0, [sp, #4]
 80001ca:	b002      	add	sp, #8
 80001cc:	4770      	bx	lr
 80001ce:	46c0      	nop			; (mov r8, r8)
 80001d0:	20000088 	.word	0x20000088

080001d4 <kernel_start>:
 80001d4:	b508      	push	{r3, lr}
 80001d6:	f001 f93b 	bl	8001450 <sys_tick_init>
 80001da:	46c0      	nop			; (mov r8, r8)
 80001dc:	e7fd      	b.n	80001da <kernel_start+0x6>
	...

080001e0 <create_thread>:
 80001e0:	b5f0      	push	{r4, r5, r6, r7, lr}
 80001e2:	b085      	sub	sp, #20
 80001e4:	9003      	str	r0, [sp, #12]
 80001e6:	481b      	ldr	r0, [pc, #108]	; (8000254 <create_thread+0x74>)
 80001e8:	0892      	lsrs	r2, r2, #2
 80001ea:	1812      	adds	r2, r2, r0
 80001ec:	0092      	lsls	r2, r2, #2
 80001ee:	1888      	adds	r0, r1, r2
 80001f0:	1c17      	adds	r7, r2, #0
 80001f2:	9002      	str	r0, [sp, #8]
 80001f4:	1c10      	adds	r0, r2, #0
 80001f6:	323c      	adds	r2, #60	; 0x3c
 80001f8:	188a      	adds	r2, r1, r2
 80001fa:	3034      	adds	r0, #52	; 0x34
 80001fc:	3738      	adds	r7, #56	; 0x38
 80001fe:	9201      	str	r2, [sp, #4]
 8000200:	180e      	adds	r6, r1, r0
 8000202:	19cf      	adds	r7, r1, r7
 8000204:	2200      	movs	r2, #0
 8000206:	b672      	cpsid	i
 8000208:	250c      	movs	r5, #12
 800020a:	4355      	muls	r5, r2
 800020c:	4c12      	ldr	r4, [pc, #72]	; (8000258 <create_thread+0x78>)
 800020e:	2008      	movs	r0, #8
 8000210:	1965      	adds	r5, r4, r5
 8000212:	6869      	ldr	r1, [r5, #4]
 8000214:	07c9      	lsls	r1, r1, #31
 8000216:	d415      	bmi.n	8000244 <create_thread+0x64>
 8000218:	9902      	ldr	r1, [sp, #8]
 800021a:	60a9      	str	r1, [r5, #8]
 800021c:	4d0f      	ldr	r5, [pc, #60]	; (800025c <create_thread+0x7c>)
 800021e:	9903      	ldr	r1, [sp, #12]
 8000220:	6035      	str	r5, [r6, #0]
 8000222:	6039      	str	r1, [r7, #0]
 8000224:	2584      	movs	r5, #132	; 0x84
 8000226:	9901      	ldr	r1, [sp, #4]
 8000228:	05ad      	lsls	r5, r5, #22
 800022a:	600d      	str	r5, [r1, #0]
 800022c:	2b07      	cmp	r3, #7
 800022e:	d800      	bhi.n	8000232 <create_thread+0x52>
 8000230:	1c03      	adds	r3, r0, #0
 8000232:	200c      	movs	r0, #12
 8000234:	4350      	muls	r0, r2
 8000236:	4908      	ldr	r1, [pc, #32]	; (8000258 <create_thread+0x78>)
 8000238:	180d      	adds	r5, r1, r0
 800023a:	806b      	strh	r3, [r5, #2]
 800023c:	5223      	strh	r3, [r4, r0]
 800023e:	2001      	movs	r0, #1
 8000240:	6068      	str	r0, [r5, #4]
 8000242:	1c10      	adds	r0, r2, #0
 8000244:	b662      	cpsie	i
 8000246:	3201      	adds	r2, #1
 8000248:	2a08      	cmp	r2, #8
 800024a:	d001      	beq.n	8000250 <create_thread+0x70>
 800024c:	2808      	cmp	r0, #8
 800024e:	d0da      	beq.n	8000206 <create_thread+0x26>
 8000250:	b005      	add	sp, #20
 8000252:	bdf0      	pop	{r4, r5, r6, r7, pc}
 8000254:	3ffffff0 	.word	0x3ffffff0
 8000258:	20000020 	.word	0x20000020
 800025c:	080000c5 	.word	0x080000c5

08000260 <kernel_init>:
 8000260:	b510      	push	{r4, lr}
 8000262:	2300      	movs	r3, #0
 8000264:	210c      	movs	r1, #12
 8000266:	4359      	muls	r1, r3
 8000268:	4a0a      	ldr	r2, [pc, #40]	; (8000294 <kernel_init+0x34>)
 800026a:	2000      	movs	r0, #0
 800026c:	1854      	adds	r4, r2, r1
 800026e:	6060      	str	r0, [r4, #4]
 8000270:	3301      	adds	r3, #1
 8000272:	2008      	movs	r0, #8
 8000274:	8060      	strh	r0, [r4, #2]
 8000276:	5288      	strh	r0, [r1, r2]
 8000278:	4283      	cmp	r3, r0
 800027a:	d1f3      	bne.n	8000264 <kernel_init+0x4>
 800027c:	4b06      	ldr	r3, [pc, #24]	; (8000298 <kernel_init+0x38>)
 800027e:	2201      	movs	r2, #1
 8000280:	4252      	negs	r2, r2
 8000282:	601a      	str	r2, [r3, #0]
 8000284:	4905      	ldr	r1, [pc, #20]	; (800029c <kernel_init+0x3c>)
 8000286:	2280      	movs	r2, #128	; 0x80
 8000288:	23ff      	movs	r3, #255	; 0xff
 800028a:	4805      	ldr	r0, [pc, #20]	; (80002a0 <kernel_init+0x40>)
 800028c:	f7ff ffa8 	bl	80001e0 <create_thread>
 8000290:	bd10      	pop	{r4, pc}
 8000292:	46c0      	nop			; (mov r8, r8)
 8000294:	20000020 	.word	0x20000020
 8000298:	20000088 	.word	0x20000088
 800029c:	2000008c 	.word	0x2000008c
 80002a0:	080000e5 	.word	0x080000e5

080002a4 <set_wait_state>:
 80002a4:	b537      	push	{r0, r1, r2, r4, r5, lr}
 80002a6:	f7ff ff89 	bl	80001bc <get_thread_id>
 80002aa:	9000      	str	r0, [sp, #0]
 80002ac:	b672      	cpsid	i
 80002ae:	9a00      	ldr	r2, [sp, #0]
 80002b0:	210c      	movs	r1, #12
 80002b2:	434a      	muls	r2, r1
 80002b4:	4b0c      	ldr	r3, [pc, #48]	; (80002e8 <set_wait_state+0x44>)
 80002b6:	2002      	movs	r0, #2
 80002b8:	189a      	adds	r2, r3, r2
 80002ba:	6851      	ldr	r1, [r2, #4]
 80002bc:	1c1d      	adds	r5, r3, #0
 80002be:	4301      	orrs	r1, r0
 80002c0:	6051      	str	r1, [r2, #4]
 80002c2:	b672      	cpsid	i
 80002c4:	9b00      	ldr	r3, [sp, #0]
 80002c6:	220c      	movs	r2, #12
 80002c8:	4353      	muls	r3, r2
 80002ca:	18eb      	adds	r3, r5, r3
 80002cc:	685b      	ldr	r3, [r3, #4]
 80002ce:	9301      	str	r3, [sp, #4]
 80002d0:	b662      	cpsie	i
 80002d2:	9b01      	ldr	r3, [sp, #4]
 80002d4:	2402      	movs	r4, #2
 80002d6:	4223      	tst	r3, r4
 80002d8:	d001      	beq.n	80002de <set_wait_state+0x3a>
 80002da:	f001 f8c7 	bl	800146c <sys_tick_trigger>
 80002de:	9b01      	ldr	r3, [sp, #4]
 80002e0:	4223      	tst	r3, r4
 80002e2:	d1ee      	bne.n	80002c2 <set_wait_state+0x1e>
 80002e4:	bd37      	pop	{r0, r1, r2, r4, r5, pc}
 80002e6:	46c0      	nop			; (mov r8, r8)
 80002e8:	20000020 	.word	0x20000020

080002ec <wake_up_threads>:
 80002ec:	2300      	movs	r3, #0
 80002ee:	b672      	cpsid	i
 80002f0:	220c      	movs	r2, #12
 80002f2:	435a      	muls	r2, r3
 80002f4:	4905      	ldr	r1, [pc, #20]	; (800030c <wake_up_threads+0x20>)
 80002f6:	2002      	movs	r0, #2
 80002f8:	188a      	adds	r2, r1, r2
 80002fa:	6851      	ldr	r1, [r2, #4]
 80002fc:	4381      	bics	r1, r0
 80002fe:	6051      	str	r1, [r2, #4]
 8000300:	b662      	cpsie	i
 8000302:	3301      	adds	r3, #1
 8000304:	2b08      	cmp	r3, #8
 8000306:	d1f2      	bne.n	80002ee <wake_up_threads+0x2>
 8000308:	4770      	bx	lr
 800030a:	46c0      	nop			; (mov r8, r8)
 800030c:	20000020 	.word	0x20000020

08000310 <lib_os_init>:
 8000310:	b508      	push	{r3, lr}
 8000312:	f7ff ffa5 	bl	8000260 <kernel_init>
 8000316:	f000 f803 	bl	8000320 <messages_init>
 800031a:	f000 f8e5 	bl	80004e8 <stdio_init>
 800031e:	bd08      	pop	{r3, pc}

08000320 <messages_init>:
 8000320:	b510      	push	{r4, lr}
 8000322:	2200      	movs	r2, #0
 8000324:	4909      	ldr	r1, [pc, #36]	; (800034c <messages_init+0x2c>)
 8000326:	0090      	lsls	r0, r2, #2
 8000328:	2300      	movs	r3, #0
 800032a:	3201      	adds	r2, #1
 800032c:	5043      	str	r3, [r0, r1]
 800032e:	2a08      	cmp	r2, #8
 8000330:	d1f8      	bne.n	8000324 <messages_init+0x4>
 8000332:	4807      	ldr	r0, [pc, #28]	; (8000350 <messages_init+0x30>)
 8000334:	011c      	lsls	r4, r3, #4
 8000336:	2200      	movs	r2, #0
 8000338:	1901      	adds	r1, r0, r4
 800033a:	3301      	adds	r3, #1
 800033c:	604a      	str	r2, [r1, #4]
 800033e:	5022      	str	r2, [r4, r0]
 8000340:	60ca      	str	r2, [r1, #12]
 8000342:	608a      	str	r2, [r1, #8]
 8000344:	2b04      	cmp	r3, #4
 8000346:	d1f4      	bne.n	8000332 <messages_init+0x12>
 8000348:	bd10      	pop	{r4, pc}
 800034a:	46c0      	nop			; (mov r8, r8)
 800034c:	2000010c 	.word	0x2000010c
 8000350:	2000012c 	.word	0x2000012c

08000354 <putc_>:
 8000354:	b538      	push	{r3, r4, r5, lr}
 8000356:	4c06      	ldr	r4, [pc, #24]	; (8000370 <putc_+0x1c>)
 8000358:	1c05      	adds	r5, r0, #0
 800035a:	1c20      	adds	r0, r4, #0
 800035c:	f000 f8f7 	bl	800054e <mutex_lock>
 8000360:	1c28      	adds	r0, r5, #0
 8000362:	f000 ff87 	bl	8001274 <uart_write>
 8000366:	1c20      	adds	r0, r4, #0
 8000368:	f000 f90d 	bl	8000586 <mutex_unlock>
 800036c:	bd38      	pop	{r3, r4, r5, pc}
 800036e:	46c0      	nop			; (mov r8, r8)
 8000370:	2000016c 	.word	0x2000016c

08000374 <puts_>:
 8000374:	b538      	push	{r3, r4, r5, lr}
 8000376:	4d08      	ldr	r5, [pc, #32]	; (8000398 <puts_+0x24>)
 8000378:	1c04      	adds	r4, r0, #0
 800037a:	1c28      	adds	r0, r5, #0
 800037c:	f000 f8e7 	bl	800054e <mutex_lock>
 8000380:	3401      	adds	r4, #1
 8000382:	1e63      	subs	r3, r4, #1
 8000384:	7818      	ldrb	r0, [r3, #0]
 8000386:	2800      	cmp	r0, #0
 8000388:	d002      	beq.n	8000390 <puts_+0x1c>
 800038a:	f7ff ffe3 	bl	8000354 <putc_>
 800038e:	e7f7      	b.n	8000380 <puts_+0xc>
 8000390:	1c28      	adds	r0, r5, #0
 8000392:	f000 f8f8 	bl	8000586 <mutex_unlock>
 8000396:	bd38      	pop	{r3, r4, r5, pc}
 8000398:	20000178 	.word	0x20000178

0800039c <puti_>:
 800039c:	b5f0      	push	{r4, r5, r6, r7, lr}
 800039e:	2300      	movs	r3, #0
 80003a0:	b085      	sub	sp, #20
 80003a2:	1c04      	adds	r4, r0, #0
 80003a4:	1c1f      	adds	r7, r3, #0
 80003a6:	4298      	cmp	r0, r3
 80003a8:	da01      	bge.n	80003ae <puti_+0x12>
 80003aa:	4244      	negs	r4, r0
 80003ac:	2701      	movs	r7, #1
 80003ae:	ae01      	add	r6, sp, #4
 80003b0:	72f3      	strb	r3, [r6, #11]
 80003b2:	250a      	movs	r5, #10
 80003b4:	1c20      	adds	r0, r4, #0
 80003b6:	210a      	movs	r1, #10
 80003b8:	f002 f8ac 	bl	8002514 <__aeabi_idivmod>
 80003bc:	3130      	adds	r1, #48	; 0x30
 80003be:	5571      	strb	r1, [r6, r5]
 80003c0:	1c20      	adds	r0, r4, #0
 80003c2:	210a      	movs	r1, #10
 80003c4:	f002 f850 	bl	8002468 <__aeabi_idiv>
 80003c8:	1e6b      	subs	r3, r5, #1
 80003ca:	1e04      	subs	r4, r0, #0
 80003cc:	d001      	beq.n	80003d2 <puti_+0x36>
 80003ce:	1c1d      	adds	r5, r3, #0
 80003d0:	e7f0      	b.n	80003b4 <puti_+0x18>
 80003d2:	2f00      	cmp	r7, #0
 80003d4:	d002      	beq.n	80003dc <puti_+0x40>
 80003d6:	222d      	movs	r2, #45	; 0x2d
 80003d8:	54f2      	strb	r2, [r6, r3]
 80003da:	1c1d      	adds	r5, r3, #0
 80003dc:	1970      	adds	r0, r6, r5
 80003de:	f7ff ffc9 	bl	8000374 <puts_>
 80003e2:	b005      	add	sp, #20
 80003e4:	bdf0      	pop	{r4, r5, r6, r7, pc}

080003e6 <putui_>:
 80003e6:	b57f      	push	{r0, r1, r2, r3, r4, r5, r6, lr}
 80003e8:	2300      	movs	r3, #0
 80003ea:	ae01      	add	r6, sp, #4
 80003ec:	1c05      	adds	r5, r0, #0
 80003ee:	72f3      	strb	r3, [r6, #11]
 80003f0:	240a      	movs	r4, #10
 80003f2:	1c28      	adds	r0, r5, #0
 80003f4:	210a      	movs	r1, #10
 80003f6:	f002 f82d 	bl	8002454 <__aeabi_uidivmod>
 80003fa:	3130      	adds	r1, #48	; 0x30
 80003fc:	5531      	strb	r1, [r6, r4]
 80003fe:	1c28      	adds	r0, r5, #0
 8000400:	210a      	movs	r1, #10
 8000402:	f001 ffe3 	bl	80023cc <__aeabi_uidiv>
 8000406:	1e63      	subs	r3, r4, #1
 8000408:	1e05      	subs	r5, r0, #0
 800040a:	d001      	beq.n	8000410 <putui_+0x2a>
 800040c:	1c1c      	adds	r4, r3, #0
 800040e:	e7f0      	b.n	80003f2 <putui_+0xc>
 8000410:	1930      	adds	r0, r6, r4
 8000412:	f7ff ffaf 	bl	8000374 <puts_>
 8000416:	bd7f      	pop	{r0, r1, r2, r3, r4, r5, r6, pc}

08000418 <putx_>:
 8000418:	b51f      	push	{r0, r1, r2, r3, r4, lr}
 800041a:	2300      	movs	r3, #0
 800041c:	aa01      	add	r2, sp, #4
 800041e:	72d3      	strb	r3, [r2, #11]
 8000420:	230a      	movs	r3, #10
 8000422:	210f      	movs	r1, #15
 8000424:	4001      	ands	r1, r0
 8000426:	2909      	cmp	r1, #9
 8000428:	d801      	bhi.n	800042e <putx_+0x16>
 800042a:	3130      	adds	r1, #48	; 0x30
 800042c:	e000      	b.n	8000430 <putx_+0x18>
 800042e:	3157      	adds	r1, #87	; 0x57
 8000430:	54d1      	strb	r1, [r2, r3]
 8000432:	0900      	lsrs	r0, r0, #4
 8000434:	1e59      	subs	r1, r3, #1
 8000436:	2800      	cmp	r0, #0
 8000438:	d001      	beq.n	800043e <putx_+0x26>
 800043a:	1c0b      	adds	r3, r1, #0
 800043c:	e7f1      	b.n	8000422 <putx_+0xa>
 800043e:	18d0      	adds	r0, r2, r3
 8000440:	f7ff ff98 	bl	8000374 <puts_>
 8000444:	b005      	add	sp, #20
 8000446:	bd00      	pop	{pc}

08000448 <printf_>:
 8000448:	b40f      	push	{r0, r1, r2, r3}
 800044a:	b573      	push	{r0, r1, r4, r5, r6, lr}
 800044c:	4e25      	ldr	r6, [pc, #148]	; (80004e4 <printf_+0x9c>)
 800044e:	ac06      	add	r4, sp, #24
 8000450:	cc20      	ldmia	r4!, {r5}
 8000452:	1c30      	adds	r0, r6, #0
 8000454:	f000 f87b 	bl	800054e <mutex_lock>
 8000458:	9401      	str	r4, [sp, #4]
 800045a:	2400      	movs	r4, #0
 800045c:	5d28      	ldrb	r0, [r5, r4]
 800045e:	2800      	cmp	r0, #0
 8000460:	d039      	beq.n	80004d6 <printf_+0x8e>
 8000462:	2825      	cmp	r0, #37	; 0x25
 8000464:	d003      	beq.n	800046e <printf_+0x26>
 8000466:	f7ff ff75 	bl	8000354 <putc_>
 800046a:	3401      	adds	r4, #1
 800046c:	e7f6      	b.n	800045c <printf_+0x14>
 800046e:	192b      	adds	r3, r5, r4
 8000470:	7858      	ldrb	r0, [r3, #1]
 8000472:	2869      	cmp	r0, #105	; 0x69
 8000474:	d016      	beq.n	80004a4 <printf_+0x5c>
 8000476:	d808      	bhi.n	800048a <printf_+0x42>
 8000478:	2825      	cmp	r0, #37	; 0x25
 800047a:	d028      	beq.n	80004ce <printf_+0x86>
 800047c:	2863      	cmp	r0, #99	; 0x63
 800047e:	d128      	bne.n	80004d2 <printf_+0x8a>
 8000480:	9b01      	ldr	r3, [sp, #4]
 8000482:	1d1a      	adds	r2, r3, #4
 8000484:	9201      	str	r2, [sp, #4]
 8000486:	7818      	ldrb	r0, [r3, #0]
 8000488:	e021      	b.n	80004ce <printf_+0x86>
 800048a:	2875      	cmp	r0, #117	; 0x75
 800048c:	d011      	beq.n	80004b2 <printf_+0x6a>
 800048e:	2878      	cmp	r0, #120	; 0x78
 8000490:	d016      	beq.n	80004c0 <printf_+0x78>
 8000492:	2873      	cmp	r0, #115	; 0x73
 8000494:	d11d      	bne.n	80004d2 <printf_+0x8a>
 8000496:	9b01      	ldr	r3, [sp, #4]
 8000498:	1d1a      	adds	r2, r3, #4
 800049a:	6818      	ldr	r0, [r3, #0]
 800049c:	9201      	str	r2, [sp, #4]
 800049e:	f7ff ff69 	bl	8000374 <puts_>
 80004a2:	e016      	b.n	80004d2 <printf_+0x8a>
 80004a4:	9b01      	ldr	r3, [sp, #4]
 80004a6:	1d1a      	adds	r2, r3, #4
 80004a8:	6818      	ldr	r0, [r3, #0]
 80004aa:	9201      	str	r2, [sp, #4]
 80004ac:	f7ff ff76 	bl	800039c <puti_>
 80004b0:	e00f      	b.n	80004d2 <printf_+0x8a>
 80004b2:	9b01      	ldr	r3, [sp, #4]
 80004b4:	1d1a      	adds	r2, r3, #4
 80004b6:	6818      	ldr	r0, [r3, #0]
 80004b8:	9201      	str	r2, [sp, #4]
 80004ba:	f7ff ff94 	bl	80003e6 <putui_>
 80004be:	e008      	b.n	80004d2 <printf_+0x8a>
 80004c0:	9b01      	ldr	r3, [sp, #4]
 80004c2:	1d1a      	adds	r2, r3, #4
 80004c4:	6818      	ldr	r0, [r3, #0]
 80004c6:	9201      	str	r2, [sp, #4]
 80004c8:	f7ff ffa6 	bl	8000418 <putx_>
 80004cc:	e001      	b.n	80004d2 <printf_+0x8a>
 80004ce:	f7ff ff41 	bl	8000354 <putc_>
 80004d2:	3402      	adds	r4, #2
 80004d4:	e7c2      	b.n	800045c <printf_+0x14>
 80004d6:	1c30      	adds	r0, r6, #0
 80004d8:	f000 f855 	bl	8000586 <mutex_unlock>
 80004dc:	bc73      	pop	{r0, r1, r4, r5, r6}
 80004de:	bc08      	pop	{r3}
 80004e0:	b004      	add	sp, #16
 80004e2:	4718      	bx	r3
 80004e4:	20000174 	.word	0x20000174

080004e8 <stdio_init>:
 80004e8:	b510      	push	{r4, lr}
 80004ea:	480f      	ldr	r0, [pc, #60]	; (8000528 <stdio_init+0x40>)
 80004ec:	f000 f826 	bl	800053c <mutex_init>
 80004f0:	480e      	ldr	r0, [pc, #56]	; (800052c <stdio_init+0x44>)
 80004f2:	f000 f823 	bl	800053c <mutex_init>
 80004f6:	480e      	ldr	r0, [pc, #56]	; (8000530 <stdio_init+0x48>)
 80004f8:	f000 f820 	bl	800053c <mutex_init>
 80004fc:	480d      	ldr	r0, [pc, #52]	; (8000534 <stdio_init+0x4c>)
 80004fe:	f000 f81d 	bl	800053c <mutex_init>
 8000502:	2408      	movs	r4, #8
 8000504:	2020      	movs	r0, #32
 8000506:	3c01      	subs	r4, #1
 8000508:	f7ff ff24 	bl	8000354 <putc_>
 800050c:	2c00      	cmp	r4, #0
 800050e:	d1f9      	bne.n	8000504 <stdio_init+0x1c>
 8000510:	2420      	movs	r4, #32
 8000512:	200a      	movs	r0, #10
 8000514:	3c01      	subs	r4, #1
 8000516:	f7ff ff1d 	bl	8000354 <putc_>
 800051a:	2c00      	cmp	r4, #0
 800051c:	d1f9      	bne.n	8000512 <stdio_init+0x2a>
 800051e:	4806      	ldr	r0, [pc, #24]	; (8000538 <stdio_init+0x50>)
 8000520:	f7ff ff92 	bl	8000448 <printf_>
 8000524:	bd10      	pop	{r4, pc}
 8000526:	46c0      	nop			; (mov r8, r8)
 8000528:	2000016c 	.word	0x2000016c
 800052c:	20000170 	.word	0x20000170
 8000530:	20000178 	.word	0x20000178
 8000534:	20000174 	.word	0x20000174
 8000538:	08002544 	.word	0x08002544

0800053c <mutex_init>:
 800053c:	b510      	push	{r4, lr}
 800053e:	1c04      	adds	r4, r0, #0
 8000540:	f7ff fe34 	bl	80001ac <sched_off>
 8000544:	2300      	movs	r3, #0
 8000546:	6023      	str	r3, [r4, #0]
 8000548:	f7ff fe32 	bl	80001b0 <sched_on>
 800054c:	bd10      	pop	{r4, pc}

0800054e <mutex_lock>:
 800054e:	b513      	push	{r0, r1, r4, lr}
 8000550:	1c04      	adds	r4, r0, #0
 8000552:	f7ff fe2b 	bl	80001ac <sched_off>
 8000556:	6823      	ldr	r3, [r4, #0]
 8000558:	9301      	str	r3, [sp, #4]
 800055a:	f7ff fe29 	bl	80001b0 <sched_on>
 800055e:	9b01      	ldr	r3, [sp, #4]
 8000560:	2b00      	cmp	r3, #0
 8000562:	d001      	beq.n	8000568 <mutex_lock+0x1a>
 8000564:	f7ff fe9e 	bl	80002a4 <set_wait_state>
 8000568:	9b01      	ldr	r3, [sp, #4]
 800056a:	2b00      	cmp	r3, #0
 800056c:	d1f1      	bne.n	8000552 <mutex_lock+0x4>
 800056e:	f7ff fe1d 	bl	80001ac <sched_off>
 8000572:	6823      	ldr	r3, [r4, #0]
 8000574:	9301      	str	r3, [sp, #4]
 8000576:	9b01      	ldr	r3, [sp, #4]
 8000578:	2b00      	cmp	r3, #0
 800057a:	d1ea      	bne.n	8000552 <mutex_lock+0x4>
 800057c:	2301      	movs	r3, #1
 800057e:	6023      	str	r3, [r4, #0]
 8000580:	f7ff fe16 	bl	80001b0 <sched_on>
 8000584:	bd13      	pop	{r0, r1, r4, pc}

08000586 <mutex_unlock>:
 8000586:	b508      	push	{r3, lr}
 8000588:	f7ff ffd8 	bl	800053c <mutex_init>
 800058c:	f7ff feae 	bl	80002ec <wake_up_threads>
 8000590:	f7ff fe10 	bl	80001b4 <yield>
 8000594:	bd08      	pop	{r3, pc}
	...

08000598 <mem_info_print>:
 8000598:	b538      	push	{r3, r4, r5, lr}
 800059a:	480e      	ldr	r0, [pc, #56]	; (80005d4 <mem_info_print+0x3c>)
 800059c:	490e      	ldr	r1, [pc, #56]	; (80005d8 <mem_info_print+0x40>)
 800059e:	f7ff ff53 	bl	8000448 <printf_>
 80005a2:	4c0e      	ldr	r4, [pc, #56]	; (80005dc <mem_info_print+0x44>)
 80005a4:	480e      	ldr	r0, [pc, #56]	; (80005e0 <mem_info_print+0x48>)
 80005a6:	1c21      	adds	r1, r4, #0
 80005a8:	f7ff ff4e 	bl	8000448 <printf_>
 80005ac:	4d0d      	ldr	r5, [pc, #52]	; (80005e4 <mem_info_print+0x4c>)
 80005ae:	480e      	ldr	r0, [pc, #56]	; (80005e8 <mem_info_print+0x50>)
 80005b0:	1b2d      	subs	r5, r5, r4
 80005b2:	1c29      	adds	r1, r5, #0
 80005b4:	f7ff ff48 	bl	8000448 <printf_>
 80005b8:	490c      	ldr	r1, [pc, #48]	; (80005ec <mem_info_print+0x54>)
 80005ba:	480d      	ldr	r0, [pc, #52]	; (80005f0 <mem_info_print+0x58>)
 80005bc:	1a64      	subs	r4, r4, r1
 80005be:	1929      	adds	r1, r5, r4
 80005c0:	f7ff ff42 	bl	8000448 <printf_>
 80005c4:	490b      	ldr	r1, [pc, #44]	; (80005f4 <mem_info_print+0x5c>)
 80005c6:	480c      	ldr	r0, [pc, #48]	; (80005f8 <mem_info_print+0x60>)
 80005c8:	f7ff ff3e 	bl	8000448 <printf_>
 80005cc:	480b      	ldr	r0, [pc, #44]	; (80005fc <mem_info_print+0x64>)
 80005ce:	f7ff ff3b 	bl	8000448 <printf_>
 80005d2:	bd38      	pop	{r3, r4, r5, pc}
 80005d4:	08002555 	.word	0x08002555
 80005d8:	0800252c 	.word	0x0800252c
 80005dc:	20000000 	.word	0x20000000
 80005e0:	08002566 	.word	0x08002566
 80005e4:	20001000 	.word	0x20001000
 80005e8:	08002575 	.word	0x08002575
 80005ec:	200008d0 	.word	0x200008d0
 80005f0:	08002583 	.word	0x08002583
 80005f4:	200008d0 	.word	0x200008d0
 80005f8:	08002591 	.word	0x08002591
 80005fc:	080025a1 	.word	0x080025a1

08000600 <main>:
 8000600:	b508      	push	{r3, lr}
 8000602:	f001 fe55 	bl	80022b0 <lib_low_level_init>
 8000606:	f7ff fe83 	bl	8000310 <lib_os_init>
 800060a:	f7ff ffc5 	bl	8000598 <mem_info_print>
 800060e:	2280      	movs	r2, #128	; 0x80
 8000610:	4904      	ldr	r1, [pc, #16]	; (8000624 <main+0x24>)
 8000612:	0052      	lsls	r2, r2, #1
 8000614:	2308      	movs	r3, #8
 8000616:	4804      	ldr	r0, [pc, #16]	; (8000628 <main+0x28>)
 8000618:	f7ff fde2 	bl	80001e0 <create_thread>
 800061c:	f7ff fdda 	bl	80001d4 <kernel_start>
 8000620:	2000      	movs	r0, #0
 8000622:	bd08      	pop	{r3, pc}
 8000624:	2000027c 	.word	0x2000027c
 8000628:	08000db5 	.word	0x08000db5

0800062c <hmc5883_init>:
 800062c:	b510      	push	{r4, lr}
 800062e:	4b16      	ldr	r3, [pc, #88]	; (8000688 <hmc5883_init+0x5c>)
 8000630:	2400      	movs	r4, #0
 8000632:	203c      	movs	r0, #60	; 0x3c
 8000634:	1c21      	adds	r1, r4, #0
 8000636:	2218      	movs	r2, #24
 8000638:	801c      	strh	r4, [r3, #0]
 800063a:	805c      	strh	r4, [r3, #2]
 800063c:	809c      	strh	r4, [r3, #4]
 800063e:	f000 fded 	bl	800121c <i2c_write_reg>
 8000642:	203c      	movs	r0, #60	; 0x3c
 8000644:	2101      	movs	r1, #1
 8000646:	1c22      	adds	r2, r4, #0
 8000648:	f000 fde8 	bl	800121c <i2c_write_reg>
 800064c:	203c      	movs	r0, #60	; 0x3c
 800064e:	2102      	movs	r1, #2
 8000650:	1c22      	adds	r2, r4, #0
 8000652:	f000 fde3 	bl	800121c <i2c_write_reg>
 8000656:	203c      	movs	r0, #60	; 0x3c
 8000658:	210a      	movs	r1, #10
 800065a:	f000 fdf1 	bl	8001240 <i2c_read_reg>
 800065e:	2301      	movs	r3, #1
 8000660:	2848      	cmp	r0, #72	; 0x48
 8000662:	d10f      	bne.n	8000684 <hmc5883_init+0x58>
 8000664:	203c      	movs	r0, #60	; 0x3c
 8000666:	210b      	movs	r1, #11
 8000668:	f000 fdea 	bl	8001240 <i2c_read_reg>
 800066c:	2302      	movs	r3, #2
 800066e:	2834      	cmp	r0, #52	; 0x34
 8000670:	d108      	bne.n	8000684 <hmc5883_init+0x58>
 8000672:	203c      	movs	r0, #60	; 0x3c
 8000674:	210c      	movs	r1, #12
 8000676:	f000 fde3 	bl	8001240 <i2c_read_reg>
 800067a:	2833      	cmp	r0, #51	; 0x33
 800067c:	d001      	beq.n	8000682 <hmc5883_init+0x56>
 800067e:	2303      	movs	r3, #3
 8000680:	e000      	b.n	8000684 <hmc5883_init+0x58>
 8000682:	1c23      	adds	r3, r4, #0
 8000684:	1c18      	adds	r0, r3, #0
 8000686:	bd10      	pop	{r4, pc}
 8000688:	2000047c 	.word	0x2000047c

0800068c <hmc5883_read>:
 800068c:	b538      	push	{r3, r4, r5, lr}
 800068e:	2103      	movs	r1, #3
 8000690:	203c      	movs	r0, #60	; 0x3c
 8000692:	f000 fdd5 	bl	8001240 <i2c_read_reg>
 8000696:	4c12      	ldr	r4, [pc, #72]	; (80006e0 <hmc5883_read+0x54>)
 8000698:	0205      	lsls	r5, r0, #8
 800069a:	b2ad      	uxth	r5, r5
 800069c:	2104      	movs	r1, #4
 800069e:	203c      	movs	r0, #60	; 0x3c
 80006a0:	8025      	strh	r5, [r4, #0]
 80006a2:	f000 fdcd 	bl	8001240 <i2c_read_reg>
 80006a6:	2107      	movs	r1, #7
 80006a8:	4305      	orrs	r5, r0
 80006aa:	203c      	movs	r0, #60	; 0x3c
 80006ac:	8025      	strh	r5, [r4, #0]
 80006ae:	f000 fdc7 	bl	8001240 <i2c_read_reg>
 80006b2:	0205      	lsls	r5, r0, #8
 80006b4:	b2ad      	uxth	r5, r5
 80006b6:	2108      	movs	r1, #8
 80006b8:	203c      	movs	r0, #60	; 0x3c
 80006ba:	8065      	strh	r5, [r4, #2]
 80006bc:	f000 fdc0 	bl	8001240 <i2c_read_reg>
 80006c0:	2105      	movs	r1, #5
 80006c2:	4305      	orrs	r5, r0
 80006c4:	203c      	movs	r0, #60	; 0x3c
 80006c6:	8065      	strh	r5, [r4, #2]
 80006c8:	f000 fdba 	bl	8001240 <i2c_read_reg>
 80006cc:	0205      	lsls	r5, r0, #8
 80006ce:	b2ad      	uxth	r5, r5
 80006d0:	2106      	movs	r1, #6
 80006d2:	203c      	movs	r0, #60	; 0x3c
 80006d4:	80a5      	strh	r5, [r4, #4]
 80006d6:	f000 fdb3 	bl	8001240 <i2c_read_reg>
 80006da:	4305      	orrs	r5, r0
 80006dc:	80a5      	strh	r5, [r4, #4]
 80006de:	bd38      	pop	{r3, r4, r5, pc}
 80006e0:	2000047c 	.word	0x2000047c

080006e4 <apds9950_read>:
 80006e4:	b538      	push	{r3, r4, r5, lr}
 80006e6:	f000 fd2f 	bl	8001148 <i2cStart>
 80006ea:	2072      	movs	r0, #114	; 0x72
 80006ec:	f000 fd48 	bl	8001180 <i2cWrite>
 80006f0:	20b4      	movs	r0, #180	; 0xb4
 80006f2:	f000 fd45 	bl	8001180 <i2cWrite>
 80006f6:	f000 fd27 	bl	8001148 <i2cStart>
 80006fa:	2073      	movs	r0, #115	; 0x73
 80006fc:	f000 fd40 	bl	8001180 <i2cWrite>
 8000700:	2001      	movs	r0, #1
 8000702:	f000 fd65 	bl	80011d0 <i2cRead>
 8000706:	4c1c      	ldr	r4, [pc, #112]	; (8000778 <apds9950_read+0x94>)
 8000708:	1c05      	adds	r5, r0, #0
 800070a:	80e0      	strh	r0, [r4, #6]
 800070c:	2001      	movs	r0, #1
 800070e:	f000 fd5f 	bl	80011d0 <i2cRead>
 8000712:	0200      	lsls	r0, r0, #8
 8000714:	4305      	orrs	r5, r0
 8000716:	2001      	movs	r0, #1
 8000718:	80e5      	strh	r5, [r4, #6]
 800071a:	f000 fd59 	bl	80011d0 <i2cRead>
 800071e:	8020      	strh	r0, [r4, #0]
 8000720:	1c05      	adds	r5, r0, #0
 8000722:	2001      	movs	r0, #1
 8000724:	f000 fd54 	bl	80011d0 <i2cRead>
 8000728:	0200      	lsls	r0, r0, #8
 800072a:	4305      	orrs	r5, r0
 800072c:	2001      	movs	r0, #1
 800072e:	8025      	strh	r5, [r4, #0]
 8000730:	f000 fd4e 	bl	80011d0 <i2cRead>
 8000734:	8060      	strh	r0, [r4, #2]
 8000736:	1c05      	adds	r5, r0, #0
 8000738:	2001      	movs	r0, #1
 800073a:	f000 fd49 	bl	80011d0 <i2cRead>
 800073e:	0200      	lsls	r0, r0, #8
 8000740:	4305      	orrs	r5, r0
 8000742:	2001      	movs	r0, #1
 8000744:	8065      	strh	r5, [r4, #2]
 8000746:	f000 fd43 	bl	80011d0 <i2cRead>
 800074a:	80a0      	strh	r0, [r4, #4]
 800074c:	1c05      	adds	r5, r0, #0
 800074e:	2001      	movs	r0, #1
 8000750:	f000 fd3e 	bl	80011d0 <i2cRead>
 8000754:	0200      	lsls	r0, r0, #8
 8000756:	4305      	orrs	r5, r0
 8000758:	2001      	movs	r0, #1
 800075a:	80a5      	strh	r5, [r4, #4]
 800075c:	f000 fd38 	bl	80011d0 <i2cRead>
 8000760:	8120      	strh	r0, [r4, #8]
 8000762:	1c05      	adds	r5, r0, #0
 8000764:	2000      	movs	r0, #0
 8000766:	f000 fd33 	bl	80011d0 <i2cRead>
 800076a:	0200      	lsls	r0, r0, #8
 800076c:	4305      	orrs	r5, r0
 800076e:	8125      	strh	r5, [r4, #8]
 8000770:	f000 fcf8 	bl	8001164 <i2cStop>
 8000774:	bd38      	pop	{r3, r4, r5, pc}
 8000776:	46c0      	nop			; (mov r8, r8)
 8000778:	20000482 	.word	0x20000482

0800077c <apds950_init>:
 800077c:	b508      	push	{r3, lr}
 800077e:	2072      	movs	r0, #114	; 0x72
 8000780:	2181      	movs	r1, #129	; 0x81
 8000782:	22ff      	movs	r2, #255	; 0xff
 8000784:	f000 fd4a 	bl	800121c <i2c_write_reg>
 8000788:	2072      	movs	r0, #114	; 0x72
 800078a:	2183      	movs	r1, #131	; 0x83
 800078c:	22ff      	movs	r2, #255	; 0xff
 800078e:	f000 fd45 	bl	800121c <i2c_write_reg>
 8000792:	2072      	movs	r0, #114	; 0x72
 8000794:	218d      	movs	r1, #141	; 0x8d
 8000796:	2200      	movs	r2, #0
 8000798:	f000 fd40 	bl	800121c <i2c_write_reg>
 800079c:	2072      	movs	r0, #114	; 0x72
 800079e:	2180      	movs	r1, #128	; 0x80
 80007a0:	2203      	movs	r2, #3
 80007a2:	f000 fd3b 	bl	800121c <i2c_write_reg>
 80007a6:	2072      	movs	r0, #114	; 0x72
 80007a8:	218f      	movs	r1, #143	; 0x8f
 80007aa:	2223      	movs	r2, #35	; 0x23
 80007ac:	f000 fd36 	bl	800121c <i2c_write_reg>
 80007b0:	2072      	movs	r0, #114	; 0x72
 80007b2:	2180      	movs	r1, #128	; 0x80
 80007b4:	2207      	movs	r2, #7
 80007b6:	f000 fd31 	bl	800121c <i2c_write_reg>
 80007ba:	2072      	movs	r0, #114	; 0x72
 80007bc:	218e      	movs	r1, #142	; 0x8e
 80007be:	2208      	movs	r2, #8
 80007c0:	f000 fd2c 	bl	800121c <i2c_write_reg>
 80007c4:	f7ff ff8e 	bl	80006e4 <apds9950_read>
 80007c8:	2000      	movs	r0, #0
 80007ca:	bd08      	pop	{r3, pc}

080007cc <LCD_SH1106_write_command>:
 80007cc:	b508      	push	{r3, lr}
 80007ce:	1c02      	adds	r2, r0, #0
 80007d0:	2100      	movs	r1, #0
 80007d2:	2078      	movs	r0, #120	; 0x78
 80007d4:	f000 fd22 	bl	800121c <i2c_write_reg>
 80007d8:	bd08      	pop	{r3, pc}

080007da <LCD_SH1106_set_cursor>:
 80007da:	b510      	push	{r4, lr}
 80007dc:	1c84      	adds	r4, r0, #2
 80007de:	1c08      	adds	r0, r1, #0
 80007e0:	3850      	subs	r0, #80	; 0x50
 80007e2:	b2c0      	uxtb	r0, r0
 80007e4:	f7ff fff2 	bl	80007cc <LCD_SH1106_write_command>
 80007e8:	b2e4      	uxtb	r4, r4
 80007ea:	200f      	movs	r0, #15
 80007ec:	4020      	ands	r0, r4
 80007ee:	f7ff ffed 	bl	80007cc <LCD_SH1106_write_command>
 80007f2:	0924      	lsrs	r4, r4, #4
 80007f4:	2010      	movs	r0, #16
 80007f6:	4320      	orrs	r0, r4
 80007f8:	f7ff ffe8 	bl	80007cc <LCD_SH1106_write_command>
 80007fc:	bd10      	pop	{r4, pc}
	...

08000800 <LCD_SH1106_set_pixel>:
 8000800:	b570      	push	{r4, r5, r6, lr}
 8000802:	1c0c      	adds	r4, r1, #0
 8000804:	1c05      	adds	r5, r0, #0
 8000806:	1c16      	adds	r6, r2, #0
 8000808:	f7ff fcd0 	bl	80001ac <sched_off>
 800080c:	08e2      	lsrs	r2, r4, #3
 800080e:	2107      	movs	r1, #7
 8000810:	400c      	ands	r4, r1
 8000812:	01d2      	lsls	r2, r2, #7
 8000814:	4b08      	ldr	r3, [pc, #32]	; (8000838 <LCD_SH1106_set_pixel+0x38>)
 8000816:	2101      	movs	r1, #1
 8000818:	1955      	adds	r5, r2, r5
 800081a:	40a1      	lsls	r1, r4
 800081c:	5d5a      	ldrb	r2, [r3, r5]
 800081e:	1c0c      	adds	r4, r1, #0
 8000820:	2e00      	cmp	r6, #0
 8000822:	d003      	beq.n	800082c <LCD_SH1106_set_pixel+0x2c>
 8000824:	4314      	orrs	r4, r2
 8000826:	b2e4      	uxtb	r4, r4
 8000828:	555c      	strb	r4, [r3, r5]
 800082a:	e001      	b.n	8000830 <LCD_SH1106_set_pixel+0x30>
 800082c:	438a      	bics	r2, r1
 800082e:	555a      	strb	r2, [r3, r5]
 8000830:	f7ff fcbe 	bl	80001b0 <sched_on>
 8000834:	bd70      	pop	{r4, r5, r6, pc}
 8000836:	46c0      	nop			; (mov r8, r8)
 8000838:	2000048e 	.word	0x2000048e

0800083c <LCD_SH1106_clear_buffer>:
 800083c:	b082      	sub	sp, #8
 800083e:	2300      	movs	r3, #0
 8000840:	9300      	str	r3, [sp, #0]
 8000842:	9b00      	ldr	r3, [sp, #0]
 8000844:	2b07      	cmp	r3, #7
 8000846:	d810      	bhi.n	800086a <LCD_SH1106_clear_buffer+0x2e>
 8000848:	2300      	movs	r3, #0
 800084a:	9301      	str	r3, [sp, #4]
 800084c:	9b01      	ldr	r3, [sp, #4]
 800084e:	2b7f      	cmp	r3, #127	; 0x7f
 8000850:	d808      	bhi.n	8000864 <LCD_SH1106_clear_buffer+0x28>
 8000852:	9a00      	ldr	r2, [sp, #0]
 8000854:	9b01      	ldr	r3, [sp, #4]
 8000856:	01d2      	lsls	r2, r2, #7
 8000858:	18d2      	adds	r2, r2, r3
 800085a:	4b05      	ldr	r3, [pc, #20]	; (8000870 <LCD_SH1106_clear_buffer+0x34>)
 800085c:	54d0      	strb	r0, [r2, r3]
 800085e:	9b01      	ldr	r3, [sp, #4]
 8000860:	3301      	adds	r3, #1
 8000862:	e7f2      	b.n	800084a <LCD_SH1106_clear_buffer+0xe>
 8000864:	9b00      	ldr	r3, [sp, #0]
 8000866:	3301      	adds	r3, #1
 8000868:	e7ea      	b.n	8000840 <LCD_SH1106_clear_buffer+0x4>
 800086a:	b002      	add	sp, #8
 800086c:	4770      	bx	lr
 800086e:	46c0      	nop			; (mov r8, r8)
 8000870:	2000048e 	.word	0x2000048e

08000874 <LCD_SH1106_flush_buffer>:
 8000874:	b530      	push	{r4, r5, lr}
 8000876:	2000      	movs	r0, #0
 8000878:	b085      	sub	sp, #20
 800087a:	f7ff ffa7 	bl	80007cc <LCD_SH1106_write_command>
 800087e:	2010      	movs	r0, #16
 8000880:	f7ff ffa4 	bl	80007cc <LCD_SH1106_write_command>
 8000884:	2040      	movs	r0, #64	; 0x40
 8000886:	f7ff ffa1 	bl	80007cc <LCD_SH1106_write_command>
 800088a:	2300      	movs	r3, #0
 800088c:	9301      	str	r3, [sp, #4]
 800088e:	9b01      	ldr	r3, [sp, #4]
 8000890:	2b07      	cmp	r3, #7
 8000892:	d833      	bhi.n	80008fc <LCD_SH1106_flush_buffer+0x88>
 8000894:	9801      	ldr	r0, [sp, #4]
 8000896:	2400      	movs	r4, #0
 8000898:	3850      	subs	r0, #80	; 0x50
 800089a:	b2c0      	uxtb	r0, r0
 800089c:	f7ff ff96 	bl	80007cc <LCD_SH1106_write_command>
 80008a0:	2002      	movs	r0, #2
 80008a2:	f7ff ff93 	bl	80007cc <LCD_SH1106_write_command>
 80008a6:	2010      	movs	r0, #16
 80008a8:	f7ff ff90 	bl	80007cc <LCD_SH1106_write_command>
 80008ac:	9402      	str	r4, [sp, #8]
 80008ae:	9b02      	ldr	r3, [sp, #8]
 80008b0:	2b07      	cmp	r3, #7
 80008b2:	d820      	bhi.n	80008f6 <LCD_SH1106_flush_buffer+0x82>
 80008b4:	f000 fc48 	bl	8001148 <i2cStart>
 80008b8:	2078      	movs	r0, #120	; 0x78
 80008ba:	f000 fc61 	bl	8001180 <i2cWrite>
 80008be:	2040      	movs	r0, #64	; 0x40
 80008c0:	f000 fc5e 	bl	8001180 <i2cWrite>
 80008c4:	2300      	movs	r3, #0
 80008c6:	9303      	str	r3, [sp, #12]
 80008c8:	9b03      	ldr	r3, [sp, #12]
 80008ca:	2b0f      	cmp	r3, #15
 80008cc:	d80d      	bhi.n	80008ea <LCD_SH1106_flush_buffer+0x76>
 80008ce:	9b01      	ldr	r3, [sp, #4]
 80008d0:	1c65      	adds	r5, r4, #1
 80008d2:	01db      	lsls	r3, r3, #7
 80008d4:	191c      	adds	r4, r3, r4
 80008d6:	4b0c      	ldr	r3, [pc, #48]	; (8000908 <LCD_SH1106_flush_buffer+0x94>)
 80008d8:	5ce0      	ldrb	r0, [r4, r3]
 80008da:	1c2c      	adds	r4, r5, #0
 80008dc:	b2c0      	uxtb	r0, r0
 80008de:	f000 fc4f 	bl	8001180 <i2cWrite>
 80008e2:	9b03      	ldr	r3, [sp, #12]
 80008e4:	3301      	adds	r3, #1
 80008e6:	9303      	str	r3, [sp, #12]
 80008e8:	e7ee      	b.n	80008c8 <LCD_SH1106_flush_buffer+0x54>
 80008ea:	f000 fc3b 	bl	8001164 <i2cStop>
 80008ee:	9b02      	ldr	r3, [sp, #8]
 80008f0:	3301      	adds	r3, #1
 80008f2:	9302      	str	r3, [sp, #8]
 80008f4:	e7db      	b.n	80008ae <LCD_SH1106_flush_buffer+0x3a>
 80008f6:	9b01      	ldr	r3, [sp, #4]
 80008f8:	3301      	adds	r3, #1
 80008fa:	e7c7      	b.n	800088c <LCD_SH1106_flush_buffer+0x18>
 80008fc:	2000      	movs	r0, #0
 80008fe:	1c01      	adds	r1, r0, #0
 8000900:	f7ff ff6b 	bl	80007da <LCD_SH1106_set_cursor>
 8000904:	b005      	add	sp, #20
 8000906:	bd30      	pop	{r4, r5, pc}
 8000908:	2000048e 	.word	0x2000048e

0800090c <LCD_SH1106_flush_buffer_partial>:
 800090c:	b5f0      	push	{r4, r5, r6, r7, lr}
 800090e:	4c32      	ldr	r4, [pc, #200]	; (80009d8 <LCD_SH1106_flush_buffer_partial+0xcc>)
 8000910:	b085      	sub	sp, #20
 8000912:	8826      	ldrh	r6, [r4, #0]
 8000914:	1c25      	adds	r5, r4, #0
 8000916:	b2b6      	uxth	r6, r6
 8000918:	2e01      	cmp	r6, #1
 800091a:	d019      	beq.n	8000950 <LCD_SH1106_flush_buffer_partial+0x44>
 800091c:	2e00      	cmp	r6, #0
 800091e:	d009      	beq.n	8000934 <LCD_SH1106_flush_buffer_partial+0x28>
 8000920:	2500      	movs	r5, #0
 8000922:	2e02      	cmp	r6, #2
 8000924:	d154      	bne.n	80009d0 <LCD_SH1106_flush_buffer_partial+0xc4>
 8000926:	1c28      	adds	r0, r5, #0
 8000928:	1c29      	adds	r1, r5, #0
 800092a:	f7ff ff56 	bl	80007da <LCD_SH1106_set_cursor>
 800092e:	8025      	strh	r5, [r4, #0]
 8000930:	1c28      	adds	r0, r5, #0
 8000932:	e04f      	b.n	80009d4 <LCD_SH1106_flush_buffer_partial+0xc8>
 8000934:	1c30      	adds	r0, r6, #0
 8000936:	f7ff ff49 	bl	80007cc <LCD_SH1106_write_command>
 800093a:	2010      	movs	r0, #16
 800093c:	f7ff ff46 	bl	80007cc <LCD_SH1106_write_command>
 8000940:	2040      	movs	r0, #64	; 0x40
 8000942:	f7ff ff43 	bl	80007cc <LCD_SH1106_write_command>
 8000946:	4b25      	ldr	r3, [pc, #148]	; (80009dc <LCD_SH1106_flush_buffer_partial+0xd0>)
 8000948:	2001      	movs	r0, #1
 800094a:	801e      	strh	r6, [r3, #0]
 800094c:	8020      	strh	r0, [r4, #0]
 800094e:	e041      	b.n	80009d4 <LCD_SH1106_flush_buffer_partial+0xc8>
 8000950:	4c22      	ldr	r4, [pc, #136]	; (80009dc <LCD_SH1106_flush_buffer_partial+0xd0>)
 8000952:	2600      	movs	r6, #0
 8000954:	8823      	ldrh	r3, [r4, #0]
 8000956:	b29b      	uxth	r3, r3
 8000958:	9301      	str	r3, [sp, #4]
 800095a:	9801      	ldr	r0, [sp, #4]
 800095c:	3850      	subs	r0, #80	; 0x50
 800095e:	b2c0      	uxtb	r0, r0
 8000960:	f7ff ff34 	bl	80007cc <LCD_SH1106_write_command>
 8000964:	2002      	movs	r0, #2
 8000966:	f7ff ff31 	bl	80007cc <LCD_SH1106_write_command>
 800096a:	2010      	movs	r0, #16
 800096c:	f7ff ff2e 	bl	80007cc <LCD_SH1106_write_command>
 8000970:	9602      	str	r6, [sp, #8]
 8000972:	9b02      	ldr	r3, [sp, #8]
 8000974:	2b07      	cmp	r3, #7
 8000976:	d820      	bhi.n	80009ba <LCD_SH1106_flush_buffer_partial+0xae>
 8000978:	f000 fbe6 	bl	8001148 <i2cStart>
 800097c:	2078      	movs	r0, #120	; 0x78
 800097e:	f000 fbff 	bl	8001180 <i2cWrite>
 8000982:	2040      	movs	r0, #64	; 0x40
 8000984:	f000 fbfc 	bl	8001180 <i2cWrite>
 8000988:	2300      	movs	r3, #0
 800098a:	9303      	str	r3, [sp, #12]
 800098c:	9b03      	ldr	r3, [sp, #12]
 800098e:	2b0f      	cmp	r3, #15
 8000990:	d80d      	bhi.n	80009ae <LCD_SH1106_flush_buffer_partial+0xa2>
 8000992:	9b01      	ldr	r3, [sp, #4]
 8000994:	1c77      	adds	r7, r6, #1
 8000996:	01db      	lsls	r3, r3, #7
 8000998:	199e      	adds	r6, r3, r6
 800099a:	4b11      	ldr	r3, [pc, #68]	; (80009e0 <LCD_SH1106_flush_buffer_partial+0xd4>)
 800099c:	5cf0      	ldrb	r0, [r6, r3]
 800099e:	1c3e      	adds	r6, r7, #0
 80009a0:	b2c0      	uxtb	r0, r0
 80009a2:	f000 fbed 	bl	8001180 <i2cWrite>
 80009a6:	9b03      	ldr	r3, [sp, #12]
 80009a8:	3301      	adds	r3, #1
 80009aa:	9303      	str	r3, [sp, #12]
 80009ac:	e7ee      	b.n	800098c <LCD_SH1106_flush_buffer_partial+0x80>
 80009ae:	f000 fbd9 	bl	8001164 <i2cStop>
 80009b2:	9b02      	ldr	r3, [sp, #8]
 80009b4:	3301      	adds	r3, #1
 80009b6:	9302      	str	r3, [sp, #8]
 80009b8:	e7db      	b.n	8000972 <LCD_SH1106_flush_buffer_partial+0x66>
 80009ba:	8823      	ldrh	r3, [r4, #0]
 80009bc:	2001      	movs	r0, #1
 80009be:	3301      	adds	r3, #1
 80009c0:	b29b      	uxth	r3, r3
 80009c2:	8023      	strh	r3, [r4, #0]
 80009c4:	8823      	ldrh	r3, [r4, #0]
 80009c6:	2b07      	cmp	r3, #7
 80009c8:	d904      	bls.n	80009d4 <LCD_SH1106_flush_buffer_partial+0xc8>
 80009ca:	2302      	movs	r3, #2
 80009cc:	802b      	strh	r3, [r5, #0]
 80009ce:	e001      	b.n	80009d4 <LCD_SH1106_flush_buffer_partial+0xc8>
 80009d0:	8025      	strh	r5, [r4, #0]
 80009d2:	2001      	movs	r0, #1
 80009d4:	b005      	add	sp, #20
 80009d6:	bdf0      	pop	{r4, r5, r6, r7, pc}
 80009d8:	2000048c 	.word	0x2000048c
 80009dc:	2000088e 	.word	0x2000088e
 80009e0:	2000048e 	.word	0x2000048e

080009e4 <LCD_SH1106_init>:
 80009e4:	b508      	push	{r3, lr}
 80009e6:	20ae      	movs	r0, #174	; 0xae
 80009e8:	f7ff fef0 	bl	80007cc <LCD_SH1106_write_command>
 80009ec:	2002      	movs	r0, #2
 80009ee:	f7ff feed 	bl	80007cc <LCD_SH1106_write_command>
 80009f2:	2010      	movs	r0, #16
 80009f4:	f7ff feea 	bl	80007cc <LCD_SH1106_write_command>
 80009f8:	2040      	movs	r0, #64	; 0x40
 80009fa:	f7ff fee7 	bl	80007cc <LCD_SH1106_write_command>
 80009fe:	20b0      	movs	r0, #176	; 0xb0
 8000a00:	f7ff fee4 	bl	80007cc <LCD_SH1106_write_command>
 8000a04:	2081      	movs	r0, #129	; 0x81
 8000a06:	f7ff fee1 	bl	80007cc <LCD_SH1106_write_command>
 8000a0a:	2080      	movs	r0, #128	; 0x80
 8000a0c:	f7ff fede 	bl	80007cc <LCD_SH1106_write_command>
 8000a10:	20a1      	movs	r0, #161	; 0xa1
 8000a12:	f7ff fedb 	bl	80007cc <LCD_SH1106_write_command>
 8000a16:	20a6      	movs	r0, #166	; 0xa6
 8000a18:	f7ff fed8 	bl	80007cc <LCD_SH1106_write_command>
 8000a1c:	20a8      	movs	r0, #168	; 0xa8
 8000a1e:	f7ff fed5 	bl	80007cc <LCD_SH1106_write_command>
 8000a22:	203f      	movs	r0, #63	; 0x3f
 8000a24:	f7ff fed2 	bl	80007cc <LCD_SH1106_write_command>
 8000a28:	20ad      	movs	r0, #173	; 0xad
 8000a2a:	f7ff fecf 	bl	80007cc <LCD_SH1106_write_command>
 8000a2e:	208b      	movs	r0, #139	; 0x8b
 8000a30:	f7ff fecc 	bl	80007cc <LCD_SH1106_write_command>
 8000a34:	2030      	movs	r0, #48	; 0x30
 8000a36:	f7ff fec9 	bl	80007cc <LCD_SH1106_write_command>
 8000a3a:	20c8      	movs	r0, #200	; 0xc8
 8000a3c:	f7ff fec6 	bl	80007cc <LCD_SH1106_write_command>
 8000a40:	20d3      	movs	r0, #211	; 0xd3
 8000a42:	f7ff fec3 	bl	80007cc <LCD_SH1106_write_command>
 8000a46:	2000      	movs	r0, #0
 8000a48:	f7ff fec0 	bl	80007cc <LCD_SH1106_write_command>
 8000a4c:	20d5      	movs	r0, #213	; 0xd5
 8000a4e:	f7ff febd 	bl	80007cc <LCD_SH1106_write_command>
 8000a52:	2080      	movs	r0, #128	; 0x80
 8000a54:	f7ff feba 	bl	80007cc <LCD_SH1106_write_command>
 8000a58:	20d9      	movs	r0, #217	; 0xd9
 8000a5a:	f7ff feb7 	bl	80007cc <LCD_SH1106_write_command>
 8000a5e:	201f      	movs	r0, #31
 8000a60:	f7ff feb4 	bl	80007cc <LCD_SH1106_write_command>
 8000a64:	20da      	movs	r0, #218	; 0xda
 8000a66:	f7ff feb1 	bl	80007cc <LCD_SH1106_write_command>
 8000a6a:	2012      	movs	r0, #18
 8000a6c:	f7ff feae 	bl	80007cc <LCD_SH1106_write_command>
 8000a70:	20db      	movs	r0, #219	; 0xdb
 8000a72:	f7ff feab 	bl	80007cc <LCD_SH1106_write_command>
 8000a76:	2040      	movs	r0, #64	; 0x40
 8000a78:	f7ff fea8 	bl	80007cc <LCD_SH1106_write_command>
 8000a7c:	20af      	movs	r0, #175	; 0xaf
 8000a7e:	f7ff fea5 	bl	80007cc <LCD_SH1106_write_command>
 8000a82:	2000      	movs	r0, #0
 8000a84:	f7ff feda 	bl	800083c <LCD_SH1106_clear_buffer>
 8000a88:	f7ff fef4 	bl	8000874 <LCD_SH1106_flush_buffer>
 8000a8c:	4a02      	ldr	r2, [pc, #8]	; (8000a98 <LCD_SH1106_init+0xb4>)
 8000a8e:	2300      	movs	r3, #0
 8000a90:	8013      	strh	r3, [r2, #0]
 8000a92:	4a02      	ldr	r2, [pc, #8]	; (8000a9c <LCD_SH1106_init+0xb8>)
 8000a94:	8013      	strh	r3, [r2, #0]
 8000a96:	bd08      	pop	{r3, pc}
 8000a98:	2000048c 	.word	0x2000048c
 8000a9c:	2000088e 	.word	0x2000088e

08000aa0 <lcd_put_char_xy>:
 8000aa0:	b5f7      	push	{r0, r1, r2, r4, r5, r6, r7, lr}
 8000aa2:	2300      	movs	r3, #0
 8000aa4:	1c06      	adds	r6, r0, #0
 8000aa6:	1c0f      	adds	r7, r1, #0
 8000aa8:	2a1f      	cmp	r2, #31
 8000aaa:	d902      	bls.n	8000ab2 <lcd_put_char_xy+0x12>
 8000aac:	1c13      	adds	r3, r2, #0
 8000aae:	3b20      	subs	r3, #32
 8000ab0:	b2db      	uxtb	r3, r3
 8000ab2:	011b      	lsls	r3, r3, #4
 8000ab4:	9300      	str	r3, [sp, #0]
 8000ab6:	2500      	movs	r5, #0
 8000ab8:	2301      	movs	r3, #1
 8000aba:	40ab      	lsls	r3, r5
 8000abc:	b2db      	uxtb	r3, r3
 8000abe:	9301      	str	r3, [sp, #4]
 8000ac0:	2400      	movs	r4, #0
 8000ac2:	1c30      	adds	r0, r6, #0
 8000ac4:	3008      	adds	r0, #8
 8000ac6:	19e1      	adds	r1, r4, r7
 8000ac8:	1b40      	subs	r0, r0, r5
 8000aca:	2880      	cmp	r0, #128	; 0x80
 8000acc:	d900      	bls.n	8000ad0 <lcd_put_char_xy+0x30>
 8000ace:	2080      	movs	r0, #128	; 0x80
 8000ad0:	2940      	cmp	r1, #64	; 0x40
 8000ad2:	d900      	bls.n	8000ad6 <lcd_put_char_xy+0x36>
 8000ad4:	2140      	movs	r1, #64	; 0x40
 8000ad6:	9a00      	ldr	r2, [sp, #0]
 8000ad8:	4b06      	ldr	r3, [pc, #24]	; (8000af4 <lcd_put_char_xy+0x54>)
 8000ada:	189b      	adds	r3, r3, r2
 8000adc:	5d1a      	ldrb	r2, [r3, r4]
 8000ade:	9b01      	ldr	r3, [sp, #4]
 8000ae0:	3401      	adds	r4, #1
 8000ae2:	401a      	ands	r2, r3
 8000ae4:	f7ff fe8c 	bl	8000800 <LCD_SH1106_set_pixel>
 8000ae8:	2c10      	cmp	r4, #16
 8000aea:	d1ea      	bne.n	8000ac2 <lcd_put_char_xy+0x22>
 8000aec:	3501      	adds	r5, #1
 8000aee:	2d08      	cmp	r5, #8
 8000af0:	d1e2      	bne.n	8000ab8 <lcd_put_char_xy+0x18>
 8000af2:	bdf7      	pop	{r0, r1, r2, r4, r5, r6, r7, pc}
 8000af4:	080025a4 	.word	0x080025a4

08000af8 <mpu6050_read>:
 8000af8:	b538      	push	{r3, r4, r5, lr}
 8000afa:	213b      	movs	r1, #59	; 0x3b
 8000afc:	20d0      	movs	r0, #208	; 0xd0
 8000afe:	f000 fb9f 	bl	8001240 <i2c_read_reg>
 8000b02:	4c38      	ldr	r4, [pc, #224]	; (8000be4 <mpu6050_read+0xec>)
 8000b04:	0205      	lsls	r5, r0, #8
 8000b06:	b2ad      	uxth	r5, r5
 8000b08:	213c      	movs	r1, #60	; 0x3c
 8000b0a:	20d0      	movs	r0, #208	; 0xd0
 8000b0c:	8025      	strh	r5, [r4, #0]
 8000b0e:	f000 fb97 	bl	8001240 <i2c_read_reg>
 8000b12:	213d      	movs	r1, #61	; 0x3d
 8000b14:	4305      	orrs	r5, r0
 8000b16:	20d0      	movs	r0, #208	; 0xd0
 8000b18:	8025      	strh	r5, [r4, #0]
 8000b1a:	f000 fb91 	bl	8001240 <i2c_read_reg>
 8000b1e:	0205      	lsls	r5, r0, #8
 8000b20:	b2ad      	uxth	r5, r5
 8000b22:	213e      	movs	r1, #62	; 0x3e
 8000b24:	20d0      	movs	r0, #208	; 0xd0
 8000b26:	8065      	strh	r5, [r4, #2]
 8000b28:	f000 fb8a 	bl	8001240 <i2c_read_reg>
 8000b2c:	213f      	movs	r1, #63	; 0x3f
 8000b2e:	4305      	orrs	r5, r0
 8000b30:	20d0      	movs	r0, #208	; 0xd0
 8000b32:	8065      	strh	r5, [r4, #2]
 8000b34:	f000 fb84 	bl	8001240 <i2c_read_reg>
 8000b38:	0205      	lsls	r5, r0, #8
 8000b3a:	b2ad      	uxth	r5, r5
 8000b3c:	2140      	movs	r1, #64	; 0x40
 8000b3e:	20d0      	movs	r0, #208	; 0xd0
 8000b40:	80a5      	strh	r5, [r4, #4]
 8000b42:	f000 fb7d 	bl	8001240 <i2c_read_reg>
 8000b46:	2141      	movs	r1, #65	; 0x41
 8000b48:	4305      	orrs	r5, r0
 8000b4a:	20d0      	movs	r0, #208	; 0xd0
 8000b4c:	80a5      	strh	r5, [r4, #4]
 8000b4e:	f000 fb77 	bl	8001240 <i2c_read_reg>
 8000b52:	0205      	lsls	r5, r0, #8
 8000b54:	b2ad      	uxth	r5, r5
 8000b56:	2142      	movs	r1, #66	; 0x42
 8000b58:	20d0      	movs	r0, #208	; 0xd0
 8000b5a:	8425      	strh	r5, [r4, #32]
 8000b5c:	f000 fb70 	bl	8001240 <i2c_read_reg>
 8000b60:	2143      	movs	r1, #67	; 0x43
 8000b62:	4305      	orrs	r5, r0
 8000b64:	20d0      	movs	r0, #208	; 0xd0
 8000b66:	8425      	strh	r5, [r4, #32]
 8000b68:	f000 fb6a 	bl	8001240 <i2c_read_reg>
 8000b6c:	0205      	lsls	r5, r0, #8
 8000b6e:	b2ad      	uxth	r5, r5
 8000b70:	2144      	movs	r1, #68	; 0x44
 8000b72:	20d0      	movs	r0, #208	; 0xd0
 8000b74:	80e5      	strh	r5, [r4, #6]
 8000b76:	f000 fb63 	bl	8001240 <i2c_read_reg>
 8000b7a:	2145      	movs	r1, #69	; 0x45
 8000b7c:	4305      	orrs	r5, r0
 8000b7e:	20d0      	movs	r0, #208	; 0xd0
 8000b80:	80e5      	strh	r5, [r4, #6]
 8000b82:	f000 fb5d 	bl	8001240 <i2c_read_reg>
 8000b86:	0205      	lsls	r5, r0, #8
 8000b88:	b2ad      	uxth	r5, r5
 8000b8a:	2146      	movs	r1, #70	; 0x46
 8000b8c:	20d0      	movs	r0, #208	; 0xd0
 8000b8e:	8125      	strh	r5, [r4, #8]
 8000b90:	f000 fb56 	bl	8001240 <i2c_read_reg>
 8000b94:	2147      	movs	r1, #71	; 0x47
 8000b96:	4305      	orrs	r5, r0
 8000b98:	20d0      	movs	r0, #208	; 0xd0
 8000b9a:	8125      	strh	r5, [r4, #8]
 8000b9c:	f000 fb50 	bl	8001240 <i2c_read_reg>
 8000ba0:	0205      	lsls	r5, r0, #8
 8000ba2:	2148      	movs	r1, #72	; 0x48
 8000ba4:	b2ad      	uxth	r5, r5
 8000ba6:	20d0      	movs	r0, #208	; 0xd0
 8000ba8:	8165      	strh	r5, [r4, #10]
 8000baa:	f000 fb49 	bl	8001240 <i2c_read_reg>
 8000bae:	2106      	movs	r1, #6
 8000bb0:	5e62      	ldrsh	r2, [r4, r1]
 8000bb2:	210c      	movs	r1, #12
 8000bb4:	5e63      	ldrsh	r3, [r4, r1]
 8000bb6:	4305      	orrs	r5, r0
 8000bb8:	1ad3      	subs	r3, r2, r3
 8000bba:	6962      	ldr	r2, [r4, #20]
 8000bbc:	b2ad      	uxth	r5, r5
 8000bbe:	18d3      	adds	r3, r2, r3
 8000bc0:	6163      	str	r3, [r4, #20]
 8000bc2:	2308      	movs	r3, #8
 8000bc4:	5ee2      	ldrsh	r2, [r4, r3]
 8000bc6:	210e      	movs	r1, #14
 8000bc8:	5e63      	ldrsh	r3, [r4, r1]
 8000bca:	8165      	strh	r5, [r4, #10]
 8000bcc:	1ad3      	subs	r3, r2, r3
 8000bce:	69a2      	ldr	r2, [r4, #24]
 8000bd0:	b22d      	sxth	r5, r5
 8000bd2:	18d3      	adds	r3, r2, r3
 8000bd4:	61a3      	str	r3, [r4, #24]
 8000bd6:	2110      	movs	r1, #16
 8000bd8:	5e63      	ldrsh	r3, [r4, r1]
 8000bda:	69e2      	ldr	r2, [r4, #28]
 8000bdc:	1aed      	subs	r5, r5, r3
 8000bde:	1955      	adds	r5, r2, r5
 8000be0:	61e5      	str	r5, [r4, #28]
 8000be2:	bd38      	pop	{r3, r4, r5, pc}
 8000be4:	20000890 	.word	0x20000890

08000be8 <mpu6050_init>:
 8000be8:	b5f7      	push	{r0, r1, r2, r4, r5, r6, r7, lr}
 8000bea:	2600      	movs	r6, #0
 8000bec:	4c1a      	ldr	r4, [pc, #104]	; (8000c58 <mpu6050_init+0x70>)
 8000bee:	20d0      	movs	r0, #208	; 0xd0
 8000bf0:	216b      	movs	r1, #107	; 0x6b
 8000bf2:	1c32      	adds	r2, r6, #0
 8000bf4:	8026      	strh	r6, [r4, #0]
 8000bf6:	8066      	strh	r6, [r4, #2]
 8000bf8:	80a6      	strh	r6, [r4, #4]
 8000bfa:	80e6      	strh	r6, [r4, #6]
 8000bfc:	8126      	strh	r6, [r4, #8]
 8000bfe:	8166      	strh	r6, [r4, #10]
 8000c00:	2564      	movs	r5, #100	; 0x64
 8000c02:	f000 fb0b 	bl	800121c <i2c_write_reg>
 8000c06:	1c37      	adds	r7, r6, #0
 8000c08:	9601      	str	r6, [sp, #4]
 8000c0a:	f7ff ff75 	bl	8000af8 <mpu6050_read>
 8000c0e:	200a      	movs	r0, #10
 8000c10:	f000 fa08 	bl	8001024 <timer_delay_ms>
 8000c14:	2206      	movs	r2, #6
 8000c16:	5ea3      	ldrsh	r3, [r4, r2]
 8000c18:	3d01      	subs	r5, #1
 8000c1a:	18ff      	adds	r7, r7, r3
 8000c1c:	2208      	movs	r2, #8
 8000c1e:	5ea3      	ldrsh	r3, [r4, r2]
 8000c20:	9a01      	ldr	r2, [sp, #4]
 8000c22:	18d2      	adds	r2, r2, r3
 8000c24:	9201      	str	r2, [sp, #4]
 8000c26:	220a      	movs	r2, #10
 8000c28:	5ea3      	ldrsh	r3, [r4, r2]
 8000c2a:	18f6      	adds	r6, r6, r3
 8000c2c:	2d00      	cmp	r5, #0
 8000c2e:	d1ec      	bne.n	8000c0a <mpu6050_init+0x22>
 8000c30:	1c38      	adds	r0, r7, #0
 8000c32:	2164      	movs	r1, #100	; 0x64
 8000c34:	f001 fc18 	bl	8002468 <__aeabi_idiv>
 8000c38:	2164      	movs	r1, #100	; 0x64
 8000c3a:	81a0      	strh	r0, [r4, #12]
 8000c3c:	9801      	ldr	r0, [sp, #4]
 8000c3e:	f001 fc13 	bl	8002468 <__aeabi_idiv>
 8000c42:	2164      	movs	r1, #100	; 0x64
 8000c44:	81e0      	strh	r0, [r4, #14]
 8000c46:	1c30      	adds	r0, r6, #0
 8000c48:	f001 fc0e 	bl	8002468 <__aeabi_idiv>
 8000c4c:	6165      	str	r5, [r4, #20]
 8000c4e:	61a5      	str	r5, [r4, #24]
 8000c50:	61e5      	str	r5, [r4, #28]
 8000c52:	8220      	strh	r0, [r4, #16]
 8000c54:	bdf7      	pop	{r0, r1, r2, r4, r5, r6, r7, pc}
 8000c56:	46c0      	nop			; (mov r8, r8)
 8000c58:	20000890 	.word	0x20000890

08000c5c <m_srand>:
 8000c5c:	4b03      	ldr	r3, [pc, #12]	; (8000c6c <m_srand+0x10>)
 8000c5e:	3001      	adds	r0, #1
 8000c60:	6018      	str	r0, [r3, #0]
 8000c62:	4b03      	ldr	r3, [pc, #12]	; (8000c70 <m_srand+0x14>)
 8000c64:	227b      	movs	r2, #123	; 0x7b
 8000c66:	601a      	str	r2, [r3, #0]
 8000c68:	4770      	bx	lr
 8000c6a:	46c0      	nop			; (mov r8, r8)
 8000c6c:	20000004 	.word	0x20000004
 8000c70:	20000000 	.word	0x20000000

08000c74 <terminal_thread>:
 8000c74:	b538      	push	{r3, r4, r5, lr}
 8000c76:	2008      	movs	r0, #8
 8000c78:	f001 fb76 	bl	8002368 <led_on>
 8000c7c:	f000 f9c6 	bl	800100c <timer_get_time>
 8000c80:	1c01      	adds	r1, r0, #0
 8000c82:	4819      	ldr	r0, [pc, #100]	; (8000ce8 <terminal_thread+0x74>)
 8000c84:	f7ff fbe0 	bl	8000448 <printf_>
 8000c88:	4c18      	ldr	r4, [pc, #96]	; (8000cec <terminal_thread+0x78>)
 8000c8a:	4d19      	ldr	r5, [pc, #100]	; (8000cf0 <terminal_thread+0x7c>)
 8000c8c:	2302      	movs	r3, #2
 8000c8e:	5ee2      	ldrsh	r2, [r4, r3]
 8000c90:	2000      	movs	r0, #0
 8000c92:	5e21      	ldrsh	r1, [r4, r0]
 8000c94:	2004      	movs	r0, #4
 8000c96:	5e23      	ldrsh	r3, [r4, r0]
 8000c98:	1c28      	adds	r0, r5, #0
 8000c9a:	f7ff fbd5 	bl	8000448 <printf_>
 8000c9e:	2206      	movs	r2, #6
 8000ca0:	5ea1      	ldrsh	r1, [r4, r2]
 8000ca2:	2308      	movs	r3, #8
 8000ca4:	5ee2      	ldrsh	r2, [r4, r3]
 8000ca6:	200a      	movs	r0, #10
 8000ca8:	5e23      	ldrsh	r3, [r4, r0]
 8000caa:	1c28      	adds	r0, r5, #0
 8000cac:	f7ff fbcc 	bl	8000448 <printf_>
 8000cb0:	4b10      	ldr	r3, [pc, #64]	; (8000cf4 <terminal_thread+0x80>)
 8000cb2:	2200      	movs	r2, #0
 8000cb4:	5e99      	ldrsh	r1, [r3, r2]
 8000cb6:	2002      	movs	r0, #2
 8000cb8:	5e1a      	ldrsh	r2, [r3, r0]
 8000cba:	2004      	movs	r0, #4
 8000cbc:	5e1b      	ldrsh	r3, [r3, r0]
 8000cbe:	1c28      	adds	r0, r5, #0
 8000cc0:	f7ff fbc2 	bl	8000448 <printf_>
 8000cc4:	4b0c      	ldr	r3, [pc, #48]	; (8000cf8 <terminal_thread+0x84>)
 8000cc6:	1c28      	adds	r0, r5, #0
 8000cc8:	8819      	ldrh	r1, [r3, #0]
 8000cca:	885a      	ldrh	r2, [r3, #2]
 8000ccc:	889b      	ldrh	r3, [r3, #4]
 8000cce:	f7ff fbbb 	bl	8000448 <printf_>
 8000cd2:	480a      	ldr	r0, [pc, #40]	; (8000cfc <terminal_thread+0x88>)
 8000cd4:	f7ff fbb8 	bl	8000448 <printf_>
 8000cd8:	2008      	movs	r0, #8
 8000cda:	f001 fb59 	bl	8002390 <led_off>
 8000cde:	20fa      	movs	r0, #250	; 0xfa
 8000ce0:	0080      	lsls	r0, r0, #2
 8000ce2:	f000 f99f 	bl	8001024 <timer_delay_ms>
 8000ce6:	e7c6      	b.n	8000c76 <terminal_thread+0x2>
 8000ce8:	08002ba4 	.word	0x08002ba4
 8000cec:	20000890 	.word	0x20000890
 8000cf0:	08002bab 	.word	0x08002bab
 8000cf4:	2000047c 	.word	0x2000047c
 8000cf8:	20000482 	.word	0x20000482
 8000cfc:	080025a2 	.word	0x080025a2

08000d00 <adc_thread>:
 8000d00:	b538      	push	{r3, r4, r5, lr}
 8000d02:	2002      	movs	r0, #2
 8000d04:	f000 fb90 	bl	8001428 <adc_config_ch>
 8000d08:	f000 f980 	bl	800100c <timer_get_time>
 8000d0c:	4c0c      	ldr	r4, [pc, #48]	; (8000d40 <adc_thread+0x40>)
 8000d0e:	1c05      	adds	r5, r0, #0
 8000d10:	3c01      	subs	r4, #1
 8000d12:	f000 fb77 	bl	8001404 <adc_read>
 8000d16:	2c00      	cmp	r4, #0
 8000d18:	d1fa      	bne.n	8000d10 <adc_thread+0x10>
 8000d1a:	f000 f977 	bl	800100c <timer_get_time>
 8000d1e:	1c04      	adds	r4, r0, #0
 8000d20:	2001      	movs	r0, #1
 8000d22:	f000 fb81 	bl	8001428 <adc_config_ch>
 8000d26:	f000 fb6d 	bl	8001404 <adc_read>
 8000d2a:	4b06      	ldr	r3, [pc, #24]	; (8000d44 <adc_thread+0x44>)
 8000d2c:	1c01      	adds	r1, r0, #0
 8000d2e:	6018      	str	r0, [r3, #0]
 8000d30:	1b62      	subs	r2, r4, r5
 8000d32:	4805      	ldr	r0, [pc, #20]	; (8000d48 <adc_thread+0x48>)
 8000d34:	f7ff fb88 	bl	8000448 <printf_>
 8000d38:	2032      	movs	r0, #50	; 0x32
 8000d3a:	f000 f973 	bl	8001024 <timer_delay_ms>
 8000d3e:	e7e0      	b.n	8000d02 <adc_thread+0x2>
 8000d40:	00002710 	.word	0x00002710
 8000d44:	20000018 	.word	0x20000018
 8000d48:	08002bb7 	.word	0x08002bb7

08000d4c <lcd_put_int>:
 8000d4c:	b5f0      	push	{r4, r5, r6, r7, lr}
 8000d4e:	2300      	movs	r3, #0
 8000d50:	b087      	sub	sp, #28
 8000d52:	1c04      	adds	r4, r0, #0
 8000d54:	9100      	str	r1, [sp, #0]
 8000d56:	9201      	str	r2, [sp, #4]
 8000d58:	1c1f      	adds	r7, r3, #0
 8000d5a:	4298      	cmp	r0, r3
 8000d5c:	da01      	bge.n	8000d62 <lcd_put_int+0x16>
 8000d5e:	4244      	negs	r4, r0
 8000d60:	2701      	movs	r7, #1
 8000d62:	ae03      	add	r6, sp, #12
 8000d64:	72f3      	strb	r3, [r6, #11]
 8000d66:	250a      	movs	r5, #10
 8000d68:	1c20      	adds	r0, r4, #0
 8000d6a:	210a      	movs	r1, #10
 8000d6c:	f001 fbd2 	bl	8002514 <__aeabi_idivmod>
 8000d70:	3130      	adds	r1, #48	; 0x30
 8000d72:	5571      	strb	r1, [r6, r5]
 8000d74:	1c20      	adds	r0, r4, #0
 8000d76:	210a      	movs	r1, #10
 8000d78:	f001 fb76 	bl	8002468 <__aeabi_idiv>
 8000d7c:	1e6b      	subs	r3, r5, #1
 8000d7e:	1e04      	subs	r4, r0, #0
 8000d80:	d001      	beq.n	8000d86 <lcd_put_int+0x3a>
 8000d82:	1c1d      	adds	r5, r3, #0
 8000d84:	e7f0      	b.n	8000d68 <lcd_put_int+0x1c>
 8000d86:	2f00      	cmp	r7, #0
 8000d88:	d002      	beq.n	8000d90 <lcd_put_int+0x44>
 8000d8a:	222d      	movs	r2, #45	; 0x2d
 8000d8c:	54f2      	strb	r2, [r6, r3]
 8000d8e:	1c1d      	adds	r5, r3, #0
 8000d90:	2400      	movs	r4, #0
 8000d92:	1973      	adds	r3, r6, r5
 8000d94:	5d1f      	ldrb	r7, [r3, r4]
 8000d96:	9b00      	ldr	r3, [sp, #0]
 8000d98:	00e0      	lsls	r0, r4, #3
 8000d9a:	18c0      	adds	r0, r0, r3
 8000d9c:	9901      	ldr	r1, [sp, #4]
 8000d9e:	1c3a      	adds	r2, r7, #0
 8000da0:	f7ff fe7e 	bl	8000aa0 <lcd_put_char_xy>
 8000da4:	2f00      	cmp	r7, #0
 8000da6:	d002      	beq.n	8000dae <lcd_put_int+0x62>
 8000da8:	3401      	adds	r4, #1
 8000daa:	2c0c      	cmp	r4, #12
 8000dac:	d1f1      	bne.n	8000d92 <lcd_put_int+0x46>
 8000dae:	b007      	add	sp, #28
 8000db0:	bdf0      	pop	{r4, r5, r6, r7, pc}
	...

08000db4 <main_thread>:
 8000db4:	b538      	push	{r3, r4, r5, lr}
 8000db6:	2008      	movs	r0, #8
 8000db8:	f001 fad6 	bl	8002368 <led_on>
 8000dbc:	4833      	ldr	r0, [pc, #204]	; (8000e8c <main_thread+0xd8>)
 8000dbe:	f7ff fb43 	bl	8000448 <printf_>
 8000dc2:	f7ff fc33 	bl	800062c <hmc5883_init>
 8000dc6:	f7ff ff0f 	bl	8000be8 <mpu6050_init>
 8000dca:	f7ff fcd7 	bl	800077c <apds950_init>
 8000dce:	f000 fb37 	bl	8001440 <adc_random>
 8000dd2:	f7ff ff43 	bl	8000c5c <m_srand>
 8000dd6:	f7ff fe05 	bl	80009e4 <LCD_SH1106_init>
 8000dda:	2000      	movs	r0, #0
 8000ddc:	f7ff fd2e 	bl	800083c <LCD_SH1106_clear_buffer>
 8000de0:	2280      	movs	r2, #128	; 0x80
 8000de2:	492b      	ldr	r1, [pc, #172]	; (8000e90 <main_thread+0xdc>)
 8000de4:	0052      	lsls	r2, r2, #1
 8000de6:	2308      	movs	r3, #8
 8000de8:	482a      	ldr	r0, [pc, #168]	; (8000e94 <main_thread+0xe0>)
 8000dea:	f7ff f9f9 	bl	80001e0 <create_thread>
 8000dee:	2280      	movs	r2, #128	; 0x80
 8000df0:	4929      	ldr	r1, [pc, #164]	; (8000e98 <main_thread+0xe4>)
 8000df2:	482a      	ldr	r0, [pc, #168]	; (8000e9c <main_thread+0xe8>)
 8000df4:	0052      	lsls	r2, r2, #1
 8000df6:	2308      	movs	r3, #8
 8000df8:	f7ff f9f2 	bl	80001e0 <create_thread>
 8000dfc:	2000      	movs	r0, #0
 8000dfe:	2132      	movs	r1, #50	; 0x32
 8000e00:	f000 f920 	bl	8001044 <event_timer_set_period>
 8000e04:	2000      	movs	r0, #0
 8000e06:	f000 f92f 	bl	8001068 <event_timer_get_flag>
 8000e0a:	2800      	cmp	r0, #0
 8000e0c:	d008      	beq.n	8000e20 <main_thread+0x6c>
 8000e0e:	2000      	movs	r0, #0
 8000e10:	f000 f938 	bl	8001084 <event_timer_clear_flag>
 8000e14:	f7ff fc3a 	bl	800068c <hmc5883_read>
 8000e18:	f7ff fe6e 	bl	8000af8 <mpu6050_read>
 8000e1c:	f7ff fc62 	bl	80006e4 <apds9950_read>
 8000e20:	f7ff fd74 	bl	800090c <LCD_SH1106_flush_buffer_partial>
 8000e24:	1e04      	subs	r4, r0, #0
 8000e26:	d1ed      	bne.n	8000e04 <main_thread+0x50>
 8000e28:	f7ff fd08 	bl	800083c <LCD_SH1106_clear_buffer>
 8000e2c:	4d1c      	ldr	r5, [pc, #112]	; (8000ea0 <main_thread+0xec>)
 8000e2e:	1c21      	adds	r1, r4, #0
 8000e30:	6968      	ldr	r0, [r5, #20]
 8000e32:	1c22      	adds	r2, r4, #0
 8000e34:	f7ff ff8a 	bl	8000d4c <lcd_put_int>
 8000e38:	69a8      	ldr	r0, [r5, #24]
 8000e3a:	1c21      	adds	r1, r4, #0
 8000e3c:	2210      	movs	r2, #16
 8000e3e:	f7ff ff85 	bl	8000d4c <lcd_put_int>
 8000e42:	69e8      	ldr	r0, [r5, #28]
 8000e44:	1c21      	adds	r1, r4, #0
 8000e46:	2220      	movs	r2, #32
 8000e48:	f7ff ff80 	bl	8000d4c <lcd_put_int>
 8000e4c:	4d15      	ldr	r5, [pc, #84]	; (8000ea4 <main_thread+0xf0>)
 8000e4e:	1c22      	adds	r2, r4, #0
 8000e50:	2300      	movs	r3, #0
 8000e52:	5ee8      	ldrsh	r0, [r5, r3]
 8000e54:	2140      	movs	r1, #64	; 0x40
 8000e56:	f7ff ff79 	bl	8000d4c <lcd_put_int>
 8000e5a:	2302      	movs	r3, #2
 8000e5c:	5ee8      	ldrsh	r0, [r5, r3]
 8000e5e:	2140      	movs	r1, #64	; 0x40
 8000e60:	2210      	movs	r2, #16
 8000e62:	f7ff ff73 	bl	8000d4c <lcd_put_int>
 8000e66:	2304      	movs	r3, #4
 8000e68:	5ee8      	ldrsh	r0, [r5, r3]
 8000e6a:	2140      	movs	r1, #64	; 0x40
 8000e6c:	2220      	movs	r2, #32
 8000e6e:	f7ff ff6d 	bl	8000d4c <lcd_put_int>
 8000e72:	4b0d      	ldr	r3, [pc, #52]	; (8000ea8 <main_thread+0xf4>)
 8000e74:	1c21      	adds	r1, r4, #0
 8000e76:	88d8      	ldrh	r0, [r3, #6]
 8000e78:	2230      	movs	r2, #48	; 0x30
 8000e7a:	f7ff ff67 	bl	8000d4c <lcd_put_int>
 8000e7e:	4b0b      	ldr	r3, [pc, #44]	; (8000eac <main_thread+0xf8>)
 8000e80:	2140      	movs	r1, #64	; 0x40
 8000e82:	6818      	ldr	r0, [r3, #0]
 8000e84:	2230      	movs	r2, #48	; 0x30
 8000e86:	f7ff ff61 	bl	8000d4c <lcd_put_int>
 8000e8a:	e7bb      	b.n	8000e04 <main_thread+0x50>
 8000e8c:	08002bcb 	.word	0x08002bcb
 8000e90:	2000037c 	.word	0x2000037c
 8000e94:	08000c75 	.word	0x08000c75
 8000e98:	2000017c 	.word	0x2000017c
 8000e9c:	08000d01 	.word	0x08000d01
 8000ea0:	20000890 	.word	0x20000890
 8000ea4:	2000047c 	.word	0x2000047c
 8000ea8:	20000482 	.word	0x20000482
 8000eac:	20000018 	.word	0x20000018

08000eb0 <TIM16_IRQHandler>:
 8000eb0:	4b20      	ldr	r3, [pc, #128]	; (8000f34 <TIM16_IRQHandler+0x84>)
 8000eb2:	799a      	ldrb	r2, [r3, #6]
 8000eb4:	78d9      	ldrb	r1, [r3, #3]
 8000eb6:	4291      	cmp	r1, r2
 8000eb8:	d805      	bhi.n	8000ec6 <TIM16_IRQHandler+0x16>
 8000eba:	2080      	movs	r0, #128	; 0x80
 8000ebc:	2190      	movs	r1, #144	; 0x90
 8000ebe:	0040      	lsls	r0, r0, #1
 8000ec0:	05c9      	lsls	r1, r1, #23
 8000ec2:	8508      	strh	r0, [r1, #40]	; 0x28
 8000ec4:	e006      	b.n	8000ed4 <TIM16_IRQHandler+0x24>
 8000ec6:	2a00      	cmp	r2, #0
 8000ec8:	d104      	bne.n	8000ed4 <TIM16_IRQHandler+0x24>
 8000eca:	2080      	movs	r0, #128	; 0x80
 8000ecc:	2190      	movs	r1, #144	; 0x90
 8000ece:	0040      	lsls	r0, r0, #1
 8000ed0:	05c9      	lsls	r1, r1, #23
 8000ed2:	6188      	str	r0, [r1, #24]
 8000ed4:	7919      	ldrb	r1, [r3, #4]
 8000ed6:	4291      	cmp	r1, r2
 8000ed8:	d805      	bhi.n	8000ee6 <TIM16_IRQHandler+0x36>
 8000eda:	2080      	movs	r0, #128	; 0x80
 8000edc:	2190      	movs	r1, #144	; 0x90
 8000ede:	0100      	lsls	r0, r0, #4
 8000ee0:	05c9      	lsls	r1, r1, #23
 8000ee2:	8508      	strh	r0, [r1, #40]	; 0x28
 8000ee4:	e006      	b.n	8000ef4 <TIM16_IRQHandler+0x44>
 8000ee6:	2a00      	cmp	r2, #0
 8000ee8:	d104      	bne.n	8000ef4 <TIM16_IRQHandler+0x44>
 8000eea:	2080      	movs	r0, #128	; 0x80
 8000eec:	2190      	movs	r1, #144	; 0x90
 8000eee:	0100      	lsls	r0, r0, #4
 8000ef0:	05c9      	lsls	r1, r1, #23
 8000ef2:	6188      	str	r0, [r1, #24]
 8000ef4:	7959      	ldrb	r1, [r3, #5]
 8000ef6:	4291      	cmp	r1, r2
 8000ef8:	d806      	bhi.n	8000f08 <TIM16_IRQHandler+0x58>
 8000efa:	2190      	movs	r1, #144	; 0x90
 8000efc:	2002      	movs	r0, #2
 8000efe:	05c9      	lsls	r1, r1, #23
 8000f00:	8508      	strh	r0, [r1, #40]	; 0x28
 8000f02:	2a00      	cmp	r2, #0
 8000f04:	d006      	beq.n	8000f14 <TIM16_IRQHandler+0x64>
 8000f06:	e00b      	b.n	8000f20 <TIM16_IRQHandler+0x70>
 8000f08:	2a00      	cmp	r2, #0
 8000f0a:	d109      	bne.n	8000f20 <TIM16_IRQHandler+0x70>
 8000f0c:	2190      	movs	r1, #144	; 0x90
 8000f0e:	2002      	movs	r0, #2
 8000f10:	05c9      	lsls	r1, r1, #23
 8000f12:	6188      	str	r0, [r1, #24]
 8000f14:	7819      	ldrb	r1, [r3, #0]
 8000f16:	70d9      	strb	r1, [r3, #3]
 8000f18:	7859      	ldrb	r1, [r3, #1]
 8000f1a:	7119      	strb	r1, [r3, #4]
 8000f1c:	7899      	ldrb	r1, [r3, #2]
 8000f1e:	7159      	strb	r1, [r3, #5]
 8000f20:	3201      	adds	r2, #1
 8000f22:	b2d2      	uxtb	r2, r2
 8000f24:	2a10      	cmp	r2, #16
 8000f26:	d900      	bls.n	8000f2a <TIM16_IRQHandler+0x7a>
 8000f28:	2200      	movs	r2, #0
 8000f2a:	719a      	strb	r2, [r3, #6]
 8000f2c:	4b02      	ldr	r3, [pc, #8]	; (8000f38 <TIM16_IRQHandler+0x88>)
 8000f2e:	2200      	movs	r2, #0
 8000f30:	821a      	strh	r2, [r3, #16]
 8000f32:	4770      	bx	lr
 8000f34:	20000080 	.word	0x20000080
 8000f38:	40014400 	.word	0x40014400

08000f3c <timer_init>:
 8000f3c:	b530      	push	{r4, r5, lr}
 8000f3e:	2300      	movs	r3, #0
 8000f40:	b085      	sub	sp, #20
 8000f42:	481b      	ldr	r0, [pc, #108]	; (8000fb0 <timer_init+0x74>)
 8000f44:	2180      	movs	r1, #128	; 0x80
 8000f46:	005a      	lsls	r2, r3, #1
 8000f48:	00c9      	lsls	r1, r1, #3
 8000f4a:	5211      	strh	r1, [r2, r0]
 8000f4c:	4819      	ldr	r0, [pc, #100]	; (8000fb4 <timer_init+0x78>)
 8000f4e:	2400      	movs	r4, #0
 8000f50:	5211      	strh	r1, [r2, r0]
 8000f52:	4919      	ldr	r1, [pc, #100]	; (8000fb8 <timer_init+0x7c>)
 8000f54:	3301      	adds	r3, #1
 8000f56:	5254      	strh	r4, [r2, r1]
 8000f58:	2b04      	cmp	r3, #4
 8000f5a:	d1f2      	bne.n	8000f42 <timer_init+0x6>
 8000f5c:	4b17      	ldr	r3, [pc, #92]	; (8000fbc <timer_init+0x80>)
 8000f5e:	2001      	movs	r0, #1
 8000f60:	1c01      	adds	r1, r0, #0
 8000f62:	601c      	str	r4, [r3, #0]
 8000f64:	f000 fc4e 	bl	8001804 <RCC_APB1PeriphClockCmd>
 8000f68:	a901      	add	r1, sp, #4
 8000f6a:	2330      	movs	r3, #48	; 0x30
 8000f6c:	800b      	strh	r3, [r1, #0]
 8000f6e:	2080      	movs	r0, #128	; 0x80
 8000f70:	23fa      	movs	r3, #250	; 0xfa
 8000f72:	009b      	lsls	r3, r3, #2
 8000f74:	05c0      	lsls	r0, r0, #23
 8000f76:	604b      	str	r3, [r1, #4]
 8000f78:	804c      	strh	r4, [r1, #2]
 8000f7a:	810c      	strh	r4, [r1, #8]
 8000f7c:	728c      	strb	r4, [r1, #10]
 8000f7e:	f001 f881 	bl	8002084 <TIM_TimeBaseInit>
 8000f82:	2080      	movs	r0, #128	; 0x80
 8000f84:	05c0      	lsls	r0, r0, #23
 8000f86:	2101      	movs	r1, #1
 8000f88:	f001 f8fe 	bl	8002188 <TIM_Cmd>
 8000f8c:	2080      	movs	r0, #128	; 0x80
 8000f8e:	2102      	movs	r1, #2
 8000f90:	05c0      	lsls	r0, r0, #23
 8000f92:	2201      	movs	r2, #1
 8000f94:	f001 f93c 	bl	8002210 <TIM_ITConfig>
 8000f98:	466a      	mov	r2, sp
 8000f9a:	230f      	movs	r3, #15
 8000f9c:	7013      	strb	r3, [r2, #0]
 8000f9e:	4668      	mov	r0, sp
 8000fa0:	2301      	movs	r3, #1
 8000fa2:	7053      	strb	r3, [r2, #1]
 8000fa4:	7093      	strb	r3, [r2, #2]
 8000fa6:	f000 fca3 	bl	80018f0 <NVIC_Init>
 8000faa:	b005      	add	sp, #20
 8000fac:	bd30      	pop	{r4, r5, pc}
 8000fae:	46c0      	nop			; (mov r8, r8)
 8000fb0:	200008c8 	.word	0x200008c8
 8000fb4:	200008bc 	.word	0x200008bc
 8000fb8:	200008b4 	.word	0x200008b4
 8000fbc:	200008c4 	.word	0x200008c4

08000fc0 <TIM2_IRQHandler>:
 8000fc0:	2200      	movs	r2, #0
 8000fc2:	490e      	ldr	r1, [pc, #56]	; (8000ffc <TIM2_IRQHandler+0x3c>)
 8000fc4:	0053      	lsls	r3, r2, #1
 8000fc6:	5a58      	ldrh	r0, [r3, r1]
 8000fc8:	2800      	cmp	r0, #0
 8000fca:	d003      	beq.n	8000fd4 <TIM2_IRQHandler+0x14>
 8000fcc:	5a58      	ldrh	r0, [r3, r1]
 8000fce:	3801      	subs	r0, #1
 8000fd0:	b280      	uxth	r0, r0
 8000fd2:	e005      	b.n	8000fe0 <TIM2_IRQHandler+0x20>
 8000fd4:	480a      	ldr	r0, [pc, #40]	; (8001000 <TIM2_IRQHandler+0x40>)
 8000fd6:	5a18      	ldrh	r0, [r3, r0]
 8000fd8:	b280      	uxth	r0, r0
 8000fda:	5258      	strh	r0, [r3, r1]
 8000fdc:	4909      	ldr	r1, [pc, #36]	; (8001004 <TIM2_IRQHandler+0x44>)
 8000fde:	2001      	movs	r0, #1
 8000fe0:	3201      	adds	r2, #1
 8000fe2:	5258      	strh	r0, [r3, r1]
 8000fe4:	2a04      	cmp	r2, #4
 8000fe6:	d1ec      	bne.n	8000fc2 <TIM2_IRQHandler+0x2>
 8000fe8:	4b07      	ldr	r3, [pc, #28]	; (8001008 <TIM2_IRQHandler+0x48>)
 8000fea:	681a      	ldr	r2, [r3, #0]
 8000fec:	3201      	adds	r2, #1
 8000fee:	601a      	str	r2, [r3, #0]
 8000ff0:	2380      	movs	r3, #128	; 0x80
 8000ff2:	2200      	movs	r2, #0
 8000ff4:	05db      	lsls	r3, r3, #23
 8000ff6:	821a      	strh	r2, [r3, #16]
 8000ff8:	4770      	bx	lr
 8000ffa:	46c0      	nop			; (mov r8, r8)
 8000ffc:	200008c8 	.word	0x200008c8
 8001000:	200008bc 	.word	0x200008bc
 8001004:	200008b4 	.word	0x200008b4
 8001008:	200008c4 	.word	0x200008c4

0800100c <timer_get_time>:
 800100c:	b082      	sub	sp, #8
 800100e:	b672      	cpsid	i
 8001010:	4b03      	ldr	r3, [pc, #12]	; (8001020 <timer_get_time+0x14>)
 8001012:	681b      	ldr	r3, [r3, #0]
 8001014:	9301      	str	r3, [sp, #4]
 8001016:	b662      	cpsie	i
 8001018:	9801      	ldr	r0, [sp, #4]
 800101a:	b002      	add	sp, #8
 800101c:	4770      	bx	lr
 800101e:	46c0      	nop			; (mov r8, r8)
 8001020:	200008c4 	.word	0x200008c4

08001024 <timer_delay_ms>:
 8001024:	b513      	push	{r0, r1, r4, lr}
 8001026:	1c04      	adds	r4, r0, #0
 8001028:	f7ff fff0 	bl	800100c <timer_get_time>
 800102c:	1904      	adds	r4, r0, r4
 800102e:	9401      	str	r4, [sp, #4]
 8001030:	9c01      	ldr	r4, [sp, #4]
 8001032:	f7ff ffeb 	bl	800100c <timer_get_time>
 8001036:	4284      	cmp	r4, r0
 8001038:	d902      	bls.n	8001040 <timer_delay_ms+0x1c>
 800103a:	f000 fa15 	bl	8001468 <sleep>
 800103e:	e7f7      	b.n	8001030 <timer_delay_ms+0xc>
 8001040:	bd13      	pop	{r0, r1, r4, pc}
	...

08001044 <event_timer_set_period>:
 8001044:	b672      	cpsid	i
 8001046:	4b05      	ldr	r3, [pc, #20]	; (800105c <event_timer_set_period+0x18>)
 8001048:	0040      	lsls	r0, r0, #1
 800104a:	52c1      	strh	r1, [r0, r3]
 800104c:	4b04      	ldr	r3, [pc, #16]	; (8001060 <event_timer_set_period+0x1c>)
 800104e:	2200      	movs	r2, #0
 8001050:	52c1      	strh	r1, [r0, r3]
 8001052:	4b04      	ldr	r3, [pc, #16]	; (8001064 <event_timer_set_period+0x20>)
 8001054:	52c2      	strh	r2, [r0, r3]
 8001056:	b662      	cpsie	i
 8001058:	4770      	bx	lr
 800105a:	46c0      	nop			; (mov r8, r8)
 800105c:	200008c8 	.word	0x200008c8
 8001060:	200008bc 	.word	0x200008bc
 8001064:	200008b4 	.word	0x200008b4

08001068 <event_timer_get_flag>:
 8001068:	b082      	sub	sp, #8
 800106a:	b672      	cpsid	i
 800106c:	4b04      	ldr	r3, [pc, #16]	; (8001080 <event_timer_get_flag+0x18>)
 800106e:	0040      	lsls	r0, r0, #1
 8001070:	5ac3      	ldrh	r3, [r0, r3]
 8001072:	b29b      	uxth	r3, r3
 8001074:	9301      	str	r3, [sp, #4]
 8001076:	b662      	cpsie	i
 8001078:	9801      	ldr	r0, [sp, #4]
 800107a:	b002      	add	sp, #8
 800107c:	4770      	bx	lr
 800107e:	46c0      	nop			; (mov r8, r8)
 8001080:	200008b4 	.word	0x200008b4

08001084 <event_timer_clear_flag>:
 8001084:	b672      	cpsid	i
 8001086:	4b03      	ldr	r3, [pc, #12]	; (8001094 <event_timer_clear_flag+0x10>)
 8001088:	0040      	lsls	r0, r0, #1
 800108a:	2200      	movs	r2, #0
 800108c:	52c2      	strh	r2, [r0, r3]
 800108e:	b662      	cpsie	i
 8001090:	4770      	bx	lr
 8001092:	46c0      	nop			; (mov r8, r8)
 8001094:	200008b4 	.word	0x200008b4

08001098 <i2c_delay>:
 8001098:	46c0      	nop			; (mov r8, r8)
 800109a:	4770      	bx	lr

0800109c <SetLowSDA>:
 800109c:	b508      	push	{r3, lr}
 800109e:	b672      	cpsid	i
 80010a0:	4b07      	ldr	r3, [pc, #28]	; (80010c0 <SetLowSDA+0x24>)
 80010a2:	2210      	movs	r2, #16
 80010a4:	851a      	strh	r2, [r3, #40]	; 0x28
 80010a6:	685a      	ldr	r2, [r3, #4]
 80010a8:	b292      	uxth	r2, r2
 80010aa:	809a      	strh	r2, [r3, #4]
 80010ac:	6819      	ldr	r1, [r3, #0]
 80010ae:	2280      	movs	r2, #128	; 0x80
 80010b0:	0052      	lsls	r2, r2, #1
 80010b2:	430a      	orrs	r2, r1
 80010b4:	601a      	str	r2, [r3, #0]
 80010b6:	b662      	cpsie	i
 80010b8:	f7ff ffee 	bl	8001098 <i2c_delay>
 80010bc:	bd08      	pop	{r3, pc}
 80010be:	46c0      	nop			; (mov r8, r8)
 80010c0:	48000400 	.word	0x48000400

080010c4 <SetHighSDA>:
 80010c4:	b508      	push	{r3, lr}
 80010c6:	b672      	cpsid	i
 80010c8:	4b07      	ldr	r3, [pc, #28]	; (80010e8 <SetHighSDA+0x24>)
 80010ca:	2210      	movs	r2, #16
 80010cc:	619a      	str	r2, [r3, #24]
 80010ce:	6859      	ldr	r1, [r3, #4]
 80010d0:	b289      	uxth	r1, r1
 80010d2:	4391      	bics	r1, r2
 80010d4:	8099      	strh	r1, [r3, #4]
 80010d6:	6819      	ldr	r1, [r3, #0]
 80010d8:	4a04      	ldr	r2, [pc, #16]	; (80010ec <SetHighSDA+0x28>)
 80010da:	400a      	ands	r2, r1
 80010dc:	601a      	str	r2, [r3, #0]
 80010de:	b662      	cpsie	i
 80010e0:	f7ff ffda 	bl	8001098 <i2c_delay>
 80010e4:	bd08      	pop	{r3, pc}
 80010e6:	46c0      	nop			; (mov r8, r8)
 80010e8:	48000400 	.word	0x48000400
 80010ec:	fffffcff 	.word	0xfffffcff

080010f0 <SetLowSCL>:
 80010f0:	b508      	push	{r3, lr}
 80010f2:	4b03      	ldr	r3, [pc, #12]	; (8001100 <SetLowSCL+0x10>)
 80010f4:	2220      	movs	r2, #32
 80010f6:	851a      	strh	r2, [r3, #40]	; 0x28
 80010f8:	f7ff ffce 	bl	8001098 <i2c_delay>
 80010fc:	bd08      	pop	{r3, pc}
 80010fe:	46c0      	nop			; (mov r8, r8)
 8001100:	48000400 	.word	0x48000400

08001104 <SetHighSCL>:
 8001104:	b508      	push	{r3, lr}
 8001106:	4b03      	ldr	r3, [pc, #12]	; (8001114 <SetHighSCL+0x10>)
 8001108:	2220      	movs	r2, #32
 800110a:	619a      	str	r2, [r3, #24]
 800110c:	f7ff ffc4 	bl	8001098 <i2c_delay>
 8001110:	bd08      	pop	{r3, pc}
 8001112:	46c0      	nop			; (mov r8, r8)
 8001114:	48000400 	.word	0x48000400

08001118 <i2c_0_init>:
 8001118:	b507      	push	{r0, r1, r2, lr}
 800111a:	2330      	movs	r3, #48	; 0x30
 800111c:	4669      	mov	r1, sp
 800111e:	9300      	str	r3, [sp, #0]
 8001120:	2301      	movs	r3, #1
 8001122:	710b      	strb	r3, [r1, #4]
 8001124:	2203      	movs	r2, #3
 8001126:	2300      	movs	r3, #0
 8001128:	4806      	ldr	r0, [pc, #24]	; (8001144 <i2c_0_init+0x2c>)
 800112a:	718b      	strb	r3, [r1, #6]
 800112c:	714a      	strb	r2, [r1, #5]
 800112e:	71cb      	strb	r3, [r1, #7]
 8001130:	f000 fd5c 	bl	8001bec <GPIO_Init>
 8001134:	f7ff ffe6 	bl	8001104 <SetHighSCL>
 8001138:	f7ff ffb0 	bl	800109c <SetLowSDA>
 800113c:	f7ff ffc2 	bl	80010c4 <SetHighSDA>
 8001140:	bd07      	pop	{r0, r1, r2, pc}
 8001142:	46c0      	nop			; (mov r8, r8)
 8001144:	48000400 	.word	0x48000400

08001148 <i2cStart>:
 8001148:	b508      	push	{r3, lr}
 800114a:	f7ff ffdb 	bl	8001104 <SetHighSCL>
 800114e:	f7ff ffb9 	bl	80010c4 <SetHighSDA>
 8001152:	f7ff ffd7 	bl	8001104 <SetHighSCL>
 8001156:	f7ff ffa1 	bl	800109c <SetLowSDA>
 800115a:	f7ff ffc9 	bl	80010f0 <SetLowSCL>
 800115e:	f7ff ffb1 	bl	80010c4 <SetHighSDA>
 8001162:	bd08      	pop	{r3, pc}

08001164 <i2cStop>:
 8001164:	b508      	push	{r3, lr}
 8001166:	f7ff ffc3 	bl	80010f0 <SetLowSCL>
 800116a:	f7ff ff97 	bl	800109c <SetLowSDA>
 800116e:	f7ff ffc9 	bl	8001104 <SetHighSCL>
 8001172:	f7ff ff93 	bl	800109c <SetLowSDA>
 8001176:	f7ff ffc5 	bl	8001104 <SetHighSCL>
 800117a:	f7ff ffa3 	bl	80010c4 <SetHighSDA>
 800117e:	bd08      	pop	{r3, pc}

08001180 <i2cWrite>:
 8001180:	b538      	push	{r3, r4, r5, lr}
 8001182:	1c05      	adds	r5, r0, #0
 8001184:	2408      	movs	r4, #8
 8001186:	f7ff ffb3 	bl	80010f0 <SetLowSCL>
 800118a:	b26b      	sxtb	r3, r5
 800118c:	2b00      	cmp	r3, #0
 800118e:	da02      	bge.n	8001196 <i2cWrite+0x16>
 8001190:	f7ff ff98 	bl	80010c4 <SetHighSDA>
 8001194:	e001      	b.n	800119a <i2cWrite+0x1a>
 8001196:	f7ff ff81 	bl	800109c <SetLowSDA>
 800119a:	3c01      	subs	r4, #1
 800119c:	006d      	lsls	r5, r5, #1
 800119e:	b2e4      	uxtb	r4, r4
 80011a0:	f7ff ffb0 	bl	8001104 <SetHighSCL>
 80011a4:	b2ed      	uxtb	r5, r5
 80011a6:	2c00      	cmp	r4, #0
 80011a8:	d1ed      	bne.n	8001186 <i2cWrite+0x6>
 80011aa:	f7ff ffa1 	bl	80010f0 <SetLowSCL>
 80011ae:	f7ff ff89 	bl	80010c4 <SetHighSDA>
 80011b2:	f7ff ffa7 	bl	8001104 <SetHighSCL>
 80011b6:	4b05      	ldr	r3, [pc, #20]	; (80011cc <i2cWrite+0x4c>)
 80011b8:	691c      	ldr	r4, [r3, #16]
 80011ba:	f7ff ff99 	bl	80010f0 <SetLowSCL>
 80011be:	b2a4      	uxth	r4, r4
 80011c0:	f7ff ff6a 	bl	8001098 <i2c_delay>
 80011c4:	0924      	lsrs	r4, r4, #4
 80011c6:	2001      	movs	r0, #1
 80011c8:	43a0      	bics	r0, r4
 80011ca:	bd38      	pop	{r3, r4, r5, pc}
 80011cc:	48000400 	.word	0x48000400

080011d0 <i2cRead>:
 80011d0:	b570      	push	{r4, r5, r6, lr}
 80011d2:	1c06      	adds	r6, r0, #0
 80011d4:	f7ff ff8c 	bl	80010f0 <SetLowSCL>
 80011d8:	f7ff ff74 	bl	80010c4 <SetHighSDA>
 80011dc:	2508      	movs	r5, #8
 80011de:	2400      	movs	r4, #0
 80011e0:	f7ff ff90 	bl	8001104 <SetHighSCL>
 80011e4:	4b0c      	ldr	r3, [pc, #48]	; (8001218 <i2cRead+0x48>)
 80011e6:	0064      	lsls	r4, r4, #1
 80011e8:	691b      	ldr	r3, [r3, #16]
 80011ea:	b2e4      	uxtb	r4, r4
 80011ec:	06da      	lsls	r2, r3, #27
 80011ee:	d501      	bpl.n	80011f4 <i2cRead+0x24>
 80011f0:	3401      	adds	r4, #1
 80011f2:	b2e4      	uxtb	r4, r4
 80011f4:	3d01      	subs	r5, #1
 80011f6:	b2ed      	uxtb	r5, r5
 80011f8:	f7ff ff7a 	bl	80010f0 <SetLowSCL>
 80011fc:	2d00      	cmp	r5, #0
 80011fe:	d1ef      	bne.n	80011e0 <i2cRead+0x10>
 8001200:	2e00      	cmp	r6, #0
 8001202:	d001      	beq.n	8001208 <i2cRead+0x38>
 8001204:	f7ff ff4a 	bl	800109c <SetLowSDA>
 8001208:	f7ff ff7c 	bl	8001104 <SetHighSCL>
 800120c:	f7ff ff70 	bl	80010f0 <SetLowSCL>
 8001210:	f7ff ff42 	bl	8001098 <i2c_delay>
 8001214:	1c20      	adds	r0, r4, #0
 8001216:	bd70      	pop	{r4, r5, r6, pc}
 8001218:	48000400 	.word	0x48000400

0800121c <i2c_write_reg>:
 800121c:	b570      	push	{r4, r5, r6, lr}
 800121e:	1c06      	adds	r6, r0, #0
 8001220:	1c0d      	adds	r5, r1, #0
 8001222:	1c14      	adds	r4, r2, #0
 8001224:	f7ff ff90 	bl	8001148 <i2cStart>
 8001228:	1c30      	adds	r0, r6, #0
 800122a:	f7ff ffa9 	bl	8001180 <i2cWrite>
 800122e:	1c28      	adds	r0, r5, #0
 8001230:	f7ff ffa6 	bl	8001180 <i2cWrite>
 8001234:	1c20      	adds	r0, r4, #0
 8001236:	f7ff ffa3 	bl	8001180 <i2cWrite>
 800123a:	f7ff ff93 	bl	8001164 <i2cStop>
 800123e:	bd70      	pop	{r4, r5, r6, pc}

08001240 <i2c_read_reg>:
 8001240:	b538      	push	{r3, r4, r5, lr}
 8001242:	1c04      	adds	r4, r0, #0
 8001244:	1c0d      	adds	r5, r1, #0
 8001246:	f7ff ff7f 	bl	8001148 <i2cStart>
 800124a:	1c20      	adds	r0, r4, #0
 800124c:	f7ff ff98 	bl	8001180 <i2cWrite>
 8001250:	1c28      	adds	r0, r5, #0
 8001252:	f7ff ff95 	bl	8001180 <i2cWrite>
 8001256:	f7ff ff77 	bl	8001148 <i2cStart>
 800125a:	2001      	movs	r0, #1
 800125c:	4320      	orrs	r0, r4
 800125e:	f7ff ff8f 	bl	8001180 <i2cWrite>
 8001262:	2000      	movs	r0, #0
 8001264:	f7ff ffb4 	bl	80011d0 <i2cRead>
 8001268:	1c04      	adds	r4, r0, #0
 800126a:	f7ff ff7b 	bl	8001164 <i2cStop>
 800126e:	1c20      	adds	r0, r4, #0
 8001270:	bd38      	pop	{r3, r4, r5, pc}
	...

08001274 <uart_write>:
 8001274:	4b03      	ldr	r3, [pc, #12]	; (8001284 <uart_write+0x10>)
 8001276:	69da      	ldr	r2, [r3, #28]
 8001278:	0611      	lsls	r1, r2, #24
 800127a:	d401      	bmi.n	8001280 <uart_write+0xc>
 800127c:	46c0      	nop			; (mov r8, r8)
 800127e:	e7f9      	b.n	8001274 <uart_write>
 8001280:	8518      	strh	r0, [r3, #40]	; 0x28
 8001282:	4770      	bx	lr
 8001284:	40013800 	.word	0x40013800

08001288 <uart_init>:
 8001288:	b570      	push	{r4, r5, r6, lr}
 800128a:	2080      	movs	r0, #128	; 0x80
 800128c:	b088      	sub	sp, #32
 800128e:	0280      	lsls	r0, r0, #10
 8001290:	2101      	movs	r1, #1
 8001292:	f000 fa77 	bl	8001784 <RCC_AHBPeriphClockCmd>
 8001296:	2690      	movs	r6, #144	; 0x90
 8001298:	2080      	movs	r0, #128	; 0x80
 800129a:	05f6      	lsls	r6, r6, #23
 800129c:	01c0      	lsls	r0, r0, #7
 800129e:	2101      	movs	r1, #1
 80012a0:	f000 fa90 	bl	80017c4 <RCC_APB2PeriphClockCmd>
 80012a4:	1c30      	adds	r0, r6, #0
 80012a6:	2102      	movs	r1, #2
 80012a8:	2201      	movs	r2, #1
 80012aa:	f000 fd23 	bl	8001cf4 <GPIO_PinAFConfig>
 80012ae:	1c30      	adds	r0, r6, #0
 80012b0:	210f      	movs	r1, #15
 80012b2:	2201      	movs	r2, #1
 80012b4:	f000 fd1e 	bl	8001cf4 <GPIO_PinAFConfig>
 80012b8:	4b10      	ldr	r3, [pc, #64]	; (80012fc <uart_init+0x74>)
 80012ba:	466a      	mov	r2, sp
 80012bc:	2400      	movs	r4, #0
 80012be:	2501      	movs	r5, #1
 80012c0:	9300      	str	r3, [sp, #0]
 80012c2:	1c30      	adds	r0, r6, #0
 80012c4:	2302      	movs	r3, #2
 80012c6:	4669      	mov	r1, sp
 80012c8:	7113      	strb	r3, [r2, #4]
 80012ca:	7194      	strb	r4, [r2, #6]
 80012cc:	7155      	strb	r5, [r2, #5]
 80012ce:	71d5      	strb	r5, [r2, #7]
 80012d0:	f000 fc8c 	bl	8001bec <GPIO_Init>
 80012d4:	9403      	str	r4, [sp, #12]
 80012d6:	9404      	str	r4, [sp, #16]
 80012d8:	9405      	str	r4, [sp, #20]
 80012da:	9407      	str	r4, [sp, #28]
 80012dc:	23e1      	movs	r3, #225	; 0xe1
 80012de:	4c08      	ldr	r4, [pc, #32]	; (8001300 <uart_init+0x78>)
 80012e0:	025b      	lsls	r3, r3, #9
 80012e2:	9302      	str	r3, [sp, #8]
 80012e4:	1c20      	adds	r0, r4, #0
 80012e6:	230c      	movs	r3, #12
 80012e8:	a902      	add	r1, sp, #8
 80012ea:	9306      	str	r3, [sp, #24]
 80012ec:	f000 fd48 	bl	8001d80 <USART_Init>
 80012f0:	1c20      	adds	r0, r4, #0
 80012f2:	1c29      	adds	r1, r5, #0
 80012f4:	f000 fe12 	bl	8001f1c <USART_Cmd>
 80012f8:	b008      	add	sp, #32
 80012fa:	bd70      	pop	{r4, r5, r6, pc}
 80012fc:	00008004 	.word	0x00008004
 8001300:	40013800 	.word	0x40013800

08001304 <USART1_IRQHandler>:
 8001304:	b508      	push	{r3, lr}
 8001306:	4802      	ldr	r0, [pc, #8]	; (8001310 <USART1_IRQHandler+0xc>)
 8001308:	4902      	ldr	r1, [pc, #8]	; (8001314 <USART1_IRQHandler+0x10>)
 800130a:	f000 fe47 	bl	8001f9c <USART_ClearITPendingBit>
 800130e:	bd08      	pop	{r3, pc}
 8001310:	40013800 	.word	0x40013800
 8001314:	00050105 	.word	0x00050105

08001318 <adc_random_init>:
 8001318:	b570      	push	{r4, r5, r6, lr}
 800131a:	2001      	movs	r0, #1
 800131c:	f000 fba8 	bl	8001a70 <ADC_TempSensorCmd>
 8001320:	2180      	movs	r1, #128	; 0x80
 8001322:	4813      	ldr	r0, [pc, #76]	; (8001370 <adc_random_init+0x58>)
 8001324:	0249      	lsls	r1, r1, #9
 8001326:	2200      	movs	r2, #0
 8001328:	f000 fbba 	bl	8001aa0 <ADC_ChannelConfig>
 800132c:	2420      	movs	r4, #32
 800132e:	2500      	movs	r5, #0
 8001330:	480f      	ldr	r0, [pc, #60]	; (8001370 <adc_random_init+0x58>)
 8001332:	f000 fbf5 	bl	8001b20 <ADC_StartOfConversion>
 8001336:	480e      	ldr	r0, [pc, #56]	; (8001370 <adc_random_init+0x58>)
 8001338:	2104      	movs	r1, #4
 800133a:	f000 fc0f 	bl	8001b5c <ADC_GetFlagStatus>
 800133e:	2800      	cmp	r0, #0
 8001340:	d101      	bne.n	8001346 <adc_random_init+0x2e>
 8001342:	46c0      	nop			; (mov r8, r8)
 8001344:	e7f7      	b.n	8001336 <adc_random_init+0x1e>
 8001346:	480a      	ldr	r0, [pc, #40]	; (8001370 <adc_random_init+0x58>)
 8001348:	f000 fbfa 	bl	8001b40 <ADC_GetConversionValue>
 800134c:	006e      	lsls	r6, r5, #1
 800134e:	2301      	movs	r3, #1
 8001350:	1c05      	adds	r5, r0, #0
 8001352:	401d      	ands	r5, r3
 8001354:	4806      	ldr	r0, [pc, #24]	; (8001370 <adc_random_init+0x58>)
 8001356:	2104      	movs	r1, #4
 8001358:	3c01      	subs	r4, #1
 800135a:	4335      	orrs	r5, r6
 800135c:	f000 fc2e 	bl	8001bbc <ADC_ClearFlag>
 8001360:	2c00      	cmp	r4, #0
 8001362:	d1e5      	bne.n	8001330 <adc_random_init+0x18>
 8001364:	1c20      	adds	r0, r4, #0
 8001366:	f000 fb83 	bl	8001a70 <ADC_TempSensorCmd>
 800136a:	1c28      	adds	r0, r5, #0
 800136c:	bd70      	pop	{r4, r5, r6, pc}
 800136e:	46c0      	nop			; (mov r8, r8)
 8001370:	40012400 	.word	0x40012400

08001374 <adc_init>:
 8001374:	b530      	push	{r4, r5, lr}
 8001376:	2090      	movs	r0, #144	; 0x90
 8001378:	b089      	sub	sp, #36	; 0x24
 800137a:	466a      	mov	r2, sp
 800137c:	2303      	movs	r3, #3
 800137e:	2401      	movs	r4, #1
 8001380:	2500      	movs	r5, #0
 8001382:	05c0      	lsls	r0, r0, #23
 8001384:	4669      	mov	r1, sp
 8001386:	7113      	strb	r3, [r2, #4]
 8001388:	71d5      	strb	r5, [r2, #7]
 800138a:	9400      	str	r4, [sp, #0]
 800138c:	f000 fc2e 	bl	8001bec <GPIO_Init>
 8001390:	2080      	movs	r0, #128	; 0x80
 8001392:	0080      	lsls	r0, r0, #2
 8001394:	1c21      	adds	r1, r4, #0
 8001396:	f000 fa15 	bl	80017c4 <RCC_APB2PeriphClockCmd>
 800139a:	1c28      	adds	r0, r5, #0
 800139c:	f000 f906 	bl	80015ac <RCC_ADCCLKConfig>
 80013a0:	1c20      	adds	r0, r4, #0
 80013a2:	f000 f8ef 	bl	8001584 <RCC_HSI14Cmd>
 80013a6:	2061      	movs	r0, #97	; 0x61
 80013a8:	f000 fa6c 	bl	8001884 <RCC_GetFlagStatus>
 80013ac:	2800      	cmp	r0, #0
 80013ae:	d101      	bne.n	80013b4 <adc_init+0x40>
 80013b0:	46c0      	nop			; (mov r8, r8)
 80013b2:	e7f8      	b.n	80013a6 <adc_init+0x32>
 80013b4:	4811      	ldr	r0, [pc, #68]	; (80013fc <adc_init+0x88>)
 80013b6:	f000 fad5 	bl	8001964 <ADC_DeInit>
 80013ba:	a902      	add	r1, sp, #8
 80013bc:	2300      	movs	r3, #0
 80013be:	480f      	ldr	r0, [pc, #60]	; (80013fc <adc_init+0x88>)
 80013c0:	710b      	strb	r3, [r1, #4]
 80013c2:	610b      	str	r3, [r1, #16]
 80013c4:	614b      	str	r3, [r1, #20]
 80013c6:	608b      	str	r3, [r1, #8]
 80013c8:	60cb      	str	r3, [r1, #12]
 80013ca:	9302      	str	r3, [sp, #8]
 80013cc:	f000 fae2 	bl	8001994 <ADC_Init>
 80013d0:	480a      	ldr	r0, [pc, #40]	; (80013fc <adc_init+0x88>)
 80013d2:	f000 fb85 	bl	8001ae0 <ADC_GetCalibrationFactor>
 80013d6:	4809      	ldr	r0, [pc, #36]	; (80013fc <adc_init+0x88>)
 80013d8:	2101      	movs	r1, #1
 80013da:	f000 fb2d 	bl	8001a38 <ADC_Cmd>
 80013de:	4807      	ldr	r0, [pc, #28]	; (80013fc <adc_init+0x88>)
 80013e0:	2101      	movs	r1, #1
 80013e2:	f000 fbbb 	bl	8001b5c <ADC_GetFlagStatus>
 80013e6:	2800      	cmp	r0, #0
 80013e8:	d101      	bne.n	80013ee <adc_init+0x7a>
 80013ea:	46c0      	nop			; (mov r8, r8)
 80013ec:	e7f7      	b.n	80013de <adc_init+0x6a>
 80013ee:	f7ff ff93 	bl	8001318 <adc_random_init>
 80013f2:	4b03      	ldr	r3, [pc, #12]	; (8001400 <adc_init+0x8c>)
 80013f4:	6018      	str	r0, [r3, #0]
 80013f6:	b009      	add	sp, #36	; 0x24
 80013f8:	bd30      	pop	{r4, r5, pc}
 80013fa:	46c0      	nop			; (mov r8, r8)
 80013fc:	40012400 	.word	0x40012400
 8001400:	2000001c 	.word	0x2000001c

08001404 <adc_read>:
 8001404:	4b07      	ldr	r3, [pc, #28]	; (8001424 <adc_read+0x20>)
 8001406:	2104      	movs	r1, #4
 8001408:	689a      	ldr	r2, [r3, #8]
 800140a:	430a      	orrs	r2, r1
 800140c:	609a      	str	r2, [r3, #8]
 800140e:	6818      	ldr	r0, [r3, #0]
 8001410:	2104      	movs	r1, #4
 8001412:	4a04      	ldr	r2, [pc, #16]	; (8001424 <adc_read+0x20>)
 8001414:	4208      	tst	r0, r1
 8001416:	d101      	bne.n	800141c <adc_read+0x18>
 8001418:	46c0      	nop			; (mov r8, r8)
 800141a:	e7f8      	b.n	800140e <adc_read+0xa>
 800141c:	6c10      	ldr	r0, [r2, #64]	; 0x40
 800141e:	6011      	str	r1, [r2, #0]
 8001420:	4770      	bx	lr
 8001422:	46c0      	nop			; (mov r8, r8)
 8001424:	40012400 	.word	0x40012400

08001428 <adc_config_ch>:
 8001428:	b508      	push	{r3, lr}
 800142a:	1c01      	adds	r1, r0, #0
 800142c:	2200      	movs	r2, #0
 800142e:	4803      	ldr	r0, [pc, #12]	; (800143c <adc_config_ch+0x14>)
 8001430:	f000 fb36 	bl	8001aa0 <ADC_ChannelConfig>
 8001434:	f7ff ffe6 	bl	8001404 <adc_read>
 8001438:	bd08      	pop	{r3, pc}
 800143a:	46c0      	nop			; (mov r8, r8)
 800143c:	40012400 	.word	0x40012400

08001440 <adc_random>:
 8001440:	4b01      	ldr	r3, [pc, #4]	; (8001448 <adc_random+0x8>)
 8001442:	6818      	ldr	r0, [r3, #0]
 8001444:	4770      	bx	lr
 8001446:	46c0      	nop			; (mov r8, r8)
 8001448:	2000001c 	.word	0x2000001c

0800144c <assert_param>:
 800144c:	4770      	bx	lr
	...

08001450 <sys_tick_init>:
 8001450:	4b03      	ldr	r3, [pc, #12]	; (8001460 <sys_tick_init+0x10>)
 8001452:	4a04      	ldr	r2, [pc, #16]	; (8001464 <sys_tick_init+0x14>)
 8001454:	605a      	str	r2, [r3, #4]
 8001456:	2200      	movs	r2, #0
 8001458:	609a      	str	r2, [r3, #8]
 800145a:	2207      	movs	r2, #7
 800145c:	601a      	str	r2, [r3, #0]
 800145e:	4770      	bx	lr
 8001460:	e000e010 	.word	0xe000e010
 8001464:	0000bb80 	.word	0x0000bb80

08001468 <sleep>:
 8001468:	bf30      	wfi
 800146a:	4770      	bx	lr

0800146c <sys_tick_trigger>:
 800146c:	4770      	bx	lr
	...

08001470 <SystemInit>:
 8001470:	4b26      	ldr	r3, [pc, #152]	; (800150c <SystemInit+0x9c>)
 8001472:	2201      	movs	r2, #1
 8001474:	6819      	ldr	r1, [r3, #0]
 8001476:	b082      	sub	sp, #8
 8001478:	4311      	orrs	r1, r2
 800147a:	6019      	str	r1, [r3, #0]
 800147c:	6858      	ldr	r0, [r3, #4]
 800147e:	4924      	ldr	r1, [pc, #144]	; (8001510 <SystemInit+0xa0>)
 8001480:	4001      	ands	r1, r0
 8001482:	6059      	str	r1, [r3, #4]
 8001484:	6818      	ldr	r0, [r3, #0]
 8001486:	4923      	ldr	r1, [pc, #140]	; (8001514 <SystemInit+0xa4>)
 8001488:	4001      	ands	r1, r0
 800148a:	6019      	str	r1, [r3, #0]
 800148c:	6818      	ldr	r0, [r3, #0]
 800148e:	4922      	ldr	r1, [pc, #136]	; (8001518 <SystemInit+0xa8>)
 8001490:	4001      	ands	r1, r0
 8001492:	6019      	str	r1, [r3, #0]
 8001494:	6858      	ldr	r0, [r3, #4]
 8001496:	4921      	ldr	r1, [pc, #132]	; (800151c <SystemInit+0xac>)
 8001498:	4001      	ands	r1, r0
 800149a:	6059      	str	r1, [r3, #4]
 800149c:	6ad9      	ldr	r1, [r3, #44]	; 0x2c
 800149e:	200f      	movs	r0, #15
 80014a0:	4381      	bics	r1, r0
 80014a2:	62d9      	str	r1, [r3, #44]	; 0x2c
 80014a4:	6b18      	ldr	r0, [r3, #48]	; 0x30
 80014a6:	491e      	ldr	r1, [pc, #120]	; (8001520 <SystemInit+0xb0>)
 80014a8:	4001      	ands	r1, r0
 80014aa:	6319      	str	r1, [r3, #48]	; 0x30
 80014ac:	6b59      	ldr	r1, [r3, #52]	; 0x34
 80014ae:	4391      	bics	r1, r2
 80014b0:	2200      	movs	r2, #0
 80014b2:	6359      	str	r1, [r3, #52]	; 0x34
 80014b4:	609a      	str	r2, [r3, #8]
 80014b6:	9200      	str	r2, [sp, #0]
 80014b8:	9201      	str	r2, [sp, #4]
 80014ba:	4a1a      	ldr	r2, [pc, #104]	; (8001524 <SystemInit+0xb4>)
 80014bc:	2111      	movs	r1, #17
 80014be:	6011      	str	r1, [r2, #0]
 80014c0:	685a      	ldr	r2, [r3, #4]
 80014c2:	605a      	str	r2, [r3, #4]
 80014c4:	685a      	ldr	r2, [r3, #4]
 80014c6:	605a      	str	r2, [r3, #4]
 80014c8:	6859      	ldr	r1, [r3, #4]
 80014ca:	4a17      	ldr	r2, [pc, #92]	; (8001528 <SystemInit+0xb8>)
 80014cc:	400a      	ands	r2, r1
 80014ce:	605a      	str	r2, [r3, #4]
 80014d0:	6859      	ldr	r1, [r3, #4]
 80014d2:	22a0      	movs	r2, #160	; 0xa0
 80014d4:	0392      	lsls	r2, r2, #14
 80014d6:	430a      	orrs	r2, r1
 80014d8:	605a      	str	r2, [r3, #4]
 80014da:	6819      	ldr	r1, [r3, #0]
 80014dc:	2280      	movs	r2, #128	; 0x80
 80014de:	0452      	lsls	r2, r2, #17
 80014e0:	430a      	orrs	r2, r1
 80014e2:	601a      	str	r2, [r3, #0]
 80014e4:	6819      	ldr	r1, [r3, #0]
 80014e6:	4a09      	ldr	r2, [pc, #36]	; (800150c <SystemInit+0x9c>)
 80014e8:	0188      	lsls	r0, r1, #6
 80014ea:	d5fb      	bpl.n	80014e4 <SystemInit+0x74>
 80014ec:	6851      	ldr	r1, [r2, #4]
 80014ee:	2003      	movs	r0, #3
 80014f0:	4381      	bics	r1, r0
 80014f2:	6051      	str	r1, [r2, #4]
 80014f4:	6851      	ldr	r1, [r2, #4]
 80014f6:	2002      	movs	r0, #2
 80014f8:	4301      	orrs	r1, r0
 80014fa:	6051      	str	r1, [r2, #4]
 80014fc:	6859      	ldr	r1, [r3, #4]
 80014fe:	220c      	movs	r2, #12
 8001500:	400a      	ands	r2, r1
 8001502:	2a08      	cmp	r2, #8
 8001504:	d1fa      	bne.n	80014fc <SystemInit+0x8c>
 8001506:	b002      	add	sp, #8
 8001508:	4770      	bx	lr
 800150a:	46c0      	nop			; (mov r8, r8)
 800150c:	40021000 	.word	0x40021000
 8001510:	f8ffb80c 	.word	0xf8ffb80c
 8001514:	fef6ffff 	.word	0xfef6ffff
 8001518:	fffbffff 	.word	0xfffbffff
 800151c:	ffc0ffff 	.word	0xffc0ffff
 8001520:	fffffeac 	.word	0xfffffeac
 8001524:	40022000 	.word	0x40022000
 8001528:	ffc07fff 	.word	0xffc07fff

0800152c <Default_Handler>:
 800152c:	4770      	bx	lr
	...

08001530 <HardFault_Handler>:
 8001530:	2008      	movs	r0, #8
 8001532:	f000 ff19 	bl	8002368 <led_on>
 8001536:	4b07      	ldr	r3, [pc, #28]	; (8001554 <HardFault_Handler+0x24>)
 8001538:	3b01      	subs	r3, #1
 800153a:	2b00      	cmp	r3, #0
 800153c:	d001      	beq.n	8001542 <HardFault_Handler+0x12>
 800153e:	46c0      	nop			; (mov r8, r8)
 8001540:	e7fa      	b.n	8001538 <HardFault_Handler+0x8>
 8001542:	2008      	movs	r0, #8
 8001544:	f000 ff24 	bl	8002390 <led_off>
 8001548:	4b02      	ldr	r3, [pc, #8]	; (8001554 <HardFault_Handler+0x24>)
 800154a:	3b01      	subs	r3, #1
 800154c:	2b00      	cmp	r3, #0
 800154e:	d0ef      	beq.n	8001530 <HardFault_Handler>
 8001550:	46c0      	nop			; (mov r8, r8)
 8001552:	e7fa      	b.n	800154a <HardFault_Handler+0x1a>
 8001554:	002dc6c1 	.word	0x002dc6c1

08001558 <_reset_init>:
 8001558:	4a07      	ldr	r2, [pc, #28]	; (8001578 <_reset_init+0x20>)
 800155a:	4908      	ldr	r1, [pc, #32]	; (800157c <_reset_init+0x24>)
 800155c:	2300      	movs	r3, #0
 800155e:	1a89      	subs	r1, r1, r2
 8001560:	1089      	asrs	r1, r1, #2
 8001562:	1c10      	adds	r0, r2, #0
 8001564:	428b      	cmp	r3, r1
 8001566:	d005      	beq.n	8001574 <_reset_init+0x1c>
 8001568:	4c05      	ldr	r4, [pc, #20]	; (8001580 <_reset_init+0x28>)
 800156a:	009a      	lsls	r2, r3, #2
 800156c:	58a4      	ldr	r4, [r4, r2]
 800156e:	3301      	adds	r3, #1
 8001570:	5084      	str	r4, [r0, r2]
 8001572:	e7f7      	b.n	8001564 <_reset_init+0xc>
 8001574:	f7ff f844 	bl	8000600 <main>
 8001578:	20000000 	.word	0x20000000
 800157c:	20000018 	.word	0x20000018
 8001580:	08002c0c 	.word	0x08002c0c

08001584 <RCC_HSI14Cmd>:
 8001584:	b538      	push	{r3, r4, r5, lr}
 8001586:	1c05      	adds	r5, r0, #0
 8001588:	2401      	movs	r4, #1
 800158a:	2000      	movs	r0, #0
 800158c:	42ac      	cmp	r4, r5
 800158e:	4140      	adcs	r0, r0
 8001590:	f7ff ff5c 	bl	800144c <assert_param>
 8001594:	4b04      	ldr	r3, [pc, #16]	; (80015a8 <RCC_HSI14Cmd+0x24>)
 8001596:	6b5a      	ldr	r2, [r3, #52]	; 0x34
 8001598:	2d00      	cmp	r5, #0
 800159a:	d002      	beq.n	80015a2 <RCC_HSI14Cmd+0x1e>
 800159c:	4314      	orrs	r4, r2
 800159e:	635c      	str	r4, [r3, #52]	; 0x34
 80015a0:	e001      	b.n	80015a6 <RCC_HSI14Cmd+0x22>
 80015a2:	43a2      	bics	r2, r4
 80015a4:	635a      	str	r2, [r3, #52]	; 0x34
 80015a6:	bd38      	pop	{r3, r4, r5, pc}
 80015a8:	40021000 	.word	0x40021000

080015ac <RCC_ADCCLKConfig>:
 80015ac:	4b0e      	ldr	r3, [pc, #56]	; (80015e8 <RCC_ADCCLKConfig+0x3c>)
 80015ae:	b510      	push	{r4, lr}
 80015b0:	1c04      	adds	r4, r0, #0
 80015b2:	2001      	movs	r0, #1
 80015b4:	421c      	tst	r4, r3
 80015b6:	d003      	beq.n	80015c0 <RCC_ADCCLKConfig+0x14>
 80015b8:	4b0c      	ldr	r3, [pc, #48]	; (80015ec <RCC_ADCCLKConfig+0x40>)
 80015ba:	18e0      	adds	r0, r4, r3
 80015bc:	4243      	negs	r3, r0
 80015be:	4158      	adcs	r0, r3
 80015c0:	f7ff ff44 	bl	800144c <assert_param>
 80015c4:	4b0a      	ldr	r3, [pc, #40]	; (80015f0 <RCC_ADCCLKConfig+0x44>)
 80015c6:	4a0b      	ldr	r2, [pc, #44]	; (80015f4 <RCC_ADCCLKConfig+0x48>)
 80015c8:	6859      	ldr	r1, [r3, #4]
 80015ca:	400a      	ands	r2, r1
 80015cc:	605a      	str	r2, [r3, #4]
 80015ce:	685a      	ldr	r2, [r3, #4]
 80015d0:	b2a1      	uxth	r1, r4
 80015d2:	430a      	orrs	r2, r1
 80015d4:	605a      	str	r2, [r3, #4]
 80015d6:	6b19      	ldr	r1, [r3, #48]	; 0x30
 80015d8:	4a07      	ldr	r2, [pc, #28]	; (80015f8 <RCC_ADCCLKConfig+0x4c>)
 80015da:	0c24      	lsrs	r4, r4, #16
 80015dc:	400a      	ands	r2, r1
 80015de:	631a      	str	r2, [r3, #48]	; 0x30
 80015e0:	6b1a      	ldr	r2, [r3, #48]	; 0x30
 80015e2:	4314      	orrs	r4, r2
 80015e4:	631c      	str	r4, [r3, #48]	; 0x30
 80015e6:	bd10      	pop	{r4, pc}
 80015e8:	feffffff 	.word	0xfeffffff
 80015ec:	feffc000 	.word	0xfeffc000
 80015f0:	40021000 	.word	0x40021000
 80015f4:	ffffbfff 	.word	0xffffbfff
 80015f8:	fffffeff 	.word	0xfffffeff

080015fc <RCC_GetClocksFreq>:
 80015fc:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
 80015fe:	4d5a      	ldr	r5, [pc, #360]	; (8001768 <RCC_GetClocksFreq+0x16c>)
 8001600:	1c04      	adds	r4, r0, #0
 8001602:	6868      	ldr	r0, [r5, #4]
 8001604:	230c      	movs	r3, #12
 8001606:	4018      	ands	r0, r3
 8001608:	f000 fed6 	bl	80023b8 <__gnu_thumb1_case_uqi>
 800160c:	1f1f1f1f 	.word	0x1f1f1f1f
 8001610:	1f1f1f1f 	.word	0x1f1f1f1f
 8001614:	1f1f1f07 	.word	0x1f1f1f07
 8001618:	1d          	.byte	0x1d
 8001619:	00          	.byte	0x00
 800161a:	686e      	ldr	r6, [r5, #4]
 800161c:	23c0      	movs	r3, #192	; 0xc0
 800161e:	02b6      	lsls	r6, r6, #10
 8001620:	686a      	ldr	r2, [r5, #4]
 8001622:	0f36      	lsrs	r6, r6, #28
 8001624:	025b      	lsls	r3, r3, #9
 8001626:	3602      	adds	r6, #2
 8001628:	421a      	tst	r2, r3
 800162a:	d101      	bne.n	8001630 <RCC_GetClocksFreq+0x34>
 800162c:	484f      	ldr	r0, [pc, #316]	; (800176c <RCC_GetClocksFreq+0x170>)
 800162e:	e007      	b.n	8001640 <RCC_GetClocksFreq+0x44>
 8001630:	4b4d      	ldr	r3, [pc, #308]	; (8001768 <RCC_GetClocksFreq+0x16c>)
 8001632:	484f      	ldr	r0, [pc, #316]	; (8001770 <RCC_GetClocksFreq+0x174>)
 8001634:	6ad9      	ldr	r1, [r3, #44]	; 0x2c
 8001636:	230f      	movs	r3, #15
 8001638:	4019      	ands	r1, r3
 800163a:	3101      	adds	r1, #1
 800163c:	f000 fec6 	bl	80023cc <__aeabi_uidiv>
 8001640:	4370      	muls	r0, r6
 8001642:	6020      	str	r0, [r4, #0]
 8001644:	e004      	b.n	8001650 <RCC_GetClocksFreq+0x54>
 8001646:	4b4b      	ldr	r3, [pc, #300]	; (8001774 <RCC_GetClocksFreq+0x178>)
 8001648:	e000      	b.n	800164c <RCC_GetClocksFreq+0x50>
 800164a:	4b49      	ldr	r3, [pc, #292]	; (8001770 <RCC_GetClocksFreq+0x174>)
 800164c:	6023      	str	r3, [r4, #0]
 800164e:	2000      	movs	r0, #0
 8001650:	686b      	ldr	r3, [r5, #4]
 8001652:	4a49      	ldr	r2, [pc, #292]	; (8001778 <RCC_GetClocksFreq+0x17c>)
 8001654:	061b      	lsls	r3, r3, #24
 8001656:	0f1b      	lsrs	r3, r3, #28
 8001658:	6821      	ldr	r1, [r4, #0]
 800165a:	5cd3      	ldrb	r3, [r2, r3]
 800165c:	1c0e      	adds	r6, r1, #0
 800165e:	40de      	lsrs	r6, r3
 8001660:	6066      	str	r6, [r4, #4]
 8001662:	1c33      	adds	r3, r6, #0
 8001664:	686e      	ldr	r6, [r5, #4]
 8001666:	0576      	lsls	r6, r6, #21
 8001668:	0f76      	lsrs	r6, r6, #29
 800166a:	5d92      	ldrb	r2, [r2, r6]
 800166c:	40d3      	lsrs	r3, r2
 800166e:	60a3      	str	r3, [r4, #8]
 8001670:	6b2a      	ldr	r2, [r5, #48]	; 0x30
 8001672:	05d6      	lsls	r6, r2, #23
 8001674:	d401      	bmi.n	800167a <RCC_GetClocksFreq+0x7e>
 8001676:	4a41      	ldr	r2, [pc, #260]	; (800177c <RCC_GetClocksFreq+0x180>)
 8001678:	e006      	b.n	8001688 <RCC_GetClocksFreq+0x8c>
 800167a:	4a3b      	ldr	r2, [pc, #236]	; (8001768 <RCC_GetClocksFreq+0x16c>)
 800167c:	6852      	ldr	r2, [r2, #4]
 800167e:	0456      	lsls	r6, r2, #17
 8001680:	d401      	bmi.n	8001686 <RCC_GetClocksFreq+0x8a>
 8001682:	085a      	lsrs	r2, r3, #1
 8001684:	e000      	b.n	8001688 <RCC_GetClocksFreq+0x8c>
 8001686:	089a      	lsrs	r2, r3, #2
 8001688:	60e2      	str	r2, [r4, #12]
 800168a:	6b2a      	ldr	r2, [r5, #48]	; 0x30
 800168c:	0656      	lsls	r6, r2, #25
 800168e:	d401      	bmi.n	8001694 <RCC_GetClocksFreq+0x98>
 8001690:	4a3b      	ldr	r2, [pc, #236]	; (8001780 <RCC_GetClocksFreq+0x184>)
 8001692:	e001      	b.n	8001698 <RCC_GetClocksFreq+0x9c>
 8001694:	2280      	movs	r2, #128	; 0x80
 8001696:	0212      	lsls	r2, r2, #8
 8001698:	6122      	str	r2, [r4, #16]
 800169a:	6b2a      	ldr	r2, [r5, #48]	; 0x30
 800169c:	06d6      	lsls	r6, r2, #27
 800169e:	d402      	bmi.n	80016a6 <RCC_GetClocksFreq+0xaa>
 80016a0:	4a33      	ldr	r2, [pc, #204]	; (8001770 <RCC_GetClocksFreq+0x174>)
 80016a2:	6162      	str	r2, [r4, #20]
 80016a4:	e000      	b.n	80016a8 <RCC_GetClocksFreq+0xac>
 80016a6:	6161      	str	r1, [r4, #20]
 80016a8:	6b2f      	ldr	r7, [r5, #48]	; 0x30
 80016aa:	2203      	movs	r2, #3
 80016ac:	4e2e      	ldr	r6, [pc, #184]	; (8001768 <RCC_GetClocksFreq+0x16c>)
 80016ae:	4217      	tst	r7, r2
 80016b0:	d101      	bne.n	80016b6 <RCC_GetClocksFreq+0xba>
 80016b2:	61a3      	str	r3, [r4, #24]
 80016b4:	e012      	b.n	80016dc <RCC_GetClocksFreq+0xe0>
 80016b6:	6b37      	ldr	r7, [r6, #48]	; 0x30
 80016b8:	4017      	ands	r7, r2
 80016ba:	2f01      	cmp	r7, #1
 80016bc:	d101      	bne.n	80016c2 <RCC_GetClocksFreq+0xc6>
 80016be:	61a1      	str	r1, [r4, #24]
 80016c0:	e00c      	b.n	80016dc <RCC_GetClocksFreq+0xe0>
 80016c2:	6b37      	ldr	r7, [r6, #48]	; 0x30
 80016c4:	4017      	ands	r7, r2
 80016c6:	2f02      	cmp	r7, #2
 80016c8:	d102      	bne.n	80016d0 <RCC_GetClocksFreq+0xd4>
 80016ca:	2280      	movs	r2, #128	; 0x80
 80016cc:	0212      	lsls	r2, r2, #8
 80016ce:	e004      	b.n	80016da <RCC_GetClocksFreq+0xde>
 80016d0:	6b36      	ldr	r6, [r6, #48]	; 0x30
 80016d2:	4032      	ands	r2, r6
 80016d4:	2a03      	cmp	r2, #3
 80016d6:	d101      	bne.n	80016dc <RCC_GetClocksFreq+0xe0>
 80016d8:	4a25      	ldr	r2, [pc, #148]	; (8001770 <RCC_GetClocksFreq+0x174>)
 80016da:	61a2      	str	r2, [r4, #24]
 80016dc:	22c0      	movs	r2, #192	; 0xc0
 80016de:	6b2f      	ldr	r7, [r5, #48]	; 0x30
 80016e0:	0292      	lsls	r2, r2, #10
 80016e2:	4e21      	ldr	r6, [pc, #132]	; (8001768 <RCC_GetClocksFreq+0x16c>)
 80016e4:	4217      	tst	r7, r2
 80016e6:	d101      	bne.n	80016ec <RCC_GetClocksFreq+0xf0>
 80016e8:	61e3      	str	r3, [r4, #28]
 80016ea:	e018      	b.n	800171e <RCC_GetClocksFreq+0x122>
 80016ec:	6b37      	ldr	r7, [r6, #48]	; 0x30
 80016ee:	4017      	ands	r7, r2
 80016f0:	46bc      	mov	ip, r7
 80016f2:	2780      	movs	r7, #128	; 0x80
 80016f4:	027f      	lsls	r7, r7, #9
 80016f6:	45bc      	cmp	ip, r7
 80016f8:	d101      	bne.n	80016fe <RCC_GetClocksFreq+0x102>
 80016fa:	61e1      	str	r1, [r4, #28]
 80016fc:	e00f      	b.n	800171e <RCC_GetClocksFreq+0x122>
 80016fe:	6b37      	ldr	r7, [r6, #48]	; 0x30
 8001700:	4017      	ands	r7, r2
 8001702:	46bc      	mov	ip, r7
 8001704:	2780      	movs	r7, #128	; 0x80
 8001706:	02bf      	lsls	r7, r7, #10
 8001708:	45bc      	cmp	ip, r7
 800170a:	d102      	bne.n	8001712 <RCC_GetClocksFreq+0x116>
 800170c:	2280      	movs	r2, #128	; 0x80
 800170e:	0212      	lsls	r2, r2, #8
 8001710:	e004      	b.n	800171c <RCC_GetClocksFreq+0x120>
 8001712:	6b36      	ldr	r6, [r6, #48]	; 0x30
 8001714:	4016      	ands	r6, r2
 8001716:	4296      	cmp	r6, r2
 8001718:	d101      	bne.n	800171e <RCC_GetClocksFreq+0x122>
 800171a:	4a15      	ldr	r2, [pc, #84]	; (8001770 <RCC_GetClocksFreq+0x174>)
 800171c:	61e2      	str	r2, [r4, #28]
 800171e:	22c0      	movs	r2, #192	; 0xc0
 8001720:	6b2f      	ldr	r7, [r5, #48]	; 0x30
 8001722:	0312      	lsls	r2, r2, #12
 8001724:	4e10      	ldr	r6, [pc, #64]	; (8001768 <RCC_GetClocksFreq+0x16c>)
 8001726:	4217      	tst	r7, r2
 8001728:	d015      	beq.n	8001756 <RCC_GetClocksFreq+0x15a>
 800172a:	6b37      	ldr	r7, [r6, #48]	; 0x30
 800172c:	2380      	movs	r3, #128	; 0x80
 800172e:	4017      	ands	r7, r2
 8001730:	02db      	lsls	r3, r3, #11
 8001732:	429f      	cmp	r7, r3
 8001734:	d101      	bne.n	800173a <RCC_GetClocksFreq+0x13e>
 8001736:	6221      	str	r1, [r4, #32]
 8001738:	e00e      	b.n	8001758 <RCC_GetClocksFreq+0x15c>
 800173a:	6b31      	ldr	r1, [r6, #48]	; 0x30
 800173c:	2380      	movs	r3, #128	; 0x80
 800173e:	4011      	ands	r1, r2
 8001740:	031b      	lsls	r3, r3, #12
 8001742:	4299      	cmp	r1, r3
 8001744:	d102      	bne.n	800174c <RCC_GetClocksFreq+0x150>
 8001746:	2380      	movs	r3, #128	; 0x80
 8001748:	021b      	lsls	r3, r3, #8
 800174a:	e004      	b.n	8001756 <RCC_GetClocksFreq+0x15a>
 800174c:	6b33      	ldr	r3, [r6, #48]	; 0x30
 800174e:	4013      	ands	r3, r2
 8001750:	4293      	cmp	r3, r2
 8001752:	d101      	bne.n	8001758 <RCC_GetClocksFreq+0x15c>
 8001754:	4b06      	ldr	r3, [pc, #24]	; (8001770 <RCC_GetClocksFreq+0x174>)
 8001756:	6223      	str	r3, [r4, #32]
 8001758:	6b2b      	ldr	r3, [r5, #48]	; 0x30
 800175a:	061a      	lsls	r2, r3, #24
 800175c:	d402      	bmi.n	8001764 <RCC_GetClocksFreq+0x168>
 800175e:	4b05      	ldr	r3, [pc, #20]	; (8001774 <RCC_GetClocksFreq+0x178>)
 8001760:	6263      	str	r3, [r4, #36]	; 0x24
 8001762:	e000      	b.n	8001766 <RCC_GetClocksFreq+0x16a>
 8001764:	6260      	str	r0, [r4, #36]	; 0x24
 8001766:	bdf8      	pop	{r3, r4, r5, r6, r7, pc}
 8001768:	40021000 	.word	0x40021000
 800176c:	003d0900 	.word	0x003d0900
 8001770:	007a1200 	.word	0x007a1200
 8001774:	02dc6c00 	.word	0x02dc6c00
 8001778:	20000008 	.word	0x20000008
 800177c:	00d59f80 	.word	0x00d59f80
 8001780:	00008012 	.word	0x00008012

08001784 <RCC_AHBPeriphClockCmd>:
 8001784:	b538      	push	{r3, r4, r5, lr}
 8001786:	4b0d      	ldr	r3, [pc, #52]	; (80017bc <RCC_AHBPeriphClockCmd+0x38>)
 8001788:	1c04      	adds	r4, r0, #0
 800178a:	1c0d      	adds	r5, r1, #0
 800178c:	2000      	movs	r0, #0
 800178e:	421c      	tst	r4, r3
 8001790:	d102      	bne.n	8001798 <RCC_AHBPeriphClockCmd+0x14>
 8001792:	1c20      	adds	r0, r4, #0
 8001794:	1e43      	subs	r3, r0, #1
 8001796:	4198      	sbcs	r0, r3
 8001798:	f7ff fe58 	bl	800144c <assert_param>
 800179c:	2301      	movs	r3, #1
 800179e:	2000      	movs	r0, #0
 80017a0:	42ab      	cmp	r3, r5
 80017a2:	4140      	adcs	r0, r0
 80017a4:	f7ff fe52 	bl	800144c <assert_param>
 80017a8:	4b05      	ldr	r3, [pc, #20]	; (80017c0 <RCC_AHBPeriphClockCmd+0x3c>)
 80017aa:	695a      	ldr	r2, [r3, #20]
 80017ac:	2d00      	cmp	r5, #0
 80017ae:	d002      	beq.n	80017b6 <RCC_AHBPeriphClockCmd+0x32>
 80017b0:	4314      	orrs	r4, r2
 80017b2:	615c      	str	r4, [r3, #20]
 80017b4:	e001      	b.n	80017ba <RCC_AHBPeriphClockCmd+0x36>
 80017b6:	43a2      	bics	r2, r4
 80017b8:	615a      	str	r2, [r3, #20]
 80017ba:	bd38      	pop	{r3, r4, r5, pc}
 80017bc:	fe81ffa8 	.word	0xfe81ffa8
 80017c0:	40021000 	.word	0x40021000

080017c4 <RCC_APB2PeriphClockCmd>:
 80017c4:	b538      	push	{r3, r4, r5, lr}
 80017c6:	4b0d      	ldr	r3, [pc, #52]	; (80017fc <RCC_APB2PeriphClockCmd+0x38>)
 80017c8:	1c04      	adds	r4, r0, #0
 80017ca:	1c0d      	adds	r5, r1, #0
 80017cc:	2000      	movs	r0, #0
 80017ce:	421c      	tst	r4, r3
 80017d0:	d102      	bne.n	80017d8 <RCC_APB2PeriphClockCmd+0x14>
 80017d2:	1c20      	adds	r0, r4, #0
 80017d4:	1e43      	subs	r3, r0, #1
 80017d6:	4198      	sbcs	r0, r3
 80017d8:	f7ff fe38 	bl	800144c <assert_param>
 80017dc:	2301      	movs	r3, #1
 80017de:	2000      	movs	r0, #0
 80017e0:	42ab      	cmp	r3, r5
 80017e2:	4140      	adcs	r0, r0
 80017e4:	f7ff fe32 	bl	800144c <assert_param>
 80017e8:	4b05      	ldr	r3, [pc, #20]	; (8001800 <RCC_APB2PeriphClockCmd+0x3c>)
 80017ea:	699a      	ldr	r2, [r3, #24]
 80017ec:	2d00      	cmp	r5, #0
 80017ee:	d002      	beq.n	80017f6 <RCC_APB2PeriphClockCmd+0x32>
 80017f0:	4314      	orrs	r4, r2
 80017f2:	619c      	str	r4, [r3, #24]
 80017f4:	e001      	b.n	80017fa <RCC_APB2PeriphClockCmd+0x36>
 80017f6:	43a2      	bics	r2, r4
 80017f8:	619a      	str	r2, [r3, #24]
 80017fa:	bd38      	pop	{r3, r4, r5, pc}
 80017fc:	ffb8a51e 	.word	0xffb8a51e
 8001800:	40021000 	.word	0x40021000

08001804 <RCC_APB1PeriphClockCmd>:
 8001804:	b538      	push	{r3, r4, r5, lr}
 8001806:	4b0d      	ldr	r3, [pc, #52]	; (800183c <RCC_APB1PeriphClockCmd+0x38>)
 8001808:	1c04      	adds	r4, r0, #0
 800180a:	1c0d      	adds	r5, r1, #0
 800180c:	2000      	movs	r0, #0
 800180e:	421c      	tst	r4, r3
 8001810:	d102      	bne.n	8001818 <RCC_APB1PeriphClockCmd+0x14>
 8001812:	1c20      	adds	r0, r4, #0
 8001814:	1e43      	subs	r3, r0, #1
 8001816:	4198      	sbcs	r0, r3
 8001818:	f7ff fe18 	bl	800144c <assert_param>
 800181c:	2301      	movs	r3, #1
 800181e:	2000      	movs	r0, #0
 8001820:	42ab      	cmp	r3, r5
 8001822:	4140      	adcs	r0, r0
 8001824:	f7ff fe12 	bl	800144c <assert_param>
 8001828:	4b05      	ldr	r3, [pc, #20]	; (8001840 <RCC_APB1PeriphClockCmd+0x3c>)
 800182a:	69da      	ldr	r2, [r3, #28]
 800182c:	2d00      	cmp	r5, #0
 800182e:	d002      	beq.n	8001836 <RCC_APB1PeriphClockCmd+0x32>
 8001830:	4314      	orrs	r4, r2
 8001832:	61dc      	str	r4, [r3, #28]
 8001834:	e001      	b.n	800183a <RCC_APB1PeriphClockCmd+0x36>
 8001836:	43a2      	bics	r2, r4
 8001838:	61da      	str	r2, [r3, #28]
 800183a:	bd38      	pop	{r3, r4, r5, pc}
 800183c:	8581b6cc 	.word	0x8581b6cc
 8001840:	40021000 	.word	0x40021000

08001844 <RCC_APB2PeriphResetCmd>:
 8001844:	b538      	push	{r3, r4, r5, lr}
 8001846:	4b0d      	ldr	r3, [pc, #52]	; (800187c <RCC_APB2PeriphResetCmd+0x38>)
 8001848:	1c04      	adds	r4, r0, #0
 800184a:	1c0d      	adds	r5, r1, #0
 800184c:	2000      	movs	r0, #0
 800184e:	421c      	tst	r4, r3
 8001850:	d102      	bne.n	8001858 <RCC_APB2PeriphResetCmd+0x14>
 8001852:	1c20      	adds	r0, r4, #0
 8001854:	1e43      	subs	r3, r0, #1
 8001856:	4198      	sbcs	r0, r3
 8001858:	f7ff fdf8 	bl	800144c <assert_param>
 800185c:	2301      	movs	r3, #1
 800185e:	2000      	movs	r0, #0
 8001860:	42ab      	cmp	r3, r5
 8001862:	4140      	adcs	r0, r0
 8001864:	f7ff fdf2 	bl	800144c <assert_param>
 8001868:	4b05      	ldr	r3, [pc, #20]	; (8001880 <RCC_APB2PeriphResetCmd+0x3c>)
 800186a:	68da      	ldr	r2, [r3, #12]
 800186c:	2d00      	cmp	r5, #0
 800186e:	d002      	beq.n	8001876 <RCC_APB2PeriphResetCmd+0x32>
 8001870:	4314      	orrs	r4, r2
 8001872:	60dc      	str	r4, [r3, #12]
 8001874:	e001      	b.n	800187a <RCC_APB2PeriphResetCmd+0x36>
 8001876:	43a2      	bics	r2, r4
 8001878:	60da      	str	r2, [r3, #12]
 800187a:	bd38      	pop	{r3, r4, r5, pc}
 800187c:	ffb8a51e 	.word	0xffb8a51e
 8001880:	40021000 	.word	0x40021000

08001884 <RCC_GetFlagStatus>:
 8001884:	2310      	movs	r3, #16
 8001886:	b510      	push	{r4, lr}
 8001888:	1c04      	adds	r4, r0, #0
 800188a:	4398      	bics	r0, r3
 800188c:	2801      	cmp	r0, #1
 800188e:	d015      	beq.n	80018bc <RCC_GetFlagStatus+0x38>
 8001890:	2c19      	cmp	r4, #25
 8001892:	d012      	beq.n	80018ba <RCC_GetFlagStatus+0x36>
 8001894:	2340      	movs	r3, #64	; 0x40
 8001896:	1c22      	adds	r2, r4, #0
 8001898:	439a      	bics	r2, r3
 800189a:	2a21      	cmp	r2, #33	; 0x21
 800189c:	d00d      	beq.n	80018ba <RCC_GetFlagStatus+0x36>
 800189e:	2c41      	cmp	r4, #65	; 0x41
 80018a0:	d00b      	beq.n	80018ba <RCC_GetFlagStatus+0x36>
 80018a2:	1c23      	adds	r3, r4, #0
 80018a4:	3b59      	subs	r3, #89	; 0x59
 80018a6:	b2db      	uxtb	r3, r3
 80018a8:	2b06      	cmp	r3, #6
 80018aa:	d906      	bls.n	80018ba <RCC_GetFlagStatus+0x36>
 80018ac:	2c71      	cmp	r4, #113	; 0x71
 80018ae:	d004      	beq.n	80018ba <RCC_GetFlagStatus+0x36>
 80018b0:	1c20      	adds	r0, r4, #0
 80018b2:	3857      	subs	r0, #87	; 0x57
 80018b4:	4243      	negs	r3, r0
 80018b6:	4158      	adcs	r0, r3
 80018b8:	e000      	b.n	80018bc <RCC_GetFlagStatus+0x38>
 80018ba:	2001      	movs	r0, #1
 80018bc:	f7ff fdc6 	bl	800144c <assert_param>
 80018c0:	0962      	lsrs	r2, r4, #5
 80018c2:	4b0a      	ldr	r3, [pc, #40]	; (80018ec <RCC_GetFlagStatus+0x68>)
 80018c4:	d101      	bne.n	80018ca <RCC_GetFlagStatus+0x46>
 80018c6:	681b      	ldr	r3, [r3, #0]
 80018c8:	e008      	b.n	80018dc <RCC_GetFlagStatus+0x58>
 80018ca:	2a01      	cmp	r2, #1
 80018cc:	d101      	bne.n	80018d2 <RCC_GetFlagStatus+0x4e>
 80018ce:	6a1b      	ldr	r3, [r3, #32]
 80018d0:	e004      	b.n	80018dc <RCC_GetFlagStatus+0x58>
 80018d2:	2a02      	cmp	r2, #2
 80018d4:	d101      	bne.n	80018da <RCC_GetFlagStatus+0x56>
 80018d6:	6a5b      	ldr	r3, [r3, #36]	; 0x24
 80018d8:	e000      	b.n	80018dc <RCC_GetFlagStatus+0x58>
 80018da:	6b5b      	ldr	r3, [r3, #52]	; 0x34
 80018dc:	201f      	movs	r0, #31
 80018de:	4004      	ands	r4, r0
 80018e0:	1c18      	adds	r0, r3, #0
 80018e2:	40e0      	lsrs	r0, r4
 80018e4:	2201      	movs	r2, #1
 80018e6:	4010      	ands	r0, r2
 80018e8:	bd10      	pop	{r4, pc}
 80018ea:	46c0      	nop			; (mov r8, r8)
 80018ec:	40021000 	.word	0x40021000

080018f0 <NVIC_Init>:
 80018f0:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
 80018f2:	2500      	movs	r5, #0
 80018f4:	7883      	ldrb	r3, [r0, #2]
 80018f6:	1c04      	adds	r4, r0, #0
 80018f8:	2601      	movs	r6, #1
 80018fa:	1c28      	adds	r0, r5, #0
 80018fc:	429e      	cmp	r6, r3
 80018fe:	4168      	adcs	r0, r5
 8001900:	f7ff fda4 	bl	800144c <assert_param>
 8001904:	7863      	ldrb	r3, [r4, #1]
 8001906:	2703      	movs	r7, #3
 8001908:	1c28      	adds	r0, r5, #0
 800190a:	429f      	cmp	r7, r3
 800190c:	4168      	adcs	r0, r5
 800190e:	f7ff fd9d 	bl	800144c <assert_param>
 8001912:	78a2      	ldrb	r2, [r4, #2]
 8001914:	7823      	ldrb	r3, [r4, #0]
 8001916:	42aa      	cmp	r2, r5
 8001918:	d01a      	beq.n	8001950 <NVIC_Init+0x60>
 800191a:	0899      	lsrs	r1, r3, #2
 800191c:	4a0f      	ldr	r2, [pc, #60]	; (800195c <NVIC_Init+0x6c>)
 800191e:	0089      	lsls	r1, r1, #2
 8001920:	1889      	adds	r1, r1, r2
 8001922:	22c0      	movs	r2, #192	; 0xc0
 8001924:	0092      	lsls	r2, r2, #2
 8001926:	401f      	ands	r7, r3
 8001928:	20ff      	movs	r0, #255	; 0xff
 800192a:	588d      	ldr	r5, [r1, r2]
 800192c:	00ff      	lsls	r7, r7, #3
 800192e:	1c03      	adds	r3, r0, #0
 8001930:	40bb      	lsls	r3, r7
 8001932:	439d      	bics	r5, r3
 8001934:	7863      	ldrb	r3, [r4, #1]
 8001936:	019b      	lsls	r3, r3, #6
 8001938:	4018      	ands	r0, r3
 800193a:	40b8      	lsls	r0, r7
 800193c:	1c2f      	adds	r7, r5, #0
 800193e:	4307      	orrs	r7, r0
 8001940:	508f      	str	r7, [r1, r2]
 8001942:	7822      	ldrb	r2, [r4, #0]
 8001944:	231f      	movs	r3, #31
 8001946:	4013      	ands	r3, r2
 8001948:	409e      	lsls	r6, r3
 800194a:	4b04      	ldr	r3, [pc, #16]	; (800195c <NVIC_Init+0x6c>)
 800194c:	601e      	str	r6, [r3, #0]
 800194e:	e004      	b.n	800195a <NVIC_Init+0x6a>
 8001950:	271f      	movs	r7, #31
 8001952:	403b      	ands	r3, r7
 8001954:	4a02      	ldr	r2, [pc, #8]	; (8001960 <NVIC_Init+0x70>)
 8001956:	409e      	lsls	r6, r3
 8001958:	67d6      	str	r6, [r2, #124]	; 0x7c
 800195a:	bdf8      	pop	{r3, r4, r5, r6, r7, pc}
 800195c:	e000e100 	.word	0xe000e100
 8001960:	e000e104 	.word	0xe000e104

08001964 <ADC_DeInit>:
 8001964:	4b0a      	ldr	r3, [pc, #40]	; (8001990 <ADC_DeInit+0x2c>)
 8001966:	b510      	push	{r4, lr}
 8001968:	18c4      	adds	r4, r0, r3
 800196a:	4263      	negs	r3, r4
 800196c:	415c      	adcs	r4, r3
 800196e:	b2e4      	uxtb	r4, r4
 8001970:	1c20      	adds	r0, r4, #0
 8001972:	f7ff fd6b 	bl	800144c <assert_param>
 8001976:	2c00      	cmp	r4, #0
 8001978:	d009      	beq.n	800198e <ADC_DeInit+0x2a>
 800197a:	2080      	movs	r0, #128	; 0x80
 800197c:	0080      	lsls	r0, r0, #2
 800197e:	2101      	movs	r1, #1
 8001980:	f7ff ff60 	bl	8001844 <RCC_APB2PeriphResetCmd>
 8001984:	2080      	movs	r0, #128	; 0x80
 8001986:	0080      	lsls	r0, r0, #2
 8001988:	2100      	movs	r1, #0
 800198a:	f7ff ff5b 	bl	8001844 <RCC_APB2PeriphResetCmd>
 800198e:	bd10      	pop	{r4, pc}
 8001990:	bffedc00 	.word	0xbffedc00

08001994 <ADC_Init>:
 8001994:	b570      	push	{r4, r5, r6, lr}
 8001996:	1c0c      	adds	r4, r1, #0
 8001998:	4924      	ldr	r1, [pc, #144]	; (8001a2c <ADC_Init+0x98>)
 800199a:	1c05      	adds	r5, r0, #0
 800199c:	1840      	adds	r0, r0, r1
 800199e:	4243      	negs	r3, r0
 80019a0:	4158      	adcs	r0, r3
 80019a2:	f7ff fd53 	bl	800144c <assert_param>
 80019a6:	6820      	ldr	r0, [r4, #0]
 80019a8:	2318      	movs	r3, #24
 80019aa:	4398      	bics	r0, r3
 80019ac:	4243      	negs	r3, r0
 80019ae:	4158      	adcs	r0, r3
 80019b0:	f7ff fd4c 	bl	800144c <assert_param>
 80019b4:	7923      	ldrb	r3, [r4, #4]
 80019b6:	2601      	movs	r6, #1
 80019b8:	2000      	movs	r0, #0
 80019ba:	429e      	cmp	r6, r3
 80019bc:	4140      	adcs	r0, r0
 80019be:	f7ff fd45 	bl	800144c <assert_param>
 80019c2:	68a3      	ldr	r3, [r4, #8]
 80019c4:	481a      	ldr	r0, [pc, #104]	; (8001a30 <ADC_Init+0x9c>)
 80019c6:	4018      	ands	r0, r3
 80019c8:	4243      	negs	r3, r0
 80019ca:	4158      	adcs	r0, r3
 80019cc:	f7ff fd3e 	bl	800144c <assert_param>
 80019d0:	68e3      	ldr	r3, [r4, #12]
 80019d2:	22c0      	movs	r2, #192	; 0xc0
 80019d4:	1c19      	adds	r1, r3, #0
 80019d6:	4391      	bics	r1, r2
 80019d8:	1c30      	adds	r0, r6, #0
 80019da:	2900      	cmp	r1, #0
 80019dc:	d003      	beq.n	80019e6 <ADC_Init+0x52>
 80019de:	1e58      	subs	r0, r3, #1
 80019e0:	38ff      	subs	r0, #255	; 0xff
 80019e2:	4243      	negs	r3, r0
 80019e4:	4158      	adcs	r0, r3
 80019e6:	f7ff fd31 	bl	800144c <assert_param>
 80019ea:	6920      	ldr	r0, [r4, #16]
 80019ec:	2320      	movs	r3, #32
 80019ee:	4398      	bics	r0, r3
 80019f0:	4243      	negs	r3, r0
 80019f2:	4158      	adcs	r0, r3
 80019f4:	f7ff fd2a 	bl	800144c <assert_param>
 80019f8:	6960      	ldr	r0, [r4, #20]
 80019fa:	2304      	movs	r3, #4
 80019fc:	4398      	bics	r0, r3
 80019fe:	4243      	negs	r3, r0
 8001a00:	4158      	adcs	r0, r3
 8001a02:	f7ff fd23 	bl	800144c <assert_param>
 8001a06:	6823      	ldr	r3, [r4, #0]
 8001a08:	68a2      	ldr	r2, [r4, #8]
 8001a0a:	68e9      	ldr	r1, [r5, #12]
 8001a0c:	431a      	orrs	r2, r3
 8001a0e:	68e3      	ldr	r3, [r4, #12]
 8001a10:	431a      	orrs	r2, r3
 8001a12:	6923      	ldr	r3, [r4, #16]
 8001a14:	431a      	orrs	r2, r3
 8001a16:	6963      	ldr	r3, [r4, #20]
 8001a18:	431a      	orrs	r2, r3
 8001a1a:	4b06      	ldr	r3, [pc, #24]	; (8001a34 <ADC_Init+0xa0>)
 8001a1c:	400b      	ands	r3, r1
 8001a1e:	4313      	orrs	r3, r2
 8001a20:	7922      	ldrb	r2, [r4, #4]
 8001a22:	0352      	lsls	r2, r2, #13
 8001a24:	4313      	orrs	r3, r2
 8001a26:	60eb      	str	r3, [r5, #12]
 8001a28:	bd70      	pop	{r4, r5, r6, pc}
 8001a2a:	46c0      	nop			; (mov r8, r8)
 8001a2c:	bffedc00 	.word	0xbffedc00
 8001a30:	fffff3ff 	.word	0xfffff3ff
 8001a34:	ffffd203 	.word	0xffffd203

08001a38 <ADC_Cmd>:
 8001a38:	4b0c      	ldr	r3, [pc, #48]	; (8001a6c <ADC_Cmd+0x34>)
 8001a3a:	b570      	push	{r4, r5, r6, lr}
 8001a3c:	1c04      	adds	r4, r0, #0
 8001a3e:	18c0      	adds	r0, r0, r3
 8001a40:	4243      	negs	r3, r0
 8001a42:	4158      	adcs	r0, r3
 8001a44:	1c0e      	adds	r6, r1, #0
 8001a46:	2501      	movs	r5, #1
 8001a48:	f7ff fd00 	bl	800144c <assert_param>
 8001a4c:	2000      	movs	r0, #0
 8001a4e:	42b5      	cmp	r5, r6
 8001a50:	4140      	adcs	r0, r0
 8001a52:	f7ff fcfb 	bl	800144c <assert_param>
 8001a56:	68a3      	ldr	r3, [r4, #8]
 8001a58:	2e00      	cmp	r6, #0
 8001a5a:	d002      	beq.n	8001a62 <ADC_Cmd+0x2a>
 8001a5c:	431d      	orrs	r5, r3
 8001a5e:	60a5      	str	r5, [r4, #8]
 8001a60:	e002      	b.n	8001a68 <ADC_Cmd+0x30>
 8001a62:	2202      	movs	r2, #2
 8001a64:	4313      	orrs	r3, r2
 8001a66:	60a3      	str	r3, [r4, #8]
 8001a68:	bd70      	pop	{r4, r5, r6, pc}
 8001a6a:	46c0      	nop			; (mov r8, r8)
 8001a6c:	bffedc00 	.word	0xbffedc00

08001a70 <ADC_TempSensorCmd>:
 8001a70:	2301      	movs	r3, #1
 8001a72:	b510      	push	{r4, lr}
 8001a74:	1c04      	adds	r4, r0, #0
 8001a76:	2000      	movs	r0, #0
 8001a78:	42a3      	cmp	r3, r4
 8001a7a:	4140      	adcs	r0, r0
 8001a7c:	f7ff fce6 	bl	800144c <assert_param>
 8001a80:	4b05      	ldr	r3, [pc, #20]	; (8001a98 <ADC_TempSensorCmd+0x28>)
 8001a82:	6819      	ldr	r1, [r3, #0]
 8001a84:	2c00      	cmp	r4, #0
 8001a86:	d003      	beq.n	8001a90 <ADC_TempSensorCmd+0x20>
 8001a88:	2280      	movs	r2, #128	; 0x80
 8001a8a:	0412      	lsls	r2, r2, #16
 8001a8c:	430a      	orrs	r2, r1
 8001a8e:	e001      	b.n	8001a94 <ADC_TempSensorCmd+0x24>
 8001a90:	4a02      	ldr	r2, [pc, #8]	; (8001a9c <ADC_TempSensorCmd+0x2c>)
 8001a92:	400a      	ands	r2, r1
 8001a94:	601a      	str	r2, [r3, #0]
 8001a96:	bd10      	pop	{r4, pc}
 8001a98:	40012708 	.word	0x40012708
 8001a9c:	ff7fffff 	.word	0xff7fffff

08001aa0 <ADC_ChannelConfig>:
 8001aa0:	4b0e      	ldr	r3, [pc, #56]	; (8001adc <ADC_ChannelConfig+0x3c>)
 8001aa2:	b570      	push	{r4, r5, r6, lr}
 8001aa4:	1c04      	adds	r4, r0, #0
 8001aa6:	18c0      	adds	r0, r0, r3
 8001aa8:	4243      	negs	r3, r0
 8001aaa:	4158      	adcs	r0, r3
 8001aac:	1c0d      	adds	r5, r1, #0
 8001aae:	1c16      	adds	r6, r2, #0
 8001ab0:	f7ff fccc 	bl	800144c <assert_param>
 8001ab4:	2000      	movs	r0, #0
 8001ab6:	4285      	cmp	r5, r0
 8001ab8:	d002      	beq.n	8001ac0 <ADC_ChannelConfig+0x20>
 8001aba:	0ce8      	lsrs	r0, r5, #19
 8001abc:	4243      	negs	r3, r0
 8001abe:	4158      	adcs	r0, r3
 8001ac0:	f7ff fcc4 	bl	800144c <assert_param>
 8001ac4:	2307      	movs	r3, #7
 8001ac6:	2000      	movs	r0, #0
 8001ac8:	42b3      	cmp	r3, r6
 8001aca:	4140      	adcs	r0, r0
 8001acc:	f7ff fcbe 	bl	800144c <assert_param>
 8001ad0:	6aa3      	ldr	r3, [r4, #40]	; 0x28
 8001ad2:	431d      	orrs	r5, r3
 8001ad4:	62a5      	str	r5, [r4, #40]	; 0x28
 8001ad6:	6166      	str	r6, [r4, #20]
 8001ad8:	bd70      	pop	{r4, r5, r6, pc}
 8001ada:	46c0      	nop			; (mov r8, r8)
 8001adc:	bffedc00 	.word	0xbffedc00

08001ae0 <ADC_GetCalibrationFactor>:
 8001ae0:	4b0e      	ldr	r3, [pc, #56]	; (8001b1c <ADC_GetCalibrationFactor+0x3c>)
 8001ae2:	b510      	push	{r4, lr}
 8001ae4:	1c04      	adds	r4, r0, #0
 8001ae6:	18c0      	adds	r0, r0, r3
 8001ae8:	4243      	negs	r3, r0
 8001aea:	4158      	adcs	r0, r3
 8001aec:	f7ff fcae 	bl	800144c <assert_param>
 8001af0:	68a2      	ldr	r2, [r4, #8]
 8001af2:	2380      	movs	r3, #128	; 0x80
 8001af4:	061b      	lsls	r3, r3, #24
 8001af6:	4313      	orrs	r3, r2
 8001af8:	60a3      	str	r3, [r4, #8]
 8001afa:	23f0      	movs	r3, #240	; 0xf0
 8001afc:	021b      	lsls	r3, r3, #8
 8001afe:	68a2      	ldr	r2, [r4, #8]
 8001b00:	3b01      	subs	r3, #1
 8001b02:	0fd2      	lsrs	r2, r2, #31
 8001b04:	07d2      	lsls	r2, r2, #31
 8001b06:	2b00      	cmp	r3, #0
 8001b08:	d001      	beq.n	8001b0e <ADC_GetCalibrationFactor+0x2e>
 8001b0a:	2a00      	cmp	r2, #0
 8001b0c:	d1f7      	bne.n	8001afe <ADC_GetCalibrationFactor+0x1e>
 8001b0e:	68a3      	ldr	r3, [r4, #8]
 8001b10:	2b00      	cmp	r3, #0
 8001b12:	db01      	blt.n	8001b18 <ADC_GetCalibrationFactor+0x38>
 8001b14:	6c20      	ldr	r0, [r4, #64]	; 0x40
 8001b16:	e000      	b.n	8001b1a <ADC_GetCalibrationFactor+0x3a>
 8001b18:	2000      	movs	r0, #0
 8001b1a:	bd10      	pop	{r4, pc}
 8001b1c:	bffedc00 	.word	0xbffedc00

08001b20 <ADC_StartOfConversion>:
 8001b20:	4b06      	ldr	r3, [pc, #24]	; (8001b3c <ADC_StartOfConversion+0x1c>)
 8001b22:	b510      	push	{r4, lr}
 8001b24:	1c04      	adds	r4, r0, #0
 8001b26:	18c0      	adds	r0, r0, r3
 8001b28:	4243      	negs	r3, r0
 8001b2a:	4158      	adcs	r0, r3
 8001b2c:	f7ff fc8e 	bl	800144c <assert_param>
 8001b30:	68a3      	ldr	r3, [r4, #8]
 8001b32:	2204      	movs	r2, #4
 8001b34:	4313      	orrs	r3, r2
 8001b36:	60a3      	str	r3, [r4, #8]
 8001b38:	bd10      	pop	{r4, pc}
 8001b3a:	46c0      	nop			; (mov r8, r8)
 8001b3c:	bffedc00 	.word	0xbffedc00

08001b40 <ADC_GetConversionValue>:
 8001b40:	4b05      	ldr	r3, [pc, #20]	; (8001b58 <ADC_GetConversionValue+0x18>)
 8001b42:	b510      	push	{r4, lr}
 8001b44:	1c04      	adds	r4, r0, #0
 8001b46:	18c0      	adds	r0, r0, r3
 8001b48:	4243      	negs	r3, r0
 8001b4a:	4158      	adcs	r0, r3
 8001b4c:	f7ff fc7e 	bl	800144c <assert_param>
 8001b50:	6c20      	ldr	r0, [r4, #64]	; 0x40
 8001b52:	b280      	uxth	r0, r0
 8001b54:	bd10      	pop	{r4, pc}
 8001b56:	46c0      	nop			; (mov r8, r8)
 8001b58:	bffedc00 	.word	0xbffedc00

08001b5c <ADC_GetFlagStatus>:
 8001b5c:	4a15      	ldr	r2, [pc, #84]	; (8001bb4 <ADC_GetFlagStatus+0x58>)
 8001b5e:	b570      	push	{r4, r5, r6, lr}
 8001b60:	1c05      	adds	r5, r0, #0
 8001b62:	1880      	adds	r0, r0, r2
 8001b64:	1c0c      	adds	r4, r1, #0
 8001b66:	4243      	negs	r3, r0
 8001b68:	4158      	adcs	r0, r3
 8001b6a:	4e13      	ldr	r6, [pc, #76]	; (8001bb8 <ADC_GetFlagStatus+0x5c>)
 8001b6c:	f7ff fc6e 	bl	800144c <assert_param>
 8001b70:	1c23      	adds	r3, r4, #0
 8001b72:	4033      	ands	r3, r6
 8001b74:	1e5a      	subs	r2, r3, #1
 8001b76:	2a01      	cmp	r2, #1
 8001b78:	d90d      	bls.n	8001b96 <ADC_GetFlagStatus+0x3a>
 8001b7a:	2b04      	cmp	r3, #4
 8001b7c:	d00b      	beq.n	8001b96 <ADC_GetFlagStatus+0x3a>
 8001b7e:	2c08      	cmp	r4, #8
 8001b80:	d009      	beq.n	8001b96 <ADC_GetFlagStatus+0x3a>
 8001b82:	2c80      	cmp	r4, #128	; 0x80
 8001b84:	d007      	beq.n	8001b96 <ADC_GetFlagStatus+0x3a>
 8001b86:	2b10      	cmp	r3, #16
 8001b88:	d005      	beq.n	8001b96 <ADC_GetFlagStatus+0x3a>
 8001b8a:	22fe      	movs	r2, #254	; 0xfe
 8001b8c:	05d2      	lsls	r2, r2, #23
 8001b8e:	18a3      	adds	r3, r4, r2
 8001b90:	4258      	negs	r0, r3
 8001b92:	4158      	adcs	r0, r3
 8001b94:	e000      	b.n	8001b98 <ADC_GetFlagStatus+0x3c>
 8001b96:	2001      	movs	r0, #1
 8001b98:	f7ff fc58 	bl	800144c <assert_param>
 8001b9c:	01e3      	lsls	r3, r4, #7
 8001b9e:	d502      	bpl.n	8001ba6 <ADC_GetFlagStatus+0x4a>
 8001ba0:	68ab      	ldr	r3, [r5, #8]
 8001ba2:	401e      	ands	r6, r3
 8001ba4:	e000      	b.n	8001ba8 <ADC_GetFlagStatus+0x4c>
 8001ba6:	682e      	ldr	r6, [r5, #0]
 8001ba8:	4026      	ands	r6, r4
 8001baa:	1e74      	subs	r4, r6, #1
 8001bac:	41a6      	sbcs	r6, r4
 8001bae:	b2f0      	uxtb	r0, r6
 8001bb0:	bd70      	pop	{r4, r5, r6, pc}
 8001bb2:	46c0      	nop			; (mov r8, r8)
 8001bb4:	bffedc00 	.word	0xbffedc00
 8001bb8:	feffffff 	.word	0xfeffffff

08001bbc <ADC_ClearFlag>:
 8001bbc:	b538      	push	{r3, r4, r5, lr}
 8001bbe:	4b0a      	ldr	r3, [pc, #40]	; (8001be8 <ADC_ClearFlag+0x2c>)
 8001bc0:	1c05      	adds	r5, r0, #0
 8001bc2:	18c0      	adds	r0, r0, r3
 8001bc4:	4243      	negs	r3, r0
 8001bc6:	4158      	adcs	r0, r3
 8001bc8:	1c0c      	adds	r4, r1, #0
 8001bca:	f7ff fc3f 	bl	800144c <assert_param>
 8001bce:	2000      	movs	r0, #0
 8001bd0:	4284      	cmp	r4, r0
 8001bd2:	d004      	beq.n	8001bde <ADC_ClearFlag+0x22>
 8001bd4:	239f      	movs	r3, #159	; 0x9f
 8001bd6:	1c20      	adds	r0, r4, #0
 8001bd8:	4398      	bics	r0, r3
 8001bda:	4243      	negs	r3, r0
 8001bdc:	4158      	adcs	r0, r3
 8001bde:	f7ff fc35 	bl	800144c <assert_param>
 8001be2:	602c      	str	r4, [r5, #0]
 8001be4:	bd38      	pop	{r3, r4, r5, pc}
 8001be6:	46c0      	nop			; (mov r8, r8)
 8001be8:	bffedc00 	.word	0xbffedc00

08001bec <GPIO_Init>:
 8001bec:	2390      	movs	r3, #144	; 0x90
 8001bee:	b5f7      	push	{r0, r1, r2, r4, r5, r6, r7, lr}
 8001bf0:	05db      	lsls	r3, r3, #23
 8001bf2:	1c04      	adds	r4, r0, #0
 8001bf4:	1c0d      	adds	r5, r1, #0
 8001bf6:	4298      	cmp	r0, r3
 8001bf8:	d010      	beq.n	8001c1c <GPIO_Init+0x30>
 8001bfa:	4b39      	ldr	r3, [pc, #228]	; (8001ce0 <GPIO_Init+0xf4>)
 8001bfc:	4298      	cmp	r0, r3
 8001bfe:	d00d      	beq.n	8001c1c <GPIO_Init+0x30>
 8001c00:	4b38      	ldr	r3, [pc, #224]	; (8001ce4 <GPIO_Init+0xf8>)
 8001c02:	4298      	cmp	r0, r3
 8001c04:	d00a      	beq.n	8001c1c <GPIO_Init+0x30>
 8001c06:	4b38      	ldr	r3, [pc, #224]	; (8001ce8 <GPIO_Init+0xfc>)
 8001c08:	4298      	cmp	r0, r3
 8001c0a:	d007      	beq.n	8001c1c <GPIO_Init+0x30>
 8001c0c:	4b37      	ldr	r3, [pc, #220]	; (8001cec <GPIO_Init+0x100>)
 8001c0e:	4298      	cmp	r0, r3
 8001c10:	d004      	beq.n	8001c1c <GPIO_Init+0x30>
 8001c12:	4a37      	ldr	r2, [pc, #220]	; (8001cf0 <GPIO_Init+0x104>)
 8001c14:	1880      	adds	r0, r0, r2
 8001c16:	4243      	negs	r3, r0
 8001c18:	4158      	adcs	r0, r3
 8001c1a:	e000      	b.n	8001c1e <GPIO_Init+0x32>
 8001c1c:	2001      	movs	r0, #1
 8001c1e:	f7ff fc15 	bl	800144c <assert_param>
 8001c22:	6828      	ldr	r0, [r5, #0]
 8001c24:	2600      	movs	r6, #0
 8001c26:	1e43      	subs	r3, r0, #1
 8001c28:	4198      	sbcs	r0, r3
 8001c2a:	f7ff fc0f 	bl	800144c <assert_param>
 8001c2e:	792b      	ldrb	r3, [r5, #4]
 8001c30:	2203      	movs	r2, #3
 8001c32:	1c30      	adds	r0, r6, #0
 8001c34:	429a      	cmp	r2, r3
 8001c36:	4170      	adcs	r0, r6
 8001c38:	f7ff fc08 	bl	800144c <assert_param>
 8001c3c:	79eb      	ldrb	r3, [r5, #7]
 8001c3e:	2202      	movs	r2, #2
 8001c40:	1c30      	adds	r0, r6, #0
 8001c42:	429a      	cmp	r2, r3
 8001c44:	4170      	adcs	r0, r6
 8001c46:	f7ff fc01 	bl	800144c <assert_param>
 8001c4a:	2001      	movs	r0, #1
 8001c4c:	1c03      	adds	r3, r0, #0
 8001c4e:	682a      	ldr	r2, [r5, #0]
 8001c50:	40b3      	lsls	r3, r6
 8001c52:	401a      	ands	r2, r3
 8001c54:	9201      	str	r2, [sp, #4]
 8001c56:	429a      	cmp	r2, r3
 8001c58:	d13d      	bne.n	8001cd6 <GPIO_Init+0xea>
 8001c5a:	792b      	ldrb	r3, [r5, #4]
 8001c5c:	0077      	lsls	r7, r6, #1
 8001c5e:	3b01      	subs	r3, #1
 8001c60:	b2db      	uxtb	r3, r3
 8001c62:	4283      	cmp	r3, r0
 8001c64:	d823      	bhi.n	8001cae <GPIO_Init+0xc2>
 8001c66:	796b      	ldrb	r3, [r5, #5]
 8001c68:	4283      	cmp	r3, r0
 8001c6a:	d902      	bls.n	8001c72 <GPIO_Init+0x86>
 8001c6c:	1ed8      	subs	r0, r3, #3
 8001c6e:	4243      	negs	r3, r0
 8001c70:	4158      	adcs	r0, r3
 8001c72:	f7ff fbeb 	bl	800144c <assert_param>
 8001c76:	68a3      	ldr	r3, [r4, #8]
 8001c78:	2203      	movs	r2, #3
 8001c7a:	40ba      	lsls	r2, r7
 8001c7c:	4393      	bics	r3, r2
 8001c7e:	60a3      	str	r3, [r4, #8]
 8001c80:	796b      	ldrb	r3, [r5, #5]
 8001c82:	68a2      	ldr	r2, [r4, #8]
 8001c84:	40bb      	lsls	r3, r7
 8001c86:	4313      	orrs	r3, r2
 8001c88:	60a3      	str	r3, [r4, #8]
 8001c8a:	79ab      	ldrb	r3, [r5, #6]
 8001c8c:	2201      	movs	r2, #1
 8001c8e:	2000      	movs	r0, #0
 8001c90:	429a      	cmp	r2, r3
 8001c92:	4140      	adcs	r0, r0
 8001c94:	f7ff fbda 	bl	800144c <assert_param>
 8001c98:	6863      	ldr	r3, [r4, #4]
 8001c9a:	9a01      	ldr	r2, [sp, #4]
 8001c9c:	b29b      	uxth	r3, r3
 8001c9e:	4393      	bics	r3, r2
 8001ca0:	80a3      	strh	r3, [r4, #4]
 8001ca2:	79ab      	ldrb	r3, [r5, #6]
 8001ca4:	6862      	ldr	r2, [r4, #4]
 8001ca6:	40b3      	lsls	r3, r6
 8001ca8:	4313      	orrs	r3, r2
 8001caa:	b29b      	uxth	r3, r3
 8001cac:	80a3      	strh	r3, [r4, #4]
 8001cae:	2303      	movs	r3, #3
 8001cb0:	6822      	ldr	r2, [r4, #0]
 8001cb2:	40bb      	lsls	r3, r7
 8001cb4:	43db      	mvns	r3, r3
 8001cb6:	401a      	ands	r2, r3
 8001cb8:	6022      	str	r2, [r4, #0]
 8001cba:	792a      	ldrb	r2, [r5, #4]
 8001cbc:	6821      	ldr	r1, [r4, #0]
 8001cbe:	40ba      	lsls	r2, r7
 8001cc0:	430a      	orrs	r2, r1
 8001cc2:	6022      	str	r2, [r4, #0]
 8001cc4:	68e2      	ldr	r2, [r4, #12]
 8001cc6:	4013      	ands	r3, r2
 8001cc8:	79ea      	ldrb	r2, [r5, #7]
 8001cca:	60e3      	str	r3, [r4, #12]
 8001ccc:	68e3      	ldr	r3, [r4, #12]
 8001cce:	40ba      	lsls	r2, r7
 8001cd0:	1c17      	adds	r7, r2, #0
 8001cd2:	431f      	orrs	r7, r3
 8001cd4:	60e7      	str	r7, [r4, #12]
 8001cd6:	3601      	adds	r6, #1
 8001cd8:	2e10      	cmp	r6, #16
 8001cda:	d1b6      	bne.n	8001c4a <GPIO_Init+0x5e>
 8001cdc:	bdf7      	pop	{r0, r1, r2, r4, r5, r6, r7, pc}
 8001cde:	46c0      	nop			; (mov r8, r8)
 8001ce0:	48000400 	.word	0x48000400
 8001ce4:	48000800 	.word	0x48000800
 8001ce8:	48000c00 	.word	0x48000c00
 8001cec:	48001000 	.word	0x48001000
 8001cf0:	b7ffec00 	.word	0xb7ffec00

08001cf4 <GPIO_PinAFConfig>:
 8001cf4:	b5f7      	push	{r0, r1, r2, r4, r5, r6, r7, lr}
 8001cf6:	2390      	movs	r3, #144	; 0x90
 8001cf8:	1c04      	adds	r4, r0, #0
 8001cfa:	1c0e      	adds	r6, r1, #0
 8001cfc:	9201      	str	r2, [sp, #4]
 8001cfe:	05db      	lsls	r3, r3, #23
 8001d00:	4298      	cmp	r0, r3
 8001d02:	d010      	beq.n	8001d26 <GPIO_PinAFConfig+0x32>
 8001d04:	4b19      	ldr	r3, [pc, #100]	; (8001d6c <GPIO_PinAFConfig+0x78>)
 8001d06:	4298      	cmp	r0, r3
 8001d08:	d00d      	beq.n	8001d26 <GPIO_PinAFConfig+0x32>
 8001d0a:	4b19      	ldr	r3, [pc, #100]	; (8001d70 <GPIO_PinAFConfig+0x7c>)
 8001d0c:	4298      	cmp	r0, r3
 8001d0e:	d00a      	beq.n	8001d26 <GPIO_PinAFConfig+0x32>
 8001d10:	4b18      	ldr	r3, [pc, #96]	; (8001d74 <GPIO_PinAFConfig+0x80>)
 8001d12:	4298      	cmp	r0, r3
 8001d14:	d007      	beq.n	8001d26 <GPIO_PinAFConfig+0x32>
 8001d16:	4b18      	ldr	r3, [pc, #96]	; (8001d78 <GPIO_PinAFConfig+0x84>)
 8001d18:	4298      	cmp	r0, r3
 8001d1a:	d004      	beq.n	8001d26 <GPIO_PinAFConfig+0x32>
 8001d1c:	4a17      	ldr	r2, [pc, #92]	; (8001d7c <GPIO_PinAFConfig+0x88>)
 8001d1e:	1880      	adds	r0, r0, r2
 8001d20:	4243      	negs	r3, r0
 8001d22:	4158      	adcs	r0, r3
 8001d24:	e000      	b.n	8001d28 <GPIO_PinAFConfig+0x34>
 8001d26:	2001      	movs	r0, #1
 8001d28:	2500      	movs	r5, #0
 8001d2a:	f7ff fb8f 	bl	800144c <assert_param>
 8001d2e:	230f      	movs	r3, #15
 8001d30:	1c28      	adds	r0, r5, #0
 8001d32:	42b3      	cmp	r3, r6
 8001d34:	4168      	adcs	r0, r5
 8001d36:	f7ff fb89 	bl	800144c <assert_param>
 8001d3a:	9a01      	ldr	r2, [sp, #4]
 8001d3c:	1c28      	adds	r0, r5, #0
 8001d3e:	2707      	movs	r7, #7
 8001d40:	4297      	cmp	r7, r2
 8001d42:	4168      	adcs	r0, r5
 8001d44:	4037      	ands	r7, r6
 8001d46:	08f6      	lsrs	r6, r6, #3
 8001d48:	00b6      	lsls	r6, r6, #2
 8001d4a:	19a4      	adds	r4, r4, r6
 8001d4c:	f7ff fb7e 	bl	800144c <assert_param>
 8001d50:	00bf      	lsls	r7, r7, #2
 8001d52:	6a23      	ldr	r3, [r4, #32]
 8001d54:	220f      	movs	r2, #15
 8001d56:	40ba      	lsls	r2, r7
 8001d58:	4393      	bics	r3, r2
 8001d5a:	9a01      	ldr	r2, [sp, #4]
 8001d5c:	6223      	str	r3, [r4, #32]
 8001d5e:	6a23      	ldr	r3, [r4, #32]
 8001d60:	40ba      	lsls	r2, r7
 8001d62:	1c17      	adds	r7, r2, #0
 8001d64:	431f      	orrs	r7, r3
 8001d66:	6227      	str	r7, [r4, #32]
 8001d68:	bdf7      	pop	{r0, r1, r2, r4, r5, r6, r7, pc}
 8001d6a:	46c0      	nop			; (mov r8, r8)
 8001d6c:	48000400 	.word	0x48000400
 8001d70:	48000800 	.word	0x48000800
 8001d74:	48000c00 	.word	0x48000c00
 8001d78:	48001000 	.word	0x48001000
 8001d7c:	b7ffec00 	.word	0xb7ffec00

08001d80 <USART_Init>:
 8001d80:	b5f0      	push	{r4, r5, r6, r7, lr}
 8001d82:	4e53      	ldr	r6, [pc, #332]	; (8001ed0 <USART_Init+0x150>)
 8001d84:	b08b      	sub	sp, #44	; 0x2c
 8001d86:	1c04      	adds	r4, r0, #0
 8001d88:	1c0d      	adds	r5, r1, #0
 8001d8a:	42b0      	cmp	r0, r6
 8001d8c:	d016      	beq.n	8001dbc <USART_Init+0x3c>
 8001d8e:	4b51      	ldr	r3, [pc, #324]	; (8001ed4 <USART_Init+0x154>)
 8001d90:	4298      	cmp	r0, r3
 8001d92:	d013      	beq.n	8001dbc <USART_Init+0x3c>
 8001d94:	4b50      	ldr	r3, [pc, #320]	; (8001ed8 <USART_Init+0x158>)
 8001d96:	4298      	cmp	r0, r3
 8001d98:	d010      	beq.n	8001dbc <USART_Init+0x3c>
 8001d9a:	4b50      	ldr	r3, [pc, #320]	; (8001edc <USART_Init+0x15c>)
 8001d9c:	4298      	cmp	r0, r3
 8001d9e:	d00d      	beq.n	8001dbc <USART_Init+0x3c>
 8001da0:	4b4f      	ldr	r3, [pc, #316]	; (8001ee0 <USART_Init+0x160>)
 8001da2:	4298      	cmp	r0, r3
 8001da4:	d00a      	beq.n	8001dbc <USART_Init+0x3c>
 8001da6:	4b4f      	ldr	r3, [pc, #316]	; (8001ee4 <USART_Init+0x164>)
 8001da8:	4298      	cmp	r0, r3
 8001daa:	d007      	beq.n	8001dbc <USART_Init+0x3c>
 8001dac:	4b4e      	ldr	r3, [pc, #312]	; (8001ee8 <USART_Init+0x168>)
 8001dae:	4298      	cmp	r0, r3
 8001db0:	d004      	beq.n	8001dbc <USART_Init+0x3c>
 8001db2:	494e      	ldr	r1, [pc, #312]	; (8001eec <USART_Init+0x16c>)
 8001db4:	1840      	adds	r0, r0, r1
 8001db6:	4243      	negs	r3, r0
 8001db8:	4158      	adcs	r0, r3
 8001dba:	e000      	b.n	8001dbe <USART_Init+0x3e>
 8001dbc:	2001      	movs	r0, #1
 8001dbe:	f7ff fb45 	bl	800144c <assert_param>
 8001dc2:	682b      	ldr	r3, [r5, #0]
 8001dc4:	4a4a      	ldr	r2, [pc, #296]	; (8001ef0 <USART_Init+0x170>)
 8001dc6:	3b01      	subs	r3, #1
 8001dc8:	2000      	movs	r0, #0
 8001dca:	429a      	cmp	r2, r3
 8001dcc:	4140      	adcs	r0, r0
 8001dce:	f7ff fb3d 	bl	800144c <assert_param>
 8001dd2:	686b      	ldr	r3, [r5, #4]
 8001dd4:	4a47      	ldr	r2, [pc, #284]	; (8001ef4 <USART_Init+0x174>)
 8001dd6:	2001      	movs	r0, #1
 8001dd8:	4213      	tst	r3, r2
 8001dda:	d003      	beq.n	8001de4 <USART_Init+0x64>
 8001ddc:	4a46      	ldr	r2, [pc, #280]	; (8001ef8 <USART_Init+0x178>)
 8001dde:	1898      	adds	r0, r3, r2
 8001de0:	4243      	negs	r3, r0
 8001de2:	4158      	adcs	r0, r3
 8001de4:	f7ff fb32 	bl	800144c <assert_param>
 8001de8:	68ab      	ldr	r3, [r5, #8]
 8001dea:	4a44      	ldr	r2, [pc, #272]	; (8001efc <USART_Init+0x17c>)
 8001dec:	2001      	movs	r0, #1
 8001dee:	4213      	tst	r3, r2
 8001df0:	d003      	beq.n	8001dfa <USART_Init+0x7a>
 8001df2:	4943      	ldr	r1, [pc, #268]	; (8001f00 <USART_Init+0x180>)
 8001df4:	1858      	adds	r0, r3, r1
 8001df6:	4243      	negs	r3, r0
 8001df8:	4158      	adcs	r0, r3
 8001dfa:	f7ff fb27 	bl	800144c <assert_param>
 8001dfe:	68eb      	ldr	r3, [r5, #12]
 8001e00:	4a40      	ldr	r2, [pc, #256]	; (8001f04 <USART_Init+0x184>)
 8001e02:	2001      	movs	r0, #1
 8001e04:	4213      	tst	r3, r2
 8001e06:	d003      	beq.n	8001e10 <USART_Init+0x90>
 8001e08:	4a3f      	ldr	r2, [pc, #252]	; (8001f08 <USART_Init+0x188>)
 8001e0a:	1898      	adds	r0, r3, r2
 8001e0c:	4243      	negs	r3, r0
 8001e0e:	4158      	adcs	r0, r3
 8001e10:	f7ff fb1c 	bl	800144c <assert_param>
 8001e14:	692b      	ldr	r3, [r5, #16]
 8001e16:	220c      	movs	r2, #12
 8001e18:	1c19      	adds	r1, r3, #0
 8001e1a:	2000      	movs	r0, #0
 8001e1c:	4391      	bics	r1, r2
 8001e1e:	4281      	cmp	r1, r0
 8001e20:	d102      	bne.n	8001e28 <USART_Init+0xa8>
 8001e22:	1c18      	adds	r0, r3, #0
 8001e24:	1e43      	subs	r3, r0, #1
 8001e26:	4198      	sbcs	r0, r3
 8001e28:	f7ff fb10 	bl	800144c <assert_param>
 8001e2c:	4f37      	ldr	r7, [pc, #220]	; (8001f0c <USART_Init+0x18c>)
 8001e2e:	6968      	ldr	r0, [r5, #20]
 8001e30:	4038      	ands	r0, r7
 8001e32:	4243      	negs	r3, r0
 8001e34:	4158      	adcs	r0, r3
 8001e36:	f7ff fb09 	bl	800144c <assert_param>
 8001e3a:	6823      	ldr	r3, [r4, #0]
 8001e3c:	2201      	movs	r2, #1
 8001e3e:	4393      	bics	r3, r2
 8001e40:	6023      	str	r3, [r4, #0]
 8001e42:	6862      	ldr	r2, [r4, #4]
 8001e44:	4b32      	ldr	r3, [pc, #200]	; (8001f10 <USART_Init+0x190>)
 8001e46:	6869      	ldr	r1, [r5, #4]
 8001e48:	4013      	ands	r3, r2
 8001e4a:	68aa      	ldr	r2, [r5, #8]
 8001e4c:	4668      	mov	r0, sp
 8001e4e:	4313      	orrs	r3, r2
 8001e50:	6063      	str	r3, [r4, #4]
 8001e52:	6822      	ldr	r2, [r4, #0]
 8001e54:	4b2f      	ldr	r3, [pc, #188]	; (8001f14 <USART_Init+0x194>)
 8001e56:	401a      	ands	r2, r3
 8001e58:	68eb      	ldr	r3, [r5, #12]
 8001e5a:	430b      	orrs	r3, r1
 8001e5c:	6929      	ldr	r1, [r5, #16]
 8001e5e:	430b      	orrs	r3, r1
 8001e60:	4313      	orrs	r3, r2
 8001e62:	6023      	str	r3, [r4, #0]
 8001e64:	68a3      	ldr	r3, [r4, #8]
 8001e66:	696a      	ldr	r2, [r5, #20]
 8001e68:	401f      	ands	r7, r3
 8001e6a:	4317      	orrs	r7, r2
 8001e6c:	60a7      	str	r7, [r4, #8]
 8001e6e:	f7ff fbc5 	bl	80015fc <RCC_GetClocksFreq>
 8001e72:	42b4      	cmp	r4, r6
 8001e74:	d101      	bne.n	8001e7a <USART_Init+0xfa>
 8001e76:	9e06      	ldr	r6, [sp, #24]
 8001e78:	e00a      	b.n	8001e90 <USART_Init+0x110>
 8001e7a:	4b16      	ldr	r3, [pc, #88]	; (8001ed4 <USART_Init+0x154>)
 8001e7c:	429c      	cmp	r4, r3
 8001e7e:	d101      	bne.n	8001e84 <USART_Init+0x104>
 8001e80:	9e07      	ldr	r6, [sp, #28]
 8001e82:	e005      	b.n	8001e90 <USART_Init+0x110>
 8001e84:	4b14      	ldr	r3, [pc, #80]	; (8001ed8 <USART_Init+0x158>)
 8001e86:	429c      	cmp	r4, r3
 8001e88:	d101      	bne.n	8001e8e <USART_Init+0x10e>
 8001e8a:	9e08      	ldr	r6, [sp, #32]
 8001e8c:	e000      	b.n	8001e90 <USART_Init+0x110>
 8001e8e:	9e02      	ldr	r6, [sp, #8]
 8001e90:	6823      	ldr	r3, [r4, #0]
 8001e92:	682f      	ldr	r7, [r5, #0]
 8001e94:	0419      	lsls	r1, r3, #16
 8001e96:	d500      	bpl.n	8001e9a <USART_Init+0x11a>
 8001e98:	0076      	lsls	r6, r6, #1
 8001e9a:	1c39      	adds	r1, r7, #0
 8001e9c:	1c30      	adds	r0, r6, #0
 8001e9e:	f000 fa95 	bl	80023cc <__aeabi_uidiv>
 8001ea2:	1c39      	adds	r1, r7, #0
 8001ea4:	1c05      	adds	r5, r0, #0
 8001ea6:	1c30      	adds	r0, r6, #0
 8001ea8:	f000 fad4 	bl	8002454 <__aeabi_uidivmod>
 8001eac:	087f      	lsrs	r7, r7, #1
 8001eae:	2300      	movs	r3, #0
 8001eb0:	42b9      	cmp	r1, r7
 8001eb2:	415b      	adcs	r3, r3
 8001eb4:	18ed      	adds	r5, r5, r3
 8001eb6:	6823      	ldr	r3, [r4, #0]
 8001eb8:	041a      	lsls	r2, r3, #16
 8001eba:	d504      	bpl.n	8001ec6 <USART_Init+0x146>
 8001ebc:	4a16      	ldr	r2, [pc, #88]	; (8001f18 <USART_Init+0x198>)
 8001ebe:	072b      	lsls	r3, r5, #28
 8001ec0:	0f5b      	lsrs	r3, r3, #29
 8001ec2:	4015      	ands	r5, r2
 8001ec4:	431d      	orrs	r5, r3
 8001ec6:	b2ad      	uxth	r5, r5
 8001ec8:	81a5      	strh	r5, [r4, #12]
 8001eca:	b00b      	add	sp, #44	; 0x2c
 8001ecc:	bdf0      	pop	{r4, r5, r6, r7, pc}
 8001ece:	46c0      	nop			; (mov r8, r8)
 8001ed0:	40013800 	.word	0x40013800
 8001ed4:	40004400 	.word	0x40004400
 8001ed8:	40004800 	.word	0x40004800
 8001edc:	40004c00 	.word	0x40004c00
 8001ee0:	40005000 	.word	0x40005000
 8001ee4:	40011400 	.word	0x40011400
 8001ee8:	40011800 	.word	0x40011800
 8001eec:	bffee400 	.word	0xbffee400
 8001ef0:	005b8d7f 	.word	0x005b8d7f
 8001ef4:	ffffefff 	.word	0xffffefff
 8001ef8:	effff000 	.word	0xeffff000
 8001efc:	ffffdfff 	.word	0xffffdfff
 8001f00:	ffffd000 	.word	0xffffd000
 8001f04:	fffffbff 	.word	0xfffffbff
 8001f08:	fffffa00 	.word	0xfffffa00
 8001f0c:	fffffcff 	.word	0xfffffcff
 8001f10:	ffffcfff 	.word	0xffffcfff
 8001f14:	ffffe9f3 	.word	0xffffe9f3
 8001f18:	0000fff0 	.word	0x0000fff0

08001f1c <USART_Cmd>:
 8001f1c:	4b17      	ldr	r3, [pc, #92]	; (8001f7c <USART_Cmd+0x60>)
 8001f1e:	b570      	push	{r4, r5, r6, lr}
 8001f20:	1c04      	adds	r4, r0, #0
 8001f22:	1c0e      	adds	r6, r1, #0
 8001f24:	4298      	cmp	r0, r3
 8001f26:	d016      	beq.n	8001f56 <USART_Cmd+0x3a>
 8001f28:	4b15      	ldr	r3, [pc, #84]	; (8001f80 <USART_Cmd+0x64>)
 8001f2a:	4298      	cmp	r0, r3
 8001f2c:	d013      	beq.n	8001f56 <USART_Cmd+0x3a>
 8001f2e:	4b15      	ldr	r3, [pc, #84]	; (8001f84 <USART_Cmd+0x68>)
 8001f30:	4298      	cmp	r0, r3
 8001f32:	d010      	beq.n	8001f56 <USART_Cmd+0x3a>
 8001f34:	4b14      	ldr	r3, [pc, #80]	; (8001f88 <USART_Cmd+0x6c>)
 8001f36:	4298      	cmp	r0, r3
 8001f38:	d00d      	beq.n	8001f56 <USART_Cmd+0x3a>
 8001f3a:	4b14      	ldr	r3, [pc, #80]	; (8001f8c <USART_Cmd+0x70>)
 8001f3c:	4298      	cmp	r0, r3
 8001f3e:	d00a      	beq.n	8001f56 <USART_Cmd+0x3a>
 8001f40:	4b13      	ldr	r3, [pc, #76]	; (8001f90 <USART_Cmd+0x74>)
 8001f42:	4298      	cmp	r0, r3
 8001f44:	d007      	beq.n	8001f56 <USART_Cmd+0x3a>
 8001f46:	4b13      	ldr	r3, [pc, #76]	; (8001f94 <USART_Cmd+0x78>)
 8001f48:	4298      	cmp	r0, r3
 8001f4a:	d004      	beq.n	8001f56 <USART_Cmd+0x3a>
 8001f4c:	4b12      	ldr	r3, [pc, #72]	; (8001f98 <USART_Cmd+0x7c>)
 8001f4e:	18c0      	adds	r0, r0, r3
 8001f50:	4243      	negs	r3, r0
 8001f52:	4158      	adcs	r0, r3
 8001f54:	e000      	b.n	8001f58 <USART_Cmd+0x3c>
 8001f56:	2001      	movs	r0, #1
 8001f58:	f7ff fa78 	bl	800144c <assert_param>
 8001f5c:	2501      	movs	r5, #1
 8001f5e:	2000      	movs	r0, #0
 8001f60:	42b5      	cmp	r5, r6
 8001f62:	4140      	adcs	r0, r0
 8001f64:	f7ff fa72 	bl	800144c <assert_param>
 8001f68:	6823      	ldr	r3, [r4, #0]
 8001f6a:	2e00      	cmp	r6, #0
 8001f6c:	d002      	beq.n	8001f74 <USART_Cmd+0x58>
 8001f6e:	431d      	orrs	r5, r3
 8001f70:	6025      	str	r5, [r4, #0]
 8001f72:	e001      	b.n	8001f78 <USART_Cmd+0x5c>
 8001f74:	43ab      	bics	r3, r5
 8001f76:	6023      	str	r3, [r4, #0]
 8001f78:	bd70      	pop	{r4, r5, r6, pc}
 8001f7a:	46c0      	nop			; (mov r8, r8)
 8001f7c:	40013800 	.word	0x40013800
 8001f80:	40004400 	.word	0x40004400
 8001f84:	40004800 	.word	0x40004800
 8001f88:	40004c00 	.word	0x40004c00
 8001f8c:	40005000 	.word	0x40005000
 8001f90:	40011400 	.word	0x40011400
 8001f94:	40011800 	.word	0x40011800
 8001f98:	bffee400 	.word	0xbffee400

08001f9c <USART_ClearITPendingBit>:
 8001f9c:	b538      	push	{r3, r4, r5, lr}
 8001f9e:	4b26      	ldr	r3, [pc, #152]	; (8002038 <USART_ClearITPendingBit+0x9c>)
 8001fa0:	1c05      	adds	r5, r0, #0
 8001fa2:	1c0c      	adds	r4, r1, #0
 8001fa4:	4298      	cmp	r0, r3
 8001fa6:	d016      	beq.n	8001fd6 <USART_ClearITPendingBit+0x3a>
 8001fa8:	4b24      	ldr	r3, [pc, #144]	; (800203c <USART_ClearITPendingBit+0xa0>)
 8001faa:	4298      	cmp	r0, r3
 8001fac:	d013      	beq.n	8001fd6 <USART_ClearITPendingBit+0x3a>
 8001fae:	4b24      	ldr	r3, [pc, #144]	; (8002040 <USART_ClearITPendingBit+0xa4>)
 8001fb0:	4298      	cmp	r0, r3
 8001fb2:	d010      	beq.n	8001fd6 <USART_ClearITPendingBit+0x3a>
 8001fb4:	4b23      	ldr	r3, [pc, #140]	; (8002044 <USART_ClearITPendingBit+0xa8>)
 8001fb6:	4298      	cmp	r0, r3
 8001fb8:	d00d      	beq.n	8001fd6 <USART_ClearITPendingBit+0x3a>
 8001fba:	4b23      	ldr	r3, [pc, #140]	; (8002048 <USART_ClearITPendingBit+0xac>)
 8001fbc:	4298      	cmp	r0, r3
 8001fbe:	d00a      	beq.n	8001fd6 <USART_ClearITPendingBit+0x3a>
 8001fc0:	4b22      	ldr	r3, [pc, #136]	; (800204c <USART_ClearITPendingBit+0xb0>)
 8001fc2:	4298      	cmp	r0, r3
 8001fc4:	d007      	beq.n	8001fd6 <USART_ClearITPendingBit+0x3a>
 8001fc6:	4b22      	ldr	r3, [pc, #136]	; (8002050 <USART_ClearITPendingBit+0xb4>)
 8001fc8:	4298      	cmp	r0, r3
 8001fca:	d004      	beq.n	8001fd6 <USART_ClearITPendingBit+0x3a>
 8001fcc:	4a21      	ldr	r2, [pc, #132]	; (8002054 <USART_ClearITPendingBit+0xb8>)
 8001fce:	1880      	adds	r0, r0, r2
 8001fd0:	4243      	negs	r3, r0
 8001fd2:	4158      	adcs	r0, r3
 8001fd4:	e000      	b.n	8001fd8 <USART_ClearITPendingBit+0x3c>
 8001fd6:	2001      	movs	r0, #1
 8001fd8:	f7ff fa38 	bl	800144c <assert_param>
 8001fdc:	4b1e      	ldr	r3, [pc, #120]	; (8002058 <USART_ClearITPendingBit+0xbc>)
 8001fde:	429c      	cmp	r4, r3
 8001fe0:	d022      	beq.n	8002028 <USART_ClearITPendingBit+0x8c>
 8001fe2:	2384      	movs	r3, #132	; 0x84
 8001fe4:	005b      	lsls	r3, r3, #1
 8001fe6:	429c      	cmp	r4, r3
 8001fe8:	d01e      	beq.n	8002028 <USART_ClearITPendingBit+0x8c>
 8001fea:	4a1c      	ldr	r2, [pc, #112]	; (800205c <USART_ClearITPendingBit+0xc0>)
 8001fec:	4b1c      	ldr	r3, [pc, #112]	; (8002060 <USART_ClearITPendingBit+0xc4>)
 8001fee:	4022      	ands	r2, r4
 8001ff0:	429a      	cmp	r2, r3
 8001ff2:	d019      	beq.n	8002028 <USART_ClearITPendingBit+0x8c>
 8001ff4:	4b1b      	ldr	r3, [pc, #108]	; (8002064 <USART_ClearITPendingBit+0xc8>)
 8001ff6:	429c      	cmp	r4, r3
 8001ff8:	d016      	beq.n	8002028 <USART_ClearITPendingBit+0x8c>
 8001ffa:	4b1b      	ldr	r3, [pc, #108]	; (8002068 <USART_ClearITPendingBit+0xcc>)
 8001ffc:	429c      	cmp	r4, r3
 8001ffe:	d013      	beq.n	8002028 <USART_ClearITPendingBit+0x8c>
 8002000:	4b1a      	ldr	r3, [pc, #104]	; (800206c <USART_ClearITPendingBit+0xd0>)
 8002002:	429c      	cmp	r4, r3
 8002004:	d010      	beq.n	8002028 <USART_ClearITPendingBit+0x8c>
 8002006:	4b1a      	ldr	r3, [pc, #104]	; (8002070 <USART_ClearITPendingBit+0xd4>)
 8002008:	429c      	cmp	r4, r3
 800200a:	d00d      	beq.n	8002028 <USART_ClearITPendingBit+0x8c>
 800200c:	4b19      	ldr	r3, [pc, #100]	; (8002074 <USART_ClearITPendingBit+0xd8>)
 800200e:	429c      	cmp	r4, r3
 8002010:	d00a      	beq.n	8002028 <USART_ClearITPendingBit+0x8c>
 8002012:	4b19      	ldr	r3, [pc, #100]	; (8002078 <USART_ClearITPendingBit+0xdc>)
 8002014:	429c      	cmp	r4, r3
 8002016:	d007      	beq.n	8002028 <USART_ClearITPendingBit+0x8c>
 8002018:	4b18      	ldr	r3, [pc, #96]	; (800207c <USART_ClearITPendingBit+0xe0>)
 800201a:	429c      	cmp	r4, r3
 800201c:	d004      	beq.n	8002028 <USART_ClearITPendingBit+0x8c>
 800201e:	4a18      	ldr	r2, [pc, #96]	; (8002080 <USART_ClearITPendingBit+0xe4>)
 8002020:	18a3      	adds	r3, r4, r2
 8002022:	4258      	negs	r0, r3
 8002024:	4158      	adcs	r0, r3
 8002026:	e000      	b.n	800202a <USART_ClearITPendingBit+0x8e>
 8002028:	2001      	movs	r0, #1
 800202a:	f7ff fa0f 	bl	800144c <assert_param>
 800202e:	0c24      	lsrs	r4, r4, #16
 8002030:	2301      	movs	r3, #1
 8002032:	40a3      	lsls	r3, r4
 8002034:	622b      	str	r3, [r5, #32]
 8002036:	bd38      	pop	{r3, r4, r5, pc}
 8002038:	40013800 	.word	0x40013800
 800203c:	40004400 	.word	0x40004400
 8002040:	40004800 	.word	0x40004800
 8002044:	40004c00 	.word	0x40004c00
 8002048:	40005000 	.word	0x40005000
 800204c:	40011400 	.word	0x40011400
 8002050:	40011800 	.word	0x40011800
 8002054:	bffee400 	.word	0xbffee400
 8002058:	00060106 	.word	0x00060106
 800205c:	fffdffff 	.word	0xfffdffff
 8002060:	00010300 	.word	0x00010300
 8002064:	00020300 	.word	0x00020300
 8002068:	00040104 	.word	0x00040104
 800206c:	00080206 	.word	0x00080206
 8002070:	0009030a 	.word	0x0009030a
 8002074:	000b011a 	.word	0x000b011a
 8002078:	000c011b 	.word	0x000c011b
 800207c:	0011010e 	.word	0x0011010e
 8002080:	ffebfcea 	.word	0xffebfcea

08002084 <TIM_TimeBaseInit>:
 8002084:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
 8002086:	4e34      	ldr	r6, [pc, #208]	; (8002158 <TIM_TimeBaseInit+0xd4>)
 8002088:	1c04      	adds	r4, r0, #0
 800208a:	1c0d      	adds	r5, r1, #0
 800208c:	4f33      	ldr	r7, [pc, #204]	; (800215c <TIM_TimeBaseInit+0xd8>)
 800208e:	42b0      	cmp	r0, r6
 8002090:	d019      	beq.n	80020c6 <TIM_TimeBaseInit+0x42>
 8002092:	2380      	movs	r3, #128	; 0x80
 8002094:	05db      	lsls	r3, r3, #23
 8002096:	4298      	cmp	r0, r3
 8002098:	d015      	beq.n	80020c6 <TIM_TimeBaseInit+0x42>
 800209a:	4b31      	ldr	r3, [pc, #196]	; (8002160 <TIM_TimeBaseInit+0xdc>)
 800209c:	4298      	cmp	r0, r3
 800209e:	d012      	beq.n	80020c6 <TIM_TimeBaseInit+0x42>
 80020a0:	42b8      	cmp	r0, r7
 80020a2:	d010      	beq.n	80020c6 <TIM_TimeBaseInit+0x42>
 80020a4:	4b2f      	ldr	r3, [pc, #188]	; (8002164 <TIM_TimeBaseInit+0xe0>)
 80020a6:	4298      	cmp	r0, r3
 80020a8:	d00d      	beq.n	80020c6 <TIM_TimeBaseInit+0x42>
 80020aa:	4b2f      	ldr	r3, [pc, #188]	; (8002168 <TIM_TimeBaseInit+0xe4>)
 80020ac:	4298      	cmp	r0, r3
 80020ae:	d00a      	beq.n	80020c6 <TIM_TimeBaseInit+0x42>
 80020b0:	4b2e      	ldr	r3, [pc, #184]	; (800216c <TIM_TimeBaseInit+0xe8>)
 80020b2:	4298      	cmp	r0, r3
 80020b4:	d007      	beq.n	80020c6 <TIM_TimeBaseInit+0x42>
 80020b6:	4b2e      	ldr	r3, [pc, #184]	; (8002170 <TIM_TimeBaseInit+0xec>)
 80020b8:	4298      	cmp	r0, r3
 80020ba:	d004      	beq.n	80020c6 <TIM_TimeBaseInit+0x42>
 80020bc:	492d      	ldr	r1, [pc, #180]	; (8002174 <TIM_TimeBaseInit+0xf0>)
 80020be:	1840      	adds	r0, r0, r1
 80020c0:	4243      	negs	r3, r0
 80020c2:	4158      	adcs	r0, r3
 80020c4:	e000      	b.n	80020c8 <TIM_TimeBaseInit+0x44>
 80020c6:	2001      	movs	r0, #1
 80020c8:	f7ff f9c0 	bl	800144c <assert_param>
 80020cc:	886b      	ldrh	r3, [r5, #2]
 80020ce:	2210      	movs	r2, #16
 80020d0:	1c19      	adds	r1, r3, #0
 80020d2:	4391      	bics	r1, r2
 80020d4:	d101      	bne.n	80020da <TIM_TimeBaseInit+0x56>
 80020d6:	2001      	movs	r0, #1
 80020d8:	e007      	b.n	80020ea <TIM_TimeBaseInit+0x66>
 80020da:	2240      	movs	r2, #64	; 0x40
 80020dc:	1c19      	adds	r1, r3, #0
 80020de:	4391      	bics	r1, r2
 80020e0:	2920      	cmp	r1, #32
 80020e2:	d0f8      	beq.n	80020d6 <TIM_TimeBaseInit+0x52>
 80020e4:	2b40      	cmp	r3, #64	; 0x40
 80020e6:	d0f6      	beq.n	80020d6 <TIM_TimeBaseInit+0x52>
 80020e8:	2000      	movs	r0, #0
 80020ea:	f7ff f9af 	bl	800144c <assert_param>
 80020ee:	892b      	ldrh	r3, [r5, #8]
 80020f0:	4a21      	ldr	r2, [pc, #132]	; (8002178 <TIM_TimeBaseInit+0xf4>)
 80020f2:	2001      	movs	r0, #1
 80020f4:	4213      	tst	r3, r2
 80020f6:	d003      	beq.n	8002100 <TIM_TimeBaseInit+0x7c>
 80020f8:	4a20      	ldr	r2, [pc, #128]	; (800217c <TIM_TimeBaseInit+0xf8>)
 80020fa:	1898      	adds	r0, r3, r2
 80020fc:	4243      	negs	r3, r0
 80020fe:	4158      	adcs	r0, r3
 8002100:	f7ff f9a4 	bl	800144c <assert_param>
 8002104:	6823      	ldr	r3, [r4, #0]
 8002106:	b29b      	uxth	r3, r3
 8002108:	42b4      	cmp	r4, r6
 800210a:	d006      	beq.n	800211a <TIM_TimeBaseInit+0x96>
 800210c:	2280      	movs	r2, #128	; 0x80
 800210e:	05d2      	lsls	r2, r2, #23
 8002110:	4294      	cmp	r4, r2
 8002112:	d002      	beq.n	800211a <TIM_TimeBaseInit+0x96>
 8002114:	4a12      	ldr	r2, [pc, #72]	; (8002160 <TIM_TimeBaseInit+0xdc>)
 8002116:	4294      	cmp	r4, r2
 8002118:	d103      	bne.n	8002122 <TIM_TimeBaseInit+0x9e>
 800211a:	2270      	movs	r2, #112	; 0x70
 800211c:	4393      	bics	r3, r2
 800211e:	886a      	ldrh	r2, [r5, #2]
 8002120:	4313      	orrs	r3, r2
 8002122:	42bc      	cmp	r4, r7
 8002124:	d003      	beq.n	800212e <TIM_TimeBaseInit+0xaa>
 8002126:	4916      	ldr	r1, [pc, #88]	; (8002180 <TIM_TimeBaseInit+0xfc>)
 8002128:	892a      	ldrh	r2, [r5, #8]
 800212a:	400b      	ands	r3, r1
 800212c:	4313      	orrs	r3, r2
 800212e:	8023      	strh	r3, [r4, #0]
 8002130:	686b      	ldr	r3, [r5, #4]
 8002132:	62e3      	str	r3, [r4, #44]	; 0x2c
 8002134:	882b      	ldrh	r3, [r5, #0]
 8002136:	8523      	strh	r3, [r4, #40]	; 0x28
 8002138:	42b4      	cmp	r4, r6
 800213a:	d008      	beq.n	800214e <TIM_TimeBaseInit+0xca>
 800213c:	4b0b      	ldr	r3, [pc, #44]	; (800216c <TIM_TimeBaseInit+0xe8>)
 800213e:	429c      	cmp	r4, r3
 8002140:	d005      	beq.n	800214e <TIM_TimeBaseInit+0xca>
 8002142:	4b0b      	ldr	r3, [pc, #44]	; (8002170 <TIM_TimeBaseInit+0xec>)
 8002144:	429c      	cmp	r4, r3
 8002146:	d002      	beq.n	800214e <TIM_TimeBaseInit+0xca>
 8002148:	4b0e      	ldr	r3, [pc, #56]	; (8002184 <TIM_TimeBaseInit+0x100>)
 800214a:	429c      	cmp	r4, r3
 800214c:	d101      	bne.n	8002152 <TIM_TimeBaseInit+0xce>
 800214e:	7aab      	ldrb	r3, [r5, #10]
 8002150:	8623      	strh	r3, [r4, #48]	; 0x30
 8002152:	2301      	movs	r3, #1
 8002154:	82a3      	strh	r3, [r4, #20]
 8002156:	bdf8      	pop	{r3, r4, r5, r6, r7, pc}
 8002158:	40012c00 	.word	0x40012c00
 800215c:	40001000 	.word	0x40001000
 8002160:	40000400 	.word	0x40000400
 8002164:	40001400 	.word	0x40001400
 8002168:	40002000 	.word	0x40002000
 800216c:	40014000 	.word	0x40014000
 8002170:	40014400 	.word	0x40014400
 8002174:	bffeb800 	.word	0xbffeb800
 8002178:	fffffeff 	.word	0xfffffeff
 800217c:	fffffe00 	.word	0xfffffe00
 8002180:	fffffcff 	.word	0xfffffcff
 8002184:	40014800 	.word	0x40014800

08002188 <TIM_Cmd>:
 8002188:	4b19      	ldr	r3, [pc, #100]	; (80021f0 <TIM_Cmd+0x68>)
 800218a:	b570      	push	{r4, r5, r6, lr}
 800218c:	1c04      	adds	r4, r0, #0
 800218e:	1c0e      	adds	r6, r1, #0
 8002190:	4298      	cmp	r0, r3
 8002192:	d01a      	beq.n	80021ca <TIM_Cmd+0x42>
 8002194:	2380      	movs	r3, #128	; 0x80
 8002196:	05db      	lsls	r3, r3, #23
 8002198:	4298      	cmp	r0, r3
 800219a:	d016      	beq.n	80021ca <TIM_Cmd+0x42>
 800219c:	4b15      	ldr	r3, [pc, #84]	; (80021f4 <TIM_Cmd+0x6c>)
 800219e:	4298      	cmp	r0, r3
 80021a0:	d013      	beq.n	80021ca <TIM_Cmd+0x42>
 80021a2:	4b15      	ldr	r3, [pc, #84]	; (80021f8 <TIM_Cmd+0x70>)
 80021a4:	4298      	cmp	r0, r3
 80021a6:	d010      	beq.n	80021ca <TIM_Cmd+0x42>
 80021a8:	4b14      	ldr	r3, [pc, #80]	; (80021fc <TIM_Cmd+0x74>)
 80021aa:	4298      	cmp	r0, r3
 80021ac:	d00d      	beq.n	80021ca <TIM_Cmd+0x42>
 80021ae:	4b14      	ldr	r3, [pc, #80]	; (8002200 <TIM_Cmd+0x78>)
 80021b0:	4298      	cmp	r0, r3
 80021b2:	d00a      	beq.n	80021ca <TIM_Cmd+0x42>
 80021b4:	4b13      	ldr	r3, [pc, #76]	; (8002204 <TIM_Cmd+0x7c>)
 80021b6:	4298      	cmp	r0, r3
 80021b8:	d007      	beq.n	80021ca <TIM_Cmd+0x42>
 80021ba:	4b13      	ldr	r3, [pc, #76]	; (8002208 <TIM_Cmd+0x80>)
 80021bc:	4298      	cmp	r0, r3
 80021be:	d004      	beq.n	80021ca <TIM_Cmd+0x42>
 80021c0:	4b12      	ldr	r3, [pc, #72]	; (800220c <TIM_Cmd+0x84>)
 80021c2:	18c0      	adds	r0, r0, r3
 80021c4:	4243      	negs	r3, r0
 80021c6:	4158      	adcs	r0, r3
 80021c8:	e000      	b.n	80021cc <TIM_Cmd+0x44>
 80021ca:	2001      	movs	r0, #1
 80021cc:	f7ff f93e 	bl	800144c <assert_param>
 80021d0:	2501      	movs	r5, #1
 80021d2:	2000      	movs	r0, #0
 80021d4:	42b5      	cmp	r5, r6
 80021d6:	4140      	adcs	r0, r0
 80021d8:	f7ff f938 	bl	800144c <assert_param>
 80021dc:	6823      	ldr	r3, [r4, #0]
 80021de:	b29b      	uxth	r3, r3
 80021e0:	2e00      	cmp	r6, #0
 80021e2:	d002      	beq.n	80021ea <TIM_Cmd+0x62>
 80021e4:	431d      	orrs	r5, r3
 80021e6:	8025      	strh	r5, [r4, #0]
 80021e8:	e001      	b.n	80021ee <TIM_Cmd+0x66>
 80021ea:	43ab      	bics	r3, r5
 80021ec:	8023      	strh	r3, [r4, #0]
 80021ee:	bd70      	pop	{r4, r5, r6, pc}
 80021f0:	40012c00 	.word	0x40012c00
 80021f4:	40000400 	.word	0x40000400
 80021f8:	40001000 	.word	0x40001000
 80021fc:	40001400 	.word	0x40001400
 8002200:	40002000 	.word	0x40002000
 8002204:	40014000 	.word	0x40014000
 8002208:	40014400 	.word	0x40014400
 800220c:	bffeb800 	.word	0xbffeb800

08002210 <TIM_ITConfig>:
 8002210:	4b1f      	ldr	r3, [pc, #124]	; (8002290 <TIM_ITConfig+0x80>)
 8002212:	b570      	push	{r4, r5, r6, lr}
 8002214:	1c04      	adds	r4, r0, #0
 8002216:	1c0d      	adds	r5, r1, #0
 8002218:	1c16      	adds	r6, r2, #0
 800221a:	4298      	cmp	r0, r3
 800221c:	d01a      	beq.n	8002254 <TIM_ITConfig+0x44>
 800221e:	2380      	movs	r3, #128	; 0x80
 8002220:	05db      	lsls	r3, r3, #23
 8002222:	4298      	cmp	r0, r3
 8002224:	d016      	beq.n	8002254 <TIM_ITConfig+0x44>
 8002226:	4b1b      	ldr	r3, [pc, #108]	; (8002294 <TIM_ITConfig+0x84>)
 8002228:	4298      	cmp	r0, r3
 800222a:	d013      	beq.n	8002254 <TIM_ITConfig+0x44>
 800222c:	4b1a      	ldr	r3, [pc, #104]	; (8002298 <TIM_ITConfig+0x88>)
 800222e:	4298      	cmp	r0, r3
 8002230:	d010      	beq.n	8002254 <TIM_ITConfig+0x44>
 8002232:	4b1a      	ldr	r3, [pc, #104]	; (800229c <TIM_ITConfig+0x8c>)
 8002234:	4298      	cmp	r0, r3
 8002236:	d00d      	beq.n	8002254 <TIM_ITConfig+0x44>
 8002238:	4b19      	ldr	r3, [pc, #100]	; (80022a0 <TIM_ITConfig+0x90>)
 800223a:	4298      	cmp	r0, r3
 800223c:	d00a      	beq.n	8002254 <TIM_ITConfig+0x44>
 800223e:	4b19      	ldr	r3, [pc, #100]	; (80022a4 <TIM_ITConfig+0x94>)
 8002240:	4298      	cmp	r0, r3
 8002242:	d007      	beq.n	8002254 <TIM_ITConfig+0x44>
 8002244:	4b18      	ldr	r3, [pc, #96]	; (80022a8 <TIM_ITConfig+0x98>)
 8002246:	4298      	cmp	r0, r3
 8002248:	d004      	beq.n	8002254 <TIM_ITConfig+0x44>
 800224a:	4a18      	ldr	r2, [pc, #96]	; (80022ac <TIM_ITConfig+0x9c>)
 800224c:	1880      	adds	r0, r0, r2
 800224e:	4243      	negs	r3, r0
 8002250:	4158      	adcs	r0, r3
 8002252:	e000      	b.n	8002256 <TIM_ITConfig+0x46>
 8002254:	2001      	movs	r0, #1
 8002256:	f7ff f8f9 	bl	800144c <assert_param>
 800225a:	23ff      	movs	r3, #255	; 0xff
 800225c:	1c2a      	adds	r2, r5, #0
 800225e:	2000      	movs	r0, #0
 8002260:	439a      	bics	r2, r3
 8002262:	4282      	cmp	r2, r0
 8002264:	d102      	bne.n	800226c <TIM_ITConfig+0x5c>
 8002266:	1c28      	adds	r0, r5, #0
 8002268:	1e43      	subs	r3, r0, #1
 800226a:	4198      	sbcs	r0, r3
 800226c:	f7ff f8ee 	bl	800144c <assert_param>
 8002270:	2301      	movs	r3, #1
 8002272:	2000      	movs	r0, #0
 8002274:	42b3      	cmp	r3, r6
 8002276:	4140      	adcs	r0, r0
 8002278:	f7ff f8e8 	bl	800144c <assert_param>
 800227c:	68e3      	ldr	r3, [r4, #12]
 800227e:	b29b      	uxth	r3, r3
 8002280:	2e00      	cmp	r6, #0
 8002282:	d002      	beq.n	800228a <TIM_ITConfig+0x7a>
 8002284:	431d      	orrs	r5, r3
 8002286:	81a5      	strh	r5, [r4, #12]
 8002288:	e001      	b.n	800228e <TIM_ITConfig+0x7e>
 800228a:	43ab      	bics	r3, r5
 800228c:	81a3      	strh	r3, [r4, #12]
 800228e:	bd70      	pop	{r4, r5, r6, pc}
 8002290:	40012c00 	.word	0x40012c00
 8002294:	40000400 	.word	0x40000400
 8002298:	40001000 	.word	0x40001000
 800229c:	40001400 	.word	0x40001400
 80022a0:	40002000 	.word	0x40002000
 80022a4:	40014000 	.word	0x40014000
 80022a8:	40014400 	.word	0x40014400
 80022ac:	bffeb800 	.word	0xbffeb800

080022b0 <lib_low_level_init>:
 80022b0:	b508      	push	{r3, lr}
 80022b2:	f7ff f8dd 	bl	8001470 <SystemInit>
 80022b6:	f000 f809 	bl	80022cc <gpio_init>
 80022ba:	f7fe ffe5 	bl	8001288 <uart_init>
 80022be:	f7fe fe3d 	bl	8000f3c <timer_init>
 80022c2:	f7fe ff29 	bl	8001118 <i2c_0_init>
 80022c6:	f7ff f855 	bl	8001374 <adc_init>
 80022ca:	bd08      	pop	{r3, pc}

080022cc <gpio_init>:
 80022cc:	b5f7      	push	{r0, r1, r2, r4, r5, r6, r7, lr}
 80022ce:	2080      	movs	r0, #128	; 0x80
 80022d0:	0280      	lsls	r0, r0, #10
 80022d2:	2101      	movs	r1, #1
 80022d4:	f7ff fa56 	bl	8001784 <RCC_AHBPeriphClockCmd>
 80022d8:	2080      	movs	r0, #128	; 0x80
 80022da:	02c0      	lsls	r0, r0, #11
 80022dc:	2101      	movs	r1, #1
 80022de:	f7ff fa51 	bl	8001784 <RCC_AHBPeriphClockCmd>
 80022e2:	2208      	movs	r2, #8
 80022e4:	2400      	movs	r4, #0
 80022e6:	466b      	mov	r3, sp
 80022e8:	2603      	movs	r6, #3
 80022ea:	9200      	str	r2, [sp, #0]
 80022ec:	4669      	mov	r1, sp
 80022ee:	2201      	movs	r2, #1
 80022f0:	481c      	ldr	r0, [pc, #112]	; (8002364 <gpio_init+0x98>)
 80022f2:	715e      	strb	r6, [r3, #5]
 80022f4:	711a      	strb	r2, [r3, #4]
 80022f6:	719c      	strb	r4, [r3, #6]
 80022f8:	71dc      	strb	r4, [r3, #7]
 80022fa:	2590      	movs	r5, #144	; 0x90
 80022fc:	f7ff fc76 	bl	8001bec <GPIO_Init>
 8002300:	2380      	movs	r3, #128	; 0x80
 8002302:	05ed      	lsls	r5, r5, #23
 8002304:	005b      	lsls	r3, r3, #1
 8002306:	466a      	mov	r2, sp
 8002308:	1c28      	adds	r0, r5, #0
 800230a:	9300      	str	r3, [sp, #0]
 800230c:	4669      	mov	r1, sp
 800230e:	2301      	movs	r3, #1
 8002310:	2780      	movs	r7, #128	; 0x80
 8002312:	7156      	strb	r6, [r2, #5]
 8002314:	013f      	lsls	r7, r7, #4
 8002316:	7113      	strb	r3, [r2, #4]
 8002318:	7194      	strb	r4, [r2, #6]
 800231a:	71d4      	strb	r4, [r2, #7]
 800231c:	f7ff fc66 	bl	8001bec <GPIO_Init>
 8002320:	466a      	mov	r2, sp
 8002322:	1c28      	adds	r0, r5, #0
 8002324:	2301      	movs	r3, #1
 8002326:	4669      	mov	r1, sp
 8002328:	7156      	strb	r6, [r2, #5]
 800232a:	9700      	str	r7, [sp, #0]
 800232c:	7113      	strb	r3, [r2, #4]
 800232e:	7194      	strb	r4, [r2, #6]
 8002330:	71d4      	strb	r4, [r2, #7]
 8002332:	f7ff fc5b 	bl	8001bec <GPIO_Init>
 8002336:	2202      	movs	r2, #2
 8002338:	466b      	mov	r3, sp
 800233a:	9200      	str	r2, [sp, #0]
 800233c:	1c28      	adds	r0, r5, #0
 800233e:	2201      	movs	r2, #1
 8002340:	4669      	mov	r1, sp
 8002342:	715e      	strb	r6, [r3, #5]
 8002344:	711a      	strb	r2, [r3, #4]
 8002346:	719c      	strb	r4, [r3, #6]
 8002348:	71dc      	strb	r4, [r3, #7]
 800234a:	f7ff fc4f 	bl	8001bec <GPIO_Init>
 800234e:	4b05      	ldr	r3, [pc, #20]	; (8002364 <gpio_init+0x98>)
 8002350:	2208      	movs	r2, #8
 8002352:	851a      	strh	r2, [r3, #40]	; 0x28
 8002354:	2380      	movs	r3, #128	; 0x80
 8002356:	005b      	lsls	r3, r3, #1
 8002358:	2202      	movs	r2, #2
 800235a:	852b      	strh	r3, [r5, #40]	; 0x28
 800235c:	852f      	strh	r7, [r5, #40]	; 0x28
 800235e:	852a      	strh	r2, [r5, #40]	; 0x28
 8002360:	bdf7      	pop	{r0, r1, r2, r4, r5, r6, r7, pc}
 8002362:	46c0      	nop			; (mov r8, r8)
 8002364:	48000400 	.word	0x48000400

08002368 <led_on>:
 8002368:	2808      	cmp	r0, #8
 800236a:	d101      	bne.n	8002370 <led_on+0x8>
 800236c:	4b07      	ldr	r3, [pc, #28]	; (800238c <led_on+0x24>)
 800236e:	e00b      	b.n	8002388 <led_on+0x20>
 8002370:	2380      	movs	r3, #128	; 0x80
 8002372:	005b      	lsls	r3, r3, #1
 8002374:	4298      	cmp	r0, r3
 8002376:	d005      	beq.n	8002384 <led_on+0x1c>
 8002378:	2380      	movs	r3, #128	; 0x80
 800237a:	011b      	lsls	r3, r3, #4
 800237c:	4298      	cmp	r0, r3
 800237e:	d001      	beq.n	8002384 <led_on+0x1c>
 8002380:	2802      	cmp	r0, #2
 8002382:	d102      	bne.n	800238a <led_on+0x22>
 8002384:	2390      	movs	r3, #144	; 0x90
 8002386:	05db      	lsls	r3, r3, #23
 8002388:	6198      	str	r0, [r3, #24]
 800238a:	4770      	bx	lr
 800238c:	48000400 	.word	0x48000400

08002390 <led_off>:
 8002390:	2808      	cmp	r0, #8
 8002392:	d101      	bne.n	8002398 <led_off+0x8>
 8002394:	4b07      	ldr	r3, [pc, #28]	; (80023b4 <led_off+0x24>)
 8002396:	e00b      	b.n	80023b0 <led_off+0x20>
 8002398:	2380      	movs	r3, #128	; 0x80
 800239a:	005b      	lsls	r3, r3, #1
 800239c:	4298      	cmp	r0, r3
 800239e:	d005      	beq.n	80023ac <led_off+0x1c>
 80023a0:	2380      	movs	r3, #128	; 0x80
 80023a2:	011b      	lsls	r3, r3, #4
 80023a4:	4298      	cmp	r0, r3
 80023a6:	d001      	beq.n	80023ac <led_off+0x1c>
 80023a8:	2802      	cmp	r0, #2
 80023aa:	d102      	bne.n	80023b2 <led_off+0x22>
 80023ac:	2390      	movs	r3, #144	; 0x90
 80023ae:	05db      	lsls	r3, r3, #23
 80023b0:	8518      	strh	r0, [r3, #40]	; 0x28
 80023b2:	4770      	bx	lr
 80023b4:	48000400 	.word	0x48000400

080023b8 <__gnu_thumb1_case_uqi>:
 80023b8:	b402      	push	{r1}
 80023ba:	4671      	mov	r1, lr
 80023bc:	0849      	lsrs	r1, r1, #1
 80023be:	0049      	lsls	r1, r1, #1
 80023c0:	5c09      	ldrb	r1, [r1, r0]
 80023c2:	0049      	lsls	r1, r1, #1
 80023c4:	448e      	add	lr, r1
 80023c6:	bc02      	pop	{r1}
 80023c8:	4770      	bx	lr
 80023ca:	46c0      	nop			; (mov r8, r8)

080023cc <__aeabi_uidiv>:
 80023cc:	2900      	cmp	r1, #0
 80023ce:	d034      	beq.n	800243a <.udivsi3_skip_div0_test+0x6a>

080023d0 <.udivsi3_skip_div0_test>:
 80023d0:	2301      	movs	r3, #1
 80023d2:	2200      	movs	r2, #0
 80023d4:	b410      	push	{r4}
 80023d6:	4288      	cmp	r0, r1
 80023d8:	d32c      	bcc.n	8002434 <.udivsi3_skip_div0_test+0x64>
 80023da:	2401      	movs	r4, #1
 80023dc:	0724      	lsls	r4, r4, #28
 80023de:	42a1      	cmp	r1, r4
 80023e0:	d204      	bcs.n	80023ec <.udivsi3_skip_div0_test+0x1c>
 80023e2:	4281      	cmp	r1, r0
 80023e4:	d202      	bcs.n	80023ec <.udivsi3_skip_div0_test+0x1c>
 80023e6:	0109      	lsls	r1, r1, #4
 80023e8:	011b      	lsls	r3, r3, #4
 80023ea:	e7f8      	b.n	80023de <.udivsi3_skip_div0_test+0xe>
 80023ec:	00e4      	lsls	r4, r4, #3
 80023ee:	42a1      	cmp	r1, r4
 80023f0:	d204      	bcs.n	80023fc <.udivsi3_skip_div0_test+0x2c>
 80023f2:	4281      	cmp	r1, r0
 80023f4:	d202      	bcs.n	80023fc <.udivsi3_skip_div0_test+0x2c>
 80023f6:	0049      	lsls	r1, r1, #1
 80023f8:	005b      	lsls	r3, r3, #1
 80023fa:	e7f8      	b.n	80023ee <.udivsi3_skip_div0_test+0x1e>
 80023fc:	4288      	cmp	r0, r1
 80023fe:	d301      	bcc.n	8002404 <.udivsi3_skip_div0_test+0x34>
 8002400:	1a40      	subs	r0, r0, r1
 8002402:	431a      	orrs	r2, r3
 8002404:	084c      	lsrs	r4, r1, #1
 8002406:	42a0      	cmp	r0, r4
 8002408:	d302      	bcc.n	8002410 <.udivsi3_skip_div0_test+0x40>
 800240a:	1b00      	subs	r0, r0, r4
 800240c:	085c      	lsrs	r4, r3, #1
 800240e:	4322      	orrs	r2, r4
 8002410:	088c      	lsrs	r4, r1, #2
 8002412:	42a0      	cmp	r0, r4
 8002414:	d302      	bcc.n	800241c <.udivsi3_skip_div0_test+0x4c>
 8002416:	1b00      	subs	r0, r0, r4
 8002418:	089c      	lsrs	r4, r3, #2
 800241a:	4322      	orrs	r2, r4
 800241c:	08cc      	lsrs	r4, r1, #3
 800241e:	42a0      	cmp	r0, r4
 8002420:	d302      	bcc.n	8002428 <.udivsi3_skip_div0_test+0x58>
 8002422:	1b00      	subs	r0, r0, r4
 8002424:	08dc      	lsrs	r4, r3, #3
 8002426:	4322      	orrs	r2, r4
 8002428:	2800      	cmp	r0, #0
 800242a:	d003      	beq.n	8002434 <.udivsi3_skip_div0_test+0x64>
 800242c:	091b      	lsrs	r3, r3, #4
 800242e:	d001      	beq.n	8002434 <.udivsi3_skip_div0_test+0x64>
 8002430:	0909      	lsrs	r1, r1, #4
 8002432:	e7e3      	b.n	80023fc <.udivsi3_skip_div0_test+0x2c>
 8002434:	1c10      	adds	r0, r2, #0
 8002436:	bc10      	pop	{r4}
 8002438:	4770      	bx	lr
 800243a:	2800      	cmp	r0, #0
 800243c:	d001      	beq.n	8002442 <.udivsi3_skip_div0_test+0x72>
 800243e:	2000      	movs	r0, #0
 8002440:	43c0      	mvns	r0, r0
 8002442:	b407      	push	{r0, r1, r2}
 8002444:	4802      	ldr	r0, [pc, #8]	; (8002450 <.udivsi3_skip_div0_test+0x80>)
 8002446:	a102      	add	r1, pc, #8	; (adr r1, 8002450 <.udivsi3_skip_div0_test+0x80>)
 8002448:	1840      	adds	r0, r0, r1
 800244a:	9002      	str	r0, [sp, #8]
 800244c:	bd03      	pop	{r0, r1, pc}
 800244e:	46c0      	nop			; (mov r8, r8)
 8002450:	000000d9 	.word	0x000000d9

08002454 <__aeabi_uidivmod>:
 8002454:	2900      	cmp	r1, #0
 8002456:	d0f0      	beq.n	800243a <.udivsi3_skip_div0_test+0x6a>
 8002458:	b503      	push	{r0, r1, lr}
 800245a:	f7ff ffb9 	bl	80023d0 <.udivsi3_skip_div0_test>
 800245e:	bc0e      	pop	{r1, r2, r3}
 8002460:	4342      	muls	r2, r0
 8002462:	1a89      	subs	r1, r1, r2
 8002464:	4718      	bx	r3
 8002466:	46c0      	nop			; (mov r8, r8)

08002468 <__aeabi_idiv>:
 8002468:	2900      	cmp	r1, #0
 800246a:	d041      	beq.n	80024f0 <.divsi3_skip_div0_test+0x84>

0800246c <.divsi3_skip_div0_test>:
 800246c:	b410      	push	{r4}
 800246e:	1c04      	adds	r4, r0, #0
 8002470:	404c      	eors	r4, r1
 8002472:	46a4      	mov	ip, r4
 8002474:	2301      	movs	r3, #1
 8002476:	2200      	movs	r2, #0
 8002478:	2900      	cmp	r1, #0
 800247a:	d500      	bpl.n	800247e <.divsi3_skip_div0_test+0x12>
 800247c:	4249      	negs	r1, r1
 800247e:	2800      	cmp	r0, #0
 8002480:	d500      	bpl.n	8002484 <.divsi3_skip_div0_test+0x18>
 8002482:	4240      	negs	r0, r0
 8002484:	4288      	cmp	r0, r1
 8002486:	d32c      	bcc.n	80024e2 <.divsi3_skip_div0_test+0x76>
 8002488:	2401      	movs	r4, #1
 800248a:	0724      	lsls	r4, r4, #28
 800248c:	42a1      	cmp	r1, r4
 800248e:	d204      	bcs.n	800249a <.divsi3_skip_div0_test+0x2e>
 8002490:	4281      	cmp	r1, r0
 8002492:	d202      	bcs.n	800249a <.divsi3_skip_div0_test+0x2e>
 8002494:	0109      	lsls	r1, r1, #4
 8002496:	011b      	lsls	r3, r3, #4
 8002498:	e7f8      	b.n	800248c <.divsi3_skip_div0_test+0x20>
 800249a:	00e4      	lsls	r4, r4, #3
 800249c:	42a1      	cmp	r1, r4
 800249e:	d204      	bcs.n	80024aa <.divsi3_skip_div0_test+0x3e>
 80024a0:	4281      	cmp	r1, r0
 80024a2:	d202      	bcs.n	80024aa <.divsi3_skip_div0_test+0x3e>
 80024a4:	0049      	lsls	r1, r1, #1
 80024a6:	005b      	lsls	r3, r3, #1
 80024a8:	e7f8      	b.n	800249c <.divsi3_skip_div0_test+0x30>
 80024aa:	4288      	cmp	r0, r1
 80024ac:	d301      	bcc.n	80024b2 <.divsi3_skip_div0_test+0x46>
 80024ae:	1a40      	subs	r0, r0, r1
 80024b0:	431a      	orrs	r2, r3
 80024b2:	084c      	lsrs	r4, r1, #1
 80024b4:	42a0      	cmp	r0, r4
 80024b6:	d302      	bcc.n	80024be <.divsi3_skip_div0_test+0x52>
 80024b8:	1b00      	subs	r0, r0, r4
 80024ba:	085c      	lsrs	r4, r3, #1
 80024bc:	4322      	orrs	r2, r4
 80024be:	088c      	lsrs	r4, r1, #2
 80024c0:	42a0      	cmp	r0, r4
 80024c2:	d302      	bcc.n	80024ca <.divsi3_skip_div0_test+0x5e>
 80024c4:	1b00      	subs	r0, r0, r4
 80024c6:	089c      	lsrs	r4, r3, #2
 80024c8:	4322      	orrs	r2, r4
 80024ca:	08cc      	lsrs	r4, r1, #3
 80024cc:	42a0      	cmp	r0, r4
 80024ce:	d302      	bcc.n	80024d6 <.divsi3_skip_div0_test+0x6a>
 80024d0:	1b00      	subs	r0, r0, r4
 80024d2:	08dc      	lsrs	r4, r3, #3
 80024d4:	4322      	orrs	r2, r4
 80024d6:	2800      	cmp	r0, #0
 80024d8:	d003      	beq.n	80024e2 <.divsi3_skip_div0_test+0x76>
 80024da:	091b      	lsrs	r3, r3, #4
 80024dc:	d001      	beq.n	80024e2 <.divsi3_skip_div0_test+0x76>
 80024de:	0909      	lsrs	r1, r1, #4
 80024e0:	e7e3      	b.n	80024aa <.divsi3_skip_div0_test+0x3e>
 80024e2:	1c10      	adds	r0, r2, #0
 80024e4:	4664      	mov	r4, ip
 80024e6:	2c00      	cmp	r4, #0
 80024e8:	d500      	bpl.n	80024ec <.divsi3_skip_div0_test+0x80>
 80024ea:	4240      	negs	r0, r0
 80024ec:	bc10      	pop	{r4}
 80024ee:	4770      	bx	lr
 80024f0:	2800      	cmp	r0, #0
 80024f2:	d006      	beq.n	8002502 <.divsi3_skip_div0_test+0x96>
 80024f4:	db03      	blt.n	80024fe <.divsi3_skip_div0_test+0x92>
 80024f6:	2000      	movs	r0, #0
 80024f8:	43c0      	mvns	r0, r0
 80024fa:	0840      	lsrs	r0, r0, #1
 80024fc:	e001      	b.n	8002502 <.divsi3_skip_div0_test+0x96>
 80024fe:	2080      	movs	r0, #128	; 0x80
 8002500:	0600      	lsls	r0, r0, #24
 8002502:	b407      	push	{r0, r1, r2}
 8002504:	4802      	ldr	r0, [pc, #8]	; (8002510 <.divsi3_skip_div0_test+0xa4>)
 8002506:	a102      	add	r1, pc, #8	; (adr r1, 8002510 <.divsi3_skip_div0_test+0xa4>)
 8002508:	1840      	adds	r0, r0, r1
 800250a:	9002      	str	r0, [sp, #8]
 800250c:	bd03      	pop	{r0, r1, pc}
 800250e:	46c0      	nop			; (mov r8, r8)
 8002510:	00000019 	.word	0x00000019

08002514 <__aeabi_idivmod>:
 8002514:	2900      	cmp	r1, #0
 8002516:	d0eb      	beq.n	80024f0 <.divsi3_skip_div0_test+0x84>
 8002518:	b503      	push	{r0, r1, lr}
 800251a:	f7ff ffa7 	bl	800246c <.divsi3_skip_div0_test>
 800251e:	bc0e      	pop	{r1, r2, r3}
 8002520:	4342      	muls	r2, r0
 8002522:	1a89      	subs	r1, r1, r2
 8002524:	4718      	bx	r3
 8002526:	46c0      	nop			; (mov r8, r8)

08002528 <__aeabi_idiv0>:
 8002528:	4770      	bx	lr
 800252a:	46c0      	nop			; (mov r8, r8)

0800252c <_init>:
 800252c:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
 800252e:	46c0      	nop			; (mov r8, r8)
 8002530:	bcf8      	pop	{r3, r4, r5, r6, r7}
 8002532:	bc08      	pop	{r3}
 8002534:	469e      	mov	lr, r3
 8002536:	4770      	bx	lr

08002538 <_fini>:
 8002538:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
 800253a:	46c0      	nop			; (mov r8, r8)
 800253c:	bcf8      	pop	{r3, r4, r5, r6, r7}
 800253e:	bc08      	pop	{r3}
 8002540:	469e      	mov	lr, r3
 8002542:	4770      	bx	lr
 8002544:	69647473 	.word	0x69647473
 8002548:	6e69206f 	.word	0x6e69206f
 800254c:	64207469 	.word	0x64207469
 8002550:	0a656e6f 	.word	0x0a656e6f
 8002554:	00          	.byte	0x00
 8002555:	62          	.byte	0x62
 8002556:	6f6f      	.short	0x6f6f
 8002558:	676e6974 	.word	0x676e6974
 800255c:	6f726620 	.word	0x6f726620
 8002560:	7525206d 	.word	0x7525206d
 8002564:	6172000a 	.word	0x6172000a
 8002568:	7473206d 	.word	0x7473206d
 800256c:	20747261 	.word	0x20747261
 8002570:	0a207525 	.word	0x0a207525
 8002574:	6d617200 	.word	0x6d617200
 8002578:	7a697320 	.word	0x7a697320
 800257c:	75252065 	.word	0x75252065
 8002580:	72000a20 	.word	0x72000a20
 8002584:	66206d61 	.word	0x66206d61
 8002588:	20656572 	.word	0x20656572
 800258c:	0a207525 	.word	0x0a207525
 8002590:	61656800 	.word	0x61656800
 8002594:	74732070 	.word	0x74732070
 8002598:	20747261 	.word	0x20747261
 800259c:	0a207525 	.word	0x0a207525
 80025a0:	000a0a00 	.word	0x000a0a00

080025a4 <font_data>:
	...
 80025b4:	3c180000 18183c3c 18180018 00000000     ...<<<..........
 80025c4:	63636300 00000022 00000000 00000000     .ccc"...........
 80025d4:	36000000 36367f36 36367f36 00000000     ...66.666.66....
 80025e4:	633e0c0c 033e6061 3e634303 00000c0c     ..>ca`>..Cc>....
 80025f4:	00000000 06636100 6333180c 00000000     .....ac...3c....
 8002604:	1c000000 3b1c3636 3b66666e 00000000     ....66.;nff;....
 8002614:	30303000 00000060 00000000 00000000     .000`...........
 8002624:	180c0000 30303018 0c181830 00000000     .....0000.......
 8002634:	0c180000 0606060c 180c0c06 00000000     ................
 8002644:	00000000 ff3c6642 0042663c 00000000     ....Bf<.<fB.....
 8002654:	00000000 ff181818 00181818 00000000     ................
	...
 800266c:	18180000 00003018 00000000 ff000000     .....0..........
	...
 800268c:	18180000 00000000 03010000 381c0e07     ...............8
 800269c:	80c0e070 00000000 633e0000 6b6b6363     p.........>ccckk
 80026ac:	3e636363 00000000 1c0c0000 0c0c0c3c     ccc>........<...
 80026bc:	3f0c0c0c 00000000 633e0000 180c0603     ...?......>c....
 80026cc:	7f636130 00000000 633e0000 031e0303     0ac.......>c....
 80026dc:	3e630303 00000000 0e060000 6666361e     ..c>.........6ff
 80026ec:	0f06067f 00000000 607f0000 037e6060     ...........```~.
 80026fc:	3e736303 00000000 301c0000 637e6060     .cs>.......0``~c
 800270c:	3e636363 00000000 637f0000 0c060603     ccc>.......c....
 800271c:	1818180c 00000000 633e0000 633e6363     ..........>ccc>c
 800272c:	3e636363 00000000 633e0000 3f636363     ccc>......>cccc?
 800273c:	3c060303 00000000 00000000 00181800     ...<............
 800274c:	18180000 00000000 00000000 00181800     ................
 800275c:	18180000 00003018 06000000 6030180c     .....0........0`
 800276c:	060c1830 00000000 00000000 007e0000     0.............~.
 800277c:	00007e00 00000000 60000000 060c1830     .~.........`0...
 800278c:	6030180c 00000000 633e0000 0c0c0663     ..0`......>cc...
 800279c:	0c0c000c 00000000 633e0000 6b6b6f63     ..........>ccokk
 80027ac:	3e60606e 00000000 1c080000 63636336     n``>........6ccc
 80027bc:	6363637f 00000000 337e0000 333e3333     .ccc......~333>3
 80027cc:	7e333333 00000000 331e0000 60606061     333~.......3a```
 80027dc:	1e336160 00000000 367c0000 33333333     `a3.......|63333
 80027ec:	7c363333 00000000 337f0000 343c3431     336|.......314<4
 80027fc:	7f333130 00000000 337f0000 343c3431     013........314<4
 800280c:	78303030 00000000 331e0000 6f606061     000x.......3a``o
 800281c:	1d376363 00000000 63630000 637f6363     cc7.......cccc.c
 800282c:	63636363 00000000 183c0000 18181818     cccc......<.....
 800283c:	3c181818 00000000 060f0000 06060606     ...<............
 800284c:	3c666606 00000000 33730000 363c3636     .ff<......s366<6
 800285c:	73333336 00000000 30780000 30303030     633s......x00000
 800286c:	7f333130 00000000 77630000 63636b7f     013.......cw.kcc
 800287c:	63636363 00000000 63630000 6f7f7b73     cccc......ccs{.o
 800288c:	63636367 00000000 361c0000 63636363     gccc.......6cccc
 800289c:	1c366363 00000000 337e0000 303e3333     cc6.......~333>0
 80028ac:	78303030 00000000 633e0000 63636363     000x......>ccccc
 80028bc:	3e6f6b63 00000706 337e0000 363e3333     cko>......~333>6
 80028cc:	73333336 00000000 633e0000 061c3063     633s......>cc0..
 80028dc:	3e636303 00000000 dbff0000 18181899     .cc>............
 80028ec:	3c181818 00000000 63630000 63636363     ...<......cccccc
 80028fc:	3e636363 00000000 63630000 63636363     ccc>......cccccc
 800290c:	081c3663 00000000 63630000 6b636363     c6........ccccck
 800291c:	36367f6b 00000000 c3c30000 18183c66     k.66........f<..
 800292c:	c3c3663c 00000000 c3c30000 183c66c3     <f...........f<.
 800293c:	3c181818 00000000 637f0000 180c0643     ...<.......cC...
 800294c:	7f636130 00000000 303c0000 30303030     0ac.......<00000
 800295c:	3c303030 00000000 c0800000 1c3870e0     000<.........p8.
 800296c:	0103070e 00000000 0c3c0000 0c0c0c0c     ..........<.....
 800297c:	3c0c0c0c 00000000 63361c08 00000000     ...<......6c....
	...
 80029a0:	000000ff 000c1818 00000000 00000000     ................
	...
 80029b8:	06463c00 3b66663e 00000000 30700000     .<F.>ff;......p0
 80029c8:	33363c30 6e333333 00000000 00000000     0<63333n........
 80029d8:	60633e00 3e636060 00000000 060e0000     .>c```c>........
 80029e8:	66361e06 3b666666 00000000 00000000     ..6ffff;........
 80029f8:	63633e00 3e63607e 00000000 361c0000     .>cc~`c>.......6
 8002a08:	307c3032 78303030 00000000 00000000     20|0000x........
 8002a18:	66663b00 063e6666 00003c66 30700000     .;ffff>.f<....p0
 8002a28:	333b3630 73333333 00000000 0c0c0000     06;3333s........
 8002a38:	0c0c1c00 1e0c0c0c 00000000 06060000     ................
 8002a48:	06060e00 66060606 00003c66 30700000     .......ff<....p0
 8002a58:	36333330 7333363c 00000000 0c1c0000     0336<63s........
 8002a68:	0c0c0c0c 1e0c0c0c 00000000 00000000     ................
 8002a78:	6b7f6e00 6b6b6b6b 00000000 00000000     .n.kkkkk........
 8002a88:	33336e00 33333333 00000000 00000000     .n333333........
 8002a98:	63633e00 3e636363 00000000 00000000     .>ccccc>........
 8002aa8:	33336e00 303e3333 00007830 00000000     .n3333>00x......
 8002ab8:	66663b00 063e6666 00000f06 00000000     .;ffff>.........
 8002ac8:	333b6e00 78303030 00000000 00000000     .n;3000x........
 8002ad8:	38633e00 3e63030e 00000000 18080000     .>c8..c>........
 8002ae8:	18187e18 0e1b1818 00000000 00000000     .~..............
 8002af8:	66666600 3b666666 00000000 00000000     .ffffff;........
 8002b08:	36636300 081c1c36 00000000 00000000     .cc66...........
 8002b18:	63636300 367f6b6b 00000000 00000000     .ccckk.6........
 8002b28:	1c366300 63361c1c 00000000 00000000     .c6...6c........
 8002b38:	63636300 033f6363 00003c06 00000000     .ccccc?..<......
 8002b48:	0c667f00 7f633018 00000000 180e0000     ..f..0c.........
 8002b58:	18701818 0e181818 00000000 18180000     ..p.............
 8002b68:	00181818 18181818 00000018 18700000     ..............p.
 8002b78:	180e1818 70181818 00000000 6e3b0000     .......p......;n
	...
 8002b94:	d8d87000 00000070 00000000 00000000     .p..p...........
 8002ba4:	3a207525 5b000a20 25206925 69252069     %u : ..[%i %i %i
 8002bb4:	4100205d 72204344 25207365 69742075     ] .ADC res %u ti
 8002bc4:	2520656d 0a000a75 636c6577 20656d6f     me %u...welcome 
 8002bd4:	53206f74 68757a75 20534f61 205e5f5e     to SuzuhaOS ^_^ 
 8002be4:	2e322e32 55420a30 20444c49 2072614d     2.2.0.BUILD Mar 
 8002bf4:	32203432 20363130 333a3231 34343a37     24 2016 12:37:44
 8002c04:	0000000a                                ....

08002c08 <__EH_FRAME_BEGIN__>:
 8002c08:	00000000                                ....
