
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
 80000dc:	2000007c 	.word	0x2000007c
 80000e0:	20000014 	.word	0x20000014

080000e4 <null_thread>:
 80000e4:	b508      	push	{r3, lr}
 80000e6:	f001 f93d 	bl	8001364 <sleep>
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
 800014c:	20000014 	.word	0x20000014
 8000150:	2000007c 	.word	0x2000007c

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
 80001a4:	2000007c 	.word	0x2000007c
 80001a8:	20000014 	.word	0x20000014

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
 80001cc:	2000007c 	.word	0x2000007c

080001d0 <kernel_start>:
 80001d0:	b508      	push	{r3, lr}
 80001d2:	f001 f8bb 	bl	800134c <sys_tick_init>
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
 8000254:	20000014 	.word	0x20000014
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
 8000290:	20000014 	.word	0x20000014
 8000294:	2000007c 	.word	0x2000007c
 8000298:	2000009c 	.word	0x2000009c
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
 80002d8:	20000014 	.word	0x20000014

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
 80002fc:	20000014 	.word	0x20000014

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
 800032c:	2000011c 	.word	0x2000011c
 8000330:	2000013c 	.word	0x2000013c

08000334 <putc_>:
 8000334:	b538      	push	{r3, r4, r5, lr}
 8000336:	4c06      	ldr	r4, [pc, #24]	; (8000350 <putc_+0x1c>)
 8000338:	1c05      	adds	r5, r0, #0
 800033a:	1c20      	adds	r0, r4, #0
 800033c:	f000 f8ff 	bl	800053e <mutex_lock>
 8000340:	1c28      	adds	r0, r5, #0
 8000342:	f000 fe1f 	bl	8000f84 <uart_write>
 8000346:	1c20      	adds	r0, r4, #0
 8000348:	f000 f915 	bl	8000576 <mutex_unlock>
 800034c:	bd38      	pop	{r3, r4, r5, pc}
 800034e:	46c0      	nop			; (mov r8, r8)
 8000350:	2000017c 	.word	0x2000017c

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
 8000378:	20000188 	.word	0x20000188

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
 8000398:	f002 fa10 	bl	80027bc <__aeabi_idivmod>
 800039c:	3130      	adds	r1, #48	; 0x30
 800039e:	5571      	strb	r1, [r6, r5]
 80003a0:	1c20      	adds	r0, r4, #0
 80003a2:	210a      	movs	r1, #10
 80003a4:	f002 f9b4 	bl	8002710 <__aeabi_idiv>
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
 80003d6:	f002 f991 	bl	80026fc <__aeabi_uidivmod>
 80003da:	3130      	adds	r1, #48	; 0x30
 80003dc:	5531      	strb	r1, [r6, r4]
 80003de:	1c28      	adds	r0, r5, #0
 80003e0:	210a      	movs	r1, #10
 80003e2:	f002 f947 	bl	8002674 <__aeabi_uidiv>
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
 80004c4:	20000184 	.word	0x20000184

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
 8000508:	2000017c 	.word	0x2000017c
 800050c:	20000180 	.word	0x20000180
 8000510:	20000188 	.word	0x20000188
 8000514:	20000184 	.word	0x20000184
 8000518:	080027ec 	.word	0x080027ec

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
 800059a:	f000 fe33 	bl	8001204 <i2c_write_reg>
 800059e:	203c      	movs	r0, #60	; 0x3c
 80005a0:	2101      	movs	r1, #1
 80005a2:	1c22      	adds	r2, r4, #0
 80005a4:	f000 fe2e 	bl	8001204 <i2c_write_reg>
 80005a8:	203c      	movs	r0, #60	; 0x3c
 80005aa:	2102      	movs	r1, #2
 80005ac:	1c22      	adds	r2, r4, #0
 80005ae:	f000 fe29 	bl	8001204 <i2c_write_reg>
 80005b2:	203c      	movs	r0, #60	; 0x3c
 80005b4:	210a      	movs	r1, #10
 80005b6:	f000 fe37 	bl	8001228 <i2c_read_reg>
 80005ba:	2301      	movs	r3, #1
 80005bc:	2848      	cmp	r0, #72	; 0x48
 80005be:	d10f      	bne.n	80005e0 <hmc5883_init+0x58>
 80005c0:	203c      	movs	r0, #60	; 0x3c
 80005c2:	210b      	movs	r1, #11
 80005c4:	f000 fe30 	bl	8001228 <i2c_read_reg>
 80005c8:	2302      	movs	r3, #2
 80005ca:	2834      	cmp	r0, #52	; 0x34
 80005cc:	d108      	bne.n	80005e0 <hmc5883_init+0x58>
 80005ce:	203c      	movs	r0, #60	; 0x3c
 80005d0:	210c      	movs	r1, #12
 80005d2:	f000 fe29 	bl	8001228 <i2c_read_reg>
 80005d6:	2833      	cmp	r0, #51	; 0x33
 80005d8:	d001      	beq.n	80005de <hmc5883_init+0x56>
 80005da:	2303      	movs	r3, #3
 80005dc:	e000      	b.n	80005e0 <hmc5883_init+0x58>
 80005de:	1c23      	adds	r3, r4, #0
 80005e0:	1c18      	adds	r0, r3, #0
 80005e2:	bd10      	pop	{r4, pc}
 80005e4:	2000018c 	.word	0x2000018c

080005e8 <hmc5883_read>:
 80005e8:	b538      	push	{r3, r4, r5, lr}
 80005ea:	2103      	movs	r1, #3
 80005ec:	203c      	movs	r0, #60	; 0x3c
 80005ee:	f000 fe1b 	bl	8001228 <i2c_read_reg>
 80005f2:	4c12      	ldr	r4, [pc, #72]	; (800063c <hmc5883_read+0x54>)
 80005f4:	0205      	lsls	r5, r0, #8
 80005f6:	b2ad      	uxth	r5, r5
 80005f8:	2104      	movs	r1, #4
 80005fa:	203c      	movs	r0, #60	; 0x3c
 80005fc:	8025      	strh	r5, [r4, #0]
 80005fe:	f000 fe13 	bl	8001228 <i2c_read_reg>
 8000602:	2107      	movs	r1, #7
 8000604:	4305      	orrs	r5, r0
 8000606:	203c      	movs	r0, #60	; 0x3c
 8000608:	8025      	strh	r5, [r4, #0]
 800060a:	f000 fe0d 	bl	8001228 <i2c_read_reg>
 800060e:	0205      	lsls	r5, r0, #8
 8000610:	b2ad      	uxth	r5, r5
 8000612:	2108      	movs	r1, #8
 8000614:	203c      	movs	r0, #60	; 0x3c
 8000616:	8065      	strh	r5, [r4, #2]
 8000618:	f000 fe06 	bl	8001228 <i2c_read_reg>
 800061c:	2105      	movs	r1, #5
 800061e:	4305      	orrs	r5, r0
 8000620:	203c      	movs	r0, #60	; 0x3c
 8000622:	8065      	strh	r5, [r4, #2]
 8000624:	f000 fe00 	bl	8001228 <i2c_read_reg>
 8000628:	0205      	lsls	r5, r0, #8
 800062a:	b2ad      	uxth	r5, r5
 800062c:	2106      	movs	r1, #6
 800062e:	203c      	movs	r0, #60	; 0x3c
 8000630:	80a5      	strh	r5, [r4, #4]
 8000632:	f000 fdf9 	bl	8001228 <i2c_read_reg>
 8000636:	4305      	orrs	r5, r0
 8000638:	80a5      	strh	r5, [r4, #4]
 800063a:	bd38      	pop	{r3, r4, r5, pc}
 800063c:	2000018c 	.word	0x2000018c

08000640 <apds9950_read>:
 8000640:	b538      	push	{r3, r4, r5, lr}
 8000642:	f000 fd75 	bl	8001130 <i2cStart>
 8000646:	2072      	movs	r0, #114	; 0x72
 8000648:	f000 fd8e 	bl	8001168 <i2cWrite>
 800064c:	20b4      	movs	r0, #180	; 0xb4
 800064e:	f000 fd8b 	bl	8001168 <i2cWrite>
 8000652:	f000 fd6d 	bl	8001130 <i2cStart>
 8000656:	2073      	movs	r0, #115	; 0x73
 8000658:	f000 fd86 	bl	8001168 <i2cWrite>
 800065c:	2001      	movs	r0, #1
 800065e:	f000 fdab 	bl	80011b8 <i2cRead>
 8000662:	4c1c      	ldr	r4, [pc, #112]	; (80006d4 <apds9950_read+0x94>)
 8000664:	1c05      	adds	r5, r0, #0
 8000666:	80e0      	strh	r0, [r4, #6]
 8000668:	2001      	movs	r0, #1
 800066a:	f000 fda5 	bl	80011b8 <i2cRead>
 800066e:	0200      	lsls	r0, r0, #8
 8000670:	4305      	orrs	r5, r0
 8000672:	2001      	movs	r0, #1
 8000674:	80e5      	strh	r5, [r4, #6]
 8000676:	f000 fd9f 	bl	80011b8 <i2cRead>
 800067a:	8020      	strh	r0, [r4, #0]
 800067c:	1c05      	adds	r5, r0, #0
 800067e:	2001      	movs	r0, #1
 8000680:	f000 fd9a 	bl	80011b8 <i2cRead>
 8000684:	0200      	lsls	r0, r0, #8
 8000686:	4305      	orrs	r5, r0
 8000688:	2001      	movs	r0, #1
 800068a:	8025      	strh	r5, [r4, #0]
 800068c:	f000 fd94 	bl	80011b8 <i2cRead>
 8000690:	8060      	strh	r0, [r4, #2]
 8000692:	1c05      	adds	r5, r0, #0
 8000694:	2001      	movs	r0, #1
 8000696:	f000 fd8f 	bl	80011b8 <i2cRead>
 800069a:	0200      	lsls	r0, r0, #8
 800069c:	4305      	orrs	r5, r0
 800069e:	2001      	movs	r0, #1
 80006a0:	8065      	strh	r5, [r4, #2]
 80006a2:	f000 fd89 	bl	80011b8 <i2cRead>
 80006a6:	80a0      	strh	r0, [r4, #4]
 80006a8:	1c05      	adds	r5, r0, #0
 80006aa:	2001      	movs	r0, #1
 80006ac:	f000 fd84 	bl	80011b8 <i2cRead>
 80006b0:	0200      	lsls	r0, r0, #8
 80006b2:	4305      	orrs	r5, r0
 80006b4:	2001      	movs	r0, #1
 80006b6:	80a5      	strh	r5, [r4, #4]
 80006b8:	f000 fd7e 	bl	80011b8 <i2cRead>
 80006bc:	8120      	strh	r0, [r4, #8]
 80006be:	1c05      	adds	r5, r0, #0
 80006c0:	2000      	movs	r0, #0
 80006c2:	f000 fd79 	bl	80011b8 <i2cRead>
 80006c6:	0200      	lsls	r0, r0, #8
 80006c8:	4305      	orrs	r5, r0
 80006ca:	8125      	strh	r5, [r4, #8]
 80006cc:	f000 fd3e 	bl	800114c <i2cStop>
 80006d0:	bd38      	pop	{r3, r4, r5, pc}
 80006d2:	46c0      	nop			; (mov r8, r8)
 80006d4:	20000192 	.word	0x20000192

080006d8 <apds950_init>:
 80006d8:	b508      	push	{r3, lr}
 80006da:	2072      	movs	r0, #114	; 0x72
 80006dc:	2181      	movs	r1, #129	; 0x81
 80006de:	22ff      	movs	r2, #255	; 0xff
 80006e0:	f000 fd90 	bl	8001204 <i2c_write_reg>
 80006e4:	2072      	movs	r0, #114	; 0x72
 80006e6:	2183      	movs	r1, #131	; 0x83
 80006e8:	22ff      	movs	r2, #255	; 0xff
 80006ea:	f000 fd8b 	bl	8001204 <i2c_write_reg>
 80006ee:	2072      	movs	r0, #114	; 0x72
 80006f0:	218d      	movs	r1, #141	; 0x8d
 80006f2:	2200      	movs	r2, #0
 80006f4:	f000 fd86 	bl	8001204 <i2c_write_reg>
 80006f8:	2072      	movs	r0, #114	; 0x72
 80006fa:	2180      	movs	r1, #128	; 0x80
 80006fc:	2203      	movs	r2, #3
 80006fe:	f000 fd81 	bl	8001204 <i2c_write_reg>
 8000702:	2072      	movs	r0, #114	; 0x72
 8000704:	218f      	movs	r1, #143	; 0x8f
 8000706:	2223      	movs	r2, #35	; 0x23
 8000708:	f000 fd7c 	bl	8001204 <i2c_write_reg>
 800070c:	2072      	movs	r0, #114	; 0x72
 800070e:	2180      	movs	r1, #128	; 0x80
 8000710:	2207      	movs	r2, #7
 8000712:	f000 fd77 	bl	8001204 <i2c_write_reg>
 8000716:	2072      	movs	r0, #114	; 0x72
 8000718:	218e      	movs	r1, #142	; 0x8e
 800071a:	2208      	movs	r2, #8
 800071c:	f000 fd72 	bl	8001204 <i2c_write_reg>
 8000720:	f7ff ff8e 	bl	8000640 <apds9950_read>
 8000724:	2000      	movs	r0, #0
 8000726:	bd08      	pop	{r3, pc}

08000728 <LCD_SH1106_write_command>:
 8000728:	b508      	push	{r3, lr}
 800072a:	1c02      	adds	r2, r0, #0
 800072c:	2100      	movs	r1, #0
 800072e:	2078      	movs	r0, #120	; 0x78
 8000730:	f000 fd68 	bl	8001204 <i2c_write_reg>
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
 8000794:	2000019e 	.word	0x2000019e

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
 80007cc:	2000019e 	.word	0x2000019e

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
 8000810:	f000 fc8e 	bl	8001130 <i2cStart>
 8000814:	2078      	movs	r0, #120	; 0x78
 8000816:	f000 fca7 	bl	8001168 <i2cWrite>
 800081a:	2040      	movs	r0, #64	; 0x40
 800081c:	f000 fca4 	bl	8001168 <i2cWrite>
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
 800083a:	f000 fc95 	bl	8001168 <i2cWrite>
 800083e:	9b03      	ldr	r3, [sp, #12]
 8000840:	3301      	adds	r3, #1
 8000842:	9303      	str	r3, [sp, #12]
 8000844:	e7ee      	b.n	8000824 <LCD_SH1106_flush_buffer+0x54>
 8000846:	f000 fc81 	bl	800114c <i2cStop>
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
 8000864:	2000019e 	.word	0x2000019e

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
 80008d4:	f000 fc2c 	bl	8001130 <i2cStart>
 80008d8:	2078      	movs	r0, #120	; 0x78
 80008da:	f000 fc45 	bl	8001168 <i2cWrite>
 80008de:	2040      	movs	r0, #64	; 0x40
 80008e0:	f000 fc42 	bl	8001168 <i2cWrite>
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
 80008fe:	f000 fc33 	bl	8001168 <i2cWrite>
 8000902:	9b03      	ldr	r3, [sp, #12]
 8000904:	3301      	adds	r3, #1
 8000906:	9303      	str	r3, [sp, #12]
 8000908:	e7ee      	b.n	80008e8 <LCD_SH1106_flush_buffer_partial+0x80>
 800090a:	f000 fc1f 	bl	800114c <i2cStop>
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
 8000934:	2000019c 	.word	0x2000019c
 8000938:	2000059e 	.word	0x2000059e
 800093c:	2000019e 	.word	0x2000019e

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
 80009f4:	2000019c 	.word	0x2000019c
 80009f8:	2000059e 	.word	0x2000059e

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
 8000a50:	080027fd 	.word	0x080027fd

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
 8000a74:	f001 fea2 	bl	80027bc <__aeabi_idivmod>
 8000a78:	3130      	adds	r1, #48	; 0x30
 8000a7a:	5571      	strb	r1, [r6, r5]
 8000a7c:	1c20      	adds	r0, r4, #0
 8000a7e:	210a      	movs	r1, #10
 8000a80:	f001 fe46 	bl	8002710 <__aeabi_idiv>
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
 8000ac2:	f000 fbb1 	bl	8001228 <i2c_read_reg>
 8000ac6:	4c38      	ldr	r4, [pc, #224]	; (8000ba8 <mpu6050_read+0xec>)
 8000ac8:	0205      	lsls	r5, r0, #8
 8000aca:	b2ad      	uxth	r5, r5
 8000acc:	213c      	movs	r1, #60	; 0x3c
 8000ace:	20d0      	movs	r0, #208	; 0xd0
 8000ad0:	8025      	strh	r5, [r4, #0]
 8000ad2:	f000 fba9 	bl	8001228 <i2c_read_reg>
 8000ad6:	213d      	movs	r1, #61	; 0x3d
 8000ad8:	4305      	orrs	r5, r0
 8000ada:	20d0      	movs	r0, #208	; 0xd0
 8000adc:	8025      	strh	r5, [r4, #0]
 8000ade:	f000 fba3 	bl	8001228 <i2c_read_reg>
 8000ae2:	0205      	lsls	r5, r0, #8
 8000ae4:	b2ad      	uxth	r5, r5
 8000ae6:	213e      	movs	r1, #62	; 0x3e
 8000ae8:	20d0      	movs	r0, #208	; 0xd0
 8000aea:	8065      	strh	r5, [r4, #2]
 8000aec:	f000 fb9c 	bl	8001228 <i2c_read_reg>
 8000af0:	213f      	movs	r1, #63	; 0x3f
 8000af2:	4305      	orrs	r5, r0
 8000af4:	20d0      	movs	r0, #208	; 0xd0
 8000af6:	8065      	strh	r5, [r4, #2]
 8000af8:	f000 fb96 	bl	8001228 <i2c_read_reg>
 8000afc:	0205      	lsls	r5, r0, #8
 8000afe:	b2ad      	uxth	r5, r5
 8000b00:	2140      	movs	r1, #64	; 0x40
 8000b02:	20d0      	movs	r0, #208	; 0xd0
 8000b04:	80a5      	strh	r5, [r4, #4]
 8000b06:	f000 fb8f 	bl	8001228 <i2c_read_reg>
 8000b0a:	2141      	movs	r1, #65	; 0x41
 8000b0c:	4305      	orrs	r5, r0
 8000b0e:	20d0      	movs	r0, #208	; 0xd0
 8000b10:	80a5      	strh	r5, [r4, #4]
 8000b12:	f000 fb89 	bl	8001228 <i2c_read_reg>
 8000b16:	0205      	lsls	r5, r0, #8
 8000b18:	b2ad      	uxth	r5, r5
 8000b1a:	2142      	movs	r1, #66	; 0x42
 8000b1c:	20d0      	movs	r0, #208	; 0xd0
 8000b1e:	8425      	strh	r5, [r4, #32]
 8000b20:	f000 fb82 	bl	8001228 <i2c_read_reg>
 8000b24:	2143      	movs	r1, #67	; 0x43
 8000b26:	4305      	orrs	r5, r0
 8000b28:	20d0      	movs	r0, #208	; 0xd0
 8000b2a:	8425      	strh	r5, [r4, #32]
 8000b2c:	f000 fb7c 	bl	8001228 <i2c_read_reg>
 8000b30:	0205      	lsls	r5, r0, #8
 8000b32:	b2ad      	uxth	r5, r5
 8000b34:	2144      	movs	r1, #68	; 0x44
 8000b36:	20d0      	movs	r0, #208	; 0xd0
 8000b38:	80e5      	strh	r5, [r4, #6]
 8000b3a:	f000 fb75 	bl	8001228 <i2c_read_reg>
 8000b3e:	2145      	movs	r1, #69	; 0x45
 8000b40:	4305      	orrs	r5, r0
 8000b42:	20d0      	movs	r0, #208	; 0xd0
 8000b44:	80e5      	strh	r5, [r4, #6]
 8000b46:	f000 fb6f 	bl	8001228 <i2c_read_reg>
 8000b4a:	0205      	lsls	r5, r0, #8
 8000b4c:	b2ad      	uxth	r5, r5
 8000b4e:	2146      	movs	r1, #70	; 0x46
 8000b50:	20d0      	movs	r0, #208	; 0xd0
 8000b52:	8125      	strh	r5, [r4, #8]
 8000b54:	f000 fb68 	bl	8001228 <i2c_read_reg>
 8000b58:	2147      	movs	r1, #71	; 0x47
 8000b5a:	4305      	orrs	r5, r0
 8000b5c:	20d0      	movs	r0, #208	; 0xd0
 8000b5e:	8125      	strh	r5, [r4, #8]
 8000b60:	f000 fb62 	bl	8001228 <i2c_read_reg>
 8000b64:	0205      	lsls	r5, r0, #8
 8000b66:	2148      	movs	r1, #72	; 0x48
 8000b68:	b2ad      	uxth	r5, r5
 8000b6a:	20d0      	movs	r0, #208	; 0xd0
 8000b6c:	8165      	strh	r5, [r4, #10]
 8000b6e:	f000 fb5b 	bl	8001228 <i2c_read_reg>
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
 8000ba8:	200005a0 	.word	0x200005a0

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
 8000bc6:	f000 fb1d 	bl	8001204 <i2c_write_reg>
 8000bca:	1c37      	adds	r7, r6, #0
 8000bcc:	9601      	str	r6, [sp, #4]
 8000bce:	f7ff ff75 	bl	8000abc <mpu6050_read>
 8000bd2:	200a      	movs	r0, #10
 8000bd4:	f000 f99c 	bl	8000f10 <timer_delay_ms>
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
 8000bf8:	f001 fd8a 	bl	8002710 <__aeabi_idiv>
 8000bfc:	2164      	movs	r1, #100	; 0x64
 8000bfe:	81a0      	strh	r0, [r4, #12]
 8000c00:	9801      	ldr	r0, [sp, #4]
 8000c02:	f001 fd85 	bl	8002710 <__aeabi_idiv>
 8000c06:	2164      	movs	r1, #100	; 0x64
 8000c08:	81e0      	strh	r0, [r4, #14]
 8000c0a:	1c30      	adds	r0, r6, #0
 8000c0c:	f001 fd80 	bl	8002710 <__aeabi_idiv>
 8000c10:	6165      	str	r5, [r4, #20]
 8000c12:	61a5      	str	r5, [r4, #24]
 8000c14:	61e5      	str	r5, [r4, #28]
 8000c16:	8220      	strh	r0, [r4, #16]
 8000c18:	bdf7      	pop	{r0, r1, r2, r4, r5, r6, r7, pc}
 8000c1a:	46c0      	nop			; (mov r8, r8)
 8000c1c:	200005a0 	.word	0x200005a0

08000c20 <i2c_devices_thread>:
 8000c20:	b538      	push	{r3, r4, r5, lr}
 8000c22:	2132      	movs	r1, #50	; 0x32
 8000c24:	2000      	movs	r0, #0
 8000c26:	f000 f983 	bl	8000f30 <event_timer_set_period>
 8000c2a:	f7ff fcad 	bl	8000588 <hmc5883_init>
 8000c2e:	f7ff ffbd 	bl	8000bac <mpu6050_init>
 8000c32:	f7ff fd51 	bl	80006d8 <apds950_init>
 8000c36:	f7ff fe83 	bl	8000940 <LCD_SH1106_init>
 8000c3a:	2000      	movs	r0, #0
 8000c3c:	f7ff fdac 	bl	8000798 <LCD_SH1106_clear_buffer>
 8000c40:	2000      	movs	r0, #0
 8000c42:	f000 f987 	bl	8000f54 <event_timer_get_flag>
 8000c46:	2800      	cmp	r0, #0
 8000c48:	d00e      	beq.n	8000c68 <i2c_devices_thread+0x48>
 8000c4a:	2000      	movs	r0, #0
 8000c4c:	f000 f990 	bl	8000f70 <event_timer_clear_flag>
 8000c50:	2008      	movs	r0, #8
 8000c52:	f001 fcb1 	bl	80025b8 <led_on>
 8000c56:	f7ff fcc7 	bl	80005e8 <hmc5883_read>
 8000c5a:	f7ff ff2f 	bl	8000abc <mpu6050_read>
 8000c5e:	f7ff fcef 	bl	8000640 <apds9950_read>
 8000c62:	2008      	movs	r0, #8
 8000c64:	f001 fcbc 	bl	80025e0 <led_off>
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
 8000cc6:	f000 f917 	bl	8000ef8 <timer_get_time>
 8000cca:	2140      	movs	r1, #64	; 0x40
 8000ccc:	2230      	movs	r2, #48	; 0x30
 8000cce:	f7ff fec1 	bl	8000a54 <lcd_put_int>
 8000cd2:	e7b5      	b.n	8000c40 <i2c_devices_thread+0x20>
 8000cd4:	200005a0 	.word	0x200005a0
 8000cd8:	2000018c 	.word	0x2000018c
 8000cdc:	20000192 	.word	0x20000192

08000ce0 <main_thread>:
 8000ce0:	b538      	push	{r3, r4, r5, lr}
 8000ce2:	2008      	movs	r0, #8
 8000ce4:	f001 fc68 	bl	80025b8 <led_on>
 8000ce8:	4821      	ldr	r0, [pc, #132]	; (8000d70 <main_thread+0x90>)
 8000cea:	f7ff fb9d 	bl	8000428 <printf_>
 8000cee:	2280      	movs	r2, #128	; 0x80
 8000cf0:	4820      	ldr	r0, [pc, #128]	; (8000d74 <main_thread+0x94>)
 8000cf2:	4921      	ldr	r1, [pc, #132]	; (8000d78 <main_thread+0x98>)
 8000cf4:	0052      	lsls	r2, r2, #1
 8000cf6:	2308      	movs	r3, #8
 8000cf8:	f7ff fa70 	bl	80001dc <create_thread>
 8000cfc:	2008      	movs	r0, #8
 8000cfe:	f001 fc5b 	bl	80025b8 <led_on>
 8000d02:	f000 f8f9 	bl	8000ef8 <timer_get_time>
 8000d06:	1c01      	adds	r1, r0, #0
 8000d08:	481c      	ldr	r0, [pc, #112]	; (8000d7c <main_thread+0x9c>)
 8000d0a:	f7ff fb8d 	bl	8000428 <printf_>
 8000d0e:	4c1c      	ldr	r4, [pc, #112]	; (8000d80 <main_thread+0xa0>)
 8000d10:	4d1c      	ldr	r5, [pc, #112]	; (8000d84 <main_thread+0xa4>)
 8000d12:	2302      	movs	r3, #2
 8000d14:	5ee2      	ldrsh	r2, [r4, r3]
 8000d16:	2000      	movs	r0, #0
 8000d18:	5e21      	ldrsh	r1, [r4, r0]
 8000d1a:	2004      	movs	r0, #4
 8000d1c:	5e23      	ldrsh	r3, [r4, r0]
 8000d1e:	1c28      	adds	r0, r5, #0
 8000d20:	f7ff fb82 	bl	8000428 <printf_>
 8000d24:	2206      	movs	r2, #6
 8000d26:	5ea1      	ldrsh	r1, [r4, r2]
 8000d28:	2308      	movs	r3, #8
 8000d2a:	5ee2      	ldrsh	r2, [r4, r3]
 8000d2c:	200a      	movs	r0, #10
 8000d2e:	5e23      	ldrsh	r3, [r4, r0]
 8000d30:	1c28      	adds	r0, r5, #0
 8000d32:	f7ff fb79 	bl	8000428 <printf_>
 8000d36:	4b14      	ldr	r3, [pc, #80]	; (8000d88 <main_thread+0xa8>)
 8000d38:	2200      	movs	r2, #0
 8000d3a:	5e99      	ldrsh	r1, [r3, r2]
 8000d3c:	2002      	movs	r0, #2
 8000d3e:	5e1a      	ldrsh	r2, [r3, r0]
 8000d40:	2004      	movs	r0, #4
 8000d42:	5e1b      	ldrsh	r3, [r3, r0]
 8000d44:	1c28      	adds	r0, r5, #0
 8000d46:	f7ff fb6f 	bl	8000428 <printf_>
 8000d4a:	4b10      	ldr	r3, [pc, #64]	; (8000d8c <main_thread+0xac>)
 8000d4c:	1c28      	adds	r0, r5, #0
 8000d4e:	8819      	ldrh	r1, [r3, #0]
 8000d50:	885a      	ldrh	r2, [r3, #2]
 8000d52:	889b      	ldrh	r3, [r3, #4]
 8000d54:	f7ff fb68 	bl	8000428 <printf_>
 8000d58:	480d      	ldr	r0, [pc, #52]	; (8000d90 <main_thread+0xb0>)
 8000d5a:	f7ff fb65 	bl	8000428 <printf_>
 8000d5e:	2008      	movs	r0, #8
 8000d60:	f001 fc3e 	bl	80025e0 <led_off>
 8000d64:	20fa      	movs	r0, #250	; 0xfa
 8000d66:	0080      	lsls	r0, r0, #2
 8000d68:	f000 f8d2 	bl	8000f10 <timer_delay_ms>
 8000d6c:	e7c6      	b.n	8000cfc <main_thread+0x1c>
 8000d6e:	46c0      	nop			; (mov r8, r8)
 8000d70:	08002dfd 	.word	0x08002dfd
 8000d74:	08000c21 	.word	0x08000c21
 8000d78:	200005c4 	.word	0x200005c4
 8000d7c:	08002e38 	.word	0x08002e38
 8000d80:	200005a0 	.word	0x200005a0
 8000d84:	08002e3f 	.word	0x08002e3f
 8000d88:	2000018c 	.word	0x2000018c
 8000d8c:	20000192 	.word	0x20000192
 8000d90:	08002e98 	.word	0x08002e98

08000d94 <mem_info_print>:
 8000d94:	b538      	push	{r3, r4, r5, lr}
 8000d96:	480e      	ldr	r0, [pc, #56]	; (8000dd0 <mem_info_print+0x3c>)
 8000d98:	490e      	ldr	r1, [pc, #56]	; (8000dd4 <mem_info_print+0x40>)
 8000d9a:	f7ff fb45 	bl	8000428 <printf_>
 8000d9e:	4c0e      	ldr	r4, [pc, #56]	; (8000dd8 <mem_info_print+0x44>)
 8000da0:	480e      	ldr	r0, [pc, #56]	; (8000ddc <mem_info_print+0x48>)
 8000da2:	1c21      	adds	r1, r4, #0
 8000da4:	f7ff fb40 	bl	8000428 <printf_>
 8000da8:	4d0d      	ldr	r5, [pc, #52]	; (8000de0 <mem_info_print+0x4c>)
 8000daa:	480e      	ldr	r0, [pc, #56]	; (8000de4 <mem_info_print+0x50>)
 8000dac:	1b2d      	subs	r5, r5, r4
 8000dae:	1c29      	adds	r1, r5, #0
 8000db0:	f7ff fb3a 	bl	8000428 <printf_>
 8000db4:	490c      	ldr	r1, [pc, #48]	; (8000de8 <mem_info_print+0x54>)
 8000db6:	480d      	ldr	r0, [pc, #52]	; (8000dec <mem_info_print+0x58>)
 8000db8:	1a64      	subs	r4, r4, r1
 8000dba:	1929      	adds	r1, r5, r4
 8000dbc:	f7ff fb34 	bl	8000428 <printf_>
 8000dc0:	490b      	ldr	r1, [pc, #44]	; (8000df0 <mem_info_print+0x5c>)
 8000dc2:	480c      	ldr	r0, [pc, #48]	; (8000df4 <mem_info_print+0x60>)
 8000dc4:	f7ff fb30 	bl	8000428 <printf_>
 8000dc8:	480b      	ldr	r0, [pc, #44]	; (8000df8 <mem_info_print+0x64>)
 8000dca:	f7ff fb2d 	bl	8000428 <printf_>
 8000dce:	bd38      	pop	{r3, r4, r5, pc}
 8000dd0:	08002e4b 	.word	0x08002e4b
 8000dd4:	080027d4 	.word	0x080027d4
 8000dd8:	20000000 	.word	0x20000000
 8000ddc:	08002e5c 	.word	0x08002e5c
 8000de0:	20001000 	.word	0x20001000
 8000de4:	08002e6b 	.word	0x08002e6b
 8000de8:	20000809 	.word	0x20000809
 8000dec:	08002e79 	.word	0x08002e79
 8000df0:	20000809 	.word	0x20000809
 8000df4:	08002e87 	.word	0x08002e87
 8000df8:	08002e97 	.word	0x08002e97

08000dfc <main>:
 8000dfc:	b508      	push	{r3, lr}
 8000dfe:	f000 fb57 	bl	80014b0 <lib_low_level_init>
 8000e02:	f7ff fb8b 	bl	800051c <lib_os_init>
 8000e06:	f7ff ffc5 	bl	8000d94 <mem_info_print>
 8000e0a:	2280      	movs	r2, #128	; 0x80
 8000e0c:	4904      	ldr	r1, [pc, #16]	; (8000e20 <main+0x24>)
 8000e0e:	0052      	lsls	r2, r2, #1
 8000e10:	2308      	movs	r3, #8
 8000e12:	4804      	ldr	r0, [pc, #16]	; (8000e24 <main+0x28>)
 8000e14:	f7ff f9e2 	bl	80001dc <create_thread>
 8000e18:	f7ff f9da 	bl	80001d0 <kernel_start>
 8000e1c:	2000      	movs	r0, #0
 8000e1e:	bd08      	pop	{r3, pc}
 8000e20:	200006c4 	.word	0x200006c4
 8000e24:	08000ce1 	.word	0x08000ce1

08000e28 <timer_init>:
 8000e28:	b530      	push	{r4, r5, lr}
 8000e2a:	2300      	movs	r3, #0
 8000e2c:	b085      	sub	sp, #20
 8000e2e:	481b      	ldr	r0, [pc, #108]	; (8000e9c <timer_init+0x74>)
 8000e30:	2180      	movs	r1, #128	; 0x80
 8000e32:	005a      	lsls	r2, r3, #1
 8000e34:	00c9      	lsls	r1, r1, #3
 8000e36:	5211      	strh	r1, [r2, r0]
 8000e38:	4819      	ldr	r0, [pc, #100]	; (8000ea0 <timer_init+0x78>)
 8000e3a:	2400      	movs	r4, #0
 8000e3c:	5211      	strh	r1, [r2, r0]
 8000e3e:	4919      	ldr	r1, [pc, #100]	; (8000ea4 <timer_init+0x7c>)
 8000e40:	3301      	adds	r3, #1
 8000e42:	5254      	strh	r4, [r2, r1]
 8000e44:	2b04      	cmp	r3, #4
 8000e46:	d1f2      	bne.n	8000e2e <timer_init+0x6>
 8000e48:	4b17      	ldr	r3, [pc, #92]	; (8000ea8 <timer_init+0x80>)
 8000e4a:	2001      	movs	r0, #1
 8000e4c:	1c01      	adds	r1, r0, #0
 8000e4e:	601c      	str	r4, [r3, #0]
 8000e50:	f001 faee 	bl	8002430 <RCC_APB1PeriphClockCmd>
 8000e54:	a901      	add	r1, sp, #4
 8000e56:	2330      	movs	r3, #48	; 0x30
 8000e58:	800b      	strh	r3, [r1, #0]
 8000e5a:	2080      	movs	r0, #128	; 0x80
 8000e5c:	23fa      	movs	r3, #250	; 0xfa
 8000e5e:	009b      	lsls	r3, r3, #2
 8000e60:	05c0      	lsls	r0, r0, #23
 8000e62:	604b      	str	r3, [r1, #4]
 8000e64:	804c      	strh	r4, [r1, #2]
 8000e66:	810c      	strh	r4, [r1, #8]
 8000e68:	728c      	strb	r4, [r1, #10]
 8000e6a:	f000 fcbf 	bl	80017ec <TIM_TimeBaseInit>
 8000e6e:	2080      	movs	r0, #128	; 0x80
 8000e70:	05c0      	lsls	r0, r0, #23
 8000e72:	2101      	movs	r1, #1
 8000e74:	f000 fd3c 	bl	80018f0 <TIM_Cmd>
 8000e78:	2080      	movs	r0, #128	; 0x80
 8000e7a:	2102      	movs	r1, #2
 8000e7c:	05c0      	lsls	r0, r0, #23
 8000e7e:	2201      	movs	r2, #1
 8000e80:	f000 fd7a 	bl	8001978 <TIM_ITConfig>
 8000e84:	466a      	mov	r2, sp
 8000e86:	230f      	movs	r3, #15
 8000e88:	7013      	strb	r3, [r2, #0]
 8000e8a:	4668      	mov	r0, sp
 8000e8c:	2301      	movs	r3, #1
 8000e8e:	7053      	strb	r3, [r2, #1]
 8000e90:	7093      	strb	r3, [r2, #2]
 8000e92:	f001 f953 	bl	800213c <NVIC_Init>
 8000e96:	b005      	add	sp, #20
 8000e98:	bd30      	pop	{r4, r5, pc}
 8000e9a:	46c0      	nop			; (mov r8, r8)
 8000e9c:	200007d8 	.word	0x200007d8
 8000ea0:	200007cc 	.word	0x200007cc
 8000ea4:	200007c4 	.word	0x200007c4
 8000ea8:	200007d4 	.word	0x200007d4

08000eac <TIM2_IRQHandler>:
 8000eac:	2200      	movs	r2, #0
 8000eae:	490e      	ldr	r1, [pc, #56]	; (8000ee8 <TIM2_IRQHandler+0x3c>)
 8000eb0:	0053      	lsls	r3, r2, #1
 8000eb2:	5a58      	ldrh	r0, [r3, r1]
 8000eb4:	2800      	cmp	r0, #0
 8000eb6:	d003      	beq.n	8000ec0 <TIM2_IRQHandler+0x14>
 8000eb8:	5a58      	ldrh	r0, [r3, r1]
 8000eba:	3801      	subs	r0, #1
 8000ebc:	b280      	uxth	r0, r0
 8000ebe:	e005      	b.n	8000ecc <TIM2_IRQHandler+0x20>
 8000ec0:	480a      	ldr	r0, [pc, #40]	; (8000eec <TIM2_IRQHandler+0x40>)
 8000ec2:	5a18      	ldrh	r0, [r3, r0]
 8000ec4:	b280      	uxth	r0, r0
 8000ec6:	5258      	strh	r0, [r3, r1]
 8000ec8:	4909      	ldr	r1, [pc, #36]	; (8000ef0 <TIM2_IRQHandler+0x44>)
 8000eca:	2001      	movs	r0, #1
 8000ecc:	3201      	adds	r2, #1
 8000ece:	5258      	strh	r0, [r3, r1]
 8000ed0:	2a04      	cmp	r2, #4
 8000ed2:	d1ec      	bne.n	8000eae <TIM2_IRQHandler+0x2>
 8000ed4:	4b07      	ldr	r3, [pc, #28]	; (8000ef4 <TIM2_IRQHandler+0x48>)
 8000ed6:	681a      	ldr	r2, [r3, #0]
 8000ed8:	3201      	adds	r2, #1
 8000eda:	601a      	str	r2, [r3, #0]
 8000edc:	2380      	movs	r3, #128	; 0x80
 8000ede:	2200      	movs	r2, #0
 8000ee0:	05db      	lsls	r3, r3, #23
 8000ee2:	821a      	strh	r2, [r3, #16]
 8000ee4:	4770      	bx	lr
 8000ee6:	46c0      	nop			; (mov r8, r8)
 8000ee8:	200007d8 	.word	0x200007d8
 8000eec:	200007cc 	.word	0x200007cc
 8000ef0:	200007c4 	.word	0x200007c4
 8000ef4:	200007d4 	.word	0x200007d4

08000ef8 <timer_get_time>:
 8000ef8:	b082      	sub	sp, #8
 8000efa:	b672      	cpsid	i
 8000efc:	4b03      	ldr	r3, [pc, #12]	; (8000f0c <timer_get_time+0x14>)
 8000efe:	681b      	ldr	r3, [r3, #0]
 8000f00:	9301      	str	r3, [sp, #4]
 8000f02:	b662      	cpsie	i
 8000f04:	9801      	ldr	r0, [sp, #4]
 8000f06:	b002      	add	sp, #8
 8000f08:	4770      	bx	lr
 8000f0a:	46c0      	nop			; (mov r8, r8)
 8000f0c:	200007d4 	.word	0x200007d4

08000f10 <timer_delay_ms>:
 8000f10:	b513      	push	{r0, r1, r4, lr}
 8000f12:	1c04      	adds	r4, r0, #0
 8000f14:	f7ff fff0 	bl	8000ef8 <timer_get_time>
 8000f18:	1904      	adds	r4, r0, r4
 8000f1a:	9401      	str	r4, [sp, #4]
 8000f1c:	9c01      	ldr	r4, [sp, #4]
 8000f1e:	f7ff ffeb 	bl	8000ef8 <timer_get_time>
 8000f22:	4284      	cmp	r4, r0
 8000f24:	d902      	bls.n	8000f2c <timer_delay_ms+0x1c>
 8000f26:	f000 fa1d 	bl	8001364 <sleep>
 8000f2a:	e7f7      	b.n	8000f1c <timer_delay_ms+0xc>
 8000f2c:	bd13      	pop	{r0, r1, r4, pc}
	...

08000f30 <event_timer_set_period>:
 8000f30:	b672      	cpsid	i
 8000f32:	4b05      	ldr	r3, [pc, #20]	; (8000f48 <event_timer_set_period+0x18>)
 8000f34:	0040      	lsls	r0, r0, #1
 8000f36:	52c1      	strh	r1, [r0, r3]
 8000f38:	4b04      	ldr	r3, [pc, #16]	; (8000f4c <event_timer_set_period+0x1c>)
 8000f3a:	2200      	movs	r2, #0
 8000f3c:	52c1      	strh	r1, [r0, r3]
 8000f3e:	4b04      	ldr	r3, [pc, #16]	; (8000f50 <event_timer_set_period+0x20>)
 8000f40:	52c2      	strh	r2, [r0, r3]
 8000f42:	b662      	cpsie	i
 8000f44:	4770      	bx	lr
 8000f46:	46c0      	nop			; (mov r8, r8)
 8000f48:	200007d8 	.word	0x200007d8
 8000f4c:	200007cc 	.word	0x200007cc
 8000f50:	200007c4 	.word	0x200007c4

08000f54 <event_timer_get_flag>:
 8000f54:	b082      	sub	sp, #8
 8000f56:	b672      	cpsid	i
 8000f58:	4b04      	ldr	r3, [pc, #16]	; (8000f6c <event_timer_get_flag+0x18>)
 8000f5a:	0040      	lsls	r0, r0, #1
 8000f5c:	5ac3      	ldrh	r3, [r0, r3]
 8000f5e:	b29b      	uxth	r3, r3
 8000f60:	9301      	str	r3, [sp, #4]
 8000f62:	b662      	cpsie	i
 8000f64:	9801      	ldr	r0, [sp, #4]
 8000f66:	b002      	add	sp, #8
 8000f68:	4770      	bx	lr
 8000f6a:	46c0      	nop			; (mov r8, r8)
 8000f6c:	200007c4 	.word	0x200007c4

08000f70 <event_timer_clear_flag>:
 8000f70:	b672      	cpsid	i
 8000f72:	4b03      	ldr	r3, [pc, #12]	; (8000f80 <event_timer_clear_flag+0x10>)
 8000f74:	0040      	lsls	r0, r0, #1
 8000f76:	2200      	movs	r2, #0
 8000f78:	52c2      	strh	r2, [r0, r3]
 8000f7a:	b662      	cpsie	i
 8000f7c:	4770      	bx	lr
 8000f7e:	46c0      	nop			; (mov r8, r8)
 8000f80:	200007c4 	.word	0x200007c4

08000f84 <uart_write>:
 8000f84:	4b03      	ldr	r3, [pc, #12]	; (8000f94 <uart_write+0x10>)
 8000f86:	69da      	ldr	r2, [r3, #28]
 8000f88:	0611      	lsls	r1, r2, #24
 8000f8a:	d401      	bmi.n	8000f90 <uart_write+0xc>
 8000f8c:	46c0      	nop			; (mov r8, r8)
 8000f8e:	e7f9      	b.n	8000f84 <uart_write>
 8000f90:	8518      	strh	r0, [r3, #40]	; 0x28
 8000f92:	4770      	bx	lr
 8000f94:	40013800 	.word	0x40013800

08000f98 <USART1_IRQHandler>:
 8000f98:	b508      	push	{r3, lr}
 8000f9a:	480e      	ldr	r0, [pc, #56]	; (8000fd4 <USART1_IRQHandler+0x3c>)
 8000f9c:	490e      	ldr	r1, [pc, #56]	; (8000fd8 <USART1_IRQHandler+0x40>)
 8000f9e:	f000 fe7d 	bl	8001c9c <USART_GetITStatus>
 8000fa2:	2800      	cmp	r0, #0
 8000fa4:	d011      	beq.n	8000fca <USART1_IRQHandler+0x32>
 8000fa6:	480b      	ldr	r0, [pc, #44]	; (8000fd4 <USART1_IRQHandler+0x3c>)
 8000fa8:	f000 fe44 	bl	8001c34 <USART_ReceiveData>
 8000fac:	4b0b      	ldr	r3, [pc, #44]	; (8000fdc <USART1_IRQHandler+0x44>)
 8000fae:	490c      	ldr	r1, [pc, #48]	; (8000fe0 <USART1_IRQHandler+0x48>)
 8000fb0:	881a      	ldrh	r2, [r3, #0]
 8000fb2:	b2c0      	uxtb	r0, r0
 8000fb4:	b292      	uxth	r2, r2
 8000fb6:	5488      	strb	r0, [r1, r2]
 8000fb8:	881a      	ldrh	r2, [r3, #0]
 8000fba:	3201      	adds	r2, #1
 8000fbc:	b292      	uxth	r2, r2
 8000fbe:	801a      	strh	r2, [r3, #0]
 8000fc0:	881a      	ldrh	r2, [r3, #0]
 8000fc2:	2a0f      	cmp	r2, #15
 8000fc4:	d901      	bls.n	8000fca <USART1_IRQHandler+0x32>
 8000fc6:	2200      	movs	r2, #0
 8000fc8:	801a      	strh	r2, [r3, #0]
 8000fca:	4802      	ldr	r0, [pc, #8]	; (8000fd4 <USART1_IRQHandler+0x3c>)
 8000fcc:	4902      	ldr	r1, [pc, #8]	; (8000fd8 <USART1_IRQHandler+0x40>)
 8000fce:	f000 fefd 	bl	8001dcc <USART_ClearITPendingBit>
 8000fd2:	bd08      	pop	{r3, pc}
 8000fd4:	40013800 	.word	0x40013800
 8000fd8:	00050105 	.word	0x00050105
 8000fdc:	200007f0 	.word	0x200007f0
 8000fe0:	200007e0 	.word	0x200007e0

08000fe4 <uart_init>:
 8000fe4:	b530      	push	{r4, r5, lr}
 8000fe6:	4a21      	ldr	r2, [pc, #132]	; (800106c <uart_init+0x88>)
 8000fe8:	2300      	movs	r3, #0
 8000fea:	8013      	strh	r3, [r2, #0]
 8000fec:	4a20      	ldr	r2, [pc, #128]	; (8001070 <uart_init+0x8c>)
 8000fee:	b089      	sub	sp, #36	; 0x24
 8000ff0:	8013      	strh	r3, [r2, #0]
 8000ff2:	4a20      	ldr	r2, [pc, #128]	; (8001074 <uart_init+0x90>)
 8000ff4:	2400      	movs	r4, #0
 8000ff6:	54d4      	strb	r4, [r2, r3]
 8000ff8:	3301      	adds	r3, #1
 8000ffa:	2b10      	cmp	r3, #16
 8000ffc:	d1f9      	bne.n	8000ff2 <uart_init+0xe>
 8000ffe:	2080      	movs	r0, #128	; 0x80
 8001000:	0280      	lsls	r0, r0, #10
 8001002:	2101      	movs	r1, #1
 8001004:	f001 f9d4 	bl	80023b0 <RCC_AHBPeriphClockCmd>
 8001008:	2080      	movs	r0, #128	; 0x80
 800100a:	01c0      	lsls	r0, r0, #7
 800100c:	2101      	movs	r1, #1
 800100e:	f001 f9ef 	bl	80023f0 <RCC_APB2PeriphClockCmd>
 8001012:	2090      	movs	r0, #144	; 0x90
 8001014:	05c0      	lsls	r0, r0, #23
 8001016:	2102      	movs	r1, #2
 8001018:	2201      	movs	r2, #1
 800101a:	f000 fba1 	bl	8001760 <GPIO_PinAFConfig>
 800101e:	2090      	movs	r0, #144	; 0x90
 8001020:	05c0      	lsls	r0, r0, #23
 8001022:	210f      	movs	r1, #15
 8001024:	2201      	movs	r2, #1
 8001026:	f000 fb9b 	bl	8001760 <GPIO_PinAFConfig>
 800102a:	4b13      	ldr	r3, [pc, #76]	; (8001078 <uart_init+0x94>)
 800102c:	2090      	movs	r0, #144	; 0x90
 800102e:	466a      	mov	r2, sp
 8001030:	2501      	movs	r5, #1
 8001032:	9300      	str	r3, [sp, #0]
 8001034:	4669      	mov	r1, sp
 8001036:	2302      	movs	r3, #2
 8001038:	05c0      	lsls	r0, r0, #23
 800103a:	7113      	strb	r3, [r2, #4]
 800103c:	7155      	strb	r5, [r2, #5]
 800103e:	7194      	strb	r4, [r2, #6]
 8001040:	71d5      	strb	r5, [r2, #7]
 8001042:	f000 fb09 	bl	8001658 <GPIO_Init>
 8001046:	23e1      	movs	r3, #225	; 0xe1
 8001048:	025b      	lsls	r3, r3, #9
 800104a:	9302      	str	r3, [sp, #8]
 800104c:	a902      	add	r1, sp, #8
 800104e:	230c      	movs	r3, #12
 8001050:	480a      	ldr	r0, [pc, #40]	; (800107c <uart_init+0x98>)
 8001052:	9306      	str	r3, [sp, #24]
 8001054:	9403      	str	r4, [sp, #12]
 8001056:	9404      	str	r4, [sp, #16]
 8001058:	9405      	str	r4, [sp, #20]
 800105a:	9407      	str	r4, [sp, #28]
 800105c:	f000 fcdc 	bl	8001a18 <USART_Init>
 8001060:	4806      	ldr	r0, [pc, #24]	; (800107c <uart_init+0x98>)
 8001062:	1c29      	adds	r1, r5, #0
 8001064:	f000 fda6 	bl	8001bb4 <USART_Cmd>
 8001068:	b009      	add	sp, #36	; 0x24
 800106a:	bd30      	pop	{r4, r5, pc}
 800106c:	200007f0 	.word	0x200007f0
 8001070:	200007f2 	.word	0x200007f2
 8001074:	200007e0 	.word	0x200007e0
 8001078:	00008004 	.word	0x00008004
 800107c:	40013800 	.word	0x40013800

08001080 <i2c_delay>:
 8001080:	46c0      	nop			; (mov r8, r8)
 8001082:	4770      	bx	lr

08001084 <SetLowSDA>:
 8001084:	b508      	push	{r3, lr}
 8001086:	b672      	cpsid	i
 8001088:	4b07      	ldr	r3, [pc, #28]	; (80010a8 <SetLowSDA+0x24>)
 800108a:	2210      	movs	r2, #16
 800108c:	851a      	strh	r2, [r3, #40]	; 0x28
 800108e:	685a      	ldr	r2, [r3, #4]
 8001090:	b292      	uxth	r2, r2
 8001092:	809a      	strh	r2, [r3, #4]
 8001094:	6819      	ldr	r1, [r3, #0]
 8001096:	2280      	movs	r2, #128	; 0x80
 8001098:	0052      	lsls	r2, r2, #1
 800109a:	430a      	orrs	r2, r1
 800109c:	601a      	str	r2, [r3, #0]
 800109e:	b662      	cpsie	i
 80010a0:	f7ff ffee 	bl	8001080 <i2c_delay>
 80010a4:	bd08      	pop	{r3, pc}
 80010a6:	46c0      	nop			; (mov r8, r8)
 80010a8:	48000400 	.word	0x48000400

080010ac <SetHighSDA>:
 80010ac:	b508      	push	{r3, lr}
 80010ae:	b672      	cpsid	i
 80010b0:	4b07      	ldr	r3, [pc, #28]	; (80010d0 <SetHighSDA+0x24>)
 80010b2:	2210      	movs	r2, #16
 80010b4:	619a      	str	r2, [r3, #24]
 80010b6:	6859      	ldr	r1, [r3, #4]
 80010b8:	b289      	uxth	r1, r1
 80010ba:	4391      	bics	r1, r2
 80010bc:	8099      	strh	r1, [r3, #4]
 80010be:	6819      	ldr	r1, [r3, #0]
 80010c0:	4a04      	ldr	r2, [pc, #16]	; (80010d4 <SetHighSDA+0x28>)
 80010c2:	400a      	ands	r2, r1
 80010c4:	601a      	str	r2, [r3, #0]
 80010c6:	b662      	cpsie	i
 80010c8:	f7ff ffda 	bl	8001080 <i2c_delay>
 80010cc:	bd08      	pop	{r3, pc}
 80010ce:	46c0      	nop			; (mov r8, r8)
 80010d0:	48000400 	.word	0x48000400
 80010d4:	fffffcff 	.word	0xfffffcff

080010d8 <SetLowSCL>:
 80010d8:	b508      	push	{r3, lr}
 80010da:	4b03      	ldr	r3, [pc, #12]	; (80010e8 <SetLowSCL+0x10>)
 80010dc:	2220      	movs	r2, #32
 80010de:	851a      	strh	r2, [r3, #40]	; 0x28
 80010e0:	f7ff ffce 	bl	8001080 <i2c_delay>
 80010e4:	bd08      	pop	{r3, pc}
 80010e6:	46c0      	nop			; (mov r8, r8)
 80010e8:	48000400 	.word	0x48000400

080010ec <SetHighSCL>:
 80010ec:	b508      	push	{r3, lr}
 80010ee:	4b03      	ldr	r3, [pc, #12]	; (80010fc <SetHighSCL+0x10>)
 80010f0:	2220      	movs	r2, #32
 80010f2:	619a      	str	r2, [r3, #24]
 80010f4:	f7ff ffc4 	bl	8001080 <i2c_delay>
 80010f8:	bd08      	pop	{r3, pc}
 80010fa:	46c0      	nop			; (mov r8, r8)
 80010fc:	48000400 	.word	0x48000400

08001100 <i2c_0_init>:
 8001100:	b507      	push	{r0, r1, r2, lr}
 8001102:	2330      	movs	r3, #48	; 0x30
 8001104:	4669      	mov	r1, sp
 8001106:	9300      	str	r3, [sp, #0]
 8001108:	2301      	movs	r3, #1
 800110a:	710b      	strb	r3, [r1, #4]
 800110c:	2203      	movs	r2, #3
 800110e:	2300      	movs	r3, #0
 8001110:	4806      	ldr	r0, [pc, #24]	; (800112c <i2c_0_init+0x2c>)
 8001112:	718b      	strb	r3, [r1, #6]
 8001114:	714a      	strb	r2, [r1, #5]
 8001116:	71cb      	strb	r3, [r1, #7]
 8001118:	f000 fa9e 	bl	8001658 <GPIO_Init>
 800111c:	f7ff ffe6 	bl	80010ec <SetHighSCL>
 8001120:	f7ff ffb0 	bl	8001084 <SetLowSDA>
 8001124:	f7ff ffc2 	bl	80010ac <SetHighSDA>
 8001128:	bd07      	pop	{r0, r1, r2, pc}
 800112a:	46c0      	nop			; (mov r8, r8)
 800112c:	48000400 	.word	0x48000400

08001130 <i2cStart>:
 8001130:	b508      	push	{r3, lr}
 8001132:	f7ff ffdb 	bl	80010ec <SetHighSCL>
 8001136:	f7ff ffb9 	bl	80010ac <SetHighSDA>
 800113a:	f7ff ffd7 	bl	80010ec <SetHighSCL>
 800113e:	f7ff ffa1 	bl	8001084 <SetLowSDA>
 8001142:	f7ff ffc9 	bl	80010d8 <SetLowSCL>
 8001146:	f7ff ffb1 	bl	80010ac <SetHighSDA>
 800114a:	bd08      	pop	{r3, pc}

0800114c <i2cStop>:
 800114c:	b508      	push	{r3, lr}
 800114e:	f7ff ffc3 	bl	80010d8 <SetLowSCL>
 8001152:	f7ff ff97 	bl	8001084 <SetLowSDA>
 8001156:	f7ff ffc9 	bl	80010ec <SetHighSCL>
 800115a:	f7ff ff93 	bl	8001084 <SetLowSDA>
 800115e:	f7ff ffc5 	bl	80010ec <SetHighSCL>
 8001162:	f7ff ffa3 	bl	80010ac <SetHighSDA>
 8001166:	bd08      	pop	{r3, pc}

08001168 <i2cWrite>:
 8001168:	b538      	push	{r3, r4, r5, lr}
 800116a:	1c05      	adds	r5, r0, #0
 800116c:	2408      	movs	r4, #8
 800116e:	f7ff ffb3 	bl	80010d8 <SetLowSCL>
 8001172:	b26b      	sxtb	r3, r5
 8001174:	2b00      	cmp	r3, #0
 8001176:	da02      	bge.n	800117e <i2cWrite+0x16>
 8001178:	f7ff ff98 	bl	80010ac <SetHighSDA>
 800117c:	e001      	b.n	8001182 <i2cWrite+0x1a>
 800117e:	f7ff ff81 	bl	8001084 <SetLowSDA>
 8001182:	3c01      	subs	r4, #1
 8001184:	006d      	lsls	r5, r5, #1
 8001186:	b2e4      	uxtb	r4, r4
 8001188:	f7ff ffb0 	bl	80010ec <SetHighSCL>
 800118c:	b2ed      	uxtb	r5, r5
 800118e:	2c00      	cmp	r4, #0
 8001190:	d1ed      	bne.n	800116e <i2cWrite+0x6>
 8001192:	f7ff ffa1 	bl	80010d8 <SetLowSCL>
 8001196:	f7ff ff89 	bl	80010ac <SetHighSDA>
 800119a:	f7ff ffa7 	bl	80010ec <SetHighSCL>
 800119e:	4b05      	ldr	r3, [pc, #20]	; (80011b4 <i2cWrite+0x4c>)
 80011a0:	691c      	ldr	r4, [r3, #16]
 80011a2:	f7ff ff99 	bl	80010d8 <SetLowSCL>
 80011a6:	b2a4      	uxth	r4, r4
 80011a8:	f7ff ff6a 	bl	8001080 <i2c_delay>
 80011ac:	0924      	lsrs	r4, r4, #4
 80011ae:	2001      	movs	r0, #1
 80011b0:	43a0      	bics	r0, r4
 80011b2:	bd38      	pop	{r3, r4, r5, pc}
 80011b4:	48000400 	.word	0x48000400

080011b8 <i2cRead>:
 80011b8:	b570      	push	{r4, r5, r6, lr}
 80011ba:	1c06      	adds	r6, r0, #0
 80011bc:	f7ff ff8c 	bl	80010d8 <SetLowSCL>
 80011c0:	f7ff ff74 	bl	80010ac <SetHighSDA>
 80011c4:	2508      	movs	r5, #8
 80011c6:	2400      	movs	r4, #0
 80011c8:	f7ff ff90 	bl	80010ec <SetHighSCL>
 80011cc:	4b0c      	ldr	r3, [pc, #48]	; (8001200 <i2cRead+0x48>)
 80011ce:	0064      	lsls	r4, r4, #1
 80011d0:	691b      	ldr	r3, [r3, #16]
 80011d2:	b2e4      	uxtb	r4, r4
 80011d4:	06da      	lsls	r2, r3, #27
 80011d6:	d501      	bpl.n	80011dc <i2cRead+0x24>
 80011d8:	3401      	adds	r4, #1
 80011da:	b2e4      	uxtb	r4, r4
 80011dc:	3d01      	subs	r5, #1
 80011de:	b2ed      	uxtb	r5, r5
 80011e0:	f7ff ff7a 	bl	80010d8 <SetLowSCL>
 80011e4:	2d00      	cmp	r5, #0
 80011e6:	d1ef      	bne.n	80011c8 <i2cRead+0x10>
 80011e8:	2e00      	cmp	r6, #0
 80011ea:	d001      	beq.n	80011f0 <i2cRead+0x38>
 80011ec:	f7ff ff4a 	bl	8001084 <SetLowSDA>
 80011f0:	f7ff ff7c 	bl	80010ec <SetHighSCL>
 80011f4:	f7ff ff70 	bl	80010d8 <SetLowSCL>
 80011f8:	f7ff ff42 	bl	8001080 <i2c_delay>
 80011fc:	1c20      	adds	r0, r4, #0
 80011fe:	bd70      	pop	{r4, r5, r6, pc}
 8001200:	48000400 	.word	0x48000400

08001204 <i2c_write_reg>:
 8001204:	b570      	push	{r4, r5, r6, lr}
 8001206:	1c06      	adds	r6, r0, #0
 8001208:	1c0d      	adds	r5, r1, #0
 800120a:	1c14      	adds	r4, r2, #0
 800120c:	f7ff ff90 	bl	8001130 <i2cStart>
 8001210:	1c30      	adds	r0, r6, #0
 8001212:	f7ff ffa9 	bl	8001168 <i2cWrite>
 8001216:	1c28      	adds	r0, r5, #0
 8001218:	f7ff ffa6 	bl	8001168 <i2cWrite>
 800121c:	1c20      	adds	r0, r4, #0
 800121e:	f7ff ffa3 	bl	8001168 <i2cWrite>
 8001222:	f7ff ff93 	bl	800114c <i2cStop>
 8001226:	bd70      	pop	{r4, r5, r6, pc}

08001228 <i2c_read_reg>:
 8001228:	b538      	push	{r3, r4, r5, lr}
 800122a:	1c04      	adds	r4, r0, #0
 800122c:	1c0d      	adds	r5, r1, #0
 800122e:	f7ff ff7f 	bl	8001130 <i2cStart>
 8001232:	1c20      	adds	r0, r4, #0
 8001234:	f7ff ff98 	bl	8001168 <i2cWrite>
 8001238:	1c28      	adds	r0, r5, #0
 800123a:	f7ff ff95 	bl	8001168 <i2cWrite>
 800123e:	f7ff ff77 	bl	8001130 <i2cStart>
 8001242:	2001      	movs	r0, #1
 8001244:	4320      	orrs	r0, r4
 8001246:	f7ff ff8f 	bl	8001168 <i2cWrite>
 800124a:	2000      	movs	r0, #0
 800124c:	f7ff ffb4 	bl	80011b8 <i2cRead>
 8001250:	1c04      	adds	r4, r0, #0
 8001252:	f7ff ff7b 	bl	800114c <i2cStop>
 8001256:	1c20      	adds	r0, r4, #0
 8001258:	bd38      	pop	{r3, r4, r5, pc}
	...

0800125c <adc_random_init>:
 800125c:	b570      	push	{r4, r5, r6, lr}
 800125e:	2001      	movs	r0, #1
 8001260:	f000 feae 	bl	8001fc0 <ADC_TempSensorCmd>
 8001264:	2180      	movs	r1, #128	; 0x80
 8001266:	4813      	ldr	r0, [pc, #76]	; (80012b4 <adc_random_init+0x58>)
 8001268:	0249      	lsls	r1, r1, #9
 800126a:	2200      	movs	r2, #0
 800126c:	f000 fec0 	bl	8001ff0 <ADC_ChannelConfig>
 8001270:	2420      	movs	r4, #32
 8001272:	2500      	movs	r5, #0
 8001274:	480f      	ldr	r0, [pc, #60]	; (80012b4 <adc_random_init+0x58>)
 8001276:	f000 fefb 	bl	8002070 <ADC_StartOfConversion>
 800127a:	480e      	ldr	r0, [pc, #56]	; (80012b4 <adc_random_init+0x58>)
 800127c:	2104      	movs	r1, #4
 800127e:	f000 ff15 	bl	80020ac <ADC_GetFlagStatus>
 8001282:	2800      	cmp	r0, #0
 8001284:	d101      	bne.n	800128a <adc_random_init+0x2e>
 8001286:	46c0      	nop			; (mov r8, r8)
 8001288:	e7f7      	b.n	800127a <adc_random_init+0x1e>
 800128a:	480a      	ldr	r0, [pc, #40]	; (80012b4 <adc_random_init+0x58>)
 800128c:	f000 ff00 	bl	8002090 <ADC_GetConversionValue>
 8001290:	006e      	lsls	r6, r5, #1
 8001292:	2301      	movs	r3, #1
 8001294:	1c05      	adds	r5, r0, #0
 8001296:	401d      	ands	r5, r3
 8001298:	4806      	ldr	r0, [pc, #24]	; (80012b4 <adc_random_init+0x58>)
 800129a:	2104      	movs	r1, #4
 800129c:	3c01      	subs	r4, #1
 800129e:	4335      	orrs	r5, r6
 80012a0:	f000 ff34 	bl	800210c <ADC_ClearFlag>
 80012a4:	2c00      	cmp	r4, #0
 80012a6:	d1e5      	bne.n	8001274 <adc_random_init+0x18>
 80012a8:	1c20      	adds	r0, r4, #0
 80012aa:	f000 fe89 	bl	8001fc0 <ADC_TempSensorCmd>
 80012ae:	1c28      	adds	r0, r5, #0
 80012b0:	bd70      	pop	{r4, r5, r6, pc}
 80012b2:	46c0      	nop			; (mov r8, r8)
 80012b4:	40012400 	.word	0x40012400

080012b8 <adc_init>:
 80012b8:	b530      	push	{r4, r5, lr}
 80012ba:	2090      	movs	r0, #144	; 0x90
 80012bc:	b089      	sub	sp, #36	; 0x24
 80012be:	466a      	mov	r2, sp
 80012c0:	2303      	movs	r3, #3
 80012c2:	2401      	movs	r4, #1
 80012c4:	2500      	movs	r5, #0
 80012c6:	05c0      	lsls	r0, r0, #23
 80012c8:	4669      	mov	r1, sp
 80012ca:	7113      	strb	r3, [r2, #4]
 80012cc:	71d5      	strb	r5, [r2, #7]
 80012ce:	9400      	str	r4, [sp, #0]
 80012d0:	f000 f9c2 	bl	8001658 <GPIO_Init>
 80012d4:	2080      	movs	r0, #128	; 0x80
 80012d6:	0080      	lsls	r0, r0, #2
 80012d8:	1c21      	adds	r1, r4, #0
 80012da:	f001 f889 	bl	80023f0 <RCC_APB2PeriphClockCmd>
 80012de:	1c28      	adds	r0, r5, #0
 80012e0:	f000 ff7a 	bl	80021d8 <RCC_ADCCLKConfig>
 80012e4:	1c20      	adds	r0, r4, #0
 80012e6:	f000 ff63 	bl	80021b0 <RCC_HSI14Cmd>
 80012ea:	2061      	movs	r0, #97	; 0x61
 80012ec:	f001 f8e0 	bl	80024b0 <RCC_GetFlagStatus>
 80012f0:	2800      	cmp	r0, #0
 80012f2:	d101      	bne.n	80012f8 <adc_init+0x40>
 80012f4:	46c0      	nop			; (mov r8, r8)
 80012f6:	e7f8      	b.n	80012ea <adc_init+0x32>
 80012f8:	4811      	ldr	r0, [pc, #68]	; (8001340 <adc_init+0x88>)
 80012fa:	f000 fddb 	bl	8001eb4 <ADC_DeInit>
 80012fe:	a902      	add	r1, sp, #8
 8001300:	2300      	movs	r3, #0
 8001302:	480f      	ldr	r0, [pc, #60]	; (8001340 <adc_init+0x88>)
 8001304:	710b      	strb	r3, [r1, #4]
 8001306:	610b      	str	r3, [r1, #16]
 8001308:	614b      	str	r3, [r1, #20]
 800130a:	608b      	str	r3, [r1, #8]
 800130c:	60cb      	str	r3, [r1, #12]
 800130e:	9302      	str	r3, [sp, #8]
 8001310:	f000 fde8 	bl	8001ee4 <ADC_Init>
 8001314:	480a      	ldr	r0, [pc, #40]	; (8001340 <adc_init+0x88>)
 8001316:	f000 fe8b 	bl	8002030 <ADC_GetCalibrationFactor>
 800131a:	4809      	ldr	r0, [pc, #36]	; (8001340 <adc_init+0x88>)
 800131c:	2101      	movs	r1, #1
 800131e:	f000 fe33 	bl	8001f88 <ADC_Cmd>
 8001322:	4807      	ldr	r0, [pc, #28]	; (8001340 <adc_init+0x88>)
 8001324:	2101      	movs	r1, #1
 8001326:	f000 fec1 	bl	80020ac <ADC_GetFlagStatus>
 800132a:	2800      	cmp	r0, #0
 800132c:	d101      	bne.n	8001332 <adc_init+0x7a>
 800132e:	46c0      	nop			; (mov r8, r8)
 8001330:	e7f7      	b.n	8001322 <adc_init+0x6a>
 8001332:	f7ff ff93 	bl	800125c <adc_random_init>
 8001336:	4b03      	ldr	r3, [pc, #12]	; (8001344 <adc_init+0x8c>)
 8001338:	6018      	str	r0, [r3, #0]
 800133a:	b009      	add	sp, #36	; 0x24
 800133c:	bd30      	pop	{r4, r5, pc}
 800133e:	46c0      	nop			; (mov r8, r8)
 8001340:	40012400 	.word	0x40012400
 8001344:	20000010 	.word	0x20000010

08001348 <assert_param>:
 8001348:	4770      	bx	lr
	...

0800134c <sys_tick_init>:
 800134c:	4b03      	ldr	r3, [pc, #12]	; (800135c <sys_tick_init+0x10>)
 800134e:	4a04      	ldr	r2, [pc, #16]	; (8001360 <sys_tick_init+0x14>)
 8001350:	605a      	str	r2, [r3, #4]
 8001352:	2200      	movs	r2, #0
 8001354:	609a      	str	r2, [r3, #8]
 8001356:	2207      	movs	r2, #7
 8001358:	601a      	str	r2, [r3, #0]
 800135a:	4770      	bx	lr
 800135c:	e000e010 	.word	0xe000e010
 8001360:	0000bb80 	.word	0x0000bb80

08001364 <sleep>:
 8001364:	bf30      	wfi
 8001366:	4770      	bx	lr

08001368 <SystemInit>:
 8001368:	4b26      	ldr	r3, [pc, #152]	; (8001404 <SystemInit+0x9c>)
 800136a:	2201      	movs	r2, #1
 800136c:	6819      	ldr	r1, [r3, #0]
 800136e:	b082      	sub	sp, #8
 8001370:	4311      	orrs	r1, r2
 8001372:	6019      	str	r1, [r3, #0]
 8001374:	6858      	ldr	r0, [r3, #4]
 8001376:	4924      	ldr	r1, [pc, #144]	; (8001408 <SystemInit+0xa0>)
 8001378:	4001      	ands	r1, r0
 800137a:	6059      	str	r1, [r3, #4]
 800137c:	6818      	ldr	r0, [r3, #0]
 800137e:	4923      	ldr	r1, [pc, #140]	; (800140c <SystemInit+0xa4>)
 8001380:	4001      	ands	r1, r0
 8001382:	6019      	str	r1, [r3, #0]
 8001384:	6818      	ldr	r0, [r3, #0]
 8001386:	4922      	ldr	r1, [pc, #136]	; (8001410 <SystemInit+0xa8>)
 8001388:	4001      	ands	r1, r0
 800138a:	6019      	str	r1, [r3, #0]
 800138c:	6858      	ldr	r0, [r3, #4]
 800138e:	4921      	ldr	r1, [pc, #132]	; (8001414 <SystemInit+0xac>)
 8001390:	4001      	ands	r1, r0
 8001392:	6059      	str	r1, [r3, #4]
 8001394:	6ad9      	ldr	r1, [r3, #44]	; 0x2c
 8001396:	200f      	movs	r0, #15
 8001398:	4381      	bics	r1, r0
 800139a:	62d9      	str	r1, [r3, #44]	; 0x2c
 800139c:	6b18      	ldr	r0, [r3, #48]	; 0x30
 800139e:	491e      	ldr	r1, [pc, #120]	; (8001418 <SystemInit+0xb0>)
 80013a0:	4001      	ands	r1, r0
 80013a2:	6319      	str	r1, [r3, #48]	; 0x30
 80013a4:	6b59      	ldr	r1, [r3, #52]	; 0x34
 80013a6:	4391      	bics	r1, r2
 80013a8:	2200      	movs	r2, #0
 80013aa:	6359      	str	r1, [r3, #52]	; 0x34
 80013ac:	609a      	str	r2, [r3, #8]
 80013ae:	9200      	str	r2, [sp, #0]
 80013b0:	9201      	str	r2, [sp, #4]
 80013b2:	4a1a      	ldr	r2, [pc, #104]	; (800141c <SystemInit+0xb4>)
 80013b4:	2111      	movs	r1, #17
 80013b6:	6011      	str	r1, [r2, #0]
 80013b8:	685a      	ldr	r2, [r3, #4]
 80013ba:	605a      	str	r2, [r3, #4]
 80013bc:	685a      	ldr	r2, [r3, #4]
 80013be:	605a      	str	r2, [r3, #4]
 80013c0:	6859      	ldr	r1, [r3, #4]
 80013c2:	4a17      	ldr	r2, [pc, #92]	; (8001420 <SystemInit+0xb8>)
 80013c4:	400a      	ands	r2, r1
 80013c6:	605a      	str	r2, [r3, #4]
 80013c8:	6859      	ldr	r1, [r3, #4]
 80013ca:	22a0      	movs	r2, #160	; 0xa0
 80013cc:	0392      	lsls	r2, r2, #14
 80013ce:	430a      	orrs	r2, r1
 80013d0:	605a      	str	r2, [r3, #4]
 80013d2:	6819      	ldr	r1, [r3, #0]
 80013d4:	2280      	movs	r2, #128	; 0x80
 80013d6:	0452      	lsls	r2, r2, #17
 80013d8:	430a      	orrs	r2, r1
 80013da:	601a      	str	r2, [r3, #0]
 80013dc:	6819      	ldr	r1, [r3, #0]
 80013de:	4a09      	ldr	r2, [pc, #36]	; (8001404 <SystemInit+0x9c>)
 80013e0:	0188      	lsls	r0, r1, #6
 80013e2:	d5fb      	bpl.n	80013dc <SystemInit+0x74>
 80013e4:	6851      	ldr	r1, [r2, #4]
 80013e6:	2003      	movs	r0, #3
 80013e8:	4381      	bics	r1, r0
 80013ea:	6051      	str	r1, [r2, #4]
 80013ec:	6851      	ldr	r1, [r2, #4]
 80013ee:	2002      	movs	r0, #2
 80013f0:	4301      	orrs	r1, r0
 80013f2:	6051      	str	r1, [r2, #4]
 80013f4:	6859      	ldr	r1, [r3, #4]
 80013f6:	220c      	movs	r2, #12
 80013f8:	400a      	ands	r2, r1
 80013fa:	2a08      	cmp	r2, #8
 80013fc:	d1fa      	bne.n	80013f4 <SystemInit+0x8c>
 80013fe:	b002      	add	sp, #8
 8001400:	4770      	bx	lr
 8001402:	46c0      	nop			; (mov r8, r8)
 8001404:	40021000 	.word	0x40021000
 8001408:	f8ffb80c 	.word	0xf8ffb80c
 800140c:	fef6ffff 	.word	0xfef6ffff
 8001410:	fffbffff 	.word	0xfffbffff
 8001414:	ffc0ffff 	.word	0xffc0ffff
 8001418:	fffffeac 	.word	0xfffffeac
 800141c:	40022000 	.word	0x40022000
 8001420:	ffc07fff 	.word	0xffc07fff

08001424 <TIM16_IRQHandler>:
 8001424:	4b20      	ldr	r3, [pc, #128]	; (80014a8 <TIM16_IRQHandler+0x84>)
 8001426:	799a      	ldrb	r2, [r3, #6]
 8001428:	78d9      	ldrb	r1, [r3, #3]
 800142a:	4291      	cmp	r1, r2
 800142c:	d805      	bhi.n	800143a <TIM16_IRQHandler+0x16>
 800142e:	2080      	movs	r0, #128	; 0x80
 8001430:	2190      	movs	r1, #144	; 0x90
 8001432:	0040      	lsls	r0, r0, #1
 8001434:	05c9      	lsls	r1, r1, #23
 8001436:	8508      	strh	r0, [r1, #40]	; 0x28
 8001438:	e006      	b.n	8001448 <TIM16_IRQHandler+0x24>
 800143a:	2a00      	cmp	r2, #0
 800143c:	d104      	bne.n	8001448 <TIM16_IRQHandler+0x24>
 800143e:	2080      	movs	r0, #128	; 0x80
 8001440:	2190      	movs	r1, #144	; 0x90
 8001442:	0040      	lsls	r0, r0, #1
 8001444:	05c9      	lsls	r1, r1, #23
 8001446:	6188      	str	r0, [r1, #24]
 8001448:	7919      	ldrb	r1, [r3, #4]
 800144a:	4291      	cmp	r1, r2
 800144c:	d805      	bhi.n	800145a <TIM16_IRQHandler+0x36>
 800144e:	2080      	movs	r0, #128	; 0x80
 8001450:	2190      	movs	r1, #144	; 0x90
 8001452:	0100      	lsls	r0, r0, #4
 8001454:	05c9      	lsls	r1, r1, #23
 8001456:	8508      	strh	r0, [r1, #40]	; 0x28
 8001458:	e006      	b.n	8001468 <TIM16_IRQHandler+0x44>
 800145a:	2a00      	cmp	r2, #0
 800145c:	d104      	bne.n	8001468 <TIM16_IRQHandler+0x44>
 800145e:	2080      	movs	r0, #128	; 0x80
 8001460:	2190      	movs	r1, #144	; 0x90
 8001462:	0100      	lsls	r0, r0, #4
 8001464:	05c9      	lsls	r1, r1, #23
 8001466:	6188      	str	r0, [r1, #24]
 8001468:	7959      	ldrb	r1, [r3, #5]
 800146a:	4291      	cmp	r1, r2
 800146c:	d806      	bhi.n	800147c <TIM16_IRQHandler+0x58>
 800146e:	2190      	movs	r1, #144	; 0x90
 8001470:	2002      	movs	r0, #2
 8001472:	05c9      	lsls	r1, r1, #23
 8001474:	8508      	strh	r0, [r1, #40]	; 0x28
 8001476:	2a00      	cmp	r2, #0
 8001478:	d006      	beq.n	8001488 <TIM16_IRQHandler+0x64>
 800147a:	e00b      	b.n	8001494 <TIM16_IRQHandler+0x70>
 800147c:	2a00      	cmp	r2, #0
 800147e:	d109      	bne.n	8001494 <TIM16_IRQHandler+0x70>
 8001480:	2190      	movs	r1, #144	; 0x90
 8001482:	2002      	movs	r0, #2
 8001484:	05c9      	lsls	r1, r1, #23
 8001486:	6188      	str	r0, [r1, #24]
 8001488:	7819      	ldrb	r1, [r3, #0]
 800148a:	70d9      	strb	r1, [r3, #3]
 800148c:	7859      	ldrb	r1, [r3, #1]
 800148e:	7119      	strb	r1, [r3, #4]
 8001490:	7899      	ldrb	r1, [r3, #2]
 8001492:	7159      	strb	r1, [r3, #5]
 8001494:	3201      	adds	r2, #1
 8001496:	b2d2      	uxtb	r2, r2
 8001498:	2a10      	cmp	r2, #16
 800149a:	d900      	bls.n	800149e <TIM16_IRQHandler+0x7a>
 800149c:	2200      	movs	r2, #0
 800149e:	719a      	strb	r2, [r3, #6]
 80014a0:	4b02      	ldr	r3, [pc, #8]	; (80014ac <TIM16_IRQHandler+0x88>)
 80014a2:	2200      	movs	r2, #0
 80014a4:	821a      	strh	r2, [r3, #16]
 80014a6:	4770      	bx	lr
 80014a8:	20000074 	.word	0x20000074
 80014ac:	40014400 	.word	0x40014400

080014b0 <lib_low_level_init>:
 80014b0:	b508      	push	{r3, lr}
 80014b2:	f7ff ff59 	bl	8001368 <SystemInit>
 80014b6:	f001 f831 	bl	800251c <gpio_init>
 80014ba:	f7ff fd93 	bl	8000fe4 <uart_init>
 80014be:	f7ff fcb3 	bl	8000e28 <timer_init>
 80014c2:	f7ff fe1d 	bl	8001100 <i2c_0_init>
 80014c6:	f7ff fef7 	bl	80012b8 <adc_init>
 80014ca:	bd08      	pop	{r3, pc}

080014cc <TIM14_IRQHandler>:
 80014cc:	b530      	push	{r4, r5, lr}
 80014ce:	4b53      	ldr	r3, [pc, #332]	; (800161c <TIM14_IRQHandler+0x150>)
 80014d0:	7818      	ldrb	r0, [r3, #0]
 80014d2:	b2c0      	uxtb	r0, r0
 80014d4:	2803      	cmp	r0, #3
 80014d6:	d83f      	bhi.n	8001558 <TIM14_IRQHandler+0x8c>
 80014d8:	f001 f8c2 	bl	8002660 <__gnu_thumb1_case_uqi>
 80014dc:	32220a02 	.word	0x32220a02
 80014e0:	2280      	movs	r2, #128	; 0x80
 80014e2:	2390      	movs	r3, #144	; 0x90
 80014e4:	0052      	lsls	r2, r2, #1
 80014e6:	05db      	lsls	r3, r3, #23
 80014e8:	851a      	strh	r2, [r3, #40]	; 0x28
 80014ea:	2200      	movs	r2, #0
 80014ec:	4b4c      	ldr	r3, [pc, #304]	; (8001620 <TIM14_IRQHandler+0x154>)
 80014ee:	e032      	b.n	8001556 <TIM14_IRQHandler+0x8a>
 80014f0:	4a4b      	ldr	r2, [pc, #300]	; (8001620 <TIM14_IRQHandler+0x154>)
 80014f2:	7811      	ldrb	r1, [r2, #0]
 80014f4:	290d      	cmp	r1, #13
 80014f6:	d901      	bls.n	80014fc <TIM14_IRQHandler+0x30>
 80014f8:	2200      	movs	r2, #0
 80014fa:	e02c      	b.n	8001556 <TIM14_IRQHandler+0x8a>
 80014fc:	7811      	ldrb	r1, [r2, #0]
 80014fe:	4849      	ldr	r0, [pc, #292]	; (8001624 <TIM14_IRQHandler+0x158>)
 8001500:	5c41      	ldrb	r1, [r0, r1]
 8001502:	20ff      	movs	r0, #255	; 0xff
 8001504:	4388      	bics	r0, r1
 8001506:	0040      	lsls	r0, r0, #1
 8001508:	2101      	movs	r1, #1
 800150a:	4308      	orrs	r0, r1
 800150c:	4946      	ldr	r1, [pc, #280]	; (8001628 <TIM14_IRQHandler+0x15c>)
 800150e:	8008      	strh	r0, [r1, #0]
 8001510:	7811      	ldrb	r1, [r2, #0]
 8001512:	3101      	adds	r1, #1
 8001514:	b2c9      	uxtb	r1, r1
 8001516:	7011      	strb	r1, [r2, #0]
 8001518:	4a44      	ldr	r2, [pc, #272]	; (800162c <TIM14_IRQHandler+0x160>)
 800151a:	2100      	movs	r1, #0
 800151c:	7011      	strb	r1, [r2, #0]
 800151e:	e019      	b.n	8001554 <TIM14_IRQHandler+0x88>
 8001520:	4a41      	ldr	r2, [pc, #260]	; (8001628 <TIM14_IRQHandler+0x15c>)
 8001522:	2190      	movs	r1, #144	; 0x90
 8001524:	8814      	ldrh	r4, [r2, #0]
 8001526:	2080      	movs	r0, #128	; 0x80
 8001528:	05c9      	lsls	r1, r1, #23
 800152a:	0040      	lsls	r0, r0, #1
 800152c:	07e5      	lsls	r5, r4, #31
 800152e:	d501      	bpl.n	8001534 <TIM14_IRQHandler+0x68>
 8001530:	6188      	str	r0, [r1, #24]
 8001532:	e000      	b.n	8001536 <TIM14_IRQHandler+0x6a>
 8001534:	8508      	strh	r0, [r1, #40]	; 0x28
 8001536:	8811      	ldrh	r1, [r2, #0]
 8001538:	0849      	lsrs	r1, r1, #1
 800153a:	8011      	strh	r1, [r2, #0]
 800153c:	2203      	movs	r2, #3
 800153e:	e00a      	b.n	8001556 <TIM14_IRQHandler+0x8a>
 8001540:	4a3a      	ldr	r2, [pc, #232]	; (800162c <TIM14_IRQHandler+0x160>)
 8001542:	7811      	ldrb	r1, [r2, #0]
 8001544:	3101      	adds	r1, #1
 8001546:	b2c9      	uxtb	r1, r1
 8001548:	7011      	strb	r1, [r2, #0]
 800154a:	7812      	ldrb	r2, [r2, #0]
 800154c:	2a09      	cmp	r2, #9
 800154e:	d901      	bls.n	8001554 <TIM14_IRQHandler+0x88>
 8001550:	2201      	movs	r2, #1
 8001552:	e000      	b.n	8001556 <TIM14_IRQHandler+0x8a>
 8001554:	2202      	movs	r2, #2
 8001556:	701a      	strb	r2, [r3, #0]
 8001558:	4b35      	ldr	r3, [pc, #212]	; (8001630 <TIM14_IRQHandler+0x164>)
 800155a:	2204      	movs	r2, #4
 800155c:	6c1c      	ldr	r4, [r3, #64]	; 0x40
 800155e:	601a      	str	r2, [r3, #0]
 8001560:	6899      	ldr	r1, [r3, #8]
 8001562:	4834      	ldr	r0, [pc, #208]	; (8001634 <TIM14_IRQHandler+0x168>)
 8001564:	4311      	orrs	r1, r2
 8001566:	6099      	str	r1, [r3, #8]
 8001568:	6803      	ldr	r3, [r0, #0]
 800156a:	4933      	ldr	r1, [pc, #204]	; (8001638 <TIM14_IRQHandler+0x16c>)
 800156c:	42a1      	cmp	r1, r4
 800156e:	4189      	sbcs	r1, r1
 8001570:	191c      	adds	r4, r3, r4
 8001572:	09db      	lsrs	r3, r3, #7
 8001574:	1ae3      	subs	r3, r4, r3
 8001576:	6003      	str	r3, [r0, #0]
 8001578:	4b30      	ldr	r3, [pc, #192]	; (800163c <TIM14_IRQHandler+0x170>)
 800157a:	4249      	negs	r1, r1
 800157c:	7818      	ldrb	r0, [r3, #0]
 800157e:	b2c0      	uxtb	r0, r0
 8001580:	4290      	cmp	r0, r2
 8001582:	d846      	bhi.n	8001612 <TIM14_IRQHandler+0x146>
 8001584:	f001 f86c 	bl	8002660 <__gnu_thumb1_case_uqi>
 8001588:	44110603 	.word	0x44110603
 800158c:	24          	.byte	0x24
 800158d:	00          	.byte	0x00
 800158e:	2200      	movs	r2, #0
 8001590:	4b2b      	ldr	r3, [pc, #172]	; (8001640 <TIM14_IRQHandler+0x174>)
 8001592:	e03d      	b.n	8001610 <TIM14_IRQHandler+0x144>
 8001594:	4a2a      	ldr	r2, [pc, #168]	; (8001640 <TIM14_IRQHandler+0x174>)
 8001596:	7811      	ldrb	r1, [r2, #0]
 8001598:	2200      	movs	r2, #0
 800159a:	290d      	cmp	r1, #13
 800159c:	d838      	bhi.n	8001610 <TIM14_IRQHandler+0x144>
 800159e:	4929      	ldr	r1, [pc, #164]	; (8001644 <TIM14_IRQHandler+0x178>)
 80015a0:	800a      	strh	r2, [r1, #0]
 80015a2:	4929      	ldr	r1, [pc, #164]	; (8001648 <TIM14_IRQHandler+0x17c>)
 80015a4:	700a      	strb	r2, [r1, #0]
 80015a6:	2202      	movs	r2, #2
 80015a8:	e032      	b.n	8001610 <TIM14_IRQHandler+0x144>
 80015aa:	4a28      	ldr	r2, [pc, #160]	; (800164c <TIM14_IRQHandler+0x180>)
 80015ac:	2900      	cmp	r1, #0
 80015ae:	d103      	bne.n	80015b8 <TIM14_IRQHandler+0xec>
 80015b0:	2003      	movs	r0, #3
 80015b2:	7018      	strb	r0, [r3, #0]
 80015b4:	6011      	str	r1, [r2, #0]
 80015b6:	e02c      	b.n	8001612 <TIM14_IRQHandler+0x146>
 80015b8:	6811      	ldr	r1, [r2, #0]
 80015ba:	3101      	adds	r1, #1
 80015bc:	6011      	str	r1, [r2, #0]
 80015be:	6810      	ldr	r0, [r2, #0]
 80015c0:	21d2      	movs	r1, #210	; 0xd2
 80015c2:	0049      	lsls	r1, r1, #1
 80015c4:	4288      	cmp	r0, r1
 80015c6:	d924      	bls.n	8001612 <TIM14_IRQHandler+0x146>
 80015c8:	2100      	movs	r1, #0
 80015ca:	6011      	str	r1, [r2, #0]
 80015cc:	4a1c      	ldr	r2, [pc, #112]	; (8001640 <TIM14_IRQHandler+0x174>)
 80015ce:	e01b      	b.n	8001608 <TIM14_IRQHandler+0x13c>
 80015d0:	4a1d      	ldr	r2, [pc, #116]	; (8001648 <TIM14_IRQHandler+0x17c>)
 80015d2:	2900      	cmp	r1, #0
 80015d4:	d008      	beq.n	80015e8 <TIM14_IRQHandler+0x11c>
 80015d6:	491b      	ldr	r1, [pc, #108]	; (8001644 <TIM14_IRQHandler+0x178>)
 80015d8:	2501      	movs	r5, #1
 80015da:	880c      	ldrh	r4, [r1, #0]
 80015dc:	7810      	ldrb	r0, [r2, #0]
 80015de:	4085      	lsls	r5, r0
 80015e0:	1c28      	adds	r0, r5, #0
 80015e2:	4320      	orrs	r0, r4
 80015e4:	b280      	uxth	r0, r0
 80015e6:	8008      	strh	r0, [r1, #0]
 80015e8:	7811      	ldrb	r1, [r2, #0]
 80015ea:	3101      	adds	r1, #1
 80015ec:	b2c9      	uxtb	r1, r1
 80015ee:	7011      	strb	r1, [r2, #0]
 80015f0:	7812      	ldrb	r2, [r2, #0]
 80015f2:	2a07      	cmp	r2, #7
 80015f4:	d90b      	bls.n	800160e <TIM14_IRQHandler+0x142>
 80015f6:	4a12      	ldr	r2, [pc, #72]	; (8001640 <TIM14_IRQHandler+0x174>)
 80015f8:	4812      	ldr	r0, [pc, #72]	; (8001644 <TIM14_IRQHandler+0x178>)
 80015fa:	7811      	ldrb	r1, [r2, #0]
 80015fc:	8804      	ldrh	r4, [r0, #0]
 80015fe:	4814      	ldr	r0, [pc, #80]	; (8001650 <TIM14_IRQHandler+0x184>)
 8001600:	5444      	strb	r4, [r0, r1]
 8001602:	7811      	ldrb	r1, [r2, #0]
 8001604:	3101      	adds	r1, #1
 8001606:	b2c9      	uxtb	r1, r1
 8001608:	7011      	strb	r1, [r2, #0]
 800160a:	2201      	movs	r2, #1
 800160c:	e000      	b.n	8001610 <TIM14_IRQHandler+0x144>
 800160e:	2203      	movs	r2, #3
 8001610:	701a      	strb	r2, [r3, #0]
 8001612:	4b10      	ldr	r3, [pc, #64]	; (8001654 <TIM14_IRQHandler+0x188>)
 8001614:	2200      	movs	r2, #0
 8001616:	821a      	strh	r2, [r3, #16]
 8001618:	bd30      	pop	{r4, r5, pc}
 800161a:	46c0      	nop			; (mov r8, r8)
 800161c:	200007fb 	.word	0x200007fb
 8001620:	200007fa 	.word	0x200007fa
 8001624:	2000008e 	.word	0x2000008e
 8001628:	200007fe 	.word	0x200007fe
 800162c:	20000808 	.word	0x20000808
 8001630:	40012400 	.word	0x40012400
 8001634:	200007f4 	.word	0x200007f4
 8001638:	000003e7 	.word	0x000003e7
 800163c:	200007fc 	.word	0x200007fc
 8001640:	20000800 	.word	0x20000800
 8001644:	200007f8 	.word	0x200007f8
 8001648:	20000801 	.word	0x20000801
 800164c:	20000804 	.word	0x20000804
 8001650:	20000080 	.word	0x20000080
 8001654:	40002000 	.word	0x40002000

08001658 <GPIO_Init>:
 8001658:	2390      	movs	r3, #144	; 0x90
 800165a:	b5f7      	push	{r0, r1, r2, r4, r5, r6, r7, lr}
 800165c:	05db      	lsls	r3, r3, #23
 800165e:	1c04      	adds	r4, r0, #0
 8001660:	1c0d      	adds	r5, r1, #0
 8001662:	4298      	cmp	r0, r3
 8001664:	d010      	beq.n	8001688 <GPIO_Init+0x30>
 8001666:	4b39      	ldr	r3, [pc, #228]	; (800174c <GPIO_Init+0xf4>)
 8001668:	4298      	cmp	r0, r3
 800166a:	d00d      	beq.n	8001688 <GPIO_Init+0x30>
 800166c:	4b38      	ldr	r3, [pc, #224]	; (8001750 <GPIO_Init+0xf8>)
 800166e:	4298      	cmp	r0, r3
 8001670:	d00a      	beq.n	8001688 <GPIO_Init+0x30>
 8001672:	4b38      	ldr	r3, [pc, #224]	; (8001754 <GPIO_Init+0xfc>)
 8001674:	4298      	cmp	r0, r3
 8001676:	d007      	beq.n	8001688 <GPIO_Init+0x30>
 8001678:	4b37      	ldr	r3, [pc, #220]	; (8001758 <GPIO_Init+0x100>)
 800167a:	4298      	cmp	r0, r3
 800167c:	d004      	beq.n	8001688 <GPIO_Init+0x30>
 800167e:	4a37      	ldr	r2, [pc, #220]	; (800175c <GPIO_Init+0x104>)
 8001680:	1880      	adds	r0, r0, r2
 8001682:	4243      	negs	r3, r0
 8001684:	4158      	adcs	r0, r3
 8001686:	e000      	b.n	800168a <GPIO_Init+0x32>
 8001688:	2001      	movs	r0, #1
 800168a:	f7ff fe5d 	bl	8001348 <assert_param>
 800168e:	6828      	ldr	r0, [r5, #0]
 8001690:	2600      	movs	r6, #0
 8001692:	1e43      	subs	r3, r0, #1
 8001694:	4198      	sbcs	r0, r3
 8001696:	f7ff fe57 	bl	8001348 <assert_param>
 800169a:	792b      	ldrb	r3, [r5, #4]
 800169c:	2203      	movs	r2, #3
 800169e:	1c30      	adds	r0, r6, #0
 80016a0:	429a      	cmp	r2, r3
 80016a2:	4170      	adcs	r0, r6
 80016a4:	f7ff fe50 	bl	8001348 <assert_param>
 80016a8:	79eb      	ldrb	r3, [r5, #7]
 80016aa:	2202      	movs	r2, #2
 80016ac:	1c30      	adds	r0, r6, #0
 80016ae:	429a      	cmp	r2, r3
 80016b0:	4170      	adcs	r0, r6
 80016b2:	f7ff fe49 	bl	8001348 <assert_param>
 80016b6:	2001      	movs	r0, #1
 80016b8:	1c03      	adds	r3, r0, #0
 80016ba:	682a      	ldr	r2, [r5, #0]
 80016bc:	40b3      	lsls	r3, r6
 80016be:	401a      	ands	r2, r3
 80016c0:	9201      	str	r2, [sp, #4]
 80016c2:	429a      	cmp	r2, r3
 80016c4:	d13d      	bne.n	8001742 <GPIO_Init+0xea>
 80016c6:	792b      	ldrb	r3, [r5, #4]
 80016c8:	0077      	lsls	r7, r6, #1
 80016ca:	3b01      	subs	r3, #1
 80016cc:	b2db      	uxtb	r3, r3
 80016ce:	4283      	cmp	r3, r0
 80016d0:	d823      	bhi.n	800171a <GPIO_Init+0xc2>
 80016d2:	796b      	ldrb	r3, [r5, #5]
 80016d4:	4283      	cmp	r3, r0
 80016d6:	d902      	bls.n	80016de <GPIO_Init+0x86>
 80016d8:	1ed8      	subs	r0, r3, #3
 80016da:	4243      	negs	r3, r0
 80016dc:	4158      	adcs	r0, r3
 80016de:	f7ff fe33 	bl	8001348 <assert_param>
 80016e2:	68a3      	ldr	r3, [r4, #8]
 80016e4:	2203      	movs	r2, #3
 80016e6:	40ba      	lsls	r2, r7
 80016e8:	4393      	bics	r3, r2
 80016ea:	60a3      	str	r3, [r4, #8]
 80016ec:	796b      	ldrb	r3, [r5, #5]
 80016ee:	68a2      	ldr	r2, [r4, #8]
 80016f0:	40bb      	lsls	r3, r7
 80016f2:	4313      	orrs	r3, r2
 80016f4:	60a3      	str	r3, [r4, #8]
 80016f6:	79ab      	ldrb	r3, [r5, #6]
 80016f8:	2201      	movs	r2, #1
 80016fa:	2000      	movs	r0, #0
 80016fc:	429a      	cmp	r2, r3
 80016fe:	4140      	adcs	r0, r0
 8001700:	f7ff fe22 	bl	8001348 <assert_param>
 8001704:	6863      	ldr	r3, [r4, #4]
 8001706:	9a01      	ldr	r2, [sp, #4]
 8001708:	b29b      	uxth	r3, r3
 800170a:	4393      	bics	r3, r2
 800170c:	80a3      	strh	r3, [r4, #4]
 800170e:	79ab      	ldrb	r3, [r5, #6]
 8001710:	6862      	ldr	r2, [r4, #4]
 8001712:	40b3      	lsls	r3, r6
 8001714:	4313      	orrs	r3, r2
 8001716:	b29b      	uxth	r3, r3
 8001718:	80a3      	strh	r3, [r4, #4]
 800171a:	2303      	movs	r3, #3
 800171c:	6822      	ldr	r2, [r4, #0]
 800171e:	40bb      	lsls	r3, r7
 8001720:	43db      	mvns	r3, r3
 8001722:	401a      	ands	r2, r3
 8001724:	6022      	str	r2, [r4, #0]
 8001726:	792a      	ldrb	r2, [r5, #4]
 8001728:	6821      	ldr	r1, [r4, #0]
 800172a:	40ba      	lsls	r2, r7
 800172c:	430a      	orrs	r2, r1
 800172e:	6022      	str	r2, [r4, #0]
 8001730:	68e2      	ldr	r2, [r4, #12]
 8001732:	4013      	ands	r3, r2
 8001734:	79ea      	ldrb	r2, [r5, #7]
 8001736:	60e3      	str	r3, [r4, #12]
 8001738:	68e3      	ldr	r3, [r4, #12]
 800173a:	40ba      	lsls	r2, r7
 800173c:	1c17      	adds	r7, r2, #0
 800173e:	431f      	orrs	r7, r3
 8001740:	60e7      	str	r7, [r4, #12]
 8001742:	3601      	adds	r6, #1
 8001744:	2e10      	cmp	r6, #16
 8001746:	d1b6      	bne.n	80016b6 <GPIO_Init+0x5e>
 8001748:	bdf7      	pop	{r0, r1, r2, r4, r5, r6, r7, pc}
 800174a:	46c0      	nop			; (mov r8, r8)
 800174c:	48000400 	.word	0x48000400
 8001750:	48000800 	.word	0x48000800
 8001754:	48000c00 	.word	0x48000c00
 8001758:	48001000 	.word	0x48001000
 800175c:	b7ffec00 	.word	0xb7ffec00

08001760 <GPIO_PinAFConfig>:
 8001760:	b5f7      	push	{r0, r1, r2, r4, r5, r6, r7, lr}
 8001762:	2390      	movs	r3, #144	; 0x90
 8001764:	1c04      	adds	r4, r0, #0
 8001766:	1c0e      	adds	r6, r1, #0
 8001768:	9201      	str	r2, [sp, #4]
 800176a:	05db      	lsls	r3, r3, #23
 800176c:	4298      	cmp	r0, r3
 800176e:	d010      	beq.n	8001792 <GPIO_PinAFConfig+0x32>
 8001770:	4b19      	ldr	r3, [pc, #100]	; (80017d8 <GPIO_PinAFConfig+0x78>)
 8001772:	4298      	cmp	r0, r3
 8001774:	d00d      	beq.n	8001792 <GPIO_PinAFConfig+0x32>
 8001776:	4b19      	ldr	r3, [pc, #100]	; (80017dc <GPIO_PinAFConfig+0x7c>)
 8001778:	4298      	cmp	r0, r3
 800177a:	d00a      	beq.n	8001792 <GPIO_PinAFConfig+0x32>
 800177c:	4b18      	ldr	r3, [pc, #96]	; (80017e0 <GPIO_PinAFConfig+0x80>)
 800177e:	4298      	cmp	r0, r3
 8001780:	d007      	beq.n	8001792 <GPIO_PinAFConfig+0x32>
 8001782:	4b18      	ldr	r3, [pc, #96]	; (80017e4 <GPIO_PinAFConfig+0x84>)
 8001784:	4298      	cmp	r0, r3
 8001786:	d004      	beq.n	8001792 <GPIO_PinAFConfig+0x32>
 8001788:	4a17      	ldr	r2, [pc, #92]	; (80017e8 <GPIO_PinAFConfig+0x88>)
 800178a:	1880      	adds	r0, r0, r2
 800178c:	4243      	negs	r3, r0
 800178e:	4158      	adcs	r0, r3
 8001790:	e000      	b.n	8001794 <GPIO_PinAFConfig+0x34>
 8001792:	2001      	movs	r0, #1
 8001794:	2500      	movs	r5, #0
 8001796:	f7ff fdd7 	bl	8001348 <assert_param>
 800179a:	230f      	movs	r3, #15
 800179c:	1c28      	adds	r0, r5, #0
 800179e:	42b3      	cmp	r3, r6
 80017a0:	4168      	adcs	r0, r5
 80017a2:	f7ff fdd1 	bl	8001348 <assert_param>
 80017a6:	9a01      	ldr	r2, [sp, #4]
 80017a8:	1c28      	adds	r0, r5, #0
 80017aa:	2707      	movs	r7, #7
 80017ac:	4297      	cmp	r7, r2
 80017ae:	4168      	adcs	r0, r5
 80017b0:	4037      	ands	r7, r6
 80017b2:	08f6      	lsrs	r6, r6, #3
 80017b4:	00b6      	lsls	r6, r6, #2
 80017b6:	19a4      	adds	r4, r4, r6
 80017b8:	f7ff fdc6 	bl	8001348 <assert_param>
 80017bc:	00bf      	lsls	r7, r7, #2
 80017be:	6a23      	ldr	r3, [r4, #32]
 80017c0:	220f      	movs	r2, #15
 80017c2:	40ba      	lsls	r2, r7
 80017c4:	4393      	bics	r3, r2
 80017c6:	9a01      	ldr	r2, [sp, #4]
 80017c8:	6223      	str	r3, [r4, #32]
 80017ca:	6a23      	ldr	r3, [r4, #32]
 80017cc:	40ba      	lsls	r2, r7
 80017ce:	1c17      	adds	r7, r2, #0
 80017d0:	431f      	orrs	r7, r3
 80017d2:	6227      	str	r7, [r4, #32]
 80017d4:	bdf7      	pop	{r0, r1, r2, r4, r5, r6, r7, pc}
 80017d6:	46c0      	nop			; (mov r8, r8)
 80017d8:	48000400 	.word	0x48000400
 80017dc:	48000800 	.word	0x48000800
 80017e0:	48000c00 	.word	0x48000c00
 80017e4:	48001000 	.word	0x48001000
 80017e8:	b7ffec00 	.word	0xb7ffec00

080017ec <TIM_TimeBaseInit>:
 80017ec:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
 80017ee:	4e34      	ldr	r6, [pc, #208]	; (80018c0 <TIM_TimeBaseInit+0xd4>)
 80017f0:	1c04      	adds	r4, r0, #0
 80017f2:	1c0d      	adds	r5, r1, #0
 80017f4:	4f33      	ldr	r7, [pc, #204]	; (80018c4 <TIM_TimeBaseInit+0xd8>)
 80017f6:	42b0      	cmp	r0, r6
 80017f8:	d019      	beq.n	800182e <TIM_TimeBaseInit+0x42>
 80017fa:	2380      	movs	r3, #128	; 0x80
 80017fc:	05db      	lsls	r3, r3, #23
 80017fe:	4298      	cmp	r0, r3
 8001800:	d015      	beq.n	800182e <TIM_TimeBaseInit+0x42>
 8001802:	4b31      	ldr	r3, [pc, #196]	; (80018c8 <TIM_TimeBaseInit+0xdc>)
 8001804:	4298      	cmp	r0, r3
 8001806:	d012      	beq.n	800182e <TIM_TimeBaseInit+0x42>
 8001808:	42b8      	cmp	r0, r7
 800180a:	d010      	beq.n	800182e <TIM_TimeBaseInit+0x42>
 800180c:	4b2f      	ldr	r3, [pc, #188]	; (80018cc <TIM_TimeBaseInit+0xe0>)
 800180e:	4298      	cmp	r0, r3
 8001810:	d00d      	beq.n	800182e <TIM_TimeBaseInit+0x42>
 8001812:	4b2f      	ldr	r3, [pc, #188]	; (80018d0 <TIM_TimeBaseInit+0xe4>)
 8001814:	4298      	cmp	r0, r3
 8001816:	d00a      	beq.n	800182e <TIM_TimeBaseInit+0x42>
 8001818:	4b2e      	ldr	r3, [pc, #184]	; (80018d4 <TIM_TimeBaseInit+0xe8>)
 800181a:	4298      	cmp	r0, r3
 800181c:	d007      	beq.n	800182e <TIM_TimeBaseInit+0x42>
 800181e:	4b2e      	ldr	r3, [pc, #184]	; (80018d8 <TIM_TimeBaseInit+0xec>)
 8001820:	4298      	cmp	r0, r3
 8001822:	d004      	beq.n	800182e <TIM_TimeBaseInit+0x42>
 8001824:	492d      	ldr	r1, [pc, #180]	; (80018dc <TIM_TimeBaseInit+0xf0>)
 8001826:	1840      	adds	r0, r0, r1
 8001828:	4243      	negs	r3, r0
 800182a:	4158      	adcs	r0, r3
 800182c:	e000      	b.n	8001830 <TIM_TimeBaseInit+0x44>
 800182e:	2001      	movs	r0, #1
 8001830:	f7ff fd8a 	bl	8001348 <assert_param>
 8001834:	886b      	ldrh	r3, [r5, #2]
 8001836:	2210      	movs	r2, #16
 8001838:	1c19      	adds	r1, r3, #0
 800183a:	4391      	bics	r1, r2
 800183c:	d101      	bne.n	8001842 <TIM_TimeBaseInit+0x56>
 800183e:	2001      	movs	r0, #1
 8001840:	e007      	b.n	8001852 <TIM_TimeBaseInit+0x66>
 8001842:	2240      	movs	r2, #64	; 0x40
 8001844:	1c19      	adds	r1, r3, #0
 8001846:	4391      	bics	r1, r2
 8001848:	2920      	cmp	r1, #32
 800184a:	d0f8      	beq.n	800183e <TIM_TimeBaseInit+0x52>
 800184c:	2b40      	cmp	r3, #64	; 0x40
 800184e:	d0f6      	beq.n	800183e <TIM_TimeBaseInit+0x52>
 8001850:	2000      	movs	r0, #0
 8001852:	f7ff fd79 	bl	8001348 <assert_param>
 8001856:	892b      	ldrh	r3, [r5, #8]
 8001858:	4a21      	ldr	r2, [pc, #132]	; (80018e0 <TIM_TimeBaseInit+0xf4>)
 800185a:	2001      	movs	r0, #1
 800185c:	4213      	tst	r3, r2
 800185e:	d003      	beq.n	8001868 <TIM_TimeBaseInit+0x7c>
 8001860:	4a20      	ldr	r2, [pc, #128]	; (80018e4 <TIM_TimeBaseInit+0xf8>)
 8001862:	1898      	adds	r0, r3, r2
 8001864:	4243      	negs	r3, r0
 8001866:	4158      	adcs	r0, r3
 8001868:	f7ff fd6e 	bl	8001348 <assert_param>
 800186c:	6823      	ldr	r3, [r4, #0]
 800186e:	b29b      	uxth	r3, r3
 8001870:	42b4      	cmp	r4, r6
 8001872:	d006      	beq.n	8001882 <TIM_TimeBaseInit+0x96>
 8001874:	2280      	movs	r2, #128	; 0x80
 8001876:	05d2      	lsls	r2, r2, #23
 8001878:	4294      	cmp	r4, r2
 800187a:	d002      	beq.n	8001882 <TIM_TimeBaseInit+0x96>
 800187c:	4a12      	ldr	r2, [pc, #72]	; (80018c8 <TIM_TimeBaseInit+0xdc>)
 800187e:	4294      	cmp	r4, r2
 8001880:	d103      	bne.n	800188a <TIM_TimeBaseInit+0x9e>
 8001882:	2270      	movs	r2, #112	; 0x70
 8001884:	4393      	bics	r3, r2
 8001886:	886a      	ldrh	r2, [r5, #2]
 8001888:	4313      	orrs	r3, r2
 800188a:	42bc      	cmp	r4, r7
 800188c:	d003      	beq.n	8001896 <TIM_TimeBaseInit+0xaa>
 800188e:	4916      	ldr	r1, [pc, #88]	; (80018e8 <TIM_TimeBaseInit+0xfc>)
 8001890:	892a      	ldrh	r2, [r5, #8]
 8001892:	400b      	ands	r3, r1
 8001894:	4313      	orrs	r3, r2
 8001896:	8023      	strh	r3, [r4, #0]
 8001898:	686b      	ldr	r3, [r5, #4]
 800189a:	62e3      	str	r3, [r4, #44]	; 0x2c
 800189c:	882b      	ldrh	r3, [r5, #0]
 800189e:	8523      	strh	r3, [r4, #40]	; 0x28
 80018a0:	42b4      	cmp	r4, r6
 80018a2:	d008      	beq.n	80018b6 <TIM_TimeBaseInit+0xca>
 80018a4:	4b0b      	ldr	r3, [pc, #44]	; (80018d4 <TIM_TimeBaseInit+0xe8>)
 80018a6:	429c      	cmp	r4, r3
 80018a8:	d005      	beq.n	80018b6 <TIM_TimeBaseInit+0xca>
 80018aa:	4b0b      	ldr	r3, [pc, #44]	; (80018d8 <TIM_TimeBaseInit+0xec>)
 80018ac:	429c      	cmp	r4, r3
 80018ae:	d002      	beq.n	80018b6 <TIM_TimeBaseInit+0xca>
 80018b0:	4b0e      	ldr	r3, [pc, #56]	; (80018ec <TIM_TimeBaseInit+0x100>)
 80018b2:	429c      	cmp	r4, r3
 80018b4:	d101      	bne.n	80018ba <TIM_TimeBaseInit+0xce>
 80018b6:	7aab      	ldrb	r3, [r5, #10]
 80018b8:	8623      	strh	r3, [r4, #48]	; 0x30
 80018ba:	2301      	movs	r3, #1
 80018bc:	82a3      	strh	r3, [r4, #20]
 80018be:	bdf8      	pop	{r3, r4, r5, r6, r7, pc}
 80018c0:	40012c00 	.word	0x40012c00
 80018c4:	40001000 	.word	0x40001000
 80018c8:	40000400 	.word	0x40000400
 80018cc:	40001400 	.word	0x40001400
 80018d0:	40002000 	.word	0x40002000
 80018d4:	40014000 	.word	0x40014000
 80018d8:	40014400 	.word	0x40014400
 80018dc:	bffeb800 	.word	0xbffeb800
 80018e0:	fffffeff 	.word	0xfffffeff
 80018e4:	fffffe00 	.word	0xfffffe00
 80018e8:	fffffcff 	.word	0xfffffcff
 80018ec:	40014800 	.word	0x40014800

080018f0 <TIM_Cmd>:
 80018f0:	4b19      	ldr	r3, [pc, #100]	; (8001958 <TIM_Cmd+0x68>)
 80018f2:	b570      	push	{r4, r5, r6, lr}
 80018f4:	1c04      	adds	r4, r0, #0
 80018f6:	1c0e      	adds	r6, r1, #0
 80018f8:	4298      	cmp	r0, r3
 80018fa:	d01a      	beq.n	8001932 <TIM_Cmd+0x42>
 80018fc:	2380      	movs	r3, #128	; 0x80
 80018fe:	05db      	lsls	r3, r3, #23
 8001900:	4298      	cmp	r0, r3
 8001902:	d016      	beq.n	8001932 <TIM_Cmd+0x42>
 8001904:	4b15      	ldr	r3, [pc, #84]	; (800195c <TIM_Cmd+0x6c>)
 8001906:	4298      	cmp	r0, r3
 8001908:	d013      	beq.n	8001932 <TIM_Cmd+0x42>
 800190a:	4b15      	ldr	r3, [pc, #84]	; (8001960 <TIM_Cmd+0x70>)
 800190c:	4298      	cmp	r0, r3
 800190e:	d010      	beq.n	8001932 <TIM_Cmd+0x42>
 8001910:	4b14      	ldr	r3, [pc, #80]	; (8001964 <TIM_Cmd+0x74>)
 8001912:	4298      	cmp	r0, r3
 8001914:	d00d      	beq.n	8001932 <TIM_Cmd+0x42>
 8001916:	4b14      	ldr	r3, [pc, #80]	; (8001968 <TIM_Cmd+0x78>)
 8001918:	4298      	cmp	r0, r3
 800191a:	d00a      	beq.n	8001932 <TIM_Cmd+0x42>
 800191c:	4b13      	ldr	r3, [pc, #76]	; (800196c <TIM_Cmd+0x7c>)
 800191e:	4298      	cmp	r0, r3
 8001920:	d007      	beq.n	8001932 <TIM_Cmd+0x42>
 8001922:	4b13      	ldr	r3, [pc, #76]	; (8001970 <TIM_Cmd+0x80>)
 8001924:	4298      	cmp	r0, r3
 8001926:	d004      	beq.n	8001932 <TIM_Cmd+0x42>
 8001928:	4b12      	ldr	r3, [pc, #72]	; (8001974 <TIM_Cmd+0x84>)
 800192a:	18c0      	adds	r0, r0, r3
 800192c:	4243      	negs	r3, r0
 800192e:	4158      	adcs	r0, r3
 8001930:	e000      	b.n	8001934 <TIM_Cmd+0x44>
 8001932:	2001      	movs	r0, #1
 8001934:	f7ff fd08 	bl	8001348 <assert_param>
 8001938:	2501      	movs	r5, #1
 800193a:	2000      	movs	r0, #0
 800193c:	42b5      	cmp	r5, r6
 800193e:	4140      	adcs	r0, r0
 8001940:	f7ff fd02 	bl	8001348 <assert_param>
 8001944:	6823      	ldr	r3, [r4, #0]
 8001946:	b29b      	uxth	r3, r3
 8001948:	2e00      	cmp	r6, #0
 800194a:	d002      	beq.n	8001952 <TIM_Cmd+0x62>
 800194c:	431d      	orrs	r5, r3
 800194e:	8025      	strh	r5, [r4, #0]
 8001950:	e001      	b.n	8001956 <TIM_Cmd+0x66>
 8001952:	43ab      	bics	r3, r5
 8001954:	8023      	strh	r3, [r4, #0]
 8001956:	bd70      	pop	{r4, r5, r6, pc}
 8001958:	40012c00 	.word	0x40012c00
 800195c:	40000400 	.word	0x40000400
 8001960:	40001000 	.word	0x40001000
 8001964:	40001400 	.word	0x40001400
 8001968:	40002000 	.word	0x40002000
 800196c:	40014000 	.word	0x40014000
 8001970:	40014400 	.word	0x40014400
 8001974:	bffeb800 	.word	0xbffeb800

08001978 <TIM_ITConfig>:
 8001978:	4b1f      	ldr	r3, [pc, #124]	; (80019f8 <TIM_ITConfig+0x80>)
 800197a:	b570      	push	{r4, r5, r6, lr}
 800197c:	1c04      	adds	r4, r0, #0
 800197e:	1c0d      	adds	r5, r1, #0
 8001980:	1c16      	adds	r6, r2, #0
 8001982:	4298      	cmp	r0, r3
 8001984:	d01a      	beq.n	80019bc <TIM_ITConfig+0x44>
 8001986:	2380      	movs	r3, #128	; 0x80
 8001988:	05db      	lsls	r3, r3, #23
 800198a:	4298      	cmp	r0, r3
 800198c:	d016      	beq.n	80019bc <TIM_ITConfig+0x44>
 800198e:	4b1b      	ldr	r3, [pc, #108]	; (80019fc <TIM_ITConfig+0x84>)
 8001990:	4298      	cmp	r0, r3
 8001992:	d013      	beq.n	80019bc <TIM_ITConfig+0x44>
 8001994:	4b1a      	ldr	r3, [pc, #104]	; (8001a00 <TIM_ITConfig+0x88>)
 8001996:	4298      	cmp	r0, r3
 8001998:	d010      	beq.n	80019bc <TIM_ITConfig+0x44>
 800199a:	4b1a      	ldr	r3, [pc, #104]	; (8001a04 <TIM_ITConfig+0x8c>)
 800199c:	4298      	cmp	r0, r3
 800199e:	d00d      	beq.n	80019bc <TIM_ITConfig+0x44>
 80019a0:	4b19      	ldr	r3, [pc, #100]	; (8001a08 <TIM_ITConfig+0x90>)
 80019a2:	4298      	cmp	r0, r3
 80019a4:	d00a      	beq.n	80019bc <TIM_ITConfig+0x44>
 80019a6:	4b19      	ldr	r3, [pc, #100]	; (8001a0c <TIM_ITConfig+0x94>)
 80019a8:	4298      	cmp	r0, r3
 80019aa:	d007      	beq.n	80019bc <TIM_ITConfig+0x44>
 80019ac:	4b18      	ldr	r3, [pc, #96]	; (8001a10 <TIM_ITConfig+0x98>)
 80019ae:	4298      	cmp	r0, r3
 80019b0:	d004      	beq.n	80019bc <TIM_ITConfig+0x44>
 80019b2:	4a18      	ldr	r2, [pc, #96]	; (8001a14 <TIM_ITConfig+0x9c>)
 80019b4:	1880      	adds	r0, r0, r2
 80019b6:	4243      	negs	r3, r0
 80019b8:	4158      	adcs	r0, r3
 80019ba:	e000      	b.n	80019be <TIM_ITConfig+0x46>
 80019bc:	2001      	movs	r0, #1
 80019be:	f7ff fcc3 	bl	8001348 <assert_param>
 80019c2:	23ff      	movs	r3, #255	; 0xff
 80019c4:	1c2a      	adds	r2, r5, #0
 80019c6:	2000      	movs	r0, #0
 80019c8:	439a      	bics	r2, r3
 80019ca:	4282      	cmp	r2, r0
 80019cc:	d102      	bne.n	80019d4 <TIM_ITConfig+0x5c>
 80019ce:	1c28      	adds	r0, r5, #0
 80019d0:	1e43      	subs	r3, r0, #1
 80019d2:	4198      	sbcs	r0, r3
 80019d4:	f7ff fcb8 	bl	8001348 <assert_param>
 80019d8:	2301      	movs	r3, #1
 80019da:	2000      	movs	r0, #0
 80019dc:	42b3      	cmp	r3, r6
 80019de:	4140      	adcs	r0, r0
 80019e0:	f7ff fcb2 	bl	8001348 <assert_param>
 80019e4:	68e3      	ldr	r3, [r4, #12]
 80019e6:	b29b      	uxth	r3, r3
 80019e8:	2e00      	cmp	r6, #0
 80019ea:	d002      	beq.n	80019f2 <TIM_ITConfig+0x7a>
 80019ec:	431d      	orrs	r5, r3
 80019ee:	81a5      	strh	r5, [r4, #12]
 80019f0:	e001      	b.n	80019f6 <TIM_ITConfig+0x7e>
 80019f2:	43ab      	bics	r3, r5
 80019f4:	81a3      	strh	r3, [r4, #12]
 80019f6:	bd70      	pop	{r4, r5, r6, pc}
 80019f8:	40012c00 	.word	0x40012c00
 80019fc:	40000400 	.word	0x40000400
 8001a00:	40001000 	.word	0x40001000
 8001a04:	40001400 	.word	0x40001400
 8001a08:	40002000 	.word	0x40002000
 8001a0c:	40014000 	.word	0x40014000
 8001a10:	40014400 	.word	0x40014400
 8001a14:	bffeb800 	.word	0xbffeb800

08001a18 <USART_Init>:
 8001a18:	b5f0      	push	{r4, r5, r6, r7, lr}
 8001a1a:	4e53      	ldr	r6, [pc, #332]	; (8001b68 <USART_Init+0x150>)
 8001a1c:	b08b      	sub	sp, #44	; 0x2c
 8001a1e:	1c04      	adds	r4, r0, #0
 8001a20:	1c0d      	adds	r5, r1, #0
 8001a22:	42b0      	cmp	r0, r6
 8001a24:	d016      	beq.n	8001a54 <USART_Init+0x3c>
 8001a26:	4b51      	ldr	r3, [pc, #324]	; (8001b6c <USART_Init+0x154>)
 8001a28:	4298      	cmp	r0, r3
 8001a2a:	d013      	beq.n	8001a54 <USART_Init+0x3c>
 8001a2c:	4b50      	ldr	r3, [pc, #320]	; (8001b70 <USART_Init+0x158>)
 8001a2e:	4298      	cmp	r0, r3
 8001a30:	d010      	beq.n	8001a54 <USART_Init+0x3c>
 8001a32:	4b50      	ldr	r3, [pc, #320]	; (8001b74 <USART_Init+0x15c>)
 8001a34:	4298      	cmp	r0, r3
 8001a36:	d00d      	beq.n	8001a54 <USART_Init+0x3c>
 8001a38:	4b4f      	ldr	r3, [pc, #316]	; (8001b78 <USART_Init+0x160>)
 8001a3a:	4298      	cmp	r0, r3
 8001a3c:	d00a      	beq.n	8001a54 <USART_Init+0x3c>
 8001a3e:	4b4f      	ldr	r3, [pc, #316]	; (8001b7c <USART_Init+0x164>)
 8001a40:	4298      	cmp	r0, r3
 8001a42:	d007      	beq.n	8001a54 <USART_Init+0x3c>
 8001a44:	4b4e      	ldr	r3, [pc, #312]	; (8001b80 <USART_Init+0x168>)
 8001a46:	4298      	cmp	r0, r3
 8001a48:	d004      	beq.n	8001a54 <USART_Init+0x3c>
 8001a4a:	494e      	ldr	r1, [pc, #312]	; (8001b84 <USART_Init+0x16c>)
 8001a4c:	1840      	adds	r0, r0, r1
 8001a4e:	4243      	negs	r3, r0
 8001a50:	4158      	adcs	r0, r3
 8001a52:	e000      	b.n	8001a56 <USART_Init+0x3e>
 8001a54:	2001      	movs	r0, #1
 8001a56:	f7ff fc77 	bl	8001348 <assert_param>
 8001a5a:	682b      	ldr	r3, [r5, #0]
 8001a5c:	4a4a      	ldr	r2, [pc, #296]	; (8001b88 <USART_Init+0x170>)
 8001a5e:	3b01      	subs	r3, #1
 8001a60:	2000      	movs	r0, #0
 8001a62:	429a      	cmp	r2, r3
 8001a64:	4140      	adcs	r0, r0
 8001a66:	f7ff fc6f 	bl	8001348 <assert_param>
 8001a6a:	686b      	ldr	r3, [r5, #4]
 8001a6c:	4a47      	ldr	r2, [pc, #284]	; (8001b8c <USART_Init+0x174>)
 8001a6e:	2001      	movs	r0, #1
 8001a70:	4213      	tst	r3, r2
 8001a72:	d003      	beq.n	8001a7c <USART_Init+0x64>
 8001a74:	4a46      	ldr	r2, [pc, #280]	; (8001b90 <USART_Init+0x178>)
 8001a76:	1898      	adds	r0, r3, r2
 8001a78:	4243      	negs	r3, r0
 8001a7a:	4158      	adcs	r0, r3
 8001a7c:	f7ff fc64 	bl	8001348 <assert_param>
 8001a80:	68ab      	ldr	r3, [r5, #8]
 8001a82:	4a44      	ldr	r2, [pc, #272]	; (8001b94 <USART_Init+0x17c>)
 8001a84:	2001      	movs	r0, #1
 8001a86:	4213      	tst	r3, r2
 8001a88:	d003      	beq.n	8001a92 <USART_Init+0x7a>
 8001a8a:	4943      	ldr	r1, [pc, #268]	; (8001b98 <USART_Init+0x180>)
 8001a8c:	1858      	adds	r0, r3, r1
 8001a8e:	4243      	negs	r3, r0
 8001a90:	4158      	adcs	r0, r3
 8001a92:	f7ff fc59 	bl	8001348 <assert_param>
 8001a96:	68eb      	ldr	r3, [r5, #12]
 8001a98:	4a40      	ldr	r2, [pc, #256]	; (8001b9c <USART_Init+0x184>)
 8001a9a:	2001      	movs	r0, #1
 8001a9c:	4213      	tst	r3, r2
 8001a9e:	d003      	beq.n	8001aa8 <USART_Init+0x90>
 8001aa0:	4a3f      	ldr	r2, [pc, #252]	; (8001ba0 <USART_Init+0x188>)
 8001aa2:	1898      	adds	r0, r3, r2
 8001aa4:	4243      	negs	r3, r0
 8001aa6:	4158      	adcs	r0, r3
 8001aa8:	f7ff fc4e 	bl	8001348 <assert_param>
 8001aac:	692b      	ldr	r3, [r5, #16]
 8001aae:	220c      	movs	r2, #12
 8001ab0:	1c19      	adds	r1, r3, #0
 8001ab2:	2000      	movs	r0, #0
 8001ab4:	4391      	bics	r1, r2
 8001ab6:	4281      	cmp	r1, r0
 8001ab8:	d102      	bne.n	8001ac0 <USART_Init+0xa8>
 8001aba:	1c18      	adds	r0, r3, #0
 8001abc:	1e43      	subs	r3, r0, #1
 8001abe:	4198      	sbcs	r0, r3
 8001ac0:	f7ff fc42 	bl	8001348 <assert_param>
 8001ac4:	4f37      	ldr	r7, [pc, #220]	; (8001ba4 <USART_Init+0x18c>)
 8001ac6:	6968      	ldr	r0, [r5, #20]
 8001ac8:	4038      	ands	r0, r7
 8001aca:	4243      	negs	r3, r0
 8001acc:	4158      	adcs	r0, r3
 8001ace:	f7ff fc3b 	bl	8001348 <assert_param>
 8001ad2:	6823      	ldr	r3, [r4, #0]
 8001ad4:	2201      	movs	r2, #1
 8001ad6:	4393      	bics	r3, r2
 8001ad8:	6023      	str	r3, [r4, #0]
 8001ada:	6862      	ldr	r2, [r4, #4]
 8001adc:	4b32      	ldr	r3, [pc, #200]	; (8001ba8 <USART_Init+0x190>)
 8001ade:	6869      	ldr	r1, [r5, #4]
 8001ae0:	4013      	ands	r3, r2
 8001ae2:	68aa      	ldr	r2, [r5, #8]
 8001ae4:	4668      	mov	r0, sp
 8001ae6:	4313      	orrs	r3, r2
 8001ae8:	6063      	str	r3, [r4, #4]
 8001aea:	6822      	ldr	r2, [r4, #0]
 8001aec:	4b2f      	ldr	r3, [pc, #188]	; (8001bac <USART_Init+0x194>)
 8001aee:	401a      	ands	r2, r3
 8001af0:	68eb      	ldr	r3, [r5, #12]
 8001af2:	430b      	orrs	r3, r1
 8001af4:	6929      	ldr	r1, [r5, #16]
 8001af6:	430b      	orrs	r3, r1
 8001af8:	4313      	orrs	r3, r2
 8001afa:	6023      	str	r3, [r4, #0]
 8001afc:	68a3      	ldr	r3, [r4, #8]
 8001afe:	696a      	ldr	r2, [r5, #20]
 8001b00:	401f      	ands	r7, r3
 8001b02:	4317      	orrs	r7, r2
 8001b04:	60a7      	str	r7, [r4, #8]
 8001b06:	f000 fb8f 	bl	8002228 <RCC_GetClocksFreq>
 8001b0a:	42b4      	cmp	r4, r6
 8001b0c:	d101      	bne.n	8001b12 <USART_Init+0xfa>
 8001b0e:	9e06      	ldr	r6, [sp, #24]
 8001b10:	e00a      	b.n	8001b28 <USART_Init+0x110>
 8001b12:	4b16      	ldr	r3, [pc, #88]	; (8001b6c <USART_Init+0x154>)
 8001b14:	429c      	cmp	r4, r3
 8001b16:	d101      	bne.n	8001b1c <USART_Init+0x104>
 8001b18:	9e07      	ldr	r6, [sp, #28]
 8001b1a:	e005      	b.n	8001b28 <USART_Init+0x110>
 8001b1c:	4b14      	ldr	r3, [pc, #80]	; (8001b70 <USART_Init+0x158>)
 8001b1e:	429c      	cmp	r4, r3
 8001b20:	d101      	bne.n	8001b26 <USART_Init+0x10e>
 8001b22:	9e08      	ldr	r6, [sp, #32]
 8001b24:	e000      	b.n	8001b28 <USART_Init+0x110>
 8001b26:	9e02      	ldr	r6, [sp, #8]
 8001b28:	6823      	ldr	r3, [r4, #0]
 8001b2a:	682f      	ldr	r7, [r5, #0]
 8001b2c:	0419      	lsls	r1, r3, #16
 8001b2e:	d500      	bpl.n	8001b32 <USART_Init+0x11a>
 8001b30:	0076      	lsls	r6, r6, #1
 8001b32:	1c39      	adds	r1, r7, #0
 8001b34:	1c30      	adds	r0, r6, #0
 8001b36:	f000 fd9d 	bl	8002674 <__aeabi_uidiv>
 8001b3a:	1c39      	adds	r1, r7, #0
 8001b3c:	1c05      	adds	r5, r0, #0
 8001b3e:	1c30      	adds	r0, r6, #0
 8001b40:	f000 fddc 	bl	80026fc <__aeabi_uidivmod>
 8001b44:	087f      	lsrs	r7, r7, #1
 8001b46:	2300      	movs	r3, #0
 8001b48:	42b9      	cmp	r1, r7
 8001b4a:	415b      	adcs	r3, r3
 8001b4c:	18ed      	adds	r5, r5, r3
 8001b4e:	6823      	ldr	r3, [r4, #0]
 8001b50:	041a      	lsls	r2, r3, #16
 8001b52:	d504      	bpl.n	8001b5e <USART_Init+0x146>
 8001b54:	4a16      	ldr	r2, [pc, #88]	; (8001bb0 <USART_Init+0x198>)
 8001b56:	072b      	lsls	r3, r5, #28
 8001b58:	0f5b      	lsrs	r3, r3, #29
 8001b5a:	4015      	ands	r5, r2
 8001b5c:	431d      	orrs	r5, r3
 8001b5e:	b2ad      	uxth	r5, r5
 8001b60:	81a5      	strh	r5, [r4, #12]
 8001b62:	b00b      	add	sp, #44	; 0x2c
 8001b64:	bdf0      	pop	{r4, r5, r6, r7, pc}
 8001b66:	46c0      	nop			; (mov r8, r8)
 8001b68:	40013800 	.word	0x40013800
 8001b6c:	40004400 	.word	0x40004400
 8001b70:	40004800 	.word	0x40004800
 8001b74:	40004c00 	.word	0x40004c00
 8001b78:	40005000 	.word	0x40005000
 8001b7c:	40011400 	.word	0x40011400
 8001b80:	40011800 	.word	0x40011800
 8001b84:	bffee400 	.word	0xbffee400
 8001b88:	005b8d7f 	.word	0x005b8d7f
 8001b8c:	ffffefff 	.word	0xffffefff
 8001b90:	effff000 	.word	0xeffff000
 8001b94:	ffffdfff 	.word	0xffffdfff
 8001b98:	ffffd000 	.word	0xffffd000
 8001b9c:	fffffbff 	.word	0xfffffbff
 8001ba0:	fffffa00 	.word	0xfffffa00
 8001ba4:	fffffcff 	.word	0xfffffcff
 8001ba8:	ffffcfff 	.word	0xffffcfff
 8001bac:	ffffe9f3 	.word	0xffffe9f3
 8001bb0:	0000fff0 	.word	0x0000fff0

08001bb4 <USART_Cmd>:
 8001bb4:	4b17      	ldr	r3, [pc, #92]	; (8001c14 <USART_Cmd+0x60>)
 8001bb6:	b570      	push	{r4, r5, r6, lr}
 8001bb8:	1c04      	adds	r4, r0, #0
 8001bba:	1c0e      	adds	r6, r1, #0
 8001bbc:	4298      	cmp	r0, r3
 8001bbe:	d016      	beq.n	8001bee <USART_Cmd+0x3a>
 8001bc0:	4b15      	ldr	r3, [pc, #84]	; (8001c18 <USART_Cmd+0x64>)
 8001bc2:	4298      	cmp	r0, r3
 8001bc4:	d013      	beq.n	8001bee <USART_Cmd+0x3a>
 8001bc6:	4b15      	ldr	r3, [pc, #84]	; (8001c1c <USART_Cmd+0x68>)
 8001bc8:	4298      	cmp	r0, r3
 8001bca:	d010      	beq.n	8001bee <USART_Cmd+0x3a>
 8001bcc:	4b14      	ldr	r3, [pc, #80]	; (8001c20 <USART_Cmd+0x6c>)
 8001bce:	4298      	cmp	r0, r3
 8001bd0:	d00d      	beq.n	8001bee <USART_Cmd+0x3a>
 8001bd2:	4b14      	ldr	r3, [pc, #80]	; (8001c24 <USART_Cmd+0x70>)
 8001bd4:	4298      	cmp	r0, r3
 8001bd6:	d00a      	beq.n	8001bee <USART_Cmd+0x3a>
 8001bd8:	4b13      	ldr	r3, [pc, #76]	; (8001c28 <USART_Cmd+0x74>)
 8001bda:	4298      	cmp	r0, r3
 8001bdc:	d007      	beq.n	8001bee <USART_Cmd+0x3a>
 8001bde:	4b13      	ldr	r3, [pc, #76]	; (8001c2c <USART_Cmd+0x78>)
 8001be0:	4298      	cmp	r0, r3
 8001be2:	d004      	beq.n	8001bee <USART_Cmd+0x3a>
 8001be4:	4b12      	ldr	r3, [pc, #72]	; (8001c30 <USART_Cmd+0x7c>)
 8001be6:	18c0      	adds	r0, r0, r3
 8001be8:	4243      	negs	r3, r0
 8001bea:	4158      	adcs	r0, r3
 8001bec:	e000      	b.n	8001bf0 <USART_Cmd+0x3c>
 8001bee:	2001      	movs	r0, #1
 8001bf0:	f7ff fbaa 	bl	8001348 <assert_param>
 8001bf4:	2501      	movs	r5, #1
 8001bf6:	2000      	movs	r0, #0
 8001bf8:	42b5      	cmp	r5, r6
 8001bfa:	4140      	adcs	r0, r0
 8001bfc:	f7ff fba4 	bl	8001348 <assert_param>
 8001c00:	6823      	ldr	r3, [r4, #0]
 8001c02:	2e00      	cmp	r6, #0
 8001c04:	d002      	beq.n	8001c0c <USART_Cmd+0x58>
 8001c06:	431d      	orrs	r5, r3
 8001c08:	6025      	str	r5, [r4, #0]
 8001c0a:	e001      	b.n	8001c10 <USART_Cmd+0x5c>
 8001c0c:	43ab      	bics	r3, r5
 8001c0e:	6023      	str	r3, [r4, #0]
 8001c10:	bd70      	pop	{r4, r5, r6, pc}
 8001c12:	46c0      	nop			; (mov r8, r8)
 8001c14:	40013800 	.word	0x40013800
 8001c18:	40004400 	.word	0x40004400
 8001c1c:	40004800 	.word	0x40004800
 8001c20:	40004c00 	.word	0x40004c00
 8001c24:	40005000 	.word	0x40005000
 8001c28:	40011400 	.word	0x40011400
 8001c2c:	40011800 	.word	0x40011800
 8001c30:	bffee400 	.word	0xbffee400

08001c34 <USART_ReceiveData>:
 8001c34:	4b11      	ldr	r3, [pc, #68]	; (8001c7c <USART_ReceiveData+0x48>)
 8001c36:	b510      	push	{r4, lr}
 8001c38:	1e04      	subs	r4, r0, #0
 8001c3a:	429c      	cmp	r4, r3
 8001c3c:	d016      	beq.n	8001c6c <USART_ReceiveData+0x38>
 8001c3e:	4b10      	ldr	r3, [pc, #64]	; (8001c80 <USART_ReceiveData+0x4c>)
 8001c40:	4298      	cmp	r0, r3
 8001c42:	d013      	beq.n	8001c6c <USART_ReceiveData+0x38>
 8001c44:	4b0f      	ldr	r3, [pc, #60]	; (8001c84 <USART_ReceiveData+0x50>)
 8001c46:	4298      	cmp	r0, r3
 8001c48:	d010      	beq.n	8001c6c <USART_ReceiveData+0x38>
 8001c4a:	4b0f      	ldr	r3, [pc, #60]	; (8001c88 <USART_ReceiveData+0x54>)
 8001c4c:	4298      	cmp	r0, r3
 8001c4e:	d00d      	beq.n	8001c6c <USART_ReceiveData+0x38>
 8001c50:	4b0e      	ldr	r3, [pc, #56]	; (8001c8c <USART_ReceiveData+0x58>)
 8001c52:	4298      	cmp	r0, r3
 8001c54:	d00a      	beq.n	8001c6c <USART_ReceiveData+0x38>
 8001c56:	4b0e      	ldr	r3, [pc, #56]	; (8001c90 <USART_ReceiveData+0x5c>)
 8001c58:	4298      	cmp	r0, r3
 8001c5a:	d007      	beq.n	8001c6c <USART_ReceiveData+0x38>
 8001c5c:	4b0d      	ldr	r3, [pc, #52]	; (8001c94 <USART_ReceiveData+0x60>)
 8001c5e:	4298      	cmp	r0, r3
 8001c60:	d004      	beq.n	8001c6c <USART_ReceiveData+0x38>
 8001c62:	4b0d      	ldr	r3, [pc, #52]	; (8001c98 <USART_ReceiveData+0x64>)
 8001c64:	18c0      	adds	r0, r0, r3
 8001c66:	4243      	negs	r3, r0
 8001c68:	4158      	adcs	r0, r3
 8001c6a:	e000      	b.n	8001c6e <USART_ReceiveData+0x3a>
 8001c6c:	2001      	movs	r0, #1
 8001c6e:	f7ff fb6b 	bl	8001348 <assert_param>
 8001c72:	6a60      	ldr	r0, [r4, #36]	; 0x24
 8001c74:	05c0      	lsls	r0, r0, #23
 8001c76:	0dc0      	lsrs	r0, r0, #23
 8001c78:	bd10      	pop	{r4, pc}
 8001c7a:	46c0      	nop			; (mov r8, r8)
 8001c7c:	40013800 	.word	0x40013800
 8001c80:	40004400 	.word	0x40004400
 8001c84:	40004800 	.word	0x40004800
 8001c88:	40004c00 	.word	0x40004c00
 8001c8c:	40005000 	.word	0x40005000
 8001c90:	40011400 	.word	0x40011400
 8001c94:	40011800 	.word	0x40011800
 8001c98:	bffee400 	.word	0xbffee400

08001c9c <USART_GetITStatus>:
 8001c9c:	b538      	push	{r3, r4, r5, lr}
 8001c9e:	4b36      	ldr	r3, [pc, #216]	; (8001d78 <USART_GetITStatus+0xdc>)
 8001ca0:	1c05      	adds	r5, r0, #0
 8001ca2:	1c0c      	adds	r4, r1, #0
 8001ca4:	4298      	cmp	r0, r3
 8001ca6:	d016      	beq.n	8001cd6 <USART_GetITStatus+0x3a>
 8001ca8:	4b34      	ldr	r3, [pc, #208]	; (8001d7c <USART_GetITStatus+0xe0>)
 8001caa:	4298      	cmp	r0, r3
 8001cac:	d013      	beq.n	8001cd6 <USART_GetITStatus+0x3a>
 8001cae:	4b34      	ldr	r3, [pc, #208]	; (8001d80 <USART_GetITStatus+0xe4>)
 8001cb0:	4298      	cmp	r0, r3
 8001cb2:	d010      	beq.n	8001cd6 <USART_GetITStatus+0x3a>
 8001cb4:	4b33      	ldr	r3, [pc, #204]	; (8001d84 <USART_GetITStatus+0xe8>)
 8001cb6:	4298      	cmp	r0, r3
 8001cb8:	d00d      	beq.n	8001cd6 <USART_GetITStatus+0x3a>
 8001cba:	4b33      	ldr	r3, [pc, #204]	; (8001d88 <USART_GetITStatus+0xec>)
 8001cbc:	4298      	cmp	r0, r3
 8001cbe:	d00a      	beq.n	8001cd6 <USART_GetITStatus+0x3a>
 8001cc0:	4b32      	ldr	r3, [pc, #200]	; (8001d8c <USART_GetITStatus+0xf0>)
 8001cc2:	4298      	cmp	r0, r3
 8001cc4:	d007      	beq.n	8001cd6 <USART_GetITStatus+0x3a>
 8001cc6:	4b32      	ldr	r3, [pc, #200]	; (8001d90 <USART_GetITStatus+0xf4>)
 8001cc8:	4298      	cmp	r0, r3
 8001cca:	d004      	beq.n	8001cd6 <USART_GetITStatus+0x3a>
 8001ccc:	4a31      	ldr	r2, [pc, #196]	; (8001d94 <USART_GetITStatus+0xf8>)
 8001cce:	1880      	adds	r0, r0, r2
 8001cd0:	4243      	negs	r3, r0
 8001cd2:	4158      	adcs	r0, r3
 8001cd4:	e000      	b.n	8001cd8 <USART_GetITStatus+0x3c>
 8001cd6:	2001      	movs	r0, #1
 8001cd8:	f7ff fb36 	bl	8001348 <assert_param>
 8001cdc:	2384      	movs	r3, #132	; 0x84
 8001cde:	005b      	lsls	r3, r3, #1
 8001ce0:	429c      	cmp	r4, r3
 8001ce2:	d027      	beq.n	8001d34 <USART_GetITStatus+0x98>
 8001ce4:	4b2c      	ldr	r3, [pc, #176]	; (8001d98 <USART_GetITStatus+0xfc>)
 8001ce6:	429c      	cmp	r4, r3
 8001ce8:	d024      	beq.n	8001d34 <USART_GetITStatus+0x98>
 8001cea:	4b2c      	ldr	r3, [pc, #176]	; (8001d9c <USART_GetITStatus+0x100>)
 8001cec:	429c      	cmp	r4, r3
 8001cee:	d021      	beq.n	8001d34 <USART_GetITStatus+0x98>
 8001cf0:	4b2b      	ldr	r3, [pc, #172]	; (8001da0 <USART_GetITStatus+0x104>)
 8001cf2:	429c      	cmp	r4, r3
 8001cf4:	d01e      	beq.n	8001d34 <USART_GetITStatus+0x98>
 8001cf6:	4b2b      	ldr	r3, [pc, #172]	; (8001da4 <USART_GetITStatus+0x108>)
 8001cf8:	429c      	cmp	r4, r3
 8001cfa:	d01b      	beq.n	8001d34 <USART_GetITStatus+0x98>
 8001cfc:	4b2a      	ldr	r3, [pc, #168]	; (8001da8 <USART_GetITStatus+0x10c>)
 8001cfe:	429c      	cmp	r4, r3
 8001d00:	d018      	beq.n	8001d34 <USART_GetITStatus+0x98>
 8001d02:	4b2a      	ldr	r3, [pc, #168]	; (8001dac <USART_GetITStatus+0x110>)
 8001d04:	429c      	cmp	r4, r3
 8001d06:	d015      	beq.n	8001d34 <USART_GetITStatus+0x98>
 8001d08:	4b29      	ldr	r3, [pc, #164]	; (8001db0 <USART_GetITStatus+0x114>)
 8001d0a:	429c      	cmp	r4, r3
 8001d0c:	d012      	beq.n	8001d34 <USART_GetITStatus+0x98>
 8001d0e:	4a29      	ldr	r2, [pc, #164]	; (8001db4 <USART_GetITStatus+0x118>)
 8001d10:	4b29      	ldr	r3, [pc, #164]	; (8001db8 <USART_GetITStatus+0x11c>)
 8001d12:	4022      	ands	r2, r4
 8001d14:	429a      	cmp	r2, r3
 8001d16:	d00d      	beq.n	8001d34 <USART_GetITStatus+0x98>
 8001d18:	4b28      	ldr	r3, [pc, #160]	; (8001dbc <USART_GetITStatus+0x120>)
 8001d1a:	429c      	cmp	r4, r3
 8001d1c:	d00a      	beq.n	8001d34 <USART_GetITStatus+0x98>
 8001d1e:	4b28      	ldr	r3, [pc, #160]	; (8001dc0 <USART_GetITStatus+0x124>)
 8001d20:	429c      	cmp	r4, r3
 8001d22:	d007      	beq.n	8001d34 <USART_GetITStatus+0x98>
 8001d24:	4b27      	ldr	r3, [pc, #156]	; (8001dc4 <USART_GetITStatus+0x128>)
 8001d26:	429c      	cmp	r4, r3
 8001d28:	d004      	beq.n	8001d34 <USART_GetITStatus+0x98>
 8001d2a:	4a27      	ldr	r2, [pc, #156]	; (8001dc8 <USART_GetITStatus+0x12c>)
 8001d2c:	18a3      	adds	r3, r4, r2
 8001d2e:	4258      	negs	r0, r3
 8001d30:	4158      	adcs	r0, r3
 8001d32:	e000      	b.n	8001d36 <USART_GetITStatus+0x9a>
 8001d34:	2001      	movs	r0, #1
 8001d36:	f7ff fb07 	bl	8001348 <assert_param>
 8001d3a:	b2e3      	uxtb	r3, r4
 8001d3c:	2101      	movs	r1, #1
 8001d3e:	b2a2      	uxth	r2, r4
 8001d40:	4099      	lsls	r1, r3
 8001d42:	0a12      	lsrs	r2, r2, #8
 8001d44:	1c0b      	adds	r3, r1, #0
 8001d46:	2a01      	cmp	r2, #1
 8001d48:	d101      	bne.n	8001d4e <USART_GetITStatus+0xb2>
 8001d4a:	682a      	ldr	r2, [r5, #0]
 8001d4c:	e004      	b.n	8001d58 <USART_GetITStatus+0xbc>
 8001d4e:	2a02      	cmp	r2, #2
 8001d50:	d101      	bne.n	8001d56 <USART_GetITStatus+0xba>
 8001d52:	686a      	ldr	r2, [r5, #4]
 8001d54:	e000      	b.n	8001d58 <USART_GetITStatus+0xbc>
 8001d56:	68aa      	ldr	r2, [r5, #8]
 8001d58:	2000      	movs	r0, #0
 8001d5a:	4013      	ands	r3, r2
 8001d5c:	69ea      	ldr	r2, [r5, #28]
 8001d5e:	4283      	cmp	r3, r0
 8001d60:	d008      	beq.n	8001d74 <USART_GetITStatus+0xd8>
 8001d62:	0c24      	lsrs	r4, r4, #16
 8001d64:	2001      	movs	r0, #1
 8001d66:	40a0      	lsls	r0, r4
 8001d68:	1c04      	adds	r4, r0, #0
 8001d6a:	1c10      	adds	r0, r2, #0
 8001d6c:	4020      	ands	r0, r4
 8001d6e:	1e44      	subs	r4, r0, #1
 8001d70:	41a0      	sbcs	r0, r4
 8001d72:	b2c0      	uxtb	r0, r0
 8001d74:	bd38      	pop	{r3, r4, r5, pc}
 8001d76:	46c0      	nop			; (mov r8, r8)
 8001d78:	40013800 	.word	0x40013800
 8001d7c:	40004400 	.word	0x40004400
 8001d80:	40004800 	.word	0x40004800
 8001d84:	40004c00 	.word	0x40004c00
 8001d88:	40005000 	.word	0x40005000
 8001d8c:	40011400 	.word	0x40011400
 8001d90:	40011800 	.word	0x40011800
 8001d94:	bffee400 	.word	0xbffee400
 8001d98:	00070107 	.word	0x00070107
 8001d9c:	00060106 	.word	0x00060106
 8001da0:	00050105 	.word	0x00050105
 8001da4:	00040104 	.word	0x00040104
 8001da8:	00080206 	.word	0x00080206
 8001dac:	0009030a 	.word	0x0009030a
 8001db0:	00020300 	.word	0x00020300
 8001db4:	fffdffff 	.word	0xfffdffff
 8001db8:	00010300 	.word	0x00010300
 8001dbc:	000b011a 	.word	0x000b011a
 8001dc0:	000c011b 	.word	0x000c011b
 8001dc4:	0011010e 	.word	0x0011010e
 8001dc8:	ffebfcea 	.word	0xffebfcea

08001dcc <USART_ClearITPendingBit>:
 8001dcc:	b538      	push	{r3, r4, r5, lr}
 8001dce:	4b26      	ldr	r3, [pc, #152]	; (8001e68 <USART_ClearITPendingBit+0x9c>)
 8001dd0:	1c05      	adds	r5, r0, #0
 8001dd2:	1c0c      	adds	r4, r1, #0
 8001dd4:	4298      	cmp	r0, r3
 8001dd6:	d016      	beq.n	8001e06 <USART_ClearITPendingBit+0x3a>
 8001dd8:	4b24      	ldr	r3, [pc, #144]	; (8001e6c <USART_ClearITPendingBit+0xa0>)
 8001dda:	4298      	cmp	r0, r3
 8001ddc:	d013      	beq.n	8001e06 <USART_ClearITPendingBit+0x3a>
 8001dde:	4b24      	ldr	r3, [pc, #144]	; (8001e70 <USART_ClearITPendingBit+0xa4>)
 8001de0:	4298      	cmp	r0, r3
 8001de2:	d010      	beq.n	8001e06 <USART_ClearITPendingBit+0x3a>
 8001de4:	4b23      	ldr	r3, [pc, #140]	; (8001e74 <USART_ClearITPendingBit+0xa8>)
 8001de6:	4298      	cmp	r0, r3
 8001de8:	d00d      	beq.n	8001e06 <USART_ClearITPendingBit+0x3a>
 8001dea:	4b23      	ldr	r3, [pc, #140]	; (8001e78 <USART_ClearITPendingBit+0xac>)
 8001dec:	4298      	cmp	r0, r3
 8001dee:	d00a      	beq.n	8001e06 <USART_ClearITPendingBit+0x3a>
 8001df0:	4b22      	ldr	r3, [pc, #136]	; (8001e7c <USART_ClearITPendingBit+0xb0>)
 8001df2:	4298      	cmp	r0, r3
 8001df4:	d007      	beq.n	8001e06 <USART_ClearITPendingBit+0x3a>
 8001df6:	4b22      	ldr	r3, [pc, #136]	; (8001e80 <USART_ClearITPendingBit+0xb4>)
 8001df8:	4298      	cmp	r0, r3
 8001dfa:	d004      	beq.n	8001e06 <USART_ClearITPendingBit+0x3a>
 8001dfc:	4a21      	ldr	r2, [pc, #132]	; (8001e84 <USART_ClearITPendingBit+0xb8>)
 8001dfe:	1880      	adds	r0, r0, r2
 8001e00:	4243      	negs	r3, r0
 8001e02:	4158      	adcs	r0, r3
 8001e04:	e000      	b.n	8001e08 <USART_ClearITPendingBit+0x3c>
 8001e06:	2001      	movs	r0, #1
 8001e08:	f7ff fa9e 	bl	8001348 <assert_param>
 8001e0c:	4b1e      	ldr	r3, [pc, #120]	; (8001e88 <USART_ClearITPendingBit+0xbc>)
 8001e0e:	429c      	cmp	r4, r3
 8001e10:	d022      	beq.n	8001e58 <USART_ClearITPendingBit+0x8c>
 8001e12:	2384      	movs	r3, #132	; 0x84
 8001e14:	005b      	lsls	r3, r3, #1
 8001e16:	429c      	cmp	r4, r3
 8001e18:	d01e      	beq.n	8001e58 <USART_ClearITPendingBit+0x8c>
 8001e1a:	4a1c      	ldr	r2, [pc, #112]	; (8001e8c <USART_ClearITPendingBit+0xc0>)
 8001e1c:	4b1c      	ldr	r3, [pc, #112]	; (8001e90 <USART_ClearITPendingBit+0xc4>)
 8001e1e:	4022      	ands	r2, r4
 8001e20:	429a      	cmp	r2, r3
 8001e22:	d019      	beq.n	8001e58 <USART_ClearITPendingBit+0x8c>
 8001e24:	4b1b      	ldr	r3, [pc, #108]	; (8001e94 <USART_ClearITPendingBit+0xc8>)
 8001e26:	429c      	cmp	r4, r3
 8001e28:	d016      	beq.n	8001e58 <USART_ClearITPendingBit+0x8c>
 8001e2a:	4b1b      	ldr	r3, [pc, #108]	; (8001e98 <USART_ClearITPendingBit+0xcc>)
 8001e2c:	429c      	cmp	r4, r3
 8001e2e:	d013      	beq.n	8001e58 <USART_ClearITPendingBit+0x8c>
 8001e30:	4b1a      	ldr	r3, [pc, #104]	; (8001e9c <USART_ClearITPendingBit+0xd0>)
 8001e32:	429c      	cmp	r4, r3
 8001e34:	d010      	beq.n	8001e58 <USART_ClearITPendingBit+0x8c>
 8001e36:	4b1a      	ldr	r3, [pc, #104]	; (8001ea0 <USART_ClearITPendingBit+0xd4>)
 8001e38:	429c      	cmp	r4, r3
 8001e3a:	d00d      	beq.n	8001e58 <USART_ClearITPendingBit+0x8c>
 8001e3c:	4b19      	ldr	r3, [pc, #100]	; (8001ea4 <USART_ClearITPendingBit+0xd8>)
 8001e3e:	429c      	cmp	r4, r3
 8001e40:	d00a      	beq.n	8001e58 <USART_ClearITPendingBit+0x8c>
 8001e42:	4b19      	ldr	r3, [pc, #100]	; (8001ea8 <USART_ClearITPendingBit+0xdc>)
 8001e44:	429c      	cmp	r4, r3
 8001e46:	d007      	beq.n	8001e58 <USART_ClearITPendingBit+0x8c>
 8001e48:	4b18      	ldr	r3, [pc, #96]	; (8001eac <USART_ClearITPendingBit+0xe0>)
 8001e4a:	429c      	cmp	r4, r3
 8001e4c:	d004      	beq.n	8001e58 <USART_ClearITPendingBit+0x8c>
 8001e4e:	4a18      	ldr	r2, [pc, #96]	; (8001eb0 <USART_ClearITPendingBit+0xe4>)
 8001e50:	18a3      	adds	r3, r4, r2
 8001e52:	4258      	negs	r0, r3
 8001e54:	4158      	adcs	r0, r3
 8001e56:	e000      	b.n	8001e5a <USART_ClearITPendingBit+0x8e>
 8001e58:	2001      	movs	r0, #1
 8001e5a:	f7ff fa75 	bl	8001348 <assert_param>
 8001e5e:	0c24      	lsrs	r4, r4, #16
 8001e60:	2301      	movs	r3, #1
 8001e62:	40a3      	lsls	r3, r4
 8001e64:	622b      	str	r3, [r5, #32]
 8001e66:	bd38      	pop	{r3, r4, r5, pc}
 8001e68:	40013800 	.word	0x40013800
 8001e6c:	40004400 	.word	0x40004400
 8001e70:	40004800 	.word	0x40004800
 8001e74:	40004c00 	.word	0x40004c00
 8001e78:	40005000 	.word	0x40005000
 8001e7c:	40011400 	.word	0x40011400
 8001e80:	40011800 	.word	0x40011800
 8001e84:	bffee400 	.word	0xbffee400
 8001e88:	00060106 	.word	0x00060106
 8001e8c:	fffdffff 	.word	0xfffdffff
 8001e90:	00010300 	.word	0x00010300
 8001e94:	00020300 	.word	0x00020300
 8001e98:	00040104 	.word	0x00040104
 8001e9c:	00080206 	.word	0x00080206
 8001ea0:	0009030a 	.word	0x0009030a
 8001ea4:	000b011a 	.word	0x000b011a
 8001ea8:	000c011b 	.word	0x000c011b
 8001eac:	0011010e 	.word	0x0011010e
 8001eb0:	ffebfcea 	.word	0xffebfcea

08001eb4 <ADC_DeInit>:
 8001eb4:	4b0a      	ldr	r3, [pc, #40]	; (8001ee0 <ADC_DeInit+0x2c>)
 8001eb6:	b510      	push	{r4, lr}
 8001eb8:	18c4      	adds	r4, r0, r3
 8001eba:	4263      	negs	r3, r4
 8001ebc:	415c      	adcs	r4, r3
 8001ebe:	b2e4      	uxtb	r4, r4
 8001ec0:	1c20      	adds	r0, r4, #0
 8001ec2:	f7ff fa41 	bl	8001348 <assert_param>
 8001ec6:	2c00      	cmp	r4, #0
 8001ec8:	d009      	beq.n	8001ede <ADC_DeInit+0x2a>
 8001eca:	2080      	movs	r0, #128	; 0x80
 8001ecc:	0080      	lsls	r0, r0, #2
 8001ece:	2101      	movs	r1, #1
 8001ed0:	f000 face 	bl	8002470 <RCC_APB2PeriphResetCmd>
 8001ed4:	2080      	movs	r0, #128	; 0x80
 8001ed6:	0080      	lsls	r0, r0, #2
 8001ed8:	2100      	movs	r1, #0
 8001eda:	f000 fac9 	bl	8002470 <RCC_APB2PeriphResetCmd>
 8001ede:	bd10      	pop	{r4, pc}
 8001ee0:	bffedc00 	.word	0xbffedc00

08001ee4 <ADC_Init>:
 8001ee4:	b570      	push	{r4, r5, r6, lr}
 8001ee6:	1c0c      	adds	r4, r1, #0
 8001ee8:	4924      	ldr	r1, [pc, #144]	; (8001f7c <ADC_Init+0x98>)
 8001eea:	1c05      	adds	r5, r0, #0
 8001eec:	1840      	adds	r0, r0, r1
 8001eee:	4243      	negs	r3, r0
 8001ef0:	4158      	adcs	r0, r3
 8001ef2:	f7ff fa29 	bl	8001348 <assert_param>
 8001ef6:	6820      	ldr	r0, [r4, #0]
 8001ef8:	2318      	movs	r3, #24
 8001efa:	4398      	bics	r0, r3
 8001efc:	4243      	negs	r3, r0
 8001efe:	4158      	adcs	r0, r3
 8001f00:	f7ff fa22 	bl	8001348 <assert_param>
 8001f04:	7923      	ldrb	r3, [r4, #4]
 8001f06:	2601      	movs	r6, #1
 8001f08:	2000      	movs	r0, #0
 8001f0a:	429e      	cmp	r6, r3
 8001f0c:	4140      	adcs	r0, r0
 8001f0e:	f7ff fa1b 	bl	8001348 <assert_param>
 8001f12:	68a3      	ldr	r3, [r4, #8]
 8001f14:	481a      	ldr	r0, [pc, #104]	; (8001f80 <ADC_Init+0x9c>)
 8001f16:	4018      	ands	r0, r3
 8001f18:	4243      	negs	r3, r0
 8001f1a:	4158      	adcs	r0, r3
 8001f1c:	f7ff fa14 	bl	8001348 <assert_param>
 8001f20:	68e3      	ldr	r3, [r4, #12]
 8001f22:	22c0      	movs	r2, #192	; 0xc0
 8001f24:	1c19      	adds	r1, r3, #0
 8001f26:	4391      	bics	r1, r2
 8001f28:	1c30      	adds	r0, r6, #0
 8001f2a:	2900      	cmp	r1, #0
 8001f2c:	d003      	beq.n	8001f36 <ADC_Init+0x52>
 8001f2e:	1e58      	subs	r0, r3, #1
 8001f30:	38ff      	subs	r0, #255	; 0xff
 8001f32:	4243      	negs	r3, r0
 8001f34:	4158      	adcs	r0, r3
 8001f36:	f7ff fa07 	bl	8001348 <assert_param>
 8001f3a:	6920      	ldr	r0, [r4, #16]
 8001f3c:	2320      	movs	r3, #32
 8001f3e:	4398      	bics	r0, r3
 8001f40:	4243      	negs	r3, r0
 8001f42:	4158      	adcs	r0, r3
 8001f44:	f7ff fa00 	bl	8001348 <assert_param>
 8001f48:	6960      	ldr	r0, [r4, #20]
 8001f4a:	2304      	movs	r3, #4
 8001f4c:	4398      	bics	r0, r3
 8001f4e:	4243      	negs	r3, r0
 8001f50:	4158      	adcs	r0, r3
 8001f52:	f7ff f9f9 	bl	8001348 <assert_param>
 8001f56:	6823      	ldr	r3, [r4, #0]
 8001f58:	68a2      	ldr	r2, [r4, #8]
 8001f5a:	68e9      	ldr	r1, [r5, #12]
 8001f5c:	431a      	orrs	r2, r3
 8001f5e:	68e3      	ldr	r3, [r4, #12]
 8001f60:	431a      	orrs	r2, r3
 8001f62:	6923      	ldr	r3, [r4, #16]
 8001f64:	431a      	orrs	r2, r3
 8001f66:	6963      	ldr	r3, [r4, #20]
 8001f68:	431a      	orrs	r2, r3
 8001f6a:	4b06      	ldr	r3, [pc, #24]	; (8001f84 <ADC_Init+0xa0>)
 8001f6c:	400b      	ands	r3, r1
 8001f6e:	4313      	orrs	r3, r2
 8001f70:	7922      	ldrb	r2, [r4, #4]
 8001f72:	0352      	lsls	r2, r2, #13
 8001f74:	4313      	orrs	r3, r2
 8001f76:	60eb      	str	r3, [r5, #12]
 8001f78:	bd70      	pop	{r4, r5, r6, pc}
 8001f7a:	46c0      	nop			; (mov r8, r8)
 8001f7c:	bffedc00 	.word	0xbffedc00
 8001f80:	fffff3ff 	.word	0xfffff3ff
 8001f84:	ffffd203 	.word	0xffffd203

08001f88 <ADC_Cmd>:
 8001f88:	4b0c      	ldr	r3, [pc, #48]	; (8001fbc <ADC_Cmd+0x34>)
 8001f8a:	b570      	push	{r4, r5, r6, lr}
 8001f8c:	1c04      	adds	r4, r0, #0
 8001f8e:	18c0      	adds	r0, r0, r3
 8001f90:	4243      	negs	r3, r0
 8001f92:	4158      	adcs	r0, r3
 8001f94:	1c0e      	adds	r6, r1, #0
 8001f96:	2501      	movs	r5, #1
 8001f98:	f7ff f9d6 	bl	8001348 <assert_param>
 8001f9c:	2000      	movs	r0, #0
 8001f9e:	42b5      	cmp	r5, r6
 8001fa0:	4140      	adcs	r0, r0
 8001fa2:	f7ff f9d1 	bl	8001348 <assert_param>
 8001fa6:	68a3      	ldr	r3, [r4, #8]
 8001fa8:	2e00      	cmp	r6, #0
 8001faa:	d002      	beq.n	8001fb2 <ADC_Cmd+0x2a>
 8001fac:	431d      	orrs	r5, r3
 8001fae:	60a5      	str	r5, [r4, #8]
 8001fb0:	e002      	b.n	8001fb8 <ADC_Cmd+0x30>
 8001fb2:	2202      	movs	r2, #2
 8001fb4:	4313      	orrs	r3, r2
 8001fb6:	60a3      	str	r3, [r4, #8]
 8001fb8:	bd70      	pop	{r4, r5, r6, pc}
 8001fba:	46c0      	nop			; (mov r8, r8)
 8001fbc:	bffedc00 	.word	0xbffedc00

08001fc0 <ADC_TempSensorCmd>:
 8001fc0:	2301      	movs	r3, #1
 8001fc2:	b510      	push	{r4, lr}
 8001fc4:	1c04      	adds	r4, r0, #0
 8001fc6:	2000      	movs	r0, #0
 8001fc8:	42a3      	cmp	r3, r4
 8001fca:	4140      	adcs	r0, r0
 8001fcc:	f7ff f9bc 	bl	8001348 <assert_param>
 8001fd0:	4b05      	ldr	r3, [pc, #20]	; (8001fe8 <ADC_TempSensorCmd+0x28>)
 8001fd2:	6819      	ldr	r1, [r3, #0]
 8001fd4:	2c00      	cmp	r4, #0
 8001fd6:	d003      	beq.n	8001fe0 <ADC_TempSensorCmd+0x20>
 8001fd8:	2280      	movs	r2, #128	; 0x80
 8001fda:	0412      	lsls	r2, r2, #16
 8001fdc:	430a      	orrs	r2, r1
 8001fde:	e001      	b.n	8001fe4 <ADC_TempSensorCmd+0x24>
 8001fe0:	4a02      	ldr	r2, [pc, #8]	; (8001fec <ADC_TempSensorCmd+0x2c>)
 8001fe2:	400a      	ands	r2, r1
 8001fe4:	601a      	str	r2, [r3, #0]
 8001fe6:	bd10      	pop	{r4, pc}
 8001fe8:	40012708 	.word	0x40012708
 8001fec:	ff7fffff 	.word	0xff7fffff

08001ff0 <ADC_ChannelConfig>:
 8001ff0:	4b0e      	ldr	r3, [pc, #56]	; (800202c <ADC_ChannelConfig+0x3c>)
 8001ff2:	b570      	push	{r4, r5, r6, lr}
 8001ff4:	1c04      	adds	r4, r0, #0
 8001ff6:	18c0      	adds	r0, r0, r3
 8001ff8:	4243      	negs	r3, r0
 8001ffa:	4158      	adcs	r0, r3
 8001ffc:	1c0d      	adds	r5, r1, #0
 8001ffe:	1c16      	adds	r6, r2, #0
 8002000:	f7ff f9a2 	bl	8001348 <assert_param>
 8002004:	2000      	movs	r0, #0
 8002006:	4285      	cmp	r5, r0
 8002008:	d002      	beq.n	8002010 <ADC_ChannelConfig+0x20>
 800200a:	0ce8      	lsrs	r0, r5, #19
 800200c:	4243      	negs	r3, r0
 800200e:	4158      	adcs	r0, r3
 8002010:	f7ff f99a 	bl	8001348 <assert_param>
 8002014:	2307      	movs	r3, #7
 8002016:	2000      	movs	r0, #0
 8002018:	42b3      	cmp	r3, r6
 800201a:	4140      	adcs	r0, r0
 800201c:	f7ff f994 	bl	8001348 <assert_param>
 8002020:	6aa3      	ldr	r3, [r4, #40]	; 0x28
 8002022:	431d      	orrs	r5, r3
 8002024:	62a5      	str	r5, [r4, #40]	; 0x28
 8002026:	6166      	str	r6, [r4, #20]
 8002028:	bd70      	pop	{r4, r5, r6, pc}
 800202a:	46c0      	nop			; (mov r8, r8)
 800202c:	bffedc00 	.word	0xbffedc00

08002030 <ADC_GetCalibrationFactor>:
 8002030:	4b0e      	ldr	r3, [pc, #56]	; (800206c <ADC_GetCalibrationFactor+0x3c>)
 8002032:	b510      	push	{r4, lr}
 8002034:	1c04      	adds	r4, r0, #0
 8002036:	18c0      	adds	r0, r0, r3
 8002038:	4243      	negs	r3, r0
 800203a:	4158      	adcs	r0, r3
 800203c:	f7ff f984 	bl	8001348 <assert_param>
 8002040:	68a2      	ldr	r2, [r4, #8]
 8002042:	2380      	movs	r3, #128	; 0x80
 8002044:	061b      	lsls	r3, r3, #24
 8002046:	4313      	orrs	r3, r2
 8002048:	60a3      	str	r3, [r4, #8]
 800204a:	23f0      	movs	r3, #240	; 0xf0
 800204c:	021b      	lsls	r3, r3, #8
 800204e:	68a2      	ldr	r2, [r4, #8]
 8002050:	3b01      	subs	r3, #1
 8002052:	0fd2      	lsrs	r2, r2, #31
 8002054:	07d2      	lsls	r2, r2, #31
 8002056:	2b00      	cmp	r3, #0
 8002058:	d001      	beq.n	800205e <ADC_GetCalibrationFactor+0x2e>
 800205a:	2a00      	cmp	r2, #0
 800205c:	d1f7      	bne.n	800204e <ADC_GetCalibrationFactor+0x1e>
 800205e:	68a3      	ldr	r3, [r4, #8]
 8002060:	2b00      	cmp	r3, #0
 8002062:	db01      	blt.n	8002068 <ADC_GetCalibrationFactor+0x38>
 8002064:	6c20      	ldr	r0, [r4, #64]	; 0x40
 8002066:	e000      	b.n	800206a <ADC_GetCalibrationFactor+0x3a>
 8002068:	2000      	movs	r0, #0
 800206a:	bd10      	pop	{r4, pc}
 800206c:	bffedc00 	.word	0xbffedc00

08002070 <ADC_StartOfConversion>:
 8002070:	4b06      	ldr	r3, [pc, #24]	; (800208c <ADC_StartOfConversion+0x1c>)
 8002072:	b510      	push	{r4, lr}
 8002074:	1c04      	adds	r4, r0, #0
 8002076:	18c0      	adds	r0, r0, r3
 8002078:	4243      	negs	r3, r0
 800207a:	4158      	adcs	r0, r3
 800207c:	f7ff f964 	bl	8001348 <assert_param>
 8002080:	68a3      	ldr	r3, [r4, #8]
 8002082:	2204      	movs	r2, #4
 8002084:	4313      	orrs	r3, r2
 8002086:	60a3      	str	r3, [r4, #8]
 8002088:	bd10      	pop	{r4, pc}
 800208a:	46c0      	nop			; (mov r8, r8)
 800208c:	bffedc00 	.word	0xbffedc00

08002090 <ADC_GetConversionValue>:
 8002090:	4b05      	ldr	r3, [pc, #20]	; (80020a8 <ADC_GetConversionValue+0x18>)
 8002092:	b510      	push	{r4, lr}
 8002094:	1c04      	adds	r4, r0, #0
 8002096:	18c0      	adds	r0, r0, r3
 8002098:	4243      	negs	r3, r0
 800209a:	4158      	adcs	r0, r3
 800209c:	f7ff f954 	bl	8001348 <assert_param>
 80020a0:	6c20      	ldr	r0, [r4, #64]	; 0x40
 80020a2:	b280      	uxth	r0, r0
 80020a4:	bd10      	pop	{r4, pc}
 80020a6:	46c0      	nop			; (mov r8, r8)
 80020a8:	bffedc00 	.word	0xbffedc00

080020ac <ADC_GetFlagStatus>:
 80020ac:	4a15      	ldr	r2, [pc, #84]	; (8002104 <ADC_GetFlagStatus+0x58>)
 80020ae:	b570      	push	{r4, r5, r6, lr}
 80020b0:	1c05      	adds	r5, r0, #0
 80020b2:	1880      	adds	r0, r0, r2
 80020b4:	1c0c      	adds	r4, r1, #0
 80020b6:	4243      	negs	r3, r0
 80020b8:	4158      	adcs	r0, r3
 80020ba:	4e13      	ldr	r6, [pc, #76]	; (8002108 <ADC_GetFlagStatus+0x5c>)
 80020bc:	f7ff f944 	bl	8001348 <assert_param>
 80020c0:	1c23      	adds	r3, r4, #0
 80020c2:	4033      	ands	r3, r6
 80020c4:	1e5a      	subs	r2, r3, #1
 80020c6:	2a01      	cmp	r2, #1
 80020c8:	d90d      	bls.n	80020e6 <ADC_GetFlagStatus+0x3a>
 80020ca:	2b04      	cmp	r3, #4
 80020cc:	d00b      	beq.n	80020e6 <ADC_GetFlagStatus+0x3a>
 80020ce:	2c08      	cmp	r4, #8
 80020d0:	d009      	beq.n	80020e6 <ADC_GetFlagStatus+0x3a>
 80020d2:	2c80      	cmp	r4, #128	; 0x80
 80020d4:	d007      	beq.n	80020e6 <ADC_GetFlagStatus+0x3a>
 80020d6:	2b10      	cmp	r3, #16
 80020d8:	d005      	beq.n	80020e6 <ADC_GetFlagStatus+0x3a>
 80020da:	22fe      	movs	r2, #254	; 0xfe
 80020dc:	05d2      	lsls	r2, r2, #23
 80020de:	18a3      	adds	r3, r4, r2
 80020e0:	4258      	negs	r0, r3
 80020e2:	4158      	adcs	r0, r3
 80020e4:	e000      	b.n	80020e8 <ADC_GetFlagStatus+0x3c>
 80020e6:	2001      	movs	r0, #1
 80020e8:	f7ff f92e 	bl	8001348 <assert_param>
 80020ec:	01e3      	lsls	r3, r4, #7
 80020ee:	d502      	bpl.n	80020f6 <ADC_GetFlagStatus+0x4a>
 80020f0:	68ab      	ldr	r3, [r5, #8]
 80020f2:	401e      	ands	r6, r3
 80020f4:	e000      	b.n	80020f8 <ADC_GetFlagStatus+0x4c>
 80020f6:	682e      	ldr	r6, [r5, #0]
 80020f8:	4026      	ands	r6, r4
 80020fa:	1e74      	subs	r4, r6, #1
 80020fc:	41a6      	sbcs	r6, r4
 80020fe:	b2f0      	uxtb	r0, r6
 8002100:	bd70      	pop	{r4, r5, r6, pc}
 8002102:	46c0      	nop			; (mov r8, r8)
 8002104:	bffedc00 	.word	0xbffedc00
 8002108:	feffffff 	.word	0xfeffffff

0800210c <ADC_ClearFlag>:
 800210c:	b538      	push	{r3, r4, r5, lr}
 800210e:	4b0a      	ldr	r3, [pc, #40]	; (8002138 <ADC_ClearFlag+0x2c>)
 8002110:	1c05      	adds	r5, r0, #0
 8002112:	18c0      	adds	r0, r0, r3
 8002114:	4243      	negs	r3, r0
 8002116:	4158      	adcs	r0, r3
 8002118:	1c0c      	adds	r4, r1, #0
 800211a:	f7ff f915 	bl	8001348 <assert_param>
 800211e:	2000      	movs	r0, #0
 8002120:	4284      	cmp	r4, r0
 8002122:	d004      	beq.n	800212e <ADC_ClearFlag+0x22>
 8002124:	239f      	movs	r3, #159	; 0x9f
 8002126:	1c20      	adds	r0, r4, #0
 8002128:	4398      	bics	r0, r3
 800212a:	4243      	negs	r3, r0
 800212c:	4158      	adcs	r0, r3
 800212e:	f7ff f90b 	bl	8001348 <assert_param>
 8002132:	602c      	str	r4, [r5, #0]
 8002134:	bd38      	pop	{r3, r4, r5, pc}
 8002136:	46c0      	nop			; (mov r8, r8)
 8002138:	bffedc00 	.word	0xbffedc00

0800213c <NVIC_Init>:
 800213c:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
 800213e:	2500      	movs	r5, #0
 8002140:	7883      	ldrb	r3, [r0, #2]
 8002142:	1c04      	adds	r4, r0, #0
 8002144:	2601      	movs	r6, #1
 8002146:	1c28      	adds	r0, r5, #0
 8002148:	429e      	cmp	r6, r3
 800214a:	4168      	adcs	r0, r5
 800214c:	f7ff f8fc 	bl	8001348 <assert_param>
 8002150:	7863      	ldrb	r3, [r4, #1]
 8002152:	2703      	movs	r7, #3
 8002154:	1c28      	adds	r0, r5, #0
 8002156:	429f      	cmp	r7, r3
 8002158:	4168      	adcs	r0, r5
 800215a:	f7ff f8f5 	bl	8001348 <assert_param>
 800215e:	78a2      	ldrb	r2, [r4, #2]
 8002160:	7823      	ldrb	r3, [r4, #0]
 8002162:	42aa      	cmp	r2, r5
 8002164:	d01a      	beq.n	800219c <NVIC_Init+0x60>
 8002166:	0899      	lsrs	r1, r3, #2
 8002168:	4a0f      	ldr	r2, [pc, #60]	; (80021a8 <NVIC_Init+0x6c>)
 800216a:	0089      	lsls	r1, r1, #2
 800216c:	1889      	adds	r1, r1, r2
 800216e:	22c0      	movs	r2, #192	; 0xc0
 8002170:	0092      	lsls	r2, r2, #2
 8002172:	401f      	ands	r7, r3
 8002174:	20ff      	movs	r0, #255	; 0xff
 8002176:	588d      	ldr	r5, [r1, r2]
 8002178:	00ff      	lsls	r7, r7, #3
 800217a:	1c03      	adds	r3, r0, #0
 800217c:	40bb      	lsls	r3, r7
 800217e:	439d      	bics	r5, r3
 8002180:	7863      	ldrb	r3, [r4, #1]
 8002182:	019b      	lsls	r3, r3, #6
 8002184:	4018      	ands	r0, r3
 8002186:	40b8      	lsls	r0, r7
 8002188:	1c2f      	adds	r7, r5, #0
 800218a:	4307      	orrs	r7, r0
 800218c:	508f      	str	r7, [r1, r2]
 800218e:	7822      	ldrb	r2, [r4, #0]
 8002190:	231f      	movs	r3, #31
 8002192:	4013      	ands	r3, r2
 8002194:	409e      	lsls	r6, r3
 8002196:	4b04      	ldr	r3, [pc, #16]	; (80021a8 <NVIC_Init+0x6c>)
 8002198:	601e      	str	r6, [r3, #0]
 800219a:	e004      	b.n	80021a6 <NVIC_Init+0x6a>
 800219c:	271f      	movs	r7, #31
 800219e:	403b      	ands	r3, r7
 80021a0:	4a02      	ldr	r2, [pc, #8]	; (80021ac <NVIC_Init+0x70>)
 80021a2:	409e      	lsls	r6, r3
 80021a4:	67d6      	str	r6, [r2, #124]	; 0x7c
 80021a6:	bdf8      	pop	{r3, r4, r5, r6, r7, pc}
 80021a8:	e000e100 	.word	0xe000e100
 80021ac:	e000e104 	.word	0xe000e104

080021b0 <RCC_HSI14Cmd>:
 80021b0:	b538      	push	{r3, r4, r5, lr}
 80021b2:	1c05      	adds	r5, r0, #0
 80021b4:	2401      	movs	r4, #1
 80021b6:	2000      	movs	r0, #0
 80021b8:	42ac      	cmp	r4, r5
 80021ba:	4140      	adcs	r0, r0
 80021bc:	f7ff f8c4 	bl	8001348 <assert_param>
 80021c0:	4b04      	ldr	r3, [pc, #16]	; (80021d4 <RCC_HSI14Cmd+0x24>)
 80021c2:	6b5a      	ldr	r2, [r3, #52]	; 0x34
 80021c4:	2d00      	cmp	r5, #0
 80021c6:	d002      	beq.n	80021ce <RCC_HSI14Cmd+0x1e>
 80021c8:	4314      	orrs	r4, r2
 80021ca:	635c      	str	r4, [r3, #52]	; 0x34
 80021cc:	e001      	b.n	80021d2 <RCC_HSI14Cmd+0x22>
 80021ce:	43a2      	bics	r2, r4
 80021d0:	635a      	str	r2, [r3, #52]	; 0x34
 80021d2:	bd38      	pop	{r3, r4, r5, pc}
 80021d4:	40021000 	.word	0x40021000

080021d8 <RCC_ADCCLKConfig>:
 80021d8:	4b0e      	ldr	r3, [pc, #56]	; (8002214 <RCC_ADCCLKConfig+0x3c>)
 80021da:	b510      	push	{r4, lr}
 80021dc:	1c04      	adds	r4, r0, #0
 80021de:	2001      	movs	r0, #1
 80021e0:	421c      	tst	r4, r3
 80021e2:	d003      	beq.n	80021ec <RCC_ADCCLKConfig+0x14>
 80021e4:	4b0c      	ldr	r3, [pc, #48]	; (8002218 <RCC_ADCCLKConfig+0x40>)
 80021e6:	18e0      	adds	r0, r4, r3
 80021e8:	4243      	negs	r3, r0
 80021ea:	4158      	adcs	r0, r3
 80021ec:	f7ff f8ac 	bl	8001348 <assert_param>
 80021f0:	4b0a      	ldr	r3, [pc, #40]	; (800221c <RCC_ADCCLKConfig+0x44>)
 80021f2:	4a0b      	ldr	r2, [pc, #44]	; (8002220 <RCC_ADCCLKConfig+0x48>)
 80021f4:	6859      	ldr	r1, [r3, #4]
 80021f6:	400a      	ands	r2, r1
 80021f8:	605a      	str	r2, [r3, #4]
 80021fa:	685a      	ldr	r2, [r3, #4]
 80021fc:	b2a1      	uxth	r1, r4
 80021fe:	430a      	orrs	r2, r1
 8002200:	605a      	str	r2, [r3, #4]
 8002202:	6b19      	ldr	r1, [r3, #48]	; 0x30
 8002204:	4a07      	ldr	r2, [pc, #28]	; (8002224 <RCC_ADCCLKConfig+0x4c>)
 8002206:	0c24      	lsrs	r4, r4, #16
 8002208:	400a      	ands	r2, r1
 800220a:	631a      	str	r2, [r3, #48]	; 0x30
 800220c:	6b1a      	ldr	r2, [r3, #48]	; 0x30
 800220e:	4314      	orrs	r4, r2
 8002210:	631c      	str	r4, [r3, #48]	; 0x30
 8002212:	bd10      	pop	{r4, pc}
 8002214:	feffffff 	.word	0xfeffffff
 8002218:	feffc000 	.word	0xfeffc000
 800221c:	40021000 	.word	0x40021000
 8002220:	ffffbfff 	.word	0xffffbfff
 8002224:	fffffeff 	.word	0xfffffeff

08002228 <RCC_GetClocksFreq>:
 8002228:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
 800222a:	4d5a      	ldr	r5, [pc, #360]	; (8002394 <RCC_GetClocksFreq+0x16c>)
 800222c:	1c04      	adds	r4, r0, #0
 800222e:	6868      	ldr	r0, [r5, #4]
 8002230:	230c      	movs	r3, #12
 8002232:	4018      	ands	r0, r3
 8002234:	f000 fa14 	bl	8002660 <__gnu_thumb1_case_uqi>
 8002238:	1f1f1f1f 	.word	0x1f1f1f1f
 800223c:	1f1f1f1f 	.word	0x1f1f1f1f
 8002240:	1f1f1f07 	.word	0x1f1f1f07
 8002244:	1d          	.byte	0x1d
 8002245:	00          	.byte	0x00
 8002246:	686e      	ldr	r6, [r5, #4]
 8002248:	23c0      	movs	r3, #192	; 0xc0
 800224a:	02b6      	lsls	r6, r6, #10
 800224c:	686a      	ldr	r2, [r5, #4]
 800224e:	0f36      	lsrs	r6, r6, #28
 8002250:	025b      	lsls	r3, r3, #9
 8002252:	3602      	adds	r6, #2
 8002254:	421a      	tst	r2, r3
 8002256:	d101      	bne.n	800225c <RCC_GetClocksFreq+0x34>
 8002258:	484f      	ldr	r0, [pc, #316]	; (8002398 <RCC_GetClocksFreq+0x170>)
 800225a:	e007      	b.n	800226c <RCC_GetClocksFreq+0x44>
 800225c:	4b4d      	ldr	r3, [pc, #308]	; (8002394 <RCC_GetClocksFreq+0x16c>)
 800225e:	484f      	ldr	r0, [pc, #316]	; (800239c <RCC_GetClocksFreq+0x174>)
 8002260:	6ad9      	ldr	r1, [r3, #44]	; 0x2c
 8002262:	230f      	movs	r3, #15
 8002264:	4019      	ands	r1, r3
 8002266:	3101      	adds	r1, #1
 8002268:	f000 fa04 	bl	8002674 <__aeabi_uidiv>
 800226c:	4370      	muls	r0, r6
 800226e:	6020      	str	r0, [r4, #0]
 8002270:	e004      	b.n	800227c <RCC_GetClocksFreq+0x54>
 8002272:	4b4b      	ldr	r3, [pc, #300]	; (80023a0 <RCC_GetClocksFreq+0x178>)
 8002274:	e000      	b.n	8002278 <RCC_GetClocksFreq+0x50>
 8002276:	4b49      	ldr	r3, [pc, #292]	; (800239c <RCC_GetClocksFreq+0x174>)
 8002278:	6023      	str	r3, [r4, #0]
 800227a:	2000      	movs	r0, #0
 800227c:	686b      	ldr	r3, [r5, #4]
 800227e:	4a49      	ldr	r2, [pc, #292]	; (80023a4 <RCC_GetClocksFreq+0x17c>)
 8002280:	061b      	lsls	r3, r3, #24
 8002282:	0f1b      	lsrs	r3, r3, #28
 8002284:	6821      	ldr	r1, [r4, #0]
 8002286:	5cd3      	ldrb	r3, [r2, r3]
 8002288:	1c0e      	adds	r6, r1, #0
 800228a:	40de      	lsrs	r6, r3
 800228c:	6066      	str	r6, [r4, #4]
 800228e:	1c33      	adds	r3, r6, #0
 8002290:	686e      	ldr	r6, [r5, #4]
 8002292:	0576      	lsls	r6, r6, #21
 8002294:	0f76      	lsrs	r6, r6, #29
 8002296:	5d92      	ldrb	r2, [r2, r6]
 8002298:	40d3      	lsrs	r3, r2
 800229a:	60a3      	str	r3, [r4, #8]
 800229c:	6b2a      	ldr	r2, [r5, #48]	; 0x30
 800229e:	05d6      	lsls	r6, r2, #23
 80022a0:	d401      	bmi.n	80022a6 <RCC_GetClocksFreq+0x7e>
 80022a2:	4a41      	ldr	r2, [pc, #260]	; (80023a8 <RCC_GetClocksFreq+0x180>)
 80022a4:	e006      	b.n	80022b4 <RCC_GetClocksFreq+0x8c>
 80022a6:	4a3b      	ldr	r2, [pc, #236]	; (8002394 <RCC_GetClocksFreq+0x16c>)
 80022a8:	6852      	ldr	r2, [r2, #4]
 80022aa:	0456      	lsls	r6, r2, #17
 80022ac:	d401      	bmi.n	80022b2 <RCC_GetClocksFreq+0x8a>
 80022ae:	085a      	lsrs	r2, r3, #1
 80022b0:	e000      	b.n	80022b4 <RCC_GetClocksFreq+0x8c>
 80022b2:	089a      	lsrs	r2, r3, #2
 80022b4:	60e2      	str	r2, [r4, #12]
 80022b6:	6b2a      	ldr	r2, [r5, #48]	; 0x30
 80022b8:	0656      	lsls	r6, r2, #25
 80022ba:	d401      	bmi.n	80022c0 <RCC_GetClocksFreq+0x98>
 80022bc:	4a3b      	ldr	r2, [pc, #236]	; (80023ac <RCC_GetClocksFreq+0x184>)
 80022be:	e001      	b.n	80022c4 <RCC_GetClocksFreq+0x9c>
 80022c0:	2280      	movs	r2, #128	; 0x80
 80022c2:	0212      	lsls	r2, r2, #8
 80022c4:	6122      	str	r2, [r4, #16]
 80022c6:	6b2a      	ldr	r2, [r5, #48]	; 0x30
 80022c8:	06d6      	lsls	r6, r2, #27
 80022ca:	d402      	bmi.n	80022d2 <RCC_GetClocksFreq+0xaa>
 80022cc:	4a33      	ldr	r2, [pc, #204]	; (800239c <RCC_GetClocksFreq+0x174>)
 80022ce:	6162      	str	r2, [r4, #20]
 80022d0:	e000      	b.n	80022d4 <RCC_GetClocksFreq+0xac>
 80022d2:	6161      	str	r1, [r4, #20]
 80022d4:	6b2f      	ldr	r7, [r5, #48]	; 0x30
 80022d6:	2203      	movs	r2, #3
 80022d8:	4e2e      	ldr	r6, [pc, #184]	; (8002394 <RCC_GetClocksFreq+0x16c>)
 80022da:	4217      	tst	r7, r2
 80022dc:	d101      	bne.n	80022e2 <RCC_GetClocksFreq+0xba>
 80022de:	61a3      	str	r3, [r4, #24]
 80022e0:	e012      	b.n	8002308 <RCC_GetClocksFreq+0xe0>
 80022e2:	6b37      	ldr	r7, [r6, #48]	; 0x30
 80022e4:	4017      	ands	r7, r2
 80022e6:	2f01      	cmp	r7, #1
 80022e8:	d101      	bne.n	80022ee <RCC_GetClocksFreq+0xc6>
 80022ea:	61a1      	str	r1, [r4, #24]
 80022ec:	e00c      	b.n	8002308 <RCC_GetClocksFreq+0xe0>
 80022ee:	6b37      	ldr	r7, [r6, #48]	; 0x30
 80022f0:	4017      	ands	r7, r2
 80022f2:	2f02      	cmp	r7, #2
 80022f4:	d102      	bne.n	80022fc <RCC_GetClocksFreq+0xd4>
 80022f6:	2280      	movs	r2, #128	; 0x80
 80022f8:	0212      	lsls	r2, r2, #8
 80022fa:	e004      	b.n	8002306 <RCC_GetClocksFreq+0xde>
 80022fc:	6b36      	ldr	r6, [r6, #48]	; 0x30
 80022fe:	4032      	ands	r2, r6
 8002300:	2a03      	cmp	r2, #3
 8002302:	d101      	bne.n	8002308 <RCC_GetClocksFreq+0xe0>
 8002304:	4a25      	ldr	r2, [pc, #148]	; (800239c <RCC_GetClocksFreq+0x174>)
 8002306:	61a2      	str	r2, [r4, #24]
 8002308:	22c0      	movs	r2, #192	; 0xc0
 800230a:	6b2f      	ldr	r7, [r5, #48]	; 0x30
 800230c:	0292      	lsls	r2, r2, #10
 800230e:	4e21      	ldr	r6, [pc, #132]	; (8002394 <RCC_GetClocksFreq+0x16c>)
 8002310:	4217      	tst	r7, r2
 8002312:	d101      	bne.n	8002318 <RCC_GetClocksFreq+0xf0>
 8002314:	61e3      	str	r3, [r4, #28]
 8002316:	e018      	b.n	800234a <RCC_GetClocksFreq+0x122>
 8002318:	6b37      	ldr	r7, [r6, #48]	; 0x30
 800231a:	4017      	ands	r7, r2
 800231c:	46bc      	mov	ip, r7
 800231e:	2780      	movs	r7, #128	; 0x80
 8002320:	027f      	lsls	r7, r7, #9
 8002322:	45bc      	cmp	ip, r7
 8002324:	d101      	bne.n	800232a <RCC_GetClocksFreq+0x102>
 8002326:	61e1      	str	r1, [r4, #28]
 8002328:	e00f      	b.n	800234a <RCC_GetClocksFreq+0x122>
 800232a:	6b37      	ldr	r7, [r6, #48]	; 0x30
 800232c:	4017      	ands	r7, r2
 800232e:	46bc      	mov	ip, r7
 8002330:	2780      	movs	r7, #128	; 0x80
 8002332:	02bf      	lsls	r7, r7, #10
 8002334:	45bc      	cmp	ip, r7
 8002336:	d102      	bne.n	800233e <RCC_GetClocksFreq+0x116>
 8002338:	2280      	movs	r2, #128	; 0x80
 800233a:	0212      	lsls	r2, r2, #8
 800233c:	e004      	b.n	8002348 <RCC_GetClocksFreq+0x120>
 800233e:	6b36      	ldr	r6, [r6, #48]	; 0x30
 8002340:	4016      	ands	r6, r2
 8002342:	4296      	cmp	r6, r2
 8002344:	d101      	bne.n	800234a <RCC_GetClocksFreq+0x122>
 8002346:	4a15      	ldr	r2, [pc, #84]	; (800239c <RCC_GetClocksFreq+0x174>)
 8002348:	61e2      	str	r2, [r4, #28]
 800234a:	22c0      	movs	r2, #192	; 0xc0
 800234c:	6b2f      	ldr	r7, [r5, #48]	; 0x30
 800234e:	0312      	lsls	r2, r2, #12
 8002350:	4e10      	ldr	r6, [pc, #64]	; (8002394 <RCC_GetClocksFreq+0x16c>)
 8002352:	4217      	tst	r7, r2
 8002354:	d015      	beq.n	8002382 <RCC_GetClocksFreq+0x15a>
 8002356:	6b37      	ldr	r7, [r6, #48]	; 0x30
 8002358:	2380      	movs	r3, #128	; 0x80
 800235a:	4017      	ands	r7, r2
 800235c:	02db      	lsls	r3, r3, #11
 800235e:	429f      	cmp	r7, r3
 8002360:	d101      	bne.n	8002366 <RCC_GetClocksFreq+0x13e>
 8002362:	6221      	str	r1, [r4, #32]
 8002364:	e00e      	b.n	8002384 <RCC_GetClocksFreq+0x15c>
 8002366:	6b31      	ldr	r1, [r6, #48]	; 0x30
 8002368:	2380      	movs	r3, #128	; 0x80
 800236a:	4011      	ands	r1, r2
 800236c:	031b      	lsls	r3, r3, #12
 800236e:	4299      	cmp	r1, r3
 8002370:	d102      	bne.n	8002378 <RCC_GetClocksFreq+0x150>
 8002372:	2380      	movs	r3, #128	; 0x80
 8002374:	021b      	lsls	r3, r3, #8
 8002376:	e004      	b.n	8002382 <RCC_GetClocksFreq+0x15a>
 8002378:	6b33      	ldr	r3, [r6, #48]	; 0x30
 800237a:	4013      	ands	r3, r2
 800237c:	4293      	cmp	r3, r2
 800237e:	d101      	bne.n	8002384 <RCC_GetClocksFreq+0x15c>
 8002380:	4b06      	ldr	r3, [pc, #24]	; (800239c <RCC_GetClocksFreq+0x174>)
 8002382:	6223      	str	r3, [r4, #32]
 8002384:	6b2b      	ldr	r3, [r5, #48]	; 0x30
 8002386:	061a      	lsls	r2, r3, #24
 8002388:	d402      	bmi.n	8002390 <RCC_GetClocksFreq+0x168>
 800238a:	4b05      	ldr	r3, [pc, #20]	; (80023a0 <RCC_GetClocksFreq+0x178>)
 800238c:	6263      	str	r3, [r4, #36]	; 0x24
 800238e:	e000      	b.n	8002392 <RCC_GetClocksFreq+0x16a>
 8002390:	6260      	str	r0, [r4, #36]	; 0x24
 8002392:	bdf8      	pop	{r3, r4, r5, r6, r7, pc}
 8002394:	40021000 	.word	0x40021000
 8002398:	003d0900 	.word	0x003d0900
 800239c:	007a1200 	.word	0x007a1200
 80023a0:	02dc6c00 	.word	0x02dc6c00
 80023a4:	20000000 	.word	0x20000000
 80023a8:	00d59f80 	.word	0x00d59f80
 80023ac:	00008012 	.word	0x00008012

080023b0 <RCC_AHBPeriphClockCmd>:
 80023b0:	b538      	push	{r3, r4, r5, lr}
 80023b2:	4b0d      	ldr	r3, [pc, #52]	; (80023e8 <RCC_AHBPeriphClockCmd+0x38>)
 80023b4:	1c04      	adds	r4, r0, #0
 80023b6:	1c0d      	adds	r5, r1, #0
 80023b8:	2000      	movs	r0, #0
 80023ba:	421c      	tst	r4, r3
 80023bc:	d102      	bne.n	80023c4 <RCC_AHBPeriphClockCmd+0x14>
 80023be:	1c20      	adds	r0, r4, #0
 80023c0:	1e43      	subs	r3, r0, #1
 80023c2:	4198      	sbcs	r0, r3
 80023c4:	f7fe ffc0 	bl	8001348 <assert_param>
 80023c8:	2301      	movs	r3, #1
 80023ca:	2000      	movs	r0, #0
 80023cc:	42ab      	cmp	r3, r5
 80023ce:	4140      	adcs	r0, r0
 80023d0:	f7fe ffba 	bl	8001348 <assert_param>
 80023d4:	4b05      	ldr	r3, [pc, #20]	; (80023ec <RCC_AHBPeriphClockCmd+0x3c>)
 80023d6:	695a      	ldr	r2, [r3, #20]
 80023d8:	2d00      	cmp	r5, #0
 80023da:	d002      	beq.n	80023e2 <RCC_AHBPeriphClockCmd+0x32>
 80023dc:	4314      	orrs	r4, r2
 80023de:	615c      	str	r4, [r3, #20]
 80023e0:	e001      	b.n	80023e6 <RCC_AHBPeriphClockCmd+0x36>
 80023e2:	43a2      	bics	r2, r4
 80023e4:	615a      	str	r2, [r3, #20]
 80023e6:	bd38      	pop	{r3, r4, r5, pc}
 80023e8:	fe81ffa8 	.word	0xfe81ffa8
 80023ec:	40021000 	.word	0x40021000

080023f0 <RCC_APB2PeriphClockCmd>:
 80023f0:	b538      	push	{r3, r4, r5, lr}
 80023f2:	4b0d      	ldr	r3, [pc, #52]	; (8002428 <RCC_APB2PeriphClockCmd+0x38>)
 80023f4:	1c04      	adds	r4, r0, #0
 80023f6:	1c0d      	adds	r5, r1, #0
 80023f8:	2000      	movs	r0, #0
 80023fa:	421c      	tst	r4, r3
 80023fc:	d102      	bne.n	8002404 <RCC_APB2PeriphClockCmd+0x14>
 80023fe:	1c20      	adds	r0, r4, #0
 8002400:	1e43      	subs	r3, r0, #1
 8002402:	4198      	sbcs	r0, r3
 8002404:	f7fe ffa0 	bl	8001348 <assert_param>
 8002408:	2301      	movs	r3, #1
 800240a:	2000      	movs	r0, #0
 800240c:	42ab      	cmp	r3, r5
 800240e:	4140      	adcs	r0, r0
 8002410:	f7fe ff9a 	bl	8001348 <assert_param>
 8002414:	4b05      	ldr	r3, [pc, #20]	; (800242c <RCC_APB2PeriphClockCmd+0x3c>)
 8002416:	699a      	ldr	r2, [r3, #24]
 8002418:	2d00      	cmp	r5, #0
 800241a:	d002      	beq.n	8002422 <RCC_APB2PeriphClockCmd+0x32>
 800241c:	4314      	orrs	r4, r2
 800241e:	619c      	str	r4, [r3, #24]
 8002420:	e001      	b.n	8002426 <RCC_APB2PeriphClockCmd+0x36>
 8002422:	43a2      	bics	r2, r4
 8002424:	619a      	str	r2, [r3, #24]
 8002426:	bd38      	pop	{r3, r4, r5, pc}
 8002428:	ffb8a51e 	.word	0xffb8a51e
 800242c:	40021000 	.word	0x40021000

08002430 <RCC_APB1PeriphClockCmd>:
 8002430:	b538      	push	{r3, r4, r5, lr}
 8002432:	4b0d      	ldr	r3, [pc, #52]	; (8002468 <RCC_APB1PeriphClockCmd+0x38>)
 8002434:	1c04      	adds	r4, r0, #0
 8002436:	1c0d      	adds	r5, r1, #0
 8002438:	2000      	movs	r0, #0
 800243a:	421c      	tst	r4, r3
 800243c:	d102      	bne.n	8002444 <RCC_APB1PeriphClockCmd+0x14>
 800243e:	1c20      	adds	r0, r4, #0
 8002440:	1e43      	subs	r3, r0, #1
 8002442:	4198      	sbcs	r0, r3
 8002444:	f7fe ff80 	bl	8001348 <assert_param>
 8002448:	2301      	movs	r3, #1
 800244a:	2000      	movs	r0, #0
 800244c:	42ab      	cmp	r3, r5
 800244e:	4140      	adcs	r0, r0
 8002450:	f7fe ff7a 	bl	8001348 <assert_param>
 8002454:	4b05      	ldr	r3, [pc, #20]	; (800246c <RCC_APB1PeriphClockCmd+0x3c>)
 8002456:	69da      	ldr	r2, [r3, #28]
 8002458:	2d00      	cmp	r5, #0
 800245a:	d002      	beq.n	8002462 <RCC_APB1PeriphClockCmd+0x32>
 800245c:	4314      	orrs	r4, r2
 800245e:	61dc      	str	r4, [r3, #28]
 8002460:	e001      	b.n	8002466 <RCC_APB1PeriphClockCmd+0x36>
 8002462:	43a2      	bics	r2, r4
 8002464:	61da      	str	r2, [r3, #28]
 8002466:	bd38      	pop	{r3, r4, r5, pc}
 8002468:	8581b6cc 	.word	0x8581b6cc
 800246c:	40021000 	.word	0x40021000

08002470 <RCC_APB2PeriphResetCmd>:
 8002470:	b538      	push	{r3, r4, r5, lr}
 8002472:	4b0d      	ldr	r3, [pc, #52]	; (80024a8 <RCC_APB2PeriphResetCmd+0x38>)
 8002474:	1c04      	adds	r4, r0, #0
 8002476:	1c0d      	adds	r5, r1, #0
 8002478:	2000      	movs	r0, #0
 800247a:	421c      	tst	r4, r3
 800247c:	d102      	bne.n	8002484 <RCC_APB2PeriphResetCmd+0x14>
 800247e:	1c20      	adds	r0, r4, #0
 8002480:	1e43      	subs	r3, r0, #1
 8002482:	4198      	sbcs	r0, r3
 8002484:	f7fe ff60 	bl	8001348 <assert_param>
 8002488:	2301      	movs	r3, #1
 800248a:	2000      	movs	r0, #0
 800248c:	42ab      	cmp	r3, r5
 800248e:	4140      	adcs	r0, r0
 8002490:	f7fe ff5a 	bl	8001348 <assert_param>
 8002494:	4b05      	ldr	r3, [pc, #20]	; (80024ac <RCC_APB2PeriphResetCmd+0x3c>)
 8002496:	68da      	ldr	r2, [r3, #12]
 8002498:	2d00      	cmp	r5, #0
 800249a:	d002      	beq.n	80024a2 <RCC_APB2PeriphResetCmd+0x32>
 800249c:	4314      	orrs	r4, r2
 800249e:	60dc      	str	r4, [r3, #12]
 80024a0:	e001      	b.n	80024a6 <RCC_APB2PeriphResetCmd+0x36>
 80024a2:	43a2      	bics	r2, r4
 80024a4:	60da      	str	r2, [r3, #12]
 80024a6:	bd38      	pop	{r3, r4, r5, pc}
 80024a8:	ffb8a51e 	.word	0xffb8a51e
 80024ac:	40021000 	.word	0x40021000

080024b0 <RCC_GetFlagStatus>:
 80024b0:	2310      	movs	r3, #16
 80024b2:	b510      	push	{r4, lr}
 80024b4:	1c04      	adds	r4, r0, #0
 80024b6:	4398      	bics	r0, r3
 80024b8:	2801      	cmp	r0, #1
 80024ba:	d015      	beq.n	80024e8 <RCC_GetFlagStatus+0x38>
 80024bc:	2c19      	cmp	r4, #25
 80024be:	d012      	beq.n	80024e6 <RCC_GetFlagStatus+0x36>
 80024c0:	2340      	movs	r3, #64	; 0x40
 80024c2:	1c22      	adds	r2, r4, #0
 80024c4:	439a      	bics	r2, r3
 80024c6:	2a21      	cmp	r2, #33	; 0x21
 80024c8:	d00d      	beq.n	80024e6 <RCC_GetFlagStatus+0x36>
 80024ca:	2c41      	cmp	r4, #65	; 0x41
 80024cc:	d00b      	beq.n	80024e6 <RCC_GetFlagStatus+0x36>
 80024ce:	1c23      	adds	r3, r4, #0
 80024d0:	3b59      	subs	r3, #89	; 0x59
 80024d2:	b2db      	uxtb	r3, r3
 80024d4:	2b06      	cmp	r3, #6
 80024d6:	d906      	bls.n	80024e6 <RCC_GetFlagStatus+0x36>
 80024d8:	2c71      	cmp	r4, #113	; 0x71
 80024da:	d004      	beq.n	80024e6 <RCC_GetFlagStatus+0x36>
 80024dc:	1c20      	adds	r0, r4, #0
 80024de:	3857      	subs	r0, #87	; 0x57
 80024e0:	4243      	negs	r3, r0
 80024e2:	4158      	adcs	r0, r3
 80024e4:	e000      	b.n	80024e8 <RCC_GetFlagStatus+0x38>
 80024e6:	2001      	movs	r0, #1
 80024e8:	f7fe ff2e 	bl	8001348 <assert_param>
 80024ec:	0962      	lsrs	r2, r4, #5
 80024ee:	4b0a      	ldr	r3, [pc, #40]	; (8002518 <RCC_GetFlagStatus+0x68>)
 80024f0:	d101      	bne.n	80024f6 <RCC_GetFlagStatus+0x46>
 80024f2:	681b      	ldr	r3, [r3, #0]
 80024f4:	e008      	b.n	8002508 <RCC_GetFlagStatus+0x58>
 80024f6:	2a01      	cmp	r2, #1
 80024f8:	d101      	bne.n	80024fe <RCC_GetFlagStatus+0x4e>
 80024fa:	6a1b      	ldr	r3, [r3, #32]
 80024fc:	e004      	b.n	8002508 <RCC_GetFlagStatus+0x58>
 80024fe:	2a02      	cmp	r2, #2
 8002500:	d101      	bne.n	8002506 <RCC_GetFlagStatus+0x56>
 8002502:	6a5b      	ldr	r3, [r3, #36]	; 0x24
 8002504:	e000      	b.n	8002508 <RCC_GetFlagStatus+0x58>
 8002506:	6b5b      	ldr	r3, [r3, #52]	; 0x34
 8002508:	201f      	movs	r0, #31
 800250a:	4004      	ands	r4, r0
 800250c:	1c18      	adds	r0, r3, #0
 800250e:	40e0      	lsrs	r0, r4
 8002510:	2201      	movs	r2, #1
 8002512:	4010      	ands	r0, r2
 8002514:	bd10      	pop	{r4, pc}
 8002516:	46c0      	nop			; (mov r8, r8)
 8002518:	40021000 	.word	0x40021000

0800251c <gpio_init>:
 800251c:	b5f7      	push	{r0, r1, r2, r4, r5, r6, r7, lr}
 800251e:	2080      	movs	r0, #128	; 0x80
 8002520:	0280      	lsls	r0, r0, #10
 8002522:	2101      	movs	r1, #1
 8002524:	f7ff ff44 	bl	80023b0 <RCC_AHBPeriphClockCmd>
 8002528:	2080      	movs	r0, #128	; 0x80
 800252a:	02c0      	lsls	r0, r0, #11
 800252c:	2101      	movs	r1, #1
 800252e:	f7ff ff3f 	bl	80023b0 <RCC_AHBPeriphClockCmd>
 8002532:	2208      	movs	r2, #8
 8002534:	2400      	movs	r4, #0
 8002536:	466b      	mov	r3, sp
 8002538:	2603      	movs	r6, #3
 800253a:	9200      	str	r2, [sp, #0]
 800253c:	4669      	mov	r1, sp
 800253e:	2201      	movs	r2, #1
 8002540:	481c      	ldr	r0, [pc, #112]	; (80025b4 <gpio_init+0x98>)
 8002542:	715e      	strb	r6, [r3, #5]
 8002544:	711a      	strb	r2, [r3, #4]
 8002546:	719c      	strb	r4, [r3, #6]
 8002548:	71dc      	strb	r4, [r3, #7]
 800254a:	2590      	movs	r5, #144	; 0x90
 800254c:	f7ff f884 	bl	8001658 <GPIO_Init>
 8002550:	2380      	movs	r3, #128	; 0x80
 8002552:	05ed      	lsls	r5, r5, #23
 8002554:	005b      	lsls	r3, r3, #1
 8002556:	466a      	mov	r2, sp
 8002558:	1c28      	adds	r0, r5, #0
 800255a:	9300      	str	r3, [sp, #0]
 800255c:	4669      	mov	r1, sp
 800255e:	2301      	movs	r3, #1
 8002560:	2780      	movs	r7, #128	; 0x80
 8002562:	7156      	strb	r6, [r2, #5]
 8002564:	013f      	lsls	r7, r7, #4
 8002566:	7113      	strb	r3, [r2, #4]
 8002568:	7194      	strb	r4, [r2, #6]
 800256a:	71d4      	strb	r4, [r2, #7]
 800256c:	f7ff f874 	bl	8001658 <GPIO_Init>
 8002570:	466a      	mov	r2, sp
 8002572:	1c28      	adds	r0, r5, #0
 8002574:	2301      	movs	r3, #1
 8002576:	4669      	mov	r1, sp
 8002578:	7156      	strb	r6, [r2, #5]
 800257a:	9700      	str	r7, [sp, #0]
 800257c:	7113      	strb	r3, [r2, #4]
 800257e:	7194      	strb	r4, [r2, #6]
 8002580:	71d4      	strb	r4, [r2, #7]
 8002582:	f7ff f869 	bl	8001658 <GPIO_Init>
 8002586:	2202      	movs	r2, #2
 8002588:	466b      	mov	r3, sp
 800258a:	9200      	str	r2, [sp, #0]
 800258c:	1c28      	adds	r0, r5, #0
 800258e:	2201      	movs	r2, #1
 8002590:	4669      	mov	r1, sp
 8002592:	715e      	strb	r6, [r3, #5]
 8002594:	711a      	strb	r2, [r3, #4]
 8002596:	719c      	strb	r4, [r3, #6]
 8002598:	71dc      	strb	r4, [r3, #7]
 800259a:	f7ff f85d 	bl	8001658 <GPIO_Init>
 800259e:	4b05      	ldr	r3, [pc, #20]	; (80025b4 <gpio_init+0x98>)
 80025a0:	2208      	movs	r2, #8
 80025a2:	851a      	strh	r2, [r3, #40]	; 0x28
 80025a4:	2380      	movs	r3, #128	; 0x80
 80025a6:	005b      	lsls	r3, r3, #1
 80025a8:	2202      	movs	r2, #2
 80025aa:	852b      	strh	r3, [r5, #40]	; 0x28
 80025ac:	852f      	strh	r7, [r5, #40]	; 0x28
 80025ae:	852a      	strh	r2, [r5, #40]	; 0x28
 80025b0:	bdf7      	pop	{r0, r1, r2, r4, r5, r6, r7, pc}
 80025b2:	46c0      	nop			; (mov r8, r8)
 80025b4:	48000400 	.word	0x48000400

080025b8 <led_on>:
 80025b8:	2808      	cmp	r0, #8
 80025ba:	d101      	bne.n	80025c0 <led_on+0x8>
 80025bc:	4b07      	ldr	r3, [pc, #28]	; (80025dc <led_on+0x24>)
 80025be:	e00b      	b.n	80025d8 <led_on+0x20>
 80025c0:	2380      	movs	r3, #128	; 0x80
 80025c2:	005b      	lsls	r3, r3, #1
 80025c4:	4298      	cmp	r0, r3
 80025c6:	d005      	beq.n	80025d4 <led_on+0x1c>
 80025c8:	2380      	movs	r3, #128	; 0x80
 80025ca:	011b      	lsls	r3, r3, #4
 80025cc:	4298      	cmp	r0, r3
 80025ce:	d001      	beq.n	80025d4 <led_on+0x1c>
 80025d0:	2802      	cmp	r0, #2
 80025d2:	d102      	bne.n	80025da <led_on+0x22>
 80025d4:	2390      	movs	r3, #144	; 0x90
 80025d6:	05db      	lsls	r3, r3, #23
 80025d8:	6198      	str	r0, [r3, #24]
 80025da:	4770      	bx	lr
 80025dc:	48000400 	.word	0x48000400

080025e0 <led_off>:
 80025e0:	2808      	cmp	r0, #8
 80025e2:	d101      	bne.n	80025e8 <led_off+0x8>
 80025e4:	4b07      	ldr	r3, [pc, #28]	; (8002604 <led_off+0x24>)
 80025e6:	e00b      	b.n	8002600 <led_off+0x20>
 80025e8:	2380      	movs	r3, #128	; 0x80
 80025ea:	005b      	lsls	r3, r3, #1
 80025ec:	4298      	cmp	r0, r3
 80025ee:	d005      	beq.n	80025fc <led_off+0x1c>
 80025f0:	2380      	movs	r3, #128	; 0x80
 80025f2:	011b      	lsls	r3, r3, #4
 80025f4:	4298      	cmp	r0, r3
 80025f6:	d001      	beq.n	80025fc <led_off+0x1c>
 80025f8:	2802      	cmp	r0, #2
 80025fa:	d102      	bne.n	8002602 <led_off+0x22>
 80025fc:	2390      	movs	r3, #144	; 0x90
 80025fe:	05db      	lsls	r3, r3, #23
 8002600:	8518      	strh	r0, [r3, #40]	; 0x28
 8002602:	4770      	bx	lr
 8002604:	48000400 	.word	0x48000400

08002608 <Default_Handler>:
 8002608:	4770      	bx	lr
	...

0800260c <HardFault_Handler>:
 800260c:	2008      	movs	r0, #8
 800260e:	f7ff ffd3 	bl	80025b8 <led_on>
 8002612:	4b07      	ldr	r3, [pc, #28]	; (8002630 <HardFault_Handler+0x24>)
 8002614:	3b01      	subs	r3, #1
 8002616:	2b00      	cmp	r3, #0
 8002618:	d001      	beq.n	800261e <HardFault_Handler+0x12>
 800261a:	46c0      	nop			; (mov r8, r8)
 800261c:	e7fa      	b.n	8002614 <HardFault_Handler+0x8>
 800261e:	2008      	movs	r0, #8
 8002620:	f7ff ffde 	bl	80025e0 <led_off>
 8002624:	4b02      	ldr	r3, [pc, #8]	; (8002630 <HardFault_Handler+0x24>)
 8002626:	3b01      	subs	r3, #1
 8002628:	2b00      	cmp	r3, #0
 800262a:	d0ef      	beq.n	800260c <HardFault_Handler>
 800262c:	46c0      	nop			; (mov r8, r8)
 800262e:	e7fa      	b.n	8002626 <HardFault_Handler+0x1a>
 8002630:	002dc6c1 	.word	0x002dc6c1

08002634 <_reset_init>:
 8002634:	4a07      	ldr	r2, [pc, #28]	; (8002654 <_reset_init+0x20>)
 8002636:	4908      	ldr	r1, [pc, #32]	; (8002658 <_reset_init+0x24>)
 8002638:	2300      	movs	r3, #0
 800263a:	1a89      	subs	r1, r1, r2
 800263c:	1089      	asrs	r1, r1, #2
 800263e:	1c10      	adds	r0, r2, #0
 8002640:	428b      	cmp	r3, r1
 8002642:	d005      	beq.n	8002650 <_reset_init+0x1c>
 8002644:	4c05      	ldr	r4, [pc, #20]	; (800265c <_reset_init+0x28>)
 8002646:	009a      	lsls	r2, r3, #2
 8002648:	58a4      	ldr	r4, [r4, r2]
 800264a:	3301      	adds	r3, #1
 800264c:	5084      	str	r4, [r0, r2]
 800264e:	e7f7      	b.n	8002640 <_reset_init+0xc>
 8002650:	f7fe fbd4 	bl	8000dfc <main>
 8002654:	20000000 	.word	0x20000000
 8002658:	20000010 	.word	0x20000010
 800265c:	08002ea0 	.word	0x08002ea0

08002660 <__gnu_thumb1_case_uqi>:
 8002660:	b402      	push	{r1}
 8002662:	4671      	mov	r1, lr
 8002664:	0849      	lsrs	r1, r1, #1
 8002666:	0049      	lsls	r1, r1, #1
 8002668:	5c09      	ldrb	r1, [r1, r0]
 800266a:	0049      	lsls	r1, r1, #1
 800266c:	448e      	add	lr, r1
 800266e:	bc02      	pop	{r1}
 8002670:	4770      	bx	lr
 8002672:	46c0      	nop			; (mov r8, r8)

08002674 <__aeabi_uidiv>:
 8002674:	2900      	cmp	r1, #0
 8002676:	d034      	beq.n	80026e2 <.udivsi3_skip_div0_test+0x6a>

08002678 <.udivsi3_skip_div0_test>:
 8002678:	2301      	movs	r3, #1
 800267a:	2200      	movs	r2, #0
 800267c:	b410      	push	{r4}
 800267e:	4288      	cmp	r0, r1
 8002680:	d32c      	bcc.n	80026dc <.udivsi3_skip_div0_test+0x64>
 8002682:	2401      	movs	r4, #1
 8002684:	0724      	lsls	r4, r4, #28
 8002686:	42a1      	cmp	r1, r4
 8002688:	d204      	bcs.n	8002694 <.udivsi3_skip_div0_test+0x1c>
 800268a:	4281      	cmp	r1, r0
 800268c:	d202      	bcs.n	8002694 <.udivsi3_skip_div0_test+0x1c>
 800268e:	0109      	lsls	r1, r1, #4
 8002690:	011b      	lsls	r3, r3, #4
 8002692:	e7f8      	b.n	8002686 <.udivsi3_skip_div0_test+0xe>
 8002694:	00e4      	lsls	r4, r4, #3
 8002696:	42a1      	cmp	r1, r4
 8002698:	d204      	bcs.n	80026a4 <.udivsi3_skip_div0_test+0x2c>
 800269a:	4281      	cmp	r1, r0
 800269c:	d202      	bcs.n	80026a4 <.udivsi3_skip_div0_test+0x2c>
 800269e:	0049      	lsls	r1, r1, #1
 80026a0:	005b      	lsls	r3, r3, #1
 80026a2:	e7f8      	b.n	8002696 <.udivsi3_skip_div0_test+0x1e>
 80026a4:	4288      	cmp	r0, r1
 80026a6:	d301      	bcc.n	80026ac <.udivsi3_skip_div0_test+0x34>
 80026a8:	1a40      	subs	r0, r0, r1
 80026aa:	431a      	orrs	r2, r3
 80026ac:	084c      	lsrs	r4, r1, #1
 80026ae:	42a0      	cmp	r0, r4
 80026b0:	d302      	bcc.n	80026b8 <.udivsi3_skip_div0_test+0x40>
 80026b2:	1b00      	subs	r0, r0, r4
 80026b4:	085c      	lsrs	r4, r3, #1
 80026b6:	4322      	orrs	r2, r4
 80026b8:	088c      	lsrs	r4, r1, #2
 80026ba:	42a0      	cmp	r0, r4
 80026bc:	d302      	bcc.n	80026c4 <.udivsi3_skip_div0_test+0x4c>
 80026be:	1b00      	subs	r0, r0, r4
 80026c0:	089c      	lsrs	r4, r3, #2
 80026c2:	4322      	orrs	r2, r4
 80026c4:	08cc      	lsrs	r4, r1, #3
 80026c6:	42a0      	cmp	r0, r4
 80026c8:	d302      	bcc.n	80026d0 <.udivsi3_skip_div0_test+0x58>
 80026ca:	1b00      	subs	r0, r0, r4
 80026cc:	08dc      	lsrs	r4, r3, #3
 80026ce:	4322      	orrs	r2, r4
 80026d0:	2800      	cmp	r0, #0
 80026d2:	d003      	beq.n	80026dc <.udivsi3_skip_div0_test+0x64>
 80026d4:	091b      	lsrs	r3, r3, #4
 80026d6:	d001      	beq.n	80026dc <.udivsi3_skip_div0_test+0x64>
 80026d8:	0909      	lsrs	r1, r1, #4
 80026da:	e7e3      	b.n	80026a4 <.udivsi3_skip_div0_test+0x2c>
 80026dc:	1c10      	adds	r0, r2, #0
 80026de:	bc10      	pop	{r4}
 80026e0:	4770      	bx	lr
 80026e2:	2800      	cmp	r0, #0
 80026e4:	d001      	beq.n	80026ea <.udivsi3_skip_div0_test+0x72>
 80026e6:	2000      	movs	r0, #0
 80026e8:	43c0      	mvns	r0, r0
 80026ea:	b407      	push	{r0, r1, r2}
 80026ec:	4802      	ldr	r0, [pc, #8]	; (80026f8 <.udivsi3_skip_div0_test+0x80>)
 80026ee:	a102      	add	r1, pc, #8	; (adr r1, 80026f8 <.udivsi3_skip_div0_test+0x80>)
 80026f0:	1840      	adds	r0, r0, r1
 80026f2:	9002      	str	r0, [sp, #8]
 80026f4:	bd03      	pop	{r0, r1, pc}
 80026f6:	46c0      	nop			; (mov r8, r8)
 80026f8:	000000d9 	.word	0x000000d9

080026fc <__aeabi_uidivmod>:
 80026fc:	2900      	cmp	r1, #0
 80026fe:	d0f0      	beq.n	80026e2 <.udivsi3_skip_div0_test+0x6a>
 8002700:	b503      	push	{r0, r1, lr}
 8002702:	f7ff ffb9 	bl	8002678 <.udivsi3_skip_div0_test>
 8002706:	bc0e      	pop	{r1, r2, r3}
 8002708:	4342      	muls	r2, r0
 800270a:	1a89      	subs	r1, r1, r2
 800270c:	4718      	bx	r3
 800270e:	46c0      	nop			; (mov r8, r8)

08002710 <__aeabi_idiv>:
 8002710:	2900      	cmp	r1, #0
 8002712:	d041      	beq.n	8002798 <.divsi3_skip_div0_test+0x84>

08002714 <.divsi3_skip_div0_test>:
 8002714:	b410      	push	{r4}
 8002716:	1c04      	adds	r4, r0, #0
 8002718:	404c      	eors	r4, r1
 800271a:	46a4      	mov	ip, r4
 800271c:	2301      	movs	r3, #1
 800271e:	2200      	movs	r2, #0
 8002720:	2900      	cmp	r1, #0
 8002722:	d500      	bpl.n	8002726 <.divsi3_skip_div0_test+0x12>
 8002724:	4249      	negs	r1, r1
 8002726:	2800      	cmp	r0, #0
 8002728:	d500      	bpl.n	800272c <.divsi3_skip_div0_test+0x18>
 800272a:	4240      	negs	r0, r0
 800272c:	4288      	cmp	r0, r1
 800272e:	d32c      	bcc.n	800278a <.divsi3_skip_div0_test+0x76>
 8002730:	2401      	movs	r4, #1
 8002732:	0724      	lsls	r4, r4, #28
 8002734:	42a1      	cmp	r1, r4
 8002736:	d204      	bcs.n	8002742 <.divsi3_skip_div0_test+0x2e>
 8002738:	4281      	cmp	r1, r0
 800273a:	d202      	bcs.n	8002742 <.divsi3_skip_div0_test+0x2e>
 800273c:	0109      	lsls	r1, r1, #4
 800273e:	011b      	lsls	r3, r3, #4
 8002740:	e7f8      	b.n	8002734 <.divsi3_skip_div0_test+0x20>
 8002742:	00e4      	lsls	r4, r4, #3
 8002744:	42a1      	cmp	r1, r4
 8002746:	d204      	bcs.n	8002752 <.divsi3_skip_div0_test+0x3e>
 8002748:	4281      	cmp	r1, r0
 800274a:	d202      	bcs.n	8002752 <.divsi3_skip_div0_test+0x3e>
 800274c:	0049      	lsls	r1, r1, #1
 800274e:	005b      	lsls	r3, r3, #1
 8002750:	e7f8      	b.n	8002744 <.divsi3_skip_div0_test+0x30>
 8002752:	4288      	cmp	r0, r1
 8002754:	d301      	bcc.n	800275a <.divsi3_skip_div0_test+0x46>
 8002756:	1a40      	subs	r0, r0, r1
 8002758:	431a      	orrs	r2, r3
 800275a:	084c      	lsrs	r4, r1, #1
 800275c:	42a0      	cmp	r0, r4
 800275e:	d302      	bcc.n	8002766 <.divsi3_skip_div0_test+0x52>
 8002760:	1b00      	subs	r0, r0, r4
 8002762:	085c      	lsrs	r4, r3, #1
 8002764:	4322      	orrs	r2, r4
 8002766:	088c      	lsrs	r4, r1, #2
 8002768:	42a0      	cmp	r0, r4
 800276a:	d302      	bcc.n	8002772 <.divsi3_skip_div0_test+0x5e>
 800276c:	1b00      	subs	r0, r0, r4
 800276e:	089c      	lsrs	r4, r3, #2
 8002770:	4322      	orrs	r2, r4
 8002772:	08cc      	lsrs	r4, r1, #3
 8002774:	42a0      	cmp	r0, r4
 8002776:	d302      	bcc.n	800277e <.divsi3_skip_div0_test+0x6a>
 8002778:	1b00      	subs	r0, r0, r4
 800277a:	08dc      	lsrs	r4, r3, #3
 800277c:	4322      	orrs	r2, r4
 800277e:	2800      	cmp	r0, #0
 8002780:	d003      	beq.n	800278a <.divsi3_skip_div0_test+0x76>
 8002782:	091b      	lsrs	r3, r3, #4
 8002784:	d001      	beq.n	800278a <.divsi3_skip_div0_test+0x76>
 8002786:	0909      	lsrs	r1, r1, #4
 8002788:	e7e3      	b.n	8002752 <.divsi3_skip_div0_test+0x3e>
 800278a:	1c10      	adds	r0, r2, #0
 800278c:	4664      	mov	r4, ip
 800278e:	2c00      	cmp	r4, #0
 8002790:	d500      	bpl.n	8002794 <.divsi3_skip_div0_test+0x80>
 8002792:	4240      	negs	r0, r0
 8002794:	bc10      	pop	{r4}
 8002796:	4770      	bx	lr
 8002798:	2800      	cmp	r0, #0
 800279a:	d006      	beq.n	80027aa <.divsi3_skip_div0_test+0x96>
 800279c:	db03      	blt.n	80027a6 <.divsi3_skip_div0_test+0x92>
 800279e:	2000      	movs	r0, #0
 80027a0:	43c0      	mvns	r0, r0
 80027a2:	0840      	lsrs	r0, r0, #1
 80027a4:	e001      	b.n	80027aa <.divsi3_skip_div0_test+0x96>
 80027a6:	2080      	movs	r0, #128	; 0x80
 80027a8:	0600      	lsls	r0, r0, #24
 80027aa:	b407      	push	{r0, r1, r2}
 80027ac:	4802      	ldr	r0, [pc, #8]	; (80027b8 <.divsi3_skip_div0_test+0xa4>)
 80027ae:	a102      	add	r1, pc, #8	; (adr r1, 80027b8 <.divsi3_skip_div0_test+0xa4>)
 80027b0:	1840      	adds	r0, r0, r1
 80027b2:	9002      	str	r0, [sp, #8]
 80027b4:	bd03      	pop	{r0, r1, pc}
 80027b6:	46c0      	nop			; (mov r8, r8)
 80027b8:	00000019 	.word	0x00000019

080027bc <__aeabi_idivmod>:
 80027bc:	2900      	cmp	r1, #0
 80027be:	d0eb      	beq.n	8002798 <.divsi3_skip_div0_test+0x84>
 80027c0:	b503      	push	{r0, r1, lr}
 80027c2:	f7ff ffa7 	bl	8002714 <.divsi3_skip_div0_test>
 80027c6:	bc0e      	pop	{r1, r2, r3}
 80027c8:	4342      	muls	r2, r0
 80027ca:	1a89      	subs	r1, r1, r2
 80027cc:	4718      	bx	r3
 80027ce:	46c0      	nop			; (mov r8, r8)

080027d0 <__aeabi_idiv0>:
 80027d0:	4770      	bx	lr
 80027d2:	46c0      	nop			; (mov r8, r8)

080027d4 <_init>:
 80027d4:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
 80027d6:	46c0      	nop			; (mov r8, r8)
 80027d8:	bcf8      	pop	{r3, r4, r5, r6, r7}
 80027da:	bc08      	pop	{r3}
 80027dc:	469e      	mov	lr, r3
 80027de:	4770      	bx	lr

080027e0 <_fini>:
 80027e0:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
 80027e2:	46c0      	nop			; (mov r8, r8)
 80027e4:	bcf8      	pop	{r3, r4, r5, r6, r7}
 80027e6:	bc08      	pop	{r3}
 80027e8:	469e      	mov	lr, r3
 80027ea:	4770      	bx	lr
 80027ec:	69647473 	.word	0x69647473
 80027f0:	6e69206f 	.word	0x6e69206f
 80027f4:	64207469 	.word	0x64207469
 80027f8:	0a656e6f 	.word	0x0a656e6f
	...

080027fd <font_data>:
	...
 800280d:	3c180000 18183c3c 18180018 00000000     ...<<<..........
 800281d:	63636300 00000022 00000000 00000000     .ccc"...........
 800282d:	36000000 36367f36 36367f36 00000000     ...66.666.66....
 800283d:	633e0c0c 033e6061 3e634303 00000c0c     ..>ca`>..Cc>....
 800284d:	00000000 06636100 6333180c 00000000     .....ac...3c....
 800285d:	1c000000 3b1c3636 3b66666e 00000000     ....66.;nff;....
 800286d:	30303000 00000060 00000000 00000000     .000`...........
 800287d:	180c0000 30303018 0c181830 00000000     .....0000.......
 800288d:	0c180000 0606060c 180c0c06 00000000     ................
 800289d:	00000000 ff3c6642 0042663c 00000000     ....Bf<.<fB.....
 80028ad:	00000000 ff181818 00181818 00000000     ................
	...
 80028c5:	18180000 00003018 00000000 ff000000     .....0..........
	...
 80028e5:	18180000 00000000 03010000 381c0e07     ...............8
 80028f5:	80c0e070 00000000 633e0000 6b6b6363     p.........>ccckk
 8002905:	3e636363 00000000 1c0c0000 0c0c0c3c     ccc>........<...
 8002915:	3f0c0c0c 00000000 633e0000 180c0603     ...?......>c....
 8002925:	7f636130 00000000 633e0000 031e0303     0ac.......>c....
 8002935:	3e630303 00000000 0e060000 6666361e     ..c>.........6ff
 8002945:	0f06067f 00000000 607f0000 037e6060     ...........```~.
 8002955:	3e736303 00000000 301c0000 637e6060     .cs>.......0``~c
 8002965:	3e636363 00000000 637f0000 0c060603     ccc>.......c....
 8002975:	1818180c 00000000 633e0000 633e6363     ..........>ccc>c
 8002985:	3e636363 00000000 633e0000 3f636363     ccc>......>cccc?
 8002995:	3c060303 00000000 00000000 00181800     ...<............
 80029a5:	18180000 00000000 00000000 00181800     ................
 80029b5:	18180000 00003018 06000000 6030180c     .....0........0`
 80029c5:	060c1830 00000000 00000000 007e0000     0.............~.
 80029d5:	00007e00 00000000 60000000 060c1830     .~.........`0...
 80029e5:	6030180c 00000000 633e0000 0c0c0663     ..0`......>cc...
 80029f5:	0c0c000c 00000000 633e0000 6b6b6f63     ..........>ccokk
 8002a05:	3e60606e 00000000 1c080000 63636336     n``>........6ccc
 8002a15:	6363637f 00000000 337e0000 333e3333     .ccc......~333>3
 8002a25:	7e333333 00000000 331e0000 60606061     333~.......3a```
 8002a35:	1e336160 00000000 367c0000 33333333     `a3.......|63333
 8002a45:	7c363333 00000000 337f0000 343c3431     336|.......314<4
 8002a55:	7f333130 00000000 337f0000 343c3431     013........314<4
 8002a65:	78303030 00000000 331e0000 6f606061     000x.......3a``o
 8002a75:	1d376363 00000000 63630000 637f6363     cc7.......cccc.c
 8002a85:	63636363 00000000 183c0000 18181818     cccc......<.....
 8002a95:	3c181818 00000000 060f0000 06060606     ...<............
 8002aa5:	3c666606 00000000 33730000 363c3636     .ff<......s366<6
 8002ab5:	73333336 00000000 30780000 30303030     633s......x00000
 8002ac5:	7f333130 00000000 77630000 63636b7f     013.......cw.kcc
 8002ad5:	63636363 00000000 63630000 6f7f7b73     cccc......ccs{.o
 8002ae5:	63636367 00000000 361c0000 63636363     gccc.......6cccc
 8002af5:	1c366363 00000000 337e0000 303e3333     cc6.......~333>0
 8002b05:	78303030 00000000 633e0000 63636363     000x......>ccccc
 8002b15:	3e6f6b63 00000706 337e0000 363e3333     cko>......~333>6
 8002b25:	73333336 00000000 633e0000 061c3063     633s......>cc0..
 8002b35:	3e636303 00000000 dbff0000 18181899     .cc>............
 8002b45:	3c181818 00000000 63630000 63636363     ...<......cccccc
 8002b55:	3e636363 00000000 63630000 63636363     ccc>......cccccc
 8002b65:	081c3663 00000000 63630000 6b636363     c6........ccccck
 8002b75:	36367f6b 00000000 c3c30000 18183c66     k.66........f<..
 8002b85:	c3c3663c 00000000 c3c30000 183c66c3     <f...........f<.
 8002b95:	3c181818 00000000 637f0000 180c0643     ...<.......cC...
 8002ba5:	7f636130 00000000 303c0000 30303030     0ac.......<00000
 8002bb5:	3c303030 00000000 c0800000 1c3870e0     000<.........p8.
 8002bc5:	0103070e 00000000 0c3c0000 0c0c0c0c     ..........<.....
 8002bd5:	3c0c0c0c 00000000 63361c08 00000000     ...<......6c....
	...
 8002bf9:	000000ff 000c1818 00000000 00000000     ................
	...
 8002c11:	06463c00 3b66663e 00000000 30700000     .<F.>ff;......p0
 8002c21:	33363c30 6e333333 00000000 00000000     0<63333n........
 8002c31:	60633e00 3e636060 00000000 060e0000     .>c```c>........
 8002c41:	66361e06 3b666666 00000000 00000000     ..6ffff;........
 8002c51:	63633e00 3e63607e 00000000 361c0000     .>cc~`c>.......6
 8002c61:	307c3032 78303030 00000000 00000000     20|0000x........
 8002c71:	66663b00 063e6666 00003c66 30700000     .;ffff>.f<....p0
 8002c81:	333b3630 73333333 00000000 0c0c0000     06;3333s........
 8002c91:	0c0c1c00 1e0c0c0c 00000000 06060000     ................
 8002ca1:	06060e00 66060606 00003c66 30700000     .......ff<....p0
 8002cb1:	36333330 7333363c 00000000 0c1c0000     0336<63s........
 8002cc1:	0c0c0c0c 1e0c0c0c 00000000 00000000     ................
 8002cd1:	6b7f6e00 6b6b6b6b 00000000 00000000     .n.kkkkk........
 8002ce1:	33336e00 33333333 00000000 00000000     .n333333........
 8002cf1:	63633e00 3e636363 00000000 00000000     .>ccccc>........
 8002d01:	33336e00 303e3333 00007830 00000000     .n3333>00x......
 8002d11:	66663b00 063e6666 00000f06 00000000     .;ffff>.........
 8002d21:	333b6e00 78303030 00000000 00000000     .n;3000x........
 8002d31:	38633e00 3e63030e 00000000 18080000     .>c8..c>........
 8002d41:	18187e18 0e1b1818 00000000 00000000     .~..............
 8002d51:	66666600 3b666666 00000000 00000000     .ffffff;........
 8002d61:	36636300 081c1c36 00000000 00000000     .cc66...........
 8002d71:	63636300 367f6b6b 00000000 00000000     .ccckk.6........
 8002d81:	1c366300 63361c1c 00000000 00000000     .c6...6c........
 8002d91:	63636300 033f6363 00003c06 00000000     .ccccc?..<......
 8002da1:	0c667f00 7f633018 00000000 180e0000     ..f..0c.........
 8002db1:	18701818 0e181818 00000000 18180000     ..p.............
 8002dc1:	00181818 18181818 00000018 18700000     ..............p.
 8002dd1:	180e1818 70181818 00000000 6e3b0000     .......p......;n
	...
 8002ded:	d8d87000 00000070 00000000 00000000     .p..p...........
 8002dfd:	6c65770a 656d6f63 206f7420 757a7553     .welcome to Suzu
 8002e0d:	534f6168 5e5f5e20 322e3220 420a302e     haOS ^_^ 2.2.0.B
 8002e1d:	444c4955 72614d20 20363220 36313032     UILD Mar 26 2016
 8002e2d:	3a333120 343a3130 25000a37 203a2075      13:01:47..%u : 
 8002e3d:	255b000a 69252069 5d692520 6f620020     ..[%i %i %i] .bo
 8002e4d:	6e69746f 72662067 25206d6f 72000a75     oting from %u..r
 8002e5d:	73206d61 74726174 20752520 6172000a     am start %u ..ra
 8002e6d:	6973206d 2520657a 000a2075 206d6172     m size %u ..ram 
 8002e7d:	65657266 20752520 6568000a 73207061     free %u ..heap s
 8002e8d:	74726174 20752520 0a0a000a 00000000              tart %u .......

08002e9c <__EH_FRAME_BEGIN__>:
 8002e9c:	00000000                                ....
