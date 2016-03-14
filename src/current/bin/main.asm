
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
 80000e2:	f000 fbf5 	bl	80008d0 <sleep>
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
 800015c:	f000 fba7 	bl	80008ae <__get_MSP>
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

080001cc <kernel_start>:
 80001cc:	b508      	push	{r3, lr}
 80001ce:	f000 fb73 	bl	80008b8 <sys_tick_init>
 80001d2:	46c0      	nop			; (mov r8, r8)
 80001d4:	e7fd      	b.n	80001d2 <kernel_start+0x6>
	...

080001d8 <create_thread>:
 80001d8:	b5f0      	push	{r4, r5, r6, r7, lr}
 80001da:	b085      	sub	sp, #20
 80001dc:	9003      	str	r0, [sp, #12]
 80001de:	481b      	ldr	r0, [pc, #108]	; (800024c <create_thread+0x74>)
 80001e0:	0892      	lsrs	r2, r2, #2
 80001e2:	1812      	adds	r2, r2, r0
 80001e4:	0092      	lsls	r2, r2, #2
 80001e6:	1888      	adds	r0, r1, r2
 80001e8:	1c17      	adds	r7, r2, #0
 80001ea:	9002      	str	r0, [sp, #8]
 80001ec:	1c10      	adds	r0, r2, #0
 80001ee:	323c      	adds	r2, #60	; 0x3c
 80001f0:	188a      	adds	r2, r1, r2
 80001f2:	3034      	adds	r0, #52	; 0x34
 80001f4:	3738      	adds	r7, #56	; 0x38
 80001f6:	9201      	str	r2, [sp, #4]
 80001f8:	180e      	adds	r6, r1, r0
 80001fa:	19cf      	adds	r7, r1, r7
 80001fc:	2200      	movs	r2, #0
 80001fe:	b672      	cpsid	i
 8000200:	250c      	movs	r5, #12
 8000202:	4355      	muls	r5, r2
 8000204:	4c12      	ldr	r4, [pc, #72]	; (8000250 <create_thread+0x78>)
 8000206:	2008      	movs	r0, #8
 8000208:	1965      	adds	r5, r4, r5
 800020a:	6869      	ldr	r1, [r5, #4]
 800020c:	07c9      	lsls	r1, r1, #31
 800020e:	d415      	bmi.n	800023c <create_thread+0x64>
 8000210:	9902      	ldr	r1, [sp, #8]
 8000212:	60a9      	str	r1, [r5, #8]
 8000214:	4d0f      	ldr	r5, [pc, #60]	; (8000254 <create_thread+0x7c>)
 8000216:	9903      	ldr	r1, [sp, #12]
 8000218:	6035      	str	r5, [r6, #0]
 800021a:	6039      	str	r1, [r7, #0]
 800021c:	2584      	movs	r5, #132	; 0x84
 800021e:	9901      	ldr	r1, [sp, #4]
 8000220:	05ad      	lsls	r5, r5, #22
 8000222:	600d      	str	r5, [r1, #0]
 8000224:	2b07      	cmp	r3, #7
 8000226:	d800      	bhi.n	800022a <create_thread+0x52>
 8000228:	1c03      	adds	r3, r0, #0
 800022a:	200c      	movs	r0, #12
 800022c:	4350      	muls	r0, r2
 800022e:	4908      	ldr	r1, [pc, #32]	; (8000250 <create_thread+0x78>)
 8000230:	180d      	adds	r5, r1, r0
 8000232:	806b      	strh	r3, [r5, #2]
 8000234:	5223      	strh	r3, [r4, r0]
 8000236:	2001      	movs	r0, #1
 8000238:	6068      	str	r0, [r5, #4]
 800023a:	1c10      	adds	r0, r2, #0
 800023c:	b662      	cpsie	i
 800023e:	3201      	adds	r2, #1
 8000240:	2a08      	cmp	r2, #8
 8000242:	d001      	beq.n	8000248 <create_thread+0x70>
 8000244:	2808      	cmp	r0, #8
 8000246:	d0da      	beq.n	80001fe <create_thread+0x26>
 8000248:	b005      	add	sp, #20
 800024a:	bdf0      	pop	{r4, r5, r6, r7, pc}
 800024c:	3ffffff0 	.word	0x3ffffff0
 8000250:	20000008 	.word	0x20000008
 8000254:	080000c1 	.word	0x080000c1

08000258 <kernel_init>:
 8000258:	b510      	push	{r4, lr}
 800025a:	2300      	movs	r3, #0
 800025c:	210c      	movs	r1, #12
 800025e:	4359      	muls	r1, r3
 8000260:	4a0a      	ldr	r2, [pc, #40]	; (800028c <kernel_init+0x34>)
 8000262:	2000      	movs	r0, #0
 8000264:	1854      	adds	r4, r2, r1
 8000266:	6060      	str	r0, [r4, #4]
 8000268:	3301      	adds	r3, #1
 800026a:	2008      	movs	r0, #8
 800026c:	8060      	strh	r0, [r4, #2]
 800026e:	5288      	strh	r0, [r1, r2]
 8000270:	4283      	cmp	r3, r0
 8000272:	d1f3      	bne.n	800025c <kernel_init+0x4>
 8000274:	4b06      	ldr	r3, [pc, #24]	; (8000290 <kernel_init+0x38>)
 8000276:	2201      	movs	r2, #1
 8000278:	4252      	negs	r2, r2
 800027a:	601a      	str	r2, [r3, #0]
 800027c:	4905      	ldr	r1, [pc, #20]	; (8000294 <kernel_init+0x3c>)
 800027e:	2280      	movs	r2, #128	; 0x80
 8000280:	23ff      	movs	r3, #255	; 0xff
 8000282:	4805      	ldr	r0, [pc, #20]	; (8000298 <kernel_init+0x40>)
 8000284:	f7ff ffa8 	bl	80001d8 <create_thread>
 8000288:	bd10      	pop	{r4, pc}
 800028a:	46c0      	nop			; (mov r8, r8)
 800028c:	20000008 	.word	0x20000008
 8000290:	20000068 	.word	0x20000068
 8000294:	2000006c 	.word	0x2000006c
 8000298:	080000e1 	.word	0x080000e1

0800029c <set_wait_state>:
 800029c:	b507      	push	{r0, r1, r2, lr}
 800029e:	f7ff ff89 	bl	80001b4 <get_thread_id>
 80002a2:	9000      	str	r0, [sp, #0]
 80002a4:	b672      	cpsid	i
 80002a6:	9a00      	ldr	r2, [sp, #0]
 80002a8:	210c      	movs	r1, #12
 80002aa:	434a      	muls	r2, r1
 80002ac:	4b0b      	ldr	r3, [pc, #44]	; (80002dc <set_wait_state+0x40>)
 80002ae:	2002      	movs	r0, #2
 80002b0:	189a      	adds	r2, r3, r2
 80002b2:	6851      	ldr	r1, [r2, #4]
 80002b4:	4301      	orrs	r1, r0
 80002b6:	6051      	str	r1, [r2, #4]
 80002b8:	1c19      	adds	r1, r3, #0
 80002ba:	b672      	cpsid	i
 80002bc:	9b00      	ldr	r3, [sp, #0]
 80002be:	220c      	movs	r2, #12
 80002c0:	4353      	muls	r3, r2
 80002c2:	18cb      	adds	r3, r1, r3
 80002c4:	685b      	ldr	r3, [r3, #4]
 80002c6:	9301      	str	r3, [sp, #4]
 80002c8:	b662      	cpsie	i
 80002ca:	9a01      	ldr	r2, [sp, #4]
 80002cc:	2302      	movs	r3, #2
 80002ce:	421a      	tst	r2, r3
 80002d0:	d000      	beq.n	80002d4 <set_wait_state+0x38>
 80002d2:	46c0      	nop			; (mov r8, r8)
 80002d4:	9a01      	ldr	r2, [sp, #4]
 80002d6:	421a      	tst	r2, r3
 80002d8:	d1ef      	bne.n	80002ba <set_wait_state+0x1e>
 80002da:	bd07      	pop	{r0, r1, r2, pc}
 80002dc:	20000008 	.word	0x20000008

080002e0 <wake_up_threads>:
 80002e0:	2300      	movs	r3, #0
 80002e2:	b672      	cpsid	i
 80002e4:	220c      	movs	r2, #12
 80002e6:	435a      	muls	r2, r3
 80002e8:	4905      	ldr	r1, [pc, #20]	; (8000300 <wake_up_threads+0x20>)
 80002ea:	2002      	movs	r0, #2
 80002ec:	188a      	adds	r2, r1, r2
 80002ee:	6851      	ldr	r1, [r2, #4]
 80002f0:	4381      	bics	r1, r0
 80002f2:	6051      	str	r1, [r2, #4]
 80002f4:	b662      	cpsie	i
 80002f6:	3301      	adds	r3, #1
 80002f8:	2b08      	cmp	r3, #8
 80002fa:	d1f2      	bne.n	80002e2 <wake_up_threads+0x2>
 80002fc:	4770      	bx	lr
 80002fe:	46c0      	nop			; (mov r8, r8)
 8000300:	20000008 	.word	0x20000008

08000304 <messages_init>:
 8000304:	b510      	push	{r4, lr}
 8000306:	2200      	movs	r2, #0
 8000308:	4909      	ldr	r1, [pc, #36]	; (8000330 <messages_init+0x2c>)
 800030a:	0090      	lsls	r0, r2, #2
 800030c:	2300      	movs	r3, #0
 800030e:	3201      	adds	r2, #1
 8000310:	5043      	str	r3, [r0, r1]
 8000312:	2a08      	cmp	r2, #8
 8000314:	d1f8      	bne.n	8000308 <messages_init+0x4>
 8000316:	4807      	ldr	r0, [pc, #28]	; (8000334 <messages_init+0x30>)
 8000318:	011c      	lsls	r4, r3, #4
 800031a:	2200      	movs	r2, #0
 800031c:	1901      	adds	r1, r0, r4
 800031e:	3301      	adds	r3, #1
 8000320:	604a      	str	r2, [r1, #4]
 8000322:	5022      	str	r2, [r4, r0]
 8000324:	60ca      	str	r2, [r1, #12]
 8000326:	608a      	str	r2, [r1, #8]
 8000328:	2b04      	cmp	r3, #4
 800032a:	d1f4      	bne.n	8000316 <messages_init+0x12>
 800032c:	bd10      	pop	{r4, pc}
 800032e:	46c0      	nop			; (mov r8, r8)
 8000330:	200000ec 	.word	0x200000ec
 8000334:	2000010c 	.word	0x2000010c

08000338 <putc_>:
 8000338:	b538      	push	{r3, r4, r5, lr}
 800033a:	4c06      	ldr	r4, [pc, #24]	; (8000354 <putc_+0x1c>)
 800033c:	1c05      	adds	r5, r0, #0
 800033e:	1c20      	adds	r0, r4, #0
 8000340:	f000 f8ff 	bl	8000542 <mutex_lock>
 8000344:	1c28      	adds	r0, r5, #0
 8000346:	f000 fa65 	bl	8000814 <uart_write>
 800034a:	1c20      	adds	r0, r4, #0
 800034c:	f000 f915 	bl	800057a <mutex_unlock>
 8000350:	bd38      	pop	{r3, r4, r5, pc}
 8000352:	46c0      	nop			; (mov r8, r8)
 8000354:	2000014c 	.word	0x2000014c

08000358 <puts_>:
 8000358:	b538      	push	{r3, r4, r5, lr}
 800035a:	4d08      	ldr	r5, [pc, #32]	; (800037c <puts_+0x24>)
 800035c:	1c04      	adds	r4, r0, #0
 800035e:	1c28      	adds	r0, r5, #0
 8000360:	f000 f8ef 	bl	8000542 <mutex_lock>
 8000364:	3401      	adds	r4, #1
 8000366:	1e63      	subs	r3, r4, #1
 8000368:	7818      	ldrb	r0, [r3, #0]
 800036a:	2800      	cmp	r0, #0
 800036c:	d002      	beq.n	8000374 <puts_+0x1c>
 800036e:	f7ff ffe3 	bl	8000338 <putc_>
 8000372:	e7f7      	b.n	8000364 <puts_+0xc>
 8000374:	1c28      	adds	r0, r5, #0
 8000376:	f000 f900 	bl	800057a <mutex_unlock>
 800037a:	bd38      	pop	{r3, r4, r5, pc}
 800037c:	20000158 	.word	0x20000158

08000380 <puti_>:
 8000380:	b5f0      	push	{r4, r5, r6, r7, lr}
 8000382:	2300      	movs	r3, #0
 8000384:	b085      	sub	sp, #20
 8000386:	1c04      	adds	r4, r0, #0
 8000388:	1c1f      	adds	r7, r3, #0
 800038a:	4298      	cmp	r0, r3
 800038c:	da01      	bge.n	8000392 <puti_+0x12>
 800038e:	4244      	negs	r4, r0
 8000390:	2701      	movs	r7, #1
 8000392:	ae01      	add	r6, sp, #4
 8000394:	72f3      	strb	r3, [r6, #11]
 8000396:	250a      	movs	r5, #10
 8000398:	1c20      	adds	r0, r4, #0
 800039a:	210a      	movs	r1, #10
 800039c:	f001 f85a 	bl	8001454 <__aeabi_idivmod>
 80003a0:	3130      	adds	r1, #48	; 0x30
 80003a2:	5571      	strb	r1, [r6, r5]
 80003a4:	1c20      	adds	r0, r4, #0
 80003a6:	210a      	movs	r1, #10
 80003a8:	f000 fffe 	bl	80013a8 <__aeabi_idiv>
 80003ac:	1e6b      	subs	r3, r5, #1
 80003ae:	1e04      	subs	r4, r0, #0
 80003b0:	d001      	beq.n	80003b6 <puti_+0x36>
 80003b2:	1c1d      	adds	r5, r3, #0
 80003b4:	e7f0      	b.n	8000398 <puti_+0x18>
 80003b6:	2f00      	cmp	r7, #0
 80003b8:	d002      	beq.n	80003c0 <puti_+0x40>
 80003ba:	222d      	movs	r2, #45	; 0x2d
 80003bc:	54f2      	strb	r2, [r6, r3]
 80003be:	1c1d      	adds	r5, r3, #0
 80003c0:	1970      	adds	r0, r6, r5
 80003c2:	f7ff ffc9 	bl	8000358 <puts_>
 80003c6:	b005      	add	sp, #20
 80003c8:	bdf0      	pop	{r4, r5, r6, r7, pc}

080003ca <putui_>:
 80003ca:	b57f      	push	{r0, r1, r2, r3, r4, r5, r6, lr}
 80003cc:	2300      	movs	r3, #0
 80003ce:	ae01      	add	r6, sp, #4
 80003d0:	1c05      	adds	r5, r0, #0
 80003d2:	72f3      	strb	r3, [r6, #11]
 80003d4:	240a      	movs	r4, #10
 80003d6:	1c28      	adds	r0, r5, #0
 80003d8:	210a      	movs	r1, #10
 80003da:	f000 ffdb 	bl	8001394 <__aeabi_uidivmod>
 80003de:	3130      	adds	r1, #48	; 0x30
 80003e0:	5531      	strb	r1, [r6, r4]
 80003e2:	1c28      	adds	r0, r5, #0
 80003e4:	210a      	movs	r1, #10
 80003e6:	f000 ff91 	bl	800130c <__aeabi_uidiv>
 80003ea:	1e63      	subs	r3, r4, #1
 80003ec:	1e05      	subs	r5, r0, #0
 80003ee:	d001      	beq.n	80003f4 <putui_+0x2a>
 80003f0:	1c1c      	adds	r4, r3, #0
 80003f2:	e7f0      	b.n	80003d6 <putui_+0xc>
 80003f4:	1930      	adds	r0, r6, r4
 80003f6:	f7ff ffaf 	bl	8000358 <puts_>
 80003fa:	bd7f      	pop	{r0, r1, r2, r3, r4, r5, r6, pc}

080003fc <putx_>:
 80003fc:	b51f      	push	{r0, r1, r2, r3, r4, lr}
 80003fe:	2300      	movs	r3, #0
 8000400:	aa01      	add	r2, sp, #4
 8000402:	72d3      	strb	r3, [r2, #11]
 8000404:	230a      	movs	r3, #10
 8000406:	210f      	movs	r1, #15
 8000408:	4001      	ands	r1, r0
 800040a:	2909      	cmp	r1, #9
 800040c:	d801      	bhi.n	8000412 <putx_+0x16>
 800040e:	3130      	adds	r1, #48	; 0x30
 8000410:	e000      	b.n	8000414 <putx_+0x18>
 8000412:	3157      	adds	r1, #87	; 0x57
 8000414:	54d1      	strb	r1, [r2, r3]
 8000416:	0900      	lsrs	r0, r0, #4
 8000418:	1e59      	subs	r1, r3, #1
 800041a:	2800      	cmp	r0, #0
 800041c:	d001      	beq.n	8000422 <putx_+0x26>
 800041e:	1c0b      	adds	r3, r1, #0
 8000420:	e7f1      	b.n	8000406 <putx_+0xa>
 8000422:	18d0      	adds	r0, r2, r3
 8000424:	f7ff ff98 	bl	8000358 <puts_>
 8000428:	b005      	add	sp, #20
 800042a:	bd00      	pop	{pc}

0800042c <printf_>:
 800042c:	b40f      	push	{r0, r1, r2, r3}
 800042e:	b573      	push	{r0, r1, r4, r5, r6, lr}
 8000430:	4e25      	ldr	r6, [pc, #148]	; (80004c8 <printf_+0x9c>)
 8000432:	ac06      	add	r4, sp, #24
 8000434:	cc20      	ldmia	r4!, {r5}
 8000436:	1c30      	adds	r0, r6, #0
 8000438:	f000 f883 	bl	8000542 <mutex_lock>
 800043c:	9401      	str	r4, [sp, #4]
 800043e:	2400      	movs	r4, #0
 8000440:	5d28      	ldrb	r0, [r5, r4]
 8000442:	2800      	cmp	r0, #0
 8000444:	d039      	beq.n	80004ba <printf_+0x8e>
 8000446:	2825      	cmp	r0, #37	; 0x25
 8000448:	d003      	beq.n	8000452 <printf_+0x26>
 800044a:	f7ff ff75 	bl	8000338 <putc_>
 800044e:	3401      	adds	r4, #1
 8000450:	e7f6      	b.n	8000440 <printf_+0x14>
 8000452:	192b      	adds	r3, r5, r4
 8000454:	7858      	ldrb	r0, [r3, #1]
 8000456:	2869      	cmp	r0, #105	; 0x69
 8000458:	d016      	beq.n	8000488 <printf_+0x5c>
 800045a:	d808      	bhi.n	800046e <printf_+0x42>
 800045c:	2825      	cmp	r0, #37	; 0x25
 800045e:	d028      	beq.n	80004b2 <printf_+0x86>
 8000460:	2863      	cmp	r0, #99	; 0x63
 8000462:	d128      	bne.n	80004b6 <printf_+0x8a>
 8000464:	9b01      	ldr	r3, [sp, #4]
 8000466:	1d1a      	adds	r2, r3, #4
 8000468:	9201      	str	r2, [sp, #4]
 800046a:	7818      	ldrb	r0, [r3, #0]
 800046c:	e021      	b.n	80004b2 <printf_+0x86>
 800046e:	2875      	cmp	r0, #117	; 0x75
 8000470:	d011      	beq.n	8000496 <printf_+0x6a>
 8000472:	2878      	cmp	r0, #120	; 0x78
 8000474:	d016      	beq.n	80004a4 <printf_+0x78>
 8000476:	2873      	cmp	r0, #115	; 0x73
 8000478:	d11d      	bne.n	80004b6 <printf_+0x8a>
 800047a:	9b01      	ldr	r3, [sp, #4]
 800047c:	1d1a      	adds	r2, r3, #4
 800047e:	6818      	ldr	r0, [r3, #0]
 8000480:	9201      	str	r2, [sp, #4]
 8000482:	f7ff ff69 	bl	8000358 <puts_>
 8000486:	e016      	b.n	80004b6 <printf_+0x8a>
 8000488:	9b01      	ldr	r3, [sp, #4]
 800048a:	1d1a      	adds	r2, r3, #4
 800048c:	6818      	ldr	r0, [r3, #0]
 800048e:	9201      	str	r2, [sp, #4]
 8000490:	f7ff ff76 	bl	8000380 <puti_>
 8000494:	e00f      	b.n	80004b6 <printf_+0x8a>
 8000496:	9b01      	ldr	r3, [sp, #4]
 8000498:	1d1a      	adds	r2, r3, #4
 800049a:	6818      	ldr	r0, [r3, #0]
 800049c:	9201      	str	r2, [sp, #4]
 800049e:	f7ff ff94 	bl	80003ca <putui_>
 80004a2:	e008      	b.n	80004b6 <printf_+0x8a>
 80004a4:	9b01      	ldr	r3, [sp, #4]
 80004a6:	1d1a      	adds	r2, r3, #4
 80004a8:	6818      	ldr	r0, [r3, #0]
 80004aa:	9201      	str	r2, [sp, #4]
 80004ac:	f7ff ffa6 	bl	80003fc <putx_>
 80004b0:	e001      	b.n	80004b6 <printf_+0x8a>
 80004b2:	f7ff ff41 	bl	8000338 <putc_>
 80004b6:	3402      	adds	r4, #2
 80004b8:	e7c2      	b.n	8000440 <printf_+0x14>
 80004ba:	1c30      	adds	r0, r6, #0
 80004bc:	f000 f85d 	bl	800057a <mutex_unlock>
 80004c0:	bc73      	pop	{r0, r1, r4, r5, r6}
 80004c2:	bc08      	pop	{r3}
 80004c4:	b004      	add	sp, #16
 80004c6:	4718      	bx	r3
 80004c8:	20000154 	.word	0x20000154

080004cc <stdio_init>:
 80004cc:	b510      	push	{r4, lr}
 80004ce:	480f      	ldr	r0, [pc, #60]	; (800050c <stdio_init+0x40>)
 80004d0:	f000 f82e 	bl	8000530 <mutex_init>
 80004d4:	480e      	ldr	r0, [pc, #56]	; (8000510 <stdio_init+0x44>)
 80004d6:	f000 f82b 	bl	8000530 <mutex_init>
 80004da:	480e      	ldr	r0, [pc, #56]	; (8000514 <stdio_init+0x48>)
 80004dc:	f000 f828 	bl	8000530 <mutex_init>
 80004e0:	480d      	ldr	r0, [pc, #52]	; (8000518 <stdio_init+0x4c>)
 80004e2:	f000 f825 	bl	8000530 <mutex_init>
 80004e6:	2408      	movs	r4, #8
 80004e8:	2020      	movs	r0, #32
 80004ea:	3c01      	subs	r4, #1
 80004ec:	f7ff ff24 	bl	8000338 <putc_>
 80004f0:	2c00      	cmp	r4, #0
 80004f2:	d1f9      	bne.n	80004e8 <stdio_init+0x1c>
 80004f4:	2420      	movs	r4, #32
 80004f6:	200a      	movs	r0, #10
 80004f8:	3c01      	subs	r4, #1
 80004fa:	f7ff ff1d 	bl	8000338 <putc_>
 80004fe:	2c00      	cmp	r4, #0
 8000500:	d1f9      	bne.n	80004f6 <stdio_init+0x2a>
 8000502:	4806      	ldr	r0, [pc, #24]	; (800051c <stdio_init+0x50>)
 8000504:	f7ff ff92 	bl	800042c <printf_>
 8000508:	bd10      	pop	{r4, pc}
 800050a:	46c0      	nop			; (mov r8, r8)
 800050c:	2000014c 	.word	0x2000014c
 8000510:	20000150 	.word	0x20000150
 8000514:	20000158 	.word	0x20000158
 8000518:	20000154 	.word	0x20000154
 800051c:	08001520 	.word	0x08001520

08000520 <lib_os_init>:
 8000520:	b508      	push	{r3, lr}
 8000522:	f7ff fe99 	bl	8000258 <kernel_init>
 8000526:	f7ff feed 	bl	8000304 <messages_init>
 800052a:	f7ff ffcf 	bl	80004cc <stdio_init>
 800052e:	bd08      	pop	{r3, pc}

08000530 <mutex_init>:
 8000530:	b510      	push	{r4, lr}
 8000532:	1c04      	adds	r4, r0, #0
 8000534:	f7ff fe38 	bl	80001a8 <sched_off>
 8000538:	2300      	movs	r3, #0
 800053a:	6023      	str	r3, [r4, #0]
 800053c:	f7ff fe36 	bl	80001ac <sched_on>
 8000540:	bd10      	pop	{r4, pc}

08000542 <mutex_lock>:
 8000542:	b513      	push	{r0, r1, r4, lr}
 8000544:	1c04      	adds	r4, r0, #0
 8000546:	f7ff fe2f 	bl	80001a8 <sched_off>
 800054a:	6823      	ldr	r3, [r4, #0]
 800054c:	9301      	str	r3, [sp, #4]
 800054e:	f7ff fe2d 	bl	80001ac <sched_on>
 8000552:	9b01      	ldr	r3, [sp, #4]
 8000554:	2b00      	cmp	r3, #0
 8000556:	d001      	beq.n	800055c <mutex_lock+0x1a>
 8000558:	f7ff fea0 	bl	800029c <set_wait_state>
 800055c:	9b01      	ldr	r3, [sp, #4]
 800055e:	2b00      	cmp	r3, #0
 8000560:	d1f1      	bne.n	8000546 <mutex_lock+0x4>
 8000562:	f7ff fe21 	bl	80001a8 <sched_off>
 8000566:	6823      	ldr	r3, [r4, #0]
 8000568:	9301      	str	r3, [sp, #4]
 800056a:	9b01      	ldr	r3, [sp, #4]
 800056c:	2b00      	cmp	r3, #0
 800056e:	d1ea      	bne.n	8000546 <mutex_lock+0x4>
 8000570:	2301      	movs	r3, #1
 8000572:	6023      	str	r3, [r4, #0]
 8000574:	f7ff fe1a 	bl	80001ac <sched_on>
 8000578:	bd13      	pop	{r0, r1, r4, pc}

0800057a <mutex_unlock>:
 800057a:	b508      	push	{r3, lr}
 800057c:	f7ff ffd8 	bl	8000530 <mutex_init>
 8000580:	f7ff feae 	bl	80002e0 <wake_up_threads>
 8000584:	f7ff fe14 	bl	80001b0 <yield>
 8000588:	bd08      	pop	{r3, pc}
	...

0800058c <hmc5883_init>:
 800058c:	b510      	push	{r4, lr}
 800058e:	4b16      	ldr	r3, [pc, #88]	; (80005e8 <hmc5883_init+0x5c>)
 8000590:	2400      	movs	r4, #0
 8000592:	203c      	movs	r0, #60	; 0x3c
 8000594:	1c21      	adds	r1, r4, #0
 8000596:	2218      	movs	r2, #24
 8000598:	801c      	strh	r4, [r3, #0]
 800059a:	805c      	strh	r4, [r3, #2]
 800059c:	809c      	strh	r4, [r3, #4]
 800059e:	f000 f983 	bl	80008a8 <i2c_write_reg>
 80005a2:	203c      	movs	r0, #60	; 0x3c
 80005a4:	2101      	movs	r1, #1
 80005a6:	2280      	movs	r2, #128	; 0x80
 80005a8:	f000 f97e 	bl	80008a8 <i2c_write_reg>
 80005ac:	203c      	movs	r0, #60	; 0x3c
 80005ae:	2102      	movs	r1, #2
 80005b0:	1c22      	adds	r2, r4, #0
 80005b2:	f000 f979 	bl	80008a8 <i2c_write_reg>
 80005b6:	203c      	movs	r0, #60	; 0x3c
 80005b8:	210a      	movs	r1, #10
 80005ba:	f000 f976 	bl	80008aa <i2c_read_reg>
 80005be:	2301      	movs	r3, #1
 80005c0:	2848      	cmp	r0, #72	; 0x48
 80005c2:	d10f      	bne.n	80005e4 <hmc5883_init+0x58>
 80005c4:	203c      	movs	r0, #60	; 0x3c
 80005c6:	210b      	movs	r1, #11
 80005c8:	f000 f96f 	bl	80008aa <i2c_read_reg>
 80005cc:	2302      	movs	r3, #2
 80005ce:	2834      	cmp	r0, #52	; 0x34
 80005d0:	d108      	bne.n	80005e4 <hmc5883_init+0x58>
 80005d2:	203c      	movs	r0, #60	; 0x3c
 80005d4:	210c      	movs	r1, #12
 80005d6:	f000 f968 	bl	80008aa <i2c_read_reg>
 80005da:	2833      	cmp	r0, #51	; 0x33
 80005dc:	d001      	beq.n	80005e2 <hmc5883_init+0x56>
 80005de:	2303      	movs	r3, #3
 80005e0:	e000      	b.n	80005e4 <hmc5883_init+0x58>
 80005e2:	1c23      	adds	r3, r4, #0
 80005e4:	1c18      	adds	r0, r3, #0
 80005e6:	bd10      	pop	{r4, pc}
 80005e8:	2000015c 	.word	0x2000015c

080005ec <hmc5883_read>:
 80005ec:	b538      	push	{r3, r4, r5, lr}
 80005ee:	2103      	movs	r1, #3
 80005f0:	203c      	movs	r0, #60	; 0x3c
 80005f2:	f000 f95a 	bl	80008aa <i2c_read_reg>
 80005f6:	4c12      	ldr	r4, [pc, #72]	; (8000640 <hmc5883_read+0x54>)
 80005f8:	0205      	lsls	r5, r0, #8
 80005fa:	b2ad      	uxth	r5, r5
 80005fc:	2104      	movs	r1, #4
 80005fe:	203c      	movs	r0, #60	; 0x3c
 8000600:	8025      	strh	r5, [r4, #0]
 8000602:	f000 f952 	bl	80008aa <i2c_read_reg>
 8000606:	2107      	movs	r1, #7
 8000608:	4305      	orrs	r5, r0
 800060a:	203c      	movs	r0, #60	; 0x3c
 800060c:	8025      	strh	r5, [r4, #0]
 800060e:	f000 f94c 	bl	80008aa <i2c_read_reg>
 8000612:	0205      	lsls	r5, r0, #8
 8000614:	b2ad      	uxth	r5, r5
 8000616:	2108      	movs	r1, #8
 8000618:	203c      	movs	r0, #60	; 0x3c
 800061a:	8065      	strh	r5, [r4, #2]
 800061c:	f000 f945 	bl	80008aa <i2c_read_reg>
 8000620:	2105      	movs	r1, #5
 8000622:	4305      	orrs	r5, r0
 8000624:	203c      	movs	r0, #60	; 0x3c
 8000626:	8065      	strh	r5, [r4, #2]
 8000628:	f000 f93f 	bl	80008aa <i2c_read_reg>
 800062c:	0205      	lsls	r5, r0, #8
 800062e:	b2ad      	uxth	r5, r5
 8000630:	2106      	movs	r1, #6
 8000632:	203c      	movs	r0, #60	; 0x3c
 8000634:	80a5      	strh	r5, [r4, #4]
 8000636:	f000 f938 	bl	80008aa <i2c_read_reg>
 800063a:	4305      	orrs	r5, r0
 800063c:	80a5      	strh	r5, [r4, #4]
 800063e:	bd38      	pop	{r3, r4, r5, pc}
 8000640:	2000015c 	.word	0x2000015c

08000644 <main_thread>:
 8000644:	b510      	push	{r4, lr}
 8000646:	2008      	movs	r0, #8
 8000648:	f000 fe1e 	bl	8001288 <led_on>
 800064c:	480c      	ldr	r0, [pc, #48]	; (8000680 <main_thread+0x3c>)
 800064e:	f7ff feed 	bl	800042c <printf_>
 8000652:	f7ff ff9b 	bl	800058c <hmc5883_init>
 8000656:	1c04      	adds	r4, r0, #0
 8000658:	2008      	movs	r0, #8
 800065a:	f000 fe15 	bl	8001288 <led_on>
 800065e:	f7ff ffc5 	bl	80005ec <hmc5883_read>
 8000662:	4b08      	ldr	r3, [pc, #32]	; (8000684 <main_thread+0x40>)
 8000664:	4808      	ldr	r0, [pc, #32]	; (8000688 <main_thread+0x44>)
 8000666:	2104      	movs	r1, #4
 8000668:	5e5a      	ldrsh	r2, [r3, r1]
 800066a:	1c21      	adds	r1, r4, #0
 800066c:	f7ff fede 	bl	800042c <printf_>
 8000670:	2008      	movs	r0, #8
 8000672:	f000 fe0f 	bl	8001294 <led_off>
 8000676:	2064      	movs	r0, #100	; 0x64
 8000678:	f000 f8ba 	bl	80007f0 <timer_delay_ms>
 800067c:	e7ec      	b.n	8000658 <main_thread+0x14>
 800067e:	46c0      	nop			; (mov r8, r8)
 8000680:	08001531 	.word	0x08001531
 8000684:	2000015c 	.word	0x2000015c
 8000688:	0800156c 	.word	0x0800156c

0800068c <mem_info_print>:
 800068c:	b538      	push	{r3, r4, r5, lr}
 800068e:	490e      	ldr	r1, [pc, #56]	; (80006c8 <mem_info_print+0x3c>)
 8000690:	480e      	ldr	r0, [pc, #56]	; (80006cc <mem_info_print+0x40>)
 8000692:	f7ff fecb 	bl	800042c <printf_>
 8000696:	4c0e      	ldr	r4, [pc, #56]	; (80006d0 <mem_info_print+0x44>)
 8000698:	480e      	ldr	r0, [pc, #56]	; (80006d4 <mem_info_print+0x48>)
 800069a:	1c21      	adds	r1, r4, #0
 800069c:	f7ff fec6 	bl	800042c <printf_>
 80006a0:	4d0d      	ldr	r5, [pc, #52]	; (80006d8 <mem_info_print+0x4c>)
 80006a2:	480e      	ldr	r0, [pc, #56]	; (80006dc <mem_info_print+0x50>)
 80006a4:	1b2d      	subs	r5, r5, r4
 80006a6:	1c29      	adds	r1, r5, #0
 80006a8:	f7ff fec0 	bl	800042c <printf_>
 80006ac:	490c      	ldr	r1, [pc, #48]	; (80006e0 <mem_info_print+0x54>)
 80006ae:	480d      	ldr	r0, [pc, #52]	; (80006e4 <mem_info_print+0x58>)
 80006b0:	1a64      	subs	r4, r4, r1
 80006b2:	1929      	adds	r1, r5, r4
 80006b4:	f7ff feba 	bl	800042c <printf_>
 80006b8:	490b      	ldr	r1, [pc, #44]	; (80006e8 <mem_info_print+0x5c>)
 80006ba:	480c      	ldr	r0, [pc, #48]	; (80006ec <mem_info_print+0x60>)
 80006bc:	f7ff feb6 	bl	800042c <printf_>
 80006c0:	480b      	ldr	r0, [pc, #44]	; (80006f0 <mem_info_print+0x64>)
 80006c2:	f7ff feb3 	bl	800042c <printf_>
 80006c6:	bd38      	pop	{r3, r4, r5, pc}
 80006c8:	08001508 	.word	0x08001508
 80006cc:	08001576 	.word	0x08001576
 80006d0:	20000000 	.word	0x20000000
 80006d4:	08001587 	.word	0x08001587
 80006d8:	20002000 	.word	0x20002000
 80006dc:	08001596 	.word	0x08001596
 80006e0:	200009b8 	.word	0x200009b8
 80006e4:	080015a4 	.word	0x080015a4
 80006e8:	200009b8 	.word	0x200009b8
 80006ec:	080015b2 	.word	0x080015b2
 80006f0:	080015c2 	.word	0x080015c2

080006f4 <main>:
 80006f4:	b508      	push	{r3, lr}
 80006f6:	f000 fda3 	bl	8001240 <lib_low_level_init>
 80006fa:	f7ff ff11 	bl	8000520 <lib_os_init>
 80006fe:	f7ff ffc5 	bl	800068c <mem_info_print>
 8000702:	2280      	movs	r2, #128	; 0x80
 8000704:	4904      	ldr	r1, [pc, #16]	; (8000718 <main+0x24>)
 8000706:	00d2      	lsls	r2, r2, #3
 8000708:	2308      	movs	r3, #8
 800070a:	4804      	ldr	r0, [pc, #16]	; (800071c <main+0x28>)
 800070c:	f7ff fd64 	bl	80001d8 <create_thread>
 8000710:	f7ff fd5c 	bl	80001cc <kernel_start>
 8000714:	2000      	movs	r0, #0
 8000716:	bd08      	pop	{r3, pc}
 8000718:	20000564 	.word	0x20000564
 800071c:	08000645 	.word	0x08000645

08000720 <timer_init>:
 8000720:	b510      	push	{r4, lr}
 8000722:	2200      	movs	r2, #0
 8000724:	4813      	ldr	r0, [pc, #76]	; (8000774 <timer_init+0x54>)
 8000726:	2380      	movs	r3, #128	; 0x80
 8000728:	0051      	lsls	r1, r2, #1
 800072a:	00db      	lsls	r3, r3, #3
 800072c:	520b      	strh	r3, [r1, r0]
 800072e:	4812      	ldr	r0, [pc, #72]	; (8000778 <timer_init+0x58>)
 8000730:	3201      	adds	r2, #1
 8000732:	520b      	strh	r3, [r1, r0]
 8000734:	4811      	ldr	r0, [pc, #68]	; (800077c <timer_init+0x5c>)
 8000736:	2300      	movs	r3, #0
 8000738:	520b      	strh	r3, [r1, r0]
 800073a:	2a04      	cmp	r2, #4
 800073c:	d1f2      	bne.n	8000724 <timer_init+0x4>
 800073e:	4a10      	ldr	r2, [pc, #64]	; (8000780 <timer_init+0x60>)
 8000740:	2001      	movs	r0, #1
 8000742:	6013      	str	r3, [r2, #0]
 8000744:	4a0f      	ldr	r2, [pc, #60]	; (8000784 <timer_init+0x64>)
 8000746:	4c10      	ldr	r4, [pc, #64]	; (8000788 <timer_init+0x68>)
 8000748:	6b91      	ldr	r1, [r2, #56]	; 0x38
 800074a:	4301      	orrs	r1, r0
 800074c:	6391      	str	r1, [r2, #56]	; 0x38
 800074e:	2280      	movs	r2, #128	; 0x80
 8000750:	05d2      	lsls	r2, r2, #23
 8000752:	6022      	str	r2, [r4, #0]
 8000754:	22f9      	movs	r2, #249	; 0xf9
 8000756:	60e2      	str	r2, [r4, #12]
 8000758:	1c20      	adds	r0, r4, #0
 800075a:	2208      	movs	r2, #8
 800075c:	6062      	str	r2, [r4, #4]
 800075e:	6123      	str	r3, [r4, #16]
 8000760:	60a3      	str	r3, [r4, #8]
 8000762:	f000 f93a 	bl	80009da <HAL_TIM_Base_Init>
 8000766:	1c20      	adds	r0, r4, #0
 8000768:	f000 f953 	bl	8000a12 <HAL_TIM_Base_Start_IT>
 800076c:	200f      	movs	r0, #15
 800076e:	f000 f8e3 	bl	8000938 <HAL_NVIC_EnableIRQ>
 8000772:	bd10      	pop	{r4, pc}
 8000774:	20000978 	.word	0x20000978
 8000778:	2000096c 	.word	0x2000096c
 800077c:	20000964 	.word	0x20000964
 8000780:	20000974 	.word	0x20000974
 8000784:	40021000 	.word	0x40021000
 8000788:	20000980 	.word	0x20000980

0800078c <TIM2_IRQHandler>:
 800078c:	2200      	movs	r2, #0
 800078e:	490e      	ldr	r1, [pc, #56]	; (80007c8 <TIM2_IRQHandler+0x3c>)
 8000790:	0053      	lsls	r3, r2, #1
 8000792:	5a58      	ldrh	r0, [r3, r1]
 8000794:	2800      	cmp	r0, #0
 8000796:	d003      	beq.n	80007a0 <TIM2_IRQHandler+0x14>
 8000798:	5a58      	ldrh	r0, [r3, r1]
 800079a:	3801      	subs	r0, #1
 800079c:	b280      	uxth	r0, r0
 800079e:	e005      	b.n	80007ac <TIM2_IRQHandler+0x20>
 80007a0:	480a      	ldr	r0, [pc, #40]	; (80007cc <TIM2_IRQHandler+0x40>)
 80007a2:	5a18      	ldrh	r0, [r3, r0]
 80007a4:	b280      	uxth	r0, r0
 80007a6:	5258      	strh	r0, [r3, r1]
 80007a8:	4909      	ldr	r1, [pc, #36]	; (80007d0 <TIM2_IRQHandler+0x44>)
 80007aa:	2001      	movs	r0, #1
 80007ac:	3201      	adds	r2, #1
 80007ae:	5258      	strh	r0, [r3, r1]
 80007b0:	2a04      	cmp	r2, #4
 80007b2:	d1ec      	bne.n	800078e <TIM2_IRQHandler+0x2>
 80007b4:	4b07      	ldr	r3, [pc, #28]	; (80007d4 <TIM2_IRQHandler+0x48>)
 80007b6:	681a      	ldr	r2, [r3, #0]
 80007b8:	3201      	adds	r2, #1
 80007ba:	601a      	str	r2, [r3, #0]
 80007bc:	2202      	movs	r2, #2
 80007be:	2380      	movs	r3, #128	; 0x80
 80007c0:	4252      	negs	r2, r2
 80007c2:	05db      	lsls	r3, r3, #23
 80007c4:	611a      	str	r2, [r3, #16]
 80007c6:	4770      	bx	lr
 80007c8:	20000978 	.word	0x20000978
 80007cc:	2000096c 	.word	0x2000096c
 80007d0:	20000964 	.word	0x20000964
 80007d4:	20000974 	.word	0x20000974

080007d8 <timer_get_time>:
 80007d8:	b082      	sub	sp, #8
 80007da:	b672      	cpsid	i
 80007dc:	4b03      	ldr	r3, [pc, #12]	; (80007ec <timer_get_time+0x14>)
 80007de:	681b      	ldr	r3, [r3, #0]
 80007e0:	9301      	str	r3, [sp, #4]
 80007e2:	b662      	cpsie	i
 80007e4:	9801      	ldr	r0, [sp, #4]
 80007e6:	b002      	add	sp, #8
 80007e8:	4770      	bx	lr
 80007ea:	46c0      	nop			; (mov r8, r8)
 80007ec:	20000974 	.word	0x20000974

080007f0 <timer_delay_ms>:
 80007f0:	b513      	push	{r0, r1, r4, lr}
 80007f2:	1c04      	adds	r4, r0, #0
 80007f4:	f7ff fff0 	bl	80007d8 <timer_get_time>
 80007f8:	1904      	adds	r4, r0, r4
 80007fa:	9401      	str	r4, [sp, #4]
 80007fc:	9c01      	ldr	r4, [sp, #4]
 80007fe:	f7ff ffeb 	bl	80007d8 <timer_get_time>
 8000802:	4284      	cmp	r4, r0
 8000804:	d904      	bls.n	8000810 <timer_delay_ms+0x20>
 8000806:	f7ff fcd3 	bl	80001b0 <yield>
 800080a:	f000 f861 	bl	80008d0 <sleep>
 800080e:	e7f5      	b.n	80007fc <timer_delay_ms+0xc>
 8000810:	bd13      	pop	{r0, r1, r4, pc}
	...

08000814 <uart_write>:
 8000814:	4b03      	ldr	r3, [pc, #12]	; (8000824 <uart_write+0x10>)
 8000816:	6298      	str	r0, [r3, #40]	; 0x28
 8000818:	69da      	ldr	r2, [r3, #28]
 800081a:	0651      	lsls	r1, r2, #25
 800081c:	d401      	bmi.n	8000822 <uart_write+0xe>
 800081e:	46c0      	nop			; (mov r8, r8)
 8000820:	e7fa      	b.n	8000818 <uart_write+0x4>
 8000822:	4770      	bx	lr
 8000824:	40004400 	.word	0x40004400

08000828 <uart_init>:
 8000828:	4b1d      	ldr	r3, [pc, #116]	; (80008a0 <uart_init+0x78>)
 800082a:	b510      	push	{r4, lr}
 800082c:	6ad9      	ldr	r1, [r3, #44]	; 0x2c
 800082e:	2201      	movs	r2, #1
 8000830:	4311      	orrs	r1, r2
 8000832:	62d9      	str	r1, [r3, #44]	; 0x2c
 8000834:	6ad9      	ldr	r1, [r3, #44]	; 0x2c
 8000836:	b088      	sub	sp, #32
 8000838:	4011      	ands	r1, r2
 800083a:	9101      	str	r1, [sp, #4]
 800083c:	9901      	ldr	r1, [sp, #4]
 800083e:	6ad9      	ldr	r1, [r3, #44]	; 0x2c
 8000840:	2404      	movs	r4, #4
 8000842:	4311      	orrs	r1, r2
 8000844:	62d9      	str	r1, [r3, #44]	; 0x2c
 8000846:	6ad9      	ldr	r1, [r3, #44]	; 0x2c
 8000848:	4011      	ands	r1, r2
 800084a:	9102      	str	r1, [sp, #8]
 800084c:	9902      	ldr	r1, [sp, #8]
 800084e:	6b98      	ldr	r0, [r3, #56]	; 0x38
 8000850:	2180      	movs	r1, #128	; 0x80
 8000852:	0289      	lsls	r1, r1, #10
 8000854:	4301      	orrs	r1, r0
 8000856:	6399      	str	r1, [r3, #56]	; 0x38
 8000858:	20a0      	movs	r0, #160	; 0xa0
 800085a:	2302      	movs	r3, #2
 800085c:	9304      	str	r3, [sp, #16]
 800085e:	05c0      	lsls	r0, r0, #23
 8000860:	2303      	movs	r3, #3
 8000862:	a903      	add	r1, sp, #12
 8000864:	9205      	str	r2, [sp, #20]
 8000866:	9306      	str	r3, [sp, #24]
 8000868:	9403      	str	r4, [sp, #12]
 800086a:	9407      	str	r4, [sp, #28]
 800086c:	f000 fbfa 	bl	8001064 <HAL_GPIO_Init>
 8000870:	20a0      	movs	r0, #160	; 0xa0
 8000872:	2308      	movs	r3, #8
 8000874:	05c0      	lsls	r0, r0, #23
 8000876:	a903      	add	r1, sp, #12
 8000878:	9303      	str	r3, [sp, #12]
 800087a:	9407      	str	r4, [sp, #28]
 800087c:	f000 fbf2 	bl	8001064 <HAL_GPIO_Init>
 8000880:	4b08      	ldr	r3, [pc, #32]	; (80008a4 <uart_init+0x7c>)
 8000882:	22d0      	movs	r2, #208	; 0xd0
 8000884:	60da      	str	r2, [r3, #12]
 8000886:	220d      	movs	r2, #13
 8000888:	601a      	str	r2, [r3, #0]
 800088a:	69d8      	ldr	r0, [r3, #28]
 800088c:	2140      	movs	r1, #64	; 0x40
 800088e:	4a05      	ldr	r2, [pc, #20]	; (80008a4 <uart_init+0x7c>)
 8000890:	4208      	tst	r0, r1
 8000892:	d0fa      	beq.n	800088a <uart_init+0x62>
 8000894:	6a13      	ldr	r3, [r2, #32]
 8000896:	4319      	orrs	r1, r3
 8000898:	6211      	str	r1, [r2, #32]
 800089a:	b008      	add	sp, #32
 800089c:	bd10      	pop	{r4, pc}
 800089e:	46c0      	nop			; (mov r8, r8)
 80008a0:	40021000 	.word	0x40021000
 80008a4:	40004400 	.word	0x40004400

080008a8 <i2c_write_reg>:
 80008a8:	4770      	bx	lr

080008aa <i2c_read_reg>:
 80008aa:	20ff      	movs	r0, #255	; 0xff
 80008ac:	4770      	bx	lr

080008ae <__get_MSP>:
 80008ae:	f3ef 8008 	mrs	r0, MSP
 80008b2:	1c00      	adds	r0, r0, #0
 80008b4:	4770      	bx	lr
	...

080008b8 <sys_tick_init>:
 80008b8:	4b03      	ldr	r3, [pc, #12]	; (80008c8 <sys_tick_init+0x10>)
 80008ba:	4a04      	ldr	r2, [pc, #16]	; (80008cc <sys_tick_init+0x14>)
 80008bc:	605a      	str	r2, [r3, #4]
 80008be:	2200      	movs	r2, #0
 80008c0:	609a      	str	r2, [r3, #8]
 80008c2:	2207      	movs	r2, #7
 80008c4:	601a      	str	r2, [r3, #0]
 80008c6:	4770      	bx	lr
 80008c8:	e000e010 	.word	0xe000e010
 80008cc:	00001388 	.word	0x00001388

080008d0 <sleep>:
 80008d0:	bf30      	wfi
 80008d2:	4770      	bx	lr

080008d4 <HAL_NVIC_SetPriority>:
 80008d4:	b570      	push	{r4, r5, r6, lr}
 80008d6:	0189      	lsls	r1, r1, #6
 80008d8:	2800      	cmp	r0, #0
 80008da:	da15      	bge.n	8000908 <HAL_NVIC_SetPriority+0x34>
 80008dc:	b2c0      	uxtb	r0, r0
 80008de:	230f      	movs	r3, #15
 80008e0:	4003      	ands	r3, r0
 80008e2:	3b08      	subs	r3, #8
 80008e4:	4a12      	ldr	r2, [pc, #72]	; (8000930 <HAL_NVIC_SetPriority+0x5c>)
 80008e6:	089b      	lsrs	r3, r3, #2
 80008e8:	009b      	lsls	r3, r3, #2
 80008ea:	189b      	adds	r3, r3, r2
 80008ec:	2203      	movs	r2, #3
 80008ee:	4010      	ands	r0, r2
 80008f0:	24ff      	movs	r4, #255	; 0xff
 80008f2:	00c2      	lsls	r2, r0, #3
 80008f4:	69dd      	ldr	r5, [r3, #28]
 80008f6:	1c20      	adds	r0, r4, #0
 80008f8:	4090      	lsls	r0, r2
 80008fa:	4385      	bics	r5, r0
 80008fc:	400c      	ands	r4, r1
 80008fe:	4094      	lsls	r4, r2
 8000900:	1c2a      	adds	r2, r5, #0
 8000902:	4322      	orrs	r2, r4
 8000904:	61da      	str	r2, [r3, #28]
 8000906:	e012      	b.n	800092e <HAL_NVIC_SetPriority+0x5a>
 8000908:	0882      	lsrs	r2, r0, #2
 800090a:	4b0a      	ldr	r3, [pc, #40]	; (8000934 <HAL_NVIC_SetPriority+0x60>)
 800090c:	2403      	movs	r4, #3
 800090e:	0092      	lsls	r2, r2, #2
 8000910:	18d2      	adds	r2, r2, r3
 8000912:	4020      	ands	r0, r4
 8000914:	23c0      	movs	r3, #192	; 0xc0
 8000916:	40a0      	lsls	r0, r4
 8000918:	009b      	lsls	r3, r3, #2
 800091a:	24ff      	movs	r4, #255	; 0xff
 800091c:	58d5      	ldr	r5, [r2, r3]
 800091e:	1c26      	adds	r6, r4, #0
 8000920:	4086      	lsls	r6, r0
 8000922:	43b5      	bics	r5, r6
 8000924:	400c      	ands	r4, r1
 8000926:	4084      	lsls	r4, r0
 8000928:	1c28      	adds	r0, r5, #0
 800092a:	4320      	orrs	r0, r4
 800092c:	50d0      	str	r0, [r2, r3]
 800092e:	bd70      	pop	{r4, r5, r6, pc}
 8000930:	e000ed00 	.word	0xe000ed00
 8000934:	e000e100 	.word	0xe000e100

08000938 <HAL_NVIC_EnableIRQ>:
 8000938:	231f      	movs	r3, #31
 800093a:	4018      	ands	r0, r3
 800093c:	2301      	movs	r3, #1
 800093e:	4083      	lsls	r3, r0
 8000940:	1c18      	adds	r0, r3, #0
 8000942:	4b01      	ldr	r3, [pc, #4]	; (8000948 <HAL_NVIC_EnableIRQ+0x10>)
 8000944:	6018      	str	r0, [r3, #0]
 8000946:	4770      	bx	lr
 8000948:	e000e100 	.word	0xe000e100

0800094c <HAL_SYSTICK_Config>:
 800094c:	4b09      	ldr	r3, [pc, #36]	; (8000974 <HAL_SYSTICK_Config+0x28>)
 800094e:	1e42      	subs	r2, r0, #1
 8000950:	2001      	movs	r0, #1
 8000952:	429a      	cmp	r2, r3
 8000954:	d80d      	bhi.n	8000972 <HAL_SYSTICK_Config+0x26>
 8000956:	4b08      	ldr	r3, [pc, #32]	; (8000978 <HAL_SYSTICK_Config+0x2c>)
 8000958:	21c0      	movs	r1, #192	; 0xc0
 800095a:	605a      	str	r2, [r3, #4]
 800095c:	4a07      	ldr	r2, [pc, #28]	; (800097c <HAL_SYSTICK_Config+0x30>)
 800095e:	0609      	lsls	r1, r1, #24
 8000960:	6a10      	ldr	r0, [r2, #32]
 8000962:	0200      	lsls	r0, r0, #8
 8000964:	0a00      	lsrs	r0, r0, #8
 8000966:	4301      	orrs	r1, r0
 8000968:	6211      	str	r1, [r2, #32]
 800096a:	2000      	movs	r0, #0
 800096c:	2207      	movs	r2, #7
 800096e:	6098      	str	r0, [r3, #8]
 8000970:	601a      	str	r2, [r3, #0]
 8000972:	4770      	bx	lr
 8000974:	00ffffff 	.word	0x00ffffff
 8000978:	e000e010 	.word	0xe000e010
 800097c:	e000ed00 	.word	0xe000ed00

08000980 <TIM_Base_SetConfig>:
 8000980:	2280      	movs	r2, #128	; 0x80
 8000982:	b510      	push	{r4, lr}
 8000984:	6803      	ldr	r3, [r0, #0]
 8000986:	05d2      	lsls	r2, r2, #23
 8000988:	4290      	cmp	r0, r2
 800098a:	d005      	beq.n	8000998 <TIM_Base_SetConfig+0x18>
 800098c:	4c0f      	ldr	r4, [pc, #60]	; (80009cc <TIM_Base_SetConfig+0x4c>)
 800098e:	42a0      	cmp	r0, r4
 8000990:	d002      	beq.n	8000998 <TIM_Base_SetConfig+0x18>
 8000992:	4c0f      	ldr	r4, [pc, #60]	; (80009d0 <TIM_Base_SetConfig+0x50>)
 8000994:	42a0      	cmp	r0, r4
 8000996:	d10b      	bne.n	80009b0 <TIM_Base_SetConfig+0x30>
 8000998:	2470      	movs	r4, #112	; 0x70
 800099a:	43a3      	bics	r3, r4
 800099c:	684c      	ldr	r4, [r1, #4]
 800099e:	4323      	orrs	r3, r4
 80009a0:	4290      	cmp	r0, r2
 80009a2:	d00d      	beq.n	80009c0 <TIM_Base_SetConfig+0x40>
 80009a4:	4a09      	ldr	r2, [pc, #36]	; (80009cc <TIM_Base_SetConfig+0x4c>)
 80009a6:	4290      	cmp	r0, r2
 80009a8:	d00a      	beq.n	80009c0 <TIM_Base_SetConfig+0x40>
 80009aa:	4a09      	ldr	r2, [pc, #36]	; (80009d0 <TIM_Base_SetConfig+0x50>)
 80009ac:	4290      	cmp	r0, r2
 80009ae:	d007      	beq.n	80009c0 <TIM_Base_SetConfig+0x40>
 80009b0:	6003      	str	r3, [r0, #0]
 80009b2:	688a      	ldr	r2, [r1, #8]
 80009b4:	680b      	ldr	r3, [r1, #0]
 80009b6:	62c2      	str	r2, [r0, #44]	; 0x2c
 80009b8:	6283      	str	r3, [r0, #40]	; 0x28
 80009ba:	2301      	movs	r3, #1
 80009bc:	6143      	str	r3, [r0, #20]
 80009be:	bd10      	pop	{r4, pc}
 80009c0:	4a04      	ldr	r2, [pc, #16]	; (80009d4 <TIM_Base_SetConfig+0x54>)
 80009c2:	4013      	ands	r3, r2
 80009c4:	68ca      	ldr	r2, [r1, #12]
 80009c6:	4313      	orrs	r3, r2
 80009c8:	e7f2      	b.n	80009b0 <TIM_Base_SetConfig+0x30>
 80009ca:	46c0      	nop			; (mov r8, r8)
 80009cc:	40010800 	.word	0x40010800
 80009d0:	40011400 	.word	0x40011400
 80009d4:	fffffcff 	.word	0xfffffcff

080009d8 <HAL_TIM_Base_MspInit>:
 80009d8:	4770      	bx	lr

080009da <HAL_TIM_Base_Init>:
 80009da:	b538      	push	{r3, r4, r5, lr}
 80009dc:	1e04      	subs	r4, r0, #0
 80009de:	d016      	beq.n	8000a0e <HAL_TIM_Base_Init+0x34>
 80009e0:	6b43      	ldr	r3, [r0, #52]	; 0x34
 80009e2:	041b      	lsls	r3, r3, #16
 80009e4:	0e1b      	lsrs	r3, r3, #24
 80009e6:	b2da      	uxtb	r2, r3
 80009e8:	2a00      	cmp	r2, #0
 80009ea:	d104      	bne.n	80009f6 <HAL_TIM_Base_Init+0x1c>
 80009ec:	1c02      	adds	r2, r0, #0
 80009ee:	3234      	adds	r2, #52	; 0x34
 80009f0:	7013      	strb	r3, [r2, #0]
 80009f2:	f7ff fff1 	bl	80009d8 <HAL_TIM_Base_MspInit>
 80009f6:	1c25      	adds	r5, r4, #0
 80009f8:	2302      	movs	r3, #2
 80009fa:	3535      	adds	r5, #53	; 0x35
 80009fc:	1c21      	adds	r1, r4, #0
 80009fe:	702b      	strb	r3, [r5, #0]
 8000a00:	c901      	ldmia	r1!, {r0}
 8000a02:	f7ff ffbd 	bl	8000980 <TIM_Base_SetConfig>
 8000a06:	2301      	movs	r3, #1
 8000a08:	702b      	strb	r3, [r5, #0]
 8000a0a:	2000      	movs	r0, #0
 8000a0c:	e000      	b.n	8000a10 <HAL_TIM_Base_Init+0x36>
 8000a0e:	2001      	movs	r0, #1
 8000a10:	bd38      	pop	{r3, r4, r5, pc}

08000a12 <HAL_TIM_Base_Start_IT>:
 8000a12:	6803      	ldr	r3, [r0, #0]
 8000a14:	2201      	movs	r2, #1
 8000a16:	68d9      	ldr	r1, [r3, #12]
 8000a18:	2000      	movs	r0, #0
 8000a1a:	4311      	orrs	r1, r2
 8000a1c:	60d9      	str	r1, [r3, #12]
 8000a1e:	6819      	ldr	r1, [r3, #0]
 8000a20:	430a      	orrs	r2, r1
 8000a22:	601a      	str	r2, [r3, #0]
 8000a24:	4770      	bx	lr

08000a26 <HAL_InitTick>:
 8000a26:	b510      	push	{r4, lr}
 8000a28:	1c04      	adds	r4, r0, #0
 8000a2a:	f000 fb07 	bl	800103c <HAL_RCC_GetHCLKFreq>
 8000a2e:	21fa      	movs	r1, #250	; 0xfa
 8000a30:	0089      	lsls	r1, r1, #2
 8000a32:	f000 fc6b 	bl	800130c <__aeabi_uidiv>
 8000a36:	f7ff ff89 	bl	800094c <HAL_SYSTICK_Config>
 8000a3a:	2001      	movs	r0, #1
 8000a3c:	4240      	negs	r0, r0
 8000a3e:	1c21      	adds	r1, r4, #0
 8000a40:	2200      	movs	r2, #0
 8000a42:	f7ff ff47 	bl	80008d4 <HAL_NVIC_SetPriority>
 8000a46:	2000      	movs	r0, #0
 8000a48:	bd10      	pop	{r4, pc}
	...

08000a4c <HAL_GetTick>:
 8000a4c:	4b01      	ldr	r3, [pc, #4]	; (8000a54 <HAL_GetTick+0x8>)
 8000a4e:	6818      	ldr	r0, [r3, #0]
 8000a50:	4770      	bx	lr
 8000a52:	46c0      	nop			; (mov r8, r8)
 8000a54:	20000004 	.word	0x20000004

08000a58 <HAL_RCC_OscConfig>:
 8000a58:	b5f0      	push	{r4, r5, r6, r7, lr}
 8000a5a:	1c04      	adds	r4, r0, #0
 8000a5c:	6800      	ldr	r0, [r0, #0]
 8000a5e:	b085      	sub	sp, #20
 8000a60:	07c0      	lsls	r0, r0, #31
 8000a62:	d403      	bmi.n	8000a6c <HAL_RCC_OscConfig+0x14>
 8000a64:	6821      	ldr	r1, [r4, #0]
 8000a66:	0789      	lsls	r1, r1, #30
 8000a68:	d457      	bmi.n	8000b1a <HAL_RCC_OscConfig+0xc2>
 8000a6a:	e09d      	b.n	8000ba8 <HAL_RCC_OscConfig+0x150>
 8000a6c:	4dbc      	ldr	r5, [pc, #752]	; (8000d60 <HAL_RCC_OscConfig+0x308>)
 8000a6e:	230c      	movs	r3, #12
 8000a70:	68ea      	ldr	r2, [r5, #12]
 8000a72:	401a      	ands	r2, r3
 8000a74:	2a08      	cmp	r2, #8
 8000a76:	d008      	beq.n	8000a8a <HAL_RCC_OscConfig+0x32>
 8000a78:	68ea      	ldr	r2, [r5, #12]
 8000a7a:	4013      	ands	r3, r2
 8000a7c:	2280      	movs	r2, #128	; 0x80
 8000a7e:	0252      	lsls	r2, r2, #9
 8000a80:	2b0c      	cmp	r3, #12
 8000a82:	d10a      	bne.n	8000a9a <HAL_RCC_OscConfig+0x42>
 8000a84:	68eb      	ldr	r3, [r5, #12]
 8000a86:	4213      	tst	r3, r2
 8000a88:	d007      	beq.n	8000a9a <HAL_RCC_OscConfig+0x42>
 8000a8a:	682b      	ldr	r3, [r5, #0]
 8000a8c:	039a      	lsls	r2, r3, #14
 8000a8e:	d5e9      	bpl.n	8000a64 <HAL_RCC_OscConfig+0xc>
 8000a90:	6863      	ldr	r3, [r4, #4]
 8000a92:	2b00      	cmp	r3, #0
 8000a94:	d1e6      	bne.n	8000a64 <HAL_RCC_OscConfig+0xc>
 8000a96:	2001      	movs	r0, #1
 8000a98:	e1d5      	b.n	8000e46 <HAL_RCC_OscConfig+0x3ee>
 8000a9a:	6863      	ldr	r3, [r4, #4]
 8000a9c:	2180      	movs	r1, #128	; 0x80
 8000a9e:	0249      	lsls	r1, r1, #9
 8000aa0:	4293      	cmp	r3, r2
 8000aa2:	d103      	bne.n	8000aac <HAL_RCC_OscConfig+0x54>
 8000aa4:	682b      	ldr	r3, [r5, #0]
 8000aa6:	431a      	orrs	r2, r3
 8000aa8:	602a      	str	r2, [r5, #0]
 8000aaa:	e01d      	b.n	8000ae8 <HAL_RCC_OscConfig+0x90>
 8000aac:	20a0      	movs	r0, #160	; 0xa0
 8000aae:	4aad      	ldr	r2, [pc, #692]	; (8000d64 <HAL_RCC_OscConfig+0x30c>)
 8000ab0:	02c0      	lsls	r0, r0, #11
 8000ab2:	4283      	cmp	r3, r0
 8000ab4:	d10b      	bne.n	8000ace <HAL_RCC_OscConfig+0x76>
 8000ab6:	682b      	ldr	r3, [r5, #0]
 8000ab8:	401a      	ands	r2, r3
 8000aba:	602a      	str	r2, [r5, #0]
 8000abc:	682a      	ldr	r2, [r5, #0]
 8000abe:	2380      	movs	r3, #128	; 0x80
 8000ac0:	02db      	lsls	r3, r3, #11
 8000ac2:	4313      	orrs	r3, r2
 8000ac4:	602b      	str	r3, [r5, #0]
 8000ac6:	682b      	ldr	r3, [r5, #0]
 8000ac8:	4319      	orrs	r1, r3
 8000aca:	6029      	str	r1, [r5, #0]
 8000acc:	e00c      	b.n	8000ae8 <HAL_RCC_OscConfig+0x90>
 8000ace:	6828      	ldr	r0, [r5, #0]
 8000ad0:	4002      	ands	r2, r0
 8000ad2:	602a      	str	r2, [r5, #0]
 8000ad4:	682a      	ldr	r2, [r5, #0]
 8000ad6:	4011      	ands	r1, r2
 8000ad8:	9103      	str	r1, [sp, #12]
 8000ada:	9a03      	ldr	r2, [sp, #12]
 8000adc:	6829      	ldr	r1, [r5, #0]
 8000ade:	4aa2      	ldr	r2, [pc, #648]	; (8000d68 <HAL_RCC_OscConfig+0x310>)
 8000ae0:	400a      	ands	r2, r1
 8000ae2:	602a      	str	r2, [r5, #0]
 8000ae4:	2b00      	cmp	r3, #0
 8000ae6:	d00c      	beq.n	8000b02 <HAL_RCC_OscConfig+0xaa>
 8000ae8:	f7ff ffb0 	bl	8000a4c <HAL_GetTick>
 8000aec:	1c06      	adds	r6, r0, #0
 8000aee:	682b      	ldr	r3, [r5, #0]
 8000af0:	0398      	lsls	r0, r3, #14
 8000af2:	d4b7      	bmi.n	8000a64 <HAL_RCC_OscConfig+0xc>
 8000af4:	f7ff ffaa 	bl	8000a4c <HAL_GetTick>
 8000af8:	1b80      	subs	r0, r0, r6
 8000afa:	2864      	cmp	r0, #100	; 0x64
 8000afc:	d9f7      	bls.n	8000aee <HAL_RCC_OscConfig+0x96>
 8000afe:	2003      	movs	r0, #3
 8000b00:	e1a1      	b.n	8000e46 <HAL_RCC_OscConfig+0x3ee>
 8000b02:	f7ff ffa3 	bl	8000a4c <HAL_GetTick>
 8000b06:	1c06      	adds	r6, r0, #0
 8000b08:	682b      	ldr	r3, [r5, #0]
 8000b0a:	0399      	lsls	r1, r3, #14
 8000b0c:	d5aa      	bpl.n	8000a64 <HAL_RCC_OscConfig+0xc>
 8000b0e:	f7ff ff9d 	bl	8000a4c <HAL_GetTick>
 8000b12:	1b80      	subs	r0, r0, r6
 8000b14:	2864      	cmp	r0, #100	; 0x64
 8000b16:	d9f7      	bls.n	8000b08 <HAL_RCC_OscConfig+0xb0>
 8000b18:	e7f1      	b.n	8000afe <HAL_RCC_OscConfig+0xa6>
 8000b1a:	4d91      	ldr	r5, [pc, #580]	; (8000d60 <HAL_RCC_OscConfig+0x308>)
 8000b1c:	230c      	movs	r3, #12
 8000b1e:	68ea      	ldr	r2, [r5, #12]
 8000b20:	401a      	ands	r2, r3
 8000b22:	2a04      	cmp	r2, #4
 8000b24:	d006      	beq.n	8000b34 <HAL_RCC_OscConfig+0xdc>
 8000b26:	68ea      	ldr	r2, [r5, #12]
 8000b28:	4013      	ands	r3, r2
 8000b2a:	2b0c      	cmp	r3, #12
 8000b2c:	d110      	bne.n	8000b50 <HAL_RCC_OscConfig+0xf8>
 8000b2e:	68eb      	ldr	r3, [r5, #12]
 8000b30:	03da      	lsls	r2, r3, #15
 8000b32:	d40d      	bmi.n	8000b50 <HAL_RCC_OscConfig+0xf8>
 8000b34:	682b      	ldr	r3, [r5, #0]
 8000b36:	0758      	lsls	r0, r3, #29
 8000b38:	d502      	bpl.n	8000b40 <HAL_RCC_OscConfig+0xe8>
 8000b3a:	68e1      	ldr	r1, [r4, #12]
 8000b3c:	2901      	cmp	r1, #1
 8000b3e:	d1aa      	bne.n	8000a96 <HAL_RCC_OscConfig+0x3e>
 8000b40:	6923      	ldr	r3, [r4, #16]
 8000b42:	6869      	ldr	r1, [r5, #4]
 8000b44:	021a      	lsls	r2, r3, #8
 8000b46:	4b89      	ldr	r3, [pc, #548]	; (8000d6c <HAL_RCC_OscConfig+0x314>)
 8000b48:	400b      	ands	r3, r1
 8000b4a:	4313      	orrs	r3, r2
 8000b4c:	606b      	str	r3, [r5, #4]
 8000b4e:	e02b      	b.n	8000ba8 <HAL_RCC_OscConfig+0x150>
 8000b50:	68e2      	ldr	r2, [r4, #12]
 8000b52:	2309      	movs	r3, #9
 8000b54:	2a00      	cmp	r2, #0
 8000b56:	d018      	beq.n	8000b8a <HAL_RCC_OscConfig+0x132>
 8000b58:	6829      	ldr	r1, [r5, #0]
 8000b5a:	4399      	bics	r1, r3
 8000b5c:	430a      	orrs	r2, r1
 8000b5e:	602a      	str	r2, [r5, #0]
 8000b60:	f7ff ff74 	bl	8000a4c <HAL_GetTick>
 8000b64:	1c06      	adds	r6, r0, #0
 8000b66:	682a      	ldr	r2, [r5, #0]
 8000b68:	4b7d      	ldr	r3, [pc, #500]	; (8000d60 <HAL_RCC_OscConfig+0x308>)
 8000b6a:	0750      	lsls	r0, r2, #29
 8000b6c:	d405      	bmi.n	8000b7a <HAL_RCC_OscConfig+0x122>
 8000b6e:	f7ff ff6d 	bl	8000a4c <HAL_GetTick>
 8000b72:	1b80      	subs	r0, r0, r6
 8000b74:	2802      	cmp	r0, #2
 8000b76:	d9f6      	bls.n	8000b66 <HAL_RCC_OscConfig+0x10e>
 8000b78:	e7c1      	b.n	8000afe <HAL_RCC_OscConfig+0xa6>
 8000b7a:	6922      	ldr	r2, [r4, #16]
 8000b7c:	6858      	ldr	r0, [r3, #4]
 8000b7e:	0211      	lsls	r1, r2, #8
 8000b80:	4a7a      	ldr	r2, [pc, #488]	; (8000d6c <HAL_RCC_OscConfig+0x314>)
 8000b82:	4002      	ands	r2, r0
 8000b84:	430a      	orrs	r2, r1
 8000b86:	605a      	str	r2, [r3, #4]
 8000b88:	e00e      	b.n	8000ba8 <HAL_RCC_OscConfig+0x150>
 8000b8a:	682a      	ldr	r2, [r5, #0]
 8000b8c:	439a      	bics	r2, r3
 8000b8e:	602a      	str	r2, [r5, #0]
 8000b90:	f7ff ff5c 	bl	8000a4c <HAL_GetTick>
 8000b94:	1c06      	adds	r6, r0, #0
 8000b96:	682b      	ldr	r3, [r5, #0]
 8000b98:	0758      	lsls	r0, r3, #29
 8000b9a:	d505      	bpl.n	8000ba8 <HAL_RCC_OscConfig+0x150>
 8000b9c:	f7ff ff56 	bl	8000a4c <HAL_GetTick>
 8000ba0:	1b80      	subs	r0, r0, r6
 8000ba2:	2802      	cmp	r0, #2
 8000ba4:	d9f7      	bls.n	8000b96 <HAL_RCC_OscConfig+0x13e>
 8000ba6:	e7aa      	b.n	8000afe <HAL_RCC_OscConfig+0xa6>
 8000ba8:	6821      	ldr	r1, [r4, #0]
 8000baa:	06c9      	lsls	r1, r1, #27
 8000bac:	d54f      	bpl.n	8000c4e <HAL_RCC_OscConfig+0x1f6>
 8000bae:	4d6c      	ldr	r5, [pc, #432]	; (8000d60 <HAL_RCC_OscConfig+0x308>)
 8000bb0:	230c      	movs	r3, #12
 8000bb2:	68ea      	ldr	r2, [r5, #12]
 8000bb4:	421a      	tst	r2, r3
 8000bb6:	d117      	bne.n	8000be8 <HAL_RCC_OscConfig+0x190>
 8000bb8:	682b      	ldr	r3, [r5, #0]
 8000bba:	059a      	lsls	r2, r3, #22
 8000bbc:	d503      	bpl.n	8000bc6 <HAL_RCC_OscConfig+0x16e>
 8000bbe:	69a3      	ldr	r3, [r4, #24]
 8000bc0:	2b00      	cmp	r3, #0
 8000bc2:	d100      	bne.n	8000bc6 <HAL_RCC_OscConfig+0x16e>
 8000bc4:	e767      	b.n	8000a96 <HAL_RCC_OscConfig+0x3e>
 8000bc6:	686a      	ldr	r2, [r5, #4]
 8000bc8:	4b69      	ldr	r3, [pc, #420]	; (8000d70 <HAL_RCC_OscConfig+0x318>)
 8000bca:	6a20      	ldr	r0, [r4, #32]
 8000bcc:	4013      	ands	r3, r2
 8000bce:	4303      	orrs	r3, r0
 8000bd0:	606b      	str	r3, [r5, #4]
 8000bd2:	686b      	ldr	r3, [r5, #4]
 8000bd4:	69e1      	ldr	r1, [r4, #28]
 8000bd6:	021b      	lsls	r3, r3, #8
 8000bd8:	060a      	lsls	r2, r1, #24
 8000bda:	0a1b      	lsrs	r3, r3, #8
 8000bdc:	4313      	orrs	r3, r2
 8000bde:	606b      	str	r3, [r5, #4]
 8000be0:	2003      	movs	r0, #3
 8000be2:	f7ff ff20 	bl	8000a26 <HAL_InitTick>
 8000be6:	e032      	b.n	8000c4e <HAL_RCC_OscConfig+0x1f6>
 8000be8:	69a2      	ldr	r2, [r4, #24]
 8000bea:	2a00      	cmp	r2, #0
 8000bec:	d01f      	beq.n	8000c2e <HAL_RCC_OscConfig+0x1d6>
 8000bee:	682a      	ldr	r2, [r5, #0]
 8000bf0:	2380      	movs	r3, #128	; 0x80
 8000bf2:	005b      	lsls	r3, r3, #1
 8000bf4:	4313      	orrs	r3, r2
 8000bf6:	602b      	str	r3, [r5, #0]
 8000bf8:	f7ff ff28 	bl	8000a4c <HAL_GetTick>
 8000bfc:	1c06      	adds	r6, r0, #0
 8000bfe:	682a      	ldr	r2, [r5, #0]
 8000c00:	4b57      	ldr	r3, [pc, #348]	; (8000d60 <HAL_RCC_OscConfig+0x308>)
 8000c02:	0590      	lsls	r0, r2, #22
 8000c04:	d405      	bmi.n	8000c12 <HAL_RCC_OscConfig+0x1ba>
 8000c06:	f7ff ff21 	bl	8000a4c <HAL_GetTick>
 8000c0a:	1b80      	subs	r0, r0, r6
 8000c0c:	2802      	cmp	r0, #2
 8000c0e:	d9f6      	bls.n	8000bfe <HAL_RCC_OscConfig+0x1a6>
 8000c10:	e775      	b.n	8000afe <HAL_RCC_OscConfig+0xa6>
 8000c12:	6859      	ldr	r1, [r3, #4]
 8000c14:	4a56      	ldr	r2, [pc, #344]	; (8000d70 <HAL_RCC_OscConfig+0x318>)
 8000c16:	400a      	ands	r2, r1
 8000c18:	6a21      	ldr	r1, [r4, #32]
 8000c1a:	430a      	orrs	r2, r1
 8000c1c:	605a      	str	r2, [r3, #4]
 8000c1e:	685a      	ldr	r2, [r3, #4]
 8000c20:	69e0      	ldr	r0, [r4, #28]
 8000c22:	0212      	lsls	r2, r2, #8
 8000c24:	0601      	lsls	r1, r0, #24
 8000c26:	0a12      	lsrs	r2, r2, #8
 8000c28:	430a      	orrs	r2, r1
 8000c2a:	605a      	str	r2, [r3, #4]
 8000c2c:	e00f      	b.n	8000c4e <HAL_RCC_OscConfig+0x1f6>
 8000c2e:	682a      	ldr	r2, [r5, #0]
 8000c30:	4b50      	ldr	r3, [pc, #320]	; (8000d74 <HAL_RCC_OscConfig+0x31c>)
 8000c32:	4013      	ands	r3, r2
 8000c34:	602b      	str	r3, [r5, #0]
 8000c36:	f7ff ff09 	bl	8000a4c <HAL_GetTick>
 8000c3a:	1c06      	adds	r6, r0, #0
 8000c3c:	682b      	ldr	r3, [r5, #0]
 8000c3e:	0599      	lsls	r1, r3, #22
 8000c40:	d505      	bpl.n	8000c4e <HAL_RCC_OscConfig+0x1f6>
 8000c42:	f7ff ff03 	bl	8000a4c <HAL_GetTick>
 8000c46:	1b80      	subs	r0, r0, r6
 8000c48:	2802      	cmp	r0, #2
 8000c4a:	d9f7      	bls.n	8000c3c <HAL_RCC_OscConfig+0x1e4>
 8000c4c:	e757      	b.n	8000afe <HAL_RCC_OscConfig+0xa6>
 8000c4e:	6822      	ldr	r2, [r4, #0]
 8000c50:	0712      	lsls	r2, r2, #28
 8000c52:	d403      	bmi.n	8000c5c <HAL_RCC_OscConfig+0x204>
 8000c54:	6823      	ldr	r3, [r4, #0]
 8000c56:	075b      	lsls	r3, r3, #29
 8000c58:	d422      	bmi.n	8000ca0 <HAL_RCC_OscConfig+0x248>
 8000c5a:	e0ab      	b.n	8000db4 <HAL_RCC_OscConfig+0x35c>
 8000c5c:	4d40      	ldr	r5, [pc, #256]	; (8000d60 <HAL_RCC_OscConfig+0x308>)
 8000c5e:	6960      	ldr	r0, [r4, #20]
 8000c60:	2301      	movs	r3, #1
 8000c62:	6d2a      	ldr	r2, [r5, #80]	; 0x50
 8000c64:	2800      	cmp	r0, #0
 8000c66:	d00d      	beq.n	8000c84 <HAL_RCC_OscConfig+0x22c>
 8000c68:	4313      	orrs	r3, r2
 8000c6a:	652b      	str	r3, [r5, #80]	; 0x50
 8000c6c:	f7ff feee 	bl	8000a4c <HAL_GetTick>
 8000c70:	1c06      	adds	r6, r0, #0
 8000c72:	6d2b      	ldr	r3, [r5, #80]	; 0x50
 8000c74:	0799      	lsls	r1, r3, #30
 8000c76:	d4ed      	bmi.n	8000c54 <HAL_RCC_OscConfig+0x1fc>
 8000c78:	f7ff fee8 	bl	8000a4c <HAL_GetTick>
 8000c7c:	1b80      	subs	r0, r0, r6
 8000c7e:	2802      	cmp	r0, #2
 8000c80:	d9f7      	bls.n	8000c72 <HAL_RCC_OscConfig+0x21a>
 8000c82:	e73c      	b.n	8000afe <HAL_RCC_OscConfig+0xa6>
 8000c84:	439a      	bics	r2, r3
 8000c86:	652a      	str	r2, [r5, #80]	; 0x50
 8000c88:	f7ff fee0 	bl	8000a4c <HAL_GetTick>
 8000c8c:	1c06      	adds	r6, r0, #0
 8000c8e:	6d2b      	ldr	r3, [r5, #80]	; 0x50
 8000c90:	079a      	lsls	r2, r3, #30
 8000c92:	d5df      	bpl.n	8000c54 <HAL_RCC_OscConfig+0x1fc>
 8000c94:	f7ff feda 	bl	8000a4c <HAL_GetTick>
 8000c98:	1b80      	subs	r0, r0, r6
 8000c9a:	2802      	cmp	r0, #2
 8000c9c:	d9f7      	bls.n	8000c8e <HAL_RCC_OscConfig+0x236>
 8000c9e:	e72e      	b.n	8000afe <HAL_RCC_OscConfig+0xa6>
 8000ca0:	4d2f      	ldr	r5, [pc, #188]	; (8000d60 <HAL_RCC_OscConfig+0x308>)
 8000ca2:	2380      	movs	r3, #128	; 0x80
 8000ca4:	6baa      	ldr	r2, [r5, #56]	; 0x38
 8000ca6:	2000      	movs	r0, #0
 8000ca8:	055b      	lsls	r3, r3, #21
 8000caa:	9000      	str	r0, [sp, #0]
 8000cac:	421a      	tst	r2, r3
 8000cae:	d104      	bne.n	8000cba <HAL_RCC_OscConfig+0x262>
 8000cb0:	6baa      	ldr	r2, [r5, #56]	; 0x38
 8000cb2:	2101      	movs	r1, #1
 8000cb4:	4313      	orrs	r3, r2
 8000cb6:	63ab      	str	r3, [r5, #56]	; 0x38
 8000cb8:	9100      	str	r1, [sp, #0]
 8000cba:	4e2f      	ldr	r6, [pc, #188]	; (8000d78 <HAL_RCC_OscConfig+0x320>)
 8000cbc:	2380      	movs	r3, #128	; 0x80
 8000cbe:	6832      	ldr	r2, [r6, #0]
 8000cc0:	2000      	movs	r0, #0
 8000cc2:	005b      	lsls	r3, r3, #1
 8000cc4:	9001      	str	r0, [sp, #4]
 8000cc6:	421a      	tst	r2, r3
 8000cc8:	d110      	bne.n	8000cec <HAL_RCC_OscConfig+0x294>
 8000cca:	6832      	ldr	r2, [r6, #0]
 8000ccc:	4313      	orrs	r3, r2
 8000cce:	6033      	str	r3, [r6, #0]
 8000cd0:	f7ff febc 	bl	8000a4c <HAL_GetTick>
 8000cd4:	1c07      	adds	r7, r0, #0
 8000cd6:	6833      	ldr	r3, [r6, #0]
 8000cd8:	05d9      	lsls	r1, r3, #23
 8000cda:	d405      	bmi.n	8000ce8 <HAL_RCC_OscConfig+0x290>
 8000cdc:	f7ff feb6 	bl	8000a4c <HAL_GetTick>
 8000ce0:	1bc0      	subs	r0, r0, r7
 8000ce2:	2864      	cmp	r0, #100	; 0x64
 8000ce4:	d9f7      	bls.n	8000cd6 <HAL_RCC_OscConfig+0x27e>
 8000ce6:	e70a      	b.n	8000afe <HAL_RCC_OscConfig+0xa6>
 8000ce8:	2201      	movs	r2, #1
 8000cea:	9201      	str	r2, [sp, #4]
 8000cec:	68a3      	ldr	r3, [r4, #8]
 8000cee:	2180      	movs	r1, #128	; 0x80
 8000cf0:	0049      	lsls	r1, r1, #1
 8000cf2:	428b      	cmp	r3, r1
 8000cf4:	d102      	bne.n	8000cfc <HAL_RCC_OscConfig+0x2a4>
 8000cf6:	6d2a      	ldr	r2, [r5, #80]	; 0x50
 8000cf8:	4313      	orrs	r3, r2
 8000cfa:	e023      	b.n	8000d44 <HAL_RCC_OscConfig+0x2ec>
 8000cfc:	4a1d      	ldr	r2, [pc, #116]	; (8000d74 <HAL_RCC_OscConfig+0x31c>)
 8000cfe:	2b00      	cmp	r3, #0
 8000d00:	d10a      	bne.n	8000d18 <HAL_RCC_OscConfig+0x2c0>
 8000d02:	6d2b      	ldr	r3, [r5, #80]	; 0x50
 8000d04:	401a      	ands	r2, r3
 8000d06:	652a      	str	r2, [r5, #80]	; 0x50
 8000d08:	6d2a      	ldr	r2, [r5, #80]	; 0x50
 8000d0a:	4b1c      	ldr	r3, [pc, #112]	; (8000d7c <HAL_RCC_OscConfig+0x324>)
 8000d0c:	4013      	ands	r3, r2
 8000d0e:	652b      	str	r3, [r5, #80]	; 0x50
 8000d10:	f7ff fe9c 	bl	8000a4c <HAL_GetTick>
 8000d14:	1c07      	adds	r7, r0, #0
 8000d16:	e03c      	b.n	8000d92 <HAL_RCC_OscConfig+0x33a>
 8000d18:	20a0      	movs	r0, #160	; 0xa0
 8000d1a:	00c0      	lsls	r0, r0, #3
 8000d1c:	4283      	cmp	r3, r0
 8000d1e:	d10b      	bne.n	8000d38 <HAL_RCC_OscConfig+0x2e0>
 8000d20:	6d2b      	ldr	r3, [r5, #80]	; 0x50
 8000d22:	401a      	ands	r2, r3
 8000d24:	652a      	str	r2, [r5, #80]	; 0x50
 8000d26:	6d2a      	ldr	r2, [r5, #80]	; 0x50
 8000d28:	2380      	movs	r3, #128	; 0x80
 8000d2a:	00db      	lsls	r3, r3, #3
 8000d2c:	4313      	orrs	r3, r2
 8000d2e:	652b      	str	r3, [r5, #80]	; 0x50
 8000d30:	6d2b      	ldr	r3, [r5, #80]	; 0x50
 8000d32:	4319      	orrs	r1, r3
 8000d34:	6529      	str	r1, [r5, #80]	; 0x50
 8000d36:	e006      	b.n	8000d46 <HAL_RCC_OscConfig+0x2ee>
 8000d38:	6d2b      	ldr	r3, [r5, #80]	; 0x50
 8000d3a:	401a      	ands	r2, r3
 8000d3c:	652a      	str	r2, [r5, #80]	; 0x50
 8000d3e:	6d2a      	ldr	r2, [r5, #80]	; 0x50
 8000d40:	4b0e      	ldr	r3, [pc, #56]	; (8000d7c <HAL_RCC_OscConfig+0x324>)
 8000d42:	4013      	ands	r3, r2
 8000d44:	652b      	str	r3, [r5, #80]	; 0x50
 8000d46:	f7ff fe81 	bl	8000a4c <HAL_GetTick>
 8000d4a:	1c07      	adds	r7, r0, #0
 8000d4c:	6d2b      	ldr	r3, [r5, #80]	; 0x50
 8000d4e:	0598      	lsls	r0, r3, #22
 8000d50:	d422      	bmi.n	8000d98 <HAL_RCC_OscConfig+0x340>
 8000d52:	f7ff fe7b 	bl	8000a4c <HAL_GetTick>
 8000d56:	4b0a      	ldr	r3, [pc, #40]	; (8000d80 <HAL_RCC_OscConfig+0x328>)
 8000d58:	1bc0      	subs	r0, r0, r7
 8000d5a:	4298      	cmp	r0, r3
 8000d5c:	d9f6      	bls.n	8000d4c <HAL_RCC_OscConfig+0x2f4>
 8000d5e:	e6ce      	b.n	8000afe <HAL_RCC_OscConfig+0xa6>
 8000d60:	40021000 	.word	0x40021000
 8000d64:	fffeffff 	.word	0xfffeffff
 8000d68:	fffbffff 	.word	0xfffbffff
 8000d6c:	ffffe0ff 	.word	0xffffe0ff
 8000d70:	ffff1fff 	.word	0xffff1fff
 8000d74:	fffffeff 	.word	0xfffffeff
 8000d78:	40007000 	.word	0x40007000
 8000d7c:	fffffbff 	.word	0xfffffbff
 8000d80:	00001388 	.word	0x00001388
 8000d84:	f7ff fe62 	bl	8000a4c <HAL_GetTick>
 8000d88:	4b30      	ldr	r3, [pc, #192]	; (8000e4c <HAL_RCC_OscConfig+0x3f4>)
 8000d8a:	1bc0      	subs	r0, r0, r7
 8000d8c:	4298      	cmp	r0, r3
 8000d8e:	d900      	bls.n	8000d92 <HAL_RCC_OscConfig+0x33a>
 8000d90:	e6b5      	b.n	8000afe <HAL_RCC_OscConfig+0xa6>
 8000d92:	6d2b      	ldr	r3, [r5, #80]	; 0x50
 8000d94:	059a      	lsls	r2, r3, #22
 8000d96:	d4f5      	bmi.n	8000d84 <HAL_RCC_OscConfig+0x32c>
 8000d98:	9901      	ldr	r1, [sp, #4]
 8000d9a:	2901      	cmp	r1, #1
 8000d9c:	d103      	bne.n	8000da6 <HAL_RCC_OscConfig+0x34e>
 8000d9e:	6832      	ldr	r2, [r6, #0]
 8000da0:	4b2b      	ldr	r3, [pc, #172]	; (8000e50 <HAL_RCC_OscConfig+0x3f8>)
 8000da2:	4013      	ands	r3, r2
 8000da4:	6033      	str	r3, [r6, #0]
 8000da6:	9b00      	ldr	r3, [sp, #0]
 8000da8:	2b01      	cmp	r3, #1
 8000daa:	d103      	bne.n	8000db4 <HAL_RCC_OscConfig+0x35c>
 8000dac:	6baa      	ldr	r2, [r5, #56]	; 0x38
 8000dae:	4b29      	ldr	r3, [pc, #164]	; (8000e54 <HAL_RCC_OscConfig+0x3fc>)
 8000db0:	4013      	ands	r3, r2
 8000db2:	63ab      	str	r3, [r5, #56]	; 0x38
 8000db4:	6a62      	ldr	r2, [r4, #36]	; 0x24
 8000db6:	2a00      	cmp	r2, #0
 8000db8:	d101      	bne.n	8000dbe <HAL_RCC_OscConfig+0x366>
 8000dba:	2000      	movs	r0, #0
 8000dbc:	e043      	b.n	8000e46 <HAL_RCC_OscConfig+0x3ee>
 8000dbe:	4d26      	ldr	r5, [pc, #152]	; (8000e58 <HAL_RCC_OscConfig+0x400>)
 8000dc0:	230c      	movs	r3, #12
 8000dc2:	68e9      	ldr	r1, [r5, #12]
 8000dc4:	400b      	ands	r3, r1
 8000dc6:	2b0c      	cmp	r3, #12
 8000dc8:	d100      	bne.n	8000dcc <HAL_RCC_OscConfig+0x374>
 8000dca:	e664      	b.n	8000a96 <HAL_RCC_OscConfig+0x3e>
 8000dcc:	4b23      	ldr	r3, [pc, #140]	; (8000e5c <HAL_RCC_OscConfig+0x404>)
 8000dce:	2a02      	cmp	r2, #2
 8000dd0:	d12a      	bne.n	8000e28 <HAL_RCC_OscConfig+0x3d0>
 8000dd2:	682a      	ldr	r2, [r5, #0]
 8000dd4:	4013      	ands	r3, r2
 8000dd6:	602b      	str	r3, [r5, #0]
 8000dd8:	f7ff fe38 	bl	8000a4c <HAL_GetTick>
 8000ddc:	1c06      	adds	r6, r0, #0
 8000dde:	682a      	ldr	r2, [r5, #0]
 8000de0:	4b1d      	ldr	r3, [pc, #116]	; (8000e58 <HAL_RCC_OscConfig+0x400>)
 8000de2:	0190      	lsls	r0, r2, #6
 8000de4:	d505      	bpl.n	8000df2 <HAL_RCC_OscConfig+0x39a>
 8000de6:	f7ff fe31 	bl	8000a4c <HAL_GetTick>
 8000dea:	1b80      	subs	r0, r0, r6
 8000dec:	2802      	cmp	r0, #2
 8000dee:	d9f6      	bls.n	8000dde <HAL_RCC_OscConfig+0x386>
 8000df0:	e685      	b.n	8000afe <HAL_RCC_OscConfig+0xa6>
 8000df2:	6ae2      	ldr	r2, [r4, #44]	; 0x2c
 8000df4:	6b21      	ldr	r1, [r4, #48]	; 0x30
 8000df6:	68d8      	ldr	r0, [r3, #12]
 8000df8:	4311      	orrs	r1, r2
 8000dfa:	6aa2      	ldr	r2, [r4, #40]	; 0x28
 8000dfc:	4311      	orrs	r1, r2
 8000dfe:	4a18      	ldr	r2, [pc, #96]	; (8000e60 <HAL_RCC_OscConfig+0x408>)
 8000e00:	4002      	ands	r2, r0
 8000e02:	430a      	orrs	r2, r1
 8000e04:	60da      	str	r2, [r3, #12]
 8000e06:	6819      	ldr	r1, [r3, #0]
 8000e08:	2280      	movs	r2, #128	; 0x80
 8000e0a:	0452      	lsls	r2, r2, #17
 8000e0c:	430a      	orrs	r2, r1
 8000e0e:	601a      	str	r2, [r3, #0]
 8000e10:	f7ff fe1c 	bl	8000a4c <HAL_GetTick>
 8000e14:	1c04      	adds	r4, r0, #0
 8000e16:	682b      	ldr	r3, [r5, #0]
 8000e18:	0198      	lsls	r0, r3, #6
 8000e1a:	d4ce      	bmi.n	8000dba <HAL_RCC_OscConfig+0x362>
 8000e1c:	f7ff fe16 	bl	8000a4c <HAL_GetTick>
 8000e20:	1b00      	subs	r0, r0, r4
 8000e22:	2802      	cmp	r0, #2
 8000e24:	d9f7      	bls.n	8000e16 <HAL_RCC_OscConfig+0x3be>
 8000e26:	e66a      	b.n	8000afe <HAL_RCC_OscConfig+0xa6>
 8000e28:	682a      	ldr	r2, [r5, #0]
 8000e2a:	4013      	ands	r3, r2
 8000e2c:	602b      	str	r3, [r5, #0]
 8000e2e:	f7ff fe0d 	bl	8000a4c <HAL_GetTick>
 8000e32:	1c04      	adds	r4, r0, #0
 8000e34:	682b      	ldr	r3, [r5, #0]
 8000e36:	0199      	lsls	r1, r3, #6
 8000e38:	d5bf      	bpl.n	8000dba <HAL_RCC_OscConfig+0x362>
 8000e3a:	f7ff fe07 	bl	8000a4c <HAL_GetTick>
 8000e3e:	1b00      	subs	r0, r0, r4
 8000e40:	2802      	cmp	r0, #2
 8000e42:	d9f7      	bls.n	8000e34 <HAL_RCC_OscConfig+0x3dc>
 8000e44:	e65b      	b.n	8000afe <HAL_RCC_OscConfig+0xa6>
 8000e46:	b005      	add	sp, #20
 8000e48:	bdf0      	pop	{r4, r5, r6, r7, pc}
 8000e4a:	46c0      	nop			; (mov r8, r8)
 8000e4c:	00001388 	.word	0x00001388
 8000e50:	fffffeff 	.word	0xfffffeff
 8000e54:	efffffff 	.word	0xefffffff
 8000e58:	40021000 	.word	0x40021000
 8000e5c:	feffffff 	.word	0xfeffffff
 8000e60:	ff02ffff 	.word	0xff02ffff

08000e64 <HAL_RCC_ClockConfig>:
 8000e64:	b5f7      	push	{r0, r1, r2, r4, r5, r6, r7, lr}
 8000e66:	4f4f      	ldr	r7, [pc, #316]	; (8000fa4 <HAL_RCC_ClockConfig+0x140>)
 8000e68:	2301      	movs	r3, #1
 8000e6a:	683a      	ldr	r2, [r7, #0]
 8000e6c:	1c05      	adds	r5, r0, #0
 8000e6e:	1c0e      	adds	r6, r1, #0
 8000e70:	401a      	ands	r2, r3
 8000e72:	4291      	cmp	r1, r2
 8000e74:	d80a      	bhi.n	8000e8c <HAL_RCC_ClockConfig+0x28>
 8000e76:	682b      	ldr	r3, [r5, #0]
 8000e78:	0798      	lsls	r0, r3, #30
 8000e7a:	d511      	bpl.n	8000ea0 <HAL_RCC_ClockConfig+0x3c>
 8000e7c:	4a4a      	ldr	r2, [pc, #296]	; (8000fa8 <HAL_RCC_ClockConfig+0x144>)
 8000e7e:	20f0      	movs	r0, #240	; 0xf0
 8000e80:	68d1      	ldr	r1, [r2, #12]
 8000e82:	4381      	bics	r1, r0
 8000e84:	68a8      	ldr	r0, [r5, #8]
 8000e86:	4301      	orrs	r1, r0
 8000e88:	60d1      	str	r1, [r2, #12]
 8000e8a:	e009      	b.n	8000ea0 <HAL_RCC_ClockConfig+0x3c>
 8000e8c:	683a      	ldr	r2, [r7, #0]
 8000e8e:	439a      	bics	r2, r3
 8000e90:	430a      	orrs	r2, r1
 8000e92:	603a      	str	r2, [r7, #0]
 8000e94:	683a      	ldr	r2, [r7, #0]
 8000e96:	4013      	ands	r3, r2
 8000e98:	428b      	cmp	r3, r1
 8000e9a:	d0ec      	beq.n	8000e76 <HAL_RCC_ClockConfig+0x12>
 8000e9c:	2001      	movs	r0, #1
 8000e9e:	e080      	b.n	8000fa2 <HAL_RCC_ClockConfig+0x13e>
 8000ea0:	07d9      	lsls	r1, r3, #31
 8000ea2:	d406      	bmi.n	8000eb2 <HAL_RCC_ClockConfig+0x4e>
 8000ea4:	6839      	ldr	r1, [r7, #0]
 8000ea6:	2301      	movs	r3, #1
 8000ea8:	4a3e      	ldr	r2, [pc, #248]	; (8000fa4 <HAL_RCC_ClockConfig+0x140>)
 8000eaa:	4019      	ands	r1, r3
 8000eac:	428e      	cmp	r6, r1
 8000eae:	d958      	bls.n	8000f62 <HAL_RCC_ClockConfig+0xfe>
 8000eb0:	e05f      	b.n	8000f72 <HAL_RCC_ClockConfig+0x10e>
 8000eb2:	4c3d      	ldr	r4, [pc, #244]	; (8000fa8 <HAL_RCC_ClockConfig+0x144>)
 8000eb4:	686b      	ldr	r3, [r5, #4]
 8000eb6:	6822      	ldr	r2, [r4, #0]
 8000eb8:	2b02      	cmp	r3, #2
 8000eba:	d102      	bne.n	8000ec2 <HAL_RCC_ClockConfig+0x5e>
 8000ebc:	0390      	lsls	r0, r2, #14
 8000ebe:	d40c      	bmi.n	8000eda <HAL_RCC_ClockConfig+0x76>
 8000ec0:	e7ec      	b.n	8000e9c <HAL_RCC_ClockConfig+0x38>
 8000ec2:	2b00      	cmp	r3, #0
 8000ec4:	d102      	bne.n	8000ecc <HAL_RCC_ClockConfig+0x68>
 8000ec6:	0591      	lsls	r1, r2, #22
 8000ec8:	d407      	bmi.n	8000eda <HAL_RCC_ClockConfig+0x76>
 8000eca:	e7e7      	b.n	8000e9c <HAL_RCC_ClockConfig+0x38>
 8000ecc:	2b03      	cmp	r3, #3
 8000ece:	d102      	bne.n	8000ed6 <HAL_RCC_ClockConfig+0x72>
 8000ed0:	0190      	lsls	r0, r2, #6
 8000ed2:	d402      	bmi.n	8000eda <HAL_RCC_ClockConfig+0x76>
 8000ed4:	e7e2      	b.n	8000e9c <HAL_RCC_ClockConfig+0x38>
 8000ed6:	0751      	lsls	r1, r2, #29
 8000ed8:	d5e0      	bpl.n	8000e9c <HAL_RCC_ClockConfig+0x38>
 8000eda:	68e2      	ldr	r2, [r4, #12]
 8000edc:	2103      	movs	r1, #3
 8000ede:	438a      	bics	r2, r1
 8000ee0:	4313      	orrs	r3, r2
 8000ee2:	60e3      	str	r3, [r4, #12]
 8000ee4:	f7ff fdb2 	bl	8000a4c <HAL_GetTick>
 8000ee8:	686b      	ldr	r3, [r5, #4]
 8000eea:	9001      	str	r0, [sp, #4]
 8000eec:	2b02      	cmp	r3, #2
 8000eee:	d10d      	bne.n	8000f0c <HAL_RCC_ClockConfig+0xa8>
 8000ef0:	68e2      	ldr	r2, [r4, #12]
 8000ef2:	230c      	movs	r3, #12
 8000ef4:	4013      	ands	r3, r2
 8000ef6:	2b08      	cmp	r3, #8
 8000ef8:	d0d4      	beq.n	8000ea4 <HAL_RCC_ClockConfig+0x40>
 8000efa:	f7ff fda7 	bl	8000a4c <HAL_GetTick>
 8000efe:	9a01      	ldr	r2, [sp, #4]
 8000f00:	4b2a      	ldr	r3, [pc, #168]	; (8000fac <HAL_RCC_ClockConfig+0x148>)
 8000f02:	1a80      	subs	r0, r0, r2
 8000f04:	4298      	cmp	r0, r3
 8000f06:	d9f3      	bls.n	8000ef0 <HAL_RCC_ClockConfig+0x8c>
 8000f08:	2003      	movs	r0, #3
 8000f0a:	e04a      	b.n	8000fa2 <HAL_RCC_ClockConfig+0x13e>
 8000f0c:	2b03      	cmp	r3, #3
 8000f0e:	d10c      	bne.n	8000f2a <HAL_RCC_ClockConfig+0xc6>
 8000f10:	68e2      	ldr	r2, [r4, #12]
 8000f12:	230c      	movs	r3, #12
 8000f14:	4013      	ands	r3, r2
 8000f16:	2b0c      	cmp	r3, #12
 8000f18:	d0c4      	beq.n	8000ea4 <HAL_RCC_ClockConfig+0x40>
 8000f1a:	f7ff fd97 	bl	8000a4c <HAL_GetTick>
 8000f1e:	9b01      	ldr	r3, [sp, #4]
 8000f20:	1ac0      	subs	r0, r0, r3
 8000f22:	4b22      	ldr	r3, [pc, #136]	; (8000fac <HAL_RCC_ClockConfig+0x148>)
 8000f24:	4298      	cmp	r0, r3
 8000f26:	d9f3      	bls.n	8000f10 <HAL_RCC_ClockConfig+0xac>
 8000f28:	e7ee      	b.n	8000f08 <HAL_RCC_ClockConfig+0xa4>
 8000f2a:	2b00      	cmp	r3, #0
 8000f2c:	d00c      	beq.n	8000f48 <HAL_RCC_ClockConfig+0xe4>
 8000f2e:	68e2      	ldr	r2, [r4, #12]
 8000f30:	230c      	movs	r3, #12
 8000f32:	4013      	ands	r3, r2
 8000f34:	2b04      	cmp	r3, #4
 8000f36:	d10c      	bne.n	8000f52 <HAL_RCC_ClockConfig+0xee>
 8000f38:	e7b4      	b.n	8000ea4 <HAL_RCC_ClockConfig+0x40>
 8000f3a:	f7ff fd87 	bl	8000a4c <HAL_GetTick>
 8000f3e:	9901      	ldr	r1, [sp, #4]
 8000f40:	4b1a      	ldr	r3, [pc, #104]	; (8000fac <HAL_RCC_ClockConfig+0x148>)
 8000f42:	1a40      	subs	r0, r0, r1
 8000f44:	4298      	cmp	r0, r3
 8000f46:	d8df      	bhi.n	8000f08 <HAL_RCC_ClockConfig+0xa4>
 8000f48:	68e2      	ldr	r2, [r4, #12]
 8000f4a:	230c      	movs	r3, #12
 8000f4c:	421a      	tst	r2, r3
 8000f4e:	d1f4      	bne.n	8000f3a <HAL_RCC_ClockConfig+0xd6>
 8000f50:	e7a8      	b.n	8000ea4 <HAL_RCC_ClockConfig+0x40>
 8000f52:	f7ff fd7b 	bl	8000a4c <HAL_GetTick>
 8000f56:	9a01      	ldr	r2, [sp, #4]
 8000f58:	4b14      	ldr	r3, [pc, #80]	; (8000fac <HAL_RCC_ClockConfig+0x148>)
 8000f5a:	1a80      	subs	r0, r0, r2
 8000f5c:	4298      	cmp	r0, r3
 8000f5e:	d9e6      	bls.n	8000f2e <HAL_RCC_ClockConfig+0xca>
 8000f60:	e7d2      	b.n	8000f08 <HAL_RCC_ClockConfig+0xa4>
 8000f62:	6811      	ldr	r1, [r2, #0]
 8000f64:	4399      	bics	r1, r3
 8000f66:	4331      	orrs	r1, r6
 8000f68:	6011      	str	r1, [r2, #0]
 8000f6a:	6812      	ldr	r2, [r2, #0]
 8000f6c:	4013      	ands	r3, r2
 8000f6e:	42b3      	cmp	r3, r6
 8000f70:	d194      	bne.n	8000e9c <HAL_RCC_ClockConfig+0x38>
 8000f72:	682b      	ldr	r3, [r5, #0]
 8000f74:	0758      	lsls	r0, r3, #29
 8000f76:	d506      	bpl.n	8000f86 <HAL_RCC_ClockConfig+0x122>
 8000f78:	4a0b      	ldr	r2, [pc, #44]	; (8000fa8 <HAL_RCC_ClockConfig+0x144>)
 8000f7a:	490d      	ldr	r1, [pc, #52]	; (8000fb0 <HAL_RCC_ClockConfig+0x14c>)
 8000f7c:	68d0      	ldr	r0, [r2, #12]
 8000f7e:	4001      	ands	r1, r0
 8000f80:	68e8      	ldr	r0, [r5, #12]
 8000f82:	4301      	orrs	r1, r0
 8000f84:	60d1      	str	r1, [r2, #12]
 8000f86:	0719      	lsls	r1, r3, #28
 8000f88:	d507      	bpl.n	8000f9a <HAL_RCC_ClockConfig+0x136>
 8000f8a:	4b07      	ldr	r3, [pc, #28]	; (8000fa8 <HAL_RCC_ClockConfig+0x144>)
 8000f8c:	6929      	ldr	r1, [r5, #16]
 8000f8e:	68d8      	ldr	r0, [r3, #12]
 8000f90:	4a08      	ldr	r2, [pc, #32]	; (8000fb4 <HAL_RCC_ClockConfig+0x150>)
 8000f92:	00c9      	lsls	r1, r1, #3
 8000f94:	4002      	ands	r2, r0
 8000f96:	430a      	orrs	r2, r1
 8000f98:	60da      	str	r2, [r3, #12]
 8000f9a:	2003      	movs	r0, #3
 8000f9c:	f7ff fd43 	bl	8000a26 <HAL_InitTick>
 8000fa0:	2000      	movs	r0, #0
 8000fa2:	bdfe      	pop	{r1, r2, r3, r4, r5, r6, r7, pc}
 8000fa4:	40022000 	.word	0x40022000
 8000fa8:	40021000 	.word	0x40021000
 8000fac:	00001388 	.word	0x00001388
 8000fb0:	fffff8ff 	.word	0xfffff8ff
 8000fb4:	ffffc7ff 	.word	0xffffc7ff

08000fb8 <HAL_RCC_GetSysClockFreq>:
 8000fb8:	b508      	push	{r3, lr}
 8000fba:	4b1b      	ldr	r3, [pc, #108]	; (8001028 <HAL_RCC_GetSysClockFreq+0x70>)
 8000fbc:	210c      	movs	r1, #12
 8000fbe:	685a      	ldr	r2, [r3, #4]
 8000fc0:	68d8      	ldr	r0, [r3, #12]
 8000fc2:	0412      	lsls	r2, r2, #16
 8000fc4:	4008      	ands	r0, r1
 8000fc6:	0f52      	lsrs	r2, r2, #29
 8000fc8:	f000 f996 	bl	80012f8 <__gnu_thumb1_case_uqi>
 8000fcc:	25252525 	.word	0x25252525
 8000fd0:	25252507 	.word	0x25252507
 8000fd4:	2525252a 	.word	0x2525252a
 8000fd8:	0c          	.byte	0x0c
 8000fd9:	00          	.byte	0x00
 8000fda:	681b      	ldr	r3, [r3, #0]
 8000fdc:	06d8      	lsls	r0, r3, #27
 8000fde:	d521      	bpl.n	8001024 <HAL_RCC_GetSysClockFreq+0x6c>
 8000fe0:	4812      	ldr	r0, [pc, #72]	; (800102c <HAL_RCC_GetSysClockFreq+0x74>)
 8000fe2:	e020      	b.n	8001026 <HAL_RCC_GetSysClockFreq+0x6e>
 8000fe4:	68da      	ldr	r2, [r3, #12]
 8000fe6:	68d9      	ldr	r1, [r3, #12]
 8000fe8:	0292      	lsls	r2, r2, #10
 8000fea:	4811      	ldr	r0, [pc, #68]	; (8001030 <HAL_RCC_GetSysClockFreq+0x78>)
 8000fec:	0209      	lsls	r1, r1, #8
 8000fee:	68db      	ldr	r3, [r3, #12]
 8000ff0:	0f12      	lsrs	r2, r2, #28
 8000ff2:	0f89      	lsrs	r1, r1, #30
 8000ff4:	5c82      	ldrb	r2, [r0, r2]
 8000ff6:	3101      	adds	r1, #1
 8000ff8:	03d8      	lsls	r0, r3, #15
 8000ffa:	d407      	bmi.n	800100c <HAL_RCC_GetSysClockFreq+0x54>
 8000ffc:	4b0a      	ldr	r3, [pc, #40]	; (8001028 <HAL_RCC_GetSysClockFreq+0x70>)
 8000ffe:	681b      	ldr	r3, [r3, #0]
 8001000:	06d8      	lsls	r0, r3, #27
 8001002:	d501      	bpl.n	8001008 <HAL_RCC_GetSysClockFreq+0x50>
 8001004:	4809      	ldr	r0, [pc, #36]	; (800102c <HAL_RCC_GetSysClockFreq+0x74>)
 8001006:	e002      	b.n	800100e <HAL_RCC_GetSysClockFreq+0x56>
 8001008:	480a      	ldr	r0, [pc, #40]	; (8001034 <HAL_RCC_GetSysClockFreq+0x7c>)
 800100a:	e000      	b.n	800100e <HAL_RCC_GetSysClockFreq+0x56>
 800100c:	480a      	ldr	r0, [pc, #40]	; (8001038 <HAL_RCC_GetSysClockFreq+0x80>)
 800100e:	4350      	muls	r0, r2
 8001010:	f000 f97c 	bl	800130c <__aeabi_uidiv>
 8001014:	e007      	b.n	8001026 <HAL_RCC_GetSysClockFreq+0x6e>
 8001016:	2080      	movs	r0, #128	; 0x80
 8001018:	3201      	adds	r2, #1
 800101a:	0200      	lsls	r0, r0, #8
 800101c:	4090      	lsls	r0, r2
 800101e:	e002      	b.n	8001026 <HAL_RCC_GetSysClockFreq+0x6e>
 8001020:	4805      	ldr	r0, [pc, #20]	; (8001038 <HAL_RCC_GetSysClockFreq+0x80>)
 8001022:	e000      	b.n	8001026 <HAL_RCC_GetSysClockFreq+0x6e>
 8001024:	4803      	ldr	r0, [pc, #12]	; (8001034 <HAL_RCC_GetSysClockFreq+0x7c>)
 8001026:	bd08      	pop	{r3, pc}
 8001028:	40021000 	.word	0x40021000
 800102c:	003d0900 	.word	0x003d0900
 8001030:	080015c5 	.word	0x080015c5
 8001034:	00f42400 	.word	0x00f42400
 8001038:	007a1200 	.word	0x007a1200

0800103c <HAL_RCC_GetHCLKFreq>:
 800103c:	b508      	push	{r3, lr}
 800103e:	f7ff ffbb 	bl	8000fb8 <HAL_RCC_GetSysClockFreq>
 8001042:	4b05      	ldr	r3, [pc, #20]	; (8001058 <HAL_RCC_GetHCLKFreq+0x1c>)
 8001044:	4a05      	ldr	r2, [pc, #20]	; (800105c <HAL_RCC_GetHCLKFreq+0x20>)
 8001046:	68db      	ldr	r3, [r3, #12]
 8001048:	061b      	lsls	r3, r3, #24
 800104a:	0f1b      	lsrs	r3, r3, #28
 800104c:	5cd3      	ldrb	r3, [r2, r3]
 800104e:	40d8      	lsrs	r0, r3
 8001050:	4b03      	ldr	r3, [pc, #12]	; (8001060 <HAL_RCC_GetHCLKFreq+0x24>)
 8001052:	6018      	str	r0, [r3, #0]
 8001054:	bd08      	pop	{r3, pc}
 8001056:	46c0      	nop			; (mov r8, r8)
 8001058:	40021000 	.word	0x40021000
 800105c:	080015ce 	.word	0x080015ce
 8001060:	20000000 	.word	0x20000000

08001064 <HAL_GPIO_Init>:
 8001064:	b5f0      	push	{r4, r5, r6, r7, lr}
 8001066:	680a      	ldr	r2, [r1, #0]
 8001068:	b085      	sub	sp, #20
 800106a:	9203      	str	r2, [sp, #12]
 800106c:	2300      	movs	r3, #0
 800106e:	9a03      	ldr	r2, [sp, #12]
 8001070:	40da      	lsrs	r2, r3
 8001072:	d100      	bne.n	8001076 <HAL_GPIO_Init+0x12>
 8001074:	e097      	b.n	80011a6 <HAL_GPIO_Init+0x142>
 8001076:	2201      	movs	r2, #1
 8001078:	9c03      	ldr	r4, [sp, #12]
 800107a:	409a      	lsls	r2, r3
 800107c:	4014      	ands	r4, r2
 800107e:	46a4      	mov	ip, r4
 8001080:	d100      	bne.n	8001084 <HAL_GPIO_Init+0x20>
 8001082:	e08e      	b.n	80011a2 <HAL_GPIO_Init+0x13e>
 8001084:	684a      	ldr	r2, [r1, #4]
 8001086:	2410      	movs	r4, #16
 8001088:	1c15      	adds	r5, r2, #0
 800108a:	43a5      	bics	r5, r4
 800108c:	1c2c      	adds	r4, r5, #0
 800108e:	3d01      	subs	r5, #1
 8001090:	2c02      	cmp	r4, #2
 8001092:	d10e      	bne.n	80010b2 <HAL_GPIO_Init+0x4e>
 8001094:	08dc      	lsrs	r4, r3, #3
 8001096:	00a4      	lsls	r4, r4, #2
 8001098:	2507      	movs	r5, #7
 800109a:	1904      	adds	r4, r0, r4
 800109c:	401d      	ands	r5, r3
 800109e:	6a26      	ldr	r6, [r4, #32]
 80010a0:	00ad      	lsls	r5, r5, #2
 80010a2:	270f      	movs	r7, #15
 80010a4:	40af      	lsls	r7, r5
 80010a6:	43be      	bics	r6, r7
 80010a8:	690f      	ldr	r7, [r1, #16]
 80010aa:	40af      	lsls	r7, r5
 80010ac:	433e      	orrs	r6, r7
 80010ae:	6226      	str	r6, [r4, #32]
 80010b0:	e001      	b.n	80010b6 <HAL_GPIO_Init+0x52>
 80010b2:	2d01      	cmp	r5, #1
 80010b4:	d812      	bhi.n	80010dc <HAL_GPIO_Init+0x78>
 80010b6:	6886      	ldr	r6, [r0, #8]
 80010b8:	005c      	lsls	r4, r3, #1
 80010ba:	2503      	movs	r5, #3
 80010bc:	40a5      	lsls	r5, r4
 80010be:	43ae      	bics	r6, r5
 80010c0:	68cd      	ldr	r5, [r1, #12]
 80010c2:	40a5      	lsls	r5, r4
 80010c4:	1c34      	adds	r4, r6, #0
 80010c6:	432c      	orrs	r4, r5
 80010c8:	6084      	str	r4, [r0, #8]
 80010ca:	6844      	ldr	r4, [r0, #4]
 80010cc:	2501      	movs	r5, #1
 80010ce:	409d      	lsls	r5, r3
 80010d0:	43ac      	bics	r4, r5
 80010d2:	06d5      	lsls	r5, r2, #27
 80010d4:	0fed      	lsrs	r5, r5, #31
 80010d6:	409d      	lsls	r5, r3
 80010d8:	432c      	orrs	r4, r5
 80010da:	6044      	str	r4, [r0, #4]
 80010dc:	2403      	movs	r4, #3
 80010de:	005d      	lsls	r5, r3, #1
 80010e0:	1c26      	adds	r6, r4, #0
 80010e2:	6807      	ldr	r7, [r0, #0]
 80010e4:	40ae      	lsls	r6, r5
 80010e6:	43f6      	mvns	r6, r6
 80010e8:	9600      	str	r6, [sp, #0]
 80010ea:	403e      	ands	r6, r7
 80010ec:	1c17      	adds	r7, r2, #0
 80010ee:	4027      	ands	r7, r4
 80010f0:	40af      	lsls	r7, r5
 80010f2:	4337      	orrs	r7, r6
 80010f4:	6007      	str	r7, [r0, #0]
 80010f6:	68c7      	ldr	r7, [r0, #12]
 80010f8:	9e00      	ldr	r6, [sp, #0]
 80010fa:	403e      	ands	r6, r7
 80010fc:	688f      	ldr	r7, [r1, #8]
 80010fe:	40af      	lsls	r7, r5
 8001100:	433e      	orrs	r6, r7
 8001102:	60c6      	str	r6, [r0, #12]
 8001104:	00d5      	lsls	r5, r2, #3
 8001106:	d54c      	bpl.n	80011a2 <HAL_GPIO_Init+0x13e>
 8001108:	4d28      	ldr	r5, [pc, #160]	; (80011ac <HAL_GPIO_Init+0x148>)
 800110a:	2601      	movs	r6, #1
 800110c:	6b6f      	ldr	r7, [r5, #52]	; 0x34
 800110e:	401c      	ands	r4, r3
 8001110:	4337      	orrs	r7, r6
 8001112:	636f      	str	r7, [r5, #52]	; 0x34
 8001114:	4f26      	ldr	r7, [pc, #152]	; (80011b0 <HAL_GPIO_Init+0x14c>)
 8001116:	089d      	lsrs	r5, r3, #2
 8001118:	00ad      	lsls	r5, r5, #2
 800111a:	19ed      	adds	r5, r5, r7
 800111c:	68af      	ldr	r7, [r5, #8]
 800111e:	00a4      	lsls	r4, r4, #2
 8001120:	9402      	str	r4, [sp, #8]
 8001122:	9701      	str	r7, [sp, #4]
 8001124:	9f02      	ldr	r7, [sp, #8]
 8001126:	240f      	movs	r4, #15
 8001128:	40bc      	lsls	r4, r7
 800112a:	9f01      	ldr	r7, [sp, #4]
 800112c:	43a7      	bics	r7, r4
 800112e:	24a0      	movs	r4, #160	; 0xa0
 8001130:	05e4      	lsls	r4, r4, #23
 8001132:	42a0      	cmp	r0, r4
 8001134:	d00b      	beq.n	800114e <HAL_GPIO_Init+0xea>
 8001136:	4c1f      	ldr	r4, [pc, #124]	; (80011b4 <HAL_GPIO_Init+0x150>)
 8001138:	42a0      	cmp	r0, r4
 800113a:	d00b      	beq.n	8001154 <HAL_GPIO_Init+0xf0>
 800113c:	4c1e      	ldr	r4, [pc, #120]	; (80011b8 <HAL_GPIO_Init+0x154>)
 800113e:	42a0      	cmp	r0, r4
 8001140:	d007      	beq.n	8001152 <HAL_GPIO_Init+0xee>
 8001142:	4c1e      	ldr	r4, [pc, #120]	; (80011bc <HAL_GPIO_Init+0x158>)
 8001144:	1906      	adds	r6, r0, r4
 8001146:	1e74      	subs	r4, r6, #1
 8001148:	41a6      	sbcs	r6, r4
 800114a:	3605      	adds	r6, #5
 800114c:	e002      	b.n	8001154 <HAL_GPIO_Init+0xf0>
 800114e:	2600      	movs	r6, #0
 8001150:	e000      	b.n	8001154 <HAL_GPIO_Init+0xf0>
 8001152:	2602      	movs	r6, #2
 8001154:	9c02      	ldr	r4, [sp, #8]
 8001156:	40a6      	lsls	r6, r4
 8001158:	4337      	orrs	r7, r6
 800115a:	4c19      	ldr	r4, [pc, #100]	; (80011c0 <HAL_GPIO_Init+0x15c>)
 800115c:	60af      	str	r7, [r5, #8]
 800115e:	4667      	mov	r7, ip
 8001160:	6826      	ldr	r6, [r4, #0]
 8001162:	43fd      	mvns	r5, r7
 8001164:	03d7      	lsls	r7, r2, #15
 8001166:	d401      	bmi.n	800116c <HAL_GPIO_Init+0x108>
 8001168:	402e      	ands	r6, r5
 800116a:	e001      	b.n	8001170 <HAL_GPIO_Init+0x10c>
 800116c:	4667      	mov	r7, ip
 800116e:	433e      	orrs	r6, r7
 8001170:	6026      	str	r6, [r4, #0]
 8001172:	6866      	ldr	r6, [r4, #4]
 8001174:	0397      	lsls	r7, r2, #14
 8001176:	d401      	bmi.n	800117c <HAL_GPIO_Init+0x118>
 8001178:	402e      	ands	r6, r5
 800117a:	e001      	b.n	8001180 <HAL_GPIO_Init+0x11c>
 800117c:	4667      	mov	r7, ip
 800117e:	433e      	orrs	r6, r7
 8001180:	6066      	str	r6, [r4, #4]
 8001182:	68a6      	ldr	r6, [r4, #8]
 8001184:	02d7      	lsls	r7, r2, #11
 8001186:	d401      	bmi.n	800118c <HAL_GPIO_Init+0x128>
 8001188:	402e      	ands	r6, r5
 800118a:	e001      	b.n	8001190 <HAL_GPIO_Init+0x12c>
 800118c:	4667      	mov	r7, ip
 800118e:	433e      	orrs	r6, r7
 8001190:	60a6      	str	r6, [r4, #8]
 8001192:	68e6      	ldr	r6, [r4, #12]
 8001194:	0297      	lsls	r7, r2, #10
 8001196:	d401      	bmi.n	800119c <HAL_GPIO_Init+0x138>
 8001198:	4035      	ands	r5, r6
 800119a:	e001      	b.n	80011a0 <HAL_GPIO_Init+0x13c>
 800119c:	4665      	mov	r5, ip
 800119e:	4335      	orrs	r5, r6
 80011a0:	60e5      	str	r5, [r4, #12]
 80011a2:	3301      	adds	r3, #1
 80011a4:	e763      	b.n	800106e <HAL_GPIO_Init+0xa>
 80011a6:	b005      	add	sp, #20
 80011a8:	bdf0      	pop	{r4, r5, r6, r7, pc}
 80011aa:	46c0      	nop			; (mov r8, r8)
 80011ac:	40021000 	.word	0x40021000
 80011b0:	40010000 	.word	0x40010000
 80011b4:	50000400 	.word	0x50000400
 80011b8:	50000800 	.word	0x50000800
 80011bc:	afffe400 	.word	0xafffe400
 80011c0:	40010400 	.word	0x40010400

080011c4 <SystemClock_Config>:
 80011c4:	b500      	push	{lr}
 80011c6:	b093      	sub	sp, #76	; 0x4c
 80011c8:	2100      	movs	r1, #0
 80011ca:	2214      	movs	r2, #20
 80011cc:	4668      	mov	r0, sp
 80011ce:	f000 f94d 	bl	800146c <memset>
 80011d2:	2100      	movs	r1, #0
 80011d4:	2234      	movs	r2, #52	; 0x34
 80011d6:	a805      	add	r0, sp, #20
 80011d8:	f000 f948 	bl	800146c <memset>
 80011dc:	2310      	movs	r3, #16
 80011de:	9305      	str	r3, [sp, #20]
 80011e0:	2301      	movs	r3, #1
 80011e2:	930b      	str	r3, [sp, #44]	; 0x2c
 80011e4:	23a0      	movs	r3, #160	; 0xa0
 80011e6:	021b      	lsls	r3, r3, #8
 80011e8:	a805      	add	r0, sp, #20
 80011ea:	930d      	str	r3, [sp, #52]	; 0x34
 80011ec:	f7ff fc34 	bl	8000a58 <HAL_RCC_OscConfig>
 80011f0:	1e01      	subs	r1, r0, #0
 80011f2:	d000      	beq.n	80011f6 <SystemClock_Config+0x32>
 80011f4:	e7fe      	b.n	80011f4 <SystemClock_Config+0x30>
 80011f6:	230f      	movs	r3, #15
 80011f8:	9001      	str	r0, [sp, #4]
 80011fa:	9002      	str	r0, [sp, #8]
 80011fc:	9003      	str	r0, [sp, #12]
 80011fe:	9004      	str	r0, [sp, #16]
 8001200:	4668      	mov	r0, sp
 8001202:	9300      	str	r3, [sp, #0]
 8001204:	f7ff fe2e 	bl	8000e64 <HAL_RCC_ClockConfig>
 8001208:	2800      	cmp	r0, #0
 800120a:	d000      	beq.n	800120e <SystemClock_Config+0x4a>
 800120c:	e7fe      	b.n	800120c <SystemClock_Config+0x48>
 800120e:	4b09      	ldr	r3, [pc, #36]	; (8001234 <SystemClock_Config+0x70>)
 8001210:	2280      	movs	r2, #128	; 0x80
 8001212:	6b99      	ldr	r1, [r3, #56]	; 0x38
 8001214:	0552      	lsls	r2, r2, #21
 8001216:	430a      	orrs	r2, r1
 8001218:	639a      	str	r2, [r3, #56]	; 0x38
 800121a:	4a07      	ldr	r2, [pc, #28]	; (8001238 <SystemClock_Config+0x74>)
 800121c:	21c0      	movs	r1, #192	; 0xc0
 800121e:	6810      	ldr	r0, [r2, #0]
 8001220:	0149      	lsls	r1, r1, #5
 8001222:	4301      	orrs	r1, r0
 8001224:	6011      	str	r1, [r2, #0]
 8001226:	6b99      	ldr	r1, [r3, #56]	; 0x38
 8001228:	4a04      	ldr	r2, [pc, #16]	; (800123c <SystemClock_Config+0x78>)
 800122a:	400a      	ands	r2, r1
 800122c:	639a      	str	r2, [r3, #56]	; 0x38
 800122e:	b013      	add	sp, #76	; 0x4c
 8001230:	bd00      	pop	{pc}
 8001232:	46c0      	nop			; (mov r8, r8)
 8001234:	40021000 	.word	0x40021000
 8001238:	40007000 	.word	0x40007000
 800123c:	efffffff 	.word	0xefffffff

08001240 <lib_low_level_init>:
 8001240:	b508      	push	{r3, lr}
 8001242:	f7ff ffbf 	bl	80011c4 <SystemClock_Config>
 8001246:	f000 f805 	bl	8001254 <gpio_init>
 800124a:	f7ff faed 	bl	8000828 <uart_init>
 800124e:	f7ff fa67 	bl	8000720 <timer_init>
 8001252:	bd08      	pop	{r3, pc}

08001254 <gpio_init>:
 8001254:	b530      	push	{r4, r5, lr}
 8001256:	4a0a      	ldr	r2, [pc, #40]	; (8001280 <gpio_init+0x2c>)
 8001258:	2303      	movs	r3, #3
 800125a:	6ad1      	ldr	r1, [r2, #44]	; 0x2c
 800125c:	4c09      	ldr	r4, [pc, #36]	; (8001284 <gpio_init+0x30>)
 800125e:	b087      	sub	sp, #28
 8001260:	4319      	orrs	r1, r3
 8001262:	62d1      	str	r1, [r2, #44]	; 0x2c
 8001264:	2508      	movs	r5, #8
 8001266:	2201      	movs	r2, #1
 8001268:	1c20      	adds	r0, r4, #0
 800126a:	a901      	add	r1, sp, #4
 800126c:	9202      	str	r2, [sp, #8]
 800126e:	9203      	str	r2, [sp, #12]
 8001270:	9304      	str	r3, [sp, #16]
 8001272:	9501      	str	r5, [sp, #4]
 8001274:	f7ff fef6 	bl	8001064 <HAL_GPIO_Init>
 8001278:	62a5      	str	r5, [r4, #40]	; 0x28
 800127a:	b007      	add	sp, #28
 800127c:	bd30      	pop	{r4, r5, pc}
 800127e:	46c0      	nop			; (mov r8, r8)
 8001280:	40021000 	.word	0x40021000
 8001284:	50000400 	.word	0x50000400

08001288 <led_on>:
 8001288:	4b01      	ldr	r3, [pc, #4]	; (8001290 <led_on+0x8>)
 800128a:	6198      	str	r0, [r3, #24]
 800128c:	4770      	bx	lr
 800128e:	46c0      	nop			; (mov r8, r8)
 8001290:	50000400 	.word	0x50000400

08001294 <led_off>:
 8001294:	4b01      	ldr	r3, [pc, #4]	; (800129c <led_off+0x8>)
 8001296:	6298      	str	r0, [r3, #40]	; 0x28
 8001298:	4770      	bx	lr
 800129a:	46c0      	nop			; (mov r8, r8)
 800129c:	50000400 	.word	0x50000400

080012a0 <Default_Handler>:
 80012a0:	46c0      	nop			; (mov r8, r8)
 80012a2:	e7fd      	b.n	80012a0 <Default_Handler>

080012a4 <HardFault_Handler>:
 80012a4:	2008      	movs	r0, #8
 80012a6:	f7ff ffef 	bl	8001288 <led_on>
 80012aa:	4b07      	ldr	r3, [pc, #28]	; (80012c8 <HardFault_Handler+0x24>)
 80012ac:	3b01      	subs	r3, #1
 80012ae:	2b00      	cmp	r3, #0
 80012b0:	d001      	beq.n	80012b6 <HardFault_Handler+0x12>
 80012b2:	46c0      	nop			; (mov r8, r8)
 80012b4:	e7fa      	b.n	80012ac <HardFault_Handler+0x8>
 80012b6:	2008      	movs	r0, #8
 80012b8:	f7ff ffec 	bl	8001294 <led_off>
 80012bc:	4b02      	ldr	r3, [pc, #8]	; (80012c8 <HardFault_Handler+0x24>)
 80012be:	3b01      	subs	r3, #1
 80012c0:	2b00      	cmp	r3, #0
 80012c2:	d0ef      	beq.n	80012a4 <HardFault_Handler>
 80012c4:	46c0      	nop			; (mov r8, r8)
 80012c6:	e7fa      	b.n	80012be <HardFault_Handler+0x1a>
 80012c8:	000186a1 	.word	0x000186a1

080012cc <_reset_init>:
 80012cc:	4a07      	ldr	r2, [pc, #28]	; (80012ec <_reset_init+0x20>)
 80012ce:	4908      	ldr	r1, [pc, #32]	; (80012f0 <_reset_init+0x24>)
 80012d0:	2300      	movs	r3, #0
 80012d2:	1a89      	subs	r1, r1, r2
 80012d4:	1089      	asrs	r1, r1, #2
 80012d6:	1c10      	adds	r0, r2, #0
 80012d8:	428b      	cmp	r3, r1
 80012da:	d005      	beq.n	80012e8 <_reset_init+0x1c>
 80012dc:	4c05      	ldr	r4, [pc, #20]	; (80012f4 <_reset_init+0x28>)
 80012de:	009a      	lsls	r2, r3, #2
 80012e0:	58a4      	ldr	r4, [r4, r2]
 80012e2:	3301      	adds	r3, #1
 80012e4:	5084      	str	r4, [r0, r2]
 80012e6:	e7f7      	b.n	80012d8 <_reset_init+0xc>
 80012e8:	f7ff fa04 	bl	80006f4 <main>
 80012ec:	20000000 	.word	0x20000000
 80012f0:	20000004 	.word	0x20000004
 80012f4:	080015e4 	.word	0x080015e4

080012f8 <__gnu_thumb1_case_uqi>:
 80012f8:	b402      	push	{r1}
 80012fa:	4671      	mov	r1, lr
 80012fc:	0849      	lsrs	r1, r1, #1
 80012fe:	0049      	lsls	r1, r1, #1
 8001300:	5c09      	ldrb	r1, [r1, r0]
 8001302:	0049      	lsls	r1, r1, #1
 8001304:	448e      	add	lr, r1
 8001306:	bc02      	pop	{r1}
 8001308:	4770      	bx	lr
 800130a:	46c0      	nop			; (mov r8, r8)

0800130c <__aeabi_uidiv>:
 800130c:	2900      	cmp	r1, #0
 800130e:	d034      	beq.n	800137a <.udivsi3_skip_div0_test+0x6a>

08001310 <.udivsi3_skip_div0_test>:
 8001310:	2301      	movs	r3, #1
 8001312:	2200      	movs	r2, #0
 8001314:	b410      	push	{r4}
 8001316:	4288      	cmp	r0, r1
 8001318:	d32c      	bcc.n	8001374 <.udivsi3_skip_div0_test+0x64>
 800131a:	2401      	movs	r4, #1
 800131c:	0724      	lsls	r4, r4, #28
 800131e:	42a1      	cmp	r1, r4
 8001320:	d204      	bcs.n	800132c <.udivsi3_skip_div0_test+0x1c>
 8001322:	4281      	cmp	r1, r0
 8001324:	d202      	bcs.n	800132c <.udivsi3_skip_div0_test+0x1c>
 8001326:	0109      	lsls	r1, r1, #4
 8001328:	011b      	lsls	r3, r3, #4
 800132a:	e7f8      	b.n	800131e <.udivsi3_skip_div0_test+0xe>
 800132c:	00e4      	lsls	r4, r4, #3
 800132e:	42a1      	cmp	r1, r4
 8001330:	d204      	bcs.n	800133c <.udivsi3_skip_div0_test+0x2c>
 8001332:	4281      	cmp	r1, r0
 8001334:	d202      	bcs.n	800133c <.udivsi3_skip_div0_test+0x2c>
 8001336:	0049      	lsls	r1, r1, #1
 8001338:	005b      	lsls	r3, r3, #1
 800133a:	e7f8      	b.n	800132e <.udivsi3_skip_div0_test+0x1e>
 800133c:	4288      	cmp	r0, r1
 800133e:	d301      	bcc.n	8001344 <.udivsi3_skip_div0_test+0x34>
 8001340:	1a40      	subs	r0, r0, r1
 8001342:	431a      	orrs	r2, r3
 8001344:	084c      	lsrs	r4, r1, #1
 8001346:	42a0      	cmp	r0, r4
 8001348:	d302      	bcc.n	8001350 <.udivsi3_skip_div0_test+0x40>
 800134a:	1b00      	subs	r0, r0, r4
 800134c:	085c      	lsrs	r4, r3, #1
 800134e:	4322      	orrs	r2, r4
 8001350:	088c      	lsrs	r4, r1, #2
 8001352:	42a0      	cmp	r0, r4
 8001354:	d302      	bcc.n	800135c <.udivsi3_skip_div0_test+0x4c>
 8001356:	1b00      	subs	r0, r0, r4
 8001358:	089c      	lsrs	r4, r3, #2
 800135a:	4322      	orrs	r2, r4
 800135c:	08cc      	lsrs	r4, r1, #3
 800135e:	42a0      	cmp	r0, r4
 8001360:	d302      	bcc.n	8001368 <.udivsi3_skip_div0_test+0x58>
 8001362:	1b00      	subs	r0, r0, r4
 8001364:	08dc      	lsrs	r4, r3, #3
 8001366:	4322      	orrs	r2, r4
 8001368:	2800      	cmp	r0, #0
 800136a:	d003      	beq.n	8001374 <.udivsi3_skip_div0_test+0x64>
 800136c:	091b      	lsrs	r3, r3, #4
 800136e:	d001      	beq.n	8001374 <.udivsi3_skip_div0_test+0x64>
 8001370:	0909      	lsrs	r1, r1, #4
 8001372:	e7e3      	b.n	800133c <.udivsi3_skip_div0_test+0x2c>
 8001374:	1c10      	adds	r0, r2, #0
 8001376:	bc10      	pop	{r4}
 8001378:	4770      	bx	lr
 800137a:	2800      	cmp	r0, #0
 800137c:	d001      	beq.n	8001382 <.udivsi3_skip_div0_test+0x72>
 800137e:	2000      	movs	r0, #0
 8001380:	43c0      	mvns	r0, r0
 8001382:	b407      	push	{r0, r1, r2}
 8001384:	4802      	ldr	r0, [pc, #8]	; (8001390 <.udivsi3_skip_div0_test+0x80>)
 8001386:	a102      	add	r1, pc, #8	; (adr r1, 8001390 <.udivsi3_skip_div0_test+0x80>)
 8001388:	1840      	adds	r0, r0, r1
 800138a:	9002      	str	r0, [sp, #8]
 800138c:	bd03      	pop	{r0, r1, pc}
 800138e:	46c0      	nop			; (mov r8, r8)
 8001390:	000000d9 	.word	0x000000d9

08001394 <__aeabi_uidivmod>:
 8001394:	2900      	cmp	r1, #0
 8001396:	d0f0      	beq.n	800137a <.udivsi3_skip_div0_test+0x6a>
 8001398:	b503      	push	{r0, r1, lr}
 800139a:	f7ff ffb9 	bl	8001310 <.udivsi3_skip_div0_test>
 800139e:	bc0e      	pop	{r1, r2, r3}
 80013a0:	4342      	muls	r2, r0
 80013a2:	1a89      	subs	r1, r1, r2
 80013a4:	4718      	bx	r3
 80013a6:	46c0      	nop			; (mov r8, r8)

080013a8 <__aeabi_idiv>:
 80013a8:	2900      	cmp	r1, #0
 80013aa:	d041      	beq.n	8001430 <.divsi3_skip_div0_test+0x84>

080013ac <.divsi3_skip_div0_test>:
 80013ac:	b410      	push	{r4}
 80013ae:	1c04      	adds	r4, r0, #0
 80013b0:	404c      	eors	r4, r1
 80013b2:	46a4      	mov	ip, r4
 80013b4:	2301      	movs	r3, #1
 80013b6:	2200      	movs	r2, #0
 80013b8:	2900      	cmp	r1, #0
 80013ba:	d500      	bpl.n	80013be <.divsi3_skip_div0_test+0x12>
 80013bc:	4249      	negs	r1, r1
 80013be:	2800      	cmp	r0, #0
 80013c0:	d500      	bpl.n	80013c4 <.divsi3_skip_div0_test+0x18>
 80013c2:	4240      	negs	r0, r0
 80013c4:	4288      	cmp	r0, r1
 80013c6:	d32c      	bcc.n	8001422 <.divsi3_skip_div0_test+0x76>
 80013c8:	2401      	movs	r4, #1
 80013ca:	0724      	lsls	r4, r4, #28
 80013cc:	42a1      	cmp	r1, r4
 80013ce:	d204      	bcs.n	80013da <.divsi3_skip_div0_test+0x2e>
 80013d0:	4281      	cmp	r1, r0
 80013d2:	d202      	bcs.n	80013da <.divsi3_skip_div0_test+0x2e>
 80013d4:	0109      	lsls	r1, r1, #4
 80013d6:	011b      	lsls	r3, r3, #4
 80013d8:	e7f8      	b.n	80013cc <.divsi3_skip_div0_test+0x20>
 80013da:	00e4      	lsls	r4, r4, #3
 80013dc:	42a1      	cmp	r1, r4
 80013de:	d204      	bcs.n	80013ea <.divsi3_skip_div0_test+0x3e>
 80013e0:	4281      	cmp	r1, r0
 80013e2:	d202      	bcs.n	80013ea <.divsi3_skip_div0_test+0x3e>
 80013e4:	0049      	lsls	r1, r1, #1
 80013e6:	005b      	lsls	r3, r3, #1
 80013e8:	e7f8      	b.n	80013dc <.divsi3_skip_div0_test+0x30>
 80013ea:	4288      	cmp	r0, r1
 80013ec:	d301      	bcc.n	80013f2 <.divsi3_skip_div0_test+0x46>
 80013ee:	1a40      	subs	r0, r0, r1
 80013f0:	431a      	orrs	r2, r3
 80013f2:	084c      	lsrs	r4, r1, #1
 80013f4:	42a0      	cmp	r0, r4
 80013f6:	d302      	bcc.n	80013fe <.divsi3_skip_div0_test+0x52>
 80013f8:	1b00      	subs	r0, r0, r4
 80013fa:	085c      	lsrs	r4, r3, #1
 80013fc:	4322      	orrs	r2, r4
 80013fe:	088c      	lsrs	r4, r1, #2
 8001400:	42a0      	cmp	r0, r4
 8001402:	d302      	bcc.n	800140a <.divsi3_skip_div0_test+0x5e>
 8001404:	1b00      	subs	r0, r0, r4
 8001406:	089c      	lsrs	r4, r3, #2
 8001408:	4322      	orrs	r2, r4
 800140a:	08cc      	lsrs	r4, r1, #3
 800140c:	42a0      	cmp	r0, r4
 800140e:	d302      	bcc.n	8001416 <.divsi3_skip_div0_test+0x6a>
 8001410:	1b00      	subs	r0, r0, r4
 8001412:	08dc      	lsrs	r4, r3, #3
 8001414:	4322      	orrs	r2, r4
 8001416:	2800      	cmp	r0, #0
 8001418:	d003      	beq.n	8001422 <.divsi3_skip_div0_test+0x76>
 800141a:	091b      	lsrs	r3, r3, #4
 800141c:	d001      	beq.n	8001422 <.divsi3_skip_div0_test+0x76>
 800141e:	0909      	lsrs	r1, r1, #4
 8001420:	e7e3      	b.n	80013ea <.divsi3_skip_div0_test+0x3e>
 8001422:	1c10      	adds	r0, r2, #0
 8001424:	4664      	mov	r4, ip
 8001426:	2c00      	cmp	r4, #0
 8001428:	d500      	bpl.n	800142c <.divsi3_skip_div0_test+0x80>
 800142a:	4240      	negs	r0, r0
 800142c:	bc10      	pop	{r4}
 800142e:	4770      	bx	lr
 8001430:	2800      	cmp	r0, #0
 8001432:	d006      	beq.n	8001442 <.divsi3_skip_div0_test+0x96>
 8001434:	db03      	blt.n	800143e <.divsi3_skip_div0_test+0x92>
 8001436:	2000      	movs	r0, #0
 8001438:	43c0      	mvns	r0, r0
 800143a:	0840      	lsrs	r0, r0, #1
 800143c:	e001      	b.n	8001442 <.divsi3_skip_div0_test+0x96>
 800143e:	2080      	movs	r0, #128	; 0x80
 8001440:	0600      	lsls	r0, r0, #24
 8001442:	b407      	push	{r0, r1, r2}
 8001444:	4802      	ldr	r0, [pc, #8]	; (8001450 <.divsi3_skip_div0_test+0xa4>)
 8001446:	a102      	add	r1, pc, #8	; (adr r1, 8001450 <.divsi3_skip_div0_test+0xa4>)
 8001448:	1840      	adds	r0, r0, r1
 800144a:	9002      	str	r0, [sp, #8]
 800144c:	bd03      	pop	{r0, r1, pc}
 800144e:	46c0      	nop			; (mov r8, r8)
 8001450:	00000019 	.word	0x00000019

08001454 <__aeabi_idivmod>:
 8001454:	2900      	cmp	r1, #0
 8001456:	d0eb      	beq.n	8001430 <.divsi3_skip_div0_test+0x84>
 8001458:	b503      	push	{r0, r1, lr}
 800145a:	f7ff ffa7 	bl	80013ac <.divsi3_skip_div0_test>
 800145e:	bc0e      	pop	{r1, r2, r3}
 8001460:	4342      	muls	r2, r0
 8001462:	1a89      	subs	r1, r1, r2
 8001464:	4718      	bx	r3
 8001466:	46c0      	nop			; (mov r8, r8)

08001468 <__aeabi_idiv0>:
 8001468:	4770      	bx	lr
 800146a:	46c0      	nop			; (mov r8, r8)

0800146c <memset>:
 800146c:	b5f0      	push	{r4, r5, r6, r7, lr}
 800146e:	0783      	lsls	r3, r0, #30
 8001470:	d046      	beq.n	8001500 <memset+0x94>
 8001472:	1e54      	subs	r4, r2, #1
 8001474:	2a00      	cmp	r2, #0
 8001476:	d042      	beq.n	80014fe <memset+0x92>
 8001478:	b2ce      	uxtb	r6, r1
 800147a:	1c03      	adds	r3, r0, #0
 800147c:	2503      	movs	r5, #3
 800147e:	e003      	b.n	8001488 <memset+0x1c>
 8001480:	1e62      	subs	r2, r4, #1
 8001482:	2c00      	cmp	r4, #0
 8001484:	d03b      	beq.n	80014fe <memset+0x92>
 8001486:	1c14      	adds	r4, r2, #0
 8001488:	3301      	adds	r3, #1
 800148a:	1e5a      	subs	r2, r3, #1
 800148c:	7016      	strb	r6, [r2, #0]
 800148e:	422b      	tst	r3, r5
 8001490:	d1f6      	bne.n	8001480 <memset+0x14>
 8001492:	2c03      	cmp	r4, #3
 8001494:	d92b      	bls.n	80014ee <memset+0x82>
 8001496:	25ff      	movs	r5, #255	; 0xff
 8001498:	400d      	ands	r5, r1
 800149a:	022a      	lsls	r2, r5, #8
 800149c:	4315      	orrs	r5, r2
 800149e:	042a      	lsls	r2, r5, #16
 80014a0:	4315      	orrs	r5, r2
 80014a2:	2c0f      	cmp	r4, #15
 80014a4:	d915      	bls.n	80014d2 <memset+0x66>
 80014a6:	1c27      	adds	r7, r4, #0
 80014a8:	3f10      	subs	r7, #16
 80014aa:	093f      	lsrs	r7, r7, #4
 80014ac:	1c1e      	adds	r6, r3, #0
 80014ae:	013a      	lsls	r2, r7, #4
 80014b0:	3610      	adds	r6, #16
 80014b2:	18b6      	adds	r6, r6, r2
 80014b4:	1c1a      	adds	r2, r3, #0
 80014b6:	6015      	str	r5, [r2, #0]
 80014b8:	6055      	str	r5, [r2, #4]
 80014ba:	6095      	str	r5, [r2, #8]
 80014bc:	60d5      	str	r5, [r2, #12]
 80014be:	3210      	adds	r2, #16
 80014c0:	42b2      	cmp	r2, r6
 80014c2:	d1f8      	bne.n	80014b6 <memset+0x4a>
 80014c4:	3701      	adds	r7, #1
 80014c6:	013f      	lsls	r7, r7, #4
 80014c8:	220f      	movs	r2, #15
 80014ca:	19db      	adds	r3, r3, r7
 80014cc:	4014      	ands	r4, r2
 80014ce:	2c03      	cmp	r4, #3
 80014d0:	d90d      	bls.n	80014ee <memset+0x82>
 80014d2:	1f27      	subs	r7, r4, #4
 80014d4:	08bf      	lsrs	r7, r7, #2
 80014d6:	00ba      	lsls	r2, r7, #2
 80014d8:	1d1e      	adds	r6, r3, #4
 80014da:	18b6      	adds	r6, r6, r2
 80014dc:	1c1a      	adds	r2, r3, #0
 80014de:	c220      	stmia	r2!, {r5}
 80014e0:	42b2      	cmp	r2, r6
 80014e2:	d1fc      	bne.n	80014de <memset+0x72>
 80014e4:	3701      	adds	r7, #1
 80014e6:	00bf      	lsls	r7, r7, #2
 80014e8:	2203      	movs	r2, #3
 80014ea:	19db      	adds	r3, r3, r7
 80014ec:	4014      	ands	r4, r2
 80014ee:	2c00      	cmp	r4, #0
 80014f0:	d005      	beq.n	80014fe <memset+0x92>
 80014f2:	191c      	adds	r4, r3, r4
 80014f4:	b2c9      	uxtb	r1, r1
 80014f6:	7019      	strb	r1, [r3, #0]
 80014f8:	3301      	adds	r3, #1
 80014fa:	42a3      	cmp	r3, r4
 80014fc:	d1fb      	bne.n	80014f6 <memset+0x8a>
 80014fe:	bdf0      	pop	{r4, r5, r6, r7, pc}
 8001500:	1c14      	adds	r4, r2, #0
 8001502:	1c03      	adds	r3, r0, #0
 8001504:	e7c5      	b.n	8001492 <memset+0x26>
 8001506:	46c0      	nop			; (mov r8, r8)

08001508 <_init>:
 8001508:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
 800150a:	46c0      	nop			; (mov r8, r8)
 800150c:	bcf8      	pop	{r3, r4, r5, r6, r7}
 800150e:	bc08      	pop	{r3}
 8001510:	469e      	mov	lr, r3
 8001512:	4770      	bx	lr

08001514 <_fini>:
 8001514:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
 8001516:	46c0      	nop			; (mov r8, r8)
 8001518:	bcf8      	pop	{r3, r4, r5, r6, r7}
 800151a:	bc08      	pop	{r3}
 800151c:	469e      	mov	lr, r3
 800151e:	4770      	bx	lr
 8001520:	69647473 	.word	0x69647473
 8001524:	6e69206f 	.word	0x6e69206f
 8001528:	64207469 	.word	0x64207469
 800152c:	0a656e6f 	.word	0x0a656e6f
 8001530:	00          	.byte	0x00
 8001531:	0a          	.byte	0x0a
 8001532:	6577      	.short	0x6577
 8001534:	6d6f636c 	.word	0x6d6f636c
 8001538:	6f742065 	.word	0x6f742065
 800153c:	7a755320 	.word	0x7a755320
 8001540:	4f616875 	.word	0x4f616875
 8001544:	5f5e2053 	.word	0x5f5e2053
 8001548:	2e32205e 	.word	0x2e32205e
 800154c:	0a302e32 	.word	0x0a302e32
 8001550:	4c495542 	.word	0x4c495542
 8001554:	614d2044 	.word	0x614d2044
 8001558:	34312072 	.word	0x34312072
 800155c:	31303220 	.word	0x31303220
 8001560:	37302036 	.word	0x37302036
 8001564:	3a30343a 	.word	0x3a30343a
 8001568:	000a3730 	.word	0x000a3730
 800156c:	3a207525 	.word	0x3a207525
 8001570:	20692520 	.word	0x20692520
 8001574:	000a      	.short	0x000a
 8001576:	6f62      	.short	0x6f62
 8001578:	6e69746f 	.word	0x6e69746f
 800157c:	72662067 	.word	0x72662067
 8001580:	25206d6f 	.word	0x25206d6f
 8001584:	72000a75 	.word	0x72000a75
 8001588:	73206d61 	.word	0x73206d61
 800158c:	74726174 	.word	0x74726174
 8001590:	20752520 	.word	0x20752520
 8001594:	6172000a 	.word	0x6172000a
 8001598:	6973206d 	.word	0x6973206d
 800159c:	2520657a 	.word	0x2520657a
 80015a0:	000a2075 	.word	0x000a2075
 80015a4:	206d6172 	.word	0x206d6172
 80015a8:	65657266 	.word	0x65657266
 80015ac:	20752520 	.word	0x20752520
 80015b0:	6568000a 	.word	0x6568000a
 80015b4:	73207061 	.word	0x73207061
 80015b8:	74726174 	.word	0x74726174
 80015bc:	20752520 	.word	0x20752520
 80015c0:	0a0a000a 	.word	0x0a0a000a
	...

080015c5 <PLLMulTable>:
 80015c5:	08060403 2018100c 00000030                       ....... 0

080015ce <APBAHBPrescTable>:
 80015ce:	00000000 04030201 04030201 09080706     ................
	...

080015e0 <__EH_FRAME_BEGIN__>:
 80015e0:	00000000                                ....
