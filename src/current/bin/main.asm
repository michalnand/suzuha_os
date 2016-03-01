
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
 80000d8:	20000068 	.word	0x20000068
 80000dc:	20000008 	.word	0x20000008

080000e0 <null_thread>:
 80000e0:	b508      	push	{r3, lr}
 80000e2:	f000 fb0d 	bl	8000700 <sleep>
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
 8000148:	20000008 	.word	0x20000008
 800014c:	20000068 	.word	0x20000068

08000150 <SysTick_Handler>:
 8000150:	b4f0      	push	{r4, r5, r6, r7}
 8000152:	4644      	mov	r4, r8
 8000154:	464d      	mov	r5, r9
 8000156:	4656      	mov	r6, sl
 8000158:	465f      	mov	r7, fp
 800015a:	b4f0      	push	{r4, r5, r6, r7}
 800015c:	f000 facc 	bl	80006f8 <__get_MSP>
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
 80001a0:	20000068 	.word	0x20000068
 80001a4:	20000008 	.word	0x20000008

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
 80001c8:	20000068 	.word	0x20000068

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
 8000244:	20000008 	.word	0x20000008
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
 8000280:	20000008 	.word	0x20000008
 8000284:	20000068 	.word	0x20000068
 8000288:	2000006c 	.word	0x2000006c
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
 80002d0:	20000008 	.word	0x20000008

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
 80002f4:	20000008 	.word	0x20000008

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
 8000324:	200000ec 	.word	0x200000ec
 8000328:	2000010c 	.word	0x2000010c

