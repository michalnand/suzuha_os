
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
 80000e6:	f001 f911 	bl	800130c <sleep>
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
 80001d2:	f001 f88f 	bl	80012f4 <sys_tick_init>
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
 8000398:	f002 f918 	bl	80025cc <__aeabi_idivmod>
 800039c:	3130      	adds	r1, #48	; 0x30
 800039e:	5571      	strb	r1, [r6, r5]
 80003a0:	1c20      	adds	r0, r4, #0
 80003a2:	210a      	movs	r1, #10
 80003a4:	f002 f8bc 	bl	8002520 <__aeabi_idiv>
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
 80003d6:	f002 f899 	bl	800250c <__aeabi_uidivmod>
 80003da:	3130      	adds	r1, #48	; 0x30
 80003dc:	5531      	strb	r1, [r6, r4]
 80003de:	1c28      	adds	r0, r5, #0
 80003e0:	210a      	movs	r1, #10
 80003e2:	f002 f84f 	bl	8002484 <__aeabi_uidiv>
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
 8000518:	080025fc 	.word	0x080025fc

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
 800059a:	f000 fe07 	bl	80011ac <i2c_write_reg>
 800059e:	203c      	movs	r0, #60	; 0x3c
 80005a0:	2101      	movs	r1, #1
 80005a2:	1c22      	adds	r2, r4, #0
 80005a4:	f000 fe02 	bl	80011ac <i2c_write_reg>
 80005a8:	203c      	movs	r0, #60	; 0x3c
 80005aa:	2102      	movs	r1, #2
 80005ac:	1c22      	adds	r2, r4, #0
 80005ae:	f000 fdfd 	bl	80011ac <i2c_write_reg>
 80005b2:	203c      	movs	r0, #60	; 0x3c
 80005b4:	210a      	movs	r1, #10
 80005b6:	f000 fe0b 	bl	80011d0 <i2c_read_reg>
 80005ba:	2301      	movs	r3, #1
 80005bc:	2848      	cmp	r0, #72	; 0x48
 80005be:	d10f      	bne.n	80005e0 <hmc5883_init+0x58>
 80005c0:	203c      	movs	r0, #60	; 0x3c
 80005c2:	210b      	movs	r1, #11
 80005c4:	f000 fe04 	bl	80011d0 <i2c_read_reg>
 80005c8:	2302      	movs	r3, #2
 80005ca:	2834      	cmp	r0, #52	; 0x34
 80005cc:	d108      	bne.n	80005e0 <hmc5883_init+0x58>
 80005ce:	203c      	movs	r0, #60	; 0x3c
 80005d0:	210c      	movs	r1, #12
 80005d2:	f000 fdfd 	bl	80011d0 <i2c_read_reg>
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
 80005ee:	f000 fdef 	bl	80011d0 <i2c_read_reg>
 80005f2:	4c12      	ldr	r4, [pc, #72]	; (800063c <hmc5883_read+0x54>)
 80005f4:	0205      	lsls	r5, r0, #8
 80005f6:	b2ad      	uxth	r5, r5
 80005f8:	2104      	movs	r1, #4
 80005fa:	203c      	movs	r0, #60	; 0x3c
 80005fc:	8025      	strh	r5, [r4, #0]
 80005fe:	f000 fde7 	bl	80011d0 <i2c_read_reg>
 8000602:	2107      	movs	r1, #7
 8000604:	4305      	orrs	r5, r0
 8000606:	203c      	movs	r0, #60	; 0x3c
 8000608:	8025      	strh	r5, [r4, #0]
 800060a:	f000 fde1 	bl	80011d0 <i2c_read_reg>
 800060e:	0205      	lsls	r5, r0, #8
 8000610:	b2ad      	uxth	r5, r5
 8000612:	2108      	movs	r1, #8
 8000614:	203c      	movs	r0, #60	; 0x3c
 8000616:	8065      	strh	r5, [r4, #2]
 8000618:	f000 fdda 	bl	80011d0 <i2c_read_reg>
 800061c:	2105      	movs	r1, #5
 800061e:	4305      	orrs	r5, r0
 8000620:	203c      	movs	r0, #60	; 0x3c
 8000622:	8065      	strh	r5, [r4, #2]
 8000624:	f000 fdd4 	bl	80011d0 <i2c_read_reg>
 8000628:	0205      	lsls	r5, r0, #8
 800062a:	b2ad      	uxth	r5, r5
 800062c:	2106      	movs	r1, #6
 800062e:	203c      	movs	r0, #60	; 0x3c
 8000630:	80a5      	strh	r5, [r4, #4]
 8000632:	f000 fdcd 	bl	80011d0 <i2c_read_reg>
 8000636:	4305      	orrs	r5, r0
 8000638:	80a5      	strh	r5, [r4, #4]
 800063a:	bd38      	pop	{r3, r4, r5, pc}
 800063c:	2000018c 	.word	0x2000018c

08000640 <apds9950_read>:
 8000640:	b538      	push	{r3, r4, r5, lr}
 8000642:	f000 fd49 	bl	80010d8 <i2cStart>
 8000646:	2072      	movs	r0, #114	; 0x72
 8000648:	f000 fd62 	bl	8001110 <i2cWrite>
 800064c:	20b4      	movs	r0, #180	; 0xb4
 800064e:	f000 fd5f 	bl	8001110 <i2cWrite>
 8000652:	f000 fd41 	bl	80010d8 <i2cStart>
 8000656:	2073      	movs	r0, #115	; 0x73
 8000658:	f000 fd5a 	bl	8001110 <i2cWrite>
 800065c:	2001      	movs	r0, #1
 800065e:	f000 fd7f 	bl	8001160 <i2cRead>
 8000662:	4c1c      	ldr	r4, [pc, #112]	; (80006d4 <apds9950_read+0x94>)
 8000664:	1c05      	adds	r5, r0, #0
 8000666:	80e0      	strh	r0, [r4, #6]
 8000668:	2001      	movs	r0, #1
 800066a:	f000 fd79 	bl	8001160 <i2cRead>
 800066e:	0200      	lsls	r0, r0, #8
 8000670:	4305      	orrs	r5, r0
 8000672:	2001      	movs	r0, #1
 8000674:	80e5      	strh	r5, [r4, #6]
 8000676:	f000 fd73 	bl	8001160 <i2cRead>
 800067a:	8020      	strh	r0, [r4, #0]
 800067c:	1c05      	adds	r5, r0, #0
 800067e:	2001      	movs	r0, #1
 8000680:	f000 fd6e 	bl	8001160 <i2cRead>
 8000684:	0200      	lsls	r0, r0, #8
 8000686:	4305      	orrs	r5, r0
 8000688:	2001      	movs	r0, #1
 800068a:	8025      	strh	r5, [r4, #0]
 800068c:	f000 fd68 	bl	8001160 <i2cRead>
 8000690:	8060      	strh	r0, [r4, #2]
 8000692:	1c05      	adds	r5, r0, #0
 8000694:	2001      	movs	r0, #1
 8000696:	f000 fd63 	bl	8001160 <i2cRead>
 800069a:	0200      	lsls	r0, r0, #8
 800069c:	4305      	orrs	r5, r0
 800069e:	2001      	movs	r0, #1
 80006a0:	8065      	strh	r5, [r4, #2]
 80006a2:	f000 fd5d 	bl	8001160 <i2cRead>
 80006a6:	80a0      	strh	r0, [r4, #4]
 80006a8:	1c05      	adds	r5, r0, #0
 80006aa:	2001      	movs	r0, #1
 80006ac:	f000 fd58 	bl	8001160 <i2cRead>
 80006b0:	0200      	lsls	r0, r0, #8
 80006b2:	4305      	orrs	r5, r0
 80006b4:	2001      	movs	r0, #1
 80006b6:	80a5      	strh	r5, [r4, #4]
 80006b8:	f000 fd52 	bl	8001160 <i2cRead>
 80006bc:	8120      	strh	r0, [r4, #8]
 80006be:	1c05      	adds	r5, r0, #0
 80006c0:	2000      	movs	r0, #0
 80006c2:	f000 fd4d 	bl	8001160 <i2cRead>
 80006c6:	0200      	lsls	r0, r0, #8
 80006c8:	4305      	orrs	r5, r0
 80006ca:	8125      	strh	r5, [r4, #8]
 80006cc:	f000 fd12 	bl	80010f4 <i2cStop>
 80006d0:	bd38      	pop	{r3, r4, r5, pc}
 80006d2:	46c0      	nop			; (mov r8, r8)
 80006d4:	20000192 	.word	0x20000192

080006d8 <apds950_init>:
 80006d8:	b508      	push	{r3, lr}
 80006da:	2072      	movs	r0, #114	; 0x72
 80006dc:	2181      	movs	r1, #129	; 0x81
 80006de:	22ff      	movs	r2, #255	; 0xff
 80006e0:	f000 fd64 	bl	80011ac <i2c_write_reg>
 80006e4:	2072      	movs	r0, #114	; 0x72
 80006e6:	2183      	movs	r1, #131	; 0x83
 80006e8:	22ff      	movs	r2, #255	; 0xff
 80006ea:	f000 fd5f 	bl	80011ac <i2c_write_reg>
 80006ee:	2072      	movs	r0, #114	; 0x72
 80006f0:	218d      	movs	r1, #141	; 0x8d
 80006f2:	2200      	movs	r2, #0
 80006f4:	f000 fd5a 	bl	80011ac <i2c_write_reg>
 80006f8:	2072      	movs	r0, #114	; 0x72
 80006fa:	2180      	movs	r1, #128	; 0x80
 80006fc:	2203      	movs	r2, #3
 80006fe:	f000 fd55 	bl	80011ac <i2c_write_reg>
 8000702:	2072      	movs	r0, #114	; 0x72
 8000704:	218f      	movs	r1, #143	; 0x8f
 8000706:	2223      	movs	r2, #35	; 0x23
 8000708:	f000 fd50 	bl	80011ac <i2c_write_reg>
 800070c:	2072      	movs	r0, #114	; 0x72
 800070e:	2180      	movs	r1, #128	; 0x80
 8000710:	2207      	movs	r2, #7
 8000712:	f000 fd4b 	bl	80011ac <i2c_write_reg>
 8000716:	2072      	movs	r0, #114	; 0x72
 8000718:	218e      	movs	r1, #142	; 0x8e
 800071a:	2208      	movs	r2, #8
 800071c:	f000 fd46 	bl	80011ac <i2c_write_reg>
 8000720:	f7ff ff8e 	bl	8000640 <apds9950_read>
 8000724:	2000      	movs	r0, #0
 8000726:	bd08      	pop	{r3, pc}

08000728 <LCD_SH1106_write_command>:
 8000728:	b508      	push	{r3, lr}
 800072a:	1c02      	adds	r2, r0, #0
 800072c:	2100      	movs	r1, #0
 800072e:	2078      	movs	r0, #120	; 0x78
 8000730:	f000 fd3c 	bl	80011ac <i2c_write_reg>
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
 8000810:	f000 fc62 	bl	80010d8 <i2cStart>
 8000814:	2078      	movs	r0, #120	; 0x78
 8000816:	f000 fc7b 	bl	8001110 <i2cWrite>
 800081a:	2040      	movs	r0, #64	; 0x40
 800081c:	f000 fc78 	bl	8001110 <i2cWrite>
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
 800083a:	f000 fc69 	bl	8001110 <i2cWrite>
 800083e:	9b03      	ldr	r3, [sp, #12]
 8000840:	3301      	adds	r3, #1
 8000842:	9303      	str	r3, [sp, #12]
 8000844:	e7ee      	b.n	8000824 <LCD_SH1106_flush_buffer+0x54>
 8000846:	f000 fc55 	bl	80010f4 <i2cStop>
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
 80008d4:	f000 fc00 	bl	80010d8 <i2cStart>
 80008d8:	2078      	movs	r0, #120	; 0x78
 80008da:	f000 fc19 	bl	8001110 <i2cWrite>
 80008de:	2040      	movs	r0, #64	; 0x40
 80008e0:	f000 fc16 	bl	8001110 <i2cWrite>
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
 80008fe:	f000 fc07 	bl	8001110 <i2cWrite>
 8000902:	9b03      	ldr	r3, [sp, #12]
 8000904:	3301      	adds	r3, #1
 8000906:	9303      	str	r3, [sp, #12]
 8000908:	e7ee      	b.n	80008e8 <LCD_SH1106_flush_buffer_partial+0x80>
 800090a:	f000 fbf3 	bl	80010f4 <i2cStop>
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
 8000a50:	0800260d 	.word	0x0800260d

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
 8000a74:	f001 fdaa 	bl	80025cc <__aeabi_idivmod>
 8000a78:	3130      	adds	r1, #48	; 0x30
 8000a7a:	5571      	strb	r1, [r6, r5]
 8000a7c:	1c20      	adds	r0, r4, #0
 8000a7e:	210a      	movs	r1, #10
 8000a80:	f001 fd4e 	bl	8002520 <__aeabi_idiv>
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
 8000ac2:	f000 fb85 	bl	80011d0 <i2c_read_reg>
 8000ac6:	4c38      	ldr	r4, [pc, #224]	; (8000ba8 <mpu6050_read+0xec>)
 8000ac8:	0205      	lsls	r5, r0, #8
 8000aca:	b2ad      	uxth	r5, r5
 8000acc:	213c      	movs	r1, #60	; 0x3c
 8000ace:	20d0      	movs	r0, #208	; 0xd0
 8000ad0:	8025      	strh	r5, [r4, #0]
 8000ad2:	f000 fb7d 	bl	80011d0 <i2c_read_reg>
 8000ad6:	213d      	movs	r1, #61	; 0x3d
 8000ad8:	4305      	orrs	r5, r0
 8000ada:	20d0      	movs	r0, #208	; 0xd0
 8000adc:	8025      	strh	r5, [r4, #0]
 8000ade:	f000 fb77 	bl	80011d0 <i2c_read_reg>
 8000ae2:	0205      	lsls	r5, r0, #8
 8000ae4:	b2ad      	uxth	r5, r5
 8000ae6:	213e      	movs	r1, #62	; 0x3e
 8000ae8:	20d0      	movs	r0, #208	; 0xd0
 8000aea:	8065      	strh	r5, [r4, #2]
 8000aec:	f000 fb70 	bl	80011d0 <i2c_read_reg>
 8000af0:	213f      	movs	r1, #63	; 0x3f
 8000af2:	4305      	orrs	r5, r0
 8000af4:	20d0      	movs	r0, #208	; 0xd0
 8000af6:	8065      	strh	r5, [r4, #2]
 8000af8:	f000 fb6a 	bl	80011d0 <i2c_read_reg>
 8000afc:	0205      	lsls	r5, r0, #8
 8000afe:	b2ad      	uxth	r5, r5
 8000b00:	2140      	movs	r1, #64	; 0x40
 8000b02:	20d0      	movs	r0, #208	; 0xd0
 8000b04:	80a5      	strh	r5, [r4, #4]
 8000b06:	f000 fb63 	bl	80011d0 <i2c_read_reg>
 8000b0a:	2141      	movs	r1, #65	; 0x41
 8000b0c:	4305      	orrs	r5, r0
 8000b0e:	20d0      	movs	r0, #208	; 0xd0
 8000b10:	80a5      	strh	r5, [r4, #4]
 8000b12:	f000 fb5d 	bl	80011d0 <i2c_read_reg>
 8000b16:	0205      	lsls	r5, r0, #8
 8000b18:	b2ad      	uxth	r5, r5
 8000b1a:	2142      	movs	r1, #66	; 0x42
 8000b1c:	20d0      	movs	r0, #208	; 0xd0
 8000b1e:	8425      	strh	r5, [r4, #32]
 8000b20:	f000 fb56 	bl	80011d0 <i2c_read_reg>
 8000b24:	2143      	movs	r1, #67	; 0x43
 8000b26:	4305      	orrs	r5, r0
 8000b28:	20d0      	movs	r0, #208	; 0xd0
 8000b2a:	8425      	strh	r5, [r4, #32]
 8000b2c:	f000 fb50 	bl	80011d0 <i2c_read_reg>
 8000b30:	0205      	lsls	r5, r0, #8
 8000b32:	b2ad      	uxth	r5, r5
 8000b34:	2144      	movs	r1, #68	; 0x44
 8000b36:	20d0      	movs	r0, #208	; 0xd0
 8000b38:	80e5      	strh	r5, [r4, #6]
 8000b3a:	f000 fb49 	bl	80011d0 <i2c_read_reg>
 8000b3e:	2145      	movs	r1, #69	; 0x45
 8000b40:	4305      	orrs	r5, r0
 8000b42:	20d0      	movs	r0, #208	; 0xd0
 8000b44:	80e5      	strh	r5, [r4, #6]
 8000b46:	f000 fb43 	bl	80011d0 <i2c_read_reg>
 8000b4a:	0205      	lsls	r5, r0, #8
 8000b4c:	b2ad      	uxth	r5, r5
 8000b4e:	2146      	movs	r1, #70	; 0x46
 8000b50:	20d0      	movs	r0, #208	; 0xd0
 8000b52:	8125      	strh	r5, [r4, #8]
 8000b54:	f000 fb3c 	bl	80011d0 <i2c_read_reg>
 8000b58:	2147      	movs	r1, #71	; 0x47
 8000b5a:	4305      	orrs	r5, r0
 8000b5c:	20d0      	movs	r0, #208	; 0xd0
 8000b5e:	8125      	strh	r5, [r4, #8]
 8000b60:	f000 fb36 	bl	80011d0 <i2c_read_reg>
 8000b64:	0205      	lsls	r5, r0, #8
 8000b66:	2148      	movs	r1, #72	; 0x48
 8000b68:	b2ad      	uxth	r5, r5
 8000b6a:	20d0      	movs	r0, #208	; 0xd0
 8000b6c:	8165      	strh	r5, [r4, #10]
 8000b6e:	f000 fb2f 	bl	80011d0 <i2c_read_reg>
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
 8000bc6:	f000 faf1 	bl	80011ac <i2c_write_reg>
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
 8000bf8:	f001 fc92 	bl	8002520 <__aeabi_idiv>
 8000bfc:	2164      	movs	r1, #100	; 0x64
 8000bfe:	81a0      	strh	r0, [r4, #12]
 8000c00:	9801      	ldr	r0, [sp, #4]
 8000c02:	f001 fc8d 	bl	8002520 <__aeabi_idiv>
 8000c06:	2164      	movs	r1, #100	; 0x64
 8000c08:	81e0      	strh	r0, [r4, #14]
 8000c0a:	1c30      	adds	r0, r6, #0
 8000c0c:	f001 fc88 	bl	8002520 <__aeabi_idiv>
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
 8000c52:	f001 fbb9 	bl	80023c8 <led_on>
 8000c56:	f7ff fcc7 	bl	80005e8 <hmc5883_read>
 8000c5a:	f7ff ff2f 	bl	8000abc <mpu6050_read>
 8000c5e:	f7ff fcef 	bl	8000640 <apds9950_read>
 8000c62:	2008      	movs	r0, #8
 8000c64:	f001 fbc4 	bl	80023f0 <led_off>
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
 8000ce4:	f001 fb70 	bl	80023c8 <led_on>
 8000ce8:	4821      	ldr	r0, [pc, #132]	; (8000d70 <main_thread+0x90>)
 8000cea:	f7ff fb9d 	bl	8000428 <printf_>
 8000cee:	2280      	movs	r2, #128	; 0x80
 8000cf0:	4820      	ldr	r0, [pc, #128]	; (8000d74 <main_thread+0x94>)
 8000cf2:	4921      	ldr	r1, [pc, #132]	; (8000d78 <main_thread+0x98>)
 8000cf4:	0052      	lsls	r2, r2, #1
 8000cf6:	2308      	movs	r3, #8
 8000cf8:	f7ff fa70 	bl	80001dc <create_thread>
 8000cfc:	2008      	movs	r0, #8
 8000cfe:	f001 fb63 	bl	80023c8 <led_on>
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
 8000d60:	f001 fb46 	bl	80023f0 <led_off>
 8000d64:	20fa      	movs	r0, #250	; 0xfa
 8000d66:	0080      	lsls	r0, r0, #2
 8000d68:	f000 f8d2 	bl	8000f10 <timer_delay_ms>
 8000d6c:	e7c6      	b.n	8000cfc <main_thread+0x1c>
 8000d6e:	46c0      	nop			; (mov r8, r8)
 8000d70:	08002c0d 	.word	0x08002c0d
 8000d74:	08000c21 	.word	0x08000c21
 8000d78:	200005c4 	.word	0x200005c4
 8000d7c:	08002c48 	.word	0x08002c48
 8000d80:	200005a0 	.word	0x200005a0
 8000d84:	08002c4f 	.word	0x08002c4f
 8000d88:	2000018c 	.word	0x2000018c
 8000d8c:	20000192 	.word	0x20000192
 8000d90:	08002ca8 	.word	0x08002ca8

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
 8000dd0:	08002c5b 	.word	0x08002c5b
 8000dd4:	080025e4 	.word	0x080025e4
 8000dd8:	20000000 	.word	0x20000000
 8000ddc:	08002c6c 	.word	0x08002c6c
 8000de0:	20001000 	.word	0x20001000
 8000de4:	08002c7b 	.word	0x08002c7b
 8000de8:	200007f5 	.word	0x200007f5
 8000dec:	08002c89 	.word	0x08002c89
 8000df0:	200007f5 	.word	0x200007f5
 8000df4:	08002c97 	.word	0x08002c97
 8000df8:	08002ca7 	.word	0x08002ca7

08000dfc <main>:
 8000dfc:	b508      	push	{r3, lr}
 8000dfe:	f000 fb2b 	bl	8001458 <lib_low_level_init>
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
 8000e50:	f001 f9f6 	bl	8002240 <RCC_APB1PeriphClockCmd>
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
 8000e6a:	f000 fc93 	bl	8001794 <TIM_TimeBaseInit>
 8000e6e:	2080      	movs	r0, #128	; 0x80
 8000e70:	05c0      	lsls	r0, r0, #23
 8000e72:	2101      	movs	r1, #1
 8000e74:	f000 fd10 	bl	8001898 <TIM_Cmd>
 8000e78:	2080      	movs	r0, #128	; 0x80
 8000e7a:	2102      	movs	r1, #2
 8000e7c:	05c0      	lsls	r0, r0, #23
 8000e7e:	2201      	movs	r2, #1
 8000e80:	f000 fd4e 	bl	8001920 <TIM_ITConfig>
 8000e84:	466a      	mov	r2, sp
 8000e86:	230f      	movs	r3, #15
 8000e88:	7013      	strb	r3, [r2, #0]
 8000e8a:	4668      	mov	r0, sp
 8000e8c:	2301      	movs	r3, #1
 8000e8e:	7053      	strb	r3, [r2, #1]
 8000e90:	7093      	strb	r3, [r2, #2]
 8000e92:	f001 f85b 	bl	8001f4c <NVIC_Init>
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
 8000f26:	f000 f9f1 	bl	800130c <sleep>
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

08000f98 <uart_init>:
 8000f98:	b570      	push	{r4, r5, r6, lr}
 8000f9a:	2080      	movs	r0, #128	; 0x80
 8000f9c:	b088      	sub	sp, #32
 8000f9e:	0280      	lsls	r0, r0, #10
 8000fa0:	2101      	movs	r1, #1
 8000fa2:	f001 f90d 	bl	80021c0 <RCC_AHBPeriphClockCmd>
 8000fa6:	2690      	movs	r6, #144	; 0x90
 8000fa8:	2080      	movs	r0, #128	; 0x80
 8000faa:	05f6      	lsls	r6, r6, #23
 8000fac:	01c0      	lsls	r0, r0, #7
 8000fae:	2101      	movs	r1, #1
 8000fb0:	f001 f926 	bl	8002200 <RCC_APB2PeriphClockCmd>
 8000fb4:	1c30      	adds	r0, r6, #0
 8000fb6:	2102      	movs	r1, #2
 8000fb8:	2201      	movs	r2, #1
 8000fba:	f000 fba5 	bl	8001708 <GPIO_PinAFConfig>
 8000fbe:	1c30      	adds	r0, r6, #0
 8000fc0:	210f      	movs	r1, #15
 8000fc2:	2201      	movs	r2, #1
 8000fc4:	f000 fba0 	bl	8001708 <GPIO_PinAFConfig>
 8000fc8:	4b10      	ldr	r3, [pc, #64]	; (800100c <uart_init+0x74>)
 8000fca:	466a      	mov	r2, sp
 8000fcc:	2400      	movs	r4, #0
 8000fce:	2501      	movs	r5, #1
 8000fd0:	9300      	str	r3, [sp, #0]
 8000fd2:	1c30      	adds	r0, r6, #0
 8000fd4:	2302      	movs	r3, #2
 8000fd6:	4669      	mov	r1, sp
 8000fd8:	7113      	strb	r3, [r2, #4]
 8000fda:	7194      	strb	r4, [r2, #6]
 8000fdc:	7155      	strb	r5, [r2, #5]
 8000fde:	71d5      	strb	r5, [r2, #7]
 8000fe0:	f000 fb0e 	bl	8001600 <GPIO_Init>
 8000fe4:	9403      	str	r4, [sp, #12]
 8000fe6:	9404      	str	r4, [sp, #16]
 8000fe8:	9405      	str	r4, [sp, #20]
 8000fea:	9407      	str	r4, [sp, #28]
 8000fec:	23e1      	movs	r3, #225	; 0xe1
 8000fee:	4c08      	ldr	r4, [pc, #32]	; (8001010 <uart_init+0x78>)
 8000ff0:	025b      	lsls	r3, r3, #9
 8000ff2:	9302      	str	r3, [sp, #8]
 8000ff4:	1c20      	adds	r0, r4, #0
 8000ff6:	230c      	movs	r3, #12
 8000ff8:	a902      	add	r1, sp, #8
 8000ffa:	9306      	str	r3, [sp, #24]
 8000ffc:	f000 fce0 	bl	80019c0 <USART_Init>
 8001000:	1c20      	adds	r0, r4, #0
 8001002:	1c29      	adds	r1, r5, #0
 8001004:	f000 fdaa 	bl	8001b5c <USART_Cmd>
 8001008:	b008      	add	sp, #32
 800100a:	bd70      	pop	{r4, r5, r6, pc}
 800100c:	00008004 	.word	0x00008004
 8001010:	40013800 	.word	0x40013800

08001014 <USART1_IRQHandler>:
 8001014:	b508      	push	{r3, lr}
 8001016:	4802      	ldr	r0, [pc, #8]	; (8001020 <USART1_IRQHandler+0xc>)
 8001018:	4902      	ldr	r1, [pc, #8]	; (8001024 <USART1_IRQHandler+0x10>)
 800101a:	f000 fddf 	bl	8001bdc <USART_ClearITPendingBit>
 800101e:	bd08      	pop	{r3, pc}
 8001020:	40013800 	.word	0x40013800
 8001024:	00050105 	.word	0x00050105

08001028 <i2c_delay>:
 8001028:	46c0      	nop			; (mov r8, r8)
 800102a:	4770      	bx	lr

0800102c <SetLowSDA>:
 800102c:	b508      	push	{r3, lr}
 800102e:	b672      	cpsid	i
 8001030:	4b07      	ldr	r3, [pc, #28]	; (8001050 <SetLowSDA+0x24>)
 8001032:	2210      	movs	r2, #16
 8001034:	851a      	strh	r2, [r3, #40]	; 0x28
 8001036:	685a      	ldr	r2, [r3, #4]
 8001038:	b292      	uxth	r2, r2
 800103a:	809a      	strh	r2, [r3, #4]
 800103c:	6819      	ldr	r1, [r3, #0]
 800103e:	2280      	movs	r2, #128	; 0x80
 8001040:	0052      	lsls	r2, r2, #1
 8001042:	430a      	orrs	r2, r1
 8001044:	601a      	str	r2, [r3, #0]
 8001046:	b662      	cpsie	i
 8001048:	f7ff ffee 	bl	8001028 <i2c_delay>
 800104c:	bd08      	pop	{r3, pc}
 800104e:	46c0      	nop			; (mov r8, r8)
 8001050:	48000400 	.word	0x48000400

08001054 <SetHighSDA>:
 8001054:	b508      	push	{r3, lr}
 8001056:	b672      	cpsid	i
 8001058:	4b07      	ldr	r3, [pc, #28]	; (8001078 <SetHighSDA+0x24>)
 800105a:	2210      	movs	r2, #16
 800105c:	619a      	str	r2, [r3, #24]
 800105e:	6859      	ldr	r1, [r3, #4]
 8001060:	b289      	uxth	r1, r1
 8001062:	4391      	bics	r1, r2
 8001064:	8099      	strh	r1, [r3, #4]
 8001066:	6819      	ldr	r1, [r3, #0]
 8001068:	4a04      	ldr	r2, [pc, #16]	; (800107c <SetHighSDA+0x28>)
 800106a:	400a      	ands	r2, r1
 800106c:	601a      	str	r2, [r3, #0]
 800106e:	b662      	cpsie	i
 8001070:	f7ff ffda 	bl	8001028 <i2c_delay>
 8001074:	bd08      	pop	{r3, pc}
 8001076:	46c0      	nop			; (mov r8, r8)
 8001078:	48000400 	.word	0x48000400
 800107c:	fffffcff 	.word	0xfffffcff

08001080 <SetLowSCL>:
 8001080:	b508      	push	{r3, lr}
 8001082:	4b03      	ldr	r3, [pc, #12]	; (8001090 <SetLowSCL+0x10>)
 8001084:	2220      	movs	r2, #32
 8001086:	851a      	strh	r2, [r3, #40]	; 0x28
 8001088:	f7ff ffce 	bl	8001028 <i2c_delay>
 800108c:	bd08      	pop	{r3, pc}
 800108e:	46c0      	nop			; (mov r8, r8)
 8001090:	48000400 	.word	0x48000400

08001094 <SetHighSCL>:
 8001094:	b508      	push	{r3, lr}
 8001096:	4b03      	ldr	r3, [pc, #12]	; (80010a4 <SetHighSCL+0x10>)
 8001098:	2220      	movs	r2, #32
 800109a:	619a      	str	r2, [r3, #24]
 800109c:	f7ff ffc4 	bl	8001028 <i2c_delay>
 80010a0:	bd08      	pop	{r3, pc}
 80010a2:	46c0      	nop			; (mov r8, r8)
 80010a4:	48000400 	.word	0x48000400

080010a8 <i2c_0_init>:
 80010a8:	b507      	push	{r0, r1, r2, lr}
 80010aa:	2330      	movs	r3, #48	; 0x30
 80010ac:	4669      	mov	r1, sp
 80010ae:	9300      	str	r3, [sp, #0]
 80010b0:	2301      	movs	r3, #1
 80010b2:	710b      	strb	r3, [r1, #4]
 80010b4:	2203      	movs	r2, #3
 80010b6:	2300      	movs	r3, #0
 80010b8:	4806      	ldr	r0, [pc, #24]	; (80010d4 <i2c_0_init+0x2c>)
 80010ba:	718b      	strb	r3, [r1, #6]
 80010bc:	714a      	strb	r2, [r1, #5]
 80010be:	71cb      	strb	r3, [r1, #7]
 80010c0:	f000 fa9e 	bl	8001600 <GPIO_Init>
 80010c4:	f7ff ffe6 	bl	8001094 <SetHighSCL>
 80010c8:	f7ff ffb0 	bl	800102c <SetLowSDA>
 80010cc:	f7ff ffc2 	bl	8001054 <SetHighSDA>
 80010d0:	bd07      	pop	{r0, r1, r2, pc}
 80010d2:	46c0      	nop			; (mov r8, r8)
 80010d4:	48000400 	.word	0x48000400

080010d8 <i2cStart>:
 80010d8:	b508      	push	{r3, lr}
 80010da:	f7ff ffdb 	bl	8001094 <SetHighSCL>
 80010de:	f7ff ffb9 	bl	8001054 <SetHighSDA>
 80010e2:	f7ff ffd7 	bl	8001094 <SetHighSCL>
 80010e6:	f7ff ffa1 	bl	800102c <SetLowSDA>
 80010ea:	f7ff ffc9 	bl	8001080 <SetLowSCL>
 80010ee:	f7ff ffb1 	bl	8001054 <SetHighSDA>
 80010f2:	bd08      	pop	{r3, pc}

080010f4 <i2cStop>:
 80010f4:	b508      	push	{r3, lr}
 80010f6:	f7ff ffc3 	bl	8001080 <SetLowSCL>
 80010fa:	f7ff ff97 	bl	800102c <SetLowSDA>
 80010fe:	f7ff ffc9 	bl	8001094 <SetHighSCL>
 8001102:	f7ff ff93 	bl	800102c <SetLowSDA>
 8001106:	f7ff ffc5 	bl	8001094 <SetHighSCL>
 800110a:	f7ff ffa3 	bl	8001054 <SetHighSDA>
 800110e:	bd08      	pop	{r3, pc}

08001110 <i2cWrite>:
 8001110:	b538      	push	{r3, r4, r5, lr}
 8001112:	1c05      	adds	r5, r0, #0
 8001114:	2408      	movs	r4, #8
 8001116:	f7ff ffb3 	bl	8001080 <SetLowSCL>
 800111a:	b26b      	sxtb	r3, r5
 800111c:	2b00      	cmp	r3, #0
 800111e:	da02      	bge.n	8001126 <i2cWrite+0x16>
 8001120:	f7ff ff98 	bl	8001054 <SetHighSDA>
 8001124:	e001      	b.n	800112a <i2cWrite+0x1a>
 8001126:	f7ff ff81 	bl	800102c <SetLowSDA>
 800112a:	3c01      	subs	r4, #1
 800112c:	006d      	lsls	r5, r5, #1
 800112e:	b2e4      	uxtb	r4, r4
 8001130:	f7ff ffb0 	bl	8001094 <SetHighSCL>
 8001134:	b2ed      	uxtb	r5, r5
 8001136:	2c00      	cmp	r4, #0
 8001138:	d1ed      	bne.n	8001116 <i2cWrite+0x6>
 800113a:	f7ff ffa1 	bl	8001080 <SetLowSCL>
 800113e:	f7ff ff89 	bl	8001054 <SetHighSDA>
 8001142:	f7ff ffa7 	bl	8001094 <SetHighSCL>
 8001146:	4b05      	ldr	r3, [pc, #20]	; (800115c <i2cWrite+0x4c>)
 8001148:	691c      	ldr	r4, [r3, #16]
 800114a:	f7ff ff99 	bl	8001080 <SetLowSCL>
 800114e:	b2a4      	uxth	r4, r4
 8001150:	f7ff ff6a 	bl	8001028 <i2c_delay>
 8001154:	0924      	lsrs	r4, r4, #4
 8001156:	2001      	movs	r0, #1
 8001158:	43a0      	bics	r0, r4
 800115a:	bd38      	pop	{r3, r4, r5, pc}
 800115c:	48000400 	.word	0x48000400

08001160 <i2cRead>:
 8001160:	b570      	push	{r4, r5, r6, lr}
 8001162:	1c06      	adds	r6, r0, #0
 8001164:	f7ff ff8c 	bl	8001080 <SetLowSCL>
 8001168:	f7ff ff74 	bl	8001054 <SetHighSDA>
 800116c:	2508      	movs	r5, #8
 800116e:	2400      	movs	r4, #0
 8001170:	f7ff ff90 	bl	8001094 <SetHighSCL>
 8001174:	4b0c      	ldr	r3, [pc, #48]	; (80011a8 <i2cRead+0x48>)
 8001176:	0064      	lsls	r4, r4, #1
 8001178:	691b      	ldr	r3, [r3, #16]
 800117a:	b2e4      	uxtb	r4, r4
 800117c:	06da      	lsls	r2, r3, #27
 800117e:	d501      	bpl.n	8001184 <i2cRead+0x24>
 8001180:	3401      	adds	r4, #1
 8001182:	b2e4      	uxtb	r4, r4
 8001184:	3d01      	subs	r5, #1
 8001186:	b2ed      	uxtb	r5, r5
 8001188:	f7ff ff7a 	bl	8001080 <SetLowSCL>
 800118c:	2d00      	cmp	r5, #0
 800118e:	d1ef      	bne.n	8001170 <i2cRead+0x10>
 8001190:	2e00      	cmp	r6, #0
 8001192:	d001      	beq.n	8001198 <i2cRead+0x38>
 8001194:	f7ff ff4a 	bl	800102c <SetLowSDA>
 8001198:	f7ff ff7c 	bl	8001094 <SetHighSCL>
 800119c:	f7ff ff70 	bl	8001080 <SetLowSCL>
 80011a0:	f7ff ff42 	bl	8001028 <i2c_delay>
 80011a4:	1c20      	adds	r0, r4, #0
 80011a6:	bd70      	pop	{r4, r5, r6, pc}
 80011a8:	48000400 	.word	0x48000400

080011ac <i2c_write_reg>:
 80011ac:	b570      	push	{r4, r5, r6, lr}
 80011ae:	1c06      	adds	r6, r0, #0
 80011b0:	1c0d      	adds	r5, r1, #0
 80011b2:	1c14      	adds	r4, r2, #0
 80011b4:	f7ff ff90 	bl	80010d8 <i2cStart>
 80011b8:	1c30      	adds	r0, r6, #0
 80011ba:	f7ff ffa9 	bl	8001110 <i2cWrite>
 80011be:	1c28      	adds	r0, r5, #0
 80011c0:	f7ff ffa6 	bl	8001110 <i2cWrite>
 80011c4:	1c20      	adds	r0, r4, #0
 80011c6:	f7ff ffa3 	bl	8001110 <i2cWrite>
 80011ca:	f7ff ff93 	bl	80010f4 <i2cStop>
 80011ce:	bd70      	pop	{r4, r5, r6, pc}

080011d0 <i2c_read_reg>:
 80011d0:	b538      	push	{r3, r4, r5, lr}
 80011d2:	1c04      	adds	r4, r0, #0
 80011d4:	1c0d      	adds	r5, r1, #0
 80011d6:	f7ff ff7f 	bl	80010d8 <i2cStart>
 80011da:	1c20      	adds	r0, r4, #0
 80011dc:	f7ff ff98 	bl	8001110 <i2cWrite>
 80011e0:	1c28      	adds	r0, r5, #0
 80011e2:	f7ff ff95 	bl	8001110 <i2cWrite>
 80011e6:	f7ff ff77 	bl	80010d8 <i2cStart>
 80011ea:	2001      	movs	r0, #1
 80011ec:	4320      	orrs	r0, r4
 80011ee:	f7ff ff8f 	bl	8001110 <i2cWrite>
 80011f2:	2000      	movs	r0, #0
 80011f4:	f7ff ffb4 	bl	8001160 <i2cRead>
 80011f8:	1c04      	adds	r4, r0, #0
 80011fa:	f7ff ff7b 	bl	80010f4 <i2cStop>
 80011fe:	1c20      	adds	r0, r4, #0
 8001200:	bd38      	pop	{r3, r4, r5, pc}
	...

08001204 <adc_random_init>:
 8001204:	b570      	push	{r4, r5, r6, lr}
 8001206:	2001      	movs	r0, #1
 8001208:	f000 fde2 	bl	8001dd0 <ADC_TempSensorCmd>
 800120c:	2180      	movs	r1, #128	; 0x80
 800120e:	4813      	ldr	r0, [pc, #76]	; (800125c <adc_random_init+0x58>)
 8001210:	0249      	lsls	r1, r1, #9
 8001212:	2200      	movs	r2, #0
 8001214:	f000 fdf4 	bl	8001e00 <ADC_ChannelConfig>
 8001218:	2420      	movs	r4, #32
 800121a:	2500      	movs	r5, #0
 800121c:	480f      	ldr	r0, [pc, #60]	; (800125c <adc_random_init+0x58>)
 800121e:	f000 fe2f 	bl	8001e80 <ADC_StartOfConversion>
 8001222:	480e      	ldr	r0, [pc, #56]	; (800125c <adc_random_init+0x58>)
 8001224:	2104      	movs	r1, #4
 8001226:	f000 fe49 	bl	8001ebc <ADC_GetFlagStatus>
 800122a:	2800      	cmp	r0, #0
 800122c:	d101      	bne.n	8001232 <adc_random_init+0x2e>
 800122e:	46c0      	nop			; (mov r8, r8)
 8001230:	e7f7      	b.n	8001222 <adc_random_init+0x1e>
 8001232:	480a      	ldr	r0, [pc, #40]	; (800125c <adc_random_init+0x58>)
 8001234:	f000 fe34 	bl	8001ea0 <ADC_GetConversionValue>
 8001238:	006e      	lsls	r6, r5, #1
 800123a:	2301      	movs	r3, #1
 800123c:	1c05      	adds	r5, r0, #0
 800123e:	401d      	ands	r5, r3
 8001240:	4806      	ldr	r0, [pc, #24]	; (800125c <adc_random_init+0x58>)
 8001242:	2104      	movs	r1, #4
 8001244:	3c01      	subs	r4, #1
 8001246:	4335      	orrs	r5, r6
 8001248:	f000 fe68 	bl	8001f1c <ADC_ClearFlag>
 800124c:	2c00      	cmp	r4, #0
 800124e:	d1e5      	bne.n	800121c <adc_random_init+0x18>
 8001250:	1c20      	adds	r0, r4, #0
 8001252:	f000 fdbd 	bl	8001dd0 <ADC_TempSensorCmd>
 8001256:	1c28      	adds	r0, r5, #0
 8001258:	bd70      	pop	{r4, r5, r6, pc}
 800125a:	46c0      	nop			; (mov r8, r8)
 800125c:	40012400 	.word	0x40012400

08001260 <adc_init>:
 8001260:	b530      	push	{r4, r5, lr}
 8001262:	2090      	movs	r0, #144	; 0x90
 8001264:	b089      	sub	sp, #36	; 0x24
 8001266:	466a      	mov	r2, sp
 8001268:	2303      	movs	r3, #3
 800126a:	2401      	movs	r4, #1
 800126c:	2500      	movs	r5, #0
 800126e:	05c0      	lsls	r0, r0, #23
 8001270:	4669      	mov	r1, sp
 8001272:	7113      	strb	r3, [r2, #4]
 8001274:	71d5      	strb	r5, [r2, #7]
 8001276:	9400      	str	r4, [sp, #0]
 8001278:	f000 f9c2 	bl	8001600 <GPIO_Init>
 800127c:	2080      	movs	r0, #128	; 0x80
 800127e:	0080      	lsls	r0, r0, #2
 8001280:	1c21      	adds	r1, r4, #0
 8001282:	f000 ffbd 	bl	8002200 <RCC_APB2PeriphClockCmd>
 8001286:	1c28      	adds	r0, r5, #0
 8001288:	f000 feae 	bl	8001fe8 <RCC_ADCCLKConfig>
 800128c:	1c20      	adds	r0, r4, #0
 800128e:	f000 fe97 	bl	8001fc0 <RCC_HSI14Cmd>
 8001292:	2061      	movs	r0, #97	; 0x61
 8001294:	f001 f814 	bl	80022c0 <RCC_GetFlagStatus>
 8001298:	2800      	cmp	r0, #0
 800129a:	d101      	bne.n	80012a0 <adc_init+0x40>
 800129c:	46c0      	nop			; (mov r8, r8)
 800129e:	e7f8      	b.n	8001292 <adc_init+0x32>
 80012a0:	4811      	ldr	r0, [pc, #68]	; (80012e8 <adc_init+0x88>)
 80012a2:	f000 fd0f 	bl	8001cc4 <ADC_DeInit>
 80012a6:	a902      	add	r1, sp, #8
 80012a8:	2300      	movs	r3, #0
 80012aa:	480f      	ldr	r0, [pc, #60]	; (80012e8 <adc_init+0x88>)
 80012ac:	710b      	strb	r3, [r1, #4]
 80012ae:	610b      	str	r3, [r1, #16]
 80012b0:	614b      	str	r3, [r1, #20]
 80012b2:	608b      	str	r3, [r1, #8]
 80012b4:	60cb      	str	r3, [r1, #12]
 80012b6:	9302      	str	r3, [sp, #8]
 80012b8:	f000 fd1c 	bl	8001cf4 <ADC_Init>
 80012bc:	480a      	ldr	r0, [pc, #40]	; (80012e8 <adc_init+0x88>)
 80012be:	f000 fdbf 	bl	8001e40 <ADC_GetCalibrationFactor>
 80012c2:	4809      	ldr	r0, [pc, #36]	; (80012e8 <adc_init+0x88>)
 80012c4:	2101      	movs	r1, #1
 80012c6:	f000 fd67 	bl	8001d98 <ADC_Cmd>
 80012ca:	4807      	ldr	r0, [pc, #28]	; (80012e8 <adc_init+0x88>)
 80012cc:	2101      	movs	r1, #1
 80012ce:	f000 fdf5 	bl	8001ebc <ADC_GetFlagStatus>
 80012d2:	2800      	cmp	r0, #0
 80012d4:	d101      	bne.n	80012da <adc_init+0x7a>
 80012d6:	46c0      	nop			; (mov r8, r8)
 80012d8:	e7f7      	b.n	80012ca <adc_init+0x6a>
 80012da:	f7ff ff93 	bl	8001204 <adc_random_init>
 80012de:	4b03      	ldr	r3, [pc, #12]	; (80012ec <adc_init+0x8c>)
 80012e0:	6018      	str	r0, [r3, #0]
 80012e2:	b009      	add	sp, #36	; 0x24
 80012e4:	bd30      	pop	{r4, r5, pc}
 80012e6:	46c0      	nop			; (mov r8, r8)
 80012e8:	40012400 	.word	0x40012400
 80012ec:	20000010 	.word	0x20000010

080012f0 <assert_param>:
 80012f0:	4770      	bx	lr
	...

080012f4 <sys_tick_init>:
 80012f4:	4b03      	ldr	r3, [pc, #12]	; (8001304 <sys_tick_init+0x10>)
 80012f6:	4a04      	ldr	r2, [pc, #16]	; (8001308 <sys_tick_init+0x14>)
 80012f8:	605a      	str	r2, [r3, #4]
 80012fa:	2200      	movs	r2, #0
 80012fc:	609a      	str	r2, [r3, #8]
 80012fe:	2207      	movs	r2, #7
 8001300:	601a      	str	r2, [r3, #0]
 8001302:	4770      	bx	lr
 8001304:	e000e010 	.word	0xe000e010
 8001308:	0000bb80 	.word	0x0000bb80

0800130c <sleep>:
 800130c:	bf30      	wfi
 800130e:	4770      	bx	lr

08001310 <SystemInit>:
 8001310:	4b26      	ldr	r3, [pc, #152]	; (80013ac <SystemInit+0x9c>)
 8001312:	2201      	movs	r2, #1
 8001314:	6819      	ldr	r1, [r3, #0]
 8001316:	b082      	sub	sp, #8
 8001318:	4311      	orrs	r1, r2
 800131a:	6019      	str	r1, [r3, #0]
 800131c:	6858      	ldr	r0, [r3, #4]
 800131e:	4924      	ldr	r1, [pc, #144]	; (80013b0 <SystemInit+0xa0>)
 8001320:	4001      	ands	r1, r0
 8001322:	6059      	str	r1, [r3, #4]
 8001324:	6818      	ldr	r0, [r3, #0]
 8001326:	4923      	ldr	r1, [pc, #140]	; (80013b4 <SystemInit+0xa4>)
 8001328:	4001      	ands	r1, r0
 800132a:	6019      	str	r1, [r3, #0]
 800132c:	6818      	ldr	r0, [r3, #0]
 800132e:	4922      	ldr	r1, [pc, #136]	; (80013b8 <SystemInit+0xa8>)
 8001330:	4001      	ands	r1, r0
 8001332:	6019      	str	r1, [r3, #0]
 8001334:	6858      	ldr	r0, [r3, #4]
 8001336:	4921      	ldr	r1, [pc, #132]	; (80013bc <SystemInit+0xac>)
 8001338:	4001      	ands	r1, r0
 800133a:	6059      	str	r1, [r3, #4]
 800133c:	6ad9      	ldr	r1, [r3, #44]	; 0x2c
 800133e:	200f      	movs	r0, #15
 8001340:	4381      	bics	r1, r0
 8001342:	62d9      	str	r1, [r3, #44]	; 0x2c
 8001344:	6b18      	ldr	r0, [r3, #48]	; 0x30
 8001346:	491e      	ldr	r1, [pc, #120]	; (80013c0 <SystemInit+0xb0>)
 8001348:	4001      	ands	r1, r0
 800134a:	6319      	str	r1, [r3, #48]	; 0x30
 800134c:	6b59      	ldr	r1, [r3, #52]	; 0x34
 800134e:	4391      	bics	r1, r2
 8001350:	2200      	movs	r2, #0
 8001352:	6359      	str	r1, [r3, #52]	; 0x34
 8001354:	609a      	str	r2, [r3, #8]
 8001356:	9200      	str	r2, [sp, #0]
 8001358:	9201      	str	r2, [sp, #4]
 800135a:	4a1a      	ldr	r2, [pc, #104]	; (80013c4 <SystemInit+0xb4>)
 800135c:	2111      	movs	r1, #17
 800135e:	6011      	str	r1, [r2, #0]
 8001360:	685a      	ldr	r2, [r3, #4]
 8001362:	605a      	str	r2, [r3, #4]
 8001364:	685a      	ldr	r2, [r3, #4]
 8001366:	605a      	str	r2, [r3, #4]
 8001368:	6859      	ldr	r1, [r3, #4]
 800136a:	4a17      	ldr	r2, [pc, #92]	; (80013c8 <SystemInit+0xb8>)
 800136c:	400a      	ands	r2, r1
 800136e:	605a      	str	r2, [r3, #4]
 8001370:	6859      	ldr	r1, [r3, #4]
 8001372:	22a0      	movs	r2, #160	; 0xa0
 8001374:	0392      	lsls	r2, r2, #14
 8001376:	430a      	orrs	r2, r1
 8001378:	605a      	str	r2, [r3, #4]
 800137a:	6819      	ldr	r1, [r3, #0]
 800137c:	2280      	movs	r2, #128	; 0x80
 800137e:	0452      	lsls	r2, r2, #17
 8001380:	430a      	orrs	r2, r1
 8001382:	601a      	str	r2, [r3, #0]
 8001384:	6819      	ldr	r1, [r3, #0]
 8001386:	4a09      	ldr	r2, [pc, #36]	; (80013ac <SystemInit+0x9c>)
 8001388:	0188      	lsls	r0, r1, #6
 800138a:	d5fb      	bpl.n	8001384 <SystemInit+0x74>
 800138c:	6851      	ldr	r1, [r2, #4]
 800138e:	2003      	movs	r0, #3
 8001390:	4381      	bics	r1, r0
 8001392:	6051      	str	r1, [r2, #4]
 8001394:	6851      	ldr	r1, [r2, #4]
 8001396:	2002      	movs	r0, #2
 8001398:	4301      	orrs	r1, r0
 800139a:	6051      	str	r1, [r2, #4]
 800139c:	6859      	ldr	r1, [r3, #4]
 800139e:	220c      	movs	r2, #12
 80013a0:	400a      	ands	r2, r1
 80013a2:	2a08      	cmp	r2, #8
 80013a4:	d1fa      	bne.n	800139c <SystemInit+0x8c>
 80013a6:	b002      	add	sp, #8
 80013a8:	4770      	bx	lr
 80013aa:	46c0      	nop			; (mov r8, r8)
 80013ac:	40021000 	.word	0x40021000
 80013b0:	f8ffb80c 	.word	0xf8ffb80c
 80013b4:	fef6ffff 	.word	0xfef6ffff
 80013b8:	fffbffff 	.word	0xfffbffff
 80013bc:	ffc0ffff 	.word	0xffc0ffff
 80013c0:	fffffeac 	.word	0xfffffeac
 80013c4:	40022000 	.word	0x40022000
 80013c8:	ffc07fff 	.word	0xffc07fff

080013cc <TIM16_IRQHandler>:
 80013cc:	4b20      	ldr	r3, [pc, #128]	; (8001450 <TIM16_IRQHandler+0x84>)
 80013ce:	799a      	ldrb	r2, [r3, #6]
 80013d0:	78d9      	ldrb	r1, [r3, #3]
 80013d2:	4291      	cmp	r1, r2
 80013d4:	d805      	bhi.n	80013e2 <TIM16_IRQHandler+0x16>
 80013d6:	2080      	movs	r0, #128	; 0x80
 80013d8:	2190      	movs	r1, #144	; 0x90
 80013da:	0040      	lsls	r0, r0, #1
 80013dc:	05c9      	lsls	r1, r1, #23
 80013de:	8508      	strh	r0, [r1, #40]	; 0x28
 80013e0:	e006      	b.n	80013f0 <TIM16_IRQHandler+0x24>
 80013e2:	2a00      	cmp	r2, #0
 80013e4:	d104      	bne.n	80013f0 <TIM16_IRQHandler+0x24>
 80013e6:	2080      	movs	r0, #128	; 0x80
 80013e8:	2190      	movs	r1, #144	; 0x90
 80013ea:	0040      	lsls	r0, r0, #1
 80013ec:	05c9      	lsls	r1, r1, #23
 80013ee:	6188      	str	r0, [r1, #24]
 80013f0:	7919      	ldrb	r1, [r3, #4]
 80013f2:	4291      	cmp	r1, r2
 80013f4:	d805      	bhi.n	8001402 <TIM16_IRQHandler+0x36>
 80013f6:	2080      	movs	r0, #128	; 0x80
 80013f8:	2190      	movs	r1, #144	; 0x90
 80013fa:	0100      	lsls	r0, r0, #4
 80013fc:	05c9      	lsls	r1, r1, #23
 80013fe:	8508      	strh	r0, [r1, #40]	; 0x28
 8001400:	e006      	b.n	8001410 <TIM16_IRQHandler+0x44>
 8001402:	2a00      	cmp	r2, #0
 8001404:	d104      	bne.n	8001410 <TIM16_IRQHandler+0x44>
 8001406:	2080      	movs	r0, #128	; 0x80
 8001408:	2190      	movs	r1, #144	; 0x90
 800140a:	0100      	lsls	r0, r0, #4
 800140c:	05c9      	lsls	r1, r1, #23
 800140e:	6188      	str	r0, [r1, #24]
 8001410:	7959      	ldrb	r1, [r3, #5]
 8001412:	4291      	cmp	r1, r2
 8001414:	d806      	bhi.n	8001424 <TIM16_IRQHandler+0x58>
 8001416:	2190      	movs	r1, #144	; 0x90
 8001418:	2002      	movs	r0, #2
 800141a:	05c9      	lsls	r1, r1, #23
 800141c:	8508      	strh	r0, [r1, #40]	; 0x28
 800141e:	2a00      	cmp	r2, #0
 8001420:	d006      	beq.n	8001430 <TIM16_IRQHandler+0x64>
 8001422:	e00b      	b.n	800143c <TIM16_IRQHandler+0x70>
 8001424:	2a00      	cmp	r2, #0
 8001426:	d109      	bne.n	800143c <TIM16_IRQHandler+0x70>
 8001428:	2190      	movs	r1, #144	; 0x90
 800142a:	2002      	movs	r0, #2
 800142c:	05c9      	lsls	r1, r1, #23
 800142e:	6188      	str	r0, [r1, #24]
 8001430:	7819      	ldrb	r1, [r3, #0]
 8001432:	70d9      	strb	r1, [r3, #3]
 8001434:	7859      	ldrb	r1, [r3, #1]
 8001436:	7119      	strb	r1, [r3, #4]
 8001438:	7899      	ldrb	r1, [r3, #2]
 800143a:	7159      	strb	r1, [r3, #5]
 800143c:	3201      	adds	r2, #1
 800143e:	b2d2      	uxtb	r2, r2
 8001440:	2a10      	cmp	r2, #16
 8001442:	d900      	bls.n	8001446 <TIM16_IRQHandler+0x7a>
 8001444:	2200      	movs	r2, #0
 8001446:	719a      	strb	r2, [r3, #6]
 8001448:	4b02      	ldr	r3, [pc, #8]	; (8001454 <TIM16_IRQHandler+0x88>)
 800144a:	2200      	movs	r2, #0
 800144c:	821a      	strh	r2, [r3, #16]
 800144e:	4770      	bx	lr
 8001450:	20000074 	.word	0x20000074
 8001454:	40014400 	.word	0x40014400

08001458 <lib_low_level_init>:
 8001458:	b508      	push	{r3, lr}
 800145a:	f7ff ff59 	bl	8001310 <SystemInit>
 800145e:	f000 ff65 	bl	800232c <gpio_init>
 8001462:	f7ff fd99 	bl	8000f98 <uart_init>
 8001466:	f7ff fcdf 	bl	8000e28 <timer_init>
 800146a:	f7ff fe1d 	bl	80010a8 <i2c_0_init>
 800146e:	f7ff fef7 	bl	8001260 <adc_init>
 8001472:	bd08      	pop	{r3, pc}

08001474 <TIM14_IRQHandler>:
 8001474:	b530      	push	{r4, r5, lr}
 8001476:	4b53      	ldr	r3, [pc, #332]	; (80015c4 <TIM14_IRQHandler+0x150>)
 8001478:	7818      	ldrb	r0, [r3, #0]
 800147a:	b2c0      	uxtb	r0, r0
 800147c:	2803      	cmp	r0, #3
 800147e:	d83f      	bhi.n	8001500 <TIM14_IRQHandler+0x8c>
 8001480:	f000 fff6 	bl	8002470 <__gnu_thumb1_case_uqi>
 8001484:	32220a02 	.word	0x32220a02
 8001488:	2280      	movs	r2, #128	; 0x80
 800148a:	2390      	movs	r3, #144	; 0x90
 800148c:	0052      	lsls	r2, r2, #1
 800148e:	05db      	lsls	r3, r3, #23
 8001490:	851a      	strh	r2, [r3, #40]	; 0x28
 8001492:	2200      	movs	r2, #0
 8001494:	4b4c      	ldr	r3, [pc, #304]	; (80015c8 <TIM14_IRQHandler+0x154>)
 8001496:	e032      	b.n	80014fe <TIM14_IRQHandler+0x8a>
 8001498:	4a4b      	ldr	r2, [pc, #300]	; (80015c8 <TIM14_IRQHandler+0x154>)
 800149a:	7811      	ldrb	r1, [r2, #0]
 800149c:	290d      	cmp	r1, #13
 800149e:	d901      	bls.n	80014a4 <TIM14_IRQHandler+0x30>
 80014a0:	2200      	movs	r2, #0
 80014a2:	e02c      	b.n	80014fe <TIM14_IRQHandler+0x8a>
 80014a4:	7811      	ldrb	r1, [r2, #0]
 80014a6:	4849      	ldr	r0, [pc, #292]	; (80015cc <TIM14_IRQHandler+0x158>)
 80014a8:	5c41      	ldrb	r1, [r0, r1]
 80014aa:	20ff      	movs	r0, #255	; 0xff
 80014ac:	4388      	bics	r0, r1
 80014ae:	0040      	lsls	r0, r0, #1
 80014b0:	2101      	movs	r1, #1
 80014b2:	4308      	orrs	r0, r1
 80014b4:	4946      	ldr	r1, [pc, #280]	; (80015d0 <TIM14_IRQHandler+0x15c>)
 80014b6:	8008      	strh	r0, [r1, #0]
 80014b8:	7811      	ldrb	r1, [r2, #0]
 80014ba:	3101      	adds	r1, #1
 80014bc:	b2c9      	uxtb	r1, r1
 80014be:	7011      	strb	r1, [r2, #0]
 80014c0:	4a44      	ldr	r2, [pc, #272]	; (80015d4 <TIM14_IRQHandler+0x160>)
 80014c2:	2100      	movs	r1, #0
 80014c4:	7011      	strb	r1, [r2, #0]
 80014c6:	e019      	b.n	80014fc <TIM14_IRQHandler+0x88>
 80014c8:	4a41      	ldr	r2, [pc, #260]	; (80015d0 <TIM14_IRQHandler+0x15c>)
 80014ca:	2190      	movs	r1, #144	; 0x90
 80014cc:	8814      	ldrh	r4, [r2, #0]
 80014ce:	2080      	movs	r0, #128	; 0x80
 80014d0:	05c9      	lsls	r1, r1, #23
 80014d2:	0040      	lsls	r0, r0, #1
 80014d4:	07e5      	lsls	r5, r4, #31
 80014d6:	d501      	bpl.n	80014dc <TIM14_IRQHandler+0x68>
 80014d8:	6188      	str	r0, [r1, #24]
 80014da:	e000      	b.n	80014de <TIM14_IRQHandler+0x6a>
 80014dc:	8508      	strh	r0, [r1, #40]	; 0x28
 80014de:	8811      	ldrh	r1, [r2, #0]
 80014e0:	0849      	lsrs	r1, r1, #1
 80014e2:	8011      	strh	r1, [r2, #0]
 80014e4:	2203      	movs	r2, #3
 80014e6:	e00a      	b.n	80014fe <TIM14_IRQHandler+0x8a>
 80014e8:	4a3a      	ldr	r2, [pc, #232]	; (80015d4 <TIM14_IRQHandler+0x160>)
 80014ea:	7811      	ldrb	r1, [r2, #0]
 80014ec:	3101      	adds	r1, #1
 80014ee:	b2c9      	uxtb	r1, r1
 80014f0:	7011      	strb	r1, [r2, #0]
 80014f2:	7812      	ldrb	r2, [r2, #0]
 80014f4:	2a09      	cmp	r2, #9
 80014f6:	d901      	bls.n	80014fc <TIM14_IRQHandler+0x88>
 80014f8:	2201      	movs	r2, #1
 80014fa:	e000      	b.n	80014fe <TIM14_IRQHandler+0x8a>
 80014fc:	2202      	movs	r2, #2
 80014fe:	701a      	strb	r2, [r3, #0]
 8001500:	4b35      	ldr	r3, [pc, #212]	; (80015d8 <TIM14_IRQHandler+0x164>)
 8001502:	2204      	movs	r2, #4
 8001504:	6c1c      	ldr	r4, [r3, #64]	; 0x40
 8001506:	601a      	str	r2, [r3, #0]
 8001508:	6899      	ldr	r1, [r3, #8]
 800150a:	4834      	ldr	r0, [pc, #208]	; (80015dc <TIM14_IRQHandler+0x168>)
 800150c:	4311      	orrs	r1, r2
 800150e:	6099      	str	r1, [r3, #8]
 8001510:	6803      	ldr	r3, [r0, #0]
 8001512:	4933      	ldr	r1, [pc, #204]	; (80015e0 <TIM14_IRQHandler+0x16c>)
 8001514:	42a1      	cmp	r1, r4
 8001516:	4189      	sbcs	r1, r1
 8001518:	191c      	adds	r4, r3, r4
 800151a:	09db      	lsrs	r3, r3, #7
 800151c:	1ae3      	subs	r3, r4, r3
 800151e:	6003      	str	r3, [r0, #0]
 8001520:	4b30      	ldr	r3, [pc, #192]	; (80015e4 <TIM14_IRQHandler+0x170>)
 8001522:	4249      	negs	r1, r1
 8001524:	7818      	ldrb	r0, [r3, #0]
 8001526:	b2c0      	uxtb	r0, r0
 8001528:	4290      	cmp	r0, r2
 800152a:	d846      	bhi.n	80015ba <TIM14_IRQHandler+0x146>
 800152c:	f000 ffa0 	bl	8002470 <__gnu_thumb1_case_uqi>
 8001530:	44110603 	.word	0x44110603
 8001534:	24          	.byte	0x24
 8001535:	00          	.byte	0x00
 8001536:	2200      	movs	r2, #0
 8001538:	4b2b      	ldr	r3, [pc, #172]	; (80015e8 <TIM14_IRQHandler+0x174>)
 800153a:	e03d      	b.n	80015b8 <TIM14_IRQHandler+0x144>
 800153c:	4a2a      	ldr	r2, [pc, #168]	; (80015e8 <TIM14_IRQHandler+0x174>)
 800153e:	7811      	ldrb	r1, [r2, #0]
 8001540:	2200      	movs	r2, #0
 8001542:	290d      	cmp	r1, #13
 8001544:	d838      	bhi.n	80015b8 <TIM14_IRQHandler+0x144>
 8001546:	4929      	ldr	r1, [pc, #164]	; (80015ec <TIM14_IRQHandler+0x178>)
 8001548:	800a      	strh	r2, [r1, #0]
 800154a:	4929      	ldr	r1, [pc, #164]	; (80015f0 <TIM14_IRQHandler+0x17c>)
 800154c:	700a      	strb	r2, [r1, #0]
 800154e:	2202      	movs	r2, #2
 8001550:	e032      	b.n	80015b8 <TIM14_IRQHandler+0x144>
 8001552:	4a28      	ldr	r2, [pc, #160]	; (80015f4 <TIM14_IRQHandler+0x180>)
 8001554:	2900      	cmp	r1, #0
 8001556:	d103      	bne.n	8001560 <TIM14_IRQHandler+0xec>
 8001558:	2003      	movs	r0, #3
 800155a:	7018      	strb	r0, [r3, #0]
 800155c:	6011      	str	r1, [r2, #0]
 800155e:	e02c      	b.n	80015ba <TIM14_IRQHandler+0x146>
 8001560:	6811      	ldr	r1, [r2, #0]
 8001562:	3101      	adds	r1, #1
 8001564:	6011      	str	r1, [r2, #0]
 8001566:	6810      	ldr	r0, [r2, #0]
 8001568:	21d2      	movs	r1, #210	; 0xd2
 800156a:	0049      	lsls	r1, r1, #1
 800156c:	4288      	cmp	r0, r1
 800156e:	d924      	bls.n	80015ba <TIM14_IRQHandler+0x146>
 8001570:	2100      	movs	r1, #0
 8001572:	6011      	str	r1, [r2, #0]
 8001574:	4a1c      	ldr	r2, [pc, #112]	; (80015e8 <TIM14_IRQHandler+0x174>)
 8001576:	e01b      	b.n	80015b0 <TIM14_IRQHandler+0x13c>
 8001578:	4a1d      	ldr	r2, [pc, #116]	; (80015f0 <TIM14_IRQHandler+0x17c>)
 800157a:	2900      	cmp	r1, #0
 800157c:	d008      	beq.n	8001590 <TIM14_IRQHandler+0x11c>
 800157e:	491b      	ldr	r1, [pc, #108]	; (80015ec <TIM14_IRQHandler+0x178>)
 8001580:	2501      	movs	r5, #1
 8001582:	880c      	ldrh	r4, [r1, #0]
 8001584:	7810      	ldrb	r0, [r2, #0]
 8001586:	4085      	lsls	r5, r0
 8001588:	1c28      	adds	r0, r5, #0
 800158a:	4320      	orrs	r0, r4
 800158c:	b280      	uxth	r0, r0
 800158e:	8008      	strh	r0, [r1, #0]
 8001590:	7811      	ldrb	r1, [r2, #0]
 8001592:	3101      	adds	r1, #1
 8001594:	b2c9      	uxtb	r1, r1
 8001596:	7011      	strb	r1, [r2, #0]
 8001598:	7812      	ldrb	r2, [r2, #0]
 800159a:	2a07      	cmp	r2, #7
 800159c:	d90b      	bls.n	80015b6 <TIM14_IRQHandler+0x142>
 800159e:	4a12      	ldr	r2, [pc, #72]	; (80015e8 <TIM14_IRQHandler+0x174>)
 80015a0:	4812      	ldr	r0, [pc, #72]	; (80015ec <TIM14_IRQHandler+0x178>)
 80015a2:	7811      	ldrb	r1, [r2, #0]
 80015a4:	8804      	ldrh	r4, [r0, #0]
 80015a6:	4814      	ldr	r0, [pc, #80]	; (80015f8 <TIM14_IRQHandler+0x184>)
 80015a8:	5444      	strb	r4, [r0, r1]
 80015aa:	7811      	ldrb	r1, [r2, #0]
 80015ac:	3101      	adds	r1, #1
 80015ae:	b2c9      	uxtb	r1, r1
 80015b0:	7011      	strb	r1, [r2, #0]
 80015b2:	2201      	movs	r2, #1
 80015b4:	e000      	b.n	80015b8 <TIM14_IRQHandler+0x144>
 80015b6:	2203      	movs	r2, #3
 80015b8:	701a      	strb	r2, [r3, #0]
 80015ba:	4b10      	ldr	r3, [pc, #64]	; (80015fc <TIM14_IRQHandler+0x188>)
 80015bc:	2200      	movs	r2, #0
 80015be:	821a      	strh	r2, [r3, #16]
 80015c0:	bd30      	pop	{r4, r5, pc}
 80015c2:	46c0      	nop			; (mov r8, r8)
 80015c4:	200007e7 	.word	0x200007e7
 80015c8:	200007e6 	.word	0x200007e6
 80015cc:	2000008e 	.word	0x2000008e
 80015d0:	200007ea 	.word	0x200007ea
 80015d4:	200007f4 	.word	0x200007f4
 80015d8:	40012400 	.word	0x40012400
 80015dc:	200007e0 	.word	0x200007e0
 80015e0:	000003e7 	.word	0x000003e7
 80015e4:	200007e8 	.word	0x200007e8
 80015e8:	200007ec 	.word	0x200007ec
 80015ec:	200007e4 	.word	0x200007e4
 80015f0:	200007ed 	.word	0x200007ed
 80015f4:	200007f0 	.word	0x200007f0
 80015f8:	20000080 	.word	0x20000080
 80015fc:	40002000 	.word	0x40002000

08001600 <GPIO_Init>:
 8001600:	2390      	movs	r3, #144	; 0x90
 8001602:	b5f7      	push	{r0, r1, r2, r4, r5, r6, r7, lr}
 8001604:	05db      	lsls	r3, r3, #23
 8001606:	1c04      	adds	r4, r0, #0
 8001608:	1c0d      	adds	r5, r1, #0
 800160a:	4298      	cmp	r0, r3
 800160c:	d010      	beq.n	8001630 <GPIO_Init+0x30>
 800160e:	4b39      	ldr	r3, [pc, #228]	; (80016f4 <GPIO_Init+0xf4>)
 8001610:	4298      	cmp	r0, r3
 8001612:	d00d      	beq.n	8001630 <GPIO_Init+0x30>
 8001614:	4b38      	ldr	r3, [pc, #224]	; (80016f8 <GPIO_Init+0xf8>)
 8001616:	4298      	cmp	r0, r3
 8001618:	d00a      	beq.n	8001630 <GPIO_Init+0x30>
 800161a:	4b38      	ldr	r3, [pc, #224]	; (80016fc <GPIO_Init+0xfc>)
 800161c:	4298      	cmp	r0, r3
 800161e:	d007      	beq.n	8001630 <GPIO_Init+0x30>
 8001620:	4b37      	ldr	r3, [pc, #220]	; (8001700 <GPIO_Init+0x100>)
 8001622:	4298      	cmp	r0, r3
 8001624:	d004      	beq.n	8001630 <GPIO_Init+0x30>
 8001626:	4a37      	ldr	r2, [pc, #220]	; (8001704 <GPIO_Init+0x104>)
 8001628:	1880      	adds	r0, r0, r2
 800162a:	4243      	negs	r3, r0
 800162c:	4158      	adcs	r0, r3
 800162e:	e000      	b.n	8001632 <GPIO_Init+0x32>
 8001630:	2001      	movs	r0, #1
 8001632:	f7ff fe5d 	bl	80012f0 <assert_param>
 8001636:	6828      	ldr	r0, [r5, #0]
 8001638:	2600      	movs	r6, #0
 800163a:	1e43      	subs	r3, r0, #1
 800163c:	4198      	sbcs	r0, r3
 800163e:	f7ff fe57 	bl	80012f0 <assert_param>
 8001642:	792b      	ldrb	r3, [r5, #4]
 8001644:	2203      	movs	r2, #3
 8001646:	1c30      	adds	r0, r6, #0
 8001648:	429a      	cmp	r2, r3
 800164a:	4170      	adcs	r0, r6
 800164c:	f7ff fe50 	bl	80012f0 <assert_param>
 8001650:	79eb      	ldrb	r3, [r5, #7]
 8001652:	2202      	movs	r2, #2
 8001654:	1c30      	adds	r0, r6, #0
 8001656:	429a      	cmp	r2, r3
 8001658:	4170      	adcs	r0, r6
 800165a:	f7ff fe49 	bl	80012f0 <assert_param>
 800165e:	2001      	movs	r0, #1
 8001660:	1c03      	adds	r3, r0, #0
 8001662:	682a      	ldr	r2, [r5, #0]
 8001664:	40b3      	lsls	r3, r6
 8001666:	401a      	ands	r2, r3
 8001668:	9201      	str	r2, [sp, #4]
 800166a:	429a      	cmp	r2, r3
 800166c:	d13d      	bne.n	80016ea <GPIO_Init+0xea>
 800166e:	792b      	ldrb	r3, [r5, #4]
 8001670:	0077      	lsls	r7, r6, #1
 8001672:	3b01      	subs	r3, #1
 8001674:	b2db      	uxtb	r3, r3
 8001676:	4283      	cmp	r3, r0
 8001678:	d823      	bhi.n	80016c2 <GPIO_Init+0xc2>
 800167a:	796b      	ldrb	r3, [r5, #5]
 800167c:	4283      	cmp	r3, r0
 800167e:	d902      	bls.n	8001686 <GPIO_Init+0x86>
 8001680:	1ed8      	subs	r0, r3, #3
 8001682:	4243      	negs	r3, r0
 8001684:	4158      	adcs	r0, r3
 8001686:	f7ff fe33 	bl	80012f0 <assert_param>
 800168a:	68a3      	ldr	r3, [r4, #8]
 800168c:	2203      	movs	r2, #3
 800168e:	40ba      	lsls	r2, r7
 8001690:	4393      	bics	r3, r2
 8001692:	60a3      	str	r3, [r4, #8]
 8001694:	796b      	ldrb	r3, [r5, #5]
 8001696:	68a2      	ldr	r2, [r4, #8]
 8001698:	40bb      	lsls	r3, r7
 800169a:	4313      	orrs	r3, r2
 800169c:	60a3      	str	r3, [r4, #8]
 800169e:	79ab      	ldrb	r3, [r5, #6]
 80016a0:	2201      	movs	r2, #1
 80016a2:	2000      	movs	r0, #0
 80016a4:	429a      	cmp	r2, r3
 80016a6:	4140      	adcs	r0, r0
 80016a8:	f7ff fe22 	bl	80012f0 <assert_param>
 80016ac:	6863      	ldr	r3, [r4, #4]
 80016ae:	9a01      	ldr	r2, [sp, #4]
 80016b0:	b29b      	uxth	r3, r3
 80016b2:	4393      	bics	r3, r2
 80016b4:	80a3      	strh	r3, [r4, #4]
 80016b6:	79ab      	ldrb	r3, [r5, #6]
 80016b8:	6862      	ldr	r2, [r4, #4]
 80016ba:	40b3      	lsls	r3, r6
 80016bc:	4313      	orrs	r3, r2
 80016be:	b29b      	uxth	r3, r3
 80016c0:	80a3      	strh	r3, [r4, #4]
 80016c2:	2303      	movs	r3, #3
 80016c4:	6822      	ldr	r2, [r4, #0]
 80016c6:	40bb      	lsls	r3, r7
 80016c8:	43db      	mvns	r3, r3
 80016ca:	401a      	ands	r2, r3
 80016cc:	6022      	str	r2, [r4, #0]
 80016ce:	792a      	ldrb	r2, [r5, #4]
 80016d0:	6821      	ldr	r1, [r4, #0]
 80016d2:	40ba      	lsls	r2, r7
 80016d4:	430a      	orrs	r2, r1
 80016d6:	6022      	str	r2, [r4, #0]
 80016d8:	68e2      	ldr	r2, [r4, #12]
 80016da:	4013      	ands	r3, r2
 80016dc:	79ea      	ldrb	r2, [r5, #7]
 80016de:	60e3      	str	r3, [r4, #12]
 80016e0:	68e3      	ldr	r3, [r4, #12]
 80016e2:	40ba      	lsls	r2, r7
 80016e4:	1c17      	adds	r7, r2, #0
 80016e6:	431f      	orrs	r7, r3
 80016e8:	60e7      	str	r7, [r4, #12]
 80016ea:	3601      	adds	r6, #1
 80016ec:	2e10      	cmp	r6, #16
 80016ee:	d1b6      	bne.n	800165e <GPIO_Init+0x5e>
 80016f0:	bdf7      	pop	{r0, r1, r2, r4, r5, r6, r7, pc}
 80016f2:	46c0      	nop			; (mov r8, r8)
 80016f4:	48000400 	.word	0x48000400
 80016f8:	48000800 	.word	0x48000800
 80016fc:	48000c00 	.word	0x48000c00
 8001700:	48001000 	.word	0x48001000
 8001704:	b7ffec00 	.word	0xb7ffec00

08001708 <GPIO_PinAFConfig>:
 8001708:	b5f7      	push	{r0, r1, r2, r4, r5, r6, r7, lr}
 800170a:	2390      	movs	r3, #144	; 0x90
 800170c:	1c04      	adds	r4, r0, #0
 800170e:	1c0e      	adds	r6, r1, #0
 8001710:	9201      	str	r2, [sp, #4]
 8001712:	05db      	lsls	r3, r3, #23
 8001714:	4298      	cmp	r0, r3
 8001716:	d010      	beq.n	800173a <GPIO_PinAFConfig+0x32>
 8001718:	4b19      	ldr	r3, [pc, #100]	; (8001780 <GPIO_PinAFConfig+0x78>)
 800171a:	4298      	cmp	r0, r3
 800171c:	d00d      	beq.n	800173a <GPIO_PinAFConfig+0x32>
 800171e:	4b19      	ldr	r3, [pc, #100]	; (8001784 <GPIO_PinAFConfig+0x7c>)
 8001720:	4298      	cmp	r0, r3
 8001722:	d00a      	beq.n	800173a <GPIO_PinAFConfig+0x32>
 8001724:	4b18      	ldr	r3, [pc, #96]	; (8001788 <GPIO_PinAFConfig+0x80>)
 8001726:	4298      	cmp	r0, r3
 8001728:	d007      	beq.n	800173a <GPIO_PinAFConfig+0x32>
 800172a:	4b18      	ldr	r3, [pc, #96]	; (800178c <GPIO_PinAFConfig+0x84>)
 800172c:	4298      	cmp	r0, r3
 800172e:	d004      	beq.n	800173a <GPIO_PinAFConfig+0x32>
 8001730:	4a17      	ldr	r2, [pc, #92]	; (8001790 <GPIO_PinAFConfig+0x88>)
 8001732:	1880      	adds	r0, r0, r2
 8001734:	4243      	negs	r3, r0
 8001736:	4158      	adcs	r0, r3
 8001738:	e000      	b.n	800173c <GPIO_PinAFConfig+0x34>
 800173a:	2001      	movs	r0, #1
 800173c:	2500      	movs	r5, #0
 800173e:	f7ff fdd7 	bl	80012f0 <assert_param>
 8001742:	230f      	movs	r3, #15
 8001744:	1c28      	adds	r0, r5, #0
 8001746:	42b3      	cmp	r3, r6
 8001748:	4168      	adcs	r0, r5
 800174a:	f7ff fdd1 	bl	80012f0 <assert_param>
 800174e:	9a01      	ldr	r2, [sp, #4]
 8001750:	1c28      	adds	r0, r5, #0
 8001752:	2707      	movs	r7, #7
 8001754:	4297      	cmp	r7, r2
 8001756:	4168      	adcs	r0, r5
 8001758:	4037      	ands	r7, r6
 800175a:	08f6      	lsrs	r6, r6, #3
 800175c:	00b6      	lsls	r6, r6, #2
 800175e:	19a4      	adds	r4, r4, r6
 8001760:	f7ff fdc6 	bl	80012f0 <assert_param>
 8001764:	00bf      	lsls	r7, r7, #2
 8001766:	6a23      	ldr	r3, [r4, #32]
 8001768:	220f      	movs	r2, #15
 800176a:	40ba      	lsls	r2, r7
 800176c:	4393      	bics	r3, r2
 800176e:	9a01      	ldr	r2, [sp, #4]
 8001770:	6223      	str	r3, [r4, #32]
 8001772:	6a23      	ldr	r3, [r4, #32]
 8001774:	40ba      	lsls	r2, r7
 8001776:	1c17      	adds	r7, r2, #0
 8001778:	431f      	orrs	r7, r3
 800177a:	6227      	str	r7, [r4, #32]
 800177c:	bdf7      	pop	{r0, r1, r2, r4, r5, r6, r7, pc}
 800177e:	46c0      	nop			; (mov r8, r8)
 8001780:	48000400 	.word	0x48000400
 8001784:	48000800 	.word	0x48000800
 8001788:	48000c00 	.word	0x48000c00
 800178c:	48001000 	.word	0x48001000
 8001790:	b7ffec00 	.word	0xb7ffec00

08001794 <TIM_TimeBaseInit>:
 8001794:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
 8001796:	4e34      	ldr	r6, [pc, #208]	; (8001868 <TIM_TimeBaseInit+0xd4>)
 8001798:	1c04      	adds	r4, r0, #0
 800179a:	1c0d      	adds	r5, r1, #0
 800179c:	4f33      	ldr	r7, [pc, #204]	; (800186c <TIM_TimeBaseInit+0xd8>)
 800179e:	42b0      	cmp	r0, r6
 80017a0:	d019      	beq.n	80017d6 <TIM_TimeBaseInit+0x42>
 80017a2:	2380      	movs	r3, #128	; 0x80
 80017a4:	05db      	lsls	r3, r3, #23
 80017a6:	4298      	cmp	r0, r3
 80017a8:	d015      	beq.n	80017d6 <TIM_TimeBaseInit+0x42>
 80017aa:	4b31      	ldr	r3, [pc, #196]	; (8001870 <TIM_TimeBaseInit+0xdc>)
 80017ac:	4298      	cmp	r0, r3
 80017ae:	d012      	beq.n	80017d6 <TIM_TimeBaseInit+0x42>
 80017b0:	42b8      	cmp	r0, r7
 80017b2:	d010      	beq.n	80017d6 <TIM_TimeBaseInit+0x42>
 80017b4:	4b2f      	ldr	r3, [pc, #188]	; (8001874 <TIM_TimeBaseInit+0xe0>)
 80017b6:	4298      	cmp	r0, r3
 80017b8:	d00d      	beq.n	80017d6 <TIM_TimeBaseInit+0x42>
 80017ba:	4b2f      	ldr	r3, [pc, #188]	; (8001878 <TIM_TimeBaseInit+0xe4>)
 80017bc:	4298      	cmp	r0, r3
 80017be:	d00a      	beq.n	80017d6 <TIM_TimeBaseInit+0x42>
 80017c0:	4b2e      	ldr	r3, [pc, #184]	; (800187c <TIM_TimeBaseInit+0xe8>)
 80017c2:	4298      	cmp	r0, r3
 80017c4:	d007      	beq.n	80017d6 <TIM_TimeBaseInit+0x42>
 80017c6:	4b2e      	ldr	r3, [pc, #184]	; (8001880 <TIM_TimeBaseInit+0xec>)
 80017c8:	4298      	cmp	r0, r3
 80017ca:	d004      	beq.n	80017d6 <TIM_TimeBaseInit+0x42>
 80017cc:	492d      	ldr	r1, [pc, #180]	; (8001884 <TIM_TimeBaseInit+0xf0>)
 80017ce:	1840      	adds	r0, r0, r1
 80017d0:	4243      	negs	r3, r0
 80017d2:	4158      	adcs	r0, r3
 80017d4:	e000      	b.n	80017d8 <TIM_TimeBaseInit+0x44>
 80017d6:	2001      	movs	r0, #1
 80017d8:	f7ff fd8a 	bl	80012f0 <assert_param>
 80017dc:	886b      	ldrh	r3, [r5, #2]
 80017de:	2210      	movs	r2, #16
 80017e0:	1c19      	adds	r1, r3, #0
 80017e2:	4391      	bics	r1, r2
 80017e4:	d101      	bne.n	80017ea <TIM_TimeBaseInit+0x56>
 80017e6:	2001      	movs	r0, #1
 80017e8:	e007      	b.n	80017fa <TIM_TimeBaseInit+0x66>
 80017ea:	2240      	movs	r2, #64	; 0x40
 80017ec:	1c19      	adds	r1, r3, #0
 80017ee:	4391      	bics	r1, r2
 80017f0:	2920      	cmp	r1, #32
 80017f2:	d0f8      	beq.n	80017e6 <TIM_TimeBaseInit+0x52>
 80017f4:	2b40      	cmp	r3, #64	; 0x40
 80017f6:	d0f6      	beq.n	80017e6 <TIM_TimeBaseInit+0x52>
 80017f8:	2000      	movs	r0, #0
 80017fa:	f7ff fd79 	bl	80012f0 <assert_param>
 80017fe:	892b      	ldrh	r3, [r5, #8]
 8001800:	4a21      	ldr	r2, [pc, #132]	; (8001888 <TIM_TimeBaseInit+0xf4>)
 8001802:	2001      	movs	r0, #1
 8001804:	4213      	tst	r3, r2
 8001806:	d003      	beq.n	8001810 <TIM_TimeBaseInit+0x7c>
 8001808:	4a20      	ldr	r2, [pc, #128]	; (800188c <TIM_TimeBaseInit+0xf8>)
 800180a:	1898      	adds	r0, r3, r2
 800180c:	4243      	negs	r3, r0
 800180e:	4158      	adcs	r0, r3
 8001810:	f7ff fd6e 	bl	80012f0 <assert_param>
 8001814:	6823      	ldr	r3, [r4, #0]
 8001816:	b29b      	uxth	r3, r3
 8001818:	42b4      	cmp	r4, r6
 800181a:	d006      	beq.n	800182a <TIM_TimeBaseInit+0x96>
 800181c:	2280      	movs	r2, #128	; 0x80
 800181e:	05d2      	lsls	r2, r2, #23
 8001820:	4294      	cmp	r4, r2
 8001822:	d002      	beq.n	800182a <TIM_TimeBaseInit+0x96>
 8001824:	4a12      	ldr	r2, [pc, #72]	; (8001870 <TIM_TimeBaseInit+0xdc>)
 8001826:	4294      	cmp	r4, r2
 8001828:	d103      	bne.n	8001832 <TIM_TimeBaseInit+0x9e>
 800182a:	2270      	movs	r2, #112	; 0x70
 800182c:	4393      	bics	r3, r2
 800182e:	886a      	ldrh	r2, [r5, #2]
 8001830:	4313      	orrs	r3, r2
 8001832:	42bc      	cmp	r4, r7
 8001834:	d003      	beq.n	800183e <TIM_TimeBaseInit+0xaa>
 8001836:	4916      	ldr	r1, [pc, #88]	; (8001890 <TIM_TimeBaseInit+0xfc>)
 8001838:	892a      	ldrh	r2, [r5, #8]
 800183a:	400b      	ands	r3, r1
 800183c:	4313      	orrs	r3, r2
 800183e:	8023      	strh	r3, [r4, #0]
 8001840:	686b      	ldr	r3, [r5, #4]
 8001842:	62e3      	str	r3, [r4, #44]	; 0x2c
 8001844:	882b      	ldrh	r3, [r5, #0]
 8001846:	8523      	strh	r3, [r4, #40]	; 0x28
 8001848:	42b4      	cmp	r4, r6
 800184a:	d008      	beq.n	800185e <TIM_TimeBaseInit+0xca>
 800184c:	4b0b      	ldr	r3, [pc, #44]	; (800187c <TIM_TimeBaseInit+0xe8>)
 800184e:	429c      	cmp	r4, r3
 8001850:	d005      	beq.n	800185e <TIM_TimeBaseInit+0xca>
 8001852:	4b0b      	ldr	r3, [pc, #44]	; (8001880 <TIM_TimeBaseInit+0xec>)
 8001854:	429c      	cmp	r4, r3
 8001856:	d002      	beq.n	800185e <TIM_TimeBaseInit+0xca>
 8001858:	4b0e      	ldr	r3, [pc, #56]	; (8001894 <TIM_TimeBaseInit+0x100>)
 800185a:	429c      	cmp	r4, r3
 800185c:	d101      	bne.n	8001862 <TIM_TimeBaseInit+0xce>
 800185e:	7aab      	ldrb	r3, [r5, #10]
 8001860:	8623      	strh	r3, [r4, #48]	; 0x30
 8001862:	2301      	movs	r3, #1
 8001864:	82a3      	strh	r3, [r4, #20]
 8001866:	bdf8      	pop	{r3, r4, r5, r6, r7, pc}
 8001868:	40012c00 	.word	0x40012c00
 800186c:	40001000 	.word	0x40001000
 8001870:	40000400 	.word	0x40000400
 8001874:	40001400 	.word	0x40001400
 8001878:	40002000 	.word	0x40002000
 800187c:	40014000 	.word	0x40014000
 8001880:	40014400 	.word	0x40014400
 8001884:	bffeb800 	.word	0xbffeb800
 8001888:	fffffeff 	.word	0xfffffeff
 800188c:	fffffe00 	.word	0xfffffe00
 8001890:	fffffcff 	.word	0xfffffcff
 8001894:	40014800 	.word	0x40014800

08001898 <TIM_Cmd>:
 8001898:	4b19      	ldr	r3, [pc, #100]	; (8001900 <TIM_Cmd+0x68>)
 800189a:	b570      	push	{r4, r5, r6, lr}
 800189c:	1c04      	adds	r4, r0, #0
 800189e:	1c0e      	adds	r6, r1, #0
 80018a0:	4298      	cmp	r0, r3
 80018a2:	d01a      	beq.n	80018da <TIM_Cmd+0x42>
 80018a4:	2380      	movs	r3, #128	; 0x80
 80018a6:	05db      	lsls	r3, r3, #23
 80018a8:	4298      	cmp	r0, r3
 80018aa:	d016      	beq.n	80018da <TIM_Cmd+0x42>
 80018ac:	4b15      	ldr	r3, [pc, #84]	; (8001904 <TIM_Cmd+0x6c>)
 80018ae:	4298      	cmp	r0, r3
 80018b0:	d013      	beq.n	80018da <TIM_Cmd+0x42>
 80018b2:	4b15      	ldr	r3, [pc, #84]	; (8001908 <TIM_Cmd+0x70>)
 80018b4:	4298      	cmp	r0, r3
 80018b6:	d010      	beq.n	80018da <TIM_Cmd+0x42>
 80018b8:	4b14      	ldr	r3, [pc, #80]	; (800190c <TIM_Cmd+0x74>)
 80018ba:	4298      	cmp	r0, r3
 80018bc:	d00d      	beq.n	80018da <TIM_Cmd+0x42>
 80018be:	4b14      	ldr	r3, [pc, #80]	; (8001910 <TIM_Cmd+0x78>)
 80018c0:	4298      	cmp	r0, r3
 80018c2:	d00a      	beq.n	80018da <TIM_Cmd+0x42>
 80018c4:	4b13      	ldr	r3, [pc, #76]	; (8001914 <TIM_Cmd+0x7c>)
 80018c6:	4298      	cmp	r0, r3
 80018c8:	d007      	beq.n	80018da <TIM_Cmd+0x42>
 80018ca:	4b13      	ldr	r3, [pc, #76]	; (8001918 <TIM_Cmd+0x80>)
 80018cc:	4298      	cmp	r0, r3
 80018ce:	d004      	beq.n	80018da <TIM_Cmd+0x42>
 80018d0:	4b12      	ldr	r3, [pc, #72]	; (800191c <TIM_Cmd+0x84>)
 80018d2:	18c0      	adds	r0, r0, r3
 80018d4:	4243      	negs	r3, r0
 80018d6:	4158      	adcs	r0, r3
 80018d8:	e000      	b.n	80018dc <TIM_Cmd+0x44>
 80018da:	2001      	movs	r0, #1
 80018dc:	f7ff fd08 	bl	80012f0 <assert_param>
 80018e0:	2501      	movs	r5, #1
 80018e2:	2000      	movs	r0, #0
 80018e4:	42b5      	cmp	r5, r6
 80018e6:	4140      	adcs	r0, r0
 80018e8:	f7ff fd02 	bl	80012f0 <assert_param>
 80018ec:	6823      	ldr	r3, [r4, #0]
 80018ee:	b29b      	uxth	r3, r3
 80018f0:	2e00      	cmp	r6, #0
 80018f2:	d002      	beq.n	80018fa <TIM_Cmd+0x62>
 80018f4:	431d      	orrs	r5, r3
 80018f6:	8025      	strh	r5, [r4, #0]
 80018f8:	e001      	b.n	80018fe <TIM_Cmd+0x66>
 80018fa:	43ab      	bics	r3, r5
 80018fc:	8023      	strh	r3, [r4, #0]
 80018fe:	bd70      	pop	{r4, r5, r6, pc}
 8001900:	40012c00 	.word	0x40012c00
 8001904:	40000400 	.word	0x40000400
 8001908:	40001000 	.word	0x40001000
 800190c:	40001400 	.word	0x40001400
 8001910:	40002000 	.word	0x40002000
 8001914:	40014000 	.word	0x40014000
 8001918:	40014400 	.word	0x40014400
 800191c:	bffeb800 	.word	0xbffeb800

08001920 <TIM_ITConfig>:
 8001920:	4b1f      	ldr	r3, [pc, #124]	; (80019a0 <TIM_ITConfig+0x80>)
 8001922:	b570      	push	{r4, r5, r6, lr}
 8001924:	1c04      	adds	r4, r0, #0
 8001926:	1c0d      	adds	r5, r1, #0
 8001928:	1c16      	adds	r6, r2, #0
 800192a:	4298      	cmp	r0, r3
 800192c:	d01a      	beq.n	8001964 <TIM_ITConfig+0x44>
 800192e:	2380      	movs	r3, #128	; 0x80
 8001930:	05db      	lsls	r3, r3, #23
 8001932:	4298      	cmp	r0, r3
 8001934:	d016      	beq.n	8001964 <TIM_ITConfig+0x44>
 8001936:	4b1b      	ldr	r3, [pc, #108]	; (80019a4 <TIM_ITConfig+0x84>)
 8001938:	4298      	cmp	r0, r3
 800193a:	d013      	beq.n	8001964 <TIM_ITConfig+0x44>
 800193c:	4b1a      	ldr	r3, [pc, #104]	; (80019a8 <TIM_ITConfig+0x88>)
 800193e:	4298      	cmp	r0, r3
 8001940:	d010      	beq.n	8001964 <TIM_ITConfig+0x44>
 8001942:	4b1a      	ldr	r3, [pc, #104]	; (80019ac <TIM_ITConfig+0x8c>)
 8001944:	4298      	cmp	r0, r3
 8001946:	d00d      	beq.n	8001964 <TIM_ITConfig+0x44>
 8001948:	4b19      	ldr	r3, [pc, #100]	; (80019b0 <TIM_ITConfig+0x90>)
 800194a:	4298      	cmp	r0, r3
 800194c:	d00a      	beq.n	8001964 <TIM_ITConfig+0x44>
 800194e:	4b19      	ldr	r3, [pc, #100]	; (80019b4 <TIM_ITConfig+0x94>)
 8001950:	4298      	cmp	r0, r3
 8001952:	d007      	beq.n	8001964 <TIM_ITConfig+0x44>
 8001954:	4b18      	ldr	r3, [pc, #96]	; (80019b8 <TIM_ITConfig+0x98>)
 8001956:	4298      	cmp	r0, r3
 8001958:	d004      	beq.n	8001964 <TIM_ITConfig+0x44>
 800195a:	4a18      	ldr	r2, [pc, #96]	; (80019bc <TIM_ITConfig+0x9c>)
 800195c:	1880      	adds	r0, r0, r2
 800195e:	4243      	negs	r3, r0
 8001960:	4158      	adcs	r0, r3
 8001962:	e000      	b.n	8001966 <TIM_ITConfig+0x46>
 8001964:	2001      	movs	r0, #1
 8001966:	f7ff fcc3 	bl	80012f0 <assert_param>
 800196a:	23ff      	movs	r3, #255	; 0xff
 800196c:	1c2a      	adds	r2, r5, #0
 800196e:	2000      	movs	r0, #0
 8001970:	439a      	bics	r2, r3
 8001972:	4282      	cmp	r2, r0
 8001974:	d102      	bne.n	800197c <TIM_ITConfig+0x5c>
 8001976:	1c28      	adds	r0, r5, #0
 8001978:	1e43      	subs	r3, r0, #1
 800197a:	4198      	sbcs	r0, r3
 800197c:	f7ff fcb8 	bl	80012f0 <assert_param>
 8001980:	2301      	movs	r3, #1
 8001982:	2000      	movs	r0, #0
 8001984:	42b3      	cmp	r3, r6
 8001986:	4140      	adcs	r0, r0
 8001988:	f7ff fcb2 	bl	80012f0 <assert_param>
 800198c:	68e3      	ldr	r3, [r4, #12]
 800198e:	b29b      	uxth	r3, r3
 8001990:	2e00      	cmp	r6, #0
 8001992:	d002      	beq.n	800199a <TIM_ITConfig+0x7a>
 8001994:	431d      	orrs	r5, r3
 8001996:	81a5      	strh	r5, [r4, #12]
 8001998:	e001      	b.n	800199e <TIM_ITConfig+0x7e>
 800199a:	43ab      	bics	r3, r5
 800199c:	81a3      	strh	r3, [r4, #12]
 800199e:	bd70      	pop	{r4, r5, r6, pc}
 80019a0:	40012c00 	.word	0x40012c00
 80019a4:	40000400 	.word	0x40000400
 80019a8:	40001000 	.word	0x40001000
 80019ac:	40001400 	.word	0x40001400
 80019b0:	40002000 	.word	0x40002000
 80019b4:	40014000 	.word	0x40014000
 80019b8:	40014400 	.word	0x40014400
 80019bc:	bffeb800 	.word	0xbffeb800

080019c0 <USART_Init>:
 80019c0:	b5f0      	push	{r4, r5, r6, r7, lr}
 80019c2:	4e53      	ldr	r6, [pc, #332]	; (8001b10 <USART_Init+0x150>)
 80019c4:	b08b      	sub	sp, #44	; 0x2c
 80019c6:	1c04      	adds	r4, r0, #0
 80019c8:	1c0d      	adds	r5, r1, #0
 80019ca:	42b0      	cmp	r0, r6
 80019cc:	d016      	beq.n	80019fc <USART_Init+0x3c>
 80019ce:	4b51      	ldr	r3, [pc, #324]	; (8001b14 <USART_Init+0x154>)
 80019d0:	4298      	cmp	r0, r3
 80019d2:	d013      	beq.n	80019fc <USART_Init+0x3c>
 80019d4:	4b50      	ldr	r3, [pc, #320]	; (8001b18 <USART_Init+0x158>)
 80019d6:	4298      	cmp	r0, r3
 80019d8:	d010      	beq.n	80019fc <USART_Init+0x3c>
 80019da:	4b50      	ldr	r3, [pc, #320]	; (8001b1c <USART_Init+0x15c>)
 80019dc:	4298      	cmp	r0, r3
 80019de:	d00d      	beq.n	80019fc <USART_Init+0x3c>
 80019e0:	4b4f      	ldr	r3, [pc, #316]	; (8001b20 <USART_Init+0x160>)
 80019e2:	4298      	cmp	r0, r3
 80019e4:	d00a      	beq.n	80019fc <USART_Init+0x3c>
 80019e6:	4b4f      	ldr	r3, [pc, #316]	; (8001b24 <USART_Init+0x164>)
 80019e8:	4298      	cmp	r0, r3
 80019ea:	d007      	beq.n	80019fc <USART_Init+0x3c>
 80019ec:	4b4e      	ldr	r3, [pc, #312]	; (8001b28 <USART_Init+0x168>)
 80019ee:	4298      	cmp	r0, r3
 80019f0:	d004      	beq.n	80019fc <USART_Init+0x3c>
 80019f2:	494e      	ldr	r1, [pc, #312]	; (8001b2c <USART_Init+0x16c>)
 80019f4:	1840      	adds	r0, r0, r1
 80019f6:	4243      	negs	r3, r0
 80019f8:	4158      	adcs	r0, r3
 80019fa:	e000      	b.n	80019fe <USART_Init+0x3e>
 80019fc:	2001      	movs	r0, #1
 80019fe:	f7ff fc77 	bl	80012f0 <assert_param>
 8001a02:	682b      	ldr	r3, [r5, #0]
 8001a04:	4a4a      	ldr	r2, [pc, #296]	; (8001b30 <USART_Init+0x170>)
 8001a06:	3b01      	subs	r3, #1
 8001a08:	2000      	movs	r0, #0
 8001a0a:	429a      	cmp	r2, r3
 8001a0c:	4140      	adcs	r0, r0
 8001a0e:	f7ff fc6f 	bl	80012f0 <assert_param>
 8001a12:	686b      	ldr	r3, [r5, #4]
 8001a14:	4a47      	ldr	r2, [pc, #284]	; (8001b34 <USART_Init+0x174>)
 8001a16:	2001      	movs	r0, #1
 8001a18:	4213      	tst	r3, r2
 8001a1a:	d003      	beq.n	8001a24 <USART_Init+0x64>
 8001a1c:	4a46      	ldr	r2, [pc, #280]	; (8001b38 <USART_Init+0x178>)
 8001a1e:	1898      	adds	r0, r3, r2
 8001a20:	4243      	negs	r3, r0
 8001a22:	4158      	adcs	r0, r3
 8001a24:	f7ff fc64 	bl	80012f0 <assert_param>
 8001a28:	68ab      	ldr	r3, [r5, #8]
 8001a2a:	4a44      	ldr	r2, [pc, #272]	; (8001b3c <USART_Init+0x17c>)
 8001a2c:	2001      	movs	r0, #1
 8001a2e:	4213      	tst	r3, r2
 8001a30:	d003      	beq.n	8001a3a <USART_Init+0x7a>
 8001a32:	4943      	ldr	r1, [pc, #268]	; (8001b40 <USART_Init+0x180>)
 8001a34:	1858      	adds	r0, r3, r1
 8001a36:	4243      	negs	r3, r0
 8001a38:	4158      	adcs	r0, r3
 8001a3a:	f7ff fc59 	bl	80012f0 <assert_param>
 8001a3e:	68eb      	ldr	r3, [r5, #12]
 8001a40:	4a40      	ldr	r2, [pc, #256]	; (8001b44 <USART_Init+0x184>)
 8001a42:	2001      	movs	r0, #1
 8001a44:	4213      	tst	r3, r2
 8001a46:	d003      	beq.n	8001a50 <USART_Init+0x90>
 8001a48:	4a3f      	ldr	r2, [pc, #252]	; (8001b48 <USART_Init+0x188>)
 8001a4a:	1898      	adds	r0, r3, r2
 8001a4c:	4243      	negs	r3, r0
 8001a4e:	4158      	adcs	r0, r3
 8001a50:	f7ff fc4e 	bl	80012f0 <assert_param>
 8001a54:	692b      	ldr	r3, [r5, #16]
 8001a56:	220c      	movs	r2, #12
 8001a58:	1c19      	adds	r1, r3, #0
 8001a5a:	2000      	movs	r0, #0
 8001a5c:	4391      	bics	r1, r2
 8001a5e:	4281      	cmp	r1, r0
 8001a60:	d102      	bne.n	8001a68 <USART_Init+0xa8>
 8001a62:	1c18      	adds	r0, r3, #0
 8001a64:	1e43      	subs	r3, r0, #1
 8001a66:	4198      	sbcs	r0, r3
 8001a68:	f7ff fc42 	bl	80012f0 <assert_param>
 8001a6c:	4f37      	ldr	r7, [pc, #220]	; (8001b4c <USART_Init+0x18c>)
 8001a6e:	6968      	ldr	r0, [r5, #20]
 8001a70:	4038      	ands	r0, r7
 8001a72:	4243      	negs	r3, r0
 8001a74:	4158      	adcs	r0, r3
 8001a76:	f7ff fc3b 	bl	80012f0 <assert_param>
 8001a7a:	6823      	ldr	r3, [r4, #0]
 8001a7c:	2201      	movs	r2, #1
 8001a7e:	4393      	bics	r3, r2
 8001a80:	6023      	str	r3, [r4, #0]
 8001a82:	6862      	ldr	r2, [r4, #4]
 8001a84:	4b32      	ldr	r3, [pc, #200]	; (8001b50 <USART_Init+0x190>)
 8001a86:	6869      	ldr	r1, [r5, #4]
 8001a88:	4013      	ands	r3, r2
 8001a8a:	68aa      	ldr	r2, [r5, #8]
 8001a8c:	4668      	mov	r0, sp
 8001a8e:	4313      	orrs	r3, r2
 8001a90:	6063      	str	r3, [r4, #4]
 8001a92:	6822      	ldr	r2, [r4, #0]
 8001a94:	4b2f      	ldr	r3, [pc, #188]	; (8001b54 <USART_Init+0x194>)
 8001a96:	401a      	ands	r2, r3
 8001a98:	68eb      	ldr	r3, [r5, #12]
 8001a9a:	430b      	orrs	r3, r1
 8001a9c:	6929      	ldr	r1, [r5, #16]
 8001a9e:	430b      	orrs	r3, r1
 8001aa0:	4313      	orrs	r3, r2
 8001aa2:	6023      	str	r3, [r4, #0]
 8001aa4:	68a3      	ldr	r3, [r4, #8]
 8001aa6:	696a      	ldr	r2, [r5, #20]
 8001aa8:	401f      	ands	r7, r3
 8001aaa:	4317      	orrs	r7, r2
 8001aac:	60a7      	str	r7, [r4, #8]
 8001aae:	f000 fac3 	bl	8002038 <RCC_GetClocksFreq>
 8001ab2:	42b4      	cmp	r4, r6
 8001ab4:	d101      	bne.n	8001aba <USART_Init+0xfa>
 8001ab6:	9e06      	ldr	r6, [sp, #24]
 8001ab8:	e00a      	b.n	8001ad0 <USART_Init+0x110>
 8001aba:	4b16      	ldr	r3, [pc, #88]	; (8001b14 <USART_Init+0x154>)
 8001abc:	429c      	cmp	r4, r3
 8001abe:	d101      	bne.n	8001ac4 <USART_Init+0x104>
 8001ac0:	9e07      	ldr	r6, [sp, #28]
 8001ac2:	e005      	b.n	8001ad0 <USART_Init+0x110>
 8001ac4:	4b14      	ldr	r3, [pc, #80]	; (8001b18 <USART_Init+0x158>)
 8001ac6:	429c      	cmp	r4, r3
 8001ac8:	d101      	bne.n	8001ace <USART_Init+0x10e>
 8001aca:	9e08      	ldr	r6, [sp, #32]
 8001acc:	e000      	b.n	8001ad0 <USART_Init+0x110>
 8001ace:	9e02      	ldr	r6, [sp, #8]
 8001ad0:	6823      	ldr	r3, [r4, #0]
 8001ad2:	682f      	ldr	r7, [r5, #0]
 8001ad4:	0419      	lsls	r1, r3, #16
 8001ad6:	d500      	bpl.n	8001ada <USART_Init+0x11a>
 8001ad8:	0076      	lsls	r6, r6, #1
 8001ada:	1c39      	adds	r1, r7, #0
 8001adc:	1c30      	adds	r0, r6, #0
 8001ade:	f000 fcd1 	bl	8002484 <__aeabi_uidiv>
 8001ae2:	1c39      	adds	r1, r7, #0
 8001ae4:	1c05      	adds	r5, r0, #0
 8001ae6:	1c30      	adds	r0, r6, #0
 8001ae8:	f000 fd10 	bl	800250c <__aeabi_uidivmod>
 8001aec:	087f      	lsrs	r7, r7, #1
 8001aee:	2300      	movs	r3, #0
 8001af0:	42b9      	cmp	r1, r7
 8001af2:	415b      	adcs	r3, r3
 8001af4:	18ed      	adds	r5, r5, r3
 8001af6:	6823      	ldr	r3, [r4, #0]
 8001af8:	041a      	lsls	r2, r3, #16
 8001afa:	d504      	bpl.n	8001b06 <USART_Init+0x146>
 8001afc:	4a16      	ldr	r2, [pc, #88]	; (8001b58 <USART_Init+0x198>)
 8001afe:	072b      	lsls	r3, r5, #28
 8001b00:	0f5b      	lsrs	r3, r3, #29
 8001b02:	4015      	ands	r5, r2
 8001b04:	431d      	orrs	r5, r3
 8001b06:	b2ad      	uxth	r5, r5
 8001b08:	81a5      	strh	r5, [r4, #12]
 8001b0a:	b00b      	add	sp, #44	; 0x2c
 8001b0c:	bdf0      	pop	{r4, r5, r6, r7, pc}
 8001b0e:	46c0      	nop			; (mov r8, r8)
 8001b10:	40013800 	.word	0x40013800
 8001b14:	40004400 	.word	0x40004400
 8001b18:	40004800 	.word	0x40004800
 8001b1c:	40004c00 	.word	0x40004c00
 8001b20:	40005000 	.word	0x40005000
 8001b24:	40011400 	.word	0x40011400
 8001b28:	40011800 	.word	0x40011800
 8001b2c:	bffee400 	.word	0xbffee400
 8001b30:	005b8d7f 	.word	0x005b8d7f
 8001b34:	ffffefff 	.word	0xffffefff
 8001b38:	effff000 	.word	0xeffff000
 8001b3c:	ffffdfff 	.word	0xffffdfff
 8001b40:	ffffd000 	.word	0xffffd000
 8001b44:	fffffbff 	.word	0xfffffbff
 8001b48:	fffffa00 	.word	0xfffffa00
 8001b4c:	fffffcff 	.word	0xfffffcff
 8001b50:	ffffcfff 	.word	0xffffcfff
 8001b54:	ffffe9f3 	.word	0xffffe9f3
 8001b58:	0000fff0 	.word	0x0000fff0

08001b5c <USART_Cmd>:
 8001b5c:	4b17      	ldr	r3, [pc, #92]	; (8001bbc <USART_Cmd+0x60>)
 8001b5e:	b570      	push	{r4, r5, r6, lr}
 8001b60:	1c04      	adds	r4, r0, #0
 8001b62:	1c0e      	adds	r6, r1, #0
 8001b64:	4298      	cmp	r0, r3
 8001b66:	d016      	beq.n	8001b96 <USART_Cmd+0x3a>
 8001b68:	4b15      	ldr	r3, [pc, #84]	; (8001bc0 <USART_Cmd+0x64>)
 8001b6a:	4298      	cmp	r0, r3
 8001b6c:	d013      	beq.n	8001b96 <USART_Cmd+0x3a>
 8001b6e:	4b15      	ldr	r3, [pc, #84]	; (8001bc4 <USART_Cmd+0x68>)
 8001b70:	4298      	cmp	r0, r3
 8001b72:	d010      	beq.n	8001b96 <USART_Cmd+0x3a>
 8001b74:	4b14      	ldr	r3, [pc, #80]	; (8001bc8 <USART_Cmd+0x6c>)
 8001b76:	4298      	cmp	r0, r3
 8001b78:	d00d      	beq.n	8001b96 <USART_Cmd+0x3a>
 8001b7a:	4b14      	ldr	r3, [pc, #80]	; (8001bcc <USART_Cmd+0x70>)
 8001b7c:	4298      	cmp	r0, r3
 8001b7e:	d00a      	beq.n	8001b96 <USART_Cmd+0x3a>
 8001b80:	4b13      	ldr	r3, [pc, #76]	; (8001bd0 <USART_Cmd+0x74>)
 8001b82:	4298      	cmp	r0, r3
 8001b84:	d007      	beq.n	8001b96 <USART_Cmd+0x3a>
 8001b86:	4b13      	ldr	r3, [pc, #76]	; (8001bd4 <USART_Cmd+0x78>)
 8001b88:	4298      	cmp	r0, r3
 8001b8a:	d004      	beq.n	8001b96 <USART_Cmd+0x3a>
 8001b8c:	4b12      	ldr	r3, [pc, #72]	; (8001bd8 <USART_Cmd+0x7c>)
 8001b8e:	18c0      	adds	r0, r0, r3
 8001b90:	4243      	negs	r3, r0
 8001b92:	4158      	adcs	r0, r3
 8001b94:	e000      	b.n	8001b98 <USART_Cmd+0x3c>
 8001b96:	2001      	movs	r0, #1
 8001b98:	f7ff fbaa 	bl	80012f0 <assert_param>
 8001b9c:	2501      	movs	r5, #1
 8001b9e:	2000      	movs	r0, #0
 8001ba0:	42b5      	cmp	r5, r6
 8001ba2:	4140      	adcs	r0, r0
 8001ba4:	f7ff fba4 	bl	80012f0 <assert_param>
 8001ba8:	6823      	ldr	r3, [r4, #0]
 8001baa:	2e00      	cmp	r6, #0
 8001bac:	d002      	beq.n	8001bb4 <USART_Cmd+0x58>
 8001bae:	431d      	orrs	r5, r3
 8001bb0:	6025      	str	r5, [r4, #0]
 8001bb2:	e001      	b.n	8001bb8 <USART_Cmd+0x5c>
 8001bb4:	43ab      	bics	r3, r5
 8001bb6:	6023      	str	r3, [r4, #0]
 8001bb8:	bd70      	pop	{r4, r5, r6, pc}
 8001bba:	46c0      	nop			; (mov r8, r8)
 8001bbc:	40013800 	.word	0x40013800
 8001bc0:	40004400 	.word	0x40004400
 8001bc4:	40004800 	.word	0x40004800
 8001bc8:	40004c00 	.word	0x40004c00
 8001bcc:	40005000 	.word	0x40005000
 8001bd0:	40011400 	.word	0x40011400
 8001bd4:	40011800 	.word	0x40011800
 8001bd8:	bffee400 	.word	0xbffee400

08001bdc <USART_ClearITPendingBit>:
 8001bdc:	b538      	push	{r3, r4, r5, lr}
 8001bde:	4b26      	ldr	r3, [pc, #152]	; (8001c78 <USART_ClearITPendingBit+0x9c>)
 8001be0:	1c05      	adds	r5, r0, #0
 8001be2:	1c0c      	adds	r4, r1, #0
 8001be4:	4298      	cmp	r0, r3
 8001be6:	d016      	beq.n	8001c16 <USART_ClearITPendingBit+0x3a>
 8001be8:	4b24      	ldr	r3, [pc, #144]	; (8001c7c <USART_ClearITPendingBit+0xa0>)
 8001bea:	4298      	cmp	r0, r3
 8001bec:	d013      	beq.n	8001c16 <USART_ClearITPendingBit+0x3a>
 8001bee:	4b24      	ldr	r3, [pc, #144]	; (8001c80 <USART_ClearITPendingBit+0xa4>)
 8001bf0:	4298      	cmp	r0, r3
 8001bf2:	d010      	beq.n	8001c16 <USART_ClearITPendingBit+0x3a>
 8001bf4:	4b23      	ldr	r3, [pc, #140]	; (8001c84 <USART_ClearITPendingBit+0xa8>)
 8001bf6:	4298      	cmp	r0, r3
 8001bf8:	d00d      	beq.n	8001c16 <USART_ClearITPendingBit+0x3a>
 8001bfa:	4b23      	ldr	r3, [pc, #140]	; (8001c88 <USART_ClearITPendingBit+0xac>)
 8001bfc:	4298      	cmp	r0, r3
 8001bfe:	d00a      	beq.n	8001c16 <USART_ClearITPendingBit+0x3a>
 8001c00:	4b22      	ldr	r3, [pc, #136]	; (8001c8c <USART_ClearITPendingBit+0xb0>)
 8001c02:	4298      	cmp	r0, r3
 8001c04:	d007      	beq.n	8001c16 <USART_ClearITPendingBit+0x3a>
 8001c06:	4b22      	ldr	r3, [pc, #136]	; (8001c90 <USART_ClearITPendingBit+0xb4>)
 8001c08:	4298      	cmp	r0, r3
 8001c0a:	d004      	beq.n	8001c16 <USART_ClearITPendingBit+0x3a>
 8001c0c:	4a21      	ldr	r2, [pc, #132]	; (8001c94 <USART_ClearITPendingBit+0xb8>)
 8001c0e:	1880      	adds	r0, r0, r2
 8001c10:	4243      	negs	r3, r0
 8001c12:	4158      	adcs	r0, r3
 8001c14:	e000      	b.n	8001c18 <USART_ClearITPendingBit+0x3c>
 8001c16:	2001      	movs	r0, #1
 8001c18:	f7ff fb6a 	bl	80012f0 <assert_param>
 8001c1c:	4b1e      	ldr	r3, [pc, #120]	; (8001c98 <USART_ClearITPendingBit+0xbc>)
 8001c1e:	429c      	cmp	r4, r3
 8001c20:	d022      	beq.n	8001c68 <USART_ClearITPendingBit+0x8c>
 8001c22:	2384      	movs	r3, #132	; 0x84
 8001c24:	005b      	lsls	r3, r3, #1
 8001c26:	429c      	cmp	r4, r3
 8001c28:	d01e      	beq.n	8001c68 <USART_ClearITPendingBit+0x8c>
 8001c2a:	4a1c      	ldr	r2, [pc, #112]	; (8001c9c <USART_ClearITPendingBit+0xc0>)
 8001c2c:	4b1c      	ldr	r3, [pc, #112]	; (8001ca0 <USART_ClearITPendingBit+0xc4>)
 8001c2e:	4022      	ands	r2, r4
 8001c30:	429a      	cmp	r2, r3
 8001c32:	d019      	beq.n	8001c68 <USART_ClearITPendingBit+0x8c>
 8001c34:	4b1b      	ldr	r3, [pc, #108]	; (8001ca4 <USART_ClearITPendingBit+0xc8>)
 8001c36:	429c      	cmp	r4, r3
 8001c38:	d016      	beq.n	8001c68 <USART_ClearITPendingBit+0x8c>
 8001c3a:	4b1b      	ldr	r3, [pc, #108]	; (8001ca8 <USART_ClearITPendingBit+0xcc>)
 8001c3c:	429c      	cmp	r4, r3
 8001c3e:	d013      	beq.n	8001c68 <USART_ClearITPendingBit+0x8c>
 8001c40:	4b1a      	ldr	r3, [pc, #104]	; (8001cac <USART_ClearITPendingBit+0xd0>)
 8001c42:	429c      	cmp	r4, r3
 8001c44:	d010      	beq.n	8001c68 <USART_ClearITPendingBit+0x8c>
 8001c46:	4b1a      	ldr	r3, [pc, #104]	; (8001cb0 <USART_ClearITPendingBit+0xd4>)
 8001c48:	429c      	cmp	r4, r3
 8001c4a:	d00d      	beq.n	8001c68 <USART_ClearITPendingBit+0x8c>
 8001c4c:	4b19      	ldr	r3, [pc, #100]	; (8001cb4 <USART_ClearITPendingBit+0xd8>)
 8001c4e:	429c      	cmp	r4, r3
 8001c50:	d00a      	beq.n	8001c68 <USART_ClearITPendingBit+0x8c>
 8001c52:	4b19      	ldr	r3, [pc, #100]	; (8001cb8 <USART_ClearITPendingBit+0xdc>)
 8001c54:	429c      	cmp	r4, r3
 8001c56:	d007      	beq.n	8001c68 <USART_ClearITPendingBit+0x8c>
 8001c58:	4b18      	ldr	r3, [pc, #96]	; (8001cbc <USART_ClearITPendingBit+0xe0>)
 8001c5a:	429c      	cmp	r4, r3
 8001c5c:	d004      	beq.n	8001c68 <USART_ClearITPendingBit+0x8c>
 8001c5e:	4a18      	ldr	r2, [pc, #96]	; (8001cc0 <USART_ClearITPendingBit+0xe4>)
 8001c60:	18a3      	adds	r3, r4, r2
 8001c62:	4258      	negs	r0, r3
 8001c64:	4158      	adcs	r0, r3
 8001c66:	e000      	b.n	8001c6a <USART_ClearITPendingBit+0x8e>
 8001c68:	2001      	movs	r0, #1
 8001c6a:	f7ff fb41 	bl	80012f0 <assert_param>
 8001c6e:	0c24      	lsrs	r4, r4, #16
 8001c70:	2301      	movs	r3, #1
 8001c72:	40a3      	lsls	r3, r4
 8001c74:	622b      	str	r3, [r5, #32]
 8001c76:	bd38      	pop	{r3, r4, r5, pc}
 8001c78:	40013800 	.word	0x40013800
 8001c7c:	40004400 	.word	0x40004400
 8001c80:	40004800 	.word	0x40004800
 8001c84:	40004c00 	.word	0x40004c00
 8001c88:	40005000 	.word	0x40005000
 8001c8c:	40011400 	.word	0x40011400
 8001c90:	40011800 	.word	0x40011800
 8001c94:	bffee400 	.word	0xbffee400
 8001c98:	00060106 	.word	0x00060106
 8001c9c:	fffdffff 	.word	0xfffdffff
 8001ca0:	00010300 	.word	0x00010300
 8001ca4:	00020300 	.word	0x00020300
 8001ca8:	00040104 	.word	0x00040104
 8001cac:	00080206 	.word	0x00080206
 8001cb0:	0009030a 	.word	0x0009030a
 8001cb4:	000b011a 	.word	0x000b011a
 8001cb8:	000c011b 	.word	0x000c011b
 8001cbc:	0011010e 	.word	0x0011010e
 8001cc0:	ffebfcea 	.word	0xffebfcea

08001cc4 <ADC_DeInit>:
 8001cc4:	4b0a      	ldr	r3, [pc, #40]	; (8001cf0 <ADC_DeInit+0x2c>)
 8001cc6:	b510      	push	{r4, lr}
 8001cc8:	18c4      	adds	r4, r0, r3
 8001cca:	4263      	negs	r3, r4
 8001ccc:	415c      	adcs	r4, r3
 8001cce:	b2e4      	uxtb	r4, r4
 8001cd0:	1c20      	adds	r0, r4, #0
 8001cd2:	f7ff fb0d 	bl	80012f0 <assert_param>
 8001cd6:	2c00      	cmp	r4, #0
 8001cd8:	d009      	beq.n	8001cee <ADC_DeInit+0x2a>
 8001cda:	2080      	movs	r0, #128	; 0x80
 8001cdc:	0080      	lsls	r0, r0, #2
 8001cde:	2101      	movs	r1, #1
 8001ce0:	f000 face 	bl	8002280 <RCC_APB2PeriphResetCmd>
 8001ce4:	2080      	movs	r0, #128	; 0x80
 8001ce6:	0080      	lsls	r0, r0, #2
 8001ce8:	2100      	movs	r1, #0
 8001cea:	f000 fac9 	bl	8002280 <RCC_APB2PeriphResetCmd>
 8001cee:	bd10      	pop	{r4, pc}
 8001cf0:	bffedc00 	.word	0xbffedc00

08001cf4 <ADC_Init>:
 8001cf4:	b570      	push	{r4, r5, r6, lr}
 8001cf6:	1c0c      	adds	r4, r1, #0
 8001cf8:	4924      	ldr	r1, [pc, #144]	; (8001d8c <ADC_Init+0x98>)
 8001cfa:	1c05      	adds	r5, r0, #0
 8001cfc:	1840      	adds	r0, r0, r1
 8001cfe:	4243      	negs	r3, r0
 8001d00:	4158      	adcs	r0, r3
 8001d02:	f7ff faf5 	bl	80012f0 <assert_param>
 8001d06:	6820      	ldr	r0, [r4, #0]
 8001d08:	2318      	movs	r3, #24
 8001d0a:	4398      	bics	r0, r3
 8001d0c:	4243      	negs	r3, r0
 8001d0e:	4158      	adcs	r0, r3
 8001d10:	f7ff faee 	bl	80012f0 <assert_param>
 8001d14:	7923      	ldrb	r3, [r4, #4]
 8001d16:	2601      	movs	r6, #1
 8001d18:	2000      	movs	r0, #0
 8001d1a:	429e      	cmp	r6, r3
 8001d1c:	4140      	adcs	r0, r0
 8001d1e:	f7ff fae7 	bl	80012f0 <assert_param>
 8001d22:	68a3      	ldr	r3, [r4, #8]
 8001d24:	481a      	ldr	r0, [pc, #104]	; (8001d90 <ADC_Init+0x9c>)
 8001d26:	4018      	ands	r0, r3
 8001d28:	4243      	negs	r3, r0
 8001d2a:	4158      	adcs	r0, r3
 8001d2c:	f7ff fae0 	bl	80012f0 <assert_param>
 8001d30:	68e3      	ldr	r3, [r4, #12]
 8001d32:	22c0      	movs	r2, #192	; 0xc0
 8001d34:	1c19      	adds	r1, r3, #0
 8001d36:	4391      	bics	r1, r2
 8001d38:	1c30      	adds	r0, r6, #0
 8001d3a:	2900      	cmp	r1, #0
 8001d3c:	d003      	beq.n	8001d46 <ADC_Init+0x52>
 8001d3e:	1e58      	subs	r0, r3, #1
 8001d40:	38ff      	subs	r0, #255	; 0xff
 8001d42:	4243      	negs	r3, r0
 8001d44:	4158      	adcs	r0, r3
 8001d46:	f7ff fad3 	bl	80012f0 <assert_param>
 8001d4a:	6920      	ldr	r0, [r4, #16]
 8001d4c:	2320      	movs	r3, #32
 8001d4e:	4398      	bics	r0, r3
 8001d50:	4243      	negs	r3, r0
 8001d52:	4158      	adcs	r0, r3
 8001d54:	f7ff facc 	bl	80012f0 <assert_param>
 8001d58:	6960      	ldr	r0, [r4, #20]
 8001d5a:	2304      	movs	r3, #4
 8001d5c:	4398      	bics	r0, r3
 8001d5e:	4243      	negs	r3, r0
 8001d60:	4158      	adcs	r0, r3
 8001d62:	f7ff fac5 	bl	80012f0 <assert_param>
 8001d66:	6823      	ldr	r3, [r4, #0]
 8001d68:	68a2      	ldr	r2, [r4, #8]
 8001d6a:	68e9      	ldr	r1, [r5, #12]
 8001d6c:	431a      	orrs	r2, r3
 8001d6e:	68e3      	ldr	r3, [r4, #12]
 8001d70:	431a      	orrs	r2, r3
 8001d72:	6923      	ldr	r3, [r4, #16]
 8001d74:	431a      	orrs	r2, r3
 8001d76:	6963      	ldr	r3, [r4, #20]
 8001d78:	431a      	orrs	r2, r3
 8001d7a:	4b06      	ldr	r3, [pc, #24]	; (8001d94 <ADC_Init+0xa0>)
 8001d7c:	400b      	ands	r3, r1
 8001d7e:	4313      	orrs	r3, r2
 8001d80:	7922      	ldrb	r2, [r4, #4]
 8001d82:	0352      	lsls	r2, r2, #13
 8001d84:	4313      	orrs	r3, r2
 8001d86:	60eb      	str	r3, [r5, #12]
 8001d88:	bd70      	pop	{r4, r5, r6, pc}
 8001d8a:	46c0      	nop			; (mov r8, r8)
 8001d8c:	bffedc00 	.word	0xbffedc00
 8001d90:	fffff3ff 	.word	0xfffff3ff
 8001d94:	ffffd203 	.word	0xffffd203

08001d98 <ADC_Cmd>:
 8001d98:	4b0c      	ldr	r3, [pc, #48]	; (8001dcc <ADC_Cmd+0x34>)
 8001d9a:	b570      	push	{r4, r5, r6, lr}
 8001d9c:	1c04      	adds	r4, r0, #0
 8001d9e:	18c0      	adds	r0, r0, r3
 8001da0:	4243      	negs	r3, r0
 8001da2:	4158      	adcs	r0, r3
 8001da4:	1c0e      	adds	r6, r1, #0
 8001da6:	2501      	movs	r5, #1
 8001da8:	f7ff faa2 	bl	80012f0 <assert_param>
 8001dac:	2000      	movs	r0, #0
 8001dae:	42b5      	cmp	r5, r6
 8001db0:	4140      	adcs	r0, r0
 8001db2:	f7ff fa9d 	bl	80012f0 <assert_param>
 8001db6:	68a3      	ldr	r3, [r4, #8]
 8001db8:	2e00      	cmp	r6, #0
 8001dba:	d002      	beq.n	8001dc2 <ADC_Cmd+0x2a>
 8001dbc:	431d      	orrs	r5, r3
 8001dbe:	60a5      	str	r5, [r4, #8]
 8001dc0:	e002      	b.n	8001dc8 <ADC_Cmd+0x30>
 8001dc2:	2202      	movs	r2, #2
 8001dc4:	4313      	orrs	r3, r2
 8001dc6:	60a3      	str	r3, [r4, #8]
 8001dc8:	bd70      	pop	{r4, r5, r6, pc}
 8001dca:	46c0      	nop			; (mov r8, r8)
 8001dcc:	bffedc00 	.word	0xbffedc00

08001dd0 <ADC_TempSensorCmd>:
 8001dd0:	2301      	movs	r3, #1
 8001dd2:	b510      	push	{r4, lr}
 8001dd4:	1c04      	adds	r4, r0, #0
 8001dd6:	2000      	movs	r0, #0
 8001dd8:	42a3      	cmp	r3, r4
 8001dda:	4140      	adcs	r0, r0
 8001ddc:	f7ff fa88 	bl	80012f0 <assert_param>
 8001de0:	4b05      	ldr	r3, [pc, #20]	; (8001df8 <ADC_TempSensorCmd+0x28>)
 8001de2:	6819      	ldr	r1, [r3, #0]
 8001de4:	2c00      	cmp	r4, #0
 8001de6:	d003      	beq.n	8001df0 <ADC_TempSensorCmd+0x20>
 8001de8:	2280      	movs	r2, #128	; 0x80
 8001dea:	0412      	lsls	r2, r2, #16
 8001dec:	430a      	orrs	r2, r1
 8001dee:	e001      	b.n	8001df4 <ADC_TempSensorCmd+0x24>
 8001df0:	4a02      	ldr	r2, [pc, #8]	; (8001dfc <ADC_TempSensorCmd+0x2c>)
 8001df2:	400a      	ands	r2, r1
 8001df4:	601a      	str	r2, [r3, #0]
 8001df6:	bd10      	pop	{r4, pc}
 8001df8:	40012708 	.word	0x40012708
 8001dfc:	ff7fffff 	.word	0xff7fffff

08001e00 <ADC_ChannelConfig>:
 8001e00:	4b0e      	ldr	r3, [pc, #56]	; (8001e3c <ADC_ChannelConfig+0x3c>)
 8001e02:	b570      	push	{r4, r5, r6, lr}
 8001e04:	1c04      	adds	r4, r0, #0
 8001e06:	18c0      	adds	r0, r0, r3
 8001e08:	4243      	negs	r3, r0
 8001e0a:	4158      	adcs	r0, r3
 8001e0c:	1c0d      	adds	r5, r1, #0
 8001e0e:	1c16      	adds	r6, r2, #0
 8001e10:	f7ff fa6e 	bl	80012f0 <assert_param>
 8001e14:	2000      	movs	r0, #0
 8001e16:	4285      	cmp	r5, r0
 8001e18:	d002      	beq.n	8001e20 <ADC_ChannelConfig+0x20>
 8001e1a:	0ce8      	lsrs	r0, r5, #19
 8001e1c:	4243      	negs	r3, r0
 8001e1e:	4158      	adcs	r0, r3
 8001e20:	f7ff fa66 	bl	80012f0 <assert_param>
 8001e24:	2307      	movs	r3, #7
 8001e26:	2000      	movs	r0, #0
 8001e28:	42b3      	cmp	r3, r6
 8001e2a:	4140      	adcs	r0, r0
 8001e2c:	f7ff fa60 	bl	80012f0 <assert_param>
 8001e30:	6aa3      	ldr	r3, [r4, #40]	; 0x28
 8001e32:	431d      	orrs	r5, r3
 8001e34:	62a5      	str	r5, [r4, #40]	; 0x28
 8001e36:	6166      	str	r6, [r4, #20]
 8001e38:	bd70      	pop	{r4, r5, r6, pc}
 8001e3a:	46c0      	nop			; (mov r8, r8)
 8001e3c:	bffedc00 	.word	0xbffedc00

08001e40 <ADC_GetCalibrationFactor>:
 8001e40:	4b0e      	ldr	r3, [pc, #56]	; (8001e7c <ADC_GetCalibrationFactor+0x3c>)
 8001e42:	b510      	push	{r4, lr}
 8001e44:	1c04      	adds	r4, r0, #0
 8001e46:	18c0      	adds	r0, r0, r3
 8001e48:	4243      	negs	r3, r0
 8001e4a:	4158      	adcs	r0, r3
 8001e4c:	f7ff fa50 	bl	80012f0 <assert_param>
 8001e50:	68a2      	ldr	r2, [r4, #8]
 8001e52:	2380      	movs	r3, #128	; 0x80
 8001e54:	061b      	lsls	r3, r3, #24
 8001e56:	4313      	orrs	r3, r2
 8001e58:	60a3      	str	r3, [r4, #8]
 8001e5a:	23f0      	movs	r3, #240	; 0xf0
 8001e5c:	021b      	lsls	r3, r3, #8
 8001e5e:	68a2      	ldr	r2, [r4, #8]
 8001e60:	3b01      	subs	r3, #1
 8001e62:	0fd2      	lsrs	r2, r2, #31
 8001e64:	07d2      	lsls	r2, r2, #31
 8001e66:	2b00      	cmp	r3, #0
 8001e68:	d001      	beq.n	8001e6e <ADC_GetCalibrationFactor+0x2e>
 8001e6a:	2a00      	cmp	r2, #0
 8001e6c:	d1f7      	bne.n	8001e5e <ADC_GetCalibrationFactor+0x1e>
 8001e6e:	68a3      	ldr	r3, [r4, #8]
 8001e70:	2b00      	cmp	r3, #0
 8001e72:	db01      	blt.n	8001e78 <ADC_GetCalibrationFactor+0x38>
 8001e74:	6c20      	ldr	r0, [r4, #64]	; 0x40
 8001e76:	e000      	b.n	8001e7a <ADC_GetCalibrationFactor+0x3a>
 8001e78:	2000      	movs	r0, #0
 8001e7a:	bd10      	pop	{r4, pc}
 8001e7c:	bffedc00 	.word	0xbffedc00

08001e80 <ADC_StartOfConversion>:
 8001e80:	4b06      	ldr	r3, [pc, #24]	; (8001e9c <ADC_StartOfConversion+0x1c>)
 8001e82:	b510      	push	{r4, lr}
 8001e84:	1c04      	adds	r4, r0, #0
 8001e86:	18c0      	adds	r0, r0, r3
 8001e88:	4243      	negs	r3, r0
 8001e8a:	4158      	adcs	r0, r3
 8001e8c:	f7ff fa30 	bl	80012f0 <assert_param>
 8001e90:	68a3      	ldr	r3, [r4, #8]
 8001e92:	2204      	movs	r2, #4
 8001e94:	4313      	orrs	r3, r2
 8001e96:	60a3      	str	r3, [r4, #8]
 8001e98:	bd10      	pop	{r4, pc}
 8001e9a:	46c0      	nop			; (mov r8, r8)
 8001e9c:	bffedc00 	.word	0xbffedc00

08001ea0 <ADC_GetConversionValue>:
 8001ea0:	4b05      	ldr	r3, [pc, #20]	; (8001eb8 <ADC_GetConversionValue+0x18>)
 8001ea2:	b510      	push	{r4, lr}
 8001ea4:	1c04      	adds	r4, r0, #0
 8001ea6:	18c0      	adds	r0, r0, r3
 8001ea8:	4243      	negs	r3, r0
 8001eaa:	4158      	adcs	r0, r3
 8001eac:	f7ff fa20 	bl	80012f0 <assert_param>
 8001eb0:	6c20      	ldr	r0, [r4, #64]	; 0x40
 8001eb2:	b280      	uxth	r0, r0
 8001eb4:	bd10      	pop	{r4, pc}
 8001eb6:	46c0      	nop			; (mov r8, r8)
 8001eb8:	bffedc00 	.word	0xbffedc00

08001ebc <ADC_GetFlagStatus>:
 8001ebc:	4a15      	ldr	r2, [pc, #84]	; (8001f14 <ADC_GetFlagStatus+0x58>)
 8001ebe:	b570      	push	{r4, r5, r6, lr}
 8001ec0:	1c05      	adds	r5, r0, #0
 8001ec2:	1880      	adds	r0, r0, r2
 8001ec4:	1c0c      	adds	r4, r1, #0
 8001ec6:	4243      	negs	r3, r0
 8001ec8:	4158      	adcs	r0, r3
 8001eca:	4e13      	ldr	r6, [pc, #76]	; (8001f18 <ADC_GetFlagStatus+0x5c>)
 8001ecc:	f7ff fa10 	bl	80012f0 <assert_param>
 8001ed0:	1c23      	adds	r3, r4, #0
 8001ed2:	4033      	ands	r3, r6
 8001ed4:	1e5a      	subs	r2, r3, #1
 8001ed6:	2a01      	cmp	r2, #1
 8001ed8:	d90d      	bls.n	8001ef6 <ADC_GetFlagStatus+0x3a>
 8001eda:	2b04      	cmp	r3, #4
 8001edc:	d00b      	beq.n	8001ef6 <ADC_GetFlagStatus+0x3a>
 8001ede:	2c08      	cmp	r4, #8
 8001ee0:	d009      	beq.n	8001ef6 <ADC_GetFlagStatus+0x3a>
 8001ee2:	2c80      	cmp	r4, #128	; 0x80
 8001ee4:	d007      	beq.n	8001ef6 <ADC_GetFlagStatus+0x3a>
 8001ee6:	2b10      	cmp	r3, #16
 8001ee8:	d005      	beq.n	8001ef6 <ADC_GetFlagStatus+0x3a>
 8001eea:	22fe      	movs	r2, #254	; 0xfe
 8001eec:	05d2      	lsls	r2, r2, #23
 8001eee:	18a3      	adds	r3, r4, r2
 8001ef0:	4258      	negs	r0, r3
 8001ef2:	4158      	adcs	r0, r3
 8001ef4:	e000      	b.n	8001ef8 <ADC_GetFlagStatus+0x3c>
 8001ef6:	2001      	movs	r0, #1
 8001ef8:	f7ff f9fa 	bl	80012f0 <assert_param>
 8001efc:	01e3      	lsls	r3, r4, #7
 8001efe:	d502      	bpl.n	8001f06 <ADC_GetFlagStatus+0x4a>
 8001f00:	68ab      	ldr	r3, [r5, #8]
 8001f02:	401e      	ands	r6, r3
 8001f04:	e000      	b.n	8001f08 <ADC_GetFlagStatus+0x4c>
 8001f06:	682e      	ldr	r6, [r5, #0]
 8001f08:	4026      	ands	r6, r4
 8001f0a:	1e74      	subs	r4, r6, #1
 8001f0c:	41a6      	sbcs	r6, r4
 8001f0e:	b2f0      	uxtb	r0, r6
 8001f10:	bd70      	pop	{r4, r5, r6, pc}
 8001f12:	46c0      	nop			; (mov r8, r8)
 8001f14:	bffedc00 	.word	0xbffedc00
 8001f18:	feffffff 	.word	0xfeffffff

08001f1c <ADC_ClearFlag>:
 8001f1c:	b538      	push	{r3, r4, r5, lr}
 8001f1e:	4b0a      	ldr	r3, [pc, #40]	; (8001f48 <ADC_ClearFlag+0x2c>)
 8001f20:	1c05      	adds	r5, r0, #0
 8001f22:	18c0      	adds	r0, r0, r3
 8001f24:	4243      	negs	r3, r0
 8001f26:	4158      	adcs	r0, r3
 8001f28:	1c0c      	adds	r4, r1, #0
 8001f2a:	f7ff f9e1 	bl	80012f0 <assert_param>
 8001f2e:	2000      	movs	r0, #0
 8001f30:	4284      	cmp	r4, r0
 8001f32:	d004      	beq.n	8001f3e <ADC_ClearFlag+0x22>
 8001f34:	239f      	movs	r3, #159	; 0x9f
 8001f36:	1c20      	adds	r0, r4, #0
 8001f38:	4398      	bics	r0, r3
 8001f3a:	4243      	negs	r3, r0
 8001f3c:	4158      	adcs	r0, r3
 8001f3e:	f7ff f9d7 	bl	80012f0 <assert_param>
 8001f42:	602c      	str	r4, [r5, #0]
 8001f44:	bd38      	pop	{r3, r4, r5, pc}
 8001f46:	46c0      	nop			; (mov r8, r8)
 8001f48:	bffedc00 	.word	0xbffedc00

08001f4c <NVIC_Init>:
 8001f4c:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
 8001f4e:	2500      	movs	r5, #0
 8001f50:	7883      	ldrb	r3, [r0, #2]
 8001f52:	1c04      	adds	r4, r0, #0
 8001f54:	2601      	movs	r6, #1
 8001f56:	1c28      	adds	r0, r5, #0
 8001f58:	429e      	cmp	r6, r3
 8001f5a:	4168      	adcs	r0, r5
 8001f5c:	f7ff f9c8 	bl	80012f0 <assert_param>
 8001f60:	7863      	ldrb	r3, [r4, #1]
 8001f62:	2703      	movs	r7, #3
 8001f64:	1c28      	adds	r0, r5, #0
 8001f66:	429f      	cmp	r7, r3
 8001f68:	4168      	adcs	r0, r5
 8001f6a:	f7ff f9c1 	bl	80012f0 <assert_param>
 8001f6e:	78a2      	ldrb	r2, [r4, #2]
 8001f70:	7823      	ldrb	r3, [r4, #0]
 8001f72:	42aa      	cmp	r2, r5
 8001f74:	d01a      	beq.n	8001fac <NVIC_Init+0x60>
 8001f76:	0899      	lsrs	r1, r3, #2
 8001f78:	4a0f      	ldr	r2, [pc, #60]	; (8001fb8 <NVIC_Init+0x6c>)
 8001f7a:	0089      	lsls	r1, r1, #2
 8001f7c:	1889      	adds	r1, r1, r2
 8001f7e:	22c0      	movs	r2, #192	; 0xc0
 8001f80:	0092      	lsls	r2, r2, #2
 8001f82:	401f      	ands	r7, r3
 8001f84:	20ff      	movs	r0, #255	; 0xff
 8001f86:	588d      	ldr	r5, [r1, r2]
 8001f88:	00ff      	lsls	r7, r7, #3
 8001f8a:	1c03      	adds	r3, r0, #0
 8001f8c:	40bb      	lsls	r3, r7
 8001f8e:	439d      	bics	r5, r3
 8001f90:	7863      	ldrb	r3, [r4, #1]
 8001f92:	019b      	lsls	r3, r3, #6
 8001f94:	4018      	ands	r0, r3
 8001f96:	40b8      	lsls	r0, r7
 8001f98:	1c2f      	adds	r7, r5, #0
 8001f9a:	4307      	orrs	r7, r0
 8001f9c:	508f      	str	r7, [r1, r2]
 8001f9e:	7822      	ldrb	r2, [r4, #0]
 8001fa0:	231f      	movs	r3, #31
 8001fa2:	4013      	ands	r3, r2
 8001fa4:	409e      	lsls	r6, r3
 8001fa6:	4b04      	ldr	r3, [pc, #16]	; (8001fb8 <NVIC_Init+0x6c>)
 8001fa8:	601e      	str	r6, [r3, #0]
 8001faa:	e004      	b.n	8001fb6 <NVIC_Init+0x6a>
 8001fac:	271f      	movs	r7, #31
 8001fae:	403b      	ands	r3, r7
 8001fb0:	4a02      	ldr	r2, [pc, #8]	; (8001fbc <NVIC_Init+0x70>)
 8001fb2:	409e      	lsls	r6, r3
 8001fb4:	67d6      	str	r6, [r2, #124]	; 0x7c
 8001fb6:	bdf8      	pop	{r3, r4, r5, r6, r7, pc}
 8001fb8:	e000e100 	.word	0xe000e100
 8001fbc:	e000e104 	.word	0xe000e104

08001fc0 <RCC_HSI14Cmd>:
 8001fc0:	b538      	push	{r3, r4, r5, lr}
 8001fc2:	1c05      	adds	r5, r0, #0
 8001fc4:	2401      	movs	r4, #1
 8001fc6:	2000      	movs	r0, #0
 8001fc8:	42ac      	cmp	r4, r5
 8001fca:	4140      	adcs	r0, r0
 8001fcc:	f7ff f990 	bl	80012f0 <assert_param>
 8001fd0:	4b04      	ldr	r3, [pc, #16]	; (8001fe4 <RCC_HSI14Cmd+0x24>)
 8001fd2:	6b5a      	ldr	r2, [r3, #52]	; 0x34
 8001fd4:	2d00      	cmp	r5, #0
 8001fd6:	d002      	beq.n	8001fde <RCC_HSI14Cmd+0x1e>
 8001fd8:	4314      	orrs	r4, r2
 8001fda:	635c      	str	r4, [r3, #52]	; 0x34
 8001fdc:	e001      	b.n	8001fe2 <RCC_HSI14Cmd+0x22>
 8001fde:	43a2      	bics	r2, r4
 8001fe0:	635a      	str	r2, [r3, #52]	; 0x34
 8001fe2:	bd38      	pop	{r3, r4, r5, pc}
 8001fe4:	40021000 	.word	0x40021000

08001fe8 <RCC_ADCCLKConfig>:
 8001fe8:	4b0e      	ldr	r3, [pc, #56]	; (8002024 <RCC_ADCCLKConfig+0x3c>)
 8001fea:	b510      	push	{r4, lr}
 8001fec:	1c04      	adds	r4, r0, #0
 8001fee:	2001      	movs	r0, #1
 8001ff0:	421c      	tst	r4, r3
 8001ff2:	d003      	beq.n	8001ffc <RCC_ADCCLKConfig+0x14>
 8001ff4:	4b0c      	ldr	r3, [pc, #48]	; (8002028 <RCC_ADCCLKConfig+0x40>)
 8001ff6:	18e0      	adds	r0, r4, r3
 8001ff8:	4243      	negs	r3, r0
 8001ffa:	4158      	adcs	r0, r3
 8001ffc:	f7ff f978 	bl	80012f0 <assert_param>
 8002000:	4b0a      	ldr	r3, [pc, #40]	; (800202c <RCC_ADCCLKConfig+0x44>)
 8002002:	4a0b      	ldr	r2, [pc, #44]	; (8002030 <RCC_ADCCLKConfig+0x48>)
 8002004:	6859      	ldr	r1, [r3, #4]
 8002006:	400a      	ands	r2, r1
 8002008:	605a      	str	r2, [r3, #4]
 800200a:	685a      	ldr	r2, [r3, #4]
 800200c:	b2a1      	uxth	r1, r4
 800200e:	430a      	orrs	r2, r1
 8002010:	605a      	str	r2, [r3, #4]
 8002012:	6b19      	ldr	r1, [r3, #48]	; 0x30
 8002014:	4a07      	ldr	r2, [pc, #28]	; (8002034 <RCC_ADCCLKConfig+0x4c>)
 8002016:	0c24      	lsrs	r4, r4, #16
 8002018:	400a      	ands	r2, r1
 800201a:	631a      	str	r2, [r3, #48]	; 0x30
 800201c:	6b1a      	ldr	r2, [r3, #48]	; 0x30
 800201e:	4314      	orrs	r4, r2
 8002020:	631c      	str	r4, [r3, #48]	; 0x30
 8002022:	bd10      	pop	{r4, pc}
 8002024:	feffffff 	.word	0xfeffffff
 8002028:	feffc000 	.word	0xfeffc000
 800202c:	40021000 	.word	0x40021000
 8002030:	ffffbfff 	.word	0xffffbfff
 8002034:	fffffeff 	.word	0xfffffeff

08002038 <RCC_GetClocksFreq>:
 8002038:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
 800203a:	4d5a      	ldr	r5, [pc, #360]	; (80021a4 <RCC_GetClocksFreq+0x16c>)
 800203c:	1c04      	adds	r4, r0, #0
 800203e:	6868      	ldr	r0, [r5, #4]
 8002040:	230c      	movs	r3, #12
 8002042:	4018      	ands	r0, r3
 8002044:	f000 fa14 	bl	8002470 <__gnu_thumb1_case_uqi>
 8002048:	1f1f1f1f 	.word	0x1f1f1f1f
 800204c:	1f1f1f1f 	.word	0x1f1f1f1f
 8002050:	1f1f1f07 	.word	0x1f1f1f07
 8002054:	1d          	.byte	0x1d
 8002055:	00          	.byte	0x00
 8002056:	686e      	ldr	r6, [r5, #4]
 8002058:	23c0      	movs	r3, #192	; 0xc0
 800205a:	02b6      	lsls	r6, r6, #10
 800205c:	686a      	ldr	r2, [r5, #4]
 800205e:	0f36      	lsrs	r6, r6, #28
 8002060:	025b      	lsls	r3, r3, #9
 8002062:	3602      	adds	r6, #2
 8002064:	421a      	tst	r2, r3
 8002066:	d101      	bne.n	800206c <RCC_GetClocksFreq+0x34>
 8002068:	484f      	ldr	r0, [pc, #316]	; (80021a8 <RCC_GetClocksFreq+0x170>)
 800206a:	e007      	b.n	800207c <RCC_GetClocksFreq+0x44>
 800206c:	4b4d      	ldr	r3, [pc, #308]	; (80021a4 <RCC_GetClocksFreq+0x16c>)
 800206e:	484f      	ldr	r0, [pc, #316]	; (80021ac <RCC_GetClocksFreq+0x174>)
 8002070:	6ad9      	ldr	r1, [r3, #44]	; 0x2c
 8002072:	230f      	movs	r3, #15
 8002074:	4019      	ands	r1, r3
 8002076:	3101      	adds	r1, #1
 8002078:	f000 fa04 	bl	8002484 <__aeabi_uidiv>
 800207c:	4370      	muls	r0, r6
 800207e:	6020      	str	r0, [r4, #0]
 8002080:	e004      	b.n	800208c <RCC_GetClocksFreq+0x54>
 8002082:	4b4b      	ldr	r3, [pc, #300]	; (80021b0 <RCC_GetClocksFreq+0x178>)
 8002084:	e000      	b.n	8002088 <RCC_GetClocksFreq+0x50>
 8002086:	4b49      	ldr	r3, [pc, #292]	; (80021ac <RCC_GetClocksFreq+0x174>)
 8002088:	6023      	str	r3, [r4, #0]
 800208a:	2000      	movs	r0, #0
 800208c:	686b      	ldr	r3, [r5, #4]
 800208e:	4a49      	ldr	r2, [pc, #292]	; (80021b4 <RCC_GetClocksFreq+0x17c>)
 8002090:	061b      	lsls	r3, r3, #24
 8002092:	0f1b      	lsrs	r3, r3, #28
 8002094:	6821      	ldr	r1, [r4, #0]
 8002096:	5cd3      	ldrb	r3, [r2, r3]
 8002098:	1c0e      	adds	r6, r1, #0
 800209a:	40de      	lsrs	r6, r3
 800209c:	6066      	str	r6, [r4, #4]
 800209e:	1c33      	adds	r3, r6, #0
 80020a0:	686e      	ldr	r6, [r5, #4]
 80020a2:	0576      	lsls	r6, r6, #21
 80020a4:	0f76      	lsrs	r6, r6, #29
 80020a6:	5d92      	ldrb	r2, [r2, r6]
 80020a8:	40d3      	lsrs	r3, r2
 80020aa:	60a3      	str	r3, [r4, #8]
 80020ac:	6b2a      	ldr	r2, [r5, #48]	; 0x30
 80020ae:	05d6      	lsls	r6, r2, #23
 80020b0:	d401      	bmi.n	80020b6 <RCC_GetClocksFreq+0x7e>
 80020b2:	4a41      	ldr	r2, [pc, #260]	; (80021b8 <RCC_GetClocksFreq+0x180>)
 80020b4:	e006      	b.n	80020c4 <RCC_GetClocksFreq+0x8c>
 80020b6:	4a3b      	ldr	r2, [pc, #236]	; (80021a4 <RCC_GetClocksFreq+0x16c>)
 80020b8:	6852      	ldr	r2, [r2, #4]
 80020ba:	0456      	lsls	r6, r2, #17
 80020bc:	d401      	bmi.n	80020c2 <RCC_GetClocksFreq+0x8a>
 80020be:	085a      	lsrs	r2, r3, #1
 80020c0:	e000      	b.n	80020c4 <RCC_GetClocksFreq+0x8c>
 80020c2:	089a      	lsrs	r2, r3, #2
 80020c4:	60e2      	str	r2, [r4, #12]
 80020c6:	6b2a      	ldr	r2, [r5, #48]	; 0x30
 80020c8:	0656      	lsls	r6, r2, #25
 80020ca:	d401      	bmi.n	80020d0 <RCC_GetClocksFreq+0x98>
 80020cc:	4a3b      	ldr	r2, [pc, #236]	; (80021bc <RCC_GetClocksFreq+0x184>)
 80020ce:	e001      	b.n	80020d4 <RCC_GetClocksFreq+0x9c>
 80020d0:	2280      	movs	r2, #128	; 0x80
 80020d2:	0212      	lsls	r2, r2, #8
 80020d4:	6122      	str	r2, [r4, #16]
 80020d6:	6b2a      	ldr	r2, [r5, #48]	; 0x30
 80020d8:	06d6      	lsls	r6, r2, #27
 80020da:	d402      	bmi.n	80020e2 <RCC_GetClocksFreq+0xaa>
 80020dc:	4a33      	ldr	r2, [pc, #204]	; (80021ac <RCC_GetClocksFreq+0x174>)
 80020de:	6162      	str	r2, [r4, #20]
 80020e0:	e000      	b.n	80020e4 <RCC_GetClocksFreq+0xac>
 80020e2:	6161      	str	r1, [r4, #20]
 80020e4:	6b2f      	ldr	r7, [r5, #48]	; 0x30
 80020e6:	2203      	movs	r2, #3
 80020e8:	4e2e      	ldr	r6, [pc, #184]	; (80021a4 <RCC_GetClocksFreq+0x16c>)
 80020ea:	4217      	tst	r7, r2
 80020ec:	d101      	bne.n	80020f2 <RCC_GetClocksFreq+0xba>
 80020ee:	61a3      	str	r3, [r4, #24]
 80020f0:	e012      	b.n	8002118 <RCC_GetClocksFreq+0xe0>
 80020f2:	6b37      	ldr	r7, [r6, #48]	; 0x30
 80020f4:	4017      	ands	r7, r2
 80020f6:	2f01      	cmp	r7, #1
 80020f8:	d101      	bne.n	80020fe <RCC_GetClocksFreq+0xc6>
 80020fa:	61a1      	str	r1, [r4, #24]
 80020fc:	e00c      	b.n	8002118 <RCC_GetClocksFreq+0xe0>
 80020fe:	6b37      	ldr	r7, [r6, #48]	; 0x30
 8002100:	4017      	ands	r7, r2
 8002102:	2f02      	cmp	r7, #2
 8002104:	d102      	bne.n	800210c <RCC_GetClocksFreq+0xd4>
 8002106:	2280      	movs	r2, #128	; 0x80
 8002108:	0212      	lsls	r2, r2, #8
 800210a:	e004      	b.n	8002116 <RCC_GetClocksFreq+0xde>
 800210c:	6b36      	ldr	r6, [r6, #48]	; 0x30
 800210e:	4032      	ands	r2, r6
 8002110:	2a03      	cmp	r2, #3
 8002112:	d101      	bne.n	8002118 <RCC_GetClocksFreq+0xe0>
 8002114:	4a25      	ldr	r2, [pc, #148]	; (80021ac <RCC_GetClocksFreq+0x174>)
 8002116:	61a2      	str	r2, [r4, #24]
 8002118:	22c0      	movs	r2, #192	; 0xc0
 800211a:	6b2f      	ldr	r7, [r5, #48]	; 0x30
 800211c:	0292      	lsls	r2, r2, #10
 800211e:	4e21      	ldr	r6, [pc, #132]	; (80021a4 <RCC_GetClocksFreq+0x16c>)
 8002120:	4217      	tst	r7, r2
 8002122:	d101      	bne.n	8002128 <RCC_GetClocksFreq+0xf0>
 8002124:	61e3      	str	r3, [r4, #28]
 8002126:	e018      	b.n	800215a <RCC_GetClocksFreq+0x122>
 8002128:	6b37      	ldr	r7, [r6, #48]	; 0x30
 800212a:	4017      	ands	r7, r2
 800212c:	46bc      	mov	ip, r7
 800212e:	2780      	movs	r7, #128	; 0x80
 8002130:	027f      	lsls	r7, r7, #9
 8002132:	45bc      	cmp	ip, r7
 8002134:	d101      	bne.n	800213a <RCC_GetClocksFreq+0x102>
 8002136:	61e1      	str	r1, [r4, #28]
 8002138:	e00f      	b.n	800215a <RCC_GetClocksFreq+0x122>
 800213a:	6b37      	ldr	r7, [r6, #48]	; 0x30
 800213c:	4017      	ands	r7, r2
 800213e:	46bc      	mov	ip, r7
 8002140:	2780      	movs	r7, #128	; 0x80
 8002142:	02bf      	lsls	r7, r7, #10
 8002144:	45bc      	cmp	ip, r7
 8002146:	d102      	bne.n	800214e <RCC_GetClocksFreq+0x116>
 8002148:	2280      	movs	r2, #128	; 0x80
 800214a:	0212      	lsls	r2, r2, #8
 800214c:	e004      	b.n	8002158 <RCC_GetClocksFreq+0x120>
 800214e:	6b36      	ldr	r6, [r6, #48]	; 0x30
 8002150:	4016      	ands	r6, r2
 8002152:	4296      	cmp	r6, r2
 8002154:	d101      	bne.n	800215a <RCC_GetClocksFreq+0x122>
 8002156:	4a15      	ldr	r2, [pc, #84]	; (80021ac <RCC_GetClocksFreq+0x174>)
 8002158:	61e2      	str	r2, [r4, #28]
 800215a:	22c0      	movs	r2, #192	; 0xc0
 800215c:	6b2f      	ldr	r7, [r5, #48]	; 0x30
 800215e:	0312      	lsls	r2, r2, #12
 8002160:	4e10      	ldr	r6, [pc, #64]	; (80021a4 <RCC_GetClocksFreq+0x16c>)
 8002162:	4217      	tst	r7, r2
 8002164:	d015      	beq.n	8002192 <RCC_GetClocksFreq+0x15a>
 8002166:	6b37      	ldr	r7, [r6, #48]	; 0x30
 8002168:	2380      	movs	r3, #128	; 0x80
 800216a:	4017      	ands	r7, r2
 800216c:	02db      	lsls	r3, r3, #11
 800216e:	429f      	cmp	r7, r3
 8002170:	d101      	bne.n	8002176 <RCC_GetClocksFreq+0x13e>
 8002172:	6221      	str	r1, [r4, #32]
 8002174:	e00e      	b.n	8002194 <RCC_GetClocksFreq+0x15c>
 8002176:	6b31      	ldr	r1, [r6, #48]	; 0x30
 8002178:	2380      	movs	r3, #128	; 0x80
 800217a:	4011      	ands	r1, r2
 800217c:	031b      	lsls	r3, r3, #12
 800217e:	4299      	cmp	r1, r3
 8002180:	d102      	bne.n	8002188 <RCC_GetClocksFreq+0x150>
 8002182:	2380      	movs	r3, #128	; 0x80
 8002184:	021b      	lsls	r3, r3, #8
 8002186:	e004      	b.n	8002192 <RCC_GetClocksFreq+0x15a>
 8002188:	6b33      	ldr	r3, [r6, #48]	; 0x30
 800218a:	4013      	ands	r3, r2
 800218c:	4293      	cmp	r3, r2
 800218e:	d101      	bne.n	8002194 <RCC_GetClocksFreq+0x15c>
 8002190:	4b06      	ldr	r3, [pc, #24]	; (80021ac <RCC_GetClocksFreq+0x174>)
 8002192:	6223      	str	r3, [r4, #32]
 8002194:	6b2b      	ldr	r3, [r5, #48]	; 0x30
 8002196:	061a      	lsls	r2, r3, #24
 8002198:	d402      	bmi.n	80021a0 <RCC_GetClocksFreq+0x168>
 800219a:	4b05      	ldr	r3, [pc, #20]	; (80021b0 <RCC_GetClocksFreq+0x178>)
 800219c:	6263      	str	r3, [r4, #36]	; 0x24
 800219e:	e000      	b.n	80021a2 <RCC_GetClocksFreq+0x16a>
 80021a0:	6260      	str	r0, [r4, #36]	; 0x24
 80021a2:	bdf8      	pop	{r3, r4, r5, r6, r7, pc}
 80021a4:	40021000 	.word	0x40021000
 80021a8:	003d0900 	.word	0x003d0900
 80021ac:	007a1200 	.word	0x007a1200
 80021b0:	02dc6c00 	.word	0x02dc6c00
 80021b4:	20000000 	.word	0x20000000
 80021b8:	00d59f80 	.word	0x00d59f80
 80021bc:	00008012 	.word	0x00008012

080021c0 <RCC_AHBPeriphClockCmd>:
 80021c0:	b538      	push	{r3, r4, r5, lr}
 80021c2:	4b0d      	ldr	r3, [pc, #52]	; (80021f8 <RCC_AHBPeriphClockCmd+0x38>)
 80021c4:	1c04      	adds	r4, r0, #0
 80021c6:	1c0d      	adds	r5, r1, #0
 80021c8:	2000      	movs	r0, #0
 80021ca:	421c      	tst	r4, r3
 80021cc:	d102      	bne.n	80021d4 <RCC_AHBPeriphClockCmd+0x14>
 80021ce:	1c20      	adds	r0, r4, #0
 80021d0:	1e43      	subs	r3, r0, #1
 80021d2:	4198      	sbcs	r0, r3
 80021d4:	f7ff f88c 	bl	80012f0 <assert_param>
 80021d8:	2301      	movs	r3, #1
 80021da:	2000      	movs	r0, #0
 80021dc:	42ab      	cmp	r3, r5
 80021de:	4140      	adcs	r0, r0
 80021e0:	f7ff f886 	bl	80012f0 <assert_param>
 80021e4:	4b05      	ldr	r3, [pc, #20]	; (80021fc <RCC_AHBPeriphClockCmd+0x3c>)
 80021e6:	695a      	ldr	r2, [r3, #20]
 80021e8:	2d00      	cmp	r5, #0
 80021ea:	d002      	beq.n	80021f2 <RCC_AHBPeriphClockCmd+0x32>
 80021ec:	4314      	orrs	r4, r2
 80021ee:	615c      	str	r4, [r3, #20]
 80021f0:	e001      	b.n	80021f6 <RCC_AHBPeriphClockCmd+0x36>
 80021f2:	43a2      	bics	r2, r4
 80021f4:	615a      	str	r2, [r3, #20]
 80021f6:	bd38      	pop	{r3, r4, r5, pc}
 80021f8:	fe81ffa8 	.word	0xfe81ffa8
 80021fc:	40021000 	.word	0x40021000

08002200 <RCC_APB2PeriphClockCmd>:
 8002200:	b538      	push	{r3, r4, r5, lr}
 8002202:	4b0d      	ldr	r3, [pc, #52]	; (8002238 <RCC_APB2PeriphClockCmd+0x38>)
 8002204:	1c04      	adds	r4, r0, #0
 8002206:	1c0d      	adds	r5, r1, #0
 8002208:	2000      	movs	r0, #0
 800220a:	421c      	tst	r4, r3
 800220c:	d102      	bne.n	8002214 <RCC_APB2PeriphClockCmd+0x14>
 800220e:	1c20      	adds	r0, r4, #0
 8002210:	1e43      	subs	r3, r0, #1
 8002212:	4198      	sbcs	r0, r3
 8002214:	f7ff f86c 	bl	80012f0 <assert_param>
 8002218:	2301      	movs	r3, #1
 800221a:	2000      	movs	r0, #0
 800221c:	42ab      	cmp	r3, r5
 800221e:	4140      	adcs	r0, r0
 8002220:	f7ff f866 	bl	80012f0 <assert_param>
 8002224:	4b05      	ldr	r3, [pc, #20]	; (800223c <RCC_APB2PeriphClockCmd+0x3c>)
 8002226:	699a      	ldr	r2, [r3, #24]
 8002228:	2d00      	cmp	r5, #0
 800222a:	d002      	beq.n	8002232 <RCC_APB2PeriphClockCmd+0x32>
 800222c:	4314      	orrs	r4, r2
 800222e:	619c      	str	r4, [r3, #24]
 8002230:	e001      	b.n	8002236 <RCC_APB2PeriphClockCmd+0x36>
 8002232:	43a2      	bics	r2, r4
 8002234:	619a      	str	r2, [r3, #24]
 8002236:	bd38      	pop	{r3, r4, r5, pc}
 8002238:	ffb8a51e 	.word	0xffb8a51e
 800223c:	40021000 	.word	0x40021000

08002240 <RCC_APB1PeriphClockCmd>:
 8002240:	b538      	push	{r3, r4, r5, lr}
 8002242:	4b0d      	ldr	r3, [pc, #52]	; (8002278 <RCC_APB1PeriphClockCmd+0x38>)
 8002244:	1c04      	adds	r4, r0, #0
 8002246:	1c0d      	adds	r5, r1, #0
 8002248:	2000      	movs	r0, #0
 800224a:	421c      	tst	r4, r3
 800224c:	d102      	bne.n	8002254 <RCC_APB1PeriphClockCmd+0x14>
 800224e:	1c20      	adds	r0, r4, #0
 8002250:	1e43      	subs	r3, r0, #1
 8002252:	4198      	sbcs	r0, r3
 8002254:	f7ff f84c 	bl	80012f0 <assert_param>
 8002258:	2301      	movs	r3, #1
 800225a:	2000      	movs	r0, #0
 800225c:	42ab      	cmp	r3, r5
 800225e:	4140      	adcs	r0, r0
 8002260:	f7ff f846 	bl	80012f0 <assert_param>
 8002264:	4b05      	ldr	r3, [pc, #20]	; (800227c <RCC_APB1PeriphClockCmd+0x3c>)
 8002266:	69da      	ldr	r2, [r3, #28]
 8002268:	2d00      	cmp	r5, #0
 800226a:	d002      	beq.n	8002272 <RCC_APB1PeriphClockCmd+0x32>
 800226c:	4314      	orrs	r4, r2
 800226e:	61dc      	str	r4, [r3, #28]
 8002270:	e001      	b.n	8002276 <RCC_APB1PeriphClockCmd+0x36>
 8002272:	43a2      	bics	r2, r4
 8002274:	61da      	str	r2, [r3, #28]
 8002276:	bd38      	pop	{r3, r4, r5, pc}
 8002278:	8581b6cc 	.word	0x8581b6cc
 800227c:	40021000 	.word	0x40021000

08002280 <RCC_APB2PeriphResetCmd>:
 8002280:	b538      	push	{r3, r4, r5, lr}
 8002282:	4b0d      	ldr	r3, [pc, #52]	; (80022b8 <RCC_APB2PeriphResetCmd+0x38>)
 8002284:	1c04      	adds	r4, r0, #0
 8002286:	1c0d      	adds	r5, r1, #0
 8002288:	2000      	movs	r0, #0
 800228a:	421c      	tst	r4, r3
 800228c:	d102      	bne.n	8002294 <RCC_APB2PeriphResetCmd+0x14>
 800228e:	1c20      	adds	r0, r4, #0
 8002290:	1e43      	subs	r3, r0, #1
 8002292:	4198      	sbcs	r0, r3
 8002294:	f7ff f82c 	bl	80012f0 <assert_param>
 8002298:	2301      	movs	r3, #1
 800229a:	2000      	movs	r0, #0
 800229c:	42ab      	cmp	r3, r5
 800229e:	4140      	adcs	r0, r0
 80022a0:	f7ff f826 	bl	80012f0 <assert_param>
 80022a4:	4b05      	ldr	r3, [pc, #20]	; (80022bc <RCC_APB2PeriphResetCmd+0x3c>)
 80022a6:	68da      	ldr	r2, [r3, #12]
 80022a8:	2d00      	cmp	r5, #0
 80022aa:	d002      	beq.n	80022b2 <RCC_APB2PeriphResetCmd+0x32>
 80022ac:	4314      	orrs	r4, r2
 80022ae:	60dc      	str	r4, [r3, #12]
 80022b0:	e001      	b.n	80022b6 <RCC_APB2PeriphResetCmd+0x36>
 80022b2:	43a2      	bics	r2, r4
 80022b4:	60da      	str	r2, [r3, #12]
 80022b6:	bd38      	pop	{r3, r4, r5, pc}
 80022b8:	ffb8a51e 	.word	0xffb8a51e
 80022bc:	40021000 	.word	0x40021000

080022c0 <RCC_GetFlagStatus>:
 80022c0:	2310      	movs	r3, #16
 80022c2:	b510      	push	{r4, lr}
 80022c4:	1c04      	adds	r4, r0, #0
 80022c6:	4398      	bics	r0, r3
 80022c8:	2801      	cmp	r0, #1
 80022ca:	d015      	beq.n	80022f8 <RCC_GetFlagStatus+0x38>
 80022cc:	2c19      	cmp	r4, #25
 80022ce:	d012      	beq.n	80022f6 <RCC_GetFlagStatus+0x36>
 80022d0:	2340      	movs	r3, #64	; 0x40
 80022d2:	1c22      	adds	r2, r4, #0
 80022d4:	439a      	bics	r2, r3
 80022d6:	2a21      	cmp	r2, #33	; 0x21
 80022d8:	d00d      	beq.n	80022f6 <RCC_GetFlagStatus+0x36>
 80022da:	2c41      	cmp	r4, #65	; 0x41
 80022dc:	d00b      	beq.n	80022f6 <RCC_GetFlagStatus+0x36>
 80022de:	1c23      	adds	r3, r4, #0
 80022e0:	3b59      	subs	r3, #89	; 0x59
 80022e2:	b2db      	uxtb	r3, r3
 80022e4:	2b06      	cmp	r3, #6
 80022e6:	d906      	bls.n	80022f6 <RCC_GetFlagStatus+0x36>
 80022e8:	2c71      	cmp	r4, #113	; 0x71
 80022ea:	d004      	beq.n	80022f6 <RCC_GetFlagStatus+0x36>
 80022ec:	1c20      	adds	r0, r4, #0
 80022ee:	3857      	subs	r0, #87	; 0x57
 80022f0:	4243      	negs	r3, r0
 80022f2:	4158      	adcs	r0, r3
 80022f4:	e000      	b.n	80022f8 <RCC_GetFlagStatus+0x38>
 80022f6:	2001      	movs	r0, #1
 80022f8:	f7fe fffa 	bl	80012f0 <assert_param>
 80022fc:	0962      	lsrs	r2, r4, #5
 80022fe:	4b0a      	ldr	r3, [pc, #40]	; (8002328 <RCC_GetFlagStatus+0x68>)
 8002300:	d101      	bne.n	8002306 <RCC_GetFlagStatus+0x46>
 8002302:	681b      	ldr	r3, [r3, #0]
 8002304:	e008      	b.n	8002318 <RCC_GetFlagStatus+0x58>
 8002306:	2a01      	cmp	r2, #1
 8002308:	d101      	bne.n	800230e <RCC_GetFlagStatus+0x4e>
 800230a:	6a1b      	ldr	r3, [r3, #32]
 800230c:	e004      	b.n	8002318 <RCC_GetFlagStatus+0x58>
 800230e:	2a02      	cmp	r2, #2
 8002310:	d101      	bne.n	8002316 <RCC_GetFlagStatus+0x56>
 8002312:	6a5b      	ldr	r3, [r3, #36]	; 0x24
 8002314:	e000      	b.n	8002318 <RCC_GetFlagStatus+0x58>
 8002316:	6b5b      	ldr	r3, [r3, #52]	; 0x34
 8002318:	201f      	movs	r0, #31
 800231a:	4004      	ands	r4, r0
 800231c:	1c18      	adds	r0, r3, #0
 800231e:	40e0      	lsrs	r0, r4
 8002320:	2201      	movs	r2, #1
 8002322:	4010      	ands	r0, r2
 8002324:	bd10      	pop	{r4, pc}
 8002326:	46c0      	nop			; (mov r8, r8)
 8002328:	40021000 	.word	0x40021000

0800232c <gpio_init>:
 800232c:	b5f7      	push	{r0, r1, r2, r4, r5, r6, r7, lr}
 800232e:	2080      	movs	r0, #128	; 0x80
 8002330:	0280      	lsls	r0, r0, #10
 8002332:	2101      	movs	r1, #1
 8002334:	f7ff ff44 	bl	80021c0 <RCC_AHBPeriphClockCmd>
 8002338:	2080      	movs	r0, #128	; 0x80
 800233a:	02c0      	lsls	r0, r0, #11
 800233c:	2101      	movs	r1, #1
 800233e:	f7ff ff3f 	bl	80021c0 <RCC_AHBPeriphClockCmd>
 8002342:	2208      	movs	r2, #8
 8002344:	2400      	movs	r4, #0
 8002346:	466b      	mov	r3, sp
 8002348:	2603      	movs	r6, #3
 800234a:	9200      	str	r2, [sp, #0]
 800234c:	4669      	mov	r1, sp
 800234e:	2201      	movs	r2, #1
 8002350:	481c      	ldr	r0, [pc, #112]	; (80023c4 <gpio_init+0x98>)
 8002352:	715e      	strb	r6, [r3, #5]
 8002354:	711a      	strb	r2, [r3, #4]
 8002356:	719c      	strb	r4, [r3, #6]
 8002358:	71dc      	strb	r4, [r3, #7]
 800235a:	2590      	movs	r5, #144	; 0x90
 800235c:	f7ff f950 	bl	8001600 <GPIO_Init>
 8002360:	2380      	movs	r3, #128	; 0x80
 8002362:	05ed      	lsls	r5, r5, #23
 8002364:	005b      	lsls	r3, r3, #1
 8002366:	466a      	mov	r2, sp
 8002368:	1c28      	adds	r0, r5, #0
 800236a:	9300      	str	r3, [sp, #0]
 800236c:	4669      	mov	r1, sp
 800236e:	2301      	movs	r3, #1
 8002370:	2780      	movs	r7, #128	; 0x80
 8002372:	7156      	strb	r6, [r2, #5]
 8002374:	013f      	lsls	r7, r7, #4
 8002376:	7113      	strb	r3, [r2, #4]
 8002378:	7194      	strb	r4, [r2, #6]
 800237a:	71d4      	strb	r4, [r2, #7]
 800237c:	f7ff f940 	bl	8001600 <GPIO_Init>
 8002380:	466a      	mov	r2, sp
 8002382:	1c28      	adds	r0, r5, #0
 8002384:	2301      	movs	r3, #1
 8002386:	4669      	mov	r1, sp
 8002388:	7156      	strb	r6, [r2, #5]
 800238a:	9700      	str	r7, [sp, #0]
 800238c:	7113      	strb	r3, [r2, #4]
 800238e:	7194      	strb	r4, [r2, #6]
 8002390:	71d4      	strb	r4, [r2, #7]
 8002392:	f7ff f935 	bl	8001600 <GPIO_Init>
 8002396:	2202      	movs	r2, #2
 8002398:	466b      	mov	r3, sp
 800239a:	9200      	str	r2, [sp, #0]
 800239c:	1c28      	adds	r0, r5, #0
 800239e:	2201      	movs	r2, #1
 80023a0:	4669      	mov	r1, sp
 80023a2:	715e      	strb	r6, [r3, #5]
 80023a4:	711a      	strb	r2, [r3, #4]
 80023a6:	719c      	strb	r4, [r3, #6]
 80023a8:	71dc      	strb	r4, [r3, #7]
 80023aa:	f7ff f929 	bl	8001600 <GPIO_Init>
 80023ae:	4b05      	ldr	r3, [pc, #20]	; (80023c4 <gpio_init+0x98>)
 80023b0:	2208      	movs	r2, #8
 80023b2:	851a      	strh	r2, [r3, #40]	; 0x28
 80023b4:	2380      	movs	r3, #128	; 0x80
 80023b6:	005b      	lsls	r3, r3, #1
 80023b8:	2202      	movs	r2, #2
 80023ba:	852b      	strh	r3, [r5, #40]	; 0x28
 80023bc:	852f      	strh	r7, [r5, #40]	; 0x28
 80023be:	852a      	strh	r2, [r5, #40]	; 0x28
 80023c0:	bdf7      	pop	{r0, r1, r2, r4, r5, r6, r7, pc}
 80023c2:	46c0      	nop			; (mov r8, r8)
 80023c4:	48000400 	.word	0x48000400

080023c8 <led_on>:
 80023c8:	2808      	cmp	r0, #8
 80023ca:	d101      	bne.n	80023d0 <led_on+0x8>
 80023cc:	4b07      	ldr	r3, [pc, #28]	; (80023ec <led_on+0x24>)
 80023ce:	e00b      	b.n	80023e8 <led_on+0x20>
 80023d0:	2380      	movs	r3, #128	; 0x80
 80023d2:	005b      	lsls	r3, r3, #1
 80023d4:	4298      	cmp	r0, r3
 80023d6:	d005      	beq.n	80023e4 <led_on+0x1c>
 80023d8:	2380      	movs	r3, #128	; 0x80
 80023da:	011b      	lsls	r3, r3, #4
 80023dc:	4298      	cmp	r0, r3
 80023de:	d001      	beq.n	80023e4 <led_on+0x1c>
 80023e0:	2802      	cmp	r0, #2
 80023e2:	d102      	bne.n	80023ea <led_on+0x22>
 80023e4:	2390      	movs	r3, #144	; 0x90
 80023e6:	05db      	lsls	r3, r3, #23
 80023e8:	6198      	str	r0, [r3, #24]
 80023ea:	4770      	bx	lr
 80023ec:	48000400 	.word	0x48000400

080023f0 <led_off>:
 80023f0:	2808      	cmp	r0, #8
 80023f2:	d101      	bne.n	80023f8 <led_off+0x8>
 80023f4:	4b07      	ldr	r3, [pc, #28]	; (8002414 <led_off+0x24>)
 80023f6:	e00b      	b.n	8002410 <led_off+0x20>
 80023f8:	2380      	movs	r3, #128	; 0x80
 80023fa:	005b      	lsls	r3, r3, #1
 80023fc:	4298      	cmp	r0, r3
 80023fe:	d005      	beq.n	800240c <led_off+0x1c>
 8002400:	2380      	movs	r3, #128	; 0x80
 8002402:	011b      	lsls	r3, r3, #4
 8002404:	4298      	cmp	r0, r3
 8002406:	d001      	beq.n	800240c <led_off+0x1c>
 8002408:	2802      	cmp	r0, #2
 800240a:	d102      	bne.n	8002412 <led_off+0x22>
 800240c:	2390      	movs	r3, #144	; 0x90
 800240e:	05db      	lsls	r3, r3, #23
 8002410:	8518      	strh	r0, [r3, #40]	; 0x28
 8002412:	4770      	bx	lr
 8002414:	48000400 	.word	0x48000400

08002418 <Default_Handler>:
 8002418:	4770      	bx	lr
	...

0800241c <HardFault_Handler>:
 800241c:	2008      	movs	r0, #8
 800241e:	f7ff ffd3 	bl	80023c8 <led_on>
 8002422:	4b07      	ldr	r3, [pc, #28]	; (8002440 <HardFault_Handler+0x24>)
 8002424:	3b01      	subs	r3, #1
 8002426:	2b00      	cmp	r3, #0
 8002428:	d001      	beq.n	800242e <HardFault_Handler+0x12>
 800242a:	46c0      	nop			; (mov r8, r8)
 800242c:	e7fa      	b.n	8002424 <HardFault_Handler+0x8>
 800242e:	2008      	movs	r0, #8
 8002430:	f7ff ffde 	bl	80023f0 <led_off>
 8002434:	4b02      	ldr	r3, [pc, #8]	; (8002440 <HardFault_Handler+0x24>)
 8002436:	3b01      	subs	r3, #1
 8002438:	2b00      	cmp	r3, #0
 800243a:	d0ef      	beq.n	800241c <HardFault_Handler>
 800243c:	46c0      	nop			; (mov r8, r8)
 800243e:	e7fa      	b.n	8002436 <HardFault_Handler+0x1a>
 8002440:	002dc6c1 	.word	0x002dc6c1

08002444 <_reset_init>:
 8002444:	4a07      	ldr	r2, [pc, #28]	; (8002464 <_reset_init+0x20>)
 8002446:	4908      	ldr	r1, [pc, #32]	; (8002468 <_reset_init+0x24>)
 8002448:	2300      	movs	r3, #0
 800244a:	1a89      	subs	r1, r1, r2
 800244c:	1089      	asrs	r1, r1, #2
 800244e:	1c10      	adds	r0, r2, #0
 8002450:	428b      	cmp	r3, r1
 8002452:	d005      	beq.n	8002460 <_reset_init+0x1c>
 8002454:	4c05      	ldr	r4, [pc, #20]	; (800246c <_reset_init+0x28>)
 8002456:	009a      	lsls	r2, r3, #2
 8002458:	58a4      	ldr	r4, [r4, r2]
 800245a:	3301      	adds	r3, #1
 800245c:	5084      	str	r4, [r0, r2]
 800245e:	e7f7      	b.n	8002450 <_reset_init+0xc>
 8002460:	f7fe fccc 	bl	8000dfc <main>
 8002464:	20000000 	.word	0x20000000
 8002468:	20000010 	.word	0x20000010
 800246c:	08002cb0 	.word	0x08002cb0

08002470 <__gnu_thumb1_case_uqi>:
 8002470:	b402      	push	{r1}
 8002472:	4671      	mov	r1, lr
 8002474:	0849      	lsrs	r1, r1, #1
 8002476:	0049      	lsls	r1, r1, #1
 8002478:	5c09      	ldrb	r1, [r1, r0]
 800247a:	0049      	lsls	r1, r1, #1
 800247c:	448e      	add	lr, r1
 800247e:	bc02      	pop	{r1}
 8002480:	4770      	bx	lr
 8002482:	46c0      	nop			; (mov r8, r8)

08002484 <__aeabi_uidiv>:
 8002484:	2900      	cmp	r1, #0
 8002486:	d034      	beq.n	80024f2 <.udivsi3_skip_div0_test+0x6a>

08002488 <.udivsi3_skip_div0_test>:
 8002488:	2301      	movs	r3, #1
 800248a:	2200      	movs	r2, #0
 800248c:	b410      	push	{r4}
 800248e:	4288      	cmp	r0, r1
 8002490:	d32c      	bcc.n	80024ec <.udivsi3_skip_div0_test+0x64>
 8002492:	2401      	movs	r4, #1
 8002494:	0724      	lsls	r4, r4, #28
 8002496:	42a1      	cmp	r1, r4
 8002498:	d204      	bcs.n	80024a4 <.udivsi3_skip_div0_test+0x1c>
 800249a:	4281      	cmp	r1, r0
 800249c:	d202      	bcs.n	80024a4 <.udivsi3_skip_div0_test+0x1c>
 800249e:	0109      	lsls	r1, r1, #4
 80024a0:	011b      	lsls	r3, r3, #4
 80024a2:	e7f8      	b.n	8002496 <.udivsi3_skip_div0_test+0xe>
 80024a4:	00e4      	lsls	r4, r4, #3
 80024a6:	42a1      	cmp	r1, r4
 80024a8:	d204      	bcs.n	80024b4 <.udivsi3_skip_div0_test+0x2c>
 80024aa:	4281      	cmp	r1, r0
 80024ac:	d202      	bcs.n	80024b4 <.udivsi3_skip_div0_test+0x2c>
 80024ae:	0049      	lsls	r1, r1, #1
 80024b0:	005b      	lsls	r3, r3, #1
 80024b2:	e7f8      	b.n	80024a6 <.udivsi3_skip_div0_test+0x1e>
 80024b4:	4288      	cmp	r0, r1
 80024b6:	d301      	bcc.n	80024bc <.udivsi3_skip_div0_test+0x34>
 80024b8:	1a40      	subs	r0, r0, r1
 80024ba:	431a      	orrs	r2, r3
 80024bc:	084c      	lsrs	r4, r1, #1
 80024be:	42a0      	cmp	r0, r4
 80024c0:	d302      	bcc.n	80024c8 <.udivsi3_skip_div0_test+0x40>
 80024c2:	1b00      	subs	r0, r0, r4
 80024c4:	085c      	lsrs	r4, r3, #1
 80024c6:	4322      	orrs	r2, r4
 80024c8:	088c      	lsrs	r4, r1, #2
 80024ca:	42a0      	cmp	r0, r4
 80024cc:	d302      	bcc.n	80024d4 <.udivsi3_skip_div0_test+0x4c>
 80024ce:	1b00      	subs	r0, r0, r4
 80024d0:	089c      	lsrs	r4, r3, #2
 80024d2:	4322      	orrs	r2, r4
 80024d4:	08cc      	lsrs	r4, r1, #3
 80024d6:	42a0      	cmp	r0, r4
 80024d8:	d302      	bcc.n	80024e0 <.udivsi3_skip_div0_test+0x58>
 80024da:	1b00      	subs	r0, r0, r4
 80024dc:	08dc      	lsrs	r4, r3, #3
 80024de:	4322      	orrs	r2, r4
 80024e0:	2800      	cmp	r0, #0
 80024e2:	d003      	beq.n	80024ec <.udivsi3_skip_div0_test+0x64>
 80024e4:	091b      	lsrs	r3, r3, #4
 80024e6:	d001      	beq.n	80024ec <.udivsi3_skip_div0_test+0x64>
 80024e8:	0909      	lsrs	r1, r1, #4
 80024ea:	e7e3      	b.n	80024b4 <.udivsi3_skip_div0_test+0x2c>
 80024ec:	1c10      	adds	r0, r2, #0
 80024ee:	bc10      	pop	{r4}
 80024f0:	4770      	bx	lr
 80024f2:	2800      	cmp	r0, #0
 80024f4:	d001      	beq.n	80024fa <.udivsi3_skip_div0_test+0x72>
 80024f6:	2000      	movs	r0, #0
 80024f8:	43c0      	mvns	r0, r0
 80024fa:	b407      	push	{r0, r1, r2}
 80024fc:	4802      	ldr	r0, [pc, #8]	; (8002508 <.udivsi3_skip_div0_test+0x80>)
 80024fe:	a102      	add	r1, pc, #8	; (adr r1, 8002508 <.udivsi3_skip_div0_test+0x80>)
 8002500:	1840      	adds	r0, r0, r1
 8002502:	9002      	str	r0, [sp, #8]
 8002504:	bd03      	pop	{r0, r1, pc}
 8002506:	46c0      	nop			; (mov r8, r8)
 8002508:	000000d9 	.word	0x000000d9

0800250c <__aeabi_uidivmod>:
 800250c:	2900      	cmp	r1, #0
 800250e:	d0f0      	beq.n	80024f2 <.udivsi3_skip_div0_test+0x6a>
 8002510:	b503      	push	{r0, r1, lr}
 8002512:	f7ff ffb9 	bl	8002488 <.udivsi3_skip_div0_test>
 8002516:	bc0e      	pop	{r1, r2, r3}
 8002518:	4342      	muls	r2, r0
 800251a:	1a89      	subs	r1, r1, r2
 800251c:	4718      	bx	r3
 800251e:	46c0      	nop			; (mov r8, r8)

08002520 <__aeabi_idiv>:
 8002520:	2900      	cmp	r1, #0
 8002522:	d041      	beq.n	80025a8 <.divsi3_skip_div0_test+0x84>

08002524 <.divsi3_skip_div0_test>:
 8002524:	b410      	push	{r4}
 8002526:	1c04      	adds	r4, r0, #0
 8002528:	404c      	eors	r4, r1
 800252a:	46a4      	mov	ip, r4
 800252c:	2301      	movs	r3, #1
 800252e:	2200      	movs	r2, #0
 8002530:	2900      	cmp	r1, #0
 8002532:	d500      	bpl.n	8002536 <.divsi3_skip_div0_test+0x12>
 8002534:	4249      	negs	r1, r1
 8002536:	2800      	cmp	r0, #0
 8002538:	d500      	bpl.n	800253c <.divsi3_skip_div0_test+0x18>
 800253a:	4240      	negs	r0, r0
 800253c:	4288      	cmp	r0, r1
 800253e:	d32c      	bcc.n	800259a <.divsi3_skip_div0_test+0x76>
 8002540:	2401      	movs	r4, #1
 8002542:	0724      	lsls	r4, r4, #28
 8002544:	42a1      	cmp	r1, r4
 8002546:	d204      	bcs.n	8002552 <.divsi3_skip_div0_test+0x2e>
 8002548:	4281      	cmp	r1, r0
 800254a:	d202      	bcs.n	8002552 <.divsi3_skip_div0_test+0x2e>
 800254c:	0109      	lsls	r1, r1, #4
 800254e:	011b      	lsls	r3, r3, #4
 8002550:	e7f8      	b.n	8002544 <.divsi3_skip_div0_test+0x20>
 8002552:	00e4      	lsls	r4, r4, #3
 8002554:	42a1      	cmp	r1, r4
 8002556:	d204      	bcs.n	8002562 <.divsi3_skip_div0_test+0x3e>
 8002558:	4281      	cmp	r1, r0
 800255a:	d202      	bcs.n	8002562 <.divsi3_skip_div0_test+0x3e>
 800255c:	0049      	lsls	r1, r1, #1
 800255e:	005b      	lsls	r3, r3, #1
 8002560:	e7f8      	b.n	8002554 <.divsi3_skip_div0_test+0x30>
 8002562:	4288      	cmp	r0, r1
 8002564:	d301      	bcc.n	800256a <.divsi3_skip_div0_test+0x46>
 8002566:	1a40      	subs	r0, r0, r1
 8002568:	431a      	orrs	r2, r3
 800256a:	084c      	lsrs	r4, r1, #1
 800256c:	42a0      	cmp	r0, r4
 800256e:	d302      	bcc.n	8002576 <.divsi3_skip_div0_test+0x52>
 8002570:	1b00      	subs	r0, r0, r4
 8002572:	085c      	lsrs	r4, r3, #1
 8002574:	4322      	orrs	r2, r4
 8002576:	088c      	lsrs	r4, r1, #2
 8002578:	42a0      	cmp	r0, r4
 800257a:	d302      	bcc.n	8002582 <.divsi3_skip_div0_test+0x5e>
 800257c:	1b00      	subs	r0, r0, r4
 800257e:	089c      	lsrs	r4, r3, #2
 8002580:	4322      	orrs	r2, r4
 8002582:	08cc      	lsrs	r4, r1, #3
 8002584:	42a0      	cmp	r0, r4
 8002586:	d302      	bcc.n	800258e <.divsi3_skip_div0_test+0x6a>
 8002588:	1b00      	subs	r0, r0, r4
 800258a:	08dc      	lsrs	r4, r3, #3
 800258c:	4322      	orrs	r2, r4
 800258e:	2800      	cmp	r0, #0
 8002590:	d003      	beq.n	800259a <.divsi3_skip_div0_test+0x76>
 8002592:	091b      	lsrs	r3, r3, #4
 8002594:	d001      	beq.n	800259a <.divsi3_skip_div0_test+0x76>
 8002596:	0909      	lsrs	r1, r1, #4
 8002598:	e7e3      	b.n	8002562 <.divsi3_skip_div0_test+0x3e>
 800259a:	1c10      	adds	r0, r2, #0
 800259c:	4664      	mov	r4, ip
 800259e:	2c00      	cmp	r4, #0
 80025a0:	d500      	bpl.n	80025a4 <.divsi3_skip_div0_test+0x80>
 80025a2:	4240      	negs	r0, r0
 80025a4:	bc10      	pop	{r4}
 80025a6:	4770      	bx	lr
 80025a8:	2800      	cmp	r0, #0
 80025aa:	d006      	beq.n	80025ba <.divsi3_skip_div0_test+0x96>
 80025ac:	db03      	blt.n	80025b6 <.divsi3_skip_div0_test+0x92>
 80025ae:	2000      	movs	r0, #0
 80025b0:	43c0      	mvns	r0, r0
 80025b2:	0840      	lsrs	r0, r0, #1
 80025b4:	e001      	b.n	80025ba <.divsi3_skip_div0_test+0x96>
 80025b6:	2080      	movs	r0, #128	; 0x80
 80025b8:	0600      	lsls	r0, r0, #24
 80025ba:	b407      	push	{r0, r1, r2}
 80025bc:	4802      	ldr	r0, [pc, #8]	; (80025c8 <.divsi3_skip_div0_test+0xa4>)
 80025be:	a102      	add	r1, pc, #8	; (adr r1, 80025c8 <.divsi3_skip_div0_test+0xa4>)
 80025c0:	1840      	adds	r0, r0, r1
 80025c2:	9002      	str	r0, [sp, #8]
 80025c4:	bd03      	pop	{r0, r1, pc}
 80025c6:	46c0      	nop			; (mov r8, r8)
 80025c8:	00000019 	.word	0x00000019

080025cc <__aeabi_idivmod>:
 80025cc:	2900      	cmp	r1, #0
 80025ce:	d0eb      	beq.n	80025a8 <.divsi3_skip_div0_test+0x84>
 80025d0:	b503      	push	{r0, r1, lr}
 80025d2:	f7ff ffa7 	bl	8002524 <.divsi3_skip_div0_test>
 80025d6:	bc0e      	pop	{r1, r2, r3}
 80025d8:	4342      	muls	r2, r0
 80025da:	1a89      	subs	r1, r1, r2
 80025dc:	4718      	bx	r3
 80025de:	46c0      	nop			; (mov r8, r8)

080025e0 <__aeabi_idiv0>:
 80025e0:	4770      	bx	lr
 80025e2:	46c0      	nop			; (mov r8, r8)

080025e4 <_init>:
 80025e4:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
 80025e6:	46c0      	nop			; (mov r8, r8)
 80025e8:	bcf8      	pop	{r3, r4, r5, r6, r7}
 80025ea:	bc08      	pop	{r3}
 80025ec:	469e      	mov	lr, r3
 80025ee:	4770      	bx	lr

080025f0 <_fini>:
 80025f0:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
 80025f2:	46c0      	nop			; (mov r8, r8)
 80025f4:	bcf8      	pop	{r3, r4, r5, r6, r7}
 80025f6:	bc08      	pop	{r3}
 80025f8:	469e      	mov	lr, r3
 80025fa:	4770      	bx	lr
 80025fc:	69647473 	.word	0x69647473
 8002600:	6e69206f 	.word	0x6e69206f
 8002604:	64207469 	.word	0x64207469
 8002608:	0a656e6f 	.word	0x0a656e6f
	...

0800260d <font_data>:
	...
 800261d:	3c180000 18183c3c 18180018 00000000     ...<<<..........
 800262d:	63636300 00000022 00000000 00000000     .ccc"...........
 800263d:	36000000 36367f36 36367f36 00000000     ...66.666.66....
 800264d:	633e0c0c 033e6061 3e634303 00000c0c     ..>ca`>..Cc>....
 800265d:	00000000 06636100 6333180c 00000000     .....ac...3c....
 800266d:	1c000000 3b1c3636 3b66666e 00000000     ....66.;nff;....
 800267d:	30303000 00000060 00000000 00000000     .000`...........
 800268d:	180c0000 30303018 0c181830 00000000     .....0000.......
 800269d:	0c180000 0606060c 180c0c06 00000000     ................
 80026ad:	00000000 ff3c6642 0042663c 00000000     ....Bf<.<fB.....
 80026bd:	00000000 ff181818 00181818 00000000     ................
	...
 80026d5:	18180000 00003018 00000000 ff000000     .....0..........
	...
 80026f5:	18180000 00000000 03010000 381c0e07     ...............8
 8002705:	80c0e070 00000000 633e0000 6b6b6363     p.........>ccckk
 8002715:	3e636363 00000000 1c0c0000 0c0c0c3c     ccc>........<...
 8002725:	3f0c0c0c 00000000 633e0000 180c0603     ...?......>c....
 8002735:	7f636130 00000000 633e0000 031e0303     0ac.......>c....
 8002745:	3e630303 00000000 0e060000 6666361e     ..c>.........6ff
 8002755:	0f06067f 00000000 607f0000 037e6060     ...........```~.
 8002765:	3e736303 00000000 301c0000 637e6060     .cs>.......0``~c
 8002775:	3e636363 00000000 637f0000 0c060603     ccc>.......c....
 8002785:	1818180c 00000000 633e0000 633e6363     ..........>ccc>c
 8002795:	3e636363 00000000 633e0000 3f636363     ccc>......>cccc?
 80027a5:	3c060303 00000000 00000000 00181800     ...<............
 80027b5:	18180000 00000000 00000000 00181800     ................
 80027c5:	18180000 00003018 06000000 6030180c     .....0........0`
 80027d5:	060c1830 00000000 00000000 007e0000     0.............~.
 80027e5:	00007e00 00000000 60000000 060c1830     .~.........`0...
 80027f5:	6030180c 00000000 633e0000 0c0c0663     ..0`......>cc...
 8002805:	0c0c000c 00000000 633e0000 6b6b6f63     ..........>ccokk
 8002815:	3e60606e 00000000 1c080000 63636336     n``>........6ccc
 8002825:	6363637f 00000000 337e0000 333e3333     .ccc......~333>3
 8002835:	7e333333 00000000 331e0000 60606061     333~.......3a```
 8002845:	1e336160 00000000 367c0000 33333333     `a3.......|63333
 8002855:	7c363333 00000000 337f0000 343c3431     336|.......314<4
 8002865:	7f333130 00000000 337f0000 343c3431     013........314<4
 8002875:	78303030 00000000 331e0000 6f606061     000x.......3a``o
 8002885:	1d376363 00000000 63630000 637f6363     cc7.......cccc.c
 8002895:	63636363 00000000 183c0000 18181818     cccc......<.....
 80028a5:	3c181818 00000000 060f0000 06060606     ...<............
 80028b5:	3c666606 00000000 33730000 363c3636     .ff<......s366<6
 80028c5:	73333336 00000000 30780000 30303030     633s......x00000
 80028d5:	7f333130 00000000 77630000 63636b7f     013.......cw.kcc
 80028e5:	63636363 00000000 63630000 6f7f7b73     cccc......ccs{.o
 80028f5:	63636367 00000000 361c0000 63636363     gccc.......6cccc
 8002905:	1c366363 00000000 337e0000 303e3333     cc6.......~333>0
 8002915:	78303030 00000000 633e0000 63636363     000x......>ccccc
 8002925:	3e6f6b63 00000706 337e0000 363e3333     cko>......~333>6
 8002935:	73333336 00000000 633e0000 061c3063     633s......>cc0..
 8002945:	3e636303 00000000 dbff0000 18181899     .cc>............
 8002955:	3c181818 00000000 63630000 63636363     ...<......cccccc
 8002965:	3e636363 00000000 63630000 63636363     ccc>......cccccc
 8002975:	081c3663 00000000 63630000 6b636363     c6........ccccck
 8002985:	36367f6b 00000000 c3c30000 18183c66     k.66........f<..
 8002995:	c3c3663c 00000000 c3c30000 183c66c3     <f...........f<.
 80029a5:	3c181818 00000000 637f0000 180c0643     ...<.......cC...
 80029b5:	7f636130 00000000 303c0000 30303030     0ac.......<00000
 80029c5:	3c303030 00000000 c0800000 1c3870e0     000<.........p8.
 80029d5:	0103070e 00000000 0c3c0000 0c0c0c0c     ..........<.....
 80029e5:	3c0c0c0c 00000000 63361c08 00000000     ...<......6c....
	...
 8002a09:	000000ff 000c1818 00000000 00000000     ................
	...
 8002a21:	06463c00 3b66663e 00000000 30700000     .<F.>ff;......p0
 8002a31:	33363c30 6e333333 00000000 00000000     0<63333n........
 8002a41:	60633e00 3e636060 00000000 060e0000     .>c```c>........
 8002a51:	66361e06 3b666666 00000000 00000000     ..6ffff;........
 8002a61:	63633e00 3e63607e 00000000 361c0000     .>cc~`c>.......6
 8002a71:	307c3032 78303030 00000000 00000000     20|0000x........
 8002a81:	66663b00 063e6666 00003c66 30700000     .;ffff>.f<....p0
 8002a91:	333b3630 73333333 00000000 0c0c0000     06;3333s........
 8002aa1:	0c0c1c00 1e0c0c0c 00000000 06060000     ................
 8002ab1:	06060e00 66060606 00003c66 30700000     .......ff<....p0
 8002ac1:	36333330 7333363c 00000000 0c1c0000     0336<63s........
 8002ad1:	0c0c0c0c 1e0c0c0c 00000000 00000000     ................
 8002ae1:	6b7f6e00 6b6b6b6b 00000000 00000000     .n.kkkkk........
 8002af1:	33336e00 33333333 00000000 00000000     .n333333........
 8002b01:	63633e00 3e636363 00000000 00000000     .>ccccc>........
 8002b11:	33336e00 303e3333 00007830 00000000     .n3333>00x......
 8002b21:	66663b00 063e6666 00000f06 00000000     .;ffff>.........
 8002b31:	333b6e00 78303030 00000000 00000000     .n;3000x........
 8002b41:	38633e00 3e63030e 00000000 18080000     .>c8..c>........
 8002b51:	18187e18 0e1b1818 00000000 00000000     .~..............
 8002b61:	66666600 3b666666 00000000 00000000     .ffffff;........
 8002b71:	36636300 081c1c36 00000000 00000000     .cc66...........
 8002b81:	63636300 367f6b6b 00000000 00000000     .ccckk.6........
 8002b91:	1c366300 63361c1c 00000000 00000000     .c6...6c........
 8002ba1:	63636300 033f6363 00003c06 00000000     .ccccc?..<......
 8002bb1:	0c667f00 7f633018 00000000 180e0000     ..f..0c.........
 8002bc1:	18701818 0e181818 00000000 18180000     ..p.............
 8002bd1:	00181818 18181818 00000018 18700000     ..............p.
 8002be1:	180e1818 70181818 00000000 6e3b0000     .......p......;n
	...
 8002bfd:	d8d87000 00000070 00000000 00000000     .p..p...........
 8002c0d:	6c65770a 656d6f63 206f7420 757a7553     .welcome to Suzu
 8002c1d:	534f6168 5e5f5e20 322e3220 420a302e     haOS ^_^ 2.2.0.B
 8002c2d:	444c4955 72614d20 20353220 36313032     UILD Mar 25 2016
 8002c3d:	3a313220 303a3231 25000a34 203a2075      21:12:04..%u : 
 8002c4d:	255b000a 69252069 5d692520 6f620020     ..[%i %i %i] .bo
 8002c5d:	6e69746f 72662067 25206d6f 72000a75     oting from %u..r
 8002c6d:	73206d61 74726174 20752520 6172000a     am start %u ..ra
 8002c7d:	6973206d 2520657a 000a2075 206d6172     m size %u ..ram 
 8002c8d:	65657266 20752520 6568000a 73207061     free %u ..heap s
 8002c9d:	74726174 20752520 0a0a000a 00000000              tart %u .......

08002cac <__EH_FRAME_BEGIN__>:
 8002cac:	00000000                                ....
