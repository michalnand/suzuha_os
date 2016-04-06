
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
 80000dc:	20000130 	.word	0x20000130
 80000e0:	200000d0 	.word	0x200000d0

080000e4 <null_thread>:
 80000e4:	b508      	push	{r3, lr}
 80000e6:	f001 f9a9 	bl	800143c <sleep>
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
 800014c:	200000d0 	.word	0x200000d0
 8000150:	20000130 	.word	0x20000130

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
 80001a4:	20000130 	.word	0x20000130
 80001a8:	200000d0 	.word	0x200000d0

080001ac <sched_off>:
 80001ac:	b672      	cpsid	i
 80001ae:	4770      	bx	lr

080001b0 <sched_on>:
 80001b0:	b662      	cpsie	i
 80001b2:	4770      	bx	lr

080001b4 <yield>:
 80001b4:	4770      	bx	lr
	...

080001b8 <get_thread_id>:
 80001b8:	b082      	sub	sp, #8
 80001ba:	b672      	cpsid	i
 80001bc:	4b03      	ldr	r3, [pc, #12]	; (80001cc <get_thread_id+0x14>)
 80001be:	681b      	ldr	r3, [r3, #0]
 80001c0:	9301      	str	r3, [sp, #4]
 80001c2:	b662      	cpsie	i
 80001c4:	9801      	ldr	r0, [sp, #4]
 80001c6:	b002      	add	sp, #8
 80001c8:	4770      	bx	lr
 80001ca:	46c0      	nop			; (mov r8, r8)
 80001cc:	20000130 	.word	0x20000130

080001d0 <kernel_start>:
 80001d0:	b508      	push	{r3, lr}
 80001d2:	f001 f927 	bl	8001424 <sys_tick_init>
 80001d6:	46c0      	nop			; (mov r8, r8)
 80001d8:	e7fd      	b.n	80001d6 <kernel_start+0x6>
	...

080001dc <create_thread>:
 80001dc:	b5f0      	push	{r4, r5, r6, r7, lr}
 80001de:	b085      	sub	sp, #20
 80001e0:	9003      	str	r0, [sp, #12]
 80001e2:	481b      	ldr	r0, [pc, #108]	; (8000250 <create_thread+0x74>)
 80001e4:	0892      	lsrs	r2, r2, #2
 80001e6:	1812      	adds	r2, r2, r0
 80001e8:	0092      	lsls	r2, r2, #2
 80001ea:	1888      	adds	r0, r1, r2
 80001ec:	1c17      	adds	r7, r2, #0
 80001ee:	9002      	str	r0, [sp, #8]
 80001f0:	1c10      	adds	r0, r2, #0
 80001f2:	323c      	adds	r2, #60	; 0x3c
 80001f4:	188a      	adds	r2, r1, r2
 80001f6:	3034      	adds	r0, #52	; 0x34
 80001f8:	3738      	adds	r7, #56	; 0x38
 80001fa:	9201      	str	r2, [sp, #4]
 80001fc:	180e      	adds	r6, r1, r0
 80001fe:	19cf      	adds	r7, r1, r7
 8000200:	2200      	movs	r2, #0
 8000202:	b672      	cpsid	i
 8000204:	250c      	movs	r5, #12
 8000206:	4355      	muls	r5, r2
 8000208:	4c12      	ldr	r4, [pc, #72]	; (8000254 <create_thread+0x78>)
 800020a:	2008      	movs	r0, #8
 800020c:	1965      	adds	r5, r4, r5
 800020e:	6869      	ldr	r1, [r5, #4]
 8000210:	07c9      	lsls	r1, r1, #31
 8000212:	d415      	bmi.n	8000240 <create_thread+0x64>
 8000214:	9902      	ldr	r1, [sp, #8]
 8000216:	60a9      	str	r1, [r5, #8]
 8000218:	4d0f      	ldr	r5, [pc, #60]	; (8000258 <create_thread+0x7c>)
 800021a:	9903      	ldr	r1, [sp, #12]
 800021c:	6035      	str	r5, [r6, #0]
 800021e:	6039      	str	r1, [r7, #0]
 8000220:	2584      	movs	r5, #132	; 0x84
 8000222:	9901      	ldr	r1, [sp, #4]
 8000224:	05ad      	lsls	r5, r5, #22
 8000226:	600d      	str	r5, [r1, #0]
 8000228:	2b07      	cmp	r3, #7
 800022a:	d800      	bhi.n	800022e <create_thread+0x52>
 800022c:	1c03      	adds	r3, r0, #0
 800022e:	200c      	movs	r0, #12
 8000230:	4350      	muls	r0, r2
 8000232:	4908      	ldr	r1, [pc, #32]	; (8000254 <create_thread+0x78>)
 8000234:	180d      	adds	r5, r1, r0
 8000236:	806b      	strh	r3, [r5, #2]
 8000238:	5223      	strh	r3, [r4, r0]
 800023a:	2001      	movs	r0, #1
 800023c:	6068      	str	r0, [r5, #4]
 800023e:	1c10      	adds	r0, r2, #0
 8000240:	b662      	cpsie	i
 8000242:	3201      	adds	r2, #1
 8000244:	2a08      	cmp	r2, #8
 8000246:	d001      	beq.n	800024c <create_thread+0x70>
 8000248:	2808      	cmp	r0, #8
 800024a:	d0da      	beq.n	8000202 <create_thread+0x26>
 800024c:	b005      	add	sp, #20
 800024e:	bdf0      	pop	{r4, r5, r6, r7, pc}
 8000250:	3ffffff0 	.word	0x3ffffff0
 8000254:	200000d0 	.word	0x200000d0
 8000258:	080000c5 	.word	0x080000c5

0800025c <kernel_init>:
 800025c:	b510      	push	{r4, lr}
 800025e:	2300      	movs	r3, #0
 8000260:	210c      	movs	r1, #12
 8000262:	4359      	muls	r1, r3
 8000264:	4a0a      	ldr	r2, [pc, #40]	; (8000290 <kernel_init+0x34>)
 8000266:	2000      	movs	r0, #0
 8000268:	1854      	adds	r4, r2, r1
 800026a:	6060      	str	r0, [r4, #4]
 800026c:	3301      	adds	r3, #1
 800026e:	2008      	movs	r0, #8
 8000270:	8060      	strh	r0, [r4, #2]
 8000272:	5288      	strh	r0, [r1, r2]
 8000274:	4283      	cmp	r3, r0
 8000276:	d1f3      	bne.n	8000260 <kernel_init+0x4>
 8000278:	4b06      	ldr	r3, [pc, #24]	; (8000294 <kernel_init+0x38>)
 800027a:	2201      	movs	r2, #1
 800027c:	4252      	negs	r2, r2
 800027e:	601a      	str	r2, [r3, #0]
 8000280:	4905      	ldr	r1, [pc, #20]	; (8000298 <kernel_init+0x3c>)
 8000282:	2280      	movs	r2, #128	; 0x80
 8000284:	23ff      	movs	r3, #255	; 0xff
 8000286:	4805      	ldr	r0, [pc, #20]	; (800029c <kernel_init+0x40>)
 8000288:	f7ff ffa8 	bl	80001dc <create_thread>
 800028c:	bd10      	pop	{r4, pc}
 800028e:	46c0      	nop			; (mov r8, r8)
 8000290:	200000d0 	.word	0x200000d0
 8000294:	20000130 	.word	0x20000130
 8000298:	20000150 	.word	0x20000150
 800029c:	080000e5 	.word	0x080000e5

080002a0 <set_wait_state>:
 80002a0:	b507      	push	{r0, r1, r2, lr}
 80002a2:	f7ff ff89 	bl	80001b8 <get_thread_id>
 80002a6:	9000      	str	r0, [sp, #0]
 80002a8:	b672      	cpsid	i
 80002aa:	9a00      	ldr	r2, [sp, #0]
 80002ac:	210c      	movs	r1, #12
 80002ae:	434a      	muls	r2, r1
 80002b0:	4b09      	ldr	r3, [pc, #36]	; (80002d8 <set_wait_state+0x38>)
 80002b2:	2002      	movs	r0, #2
 80002b4:	189a      	adds	r2, r3, r2
 80002b6:	6851      	ldr	r1, [r2, #4]
 80002b8:	4301      	orrs	r1, r0
 80002ba:	6051      	str	r1, [r2, #4]
 80002bc:	b672      	cpsid	i
 80002be:	9a00      	ldr	r2, [sp, #0]
 80002c0:	210c      	movs	r1, #12
 80002c2:	434a      	muls	r2, r1
 80002c4:	189a      	adds	r2, r3, r2
 80002c6:	6852      	ldr	r2, [r2, #4]
 80002c8:	9201      	str	r2, [sp, #4]
 80002ca:	b662      	cpsie	i
 80002cc:	9a01      	ldr	r2, [sp, #4]
 80002ce:	9a01      	ldr	r2, [sp, #4]
 80002d0:	0791      	lsls	r1, r2, #30
 80002d2:	d4f3      	bmi.n	80002bc <set_wait_state+0x1c>
 80002d4:	bd07      	pop	{r0, r1, r2, pc}
 80002d6:	46c0      	nop			; (mov r8, r8)
 80002d8:	200000d0 	.word	0x200000d0

080002dc <wake_up_threads>:
 80002dc:	2300      	movs	r3, #0
 80002de:	b672      	cpsid	i
 80002e0:	220c      	movs	r2, #12
 80002e2:	435a      	muls	r2, r3
 80002e4:	4905      	ldr	r1, [pc, #20]	; (80002fc <wake_up_threads+0x20>)
 80002e6:	2002      	movs	r0, #2
 80002e8:	188a      	adds	r2, r1, r2
 80002ea:	6851      	ldr	r1, [r2, #4]
 80002ec:	4381      	bics	r1, r0
 80002ee:	6051      	str	r1, [r2, #4]
 80002f0:	b662      	cpsie	i
 80002f2:	3301      	adds	r3, #1
 80002f4:	2b08      	cmp	r3, #8
 80002f6:	d1f2      	bne.n	80002de <wake_up_threads+0x2>
 80002f8:	4770      	bx	lr
 80002fa:	46c0      	nop			; (mov r8, r8)
 80002fc:	200000d0 	.word	0x200000d0

08000300 <messages_init>:
 8000300:	b510      	push	{r4, lr}
 8000302:	2200      	movs	r2, #0
 8000304:	4909      	ldr	r1, [pc, #36]	; (800032c <messages_init+0x2c>)
 8000306:	0090      	lsls	r0, r2, #2
 8000308:	2300      	movs	r3, #0
 800030a:	3201      	adds	r2, #1
 800030c:	5043      	str	r3, [r0, r1]
 800030e:	2a08      	cmp	r2, #8
 8000310:	d1f8      	bne.n	8000304 <messages_init+0x4>
 8000312:	4807      	ldr	r0, [pc, #28]	; (8000330 <messages_init+0x30>)
 8000314:	011c      	lsls	r4, r3, #4
 8000316:	2200      	movs	r2, #0
 8000318:	1901      	adds	r1, r0, r4
 800031a:	3301      	adds	r3, #1
 800031c:	604a      	str	r2, [r1, #4]
 800031e:	5022      	str	r2, [r4, r0]
 8000320:	60ca      	str	r2, [r1, #12]
 8000322:	608a      	str	r2, [r1, #8]
 8000324:	2b04      	cmp	r3, #4
 8000326:	d1f4      	bne.n	8000312 <messages_init+0x12>
 8000328:	bd10      	pop	{r4, pc}
 800032a:	46c0      	nop			; (mov r8, r8)
 800032c:	200001d0 	.word	0x200001d0
 8000330:	200001f0 	.word	0x200001f0

08000334 <putc_>:
 8000334:	b538      	push	{r3, r4, r5, lr}
 8000336:	4c06      	ldr	r4, [pc, #24]	; (8000350 <putc_+0x1c>)
 8000338:	1c05      	adds	r5, r0, #0
 800033a:	1c20      	adds	r0, r4, #0
 800033c:	f000 f8ff 	bl	800053e <mutex_lock>
 8000340:	1c28      	adds	r0, r5, #0
 8000342:	f000 fe29 	bl	8000f98 <uart_write>
 8000346:	1c20      	adds	r0, r4, #0
 8000348:	f000 f915 	bl	8000576 <mutex_unlock>
 800034c:	bd38      	pop	{r3, r4, r5, pc}
 800034e:	46c0      	nop			; (mov r8, r8)
 8000350:	20000230 	.word	0x20000230

08000354 <puts_>:
 8000354:	b538      	push	{r3, r4, r5, lr}
 8000356:	4d08      	ldr	r5, [pc, #32]	; (8000378 <puts_+0x24>)
 8000358:	1c04      	adds	r4, r0, #0
 800035a:	1c28      	adds	r0, r5, #0
 800035c:	f000 f8ef 	bl	800053e <mutex_lock>
 8000360:	3401      	adds	r4, #1
 8000362:	1e63      	subs	r3, r4, #1
 8000364:	7818      	ldrb	r0, [r3, #0]
 8000366:	2800      	cmp	r0, #0
 8000368:	d002      	beq.n	8000370 <puts_+0x1c>
 800036a:	f7ff ffe3 	bl	8000334 <putc_>
 800036e:	e7f7      	b.n	8000360 <puts_+0xc>
 8000370:	1c28      	adds	r0, r5, #0
 8000372:	f000 f900 	bl	8000576 <mutex_unlock>
 8000376:	bd38      	pop	{r3, r4, r5, pc}
 8000378:	2000023c 	.word	0x2000023c

0800037c <puti_>:
 800037c:	b5f0      	push	{r4, r5, r6, r7, lr}
 800037e:	2300      	movs	r3, #0
 8000380:	b085      	sub	sp, #20
 8000382:	1c04      	adds	r4, r0, #0
 8000384:	1c1f      	adds	r7, r3, #0
 8000386:	4298      	cmp	r0, r3
 8000388:	da01      	bge.n	800038e <puti_+0x12>
 800038a:	4244      	negs	r4, r0
 800038c:	2701      	movs	r7, #1
 800038e:	ae01      	add	r6, sp, #4
 8000390:	72f3      	strb	r3, [r6, #11]
 8000392:	250a      	movs	r5, #10
 8000394:	1c20      	adds	r0, r4, #0
 8000396:	210a      	movs	r1, #10
 8000398:	f002 f984 	bl	80026a4 <__aeabi_idivmod>
 800039c:	3130      	adds	r1, #48	; 0x30
 800039e:	5571      	strb	r1, [r6, r5]
 80003a0:	1c20      	adds	r0, r4, #0
 80003a2:	210a      	movs	r1, #10
 80003a4:	f002 f928 	bl	80025f8 <__aeabi_idiv>
 80003a8:	1e6b      	subs	r3, r5, #1
 80003aa:	1e04      	subs	r4, r0, #0
 80003ac:	d001      	beq.n	80003b2 <puti_+0x36>
 80003ae:	1c1d      	adds	r5, r3, #0
 80003b0:	e7f0      	b.n	8000394 <puti_+0x18>
 80003b2:	2f00      	cmp	r7, #0
 80003b4:	d002      	beq.n	80003bc <puti_+0x40>
 80003b6:	222d      	movs	r2, #45	; 0x2d
 80003b8:	54f2      	strb	r2, [r6, r3]
 80003ba:	1c1d      	adds	r5, r3, #0
 80003bc:	1970      	adds	r0, r6, r5
 80003be:	f7ff ffc9 	bl	8000354 <puts_>
 80003c2:	b005      	add	sp, #20
 80003c4:	bdf0      	pop	{r4, r5, r6, r7, pc}

080003c6 <putui_>:
 80003c6:	b57f      	push	{r0, r1, r2, r3, r4, r5, r6, lr}
 80003c8:	2300      	movs	r3, #0
 80003ca:	ae01      	add	r6, sp, #4
 80003cc:	1c05      	adds	r5, r0, #0
 80003ce:	72f3      	strb	r3, [r6, #11]
 80003d0:	240a      	movs	r4, #10
 80003d2:	1c28      	adds	r0, r5, #0
 80003d4:	210a      	movs	r1, #10
 80003d6:	f002 f905 	bl	80025e4 <__aeabi_uidivmod>
 80003da:	3130      	adds	r1, #48	; 0x30
 80003dc:	5531      	strb	r1, [r6, r4]
 80003de:	1c28      	adds	r0, r5, #0
 80003e0:	210a      	movs	r1, #10
 80003e2:	f002 f8bb 	bl	800255c <__aeabi_uidiv>
 80003e6:	1e63      	subs	r3, r4, #1
 80003e8:	1e05      	subs	r5, r0, #0
 80003ea:	d001      	beq.n	80003f0 <putui_+0x2a>
 80003ec:	1c1c      	adds	r4, r3, #0
 80003ee:	e7f0      	b.n	80003d2 <putui_+0xc>
 80003f0:	1930      	adds	r0, r6, r4
 80003f2:	f7ff ffaf 	bl	8000354 <puts_>
 80003f6:	bd7f      	pop	{r0, r1, r2, r3, r4, r5, r6, pc}

080003f8 <putx_>:
 80003f8:	b51f      	push	{r0, r1, r2, r3, r4, lr}
 80003fa:	2300      	movs	r3, #0
 80003fc:	aa01      	add	r2, sp, #4
 80003fe:	72d3      	strb	r3, [r2, #11]
 8000400:	230a      	movs	r3, #10
 8000402:	210f      	movs	r1, #15
 8000404:	4001      	ands	r1, r0
 8000406:	2909      	cmp	r1, #9
 8000408:	d801      	bhi.n	800040e <putx_+0x16>
 800040a:	3130      	adds	r1, #48	; 0x30
 800040c:	e000      	b.n	8000410 <putx_+0x18>
 800040e:	3157      	adds	r1, #87	; 0x57
 8000410:	54d1      	strb	r1, [r2, r3]
 8000412:	0900      	lsrs	r0, r0, #4
 8000414:	1e59      	subs	r1, r3, #1
 8000416:	2800      	cmp	r0, #0
 8000418:	d001      	beq.n	800041e <putx_+0x26>
 800041a:	1c0b      	adds	r3, r1, #0
 800041c:	e7f1      	b.n	8000402 <putx_+0xa>
 800041e:	18d0      	adds	r0, r2, r3
 8000420:	f7ff ff98 	bl	8000354 <puts_>
 8000424:	b005      	add	sp, #20
 8000426:	bd00      	pop	{pc}

08000428 <printf_>:
 8000428:	b40f      	push	{r0, r1, r2, r3}
 800042a:	b573      	push	{r0, r1, r4, r5, r6, lr}
 800042c:	4e25      	ldr	r6, [pc, #148]	; (80004c4 <printf_+0x9c>)
 800042e:	ac06      	add	r4, sp, #24
 8000430:	cc20      	ldmia	r4!, {r5}
 8000432:	1c30      	adds	r0, r6, #0
 8000434:	f000 f883 	bl	800053e <mutex_lock>
 8000438:	9401      	str	r4, [sp, #4]
 800043a:	2400      	movs	r4, #0
 800043c:	5d28      	ldrb	r0, [r5, r4]
 800043e:	2800      	cmp	r0, #0
 8000440:	d039      	beq.n	80004b6 <printf_+0x8e>
 8000442:	2825      	cmp	r0, #37	; 0x25
 8000444:	d003      	beq.n	800044e <printf_+0x26>
 8000446:	f7ff ff75 	bl	8000334 <putc_>
 800044a:	3401      	adds	r4, #1
 800044c:	e7f6      	b.n	800043c <printf_+0x14>
 800044e:	192b      	adds	r3, r5, r4
 8000450:	7858      	ldrb	r0, [r3, #1]
 8000452:	2869      	cmp	r0, #105	; 0x69
 8000454:	d016      	beq.n	8000484 <printf_+0x5c>
 8000456:	d808      	bhi.n	800046a <printf_+0x42>
 8000458:	2825      	cmp	r0, #37	; 0x25
 800045a:	d028      	beq.n	80004ae <printf_+0x86>
 800045c:	2863      	cmp	r0, #99	; 0x63
 800045e:	d128      	bne.n	80004b2 <printf_+0x8a>
 8000460:	9b01      	ldr	r3, [sp, #4]
 8000462:	1d1a      	adds	r2, r3, #4
 8000464:	9201      	str	r2, [sp, #4]
 8000466:	7818      	ldrb	r0, [r3, #0]
 8000468:	e021      	b.n	80004ae <printf_+0x86>
 800046a:	2875      	cmp	r0, #117	; 0x75
 800046c:	d011      	beq.n	8000492 <printf_+0x6a>
 800046e:	2878      	cmp	r0, #120	; 0x78
 8000470:	d016      	beq.n	80004a0 <printf_+0x78>
 8000472:	2873      	cmp	r0, #115	; 0x73
 8000474:	d11d      	bne.n	80004b2 <printf_+0x8a>
 8000476:	9b01      	ldr	r3, [sp, #4]
 8000478:	1d1a      	adds	r2, r3, #4
 800047a:	6818      	ldr	r0, [r3, #0]
 800047c:	9201      	str	r2, [sp, #4]
 800047e:	f7ff ff69 	bl	8000354 <puts_>
 8000482:	e016      	b.n	80004b2 <printf_+0x8a>
 8000484:	9b01      	ldr	r3, [sp, #4]
 8000486:	1d1a      	adds	r2, r3, #4
 8000488:	6818      	ldr	r0, [r3, #0]
 800048a:	9201      	str	r2, [sp, #4]
 800048c:	f7ff ff76 	bl	800037c <puti_>
 8000490:	e00f      	b.n	80004b2 <printf_+0x8a>
 8000492:	9b01      	ldr	r3, [sp, #4]
 8000494:	1d1a      	adds	r2, r3, #4
 8000496:	6818      	ldr	r0, [r3, #0]
 8000498:	9201      	str	r2, [sp, #4]
 800049a:	f7ff ff94 	bl	80003c6 <putui_>
 800049e:	e008      	b.n	80004b2 <printf_+0x8a>
 80004a0:	9b01      	ldr	r3, [sp, #4]
 80004a2:	1d1a      	adds	r2, r3, #4
 80004a4:	6818      	ldr	r0, [r3, #0]
 80004a6:	9201      	str	r2, [sp, #4]
 80004a8:	f7ff ffa6 	bl	80003f8 <putx_>
 80004ac:	e001      	b.n	80004b2 <printf_+0x8a>
 80004ae:	f7ff ff41 	bl	8000334 <putc_>
 80004b2:	3402      	adds	r4, #2
 80004b4:	e7c2      	b.n	800043c <printf_+0x14>
 80004b6:	1c30      	adds	r0, r6, #0
 80004b8:	f000 f85d 	bl	8000576 <mutex_unlock>
 80004bc:	bc73      	pop	{r0, r1, r4, r5, r6}
 80004be:	bc08      	pop	{r3}
 80004c0:	b004      	add	sp, #16
 80004c2:	4718      	bx	r3
 80004c4:	20000238 	.word	0x20000238

080004c8 <stdio_init>:
 80004c8:	b510      	push	{r4, lr}
 80004ca:	480f      	ldr	r0, [pc, #60]	; (8000508 <stdio_init+0x40>)
 80004cc:	f000 f82e 	bl	800052c <mutex_init>
 80004d0:	480e      	ldr	r0, [pc, #56]	; (800050c <stdio_init+0x44>)
 80004d2:	f000 f82b 	bl	800052c <mutex_init>
 80004d6:	480e      	ldr	r0, [pc, #56]	; (8000510 <stdio_init+0x48>)
 80004d8:	f000 f828 	bl	800052c <mutex_init>
 80004dc:	480d      	ldr	r0, [pc, #52]	; (8000514 <stdio_init+0x4c>)
 80004de:	f000 f825 	bl	800052c <mutex_init>
 80004e2:	2408      	movs	r4, #8
 80004e4:	2020      	movs	r0, #32
 80004e6:	3c01      	subs	r4, #1
 80004e8:	f7ff ff24 	bl	8000334 <putc_>
 80004ec:	2c00      	cmp	r4, #0
 80004ee:	d1f9      	bne.n	80004e4 <stdio_init+0x1c>
 80004f0:	2420      	movs	r4, #32
 80004f2:	200a      	movs	r0, #10
 80004f4:	3c01      	subs	r4, #1
 80004f6:	f7ff ff1d 	bl	8000334 <putc_>
 80004fa:	2c00      	cmp	r4, #0
 80004fc:	d1f9      	bne.n	80004f2 <stdio_init+0x2a>
 80004fe:	4806      	ldr	r0, [pc, #24]	; (8000518 <stdio_init+0x50>)
 8000500:	f7ff ff92 	bl	8000428 <printf_>
 8000504:	bd10      	pop	{r4, pc}
 8000506:	46c0      	nop			; (mov r8, r8)
 8000508:	20000230 	.word	0x20000230
 800050c:	20000234 	.word	0x20000234
 8000510:	2000023c 	.word	0x2000023c
 8000514:	20000238 	.word	0x20000238
 8000518:	080026d4 	.word	0x080026d4

0800051c <lib_os_init>:
 800051c:	b508      	push	{r3, lr}
 800051e:	f7ff fe9d 	bl	800025c <kernel_init>
 8000522:	f7ff feed 	bl	8000300 <messages_init>
 8000526:	f7ff ffcf 	bl	80004c8 <stdio_init>
 800052a:	bd08      	pop	{r3, pc}

0800052c <mutex_init>:
 800052c:	b510      	push	{r4, lr}
 800052e:	1c04      	adds	r4, r0, #0
 8000530:	f7ff fe3c 	bl	80001ac <sched_off>
 8000534:	2300      	movs	r3, #0
 8000536:	6023      	str	r3, [r4, #0]
 8000538:	f7ff fe3a 	bl	80001b0 <sched_on>
 800053c:	bd10      	pop	{r4, pc}

0800053e <mutex_lock>:
 800053e:	b513      	push	{r0, r1, r4, lr}
 8000540:	1c04      	adds	r4, r0, #0
 8000542:	f7ff fe33 	bl	80001ac <sched_off>
 8000546:	6823      	ldr	r3, [r4, #0]
 8000548:	9301      	str	r3, [sp, #4]
 800054a:	f7ff fe31 	bl	80001b0 <sched_on>
 800054e:	9b01      	ldr	r3, [sp, #4]
 8000550:	2b00      	cmp	r3, #0
 8000552:	d001      	beq.n	8000558 <mutex_lock+0x1a>
 8000554:	f7ff fea4 	bl	80002a0 <set_wait_state>
 8000558:	9b01      	ldr	r3, [sp, #4]
 800055a:	2b00      	cmp	r3, #0
 800055c:	d1f1      	bne.n	8000542 <mutex_lock+0x4>
 800055e:	f7ff fe25 	bl	80001ac <sched_off>
 8000562:	6823      	ldr	r3, [r4, #0]
 8000564:	9301      	str	r3, [sp, #4]
 8000566:	9b01      	ldr	r3, [sp, #4]
 8000568:	2b00      	cmp	r3, #0
 800056a:	d1ea      	bne.n	8000542 <mutex_lock+0x4>
 800056c:	2301      	movs	r3, #1
 800056e:	6023      	str	r3, [r4, #0]
 8000570:	f7ff fe1e 	bl	80001b0 <sched_on>
 8000574:	bd13      	pop	{r0, r1, r4, pc}

08000576 <mutex_unlock>:
 8000576:	b508      	push	{r3, lr}
 8000578:	f7ff ffd8 	bl	800052c <mutex_init>
 800057c:	f7ff feae 	bl	80002dc <wake_up_threads>
 8000580:	f7ff fe18 	bl	80001b4 <yield>
 8000584:	bd08      	pop	{r3, pc}
	...

08000588 <hmc5883_init>:
 8000588:	b510      	push	{r4, lr}
 800058a:	4b16      	ldr	r3, [pc, #88]	; (80005e4 <hmc5883_init+0x5c>)
 800058c:	2400      	movs	r4, #0
 800058e:	203c      	movs	r0, #60	; 0x3c
 8000590:	1c21      	adds	r1, r4, #0
 8000592:	2218      	movs	r2, #24
 8000594:	801c      	strh	r4, [r3, #0]
 8000596:	805c      	strh	r4, [r3, #2]
 8000598:	809c      	strh	r4, [r3, #4]
 800059a:	f000 fe3a 	bl	8001212 <i2c_write_reg>
 800059e:	203c      	movs	r0, #60	; 0x3c
 80005a0:	2101      	movs	r1, #1
 80005a2:	1c22      	adds	r2, r4, #0
 80005a4:	f000 fe35 	bl	8001212 <i2c_write_reg>
 80005a8:	203c      	movs	r0, #60	; 0x3c
 80005aa:	2102      	movs	r1, #2
 80005ac:	1c22      	adds	r2, r4, #0
 80005ae:	f000 fe30 	bl	8001212 <i2c_write_reg>
 80005b2:	203c      	movs	r0, #60	; 0x3c
 80005b4:	210a      	movs	r1, #10
 80005b6:	f000 fe3e 	bl	8001236 <i2c_read_reg>
 80005ba:	2301      	movs	r3, #1
 80005bc:	2848      	cmp	r0, #72	; 0x48
 80005be:	d10f      	bne.n	80005e0 <hmc5883_init+0x58>
 80005c0:	203c      	movs	r0, #60	; 0x3c
 80005c2:	210b      	movs	r1, #11
 80005c4:	f000 fe37 	bl	8001236 <i2c_read_reg>
 80005c8:	2302      	movs	r3, #2
 80005ca:	2834      	cmp	r0, #52	; 0x34
 80005cc:	d108      	bne.n	80005e0 <hmc5883_init+0x58>
 80005ce:	203c      	movs	r0, #60	; 0x3c
 80005d0:	210c      	movs	r1, #12
 80005d2:	f000 fe30 	bl	8001236 <i2c_read_reg>
 80005d6:	2833      	cmp	r0, #51	; 0x33
 80005d8:	d001      	beq.n	80005de <hmc5883_init+0x56>
 80005da:	2303      	movs	r3, #3
 80005dc:	e000      	b.n	80005e0 <hmc5883_init+0x58>
 80005de:	1c23      	adds	r3, r4, #0
 80005e0:	1c18      	adds	r0, r3, #0
 80005e2:	bd10      	pop	{r4, pc}
 80005e4:	20000240 	.word	0x20000240

080005e8 <hmc5883_read>:
 80005e8:	b538      	push	{r3, r4, r5, lr}
 80005ea:	2103      	movs	r1, #3
 80005ec:	203c      	movs	r0, #60	; 0x3c
 80005ee:	f000 fe22 	bl	8001236 <i2c_read_reg>
 80005f2:	4c12      	ldr	r4, [pc, #72]	; (800063c <hmc5883_read+0x54>)
 80005f4:	0205      	lsls	r5, r0, #8
 80005f6:	b2ad      	uxth	r5, r5
 80005f8:	2104      	movs	r1, #4
 80005fa:	203c      	movs	r0, #60	; 0x3c
 80005fc:	8025      	strh	r5, [r4, #0]
 80005fe:	f000 fe1a 	bl	8001236 <i2c_read_reg>
 8000602:	2107      	movs	r1, #7
 8000604:	4305      	orrs	r5, r0
 8000606:	203c      	movs	r0, #60	; 0x3c
 8000608:	8025      	strh	r5, [r4, #0]
 800060a:	f000 fe14 	bl	8001236 <i2c_read_reg>
 800060e:	0205      	lsls	r5, r0, #8
 8000610:	b2ad      	uxth	r5, r5
 8000612:	2108      	movs	r1, #8
 8000614:	203c      	movs	r0, #60	; 0x3c
 8000616:	8065      	strh	r5, [r4, #2]
 8000618:	f000 fe0d 	bl	8001236 <i2c_read_reg>
 800061c:	2105      	movs	r1, #5
 800061e:	4305      	orrs	r5, r0
 8000620:	203c      	movs	r0, #60	; 0x3c
 8000622:	8065      	strh	r5, [r4, #2]
 8000624:	f000 fe07 	bl	8001236 <i2c_read_reg>
 8000628:	0205      	lsls	r5, r0, #8
 800062a:	b2ad      	uxth	r5, r5
 800062c:	2106      	movs	r1, #6
 800062e:	203c      	movs	r0, #60	; 0x3c
 8000630:	80a5      	strh	r5, [r4, #4]
 8000632:	f000 fe00 	bl	8001236 <i2c_read_reg>
 8000636:	4305      	orrs	r5, r0
 8000638:	80a5      	strh	r5, [r4, #4]
 800063a:	bd38      	pop	{r3, r4, r5, pc}
 800063c:	20000240 	.word	0x20000240

08000640 <apds9950_read>:
 8000640:	b538      	push	{r3, r4, r5, lr}
 8000642:	f000 fd7e 	bl	8001142 <i2cStart>
 8000646:	2072      	movs	r0, #114	; 0x72
 8000648:	f000 fd97 	bl	800117a <i2cWrite>
 800064c:	20b4      	movs	r0, #180	; 0xb4
 800064e:	f000 fd94 	bl	800117a <i2cWrite>
 8000652:	f000 fd76 	bl	8001142 <i2cStart>
 8000656:	2073      	movs	r0, #115	; 0x73
 8000658:	f000 fd8f 	bl	800117a <i2cWrite>
 800065c:	2001      	movs	r0, #1
 800065e:	f000 fdb3 	bl	80011c8 <i2cRead>
 8000662:	4c1c      	ldr	r4, [pc, #112]	; (80006d4 <apds9950_read+0x94>)
 8000664:	1c05      	adds	r5, r0, #0
 8000666:	80e0      	strh	r0, [r4, #6]
 8000668:	2001      	movs	r0, #1
 800066a:	f000 fdad 	bl	80011c8 <i2cRead>
 800066e:	0200      	lsls	r0, r0, #8
 8000670:	4305      	orrs	r5, r0
 8000672:	2001      	movs	r0, #1
 8000674:	80e5      	strh	r5, [r4, #6]
 8000676:	f000 fda7 	bl	80011c8 <i2cRead>
 800067a:	8020      	strh	r0, [r4, #0]
 800067c:	1c05      	adds	r5, r0, #0
 800067e:	2001      	movs	r0, #1
 8000680:	f000 fda2 	bl	80011c8 <i2cRead>
 8000684:	0200      	lsls	r0, r0, #8
 8000686:	4305      	orrs	r5, r0
 8000688:	2001      	movs	r0, #1
 800068a:	8025      	strh	r5, [r4, #0]
 800068c:	f000 fd9c 	bl	80011c8 <i2cRead>
 8000690:	8060      	strh	r0, [r4, #2]
 8000692:	1c05      	adds	r5, r0, #0
 8000694:	2001      	movs	r0, #1
 8000696:	f000 fd97 	bl	80011c8 <i2cRead>
 800069a:	0200      	lsls	r0, r0, #8
 800069c:	4305      	orrs	r5, r0
 800069e:	2001      	movs	r0, #1
 80006a0:	8065      	strh	r5, [r4, #2]
 80006a2:	f000 fd91 	bl	80011c8 <i2cRead>
 80006a6:	80a0      	strh	r0, [r4, #4]
 80006a8:	1c05      	adds	r5, r0, #0
 80006aa:	2001      	movs	r0, #1
 80006ac:	f000 fd8c 	bl	80011c8 <i2cRead>
 80006b0:	0200      	lsls	r0, r0, #8
 80006b2:	4305      	orrs	r5, r0
 80006b4:	2001      	movs	r0, #1
 80006b6:	80a5      	strh	r5, [r4, #4]
 80006b8:	f000 fd86 	bl	80011c8 <i2cRead>
 80006bc:	8120      	strh	r0, [r4, #8]
 80006be:	1c05      	adds	r5, r0, #0
 80006c0:	2000      	movs	r0, #0
 80006c2:	f000 fd81 	bl	80011c8 <i2cRead>
 80006c6:	0200      	lsls	r0, r0, #8
 80006c8:	4305      	orrs	r5, r0
 80006ca:	8125      	strh	r5, [r4, #8]
 80006cc:	f000 fd47 	bl	800115e <i2cStop>
 80006d0:	bd38      	pop	{r3, r4, r5, pc}
 80006d2:	46c0      	nop			; (mov r8, r8)
 80006d4:	20000246 	.word	0x20000246

080006d8 <apds950_init>:
 80006d8:	b508      	push	{r3, lr}
 80006da:	2072      	movs	r0, #114	; 0x72
 80006dc:	2181      	movs	r1, #129	; 0x81
 80006de:	22ff      	movs	r2, #255	; 0xff
 80006e0:	f000 fd97 	bl	8001212 <i2c_write_reg>
 80006e4:	2072      	movs	r0, #114	; 0x72
 80006e6:	2183      	movs	r1, #131	; 0x83
 80006e8:	22ff      	movs	r2, #255	; 0xff
 80006ea:	f000 fd92 	bl	8001212 <i2c_write_reg>
 80006ee:	2072      	movs	r0, #114	; 0x72
 80006f0:	218d      	movs	r1, #141	; 0x8d
 80006f2:	2200      	movs	r2, #0
 80006f4:	f000 fd8d 	bl	8001212 <i2c_write_reg>
 80006f8:	2072      	movs	r0, #114	; 0x72
 80006fa:	2180      	movs	r1, #128	; 0x80
 80006fc:	2203      	movs	r2, #3
 80006fe:	f000 fd88 	bl	8001212 <i2c_write_reg>
 8000702:	2072      	movs	r0, #114	; 0x72
 8000704:	218f      	movs	r1, #143	; 0x8f
 8000706:	2223      	movs	r2, #35	; 0x23
 8000708:	f000 fd83 	bl	8001212 <i2c_write_reg>
 800070c:	2072      	movs	r0, #114	; 0x72
 800070e:	2180      	movs	r1, #128	; 0x80
 8000710:	2207      	movs	r2, #7
 8000712:	f000 fd7e 	bl	8001212 <i2c_write_reg>
 8000716:	2072      	movs	r0, #114	; 0x72
 8000718:	218e      	movs	r1, #142	; 0x8e
 800071a:	2208      	movs	r2, #8
 800071c:	f000 fd79 	bl	8001212 <i2c_write_reg>
 8000720:	f7ff ff8e 	bl	8000640 <apds9950_read>
 8000724:	2000      	movs	r0, #0
 8000726:	bd08      	pop	{r3, pc}

08000728 <LCD_SH1106_write_command>:
 8000728:	b508      	push	{r3, lr}
 800072a:	1c02      	adds	r2, r0, #0
 800072c:	2100      	movs	r1, #0
 800072e:	2078      	movs	r0, #120	; 0x78
 8000730:	f000 fd6f 	bl	8001212 <i2c_write_reg>
 8000734:	bd08      	pop	{r3, pc}

08000736 <LCD_SH1106_set_cursor>:
 8000736:	b510      	push	{r4, lr}
 8000738:	1c84      	adds	r4, r0, #2
 800073a:	1c08      	adds	r0, r1, #0
 800073c:	3850      	subs	r0, #80	; 0x50
 800073e:	b2c0      	uxtb	r0, r0
 8000740:	f7ff fff2 	bl	8000728 <LCD_SH1106_write_command>
 8000744:	b2e4      	uxtb	r4, r4
 8000746:	200f      	movs	r0, #15
 8000748:	4020      	ands	r0, r4
 800074a:	f7ff ffed 	bl	8000728 <LCD_SH1106_write_command>
 800074e:	0924      	lsrs	r4, r4, #4
 8000750:	2010      	movs	r0, #16
 8000752:	4320      	orrs	r0, r4
 8000754:	f7ff ffe8 	bl	8000728 <LCD_SH1106_write_command>
 8000758:	bd10      	pop	{r4, pc}
	...

0800075c <LCD_SH1106_set_pixel>:
 800075c:	b570      	push	{r4, r5, r6, lr}
 800075e:	1c0c      	adds	r4, r1, #0
 8000760:	1c05      	adds	r5, r0, #0
 8000762:	1c16      	adds	r6, r2, #0
 8000764:	f7ff fd22 	bl	80001ac <sched_off>
 8000768:	08e2      	lsrs	r2, r4, #3
 800076a:	2107      	movs	r1, #7
 800076c:	400c      	ands	r4, r1
 800076e:	01d2      	lsls	r2, r2, #7
 8000770:	4b08      	ldr	r3, [pc, #32]	; (8000794 <LCD_SH1106_set_pixel+0x38>)
 8000772:	2101      	movs	r1, #1
 8000774:	1955      	adds	r5, r2, r5
 8000776:	40a1      	lsls	r1, r4
 8000778:	5d5a      	ldrb	r2, [r3, r5]
 800077a:	1c0c      	adds	r4, r1, #0
 800077c:	2e00      	cmp	r6, #0
 800077e:	d003      	beq.n	8000788 <LCD_SH1106_set_pixel+0x2c>
 8000780:	4314      	orrs	r4, r2
 8000782:	b2e4      	uxtb	r4, r4
 8000784:	555c      	strb	r4, [r3, r5]
 8000786:	e001      	b.n	800078c <LCD_SH1106_set_pixel+0x30>
 8000788:	438a      	bics	r2, r1
 800078a:	555a      	strb	r2, [r3, r5]
 800078c:	f7ff fd10 	bl	80001b0 <sched_on>
 8000790:	bd70      	pop	{r4, r5, r6, pc}
 8000792:	46c0      	nop			; (mov r8, r8)
 8000794:	20000252 	.word	0x20000252

08000798 <LCD_SH1106_clear_buffer>:
 8000798:	b082      	sub	sp, #8
 800079a:	2300      	movs	r3, #0
 800079c:	9300      	str	r3, [sp, #0]
 800079e:	9b00      	ldr	r3, [sp, #0]
 80007a0:	2b07      	cmp	r3, #7
 80007a2:	d810      	bhi.n	80007c6 <LCD_SH1106_clear_buffer+0x2e>
 80007a4:	2300      	movs	r3, #0
 80007a6:	9301      	str	r3, [sp, #4]
 80007a8:	9b01      	ldr	r3, [sp, #4]
 80007aa:	2b7f      	cmp	r3, #127	; 0x7f
 80007ac:	d808      	bhi.n	80007c0 <LCD_SH1106_clear_buffer+0x28>
 80007ae:	9a00      	ldr	r2, [sp, #0]
 80007b0:	9b01      	ldr	r3, [sp, #4]
 80007b2:	01d2      	lsls	r2, r2, #7
 80007b4:	18d2      	adds	r2, r2, r3
 80007b6:	4b05      	ldr	r3, [pc, #20]	; (80007cc <LCD_SH1106_clear_buffer+0x34>)
 80007b8:	54d0      	strb	r0, [r2, r3]
 80007ba:	9b01      	ldr	r3, [sp, #4]
 80007bc:	3301      	adds	r3, #1
 80007be:	e7f2      	b.n	80007a6 <LCD_SH1106_clear_buffer+0xe>
 80007c0:	9b00      	ldr	r3, [sp, #0]
 80007c2:	3301      	adds	r3, #1
 80007c4:	e7ea      	b.n	800079c <LCD_SH1106_clear_buffer+0x4>
 80007c6:	b002      	add	sp, #8
 80007c8:	4770      	bx	lr
 80007ca:	46c0      	nop			; (mov r8, r8)
 80007cc:	20000252 	.word	0x20000252

080007d0 <LCD_SH1106_flush_buffer>:
 80007d0:	b530      	push	{r4, r5, lr}
 80007d2:	2000      	movs	r0, #0
 80007d4:	b085      	sub	sp, #20
 80007d6:	f7ff ffa7 	bl	8000728 <LCD_SH1106_write_command>
 80007da:	2010      	movs	r0, #16
 80007dc:	f7ff ffa4 	bl	8000728 <LCD_SH1106_write_command>
 80007e0:	2040      	movs	r0, #64	; 0x40
 80007e2:	f7ff ffa1 	bl	8000728 <LCD_SH1106_write_command>
 80007e6:	2300      	movs	r3, #0
 80007e8:	9301      	str	r3, [sp, #4]
 80007ea:	9b01      	ldr	r3, [sp, #4]
 80007ec:	2b07      	cmp	r3, #7
 80007ee:	d833      	bhi.n	8000858 <LCD_SH1106_flush_buffer+0x88>
 80007f0:	9801      	ldr	r0, [sp, #4]
 80007f2:	2400      	movs	r4, #0
 80007f4:	3850      	subs	r0, #80	; 0x50
 80007f6:	b2c0      	uxtb	r0, r0
 80007f8:	f7ff ff96 	bl	8000728 <LCD_SH1106_write_command>
 80007fc:	2002      	movs	r0, #2
 80007fe:	f7ff ff93 	bl	8000728 <LCD_SH1106_write_command>
 8000802:	2010      	movs	r0, #16
 8000804:	f7ff ff90 	bl	8000728 <LCD_SH1106_write_command>
 8000808:	9402      	str	r4, [sp, #8]
 800080a:	9b02      	ldr	r3, [sp, #8]
 800080c:	2b07      	cmp	r3, #7
 800080e:	d820      	bhi.n	8000852 <LCD_SH1106_flush_buffer+0x82>
 8000810:	f000 fc97 	bl	8001142 <i2cStart>
 8000814:	2078      	movs	r0, #120	; 0x78
 8000816:	f000 fcb0 	bl	800117a <i2cWrite>
 800081a:	2040      	movs	r0, #64	; 0x40
 800081c:	f000 fcad 	bl	800117a <i2cWrite>
 8000820:	2300      	movs	r3, #0
 8000822:	9303      	str	r3, [sp, #12]
 8000824:	9b03      	ldr	r3, [sp, #12]
 8000826:	2b0f      	cmp	r3, #15
 8000828:	d80d      	bhi.n	8000846 <LCD_SH1106_flush_buffer+0x76>
 800082a:	9b01      	ldr	r3, [sp, #4]
 800082c:	1c65      	adds	r5, r4, #1
 800082e:	01db      	lsls	r3, r3, #7
 8000830:	191c      	adds	r4, r3, r4
 8000832:	4b0c      	ldr	r3, [pc, #48]	; (8000864 <LCD_SH1106_flush_buffer+0x94>)
 8000834:	5ce0      	ldrb	r0, [r4, r3]
 8000836:	1c2c      	adds	r4, r5, #0
 8000838:	b2c0      	uxtb	r0, r0
 800083a:	f000 fc9e 	bl	800117a <i2cWrite>
 800083e:	9b03      	ldr	r3, [sp, #12]
 8000840:	3301      	adds	r3, #1
 8000842:	9303      	str	r3, [sp, #12]
 8000844:	e7ee      	b.n	8000824 <LCD_SH1106_flush_buffer+0x54>
 8000846:	f000 fc8a 	bl	800115e <i2cStop>
 800084a:	9b02      	ldr	r3, [sp, #8]
 800084c:	3301      	adds	r3, #1
 800084e:	9302      	str	r3, [sp, #8]
 8000850:	e7db      	b.n	800080a <LCD_SH1106_flush_buffer+0x3a>
 8000852:	9b01      	ldr	r3, [sp, #4]
 8000854:	3301      	adds	r3, #1
 8000856:	e7c7      	b.n	80007e8 <LCD_SH1106_flush_buffer+0x18>
 8000858:	2000      	movs	r0, #0
 800085a:	1c01      	adds	r1, r0, #0
 800085c:	f7ff ff6b 	bl	8000736 <LCD_SH1106_set_cursor>
 8000860:	b005      	add	sp, #20
 8000862:	bd30      	pop	{r4, r5, pc}
 8000864:	20000252 	.word	0x20000252

08000868 <LCD_SH1106_flush_buffer_partial>:
 8000868:	b5f0      	push	{r4, r5, r6, r7, lr}
 800086a:	4c32      	ldr	r4, [pc, #200]	; (8000934 <LCD_SH1106_flush_buffer_partial+0xcc>)
 800086c:	b085      	sub	sp, #20
 800086e:	8826      	ldrh	r6, [r4, #0]
 8000870:	1c25      	adds	r5, r4, #0
 8000872:	b2b6      	uxth	r6, r6
 8000874:	2e01      	cmp	r6, #1
 8000876:	d019      	beq.n	80008ac <LCD_SH1106_flush_buffer_partial+0x44>
 8000878:	2e00      	cmp	r6, #0
 800087a:	d009      	beq.n	8000890 <LCD_SH1106_flush_buffer_partial+0x28>
 800087c:	2500      	movs	r5, #0
 800087e:	2e02      	cmp	r6, #2
 8000880:	d154      	bne.n	800092c <LCD_SH1106_flush_buffer_partial+0xc4>
 8000882:	1c28      	adds	r0, r5, #0
 8000884:	1c29      	adds	r1, r5, #0
 8000886:	f7ff ff56 	bl	8000736 <LCD_SH1106_set_cursor>
 800088a:	8025      	strh	r5, [r4, #0]
 800088c:	1c28      	adds	r0, r5, #0
 800088e:	e04f      	b.n	8000930 <LCD_SH1106_flush_buffer_partial+0xc8>
 8000890:	1c30      	adds	r0, r6, #0
 8000892:	f7ff ff49 	bl	8000728 <LCD_SH1106_write_command>
 8000896:	2010      	movs	r0, #16
 8000898:	f7ff ff46 	bl	8000728 <LCD_SH1106_write_command>
 800089c:	2040      	movs	r0, #64	; 0x40
 800089e:	f7ff ff43 	bl	8000728 <LCD_SH1106_write_command>
 80008a2:	4b25      	ldr	r3, [pc, #148]	; (8000938 <LCD_SH1106_flush_buffer_partial+0xd0>)
 80008a4:	2001      	movs	r0, #1
 80008a6:	801e      	strh	r6, [r3, #0]
 80008a8:	8020      	strh	r0, [r4, #0]
 80008aa:	e041      	b.n	8000930 <LCD_SH1106_flush_buffer_partial+0xc8>
 80008ac:	4c22      	ldr	r4, [pc, #136]	; (8000938 <LCD_SH1106_flush_buffer_partial+0xd0>)
 80008ae:	2600      	movs	r6, #0
 80008b0:	8823      	ldrh	r3, [r4, #0]
 80008b2:	b29b      	uxth	r3, r3
 80008b4:	9301      	str	r3, [sp, #4]
 80008b6:	9801      	ldr	r0, [sp, #4]
 80008b8:	3850      	subs	r0, #80	; 0x50
 80008ba:	b2c0      	uxtb	r0, r0
 80008bc:	f7ff ff34 	bl	8000728 <LCD_SH1106_write_command>
 80008c0:	2002      	movs	r0, #2
 80008c2:	f7ff ff31 	bl	8000728 <LCD_SH1106_write_command>
 80008c6:	2010      	movs	r0, #16
 80008c8:	f7ff ff2e 	bl	8000728 <LCD_SH1106_write_command>
 80008cc:	9602      	str	r6, [sp, #8]
 80008ce:	9b02      	ldr	r3, [sp, #8]
 80008d0:	2b07      	cmp	r3, #7
 80008d2:	d820      	bhi.n	8000916 <LCD_SH1106_flush_buffer_partial+0xae>
 80008d4:	f000 fc35 	bl	8001142 <i2cStart>
 80008d8:	2078      	movs	r0, #120	; 0x78
 80008da:	f000 fc4e 	bl	800117a <i2cWrite>
 80008de:	2040      	movs	r0, #64	; 0x40
 80008e0:	f000 fc4b 	bl	800117a <i2cWrite>
 80008e4:	2300      	movs	r3, #0
 80008e6:	9303      	str	r3, [sp, #12]
 80008e8:	9b03      	ldr	r3, [sp, #12]
 80008ea:	2b0f      	cmp	r3, #15
 80008ec:	d80d      	bhi.n	800090a <LCD_SH1106_flush_buffer_partial+0xa2>
 80008ee:	9b01      	ldr	r3, [sp, #4]
 80008f0:	1c77      	adds	r7, r6, #1
 80008f2:	01db      	lsls	r3, r3, #7
 80008f4:	199e      	adds	r6, r3, r6
 80008f6:	4b11      	ldr	r3, [pc, #68]	; (800093c <LCD_SH1106_flush_buffer_partial+0xd4>)
 80008f8:	5cf0      	ldrb	r0, [r6, r3]
 80008fa:	1c3e      	adds	r6, r7, #0
 80008fc:	b2c0      	uxtb	r0, r0
 80008fe:	f000 fc3c 	bl	800117a <i2cWrite>
 8000902:	9b03      	ldr	r3, [sp, #12]
 8000904:	3301      	adds	r3, #1
 8000906:	9303      	str	r3, [sp, #12]
 8000908:	e7ee      	b.n	80008e8 <LCD_SH1106_flush_buffer_partial+0x80>
 800090a:	f000 fc28 	bl	800115e <i2cStop>
 800090e:	9b02      	ldr	r3, [sp, #8]
 8000910:	3301      	adds	r3, #1
 8000912:	9302      	str	r3, [sp, #8]
 8000914:	e7db      	b.n	80008ce <LCD_SH1106_flush_buffer_partial+0x66>
 8000916:	8823      	ldrh	r3, [r4, #0]
 8000918:	2001      	movs	r0, #1
 800091a:	3301      	adds	r3, #1
 800091c:	b29b      	uxth	r3, r3
 800091e:	8023      	strh	r3, [r4, #0]
 8000920:	8823      	ldrh	r3, [r4, #0]
 8000922:	2b07      	cmp	r3, #7
 8000924:	d904      	bls.n	8000930 <LCD_SH1106_flush_buffer_partial+0xc8>
 8000926:	2302      	movs	r3, #2
 8000928:	802b      	strh	r3, [r5, #0]
 800092a:	e001      	b.n	8000930 <LCD_SH1106_flush_buffer_partial+0xc8>
 800092c:	8025      	strh	r5, [r4, #0]
 800092e:	2001      	movs	r0, #1
 8000930:	b005      	add	sp, #20
 8000932:	bdf0      	pop	{r4, r5, r6, r7, pc}
 8000934:	20000250 	.word	0x20000250
 8000938:	20000652 	.word	0x20000652
 800093c:	20000252 	.word	0x20000252

08000940 <LCD_SH1106_init>:
 8000940:	b508      	push	{r3, lr}
 8000942:	20ae      	movs	r0, #174	; 0xae
 8000944:	f7ff fef0 	bl	8000728 <LCD_SH1106_write_command>
 8000948:	2002      	movs	r0, #2
 800094a:	f7ff feed 	bl	8000728 <LCD_SH1106_write_command>
 800094e:	2010      	movs	r0, #16
 8000950:	f7ff feea 	bl	8000728 <LCD_SH1106_write_command>
 8000954:	2040      	movs	r0, #64	; 0x40
 8000956:	f7ff fee7 	bl	8000728 <LCD_SH1106_write_command>
 800095a:	20b0      	movs	r0, #176	; 0xb0
 800095c:	f7ff fee4 	bl	8000728 <LCD_SH1106_write_command>
 8000960:	2081      	movs	r0, #129	; 0x81
 8000962:	f7ff fee1 	bl	8000728 <LCD_SH1106_write_command>
 8000966:	2080      	movs	r0, #128	; 0x80
 8000968:	f7ff fede 	bl	8000728 <LCD_SH1106_write_command>
 800096c:	20a1      	movs	r0, #161	; 0xa1
 800096e:	f7ff fedb 	bl	8000728 <LCD_SH1106_write_command>
 8000972:	20a6      	movs	r0, #166	; 0xa6
 8000974:	f7ff fed8 	bl	8000728 <LCD_SH1106_write_command>
 8000978:	20a8      	movs	r0, #168	; 0xa8
 800097a:	f7ff fed5 	bl	8000728 <LCD_SH1106_write_command>
 800097e:	203f      	movs	r0, #63	; 0x3f
 8000980:	f7ff fed2 	bl	8000728 <LCD_SH1106_write_command>
 8000984:	20ad      	movs	r0, #173	; 0xad
 8000986:	f7ff fecf 	bl	8000728 <LCD_SH1106_write_command>
 800098a:	208b      	movs	r0, #139	; 0x8b
 800098c:	f7ff fecc 	bl	8000728 <LCD_SH1106_write_command>
 8000990:	2030      	movs	r0, #48	; 0x30
 8000992:	f7ff fec9 	bl	8000728 <LCD_SH1106_write_command>
 8000996:	20c8      	movs	r0, #200	; 0xc8
 8000998:	f7ff fec6 	bl	8000728 <LCD_SH1106_write_command>
 800099c:	20d3      	movs	r0, #211	; 0xd3
 800099e:	f7ff fec3 	bl	8000728 <LCD_SH1106_write_command>
 80009a2:	2000      	movs	r0, #0
 80009a4:	f7ff fec0 	bl	8000728 <LCD_SH1106_write_command>
 80009a8:	20d5      	movs	r0, #213	; 0xd5
 80009aa:	f7ff febd 	bl	8000728 <LCD_SH1106_write_command>
 80009ae:	2080      	movs	r0, #128	; 0x80
 80009b0:	f7ff feba 	bl	8000728 <LCD_SH1106_write_command>
 80009b4:	20d9      	movs	r0, #217	; 0xd9
 80009b6:	f7ff feb7 	bl	8000728 <LCD_SH1106_write_command>
 80009ba:	201f      	movs	r0, #31
 80009bc:	f7ff feb4 	bl	8000728 <LCD_SH1106_write_command>
 80009c0:	20da      	movs	r0, #218	; 0xda
 80009c2:	f7ff feb1 	bl	8000728 <LCD_SH1106_write_command>
 80009c6:	2012      	movs	r0, #18
 80009c8:	f7ff feae 	bl	8000728 <LCD_SH1106_write_command>
 80009cc:	20db      	movs	r0, #219	; 0xdb
 80009ce:	f7ff feab 	bl	8000728 <LCD_SH1106_write_command>
 80009d2:	2040      	movs	r0, #64	; 0x40
 80009d4:	f7ff fea8 	bl	8000728 <LCD_SH1106_write_command>
 80009d8:	20af      	movs	r0, #175	; 0xaf
 80009da:	f7ff fea5 	bl	8000728 <LCD_SH1106_write_command>
 80009de:	2000      	movs	r0, #0
 80009e0:	f7ff feda 	bl	8000798 <LCD_SH1106_clear_buffer>
 80009e4:	f7ff fef4 	bl	80007d0 <LCD_SH1106_flush_buffer>
 80009e8:	4a02      	ldr	r2, [pc, #8]	; (80009f4 <LCD_SH1106_init+0xb4>)
 80009ea:	2300      	movs	r3, #0
 80009ec:	8013      	strh	r3, [r2, #0]
 80009ee:	4a02      	ldr	r2, [pc, #8]	; (80009f8 <LCD_SH1106_init+0xb8>)
 80009f0:	8013      	strh	r3, [r2, #0]
 80009f2:	bd08      	pop	{r3, pc}
 80009f4:	20000250 	.word	0x20000250
 80009f8:	20000652 	.word	0x20000652

080009fc <lcd_put_char_xy>:
 80009fc:	b5f7      	push	{r0, r1, r2, r4, r5, r6, r7, lr}
 80009fe:	2300      	movs	r3, #0
 8000a00:	1c06      	adds	r6, r0, #0
 8000a02:	1c0f      	adds	r7, r1, #0
 8000a04:	2a1f      	cmp	r2, #31
 8000a06:	d902      	bls.n	8000a0e <lcd_put_char_xy+0x12>
 8000a08:	1c13      	adds	r3, r2, #0
 8000a0a:	3b20      	subs	r3, #32
 8000a0c:	b2db      	uxtb	r3, r3
 8000a0e:	011b      	lsls	r3, r3, #4
 8000a10:	9300      	str	r3, [sp, #0]
 8000a12:	2500      	movs	r5, #0
 8000a14:	2301      	movs	r3, #1
 8000a16:	40ab      	lsls	r3, r5
 8000a18:	b2db      	uxtb	r3, r3
 8000a1a:	9301      	str	r3, [sp, #4]
 8000a1c:	2400      	movs	r4, #0
 8000a1e:	1c30      	adds	r0, r6, #0
 8000a20:	3008      	adds	r0, #8
 8000a22:	19e1      	adds	r1, r4, r7
 8000a24:	1b40      	subs	r0, r0, r5
 8000a26:	2880      	cmp	r0, #128	; 0x80
 8000a28:	d900      	bls.n	8000a2c <lcd_put_char_xy+0x30>
 8000a2a:	2080      	movs	r0, #128	; 0x80
 8000a2c:	2940      	cmp	r1, #64	; 0x40
 8000a2e:	d900      	bls.n	8000a32 <lcd_put_char_xy+0x36>
 8000a30:	2140      	movs	r1, #64	; 0x40
 8000a32:	9a00      	ldr	r2, [sp, #0]
 8000a34:	4b06      	ldr	r3, [pc, #24]	; (8000a50 <lcd_put_char_xy+0x54>)
 8000a36:	189b      	adds	r3, r3, r2
 8000a38:	5d1a      	ldrb	r2, [r3, r4]
 8000a3a:	9b01      	ldr	r3, [sp, #4]
 8000a3c:	3401      	adds	r4, #1
 8000a3e:	401a      	ands	r2, r3
 8000a40:	f7ff fe8c 	bl	800075c <LCD_SH1106_set_pixel>
 8000a44:	2c10      	cmp	r4, #16
 8000a46:	d1ea      	bne.n	8000a1e <lcd_put_char_xy+0x22>
 8000a48:	3501      	adds	r5, #1
 8000a4a:	2d08      	cmp	r5, #8
 8000a4c:	d1e2      	bne.n	8000a14 <lcd_put_char_xy+0x18>
 8000a4e:	bdf7      	pop	{r0, r1, r2, r4, r5, r6, r7, pc}
 8000a50:	080026e5 	.word	0x080026e5

08000a54 <lcd_put_int>:
 8000a54:	b5f0      	push	{r4, r5, r6, r7, lr}
 8000a56:	2300      	movs	r3, #0
 8000a58:	b087      	sub	sp, #28
 8000a5a:	1c04      	adds	r4, r0, #0
 8000a5c:	9100      	str	r1, [sp, #0]
 8000a5e:	9201      	str	r2, [sp, #4]
 8000a60:	1c1f      	adds	r7, r3, #0
 8000a62:	4298      	cmp	r0, r3
 8000a64:	da01      	bge.n	8000a6a <lcd_put_int+0x16>
 8000a66:	4244      	negs	r4, r0
 8000a68:	2701      	movs	r7, #1
 8000a6a:	ae03      	add	r6, sp, #12
 8000a6c:	72f3      	strb	r3, [r6, #11]
 8000a6e:	250a      	movs	r5, #10
 8000a70:	1c20      	adds	r0, r4, #0
 8000a72:	210a      	movs	r1, #10
 8000a74:	f001 fe16 	bl	80026a4 <__aeabi_idivmod>
 8000a78:	3130      	adds	r1, #48	; 0x30
 8000a7a:	5571      	strb	r1, [r6, r5]
 8000a7c:	1c20      	adds	r0, r4, #0
 8000a7e:	210a      	movs	r1, #10
 8000a80:	f001 fdba 	bl	80025f8 <__aeabi_idiv>
 8000a84:	1e6b      	subs	r3, r5, #1
 8000a86:	1e04      	subs	r4, r0, #0
 8000a88:	d001      	beq.n	8000a8e <lcd_put_int+0x3a>
 8000a8a:	1c1d      	adds	r5, r3, #0
 8000a8c:	e7f0      	b.n	8000a70 <lcd_put_int+0x1c>
 8000a8e:	2f00      	cmp	r7, #0
 8000a90:	d002      	beq.n	8000a98 <lcd_put_int+0x44>
 8000a92:	222d      	movs	r2, #45	; 0x2d
 8000a94:	54f2      	strb	r2, [r6, r3]
 8000a96:	1c1d      	adds	r5, r3, #0
 8000a98:	2400      	movs	r4, #0
 8000a9a:	1973      	adds	r3, r6, r5
 8000a9c:	5d1f      	ldrb	r7, [r3, r4]
 8000a9e:	9b00      	ldr	r3, [sp, #0]
 8000aa0:	00e0      	lsls	r0, r4, #3
 8000aa2:	18c0      	adds	r0, r0, r3
 8000aa4:	9901      	ldr	r1, [sp, #4]
 8000aa6:	1c3a      	adds	r2, r7, #0
 8000aa8:	f7ff ffa8 	bl	80009fc <lcd_put_char_xy>
 8000aac:	2f00      	cmp	r7, #0
 8000aae:	d002      	beq.n	8000ab6 <lcd_put_int+0x62>
 8000ab0:	3401      	adds	r4, #1
 8000ab2:	2c0c      	cmp	r4, #12
 8000ab4:	d1f1      	bne.n	8000a9a <lcd_put_int+0x46>
 8000ab6:	b007      	add	sp, #28
 8000ab8:	bdf0      	pop	{r4, r5, r6, r7, pc}
	...

08000abc <mpu6050_read>:
 8000abc:	b538      	push	{r3, r4, r5, lr}
 8000abe:	213b      	movs	r1, #59	; 0x3b
 8000ac0:	20d0      	movs	r0, #208	; 0xd0
 8000ac2:	f000 fbb8 	bl	8001236 <i2c_read_reg>
 8000ac6:	4c38      	ldr	r4, [pc, #224]	; (8000ba8 <mpu6050_read+0xec>)
 8000ac8:	0205      	lsls	r5, r0, #8
 8000aca:	b2ad      	uxth	r5, r5
 8000acc:	213c      	movs	r1, #60	; 0x3c
 8000ace:	20d0      	movs	r0, #208	; 0xd0
 8000ad0:	8025      	strh	r5, [r4, #0]
 8000ad2:	f000 fbb0 	bl	8001236 <i2c_read_reg>
 8000ad6:	213d      	movs	r1, #61	; 0x3d
 8000ad8:	4305      	orrs	r5, r0
 8000ada:	20d0      	movs	r0, #208	; 0xd0
 8000adc:	8025      	strh	r5, [r4, #0]
 8000ade:	f000 fbaa 	bl	8001236 <i2c_read_reg>
 8000ae2:	0205      	lsls	r5, r0, #8
 8000ae4:	b2ad      	uxth	r5, r5
 8000ae6:	213e      	movs	r1, #62	; 0x3e
 8000ae8:	20d0      	movs	r0, #208	; 0xd0
 8000aea:	8065      	strh	r5, [r4, #2]
 8000aec:	f000 fba3 	bl	8001236 <i2c_read_reg>
 8000af0:	213f      	movs	r1, #63	; 0x3f
 8000af2:	4305      	orrs	r5, r0
 8000af4:	20d0      	movs	r0, #208	; 0xd0
 8000af6:	8065      	strh	r5, [r4, #2]
 8000af8:	f000 fb9d 	bl	8001236 <i2c_read_reg>
 8000afc:	0205      	lsls	r5, r0, #8
 8000afe:	b2ad      	uxth	r5, r5
 8000b00:	2140      	movs	r1, #64	; 0x40
 8000b02:	20d0      	movs	r0, #208	; 0xd0
 8000b04:	80a5      	strh	r5, [r4, #4]
 8000b06:	f000 fb96 	bl	8001236 <i2c_read_reg>
 8000b0a:	2141      	movs	r1, #65	; 0x41
 8000b0c:	4305      	orrs	r5, r0
 8000b0e:	20d0      	movs	r0, #208	; 0xd0
 8000b10:	80a5      	strh	r5, [r4, #4]
 8000b12:	f000 fb90 	bl	8001236 <i2c_read_reg>
 8000b16:	0205      	lsls	r5, r0, #8
 8000b18:	b2ad      	uxth	r5, r5
 8000b1a:	2142      	movs	r1, #66	; 0x42
 8000b1c:	20d0      	movs	r0, #208	; 0xd0
 8000b1e:	8425      	strh	r5, [r4, #32]
 8000b20:	f000 fb89 	bl	8001236 <i2c_read_reg>
 8000b24:	2143      	movs	r1, #67	; 0x43
 8000b26:	4305      	orrs	r5, r0
 8000b28:	20d0      	movs	r0, #208	; 0xd0
 8000b2a:	8425      	strh	r5, [r4, #32]
 8000b2c:	f000 fb83 	bl	8001236 <i2c_read_reg>
 8000b30:	0205      	lsls	r5, r0, #8
 8000b32:	b2ad      	uxth	r5, r5
 8000b34:	2144      	movs	r1, #68	; 0x44
 8000b36:	20d0      	movs	r0, #208	; 0xd0
 8000b38:	80e5      	strh	r5, [r4, #6]
 8000b3a:	f000 fb7c 	bl	8001236 <i2c_read_reg>
 8000b3e:	2145      	movs	r1, #69	; 0x45
 8000b40:	4305      	orrs	r5, r0
 8000b42:	20d0      	movs	r0, #208	; 0xd0
 8000b44:	80e5      	strh	r5, [r4, #6]
 8000b46:	f000 fb76 	bl	8001236 <i2c_read_reg>
 8000b4a:	0205      	lsls	r5, r0, #8
 8000b4c:	b2ad      	uxth	r5, r5
 8000b4e:	2146      	movs	r1, #70	; 0x46
 8000b50:	20d0      	movs	r0, #208	; 0xd0
 8000b52:	8125      	strh	r5, [r4, #8]
 8000b54:	f000 fb6f 	bl	8001236 <i2c_read_reg>
 8000b58:	2147      	movs	r1, #71	; 0x47
 8000b5a:	4305      	orrs	r5, r0
 8000b5c:	20d0      	movs	r0, #208	; 0xd0
 8000b5e:	8125      	strh	r5, [r4, #8]
 8000b60:	f000 fb69 	bl	8001236 <i2c_read_reg>
 8000b64:	0205      	lsls	r5, r0, #8
 8000b66:	2148      	movs	r1, #72	; 0x48
 8000b68:	b2ad      	uxth	r5, r5
 8000b6a:	20d0      	movs	r0, #208	; 0xd0
 8000b6c:	8165      	strh	r5, [r4, #10]
 8000b6e:	f000 fb62 	bl	8001236 <i2c_read_reg>
 8000b72:	2106      	movs	r1, #6
 8000b74:	5e62      	ldrsh	r2, [r4, r1]
 8000b76:	210c      	movs	r1, #12
 8000b78:	5e63      	ldrsh	r3, [r4, r1]
 8000b7a:	4305      	orrs	r5, r0
 8000b7c:	1ad3      	subs	r3, r2, r3
 8000b7e:	6962      	ldr	r2, [r4, #20]
 8000b80:	b2ad      	uxth	r5, r5
 8000b82:	18d3      	adds	r3, r2, r3
 8000b84:	6163      	str	r3, [r4, #20]
 8000b86:	2308      	movs	r3, #8
 8000b88:	5ee2      	ldrsh	r2, [r4, r3]
 8000b8a:	210e      	movs	r1, #14
 8000b8c:	5e63      	ldrsh	r3, [r4, r1]
 8000b8e:	8165      	strh	r5, [r4, #10]
 8000b90:	1ad3      	subs	r3, r2, r3
 8000b92:	69a2      	ldr	r2, [r4, #24]
 8000b94:	b22d      	sxth	r5, r5
 8000b96:	18d3      	adds	r3, r2, r3
 8000b98:	61a3      	str	r3, [r4, #24]
 8000b9a:	2110      	movs	r1, #16
 8000b9c:	5e63      	ldrsh	r3, [r4, r1]
 8000b9e:	69e2      	ldr	r2, [r4, #28]
 8000ba0:	1aed      	subs	r5, r5, r3
 8000ba2:	1955      	adds	r5, r2, r5
 8000ba4:	61e5      	str	r5, [r4, #28]
 8000ba6:	bd38      	pop	{r3, r4, r5, pc}
 8000ba8:	20000654 	.word	0x20000654

08000bac <mpu6050_init>:
 8000bac:	b5f7      	push	{r0, r1, r2, r4, r5, r6, r7, lr}
 8000bae:	2600      	movs	r6, #0
 8000bb0:	4c1a      	ldr	r4, [pc, #104]	; (8000c1c <mpu6050_init+0x70>)
 8000bb2:	20d0      	movs	r0, #208	; 0xd0
 8000bb4:	216b      	movs	r1, #107	; 0x6b
 8000bb6:	1c32      	adds	r2, r6, #0
 8000bb8:	8026      	strh	r6, [r4, #0]
 8000bba:	8066      	strh	r6, [r4, #2]
 8000bbc:	80a6      	strh	r6, [r4, #4]
 8000bbe:	80e6      	strh	r6, [r4, #6]
 8000bc0:	8126      	strh	r6, [r4, #8]
 8000bc2:	8166      	strh	r6, [r4, #10]
 8000bc4:	2564      	movs	r5, #100	; 0x64
 8000bc6:	f000 fb24 	bl	8001212 <i2c_write_reg>
 8000bca:	1c37      	adds	r7, r6, #0
 8000bcc:	9601      	str	r6, [sp, #4]
 8000bce:	f7ff ff75 	bl	8000abc <mpu6050_read>
 8000bd2:	200a      	movs	r0, #10
 8000bd4:	f000 f9a6 	bl	8000f24 <timer_delay_ms>
 8000bd8:	2206      	movs	r2, #6
 8000bda:	5ea3      	ldrsh	r3, [r4, r2]
 8000bdc:	3d01      	subs	r5, #1
 8000bde:	18ff      	adds	r7, r7, r3
 8000be0:	2208      	movs	r2, #8
 8000be2:	5ea3      	ldrsh	r3, [r4, r2]
 8000be4:	9a01      	ldr	r2, [sp, #4]
 8000be6:	18d2      	adds	r2, r2, r3
 8000be8:	9201      	str	r2, [sp, #4]
 8000bea:	220a      	movs	r2, #10
 8000bec:	5ea3      	ldrsh	r3, [r4, r2]
 8000bee:	18f6      	adds	r6, r6, r3
 8000bf0:	2d00      	cmp	r5, #0
 8000bf2:	d1ec      	bne.n	8000bce <mpu6050_init+0x22>
 8000bf4:	1c38      	adds	r0, r7, #0
 8000bf6:	2164      	movs	r1, #100	; 0x64
 8000bf8:	f001 fcfe 	bl	80025f8 <__aeabi_idiv>
 8000bfc:	2164      	movs	r1, #100	; 0x64
 8000bfe:	81a0      	strh	r0, [r4, #12]
 8000c00:	9801      	ldr	r0, [sp, #4]
 8000c02:	f001 fcf9 	bl	80025f8 <__aeabi_idiv>
 8000c06:	2164      	movs	r1, #100	; 0x64
 8000c08:	81e0      	strh	r0, [r4, #14]
 8000c0a:	1c30      	adds	r0, r6, #0
 8000c0c:	f001 fcf4 	bl	80025f8 <__aeabi_idiv>
 8000c10:	6165      	str	r5, [r4, #20]
 8000c12:	61a5      	str	r5, [r4, #24]
 8000c14:	61e5      	str	r5, [r4, #28]
 8000c16:	8220      	strh	r0, [r4, #16]
 8000c18:	bdf7      	pop	{r0, r1, r2, r4, r5, r6, r7, pc}
 8000c1a:	46c0      	nop			; (mov r8, r8)
 8000c1c:	20000654 	.word	0x20000654

08000c20 <i2c_devices_thread>:
 8000c20:	b538      	push	{r3, r4, r5, lr}
 8000c22:	2132      	movs	r1, #50	; 0x32
 8000c24:	2000      	movs	r0, #0
 8000c26:	f000 f98d 	bl	8000f44 <event_timer_set_period>
 8000c2a:	f7ff fcad 	bl	8000588 <hmc5883_init>
 8000c2e:	f7ff ffbd 	bl	8000bac <mpu6050_init>
 8000c32:	f7ff fd51 	bl	80006d8 <apds950_init>
 8000c36:	f7ff fe83 	bl	8000940 <LCD_SH1106_init>
 8000c3a:	2000      	movs	r0, #0
 8000c3c:	f7ff fdac 	bl	8000798 <LCD_SH1106_clear_buffer>
 8000c40:	2000      	movs	r0, #0
 8000c42:	f000 f991 	bl	8000f68 <event_timer_get_flag>
 8000c46:	2800      	cmp	r0, #0
 8000c48:	d00e      	beq.n	8000c68 <i2c_devices_thread+0x48>
 8000c4a:	2000      	movs	r0, #0
 8000c4c:	f000 f99a 	bl	8000f84 <event_timer_clear_flag>
 8000c50:	2008      	movs	r0, #8
 8000c52:	f001 fc25 	bl	80024a0 <led_on>
 8000c56:	f7ff fcc7 	bl	80005e8 <hmc5883_read>
 8000c5a:	f7ff ff2f 	bl	8000abc <mpu6050_read>
 8000c5e:	f7ff fcef 	bl	8000640 <apds9950_read>
 8000c62:	2008      	movs	r0, #8
 8000c64:	f001 fc30 	bl	80024c8 <led_off>
 8000c68:	f7ff fdfe 	bl	8000868 <LCD_SH1106_flush_buffer_partial>
 8000c6c:	1e04      	subs	r4, r0, #0
 8000c6e:	d1e7      	bne.n	8000c40 <i2c_devices_thread+0x20>
 8000c70:	f7ff fd92 	bl	8000798 <LCD_SH1106_clear_buffer>
 8000c74:	4d17      	ldr	r5, [pc, #92]	; (8000cd4 <i2c_devices_thread+0xb4>)
 8000c76:	1c21      	adds	r1, r4, #0
 8000c78:	6968      	ldr	r0, [r5, #20]
 8000c7a:	1c22      	adds	r2, r4, #0
 8000c7c:	f7ff feea 	bl	8000a54 <lcd_put_int>
 8000c80:	69a8      	ldr	r0, [r5, #24]
 8000c82:	1c21      	adds	r1, r4, #0
 8000c84:	2210      	movs	r2, #16
 8000c86:	f7ff fee5 	bl	8000a54 <lcd_put_int>
 8000c8a:	69e8      	ldr	r0, [r5, #28]
 8000c8c:	1c21      	adds	r1, r4, #0
 8000c8e:	2220      	movs	r2, #32
 8000c90:	f7ff fee0 	bl	8000a54 <lcd_put_int>
 8000c94:	4d10      	ldr	r5, [pc, #64]	; (8000cd8 <i2c_devices_thread+0xb8>)
 8000c96:	1c22      	adds	r2, r4, #0
 8000c98:	2300      	movs	r3, #0
 8000c9a:	5ee8      	ldrsh	r0, [r5, r3]
 8000c9c:	2140      	movs	r1, #64	; 0x40
 8000c9e:	f7ff fed9 	bl	8000a54 <lcd_put_int>
 8000ca2:	2302      	movs	r3, #2
 8000ca4:	5ee8      	ldrsh	r0, [r5, r3]
 8000ca6:	2140      	movs	r1, #64	; 0x40
 8000ca8:	2210      	movs	r2, #16
 8000caa:	f7ff fed3 	bl	8000a54 <lcd_put_int>
 8000cae:	2304      	movs	r3, #4
 8000cb0:	5ee8      	ldrsh	r0, [r5, r3]
 8000cb2:	2140      	movs	r1, #64	; 0x40
 8000cb4:	2220      	movs	r2, #32
 8000cb6:	f7ff fecd 	bl	8000a54 <lcd_put_int>
 8000cba:	4b08      	ldr	r3, [pc, #32]	; (8000cdc <i2c_devices_thread+0xbc>)
 8000cbc:	1c21      	adds	r1, r4, #0
 8000cbe:	88d8      	ldrh	r0, [r3, #6]
 8000cc0:	2230      	movs	r2, #48	; 0x30
 8000cc2:	f7ff fec7 	bl	8000a54 <lcd_put_int>
 8000cc6:	f000 f921 	bl	8000f0c <timer_get_time>
 8000cca:	2140      	movs	r1, #64	; 0x40
 8000ccc:	2230      	movs	r2, #48	; 0x30
 8000cce:	f7ff fec1 	bl	8000a54 <lcd_put_int>
 8000cd2:	e7b5      	b.n	8000c40 <i2c_devices_thread+0x20>
 8000cd4:	20000654 	.word	0x20000654
 8000cd8:	20000240 	.word	0x20000240
 8000cdc:	20000246 	.word	0x20000246

08000ce0 <main_thread>:
 8000ce0:	b538      	push	{r3, r4, r5, lr}
 8000ce2:	2008      	movs	r0, #8
 8000ce4:	f001 fbdc 	bl	80024a0 <led_on>
 8000ce8:	4823      	ldr	r0, [pc, #140]	; (8000d78 <main_thread+0x98>)
 8000cea:	f7ff fb9d 	bl	8000428 <printf_>
 8000cee:	2280      	movs	r2, #128	; 0x80
 8000cf0:	4922      	ldr	r1, [pc, #136]	; (8000d7c <main_thread+0x9c>)
 8000cf2:	0052      	lsls	r2, r2, #1
 8000cf4:	2308      	movs	r3, #8
 8000cf6:	4822      	ldr	r0, [pc, #136]	; (8000d80 <main_thread+0xa0>)
 8000cf8:	f7ff fa70 	bl	80001dc <create_thread>
 8000cfc:	f000 faf8 	bl	80012f0 <ws2812_init>
 8000d00:	f000 fb3c 	bl	800137c <ws2812_demo>
 8000d04:	2008      	movs	r0, #8
 8000d06:	f001 fbcb 	bl	80024a0 <led_on>
 8000d0a:	f000 f8ff 	bl	8000f0c <timer_get_time>
 8000d0e:	1c01      	adds	r1, r0, #0
 8000d10:	481c      	ldr	r0, [pc, #112]	; (8000d84 <main_thread+0xa4>)
 8000d12:	f7ff fb89 	bl	8000428 <printf_>
 8000d16:	4c1c      	ldr	r4, [pc, #112]	; (8000d88 <main_thread+0xa8>)
 8000d18:	4d1c      	ldr	r5, [pc, #112]	; (8000d8c <main_thread+0xac>)
 8000d1a:	2302      	movs	r3, #2
 8000d1c:	5ee2      	ldrsh	r2, [r4, r3]
 8000d1e:	2000      	movs	r0, #0
 8000d20:	5e21      	ldrsh	r1, [r4, r0]
 8000d22:	2004      	movs	r0, #4
 8000d24:	5e23      	ldrsh	r3, [r4, r0]
 8000d26:	1c28      	adds	r0, r5, #0
 8000d28:	f7ff fb7e 	bl	8000428 <printf_>
 8000d2c:	2206      	movs	r2, #6
 8000d2e:	5ea1      	ldrsh	r1, [r4, r2]
 8000d30:	2308      	movs	r3, #8
 8000d32:	5ee2      	ldrsh	r2, [r4, r3]
 8000d34:	200a      	movs	r0, #10
 8000d36:	5e23      	ldrsh	r3, [r4, r0]
 8000d38:	1c28      	adds	r0, r5, #0
 8000d3a:	f7ff fb75 	bl	8000428 <printf_>
 8000d3e:	4b14      	ldr	r3, [pc, #80]	; (8000d90 <main_thread+0xb0>)
 8000d40:	2200      	movs	r2, #0
 8000d42:	5e99      	ldrsh	r1, [r3, r2]
 8000d44:	2002      	movs	r0, #2
 8000d46:	5e1a      	ldrsh	r2, [r3, r0]
 8000d48:	2004      	movs	r0, #4
 8000d4a:	5e1b      	ldrsh	r3, [r3, r0]
 8000d4c:	1c28      	adds	r0, r5, #0
 8000d4e:	f7ff fb6b 	bl	8000428 <printf_>
 8000d52:	4b10      	ldr	r3, [pc, #64]	; (8000d94 <main_thread+0xb4>)
 8000d54:	1c28      	adds	r0, r5, #0
 8000d56:	8819      	ldrh	r1, [r3, #0]
 8000d58:	885a      	ldrh	r2, [r3, #2]
 8000d5a:	889b      	ldrh	r3, [r3, #4]
 8000d5c:	f7ff fb64 	bl	8000428 <printf_>
 8000d60:	480d      	ldr	r0, [pc, #52]	; (8000d98 <main_thread+0xb8>)
 8000d62:	f7ff fb61 	bl	8000428 <printf_>
 8000d66:	2008      	movs	r0, #8
 8000d68:	f001 fbae 	bl	80024c8 <led_off>
 8000d6c:	20fa      	movs	r0, #250	; 0xfa
 8000d6e:	0080      	lsls	r0, r0, #2
 8000d70:	f000 f8d8 	bl	8000f24 <timer_delay_ms>
 8000d74:	e7c4      	b.n	8000d00 <main_thread+0x20>
 8000d76:	46c0      	nop			; (mov r8, r8)
 8000d78:	08002ce5 	.word	0x08002ce5
 8000d7c:	20000678 	.word	0x20000678
 8000d80:	08000c21 	.word	0x08000c21
 8000d84:	08002d20 	.word	0x08002d20
 8000d88:	20000654 	.word	0x20000654
 8000d8c:	08002d27 	.word	0x08002d27
 8000d90:	20000240 	.word	0x20000240
 8000d94:	20000246 	.word	0x20000246
 8000d98:	08002d80 	.word	0x08002d80

08000d9c <mem_info_print>:
 8000d9c:	b538      	push	{r3, r4, r5, lr}
 8000d9e:	480e      	ldr	r0, [pc, #56]	; (8000dd8 <mem_info_print+0x3c>)
 8000da0:	490e      	ldr	r1, [pc, #56]	; (8000ddc <mem_info_print+0x40>)
 8000da2:	f7ff fb41 	bl	8000428 <printf_>
 8000da6:	4c0e      	ldr	r4, [pc, #56]	; (8000de0 <mem_info_print+0x44>)
 8000da8:	480e      	ldr	r0, [pc, #56]	; (8000de4 <mem_info_print+0x48>)
 8000daa:	1c21      	adds	r1, r4, #0
 8000dac:	f7ff fb3c 	bl	8000428 <printf_>
 8000db0:	4d0d      	ldr	r5, [pc, #52]	; (8000de8 <mem_info_print+0x4c>)
 8000db2:	480e      	ldr	r0, [pc, #56]	; (8000dec <mem_info_print+0x50>)
 8000db4:	1b2d      	subs	r5, r5, r4
 8000db6:	1c29      	adds	r1, r5, #0
 8000db8:	f7ff fb36 	bl	8000428 <printf_>
 8000dbc:	490c      	ldr	r1, [pc, #48]	; (8000df0 <mem_info_print+0x54>)
 8000dbe:	480d      	ldr	r0, [pc, #52]	; (8000df4 <mem_info_print+0x58>)
 8000dc0:	1a64      	subs	r4, r4, r1
 8000dc2:	1929      	adds	r1, r5, r4
 8000dc4:	f7ff fb30 	bl	8000428 <printf_>
 8000dc8:	490b      	ldr	r1, [pc, #44]	; (8000df8 <mem_info_print+0x5c>)
 8000dca:	480c      	ldr	r0, [pc, #48]	; (8000dfc <mem_info_print+0x60>)
 8000dcc:	f7ff fb2c 	bl	8000428 <printf_>
 8000dd0:	480b      	ldr	r0, [pc, #44]	; (8000e00 <mem_info_print+0x64>)
 8000dd2:	f7ff fb29 	bl	8000428 <printf_>
 8000dd6:	bd38      	pop	{r3, r4, r5, pc}
 8000dd8:	08002d33 	.word	0x08002d33
 8000ddc:	080026bc 	.word	0x080026bc
 8000de0:	20000000 	.word	0x20000000
 8000de4:	08002d44 	.word	0x08002d44
 8000de8:	20001000 	.word	0x20001000
 8000dec:	08002d53 	.word	0x08002d53
 8000df0:	200008c8 	.word	0x200008c8
 8000df4:	08002d61 	.word	0x08002d61
 8000df8:	200008c8 	.word	0x200008c8
 8000dfc:	08002d6f 	.word	0x08002d6f
 8000e00:	08002d7f 	.word	0x08002d7f

08000e04 <main>:
 8000e04:	b508      	push	{r3, lr}
 8000e06:	f000 fb79 	bl	80014fc <lib_low_level_init>
 8000e0a:	f7ff fb87 	bl	800051c <lib_os_init>
 8000e0e:	f7ff ffc5 	bl	8000d9c <mem_info_print>
 8000e12:	2280      	movs	r2, #128	; 0x80
 8000e14:	4904      	ldr	r1, [pc, #16]	; (8000e28 <main+0x24>)
 8000e16:	0052      	lsls	r2, r2, #1
 8000e18:	2308      	movs	r3, #8
 8000e1a:	4804      	ldr	r0, [pc, #16]	; (8000e2c <main+0x28>)
 8000e1c:	f7ff f9de 	bl	80001dc <create_thread>
 8000e20:	f7ff f9d6 	bl	80001d0 <kernel_start>
 8000e24:	2000      	movs	r0, #0
 8000e26:	bd08      	pop	{r3, pc}
 8000e28:	20000778 	.word	0x20000778
 8000e2c:	08000ce1 	.word	0x08000ce1

08000e30 <timer_init>:
 8000e30:	b530      	push	{r4, r5, lr}
 8000e32:	2300      	movs	r3, #0
 8000e34:	b085      	sub	sp, #20
 8000e36:	481b      	ldr	r0, [pc, #108]	; (8000ea4 <timer_init+0x74>)
 8000e38:	2180      	movs	r1, #128	; 0x80
 8000e3a:	005a      	lsls	r2, r3, #1
 8000e3c:	00c9      	lsls	r1, r1, #3
 8000e3e:	5211      	strh	r1, [r2, r0]
 8000e40:	4819      	ldr	r0, [pc, #100]	; (8000ea8 <timer_init+0x78>)
 8000e42:	2400      	movs	r4, #0
 8000e44:	5211      	strh	r1, [r2, r0]
 8000e46:	4919      	ldr	r1, [pc, #100]	; (8000eac <timer_init+0x7c>)
 8000e48:	3301      	adds	r3, #1
 8000e4a:	5254      	strh	r4, [r2, r1]
 8000e4c:	2b04      	cmp	r3, #4
 8000e4e:	d1f2      	bne.n	8000e36 <timer_init+0x6>
 8000e50:	4b17      	ldr	r3, [pc, #92]	; (8000eb0 <timer_init+0x80>)
 8000e52:	2001      	movs	r0, #1
 8000e54:	1c01      	adds	r1, r0, #0
 8000e56:	601c      	str	r4, [r3, #0]
 8000e58:	f001 fab4 	bl	80023c4 <RCC_APB1PeriphClockCmd>
 8000e5c:	a901      	add	r1, sp, #4
 8000e5e:	2330      	movs	r3, #48	; 0x30
 8000e60:	800b      	strh	r3, [r1, #0]
 8000e62:	2080      	movs	r0, #128	; 0x80
 8000e64:	23fa      	movs	r3, #250	; 0xfa
 8000e66:	009b      	lsls	r3, r3, #2
 8000e68:	05c0      	lsls	r0, r0, #23
 8000e6a:	604b      	str	r3, [r1, #4]
 8000e6c:	804c      	strh	r4, [r1, #2]
 8000e6e:	810c      	strh	r4, [r1, #8]
 8000e70:	728c      	strb	r4, [r1, #10]
 8000e72:	f000 fcfd 	bl	8001870 <TIM_TimeBaseInit>
 8000e76:	2080      	movs	r0, #128	; 0x80
 8000e78:	05c0      	lsls	r0, r0, #23
 8000e7a:	2101      	movs	r1, #1
 8000e7c:	f000 fd7a 	bl	8001974 <TIM_Cmd>
 8000e80:	2080      	movs	r0, #128	; 0x80
 8000e82:	2102      	movs	r1, #2
 8000e84:	05c0      	lsls	r0, r0, #23
 8000e86:	2201      	movs	r2, #1
 8000e88:	f000 fdb8 	bl	80019fc <TIM_ITConfig>
 8000e8c:	466a      	mov	r2, sp
 8000e8e:	230f      	movs	r3, #15
 8000e90:	7013      	strb	r3, [r2, #0]
 8000e92:	4668      	mov	r0, sp
 8000e94:	2301      	movs	r3, #1
 8000e96:	7053      	strb	r3, [r2, #1]
 8000e98:	7093      	strb	r3, [r2, #2]
 8000e9a:	f001 f955 	bl	8002148 <NVIC_Init>
 8000e9e:	b005      	add	sp, #20
 8000ea0:	bd30      	pop	{r4, r5, pc}
 8000ea2:	46c0      	nop			; (mov r8, r8)
 8000ea4:	2000088c 	.word	0x2000088c
 8000ea8:	20000880 	.word	0x20000880
 8000eac:	20000878 	.word	0x20000878
 8000eb0:	20000888 	.word	0x20000888

08000eb4 <TIM2_IRQHandler>:
 8000eb4:	2200      	movs	r2, #0
 8000eb6:	490e      	ldr	r1, [pc, #56]	; (8000ef0 <TIM2_IRQHandler+0x3c>)
 8000eb8:	0053      	lsls	r3, r2, #1
 8000eba:	5a58      	ldrh	r0, [r3, r1]
 8000ebc:	2800      	cmp	r0, #0
 8000ebe:	d003      	beq.n	8000ec8 <TIM2_IRQHandler+0x14>
 8000ec0:	5a58      	ldrh	r0, [r3, r1]
 8000ec2:	3801      	subs	r0, #1
 8000ec4:	b280      	uxth	r0, r0
 8000ec6:	e005      	b.n	8000ed4 <TIM2_IRQHandler+0x20>
 8000ec8:	480a      	ldr	r0, [pc, #40]	; (8000ef4 <TIM2_IRQHandler+0x40>)
 8000eca:	5a18      	ldrh	r0, [r3, r0]
 8000ecc:	b280      	uxth	r0, r0
 8000ece:	5258      	strh	r0, [r3, r1]
 8000ed0:	4909      	ldr	r1, [pc, #36]	; (8000ef8 <TIM2_IRQHandler+0x44>)
 8000ed2:	2001      	movs	r0, #1
 8000ed4:	3201      	adds	r2, #1
 8000ed6:	5258      	strh	r0, [r3, r1]
 8000ed8:	2a04      	cmp	r2, #4
 8000eda:	d1ec      	bne.n	8000eb6 <TIM2_IRQHandler+0x2>
 8000edc:	4b07      	ldr	r3, [pc, #28]	; (8000efc <TIM2_IRQHandler+0x48>)
 8000ede:	681a      	ldr	r2, [r3, #0]
 8000ee0:	3201      	adds	r2, #1
 8000ee2:	601a      	str	r2, [r3, #0]
 8000ee4:	2380      	movs	r3, #128	; 0x80
 8000ee6:	2200      	movs	r2, #0
 8000ee8:	05db      	lsls	r3, r3, #23
 8000eea:	821a      	strh	r2, [r3, #16]
 8000eec:	4770      	bx	lr
 8000eee:	46c0      	nop			; (mov r8, r8)
 8000ef0:	2000088c 	.word	0x2000088c
 8000ef4:	20000880 	.word	0x20000880
 8000ef8:	20000878 	.word	0x20000878
 8000efc:	20000888 	.word	0x20000888

08000f00 <timer_delay_loops>:
 8000f00:	3801      	subs	r0, #1
 8000f02:	d301      	bcc.n	8000f08 <timer_delay_loops+0x8>
 8000f04:	46c0      	nop			; (mov r8, r8)
 8000f06:	e7fb      	b.n	8000f00 <timer_delay_loops>
 8000f08:	4770      	bx	lr
	...

08000f0c <timer_get_time>:
 8000f0c:	b082      	sub	sp, #8
 8000f0e:	b672      	cpsid	i
 8000f10:	4b03      	ldr	r3, [pc, #12]	; (8000f20 <timer_get_time+0x14>)
 8000f12:	681b      	ldr	r3, [r3, #0]
 8000f14:	9301      	str	r3, [sp, #4]
 8000f16:	b662      	cpsie	i
 8000f18:	9801      	ldr	r0, [sp, #4]
 8000f1a:	b002      	add	sp, #8
 8000f1c:	4770      	bx	lr
 8000f1e:	46c0      	nop			; (mov r8, r8)
 8000f20:	20000888 	.word	0x20000888

08000f24 <timer_delay_ms>:
 8000f24:	b513      	push	{r0, r1, r4, lr}
 8000f26:	1c04      	adds	r4, r0, #0
 8000f28:	f7ff fff0 	bl	8000f0c <timer_get_time>
 8000f2c:	1904      	adds	r4, r0, r4
 8000f2e:	9401      	str	r4, [sp, #4]
 8000f30:	9c01      	ldr	r4, [sp, #4]
 8000f32:	f7ff ffeb 	bl	8000f0c <timer_get_time>
 8000f36:	4284      	cmp	r4, r0
 8000f38:	d902      	bls.n	8000f40 <timer_delay_ms+0x1c>
 8000f3a:	f000 fa7f 	bl	800143c <sleep>
 8000f3e:	e7f7      	b.n	8000f30 <timer_delay_ms+0xc>
 8000f40:	bd13      	pop	{r0, r1, r4, pc}
	...

08000f44 <event_timer_set_period>:
 8000f44:	b672      	cpsid	i
 8000f46:	4b05      	ldr	r3, [pc, #20]	; (8000f5c <event_timer_set_period+0x18>)
 8000f48:	0040      	lsls	r0, r0, #1
 8000f4a:	52c1      	strh	r1, [r0, r3]
 8000f4c:	4b04      	ldr	r3, [pc, #16]	; (8000f60 <event_timer_set_period+0x1c>)
 8000f4e:	2200      	movs	r2, #0
 8000f50:	52c1      	strh	r1, [r0, r3]
 8000f52:	4b04      	ldr	r3, [pc, #16]	; (8000f64 <event_timer_set_period+0x20>)
 8000f54:	52c2      	strh	r2, [r0, r3]
 8000f56:	b662      	cpsie	i
 8000f58:	4770      	bx	lr
 8000f5a:	46c0      	nop			; (mov r8, r8)
 8000f5c:	2000088c 	.word	0x2000088c
 8000f60:	20000880 	.word	0x20000880
 8000f64:	20000878 	.word	0x20000878

08000f68 <event_timer_get_flag>:
 8000f68:	b082      	sub	sp, #8
 8000f6a:	b672      	cpsid	i
 8000f6c:	4b04      	ldr	r3, [pc, #16]	; (8000f80 <event_timer_get_flag+0x18>)
 8000f6e:	0040      	lsls	r0, r0, #1
 8000f70:	5ac3      	ldrh	r3, [r0, r3]
 8000f72:	b29b      	uxth	r3, r3
 8000f74:	9301      	str	r3, [sp, #4]
 8000f76:	b662      	cpsie	i
 8000f78:	9801      	ldr	r0, [sp, #4]
 8000f7a:	b002      	add	sp, #8
 8000f7c:	4770      	bx	lr
 8000f7e:	46c0      	nop			; (mov r8, r8)
 8000f80:	20000878 	.word	0x20000878

08000f84 <event_timer_clear_flag>:
 8000f84:	b672      	cpsid	i
 8000f86:	4b03      	ldr	r3, [pc, #12]	; (8000f94 <event_timer_clear_flag+0x10>)
 8000f88:	0040      	lsls	r0, r0, #1
 8000f8a:	2200      	movs	r2, #0
 8000f8c:	52c2      	strh	r2, [r0, r3]
 8000f8e:	b662      	cpsie	i
 8000f90:	4770      	bx	lr
 8000f92:	46c0      	nop			; (mov r8, r8)
 8000f94:	20000878 	.word	0x20000878

08000f98 <uart_write>:
 8000f98:	4b03      	ldr	r3, [pc, #12]	; (8000fa8 <uart_write+0x10>)
 8000f9a:	69da      	ldr	r2, [r3, #28]
 8000f9c:	0611      	lsls	r1, r2, #24
 8000f9e:	d401      	bmi.n	8000fa4 <uart_write+0xc>
 8000fa0:	46c0      	nop			; (mov r8, r8)
 8000fa2:	e7f9      	b.n	8000f98 <uart_write>
 8000fa4:	8518      	strh	r0, [r3, #40]	; 0x28
 8000fa6:	4770      	bx	lr
 8000fa8:	40013800 	.word	0x40013800

08000fac <USART1_IRQHandler>:
 8000fac:	b508      	push	{r3, lr}
 8000fae:	480e      	ldr	r0, [pc, #56]	; (8000fe8 <USART1_IRQHandler+0x3c>)
 8000fb0:	490e      	ldr	r1, [pc, #56]	; (8000fec <USART1_IRQHandler+0x40>)
 8000fb2:	f000 feb5 	bl	8001d20 <USART_GetITStatus>
 8000fb6:	2800      	cmp	r0, #0
 8000fb8:	d011      	beq.n	8000fde <USART1_IRQHandler+0x32>
 8000fba:	480b      	ldr	r0, [pc, #44]	; (8000fe8 <USART1_IRQHandler+0x3c>)
 8000fbc:	f000 fe7c 	bl	8001cb8 <USART_ReceiveData>
 8000fc0:	4b0b      	ldr	r3, [pc, #44]	; (8000ff0 <USART1_IRQHandler+0x44>)
 8000fc2:	490c      	ldr	r1, [pc, #48]	; (8000ff4 <USART1_IRQHandler+0x48>)
 8000fc4:	881a      	ldrh	r2, [r3, #0]
 8000fc6:	b2c0      	uxtb	r0, r0
 8000fc8:	b292      	uxth	r2, r2
 8000fca:	5488      	strb	r0, [r1, r2]
 8000fcc:	881a      	ldrh	r2, [r3, #0]
 8000fce:	3201      	adds	r2, #1
 8000fd0:	b292      	uxth	r2, r2
 8000fd2:	801a      	strh	r2, [r3, #0]
 8000fd4:	881a      	ldrh	r2, [r3, #0]
 8000fd6:	2a0f      	cmp	r2, #15
 8000fd8:	d901      	bls.n	8000fde <USART1_IRQHandler+0x32>
 8000fda:	2200      	movs	r2, #0
 8000fdc:	801a      	strh	r2, [r3, #0]
 8000fde:	4802      	ldr	r0, [pc, #8]	; (8000fe8 <USART1_IRQHandler+0x3c>)
 8000fe0:	4902      	ldr	r1, [pc, #8]	; (8000fec <USART1_IRQHandler+0x40>)
 8000fe2:	f000 ff35 	bl	8001e50 <USART_ClearITPendingBit>
 8000fe6:	bd08      	pop	{r3, pc}
 8000fe8:	40013800 	.word	0x40013800
 8000fec:	00050105 	.word	0x00050105
 8000ff0:	200008a4 	.word	0x200008a4
 8000ff4:	20000894 	.word	0x20000894

08000ff8 <uart_init>:
 8000ff8:	b530      	push	{r4, r5, lr}
 8000ffa:	4a21      	ldr	r2, [pc, #132]	; (8001080 <uart_init+0x88>)
 8000ffc:	2300      	movs	r3, #0
 8000ffe:	8013      	strh	r3, [r2, #0]
 8001000:	4a20      	ldr	r2, [pc, #128]	; (8001084 <uart_init+0x8c>)
 8001002:	b089      	sub	sp, #36	; 0x24
 8001004:	8013      	strh	r3, [r2, #0]
 8001006:	4a20      	ldr	r2, [pc, #128]	; (8001088 <uart_init+0x90>)
 8001008:	2400      	movs	r4, #0
 800100a:	54d4      	strb	r4, [r2, r3]
 800100c:	3301      	adds	r3, #1
 800100e:	2b10      	cmp	r3, #16
 8001010:	d1f9      	bne.n	8001006 <uart_init+0xe>
 8001012:	2080      	movs	r0, #128	; 0x80
 8001014:	0280      	lsls	r0, r0, #10
 8001016:	2101      	movs	r1, #1
 8001018:	f001 f994 	bl	8002344 <RCC_AHBPeriphClockCmd>
 800101c:	2080      	movs	r0, #128	; 0x80
 800101e:	01c0      	lsls	r0, r0, #7
 8001020:	2101      	movs	r1, #1
 8001022:	f001 f9af 	bl	8002384 <RCC_APB2PeriphClockCmd>
 8001026:	2090      	movs	r0, #144	; 0x90
 8001028:	05c0      	lsls	r0, r0, #23
 800102a:	2102      	movs	r1, #2
 800102c:	2201      	movs	r2, #1
 800102e:	f000 fbd9 	bl	80017e4 <GPIO_PinAFConfig>
 8001032:	2090      	movs	r0, #144	; 0x90
 8001034:	05c0      	lsls	r0, r0, #23
 8001036:	210f      	movs	r1, #15
 8001038:	2201      	movs	r2, #1
 800103a:	f000 fbd3 	bl	80017e4 <GPIO_PinAFConfig>
 800103e:	4b13      	ldr	r3, [pc, #76]	; (800108c <uart_init+0x94>)
 8001040:	2090      	movs	r0, #144	; 0x90
 8001042:	466a      	mov	r2, sp
 8001044:	2501      	movs	r5, #1
 8001046:	9300      	str	r3, [sp, #0]
 8001048:	4669      	mov	r1, sp
 800104a:	2302      	movs	r3, #2
 800104c:	05c0      	lsls	r0, r0, #23
 800104e:	7113      	strb	r3, [r2, #4]
 8001050:	7155      	strb	r5, [r2, #5]
 8001052:	7194      	strb	r4, [r2, #6]
 8001054:	71d5      	strb	r5, [r2, #7]
 8001056:	f000 fb41 	bl	80016dc <GPIO_Init>
 800105a:	23e1      	movs	r3, #225	; 0xe1
 800105c:	025b      	lsls	r3, r3, #9
 800105e:	9302      	str	r3, [sp, #8]
 8001060:	a902      	add	r1, sp, #8
 8001062:	230c      	movs	r3, #12
 8001064:	480a      	ldr	r0, [pc, #40]	; (8001090 <uart_init+0x98>)
 8001066:	9306      	str	r3, [sp, #24]
 8001068:	9403      	str	r4, [sp, #12]
 800106a:	9404      	str	r4, [sp, #16]
 800106c:	9405      	str	r4, [sp, #20]
 800106e:	9407      	str	r4, [sp, #28]
 8001070:	f000 fd14 	bl	8001a9c <USART_Init>
 8001074:	4806      	ldr	r0, [pc, #24]	; (8001090 <uart_init+0x98>)
 8001076:	1c29      	adds	r1, r5, #0
 8001078:	f000 fdde 	bl	8001c38 <USART_Cmd>
 800107c:	b009      	add	sp, #36	; 0x24
 800107e:	bd30      	pop	{r4, r5, pc}
 8001080:	200008a4 	.word	0x200008a4
 8001084:	200008a6 	.word	0x200008a6
 8001088:	20000894 	.word	0x20000894
 800108c:	00008004 	.word	0x00008004
 8001090:	40013800 	.word	0x40013800

08001094 <i2c_delay>:
 8001094:	46c0      	nop			; (mov r8, r8)
 8001096:	46c0      	nop			; (mov r8, r8)
 8001098:	4770      	bx	lr

0800109a <SetLowSDA>:
 800109a:	b508      	push	{r3, lr}
 800109c:	b672      	cpsid	i
 800109e:	2390      	movs	r3, #144	; 0x90
 80010a0:	2280      	movs	r2, #128	; 0x80
 80010a2:	05db      	lsls	r3, r3, #23
 80010a4:	0112      	lsls	r2, r2, #4
 80010a6:	851a      	strh	r2, [r3, #40]	; 0x28
 80010a8:	685a      	ldr	r2, [r3, #4]
 80010aa:	b292      	uxth	r2, r2
 80010ac:	809a      	strh	r2, [r3, #4]
 80010ae:	6819      	ldr	r1, [r3, #0]
 80010b0:	2280      	movs	r2, #128	; 0x80
 80010b2:	03d2      	lsls	r2, r2, #15
 80010b4:	430a      	orrs	r2, r1
 80010b6:	601a      	str	r2, [r3, #0]
 80010b8:	b662      	cpsie	i
 80010ba:	f7ff ffeb 	bl	8001094 <i2c_delay>
 80010be:	bd08      	pop	{r3, pc}

080010c0 <SetHighSDA>:
 80010c0:	b508      	push	{r3, lr}
 80010c2:	b672      	cpsid	i
 80010c4:	2390      	movs	r3, #144	; 0x90
 80010c6:	2280      	movs	r2, #128	; 0x80
 80010c8:	05db      	lsls	r3, r3, #23
 80010ca:	0112      	lsls	r2, r2, #4
 80010cc:	619a      	str	r2, [r3, #24]
 80010ce:	6859      	ldr	r1, [r3, #4]
 80010d0:	4a05      	ldr	r2, [pc, #20]	; (80010e8 <SetHighSDA+0x28>)
 80010d2:	400a      	ands	r2, r1
 80010d4:	809a      	strh	r2, [r3, #4]
 80010d6:	6819      	ldr	r1, [r3, #0]
 80010d8:	4a04      	ldr	r2, [pc, #16]	; (80010ec <SetHighSDA+0x2c>)
 80010da:	400a      	ands	r2, r1
 80010dc:	601a      	str	r2, [r3, #0]
 80010de:	b662      	cpsie	i
 80010e0:	f7ff ffd8 	bl	8001094 <i2c_delay>
 80010e4:	bd08      	pop	{r3, pc}
 80010e6:	46c0      	nop			; (mov r8, r8)
 80010e8:	0000f7ff 	.word	0x0000f7ff
 80010ec:	ff3fffff 	.word	0xff3fffff

080010f0 <SetLowSCL>:
 80010f0:	b508      	push	{r3, lr}
 80010f2:	2280      	movs	r2, #128	; 0x80
 80010f4:	2390      	movs	r3, #144	; 0x90
 80010f6:	0052      	lsls	r2, r2, #1
 80010f8:	05db      	lsls	r3, r3, #23
 80010fa:	851a      	strh	r2, [r3, #40]	; 0x28
 80010fc:	f7ff ffca 	bl	8001094 <i2c_delay>
 8001100:	bd08      	pop	{r3, pc}

08001102 <SetHighSCL>:
 8001102:	b508      	push	{r3, lr}
 8001104:	2280      	movs	r2, #128	; 0x80
 8001106:	2390      	movs	r3, #144	; 0x90
 8001108:	0052      	lsls	r2, r2, #1
 800110a:	05db      	lsls	r3, r3, #23
 800110c:	619a      	str	r2, [r3, #24]
 800110e:	f7ff ffc1 	bl	8001094 <i2c_delay>
 8001112:	bd08      	pop	{r3, pc}

08001114 <i2c_0_init>:
 8001114:	b507      	push	{r0, r1, r2, lr}
 8001116:	2390      	movs	r3, #144	; 0x90
 8001118:	011b      	lsls	r3, r3, #4
 800111a:	4669      	mov	r1, sp
 800111c:	9300      	str	r3, [sp, #0]
 800111e:	2090      	movs	r0, #144	; 0x90
 8001120:	2301      	movs	r3, #1
 8001122:	710b      	strb	r3, [r1, #4]
 8001124:	2203      	movs	r2, #3
 8001126:	2300      	movs	r3, #0
 8001128:	05c0      	lsls	r0, r0, #23
 800112a:	718b      	strb	r3, [r1, #6]
 800112c:	714a      	strb	r2, [r1, #5]
 800112e:	71cb      	strb	r3, [r1, #7]
 8001130:	f000 fad4 	bl	80016dc <GPIO_Init>
 8001134:	f7ff ffe5 	bl	8001102 <SetHighSCL>
 8001138:	f7ff ffaf 	bl	800109a <SetLowSDA>
 800113c:	f7ff ffc0 	bl	80010c0 <SetHighSDA>
 8001140:	bd07      	pop	{r0, r1, r2, pc}

08001142 <i2cStart>:
 8001142:	b508      	push	{r3, lr}
 8001144:	f7ff ffdd 	bl	8001102 <SetHighSCL>
 8001148:	f7ff ffba 	bl	80010c0 <SetHighSDA>
 800114c:	f7ff ffd9 	bl	8001102 <SetHighSCL>
 8001150:	f7ff ffa3 	bl	800109a <SetLowSDA>
 8001154:	f7ff ffcc 	bl	80010f0 <SetLowSCL>
 8001158:	f7ff ffb2 	bl	80010c0 <SetHighSDA>
 800115c:	bd08      	pop	{r3, pc}

0800115e <i2cStop>:
 800115e:	b508      	push	{r3, lr}
 8001160:	f7ff ffc6 	bl	80010f0 <SetLowSCL>
 8001164:	f7ff ff99 	bl	800109a <SetLowSDA>
 8001168:	f7ff ffcb 	bl	8001102 <SetHighSCL>
 800116c:	f7ff ff95 	bl	800109a <SetLowSDA>
 8001170:	f7ff ffc7 	bl	8001102 <SetHighSCL>
 8001174:	f7ff ffa4 	bl	80010c0 <SetHighSDA>
 8001178:	bd08      	pop	{r3, pc}

0800117a <i2cWrite>:
 800117a:	b538      	push	{r3, r4, r5, lr}
 800117c:	1c05      	adds	r5, r0, #0
 800117e:	2408      	movs	r4, #8
 8001180:	f7ff ffb6 	bl	80010f0 <SetLowSCL>
 8001184:	b26b      	sxtb	r3, r5
 8001186:	2b00      	cmp	r3, #0
 8001188:	da02      	bge.n	8001190 <i2cWrite+0x16>
 800118a:	f7ff ff99 	bl	80010c0 <SetHighSDA>
 800118e:	e001      	b.n	8001194 <i2cWrite+0x1a>
 8001190:	f7ff ff83 	bl	800109a <SetLowSDA>
 8001194:	3c01      	subs	r4, #1
 8001196:	006d      	lsls	r5, r5, #1
 8001198:	b2e4      	uxtb	r4, r4
 800119a:	f7ff ffb2 	bl	8001102 <SetHighSCL>
 800119e:	b2ed      	uxtb	r5, r5
 80011a0:	2c00      	cmp	r4, #0
 80011a2:	d1ed      	bne.n	8001180 <i2cWrite+0x6>
 80011a4:	f7ff ffa4 	bl	80010f0 <SetLowSCL>
 80011a8:	f7ff ff8a 	bl	80010c0 <SetHighSDA>
 80011ac:	f7ff ffa9 	bl	8001102 <SetHighSCL>
 80011b0:	2390      	movs	r3, #144	; 0x90
 80011b2:	05db      	lsls	r3, r3, #23
 80011b4:	691c      	ldr	r4, [r3, #16]
 80011b6:	f7ff ff9b 	bl	80010f0 <SetLowSCL>
 80011ba:	b2a4      	uxth	r4, r4
 80011bc:	f7ff ff6a 	bl	8001094 <i2c_delay>
 80011c0:	0ae4      	lsrs	r4, r4, #11
 80011c2:	2001      	movs	r0, #1
 80011c4:	43a0      	bics	r0, r4
 80011c6:	bd38      	pop	{r3, r4, r5, pc}

080011c8 <i2cRead>:
 80011c8:	b570      	push	{r4, r5, r6, lr}
 80011ca:	1c06      	adds	r6, r0, #0
 80011cc:	f7ff ff90 	bl	80010f0 <SetLowSCL>
 80011d0:	f7ff ff76 	bl	80010c0 <SetHighSDA>
 80011d4:	2508      	movs	r5, #8
 80011d6:	2400      	movs	r4, #0
 80011d8:	f7ff ff93 	bl	8001102 <SetHighSCL>
 80011dc:	2390      	movs	r3, #144	; 0x90
 80011de:	05db      	lsls	r3, r3, #23
 80011e0:	691b      	ldr	r3, [r3, #16]
 80011e2:	0064      	lsls	r4, r4, #1
 80011e4:	b2e4      	uxtb	r4, r4
 80011e6:	051a      	lsls	r2, r3, #20
 80011e8:	d501      	bpl.n	80011ee <i2cRead+0x26>
 80011ea:	3401      	adds	r4, #1
 80011ec:	b2e4      	uxtb	r4, r4
 80011ee:	3d01      	subs	r5, #1
 80011f0:	b2ed      	uxtb	r5, r5
 80011f2:	f7ff ff7d 	bl	80010f0 <SetLowSCL>
 80011f6:	2d00      	cmp	r5, #0
 80011f8:	d1ee      	bne.n	80011d8 <i2cRead+0x10>
 80011fa:	2e00      	cmp	r6, #0
 80011fc:	d001      	beq.n	8001202 <i2cRead+0x3a>
 80011fe:	f7ff ff4c 	bl	800109a <SetLowSDA>
 8001202:	f7ff ff7e 	bl	8001102 <SetHighSCL>
 8001206:	f7ff ff73 	bl	80010f0 <SetLowSCL>
 800120a:	f7ff ff43 	bl	8001094 <i2c_delay>
 800120e:	1c20      	adds	r0, r4, #0
 8001210:	bd70      	pop	{r4, r5, r6, pc}

08001212 <i2c_write_reg>:
 8001212:	b570      	push	{r4, r5, r6, lr}
 8001214:	1c06      	adds	r6, r0, #0
 8001216:	1c0d      	adds	r5, r1, #0
 8001218:	1c14      	adds	r4, r2, #0
 800121a:	f7ff ff92 	bl	8001142 <i2cStart>
 800121e:	1c30      	adds	r0, r6, #0
 8001220:	f7ff ffab 	bl	800117a <i2cWrite>
 8001224:	1c28      	adds	r0, r5, #0
 8001226:	f7ff ffa8 	bl	800117a <i2cWrite>
 800122a:	1c20      	adds	r0, r4, #0
 800122c:	f7ff ffa5 	bl	800117a <i2cWrite>
 8001230:	f7ff ff95 	bl	800115e <i2cStop>
 8001234:	bd70      	pop	{r4, r5, r6, pc}

08001236 <i2c_read_reg>:
 8001236:	b538      	push	{r3, r4, r5, lr}
 8001238:	1c04      	adds	r4, r0, #0
 800123a:	1c0d      	adds	r5, r1, #0
 800123c:	f7ff ff81 	bl	8001142 <i2cStart>
 8001240:	1c20      	adds	r0, r4, #0
 8001242:	f7ff ff9a 	bl	800117a <i2cWrite>
 8001246:	1c28      	adds	r0, r5, #0
 8001248:	f7ff ff97 	bl	800117a <i2cWrite>
 800124c:	f7ff ff79 	bl	8001142 <i2cStart>
 8001250:	2001      	movs	r0, #1
 8001252:	4320      	orrs	r0, r4
 8001254:	f7ff ff91 	bl	800117a <i2cWrite>
 8001258:	2000      	movs	r0, #0
 800125a:	f7ff ffb5 	bl	80011c8 <i2cRead>
 800125e:	1c04      	adds	r4, r0, #0
 8001260:	f7ff ff7d 	bl	800115e <i2cStop>
 8001264:	1c20      	adds	r0, r4, #0
 8001266:	bd38      	pop	{r3, r4, r5, pc}

08001268 <ws2812_clear>:
 8001268:	2300      	movs	r3, #0
 800126a:	4905      	ldr	r1, [pc, #20]	; (8001280 <ws2812_clear+0x18>)
 800126c:	2200      	movs	r2, #0
 800126e:	545a      	strb	r2, [r3, r1]
 8001270:	18c9      	adds	r1, r1, r3
 8001272:	3303      	adds	r3, #3
 8001274:	704a      	strb	r2, [r1, #1]
 8001276:	708a      	strb	r2, [r1, #2]
 8001278:	2bc0      	cmp	r3, #192	; 0xc0
 800127a:	d1f6      	bne.n	800126a <ws2812_clear+0x2>
 800127c:	4770      	bx	lr
 800127e:	46c0      	nop			; (mov r8, r8)
 8001280:	20000010 	.word	0x20000010

08001284 <ws2812_refresh>:
 8001284:	b5f0      	push	{r4, r5, r6, r7, lr}
 8001286:	b085      	sub	sp, #20
 8001288:	b672      	cpsid	i
 800128a:	2400      	movs	r4, #0
 800128c:	4a15      	ldr	r2, [pc, #84]	; (80012e4 <ws2812_refresh+0x60>)
 800128e:	ae03      	add	r6, sp, #12
 8001290:	1913      	adds	r3, r2, r4
 8001292:	7859      	ldrb	r1, [r3, #1]
 8001294:	5ca2      	ldrb	r2, [r4, r2]
 8001296:	789b      	ldrb	r3, [r3, #2]
 8001298:	7031      	strb	r1, [r6, #0]
 800129a:	7072      	strb	r2, [r6, #1]
 800129c:	70b3      	strb	r3, [r6, #2]
 800129e:	2500      	movs	r5, #0
 80012a0:	2308      	movs	r3, #8
 80012a2:	5d77      	ldrb	r7, [r6, r5]
 80012a4:	9301      	str	r3, [sp, #4]
 80012a6:	b27b      	sxtb	r3, r7
 80012a8:	480f      	ldr	r0, [pc, #60]	; (80012e8 <ws2812_refresh+0x64>)
 80012aa:	21f0      	movs	r1, #240	; 0xf0
 80012ac:	2b00      	cmp	r3, #0
 80012ae:	db00      	blt.n	80012b2 <ws2812_refresh+0x2e>
 80012b0:	21c0      	movs	r1, #192	; 0xc0
 80012b2:	f000 ff35 	bl	8002120 <SPI_SendData8>
 80012b6:	9b01      	ldr	r3, [sp, #4]
 80012b8:	007f      	lsls	r7, r7, #1
 80012ba:	3b01      	subs	r3, #1
 80012bc:	b2ff      	uxtb	r7, r7
 80012be:	9301      	str	r3, [sp, #4]
 80012c0:	2b00      	cmp	r3, #0
 80012c2:	d1f0      	bne.n	80012a6 <ws2812_refresh+0x22>
 80012c4:	3501      	adds	r5, #1
 80012c6:	2d03      	cmp	r5, #3
 80012c8:	d1ea      	bne.n	80012a0 <ws2812_refresh+0x1c>
 80012ca:	3403      	adds	r4, #3
 80012cc:	2cc0      	cmp	r4, #192	; 0xc0
 80012ce:	d1dd      	bne.n	800128c <ws2812_refresh+0x8>
 80012d0:	b662      	cpsie	i
 80012d2:	4b06      	ldr	r3, [pc, #24]	; (80012ec <ws2812_refresh+0x68>)
 80012d4:	3b01      	subs	r3, #1
 80012d6:	2b00      	cmp	r3, #0
 80012d8:	d001      	beq.n	80012de <ws2812_refresh+0x5a>
 80012da:	46c0      	nop			; (mov r8, r8)
 80012dc:	e7fa      	b.n	80012d4 <ws2812_refresh+0x50>
 80012de:	b005      	add	sp, #20
 80012e0:	bdf0      	pop	{r4, r5, r6, r7, pc}
 80012e2:	46c0      	nop			; (mov r8, r8)
 80012e4:	20000010 	.word	0x20000010
 80012e8:	40013000 	.word	0x40013000
 80012ec:	00000961 	.word	0x00000961

080012f0 <ws2812_init>:
 80012f0:	b5f0      	push	{r4, r5, r6, r7, lr}
 80012f2:	2680      	movs	r6, #128	; 0x80
 80012f4:	0176      	lsls	r6, r6, #5
 80012f6:	b089      	sub	sp, #36	; 0x24
 80012f8:	1c30      	adds	r0, r6, #0
 80012fa:	2101      	movs	r1, #1
 80012fc:	f001 f842 	bl	8002384 <RCC_APB2PeriphClockCmd>
 8001300:	4f1c      	ldr	r7, [pc, #112]	; (8001374 <ws2812_init+0x84>)
 8001302:	2320      	movs	r3, #32
 8001304:	a901      	add	r1, sp, #4
 8001306:	9301      	str	r3, [sp, #4]
 8001308:	2302      	movs	r3, #2
 800130a:	2400      	movs	r4, #0
 800130c:	2501      	movs	r5, #1
 800130e:	710b      	strb	r3, [r1, #4]
 8001310:	1c38      	adds	r0, r7, #0
 8001312:	2303      	movs	r3, #3
 8001314:	714b      	strb	r3, [r1, #5]
 8001316:	718c      	strb	r4, [r1, #6]
 8001318:	71cd      	strb	r5, [r1, #7]
 800131a:	f000 f9df 	bl	80016dc <GPIO_Init>
 800131e:	1c22      	adds	r2, r4, #0
 8001320:	1c38      	adds	r0, r7, #0
 8001322:	2105      	movs	r1, #5
 8001324:	f000 fa5e 	bl	80017e4 <GPIO_PinAFConfig>
 8001328:	2382      	movs	r3, #130	; 0x82
 800132a:	a903      	add	r1, sp, #12
 800132c:	40ab      	lsls	r3, r5
 800132e:	804b      	strh	r3, [r1, #2]
 8001330:	23e0      	movs	r3, #224	; 0xe0
 8001332:	00db      	lsls	r3, r3, #3
 8001334:	808b      	strh	r3, [r1, #4]
 8001336:	2302      	movs	r3, #2
 8001338:	80cb      	strh	r3, [r1, #6]
 800133a:	2380      	movs	r3, #128	; 0x80
 800133c:	800c      	strh	r4, [r1, #0]
 800133e:	81cc      	strh	r4, [r1, #14]
 8001340:	009b      	lsls	r3, r3, #2
 8001342:	4c0d      	ldr	r4, [pc, #52]	; (8001378 <ws2812_init+0x88>)
 8001344:	814b      	strh	r3, [r1, #10]
 8001346:	2310      	movs	r3, #16
 8001348:	818b      	strh	r3, [r1, #12]
 800134a:	1c20      	adds	r0, r4, #0
 800134c:	2307      	movs	r3, #7
 800134e:	820b      	strh	r3, [r1, #16]
 8001350:	810d      	strh	r5, [r1, #8]
 8001352:	f000 fdf1 	bl	8001f38 <SPI_Init>
 8001356:	1c20      	adds	r0, r4, #0
 8001358:	1c31      	adds	r1, r6, #0
 800135a:	f000 febf 	bl	80020dc <SPI_RxFIFOThresholdConfig>
 800135e:	1c20      	adds	r0, r4, #0
 8001360:	1c29      	adds	r1, r5, #0
 8001362:	f000 fe99 	bl	8002098 <SPI_Cmd>
 8001366:	f7ff ff7f 	bl	8001268 <ws2812_clear>
 800136a:	f7ff ff8b 	bl	8001284 <ws2812_refresh>
 800136e:	b009      	add	sp, #36	; 0x24
 8001370:	bdf0      	pop	{r4, r5, r6, r7, pc}
 8001372:	46c0      	nop			; (mov r8, r8)
 8001374:	48000400 	.word	0x48000400
 8001378:	40013000 	.word	0x40013000

0800137c <ws2812_demo>:
 800137c:	b5f0      	push	{r4, r5, r6, r7, lr}
 800137e:	b085      	sub	sp, #20
 8001380:	4668      	mov	r0, sp
 8001382:	2300      	movs	r3, #0
 8001384:	2210      	movs	r2, #16
 8001386:	2101      	movs	r1, #1
 8001388:	466c      	mov	r4, sp
 800138a:	7002      	strb	r2, [r0, #0]
 800138c:	7043      	strb	r3, [r0, #1]
 800138e:	7083      	strb	r3, [r0, #2]
 8001390:	70c3      	strb	r3, [r0, #3]
 8001392:	7101      	strb	r1, [r0, #4]
 8001394:	7143      	strb	r3, [r0, #5]
 8001396:	7182      	strb	r2, [r0, #6]
 8001398:	71c3      	strb	r3, [r0, #7]
 800139a:	7203      	strb	r3, [r0, #8]
 800139c:	203f      	movs	r0, #63	; 0x3f
 800139e:	7260      	strb	r0, [r4, #9]
 80013a0:	72a3      	strb	r3, [r4, #10]
 80013a2:	72e3      	strb	r3, [r4, #11]
 80013a4:	7322      	strb	r2, [r4, #12]
 80013a6:	7363      	strb	r3, [r4, #13]
 80013a8:	73a1      	strb	r1, [r4, #14]
 80013aa:	f7ff ff5d 	bl	8001268 <ws2812_clear>
 80013ae:	2400      	movs	r4, #0
 80013b0:	a800      	add	r0, sp, #0
 80013b2:	1903      	adds	r3, r0, r4
 80013b4:	78da      	ldrb	r2, [r3, #3]
 80013b6:	7919      	ldrb	r1, [r3, #4]
 80013b8:	253f      	movs	r5, #63	; 0x3f
 80013ba:	1889      	adds	r1, r1, r2
 80013bc:	4029      	ands	r1, r5
 80013be:	2603      	movs	r6, #3
 80013c0:	70d9      	strb	r1, [r3, #3]
 80013c2:	7858      	ldrb	r0, [r3, #1]
 80013c4:	789f      	ldrb	r7, [r3, #2]
 80013c6:	1c33      	adds	r3, r6, #0
 80013c8:	434b      	muls	r3, r1
 80013ca:	4669      	mov	r1, sp
 80013cc:	4a12      	ldr	r2, [pc, #72]	; (8001418 <ws2812_demo+0x9c>)
 80013ce:	5d09      	ldrb	r1, [r1, r4]
 80013d0:	3405      	adds	r4, #5
 80013d2:	5499      	strb	r1, [r3, r2]
 80013d4:	18d3      	adds	r3, r2, r3
 80013d6:	7058      	strb	r0, [r3, #1]
 80013d8:	709f      	strb	r7, [r3, #2]
 80013da:	f7ff ff53 	bl	8001284 <ws2812_refresh>
 80013de:	2c0f      	cmp	r4, #15
 80013e0:	d1e6      	bne.n	80013b0 <ws2812_demo+0x34>
 80013e2:	480e      	ldr	r0, [pc, #56]	; (800141c <ws2812_demo+0xa0>)
 80013e4:	f7ff fd8c 	bl	8000f00 <timer_delay_loops>
 80013e8:	f7ff fd90 	bl	8000f0c <timer_get_time>
 80013ec:	2164      	movs	r1, #100	; 0x64
 80013ee:	1c04      	adds	r4, r0, #0
 80013f0:	f001 f8f8 	bl	80025e4 <__aeabi_uidivmod>
 80013f4:	2900      	cmp	r1, #0
 80013f6:	d1d8      	bne.n	80013aa <ws2812_demo+0x2e>
 80013f8:	1c20      	adds	r0, r4, #0
 80013fa:	1c31      	adds	r1, r6, #0
 80013fc:	f001 f8f2 	bl	80025e4 <__aeabi_uidivmod>
 8001400:	2305      	movs	r3, #5
 8001402:	4359      	muls	r1, r3
 8001404:	aa00      	add	r2, sp, #0
 8001406:	1851      	adds	r1, r2, r1
 8001408:	790b      	ldrb	r3, [r1, #4]
 800140a:	2b01      	cmp	r3, #1
 800140c:	d101      	bne.n	8001412 <ws2812_demo+0x96>
 800140e:	710d      	strb	r5, [r1, #4]
 8001410:	e7cb      	b.n	80013aa <ws2812_demo+0x2e>
 8001412:	2301      	movs	r3, #1
 8001414:	710b      	strb	r3, [r1, #4]
 8001416:	e7c8      	b.n	80013aa <ws2812_demo+0x2e>
 8001418:	20000010 	.word	0x20000010
 800141c:	00030d40 	.word	0x00030d40

08001420 <assert_param>:
 8001420:	4770      	bx	lr
	...

08001424 <sys_tick_init>:
 8001424:	4b03      	ldr	r3, [pc, #12]	; (8001434 <sys_tick_init+0x10>)
 8001426:	4a04      	ldr	r2, [pc, #16]	; (8001438 <sys_tick_init+0x14>)
 8001428:	605a      	str	r2, [r3, #4]
 800142a:	2200      	movs	r2, #0
 800142c:	609a      	str	r2, [r3, #8]
 800142e:	2207      	movs	r2, #7
 8001430:	601a      	str	r2, [r3, #0]
 8001432:	4770      	bx	lr
 8001434:	e000e010 	.word	0xe000e010
 8001438:	0000bb80 	.word	0x0000bb80

0800143c <sleep>:
 800143c:	bf30      	wfi
 800143e:	4770      	bx	lr

08001440 <SystemInit>:
 8001440:	4b26      	ldr	r3, [pc, #152]	; (80014dc <SystemInit+0x9c>)
 8001442:	2201      	movs	r2, #1
 8001444:	6819      	ldr	r1, [r3, #0]
 8001446:	b082      	sub	sp, #8
 8001448:	4311      	orrs	r1, r2
 800144a:	6019      	str	r1, [r3, #0]
 800144c:	6858      	ldr	r0, [r3, #4]
 800144e:	4924      	ldr	r1, [pc, #144]	; (80014e0 <SystemInit+0xa0>)
 8001450:	4001      	ands	r1, r0
 8001452:	6059      	str	r1, [r3, #4]
 8001454:	6818      	ldr	r0, [r3, #0]
 8001456:	4923      	ldr	r1, [pc, #140]	; (80014e4 <SystemInit+0xa4>)
 8001458:	4001      	ands	r1, r0
 800145a:	6019      	str	r1, [r3, #0]
 800145c:	6818      	ldr	r0, [r3, #0]
 800145e:	4922      	ldr	r1, [pc, #136]	; (80014e8 <SystemInit+0xa8>)
 8001460:	4001      	ands	r1, r0
 8001462:	6019      	str	r1, [r3, #0]
 8001464:	6858      	ldr	r0, [r3, #4]
 8001466:	4921      	ldr	r1, [pc, #132]	; (80014ec <SystemInit+0xac>)
 8001468:	4001      	ands	r1, r0
 800146a:	6059      	str	r1, [r3, #4]
 800146c:	6ad9      	ldr	r1, [r3, #44]	; 0x2c
 800146e:	200f      	movs	r0, #15
 8001470:	4381      	bics	r1, r0
 8001472:	62d9      	str	r1, [r3, #44]	; 0x2c
 8001474:	6b18      	ldr	r0, [r3, #48]	; 0x30
 8001476:	491e      	ldr	r1, [pc, #120]	; (80014f0 <SystemInit+0xb0>)
 8001478:	4001      	ands	r1, r0
 800147a:	6319      	str	r1, [r3, #48]	; 0x30
 800147c:	6b59      	ldr	r1, [r3, #52]	; 0x34
 800147e:	4391      	bics	r1, r2
 8001480:	2200      	movs	r2, #0
 8001482:	6359      	str	r1, [r3, #52]	; 0x34
 8001484:	609a      	str	r2, [r3, #8]
 8001486:	9200      	str	r2, [sp, #0]
 8001488:	9201      	str	r2, [sp, #4]
 800148a:	4a1a      	ldr	r2, [pc, #104]	; (80014f4 <SystemInit+0xb4>)
 800148c:	2111      	movs	r1, #17
 800148e:	6011      	str	r1, [r2, #0]
 8001490:	685a      	ldr	r2, [r3, #4]
 8001492:	605a      	str	r2, [r3, #4]
 8001494:	685a      	ldr	r2, [r3, #4]
 8001496:	605a      	str	r2, [r3, #4]
 8001498:	6859      	ldr	r1, [r3, #4]
 800149a:	4a17      	ldr	r2, [pc, #92]	; (80014f8 <SystemInit+0xb8>)
 800149c:	400a      	ands	r2, r1
 800149e:	605a      	str	r2, [r3, #4]
 80014a0:	6859      	ldr	r1, [r3, #4]
 80014a2:	22a0      	movs	r2, #160	; 0xa0
 80014a4:	0392      	lsls	r2, r2, #14
 80014a6:	430a      	orrs	r2, r1
 80014a8:	605a      	str	r2, [r3, #4]
 80014aa:	6819      	ldr	r1, [r3, #0]
 80014ac:	2280      	movs	r2, #128	; 0x80
 80014ae:	0452      	lsls	r2, r2, #17
 80014b0:	430a      	orrs	r2, r1
 80014b2:	601a      	str	r2, [r3, #0]
 80014b4:	6819      	ldr	r1, [r3, #0]
 80014b6:	4a09      	ldr	r2, [pc, #36]	; (80014dc <SystemInit+0x9c>)
 80014b8:	0188      	lsls	r0, r1, #6
 80014ba:	d5fb      	bpl.n	80014b4 <SystemInit+0x74>
 80014bc:	6851      	ldr	r1, [r2, #4]
 80014be:	2003      	movs	r0, #3
 80014c0:	4381      	bics	r1, r0
 80014c2:	6051      	str	r1, [r2, #4]
 80014c4:	6851      	ldr	r1, [r2, #4]
 80014c6:	2002      	movs	r0, #2
 80014c8:	4301      	orrs	r1, r0
 80014ca:	6051      	str	r1, [r2, #4]
 80014cc:	6859      	ldr	r1, [r3, #4]
 80014ce:	220c      	movs	r2, #12
 80014d0:	400a      	ands	r2, r1
 80014d2:	2a08      	cmp	r2, #8
 80014d4:	d1fa      	bne.n	80014cc <SystemInit+0x8c>
 80014d6:	b002      	add	sp, #8
 80014d8:	4770      	bx	lr
 80014da:	46c0      	nop			; (mov r8, r8)
 80014dc:	40021000 	.word	0x40021000
 80014e0:	f8ffb80c 	.word	0xf8ffb80c
 80014e4:	fef6ffff 	.word	0xfef6ffff
 80014e8:	fffbffff 	.word	0xfffbffff
 80014ec:	ffc0ffff 	.word	0xffc0ffff
 80014f0:	fffffeac 	.word	0xfffffeac
 80014f4:	40022000 	.word	0x40022000
 80014f8:	ffc07fff 	.word	0xffc07fff

080014fc <lib_low_level_init>:
 80014fc:	b508      	push	{r3, lr}
 80014fe:	f7ff ff9f 	bl	8001440 <SystemInit>
 8001502:	f000 ff7f 	bl	8002404 <gpio_init>
 8001506:	f7ff fd77 	bl	8000ff8 <uart_init>
 800150a:	f7ff fc91 	bl	8000e30 <timer_init>
 800150e:	f7ff fe01 	bl	8001114 <i2c_0_init>
 8001512:	bd08      	pop	{r3, pc}

08001514 <TIM14_IRQHandler>:
 8001514:	b570      	push	{r4, r5, r6, lr}
 8001516:	4b60      	ldr	r3, [pc, #384]	; (8001698 <TIM14_IRQHandler+0x184>)
 8001518:	7818      	ldrb	r0, [r3, #0]
 800151a:	b2c0      	uxtb	r0, r0
 800151c:	2803      	cmp	r0, #3
 800151e:	d83f      	bhi.n	80015a0 <TIM14_IRQHandler+0x8c>
 8001520:	f001 f812 	bl	8002548 <__gnu_thumb1_case_uqi>
 8001524:	32220a02 	.word	0x32220a02
 8001528:	2280      	movs	r2, #128	; 0x80
 800152a:	2390      	movs	r3, #144	; 0x90
 800152c:	0052      	lsls	r2, r2, #1
 800152e:	05db      	lsls	r3, r3, #23
 8001530:	851a      	strh	r2, [r3, #40]	; 0x28
 8001532:	2200      	movs	r2, #0
 8001534:	4b59      	ldr	r3, [pc, #356]	; (800169c <TIM14_IRQHandler+0x188>)
 8001536:	e032      	b.n	800159e <TIM14_IRQHandler+0x8a>
 8001538:	4a58      	ldr	r2, [pc, #352]	; (800169c <TIM14_IRQHandler+0x188>)
 800153a:	7811      	ldrb	r1, [r2, #0]
 800153c:	290d      	cmp	r1, #13
 800153e:	d901      	bls.n	8001544 <TIM14_IRQHandler+0x30>
 8001540:	2200      	movs	r2, #0
 8001542:	e02c      	b.n	800159e <TIM14_IRQHandler+0x8a>
 8001544:	7811      	ldrb	r1, [r2, #0]
 8001546:	4856      	ldr	r0, [pc, #344]	; (80016a0 <TIM14_IRQHandler+0x18c>)
 8001548:	5c41      	ldrb	r1, [r0, r1]
 800154a:	20ff      	movs	r0, #255	; 0xff
 800154c:	4388      	bics	r0, r1
 800154e:	0040      	lsls	r0, r0, #1
 8001550:	2101      	movs	r1, #1
 8001552:	4308      	orrs	r0, r1
 8001554:	4953      	ldr	r1, [pc, #332]	; (80016a4 <TIM14_IRQHandler+0x190>)
 8001556:	8008      	strh	r0, [r1, #0]
 8001558:	7811      	ldrb	r1, [r2, #0]
 800155a:	3101      	adds	r1, #1
 800155c:	b2c9      	uxtb	r1, r1
 800155e:	7011      	strb	r1, [r2, #0]
 8001560:	4a51      	ldr	r2, [pc, #324]	; (80016a8 <TIM14_IRQHandler+0x194>)
 8001562:	2100      	movs	r1, #0
 8001564:	7011      	strb	r1, [r2, #0]
 8001566:	e019      	b.n	800159c <TIM14_IRQHandler+0x88>
 8001568:	4a4e      	ldr	r2, [pc, #312]	; (80016a4 <TIM14_IRQHandler+0x190>)
 800156a:	2190      	movs	r1, #144	; 0x90
 800156c:	8814      	ldrh	r4, [r2, #0]
 800156e:	2080      	movs	r0, #128	; 0x80
 8001570:	05c9      	lsls	r1, r1, #23
 8001572:	0040      	lsls	r0, r0, #1
 8001574:	07e5      	lsls	r5, r4, #31
 8001576:	d501      	bpl.n	800157c <TIM14_IRQHandler+0x68>
 8001578:	6188      	str	r0, [r1, #24]
 800157a:	e000      	b.n	800157e <TIM14_IRQHandler+0x6a>
 800157c:	8508      	strh	r0, [r1, #40]	; 0x28
 800157e:	8811      	ldrh	r1, [r2, #0]
 8001580:	0849      	lsrs	r1, r1, #1
 8001582:	8011      	strh	r1, [r2, #0]
 8001584:	2203      	movs	r2, #3
 8001586:	e00a      	b.n	800159e <TIM14_IRQHandler+0x8a>
 8001588:	4a47      	ldr	r2, [pc, #284]	; (80016a8 <TIM14_IRQHandler+0x194>)
 800158a:	7811      	ldrb	r1, [r2, #0]
 800158c:	3101      	adds	r1, #1
 800158e:	b2c9      	uxtb	r1, r1
 8001590:	7011      	strb	r1, [r2, #0]
 8001592:	7812      	ldrb	r2, [r2, #0]
 8001594:	2a09      	cmp	r2, #9
 8001596:	d901      	bls.n	800159c <TIM14_IRQHandler+0x88>
 8001598:	2201      	movs	r2, #1
 800159a:	e000      	b.n	800159e <TIM14_IRQHandler+0x8a>
 800159c:	2202      	movs	r2, #2
 800159e:	701a      	strb	r2, [r3, #0]
 80015a0:	4b42      	ldr	r3, [pc, #264]	; (80016ac <TIM14_IRQHandler+0x198>)
 80015a2:	2104      	movs	r1, #4
 80015a4:	6c1a      	ldr	r2, [r3, #64]	; 0x40
 80015a6:	6019      	str	r1, [r3, #0]
 80015a8:	6898      	ldr	r0, [r3, #8]
 80015aa:	4301      	orrs	r1, r0
 80015ac:	6099      	str	r1, [r3, #8]
 80015ae:	4b40      	ldr	r3, [pc, #256]	; (80016b0 <TIM14_IRQHandler+0x19c>)
 80015b0:	2101      	movs	r1, #1
 80015b2:	429a      	cmp	r2, r3
 80015b4:	d80b      	bhi.n	80015ce <TIM14_IRQHandler+0xba>
 80015b6:	4b3f      	ldr	r3, [pc, #252]	; (80016b4 <TIM14_IRQHandler+0x1a0>)
 80015b8:	2480      	movs	r4, #128	; 0x80
 80015ba:	6818      	ldr	r0, [r3, #0]
 80015bc:	0164      	lsls	r4, r4, #5
 80015be:	1901      	adds	r1, r0, r4
 80015c0:	1a8a      	subs	r2, r1, r2
 80015c2:	601a      	str	r2, [r3, #0]
 80015c4:	4b3c      	ldr	r3, [pc, #240]	; (80016b8 <TIM14_IRQHandler+0x1a4>)
 80015c6:	2100      	movs	r1, #0
 80015c8:	681a      	ldr	r2, [r3, #0]
 80015ca:	3201      	adds	r2, #1
 80015cc:	601a      	str	r2, [r3, #0]
 80015ce:	4b3b      	ldr	r3, [pc, #236]	; (80016bc <TIM14_IRQHandler+0x1a8>)
 80015d0:	7818      	ldrb	r0, [r3, #0]
 80015d2:	b2c0      	uxtb	r0, r0
 80015d4:	2804      	cmp	r0, #4
 80015d6:	d85a      	bhi.n	800168e <TIM14_IRQHandler+0x17a>
 80015d8:	f000 ffb6 	bl	8002548 <__gnu_thumb1_case_uqi>
 80015dc:	36110603 	.word	0x36110603
 80015e0:	38          	.byte	0x38
 80015e1:	00          	.byte	0x00
 80015e2:	2200      	movs	r2, #0
 80015e4:	4b36      	ldr	r3, [pc, #216]	; (80016c0 <TIM14_IRQHandler+0x1ac>)
 80015e6:	e051      	b.n	800168c <TIM14_IRQHandler+0x178>
 80015e8:	4a35      	ldr	r2, [pc, #212]	; (80016c0 <TIM14_IRQHandler+0x1ac>)
 80015ea:	7811      	ldrb	r1, [r2, #0]
 80015ec:	2200      	movs	r2, #0
 80015ee:	290d      	cmp	r1, #13
 80015f0:	d84c      	bhi.n	800168c <TIM14_IRQHandler+0x178>
 80015f2:	4934      	ldr	r1, [pc, #208]	; (80016c4 <TIM14_IRQHandler+0x1b0>)
 80015f4:	800a      	strh	r2, [r1, #0]
 80015f6:	4934      	ldr	r1, [pc, #208]	; (80016c8 <TIM14_IRQHandler+0x1b4>)
 80015f8:	700a      	strb	r2, [r1, #0]
 80015fa:	2202      	movs	r2, #2
 80015fc:	e046      	b.n	800168c <TIM14_IRQHandler+0x178>
 80015fe:	4a33      	ldr	r2, [pc, #204]	; (80016cc <TIM14_IRQHandler+0x1b8>)
 8001600:	2900      	cmp	r1, #0
 8001602:	d103      	bne.n	800160c <TIM14_IRQHandler+0xf8>
 8001604:	2003      	movs	r0, #3
 8001606:	7018      	strb	r0, [r3, #0]
 8001608:	6011      	str	r1, [r2, #0]
 800160a:	e040      	b.n	800168e <TIM14_IRQHandler+0x17a>
 800160c:	6811      	ldr	r1, [r2, #0]
 800160e:	3101      	adds	r1, #1
 8001610:	6011      	str	r1, [r2, #0]
 8001612:	6810      	ldr	r0, [r2, #0]
 8001614:	21d2      	movs	r1, #210	; 0xd2
 8001616:	0049      	lsls	r1, r1, #1
 8001618:	4288      	cmp	r0, r1
 800161a:	d938      	bls.n	800168e <TIM14_IRQHandler+0x17a>
 800161c:	2100      	movs	r1, #0
 800161e:	6011      	str	r1, [r2, #0]
 8001620:	4e25      	ldr	r6, [pc, #148]	; (80016b8 <TIM14_IRQHandler+0x1a4>)
 8001622:	4a27      	ldr	r2, [pc, #156]	; (80016c0 <TIM14_IRQHandler+0x1ac>)
 8001624:	4c23      	ldr	r4, [pc, #140]	; (80016b4 <TIM14_IRQHandler+0x1a0>)
 8001626:	7011      	strb	r1, [r2, #0]
 8001628:	6831      	ldr	r1, [r6, #0]
 800162a:	2201      	movs	r2, #1
 800162c:	701a      	strb	r2, [r3, #0]
 800162e:	4d28      	ldr	r5, [pc, #160]	; (80016d0 <TIM14_IRQHandler+0x1bc>)
 8001630:	2900      	cmp	r1, #0
 8001632:	d004      	beq.n	800163e <TIM14_IRQHandler+0x12a>
 8001634:	6820      	ldr	r0, [r4, #0]
 8001636:	f000 ff91 	bl	800255c <__aeabi_uidiv>
 800163a:	6028      	str	r0, [r5, #0]
 800163c:	e000      	b.n	8001640 <TIM14_IRQHandler+0x12c>
 800163e:	6029      	str	r1, [r5, #0]
 8001640:	2300      	movs	r3, #0
 8001642:	6023      	str	r3, [r4, #0]
 8001644:	6033      	str	r3, [r6, #0]
 8001646:	e022      	b.n	800168e <TIM14_IRQHandler+0x17a>
 8001648:	2204      	movs	r2, #4
 800164a:	e01f      	b.n	800168c <TIM14_IRQHandler+0x178>
 800164c:	4a1e      	ldr	r2, [pc, #120]	; (80016c8 <TIM14_IRQHandler+0x1b4>)
 800164e:	2900      	cmp	r1, #0
 8001650:	d008      	beq.n	8001664 <TIM14_IRQHandler+0x150>
 8001652:	491c      	ldr	r1, [pc, #112]	; (80016c4 <TIM14_IRQHandler+0x1b0>)
 8001654:	2501      	movs	r5, #1
 8001656:	880c      	ldrh	r4, [r1, #0]
 8001658:	7810      	ldrb	r0, [r2, #0]
 800165a:	4085      	lsls	r5, r0
 800165c:	1c28      	adds	r0, r5, #0
 800165e:	4320      	orrs	r0, r4
 8001660:	b280      	uxth	r0, r0
 8001662:	8008      	strh	r0, [r1, #0]
 8001664:	7811      	ldrb	r1, [r2, #0]
 8001666:	3101      	adds	r1, #1
 8001668:	b2c9      	uxtb	r1, r1
 800166a:	7011      	strb	r1, [r2, #0]
 800166c:	7812      	ldrb	r2, [r2, #0]
 800166e:	2a07      	cmp	r2, #7
 8001670:	d90b      	bls.n	800168a <TIM14_IRQHandler+0x176>
 8001672:	4a13      	ldr	r2, [pc, #76]	; (80016c0 <TIM14_IRQHandler+0x1ac>)
 8001674:	4813      	ldr	r0, [pc, #76]	; (80016c4 <TIM14_IRQHandler+0x1b0>)
 8001676:	7811      	ldrb	r1, [r2, #0]
 8001678:	8804      	ldrh	r4, [r0, #0]
 800167a:	4816      	ldr	r0, [pc, #88]	; (80016d4 <TIM14_IRQHandler+0x1c0>)
 800167c:	5444      	strb	r4, [r0, r1]
 800167e:	7811      	ldrb	r1, [r2, #0]
 8001680:	3101      	adds	r1, #1
 8001682:	b2c9      	uxtb	r1, r1
 8001684:	7011      	strb	r1, [r2, #0]
 8001686:	2201      	movs	r2, #1
 8001688:	e000      	b.n	800168c <TIM14_IRQHandler+0x178>
 800168a:	2203      	movs	r2, #3
 800168c:	701a      	strb	r2, [r3, #0]
 800168e:	4b12      	ldr	r3, [pc, #72]	; (80016d8 <TIM14_IRQHandler+0x1c4>)
 8001690:	2200      	movs	r2, #0
 8001692:	821a      	strh	r2, [r3, #16]
 8001694:	bd70      	pop	{r4, r5, r6, pc}
 8001696:	46c0      	nop			; (mov r8, r8)
 8001698:	200008ab 	.word	0x200008ab
 800169c:	200008aa 	.word	0x200008aa
 80016a0:	20000142 	.word	0x20000142
 80016a4:	200008b2 	.word	0x200008b2
 80016a8:	200008c0 	.word	0x200008c0
 80016ac:	40012400 	.word	0x40012400
 80016b0:	000003e7 	.word	0x000003e7
 80016b4:	200008bc 	.word	0x200008bc
 80016b8:	200008c4 	.word	0x200008c4
 80016bc:	200008b0 	.word	0x200008b0
 80016c0:	200008b4 	.word	0x200008b4
 80016c4:	200008a8 	.word	0x200008a8
 80016c8:	200008b5 	.word	0x200008b5
 80016cc:	200008b8 	.word	0x200008b8
 80016d0:	200008ac 	.word	0x200008ac
 80016d4:	20000134 	.word	0x20000134
 80016d8:	40002000 	.word	0x40002000

080016dc <GPIO_Init>:
 80016dc:	2390      	movs	r3, #144	; 0x90
 80016de:	b5f7      	push	{r0, r1, r2, r4, r5, r6, r7, lr}
 80016e0:	05db      	lsls	r3, r3, #23
 80016e2:	1c04      	adds	r4, r0, #0
 80016e4:	1c0d      	adds	r5, r1, #0
 80016e6:	4298      	cmp	r0, r3
 80016e8:	d010      	beq.n	800170c <GPIO_Init+0x30>
 80016ea:	4b39      	ldr	r3, [pc, #228]	; (80017d0 <GPIO_Init+0xf4>)
 80016ec:	4298      	cmp	r0, r3
 80016ee:	d00d      	beq.n	800170c <GPIO_Init+0x30>
 80016f0:	4b38      	ldr	r3, [pc, #224]	; (80017d4 <GPIO_Init+0xf8>)
 80016f2:	4298      	cmp	r0, r3
 80016f4:	d00a      	beq.n	800170c <GPIO_Init+0x30>
 80016f6:	4b38      	ldr	r3, [pc, #224]	; (80017d8 <GPIO_Init+0xfc>)
 80016f8:	4298      	cmp	r0, r3
 80016fa:	d007      	beq.n	800170c <GPIO_Init+0x30>
 80016fc:	4b37      	ldr	r3, [pc, #220]	; (80017dc <GPIO_Init+0x100>)
 80016fe:	4298      	cmp	r0, r3
 8001700:	d004      	beq.n	800170c <GPIO_Init+0x30>
 8001702:	4a37      	ldr	r2, [pc, #220]	; (80017e0 <GPIO_Init+0x104>)
 8001704:	1880      	adds	r0, r0, r2
 8001706:	4243      	negs	r3, r0
 8001708:	4158      	adcs	r0, r3
 800170a:	e000      	b.n	800170e <GPIO_Init+0x32>
 800170c:	2001      	movs	r0, #1
 800170e:	f7ff fe87 	bl	8001420 <assert_param>
 8001712:	6828      	ldr	r0, [r5, #0]
 8001714:	2600      	movs	r6, #0
 8001716:	1e43      	subs	r3, r0, #1
 8001718:	4198      	sbcs	r0, r3
 800171a:	f7ff fe81 	bl	8001420 <assert_param>
 800171e:	792b      	ldrb	r3, [r5, #4]
 8001720:	2203      	movs	r2, #3
 8001722:	1c30      	adds	r0, r6, #0
 8001724:	429a      	cmp	r2, r3
 8001726:	4170      	adcs	r0, r6
 8001728:	f7ff fe7a 	bl	8001420 <assert_param>
 800172c:	79eb      	ldrb	r3, [r5, #7]
 800172e:	2202      	movs	r2, #2
 8001730:	1c30      	adds	r0, r6, #0
 8001732:	429a      	cmp	r2, r3
 8001734:	4170      	adcs	r0, r6
 8001736:	f7ff fe73 	bl	8001420 <assert_param>
 800173a:	2001      	movs	r0, #1
 800173c:	1c03      	adds	r3, r0, #0
 800173e:	682a      	ldr	r2, [r5, #0]
 8001740:	40b3      	lsls	r3, r6
 8001742:	401a      	ands	r2, r3
 8001744:	9201      	str	r2, [sp, #4]
 8001746:	429a      	cmp	r2, r3
 8001748:	d13d      	bne.n	80017c6 <GPIO_Init+0xea>
 800174a:	792b      	ldrb	r3, [r5, #4]
 800174c:	0077      	lsls	r7, r6, #1
 800174e:	3b01      	subs	r3, #1
 8001750:	b2db      	uxtb	r3, r3
 8001752:	4283      	cmp	r3, r0
 8001754:	d823      	bhi.n	800179e <GPIO_Init+0xc2>
 8001756:	796b      	ldrb	r3, [r5, #5]
 8001758:	4283      	cmp	r3, r0
 800175a:	d902      	bls.n	8001762 <GPIO_Init+0x86>
 800175c:	1ed8      	subs	r0, r3, #3
 800175e:	4243      	negs	r3, r0
 8001760:	4158      	adcs	r0, r3
 8001762:	f7ff fe5d 	bl	8001420 <assert_param>
 8001766:	68a3      	ldr	r3, [r4, #8]
 8001768:	2203      	movs	r2, #3
 800176a:	40ba      	lsls	r2, r7
 800176c:	4393      	bics	r3, r2
 800176e:	60a3      	str	r3, [r4, #8]
 8001770:	796b      	ldrb	r3, [r5, #5]
 8001772:	68a2      	ldr	r2, [r4, #8]
 8001774:	40bb      	lsls	r3, r7
 8001776:	4313      	orrs	r3, r2
 8001778:	60a3      	str	r3, [r4, #8]
 800177a:	79ab      	ldrb	r3, [r5, #6]
 800177c:	2201      	movs	r2, #1
 800177e:	2000      	movs	r0, #0
 8001780:	429a      	cmp	r2, r3
 8001782:	4140      	adcs	r0, r0
 8001784:	f7ff fe4c 	bl	8001420 <assert_param>
 8001788:	6863      	ldr	r3, [r4, #4]
 800178a:	9a01      	ldr	r2, [sp, #4]
 800178c:	b29b      	uxth	r3, r3
 800178e:	4393      	bics	r3, r2
 8001790:	80a3      	strh	r3, [r4, #4]
 8001792:	79ab      	ldrb	r3, [r5, #6]
 8001794:	6862      	ldr	r2, [r4, #4]
 8001796:	40b3      	lsls	r3, r6
 8001798:	4313      	orrs	r3, r2
 800179a:	b29b      	uxth	r3, r3
 800179c:	80a3      	strh	r3, [r4, #4]
 800179e:	2303      	movs	r3, #3
 80017a0:	6822      	ldr	r2, [r4, #0]
 80017a2:	40bb      	lsls	r3, r7
 80017a4:	43db      	mvns	r3, r3
 80017a6:	401a      	ands	r2, r3
 80017a8:	6022      	str	r2, [r4, #0]
 80017aa:	792a      	ldrb	r2, [r5, #4]
 80017ac:	6821      	ldr	r1, [r4, #0]
 80017ae:	40ba      	lsls	r2, r7
 80017b0:	430a      	orrs	r2, r1
 80017b2:	6022      	str	r2, [r4, #0]
 80017b4:	68e2      	ldr	r2, [r4, #12]
 80017b6:	4013      	ands	r3, r2
 80017b8:	79ea      	ldrb	r2, [r5, #7]
 80017ba:	60e3      	str	r3, [r4, #12]
 80017bc:	68e3      	ldr	r3, [r4, #12]
 80017be:	40ba      	lsls	r2, r7
 80017c0:	1c17      	adds	r7, r2, #0
 80017c2:	431f      	orrs	r7, r3
 80017c4:	60e7      	str	r7, [r4, #12]
 80017c6:	3601      	adds	r6, #1
 80017c8:	2e10      	cmp	r6, #16
 80017ca:	d1b6      	bne.n	800173a <GPIO_Init+0x5e>
 80017cc:	bdf7      	pop	{r0, r1, r2, r4, r5, r6, r7, pc}
 80017ce:	46c0      	nop			; (mov r8, r8)
 80017d0:	48000400 	.word	0x48000400
 80017d4:	48000800 	.word	0x48000800
 80017d8:	48000c00 	.word	0x48000c00
 80017dc:	48001000 	.word	0x48001000
 80017e0:	b7ffec00 	.word	0xb7ffec00

080017e4 <GPIO_PinAFConfig>:
 80017e4:	b5f7      	push	{r0, r1, r2, r4, r5, r6, r7, lr}
 80017e6:	2390      	movs	r3, #144	; 0x90
 80017e8:	1c04      	adds	r4, r0, #0
 80017ea:	1c0e      	adds	r6, r1, #0
 80017ec:	9201      	str	r2, [sp, #4]
 80017ee:	05db      	lsls	r3, r3, #23
 80017f0:	4298      	cmp	r0, r3
 80017f2:	d010      	beq.n	8001816 <GPIO_PinAFConfig+0x32>
 80017f4:	4b19      	ldr	r3, [pc, #100]	; (800185c <GPIO_PinAFConfig+0x78>)
 80017f6:	4298      	cmp	r0, r3
 80017f8:	d00d      	beq.n	8001816 <GPIO_PinAFConfig+0x32>
 80017fa:	4b19      	ldr	r3, [pc, #100]	; (8001860 <GPIO_PinAFConfig+0x7c>)
 80017fc:	4298      	cmp	r0, r3
 80017fe:	d00a      	beq.n	8001816 <GPIO_PinAFConfig+0x32>
 8001800:	4b18      	ldr	r3, [pc, #96]	; (8001864 <GPIO_PinAFConfig+0x80>)
 8001802:	4298      	cmp	r0, r3
 8001804:	d007      	beq.n	8001816 <GPIO_PinAFConfig+0x32>
 8001806:	4b18      	ldr	r3, [pc, #96]	; (8001868 <GPIO_PinAFConfig+0x84>)
 8001808:	4298      	cmp	r0, r3
 800180a:	d004      	beq.n	8001816 <GPIO_PinAFConfig+0x32>
 800180c:	4a17      	ldr	r2, [pc, #92]	; (800186c <GPIO_PinAFConfig+0x88>)
 800180e:	1880      	adds	r0, r0, r2
 8001810:	4243      	negs	r3, r0
 8001812:	4158      	adcs	r0, r3
 8001814:	e000      	b.n	8001818 <GPIO_PinAFConfig+0x34>
 8001816:	2001      	movs	r0, #1
 8001818:	2500      	movs	r5, #0
 800181a:	f7ff fe01 	bl	8001420 <assert_param>
 800181e:	230f      	movs	r3, #15
 8001820:	1c28      	adds	r0, r5, #0
 8001822:	42b3      	cmp	r3, r6
 8001824:	4168      	adcs	r0, r5
 8001826:	f7ff fdfb 	bl	8001420 <assert_param>
 800182a:	9a01      	ldr	r2, [sp, #4]
 800182c:	1c28      	adds	r0, r5, #0
 800182e:	2707      	movs	r7, #7
 8001830:	4297      	cmp	r7, r2
 8001832:	4168      	adcs	r0, r5
 8001834:	4037      	ands	r7, r6
 8001836:	08f6      	lsrs	r6, r6, #3
 8001838:	00b6      	lsls	r6, r6, #2
 800183a:	19a4      	adds	r4, r4, r6
 800183c:	f7ff fdf0 	bl	8001420 <assert_param>
 8001840:	00bf      	lsls	r7, r7, #2
 8001842:	6a23      	ldr	r3, [r4, #32]
 8001844:	220f      	movs	r2, #15
 8001846:	40ba      	lsls	r2, r7
 8001848:	4393      	bics	r3, r2
 800184a:	9a01      	ldr	r2, [sp, #4]
 800184c:	6223      	str	r3, [r4, #32]
 800184e:	6a23      	ldr	r3, [r4, #32]
 8001850:	40ba      	lsls	r2, r7
 8001852:	1c17      	adds	r7, r2, #0
 8001854:	431f      	orrs	r7, r3
 8001856:	6227      	str	r7, [r4, #32]
 8001858:	bdf7      	pop	{r0, r1, r2, r4, r5, r6, r7, pc}
 800185a:	46c0      	nop			; (mov r8, r8)
 800185c:	48000400 	.word	0x48000400
 8001860:	48000800 	.word	0x48000800
 8001864:	48000c00 	.word	0x48000c00
 8001868:	48001000 	.word	0x48001000
 800186c:	b7ffec00 	.word	0xb7ffec00

08001870 <TIM_TimeBaseInit>:
 8001870:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
 8001872:	4e34      	ldr	r6, [pc, #208]	; (8001944 <TIM_TimeBaseInit+0xd4>)
 8001874:	1c04      	adds	r4, r0, #0
 8001876:	1c0d      	adds	r5, r1, #0
 8001878:	4f33      	ldr	r7, [pc, #204]	; (8001948 <TIM_TimeBaseInit+0xd8>)
 800187a:	42b0      	cmp	r0, r6
 800187c:	d019      	beq.n	80018b2 <TIM_TimeBaseInit+0x42>
 800187e:	2380      	movs	r3, #128	; 0x80
 8001880:	05db      	lsls	r3, r3, #23
 8001882:	4298      	cmp	r0, r3
 8001884:	d015      	beq.n	80018b2 <TIM_TimeBaseInit+0x42>
 8001886:	4b31      	ldr	r3, [pc, #196]	; (800194c <TIM_TimeBaseInit+0xdc>)
 8001888:	4298      	cmp	r0, r3
 800188a:	d012      	beq.n	80018b2 <TIM_TimeBaseInit+0x42>
 800188c:	42b8      	cmp	r0, r7
 800188e:	d010      	beq.n	80018b2 <TIM_TimeBaseInit+0x42>
 8001890:	4b2f      	ldr	r3, [pc, #188]	; (8001950 <TIM_TimeBaseInit+0xe0>)
 8001892:	4298      	cmp	r0, r3
 8001894:	d00d      	beq.n	80018b2 <TIM_TimeBaseInit+0x42>
 8001896:	4b2f      	ldr	r3, [pc, #188]	; (8001954 <TIM_TimeBaseInit+0xe4>)
 8001898:	4298      	cmp	r0, r3
 800189a:	d00a      	beq.n	80018b2 <TIM_TimeBaseInit+0x42>
 800189c:	4b2e      	ldr	r3, [pc, #184]	; (8001958 <TIM_TimeBaseInit+0xe8>)
 800189e:	4298      	cmp	r0, r3
 80018a0:	d007      	beq.n	80018b2 <TIM_TimeBaseInit+0x42>
 80018a2:	4b2e      	ldr	r3, [pc, #184]	; (800195c <TIM_TimeBaseInit+0xec>)
 80018a4:	4298      	cmp	r0, r3
 80018a6:	d004      	beq.n	80018b2 <TIM_TimeBaseInit+0x42>
 80018a8:	492d      	ldr	r1, [pc, #180]	; (8001960 <TIM_TimeBaseInit+0xf0>)
 80018aa:	1840      	adds	r0, r0, r1
 80018ac:	4243      	negs	r3, r0
 80018ae:	4158      	adcs	r0, r3
 80018b0:	e000      	b.n	80018b4 <TIM_TimeBaseInit+0x44>
 80018b2:	2001      	movs	r0, #1
 80018b4:	f7ff fdb4 	bl	8001420 <assert_param>
 80018b8:	886b      	ldrh	r3, [r5, #2]
 80018ba:	2210      	movs	r2, #16
 80018bc:	1c19      	adds	r1, r3, #0
 80018be:	4391      	bics	r1, r2
 80018c0:	d101      	bne.n	80018c6 <TIM_TimeBaseInit+0x56>
 80018c2:	2001      	movs	r0, #1
 80018c4:	e007      	b.n	80018d6 <TIM_TimeBaseInit+0x66>
 80018c6:	2240      	movs	r2, #64	; 0x40
 80018c8:	1c19      	adds	r1, r3, #0
 80018ca:	4391      	bics	r1, r2
 80018cc:	2920      	cmp	r1, #32
 80018ce:	d0f8      	beq.n	80018c2 <TIM_TimeBaseInit+0x52>
 80018d0:	2b40      	cmp	r3, #64	; 0x40
 80018d2:	d0f6      	beq.n	80018c2 <TIM_TimeBaseInit+0x52>
 80018d4:	2000      	movs	r0, #0
 80018d6:	f7ff fda3 	bl	8001420 <assert_param>
 80018da:	892b      	ldrh	r3, [r5, #8]
 80018dc:	4a21      	ldr	r2, [pc, #132]	; (8001964 <TIM_TimeBaseInit+0xf4>)
 80018de:	2001      	movs	r0, #1
 80018e0:	4213      	tst	r3, r2
 80018e2:	d003      	beq.n	80018ec <TIM_TimeBaseInit+0x7c>
 80018e4:	4a20      	ldr	r2, [pc, #128]	; (8001968 <TIM_TimeBaseInit+0xf8>)
 80018e6:	1898      	adds	r0, r3, r2
 80018e8:	4243      	negs	r3, r0
 80018ea:	4158      	adcs	r0, r3
 80018ec:	f7ff fd98 	bl	8001420 <assert_param>
 80018f0:	6823      	ldr	r3, [r4, #0]
 80018f2:	b29b      	uxth	r3, r3
 80018f4:	42b4      	cmp	r4, r6
 80018f6:	d006      	beq.n	8001906 <TIM_TimeBaseInit+0x96>
 80018f8:	2280      	movs	r2, #128	; 0x80
 80018fa:	05d2      	lsls	r2, r2, #23
 80018fc:	4294      	cmp	r4, r2
 80018fe:	d002      	beq.n	8001906 <TIM_TimeBaseInit+0x96>
 8001900:	4a12      	ldr	r2, [pc, #72]	; (800194c <TIM_TimeBaseInit+0xdc>)
 8001902:	4294      	cmp	r4, r2
 8001904:	d103      	bne.n	800190e <TIM_TimeBaseInit+0x9e>
 8001906:	2270      	movs	r2, #112	; 0x70
 8001908:	4393      	bics	r3, r2
 800190a:	886a      	ldrh	r2, [r5, #2]
 800190c:	4313      	orrs	r3, r2
 800190e:	42bc      	cmp	r4, r7
 8001910:	d003      	beq.n	800191a <TIM_TimeBaseInit+0xaa>
 8001912:	4916      	ldr	r1, [pc, #88]	; (800196c <TIM_TimeBaseInit+0xfc>)
 8001914:	892a      	ldrh	r2, [r5, #8]
 8001916:	400b      	ands	r3, r1
 8001918:	4313      	orrs	r3, r2
 800191a:	8023      	strh	r3, [r4, #0]
 800191c:	686b      	ldr	r3, [r5, #4]
 800191e:	62e3      	str	r3, [r4, #44]	; 0x2c
 8001920:	882b      	ldrh	r3, [r5, #0]
 8001922:	8523      	strh	r3, [r4, #40]	; 0x28
 8001924:	42b4      	cmp	r4, r6
 8001926:	d008      	beq.n	800193a <TIM_TimeBaseInit+0xca>
 8001928:	4b0b      	ldr	r3, [pc, #44]	; (8001958 <TIM_TimeBaseInit+0xe8>)
 800192a:	429c      	cmp	r4, r3
 800192c:	d005      	beq.n	800193a <TIM_TimeBaseInit+0xca>
 800192e:	4b0b      	ldr	r3, [pc, #44]	; (800195c <TIM_TimeBaseInit+0xec>)
 8001930:	429c      	cmp	r4, r3
 8001932:	d002      	beq.n	800193a <TIM_TimeBaseInit+0xca>
 8001934:	4b0e      	ldr	r3, [pc, #56]	; (8001970 <TIM_TimeBaseInit+0x100>)
 8001936:	429c      	cmp	r4, r3
 8001938:	d101      	bne.n	800193e <TIM_TimeBaseInit+0xce>
 800193a:	7aab      	ldrb	r3, [r5, #10]
 800193c:	8623      	strh	r3, [r4, #48]	; 0x30
 800193e:	2301      	movs	r3, #1
 8001940:	82a3      	strh	r3, [r4, #20]
 8001942:	bdf8      	pop	{r3, r4, r5, r6, r7, pc}
 8001944:	40012c00 	.word	0x40012c00
 8001948:	40001000 	.word	0x40001000
 800194c:	40000400 	.word	0x40000400
 8001950:	40001400 	.word	0x40001400
 8001954:	40002000 	.word	0x40002000
 8001958:	40014000 	.word	0x40014000
 800195c:	40014400 	.word	0x40014400
 8001960:	bffeb800 	.word	0xbffeb800
 8001964:	fffffeff 	.word	0xfffffeff
 8001968:	fffffe00 	.word	0xfffffe00
 800196c:	fffffcff 	.word	0xfffffcff
 8001970:	40014800 	.word	0x40014800

08001974 <TIM_Cmd>:
 8001974:	4b19      	ldr	r3, [pc, #100]	; (80019dc <TIM_Cmd+0x68>)
 8001976:	b570      	push	{r4, r5, r6, lr}
 8001978:	1c04      	adds	r4, r0, #0
 800197a:	1c0e      	adds	r6, r1, #0
 800197c:	4298      	cmp	r0, r3
 800197e:	d01a      	beq.n	80019b6 <TIM_Cmd+0x42>
 8001980:	2380      	movs	r3, #128	; 0x80
 8001982:	05db      	lsls	r3, r3, #23
 8001984:	4298      	cmp	r0, r3
 8001986:	d016      	beq.n	80019b6 <TIM_Cmd+0x42>
 8001988:	4b15      	ldr	r3, [pc, #84]	; (80019e0 <TIM_Cmd+0x6c>)
 800198a:	4298      	cmp	r0, r3
 800198c:	d013      	beq.n	80019b6 <TIM_Cmd+0x42>
 800198e:	4b15      	ldr	r3, [pc, #84]	; (80019e4 <TIM_Cmd+0x70>)
 8001990:	4298      	cmp	r0, r3
 8001992:	d010      	beq.n	80019b6 <TIM_Cmd+0x42>
 8001994:	4b14      	ldr	r3, [pc, #80]	; (80019e8 <TIM_Cmd+0x74>)
 8001996:	4298      	cmp	r0, r3
 8001998:	d00d      	beq.n	80019b6 <TIM_Cmd+0x42>
 800199a:	4b14      	ldr	r3, [pc, #80]	; (80019ec <TIM_Cmd+0x78>)
 800199c:	4298      	cmp	r0, r3
 800199e:	d00a      	beq.n	80019b6 <TIM_Cmd+0x42>
 80019a0:	4b13      	ldr	r3, [pc, #76]	; (80019f0 <TIM_Cmd+0x7c>)
 80019a2:	4298      	cmp	r0, r3
 80019a4:	d007      	beq.n	80019b6 <TIM_Cmd+0x42>
 80019a6:	4b13      	ldr	r3, [pc, #76]	; (80019f4 <TIM_Cmd+0x80>)
 80019a8:	4298      	cmp	r0, r3
 80019aa:	d004      	beq.n	80019b6 <TIM_Cmd+0x42>
 80019ac:	4b12      	ldr	r3, [pc, #72]	; (80019f8 <TIM_Cmd+0x84>)
 80019ae:	18c0      	adds	r0, r0, r3
 80019b0:	4243      	negs	r3, r0
 80019b2:	4158      	adcs	r0, r3
 80019b4:	e000      	b.n	80019b8 <TIM_Cmd+0x44>
 80019b6:	2001      	movs	r0, #1
 80019b8:	f7ff fd32 	bl	8001420 <assert_param>
 80019bc:	2501      	movs	r5, #1
 80019be:	2000      	movs	r0, #0
 80019c0:	42b5      	cmp	r5, r6
 80019c2:	4140      	adcs	r0, r0
 80019c4:	f7ff fd2c 	bl	8001420 <assert_param>
 80019c8:	6823      	ldr	r3, [r4, #0]
 80019ca:	b29b      	uxth	r3, r3
 80019cc:	2e00      	cmp	r6, #0
 80019ce:	d002      	beq.n	80019d6 <TIM_Cmd+0x62>
 80019d0:	431d      	orrs	r5, r3
 80019d2:	8025      	strh	r5, [r4, #0]
 80019d4:	e001      	b.n	80019da <TIM_Cmd+0x66>
 80019d6:	43ab      	bics	r3, r5
 80019d8:	8023      	strh	r3, [r4, #0]
 80019da:	bd70      	pop	{r4, r5, r6, pc}
 80019dc:	40012c00 	.word	0x40012c00
 80019e0:	40000400 	.word	0x40000400
 80019e4:	40001000 	.word	0x40001000
 80019e8:	40001400 	.word	0x40001400
 80019ec:	40002000 	.word	0x40002000
 80019f0:	40014000 	.word	0x40014000
 80019f4:	40014400 	.word	0x40014400
 80019f8:	bffeb800 	.word	0xbffeb800

080019fc <TIM_ITConfig>:
 80019fc:	4b1f      	ldr	r3, [pc, #124]	; (8001a7c <TIM_ITConfig+0x80>)
 80019fe:	b570      	push	{r4, r5, r6, lr}
 8001a00:	1c04      	adds	r4, r0, #0
 8001a02:	1c0d      	adds	r5, r1, #0
 8001a04:	1c16      	adds	r6, r2, #0
 8001a06:	4298      	cmp	r0, r3
 8001a08:	d01a      	beq.n	8001a40 <TIM_ITConfig+0x44>
 8001a0a:	2380      	movs	r3, #128	; 0x80
 8001a0c:	05db      	lsls	r3, r3, #23
 8001a0e:	4298      	cmp	r0, r3
 8001a10:	d016      	beq.n	8001a40 <TIM_ITConfig+0x44>
 8001a12:	4b1b      	ldr	r3, [pc, #108]	; (8001a80 <TIM_ITConfig+0x84>)
 8001a14:	4298      	cmp	r0, r3
 8001a16:	d013      	beq.n	8001a40 <TIM_ITConfig+0x44>
 8001a18:	4b1a      	ldr	r3, [pc, #104]	; (8001a84 <TIM_ITConfig+0x88>)
 8001a1a:	4298      	cmp	r0, r3
 8001a1c:	d010      	beq.n	8001a40 <TIM_ITConfig+0x44>
 8001a1e:	4b1a      	ldr	r3, [pc, #104]	; (8001a88 <TIM_ITConfig+0x8c>)
 8001a20:	4298      	cmp	r0, r3
 8001a22:	d00d      	beq.n	8001a40 <TIM_ITConfig+0x44>
 8001a24:	4b19      	ldr	r3, [pc, #100]	; (8001a8c <TIM_ITConfig+0x90>)
 8001a26:	4298      	cmp	r0, r3
 8001a28:	d00a      	beq.n	8001a40 <TIM_ITConfig+0x44>
 8001a2a:	4b19      	ldr	r3, [pc, #100]	; (8001a90 <TIM_ITConfig+0x94>)
 8001a2c:	4298      	cmp	r0, r3
 8001a2e:	d007      	beq.n	8001a40 <TIM_ITConfig+0x44>
 8001a30:	4b18      	ldr	r3, [pc, #96]	; (8001a94 <TIM_ITConfig+0x98>)
 8001a32:	4298      	cmp	r0, r3
 8001a34:	d004      	beq.n	8001a40 <TIM_ITConfig+0x44>
 8001a36:	4a18      	ldr	r2, [pc, #96]	; (8001a98 <TIM_ITConfig+0x9c>)
 8001a38:	1880      	adds	r0, r0, r2
 8001a3a:	4243      	negs	r3, r0
 8001a3c:	4158      	adcs	r0, r3
 8001a3e:	e000      	b.n	8001a42 <TIM_ITConfig+0x46>
 8001a40:	2001      	movs	r0, #1
 8001a42:	f7ff fced 	bl	8001420 <assert_param>
 8001a46:	23ff      	movs	r3, #255	; 0xff
 8001a48:	1c2a      	adds	r2, r5, #0
 8001a4a:	2000      	movs	r0, #0
 8001a4c:	439a      	bics	r2, r3
 8001a4e:	4282      	cmp	r2, r0
 8001a50:	d102      	bne.n	8001a58 <TIM_ITConfig+0x5c>
 8001a52:	1c28      	adds	r0, r5, #0
 8001a54:	1e43      	subs	r3, r0, #1
 8001a56:	4198      	sbcs	r0, r3
 8001a58:	f7ff fce2 	bl	8001420 <assert_param>
 8001a5c:	2301      	movs	r3, #1
 8001a5e:	2000      	movs	r0, #0
 8001a60:	42b3      	cmp	r3, r6
 8001a62:	4140      	adcs	r0, r0
 8001a64:	f7ff fcdc 	bl	8001420 <assert_param>
 8001a68:	68e3      	ldr	r3, [r4, #12]
 8001a6a:	b29b      	uxth	r3, r3
 8001a6c:	2e00      	cmp	r6, #0
 8001a6e:	d002      	beq.n	8001a76 <TIM_ITConfig+0x7a>
 8001a70:	431d      	orrs	r5, r3
 8001a72:	81a5      	strh	r5, [r4, #12]
 8001a74:	e001      	b.n	8001a7a <TIM_ITConfig+0x7e>
 8001a76:	43ab      	bics	r3, r5
 8001a78:	81a3      	strh	r3, [r4, #12]
 8001a7a:	bd70      	pop	{r4, r5, r6, pc}
 8001a7c:	40012c00 	.word	0x40012c00
 8001a80:	40000400 	.word	0x40000400
 8001a84:	40001000 	.word	0x40001000
 8001a88:	40001400 	.word	0x40001400
 8001a8c:	40002000 	.word	0x40002000
 8001a90:	40014000 	.word	0x40014000
 8001a94:	40014400 	.word	0x40014400
 8001a98:	bffeb800 	.word	0xbffeb800

08001a9c <USART_Init>:
 8001a9c:	b5f0      	push	{r4, r5, r6, r7, lr}
 8001a9e:	4e53      	ldr	r6, [pc, #332]	; (8001bec <USART_Init+0x150>)
 8001aa0:	b08b      	sub	sp, #44	; 0x2c
 8001aa2:	1c04      	adds	r4, r0, #0
 8001aa4:	1c0d      	adds	r5, r1, #0
 8001aa6:	42b0      	cmp	r0, r6
 8001aa8:	d016      	beq.n	8001ad8 <USART_Init+0x3c>
 8001aaa:	4b51      	ldr	r3, [pc, #324]	; (8001bf0 <USART_Init+0x154>)
 8001aac:	4298      	cmp	r0, r3
 8001aae:	d013      	beq.n	8001ad8 <USART_Init+0x3c>
 8001ab0:	4b50      	ldr	r3, [pc, #320]	; (8001bf4 <USART_Init+0x158>)
 8001ab2:	4298      	cmp	r0, r3
 8001ab4:	d010      	beq.n	8001ad8 <USART_Init+0x3c>
 8001ab6:	4b50      	ldr	r3, [pc, #320]	; (8001bf8 <USART_Init+0x15c>)
 8001ab8:	4298      	cmp	r0, r3
 8001aba:	d00d      	beq.n	8001ad8 <USART_Init+0x3c>
 8001abc:	4b4f      	ldr	r3, [pc, #316]	; (8001bfc <USART_Init+0x160>)
 8001abe:	4298      	cmp	r0, r3
 8001ac0:	d00a      	beq.n	8001ad8 <USART_Init+0x3c>
 8001ac2:	4b4f      	ldr	r3, [pc, #316]	; (8001c00 <USART_Init+0x164>)
 8001ac4:	4298      	cmp	r0, r3
 8001ac6:	d007      	beq.n	8001ad8 <USART_Init+0x3c>
 8001ac8:	4b4e      	ldr	r3, [pc, #312]	; (8001c04 <USART_Init+0x168>)
 8001aca:	4298      	cmp	r0, r3
 8001acc:	d004      	beq.n	8001ad8 <USART_Init+0x3c>
 8001ace:	494e      	ldr	r1, [pc, #312]	; (8001c08 <USART_Init+0x16c>)
 8001ad0:	1840      	adds	r0, r0, r1
 8001ad2:	4243      	negs	r3, r0
 8001ad4:	4158      	adcs	r0, r3
 8001ad6:	e000      	b.n	8001ada <USART_Init+0x3e>
 8001ad8:	2001      	movs	r0, #1
 8001ada:	f7ff fca1 	bl	8001420 <assert_param>
 8001ade:	682b      	ldr	r3, [r5, #0]
 8001ae0:	4a4a      	ldr	r2, [pc, #296]	; (8001c0c <USART_Init+0x170>)
 8001ae2:	3b01      	subs	r3, #1
 8001ae4:	2000      	movs	r0, #0
 8001ae6:	429a      	cmp	r2, r3
 8001ae8:	4140      	adcs	r0, r0
 8001aea:	f7ff fc99 	bl	8001420 <assert_param>
 8001aee:	686b      	ldr	r3, [r5, #4]
 8001af0:	4a47      	ldr	r2, [pc, #284]	; (8001c10 <USART_Init+0x174>)
 8001af2:	2001      	movs	r0, #1
 8001af4:	4213      	tst	r3, r2
 8001af6:	d003      	beq.n	8001b00 <USART_Init+0x64>
 8001af8:	4a46      	ldr	r2, [pc, #280]	; (8001c14 <USART_Init+0x178>)
 8001afa:	1898      	adds	r0, r3, r2
 8001afc:	4243      	negs	r3, r0
 8001afe:	4158      	adcs	r0, r3
 8001b00:	f7ff fc8e 	bl	8001420 <assert_param>
 8001b04:	68ab      	ldr	r3, [r5, #8]
 8001b06:	4a44      	ldr	r2, [pc, #272]	; (8001c18 <USART_Init+0x17c>)
 8001b08:	2001      	movs	r0, #1
 8001b0a:	4213      	tst	r3, r2
 8001b0c:	d003      	beq.n	8001b16 <USART_Init+0x7a>
 8001b0e:	4943      	ldr	r1, [pc, #268]	; (8001c1c <USART_Init+0x180>)
 8001b10:	1858      	adds	r0, r3, r1
 8001b12:	4243      	negs	r3, r0
 8001b14:	4158      	adcs	r0, r3
 8001b16:	f7ff fc83 	bl	8001420 <assert_param>
 8001b1a:	68eb      	ldr	r3, [r5, #12]
 8001b1c:	4a40      	ldr	r2, [pc, #256]	; (8001c20 <USART_Init+0x184>)
 8001b1e:	2001      	movs	r0, #1
 8001b20:	4213      	tst	r3, r2
 8001b22:	d003      	beq.n	8001b2c <USART_Init+0x90>
 8001b24:	4a3f      	ldr	r2, [pc, #252]	; (8001c24 <USART_Init+0x188>)
 8001b26:	1898      	adds	r0, r3, r2
 8001b28:	4243      	negs	r3, r0
 8001b2a:	4158      	adcs	r0, r3
 8001b2c:	f7ff fc78 	bl	8001420 <assert_param>
 8001b30:	692b      	ldr	r3, [r5, #16]
 8001b32:	220c      	movs	r2, #12
 8001b34:	1c19      	adds	r1, r3, #0
 8001b36:	2000      	movs	r0, #0
 8001b38:	4391      	bics	r1, r2
 8001b3a:	4281      	cmp	r1, r0
 8001b3c:	d102      	bne.n	8001b44 <USART_Init+0xa8>
 8001b3e:	1c18      	adds	r0, r3, #0
 8001b40:	1e43      	subs	r3, r0, #1
 8001b42:	4198      	sbcs	r0, r3
 8001b44:	f7ff fc6c 	bl	8001420 <assert_param>
 8001b48:	4f37      	ldr	r7, [pc, #220]	; (8001c28 <USART_Init+0x18c>)
 8001b4a:	6968      	ldr	r0, [r5, #20]
 8001b4c:	4038      	ands	r0, r7
 8001b4e:	4243      	negs	r3, r0
 8001b50:	4158      	adcs	r0, r3
 8001b52:	f7ff fc65 	bl	8001420 <assert_param>
 8001b56:	6823      	ldr	r3, [r4, #0]
 8001b58:	2201      	movs	r2, #1
 8001b5a:	4393      	bics	r3, r2
 8001b5c:	6023      	str	r3, [r4, #0]
 8001b5e:	6862      	ldr	r2, [r4, #4]
 8001b60:	4b32      	ldr	r3, [pc, #200]	; (8001c2c <USART_Init+0x190>)
 8001b62:	6869      	ldr	r1, [r5, #4]
 8001b64:	4013      	ands	r3, r2
 8001b66:	68aa      	ldr	r2, [r5, #8]
 8001b68:	4668      	mov	r0, sp
 8001b6a:	4313      	orrs	r3, r2
 8001b6c:	6063      	str	r3, [r4, #4]
 8001b6e:	6822      	ldr	r2, [r4, #0]
 8001b70:	4b2f      	ldr	r3, [pc, #188]	; (8001c30 <USART_Init+0x194>)
 8001b72:	401a      	ands	r2, r3
 8001b74:	68eb      	ldr	r3, [r5, #12]
 8001b76:	430b      	orrs	r3, r1
 8001b78:	6929      	ldr	r1, [r5, #16]
 8001b7a:	430b      	orrs	r3, r1
 8001b7c:	4313      	orrs	r3, r2
 8001b7e:	6023      	str	r3, [r4, #0]
 8001b80:	68a3      	ldr	r3, [r4, #8]
 8001b82:	696a      	ldr	r2, [r5, #20]
 8001b84:	401f      	ands	r7, r3
 8001b86:	4317      	orrs	r7, r2
 8001b88:	60a7      	str	r7, [r4, #8]
 8001b8a:	f000 fb17 	bl	80021bc <RCC_GetClocksFreq>
 8001b8e:	42b4      	cmp	r4, r6
 8001b90:	d101      	bne.n	8001b96 <USART_Init+0xfa>
 8001b92:	9e06      	ldr	r6, [sp, #24]
 8001b94:	e00a      	b.n	8001bac <USART_Init+0x110>
 8001b96:	4b16      	ldr	r3, [pc, #88]	; (8001bf0 <USART_Init+0x154>)
 8001b98:	429c      	cmp	r4, r3
 8001b9a:	d101      	bne.n	8001ba0 <USART_Init+0x104>
 8001b9c:	9e07      	ldr	r6, [sp, #28]
 8001b9e:	e005      	b.n	8001bac <USART_Init+0x110>
 8001ba0:	4b14      	ldr	r3, [pc, #80]	; (8001bf4 <USART_Init+0x158>)
 8001ba2:	429c      	cmp	r4, r3
 8001ba4:	d101      	bne.n	8001baa <USART_Init+0x10e>
 8001ba6:	9e08      	ldr	r6, [sp, #32]
 8001ba8:	e000      	b.n	8001bac <USART_Init+0x110>
 8001baa:	9e02      	ldr	r6, [sp, #8]
 8001bac:	6823      	ldr	r3, [r4, #0]
 8001bae:	682f      	ldr	r7, [r5, #0]
 8001bb0:	0419      	lsls	r1, r3, #16
 8001bb2:	d500      	bpl.n	8001bb6 <USART_Init+0x11a>
 8001bb4:	0076      	lsls	r6, r6, #1
 8001bb6:	1c39      	adds	r1, r7, #0
 8001bb8:	1c30      	adds	r0, r6, #0
 8001bba:	f000 fccf 	bl	800255c <__aeabi_uidiv>
 8001bbe:	1c39      	adds	r1, r7, #0
 8001bc0:	1c05      	adds	r5, r0, #0
 8001bc2:	1c30      	adds	r0, r6, #0
 8001bc4:	f000 fd0e 	bl	80025e4 <__aeabi_uidivmod>
 8001bc8:	087f      	lsrs	r7, r7, #1
 8001bca:	2300      	movs	r3, #0
 8001bcc:	42b9      	cmp	r1, r7
 8001bce:	415b      	adcs	r3, r3
 8001bd0:	18ed      	adds	r5, r5, r3
 8001bd2:	6823      	ldr	r3, [r4, #0]
 8001bd4:	041a      	lsls	r2, r3, #16
 8001bd6:	d504      	bpl.n	8001be2 <USART_Init+0x146>
 8001bd8:	4a16      	ldr	r2, [pc, #88]	; (8001c34 <USART_Init+0x198>)
 8001bda:	072b      	lsls	r3, r5, #28
 8001bdc:	0f5b      	lsrs	r3, r3, #29
 8001bde:	4015      	ands	r5, r2
 8001be0:	431d      	orrs	r5, r3
 8001be2:	b2ad      	uxth	r5, r5
 8001be4:	81a5      	strh	r5, [r4, #12]
 8001be6:	b00b      	add	sp, #44	; 0x2c
 8001be8:	bdf0      	pop	{r4, r5, r6, r7, pc}
 8001bea:	46c0      	nop			; (mov r8, r8)
 8001bec:	40013800 	.word	0x40013800
 8001bf0:	40004400 	.word	0x40004400
 8001bf4:	40004800 	.word	0x40004800
 8001bf8:	40004c00 	.word	0x40004c00
 8001bfc:	40005000 	.word	0x40005000
 8001c00:	40011400 	.word	0x40011400
 8001c04:	40011800 	.word	0x40011800
 8001c08:	bffee400 	.word	0xbffee400
 8001c0c:	005b8d7f 	.word	0x005b8d7f
 8001c10:	ffffefff 	.word	0xffffefff
 8001c14:	effff000 	.word	0xeffff000
 8001c18:	ffffdfff 	.word	0xffffdfff
 8001c1c:	ffffd000 	.word	0xffffd000
 8001c20:	fffffbff 	.word	0xfffffbff
 8001c24:	fffffa00 	.word	0xfffffa00
 8001c28:	fffffcff 	.word	0xfffffcff
 8001c2c:	ffffcfff 	.word	0xffffcfff
 8001c30:	ffffe9f3 	.word	0xffffe9f3
 8001c34:	0000fff0 	.word	0x0000fff0

08001c38 <USART_Cmd>:
 8001c38:	4b17      	ldr	r3, [pc, #92]	; (8001c98 <USART_Cmd+0x60>)
 8001c3a:	b570      	push	{r4, r5, r6, lr}
 8001c3c:	1c04      	adds	r4, r0, #0
 8001c3e:	1c0e      	adds	r6, r1, #0
 8001c40:	4298      	cmp	r0, r3
 8001c42:	d016      	beq.n	8001c72 <USART_Cmd+0x3a>
 8001c44:	4b15      	ldr	r3, [pc, #84]	; (8001c9c <USART_Cmd+0x64>)
 8001c46:	4298      	cmp	r0, r3
 8001c48:	d013      	beq.n	8001c72 <USART_Cmd+0x3a>
 8001c4a:	4b15      	ldr	r3, [pc, #84]	; (8001ca0 <USART_Cmd+0x68>)
 8001c4c:	4298      	cmp	r0, r3
 8001c4e:	d010      	beq.n	8001c72 <USART_Cmd+0x3a>
 8001c50:	4b14      	ldr	r3, [pc, #80]	; (8001ca4 <USART_Cmd+0x6c>)
 8001c52:	4298      	cmp	r0, r3
 8001c54:	d00d      	beq.n	8001c72 <USART_Cmd+0x3a>
 8001c56:	4b14      	ldr	r3, [pc, #80]	; (8001ca8 <USART_Cmd+0x70>)
 8001c58:	4298      	cmp	r0, r3
 8001c5a:	d00a      	beq.n	8001c72 <USART_Cmd+0x3a>
 8001c5c:	4b13      	ldr	r3, [pc, #76]	; (8001cac <USART_Cmd+0x74>)
 8001c5e:	4298      	cmp	r0, r3
 8001c60:	d007      	beq.n	8001c72 <USART_Cmd+0x3a>
 8001c62:	4b13      	ldr	r3, [pc, #76]	; (8001cb0 <USART_Cmd+0x78>)
 8001c64:	4298      	cmp	r0, r3
 8001c66:	d004      	beq.n	8001c72 <USART_Cmd+0x3a>
 8001c68:	4b12      	ldr	r3, [pc, #72]	; (8001cb4 <USART_Cmd+0x7c>)
 8001c6a:	18c0      	adds	r0, r0, r3
 8001c6c:	4243      	negs	r3, r0
 8001c6e:	4158      	adcs	r0, r3
 8001c70:	e000      	b.n	8001c74 <USART_Cmd+0x3c>
 8001c72:	2001      	movs	r0, #1
 8001c74:	f7ff fbd4 	bl	8001420 <assert_param>
 8001c78:	2501      	movs	r5, #1
 8001c7a:	2000      	movs	r0, #0
 8001c7c:	42b5      	cmp	r5, r6
 8001c7e:	4140      	adcs	r0, r0
 8001c80:	f7ff fbce 	bl	8001420 <assert_param>
 8001c84:	6823      	ldr	r3, [r4, #0]
 8001c86:	2e00      	cmp	r6, #0
 8001c88:	d002      	beq.n	8001c90 <USART_Cmd+0x58>
 8001c8a:	431d      	orrs	r5, r3
 8001c8c:	6025      	str	r5, [r4, #0]
 8001c8e:	e001      	b.n	8001c94 <USART_Cmd+0x5c>
 8001c90:	43ab      	bics	r3, r5
 8001c92:	6023      	str	r3, [r4, #0]
 8001c94:	bd70      	pop	{r4, r5, r6, pc}
 8001c96:	46c0      	nop			; (mov r8, r8)
 8001c98:	40013800 	.word	0x40013800
 8001c9c:	40004400 	.word	0x40004400
 8001ca0:	40004800 	.word	0x40004800
 8001ca4:	40004c00 	.word	0x40004c00
 8001ca8:	40005000 	.word	0x40005000
 8001cac:	40011400 	.word	0x40011400
 8001cb0:	40011800 	.word	0x40011800
 8001cb4:	bffee400 	.word	0xbffee400

08001cb8 <USART_ReceiveData>:
 8001cb8:	4b11      	ldr	r3, [pc, #68]	; (8001d00 <USART_ReceiveData+0x48>)
 8001cba:	b510      	push	{r4, lr}
 8001cbc:	1e04      	subs	r4, r0, #0
 8001cbe:	429c      	cmp	r4, r3
 8001cc0:	d016      	beq.n	8001cf0 <USART_ReceiveData+0x38>
 8001cc2:	4b10      	ldr	r3, [pc, #64]	; (8001d04 <USART_ReceiveData+0x4c>)
 8001cc4:	4298      	cmp	r0, r3
 8001cc6:	d013      	beq.n	8001cf0 <USART_ReceiveData+0x38>
 8001cc8:	4b0f      	ldr	r3, [pc, #60]	; (8001d08 <USART_ReceiveData+0x50>)
 8001cca:	4298      	cmp	r0, r3
 8001ccc:	d010      	beq.n	8001cf0 <USART_ReceiveData+0x38>
 8001cce:	4b0f      	ldr	r3, [pc, #60]	; (8001d0c <USART_ReceiveData+0x54>)
 8001cd0:	4298      	cmp	r0, r3
 8001cd2:	d00d      	beq.n	8001cf0 <USART_ReceiveData+0x38>
 8001cd4:	4b0e      	ldr	r3, [pc, #56]	; (8001d10 <USART_ReceiveData+0x58>)
 8001cd6:	4298      	cmp	r0, r3
 8001cd8:	d00a      	beq.n	8001cf0 <USART_ReceiveData+0x38>
 8001cda:	4b0e      	ldr	r3, [pc, #56]	; (8001d14 <USART_ReceiveData+0x5c>)
 8001cdc:	4298      	cmp	r0, r3
 8001cde:	d007      	beq.n	8001cf0 <USART_ReceiveData+0x38>
 8001ce0:	4b0d      	ldr	r3, [pc, #52]	; (8001d18 <USART_ReceiveData+0x60>)
 8001ce2:	4298      	cmp	r0, r3
 8001ce4:	d004      	beq.n	8001cf0 <USART_ReceiveData+0x38>
 8001ce6:	4b0d      	ldr	r3, [pc, #52]	; (8001d1c <USART_ReceiveData+0x64>)
 8001ce8:	18c0      	adds	r0, r0, r3
 8001cea:	4243      	negs	r3, r0
 8001cec:	4158      	adcs	r0, r3
 8001cee:	e000      	b.n	8001cf2 <USART_ReceiveData+0x3a>
 8001cf0:	2001      	movs	r0, #1
 8001cf2:	f7ff fb95 	bl	8001420 <assert_param>
 8001cf6:	6a60      	ldr	r0, [r4, #36]	; 0x24
 8001cf8:	05c0      	lsls	r0, r0, #23
 8001cfa:	0dc0      	lsrs	r0, r0, #23
 8001cfc:	bd10      	pop	{r4, pc}
 8001cfe:	46c0      	nop			; (mov r8, r8)
 8001d00:	40013800 	.word	0x40013800
 8001d04:	40004400 	.word	0x40004400
 8001d08:	40004800 	.word	0x40004800
 8001d0c:	40004c00 	.word	0x40004c00
 8001d10:	40005000 	.word	0x40005000
 8001d14:	40011400 	.word	0x40011400
 8001d18:	40011800 	.word	0x40011800
 8001d1c:	bffee400 	.word	0xbffee400

08001d20 <USART_GetITStatus>:
 8001d20:	b538      	push	{r3, r4, r5, lr}
 8001d22:	4b36      	ldr	r3, [pc, #216]	; (8001dfc <USART_GetITStatus+0xdc>)
 8001d24:	1c05      	adds	r5, r0, #0
 8001d26:	1c0c      	adds	r4, r1, #0
 8001d28:	4298      	cmp	r0, r3
 8001d2a:	d016      	beq.n	8001d5a <USART_GetITStatus+0x3a>
 8001d2c:	4b34      	ldr	r3, [pc, #208]	; (8001e00 <USART_GetITStatus+0xe0>)
 8001d2e:	4298      	cmp	r0, r3
 8001d30:	d013      	beq.n	8001d5a <USART_GetITStatus+0x3a>
 8001d32:	4b34      	ldr	r3, [pc, #208]	; (8001e04 <USART_GetITStatus+0xe4>)
 8001d34:	4298      	cmp	r0, r3
 8001d36:	d010      	beq.n	8001d5a <USART_GetITStatus+0x3a>
 8001d38:	4b33      	ldr	r3, [pc, #204]	; (8001e08 <USART_GetITStatus+0xe8>)
 8001d3a:	4298      	cmp	r0, r3
 8001d3c:	d00d      	beq.n	8001d5a <USART_GetITStatus+0x3a>
 8001d3e:	4b33      	ldr	r3, [pc, #204]	; (8001e0c <USART_GetITStatus+0xec>)
 8001d40:	4298      	cmp	r0, r3
 8001d42:	d00a      	beq.n	8001d5a <USART_GetITStatus+0x3a>
 8001d44:	4b32      	ldr	r3, [pc, #200]	; (8001e10 <USART_GetITStatus+0xf0>)
 8001d46:	4298      	cmp	r0, r3
 8001d48:	d007      	beq.n	8001d5a <USART_GetITStatus+0x3a>
 8001d4a:	4b32      	ldr	r3, [pc, #200]	; (8001e14 <USART_GetITStatus+0xf4>)
 8001d4c:	4298      	cmp	r0, r3
 8001d4e:	d004      	beq.n	8001d5a <USART_GetITStatus+0x3a>
 8001d50:	4a31      	ldr	r2, [pc, #196]	; (8001e18 <USART_GetITStatus+0xf8>)
 8001d52:	1880      	adds	r0, r0, r2
 8001d54:	4243      	negs	r3, r0
 8001d56:	4158      	adcs	r0, r3
 8001d58:	e000      	b.n	8001d5c <USART_GetITStatus+0x3c>
 8001d5a:	2001      	movs	r0, #1
 8001d5c:	f7ff fb60 	bl	8001420 <assert_param>
 8001d60:	2384      	movs	r3, #132	; 0x84
 8001d62:	005b      	lsls	r3, r3, #1
 8001d64:	429c      	cmp	r4, r3
 8001d66:	d027      	beq.n	8001db8 <USART_GetITStatus+0x98>
 8001d68:	4b2c      	ldr	r3, [pc, #176]	; (8001e1c <USART_GetITStatus+0xfc>)
 8001d6a:	429c      	cmp	r4, r3
 8001d6c:	d024      	beq.n	8001db8 <USART_GetITStatus+0x98>
 8001d6e:	4b2c      	ldr	r3, [pc, #176]	; (8001e20 <USART_GetITStatus+0x100>)
 8001d70:	429c      	cmp	r4, r3
 8001d72:	d021      	beq.n	8001db8 <USART_GetITStatus+0x98>
 8001d74:	4b2b      	ldr	r3, [pc, #172]	; (8001e24 <USART_GetITStatus+0x104>)
 8001d76:	429c      	cmp	r4, r3
 8001d78:	d01e      	beq.n	8001db8 <USART_GetITStatus+0x98>
 8001d7a:	4b2b      	ldr	r3, [pc, #172]	; (8001e28 <USART_GetITStatus+0x108>)
 8001d7c:	429c      	cmp	r4, r3
 8001d7e:	d01b      	beq.n	8001db8 <USART_GetITStatus+0x98>
 8001d80:	4b2a      	ldr	r3, [pc, #168]	; (8001e2c <USART_GetITStatus+0x10c>)
 8001d82:	429c      	cmp	r4, r3
 8001d84:	d018      	beq.n	8001db8 <USART_GetITStatus+0x98>
 8001d86:	4b2a      	ldr	r3, [pc, #168]	; (8001e30 <USART_GetITStatus+0x110>)
 8001d88:	429c      	cmp	r4, r3
 8001d8a:	d015      	beq.n	8001db8 <USART_GetITStatus+0x98>
 8001d8c:	4b29      	ldr	r3, [pc, #164]	; (8001e34 <USART_GetITStatus+0x114>)
 8001d8e:	429c      	cmp	r4, r3
 8001d90:	d012      	beq.n	8001db8 <USART_GetITStatus+0x98>
 8001d92:	4a29      	ldr	r2, [pc, #164]	; (8001e38 <USART_GetITStatus+0x118>)
 8001d94:	4b29      	ldr	r3, [pc, #164]	; (8001e3c <USART_GetITStatus+0x11c>)
 8001d96:	4022      	ands	r2, r4
 8001d98:	429a      	cmp	r2, r3
 8001d9a:	d00d      	beq.n	8001db8 <USART_GetITStatus+0x98>
 8001d9c:	4b28      	ldr	r3, [pc, #160]	; (8001e40 <USART_GetITStatus+0x120>)
 8001d9e:	429c      	cmp	r4, r3
 8001da0:	d00a      	beq.n	8001db8 <USART_GetITStatus+0x98>
 8001da2:	4b28      	ldr	r3, [pc, #160]	; (8001e44 <USART_GetITStatus+0x124>)
 8001da4:	429c      	cmp	r4, r3
 8001da6:	d007      	beq.n	8001db8 <USART_GetITStatus+0x98>
 8001da8:	4b27      	ldr	r3, [pc, #156]	; (8001e48 <USART_GetITStatus+0x128>)
 8001daa:	429c      	cmp	r4, r3
 8001dac:	d004      	beq.n	8001db8 <USART_GetITStatus+0x98>
 8001dae:	4a27      	ldr	r2, [pc, #156]	; (8001e4c <USART_GetITStatus+0x12c>)
 8001db0:	18a3      	adds	r3, r4, r2
 8001db2:	4258      	negs	r0, r3
 8001db4:	4158      	adcs	r0, r3
 8001db6:	e000      	b.n	8001dba <USART_GetITStatus+0x9a>
 8001db8:	2001      	movs	r0, #1
 8001dba:	f7ff fb31 	bl	8001420 <assert_param>
 8001dbe:	b2e3      	uxtb	r3, r4
 8001dc0:	2101      	movs	r1, #1
 8001dc2:	b2a2      	uxth	r2, r4
 8001dc4:	4099      	lsls	r1, r3
 8001dc6:	0a12      	lsrs	r2, r2, #8
 8001dc8:	1c0b      	adds	r3, r1, #0
 8001dca:	2a01      	cmp	r2, #1
 8001dcc:	d101      	bne.n	8001dd2 <USART_GetITStatus+0xb2>
 8001dce:	682a      	ldr	r2, [r5, #0]
 8001dd0:	e004      	b.n	8001ddc <USART_GetITStatus+0xbc>
 8001dd2:	2a02      	cmp	r2, #2
 8001dd4:	d101      	bne.n	8001dda <USART_GetITStatus+0xba>
 8001dd6:	686a      	ldr	r2, [r5, #4]
 8001dd8:	e000      	b.n	8001ddc <USART_GetITStatus+0xbc>
 8001dda:	68aa      	ldr	r2, [r5, #8]
 8001ddc:	2000      	movs	r0, #0
 8001dde:	4013      	ands	r3, r2
 8001de0:	69ea      	ldr	r2, [r5, #28]
 8001de2:	4283      	cmp	r3, r0
 8001de4:	d008      	beq.n	8001df8 <USART_GetITStatus+0xd8>
 8001de6:	0c24      	lsrs	r4, r4, #16
 8001de8:	2001      	movs	r0, #1
 8001dea:	40a0      	lsls	r0, r4
 8001dec:	1c04      	adds	r4, r0, #0
 8001dee:	1c10      	adds	r0, r2, #0
 8001df0:	4020      	ands	r0, r4
 8001df2:	1e44      	subs	r4, r0, #1
 8001df4:	41a0      	sbcs	r0, r4
 8001df6:	b2c0      	uxtb	r0, r0
 8001df8:	bd38      	pop	{r3, r4, r5, pc}
 8001dfa:	46c0      	nop			; (mov r8, r8)
 8001dfc:	40013800 	.word	0x40013800
 8001e00:	40004400 	.word	0x40004400
 8001e04:	40004800 	.word	0x40004800
 8001e08:	40004c00 	.word	0x40004c00
 8001e0c:	40005000 	.word	0x40005000
 8001e10:	40011400 	.word	0x40011400
 8001e14:	40011800 	.word	0x40011800
 8001e18:	bffee400 	.word	0xbffee400
 8001e1c:	00070107 	.word	0x00070107
 8001e20:	00060106 	.word	0x00060106
 8001e24:	00050105 	.word	0x00050105
 8001e28:	00040104 	.word	0x00040104
 8001e2c:	00080206 	.word	0x00080206
 8001e30:	0009030a 	.word	0x0009030a
 8001e34:	00020300 	.word	0x00020300
 8001e38:	fffdffff 	.word	0xfffdffff
 8001e3c:	00010300 	.word	0x00010300
 8001e40:	000b011a 	.word	0x000b011a
 8001e44:	000c011b 	.word	0x000c011b
 8001e48:	0011010e 	.word	0x0011010e
 8001e4c:	ffebfcea 	.word	0xffebfcea

08001e50 <USART_ClearITPendingBit>:
 8001e50:	b538      	push	{r3, r4, r5, lr}
 8001e52:	4b26      	ldr	r3, [pc, #152]	; (8001eec <USART_ClearITPendingBit+0x9c>)
 8001e54:	1c05      	adds	r5, r0, #0
 8001e56:	1c0c      	adds	r4, r1, #0
 8001e58:	4298      	cmp	r0, r3
 8001e5a:	d016      	beq.n	8001e8a <USART_ClearITPendingBit+0x3a>
 8001e5c:	4b24      	ldr	r3, [pc, #144]	; (8001ef0 <USART_ClearITPendingBit+0xa0>)
 8001e5e:	4298      	cmp	r0, r3
 8001e60:	d013      	beq.n	8001e8a <USART_ClearITPendingBit+0x3a>
 8001e62:	4b24      	ldr	r3, [pc, #144]	; (8001ef4 <USART_ClearITPendingBit+0xa4>)
 8001e64:	4298      	cmp	r0, r3
 8001e66:	d010      	beq.n	8001e8a <USART_ClearITPendingBit+0x3a>
 8001e68:	4b23      	ldr	r3, [pc, #140]	; (8001ef8 <USART_ClearITPendingBit+0xa8>)
 8001e6a:	4298      	cmp	r0, r3
 8001e6c:	d00d      	beq.n	8001e8a <USART_ClearITPendingBit+0x3a>
 8001e6e:	4b23      	ldr	r3, [pc, #140]	; (8001efc <USART_ClearITPendingBit+0xac>)
 8001e70:	4298      	cmp	r0, r3
 8001e72:	d00a      	beq.n	8001e8a <USART_ClearITPendingBit+0x3a>
 8001e74:	4b22      	ldr	r3, [pc, #136]	; (8001f00 <USART_ClearITPendingBit+0xb0>)
 8001e76:	4298      	cmp	r0, r3
 8001e78:	d007      	beq.n	8001e8a <USART_ClearITPendingBit+0x3a>
 8001e7a:	4b22      	ldr	r3, [pc, #136]	; (8001f04 <USART_ClearITPendingBit+0xb4>)
 8001e7c:	4298      	cmp	r0, r3
 8001e7e:	d004      	beq.n	8001e8a <USART_ClearITPendingBit+0x3a>
 8001e80:	4a21      	ldr	r2, [pc, #132]	; (8001f08 <USART_ClearITPendingBit+0xb8>)
 8001e82:	1880      	adds	r0, r0, r2
 8001e84:	4243      	negs	r3, r0
 8001e86:	4158      	adcs	r0, r3
 8001e88:	e000      	b.n	8001e8c <USART_ClearITPendingBit+0x3c>
 8001e8a:	2001      	movs	r0, #1
 8001e8c:	f7ff fac8 	bl	8001420 <assert_param>
 8001e90:	4b1e      	ldr	r3, [pc, #120]	; (8001f0c <USART_ClearITPendingBit+0xbc>)
 8001e92:	429c      	cmp	r4, r3
 8001e94:	d022      	beq.n	8001edc <USART_ClearITPendingBit+0x8c>
 8001e96:	2384      	movs	r3, #132	; 0x84
 8001e98:	005b      	lsls	r3, r3, #1
 8001e9a:	429c      	cmp	r4, r3
 8001e9c:	d01e      	beq.n	8001edc <USART_ClearITPendingBit+0x8c>
 8001e9e:	4a1c      	ldr	r2, [pc, #112]	; (8001f10 <USART_ClearITPendingBit+0xc0>)
 8001ea0:	4b1c      	ldr	r3, [pc, #112]	; (8001f14 <USART_ClearITPendingBit+0xc4>)
 8001ea2:	4022      	ands	r2, r4
 8001ea4:	429a      	cmp	r2, r3
 8001ea6:	d019      	beq.n	8001edc <USART_ClearITPendingBit+0x8c>
 8001ea8:	4b1b      	ldr	r3, [pc, #108]	; (8001f18 <USART_ClearITPendingBit+0xc8>)
 8001eaa:	429c      	cmp	r4, r3
 8001eac:	d016      	beq.n	8001edc <USART_ClearITPendingBit+0x8c>
 8001eae:	4b1b      	ldr	r3, [pc, #108]	; (8001f1c <USART_ClearITPendingBit+0xcc>)
 8001eb0:	429c      	cmp	r4, r3
 8001eb2:	d013      	beq.n	8001edc <USART_ClearITPendingBit+0x8c>
 8001eb4:	4b1a      	ldr	r3, [pc, #104]	; (8001f20 <USART_ClearITPendingBit+0xd0>)
 8001eb6:	429c      	cmp	r4, r3
 8001eb8:	d010      	beq.n	8001edc <USART_ClearITPendingBit+0x8c>
 8001eba:	4b1a      	ldr	r3, [pc, #104]	; (8001f24 <USART_ClearITPendingBit+0xd4>)
 8001ebc:	429c      	cmp	r4, r3
 8001ebe:	d00d      	beq.n	8001edc <USART_ClearITPendingBit+0x8c>
 8001ec0:	4b19      	ldr	r3, [pc, #100]	; (8001f28 <USART_ClearITPendingBit+0xd8>)
 8001ec2:	429c      	cmp	r4, r3
 8001ec4:	d00a      	beq.n	8001edc <USART_ClearITPendingBit+0x8c>
 8001ec6:	4b19      	ldr	r3, [pc, #100]	; (8001f2c <USART_ClearITPendingBit+0xdc>)
 8001ec8:	429c      	cmp	r4, r3
 8001eca:	d007      	beq.n	8001edc <USART_ClearITPendingBit+0x8c>
 8001ecc:	4b18      	ldr	r3, [pc, #96]	; (8001f30 <USART_ClearITPendingBit+0xe0>)
 8001ece:	429c      	cmp	r4, r3
 8001ed0:	d004      	beq.n	8001edc <USART_ClearITPendingBit+0x8c>
 8001ed2:	4a18      	ldr	r2, [pc, #96]	; (8001f34 <USART_ClearITPendingBit+0xe4>)
 8001ed4:	18a3      	adds	r3, r4, r2
 8001ed6:	4258      	negs	r0, r3
 8001ed8:	4158      	adcs	r0, r3
 8001eda:	e000      	b.n	8001ede <USART_ClearITPendingBit+0x8e>
 8001edc:	2001      	movs	r0, #1
 8001ede:	f7ff fa9f 	bl	8001420 <assert_param>
 8001ee2:	0c24      	lsrs	r4, r4, #16
 8001ee4:	2301      	movs	r3, #1
 8001ee6:	40a3      	lsls	r3, r4
 8001ee8:	622b      	str	r3, [r5, #32]
 8001eea:	bd38      	pop	{r3, r4, r5, pc}
 8001eec:	40013800 	.word	0x40013800
 8001ef0:	40004400 	.word	0x40004400
 8001ef4:	40004800 	.word	0x40004800
 8001ef8:	40004c00 	.word	0x40004c00
 8001efc:	40005000 	.word	0x40005000
 8001f00:	40011400 	.word	0x40011400
 8001f04:	40011800 	.word	0x40011800
 8001f08:	bffee400 	.word	0xbffee400
 8001f0c:	00060106 	.word	0x00060106
 8001f10:	fffdffff 	.word	0xfffdffff
 8001f14:	00010300 	.word	0x00010300
 8001f18:	00020300 	.word	0x00020300
 8001f1c:	00040104 	.word	0x00040104
 8001f20:	00080206 	.word	0x00080206
 8001f24:	0009030a 	.word	0x0009030a
 8001f28:	000b011a 	.word	0x000b011a
 8001f2c:	000c011b 	.word	0x000c011b
 8001f30:	0011010e 	.word	0x0011010e
 8001f34:	ffebfcea 	.word	0xffebfcea

08001f38 <SPI_Init>:
 8001f38:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
 8001f3a:	4b4d      	ldr	r3, [pc, #308]	; (8002070 <SPI_Init+0x138>)
 8001f3c:	1c05      	adds	r5, r0, #0
 8001f3e:	1c0c      	adds	r4, r1, #0
 8001f40:	4298      	cmp	r0, r3
 8001f42:	d004      	beq.n	8001f4e <SPI_Init+0x16>
 8001f44:	4b4b      	ldr	r3, [pc, #300]	; (8002074 <SPI_Init+0x13c>)
 8001f46:	18c0      	adds	r0, r0, r3
 8001f48:	4243      	negs	r3, r0
 8001f4a:	4158      	adcs	r0, r3
 8001f4c:	e000      	b.n	8001f50 <SPI_Init+0x18>
 8001f4e:	2001      	movs	r0, #1
 8001f50:	f7ff fa66 	bl	8001420 <assert_param>
 8001f54:	4e48      	ldr	r6, [pc, #288]	; (8002078 <SPI_Init+0x140>)
 8001f56:	8823      	ldrh	r3, [r4, #0]
 8001f58:	4233      	tst	r3, r6
 8001f5a:	d101      	bne.n	8001f60 <SPI_Init+0x28>
 8001f5c:	2001      	movs	r0, #1
 8001f5e:	e006      	b.n	8001f6e <SPI_Init+0x36>
 8001f60:	4a46      	ldr	r2, [pc, #280]	; (800207c <SPI_Init+0x144>)
 8001f62:	4013      	ands	r3, r2
 8001f64:	2280      	movs	r2, #128	; 0x80
 8001f66:	0212      	lsls	r2, r2, #8
 8001f68:	4293      	cmp	r3, r2
 8001f6a:	d0f7      	beq.n	8001f5c <SPI_Init+0x24>
 8001f6c:	2000      	movs	r0, #0
 8001f6e:	f7ff fa57 	bl	8001420 <assert_param>
 8001f72:	8860      	ldrh	r0, [r4, #2]
 8001f74:	2382      	movs	r3, #130	; 0x82
 8001f76:	005b      	lsls	r3, r3, #1
 8001f78:	4298      	cmp	r0, r3
 8001f7a:	d002      	beq.n	8001f82 <SPI_Init+0x4a>
 8001f7c:	4243      	negs	r3, r0
 8001f7e:	4158      	adcs	r0, r3
 8001f80:	e000      	b.n	8001f84 <SPI_Init+0x4c>
 8001f82:	2001      	movs	r0, #1
 8001f84:	f7ff fa4c 	bl	8001420 <assert_param>
 8001f88:	88a0      	ldrh	r0, [r4, #4]
 8001f8a:	23c0      	movs	r3, #192	; 0xc0
 8001f8c:	1c02      	adds	r2, r0, #0
 8001f8e:	4032      	ands	r2, r6
 8001f90:	009b      	lsls	r3, r3, #2
 8001f92:	4e3b      	ldr	r6, [pc, #236]	; (8002080 <SPI_Init+0x148>)
 8001f94:	429a      	cmp	r2, r3
 8001f96:	d016      	beq.n	8001fc6 <SPI_Init+0x8e>
 8001f98:	4a3a      	ldr	r2, [pc, #232]	; (8002084 <SPI_Init+0x14c>)
 8001f9a:	2380      	movs	r3, #128	; 0x80
 8001f9c:	4002      	ands	r2, r0
 8001f9e:	00db      	lsls	r3, r3, #3
 8001fa0:	429a      	cmp	r2, r3
 8001fa2:	d010      	beq.n	8001fc6 <SPI_Init+0x8e>
 8001fa4:	1c02      	adds	r2, r0, #0
 8001fa6:	23c0      	movs	r3, #192	; 0xc0
 8001fa8:	4032      	ands	r2, r6
 8001faa:	00db      	lsls	r3, r3, #3
 8001fac:	429a      	cmp	r2, r3
 8001fae:	d00a      	beq.n	8001fc6 <SPI_Init+0x8e>
 8001fb0:	4a35      	ldr	r2, [pc, #212]	; (8002088 <SPI_Init+0x150>)
 8001fb2:	2380      	movs	r3, #128	; 0x80
 8001fb4:	4002      	ands	r2, r0
 8001fb6:	011b      	lsls	r3, r3, #4
 8001fb8:	429a      	cmp	r2, r3
 8001fba:	d004      	beq.n	8001fc6 <SPI_Init+0x8e>
 8001fbc:	4b33      	ldr	r3, [pc, #204]	; (800208c <SPI_Init+0x154>)
 8001fbe:	18c0      	adds	r0, r0, r3
 8001fc0:	4243      	negs	r3, r0
 8001fc2:	4158      	adcs	r0, r3
 8001fc4:	e000      	b.n	8001fc8 <SPI_Init+0x90>
 8001fc6:	2001      	movs	r0, #1
 8001fc8:	f7ff fa2a 	bl	8001420 <assert_param>
 8001fcc:	88e0      	ldrh	r0, [r4, #6]
 8001fce:	2302      	movs	r3, #2
 8001fd0:	4398      	bics	r0, r3
 8001fd2:	4243      	negs	r3, r0
 8001fd4:	4158      	adcs	r0, r3
 8001fd6:	f7ff fa23 	bl	8001420 <assert_param>
 8001fda:	2700      	movs	r7, #0
 8001fdc:	8923      	ldrh	r3, [r4, #8]
 8001fde:	2201      	movs	r2, #1
 8001fe0:	1c38      	adds	r0, r7, #0
 8001fe2:	429a      	cmp	r2, r3
 8001fe4:	4178      	adcs	r0, r7
 8001fe6:	f7ff fa1b 	bl	8001420 <assert_param>
 8001fea:	4b29      	ldr	r3, [pc, #164]	; (8002090 <SPI_Init+0x158>)
 8001fec:	8960      	ldrh	r0, [r4, #10]
 8001fee:	4018      	ands	r0, r3
 8001ff0:	4243      	negs	r3, r0
 8001ff2:	4158      	adcs	r0, r3
 8001ff4:	f7ff fa14 	bl	8001420 <assert_param>
 8001ff8:	89a3      	ldrh	r3, [r4, #12]
 8001ffa:	2218      	movs	r2, #24
 8001ffc:	4393      	bics	r3, r2
 8001ffe:	42bb      	cmp	r3, r7
 8002000:	d101      	bne.n	8002006 <SPI_Init+0xce>
 8002002:	2001      	movs	r0, #1
 8002004:	e002      	b.n	800200c <SPI_Init+0xd4>
 8002006:	2b20      	cmp	r3, #32
 8002008:	d0fb      	beq.n	8002002 <SPI_Init+0xca>
 800200a:	1c38      	adds	r0, r7, #0
 800200c:	f7ff fa08 	bl	8001420 <assert_param>
 8002010:	89e0      	ldrh	r0, [r4, #14]
 8002012:	2380      	movs	r3, #128	; 0x80
 8002014:	4398      	bics	r0, r3
 8002016:	4243      	negs	r3, r0
 8002018:	4158      	adcs	r0, r3
 800201a:	f7ff fa01 	bl	8001420 <assert_param>
 800201e:	8a20      	ldrh	r0, [r4, #16]
 8002020:	1e43      	subs	r3, r0, #1
 8002022:	4198      	sbcs	r0, r3
 8002024:	f7ff f9fc 	bl	8001420 <assert_param>
 8002028:	882b      	ldrh	r3, [r5, #0]
 800202a:	22c1      	movs	r2, #193	; 0xc1
 800202c:	0192      	lsls	r2, r2, #6
 800202e:	89e1      	ldrh	r1, [r4, #14]
 8002030:	401a      	ands	r2, r3
 8002032:	8823      	ldrh	r3, [r4, #0]
 8002034:	430b      	orrs	r3, r1
 8002036:	88e1      	ldrh	r1, [r4, #6]
 8002038:	430b      	orrs	r3, r1
 800203a:	8921      	ldrh	r1, [r4, #8]
 800203c:	430b      	orrs	r3, r1
 800203e:	8961      	ldrh	r1, [r4, #10]
 8002040:	430b      	orrs	r3, r1
 8002042:	89a1      	ldrh	r1, [r4, #12]
 8002044:	430b      	orrs	r3, r1
 8002046:	4313      	orrs	r3, r2
 8002048:	802b      	strh	r3, [r5, #0]
 800204a:	88aa      	ldrh	r2, [r5, #4]
 800204c:	4b11      	ldr	r3, [pc, #68]	; (8002094 <SPI_Init+0x15c>)
 800204e:	4013      	ands	r3, r2
 8002050:	88a2      	ldrh	r2, [r4, #4]
 8002052:	4313      	orrs	r3, r2
 8002054:	80ab      	strh	r3, [r5, #4]
 8002056:	8a23      	ldrh	r3, [r4, #16]
 8002058:	2204      	movs	r2, #4
 800205a:	822b      	strh	r3, [r5, #16]
 800205c:	882b      	ldrh	r3, [r5, #0]
 800205e:	4393      	bics	r3, r2
 8002060:	8862      	ldrh	r2, [r4, #2]
 8002062:	4313      	orrs	r3, r2
 8002064:	802b      	strh	r3, [r5, #0]
 8002066:	8bab      	ldrh	r3, [r5, #28]
 8002068:	401e      	ands	r6, r3
 800206a:	83ae      	strh	r6, [r5, #28]
 800206c:	bdf8      	pop	{r3, r4, r5, r6, r7, pc}
 800206e:	46c0      	nop			; (mov r8, r8)
 8002070:	40013000 	.word	0x40013000
 8002074:	bfffc800 	.word	0xbfffc800
 8002078:	fffffbff 	.word	0xfffffbff
 800207c:	ffffbfff 	.word	0xffffbfff
 8002080:	fffff7ff 	.word	0xfffff7ff
 8002084:	fffff6ff 	.word	0xfffff6ff
 8002088:	fffffcff 	.word	0xfffffcff
 800208c:	fffff100 	.word	0xfffff100
 8002090:	fffffdff 	.word	0xfffffdff
 8002094:	fffff0ff 	.word	0xfffff0ff

08002098 <SPI_Cmd>:
 8002098:	b538      	push	{r3, r4, r5, lr}
 800209a:	4b0e      	ldr	r3, [pc, #56]	; (80020d4 <SPI_Cmd+0x3c>)
 800209c:	1c04      	adds	r4, r0, #0
 800209e:	1c0d      	adds	r5, r1, #0
 80020a0:	4298      	cmp	r0, r3
 80020a2:	d004      	beq.n	80020ae <SPI_Cmd+0x16>
 80020a4:	4b0c      	ldr	r3, [pc, #48]	; (80020d8 <SPI_Cmd+0x40>)
 80020a6:	18c0      	adds	r0, r0, r3
 80020a8:	4243      	negs	r3, r0
 80020aa:	4158      	adcs	r0, r3
 80020ac:	e000      	b.n	80020b0 <SPI_Cmd+0x18>
 80020ae:	2001      	movs	r0, #1
 80020b0:	f7ff f9b6 	bl	8001420 <assert_param>
 80020b4:	2301      	movs	r3, #1
 80020b6:	2000      	movs	r0, #0
 80020b8:	42ab      	cmp	r3, r5
 80020ba:	4140      	adcs	r0, r0
 80020bc:	f7ff f9b0 	bl	8001420 <assert_param>
 80020c0:	2340      	movs	r3, #64	; 0x40
 80020c2:	8822      	ldrh	r2, [r4, #0]
 80020c4:	2d00      	cmp	r5, #0
 80020c6:	d001      	beq.n	80020cc <SPI_Cmd+0x34>
 80020c8:	4313      	orrs	r3, r2
 80020ca:	e001      	b.n	80020d0 <SPI_Cmd+0x38>
 80020cc:	439a      	bics	r2, r3
 80020ce:	1c13      	adds	r3, r2, #0
 80020d0:	8023      	strh	r3, [r4, #0]
 80020d2:	bd38      	pop	{r3, r4, r5, pc}
 80020d4:	40013000 	.word	0x40013000
 80020d8:	bfffc800 	.word	0xbfffc800

080020dc <SPI_RxFIFOThresholdConfig>:
 80020dc:	4b0d      	ldr	r3, [pc, #52]	; (8002114 <SPI_RxFIFOThresholdConfig+0x38>)
 80020de:	b570      	push	{r4, r5, r6, lr}
 80020e0:	1c04      	adds	r4, r0, #0
 80020e2:	1c0d      	adds	r5, r1, #0
 80020e4:	4298      	cmp	r0, r3
 80020e6:	d004      	beq.n	80020f2 <SPI_RxFIFOThresholdConfig+0x16>
 80020e8:	4b0b      	ldr	r3, [pc, #44]	; (8002118 <SPI_RxFIFOThresholdConfig+0x3c>)
 80020ea:	18c0      	adds	r0, r0, r3
 80020ec:	4243      	negs	r3, r0
 80020ee:	4158      	adcs	r0, r3
 80020f0:	e000      	b.n	80020f4 <SPI_RxFIFOThresholdConfig+0x18>
 80020f2:	2001      	movs	r0, #1
 80020f4:	4e09      	ldr	r6, [pc, #36]	; (800211c <SPI_RxFIFOThresholdConfig+0x40>)
 80020f6:	f7ff f993 	bl	8001420 <assert_param>
 80020fa:	1c28      	adds	r0, r5, #0
 80020fc:	4030      	ands	r0, r6
 80020fe:	4243      	negs	r3, r0
 8002100:	4158      	adcs	r0, r3
 8002102:	f7ff f98d 	bl	8001420 <assert_param>
 8002106:	88a3      	ldrh	r3, [r4, #4]
 8002108:	401e      	ands	r6, r3
 800210a:	80a6      	strh	r6, [r4, #4]
 800210c:	88a3      	ldrh	r3, [r4, #4]
 800210e:	431d      	orrs	r5, r3
 8002110:	80a5      	strh	r5, [r4, #4]
 8002112:	bd70      	pop	{r4, r5, r6, pc}
 8002114:	40013000 	.word	0x40013000
 8002118:	bfffc800 	.word	0xbfffc800
 800211c:	ffffefff 	.word	0xffffefff

08002120 <SPI_SendData8>:
 8002120:	b538      	push	{r3, r4, r5, lr}
 8002122:	4b07      	ldr	r3, [pc, #28]	; (8002140 <SPI_SendData8+0x20>)
 8002124:	1c04      	adds	r4, r0, #0
 8002126:	1c0d      	adds	r5, r1, #0
 8002128:	4298      	cmp	r0, r3
 800212a:	d004      	beq.n	8002136 <SPI_SendData8+0x16>
 800212c:	4b05      	ldr	r3, [pc, #20]	; (8002144 <SPI_SendData8+0x24>)
 800212e:	18c0      	adds	r0, r0, r3
 8002130:	4243      	negs	r3, r0
 8002132:	4158      	adcs	r0, r3
 8002134:	e000      	b.n	8002138 <SPI_SendData8+0x18>
 8002136:	2001      	movs	r0, #1
 8002138:	f7ff f972 	bl	8001420 <assert_param>
 800213c:	7325      	strb	r5, [r4, #12]
 800213e:	bd38      	pop	{r3, r4, r5, pc}
 8002140:	40013000 	.word	0x40013000
 8002144:	bfffc800 	.word	0xbfffc800

08002148 <NVIC_Init>:
 8002148:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
 800214a:	2500      	movs	r5, #0
 800214c:	7883      	ldrb	r3, [r0, #2]
 800214e:	1c04      	adds	r4, r0, #0
 8002150:	2601      	movs	r6, #1
 8002152:	1c28      	adds	r0, r5, #0
 8002154:	429e      	cmp	r6, r3
 8002156:	4168      	adcs	r0, r5
 8002158:	f7ff f962 	bl	8001420 <assert_param>
 800215c:	7863      	ldrb	r3, [r4, #1]
 800215e:	2703      	movs	r7, #3
 8002160:	1c28      	adds	r0, r5, #0
 8002162:	429f      	cmp	r7, r3
 8002164:	4168      	adcs	r0, r5
 8002166:	f7ff f95b 	bl	8001420 <assert_param>
 800216a:	78a2      	ldrb	r2, [r4, #2]
 800216c:	7823      	ldrb	r3, [r4, #0]
 800216e:	42aa      	cmp	r2, r5
 8002170:	d01a      	beq.n	80021a8 <NVIC_Init+0x60>
 8002172:	0899      	lsrs	r1, r3, #2
 8002174:	4a0f      	ldr	r2, [pc, #60]	; (80021b4 <NVIC_Init+0x6c>)
 8002176:	0089      	lsls	r1, r1, #2
 8002178:	1889      	adds	r1, r1, r2
 800217a:	22c0      	movs	r2, #192	; 0xc0
 800217c:	0092      	lsls	r2, r2, #2
 800217e:	401f      	ands	r7, r3
 8002180:	20ff      	movs	r0, #255	; 0xff
 8002182:	588d      	ldr	r5, [r1, r2]
 8002184:	00ff      	lsls	r7, r7, #3
 8002186:	1c03      	adds	r3, r0, #0
 8002188:	40bb      	lsls	r3, r7
 800218a:	439d      	bics	r5, r3
 800218c:	7863      	ldrb	r3, [r4, #1]
 800218e:	019b      	lsls	r3, r3, #6
 8002190:	4018      	ands	r0, r3
 8002192:	40b8      	lsls	r0, r7
 8002194:	1c2f      	adds	r7, r5, #0
 8002196:	4307      	orrs	r7, r0
 8002198:	508f      	str	r7, [r1, r2]
 800219a:	7822      	ldrb	r2, [r4, #0]
 800219c:	231f      	movs	r3, #31
 800219e:	4013      	ands	r3, r2
 80021a0:	409e      	lsls	r6, r3
 80021a2:	4b04      	ldr	r3, [pc, #16]	; (80021b4 <NVIC_Init+0x6c>)
 80021a4:	601e      	str	r6, [r3, #0]
 80021a6:	e004      	b.n	80021b2 <NVIC_Init+0x6a>
 80021a8:	271f      	movs	r7, #31
 80021aa:	403b      	ands	r3, r7
 80021ac:	4a02      	ldr	r2, [pc, #8]	; (80021b8 <NVIC_Init+0x70>)
 80021ae:	409e      	lsls	r6, r3
 80021b0:	67d6      	str	r6, [r2, #124]	; 0x7c
 80021b2:	bdf8      	pop	{r3, r4, r5, r6, r7, pc}
 80021b4:	e000e100 	.word	0xe000e100
 80021b8:	e000e104 	.word	0xe000e104

080021bc <RCC_GetClocksFreq>:
 80021bc:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
 80021be:	4d5a      	ldr	r5, [pc, #360]	; (8002328 <RCC_GetClocksFreq+0x16c>)
 80021c0:	1c04      	adds	r4, r0, #0
 80021c2:	6868      	ldr	r0, [r5, #4]
 80021c4:	230c      	movs	r3, #12
 80021c6:	4018      	ands	r0, r3
 80021c8:	f000 f9be 	bl	8002548 <__gnu_thumb1_case_uqi>
 80021cc:	1f1f1f1f 	.word	0x1f1f1f1f
 80021d0:	1f1f1f1f 	.word	0x1f1f1f1f
 80021d4:	1f1f1f07 	.word	0x1f1f1f07
 80021d8:	1d          	.byte	0x1d
 80021d9:	00          	.byte	0x00
 80021da:	686e      	ldr	r6, [r5, #4]
 80021dc:	23c0      	movs	r3, #192	; 0xc0
 80021de:	02b6      	lsls	r6, r6, #10
 80021e0:	686a      	ldr	r2, [r5, #4]
 80021e2:	0f36      	lsrs	r6, r6, #28
 80021e4:	025b      	lsls	r3, r3, #9
 80021e6:	3602      	adds	r6, #2
 80021e8:	421a      	tst	r2, r3
 80021ea:	d101      	bne.n	80021f0 <RCC_GetClocksFreq+0x34>
 80021ec:	484f      	ldr	r0, [pc, #316]	; (800232c <RCC_GetClocksFreq+0x170>)
 80021ee:	e007      	b.n	8002200 <RCC_GetClocksFreq+0x44>
 80021f0:	4b4d      	ldr	r3, [pc, #308]	; (8002328 <RCC_GetClocksFreq+0x16c>)
 80021f2:	484f      	ldr	r0, [pc, #316]	; (8002330 <RCC_GetClocksFreq+0x174>)
 80021f4:	6ad9      	ldr	r1, [r3, #44]	; 0x2c
 80021f6:	230f      	movs	r3, #15
 80021f8:	4019      	ands	r1, r3
 80021fa:	3101      	adds	r1, #1
 80021fc:	f000 f9ae 	bl	800255c <__aeabi_uidiv>
 8002200:	4370      	muls	r0, r6
 8002202:	6020      	str	r0, [r4, #0]
 8002204:	e004      	b.n	8002210 <RCC_GetClocksFreq+0x54>
 8002206:	4b4b      	ldr	r3, [pc, #300]	; (8002334 <RCC_GetClocksFreq+0x178>)
 8002208:	e000      	b.n	800220c <RCC_GetClocksFreq+0x50>
 800220a:	4b49      	ldr	r3, [pc, #292]	; (8002330 <RCC_GetClocksFreq+0x174>)
 800220c:	6023      	str	r3, [r4, #0]
 800220e:	2000      	movs	r0, #0
 8002210:	686b      	ldr	r3, [r5, #4]
 8002212:	4a49      	ldr	r2, [pc, #292]	; (8002338 <RCC_GetClocksFreq+0x17c>)
 8002214:	061b      	lsls	r3, r3, #24
 8002216:	0f1b      	lsrs	r3, r3, #28
 8002218:	6821      	ldr	r1, [r4, #0]
 800221a:	5cd3      	ldrb	r3, [r2, r3]
 800221c:	1c0e      	adds	r6, r1, #0
 800221e:	40de      	lsrs	r6, r3
 8002220:	6066      	str	r6, [r4, #4]
 8002222:	1c33      	adds	r3, r6, #0
 8002224:	686e      	ldr	r6, [r5, #4]
 8002226:	0576      	lsls	r6, r6, #21
 8002228:	0f76      	lsrs	r6, r6, #29
 800222a:	5d92      	ldrb	r2, [r2, r6]
 800222c:	40d3      	lsrs	r3, r2
 800222e:	60a3      	str	r3, [r4, #8]
 8002230:	6b2a      	ldr	r2, [r5, #48]	; 0x30
 8002232:	05d6      	lsls	r6, r2, #23
 8002234:	d401      	bmi.n	800223a <RCC_GetClocksFreq+0x7e>
 8002236:	4a41      	ldr	r2, [pc, #260]	; (800233c <RCC_GetClocksFreq+0x180>)
 8002238:	e006      	b.n	8002248 <RCC_GetClocksFreq+0x8c>
 800223a:	4a3b      	ldr	r2, [pc, #236]	; (8002328 <RCC_GetClocksFreq+0x16c>)
 800223c:	6852      	ldr	r2, [r2, #4]
 800223e:	0456      	lsls	r6, r2, #17
 8002240:	d401      	bmi.n	8002246 <RCC_GetClocksFreq+0x8a>
 8002242:	085a      	lsrs	r2, r3, #1
 8002244:	e000      	b.n	8002248 <RCC_GetClocksFreq+0x8c>
 8002246:	089a      	lsrs	r2, r3, #2
 8002248:	60e2      	str	r2, [r4, #12]
 800224a:	6b2a      	ldr	r2, [r5, #48]	; 0x30
 800224c:	0656      	lsls	r6, r2, #25
 800224e:	d401      	bmi.n	8002254 <RCC_GetClocksFreq+0x98>
 8002250:	4a3b      	ldr	r2, [pc, #236]	; (8002340 <RCC_GetClocksFreq+0x184>)
 8002252:	e001      	b.n	8002258 <RCC_GetClocksFreq+0x9c>
 8002254:	2280      	movs	r2, #128	; 0x80
 8002256:	0212      	lsls	r2, r2, #8
 8002258:	6122      	str	r2, [r4, #16]
 800225a:	6b2a      	ldr	r2, [r5, #48]	; 0x30
 800225c:	06d6      	lsls	r6, r2, #27
 800225e:	d402      	bmi.n	8002266 <RCC_GetClocksFreq+0xaa>
 8002260:	4a33      	ldr	r2, [pc, #204]	; (8002330 <RCC_GetClocksFreq+0x174>)
 8002262:	6162      	str	r2, [r4, #20]
 8002264:	e000      	b.n	8002268 <RCC_GetClocksFreq+0xac>
 8002266:	6161      	str	r1, [r4, #20]
 8002268:	6b2f      	ldr	r7, [r5, #48]	; 0x30
 800226a:	2203      	movs	r2, #3
 800226c:	4e2e      	ldr	r6, [pc, #184]	; (8002328 <RCC_GetClocksFreq+0x16c>)
 800226e:	4217      	tst	r7, r2
 8002270:	d101      	bne.n	8002276 <RCC_GetClocksFreq+0xba>
 8002272:	61a3      	str	r3, [r4, #24]
 8002274:	e012      	b.n	800229c <RCC_GetClocksFreq+0xe0>
 8002276:	6b37      	ldr	r7, [r6, #48]	; 0x30
 8002278:	4017      	ands	r7, r2
 800227a:	2f01      	cmp	r7, #1
 800227c:	d101      	bne.n	8002282 <RCC_GetClocksFreq+0xc6>
 800227e:	61a1      	str	r1, [r4, #24]
 8002280:	e00c      	b.n	800229c <RCC_GetClocksFreq+0xe0>
 8002282:	6b37      	ldr	r7, [r6, #48]	; 0x30
 8002284:	4017      	ands	r7, r2
 8002286:	2f02      	cmp	r7, #2
 8002288:	d102      	bne.n	8002290 <RCC_GetClocksFreq+0xd4>
 800228a:	2280      	movs	r2, #128	; 0x80
 800228c:	0212      	lsls	r2, r2, #8
 800228e:	e004      	b.n	800229a <RCC_GetClocksFreq+0xde>
 8002290:	6b36      	ldr	r6, [r6, #48]	; 0x30
 8002292:	4032      	ands	r2, r6
 8002294:	2a03      	cmp	r2, #3
 8002296:	d101      	bne.n	800229c <RCC_GetClocksFreq+0xe0>
 8002298:	4a25      	ldr	r2, [pc, #148]	; (8002330 <RCC_GetClocksFreq+0x174>)
 800229a:	61a2      	str	r2, [r4, #24]
 800229c:	22c0      	movs	r2, #192	; 0xc0
 800229e:	6b2f      	ldr	r7, [r5, #48]	; 0x30
 80022a0:	0292      	lsls	r2, r2, #10
 80022a2:	4e21      	ldr	r6, [pc, #132]	; (8002328 <RCC_GetClocksFreq+0x16c>)
 80022a4:	4217      	tst	r7, r2
 80022a6:	d101      	bne.n	80022ac <RCC_GetClocksFreq+0xf0>
 80022a8:	61e3      	str	r3, [r4, #28]
 80022aa:	e018      	b.n	80022de <RCC_GetClocksFreq+0x122>
 80022ac:	6b37      	ldr	r7, [r6, #48]	; 0x30
 80022ae:	4017      	ands	r7, r2
 80022b0:	46bc      	mov	ip, r7
 80022b2:	2780      	movs	r7, #128	; 0x80
 80022b4:	027f      	lsls	r7, r7, #9
 80022b6:	45bc      	cmp	ip, r7
 80022b8:	d101      	bne.n	80022be <RCC_GetClocksFreq+0x102>
 80022ba:	61e1      	str	r1, [r4, #28]
 80022bc:	e00f      	b.n	80022de <RCC_GetClocksFreq+0x122>
 80022be:	6b37      	ldr	r7, [r6, #48]	; 0x30
 80022c0:	4017      	ands	r7, r2
 80022c2:	46bc      	mov	ip, r7
 80022c4:	2780      	movs	r7, #128	; 0x80
 80022c6:	02bf      	lsls	r7, r7, #10
 80022c8:	45bc      	cmp	ip, r7
 80022ca:	d102      	bne.n	80022d2 <RCC_GetClocksFreq+0x116>
 80022cc:	2280      	movs	r2, #128	; 0x80
 80022ce:	0212      	lsls	r2, r2, #8
 80022d0:	e004      	b.n	80022dc <RCC_GetClocksFreq+0x120>
 80022d2:	6b36      	ldr	r6, [r6, #48]	; 0x30
 80022d4:	4016      	ands	r6, r2
 80022d6:	4296      	cmp	r6, r2
 80022d8:	d101      	bne.n	80022de <RCC_GetClocksFreq+0x122>
 80022da:	4a15      	ldr	r2, [pc, #84]	; (8002330 <RCC_GetClocksFreq+0x174>)
 80022dc:	61e2      	str	r2, [r4, #28]
 80022de:	22c0      	movs	r2, #192	; 0xc0
 80022e0:	6b2f      	ldr	r7, [r5, #48]	; 0x30
 80022e2:	0312      	lsls	r2, r2, #12
 80022e4:	4e10      	ldr	r6, [pc, #64]	; (8002328 <RCC_GetClocksFreq+0x16c>)
 80022e6:	4217      	tst	r7, r2
 80022e8:	d015      	beq.n	8002316 <RCC_GetClocksFreq+0x15a>
 80022ea:	6b37      	ldr	r7, [r6, #48]	; 0x30
 80022ec:	2380      	movs	r3, #128	; 0x80
 80022ee:	4017      	ands	r7, r2
 80022f0:	02db      	lsls	r3, r3, #11
 80022f2:	429f      	cmp	r7, r3
 80022f4:	d101      	bne.n	80022fa <RCC_GetClocksFreq+0x13e>
 80022f6:	6221      	str	r1, [r4, #32]
 80022f8:	e00e      	b.n	8002318 <RCC_GetClocksFreq+0x15c>
 80022fa:	6b31      	ldr	r1, [r6, #48]	; 0x30
 80022fc:	2380      	movs	r3, #128	; 0x80
 80022fe:	4011      	ands	r1, r2
 8002300:	031b      	lsls	r3, r3, #12
 8002302:	4299      	cmp	r1, r3
 8002304:	d102      	bne.n	800230c <RCC_GetClocksFreq+0x150>
 8002306:	2380      	movs	r3, #128	; 0x80
 8002308:	021b      	lsls	r3, r3, #8
 800230a:	e004      	b.n	8002316 <RCC_GetClocksFreq+0x15a>
 800230c:	6b33      	ldr	r3, [r6, #48]	; 0x30
 800230e:	4013      	ands	r3, r2
 8002310:	4293      	cmp	r3, r2
 8002312:	d101      	bne.n	8002318 <RCC_GetClocksFreq+0x15c>
 8002314:	4b06      	ldr	r3, [pc, #24]	; (8002330 <RCC_GetClocksFreq+0x174>)
 8002316:	6223      	str	r3, [r4, #32]
 8002318:	6b2b      	ldr	r3, [r5, #48]	; 0x30
 800231a:	061a      	lsls	r2, r3, #24
 800231c:	d402      	bmi.n	8002324 <RCC_GetClocksFreq+0x168>
 800231e:	4b05      	ldr	r3, [pc, #20]	; (8002334 <RCC_GetClocksFreq+0x178>)
 8002320:	6263      	str	r3, [r4, #36]	; 0x24
 8002322:	e000      	b.n	8002326 <RCC_GetClocksFreq+0x16a>
 8002324:	6260      	str	r0, [r4, #36]	; 0x24
 8002326:	bdf8      	pop	{r3, r4, r5, r6, r7, pc}
 8002328:	40021000 	.word	0x40021000
 800232c:	003d0900 	.word	0x003d0900
 8002330:	007a1200 	.word	0x007a1200
 8002334:	02dc6c00 	.word	0x02dc6c00
 8002338:	20000000 	.word	0x20000000
 800233c:	00d59f80 	.word	0x00d59f80
 8002340:	00008012 	.word	0x00008012

08002344 <RCC_AHBPeriphClockCmd>:
 8002344:	b538      	push	{r3, r4, r5, lr}
 8002346:	4b0d      	ldr	r3, [pc, #52]	; (800237c <RCC_AHBPeriphClockCmd+0x38>)
 8002348:	1c04      	adds	r4, r0, #0
 800234a:	1c0d      	adds	r5, r1, #0
 800234c:	2000      	movs	r0, #0
 800234e:	421c      	tst	r4, r3
 8002350:	d102      	bne.n	8002358 <RCC_AHBPeriphClockCmd+0x14>
 8002352:	1c20      	adds	r0, r4, #0
 8002354:	1e43      	subs	r3, r0, #1
 8002356:	4198      	sbcs	r0, r3
 8002358:	f7ff f862 	bl	8001420 <assert_param>
 800235c:	2301      	movs	r3, #1
 800235e:	2000      	movs	r0, #0
 8002360:	42ab      	cmp	r3, r5
 8002362:	4140      	adcs	r0, r0
 8002364:	f7ff f85c 	bl	8001420 <assert_param>
 8002368:	4b05      	ldr	r3, [pc, #20]	; (8002380 <RCC_AHBPeriphClockCmd+0x3c>)
 800236a:	695a      	ldr	r2, [r3, #20]
 800236c:	2d00      	cmp	r5, #0
 800236e:	d002      	beq.n	8002376 <RCC_AHBPeriphClockCmd+0x32>
 8002370:	4314      	orrs	r4, r2
 8002372:	615c      	str	r4, [r3, #20]
 8002374:	e001      	b.n	800237a <RCC_AHBPeriphClockCmd+0x36>
 8002376:	43a2      	bics	r2, r4
 8002378:	615a      	str	r2, [r3, #20]
 800237a:	bd38      	pop	{r3, r4, r5, pc}
 800237c:	fe81ffa8 	.word	0xfe81ffa8
 8002380:	40021000 	.word	0x40021000

08002384 <RCC_APB2PeriphClockCmd>:
 8002384:	b538      	push	{r3, r4, r5, lr}
 8002386:	4b0d      	ldr	r3, [pc, #52]	; (80023bc <RCC_APB2PeriphClockCmd+0x38>)
 8002388:	1c04      	adds	r4, r0, #0
 800238a:	1c0d      	adds	r5, r1, #0
 800238c:	2000      	movs	r0, #0
 800238e:	421c      	tst	r4, r3
 8002390:	d102      	bne.n	8002398 <RCC_APB2PeriphClockCmd+0x14>
 8002392:	1c20      	adds	r0, r4, #0
 8002394:	1e43      	subs	r3, r0, #1
 8002396:	4198      	sbcs	r0, r3
 8002398:	f7ff f842 	bl	8001420 <assert_param>
 800239c:	2301      	movs	r3, #1
 800239e:	2000      	movs	r0, #0
 80023a0:	42ab      	cmp	r3, r5
 80023a2:	4140      	adcs	r0, r0
 80023a4:	f7ff f83c 	bl	8001420 <assert_param>
 80023a8:	4b05      	ldr	r3, [pc, #20]	; (80023c0 <RCC_APB2PeriphClockCmd+0x3c>)
 80023aa:	699a      	ldr	r2, [r3, #24]
 80023ac:	2d00      	cmp	r5, #0
 80023ae:	d002      	beq.n	80023b6 <RCC_APB2PeriphClockCmd+0x32>
 80023b0:	4314      	orrs	r4, r2
 80023b2:	619c      	str	r4, [r3, #24]
 80023b4:	e001      	b.n	80023ba <RCC_APB2PeriphClockCmd+0x36>
 80023b6:	43a2      	bics	r2, r4
 80023b8:	619a      	str	r2, [r3, #24]
 80023ba:	bd38      	pop	{r3, r4, r5, pc}
 80023bc:	ffb8a51e 	.word	0xffb8a51e
 80023c0:	40021000 	.word	0x40021000

080023c4 <RCC_APB1PeriphClockCmd>:
 80023c4:	b538      	push	{r3, r4, r5, lr}
 80023c6:	4b0d      	ldr	r3, [pc, #52]	; (80023fc <RCC_APB1PeriphClockCmd+0x38>)
 80023c8:	1c04      	adds	r4, r0, #0
 80023ca:	1c0d      	adds	r5, r1, #0
 80023cc:	2000      	movs	r0, #0
 80023ce:	421c      	tst	r4, r3
 80023d0:	d102      	bne.n	80023d8 <RCC_APB1PeriphClockCmd+0x14>
 80023d2:	1c20      	adds	r0, r4, #0
 80023d4:	1e43      	subs	r3, r0, #1
 80023d6:	4198      	sbcs	r0, r3
 80023d8:	f7ff f822 	bl	8001420 <assert_param>
 80023dc:	2301      	movs	r3, #1
 80023de:	2000      	movs	r0, #0
 80023e0:	42ab      	cmp	r3, r5
 80023e2:	4140      	adcs	r0, r0
 80023e4:	f7ff f81c 	bl	8001420 <assert_param>
 80023e8:	4b05      	ldr	r3, [pc, #20]	; (8002400 <RCC_APB1PeriphClockCmd+0x3c>)
 80023ea:	69da      	ldr	r2, [r3, #28]
 80023ec:	2d00      	cmp	r5, #0
 80023ee:	d002      	beq.n	80023f6 <RCC_APB1PeriphClockCmd+0x32>
 80023f0:	4314      	orrs	r4, r2
 80023f2:	61dc      	str	r4, [r3, #28]
 80023f4:	e001      	b.n	80023fa <RCC_APB1PeriphClockCmd+0x36>
 80023f6:	43a2      	bics	r2, r4
 80023f8:	61da      	str	r2, [r3, #28]
 80023fa:	bd38      	pop	{r3, r4, r5, pc}
 80023fc:	8581b6cc 	.word	0x8581b6cc
 8002400:	40021000 	.word	0x40021000

08002404 <gpio_init>:
 8002404:	b5f7      	push	{r0, r1, r2, r4, r5, r6, r7, lr}
 8002406:	2080      	movs	r0, #128	; 0x80
 8002408:	0280      	lsls	r0, r0, #10
 800240a:	2101      	movs	r1, #1
 800240c:	f7ff ff9a 	bl	8002344 <RCC_AHBPeriphClockCmd>
 8002410:	2080      	movs	r0, #128	; 0x80
 8002412:	02c0      	lsls	r0, r0, #11
 8002414:	2101      	movs	r1, #1
 8002416:	f7ff ff95 	bl	8002344 <RCC_AHBPeriphClockCmd>
 800241a:	2208      	movs	r2, #8
 800241c:	2400      	movs	r4, #0
 800241e:	466b      	mov	r3, sp
 8002420:	2603      	movs	r6, #3
 8002422:	9200      	str	r2, [sp, #0]
 8002424:	4669      	mov	r1, sp
 8002426:	2201      	movs	r2, #1
 8002428:	481c      	ldr	r0, [pc, #112]	; (800249c <gpio_init+0x98>)
 800242a:	715e      	strb	r6, [r3, #5]
 800242c:	711a      	strb	r2, [r3, #4]
 800242e:	719c      	strb	r4, [r3, #6]
 8002430:	71dc      	strb	r4, [r3, #7]
 8002432:	2590      	movs	r5, #144	; 0x90
 8002434:	f7ff f952 	bl	80016dc <GPIO_Init>
 8002438:	2380      	movs	r3, #128	; 0x80
 800243a:	05ed      	lsls	r5, r5, #23
 800243c:	005b      	lsls	r3, r3, #1
 800243e:	466a      	mov	r2, sp
 8002440:	1c28      	adds	r0, r5, #0
 8002442:	9300      	str	r3, [sp, #0]
 8002444:	4669      	mov	r1, sp
 8002446:	2301      	movs	r3, #1
 8002448:	2780      	movs	r7, #128	; 0x80
 800244a:	7156      	strb	r6, [r2, #5]
 800244c:	013f      	lsls	r7, r7, #4
 800244e:	7113      	strb	r3, [r2, #4]
 8002450:	7194      	strb	r4, [r2, #6]
 8002452:	71d4      	strb	r4, [r2, #7]
 8002454:	f7ff f942 	bl	80016dc <GPIO_Init>
 8002458:	466a      	mov	r2, sp
 800245a:	1c28      	adds	r0, r5, #0
 800245c:	2301      	movs	r3, #1
 800245e:	4669      	mov	r1, sp
 8002460:	7156      	strb	r6, [r2, #5]
 8002462:	9700      	str	r7, [sp, #0]
 8002464:	7113      	strb	r3, [r2, #4]
 8002466:	7194      	strb	r4, [r2, #6]
 8002468:	71d4      	strb	r4, [r2, #7]
 800246a:	f7ff f937 	bl	80016dc <GPIO_Init>
 800246e:	2202      	movs	r2, #2
 8002470:	466b      	mov	r3, sp
 8002472:	9200      	str	r2, [sp, #0]
 8002474:	1c28      	adds	r0, r5, #0
 8002476:	2201      	movs	r2, #1
 8002478:	4669      	mov	r1, sp
 800247a:	715e      	strb	r6, [r3, #5]
 800247c:	711a      	strb	r2, [r3, #4]
 800247e:	719c      	strb	r4, [r3, #6]
 8002480:	71dc      	strb	r4, [r3, #7]
 8002482:	f7ff f92b 	bl	80016dc <GPIO_Init>
 8002486:	4b05      	ldr	r3, [pc, #20]	; (800249c <gpio_init+0x98>)
 8002488:	2208      	movs	r2, #8
 800248a:	851a      	strh	r2, [r3, #40]	; 0x28
 800248c:	2380      	movs	r3, #128	; 0x80
 800248e:	005b      	lsls	r3, r3, #1
 8002490:	2202      	movs	r2, #2
 8002492:	852b      	strh	r3, [r5, #40]	; 0x28
 8002494:	852f      	strh	r7, [r5, #40]	; 0x28
 8002496:	852a      	strh	r2, [r5, #40]	; 0x28
 8002498:	bdf7      	pop	{r0, r1, r2, r4, r5, r6, r7, pc}
 800249a:	46c0      	nop			; (mov r8, r8)
 800249c:	48000400 	.word	0x48000400

080024a0 <led_on>:
 80024a0:	2808      	cmp	r0, #8
 80024a2:	d101      	bne.n	80024a8 <led_on+0x8>
 80024a4:	4b07      	ldr	r3, [pc, #28]	; (80024c4 <led_on+0x24>)
 80024a6:	e00b      	b.n	80024c0 <led_on+0x20>
 80024a8:	2380      	movs	r3, #128	; 0x80
 80024aa:	005b      	lsls	r3, r3, #1
 80024ac:	4298      	cmp	r0, r3
 80024ae:	d005      	beq.n	80024bc <led_on+0x1c>
 80024b0:	2380      	movs	r3, #128	; 0x80
 80024b2:	011b      	lsls	r3, r3, #4
 80024b4:	4298      	cmp	r0, r3
 80024b6:	d001      	beq.n	80024bc <led_on+0x1c>
 80024b8:	2802      	cmp	r0, #2
 80024ba:	d102      	bne.n	80024c2 <led_on+0x22>
 80024bc:	2390      	movs	r3, #144	; 0x90
 80024be:	05db      	lsls	r3, r3, #23
 80024c0:	6198      	str	r0, [r3, #24]
 80024c2:	4770      	bx	lr
 80024c4:	48000400 	.word	0x48000400

080024c8 <led_off>:
 80024c8:	2808      	cmp	r0, #8
 80024ca:	d101      	bne.n	80024d0 <led_off+0x8>
 80024cc:	4b07      	ldr	r3, [pc, #28]	; (80024ec <led_off+0x24>)
 80024ce:	e00b      	b.n	80024e8 <led_off+0x20>
 80024d0:	2380      	movs	r3, #128	; 0x80
 80024d2:	005b      	lsls	r3, r3, #1
 80024d4:	4298      	cmp	r0, r3
 80024d6:	d005      	beq.n	80024e4 <led_off+0x1c>
 80024d8:	2380      	movs	r3, #128	; 0x80
 80024da:	011b      	lsls	r3, r3, #4
 80024dc:	4298      	cmp	r0, r3
 80024de:	d001      	beq.n	80024e4 <led_off+0x1c>
 80024e0:	2802      	cmp	r0, #2
 80024e2:	d102      	bne.n	80024ea <led_off+0x22>
 80024e4:	2390      	movs	r3, #144	; 0x90
 80024e6:	05db      	lsls	r3, r3, #23
 80024e8:	8518      	strh	r0, [r3, #40]	; 0x28
 80024ea:	4770      	bx	lr
 80024ec:	48000400 	.word	0x48000400

080024f0 <Default_Handler>:
 80024f0:	4770      	bx	lr
	...

080024f4 <HardFault_Handler>:
 80024f4:	2008      	movs	r0, #8
 80024f6:	f7ff ffd3 	bl	80024a0 <led_on>
 80024fa:	4b07      	ldr	r3, [pc, #28]	; (8002518 <HardFault_Handler+0x24>)
 80024fc:	3b01      	subs	r3, #1
 80024fe:	2b00      	cmp	r3, #0
 8002500:	d001      	beq.n	8002506 <HardFault_Handler+0x12>
 8002502:	46c0      	nop			; (mov r8, r8)
 8002504:	e7fa      	b.n	80024fc <HardFault_Handler+0x8>
 8002506:	2008      	movs	r0, #8
 8002508:	f7ff ffde 	bl	80024c8 <led_off>
 800250c:	4b02      	ldr	r3, [pc, #8]	; (8002518 <HardFault_Handler+0x24>)
 800250e:	3b01      	subs	r3, #1
 8002510:	2b00      	cmp	r3, #0
 8002512:	d0ef      	beq.n	80024f4 <HardFault_Handler>
 8002514:	46c0      	nop			; (mov r8, r8)
 8002516:	e7fa      	b.n	800250e <HardFault_Handler+0x1a>
 8002518:	002dc6c1 	.word	0x002dc6c1

0800251c <_reset_init>:
 800251c:	4a07      	ldr	r2, [pc, #28]	; (800253c <_reset_init+0x20>)
 800251e:	4908      	ldr	r1, [pc, #32]	; (8002540 <_reset_init+0x24>)
 8002520:	2300      	movs	r3, #0
 8002522:	1a89      	subs	r1, r1, r2
 8002524:	1089      	asrs	r1, r1, #2
 8002526:	1c10      	adds	r0, r2, #0
 8002528:	428b      	cmp	r3, r1
 800252a:	d005      	beq.n	8002538 <_reset_init+0x1c>
 800252c:	4c05      	ldr	r4, [pc, #20]	; (8002544 <_reset_init+0x28>)
 800252e:	009a      	lsls	r2, r3, #2
 8002530:	58a4      	ldr	r4, [r4, r2]
 8002532:	3301      	adds	r3, #1
 8002534:	5084      	str	r4, [r0, r2]
 8002536:	e7f7      	b.n	8002528 <_reset_init+0xc>
 8002538:	f7fe fc64 	bl	8000e04 <main>
 800253c:	20000000 	.word	0x20000000
 8002540:	20000010 	.word	0x20000010
 8002544:	08002d88 	.word	0x08002d88

08002548 <__gnu_thumb1_case_uqi>:
 8002548:	b402      	push	{r1}
 800254a:	4671      	mov	r1, lr
 800254c:	0849      	lsrs	r1, r1, #1
 800254e:	0049      	lsls	r1, r1, #1
 8002550:	5c09      	ldrb	r1, [r1, r0]
 8002552:	0049      	lsls	r1, r1, #1
 8002554:	448e      	add	lr, r1
 8002556:	bc02      	pop	{r1}
 8002558:	4770      	bx	lr
 800255a:	46c0      	nop			; (mov r8, r8)

0800255c <__aeabi_uidiv>:
 800255c:	2900      	cmp	r1, #0
 800255e:	d034      	beq.n	80025ca <.udivsi3_skip_div0_test+0x6a>

08002560 <.udivsi3_skip_div0_test>:
 8002560:	2301      	movs	r3, #1
 8002562:	2200      	movs	r2, #0
 8002564:	b410      	push	{r4}
 8002566:	4288      	cmp	r0, r1
 8002568:	d32c      	bcc.n	80025c4 <.udivsi3_skip_div0_test+0x64>
 800256a:	2401      	movs	r4, #1
 800256c:	0724      	lsls	r4, r4, #28
 800256e:	42a1      	cmp	r1, r4
 8002570:	d204      	bcs.n	800257c <.udivsi3_skip_div0_test+0x1c>
 8002572:	4281      	cmp	r1, r0
 8002574:	d202      	bcs.n	800257c <.udivsi3_skip_div0_test+0x1c>
 8002576:	0109      	lsls	r1, r1, #4
 8002578:	011b      	lsls	r3, r3, #4
 800257a:	e7f8      	b.n	800256e <.udivsi3_skip_div0_test+0xe>
 800257c:	00e4      	lsls	r4, r4, #3
 800257e:	42a1      	cmp	r1, r4
 8002580:	d204      	bcs.n	800258c <.udivsi3_skip_div0_test+0x2c>
 8002582:	4281      	cmp	r1, r0
 8002584:	d202      	bcs.n	800258c <.udivsi3_skip_div0_test+0x2c>
 8002586:	0049      	lsls	r1, r1, #1
 8002588:	005b      	lsls	r3, r3, #1
 800258a:	e7f8      	b.n	800257e <.udivsi3_skip_div0_test+0x1e>
 800258c:	4288      	cmp	r0, r1
 800258e:	d301      	bcc.n	8002594 <.udivsi3_skip_div0_test+0x34>
 8002590:	1a40      	subs	r0, r0, r1
 8002592:	431a      	orrs	r2, r3
 8002594:	084c      	lsrs	r4, r1, #1
 8002596:	42a0      	cmp	r0, r4
 8002598:	d302      	bcc.n	80025a0 <.udivsi3_skip_div0_test+0x40>
 800259a:	1b00      	subs	r0, r0, r4
 800259c:	085c      	lsrs	r4, r3, #1
 800259e:	4322      	orrs	r2, r4
 80025a0:	088c      	lsrs	r4, r1, #2
 80025a2:	42a0      	cmp	r0, r4
 80025a4:	d302      	bcc.n	80025ac <.udivsi3_skip_div0_test+0x4c>
 80025a6:	1b00      	subs	r0, r0, r4
 80025a8:	089c      	lsrs	r4, r3, #2
 80025aa:	4322      	orrs	r2, r4
 80025ac:	08cc      	lsrs	r4, r1, #3
 80025ae:	42a0      	cmp	r0, r4
 80025b0:	d302      	bcc.n	80025b8 <.udivsi3_skip_div0_test+0x58>
 80025b2:	1b00      	subs	r0, r0, r4
 80025b4:	08dc      	lsrs	r4, r3, #3
 80025b6:	4322      	orrs	r2, r4
 80025b8:	2800      	cmp	r0, #0
 80025ba:	d003      	beq.n	80025c4 <.udivsi3_skip_div0_test+0x64>
 80025bc:	091b      	lsrs	r3, r3, #4
 80025be:	d001      	beq.n	80025c4 <.udivsi3_skip_div0_test+0x64>
 80025c0:	0909      	lsrs	r1, r1, #4
 80025c2:	e7e3      	b.n	800258c <.udivsi3_skip_div0_test+0x2c>
 80025c4:	1c10      	adds	r0, r2, #0
 80025c6:	bc10      	pop	{r4}
 80025c8:	4770      	bx	lr
 80025ca:	2800      	cmp	r0, #0
 80025cc:	d001      	beq.n	80025d2 <.udivsi3_skip_div0_test+0x72>
 80025ce:	2000      	movs	r0, #0
 80025d0:	43c0      	mvns	r0, r0
 80025d2:	b407      	push	{r0, r1, r2}
 80025d4:	4802      	ldr	r0, [pc, #8]	; (80025e0 <.udivsi3_skip_div0_test+0x80>)
 80025d6:	a102      	add	r1, pc, #8	; (adr r1, 80025e0 <.udivsi3_skip_div0_test+0x80>)
 80025d8:	1840      	adds	r0, r0, r1
 80025da:	9002      	str	r0, [sp, #8]
 80025dc:	bd03      	pop	{r0, r1, pc}
 80025de:	46c0      	nop			; (mov r8, r8)
 80025e0:	000000d9 	.word	0x000000d9

080025e4 <__aeabi_uidivmod>:
 80025e4:	2900      	cmp	r1, #0
 80025e6:	d0f0      	beq.n	80025ca <.udivsi3_skip_div0_test+0x6a>
 80025e8:	b503      	push	{r0, r1, lr}
 80025ea:	f7ff ffb9 	bl	8002560 <.udivsi3_skip_div0_test>
 80025ee:	bc0e      	pop	{r1, r2, r3}
 80025f0:	4342      	muls	r2, r0
 80025f2:	1a89      	subs	r1, r1, r2
 80025f4:	4718      	bx	r3
 80025f6:	46c0      	nop			; (mov r8, r8)

080025f8 <__aeabi_idiv>:
 80025f8:	2900      	cmp	r1, #0
 80025fa:	d041      	beq.n	8002680 <.divsi3_skip_div0_test+0x84>

080025fc <.divsi3_skip_div0_test>:
 80025fc:	b410      	push	{r4}
 80025fe:	1c04      	adds	r4, r0, #0
 8002600:	404c      	eors	r4, r1
 8002602:	46a4      	mov	ip, r4
 8002604:	2301      	movs	r3, #1
 8002606:	2200      	movs	r2, #0
 8002608:	2900      	cmp	r1, #0
 800260a:	d500      	bpl.n	800260e <.divsi3_skip_div0_test+0x12>
 800260c:	4249      	negs	r1, r1
 800260e:	2800      	cmp	r0, #0
 8002610:	d500      	bpl.n	8002614 <.divsi3_skip_div0_test+0x18>
 8002612:	4240      	negs	r0, r0
 8002614:	4288      	cmp	r0, r1
 8002616:	d32c      	bcc.n	8002672 <.divsi3_skip_div0_test+0x76>
 8002618:	2401      	movs	r4, #1
 800261a:	0724      	lsls	r4, r4, #28
 800261c:	42a1      	cmp	r1, r4
 800261e:	d204      	bcs.n	800262a <.divsi3_skip_div0_test+0x2e>
 8002620:	4281      	cmp	r1, r0
 8002622:	d202      	bcs.n	800262a <.divsi3_skip_div0_test+0x2e>
 8002624:	0109      	lsls	r1, r1, #4
 8002626:	011b      	lsls	r3, r3, #4
 8002628:	e7f8      	b.n	800261c <.divsi3_skip_div0_test+0x20>
 800262a:	00e4      	lsls	r4, r4, #3
 800262c:	42a1      	cmp	r1, r4
 800262e:	d204      	bcs.n	800263a <.divsi3_skip_div0_test+0x3e>
 8002630:	4281      	cmp	r1, r0
 8002632:	d202      	bcs.n	800263a <.divsi3_skip_div0_test+0x3e>
 8002634:	0049      	lsls	r1, r1, #1
 8002636:	005b      	lsls	r3, r3, #1
 8002638:	e7f8      	b.n	800262c <.divsi3_skip_div0_test+0x30>
 800263a:	4288      	cmp	r0, r1
 800263c:	d301      	bcc.n	8002642 <.divsi3_skip_div0_test+0x46>
 800263e:	1a40      	subs	r0, r0, r1
 8002640:	431a      	orrs	r2, r3
 8002642:	084c      	lsrs	r4, r1, #1
 8002644:	42a0      	cmp	r0, r4
 8002646:	d302      	bcc.n	800264e <.divsi3_skip_div0_test+0x52>
 8002648:	1b00      	subs	r0, r0, r4
 800264a:	085c      	lsrs	r4, r3, #1
 800264c:	4322      	orrs	r2, r4
 800264e:	088c      	lsrs	r4, r1, #2
 8002650:	42a0      	cmp	r0, r4
 8002652:	d302      	bcc.n	800265a <.divsi3_skip_div0_test+0x5e>
 8002654:	1b00      	subs	r0, r0, r4
 8002656:	089c      	lsrs	r4, r3, #2
 8002658:	4322      	orrs	r2, r4
 800265a:	08cc      	lsrs	r4, r1, #3
 800265c:	42a0      	cmp	r0, r4
 800265e:	d302      	bcc.n	8002666 <.divsi3_skip_div0_test+0x6a>
 8002660:	1b00      	subs	r0, r0, r4
 8002662:	08dc      	lsrs	r4, r3, #3
 8002664:	4322      	orrs	r2, r4
 8002666:	2800      	cmp	r0, #0
 8002668:	d003      	beq.n	8002672 <.divsi3_skip_div0_test+0x76>
 800266a:	091b      	lsrs	r3, r3, #4
 800266c:	d001      	beq.n	8002672 <.divsi3_skip_div0_test+0x76>
 800266e:	0909      	lsrs	r1, r1, #4
 8002670:	e7e3      	b.n	800263a <.divsi3_skip_div0_test+0x3e>
 8002672:	1c10      	adds	r0, r2, #0
 8002674:	4664      	mov	r4, ip
 8002676:	2c00      	cmp	r4, #0
 8002678:	d500      	bpl.n	800267c <.divsi3_skip_div0_test+0x80>
 800267a:	4240      	negs	r0, r0
 800267c:	bc10      	pop	{r4}
 800267e:	4770      	bx	lr
 8002680:	2800      	cmp	r0, #0
 8002682:	d006      	beq.n	8002692 <.divsi3_skip_div0_test+0x96>
 8002684:	db03      	blt.n	800268e <.divsi3_skip_div0_test+0x92>
 8002686:	2000      	movs	r0, #0
 8002688:	43c0      	mvns	r0, r0
 800268a:	0840      	lsrs	r0, r0, #1
 800268c:	e001      	b.n	8002692 <.divsi3_skip_div0_test+0x96>
 800268e:	2080      	movs	r0, #128	; 0x80
 8002690:	0600      	lsls	r0, r0, #24
 8002692:	b407      	push	{r0, r1, r2}
 8002694:	4802      	ldr	r0, [pc, #8]	; (80026a0 <.divsi3_skip_div0_test+0xa4>)
 8002696:	a102      	add	r1, pc, #8	; (adr r1, 80026a0 <.divsi3_skip_div0_test+0xa4>)
 8002698:	1840      	adds	r0, r0, r1
 800269a:	9002      	str	r0, [sp, #8]
 800269c:	bd03      	pop	{r0, r1, pc}
 800269e:	46c0      	nop			; (mov r8, r8)
 80026a0:	00000019 	.word	0x00000019

080026a4 <__aeabi_idivmod>:
 80026a4:	2900      	cmp	r1, #0
 80026a6:	d0eb      	beq.n	8002680 <.divsi3_skip_div0_test+0x84>
 80026a8:	b503      	push	{r0, r1, lr}
 80026aa:	f7ff ffa7 	bl	80025fc <.divsi3_skip_div0_test>
 80026ae:	bc0e      	pop	{r1, r2, r3}
 80026b0:	4342      	muls	r2, r0
 80026b2:	1a89      	subs	r1, r1, r2
 80026b4:	4718      	bx	r3
 80026b6:	46c0      	nop			; (mov r8, r8)

080026b8 <__aeabi_idiv0>:
 80026b8:	4770      	bx	lr
 80026ba:	46c0      	nop			; (mov r8, r8)

080026bc <_init>:
 80026bc:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
 80026be:	46c0      	nop			; (mov r8, r8)
 80026c0:	bcf8      	pop	{r3, r4, r5, r6, r7}
 80026c2:	bc08      	pop	{r3}
 80026c4:	469e      	mov	lr, r3
 80026c6:	4770      	bx	lr

080026c8 <_fini>:
 80026c8:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
 80026ca:	46c0      	nop			; (mov r8, r8)
 80026cc:	bcf8      	pop	{r3, r4, r5, r6, r7}
 80026ce:	bc08      	pop	{r3}
 80026d0:	469e      	mov	lr, r3
 80026d2:	4770      	bx	lr
 80026d4:	69647473 	.word	0x69647473
 80026d8:	6e69206f 	.word	0x6e69206f
 80026dc:	64207469 	.word	0x64207469
 80026e0:	0a656e6f 	.word	0x0a656e6f
	...

080026e5 <font_data>:
	...
 80026f5:	3c180000 18183c3c 18180018 00000000     ...<<<..........
 8002705:	63636300 00000022 00000000 00000000     .ccc"...........
 8002715:	36000000 36367f36 36367f36 00000000     ...66.666.66....
 8002725:	633e0c0c 033e6061 3e634303 00000c0c     ..>ca`>..Cc>....
 8002735:	00000000 06636100 6333180c 00000000     .....ac...3c....
 8002745:	1c000000 3b1c3636 3b66666e 00000000     ....66.;nff;....
 8002755:	30303000 00000060 00000000 00000000     .000`...........
 8002765:	180c0000 30303018 0c181830 00000000     .....0000.......
 8002775:	0c180000 0606060c 180c0c06 00000000     ................
 8002785:	00000000 ff3c6642 0042663c 00000000     ....Bf<.<fB.....
 8002795:	00000000 ff181818 00181818 00000000     ................
	...
 80027ad:	18180000 00003018 00000000 ff000000     .....0..........
	...
 80027cd:	18180000 00000000 03010000 381c0e07     ...............8
 80027dd:	80c0e070 00000000 633e0000 6b6b6363     p.........>ccckk
 80027ed:	3e636363 00000000 1c0c0000 0c0c0c3c     ccc>........<...
 80027fd:	3f0c0c0c 00000000 633e0000 180c0603     ...?......>c....
 800280d:	7f636130 00000000 633e0000 031e0303     0ac.......>c....
 800281d:	3e630303 00000000 0e060000 6666361e     ..c>.........6ff
 800282d:	0f06067f 00000000 607f0000 037e6060     ...........```~.
 800283d:	3e736303 00000000 301c0000 637e6060     .cs>.......0``~c
 800284d:	3e636363 00000000 637f0000 0c060603     ccc>.......c....
 800285d:	1818180c 00000000 633e0000 633e6363     ..........>ccc>c
 800286d:	3e636363 00000000 633e0000 3f636363     ccc>......>cccc?
 800287d:	3c060303 00000000 00000000 00181800     ...<............
 800288d:	18180000 00000000 00000000 00181800     ................
 800289d:	18180000 00003018 06000000 6030180c     .....0........0`
 80028ad:	060c1830 00000000 00000000 007e0000     0.............~.
 80028bd:	00007e00 00000000 60000000 060c1830     .~.........`0...
 80028cd:	6030180c 00000000 633e0000 0c0c0663     ..0`......>cc...
 80028dd:	0c0c000c 00000000 633e0000 6b6b6f63     ..........>ccokk
 80028ed:	3e60606e 00000000 1c080000 63636336     n``>........6ccc
 80028fd:	6363637f 00000000 337e0000 333e3333     .ccc......~333>3
 800290d:	7e333333 00000000 331e0000 60606061     333~.......3a```
 800291d:	1e336160 00000000 367c0000 33333333     `a3.......|63333
 800292d:	7c363333 00000000 337f0000 343c3431     336|.......314<4
 800293d:	7f333130 00000000 337f0000 343c3431     013........314<4
 800294d:	78303030 00000000 331e0000 6f606061     000x.......3a``o
 800295d:	1d376363 00000000 63630000 637f6363     cc7.......cccc.c
 800296d:	63636363 00000000 183c0000 18181818     cccc......<.....
 800297d:	3c181818 00000000 060f0000 06060606     ...<............
 800298d:	3c666606 00000000 33730000 363c3636     .ff<......s366<6
 800299d:	73333336 00000000 30780000 30303030     633s......x00000
 80029ad:	7f333130 00000000 77630000 63636b7f     013.......cw.kcc
 80029bd:	63636363 00000000 63630000 6f7f7b73     cccc......ccs{.o
 80029cd:	63636367 00000000 361c0000 63636363     gccc.......6cccc
 80029dd:	1c366363 00000000 337e0000 303e3333     cc6.......~333>0
 80029ed:	78303030 00000000 633e0000 63636363     000x......>ccccc
 80029fd:	3e6f6b63 00000706 337e0000 363e3333     cko>......~333>6
 8002a0d:	73333336 00000000 633e0000 061c3063     633s......>cc0..
 8002a1d:	3e636303 00000000 dbff0000 18181899     .cc>............
 8002a2d:	3c181818 00000000 63630000 63636363     ...<......cccccc
 8002a3d:	3e636363 00000000 63630000 63636363     ccc>......cccccc
 8002a4d:	081c3663 00000000 63630000 6b636363     c6........ccccck
 8002a5d:	36367f6b 00000000 c3c30000 18183c66     k.66........f<..
 8002a6d:	c3c3663c 00000000 c3c30000 183c66c3     <f...........f<.
 8002a7d:	3c181818 00000000 637f0000 180c0643     ...<.......cC...
 8002a8d:	7f636130 00000000 303c0000 30303030     0ac.......<00000
 8002a9d:	3c303030 00000000 c0800000 1c3870e0     000<.........p8.
 8002aad:	0103070e 00000000 0c3c0000 0c0c0c0c     ..........<.....
 8002abd:	3c0c0c0c 00000000 63361c08 00000000     ...<......6c....
	...
 8002ae1:	000000ff 000c1818 00000000 00000000     ................
	...
 8002af9:	06463c00 3b66663e 00000000 30700000     .<F.>ff;......p0
 8002b09:	33363c30 6e333333 00000000 00000000     0<63333n........
 8002b19:	60633e00 3e636060 00000000 060e0000     .>c```c>........
 8002b29:	66361e06 3b666666 00000000 00000000     ..6ffff;........
 8002b39:	63633e00 3e63607e 00000000 361c0000     .>cc~`c>.......6
 8002b49:	307c3032 78303030 00000000 00000000     20|0000x........
 8002b59:	66663b00 063e6666 00003c66 30700000     .;ffff>.f<....p0
 8002b69:	333b3630 73333333 00000000 0c0c0000     06;3333s........
 8002b79:	0c0c1c00 1e0c0c0c 00000000 06060000     ................
 8002b89:	06060e00 66060606 00003c66 30700000     .......ff<....p0
 8002b99:	36333330 7333363c 00000000 0c1c0000     0336<63s........
 8002ba9:	0c0c0c0c 1e0c0c0c 00000000 00000000     ................
 8002bb9:	6b7f6e00 6b6b6b6b 00000000 00000000     .n.kkkkk........
 8002bc9:	33336e00 33333333 00000000 00000000     .n333333........
 8002bd9:	63633e00 3e636363 00000000 00000000     .>ccccc>........
 8002be9:	33336e00 303e3333 00007830 00000000     .n3333>00x......
 8002bf9:	66663b00 063e6666 00000f06 00000000     .;ffff>.........
 8002c09:	333b6e00 78303030 00000000 00000000     .n;3000x........
 8002c19:	38633e00 3e63030e 00000000 18080000     .>c8..c>........
 8002c29:	18187e18 0e1b1818 00000000 00000000     .~..............
 8002c39:	66666600 3b666666 00000000 00000000     .ffffff;........
 8002c49:	36636300 081c1c36 00000000 00000000     .cc66...........
 8002c59:	63636300 367f6b6b 00000000 00000000     .ccckk.6........
 8002c69:	1c366300 63361c1c 00000000 00000000     .c6...6c........
 8002c79:	63636300 033f6363 00003c06 00000000     .ccccc?..<......
 8002c89:	0c667f00 7f633018 00000000 180e0000     ..f..0c.........
 8002c99:	18701818 0e181818 00000000 18180000     ..p.............
 8002ca9:	00181818 18181818 00000018 18700000     ..............p.
 8002cb9:	180e1818 70181818 00000000 6e3b0000     .......p......;n
	...
 8002cd5:	d8d87000 00000070 00000000 00000000     .p..p...........
 8002ce5:	6c65770a 656d6f63 206f7420 757a7553     .welcome to Suzu
 8002cf5:	534f6168 5e5f5e20 322e3220 420a302e     haOS ^_^ 2.2.0.B
 8002d05:	444c4955 72704120 20362020 36313032     UILD Apr  6 2016
 8002d15:	3a393120 323a3631 25000a35 203a2075      19:16:25..%u : 
 8002d25:	255b000a 69252069 5d692520 6f620020     ..[%i %i %i] .bo
 8002d35:	6e69746f 72662067 25206d6f 72000a75     oting from %u..r
 8002d45:	73206d61 74726174 20752520 6172000a     am start %u ..ra
 8002d55:	6973206d 2520657a 000a2075 206d6172     m size %u ..ram 
 8002d65:	65657266 20752520 6568000a 73207061     free %u ..heap s
 8002d75:	74726174 20752520 0a0a000a 00000000              tart %u .......

08002d84 <__EH_FRAME_BEGIN__>:
 8002d84:	00000000                                ....
