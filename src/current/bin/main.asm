
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
 80000dc:	200000c4 	.word	0x200000c4
 80000e0:	2000005c 	.word	0x2000005c

080000e4 <null_thread>:
 80000e4:	b508      	push	{r3, lr}
 80000e6:	f001 fa1f 	bl	8001528 <sleep>
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
 800014c:	2000005c 	.word	0x2000005c
 8000150:	200000c4 	.word	0x200000c4

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
 80001a4:	200000c4 	.word	0x200000c4
 80001a8:	2000005c 	.word	0x2000005c

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
 80001cc:	200000c4 	.word	0x200000c4

080001d0 <kernel_start>:
 80001d0:	b508      	push	{r3, lr}
 80001d2:	f001 f99d 	bl	8001510 <sys_tick_init>
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
 8000254:	2000005c 	.word	0x2000005c
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
 8000290:	2000005c 	.word	0x2000005c
 8000294:	200000c4 	.word	0x200000c4
 8000298:	200000e4 	.word	0x200000e4
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
 80002d8:	2000005c 	.word	0x2000005c

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
 80002fc:	2000005c 	.word	0x2000005c

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
 800032c:	20000164 	.word	0x20000164
 8000330:	20000184 	.word	0x20000184

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
 8000350:	200001c4 	.word	0x200001c4

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
 8000378:	200001d0 	.word	0x200001d0

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
 8000398:	f002 fc18 	bl	8002bcc <__aeabi_idivmod>
 800039c:	3130      	adds	r1, #48	; 0x30
 800039e:	5571      	strb	r1, [r6, r5]
 80003a0:	1c20      	adds	r0, r4, #0
 80003a2:	210a      	movs	r1, #10
 80003a4:	f002 fbbc 	bl	8002b20 <__aeabi_idiv>
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
 80003d6:	f002 fb99 	bl	8002b0c <__aeabi_uidivmod>
 80003da:	3130      	adds	r1, #48	; 0x30
 80003dc:	5531      	strb	r1, [r6, r4]
 80003de:	1c28      	adds	r0, r5, #0
 80003e0:	210a      	movs	r1, #10
 80003e2:	f002 fb4f 	bl	8002a84 <__aeabi_uidiv>
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
 80004c4:	200001cc 	.word	0x200001cc

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
 8000508:	200001c4 	.word	0x200001c4
 800050c:	200001c8 	.word	0x200001c8
 8000510:	200001d0 	.word	0x200001d0
 8000514:	200001cc 	.word	0x200001cc
 8000518:	08002bfc 	.word	0x08002bfc

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
 80005e4:	200001d4 	.word	0x200001d4

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
 800063c:	200001d4 	.word	0x200001d4

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
 80006d4:	200001da 	.word	0x200001da

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
 8000794:	200001e6 	.word	0x200001e6

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
 80007cc:	200001e6 	.word	0x200001e6

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
 8000864:	200001e6 	.word	0x200001e6

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
 8000934:	200001e4 	.word	0x200001e4
 8000938:	200005e6 	.word	0x200005e6
 800093c:	200001e6 	.word	0x200001e6

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
 80009f4:	200001e4 	.word	0x200001e4
 80009f8:	200005e6 	.word	0x200005e6

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
 8000a50:	08002c0d 	.word	0x08002c0d

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
 8000a74:	f002 f8aa 	bl	8002bcc <__aeabi_idivmod>
 8000a78:	3130      	adds	r1, #48	; 0x30
 8000a7a:	5571      	strb	r1, [r6, r5]
 8000a7c:	1c20      	adds	r0, r4, #0
 8000a7e:	210a      	movs	r1, #10
 8000a80:	f002 f84e 	bl	8002b20 <__aeabi_idiv>
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
 8000ba8:	200005e8 	.word	0x200005e8

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
 8000bf8:	f001 ff92 	bl	8002b20 <__aeabi_idiv>
 8000bfc:	2164      	movs	r1, #100	; 0x64
 8000bfe:	81a0      	strh	r0, [r4, #12]
 8000c00:	9801      	ldr	r0, [sp, #4]
 8000c02:	f001 ff8d 	bl	8002b20 <__aeabi_idiv>
 8000c06:	2164      	movs	r1, #100	; 0x64
 8000c08:	81e0      	strh	r0, [r4, #14]
 8000c0a:	1c30      	adds	r0, r6, #0
 8000c0c:	f001 ff88 	bl	8002b20 <__aeabi_idiv>
 8000c10:	6165      	str	r5, [r4, #20]
 8000c12:	61a5      	str	r5, [r4, #24]
 8000c14:	61e5      	str	r5, [r4, #28]
 8000c16:	8220      	strh	r0, [r4, #16]
 8000c18:	bdf7      	pop	{r0, r1, r2, r4, r5, r6, r7, pc}
 8000c1a:	46c0      	nop			; (mov r8, r8)
 8000c1c:	200005e8 	.word	0x200005e8

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
 8000c52:	f001 feb9 	bl	80029c8 <led_on>
 8000c56:	f7ff fcc7 	bl	80005e8 <hmc5883_read>
 8000c5a:	f7ff ff2f 	bl	8000abc <mpu6050_read>
 8000c5e:	f7ff fcef 	bl	8000640 <apds9950_read>
 8000c62:	2008      	movs	r0, #8
 8000c64:	f001 fec4 	bl	80029f0 <led_off>
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
 8000cd4:	200005e8 	.word	0x200005e8
 8000cd8:	200001d4 	.word	0x200001d4
 8000cdc:	200001da 	.word	0x200001da

08000ce0 <main_thread>:
 8000ce0:	b538      	push	{r3, r4, r5, lr}
 8000ce2:	2008      	movs	r0, #8
 8000ce4:	f001 fe70 	bl	80029c8 <led_on>
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
 8000d06:	f001 fe5f 	bl	80029c8 <led_on>
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
 8000d68:	f001 fe42 	bl	80029f0 <led_off>
 8000d6c:	20fa      	movs	r0, #250	; 0xfa
 8000d6e:	0080      	lsls	r0, r0, #2
 8000d70:	f000 f8d8 	bl	8000f24 <timer_delay_ms>
 8000d74:	e7c4      	b.n	8000d00 <main_thread+0x20>
 8000d76:	46c0      	nop			; (mov r8, r8)
 8000d78:	0800320d 	.word	0x0800320d
 8000d7c:	2000060c 	.word	0x2000060c
 8000d80:	08000c21 	.word	0x08000c21
 8000d84:	08003248 	.word	0x08003248
 8000d88:	200005e8 	.word	0x200005e8
 8000d8c:	0800324f 	.word	0x0800324f
 8000d90:	200001d4 	.word	0x200001d4
 8000d94:	200001da 	.word	0x200001da
 8000d98:	080032a8 	.word	0x080032a8

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
 8000dd8:	0800325b 	.word	0x0800325b
 8000ddc:	08002be4 	.word	0x08002be4
 8000de0:	20000000 	.word	0x20000000
 8000de4:	0800326c 	.word	0x0800326c
 8000de8:	20001000 	.word	0x20001000
 8000dec:	0800327b 	.word	0x0800327b
 8000df0:	2000085c 	.word	0x2000085c
 8000df4:	08003289 	.word	0x08003289
 8000df8:	2000085c 	.word	0x2000085c
 8000dfc:	08003297 	.word	0x08003297
 8000e00:	080032a7 	.word	0x080032a7

08000e04 <main>:
 8000e04:	b508      	push	{r3, lr}
 8000e06:	f000 fc35 	bl	8001674 <lib_low_level_init>
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
 8000e28:	2000070c 	.word	0x2000070c
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
 8000e58:	f001 fcf2 	bl	8002840 <RCC_APB1PeriphClockCmd>
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
 8000e72:	f000 fdbb 	bl	80019ec <TIM_TimeBaseInit>
 8000e76:	2080      	movs	r0, #128	; 0x80
 8000e78:	05c0      	lsls	r0, r0, #23
 8000e7a:	2101      	movs	r1, #1
 8000e7c:	f000 fe38 	bl	8001af0 <TIM_Cmd>
 8000e80:	2080      	movs	r0, #128	; 0x80
 8000e82:	2102      	movs	r1, #2
 8000e84:	05c0      	lsls	r0, r0, #23
 8000e86:	2201      	movs	r2, #1
 8000e88:	f000 fe76 	bl	8001b78 <TIM_ITConfig>
 8000e8c:	466a      	mov	r2, sp
 8000e8e:	230f      	movs	r3, #15
 8000e90:	7013      	strb	r3, [r2, #0]
 8000e92:	4668      	mov	r0, sp
 8000e94:	2301      	movs	r3, #1
 8000e96:	7053      	strb	r3, [r2, #1]
 8000e98:	7093      	strb	r3, [r2, #2]
 8000e9a:	f001 fb57 	bl	800254c <NVIC_Init>
 8000e9e:	b005      	add	sp, #20
 8000ea0:	bd30      	pop	{r4, r5, pc}
 8000ea2:	46c0      	nop			; (mov r8, r8)
 8000ea4:	20000820 	.word	0x20000820
 8000ea8:	20000814 	.word	0x20000814
 8000eac:	2000080c 	.word	0x2000080c
 8000eb0:	2000081c 	.word	0x2000081c

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
 8000ef0:	20000820 	.word	0x20000820
 8000ef4:	20000814 	.word	0x20000814
 8000ef8:	2000080c 	.word	0x2000080c
 8000efc:	2000081c 	.word	0x2000081c

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
 8000f20:	2000081c 	.word	0x2000081c

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
 8000f3a:	f000 faf5 	bl	8001528 <sleep>
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
 8000f5c:	20000820 	.word	0x20000820
 8000f60:	20000814 	.word	0x20000814
 8000f64:	2000080c 	.word	0x2000080c

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
 8000f80:	2000080c 	.word	0x2000080c

08000f84 <event_timer_clear_flag>:
 8000f84:	b672      	cpsid	i
 8000f86:	4b03      	ldr	r3, [pc, #12]	; (8000f94 <event_timer_clear_flag+0x10>)
 8000f88:	0040      	lsls	r0, r0, #1
 8000f8a:	2200      	movs	r2, #0
 8000f8c:	52c2      	strh	r2, [r0, r3]
 8000f8e:	b662      	cpsie	i
 8000f90:	4770      	bx	lr
 8000f92:	46c0      	nop			; (mov r8, r8)
 8000f94:	2000080c 	.word	0x2000080c

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
 8000fb2:	f000 ff73 	bl	8001e9c <USART_GetITStatus>
 8000fb6:	2800      	cmp	r0, #0
 8000fb8:	d011      	beq.n	8000fde <USART1_IRQHandler+0x32>
 8000fba:	480b      	ldr	r0, [pc, #44]	; (8000fe8 <USART1_IRQHandler+0x3c>)
 8000fbc:	f000 ff3a 	bl	8001e34 <USART_ReceiveData>
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
 8000fe2:	f000 fff3 	bl	8001fcc <USART_ClearITPendingBit>
 8000fe6:	bd08      	pop	{r3, pc}
 8000fe8:	40013800 	.word	0x40013800
 8000fec:	00050105 	.word	0x00050105
 8000ff0:	20000838 	.word	0x20000838
 8000ff4:	20000828 	.word	0x20000828

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
 8001018:	f001 fbd2 	bl	80027c0 <RCC_AHBPeriphClockCmd>
 800101c:	2080      	movs	r0, #128	; 0x80
 800101e:	01c0      	lsls	r0, r0, #7
 8001020:	2101      	movs	r1, #1
 8001022:	f001 fbed 	bl	8002800 <RCC_APB2PeriphClockCmd>
 8001026:	2090      	movs	r0, #144	; 0x90
 8001028:	05c0      	lsls	r0, r0, #23
 800102a:	2102      	movs	r1, #2
 800102c:	2201      	movs	r2, #1
 800102e:	f000 fc97 	bl	8001960 <GPIO_PinAFConfig>
 8001032:	2090      	movs	r0, #144	; 0x90
 8001034:	05c0      	lsls	r0, r0, #23
 8001036:	210f      	movs	r1, #15
 8001038:	2201      	movs	r2, #1
 800103a:	f000 fc91 	bl	8001960 <GPIO_PinAFConfig>
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
 8001056:	f000 fbff 	bl	8001858 <GPIO_Init>
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
 8001070:	f000 fdd2 	bl	8001c18 <USART_Init>
 8001074:	4806      	ldr	r0, [pc, #24]	; (8001090 <uart_init+0x98>)
 8001076:	1c29      	adds	r1, r5, #0
 8001078:	f000 fe9c 	bl	8001db4 <USART_Cmd>
 800107c:	b009      	add	sp, #36	; 0x24
 800107e:	bd30      	pop	{r4, r5, pc}
 8001080:	20000838 	.word	0x20000838
 8001084:	2000083a 	.word	0x2000083a
 8001088:	20000828 	.word	0x20000828
 800108c:	00008004 	.word	0x00008004
 8001090:	40013800 	.word	0x40013800

08001094 <i2c_delay>:
 8001094:	46c0      	nop			; (mov r8, r8)
 8001096:	4770      	bx	lr

08001098 <SetLowSDA>:
 8001098:	b508      	push	{r3, lr}
 800109a:	b672      	cpsid	i
 800109c:	2390      	movs	r3, #144	; 0x90
 800109e:	2280      	movs	r2, #128	; 0x80
 80010a0:	05db      	lsls	r3, r3, #23
 80010a2:	0112      	lsls	r2, r2, #4
 80010a4:	851a      	strh	r2, [r3, #40]	; 0x28
 80010a6:	685a      	ldr	r2, [r3, #4]
 80010a8:	b292      	uxth	r2, r2
 80010aa:	809a      	strh	r2, [r3, #4]
 80010ac:	6819      	ldr	r1, [r3, #0]
 80010ae:	2280      	movs	r2, #128	; 0x80
 80010b0:	03d2      	lsls	r2, r2, #15
 80010b2:	430a      	orrs	r2, r1
 80010b4:	601a      	str	r2, [r3, #0]
 80010b6:	b662      	cpsie	i
 80010b8:	f7ff ffec 	bl	8001094 <i2c_delay>
 80010bc:	bd08      	pop	{r3, pc}
	...

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
 8001130:	f000 fb92 	bl	8001858 <GPIO_Init>
 8001134:	f7ff ffe5 	bl	8001102 <SetHighSCL>
 8001138:	f7ff ffae 	bl	8001098 <SetLowSDA>
 800113c:	f7ff ffc0 	bl	80010c0 <SetHighSDA>
 8001140:	bd07      	pop	{r0, r1, r2, pc}

08001142 <i2cStart>:
 8001142:	b508      	push	{r3, lr}
 8001144:	f7ff ffdd 	bl	8001102 <SetHighSCL>
 8001148:	f7ff ffba 	bl	80010c0 <SetHighSDA>
 800114c:	f7ff ffd9 	bl	8001102 <SetHighSCL>
 8001150:	f7ff ffa2 	bl	8001098 <SetLowSDA>
 8001154:	f7ff ffcc 	bl	80010f0 <SetLowSCL>
 8001158:	f7ff ffb2 	bl	80010c0 <SetHighSDA>
 800115c:	bd08      	pop	{r3, pc}

0800115e <i2cStop>:
 800115e:	b508      	push	{r3, lr}
 8001160:	f7ff ffc6 	bl	80010f0 <SetLowSCL>
 8001164:	f7ff ff98 	bl	8001098 <SetLowSDA>
 8001168:	f7ff ffcb 	bl	8001102 <SetHighSCL>
 800116c:	f7ff ff94 	bl	8001098 <SetLowSDA>
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
 8001190:	f7ff ff82 	bl	8001098 <SetLowSDA>
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
 80011fe:	f7ff ff4b 	bl	8001098 <SetLowSDA>
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
 8001278:	2b48      	cmp	r3, #72	; 0x48
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
 80012b2:	f001 f937 	bl	8002524 <SPI_SendData8>
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
 80012cc:	2c48      	cmp	r4, #72	; 0x48
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
 80012fc:	f001 fa80 	bl	8002800 <RCC_APB2PeriphClockCmd>
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
 800131a:	f000 fa9d 	bl	8001858 <GPIO_Init>
 800131e:	1c22      	adds	r2, r4, #0
 8001320:	1c38      	adds	r0, r7, #0
 8001322:	2105      	movs	r1, #5
 8001324:	f000 fb1c 	bl	8001960 <GPIO_PinAFConfig>
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
 8001352:	f000 fff3 	bl	800233c <SPI_Init>
 8001356:	1c20      	adds	r0, r4, #0
 8001358:	1c31      	adds	r1, r6, #0
 800135a:	f001 f8c1 	bl	80024e0 <SPI_RxFIFOThresholdConfig>
 800135e:	1c20      	adds	r0, r4, #0
 8001360:	1c29      	adds	r1, r5, #0
 8001362:	f001 f89b 	bl	800249c <SPI_Cmd>
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
 800139c:	2017      	movs	r0, #23
 800139e:	7260      	strb	r0, [r4, #9]
 80013a0:	72a3      	strb	r3, [r4, #10]
 80013a2:	72e3      	strb	r3, [r4, #11]
 80013a4:	7322      	strb	r2, [r4, #12]
 80013a6:	7363      	strb	r3, [r4, #13]
 80013a8:	73a1      	strb	r1, [r4, #14]
 80013aa:	f7ff ff5d 	bl	8001268 <ws2812_clear>
 80013ae:	2400      	movs	r4, #0
 80013b0:	af00      	add	r7, sp, #0
 80013b2:	193d      	adds	r5, r7, r4
 80013b4:	792b      	ldrb	r3, [r5, #4]
 80013b6:	78e8      	ldrb	r0, [r5, #3]
 80013b8:	2118      	movs	r1, #24
 80013ba:	18c0      	adds	r0, r0, r3
 80013bc:	f001 fba6 	bl	8002b0c <__aeabi_uidivmod>
 80013c0:	7868      	ldrb	r0, [r5, #1]
 80013c2:	70e9      	strb	r1, [r5, #3]
 80013c4:	78aa      	ldrb	r2, [r5, #2]
 80013c6:	2503      	movs	r5, #3
 80013c8:	4369      	muls	r1, r5
 80013ca:	466f      	mov	r7, sp
 80013cc:	4b12      	ldr	r3, [pc, #72]	; (8001418 <ws2812_demo+0x9c>)
 80013ce:	5d3e      	ldrb	r6, [r7, r4]
 80013d0:	3405      	adds	r4, #5
 80013d2:	54ce      	strb	r6, [r1, r3]
 80013d4:	1859      	adds	r1, r3, r1
 80013d6:	7048      	strb	r0, [r1, #1]
 80013d8:	708a      	strb	r2, [r1, #2]
 80013da:	f7ff ff53 	bl	8001284 <ws2812_refresh>
 80013de:	2c0f      	cmp	r4, #15
 80013e0:	d1e6      	bne.n	80013b0 <ws2812_demo+0x34>
 80013e2:	480e      	ldr	r0, [pc, #56]	; (800141c <ws2812_demo+0xa0>)
 80013e4:	f7ff fd8c 	bl	8000f00 <timer_delay_loops>
 80013e8:	f7ff fd90 	bl	8000f0c <timer_get_time>
 80013ec:	2164      	movs	r1, #100	; 0x64
 80013ee:	1c04      	adds	r4, r0, #0
 80013f0:	f001 fb8c 	bl	8002b0c <__aeabi_uidivmod>
 80013f4:	2900      	cmp	r1, #0
 80013f6:	d1d8      	bne.n	80013aa <ws2812_demo+0x2e>
 80013f8:	1c20      	adds	r0, r4, #0
 80013fa:	1c29      	adds	r1, r5, #0
 80013fc:	f001 fb86 	bl	8002b0c <__aeabi_uidivmod>
 8001400:	2305      	movs	r3, #5
 8001402:	4359      	muls	r1, r3
 8001404:	a800      	add	r0, sp, #0
 8001406:	1841      	adds	r1, r0, r1
 8001408:	790b      	ldrb	r3, [r1, #4]
 800140a:	2b01      	cmp	r3, #1
 800140c:	d101      	bne.n	8001412 <ws2812_demo+0x96>
 800140e:	2317      	movs	r3, #23
 8001410:	e000      	b.n	8001414 <ws2812_demo+0x98>
 8001412:	2301      	movs	r3, #1
 8001414:	710b      	strb	r3, [r1, #4]
 8001416:	e7c8      	b.n	80013aa <ws2812_demo+0x2e>
 8001418:	20000010 	.word	0x20000010
 800141c:	00030d40 	.word	0x00030d40

08001420 <adc_random_init>:
 8001420:	b570      	push	{r4, r5, r6, lr}
 8001422:	2001      	movs	r0, #1
 8001424:	f000 fecc 	bl	80021c0 <ADC_TempSensorCmd>
 8001428:	2180      	movs	r1, #128	; 0x80
 800142a:	4813      	ldr	r0, [pc, #76]	; (8001478 <adc_random_init+0x58>)
 800142c:	0249      	lsls	r1, r1, #9
 800142e:	2200      	movs	r2, #0
 8001430:	f000 fede 	bl	80021f0 <ADC_ChannelConfig>
 8001434:	2420      	movs	r4, #32
 8001436:	2500      	movs	r5, #0
 8001438:	480f      	ldr	r0, [pc, #60]	; (8001478 <adc_random_init+0x58>)
 800143a:	f000 ff19 	bl	8002270 <ADC_StartOfConversion>
 800143e:	480e      	ldr	r0, [pc, #56]	; (8001478 <adc_random_init+0x58>)
 8001440:	2104      	movs	r1, #4
 8001442:	f000 ff33 	bl	80022ac <ADC_GetFlagStatus>
 8001446:	2800      	cmp	r0, #0
 8001448:	d101      	bne.n	800144e <adc_random_init+0x2e>
 800144a:	46c0      	nop			; (mov r8, r8)
 800144c:	e7f7      	b.n	800143e <adc_random_init+0x1e>
 800144e:	480a      	ldr	r0, [pc, #40]	; (8001478 <adc_random_init+0x58>)
 8001450:	f000 ff1e 	bl	8002290 <ADC_GetConversionValue>
 8001454:	006e      	lsls	r6, r5, #1
 8001456:	2301      	movs	r3, #1
 8001458:	1c05      	adds	r5, r0, #0
 800145a:	401d      	ands	r5, r3
 800145c:	4806      	ldr	r0, [pc, #24]	; (8001478 <adc_random_init+0x58>)
 800145e:	2104      	movs	r1, #4
 8001460:	3c01      	subs	r4, #1
 8001462:	4335      	orrs	r5, r6
 8001464:	f000 ff52 	bl	800230c <ADC_ClearFlag>
 8001468:	2c00      	cmp	r4, #0
 800146a:	d1e5      	bne.n	8001438 <adc_random_init+0x18>
 800146c:	1c20      	adds	r0, r4, #0
 800146e:	f000 fea7 	bl	80021c0 <ADC_TempSensorCmd>
 8001472:	1c28      	adds	r0, r5, #0
 8001474:	bd70      	pop	{r4, r5, r6, pc}
 8001476:	46c0      	nop			; (mov r8, r8)
 8001478:	40012400 	.word	0x40012400

0800147c <adc_init>:
 800147c:	b530      	push	{r4, r5, lr}
 800147e:	2090      	movs	r0, #144	; 0x90
 8001480:	b089      	sub	sp, #36	; 0x24
 8001482:	466a      	mov	r2, sp
 8001484:	2303      	movs	r3, #3
 8001486:	2401      	movs	r4, #1
 8001488:	2500      	movs	r5, #0
 800148a:	05c0      	lsls	r0, r0, #23
 800148c:	4669      	mov	r1, sp
 800148e:	7113      	strb	r3, [r2, #4]
 8001490:	71d5      	strb	r5, [r2, #7]
 8001492:	9400      	str	r4, [sp, #0]
 8001494:	f000 f9e0 	bl	8001858 <GPIO_Init>
 8001498:	2080      	movs	r0, #128	; 0x80
 800149a:	0080      	lsls	r0, r0, #2
 800149c:	1c21      	adds	r1, r4, #0
 800149e:	f001 f9af 	bl	8002800 <RCC_APB2PeriphClockCmd>
 80014a2:	1c28      	adds	r0, r5, #0
 80014a4:	f001 f8a0 	bl	80025e8 <RCC_ADCCLKConfig>
 80014a8:	1c20      	adds	r0, r4, #0
 80014aa:	f001 f889 	bl	80025c0 <RCC_HSI14Cmd>
 80014ae:	2061      	movs	r0, #97	; 0x61
 80014b0:	f001 fa06 	bl	80028c0 <RCC_GetFlagStatus>
 80014b4:	2800      	cmp	r0, #0
 80014b6:	d101      	bne.n	80014bc <adc_init+0x40>
 80014b8:	46c0      	nop			; (mov r8, r8)
 80014ba:	e7f8      	b.n	80014ae <adc_init+0x32>
 80014bc:	4811      	ldr	r0, [pc, #68]	; (8001504 <adc_init+0x88>)
 80014be:	f000 fdf9 	bl	80020b4 <ADC_DeInit>
 80014c2:	a902      	add	r1, sp, #8
 80014c4:	2300      	movs	r3, #0
 80014c6:	480f      	ldr	r0, [pc, #60]	; (8001504 <adc_init+0x88>)
 80014c8:	710b      	strb	r3, [r1, #4]
 80014ca:	610b      	str	r3, [r1, #16]
 80014cc:	614b      	str	r3, [r1, #20]
 80014ce:	608b      	str	r3, [r1, #8]
 80014d0:	60cb      	str	r3, [r1, #12]
 80014d2:	9302      	str	r3, [sp, #8]
 80014d4:	f000 fe06 	bl	80020e4 <ADC_Init>
 80014d8:	480a      	ldr	r0, [pc, #40]	; (8001504 <adc_init+0x88>)
 80014da:	f000 fea9 	bl	8002230 <ADC_GetCalibrationFactor>
 80014de:	4809      	ldr	r0, [pc, #36]	; (8001504 <adc_init+0x88>)
 80014e0:	2101      	movs	r1, #1
 80014e2:	f000 fe51 	bl	8002188 <ADC_Cmd>
 80014e6:	4807      	ldr	r0, [pc, #28]	; (8001504 <adc_init+0x88>)
 80014e8:	2101      	movs	r1, #1
 80014ea:	f000 fedf 	bl	80022ac <ADC_GetFlagStatus>
 80014ee:	2800      	cmp	r0, #0
 80014f0:	d101      	bne.n	80014f6 <adc_init+0x7a>
 80014f2:	46c0      	nop			; (mov r8, r8)
 80014f4:	e7f7      	b.n	80014e6 <adc_init+0x6a>
 80014f6:	f7ff ff93 	bl	8001420 <adc_random_init>
 80014fa:	4b03      	ldr	r3, [pc, #12]	; (8001508 <adc_init+0x8c>)
 80014fc:	6018      	str	r0, [r3, #0]
 80014fe:	b009      	add	sp, #36	; 0x24
 8001500:	bd30      	pop	{r4, r5, pc}
 8001502:	46c0      	nop			; (mov r8, r8)
 8001504:	40012400 	.word	0x40012400
 8001508:	20000058 	.word	0x20000058

0800150c <assert_param>:
 800150c:	4770      	bx	lr
	...

08001510 <sys_tick_init>:
 8001510:	4b03      	ldr	r3, [pc, #12]	; (8001520 <sys_tick_init+0x10>)
 8001512:	4a04      	ldr	r2, [pc, #16]	; (8001524 <sys_tick_init+0x14>)
 8001514:	605a      	str	r2, [r3, #4]
 8001516:	2200      	movs	r2, #0
 8001518:	609a      	str	r2, [r3, #8]
 800151a:	2207      	movs	r2, #7
 800151c:	601a      	str	r2, [r3, #0]
 800151e:	4770      	bx	lr
 8001520:	e000e010 	.word	0xe000e010
 8001524:	0000bb80 	.word	0x0000bb80

08001528 <sleep>:
 8001528:	bf30      	wfi
 800152a:	4770      	bx	lr

0800152c <SystemInit>:
 800152c:	4b26      	ldr	r3, [pc, #152]	; (80015c8 <SystemInit+0x9c>)
 800152e:	2201      	movs	r2, #1
 8001530:	6819      	ldr	r1, [r3, #0]
 8001532:	b082      	sub	sp, #8
 8001534:	4311      	orrs	r1, r2
 8001536:	6019      	str	r1, [r3, #0]
 8001538:	6858      	ldr	r0, [r3, #4]
 800153a:	4924      	ldr	r1, [pc, #144]	; (80015cc <SystemInit+0xa0>)
 800153c:	4001      	ands	r1, r0
 800153e:	6059      	str	r1, [r3, #4]
 8001540:	6818      	ldr	r0, [r3, #0]
 8001542:	4923      	ldr	r1, [pc, #140]	; (80015d0 <SystemInit+0xa4>)
 8001544:	4001      	ands	r1, r0
 8001546:	6019      	str	r1, [r3, #0]
 8001548:	6818      	ldr	r0, [r3, #0]
 800154a:	4922      	ldr	r1, [pc, #136]	; (80015d4 <SystemInit+0xa8>)
 800154c:	4001      	ands	r1, r0
 800154e:	6019      	str	r1, [r3, #0]
 8001550:	6858      	ldr	r0, [r3, #4]
 8001552:	4921      	ldr	r1, [pc, #132]	; (80015d8 <SystemInit+0xac>)
 8001554:	4001      	ands	r1, r0
 8001556:	6059      	str	r1, [r3, #4]
 8001558:	6ad9      	ldr	r1, [r3, #44]	; 0x2c
 800155a:	200f      	movs	r0, #15
 800155c:	4381      	bics	r1, r0
 800155e:	62d9      	str	r1, [r3, #44]	; 0x2c
 8001560:	6b18      	ldr	r0, [r3, #48]	; 0x30
 8001562:	491e      	ldr	r1, [pc, #120]	; (80015dc <SystemInit+0xb0>)
 8001564:	4001      	ands	r1, r0
 8001566:	6319      	str	r1, [r3, #48]	; 0x30
 8001568:	6b59      	ldr	r1, [r3, #52]	; 0x34
 800156a:	4391      	bics	r1, r2
 800156c:	2200      	movs	r2, #0
 800156e:	6359      	str	r1, [r3, #52]	; 0x34
 8001570:	609a      	str	r2, [r3, #8]
 8001572:	9200      	str	r2, [sp, #0]
 8001574:	9201      	str	r2, [sp, #4]
 8001576:	4a1a      	ldr	r2, [pc, #104]	; (80015e0 <SystemInit+0xb4>)
 8001578:	2111      	movs	r1, #17
 800157a:	6011      	str	r1, [r2, #0]
 800157c:	685a      	ldr	r2, [r3, #4]
 800157e:	605a      	str	r2, [r3, #4]
 8001580:	685a      	ldr	r2, [r3, #4]
 8001582:	605a      	str	r2, [r3, #4]
 8001584:	6859      	ldr	r1, [r3, #4]
 8001586:	4a17      	ldr	r2, [pc, #92]	; (80015e4 <SystemInit+0xb8>)
 8001588:	400a      	ands	r2, r1
 800158a:	605a      	str	r2, [r3, #4]
 800158c:	6859      	ldr	r1, [r3, #4]
 800158e:	22a0      	movs	r2, #160	; 0xa0
 8001590:	0392      	lsls	r2, r2, #14
 8001592:	430a      	orrs	r2, r1
 8001594:	605a      	str	r2, [r3, #4]
 8001596:	6819      	ldr	r1, [r3, #0]
 8001598:	2280      	movs	r2, #128	; 0x80
 800159a:	0452      	lsls	r2, r2, #17
 800159c:	430a      	orrs	r2, r1
 800159e:	601a      	str	r2, [r3, #0]
 80015a0:	6819      	ldr	r1, [r3, #0]
 80015a2:	4a09      	ldr	r2, [pc, #36]	; (80015c8 <SystemInit+0x9c>)
 80015a4:	0188      	lsls	r0, r1, #6
 80015a6:	d5fb      	bpl.n	80015a0 <SystemInit+0x74>
 80015a8:	6851      	ldr	r1, [r2, #4]
 80015aa:	2003      	movs	r0, #3
 80015ac:	4381      	bics	r1, r0
 80015ae:	6051      	str	r1, [r2, #4]
 80015b0:	6851      	ldr	r1, [r2, #4]
 80015b2:	2002      	movs	r0, #2
 80015b4:	4301      	orrs	r1, r0
 80015b6:	6051      	str	r1, [r2, #4]
 80015b8:	6859      	ldr	r1, [r3, #4]
 80015ba:	220c      	movs	r2, #12
 80015bc:	400a      	ands	r2, r1
 80015be:	2a08      	cmp	r2, #8
 80015c0:	d1fa      	bne.n	80015b8 <SystemInit+0x8c>
 80015c2:	b002      	add	sp, #8
 80015c4:	4770      	bx	lr
 80015c6:	46c0      	nop			; (mov r8, r8)
 80015c8:	40021000 	.word	0x40021000
 80015cc:	f8ffb80c 	.word	0xf8ffb80c
 80015d0:	fef6ffff 	.word	0xfef6ffff
 80015d4:	fffbffff 	.word	0xfffbffff
 80015d8:	ffc0ffff 	.word	0xffc0ffff
 80015dc:	fffffeac 	.word	0xfffffeac
 80015e0:	40022000 	.word	0x40022000
 80015e4:	ffc07fff 	.word	0xffc07fff

080015e8 <TIM16_IRQHandler>:
 80015e8:	4b20      	ldr	r3, [pc, #128]	; (800166c <TIM16_IRQHandler+0x84>)
 80015ea:	799a      	ldrb	r2, [r3, #6]
 80015ec:	78d9      	ldrb	r1, [r3, #3]
 80015ee:	4291      	cmp	r1, r2
 80015f0:	d805      	bhi.n	80015fe <TIM16_IRQHandler+0x16>
 80015f2:	2080      	movs	r0, #128	; 0x80
 80015f4:	2190      	movs	r1, #144	; 0x90
 80015f6:	0040      	lsls	r0, r0, #1
 80015f8:	05c9      	lsls	r1, r1, #23
 80015fa:	8508      	strh	r0, [r1, #40]	; 0x28
 80015fc:	e006      	b.n	800160c <TIM16_IRQHandler+0x24>
 80015fe:	2a00      	cmp	r2, #0
 8001600:	d104      	bne.n	800160c <TIM16_IRQHandler+0x24>
 8001602:	2080      	movs	r0, #128	; 0x80
 8001604:	2190      	movs	r1, #144	; 0x90
 8001606:	0040      	lsls	r0, r0, #1
 8001608:	05c9      	lsls	r1, r1, #23
 800160a:	6188      	str	r0, [r1, #24]
 800160c:	7919      	ldrb	r1, [r3, #4]
 800160e:	4291      	cmp	r1, r2
 8001610:	d805      	bhi.n	800161e <TIM16_IRQHandler+0x36>
 8001612:	2080      	movs	r0, #128	; 0x80
 8001614:	2190      	movs	r1, #144	; 0x90
 8001616:	0100      	lsls	r0, r0, #4
 8001618:	05c9      	lsls	r1, r1, #23
 800161a:	8508      	strh	r0, [r1, #40]	; 0x28
 800161c:	e006      	b.n	800162c <TIM16_IRQHandler+0x44>
 800161e:	2a00      	cmp	r2, #0
 8001620:	d104      	bne.n	800162c <TIM16_IRQHandler+0x44>
 8001622:	2080      	movs	r0, #128	; 0x80
 8001624:	2190      	movs	r1, #144	; 0x90
 8001626:	0100      	lsls	r0, r0, #4
 8001628:	05c9      	lsls	r1, r1, #23
 800162a:	6188      	str	r0, [r1, #24]
 800162c:	7959      	ldrb	r1, [r3, #5]
 800162e:	4291      	cmp	r1, r2
 8001630:	d806      	bhi.n	8001640 <TIM16_IRQHandler+0x58>
 8001632:	2190      	movs	r1, #144	; 0x90
 8001634:	2002      	movs	r0, #2
 8001636:	05c9      	lsls	r1, r1, #23
 8001638:	8508      	strh	r0, [r1, #40]	; 0x28
 800163a:	2a00      	cmp	r2, #0
 800163c:	d006      	beq.n	800164c <TIM16_IRQHandler+0x64>
 800163e:	e00b      	b.n	8001658 <TIM16_IRQHandler+0x70>
 8001640:	2a00      	cmp	r2, #0
 8001642:	d109      	bne.n	8001658 <TIM16_IRQHandler+0x70>
 8001644:	2190      	movs	r1, #144	; 0x90
 8001646:	2002      	movs	r0, #2
 8001648:	05c9      	lsls	r1, r1, #23
 800164a:	6188      	str	r0, [r1, #24]
 800164c:	7819      	ldrb	r1, [r3, #0]
 800164e:	70d9      	strb	r1, [r3, #3]
 8001650:	7859      	ldrb	r1, [r3, #1]
 8001652:	7119      	strb	r1, [r3, #4]
 8001654:	7899      	ldrb	r1, [r3, #2]
 8001656:	7159      	strb	r1, [r3, #5]
 8001658:	3201      	adds	r2, #1
 800165a:	b2d2      	uxtb	r2, r2
 800165c:	2a10      	cmp	r2, #16
 800165e:	d900      	bls.n	8001662 <TIM16_IRQHandler+0x7a>
 8001660:	2200      	movs	r2, #0
 8001662:	719a      	strb	r2, [r3, #6]
 8001664:	4b02      	ldr	r3, [pc, #8]	; (8001670 <TIM16_IRQHandler+0x88>)
 8001666:	2200      	movs	r2, #0
 8001668:	821a      	strh	r2, [r3, #16]
 800166a:	4770      	bx	lr
 800166c:	200000bc 	.word	0x200000bc
 8001670:	40014400 	.word	0x40014400

08001674 <lib_low_level_init>:
 8001674:	b508      	push	{r3, lr}
 8001676:	f7ff ff59 	bl	800152c <SystemInit>
 800167a:	f001 f957 	bl	800292c <gpio_init>
 800167e:	f7ff fcbb 	bl	8000ff8 <uart_init>
 8001682:	f7ff fbd5 	bl	8000e30 <timer_init>
 8001686:	f7ff fd45 	bl	8001114 <i2c_0_init>
 800168a:	f7ff fef7 	bl	800147c <adc_init>
 800168e:	bd08      	pop	{r3, pc}

08001690 <TIM14_IRQHandler>:
 8001690:	b570      	push	{r4, r5, r6, lr}
 8001692:	4b60      	ldr	r3, [pc, #384]	; (8001814 <TIM14_IRQHandler+0x184>)
 8001694:	7818      	ldrb	r0, [r3, #0]
 8001696:	b2c0      	uxtb	r0, r0
 8001698:	2803      	cmp	r0, #3
 800169a:	d83f      	bhi.n	800171c <TIM14_IRQHandler+0x8c>
 800169c:	f001 f9e8 	bl	8002a70 <__gnu_thumb1_case_uqi>
 80016a0:	32220a02 	.word	0x32220a02
 80016a4:	2280      	movs	r2, #128	; 0x80
 80016a6:	2390      	movs	r3, #144	; 0x90
 80016a8:	0052      	lsls	r2, r2, #1
 80016aa:	05db      	lsls	r3, r3, #23
 80016ac:	851a      	strh	r2, [r3, #40]	; 0x28
 80016ae:	2200      	movs	r2, #0
 80016b0:	4b59      	ldr	r3, [pc, #356]	; (8001818 <TIM14_IRQHandler+0x188>)
 80016b2:	e032      	b.n	800171a <TIM14_IRQHandler+0x8a>
 80016b4:	4a58      	ldr	r2, [pc, #352]	; (8001818 <TIM14_IRQHandler+0x188>)
 80016b6:	7811      	ldrb	r1, [r2, #0]
 80016b8:	290d      	cmp	r1, #13
 80016ba:	d901      	bls.n	80016c0 <TIM14_IRQHandler+0x30>
 80016bc:	2200      	movs	r2, #0
 80016be:	e02c      	b.n	800171a <TIM14_IRQHandler+0x8a>
 80016c0:	7811      	ldrb	r1, [r2, #0]
 80016c2:	4856      	ldr	r0, [pc, #344]	; (800181c <TIM14_IRQHandler+0x18c>)
 80016c4:	5c41      	ldrb	r1, [r0, r1]
 80016c6:	20ff      	movs	r0, #255	; 0xff
 80016c8:	4388      	bics	r0, r1
 80016ca:	0040      	lsls	r0, r0, #1
 80016cc:	2101      	movs	r1, #1
 80016ce:	4308      	orrs	r0, r1
 80016d0:	4953      	ldr	r1, [pc, #332]	; (8001820 <TIM14_IRQHandler+0x190>)
 80016d2:	8008      	strh	r0, [r1, #0]
 80016d4:	7811      	ldrb	r1, [r2, #0]
 80016d6:	3101      	adds	r1, #1
 80016d8:	b2c9      	uxtb	r1, r1
 80016da:	7011      	strb	r1, [r2, #0]
 80016dc:	4a51      	ldr	r2, [pc, #324]	; (8001824 <TIM14_IRQHandler+0x194>)
 80016de:	2100      	movs	r1, #0
 80016e0:	7011      	strb	r1, [r2, #0]
 80016e2:	e019      	b.n	8001718 <TIM14_IRQHandler+0x88>
 80016e4:	4a4e      	ldr	r2, [pc, #312]	; (8001820 <TIM14_IRQHandler+0x190>)
 80016e6:	2190      	movs	r1, #144	; 0x90
 80016e8:	8814      	ldrh	r4, [r2, #0]
 80016ea:	2080      	movs	r0, #128	; 0x80
 80016ec:	05c9      	lsls	r1, r1, #23
 80016ee:	0040      	lsls	r0, r0, #1
 80016f0:	07e5      	lsls	r5, r4, #31
 80016f2:	d501      	bpl.n	80016f8 <TIM14_IRQHandler+0x68>
 80016f4:	6188      	str	r0, [r1, #24]
 80016f6:	e000      	b.n	80016fa <TIM14_IRQHandler+0x6a>
 80016f8:	8508      	strh	r0, [r1, #40]	; 0x28
 80016fa:	8811      	ldrh	r1, [r2, #0]
 80016fc:	0849      	lsrs	r1, r1, #1
 80016fe:	8011      	strh	r1, [r2, #0]
 8001700:	2203      	movs	r2, #3
 8001702:	e00a      	b.n	800171a <TIM14_IRQHandler+0x8a>
 8001704:	4a47      	ldr	r2, [pc, #284]	; (8001824 <TIM14_IRQHandler+0x194>)
 8001706:	7811      	ldrb	r1, [r2, #0]
 8001708:	3101      	adds	r1, #1
 800170a:	b2c9      	uxtb	r1, r1
 800170c:	7011      	strb	r1, [r2, #0]
 800170e:	7812      	ldrb	r2, [r2, #0]
 8001710:	2a09      	cmp	r2, #9
 8001712:	d901      	bls.n	8001718 <TIM14_IRQHandler+0x88>
 8001714:	2201      	movs	r2, #1
 8001716:	e000      	b.n	800171a <TIM14_IRQHandler+0x8a>
 8001718:	2202      	movs	r2, #2
 800171a:	701a      	strb	r2, [r3, #0]
 800171c:	4b42      	ldr	r3, [pc, #264]	; (8001828 <TIM14_IRQHandler+0x198>)
 800171e:	2104      	movs	r1, #4
 8001720:	6c1a      	ldr	r2, [r3, #64]	; 0x40
 8001722:	6019      	str	r1, [r3, #0]
 8001724:	6898      	ldr	r0, [r3, #8]
 8001726:	4301      	orrs	r1, r0
 8001728:	6099      	str	r1, [r3, #8]
 800172a:	4b40      	ldr	r3, [pc, #256]	; (800182c <TIM14_IRQHandler+0x19c>)
 800172c:	2101      	movs	r1, #1
 800172e:	429a      	cmp	r2, r3
 8001730:	d80b      	bhi.n	800174a <TIM14_IRQHandler+0xba>
 8001732:	4b3f      	ldr	r3, [pc, #252]	; (8001830 <TIM14_IRQHandler+0x1a0>)
 8001734:	2480      	movs	r4, #128	; 0x80
 8001736:	6818      	ldr	r0, [r3, #0]
 8001738:	0164      	lsls	r4, r4, #5
 800173a:	1901      	adds	r1, r0, r4
 800173c:	1a8a      	subs	r2, r1, r2
 800173e:	601a      	str	r2, [r3, #0]
 8001740:	4b3c      	ldr	r3, [pc, #240]	; (8001834 <TIM14_IRQHandler+0x1a4>)
 8001742:	2100      	movs	r1, #0
 8001744:	681a      	ldr	r2, [r3, #0]
 8001746:	3201      	adds	r2, #1
 8001748:	601a      	str	r2, [r3, #0]
 800174a:	4b3b      	ldr	r3, [pc, #236]	; (8001838 <TIM14_IRQHandler+0x1a8>)
 800174c:	7818      	ldrb	r0, [r3, #0]
 800174e:	b2c0      	uxtb	r0, r0
 8001750:	2804      	cmp	r0, #4
 8001752:	d85a      	bhi.n	800180a <TIM14_IRQHandler+0x17a>
 8001754:	f001 f98c 	bl	8002a70 <__gnu_thumb1_case_uqi>
 8001758:	36110603 	.word	0x36110603
 800175c:	38          	.byte	0x38
 800175d:	00          	.byte	0x00
 800175e:	2200      	movs	r2, #0
 8001760:	4b36      	ldr	r3, [pc, #216]	; (800183c <TIM14_IRQHandler+0x1ac>)
 8001762:	e051      	b.n	8001808 <TIM14_IRQHandler+0x178>
 8001764:	4a35      	ldr	r2, [pc, #212]	; (800183c <TIM14_IRQHandler+0x1ac>)
 8001766:	7811      	ldrb	r1, [r2, #0]
 8001768:	2200      	movs	r2, #0
 800176a:	290d      	cmp	r1, #13
 800176c:	d84c      	bhi.n	8001808 <TIM14_IRQHandler+0x178>
 800176e:	4934      	ldr	r1, [pc, #208]	; (8001840 <TIM14_IRQHandler+0x1b0>)
 8001770:	800a      	strh	r2, [r1, #0]
 8001772:	4934      	ldr	r1, [pc, #208]	; (8001844 <TIM14_IRQHandler+0x1b4>)
 8001774:	700a      	strb	r2, [r1, #0]
 8001776:	2202      	movs	r2, #2
 8001778:	e046      	b.n	8001808 <TIM14_IRQHandler+0x178>
 800177a:	4a33      	ldr	r2, [pc, #204]	; (8001848 <TIM14_IRQHandler+0x1b8>)
 800177c:	2900      	cmp	r1, #0
 800177e:	d103      	bne.n	8001788 <TIM14_IRQHandler+0xf8>
 8001780:	2003      	movs	r0, #3
 8001782:	7018      	strb	r0, [r3, #0]
 8001784:	6011      	str	r1, [r2, #0]
 8001786:	e040      	b.n	800180a <TIM14_IRQHandler+0x17a>
 8001788:	6811      	ldr	r1, [r2, #0]
 800178a:	3101      	adds	r1, #1
 800178c:	6011      	str	r1, [r2, #0]
 800178e:	6810      	ldr	r0, [r2, #0]
 8001790:	21d2      	movs	r1, #210	; 0xd2
 8001792:	0049      	lsls	r1, r1, #1
 8001794:	4288      	cmp	r0, r1
 8001796:	d938      	bls.n	800180a <TIM14_IRQHandler+0x17a>
 8001798:	2100      	movs	r1, #0
 800179a:	6011      	str	r1, [r2, #0]
 800179c:	4e25      	ldr	r6, [pc, #148]	; (8001834 <TIM14_IRQHandler+0x1a4>)
 800179e:	4a27      	ldr	r2, [pc, #156]	; (800183c <TIM14_IRQHandler+0x1ac>)
 80017a0:	4c23      	ldr	r4, [pc, #140]	; (8001830 <TIM14_IRQHandler+0x1a0>)
 80017a2:	7011      	strb	r1, [r2, #0]
 80017a4:	6831      	ldr	r1, [r6, #0]
 80017a6:	2201      	movs	r2, #1
 80017a8:	701a      	strb	r2, [r3, #0]
 80017aa:	4d28      	ldr	r5, [pc, #160]	; (800184c <TIM14_IRQHandler+0x1bc>)
 80017ac:	2900      	cmp	r1, #0
 80017ae:	d004      	beq.n	80017ba <TIM14_IRQHandler+0x12a>
 80017b0:	6820      	ldr	r0, [r4, #0]
 80017b2:	f001 f967 	bl	8002a84 <__aeabi_uidiv>
 80017b6:	6028      	str	r0, [r5, #0]
 80017b8:	e000      	b.n	80017bc <TIM14_IRQHandler+0x12c>
 80017ba:	6029      	str	r1, [r5, #0]
 80017bc:	2300      	movs	r3, #0
 80017be:	6023      	str	r3, [r4, #0]
 80017c0:	6033      	str	r3, [r6, #0]
 80017c2:	e022      	b.n	800180a <TIM14_IRQHandler+0x17a>
 80017c4:	2204      	movs	r2, #4
 80017c6:	e01f      	b.n	8001808 <TIM14_IRQHandler+0x178>
 80017c8:	4a1e      	ldr	r2, [pc, #120]	; (8001844 <TIM14_IRQHandler+0x1b4>)
 80017ca:	2900      	cmp	r1, #0
 80017cc:	d008      	beq.n	80017e0 <TIM14_IRQHandler+0x150>
 80017ce:	491c      	ldr	r1, [pc, #112]	; (8001840 <TIM14_IRQHandler+0x1b0>)
 80017d0:	2501      	movs	r5, #1
 80017d2:	880c      	ldrh	r4, [r1, #0]
 80017d4:	7810      	ldrb	r0, [r2, #0]
 80017d6:	4085      	lsls	r5, r0
 80017d8:	1c28      	adds	r0, r5, #0
 80017da:	4320      	orrs	r0, r4
 80017dc:	b280      	uxth	r0, r0
 80017de:	8008      	strh	r0, [r1, #0]
 80017e0:	7811      	ldrb	r1, [r2, #0]
 80017e2:	3101      	adds	r1, #1
 80017e4:	b2c9      	uxtb	r1, r1
 80017e6:	7011      	strb	r1, [r2, #0]
 80017e8:	7812      	ldrb	r2, [r2, #0]
 80017ea:	2a07      	cmp	r2, #7
 80017ec:	d90b      	bls.n	8001806 <TIM14_IRQHandler+0x176>
 80017ee:	4a13      	ldr	r2, [pc, #76]	; (800183c <TIM14_IRQHandler+0x1ac>)
 80017f0:	4813      	ldr	r0, [pc, #76]	; (8001840 <TIM14_IRQHandler+0x1b0>)
 80017f2:	7811      	ldrb	r1, [r2, #0]
 80017f4:	8804      	ldrh	r4, [r0, #0]
 80017f6:	4816      	ldr	r0, [pc, #88]	; (8001850 <TIM14_IRQHandler+0x1c0>)
 80017f8:	5444      	strb	r4, [r0, r1]
 80017fa:	7811      	ldrb	r1, [r2, #0]
 80017fc:	3101      	adds	r1, #1
 80017fe:	b2c9      	uxtb	r1, r1
 8001800:	7011      	strb	r1, [r2, #0]
 8001802:	2201      	movs	r2, #1
 8001804:	e000      	b.n	8001808 <TIM14_IRQHandler+0x178>
 8001806:	2203      	movs	r2, #3
 8001808:	701a      	strb	r2, [r3, #0]
 800180a:	4b12      	ldr	r3, [pc, #72]	; (8001854 <TIM14_IRQHandler+0x1c4>)
 800180c:	2200      	movs	r2, #0
 800180e:	821a      	strh	r2, [r3, #16]
 8001810:	bd70      	pop	{r4, r5, r6, pc}
 8001812:	46c0      	nop			; (mov r8, r8)
 8001814:	2000083f 	.word	0x2000083f
 8001818:	2000083e 	.word	0x2000083e
 800181c:	200000d6 	.word	0x200000d6
 8001820:	20000846 	.word	0x20000846
 8001824:	20000854 	.word	0x20000854
 8001828:	40012400 	.word	0x40012400
 800182c:	000003e7 	.word	0x000003e7
 8001830:	20000850 	.word	0x20000850
 8001834:	20000858 	.word	0x20000858
 8001838:	20000844 	.word	0x20000844
 800183c:	20000848 	.word	0x20000848
 8001840:	2000083c 	.word	0x2000083c
 8001844:	20000849 	.word	0x20000849
 8001848:	2000084c 	.word	0x2000084c
 800184c:	20000840 	.word	0x20000840
 8001850:	200000c8 	.word	0x200000c8
 8001854:	40002000 	.word	0x40002000

08001858 <GPIO_Init>:
 8001858:	2390      	movs	r3, #144	; 0x90
 800185a:	b5f7      	push	{r0, r1, r2, r4, r5, r6, r7, lr}
 800185c:	05db      	lsls	r3, r3, #23
 800185e:	1c04      	adds	r4, r0, #0
 8001860:	1c0d      	adds	r5, r1, #0
 8001862:	4298      	cmp	r0, r3
 8001864:	d010      	beq.n	8001888 <GPIO_Init+0x30>
 8001866:	4b39      	ldr	r3, [pc, #228]	; (800194c <GPIO_Init+0xf4>)
 8001868:	4298      	cmp	r0, r3
 800186a:	d00d      	beq.n	8001888 <GPIO_Init+0x30>
 800186c:	4b38      	ldr	r3, [pc, #224]	; (8001950 <GPIO_Init+0xf8>)
 800186e:	4298      	cmp	r0, r3
 8001870:	d00a      	beq.n	8001888 <GPIO_Init+0x30>
 8001872:	4b38      	ldr	r3, [pc, #224]	; (8001954 <GPIO_Init+0xfc>)
 8001874:	4298      	cmp	r0, r3
 8001876:	d007      	beq.n	8001888 <GPIO_Init+0x30>
 8001878:	4b37      	ldr	r3, [pc, #220]	; (8001958 <GPIO_Init+0x100>)
 800187a:	4298      	cmp	r0, r3
 800187c:	d004      	beq.n	8001888 <GPIO_Init+0x30>
 800187e:	4a37      	ldr	r2, [pc, #220]	; (800195c <GPIO_Init+0x104>)
 8001880:	1880      	adds	r0, r0, r2
 8001882:	4243      	negs	r3, r0
 8001884:	4158      	adcs	r0, r3
 8001886:	e000      	b.n	800188a <GPIO_Init+0x32>
 8001888:	2001      	movs	r0, #1
 800188a:	f7ff fe3f 	bl	800150c <assert_param>
 800188e:	6828      	ldr	r0, [r5, #0]
 8001890:	2600      	movs	r6, #0
 8001892:	1e43      	subs	r3, r0, #1
 8001894:	4198      	sbcs	r0, r3
 8001896:	f7ff fe39 	bl	800150c <assert_param>
 800189a:	792b      	ldrb	r3, [r5, #4]
 800189c:	2203      	movs	r2, #3
 800189e:	1c30      	adds	r0, r6, #0
 80018a0:	429a      	cmp	r2, r3
 80018a2:	4170      	adcs	r0, r6
 80018a4:	f7ff fe32 	bl	800150c <assert_param>
 80018a8:	79eb      	ldrb	r3, [r5, #7]
 80018aa:	2202      	movs	r2, #2
 80018ac:	1c30      	adds	r0, r6, #0
 80018ae:	429a      	cmp	r2, r3
 80018b0:	4170      	adcs	r0, r6
 80018b2:	f7ff fe2b 	bl	800150c <assert_param>
 80018b6:	2001      	movs	r0, #1
 80018b8:	1c03      	adds	r3, r0, #0
 80018ba:	682a      	ldr	r2, [r5, #0]
 80018bc:	40b3      	lsls	r3, r6
 80018be:	401a      	ands	r2, r3
 80018c0:	9201      	str	r2, [sp, #4]
 80018c2:	429a      	cmp	r2, r3
 80018c4:	d13d      	bne.n	8001942 <GPIO_Init+0xea>
 80018c6:	792b      	ldrb	r3, [r5, #4]
 80018c8:	0077      	lsls	r7, r6, #1
 80018ca:	3b01      	subs	r3, #1
 80018cc:	b2db      	uxtb	r3, r3
 80018ce:	4283      	cmp	r3, r0
 80018d0:	d823      	bhi.n	800191a <GPIO_Init+0xc2>
 80018d2:	796b      	ldrb	r3, [r5, #5]
 80018d4:	4283      	cmp	r3, r0
 80018d6:	d902      	bls.n	80018de <GPIO_Init+0x86>
 80018d8:	1ed8      	subs	r0, r3, #3
 80018da:	4243      	negs	r3, r0
 80018dc:	4158      	adcs	r0, r3
 80018de:	f7ff fe15 	bl	800150c <assert_param>
 80018e2:	68a3      	ldr	r3, [r4, #8]
 80018e4:	2203      	movs	r2, #3
 80018e6:	40ba      	lsls	r2, r7
 80018e8:	4393      	bics	r3, r2
 80018ea:	60a3      	str	r3, [r4, #8]
 80018ec:	796b      	ldrb	r3, [r5, #5]
 80018ee:	68a2      	ldr	r2, [r4, #8]
 80018f0:	40bb      	lsls	r3, r7
 80018f2:	4313      	orrs	r3, r2
 80018f4:	60a3      	str	r3, [r4, #8]
 80018f6:	79ab      	ldrb	r3, [r5, #6]
 80018f8:	2201      	movs	r2, #1
 80018fa:	2000      	movs	r0, #0
 80018fc:	429a      	cmp	r2, r3
 80018fe:	4140      	adcs	r0, r0
 8001900:	f7ff fe04 	bl	800150c <assert_param>
 8001904:	6863      	ldr	r3, [r4, #4]
 8001906:	9a01      	ldr	r2, [sp, #4]
 8001908:	b29b      	uxth	r3, r3
 800190a:	4393      	bics	r3, r2
 800190c:	80a3      	strh	r3, [r4, #4]
 800190e:	79ab      	ldrb	r3, [r5, #6]
 8001910:	6862      	ldr	r2, [r4, #4]
 8001912:	40b3      	lsls	r3, r6
 8001914:	4313      	orrs	r3, r2
 8001916:	b29b      	uxth	r3, r3
 8001918:	80a3      	strh	r3, [r4, #4]
 800191a:	2303      	movs	r3, #3
 800191c:	6822      	ldr	r2, [r4, #0]
 800191e:	40bb      	lsls	r3, r7
 8001920:	43db      	mvns	r3, r3
 8001922:	401a      	ands	r2, r3
 8001924:	6022      	str	r2, [r4, #0]
 8001926:	792a      	ldrb	r2, [r5, #4]
 8001928:	6821      	ldr	r1, [r4, #0]
 800192a:	40ba      	lsls	r2, r7
 800192c:	430a      	orrs	r2, r1
 800192e:	6022      	str	r2, [r4, #0]
 8001930:	68e2      	ldr	r2, [r4, #12]
 8001932:	4013      	ands	r3, r2
 8001934:	79ea      	ldrb	r2, [r5, #7]
 8001936:	60e3      	str	r3, [r4, #12]
 8001938:	68e3      	ldr	r3, [r4, #12]
 800193a:	40ba      	lsls	r2, r7
 800193c:	1c17      	adds	r7, r2, #0
 800193e:	431f      	orrs	r7, r3
 8001940:	60e7      	str	r7, [r4, #12]
 8001942:	3601      	adds	r6, #1
 8001944:	2e10      	cmp	r6, #16
 8001946:	d1b6      	bne.n	80018b6 <GPIO_Init+0x5e>
 8001948:	bdf7      	pop	{r0, r1, r2, r4, r5, r6, r7, pc}
 800194a:	46c0      	nop			; (mov r8, r8)
 800194c:	48000400 	.word	0x48000400
 8001950:	48000800 	.word	0x48000800
 8001954:	48000c00 	.word	0x48000c00
 8001958:	48001000 	.word	0x48001000
 800195c:	b7ffec00 	.word	0xb7ffec00

08001960 <GPIO_PinAFConfig>:
 8001960:	b5f7      	push	{r0, r1, r2, r4, r5, r6, r7, lr}
 8001962:	2390      	movs	r3, #144	; 0x90
 8001964:	1c04      	adds	r4, r0, #0
 8001966:	1c0e      	adds	r6, r1, #0
 8001968:	9201      	str	r2, [sp, #4]
 800196a:	05db      	lsls	r3, r3, #23
 800196c:	4298      	cmp	r0, r3
 800196e:	d010      	beq.n	8001992 <GPIO_PinAFConfig+0x32>
 8001970:	4b19      	ldr	r3, [pc, #100]	; (80019d8 <GPIO_PinAFConfig+0x78>)
 8001972:	4298      	cmp	r0, r3
 8001974:	d00d      	beq.n	8001992 <GPIO_PinAFConfig+0x32>
 8001976:	4b19      	ldr	r3, [pc, #100]	; (80019dc <GPIO_PinAFConfig+0x7c>)
 8001978:	4298      	cmp	r0, r3
 800197a:	d00a      	beq.n	8001992 <GPIO_PinAFConfig+0x32>
 800197c:	4b18      	ldr	r3, [pc, #96]	; (80019e0 <GPIO_PinAFConfig+0x80>)
 800197e:	4298      	cmp	r0, r3
 8001980:	d007      	beq.n	8001992 <GPIO_PinAFConfig+0x32>
 8001982:	4b18      	ldr	r3, [pc, #96]	; (80019e4 <GPIO_PinAFConfig+0x84>)
 8001984:	4298      	cmp	r0, r3
 8001986:	d004      	beq.n	8001992 <GPIO_PinAFConfig+0x32>
 8001988:	4a17      	ldr	r2, [pc, #92]	; (80019e8 <GPIO_PinAFConfig+0x88>)
 800198a:	1880      	adds	r0, r0, r2
 800198c:	4243      	negs	r3, r0
 800198e:	4158      	adcs	r0, r3
 8001990:	e000      	b.n	8001994 <GPIO_PinAFConfig+0x34>
 8001992:	2001      	movs	r0, #1
 8001994:	2500      	movs	r5, #0
 8001996:	f7ff fdb9 	bl	800150c <assert_param>
 800199a:	230f      	movs	r3, #15
 800199c:	1c28      	adds	r0, r5, #0
 800199e:	42b3      	cmp	r3, r6
 80019a0:	4168      	adcs	r0, r5
 80019a2:	f7ff fdb3 	bl	800150c <assert_param>
 80019a6:	9a01      	ldr	r2, [sp, #4]
 80019a8:	1c28      	adds	r0, r5, #0
 80019aa:	2707      	movs	r7, #7
 80019ac:	4297      	cmp	r7, r2
 80019ae:	4168      	adcs	r0, r5
 80019b0:	4037      	ands	r7, r6
 80019b2:	08f6      	lsrs	r6, r6, #3
 80019b4:	00b6      	lsls	r6, r6, #2
 80019b6:	19a4      	adds	r4, r4, r6
 80019b8:	f7ff fda8 	bl	800150c <assert_param>
 80019bc:	00bf      	lsls	r7, r7, #2
 80019be:	6a23      	ldr	r3, [r4, #32]
 80019c0:	220f      	movs	r2, #15
 80019c2:	40ba      	lsls	r2, r7
 80019c4:	4393      	bics	r3, r2
 80019c6:	9a01      	ldr	r2, [sp, #4]
 80019c8:	6223      	str	r3, [r4, #32]
 80019ca:	6a23      	ldr	r3, [r4, #32]
 80019cc:	40ba      	lsls	r2, r7
 80019ce:	1c17      	adds	r7, r2, #0
 80019d0:	431f      	orrs	r7, r3
 80019d2:	6227      	str	r7, [r4, #32]
 80019d4:	bdf7      	pop	{r0, r1, r2, r4, r5, r6, r7, pc}
 80019d6:	46c0      	nop			; (mov r8, r8)
 80019d8:	48000400 	.word	0x48000400
 80019dc:	48000800 	.word	0x48000800
 80019e0:	48000c00 	.word	0x48000c00
 80019e4:	48001000 	.word	0x48001000
 80019e8:	b7ffec00 	.word	0xb7ffec00

080019ec <TIM_TimeBaseInit>:
 80019ec:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
 80019ee:	4e34      	ldr	r6, [pc, #208]	; (8001ac0 <TIM_TimeBaseInit+0xd4>)
 80019f0:	1c04      	adds	r4, r0, #0
 80019f2:	1c0d      	adds	r5, r1, #0
 80019f4:	4f33      	ldr	r7, [pc, #204]	; (8001ac4 <TIM_TimeBaseInit+0xd8>)
 80019f6:	42b0      	cmp	r0, r6
 80019f8:	d019      	beq.n	8001a2e <TIM_TimeBaseInit+0x42>
 80019fa:	2380      	movs	r3, #128	; 0x80
 80019fc:	05db      	lsls	r3, r3, #23
 80019fe:	4298      	cmp	r0, r3
 8001a00:	d015      	beq.n	8001a2e <TIM_TimeBaseInit+0x42>
 8001a02:	4b31      	ldr	r3, [pc, #196]	; (8001ac8 <TIM_TimeBaseInit+0xdc>)
 8001a04:	4298      	cmp	r0, r3
 8001a06:	d012      	beq.n	8001a2e <TIM_TimeBaseInit+0x42>
 8001a08:	42b8      	cmp	r0, r7
 8001a0a:	d010      	beq.n	8001a2e <TIM_TimeBaseInit+0x42>
 8001a0c:	4b2f      	ldr	r3, [pc, #188]	; (8001acc <TIM_TimeBaseInit+0xe0>)
 8001a0e:	4298      	cmp	r0, r3
 8001a10:	d00d      	beq.n	8001a2e <TIM_TimeBaseInit+0x42>
 8001a12:	4b2f      	ldr	r3, [pc, #188]	; (8001ad0 <TIM_TimeBaseInit+0xe4>)
 8001a14:	4298      	cmp	r0, r3
 8001a16:	d00a      	beq.n	8001a2e <TIM_TimeBaseInit+0x42>
 8001a18:	4b2e      	ldr	r3, [pc, #184]	; (8001ad4 <TIM_TimeBaseInit+0xe8>)
 8001a1a:	4298      	cmp	r0, r3
 8001a1c:	d007      	beq.n	8001a2e <TIM_TimeBaseInit+0x42>
 8001a1e:	4b2e      	ldr	r3, [pc, #184]	; (8001ad8 <TIM_TimeBaseInit+0xec>)
 8001a20:	4298      	cmp	r0, r3
 8001a22:	d004      	beq.n	8001a2e <TIM_TimeBaseInit+0x42>
 8001a24:	492d      	ldr	r1, [pc, #180]	; (8001adc <TIM_TimeBaseInit+0xf0>)
 8001a26:	1840      	adds	r0, r0, r1
 8001a28:	4243      	negs	r3, r0
 8001a2a:	4158      	adcs	r0, r3
 8001a2c:	e000      	b.n	8001a30 <TIM_TimeBaseInit+0x44>
 8001a2e:	2001      	movs	r0, #1
 8001a30:	f7ff fd6c 	bl	800150c <assert_param>
 8001a34:	886b      	ldrh	r3, [r5, #2]
 8001a36:	2210      	movs	r2, #16
 8001a38:	1c19      	adds	r1, r3, #0
 8001a3a:	4391      	bics	r1, r2
 8001a3c:	d101      	bne.n	8001a42 <TIM_TimeBaseInit+0x56>
 8001a3e:	2001      	movs	r0, #1
 8001a40:	e007      	b.n	8001a52 <TIM_TimeBaseInit+0x66>
 8001a42:	2240      	movs	r2, #64	; 0x40
 8001a44:	1c19      	adds	r1, r3, #0
 8001a46:	4391      	bics	r1, r2
 8001a48:	2920      	cmp	r1, #32
 8001a4a:	d0f8      	beq.n	8001a3e <TIM_TimeBaseInit+0x52>
 8001a4c:	2b40      	cmp	r3, #64	; 0x40
 8001a4e:	d0f6      	beq.n	8001a3e <TIM_TimeBaseInit+0x52>
 8001a50:	2000      	movs	r0, #0
 8001a52:	f7ff fd5b 	bl	800150c <assert_param>
 8001a56:	892b      	ldrh	r3, [r5, #8]
 8001a58:	4a21      	ldr	r2, [pc, #132]	; (8001ae0 <TIM_TimeBaseInit+0xf4>)
 8001a5a:	2001      	movs	r0, #1
 8001a5c:	4213      	tst	r3, r2
 8001a5e:	d003      	beq.n	8001a68 <TIM_TimeBaseInit+0x7c>
 8001a60:	4a20      	ldr	r2, [pc, #128]	; (8001ae4 <TIM_TimeBaseInit+0xf8>)
 8001a62:	1898      	adds	r0, r3, r2
 8001a64:	4243      	negs	r3, r0
 8001a66:	4158      	adcs	r0, r3
 8001a68:	f7ff fd50 	bl	800150c <assert_param>
 8001a6c:	6823      	ldr	r3, [r4, #0]
 8001a6e:	b29b      	uxth	r3, r3
 8001a70:	42b4      	cmp	r4, r6
 8001a72:	d006      	beq.n	8001a82 <TIM_TimeBaseInit+0x96>
 8001a74:	2280      	movs	r2, #128	; 0x80
 8001a76:	05d2      	lsls	r2, r2, #23
 8001a78:	4294      	cmp	r4, r2
 8001a7a:	d002      	beq.n	8001a82 <TIM_TimeBaseInit+0x96>
 8001a7c:	4a12      	ldr	r2, [pc, #72]	; (8001ac8 <TIM_TimeBaseInit+0xdc>)
 8001a7e:	4294      	cmp	r4, r2
 8001a80:	d103      	bne.n	8001a8a <TIM_TimeBaseInit+0x9e>
 8001a82:	2270      	movs	r2, #112	; 0x70
 8001a84:	4393      	bics	r3, r2
 8001a86:	886a      	ldrh	r2, [r5, #2]
 8001a88:	4313      	orrs	r3, r2
 8001a8a:	42bc      	cmp	r4, r7
 8001a8c:	d003      	beq.n	8001a96 <TIM_TimeBaseInit+0xaa>
 8001a8e:	4916      	ldr	r1, [pc, #88]	; (8001ae8 <TIM_TimeBaseInit+0xfc>)
 8001a90:	892a      	ldrh	r2, [r5, #8]
 8001a92:	400b      	ands	r3, r1
 8001a94:	4313      	orrs	r3, r2
 8001a96:	8023      	strh	r3, [r4, #0]
 8001a98:	686b      	ldr	r3, [r5, #4]
 8001a9a:	62e3      	str	r3, [r4, #44]	; 0x2c
 8001a9c:	882b      	ldrh	r3, [r5, #0]
 8001a9e:	8523      	strh	r3, [r4, #40]	; 0x28
 8001aa0:	42b4      	cmp	r4, r6
 8001aa2:	d008      	beq.n	8001ab6 <TIM_TimeBaseInit+0xca>
 8001aa4:	4b0b      	ldr	r3, [pc, #44]	; (8001ad4 <TIM_TimeBaseInit+0xe8>)
 8001aa6:	429c      	cmp	r4, r3
 8001aa8:	d005      	beq.n	8001ab6 <TIM_TimeBaseInit+0xca>
 8001aaa:	4b0b      	ldr	r3, [pc, #44]	; (8001ad8 <TIM_TimeBaseInit+0xec>)
 8001aac:	429c      	cmp	r4, r3
 8001aae:	d002      	beq.n	8001ab6 <TIM_TimeBaseInit+0xca>
 8001ab0:	4b0e      	ldr	r3, [pc, #56]	; (8001aec <TIM_TimeBaseInit+0x100>)
 8001ab2:	429c      	cmp	r4, r3
 8001ab4:	d101      	bne.n	8001aba <TIM_TimeBaseInit+0xce>
 8001ab6:	7aab      	ldrb	r3, [r5, #10]
 8001ab8:	8623      	strh	r3, [r4, #48]	; 0x30
 8001aba:	2301      	movs	r3, #1
 8001abc:	82a3      	strh	r3, [r4, #20]
 8001abe:	bdf8      	pop	{r3, r4, r5, r6, r7, pc}
 8001ac0:	40012c00 	.word	0x40012c00
 8001ac4:	40001000 	.word	0x40001000
 8001ac8:	40000400 	.word	0x40000400
 8001acc:	40001400 	.word	0x40001400
 8001ad0:	40002000 	.word	0x40002000
 8001ad4:	40014000 	.word	0x40014000
 8001ad8:	40014400 	.word	0x40014400
 8001adc:	bffeb800 	.word	0xbffeb800
 8001ae0:	fffffeff 	.word	0xfffffeff
 8001ae4:	fffffe00 	.word	0xfffffe00
 8001ae8:	fffffcff 	.word	0xfffffcff
 8001aec:	40014800 	.word	0x40014800

08001af0 <TIM_Cmd>:
 8001af0:	4b19      	ldr	r3, [pc, #100]	; (8001b58 <TIM_Cmd+0x68>)
 8001af2:	b570      	push	{r4, r5, r6, lr}
 8001af4:	1c04      	adds	r4, r0, #0
 8001af6:	1c0e      	adds	r6, r1, #0
 8001af8:	4298      	cmp	r0, r3
 8001afa:	d01a      	beq.n	8001b32 <TIM_Cmd+0x42>
 8001afc:	2380      	movs	r3, #128	; 0x80
 8001afe:	05db      	lsls	r3, r3, #23
 8001b00:	4298      	cmp	r0, r3
 8001b02:	d016      	beq.n	8001b32 <TIM_Cmd+0x42>
 8001b04:	4b15      	ldr	r3, [pc, #84]	; (8001b5c <TIM_Cmd+0x6c>)
 8001b06:	4298      	cmp	r0, r3
 8001b08:	d013      	beq.n	8001b32 <TIM_Cmd+0x42>
 8001b0a:	4b15      	ldr	r3, [pc, #84]	; (8001b60 <TIM_Cmd+0x70>)
 8001b0c:	4298      	cmp	r0, r3
 8001b0e:	d010      	beq.n	8001b32 <TIM_Cmd+0x42>
 8001b10:	4b14      	ldr	r3, [pc, #80]	; (8001b64 <TIM_Cmd+0x74>)
 8001b12:	4298      	cmp	r0, r3
 8001b14:	d00d      	beq.n	8001b32 <TIM_Cmd+0x42>
 8001b16:	4b14      	ldr	r3, [pc, #80]	; (8001b68 <TIM_Cmd+0x78>)
 8001b18:	4298      	cmp	r0, r3
 8001b1a:	d00a      	beq.n	8001b32 <TIM_Cmd+0x42>
 8001b1c:	4b13      	ldr	r3, [pc, #76]	; (8001b6c <TIM_Cmd+0x7c>)
 8001b1e:	4298      	cmp	r0, r3
 8001b20:	d007      	beq.n	8001b32 <TIM_Cmd+0x42>
 8001b22:	4b13      	ldr	r3, [pc, #76]	; (8001b70 <TIM_Cmd+0x80>)
 8001b24:	4298      	cmp	r0, r3
 8001b26:	d004      	beq.n	8001b32 <TIM_Cmd+0x42>
 8001b28:	4b12      	ldr	r3, [pc, #72]	; (8001b74 <TIM_Cmd+0x84>)
 8001b2a:	18c0      	adds	r0, r0, r3
 8001b2c:	4243      	negs	r3, r0
 8001b2e:	4158      	adcs	r0, r3
 8001b30:	e000      	b.n	8001b34 <TIM_Cmd+0x44>
 8001b32:	2001      	movs	r0, #1
 8001b34:	f7ff fcea 	bl	800150c <assert_param>
 8001b38:	2501      	movs	r5, #1
 8001b3a:	2000      	movs	r0, #0
 8001b3c:	42b5      	cmp	r5, r6
 8001b3e:	4140      	adcs	r0, r0
 8001b40:	f7ff fce4 	bl	800150c <assert_param>
 8001b44:	6823      	ldr	r3, [r4, #0]
 8001b46:	b29b      	uxth	r3, r3
 8001b48:	2e00      	cmp	r6, #0
 8001b4a:	d002      	beq.n	8001b52 <TIM_Cmd+0x62>
 8001b4c:	431d      	orrs	r5, r3
 8001b4e:	8025      	strh	r5, [r4, #0]
 8001b50:	e001      	b.n	8001b56 <TIM_Cmd+0x66>
 8001b52:	43ab      	bics	r3, r5
 8001b54:	8023      	strh	r3, [r4, #0]
 8001b56:	bd70      	pop	{r4, r5, r6, pc}
 8001b58:	40012c00 	.word	0x40012c00
 8001b5c:	40000400 	.word	0x40000400
 8001b60:	40001000 	.word	0x40001000
 8001b64:	40001400 	.word	0x40001400
 8001b68:	40002000 	.word	0x40002000
 8001b6c:	40014000 	.word	0x40014000
 8001b70:	40014400 	.word	0x40014400
 8001b74:	bffeb800 	.word	0xbffeb800

08001b78 <TIM_ITConfig>:
 8001b78:	4b1f      	ldr	r3, [pc, #124]	; (8001bf8 <TIM_ITConfig+0x80>)
 8001b7a:	b570      	push	{r4, r5, r6, lr}
 8001b7c:	1c04      	adds	r4, r0, #0
 8001b7e:	1c0d      	adds	r5, r1, #0
 8001b80:	1c16      	adds	r6, r2, #0
 8001b82:	4298      	cmp	r0, r3
 8001b84:	d01a      	beq.n	8001bbc <TIM_ITConfig+0x44>
 8001b86:	2380      	movs	r3, #128	; 0x80
 8001b88:	05db      	lsls	r3, r3, #23
 8001b8a:	4298      	cmp	r0, r3
 8001b8c:	d016      	beq.n	8001bbc <TIM_ITConfig+0x44>
 8001b8e:	4b1b      	ldr	r3, [pc, #108]	; (8001bfc <TIM_ITConfig+0x84>)
 8001b90:	4298      	cmp	r0, r3
 8001b92:	d013      	beq.n	8001bbc <TIM_ITConfig+0x44>
 8001b94:	4b1a      	ldr	r3, [pc, #104]	; (8001c00 <TIM_ITConfig+0x88>)
 8001b96:	4298      	cmp	r0, r3
 8001b98:	d010      	beq.n	8001bbc <TIM_ITConfig+0x44>
 8001b9a:	4b1a      	ldr	r3, [pc, #104]	; (8001c04 <TIM_ITConfig+0x8c>)
 8001b9c:	4298      	cmp	r0, r3
 8001b9e:	d00d      	beq.n	8001bbc <TIM_ITConfig+0x44>
 8001ba0:	4b19      	ldr	r3, [pc, #100]	; (8001c08 <TIM_ITConfig+0x90>)
 8001ba2:	4298      	cmp	r0, r3
 8001ba4:	d00a      	beq.n	8001bbc <TIM_ITConfig+0x44>
 8001ba6:	4b19      	ldr	r3, [pc, #100]	; (8001c0c <TIM_ITConfig+0x94>)
 8001ba8:	4298      	cmp	r0, r3
 8001baa:	d007      	beq.n	8001bbc <TIM_ITConfig+0x44>
 8001bac:	4b18      	ldr	r3, [pc, #96]	; (8001c10 <TIM_ITConfig+0x98>)
 8001bae:	4298      	cmp	r0, r3
 8001bb0:	d004      	beq.n	8001bbc <TIM_ITConfig+0x44>
 8001bb2:	4a18      	ldr	r2, [pc, #96]	; (8001c14 <TIM_ITConfig+0x9c>)
 8001bb4:	1880      	adds	r0, r0, r2
 8001bb6:	4243      	negs	r3, r0
 8001bb8:	4158      	adcs	r0, r3
 8001bba:	e000      	b.n	8001bbe <TIM_ITConfig+0x46>
 8001bbc:	2001      	movs	r0, #1
 8001bbe:	f7ff fca5 	bl	800150c <assert_param>
 8001bc2:	23ff      	movs	r3, #255	; 0xff
 8001bc4:	1c2a      	adds	r2, r5, #0
 8001bc6:	2000      	movs	r0, #0
 8001bc8:	439a      	bics	r2, r3
 8001bca:	4282      	cmp	r2, r0
 8001bcc:	d102      	bne.n	8001bd4 <TIM_ITConfig+0x5c>
 8001bce:	1c28      	adds	r0, r5, #0
 8001bd0:	1e43      	subs	r3, r0, #1
 8001bd2:	4198      	sbcs	r0, r3
 8001bd4:	f7ff fc9a 	bl	800150c <assert_param>
 8001bd8:	2301      	movs	r3, #1
 8001bda:	2000      	movs	r0, #0
 8001bdc:	42b3      	cmp	r3, r6
 8001bde:	4140      	adcs	r0, r0
 8001be0:	f7ff fc94 	bl	800150c <assert_param>
 8001be4:	68e3      	ldr	r3, [r4, #12]
 8001be6:	b29b      	uxth	r3, r3
 8001be8:	2e00      	cmp	r6, #0
 8001bea:	d002      	beq.n	8001bf2 <TIM_ITConfig+0x7a>
 8001bec:	431d      	orrs	r5, r3
 8001bee:	81a5      	strh	r5, [r4, #12]
 8001bf0:	e001      	b.n	8001bf6 <TIM_ITConfig+0x7e>
 8001bf2:	43ab      	bics	r3, r5
 8001bf4:	81a3      	strh	r3, [r4, #12]
 8001bf6:	bd70      	pop	{r4, r5, r6, pc}
 8001bf8:	40012c00 	.word	0x40012c00
 8001bfc:	40000400 	.word	0x40000400
 8001c00:	40001000 	.word	0x40001000
 8001c04:	40001400 	.word	0x40001400
 8001c08:	40002000 	.word	0x40002000
 8001c0c:	40014000 	.word	0x40014000
 8001c10:	40014400 	.word	0x40014400
 8001c14:	bffeb800 	.word	0xbffeb800

08001c18 <USART_Init>:
 8001c18:	b5f0      	push	{r4, r5, r6, r7, lr}
 8001c1a:	4e53      	ldr	r6, [pc, #332]	; (8001d68 <USART_Init+0x150>)
 8001c1c:	b08b      	sub	sp, #44	; 0x2c
 8001c1e:	1c04      	adds	r4, r0, #0
 8001c20:	1c0d      	adds	r5, r1, #0
 8001c22:	42b0      	cmp	r0, r6
 8001c24:	d016      	beq.n	8001c54 <USART_Init+0x3c>
 8001c26:	4b51      	ldr	r3, [pc, #324]	; (8001d6c <USART_Init+0x154>)
 8001c28:	4298      	cmp	r0, r3
 8001c2a:	d013      	beq.n	8001c54 <USART_Init+0x3c>
 8001c2c:	4b50      	ldr	r3, [pc, #320]	; (8001d70 <USART_Init+0x158>)
 8001c2e:	4298      	cmp	r0, r3
 8001c30:	d010      	beq.n	8001c54 <USART_Init+0x3c>
 8001c32:	4b50      	ldr	r3, [pc, #320]	; (8001d74 <USART_Init+0x15c>)
 8001c34:	4298      	cmp	r0, r3
 8001c36:	d00d      	beq.n	8001c54 <USART_Init+0x3c>
 8001c38:	4b4f      	ldr	r3, [pc, #316]	; (8001d78 <USART_Init+0x160>)
 8001c3a:	4298      	cmp	r0, r3
 8001c3c:	d00a      	beq.n	8001c54 <USART_Init+0x3c>
 8001c3e:	4b4f      	ldr	r3, [pc, #316]	; (8001d7c <USART_Init+0x164>)
 8001c40:	4298      	cmp	r0, r3
 8001c42:	d007      	beq.n	8001c54 <USART_Init+0x3c>
 8001c44:	4b4e      	ldr	r3, [pc, #312]	; (8001d80 <USART_Init+0x168>)
 8001c46:	4298      	cmp	r0, r3
 8001c48:	d004      	beq.n	8001c54 <USART_Init+0x3c>
 8001c4a:	494e      	ldr	r1, [pc, #312]	; (8001d84 <USART_Init+0x16c>)
 8001c4c:	1840      	adds	r0, r0, r1
 8001c4e:	4243      	negs	r3, r0
 8001c50:	4158      	adcs	r0, r3
 8001c52:	e000      	b.n	8001c56 <USART_Init+0x3e>
 8001c54:	2001      	movs	r0, #1
 8001c56:	f7ff fc59 	bl	800150c <assert_param>
 8001c5a:	682b      	ldr	r3, [r5, #0]
 8001c5c:	4a4a      	ldr	r2, [pc, #296]	; (8001d88 <USART_Init+0x170>)
 8001c5e:	3b01      	subs	r3, #1
 8001c60:	2000      	movs	r0, #0
 8001c62:	429a      	cmp	r2, r3
 8001c64:	4140      	adcs	r0, r0
 8001c66:	f7ff fc51 	bl	800150c <assert_param>
 8001c6a:	686b      	ldr	r3, [r5, #4]
 8001c6c:	4a47      	ldr	r2, [pc, #284]	; (8001d8c <USART_Init+0x174>)
 8001c6e:	2001      	movs	r0, #1
 8001c70:	4213      	tst	r3, r2
 8001c72:	d003      	beq.n	8001c7c <USART_Init+0x64>
 8001c74:	4a46      	ldr	r2, [pc, #280]	; (8001d90 <USART_Init+0x178>)
 8001c76:	1898      	adds	r0, r3, r2
 8001c78:	4243      	negs	r3, r0
 8001c7a:	4158      	adcs	r0, r3
 8001c7c:	f7ff fc46 	bl	800150c <assert_param>
 8001c80:	68ab      	ldr	r3, [r5, #8]
 8001c82:	4a44      	ldr	r2, [pc, #272]	; (8001d94 <USART_Init+0x17c>)
 8001c84:	2001      	movs	r0, #1
 8001c86:	4213      	tst	r3, r2
 8001c88:	d003      	beq.n	8001c92 <USART_Init+0x7a>
 8001c8a:	4943      	ldr	r1, [pc, #268]	; (8001d98 <USART_Init+0x180>)
 8001c8c:	1858      	adds	r0, r3, r1
 8001c8e:	4243      	negs	r3, r0
 8001c90:	4158      	adcs	r0, r3
 8001c92:	f7ff fc3b 	bl	800150c <assert_param>
 8001c96:	68eb      	ldr	r3, [r5, #12]
 8001c98:	4a40      	ldr	r2, [pc, #256]	; (8001d9c <USART_Init+0x184>)
 8001c9a:	2001      	movs	r0, #1
 8001c9c:	4213      	tst	r3, r2
 8001c9e:	d003      	beq.n	8001ca8 <USART_Init+0x90>
 8001ca0:	4a3f      	ldr	r2, [pc, #252]	; (8001da0 <USART_Init+0x188>)
 8001ca2:	1898      	adds	r0, r3, r2
 8001ca4:	4243      	negs	r3, r0
 8001ca6:	4158      	adcs	r0, r3
 8001ca8:	f7ff fc30 	bl	800150c <assert_param>
 8001cac:	692b      	ldr	r3, [r5, #16]
 8001cae:	220c      	movs	r2, #12
 8001cb0:	1c19      	adds	r1, r3, #0
 8001cb2:	2000      	movs	r0, #0
 8001cb4:	4391      	bics	r1, r2
 8001cb6:	4281      	cmp	r1, r0
 8001cb8:	d102      	bne.n	8001cc0 <USART_Init+0xa8>
 8001cba:	1c18      	adds	r0, r3, #0
 8001cbc:	1e43      	subs	r3, r0, #1
 8001cbe:	4198      	sbcs	r0, r3
 8001cc0:	f7ff fc24 	bl	800150c <assert_param>
 8001cc4:	4f37      	ldr	r7, [pc, #220]	; (8001da4 <USART_Init+0x18c>)
 8001cc6:	6968      	ldr	r0, [r5, #20]
 8001cc8:	4038      	ands	r0, r7
 8001cca:	4243      	negs	r3, r0
 8001ccc:	4158      	adcs	r0, r3
 8001cce:	f7ff fc1d 	bl	800150c <assert_param>
 8001cd2:	6823      	ldr	r3, [r4, #0]
 8001cd4:	2201      	movs	r2, #1
 8001cd6:	4393      	bics	r3, r2
 8001cd8:	6023      	str	r3, [r4, #0]
 8001cda:	6862      	ldr	r2, [r4, #4]
 8001cdc:	4b32      	ldr	r3, [pc, #200]	; (8001da8 <USART_Init+0x190>)
 8001cde:	6869      	ldr	r1, [r5, #4]
 8001ce0:	4013      	ands	r3, r2
 8001ce2:	68aa      	ldr	r2, [r5, #8]
 8001ce4:	4668      	mov	r0, sp
 8001ce6:	4313      	orrs	r3, r2
 8001ce8:	6063      	str	r3, [r4, #4]
 8001cea:	6822      	ldr	r2, [r4, #0]
 8001cec:	4b2f      	ldr	r3, [pc, #188]	; (8001dac <USART_Init+0x194>)
 8001cee:	401a      	ands	r2, r3
 8001cf0:	68eb      	ldr	r3, [r5, #12]
 8001cf2:	430b      	orrs	r3, r1
 8001cf4:	6929      	ldr	r1, [r5, #16]
 8001cf6:	430b      	orrs	r3, r1
 8001cf8:	4313      	orrs	r3, r2
 8001cfa:	6023      	str	r3, [r4, #0]
 8001cfc:	68a3      	ldr	r3, [r4, #8]
 8001cfe:	696a      	ldr	r2, [r5, #20]
 8001d00:	401f      	ands	r7, r3
 8001d02:	4317      	orrs	r7, r2
 8001d04:	60a7      	str	r7, [r4, #8]
 8001d06:	f000 fc97 	bl	8002638 <RCC_GetClocksFreq>
 8001d0a:	42b4      	cmp	r4, r6
 8001d0c:	d101      	bne.n	8001d12 <USART_Init+0xfa>
 8001d0e:	9e06      	ldr	r6, [sp, #24]
 8001d10:	e00a      	b.n	8001d28 <USART_Init+0x110>
 8001d12:	4b16      	ldr	r3, [pc, #88]	; (8001d6c <USART_Init+0x154>)
 8001d14:	429c      	cmp	r4, r3
 8001d16:	d101      	bne.n	8001d1c <USART_Init+0x104>
 8001d18:	9e07      	ldr	r6, [sp, #28]
 8001d1a:	e005      	b.n	8001d28 <USART_Init+0x110>
 8001d1c:	4b14      	ldr	r3, [pc, #80]	; (8001d70 <USART_Init+0x158>)
 8001d1e:	429c      	cmp	r4, r3
 8001d20:	d101      	bne.n	8001d26 <USART_Init+0x10e>
 8001d22:	9e08      	ldr	r6, [sp, #32]
 8001d24:	e000      	b.n	8001d28 <USART_Init+0x110>
 8001d26:	9e02      	ldr	r6, [sp, #8]
 8001d28:	6823      	ldr	r3, [r4, #0]
 8001d2a:	682f      	ldr	r7, [r5, #0]
 8001d2c:	0419      	lsls	r1, r3, #16
 8001d2e:	d500      	bpl.n	8001d32 <USART_Init+0x11a>
 8001d30:	0076      	lsls	r6, r6, #1
 8001d32:	1c39      	adds	r1, r7, #0
 8001d34:	1c30      	adds	r0, r6, #0
 8001d36:	f000 fea5 	bl	8002a84 <__aeabi_uidiv>
 8001d3a:	1c39      	adds	r1, r7, #0
 8001d3c:	1c05      	adds	r5, r0, #0
 8001d3e:	1c30      	adds	r0, r6, #0
 8001d40:	f000 fee4 	bl	8002b0c <__aeabi_uidivmod>
 8001d44:	087f      	lsrs	r7, r7, #1
 8001d46:	2300      	movs	r3, #0
 8001d48:	42b9      	cmp	r1, r7
 8001d4a:	415b      	adcs	r3, r3
 8001d4c:	18ed      	adds	r5, r5, r3
 8001d4e:	6823      	ldr	r3, [r4, #0]
 8001d50:	041a      	lsls	r2, r3, #16
 8001d52:	d504      	bpl.n	8001d5e <USART_Init+0x146>
 8001d54:	4a16      	ldr	r2, [pc, #88]	; (8001db0 <USART_Init+0x198>)
 8001d56:	072b      	lsls	r3, r5, #28
 8001d58:	0f5b      	lsrs	r3, r3, #29
 8001d5a:	4015      	ands	r5, r2
 8001d5c:	431d      	orrs	r5, r3
 8001d5e:	b2ad      	uxth	r5, r5
 8001d60:	81a5      	strh	r5, [r4, #12]
 8001d62:	b00b      	add	sp, #44	; 0x2c
 8001d64:	bdf0      	pop	{r4, r5, r6, r7, pc}
 8001d66:	46c0      	nop			; (mov r8, r8)
 8001d68:	40013800 	.word	0x40013800
 8001d6c:	40004400 	.word	0x40004400
 8001d70:	40004800 	.word	0x40004800
 8001d74:	40004c00 	.word	0x40004c00
 8001d78:	40005000 	.word	0x40005000
 8001d7c:	40011400 	.word	0x40011400
 8001d80:	40011800 	.word	0x40011800
 8001d84:	bffee400 	.word	0xbffee400
 8001d88:	005b8d7f 	.word	0x005b8d7f
 8001d8c:	ffffefff 	.word	0xffffefff
 8001d90:	effff000 	.word	0xeffff000
 8001d94:	ffffdfff 	.word	0xffffdfff
 8001d98:	ffffd000 	.word	0xffffd000
 8001d9c:	fffffbff 	.word	0xfffffbff
 8001da0:	fffffa00 	.word	0xfffffa00
 8001da4:	fffffcff 	.word	0xfffffcff
 8001da8:	ffffcfff 	.word	0xffffcfff
 8001dac:	ffffe9f3 	.word	0xffffe9f3
 8001db0:	0000fff0 	.word	0x0000fff0

08001db4 <USART_Cmd>:
 8001db4:	4b17      	ldr	r3, [pc, #92]	; (8001e14 <USART_Cmd+0x60>)
 8001db6:	b570      	push	{r4, r5, r6, lr}
 8001db8:	1c04      	adds	r4, r0, #0
 8001dba:	1c0e      	adds	r6, r1, #0
 8001dbc:	4298      	cmp	r0, r3
 8001dbe:	d016      	beq.n	8001dee <USART_Cmd+0x3a>
 8001dc0:	4b15      	ldr	r3, [pc, #84]	; (8001e18 <USART_Cmd+0x64>)
 8001dc2:	4298      	cmp	r0, r3
 8001dc4:	d013      	beq.n	8001dee <USART_Cmd+0x3a>
 8001dc6:	4b15      	ldr	r3, [pc, #84]	; (8001e1c <USART_Cmd+0x68>)
 8001dc8:	4298      	cmp	r0, r3
 8001dca:	d010      	beq.n	8001dee <USART_Cmd+0x3a>
 8001dcc:	4b14      	ldr	r3, [pc, #80]	; (8001e20 <USART_Cmd+0x6c>)
 8001dce:	4298      	cmp	r0, r3
 8001dd0:	d00d      	beq.n	8001dee <USART_Cmd+0x3a>
 8001dd2:	4b14      	ldr	r3, [pc, #80]	; (8001e24 <USART_Cmd+0x70>)
 8001dd4:	4298      	cmp	r0, r3
 8001dd6:	d00a      	beq.n	8001dee <USART_Cmd+0x3a>
 8001dd8:	4b13      	ldr	r3, [pc, #76]	; (8001e28 <USART_Cmd+0x74>)
 8001dda:	4298      	cmp	r0, r3
 8001ddc:	d007      	beq.n	8001dee <USART_Cmd+0x3a>
 8001dde:	4b13      	ldr	r3, [pc, #76]	; (8001e2c <USART_Cmd+0x78>)
 8001de0:	4298      	cmp	r0, r3
 8001de2:	d004      	beq.n	8001dee <USART_Cmd+0x3a>
 8001de4:	4b12      	ldr	r3, [pc, #72]	; (8001e30 <USART_Cmd+0x7c>)
 8001de6:	18c0      	adds	r0, r0, r3
 8001de8:	4243      	negs	r3, r0
 8001dea:	4158      	adcs	r0, r3
 8001dec:	e000      	b.n	8001df0 <USART_Cmd+0x3c>
 8001dee:	2001      	movs	r0, #1
 8001df0:	f7ff fb8c 	bl	800150c <assert_param>
 8001df4:	2501      	movs	r5, #1
 8001df6:	2000      	movs	r0, #0
 8001df8:	42b5      	cmp	r5, r6
 8001dfa:	4140      	adcs	r0, r0
 8001dfc:	f7ff fb86 	bl	800150c <assert_param>
 8001e00:	6823      	ldr	r3, [r4, #0]
 8001e02:	2e00      	cmp	r6, #0
 8001e04:	d002      	beq.n	8001e0c <USART_Cmd+0x58>
 8001e06:	431d      	orrs	r5, r3
 8001e08:	6025      	str	r5, [r4, #0]
 8001e0a:	e001      	b.n	8001e10 <USART_Cmd+0x5c>
 8001e0c:	43ab      	bics	r3, r5
 8001e0e:	6023      	str	r3, [r4, #0]
 8001e10:	bd70      	pop	{r4, r5, r6, pc}
 8001e12:	46c0      	nop			; (mov r8, r8)
 8001e14:	40013800 	.word	0x40013800
 8001e18:	40004400 	.word	0x40004400
 8001e1c:	40004800 	.word	0x40004800
 8001e20:	40004c00 	.word	0x40004c00
 8001e24:	40005000 	.word	0x40005000
 8001e28:	40011400 	.word	0x40011400
 8001e2c:	40011800 	.word	0x40011800
 8001e30:	bffee400 	.word	0xbffee400

08001e34 <USART_ReceiveData>:
 8001e34:	4b11      	ldr	r3, [pc, #68]	; (8001e7c <USART_ReceiveData+0x48>)
 8001e36:	b510      	push	{r4, lr}
 8001e38:	1e04      	subs	r4, r0, #0
 8001e3a:	429c      	cmp	r4, r3
 8001e3c:	d016      	beq.n	8001e6c <USART_ReceiveData+0x38>
 8001e3e:	4b10      	ldr	r3, [pc, #64]	; (8001e80 <USART_ReceiveData+0x4c>)
 8001e40:	4298      	cmp	r0, r3
 8001e42:	d013      	beq.n	8001e6c <USART_ReceiveData+0x38>
 8001e44:	4b0f      	ldr	r3, [pc, #60]	; (8001e84 <USART_ReceiveData+0x50>)
 8001e46:	4298      	cmp	r0, r3
 8001e48:	d010      	beq.n	8001e6c <USART_ReceiveData+0x38>
 8001e4a:	4b0f      	ldr	r3, [pc, #60]	; (8001e88 <USART_ReceiveData+0x54>)
 8001e4c:	4298      	cmp	r0, r3
 8001e4e:	d00d      	beq.n	8001e6c <USART_ReceiveData+0x38>
 8001e50:	4b0e      	ldr	r3, [pc, #56]	; (8001e8c <USART_ReceiveData+0x58>)
 8001e52:	4298      	cmp	r0, r3
 8001e54:	d00a      	beq.n	8001e6c <USART_ReceiveData+0x38>
 8001e56:	4b0e      	ldr	r3, [pc, #56]	; (8001e90 <USART_ReceiveData+0x5c>)
 8001e58:	4298      	cmp	r0, r3
 8001e5a:	d007      	beq.n	8001e6c <USART_ReceiveData+0x38>
 8001e5c:	4b0d      	ldr	r3, [pc, #52]	; (8001e94 <USART_ReceiveData+0x60>)
 8001e5e:	4298      	cmp	r0, r3
 8001e60:	d004      	beq.n	8001e6c <USART_ReceiveData+0x38>
 8001e62:	4b0d      	ldr	r3, [pc, #52]	; (8001e98 <USART_ReceiveData+0x64>)
 8001e64:	18c0      	adds	r0, r0, r3
 8001e66:	4243      	negs	r3, r0
 8001e68:	4158      	adcs	r0, r3
 8001e6a:	e000      	b.n	8001e6e <USART_ReceiveData+0x3a>
 8001e6c:	2001      	movs	r0, #1
 8001e6e:	f7ff fb4d 	bl	800150c <assert_param>
 8001e72:	6a60      	ldr	r0, [r4, #36]	; 0x24
 8001e74:	05c0      	lsls	r0, r0, #23
 8001e76:	0dc0      	lsrs	r0, r0, #23
 8001e78:	bd10      	pop	{r4, pc}
 8001e7a:	46c0      	nop			; (mov r8, r8)
 8001e7c:	40013800 	.word	0x40013800
 8001e80:	40004400 	.word	0x40004400
 8001e84:	40004800 	.word	0x40004800
 8001e88:	40004c00 	.word	0x40004c00
 8001e8c:	40005000 	.word	0x40005000
 8001e90:	40011400 	.word	0x40011400
 8001e94:	40011800 	.word	0x40011800
 8001e98:	bffee400 	.word	0xbffee400

08001e9c <USART_GetITStatus>:
 8001e9c:	b538      	push	{r3, r4, r5, lr}
 8001e9e:	4b36      	ldr	r3, [pc, #216]	; (8001f78 <USART_GetITStatus+0xdc>)
 8001ea0:	1c05      	adds	r5, r0, #0
 8001ea2:	1c0c      	adds	r4, r1, #0
 8001ea4:	4298      	cmp	r0, r3
 8001ea6:	d016      	beq.n	8001ed6 <USART_GetITStatus+0x3a>
 8001ea8:	4b34      	ldr	r3, [pc, #208]	; (8001f7c <USART_GetITStatus+0xe0>)
 8001eaa:	4298      	cmp	r0, r3
 8001eac:	d013      	beq.n	8001ed6 <USART_GetITStatus+0x3a>
 8001eae:	4b34      	ldr	r3, [pc, #208]	; (8001f80 <USART_GetITStatus+0xe4>)
 8001eb0:	4298      	cmp	r0, r3
 8001eb2:	d010      	beq.n	8001ed6 <USART_GetITStatus+0x3a>
 8001eb4:	4b33      	ldr	r3, [pc, #204]	; (8001f84 <USART_GetITStatus+0xe8>)
 8001eb6:	4298      	cmp	r0, r3
 8001eb8:	d00d      	beq.n	8001ed6 <USART_GetITStatus+0x3a>
 8001eba:	4b33      	ldr	r3, [pc, #204]	; (8001f88 <USART_GetITStatus+0xec>)
 8001ebc:	4298      	cmp	r0, r3
 8001ebe:	d00a      	beq.n	8001ed6 <USART_GetITStatus+0x3a>
 8001ec0:	4b32      	ldr	r3, [pc, #200]	; (8001f8c <USART_GetITStatus+0xf0>)
 8001ec2:	4298      	cmp	r0, r3
 8001ec4:	d007      	beq.n	8001ed6 <USART_GetITStatus+0x3a>
 8001ec6:	4b32      	ldr	r3, [pc, #200]	; (8001f90 <USART_GetITStatus+0xf4>)
 8001ec8:	4298      	cmp	r0, r3
 8001eca:	d004      	beq.n	8001ed6 <USART_GetITStatus+0x3a>
 8001ecc:	4a31      	ldr	r2, [pc, #196]	; (8001f94 <USART_GetITStatus+0xf8>)
 8001ece:	1880      	adds	r0, r0, r2
 8001ed0:	4243      	negs	r3, r0
 8001ed2:	4158      	adcs	r0, r3
 8001ed4:	e000      	b.n	8001ed8 <USART_GetITStatus+0x3c>
 8001ed6:	2001      	movs	r0, #1
 8001ed8:	f7ff fb18 	bl	800150c <assert_param>
 8001edc:	2384      	movs	r3, #132	; 0x84
 8001ede:	005b      	lsls	r3, r3, #1
 8001ee0:	429c      	cmp	r4, r3
 8001ee2:	d027      	beq.n	8001f34 <USART_GetITStatus+0x98>
 8001ee4:	4b2c      	ldr	r3, [pc, #176]	; (8001f98 <USART_GetITStatus+0xfc>)
 8001ee6:	429c      	cmp	r4, r3
 8001ee8:	d024      	beq.n	8001f34 <USART_GetITStatus+0x98>
 8001eea:	4b2c      	ldr	r3, [pc, #176]	; (8001f9c <USART_GetITStatus+0x100>)
 8001eec:	429c      	cmp	r4, r3
 8001eee:	d021      	beq.n	8001f34 <USART_GetITStatus+0x98>
 8001ef0:	4b2b      	ldr	r3, [pc, #172]	; (8001fa0 <USART_GetITStatus+0x104>)
 8001ef2:	429c      	cmp	r4, r3
 8001ef4:	d01e      	beq.n	8001f34 <USART_GetITStatus+0x98>
 8001ef6:	4b2b      	ldr	r3, [pc, #172]	; (8001fa4 <USART_GetITStatus+0x108>)
 8001ef8:	429c      	cmp	r4, r3
 8001efa:	d01b      	beq.n	8001f34 <USART_GetITStatus+0x98>
 8001efc:	4b2a      	ldr	r3, [pc, #168]	; (8001fa8 <USART_GetITStatus+0x10c>)
 8001efe:	429c      	cmp	r4, r3
 8001f00:	d018      	beq.n	8001f34 <USART_GetITStatus+0x98>
 8001f02:	4b2a      	ldr	r3, [pc, #168]	; (8001fac <USART_GetITStatus+0x110>)
 8001f04:	429c      	cmp	r4, r3
 8001f06:	d015      	beq.n	8001f34 <USART_GetITStatus+0x98>
 8001f08:	4b29      	ldr	r3, [pc, #164]	; (8001fb0 <USART_GetITStatus+0x114>)
 8001f0a:	429c      	cmp	r4, r3
 8001f0c:	d012      	beq.n	8001f34 <USART_GetITStatus+0x98>
 8001f0e:	4a29      	ldr	r2, [pc, #164]	; (8001fb4 <USART_GetITStatus+0x118>)
 8001f10:	4b29      	ldr	r3, [pc, #164]	; (8001fb8 <USART_GetITStatus+0x11c>)
 8001f12:	4022      	ands	r2, r4
 8001f14:	429a      	cmp	r2, r3
 8001f16:	d00d      	beq.n	8001f34 <USART_GetITStatus+0x98>
 8001f18:	4b28      	ldr	r3, [pc, #160]	; (8001fbc <USART_GetITStatus+0x120>)
 8001f1a:	429c      	cmp	r4, r3
 8001f1c:	d00a      	beq.n	8001f34 <USART_GetITStatus+0x98>
 8001f1e:	4b28      	ldr	r3, [pc, #160]	; (8001fc0 <USART_GetITStatus+0x124>)
 8001f20:	429c      	cmp	r4, r3
 8001f22:	d007      	beq.n	8001f34 <USART_GetITStatus+0x98>
 8001f24:	4b27      	ldr	r3, [pc, #156]	; (8001fc4 <USART_GetITStatus+0x128>)
 8001f26:	429c      	cmp	r4, r3
 8001f28:	d004      	beq.n	8001f34 <USART_GetITStatus+0x98>
 8001f2a:	4a27      	ldr	r2, [pc, #156]	; (8001fc8 <USART_GetITStatus+0x12c>)
 8001f2c:	18a3      	adds	r3, r4, r2
 8001f2e:	4258      	negs	r0, r3
 8001f30:	4158      	adcs	r0, r3
 8001f32:	e000      	b.n	8001f36 <USART_GetITStatus+0x9a>
 8001f34:	2001      	movs	r0, #1
 8001f36:	f7ff fae9 	bl	800150c <assert_param>
 8001f3a:	b2e3      	uxtb	r3, r4
 8001f3c:	2101      	movs	r1, #1
 8001f3e:	b2a2      	uxth	r2, r4
 8001f40:	4099      	lsls	r1, r3
 8001f42:	0a12      	lsrs	r2, r2, #8
 8001f44:	1c0b      	adds	r3, r1, #0
 8001f46:	2a01      	cmp	r2, #1
 8001f48:	d101      	bne.n	8001f4e <USART_GetITStatus+0xb2>
 8001f4a:	682a      	ldr	r2, [r5, #0]
 8001f4c:	e004      	b.n	8001f58 <USART_GetITStatus+0xbc>
 8001f4e:	2a02      	cmp	r2, #2
 8001f50:	d101      	bne.n	8001f56 <USART_GetITStatus+0xba>
 8001f52:	686a      	ldr	r2, [r5, #4]
 8001f54:	e000      	b.n	8001f58 <USART_GetITStatus+0xbc>
 8001f56:	68aa      	ldr	r2, [r5, #8]
 8001f58:	2000      	movs	r0, #0
 8001f5a:	4013      	ands	r3, r2
 8001f5c:	69ea      	ldr	r2, [r5, #28]
 8001f5e:	4283      	cmp	r3, r0
 8001f60:	d008      	beq.n	8001f74 <USART_GetITStatus+0xd8>
 8001f62:	0c24      	lsrs	r4, r4, #16
 8001f64:	2001      	movs	r0, #1
 8001f66:	40a0      	lsls	r0, r4
 8001f68:	1c04      	adds	r4, r0, #0
 8001f6a:	1c10      	adds	r0, r2, #0
 8001f6c:	4020      	ands	r0, r4
 8001f6e:	1e44      	subs	r4, r0, #1
 8001f70:	41a0      	sbcs	r0, r4
 8001f72:	b2c0      	uxtb	r0, r0
 8001f74:	bd38      	pop	{r3, r4, r5, pc}
 8001f76:	46c0      	nop			; (mov r8, r8)
 8001f78:	40013800 	.word	0x40013800
 8001f7c:	40004400 	.word	0x40004400
 8001f80:	40004800 	.word	0x40004800
 8001f84:	40004c00 	.word	0x40004c00
 8001f88:	40005000 	.word	0x40005000
 8001f8c:	40011400 	.word	0x40011400
 8001f90:	40011800 	.word	0x40011800
 8001f94:	bffee400 	.word	0xbffee400
 8001f98:	00070107 	.word	0x00070107
 8001f9c:	00060106 	.word	0x00060106
 8001fa0:	00050105 	.word	0x00050105
 8001fa4:	00040104 	.word	0x00040104
 8001fa8:	00080206 	.word	0x00080206
 8001fac:	0009030a 	.word	0x0009030a
 8001fb0:	00020300 	.word	0x00020300
 8001fb4:	fffdffff 	.word	0xfffdffff
 8001fb8:	00010300 	.word	0x00010300
 8001fbc:	000b011a 	.word	0x000b011a
 8001fc0:	000c011b 	.word	0x000c011b
 8001fc4:	0011010e 	.word	0x0011010e
 8001fc8:	ffebfcea 	.word	0xffebfcea

08001fcc <USART_ClearITPendingBit>:
 8001fcc:	b538      	push	{r3, r4, r5, lr}
 8001fce:	4b26      	ldr	r3, [pc, #152]	; (8002068 <USART_ClearITPendingBit+0x9c>)
 8001fd0:	1c05      	adds	r5, r0, #0
 8001fd2:	1c0c      	adds	r4, r1, #0
 8001fd4:	4298      	cmp	r0, r3
 8001fd6:	d016      	beq.n	8002006 <USART_ClearITPendingBit+0x3a>
 8001fd8:	4b24      	ldr	r3, [pc, #144]	; (800206c <USART_ClearITPendingBit+0xa0>)
 8001fda:	4298      	cmp	r0, r3
 8001fdc:	d013      	beq.n	8002006 <USART_ClearITPendingBit+0x3a>
 8001fde:	4b24      	ldr	r3, [pc, #144]	; (8002070 <USART_ClearITPendingBit+0xa4>)
 8001fe0:	4298      	cmp	r0, r3
 8001fe2:	d010      	beq.n	8002006 <USART_ClearITPendingBit+0x3a>
 8001fe4:	4b23      	ldr	r3, [pc, #140]	; (8002074 <USART_ClearITPendingBit+0xa8>)
 8001fe6:	4298      	cmp	r0, r3
 8001fe8:	d00d      	beq.n	8002006 <USART_ClearITPendingBit+0x3a>
 8001fea:	4b23      	ldr	r3, [pc, #140]	; (8002078 <USART_ClearITPendingBit+0xac>)
 8001fec:	4298      	cmp	r0, r3
 8001fee:	d00a      	beq.n	8002006 <USART_ClearITPendingBit+0x3a>
 8001ff0:	4b22      	ldr	r3, [pc, #136]	; (800207c <USART_ClearITPendingBit+0xb0>)
 8001ff2:	4298      	cmp	r0, r3
 8001ff4:	d007      	beq.n	8002006 <USART_ClearITPendingBit+0x3a>
 8001ff6:	4b22      	ldr	r3, [pc, #136]	; (8002080 <USART_ClearITPendingBit+0xb4>)
 8001ff8:	4298      	cmp	r0, r3
 8001ffa:	d004      	beq.n	8002006 <USART_ClearITPendingBit+0x3a>
 8001ffc:	4a21      	ldr	r2, [pc, #132]	; (8002084 <USART_ClearITPendingBit+0xb8>)
 8001ffe:	1880      	adds	r0, r0, r2
 8002000:	4243      	negs	r3, r0
 8002002:	4158      	adcs	r0, r3
 8002004:	e000      	b.n	8002008 <USART_ClearITPendingBit+0x3c>
 8002006:	2001      	movs	r0, #1
 8002008:	f7ff fa80 	bl	800150c <assert_param>
 800200c:	4b1e      	ldr	r3, [pc, #120]	; (8002088 <USART_ClearITPendingBit+0xbc>)
 800200e:	429c      	cmp	r4, r3
 8002010:	d022      	beq.n	8002058 <USART_ClearITPendingBit+0x8c>
 8002012:	2384      	movs	r3, #132	; 0x84
 8002014:	005b      	lsls	r3, r3, #1
 8002016:	429c      	cmp	r4, r3
 8002018:	d01e      	beq.n	8002058 <USART_ClearITPendingBit+0x8c>
 800201a:	4a1c      	ldr	r2, [pc, #112]	; (800208c <USART_ClearITPendingBit+0xc0>)
 800201c:	4b1c      	ldr	r3, [pc, #112]	; (8002090 <USART_ClearITPendingBit+0xc4>)
 800201e:	4022      	ands	r2, r4
 8002020:	429a      	cmp	r2, r3
 8002022:	d019      	beq.n	8002058 <USART_ClearITPendingBit+0x8c>
 8002024:	4b1b      	ldr	r3, [pc, #108]	; (8002094 <USART_ClearITPendingBit+0xc8>)
 8002026:	429c      	cmp	r4, r3
 8002028:	d016      	beq.n	8002058 <USART_ClearITPendingBit+0x8c>
 800202a:	4b1b      	ldr	r3, [pc, #108]	; (8002098 <USART_ClearITPendingBit+0xcc>)
 800202c:	429c      	cmp	r4, r3
 800202e:	d013      	beq.n	8002058 <USART_ClearITPendingBit+0x8c>
 8002030:	4b1a      	ldr	r3, [pc, #104]	; (800209c <USART_ClearITPendingBit+0xd0>)
 8002032:	429c      	cmp	r4, r3
 8002034:	d010      	beq.n	8002058 <USART_ClearITPendingBit+0x8c>
 8002036:	4b1a      	ldr	r3, [pc, #104]	; (80020a0 <USART_ClearITPendingBit+0xd4>)
 8002038:	429c      	cmp	r4, r3
 800203a:	d00d      	beq.n	8002058 <USART_ClearITPendingBit+0x8c>
 800203c:	4b19      	ldr	r3, [pc, #100]	; (80020a4 <USART_ClearITPendingBit+0xd8>)
 800203e:	429c      	cmp	r4, r3
 8002040:	d00a      	beq.n	8002058 <USART_ClearITPendingBit+0x8c>
 8002042:	4b19      	ldr	r3, [pc, #100]	; (80020a8 <USART_ClearITPendingBit+0xdc>)
 8002044:	429c      	cmp	r4, r3
 8002046:	d007      	beq.n	8002058 <USART_ClearITPendingBit+0x8c>
 8002048:	4b18      	ldr	r3, [pc, #96]	; (80020ac <USART_ClearITPendingBit+0xe0>)
 800204a:	429c      	cmp	r4, r3
 800204c:	d004      	beq.n	8002058 <USART_ClearITPendingBit+0x8c>
 800204e:	4a18      	ldr	r2, [pc, #96]	; (80020b0 <USART_ClearITPendingBit+0xe4>)
 8002050:	18a3      	adds	r3, r4, r2
 8002052:	4258      	negs	r0, r3
 8002054:	4158      	adcs	r0, r3
 8002056:	e000      	b.n	800205a <USART_ClearITPendingBit+0x8e>
 8002058:	2001      	movs	r0, #1
 800205a:	f7ff fa57 	bl	800150c <assert_param>
 800205e:	0c24      	lsrs	r4, r4, #16
 8002060:	2301      	movs	r3, #1
 8002062:	40a3      	lsls	r3, r4
 8002064:	622b      	str	r3, [r5, #32]
 8002066:	bd38      	pop	{r3, r4, r5, pc}
 8002068:	40013800 	.word	0x40013800
 800206c:	40004400 	.word	0x40004400
 8002070:	40004800 	.word	0x40004800
 8002074:	40004c00 	.word	0x40004c00
 8002078:	40005000 	.word	0x40005000
 800207c:	40011400 	.word	0x40011400
 8002080:	40011800 	.word	0x40011800
 8002084:	bffee400 	.word	0xbffee400
 8002088:	00060106 	.word	0x00060106
 800208c:	fffdffff 	.word	0xfffdffff
 8002090:	00010300 	.word	0x00010300
 8002094:	00020300 	.word	0x00020300
 8002098:	00040104 	.word	0x00040104
 800209c:	00080206 	.word	0x00080206
 80020a0:	0009030a 	.word	0x0009030a
 80020a4:	000b011a 	.word	0x000b011a
 80020a8:	000c011b 	.word	0x000c011b
 80020ac:	0011010e 	.word	0x0011010e
 80020b0:	ffebfcea 	.word	0xffebfcea

080020b4 <ADC_DeInit>:
 80020b4:	4b0a      	ldr	r3, [pc, #40]	; (80020e0 <ADC_DeInit+0x2c>)
 80020b6:	b510      	push	{r4, lr}
 80020b8:	18c4      	adds	r4, r0, r3
 80020ba:	4263      	negs	r3, r4
 80020bc:	415c      	adcs	r4, r3
 80020be:	b2e4      	uxtb	r4, r4
 80020c0:	1c20      	adds	r0, r4, #0
 80020c2:	f7ff fa23 	bl	800150c <assert_param>
 80020c6:	2c00      	cmp	r4, #0
 80020c8:	d009      	beq.n	80020de <ADC_DeInit+0x2a>
 80020ca:	2080      	movs	r0, #128	; 0x80
 80020cc:	0080      	lsls	r0, r0, #2
 80020ce:	2101      	movs	r1, #1
 80020d0:	f000 fbd6 	bl	8002880 <RCC_APB2PeriphResetCmd>
 80020d4:	2080      	movs	r0, #128	; 0x80
 80020d6:	0080      	lsls	r0, r0, #2
 80020d8:	2100      	movs	r1, #0
 80020da:	f000 fbd1 	bl	8002880 <RCC_APB2PeriphResetCmd>
 80020de:	bd10      	pop	{r4, pc}
 80020e0:	bffedc00 	.word	0xbffedc00

080020e4 <ADC_Init>:
 80020e4:	b570      	push	{r4, r5, r6, lr}
 80020e6:	1c0c      	adds	r4, r1, #0
 80020e8:	4924      	ldr	r1, [pc, #144]	; (800217c <ADC_Init+0x98>)
 80020ea:	1c05      	adds	r5, r0, #0
 80020ec:	1840      	adds	r0, r0, r1
 80020ee:	4243      	negs	r3, r0
 80020f0:	4158      	adcs	r0, r3
 80020f2:	f7ff fa0b 	bl	800150c <assert_param>
 80020f6:	6820      	ldr	r0, [r4, #0]
 80020f8:	2318      	movs	r3, #24
 80020fa:	4398      	bics	r0, r3
 80020fc:	4243      	negs	r3, r0
 80020fe:	4158      	adcs	r0, r3
 8002100:	f7ff fa04 	bl	800150c <assert_param>
 8002104:	7923      	ldrb	r3, [r4, #4]
 8002106:	2601      	movs	r6, #1
 8002108:	2000      	movs	r0, #0
 800210a:	429e      	cmp	r6, r3
 800210c:	4140      	adcs	r0, r0
 800210e:	f7ff f9fd 	bl	800150c <assert_param>
 8002112:	68a3      	ldr	r3, [r4, #8]
 8002114:	481a      	ldr	r0, [pc, #104]	; (8002180 <ADC_Init+0x9c>)
 8002116:	4018      	ands	r0, r3
 8002118:	4243      	negs	r3, r0
 800211a:	4158      	adcs	r0, r3
 800211c:	f7ff f9f6 	bl	800150c <assert_param>
 8002120:	68e3      	ldr	r3, [r4, #12]
 8002122:	22c0      	movs	r2, #192	; 0xc0
 8002124:	1c19      	adds	r1, r3, #0
 8002126:	4391      	bics	r1, r2
 8002128:	1c30      	adds	r0, r6, #0
 800212a:	2900      	cmp	r1, #0
 800212c:	d003      	beq.n	8002136 <ADC_Init+0x52>
 800212e:	1e58      	subs	r0, r3, #1
 8002130:	38ff      	subs	r0, #255	; 0xff
 8002132:	4243      	negs	r3, r0
 8002134:	4158      	adcs	r0, r3
 8002136:	f7ff f9e9 	bl	800150c <assert_param>
 800213a:	6920      	ldr	r0, [r4, #16]
 800213c:	2320      	movs	r3, #32
 800213e:	4398      	bics	r0, r3
 8002140:	4243      	negs	r3, r0
 8002142:	4158      	adcs	r0, r3
 8002144:	f7ff f9e2 	bl	800150c <assert_param>
 8002148:	6960      	ldr	r0, [r4, #20]
 800214a:	2304      	movs	r3, #4
 800214c:	4398      	bics	r0, r3
 800214e:	4243      	negs	r3, r0
 8002150:	4158      	adcs	r0, r3
 8002152:	f7ff f9db 	bl	800150c <assert_param>
 8002156:	6823      	ldr	r3, [r4, #0]
 8002158:	68a2      	ldr	r2, [r4, #8]
 800215a:	68e9      	ldr	r1, [r5, #12]
 800215c:	431a      	orrs	r2, r3
 800215e:	68e3      	ldr	r3, [r4, #12]
 8002160:	431a      	orrs	r2, r3
 8002162:	6923      	ldr	r3, [r4, #16]
 8002164:	431a      	orrs	r2, r3
 8002166:	6963      	ldr	r3, [r4, #20]
 8002168:	431a      	orrs	r2, r3
 800216a:	4b06      	ldr	r3, [pc, #24]	; (8002184 <ADC_Init+0xa0>)
 800216c:	400b      	ands	r3, r1
 800216e:	4313      	orrs	r3, r2
 8002170:	7922      	ldrb	r2, [r4, #4]
 8002172:	0352      	lsls	r2, r2, #13
 8002174:	4313      	orrs	r3, r2
 8002176:	60eb      	str	r3, [r5, #12]
 8002178:	bd70      	pop	{r4, r5, r6, pc}
 800217a:	46c0      	nop			; (mov r8, r8)
 800217c:	bffedc00 	.word	0xbffedc00
 8002180:	fffff3ff 	.word	0xfffff3ff
 8002184:	ffffd203 	.word	0xffffd203

08002188 <ADC_Cmd>:
 8002188:	4b0c      	ldr	r3, [pc, #48]	; (80021bc <ADC_Cmd+0x34>)
 800218a:	b570      	push	{r4, r5, r6, lr}
 800218c:	1c04      	adds	r4, r0, #0
 800218e:	18c0      	adds	r0, r0, r3
 8002190:	4243      	negs	r3, r0
 8002192:	4158      	adcs	r0, r3
 8002194:	1c0e      	adds	r6, r1, #0
 8002196:	2501      	movs	r5, #1
 8002198:	f7ff f9b8 	bl	800150c <assert_param>
 800219c:	2000      	movs	r0, #0
 800219e:	42b5      	cmp	r5, r6
 80021a0:	4140      	adcs	r0, r0
 80021a2:	f7ff f9b3 	bl	800150c <assert_param>
 80021a6:	68a3      	ldr	r3, [r4, #8]
 80021a8:	2e00      	cmp	r6, #0
 80021aa:	d002      	beq.n	80021b2 <ADC_Cmd+0x2a>
 80021ac:	431d      	orrs	r5, r3
 80021ae:	60a5      	str	r5, [r4, #8]
 80021b0:	e002      	b.n	80021b8 <ADC_Cmd+0x30>
 80021b2:	2202      	movs	r2, #2
 80021b4:	4313      	orrs	r3, r2
 80021b6:	60a3      	str	r3, [r4, #8]
 80021b8:	bd70      	pop	{r4, r5, r6, pc}
 80021ba:	46c0      	nop			; (mov r8, r8)
 80021bc:	bffedc00 	.word	0xbffedc00

080021c0 <ADC_TempSensorCmd>:
 80021c0:	2301      	movs	r3, #1
 80021c2:	b510      	push	{r4, lr}
 80021c4:	1c04      	adds	r4, r0, #0
 80021c6:	2000      	movs	r0, #0
 80021c8:	42a3      	cmp	r3, r4
 80021ca:	4140      	adcs	r0, r0
 80021cc:	f7ff f99e 	bl	800150c <assert_param>
 80021d0:	4b05      	ldr	r3, [pc, #20]	; (80021e8 <ADC_TempSensorCmd+0x28>)
 80021d2:	6819      	ldr	r1, [r3, #0]
 80021d4:	2c00      	cmp	r4, #0
 80021d6:	d003      	beq.n	80021e0 <ADC_TempSensorCmd+0x20>
 80021d8:	2280      	movs	r2, #128	; 0x80
 80021da:	0412      	lsls	r2, r2, #16
 80021dc:	430a      	orrs	r2, r1
 80021de:	e001      	b.n	80021e4 <ADC_TempSensorCmd+0x24>
 80021e0:	4a02      	ldr	r2, [pc, #8]	; (80021ec <ADC_TempSensorCmd+0x2c>)
 80021e2:	400a      	ands	r2, r1
 80021e4:	601a      	str	r2, [r3, #0]
 80021e6:	bd10      	pop	{r4, pc}
 80021e8:	40012708 	.word	0x40012708
 80021ec:	ff7fffff 	.word	0xff7fffff

080021f0 <ADC_ChannelConfig>:
 80021f0:	4b0e      	ldr	r3, [pc, #56]	; (800222c <ADC_ChannelConfig+0x3c>)
 80021f2:	b570      	push	{r4, r5, r6, lr}
 80021f4:	1c04      	adds	r4, r0, #0
 80021f6:	18c0      	adds	r0, r0, r3
 80021f8:	4243      	negs	r3, r0
 80021fa:	4158      	adcs	r0, r3
 80021fc:	1c0d      	adds	r5, r1, #0
 80021fe:	1c16      	adds	r6, r2, #0
 8002200:	f7ff f984 	bl	800150c <assert_param>
 8002204:	2000      	movs	r0, #0
 8002206:	4285      	cmp	r5, r0
 8002208:	d002      	beq.n	8002210 <ADC_ChannelConfig+0x20>
 800220a:	0ce8      	lsrs	r0, r5, #19
 800220c:	4243      	negs	r3, r0
 800220e:	4158      	adcs	r0, r3
 8002210:	f7ff f97c 	bl	800150c <assert_param>
 8002214:	2307      	movs	r3, #7
 8002216:	2000      	movs	r0, #0
 8002218:	42b3      	cmp	r3, r6
 800221a:	4140      	adcs	r0, r0
 800221c:	f7ff f976 	bl	800150c <assert_param>
 8002220:	6aa3      	ldr	r3, [r4, #40]	; 0x28
 8002222:	431d      	orrs	r5, r3
 8002224:	62a5      	str	r5, [r4, #40]	; 0x28
 8002226:	6166      	str	r6, [r4, #20]
 8002228:	bd70      	pop	{r4, r5, r6, pc}
 800222a:	46c0      	nop			; (mov r8, r8)
 800222c:	bffedc00 	.word	0xbffedc00

08002230 <ADC_GetCalibrationFactor>:
 8002230:	4b0e      	ldr	r3, [pc, #56]	; (800226c <ADC_GetCalibrationFactor+0x3c>)
 8002232:	b510      	push	{r4, lr}
 8002234:	1c04      	adds	r4, r0, #0
 8002236:	18c0      	adds	r0, r0, r3
 8002238:	4243      	negs	r3, r0
 800223a:	4158      	adcs	r0, r3
 800223c:	f7ff f966 	bl	800150c <assert_param>
 8002240:	68a2      	ldr	r2, [r4, #8]
 8002242:	2380      	movs	r3, #128	; 0x80
 8002244:	061b      	lsls	r3, r3, #24
 8002246:	4313      	orrs	r3, r2
 8002248:	60a3      	str	r3, [r4, #8]
 800224a:	23f0      	movs	r3, #240	; 0xf0
 800224c:	021b      	lsls	r3, r3, #8
 800224e:	68a2      	ldr	r2, [r4, #8]
 8002250:	3b01      	subs	r3, #1
 8002252:	0fd2      	lsrs	r2, r2, #31
 8002254:	07d2      	lsls	r2, r2, #31
 8002256:	2b00      	cmp	r3, #0
 8002258:	d001      	beq.n	800225e <ADC_GetCalibrationFactor+0x2e>
 800225a:	2a00      	cmp	r2, #0
 800225c:	d1f7      	bne.n	800224e <ADC_GetCalibrationFactor+0x1e>
 800225e:	68a3      	ldr	r3, [r4, #8]
 8002260:	2b00      	cmp	r3, #0
 8002262:	db01      	blt.n	8002268 <ADC_GetCalibrationFactor+0x38>
 8002264:	6c20      	ldr	r0, [r4, #64]	; 0x40
 8002266:	e000      	b.n	800226a <ADC_GetCalibrationFactor+0x3a>
 8002268:	2000      	movs	r0, #0
 800226a:	bd10      	pop	{r4, pc}
 800226c:	bffedc00 	.word	0xbffedc00

08002270 <ADC_StartOfConversion>:
 8002270:	4b06      	ldr	r3, [pc, #24]	; (800228c <ADC_StartOfConversion+0x1c>)
 8002272:	b510      	push	{r4, lr}
 8002274:	1c04      	adds	r4, r0, #0
 8002276:	18c0      	adds	r0, r0, r3
 8002278:	4243      	negs	r3, r0
 800227a:	4158      	adcs	r0, r3
 800227c:	f7ff f946 	bl	800150c <assert_param>
 8002280:	68a3      	ldr	r3, [r4, #8]
 8002282:	2204      	movs	r2, #4
 8002284:	4313      	orrs	r3, r2
 8002286:	60a3      	str	r3, [r4, #8]
 8002288:	bd10      	pop	{r4, pc}
 800228a:	46c0      	nop			; (mov r8, r8)
 800228c:	bffedc00 	.word	0xbffedc00

08002290 <ADC_GetConversionValue>:
 8002290:	4b05      	ldr	r3, [pc, #20]	; (80022a8 <ADC_GetConversionValue+0x18>)
 8002292:	b510      	push	{r4, lr}
 8002294:	1c04      	adds	r4, r0, #0
 8002296:	18c0      	adds	r0, r0, r3
 8002298:	4243      	negs	r3, r0
 800229a:	4158      	adcs	r0, r3
 800229c:	f7ff f936 	bl	800150c <assert_param>
 80022a0:	6c20      	ldr	r0, [r4, #64]	; 0x40
 80022a2:	b280      	uxth	r0, r0
 80022a4:	bd10      	pop	{r4, pc}
 80022a6:	46c0      	nop			; (mov r8, r8)
 80022a8:	bffedc00 	.word	0xbffedc00

080022ac <ADC_GetFlagStatus>:
 80022ac:	4a15      	ldr	r2, [pc, #84]	; (8002304 <ADC_GetFlagStatus+0x58>)
 80022ae:	b570      	push	{r4, r5, r6, lr}
 80022b0:	1c05      	adds	r5, r0, #0
 80022b2:	1880      	adds	r0, r0, r2
 80022b4:	1c0c      	adds	r4, r1, #0
 80022b6:	4243      	negs	r3, r0
 80022b8:	4158      	adcs	r0, r3
 80022ba:	4e13      	ldr	r6, [pc, #76]	; (8002308 <ADC_GetFlagStatus+0x5c>)
 80022bc:	f7ff f926 	bl	800150c <assert_param>
 80022c0:	1c23      	adds	r3, r4, #0
 80022c2:	4033      	ands	r3, r6
 80022c4:	1e5a      	subs	r2, r3, #1
 80022c6:	2a01      	cmp	r2, #1
 80022c8:	d90d      	bls.n	80022e6 <ADC_GetFlagStatus+0x3a>
 80022ca:	2b04      	cmp	r3, #4
 80022cc:	d00b      	beq.n	80022e6 <ADC_GetFlagStatus+0x3a>
 80022ce:	2c08      	cmp	r4, #8
 80022d0:	d009      	beq.n	80022e6 <ADC_GetFlagStatus+0x3a>
 80022d2:	2c80      	cmp	r4, #128	; 0x80
 80022d4:	d007      	beq.n	80022e6 <ADC_GetFlagStatus+0x3a>
 80022d6:	2b10      	cmp	r3, #16
 80022d8:	d005      	beq.n	80022e6 <ADC_GetFlagStatus+0x3a>
 80022da:	22fe      	movs	r2, #254	; 0xfe
 80022dc:	05d2      	lsls	r2, r2, #23
 80022de:	18a3      	adds	r3, r4, r2
 80022e0:	4258      	negs	r0, r3
 80022e2:	4158      	adcs	r0, r3
 80022e4:	e000      	b.n	80022e8 <ADC_GetFlagStatus+0x3c>
 80022e6:	2001      	movs	r0, #1
 80022e8:	f7ff f910 	bl	800150c <assert_param>
 80022ec:	01e3      	lsls	r3, r4, #7
 80022ee:	d502      	bpl.n	80022f6 <ADC_GetFlagStatus+0x4a>
 80022f0:	68ab      	ldr	r3, [r5, #8]
 80022f2:	401e      	ands	r6, r3
 80022f4:	e000      	b.n	80022f8 <ADC_GetFlagStatus+0x4c>
 80022f6:	682e      	ldr	r6, [r5, #0]
 80022f8:	4026      	ands	r6, r4
 80022fa:	1e74      	subs	r4, r6, #1
 80022fc:	41a6      	sbcs	r6, r4
 80022fe:	b2f0      	uxtb	r0, r6
 8002300:	bd70      	pop	{r4, r5, r6, pc}
 8002302:	46c0      	nop			; (mov r8, r8)
 8002304:	bffedc00 	.word	0xbffedc00
 8002308:	feffffff 	.word	0xfeffffff

0800230c <ADC_ClearFlag>:
 800230c:	b538      	push	{r3, r4, r5, lr}
 800230e:	4b0a      	ldr	r3, [pc, #40]	; (8002338 <ADC_ClearFlag+0x2c>)
 8002310:	1c05      	adds	r5, r0, #0
 8002312:	18c0      	adds	r0, r0, r3
 8002314:	4243      	negs	r3, r0
 8002316:	4158      	adcs	r0, r3
 8002318:	1c0c      	adds	r4, r1, #0
 800231a:	f7ff f8f7 	bl	800150c <assert_param>
 800231e:	2000      	movs	r0, #0
 8002320:	4284      	cmp	r4, r0
 8002322:	d004      	beq.n	800232e <ADC_ClearFlag+0x22>
 8002324:	239f      	movs	r3, #159	; 0x9f
 8002326:	1c20      	adds	r0, r4, #0
 8002328:	4398      	bics	r0, r3
 800232a:	4243      	negs	r3, r0
 800232c:	4158      	adcs	r0, r3
 800232e:	f7ff f8ed 	bl	800150c <assert_param>
 8002332:	602c      	str	r4, [r5, #0]
 8002334:	bd38      	pop	{r3, r4, r5, pc}
 8002336:	46c0      	nop			; (mov r8, r8)
 8002338:	bffedc00 	.word	0xbffedc00

0800233c <SPI_Init>:
 800233c:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
 800233e:	4b4d      	ldr	r3, [pc, #308]	; (8002474 <SPI_Init+0x138>)
 8002340:	1c05      	adds	r5, r0, #0
 8002342:	1c0c      	adds	r4, r1, #0
 8002344:	4298      	cmp	r0, r3
 8002346:	d004      	beq.n	8002352 <SPI_Init+0x16>
 8002348:	4b4b      	ldr	r3, [pc, #300]	; (8002478 <SPI_Init+0x13c>)
 800234a:	18c0      	adds	r0, r0, r3
 800234c:	4243      	negs	r3, r0
 800234e:	4158      	adcs	r0, r3
 8002350:	e000      	b.n	8002354 <SPI_Init+0x18>
 8002352:	2001      	movs	r0, #1
 8002354:	f7ff f8da 	bl	800150c <assert_param>
 8002358:	4e48      	ldr	r6, [pc, #288]	; (800247c <SPI_Init+0x140>)
 800235a:	8823      	ldrh	r3, [r4, #0]
 800235c:	4233      	tst	r3, r6
 800235e:	d101      	bne.n	8002364 <SPI_Init+0x28>
 8002360:	2001      	movs	r0, #1
 8002362:	e006      	b.n	8002372 <SPI_Init+0x36>
 8002364:	4a46      	ldr	r2, [pc, #280]	; (8002480 <SPI_Init+0x144>)
 8002366:	4013      	ands	r3, r2
 8002368:	2280      	movs	r2, #128	; 0x80
 800236a:	0212      	lsls	r2, r2, #8
 800236c:	4293      	cmp	r3, r2
 800236e:	d0f7      	beq.n	8002360 <SPI_Init+0x24>
 8002370:	2000      	movs	r0, #0
 8002372:	f7ff f8cb 	bl	800150c <assert_param>
 8002376:	8860      	ldrh	r0, [r4, #2]
 8002378:	2382      	movs	r3, #130	; 0x82
 800237a:	005b      	lsls	r3, r3, #1
 800237c:	4298      	cmp	r0, r3
 800237e:	d002      	beq.n	8002386 <SPI_Init+0x4a>
 8002380:	4243      	negs	r3, r0
 8002382:	4158      	adcs	r0, r3
 8002384:	e000      	b.n	8002388 <SPI_Init+0x4c>
 8002386:	2001      	movs	r0, #1
 8002388:	f7ff f8c0 	bl	800150c <assert_param>
 800238c:	88a0      	ldrh	r0, [r4, #4]
 800238e:	23c0      	movs	r3, #192	; 0xc0
 8002390:	1c02      	adds	r2, r0, #0
 8002392:	4032      	ands	r2, r6
 8002394:	009b      	lsls	r3, r3, #2
 8002396:	4e3b      	ldr	r6, [pc, #236]	; (8002484 <SPI_Init+0x148>)
 8002398:	429a      	cmp	r2, r3
 800239a:	d016      	beq.n	80023ca <SPI_Init+0x8e>
 800239c:	4a3a      	ldr	r2, [pc, #232]	; (8002488 <SPI_Init+0x14c>)
 800239e:	2380      	movs	r3, #128	; 0x80
 80023a0:	4002      	ands	r2, r0
 80023a2:	00db      	lsls	r3, r3, #3
 80023a4:	429a      	cmp	r2, r3
 80023a6:	d010      	beq.n	80023ca <SPI_Init+0x8e>
 80023a8:	1c02      	adds	r2, r0, #0
 80023aa:	23c0      	movs	r3, #192	; 0xc0
 80023ac:	4032      	ands	r2, r6
 80023ae:	00db      	lsls	r3, r3, #3
 80023b0:	429a      	cmp	r2, r3
 80023b2:	d00a      	beq.n	80023ca <SPI_Init+0x8e>
 80023b4:	4a35      	ldr	r2, [pc, #212]	; (800248c <SPI_Init+0x150>)
 80023b6:	2380      	movs	r3, #128	; 0x80
 80023b8:	4002      	ands	r2, r0
 80023ba:	011b      	lsls	r3, r3, #4
 80023bc:	429a      	cmp	r2, r3
 80023be:	d004      	beq.n	80023ca <SPI_Init+0x8e>
 80023c0:	4b33      	ldr	r3, [pc, #204]	; (8002490 <SPI_Init+0x154>)
 80023c2:	18c0      	adds	r0, r0, r3
 80023c4:	4243      	negs	r3, r0
 80023c6:	4158      	adcs	r0, r3
 80023c8:	e000      	b.n	80023cc <SPI_Init+0x90>
 80023ca:	2001      	movs	r0, #1
 80023cc:	f7ff f89e 	bl	800150c <assert_param>
 80023d0:	88e0      	ldrh	r0, [r4, #6]
 80023d2:	2302      	movs	r3, #2
 80023d4:	4398      	bics	r0, r3
 80023d6:	4243      	negs	r3, r0
 80023d8:	4158      	adcs	r0, r3
 80023da:	f7ff f897 	bl	800150c <assert_param>
 80023de:	2700      	movs	r7, #0
 80023e0:	8923      	ldrh	r3, [r4, #8]
 80023e2:	2201      	movs	r2, #1
 80023e4:	1c38      	adds	r0, r7, #0
 80023e6:	429a      	cmp	r2, r3
 80023e8:	4178      	adcs	r0, r7
 80023ea:	f7ff f88f 	bl	800150c <assert_param>
 80023ee:	4b29      	ldr	r3, [pc, #164]	; (8002494 <SPI_Init+0x158>)
 80023f0:	8960      	ldrh	r0, [r4, #10]
 80023f2:	4018      	ands	r0, r3
 80023f4:	4243      	negs	r3, r0
 80023f6:	4158      	adcs	r0, r3
 80023f8:	f7ff f888 	bl	800150c <assert_param>
 80023fc:	89a3      	ldrh	r3, [r4, #12]
 80023fe:	2218      	movs	r2, #24
 8002400:	4393      	bics	r3, r2
 8002402:	42bb      	cmp	r3, r7
 8002404:	d101      	bne.n	800240a <SPI_Init+0xce>
 8002406:	2001      	movs	r0, #1
 8002408:	e002      	b.n	8002410 <SPI_Init+0xd4>
 800240a:	2b20      	cmp	r3, #32
 800240c:	d0fb      	beq.n	8002406 <SPI_Init+0xca>
 800240e:	1c38      	adds	r0, r7, #0
 8002410:	f7ff f87c 	bl	800150c <assert_param>
 8002414:	89e0      	ldrh	r0, [r4, #14]
 8002416:	2380      	movs	r3, #128	; 0x80
 8002418:	4398      	bics	r0, r3
 800241a:	4243      	negs	r3, r0
 800241c:	4158      	adcs	r0, r3
 800241e:	f7ff f875 	bl	800150c <assert_param>
 8002422:	8a20      	ldrh	r0, [r4, #16]
 8002424:	1e43      	subs	r3, r0, #1
 8002426:	4198      	sbcs	r0, r3
 8002428:	f7ff f870 	bl	800150c <assert_param>
 800242c:	882b      	ldrh	r3, [r5, #0]
 800242e:	22c1      	movs	r2, #193	; 0xc1
 8002430:	0192      	lsls	r2, r2, #6
 8002432:	89e1      	ldrh	r1, [r4, #14]
 8002434:	401a      	ands	r2, r3
 8002436:	8823      	ldrh	r3, [r4, #0]
 8002438:	430b      	orrs	r3, r1
 800243a:	88e1      	ldrh	r1, [r4, #6]
 800243c:	430b      	orrs	r3, r1
 800243e:	8921      	ldrh	r1, [r4, #8]
 8002440:	430b      	orrs	r3, r1
 8002442:	8961      	ldrh	r1, [r4, #10]
 8002444:	430b      	orrs	r3, r1
 8002446:	89a1      	ldrh	r1, [r4, #12]
 8002448:	430b      	orrs	r3, r1
 800244a:	4313      	orrs	r3, r2
 800244c:	802b      	strh	r3, [r5, #0]
 800244e:	88aa      	ldrh	r2, [r5, #4]
 8002450:	4b11      	ldr	r3, [pc, #68]	; (8002498 <SPI_Init+0x15c>)
 8002452:	4013      	ands	r3, r2
 8002454:	88a2      	ldrh	r2, [r4, #4]
 8002456:	4313      	orrs	r3, r2
 8002458:	80ab      	strh	r3, [r5, #4]
 800245a:	8a23      	ldrh	r3, [r4, #16]
 800245c:	2204      	movs	r2, #4
 800245e:	822b      	strh	r3, [r5, #16]
 8002460:	882b      	ldrh	r3, [r5, #0]
 8002462:	4393      	bics	r3, r2
 8002464:	8862      	ldrh	r2, [r4, #2]
 8002466:	4313      	orrs	r3, r2
 8002468:	802b      	strh	r3, [r5, #0]
 800246a:	8bab      	ldrh	r3, [r5, #28]
 800246c:	401e      	ands	r6, r3
 800246e:	83ae      	strh	r6, [r5, #28]
 8002470:	bdf8      	pop	{r3, r4, r5, r6, r7, pc}
 8002472:	46c0      	nop			; (mov r8, r8)
 8002474:	40013000 	.word	0x40013000
 8002478:	bfffc800 	.word	0xbfffc800
 800247c:	fffffbff 	.word	0xfffffbff
 8002480:	ffffbfff 	.word	0xffffbfff
 8002484:	fffff7ff 	.word	0xfffff7ff
 8002488:	fffff6ff 	.word	0xfffff6ff
 800248c:	fffffcff 	.word	0xfffffcff
 8002490:	fffff100 	.word	0xfffff100
 8002494:	fffffdff 	.word	0xfffffdff
 8002498:	fffff0ff 	.word	0xfffff0ff

0800249c <SPI_Cmd>:
 800249c:	b538      	push	{r3, r4, r5, lr}
 800249e:	4b0e      	ldr	r3, [pc, #56]	; (80024d8 <SPI_Cmd+0x3c>)
 80024a0:	1c04      	adds	r4, r0, #0
 80024a2:	1c0d      	adds	r5, r1, #0
 80024a4:	4298      	cmp	r0, r3
 80024a6:	d004      	beq.n	80024b2 <SPI_Cmd+0x16>
 80024a8:	4b0c      	ldr	r3, [pc, #48]	; (80024dc <SPI_Cmd+0x40>)
 80024aa:	18c0      	adds	r0, r0, r3
 80024ac:	4243      	negs	r3, r0
 80024ae:	4158      	adcs	r0, r3
 80024b0:	e000      	b.n	80024b4 <SPI_Cmd+0x18>
 80024b2:	2001      	movs	r0, #1
 80024b4:	f7ff f82a 	bl	800150c <assert_param>
 80024b8:	2301      	movs	r3, #1
 80024ba:	2000      	movs	r0, #0
 80024bc:	42ab      	cmp	r3, r5
 80024be:	4140      	adcs	r0, r0
 80024c0:	f7ff f824 	bl	800150c <assert_param>
 80024c4:	2340      	movs	r3, #64	; 0x40
 80024c6:	8822      	ldrh	r2, [r4, #0]
 80024c8:	2d00      	cmp	r5, #0
 80024ca:	d001      	beq.n	80024d0 <SPI_Cmd+0x34>
 80024cc:	4313      	orrs	r3, r2
 80024ce:	e001      	b.n	80024d4 <SPI_Cmd+0x38>
 80024d0:	439a      	bics	r2, r3
 80024d2:	1c13      	adds	r3, r2, #0
 80024d4:	8023      	strh	r3, [r4, #0]
 80024d6:	bd38      	pop	{r3, r4, r5, pc}
 80024d8:	40013000 	.word	0x40013000
 80024dc:	bfffc800 	.word	0xbfffc800

080024e0 <SPI_RxFIFOThresholdConfig>:
 80024e0:	4b0d      	ldr	r3, [pc, #52]	; (8002518 <SPI_RxFIFOThresholdConfig+0x38>)
 80024e2:	b570      	push	{r4, r5, r6, lr}
 80024e4:	1c04      	adds	r4, r0, #0
 80024e6:	1c0d      	adds	r5, r1, #0
 80024e8:	4298      	cmp	r0, r3
 80024ea:	d004      	beq.n	80024f6 <SPI_RxFIFOThresholdConfig+0x16>
 80024ec:	4b0b      	ldr	r3, [pc, #44]	; (800251c <SPI_RxFIFOThresholdConfig+0x3c>)
 80024ee:	18c0      	adds	r0, r0, r3
 80024f0:	4243      	negs	r3, r0
 80024f2:	4158      	adcs	r0, r3
 80024f4:	e000      	b.n	80024f8 <SPI_RxFIFOThresholdConfig+0x18>
 80024f6:	2001      	movs	r0, #1
 80024f8:	4e09      	ldr	r6, [pc, #36]	; (8002520 <SPI_RxFIFOThresholdConfig+0x40>)
 80024fa:	f7ff f807 	bl	800150c <assert_param>
 80024fe:	1c28      	adds	r0, r5, #0
 8002500:	4030      	ands	r0, r6
 8002502:	4243      	negs	r3, r0
 8002504:	4158      	adcs	r0, r3
 8002506:	f7ff f801 	bl	800150c <assert_param>
 800250a:	88a3      	ldrh	r3, [r4, #4]
 800250c:	401e      	ands	r6, r3
 800250e:	80a6      	strh	r6, [r4, #4]
 8002510:	88a3      	ldrh	r3, [r4, #4]
 8002512:	431d      	orrs	r5, r3
 8002514:	80a5      	strh	r5, [r4, #4]
 8002516:	bd70      	pop	{r4, r5, r6, pc}
 8002518:	40013000 	.word	0x40013000
 800251c:	bfffc800 	.word	0xbfffc800
 8002520:	ffffefff 	.word	0xffffefff

08002524 <SPI_SendData8>:
 8002524:	b538      	push	{r3, r4, r5, lr}
 8002526:	4b07      	ldr	r3, [pc, #28]	; (8002544 <SPI_SendData8+0x20>)
 8002528:	1c04      	adds	r4, r0, #0
 800252a:	1c0d      	adds	r5, r1, #0
 800252c:	4298      	cmp	r0, r3
 800252e:	d004      	beq.n	800253a <SPI_SendData8+0x16>
 8002530:	4b05      	ldr	r3, [pc, #20]	; (8002548 <SPI_SendData8+0x24>)
 8002532:	18c0      	adds	r0, r0, r3
 8002534:	4243      	negs	r3, r0
 8002536:	4158      	adcs	r0, r3
 8002538:	e000      	b.n	800253c <SPI_SendData8+0x18>
 800253a:	2001      	movs	r0, #1
 800253c:	f7fe ffe6 	bl	800150c <assert_param>
 8002540:	7325      	strb	r5, [r4, #12]
 8002542:	bd38      	pop	{r3, r4, r5, pc}
 8002544:	40013000 	.word	0x40013000
 8002548:	bfffc800 	.word	0xbfffc800

0800254c <NVIC_Init>:
 800254c:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
 800254e:	2500      	movs	r5, #0
 8002550:	7883      	ldrb	r3, [r0, #2]
 8002552:	1c04      	adds	r4, r0, #0
 8002554:	2601      	movs	r6, #1
 8002556:	1c28      	adds	r0, r5, #0
 8002558:	429e      	cmp	r6, r3
 800255a:	4168      	adcs	r0, r5
 800255c:	f7fe ffd6 	bl	800150c <assert_param>
 8002560:	7863      	ldrb	r3, [r4, #1]
 8002562:	2703      	movs	r7, #3
 8002564:	1c28      	adds	r0, r5, #0
 8002566:	429f      	cmp	r7, r3
 8002568:	4168      	adcs	r0, r5
 800256a:	f7fe ffcf 	bl	800150c <assert_param>
 800256e:	78a2      	ldrb	r2, [r4, #2]
 8002570:	7823      	ldrb	r3, [r4, #0]
 8002572:	42aa      	cmp	r2, r5
 8002574:	d01a      	beq.n	80025ac <NVIC_Init+0x60>
 8002576:	0899      	lsrs	r1, r3, #2
 8002578:	4a0f      	ldr	r2, [pc, #60]	; (80025b8 <NVIC_Init+0x6c>)
 800257a:	0089      	lsls	r1, r1, #2
 800257c:	1889      	adds	r1, r1, r2
 800257e:	22c0      	movs	r2, #192	; 0xc0
 8002580:	0092      	lsls	r2, r2, #2
 8002582:	401f      	ands	r7, r3
 8002584:	20ff      	movs	r0, #255	; 0xff
 8002586:	588d      	ldr	r5, [r1, r2]
 8002588:	00ff      	lsls	r7, r7, #3
 800258a:	1c03      	adds	r3, r0, #0
 800258c:	40bb      	lsls	r3, r7
 800258e:	439d      	bics	r5, r3
 8002590:	7863      	ldrb	r3, [r4, #1]
 8002592:	019b      	lsls	r3, r3, #6
 8002594:	4018      	ands	r0, r3
 8002596:	40b8      	lsls	r0, r7
 8002598:	1c2f      	adds	r7, r5, #0
 800259a:	4307      	orrs	r7, r0
 800259c:	508f      	str	r7, [r1, r2]
 800259e:	7822      	ldrb	r2, [r4, #0]
 80025a0:	231f      	movs	r3, #31
 80025a2:	4013      	ands	r3, r2
 80025a4:	409e      	lsls	r6, r3
 80025a6:	4b04      	ldr	r3, [pc, #16]	; (80025b8 <NVIC_Init+0x6c>)
 80025a8:	601e      	str	r6, [r3, #0]
 80025aa:	e004      	b.n	80025b6 <NVIC_Init+0x6a>
 80025ac:	271f      	movs	r7, #31
 80025ae:	403b      	ands	r3, r7
 80025b0:	4a02      	ldr	r2, [pc, #8]	; (80025bc <NVIC_Init+0x70>)
 80025b2:	409e      	lsls	r6, r3
 80025b4:	67d6      	str	r6, [r2, #124]	; 0x7c
 80025b6:	bdf8      	pop	{r3, r4, r5, r6, r7, pc}
 80025b8:	e000e100 	.word	0xe000e100
 80025bc:	e000e104 	.word	0xe000e104

080025c0 <RCC_HSI14Cmd>:
 80025c0:	b538      	push	{r3, r4, r5, lr}
 80025c2:	1c05      	adds	r5, r0, #0
 80025c4:	2401      	movs	r4, #1
 80025c6:	2000      	movs	r0, #0
 80025c8:	42ac      	cmp	r4, r5
 80025ca:	4140      	adcs	r0, r0
 80025cc:	f7fe ff9e 	bl	800150c <assert_param>
 80025d0:	4b04      	ldr	r3, [pc, #16]	; (80025e4 <RCC_HSI14Cmd+0x24>)
 80025d2:	6b5a      	ldr	r2, [r3, #52]	; 0x34
 80025d4:	2d00      	cmp	r5, #0
 80025d6:	d002      	beq.n	80025de <RCC_HSI14Cmd+0x1e>
 80025d8:	4314      	orrs	r4, r2
 80025da:	635c      	str	r4, [r3, #52]	; 0x34
 80025dc:	e001      	b.n	80025e2 <RCC_HSI14Cmd+0x22>
 80025de:	43a2      	bics	r2, r4
 80025e0:	635a      	str	r2, [r3, #52]	; 0x34
 80025e2:	bd38      	pop	{r3, r4, r5, pc}
 80025e4:	40021000 	.word	0x40021000

080025e8 <RCC_ADCCLKConfig>:
 80025e8:	4b0e      	ldr	r3, [pc, #56]	; (8002624 <RCC_ADCCLKConfig+0x3c>)
 80025ea:	b510      	push	{r4, lr}
 80025ec:	1c04      	adds	r4, r0, #0
 80025ee:	2001      	movs	r0, #1
 80025f0:	421c      	tst	r4, r3
 80025f2:	d003      	beq.n	80025fc <RCC_ADCCLKConfig+0x14>
 80025f4:	4b0c      	ldr	r3, [pc, #48]	; (8002628 <RCC_ADCCLKConfig+0x40>)
 80025f6:	18e0      	adds	r0, r4, r3
 80025f8:	4243      	negs	r3, r0
 80025fa:	4158      	adcs	r0, r3
 80025fc:	f7fe ff86 	bl	800150c <assert_param>
 8002600:	4b0a      	ldr	r3, [pc, #40]	; (800262c <RCC_ADCCLKConfig+0x44>)
 8002602:	4a0b      	ldr	r2, [pc, #44]	; (8002630 <RCC_ADCCLKConfig+0x48>)
 8002604:	6859      	ldr	r1, [r3, #4]
 8002606:	400a      	ands	r2, r1
 8002608:	605a      	str	r2, [r3, #4]
 800260a:	685a      	ldr	r2, [r3, #4]
 800260c:	b2a1      	uxth	r1, r4
 800260e:	430a      	orrs	r2, r1
 8002610:	605a      	str	r2, [r3, #4]
 8002612:	6b19      	ldr	r1, [r3, #48]	; 0x30
 8002614:	4a07      	ldr	r2, [pc, #28]	; (8002634 <RCC_ADCCLKConfig+0x4c>)
 8002616:	0c24      	lsrs	r4, r4, #16
 8002618:	400a      	ands	r2, r1
 800261a:	631a      	str	r2, [r3, #48]	; 0x30
 800261c:	6b1a      	ldr	r2, [r3, #48]	; 0x30
 800261e:	4314      	orrs	r4, r2
 8002620:	631c      	str	r4, [r3, #48]	; 0x30
 8002622:	bd10      	pop	{r4, pc}
 8002624:	feffffff 	.word	0xfeffffff
 8002628:	feffc000 	.word	0xfeffc000
 800262c:	40021000 	.word	0x40021000
 8002630:	ffffbfff 	.word	0xffffbfff
 8002634:	fffffeff 	.word	0xfffffeff

08002638 <RCC_GetClocksFreq>:
 8002638:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
 800263a:	4d5a      	ldr	r5, [pc, #360]	; (80027a4 <RCC_GetClocksFreq+0x16c>)
 800263c:	1c04      	adds	r4, r0, #0
 800263e:	6868      	ldr	r0, [r5, #4]
 8002640:	230c      	movs	r3, #12
 8002642:	4018      	ands	r0, r3
 8002644:	f000 fa14 	bl	8002a70 <__gnu_thumb1_case_uqi>
 8002648:	1f1f1f1f 	.word	0x1f1f1f1f
 800264c:	1f1f1f1f 	.word	0x1f1f1f1f
 8002650:	1f1f1f07 	.word	0x1f1f1f07
 8002654:	1d          	.byte	0x1d
 8002655:	00          	.byte	0x00
 8002656:	686e      	ldr	r6, [r5, #4]
 8002658:	23c0      	movs	r3, #192	; 0xc0
 800265a:	02b6      	lsls	r6, r6, #10
 800265c:	686a      	ldr	r2, [r5, #4]
 800265e:	0f36      	lsrs	r6, r6, #28
 8002660:	025b      	lsls	r3, r3, #9
 8002662:	3602      	adds	r6, #2
 8002664:	421a      	tst	r2, r3
 8002666:	d101      	bne.n	800266c <RCC_GetClocksFreq+0x34>
 8002668:	484f      	ldr	r0, [pc, #316]	; (80027a8 <RCC_GetClocksFreq+0x170>)
 800266a:	e007      	b.n	800267c <RCC_GetClocksFreq+0x44>
 800266c:	4b4d      	ldr	r3, [pc, #308]	; (80027a4 <RCC_GetClocksFreq+0x16c>)
 800266e:	484f      	ldr	r0, [pc, #316]	; (80027ac <RCC_GetClocksFreq+0x174>)
 8002670:	6ad9      	ldr	r1, [r3, #44]	; 0x2c
 8002672:	230f      	movs	r3, #15
 8002674:	4019      	ands	r1, r3
 8002676:	3101      	adds	r1, #1
 8002678:	f000 fa04 	bl	8002a84 <__aeabi_uidiv>
 800267c:	4370      	muls	r0, r6
 800267e:	6020      	str	r0, [r4, #0]
 8002680:	e004      	b.n	800268c <RCC_GetClocksFreq+0x54>
 8002682:	4b4b      	ldr	r3, [pc, #300]	; (80027b0 <RCC_GetClocksFreq+0x178>)
 8002684:	e000      	b.n	8002688 <RCC_GetClocksFreq+0x50>
 8002686:	4b49      	ldr	r3, [pc, #292]	; (80027ac <RCC_GetClocksFreq+0x174>)
 8002688:	6023      	str	r3, [r4, #0]
 800268a:	2000      	movs	r0, #0
 800268c:	686b      	ldr	r3, [r5, #4]
 800268e:	4a49      	ldr	r2, [pc, #292]	; (80027b4 <RCC_GetClocksFreq+0x17c>)
 8002690:	061b      	lsls	r3, r3, #24
 8002692:	0f1b      	lsrs	r3, r3, #28
 8002694:	6821      	ldr	r1, [r4, #0]
 8002696:	5cd3      	ldrb	r3, [r2, r3]
 8002698:	1c0e      	adds	r6, r1, #0
 800269a:	40de      	lsrs	r6, r3
 800269c:	6066      	str	r6, [r4, #4]
 800269e:	1c33      	adds	r3, r6, #0
 80026a0:	686e      	ldr	r6, [r5, #4]
 80026a2:	0576      	lsls	r6, r6, #21
 80026a4:	0f76      	lsrs	r6, r6, #29
 80026a6:	5d92      	ldrb	r2, [r2, r6]
 80026a8:	40d3      	lsrs	r3, r2
 80026aa:	60a3      	str	r3, [r4, #8]
 80026ac:	6b2a      	ldr	r2, [r5, #48]	; 0x30
 80026ae:	05d6      	lsls	r6, r2, #23
 80026b0:	d401      	bmi.n	80026b6 <RCC_GetClocksFreq+0x7e>
 80026b2:	4a41      	ldr	r2, [pc, #260]	; (80027b8 <RCC_GetClocksFreq+0x180>)
 80026b4:	e006      	b.n	80026c4 <RCC_GetClocksFreq+0x8c>
 80026b6:	4a3b      	ldr	r2, [pc, #236]	; (80027a4 <RCC_GetClocksFreq+0x16c>)
 80026b8:	6852      	ldr	r2, [r2, #4]
 80026ba:	0456      	lsls	r6, r2, #17
 80026bc:	d401      	bmi.n	80026c2 <RCC_GetClocksFreq+0x8a>
 80026be:	085a      	lsrs	r2, r3, #1
 80026c0:	e000      	b.n	80026c4 <RCC_GetClocksFreq+0x8c>
 80026c2:	089a      	lsrs	r2, r3, #2
 80026c4:	60e2      	str	r2, [r4, #12]
 80026c6:	6b2a      	ldr	r2, [r5, #48]	; 0x30
 80026c8:	0656      	lsls	r6, r2, #25
 80026ca:	d401      	bmi.n	80026d0 <RCC_GetClocksFreq+0x98>
 80026cc:	4a3b      	ldr	r2, [pc, #236]	; (80027bc <RCC_GetClocksFreq+0x184>)
 80026ce:	e001      	b.n	80026d4 <RCC_GetClocksFreq+0x9c>
 80026d0:	2280      	movs	r2, #128	; 0x80
 80026d2:	0212      	lsls	r2, r2, #8
 80026d4:	6122      	str	r2, [r4, #16]
 80026d6:	6b2a      	ldr	r2, [r5, #48]	; 0x30
 80026d8:	06d6      	lsls	r6, r2, #27
 80026da:	d402      	bmi.n	80026e2 <RCC_GetClocksFreq+0xaa>
 80026dc:	4a33      	ldr	r2, [pc, #204]	; (80027ac <RCC_GetClocksFreq+0x174>)
 80026de:	6162      	str	r2, [r4, #20]
 80026e0:	e000      	b.n	80026e4 <RCC_GetClocksFreq+0xac>
 80026e2:	6161      	str	r1, [r4, #20]
 80026e4:	6b2f      	ldr	r7, [r5, #48]	; 0x30
 80026e6:	2203      	movs	r2, #3
 80026e8:	4e2e      	ldr	r6, [pc, #184]	; (80027a4 <RCC_GetClocksFreq+0x16c>)
 80026ea:	4217      	tst	r7, r2
 80026ec:	d101      	bne.n	80026f2 <RCC_GetClocksFreq+0xba>
 80026ee:	61a3      	str	r3, [r4, #24]
 80026f0:	e012      	b.n	8002718 <RCC_GetClocksFreq+0xe0>
 80026f2:	6b37      	ldr	r7, [r6, #48]	; 0x30
 80026f4:	4017      	ands	r7, r2
 80026f6:	2f01      	cmp	r7, #1
 80026f8:	d101      	bne.n	80026fe <RCC_GetClocksFreq+0xc6>
 80026fa:	61a1      	str	r1, [r4, #24]
 80026fc:	e00c      	b.n	8002718 <RCC_GetClocksFreq+0xe0>
 80026fe:	6b37      	ldr	r7, [r6, #48]	; 0x30
 8002700:	4017      	ands	r7, r2
 8002702:	2f02      	cmp	r7, #2
 8002704:	d102      	bne.n	800270c <RCC_GetClocksFreq+0xd4>
 8002706:	2280      	movs	r2, #128	; 0x80
 8002708:	0212      	lsls	r2, r2, #8
 800270a:	e004      	b.n	8002716 <RCC_GetClocksFreq+0xde>
 800270c:	6b36      	ldr	r6, [r6, #48]	; 0x30
 800270e:	4032      	ands	r2, r6
 8002710:	2a03      	cmp	r2, #3
 8002712:	d101      	bne.n	8002718 <RCC_GetClocksFreq+0xe0>
 8002714:	4a25      	ldr	r2, [pc, #148]	; (80027ac <RCC_GetClocksFreq+0x174>)
 8002716:	61a2      	str	r2, [r4, #24]
 8002718:	22c0      	movs	r2, #192	; 0xc0
 800271a:	6b2f      	ldr	r7, [r5, #48]	; 0x30
 800271c:	0292      	lsls	r2, r2, #10
 800271e:	4e21      	ldr	r6, [pc, #132]	; (80027a4 <RCC_GetClocksFreq+0x16c>)
 8002720:	4217      	tst	r7, r2
 8002722:	d101      	bne.n	8002728 <RCC_GetClocksFreq+0xf0>
 8002724:	61e3      	str	r3, [r4, #28]
 8002726:	e018      	b.n	800275a <RCC_GetClocksFreq+0x122>
 8002728:	6b37      	ldr	r7, [r6, #48]	; 0x30
 800272a:	4017      	ands	r7, r2
 800272c:	46bc      	mov	ip, r7
 800272e:	2780      	movs	r7, #128	; 0x80
 8002730:	027f      	lsls	r7, r7, #9
 8002732:	45bc      	cmp	ip, r7
 8002734:	d101      	bne.n	800273a <RCC_GetClocksFreq+0x102>
 8002736:	61e1      	str	r1, [r4, #28]
 8002738:	e00f      	b.n	800275a <RCC_GetClocksFreq+0x122>
 800273a:	6b37      	ldr	r7, [r6, #48]	; 0x30
 800273c:	4017      	ands	r7, r2
 800273e:	46bc      	mov	ip, r7
 8002740:	2780      	movs	r7, #128	; 0x80
 8002742:	02bf      	lsls	r7, r7, #10
 8002744:	45bc      	cmp	ip, r7
 8002746:	d102      	bne.n	800274e <RCC_GetClocksFreq+0x116>
 8002748:	2280      	movs	r2, #128	; 0x80
 800274a:	0212      	lsls	r2, r2, #8
 800274c:	e004      	b.n	8002758 <RCC_GetClocksFreq+0x120>
 800274e:	6b36      	ldr	r6, [r6, #48]	; 0x30
 8002750:	4016      	ands	r6, r2
 8002752:	4296      	cmp	r6, r2
 8002754:	d101      	bne.n	800275a <RCC_GetClocksFreq+0x122>
 8002756:	4a15      	ldr	r2, [pc, #84]	; (80027ac <RCC_GetClocksFreq+0x174>)
 8002758:	61e2      	str	r2, [r4, #28]
 800275a:	22c0      	movs	r2, #192	; 0xc0
 800275c:	6b2f      	ldr	r7, [r5, #48]	; 0x30
 800275e:	0312      	lsls	r2, r2, #12
 8002760:	4e10      	ldr	r6, [pc, #64]	; (80027a4 <RCC_GetClocksFreq+0x16c>)
 8002762:	4217      	tst	r7, r2
 8002764:	d015      	beq.n	8002792 <RCC_GetClocksFreq+0x15a>
 8002766:	6b37      	ldr	r7, [r6, #48]	; 0x30
 8002768:	2380      	movs	r3, #128	; 0x80
 800276a:	4017      	ands	r7, r2
 800276c:	02db      	lsls	r3, r3, #11
 800276e:	429f      	cmp	r7, r3
 8002770:	d101      	bne.n	8002776 <RCC_GetClocksFreq+0x13e>
 8002772:	6221      	str	r1, [r4, #32]
 8002774:	e00e      	b.n	8002794 <RCC_GetClocksFreq+0x15c>
 8002776:	6b31      	ldr	r1, [r6, #48]	; 0x30
 8002778:	2380      	movs	r3, #128	; 0x80
 800277a:	4011      	ands	r1, r2
 800277c:	031b      	lsls	r3, r3, #12
 800277e:	4299      	cmp	r1, r3
 8002780:	d102      	bne.n	8002788 <RCC_GetClocksFreq+0x150>
 8002782:	2380      	movs	r3, #128	; 0x80
 8002784:	021b      	lsls	r3, r3, #8
 8002786:	e004      	b.n	8002792 <RCC_GetClocksFreq+0x15a>
 8002788:	6b33      	ldr	r3, [r6, #48]	; 0x30
 800278a:	4013      	ands	r3, r2
 800278c:	4293      	cmp	r3, r2
 800278e:	d101      	bne.n	8002794 <RCC_GetClocksFreq+0x15c>
 8002790:	4b06      	ldr	r3, [pc, #24]	; (80027ac <RCC_GetClocksFreq+0x174>)
 8002792:	6223      	str	r3, [r4, #32]
 8002794:	6b2b      	ldr	r3, [r5, #48]	; 0x30
 8002796:	061a      	lsls	r2, r3, #24
 8002798:	d402      	bmi.n	80027a0 <RCC_GetClocksFreq+0x168>
 800279a:	4b05      	ldr	r3, [pc, #20]	; (80027b0 <RCC_GetClocksFreq+0x178>)
 800279c:	6263      	str	r3, [r4, #36]	; 0x24
 800279e:	e000      	b.n	80027a2 <RCC_GetClocksFreq+0x16a>
 80027a0:	6260      	str	r0, [r4, #36]	; 0x24
 80027a2:	bdf8      	pop	{r3, r4, r5, r6, r7, pc}
 80027a4:	40021000 	.word	0x40021000
 80027a8:	003d0900 	.word	0x003d0900
 80027ac:	007a1200 	.word	0x007a1200
 80027b0:	02dc6c00 	.word	0x02dc6c00
 80027b4:	20000000 	.word	0x20000000
 80027b8:	00d59f80 	.word	0x00d59f80
 80027bc:	00008012 	.word	0x00008012

080027c0 <RCC_AHBPeriphClockCmd>:
 80027c0:	b538      	push	{r3, r4, r5, lr}
 80027c2:	4b0d      	ldr	r3, [pc, #52]	; (80027f8 <RCC_AHBPeriphClockCmd+0x38>)
 80027c4:	1c04      	adds	r4, r0, #0
 80027c6:	1c0d      	adds	r5, r1, #0
 80027c8:	2000      	movs	r0, #0
 80027ca:	421c      	tst	r4, r3
 80027cc:	d102      	bne.n	80027d4 <RCC_AHBPeriphClockCmd+0x14>
 80027ce:	1c20      	adds	r0, r4, #0
 80027d0:	1e43      	subs	r3, r0, #1
 80027d2:	4198      	sbcs	r0, r3
 80027d4:	f7fe fe9a 	bl	800150c <assert_param>
 80027d8:	2301      	movs	r3, #1
 80027da:	2000      	movs	r0, #0
 80027dc:	42ab      	cmp	r3, r5
 80027de:	4140      	adcs	r0, r0
 80027e0:	f7fe fe94 	bl	800150c <assert_param>
 80027e4:	4b05      	ldr	r3, [pc, #20]	; (80027fc <RCC_AHBPeriphClockCmd+0x3c>)
 80027e6:	695a      	ldr	r2, [r3, #20]
 80027e8:	2d00      	cmp	r5, #0
 80027ea:	d002      	beq.n	80027f2 <RCC_AHBPeriphClockCmd+0x32>
 80027ec:	4314      	orrs	r4, r2
 80027ee:	615c      	str	r4, [r3, #20]
 80027f0:	e001      	b.n	80027f6 <RCC_AHBPeriphClockCmd+0x36>
 80027f2:	43a2      	bics	r2, r4
 80027f4:	615a      	str	r2, [r3, #20]
 80027f6:	bd38      	pop	{r3, r4, r5, pc}
 80027f8:	fe81ffa8 	.word	0xfe81ffa8
 80027fc:	40021000 	.word	0x40021000

08002800 <RCC_APB2PeriphClockCmd>:
 8002800:	b538      	push	{r3, r4, r5, lr}
 8002802:	4b0d      	ldr	r3, [pc, #52]	; (8002838 <RCC_APB2PeriphClockCmd+0x38>)
 8002804:	1c04      	adds	r4, r0, #0
 8002806:	1c0d      	adds	r5, r1, #0
 8002808:	2000      	movs	r0, #0
 800280a:	421c      	tst	r4, r3
 800280c:	d102      	bne.n	8002814 <RCC_APB2PeriphClockCmd+0x14>
 800280e:	1c20      	adds	r0, r4, #0
 8002810:	1e43      	subs	r3, r0, #1
 8002812:	4198      	sbcs	r0, r3
 8002814:	f7fe fe7a 	bl	800150c <assert_param>
 8002818:	2301      	movs	r3, #1
 800281a:	2000      	movs	r0, #0
 800281c:	42ab      	cmp	r3, r5
 800281e:	4140      	adcs	r0, r0
 8002820:	f7fe fe74 	bl	800150c <assert_param>
 8002824:	4b05      	ldr	r3, [pc, #20]	; (800283c <RCC_APB2PeriphClockCmd+0x3c>)
 8002826:	699a      	ldr	r2, [r3, #24]
 8002828:	2d00      	cmp	r5, #0
 800282a:	d002      	beq.n	8002832 <RCC_APB2PeriphClockCmd+0x32>
 800282c:	4314      	orrs	r4, r2
 800282e:	619c      	str	r4, [r3, #24]
 8002830:	e001      	b.n	8002836 <RCC_APB2PeriphClockCmd+0x36>
 8002832:	43a2      	bics	r2, r4
 8002834:	619a      	str	r2, [r3, #24]
 8002836:	bd38      	pop	{r3, r4, r5, pc}
 8002838:	ffb8a51e 	.word	0xffb8a51e
 800283c:	40021000 	.word	0x40021000

08002840 <RCC_APB1PeriphClockCmd>:
 8002840:	b538      	push	{r3, r4, r5, lr}
 8002842:	4b0d      	ldr	r3, [pc, #52]	; (8002878 <RCC_APB1PeriphClockCmd+0x38>)
 8002844:	1c04      	adds	r4, r0, #0
 8002846:	1c0d      	adds	r5, r1, #0
 8002848:	2000      	movs	r0, #0
 800284a:	421c      	tst	r4, r3
 800284c:	d102      	bne.n	8002854 <RCC_APB1PeriphClockCmd+0x14>
 800284e:	1c20      	adds	r0, r4, #0
 8002850:	1e43      	subs	r3, r0, #1
 8002852:	4198      	sbcs	r0, r3
 8002854:	f7fe fe5a 	bl	800150c <assert_param>
 8002858:	2301      	movs	r3, #1
 800285a:	2000      	movs	r0, #0
 800285c:	42ab      	cmp	r3, r5
 800285e:	4140      	adcs	r0, r0
 8002860:	f7fe fe54 	bl	800150c <assert_param>
 8002864:	4b05      	ldr	r3, [pc, #20]	; (800287c <RCC_APB1PeriphClockCmd+0x3c>)
 8002866:	69da      	ldr	r2, [r3, #28]
 8002868:	2d00      	cmp	r5, #0
 800286a:	d002      	beq.n	8002872 <RCC_APB1PeriphClockCmd+0x32>
 800286c:	4314      	orrs	r4, r2
 800286e:	61dc      	str	r4, [r3, #28]
 8002870:	e001      	b.n	8002876 <RCC_APB1PeriphClockCmd+0x36>
 8002872:	43a2      	bics	r2, r4
 8002874:	61da      	str	r2, [r3, #28]
 8002876:	bd38      	pop	{r3, r4, r5, pc}
 8002878:	8581b6cc 	.word	0x8581b6cc
 800287c:	40021000 	.word	0x40021000

08002880 <RCC_APB2PeriphResetCmd>:
 8002880:	b538      	push	{r3, r4, r5, lr}
 8002882:	4b0d      	ldr	r3, [pc, #52]	; (80028b8 <RCC_APB2PeriphResetCmd+0x38>)
 8002884:	1c04      	adds	r4, r0, #0
 8002886:	1c0d      	adds	r5, r1, #0
 8002888:	2000      	movs	r0, #0
 800288a:	421c      	tst	r4, r3
 800288c:	d102      	bne.n	8002894 <RCC_APB2PeriphResetCmd+0x14>
 800288e:	1c20      	adds	r0, r4, #0
 8002890:	1e43      	subs	r3, r0, #1
 8002892:	4198      	sbcs	r0, r3
 8002894:	f7fe fe3a 	bl	800150c <assert_param>
 8002898:	2301      	movs	r3, #1
 800289a:	2000      	movs	r0, #0
 800289c:	42ab      	cmp	r3, r5
 800289e:	4140      	adcs	r0, r0
 80028a0:	f7fe fe34 	bl	800150c <assert_param>
 80028a4:	4b05      	ldr	r3, [pc, #20]	; (80028bc <RCC_APB2PeriphResetCmd+0x3c>)
 80028a6:	68da      	ldr	r2, [r3, #12]
 80028a8:	2d00      	cmp	r5, #0
 80028aa:	d002      	beq.n	80028b2 <RCC_APB2PeriphResetCmd+0x32>
 80028ac:	4314      	orrs	r4, r2
 80028ae:	60dc      	str	r4, [r3, #12]
 80028b0:	e001      	b.n	80028b6 <RCC_APB2PeriphResetCmd+0x36>
 80028b2:	43a2      	bics	r2, r4
 80028b4:	60da      	str	r2, [r3, #12]
 80028b6:	bd38      	pop	{r3, r4, r5, pc}
 80028b8:	ffb8a51e 	.word	0xffb8a51e
 80028bc:	40021000 	.word	0x40021000

080028c0 <RCC_GetFlagStatus>:
 80028c0:	2310      	movs	r3, #16
 80028c2:	b510      	push	{r4, lr}
 80028c4:	1c04      	adds	r4, r0, #0
 80028c6:	4398      	bics	r0, r3
 80028c8:	2801      	cmp	r0, #1
 80028ca:	d015      	beq.n	80028f8 <RCC_GetFlagStatus+0x38>
 80028cc:	2c19      	cmp	r4, #25
 80028ce:	d012      	beq.n	80028f6 <RCC_GetFlagStatus+0x36>
 80028d0:	2340      	movs	r3, #64	; 0x40
 80028d2:	1c22      	adds	r2, r4, #0
 80028d4:	439a      	bics	r2, r3
 80028d6:	2a21      	cmp	r2, #33	; 0x21
 80028d8:	d00d      	beq.n	80028f6 <RCC_GetFlagStatus+0x36>
 80028da:	2c41      	cmp	r4, #65	; 0x41
 80028dc:	d00b      	beq.n	80028f6 <RCC_GetFlagStatus+0x36>
 80028de:	1c23      	adds	r3, r4, #0
 80028e0:	3b59      	subs	r3, #89	; 0x59
 80028e2:	b2db      	uxtb	r3, r3
 80028e4:	2b06      	cmp	r3, #6
 80028e6:	d906      	bls.n	80028f6 <RCC_GetFlagStatus+0x36>
 80028e8:	2c71      	cmp	r4, #113	; 0x71
 80028ea:	d004      	beq.n	80028f6 <RCC_GetFlagStatus+0x36>
 80028ec:	1c20      	adds	r0, r4, #0
 80028ee:	3857      	subs	r0, #87	; 0x57
 80028f0:	4243      	negs	r3, r0
 80028f2:	4158      	adcs	r0, r3
 80028f4:	e000      	b.n	80028f8 <RCC_GetFlagStatus+0x38>
 80028f6:	2001      	movs	r0, #1
 80028f8:	f7fe fe08 	bl	800150c <assert_param>
 80028fc:	0962      	lsrs	r2, r4, #5
 80028fe:	4b0a      	ldr	r3, [pc, #40]	; (8002928 <RCC_GetFlagStatus+0x68>)
 8002900:	d101      	bne.n	8002906 <RCC_GetFlagStatus+0x46>
 8002902:	681b      	ldr	r3, [r3, #0]
 8002904:	e008      	b.n	8002918 <RCC_GetFlagStatus+0x58>
 8002906:	2a01      	cmp	r2, #1
 8002908:	d101      	bne.n	800290e <RCC_GetFlagStatus+0x4e>
 800290a:	6a1b      	ldr	r3, [r3, #32]
 800290c:	e004      	b.n	8002918 <RCC_GetFlagStatus+0x58>
 800290e:	2a02      	cmp	r2, #2
 8002910:	d101      	bne.n	8002916 <RCC_GetFlagStatus+0x56>
 8002912:	6a5b      	ldr	r3, [r3, #36]	; 0x24
 8002914:	e000      	b.n	8002918 <RCC_GetFlagStatus+0x58>
 8002916:	6b5b      	ldr	r3, [r3, #52]	; 0x34
 8002918:	201f      	movs	r0, #31
 800291a:	4004      	ands	r4, r0
 800291c:	1c18      	adds	r0, r3, #0
 800291e:	40e0      	lsrs	r0, r4
 8002920:	2201      	movs	r2, #1
 8002922:	4010      	ands	r0, r2
 8002924:	bd10      	pop	{r4, pc}
 8002926:	46c0      	nop			; (mov r8, r8)
 8002928:	40021000 	.word	0x40021000

0800292c <gpio_init>:
 800292c:	b5f7      	push	{r0, r1, r2, r4, r5, r6, r7, lr}
 800292e:	2080      	movs	r0, #128	; 0x80
 8002930:	0280      	lsls	r0, r0, #10
 8002932:	2101      	movs	r1, #1
 8002934:	f7ff ff44 	bl	80027c0 <RCC_AHBPeriphClockCmd>
 8002938:	2080      	movs	r0, #128	; 0x80
 800293a:	02c0      	lsls	r0, r0, #11
 800293c:	2101      	movs	r1, #1
 800293e:	f7ff ff3f 	bl	80027c0 <RCC_AHBPeriphClockCmd>
 8002942:	2208      	movs	r2, #8
 8002944:	2400      	movs	r4, #0
 8002946:	466b      	mov	r3, sp
 8002948:	2603      	movs	r6, #3
 800294a:	9200      	str	r2, [sp, #0]
 800294c:	4669      	mov	r1, sp
 800294e:	2201      	movs	r2, #1
 8002950:	481c      	ldr	r0, [pc, #112]	; (80029c4 <gpio_init+0x98>)
 8002952:	715e      	strb	r6, [r3, #5]
 8002954:	711a      	strb	r2, [r3, #4]
 8002956:	719c      	strb	r4, [r3, #6]
 8002958:	71dc      	strb	r4, [r3, #7]
 800295a:	2590      	movs	r5, #144	; 0x90
 800295c:	f7fe ff7c 	bl	8001858 <GPIO_Init>
 8002960:	2380      	movs	r3, #128	; 0x80
 8002962:	05ed      	lsls	r5, r5, #23
 8002964:	005b      	lsls	r3, r3, #1
 8002966:	466a      	mov	r2, sp
 8002968:	1c28      	adds	r0, r5, #0
 800296a:	9300      	str	r3, [sp, #0]
 800296c:	4669      	mov	r1, sp
 800296e:	2301      	movs	r3, #1
 8002970:	2780      	movs	r7, #128	; 0x80
 8002972:	7156      	strb	r6, [r2, #5]
 8002974:	013f      	lsls	r7, r7, #4
 8002976:	7113      	strb	r3, [r2, #4]
 8002978:	7194      	strb	r4, [r2, #6]
 800297a:	71d4      	strb	r4, [r2, #7]
 800297c:	f7fe ff6c 	bl	8001858 <GPIO_Init>
 8002980:	466a      	mov	r2, sp
 8002982:	1c28      	adds	r0, r5, #0
 8002984:	2301      	movs	r3, #1
 8002986:	4669      	mov	r1, sp
 8002988:	7156      	strb	r6, [r2, #5]
 800298a:	9700      	str	r7, [sp, #0]
 800298c:	7113      	strb	r3, [r2, #4]
 800298e:	7194      	strb	r4, [r2, #6]
 8002990:	71d4      	strb	r4, [r2, #7]
 8002992:	f7fe ff61 	bl	8001858 <GPIO_Init>
 8002996:	2202      	movs	r2, #2
 8002998:	466b      	mov	r3, sp
 800299a:	9200      	str	r2, [sp, #0]
 800299c:	1c28      	adds	r0, r5, #0
 800299e:	2201      	movs	r2, #1
 80029a0:	4669      	mov	r1, sp
 80029a2:	715e      	strb	r6, [r3, #5]
 80029a4:	711a      	strb	r2, [r3, #4]
 80029a6:	719c      	strb	r4, [r3, #6]
 80029a8:	71dc      	strb	r4, [r3, #7]
 80029aa:	f7fe ff55 	bl	8001858 <GPIO_Init>
 80029ae:	4b05      	ldr	r3, [pc, #20]	; (80029c4 <gpio_init+0x98>)
 80029b0:	2208      	movs	r2, #8
 80029b2:	851a      	strh	r2, [r3, #40]	; 0x28
 80029b4:	2380      	movs	r3, #128	; 0x80
 80029b6:	005b      	lsls	r3, r3, #1
 80029b8:	2202      	movs	r2, #2
 80029ba:	852b      	strh	r3, [r5, #40]	; 0x28
 80029bc:	852f      	strh	r7, [r5, #40]	; 0x28
 80029be:	852a      	strh	r2, [r5, #40]	; 0x28
 80029c0:	bdf7      	pop	{r0, r1, r2, r4, r5, r6, r7, pc}
 80029c2:	46c0      	nop			; (mov r8, r8)
 80029c4:	48000400 	.word	0x48000400

080029c8 <led_on>:
 80029c8:	2808      	cmp	r0, #8
 80029ca:	d101      	bne.n	80029d0 <led_on+0x8>
 80029cc:	4b07      	ldr	r3, [pc, #28]	; (80029ec <led_on+0x24>)
 80029ce:	e00b      	b.n	80029e8 <led_on+0x20>
 80029d0:	2380      	movs	r3, #128	; 0x80
 80029d2:	005b      	lsls	r3, r3, #1
 80029d4:	4298      	cmp	r0, r3
 80029d6:	d005      	beq.n	80029e4 <led_on+0x1c>
 80029d8:	2380      	movs	r3, #128	; 0x80
 80029da:	011b      	lsls	r3, r3, #4
 80029dc:	4298      	cmp	r0, r3
 80029de:	d001      	beq.n	80029e4 <led_on+0x1c>
 80029e0:	2802      	cmp	r0, #2
 80029e2:	d102      	bne.n	80029ea <led_on+0x22>
 80029e4:	2390      	movs	r3, #144	; 0x90
 80029e6:	05db      	lsls	r3, r3, #23
 80029e8:	6198      	str	r0, [r3, #24]
 80029ea:	4770      	bx	lr
 80029ec:	48000400 	.word	0x48000400

080029f0 <led_off>:
 80029f0:	2808      	cmp	r0, #8
 80029f2:	d101      	bne.n	80029f8 <led_off+0x8>
 80029f4:	4b07      	ldr	r3, [pc, #28]	; (8002a14 <led_off+0x24>)
 80029f6:	e00b      	b.n	8002a10 <led_off+0x20>
 80029f8:	2380      	movs	r3, #128	; 0x80
 80029fa:	005b      	lsls	r3, r3, #1
 80029fc:	4298      	cmp	r0, r3
 80029fe:	d005      	beq.n	8002a0c <led_off+0x1c>
 8002a00:	2380      	movs	r3, #128	; 0x80
 8002a02:	011b      	lsls	r3, r3, #4
 8002a04:	4298      	cmp	r0, r3
 8002a06:	d001      	beq.n	8002a0c <led_off+0x1c>
 8002a08:	2802      	cmp	r0, #2
 8002a0a:	d102      	bne.n	8002a12 <led_off+0x22>
 8002a0c:	2390      	movs	r3, #144	; 0x90
 8002a0e:	05db      	lsls	r3, r3, #23
 8002a10:	8518      	strh	r0, [r3, #40]	; 0x28
 8002a12:	4770      	bx	lr
 8002a14:	48000400 	.word	0x48000400

08002a18 <Default_Handler>:
 8002a18:	4770      	bx	lr
	...

08002a1c <HardFault_Handler>:
 8002a1c:	2008      	movs	r0, #8
 8002a1e:	f7ff ffd3 	bl	80029c8 <led_on>
 8002a22:	4b07      	ldr	r3, [pc, #28]	; (8002a40 <HardFault_Handler+0x24>)
 8002a24:	3b01      	subs	r3, #1
 8002a26:	2b00      	cmp	r3, #0
 8002a28:	d001      	beq.n	8002a2e <HardFault_Handler+0x12>
 8002a2a:	46c0      	nop			; (mov r8, r8)
 8002a2c:	e7fa      	b.n	8002a24 <HardFault_Handler+0x8>
 8002a2e:	2008      	movs	r0, #8
 8002a30:	f7ff ffde 	bl	80029f0 <led_off>
 8002a34:	4b02      	ldr	r3, [pc, #8]	; (8002a40 <HardFault_Handler+0x24>)
 8002a36:	3b01      	subs	r3, #1
 8002a38:	2b00      	cmp	r3, #0
 8002a3a:	d0ef      	beq.n	8002a1c <HardFault_Handler>
 8002a3c:	46c0      	nop			; (mov r8, r8)
 8002a3e:	e7fa      	b.n	8002a36 <HardFault_Handler+0x1a>
 8002a40:	002dc6c1 	.word	0x002dc6c1

08002a44 <_reset_init>:
 8002a44:	4a07      	ldr	r2, [pc, #28]	; (8002a64 <_reset_init+0x20>)
 8002a46:	4908      	ldr	r1, [pc, #32]	; (8002a68 <_reset_init+0x24>)
 8002a48:	2300      	movs	r3, #0
 8002a4a:	1a89      	subs	r1, r1, r2
 8002a4c:	1089      	asrs	r1, r1, #2
 8002a4e:	1c10      	adds	r0, r2, #0
 8002a50:	428b      	cmp	r3, r1
 8002a52:	d005      	beq.n	8002a60 <_reset_init+0x1c>
 8002a54:	4c05      	ldr	r4, [pc, #20]	; (8002a6c <_reset_init+0x28>)
 8002a56:	009a      	lsls	r2, r3, #2
 8002a58:	58a4      	ldr	r4, [r4, r2]
 8002a5a:	3301      	adds	r3, #1
 8002a5c:	5084      	str	r4, [r0, r2]
 8002a5e:	e7f7      	b.n	8002a50 <_reset_init+0xc>
 8002a60:	f7fe f9d0 	bl	8000e04 <main>
 8002a64:	20000000 	.word	0x20000000
 8002a68:	20000010 	.word	0x20000010
 8002a6c:	080032b0 	.word	0x080032b0

08002a70 <__gnu_thumb1_case_uqi>:
 8002a70:	b402      	push	{r1}
 8002a72:	4671      	mov	r1, lr
 8002a74:	0849      	lsrs	r1, r1, #1
 8002a76:	0049      	lsls	r1, r1, #1
 8002a78:	5c09      	ldrb	r1, [r1, r0]
 8002a7a:	0049      	lsls	r1, r1, #1
 8002a7c:	448e      	add	lr, r1
 8002a7e:	bc02      	pop	{r1}
 8002a80:	4770      	bx	lr
 8002a82:	46c0      	nop			; (mov r8, r8)

08002a84 <__aeabi_uidiv>:
 8002a84:	2900      	cmp	r1, #0
 8002a86:	d034      	beq.n	8002af2 <.udivsi3_skip_div0_test+0x6a>

08002a88 <.udivsi3_skip_div0_test>:
 8002a88:	2301      	movs	r3, #1
 8002a8a:	2200      	movs	r2, #0
 8002a8c:	b410      	push	{r4}
 8002a8e:	4288      	cmp	r0, r1
 8002a90:	d32c      	bcc.n	8002aec <.udivsi3_skip_div0_test+0x64>
 8002a92:	2401      	movs	r4, #1
 8002a94:	0724      	lsls	r4, r4, #28
 8002a96:	42a1      	cmp	r1, r4
 8002a98:	d204      	bcs.n	8002aa4 <.udivsi3_skip_div0_test+0x1c>
 8002a9a:	4281      	cmp	r1, r0
 8002a9c:	d202      	bcs.n	8002aa4 <.udivsi3_skip_div0_test+0x1c>
 8002a9e:	0109      	lsls	r1, r1, #4
 8002aa0:	011b      	lsls	r3, r3, #4
 8002aa2:	e7f8      	b.n	8002a96 <.udivsi3_skip_div0_test+0xe>
 8002aa4:	00e4      	lsls	r4, r4, #3
 8002aa6:	42a1      	cmp	r1, r4
 8002aa8:	d204      	bcs.n	8002ab4 <.udivsi3_skip_div0_test+0x2c>
 8002aaa:	4281      	cmp	r1, r0
 8002aac:	d202      	bcs.n	8002ab4 <.udivsi3_skip_div0_test+0x2c>
 8002aae:	0049      	lsls	r1, r1, #1
 8002ab0:	005b      	lsls	r3, r3, #1
 8002ab2:	e7f8      	b.n	8002aa6 <.udivsi3_skip_div0_test+0x1e>
 8002ab4:	4288      	cmp	r0, r1
 8002ab6:	d301      	bcc.n	8002abc <.udivsi3_skip_div0_test+0x34>
 8002ab8:	1a40      	subs	r0, r0, r1
 8002aba:	431a      	orrs	r2, r3
 8002abc:	084c      	lsrs	r4, r1, #1
 8002abe:	42a0      	cmp	r0, r4
 8002ac0:	d302      	bcc.n	8002ac8 <.udivsi3_skip_div0_test+0x40>
 8002ac2:	1b00      	subs	r0, r0, r4
 8002ac4:	085c      	lsrs	r4, r3, #1
 8002ac6:	4322      	orrs	r2, r4
 8002ac8:	088c      	lsrs	r4, r1, #2
 8002aca:	42a0      	cmp	r0, r4
 8002acc:	d302      	bcc.n	8002ad4 <.udivsi3_skip_div0_test+0x4c>
 8002ace:	1b00      	subs	r0, r0, r4
 8002ad0:	089c      	lsrs	r4, r3, #2
 8002ad2:	4322      	orrs	r2, r4
 8002ad4:	08cc      	lsrs	r4, r1, #3
 8002ad6:	42a0      	cmp	r0, r4
 8002ad8:	d302      	bcc.n	8002ae0 <.udivsi3_skip_div0_test+0x58>
 8002ada:	1b00      	subs	r0, r0, r4
 8002adc:	08dc      	lsrs	r4, r3, #3
 8002ade:	4322      	orrs	r2, r4
 8002ae0:	2800      	cmp	r0, #0
 8002ae2:	d003      	beq.n	8002aec <.udivsi3_skip_div0_test+0x64>
 8002ae4:	091b      	lsrs	r3, r3, #4
 8002ae6:	d001      	beq.n	8002aec <.udivsi3_skip_div0_test+0x64>
 8002ae8:	0909      	lsrs	r1, r1, #4
 8002aea:	e7e3      	b.n	8002ab4 <.udivsi3_skip_div0_test+0x2c>
 8002aec:	1c10      	adds	r0, r2, #0
 8002aee:	bc10      	pop	{r4}
 8002af0:	4770      	bx	lr
 8002af2:	2800      	cmp	r0, #0
 8002af4:	d001      	beq.n	8002afa <.udivsi3_skip_div0_test+0x72>
 8002af6:	2000      	movs	r0, #0
 8002af8:	43c0      	mvns	r0, r0
 8002afa:	b407      	push	{r0, r1, r2}
 8002afc:	4802      	ldr	r0, [pc, #8]	; (8002b08 <.udivsi3_skip_div0_test+0x80>)
 8002afe:	a102      	add	r1, pc, #8	; (adr r1, 8002b08 <.udivsi3_skip_div0_test+0x80>)
 8002b00:	1840      	adds	r0, r0, r1
 8002b02:	9002      	str	r0, [sp, #8]
 8002b04:	bd03      	pop	{r0, r1, pc}
 8002b06:	46c0      	nop			; (mov r8, r8)
 8002b08:	000000d9 	.word	0x000000d9

08002b0c <__aeabi_uidivmod>:
 8002b0c:	2900      	cmp	r1, #0
 8002b0e:	d0f0      	beq.n	8002af2 <.udivsi3_skip_div0_test+0x6a>
 8002b10:	b503      	push	{r0, r1, lr}
 8002b12:	f7ff ffb9 	bl	8002a88 <.udivsi3_skip_div0_test>
 8002b16:	bc0e      	pop	{r1, r2, r3}
 8002b18:	4342      	muls	r2, r0
 8002b1a:	1a89      	subs	r1, r1, r2
 8002b1c:	4718      	bx	r3
 8002b1e:	46c0      	nop			; (mov r8, r8)

08002b20 <__aeabi_idiv>:
 8002b20:	2900      	cmp	r1, #0
 8002b22:	d041      	beq.n	8002ba8 <.divsi3_skip_div0_test+0x84>

08002b24 <.divsi3_skip_div0_test>:
 8002b24:	b410      	push	{r4}
 8002b26:	1c04      	adds	r4, r0, #0
 8002b28:	404c      	eors	r4, r1
 8002b2a:	46a4      	mov	ip, r4
 8002b2c:	2301      	movs	r3, #1
 8002b2e:	2200      	movs	r2, #0
 8002b30:	2900      	cmp	r1, #0
 8002b32:	d500      	bpl.n	8002b36 <.divsi3_skip_div0_test+0x12>
 8002b34:	4249      	negs	r1, r1
 8002b36:	2800      	cmp	r0, #0
 8002b38:	d500      	bpl.n	8002b3c <.divsi3_skip_div0_test+0x18>
 8002b3a:	4240      	negs	r0, r0
 8002b3c:	4288      	cmp	r0, r1
 8002b3e:	d32c      	bcc.n	8002b9a <.divsi3_skip_div0_test+0x76>
 8002b40:	2401      	movs	r4, #1
 8002b42:	0724      	lsls	r4, r4, #28
 8002b44:	42a1      	cmp	r1, r4
 8002b46:	d204      	bcs.n	8002b52 <.divsi3_skip_div0_test+0x2e>
 8002b48:	4281      	cmp	r1, r0
 8002b4a:	d202      	bcs.n	8002b52 <.divsi3_skip_div0_test+0x2e>
 8002b4c:	0109      	lsls	r1, r1, #4
 8002b4e:	011b      	lsls	r3, r3, #4
 8002b50:	e7f8      	b.n	8002b44 <.divsi3_skip_div0_test+0x20>
 8002b52:	00e4      	lsls	r4, r4, #3
 8002b54:	42a1      	cmp	r1, r4
 8002b56:	d204      	bcs.n	8002b62 <.divsi3_skip_div0_test+0x3e>
 8002b58:	4281      	cmp	r1, r0
 8002b5a:	d202      	bcs.n	8002b62 <.divsi3_skip_div0_test+0x3e>
 8002b5c:	0049      	lsls	r1, r1, #1
 8002b5e:	005b      	lsls	r3, r3, #1
 8002b60:	e7f8      	b.n	8002b54 <.divsi3_skip_div0_test+0x30>
 8002b62:	4288      	cmp	r0, r1
 8002b64:	d301      	bcc.n	8002b6a <.divsi3_skip_div0_test+0x46>
 8002b66:	1a40      	subs	r0, r0, r1
 8002b68:	431a      	orrs	r2, r3
 8002b6a:	084c      	lsrs	r4, r1, #1
 8002b6c:	42a0      	cmp	r0, r4
 8002b6e:	d302      	bcc.n	8002b76 <.divsi3_skip_div0_test+0x52>
 8002b70:	1b00      	subs	r0, r0, r4
 8002b72:	085c      	lsrs	r4, r3, #1
 8002b74:	4322      	orrs	r2, r4
 8002b76:	088c      	lsrs	r4, r1, #2
 8002b78:	42a0      	cmp	r0, r4
 8002b7a:	d302      	bcc.n	8002b82 <.divsi3_skip_div0_test+0x5e>
 8002b7c:	1b00      	subs	r0, r0, r4
 8002b7e:	089c      	lsrs	r4, r3, #2
 8002b80:	4322      	orrs	r2, r4
 8002b82:	08cc      	lsrs	r4, r1, #3
 8002b84:	42a0      	cmp	r0, r4
 8002b86:	d302      	bcc.n	8002b8e <.divsi3_skip_div0_test+0x6a>
 8002b88:	1b00      	subs	r0, r0, r4
 8002b8a:	08dc      	lsrs	r4, r3, #3
 8002b8c:	4322      	orrs	r2, r4
 8002b8e:	2800      	cmp	r0, #0
 8002b90:	d003      	beq.n	8002b9a <.divsi3_skip_div0_test+0x76>
 8002b92:	091b      	lsrs	r3, r3, #4
 8002b94:	d001      	beq.n	8002b9a <.divsi3_skip_div0_test+0x76>
 8002b96:	0909      	lsrs	r1, r1, #4
 8002b98:	e7e3      	b.n	8002b62 <.divsi3_skip_div0_test+0x3e>
 8002b9a:	1c10      	adds	r0, r2, #0
 8002b9c:	4664      	mov	r4, ip
 8002b9e:	2c00      	cmp	r4, #0
 8002ba0:	d500      	bpl.n	8002ba4 <.divsi3_skip_div0_test+0x80>
 8002ba2:	4240      	negs	r0, r0
 8002ba4:	bc10      	pop	{r4}
 8002ba6:	4770      	bx	lr
 8002ba8:	2800      	cmp	r0, #0
 8002baa:	d006      	beq.n	8002bba <.divsi3_skip_div0_test+0x96>
 8002bac:	db03      	blt.n	8002bb6 <.divsi3_skip_div0_test+0x92>
 8002bae:	2000      	movs	r0, #0
 8002bb0:	43c0      	mvns	r0, r0
 8002bb2:	0840      	lsrs	r0, r0, #1
 8002bb4:	e001      	b.n	8002bba <.divsi3_skip_div0_test+0x96>
 8002bb6:	2080      	movs	r0, #128	; 0x80
 8002bb8:	0600      	lsls	r0, r0, #24
 8002bba:	b407      	push	{r0, r1, r2}
 8002bbc:	4802      	ldr	r0, [pc, #8]	; (8002bc8 <.divsi3_skip_div0_test+0xa4>)
 8002bbe:	a102      	add	r1, pc, #8	; (adr r1, 8002bc8 <.divsi3_skip_div0_test+0xa4>)
 8002bc0:	1840      	adds	r0, r0, r1
 8002bc2:	9002      	str	r0, [sp, #8]
 8002bc4:	bd03      	pop	{r0, r1, pc}
 8002bc6:	46c0      	nop			; (mov r8, r8)
 8002bc8:	00000019 	.word	0x00000019

08002bcc <__aeabi_idivmod>:
 8002bcc:	2900      	cmp	r1, #0
 8002bce:	d0eb      	beq.n	8002ba8 <.divsi3_skip_div0_test+0x84>
 8002bd0:	b503      	push	{r0, r1, lr}
 8002bd2:	f7ff ffa7 	bl	8002b24 <.divsi3_skip_div0_test>
 8002bd6:	bc0e      	pop	{r1, r2, r3}
 8002bd8:	4342      	muls	r2, r0
 8002bda:	1a89      	subs	r1, r1, r2
 8002bdc:	4718      	bx	r3
 8002bde:	46c0      	nop			; (mov r8, r8)

08002be0 <__aeabi_idiv0>:
 8002be0:	4770      	bx	lr
 8002be2:	46c0      	nop			; (mov r8, r8)

08002be4 <_init>:
 8002be4:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
 8002be6:	46c0      	nop			; (mov r8, r8)
 8002be8:	bcf8      	pop	{r3, r4, r5, r6, r7}
 8002bea:	bc08      	pop	{r3}
 8002bec:	469e      	mov	lr, r3
 8002bee:	4770      	bx	lr

08002bf0 <_fini>:
 8002bf0:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
 8002bf2:	46c0      	nop			; (mov r8, r8)
 8002bf4:	bcf8      	pop	{r3, r4, r5, r6, r7}
 8002bf6:	bc08      	pop	{r3}
 8002bf8:	469e      	mov	lr, r3
 8002bfa:	4770      	bx	lr
 8002bfc:	69647473 	.word	0x69647473
 8002c00:	6e69206f 	.word	0x6e69206f
 8002c04:	64207469 	.word	0x64207469
 8002c08:	0a656e6f 	.word	0x0a656e6f
	...

08002c0d <font_data>:
	...
 8002c1d:	3c180000 18183c3c 18180018 00000000     ...<<<..........
 8002c2d:	63636300 00000022 00000000 00000000     .ccc"...........
 8002c3d:	36000000 36367f36 36367f36 00000000     ...66.666.66....
 8002c4d:	633e0c0c 033e6061 3e634303 00000c0c     ..>ca`>..Cc>....
 8002c5d:	00000000 06636100 6333180c 00000000     .....ac...3c....
 8002c6d:	1c000000 3b1c3636 3b66666e 00000000     ....66.;nff;....
 8002c7d:	30303000 00000060 00000000 00000000     .000`...........
 8002c8d:	180c0000 30303018 0c181830 00000000     .....0000.......
 8002c9d:	0c180000 0606060c 180c0c06 00000000     ................
 8002cad:	00000000 ff3c6642 0042663c 00000000     ....Bf<.<fB.....
 8002cbd:	00000000 ff181818 00181818 00000000     ................
	...
 8002cd5:	18180000 00003018 00000000 ff000000     .....0..........
	...
 8002cf5:	18180000 00000000 03010000 381c0e07     ...............8
 8002d05:	80c0e070 00000000 633e0000 6b6b6363     p.........>ccckk
 8002d15:	3e636363 00000000 1c0c0000 0c0c0c3c     ccc>........<...
 8002d25:	3f0c0c0c 00000000 633e0000 180c0603     ...?......>c....
 8002d35:	7f636130 00000000 633e0000 031e0303     0ac.......>c....
 8002d45:	3e630303 00000000 0e060000 6666361e     ..c>.........6ff
 8002d55:	0f06067f 00000000 607f0000 037e6060     ...........```~.
 8002d65:	3e736303 00000000 301c0000 637e6060     .cs>.......0``~c
 8002d75:	3e636363 00000000 637f0000 0c060603     ccc>.......c....
 8002d85:	1818180c 00000000 633e0000 633e6363     ..........>ccc>c
 8002d95:	3e636363 00000000 633e0000 3f636363     ccc>......>cccc?
 8002da5:	3c060303 00000000 00000000 00181800     ...<............
 8002db5:	18180000 00000000 00000000 00181800     ................
 8002dc5:	18180000 00003018 06000000 6030180c     .....0........0`
 8002dd5:	060c1830 00000000 00000000 007e0000     0.............~.
 8002de5:	00007e00 00000000 60000000 060c1830     .~.........`0...
 8002df5:	6030180c 00000000 633e0000 0c0c0663     ..0`......>cc...
 8002e05:	0c0c000c 00000000 633e0000 6b6b6f63     ..........>ccokk
 8002e15:	3e60606e 00000000 1c080000 63636336     n``>........6ccc
 8002e25:	6363637f 00000000 337e0000 333e3333     .ccc......~333>3
 8002e35:	7e333333 00000000 331e0000 60606061     333~.......3a```
 8002e45:	1e336160 00000000 367c0000 33333333     `a3.......|63333
 8002e55:	7c363333 00000000 337f0000 343c3431     336|.......314<4
 8002e65:	7f333130 00000000 337f0000 343c3431     013........314<4
 8002e75:	78303030 00000000 331e0000 6f606061     000x.......3a``o
 8002e85:	1d376363 00000000 63630000 637f6363     cc7.......cccc.c
 8002e95:	63636363 00000000 183c0000 18181818     cccc......<.....
 8002ea5:	3c181818 00000000 060f0000 06060606     ...<............
 8002eb5:	3c666606 00000000 33730000 363c3636     .ff<......s366<6
 8002ec5:	73333336 00000000 30780000 30303030     633s......x00000
 8002ed5:	7f333130 00000000 77630000 63636b7f     013.......cw.kcc
 8002ee5:	63636363 00000000 63630000 6f7f7b73     cccc......ccs{.o
 8002ef5:	63636367 00000000 361c0000 63636363     gccc.......6cccc
 8002f05:	1c366363 00000000 337e0000 303e3333     cc6.......~333>0
 8002f15:	78303030 00000000 633e0000 63636363     000x......>ccccc
 8002f25:	3e6f6b63 00000706 337e0000 363e3333     cko>......~333>6
 8002f35:	73333336 00000000 633e0000 061c3063     633s......>cc0..
 8002f45:	3e636303 00000000 dbff0000 18181899     .cc>............
 8002f55:	3c181818 00000000 63630000 63636363     ...<......cccccc
 8002f65:	3e636363 00000000 63630000 63636363     ccc>......cccccc
 8002f75:	081c3663 00000000 63630000 6b636363     c6........ccccck
 8002f85:	36367f6b 00000000 c3c30000 18183c66     k.66........f<..
 8002f95:	c3c3663c 00000000 c3c30000 183c66c3     <f...........f<.
 8002fa5:	3c181818 00000000 637f0000 180c0643     ...<.......cC...
 8002fb5:	7f636130 00000000 303c0000 30303030     0ac.......<00000
 8002fc5:	3c303030 00000000 c0800000 1c3870e0     000<.........p8.
 8002fd5:	0103070e 00000000 0c3c0000 0c0c0c0c     ..........<.....
 8002fe5:	3c0c0c0c 00000000 63361c08 00000000     ...<......6c....
	...
 8003009:	000000ff 000c1818 00000000 00000000     ................
	...
 8003021:	06463c00 3b66663e 00000000 30700000     .<F.>ff;......p0
 8003031:	33363c30 6e333333 00000000 00000000     0<63333n........
 8003041:	60633e00 3e636060 00000000 060e0000     .>c```c>........
 8003051:	66361e06 3b666666 00000000 00000000     ..6ffff;........
 8003061:	63633e00 3e63607e 00000000 361c0000     .>cc~`c>.......6
 8003071:	307c3032 78303030 00000000 00000000     20|0000x........
 8003081:	66663b00 063e6666 00003c66 30700000     .;ffff>.f<....p0
 8003091:	333b3630 73333333 00000000 0c0c0000     06;3333s........
 80030a1:	0c0c1c00 1e0c0c0c 00000000 06060000     ................
 80030b1:	06060e00 66060606 00003c66 30700000     .......ff<....p0
 80030c1:	36333330 7333363c 00000000 0c1c0000     0336<63s........
 80030d1:	0c0c0c0c 1e0c0c0c 00000000 00000000     ................
 80030e1:	6b7f6e00 6b6b6b6b 00000000 00000000     .n.kkkkk........
 80030f1:	33336e00 33333333 00000000 00000000     .n333333........
 8003101:	63633e00 3e636363 00000000 00000000     .>ccccc>........
 8003111:	33336e00 303e3333 00007830 00000000     .n3333>00x......
 8003121:	66663b00 063e6666 00000f06 00000000     .;ffff>.........
 8003131:	333b6e00 78303030 00000000 00000000     .n;3000x........
 8003141:	38633e00 3e63030e 00000000 18080000     .>c8..c>........
 8003151:	18187e18 0e1b1818 00000000 00000000     .~..............
 8003161:	66666600 3b666666 00000000 00000000     .ffffff;........
 8003171:	36636300 081c1c36 00000000 00000000     .cc66...........
 8003181:	63636300 367f6b6b 00000000 00000000     .ccckk.6........
 8003191:	1c366300 63361c1c 00000000 00000000     .c6...6c........
 80031a1:	63636300 033f6363 00003c06 00000000     .ccccc?..<......
 80031b1:	0c667f00 7f633018 00000000 180e0000     ..f..0c.........
 80031c1:	18701818 0e181818 00000000 18180000     ..p.............
 80031d1:	00181818 18181818 00000018 18700000     ..............p.
 80031e1:	180e1818 70181818 00000000 6e3b0000     .......p......;n
	...
 80031fd:	d8d87000 00000070 00000000 00000000     .p..p...........
 800320d:	6c65770a 656d6f63 206f7420 757a7553     .welcome to Suzu
 800321d:	534f6168 5e5f5e20 322e3220 420a302e     haOS ^_^ 2.2.0.B
 800322d:	444c4955 72614d20 20383220 36313032     UILD Mar 28 2016
 800323d:	3a393120 323a3633 25000a35 203a2075      19:36:25..%u : 
 800324d:	255b000a 69252069 5d692520 6f620020     ..[%i %i %i] .bo
 800325d:	6e69746f 72662067 25206d6f 72000a75     oting from %u..r
 800326d:	73206d61 74726174 20752520 6172000a     am start %u ..ra
 800327d:	6973206d 2520657a 000a2075 206d6172     m size %u ..ram 
 800328d:	65657266 20752520 6568000a 73207061     free %u ..heap s
 800329d:	74726174 20752520 0a0a000a 00000000              tart %u .......

080032ac <__EH_FRAME_BEGIN__>:
 80032ac:	00000000                                ....
