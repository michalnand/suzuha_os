
bin/main.elf:     file format elf32-littlearm


Disassembly of section .text:

080000c0 <thread_ending>:
 80000c0:	b672      	cpsid	i
 80000c2:	4b05      	ldr	r3, [pc, #20]	; (80000d8 <thread_ending+0x18>)
 80000c4:	220c      	movs	r2, #12
 80000c6:	681b      	ldr	r3, [r3, #0]
 80000c8:	4353      	muls	r3, r2
 80000ca:	4a04      	ldr	r2, [pc, #16]	; (80000dc <thread_ending+0x1c>)
 80000cc:	18d3      	adds	r3, r2, r3
 80000ce:	2200      	movs	r2, #0
 80000d0:	605a      	str	r2, [r3, #4]
 80000d2:	b662      	cpsie	i
 80000d4:	46c0      	nop			; (mov r8, r8)
 80000d6:	e7fd      	b.n	80000d4 <thread_ending+0x14>
 80000d8:	2000006c 	.word	0x2000006c
 80000dc:	2000000c 	.word	0x2000000c

080000e0 <null_thread>:
 80000e0:	b508      	push	{r3, lr}
 80000e2:	f000 fb5b 	bl	800079c <sleep>
 80000e6:	e7fc      	b.n	80000e2 <null_thread+0x2>

080000e8 <scheduler>:
 80000e8:	b5f0      	push	{r4, r5, r6, r7, lr}
 80000ea:	2100      	movs	r1, #0
 80000ec:	1c0a      	adds	r2, r1, #0
 80000ee:	200c      	movs	r0, #12
 80000f0:	1c05      	adds	r5, r0, #0
 80000f2:	4355      	muls	r5, r2
 80000f4:	4b14      	ldr	r3, [pc, #80]	; (8000148 <scheduler+0x60>)
 80000f6:	195e      	adds	r6, r3, r5
 80000f8:	6874      	ldr	r4, [r6, #4]
 80000fa:	46a4      	mov	ip, r4
 80000fc:	4667      	mov	r7, ip
 80000fe:	1c1c      	adds	r4, r3, #0
 8000100:	07bf      	lsls	r7, r7, #30
 8000102:	d40a      	bmi.n	800011a <scheduler+0x32>
 8000104:	6876      	ldr	r6, [r6, #4]
 8000106:	07f7      	lsls	r7, r6, #31
 8000108:	d507      	bpl.n	800011a <scheduler+0x32>
 800010a:	4348      	muls	r0, r1
 800010c:	595d      	ldr	r5, [r3, r5]
 800010e:	5818      	ldr	r0, [r3, r0]
 8000110:	b2ad      	uxth	r5, r5
 8000112:	b280      	uxth	r0, r0
 8000114:	4285      	cmp	r5, r0
 8000116:	d200      	bcs.n	800011a <scheduler+0x32>
 8000118:	1c11      	adds	r1, r2, #0
 800011a:	200c      	movs	r0, #12
 800011c:	4350      	muls	r0, r2
 800011e:	581d      	ldr	r5, [r3, r0]
 8000120:	b2ad      	uxth	r5, r5
 8000122:	2d00      	cmp	r5, #0
 8000124:	d004      	beq.n	8000130 <scheduler+0x48>
 8000126:	581d      	ldr	r5, [r3, r0]
 8000128:	b2ad      	uxth	r5, r5
 800012a:	3d01      	subs	r5, #1
 800012c:	b2ad      	uxth	r5, r5
 800012e:	521d      	strh	r5, [r3, r0]
 8000130:	3201      	adds	r2, #1
 8000132:	2a08      	cmp	r2, #8
 8000134:	d1db      	bne.n	80000ee <scheduler+0x6>
 8000136:	230c      	movs	r3, #12
 8000138:	434b      	muls	r3, r1
 800013a:	58e2      	ldr	r2, [r4, r3]
 800013c:	0c12      	lsrs	r2, r2, #16
 800013e:	52e2      	strh	r2, [r4, r3]
 8000140:	4b02      	ldr	r3, [pc, #8]	; (800014c <scheduler+0x64>)
 8000142:	6019      	str	r1, [r3, #0]
 8000144:	bdf0      	pop	{r4, r5, r6, r7, pc}
 8000146:	46c0      	nop			; (mov r8, r8)
 8000148:	2000000c 	.word	0x2000000c
 800014c:	2000006c 	.word	0x2000006c

08000150 <SysTick_Handler>:
 8000150:	b4f0      	push	{r4, r5, r6, r7}
 8000152:	4644      	mov	r4, r8
 8000154:	464d      	mov	r5, r9
 8000156:	4656      	mov	r6, sl
 8000158:	465f      	mov	r7, fp
 800015a:	b4f0      	push	{r4, r5, r6, r7}
 800015c:	f000 fb1a 	bl	8000794 <__get_MSP>
 8000160:	4c0f      	ldr	r4, [pc, #60]	; (80001a0 <SysTick_Handler+0x50>)
 8000162:	4d10      	ldr	r5, [pc, #64]	; (80001a4 <SysTick_Handler+0x54>)
 8000164:	6823      	ldr	r3, [r4, #0]
 8000166:	3301      	adds	r3, #1
 8000168:	d005      	beq.n	8000176 <SysTick_Handler+0x26>
 800016a:	6823      	ldr	r3, [r4, #0]
 800016c:	220c      	movs	r2, #12
 800016e:	4353      	muls	r3, r2
 8000170:	18eb      	adds	r3, r5, r3
 8000172:	6098      	str	r0, [r3, #8]
 8000174:	e001      	b.n	800017a <SysTick_Handler+0x2a>
 8000176:	2300      	movs	r3, #0
 8000178:	6023      	str	r3, [r4, #0]
 800017a:	f7ff ffb5 	bl	80000e8 <scheduler>
 800017e:	6823      	ldr	r3, [r4, #0]
 8000180:	220c      	movs	r2, #12
 8000182:	4353      	muls	r3, r2
 8000184:	18ed      	adds	r5, r5, r3
 8000186:	2307      	movs	r3, #7
 8000188:	68aa      	ldr	r2, [r5, #8]
 800018a:	425b      	negs	r3, r3
 800018c:	469e      	mov	lr, r3
 800018e:	f382 8808 	msr	MSP, r2
 8000192:	bcf0      	pop	{r4, r5, r6, r7}
 8000194:	46a0      	mov	r8, r4
 8000196:	46a9      	mov	r9, r5
 8000198:	46b2      	mov	sl, r6
 800019a:	46bb      	mov	fp, r7
 800019c:	bcf0      	pop	{r4, r5, r6, r7}
 800019e:	4770      	bx	lr
 80001a0:	2000006c 	.word	0x2000006c
 80001a4:	2000000c 	.word	0x2000000c

080001a8 <sched_off>:
 80001a8:	b672      	cpsid	i
 80001aa:	4770      	bx	lr

080001ac <sched_on>:
 80001ac:	b662      	cpsie	i
 80001ae:	4770      	bx	lr

080001b0 <yield>:
 80001b0:	46c0      	nop			; (mov r8, r8)
 80001b2:	4770      	bx	lr

080001b4 <get_thread_id>:
 80001b4:	b082      	sub	sp, #8
 80001b6:	b672      	cpsid	i
 80001b8:	4b03      	ldr	r3, [pc, #12]	; (80001c8 <get_thread_id+0x14>)
 80001ba:	681b      	ldr	r3, [r3, #0]
 80001bc:	9301      	str	r3, [sp, #4]
 80001be:	b662      	cpsie	i
 80001c0:	9801      	ldr	r0, [sp, #4]
 80001c2:	b002      	add	sp, #8
 80001c4:	4770      	bx	lr
 80001c6:	46c0      	nop			; (mov r8, r8)
 80001c8:	2000006c 	.word	0x2000006c

080001cc <create_thread>:
 80001cc:	b5f0      	push	{r4, r5, r6, r7, lr}
 80001ce:	b085      	sub	sp, #20
 80001d0:	9003      	str	r0, [sp, #12]
 80001d2:	481b      	ldr	r0, [pc, #108]	; (8000240 <create_thread+0x74>)
 80001d4:	0892      	lsrs	r2, r2, #2
 80001d6:	1812      	adds	r2, r2, r0
 80001d8:	0092      	lsls	r2, r2, #2
 80001da:	1888      	adds	r0, r1, r2
 80001dc:	1c17      	adds	r7, r2, #0
 80001de:	9002      	str	r0, [sp, #8]
 80001e0:	1c10      	adds	r0, r2, #0
 80001e2:	323c      	adds	r2, #60	; 0x3c
 80001e4:	188a      	adds	r2, r1, r2
 80001e6:	3034      	adds	r0, #52	; 0x34
 80001e8:	3738      	adds	r7, #56	; 0x38
 80001ea:	9201      	str	r2, [sp, #4]
 80001ec:	180e      	adds	r6, r1, r0
 80001ee:	19cf      	adds	r7, r1, r7
 80001f0:	2200      	movs	r2, #0
 80001f2:	b672      	cpsid	i
 80001f4:	250c      	movs	r5, #12
 80001f6:	4355      	muls	r5, r2
 80001f8:	4c12      	ldr	r4, [pc, #72]	; (8000244 <create_thread+0x78>)
 80001fa:	2008      	movs	r0, #8
 80001fc:	1965      	adds	r5, r4, r5
 80001fe:	6869      	ldr	r1, [r5, #4]
 8000200:	07c9      	lsls	r1, r1, #31
 8000202:	d415      	bmi.n	8000230 <create_thread+0x64>
 8000204:	9902      	ldr	r1, [sp, #8]
 8000206:	60a9      	str	r1, [r5, #8]
 8000208:	4d0f      	ldr	r5, [pc, #60]	; (8000248 <create_thread+0x7c>)
 800020a:	9903      	ldr	r1, [sp, #12]
 800020c:	6035      	str	r5, [r6, #0]
 800020e:	6039      	str	r1, [r7, #0]
 8000210:	2584      	movs	r5, #132	; 0x84
 8000212:	9901      	ldr	r1, [sp, #4]
 8000214:	05ad      	lsls	r5, r5, #22
 8000216:	600d      	str	r5, [r1, #0]
 8000218:	2b07      	cmp	r3, #7
 800021a:	d800      	bhi.n	800021e <create_thread+0x52>
 800021c:	1c03      	adds	r3, r0, #0
 800021e:	200c      	movs	r0, #12
 8000220:	4350      	muls	r0, r2
 8000222:	4908      	ldr	r1, [pc, #32]	; (8000244 <create_thread+0x78>)
 8000224:	180d      	adds	r5, r1, r0
 8000226:	806b      	strh	r3, [r5, #2]
 8000228:	5223      	strh	r3, [r4, r0]
 800022a:	2001      	movs	r0, #1
 800022c:	6068      	str	r0, [r5, #4]
 800022e:	1c10      	adds	r0, r2, #0
 8000230:	b662      	cpsie	i
 8000232:	3201      	adds	r2, #1
 8000234:	2a08      	cmp	r2, #8
 8000236:	d001      	beq.n	800023c <create_thread+0x70>
 8000238:	2808      	cmp	r0, #8
 800023a:	d0da      	beq.n	80001f2 <create_thread+0x26>
 800023c:	b005      	add	sp, #20
 800023e:	bdf0      	pop	{r4, r5, r6, r7, pc}
 8000240:	3ffffff0 	.word	0x3ffffff0
 8000244:	2000000c 	.word	0x2000000c
 8000248:	080000c1 	.word	0x080000c1

0800024c <kernel_init>:
 800024c:	b510      	push	{r4, lr}
 800024e:	2300      	movs	r3, #0
 8000250:	210c      	movs	r1, #12
 8000252:	4359      	muls	r1, r3
 8000254:	4a0a      	ldr	r2, [pc, #40]	; (8000280 <kernel_init+0x34>)
 8000256:	2000      	movs	r0, #0
 8000258:	1854      	adds	r4, r2, r1
 800025a:	6060      	str	r0, [r4, #4]
 800025c:	3301      	adds	r3, #1
 800025e:	2008      	movs	r0, #8
 8000260:	8060      	strh	r0, [r4, #2]
 8000262:	5288      	strh	r0, [r1, r2]
 8000264:	4283      	cmp	r3, r0
 8000266:	d1f3      	bne.n	8000250 <kernel_init+0x4>
 8000268:	4b06      	ldr	r3, [pc, #24]	; (8000284 <kernel_init+0x38>)
 800026a:	2201      	movs	r2, #1
 800026c:	4252      	negs	r2, r2
 800026e:	601a      	str	r2, [r3, #0]
 8000270:	4905      	ldr	r1, [pc, #20]	; (8000288 <kernel_init+0x3c>)
 8000272:	2280      	movs	r2, #128	; 0x80
 8000274:	23ff      	movs	r3, #255	; 0xff
 8000276:	4805      	ldr	r0, [pc, #20]	; (800028c <kernel_init+0x40>)
 8000278:	f7ff ffa8 	bl	80001cc <create_thread>
 800027c:	bd10      	pop	{r4, pc}
 800027e:	46c0      	nop			; (mov r8, r8)
 8000280:	2000000c 	.word	0x2000000c
 8000284:	2000006c 	.word	0x2000006c
 8000288:	20000070 	.word	0x20000070
 800028c:	080000e1 	.word	0x080000e1

08000290 <set_wait_state>:
 8000290:	b507      	push	{r0, r1, r2, lr}
 8000292:	f7ff ff8f 	bl	80001b4 <get_thread_id>
 8000296:	9000      	str	r0, [sp, #0]
 8000298:	b672      	cpsid	i
 800029a:	9a00      	ldr	r2, [sp, #0]
 800029c:	210c      	movs	r1, #12
 800029e:	434a      	muls	r2, r1
 80002a0:	4b0b      	ldr	r3, [pc, #44]	; (80002d0 <set_wait_state+0x40>)
 80002a2:	2002      	movs	r0, #2
 80002a4:	189a      	adds	r2, r3, r2
 80002a6:	6851      	ldr	r1, [r2, #4]
 80002a8:	4301      	orrs	r1, r0
 80002aa:	6051      	str	r1, [r2, #4]
 80002ac:	1c19      	adds	r1, r3, #0
 80002ae:	b672      	cpsid	i
 80002b0:	9b00      	ldr	r3, [sp, #0]
 80002b2:	220c      	movs	r2, #12
 80002b4:	4353      	muls	r3, r2
 80002b6:	18cb      	adds	r3, r1, r3
 80002b8:	685b      	ldr	r3, [r3, #4]
 80002ba:	9301      	str	r3, [sp, #4]
 80002bc:	b662      	cpsie	i
 80002be:	9a01      	ldr	r2, [sp, #4]
 80002c0:	2302      	movs	r3, #2
 80002c2:	421a      	tst	r2, r3
 80002c4:	d000      	beq.n	80002c8 <set_wait_state+0x38>
 80002c6:	46c0      	nop			; (mov r8, r8)
 80002c8:	9a01      	ldr	r2, [sp, #4]
 80002ca:	421a      	tst	r2, r3
 80002cc:	d1ef      	bne.n	80002ae <set_wait_state+0x1e>
 80002ce:	bd07      	pop	{r0, r1, r2, pc}
 80002d0:	2000000c 	.word	0x2000000c

080002d4 <wake_up_threads>:
 80002d4:	2300      	movs	r3, #0
 80002d6:	b672      	cpsid	i
 80002d8:	220c      	movs	r2, #12
 80002da:	435a      	muls	r2, r3
 80002dc:	4905      	ldr	r1, [pc, #20]	; (80002f4 <wake_up_threads+0x20>)
 80002de:	2002      	movs	r0, #2
 80002e0:	188a      	adds	r2, r1, r2
 80002e2:	6851      	ldr	r1, [r2, #4]
 80002e4:	4381      	bics	r1, r0
 80002e6:	6051      	str	r1, [r2, #4]
 80002e8:	b662      	cpsie	i
 80002ea:	3301      	adds	r3, #1
 80002ec:	2b08      	cmp	r3, #8
 80002ee:	d1f2      	bne.n	80002d6 <wake_up_threads+0x2>
 80002f0:	4770      	bx	lr
 80002f2:	46c0      	nop			; (mov r8, r8)
 80002f4:	2000000c 	.word	0x2000000c

080002f8 <messages_init>:
 80002f8:	b510      	push	{r4, lr}
 80002fa:	2200      	movs	r2, #0
 80002fc:	4909      	ldr	r1, [pc, #36]	; (8000324 <messages_init+0x2c>)
 80002fe:	0090      	lsls	r0, r2, #2
 8000300:	2300      	movs	r3, #0
 8000302:	3201      	adds	r2, #1
 8000304:	5043      	str	r3, [r0, r1]
 8000306:	2a08      	cmp	r2, #8
 8000308:	d1f8      	bne.n	80002fc <messages_init+0x4>
 800030a:	4807      	ldr	r0, [pc, #28]	; (8000328 <messages_init+0x30>)
 800030c:	011c      	lsls	r4, r3, #4
 800030e:	2200      	movs	r2, #0
 8000310:	1901      	adds	r1, r0, r4
 8000312:	3301      	adds	r3, #1
 8000314:	604a      	str	r2, [r1, #4]
 8000316:	5022      	str	r2, [r4, r0]
 8000318:	60ca      	str	r2, [r1, #12]
 800031a:	608a      	str	r2, [r1, #8]
 800031c:	2b04      	cmp	r3, #4
 800031e:	d1f4      	bne.n	800030a <messages_init+0x12>
 8000320:	bd10      	pop	{r4, pc}
 8000322:	46c0      	nop			; (mov r8, r8)
 8000324:	200000f0 	.word	0x200000f0
 8000328:	20000110 	.word	0x20000110

0800032c <putc_>:
 800032c:	b538      	push	{r3, r4, r5, lr}
 800032e:	4c06      	ldr	r4, [pc, #24]	; (8000348 <putc_+0x1c>)
 8000330:	1c05      	adds	r5, r0, #0
 8000332:	1c20      	adds	r0, r4, #0
 8000334:	f000 f8ff 	bl	8000536 <mutex_lock>
 8000338:	1c28      	adds	r0, r5, #0
 800033a:	f000 f9e1 	bl	8000700 <uart_write>
 800033e:	1c20      	adds	r0, r4, #0
 8000340:	f000 f915 	bl	800056e <mutex_unlock>
 8000344:	bd38      	pop	{r3, r4, r5, pc}
 8000346:	46c0      	nop			; (mov r8, r8)
 8000348:	20000150 	.word	0x20000150

0800034c <puts_>:
 800034c:	b538      	push	{r3, r4, r5, lr}
 800034e:	4d08      	ldr	r5, [pc, #32]	; (8000370 <puts_+0x24>)
 8000350:	1c04      	adds	r4, r0, #0
 8000352:	1c28      	adds	r0, r5, #0
 8000354:	f000 f8ef 	bl	8000536 <mutex_lock>
 8000358:	3401      	adds	r4, #1
 800035a:	1e63      	subs	r3, r4, #1
 800035c:	7818      	ldrb	r0, [r3, #0]
 800035e:	2800      	cmp	r0, #0
 8000360:	d002      	beq.n	8000368 <puts_+0x1c>
 8000362:	f7ff ffe3 	bl	800032c <putc_>
 8000366:	e7f7      	b.n	8000358 <puts_+0xc>
 8000368:	1c28      	adds	r0, r5, #0
 800036a:	f000 f900 	bl	800056e <mutex_unlock>
 800036e:	bd38      	pop	{r3, r4, r5, pc}
 8000370:	2000015c 	.word	0x2000015c

08000374 <puti_>:
 8000374:	b5f0      	push	{r4, r5, r6, r7, lr}
 8000376:	2300      	movs	r3, #0
 8000378:	b085      	sub	sp, #20
 800037a:	1c04      	adds	r4, r0, #0
 800037c:	1c1f      	adds	r7, r3, #0
 800037e:	4298      	cmp	r0, r3
 8000380:	da01      	bge.n	8000386 <puti_+0x12>
 8000382:	4244      	negs	r4, r0
 8000384:	2701      	movs	r7, #1
 8000386:	ae01      	add	r6, sp, #4
 8000388:	72f3      	strb	r3, [r6, #11]
 800038a:	250a      	movs	r5, #10
 800038c:	1c20      	adds	r0, r4, #0
 800038e:	210a      	movs	r1, #10
 8000390:	f001 f892 	bl	80014b8 <__aeabi_idivmod>
 8000394:	3130      	adds	r1, #48	; 0x30
 8000396:	5571      	strb	r1, [r6, r5]
 8000398:	1c20      	adds	r0, r4, #0
 800039a:	210a      	movs	r1, #10
 800039c:	f001 f836 	bl	800140c <__aeabi_idiv>
 80003a0:	1e6b      	subs	r3, r5, #1
 80003a2:	1e04      	subs	r4, r0, #0
 80003a4:	d001      	beq.n	80003aa <puti_+0x36>
 80003a6:	1c1d      	adds	r5, r3, #0
 80003a8:	e7f0      	b.n	800038c <puti_+0x18>
 80003aa:	2f00      	cmp	r7, #0
 80003ac:	d002      	beq.n	80003b4 <puti_+0x40>
 80003ae:	222d      	movs	r2, #45	; 0x2d
 80003b0:	54f2      	strb	r2, [r6, r3]
 80003b2:	1c1d      	adds	r5, r3, #0
 80003b4:	1970      	adds	r0, r6, r5
 80003b6:	f7ff ffc9 	bl	800034c <puts_>
 80003ba:	b005      	add	sp, #20
 80003bc:	bdf0      	pop	{r4, r5, r6, r7, pc}

080003be <putui_>:
 80003be:	b57f      	push	{r0, r1, r2, r3, r4, r5, r6, lr}
 80003c0:	2300      	movs	r3, #0
 80003c2:	ae01      	add	r6, sp, #4
 80003c4:	1c05      	adds	r5, r0, #0
 80003c6:	72f3      	strb	r3, [r6, #11]
 80003c8:	240a      	movs	r4, #10
 80003ca:	1c28      	adds	r0, r5, #0
 80003cc:	210a      	movs	r1, #10
 80003ce:	f001 f813 	bl	80013f8 <__aeabi_uidivmod>
 80003d2:	3130      	adds	r1, #48	; 0x30
 80003d4:	5531      	strb	r1, [r6, r4]
 80003d6:	1c28      	adds	r0, r5, #0
 80003d8:	210a      	movs	r1, #10
 80003da:	f000 ffc9 	bl	8001370 <__aeabi_uidiv>
 80003de:	1e63      	subs	r3, r4, #1
 80003e0:	1e05      	subs	r5, r0, #0
 80003e2:	d001      	beq.n	80003e8 <putui_+0x2a>
 80003e4:	1c1c      	adds	r4, r3, #0
 80003e6:	e7f0      	b.n	80003ca <putui_+0xc>
 80003e8:	1930      	adds	r0, r6, r4
 80003ea:	f7ff ffaf 	bl	800034c <puts_>
 80003ee:	bd7f      	pop	{r0, r1, r2, r3, r4, r5, r6, pc}

080003f0 <putx_>:
 80003f0:	b51f      	push	{r0, r1, r2, r3, r4, lr}
 80003f2:	2300      	movs	r3, #0
 80003f4:	aa01      	add	r2, sp, #4
 80003f6:	72d3      	strb	r3, [r2, #11]
 80003f8:	230a      	movs	r3, #10
 80003fa:	210f      	movs	r1, #15
 80003fc:	4001      	ands	r1, r0
 80003fe:	2909      	cmp	r1, #9
 8000400:	d801      	bhi.n	8000406 <putx_+0x16>
 8000402:	3130      	adds	r1, #48	; 0x30
 8000404:	e000      	b.n	8000408 <putx_+0x18>
 8000406:	3157      	adds	r1, #87	; 0x57
 8000408:	54d1      	strb	r1, [r2, r3]
 800040a:	0900      	lsrs	r0, r0, #4
 800040c:	1e59      	subs	r1, r3, #1
 800040e:	2800      	cmp	r0, #0
 8000410:	d001      	beq.n	8000416 <putx_+0x26>
 8000412:	1c0b      	adds	r3, r1, #0
 8000414:	e7f1      	b.n	80003fa <putx_+0xa>
 8000416:	18d0      	adds	r0, r2, r3
 8000418:	f7ff ff98 	bl	800034c <puts_>
 800041c:	b005      	add	sp, #20
 800041e:	bd00      	pop	{pc}

08000420 <printf_>:
 8000420:	b40f      	push	{r0, r1, r2, r3}
 8000422:	b573      	push	{r0, r1, r4, r5, r6, lr}
 8000424:	4e25      	ldr	r6, [pc, #148]	; (80004bc <printf_+0x9c>)
 8000426:	ac06      	add	r4, sp, #24
 8000428:	cc20      	ldmia	r4!, {r5}
 800042a:	1c30      	adds	r0, r6, #0
 800042c:	f000 f883 	bl	8000536 <mutex_lock>
 8000430:	9401      	str	r4, [sp, #4]
 8000432:	2400      	movs	r4, #0
 8000434:	5d28      	ldrb	r0, [r5, r4]
 8000436:	2800      	cmp	r0, #0
 8000438:	d039      	beq.n	80004ae <printf_+0x8e>
 800043a:	2825      	cmp	r0, #37	; 0x25
 800043c:	d003      	beq.n	8000446 <printf_+0x26>
 800043e:	f7ff ff75 	bl	800032c <putc_>
 8000442:	3401      	adds	r4, #1
 8000444:	e7f6      	b.n	8000434 <printf_+0x14>
 8000446:	192b      	adds	r3, r5, r4
 8000448:	7858      	ldrb	r0, [r3, #1]
 800044a:	2869      	cmp	r0, #105	; 0x69
 800044c:	d016      	beq.n	800047c <printf_+0x5c>
 800044e:	d808      	bhi.n	8000462 <printf_+0x42>
 8000450:	2825      	cmp	r0, #37	; 0x25
 8000452:	d028      	beq.n	80004a6 <printf_+0x86>
 8000454:	2863      	cmp	r0, #99	; 0x63
 8000456:	d128      	bne.n	80004aa <printf_+0x8a>
 8000458:	9b01      	ldr	r3, [sp, #4]
 800045a:	1d1a      	adds	r2, r3, #4
 800045c:	9201      	str	r2, [sp, #4]
 800045e:	7818      	ldrb	r0, [r3, #0]
 8000460:	e021      	b.n	80004a6 <printf_+0x86>
 8000462:	2875      	cmp	r0, #117	; 0x75
 8000464:	d011      	beq.n	800048a <printf_+0x6a>
 8000466:	2878      	cmp	r0, #120	; 0x78
 8000468:	d016      	beq.n	8000498 <printf_+0x78>
 800046a:	2873      	cmp	r0, #115	; 0x73
 800046c:	d11d      	bne.n	80004aa <printf_+0x8a>
 800046e:	9b01      	ldr	r3, [sp, #4]
 8000470:	1d1a      	adds	r2, r3, #4
 8000472:	6818      	ldr	r0, [r3, #0]
 8000474:	9201      	str	r2, [sp, #4]
 8000476:	f7ff ff69 	bl	800034c <puts_>
 800047a:	e016      	b.n	80004aa <printf_+0x8a>
 800047c:	9b01      	ldr	r3, [sp, #4]
 800047e:	1d1a      	adds	r2, r3, #4
 8000480:	6818      	ldr	r0, [r3, #0]
 8000482:	9201      	str	r2, [sp, #4]
 8000484:	f7ff ff76 	bl	8000374 <puti_>
 8000488:	e00f      	b.n	80004aa <printf_+0x8a>
 800048a:	9b01      	ldr	r3, [sp, #4]
 800048c:	1d1a      	adds	r2, r3, #4
 800048e:	6818      	ldr	r0, [r3, #0]
 8000490:	9201      	str	r2, [sp, #4]
 8000492:	f7ff ff94 	bl	80003be <putui_>
 8000496:	e008      	b.n	80004aa <printf_+0x8a>
 8000498:	9b01      	ldr	r3, [sp, #4]
 800049a:	1d1a      	adds	r2, r3, #4
 800049c:	6818      	ldr	r0, [r3, #0]
 800049e:	9201      	str	r2, [sp, #4]
 80004a0:	f7ff ffa6 	bl	80003f0 <putx_>
 80004a4:	e001      	b.n	80004aa <printf_+0x8a>
 80004a6:	f7ff ff41 	bl	800032c <putc_>
 80004aa:	3402      	adds	r4, #2
 80004ac:	e7c2      	b.n	8000434 <printf_+0x14>
 80004ae:	1c30      	adds	r0, r6, #0
 80004b0:	f000 f85d 	bl	800056e <mutex_unlock>
 80004b4:	bc73      	pop	{r0, r1, r4, r5, r6}
 80004b6:	bc08      	pop	{r3}
 80004b8:	b004      	add	sp, #16
 80004ba:	4718      	bx	r3
 80004bc:	20000158 	.word	0x20000158

080004c0 <stdio_init>:
 80004c0:	b510      	push	{r4, lr}
 80004c2:	480f      	ldr	r0, [pc, #60]	; (8000500 <stdio_init+0x40>)
 80004c4:	f000 f82e 	bl	8000524 <mutex_init>
 80004c8:	480e      	ldr	r0, [pc, #56]	; (8000504 <stdio_init+0x44>)
 80004ca:	f000 f82b 	bl	8000524 <mutex_init>
 80004ce:	480e      	ldr	r0, [pc, #56]	; (8000508 <stdio_init+0x48>)
 80004d0:	f000 f828 	bl	8000524 <mutex_init>
 80004d4:	480d      	ldr	r0, [pc, #52]	; (800050c <stdio_init+0x4c>)
 80004d6:	f000 f825 	bl	8000524 <mutex_init>
 80004da:	2408      	movs	r4, #8
 80004dc:	2020      	movs	r0, #32
 80004de:	3c01      	subs	r4, #1
 80004e0:	f7ff ff24 	bl	800032c <putc_>
 80004e4:	2c00      	cmp	r4, #0
 80004e6:	d1f9      	bne.n	80004dc <stdio_init+0x1c>
 80004e8:	2420      	movs	r4, #32
 80004ea:	200a      	movs	r0, #10
 80004ec:	3c01      	subs	r4, #1
 80004ee:	f7ff ff1d 	bl	800032c <putc_>
 80004f2:	2c00      	cmp	r4, #0
 80004f4:	d1f9      	bne.n	80004ea <stdio_init+0x2a>
 80004f6:	4806      	ldr	r0, [pc, #24]	; (8000510 <stdio_init+0x50>)
 80004f8:	f7ff ff92 	bl	8000420 <printf_>
 80004fc:	bd10      	pop	{r4, pc}
 80004fe:	46c0      	nop			; (mov r8, r8)
 8000500:	20000150 	.word	0x20000150
 8000504:	20000154 	.word	0x20000154
 8000508:	2000015c 	.word	0x2000015c
 800050c:	20000158 	.word	0x20000158
 8000510:	08001584 	.word	0x08001584

08000514 <lib_os_init>:
 8000514:	b508      	push	{r3, lr}
 8000516:	f7ff fe99 	bl	800024c <kernel_init>
 800051a:	f7ff feed 	bl	80002f8 <messages_init>
 800051e:	f7ff ffcf 	bl	80004c0 <stdio_init>
 8000522:	bd08      	pop	{r3, pc}

08000524 <mutex_init>:
 8000524:	b510      	push	{r4, lr}
 8000526:	1c04      	adds	r4, r0, #0
 8000528:	f7ff fe3e 	bl	80001a8 <sched_off>
 800052c:	2300      	movs	r3, #0
 800052e:	6023      	str	r3, [r4, #0]
 8000530:	f7ff fe3c 	bl	80001ac <sched_on>
 8000534:	bd10      	pop	{r4, pc}

08000536 <mutex_lock>:
 8000536:	b513      	push	{r0, r1, r4, lr}
 8000538:	1c04      	adds	r4, r0, #0
 800053a:	f7ff fe35 	bl	80001a8 <sched_off>
 800053e:	6823      	ldr	r3, [r4, #0]
 8000540:	9301      	str	r3, [sp, #4]
 8000542:	f7ff fe33 	bl	80001ac <sched_on>
 8000546:	9b01      	ldr	r3, [sp, #4]
 8000548:	2b00      	cmp	r3, #0
 800054a:	d001      	beq.n	8000550 <mutex_lock+0x1a>
 800054c:	f7ff fea0 	bl	8000290 <set_wait_state>
 8000550:	9b01      	ldr	r3, [sp, #4]
 8000552:	2b00      	cmp	r3, #0
 8000554:	d1f1      	bne.n	800053a <mutex_lock+0x4>
 8000556:	f7ff fe27 	bl	80001a8 <sched_off>
 800055a:	6823      	ldr	r3, [r4, #0]
 800055c:	9301      	str	r3, [sp, #4]
 800055e:	9b01      	ldr	r3, [sp, #4]
 8000560:	2b00      	cmp	r3, #0
 8000562:	d1ea      	bne.n	800053a <mutex_lock+0x4>
 8000564:	2301      	movs	r3, #1
 8000566:	6023      	str	r3, [r4, #0]
 8000568:	f7ff fe20 	bl	80001ac <sched_on>
 800056c:	bd13      	pop	{r0, r1, r4, pc}

0800056e <mutex_unlock>:
 800056e:	b508      	push	{r3, lr}
 8000570:	f7ff ffd8 	bl	8000524 <mutex_init>
 8000574:	f7ff feae 	bl	80002d4 <wake_up_threads>
 8000578:	f7ff fe1a 	bl	80001b0 <yield>
 800057c:	bd08      	pop	{r3, pc}
	...

08000580 <mem_info_print>:
 8000580:	b538      	push	{r3, r4, r5, lr}
 8000582:	490e      	ldr	r1, [pc, #56]	; (80005bc <mem_info_print+0x3c>)
 8000584:	480e      	ldr	r0, [pc, #56]	; (80005c0 <mem_info_print+0x40>)
 8000586:	f7ff ff4b 	bl	8000420 <printf_>
 800058a:	4c0e      	ldr	r4, [pc, #56]	; (80005c4 <mem_info_print+0x44>)
 800058c:	480e      	ldr	r0, [pc, #56]	; (80005c8 <mem_info_print+0x48>)
 800058e:	1c21      	adds	r1, r4, #0
 8000590:	f7ff ff46 	bl	8000420 <printf_>
 8000594:	4d0d      	ldr	r5, [pc, #52]	; (80005cc <mem_info_print+0x4c>)
 8000596:	480e      	ldr	r0, [pc, #56]	; (80005d0 <mem_info_print+0x50>)
 8000598:	1b2d      	subs	r5, r5, r4
 800059a:	1c29      	adds	r1, r5, #0
 800059c:	f7ff ff40 	bl	8000420 <printf_>
 80005a0:	490c      	ldr	r1, [pc, #48]	; (80005d4 <mem_info_print+0x54>)
 80005a2:	480d      	ldr	r0, [pc, #52]	; (80005d8 <mem_info_print+0x58>)
 80005a4:	1a64      	subs	r4, r4, r1
 80005a6:	1929      	adds	r1, r5, r4
 80005a8:	f7ff ff3a 	bl	8000420 <printf_>
 80005ac:	490b      	ldr	r1, [pc, #44]	; (80005dc <mem_info_print+0x5c>)
 80005ae:	480c      	ldr	r0, [pc, #48]	; (80005e0 <mem_info_print+0x60>)
 80005b0:	f7ff ff36 	bl	8000420 <printf_>
 80005b4:	480b      	ldr	r0, [pc, #44]	; (80005e4 <mem_info_print+0x64>)
 80005b6:	f7ff ff33 	bl	8000420 <printf_>
 80005ba:	bd38      	pop	{r3, r4, r5, pc}
 80005bc:	0800156c 	.word	0x0800156c
 80005c0:	08001595 	.word	0x08001595
 80005c4:	20000000 	.word	0x20000000
 80005c8:	080015a6 	.word	0x080015a6
 80005cc:	20002000 	.word	0x20002000
 80005d0:	080015b5 	.word	0x080015b5
 80005d4:	200001ac 	.word	0x200001ac
 80005d8:	080015c3 	.word	0x080015c3
 80005dc:	200001ac 	.word	0x200001ac
 80005e0:	080015d1 	.word	0x080015d1
 80005e4:	080015e1 	.word	0x080015e1

080005e8 <main>:
 80005e8:	b508      	push	{r3, lr}
 80005ea:	f000 fe4b 	bl	8001284 <lib_low_level_init>
 80005ee:	f7ff ff91 	bl	8000514 <lib_os_init>
 80005f2:	f7ff ffc5 	bl	8000580 <mem_info_print>
 80005f6:	2008      	movs	r0, #8
 80005f8:	f000 fe78 	bl	80012ec <led_on>
 80005fc:	e7fb      	b.n	80005f6 <main+0xe>
	...

08000600 <LPTIM1_IRQHandler>:
 8000600:	b508      	push	{r3, lr}
 8000602:	2008      	movs	r0, #8
 8000604:	f000 fe78 	bl	80012f8 <led_off>
 8000608:	4b03      	ldr	r3, [pc, #12]	; (8000618 <LPTIM1_IRQHandler+0x18>)
 800060a:	681a      	ldr	r2, [r3, #0]
 800060c:	3201      	adds	r2, #1
 800060e:	601a      	str	r2, [r3, #0]
 8000610:	4b02      	ldr	r3, [pc, #8]	; (800061c <LPTIM1_IRQHandler+0x1c>)
 8000612:	2201      	movs	r2, #1
 8000614:	605a      	str	r2, [r3, #4]
 8000616:	bd08      	pop	{r3, pc}
 8000618:	20000004 	.word	0x20000004
 800061c:	40007c00 	.word	0x40007c00

08000620 <timer_delay_loops>:
 8000620:	3801      	subs	r0, #1
 8000622:	d301      	bcc.n	8000628 <timer_delay_loops+0x8>
 8000624:	46c0      	nop			; (mov r8, r8)
 8000626:	e7fb      	b.n	8000620 <timer_delay_loops>
 8000628:	4770      	bx	lr
	...

0800062c <timer_init>:
 800062c:	b570      	push	{r4, r5, r6, lr}
 800062e:	2300      	movs	r3, #0
 8000630:	b08e      	sub	sp, #56	; 0x38
 8000632:	481c      	ldr	r0, [pc, #112]	; (80006a4 <timer_init+0x78>)
 8000634:	2180      	movs	r1, #128	; 0x80
 8000636:	005a      	lsls	r2, r3, #1
 8000638:	00c9      	lsls	r1, r1, #3
 800063a:	5211      	strh	r1, [r2, r0]
 800063c:	481a      	ldr	r0, [pc, #104]	; (80006a8 <timer_init+0x7c>)
 800063e:	2500      	movs	r5, #0
 8000640:	5211      	strh	r1, [r2, r0]
 8000642:	491a      	ldr	r1, [pc, #104]	; (80006ac <timer_init+0x80>)
 8000644:	3301      	adds	r3, #1
 8000646:	5255      	strh	r5, [r2, r1]
 8000648:	2b04      	cmp	r3, #4
 800064a:	d1f2      	bne.n	8000632 <timer_init+0x6>
 800064c:	4b18      	ldr	r3, [pc, #96]	; (80006b0 <timer_init+0x84>)
 800064e:	2608      	movs	r6, #8
 8000650:	601d      	str	r5, [r3, #0]
 8000652:	a801      	add	r0, sp, #4
 8000654:	2301      	movs	r3, #1
 8000656:	9306      	str	r3, [sp, #24]
 8000658:	9601      	str	r6, [sp, #4]
 800065a:	950a      	str	r5, [sp, #40]	; 0x28
 800065c:	f000 f97c 	bl	8000958 <HAL_RCC_OscConfig>
 8000660:	2380      	movs	r3, #128	; 0x80
 8000662:	9301      	str	r3, [sp, #4]
 8000664:	a801      	add	r0, sp, #4
 8000666:	02db      	lsls	r3, r3, #11
 8000668:	9306      	str	r3, [sp, #24]
 800066a:	f000 fd2b 	bl	80010c4 <HAL_RCCEx_PeriphCLKConfig>
 800066e:	4c11      	ldr	r4, [pc, #68]	; (80006b4 <timer_init+0x88>)
 8000670:	4b11      	ldr	r3, [pc, #68]	; (80006b8 <timer_init+0x8c>)
 8000672:	1c20      	adds	r0, r4, #0
 8000674:	6023      	str	r3, [r4, #0]
 8000676:	2380      	movs	r3, #128	; 0x80
 8000678:	029b      	lsls	r3, r3, #10
 800067a:	61a3      	str	r3, [r4, #24]
 800067c:	6065      	str	r5, [r4, #4]
 800067e:	60a5      	str	r5, [r4, #8]
 8000680:	6165      	str	r5, [r4, #20]
 8000682:	62a5      	str	r5, [r4, #40]	; 0x28
 8000684:	f000 f8a2 	bl	80007cc <HAL_LPTIM_Init>
 8000688:	1c20      	adds	r0, r4, #0
 800068a:	490c      	ldr	r1, [pc, #48]	; (80006bc <timer_init+0x90>)
 800068c:	4a0c      	ldr	r2, [pc, #48]	; (80006c0 <timer_init+0x94>)
 800068e:	f000 f8e3 	bl	8000858 <HAL_LPTIM_TimeOut_Start_IT>
 8000692:	1c30      	adds	r0, r6, #0
 8000694:	f000 fe2a 	bl	80012ec <led_on>
 8000698:	20fa      	movs	r0, #250	; 0xfa
 800069a:	0080      	lsls	r0, r0, #2
 800069c:	f7ff ffc0 	bl	8000620 <timer_delay_loops>
 80006a0:	e7fa      	b.n	8000698 <timer_init+0x6c>
 80006a2:	46c0      	nop			; (mov r8, r8)
 80006a4:	200001a4 	.word	0x200001a4
 80006a8:	20000198 	.word	0x20000198
 80006ac:	20000190 	.word	0x20000190
 80006b0:	200001a0 	.word	0x200001a0
 80006b4:	20000160 	.word	0x20000160
 80006b8:	40007c00 	.word	0x40007c00
 80006bc:	0000ffff 	.word	0x0000ffff
 80006c0:	00007fff 	.word	0x00007fff

080006c4 <timer_get_time>:
 80006c4:	b082      	sub	sp, #8
 80006c6:	b672      	cpsid	i
 80006c8:	4b03      	ldr	r3, [pc, #12]	; (80006d8 <timer_get_time+0x14>)
 80006ca:	681b      	ldr	r3, [r3, #0]
 80006cc:	9301      	str	r3, [sp, #4]
 80006ce:	b662      	cpsie	i
 80006d0:	9801      	ldr	r0, [sp, #4]
 80006d2:	b002      	add	sp, #8
 80006d4:	4770      	bx	lr
 80006d6:	46c0      	nop			; (mov r8, r8)
 80006d8:	200001a0 	.word	0x200001a0

080006dc <timer_delay_ms>:
 80006dc:	b513      	push	{r0, r1, r4, lr}
 80006de:	1c04      	adds	r4, r0, #0
 80006e0:	f7ff fff0 	bl	80006c4 <timer_get_time>
 80006e4:	1904      	adds	r4, r0, r4
 80006e6:	9401      	str	r4, [sp, #4]
 80006e8:	9c01      	ldr	r4, [sp, #4]
 80006ea:	f7ff ffeb 	bl	80006c4 <timer_get_time>
 80006ee:	4284      	cmp	r4, r0
 80006f0:	d904      	bls.n	80006fc <timer_delay_ms+0x20>
 80006f2:	f7ff fd5d 	bl	80001b0 <yield>
 80006f6:	f000 f851 	bl	800079c <sleep>
 80006fa:	e7f5      	b.n	80006e8 <timer_delay_ms+0xc>
 80006fc:	bd13      	pop	{r0, r1, r4, pc}
	...

08000700 <uart_write>:
 8000700:	4b03      	ldr	r3, [pc, #12]	; (8000710 <uart_write+0x10>)
 8000702:	6298      	str	r0, [r3, #40]	; 0x28
 8000704:	69da      	ldr	r2, [r3, #28]
 8000706:	0651      	lsls	r1, r2, #25
 8000708:	d401      	bmi.n	800070e <uart_write+0xe>
 800070a:	46c0      	nop			; (mov r8, r8)
 800070c:	e7fa      	b.n	8000704 <uart_write+0x4>
 800070e:	4770      	bx	lr
 8000710:	40004400 	.word	0x40004400

08000714 <uart_init>:
 8000714:	4b1d      	ldr	r3, [pc, #116]	; (800078c <uart_init+0x78>)
 8000716:	b510      	push	{r4, lr}
 8000718:	6ad9      	ldr	r1, [r3, #44]	; 0x2c
 800071a:	2201      	movs	r2, #1
 800071c:	4311      	orrs	r1, r2
 800071e:	62d9      	str	r1, [r3, #44]	; 0x2c
 8000720:	6ad9      	ldr	r1, [r3, #44]	; 0x2c
 8000722:	b088      	sub	sp, #32
 8000724:	4011      	ands	r1, r2
 8000726:	9101      	str	r1, [sp, #4]
 8000728:	9901      	ldr	r1, [sp, #4]
 800072a:	6ad9      	ldr	r1, [r3, #44]	; 0x2c
 800072c:	2404      	movs	r4, #4
 800072e:	4311      	orrs	r1, r2
 8000730:	62d9      	str	r1, [r3, #44]	; 0x2c
 8000732:	6ad9      	ldr	r1, [r3, #44]	; 0x2c
 8000734:	4011      	ands	r1, r2
 8000736:	9102      	str	r1, [sp, #8]
 8000738:	9902      	ldr	r1, [sp, #8]
 800073a:	6b98      	ldr	r0, [r3, #56]	; 0x38
 800073c:	2180      	movs	r1, #128	; 0x80
 800073e:	0289      	lsls	r1, r1, #10
 8000740:	4301      	orrs	r1, r0
 8000742:	6399      	str	r1, [r3, #56]	; 0x38
 8000744:	20a0      	movs	r0, #160	; 0xa0
 8000746:	2302      	movs	r3, #2
 8000748:	9304      	str	r3, [sp, #16]
 800074a:	05c0      	lsls	r0, r0, #23
 800074c:	2303      	movs	r3, #3
 800074e:	a903      	add	r1, sp, #12
 8000750:	9205      	str	r2, [sp, #20]
 8000752:	9306      	str	r3, [sp, #24]
 8000754:	9403      	str	r4, [sp, #12]
 8000756:	9407      	str	r4, [sp, #28]
 8000758:	f000 fc04 	bl	8000f64 <HAL_GPIO_Init>
 800075c:	20a0      	movs	r0, #160	; 0xa0
 800075e:	2308      	movs	r3, #8
 8000760:	05c0      	lsls	r0, r0, #23
 8000762:	a903      	add	r1, sp, #12
 8000764:	9303      	str	r3, [sp, #12]
 8000766:	9407      	str	r4, [sp, #28]
 8000768:	f000 fbfc 	bl	8000f64 <HAL_GPIO_Init>
 800076c:	4b08      	ldr	r3, [pc, #32]	; (8000790 <uart_init+0x7c>)
 800076e:	22d0      	movs	r2, #208	; 0xd0
 8000770:	60da      	str	r2, [r3, #12]
 8000772:	220d      	movs	r2, #13
 8000774:	601a      	str	r2, [r3, #0]
 8000776:	69d8      	ldr	r0, [r3, #28]
 8000778:	2140      	movs	r1, #64	; 0x40
 800077a:	4a05      	ldr	r2, [pc, #20]	; (8000790 <uart_init+0x7c>)
 800077c:	4208      	tst	r0, r1
 800077e:	d0fa      	beq.n	8000776 <uart_init+0x62>
 8000780:	6a13      	ldr	r3, [r2, #32]
 8000782:	4319      	orrs	r1, r3
 8000784:	6211      	str	r1, [r2, #32]
 8000786:	b008      	add	sp, #32
 8000788:	bd10      	pop	{r4, pc}
 800078a:	46c0      	nop			; (mov r8, r8)
 800078c:	40021000 	.word	0x40021000
 8000790:	40004400 	.word	0x40004400

08000794 <__get_MSP>:
 8000794:	f3ef 8008 	mrs	r0, MSP
 8000798:	1c00      	adds	r0, r0, #0
 800079a:	4770      	bx	lr

0800079c <sleep>:
 800079c:	4b08      	ldr	r3, [pc, #32]	; (80007c0 <sleep+0x24>)
 800079e:	2104      	movs	r1, #4
 80007a0:	691a      	ldr	r2, [r3, #16]
 80007a2:	430a      	orrs	r2, r1
 80007a4:	611a      	str	r2, [r3, #16]
 80007a6:	4b07      	ldr	r3, [pc, #28]	; (80007c4 <sleep+0x28>)
 80007a8:	2203      	movs	r2, #3
 80007aa:	6819      	ldr	r1, [r3, #0]
 80007ac:	4391      	bics	r1, r2
 80007ae:	2201      	movs	r2, #1
 80007b0:	4311      	orrs	r1, r2
 80007b2:	6019      	str	r1, [r3, #0]
 80007b4:	6859      	ldr	r1, [r3, #4]
 80007b6:	4391      	bics	r1, r2
 80007b8:	6059      	str	r1, [r3, #4]
 80007ba:	bf30      	wfi
 80007bc:	4770      	bx	lr
 80007be:	46c0      	nop			; (mov r8, r8)
 80007c0:	e000ed00 	.word	0xe000ed00
 80007c4:	40007000 	.word	0x40007000

080007c8 <HAL_LPTIM_MspInit>:
 80007c8:	4770      	bx	lr
	...

080007cc <HAL_LPTIM_Init>:
 80007cc:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
 80007ce:	1e04      	subs	r4, r0, #0
 80007d0:	d03a      	beq.n	8000848 <HAL_LPTIM_Init+0x7c>
 80007d2:	6ac3      	ldr	r3, [r0, #44]	; 0x2c
 80007d4:	021b      	lsls	r3, r3, #8
 80007d6:	0e1b      	lsrs	r3, r3, #24
 80007d8:	b2da      	uxtb	r2, r3
 80007da:	2a00      	cmp	r2, #0
 80007dc:	d104      	bne.n	80007e8 <HAL_LPTIM_Init+0x1c>
 80007de:	1c02      	adds	r2, r0, #0
 80007e0:	322d      	adds	r2, #45	; 0x2d
 80007e2:	7013      	strb	r3, [r2, #0]
 80007e4:	f7ff fff0 	bl	80007c8 <HAL_LPTIM_MspInit>
 80007e8:	1c20      	adds	r0, r4, #0
 80007ea:	2302      	movs	r3, #2
 80007ec:	302e      	adds	r0, #46	; 0x2e
 80007ee:	6825      	ldr	r5, [r4, #0]
 80007f0:	6861      	ldr	r1, [r4, #4]
 80007f2:	7003      	strb	r3, [r0, #0]
 80007f4:	68eb      	ldr	r3, [r5, #12]
 80007f6:	2901      	cmp	r1, #1
 80007f8:	d101      	bne.n	80007fe <HAL_LPTIM_Init+0x32>
 80007fa:	221e      	movs	r2, #30
 80007fc:	4393      	bics	r3, r2
 80007fe:	6962      	ldr	r2, [r4, #20]
 8000800:	4e12      	ldr	r6, [pc, #72]	; (800084c <HAL_LPTIM_Init+0x80>)
 8000802:	42b2      	cmp	r2, r6
 8000804:	d001      	beq.n	800080a <HAL_LPTIM_Init+0x3e>
 8000806:	4f12      	ldr	r7, [pc, #72]	; (8000850 <HAL_LPTIM_Init+0x84>)
 8000808:	403b      	ands	r3, r7
 800080a:	4f12      	ldr	r7, [pc, #72]	; (8000854 <HAL_LPTIM_Init+0x88>)
 800080c:	403b      	ands	r3, r7
 800080e:	68a7      	ldr	r7, [r4, #8]
 8000810:	469c      	mov	ip, r3
 8000812:	6a23      	ldr	r3, [r4, #32]
 8000814:	430f      	orrs	r7, r1
 8000816:	431f      	orrs	r7, r3
 8000818:	6a63      	ldr	r3, [r4, #36]	; 0x24
 800081a:	431f      	orrs	r7, r3
 800081c:	6aa3      	ldr	r3, [r4, #40]	; 0x28
 800081e:	431f      	orrs	r7, r3
 8000820:	4663      	mov	r3, ip
 8000822:	433b      	orrs	r3, r7
 8000824:	2901      	cmp	r1, #1
 8000826:	d103      	bne.n	8000830 <HAL_LPTIM_Init+0x64>
 8000828:	6921      	ldr	r1, [r4, #16]
 800082a:	68e7      	ldr	r7, [r4, #12]
 800082c:	4339      	orrs	r1, r7
 800082e:	430b      	orrs	r3, r1
 8000830:	42b2      	cmp	r2, r6
 8000832:	d004      	beq.n	800083e <HAL_LPTIM_Init+0x72>
 8000834:	69a1      	ldr	r1, [r4, #24]
 8000836:	430a      	orrs	r2, r1
 8000838:	69e1      	ldr	r1, [r4, #28]
 800083a:	430a      	orrs	r2, r1
 800083c:	4313      	orrs	r3, r2
 800083e:	60eb      	str	r3, [r5, #12]
 8000840:	2301      	movs	r3, #1
 8000842:	7003      	strb	r3, [r0, #0]
 8000844:	2000      	movs	r0, #0
 8000846:	e000      	b.n	800084a <HAL_LPTIM_Init+0x7e>
 8000848:	2001      	movs	r0, #1
 800084a:	bdf8      	pop	{r3, r4, r5, r6, r7, pc}
 800084c:	0000ffff 	.word	0x0000ffff
 8000850:	ffff1f3f 	.word	0xffff1f3f
 8000854:	ff19f1fe 	.word	0xff19f1fe

08000858 <HAL_LPTIM_TimeOut_Start_IT>:
 8000858:	b530      	push	{r4, r5, lr}
 800085a:	1c04      	adds	r4, r0, #0
 800085c:	342e      	adds	r4, #46	; 0x2e
 800085e:	2302      	movs	r3, #2
 8000860:	7023      	strb	r3, [r4, #0]
 8000862:	6803      	ldr	r3, [r0, #0]
 8000864:	2080      	movs	r0, #128	; 0x80
 8000866:	68dd      	ldr	r5, [r3, #12]
 8000868:	0300      	lsls	r0, r0, #12
 800086a:	4328      	orrs	r0, r5
 800086c:	60d8      	str	r0, [r3, #12]
 800086e:	689d      	ldr	r5, [r3, #8]
 8000870:	2001      	movs	r0, #1
 8000872:	4305      	orrs	r5, r0
 8000874:	609d      	str	r5, [r3, #8]
 8000876:	691d      	ldr	r5, [r3, #16]
 8000878:	4305      	orrs	r5, r0
 800087a:	611d      	str	r5, [r3, #16]
 800087c:	6199      	str	r1, [r3, #24]
 800087e:	615a      	str	r2, [r3, #20]
 8000880:	691a      	ldr	r2, [r3, #16]
 8000882:	2104      	movs	r1, #4
 8000884:	430a      	orrs	r2, r1
 8000886:	611a      	str	r2, [r3, #16]
 8000888:	7020      	strb	r0, [r4, #0]
 800088a:	2000      	movs	r0, #0
 800088c:	bd30      	pop	{r4, r5, pc}
	...

08000890 <HAL_NVIC_SetPriority>:
 8000890:	b570      	push	{r4, r5, r6, lr}
 8000892:	0189      	lsls	r1, r1, #6
 8000894:	2800      	cmp	r0, #0
 8000896:	da15      	bge.n	80008c4 <HAL_NVIC_SetPriority+0x34>
 8000898:	b2c0      	uxtb	r0, r0
 800089a:	230f      	movs	r3, #15
 800089c:	4003      	ands	r3, r0
 800089e:	3b08      	subs	r3, #8
 80008a0:	4a12      	ldr	r2, [pc, #72]	; (80008ec <HAL_NVIC_SetPriority+0x5c>)
 80008a2:	089b      	lsrs	r3, r3, #2
 80008a4:	009b      	lsls	r3, r3, #2
 80008a6:	189b      	adds	r3, r3, r2
 80008a8:	2203      	movs	r2, #3
 80008aa:	4010      	ands	r0, r2
 80008ac:	24ff      	movs	r4, #255	; 0xff
 80008ae:	00c2      	lsls	r2, r0, #3
 80008b0:	69dd      	ldr	r5, [r3, #28]
 80008b2:	1c20      	adds	r0, r4, #0
 80008b4:	4090      	lsls	r0, r2
 80008b6:	4385      	bics	r5, r0
 80008b8:	400c      	ands	r4, r1
 80008ba:	4094      	lsls	r4, r2
 80008bc:	1c2a      	adds	r2, r5, #0
 80008be:	4322      	orrs	r2, r4
 80008c0:	61da      	str	r2, [r3, #28]
 80008c2:	e012      	b.n	80008ea <HAL_NVIC_SetPriority+0x5a>
 80008c4:	0882      	lsrs	r2, r0, #2
 80008c6:	4b0a      	ldr	r3, [pc, #40]	; (80008f0 <HAL_NVIC_SetPriority+0x60>)
 80008c8:	2403      	movs	r4, #3
 80008ca:	0092      	lsls	r2, r2, #2
 80008cc:	18d2      	adds	r2, r2, r3
 80008ce:	4020      	ands	r0, r4
 80008d0:	23c0      	movs	r3, #192	; 0xc0
 80008d2:	40a0      	lsls	r0, r4
 80008d4:	009b      	lsls	r3, r3, #2
 80008d6:	24ff      	movs	r4, #255	; 0xff
 80008d8:	58d5      	ldr	r5, [r2, r3]
 80008da:	1c26      	adds	r6, r4, #0
 80008dc:	4086      	lsls	r6, r0
 80008de:	43b5      	bics	r5, r6
 80008e0:	400c      	ands	r4, r1
 80008e2:	4084      	lsls	r4, r0
 80008e4:	1c28      	adds	r0, r5, #0
 80008e6:	4320      	orrs	r0, r4
 80008e8:	50d0      	str	r0, [r2, r3]
 80008ea:	bd70      	pop	{r4, r5, r6, pc}
 80008ec:	e000ed00 	.word	0xe000ed00
 80008f0:	e000e100 	.word	0xe000e100

080008f4 <HAL_SYSTICK_Config>:
 80008f4:	4b09      	ldr	r3, [pc, #36]	; (800091c <HAL_SYSTICK_Config+0x28>)
 80008f6:	1e42      	subs	r2, r0, #1
 80008f8:	2001      	movs	r0, #1
 80008fa:	429a      	cmp	r2, r3
 80008fc:	d80d      	bhi.n	800091a <HAL_SYSTICK_Config+0x26>
 80008fe:	4b08      	ldr	r3, [pc, #32]	; (8000920 <HAL_SYSTICK_Config+0x2c>)
 8000900:	21c0      	movs	r1, #192	; 0xc0
 8000902:	605a      	str	r2, [r3, #4]
 8000904:	4a07      	ldr	r2, [pc, #28]	; (8000924 <HAL_SYSTICK_Config+0x30>)
 8000906:	0609      	lsls	r1, r1, #24
 8000908:	6a10      	ldr	r0, [r2, #32]
 800090a:	0200      	lsls	r0, r0, #8
 800090c:	0a00      	lsrs	r0, r0, #8
 800090e:	4301      	orrs	r1, r0
 8000910:	6211      	str	r1, [r2, #32]
 8000912:	2000      	movs	r0, #0
 8000914:	2207      	movs	r2, #7
 8000916:	6098      	str	r0, [r3, #8]
 8000918:	601a      	str	r2, [r3, #0]
 800091a:	4770      	bx	lr
 800091c:	00ffffff 	.word	0x00ffffff
 8000920:	e000e010 	.word	0xe000e010
 8000924:	e000ed00 	.word	0xe000ed00

08000928 <HAL_InitTick>:
 8000928:	b510      	push	{r4, lr}
 800092a:	1c04      	adds	r4, r0, #0
 800092c:	f000 fb06 	bl	8000f3c <HAL_RCC_GetHCLKFreq>
 8000930:	21fa      	movs	r1, #250	; 0xfa
 8000932:	0089      	lsls	r1, r1, #2
 8000934:	f000 fd1c 	bl	8001370 <__aeabi_uidiv>
 8000938:	f7ff ffdc 	bl	80008f4 <HAL_SYSTICK_Config>
 800093c:	2001      	movs	r0, #1
 800093e:	4240      	negs	r0, r0
 8000940:	1c21      	adds	r1, r4, #0
 8000942:	2200      	movs	r2, #0
 8000944:	f7ff ffa4 	bl	8000890 <HAL_NVIC_SetPriority>
 8000948:	2000      	movs	r0, #0
 800094a:	bd10      	pop	{r4, pc}

0800094c <HAL_GetTick>:
 800094c:	4b01      	ldr	r3, [pc, #4]	; (8000954 <HAL_GetTick+0x8>)
 800094e:	6818      	ldr	r0, [r3, #0]
 8000950:	4770      	bx	lr
 8000952:	46c0      	nop			; (mov r8, r8)
 8000954:	20000008 	.word	0x20000008

08000958 <HAL_RCC_OscConfig>:
 8000958:	b5f0      	push	{r4, r5, r6, r7, lr}
 800095a:	1c04      	adds	r4, r0, #0
 800095c:	6800      	ldr	r0, [r0, #0]
 800095e:	b085      	sub	sp, #20
 8000960:	07c0      	lsls	r0, r0, #31
 8000962:	d403      	bmi.n	800096c <HAL_RCC_OscConfig+0x14>
 8000964:	6821      	ldr	r1, [r4, #0]
 8000966:	0789      	lsls	r1, r1, #30
 8000968:	d457      	bmi.n	8000a1a <HAL_RCC_OscConfig+0xc2>
 800096a:	e09d      	b.n	8000aa8 <HAL_RCC_OscConfig+0x150>
 800096c:	4dbc      	ldr	r5, [pc, #752]	; (8000c60 <HAL_RCC_OscConfig+0x308>)
 800096e:	230c      	movs	r3, #12
 8000970:	68ea      	ldr	r2, [r5, #12]
 8000972:	401a      	ands	r2, r3
 8000974:	2a08      	cmp	r2, #8
 8000976:	d008      	beq.n	800098a <HAL_RCC_OscConfig+0x32>
 8000978:	68ea      	ldr	r2, [r5, #12]
 800097a:	4013      	ands	r3, r2
 800097c:	2280      	movs	r2, #128	; 0x80
 800097e:	0252      	lsls	r2, r2, #9
 8000980:	2b0c      	cmp	r3, #12
 8000982:	d10a      	bne.n	800099a <HAL_RCC_OscConfig+0x42>
 8000984:	68eb      	ldr	r3, [r5, #12]
 8000986:	4213      	tst	r3, r2
 8000988:	d007      	beq.n	800099a <HAL_RCC_OscConfig+0x42>
 800098a:	682b      	ldr	r3, [r5, #0]
 800098c:	039a      	lsls	r2, r3, #14
 800098e:	d5e9      	bpl.n	8000964 <HAL_RCC_OscConfig+0xc>
 8000990:	6863      	ldr	r3, [r4, #4]
 8000992:	2b00      	cmp	r3, #0
 8000994:	d1e6      	bne.n	8000964 <HAL_RCC_OscConfig+0xc>
 8000996:	2001      	movs	r0, #1
 8000998:	e1d5      	b.n	8000d46 <HAL_RCC_OscConfig+0x3ee>
 800099a:	6863      	ldr	r3, [r4, #4]
 800099c:	2180      	movs	r1, #128	; 0x80
 800099e:	0249      	lsls	r1, r1, #9
 80009a0:	4293      	cmp	r3, r2
 80009a2:	d103      	bne.n	80009ac <HAL_RCC_OscConfig+0x54>
 80009a4:	682b      	ldr	r3, [r5, #0]
 80009a6:	431a      	orrs	r2, r3
 80009a8:	602a      	str	r2, [r5, #0]
 80009aa:	e01d      	b.n	80009e8 <HAL_RCC_OscConfig+0x90>
 80009ac:	20a0      	movs	r0, #160	; 0xa0
 80009ae:	4aad      	ldr	r2, [pc, #692]	; (8000c64 <HAL_RCC_OscConfig+0x30c>)
 80009b0:	02c0      	lsls	r0, r0, #11
 80009b2:	4283      	cmp	r3, r0
 80009b4:	d10b      	bne.n	80009ce <HAL_RCC_OscConfig+0x76>
 80009b6:	682b      	ldr	r3, [r5, #0]
 80009b8:	401a      	ands	r2, r3
 80009ba:	602a      	str	r2, [r5, #0]
 80009bc:	682a      	ldr	r2, [r5, #0]
 80009be:	2380      	movs	r3, #128	; 0x80
 80009c0:	02db      	lsls	r3, r3, #11
 80009c2:	4313      	orrs	r3, r2
 80009c4:	602b      	str	r3, [r5, #0]
 80009c6:	682b      	ldr	r3, [r5, #0]
 80009c8:	4319      	orrs	r1, r3
 80009ca:	6029      	str	r1, [r5, #0]
 80009cc:	e00c      	b.n	80009e8 <HAL_RCC_OscConfig+0x90>
 80009ce:	6828      	ldr	r0, [r5, #0]
 80009d0:	4002      	ands	r2, r0
 80009d2:	602a      	str	r2, [r5, #0]
 80009d4:	682a      	ldr	r2, [r5, #0]
 80009d6:	4011      	ands	r1, r2
 80009d8:	9103      	str	r1, [sp, #12]
 80009da:	9a03      	ldr	r2, [sp, #12]
 80009dc:	6829      	ldr	r1, [r5, #0]
 80009de:	4aa2      	ldr	r2, [pc, #648]	; (8000c68 <HAL_RCC_OscConfig+0x310>)
 80009e0:	400a      	ands	r2, r1
 80009e2:	602a      	str	r2, [r5, #0]
 80009e4:	2b00      	cmp	r3, #0
 80009e6:	d00c      	beq.n	8000a02 <HAL_RCC_OscConfig+0xaa>
 80009e8:	f7ff ffb0 	bl	800094c <HAL_GetTick>
 80009ec:	1c06      	adds	r6, r0, #0
 80009ee:	682b      	ldr	r3, [r5, #0]
 80009f0:	0398      	lsls	r0, r3, #14
 80009f2:	d4b7      	bmi.n	8000964 <HAL_RCC_OscConfig+0xc>
 80009f4:	f7ff ffaa 	bl	800094c <HAL_GetTick>
 80009f8:	1b80      	subs	r0, r0, r6
 80009fa:	2864      	cmp	r0, #100	; 0x64
 80009fc:	d9f7      	bls.n	80009ee <HAL_RCC_OscConfig+0x96>
 80009fe:	2003      	movs	r0, #3
 8000a00:	e1a1      	b.n	8000d46 <HAL_RCC_OscConfig+0x3ee>
 8000a02:	f7ff ffa3 	bl	800094c <HAL_GetTick>
 8000a06:	1c06      	adds	r6, r0, #0
 8000a08:	682b      	ldr	r3, [r5, #0]
 8000a0a:	0399      	lsls	r1, r3, #14
 8000a0c:	d5aa      	bpl.n	8000964 <HAL_RCC_OscConfig+0xc>
 8000a0e:	f7ff ff9d 	bl	800094c <HAL_GetTick>
 8000a12:	1b80      	subs	r0, r0, r6
 8000a14:	2864      	cmp	r0, #100	; 0x64
 8000a16:	d9f7      	bls.n	8000a08 <HAL_RCC_OscConfig+0xb0>
 8000a18:	e7f1      	b.n	80009fe <HAL_RCC_OscConfig+0xa6>
 8000a1a:	4d91      	ldr	r5, [pc, #580]	; (8000c60 <HAL_RCC_OscConfig+0x308>)
 8000a1c:	230c      	movs	r3, #12
 8000a1e:	68ea      	ldr	r2, [r5, #12]
 8000a20:	401a      	ands	r2, r3
 8000a22:	2a04      	cmp	r2, #4
 8000a24:	d006      	beq.n	8000a34 <HAL_RCC_OscConfig+0xdc>
 8000a26:	68ea      	ldr	r2, [r5, #12]
 8000a28:	4013      	ands	r3, r2
 8000a2a:	2b0c      	cmp	r3, #12
 8000a2c:	d110      	bne.n	8000a50 <HAL_RCC_OscConfig+0xf8>
 8000a2e:	68eb      	ldr	r3, [r5, #12]
 8000a30:	03da      	lsls	r2, r3, #15
 8000a32:	d40d      	bmi.n	8000a50 <HAL_RCC_OscConfig+0xf8>
 8000a34:	682b      	ldr	r3, [r5, #0]
 8000a36:	0758      	lsls	r0, r3, #29
 8000a38:	d502      	bpl.n	8000a40 <HAL_RCC_OscConfig+0xe8>
 8000a3a:	68e1      	ldr	r1, [r4, #12]
 8000a3c:	2901      	cmp	r1, #1
 8000a3e:	d1aa      	bne.n	8000996 <HAL_RCC_OscConfig+0x3e>
 8000a40:	6923      	ldr	r3, [r4, #16]
 8000a42:	6869      	ldr	r1, [r5, #4]
 8000a44:	021a      	lsls	r2, r3, #8
 8000a46:	4b89      	ldr	r3, [pc, #548]	; (8000c6c <HAL_RCC_OscConfig+0x314>)
 8000a48:	400b      	ands	r3, r1
 8000a4a:	4313      	orrs	r3, r2
 8000a4c:	606b      	str	r3, [r5, #4]
 8000a4e:	e02b      	b.n	8000aa8 <HAL_RCC_OscConfig+0x150>
 8000a50:	68e2      	ldr	r2, [r4, #12]
 8000a52:	2309      	movs	r3, #9
 8000a54:	2a00      	cmp	r2, #0
 8000a56:	d018      	beq.n	8000a8a <HAL_RCC_OscConfig+0x132>
 8000a58:	6829      	ldr	r1, [r5, #0]
 8000a5a:	4399      	bics	r1, r3
 8000a5c:	430a      	orrs	r2, r1
 8000a5e:	602a      	str	r2, [r5, #0]
 8000a60:	f7ff ff74 	bl	800094c <HAL_GetTick>
 8000a64:	1c06      	adds	r6, r0, #0
 8000a66:	682a      	ldr	r2, [r5, #0]
 8000a68:	4b7d      	ldr	r3, [pc, #500]	; (8000c60 <HAL_RCC_OscConfig+0x308>)
 8000a6a:	0750      	lsls	r0, r2, #29
 8000a6c:	d405      	bmi.n	8000a7a <HAL_RCC_OscConfig+0x122>
 8000a6e:	f7ff ff6d 	bl	800094c <HAL_GetTick>
 8000a72:	1b80      	subs	r0, r0, r6
 8000a74:	2802      	cmp	r0, #2
 8000a76:	d9f6      	bls.n	8000a66 <HAL_RCC_OscConfig+0x10e>
 8000a78:	e7c1      	b.n	80009fe <HAL_RCC_OscConfig+0xa6>
 8000a7a:	6922      	ldr	r2, [r4, #16]
 8000a7c:	6858      	ldr	r0, [r3, #4]
 8000a7e:	0211      	lsls	r1, r2, #8
 8000a80:	4a7a      	ldr	r2, [pc, #488]	; (8000c6c <HAL_RCC_OscConfig+0x314>)
 8000a82:	4002      	ands	r2, r0
 8000a84:	430a      	orrs	r2, r1
 8000a86:	605a      	str	r2, [r3, #4]
 8000a88:	e00e      	b.n	8000aa8 <HAL_RCC_OscConfig+0x150>
 8000a8a:	682a      	ldr	r2, [r5, #0]
 8000a8c:	439a      	bics	r2, r3
 8000a8e:	602a      	str	r2, [r5, #0]
 8000a90:	f7ff ff5c 	bl	800094c <HAL_GetTick>
 8000a94:	1c06      	adds	r6, r0, #0
 8000a96:	682b      	ldr	r3, [r5, #0]
 8000a98:	0758      	lsls	r0, r3, #29
 8000a9a:	d505      	bpl.n	8000aa8 <HAL_RCC_OscConfig+0x150>
 8000a9c:	f7ff ff56 	bl	800094c <HAL_GetTick>
 8000aa0:	1b80      	subs	r0, r0, r6
 8000aa2:	2802      	cmp	r0, #2
 8000aa4:	d9f7      	bls.n	8000a96 <HAL_RCC_OscConfig+0x13e>
 8000aa6:	e7aa      	b.n	80009fe <HAL_RCC_OscConfig+0xa6>
 8000aa8:	6821      	ldr	r1, [r4, #0]
 8000aaa:	06c9      	lsls	r1, r1, #27
 8000aac:	d54f      	bpl.n	8000b4e <HAL_RCC_OscConfig+0x1f6>
 8000aae:	4d6c      	ldr	r5, [pc, #432]	; (8000c60 <HAL_RCC_OscConfig+0x308>)
 8000ab0:	230c      	movs	r3, #12
 8000ab2:	68ea      	ldr	r2, [r5, #12]
 8000ab4:	421a      	tst	r2, r3
 8000ab6:	d117      	bne.n	8000ae8 <HAL_RCC_OscConfig+0x190>
 8000ab8:	682b      	ldr	r3, [r5, #0]
 8000aba:	059a      	lsls	r2, r3, #22
 8000abc:	d503      	bpl.n	8000ac6 <HAL_RCC_OscConfig+0x16e>
 8000abe:	69a3      	ldr	r3, [r4, #24]
 8000ac0:	2b00      	cmp	r3, #0
 8000ac2:	d100      	bne.n	8000ac6 <HAL_RCC_OscConfig+0x16e>
 8000ac4:	e767      	b.n	8000996 <HAL_RCC_OscConfig+0x3e>
 8000ac6:	686a      	ldr	r2, [r5, #4]
 8000ac8:	4b69      	ldr	r3, [pc, #420]	; (8000c70 <HAL_RCC_OscConfig+0x318>)
 8000aca:	6a20      	ldr	r0, [r4, #32]
 8000acc:	4013      	ands	r3, r2
 8000ace:	4303      	orrs	r3, r0
 8000ad0:	606b      	str	r3, [r5, #4]
 8000ad2:	686b      	ldr	r3, [r5, #4]
 8000ad4:	69e1      	ldr	r1, [r4, #28]
 8000ad6:	021b      	lsls	r3, r3, #8
 8000ad8:	060a      	lsls	r2, r1, #24
 8000ada:	0a1b      	lsrs	r3, r3, #8
 8000adc:	4313      	orrs	r3, r2
 8000ade:	606b      	str	r3, [r5, #4]
 8000ae0:	2003      	movs	r0, #3
 8000ae2:	f7ff ff21 	bl	8000928 <HAL_InitTick>
 8000ae6:	e032      	b.n	8000b4e <HAL_RCC_OscConfig+0x1f6>
 8000ae8:	69a2      	ldr	r2, [r4, #24]
 8000aea:	2a00      	cmp	r2, #0
 8000aec:	d01f      	beq.n	8000b2e <HAL_RCC_OscConfig+0x1d6>
 8000aee:	682a      	ldr	r2, [r5, #0]
 8000af0:	2380      	movs	r3, #128	; 0x80
 8000af2:	005b      	lsls	r3, r3, #1
 8000af4:	4313      	orrs	r3, r2
 8000af6:	602b      	str	r3, [r5, #0]
 8000af8:	f7ff ff28 	bl	800094c <HAL_GetTick>
 8000afc:	1c06      	adds	r6, r0, #0
 8000afe:	682a      	ldr	r2, [r5, #0]
 8000b00:	4b57      	ldr	r3, [pc, #348]	; (8000c60 <HAL_RCC_OscConfig+0x308>)
 8000b02:	0590      	lsls	r0, r2, #22
 8000b04:	d405      	bmi.n	8000b12 <HAL_RCC_OscConfig+0x1ba>
 8000b06:	f7ff ff21 	bl	800094c <HAL_GetTick>
 8000b0a:	1b80      	subs	r0, r0, r6
 8000b0c:	2802      	cmp	r0, #2
 8000b0e:	d9f6      	bls.n	8000afe <HAL_RCC_OscConfig+0x1a6>
 8000b10:	e775      	b.n	80009fe <HAL_RCC_OscConfig+0xa6>
 8000b12:	6859      	ldr	r1, [r3, #4]
 8000b14:	4a56      	ldr	r2, [pc, #344]	; (8000c70 <HAL_RCC_OscConfig+0x318>)
 8000b16:	400a      	ands	r2, r1
 8000b18:	6a21      	ldr	r1, [r4, #32]
 8000b1a:	430a      	orrs	r2, r1
 8000b1c:	605a      	str	r2, [r3, #4]
 8000b1e:	685a      	ldr	r2, [r3, #4]
 8000b20:	69e0      	ldr	r0, [r4, #28]
 8000b22:	0212      	lsls	r2, r2, #8
 8000b24:	0601      	lsls	r1, r0, #24
 8000b26:	0a12      	lsrs	r2, r2, #8
 8000b28:	430a      	orrs	r2, r1
 8000b2a:	605a      	str	r2, [r3, #4]
 8000b2c:	e00f      	b.n	8000b4e <HAL_RCC_OscConfig+0x1f6>
 8000b2e:	682a      	ldr	r2, [r5, #0]
 8000b30:	4b50      	ldr	r3, [pc, #320]	; (8000c74 <HAL_RCC_OscConfig+0x31c>)
 8000b32:	4013      	ands	r3, r2
 8000b34:	602b      	str	r3, [r5, #0]
 8000b36:	f7ff ff09 	bl	800094c <HAL_GetTick>
 8000b3a:	1c06      	adds	r6, r0, #0
 8000b3c:	682b      	ldr	r3, [r5, #0]
 8000b3e:	0599      	lsls	r1, r3, #22
 8000b40:	d505      	bpl.n	8000b4e <HAL_RCC_OscConfig+0x1f6>
 8000b42:	f7ff ff03 	bl	800094c <HAL_GetTick>
 8000b46:	1b80      	subs	r0, r0, r6
 8000b48:	2802      	cmp	r0, #2
 8000b4a:	d9f7      	bls.n	8000b3c <HAL_RCC_OscConfig+0x1e4>
 8000b4c:	e757      	b.n	80009fe <HAL_RCC_OscConfig+0xa6>
 8000b4e:	6822      	ldr	r2, [r4, #0]
 8000b50:	0712      	lsls	r2, r2, #28
 8000b52:	d403      	bmi.n	8000b5c <HAL_RCC_OscConfig+0x204>
 8000b54:	6823      	ldr	r3, [r4, #0]
 8000b56:	075b      	lsls	r3, r3, #29
 8000b58:	d422      	bmi.n	8000ba0 <HAL_RCC_OscConfig+0x248>
 8000b5a:	e0ab      	b.n	8000cb4 <HAL_RCC_OscConfig+0x35c>
 8000b5c:	4d40      	ldr	r5, [pc, #256]	; (8000c60 <HAL_RCC_OscConfig+0x308>)
 8000b5e:	6960      	ldr	r0, [r4, #20]
 8000b60:	2301      	movs	r3, #1
 8000b62:	6d2a      	ldr	r2, [r5, #80]	; 0x50
 8000b64:	2800      	cmp	r0, #0
 8000b66:	d00d      	beq.n	8000b84 <HAL_RCC_OscConfig+0x22c>
 8000b68:	4313      	orrs	r3, r2
 8000b6a:	652b      	str	r3, [r5, #80]	; 0x50
 8000b6c:	f7ff feee 	bl	800094c <HAL_GetTick>
 8000b70:	1c06      	adds	r6, r0, #0
 8000b72:	6d2b      	ldr	r3, [r5, #80]	; 0x50
 8000b74:	0799      	lsls	r1, r3, #30
 8000b76:	d4ed      	bmi.n	8000b54 <HAL_RCC_OscConfig+0x1fc>
 8000b78:	f7ff fee8 	bl	800094c <HAL_GetTick>
 8000b7c:	1b80      	subs	r0, r0, r6
 8000b7e:	2802      	cmp	r0, #2
 8000b80:	d9f7      	bls.n	8000b72 <HAL_RCC_OscConfig+0x21a>
 8000b82:	e73c      	b.n	80009fe <HAL_RCC_OscConfig+0xa6>
 8000b84:	439a      	bics	r2, r3
 8000b86:	652a      	str	r2, [r5, #80]	; 0x50
 8000b88:	f7ff fee0 	bl	800094c <HAL_GetTick>
 8000b8c:	1c06      	adds	r6, r0, #0
 8000b8e:	6d2b      	ldr	r3, [r5, #80]	; 0x50
 8000b90:	079a      	lsls	r2, r3, #30
 8000b92:	d5df      	bpl.n	8000b54 <HAL_RCC_OscConfig+0x1fc>
 8000b94:	f7ff feda 	bl	800094c <HAL_GetTick>
 8000b98:	1b80      	subs	r0, r0, r6
 8000b9a:	2802      	cmp	r0, #2
 8000b9c:	d9f7      	bls.n	8000b8e <HAL_RCC_OscConfig+0x236>
 8000b9e:	e72e      	b.n	80009fe <HAL_RCC_OscConfig+0xa6>
 8000ba0:	4d2f      	ldr	r5, [pc, #188]	; (8000c60 <HAL_RCC_OscConfig+0x308>)
 8000ba2:	2380      	movs	r3, #128	; 0x80
 8000ba4:	6baa      	ldr	r2, [r5, #56]	; 0x38
 8000ba6:	2000      	movs	r0, #0
 8000ba8:	055b      	lsls	r3, r3, #21
 8000baa:	9000      	str	r0, [sp, #0]
 8000bac:	421a      	tst	r2, r3
 8000bae:	d104      	bne.n	8000bba <HAL_RCC_OscConfig+0x262>
 8000bb0:	6baa      	ldr	r2, [r5, #56]	; 0x38
 8000bb2:	2101      	movs	r1, #1
 8000bb4:	4313      	orrs	r3, r2
 8000bb6:	63ab      	str	r3, [r5, #56]	; 0x38
 8000bb8:	9100      	str	r1, [sp, #0]
 8000bba:	4e2f      	ldr	r6, [pc, #188]	; (8000c78 <HAL_RCC_OscConfig+0x320>)
 8000bbc:	2380      	movs	r3, #128	; 0x80
 8000bbe:	6832      	ldr	r2, [r6, #0]
 8000bc0:	2000      	movs	r0, #0
 8000bc2:	005b      	lsls	r3, r3, #1
 8000bc4:	9001      	str	r0, [sp, #4]
 8000bc6:	421a      	tst	r2, r3
 8000bc8:	d110      	bne.n	8000bec <HAL_RCC_OscConfig+0x294>
 8000bca:	6832      	ldr	r2, [r6, #0]
 8000bcc:	4313      	orrs	r3, r2
 8000bce:	6033      	str	r3, [r6, #0]
 8000bd0:	f7ff febc 	bl	800094c <HAL_GetTick>
 8000bd4:	1c07      	adds	r7, r0, #0
 8000bd6:	6833      	ldr	r3, [r6, #0]
 8000bd8:	05d9      	lsls	r1, r3, #23
 8000bda:	d405      	bmi.n	8000be8 <HAL_RCC_OscConfig+0x290>
 8000bdc:	f7ff feb6 	bl	800094c <HAL_GetTick>
 8000be0:	1bc0      	subs	r0, r0, r7
 8000be2:	2864      	cmp	r0, #100	; 0x64
 8000be4:	d9f7      	bls.n	8000bd6 <HAL_RCC_OscConfig+0x27e>
 8000be6:	e70a      	b.n	80009fe <HAL_RCC_OscConfig+0xa6>
 8000be8:	2201      	movs	r2, #1
 8000bea:	9201      	str	r2, [sp, #4]
 8000bec:	68a3      	ldr	r3, [r4, #8]
 8000bee:	2180      	movs	r1, #128	; 0x80
 8000bf0:	0049      	lsls	r1, r1, #1
 8000bf2:	428b      	cmp	r3, r1
 8000bf4:	d102      	bne.n	8000bfc <HAL_RCC_OscConfig+0x2a4>
 8000bf6:	6d2a      	ldr	r2, [r5, #80]	; 0x50
 8000bf8:	4313      	orrs	r3, r2
 8000bfa:	e023      	b.n	8000c44 <HAL_RCC_OscConfig+0x2ec>
 8000bfc:	4a1d      	ldr	r2, [pc, #116]	; (8000c74 <HAL_RCC_OscConfig+0x31c>)
 8000bfe:	2b00      	cmp	r3, #0
 8000c00:	d10a      	bne.n	8000c18 <HAL_RCC_OscConfig+0x2c0>
 8000c02:	6d2b      	ldr	r3, [r5, #80]	; 0x50
 8000c04:	401a      	ands	r2, r3
 8000c06:	652a      	str	r2, [r5, #80]	; 0x50
 8000c08:	6d2a      	ldr	r2, [r5, #80]	; 0x50
 8000c0a:	4b1c      	ldr	r3, [pc, #112]	; (8000c7c <HAL_RCC_OscConfig+0x324>)
 8000c0c:	4013      	ands	r3, r2
 8000c0e:	652b      	str	r3, [r5, #80]	; 0x50
 8000c10:	f7ff fe9c 	bl	800094c <HAL_GetTick>
 8000c14:	1c07      	adds	r7, r0, #0
 8000c16:	e03c      	b.n	8000c92 <HAL_RCC_OscConfig+0x33a>
 8000c18:	20a0      	movs	r0, #160	; 0xa0
 8000c1a:	00c0      	lsls	r0, r0, #3
 8000c1c:	4283      	cmp	r3, r0
 8000c1e:	d10b      	bne.n	8000c38 <HAL_RCC_OscConfig+0x2e0>
 8000c20:	6d2b      	ldr	r3, [r5, #80]	; 0x50
 8000c22:	401a      	ands	r2, r3
 8000c24:	652a      	str	r2, [r5, #80]	; 0x50
 8000c26:	6d2a      	ldr	r2, [r5, #80]	; 0x50
 8000c28:	2380      	movs	r3, #128	; 0x80
 8000c2a:	00db      	lsls	r3, r3, #3
 8000c2c:	4313      	orrs	r3, r2
 8000c2e:	652b      	str	r3, [r5, #80]	; 0x50
 8000c30:	6d2b      	ldr	r3, [r5, #80]	; 0x50
 8000c32:	4319      	orrs	r1, r3
 8000c34:	6529      	str	r1, [r5, #80]	; 0x50
 8000c36:	e006      	b.n	8000c46 <HAL_RCC_OscConfig+0x2ee>
 8000c38:	6d2b      	ldr	r3, [r5, #80]	; 0x50
 8000c3a:	401a      	ands	r2, r3
 8000c3c:	652a      	str	r2, [r5, #80]	; 0x50
 8000c3e:	6d2a      	ldr	r2, [r5, #80]	; 0x50
 8000c40:	4b0e      	ldr	r3, [pc, #56]	; (8000c7c <HAL_RCC_OscConfig+0x324>)
 8000c42:	4013      	ands	r3, r2
 8000c44:	652b      	str	r3, [r5, #80]	; 0x50
 8000c46:	f7ff fe81 	bl	800094c <HAL_GetTick>
 8000c4a:	1c07      	adds	r7, r0, #0
 8000c4c:	6d2b      	ldr	r3, [r5, #80]	; 0x50
 8000c4e:	0598      	lsls	r0, r3, #22
 8000c50:	d422      	bmi.n	8000c98 <HAL_RCC_OscConfig+0x340>
 8000c52:	f7ff fe7b 	bl	800094c <HAL_GetTick>
 8000c56:	4b0a      	ldr	r3, [pc, #40]	; (8000c80 <HAL_RCC_OscConfig+0x328>)
 8000c58:	1bc0      	subs	r0, r0, r7
 8000c5a:	4298      	cmp	r0, r3
 8000c5c:	d9f6      	bls.n	8000c4c <HAL_RCC_OscConfig+0x2f4>
 8000c5e:	e6ce      	b.n	80009fe <HAL_RCC_OscConfig+0xa6>
 8000c60:	40021000 	.word	0x40021000
 8000c64:	fffeffff 	.word	0xfffeffff
 8000c68:	fffbffff 	.word	0xfffbffff
 8000c6c:	ffffe0ff 	.word	0xffffe0ff
 8000c70:	ffff1fff 	.word	0xffff1fff
 8000c74:	fffffeff 	.word	0xfffffeff
 8000c78:	40007000 	.word	0x40007000
 8000c7c:	fffffbff 	.word	0xfffffbff
 8000c80:	00001388 	.word	0x00001388
 8000c84:	f7ff fe62 	bl	800094c <HAL_GetTick>
 8000c88:	4b30      	ldr	r3, [pc, #192]	; (8000d4c <HAL_RCC_OscConfig+0x3f4>)
 8000c8a:	1bc0      	subs	r0, r0, r7
 8000c8c:	4298      	cmp	r0, r3
 8000c8e:	d900      	bls.n	8000c92 <HAL_RCC_OscConfig+0x33a>
 8000c90:	e6b5      	b.n	80009fe <HAL_RCC_OscConfig+0xa6>
 8000c92:	6d2b      	ldr	r3, [r5, #80]	; 0x50
 8000c94:	059a      	lsls	r2, r3, #22
 8000c96:	d4f5      	bmi.n	8000c84 <HAL_RCC_OscConfig+0x32c>
 8000c98:	9901      	ldr	r1, [sp, #4]
 8000c9a:	2901      	cmp	r1, #1
 8000c9c:	d103      	bne.n	8000ca6 <HAL_RCC_OscConfig+0x34e>
 8000c9e:	6832      	ldr	r2, [r6, #0]
 8000ca0:	4b2b      	ldr	r3, [pc, #172]	; (8000d50 <HAL_RCC_OscConfig+0x3f8>)
 8000ca2:	4013      	ands	r3, r2
 8000ca4:	6033      	str	r3, [r6, #0]
 8000ca6:	9b00      	ldr	r3, [sp, #0]
 8000ca8:	2b01      	cmp	r3, #1
 8000caa:	d103      	bne.n	8000cb4 <HAL_RCC_OscConfig+0x35c>
 8000cac:	6baa      	ldr	r2, [r5, #56]	; 0x38
 8000cae:	4b29      	ldr	r3, [pc, #164]	; (8000d54 <HAL_RCC_OscConfig+0x3fc>)
 8000cb0:	4013      	ands	r3, r2
 8000cb2:	63ab      	str	r3, [r5, #56]	; 0x38
 8000cb4:	6a62      	ldr	r2, [r4, #36]	; 0x24
 8000cb6:	2a00      	cmp	r2, #0
 8000cb8:	d101      	bne.n	8000cbe <HAL_RCC_OscConfig+0x366>
 8000cba:	2000      	movs	r0, #0
 8000cbc:	e043      	b.n	8000d46 <HAL_RCC_OscConfig+0x3ee>
 8000cbe:	4d26      	ldr	r5, [pc, #152]	; (8000d58 <HAL_RCC_OscConfig+0x400>)
 8000cc0:	230c      	movs	r3, #12
 8000cc2:	68e9      	ldr	r1, [r5, #12]
 8000cc4:	400b      	ands	r3, r1
 8000cc6:	2b0c      	cmp	r3, #12
 8000cc8:	d100      	bne.n	8000ccc <HAL_RCC_OscConfig+0x374>
 8000cca:	e664      	b.n	8000996 <HAL_RCC_OscConfig+0x3e>
 8000ccc:	4b23      	ldr	r3, [pc, #140]	; (8000d5c <HAL_RCC_OscConfig+0x404>)
 8000cce:	2a02      	cmp	r2, #2
 8000cd0:	d12a      	bne.n	8000d28 <HAL_RCC_OscConfig+0x3d0>
 8000cd2:	682a      	ldr	r2, [r5, #0]
 8000cd4:	4013      	ands	r3, r2
 8000cd6:	602b      	str	r3, [r5, #0]
 8000cd8:	f7ff fe38 	bl	800094c <HAL_GetTick>
 8000cdc:	1c06      	adds	r6, r0, #0
 8000cde:	682a      	ldr	r2, [r5, #0]
 8000ce0:	4b1d      	ldr	r3, [pc, #116]	; (8000d58 <HAL_RCC_OscConfig+0x400>)
 8000ce2:	0190      	lsls	r0, r2, #6
 8000ce4:	d505      	bpl.n	8000cf2 <HAL_RCC_OscConfig+0x39a>
 8000ce6:	f7ff fe31 	bl	800094c <HAL_GetTick>
 8000cea:	1b80      	subs	r0, r0, r6
 8000cec:	2802      	cmp	r0, #2
 8000cee:	d9f6      	bls.n	8000cde <HAL_RCC_OscConfig+0x386>
 8000cf0:	e685      	b.n	80009fe <HAL_RCC_OscConfig+0xa6>
 8000cf2:	6ae2      	ldr	r2, [r4, #44]	; 0x2c
 8000cf4:	6b21      	ldr	r1, [r4, #48]	; 0x30
 8000cf6:	68d8      	ldr	r0, [r3, #12]
 8000cf8:	4311      	orrs	r1, r2
 8000cfa:	6aa2      	ldr	r2, [r4, #40]	; 0x28
 8000cfc:	4311      	orrs	r1, r2
 8000cfe:	4a18      	ldr	r2, [pc, #96]	; (8000d60 <HAL_RCC_OscConfig+0x408>)
 8000d00:	4002      	ands	r2, r0
 8000d02:	430a      	orrs	r2, r1
 8000d04:	60da      	str	r2, [r3, #12]
 8000d06:	6819      	ldr	r1, [r3, #0]
 8000d08:	2280      	movs	r2, #128	; 0x80
 8000d0a:	0452      	lsls	r2, r2, #17
 8000d0c:	430a      	orrs	r2, r1
 8000d0e:	601a      	str	r2, [r3, #0]
 8000d10:	f7ff fe1c 	bl	800094c <HAL_GetTick>
 8000d14:	1c04      	adds	r4, r0, #0
 8000d16:	682b      	ldr	r3, [r5, #0]
 8000d18:	0198      	lsls	r0, r3, #6
 8000d1a:	d4ce      	bmi.n	8000cba <HAL_RCC_OscConfig+0x362>
 8000d1c:	f7ff fe16 	bl	800094c <HAL_GetTick>
 8000d20:	1b00      	subs	r0, r0, r4
 8000d22:	2802      	cmp	r0, #2
 8000d24:	d9f7      	bls.n	8000d16 <HAL_RCC_OscConfig+0x3be>
 8000d26:	e66a      	b.n	80009fe <HAL_RCC_OscConfig+0xa6>
 8000d28:	682a      	ldr	r2, [r5, #0]
 8000d2a:	4013      	ands	r3, r2
 8000d2c:	602b      	str	r3, [r5, #0]
 8000d2e:	f7ff fe0d 	bl	800094c <HAL_GetTick>
 8000d32:	1c04      	adds	r4, r0, #0
 8000d34:	682b      	ldr	r3, [r5, #0]
 8000d36:	0199      	lsls	r1, r3, #6
 8000d38:	d5bf      	bpl.n	8000cba <HAL_RCC_OscConfig+0x362>
 8000d3a:	f7ff fe07 	bl	800094c <HAL_GetTick>
 8000d3e:	1b00      	subs	r0, r0, r4
 8000d40:	2802      	cmp	r0, #2
 8000d42:	d9f7      	bls.n	8000d34 <HAL_RCC_OscConfig+0x3dc>
 8000d44:	e65b      	b.n	80009fe <HAL_RCC_OscConfig+0xa6>
 8000d46:	b005      	add	sp, #20
 8000d48:	bdf0      	pop	{r4, r5, r6, r7, pc}
 8000d4a:	46c0      	nop			; (mov r8, r8)
 8000d4c:	00001388 	.word	0x00001388
 8000d50:	fffffeff 	.word	0xfffffeff
 8000d54:	efffffff 	.word	0xefffffff
 8000d58:	40021000 	.word	0x40021000
 8000d5c:	feffffff 	.word	0xfeffffff
 8000d60:	ff02ffff 	.word	0xff02ffff

08000d64 <HAL_RCC_ClockConfig>:
 8000d64:	b5f7      	push	{r0, r1, r2, r4, r5, r6, r7, lr}
 8000d66:	4f4f      	ldr	r7, [pc, #316]	; (8000ea4 <HAL_RCC_ClockConfig+0x140>)
 8000d68:	2301      	movs	r3, #1
 8000d6a:	683a      	ldr	r2, [r7, #0]
 8000d6c:	1c05      	adds	r5, r0, #0
 8000d6e:	1c0e      	adds	r6, r1, #0
 8000d70:	401a      	ands	r2, r3
 8000d72:	4291      	cmp	r1, r2
 8000d74:	d80a      	bhi.n	8000d8c <HAL_RCC_ClockConfig+0x28>
 8000d76:	682b      	ldr	r3, [r5, #0]
 8000d78:	0798      	lsls	r0, r3, #30
 8000d7a:	d511      	bpl.n	8000da0 <HAL_RCC_ClockConfig+0x3c>
 8000d7c:	4a4a      	ldr	r2, [pc, #296]	; (8000ea8 <HAL_RCC_ClockConfig+0x144>)
 8000d7e:	20f0      	movs	r0, #240	; 0xf0
 8000d80:	68d1      	ldr	r1, [r2, #12]
 8000d82:	4381      	bics	r1, r0
 8000d84:	68a8      	ldr	r0, [r5, #8]
 8000d86:	4301      	orrs	r1, r0
 8000d88:	60d1      	str	r1, [r2, #12]
 8000d8a:	e009      	b.n	8000da0 <HAL_RCC_ClockConfig+0x3c>
 8000d8c:	683a      	ldr	r2, [r7, #0]
 8000d8e:	439a      	bics	r2, r3
 8000d90:	430a      	orrs	r2, r1
 8000d92:	603a      	str	r2, [r7, #0]
 8000d94:	683a      	ldr	r2, [r7, #0]
 8000d96:	4013      	ands	r3, r2
 8000d98:	428b      	cmp	r3, r1
 8000d9a:	d0ec      	beq.n	8000d76 <HAL_RCC_ClockConfig+0x12>
 8000d9c:	2001      	movs	r0, #1
 8000d9e:	e080      	b.n	8000ea2 <HAL_RCC_ClockConfig+0x13e>
 8000da0:	07d9      	lsls	r1, r3, #31
 8000da2:	d406      	bmi.n	8000db2 <HAL_RCC_ClockConfig+0x4e>
 8000da4:	6839      	ldr	r1, [r7, #0]
 8000da6:	2301      	movs	r3, #1
 8000da8:	4a3e      	ldr	r2, [pc, #248]	; (8000ea4 <HAL_RCC_ClockConfig+0x140>)
 8000daa:	4019      	ands	r1, r3
 8000dac:	428e      	cmp	r6, r1
 8000dae:	d958      	bls.n	8000e62 <HAL_RCC_ClockConfig+0xfe>
 8000db0:	e05f      	b.n	8000e72 <HAL_RCC_ClockConfig+0x10e>
 8000db2:	4c3d      	ldr	r4, [pc, #244]	; (8000ea8 <HAL_RCC_ClockConfig+0x144>)
 8000db4:	686b      	ldr	r3, [r5, #4]
 8000db6:	6822      	ldr	r2, [r4, #0]
 8000db8:	2b02      	cmp	r3, #2
 8000dba:	d102      	bne.n	8000dc2 <HAL_RCC_ClockConfig+0x5e>
 8000dbc:	0390      	lsls	r0, r2, #14
 8000dbe:	d40c      	bmi.n	8000dda <HAL_RCC_ClockConfig+0x76>
 8000dc0:	e7ec      	b.n	8000d9c <HAL_RCC_ClockConfig+0x38>
 8000dc2:	2b00      	cmp	r3, #0
 8000dc4:	d102      	bne.n	8000dcc <HAL_RCC_ClockConfig+0x68>
 8000dc6:	0591      	lsls	r1, r2, #22
 8000dc8:	d407      	bmi.n	8000dda <HAL_RCC_ClockConfig+0x76>
 8000dca:	e7e7      	b.n	8000d9c <HAL_RCC_ClockConfig+0x38>
 8000dcc:	2b03      	cmp	r3, #3
 8000dce:	d102      	bne.n	8000dd6 <HAL_RCC_ClockConfig+0x72>
 8000dd0:	0190      	lsls	r0, r2, #6
 8000dd2:	d402      	bmi.n	8000dda <HAL_RCC_ClockConfig+0x76>
 8000dd4:	e7e2      	b.n	8000d9c <HAL_RCC_ClockConfig+0x38>
 8000dd6:	0751      	lsls	r1, r2, #29
 8000dd8:	d5e0      	bpl.n	8000d9c <HAL_RCC_ClockConfig+0x38>
 8000dda:	68e2      	ldr	r2, [r4, #12]
 8000ddc:	2103      	movs	r1, #3
 8000dde:	438a      	bics	r2, r1
 8000de0:	4313      	orrs	r3, r2
 8000de2:	60e3      	str	r3, [r4, #12]
 8000de4:	f7ff fdb2 	bl	800094c <HAL_GetTick>
 8000de8:	686b      	ldr	r3, [r5, #4]
 8000dea:	9001      	str	r0, [sp, #4]
 8000dec:	2b02      	cmp	r3, #2
 8000dee:	d10d      	bne.n	8000e0c <HAL_RCC_ClockConfig+0xa8>
 8000df0:	68e2      	ldr	r2, [r4, #12]
 8000df2:	230c      	movs	r3, #12
 8000df4:	4013      	ands	r3, r2
 8000df6:	2b08      	cmp	r3, #8
 8000df8:	d0d4      	beq.n	8000da4 <HAL_RCC_ClockConfig+0x40>
 8000dfa:	f7ff fda7 	bl	800094c <HAL_GetTick>
 8000dfe:	9a01      	ldr	r2, [sp, #4]
 8000e00:	4b2a      	ldr	r3, [pc, #168]	; (8000eac <HAL_RCC_ClockConfig+0x148>)
 8000e02:	1a80      	subs	r0, r0, r2
 8000e04:	4298      	cmp	r0, r3
 8000e06:	d9f3      	bls.n	8000df0 <HAL_RCC_ClockConfig+0x8c>
 8000e08:	2003      	movs	r0, #3
 8000e0a:	e04a      	b.n	8000ea2 <HAL_RCC_ClockConfig+0x13e>
 8000e0c:	2b03      	cmp	r3, #3
 8000e0e:	d10c      	bne.n	8000e2a <HAL_RCC_ClockConfig+0xc6>
 8000e10:	68e2      	ldr	r2, [r4, #12]
 8000e12:	230c      	movs	r3, #12
 8000e14:	4013      	ands	r3, r2
 8000e16:	2b0c      	cmp	r3, #12
 8000e18:	d0c4      	beq.n	8000da4 <HAL_RCC_ClockConfig+0x40>
 8000e1a:	f7ff fd97 	bl	800094c <HAL_GetTick>
 8000e1e:	9b01      	ldr	r3, [sp, #4]
 8000e20:	1ac0      	subs	r0, r0, r3
 8000e22:	4b22      	ldr	r3, [pc, #136]	; (8000eac <HAL_RCC_ClockConfig+0x148>)
 8000e24:	4298      	cmp	r0, r3
 8000e26:	d9f3      	bls.n	8000e10 <HAL_RCC_ClockConfig+0xac>
 8000e28:	e7ee      	b.n	8000e08 <HAL_RCC_ClockConfig+0xa4>
 8000e2a:	2b00      	cmp	r3, #0
 8000e2c:	d00c      	beq.n	8000e48 <HAL_RCC_ClockConfig+0xe4>
 8000e2e:	68e2      	ldr	r2, [r4, #12]
 8000e30:	230c      	movs	r3, #12
 8000e32:	4013      	ands	r3, r2
 8000e34:	2b04      	cmp	r3, #4
 8000e36:	d10c      	bne.n	8000e52 <HAL_RCC_ClockConfig+0xee>
 8000e38:	e7b4      	b.n	8000da4 <HAL_RCC_ClockConfig+0x40>
 8000e3a:	f7ff fd87 	bl	800094c <HAL_GetTick>
 8000e3e:	9901      	ldr	r1, [sp, #4]
 8000e40:	4b1a      	ldr	r3, [pc, #104]	; (8000eac <HAL_RCC_ClockConfig+0x148>)
 8000e42:	1a40      	subs	r0, r0, r1
 8000e44:	4298      	cmp	r0, r3
 8000e46:	d8df      	bhi.n	8000e08 <HAL_RCC_ClockConfig+0xa4>
 8000e48:	68e2      	ldr	r2, [r4, #12]
 8000e4a:	230c      	movs	r3, #12
 8000e4c:	421a      	tst	r2, r3
 8000e4e:	d1f4      	bne.n	8000e3a <HAL_RCC_ClockConfig+0xd6>
 8000e50:	e7a8      	b.n	8000da4 <HAL_RCC_ClockConfig+0x40>
 8000e52:	f7ff fd7b 	bl	800094c <HAL_GetTick>
 8000e56:	9a01      	ldr	r2, [sp, #4]
 8000e58:	4b14      	ldr	r3, [pc, #80]	; (8000eac <HAL_RCC_ClockConfig+0x148>)
 8000e5a:	1a80      	subs	r0, r0, r2
 8000e5c:	4298      	cmp	r0, r3
 8000e5e:	d9e6      	bls.n	8000e2e <HAL_RCC_ClockConfig+0xca>
 8000e60:	e7d2      	b.n	8000e08 <HAL_RCC_ClockConfig+0xa4>
 8000e62:	6811      	ldr	r1, [r2, #0]
 8000e64:	4399      	bics	r1, r3
 8000e66:	4331      	orrs	r1, r6
 8000e68:	6011      	str	r1, [r2, #0]
 8000e6a:	6812      	ldr	r2, [r2, #0]
 8000e6c:	4013      	ands	r3, r2
 8000e6e:	42b3      	cmp	r3, r6
 8000e70:	d194      	bne.n	8000d9c <HAL_RCC_ClockConfig+0x38>
 8000e72:	682b      	ldr	r3, [r5, #0]
 8000e74:	0758      	lsls	r0, r3, #29
 8000e76:	d506      	bpl.n	8000e86 <HAL_RCC_ClockConfig+0x122>
 8000e78:	4a0b      	ldr	r2, [pc, #44]	; (8000ea8 <HAL_RCC_ClockConfig+0x144>)
 8000e7a:	490d      	ldr	r1, [pc, #52]	; (8000eb0 <HAL_RCC_ClockConfig+0x14c>)
 8000e7c:	68d0      	ldr	r0, [r2, #12]
 8000e7e:	4001      	ands	r1, r0
 8000e80:	68e8      	ldr	r0, [r5, #12]
 8000e82:	4301      	orrs	r1, r0
 8000e84:	60d1      	str	r1, [r2, #12]
 8000e86:	0719      	lsls	r1, r3, #28
 8000e88:	d507      	bpl.n	8000e9a <HAL_RCC_ClockConfig+0x136>
 8000e8a:	4b07      	ldr	r3, [pc, #28]	; (8000ea8 <HAL_RCC_ClockConfig+0x144>)
 8000e8c:	6929      	ldr	r1, [r5, #16]
 8000e8e:	68d8      	ldr	r0, [r3, #12]
 8000e90:	4a08      	ldr	r2, [pc, #32]	; (8000eb4 <HAL_RCC_ClockConfig+0x150>)
 8000e92:	00c9      	lsls	r1, r1, #3
 8000e94:	4002      	ands	r2, r0
 8000e96:	430a      	orrs	r2, r1
 8000e98:	60da      	str	r2, [r3, #12]
 8000e9a:	2003      	movs	r0, #3
 8000e9c:	f7ff fd44 	bl	8000928 <HAL_InitTick>
 8000ea0:	2000      	movs	r0, #0
 8000ea2:	bdfe      	pop	{r1, r2, r3, r4, r5, r6, r7, pc}
 8000ea4:	40022000 	.word	0x40022000
 8000ea8:	40021000 	.word	0x40021000
 8000eac:	00001388 	.word	0x00001388
 8000eb0:	fffff8ff 	.word	0xfffff8ff
 8000eb4:	ffffc7ff 	.word	0xffffc7ff

08000eb8 <HAL_RCC_GetSysClockFreq>:
 8000eb8:	b508      	push	{r3, lr}
 8000eba:	4b1b      	ldr	r3, [pc, #108]	; (8000f28 <HAL_RCC_GetSysClockFreq+0x70>)
 8000ebc:	210c      	movs	r1, #12
 8000ebe:	685a      	ldr	r2, [r3, #4]
 8000ec0:	68d8      	ldr	r0, [r3, #12]
 8000ec2:	0412      	lsls	r2, r2, #16
 8000ec4:	4008      	ands	r0, r1
 8000ec6:	0f52      	lsrs	r2, r2, #29
 8000ec8:	f000 fa48 	bl	800135c <__gnu_thumb1_case_uqi>
 8000ecc:	25252525 	.word	0x25252525
 8000ed0:	25252507 	.word	0x25252507
 8000ed4:	2525252a 	.word	0x2525252a
 8000ed8:	0c          	.byte	0x0c
 8000ed9:	00          	.byte	0x00
 8000eda:	681b      	ldr	r3, [r3, #0]
 8000edc:	06d8      	lsls	r0, r3, #27
 8000ede:	d521      	bpl.n	8000f24 <HAL_RCC_GetSysClockFreq+0x6c>
 8000ee0:	4812      	ldr	r0, [pc, #72]	; (8000f2c <HAL_RCC_GetSysClockFreq+0x74>)
 8000ee2:	e020      	b.n	8000f26 <HAL_RCC_GetSysClockFreq+0x6e>
 8000ee4:	68da      	ldr	r2, [r3, #12]
 8000ee6:	68d9      	ldr	r1, [r3, #12]
 8000ee8:	0292      	lsls	r2, r2, #10
 8000eea:	4811      	ldr	r0, [pc, #68]	; (8000f30 <HAL_RCC_GetSysClockFreq+0x78>)
 8000eec:	0209      	lsls	r1, r1, #8
 8000eee:	68db      	ldr	r3, [r3, #12]
 8000ef0:	0f12      	lsrs	r2, r2, #28
 8000ef2:	0f89      	lsrs	r1, r1, #30
 8000ef4:	5c82      	ldrb	r2, [r0, r2]
 8000ef6:	3101      	adds	r1, #1
 8000ef8:	03d8      	lsls	r0, r3, #15
 8000efa:	d407      	bmi.n	8000f0c <HAL_RCC_GetSysClockFreq+0x54>
 8000efc:	4b0a      	ldr	r3, [pc, #40]	; (8000f28 <HAL_RCC_GetSysClockFreq+0x70>)
 8000efe:	681b      	ldr	r3, [r3, #0]
 8000f00:	06d8      	lsls	r0, r3, #27
 8000f02:	d501      	bpl.n	8000f08 <HAL_RCC_GetSysClockFreq+0x50>
 8000f04:	4809      	ldr	r0, [pc, #36]	; (8000f2c <HAL_RCC_GetSysClockFreq+0x74>)
 8000f06:	e002      	b.n	8000f0e <HAL_RCC_GetSysClockFreq+0x56>
 8000f08:	480a      	ldr	r0, [pc, #40]	; (8000f34 <HAL_RCC_GetSysClockFreq+0x7c>)
 8000f0a:	e000      	b.n	8000f0e <HAL_RCC_GetSysClockFreq+0x56>
 8000f0c:	480a      	ldr	r0, [pc, #40]	; (8000f38 <HAL_RCC_GetSysClockFreq+0x80>)
 8000f0e:	4350      	muls	r0, r2
 8000f10:	f000 fa2e 	bl	8001370 <__aeabi_uidiv>
 8000f14:	e007      	b.n	8000f26 <HAL_RCC_GetSysClockFreq+0x6e>
 8000f16:	2080      	movs	r0, #128	; 0x80
 8000f18:	3201      	adds	r2, #1
 8000f1a:	0200      	lsls	r0, r0, #8
 8000f1c:	4090      	lsls	r0, r2
 8000f1e:	e002      	b.n	8000f26 <HAL_RCC_GetSysClockFreq+0x6e>
 8000f20:	4805      	ldr	r0, [pc, #20]	; (8000f38 <HAL_RCC_GetSysClockFreq+0x80>)
 8000f22:	e000      	b.n	8000f26 <HAL_RCC_GetSysClockFreq+0x6e>
 8000f24:	4803      	ldr	r0, [pc, #12]	; (8000f34 <HAL_RCC_GetSysClockFreq+0x7c>)
 8000f26:	bd08      	pop	{r3, pc}
 8000f28:	40021000 	.word	0x40021000
 8000f2c:	003d0900 	.word	0x003d0900
 8000f30:	080015e4 	.word	0x080015e4
 8000f34:	00f42400 	.word	0x00f42400
 8000f38:	007a1200 	.word	0x007a1200

08000f3c <HAL_RCC_GetHCLKFreq>:
 8000f3c:	b508      	push	{r3, lr}
 8000f3e:	f7ff ffbb 	bl	8000eb8 <HAL_RCC_GetSysClockFreq>
 8000f42:	4b05      	ldr	r3, [pc, #20]	; (8000f58 <HAL_RCC_GetHCLKFreq+0x1c>)
 8000f44:	4a05      	ldr	r2, [pc, #20]	; (8000f5c <HAL_RCC_GetHCLKFreq+0x20>)
 8000f46:	68db      	ldr	r3, [r3, #12]
 8000f48:	061b      	lsls	r3, r3, #24
 8000f4a:	0f1b      	lsrs	r3, r3, #28
 8000f4c:	5cd3      	ldrb	r3, [r2, r3]
 8000f4e:	40d8      	lsrs	r0, r3
 8000f50:	4b03      	ldr	r3, [pc, #12]	; (8000f60 <HAL_RCC_GetHCLKFreq+0x24>)
 8000f52:	6018      	str	r0, [r3, #0]
 8000f54:	bd08      	pop	{r3, pc}
 8000f56:	46c0      	nop			; (mov r8, r8)
 8000f58:	40021000 	.word	0x40021000
 8000f5c:	080015ed 	.word	0x080015ed
 8000f60:	20000000 	.word	0x20000000

08000f64 <HAL_GPIO_Init>:
 8000f64:	b5f0      	push	{r4, r5, r6, r7, lr}
 8000f66:	680a      	ldr	r2, [r1, #0]
 8000f68:	b085      	sub	sp, #20
 8000f6a:	9203      	str	r2, [sp, #12]
 8000f6c:	2300      	movs	r3, #0
 8000f6e:	9a03      	ldr	r2, [sp, #12]
 8000f70:	40da      	lsrs	r2, r3
 8000f72:	d100      	bne.n	8000f76 <HAL_GPIO_Init+0x12>
 8000f74:	e097      	b.n	80010a6 <HAL_GPIO_Init+0x142>
 8000f76:	2201      	movs	r2, #1
 8000f78:	9c03      	ldr	r4, [sp, #12]
 8000f7a:	409a      	lsls	r2, r3
 8000f7c:	4014      	ands	r4, r2
 8000f7e:	46a4      	mov	ip, r4
 8000f80:	d100      	bne.n	8000f84 <HAL_GPIO_Init+0x20>
 8000f82:	e08e      	b.n	80010a2 <HAL_GPIO_Init+0x13e>
 8000f84:	684a      	ldr	r2, [r1, #4]
 8000f86:	2410      	movs	r4, #16
 8000f88:	1c15      	adds	r5, r2, #0
 8000f8a:	43a5      	bics	r5, r4
 8000f8c:	1c2c      	adds	r4, r5, #0
 8000f8e:	3d01      	subs	r5, #1
 8000f90:	2c02      	cmp	r4, #2
 8000f92:	d10e      	bne.n	8000fb2 <HAL_GPIO_Init+0x4e>
 8000f94:	08dc      	lsrs	r4, r3, #3
 8000f96:	00a4      	lsls	r4, r4, #2
 8000f98:	2507      	movs	r5, #7
 8000f9a:	1904      	adds	r4, r0, r4
 8000f9c:	401d      	ands	r5, r3
 8000f9e:	6a26      	ldr	r6, [r4, #32]
 8000fa0:	00ad      	lsls	r5, r5, #2
 8000fa2:	270f      	movs	r7, #15
 8000fa4:	40af      	lsls	r7, r5
 8000fa6:	43be      	bics	r6, r7
 8000fa8:	690f      	ldr	r7, [r1, #16]
 8000faa:	40af      	lsls	r7, r5
 8000fac:	433e      	orrs	r6, r7
 8000fae:	6226      	str	r6, [r4, #32]
 8000fb0:	e001      	b.n	8000fb6 <HAL_GPIO_Init+0x52>
 8000fb2:	2d01      	cmp	r5, #1
 8000fb4:	d812      	bhi.n	8000fdc <HAL_GPIO_Init+0x78>
 8000fb6:	6886      	ldr	r6, [r0, #8]
 8000fb8:	005c      	lsls	r4, r3, #1
 8000fba:	2503      	movs	r5, #3
 8000fbc:	40a5      	lsls	r5, r4
 8000fbe:	43ae      	bics	r6, r5
 8000fc0:	68cd      	ldr	r5, [r1, #12]
 8000fc2:	40a5      	lsls	r5, r4
 8000fc4:	1c34      	adds	r4, r6, #0
 8000fc6:	432c      	orrs	r4, r5
 8000fc8:	6084      	str	r4, [r0, #8]
 8000fca:	6844      	ldr	r4, [r0, #4]
 8000fcc:	2501      	movs	r5, #1
 8000fce:	409d      	lsls	r5, r3
 8000fd0:	43ac      	bics	r4, r5
 8000fd2:	06d5      	lsls	r5, r2, #27
 8000fd4:	0fed      	lsrs	r5, r5, #31
 8000fd6:	409d      	lsls	r5, r3
 8000fd8:	432c      	orrs	r4, r5
 8000fda:	6044      	str	r4, [r0, #4]
 8000fdc:	2403      	movs	r4, #3
 8000fde:	005d      	lsls	r5, r3, #1
 8000fe0:	1c26      	adds	r6, r4, #0
 8000fe2:	6807      	ldr	r7, [r0, #0]
 8000fe4:	40ae      	lsls	r6, r5
 8000fe6:	43f6      	mvns	r6, r6
 8000fe8:	9600      	str	r6, [sp, #0]
 8000fea:	403e      	ands	r6, r7
 8000fec:	1c17      	adds	r7, r2, #0
 8000fee:	4027      	ands	r7, r4
 8000ff0:	40af      	lsls	r7, r5
 8000ff2:	4337      	orrs	r7, r6
 8000ff4:	6007      	str	r7, [r0, #0]
 8000ff6:	68c7      	ldr	r7, [r0, #12]
 8000ff8:	9e00      	ldr	r6, [sp, #0]
 8000ffa:	403e      	ands	r6, r7
 8000ffc:	688f      	ldr	r7, [r1, #8]
 8000ffe:	40af      	lsls	r7, r5
 8001000:	433e      	orrs	r6, r7
 8001002:	60c6      	str	r6, [r0, #12]
 8001004:	00d5      	lsls	r5, r2, #3
 8001006:	d54c      	bpl.n	80010a2 <HAL_GPIO_Init+0x13e>
 8001008:	4d28      	ldr	r5, [pc, #160]	; (80010ac <HAL_GPIO_Init+0x148>)
 800100a:	2601      	movs	r6, #1
 800100c:	6b6f      	ldr	r7, [r5, #52]	; 0x34
 800100e:	401c      	ands	r4, r3
 8001010:	4337      	orrs	r7, r6
 8001012:	636f      	str	r7, [r5, #52]	; 0x34
 8001014:	4f26      	ldr	r7, [pc, #152]	; (80010b0 <HAL_GPIO_Init+0x14c>)
 8001016:	089d      	lsrs	r5, r3, #2
 8001018:	00ad      	lsls	r5, r5, #2
 800101a:	19ed      	adds	r5, r5, r7
 800101c:	68af      	ldr	r7, [r5, #8]
 800101e:	00a4      	lsls	r4, r4, #2
 8001020:	9402      	str	r4, [sp, #8]
 8001022:	9701      	str	r7, [sp, #4]
 8001024:	9f02      	ldr	r7, [sp, #8]
 8001026:	240f      	movs	r4, #15
 8001028:	40bc      	lsls	r4, r7
 800102a:	9f01      	ldr	r7, [sp, #4]
 800102c:	43a7      	bics	r7, r4
 800102e:	24a0      	movs	r4, #160	; 0xa0
 8001030:	05e4      	lsls	r4, r4, #23
 8001032:	42a0      	cmp	r0, r4
 8001034:	d00b      	beq.n	800104e <HAL_GPIO_Init+0xea>
 8001036:	4c1f      	ldr	r4, [pc, #124]	; (80010b4 <HAL_GPIO_Init+0x150>)
 8001038:	42a0      	cmp	r0, r4
 800103a:	d00b      	beq.n	8001054 <HAL_GPIO_Init+0xf0>
 800103c:	4c1e      	ldr	r4, [pc, #120]	; (80010b8 <HAL_GPIO_Init+0x154>)
 800103e:	42a0      	cmp	r0, r4
 8001040:	d007      	beq.n	8001052 <HAL_GPIO_Init+0xee>
 8001042:	4c1e      	ldr	r4, [pc, #120]	; (80010bc <HAL_GPIO_Init+0x158>)
 8001044:	1906      	adds	r6, r0, r4
 8001046:	1e74      	subs	r4, r6, #1
 8001048:	41a6      	sbcs	r6, r4
 800104a:	3605      	adds	r6, #5
 800104c:	e002      	b.n	8001054 <HAL_GPIO_Init+0xf0>
 800104e:	2600      	movs	r6, #0
 8001050:	e000      	b.n	8001054 <HAL_GPIO_Init+0xf0>
 8001052:	2602      	movs	r6, #2
 8001054:	9c02      	ldr	r4, [sp, #8]
 8001056:	40a6      	lsls	r6, r4
 8001058:	4337      	orrs	r7, r6
 800105a:	4c19      	ldr	r4, [pc, #100]	; (80010c0 <HAL_GPIO_Init+0x15c>)
 800105c:	60af      	str	r7, [r5, #8]
 800105e:	4667      	mov	r7, ip
 8001060:	6826      	ldr	r6, [r4, #0]
 8001062:	43fd      	mvns	r5, r7
 8001064:	03d7      	lsls	r7, r2, #15
 8001066:	d401      	bmi.n	800106c <HAL_GPIO_Init+0x108>
 8001068:	402e      	ands	r6, r5
 800106a:	e001      	b.n	8001070 <HAL_GPIO_Init+0x10c>
 800106c:	4667      	mov	r7, ip
 800106e:	433e      	orrs	r6, r7
 8001070:	6026      	str	r6, [r4, #0]
 8001072:	6866      	ldr	r6, [r4, #4]
 8001074:	0397      	lsls	r7, r2, #14
 8001076:	d401      	bmi.n	800107c <HAL_GPIO_Init+0x118>
 8001078:	402e      	ands	r6, r5
 800107a:	e001      	b.n	8001080 <HAL_GPIO_Init+0x11c>
 800107c:	4667      	mov	r7, ip
 800107e:	433e      	orrs	r6, r7
 8001080:	6066      	str	r6, [r4, #4]
 8001082:	68a6      	ldr	r6, [r4, #8]
 8001084:	02d7      	lsls	r7, r2, #11
 8001086:	d401      	bmi.n	800108c <HAL_GPIO_Init+0x128>
 8001088:	402e      	ands	r6, r5
 800108a:	e001      	b.n	8001090 <HAL_GPIO_Init+0x12c>
 800108c:	4667      	mov	r7, ip
 800108e:	433e      	orrs	r6, r7
 8001090:	60a6      	str	r6, [r4, #8]
 8001092:	68e6      	ldr	r6, [r4, #12]
 8001094:	0297      	lsls	r7, r2, #10
 8001096:	d401      	bmi.n	800109c <HAL_GPIO_Init+0x138>
 8001098:	4035      	ands	r5, r6
 800109a:	e001      	b.n	80010a0 <HAL_GPIO_Init+0x13c>
 800109c:	4665      	mov	r5, ip
 800109e:	4335      	orrs	r5, r6
 80010a0:	60e5      	str	r5, [r4, #12]
 80010a2:	3301      	adds	r3, #1
 80010a4:	e763      	b.n	8000f6e <HAL_GPIO_Init+0xa>
 80010a6:	b005      	add	sp, #20
 80010a8:	bdf0      	pop	{r4, r5, r6, r7, pc}
 80010aa:	46c0      	nop			; (mov r8, r8)
 80010ac:	40021000 	.word	0x40021000
 80010b0:	40010000 	.word	0x40010000
 80010b4:	50000400 	.word	0x50000400
 80010b8:	50000800 	.word	0x50000800
 80010bc:	afffe400 	.word	0xafffe400
 80010c0:	40010400 	.word	0x40010400

080010c4 <HAL_RCCEx_PeriphCLKConfig>:
 80010c4:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
 80010c6:	1c05      	adds	r5, r0, #0
 80010c8:	6800      	ldr	r0, [r0, #0]
 80010ca:	0680      	lsls	r0, r0, #26
 80010cc:	d563      	bpl.n	8001196 <HAL_RCCEx_PeriphCLKConfig+0xd2>
 80010ce:	4c45      	ldr	r4, [pc, #276]	; (80011e4 <HAL_RCCEx_PeriphCLKConfig+0x120>)
 80010d0:	692a      	ldr	r2, [r5, #16]
 80010d2:	6821      	ldr	r1, [r4, #0]
 80010d4:	23c0      	movs	r3, #192	; 0xc0
 80010d6:	4051      	eors	r1, r2
 80010d8:	039b      	lsls	r3, r3, #14
 80010da:	4219      	tst	r1, r3
 80010dc:	d008      	beq.n	80010f0 <HAL_RCCEx_PeriphCLKConfig+0x2c>
 80010de:	23c0      	movs	r3, #192	; 0xc0
 80010e0:	029b      	lsls	r3, r3, #10
 80010e2:	401a      	ands	r2, r3
 80010e4:	429a      	cmp	r2, r3
 80010e6:	d103      	bne.n	80010f0 <HAL_RCCEx_PeriphCLKConfig+0x2c>
 80010e8:	6823      	ldr	r3, [r4, #0]
 80010ea:	2001      	movs	r0, #1
 80010ec:	039a      	lsls	r2, r3, #14
 80010ee:	d478      	bmi.n	80011e2 <HAL_RCCEx_PeriphCLKConfig+0x11e>
 80010f0:	6ba2      	ldr	r2, [r4, #56]	; 0x38
 80010f2:	2380      	movs	r3, #128	; 0x80
 80010f4:	055b      	lsls	r3, r3, #21
 80010f6:	4313      	orrs	r3, r2
 80010f8:	4e3b      	ldr	r6, [pc, #236]	; (80011e8 <HAL_RCCEx_PeriphCLKConfig+0x124>)
 80010fa:	63a3      	str	r3, [r4, #56]	; 0x38
 80010fc:	6832      	ldr	r2, [r6, #0]
 80010fe:	2380      	movs	r3, #128	; 0x80
 8001100:	005b      	lsls	r3, r3, #1
 8001102:	4313      	orrs	r3, r2
 8001104:	6033      	str	r3, [r6, #0]
 8001106:	f7ff fc21 	bl	800094c <HAL_GetTick>
 800110a:	1c07      	adds	r7, r0, #0
 800110c:	6833      	ldr	r3, [r6, #0]
 800110e:	05d8      	lsls	r0, r3, #23
 8001110:	d406      	bmi.n	8001120 <HAL_RCCEx_PeriphCLKConfig+0x5c>
 8001112:	f7ff fc1b 	bl	800094c <HAL_GetTick>
 8001116:	1bc0      	subs	r0, r0, r7
 8001118:	2864      	cmp	r0, #100	; 0x64
 800111a:	d9f7      	bls.n	800110c <HAL_RCCEx_PeriphCLKConfig+0x48>
 800111c:	2003      	movs	r0, #3
 800111e:	e060      	b.n	80011e2 <HAL_RCCEx_PeriphCLKConfig+0x11e>
 8001120:	692a      	ldr	r2, [r5, #16]
 8001122:	6d21      	ldr	r1, [r4, #80]	; 0x50
 8001124:	4b2f      	ldr	r3, [pc, #188]	; (80011e4 <HAL_RCCEx_PeriphCLKConfig+0x120>)
 8001126:	4051      	eors	r1, r2
 8001128:	22c0      	movs	r2, #192	; 0xc0
 800112a:	0292      	lsls	r2, r2, #10
 800112c:	4211      	tst	r1, r2
 800112e:	d032      	beq.n	8001196 <HAL_RCCEx_PeriphCLKConfig+0xd2>
 8001130:	6d1a      	ldr	r2, [r3, #80]	; 0x50
 8001132:	2080      	movs	r0, #128	; 0x80
 8001134:	6d1f      	ldr	r7, [r3, #80]	; 0x50
 8001136:	0300      	lsls	r0, r0, #12
 8001138:	4338      	orrs	r0, r7
 800113a:	6518      	str	r0, [r3, #80]	; 0x50
 800113c:	6d1f      	ldr	r7, [r3, #80]	; 0x50
 800113e:	4e2b      	ldr	r6, [pc, #172]	; (80011ec <HAL_RCCEx_PeriphCLKConfig+0x128>)
 8001140:	482b      	ldr	r0, [pc, #172]	; (80011f0 <HAL_RCCEx_PeriphCLKConfig+0x12c>)
 8001142:	1c11      	adds	r1, r2, #0
 8001144:	4031      	ands	r1, r6
 8001146:	4038      	ands	r0, r7
 8001148:	6518      	str	r0, [r3, #80]	; 0x50
 800114a:	6519      	str	r1, [r3, #80]	; 0x50
 800114c:	0593      	lsls	r3, r2, #22
 800114e:	d40e      	bmi.n	800116e <HAL_RCCEx_PeriphCLKConfig+0xaa>
 8001150:	6929      	ldr	r1, [r5, #16]
 8001152:	20c0      	movs	r0, #192	; 0xc0
 8001154:	0280      	lsls	r0, r0, #10
 8001156:	1c0b      	adds	r3, r1, #0
 8001158:	4003      	ands	r3, r0
 800115a:	4a26      	ldr	r2, [pc, #152]	; (80011f4 <HAL_RCCEx_PeriphCLKConfig+0x130>)
 800115c:	4283      	cmp	r3, r0
 800115e:	d113      	bne.n	8001188 <HAL_RCCEx_PeriphCLKConfig+0xc4>
 8001160:	6820      	ldr	r0, [r4, #0]
 8001162:	27c0      	movs	r7, #192	; 0xc0
 8001164:	03bf      	lsls	r7, r7, #14
 8001166:	4039      	ands	r1, r7
 8001168:	4002      	ands	r2, r0
 800116a:	430a      	orrs	r2, r1
 800116c:	e00e      	b.n	800118c <HAL_RCCEx_PeriphCLKConfig+0xc8>
 800116e:	f7ff fbed 	bl	800094c <HAL_GetTick>
 8001172:	1c07      	adds	r7, r0, #0
 8001174:	6d23      	ldr	r3, [r4, #80]	; 0x50
 8001176:	0598      	lsls	r0, r3, #22
 8001178:	d4ea      	bmi.n	8001150 <HAL_RCCEx_PeriphCLKConfig+0x8c>
 800117a:	f7ff fbe7 	bl	800094c <HAL_GetTick>
 800117e:	4b1e      	ldr	r3, [pc, #120]	; (80011f8 <HAL_RCCEx_PeriphCLKConfig+0x134>)
 8001180:	1bc0      	subs	r0, r0, r7
 8001182:	4298      	cmp	r0, r3
 8001184:	d9f6      	bls.n	8001174 <HAL_RCCEx_PeriphCLKConfig+0xb0>
 8001186:	e7c9      	b.n	800111c <HAL_RCCEx_PeriphCLKConfig+0x58>
 8001188:	6821      	ldr	r1, [r4, #0]
 800118a:	400a      	ands	r2, r1
 800118c:	6022      	str	r2, [r4, #0]
 800118e:	6d22      	ldr	r2, [r4, #80]	; 0x50
 8001190:	4016      	ands	r6, r2
 8001192:	4333      	orrs	r3, r6
 8001194:	6523      	str	r3, [r4, #80]	; 0x50
 8001196:	682b      	ldr	r3, [r5, #0]
 8001198:	079a      	lsls	r2, r3, #30
 800119a:	d506      	bpl.n	80011aa <HAL_RCCEx_PeriphCLKConfig+0xe6>
 800119c:	4a11      	ldr	r2, [pc, #68]	; (80011e4 <HAL_RCCEx_PeriphCLKConfig+0x120>)
 800119e:	200c      	movs	r0, #12
 80011a0:	6cd1      	ldr	r1, [r2, #76]	; 0x4c
 80011a2:	4381      	bics	r1, r0
 80011a4:	6868      	ldr	r0, [r5, #4]
 80011a6:	4301      	orrs	r1, r0
 80011a8:	64d1      	str	r1, [r2, #76]	; 0x4c
 80011aa:	075a      	lsls	r2, r3, #29
 80011ac:	d506      	bpl.n	80011bc <HAL_RCCEx_PeriphCLKConfig+0xf8>
 80011ae:	4a0d      	ldr	r2, [pc, #52]	; (80011e4 <HAL_RCCEx_PeriphCLKConfig+0x120>)
 80011b0:	4912      	ldr	r1, [pc, #72]	; (80011fc <HAL_RCCEx_PeriphCLKConfig+0x138>)
 80011b2:	6cd0      	ldr	r0, [r2, #76]	; 0x4c
 80011b4:	4001      	ands	r1, r0
 80011b6:	68a8      	ldr	r0, [r5, #8]
 80011b8:	4301      	orrs	r1, r0
 80011ba:	64d1      	str	r1, [r2, #76]	; 0x4c
 80011bc:	071a      	lsls	r2, r3, #28
 80011be:	d506      	bpl.n	80011ce <HAL_RCCEx_PeriphCLKConfig+0x10a>
 80011c0:	4a08      	ldr	r2, [pc, #32]	; (80011e4 <HAL_RCCEx_PeriphCLKConfig+0x120>)
 80011c2:	490f      	ldr	r1, [pc, #60]	; (8001200 <HAL_RCCEx_PeriphCLKConfig+0x13c>)
 80011c4:	6cd0      	ldr	r0, [r2, #76]	; 0x4c
 80011c6:	4001      	ands	r1, r0
 80011c8:	68e8      	ldr	r0, [r5, #12]
 80011ca:	4301      	orrs	r1, r0
 80011cc:	64d1      	str	r1, [r2, #76]	; 0x4c
 80011ce:	2000      	movs	r0, #0
 80011d0:	061a      	lsls	r2, r3, #24
 80011d2:	d506      	bpl.n	80011e2 <HAL_RCCEx_PeriphCLKConfig+0x11e>
 80011d4:	4b03      	ldr	r3, [pc, #12]	; (80011e4 <HAL_RCCEx_PeriphCLKConfig+0x120>)
 80011d6:	4a0b      	ldr	r2, [pc, #44]	; (8001204 <HAL_RCCEx_PeriphCLKConfig+0x140>)
 80011d8:	6cd9      	ldr	r1, [r3, #76]	; 0x4c
 80011da:	400a      	ands	r2, r1
 80011dc:	6969      	ldr	r1, [r5, #20]
 80011de:	430a      	orrs	r2, r1
 80011e0:	64da      	str	r2, [r3, #76]	; 0x4c
 80011e2:	bdf8      	pop	{r3, r4, r5, r6, r7, pc}
 80011e4:	40021000 	.word	0x40021000
 80011e8:	40007000 	.word	0x40007000
 80011ec:	fffcffff 	.word	0xfffcffff
 80011f0:	fff7ffff 	.word	0xfff7ffff
 80011f4:	ffcfffff 	.word	0xffcfffff
 80011f8:	00001388 	.word	0x00001388
 80011fc:	fffff3ff 	.word	0xfffff3ff
 8001200:	ffffcfff 	.word	0xffffcfff
 8001204:	fff3ffff 	.word	0xfff3ffff

08001208 <SystemClock_Config>:
 8001208:	b500      	push	{lr}
 800120a:	b093      	sub	sp, #76	; 0x4c
 800120c:	2100      	movs	r1, #0
 800120e:	2214      	movs	r2, #20
 8001210:	4668      	mov	r0, sp
 8001212:	f000 f95d 	bl	80014d0 <memset>
 8001216:	2100      	movs	r1, #0
 8001218:	2234      	movs	r2, #52	; 0x34
 800121a:	a805      	add	r0, sp, #20
 800121c:	f000 f958 	bl	80014d0 <memset>
 8001220:	2310      	movs	r3, #16
 8001222:	9305      	str	r3, [sp, #20]
 8001224:	2301      	movs	r3, #1
 8001226:	930b      	str	r3, [sp, #44]	; 0x2c
 8001228:	23a0      	movs	r3, #160	; 0xa0
 800122a:	021b      	lsls	r3, r3, #8
 800122c:	a805      	add	r0, sp, #20
 800122e:	930d      	str	r3, [sp, #52]	; 0x34
 8001230:	f7ff fb92 	bl	8000958 <HAL_RCC_OscConfig>
 8001234:	1e01      	subs	r1, r0, #0
 8001236:	d000      	beq.n	800123a <SystemClock_Config+0x32>
 8001238:	e7fe      	b.n	8001238 <SystemClock_Config+0x30>
 800123a:	230f      	movs	r3, #15
 800123c:	9001      	str	r0, [sp, #4]
 800123e:	9002      	str	r0, [sp, #8]
 8001240:	9003      	str	r0, [sp, #12]
 8001242:	9004      	str	r0, [sp, #16]
 8001244:	4668      	mov	r0, sp
 8001246:	9300      	str	r3, [sp, #0]
 8001248:	f7ff fd8c 	bl	8000d64 <HAL_RCC_ClockConfig>
 800124c:	2800      	cmp	r0, #0
 800124e:	d000      	beq.n	8001252 <SystemClock_Config+0x4a>
 8001250:	e7fe      	b.n	8001250 <SystemClock_Config+0x48>
 8001252:	4b09      	ldr	r3, [pc, #36]	; (8001278 <SystemClock_Config+0x70>)
 8001254:	2280      	movs	r2, #128	; 0x80
 8001256:	6b99      	ldr	r1, [r3, #56]	; 0x38
 8001258:	0552      	lsls	r2, r2, #21
 800125a:	430a      	orrs	r2, r1
 800125c:	639a      	str	r2, [r3, #56]	; 0x38
 800125e:	4a07      	ldr	r2, [pc, #28]	; (800127c <SystemClock_Config+0x74>)
 8001260:	21c0      	movs	r1, #192	; 0xc0
 8001262:	6810      	ldr	r0, [r2, #0]
 8001264:	0149      	lsls	r1, r1, #5
 8001266:	4301      	orrs	r1, r0
 8001268:	6011      	str	r1, [r2, #0]
 800126a:	6b99      	ldr	r1, [r3, #56]	; 0x38
 800126c:	4a04      	ldr	r2, [pc, #16]	; (8001280 <SystemClock_Config+0x78>)
 800126e:	400a      	ands	r2, r1
 8001270:	639a      	str	r2, [r3, #56]	; 0x38
 8001272:	b013      	add	sp, #76	; 0x4c
 8001274:	bd00      	pop	{pc}
 8001276:	46c0      	nop			; (mov r8, r8)
 8001278:	40021000 	.word	0x40021000
 800127c:	40007000 	.word	0x40007000
 8001280:	efffffff 	.word	0xefffffff

08001284 <lib_low_level_init>:
 8001284:	b508      	push	{r3, lr}
 8001286:	f7ff ffbf 	bl	8001208 <SystemClock_Config>
 800128a:	f000 f815 	bl	80012b8 <gpio_init>
 800128e:	f7ff fa41 	bl	8000714 <uart_init>
 8001292:	f7ff f9cb 	bl	800062c <timer_init>
 8001296:	2008      	movs	r0, #8
 8001298:	f000 f828 	bl	80012ec <led_on>
 800129c:	2064      	movs	r0, #100	; 0x64
 800129e:	f7ff fa1d 	bl	80006dc <timer_delay_ms>
 80012a2:	2008      	movs	r0, #8
 80012a4:	f000 f828 	bl	80012f8 <led_off>
 80012a8:	2064      	movs	r0, #100	; 0x64
 80012aa:	f7ff fa17 	bl	80006dc <timer_delay_ms>
 80012ae:	2061      	movs	r0, #97	; 0x61
 80012b0:	f7ff fa26 	bl	8000700 <uart_write>
 80012b4:	e7ef      	b.n	8001296 <lib_low_level_init+0x12>
	...

080012b8 <gpio_init>:
 80012b8:	b530      	push	{r4, r5, lr}
 80012ba:	4a0a      	ldr	r2, [pc, #40]	; (80012e4 <gpio_init+0x2c>)
 80012bc:	2303      	movs	r3, #3
 80012be:	6ad1      	ldr	r1, [r2, #44]	; 0x2c
 80012c0:	4c09      	ldr	r4, [pc, #36]	; (80012e8 <gpio_init+0x30>)
 80012c2:	b087      	sub	sp, #28
 80012c4:	4319      	orrs	r1, r3
 80012c6:	62d1      	str	r1, [r2, #44]	; 0x2c
 80012c8:	2508      	movs	r5, #8
 80012ca:	2201      	movs	r2, #1
 80012cc:	1c20      	adds	r0, r4, #0
 80012ce:	a901      	add	r1, sp, #4
 80012d0:	9202      	str	r2, [sp, #8]
 80012d2:	9203      	str	r2, [sp, #12]
 80012d4:	9304      	str	r3, [sp, #16]
 80012d6:	9501      	str	r5, [sp, #4]
 80012d8:	f7ff fe44 	bl	8000f64 <HAL_GPIO_Init>
 80012dc:	62a5      	str	r5, [r4, #40]	; 0x28
 80012de:	b007      	add	sp, #28
 80012e0:	bd30      	pop	{r4, r5, pc}
 80012e2:	46c0      	nop			; (mov r8, r8)
 80012e4:	40021000 	.word	0x40021000
 80012e8:	50000400 	.word	0x50000400

080012ec <led_on>:
 80012ec:	4b01      	ldr	r3, [pc, #4]	; (80012f4 <led_on+0x8>)
 80012ee:	6198      	str	r0, [r3, #24]
 80012f0:	4770      	bx	lr
 80012f2:	46c0      	nop			; (mov r8, r8)
 80012f4:	50000400 	.word	0x50000400

080012f8 <led_off>:
 80012f8:	4b01      	ldr	r3, [pc, #4]	; (8001300 <led_off+0x8>)
 80012fa:	6298      	str	r0, [r3, #40]	; 0x28
 80012fc:	4770      	bx	lr
 80012fe:	46c0      	nop			; (mov r8, r8)
 8001300:	50000400 	.word	0x50000400

08001304 <Default_Handler>:
 8001304:	46c0      	nop			; (mov r8, r8)
 8001306:	e7fd      	b.n	8001304 <Default_Handler>

08001308 <HardFault_Handler>:
 8001308:	2008      	movs	r0, #8
 800130a:	f7ff ffef 	bl	80012ec <led_on>
 800130e:	4b07      	ldr	r3, [pc, #28]	; (800132c <HardFault_Handler+0x24>)
 8001310:	3b01      	subs	r3, #1
 8001312:	2b00      	cmp	r3, #0
 8001314:	d001      	beq.n	800131a <HardFault_Handler+0x12>
 8001316:	46c0      	nop			; (mov r8, r8)
 8001318:	e7fa      	b.n	8001310 <HardFault_Handler+0x8>
 800131a:	2008      	movs	r0, #8
 800131c:	f7ff ffec 	bl	80012f8 <led_off>
 8001320:	4b02      	ldr	r3, [pc, #8]	; (800132c <HardFault_Handler+0x24>)
 8001322:	3b01      	subs	r3, #1
 8001324:	2b00      	cmp	r3, #0
 8001326:	d0ef      	beq.n	8001308 <HardFault_Handler>
 8001328:	46c0      	nop			; (mov r8, r8)
 800132a:	e7fa      	b.n	8001322 <HardFault_Handler+0x1a>
 800132c:	000186a1 	.word	0x000186a1

08001330 <_reset_init>:
 8001330:	4a07      	ldr	r2, [pc, #28]	; (8001350 <_reset_init+0x20>)
 8001332:	4908      	ldr	r1, [pc, #32]	; (8001354 <_reset_init+0x24>)
 8001334:	2300      	movs	r3, #0
 8001336:	1a89      	subs	r1, r1, r2
 8001338:	1089      	asrs	r1, r1, #2
 800133a:	1c10      	adds	r0, r2, #0
 800133c:	428b      	cmp	r3, r1
 800133e:	d005      	beq.n	800134c <_reset_init+0x1c>
 8001340:	4c05      	ldr	r4, [pc, #20]	; (8001358 <_reset_init+0x28>)
 8001342:	009a      	lsls	r2, r3, #2
 8001344:	58a4      	ldr	r4, [r4, r2]
 8001346:	3301      	adds	r3, #1
 8001348:	5084      	str	r4, [r0, r2]
 800134a:	e7f7      	b.n	800133c <_reset_init+0xc>
 800134c:	f7ff f94c 	bl	80005e8 <main>
 8001350:	20000000 	.word	0x20000000
 8001354:	20000004 	.word	0x20000004
 8001358:	08001604 	.word	0x08001604

0800135c <__gnu_thumb1_case_uqi>:
 800135c:	b402      	push	{r1}
 800135e:	4671      	mov	r1, lr
 8001360:	0849      	lsrs	r1, r1, #1
 8001362:	0049      	lsls	r1, r1, #1
 8001364:	5c09      	ldrb	r1, [r1, r0]
 8001366:	0049      	lsls	r1, r1, #1
 8001368:	448e      	add	lr, r1
 800136a:	bc02      	pop	{r1}
 800136c:	4770      	bx	lr
 800136e:	46c0      	nop			; (mov r8, r8)

08001370 <__aeabi_uidiv>:
 8001370:	2900      	cmp	r1, #0
 8001372:	d034      	beq.n	80013de <.udivsi3_skip_div0_test+0x6a>

08001374 <.udivsi3_skip_div0_test>:
 8001374:	2301      	movs	r3, #1
 8001376:	2200      	movs	r2, #0
 8001378:	b410      	push	{r4}
 800137a:	4288      	cmp	r0, r1
 800137c:	d32c      	bcc.n	80013d8 <.udivsi3_skip_div0_test+0x64>
 800137e:	2401      	movs	r4, #1
 8001380:	0724      	lsls	r4, r4, #28
 8001382:	42a1      	cmp	r1, r4
 8001384:	d204      	bcs.n	8001390 <.udivsi3_skip_div0_test+0x1c>
 8001386:	4281      	cmp	r1, r0
 8001388:	d202      	bcs.n	8001390 <.udivsi3_skip_div0_test+0x1c>
 800138a:	0109      	lsls	r1, r1, #4
 800138c:	011b      	lsls	r3, r3, #4
 800138e:	e7f8      	b.n	8001382 <.udivsi3_skip_div0_test+0xe>
 8001390:	00e4      	lsls	r4, r4, #3
 8001392:	42a1      	cmp	r1, r4
 8001394:	d204      	bcs.n	80013a0 <.udivsi3_skip_div0_test+0x2c>
 8001396:	4281      	cmp	r1, r0
 8001398:	d202      	bcs.n	80013a0 <.udivsi3_skip_div0_test+0x2c>
 800139a:	0049      	lsls	r1, r1, #1
 800139c:	005b      	lsls	r3, r3, #1
 800139e:	e7f8      	b.n	8001392 <.udivsi3_skip_div0_test+0x1e>
 80013a0:	4288      	cmp	r0, r1
 80013a2:	d301      	bcc.n	80013a8 <.udivsi3_skip_div0_test+0x34>
 80013a4:	1a40      	subs	r0, r0, r1
 80013a6:	431a      	orrs	r2, r3
 80013a8:	084c      	lsrs	r4, r1, #1
 80013aa:	42a0      	cmp	r0, r4
 80013ac:	d302      	bcc.n	80013b4 <.udivsi3_skip_div0_test+0x40>
 80013ae:	1b00      	subs	r0, r0, r4
 80013b0:	085c      	lsrs	r4, r3, #1
 80013b2:	4322      	orrs	r2, r4
 80013b4:	088c      	lsrs	r4, r1, #2
 80013b6:	42a0      	cmp	r0, r4
 80013b8:	d302      	bcc.n	80013c0 <.udivsi3_skip_div0_test+0x4c>
 80013ba:	1b00      	subs	r0, r0, r4
 80013bc:	089c      	lsrs	r4, r3, #2
 80013be:	4322      	orrs	r2, r4
 80013c0:	08cc      	lsrs	r4, r1, #3
 80013c2:	42a0      	cmp	r0, r4
 80013c4:	d302      	bcc.n	80013cc <.udivsi3_skip_div0_test+0x58>
 80013c6:	1b00      	subs	r0, r0, r4
 80013c8:	08dc      	lsrs	r4, r3, #3
 80013ca:	4322      	orrs	r2, r4
 80013cc:	2800      	cmp	r0, #0
 80013ce:	d003      	beq.n	80013d8 <.udivsi3_skip_div0_test+0x64>
 80013d0:	091b      	lsrs	r3, r3, #4
 80013d2:	d001      	beq.n	80013d8 <.udivsi3_skip_div0_test+0x64>
 80013d4:	0909      	lsrs	r1, r1, #4
 80013d6:	e7e3      	b.n	80013a0 <.udivsi3_skip_div0_test+0x2c>
 80013d8:	1c10      	adds	r0, r2, #0
 80013da:	bc10      	pop	{r4}
 80013dc:	4770      	bx	lr
 80013de:	2800      	cmp	r0, #0
 80013e0:	d001      	beq.n	80013e6 <.udivsi3_skip_div0_test+0x72>
 80013e2:	2000      	movs	r0, #0
 80013e4:	43c0      	mvns	r0, r0
 80013e6:	b407      	push	{r0, r1, r2}
 80013e8:	4802      	ldr	r0, [pc, #8]	; (80013f4 <.udivsi3_skip_div0_test+0x80>)
 80013ea:	a102      	add	r1, pc, #8	; (adr r1, 80013f4 <.udivsi3_skip_div0_test+0x80>)
 80013ec:	1840      	adds	r0, r0, r1
 80013ee:	9002      	str	r0, [sp, #8]
 80013f0:	bd03      	pop	{r0, r1, pc}
 80013f2:	46c0      	nop			; (mov r8, r8)
 80013f4:	000000d9 	.word	0x000000d9

080013f8 <__aeabi_uidivmod>:
 80013f8:	2900      	cmp	r1, #0
 80013fa:	d0f0      	beq.n	80013de <.udivsi3_skip_div0_test+0x6a>
 80013fc:	b503      	push	{r0, r1, lr}
 80013fe:	f7ff ffb9 	bl	8001374 <.udivsi3_skip_div0_test>
 8001402:	bc0e      	pop	{r1, r2, r3}
 8001404:	4342      	muls	r2, r0
 8001406:	1a89      	subs	r1, r1, r2
 8001408:	4718      	bx	r3
 800140a:	46c0      	nop			; (mov r8, r8)

0800140c <__aeabi_idiv>:
 800140c:	2900      	cmp	r1, #0
 800140e:	d041      	beq.n	8001494 <.divsi3_skip_div0_test+0x84>

08001410 <.divsi3_skip_div0_test>:
 8001410:	b410      	push	{r4}
 8001412:	1c04      	adds	r4, r0, #0
 8001414:	404c      	eors	r4, r1
 8001416:	46a4      	mov	ip, r4
 8001418:	2301      	movs	r3, #1
 800141a:	2200      	movs	r2, #0
 800141c:	2900      	cmp	r1, #0
 800141e:	d500      	bpl.n	8001422 <.divsi3_skip_div0_test+0x12>
 8001420:	4249      	negs	r1, r1
 8001422:	2800      	cmp	r0, #0
 8001424:	d500      	bpl.n	8001428 <.divsi3_skip_div0_test+0x18>
 8001426:	4240      	negs	r0, r0
 8001428:	4288      	cmp	r0, r1
 800142a:	d32c      	bcc.n	8001486 <.divsi3_skip_div0_test+0x76>
 800142c:	2401      	movs	r4, #1
 800142e:	0724      	lsls	r4, r4, #28
 8001430:	42a1      	cmp	r1, r4
 8001432:	d204      	bcs.n	800143e <.divsi3_skip_div0_test+0x2e>
 8001434:	4281      	cmp	r1, r0
 8001436:	d202      	bcs.n	800143e <.divsi3_skip_div0_test+0x2e>
 8001438:	0109      	lsls	r1, r1, #4
 800143a:	011b      	lsls	r3, r3, #4
 800143c:	e7f8      	b.n	8001430 <.divsi3_skip_div0_test+0x20>
 800143e:	00e4      	lsls	r4, r4, #3
 8001440:	42a1      	cmp	r1, r4
 8001442:	d204      	bcs.n	800144e <.divsi3_skip_div0_test+0x3e>
 8001444:	4281      	cmp	r1, r0
 8001446:	d202      	bcs.n	800144e <.divsi3_skip_div0_test+0x3e>
 8001448:	0049      	lsls	r1, r1, #1
 800144a:	005b      	lsls	r3, r3, #1
 800144c:	e7f8      	b.n	8001440 <.divsi3_skip_div0_test+0x30>
 800144e:	4288      	cmp	r0, r1
 8001450:	d301      	bcc.n	8001456 <.divsi3_skip_div0_test+0x46>
 8001452:	1a40      	subs	r0, r0, r1
 8001454:	431a      	orrs	r2, r3
 8001456:	084c      	lsrs	r4, r1, #1
 8001458:	42a0      	cmp	r0, r4
 800145a:	d302      	bcc.n	8001462 <.divsi3_skip_div0_test+0x52>
 800145c:	1b00      	subs	r0, r0, r4
 800145e:	085c      	lsrs	r4, r3, #1
 8001460:	4322      	orrs	r2, r4
 8001462:	088c      	lsrs	r4, r1, #2
 8001464:	42a0      	cmp	r0, r4
 8001466:	d302      	bcc.n	800146e <.divsi3_skip_div0_test+0x5e>
 8001468:	1b00      	subs	r0, r0, r4
 800146a:	089c      	lsrs	r4, r3, #2
 800146c:	4322      	orrs	r2, r4
 800146e:	08cc      	lsrs	r4, r1, #3
 8001470:	42a0      	cmp	r0, r4
 8001472:	d302      	bcc.n	800147a <.divsi3_skip_div0_test+0x6a>
 8001474:	1b00      	subs	r0, r0, r4
 8001476:	08dc      	lsrs	r4, r3, #3
 8001478:	4322      	orrs	r2, r4
 800147a:	2800      	cmp	r0, #0
 800147c:	d003      	beq.n	8001486 <.divsi3_skip_div0_test+0x76>
 800147e:	091b      	lsrs	r3, r3, #4
 8001480:	d001      	beq.n	8001486 <.divsi3_skip_div0_test+0x76>
 8001482:	0909      	lsrs	r1, r1, #4
 8001484:	e7e3      	b.n	800144e <.divsi3_skip_div0_test+0x3e>
 8001486:	1c10      	adds	r0, r2, #0
 8001488:	4664      	mov	r4, ip
 800148a:	2c00      	cmp	r4, #0
 800148c:	d500      	bpl.n	8001490 <.divsi3_skip_div0_test+0x80>
 800148e:	4240      	negs	r0, r0
 8001490:	bc10      	pop	{r4}
 8001492:	4770      	bx	lr
 8001494:	2800      	cmp	r0, #0
 8001496:	d006      	beq.n	80014a6 <.divsi3_skip_div0_test+0x96>
 8001498:	db03      	blt.n	80014a2 <.divsi3_skip_div0_test+0x92>
 800149a:	2000      	movs	r0, #0
 800149c:	43c0      	mvns	r0, r0
 800149e:	0840      	lsrs	r0, r0, #1
 80014a0:	e001      	b.n	80014a6 <.divsi3_skip_div0_test+0x96>
 80014a2:	2080      	movs	r0, #128	; 0x80
 80014a4:	0600      	lsls	r0, r0, #24
 80014a6:	b407      	push	{r0, r1, r2}
 80014a8:	4802      	ldr	r0, [pc, #8]	; (80014b4 <.divsi3_skip_div0_test+0xa4>)
 80014aa:	a102      	add	r1, pc, #8	; (adr r1, 80014b4 <.divsi3_skip_div0_test+0xa4>)
 80014ac:	1840      	adds	r0, r0, r1
 80014ae:	9002      	str	r0, [sp, #8]
 80014b0:	bd03      	pop	{r0, r1, pc}
 80014b2:	46c0      	nop			; (mov r8, r8)
 80014b4:	00000019 	.word	0x00000019

080014b8 <__aeabi_idivmod>:
 80014b8:	2900      	cmp	r1, #0
 80014ba:	d0eb      	beq.n	8001494 <.divsi3_skip_div0_test+0x84>
 80014bc:	b503      	push	{r0, r1, lr}
 80014be:	f7ff ffa7 	bl	8001410 <.divsi3_skip_div0_test>
 80014c2:	bc0e      	pop	{r1, r2, r3}
 80014c4:	4342      	muls	r2, r0
 80014c6:	1a89      	subs	r1, r1, r2
 80014c8:	4718      	bx	r3
 80014ca:	46c0      	nop			; (mov r8, r8)

080014cc <__aeabi_idiv0>:
 80014cc:	4770      	bx	lr
 80014ce:	46c0      	nop			; (mov r8, r8)

080014d0 <memset>:
 80014d0:	b5f0      	push	{r4, r5, r6, r7, lr}
 80014d2:	0783      	lsls	r3, r0, #30
 80014d4:	d046      	beq.n	8001564 <memset+0x94>
 80014d6:	1e54      	subs	r4, r2, #1
 80014d8:	2a00      	cmp	r2, #0
 80014da:	d042      	beq.n	8001562 <memset+0x92>
 80014dc:	b2ce      	uxtb	r6, r1
 80014de:	1c03      	adds	r3, r0, #0
 80014e0:	2503      	movs	r5, #3
 80014e2:	e003      	b.n	80014ec <memset+0x1c>
 80014e4:	1e62      	subs	r2, r4, #1
 80014e6:	2c00      	cmp	r4, #0
 80014e8:	d03b      	beq.n	8001562 <memset+0x92>
 80014ea:	1c14      	adds	r4, r2, #0
 80014ec:	3301      	adds	r3, #1
 80014ee:	1e5a      	subs	r2, r3, #1
 80014f0:	7016      	strb	r6, [r2, #0]
 80014f2:	422b      	tst	r3, r5
 80014f4:	d1f6      	bne.n	80014e4 <memset+0x14>
 80014f6:	2c03      	cmp	r4, #3
 80014f8:	d92b      	bls.n	8001552 <memset+0x82>
 80014fa:	25ff      	movs	r5, #255	; 0xff
 80014fc:	400d      	ands	r5, r1
 80014fe:	022a      	lsls	r2, r5, #8
 8001500:	4315      	orrs	r5, r2
 8001502:	042a      	lsls	r2, r5, #16
 8001504:	4315      	orrs	r5, r2
 8001506:	2c0f      	cmp	r4, #15
 8001508:	d915      	bls.n	8001536 <memset+0x66>
 800150a:	1c27      	adds	r7, r4, #0
 800150c:	3f10      	subs	r7, #16
 800150e:	093f      	lsrs	r7, r7, #4
 8001510:	1c1e      	adds	r6, r3, #0
 8001512:	013a      	lsls	r2, r7, #4
 8001514:	3610      	adds	r6, #16
 8001516:	18b6      	adds	r6, r6, r2
 8001518:	1c1a      	adds	r2, r3, #0
 800151a:	6015      	str	r5, [r2, #0]
 800151c:	6055      	str	r5, [r2, #4]
 800151e:	6095      	str	r5, [r2, #8]
 8001520:	60d5      	str	r5, [r2, #12]
 8001522:	3210      	adds	r2, #16
 8001524:	42b2      	cmp	r2, r6
 8001526:	d1f8      	bne.n	800151a <memset+0x4a>
 8001528:	3701      	adds	r7, #1
 800152a:	013f      	lsls	r7, r7, #4
 800152c:	220f      	movs	r2, #15
 800152e:	19db      	adds	r3, r3, r7
 8001530:	4014      	ands	r4, r2
 8001532:	2c03      	cmp	r4, #3
 8001534:	d90d      	bls.n	8001552 <memset+0x82>
 8001536:	1f27      	subs	r7, r4, #4
 8001538:	08bf      	lsrs	r7, r7, #2
 800153a:	00ba      	lsls	r2, r7, #2
 800153c:	1d1e      	adds	r6, r3, #4
 800153e:	18b6      	adds	r6, r6, r2
 8001540:	1c1a      	adds	r2, r3, #0
 8001542:	c220      	stmia	r2!, {r5}
 8001544:	42b2      	cmp	r2, r6
 8001546:	d1fc      	bne.n	8001542 <memset+0x72>
 8001548:	3701      	adds	r7, #1
 800154a:	00bf      	lsls	r7, r7, #2
 800154c:	2203      	movs	r2, #3
 800154e:	19db      	adds	r3, r3, r7
 8001550:	4014      	ands	r4, r2
 8001552:	2c00      	cmp	r4, #0
 8001554:	d005      	beq.n	8001562 <memset+0x92>
 8001556:	191c      	adds	r4, r3, r4
 8001558:	b2c9      	uxtb	r1, r1
 800155a:	7019      	strb	r1, [r3, #0]
 800155c:	3301      	adds	r3, #1
 800155e:	42a3      	cmp	r3, r4
 8001560:	d1fb      	bne.n	800155a <memset+0x8a>
 8001562:	bdf0      	pop	{r4, r5, r6, r7, pc}
 8001564:	1c14      	adds	r4, r2, #0
 8001566:	1c03      	adds	r3, r0, #0
 8001568:	e7c5      	b.n	80014f6 <memset+0x26>
 800156a:	46c0      	nop			; (mov r8, r8)

0800156c <_init>:
 800156c:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
 800156e:	46c0      	nop			; (mov r8, r8)
 8001570:	bcf8      	pop	{r3, r4, r5, r6, r7}
 8001572:	bc08      	pop	{r3}
 8001574:	469e      	mov	lr, r3
 8001576:	4770      	bx	lr

08001578 <_fini>:
 8001578:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
 800157a:	46c0      	nop			; (mov r8, r8)
 800157c:	bcf8      	pop	{r3, r4, r5, r6, r7}
 800157e:	bc08      	pop	{r3}
 8001580:	469e      	mov	lr, r3
 8001582:	4770      	bx	lr
 8001584:	69647473 	.word	0x69647473
 8001588:	6e69206f 	.word	0x6e69206f
 800158c:	64207469 	.word	0x64207469
 8001590:	0a656e6f 	.word	0x0a656e6f
 8001594:	00          	.byte	0x00
 8001595:	62          	.byte	0x62
 8001596:	6f6f      	.short	0x6f6f
 8001598:	676e6974 	.word	0x676e6974
 800159c:	6f726620 	.word	0x6f726620
 80015a0:	7525206d 	.word	0x7525206d
 80015a4:	6172000a 	.word	0x6172000a
 80015a8:	7473206d 	.word	0x7473206d
 80015ac:	20747261 	.word	0x20747261
 80015b0:	0a207525 	.word	0x0a207525
 80015b4:	6d617200 	.word	0x6d617200
 80015b8:	7a697320 	.word	0x7a697320
 80015bc:	75252065 	.word	0x75252065
 80015c0:	72000a20 	.word	0x72000a20
 80015c4:	66206d61 	.word	0x66206d61
 80015c8:	20656572 	.word	0x20656572
 80015cc:	0a207525 	.word	0x0a207525
 80015d0:	61656800 	.word	0x61656800
 80015d4:	74732070 	.word	0x74732070
 80015d8:	20747261 	.word	0x20747261
 80015dc:	0a207525 	.word	0x0a207525
 80015e0:	000a0a00 	.word	0x000a0a00

080015e4 <PLLMulTable>:
 80015e4:	08060403 2018100c 00000030                       ....... 0

080015ed <APBAHBPrescTable>:
 80015ed:	00000000 04030201 04030201 09080706     ................
 80015fd:	00000000                                         ...

08001600 <__EH_FRAME_BEGIN__>:
 8001600:	00000000                                ....
