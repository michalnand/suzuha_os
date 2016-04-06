
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
 80000e6:	f000 fce1 	bl	8000aac <sleep>
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
 80001d2:	f000 fc5f 	bl	8000a94 <sys_tick_init>
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
 8000342:	f000 fa57 	bl	80007f4 <uart_write>
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
 8000398:	f001 fe20 	bl	8001fdc <__aeabi_idivmod>
 800039c:	3130      	adds	r1, #48	; 0x30
 800039e:	5571      	strb	r1, [r6, r5]
 80003a0:	1c20      	adds	r0, r4, #0
 80003a2:	210a      	movs	r1, #10
 80003a4:	f001 fdc4 	bl	8001f30 <__aeabi_idiv>
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
 80003d6:	f001 fda1 	bl	8001f1c <__aeabi_uidivmod>
 80003da:	3130      	adds	r1, #48	; 0x30
 80003dc:	5531      	strb	r1, [r6, r4]
 80003de:	1c28      	adds	r0, r5, #0
 80003e0:	210a      	movs	r1, #10
 80003e2:	f001 fd57 	bl	8001e94 <__aeabi_uidiv>
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
 8000518:	0800200c 	.word	0x0800200c

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

08000588 <adc_thread>:
 8000588:	b538      	push	{r3, r4, r5, lr}
 800058a:	2033      	movs	r0, #51	; 0x33
 800058c:	f000 fa44 	bl	8000a18 <adc_init>
 8000590:	f000 faec 	bl	8000b6c <pwm_init>
 8000594:	2400      	movs	r4, #0
 8000596:	2000      	movs	r0, #0
 8000598:	f000 f91a 	bl	80007d0 <event_timer_wait>
 800059c:	2001      	movs	r0, #1
 800059e:	f000 f9f5 	bl	800098c <adc_config_ch>
 80005a2:	f000 f9fb 	bl	800099c <adc_read>
 80005a6:	4d0e      	ldr	r5, [pc, #56]	; (80005e0 <adc_thread+0x58>)
 80005a8:	6028      	str	r0, [r5, #0]
 80005aa:	2002      	movs	r0, #2
 80005ac:	f000 f9ee 	bl	800098c <adc_config_ch>
 80005b0:	f000 f9f4 	bl	800099c <adc_read>
 80005b4:	6068      	str	r0, [r5, #4]
 80005b6:	2010      	movs	r0, #16
 80005b8:	f000 f9e8 	bl	800098c <adc_config_ch>
 80005bc:	f000 f9ee 	bl	800099c <adc_read>
 80005c0:	60a8      	str	r0, [r5, #8]
 80005c2:	2020      	movs	r0, #32
 80005c4:	f000 f9e2 	bl	800098c <adc_config_ch>
 80005c8:	f000 f9e8 	bl	800099c <adc_read>
 80005cc:	60e8      	str	r0, [r5, #12]
 80005ce:	2c00      	cmp	r4, #0
 80005d0:	d101      	bne.n	80005d6 <adc_thread+0x4e>
 80005d2:	2464      	movs	r4, #100	; 0x64
 80005d4:	e000      	b.n	80005d8 <adc_thread+0x50>
 80005d6:	2400      	movs	r4, #0
 80005d8:	1c20      	adds	r0, r4, #0
 80005da:	f000 fb0d 	bl	8000bf8 <pwm_set>
 80005de:	e7da      	b.n	8000596 <adc_thread+0xe>
 80005e0:	2000038c 	.word	0x2000038c

080005e4 <main_thread>:
 80005e4:	b510      	push	{r4, lr}
 80005e6:	4812      	ldr	r0, [pc, #72]	; (8000630 <main_thread+0x4c>)
 80005e8:	f7ff ff1e 	bl	8000428 <printf_>
 80005ec:	2000      	movs	r0, #0
 80005ee:	210a      	movs	r1, #10
 80005f0:	f000 f8dc 	bl	80007ac <event_timer_set_period>
 80005f4:	2280      	movs	r2, #128	; 0x80
 80005f6:	480f      	ldr	r0, [pc, #60]	; (8000634 <main_thread+0x50>)
 80005f8:	490f      	ldr	r1, [pc, #60]	; (8000638 <main_thread+0x54>)
 80005fa:	0052      	lsls	r2, r2, #1
 80005fc:	2308      	movs	r3, #8
 80005fe:	f7ff fded 	bl	80001dc <create_thread>
 8000602:	2000      	movs	r0, #0
 8000604:	f000 f8e4 	bl	80007d0 <event_timer_wait>
 8000608:	2008      	movs	r0, #8
 800060a:	f001 fbe5 	bl	8001dd8 <led_on>
 800060e:	2400      	movs	r4, #0
 8000610:	4b0a      	ldr	r3, [pc, #40]	; (800063c <main_thread+0x58>)
 8000612:	480b      	ldr	r0, [pc, #44]	; (8000640 <main_thread+0x5c>)
 8000614:	5919      	ldr	r1, [r3, r4]
 8000616:	3404      	adds	r4, #4
 8000618:	f7ff ff06 	bl	8000428 <printf_>
 800061c:	2c10      	cmp	r4, #16
 800061e:	d1f7      	bne.n	8000610 <main_thread+0x2c>
 8000620:	4808      	ldr	r0, [pc, #32]	; (8000644 <main_thread+0x60>)
 8000622:	f7ff ff01 	bl	8000428 <printf_>
 8000626:	2008      	movs	r0, #8
 8000628:	f001 fbea 	bl	8001e00 <led_off>
 800062c:	e7e9      	b.n	8000602 <main_thread+0x1e>
 800062e:	46c0      	nop			; (mov r8, r8)
 8000630:	0800201d 	.word	0x0800201d
 8000634:	08000589 	.word	0x08000589
 8000638:	2000018c 	.word	0x2000018c
 800063c:	2000038c 	.word	0x2000038c
 8000640:	0800202a 	.word	0x0800202a
 8000644:	0800207b 	.word	0x0800207b

08000648 <mem_info_print>:
 8000648:	b538      	push	{r3, r4, r5, lr}
 800064a:	480e      	ldr	r0, [pc, #56]	; (8000684 <mem_info_print+0x3c>)
 800064c:	490e      	ldr	r1, [pc, #56]	; (8000688 <mem_info_print+0x40>)
 800064e:	f7ff feeb 	bl	8000428 <printf_>
 8000652:	4c0e      	ldr	r4, [pc, #56]	; (800068c <mem_info_print+0x44>)
 8000654:	480e      	ldr	r0, [pc, #56]	; (8000690 <mem_info_print+0x48>)
 8000656:	1c21      	adds	r1, r4, #0
 8000658:	f7ff fee6 	bl	8000428 <printf_>
 800065c:	4d0d      	ldr	r5, [pc, #52]	; (8000694 <mem_info_print+0x4c>)
 800065e:	480e      	ldr	r0, [pc, #56]	; (8000698 <mem_info_print+0x50>)
 8000660:	1b2d      	subs	r5, r5, r4
 8000662:	1c29      	adds	r1, r5, #0
 8000664:	f7ff fee0 	bl	8000428 <printf_>
 8000668:	490c      	ldr	r1, [pc, #48]	; (800069c <mem_info_print+0x54>)
 800066a:	480d      	ldr	r0, [pc, #52]	; (80006a0 <mem_info_print+0x58>)
 800066c:	1a64      	subs	r4, r4, r1
 800066e:	1929      	adds	r1, r5, r4
 8000670:	f7ff feda 	bl	8000428 <printf_>
 8000674:	490b      	ldr	r1, [pc, #44]	; (80006a4 <mem_info_print+0x5c>)
 8000676:	480c      	ldr	r0, [pc, #48]	; (80006a8 <mem_info_print+0x60>)
 8000678:	f7ff fed6 	bl	8000428 <printf_>
 800067c:	480b      	ldr	r0, [pc, #44]	; (80006ac <mem_info_print+0x64>)
 800067e:	f7ff fed3 	bl	8000428 <printf_>
 8000682:	bd38      	pop	{r3, r4, r5, pc}
 8000684:	0800202e 	.word	0x0800202e
 8000688:	08001ff4 	.word	0x08001ff4
 800068c:	20000000 	.word	0x20000000
 8000690:	0800203f 	.word	0x0800203f
 8000694:	20001000 	.word	0x20001000
 8000698:	0800204e 	.word	0x0800204e
 800069c:	200003ec 	.word	0x200003ec
 80006a0:	0800205c 	.word	0x0800205c
 80006a4:	200003ec 	.word	0x200003ec
 80006a8:	0800206a 	.word	0x0800206a
 80006ac:	0800207a 	.word	0x0800207a

080006b0 <main>:
 80006b0:	b508      	push	{r3, lr}
 80006b2:	f000 faa7 	bl	8000c04 <lib_low_level_init>
 80006b6:	f7ff ff31 	bl	800051c <lib_os_init>
 80006ba:	f7ff ffc5 	bl	8000648 <mem_info_print>
 80006be:	2280      	movs	r2, #128	; 0x80
 80006c0:	4904      	ldr	r1, [pc, #16]	; (80006d4 <main+0x24>)
 80006c2:	0052      	lsls	r2, r2, #1
 80006c4:	2308      	movs	r3, #8
 80006c6:	4804      	ldr	r0, [pc, #16]	; (80006d8 <main+0x28>)
 80006c8:	f7ff fd88 	bl	80001dc <create_thread>
 80006cc:	f7ff fd80 	bl	80001d0 <kernel_start>
 80006d0:	2000      	movs	r0, #0
 80006d2:	bd08      	pop	{r3, pc}
 80006d4:	2000028c 	.word	0x2000028c
 80006d8:	080005e5 	.word	0x080005e5

080006dc <timer_init>:
 80006dc:	b530      	push	{r4, r5, lr}
 80006de:	2300      	movs	r3, #0
 80006e0:	b085      	sub	sp, #20
 80006e2:	481b      	ldr	r0, [pc, #108]	; (8000750 <timer_init+0x74>)
 80006e4:	2180      	movs	r1, #128	; 0x80
 80006e6:	005a      	lsls	r2, r3, #1
 80006e8:	00c9      	lsls	r1, r1, #3
 80006ea:	5211      	strh	r1, [r2, r0]
 80006ec:	4819      	ldr	r0, [pc, #100]	; (8000754 <timer_init+0x78>)
 80006ee:	2400      	movs	r4, #0
 80006f0:	5211      	strh	r1, [r2, r0]
 80006f2:	4919      	ldr	r1, [pc, #100]	; (8000758 <timer_init+0x7c>)
 80006f4:	3301      	adds	r3, #1
 80006f6:	5254      	strh	r4, [r2, r1]
 80006f8:	2b04      	cmp	r3, #4
 80006fa:	d1f2      	bne.n	80006e2 <timer_init+0x6>
 80006fc:	4b17      	ldr	r3, [pc, #92]	; (800075c <timer_init+0x80>)
 80006fe:	2001      	movs	r0, #1
 8000700:	1c01      	adds	r1, r0, #0
 8000702:	601c      	str	r4, [r3, #0]
 8000704:	f001 fada 	bl	8001cbc <RCC_APB1PeriphClockCmd>
 8000708:	a901      	add	r1, sp, #4
 800070a:	2330      	movs	r3, #48	; 0x30
 800070c:	800b      	strh	r3, [r1, #0]
 800070e:	2080      	movs	r0, #128	; 0x80
 8000710:	23fa      	movs	r3, #250	; 0xfa
 8000712:	009b      	lsls	r3, r3, #2
 8000714:	05c0      	lsls	r0, r0, #23
 8000716:	604b      	str	r3, [r1, #4]
 8000718:	804c      	strh	r4, [r1, #2]
 800071a:	810c      	strh	r4, [r1, #8]
 800071c:	728c      	strb	r4, [r1, #10]
 800071e:	f000 fc2b 	bl	8000f78 <TIM_TimeBaseInit>
 8000722:	2080      	movs	r0, #128	; 0x80
 8000724:	05c0      	lsls	r0, r0, #23
 8000726:	2101      	movs	r1, #1
 8000728:	f000 fca8 	bl	800107c <TIM_Cmd>
 800072c:	2080      	movs	r0, #128	; 0x80
 800072e:	2102      	movs	r1, #2
 8000730:	05c0      	lsls	r0, r0, #23
 8000732:	2201      	movs	r2, #1
 8000734:	f000 fdb8 	bl	80012a8 <TIM_ITConfig>
 8000738:	466a      	mov	r2, sp
 800073a:	230f      	movs	r3, #15
 800073c:	7013      	strb	r3, [r2, #0]
 800073e:	4668      	mov	r0, sp
 8000740:	2301      	movs	r3, #1
 8000742:	7053      	strb	r3, [r2, #1]
 8000744:	7093      	strb	r3, [r2, #2]
 8000746:	f001 f953 	bl	80019f0 <NVIC_Init>
 800074a:	b005      	add	sp, #20
 800074c:	bd30      	pop	{r4, r5, pc}
 800074e:	46c0      	nop			; (mov r8, r8)
 8000750:	200003b0 	.word	0x200003b0
 8000754:	200003a4 	.word	0x200003a4
 8000758:	2000039c 	.word	0x2000039c
 800075c:	200003ac 	.word	0x200003ac

08000760 <TIM2_IRQHandler>:
 8000760:	2200      	movs	r2, #0
 8000762:	490e      	ldr	r1, [pc, #56]	; (800079c <TIM2_IRQHandler+0x3c>)
 8000764:	0053      	lsls	r3, r2, #1
 8000766:	5a58      	ldrh	r0, [r3, r1]
 8000768:	2800      	cmp	r0, #0
 800076a:	d003      	beq.n	8000774 <TIM2_IRQHandler+0x14>
 800076c:	5a58      	ldrh	r0, [r3, r1]
 800076e:	3801      	subs	r0, #1
 8000770:	b280      	uxth	r0, r0
 8000772:	e005      	b.n	8000780 <TIM2_IRQHandler+0x20>
 8000774:	480a      	ldr	r0, [pc, #40]	; (80007a0 <TIM2_IRQHandler+0x40>)
 8000776:	5a18      	ldrh	r0, [r3, r0]
 8000778:	b280      	uxth	r0, r0
 800077a:	5258      	strh	r0, [r3, r1]
 800077c:	4909      	ldr	r1, [pc, #36]	; (80007a4 <TIM2_IRQHandler+0x44>)
 800077e:	2001      	movs	r0, #1
 8000780:	3201      	adds	r2, #1
 8000782:	5258      	strh	r0, [r3, r1]
 8000784:	2a04      	cmp	r2, #4
 8000786:	d1ec      	bne.n	8000762 <TIM2_IRQHandler+0x2>
 8000788:	4b07      	ldr	r3, [pc, #28]	; (80007a8 <TIM2_IRQHandler+0x48>)
 800078a:	681a      	ldr	r2, [r3, #0]
 800078c:	3201      	adds	r2, #1
 800078e:	601a      	str	r2, [r3, #0]
 8000790:	2380      	movs	r3, #128	; 0x80
 8000792:	2200      	movs	r2, #0
 8000794:	05db      	lsls	r3, r3, #23
 8000796:	821a      	strh	r2, [r3, #16]
 8000798:	4770      	bx	lr
 800079a:	46c0      	nop			; (mov r8, r8)
 800079c:	200003b0 	.word	0x200003b0
 80007a0:	200003a4 	.word	0x200003a4
 80007a4:	2000039c 	.word	0x2000039c
 80007a8:	200003ac 	.word	0x200003ac

080007ac <event_timer_set_period>:
 80007ac:	b672      	cpsid	i
 80007ae:	4b05      	ldr	r3, [pc, #20]	; (80007c4 <event_timer_set_period+0x18>)
 80007b0:	0040      	lsls	r0, r0, #1
 80007b2:	52c1      	strh	r1, [r0, r3]
 80007b4:	4b04      	ldr	r3, [pc, #16]	; (80007c8 <event_timer_set_period+0x1c>)
 80007b6:	2200      	movs	r2, #0
 80007b8:	52c1      	strh	r1, [r0, r3]
 80007ba:	4b04      	ldr	r3, [pc, #16]	; (80007cc <event_timer_set_period+0x20>)
 80007bc:	52c2      	strh	r2, [r0, r3]
 80007be:	b662      	cpsie	i
 80007c0:	4770      	bx	lr
 80007c2:	46c0      	nop			; (mov r8, r8)
 80007c4:	200003b0 	.word	0x200003b0
 80007c8:	200003a4 	.word	0x200003a4
 80007cc:	2000039c 	.word	0x2000039c

080007d0 <event_timer_wait>:
 80007d0:	b510      	push	{r4, lr}
 80007d2:	1c04      	adds	r4, r0, #0
 80007d4:	4a06      	ldr	r2, [pc, #24]	; (80007f0 <event_timer_wait+0x20>)
 80007d6:	0063      	lsls	r3, r4, #1
 80007d8:	5a99      	ldrh	r1, [r3, r2]
 80007da:	2900      	cmp	r1, #0
 80007dc:	d102      	bne.n	80007e4 <event_timer_wait+0x14>
 80007de:	f000 f965 	bl	8000aac <sleep>
 80007e2:	e7f7      	b.n	80007d4 <event_timer_wait+0x4>
 80007e4:	b672      	cpsid	i
 80007e6:	2100      	movs	r1, #0
 80007e8:	52d1      	strh	r1, [r2, r3]
 80007ea:	b662      	cpsie	i
 80007ec:	bd10      	pop	{r4, pc}
 80007ee:	46c0      	nop			; (mov r8, r8)
 80007f0:	2000039c 	.word	0x2000039c

080007f4 <uart_write>:
 80007f4:	4b03      	ldr	r3, [pc, #12]	; (8000804 <uart_write+0x10>)
 80007f6:	69da      	ldr	r2, [r3, #28]
 80007f8:	0611      	lsls	r1, r2, #24
 80007fa:	d401      	bmi.n	8000800 <uart_write+0xc>
 80007fc:	46c0      	nop			; (mov r8, r8)
 80007fe:	e7f9      	b.n	80007f4 <uart_write>
 8000800:	8518      	strh	r0, [r3, #40]	; 0x28
 8000802:	4770      	bx	lr
 8000804:	40013800 	.word	0x40013800

08000808 <USART1_IRQHandler>:
 8000808:	b508      	push	{r3, lr}
 800080a:	480e      	ldr	r0, [pc, #56]	; (8000844 <USART1_IRQHandler+0x3c>)
 800080c:	490e      	ldr	r1, [pc, #56]	; (8000848 <USART1_IRQHandler+0x40>)
 800080e:	f000 fedd 	bl	80015cc <USART_GetITStatus>
 8000812:	2800      	cmp	r0, #0
 8000814:	d011      	beq.n	800083a <USART1_IRQHandler+0x32>
 8000816:	480b      	ldr	r0, [pc, #44]	; (8000844 <USART1_IRQHandler+0x3c>)
 8000818:	f000 fea4 	bl	8001564 <USART_ReceiveData>
 800081c:	4b0b      	ldr	r3, [pc, #44]	; (800084c <USART1_IRQHandler+0x44>)
 800081e:	490c      	ldr	r1, [pc, #48]	; (8000850 <USART1_IRQHandler+0x48>)
 8000820:	881a      	ldrh	r2, [r3, #0]
 8000822:	b2c0      	uxtb	r0, r0
 8000824:	b292      	uxth	r2, r2
 8000826:	5488      	strb	r0, [r1, r2]
 8000828:	881a      	ldrh	r2, [r3, #0]
 800082a:	3201      	adds	r2, #1
 800082c:	b292      	uxth	r2, r2
 800082e:	801a      	strh	r2, [r3, #0]
 8000830:	881a      	ldrh	r2, [r3, #0]
 8000832:	2a0f      	cmp	r2, #15
 8000834:	d901      	bls.n	800083a <USART1_IRQHandler+0x32>
 8000836:	2200      	movs	r2, #0
 8000838:	801a      	strh	r2, [r3, #0]
 800083a:	4802      	ldr	r0, [pc, #8]	; (8000844 <USART1_IRQHandler+0x3c>)
 800083c:	4902      	ldr	r1, [pc, #8]	; (8000848 <USART1_IRQHandler+0x40>)
 800083e:	f000 ff5d 	bl	80016fc <USART_ClearITPendingBit>
 8000842:	bd08      	pop	{r3, pc}
 8000844:	40013800 	.word	0x40013800
 8000848:	00050105 	.word	0x00050105
 800084c:	200003c8 	.word	0x200003c8
 8000850:	200003b8 	.word	0x200003b8

08000854 <uart_init>:
 8000854:	b530      	push	{r4, r5, lr}
 8000856:	4a21      	ldr	r2, [pc, #132]	; (80008dc <uart_init+0x88>)
 8000858:	2300      	movs	r3, #0
 800085a:	8013      	strh	r3, [r2, #0]
 800085c:	4a20      	ldr	r2, [pc, #128]	; (80008e0 <uart_init+0x8c>)
 800085e:	b089      	sub	sp, #36	; 0x24
 8000860:	8013      	strh	r3, [r2, #0]
 8000862:	4a20      	ldr	r2, [pc, #128]	; (80008e4 <uart_init+0x90>)
 8000864:	2400      	movs	r4, #0
 8000866:	54d4      	strb	r4, [r2, r3]
 8000868:	3301      	adds	r3, #1
 800086a:	2b10      	cmp	r3, #16
 800086c:	d1f9      	bne.n	8000862 <uart_init+0xe>
 800086e:	2080      	movs	r0, #128	; 0x80
 8000870:	0280      	lsls	r0, r0, #10
 8000872:	2101      	movs	r1, #1
 8000874:	f001 f9e2 	bl	8001c3c <RCC_AHBPeriphClockCmd>
 8000878:	2080      	movs	r0, #128	; 0x80
 800087a:	01c0      	lsls	r0, r0, #7
 800087c:	2101      	movs	r1, #1
 800087e:	f001 f9fd 	bl	8001c7c <RCC_APB2PeriphClockCmd>
 8000882:	2090      	movs	r0, #144	; 0x90
 8000884:	05c0      	lsls	r0, r0, #23
 8000886:	2102      	movs	r1, #2
 8000888:	2201      	movs	r2, #1
 800088a:	f000 fb2f 	bl	8000eec <GPIO_PinAFConfig>
 800088e:	2090      	movs	r0, #144	; 0x90
 8000890:	05c0      	lsls	r0, r0, #23
 8000892:	210f      	movs	r1, #15
 8000894:	2201      	movs	r2, #1
 8000896:	f000 fb29 	bl	8000eec <GPIO_PinAFConfig>
 800089a:	4b13      	ldr	r3, [pc, #76]	; (80008e8 <uart_init+0x94>)
 800089c:	2090      	movs	r0, #144	; 0x90
 800089e:	466a      	mov	r2, sp
 80008a0:	2501      	movs	r5, #1
 80008a2:	9300      	str	r3, [sp, #0]
 80008a4:	4669      	mov	r1, sp
 80008a6:	2302      	movs	r3, #2
 80008a8:	05c0      	lsls	r0, r0, #23
 80008aa:	7113      	strb	r3, [r2, #4]
 80008ac:	7155      	strb	r5, [r2, #5]
 80008ae:	7194      	strb	r4, [r2, #6]
 80008b0:	71d5      	strb	r5, [r2, #7]
 80008b2:	f000 fa97 	bl	8000de4 <GPIO_Init>
 80008b6:	23e1      	movs	r3, #225	; 0xe1
 80008b8:	025b      	lsls	r3, r3, #9
 80008ba:	9302      	str	r3, [sp, #8]
 80008bc:	a902      	add	r1, sp, #8
 80008be:	230c      	movs	r3, #12
 80008c0:	480a      	ldr	r0, [pc, #40]	; (80008ec <uart_init+0x98>)
 80008c2:	9306      	str	r3, [sp, #24]
 80008c4:	9403      	str	r4, [sp, #12]
 80008c6:	9404      	str	r4, [sp, #16]
 80008c8:	9405      	str	r4, [sp, #20]
 80008ca:	9407      	str	r4, [sp, #28]
 80008cc:	f000 fd3c 	bl	8001348 <USART_Init>
 80008d0:	4806      	ldr	r0, [pc, #24]	; (80008ec <uart_init+0x98>)
 80008d2:	1c29      	adds	r1, r5, #0
 80008d4:	f000 fe06 	bl	80014e4 <USART_Cmd>
 80008d8:	b009      	add	sp, #36	; 0x24
 80008da:	bd30      	pop	{r4, r5, pc}
 80008dc:	200003c8 	.word	0x200003c8
 80008e0:	200003ca 	.word	0x200003ca
 80008e4:	200003b8 	.word	0x200003b8
 80008e8:	00008004 	.word	0x00008004
 80008ec:	40013800 	.word	0x40013800

080008f0 <i2c_delay>:
 80008f0:	46c0      	nop			; (mov r8, r8)
 80008f2:	4770      	bx	lr

080008f4 <SetLowSDA>:
 80008f4:	b508      	push	{r3, lr}
 80008f6:	b672      	cpsid	i
 80008f8:	2390      	movs	r3, #144	; 0x90
 80008fa:	2280      	movs	r2, #128	; 0x80
 80008fc:	05db      	lsls	r3, r3, #23
 80008fe:	0112      	lsls	r2, r2, #4
 8000900:	851a      	strh	r2, [r3, #40]	; 0x28
 8000902:	685a      	ldr	r2, [r3, #4]
 8000904:	b292      	uxth	r2, r2
 8000906:	809a      	strh	r2, [r3, #4]
 8000908:	6819      	ldr	r1, [r3, #0]
 800090a:	2280      	movs	r2, #128	; 0x80
 800090c:	03d2      	lsls	r2, r2, #15
 800090e:	430a      	orrs	r2, r1
 8000910:	601a      	str	r2, [r3, #0]
 8000912:	b662      	cpsie	i
 8000914:	f7ff ffec 	bl	80008f0 <i2c_delay>
 8000918:	bd08      	pop	{r3, pc}
	...

0800091c <SetHighSDA>:
 800091c:	b508      	push	{r3, lr}
 800091e:	b672      	cpsid	i
 8000920:	2390      	movs	r3, #144	; 0x90
 8000922:	2280      	movs	r2, #128	; 0x80
 8000924:	05db      	lsls	r3, r3, #23
 8000926:	0112      	lsls	r2, r2, #4
 8000928:	619a      	str	r2, [r3, #24]
 800092a:	6859      	ldr	r1, [r3, #4]
 800092c:	4a05      	ldr	r2, [pc, #20]	; (8000944 <SetHighSDA+0x28>)
 800092e:	400a      	ands	r2, r1
 8000930:	809a      	strh	r2, [r3, #4]
 8000932:	6819      	ldr	r1, [r3, #0]
 8000934:	4a04      	ldr	r2, [pc, #16]	; (8000948 <SetHighSDA+0x2c>)
 8000936:	400a      	ands	r2, r1
 8000938:	601a      	str	r2, [r3, #0]
 800093a:	b662      	cpsie	i
 800093c:	f7ff ffd8 	bl	80008f0 <i2c_delay>
 8000940:	bd08      	pop	{r3, pc}
 8000942:	46c0      	nop			; (mov r8, r8)
 8000944:	0000f7ff 	.word	0x0000f7ff
 8000948:	ff3fffff 	.word	0xff3fffff

0800094c <SetHighSCL>:
 800094c:	b508      	push	{r3, lr}
 800094e:	2280      	movs	r2, #128	; 0x80
 8000950:	2390      	movs	r3, #144	; 0x90
 8000952:	0052      	lsls	r2, r2, #1
 8000954:	05db      	lsls	r3, r3, #23
 8000956:	619a      	str	r2, [r3, #24]
 8000958:	f7ff ffca 	bl	80008f0 <i2c_delay>
 800095c:	bd08      	pop	{r3, pc}

0800095e <i2c_0_init>:
 800095e:	b507      	push	{r0, r1, r2, lr}
 8000960:	2390      	movs	r3, #144	; 0x90
 8000962:	011b      	lsls	r3, r3, #4
 8000964:	4669      	mov	r1, sp
 8000966:	9300      	str	r3, [sp, #0]
 8000968:	2090      	movs	r0, #144	; 0x90
 800096a:	2301      	movs	r3, #1
 800096c:	710b      	strb	r3, [r1, #4]
 800096e:	2203      	movs	r2, #3
 8000970:	2300      	movs	r3, #0
 8000972:	05c0      	lsls	r0, r0, #23
 8000974:	718b      	strb	r3, [r1, #6]
 8000976:	714a      	strb	r2, [r1, #5]
 8000978:	71cb      	strb	r3, [r1, #7]
 800097a:	f000 fa33 	bl	8000de4 <GPIO_Init>
 800097e:	f7ff ffe5 	bl	800094c <SetHighSCL>
 8000982:	f7ff ffb7 	bl	80008f4 <SetLowSDA>
 8000986:	f7ff ffc9 	bl	800091c <SetHighSDA>
 800098a:	bd07      	pop	{r0, r1, r2, pc}

0800098c <adc_config_ch>:
 800098c:	4b02      	ldr	r3, [pc, #8]	; (8000998 <adc_config_ch+0xc>)
 800098e:	2201      	movs	r2, #1
 8000990:	6298      	str	r0, [r3, #40]	; 0x28
 8000992:	615a      	str	r2, [r3, #20]
 8000994:	4770      	bx	lr
 8000996:	46c0      	nop			; (mov r8, r8)
 8000998:	40012400 	.word	0x40012400

0800099c <adc_read>:
 800099c:	4b07      	ldr	r3, [pc, #28]	; (80009bc <adc_read+0x20>)
 800099e:	2104      	movs	r1, #4
 80009a0:	689a      	ldr	r2, [r3, #8]
 80009a2:	430a      	orrs	r2, r1
 80009a4:	609a      	str	r2, [r3, #8]
 80009a6:	6818      	ldr	r0, [r3, #0]
 80009a8:	2104      	movs	r1, #4
 80009aa:	4a04      	ldr	r2, [pc, #16]	; (80009bc <adc_read+0x20>)
 80009ac:	4208      	tst	r0, r1
 80009ae:	d101      	bne.n	80009b4 <adc_read+0x18>
 80009b0:	46c0      	nop			; (mov r8, r8)
 80009b2:	e7f8      	b.n	80009a6 <adc_read+0xa>
 80009b4:	6c10      	ldr	r0, [r2, #64]	; 0x40
 80009b6:	6011      	str	r1, [r2, #0]
 80009b8:	4770      	bx	lr
 80009ba:	46c0      	nop			; (mov r8, r8)
 80009bc:	40012400 	.word	0x40012400

080009c0 <adc_random_seed>:
 80009c0:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
 80009c2:	2400      	movs	r4, #0
 80009c4:	1c25      	adds	r5, r4, #0
 80009c6:	2720      	movs	r7, #32
 80009c8:	2600      	movs	r6, #0
 80009ca:	2001      	movs	r0, #1
 80009cc:	f000 ff90 	bl	80018f0 <ADC_TempSensorCmd>
 80009d0:	2001      	movs	r0, #1
 80009d2:	f000 ffa5 	bl	8001920 <ADC_VrefintCmd>
 80009d6:	2201      	movs	r2, #1
 80009d8:	4b0e      	ldr	r3, [pc, #56]	; (8000a14 <adc_random_seed+0x54>)
 80009da:	2180      	movs	r1, #128	; 0x80
 80009dc:	4215      	tst	r5, r2
 80009de:	d001      	beq.n	80009e4 <adc_random_seed+0x24>
 80009e0:	0249      	lsls	r1, r1, #9
 80009e2:	e000      	b.n	80009e6 <adc_random_seed+0x26>
 80009e4:	0289      	lsls	r1, r1, #10
 80009e6:	6299      	str	r1, [r3, #40]	; 0x28
 80009e8:	615a      	str	r2, [r3, #20]
 80009ea:	f7ff ffd7 	bl	800099c <adc_read>
 80009ee:	2301      	movs	r3, #1
 80009f0:	4018      	ands	r0, r3
 80009f2:	0076      	lsls	r6, r6, #1
 80009f4:	4306      	orrs	r6, r0
 80009f6:	2000      	movs	r0, #0
 80009f8:	f000 ff7a 	bl	80018f0 <ADC_TempSensorCmd>
 80009fc:	3f01      	subs	r7, #1
 80009fe:	2000      	movs	r0, #0
 8000a00:	f000 ff8e 	bl	8001920 <ADC_VrefintCmd>
 8000a04:	2f00      	cmp	r7, #0
 8000a06:	d1e0      	bne.n	80009ca <adc_random_seed+0xa>
 8000a08:	3501      	adds	r5, #1
 8000a0a:	4074      	eors	r4, r6
 8000a0c:	2d08      	cmp	r5, #8
 8000a0e:	d1da      	bne.n	80009c6 <adc_random_seed+0x6>
 8000a10:	1c20      	adds	r0, r4, #0
 8000a12:	bdf8      	pop	{r3, r4, r5, r6, r7, pc}
 8000a14:	40012400 	.word	0x40012400

08000a18 <adc_init>:
 8000a18:	b510      	push	{r4, lr}
 8000a1a:	b088      	sub	sp, #32
 8000a1c:	9000      	str	r0, [sp, #0]
 8000a1e:	2090      	movs	r0, #144	; 0x90
 8000a20:	466a      	mov	r2, sp
 8000a22:	2303      	movs	r3, #3
 8000a24:	2400      	movs	r4, #0
 8000a26:	05c0      	lsls	r0, r0, #23
 8000a28:	4669      	mov	r1, sp
 8000a2a:	7113      	strb	r3, [r2, #4]
 8000a2c:	71d4      	strb	r4, [r2, #7]
 8000a2e:	f000 f9d9 	bl	8000de4 <GPIO_Init>
 8000a32:	2080      	movs	r0, #128	; 0x80
 8000a34:	2101      	movs	r1, #1
 8000a36:	0080      	lsls	r0, r0, #2
 8000a38:	f001 f920 	bl	8001c7c <RCC_APB2PeriphClockCmd>
 8000a3c:	2080      	movs	r0, #128	; 0x80
 8000a3e:	0440      	lsls	r0, r0, #17
 8000a40:	f001 f810 	bl	8001a64 <RCC_ADCCLKConfig>
 8000a44:	4810      	ldr	r0, [pc, #64]	; (8000a88 <adc_init+0x70>)
 8000a46:	f000 fecd 	bl	80017e4 <ADC_DeInit>
 8000a4a:	a902      	add	r1, sp, #8
 8000a4c:	480e      	ldr	r0, [pc, #56]	; (8000a88 <adc_init+0x70>)
 8000a4e:	710c      	strb	r4, [r1, #4]
 8000a50:	610c      	str	r4, [r1, #16]
 8000a52:	614c      	str	r4, [r1, #20]
 8000a54:	608c      	str	r4, [r1, #8]
 8000a56:	60cc      	str	r4, [r1, #12]
 8000a58:	9402      	str	r4, [sp, #8]
 8000a5a:	f000 fedb 	bl	8001814 <ADC_Init>
 8000a5e:	480a      	ldr	r0, [pc, #40]	; (8000a88 <adc_init+0x70>)
 8000a60:	f000 ff76 	bl	8001950 <ADC_GetCalibrationFactor>
 8000a64:	4808      	ldr	r0, [pc, #32]	; (8000a88 <adc_init+0x70>)
 8000a66:	2101      	movs	r1, #1
 8000a68:	f000 ff26 	bl	80018b8 <ADC_Cmd>
 8000a6c:	4806      	ldr	r0, [pc, #24]	; (8000a88 <adc_init+0x70>)
 8000a6e:	2101      	movs	r1, #1
 8000a70:	f000 ff8e 	bl	8001990 <ADC_GetFlagStatus>
 8000a74:	2800      	cmp	r0, #0
 8000a76:	d101      	bne.n	8000a7c <adc_init+0x64>
 8000a78:	46c0      	nop			; (mov r8, r8)
 8000a7a:	e7f7      	b.n	8000a6c <adc_init+0x54>
 8000a7c:	f7ff ffa0 	bl	80009c0 <adc_random_seed>
 8000a80:	4b02      	ldr	r3, [pc, #8]	; (8000a8c <adc_init+0x74>)
 8000a82:	6018      	str	r0, [r3, #0]
 8000a84:	b008      	add	sp, #32
 8000a86:	bd10      	pop	{r4, pc}
 8000a88:	40012400 	.word	0x40012400
 8000a8c:	20000010 	.word	0x20000010

08000a90 <assert_param>:
 8000a90:	4770      	bx	lr
	...

08000a94 <sys_tick_init>:
 8000a94:	4b03      	ldr	r3, [pc, #12]	; (8000aa4 <sys_tick_init+0x10>)
 8000a96:	4a04      	ldr	r2, [pc, #16]	; (8000aa8 <sys_tick_init+0x14>)
 8000a98:	605a      	str	r2, [r3, #4]
 8000a9a:	2200      	movs	r2, #0
 8000a9c:	609a      	str	r2, [r3, #8]
 8000a9e:	2207      	movs	r2, #7
 8000aa0:	601a      	str	r2, [r3, #0]
 8000aa2:	4770      	bx	lr
 8000aa4:	e000e010 	.word	0xe000e010
 8000aa8:	0000bb80 	.word	0x0000bb80

08000aac <sleep>:
 8000aac:	bf30      	wfi
 8000aae:	4770      	bx	lr

08000ab0 <SystemInit>:
 8000ab0:	4b26      	ldr	r3, [pc, #152]	; (8000b4c <SystemInit+0x9c>)
 8000ab2:	2201      	movs	r2, #1
 8000ab4:	6819      	ldr	r1, [r3, #0]
 8000ab6:	b082      	sub	sp, #8
 8000ab8:	4311      	orrs	r1, r2
 8000aba:	6019      	str	r1, [r3, #0]
 8000abc:	6858      	ldr	r0, [r3, #4]
 8000abe:	4924      	ldr	r1, [pc, #144]	; (8000b50 <SystemInit+0xa0>)
 8000ac0:	4001      	ands	r1, r0
 8000ac2:	6059      	str	r1, [r3, #4]
 8000ac4:	6818      	ldr	r0, [r3, #0]
 8000ac6:	4923      	ldr	r1, [pc, #140]	; (8000b54 <SystemInit+0xa4>)
 8000ac8:	4001      	ands	r1, r0
 8000aca:	6019      	str	r1, [r3, #0]
 8000acc:	6818      	ldr	r0, [r3, #0]
 8000ace:	4922      	ldr	r1, [pc, #136]	; (8000b58 <SystemInit+0xa8>)
 8000ad0:	4001      	ands	r1, r0
 8000ad2:	6019      	str	r1, [r3, #0]
 8000ad4:	6858      	ldr	r0, [r3, #4]
 8000ad6:	4921      	ldr	r1, [pc, #132]	; (8000b5c <SystemInit+0xac>)
 8000ad8:	4001      	ands	r1, r0
 8000ada:	6059      	str	r1, [r3, #4]
 8000adc:	6ad9      	ldr	r1, [r3, #44]	; 0x2c
 8000ade:	200f      	movs	r0, #15
 8000ae0:	4381      	bics	r1, r0
 8000ae2:	62d9      	str	r1, [r3, #44]	; 0x2c
 8000ae4:	6b18      	ldr	r0, [r3, #48]	; 0x30
 8000ae6:	491e      	ldr	r1, [pc, #120]	; (8000b60 <SystemInit+0xb0>)
 8000ae8:	4001      	ands	r1, r0
 8000aea:	6319      	str	r1, [r3, #48]	; 0x30
 8000aec:	6b59      	ldr	r1, [r3, #52]	; 0x34
 8000aee:	4391      	bics	r1, r2
 8000af0:	2200      	movs	r2, #0
 8000af2:	6359      	str	r1, [r3, #52]	; 0x34
 8000af4:	609a      	str	r2, [r3, #8]
 8000af6:	9200      	str	r2, [sp, #0]
 8000af8:	9201      	str	r2, [sp, #4]
 8000afa:	4a1a      	ldr	r2, [pc, #104]	; (8000b64 <SystemInit+0xb4>)
 8000afc:	2111      	movs	r1, #17
 8000afe:	6011      	str	r1, [r2, #0]
 8000b00:	685a      	ldr	r2, [r3, #4]
 8000b02:	605a      	str	r2, [r3, #4]
 8000b04:	685a      	ldr	r2, [r3, #4]
 8000b06:	605a      	str	r2, [r3, #4]
 8000b08:	6859      	ldr	r1, [r3, #4]
 8000b0a:	4a17      	ldr	r2, [pc, #92]	; (8000b68 <SystemInit+0xb8>)
 8000b0c:	400a      	ands	r2, r1
 8000b0e:	605a      	str	r2, [r3, #4]
 8000b10:	6859      	ldr	r1, [r3, #4]
 8000b12:	22a0      	movs	r2, #160	; 0xa0
 8000b14:	0392      	lsls	r2, r2, #14
 8000b16:	430a      	orrs	r2, r1
 8000b18:	605a      	str	r2, [r3, #4]
 8000b1a:	6819      	ldr	r1, [r3, #0]
 8000b1c:	2280      	movs	r2, #128	; 0x80
 8000b1e:	0452      	lsls	r2, r2, #17
 8000b20:	430a      	orrs	r2, r1
 8000b22:	601a      	str	r2, [r3, #0]
 8000b24:	6819      	ldr	r1, [r3, #0]
 8000b26:	4a09      	ldr	r2, [pc, #36]	; (8000b4c <SystemInit+0x9c>)
 8000b28:	0188      	lsls	r0, r1, #6
 8000b2a:	d5fb      	bpl.n	8000b24 <SystemInit+0x74>
 8000b2c:	6851      	ldr	r1, [r2, #4]
 8000b2e:	2003      	movs	r0, #3
 8000b30:	4381      	bics	r1, r0
 8000b32:	6051      	str	r1, [r2, #4]
 8000b34:	6851      	ldr	r1, [r2, #4]
 8000b36:	2002      	movs	r0, #2
 8000b38:	4301      	orrs	r1, r0
 8000b3a:	6051      	str	r1, [r2, #4]
 8000b3c:	6859      	ldr	r1, [r3, #4]
 8000b3e:	220c      	movs	r2, #12
 8000b40:	400a      	ands	r2, r1
 8000b42:	2a08      	cmp	r2, #8
 8000b44:	d1fa      	bne.n	8000b3c <SystemInit+0x8c>
 8000b46:	b002      	add	sp, #8
 8000b48:	4770      	bx	lr
 8000b4a:	46c0      	nop			; (mov r8, r8)
 8000b4c:	40021000 	.word	0x40021000
 8000b50:	f8ffb80c 	.word	0xf8ffb80c
 8000b54:	fef6ffff 	.word	0xfef6ffff
 8000b58:	fffbffff 	.word	0xfffbffff
 8000b5c:	ffc0ffff 	.word	0xffc0ffff
 8000b60:	fffffeac 	.word	0xfffffeac
 8000b64:	40022000 	.word	0x40022000
 8000b68:	ffc07fff 	.word	0xffc07fff

08000b6c <pwm_init>:
 8000b6c:	b5f0      	push	{r4, r5, r6, r7, lr}
 8000b6e:	2690      	movs	r6, #144	; 0x90
 8000b70:	b08b      	sub	sp, #44	; 0x2c
 8000b72:	05f6      	lsls	r6, r6, #23
 8000b74:	2380      	movs	r3, #128	; 0x80
 8000b76:	2400      	movs	r4, #0
 8000b78:	466a      	mov	r2, sp
 8000b7a:	2501      	movs	r5, #1
 8000b7c:	2702      	movs	r7, #2
 8000b7e:	9300      	str	r3, [sp, #0]
 8000b80:	1c30      	adds	r0, r6, #0
 8000b82:	2303      	movs	r3, #3
 8000b84:	4669      	mov	r1, sp
 8000b86:	7153      	strb	r3, [r2, #5]
 8000b88:	7117      	strb	r7, [r2, #4]
 8000b8a:	7194      	strb	r4, [r2, #6]
 8000b8c:	71d5      	strb	r5, [r2, #7]
 8000b8e:	f000 f929 	bl	8000de4 <GPIO_Init>
 8000b92:	1c3a      	adds	r2, r7, #0
 8000b94:	1c30      	adds	r0, r6, #0
 8000b96:	2107      	movs	r1, #7
 8000b98:	f000 f9a8 	bl	8000eec <GPIO_PinAFConfig>
 8000b9c:	2080      	movs	r0, #128	; 0x80
 8000b9e:	4e15      	ldr	r6, [pc, #84]	; (8000bf4 <pwm_init+0x88>)
 8000ba0:	1c29      	adds	r1, r5, #0
 8000ba2:	0100      	lsls	r0, r0, #4
 8000ba4:	f001 f86a 	bl	8001c7c <RCC_APB2PeriphClockCmd>
 8000ba8:	2380      	movs	r3, #128	; 0x80
 8000baa:	a902      	add	r1, sp, #8
 8000bac:	00db      	lsls	r3, r3, #3
 8000bae:	1c30      	adds	r0, r6, #0
 8000bb0:	800c      	strh	r4, [r1, #0]
 8000bb2:	804c      	strh	r4, [r1, #2]
 8000bb4:	604b      	str	r3, [r1, #4]
 8000bb6:	810c      	strh	r4, [r1, #8]
 8000bb8:	728c      	strb	r4, [r1, #10]
 8000bba:	f000 f9dd 	bl	8000f78 <TIM_TimeBaseInit>
 8000bbe:	a905      	add	r1, sp, #20
 8000bc0:	2370      	movs	r3, #112	; 0x70
 8000bc2:	800b      	strh	r3, [r1, #0]
 8000bc4:	2304      	movs	r3, #4
 8000bc6:	808b      	strh	r3, [r1, #4]
 8000bc8:	2380      	movs	r3, #128	; 0x80
 8000bca:	40ab      	lsls	r3, r5
 8000bcc:	1c30      	adds	r0, r6, #0
 8000bce:	820b      	strh	r3, [r1, #16]
 8000bd0:	804d      	strh	r5, [r1, #2]
 8000bd2:	608c      	str	r4, [r1, #8]
 8000bd4:	818f      	strh	r7, [r1, #12]
 8000bd6:	81cc      	strh	r4, [r1, #14]
 8000bd8:	824c      	strh	r4, [r1, #18]
 8000bda:	f000 fac5 	bl	8001168 <TIM_OC1Init>
 8000bde:	1c30      	adds	r0, r6, #0
 8000be0:	1c29      	adds	r1, r5, #0
 8000be2:	f000 fa4b 	bl	800107c <TIM_Cmd>
 8000be6:	1c30      	adds	r0, r6, #0
 8000be8:	1c29      	adds	r1, r5, #0
 8000bea:	f000 fa8b 	bl	8001104 <TIM_CtrlPWMOutputs>
 8000bee:	b00b      	add	sp, #44	; 0x2c
 8000bf0:	bdf0      	pop	{r4, r5, r6, r7, pc}
 8000bf2:	46c0      	nop			; (mov r8, r8)
 8000bf4:	40012c00 	.word	0x40012c00

08000bf8 <pwm_set>:
 8000bf8:	4b01      	ldr	r3, [pc, #4]	; (8000c00 <pwm_set+0x8>)
 8000bfa:	6358      	str	r0, [r3, #52]	; 0x34
 8000bfc:	4770      	bx	lr
 8000bfe:	46c0      	nop			; (mov r8, r8)
 8000c00:	40012c00 	.word	0x40012c00

08000c04 <lib_low_level_init>:
 8000c04:	b508      	push	{r3, lr}
 8000c06:	f7ff ff53 	bl	8000ab0 <SystemInit>
 8000c0a:	f001 f897 	bl	8001d3c <gpio_init>
 8000c0e:	f7ff fe21 	bl	8000854 <uart_init>
 8000c12:	f7ff fd63 	bl	80006dc <timer_init>
 8000c16:	f7ff fea2 	bl	800095e <i2c_0_init>
 8000c1a:	bd08      	pop	{r3, pc}

08000c1c <TIM14_IRQHandler>:
 8000c1c:	b570      	push	{r4, r5, r6, lr}
 8000c1e:	4b60      	ldr	r3, [pc, #384]	; (8000da0 <TIM14_IRQHandler+0x184>)
 8000c20:	7818      	ldrb	r0, [r3, #0]
 8000c22:	b2c0      	uxtb	r0, r0
 8000c24:	2803      	cmp	r0, #3
 8000c26:	d83f      	bhi.n	8000ca8 <TIM14_IRQHandler+0x8c>
 8000c28:	f001 f92a 	bl	8001e80 <__gnu_thumb1_case_uqi>
 8000c2c:	32220a02 	.word	0x32220a02
 8000c30:	2280      	movs	r2, #128	; 0x80
 8000c32:	2390      	movs	r3, #144	; 0x90
 8000c34:	0052      	lsls	r2, r2, #1
 8000c36:	05db      	lsls	r3, r3, #23
 8000c38:	851a      	strh	r2, [r3, #40]	; 0x28
 8000c3a:	2200      	movs	r2, #0
 8000c3c:	4b59      	ldr	r3, [pc, #356]	; (8000da4 <TIM14_IRQHandler+0x188>)
 8000c3e:	e032      	b.n	8000ca6 <TIM14_IRQHandler+0x8a>
 8000c40:	4a58      	ldr	r2, [pc, #352]	; (8000da4 <TIM14_IRQHandler+0x188>)
 8000c42:	7811      	ldrb	r1, [r2, #0]
 8000c44:	290d      	cmp	r1, #13
 8000c46:	d901      	bls.n	8000c4c <TIM14_IRQHandler+0x30>
 8000c48:	2200      	movs	r2, #0
 8000c4a:	e02c      	b.n	8000ca6 <TIM14_IRQHandler+0x8a>
 8000c4c:	7811      	ldrb	r1, [r2, #0]
 8000c4e:	4856      	ldr	r0, [pc, #344]	; (8000da8 <TIM14_IRQHandler+0x18c>)
 8000c50:	5c41      	ldrb	r1, [r0, r1]
 8000c52:	20ff      	movs	r0, #255	; 0xff
 8000c54:	4388      	bics	r0, r1
 8000c56:	0040      	lsls	r0, r0, #1
 8000c58:	2101      	movs	r1, #1
 8000c5a:	4308      	orrs	r0, r1
 8000c5c:	4953      	ldr	r1, [pc, #332]	; (8000dac <TIM14_IRQHandler+0x190>)
 8000c5e:	8008      	strh	r0, [r1, #0]
 8000c60:	7811      	ldrb	r1, [r2, #0]
 8000c62:	3101      	adds	r1, #1
 8000c64:	b2c9      	uxtb	r1, r1
 8000c66:	7011      	strb	r1, [r2, #0]
 8000c68:	4a51      	ldr	r2, [pc, #324]	; (8000db0 <TIM14_IRQHandler+0x194>)
 8000c6a:	2100      	movs	r1, #0
 8000c6c:	7011      	strb	r1, [r2, #0]
 8000c6e:	e019      	b.n	8000ca4 <TIM14_IRQHandler+0x88>
 8000c70:	4a4e      	ldr	r2, [pc, #312]	; (8000dac <TIM14_IRQHandler+0x190>)
 8000c72:	2190      	movs	r1, #144	; 0x90
 8000c74:	8814      	ldrh	r4, [r2, #0]
 8000c76:	2080      	movs	r0, #128	; 0x80
 8000c78:	05c9      	lsls	r1, r1, #23
 8000c7a:	0040      	lsls	r0, r0, #1
 8000c7c:	07e5      	lsls	r5, r4, #31
 8000c7e:	d501      	bpl.n	8000c84 <TIM14_IRQHandler+0x68>
 8000c80:	6188      	str	r0, [r1, #24]
 8000c82:	e000      	b.n	8000c86 <TIM14_IRQHandler+0x6a>
 8000c84:	8508      	strh	r0, [r1, #40]	; 0x28
 8000c86:	8811      	ldrh	r1, [r2, #0]
 8000c88:	0849      	lsrs	r1, r1, #1
 8000c8a:	8011      	strh	r1, [r2, #0]
 8000c8c:	2203      	movs	r2, #3
 8000c8e:	e00a      	b.n	8000ca6 <TIM14_IRQHandler+0x8a>
 8000c90:	4a47      	ldr	r2, [pc, #284]	; (8000db0 <TIM14_IRQHandler+0x194>)
 8000c92:	7811      	ldrb	r1, [r2, #0]
 8000c94:	3101      	adds	r1, #1
 8000c96:	b2c9      	uxtb	r1, r1
 8000c98:	7011      	strb	r1, [r2, #0]
 8000c9a:	7812      	ldrb	r2, [r2, #0]
 8000c9c:	2a09      	cmp	r2, #9
 8000c9e:	d901      	bls.n	8000ca4 <TIM14_IRQHandler+0x88>
 8000ca0:	2201      	movs	r2, #1
 8000ca2:	e000      	b.n	8000ca6 <TIM14_IRQHandler+0x8a>
 8000ca4:	2202      	movs	r2, #2
 8000ca6:	701a      	strb	r2, [r3, #0]
 8000ca8:	4b42      	ldr	r3, [pc, #264]	; (8000db4 <TIM14_IRQHandler+0x198>)
 8000caa:	2104      	movs	r1, #4
 8000cac:	6c1a      	ldr	r2, [r3, #64]	; 0x40
 8000cae:	6019      	str	r1, [r3, #0]
 8000cb0:	6898      	ldr	r0, [r3, #8]
 8000cb2:	4301      	orrs	r1, r0
 8000cb4:	6099      	str	r1, [r3, #8]
 8000cb6:	4b40      	ldr	r3, [pc, #256]	; (8000db8 <TIM14_IRQHandler+0x19c>)
 8000cb8:	2101      	movs	r1, #1
 8000cba:	429a      	cmp	r2, r3
 8000cbc:	d80b      	bhi.n	8000cd6 <TIM14_IRQHandler+0xba>
 8000cbe:	4b3f      	ldr	r3, [pc, #252]	; (8000dbc <TIM14_IRQHandler+0x1a0>)
 8000cc0:	2480      	movs	r4, #128	; 0x80
 8000cc2:	6818      	ldr	r0, [r3, #0]
 8000cc4:	0164      	lsls	r4, r4, #5
 8000cc6:	1901      	adds	r1, r0, r4
 8000cc8:	1a8a      	subs	r2, r1, r2
 8000cca:	601a      	str	r2, [r3, #0]
 8000ccc:	4b3c      	ldr	r3, [pc, #240]	; (8000dc0 <TIM14_IRQHandler+0x1a4>)
 8000cce:	2100      	movs	r1, #0
 8000cd0:	681a      	ldr	r2, [r3, #0]
 8000cd2:	3201      	adds	r2, #1
 8000cd4:	601a      	str	r2, [r3, #0]
 8000cd6:	4b3b      	ldr	r3, [pc, #236]	; (8000dc4 <TIM14_IRQHandler+0x1a8>)
 8000cd8:	7818      	ldrb	r0, [r3, #0]
 8000cda:	b2c0      	uxtb	r0, r0
 8000cdc:	2804      	cmp	r0, #4
 8000cde:	d85a      	bhi.n	8000d96 <TIM14_IRQHandler+0x17a>
 8000ce0:	f001 f8ce 	bl	8001e80 <__gnu_thumb1_case_uqi>
 8000ce4:	36110603 	.word	0x36110603
 8000ce8:	38          	.byte	0x38
 8000ce9:	00          	.byte	0x00
 8000cea:	2200      	movs	r2, #0
 8000cec:	4b36      	ldr	r3, [pc, #216]	; (8000dc8 <TIM14_IRQHandler+0x1ac>)
 8000cee:	e051      	b.n	8000d94 <TIM14_IRQHandler+0x178>
 8000cf0:	4a35      	ldr	r2, [pc, #212]	; (8000dc8 <TIM14_IRQHandler+0x1ac>)
 8000cf2:	7811      	ldrb	r1, [r2, #0]
 8000cf4:	2200      	movs	r2, #0
 8000cf6:	290d      	cmp	r1, #13
 8000cf8:	d84c      	bhi.n	8000d94 <TIM14_IRQHandler+0x178>
 8000cfa:	4934      	ldr	r1, [pc, #208]	; (8000dcc <TIM14_IRQHandler+0x1b0>)
 8000cfc:	800a      	strh	r2, [r1, #0]
 8000cfe:	4934      	ldr	r1, [pc, #208]	; (8000dd0 <TIM14_IRQHandler+0x1b4>)
 8000d00:	700a      	strb	r2, [r1, #0]
 8000d02:	2202      	movs	r2, #2
 8000d04:	e046      	b.n	8000d94 <TIM14_IRQHandler+0x178>
 8000d06:	4a33      	ldr	r2, [pc, #204]	; (8000dd4 <TIM14_IRQHandler+0x1b8>)
 8000d08:	2900      	cmp	r1, #0
 8000d0a:	d103      	bne.n	8000d14 <TIM14_IRQHandler+0xf8>
 8000d0c:	2003      	movs	r0, #3
 8000d0e:	7018      	strb	r0, [r3, #0]
 8000d10:	6011      	str	r1, [r2, #0]
 8000d12:	e040      	b.n	8000d96 <TIM14_IRQHandler+0x17a>
 8000d14:	6811      	ldr	r1, [r2, #0]
 8000d16:	3101      	adds	r1, #1
 8000d18:	6011      	str	r1, [r2, #0]
 8000d1a:	6810      	ldr	r0, [r2, #0]
 8000d1c:	21d2      	movs	r1, #210	; 0xd2
 8000d1e:	0049      	lsls	r1, r1, #1
 8000d20:	4288      	cmp	r0, r1
 8000d22:	d938      	bls.n	8000d96 <TIM14_IRQHandler+0x17a>
 8000d24:	2100      	movs	r1, #0
 8000d26:	6011      	str	r1, [r2, #0]
 8000d28:	4e25      	ldr	r6, [pc, #148]	; (8000dc0 <TIM14_IRQHandler+0x1a4>)
 8000d2a:	4a27      	ldr	r2, [pc, #156]	; (8000dc8 <TIM14_IRQHandler+0x1ac>)
 8000d2c:	4c23      	ldr	r4, [pc, #140]	; (8000dbc <TIM14_IRQHandler+0x1a0>)
 8000d2e:	7011      	strb	r1, [r2, #0]
 8000d30:	6831      	ldr	r1, [r6, #0]
 8000d32:	2201      	movs	r2, #1
 8000d34:	701a      	strb	r2, [r3, #0]
 8000d36:	4d28      	ldr	r5, [pc, #160]	; (8000dd8 <TIM14_IRQHandler+0x1bc>)
 8000d38:	2900      	cmp	r1, #0
 8000d3a:	d004      	beq.n	8000d46 <TIM14_IRQHandler+0x12a>
 8000d3c:	6820      	ldr	r0, [r4, #0]
 8000d3e:	f001 f8a9 	bl	8001e94 <__aeabi_uidiv>
 8000d42:	6028      	str	r0, [r5, #0]
 8000d44:	e000      	b.n	8000d48 <TIM14_IRQHandler+0x12c>
 8000d46:	6029      	str	r1, [r5, #0]
 8000d48:	2300      	movs	r3, #0
 8000d4a:	6023      	str	r3, [r4, #0]
 8000d4c:	6033      	str	r3, [r6, #0]
 8000d4e:	e022      	b.n	8000d96 <TIM14_IRQHandler+0x17a>
 8000d50:	2204      	movs	r2, #4
 8000d52:	e01f      	b.n	8000d94 <TIM14_IRQHandler+0x178>
 8000d54:	4a1e      	ldr	r2, [pc, #120]	; (8000dd0 <TIM14_IRQHandler+0x1b4>)
 8000d56:	2900      	cmp	r1, #0
 8000d58:	d008      	beq.n	8000d6c <TIM14_IRQHandler+0x150>
 8000d5a:	491c      	ldr	r1, [pc, #112]	; (8000dcc <TIM14_IRQHandler+0x1b0>)
 8000d5c:	2501      	movs	r5, #1
 8000d5e:	880c      	ldrh	r4, [r1, #0]
 8000d60:	7810      	ldrb	r0, [r2, #0]
 8000d62:	4085      	lsls	r5, r0
 8000d64:	1c28      	adds	r0, r5, #0
 8000d66:	4320      	orrs	r0, r4
 8000d68:	b280      	uxth	r0, r0
 8000d6a:	8008      	strh	r0, [r1, #0]
 8000d6c:	7811      	ldrb	r1, [r2, #0]
 8000d6e:	3101      	adds	r1, #1
 8000d70:	b2c9      	uxtb	r1, r1
 8000d72:	7011      	strb	r1, [r2, #0]
 8000d74:	7812      	ldrb	r2, [r2, #0]
 8000d76:	2a07      	cmp	r2, #7
 8000d78:	d90b      	bls.n	8000d92 <TIM14_IRQHandler+0x176>
 8000d7a:	4a13      	ldr	r2, [pc, #76]	; (8000dc8 <TIM14_IRQHandler+0x1ac>)
 8000d7c:	4813      	ldr	r0, [pc, #76]	; (8000dcc <TIM14_IRQHandler+0x1b0>)
 8000d7e:	7811      	ldrb	r1, [r2, #0]
 8000d80:	8804      	ldrh	r4, [r0, #0]
 8000d82:	4816      	ldr	r0, [pc, #88]	; (8000ddc <TIM14_IRQHandler+0x1c0>)
 8000d84:	5444      	strb	r4, [r0, r1]
 8000d86:	7811      	ldrb	r1, [r2, #0]
 8000d88:	3101      	adds	r1, #1
 8000d8a:	b2c9      	uxtb	r1, r1
 8000d8c:	7011      	strb	r1, [r2, #0]
 8000d8e:	2201      	movs	r2, #1
 8000d90:	e000      	b.n	8000d94 <TIM14_IRQHandler+0x178>
 8000d92:	2203      	movs	r2, #3
 8000d94:	701a      	strb	r2, [r3, #0]
 8000d96:	4b12      	ldr	r3, [pc, #72]	; (8000de0 <TIM14_IRQHandler+0x1c4>)
 8000d98:	2200      	movs	r2, #0
 8000d9a:	821a      	strh	r2, [r3, #16]
 8000d9c:	bd70      	pop	{r4, r5, r6, pc}
 8000d9e:	46c0      	nop			; (mov r8, r8)
 8000da0:	200003cf 	.word	0x200003cf
 8000da4:	200003ce 	.word	0x200003ce
 8000da8:	2000008e 	.word	0x2000008e
 8000dac:	200003d6 	.word	0x200003d6
 8000db0:	200003e4 	.word	0x200003e4
 8000db4:	40012400 	.word	0x40012400
 8000db8:	000003e7 	.word	0x000003e7
 8000dbc:	200003e0 	.word	0x200003e0
 8000dc0:	200003e8 	.word	0x200003e8
 8000dc4:	200003d4 	.word	0x200003d4
 8000dc8:	200003d8 	.word	0x200003d8
 8000dcc:	200003cc 	.word	0x200003cc
 8000dd0:	200003d9 	.word	0x200003d9
 8000dd4:	200003dc 	.word	0x200003dc
 8000dd8:	200003d0 	.word	0x200003d0
 8000ddc:	20000080 	.word	0x20000080
 8000de0:	40002000 	.word	0x40002000

08000de4 <GPIO_Init>:
 8000de4:	2390      	movs	r3, #144	; 0x90
 8000de6:	b5f7      	push	{r0, r1, r2, r4, r5, r6, r7, lr}
 8000de8:	05db      	lsls	r3, r3, #23
 8000dea:	1c04      	adds	r4, r0, #0
 8000dec:	1c0d      	adds	r5, r1, #0
 8000dee:	4298      	cmp	r0, r3
 8000df0:	d010      	beq.n	8000e14 <GPIO_Init+0x30>
 8000df2:	4b39      	ldr	r3, [pc, #228]	; (8000ed8 <GPIO_Init+0xf4>)
 8000df4:	4298      	cmp	r0, r3
 8000df6:	d00d      	beq.n	8000e14 <GPIO_Init+0x30>
 8000df8:	4b38      	ldr	r3, [pc, #224]	; (8000edc <GPIO_Init+0xf8>)
 8000dfa:	4298      	cmp	r0, r3
 8000dfc:	d00a      	beq.n	8000e14 <GPIO_Init+0x30>
 8000dfe:	4b38      	ldr	r3, [pc, #224]	; (8000ee0 <GPIO_Init+0xfc>)
 8000e00:	4298      	cmp	r0, r3
 8000e02:	d007      	beq.n	8000e14 <GPIO_Init+0x30>
 8000e04:	4b37      	ldr	r3, [pc, #220]	; (8000ee4 <GPIO_Init+0x100>)
 8000e06:	4298      	cmp	r0, r3
 8000e08:	d004      	beq.n	8000e14 <GPIO_Init+0x30>
 8000e0a:	4a37      	ldr	r2, [pc, #220]	; (8000ee8 <GPIO_Init+0x104>)
 8000e0c:	1880      	adds	r0, r0, r2
 8000e0e:	4243      	negs	r3, r0
 8000e10:	4158      	adcs	r0, r3
 8000e12:	e000      	b.n	8000e16 <GPIO_Init+0x32>
 8000e14:	2001      	movs	r0, #1
 8000e16:	f7ff fe3b 	bl	8000a90 <assert_param>
 8000e1a:	6828      	ldr	r0, [r5, #0]
 8000e1c:	2600      	movs	r6, #0
 8000e1e:	1e43      	subs	r3, r0, #1
 8000e20:	4198      	sbcs	r0, r3
 8000e22:	f7ff fe35 	bl	8000a90 <assert_param>
 8000e26:	792b      	ldrb	r3, [r5, #4]
 8000e28:	2203      	movs	r2, #3
 8000e2a:	1c30      	adds	r0, r6, #0
 8000e2c:	429a      	cmp	r2, r3
 8000e2e:	4170      	adcs	r0, r6
 8000e30:	f7ff fe2e 	bl	8000a90 <assert_param>
 8000e34:	79eb      	ldrb	r3, [r5, #7]
 8000e36:	2202      	movs	r2, #2
 8000e38:	1c30      	adds	r0, r6, #0
 8000e3a:	429a      	cmp	r2, r3
 8000e3c:	4170      	adcs	r0, r6
 8000e3e:	f7ff fe27 	bl	8000a90 <assert_param>
 8000e42:	2001      	movs	r0, #1
 8000e44:	1c03      	adds	r3, r0, #0
 8000e46:	682a      	ldr	r2, [r5, #0]
 8000e48:	40b3      	lsls	r3, r6
 8000e4a:	401a      	ands	r2, r3
 8000e4c:	9201      	str	r2, [sp, #4]
 8000e4e:	429a      	cmp	r2, r3
 8000e50:	d13d      	bne.n	8000ece <GPIO_Init+0xea>
 8000e52:	792b      	ldrb	r3, [r5, #4]
 8000e54:	0077      	lsls	r7, r6, #1
 8000e56:	3b01      	subs	r3, #1
 8000e58:	b2db      	uxtb	r3, r3
 8000e5a:	4283      	cmp	r3, r0
 8000e5c:	d823      	bhi.n	8000ea6 <GPIO_Init+0xc2>
 8000e5e:	796b      	ldrb	r3, [r5, #5]
 8000e60:	4283      	cmp	r3, r0
 8000e62:	d902      	bls.n	8000e6a <GPIO_Init+0x86>
 8000e64:	1ed8      	subs	r0, r3, #3
 8000e66:	4243      	negs	r3, r0
 8000e68:	4158      	adcs	r0, r3
 8000e6a:	f7ff fe11 	bl	8000a90 <assert_param>
 8000e6e:	68a3      	ldr	r3, [r4, #8]
 8000e70:	2203      	movs	r2, #3
 8000e72:	40ba      	lsls	r2, r7
 8000e74:	4393      	bics	r3, r2
 8000e76:	60a3      	str	r3, [r4, #8]
 8000e78:	796b      	ldrb	r3, [r5, #5]
 8000e7a:	68a2      	ldr	r2, [r4, #8]
 8000e7c:	40bb      	lsls	r3, r7
 8000e7e:	4313      	orrs	r3, r2
 8000e80:	60a3      	str	r3, [r4, #8]
 8000e82:	79ab      	ldrb	r3, [r5, #6]
 8000e84:	2201      	movs	r2, #1
 8000e86:	2000      	movs	r0, #0
 8000e88:	429a      	cmp	r2, r3
 8000e8a:	4140      	adcs	r0, r0
 8000e8c:	f7ff fe00 	bl	8000a90 <assert_param>
 8000e90:	6863      	ldr	r3, [r4, #4]
 8000e92:	9a01      	ldr	r2, [sp, #4]
 8000e94:	b29b      	uxth	r3, r3
 8000e96:	4393      	bics	r3, r2
 8000e98:	80a3      	strh	r3, [r4, #4]
 8000e9a:	79ab      	ldrb	r3, [r5, #6]
 8000e9c:	6862      	ldr	r2, [r4, #4]
 8000e9e:	40b3      	lsls	r3, r6
 8000ea0:	4313      	orrs	r3, r2
 8000ea2:	b29b      	uxth	r3, r3
 8000ea4:	80a3      	strh	r3, [r4, #4]
 8000ea6:	2303      	movs	r3, #3
 8000ea8:	6822      	ldr	r2, [r4, #0]
 8000eaa:	40bb      	lsls	r3, r7
 8000eac:	43db      	mvns	r3, r3
 8000eae:	401a      	ands	r2, r3
 8000eb0:	6022      	str	r2, [r4, #0]
 8000eb2:	792a      	ldrb	r2, [r5, #4]
 8000eb4:	6821      	ldr	r1, [r4, #0]
 8000eb6:	40ba      	lsls	r2, r7
 8000eb8:	430a      	orrs	r2, r1
 8000eba:	6022      	str	r2, [r4, #0]
 8000ebc:	68e2      	ldr	r2, [r4, #12]
 8000ebe:	4013      	ands	r3, r2
 8000ec0:	79ea      	ldrb	r2, [r5, #7]
 8000ec2:	60e3      	str	r3, [r4, #12]
 8000ec4:	68e3      	ldr	r3, [r4, #12]
 8000ec6:	40ba      	lsls	r2, r7
 8000ec8:	1c17      	adds	r7, r2, #0
 8000eca:	431f      	orrs	r7, r3
 8000ecc:	60e7      	str	r7, [r4, #12]
 8000ece:	3601      	adds	r6, #1
 8000ed0:	2e10      	cmp	r6, #16
 8000ed2:	d1b6      	bne.n	8000e42 <GPIO_Init+0x5e>
 8000ed4:	bdf7      	pop	{r0, r1, r2, r4, r5, r6, r7, pc}
 8000ed6:	46c0      	nop			; (mov r8, r8)
 8000ed8:	48000400 	.word	0x48000400
 8000edc:	48000800 	.word	0x48000800
 8000ee0:	48000c00 	.word	0x48000c00
 8000ee4:	48001000 	.word	0x48001000
 8000ee8:	b7ffec00 	.word	0xb7ffec00

08000eec <GPIO_PinAFConfig>:
 8000eec:	b5f7      	push	{r0, r1, r2, r4, r5, r6, r7, lr}
 8000eee:	2390      	movs	r3, #144	; 0x90
 8000ef0:	1c04      	adds	r4, r0, #0
 8000ef2:	1c0e      	adds	r6, r1, #0
 8000ef4:	9201      	str	r2, [sp, #4]
 8000ef6:	05db      	lsls	r3, r3, #23
 8000ef8:	4298      	cmp	r0, r3
 8000efa:	d010      	beq.n	8000f1e <GPIO_PinAFConfig+0x32>
 8000efc:	4b19      	ldr	r3, [pc, #100]	; (8000f64 <GPIO_PinAFConfig+0x78>)
 8000efe:	4298      	cmp	r0, r3
 8000f00:	d00d      	beq.n	8000f1e <GPIO_PinAFConfig+0x32>
 8000f02:	4b19      	ldr	r3, [pc, #100]	; (8000f68 <GPIO_PinAFConfig+0x7c>)
 8000f04:	4298      	cmp	r0, r3
 8000f06:	d00a      	beq.n	8000f1e <GPIO_PinAFConfig+0x32>
 8000f08:	4b18      	ldr	r3, [pc, #96]	; (8000f6c <GPIO_PinAFConfig+0x80>)
 8000f0a:	4298      	cmp	r0, r3
 8000f0c:	d007      	beq.n	8000f1e <GPIO_PinAFConfig+0x32>
 8000f0e:	4b18      	ldr	r3, [pc, #96]	; (8000f70 <GPIO_PinAFConfig+0x84>)
 8000f10:	4298      	cmp	r0, r3
 8000f12:	d004      	beq.n	8000f1e <GPIO_PinAFConfig+0x32>
 8000f14:	4a17      	ldr	r2, [pc, #92]	; (8000f74 <GPIO_PinAFConfig+0x88>)
 8000f16:	1880      	adds	r0, r0, r2
 8000f18:	4243      	negs	r3, r0
 8000f1a:	4158      	adcs	r0, r3
 8000f1c:	e000      	b.n	8000f20 <GPIO_PinAFConfig+0x34>
 8000f1e:	2001      	movs	r0, #1
 8000f20:	2500      	movs	r5, #0
 8000f22:	f7ff fdb5 	bl	8000a90 <assert_param>
 8000f26:	230f      	movs	r3, #15
 8000f28:	1c28      	adds	r0, r5, #0
 8000f2a:	42b3      	cmp	r3, r6
 8000f2c:	4168      	adcs	r0, r5
 8000f2e:	f7ff fdaf 	bl	8000a90 <assert_param>
 8000f32:	9a01      	ldr	r2, [sp, #4]
 8000f34:	1c28      	adds	r0, r5, #0
 8000f36:	2707      	movs	r7, #7
 8000f38:	4297      	cmp	r7, r2
 8000f3a:	4168      	adcs	r0, r5
 8000f3c:	4037      	ands	r7, r6
 8000f3e:	08f6      	lsrs	r6, r6, #3
 8000f40:	00b6      	lsls	r6, r6, #2
 8000f42:	19a4      	adds	r4, r4, r6
 8000f44:	f7ff fda4 	bl	8000a90 <assert_param>
 8000f48:	00bf      	lsls	r7, r7, #2
 8000f4a:	6a23      	ldr	r3, [r4, #32]
 8000f4c:	220f      	movs	r2, #15
 8000f4e:	40ba      	lsls	r2, r7
 8000f50:	4393      	bics	r3, r2
 8000f52:	9a01      	ldr	r2, [sp, #4]
 8000f54:	6223      	str	r3, [r4, #32]
 8000f56:	6a23      	ldr	r3, [r4, #32]
 8000f58:	40ba      	lsls	r2, r7
 8000f5a:	1c17      	adds	r7, r2, #0
 8000f5c:	431f      	orrs	r7, r3
 8000f5e:	6227      	str	r7, [r4, #32]
 8000f60:	bdf7      	pop	{r0, r1, r2, r4, r5, r6, r7, pc}
 8000f62:	46c0      	nop			; (mov r8, r8)
 8000f64:	48000400 	.word	0x48000400
 8000f68:	48000800 	.word	0x48000800
 8000f6c:	48000c00 	.word	0x48000c00
 8000f70:	48001000 	.word	0x48001000
 8000f74:	b7ffec00 	.word	0xb7ffec00

08000f78 <TIM_TimeBaseInit>:
 8000f78:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
 8000f7a:	4e34      	ldr	r6, [pc, #208]	; (800104c <TIM_TimeBaseInit+0xd4>)
 8000f7c:	1c04      	adds	r4, r0, #0
 8000f7e:	1c0d      	adds	r5, r1, #0
 8000f80:	4f33      	ldr	r7, [pc, #204]	; (8001050 <TIM_TimeBaseInit+0xd8>)
 8000f82:	42b0      	cmp	r0, r6
 8000f84:	d019      	beq.n	8000fba <TIM_TimeBaseInit+0x42>
 8000f86:	2380      	movs	r3, #128	; 0x80
 8000f88:	05db      	lsls	r3, r3, #23
 8000f8a:	4298      	cmp	r0, r3
 8000f8c:	d015      	beq.n	8000fba <TIM_TimeBaseInit+0x42>
 8000f8e:	4b31      	ldr	r3, [pc, #196]	; (8001054 <TIM_TimeBaseInit+0xdc>)
 8000f90:	4298      	cmp	r0, r3
 8000f92:	d012      	beq.n	8000fba <TIM_TimeBaseInit+0x42>
 8000f94:	42b8      	cmp	r0, r7
 8000f96:	d010      	beq.n	8000fba <TIM_TimeBaseInit+0x42>
 8000f98:	4b2f      	ldr	r3, [pc, #188]	; (8001058 <TIM_TimeBaseInit+0xe0>)
 8000f9a:	4298      	cmp	r0, r3
 8000f9c:	d00d      	beq.n	8000fba <TIM_TimeBaseInit+0x42>
 8000f9e:	4b2f      	ldr	r3, [pc, #188]	; (800105c <TIM_TimeBaseInit+0xe4>)
 8000fa0:	4298      	cmp	r0, r3
 8000fa2:	d00a      	beq.n	8000fba <TIM_TimeBaseInit+0x42>
 8000fa4:	4b2e      	ldr	r3, [pc, #184]	; (8001060 <TIM_TimeBaseInit+0xe8>)
 8000fa6:	4298      	cmp	r0, r3
 8000fa8:	d007      	beq.n	8000fba <TIM_TimeBaseInit+0x42>
 8000faa:	4b2e      	ldr	r3, [pc, #184]	; (8001064 <TIM_TimeBaseInit+0xec>)
 8000fac:	4298      	cmp	r0, r3
 8000fae:	d004      	beq.n	8000fba <TIM_TimeBaseInit+0x42>
 8000fb0:	492d      	ldr	r1, [pc, #180]	; (8001068 <TIM_TimeBaseInit+0xf0>)
 8000fb2:	1840      	adds	r0, r0, r1
 8000fb4:	4243      	negs	r3, r0
 8000fb6:	4158      	adcs	r0, r3
 8000fb8:	e000      	b.n	8000fbc <TIM_TimeBaseInit+0x44>
 8000fba:	2001      	movs	r0, #1
 8000fbc:	f7ff fd68 	bl	8000a90 <assert_param>
 8000fc0:	886b      	ldrh	r3, [r5, #2]
 8000fc2:	2210      	movs	r2, #16
 8000fc4:	1c19      	adds	r1, r3, #0
 8000fc6:	4391      	bics	r1, r2
 8000fc8:	d101      	bne.n	8000fce <TIM_TimeBaseInit+0x56>
 8000fca:	2001      	movs	r0, #1
 8000fcc:	e007      	b.n	8000fde <TIM_TimeBaseInit+0x66>
 8000fce:	2240      	movs	r2, #64	; 0x40
 8000fd0:	1c19      	adds	r1, r3, #0
 8000fd2:	4391      	bics	r1, r2
 8000fd4:	2920      	cmp	r1, #32
 8000fd6:	d0f8      	beq.n	8000fca <TIM_TimeBaseInit+0x52>
 8000fd8:	2b40      	cmp	r3, #64	; 0x40
 8000fda:	d0f6      	beq.n	8000fca <TIM_TimeBaseInit+0x52>
 8000fdc:	2000      	movs	r0, #0
 8000fde:	f7ff fd57 	bl	8000a90 <assert_param>
 8000fe2:	892b      	ldrh	r3, [r5, #8]
 8000fe4:	4a21      	ldr	r2, [pc, #132]	; (800106c <TIM_TimeBaseInit+0xf4>)
 8000fe6:	2001      	movs	r0, #1
 8000fe8:	4213      	tst	r3, r2
 8000fea:	d003      	beq.n	8000ff4 <TIM_TimeBaseInit+0x7c>
 8000fec:	4a20      	ldr	r2, [pc, #128]	; (8001070 <TIM_TimeBaseInit+0xf8>)
 8000fee:	1898      	adds	r0, r3, r2
 8000ff0:	4243      	negs	r3, r0
 8000ff2:	4158      	adcs	r0, r3
 8000ff4:	f7ff fd4c 	bl	8000a90 <assert_param>
 8000ff8:	6823      	ldr	r3, [r4, #0]
 8000ffa:	b29b      	uxth	r3, r3
 8000ffc:	42b4      	cmp	r4, r6
 8000ffe:	d006      	beq.n	800100e <TIM_TimeBaseInit+0x96>
 8001000:	2280      	movs	r2, #128	; 0x80
 8001002:	05d2      	lsls	r2, r2, #23
 8001004:	4294      	cmp	r4, r2
 8001006:	d002      	beq.n	800100e <TIM_TimeBaseInit+0x96>
 8001008:	4a12      	ldr	r2, [pc, #72]	; (8001054 <TIM_TimeBaseInit+0xdc>)
 800100a:	4294      	cmp	r4, r2
 800100c:	d103      	bne.n	8001016 <TIM_TimeBaseInit+0x9e>
 800100e:	2270      	movs	r2, #112	; 0x70
 8001010:	4393      	bics	r3, r2
 8001012:	886a      	ldrh	r2, [r5, #2]
 8001014:	4313      	orrs	r3, r2
 8001016:	42bc      	cmp	r4, r7
 8001018:	d003      	beq.n	8001022 <TIM_TimeBaseInit+0xaa>
 800101a:	4916      	ldr	r1, [pc, #88]	; (8001074 <TIM_TimeBaseInit+0xfc>)
 800101c:	892a      	ldrh	r2, [r5, #8]
 800101e:	400b      	ands	r3, r1
 8001020:	4313      	orrs	r3, r2
 8001022:	8023      	strh	r3, [r4, #0]
 8001024:	686b      	ldr	r3, [r5, #4]
 8001026:	62e3      	str	r3, [r4, #44]	; 0x2c
 8001028:	882b      	ldrh	r3, [r5, #0]
 800102a:	8523      	strh	r3, [r4, #40]	; 0x28
 800102c:	42b4      	cmp	r4, r6
 800102e:	d008      	beq.n	8001042 <TIM_TimeBaseInit+0xca>
 8001030:	4b0b      	ldr	r3, [pc, #44]	; (8001060 <TIM_TimeBaseInit+0xe8>)
 8001032:	429c      	cmp	r4, r3
 8001034:	d005      	beq.n	8001042 <TIM_TimeBaseInit+0xca>
 8001036:	4b0b      	ldr	r3, [pc, #44]	; (8001064 <TIM_TimeBaseInit+0xec>)
 8001038:	429c      	cmp	r4, r3
 800103a:	d002      	beq.n	8001042 <TIM_TimeBaseInit+0xca>
 800103c:	4b0e      	ldr	r3, [pc, #56]	; (8001078 <TIM_TimeBaseInit+0x100>)
 800103e:	429c      	cmp	r4, r3
 8001040:	d101      	bne.n	8001046 <TIM_TimeBaseInit+0xce>
 8001042:	7aab      	ldrb	r3, [r5, #10]
 8001044:	8623      	strh	r3, [r4, #48]	; 0x30
 8001046:	2301      	movs	r3, #1
 8001048:	82a3      	strh	r3, [r4, #20]
 800104a:	bdf8      	pop	{r3, r4, r5, r6, r7, pc}
 800104c:	40012c00 	.word	0x40012c00
 8001050:	40001000 	.word	0x40001000
 8001054:	40000400 	.word	0x40000400
 8001058:	40001400 	.word	0x40001400
 800105c:	40002000 	.word	0x40002000
 8001060:	40014000 	.word	0x40014000
 8001064:	40014400 	.word	0x40014400
 8001068:	bffeb800 	.word	0xbffeb800
 800106c:	fffffeff 	.word	0xfffffeff
 8001070:	fffffe00 	.word	0xfffffe00
 8001074:	fffffcff 	.word	0xfffffcff
 8001078:	40014800 	.word	0x40014800

0800107c <TIM_Cmd>:
 800107c:	4b19      	ldr	r3, [pc, #100]	; (80010e4 <TIM_Cmd+0x68>)
 800107e:	b570      	push	{r4, r5, r6, lr}
 8001080:	1c04      	adds	r4, r0, #0
 8001082:	1c0e      	adds	r6, r1, #0
 8001084:	4298      	cmp	r0, r3
 8001086:	d01a      	beq.n	80010be <TIM_Cmd+0x42>
 8001088:	2380      	movs	r3, #128	; 0x80
 800108a:	05db      	lsls	r3, r3, #23
 800108c:	4298      	cmp	r0, r3
 800108e:	d016      	beq.n	80010be <TIM_Cmd+0x42>
 8001090:	4b15      	ldr	r3, [pc, #84]	; (80010e8 <TIM_Cmd+0x6c>)
 8001092:	4298      	cmp	r0, r3
 8001094:	d013      	beq.n	80010be <TIM_Cmd+0x42>
 8001096:	4b15      	ldr	r3, [pc, #84]	; (80010ec <TIM_Cmd+0x70>)
 8001098:	4298      	cmp	r0, r3
 800109a:	d010      	beq.n	80010be <TIM_Cmd+0x42>
 800109c:	4b14      	ldr	r3, [pc, #80]	; (80010f0 <TIM_Cmd+0x74>)
 800109e:	4298      	cmp	r0, r3
 80010a0:	d00d      	beq.n	80010be <TIM_Cmd+0x42>
 80010a2:	4b14      	ldr	r3, [pc, #80]	; (80010f4 <TIM_Cmd+0x78>)
 80010a4:	4298      	cmp	r0, r3
 80010a6:	d00a      	beq.n	80010be <TIM_Cmd+0x42>
 80010a8:	4b13      	ldr	r3, [pc, #76]	; (80010f8 <TIM_Cmd+0x7c>)
 80010aa:	4298      	cmp	r0, r3
 80010ac:	d007      	beq.n	80010be <TIM_Cmd+0x42>
 80010ae:	4b13      	ldr	r3, [pc, #76]	; (80010fc <TIM_Cmd+0x80>)
 80010b0:	4298      	cmp	r0, r3
 80010b2:	d004      	beq.n	80010be <TIM_Cmd+0x42>
 80010b4:	4b12      	ldr	r3, [pc, #72]	; (8001100 <TIM_Cmd+0x84>)
 80010b6:	18c0      	adds	r0, r0, r3
 80010b8:	4243      	negs	r3, r0
 80010ba:	4158      	adcs	r0, r3
 80010bc:	e000      	b.n	80010c0 <TIM_Cmd+0x44>
 80010be:	2001      	movs	r0, #1
 80010c0:	f7ff fce6 	bl	8000a90 <assert_param>
 80010c4:	2501      	movs	r5, #1
 80010c6:	2000      	movs	r0, #0
 80010c8:	42b5      	cmp	r5, r6
 80010ca:	4140      	adcs	r0, r0
 80010cc:	f7ff fce0 	bl	8000a90 <assert_param>
 80010d0:	6823      	ldr	r3, [r4, #0]
 80010d2:	b29b      	uxth	r3, r3
 80010d4:	2e00      	cmp	r6, #0
 80010d6:	d002      	beq.n	80010de <TIM_Cmd+0x62>
 80010d8:	431d      	orrs	r5, r3
 80010da:	8025      	strh	r5, [r4, #0]
 80010dc:	e001      	b.n	80010e2 <TIM_Cmd+0x66>
 80010de:	43ab      	bics	r3, r5
 80010e0:	8023      	strh	r3, [r4, #0]
 80010e2:	bd70      	pop	{r4, r5, r6, pc}
 80010e4:	40012c00 	.word	0x40012c00
 80010e8:	40000400 	.word	0x40000400
 80010ec:	40001000 	.word	0x40001000
 80010f0:	40001400 	.word	0x40001400
 80010f4:	40002000 	.word	0x40002000
 80010f8:	40014000 	.word	0x40014000
 80010fc:	40014400 	.word	0x40014400
 8001100:	bffeb800 	.word	0xbffeb800

08001104 <TIM_CtrlPWMOutputs>:
 8001104:	b538      	push	{r3, r4, r5, lr}
 8001106:	4b13      	ldr	r3, [pc, #76]	; (8001154 <TIM_CtrlPWMOutputs+0x50>)
 8001108:	1c04      	adds	r4, r0, #0
 800110a:	1c0d      	adds	r5, r1, #0
 800110c:	4298      	cmp	r0, r3
 800110e:	d00a      	beq.n	8001126 <TIM_CtrlPWMOutputs+0x22>
 8001110:	4b11      	ldr	r3, [pc, #68]	; (8001158 <TIM_CtrlPWMOutputs+0x54>)
 8001112:	4298      	cmp	r0, r3
 8001114:	d007      	beq.n	8001126 <TIM_CtrlPWMOutputs+0x22>
 8001116:	4b11      	ldr	r3, [pc, #68]	; (800115c <TIM_CtrlPWMOutputs+0x58>)
 8001118:	4298      	cmp	r0, r3
 800111a:	d004      	beq.n	8001126 <TIM_CtrlPWMOutputs+0x22>
 800111c:	4b10      	ldr	r3, [pc, #64]	; (8001160 <TIM_CtrlPWMOutputs+0x5c>)
 800111e:	18c0      	adds	r0, r0, r3
 8001120:	4243      	negs	r3, r0
 8001122:	4158      	adcs	r0, r3
 8001124:	e000      	b.n	8001128 <TIM_CtrlPWMOutputs+0x24>
 8001126:	2001      	movs	r0, #1
 8001128:	f7ff fcb2 	bl	8000a90 <assert_param>
 800112c:	2301      	movs	r3, #1
 800112e:	2000      	movs	r0, #0
 8001130:	42ab      	cmp	r3, r5
 8001132:	4140      	adcs	r0, r0
 8001134:	f7ff fcac 	bl	8000a90 <assert_param>
 8001138:	1da3      	adds	r3, r4, #6
 800113a:	2d00      	cmp	r5, #0
 800113c:	d004      	beq.n	8001148 <TIM_CtrlPWMOutputs+0x44>
 800113e:	6c61      	ldr	r1, [r4, #68]	; 0x44
 8001140:	4a08      	ldr	r2, [pc, #32]	; (8001164 <TIM_CtrlPWMOutputs+0x60>)
 8001142:	430a      	orrs	r2, r1
 8001144:	b292      	uxth	r2, r2
 8001146:	e002      	b.n	800114e <TIM_CtrlPWMOutputs+0x4a>
 8001148:	6c62      	ldr	r2, [r4, #68]	; 0x44
 800114a:	0452      	lsls	r2, r2, #17
 800114c:	0c52      	lsrs	r2, r2, #17
 800114e:	87da      	strh	r2, [r3, #62]	; 0x3e
 8001150:	bd38      	pop	{r3, r4, r5, pc}
 8001152:	46c0      	nop			; (mov r8, r8)
 8001154:	40012c00 	.word	0x40012c00
 8001158:	40014000 	.word	0x40014000
 800115c:	40014400 	.word	0x40014400
 8001160:	bffeb800 	.word	0xbffeb800
 8001164:	ffff8000 	.word	0xffff8000

08001168 <TIM_OC1Init>:
 8001168:	b5f7      	push	{r0, r1, r2, r4, r5, r6, r7, lr}
 800116a:	1c0d      	adds	r5, r1, #0
 800116c:	4944      	ldr	r1, [pc, #272]	; (8001280 <TIM_OC1Init+0x118>)
 800116e:	1e04      	subs	r4, r0, #0
 8001170:	428c      	cmp	r4, r1
 8001172:	d014      	beq.n	800119e <TIM_OC1Init+0x36>
 8001174:	2380      	movs	r3, #128	; 0x80
 8001176:	05db      	lsls	r3, r3, #23
 8001178:	4298      	cmp	r0, r3
 800117a:	d010      	beq.n	800119e <TIM_OC1Init+0x36>
 800117c:	4b41      	ldr	r3, [pc, #260]	; (8001284 <TIM_OC1Init+0x11c>)
 800117e:	4298      	cmp	r0, r3
 8001180:	d00d      	beq.n	800119e <TIM_OC1Init+0x36>
 8001182:	4b41      	ldr	r3, [pc, #260]	; (8001288 <TIM_OC1Init+0x120>)
 8001184:	4298      	cmp	r0, r3
 8001186:	d00a      	beq.n	800119e <TIM_OC1Init+0x36>
 8001188:	4b40      	ldr	r3, [pc, #256]	; (800128c <TIM_OC1Init+0x124>)
 800118a:	4298      	cmp	r0, r3
 800118c:	d007      	beq.n	800119e <TIM_OC1Init+0x36>
 800118e:	4b40      	ldr	r3, [pc, #256]	; (8001290 <TIM_OC1Init+0x128>)
 8001190:	4298      	cmp	r0, r3
 8001192:	d004      	beq.n	800119e <TIM_OC1Init+0x36>
 8001194:	4b3f      	ldr	r3, [pc, #252]	; (8001294 <TIM_OC1Init+0x12c>)
 8001196:	18c0      	adds	r0, r0, r3
 8001198:	4243      	negs	r3, r0
 800119a:	4158      	adcs	r0, r3
 800119c:	e000      	b.n	80011a0 <TIM_OC1Init+0x38>
 800119e:	2001      	movs	r0, #1
 80011a0:	f7ff fc76 	bl	8000a90 <assert_param>
 80011a4:	882b      	ldrh	r3, [r5, #0]
 80011a6:	2210      	movs	r2, #16
 80011a8:	1c19      	adds	r1, r3, #0
 80011aa:	4391      	bics	r1, r2
 80011ac:	1c0a      	adds	r2, r1, #0
 80011ae:	2130      	movs	r1, #48	; 0x30
 80011b0:	438b      	bics	r3, r1
 80011b2:	d101      	bne.n	80011b8 <TIM_OC1Init+0x50>
 80011b4:	2001      	movs	r0, #1
 80011b6:	e002      	b.n	80011be <TIM_OC1Init+0x56>
 80011b8:	2a60      	cmp	r2, #96	; 0x60
 80011ba:	d0fb      	beq.n	80011b4 <TIM_OC1Init+0x4c>
 80011bc:	2000      	movs	r0, #0
 80011be:	f7ff fc67 	bl	8000a90 <assert_param>
 80011c2:	886b      	ldrh	r3, [r5, #2]
 80011c4:	2701      	movs	r7, #1
 80011c6:	2000      	movs	r0, #0
 80011c8:	429f      	cmp	r7, r3
 80011ca:	4140      	adcs	r0, r0
 80011cc:	f7ff fc60 	bl	8000a90 <assert_param>
 80011d0:	89a8      	ldrh	r0, [r5, #12]
 80011d2:	2602      	movs	r6, #2
 80011d4:	43b0      	bics	r0, r6
 80011d6:	4243      	negs	r3, r0
 80011d8:	4158      	adcs	r0, r3
 80011da:	f7ff fc59 	bl	8000a90 <assert_param>
 80011de:	6a23      	ldr	r3, [r4, #32]
 80011e0:	2273      	movs	r2, #115	; 0x73
 80011e2:	b29b      	uxth	r3, r3
 80011e4:	43bb      	bics	r3, r7
 80011e6:	8423      	strh	r3, [r4, #32]
 80011e8:	6a23      	ldr	r3, [r4, #32]
 80011ea:	6867      	ldr	r7, [r4, #4]
 80011ec:	69a1      	ldr	r1, [r4, #24]
 80011ee:	b29b      	uxth	r3, r3
 80011f0:	b289      	uxth	r1, r1
 80011f2:	4391      	bics	r1, r2
 80011f4:	882a      	ldrh	r2, [r5, #0]
 80011f6:	43b3      	bics	r3, r6
 80011f8:	4311      	orrs	r1, r2
 80011fa:	886e      	ldrh	r6, [r5, #2]
 80011fc:	89aa      	ldrh	r2, [r5, #12]
 80011fe:	b2bf      	uxth	r7, r7
 8001200:	4316      	orrs	r6, r2
 8001202:	431e      	orrs	r6, r3
 8001204:	4b1e      	ldr	r3, [pc, #120]	; (8001280 <TIM_OC1Init+0x118>)
 8001206:	9101      	str	r1, [sp, #4]
 8001208:	429c      	cmp	r4, r3
 800120a:	d008      	beq.n	800121e <TIM_OC1Init+0xb6>
 800120c:	4b1f      	ldr	r3, [pc, #124]	; (800128c <TIM_OC1Init+0x124>)
 800120e:	429c      	cmp	r4, r3
 8001210:	d005      	beq.n	800121e <TIM_OC1Init+0xb6>
 8001212:	4b1f      	ldr	r3, [pc, #124]	; (8001290 <TIM_OC1Init+0x128>)
 8001214:	429c      	cmp	r4, r3
 8001216:	d002      	beq.n	800121e <TIM_OC1Init+0xb6>
 8001218:	4b1f      	ldr	r3, [pc, #124]	; (8001298 <TIM_OC1Init+0x130>)
 800121a:	429c      	cmp	r4, r3
 800121c:	d129      	bne.n	8001272 <TIM_OC1Init+0x10a>
 800121e:	88a8      	ldrh	r0, [r5, #4]
 8001220:	2104      	movs	r1, #4
 8001222:	4388      	bics	r0, r1
 8001224:	4243      	negs	r3, r0
 8001226:	4158      	adcs	r0, r3
 8001228:	f7ff fc32 	bl	8000a90 <assert_param>
 800122c:	89e8      	ldrh	r0, [r5, #14]
 800122e:	2308      	movs	r3, #8
 8001230:	4398      	bics	r0, r3
 8001232:	4243      	negs	r3, r0
 8001234:	4158      	adcs	r0, r3
 8001236:	f7ff fc2b 	bl	8000a90 <assert_param>
 800123a:	4b18      	ldr	r3, [pc, #96]	; (800129c <TIM_OC1Init+0x134>)
 800123c:	8a68      	ldrh	r0, [r5, #18]
 800123e:	4018      	ands	r0, r3
 8001240:	4243      	negs	r3, r0
 8001242:	4158      	adcs	r0, r3
 8001244:	f7ff fc24 	bl	8000a90 <assert_param>
 8001248:	4b15      	ldr	r3, [pc, #84]	; (80012a0 <TIM_OC1Init+0x138>)
 800124a:	8a28      	ldrh	r0, [r5, #16]
 800124c:	4018      	ands	r0, r3
 800124e:	4243      	negs	r3, r0
 8001250:	4158      	adcs	r0, r3
 8001252:	f7ff fc1d 	bl	8000a90 <assert_param>
 8001256:	89eb      	ldrh	r3, [r5, #14]
 8001258:	2108      	movs	r1, #8
 800125a:	438e      	bics	r6, r1
 800125c:	431e      	orrs	r6, r3
 800125e:	2304      	movs	r3, #4
 8001260:	439e      	bics	r6, r3
 8001262:	88ab      	ldrh	r3, [r5, #4]
 8001264:	8a6a      	ldrh	r2, [r5, #18]
 8001266:	431e      	orrs	r6, r3
 8001268:	4b0e      	ldr	r3, [pc, #56]	; (80012a4 <TIM_OC1Init+0x13c>)
 800126a:	401f      	ands	r7, r3
 800126c:	8a2b      	ldrh	r3, [r5, #16]
 800126e:	4313      	orrs	r3, r2
 8001270:	431f      	orrs	r7, r3
 8001272:	68ab      	ldr	r3, [r5, #8]
 8001274:	9901      	ldr	r1, [sp, #4]
 8001276:	80a7      	strh	r7, [r4, #4]
 8001278:	8321      	strh	r1, [r4, #24]
 800127a:	6363      	str	r3, [r4, #52]	; 0x34
 800127c:	8426      	strh	r6, [r4, #32]
 800127e:	bdf7      	pop	{r0, r1, r2, r4, r5, r6, r7, pc}
 8001280:	40012c00 	.word	0x40012c00
 8001284:	40000400 	.word	0x40000400
 8001288:	40002000 	.word	0x40002000
 800128c:	40014000 	.word	0x40014000
 8001290:	40014400 	.word	0x40014400
 8001294:	bffeb800 	.word	0xbffeb800
 8001298:	40014800 	.word	0x40014800
 800129c:	fffffdff 	.word	0xfffffdff
 80012a0:	fffffeff 	.word	0xfffffeff
 80012a4:	fffffcff 	.word	0xfffffcff

080012a8 <TIM_ITConfig>:
 80012a8:	4b1f      	ldr	r3, [pc, #124]	; (8001328 <TIM_ITConfig+0x80>)
 80012aa:	b570      	push	{r4, r5, r6, lr}
 80012ac:	1c04      	adds	r4, r0, #0
 80012ae:	1c0d      	adds	r5, r1, #0
 80012b0:	1c16      	adds	r6, r2, #0
 80012b2:	4298      	cmp	r0, r3
 80012b4:	d01a      	beq.n	80012ec <TIM_ITConfig+0x44>
 80012b6:	2380      	movs	r3, #128	; 0x80
 80012b8:	05db      	lsls	r3, r3, #23
 80012ba:	4298      	cmp	r0, r3
 80012bc:	d016      	beq.n	80012ec <TIM_ITConfig+0x44>
 80012be:	4b1b      	ldr	r3, [pc, #108]	; (800132c <TIM_ITConfig+0x84>)
 80012c0:	4298      	cmp	r0, r3
 80012c2:	d013      	beq.n	80012ec <TIM_ITConfig+0x44>
 80012c4:	4b1a      	ldr	r3, [pc, #104]	; (8001330 <TIM_ITConfig+0x88>)
 80012c6:	4298      	cmp	r0, r3
 80012c8:	d010      	beq.n	80012ec <TIM_ITConfig+0x44>
 80012ca:	4b1a      	ldr	r3, [pc, #104]	; (8001334 <TIM_ITConfig+0x8c>)
 80012cc:	4298      	cmp	r0, r3
 80012ce:	d00d      	beq.n	80012ec <TIM_ITConfig+0x44>
 80012d0:	4b19      	ldr	r3, [pc, #100]	; (8001338 <TIM_ITConfig+0x90>)
 80012d2:	4298      	cmp	r0, r3
 80012d4:	d00a      	beq.n	80012ec <TIM_ITConfig+0x44>
 80012d6:	4b19      	ldr	r3, [pc, #100]	; (800133c <TIM_ITConfig+0x94>)
 80012d8:	4298      	cmp	r0, r3
 80012da:	d007      	beq.n	80012ec <TIM_ITConfig+0x44>
 80012dc:	4b18      	ldr	r3, [pc, #96]	; (8001340 <TIM_ITConfig+0x98>)
 80012de:	4298      	cmp	r0, r3
 80012e0:	d004      	beq.n	80012ec <TIM_ITConfig+0x44>
 80012e2:	4a18      	ldr	r2, [pc, #96]	; (8001344 <TIM_ITConfig+0x9c>)
 80012e4:	1880      	adds	r0, r0, r2
 80012e6:	4243      	negs	r3, r0
 80012e8:	4158      	adcs	r0, r3
 80012ea:	e000      	b.n	80012ee <TIM_ITConfig+0x46>
 80012ec:	2001      	movs	r0, #1
 80012ee:	f7ff fbcf 	bl	8000a90 <assert_param>
 80012f2:	23ff      	movs	r3, #255	; 0xff
 80012f4:	1c2a      	adds	r2, r5, #0
 80012f6:	2000      	movs	r0, #0
 80012f8:	439a      	bics	r2, r3
 80012fa:	4282      	cmp	r2, r0
 80012fc:	d102      	bne.n	8001304 <TIM_ITConfig+0x5c>
 80012fe:	1c28      	adds	r0, r5, #0
 8001300:	1e43      	subs	r3, r0, #1
 8001302:	4198      	sbcs	r0, r3
 8001304:	f7ff fbc4 	bl	8000a90 <assert_param>
 8001308:	2301      	movs	r3, #1
 800130a:	2000      	movs	r0, #0
 800130c:	42b3      	cmp	r3, r6
 800130e:	4140      	adcs	r0, r0
 8001310:	f7ff fbbe 	bl	8000a90 <assert_param>
 8001314:	68e3      	ldr	r3, [r4, #12]
 8001316:	b29b      	uxth	r3, r3
 8001318:	2e00      	cmp	r6, #0
 800131a:	d002      	beq.n	8001322 <TIM_ITConfig+0x7a>
 800131c:	431d      	orrs	r5, r3
 800131e:	81a5      	strh	r5, [r4, #12]
 8001320:	e001      	b.n	8001326 <TIM_ITConfig+0x7e>
 8001322:	43ab      	bics	r3, r5
 8001324:	81a3      	strh	r3, [r4, #12]
 8001326:	bd70      	pop	{r4, r5, r6, pc}
 8001328:	40012c00 	.word	0x40012c00
 800132c:	40000400 	.word	0x40000400
 8001330:	40001000 	.word	0x40001000
 8001334:	40001400 	.word	0x40001400
 8001338:	40002000 	.word	0x40002000
 800133c:	40014000 	.word	0x40014000
 8001340:	40014400 	.word	0x40014400
 8001344:	bffeb800 	.word	0xbffeb800

08001348 <USART_Init>:
 8001348:	b5f0      	push	{r4, r5, r6, r7, lr}
 800134a:	4e53      	ldr	r6, [pc, #332]	; (8001498 <USART_Init+0x150>)
 800134c:	b08b      	sub	sp, #44	; 0x2c
 800134e:	1c04      	adds	r4, r0, #0
 8001350:	1c0d      	adds	r5, r1, #0
 8001352:	42b0      	cmp	r0, r6
 8001354:	d016      	beq.n	8001384 <USART_Init+0x3c>
 8001356:	4b51      	ldr	r3, [pc, #324]	; (800149c <USART_Init+0x154>)
 8001358:	4298      	cmp	r0, r3
 800135a:	d013      	beq.n	8001384 <USART_Init+0x3c>
 800135c:	4b50      	ldr	r3, [pc, #320]	; (80014a0 <USART_Init+0x158>)
 800135e:	4298      	cmp	r0, r3
 8001360:	d010      	beq.n	8001384 <USART_Init+0x3c>
 8001362:	4b50      	ldr	r3, [pc, #320]	; (80014a4 <USART_Init+0x15c>)
 8001364:	4298      	cmp	r0, r3
 8001366:	d00d      	beq.n	8001384 <USART_Init+0x3c>
 8001368:	4b4f      	ldr	r3, [pc, #316]	; (80014a8 <USART_Init+0x160>)
 800136a:	4298      	cmp	r0, r3
 800136c:	d00a      	beq.n	8001384 <USART_Init+0x3c>
 800136e:	4b4f      	ldr	r3, [pc, #316]	; (80014ac <USART_Init+0x164>)
 8001370:	4298      	cmp	r0, r3
 8001372:	d007      	beq.n	8001384 <USART_Init+0x3c>
 8001374:	4b4e      	ldr	r3, [pc, #312]	; (80014b0 <USART_Init+0x168>)
 8001376:	4298      	cmp	r0, r3
 8001378:	d004      	beq.n	8001384 <USART_Init+0x3c>
 800137a:	494e      	ldr	r1, [pc, #312]	; (80014b4 <USART_Init+0x16c>)
 800137c:	1840      	adds	r0, r0, r1
 800137e:	4243      	negs	r3, r0
 8001380:	4158      	adcs	r0, r3
 8001382:	e000      	b.n	8001386 <USART_Init+0x3e>
 8001384:	2001      	movs	r0, #1
 8001386:	f7ff fb83 	bl	8000a90 <assert_param>
 800138a:	682b      	ldr	r3, [r5, #0]
 800138c:	4a4a      	ldr	r2, [pc, #296]	; (80014b8 <USART_Init+0x170>)
 800138e:	3b01      	subs	r3, #1
 8001390:	2000      	movs	r0, #0
 8001392:	429a      	cmp	r2, r3
 8001394:	4140      	adcs	r0, r0
 8001396:	f7ff fb7b 	bl	8000a90 <assert_param>
 800139a:	686b      	ldr	r3, [r5, #4]
 800139c:	4a47      	ldr	r2, [pc, #284]	; (80014bc <USART_Init+0x174>)
 800139e:	2001      	movs	r0, #1
 80013a0:	4213      	tst	r3, r2
 80013a2:	d003      	beq.n	80013ac <USART_Init+0x64>
 80013a4:	4a46      	ldr	r2, [pc, #280]	; (80014c0 <USART_Init+0x178>)
 80013a6:	1898      	adds	r0, r3, r2
 80013a8:	4243      	negs	r3, r0
 80013aa:	4158      	adcs	r0, r3
 80013ac:	f7ff fb70 	bl	8000a90 <assert_param>
 80013b0:	68ab      	ldr	r3, [r5, #8]
 80013b2:	4a44      	ldr	r2, [pc, #272]	; (80014c4 <USART_Init+0x17c>)
 80013b4:	2001      	movs	r0, #1
 80013b6:	4213      	tst	r3, r2
 80013b8:	d003      	beq.n	80013c2 <USART_Init+0x7a>
 80013ba:	4943      	ldr	r1, [pc, #268]	; (80014c8 <USART_Init+0x180>)
 80013bc:	1858      	adds	r0, r3, r1
 80013be:	4243      	negs	r3, r0
 80013c0:	4158      	adcs	r0, r3
 80013c2:	f7ff fb65 	bl	8000a90 <assert_param>
 80013c6:	68eb      	ldr	r3, [r5, #12]
 80013c8:	4a40      	ldr	r2, [pc, #256]	; (80014cc <USART_Init+0x184>)
 80013ca:	2001      	movs	r0, #1
 80013cc:	4213      	tst	r3, r2
 80013ce:	d003      	beq.n	80013d8 <USART_Init+0x90>
 80013d0:	4a3f      	ldr	r2, [pc, #252]	; (80014d0 <USART_Init+0x188>)
 80013d2:	1898      	adds	r0, r3, r2
 80013d4:	4243      	negs	r3, r0
 80013d6:	4158      	adcs	r0, r3
 80013d8:	f7ff fb5a 	bl	8000a90 <assert_param>
 80013dc:	692b      	ldr	r3, [r5, #16]
 80013de:	220c      	movs	r2, #12
 80013e0:	1c19      	adds	r1, r3, #0
 80013e2:	2000      	movs	r0, #0
 80013e4:	4391      	bics	r1, r2
 80013e6:	4281      	cmp	r1, r0
 80013e8:	d102      	bne.n	80013f0 <USART_Init+0xa8>
 80013ea:	1c18      	adds	r0, r3, #0
 80013ec:	1e43      	subs	r3, r0, #1
 80013ee:	4198      	sbcs	r0, r3
 80013f0:	f7ff fb4e 	bl	8000a90 <assert_param>
 80013f4:	4f37      	ldr	r7, [pc, #220]	; (80014d4 <USART_Init+0x18c>)
 80013f6:	6968      	ldr	r0, [r5, #20]
 80013f8:	4038      	ands	r0, r7
 80013fa:	4243      	negs	r3, r0
 80013fc:	4158      	adcs	r0, r3
 80013fe:	f7ff fb47 	bl	8000a90 <assert_param>
 8001402:	6823      	ldr	r3, [r4, #0]
 8001404:	2201      	movs	r2, #1
 8001406:	4393      	bics	r3, r2
 8001408:	6023      	str	r3, [r4, #0]
 800140a:	6862      	ldr	r2, [r4, #4]
 800140c:	4b32      	ldr	r3, [pc, #200]	; (80014d8 <USART_Init+0x190>)
 800140e:	6869      	ldr	r1, [r5, #4]
 8001410:	4013      	ands	r3, r2
 8001412:	68aa      	ldr	r2, [r5, #8]
 8001414:	4668      	mov	r0, sp
 8001416:	4313      	orrs	r3, r2
 8001418:	6063      	str	r3, [r4, #4]
 800141a:	6822      	ldr	r2, [r4, #0]
 800141c:	4b2f      	ldr	r3, [pc, #188]	; (80014dc <USART_Init+0x194>)
 800141e:	401a      	ands	r2, r3
 8001420:	68eb      	ldr	r3, [r5, #12]
 8001422:	430b      	orrs	r3, r1
 8001424:	6929      	ldr	r1, [r5, #16]
 8001426:	430b      	orrs	r3, r1
 8001428:	4313      	orrs	r3, r2
 800142a:	6023      	str	r3, [r4, #0]
 800142c:	68a3      	ldr	r3, [r4, #8]
 800142e:	696a      	ldr	r2, [r5, #20]
 8001430:	401f      	ands	r7, r3
 8001432:	4317      	orrs	r7, r2
 8001434:	60a7      	str	r7, [r4, #8]
 8001436:	f000 fb3d 	bl	8001ab4 <RCC_GetClocksFreq>
 800143a:	42b4      	cmp	r4, r6
 800143c:	d101      	bne.n	8001442 <USART_Init+0xfa>
 800143e:	9e06      	ldr	r6, [sp, #24]
 8001440:	e00a      	b.n	8001458 <USART_Init+0x110>
 8001442:	4b16      	ldr	r3, [pc, #88]	; (800149c <USART_Init+0x154>)
 8001444:	429c      	cmp	r4, r3
 8001446:	d101      	bne.n	800144c <USART_Init+0x104>
 8001448:	9e07      	ldr	r6, [sp, #28]
 800144a:	e005      	b.n	8001458 <USART_Init+0x110>
 800144c:	4b14      	ldr	r3, [pc, #80]	; (80014a0 <USART_Init+0x158>)
 800144e:	429c      	cmp	r4, r3
 8001450:	d101      	bne.n	8001456 <USART_Init+0x10e>
 8001452:	9e08      	ldr	r6, [sp, #32]
 8001454:	e000      	b.n	8001458 <USART_Init+0x110>
 8001456:	9e02      	ldr	r6, [sp, #8]
 8001458:	6823      	ldr	r3, [r4, #0]
 800145a:	682f      	ldr	r7, [r5, #0]
 800145c:	0419      	lsls	r1, r3, #16
 800145e:	d500      	bpl.n	8001462 <USART_Init+0x11a>
 8001460:	0076      	lsls	r6, r6, #1
 8001462:	1c39      	adds	r1, r7, #0
 8001464:	1c30      	adds	r0, r6, #0
 8001466:	f000 fd15 	bl	8001e94 <__aeabi_uidiv>
 800146a:	1c39      	adds	r1, r7, #0
 800146c:	1c05      	adds	r5, r0, #0
 800146e:	1c30      	adds	r0, r6, #0
 8001470:	f000 fd54 	bl	8001f1c <__aeabi_uidivmod>
 8001474:	087f      	lsrs	r7, r7, #1
 8001476:	2300      	movs	r3, #0
 8001478:	42b9      	cmp	r1, r7
 800147a:	415b      	adcs	r3, r3
 800147c:	18ed      	adds	r5, r5, r3
 800147e:	6823      	ldr	r3, [r4, #0]
 8001480:	041a      	lsls	r2, r3, #16
 8001482:	d504      	bpl.n	800148e <USART_Init+0x146>
 8001484:	4a16      	ldr	r2, [pc, #88]	; (80014e0 <USART_Init+0x198>)
 8001486:	072b      	lsls	r3, r5, #28
 8001488:	0f5b      	lsrs	r3, r3, #29
 800148a:	4015      	ands	r5, r2
 800148c:	431d      	orrs	r5, r3
 800148e:	b2ad      	uxth	r5, r5
 8001490:	81a5      	strh	r5, [r4, #12]
 8001492:	b00b      	add	sp, #44	; 0x2c
 8001494:	bdf0      	pop	{r4, r5, r6, r7, pc}
 8001496:	46c0      	nop			; (mov r8, r8)
 8001498:	40013800 	.word	0x40013800
 800149c:	40004400 	.word	0x40004400
 80014a0:	40004800 	.word	0x40004800
 80014a4:	40004c00 	.word	0x40004c00
 80014a8:	40005000 	.word	0x40005000
 80014ac:	40011400 	.word	0x40011400
 80014b0:	40011800 	.word	0x40011800
 80014b4:	bffee400 	.word	0xbffee400
 80014b8:	005b8d7f 	.word	0x005b8d7f
 80014bc:	ffffefff 	.word	0xffffefff
 80014c0:	effff000 	.word	0xeffff000
 80014c4:	ffffdfff 	.word	0xffffdfff
 80014c8:	ffffd000 	.word	0xffffd000
 80014cc:	fffffbff 	.word	0xfffffbff
 80014d0:	fffffa00 	.word	0xfffffa00
 80014d4:	fffffcff 	.word	0xfffffcff
 80014d8:	ffffcfff 	.word	0xffffcfff
 80014dc:	ffffe9f3 	.word	0xffffe9f3
 80014e0:	0000fff0 	.word	0x0000fff0

080014e4 <USART_Cmd>:
 80014e4:	4b17      	ldr	r3, [pc, #92]	; (8001544 <USART_Cmd+0x60>)
 80014e6:	b570      	push	{r4, r5, r6, lr}
 80014e8:	1c04      	adds	r4, r0, #0
 80014ea:	1c0e      	adds	r6, r1, #0
 80014ec:	4298      	cmp	r0, r3
 80014ee:	d016      	beq.n	800151e <USART_Cmd+0x3a>
 80014f0:	4b15      	ldr	r3, [pc, #84]	; (8001548 <USART_Cmd+0x64>)
 80014f2:	4298      	cmp	r0, r3
 80014f4:	d013      	beq.n	800151e <USART_Cmd+0x3a>
 80014f6:	4b15      	ldr	r3, [pc, #84]	; (800154c <USART_Cmd+0x68>)
 80014f8:	4298      	cmp	r0, r3
 80014fa:	d010      	beq.n	800151e <USART_Cmd+0x3a>
 80014fc:	4b14      	ldr	r3, [pc, #80]	; (8001550 <USART_Cmd+0x6c>)
 80014fe:	4298      	cmp	r0, r3
 8001500:	d00d      	beq.n	800151e <USART_Cmd+0x3a>
 8001502:	4b14      	ldr	r3, [pc, #80]	; (8001554 <USART_Cmd+0x70>)
 8001504:	4298      	cmp	r0, r3
 8001506:	d00a      	beq.n	800151e <USART_Cmd+0x3a>
 8001508:	4b13      	ldr	r3, [pc, #76]	; (8001558 <USART_Cmd+0x74>)
 800150a:	4298      	cmp	r0, r3
 800150c:	d007      	beq.n	800151e <USART_Cmd+0x3a>
 800150e:	4b13      	ldr	r3, [pc, #76]	; (800155c <USART_Cmd+0x78>)
 8001510:	4298      	cmp	r0, r3
 8001512:	d004      	beq.n	800151e <USART_Cmd+0x3a>
 8001514:	4b12      	ldr	r3, [pc, #72]	; (8001560 <USART_Cmd+0x7c>)
 8001516:	18c0      	adds	r0, r0, r3
 8001518:	4243      	negs	r3, r0
 800151a:	4158      	adcs	r0, r3
 800151c:	e000      	b.n	8001520 <USART_Cmd+0x3c>
 800151e:	2001      	movs	r0, #1
 8001520:	f7ff fab6 	bl	8000a90 <assert_param>
 8001524:	2501      	movs	r5, #1
 8001526:	2000      	movs	r0, #0
 8001528:	42b5      	cmp	r5, r6
 800152a:	4140      	adcs	r0, r0
 800152c:	f7ff fab0 	bl	8000a90 <assert_param>
 8001530:	6823      	ldr	r3, [r4, #0]
 8001532:	2e00      	cmp	r6, #0
 8001534:	d002      	beq.n	800153c <USART_Cmd+0x58>
 8001536:	431d      	orrs	r5, r3
 8001538:	6025      	str	r5, [r4, #0]
 800153a:	e001      	b.n	8001540 <USART_Cmd+0x5c>
 800153c:	43ab      	bics	r3, r5
 800153e:	6023      	str	r3, [r4, #0]
 8001540:	bd70      	pop	{r4, r5, r6, pc}
 8001542:	46c0      	nop			; (mov r8, r8)
 8001544:	40013800 	.word	0x40013800
 8001548:	40004400 	.word	0x40004400
 800154c:	40004800 	.word	0x40004800
 8001550:	40004c00 	.word	0x40004c00
 8001554:	40005000 	.word	0x40005000
 8001558:	40011400 	.word	0x40011400
 800155c:	40011800 	.word	0x40011800
 8001560:	bffee400 	.word	0xbffee400

08001564 <USART_ReceiveData>:
 8001564:	4b11      	ldr	r3, [pc, #68]	; (80015ac <USART_ReceiveData+0x48>)
 8001566:	b510      	push	{r4, lr}
 8001568:	1e04      	subs	r4, r0, #0
 800156a:	429c      	cmp	r4, r3
 800156c:	d016      	beq.n	800159c <USART_ReceiveData+0x38>
 800156e:	4b10      	ldr	r3, [pc, #64]	; (80015b0 <USART_ReceiveData+0x4c>)
 8001570:	4298      	cmp	r0, r3
 8001572:	d013      	beq.n	800159c <USART_ReceiveData+0x38>
 8001574:	4b0f      	ldr	r3, [pc, #60]	; (80015b4 <USART_ReceiveData+0x50>)
 8001576:	4298      	cmp	r0, r3
 8001578:	d010      	beq.n	800159c <USART_ReceiveData+0x38>
 800157a:	4b0f      	ldr	r3, [pc, #60]	; (80015b8 <USART_ReceiveData+0x54>)
 800157c:	4298      	cmp	r0, r3
 800157e:	d00d      	beq.n	800159c <USART_ReceiveData+0x38>
 8001580:	4b0e      	ldr	r3, [pc, #56]	; (80015bc <USART_ReceiveData+0x58>)
 8001582:	4298      	cmp	r0, r3
 8001584:	d00a      	beq.n	800159c <USART_ReceiveData+0x38>
 8001586:	4b0e      	ldr	r3, [pc, #56]	; (80015c0 <USART_ReceiveData+0x5c>)
 8001588:	4298      	cmp	r0, r3
 800158a:	d007      	beq.n	800159c <USART_ReceiveData+0x38>
 800158c:	4b0d      	ldr	r3, [pc, #52]	; (80015c4 <USART_ReceiveData+0x60>)
 800158e:	4298      	cmp	r0, r3
 8001590:	d004      	beq.n	800159c <USART_ReceiveData+0x38>
 8001592:	4b0d      	ldr	r3, [pc, #52]	; (80015c8 <USART_ReceiveData+0x64>)
 8001594:	18c0      	adds	r0, r0, r3
 8001596:	4243      	negs	r3, r0
 8001598:	4158      	adcs	r0, r3
 800159a:	e000      	b.n	800159e <USART_ReceiveData+0x3a>
 800159c:	2001      	movs	r0, #1
 800159e:	f7ff fa77 	bl	8000a90 <assert_param>
 80015a2:	6a60      	ldr	r0, [r4, #36]	; 0x24
 80015a4:	05c0      	lsls	r0, r0, #23
 80015a6:	0dc0      	lsrs	r0, r0, #23
 80015a8:	bd10      	pop	{r4, pc}
 80015aa:	46c0      	nop			; (mov r8, r8)
 80015ac:	40013800 	.word	0x40013800
 80015b0:	40004400 	.word	0x40004400
 80015b4:	40004800 	.word	0x40004800
 80015b8:	40004c00 	.word	0x40004c00
 80015bc:	40005000 	.word	0x40005000
 80015c0:	40011400 	.word	0x40011400
 80015c4:	40011800 	.word	0x40011800
 80015c8:	bffee400 	.word	0xbffee400

080015cc <USART_GetITStatus>:
 80015cc:	b538      	push	{r3, r4, r5, lr}
 80015ce:	4b36      	ldr	r3, [pc, #216]	; (80016a8 <USART_GetITStatus+0xdc>)
 80015d0:	1c05      	adds	r5, r0, #0
 80015d2:	1c0c      	adds	r4, r1, #0
 80015d4:	4298      	cmp	r0, r3
 80015d6:	d016      	beq.n	8001606 <USART_GetITStatus+0x3a>
 80015d8:	4b34      	ldr	r3, [pc, #208]	; (80016ac <USART_GetITStatus+0xe0>)
 80015da:	4298      	cmp	r0, r3
 80015dc:	d013      	beq.n	8001606 <USART_GetITStatus+0x3a>
 80015de:	4b34      	ldr	r3, [pc, #208]	; (80016b0 <USART_GetITStatus+0xe4>)
 80015e0:	4298      	cmp	r0, r3
 80015e2:	d010      	beq.n	8001606 <USART_GetITStatus+0x3a>
 80015e4:	4b33      	ldr	r3, [pc, #204]	; (80016b4 <USART_GetITStatus+0xe8>)
 80015e6:	4298      	cmp	r0, r3
 80015e8:	d00d      	beq.n	8001606 <USART_GetITStatus+0x3a>
 80015ea:	4b33      	ldr	r3, [pc, #204]	; (80016b8 <USART_GetITStatus+0xec>)
 80015ec:	4298      	cmp	r0, r3
 80015ee:	d00a      	beq.n	8001606 <USART_GetITStatus+0x3a>
 80015f0:	4b32      	ldr	r3, [pc, #200]	; (80016bc <USART_GetITStatus+0xf0>)
 80015f2:	4298      	cmp	r0, r3
 80015f4:	d007      	beq.n	8001606 <USART_GetITStatus+0x3a>
 80015f6:	4b32      	ldr	r3, [pc, #200]	; (80016c0 <USART_GetITStatus+0xf4>)
 80015f8:	4298      	cmp	r0, r3
 80015fa:	d004      	beq.n	8001606 <USART_GetITStatus+0x3a>
 80015fc:	4a31      	ldr	r2, [pc, #196]	; (80016c4 <USART_GetITStatus+0xf8>)
 80015fe:	1880      	adds	r0, r0, r2
 8001600:	4243      	negs	r3, r0
 8001602:	4158      	adcs	r0, r3
 8001604:	e000      	b.n	8001608 <USART_GetITStatus+0x3c>
 8001606:	2001      	movs	r0, #1
 8001608:	f7ff fa42 	bl	8000a90 <assert_param>
 800160c:	2384      	movs	r3, #132	; 0x84
 800160e:	005b      	lsls	r3, r3, #1
 8001610:	429c      	cmp	r4, r3
 8001612:	d027      	beq.n	8001664 <USART_GetITStatus+0x98>
 8001614:	4b2c      	ldr	r3, [pc, #176]	; (80016c8 <USART_GetITStatus+0xfc>)
 8001616:	429c      	cmp	r4, r3
 8001618:	d024      	beq.n	8001664 <USART_GetITStatus+0x98>
 800161a:	4b2c      	ldr	r3, [pc, #176]	; (80016cc <USART_GetITStatus+0x100>)
 800161c:	429c      	cmp	r4, r3
 800161e:	d021      	beq.n	8001664 <USART_GetITStatus+0x98>
 8001620:	4b2b      	ldr	r3, [pc, #172]	; (80016d0 <USART_GetITStatus+0x104>)
 8001622:	429c      	cmp	r4, r3
 8001624:	d01e      	beq.n	8001664 <USART_GetITStatus+0x98>
 8001626:	4b2b      	ldr	r3, [pc, #172]	; (80016d4 <USART_GetITStatus+0x108>)
 8001628:	429c      	cmp	r4, r3
 800162a:	d01b      	beq.n	8001664 <USART_GetITStatus+0x98>
 800162c:	4b2a      	ldr	r3, [pc, #168]	; (80016d8 <USART_GetITStatus+0x10c>)
 800162e:	429c      	cmp	r4, r3
 8001630:	d018      	beq.n	8001664 <USART_GetITStatus+0x98>
 8001632:	4b2a      	ldr	r3, [pc, #168]	; (80016dc <USART_GetITStatus+0x110>)
 8001634:	429c      	cmp	r4, r3
 8001636:	d015      	beq.n	8001664 <USART_GetITStatus+0x98>
 8001638:	4b29      	ldr	r3, [pc, #164]	; (80016e0 <USART_GetITStatus+0x114>)
 800163a:	429c      	cmp	r4, r3
 800163c:	d012      	beq.n	8001664 <USART_GetITStatus+0x98>
 800163e:	4a29      	ldr	r2, [pc, #164]	; (80016e4 <USART_GetITStatus+0x118>)
 8001640:	4b29      	ldr	r3, [pc, #164]	; (80016e8 <USART_GetITStatus+0x11c>)
 8001642:	4022      	ands	r2, r4
 8001644:	429a      	cmp	r2, r3
 8001646:	d00d      	beq.n	8001664 <USART_GetITStatus+0x98>
 8001648:	4b28      	ldr	r3, [pc, #160]	; (80016ec <USART_GetITStatus+0x120>)
 800164a:	429c      	cmp	r4, r3
 800164c:	d00a      	beq.n	8001664 <USART_GetITStatus+0x98>
 800164e:	4b28      	ldr	r3, [pc, #160]	; (80016f0 <USART_GetITStatus+0x124>)
 8001650:	429c      	cmp	r4, r3
 8001652:	d007      	beq.n	8001664 <USART_GetITStatus+0x98>
 8001654:	4b27      	ldr	r3, [pc, #156]	; (80016f4 <USART_GetITStatus+0x128>)
 8001656:	429c      	cmp	r4, r3
 8001658:	d004      	beq.n	8001664 <USART_GetITStatus+0x98>
 800165a:	4a27      	ldr	r2, [pc, #156]	; (80016f8 <USART_GetITStatus+0x12c>)
 800165c:	18a3      	adds	r3, r4, r2
 800165e:	4258      	negs	r0, r3
 8001660:	4158      	adcs	r0, r3
 8001662:	e000      	b.n	8001666 <USART_GetITStatus+0x9a>
 8001664:	2001      	movs	r0, #1
 8001666:	f7ff fa13 	bl	8000a90 <assert_param>
 800166a:	b2e3      	uxtb	r3, r4
 800166c:	2101      	movs	r1, #1
 800166e:	b2a2      	uxth	r2, r4
 8001670:	4099      	lsls	r1, r3
 8001672:	0a12      	lsrs	r2, r2, #8
 8001674:	1c0b      	adds	r3, r1, #0
 8001676:	2a01      	cmp	r2, #1
 8001678:	d101      	bne.n	800167e <USART_GetITStatus+0xb2>
 800167a:	682a      	ldr	r2, [r5, #0]
 800167c:	e004      	b.n	8001688 <USART_GetITStatus+0xbc>
 800167e:	2a02      	cmp	r2, #2
 8001680:	d101      	bne.n	8001686 <USART_GetITStatus+0xba>
 8001682:	686a      	ldr	r2, [r5, #4]
 8001684:	e000      	b.n	8001688 <USART_GetITStatus+0xbc>
 8001686:	68aa      	ldr	r2, [r5, #8]
 8001688:	2000      	movs	r0, #0
 800168a:	4013      	ands	r3, r2
 800168c:	69ea      	ldr	r2, [r5, #28]
 800168e:	4283      	cmp	r3, r0
 8001690:	d008      	beq.n	80016a4 <USART_GetITStatus+0xd8>
 8001692:	0c24      	lsrs	r4, r4, #16
 8001694:	2001      	movs	r0, #1
 8001696:	40a0      	lsls	r0, r4
 8001698:	1c04      	adds	r4, r0, #0
 800169a:	1c10      	adds	r0, r2, #0
 800169c:	4020      	ands	r0, r4
 800169e:	1e44      	subs	r4, r0, #1
 80016a0:	41a0      	sbcs	r0, r4
 80016a2:	b2c0      	uxtb	r0, r0
 80016a4:	bd38      	pop	{r3, r4, r5, pc}
 80016a6:	46c0      	nop			; (mov r8, r8)
 80016a8:	40013800 	.word	0x40013800
 80016ac:	40004400 	.word	0x40004400
 80016b0:	40004800 	.word	0x40004800
 80016b4:	40004c00 	.word	0x40004c00
 80016b8:	40005000 	.word	0x40005000
 80016bc:	40011400 	.word	0x40011400
 80016c0:	40011800 	.word	0x40011800
 80016c4:	bffee400 	.word	0xbffee400
 80016c8:	00070107 	.word	0x00070107
 80016cc:	00060106 	.word	0x00060106
 80016d0:	00050105 	.word	0x00050105
 80016d4:	00040104 	.word	0x00040104
 80016d8:	00080206 	.word	0x00080206
 80016dc:	0009030a 	.word	0x0009030a
 80016e0:	00020300 	.word	0x00020300
 80016e4:	fffdffff 	.word	0xfffdffff
 80016e8:	00010300 	.word	0x00010300
 80016ec:	000b011a 	.word	0x000b011a
 80016f0:	000c011b 	.word	0x000c011b
 80016f4:	0011010e 	.word	0x0011010e
 80016f8:	ffebfcea 	.word	0xffebfcea

080016fc <USART_ClearITPendingBit>:
 80016fc:	b538      	push	{r3, r4, r5, lr}
 80016fe:	4b26      	ldr	r3, [pc, #152]	; (8001798 <USART_ClearITPendingBit+0x9c>)
 8001700:	1c05      	adds	r5, r0, #0
 8001702:	1c0c      	adds	r4, r1, #0
 8001704:	4298      	cmp	r0, r3
 8001706:	d016      	beq.n	8001736 <USART_ClearITPendingBit+0x3a>
 8001708:	4b24      	ldr	r3, [pc, #144]	; (800179c <USART_ClearITPendingBit+0xa0>)
 800170a:	4298      	cmp	r0, r3
 800170c:	d013      	beq.n	8001736 <USART_ClearITPendingBit+0x3a>
 800170e:	4b24      	ldr	r3, [pc, #144]	; (80017a0 <USART_ClearITPendingBit+0xa4>)
 8001710:	4298      	cmp	r0, r3
 8001712:	d010      	beq.n	8001736 <USART_ClearITPendingBit+0x3a>
 8001714:	4b23      	ldr	r3, [pc, #140]	; (80017a4 <USART_ClearITPendingBit+0xa8>)
 8001716:	4298      	cmp	r0, r3
 8001718:	d00d      	beq.n	8001736 <USART_ClearITPendingBit+0x3a>
 800171a:	4b23      	ldr	r3, [pc, #140]	; (80017a8 <USART_ClearITPendingBit+0xac>)
 800171c:	4298      	cmp	r0, r3
 800171e:	d00a      	beq.n	8001736 <USART_ClearITPendingBit+0x3a>
 8001720:	4b22      	ldr	r3, [pc, #136]	; (80017ac <USART_ClearITPendingBit+0xb0>)
 8001722:	4298      	cmp	r0, r3
 8001724:	d007      	beq.n	8001736 <USART_ClearITPendingBit+0x3a>
 8001726:	4b22      	ldr	r3, [pc, #136]	; (80017b0 <USART_ClearITPendingBit+0xb4>)
 8001728:	4298      	cmp	r0, r3
 800172a:	d004      	beq.n	8001736 <USART_ClearITPendingBit+0x3a>
 800172c:	4a21      	ldr	r2, [pc, #132]	; (80017b4 <USART_ClearITPendingBit+0xb8>)
 800172e:	1880      	adds	r0, r0, r2
 8001730:	4243      	negs	r3, r0
 8001732:	4158      	adcs	r0, r3
 8001734:	e000      	b.n	8001738 <USART_ClearITPendingBit+0x3c>
 8001736:	2001      	movs	r0, #1
 8001738:	f7ff f9aa 	bl	8000a90 <assert_param>
 800173c:	4b1e      	ldr	r3, [pc, #120]	; (80017b8 <USART_ClearITPendingBit+0xbc>)
 800173e:	429c      	cmp	r4, r3
 8001740:	d022      	beq.n	8001788 <USART_ClearITPendingBit+0x8c>
 8001742:	2384      	movs	r3, #132	; 0x84
 8001744:	005b      	lsls	r3, r3, #1
 8001746:	429c      	cmp	r4, r3
 8001748:	d01e      	beq.n	8001788 <USART_ClearITPendingBit+0x8c>
 800174a:	4a1c      	ldr	r2, [pc, #112]	; (80017bc <USART_ClearITPendingBit+0xc0>)
 800174c:	4b1c      	ldr	r3, [pc, #112]	; (80017c0 <USART_ClearITPendingBit+0xc4>)
 800174e:	4022      	ands	r2, r4
 8001750:	429a      	cmp	r2, r3
 8001752:	d019      	beq.n	8001788 <USART_ClearITPendingBit+0x8c>
 8001754:	4b1b      	ldr	r3, [pc, #108]	; (80017c4 <USART_ClearITPendingBit+0xc8>)
 8001756:	429c      	cmp	r4, r3
 8001758:	d016      	beq.n	8001788 <USART_ClearITPendingBit+0x8c>
 800175a:	4b1b      	ldr	r3, [pc, #108]	; (80017c8 <USART_ClearITPendingBit+0xcc>)
 800175c:	429c      	cmp	r4, r3
 800175e:	d013      	beq.n	8001788 <USART_ClearITPendingBit+0x8c>
 8001760:	4b1a      	ldr	r3, [pc, #104]	; (80017cc <USART_ClearITPendingBit+0xd0>)
 8001762:	429c      	cmp	r4, r3
 8001764:	d010      	beq.n	8001788 <USART_ClearITPendingBit+0x8c>
 8001766:	4b1a      	ldr	r3, [pc, #104]	; (80017d0 <USART_ClearITPendingBit+0xd4>)
 8001768:	429c      	cmp	r4, r3
 800176a:	d00d      	beq.n	8001788 <USART_ClearITPendingBit+0x8c>
 800176c:	4b19      	ldr	r3, [pc, #100]	; (80017d4 <USART_ClearITPendingBit+0xd8>)
 800176e:	429c      	cmp	r4, r3
 8001770:	d00a      	beq.n	8001788 <USART_ClearITPendingBit+0x8c>
 8001772:	4b19      	ldr	r3, [pc, #100]	; (80017d8 <USART_ClearITPendingBit+0xdc>)
 8001774:	429c      	cmp	r4, r3
 8001776:	d007      	beq.n	8001788 <USART_ClearITPendingBit+0x8c>
 8001778:	4b18      	ldr	r3, [pc, #96]	; (80017dc <USART_ClearITPendingBit+0xe0>)
 800177a:	429c      	cmp	r4, r3
 800177c:	d004      	beq.n	8001788 <USART_ClearITPendingBit+0x8c>
 800177e:	4a18      	ldr	r2, [pc, #96]	; (80017e0 <USART_ClearITPendingBit+0xe4>)
 8001780:	18a3      	adds	r3, r4, r2
 8001782:	4258      	negs	r0, r3
 8001784:	4158      	adcs	r0, r3
 8001786:	e000      	b.n	800178a <USART_ClearITPendingBit+0x8e>
 8001788:	2001      	movs	r0, #1
 800178a:	f7ff f981 	bl	8000a90 <assert_param>
 800178e:	0c24      	lsrs	r4, r4, #16
 8001790:	2301      	movs	r3, #1
 8001792:	40a3      	lsls	r3, r4
 8001794:	622b      	str	r3, [r5, #32]
 8001796:	bd38      	pop	{r3, r4, r5, pc}
 8001798:	40013800 	.word	0x40013800
 800179c:	40004400 	.word	0x40004400
 80017a0:	40004800 	.word	0x40004800
 80017a4:	40004c00 	.word	0x40004c00
 80017a8:	40005000 	.word	0x40005000
 80017ac:	40011400 	.word	0x40011400
 80017b0:	40011800 	.word	0x40011800
 80017b4:	bffee400 	.word	0xbffee400
 80017b8:	00060106 	.word	0x00060106
 80017bc:	fffdffff 	.word	0xfffdffff
 80017c0:	00010300 	.word	0x00010300
 80017c4:	00020300 	.word	0x00020300
 80017c8:	00040104 	.word	0x00040104
 80017cc:	00080206 	.word	0x00080206
 80017d0:	0009030a 	.word	0x0009030a
 80017d4:	000b011a 	.word	0x000b011a
 80017d8:	000c011b 	.word	0x000c011b
 80017dc:	0011010e 	.word	0x0011010e
 80017e0:	ffebfcea 	.word	0xffebfcea

080017e4 <ADC_DeInit>:
 80017e4:	4b0a      	ldr	r3, [pc, #40]	; (8001810 <ADC_DeInit+0x2c>)
 80017e6:	b510      	push	{r4, lr}
 80017e8:	18c4      	adds	r4, r0, r3
 80017ea:	4263      	negs	r3, r4
 80017ec:	415c      	adcs	r4, r3
 80017ee:	b2e4      	uxtb	r4, r4
 80017f0:	1c20      	adds	r0, r4, #0
 80017f2:	f7ff f94d 	bl	8000a90 <assert_param>
 80017f6:	2c00      	cmp	r4, #0
 80017f8:	d009      	beq.n	800180e <ADC_DeInit+0x2a>
 80017fa:	2080      	movs	r0, #128	; 0x80
 80017fc:	0080      	lsls	r0, r0, #2
 80017fe:	2101      	movs	r1, #1
 8001800:	f000 fa7c 	bl	8001cfc <RCC_APB2PeriphResetCmd>
 8001804:	2080      	movs	r0, #128	; 0x80
 8001806:	0080      	lsls	r0, r0, #2
 8001808:	2100      	movs	r1, #0
 800180a:	f000 fa77 	bl	8001cfc <RCC_APB2PeriphResetCmd>
 800180e:	bd10      	pop	{r4, pc}
 8001810:	bffedc00 	.word	0xbffedc00

08001814 <ADC_Init>:
 8001814:	b570      	push	{r4, r5, r6, lr}
 8001816:	1c0c      	adds	r4, r1, #0
 8001818:	4924      	ldr	r1, [pc, #144]	; (80018ac <ADC_Init+0x98>)
 800181a:	1c05      	adds	r5, r0, #0
 800181c:	1840      	adds	r0, r0, r1
 800181e:	4243      	negs	r3, r0
 8001820:	4158      	adcs	r0, r3
 8001822:	f7ff f935 	bl	8000a90 <assert_param>
 8001826:	6820      	ldr	r0, [r4, #0]
 8001828:	2318      	movs	r3, #24
 800182a:	4398      	bics	r0, r3
 800182c:	4243      	negs	r3, r0
 800182e:	4158      	adcs	r0, r3
 8001830:	f7ff f92e 	bl	8000a90 <assert_param>
 8001834:	7923      	ldrb	r3, [r4, #4]
 8001836:	2601      	movs	r6, #1
 8001838:	2000      	movs	r0, #0
 800183a:	429e      	cmp	r6, r3
 800183c:	4140      	adcs	r0, r0
 800183e:	f7ff f927 	bl	8000a90 <assert_param>
 8001842:	68a3      	ldr	r3, [r4, #8]
 8001844:	481a      	ldr	r0, [pc, #104]	; (80018b0 <ADC_Init+0x9c>)
 8001846:	4018      	ands	r0, r3
 8001848:	4243      	negs	r3, r0
 800184a:	4158      	adcs	r0, r3
 800184c:	f7ff f920 	bl	8000a90 <assert_param>
 8001850:	68e3      	ldr	r3, [r4, #12]
 8001852:	22c0      	movs	r2, #192	; 0xc0
 8001854:	1c19      	adds	r1, r3, #0
 8001856:	4391      	bics	r1, r2
 8001858:	1c30      	adds	r0, r6, #0
 800185a:	2900      	cmp	r1, #0
 800185c:	d003      	beq.n	8001866 <ADC_Init+0x52>
 800185e:	1e58      	subs	r0, r3, #1
 8001860:	38ff      	subs	r0, #255	; 0xff
 8001862:	4243      	negs	r3, r0
 8001864:	4158      	adcs	r0, r3
 8001866:	f7ff f913 	bl	8000a90 <assert_param>
 800186a:	6920      	ldr	r0, [r4, #16]
 800186c:	2320      	movs	r3, #32
 800186e:	4398      	bics	r0, r3
 8001870:	4243      	negs	r3, r0
 8001872:	4158      	adcs	r0, r3
 8001874:	f7ff f90c 	bl	8000a90 <assert_param>
 8001878:	6960      	ldr	r0, [r4, #20]
 800187a:	2304      	movs	r3, #4
 800187c:	4398      	bics	r0, r3
 800187e:	4243      	negs	r3, r0
 8001880:	4158      	adcs	r0, r3
 8001882:	f7ff f905 	bl	8000a90 <assert_param>
 8001886:	6823      	ldr	r3, [r4, #0]
 8001888:	68a2      	ldr	r2, [r4, #8]
 800188a:	68e9      	ldr	r1, [r5, #12]
 800188c:	431a      	orrs	r2, r3
 800188e:	68e3      	ldr	r3, [r4, #12]
 8001890:	431a      	orrs	r2, r3
 8001892:	6923      	ldr	r3, [r4, #16]
 8001894:	431a      	orrs	r2, r3
 8001896:	6963      	ldr	r3, [r4, #20]
 8001898:	431a      	orrs	r2, r3
 800189a:	4b06      	ldr	r3, [pc, #24]	; (80018b4 <ADC_Init+0xa0>)
 800189c:	400b      	ands	r3, r1
 800189e:	4313      	orrs	r3, r2
 80018a0:	7922      	ldrb	r2, [r4, #4]
 80018a2:	0352      	lsls	r2, r2, #13
 80018a4:	4313      	orrs	r3, r2
 80018a6:	60eb      	str	r3, [r5, #12]
 80018a8:	bd70      	pop	{r4, r5, r6, pc}
 80018aa:	46c0      	nop			; (mov r8, r8)
 80018ac:	bffedc00 	.word	0xbffedc00
 80018b0:	fffff3ff 	.word	0xfffff3ff
 80018b4:	ffffd203 	.word	0xffffd203

080018b8 <ADC_Cmd>:
 80018b8:	4b0c      	ldr	r3, [pc, #48]	; (80018ec <ADC_Cmd+0x34>)
 80018ba:	b570      	push	{r4, r5, r6, lr}
 80018bc:	1c04      	adds	r4, r0, #0
 80018be:	18c0      	adds	r0, r0, r3
 80018c0:	4243      	negs	r3, r0
 80018c2:	4158      	adcs	r0, r3
 80018c4:	1c0e      	adds	r6, r1, #0
 80018c6:	2501      	movs	r5, #1
 80018c8:	f7ff f8e2 	bl	8000a90 <assert_param>
 80018cc:	2000      	movs	r0, #0
 80018ce:	42b5      	cmp	r5, r6
 80018d0:	4140      	adcs	r0, r0
 80018d2:	f7ff f8dd 	bl	8000a90 <assert_param>
 80018d6:	68a3      	ldr	r3, [r4, #8]
 80018d8:	2e00      	cmp	r6, #0
 80018da:	d002      	beq.n	80018e2 <ADC_Cmd+0x2a>
 80018dc:	431d      	orrs	r5, r3
 80018de:	60a5      	str	r5, [r4, #8]
 80018e0:	e002      	b.n	80018e8 <ADC_Cmd+0x30>
 80018e2:	2202      	movs	r2, #2
 80018e4:	4313      	orrs	r3, r2
 80018e6:	60a3      	str	r3, [r4, #8]
 80018e8:	bd70      	pop	{r4, r5, r6, pc}
 80018ea:	46c0      	nop			; (mov r8, r8)
 80018ec:	bffedc00 	.word	0xbffedc00

080018f0 <ADC_TempSensorCmd>:
 80018f0:	2301      	movs	r3, #1
 80018f2:	b510      	push	{r4, lr}
 80018f4:	1c04      	adds	r4, r0, #0
 80018f6:	2000      	movs	r0, #0
 80018f8:	42a3      	cmp	r3, r4
 80018fa:	4140      	adcs	r0, r0
 80018fc:	f7ff f8c8 	bl	8000a90 <assert_param>
 8001900:	4b05      	ldr	r3, [pc, #20]	; (8001918 <ADC_TempSensorCmd+0x28>)
 8001902:	6819      	ldr	r1, [r3, #0]
 8001904:	2c00      	cmp	r4, #0
 8001906:	d003      	beq.n	8001910 <ADC_TempSensorCmd+0x20>
 8001908:	2280      	movs	r2, #128	; 0x80
 800190a:	0412      	lsls	r2, r2, #16
 800190c:	430a      	orrs	r2, r1
 800190e:	e001      	b.n	8001914 <ADC_TempSensorCmd+0x24>
 8001910:	4a02      	ldr	r2, [pc, #8]	; (800191c <ADC_TempSensorCmd+0x2c>)
 8001912:	400a      	ands	r2, r1
 8001914:	601a      	str	r2, [r3, #0]
 8001916:	bd10      	pop	{r4, pc}
 8001918:	40012708 	.word	0x40012708
 800191c:	ff7fffff 	.word	0xff7fffff

08001920 <ADC_VrefintCmd>:
 8001920:	2301      	movs	r3, #1
 8001922:	b510      	push	{r4, lr}
 8001924:	1c04      	adds	r4, r0, #0
 8001926:	2000      	movs	r0, #0
 8001928:	42a3      	cmp	r3, r4
 800192a:	4140      	adcs	r0, r0
 800192c:	f7ff f8b0 	bl	8000a90 <assert_param>
 8001930:	4b05      	ldr	r3, [pc, #20]	; (8001948 <ADC_VrefintCmd+0x28>)
 8001932:	6819      	ldr	r1, [r3, #0]
 8001934:	2c00      	cmp	r4, #0
 8001936:	d003      	beq.n	8001940 <ADC_VrefintCmd+0x20>
 8001938:	2280      	movs	r2, #128	; 0x80
 800193a:	03d2      	lsls	r2, r2, #15
 800193c:	430a      	orrs	r2, r1
 800193e:	e001      	b.n	8001944 <ADC_VrefintCmd+0x24>
 8001940:	4a02      	ldr	r2, [pc, #8]	; (800194c <ADC_VrefintCmd+0x2c>)
 8001942:	400a      	ands	r2, r1
 8001944:	601a      	str	r2, [r3, #0]
 8001946:	bd10      	pop	{r4, pc}
 8001948:	40012708 	.word	0x40012708
 800194c:	ffbfffff 	.word	0xffbfffff

08001950 <ADC_GetCalibrationFactor>:
 8001950:	4b0e      	ldr	r3, [pc, #56]	; (800198c <ADC_GetCalibrationFactor+0x3c>)
 8001952:	b510      	push	{r4, lr}
 8001954:	1c04      	adds	r4, r0, #0
 8001956:	18c0      	adds	r0, r0, r3
 8001958:	4243      	negs	r3, r0
 800195a:	4158      	adcs	r0, r3
 800195c:	f7ff f898 	bl	8000a90 <assert_param>
 8001960:	68a2      	ldr	r2, [r4, #8]
 8001962:	2380      	movs	r3, #128	; 0x80
 8001964:	061b      	lsls	r3, r3, #24
 8001966:	4313      	orrs	r3, r2
 8001968:	60a3      	str	r3, [r4, #8]
 800196a:	23f0      	movs	r3, #240	; 0xf0
 800196c:	021b      	lsls	r3, r3, #8
 800196e:	68a2      	ldr	r2, [r4, #8]
 8001970:	3b01      	subs	r3, #1
 8001972:	0fd2      	lsrs	r2, r2, #31
 8001974:	07d2      	lsls	r2, r2, #31
 8001976:	2b00      	cmp	r3, #0
 8001978:	d001      	beq.n	800197e <ADC_GetCalibrationFactor+0x2e>
 800197a:	2a00      	cmp	r2, #0
 800197c:	d1f7      	bne.n	800196e <ADC_GetCalibrationFactor+0x1e>
 800197e:	68a3      	ldr	r3, [r4, #8]
 8001980:	2b00      	cmp	r3, #0
 8001982:	db01      	blt.n	8001988 <ADC_GetCalibrationFactor+0x38>
 8001984:	6c20      	ldr	r0, [r4, #64]	; 0x40
 8001986:	e000      	b.n	800198a <ADC_GetCalibrationFactor+0x3a>
 8001988:	2000      	movs	r0, #0
 800198a:	bd10      	pop	{r4, pc}
 800198c:	bffedc00 	.word	0xbffedc00

08001990 <ADC_GetFlagStatus>:
 8001990:	4a15      	ldr	r2, [pc, #84]	; (80019e8 <ADC_GetFlagStatus+0x58>)
 8001992:	b570      	push	{r4, r5, r6, lr}
 8001994:	1c05      	adds	r5, r0, #0
 8001996:	1880      	adds	r0, r0, r2
 8001998:	1c0c      	adds	r4, r1, #0
 800199a:	4243      	negs	r3, r0
 800199c:	4158      	adcs	r0, r3
 800199e:	4e13      	ldr	r6, [pc, #76]	; (80019ec <ADC_GetFlagStatus+0x5c>)
 80019a0:	f7ff f876 	bl	8000a90 <assert_param>
 80019a4:	1c23      	adds	r3, r4, #0
 80019a6:	4033      	ands	r3, r6
 80019a8:	1e5a      	subs	r2, r3, #1
 80019aa:	2a01      	cmp	r2, #1
 80019ac:	d90d      	bls.n	80019ca <ADC_GetFlagStatus+0x3a>
 80019ae:	2b04      	cmp	r3, #4
 80019b0:	d00b      	beq.n	80019ca <ADC_GetFlagStatus+0x3a>
 80019b2:	2c08      	cmp	r4, #8
 80019b4:	d009      	beq.n	80019ca <ADC_GetFlagStatus+0x3a>
 80019b6:	2c80      	cmp	r4, #128	; 0x80
 80019b8:	d007      	beq.n	80019ca <ADC_GetFlagStatus+0x3a>
 80019ba:	2b10      	cmp	r3, #16
 80019bc:	d005      	beq.n	80019ca <ADC_GetFlagStatus+0x3a>
 80019be:	22fe      	movs	r2, #254	; 0xfe
 80019c0:	05d2      	lsls	r2, r2, #23
 80019c2:	18a3      	adds	r3, r4, r2
 80019c4:	4258      	negs	r0, r3
 80019c6:	4158      	adcs	r0, r3
 80019c8:	e000      	b.n	80019cc <ADC_GetFlagStatus+0x3c>
 80019ca:	2001      	movs	r0, #1
 80019cc:	f7ff f860 	bl	8000a90 <assert_param>
 80019d0:	01e3      	lsls	r3, r4, #7
 80019d2:	d502      	bpl.n	80019da <ADC_GetFlagStatus+0x4a>
 80019d4:	68ab      	ldr	r3, [r5, #8]
 80019d6:	401e      	ands	r6, r3
 80019d8:	e000      	b.n	80019dc <ADC_GetFlagStatus+0x4c>
 80019da:	682e      	ldr	r6, [r5, #0]
 80019dc:	4026      	ands	r6, r4
 80019de:	1e74      	subs	r4, r6, #1
 80019e0:	41a6      	sbcs	r6, r4
 80019e2:	b2f0      	uxtb	r0, r6
 80019e4:	bd70      	pop	{r4, r5, r6, pc}
 80019e6:	46c0      	nop			; (mov r8, r8)
 80019e8:	bffedc00 	.word	0xbffedc00
 80019ec:	feffffff 	.word	0xfeffffff

080019f0 <NVIC_Init>:
 80019f0:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
 80019f2:	2500      	movs	r5, #0
 80019f4:	7883      	ldrb	r3, [r0, #2]
 80019f6:	1c04      	adds	r4, r0, #0
 80019f8:	2601      	movs	r6, #1
 80019fa:	1c28      	adds	r0, r5, #0
 80019fc:	429e      	cmp	r6, r3
 80019fe:	4168      	adcs	r0, r5
 8001a00:	f7ff f846 	bl	8000a90 <assert_param>
 8001a04:	7863      	ldrb	r3, [r4, #1]
 8001a06:	2703      	movs	r7, #3
 8001a08:	1c28      	adds	r0, r5, #0
 8001a0a:	429f      	cmp	r7, r3
 8001a0c:	4168      	adcs	r0, r5
 8001a0e:	f7ff f83f 	bl	8000a90 <assert_param>
 8001a12:	78a2      	ldrb	r2, [r4, #2]
 8001a14:	7823      	ldrb	r3, [r4, #0]
 8001a16:	42aa      	cmp	r2, r5
 8001a18:	d01a      	beq.n	8001a50 <NVIC_Init+0x60>
 8001a1a:	0899      	lsrs	r1, r3, #2
 8001a1c:	4a0f      	ldr	r2, [pc, #60]	; (8001a5c <NVIC_Init+0x6c>)
 8001a1e:	0089      	lsls	r1, r1, #2
 8001a20:	1889      	adds	r1, r1, r2
 8001a22:	22c0      	movs	r2, #192	; 0xc0
 8001a24:	0092      	lsls	r2, r2, #2
 8001a26:	401f      	ands	r7, r3
 8001a28:	20ff      	movs	r0, #255	; 0xff
 8001a2a:	588d      	ldr	r5, [r1, r2]
 8001a2c:	00ff      	lsls	r7, r7, #3
 8001a2e:	1c03      	adds	r3, r0, #0
 8001a30:	40bb      	lsls	r3, r7
 8001a32:	439d      	bics	r5, r3
 8001a34:	7863      	ldrb	r3, [r4, #1]
 8001a36:	019b      	lsls	r3, r3, #6
 8001a38:	4018      	ands	r0, r3
 8001a3a:	40b8      	lsls	r0, r7
 8001a3c:	1c2f      	adds	r7, r5, #0
 8001a3e:	4307      	orrs	r7, r0
 8001a40:	508f      	str	r7, [r1, r2]
 8001a42:	7822      	ldrb	r2, [r4, #0]
 8001a44:	231f      	movs	r3, #31
 8001a46:	4013      	ands	r3, r2
 8001a48:	409e      	lsls	r6, r3
 8001a4a:	4b04      	ldr	r3, [pc, #16]	; (8001a5c <NVIC_Init+0x6c>)
 8001a4c:	601e      	str	r6, [r3, #0]
 8001a4e:	e004      	b.n	8001a5a <NVIC_Init+0x6a>
 8001a50:	271f      	movs	r7, #31
 8001a52:	403b      	ands	r3, r7
 8001a54:	4a02      	ldr	r2, [pc, #8]	; (8001a60 <NVIC_Init+0x70>)
 8001a56:	409e      	lsls	r6, r3
 8001a58:	67d6      	str	r6, [r2, #124]	; 0x7c
 8001a5a:	bdf8      	pop	{r3, r4, r5, r6, r7, pc}
 8001a5c:	e000e100 	.word	0xe000e100
 8001a60:	e000e104 	.word	0xe000e104

08001a64 <RCC_ADCCLKConfig>:
 8001a64:	4b0e      	ldr	r3, [pc, #56]	; (8001aa0 <RCC_ADCCLKConfig+0x3c>)
 8001a66:	b510      	push	{r4, lr}
 8001a68:	1c04      	adds	r4, r0, #0
 8001a6a:	2001      	movs	r0, #1
 8001a6c:	421c      	tst	r4, r3
 8001a6e:	d003      	beq.n	8001a78 <RCC_ADCCLKConfig+0x14>
 8001a70:	4b0c      	ldr	r3, [pc, #48]	; (8001aa4 <RCC_ADCCLKConfig+0x40>)
 8001a72:	18e0      	adds	r0, r4, r3
 8001a74:	4243      	negs	r3, r0
 8001a76:	4158      	adcs	r0, r3
 8001a78:	f7ff f80a 	bl	8000a90 <assert_param>
 8001a7c:	4b0a      	ldr	r3, [pc, #40]	; (8001aa8 <RCC_ADCCLKConfig+0x44>)
 8001a7e:	4a0b      	ldr	r2, [pc, #44]	; (8001aac <RCC_ADCCLKConfig+0x48>)
 8001a80:	6859      	ldr	r1, [r3, #4]
 8001a82:	400a      	ands	r2, r1
 8001a84:	605a      	str	r2, [r3, #4]
 8001a86:	685a      	ldr	r2, [r3, #4]
 8001a88:	b2a1      	uxth	r1, r4
 8001a8a:	430a      	orrs	r2, r1
 8001a8c:	605a      	str	r2, [r3, #4]
 8001a8e:	6b19      	ldr	r1, [r3, #48]	; 0x30
 8001a90:	4a07      	ldr	r2, [pc, #28]	; (8001ab0 <RCC_ADCCLKConfig+0x4c>)
 8001a92:	0c24      	lsrs	r4, r4, #16
 8001a94:	400a      	ands	r2, r1
 8001a96:	631a      	str	r2, [r3, #48]	; 0x30
 8001a98:	6b1a      	ldr	r2, [r3, #48]	; 0x30
 8001a9a:	4314      	orrs	r4, r2
 8001a9c:	631c      	str	r4, [r3, #48]	; 0x30
 8001a9e:	bd10      	pop	{r4, pc}
 8001aa0:	feffffff 	.word	0xfeffffff
 8001aa4:	feffc000 	.word	0xfeffc000
 8001aa8:	40021000 	.word	0x40021000
 8001aac:	ffffbfff 	.word	0xffffbfff
 8001ab0:	fffffeff 	.word	0xfffffeff

08001ab4 <RCC_GetClocksFreq>:
 8001ab4:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
 8001ab6:	4d5a      	ldr	r5, [pc, #360]	; (8001c20 <RCC_GetClocksFreq+0x16c>)
 8001ab8:	1c04      	adds	r4, r0, #0
 8001aba:	6868      	ldr	r0, [r5, #4]
 8001abc:	230c      	movs	r3, #12
 8001abe:	4018      	ands	r0, r3
 8001ac0:	f000 f9de 	bl	8001e80 <__gnu_thumb1_case_uqi>
 8001ac4:	1f1f1f1f 	.word	0x1f1f1f1f
 8001ac8:	1f1f1f1f 	.word	0x1f1f1f1f
 8001acc:	1f1f1f07 	.word	0x1f1f1f07
 8001ad0:	1d          	.byte	0x1d
 8001ad1:	00          	.byte	0x00
 8001ad2:	686e      	ldr	r6, [r5, #4]
 8001ad4:	23c0      	movs	r3, #192	; 0xc0
 8001ad6:	02b6      	lsls	r6, r6, #10
 8001ad8:	686a      	ldr	r2, [r5, #4]
 8001ada:	0f36      	lsrs	r6, r6, #28
 8001adc:	025b      	lsls	r3, r3, #9
 8001ade:	3602      	adds	r6, #2
 8001ae0:	421a      	tst	r2, r3
 8001ae2:	d101      	bne.n	8001ae8 <RCC_GetClocksFreq+0x34>
 8001ae4:	484f      	ldr	r0, [pc, #316]	; (8001c24 <RCC_GetClocksFreq+0x170>)
 8001ae6:	e007      	b.n	8001af8 <RCC_GetClocksFreq+0x44>
 8001ae8:	4b4d      	ldr	r3, [pc, #308]	; (8001c20 <RCC_GetClocksFreq+0x16c>)
 8001aea:	484f      	ldr	r0, [pc, #316]	; (8001c28 <RCC_GetClocksFreq+0x174>)
 8001aec:	6ad9      	ldr	r1, [r3, #44]	; 0x2c
 8001aee:	230f      	movs	r3, #15
 8001af0:	4019      	ands	r1, r3
 8001af2:	3101      	adds	r1, #1
 8001af4:	f000 f9ce 	bl	8001e94 <__aeabi_uidiv>
 8001af8:	4370      	muls	r0, r6
 8001afa:	6020      	str	r0, [r4, #0]
 8001afc:	e004      	b.n	8001b08 <RCC_GetClocksFreq+0x54>
 8001afe:	4b4b      	ldr	r3, [pc, #300]	; (8001c2c <RCC_GetClocksFreq+0x178>)
 8001b00:	e000      	b.n	8001b04 <RCC_GetClocksFreq+0x50>
 8001b02:	4b49      	ldr	r3, [pc, #292]	; (8001c28 <RCC_GetClocksFreq+0x174>)
 8001b04:	6023      	str	r3, [r4, #0]
 8001b06:	2000      	movs	r0, #0
 8001b08:	686b      	ldr	r3, [r5, #4]
 8001b0a:	4a49      	ldr	r2, [pc, #292]	; (8001c30 <RCC_GetClocksFreq+0x17c>)
 8001b0c:	061b      	lsls	r3, r3, #24
 8001b0e:	0f1b      	lsrs	r3, r3, #28
 8001b10:	6821      	ldr	r1, [r4, #0]
 8001b12:	5cd3      	ldrb	r3, [r2, r3]
 8001b14:	1c0e      	adds	r6, r1, #0
 8001b16:	40de      	lsrs	r6, r3
 8001b18:	6066      	str	r6, [r4, #4]
 8001b1a:	1c33      	adds	r3, r6, #0
 8001b1c:	686e      	ldr	r6, [r5, #4]
 8001b1e:	0576      	lsls	r6, r6, #21
 8001b20:	0f76      	lsrs	r6, r6, #29
 8001b22:	5d92      	ldrb	r2, [r2, r6]
 8001b24:	40d3      	lsrs	r3, r2
 8001b26:	60a3      	str	r3, [r4, #8]
 8001b28:	6b2a      	ldr	r2, [r5, #48]	; 0x30
 8001b2a:	05d6      	lsls	r6, r2, #23
 8001b2c:	d401      	bmi.n	8001b32 <RCC_GetClocksFreq+0x7e>
 8001b2e:	4a41      	ldr	r2, [pc, #260]	; (8001c34 <RCC_GetClocksFreq+0x180>)
 8001b30:	e006      	b.n	8001b40 <RCC_GetClocksFreq+0x8c>
 8001b32:	4a3b      	ldr	r2, [pc, #236]	; (8001c20 <RCC_GetClocksFreq+0x16c>)
 8001b34:	6852      	ldr	r2, [r2, #4]
 8001b36:	0456      	lsls	r6, r2, #17
 8001b38:	d401      	bmi.n	8001b3e <RCC_GetClocksFreq+0x8a>
 8001b3a:	085a      	lsrs	r2, r3, #1
 8001b3c:	e000      	b.n	8001b40 <RCC_GetClocksFreq+0x8c>
 8001b3e:	089a      	lsrs	r2, r3, #2
 8001b40:	60e2      	str	r2, [r4, #12]
 8001b42:	6b2a      	ldr	r2, [r5, #48]	; 0x30
 8001b44:	0656      	lsls	r6, r2, #25
 8001b46:	d401      	bmi.n	8001b4c <RCC_GetClocksFreq+0x98>
 8001b48:	4a3b      	ldr	r2, [pc, #236]	; (8001c38 <RCC_GetClocksFreq+0x184>)
 8001b4a:	e001      	b.n	8001b50 <RCC_GetClocksFreq+0x9c>
 8001b4c:	2280      	movs	r2, #128	; 0x80
 8001b4e:	0212      	lsls	r2, r2, #8
 8001b50:	6122      	str	r2, [r4, #16]
 8001b52:	6b2a      	ldr	r2, [r5, #48]	; 0x30
 8001b54:	06d6      	lsls	r6, r2, #27
 8001b56:	d402      	bmi.n	8001b5e <RCC_GetClocksFreq+0xaa>
 8001b58:	4a33      	ldr	r2, [pc, #204]	; (8001c28 <RCC_GetClocksFreq+0x174>)
 8001b5a:	6162      	str	r2, [r4, #20]
 8001b5c:	e000      	b.n	8001b60 <RCC_GetClocksFreq+0xac>
 8001b5e:	6161      	str	r1, [r4, #20]
 8001b60:	6b2f      	ldr	r7, [r5, #48]	; 0x30
 8001b62:	2203      	movs	r2, #3
 8001b64:	4e2e      	ldr	r6, [pc, #184]	; (8001c20 <RCC_GetClocksFreq+0x16c>)
 8001b66:	4217      	tst	r7, r2
 8001b68:	d101      	bne.n	8001b6e <RCC_GetClocksFreq+0xba>
 8001b6a:	61a3      	str	r3, [r4, #24]
 8001b6c:	e012      	b.n	8001b94 <RCC_GetClocksFreq+0xe0>
 8001b6e:	6b37      	ldr	r7, [r6, #48]	; 0x30
 8001b70:	4017      	ands	r7, r2
 8001b72:	2f01      	cmp	r7, #1
 8001b74:	d101      	bne.n	8001b7a <RCC_GetClocksFreq+0xc6>
 8001b76:	61a1      	str	r1, [r4, #24]
 8001b78:	e00c      	b.n	8001b94 <RCC_GetClocksFreq+0xe0>
 8001b7a:	6b37      	ldr	r7, [r6, #48]	; 0x30
 8001b7c:	4017      	ands	r7, r2
 8001b7e:	2f02      	cmp	r7, #2
 8001b80:	d102      	bne.n	8001b88 <RCC_GetClocksFreq+0xd4>
 8001b82:	2280      	movs	r2, #128	; 0x80
 8001b84:	0212      	lsls	r2, r2, #8
 8001b86:	e004      	b.n	8001b92 <RCC_GetClocksFreq+0xde>
 8001b88:	6b36      	ldr	r6, [r6, #48]	; 0x30
 8001b8a:	4032      	ands	r2, r6
 8001b8c:	2a03      	cmp	r2, #3
 8001b8e:	d101      	bne.n	8001b94 <RCC_GetClocksFreq+0xe0>
 8001b90:	4a25      	ldr	r2, [pc, #148]	; (8001c28 <RCC_GetClocksFreq+0x174>)
 8001b92:	61a2      	str	r2, [r4, #24]
 8001b94:	22c0      	movs	r2, #192	; 0xc0
 8001b96:	6b2f      	ldr	r7, [r5, #48]	; 0x30
 8001b98:	0292      	lsls	r2, r2, #10
 8001b9a:	4e21      	ldr	r6, [pc, #132]	; (8001c20 <RCC_GetClocksFreq+0x16c>)
 8001b9c:	4217      	tst	r7, r2
 8001b9e:	d101      	bne.n	8001ba4 <RCC_GetClocksFreq+0xf0>
 8001ba0:	61e3      	str	r3, [r4, #28]
 8001ba2:	e018      	b.n	8001bd6 <RCC_GetClocksFreq+0x122>
 8001ba4:	6b37      	ldr	r7, [r6, #48]	; 0x30
 8001ba6:	4017      	ands	r7, r2
 8001ba8:	46bc      	mov	ip, r7
 8001baa:	2780      	movs	r7, #128	; 0x80
 8001bac:	027f      	lsls	r7, r7, #9
 8001bae:	45bc      	cmp	ip, r7
 8001bb0:	d101      	bne.n	8001bb6 <RCC_GetClocksFreq+0x102>
 8001bb2:	61e1      	str	r1, [r4, #28]
 8001bb4:	e00f      	b.n	8001bd6 <RCC_GetClocksFreq+0x122>
 8001bb6:	6b37      	ldr	r7, [r6, #48]	; 0x30
 8001bb8:	4017      	ands	r7, r2
 8001bba:	46bc      	mov	ip, r7
 8001bbc:	2780      	movs	r7, #128	; 0x80
 8001bbe:	02bf      	lsls	r7, r7, #10
 8001bc0:	45bc      	cmp	ip, r7
 8001bc2:	d102      	bne.n	8001bca <RCC_GetClocksFreq+0x116>
 8001bc4:	2280      	movs	r2, #128	; 0x80
 8001bc6:	0212      	lsls	r2, r2, #8
 8001bc8:	e004      	b.n	8001bd4 <RCC_GetClocksFreq+0x120>
 8001bca:	6b36      	ldr	r6, [r6, #48]	; 0x30
 8001bcc:	4016      	ands	r6, r2
 8001bce:	4296      	cmp	r6, r2
 8001bd0:	d101      	bne.n	8001bd6 <RCC_GetClocksFreq+0x122>
 8001bd2:	4a15      	ldr	r2, [pc, #84]	; (8001c28 <RCC_GetClocksFreq+0x174>)
 8001bd4:	61e2      	str	r2, [r4, #28]
 8001bd6:	22c0      	movs	r2, #192	; 0xc0
 8001bd8:	6b2f      	ldr	r7, [r5, #48]	; 0x30
 8001bda:	0312      	lsls	r2, r2, #12
 8001bdc:	4e10      	ldr	r6, [pc, #64]	; (8001c20 <RCC_GetClocksFreq+0x16c>)
 8001bde:	4217      	tst	r7, r2
 8001be0:	d015      	beq.n	8001c0e <RCC_GetClocksFreq+0x15a>
 8001be2:	6b37      	ldr	r7, [r6, #48]	; 0x30
 8001be4:	2380      	movs	r3, #128	; 0x80
 8001be6:	4017      	ands	r7, r2
 8001be8:	02db      	lsls	r3, r3, #11
 8001bea:	429f      	cmp	r7, r3
 8001bec:	d101      	bne.n	8001bf2 <RCC_GetClocksFreq+0x13e>
 8001bee:	6221      	str	r1, [r4, #32]
 8001bf0:	e00e      	b.n	8001c10 <RCC_GetClocksFreq+0x15c>
 8001bf2:	6b31      	ldr	r1, [r6, #48]	; 0x30
 8001bf4:	2380      	movs	r3, #128	; 0x80
 8001bf6:	4011      	ands	r1, r2
 8001bf8:	031b      	lsls	r3, r3, #12
 8001bfa:	4299      	cmp	r1, r3
 8001bfc:	d102      	bne.n	8001c04 <RCC_GetClocksFreq+0x150>
 8001bfe:	2380      	movs	r3, #128	; 0x80
 8001c00:	021b      	lsls	r3, r3, #8
 8001c02:	e004      	b.n	8001c0e <RCC_GetClocksFreq+0x15a>
 8001c04:	6b33      	ldr	r3, [r6, #48]	; 0x30
 8001c06:	4013      	ands	r3, r2
 8001c08:	4293      	cmp	r3, r2
 8001c0a:	d101      	bne.n	8001c10 <RCC_GetClocksFreq+0x15c>
 8001c0c:	4b06      	ldr	r3, [pc, #24]	; (8001c28 <RCC_GetClocksFreq+0x174>)
 8001c0e:	6223      	str	r3, [r4, #32]
 8001c10:	6b2b      	ldr	r3, [r5, #48]	; 0x30
 8001c12:	061a      	lsls	r2, r3, #24
 8001c14:	d402      	bmi.n	8001c1c <RCC_GetClocksFreq+0x168>
 8001c16:	4b05      	ldr	r3, [pc, #20]	; (8001c2c <RCC_GetClocksFreq+0x178>)
 8001c18:	6263      	str	r3, [r4, #36]	; 0x24
 8001c1a:	e000      	b.n	8001c1e <RCC_GetClocksFreq+0x16a>
 8001c1c:	6260      	str	r0, [r4, #36]	; 0x24
 8001c1e:	bdf8      	pop	{r3, r4, r5, r6, r7, pc}
 8001c20:	40021000 	.word	0x40021000
 8001c24:	003d0900 	.word	0x003d0900
 8001c28:	007a1200 	.word	0x007a1200
 8001c2c:	02dc6c00 	.word	0x02dc6c00
 8001c30:	20000000 	.word	0x20000000
 8001c34:	00d59f80 	.word	0x00d59f80
 8001c38:	00008012 	.word	0x00008012

08001c3c <RCC_AHBPeriphClockCmd>:
 8001c3c:	b538      	push	{r3, r4, r5, lr}
 8001c3e:	4b0d      	ldr	r3, [pc, #52]	; (8001c74 <RCC_AHBPeriphClockCmd+0x38>)
 8001c40:	1c04      	adds	r4, r0, #0
 8001c42:	1c0d      	adds	r5, r1, #0
 8001c44:	2000      	movs	r0, #0
 8001c46:	421c      	tst	r4, r3
 8001c48:	d102      	bne.n	8001c50 <RCC_AHBPeriphClockCmd+0x14>
 8001c4a:	1c20      	adds	r0, r4, #0
 8001c4c:	1e43      	subs	r3, r0, #1
 8001c4e:	4198      	sbcs	r0, r3
 8001c50:	f7fe ff1e 	bl	8000a90 <assert_param>
 8001c54:	2301      	movs	r3, #1
 8001c56:	2000      	movs	r0, #0
 8001c58:	42ab      	cmp	r3, r5
 8001c5a:	4140      	adcs	r0, r0
 8001c5c:	f7fe ff18 	bl	8000a90 <assert_param>
 8001c60:	4b05      	ldr	r3, [pc, #20]	; (8001c78 <RCC_AHBPeriphClockCmd+0x3c>)
 8001c62:	695a      	ldr	r2, [r3, #20]
 8001c64:	2d00      	cmp	r5, #0
 8001c66:	d002      	beq.n	8001c6e <RCC_AHBPeriphClockCmd+0x32>
 8001c68:	4314      	orrs	r4, r2
 8001c6a:	615c      	str	r4, [r3, #20]
 8001c6c:	e001      	b.n	8001c72 <RCC_AHBPeriphClockCmd+0x36>
 8001c6e:	43a2      	bics	r2, r4
 8001c70:	615a      	str	r2, [r3, #20]
 8001c72:	bd38      	pop	{r3, r4, r5, pc}
 8001c74:	fe81ffa8 	.word	0xfe81ffa8
 8001c78:	40021000 	.word	0x40021000

08001c7c <RCC_APB2PeriphClockCmd>:
 8001c7c:	b538      	push	{r3, r4, r5, lr}
 8001c7e:	4b0d      	ldr	r3, [pc, #52]	; (8001cb4 <RCC_APB2PeriphClockCmd+0x38>)
 8001c80:	1c04      	adds	r4, r0, #0
 8001c82:	1c0d      	adds	r5, r1, #0
 8001c84:	2000      	movs	r0, #0
 8001c86:	421c      	tst	r4, r3
 8001c88:	d102      	bne.n	8001c90 <RCC_APB2PeriphClockCmd+0x14>
 8001c8a:	1c20      	adds	r0, r4, #0
 8001c8c:	1e43      	subs	r3, r0, #1
 8001c8e:	4198      	sbcs	r0, r3
 8001c90:	f7fe fefe 	bl	8000a90 <assert_param>
 8001c94:	2301      	movs	r3, #1
 8001c96:	2000      	movs	r0, #0
 8001c98:	42ab      	cmp	r3, r5
 8001c9a:	4140      	adcs	r0, r0
 8001c9c:	f7fe fef8 	bl	8000a90 <assert_param>
 8001ca0:	4b05      	ldr	r3, [pc, #20]	; (8001cb8 <RCC_APB2PeriphClockCmd+0x3c>)
 8001ca2:	699a      	ldr	r2, [r3, #24]
 8001ca4:	2d00      	cmp	r5, #0
 8001ca6:	d002      	beq.n	8001cae <RCC_APB2PeriphClockCmd+0x32>
 8001ca8:	4314      	orrs	r4, r2
 8001caa:	619c      	str	r4, [r3, #24]
 8001cac:	e001      	b.n	8001cb2 <RCC_APB2PeriphClockCmd+0x36>
 8001cae:	43a2      	bics	r2, r4
 8001cb0:	619a      	str	r2, [r3, #24]
 8001cb2:	bd38      	pop	{r3, r4, r5, pc}
 8001cb4:	ffb8a51e 	.word	0xffb8a51e
 8001cb8:	40021000 	.word	0x40021000

08001cbc <RCC_APB1PeriphClockCmd>:
 8001cbc:	b538      	push	{r3, r4, r5, lr}
 8001cbe:	4b0d      	ldr	r3, [pc, #52]	; (8001cf4 <RCC_APB1PeriphClockCmd+0x38>)
 8001cc0:	1c04      	adds	r4, r0, #0
 8001cc2:	1c0d      	adds	r5, r1, #0
 8001cc4:	2000      	movs	r0, #0
 8001cc6:	421c      	tst	r4, r3
 8001cc8:	d102      	bne.n	8001cd0 <RCC_APB1PeriphClockCmd+0x14>
 8001cca:	1c20      	adds	r0, r4, #0
 8001ccc:	1e43      	subs	r3, r0, #1
 8001cce:	4198      	sbcs	r0, r3
 8001cd0:	f7fe fede 	bl	8000a90 <assert_param>
 8001cd4:	2301      	movs	r3, #1
 8001cd6:	2000      	movs	r0, #0
 8001cd8:	42ab      	cmp	r3, r5
 8001cda:	4140      	adcs	r0, r0
 8001cdc:	f7fe fed8 	bl	8000a90 <assert_param>
 8001ce0:	4b05      	ldr	r3, [pc, #20]	; (8001cf8 <RCC_APB1PeriphClockCmd+0x3c>)
 8001ce2:	69da      	ldr	r2, [r3, #28]
 8001ce4:	2d00      	cmp	r5, #0
 8001ce6:	d002      	beq.n	8001cee <RCC_APB1PeriphClockCmd+0x32>
 8001ce8:	4314      	orrs	r4, r2
 8001cea:	61dc      	str	r4, [r3, #28]
 8001cec:	e001      	b.n	8001cf2 <RCC_APB1PeriphClockCmd+0x36>
 8001cee:	43a2      	bics	r2, r4
 8001cf0:	61da      	str	r2, [r3, #28]
 8001cf2:	bd38      	pop	{r3, r4, r5, pc}
 8001cf4:	8581b6cc 	.word	0x8581b6cc
 8001cf8:	40021000 	.word	0x40021000

08001cfc <RCC_APB2PeriphResetCmd>:
 8001cfc:	b538      	push	{r3, r4, r5, lr}
 8001cfe:	4b0d      	ldr	r3, [pc, #52]	; (8001d34 <RCC_APB2PeriphResetCmd+0x38>)
 8001d00:	1c04      	adds	r4, r0, #0
 8001d02:	1c0d      	adds	r5, r1, #0
 8001d04:	2000      	movs	r0, #0
 8001d06:	421c      	tst	r4, r3
 8001d08:	d102      	bne.n	8001d10 <RCC_APB2PeriphResetCmd+0x14>
 8001d0a:	1c20      	adds	r0, r4, #0
 8001d0c:	1e43      	subs	r3, r0, #1
 8001d0e:	4198      	sbcs	r0, r3
 8001d10:	f7fe febe 	bl	8000a90 <assert_param>
 8001d14:	2301      	movs	r3, #1
 8001d16:	2000      	movs	r0, #0
 8001d18:	42ab      	cmp	r3, r5
 8001d1a:	4140      	adcs	r0, r0
 8001d1c:	f7fe feb8 	bl	8000a90 <assert_param>
 8001d20:	4b05      	ldr	r3, [pc, #20]	; (8001d38 <RCC_APB2PeriphResetCmd+0x3c>)
 8001d22:	68da      	ldr	r2, [r3, #12]
 8001d24:	2d00      	cmp	r5, #0
 8001d26:	d002      	beq.n	8001d2e <RCC_APB2PeriphResetCmd+0x32>
 8001d28:	4314      	orrs	r4, r2
 8001d2a:	60dc      	str	r4, [r3, #12]
 8001d2c:	e001      	b.n	8001d32 <RCC_APB2PeriphResetCmd+0x36>
 8001d2e:	43a2      	bics	r2, r4
 8001d30:	60da      	str	r2, [r3, #12]
 8001d32:	bd38      	pop	{r3, r4, r5, pc}
 8001d34:	ffb8a51e 	.word	0xffb8a51e
 8001d38:	40021000 	.word	0x40021000

08001d3c <gpio_init>:
 8001d3c:	b5f7      	push	{r0, r1, r2, r4, r5, r6, r7, lr}
 8001d3e:	2080      	movs	r0, #128	; 0x80
 8001d40:	0280      	lsls	r0, r0, #10
 8001d42:	2101      	movs	r1, #1
 8001d44:	f7ff ff7a 	bl	8001c3c <RCC_AHBPeriphClockCmd>
 8001d48:	2080      	movs	r0, #128	; 0x80
 8001d4a:	02c0      	lsls	r0, r0, #11
 8001d4c:	2101      	movs	r1, #1
 8001d4e:	f7ff ff75 	bl	8001c3c <RCC_AHBPeriphClockCmd>
 8001d52:	2208      	movs	r2, #8
 8001d54:	2400      	movs	r4, #0
 8001d56:	466b      	mov	r3, sp
 8001d58:	2603      	movs	r6, #3
 8001d5a:	9200      	str	r2, [sp, #0]
 8001d5c:	4669      	mov	r1, sp
 8001d5e:	2201      	movs	r2, #1
 8001d60:	481c      	ldr	r0, [pc, #112]	; (8001dd4 <gpio_init+0x98>)
 8001d62:	715e      	strb	r6, [r3, #5]
 8001d64:	711a      	strb	r2, [r3, #4]
 8001d66:	719c      	strb	r4, [r3, #6]
 8001d68:	71dc      	strb	r4, [r3, #7]
 8001d6a:	2590      	movs	r5, #144	; 0x90
 8001d6c:	f7ff f83a 	bl	8000de4 <GPIO_Init>
 8001d70:	2380      	movs	r3, #128	; 0x80
 8001d72:	05ed      	lsls	r5, r5, #23
 8001d74:	005b      	lsls	r3, r3, #1
 8001d76:	466a      	mov	r2, sp
 8001d78:	1c28      	adds	r0, r5, #0
 8001d7a:	9300      	str	r3, [sp, #0]
 8001d7c:	4669      	mov	r1, sp
 8001d7e:	2301      	movs	r3, #1
 8001d80:	2780      	movs	r7, #128	; 0x80
 8001d82:	7156      	strb	r6, [r2, #5]
 8001d84:	013f      	lsls	r7, r7, #4
 8001d86:	7113      	strb	r3, [r2, #4]
 8001d88:	7194      	strb	r4, [r2, #6]
 8001d8a:	71d4      	strb	r4, [r2, #7]
 8001d8c:	f7ff f82a 	bl	8000de4 <GPIO_Init>
 8001d90:	466a      	mov	r2, sp
 8001d92:	1c28      	adds	r0, r5, #0
 8001d94:	2301      	movs	r3, #1
 8001d96:	4669      	mov	r1, sp
 8001d98:	7156      	strb	r6, [r2, #5]
 8001d9a:	9700      	str	r7, [sp, #0]
 8001d9c:	7113      	strb	r3, [r2, #4]
 8001d9e:	7194      	strb	r4, [r2, #6]
 8001da0:	71d4      	strb	r4, [r2, #7]
 8001da2:	f7ff f81f 	bl	8000de4 <GPIO_Init>
 8001da6:	2202      	movs	r2, #2
 8001da8:	466b      	mov	r3, sp
 8001daa:	9200      	str	r2, [sp, #0]
 8001dac:	1c28      	adds	r0, r5, #0
 8001dae:	2201      	movs	r2, #1
 8001db0:	4669      	mov	r1, sp
 8001db2:	715e      	strb	r6, [r3, #5]
 8001db4:	711a      	strb	r2, [r3, #4]
 8001db6:	719c      	strb	r4, [r3, #6]
 8001db8:	71dc      	strb	r4, [r3, #7]
 8001dba:	f7ff f813 	bl	8000de4 <GPIO_Init>
 8001dbe:	4b05      	ldr	r3, [pc, #20]	; (8001dd4 <gpio_init+0x98>)
 8001dc0:	2208      	movs	r2, #8
 8001dc2:	851a      	strh	r2, [r3, #40]	; 0x28
 8001dc4:	2380      	movs	r3, #128	; 0x80
 8001dc6:	005b      	lsls	r3, r3, #1
 8001dc8:	2202      	movs	r2, #2
 8001dca:	852b      	strh	r3, [r5, #40]	; 0x28
 8001dcc:	852f      	strh	r7, [r5, #40]	; 0x28
 8001dce:	852a      	strh	r2, [r5, #40]	; 0x28
 8001dd0:	bdf7      	pop	{r0, r1, r2, r4, r5, r6, r7, pc}
 8001dd2:	46c0      	nop			; (mov r8, r8)
 8001dd4:	48000400 	.word	0x48000400

08001dd8 <led_on>:
 8001dd8:	2808      	cmp	r0, #8
 8001dda:	d101      	bne.n	8001de0 <led_on+0x8>
 8001ddc:	4b07      	ldr	r3, [pc, #28]	; (8001dfc <led_on+0x24>)
 8001dde:	e00b      	b.n	8001df8 <led_on+0x20>
 8001de0:	2380      	movs	r3, #128	; 0x80
 8001de2:	005b      	lsls	r3, r3, #1
 8001de4:	4298      	cmp	r0, r3
 8001de6:	d005      	beq.n	8001df4 <led_on+0x1c>
 8001de8:	2380      	movs	r3, #128	; 0x80
 8001dea:	011b      	lsls	r3, r3, #4
 8001dec:	4298      	cmp	r0, r3
 8001dee:	d001      	beq.n	8001df4 <led_on+0x1c>
 8001df0:	2802      	cmp	r0, #2
 8001df2:	d102      	bne.n	8001dfa <led_on+0x22>
 8001df4:	2390      	movs	r3, #144	; 0x90
 8001df6:	05db      	lsls	r3, r3, #23
 8001df8:	6198      	str	r0, [r3, #24]
 8001dfa:	4770      	bx	lr
 8001dfc:	48000400 	.word	0x48000400

08001e00 <led_off>:
 8001e00:	2808      	cmp	r0, #8
 8001e02:	d101      	bne.n	8001e08 <led_off+0x8>
 8001e04:	4b07      	ldr	r3, [pc, #28]	; (8001e24 <led_off+0x24>)
 8001e06:	e00b      	b.n	8001e20 <led_off+0x20>
 8001e08:	2380      	movs	r3, #128	; 0x80
 8001e0a:	005b      	lsls	r3, r3, #1
 8001e0c:	4298      	cmp	r0, r3
 8001e0e:	d005      	beq.n	8001e1c <led_off+0x1c>
 8001e10:	2380      	movs	r3, #128	; 0x80
 8001e12:	011b      	lsls	r3, r3, #4
 8001e14:	4298      	cmp	r0, r3
 8001e16:	d001      	beq.n	8001e1c <led_off+0x1c>
 8001e18:	2802      	cmp	r0, #2
 8001e1a:	d102      	bne.n	8001e22 <led_off+0x22>
 8001e1c:	2390      	movs	r3, #144	; 0x90
 8001e1e:	05db      	lsls	r3, r3, #23
 8001e20:	8518      	strh	r0, [r3, #40]	; 0x28
 8001e22:	4770      	bx	lr
 8001e24:	48000400 	.word	0x48000400

08001e28 <Default_Handler>:
 8001e28:	4770      	bx	lr
	...

08001e2c <HardFault_Handler>:
 8001e2c:	2008      	movs	r0, #8
 8001e2e:	f7ff ffd3 	bl	8001dd8 <led_on>
 8001e32:	4b07      	ldr	r3, [pc, #28]	; (8001e50 <HardFault_Handler+0x24>)
 8001e34:	3b01      	subs	r3, #1
 8001e36:	2b00      	cmp	r3, #0
 8001e38:	d001      	beq.n	8001e3e <HardFault_Handler+0x12>
 8001e3a:	46c0      	nop			; (mov r8, r8)
 8001e3c:	e7fa      	b.n	8001e34 <HardFault_Handler+0x8>
 8001e3e:	2008      	movs	r0, #8
 8001e40:	f7ff ffde 	bl	8001e00 <led_off>
 8001e44:	4b02      	ldr	r3, [pc, #8]	; (8001e50 <HardFault_Handler+0x24>)
 8001e46:	3b01      	subs	r3, #1
 8001e48:	2b00      	cmp	r3, #0
 8001e4a:	d0ef      	beq.n	8001e2c <HardFault_Handler>
 8001e4c:	46c0      	nop			; (mov r8, r8)
 8001e4e:	e7fa      	b.n	8001e46 <HardFault_Handler+0x1a>
 8001e50:	002dc6c1 	.word	0x002dc6c1

08001e54 <_reset_init>:
 8001e54:	4a07      	ldr	r2, [pc, #28]	; (8001e74 <_reset_init+0x20>)
 8001e56:	4908      	ldr	r1, [pc, #32]	; (8001e78 <_reset_init+0x24>)
 8001e58:	2300      	movs	r3, #0
 8001e5a:	1a89      	subs	r1, r1, r2
 8001e5c:	1089      	asrs	r1, r1, #2
 8001e5e:	1c10      	adds	r0, r2, #0
 8001e60:	428b      	cmp	r3, r1
 8001e62:	d005      	beq.n	8001e70 <_reset_init+0x1c>
 8001e64:	4c05      	ldr	r4, [pc, #20]	; (8001e7c <_reset_init+0x28>)
 8001e66:	009a      	lsls	r2, r3, #2
 8001e68:	58a4      	ldr	r4, [r4, r2]
 8001e6a:	3301      	adds	r3, #1
 8001e6c:	5084      	str	r4, [r0, r2]
 8001e6e:	e7f7      	b.n	8001e60 <_reset_init+0xc>
 8001e70:	f7fe fc1e 	bl	80006b0 <main>
 8001e74:	20000000 	.word	0x20000000
 8001e78:	20000010 	.word	0x20000010
 8001e7c:	08002084 	.word	0x08002084

08001e80 <__gnu_thumb1_case_uqi>:
 8001e80:	b402      	push	{r1}
 8001e82:	4671      	mov	r1, lr
 8001e84:	0849      	lsrs	r1, r1, #1
 8001e86:	0049      	lsls	r1, r1, #1
 8001e88:	5c09      	ldrb	r1, [r1, r0]
 8001e8a:	0049      	lsls	r1, r1, #1
 8001e8c:	448e      	add	lr, r1
 8001e8e:	bc02      	pop	{r1}
 8001e90:	4770      	bx	lr
 8001e92:	46c0      	nop			; (mov r8, r8)

08001e94 <__aeabi_uidiv>:
 8001e94:	2900      	cmp	r1, #0
 8001e96:	d034      	beq.n	8001f02 <.udivsi3_skip_div0_test+0x6a>

08001e98 <.udivsi3_skip_div0_test>:
 8001e98:	2301      	movs	r3, #1
 8001e9a:	2200      	movs	r2, #0
 8001e9c:	b410      	push	{r4}
 8001e9e:	4288      	cmp	r0, r1
 8001ea0:	d32c      	bcc.n	8001efc <.udivsi3_skip_div0_test+0x64>
 8001ea2:	2401      	movs	r4, #1
 8001ea4:	0724      	lsls	r4, r4, #28
 8001ea6:	42a1      	cmp	r1, r4
 8001ea8:	d204      	bcs.n	8001eb4 <.udivsi3_skip_div0_test+0x1c>
 8001eaa:	4281      	cmp	r1, r0
 8001eac:	d202      	bcs.n	8001eb4 <.udivsi3_skip_div0_test+0x1c>
 8001eae:	0109      	lsls	r1, r1, #4
 8001eb0:	011b      	lsls	r3, r3, #4
 8001eb2:	e7f8      	b.n	8001ea6 <.udivsi3_skip_div0_test+0xe>
 8001eb4:	00e4      	lsls	r4, r4, #3
 8001eb6:	42a1      	cmp	r1, r4
 8001eb8:	d204      	bcs.n	8001ec4 <.udivsi3_skip_div0_test+0x2c>
 8001eba:	4281      	cmp	r1, r0
 8001ebc:	d202      	bcs.n	8001ec4 <.udivsi3_skip_div0_test+0x2c>
 8001ebe:	0049      	lsls	r1, r1, #1
 8001ec0:	005b      	lsls	r3, r3, #1
 8001ec2:	e7f8      	b.n	8001eb6 <.udivsi3_skip_div0_test+0x1e>
 8001ec4:	4288      	cmp	r0, r1
 8001ec6:	d301      	bcc.n	8001ecc <.udivsi3_skip_div0_test+0x34>
 8001ec8:	1a40      	subs	r0, r0, r1
 8001eca:	431a      	orrs	r2, r3
 8001ecc:	084c      	lsrs	r4, r1, #1
 8001ece:	42a0      	cmp	r0, r4
 8001ed0:	d302      	bcc.n	8001ed8 <.udivsi3_skip_div0_test+0x40>
 8001ed2:	1b00      	subs	r0, r0, r4
 8001ed4:	085c      	lsrs	r4, r3, #1
 8001ed6:	4322      	orrs	r2, r4
 8001ed8:	088c      	lsrs	r4, r1, #2
 8001eda:	42a0      	cmp	r0, r4
 8001edc:	d302      	bcc.n	8001ee4 <.udivsi3_skip_div0_test+0x4c>
 8001ede:	1b00      	subs	r0, r0, r4
 8001ee0:	089c      	lsrs	r4, r3, #2
 8001ee2:	4322      	orrs	r2, r4
 8001ee4:	08cc      	lsrs	r4, r1, #3
 8001ee6:	42a0      	cmp	r0, r4
 8001ee8:	d302      	bcc.n	8001ef0 <.udivsi3_skip_div0_test+0x58>
 8001eea:	1b00      	subs	r0, r0, r4
 8001eec:	08dc      	lsrs	r4, r3, #3
 8001eee:	4322      	orrs	r2, r4
 8001ef0:	2800      	cmp	r0, #0
 8001ef2:	d003      	beq.n	8001efc <.udivsi3_skip_div0_test+0x64>
 8001ef4:	091b      	lsrs	r3, r3, #4
 8001ef6:	d001      	beq.n	8001efc <.udivsi3_skip_div0_test+0x64>
 8001ef8:	0909      	lsrs	r1, r1, #4
 8001efa:	e7e3      	b.n	8001ec4 <.udivsi3_skip_div0_test+0x2c>
 8001efc:	1c10      	adds	r0, r2, #0
 8001efe:	bc10      	pop	{r4}
 8001f00:	4770      	bx	lr
 8001f02:	2800      	cmp	r0, #0
 8001f04:	d001      	beq.n	8001f0a <.udivsi3_skip_div0_test+0x72>
 8001f06:	2000      	movs	r0, #0
 8001f08:	43c0      	mvns	r0, r0
 8001f0a:	b407      	push	{r0, r1, r2}
 8001f0c:	4802      	ldr	r0, [pc, #8]	; (8001f18 <.udivsi3_skip_div0_test+0x80>)
 8001f0e:	a102      	add	r1, pc, #8	; (adr r1, 8001f18 <.udivsi3_skip_div0_test+0x80>)
 8001f10:	1840      	adds	r0, r0, r1
 8001f12:	9002      	str	r0, [sp, #8]
 8001f14:	bd03      	pop	{r0, r1, pc}
 8001f16:	46c0      	nop			; (mov r8, r8)
 8001f18:	000000d9 	.word	0x000000d9

08001f1c <__aeabi_uidivmod>:
 8001f1c:	2900      	cmp	r1, #0
 8001f1e:	d0f0      	beq.n	8001f02 <.udivsi3_skip_div0_test+0x6a>
 8001f20:	b503      	push	{r0, r1, lr}
 8001f22:	f7ff ffb9 	bl	8001e98 <.udivsi3_skip_div0_test>
 8001f26:	bc0e      	pop	{r1, r2, r3}
 8001f28:	4342      	muls	r2, r0
 8001f2a:	1a89      	subs	r1, r1, r2
 8001f2c:	4718      	bx	r3
 8001f2e:	46c0      	nop			; (mov r8, r8)

08001f30 <__aeabi_idiv>:
 8001f30:	2900      	cmp	r1, #0
 8001f32:	d041      	beq.n	8001fb8 <.divsi3_skip_div0_test+0x84>

08001f34 <.divsi3_skip_div0_test>:
 8001f34:	b410      	push	{r4}
 8001f36:	1c04      	adds	r4, r0, #0
 8001f38:	404c      	eors	r4, r1
 8001f3a:	46a4      	mov	ip, r4
 8001f3c:	2301      	movs	r3, #1
 8001f3e:	2200      	movs	r2, #0
 8001f40:	2900      	cmp	r1, #0
 8001f42:	d500      	bpl.n	8001f46 <.divsi3_skip_div0_test+0x12>
 8001f44:	4249      	negs	r1, r1
 8001f46:	2800      	cmp	r0, #0
 8001f48:	d500      	bpl.n	8001f4c <.divsi3_skip_div0_test+0x18>
 8001f4a:	4240      	negs	r0, r0
 8001f4c:	4288      	cmp	r0, r1
 8001f4e:	d32c      	bcc.n	8001faa <.divsi3_skip_div0_test+0x76>
 8001f50:	2401      	movs	r4, #1
 8001f52:	0724      	lsls	r4, r4, #28
 8001f54:	42a1      	cmp	r1, r4
 8001f56:	d204      	bcs.n	8001f62 <.divsi3_skip_div0_test+0x2e>
 8001f58:	4281      	cmp	r1, r0
 8001f5a:	d202      	bcs.n	8001f62 <.divsi3_skip_div0_test+0x2e>
 8001f5c:	0109      	lsls	r1, r1, #4
 8001f5e:	011b      	lsls	r3, r3, #4
 8001f60:	e7f8      	b.n	8001f54 <.divsi3_skip_div0_test+0x20>
 8001f62:	00e4      	lsls	r4, r4, #3
 8001f64:	42a1      	cmp	r1, r4
 8001f66:	d204      	bcs.n	8001f72 <.divsi3_skip_div0_test+0x3e>
 8001f68:	4281      	cmp	r1, r0
 8001f6a:	d202      	bcs.n	8001f72 <.divsi3_skip_div0_test+0x3e>
 8001f6c:	0049      	lsls	r1, r1, #1
 8001f6e:	005b      	lsls	r3, r3, #1
 8001f70:	e7f8      	b.n	8001f64 <.divsi3_skip_div0_test+0x30>
 8001f72:	4288      	cmp	r0, r1
 8001f74:	d301      	bcc.n	8001f7a <.divsi3_skip_div0_test+0x46>
 8001f76:	1a40      	subs	r0, r0, r1
 8001f78:	431a      	orrs	r2, r3
 8001f7a:	084c      	lsrs	r4, r1, #1
 8001f7c:	42a0      	cmp	r0, r4
 8001f7e:	d302      	bcc.n	8001f86 <.divsi3_skip_div0_test+0x52>
 8001f80:	1b00      	subs	r0, r0, r4
 8001f82:	085c      	lsrs	r4, r3, #1
 8001f84:	4322      	orrs	r2, r4
 8001f86:	088c      	lsrs	r4, r1, #2
 8001f88:	42a0      	cmp	r0, r4
 8001f8a:	d302      	bcc.n	8001f92 <.divsi3_skip_div0_test+0x5e>
 8001f8c:	1b00      	subs	r0, r0, r4
 8001f8e:	089c      	lsrs	r4, r3, #2
 8001f90:	4322      	orrs	r2, r4
 8001f92:	08cc      	lsrs	r4, r1, #3
 8001f94:	42a0      	cmp	r0, r4
 8001f96:	d302      	bcc.n	8001f9e <.divsi3_skip_div0_test+0x6a>
 8001f98:	1b00      	subs	r0, r0, r4
 8001f9a:	08dc      	lsrs	r4, r3, #3
 8001f9c:	4322      	orrs	r2, r4
 8001f9e:	2800      	cmp	r0, #0
 8001fa0:	d003      	beq.n	8001faa <.divsi3_skip_div0_test+0x76>
 8001fa2:	091b      	lsrs	r3, r3, #4
 8001fa4:	d001      	beq.n	8001faa <.divsi3_skip_div0_test+0x76>
 8001fa6:	0909      	lsrs	r1, r1, #4
 8001fa8:	e7e3      	b.n	8001f72 <.divsi3_skip_div0_test+0x3e>
 8001faa:	1c10      	adds	r0, r2, #0
 8001fac:	4664      	mov	r4, ip
 8001fae:	2c00      	cmp	r4, #0
 8001fb0:	d500      	bpl.n	8001fb4 <.divsi3_skip_div0_test+0x80>
 8001fb2:	4240      	negs	r0, r0
 8001fb4:	bc10      	pop	{r4}
 8001fb6:	4770      	bx	lr
 8001fb8:	2800      	cmp	r0, #0
 8001fba:	d006      	beq.n	8001fca <.divsi3_skip_div0_test+0x96>
 8001fbc:	db03      	blt.n	8001fc6 <.divsi3_skip_div0_test+0x92>
 8001fbe:	2000      	movs	r0, #0
 8001fc0:	43c0      	mvns	r0, r0
 8001fc2:	0840      	lsrs	r0, r0, #1
 8001fc4:	e001      	b.n	8001fca <.divsi3_skip_div0_test+0x96>
 8001fc6:	2080      	movs	r0, #128	; 0x80
 8001fc8:	0600      	lsls	r0, r0, #24
 8001fca:	b407      	push	{r0, r1, r2}
 8001fcc:	4802      	ldr	r0, [pc, #8]	; (8001fd8 <.divsi3_skip_div0_test+0xa4>)
 8001fce:	a102      	add	r1, pc, #8	; (adr r1, 8001fd8 <.divsi3_skip_div0_test+0xa4>)
 8001fd0:	1840      	adds	r0, r0, r1
 8001fd2:	9002      	str	r0, [sp, #8]
 8001fd4:	bd03      	pop	{r0, r1, pc}
 8001fd6:	46c0      	nop			; (mov r8, r8)
 8001fd8:	00000019 	.word	0x00000019

08001fdc <__aeabi_idivmod>:
 8001fdc:	2900      	cmp	r1, #0
 8001fde:	d0eb      	beq.n	8001fb8 <.divsi3_skip_div0_test+0x84>
 8001fe0:	b503      	push	{r0, r1, lr}
 8001fe2:	f7ff ffa7 	bl	8001f34 <.divsi3_skip_div0_test>
 8001fe6:	bc0e      	pop	{r1, r2, r3}
 8001fe8:	4342      	muls	r2, r0
 8001fea:	1a89      	subs	r1, r1, r2
 8001fec:	4718      	bx	r3
 8001fee:	46c0      	nop			; (mov r8, r8)

08001ff0 <__aeabi_idiv0>:
 8001ff0:	4770      	bx	lr
 8001ff2:	46c0      	nop			; (mov r8, r8)

08001ff4 <_init>:
 8001ff4:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
 8001ff6:	46c0      	nop			; (mov r8, r8)
 8001ff8:	bcf8      	pop	{r3, r4, r5, r6, r7}
 8001ffa:	bc08      	pop	{r3}
 8001ffc:	469e      	mov	lr, r3
 8001ffe:	4770      	bx	lr

08002000 <_fini>:
 8002000:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
 8002002:	46c0      	nop			; (mov r8, r8)
 8002004:	bcf8      	pop	{r3, r4, r5, r6, r7}
 8002006:	bc08      	pop	{r3}
 8002008:	469e      	mov	lr, r3
 800200a:	4770      	bx	lr
 800200c:	69647473 	.word	0x69647473
 8002010:	6e69206f 	.word	0x6e69206f
 8002014:	64207469 	.word	0x64207469
 8002018:	0a656e6f 	.word	0x0a656e6f
 800201c:	00          	.byte	0x00
 800201d:	6d          	.byte	0x6d
 800201e:	6961      	.short	0x6961
 8002020:	6874206e 	.word	0x6874206e
 8002024:	64616572 	.word	0x64616572
 8002028:	7525000a 	.word	0x7525000a
 800202c:	0020      	.short	0x0020
 800202e:	6f62      	.short	0x6f62
 8002030:	6e69746f 	.word	0x6e69746f
 8002034:	72662067 	.word	0x72662067
 8002038:	25206d6f 	.word	0x25206d6f
 800203c:	72000a75 	.word	0x72000a75
 8002040:	73206d61 	.word	0x73206d61
 8002044:	74726174 	.word	0x74726174
 8002048:	20752520 	.word	0x20752520
 800204c:	6172000a 	.word	0x6172000a
 8002050:	6973206d 	.word	0x6973206d
 8002054:	2520657a 	.word	0x2520657a
 8002058:	000a2075 	.word	0x000a2075
 800205c:	206d6172 	.word	0x206d6172
 8002060:	65657266 	.word	0x65657266
 8002064:	20752520 	.word	0x20752520
 8002068:	6568000a 	.word	0x6568000a
 800206c:	73207061 	.word	0x73207061
 8002070:	74726174 	.word	0x74726174
 8002074:	20752520 	.word	0x20752520
 8002078:	0a0a000a 	.word	0x0a0a000a
 800207c:	00000000 	.word	0x00000000

08002080 <__EH_FRAME_BEGIN__>:
 8002080:	00000000                                ....