0800032c <putc_>:
 800032c:	b538      	push	{r3, r4, r5, lr}
 800032e:	4c06      	ldr	r4, [pc, #24]	; (8000348 <putc_+0x1c>)
 8000330:	1c05      	adds	r5, r0, #0
 8000332:	1c20      	adds	r0, r4, #0
 8000334:	f000 f8ff 	bl	8000536 <mutex_lock>
 8000338:	1c28      	adds	r0, r5, #0
 800033a:	f000 f993 	bl	8000664 <uart_write>
 800033e:	1c20      	adds	r0, r4, #0
 8000340:	f000 f915 	bl	800056e <mutex_unlock>
 8000344:	bd38      	pop	{r3, r4, r5, pc}
 8000346:	46c0      	nop			; (mov r8, r8)
 8000348:	2000014c 	.word	0x2000014c

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
 8000370:	20000158 	.word	0x20000158

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
 8000390:	f000 ff40 	bl	8001214 <__aeabi_idivmod>
 8000394:	3130      	adds	r1, #48	; 0x30
 8000396:	5571      	strb	r1, [r6, r5]
 8000398:	1c20      	adds	r0, r4, #0
 800039a:	210a      	movs	r1, #10
 800039c:	f000 fee4 	bl	8001168 <__aeabi_idiv>
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
 80003ce:	f000 fec1 	bl	8001154 <__aeabi_uidivmod>
 80003d2:	3130      	adds	r1, #48	; 0x30
 80003d4:	5531      	strb	r1, [r6, r4]
 80003d6:	1c28      	adds	r0, r5, #0
 80003d8:	210a      	movs	r1, #10
 80003da:	f000 fe77 	bl	80010cc <__aeabi_uidiv>
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
 80004bc:	20000154 	.word	0x20000154

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
 8000500:	2000014c 	.word	0x2000014c
 8000504:	20000150 	.word	0x20000150
 8000508:	20000158 	.word	0x20000158
 800050c:	20000154 	.word	0x20000154
 8000510:	080012e0 	.word	0x080012e0

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
 80005bc:	080012c8 	.word	0x080012c8
 80005c0:	080012f1 	.word	0x080012f1
 80005c4:	20000000 	.word	0x20000000
 80005c8:	08001302 	.word	0x08001302
 80005cc:	20002000 	.word	0x20002000
 80005d0:	08001311 	.word	0x08001311
 80005d4:	20000178 	.word	0x20000178
 80005d8:	0800131f 	.word	0x0800131f
 80005dc:	20000178 	.word	0x20000178
 80005e0:	0800132d 	.word	0x0800132d
 80005e4:	0800133d 	.word	0x0800133d

080005e8 <main>:
 80005e8:	b508      	push	{r3, lr}
 80005ea:	f000 fd09 	bl	8001000 <lib_low_level_init>
 80005ee:	f7ff ff91 	bl	8000514 <lib_os_init>
 80005f2:	f7ff ffc5 	bl	8000580 <mem_info_print>
 80005f6:	2008      	movs	r0, #8
 80005f8:	f000 fd26 	bl	8001048 <led_on>
 80005fc:	e7fb      	b.n	80005f6 <main+0xe>
	...

08000600 <RTC_IRQHandler>:
 8000600:	2200      	movs	r2, #0
 8000602:	4911      	ldr	r1, [pc, #68]	; (8000648 <RTC_IRQHandler+0x48>)
 8000604:	0053      	lsls	r3, r2, #1
 8000606:	5a58      	ldrh	r0, [r3, r1]
 8000608:	2800      	cmp	r0, #0
 800060a:	d003      	beq.n	8000614 <RTC_IRQHandler+0x14>
 800060c:	5a58      	ldrh	r0, [r3, r1]
 800060e:	3801      	subs	r0, #1
 8000610:	b280      	uxth	r0, r0
 8000612:	e005      	b.n	8000620 <RTC_IRQHandler+0x20>
 8000614:	480d      	ldr	r0, [pc, #52]	; (800064c <RTC_IRQHandler+0x4c>)
 8000616:	5a18      	ldrh	r0, [r3, r0]
 8000618:	b280      	uxth	r0, r0
 800061a:	5258      	strh	r0, [r3, r1]
 800061c:	490c      	ldr	r1, [pc, #48]	; (8000650 <RTC_IRQHandler+0x50>)
 800061e:	2001      	movs	r0, #1
 8000620:	3201      	adds	r2, #1
 8000622:	5258      	strh	r0, [r3, r1]
 8000624:	2a04      	cmp	r2, #4
 8000626:	d1ec      	bne.n	8000602 <RTC_IRQHandler+0x2>
 8000628:	4b0a      	ldr	r3, [pc, #40]	; (8000654 <RTC_IRQHandler+0x54>)
 800062a:	681a      	ldr	r2, [r3, #0]
 800062c:	320a      	adds	r2, #10
 800062e:	601a      	str	r2, [r3, #0]
 8000630:	4b09      	ldr	r3, [pc, #36]	; (8000658 <RTC_IRQHandler+0x58>)
 8000632:	4a0a      	ldr	r2, [pc, #40]	; (800065c <RTC_IRQHandler+0x5c>)
 8000634:	68d9      	ldr	r1, [r3, #12]
 8000636:	400a      	ands	r2, r1
 8000638:	60da      	str	r2, [r3, #12]
 800063a:	4b09      	ldr	r3, [pc, #36]	; (8000660 <RTC_IRQHandler+0x60>)
 800063c:	2280      	movs	r2, #128	; 0x80
 800063e:	6959      	ldr	r1, [r3, #20]
 8000640:	0352      	lsls	r2, r2, #13
 8000642:	430a      	orrs	r2, r1
 8000644:	615a      	str	r2, [r3, #20]
 8000646:	4770      	bx	lr
 8000648:	20000170 	.word	0x20000170
 800064c:	20000164 	.word	0x20000164
 8000650:	2000015c 	.word	0x2000015c
 8000654:	2000016c 	.word	0x2000016c
 8000658:	40002800 	.word	0x40002800
 800065c:	fffffbff 	.word	0xfffffbff
 8000660:	40010400 	.word	0x40010400

08000664 <uart_write>:
 8000664:	4b03      	ldr	r3, [pc, #12]	; (8000674 <uart_write+0x10>)
 8000666:	6298      	str	r0, [r3, #40]	; 0x28
 8000668:	69da      	ldr	r2, [r3, #28]
 800066a:	0651      	lsls	r1, r2, #25
 800066c:	d401      	bmi.n	8000672 <uart_write+0xe>
 800066e:	46c0      	nop			; (mov r8, r8)
 8000670:	e7fa      	b.n	8000668 <uart_write+0x4>
 8000672:	4770      	bx	lr
 8000674:	40004400 	.word	0x40004400

08000678 <uart_init>:
 8000678:	4b1d      	ldr	r3, [pc, #116]	; (80006f0 <uart_init+0x78>)
 800067a:	b510      	push	{r4, lr}
 800067c:	6ad9      	ldr	r1, [r3, #44]	; 0x2c
 800067e:	2201      	movs	r2, #1
 8000680:	4311      	orrs	r1, r2
 8000682:	62d9      	str	r1, [r3, #44]	; 0x2c
 8000684:	6ad9      	ldr	r1, [r3, #44]	; 0x2c
 8000686:	b088      	sub	sp, #32
 8000688:	4011      	ands	r1, r2
 800068a:	9101      	str	r1, [sp, #4]
 800068c:	9901      	ldr	r1, [sp, #4]
 800068e:	6ad9      	ldr	r1, [r3, #44]	; 0x2c
 8000690:	2404      	movs	r4, #4
 8000692:	4311      	orrs	r1, r2
 8000694:	62d9      	str	r1, [r3, #44]	; 0x2c
 8000696:	6ad9      	ldr	r1, [r3, #44]	; 0x2c
 8000698:	4011      	ands	r1, r2
 800069a:	9102      	str	r1, [sp, #8]
 800069c:	9902      	ldr	r1, [sp, #8]
 800069e:	6b98      	ldr	r0, [r3, #56]	; 0x38
 80006a0:	2180      	movs	r1, #128	; 0x80
 80006a2:	0289      	lsls	r1, r1, #10
 80006a4:	4301      	orrs	r1, r0
 80006a6:	6399      	str	r1, [r3, #56]	; 0x38
 80006a8:	20a0      	movs	r0, #160	; 0xa0
 80006aa:	2302      	movs	r3, #2
 80006ac:	9304      	str	r3, [sp, #16]
 80006ae:	05c0      	lsls	r0, r0, #23
 80006b0:	2303      	movs	r3, #3
 80006b2:	a903      	add	r1, sp, #12
 80006b4:	9205      	str	r2, [sp, #20]
 80006b6:	9306      	str	r3, [sp, #24]
 80006b8:	9403      	str	r4, [sp, #12]
 80006ba:	9407      	str	r4, [sp, #28]
 80006bc:	f000 fbb2 	bl	8000e24 <HAL_GPIO_Init>
 80006c0:	20a0      	movs	r0, #160	; 0xa0
 80006c2:	2308      	movs	r3, #8
 80006c4:	05c0      	lsls	r0, r0, #23
 80006c6:	a903      	add	r1, sp, #12
 80006c8:	9303      	str	r3, [sp, #12]
 80006ca:	9407      	str	r4, [sp, #28]
 80006cc:	f000 fbaa 	bl	8000e24 <HAL_GPIO_Init>
 80006d0:	4b08      	ldr	r3, [pc, #32]	; (80006f4 <uart_init+0x7c>)
 80006d2:	22d0      	movs	r2, #208	; 0xd0
 80006d4:	60da      	str	r2, [r3, #12]
 80006d6:	220d      	movs	r2, #13
 80006d8:	601a      	str	r2, [r3, #0]
 80006da:	69d8      	ldr	r0, [r3, #28]
 80006dc:	2140      	movs	r1, #64	; 0x40
 80006de:	4a05      	ldr	r2, [pc, #20]	; (80006f4 <uart_init+0x7c>)
 80006e0:	4208      	tst	r0, r1
 80006e2:	d0fa      	beq.n	80006da <uart_init+0x62>
 80006e4:	6a13      	ldr	r3, [r2, #32]
 80006e6:	4319      	orrs	r1, r3
 80006e8:	6211      	str	r1, [r2, #32]
 80006ea:	b008      	add	sp, #32
 80006ec:	bd10      	pop	{r4, pc}
 80006ee:	46c0      	nop			; (mov r8, r8)
 80006f0:	40021000 	.word	0x40021000
 80006f4:	40004400 	.word	0x40004400

080006f8 <__get_MSP>:
 80006f8:	f3ef 8008 	mrs	r0, MSP
 80006fc:	1c00      	adds	r0, r0, #0
 80006fe:	4770      	bx	lr

08000700 <sleep>:
 8000700:	4b08      	ldr	r3, [pc, #32]	; (8000724 <sleep+0x24>)
 8000702:	2104      	movs	r1, #4
 8000704:	691a      	ldr	r2, [r3, #16]
 8000706:	430a      	orrs	r2, r1
 8000708:	611a      	str	r2, [r3, #16]
 800070a:	4b07      	ldr	r3, [pc, #28]	; (8000728 <sleep+0x28>)
 800070c:	2203      	movs	r2, #3
 800070e:	6819      	ldr	r1, [r3, #0]
 8000710:	4391      	bics	r1, r2
 8000712:	2201      	movs	r2, #1
 8000714:	4311      	orrs	r1, r2
 8000716:	6019      	str	r1, [r3, #0]
 8000718:	6859      	ldr	r1, [r3, #4]
 800071a:	4391      	bics	r1, r2
 800071c:	6059      	str	r1, [r3, #4]
 800071e:	bf30      	wfi
 8000720:	4770      	bx	lr
 8000722:	46c0      	nop			; (mov r8, r8)
 8000724:	e000ed00 	.word	0xe000ed00
 8000728:	40007000 	.word	0x40007000

0800072c <HAL_NVIC_SetPriority>:
 800072c:	b570      	push	{r4, r5, r6, lr}
 800072e:	0189      	lsls	r1, r1, #6
 8000730:	2800      	cmp	r0, #0
 8000732:	da15      	bge.n	8000760 <HAL_NVIC_SetPriority+0x34>
 8000734:	b2c0      	uxtb	r0, r0
 8000736:	230f      	movs	r3, #15
 8000738:	4003      	ands	r3, r0
 800073a:	3b08      	subs	r3, #8
 800073c:	4a12      	ldr	r2, [pc, #72]	; (8000788 <HAL_NVIC_SetPriority+0x5c>)
 800073e:	089b      	lsrs	r3, r3, #2
 8000740:	009b      	lsls	r3, r3, #2
 8000742:	189b      	adds	r3, r3, r2
 8000744:	2203      	movs	r2, #3
 8000746:	4010      	ands	r0, r2
 8000748:	24ff      	movs	r4, #255	; 0xff
 800074a:	00c2      	lsls	r2, r0, #3
 800074c:	69dd      	ldr	r5, [r3, #28]
 800074e:	1c20      	adds	r0, r4, #0
 8000750:	4090      	lsls	r0, r2
 8000752:	4385      	bics	r5, r0
 8000754:	400c      	ands	r4, r1
 8000756:	4094      	lsls	r4, r2
 8000758:	1c2a      	adds	r2, r5, #0
 800075a:	4322      	orrs	r2, r4
 800075c:	61da      	str	r2, [r3, #28]
 800075e:	e012      	b.n	8000786 <HAL_NVIC_SetPriority+0x5a>
 8000760:	0882      	lsrs	r2, r0, #2
 8000762:	4b0a      	ldr	r3, [pc, #40]	; (800078c <HAL_NVIC_SetPriority+0x60>)
 8000764:	2403      	movs	r4, #3
 8000766:	0092      	lsls	r2, r2, #2
 8000768:	18d2      	adds	r2, r2, r3
 800076a:	4020      	ands	r0, r4
 800076c:	23c0      	movs	r3, #192	; 0xc0
 800076e:	40a0      	lsls	r0, r4
 8000770:	009b      	lsls	r3, r3, #2
 8000772:	24ff      	movs	r4, #255	; 0xff
 8000774:	58d5      	ldr	r5, [r2, r3]
 8000776:	1c26      	adds	r6, r4, #0
 8000778:	4086      	lsls	r6, r0
 800077a:	43b5      	bics	r5, r6
 800077c:	400c      	ands	r4, r1
 800077e:	4084      	lsls	r4, r0
 8000780:	1c28      	adds	r0, r5, #0
 8000782:	4320      	orrs	r0, r4
 8000784:	50d0      	str	r0, [r2, r3]
 8000786:	bd70      	pop	{r4, r5, r6, pc}
 8000788:	e000ed00 	.word	0xe000ed00
 800078c:	e000e100 	.word	0xe000e100

08000790 <HAL_SYSTICK_Config>:
 8000790:	4b09      	ldr	r3, [pc, #36]	; (80007b8 <HAL_SYSTICK_Config+0x28>)
 8000792:	1e42      	subs	r2, r0, #1
 8000794:	2001      	movs	r0, #1
 8000796:	429a      	cmp	r2, r3
 8000798:	d80d      	bhi.n	80007b6 <HAL_SYSTICK_Config+0x26>
 800079a:	4b08      	ldr	r3, [pc, #32]	; (80007bc <HAL_SYSTICK_Config+0x2c>)
 800079c:	21c0      	movs	r1, #192	; 0xc0
 800079e:	605a      	str	r2, [r3, #4]
 80007a0:	4a07      	ldr	r2, [pc, #28]	; (80007c0 <HAL_SYSTICK_Config+0x30>)
 80007a2:	0609      	lsls	r1, r1, #24
 80007a4:	6a10      	ldr	r0, [r2, #32]
 80007a6:	0200      	lsls	r0, r0, #8
 80007a8:	0a00      	lsrs	r0, r0, #8
 80007aa:	4301      	orrs	r1, r0
 80007ac:	6211      	str	r1, [r2, #32]
 80007ae:	2000      	movs	r0, #0
 80007b0:	2207      	movs	r2, #7
 80007b2:	6098      	str	r0, [r3, #8]
 80007b4:	601a      	str	r2, [r3, #0]
 80007b6:	4770      	bx	lr
 80007b8:	00ffffff 	.word	0x00ffffff
 80007bc:	e000e010 	.word	0xe000e010
 80007c0:	e000ed00 	.word	0xe000ed00

080007c4 <HAL_InitTick>:
 80007c4:	b510      	push	{r4, lr}
 80007c6:	1c04      	adds	r4, r0, #0
 80007c8:	f000 fb18 	bl	8000dfc <HAL_RCC_GetHCLKFreq>
 80007cc:	21fa      	movs	r1, #250	; 0xfa
 80007ce:	0089      	lsls	r1, r1, #2
 80007d0:	f000 fc7c 	bl	80010cc <__aeabi_uidiv>
 80007d4:	f7ff ffdc 	bl	8000790 <HAL_SYSTICK_Config>
 80007d8:	2001      	movs	r0, #1
 80007da:	4240      	negs	r0, r0
 80007dc:	1c21      	adds	r1, r4, #0
 80007de:	2200      	movs	r2, #0
 80007e0:	f7ff ffa4 	bl	800072c <HAL_NVIC_SetPriority>
 80007e4:	2000      	movs	r0, #0
 80007e6:	bd10      	pop	{r4, pc}

080007e8 <HAL_Init>:
 80007e8:	b508      	push	{r3, lr}
 80007ea:	4b06      	ldr	r3, [pc, #24]	; (8000804 <HAL_Init+0x1c>)
 80007ec:	2102      	movs	r1, #2
 80007ee:	681a      	ldr	r2, [r3, #0]
 80007f0:	2003      	movs	r0, #3
 80007f2:	438a      	bics	r2, r1
 80007f4:	601a      	str	r2, [r3, #0]
 80007f6:	f7ff ffe5 	bl	80007c4 <HAL_InitTick>
 80007fa:	f000 f80b 	bl	8000814 <HAL_MspInit>
 80007fe:	2000      	movs	r0, #0
 8000800:	bd08      	pop	{r3, pc}
 8000802:	46c0      	nop			; (mov r8, r8)
 8000804:	40022000 	.word	0x40022000

08000808 <HAL_GetTick>:
 8000808:	4b01      	ldr	r3, [pc, #4]	; (8000810 <HAL_GetTick+0x8>)
 800080a:	6818      	ldr	r0, [r3, #0]
 800080c:	4770      	bx	lr
 800080e:	46c0      	nop			; (mov r8, r8)
 8000810:	20000004 	.word	0x20000004

08000814 <HAL_MspInit>:
 8000814:	4770      	bx	lr
	...

08000818 <HAL_RCC_OscConfig>:
 8000818:	b5f0      	push	{r4, r5, r6, r7, lr}
 800081a:	1c04      	adds	r4, r0, #0
 800081c:	6800      	ldr	r0, [r0, #0]
 800081e:	b085      	sub	sp, #20
 8000820:	07c0      	lsls	r0, r0, #31
 8000822:	d403      	bmi.n	800082c <HAL_RCC_OscConfig+0x14>
 8000824:	6821      	ldr	r1, [r4, #0]
 8000826:	0789      	lsls	r1, r1, #30
 8000828:	d457      	bmi.n	80008da <HAL_RCC_OscConfig+0xc2>
 800082a:	e09d      	b.n	8000968 <HAL_RCC_OscConfig+0x150>
 800082c:	4dbc      	ldr	r5, [pc, #752]	; (8000b20 <HAL_RCC_OscConfig+0x308>)
 800082e:	230c      	movs	r3, #12
 8000830:	68ea      	ldr	r2, [r5, #12]
 8000832:	401a      	ands	r2, r3
 8000834:	2a08      	cmp	r2, #8
 8000836:	d008      	beq.n	800084a <HAL_RCC_OscConfig+0x32>
 8000838:	68ea      	ldr	r2, [r5, #12]
 800083a:	4013      	ands	r3, r2
 800083c:	2280      	movs	r2, #128	; 0x80
 800083e:	0252      	lsls	r2, r2, #9
 8000840:	2b0c      	cmp	r3, #12
 8000842:	d10a      	bne.n	800085a <HAL_RCC_OscConfig+0x42>
 8000844:	68eb      	ldr	r3, [r5, #12]
 8000846:	4213      	tst	r3, r2
 8000848:	d007      	beq.n	800085a <HAL_RCC_OscConfig+0x42>
 800084a:	682b      	ldr	r3, [r5, #0]
 800084c:	039a      	lsls	r2, r3, #14
 800084e:	d5e9      	bpl.n	8000824 <HAL_RCC_OscConfig+0xc>
 8000850:	6863      	ldr	r3, [r4, #4]
 8000852:	2b00      	cmp	r3, #0
 8000854:	d1e6      	bne.n	8000824 <HAL_RCC_OscConfig+0xc>
 8000856:	2001      	movs	r0, #1
 8000858:	e1d5      	b.n	8000c06 <HAL_RCC_OscConfig+0x3ee>
 800085a:	6863      	ldr	r3, [r4, #4]
 800085c:	2180      	movs	r1, #128	; 0x80
 800085e:	0249      	lsls	r1, r1, #9
 8000860:	4293      	cmp	r3, r2
 8000862:	d103      	bne.n	800086c <HAL_RCC_OscConfig+0x54>
 8000864:	682b      	ldr	r3, [r5, #0]
 8000866:	431a      	orrs	r2, r3
 8000868:	602a      	str	r2, [r5, #0]
 800086a:	e01d      	b.n	80008a8 <HAL_RCC_OscConfig+0x90>
 800086c:	20a0      	movs	r0, #160	; 0xa0
 800086e:	4aad      	ldr	r2, [pc, #692]	; (8000b24 <HAL_RCC_OscConfig+0x30c>)
 8000870:	02c0      	lsls	r0, r0, #11
 8000872:	4283      	cmp	r3, r0
 8000874:	d10b      	bne.n	800088e <HAL_RCC_OscConfig+0x76>
 8000876:	682b      	ldr	r3, [r5, #0]
 8000878:	401a      	ands	r2, r3
 800087a:	602a      	str	r2, [r5, #0]
 800087c:	682a      	ldr	r2, [r5, #0]
 800087e:	2380      	movs	r3, #128	; 0x80
 8000880:	02db      	lsls	r3, r3, #11
 8000882:	4313      	orrs	r3, r2
 8000884:	602b      	str	r3, [r5, #0]
 8000886:	682b      	ldr	r3, [r5, #0]
 8000888:	4319      	orrs	r1, r3
 800088a:	6029      	str	r1, [r5, #0]
 800088c:	e00c      	b.n	80008a8 <HAL_RCC_OscConfig+0x90>
 800088e:	6828      	ldr	r0, [r5, #0]
 8000890:	4002      	ands	r2, r0
 8000892:	602a      	str	r2, [r5, #0]
 8000894:	682a      	ldr	r2, [r5, #0]
 8000896:	4011      	ands	r1, r2
 8000898:	9103      	str	r1, [sp, #12]
 800089a:	9a03      	ldr	r2, [sp, #12]
 800089c:	6829      	ldr	r1, [r5, #0]
 800089e:	4aa2      	ldr	r2, [pc, #648]	; (8000b28 <HAL_RCC_OscConfig+0x310>)
 80008a0:	400a      	ands	r2, r1
 80008a2:	602a      	str	r2, [r5, #0]
 80008a4:	2b00      	cmp	r3, #0
 80008a6:	d00c      	beq.n	80008c2 <HAL_RCC_OscConfig+0xaa>
 80008a8:	f7ff ffae 	bl	8000808 <HAL_GetTick>
 80008ac:	1c06      	adds	r6, r0, #0
 80008ae:	682b      	ldr	r3, [r5, #0]
 80008b0:	0398      	lsls	r0, r3, #14
 80008b2:	d4b7      	bmi.n	8000824 <HAL_RCC_OscConfig+0xc>
 80008b4:	f7ff ffa8 	bl	8000808 <HAL_GetTick>
 80008b8:	1b80      	subs	r0, r0, r6
 80008ba:	2864      	cmp	r0, #100	; 0x64
 80008bc:	d9f7      	bls.n	80008ae <HAL_RCC_OscConfig+0x96>
 80008be:	2003      	movs	r0, #3
 80008c0:	e1a1      	b.n	8000c06 <HAL_RCC_OscConfig+0x3ee>
 80008c2:	f7ff ffa1 	bl	8000808 <HAL_GetTick>
 80008c6:	1c06      	adds	r6, r0, #0
 80008c8:	682b      	ldr	r3, [r5, #0]
 80008ca:	0399      	lsls	r1, r3, #14
 80008cc:	d5aa      	bpl.n	8000824 <HAL_RCC_OscConfig+0xc>
 80008ce:	f7ff ff9b 	bl	8000808 <HAL_GetTick>
 80008d2:	1b80      	subs	r0, r0, r6
 80008d4:	2864      	cmp	r0, #100	; 0x64
 80008d6:	d9f7      	bls.n	80008c8 <HAL_RCC_OscConfig+0xb0>
 80008d8:	e7f1      	b.n	80008be <HAL_RCC_OscConfig+0xa6>
 80008da:	4d91      	ldr	r5, [pc, #580]	; (8000b20 <HAL_RCC_OscConfig+0x308>)
 80008dc:	230c      	movs	r3, #12
 80008de:	68ea      	ldr	r2, [r5, #12]
 80008e0:	401a      	ands	r2, r3
 80008e2:	2a04      	cmp	r2, #4
 80008e4:	d006      	beq.n	80008f4 <HAL_RCC_OscConfig+0xdc>
 80008e6:	68ea      	ldr	r2, [r5, #12]
 80008e8:	4013      	ands	r3, r2
 80008ea:	2b0c      	cmp	r3, #12
 80008ec:	d110      	bne.n	8000910 <HAL_RCC_OscConfig+0xf8>
 80008ee:	68eb      	ldr	r3, [r5, #12]
 80008f0:	03da      	lsls	r2, r3, #15
 80008f2:	d40d      	bmi.n	8000910 <HAL_RCC_OscConfig+0xf8>
 80008f4:	682b      	ldr	r3, [r5, #0]
 80008f6:	0758      	lsls	r0, r3, #29
 80008f8:	d502      	bpl.n	8000900 <HAL_RCC_OscConfig+0xe8>
 80008fa:	68e1      	ldr	r1, [r4, #12]
 80008fc:	2901      	cmp	r1, #1
 80008fe:	d1aa      	bne.n	8000856 <HAL_RCC_OscConfig+0x3e>
 8000900:	6923      	ldr	r3, [r4, #16]
 8000902:	6869      	ldr	r1, [r5, #4]
 8000904:	021a      	lsls	r2, r3, #8
 8000906:	4b89      	ldr	r3, [pc, #548]	; (8000b2c <HAL_RCC_OscConfig+0x314>)
 8000908:	400b      	ands	r3, r1
 800090a:	4313      	orrs	r3, r2
 800090c:	606b      	str	r3, [r5, #4]
 800090e:	e02b      	b.n	8000968 <HAL_RCC_OscConfig+0x150>
 8000910:	68e2      	ldr	r2, [r4, #12]
 8000912:	2309      	movs	r3, #9
 8000914:	2a00      	cmp	r2, #0
 8000916:	d018      	beq.n	800094a <HAL_RCC_OscConfig+0x132>
 8000918:	6829      	ldr	r1, [r5, #0]
 800091a:	4399      	bics	r1, r3
 800091c:	430a      	orrs	r2, r1
 800091e:	602a      	str	r2, [r5, #0]
 8000920:	f7ff ff72 	bl	8000808 <HAL_GetTick>
 8000924:	1c06      	adds	r6, r0, #0
 8000926:	682a      	ldr	r2, [r5, #0]
 8000928:	4b7d      	ldr	r3, [pc, #500]	; (8000b20 <HAL_RCC_OscConfig+0x308>)
 800092a:	0750      	lsls	r0, r2, #29
 800092c:	d405      	bmi.n	800093a <HAL_RCC_OscConfig+0x122>
 800092e:	f7ff ff6b 	bl	8000808 <HAL_GetTick>
 8000932:	1b80      	subs	r0, r0, r6
 8000934:	2802      	cmp	r0, #2
 8000936:	d9f6      	bls.n	8000926 <HAL_RCC_OscConfig+0x10e>
 8000938:	e7c1      	b.n	80008be <HAL_RCC_OscConfig+0xa6>
 800093a:	6922      	ldr	r2, [r4, #16]
 800093c:	6858      	ldr	r0, [r3, #4]
 800093e:	0211      	lsls	r1, r2, #8
 8000940:	4a7a      	ldr	r2, [pc, #488]	; (8000b2c <HAL_RCC_OscConfig+0x314>)
 8000942:	4002      	ands	r2, r0
 8000944:	430a      	orrs	r2, r1
 8000946:	605a      	str	r2, [r3, #4]
 8000948:	e00e      	b.n	8000968 <HAL_RCC_OscConfig+0x150>
 800094a:	682a      	ldr	r2, [r5, #0]
 800094c:	439a      	bics	r2, r3
 800094e:	602a      	str	r2, [r5, #0]
 8000950:	f7ff ff5a 	bl	8000808 <HAL_GetTick>
 8000954:	1c06      	adds	r6, r0, #0
 8000956:	682b      	ldr	r3, [r5, #0]
 8000958:	0758      	lsls	r0, r3, #29
 800095a:	d505      	bpl.n	8000968 <HAL_RCC_OscConfig+0x150>
 800095c:	f7ff ff54 	bl	8000808 <HAL_GetTick>
 8000960:	1b80      	subs	r0, r0, r6
 8000962:	2802      	cmp	r0, #2
 8000964:	d9f7      	bls.n	8000956 <HAL_RCC_OscConfig+0x13e>
 8000966:	e7aa      	b.n	80008be <HAL_RCC_OscConfig+0xa6>
 8000968:	6821      	ldr	r1, [r4, #0]
 800096a:	06c9      	lsls	r1, r1, #27
 800096c:	d54f      	bpl.n	8000a0e <HAL_RCC_OscConfig+0x1f6>
 800096e:	4d6c      	ldr	r5, [pc, #432]	; (8000b20 <HAL_RCC_OscConfig+0x308>)
 8000970:	230c      	movs	r3, #12
 8000972:	68ea      	ldr	r2, [r5, #12]
 8000974:	421a      	tst	r2, r3
 8000976:	d117      	bne.n	80009a8 <HAL_RCC_OscConfig+0x190>
 8000978:	682b      	ldr	r3, [r5, #0]
 800097a:	059a      	lsls	r2, r3, #22
 800097c:	d503      	bpl.n	8000986 <HAL_RCC_OscConfig+0x16e>
 800097e:	69a3      	ldr	r3, [r4, #24]
 8000980:	2b00      	cmp	r3, #0
 8000982:	d100      	bne.n	8000986 <HAL_RCC_OscConfig+0x16e>
 8000984:	e767      	b.n	8000856 <HAL_RCC_OscConfig+0x3e>
 8000986:	686a      	ldr	r2, [r5, #4]
 8000988:	4b69      	ldr	r3, [pc, #420]	; (8000b30 <HAL_RCC_OscConfig+0x318>)
 800098a:	6a20      	ldr	r0, [r4, #32]
 800098c:	4013      	ands	r3, r2
 800098e:	4303      	orrs	r3, r0
 8000990:	606b      	str	r3, [r5, #4]
 8000992:	686b      	ldr	r3, [r5, #4]
 8000994:	69e1      	ldr	r1, [r4, #28]
 8000996:	021b      	lsls	r3, r3, #8
 8000998:	060a      	lsls	r2, r1, #24
 800099a:	0a1b      	lsrs	r3, r3, #8
 800099c:	4313      	orrs	r3, r2
 800099e:	606b      	str	r3, [r5, #4]
 80009a0:	2003      	movs	r0, #3
 80009a2:	f7ff ff0f 	bl	80007c4 <HAL_InitTick>
 80009a6:	e032      	b.n	8000a0e <HAL_RCC_OscConfig+0x1f6>
 80009a8:	69a2      	ldr	r2, [r4, #24]
 80009aa:	2a00      	cmp	r2, #0
 80009ac:	d01f      	beq.n	80009ee <HAL_RCC_OscConfig+0x1d6>
 80009ae:	682a      	ldr	r2, [r5, #0]
 80009b0:	2380      	movs	r3, #128	; 0x80
 80009b2:	005b      	lsls	r3, r3, #1
 80009b4:	4313      	orrs	r3, r2
 80009b6:	602b      	str	r3, [r5, #0]
 80009b8:	f7ff ff26 	bl	8000808 <HAL_GetTick>
 80009bc:	1c06      	adds	r6, r0, #0
 80009be:	682a      	ldr	r2, [r5, #0]
 80009c0:	4b57      	ldr	r3, [pc, #348]	; (8000b20 <HAL_RCC_OscConfig+0x308>)
 80009c2:	0590      	lsls	r0, r2, #22
 80009c4:	d405      	bmi.n	80009d2 <HAL_RCC_OscConfig+0x1ba>
 80009c6:	f7ff ff1f 	bl	8000808 <HAL_GetTick>
 80009ca:	1b80      	subs	r0, r0, r6
 80009cc:	2802      	cmp	r0, #2
 80009ce:	d9f6      	bls.n	80009be <HAL_RCC_OscConfig+0x1a6>
 80009d0:	e775      	b.n	80008be <HAL_RCC_OscConfig+0xa6>
 80009d2:	6859      	ldr	r1, [r3, #4]
 80009d4:	4a56      	ldr	r2, [pc, #344]	; (8000b30 <HAL_RCC_OscConfig+0x318>)
 80009d6:	400a      	ands	r2, r1
 80009d8:	6a21      	ldr	r1, [r4, #32]
 80009da:	430a      	orrs	r2, r1
 80009dc:	605a      	str	r2, [r3, #4]
 80009de:	685a      	ldr	r2, [r3, #4]
 80009e0:	69e0      	ldr	r0, [r4, #28]
 80009e2:	0212      	lsls	r2, r2, #8
 80009e4:	0601      	lsls	r1, r0, #24
 80009e6:	0a12      	lsrs	r2, r2, #8
 80009e8:	430a      	orrs	r2, r1
 80009ea:	605a      	str	r2, [r3, #4]
 80009ec:	e00f      	b.n	8000a0e <HAL_RCC_OscConfig+0x1f6>
 80009ee:	682a      	ldr	r2, [r5, #0]
 80009f0:	4b50      	ldr	r3, [pc, #320]	; (8000b34 <HAL_RCC_OscConfig+0x31c>)
 80009f2:	4013      	ands	r3, r2
 80009f4:	602b      	str	r3, [r5, #0]
 80009f6:	f7ff ff07 	bl	8000808 <HAL_GetTick>
 80009fa:	1c06      	adds	r6, r0, #0
 80009fc:	682b      	ldr	r3, [r5, #0]
 80009fe:	0599      	lsls	r1, r3, #22
 8000a00:	d505      	bpl.n	8000a0e <HAL_RCC_OscConfig+0x1f6>
 8000a02:	f7ff ff01 	bl	8000808 <HAL_GetTick>
 8000a06:	1b80      	subs	r0, r0, r6
 8000a08:	2802      	cmp	r0, #2
 8000a0a:	d9f7      	bls.n	80009fc <HAL_RCC_OscConfig+0x1e4>
 8000a0c:	e757      	b.n	80008be <HAL_RCC_OscConfig+0xa6>
 8000a0e:	6822      	ldr	r2, [r4, #0]
 8000a10:	0712      	lsls	r2, r2, #28
 8000a12:	d403      	bmi.n	8000a1c <HAL_RCC_OscConfig+0x204>
 8000a14:	6823      	ldr	r3, [r4, #0]
 8000a16:	075b      	lsls	r3, r3, #29
 8000a18:	d422      	bmi.n	8000a60 <HAL_RCC_OscConfig+0x248>
 8000a1a:	e0ab      	b.n	8000b74 <HAL_RCC_OscConfig+0x35c>
 8000a1c:	4d40      	ldr	r5, [pc, #256]	; (8000b20 <HAL_RCC_OscConfig+0x308>)
 8000a1e:	6960      	ldr	r0, [r4, #20]
 8000a20:	2301      	movs	r3, #1
 8000a22:	6d2a      	ldr	r2, [r5, #80]	; 0x50
 8000a24:	2800      	cmp	r0, #0
 8000a26:	d00d      	beq.n	8000a44 <HAL_RCC_OscConfig+0x22c>
 8000a28:	4313      	orrs	r3, r2
 8000a2a:	652b      	str	r3, [r5, #80]	; 0x50
 8000a2c:	f7ff feec 	bl	8000808 <HAL_GetTick>
 8000a30:	1c06      	adds	r6, r0, #0
 8000a32:	6d2b      	ldr	r3, [r5, #80]	; 0x50
 8000a34:	0799      	lsls	r1, r3, #30
 8000a36:	d4ed      	bmi.n	8000a14 <HAL_RCC_OscConfig+0x1fc>
 8000a38:	f7ff fee6 	bl	8000808 <HAL_GetTick>
 8000a3c:	1b80      	subs	r0, r0, r6
 8000a3e:	2802      	cmp	r0, #2
 8000a40:	d9f7      	bls.n	8000a32 <HAL_RCC_OscConfig+0x21a>
 8000a42:	e73c      	b.n	80008be <HAL_RCC_OscConfig+0xa6>
 8000a44:	439a      	bics	r2, r3
 8000a46:	652a      	str	r2, [r5, #80]	; 0x50
 8000a48:	f7ff fede 	bl	8000808 <HAL_GetTick>
 8000a4c:	1c06      	adds	r6, r0, #0
 8000a4e:	6d2b      	ldr	r3, [r5, #80]	; 0x50
 8000a50:	079a      	lsls	r2, r3, #30
 8000a52:	d5df      	bpl.n	8000a14 <HAL_RCC_OscConfig+0x1fc>
 8000a54:	f7ff fed8 	bl	8000808 <HAL_GetTick>
 8000a58:	1b80      	subs	r0, r0, r6
 8000a5a:	2802      	cmp	r0, #2
 8000a5c:	d9f7      	bls.n	8000a4e <HAL_RCC_OscConfig+0x236>
 8000a5e:	e72e      	b.n	80008be <HAL_RCC_OscConfig+0xa6>
 8000a60:	4d2f      	ldr	r5, [pc, #188]	; (8000b20 <HAL_RCC_OscConfig+0x308>)
 8000a62:	2380      	movs	r3, #128	; 0x80
 8000a64:	6baa      	ldr	r2, [r5, #56]	; 0x38
 8000a66:	2000      	movs	r0, #0
 8000a68:	055b      	lsls	r3, r3, #21
 8000a6a:	9000      	str	r0, [sp, #0]
 8000a6c:	421a      	tst	r2, r3
 8000a6e:	d104      	bne.n	8000a7a <HAL_RCC_OscConfig+0x262>
 8000a70:	6baa      	ldr	r2, [r5, #56]	; 0x38
 8000a72:	2101      	movs	r1, #1
 8000a74:	4313      	orrs	r3, r2
 8000a76:	63ab      	str	r3, [r5, #56]	; 0x38
 8000a78:	9100      	str	r1, [sp, #0]
 8000a7a:	4e2f      	ldr	r6, [pc, #188]	; (8000b38 <HAL_RCC_OscConfig+0x320>)
 8000a7c:	2380      	movs	r3, #128	; 0x80
 8000a7e:	6832      	ldr	r2, [r6, #0]
 8000a80:	2000      	movs	r0, #0
 8000a82:	005b      	lsls	r3, r3, #1
 8000a84:	9001      	str	r0, [sp, #4]
 8000a86:	421a      	tst	r2, r3
 8000a88:	d110      	bne.n	8000aac <HAL_RCC_OscConfig+0x294>
 8000a8a:	6832      	ldr	r2, [r6, #0]
 8000a8c:	4313      	orrs	r3, r2
 8000a8e:	6033      	str	r3, [r6, #0]
 8000a90:	f7ff feba 	bl	8000808 <HAL_GetTick>
 8000a94:	1c07      	adds	r7, r0, #0
 8000a96:	6833      	ldr	r3, [r6, #0]
 8000a98:	05d9      	lsls	r1, r3, #23
 8000a9a:	d405      	bmi.n	8000aa8 <HAL_RCC_OscConfig+0x290>
 8000a9c:	f7ff feb4 	bl	8000808 <HAL_GetTick>
 8000aa0:	1bc0      	subs	r0, r0, r7
 8000aa2:	2864      	cmp	r0, #100	; 0x64
 8000aa4:	d9f7      	bls.n	8000a96 <HAL_RCC_OscConfig+0x27e>
 8000aa6:	e70a      	b.n	80008be <HAL_RCC_OscConfig+0xa6>
 8000aa8:	2201      	movs	r2, #1
 8000aaa:	9201      	str	r2, [sp, #4]
 8000aac:	68a3      	ldr	r3, [r4, #8]
 8000aae:	2180      	movs	r1, #128	; 0x80
 8000ab0:	0049      	lsls	r1, r1, #1
 8000ab2:	428b      	cmp	r3, r1
 8000ab4:	d102      	bne.n	8000abc <HAL_RCC_OscConfig+0x2a4>
 8000ab6:	6d2a      	ldr	r2, [r5, #80]	; 0x50
 8000ab8:	4313      	orrs	r3, r2
 8000aba:	e023      	b.n	8000b04 <HAL_RCC_OscConfig+0x2ec>
 8000abc:	4a1d      	ldr	r2, [pc, #116]	; (8000b34 <HAL_RCC_OscConfig+0x31c>)
 8000abe:	2b00      	cmp	r3, #0
 8000ac0:	d10a      	bne.n	8000ad8 <HAL_RCC_OscConfig+0x2c0>
 8000ac2:	6d2b      	ldr	r3, [r5, #80]	; 0x50
 8000ac4:	401a      	ands	r2, r3
 8000ac6:	652a      	str	r2, [r5, #80]	; 0x50
 8000ac8:	6d2a      	ldr	r2, [r5, #80]	; 0x50
 8000aca:	4b1c      	ldr	r3, [pc, #112]	; (8000b3c <HAL_RCC_OscConfig+0x324>)
 8000acc:	4013      	ands	r3, r2
 8000ace:	652b      	str	r3, [r5, #80]	; 0x50
 8000ad0:	f7ff fe9a 	bl	8000808 <HAL_GetTick>
 8000ad4:	1c07      	adds	r7, r0, #0
 8000ad6:	e03c      	b.n	8000b52 <HAL_RCC_OscConfig+0x33a>
 8000ad8:	20a0      	movs	r0, #160	; 0xa0
 8000ada:	00c0      	lsls	r0, r0, #3
 8000adc:	4283      	cmp	r3, r0
 8000ade:	d10b      	bne.n	8000af8 <HAL_RCC_OscConfig+0x2e0>
 8000ae0:	6d2b      	ldr	r3, [r5, #80]	; 0x50
 8000ae2:	401a      	ands	r2, r3
 8000ae4:	652a      	str	r2, [r5, #80]	; 0x50
 8000ae6:	6d2a      	ldr	r2, [r5, #80]	; 0x50
 8000ae8:	2380      	movs	r3, #128	; 0x80
 8000aea:	00db      	lsls	r3, r3, #3
 8000aec:	4313      	orrs	r3, r2
 8000aee:	652b      	str	r3, [r5, #80]	; 0x50
 8000af0:	6d2b      	ldr	r3, [r5, #80]	; 0x50
 8000af2:	4319      	orrs	r1, r3
 8000af4:	6529      	str	r1, [r5, #80]	; 0x50
 8000af6:	e006      	b.n	8000b06 <HAL_RCC_OscConfig+0x2ee>
 8000af8:	6d2b      	ldr	r3, [r5, #80]	; 0x50
 8000afa:	401a      	ands	r2, r3
 8000afc:	652a      	str	r2, [r5, #80]	; 0x50
 8000afe:	6d2a      	ldr	r2, [r5, #80]	; 0x50
 8000b00:	4b0e      	ldr	r3, [pc, #56]	; (8000b3c <HAL_RCC_OscConfig+0x324>)
 8000b02:	4013      	ands	r3, r2
 8000b04:	652b      	str	r3, [r5, #80]	; 0x50
 8000b06:	f7ff fe7f 	bl	8000808 <HAL_GetTick>
 8000b0a:	1c07      	adds	r7, r0, #0
 8000b0c:	6d2b      	ldr	r3, [r5, #80]	; 0x50
 8000b0e:	0598      	lsls	r0, r3, #22
 8000b10:	d422      	bmi.n	8000b58 <HAL_RCC_OscConfig+0x340>
 8000b12:	f7ff fe79 	bl	8000808 <HAL_GetTick>
 8000b16:	4b0a      	ldr	r3, [pc, #40]	; (8000b40 <HAL_RCC_OscConfig+0x328>)
 8000b18:	1bc0      	subs	r0, r0, r7
 8000b1a:	4298      	cmp	r0, r3
 8000b1c:	d9f6      	bls.n	8000b0c <HAL_RCC_OscConfig+0x2f4>
 8000b1e:	e6ce      	b.n	80008be <HAL_RCC_OscConfig+0xa6>
 8000b20:	40021000 	.word	0x40021000
 8000b24:	fffeffff 	.word	0xfffeffff
 8000b28:	fffbffff 	.word	0xfffbffff
 8000b2c:	ffffe0ff 	.word	0xffffe0ff
 8000b30:	ffff1fff 	.word	0xffff1fff
 8000b34:	fffffeff 	.word	0xfffffeff
 8000b38:	40007000 	.word	0x40007000
 8000b3c:	fffffbff 	.word	0xfffffbff
 8000b40:	00001388 	.word	0x00001388
 8000b44:	f7ff fe60 	bl	8000808 <HAL_GetTick>
 8000b48:	4b30      	ldr	r3, [pc, #192]	; (8000c0c <HAL_RCC_OscConfig+0x3f4>)
 8000b4a:	1bc0      	subs	r0, r0, r7
 8000b4c:	4298      	cmp	r0, r3
 8000b4e:	d900      	bls.n	8000b52 <HAL_RCC_OscConfig+0x33a>
 8000b50:	e6b5      	b.n	80008be <HAL_RCC_OscConfig+0xa6>
 8000b52:	6d2b      	ldr	r3, [r5, #80]	; 0x50
 8000b54:	059a      	lsls	r2, r3, #22
 8000b56:	d4f5      	bmi.n	8000b44 <HAL_RCC_OscConfig+0x32c>
 8000b58:	9901      	ldr	r1, [sp, #4]
 8000b5a:	2901      	cmp	r1, #1
 8000b5c:	d103      	bne.n	8000b66 <HAL_RCC_OscConfig+0x34e>
 8000b5e:	6832      	ldr	r2, [r6, #0]
 8000b60:	4b2b      	ldr	r3, [pc, #172]	; (8000c10 <HAL_RCC_OscConfig+0x3f8>)
 8000b62:	4013      	ands	r3, r2
 8000b64:	6033      	str	r3, [r6, #0]
 8000b66:	9b00      	ldr	r3, [sp, #0]
 8000b68:	2b01      	cmp	r3, #1
 8000b6a:	d103      	bne.n	8000b74 <HAL_RCC_OscConfig+0x35c>
 8000b6c:	6baa      	ldr	r2, [r5, #56]	; 0x38
 8000b6e:	4b29      	ldr	r3, [pc, #164]	; (8000c14 <HAL_RCC_OscConfig+0x3fc>)
 8000b70:	4013      	ands	r3, r2
 8000b72:	63ab      	str	r3, [r5, #56]	; 0x38
 8000b74:	6a62      	ldr	r2, [r4, #36]	; 0x24
 8000b76:	2a00      	cmp	r2, #0
 8000b78:	d101      	bne.n	8000b7e <HAL_RCC_OscConfig+0x366>
 8000b7a:	2000      	movs	r0, #0
 8000b7c:	e043      	b.n	8000c06 <HAL_RCC_OscConfig+0x3ee>
 8000b7e:	4d26      	ldr	r5, [pc, #152]	; (8000c18 <HAL_RCC_OscConfig+0x400>)
 8000b80:	230c      	movs	r3, #12
 8000b82:	68e9      	ldr	r1, [r5, #12]
 8000b84:	400b      	ands	r3, r1
 8000b86:	2b0c      	cmp	r3, #12
 8000b88:	d100      	bne.n	8000b8c <HAL_RCC_OscConfig+0x374>
 8000b8a:	e664      	b.n	8000856 <HAL_RCC_OscConfig+0x3e>
 8000b8c:	4b23      	ldr	r3, [pc, #140]	; (8000c1c <HAL_RCC_OscConfig+0x404>)
 8000b8e:	2a02      	cmp	r2, #2
 8000b90:	d12a      	bne.n	8000be8 <HAL_RCC_OscConfig+0x3d0>
 8000b92:	682a      	ldr	r2, [r5, #0]
 8000b94:	4013      	ands	r3, r2
 8000b96:	602b      	str	r3, [r5, #0]
 8000b98:	f7ff fe36 	bl	8000808 <HAL_GetTick>
 8000b9c:	1c06      	adds	r6, r0, #0
 8000b9e:	682a      	ldr	r2, [r5, #0]
 8000ba0:	4b1d      	ldr	r3, [pc, #116]	; (8000c18 <HAL_RCC_OscConfig+0x400>)
 8000ba2:	0190      	lsls	r0, r2, #6
 8000ba4:	d505      	bpl.n	8000bb2 <HAL_RCC_OscConfig+0x39a>
 8000ba6:	f7ff fe2f 	bl	8000808 <HAL_GetTick>
 8000baa:	1b80      	subs	r0, r0, r6
 8000bac:	2802      	cmp	r0, #2
 8000bae:	d9f6      	bls.n	8000b9e <HAL_RCC_OscConfig+0x386>
 8000bb0:	e685      	b.n	80008be <HAL_RCC_OscConfig+0xa6>
 8000bb2:	6ae2      	ldr	r2, [r4, #44]	; 0x2c
 8000bb4:	6b21      	ldr	r1, [r4, #48]	; 0x30
 8000bb6:	68d8      	ldr	r0, [r3, #12]
 8000bb8:	4311      	orrs	r1, r2
 8000bba:	6aa2      	ldr	r2, [r4, #40]	; 0x28
 8000bbc:	4311      	orrs	r1, r2
 8000bbe:	4a18      	ldr	r2, [pc, #96]	; (8000c20 <HAL_RCC_OscConfig+0x408>)
 8000bc0:	4002      	ands	r2, r0
 8000bc2:	430a      	orrs	r2, r1
 8000bc4:	60da      	str	r2, [r3, #12]
 8000bc6:	6819      	ldr	r1, [r3, #0]
 8000bc8:	2280      	movs	r2, #128	; 0x80
 8000bca:	0452      	lsls	r2, r2, #17
 8000bcc:	430a      	orrs	r2, r1
 8000bce:	601a      	str	r2, [r3, #0]
 8000bd0:	f7ff fe1a 	bl	8000808 <HAL_GetTick>
 8000bd4:	1c04      	adds	r4, r0, #0
 8000bd6:	682b      	ldr	r3, [r5, #0]
 8000bd8:	0198      	lsls	r0, r3, #6
 8000bda:	d4ce      	bmi.n	8000b7a <HAL_RCC_OscConfig+0x362>
 8000bdc:	f7ff fe14 	bl	8000808 <HAL_GetTick>
 8000be0:	1b00      	subs	r0, r0, r4
 8000be2:	2802      	cmp	r0, #2
 8000be4:	d9f7      	bls.n	8000bd6 <HAL_RCC_OscConfig+0x3be>
 8000be6:	e66a      	b.n	80008be <HAL_RCC_OscConfig+0xa6>
 8000be8:	682a      	ldr	r2, [r5, #0]
 8000bea:	4013      	ands	r3, r2
 8000bec:	602b      	str	r3, [r5, #0]
 8000bee:	f7ff fe0b 	bl	8000808 <HAL_GetTick>
 8000bf2:	1c04      	adds	r4, r0, #0
 8000bf4:	682b      	ldr	r3, [r5, #0]
 8000bf6:	0199      	lsls	r1, r3, #6
 8000bf8:	d5bf      	bpl.n	8000b7a <HAL_RCC_OscConfig+0x362>
 8000bfa:	f7ff fe05 	bl	8000808 <HAL_GetTick>
 8000bfe:	1b00      	subs	r0, r0, r4
 8000c00:	2802      	cmp	r0, #2
 8000c02:	d9f7      	bls.n	8000bf4 <HAL_RCC_OscConfig+0x3dc>
 8000c04:	e65b      	b.n	80008be <HAL_RCC_OscConfig+0xa6>
 8000c06:	b005      	add	sp, #20
 8000c08:	bdf0      	pop	{r4, r5, r6, r7, pc}
 8000c0a:	46c0      	nop			; (mov r8, r8)
 8000c0c:	00001388 	.word	0x00001388
 8000c10:	fffffeff 	.word	0xfffffeff
 8000c14:	efffffff 	.word	0xefffffff
 8000c18:	40021000 	.word	0x40021000
 8000c1c:	feffffff 	.word	0xfeffffff
 8000c20:	ff02ffff 	.word	0xff02ffff

08000c24 <HAL_RCC_ClockConfig>:
 8000c24:	b5f7      	push	{r0, r1, r2, r4, r5, r6, r7, lr}
 8000c26:	4f4f      	ldr	r7, [pc, #316]	; (8000d64 <HAL_RCC_ClockConfig+0x140>)
 8000c28:	2301      	movs	r3, #1
 8000c2a:	683a      	ldr	r2, [r7, #0]
 8000c2c:	1c05      	adds	r5, r0, #0
 8000c2e:	1c0e      	adds	r6, r1, #0
 8000c30:	401a      	ands	r2, r3
 8000c32:	4291      	cmp	r1, r2
 8000c34:	d80a      	bhi.n	8000c4c <HAL_RCC_ClockConfig+0x28>
 8000c36:	682b      	ldr	r3, [r5, #0]
 8000c38:	0798      	lsls	r0, r3, #30
 8000c3a:	d511      	bpl.n	8000c60 <HAL_RCC_ClockConfig+0x3c>
 8000c3c:	4a4a      	ldr	r2, [pc, #296]	; (8000d68 <HAL_RCC_ClockConfig+0x144>)
 8000c3e:	20f0      	movs	r0, #240	; 0xf0
 8000c40:	68d1      	ldr	r1, [r2, #12]
 8000c42:	4381      	bics	r1, r0
 8000c44:	68a8      	ldr	r0, [r5, #8]
 8000c46:	4301      	orrs	r1, r0
 8000c48:	60d1      	str	r1, [r2, #12]
 8000c4a:	e009      	b.n	8000c60 <HAL_RCC_ClockConfig+0x3c>
 8000c4c:	683a      	ldr	r2, [r7, #0]
 8000c4e:	439a      	bics	r2, r3
 8000c50:	430a      	orrs	r2, r1
 8000c52:	603a      	str	r2, [r7, #0]
 8000c54:	683a      	ldr	r2, [r7, #0]
 8000c56:	4013      	ands	r3, r2
 8000c58:	428b      	cmp	r3, r1
 8000c5a:	d0ec      	beq.n	8000c36 <HAL_RCC_ClockConfig+0x12>
 8000c5c:	2001      	movs	r0, #1
 8000c5e:	e080      	b.n	8000d62 <HAL_RCC_ClockConfig+0x13e>
 8000c60:	07d9      	lsls	r1, r3, #31
 8000c62:	d406      	bmi.n	8000c72 <HAL_RCC_ClockConfig+0x4e>
 8000c64:	6839      	ldr	r1, [r7, #0]
 8000c66:	2301      	movs	r3, #1
 8000c68:	4a3e      	ldr	r2, [pc, #248]	; (8000d64 <HAL_RCC_ClockConfig+0x140>)
 8000c6a:	4019      	ands	r1, r3
 8000c6c:	428e      	cmp	r6, r1
 8000c6e:	d958      	bls.n	8000d22 <HAL_RCC_ClockConfig+0xfe>
 8000c70:	e05f      	b.n	8000d32 <HAL_RCC_ClockConfig+0x10e>
 8000c72:	4c3d      	ldr	r4, [pc, #244]	; (8000d68 <HAL_RCC_ClockConfig+0x144>)
 8000c74:	686b      	ldr	r3, [r5, #4]
 8000c76:	6822      	ldr	r2, [r4, #0]
 8000c78:	2b02      	cmp	r3, #2
 8000c7a:	d102      	bne.n	8000c82 <HAL_RCC_ClockConfig+0x5e>
 8000c7c:	0390      	lsls	r0, r2, #14
 8000c7e:	d40c      	bmi.n	8000c9a <HAL_RCC_ClockConfig+0x76>
 8000c80:	e7ec      	b.n	8000c5c <HAL_RCC_ClockConfig+0x38>
 8000c82:	2b00      	cmp	r3, #0
 8000c84:	d102      	bne.n	8000c8c <HAL_RCC_ClockConfig+0x68>
 8000c86:	0591      	lsls	r1, r2, #22
 8000c88:	d407      	bmi.n	8000c9a <HAL_RCC_ClockConfig+0x76>
 8000c8a:	e7e7      	b.n	8000c5c <HAL_RCC_ClockConfig+0x38>
 8000c8c:	2b03      	cmp	r3, #3
 8000c8e:	d102      	bne.n	8000c96 <HAL_RCC_ClockConfig+0x72>
 8000c90:	0190      	lsls	r0, r2, #6
 8000c92:	d402      	bmi.n	8000c9a <HAL_RCC_ClockConfig+0x76>
 8000c94:	e7e2      	b.n	8000c5c <HAL_RCC_ClockConfig+0x38>
 8000c96:	0751      	lsls	r1, r2, #29
 8000c98:	d5e0      	bpl.n	8000c5c <HAL_RCC_ClockConfig+0x38>
 8000c9a:	68e2      	ldr	r2, [r4, #12]
 8000c9c:	2103      	movs	r1, #3
 8000c9e:	438a      	bics	r2, r1
 8000ca0:	4313      	orrs	r3, r2
 8000ca2:	60e3      	str	r3, [r4, #12]
 8000ca4:	f7ff fdb0 	bl	8000808 <HAL_GetTick>
 8000ca8:	686b      	ldr	r3, [r5, #4]
 8000caa:	9001      	str	r0, [sp, #4]
 8000cac:	2b02      	cmp	r3, #2
 8000cae:	d10d      	bne.n	8000ccc <HAL_RCC_ClockConfig+0xa8>
 8000cb0:	68e2      	ldr	r2, [r4, #12]
 8000cb2:	230c      	movs	r3, #12
 8000cb4:	4013      	ands	r3, r2
 8000cb6:	2b08      	cmp	r3, #8
 8000cb8:	d0d4      	beq.n	8000c64 <HAL_RCC_ClockConfig+0x40>
 8000cba:	f7ff fda5 	bl	8000808 <HAL_GetTick>
 8000cbe:	9a01      	ldr	r2, [sp, #4]
 8000cc0:	4b2a      	ldr	r3, [pc, #168]	; (8000d6c <HAL_RCC_ClockConfig+0x148>)
 8000cc2:	1a80      	subs	r0, r0, r2
 8000cc4:	4298      	cmp	r0, r3
 8000cc6:	d9f3      	bls.n	8000cb0 <HAL_RCC_ClockConfig+0x8c>
 8000cc8:	2003      	movs	r0, #3
 8000cca:	e04a      	b.n	8000d62 <HAL_RCC_ClockConfig+0x13e>
 8000ccc:	2b03      	cmp	r3, #3
 8000cce:	d10c      	bne.n	8000cea <HAL_RCC_ClockConfig+0xc6>
 8000cd0:	68e2      	ldr	r2, [r4, #12]
 8000cd2:	230c      	movs	r3, #12
 8000cd4:	4013      	ands	r3, r2
 8000cd6:	2b0c      	cmp	r3, #12
 8000cd8:	d0c4      	beq.n	8000c64 <HAL_RCC_ClockConfig+0x40>
 8000cda:	f7ff fd95 	bl	8000808 <HAL_GetTick>
 8000cde:	9b01      	ldr	r3, [sp, #4]
 8000ce0:	1ac0      	subs	r0, r0, r3
 8000ce2:	4b22      	ldr	r3, [pc, #136]	; (8000d6c <HAL_RCC_ClockConfig+0x148>)
 8000ce4:	4298      	cmp	r0, r3
 8000ce6:	d9f3      	bls.n	8000cd0 <HAL_RCC_ClockConfig+0xac>
 8000ce8:	e7ee      	b.n	8000cc8 <HAL_RCC_ClockConfig+0xa4>
 8000cea:	2b00      	cmp	r3, #0
 8000cec:	d00c      	beq.n	8000d08 <HAL_RCC_ClockConfig+0xe4>
 8000cee:	68e2      	ldr	r2, [r4, #12]
 8000cf0:	230c      	movs	r3, #12
 8000cf2:	4013      	ands	r3, r2
 8000cf4:	2b04      	cmp	r3, #4
 8000cf6:	d10c      	bne.n	8000d12 <HAL_RCC_ClockConfig+0xee>
 8000cf8:	e7b4      	b.n	8000c64 <HAL_RCC_ClockConfig+0x40>
 8000cfa:	f7ff fd85 	bl	8000808 <HAL_GetTick>
 8000cfe:	9901      	ldr	r1, [sp, #4]
 8000d00:	4b1a      	ldr	r3, [pc, #104]	; (8000d6c <HAL_RCC_ClockConfig+0x148>)
 8000d02:	1a40      	subs	r0, r0, r1
 8000d04:	4298      	cmp	r0, r3
 8000d06:	d8df      	bhi.n	8000cc8 <HAL_RCC_ClockConfig+0xa4>
 8000d08:	68e2      	ldr	r2, [r4, #12]
 8000d0a:	230c      	movs	r3, #12
 8000d0c:	421a      	tst	r2, r3
 8000d0e:	d1f4      	bne.n	8000cfa <HAL_RCC_ClockConfig+0xd6>
 8000d10:	e7a8      	b.n	8000c64 <HAL_RCC_ClockConfig+0x40>
 8000d12:	f7ff fd79 	bl	8000808 <HAL_GetTick>
 8000d16:	9a01      	ldr	r2, [sp, #4]
 8000d18:	4b14      	ldr	r3, [pc, #80]	; (8000d6c <HAL_RCC_ClockConfig+0x148>)
 8000d1a:	1a80      	subs	r0, r0, r2
 8000d1c:	4298      	cmp	r0, r3
 8000d1e:	d9e6      	bls.n	8000cee <HAL_RCC_ClockConfig+0xca>
 8000d20:	e7d2      	b.n	8000cc8 <HAL_RCC_ClockConfig+0xa4>
 8000d22:	6811      	ldr	r1, [r2, #0]
 8000d24:	4399      	bics	r1, r3
 8000d26:	4331      	orrs	r1, r6
 8000d28:	6011      	str	r1, [r2, #0]
 8000d2a:	6812      	ldr	r2, [r2, #0]
 8000d2c:	4013      	ands	r3, r2
 8000d2e:	42b3      	cmp	r3, r6
 8000d30:	d194      	bne.n	8000c5c <HAL_RCC_ClockConfig+0x38>
 8000d32:	682b      	ldr	r3, [r5, #0]
 8000d34:	0758      	lsls	r0, r3, #29
 8000d36:	d506      	bpl.n	8000d46 <HAL_RCC_ClockConfig+0x122>
 8000d38:	4a0b      	ldr	r2, [pc, #44]	; (8000d68 <HAL_RCC_ClockConfig+0x144>)
 8000d3a:	490d      	ldr	r1, [pc, #52]	; (8000d70 <HAL_RCC_ClockConfig+0x14c>)
 8000d3c:	68d0      	ldr	r0, [r2, #12]
 8000d3e:	4001      	ands	r1, r0
 8000d40:	68e8      	ldr	r0, [r5, #12]
 8000d42:	4301      	orrs	r1, r0
 8000d44:	60d1      	str	r1, [r2, #12]
 8000d46:	0719      	lsls	r1, r3, #28
 8000d48:	d507      	bpl.n	8000d5a <HAL_RCC_ClockConfig+0x136>
 8000d4a:	4b07      	ldr	r3, [pc, #28]	; (8000d68 <HAL_RCC_ClockConfig+0x144>)
 8000d4c:	6929      	ldr	r1, [r5, #16]
 8000d4e:	68d8      	ldr	r0, [r3, #12]
 8000d50:	4a08      	ldr	r2, [pc, #32]	; (8000d74 <HAL_RCC_ClockConfig+0x150>)
 8000d52:	00c9      	lsls	r1, r1, #3
 8000d54:	4002      	ands	r2, r0
 8000d56:	430a      	orrs	r2, r1
 8000d58:	60da      	str	r2, [r3, #12]
 8000d5a:	2003      	movs	r0, #3
 8000d5c:	f7ff fd32 	bl	80007c4 <HAL_InitTick>
 8000d60:	2000      	movs	r0, #0
 8000d62:	bdfe      	pop	{r1, r2, r3, r4, r5, r6, r7, pc}
 8000d64:	40022000 	.word	0x40022000
 8000d68:	40021000 	.word	0x40021000
 8000d6c:	00001388 	.word	0x00001388
 8000d70:	fffff8ff 	.word	0xfffff8ff
 8000d74:	ffffc7ff 	.word	0xffffc7ff

08000d78 <HAL_RCC_GetSysClockFreq>:
 8000d78:	b508      	push	{r3, lr}
 8000d7a:	4b1b      	ldr	r3, [pc, #108]	; (8000de8 <HAL_RCC_GetSysClockFreq+0x70>)
 8000d7c:	210c      	movs	r1, #12
 8000d7e:	685a      	ldr	r2, [r3, #4]
 8000d80:	68d8      	ldr	r0, [r3, #12]
 8000d82:	0412      	lsls	r2, r2, #16
 8000d84:	4008      	ands	r0, r1
 8000d86:	0f52      	lsrs	r2, r2, #29
 8000d88:	f000 f996 	bl	80010b8 <__gnu_thumb1_case_uqi>
 8000d8c:	25252525 	.word	0x25252525
 8000d90:	25252507 	.word	0x25252507
 8000d94:	2525252a 	.word	0x2525252a
 8000d98:	0c          	.byte	0x0c
 8000d99:	00          	.byte	0x00
 8000d9a:	681b      	ldr	r3, [r3, #0]
 8000d9c:	06d8      	lsls	r0, r3, #27
 8000d9e:	d521      	bpl.n	8000de4 <HAL_RCC_GetSysClockFreq+0x6c>
 8000da0:	4812      	ldr	r0, [pc, #72]	; (8000dec <HAL_RCC_GetSysClockFreq+0x74>)
 8000da2:	e020      	b.n	8000de6 <HAL_RCC_GetSysClockFreq+0x6e>
 8000da4:	68da      	ldr	r2, [r3, #12]
 8000da6:	68d9      	ldr	r1, [r3, #12]
 8000da8:	0292      	lsls	r2, r2, #10
 8000daa:	4811      	ldr	r0, [pc, #68]	; (8000df0 <HAL_RCC_GetSysClockFreq+0x78>)
 8000dac:	0209      	lsls	r1, r1, #8
 8000dae:	68db      	ldr	r3, [r3, #12]
 8000db0:	0f12      	lsrs	r2, r2, #28
 8000db2:	0f89      	lsrs	r1, r1, #30
 8000db4:	5c82      	ldrb	r2, [r0, r2]
 8000db6:	3101      	adds	r1, #1
 8000db8:	03d8      	lsls	r0, r3, #15
 8000dba:	d407      	bmi.n	8000dcc <HAL_RCC_GetSysClockFreq+0x54>
 8000dbc:	4b0a      	ldr	r3, [pc, #40]	; (8000de8 <HAL_RCC_GetSysClockFreq+0x70>)
 8000dbe:	681b      	ldr	r3, [r3, #0]
 8000dc0:	06d8      	lsls	r0, r3, #27
 8000dc2:	d501      	bpl.n	8000dc8 <HAL_RCC_GetSysClockFreq+0x50>
 8000dc4:	4809      	ldr	r0, [pc, #36]	; (8000dec <HAL_RCC_GetSysClockFreq+0x74>)
 8000dc6:	e002      	b.n	8000dce <HAL_RCC_GetSysClockFreq+0x56>
 8000dc8:	480a      	ldr	r0, [pc, #40]	; (8000df4 <HAL_RCC_GetSysClockFreq+0x7c>)
 8000dca:	e000      	b.n	8000dce <HAL_RCC_GetSysClockFreq+0x56>
 8000dcc:	480a      	ldr	r0, [pc, #40]	; (8000df8 <HAL_RCC_GetSysClockFreq+0x80>)
 8000dce:	4350      	muls	r0, r2
 8000dd0:	f000 f97c 	bl	80010cc <__aeabi_uidiv>
 8000dd4:	e007      	b.n	8000de6 <HAL_RCC_GetSysClockFreq+0x6e>
 8000dd6:	2080      	movs	r0, #128	; 0x80
 8000dd8:	3201      	adds	r2, #1
 8000dda:	0200      	lsls	r0, r0, #8
 8000ddc:	4090      	lsls	r0, r2
 8000dde:	e002      	b.n	8000de6 <HAL_RCC_GetSysClockFreq+0x6e>
 8000de0:	4805      	ldr	r0, [pc, #20]	; (8000df8 <HAL_RCC_GetSysClockFreq+0x80>)
 8000de2:	e000      	b.n	8000de6 <HAL_RCC_GetSysClockFreq+0x6e>
 8000de4:	4803      	ldr	r0, [pc, #12]	; (8000df4 <HAL_RCC_GetSysClockFreq+0x7c>)
 8000de6:	bd08      	pop	{r3, pc}
 8000de8:	40021000 	.word	0x40021000
 8000dec:	003d0900 	.word	0x003d0900
 8000df0:	08001340 	.word	0x08001340
 8000df4:	00f42400 	.word	0x00f42400
 8000df8:	007a1200 	.word	0x007a1200

08000dfc <HAL_RCC_GetHCLKFreq>:
 8000dfc:	b508      	push	{r3, lr}
 8000dfe:	f7ff ffbb 	bl	8000d78 <HAL_RCC_GetSysClockFreq>
 8000e02:	4b05      	ldr	r3, [pc, #20]	; (8000e18 <HAL_RCC_GetHCLKFreq+0x1c>)
 8000e04:	4a05      	ldr	r2, [pc, #20]	; (8000e1c <HAL_RCC_GetHCLKFreq+0x20>)
 8000e06:	68db      	ldr	r3, [r3, #12]
 8000e08:	061b      	lsls	r3, r3, #24
 8000e0a:	0f1b      	lsrs	r3, r3, #28
 8000e0c:	5cd3      	ldrb	r3, [r2, r3]
 8000e0e:	40d8      	lsrs	r0, r3
 8000e10:	4b03      	ldr	r3, [pc, #12]	; (8000e20 <HAL_RCC_GetHCLKFreq+0x24>)
 8000e12:	6018      	str	r0, [r3, #0]
 8000e14:	bd08      	pop	{r3, pc}
 8000e16:	46c0      	nop			; (mov r8, r8)
 8000e18:	40021000 	.word	0x40021000
 8000e1c:	08001349 	.word	0x08001349
 8000e20:	20000000 	.word	0x20000000

08000e24 <HAL_GPIO_Init>:
 8000e24:	b5f0      	push	{r4, r5, r6, r7, lr}
 8000e26:	680a      	ldr	r2, [r1, #0]
 8000e28:	b085      	sub	sp, #20
 8000e2a:	9203      	str	r2, [sp, #12]
 8000e2c:	2300      	movs	r3, #0
 8000e2e:	9a03      	ldr	r2, [sp, #12]
 8000e30:	40da      	lsrs	r2, r3
 8000e32:	d100      	bne.n	8000e36 <HAL_GPIO_Init+0x12>
 8000e34:	e097      	b.n	8000f66 <HAL_GPIO_Init+0x142>
 8000e36:	2201      	movs	r2, #1
 8000e38:	9c03      	ldr	r4, [sp, #12]
 8000e3a:	409a      	lsls	r2, r3
 8000e3c:	4014      	ands	r4, r2
 8000e3e:	46a4      	mov	ip, r4
 8000e40:	d100      	bne.n	8000e44 <HAL_GPIO_Init+0x20>
 8000e42:	e08e      	b.n	8000f62 <HAL_GPIO_Init+0x13e>
 8000e44:	684a      	ldr	r2, [r1, #4]
 8000e46:	2410      	movs	r4, #16
 8000e48:	1c15      	adds	r5, r2, #0
 8000e4a:	43a5      	bics	r5, r4
 8000e4c:	1c2c      	adds	r4, r5, #0
 8000e4e:	3d01      	subs	r5, #1
 8000e50:	2c02      	cmp	r4, #2
 8000e52:	d10e      	bne.n	8000e72 <HAL_GPIO_Init+0x4e>
 8000e54:	08dc      	lsrs	r4, r3, #3
 8000e56:	00a4      	lsls	r4, r4, #2
 8000e58:	2507      	movs	r5, #7
 8000e5a:	1904      	adds	r4, r0, r4
 8000e5c:	401d      	ands	r5, r3
 8000e5e:	6a26      	ldr	r6, [r4, #32]
 8000e60:	00ad      	lsls	r5, r5, #2
 8000e62:	270f      	movs	r7, #15
 8000e64:	40af      	lsls	r7, r5
 8000e66:	43be      	bics	r6, r7
 8000e68:	690f      	ldr	r7, [r1, #16]
 8000e6a:	40af      	lsls	r7, r5
 8000e6c:	433e      	orrs	r6, r7
 8000e6e:	6226      	str	r6, [r4, #32]
 8000e70:	e001      	b.n	8000e76 <HAL_GPIO_Init+0x52>
 8000e72:	2d01      	cmp	r5, #1
 8000e74:	d812      	bhi.n	8000e9c <HAL_GPIO_Init+0x78>
 8000e76:	6886      	ldr	r6, [r0, #8]
 8000e78:	005c      	lsls	r4, r3, #1
 8000e7a:	2503      	movs	r5, #3
 8000e7c:	40a5      	lsls	r5, r4
 8000e7e:	43ae      	bics	r6, r5
 8000e80:	68cd      	ldr	r5, [r1, #12]
 8000e82:	40a5      	lsls	r5, r4
 8000e84:	1c34      	adds	r4, r6, #0
 8000e86:	432c      	orrs	r4, r5
 8000e88:	6084      	str	r4, [r0, #8]
 8000e8a:	6844      	ldr	r4, [r0, #4]
 8000e8c:	2501      	movs	r5, #1
 8000e8e:	409d      	lsls	r5, r3
 8000e90:	43ac      	bics	r4, r5
 8000e92:	06d5      	lsls	r5, r2, #27
 8000e94:	0fed      	lsrs	r5, r5, #31
 8000e96:	409d      	lsls	r5, r3
 8000e98:	432c      	orrs	r4, r5
 8000e9a:	6044      	str	r4, [r0, #4]
 8000e9c:	2403      	movs	r4, #3
 8000e9e:	005d      	lsls	r5, r3, #1
 8000ea0:	1c26      	adds	r6, r4, #0
 8000ea2:	6807      	ldr	r7, [r0, #0]
 8000ea4:	40ae      	lsls	r6, r5
 8000ea6:	43f6      	mvns	r6, r6
 8000ea8:	9600      	str	r6, [sp, #0]
 8000eaa:	403e      	ands	r6, r7
 8000eac:	1c17      	adds	r7, r2, #0
 8000eae:	4027      	ands	r7, r4
 8000eb0:	40af      	lsls	r7, r5
 8000eb2:	4337      	orrs	r7, r6
 8000eb4:	6007      	str	r7, [r0, #0]
 8000eb6:	68c7      	ldr	r7, [r0, #12]
 8000eb8:	9e00      	ldr	r6, [sp, #0]
 8000eba:	403e      	ands	r6, r7
 8000ebc:	688f      	ldr	r7, [r1, #8]
 8000ebe:	40af      	lsls	r7, r5
 8000ec0:	433e      	orrs	r6, r7
 8000ec2:	60c6      	str	r6, [r0, #12]
 8000ec4:	00d5      	lsls	r5, r2, #3
 8000ec6:	d54c      	bpl.n	8000f62 <HAL_GPIO_Init+0x13e>
 8000ec8:	4d28      	ldr	r5, [pc, #160]	; (8000f6c <HAL_GPIO_Init+0x148>)
 8000eca:	2601      	movs	r6, #1
 8000ecc:	6b6f      	ldr	r7, [r5, #52]	; 0x34
 8000ece:	401c      	ands	r4, r3
 8000ed0:	4337      	orrs	r7, r6
 8000ed2:	636f      	str	r7, [r5, #52]	; 0x34
 8000ed4:	4f26      	ldr	r7, [pc, #152]	; (8000f70 <HAL_GPIO_Init+0x14c>)
 8000ed6:	089d      	lsrs	r5, r3, #2
 8000ed8:	00ad      	lsls	r5, r5, #2
 8000eda:	19ed      	adds	r5, r5, r7
 8000edc:	68af      	ldr	r7, [r5, #8]
 8000ede:	00a4      	lsls	r4, r4, #2
 8000ee0:	9402      	str	r4, [sp, #8]
 8000ee2:	9701      	str	r7, [sp, #4]
 8000ee4:	9f02      	ldr	r7, [sp, #8]
 8000ee6:	240f      	movs	r4, #15
 8000ee8:	40bc      	lsls	r4, r7
 8000eea:	9f01      	ldr	r7, [sp, #4]
 8000eec:	43a7      	bics	r7, r4
 8000eee:	24a0      	movs	r4, #160	; 0xa0
 8000ef0:	05e4      	lsls	r4, r4, #23
 8000ef2:	42a0      	cmp	r0, r4
 8000ef4:	d00b      	beq.n	8000f0e <HAL_GPIO_Init+0xea>
 8000ef6:	4c1f      	ldr	r4, [pc, #124]	; (8000f74 <HAL_GPIO_Init+0x150>)
 8000ef8:	42a0      	cmp	r0, r4
 8000efa:	d00b      	beq.n	8000f14 <HAL_GPIO_Init+0xf0>
 8000efc:	4c1e      	ldr	r4, [pc, #120]	; (8000f78 <HAL_GPIO_Init+0x154>)
 8000efe:	42a0      	cmp	r0, r4
 8000f00:	d007      	beq.n	8000f12 <HAL_GPIO_Init+0xee>
 8000f02:	4c1e      	ldr	r4, [pc, #120]	; (8000f7c <HAL_GPIO_Init+0x158>)
 8000f04:	1906      	adds	r6, r0, r4
 8000f06:	1e74      	subs	r4, r6, #1
 8000f08:	41a6      	sbcs	r6, r4
 8000f0a:	3605      	adds	r6, #5
 8000f0c:	e002      	b.n	8000f14 <HAL_GPIO_Init+0xf0>
 8000f0e:	2600      	movs	r6, #0
 8000f10:	e000      	b.n	8000f14 <HAL_GPIO_Init+0xf0>
 8000f12:	2602      	movs	r6, #2
 8000f14:	9c02      	ldr	r4, [sp, #8]
 8000f16:	40a6      	lsls	r6, r4
 8000f18:	4337      	orrs	r7, r6
 8000f1a:	4c19      	ldr	r4, [pc, #100]	; (8000f80 <HAL_GPIO_Init+0x15c>)
 8000f1c:	60af      	str	r7, [r5, #8]
 8000f1e:	4667      	mov	r7, ip
 8000f20:	6826      	ldr	r6, [r4, #0]
 8000f22:	43fd      	mvns	r5, r7
 8000f24:	03d7      	lsls	r7, r2, #15
 8000f26:	d401      	bmi.n	8000f2c <HAL_GPIO_Init+0x108>
 8000f28:	402e      	ands	r6, r5
 8000f2a:	e001      	b.n	8000f30 <HAL_GPIO_Init+0x10c>
 8000f2c:	4667      	mov	r7, ip
 8000f2e:	433e      	orrs	r6, r7
 8000f30:	6026      	str	r6, [r4, #0]
 8000f32:	6866      	ldr	r6, [r4, #4]
 8000f34:	0397      	lsls	r7, r2, #14
 8000f36:	d401      	bmi.n	8000f3c <HAL_GPIO_Init+0x118>
 8000f38:	402e      	ands	r6, r5
 8000f3a:	e001      	b.n	8000f40 <HAL_GPIO_Init+0x11c>
 8000f3c:	4667      	mov	r7, ip
 8000f3e:	433e      	orrs	r6, r7
 8000f40:	6066      	str	r6, [r4, #4]
 8000f42:	68a6      	ldr	r6, [r4, #8]
 8000f44:	02d7      	lsls	r7, r2, #11
 8000f46:	d401      	bmi.n	8000f4c <HAL_GPIO_Init+0x128>
 8000f48:	402e      	ands	r6, r5
 8000f4a:	e001      	b.n	8000f50 <HAL_GPIO_Init+0x12c>
 8000f4c:	4667      	mov	r7, ip
 8000f4e:	433e      	orrs	r6, r7
 8000f50:	60a6      	str	r6, [r4, #8]
 8000f52:	68e6      	ldr	r6, [r4, #12]
 8000f54:	0297      	lsls	r7, r2, #10
 8000f56:	d401      	bmi.n	8000f5c <HAL_GPIO_Init+0x138>
 8000f58:	4035      	ands	r5, r6
 8000f5a:	e001      	b.n	8000f60 <HAL_GPIO_Init+0x13c>
 8000f5c:	4665      	mov	r5, ip
 8000f5e:	4335      	orrs	r5, r6
 8000f60:	60e5      	str	r5, [r4, #12]
 8000f62:	3301      	adds	r3, #1
 8000f64:	e763      	b.n	8000e2e <HAL_GPIO_Init+0xa>
 8000f66:	b005      	add	sp, #20
 8000f68:	bdf0      	pop	{r4, r5, r6, r7, pc}
 8000f6a:	46c0      	nop			; (mov r8, r8)
 8000f6c:	40021000 	.word	0x40021000
 8000f70:	40010000 	.word	0x40010000
 8000f74:	50000400 	.word	0x50000400
 8000f78:	50000800 	.word	0x50000800
 8000f7c:	afffe400 	.word	0xafffe400
 8000f80:	40010400 	.word	0x40010400

08000f84 <SystemClock_Config>:
 8000f84:	b500      	push	{lr}
 8000f86:	b093      	sub	sp, #76	; 0x4c
 8000f88:	2100      	movs	r1, #0
 8000f8a:	2214      	movs	r2, #20
 8000f8c:	4668      	mov	r0, sp
 8000f8e:	f000 f94d 	bl	800122c <memset>
 8000f92:	2100      	movs	r1, #0
 8000f94:	2234      	movs	r2, #52	; 0x34
 8000f96:	a805      	add	r0, sp, #20
 8000f98:	f000 f948 	bl	800122c <memset>
 8000f9c:	2310      	movs	r3, #16
 8000f9e:	9305      	str	r3, [sp, #20]
 8000fa0:	2301      	movs	r3, #1
 8000fa2:	930b      	str	r3, [sp, #44]	; 0x2c
 8000fa4:	23a0      	movs	r3, #160	; 0xa0
 8000fa6:	021b      	lsls	r3, r3, #8
 8000fa8:	a805      	add	r0, sp, #20
 8000faa:	930d      	str	r3, [sp, #52]	; 0x34
 8000fac:	f7ff fc34 	bl	8000818 <HAL_RCC_OscConfig>
 8000fb0:	1e01      	subs	r1, r0, #0
 8000fb2:	d000      	beq.n	8000fb6 <SystemClock_Config+0x32>
 8000fb4:	e7fe      	b.n	8000fb4 <SystemClock_Config+0x30>
 8000fb6:	230f      	movs	r3, #15
 8000fb8:	9001      	str	r0, [sp, #4]
 8000fba:	9002      	str	r0, [sp, #8]
 8000fbc:	9003      	str	r0, [sp, #12]
 8000fbe:	9004      	str	r0, [sp, #16]
 8000fc0:	4668      	mov	r0, sp
 8000fc2:	9300      	str	r3, [sp, #0]
 8000fc4:	f7ff fe2e 	bl	8000c24 <HAL_RCC_ClockConfig>
 8000fc8:	2800      	cmp	r0, #0
 8000fca:	d000      	beq.n	8000fce <SystemClock_Config+0x4a>
 8000fcc:	e7fe      	b.n	8000fcc <SystemClock_Config+0x48>
 8000fce:	4b09      	ldr	r3, [pc, #36]	; (8000ff4 <SystemClock_Config+0x70>)
 8000fd0:	2280      	movs	r2, #128	; 0x80
 8000fd2:	6b99      	ldr	r1, [r3, #56]	; 0x38
 8000fd4:	0552      	lsls	r2, r2, #21
 8000fd6:	430a      	orrs	r2, r1
 8000fd8:	639a      	str	r2, [r3, #56]	; 0x38
 8000fda:	4a07      	ldr	r2, [pc, #28]	; (8000ff8 <SystemClock_Config+0x74>)
 8000fdc:	21c0      	movs	r1, #192	; 0xc0
 8000fde:	6810      	ldr	r0, [r2, #0]
 8000fe0:	0149      	lsls	r1, r1, #5
 8000fe2:	4301      	orrs	r1, r0
 8000fe4:	6011      	str	r1, [r2, #0]
 8000fe6:	6b99      	ldr	r1, [r3, #56]	; 0x38
 8000fe8:	4a04      	ldr	r2, [pc, #16]	; (8000ffc <SystemClock_Config+0x78>)
 8000fea:	400a      	ands	r2, r1
 8000fec:	639a      	str	r2, [r3, #56]	; 0x38
 8000fee:	b013      	add	sp, #76	; 0x4c
 8000ff0:	bd00      	pop	{pc}
 8000ff2:	46c0      	nop			; (mov r8, r8)
 8000ff4:	40021000 	.word	0x40021000
 8000ff8:	40007000 	.word	0x40007000
 8000ffc:	efffffff 	.word	0xefffffff

08001000 <lib_low_level_init>:
 8001000:	b508      	push	{r3, lr}
 8001002:	f7ff fbf1 	bl	80007e8 <HAL_Init>
 8001006:	f7ff ffbd 	bl	8000f84 <SystemClock_Config>
 800100a:	f000 f803 	bl	8001014 <gpio_init>
 800100e:	f7ff fb33 	bl	8000678 <uart_init>
 8001012:	bd08      	pop	{r3, pc}

08001014 <gpio_init>:
 8001014:	b530      	push	{r4, r5, lr}
 8001016:	4a0a      	ldr	r2, [pc, #40]	; (8001040 <gpio_init+0x2c>)
 8001018:	2303      	movs	r3, #3
 800101a:	6ad1      	ldr	r1, [r2, #44]	; 0x2c
 800101c:	4c09      	ldr	r4, [pc, #36]	; (8001044 <gpio_init+0x30>)
 800101e:	b087      	sub	sp, #28
 8001020:	4319      	orrs	r1, r3
 8001022:	62d1      	str	r1, [r2, #44]	; 0x2c
 8001024:	2508      	movs	r5, #8
 8001026:	2201      	movs	r2, #1
 8001028:	1c20      	adds	r0, r4, #0
 800102a:	a901      	add	r1, sp, #4
 800102c:	9202      	str	r2, [sp, #8]
 800102e:	9203      	str	r2, [sp, #12]
 8001030:	9304      	str	r3, [sp, #16]
 8001032:	9501      	str	r5, [sp, #4]
 8001034:	f7ff fef6 	bl	8000e24 <HAL_GPIO_Init>
 8001038:	62a5      	str	r5, [r4, #40]	; 0x28
 800103a:	b007      	add	sp, #28
 800103c:	bd30      	pop	{r4, r5, pc}
 800103e:	46c0      	nop			; (mov r8, r8)
 8001040:	40021000 	.word	0x40021000
 8001044:	50000400 	.word	0x50000400

08001048 <led_on>:
 8001048:	4b01      	ldr	r3, [pc, #4]	; (8001050 <led_on+0x8>)
 800104a:	6198      	str	r0, [r3, #24]
 800104c:	4770      	bx	lr
 800104e:	46c0      	nop			; (mov r8, r8)
 8001050:	50000400 	.word	0x50000400

08001054 <led_off>:
 8001054:	4b01      	ldr	r3, [pc, #4]	; (800105c <led_off+0x8>)
 8001056:	6298      	str	r0, [r3, #40]	; 0x28
 8001058:	4770      	bx	lr
 800105a:	46c0      	nop			; (mov r8, r8)
 800105c:	50000400 	.word	0x50000400

08001060 <Default_Handler>:
 8001060:	46c0      	nop			; (mov r8, r8)
 8001062:	e7fd      	b.n	8001060 <Default_Handler>

08001064 <HardFault_Handler>:
 8001064:	2008      	movs	r0, #8
 8001066:	f7ff ffef 	bl	8001048 <led_on>
 800106a:	4b07      	ldr	r3, [pc, #28]	; (8001088 <HardFault_Handler+0x24>)
 800106c:	3b01      	subs	r3, #1
 800106e:	2b00      	cmp	r3, #0
 8001070:	d001      	beq.n	8001076 <HardFault_Handler+0x12>
 8001072:	46c0      	nop			; (mov r8, r8)
 8001074:	e7fa      	b.n	800106c <HardFault_Handler+0x8>
 8001076:	2008      	movs	r0, #8
 8001078:	f7ff ffec 	bl	8001054 <led_off>
 800107c:	4b02      	ldr	r3, [pc, #8]	; (8001088 <HardFault_Handler+0x24>)
 800107e:	3b01      	subs	r3, #1
 8001080:	2b00      	cmp	r3, #0
 8001082:	d0ef      	beq.n	8001064 <HardFault_Handler>
 8001084:	46c0      	nop			; (mov r8, r8)
 8001086:	e7fa      	b.n	800107e <HardFault_Handler+0x1a>
 8001088:	00989681 	.word	0x00989681

0800108c <_reset_init>:
 800108c:	4a07      	ldr	r2, [pc, #28]	; (80010ac <_reset_init+0x20>)
 800108e:	4908      	ldr	r1, [pc, #32]	; (80010b0 <_reset_init+0x24>)
 8001090:	2300      	movs	r3, #0
 8001092:	1a89      	subs	r1, r1, r2
 8001094:	1089      	asrs	r1, r1, #2
 8001096:	1c10      	adds	r0, r2, #0
 8001098:	428b      	cmp	r3, r1
 800109a:	d005      	beq.n	80010a8 <_reset_init+0x1c>
 800109c:	4c05      	ldr	r4, [pc, #20]	; (80010b4 <_reset_init+0x28>)
 800109e:	009a      	lsls	r2, r3, #2
 80010a0:	58a4      	ldr	r4, [r4, r2]
 80010a2:	3301      	adds	r3, #1
 80010a4:	5084      	str	r4, [r0, r2]
 80010a6:	e7f7      	b.n	8001098 <_reset_init+0xc>
 80010a8:	f7ff fa9e 	bl	80005e8 <main>
 80010ac:	20000000 	.word	0x20000000
 80010b0:	20000004 	.word	0x20000004
 80010b4:	08001360 	.word	0x08001360

080010b8 <__gnu_thumb1_case_uqi>:
 80010b8:	b402      	push	{r1}
 80010ba:	4671      	mov	r1, lr
 80010bc:	0849      	lsrs	r1, r1, #1
 80010be:	0049      	lsls	r1, r1, #1
 80010c0:	5c09      	ldrb	r1, [r1, r0]
 80010c2:	0049      	lsls	r1, r1, #1
 80010c4:	448e      	add	lr, r1
 80010c6:	bc02      	pop	{r1}
 80010c8:	4770      	bx	lr
 80010ca:	46c0      	nop			; (mov r8, r8)

080010cc <__aeabi_uidiv>:
 80010cc:	2900      	cmp	r1, #0
 80010ce:	d034      	beq.n	800113a <.udivsi3_skip_div0_test+0x6a>

080010d0 <.udivsi3_skip_div0_test>:
 80010d0:	2301      	movs	r3, #1
 80010d2:	2200      	movs	r2, #0
 80010d4:	b410      	push	{r4}
 80010d6:	4288      	cmp	r0, r1
 80010d8:	d32c      	bcc.n	8001134 <.udivsi3_skip_div0_test+0x64>
 80010da:	2401      	movs	r4, #1
 80010dc:	0724      	lsls	r4, r4, #28
 80010de:	42a1      	cmp	r1, r4
 80010e0:	d204      	bcs.n	80010ec <.udivsi3_skip_div0_test+0x1c>
 80010e2:	4281      	cmp	r1, r0
 80010e4:	d202      	bcs.n	80010ec <.udivsi3_skip_div0_test+0x1c>
 80010e6:	0109      	lsls	r1, r1, #4
 80010e8:	011b      	lsls	r3, r3, #4
 80010ea:	e7f8      	b.n	80010de <.udivsi3_skip_div0_test+0xe>
 80010ec:	00e4      	lsls	r4, r4, #3
 80010ee:	42a1      	cmp	r1, r4
 80010f0:	d204      	bcs.n	80010fc <.udivsi3_skip_div0_test+0x2c>
 80010f2:	4281      	cmp	r1, r0
 80010f4:	d202      	bcs.n	80010fc <.udivsi3_skip_div0_test+0x2c>
 80010f6:	0049      	lsls	r1, r1, #1
 80010f8:	005b      	lsls	r3, r3, #1
 80010fa:	e7f8      	b.n	80010ee <.udivsi3_skip_div0_test+0x1e>
 80010fc:	4288      	cmp	r0, r1
 80010fe:	d301      	bcc.n	8001104 <.udivsi3_skip_div0_test+0x34>
 8001100:	1a40      	subs	r0, r0, r1
 8001102:	431a      	orrs	r2, r3
 8001104:	084c      	lsrs	r4, r1, #1
 8001106:	42a0      	cmp	r0, r4
 8001108:	d302      	bcc.n	8001110 <.udivsi3_skip_div0_test+0x40>
 800110a:	1b00      	subs	r0, r0, r4
 800110c:	085c      	lsrs	r4, r3, #1
 800110e:	4322      	orrs	r2, r4
 8001110:	088c      	lsrs	r4, r1, #2
 8001112:	42a0      	cmp	r0, r4
 8001114:	d302      	bcc.n	800111c <.udivsi3_skip_div0_test+0x4c>
 8001116:	1b00      	subs	r0, r0, r4
 8001118:	089c      	lsrs	r4, r3, #2
 800111a:	4322      	orrs	r2, r4
 800111c:	08cc      	lsrs	r4, r1, #3
 800111e:	42a0      	cmp	r0, r4
 8001120:	d302      	bcc.n	8001128 <.udivsi3_skip_div0_test+0x58>
 8001122:	1b00      	subs	r0, r0, r4
 8001124:	08dc      	lsrs	r4, r3, #3
 8001126:	4322      	orrs	r2, r4
 8001128:	2800      	cmp	r0, #0
 800112a:	d003      	beq.n	8001134 <.udivsi3_skip_div0_test+0x64>
 800112c:	091b      	lsrs	r3, r3, #4
 800112e:	d001      	beq.n	8001134 <.udivsi3_skip_div0_test+0x64>
 8001130:	0909      	lsrs	r1, r1, #4
 8001132:	e7e3      	b.n	80010fc <.udivsi3_skip_div0_test+0x2c>
 8001134:	1c10      	adds	r0, r2, #0
 8001136:	bc10      	pop	{r4}
 8001138:	4770      	bx	lr
 800113a:	2800      	cmp	r0, #0
 800113c:	d001      	beq.n	8001142 <.udivsi3_skip_div0_test+0x72>
 800113e:	2000      	movs	r0, #0
 8001140:	43c0      	mvns	r0, r0
 8001142:	b407      	push	{r0, r1, r2}
 8001144:	4802      	ldr	r0, [pc, #8]	; (8001150 <.udivsi3_skip_div0_test+0x80>)
 8001146:	a102      	add	r1, pc, #8	; (adr r1, 8001150 <.udivsi3_skip_div0_test+0x80>)
 8001148:	1840      	adds	r0, r0, r1
 800114a:	9002      	str	r0, [sp, #8]
 800114c:	bd03      	pop	{r0, r1, pc}
 800114e:	46c0      	nop			; (mov r8, r8)
 8001150:	000000d9 	.word	0x000000d9

08001154 <__aeabi_uidivmod>:
 8001154:	2900      	cmp	r1, #0
 8001156:	d0f0      	beq.n	800113a <.udivsi3_skip_div0_test+0x6a>
 8001158:	b503      	push	{r0, r1, lr}
 800115a:	f7ff ffb9 	bl	80010d0 <.udivsi3_skip_div0_test>
 800115e:	bc0e      	pop	{r1, r2, r3}
 8001160:	4342      	muls	r2, r0
 8001162:	1a89      	subs	r1, r1, r2
 8001164:	4718      	bx	r3
 8001166:	46c0      	nop			; (mov r8, r8)

08001168 <__aeabi_idiv>:
 8001168:	2900      	cmp	r1, #0
 800116a:	d041      	beq.n	80011f0 <.divsi3_skip_div0_test+0x84>

0800116c <.divsi3_skip_div0_test>:
 800116c:	b410      	push	{r4}
 800116e:	1c04      	adds	r4, r0, #0
 8001170:	404c      	eors	r4, r1
 8001172:	46a4      	mov	ip, r4
 8001174:	2301      	movs	r3, #1
 8001176:	2200      	movs	r2, #0
 8001178:	2900      	cmp	r1, #0
 800117a:	d500      	bpl.n	800117e <.divsi3_skip_div0_test+0x12>
 800117c:	4249      	negs	r1, r1
 800117e:	2800      	cmp	r0, #0
 8001180:	d500      	bpl.n	8001184 <.divsi3_skip_div0_test+0x18>
 8001182:	4240      	negs	r0, r0
 8001184:	4288      	cmp	r0, r1
 8001186:	d32c      	bcc.n	80011e2 <.divsi3_skip_div0_test+0x76>
 8001188:	2401      	movs	r4, #1
 800118a:	0724      	lsls	r4, r4, #28
 800118c:	42a1      	cmp	r1, r4
 800118e:	d204      	bcs.n	800119a <.divsi3_skip_div0_test+0x2e>
 8001190:	4281      	cmp	r1, r0
 8001192:	d202      	bcs.n	800119a <.divsi3_skip_div0_test+0x2e>
 8001194:	0109      	lsls	r1, r1, #4
 8001196:	011b      	lsls	r3, r3, #4
 8001198:	e7f8      	b.n	800118c <.divsi3_skip_div0_test+0x20>
 800119a:	00e4      	lsls	r4, r4, #3
 800119c:	42a1      	cmp	r1, r4
 800119e:	d204      	bcs.n	80011aa <.divsi3_skip_div0_test+0x3e>
 80011a0:	4281      	cmp	r1, r0
 80011a2:	d202      	bcs.n	80011aa <.divsi3_skip_div0_test+0x3e>
 80011a4:	0049      	lsls	r1, r1, #1
 80011a6:	005b      	lsls	r3, r3, #1
 80011a8:	e7f8      	b.n	800119c <.divsi3_skip_div0_test+0x30>
 80011aa:	4288      	cmp	r0, r1
 80011ac:	d301      	bcc.n	80011b2 <.divsi3_skip_div0_test+0x46>
 80011ae:	1a40      	subs	r0, r0, r1
 80011b0:	431a      	orrs	r2, r3
 80011b2:	084c      	lsrs	r4, r1, #1
 80011b4:	42a0      	cmp	r0, r4
 80011b6:	d302      	bcc.n	80011be <.divsi3_skip_div0_test+0x52>
 80011b8:	1b00      	subs	r0, r0, r4
 80011ba:	085c      	lsrs	r4, r3, #1
 80011bc:	4322      	orrs	r2, r4
 80011be:	088c      	lsrs	r4, r1, #2
 80011c0:	42a0      	cmp	r0, r4
 80011c2:	d302      	bcc.n	80011ca <.divsi3_skip_div0_test+0x5e>
 80011c4:	1b00      	subs	r0, r0, r4
 80011c6:	089c      	lsrs	r4, r3, #2
 80011c8:	4322      	orrs	r2, r4
 80011ca:	08cc      	lsrs	r4, r1, #3
 80011cc:	42a0      	cmp	r0, r4
 80011ce:	d302      	bcc.n	80011d6 <.divsi3_skip_div0_test+0x6a>
 80011d0:	1b00      	subs	r0, r0, r4
 80011d2:	08dc      	lsrs	r4, r3, #3
 80011d4:	4322      	orrs	r2, r4
 80011d6:	2800      	cmp	r0, #0
 80011d8:	d003      	beq.n	80011e2 <.divsi3_skip_div0_test+0x76>
 80011da:	091b      	lsrs	r3, r3, #4
 80011dc:	d001      	beq.n	80011e2 <.divsi3_skip_div0_test+0x76>
 80011de:	0909      	lsrs	r1, r1, #4
 80011e0:	e7e3      	b.n	80011aa <.divsi3_skip_div0_test+0x3e>
 80011e2:	1c10      	adds	r0, r2, #0
 80011e4:	4664      	mov	r4, ip
 80011e6:	2c00      	cmp	r4, #0
 80011e8:	d500      	bpl.n	80011ec <.divsi3_skip_div0_test+0x80>
 80011ea:	4240      	negs	r0, r0
 80011ec:	bc10      	pop	{r4}
 80011ee:	4770      	bx	lr
 80011f0:	2800      	cmp	r0, #0
 80011f2:	d006      	beq.n	8001202 <.divsi3_skip_div0_test+0x96>
 80011f4:	db03      	blt.n	80011fe <.divsi3_skip_div0_test+0x92>
 80011f6:	2000      	movs	r0, #0
 80011f8:	43c0      	mvns	r0, r0
 80011fa:	0840      	lsrs	r0, r0, #1
 80011fc:	e001      	b.n	8001202 <.divsi3_skip_div0_test+0x96>
 80011fe:	2080      	movs	r0, #128	; 0x80
 8001200:	0600      	lsls	r0, r0, #24
 8001202:	b407      	push	{r0, r1, r2}
 8001204:	4802      	ldr	r0, [pc, #8]	; (8001210 <.divsi3_skip_div0_test+0xa4>)
 8001206:	a102      	add	r1, pc, #8	; (adr r1, 8001210 <.divsi3_skip_div0_test+0xa4>)
 8001208:	1840      	adds	r0, r0, r1
 800120a:	9002      	str	r0, [sp, #8]
 800120c:	bd03      	pop	{r0, r1, pc}
 800120e:	46c0      	nop			; (mov r8, r8)
 8001210:	00000019 	.word	0x00000019

08001214 <__aeabi_idivmod>:
 8001214:	2900      	cmp	r1, #0
 8001216:	d0eb      	beq.n	80011f0 <.divsi3_skip_div0_test+0x84>
 8001218:	b503      	push	{r0, r1, lr}
 800121a:	f7ff ffa7 	bl	800116c <.divsi3_skip_div0_test>
 800121e:	bc0e      	pop	{r1, r2, r3}
 8001220:	4342      	muls	r2, r0
 8001222:	1a89      	subs	r1, r1, r2
 8001224:	4718      	bx	r3
 8001226:	46c0      	nop			; (mov r8, r8)

08001228 <__aeabi_idiv0>:
 8001228:	4770      	bx	lr
 800122a:	46c0      	nop			; (mov r8, r8)

0800122c <memset>:
 800122c:	b5f0      	push	{r4, r5, r6, r7, lr}
 800122e:	0783      	lsls	r3, r0, #30
 8001230:	d046      	beq.n	80012c0 <memset+0x94>
 8001232:	1e54      	subs	r4, r2, #1
 8001234:	2a00      	cmp	r2, #0
 8001236:	d042      	beq.n	80012be <memset+0x92>
 8001238:	b2ce      	uxtb	r6, r1
 800123a:	1c03      	adds	r3, r0, #0
 800123c:	2503      	movs	r5, #3
 800123e:	e003      	b.n	8001248 <memset+0x1c>
 8001240:	1e62      	subs	r2, r4, #1
 8001242:	2c00      	cmp	r4, #0
 8001244:	d03b      	beq.n	80012be <memset+0x92>
 8001246:	1c14      	adds	r4, r2, #0
 8001248:	3301      	adds	r3, #1
 800124a:	1e5a      	subs	r2, r3, #1
 800124c:	7016      	strb	r6, [r2, #0]
 800124e:	422b      	tst	r3, r5
 8001250:	d1f6      	bne.n	8001240 <memset+0x14>
 8001252:	2c03      	cmp	r4, #3
 8001254:	d92b      	bls.n	80012ae <memset+0x82>
 8001256:	25ff      	movs	r5, #255	; 0xff
 8001258:	400d      	ands	r5, r1
 800125a:	022a      	lsls	r2, r5, #8
 800125c:	4315      	orrs	r5, r2
 800125e:	042a      	lsls	r2, r5, #16
 8001260:	4315      	orrs	r5, r2
 8001262:	2c0f      	cmp	r4, #15
 8001264:	d915      	bls.n	8001292 <memset+0x66>
 8001266:	1c27      	adds	r7, r4, #0
 8001268:	3f10      	subs	r7, #16
 800126a:	093f      	lsrs	r7, r7, #4
 800126c:	1c1e      	adds	r6, r3, #0
 800126e:	013a      	lsls	r2, r7, #4
 8001270:	3610      	adds	r6, #16
 8001272:	18b6      	adds	r6, r6, r2
 8001274:	1c1a      	adds	r2, r3, #0
 8001276:	6015      	str	r5, [r2, #0]
 8001278:	6055      	str	r5, [r2, #4]
 800127a:	6095      	str	r5, [r2, #8]
 800127c:	60d5      	str	r5, [r2, #12]
 800127e:	3210      	adds	r2, #16
 8001280:	42b2      	cmp	r2, r6
 8001282:	d1f8      	bne.n	8001276 <memset+0x4a>
 8001284:	3701      	adds	r7, #1
 8001286:	013f      	lsls	r7, r7, #4
 8001288:	220f      	movs	r2, #15
 800128a:	19db      	adds	r3, r3, r7
 800128c:	4014      	ands	r4, r2
 800128e:	2c03      	cmp	r4, #3
 8001290:	d90d      	bls.n	80012ae <memset+0x82>
 8001292:	1f27      	subs	r7, r4, #4
 8001294:	08bf      	lsrs	r7, r7, #2
 8001296:	00ba      	lsls	r2, r7, #2
 8001298:	1d1e      	adds	r6, r3, #4
 800129a:	18b6      	adds	r6, r6, r2
 800129c:	1c1a      	adds	r2, r3, #0
 800129e:	c220      	stmia	r2!, {r5}
 80012a0:	42b2      	cmp	r2, r6
 80012a2:	d1fc      	bne.n	800129e <memset+0x72>
 80012a4:	3701      	adds	r7, #1
 80012a6:	00bf      	lsls	r7, r7, #2
 80012a8:	2203      	movs	r2, #3
 80012aa:	19db      	adds	r3, r3, r7
 80012ac:	4014      	ands	r4, r2
 80012ae:	2c00      	cmp	r4, #0
 80012b0:	d005      	beq.n	80012be <memset+0x92>
 80012b2:	191c      	adds	r4, r3, r4
 80012b4:	b2c9      	uxtb	r1, r1
 80012b6:	7019      	strb	r1, [r3, #0]
 80012b8:	3301      	adds	r3, #1
 80012ba:	42a3      	cmp	r3, r4
 80012bc:	d1fb      	bne.n	80012b6 <memset+0x8a>
 80012be:	bdf0      	pop	{r4, r5, r6, r7, pc}
 80012c0:	1c14      	adds	r4, r2, #0
 80012c2:	1c03      	adds	r3, r0, #0
 80012c4:	e7c5      	b.n	8001252 <memset+0x26>
 80012c6:	46c0      	nop			; (mov r8, r8)

080012c8 <_init>:
 80012c8:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
 80012ca:	46c0      	nop			; (mov r8, r8)
 80012cc:	bcf8      	pop	{r3, r4, r5, r6, r7}
 80012ce:	bc08      	pop	{r3}
 80012d0:	469e      	mov	lr, r3
 80012d2:	4770      	bx	lr

080012d4 <_fini>:
 80012d4:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
 80012d6:	46c0      	nop			; (mov r8, r8)
 80012d8:	bcf8      	pop	{r3, r4, r5, r6, r7}
 80012da:	bc08      	pop	{r3}
 80012dc:	469e      	mov	lr, r3
 80012de:	4770      	bx	lr
 80012e0:	69647473 	.word	0x69647473
 80012e4:	6e69206f 	.word	0x6e69206f
 80012e8:	64207469 	.word	0x64207469
 80012ec:	0a656e6f 	.word	0x0a656e6f
 80012f0:	00          	.byte	0x00
 80012f1:	62          	.byte	0x62
 80012f2:	6f6f      	.short	0x6f6f
 80012f4:	676e6974 	.word	0x676e6974
 80012f8:	6f726620 	.word	0x6f726620
 80012fc:	7525206d 	.word	0x7525206d
 8001300:	6172000a 	.word	0x6172000a
 8001304:	7473206d 	.word	0x7473206d
 8001308:	20747261 	.word	0x20747261
 800130c:	0a207525 	.word	0x0a207525
 8001310:	6d617200 	.word	0x6d617200
 8001314:	7a697320 	.word	0x7a697320
 8001318:	75252065 	.word	0x75252065
 800131c:	72000a20 	.word	0x72000a20
 8001320:	66206d61 	.word	0x66206d61
 8001324:	20656572 	.word	0x20656572
 8001328:	0a207525 	.word	0x0a207525
 800132c:	61656800 	.word	0x61656800
 8001330:	74732070 	.word	0x74732070
 8001334:	20747261 	.word	0x20747261
 8001338:	0a207525 	.word	0x0a207525
 800133c:	000a0a00 	.word	0x000a0a00

08001340 <PLLMulTable>:
 8001340:	08060403 2018100c 00000030                       ....... 0

08001349 <APBAHBPrescTable>:
 8001349:	00000000 04030201 04030201 09080706     ................
 8001359:	00000000                                         ...

0800135c <__EH_FRAME_BEGIN__>:
 800135c:	00000000                                ....
