
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
 80000e6:	f000 fcdb 	bl	8000aa0 <sleep>
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
 80001d2:	f000 fc59 	bl	8000a88 <sys_tick_init>
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
 8000342:	f000 fa43 	bl	80007cc <uart_write>
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
 8000398:	f001 fd80 	bl	8001e9c <__aeabi_idivmod>
 800039c:	3130      	adds	r1, #48	; 0x30
 800039e:	5571      	strb	r1, [r6, r5]
 80003a0:	1c20      	adds	r0, r4, #0
 80003a2:	210a      	movs	r1, #10
 80003a4:	f001 fd24 	bl	8001df0 <__aeabi_idiv>
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
 80003d6:	f001 fd01 	bl	8001ddc <__aeabi_uidivmod>
 80003da:	3130      	adds	r1, #48	; 0x30
 80003dc:	5531      	strb	r1, [r6, r4]
 80003de:	1c28      	adds	r0, r5, #0
 80003e0:	210a      	movs	r1, #10
 80003e2:	f001 fcb7 	bl	8001d54 <__aeabi_uidiv>
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
 8000518:	08001ecc 	.word	0x08001ecc

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
 8000588:	2033      	movs	r0, #51	; 0x33
 800058a:	b538      	push	{r3, r4, r5, lr}
 800058c:	f000 fa22 	bl	80009d4 <adc_init>
 8000590:	2000      	movs	r0, #0
 8000592:	2132      	movs	r1, #50	; 0x32
 8000594:	f000 f8f6 	bl	8000784 <event_timer_set_period>
 8000598:	2000      	movs	r0, #0
 800059a:	f000 f905 	bl	80007a8 <event_timer_wait>
 800059e:	2001      	movs	r0, #1
 80005a0:	f000 fa54 	bl	8000a4c <adc_config_ch>
 80005a4:	f000 fa5c 	bl	8000a60 <adc_read>
 80005a8:	4c12      	ldr	r4, [pc, #72]	; (80005f4 <adc_thread+0x6c>)
 80005aa:	2500      	movs	r5, #0
 80005ac:	6020      	str	r0, [r4, #0]
 80005ae:	2002      	movs	r0, #2
 80005b0:	f000 fa4c 	bl	8000a4c <adc_config_ch>
 80005b4:	f000 fa54 	bl	8000a60 <adc_read>
 80005b8:	6060      	str	r0, [r4, #4]
 80005ba:	2008      	movs	r0, #8
 80005bc:	f000 fa46 	bl	8000a4c <adc_config_ch>
 80005c0:	f000 fa4e 	bl	8000a60 <adc_read>
 80005c4:	60a0      	str	r0, [r4, #8]
 80005c6:	2010      	movs	r0, #16
 80005c8:	f000 fa40 	bl	8000a4c <adc_config_ch>
 80005cc:	f000 fa48 	bl	8000a60 <adc_read>
 80005d0:	60e0      	str	r0, [r4, #12]
 80005d2:	2008      	movs	r0, #8
 80005d4:	f001 fb60 	bl	8001c98 <led_on>
 80005d8:	5961      	ldr	r1, [r4, r5]
 80005da:	4807      	ldr	r0, [pc, #28]	; (80005f8 <adc_thread+0x70>)
 80005dc:	3504      	adds	r5, #4
 80005de:	f7ff ff23 	bl	8000428 <printf_>
 80005e2:	2d10      	cmp	r5, #16
 80005e4:	d1f8      	bne.n	80005d8 <adc_thread+0x50>
 80005e6:	4805      	ldr	r0, [pc, #20]	; (80005fc <adc_thread+0x74>)
 80005e8:	f7ff ff1e 	bl	8000428 <printf_>
 80005ec:	2008      	movs	r0, #8
 80005ee:	f001 fb67 	bl	8001cc0 <led_off>
 80005f2:	e7d1      	b.n	8000598 <adc_thread+0x10>
 80005f4:	2000038c 	.word	0x2000038c
 80005f8:	08001edd 	.word	0x08001edd
 80005fc:	08001f2e 	.word	0x08001f2e

08000600 <main_thread>:
 8000600:	2280      	movs	r2, #128	; 0x80
 8000602:	b508      	push	{r3, lr}
 8000604:	4804      	ldr	r0, [pc, #16]	; (8000618 <main_thread+0x18>)
 8000606:	4905      	ldr	r1, [pc, #20]	; (800061c <main_thread+0x1c>)
 8000608:	0052      	lsls	r2, r2, #1
 800060a:	2308      	movs	r3, #8
 800060c:	f7ff fde6 	bl	80001dc <create_thread>
 8000610:	2000      	movs	r0, #0
 8000612:	f000 f8c9 	bl	80007a8 <event_timer_wait>
 8000616:	e7fb      	b.n	8000610 <main_thread+0x10>
 8000618:	08000589 	.word	0x08000589
 800061c:	2000018c 	.word	0x2000018c

08000620 <mem_info_print>:
 8000620:	b538      	push	{r3, r4, r5, lr}
 8000622:	480e      	ldr	r0, [pc, #56]	; (800065c <mem_info_print+0x3c>)
 8000624:	490e      	ldr	r1, [pc, #56]	; (8000660 <mem_info_print+0x40>)
 8000626:	f7ff feff 	bl	8000428 <printf_>
 800062a:	4c0e      	ldr	r4, [pc, #56]	; (8000664 <mem_info_print+0x44>)
 800062c:	480e      	ldr	r0, [pc, #56]	; (8000668 <mem_info_print+0x48>)
 800062e:	1c21      	adds	r1, r4, #0
 8000630:	f7ff fefa 	bl	8000428 <printf_>
 8000634:	4d0d      	ldr	r5, [pc, #52]	; (800066c <mem_info_print+0x4c>)
 8000636:	480e      	ldr	r0, [pc, #56]	; (8000670 <mem_info_print+0x50>)
 8000638:	1b2d      	subs	r5, r5, r4
 800063a:	1c29      	adds	r1, r5, #0
 800063c:	f7ff fef4 	bl	8000428 <printf_>
 8000640:	490c      	ldr	r1, [pc, #48]	; (8000674 <mem_info_print+0x54>)
 8000642:	480d      	ldr	r0, [pc, #52]	; (8000678 <mem_info_print+0x58>)
 8000644:	1a64      	subs	r4, r4, r1
 8000646:	1929      	adds	r1, r5, r4
 8000648:	f7ff feee 	bl	8000428 <printf_>
 800064c:	490b      	ldr	r1, [pc, #44]	; (800067c <mem_info_print+0x5c>)
 800064e:	480c      	ldr	r0, [pc, #48]	; (8000680 <mem_info_print+0x60>)
 8000650:	f7ff feea 	bl	8000428 <printf_>
 8000654:	480b      	ldr	r0, [pc, #44]	; (8000684 <mem_info_print+0x64>)
 8000656:	f7ff fee7 	bl	8000428 <printf_>
 800065a:	bd38      	pop	{r3, r4, r5, pc}
 800065c:	08001ee1 	.word	0x08001ee1
 8000660:	08001eb4 	.word	0x08001eb4
 8000664:	20000000 	.word	0x20000000
 8000668:	08001ef2 	.word	0x08001ef2
 800066c:	20001000 	.word	0x20001000
 8000670:	08001f01 	.word	0x08001f01
 8000674:	200003ec 	.word	0x200003ec
 8000678:	08001f0f 	.word	0x08001f0f
 800067c:	200003ec 	.word	0x200003ec
 8000680:	08001f1d 	.word	0x08001f1d
 8000684:	08001f2d 	.word	0x08001f2d

08000688 <main>:
 8000688:	b508      	push	{r3, lr}
 800068a:	f000 faaf 	bl	8000bec <lib_low_level_init>
 800068e:	f7ff ff45 	bl	800051c <lib_os_init>
 8000692:	f7ff ffc5 	bl	8000620 <mem_info_print>
 8000696:	2280      	movs	r2, #128	; 0x80
 8000698:	4904      	ldr	r1, [pc, #16]	; (80006ac <main+0x24>)
 800069a:	0052      	lsls	r2, r2, #1
 800069c:	2308      	movs	r3, #8
 800069e:	4804      	ldr	r0, [pc, #16]	; (80006b0 <main+0x28>)
 80006a0:	f7ff fd9c 	bl	80001dc <create_thread>
 80006a4:	f7ff fd94 	bl	80001d0 <kernel_start>
 80006a8:	2000      	movs	r0, #0
 80006aa:	bd08      	pop	{r3, pc}
 80006ac:	2000028c 	.word	0x2000028c
 80006b0:	08000601 	.word	0x08000601

080006b4 <timer_init>:
 80006b4:	b530      	push	{r4, r5, lr}
 80006b6:	2300      	movs	r3, #0
 80006b8:	b085      	sub	sp, #20
 80006ba:	481b      	ldr	r0, [pc, #108]	; (8000728 <timer_init+0x74>)
 80006bc:	2180      	movs	r1, #128	; 0x80
 80006be:	005a      	lsls	r2, r3, #1
 80006c0:	00c9      	lsls	r1, r1, #3
 80006c2:	5211      	strh	r1, [r2, r0]
 80006c4:	4819      	ldr	r0, [pc, #100]	; (800072c <timer_init+0x78>)
 80006c6:	2400      	movs	r4, #0
 80006c8:	5211      	strh	r1, [r2, r0]
 80006ca:	4919      	ldr	r1, [pc, #100]	; (8000730 <timer_init+0x7c>)
 80006cc:	3301      	adds	r3, #1
 80006ce:	5254      	strh	r4, [r2, r1]
 80006d0:	2b04      	cmp	r3, #4
 80006d2:	d1f2      	bne.n	80006ba <timer_init+0x6>
 80006d4:	4b17      	ldr	r3, [pc, #92]	; (8000734 <timer_init+0x80>)
 80006d6:	2001      	movs	r0, #1
 80006d8:	1c01      	adds	r1, r0, #0
 80006da:	601c      	str	r4, [r3, #0]
 80006dc:	f001 fa4e 	bl	8001b7c <RCC_APB1PeriphClockCmd>
 80006e0:	a901      	add	r1, sp, #4
 80006e2:	2330      	movs	r3, #48	; 0x30
 80006e4:	800b      	strh	r3, [r1, #0]
 80006e6:	2080      	movs	r0, #128	; 0x80
 80006e8:	23fa      	movs	r3, #250	; 0xfa
 80006ea:	009b      	lsls	r3, r3, #2
 80006ec:	05c0      	lsls	r0, r0, #23
 80006ee:	604b      	str	r3, [r1, #4]
 80006f0:	804c      	strh	r4, [r1, #2]
 80006f2:	810c      	strh	r4, [r1, #8]
 80006f4:	728c      	strb	r4, [r1, #10]
 80006f6:	f000 fc33 	bl	8000f60 <TIM_TimeBaseInit>
 80006fa:	2080      	movs	r0, #128	; 0x80
 80006fc:	05c0      	lsls	r0, r0, #23
 80006fe:	2101      	movs	r1, #1
 8000700:	f000 fcb0 	bl	8001064 <TIM_Cmd>
 8000704:	2080      	movs	r0, #128	; 0x80
 8000706:	2102      	movs	r1, #2
 8000708:	05c0      	lsls	r0, r0, #23
 800070a:	2201      	movs	r2, #1
 800070c:	f000 fcee 	bl	80010ec <TIM_ITConfig>
 8000710:	466a      	mov	r2, sp
 8000712:	230f      	movs	r3, #15
 8000714:	7013      	strb	r3, [r2, #0]
 8000716:	4668      	mov	r0, sp
 8000718:	2301      	movs	r3, #1
 800071a:	7053      	strb	r3, [r2, #1]
 800071c:	7093      	strb	r3, [r2, #2]
 800071e:	f001 f8c7 	bl	80018b0 <NVIC_Init>
 8000722:	b005      	add	sp, #20
 8000724:	bd30      	pop	{r4, r5, pc}
 8000726:	46c0      	nop			; (mov r8, r8)
 8000728:	200003b0 	.word	0x200003b0
 800072c:	200003a4 	.word	0x200003a4
 8000730:	2000039c 	.word	0x2000039c
 8000734:	200003ac 	.word	0x200003ac

08000738 <TIM2_IRQHandler>:
 8000738:	2200      	movs	r2, #0
 800073a:	490e      	ldr	r1, [pc, #56]	; (8000774 <TIM2_IRQHandler+0x3c>)
 800073c:	0053      	lsls	r3, r2, #1
 800073e:	5a58      	ldrh	r0, [r3, r1]
 8000740:	2800      	cmp	r0, #0
 8000742:	d003      	beq.n	800074c <TIM2_IRQHandler+0x14>
 8000744:	5a58      	ldrh	r0, [r3, r1]
 8000746:	3801      	subs	r0, #1
 8000748:	b280      	uxth	r0, r0
 800074a:	e005      	b.n	8000758 <TIM2_IRQHandler+0x20>
 800074c:	480a      	ldr	r0, [pc, #40]	; (8000778 <TIM2_IRQHandler+0x40>)
 800074e:	5a18      	ldrh	r0, [r3, r0]
 8000750:	b280      	uxth	r0, r0
 8000752:	5258      	strh	r0, [r3, r1]
 8000754:	4909      	ldr	r1, [pc, #36]	; (800077c <TIM2_IRQHandler+0x44>)
 8000756:	2001      	movs	r0, #1
 8000758:	3201      	adds	r2, #1
 800075a:	5258      	strh	r0, [r3, r1]
 800075c:	2a04      	cmp	r2, #4
 800075e:	d1ec      	bne.n	800073a <TIM2_IRQHandler+0x2>
 8000760:	4b07      	ldr	r3, [pc, #28]	; (8000780 <TIM2_IRQHandler+0x48>)
 8000762:	681a      	ldr	r2, [r3, #0]
 8000764:	3201      	adds	r2, #1
 8000766:	601a      	str	r2, [r3, #0]
 8000768:	2380      	movs	r3, #128	; 0x80
 800076a:	2200      	movs	r2, #0
 800076c:	05db      	lsls	r3, r3, #23
 800076e:	821a      	strh	r2, [r3, #16]
 8000770:	4770      	bx	lr
 8000772:	46c0      	nop			; (mov r8, r8)
 8000774:	200003b0 	.word	0x200003b0
 8000778:	200003a4 	.word	0x200003a4
 800077c:	2000039c 	.word	0x2000039c
 8000780:	200003ac 	.word	0x200003ac

08000784 <event_timer_set_period>:
 8000784:	b672      	cpsid	i
 8000786:	4b05      	ldr	r3, [pc, #20]	; (800079c <event_timer_set_period+0x18>)
 8000788:	0040      	lsls	r0, r0, #1
 800078a:	52c1      	strh	r1, [r0, r3]
 800078c:	4b04      	ldr	r3, [pc, #16]	; (80007a0 <event_timer_set_period+0x1c>)
 800078e:	2200      	movs	r2, #0
 8000790:	52c1      	strh	r1, [r0, r3]
 8000792:	4b04      	ldr	r3, [pc, #16]	; (80007a4 <event_timer_set_period+0x20>)
 8000794:	52c2      	strh	r2, [r0, r3]
 8000796:	b662      	cpsie	i
 8000798:	4770      	bx	lr
 800079a:	46c0      	nop			; (mov r8, r8)
 800079c:	200003b0 	.word	0x200003b0
 80007a0:	200003a4 	.word	0x200003a4
 80007a4:	2000039c 	.word	0x2000039c

080007a8 <event_timer_wait>:
 80007a8:	b510      	push	{r4, lr}
 80007aa:	1c04      	adds	r4, r0, #0
 80007ac:	4a06      	ldr	r2, [pc, #24]	; (80007c8 <event_timer_wait+0x20>)
 80007ae:	0063      	lsls	r3, r4, #1
 80007b0:	5a99      	ldrh	r1, [r3, r2]
 80007b2:	2900      	cmp	r1, #0
 80007b4:	d102      	bne.n	80007bc <event_timer_wait+0x14>
 80007b6:	f000 f973 	bl	8000aa0 <sleep>
 80007ba:	e7f7      	b.n	80007ac <event_timer_wait+0x4>
 80007bc:	b672      	cpsid	i
 80007be:	2100      	movs	r1, #0
 80007c0:	52d1      	strh	r1, [r2, r3]
 80007c2:	b662      	cpsie	i
 80007c4:	bd10      	pop	{r4, pc}
 80007c6:	46c0      	nop			; (mov r8, r8)
 80007c8:	2000039c 	.word	0x2000039c

080007cc <uart_write>:
 80007cc:	4b03      	ldr	r3, [pc, #12]	; (80007dc <uart_write+0x10>)
 80007ce:	69da      	ldr	r2, [r3, #28]
 80007d0:	0611      	lsls	r1, r2, #24
 80007d2:	d401      	bmi.n	80007d8 <uart_write+0xc>
 80007d4:	46c0      	nop			; (mov r8, r8)
 80007d6:	e7f9      	b.n	80007cc <uart_write>
 80007d8:	8518      	strh	r0, [r3, #40]	; 0x28
 80007da:	4770      	bx	lr
 80007dc:	40013800 	.word	0x40013800

080007e0 <USART1_IRQHandler>:
 80007e0:	b508      	push	{r3, lr}
 80007e2:	480e      	ldr	r0, [pc, #56]	; (800081c <USART1_IRQHandler+0x3c>)
 80007e4:	490e      	ldr	r1, [pc, #56]	; (8000820 <USART1_IRQHandler+0x40>)
 80007e6:	f000 fe13 	bl	8001410 <USART_GetITStatus>
 80007ea:	2800      	cmp	r0, #0
 80007ec:	d011      	beq.n	8000812 <USART1_IRQHandler+0x32>
 80007ee:	480b      	ldr	r0, [pc, #44]	; (800081c <USART1_IRQHandler+0x3c>)
 80007f0:	f000 fdda 	bl	80013a8 <USART_ReceiveData>
 80007f4:	4b0b      	ldr	r3, [pc, #44]	; (8000824 <USART1_IRQHandler+0x44>)
 80007f6:	490c      	ldr	r1, [pc, #48]	; (8000828 <USART1_IRQHandler+0x48>)
 80007f8:	881a      	ldrh	r2, [r3, #0]
 80007fa:	b2c0      	uxtb	r0, r0
 80007fc:	b292      	uxth	r2, r2
 80007fe:	5488      	strb	r0, [r1, r2]
 8000800:	881a      	ldrh	r2, [r3, #0]
 8000802:	3201      	adds	r2, #1
 8000804:	b292      	uxth	r2, r2
 8000806:	801a      	strh	r2, [r3, #0]
 8000808:	881a      	ldrh	r2, [r3, #0]
 800080a:	2a0f      	cmp	r2, #15
 800080c:	d901      	bls.n	8000812 <USART1_IRQHandler+0x32>
 800080e:	2200      	movs	r2, #0
 8000810:	801a      	strh	r2, [r3, #0]
 8000812:	4802      	ldr	r0, [pc, #8]	; (800081c <USART1_IRQHandler+0x3c>)
 8000814:	4902      	ldr	r1, [pc, #8]	; (8000820 <USART1_IRQHandler+0x40>)
 8000816:	f000 fe93 	bl	8001540 <USART_ClearITPendingBit>
 800081a:	bd08      	pop	{r3, pc}
 800081c:	40013800 	.word	0x40013800
 8000820:	00050105 	.word	0x00050105
 8000824:	200003c8 	.word	0x200003c8
 8000828:	200003b8 	.word	0x200003b8

0800082c <uart_init>:
 800082c:	b530      	push	{r4, r5, lr}
 800082e:	4a21      	ldr	r2, [pc, #132]	; (80008b4 <uart_init+0x88>)
 8000830:	2300      	movs	r3, #0
 8000832:	8013      	strh	r3, [r2, #0]
 8000834:	4a20      	ldr	r2, [pc, #128]	; (80008b8 <uart_init+0x8c>)
 8000836:	b089      	sub	sp, #36	; 0x24
 8000838:	8013      	strh	r3, [r2, #0]
 800083a:	4a20      	ldr	r2, [pc, #128]	; (80008bc <uart_init+0x90>)
 800083c:	2400      	movs	r4, #0
 800083e:	54d4      	strb	r4, [r2, r3]
 8000840:	3301      	adds	r3, #1
 8000842:	2b10      	cmp	r3, #16
 8000844:	d1f9      	bne.n	800083a <uart_init+0xe>
 8000846:	2080      	movs	r0, #128	; 0x80
 8000848:	0280      	lsls	r0, r0, #10
 800084a:	2101      	movs	r1, #1
 800084c:	f001 f956 	bl	8001afc <RCC_AHBPeriphClockCmd>
 8000850:	2080      	movs	r0, #128	; 0x80
 8000852:	01c0      	lsls	r0, r0, #7
 8000854:	2101      	movs	r1, #1
 8000856:	f001 f971 	bl	8001b3c <RCC_APB2PeriphClockCmd>
 800085a:	2090      	movs	r0, #144	; 0x90
 800085c:	05c0      	lsls	r0, r0, #23
 800085e:	2102      	movs	r1, #2
 8000860:	2201      	movs	r2, #1
 8000862:	f000 fb37 	bl	8000ed4 <GPIO_PinAFConfig>
 8000866:	2090      	movs	r0, #144	; 0x90
 8000868:	05c0      	lsls	r0, r0, #23
 800086a:	210f      	movs	r1, #15
 800086c:	2201      	movs	r2, #1
 800086e:	f000 fb31 	bl	8000ed4 <GPIO_PinAFConfig>
 8000872:	4b13      	ldr	r3, [pc, #76]	; (80008c0 <uart_init+0x94>)
 8000874:	2090      	movs	r0, #144	; 0x90
 8000876:	466a      	mov	r2, sp
 8000878:	2501      	movs	r5, #1
 800087a:	9300      	str	r3, [sp, #0]
 800087c:	4669      	mov	r1, sp
 800087e:	2302      	movs	r3, #2
 8000880:	05c0      	lsls	r0, r0, #23
 8000882:	7113      	strb	r3, [r2, #4]
 8000884:	7155      	strb	r5, [r2, #5]
 8000886:	7194      	strb	r4, [r2, #6]
 8000888:	71d5      	strb	r5, [r2, #7]
 800088a:	f000 fa9f 	bl	8000dcc <GPIO_Init>
 800088e:	23e1      	movs	r3, #225	; 0xe1
 8000890:	025b      	lsls	r3, r3, #9
 8000892:	9302      	str	r3, [sp, #8]
 8000894:	a902      	add	r1, sp, #8
 8000896:	230c      	movs	r3, #12
 8000898:	480a      	ldr	r0, [pc, #40]	; (80008c4 <uart_init+0x98>)
 800089a:	9306      	str	r3, [sp, #24]
 800089c:	9403      	str	r4, [sp, #12]
 800089e:	9404      	str	r4, [sp, #16]
 80008a0:	9405      	str	r4, [sp, #20]
 80008a2:	9407      	str	r4, [sp, #28]
 80008a4:	f000 fc72 	bl	800118c <USART_Init>
 80008a8:	4806      	ldr	r0, [pc, #24]	; (80008c4 <uart_init+0x98>)
 80008aa:	1c29      	adds	r1, r5, #0
 80008ac:	f000 fd3c 	bl	8001328 <USART_Cmd>
 80008b0:	b009      	add	sp, #36	; 0x24
 80008b2:	bd30      	pop	{r4, r5, pc}
 80008b4:	200003c8 	.word	0x200003c8
 80008b8:	200003ca 	.word	0x200003ca
 80008bc:	200003b8 	.word	0x200003b8
 80008c0:	00008004 	.word	0x00008004
 80008c4:	40013800 	.word	0x40013800

080008c8 <i2c_delay>:
 80008c8:	46c0      	nop			; (mov r8, r8)
 80008ca:	4770      	bx	lr

080008cc <SetLowSDA>:
 80008cc:	b508      	push	{r3, lr}
 80008ce:	b672      	cpsid	i
 80008d0:	2390      	movs	r3, #144	; 0x90
 80008d2:	2280      	movs	r2, #128	; 0x80
 80008d4:	05db      	lsls	r3, r3, #23
 80008d6:	0112      	lsls	r2, r2, #4
 80008d8:	851a      	strh	r2, [r3, #40]	; 0x28
 80008da:	685a      	ldr	r2, [r3, #4]
 80008dc:	b292      	uxth	r2, r2
 80008de:	809a      	strh	r2, [r3, #4]
 80008e0:	6819      	ldr	r1, [r3, #0]
 80008e2:	2280      	movs	r2, #128	; 0x80
 80008e4:	03d2      	lsls	r2, r2, #15
 80008e6:	430a      	orrs	r2, r1
 80008e8:	601a      	str	r2, [r3, #0]
 80008ea:	b662      	cpsie	i
 80008ec:	f7ff ffec 	bl	80008c8 <i2c_delay>
 80008f0:	bd08      	pop	{r3, pc}
	...

080008f4 <SetHighSDA>:
 80008f4:	b508      	push	{r3, lr}
 80008f6:	b672      	cpsid	i
 80008f8:	2390      	movs	r3, #144	; 0x90
 80008fa:	2280      	movs	r2, #128	; 0x80
 80008fc:	05db      	lsls	r3, r3, #23
 80008fe:	0112      	lsls	r2, r2, #4
 8000900:	619a      	str	r2, [r3, #24]
 8000902:	6859      	ldr	r1, [r3, #4]
 8000904:	4a05      	ldr	r2, [pc, #20]	; (800091c <SetHighSDA+0x28>)
 8000906:	400a      	ands	r2, r1
 8000908:	809a      	strh	r2, [r3, #4]
 800090a:	6819      	ldr	r1, [r3, #0]
 800090c:	4a04      	ldr	r2, [pc, #16]	; (8000920 <SetHighSDA+0x2c>)
 800090e:	400a      	ands	r2, r1
 8000910:	601a      	str	r2, [r3, #0]
 8000912:	b662      	cpsie	i
 8000914:	f7ff ffd8 	bl	80008c8 <i2c_delay>
 8000918:	bd08      	pop	{r3, pc}
 800091a:	46c0      	nop			; (mov r8, r8)
 800091c:	0000f7ff 	.word	0x0000f7ff
 8000920:	ff3fffff 	.word	0xff3fffff

08000924 <SetHighSCL>:
 8000924:	b508      	push	{r3, lr}
 8000926:	2280      	movs	r2, #128	; 0x80
 8000928:	2390      	movs	r3, #144	; 0x90
 800092a:	0052      	lsls	r2, r2, #1
 800092c:	05db      	lsls	r3, r3, #23
 800092e:	619a      	str	r2, [r3, #24]
 8000930:	f7ff ffca 	bl	80008c8 <i2c_delay>
 8000934:	bd08      	pop	{r3, pc}

08000936 <i2c_0_init>:
 8000936:	b507      	push	{r0, r1, r2, lr}
 8000938:	2390      	movs	r3, #144	; 0x90
 800093a:	011b      	lsls	r3, r3, #4
 800093c:	4669      	mov	r1, sp
 800093e:	9300      	str	r3, [sp, #0]
 8000940:	2090      	movs	r0, #144	; 0x90
 8000942:	2301      	movs	r3, #1
 8000944:	710b      	strb	r3, [r1, #4]
 8000946:	2203      	movs	r2, #3
 8000948:	2300      	movs	r3, #0
 800094a:	05c0      	lsls	r0, r0, #23
 800094c:	718b      	strb	r3, [r1, #6]
 800094e:	714a      	strb	r2, [r1, #5]
 8000950:	71cb      	strb	r3, [r1, #7]
 8000952:	f000 fa3b 	bl	8000dcc <GPIO_Init>
 8000956:	f7ff ffe5 	bl	8000924 <SetHighSCL>
 800095a:	f7ff ffb7 	bl	80008cc <SetLowSDA>
 800095e:	f7ff ffc9 	bl	80008f4 <SetHighSDA>
 8000962:	bd07      	pop	{r0, r1, r2, pc}

08000964 <adc_random_seed>:
 8000964:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
 8000966:	2400      	movs	r4, #0
 8000968:	1c25      	adds	r5, r4, #0
 800096a:	2720      	movs	r7, #32
 800096c:	2600      	movs	r6, #0
 800096e:	2001      	movs	r0, #1
 8000970:	f000 fee0 	bl	8001734 <ADC_TempSensorCmd>
 8000974:	2201      	movs	r2, #1
 8000976:	402a      	ands	r2, r5
 8000978:	4815      	ldr	r0, [pc, #84]	; (80009d0 <adc_random_seed+0x6c>)
 800097a:	2180      	movs	r1, #128	; 0x80
 800097c:	2a00      	cmp	r2, #0
 800097e:	d002      	beq.n	8000986 <adc_random_seed+0x22>
 8000980:	0249      	lsls	r1, r1, #9
 8000982:	2200      	movs	r2, #0
 8000984:	e000      	b.n	8000988 <adc_random_seed+0x24>
 8000986:	0289      	lsls	r1, r1, #10
 8000988:	f000 feec 	bl	8001764 <ADC_ChannelConfig>
 800098c:	4810      	ldr	r0, [pc, #64]	; (80009d0 <adc_random_seed+0x6c>)
 800098e:	f000 ff29 	bl	80017e4 <ADC_StartOfConversion>
 8000992:	480f      	ldr	r0, [pc, #60]	; (80009d0 <adc_random_seed+0x6c>)
 8000994:	2104      	movs	r1, #4
 8000996:	f000 ff43 	bl	8001820 <ADC_GetFlagStatus>
 800099a:	2800      	cmp	r0, #0
 800099c:	d101      	bne.n	80009a2 <adc_random_seed+0x3e>
 800099e:	46c0      	nop			; (mov r8, r8)
 80009a0:	e7f7      	b.n	8000992 <adc_random_seed+0x2e>
 80009a2:	480b      	ldr	r0, [pc, #44]	; (80009d0 <adc_random_seed+0x6c>)
 80009a4:	f000 ff2e 	bl	8001804 <ADC_GetConversionValue>
 80009a8:	2301      	movs	r3, #1
 80009aa:	4018      	ands	r0, r3
 80009ac:	0076      	lsls	r6, r6, #1
 80009ae:	2104      	movs	r1, #4
 80009b0:	4306      	orrs	r6, r0
 80009b2:	4807      	ldr	r0, [pc, #28]	; (80009d0 <adc_random_seed+0x6c>)
 80009b4:	f000 ff64 	bl	8001880 <ADC_ClearFlag>
 80009b8:	3f01      	subs	r7, #1
 80009ba:	2000      	movs	r0, #0
 80009bc:	f000 feba 	bl	8001734 <ADC_TempSensorCmd>
 80009c0:	2f00      	cmp	r7, #0
 80009c2:	d1d4      	bne.n	800096e <adc_random_seed+0xa>
 80009c4:	3501      	adds	r5, #1
 80009c6:	4074      	eors	r4, r6
 80009c8:	2d08      	cmp	r5, #8
 80009ca:	d1ce      	bne.n	800096a <adc_random_seed+0x6>
 80009cc:	1c20      	adds	r0, r4, #0
 80009ce:	bdf8      	pop	{r3, r4, r5, r6, r7, pc}
 80009d0:	40012400 	.word	0x40012400

080009d4 <adc_init>:
 80009d4:	b510      	push	{r4, lr}
 80009d6:	b088      	sub	sp, #32
 80009d8:	9000      	str	r0, [sp, #0]
 80009da:	2090      	movs	r0, #144	; 0x90
 80009dc:	466a      	mov	r2, sp
 80009de:	2303      	movs	r3, #3
 80009e0:	2400      	movs	r4, #0
 80009e2:	05c0      	lsls	r0, r0, #23
 80009e4:	4669      	mov	r1, sp
 80009e6:	7113      	strb	r3, [r2, #4]
 80009e8:	71d4      	strb	r4, [r2, #7]
 80009ea:	f000 f9ef 	bl	8000dcc <GPIO_Init>
 80009ee:	2080      	movs	r0, #128	; 0x80
 80009f0:	2101      	movs	r1, #1
 80009f2:	0080      	lsls	r0, r0, #2
 80009f4:	f001 f8a2 	bl	8001b3c <RCC_APB2PeriphClockCmd>
 80009f8:	2080      	movs	r0, #128	; 0x80
 80009fa:	0440      	lsls	r0, r0, #17
 80009fc:	f000 ff92 	bl	8001924 <RCC_ADCCLKConfig>
 8000a00:	4810      	ldr	r0, [pc, #64]	; (8000a44 <adc_init+0x70>)
 8000a02:	f000 fe11 	bl	8001628 <ADC_DeInit>
 8000a06:	a902      	add	r1, sp, #8
 8000a08:	480e      	ldr	r0, [pc, #56]	; (8000a44 <adc_init+0x70>)
 8000a0a:	710c      	strb	r4, [r1, #4]
 8000a0c:	610c      	str	r4, [r1, #16]
 8000a0e:	614c      	str	r4, [r1, #20]
 8000a10:	608c      	str	r4, [r1, #8]
 8000a12:	60cc      	str	r4, [r1, #12]
 8000a14:	9402      	str	r4, [sp, #8]
 8000a16:	f000 fe1f 	bl	8001658 <ADC_Init>
 8000a1a:	480a      	ldr	r0, [pc, #40]	; (8000a44 <adc_init+0x70>)
 8000a1c:	f000 fec2 	bl	80017a4 <ADC_GetCalibrationFactor>
 8000a20:	4808      	ldr	r0, [pc, #32]	; (8000a44 <adc_init+0x70>)
 8000a22:	2101      	movs	r1, #1
 8000a24:	f000 fe6a 	bl	80016fc <ADC_Cmd>
 8000a28:	4806      	ldr	r0, [pc, #24]	; (8000a44 <adc_init+0x70>)
 8000a2a:	2101      	movs	r1, #1
 8000a2c:	f000 fef8 	bl	8001820 <ADC_GetFlagStatus>
 8000a30:	2800      	cmp	r0, #0
 8000a32:	d101      	bne.n	8000a38 <adc_init+0x64>
 8000a34:	46c0      	nop			; (mov r8, r8)
 8000a36:	e7f7      	b.n	8000a28 <adc_init+0x54>
 8000a38:	f7ff ff94 	bl	8000964 <adc_random_seed>
 8000a3c:	4b02      	ldr	r3, [pc, #8]	; (8000a48 <adc_init+0x74>)
 8000a3e:	6018      	str	r0, [r3, #0]
 8000a40:	b008      	add	sp, #32
 8000a42:	bd10      	pop	{r4, pc}
 8000a44:	40012400 	.word	0x40012400
 8000a48:	20000010 	.word	0x20000010

08000a4c <adc_config_ch>:
 8000a4c:	b508      	push	{r3, lr}
 8000a4e:	1c01      	adds	r1, r0, #0
 8000a50:	2207      	movs	r2, #7
 8000a52:	4802      	ldr	r0, [pc, #8]	; (8000a5c <adc_config_ch+0x10>)
 8000a54:	f000 fe86 	bl	8001764 <ADC_ChannelConfig>
 8000a58:	bd08      	pop	{r3, pc}
 8000a5a:	46c0      	nop			; (mov r8, r8)
 8000a5c:	40012400 	.word	0x40012400

08000a60 <adc_read>:
 8000a60:	4b07      	ldr	r3, [pc, #28]	; (8000a80 <adc_read+0x20>)
 8000a62:	2104      	movs	r1, #4
 8000a64:	689a      	ldr	r2, [r3, #8]
 8000a66:	430a      	orrs	r2, r1
 8000a68:	609a      	str	r2, [r3, #8]
 8000a6a:	6818      	ldr	r0, [r3, #0]
 8000a6c:	2104      	movs	r1, #4
 8000a6e:	4a04      	ldr	r2, [pc, #16]	; (8000a80 <adc_read+0x20>)
 8000a70:	4208      	tst	r0, r1
 8000a72:	d101      	bne.n	8000a78 <adc_read+0x18>
 8000a74:	46c0      	nop			; (mov r8, r8)
 8000a76:	e7f8      	b.n	8000a6a <adc_read+0xa>
 8000a78:	6c10      	ldr	r0, [r2, #64]	; 0x40
 8000a7a:	6011      	str	r1, [r2, #0]
 8000a7c:	4770      	bx	lr
 8000a7e:	46c0      	nop			; (mov r8, r8)
 8000a80:	40012400 	.word	0x40012400

08000a84 <assert_param>:
 8000a84:	4770      	bx	lr
	...

08000a88 <sys_tick_init>:
 8000a88:	4b03      	ldr	r3, [pc, #12]	; (8000a98 <sys_tick_init+0x10>)
 8000a8a:	4a04      	ldr	r2, [pc, #16]	; (8000a9c <sys_tick_init+0x14>)
 8000a8c:	605a      	str	r2, [r3, #4]
 8000a8e:	2200      	movs	r2, #0
 8000a90:	609a      	str	r2, [r3, #8]
 8000a92:	2207      	movs	r2, #7
 8000a94:	601a      	str	r2, [r3, #0]
 8000a96:	4770      	bx	lr
 8000a98:	e000e010 	.word	0xe000e010
 8000a9c:	0000bb80 	.word	0x0000bb80

08000aa0 <sleep>:
 8000aa0:	bf30      	wfi
 8000aa2:	4770      	bx	lr

08000aa4 <SystemInit>:
 8000aa4:	4b26      	ldr	r3, [pc, #152]	; (8000b40 <SystemInit+0x9c>)
 8000aa6:	2201      	movs	r2, #1
 8000aa8:	6819      	ldr	r1, [r3, #0]
 8000aaa:	b082      	sub	sp, #8
 8000aac:	4311      	orrs	r1, r2
 8000aae:	6019      	str	r1, [r3, #0]
 8000ab0:	6858      	ldr	r0, [r3, #4]
 8000ab2:	4924      	ldr	r1, [pc, #144]	; (8000b44 <SystemInit+0xa0>)
 8000ab4:	4001      	ands	r1, r0
 8000ab6:	6059      	str	r1, [r3, #4]
 8000ab8:	6818      	ldr	r0, [r3, #0]
 8000aba:	4923      	ldr	r1, [pc, #140]	; (8000b48 <SystemInit+0xa4>)
 8000abc:	4001      	ands	r1, r0
 8000abe:	6019      	str	r1, [r3, #0]
 8000ac0:	6818      	ldr	r0, [r3, #0]
 8000ac2:	4922      	ldr	r1, [pc, #136]	; (8000b4c <SystemInit+0xa8>)
 8000ac4:	4001      	ands	r1, r0
 8000ac6:	6019      	str	r1, [r3, #0]
 8000ac8:	6858      	ldr	r0, [r3, #4]
 8000aca:	4921      	ldr	r1, [pc, #132]	; (8000b50 <SystemInit+0xac>)
 8000acc:	4001      	ands	r1, r0
 8000ace:	6059      	str	r1, [r3, #4]
 8000ad0:	6ad9      	ldr	r1, [r3, #44]	; 0x2c
 8000ad2:	200f      	movs	r0, #15
 8000ad4:	4381      	bics	r1, r0
 8000ad6:	62d9      	str	r1, [r3, #44]	; 0x2c
 8000ad8:	6b18      	ldr	r0, [r3, #48]	; 0x30
 8000ada:	491e      	ldr	r1, [pc, #120]	; (8000b54 <SystemInit+0xb0>)
 8000adc:	4001      	ands	r1, r0
 8000ade:	6319      	str	r1, [r3, #48]	; 0x30
 8000ae0:	6b59      	ldr	r1, [r3, #52]	; 0x34
 8000ae2:	4391      	bics	r1, r2
 8000ae4:	2200      	movs	r2, #0
 8000ae6:	6359      	str	r1, [r3, #52]	; 0x34
 8000ae8:	609a      	str	r2, [r3, #8]
 8000aea:	9200      	str	r2, [sp, #0]
 8000aec:	9201      	str	r2, [sp, #4]
 8000aee:	4a1a      	ldr	r2, [pc, #104]	; (8000b58 <SystemInit+0xb4>)
 8000af0:	2111      	movs	r1, #17
 8000af2:	6011      	str	r1, [r2, #0]
 8000af4:	685a      	ldr	r2, [r3, #4]
 8000af6:	605a      	str	r2, [r3, #4]
 8000af8:	685a      	ldr	r2, [r3, #4]
 8000afa:	605a      	str	r2, [r3, #4]
 8000afc:	6859      	ldr	r1, [r3, #4]
 8000afe:	4a17      	ldr	r2, [pc, #92]	; (8000b5c <SystemInit+0xb8>)
 8000b00:	400a      	ands	r2, r1
 8000b02:	605a      	str	r2, [r3, #4]
 8000b04:	6859      	ldr	r1, [r3, #4]
 8000b06:	22a0      	movs	r2, #160	; 0xa0
 8000b08:	0392      	lsls	r2, r2, #14
 8000b0a:	430a      	orrs	r2, r1
 8000b0c:	605a      	str	r2, [r3, #4]
 8000b0e:	6819      	ldr	r1, [r3, #0]
 8000b10:	2280      	movs	r2, #128	; 0x80
 8000b12:	0452      	lsls	r2, r2, #17
 8000b14:	430a      	orrs	r2, r1
 8000b16:	601a      	str	r2, [r3, #0]
 8000b18:	6819      	ldr	r1, [r3, #0]
 8000b1a:	4a09      	ldr	r2, [pc, #36]	; (8000b40 <SystemInit+0x9c>)
 8000b1c:	0188      	lsls	r0, r1, #6
 8000b1e:	d5fb      	bpl.n	8000b18 <SystemInit+0x74>
 8000b20:	6851      	ldr	r1, [r2, #4]
 8000b22:	2003      	movs	r0, #3
 8000b24:	4381      	bics	r1, r0
 8000b26:	6051      	str	r1, [r2, #4]
 8000b28:	6851      	ldr	r1, [r2, #4]
 8000b2a:	2002      	movs	r0, #2
 8000b2c:	4301      	orrs	r1, r0
 8000b2e:	6051      	str	r1, [r2, #4]
 8000b30:	6859      	ldr	r1, [r3, #4]
 8000b32:	220c      	movs	r2, #12
 8000b34:	400a      	ands	r2, r1
 8000b36:	2a08      	cmp	r2, #8
 8000b38:	d1fa      	bne.n	8000b30 <SystemInit+0x8c>
 8000b3a:	b002      	add	sp, #8
 8000b3c:	4770      	bx	lr
 8000b3e:	46c0      	nop			; (mov r8, r8)
 8000b40:	40021000 	.word	0x40021000
 8000b44:	f8ffb80c 	.word	0xf8ffb80c
 8000b48:	fef6ffff 	.word	0xfef6ffff
 8000b4c:	fffbffff 	.word	0xfffbffff
 8000b50:	ffc0ffff 	.word	0xffc0ffff
 8000b54:	fffffeac 	.word	0xfffffeac
 8000b58:	40022000 	.word	0x40022000
 8000b5c:	ffc07fff 	.word	0xffc07fff

08000b60 <TIM16_IRQHandler>:
 8000b60:	4b20      	ldr	r3, [pc, #128]	; (8000be4 <TIM16_IRQHandler+0x84>)
 8000b62:	799a      	ldrb	r2, [r3, #6]
 8000b64:	78d9      	ldrb	r1, [r3, #3]
 8000b66:	4291      	cmp	r1, r2
 8000b68:	d805      	bhi.n	8000b76 <TIM16_IRQHandler+0x16>
 8000b6a:	2080      	movs	r0, #128	; 0x80
 8000b6c:	2190      	movs	r1, #144	; 0x90
 8000b6e:	0040      	lsls	r0, r0, #1
 8000b70:	05c9      	lsls	r1, r1, #23
 8000b72:	8508      	strh	r0, [r1, #40]	; 0x28
 8000b74:	e006      	b.n	8000b84 <TIM16_IRQHandler+0x24>
 8000b76:	2a00      	cmp	r2, #0
 8000b78:	d104      	bne.n	8000b84 <TIM16_IRQHandler+0x24>
 8000b7a:	2080      	movs	r0, #128	; 0x80
 8000b7c:	2190      	movs	r1, #144	; 0x90
 8000b7e:	0040      	lsls	r0, r0, #1
 8000b80:	05c9      	lsls	r1, r1, #23
 8000b82:	6188      	str	r0, [r1, #24]
 8000b84:	7919      	ldrb	r1, [r3, #4]
 8000b86:	4291      	cmp	r1, r2
 8000b88:	d805      	bhi.n	8000b96 <TIM16_IRQHandler+0x36>
 8000b8a:	2080      	movs	r0, #128	; 0x80
 8000b8c:	2190      	movs	r1, #144	; 0x90
 8000b8e:	0100      	lsls	r0, r0, #4
 8000b90:	05c9      	lsls	r1, r1, #23
 8000b92:	8508      	strh	r0, [r1, #40]	; 0x28
 8000b94:	e006      	b.n	8000ba4 <TIM16_IRQHandler+0x44>
 8000b96:	2a00      	cmp	r2, #0
 8000b98:	d104      	bne.n	8000ba4 <TIM16_IRQHandler+0x44>
 8000b9a:	2080      	movs	r0, #128	; 0x80
 8000b9c:	2190      	movs	r1, #144	; 0x90
 8000b9e:	0100      	lsls	r0, r0, #4
 8000ba0:	05c9      	lsls	r1, r1, #23
 8000ba2:	6188      	str	r0, [r1, #24]
 8000ba4:	7959      	ldrb	r1, [r3, #5]
 8000ba6:	4291      	cmp	r1, r2
 8000ba8:	d806      	bhi.n	8000bb8 <TIM16_IRQHandler+0x58>
 8000baa:	2190      	movs	r1, #144	; 0x90
 8000bac:	2002      	movs	r0, #2
 8000bae:	05c9      	lsls	r1, r1, #23
 8000bb0:	8508      	strh	r0, [r1, #40]	; 0x28
 8000bb2:	2a00      	cmp	r2, #0
 8000bb4:	d006      	beq.n	8000bc4 <TIM16_IRQHandler+0x64>
 8000bb6:	e00b      	b.n	8000bd0 <TIM16_IRQHandler+0x70>
 8000bb8:	2a00      	cmp	r2, #0
 8000bba:	d109      	bne.n	8000bd0 <TIM16_IRQHandler+0x70>
 8000bbc:	2190      	movs	r1, #144	; 0x90
 8000bbe:	2002      	movs	r0, #2
 8000bc0:	05c9      	lsls	r1, r1, #23
 8000bc2:	6188      	str	r0, [r1, #24]
 8000bc4:	7819      	ldrb	r1, [r3, #0]
 8000bc6:	70d9      	strb	r1, [r3, #3]
 8000bc8:	7859      	ldrb	r1, [r3, #1]
 8000bca:	7119      	strb	r1, [r3, #4]
 8000bcc:	7899      	ldrb	r1, [r3, #2]
 8000bce:	7159      	strb	r1, [r3, #5]
 8000bd0:	3201      	adds	r2, #1
 8000bd2:	b2d2      	uxtb	r2, r2
 8000bd4:	2a10      	cmp	r2, #16
 8000bd6:	d900      	bls.n	8000bda <TIM16_IRQHandler+0x7a>
 8000bd8:	2200      	movs	r2, #0
 8000bda:	719a      	strb	r2, [r3, #6]
 8000bdc:	4b02      	ldr	r3, [pc, #8]	; (8000be8 <TIM16_IRQHandler+0x88>)
 8000bde:	2200      	movs	r2, #0
 8000be0:	821a      	strh	r2, [r3, #16]
 8000be2:	4770      	bx	lr
 8000be4:	20000074 	.word	0x20000074
 8000be8:	40014400 	.word	0x40014400

08000bec <lib_low_level_init>:
 8000bec:	b508      	push	{r3, lr}
 8000bee:	f7ff ff59 	bl	8000aa4 <SystemInit>
 8000bf2:	f001 f803 	bl	8001bfc <gpio_init>
 8000bf6:	f7ff fe19 	bl	800082c <uart_init>
 8000bfa:	f7ff fd5b 	bl	80006b4 <timer_init>
 8000bfe:	f7ff fe9a 	bl	8000936 <i2c_0_init>
 8000c02:	bd08      	pop	{r3, pc}

08000c04 <TIM14_IRQHandler>:
 8000c04:	b570      	push	{r4, r5, r6, lr}
 8000c06:	4b60      	ldr	r3, [pc, #384]	; (8000d88 <TIM14_IRQHandler+0x184>)
 8000c08:	7818      	ldrb	r0, [r3, #0]
 8000c0a:	b2c0      	uxtb	r0, r0
 8000c0c:	2803      	cmp	r0, #3
 8000c0e:	d83f      	bhi.n	8000c90 <TIM14_IRQHandler+0x8c>
 8000c10:	f001 f896 	bl	8001d40 <__gnu_thumb1_case_uqi>
 8000c14:	32220a02 	.word	0x32220a02
 8000c18:	2280      	movs	r2, #128	; 0x80
 8000c1a:	2390      	movs	r3, #144	; 0x90
 8000c1c:	0052      	lsls	r2, r2, #1
 8000c1e:	05db      	lsls	r3, r3, #23
 8000c20:	851a      	strh	r2, [r3, #40]	; 0x28
 8000c22:	2200      	movs	r2, #0
 8000c24:	4b59      	ldr	r3, [pc, #356]	; (8000d8c <TIM14_IRQHandler+0x188>)
 8000c26:	e032      	b.n	8000c8e <TIM14_IRQHandler+0x8a>
 8000c28:	4a58      	ldr	r2, [pc, #352]	; (8000d8c <TIM14_IRQHandler+0x188>)
 8000c2a:	7811      	ldrb	r1, [r2, #0]
 8000c2c:	290d      	cmp	r1, #13
 8000c2e:	d901      	bls.n	8000c34 <TIM14_IRQHandler+0x30>
 8000c30:	2200      	movs	r2, #0
 8000c32:	e02c      	b.n	8000c8e <TIM14_IRQHandler+0x8a>
 8000c34:	7811      	ldrb	r1, [r2, #0]
 8000c36:	4856      	ldr	r0, [pc, #344]	; (8000d90 <TIM14_IRQHandler+0x18c>)
 8000c38:	5c41      	ldrb	r1, [r0, r1]
 8000c3a:	20ff      	movs	r0, #255	; 0xff
 8000c3c:	4388      	bics	r0, r1
 8000c3e:	0040      	lsls	r0, r0, #1
 8000c40:	2101      	movs	r1, #1
 8000c42:	4308      	orrs	r0, r1
 8000c44:	4953      	ldr	r1, [pc, #332]	; (8000d94 <TIM14_IRQHandler+0x190>)
 8000c46:	8008      	strh	r0, [r1, #0]
 8000c48:	7811      	ldrb	r1, [r2, #0]
 8000c4a:	3101      	adds	r1, #1
 8000c4c:	b2c9      	uxtb	r1, r1
 8000c4e:	7011      	strb	r1, [r2, #0]
 8000c50:	4a51      	ldr	r2, [pc, #324]	; (8000d98 <TIM14_IRQHandler+0x194>)
 8000c52:	2100      	movs	r1, #0
 8000c54:	7011      	strb	r1, [r2, #0]
 8000c56:	e019      	b.n	8000c8c <TIM14_IRQHandler+0x88>
 8000c58:	4a4e      	ldr	r2, [pc, #312]	; (8000d94 <TIM14_IRQHandler+0x190>)
 8000c5a:	2190      	movs	r1, #144	; 0x90
 8000c5c:	8814      	ldrh	r4, [r2, #0]
 8000c5e:	2080      	movs	r0, #128	; 0x80
 8000c60:	05c9      	lsls	r1, r1, #23
 8000c62:	0040      	lsls	r0, r0, #1
 8000c64:	07e5      	lsls	r5, r4, #31
 8000c66:	d501      	bpl.n	8000c6c <TIM14_IRQHandler+0x68>
 8000c68:	6188      	str	r0, [r1, #24]
 8000c6a:	e000      	b.n	8000c6e <TIM14_IRQHandler+0x6a>
 8000c6c:	8508      	strh	r0, [r1, #40]	; 0x28
 8000c6e:	8811      	ldrh	r1, [r2, #0]
 8000c70:	0849      	lsrs	r1, r1, #1
 8000c72:	8011      	strh	r1, [r2, #0]
 8000c74:	2203      	movs	r2, #3
 8000c76:	e00a      	b.n	8000c8e <TIM14_IRQHandler+0x8a>
 8000c78:	4a47      	ldr	r2, [pc, #284]	; (8000d98 <TIM14_IRQHandler+0x194>)
 8000c7a:	7811      	ldrb	r1, [r2, #0]
 8000c7c:	3101      	adds	r1, #1
 8000c7e:	b2c9      	uxtb	r1, r1
 8000c80:	7011      	strb	r1, [r2, #0]
 8000c82:	7812      	ldrb	r2, [r2, #0]
 8000c84:	2a09      	cmp	r2, #9
 8000c86:	d901      	bls.n	8000c8c <TIM14_IRQHandler+0x88>
 8000c88:	2201      	movs	r2, #1
 8000c8a:	e000      	b.n	8000c8e <TIM14_IRQHandler+0x8a>
 8000c8c:	2202      	movs	r2, #2
 8000c8e:	701a      	strb	r2, [r3, #0]
 8000c90:	4b42      	ldr	r3, [pc, #264]	; (8000d9c <TIM14_IRQHandler+0x198>)
 8000c92:	2104      	movs	r1, #4
 8000c94:	6c1a      	ldr	r2, [r3, #64]	; 0x40
 8000c96:	6019      	str	r1, [r3, #0]
 8000c98:	6898      	ldr	r0, [r3, #8]
 8000c9a:	4301      	orrs	r1, r0
 8000c9c:	6099      	str	r1, [r3, #8]
 8000c9e:	4b40      	ldr	r3, [pc, #256]	; (8000da0 <TIM14_IRQHandler+0x19c>)
 8000ca0:	2101      	movs	r1, #1
 8000ca2:	429a      	cmp	r2, r3
 8000ca4:	d80b      	bhi.n	8000cbe <TIM14_IRQHandler+0xba>
 8000ca6:	4b3f      	ldr	r3, [pc, #252]	; (8000da4 <TIM14_IRQHandler+0x1a0>)
 8000ca8:	2480      	movs	r4, #128	; 0x80
 8000caa:	6818      	ldr	r0, [r3, #0]
 8000cac:	0164      	lsls	r4, r4, #5
 8000cae:	1901      	adds	r1, r0, r4
 8000cb0:	1a8a      	subs	r2, r1, r2
 8000cb2:	601a      	str	r2, [r3, #0]
 8000cb4:	4b3c      	ldr	r3, [pc, #240]	; (8000da8 <TIM14_IRQHandler+0x1a4>)
 8000cb6:	2100      	movs	r1, #0
 8000cb8:	681a      	ldr	r2, [r3, #0]
 8000cba:	3201      	adds	r2, #1
 8000cbc:	601a      	str	r2, [r3, #0]
 8000cbe:	4b3b      	ldr	r3, [pc, #236]	; (8000dac <TIM14_IRQHandler+0x1a8>)
 8000cc0:	7818      	ldrb	r0, [r3, #0]
 8000cc2:	b2c0      	uxtb	r0, r0
 8000cc4:	2804      	cmp	r0, #4
 8000cc6:	d85a      	bhi.n	8000d7e <TIM14_IRQHandler+0x17a>
 8000cc8:	f001 f83a 	bl	8001d40 <__gnu_thumb1_case_uqi>
 8000ccc:	36110603 	.word	0x36110603
 8000cd0:	38          	.byte	0x38
 8000cd1:	00          	.byte	0x00
 8000cd2:	2200      	movs	r2, #0
 8000cd4:	4b36      	ldr	r3, [pc, #216]	; (8000db0 <TIM14_IRQHandler+0x1ac>)
 8000cd6:	e051      	b.n	8000d7c <TIM14_IRQHandler+0x178>
 8000cd8:	4a35      	ldr	r2, [pc, #212]	; (8000db0 <TIM14_IRQHandler+0x1ac>)
 8000cda:	7811      	ldrb	r1, [r2, #0]
 8000cdc:	2200      	movs	r2, #0
 8000cde:	290d      	cmp	r1, #13
 8000ce0:	d84c      	bhi.n	8000d7c <TIM14_IRQHandler+0x178>
 8000ce2:	4934      	ldr	r1, [pc, #208]	; (8000db4 <TIM14_IRQHandler+0x1b0>)
 8000ce4:	800a      	strh	r2, [r1, #0]
 8000ce6:	4934      	ldr	r1, [pc, #208]	; (8000db8 <TIM14_IRQHandler+0x1b4>)
 8000ce8:	700a      	strb	r2, [r1, #0]
 8000cea:	2202      	movs	r2, #2
 8000cec:	e046      	b.n	8000d7c <TIM14_IRQHandler+0x178>
 8000cee:	4a33      	ldr	r2, [pc, #204]	; (8000dbc <TIM14_IRQHandler+0x1b8>)
 8000cf0:	2900      	cmp	r1, #0
 8000cf2:	d103      	bne.n	8000cfc <TIM14_IRQHandler+0xf8>
 8000cf4:	2003      	movs	r0, #3
 8000cf6:	7018      	strb	r0, [r3, #0]
 8000cf8:	6011      	str	r1, [r2, #0]
 8000cfa:	e040      	b.n	8000d7e <TIM14_IRQHandler+0x17a>
 8000cfc:	6811      	ldr	r1, [r2, #0]
 8000cfe:	3101      	adds	r1, #1
 8000d00:	6011      	str	r1, [r2, #0]
 8000d02:	6810      	ldr	r0, [r2, #0]
 8000d04:	21d2      	movs	r1, #210	; 0xd2
 8000d06:	0049      	lsls	r1, r1, #1
 8000d08:	4288      	cmp	r0, r1
 8000d0a:	d938      	bls.n	8000d7e <TIM14_IRQHandler+0x17a>
 8000d0c:	2100      	movs	r1, #0
 8000d0e:	6011      	str	r1, [r2, #0]
 8000d10:	4e25      	ldr	r6, [pc, #148]	; (8000da8 <TIM14_IRQHandler+0x1a4>)
 8000d12:	4a27      	ldr	r2, [pc, #156]	; (8000db0 <TIM14_IRQHandler+0x1ac>)
 8000d14:	4c23      	ldr	r4, [pc, #140]	; (8000da4 <TIM14_IRQHandler+0x1a0>)
 8000d16:	7011      	strb	r1, [r2, #0]
 8000d18:	6831      	ldr	r1, [r6, #0]
 8000d1a:	2201      	movs	r2, #1
 8000d1c:	701a      	strb	r2, [r3, #0]
 8000d1e:	4d28      	ldr	r5, [pc, #160]	; (8000dc0 <TIM14_IRQHandler+0x1bc>)
 8000d20:	2900      	cmp	r1, #0
 8000d22:	d004      	beq.n	8000d2e <TIM14_IRQHandler+0x12a>
 8000d24:	6820      	ldr	r0, [r4, #0]
 8000d26:	f001 f815 	bl	8001d54 <__aeabi_uidiv>
 8000d2a:	6028      	str	r0, [r5, #0]
 8000d2c:	e000      	b.n	8000d30 <TIM14_IRQHandler+0x12c>
 8000d2e:	6029      	str	r1, [r5, #0]
 8000d30:	2300      	movs	r3, #0
 8000d32:	6023      	str	r3, [r4, #0]
 8000d34:	6033      	str	r3, [r6, #0]
 8000d36:	e022      	b.n	8000d7e <TIM14_IRQHandler+0x17a>
 8000d38:	2204      	movs	r2, #4
 8000d3a:	e01f      	b.n	8000d7c <TIM14_IRQHandler+0x178>
 8000d3c:	4a1e      	ldr	r2, [pc, #120]	; (8000db8 <TIM14_IRQHandler+0x1b4>)
 8000d3e:	2900      	cmp	r1, #0
 8000d40:	d008      	beq.n	8000d54 <TIM14_IRQHandler+0x150>
 8000d42:	491c      	ldr	r1, [pc, #112]	; (8000db4 <TIM14_IRQHandler+0x1b0>)
 8000d44:	2501      	movs	r5, #1
 8000d46:	880c      	ldrh	r4, [r1, #0]
 8000d48:	7810      	ldrb	r0, [r2, #0]
 8000d4a:	4085      	lsls	r5, r0
 8000d4c:	1c28      	adds	r0, r5, #0
 8000d4e:	4320      	orrs	r0, r4
 8000d50:	b280      	uxth	r0, r0
 8000d52:	8008      	strh	r0, [r1, #0]
 8000d54:	7811      	ldrb	r1, [r2, #0]
 8000d56:	3101      	adds	r1, #1
 8000d58:	b2c9      	uxtb	r1, r1
 8000d5a:	7011      	strb	r1, [r2, #0]
 8000d5c:	7812      	ldrb	r2, [r2, #0]
 8000d5e:	2a07      	cmp	r2, #7
 8000d60:	d90b      	bls.n	8000d7a <TIM14_IRQHandler+0x176>
 8000d62:	4a13      	ldr	r2, [pc, #76]	; (8000db0 <TIM14_IRQHandler+0x1ac>)
 8000d64:	4813      	ldr	r0, [pc, #76]	; (8000db4 <TIM14_IRQHandler+0x1b0>)
 8000d66:	7811      	ldrb	r1, [r2, #0]
 8000d68:	8804      	ldrh	r4, [r0, #0]
 8000d6a:	4816      	ldr	r0, [pc, #88]	; (8000dc4 <TIM14_IRQHandler+0x1c0>)
 8000d6c:	5444      	strb	r4, [r0, r1]
 8000d6e:	7811      	ldrb	r1, [r2, #0]
 8000d70:	3101      	adds	r1, #1
 8000d72:	b2c9      	uxtb	r1, r1
 8000d74:	7011      	strb	r1, [r2, #0]
 8000d76:	2201      	movs	r2, #1
 8000d78:	e000      	b.n	8000d7c <TIM14_IRQHandler+0x178>
 8000d7a:	2203      	movs	r2, #3
 8000d7c:	701a      	strb	r2, [r3, #0]
 8000d7e:	4b12      	ldr	r3, [pc, #72]	; (8000dc8 <TIM14_IRQHandler+0x1c4>)
 8000d80:	2200      	movs	r2, #0
 8000d82:	821a      	strh	r2, [r3, #16]
 8000d84:	bd70      	pop	{r4, r5, r6, pc}
 8000d86:	46c0      	nop			; (mov r8, r8)
 8000d88:	200003cf 	.word	0x200003cf
 8000d8c:	200003ce 	.word	0x200003ce
 8000d90:	2000008e 	.word	0x2000008e
 8000d94:	200003d6 	.word	0x200003d6
 8000d98:	200003e4 	.word	0x200003e4
 8000d9c:	40012400 	.word	0x40012400
 8000da0:	000003e7 	.word	0x000003e7
 8000da4:	200003e0 	.word	0x200003e0
 8000da8:	200003e8 	.word	0x200003e8
 8000dac:	200003d4 	.word	0x200003d4
 8000db0:	200003d8 	.word	0x200003d8
 8000db4:	200003cc 	.word	0x200003cc
 8000db8:	200003d9 	.word	0x200003d9
 8000dbc:	200003dc 	.word	0x200003dc
 8000dc0:	200003d0 	.word	0x200003d0
 8000dc4:	20000080 	.word	0x20000080
 8000dc8:	40002000 	.word	0x40002000

08000dcc <GPIO_Init>:
 8000dcc:	2390      	movs	r3, #144	; 0x90
 8000dce:	b5f7      	push	{r0, r1, r2, r4, r5, r6, r7, lr}
 8000dd0:	05db      	lsls	r3, r3, #23
 8000dd2:	1c04      	adds	r4, r0, #0
 8000dd4:	1c0d      	adds	r5, r1, #0
 8000dd6:	4298      	cmp	r0, r3
 8000dd8:	d010      	beq.n	8000dfc <GPIO_Init+0x30>
 8000dda:	4b39      	ldr	r3, [pc, #228]	; (8000ec0 <GPIO_Init+0xf4>)
 8000ddc:	4298      	cmp	r0, r3
 8000dde:	d00d      	beq.n	8000dfc <GPIO_Init+0x30>
 8000de0:	4b38      	ldr	r3, [pc, #224]	; (8000ec4 <GPIO_Init+0xf8>)
 8000de2:	4298      	cmp	r0, r3
 8000de4:	d00a      	beq.n	8000dfc <GPIO_Init+0x30>
 8000de6:	4b38      	ldr	r3, [pc, #224]	; (8000ec8 <GPIO_Init+0xfc>)
 8000de8:	4298      	cmp	r0, r3
 8000dea:	d007      	beq.n	8000dfc <GPIO_Init+0x30>
 8000dec:	4b37      	ldr	r3, [pc, #220]	; (8000ecc <GPIO_Init+0x100>)
 8000dee:	4298      	cmp	r0, r3
 8000df0:	d004      	beq.n	8000dfc <GPIO_Init+0x30>
 8000df2:	4a37      	ldr	r2, [pc, #220]	; (8000ed0 <GPIO_Init+0x104>)
 8000df4:	1880      	adds	r0, r0, r2
 8000df6:	4243      	negs	r3, r0
 8000df8:	4158      	adcs	r0, r3
 8000dfa:	e000      	b.n	8000dfe <GPIO_Init+0x32>
 8000dfc:	2001      	movs	r0, #1
 8000dfe:	f7ff fe41 	bl	8000a84 <assert_param>
 8000e02:	6828      	ldr	r0, [r5, #0]
 8000e04:	2600      	movs	r6, #0
 8000e06:	1e43      	subs	r3, r0, #1
 8000e08:	4198      	sbcs	r0, r3
 8000e0a:	f7ff fe3b 	bl	8000a84 <assert_param>
 8000e0e:	792b      	ldrb	r3, [r5, #4]
 8000e10:	2203      	movs	r2, #3
 8000e12:	1c30      	adds	r0, r6, #0
 8000e14:	429a      	cmp	r2, r3
 8000e16:	4170      	adcs	r0, r6
 8000e18:	f7ff fe34 	bl	8000a84 <assert_param>
 8000e1c:	79eb      	ldrb	r3, [r5, #7]
 8000e1e:	2202      	movs	r2, #2
 8000e20:	1c30      	adds	r0, r6, #0
 8000e22:	429a      	cmp	r2, r3
 8000e24:	4170      	adcs	r0, r6
 8000e26:	f7ff fe2d 	bl	8000a84 <assert_param>
 8000e2a:	2001      	movs	r0, #1
 8000e2c:	1c03      	adds	r3, r0, #0
 8000e2e:	682a      	ldr	r2, [r5, #0]
 8000e30:	40b3      	lsls	r3, r6
 8000e32:	401a      	ands	r2, r3
 8000e34:	9201      	str	r2, [sp, #4]
 8000e36:	429a      	cmp	r2, r3
 8000e38:	d13d      	bne.n	8000eb6 <GPIO_Init+0xea>
 8000e3a:	792b      	ldrb	r3, [r5, #4]
 8000e3c:	0077      	lsls	r7, r6, #1
 8000e3e:	3b01      	subs	r3, #1
 8000e40:	b2db      	uxtb	r3, r3
 8000e42:	4283      	cmp	r3, r0
 8000e44:	d823      	bhi.n	8000e8e <GPIO_Init+0xc2>
 8000e46:	796b      	ldrb	r3, [r5, #5]
 8000e48:	4283      	cmp	r3, r0
 8000e4a:	d902      	bls.n	8000e52 <GPIO_Init+0x86>
 8000e4c:	1ed8      	subs	r0, r3, #3
 8000e4e:	4243      	negs	r3, r0
 8000e50:	4158      	adcs	r0, r3
 8000e52:	f7ff fe17 	bl	8000a84 <assert_param>
 8000e56:	68a3      	ldr	r3, [r4, #8]
 8000e58:	2203      	movs	r2, #3
 8000e5a:	40ba      	lsls	r2, r7
 8000e5c:	4393      	bics	r3, r2
 8000e5e:	60a3      	str	r3, [r4, #8]
 8000e60:	796b      	ldrb	r3, [r5, #5]
 8000e62:	68a2      	ldr	r2, [r4, #8]
 8000e64:	40bb      	lsls	r3, r7
 8000e66:	4313      	orrs	r3, r2
 8000e68:	60a3      	str	r3, [r4, #8]
 8000e6a:	79ab      	ldrb	r3, [r5, #6]
 8000e6c:	2201      	movs	r2, #1
 8000e6e:	2000      	movs	r0, #0
 8000e70:	429a      	cmp	r2, r3
 8000e72:	4140      	adcs	r0, r0
 8000e74:	f7ff fe06 	bl	8000a84 <assert_param>
 8000e78:	6863      	ldr	r3, [r4, #4]
 8000e7a:	9a01      	ldr	r2, [sp, #4]
 8000e7c:	b29b      	uxth	r3, r3
 8000e7e:	4393      	bics	r3, r2
 8000e80:	80a3      	strh	r3, [r4, #4]
 8000e82:	79ab      	ldrb	r3, [r5, #6]
 8000e84:	6862      	ldr	r2, [r4, #4]
 8000e86:	40b3      	lsls	r3, r6
 8000e88:	4313      	orrs	r3, r2
 8000e8a:	b29b      	uxth	r3, r3
 8000e8c:	80a3      	strh	r3, [r4, #4]
 8000e8e:	2303      	movs	r3, #3
 8000e90:	6822      	ldr	r2, [r4, #0]
 8000e92:	40bb      	lsls	r3, r7
 8000e94:	43db      	mvns	r3, r3
 8000e96:	401a      	ands	r2, r3
 8000e98:	6022      	str	r2, [r4, #0]
 8000e9a:	792a      	ldrb	r2, [r5, #4]
 8000e9c:	6821      	ldr	r1, [r4, #0]
 8000e9e:	40ba      	lsls	r2, r7
 8000ea0:	430a      	orrs	r2, r1
 8000ea2:	6022      	str	r2, [r4, #0]
 8000ea4:	68e2      	ldr	r2, [r4, #12]
 8000ea6:	4013      	ands	r3, r2
 8000ea8:	79ea      	ldrb	r2, [r5, #7]
 8000eaa:	60e3      	str	r3, [r4, #12]
 8000eac:	68e3      	ldr	r3, [r4, #12]
 8000eae:	40ba      	lsls	r2, r7
 8000eb0:	1c17      	adds	r7, r2, #0
 8000eb2:	431f      	orrs	r7, r3
 8000eb4:	60e7      	str	r7, [r4, #12]
 8000eb6:	3601      	adds	r6, #1
 8000eb8:	2e10      	cmp	r6, #16
 8000eba:	d1b6      	bne.n	8000e2a <GPIO_Init+0x5e>
 8000ebc:	bdf7      	pop	{r0, r1, r2, r4, r5, r6, r7, pc}
 8000ebe:	46c0      	nop			; (mov r8, r8)
 8000ec0:	48000400 	.word	0x48000400
 8000ec4:	48000800 	.word	0x48000800
 8000ec8:	48000c00 	.word	0x48000c00
 8000ecc:	48001000 	.word	0x48001000
 8000ed0:	b7ffec00 	.word	0xb7ffec00

08000ed4 <GPIO_PinAFConfig>:
 8000ed4:	b5f7      	push	{r0, r1, r2, r4, r5, r6, r7, lr}
 8000ed6:	2390      	movs	r3, #144	; 0x90
 8000ed8:	1c04      	adds	r4, r0, #0
 8000eda:	1c0e      	adds	r6, r1, #0
 8000edc:	9201      	str	r2, [sp, #4]
 8000ede:	05db      	lsls	r3, r3, #23
 8000ee0:	4298      	cmp	r0, r3
 8000ee2:	d010      	beq.n	8000f06 <GPIO_PinAFConfig+0x32>
 8000ee4:	4b19      	ldr	r3, [pc, #100]	; (8000f4c <GPIO_PinAFConfig+0x78>)
 8000ee6:	4298      	cmp	r0, r3
 8000ee8:	d00d      	beq.n	8000f06 <GPIO_PinAFConfig+0x32>
 8000eea:	4b19      	ldr	r3, [pc, #100]	; (8000f50 <GPIO_PinAFConfig+0x7c>)
 8000eec:	4298      	cmp	r0, r3
 8000eee:	d00a      	beq.n	8000f06 <GPIO_PinAFConfig+0x32>
 8000ef0:	4b18      	ldr	r3, [pc, #96]	; (8000f54 <GPIO_PinAFConfig+0x80>)
 8000ef2:	4298      	cmp	r0, r3
 8000ef4:	d007      	beq.n	8000f06 <GPIO_PinAFConfig+0x32>
 8000ef6:	4b18      	ldr	r3, [pc, #96]	; (8000f58 <GPIO_PinAFConfig+0x84>)
 8000ef8:	4298      	cmp	r0, r3
 8000efa:	d004      	beq.n	8000f06 <GPIO_PinAFConfig+0x32>
 8000efc:	4a17      	ldr	r2, [pc, #92]	; (8000f5c <GPIO_PinAFConfig+0x88>)
 8000efe:	1880      	adds	r0, r0, r2
 8000f00:	4243      	negs	r3, r0
 8000f02:	4158      	adcs	r0, r3
 8000f04:	e000      	b.n	8000f08 <GPIO_PinAFConfig+0x34>
 8000f06:	2001      	movs	r0, #1
 8000f08:	2500      	movs	r5, #0
 8000f0a:	f7ff fdbb 	bl	8000a84 <assert_param>
 8000f0e:	230f      	movs	r3, #15
 8000f10:	1c28      	adds	r0, r5, #0
 8000f12:	42b3      	cmp	r3, r6
 8000f14:	4168      	adcs	r0, r5
 8000f16:	f7ff fdb5 	bl	8000a84 <assert_param>
 8000f1a:	9a01      	ldr	r2, [sp, #4]
 8000f1c:	1c28      	adds	r0, r5, #0
 8000f1e:	2707      	movs	r7, #7
 8000f20:	4297      	cmp	r7, r2
 8000f22:	4168      	adcs	r0, r5
 8000f24:	4037      	ands	r7, r6
 8000f26:	08f6      	lsrs	r6, r6, #3
 8000f28:	00b6      	lsls	r6, r6, #2
 8000f2a:	19a4      	adds	r4, r4, r6
 8000f2c:	f7ff fdaa 	bl	8000a84 <assert_param>
 8000f30:	00bf      	lsls	r7, r7, #2
 8000f32:	6a23      	ldr	r3, [r4, #32]
 8000f34:	220f      	movs	r2, #15
 8000f36:	40ba      	lsls	r2, r7
 8000f38:	4393      	bics	r3, r2
 8000f3a:	9a01      	ldr	r2, [sp, #4]
 8000f3c:	6223      	str	r3, [r4, #32]
 8000f3e:	6a23      	ldr	r3, [r4, #32]
 8000f40:	40ba      	lsls	r2, r7
 8000f42:	1c17      	adds	r7, r2, #0
 8000f44:	431f      	orrs	r7, r3
 8000f46:	6227      	str	r7, [r4, #32]
 8000f48:	bdf7      	pop	{r0, r1, r2, r4, r5, r6, r7, pc}
 8000f4a:	46c0      	nop			; (mov r8, r8)
 8000f4c:	48000400 	.word	0x48000400
 8000f50:	48000800 	.word	0x48000800
 8000f54:	48000c00 	.word	0x48000c00
 8000f58:	48001000 	.word	0x48001000
 8000f5c:	b7ffec00 	.word	0xb7ffec00

08000f60 <TIM_TimeBaseInit>:
 8000f60:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
 8000f62:	4e34      	ldr	r6, [pc, #208]	; (8001034 <TIM_TimeBaseInit+0xd4>)
 8000f64:	1c04      	adds	r4, r0, #0
 8000f66:	1c0d      	adds	r5, r1, #0
 8000f68:	4f33      	ldr	r7, [pc, #204]	; (8001038 <TIM_TimeBaseInit+0xd8>)
 8000f6a:	42b0      	cmp	r0, r6
 8000f6c:	d019      	beq.n	8000fa2 <TIM_TimeBaseInit+0x42>
 8000f6e:	2380      	movs	r3, #128	; 0x80
 8000f70:	05db      	lsls	r3, r3, #23
 8000f72:	4298      	cmp	r0, r3
 8000f74:	d015      	beq.n	8000fa2 <TIM_TimeBaseInit+0x42>
 8000f76:	4b31      	ldr	r3, [pc, #196]	; (800103c <TIM_TimeBaseInit+0xdc>)
 8000f78:	4298      	cmp	r0, r3
 8000f7a:	d012      	beq.n	8000fa2 <TIM_TimeBaseInit+0x42>
 8000f7c:	42b8      	cmp	r0, r7
 8000f7e:	d010      	beq.n	8000fa2 <TIM_TimeBaseInit+0x42>
 8000f80:	4b2f      	ldr	r3, [pc, #188]	; (8001040 <TIM_TimeBaseInit+0xe0>)
 8000f82:	4298      	cmp	r0, r3
 8000f84:	d00d      	beq.n	8000fa2 <TIM_TimeBaseInit+0x42>
 8000f86:	4b2f      	ldr	r3, [pc, #188]	; (8001044 <TIM_TimeBaseInit+0xe4>)
 8000f88:	4298      	cmp	r0, r3
 8000f8a:	d00a      	beq.n	8000fa2 <TIM_TimeBaseInit+0x42>
 8000f8c:	4b2e      	ldr	r3, [pc, #184]	; (8001048 <TIM_TimeBaseInit+0xe8>)
 8000f8e:	4298      	cmp	r0, r3
 8000f90:	d007      	beq.n	8000fa2 <TIM_TimeBaseInit+0x42>
 8000f92:	4b2e      	ldr	r3, [pc, #184]	; (800104c <TIM_TimeBaseInit+0xec>)
 8000f94:	4298      	cmp	r0, r3
 8000f96:	d004      	beq.n	8000fa2 <TIM_TimeBaseInit+0x42>
 8000f98:	492d      	ldr	r1, [pc, #180]	; (8001050 <TIM_TimeBaseInit+0xf0>)
 8000f9a:	1840      	adds	r0, r0, r1
 8000f9c:	4243      	negs	r3, r0
 8000f9e:	4158      	adcs	r0, r3
 8000fa0:	e000      	b.n	8000fa4 <TIM_TimeBaseInit+0x44>
 8000fa2:	2001      	movs	r0, #1
 8000fa4:	f7ff fd6e 	bl	8000a84 <assert_param>
 8000fa8:	886b      	ldrh	r3, [r5, #2]
 8000faa:	2210      	movs	r2, #16
 8000fac:	1c19      	adds	r1, r3, #0
 8000fae:	4391      	bics	r1, r2
 8000fb0:	d101      	bne.n	8000fb6 <TIM_TimeBaseInit+0x56>
 8000fb2:	2001      	movs	r0, #1
 8000fb4:	e007      	b.n	8000fc6 <TIM_TimeBaseInit+0x66>
 8000fb6:	2240      	movs	r2, #64	; 0x40
 8000fb8:	1c19      	adds	r1, r3, #0
 8000fba:	4391      	bics	r1, r2
 8000fbc:	2920      	cmp	r1, #32
 8000fbe:	d0f8      	beq.n	8000fb2 <TIM_TimeBaseInit+0x52>
 8000fc0:	2b40      	cmp	r3, #64	; 0x40
 8000fc2:	d0f6      	beq.n	8000fb2 <TIM_TimeBaseInit+0x52>
 8000fc4:	2000      	movs	r0, #0
 8000fc6:	f7ff fd5d 	bl	8000a84 <assert_param>
 8000fca:	892b      	ldrh	r3, [r5, #8]
 8000fcc:	4a21      	ldr	r2, [pc, #132]	; (8001054 <TIM_TimeBaseInit+0xf4>)
 8000fce:	2001      	movs	r0, #1
 8000fd0:	4213      	tst	r3, r2
 8000fd2:	d003      	beq.n	8000fdc <TIM_TimeBaseInit+0x7c>
 8000fd4:	4a20      	ldr	r2, [pc, #128]	; (8001058 <TIM_TimeBaseInit+0xf8>)
 8000fd6:	1898      	adds	r0, r3, r2
 8000fd8:	4243      	negs	r3, r0
 8000fda:	4158      	adcs	r0, r3
 8000fdc:	f7ff fd52 	bl	8000a84 <assert_param>
 8000fe0:	6823      	ldr	r3, [r4, #0]
 8000fe2:	b29b      	uxth	r3, r3
 8000fe4:	42b4      	cmp	r4, r6
 8000fe6:	d006      	beq.n	8000ff6 <TIM_TimeBaseInit+0x96>
 8000fe8:	2280      	movs	r2, #128	; 0x80
 8000fea:	05d2      	lsls	r2, r2, #23
 8000fec:	4294      	cmp	r4, r2
 8000fee:	d002      	beq.n	8000ff6 <TIM_TimeBaseInit+0x96>
 8000ff0:	4a12      	ldr	r2, [pc, #72]	; (800103c <TIM_TimeBaseInit+0xdc>)
 8000ff2:	4294      	cmp	r4, r2
 8000ff4:	d103      	bne.n	8000ffe <TIM_TimeBaseInit+0x9e>
 8000ff6:	2270      	movs	r2, #112	; 0x70
 8000ff8:	4393      	bics	r3, r2
 8000ffa:	886a      	ldrh	r2, [r5, #2]
 8000ffc:	4313      	orrs	r3, r2
 8000ffe:	42bc      	cmp	r4, r7
 8001000:	d003      	beq.n	800100a <TIM_TimeBaseInit+0xaa>
 8001002:	4916      	ldr	r1, [pc, #88]	; (800105c <TIM_TimeBaseInit+0xfc>)
 8001004:	892a      	ldrh	r2, [r5, #8]
 8001006:	400b      	ands	r3, r1
 8001008:	4313      	orrs	r3, r2
 800100a:	8023      	strh	r3, [r4, #0]
 800100c:	686b      	ldr	r3, [r5, #4]
 800100e:	62e3      	str	r3, [r4, #44]	; 0x2c
 8001010:	882b      	ldrh	r3, [r5, #0]
 8001012:	8523      	strh	r3, [r4, #40]	; 0x28
 8001014:	42b4      	cmp	r4, r6
 8001016:	d008      	beq.n	800102a <TIM_TimeBaseInit+0xca>
 8001018:	4b0b      	ldr	r3, [pc, #44]	; (8001048 <TIM_TimeBaseInit+0xe8>)
 800101a:	429c      	cmp	r4, r3
 800101c:	d005      	beq.n	800102a <TIM_TimeBaseInit+0xca>
 800101e:	4b0b      	ldr	r3, [pc, #44]	; (800104c <TIM_TimeBaseInit+0xec>)
 8001020:	429c      	cmp	r4, r3
 8001022:	d002      	beq.n	800102a <TIM_TimeBaseInit+0xca>
 8001024:	4b0e      	ldr	r3, [pc, #56]	; (8001060 <TIM_TimeBaseInit+0x100>)
 8001026:	429c      	cmp	r4, r3
 8001028:	d101      	bne.n	800102e <TIM_TimeBaseInit+0xce>
 800102a:	7aab      	ldrb	r3, [r5, #10]
 800102c:	8623      	strh	r3, [r4, #48]	; 0x30
 800102e:	2301      	movs	r3, #1
 8001030:	82a3      	strh	r3, [r4, #20]
 8001032:	bdf8      	pop	{r3, r4, r5, r6, r7, pc}
 8001034:	40012c00 	.word	0x40012c00
 8001038:	40001000 	.word	0x40001000
 800103c:	40000400 	.word	0x40000400
 8001040:	40001400 	.word	0x40001400
 8001044:	40002000 	.word	0x40002000
 8001048:	40014000 	.word	0x40014000
 800104c:	40014400 	.word	0x40014400
 8001050:	bffeb800 	.word	0xbffeb800
 8001054:	fffffeff 	.word	0xfffffeff
 8001058:	fffffe00 	.word	0xfffffe00
 800105c:	fffffcff 	.word	0xfffffcff
 8001060:	40014800 	.word	0x40014800

08001064 <TIM_Cmd>:
 8001064:	4b19      	ldr	r3, [pc, #100]	; (80010cc <TIM_Cmd+0x68>)
 8001066:	b570      	push	{r4, r5, r6, lr}
 8001068:	1c04      	adds	r4, r0, #0
 800106a:	1c0e      	adds	r6, r1, #0
 800106c:	4298      	cmp	r0, r3
 800106e:	d01a      	beq.n	80010a6 <TIM_Cmd+0x42>
 8001070:	2380      	movs	r3, #128	; 0x80
 8001072:	05db      	lsls	r3, r3, #23
 8001074:	4298      	cmp	r0, r3
 8001076:	d016      	beq.n	80010a6 <TIM_Cmd+0x42>
 8001078:	4b15      	ldr	r3, [pc, #84]	; (80010d0 <TIM_Cmd+0x6c>)
 800107a:	4298      	cmp	r0, r3
 800107c:	d013      	beq.n	80010a6 <TIM_Cmd+0x42>
 800107e:	4b15      	ldr	r3, [pc, #84]	; (80010d4 <TIM_Cmd+0x70>)
 8001080:	4298      	cmp	r0, r3
 8001082:	d010      	beq.n	80010a6 <TIM_Cmd+0x42>
 8001084:	4b14      	ldr	r3, [pc, #80]	; (80010d8 <TIM_Cmd+0x74>)
 8001086:	4298      	cmp	r0, r3
 8001088:	d00d      	beq.n	80010a6 <TIM_Cmd+0x42>
 800108a:	4b14      	ldr	r3, [pc, #80]	; (80010dc <TIM_Cmd+0x78>)
 800108c:	4298      	cmp	r0, r3
 800108e:	d00a      	beq.n	80010a6 <TIM_Cmd+0x42>
 8001090:	4b13      	ldr	r3, [pc, #76]	; (80010e0 <TIM_Cmd+0x7c>)
 8001092:	4298      	cmp	r0, r3
 8001094:	d007      	beq.n	80010a6 <TIM_Cmd+0x42>
 8001096:	4b13      	ldr	r3, [pc, #76]	; (80010e4 <TIM_Cmd+0x80>)
 8001098:	4298      	cmp	r0, r3
 800109a:	d004      	beq.n	80010a6 <TIM_Cmd+0x42>
 800109c:	4b12      	ldr	r3, [pc, #72]	; (80010e8 <TIM_Cmd+0x84>)
 800109e:	18c0      	adds	r0, r0, r3
 80010a0:	4243      	negs	r3, r0
 80010a2:	4158      	adcs	r0, r3
 80010a4:	e000      	b.n	80010a8 <TIM_Cmd+0x44>
 80010a6:	2001      	movs	r0, #1
 80010a8:	f7ff fcec 	bl	8000a84 <assert_param>
 80010ac:	2501      	movs	r5, #1
 80010ae:	2000      	movs	r0, #0
 80010b0:	42b5      	cmp	r5, r6
 80010b2:	4140      	adcs	r0, r0
 80010b4:	f7ff fce6 	bl	8000a84 <assert_param>
 80010b8:	6823      	ldr	r3, [r4, #0]
 80010ba:	b29b      	uxth	r3, r3
 80010bc:	2e00      	cmp	r6, #0
 80010be:	d002      	beq.n	80010c6 <TIM_Cmd+0x62>
 80010c0:	431d      	orrs	r5, r3
 80010c2:	8025      	strh	r5, [r4, #0]
 80010c4:	e001      	b.n	80010ca <TIM_Cmd+0x66>
 80010c6:	43ab      	bics	r3, r5
 80010c8:	8023      	strh	r3, [r4, #0]
 80010ca:	bd70      	pop	{r4, r5, r6, pc}
 80010cc:	40012c00 	.word	0x40012c00
 80010d0:	40000400 	.word	0x40000400
 80010d4:	40001000 	.word	0x40001000
 80010d8:	40001400 	.word	0x40001400
 80010dc:	40002000 	.word	0x40002000
 80010e0:	40014000 	.word	0x40014000
 80010e4:	40014400 	.word	0x40014400
 80010e8:	bffeb800 	.word	0xbffeb800

080010ec <TIM_ITConfig>:
 80010ec:	4b1f      	ldr	r3, [pc, #124]	; (800116c <TIM_ITConfig+0x80>)
 80010ee:	b570      	push	{r4, r5, r6, lr}
 80010f0:	1c04      	adds	r4, r0, #0
 80010f2:	1c0d      	adds	r5, r1, #0
 80010f4:	1c16      	adds	r6, r2, #0
 80010f6:	4298      	cmp	r0, r3
 80010f8:	d01a      	beq.n	8001130 <TIM_ITConfig+0x44>
 80010fa:	2380      	movs	r3, #128	; 0x80
 80010fc:	05db      	lsls	r3, r3, #23
 80010fe:	4298      	cmp	r0, r3
 8001100:	d016      	beq.n	8001130 <TIM_ITConfig+0x44>
 8001102:	4b1b      	ldr	r3, [pc, #108]	; (8001170 <TIM_ITConfig+0x84>)
 8001104:	4298      	cmp	r0, r3
 8001106:	d013      	beq.n	8001130 <TIM_ITConfig+0x44>
 8001108:	4b1a      	ldr	r3, [pc, #104]	; (8001174 <TIM_ITConfig+0x88>)
 800110a:	4298      	cmp	r0, r3
 800110c:	d010      	beq.n	8001130 <TIM_ITConfig+0x44>
 800110e:	4b1a      	ldr	r3, [pc, #104]	; (8001178 <TIM_ITConfig+0x8c>)
 8001110:	4298      	cmp	r0, r3
 8001112:	d00d      	beq.n	8001130 <TIM_ITConfig+0x44>
 8001114:	4b19      	ldr	r3, [pc, #100]	; (800117c <TIM_ITConfig+0x90>)
 8001116:	4298      	cmp	r0, r3
 8001118:	d00a      	beq.n	8001130 <TIM_ITConfig+0x44>
 800111a:	4b19      	ldr	r3, [pc, #100]	; (8001180 <TIM_ITConfig+0x94>)
 800111c:	4298      	cmp	r0, r3
 800111e:	d007      	beq.n	8001130 <TIM_ITConfig+0x44>
 8001120:	4b18      	ldr	r3, [pc, #96]	; (8001184 <TIM_ITConfig+0x98>)
 8001122:	4298      	cmp	r0, r3
 8001124:	d004      	beq.n	8001130 <TIM_ITConfig+0x44>
 8001126:	4a18      	ldr	r2, [pc, #96]	; (8001188 <TIM_ITConfig+0x9c>)
 8001128:	1880      	adds	r0, r0, r2
 800112a:	4243      	negs	r3, r0
 800112c:	4158      	adcs	r0, r3
 800112e:	e000      	b.n	8001132 <TIM_ITConfig+0x46>
 8001130:	2001      	movs	r0, #1
 8001132:	f7ff fca7 	bl	8000a84 <assert_param>
 8001136:	23ff      	movs	r3, #255	; 0xff
 8001138:	1c2a      	adds	r2, r5, #0
 800113a:	2000      	movs	r0, #0
 800113c:	439a      	bics	r2, r3
 800113e:	4282      	cmp	r2, r0
 8001140:	d102      	bne.n	8001148 <TIM_ITConfig+0x5c>
 8001142:	1c28      	adds	r0, r5, #0
 8001144:	1e43      	subs	r3, r0, #1
 8001146:	4198      	sbcs	r0, r3
 8001148:	f7ff fc9c 	bl	8000a84 <assert_param>
 800114c:	2301      	movs	r3, #1
 800114e:	2000      	movs	r0, #0
 8001150:	42b3      	cmp	r3, r6
 8001152:	4140      	adcs	r0, r0
 8001154:	f7ff fc96 	bl	8000a84 <assert_param>
 8001158:	68e3      	ldr	r3, [r4, #12]
 800115a:	b29b      	uxth	r3, r3
 800115c:	2e00      	cmp	r6, #0
 800115e:	d002      	beq.n	8001166 <TIM_ITConfig+0x7a>
 8001160:	431d      	orrs	r5, r3
 8001162:	81a5      	strh	r5, [r4, #12]
 8001164:	e001      	b.n	800116a <TIM_ITConfig+0x7e>
 8001166:	43ab      	bics	r3, r5
 8001168:	81a3      	strh	r3, [r4, #12]
 800116a:	bd70      	pop	{r4, r5, r6, pc}
 800116c:	40012c00 	.word	0x40012c00
 8001170:	40000400 	.word	0x40000400
 8001174:	40001000 	.word	0x40001000
 8001178:	40001400 	.word	0x40001400
 800117c:	40002000 	.word	0x40002000
 8001180:	40014000 	.word	0x40014000
 8001184:	40014400 	.word	0x40014400
 8001188:	bffeb800 	.word	0xbffeb800

0800118c <USART_Init>:
 800118c:	b5f0      	push	{r4, r5, r6, r7, lr}
 800118e:	4e53      	ldr	r6, [pc, #332]	; (80012dc <USART_Init+0x150>)
 8001190:	b08b      	sub	sp, #44	; 0x2c
 8001192:	1c04      	adds	r4, r0, #0
 8001194:	1c0d      	adds	r5, r1, #0
 8001196:	42b0      	cmp	r0, r6
 8001198:	d016      	beq.n	80011c8 <USART_Init+0x3c>
 800119a:	4b51      	ldr	r3, [pc, #324]	; (80012e0 <USART_Init+0x154>)
 800119c:	4298      	cmp	r0, r3
 800119e:	d013      	beq.n	80011c8 <USART_Init+0x3c>
 80011a0:	4b50      	ldr	r3, [pc, #320]	; (80012e4 <USART_Init+0x158>)
 80011a2:	4298      	cmp	r0, r3
 80011a4:	d010      	beq.n	80011c8 <USART_Init+0x3c>
 80011a6:	4b50      	ldr	r3, [pc, #320]	; (80012e8 <USART_Init+0x15c>)
 80011a8:	4298      	cmp	r0, r3
 80011aa:	d00d      	beq.n	80011c8 <USART_Init+0x3c>
 80011ac:	4b4f      	ldr	r3, [pc, #316]	; (80012ec <USART_Init+0x160>)
 80011ae:	4298      	cmp	r0, r3
 80011b0:	d00a      	beq.n	80011c8 <USART_Init+0x3c>
 80011b2:	4b4f      	ldr	r3, [pc, #316]	; (80012f0 <USART_Init+0x164>)
 80011b4:	4298      	cmp	r0, r3
 80011b6:	d007      	beq.n	80011c8 <USART_Init+0x3c>
 80011b8:	4b4e      	ldr	r3, [pc, #312]	; (80012f4 <USART_Init+0x168>)
 80011ba:	4298      	cmp	r0, r3
 80011bc:	d004      	beq.n	80011c8 <USART_Init+0x3c>
 80011be:	494e      	ldr	r1, [pc, #312]	; (80012f8 <USART_Init+0x16c>)
 80011c0:	1840      	adds	r0, r0, r1
 80011c2:	4243      	negs	r3, r0
 80011c4:	4158      	adcs	r0, r3
 80011c6:	e000      	b.n	80011ca <USART_Init+0x3e>
 80011c8:	2001      	movs	r0, #1
 80011ca:	f7ff fc5b 	bl	8000a84 <assert_param>
 80011ce:	682b      	ldr	r3, [r5, #0]
 80011d0:	4a4a      	ldr	r2, [pc, #296]	; (80012fc <USART_Init+0x170>)
 80011d2:	3b01      	subs	r3, #1
 80011d4:	2000      	movs	r0, #0
 80011d6:	429a      	cmp	r2, r3
 80011d8:	4140      	adcs	r0, r0
 80011da:	f7ff fc53 	bl	8000a84 <assert_param>
 80011de:	686b      	ldr	r3, [r5, #4]
 80011e0:	4a47      	ldr	r2, [pc, #284]	; (8001300 <USART_Init+0x174>)
 80011e2:	2001      	movs	r0, #1
 80011e4:	4213      	tst	r3, r2
 80011e6:	d003      	beq.n	80011f0 <USART_Init+0x64>
 80011e8:	4a46      	ldr	r2, [pc, #280]	; (8001304 <USART_Init+0x178>)
 80011ea:	1898      	adds	r0, r3, r2
 80011ec:	4243      	negs	r3, r0
 80011ee:	4158      	adcs	r0, r3
 80011f0:	f7ff fc48 	bl	8000a84 <assert_param>
 80011f4:	68ab      	ldr	r3, [r5, #8]
 80011f6:	4a44      	ldr	r2, [pc, #272]	; (8001308 <USART_Init+0x17c>)
 80011f8:	2001      	movs	r0, #1
 80011fa:	4213      	tst	r3, r2
 80011fc:	d003      	beq.n	8001206 <USART_Init+0x7a>
 80011fe:	4943      	ldr	r1, [pc, #268]	; (800130c <USART_Init+0x180>)
 8001200:	1858      	adds	r0, r3, r1
 8001202:	4243      	negs	r3, r0
 8001204:	4158      	adcs	r0, r3
 8001206:	f7ff fc3d 	bl	8000a84 <assert_param>
 800120a:	68eb      	ldr	r3, [r5, #12]
 800120c:	4a40      	ldr	r2, [pc, #256]	; (8001310 <USART_Init+0x184>)
 800120e:	2001      	movs	r0, #1
 8001210:	4213      	tst	r3, r2
 8001212:	d003      	beq.n	800121c <USART_Init+0x90>
 8001214:	4a3f      	ldr	r2, [pc, #252]	; (8001314 <USART_Init+0x188>)
 8001216:	1898      	adds	r0, r3, r2
 8001218:	4243      	negs	r3, r0
 800121a:	4158      	adcs	r0, r3
 800121c:	f7ff fc32 	bl	8000a84 <assert_param>
 8001220:	692b      	ldr	r3, [r5, #16]
 8001222:	220c      	movs	r2, #12
 8001224:	1c19      	adds	r1, r3, #0
 8001226:	2000      	movs	r0, #0
 8001228:	4391      	bics	r1, r2
 800122a:	4281      	cmp	r1, r0
 800122c:	d102      	bne.n	8001234 <USART_Init+0xa8>
 800122e:	1c18      	adds	r0, r3, #0
 8001230:	1e43      	subs	r3, r0, #1
 8001232:	4198      	sbcs	r0, r3
 8001234:	f7ff fc26 	bl	8000a84 <assert_param>
 8001238:	4f37      	ldr	r7, [pc, #220]	; (8001318 <USART_Init+0x18c>)
 800123a:	6968      	ldr	r0, [r5, #20]
 800123c:	4038      	ands	r0, r7
 800123e:	4243      	negs	r3, r0
 8001240:	4158      	adcs	r0, r3
 8001242:	f7ff fc1f 	bl	8000a84 <assert_param>
 8001246:	6823      	ldr	r3, [r4, #0]
 8001248:	2201      	movs	r2, #1
 800124a:	4393      	bics	r3, r2
 800124c:	6023      	str	r3, [r4, #0]
 800124e:	6862      	ldr	r2, [r4, #4]
 8001250:	4b32      	ldr	r3, [pc, #200]	; (800131c <USART_Init+0x190>)
 8001252:	6869      	ldr	r1, [r5, #4]
 8001254:	4013      	ands	r3, r2
 8001256:	68aa      	ldr	r2, [r5, #8]
 8001258:	4668      	mov	r0, sp
 800125a:	4313      	orrs	r3, r2
 800125c:	6063      	str	r3, [r4, #4]
 800125e:	6822      	ldr	r2, [r4, #0]
 8001260:	4b2f      	ldr	r3, [pc, #188]	; (8001320 <USART_Init+0x194>)
 8001262:	401a      	ands	r2, r3
 8001264:	68eb      	ldr	r3, [r5, #12]
 8001266:	430b      	orrs	r3, r1
 8001268:	6929      	ldr	r1, [r5, #16]
 800126a:	430b      	orrs	r3, r1
 800126c:	4313      	orrs	r3, r2
 800126e:	6023      	str	r3, [r4, #0]
 8001270:	68a3      	ldr	r3, [r4, #8]
 8001272:	696a      	ldr	r2, [r5, #20]
 8001274:	401f      	ands	r7, r3
 8001276:	4317      	orrs	r7, r2
 8001278:	60a7      	str	r7, [r4, #8]
 800127a:	f000 fb7b 	bl	8001974 <RCC_GetClocksFreq>
 800127e:	42b4      	cmp	r4, r6
 8001280:	d101      	bne.n	8001286 <USART_Init+0xfa>
 8001282:	9e06      	ldr	r6, [sp, #24]
 8001284:	e00a      	b.n	800129c <USART_Init+0x110>
 8001286:	4b16      	ldr	r3, [pc, #88]	; (80012e0 <USART_Init+0x154>)
 8001288:	429c      	cmp	r4, r3
 800128a:	d101      	bne.n	8001290 <USART_Init+0x104>
 800128c:	9e07      	ldr	r6, [sp, #28]
 800128e:	e005      	b.n	800129c <USART_Init+0x110>
 8001290:	4b14      	ldr	r3, [pc, #80]	; (80012e4 <USART_Init+0x158>)
 8001292:	429c      	cmp	r4, r3
 8001294:	d101      	bne.n	800129a <USART_Init+0x10e>
 8001296:	9e08      	ldr	r6, [sp, #32]
 8001298:	e000      	b.n	800129c <USART_Init+0x110>
 800129a:	9e02      	ldr	r6, [sp, #8]
 800129c:	6823      	ldr	r3, [r4, #0]
 800129e:	682f      	ldr	r7, [r5, #0]
 80012a0:	0419      	lsls	r1, r3, #16
 80012a2:	d500      	bpl.n	80012a6 <USART_Init+0x11a>
 80012a4:	0076      	lsls	r6, r6, #1
 80012a6:	1c39      	adds	r1, r7, #0
 80012a8:	1c30      	adds	r0, r6, #0
 80012aa:	f000 fd53 	bl	8001d54 <__aeabi_uidiv>
 80012ae:	1c39      	adds	r1, r7, #0
 80012b0:	1c05      	adds	r5, r0, #0
 80012b2:	1c30      	adds	r0, r6, #0
 80012b4:	f000 fd92 	bl	8001ddc <__aeabi_uidivmod>
 80012b8:	087f      	lsrs	r7, r7, #1
 80012ba:	2300      	movs	r3, #0
 80012bc:	42b9      	cmp	r1, r7
 80012be:	415b      	adcs	r3, r3
 80012c0:	18ed      	adds	r5, r5, r3
 80012c2:	6823      	ldr	r3, [r4, #0]
 80012c4:	041a      	lsls	r2, r3, #16
 80012c6:	d504      	bpl.n	80012d2 <USART_Init+0x146>
 80012c8:	4a16      	ldr	r2, [pc, #88]	; (8001324 <USART_Init+0x198>)
 80012ca:	072b      	lsls	r3, r5, #28
 80012cc:	0f5b      	lsrs	r3, r3, #29
 80012ce:	4015      	ands	r5, r2
 80012d0:	431d      	orrs	r5, r3
 80012d2:	b2ad      	uxth	r5, r5
 80012d4:	81a5      	strh	r5, [r4, #12]
 80012d6:	b00b      	add	sp, #44	; 0x2c
 80012d8:	bdf0      	pop	{r4, r5, r6, r7, pc}
 80012da:	46c0      	nop			; (mov r8, r8)
 80012dc:	40013800 	.word	0x40013800
 80012e0:	40004400 	.word	0x40004400
 80012e4:	40004800 	.word	0x40004800
 80012e8:	40004c00 	.word	0x40004c00
 80012ec:	40005000 	.word	0x40005000
 80012f0:	40011400 	.word	0x40011400
 80012f4:	40011800 	.word	0x40011800
 80012f8:	bffee400 	.word	0xbffee400
 80012fc:	005b8d7f 	.word	0x005b8d7f
 8001300:	ffffefff 	.word	0xffffefff
 8001304:	effff000 	.word	0xeffff000
 8001308:	ffffdfff 	.word	0xffffdfff
 800130c:	ffffd000 	.word	0xffffd000
 8001310:	fffffbff 	.word	0xfffffbff
 8001314:	fffffa00 	.word	0xfffffa00
 8001318:	fffffcff 	.word	0xfffffcff
 800131c:	ffffcfff 	.word	0xffffcfff
 8001320:	ffffe9f3 	.word	0xffffe9f3
 8001324:	0000fff0 	.word	0x0000fff0

08001328 <USART_Cmd>:
 8001328:	4b17      	ldr	r3, [pc, #92]	; (8001388 <USART_Cmd+0x60>)
 800132a:	b570      	push	{r4, r5, r6, lr}
 800132c:	1c04      	adds	r4, r0, #0
 800132e:	1c0e      	adds	r6, r1, #0
 8001330:	4298      	cmp	r0, r3
 8001332:	d016      	beq.n	8001362 <USART_Cmd+0x3a>
 8001334:	4b15      	ldr	r3, [pc, #84]	; (800138c <USART_Cmd+0x64>)
 8001336:	4298      	cmp	r0, r3
 8001338:	d013      	beq.n	8001362 <USART_Cmd+0x3a>
 800133a:	4b15      	ldr	r3, [pc, #84]	; (8001390 <USART_Cmd+0x68>)
 800133c:	4298      	cmp	r0, r3
 800133e:	d010      	beq.n	8001362 <USART_Cmd+0x3a>
 8001340:	4b14      	ldr	r3, [pc, #80]	; (8001394 <USART_Cmd+0x6c>)
 8001342:	4298      	cmp	r0, r3
 8001344:	d00d      	beq.n	8001362 <USART_Cmd+0x3a>
 8001346:	4b14      	ldr	r3, [pc, #80]	; (8001398 <USART_Cmd+0x70>)
 8001348:	4298      	cmp	r0, r3
 800134a:	d00a      	beq.n	8001362 <USART_Cmd+0x3a>
 800134c:	4b13      	ldr	r3, [pc, #76]	; (800139c <USART_Cmd+0x74>)
 800134e:	4298      	cmp	r0, r3
 8001350:	d007      	beq.n	8001362 <USART_Cmd+0x3a>
 8001352:	4b13      	ldr	r3, [pc, #76]	; (80013a0 <USART_Cmd+0x78>)
 8001354:	4298      	cmp	r0, r3
 8001356:	d004      	beq.n	8001362 <USART_Cmd+0x3a>
 8001358:	4b12      	ldr	r3, [pc, #72]	; (80013a4 <USART_Cmd+0x7c>)
 800135a:	18c0      	adds	r0, r0, r3
 800135c:	4243      	negs	r3, r0
 800135e:	4158      	adcs	r0, r3
 8001360:	e000      	b.n	8001364 <USART_Cmd+0x3c>
 8001362:	2001      	movs	r0, #1
 8001364:	f7ff fb8e 	bl	8000a84 <assert_param>
 8001368:	2501      	movs	r5, #1
 800136a:	2000      	movs	r0, #0
 800136c:	42b5      	cmp	r5, r6
 800136e:	4140      	adcs	r0, r0
 8001370:	f7ff fb88 	bl	8000a84 <assert_param>
 8001374:	6823      	ldr	r3, [r4, #0]
 8001376:	2e00      	cmp	r6, #0
 8001378:	d002      	beq.n	8001380 <USART_Cmd+0x58>
 800137a:	431d      	orrs	r5, r3
 800137c:	6025      	str	r5, [r4, #0]
 800137e:	e001      	b.n	8001384 <USART_Cmd+0x5c>
 8001380:	43ab      	bics	r3, r5
 8001382:	6023      	str	r3, [r4, #0]
 8001384:	bd70      	pop	{r4, r5, r6, pc}
 8001386:	46c0      	nop			; (mov r8, r8)
 8001388:	40013800 	.word	0x40013800
 800138c:	40004400 	.word	0x40004400
 8001390:	40004800 	.word	0x40004800
 8001394:	40004c00 	.word	0x40004c00
 8001398:	40005000 	.word	0x40005000
 800139c:	40011400 	.word	0x40011400
 80013a0:	40011800 	.word	0x40011800
 80013a4:	bffee400 	.word	0xbffee400

080013a8 <USART_ReceiveData>:
 80013a8:	4b11      	ldr	r3, [pc, #68]	; (80013f0 <USART_ReceiveData+0x48>)
 80013aa:	b510      	push	{r4, lr}
 80013ac:	1e04      	subs	r4, r0, #0
 80013ae:	429c      	cmp	r4, r3
 80013b0:	d016      	beq.n	80013e0 <USART_ReceiveData+0x38>
 80013b2:	4b10      	ldr	r3, [pc, #64]	; (80013f4 <USART_ReceiveData+0x4c>)
 80013b4:	4298      	cmp	r0, r3
 80013b6:	d013      	beq.n	80013e0 <USART_ReceiveData+0x38>
 80013b8:	4b0f      	ldr	r3, [pc, #60]	; (80013f8 <USART_ReceiveData+0x50>)
 80013ba:	4298      	cmp	r0, r3
 80013bc:	d010      	beq.n	80013e0 <USART_ReceiveData+0x38>
 80013be:	4b0f      	ldr	r3, [pc, #60]	; (80013fc <USART_ReceiveData+0x54>)
 80013c0:	4298      	cmp	r0, r3
 80013c2:	d00d      	beq.n	80013e0 <USART_ReceiveData+0x38>
 80013c4:	4b0e      	ldr	r3, [pc, #56]	; (8001400 <USART_ReceiveData+0x58>)
 80013c6:	4298      	cmp	r0, r3
 80013c8:	d00a      	beq.n	80013e0 <USART_ReceiveData+0x38>
 80013ca:	4b0e      	ldr	r3, [pc, #56]	; (8001404 <USART_ReceiveData+0x5c>)
 80013cc:	4298      	cmp	r0, r3
 80013ce:	d007      	beq.n	80013e0 <USART_ReceiveData+0x38>
 80013d0:	4b0d      	ldr	r3, [pc, #52]	; (8001408 <USART_ReceiveData+0x60>)
 80013d2:	4298      	cmp	r0, r3
 80013d4:	d004      	beq.n	80013e0 <USART_ReceiveData+0x38>
 80013d6:	4b0d      	ldr	r3, [pc, #52]	; (800140c <USART_ReceiveData+0x64>)
 80013d8:	18c0      	adds	r0, r0, r3
 80013da:	4243      	negs	r3, r0
 80013dc:	4158      	adcs	r0, r3
 80013de:	e000      	b.n	80013e2 <USART_ReceiveData+0x3a>
 80013e0:	2001      	movs	r0, #1
 80013e2:	f7ff fb4f 	bl	8000a84 <assert_param>
 80013e6:	6a60      	ldr	r0, [r4, #36]	; 0x24
 80013e8:	05c0      	lsls	r0, r0, #23
 80013ea:	0dc0      	lsrs	r0, r0, #23
 80013ec:	bd10      	pop	{r4, pc}
 80013ee:	46c0      	nop			; (mov r8, r8)
 80013f0:	40013800 	.word	0x40013800
 80013f4:	40004400 	.word	0x40004400
 80013f8:	40004800 	.word	0x40004800
 80013fc:	40004c00 	.word	0x40004c00
 8001400:	40005000 	.word	0x40005000
 8001404:	40011400 	.word	0x40011400
 8001408:	40011800 	.word	0x40011800
 800140c:	bffee400 	.word	0xbffee400

08001410 <USART_GetITStatus>:
 8001410:	b538      	push	{r3, r4, r5, lr}
 8001412:	4b36      	ldr	r3, [pc, #216]	; (80014ec <USART_GetITStatus+0xdc>)
 8001414:	1c05      	adds	r5, r0, #0
 8001416:	1c0c      	adds	r4, r1, #0
 8001418:	4298      	cmp	r0, r3
 800141a:	d016      	beq.n	800144a <USART_GetITStatus+0x3a>
 800141c:	4b34      	ldr	r3, [pc, #208]	; (80014f0 <USART_GetITStatus+0xe0>)
 800141e:	4298      	cmp	r0, r3
 8001420:	d013      	beq.n	800144a <USART_GetITStatus+0x3a>
 8001422:	4b34      	ldr	r3, [pc, #208]	; (80014f4 <USART_GetITStatus+0xe4>)
 8001424:	4298      	cmp	r0, r3
 8001426:	d010      	beq.n	800144a <USART_GetITStatus+0x3a>
 8001428:	4b33      	ldr	r3, [pc, #204]	; (80014f8 <USART_GetITStatus+0xe8>)
 800142a:	4298      	cmp	r0, r3
 800142c:	d00d      	beq.n	800144a <USART_GetITStatus+0x3a>
 800142e:	4b33      	ldr	r3, [pc, #204]	; (80014fc <USART_GetITStatus+0xec>)
 8001430:	4298      	cmp	r0, r3
 8001432:	d00a      	beq.n	800144a <USART_GetITStatus+0x3a>
 8001434:	4b32      	ldr	r3, [pc, #200]	; (8001500 <USART_GetITStatus+0xf0>)
 8001436:	4298      	cmp	r0, r3
 8001438:	d007      	beq.n	800144a <USART_GetITStatus+0x3a>
 800143a:	4b32      	ldr	r3, [pc, #200]	; (8001504 <USART_GetITStatus+0xf4>)
 800143c:	4298      	cmp	r0, r3
 800143e:	d004      	beq.n	800144a <USART_GetITStatus+0x3a>
 8001440:	4a31      	ldr	r2, [pc, #196]	; (8001508 <USART_GetITStatus+0xf8>)
 8001442:	1880      	adds	r0, r0, r2
 8001444:	4243      	negs	r3, r0
 8001446:	4158      	adcs	r0, r3
 8001448:	e000      	b.n	800144c <USART_GetITStatus+0x3c>
 800144a:	2001      	movs	r0, #1
 800144c:	f7ff fb1a 	bl	8000a84 <assert_param>
 8001450:	2384      	movs	r3, #132	; 0x84
 8001452:	005b      	lsls	r3, r3, #1
 8001454:	429c      	cmp	r4, r3
 8001456:	d027      	beq.n	80014a8 <USART_GetITStatus+0x98>
 8001458:	4b2c      	ldr	r3, [pc, #176]	; (800150c <USART_GetITStatus+0xfc>)
 800145a:	429c      	cmp	r4, r3
 800145c:	d024      	beq.n	80014a8 <USART_GetITStatus+0x98>
 800145e:	4b2c      	ldr	r3, [pc, #176]	; (8001510 <USART_GetITStatus+0x100>)
 8001460:	429c      	cmp	r4, r3
 8001462:	d021      	beq.n	80014a8 <USART_GetITStatus+0x98>
 8001464:	4b2b      	ldr	r3, [pc, #172]	; (8001514 <USART_GetITStatus+0x104>)
 8001466:	429c      	cmp	r4, r3
 8001468:	d01e      	beq.n	80014a8 <USART_GetITStatus+0x98>
 800146a:	4b2b      	ldr	r3, [pc, #172]	; (8001518 <USART_GetITStatus+0x108>)
 800146c:	429c      	cmp	r4, r3
 800146e:	d01b      	beq.n	80014a8 <USART_GetITStatus+0x98>
 8001470:	4b2a      	ldr	r3, [pc, #168]	; (800151c <USART_GetITStatus+0x10c>)
 8001472:	429c      	cmp	r4, r3
 8001474:	d018      	beq.n	80014a8 <USART_GetITStatus+0x98>
 8001476:	4b2a      	ldr	r3, [pc, #168]	; (8001520 <USART_GetITStatus+0x110>)
 8001478:	429c      	cmp	r4, r3
 800147a:	d015      	beq.n	80014a8 <USART_GetITStatus+0x98>
 800147c:	4b29      	ldr	r3, [pc, #164]	; (8001524 <USART_GetITStatus+0x114>)
 800147e:	429c      	cmp	r4, r3
 8001480:	d012      	beq.n	80014a8 <USART_GetITStatus+0x98>
 8001482:	4a29      	ldr	r2, [pc, #164]	; (8001528 <USART_GetITStatus+0x118>)
 8001484:	4b29      	ldr	r3, [pc, #164]	; (800152c <USART_GetITStatus+0x11c>)
 8001486:	4022      	ands	r2, r4
 8001488:	429a      	cmp	r2, r3
 800148a:	d00d      	beq.n	80014a8 <USART_GetITStatus+0x98>
 800148c:	4b28      	ldr	r3, [pc, #160]	; (8001530 <USART_GetITStatus+0x120>)
 800148e:	429c      	cmp	r4, r3
 8001490:	d00a      	beq.n	80014a8 <USART_GetITStatus+0x98>
 8001492:	4b28      	ldr	r3, [pc, #160]	; (8001534 <USART_GetITStatus+0x124>)
 8001494:	429c      	cmp	r4, r3
 8001496:	d007      	beq.n	80014a8 <USART_GetITStatus+0x98>
 8001498:	4b27      	ldr	r3, [pc, #156]	; (8001538 <USART_GetITStatus+0x128>)
 800149a:	429c      	cmp	r4, r3
 800149c:	d004      	beq.n	80014a8 <USART_GetITStatus+0x98>
 800149e:	4a27      	ldr	r2, [pc, #156]	; (800153c <USART_GetITStatus+0x12c>)
 80014a0:	18a3      	adds	r3, r4, r2
 80014a2:	4258      	negs	r0, r3
 80014a4:	4158      	adcs	r0, r3
 80014a6:	e000      	b.n	80014aa <USART_GetITStatus+0x9a>
 80014a8:	2001      	movs	r0, #1
 80014aa:	f7ff faeb 	bl	8000a84 <assert_param>
 80014ae:	b2e3      	uxtb	r3, r4
 80014b0:	2101      	movs	r1, #1
 80014b2:	b2a2      	uxth	r2, r4
 80014b4:	4099      	lsls	r1, r3
 80014b6:	0a12      	lsrs	r2, r2, #8
 80014b8:	1c0b      	adds	r3, r1, #0
 80014ba:	2a01      	cmp	r2, #1
 80014bc:	d101      	bne.n	80014c2 <USART_GetITStatus+0xb2>
 80014be:	682a      	ldr	r2, [r5, #0]
 80014c0:	e004      	b.n	80014cc <USART_GetITStatus+0xbc>
 80014c2:	2a02      	cmp	r2, #2
 80014c4:	d101      	bne.n	80014ca <USART_GetITStatus+0xba>
 80014c6:	686a      	ldr	r2, [r5, #4]
 80014c8:	e000      	b.n	80014cc <USART_GetITStatus+0xbc>
 80014ca:	68aa      	ldr	r2, [r5, #8]
 80014cc:	2000      	movs	r0, #0
 80014ce:	4013      	ands	r3, r2
 80014d0:	69ea      	ldr	r2, [r5, #28]
 80014d2:	4283      	cmp	r3, r0
 80014d4:	d008      	beq.n	80014e8 <USART_GetITStatus+0xd8>
 80014d6:	0c24      	lsrs	r4, r4, #16
 80014d8:	2001      	movs	r0, #1
 80014da:	40a0      	lsls	r0, r4
 80014dc:	1c04      	adds	r4, r0, #0
 80014de:	1c10      	adds	r0, r2, #0
 80014e0:	4020      	ands	r0, r4
 80014e2:	1e44      	subs	r4, r0, #1
 80014e4:	41a0      	sbcs	r0, r4
 80014e6:	b2c0      	uxtb	r0, r0
 80014e8:	bd38      	pop	{r3, r4, r5, pc}
 80014ea:	46c0      	nop			; (mov r8, r8)
 80014ec:	40013800 	.word	0x40013800
 80014f0:	40004400 	.word	0x40004400
 80014f4:	40004800 	.word	0x40004800
 80014f8:	40004c00 	.word	0x40004c00
 80014fc:	40005000 	.word	0x40005000
 8001500:	40011400 	.word	0x40011400
 8001504:	40011800 	.word	0x40011800
 8001508:	bffee400 	.word	0xbffee400
 800150c:	00070107 	.word	0x00070107
 8001510:	00060106 	.word	0x00060106
 8001514:	00050105 	.word	0x00050105
 8001518:	00040104 	.word	0x00040104
 800151c:	00080206 	.word	0x00080206
 8001520:	0009030a 	.word	0x0009030a
 8001524:	00020300 	.word	0x00020300
 8001528:	fffdffff 	.word	0xfffdffff
 800152c:	00010300 	.word	0x00010300
 8001530:	000b011a 	.word	0x000b011a
 8001534:	000c011b 	.word	0x000c011b
 8001538:	0011010e 	.word	0x0011010e
 800153c:	ffebfcea 	.word	0xffebfcea

08001540 <USART_ClearITPendingBit>:
 8001540:	b538      	push	{r3, r4, r5, lr}
 8001542:	4b26      	ldr	r3, [pc, #152]	; (80015dc <USART_ClearITPendingBit+0x9c>)
 8001544:	1c05      	adds	r5, r0, #0
 8001546:	1c0c      	adds	r4, r1, #0
 8001548:	4298      	cmp	r0, r3
 800154a:	d016      	beq.n	800157a <USART_ClearITPendingBit+0x3a>
 800154c:	4b24      	ldr	r3, [pc, #144]	; (80015e0 <USART_ClearITPendingBit+0xa0>)
 800154e:	4298      	cmp	r0, r3
 8001550:	d013      	beq.n	800157a <USART_ClearITPendingBit+0x3a>
 8001552:	4b24      	ldr	r3, [pc, #144]	; (80015e4 <USART_ClearITPendingBit+0xa4>)
 8001554:	4298      	cmp	r0, r3
 8001556:	d010      	beq.n	800157a <USART_ClearITPendingBit+0x3a>
 8001558:	4b23      	ldr	r3, [pc, #140]	; (80015e8 <USART_ClearITPendingBit+0xa8>)
 800155a:	4298      	cmp	r0, r3
 800155c:	d00d      	beq.n	800157a <USART_ClearITPendingBit+0x3a>
 800155e:	4b23      	ldr	r3, [pc, #140]	; (80015ec <USART_ClearITPendingBit+0xac>)
 8001560:	4298      	cmp	r0, r3
 8001562:	d00a      	beq.n	800157a <USART_ClearITPendingBit+0x3a>
 8001564:	4b22      	ldr	r3, [pc, #136]	; (80015f0 <USART_ClearITPendingBit+0xb0>)
 8001566:	4298      	cmp	r0, r3
 8001568:	d007      	beq.n	800157a <USART_ClearITPendingBit+0x3a>
 800156a:	4b22      	ldr	r3, [pc, #136]	; (80015f4 <USART_ClearITPendingBit+0xb4>)
 800156c:	4298      	cmp	r0, r3
 800156e:	d004      	beq.n	800157a <USART_ClearITPendingBit+0x3a>
 8001570:	4a21      	ldr	r2, [pc, #132]	; (80015f8 <USART_ClearITPendingBit+0xb8>)
 8001572:	1880      	adds	r0, r0, r2
 8001574:	4243      	negs	r3, r0
 8001576:	4158      	adcs	r0, r3
 8001578:	e000      	b.n	800157c <USART_ClearITPendingBit+0x3c>
 800157a:	2001      	movs	r0, #1
 800157c:	f7ff fa82 	bl	8000a84 <assert_param>
 8001580:	4b1e      	ldr	r3, [pc, #120]	; (80015fc <USART_ClearITPendingBit+0xbc>)
 8001582:	429c      	cmp	r4, r3
 8001584:	d022      	beq.n	80015cc <USART_ClearITPendingBit+0x8c>
 8001586:	2384      	movs	r3, #132	; 0x84
 8001588:	005b      	lsls	r3, r3, #1
 800158a:	429c      	cmp	r4, r3
 800158c:	d01e      	beq.n	80015cc <USART_ClearITPendingBit+0x8c>
 800158e:	4a1c      	ldr	r2, [pc, #112]	; (8001600 <USART_ClearITPendingBit+0xc0>)
 8001590:	4b1c      	ldr	r3, [pc, #112]	; (8001604 <USART_ClearITPendingBit+0xc4>)
 8001592:	4022      	ands	r2, r4
 8001594:	429a      	cmp	r2, r3
 8001596:	d019      	beq.n	80015cc <USART_ClearITPendingBit+0x8c>
 8001598:	4b1b      	ldr	r3, [pc, #108]	; (8001608 <USART_ClearITPendingBit+0xc8>)
 800159a:	429c      	cmp	r4, r3
 800159c:	d016      	beq.n	80015cc <USART_ClearITPendingBit+0x8c>
 800159e:	4b1b      	ldr	r3, [pc, #108]	; (800160c <USART_ClearITPendingBit+0xcc>)
 80015a0:	429c      	cmp	r4, r3
 80015a2:	d013      	beq.n	80015cc <USART_ClearITPendingBit+0x8c>
 80015a4:	4b1a      	ldr	r3, [pc, #104]	; (8001610 <USART_ClearITPendingBit+0xd0>)
 80015a6:	429c      	cmp	r4, r3
 80015a8:	d010      	beq.n	80015cc <USART_ClearITPendingBit+0x8c>
 80015aa:	4b1a      	ldr	r3, [pc, #104]	; (8001614 <USART_ClearITPendingBit+0xd4>)
 80015ac:	429c      	cmp	r4, r3
 80015ae:	d00d      	beq.n	80015cc <USART_ClearITPendingBit+0x8c>
 80015b0:	4b19      	ldr	r3, [pc, #100]	; (8001618 <USART_ClearITPendingBit+0xd8>)
 80015b2:	429c      	cmp	r4, r3
 80015b4:	d00a      	beq.n	80015cc <USART_ClearITPendingBit+0x8c>
 80015b6:	4b19      	ldr	r3, [pc, #100]	; (800161c <USART_ClearITPendingBit+0xdc>)
 80015b8:	429c      	cmp	r4, r3
 80015ba:	d007      	beq.n	80015cc <USART_ClearITPendingBit+0x8c>
 80015bc:	4b18      	ldr	r3, [pc, #96]	; (8001620 <USART_ClearITPendingBit+0xe0>)
 80015be:	429c      	cmp	r4, r3
 80015c0:	d004      	beq.n	80015cc <USART_ClearITPendingBit+0x8c>
 80015c2:	4a18      	ldr	r2, [pc, #96]	; (8001624 <USART_ClearITPendingBit+0xe4>)
 80015c4:	18a3      	adds	r3, r4, r2
 80015c6:	4258      	negs	r0, r3
 80015c8:	4158      	adcs	r0, r3
 80015ca:	e000      	b.n	80015ce <USART_ClearITPendingBit+0x8e>
 80015cc:	2001      	movs	r0, #1
 80015ce:	f7ff fa59 	bl	8000a84 <assert_param>
 80015d2:	0c24      	lsrs	r4, r4, #16
 80015d4:	2301      	movs	r3, #1
 80015d6:	40a3      	lsls	r3, r4
 80015d8:	622b      	str	r3, [r5, #32]
 80015da:	bd38      	pop	{r3, r4, r5, pc}
 80015dc:	40013800 	.word	0x40013800
 80015e0:	40004400 	.word	0x40004400
 80015e4:	40004800 	.word	0x40004800
 80015e8:	40004c00 	.word	0x40004c00
 80015ec:	40005000 	.word	0x40005000
 80015f0:	40011400 	.word	0x40011400
 80015f4:	40011800 	.word	0x40011800
 80015f8:	bffee400 	.word	0xbffee400
 80015fc:	00060106 	.word	0x00060106
 8001600:	fffdffff 	.word	0xfffdffff
 8001604:	00010300 	.word	0x00010300
 8001608:	00020300 	.word	0x00020300
 800160c:	00040104 	.word	0x00040104
 8001610:	00080206 	.word	0x00080206
 8001614:	0009030a 	.word	0x0009030a
 8001618:	000b011a 	.word	0x000b011a
 800161c:	000c011b 	.word	0x000c011b
 8001620:	0011010e 	.word	0x0011010e
 8001624:	ffebfcea 	.word	0xffebfcea

08001628 <ADC_DeInit>:
 8001628:	4b0a      	ldr	r3, [pc, #40]	; (8001654 <ADC_DeInit+0x2c>)
 800162a:	b510      	push	{r4, lr}
 800162c:	18c4      	adds	r4, r0, r3
 800162e:	4263      	negs	r3, r4
 8001630:	415c      	adcs	r4, r3
 8001632:	b2e4      	uxtb	r4, r4
 8001634:	1c20      	adds	r0, r4, #0
 8001636:	f7ff fa25 	bl	8000a84 <assert_param>
 800163a:	2c00      	cmp	r4, #0
 800163c:	d009      	beq.n	8001652 <ADC_DeInit+0x2a>
 800163e:	2080      	movs	r0, #128	; 0x80
 8001640:	0080      	lsls	r0, r0, #2
 8001642:	2101      	movs	r1, #1
 8001644:	f000 faba 	bl	8001bbc <RCC_APB2PeriphResetCmd>
 8001648:	2080      	movs	r0, #128	; 0x80
 800164a:	0080      	lsls	r0, r0, #2
 800164c:	2100      	movs	r1, #0
 800164e:	f000 fab5 	bl	8001bbc <RCC_APB2PeriphResetCmd>
 8001652:	bd10      	pop	{r4, pc}
 8001654:	bffedc00 	.word	0xbffedc00

08001658 <ADC_Init>:
 8001658:	b570      	push	{r4, r5, r6, lr}
 800165a:	1c0c      	adds	r4, r1, #0
 800165c:	4924      	ldr	r1, [pc, #144]	; (80016f0 <ADC_Init+0x98>)
 800165e:	1c05      	adds	r5, r0, #0
 8001660:	1840      	adds	r0, r0, r1
 8001662:	4243      	negs	r3, r0
 8001664:	4158      	adcs	r0, r3
 8001666:	f7ff fa0d 	bl	8000a84 <assert_param>
 800166a:	6820      	ldr	r0, [r4, #0]
 800166c:	2318      	movs	r3, #24
 800166e:	4398      	bics	r0, r3
 8001670:	4243      	negs	r3, r0
 8001672:	4158      	adcs	r0, r3
 8001674:	f7ff fa06 	bl	8000a84 <assert_param>
 8001678:	7923      	ldrb	r3, [r4, #4]
 800167a:	2601      	movs	r6, #1
 800167c:	2000      	movs	r0, #0
 800167e:	429e      	cmp	r6, r3
 8001680:	4140      	adcs	r0, r0
 8001682:	f7ff f9ff 	bl	8000a84 <assert_param>
 8001686:	68a3      	ldr	r3, [r4, #8]
 8001688:	481a      	ldr	r0, [pc, #104]	; (80016f4 <ADC_Init+0x9c>)
 800168a:	4018      	ands	r0, r3
 800168c:	4243      	negs	r3, r0
 800168e:	4158      	adcs	r0, r3
 8001690:	f7ff f9f8 	bl	8000a84 <assert_param>
 8001694:	68e3      	ldr	r3, [r4, #12]
 8001696:	22c0      	movs	r2, #192	; 0xc0
 8001698:	1c19      	adds	r1, r3, #0
 800169a:	4391      	bics	r1, r2
 800169c:	1c30      	adds	r0, r6, #0
 800169e:	2900      	cmp	r1, #0
 80016a0:	d003      	beq.n	80016aa <ADC_Init+0x52>
 80016a2:	1e58      	subs	r0, r3, #1
 80016a4:	38ff      	subs	r0, #255	; 0xff
 80016a6:	4243      	negs	r3, r0
 80016a8:	4158      	adcs	r0, r3
 80016aa:	f7ff f9eb 	bl	8000a84 <assert_param>
 80016ae:	6920      	ldr	r0, [r4, #16]
 80016b0:	2320      	movs	r3, #32
 80016b2:	4398      	bics	r0, r3
 80016b4:	4243      	negs	r3, r0
 80016b6:	4158      	adcs	r0, r3
 80016b8:	f7ff f9e4 	bl	8000a84 <assert_param>
 80016bc:	6960      	ldr	r0, [r4, #20]
 80016be:	2304      	movs	r3, #4
 80016c0:	4398      	bics	r0, r3
 80016c2:	4243      	negs	r3, r0
 80016c4:	4158      	adcs	r0, r3
 80016c6:	f7ff f9dd 	bl	8000a84 <assert_param>
 80016ca:	6823      	ldr	r3, [r4, #0]
 80016cc:	68a2      	ldr	r2, [r4, #8]
 80016ce:	68e9      	ldr	r1, [r5, #12]
 80016d0:	431a      	orrs	r2, r3
 80016d2:	68e3      	ldr	r3, [r4, #12]
 80016d4:	431a      	orrs	r2, r3
 80016d6:	6923      	ldr	r3, [r4, #16]
 80016d8:	431a      	orrs	r2, r3
 80016da:	6963      	ldr	r3, [r4, #20]
 80016dc:	431a      	orrs	r2, r3
 80016de:	4b06      	ldr	r3, [pc, #24]	; (80016f8 <ADC_Init+0xa0>)
 80016e0:	400b      	ands	r3, r1
 80016e2:	4313      	orrs	r3, r2
 80016e4:	7922      	ldrb	r2, [r4, #4]
 80016e6:	0352      	lsls	r2, r2, #13
 80016e8:	4313      	orrs	r3, r2
 80016ea:	60eb      	str	r3, [r5, #12]
 80016ec:	bd70      	pop	{r4, r5, r6, pc}
 80016ee:	46c0      	nop			; (mov r8, r8)
 80016f0:	bffedc00 	.word	0xbffedc00
 80016f4:	fffff3ff 	.word	0xfffff3ff
 80016f8:	ffffd203 	.word	0xffffd203

080016fc <ADC_Cmd>:
 80016fc:	4b0c      	ldr	r3, [pc, #48]	; (8001730 <ADC_Cmd+0x34>)
 80016fe:	b570      	push	{r4, r5, r6, lr}
 8001700:	1c04      	adds	r4, r0, #0
 8001702:	18c0      	adds	r0, r0, r3
 8001704:	4243      	negs	r3, r0
 8001706:	4158      	adcs	r0, r3
 8001708:	1c0e      	adds	r6, r1, #0
 800170a:	2501      	movs	r5, #1
 800170c:	f7ff f9ba 	bl	8000a84 <assert_param>
 8001710:	2000      	movs	r0, #0
 8001712:	42b5      	cmp	r5, r6
 8001714:	4140      	adcs	r0, r0
 8001716:	f7ff f9b5 	bl	8000a84 <assert_param>
 800171a:	68a3      	ldr	r3, [r4, #8]
 800171c:	2e00      	cmp	r6, #0
 800171e:	d002      	beq.n	8001726 <ADC_Cmd+0x2a>
 8001720:	431d      	orrs	r5, r3
 8001722:	60a5      	str	r5, [r4, #8]
 8001724:	e002      	b.n	800172c <ADC_Cmd+0x30>
 8001726:	2202      	movs	r2, #2
 8001728:	4313      	orrs	r3, r2
 800172a:	60a3      	str	r3, [r4, #8]
 800172c:	bd70      	pop	{r4, r5, r6, pc}
 800172e:	46c0      	nop			; (mov r8, r8)
 8001730:	bffedc00 	.word	0xbffedc00

08001734 <ADC_TempSensorCmd>:
 8001734:	2301      	movs	r3, #1
 8001736:	b510      	push	{r4, lr}
 8001738:	1c04      	adds	r4, r0, #0
 800173a:	2000      	movs	r0, #0
 800173c:	42a3      	cmp	r3, r4
 800173e:	4140      	adcs	r0, r0
 8001740:	f7ff f9a0 	bl	8000a84 <assert_param>
 8001744:	4b05      	ldr	r3, [pc, #20]	; (800175c <ADC_TempSensorCmd+0x28>)
 8001746:	6819      	ldr	r1, [r3, #0]
 8001748:	2c00      	cmp	r4, #0
 800174a:	d003      	beq.n	8001754 <ADC_TempSensorCmd+0x20>
 800174c:	2280      	movs	r2, #128	; 0x80
 800174e:	0412      	lsls	r2, r2, #16
 8001750:	430a      	orrs	r2, r1
 8001752:	e001      	b.n	8001758 <ADC_TempSensorCmd+0x24>
 8001754:	4a02      	ldr	r2, [pc, #8]	; (8001760 <ADC_TempSensorCmd+0x2c>)
 8001756:	400a      	ands	r2, r1
 8001758:	601a      	str	r2, [r3, #0]
 800175a:	bd10      	pop	{r4, pc}
 800175c:	40012708 	.word	0x40012708
 8001760:	ff7fffff 	.word	0xff7fffff

08001764 <ADC_ChannelConfig>:
 8001764:	4b0e      	ldr	r3, [pc, #56]	; (80017a0 <ADC_ChannelConfig+0x3c>)
 8001766:	b570      	push	{r4, r5, r6, lr}
 8001768:	1c04      	adds	r4, r0, #0
 800176a:	18c0      	adds	r0, r0, r3
 800176c:	4243      	negs	r3, r0
 800176e:	4158      	adcs	r0, r3
 8001770:	1c0d      	adds	r5, r1, #0
 8001772:	1c16      	adds	r6, r2, #0
 8001774:	f7ff f986 	bl	8000a84 <assert_param>
 8001778:	2000      	movs	r0, #0
 800177a:	4285      	cmp	r5, r0
 800177c:	d002      	beq.n	8001784 <ADC_ChannelConfig+0x20>
 800177e:	0ce8      	lsrs	r0, r5, #19
 8001780:	4243      	negs	r3, r0
 8001782:	4158      	adcs	r0, r3
 8001784:	f7ff f97e 	bl	8000a84 <assert_param>
 8001788:	2307      	movs	r3, #7
 800178a:	2000      	movs	r0, #0
 800178c:	42b3      	cmp	r3, r6
 800178e:	4140      	adcs	r0, r0
 8001790:	f7ff f978 	bl	8000a84 <assert_param>
 8001794:	6aa3      	ldr	r3, [r4, #40]	; 0x28
 8001796:	431d      	orrs	r5, r3
 8001798:	62a5      	str	r5, [r4, #40]	; 0x28
 800179a:	6166      	str	r6, [r4, #20]
 800179c:	bd70      	pop	{r4, r5, r6, pc}
 800179e:	46c0      	nop			; (mov r8, r8)
 80017a0:	bffedc00 	.word	0xbffedc00

080017a4 <ADC_GetCalibrationFactor>:
 80017a4:	4b0e      	ldr	r3, [pc, #56]	; (80017e0 <ADC_GetCalibrationFactor+0x3c>)
 80017a6:	b510      	push	{r4, lr}
 80017a8:	1c04      	adds	r4, r0, #0
 80017aa:	18c0      	adds	r0, r0, r3
 80017ac:	4243      	negs	r3, r0
 80017ae:	4158      	adcs	r0, r3
 80017b0:	f7ff f968 	bl	8000a84 <assert_param>
 80017b4:	68a2      	ldr	r2, [r4, #8]
 80017b6:	2380      	movs	r3, #128	; 0x80
 80017b8:	061b      	lsls	r3, r3, #24
 80017ba:	4313      	orrs	r3, r2
 80017bc:	60a3      	str	r3, [r4, #8]
 80017be:	23f0      	movs	r3, #240	; 0xf0
 80017c0:	021b      	lsls	r3, r3, #8
 80017c2:	68a2      	ldr	r2, [r4, #8]
 80017c4:	3b01      	subs	r3, #1
 80017c6:	0fd2      	lsrs	r2, r2, #31
 80017c8:	07d2      	lsls	r2, r2, #31
 80017ca:	2b00      	cmp	r3, #0
 80017cc:	d001      	beq.n	80017d2 <ADC_GetCalibrationFactor+0x2e>
 80017ce:	2a00      	cmp	r2, #0
 80017d0:	d1f7      	bne.n	80017c2 <ADC_GetCalibrationFactor+0x1e>
 80017d2:	68a3      	ldr	r3, [r4, #8]
 80017d4:	2b00      	cmp	r3, #0
 80017d6:	db01      	blt.n	80017dc <ADC_GetCalibrationFactor+0x38>
 80017d8:	6c20      	ldr	r0, [r4, #64]	; 0x40
 80017da:	e000      	b.n	80017de <ADC_GetCalibrationFactor+0x3a>
 80017dc:	2000      	movs	r0, #0
 80017de:	bd10      	pop	{r4, pc}
 80017e0:	bffedc00 	.word	0xbffedc00

080017e4 <ADC_StartOfConversion>:
 80017e4:	4b06      	ldr	r3, [pc, #24]	; (8001800 <ADC_StartOfConversion+0x1c>)
 80017e6:	b510      	push	{r4, lr}
 80017e8:	1c04      	adds	r4, r0, #0
 80017ea:	18c0      	adds	r0, r0, r3
 80017ec:	4243      	negs	r3, r0
 80017ee:	4158      	adcs	r0, r3
 80017f0:	f7ff f948 	bl	8000a84 <assert_param>
 80017f4:	68a3      	ldr	r3, [r4, #8]
 80017f6:	2204      	movs	r2, #4
 80017f8:	4313      	orrs	r3, r2
 80017fa:	60a3      	str	r3, [r4, #8]
 80017fc:	bd10      	pop	{r4, pc}
 80017fe:	46c0      	nop			; (mov r8, r8)
 8001800:	bffedc00 	.word	0xbffedc00

08001804 <ADC_GetConversionValue>:
 8001804:	4b05      	ldr	r3, [pc, #20]	; (800181c <ADC_GetConversionValue+0x18>)
 8001806:	b510      	push	{r4, lr}
 8001808:	1c04      	adds	r4, r0, #0
 800180a:	18c0      	adds	r0, r0, r3
 800180c:	4243      	negs	r3, r0
 800180e:	4158      	adcs	r0, r3
 8001810:	f7ff f938 	bl	8000a84 <assert_param>
 8001814:	6c20      	ldr	r0, [r4, #64]	; 0x40
 8001816:	b280      	uxth	r0, r0
 8001818:	bd10      	pop	{r4, pc}
 800181a:	46c0      	nop			; (mov r8, r8)
 800181c:	bffedc00 	.word	0xbffedc00

08001820 <ADC_GetFlagStatus>:
 8001820:	4a15      	ldr	r2, [pc, #84]	; (8001878 <ADC_GetFlagStatus+0x58>)
 8001822:	b570      	push	{r4, r5, r6, lr}
 8001824:	1c05      	adds	r5, r0, #0
 8001826:	1880      	adds	r0, r0, r2
 8001828:	1c0c      	adds	r4, r1, #0
 800182a:	4243      	negs	r3, r0
 800182c:	4158      	adcs	r0, r3
 800182e:	4e13      	ldr	r6, [pc, #76]	; (800187c <ADC_GetFlagStatus+0x5c>)
 8001830:	f7ff f928 	bl	8000a84 <assert_param>
 8001834:	1c23      	adds	r3, r4, #0
 8001836:	4033      	ands	r3, r6
 8001838:	1e5a      	subs	r2, r3, #1
 800183a:	2a01      	cmp	r2, #1
 800183c:	d90d      	bls.n	800185a <ADC_GetFlagStatus+0x3a>
 800183e:	2b04      	cmp	r3, #4
 8001840:	d00b      	beq.n	800185a <ADC_GetFlagStatus+0x3a>
 8001842:	2c08      	cmp	r4, #8
 8001844:	d009      	beq.n	800185a <ADC_GetFlagStatus+0x3a>
 8001846:	2c80      	cmp	r4, #128	; 0x80
 8001848:	d007      	beq.n	800185a <ADC_GetFlagStatus+0x3a>
 800184a:	2b10      	cmp	r3, #16
 800184c:	d005      	beq.n	800185a <ADC_GetFlagStatus+0x3a>
 800184e:	22fe      	movs	r2, #254	; 0xfe
 8001850:	05d2      	lsls	r2, r2, #23
 8001852:	18a3      	adds	r3, r4, r2
 8001854:	4258      	negs	r0, r3
 8001856:	4158      	adcs	r0, r3
 8001858:	e000      	b.n	800185c <ADC_GetFlagStatus+0x3c>
 800185a:	2001      	movs	r0, #1
 800185c:	f7ff f912 	bl	8000a84 <assert_param>
 8001860:	01e3      	lsls	r3, r4, #7
 8001862:	d502      	bpl.n	800186a <ADC_GetFlagStatus+0x4a>
 8001864:	68ab      	ldr	r3, [r5, #8]
 8001866:	401e      	ands	r6, r3
 8001868:	e000      	b.n	800186c <ADC_GetFlagStatus+0x4c>
 800186a:	682e      	ldr	r6, [r5, #0]
 800186c:	4026      	ands	r6, r4
 800186e:	1e74      	subs	r4, r6, #1
 8001870:	41a6      	sbcs	r6, r4
 8001872:	b2f0      	uxtb	r0, r6
 8001874:	bd70      	pop	{r4, r5, r6, pc}
 8001876:	46c0      	nop			; (mov r8, r8)
 8001878:	bffedc00 	.word	0xbffedc00
 800187c:	feffffff 	.word	0xfeffffff

08001880 <ADC_ClearFlag>:
 8001880:	b538      	push	{r3, r4, r5, lr}
 8001882:	4b0a      	ldr	r3, [pc, #40]	; (80018ac <ADC_ClearFlag+0x2c>)
 8001884:	1c05      	adds	r5, r0, #0
 8001886:	18c0      	adds	r0, r0, r3
 8001888:	4243      	negs	r3, r0
 800188a:	4158      	adcs	r0, r3
 800188c:	1c0c      	adds	r4, r1, #0
 800188e:	f7ff f8f9 	bl	8000a84 <assert_param>
 8001892:	2000      	movs	r0, #0
 8001894:	4284      	cmp	r4, r0
 8001896:	d004      	beq.n	80018a2 <ADC_ClearFlag+0x22>
 8001898:	239f      	movs	r3, #159	; 0x9f
 800189a:	1c20      	adds	r0, r4, #0
 800189c:	4398      	bics	r0, r3
 800189e:	4243      	negs	r3, r0
 80018a0:	4158      	adcs	r0, r3
 80018a2:	f7ff f8ef 	bl	8000a84 <assert_param>
 80018a6:	602c      	str	r4, [r5, #0]
 80018a8:	bd38      	pop	{r3, r4, r5, pc}
 80018aa:	46c0      	nop			; (mov r8, r8)
 80018ac:	bffedc00 	.word	0xbffedc00

080018b0 <NVIC_Init>:
 80018b0:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
 80018b2:	2500      	movs	r5, #0
 80018b4:	7883      	ldrb	r3, [r0, #2]
 80018b6:	1c04      	adds	r4, r0, #0
 80018b8:	2601      	movs	r6, #1
 80018ba:	1c28      	adds	r0, r5, #0
 80018bc:	429e      	cmp	r6, r3
 80018be:	4168      	adcs	r0, r5
 80018c0:	f7ff f8e0 	bl	8000a84 <assert_param>
 80018c4:	7863      	ldrb	r3, [r4, #1]
 80018c6:	2703      	movs	r7, #3
 80018c8:	1c28      	adds	r0, r5, #0
 80018ca:	429f      	cmp	r7, r3
 80018cc:	4168      	adcs	r0, r5
 80018ce:	f7ff f8d9 	bl	8000a84 <assert_param>
 80018d2:	78a2      	ldrb	r2, [r4, #2]
 80018d4:	7823      	ldrb	r3, [r4, #0]
 80018d6:	42aa      	cmp	r2, r5
 80018d8:	d01a      	beq.n	8001910 <NVIC_Init+0x60>
 80018da:	0899      	lsrs	r1, r3, #2
 80018dc:	4a0f      	ldr	r2, [pc, #60]	; (800191c <NVIC_Init+0x6c>)
 80018de:	0089      	lsls	r1, r1, #2
 80018e0:	1889      	adds	r1, r1, r2
 80018e2:	22c0      	movs	r2, #192	; 0xc0
 80018e4:	0092      	lsls	r2, r2, #2
 80018e6:	401f      	ands	r7, r3
 80018e8:	20ff      	movs	r0, #255	; 0xff
 80018ea:	588d      	ldr	r5, [r1, r2]
 80018ec:	00ff      	lsls	r7, r7, #3
 80018ee:	1c03      	adds	r3, r0, #0
 80018f0:	40bb      	lsls	r3, r7
 80018f2:	439d      	bics	r5, r3
 80018f4:	7863      	ldrb	r3, [r4, #1]
 80018f6:	019b      	lsls	r3, r3, #6
 80018f8:	4018      	ands	r0, r3
 80018fa:	40b8      	lsls	r0, r7
 80018fc:	1c2f      	adds	r7, r5, #0
 80018fe:	4307      	orrs	r7, r0
 8001900:	508f      	str	r7, [r1, r2]
 8001902:	7822      	ldrb	r2, [r4, #0]
 8001904:	231f      	movs	r3, #31
 8001906:	4013      	ands	r3, r2
 8001908:	409e      	lsls	r6, r3
 800190a:	4b04      	ldr	r3, [pc, #16]	; (800191c <NVIC_Init+0x6c>)
 800190c:	601e      	str	r6, [r3, #0]
 800190e:	e004      	b.n	800191a <NVIC_Init+0x6a>
 8001910:	271f      	movs	r7, #31
 8001912:	403b      	ands	r3, r7
 8001914:	4a02      	ldr	r2, [pc, #8]	; (8001920 <NVIC_Init+0x70>)
 8001916:	409e      	lsls	r6, r3
 8001918:	67d6      	str	r6, [r2, #124]	; 0x7c
 800191a:	bdf8      	pop	{r3, r4, r5, r6, r7, pc}
 800191c:	e000e100 	.word	0xe000e100
 8001920:	e000e104 	.word	0xe000e104

08001924 <RCC_ADCCLKConfig>:
 8001924:	4b0e      	ldr	r3, [pc, #56]	; (8001960 <RCC_ADCCLKConfig+0x3c>)
 8001926:	b510      	push	{r4, lr}
 8001928:	1c04      	adds	r4, r0, #0
 800192a:	2001      	movs	r0, #1
 800192c:	421c      	tst	r4, r3
 800192e:	d003      	beq.n	8001938 <RCC_ADCCLKConfig+0x14>
 8001930:	4b0c      	ldr	r3, [pc, #48]	; (8001964 <RCC_ADCCLKConfig+0x40>)
 8001932:	18e0      	adds	r0, r4, r3
 8001934:	4243      	negs	r3, r0
 8001936:	4158      	adcs	r0, r3
 8001938:	f7ff f8a4 	bl	8000a84 <assert_param>
 800193c:	4b0a      	ldr	r3, [pc, #40]	; (8001968 <RCC_ADCCLKConfig+0x44>)
 800193e:	4a0b      	ldr	r2, [pc, #44]	; (800196c <RCC_ADCCLKConfig+0x48>)
 8001940:	6859      	ldr	r1, [r3, #4]
 8001942:	400a      	ands	r2, r1
 8001944:	605a      	str	r2, [r3, #4]
 8001946:	685a      	ldr	r2, [r3, #4]
 8001948:	b2a1      	uxth	r1, r4
 800194a:	430a      	orrs	r2, r1
 800194c:	605a      	str	r2, [r3, #4]
 800194e:	6b19      	ldr	r1, [r3, #48]	; 0x30
 8001950:	4a07      	ldr	r2, [pc, #28]	; (8001970 <RCC_ADCCLKConfig+0x4c>)
 8001952:	0c24      	lsrs	r4, r4, #16
 8001954:	400a      	ands	r2, r1
 8001956:	631a      	str	r2, [r3, #48]	; 0x30
 8001958:	6b1a      	ldr	r2, [r3, #48]	; 0x30
 800195a:	4314      	orrs	r4, r2
 800195c:	631c      	str	r4, [r3, #48]	; 0x30
 800195e:	bd10      	pop	{r4, pc}
 8001960:	feffffff 	.word	0xfeffffff
 8001964:	feffc000 	.word	0xfeffc000
 8001968:	40021000 	.word	0x40021000
 800196c:	ffffbfff 	.word	0xffffbfff
 8001970:	fffffeff 	.word	0xfffffeff

08001974 <RCC_GetClocksFreq>:
 8001974:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
 8001976:	4d5a      	ldr	r5, [pc, #360]	; (8001ae0 <RCC_GetClocksFreq+0x16c>)
 8001978:	1c04      	adds	r4, r0, #0
 800197a:	6868      	ldr	r0, [r5, #4]
 800197c:	230c      	movs	r3, #12
 800197e:	4018      	ands	r0, r3
 8001980:	f000 f9de 	bl	8001d40 <__gnu_thumb1_case_uqi>
 8001984:	1f1f1f1f 	.word	0x1f1f1f1f
 8001988:	1f1f1f1f 	.word	0x1f1f1f1f
 800198c:	1f1f1f07 	.word	0x1f1f1f07
 8001990:	1d          	.byte	0x1d
 8001991:	00          	.byte	0x00
 8001992:	686e      	ldr	r6, [r5, #4]
 8001994:	23c0      	movs	r3, #192	; 0xc0
 8001996:	02b6      	lsls	r6, r6, #10
 8001998:	686a      	ldr	r2, [r5, #4]
 800199a:	0f36      	lsrs	r6, r6, #28
 800199c:	025b      	lsls	r3, r3, #9
 800199e:	3602      	adds	r6, #2
 80019a0:	421a      	tst	r2, r3
 80019a2:	d101      	bne.n	80019a8 <RCC_GetClocksFreq+0x34>
 80019a4:	484f      	ldr	r0, [pc, #316]	; (8001ae4 <RCC_GetClocksFreq+0x170>)
 80019a6:	e007      	b.n	80019b8 <RCC_GetClocksFreq+0x44>
 80019a8:	4b4d      	ldr	r3, [pc, #308]	; (8001ae0 <RCC_GetClocksFreq+0x16c>)
 80019aa:	484f      	ldr	r0, [pc, #316]	; (8001ae8 <RCC_GetClocksFreq+0x174>)
 80019ac:	6ad9      	ldr	r1, [r3, #44]	; 0x2c
 80019ae:	230f      	movs	r3, #15
 80019b0:	4019      	ands	r1, r3
 80019b2:	3101      	adds	r1, #1
 80019b4:	f000 f9ce 	bl	8001d54 <__aeabi_uidiv>
 80019b8:	4370      	muls	r0, r6
 80019ba:	6020      	str	r0, [r4, #0]
 80019bc:	e004      	b.n	80019c8 <RCC_GetClocksFreq+0x54>
 80019be:	4b4b      	ldr	r3, [pc, #300]	; (8001aec <RCC_GetClocksFreq+0x178>)
 80019c0:	e000      	b.n	80019c4 <RCC_GetClocksFreq+0x50>
 80019c2:	4b49      	ldr	r3, [pc, #292]	; (8001ae8 <RCC_GetClocksFreq+0x174>)
 80019c4:	6023      	str	r3, [r4, #0]
 80019c6:	2000      	movs	r0, #0
 80019c8:	686b      	ldr	r3, [r5, #4]
 80019ca:	4a49      	ldr	r2, [pc, #292]	; (8001af0 <RCC_GetClocksFreq+0x17c>)
 80019cc:	061b      	lsls	r3, r3, #24
 80019ce:	0f1b      	lsrs	r3, r3, #28
 80019d0:	6821      	ldr	r1, [r4, #0]
 80019d2:	5cd3      	ldrb	r3, [r2, r3]
 80019d4:	1c0e      	adds	r6, r1, #0
 80019d6:	40de      	lsrs	r6, r3
 80019d8:	6066      	str	r6, [r4, #4]
 80019da:	1c33      	adds	r3, r6, #0
 80019dc:	686e      	ldr	r6, [r5, #4]
 80019de:	0576      	lsls	r6, r6, #21
 80019e0:	0f76      	lsrs	r6, r6, #29
 80019e2:	5d92      	ldrb	r2, [r2, r6]
 80019e4:	40d3      	lsrs	r3, r2
 80019e6:	60a3      	str	r3, [r4, #8]
 80019e8:	6b2a      	ldr	r2, [r5, #48]	; 0x30
 80019ea:	05d6      	lsls	r6, r2, #23
 80019ec:	d401      	bmi.n	80019f2 <RCC_GetClocksFreq+0x7e>
 80019ee:	4a41      	ldr	r2, [pc, #260]	; (8001af4 <RCC_GetClocksFreq+0x180>)
 80019f0:	e006      	b.n	8001a00 <RCC_GetClocksFreq+0x8c>
 80019f2:	4a3b      	ldr	r2, [pc, #236]	; (8001ae0 <RCC_GetClocksFreq+0x16c>)
 80019f4:	6852      	ldr	r2, [r2, #4]
 80019f6:	0456      	lsls	r6, r2, #17
 80019f8:	d401      	bmi.n	80019fe <RCC_GetClocksFreq+0x8a>
 80019fa:	085a      	lsrs	r2, r3, #1
 80019fc:	e000      	b.n	8001a00 <RCC_GetClocksFreq+0x8c>
 80019fe:	089a      	lsrs	r2, r3, #2
 8001a00:	60e2      	str	r2, [r4, #12]
 8001a02:	6b2a      	ldr	r2, [r5, #48]	; 0x30
 8001a04:	0656      	lsls	r6, r2, #25
 8001a06:	d401      	bmi.n	8001a0c <RCC_GetClocksFreq+0x98>
 8001a08:	4a3b      	ldr	r2, [pc, #236]	; (8001af8 <RCC_GetClocksFreq+0x184>)
 8001a0a:	e001      	b.n	8001a10 <RCC_GetClocksFreq+0x9c>
 8001a0c:	2280      	movs	r2, #128	; 0x80
 8001a0e:	0212      	lsls	r2, r2, #8
 8001a10:	6122      	str	r2, [r4, #16]
 8001a12:	6b2a      	ldr	r2, [r5, #48]	; 0x30
 8001a14:	06d6      	lsls	r6, r2, #27
 8001a16:	d402      	bmi.n	8001a1e <RCC_GetClocksFreq+0xaa>
 8001a18:	4a33      	ldr	r2, [pc, #204]	; (8001ae8 <RCC_GetClocksFreq+0x174>)
 8001a1a:	6162      	str	r2, [r4, #20]
 8001a1c:	e000      	b.n	8001a20 <RCC_GetClocksFreq+0xac>
 8001a1e:	6161      	str	r1, [r4, #20]
 8001a20:	6b2f      	ldr	r7, [r5, #48]	; 0x30
 8001a22:	2203      	movs	r2, #3
 8001a24:	4e2e      	ldr	r6, [pc, #184]	; (8001ae0 <RCC_GetClocksFreq+0x16c>)
 8001a26:	4217      	tst	r7, r2
 8001a28:	d101      	bne.n	8001a2e <RCC_GetClocksFreq+0xba>
 8001a2a:	61a3      	str	r3, [r4, #24]
 8001a2c:	e012      	b.n	8001a54 <RCC_GetClocksFreq+0xe0>
 8001a2e:	6b37      	ldr	r7, [r6, #48]	; 0x30
 8001a30:	4017      	ands	r7, r2
 8001a32:	2f01      	cmp	r7, #1
 8001a34:	d101      	bne.n	8001a3a <RCC_GetClocksFreq+0xc6>
 8001a36:	61a1      	str	r1, [r4, #24]
 8001a38:	e00c      	b.n	8001a54 <RCC_GetClocksFreq+0xe0>
 8001a3a:	6b37      	ldr	r7, [r6, #48]	; 0x30
 8001a3c:	4017      	ands	r7, r2
 8001a3e:	2f02      	cmp	r7, #2
 8001a40:	d102      	bne.n	8001a48 <RCC_GetClocksFreq+0xd4>
 8001a42:	2280      	movs	r2, #128	; 0x80
 8001a44:	0212      	lsls	r2, r2, #8
 8001a46:	e004      	b.n	8001a52 <RCC_GetClocksFreq+0xde>
 8001a48:	6b36      	ldr	r6, [r6, #48]	; 0x30
 8001a4a:	4032      	ands	r2, r6
 8001a4c:	2a03      	cmp	r2, #3
 8001a4e:	d101      	bne.n	8001a54 <RCC_GetClocksFreq+0xe0>
 8001a50:	4a25      	ldr	r2, [pc, #148]	; (8001ae8 <RCC_GetClocksFreq+0x174>)
 8001a52:	61a2      	str	r2, [r4, #24]
 8001a54:	22c0      	movs	r2, #192	; 0xc0
 8001a56:	6b2f      	ldr	r7, [r5, #48]	; 0x30
 8001a58:	0292      	lsls	r2, r2, #10
 8001a5a:	4e21      	ldr	r6, [pc, #132]	; (8001ae0 <RCC_GetClocksFreq+0x16c>)
 8001a5c:	4217      	tst	r7, r2
 8001a5e:	d101      	bne.n	8001a64 <RCC_GetClocksFreq+0xf0>
 8001a60:	61e3      	str	r3, [r4, #28]
 8001a62:	e018      	b.n	8001a96 <RCC_GetClocksFreq+0x122>
 8001a64:	6b37      	ldr	r7, [r6, #48]	; 0x30
 8001a66:	4017      	ands	r7, r2
 8001a68:	46bc      	mov	ip, r7
 8001a6a:	2780      	movs	r7, #128	; 0x80
 8001a6c:	027f      	lsls	r7, r7, #9
 8001a6e:	45bc      	cmp	ip, r7
 8001a70:	d101      	bne.n	8001a76 <RCC_GetClocksFreq+0x102>
 8001a72:	61e1      	str	r1, [r4, #28]
 8001a74:	e00f      	b.n	8001a96 <RCC_GetClocksFreq+0x122>
 8001a76:	6b37      	ldr	r7, [r6, #48]	; 0x30
 8001a78:	4017      	ands	r7, r2
 8001a7a:	46bc      	mov	ip, r7
 8001a7c:	2780      	movs	r7, #128	; 0x80
 8001a7e:	02bf      	lsls	r7, r7, #10
 8001a80:	45bc      	cmp	ip, r7
 8001a82:	d102      	bne.n	8001a8a <RCC_GetClocksFreq+0x116>
 8001a84:	2280      	movs	r2, #128	; 0x80
 8001a86:	0212      	lsls	r2, r2, #8
 8001a88:	e004      	b.n	8001a94 <RCC_GetClocksFreq+0x120>
 8001a8a:	6b36      	ldr	r6, [r6, #48]	; 0x30
 8001a8c:	4016      	ands	r6, r2
 8001a8e:	4296      	cmp	r6, r2
 8001a90:	d101      	bne.n	8001a96 <RCC_GetClocksFreq+0x122>
 8001a92:	4a15      	ldr	r2, [pc, #84]	; (8001ae8 <RCC_GetClocksFreq+0x174>)
 8001a94:	61e2      	str	r2, [r4, #28]
 8001a96:	22c0      	movs	r2, #192	; 0xc0
 8001a98:	6b2f      	ldr	r7, [r5, #48]	; 0x30
 8001a9a:	0312      	lsls	r2, r2, #12
 8001a9c:	4e10      	ldr	r6, [pc, #64]	; (8001ae0 <RCC_GetClocksFreq+0x16c>)
 8001a9e:	4217      	tst	r7, r2
 8001aa0:	d015      	beq.n	8001ace <RCC_GetClocksFreq+0x15a>
 8001aa2:	6b37      	ldr	r7, [r6, #48]	; 0x30
 8001aa4:	2380      	movs	r3, #128	; 0x80
 8001aa6:	4017      	ands	r7, r2
 8001aa8:	02db      	lsls	r3, r3, #11
 8001aaa:	429f      	cmp	r7, r3
 8001aac:	d101      	bne.n	8001ab2 <RCC_GetClocksFreq+0x13e>
 8001aae:	6221      	str	r1, [r4, #32]
 8001ab0:	e00e      	b.n	8001ad0 <RCC_GetClocksFreq+0x15c>
 8001ab2:	6b31      	ldr	r1, [r6, #48]	; 0x30
 8001ab4:	2380      	movs	r3, #128	; 0x80
 8001ab6:	4011      	ands	r1, r2
 8001ab8:	031b      	lsls	r3, r3, #12
 8001aba:	4299      	cmp	r1, r3
 8001abc:	d102      	bne.n	8001ac4 <RCC_GetClocksFreq+0x150>
 8001abe:	2380      	movs	r3, #128	; 0x80
 8001ac0:	021b      	lsls	r3, r3, #8
 8001ac2:	e004      	b.n	8001ace <RCC_GetClocksFreq+0x15a>
 8001ac4:	6b33      	ldr	r3, [r6, #48]	; 0x30
 8001ac6:	4013      	ands	r3, r2
 8001ac8:	4293      	cmp	r3, r2
 8001aca:	d101      	bne.n	8001ad0 <RCC_GetClocksFreq+0x15c>
 8001acc:	4b06      	ldr	r3, [pc, #24]	; (8001ae8 <RCC_GetClocksFreq+0x174>)
 8001ace:	6223      	str	r3, [r4, #32]
 8001ad0:	6b2b      	ldr	r3, [r5, #48]	; 0x30
 8001ad2:	061a      	lsls	r2, r3, #24
 8001ad4:	d402      	bmi.n	8001adc <RCC_GetClocksFreq+0x168>
 8001ad6:	4b05      	ldr	r3, [pc, #20]	; (8001aec <RCC_GetClocksFreq+0x178>)
 8001ad8:	6263      	str	r3, [r4, #36]	; 0x24
 8001ada:	e000      	b.n	8001ade <RCC_GetClocksFreq+0x16a>
 8001adc:	6260      	str	r0, [r4, #36]	; 0x24
 8001ade:	bdf8      	pop	{r3, r4, r5, r6, r7, pc}
 8001ae0:	40021000 	.word	0x40021000
 8001ae4:	003d0900 	.word	0x003d0900
 8001ae8:	007a1200 	.word	0x007a1200
 8001aec:	02dc6c00 	.word	0x02dc6c00
 8001af0:	20000000 	.word	0x20000000
 8001af4:	00d59f80 	.word	0x00d59f80
 8001af8:	00008012 	.word	0x00008012

08001afc <RCC_AHBPeriphClockCmd>:
 8001afc:	b538      	push	{r3, r4, r5, lr}
 8001afe:	4b0d      	ldr	r3, [pc, #52]	; (8001b34 <RCC_AHBPeriphClockCmd+0x38>)
 8001b00:	1c04      	adds	r4, r0, #0
 8001b02:	1c0d      	adds	r5, r1, #0
 8001b04:	2000      	movs	r0, #0
 8001b06:	421c      	tst	r4, r3
 8001b08:	d102      	bne.n	8001b10 <RCC_AHBPeriphClockCmd+0x14>
 8001b0a:	1c20      	adds	r0, r4, #0
 8001b0c:	1e43      	subs	r3, r0, #1
 8001b0e:	4198      	sbcs	r0, r3
 8001b10:	f7fe ffb8 	bl	8000a84 <assert_param>
 8001b14:	2301      	movs	r3, #1
 8001b16:	2000      	movs	r0, #0
 8001b18:	42ab      	cmp	r3, r5
 8001b1a:	4140      	adcs	r0, r0
 8001b1c:	f7fe ffb2 	bl	8000a84 <assert_param>
 8001b20:	4b05      	ldr	r3, [pc, #20]	; (8001b38 <RCC_AHBPeriphClockCmd+0x3c>)
 8001b22:	695a      	ldr	r2, [r3, #20]
 8001b24:	2d00      	cmp	r5, #0
 8001b26:	d002      	beq.n	8001b2e <RCC_AHBPeriphClockCmd+0x32>
 8001b28:	4314      	orrs	r4, r2
 8001b2a:	615c      	str	r4, [r3, #20]
 8001b2c:	e001      	b.n	8001b32 <RCC_AHBPeriphClockCmd+0x36>
 8001b2e:	43a2      	bics	r2, r4
 8001b30:	615a      	str	r2, [r3, #20]
 8001b32:	bd38      	pop	{r3, r4, r5, pc}
 8001b34:	fe81ffa8 	.word	0xfe81ffa8
 8001b38:	40021000 	.word	0x40021000

08001b3c <RCC_APB2PeriphClockCmd>:
 8001b3c:	b538      	push	{r3, r4, r5, lr}
 8001b3e:	4b0d      	ldr	r3, [pc, #52]	; (8001b74 <RCC_APB2PeriphClockCmd+0x38>)
 8001b40:	1c04      	adds	r4, r0, #0
 8001b42:	1c0d      	adds	r5, r1, #0
 8001b44:	2000      	movs	r0, #0
 8001b46:	421c      	tst	r4, r3
 8001b48:	d102      	bne.n	8001b50 <RCC_APB2PeriphClockCmd+0x14>
 8001b4a:	1c20      	adds	r0, r4, #0
 8001b4c:	1e43      	subs	r3, r0, #1
 8001b4e:	4198      	sbcs	r0, r3
 8001b50:	f7fe ff98 	bl	8000a84 <assert_param>
 8001b54:	2301      	movs	r3, #1
 8001b56:	2000      	movs	r0, #0
 8001b58:	42ab      	cmp	r3, r5
 8001b5a:	4140      	adcs	r0, r0
 8001b5c:	f7fe ff92 	bl	8000a84 <assert_param>
 8001b60:	4b05      	ldr	r3, [pc, #20]	; (8001b78 <RCC_APB2PeriphClockCmd+0x3c>)
 8001b62:	699a      	ldr	r2, [r3, #24]
 8001b64:	2d00      	cmp	r5, #0
 8001b66:	d002      	beq.n	8001b6e <RCC_APB2PeriphClockCmd+0x32>
 8001b68:	4314      	orrs	r4, r2
 8001b6a:	619c      	str	r4, [r3, #24]
 8001b6c:	e001      	b.n	8001b72 <RCC_APB2PeriphClockCmd+0x36>
 8001b6e:	43a2      	bics	r2, r4
 8001b70:	619a      	str	r2, [r3, #24]
 8001b72:	bd38      	pop	{r3, r4, r5, pc}
 8001b74:	ffb8a51e 	.word	0xffb8a51e
 8001b78:	40021000 	.word	0x40021000

08001b7c <RCC_APB1PeriphClockCmd>:
 8001b7c:	b538      	push	{r3, r4, r5, lr}
 8001b7e:	4b0d      	ldr	r3, [pc, #52]	; (8001bb4 <RCC_APB1PeriphClockCmd+0x38>)
 8001b80:	1c04      	adds	r4, r0, #0
 8001b82:	1c0d      	adds	r5, r1, #0
 8001b84:	2000      	movs	r0, #0
 8001b86:	421c      	tst	r4, r3
 8001b88:	d102      	bne.n	8001b90 <RCC_APB1PeriphClockCmd+0x14>
 8001b8a:	1c20      	adds	r0, r4, #0
 8001b8c:	1e43      	subs	r3, r0, #1
 8001b8e:	4198      	sbcs	r0, r3
 8001b90:	f7fe ff78 	bl	8000a84 <assert_param>
 8001b94:	2301      	movs	r3, #1
 8001b96:	2000      	movs	r0, #0
 8001b98:	42ab      	cmp	r3, r5
 8001b9a:	4140      	adcs	r0, r0
 8001b9c:	f7fe ff72 	bl	8000a84 <assert_param>
 8001ba0:	4b05      	ldr	r3, [pc, #20]	; (8001bb8 <RCC_APB1PeriphClockCmd+0x3c>)
 8001ba2:	69da      	ldr	r2, [r3, #28]
 8001ba4:	2d00      	cmp	r5, #0
 8001ba6:	d002      	beq.n	8001bae <RCC_APB1PeriphClockCmd+0x32>
 8001ba8:	4314      	orrs	r4, r2
 8001baa:	61dc      	str	r4, [r3, #28]
 8001bac:	e001      	b.n	8001bb2 <RCC_APB1PeriphClockCmd+0x36>
 8001bae:	43a2      	bics	r2, r4
 8001bb0:	61da      	str	r2, [r3, #28]
 8001bb2:	bd38      	pop	{r3, r4, r5, pc}
 8001bb4:	8581b6cc 	.word	0x8581b6cc
 8001bb8:	40021000 	.word	0x40021000

08001bbc <RCC_APB2PeriphResetCmd>:
 8001bbc:	b538      	push	{r3, r4, r5, lr}
 8001bbe:	4b0d      	ldr	r3, [pc, #52]	; (8001bf4 <RCC_APB2PeriphResetCmd+0x38>)
 8001bc0:	1c04      	adds	r4, r0, #0
 8001bc2:	1c0d      	adds	r5, r1, #0
 8001bc4:	2000      	movs	r0, #0
 8001bc6:	421c      	tst	r4, r3
 8001bc8:	d102      	bne.n	8001bd0 <RCC_APB2PeriphResetCmd+0x14>
 8001bca:	1c20      	adds	r0, r4, #0
 8001bcc:	1e43      	subs	r3, r0, #1
 8001bce:	4198      	sbcs	r0, r3
 8001bd0:	f7fe ff58 	bl	8000a84 <assert_param>
 8001bd4:	2301      	movs	r3, #1
 8001bd6:	2000      	movs	r0, #0
 8001bd8:	42ab      	cmp	r3, r5
 8001bda:	4140      	adcs	r0, r0
 8001bdc:	f7fe ff52 	bl	8000a84 <assert_param>
 8001be0:	4b05      	ldr	r3, [pc, #20]	; (8001bf8 <RCC_APB2PeriphResetCmd+0x3c>)
 8001be2:	68da      	ldr	r2, [r3, #12]
 8001be4:	2d00      	cmp	r5, #0
 8001be6:	d002      	beq.n	8001bee <RCC_APB2PeriphResetCmd+0x32>
 8001be8:	4314      	orrs	r4, r2
 8001bea:	60dc      	str	r4, [r3, #12]
 8001bec:	e001      	b.n	8001bf2 <RCC_APB2PeriphResetCmd+0x36>
 8001bee:	43a2      	bics	r2, r4
 8001bf0:	60da      	str	r2, [r3, #12]
 8001bf2:	bd38      	pop	{r3, r4, r5, pc}
 8001bf4:	ffb8a51e 	.word	0xffb8a51e
 8001bf8:	40021000 	.word	0x40021000

08001bfc <gpio_init>:
 8001bfc:	b5f7      	push	{r0, r1, r2, r4, r5, r6, r7, lr}
 8001bfe:	2080      	movs	r0, #128	; 0x80
 8001c00:	0280      	lsls	r0, r0, #10
 8001c02:	2101      	movs	r1, #1
 8001c04:	f7ff ff7a 	bl	8001afc <RCC_AHBPeriphClockCmd>
 8001c08:	2080      	movs	r0, #128	; 0x80
 8001c0a:	02c0      	lsls	r0, r0, #11
 8001c0c:	2101      	movs	r1, #1
 8001c0e:	f7ff ff75 	bl	8001afc <RCC_AHBPeriphClockCmd>
 8001c12:	2208      	movs	r2, #8
 8001c14:	2400      	movs	r4, #0
 8001c16:	466b      	mov	r3, sp
 8001c18:	2603      	movs	r6, #3
 8001c1a:	9200      	str	r2, [sp, #0]
 8001c1c:	4669      	mov	r1, sp
 8001c1e:	2201      	movs	r2, #1
 8001c20:	481c      	ldr	r0, [pc, #112]	; (8001c94 <gpio_init+0x98>)
 8001c22:	715e      	strb	r6, [r3, #5]
 8001c24:	711a      	strb	r2, [r3, #4]
 8001c26:	719c      	strb	r4, [r3, #6]
 8001c28:	71dc      	strb	r4, [r3, #7]
 8001c2a:	2590      	movs	r5, #144	; 0x90
 8001c2c:	f7ff f8ce 	bl	8000dcc <GPIO_Init>
 8001c30:	2380      	movs	r3, #128	; 0x80
 8001c32:	05ed      	lsls	r5, r5, #23
 8001c34:	005b      	lsls	r3, r3, #1
 8001c36:	466a      	mov	r2, sp
 8001c38:	1c28      	adds	r0, r5, #0
 8001c3a:	9300      	str	r3, [sp, #0]
 8001c3c:	4669      	mov	r1, sp
 8001c3e:	2301      	movs	r3, #1
 8001c40:	2780      	movs	r7, #128	; 0x80
 8001c42:	7156      	strb	r6, [r2, #5]
 8001c44:	013f      	lsls	r7, r7, #4
 8001c46:	7113      	strb	r3, [r2, #4]
 8001c48:	7194      	strb	r4, [r2, #6]
 8001c4a:	71d4      	strb	r4, [r2, #7]
 8001c4c:	f7ff f8be 	bl	8000dcc <GPIO_Init>
 8001c50:	466a      	mov	r2, sp
 8001c52:	1c28      	adds	r0, r5, #0
 8001c54:	2301      	movs	r3, #1
 8001c56:	4669      	mov	r1, sp
 8001c58:	7156      	strb	r6, [r2, #5]
 8001c5a:	9700      	str	r7, [sp, #0]
 8001c5c:	7113      	strb	r3, [r2, #4]
 8001c5e:	7194      	strb	r4, [r2, #6]
 8001c60:	71d4      	strb	r4, [r2, #7]
 8001c62:	f7ff f8b3 	bl	8000dcc <GPIO_Init>
 8001c66:	2202      	movs	r2, #2
 8001c68:	466b      	mov	r3, sp
 8001c6a:	9200      	str	r2, [sp, #0]
 8001c6c:	1c28      	adds	r0, r5, #0
 8001c6e:	2201      	movs	r2, #1
 8001c70:	4669      	mov	r1, sp
 8001c72:	715e      	strb	r6, [r3, #5]
 8001c74:	711a      	strb	r2, [r3, #4]
 8001c76:	719c      	strb	r4, [r3, #6]
 8001c78:	71dc      	strb	r4, [r3, #7]
 8001c7a:	f7ff f8a7 	bl	8000dcc <GPIO_Init>
 8001c7e:	4b05      	ldr	r3, [pc, #20]	; (8001c94 <gpio_init+0x98>)
 8001c80:	2208      	movs	r2, #8
 8001c82:	851a      	strh	r2, [r3, #40]	; 0x28
 8001c84:	2380      	movs	r3, #128	; 0x80
 8001c86:	005b      	lsls	r3, r3, #1
 8001c88:	2202      	movs	r2, #2
 8001c8a:	852b      	strh	r3, [r5, #40]	; 0x28
 8001c8c:	852f      	strh	r7, [r5, #40]	; 0x28
 8001c8e:	852a      	strh	r2, [r5, #40]	; 0x28
 8001c90:	bdf7      	pop	{r0, r1, r2, r4, r5, r6, r7, pc}
 8001c92:	46c0      	nop			; (mov r8, r8)
 8001c94:	48000400 	.word	0x48000400

08001c98 <led_on>:
 8001c98:	2808      	cmp	r0, #8
 8001c9a:	d101      	bne.n	8001ca0 <led_on+0x8>
 8001c9c:	4b07      	ldr	r3, [pc, #28]	; (8001cbc <led_on+0x24>)
 8001c9e:	e00b      	b.n	8001cb8 <led_on+0x20>
 8001ca0:	2380      	movs	r3, #128	; 0x80
 8001ca2:	005b      	lsls	r3, r3, #1
 8001ca4:	4298      	cmp	r0, r3
 8001ca6:	d005      	beq.n	8001cb4 <led_on+0x1c>
 8001ca8:	2380      	movs	r3, #128	; 0x80
 8001caa:	011b      	lsls	r3, r3, #4
 8001cac:	4298      	cmp	r0, r3
 8001cae:	d001      	beq.n	8001cb4 <led_on+0x1c>
 8001cb0:	2802      	cmp	r0, #2
 8001cb2:	d102      	bne.n	8001cba <led_on+0x22>
 8001cb4:	2390      	movs	r3, #144	; 0x90
 8001cb6:	05db      	lsls	r3, r3, #23
 8001cb8:	6198      	str	r0, [r3, #24]
 8001cba:	4770      	bx	lr
 8001cbc:	48000400 	.word	0x48000400

08001cc0 <led_off>:
 8001cc0:	2808      	cmp	r0, #8
 8001cc2:	d101      	bne.n	8001cc8 <led_off+0x8>
 8001cc4:	4b07      	ldr	r3, [pc, #28]	; (8001ce4 <led_off+0x24>)
 8001cc6:	e00b      	b.n	8001ce0 <led_off+0x20>
 8001cc8:	2380      	movs	r3, #128	; 0x80
 8001cca:	005b      	lsls	r3, r3, #1
 8001ccc:	4298      	cmp	r0, r3
 8001cce:	d005      	beq.n	8001cdc <led_off+0x1c>
 8001cd0:	2380      	movs	r3, #128	; 0x80
 8001cd2:	011b      	lsls	r3, r3, #4
 8001cd4:	4298      	cmp	r0, r3
 8001cd6:	d001      	beq.n	8001cdc <led_off+0x1c>
 8001cd8:	2802      	cmp	r0, #2
 8001cda:	d102      	bne.n	8001ce2 <led_off+0x22>
 8001cdc:	2390      	movs	r3, #144	; 0x90
 8001cde:	05db      	lsls	r3, r3, #23
 8001ce0:	8518      	strh	r0, [r3, #40]	; 0x28
 8001ce2:	4770      	bx	lr
 8001ce4:	48000400 	.word	0x48000400

08001ce8 <Default_Handler>:
 8001ce8:	4770      	bx	lr
	...

08001cec <HardFault_Handler>:
 8001cec:	2008      	movs	r0, #8
 8001cee:	f7ff ffd3 	bl	8001c98 <led_on>
 8001cf2:	4b07      	ldr	r3, [pc, #28]	; (8001d10 <HardFault_Handler+0x24>)
 8001cf4:	3b01      	subs	r3, #1
 8001cf6:	2b00      	cmp	r3, #0
 8001cf8:	d001      	beq.n	8001cfe <HardFault_Handler+0x12>
 8001cfa:	46c0      	nop			; (mov r8, r8)
 8001cfc:	e7fa      	b.n	8001cf4 <HardFault_Handler+0x8>
 8001cfe:	2008      	movs	r0, #8
 8001d00:	f7ff ffde 	bl	8001cc0 <led_off>
 8001d04:	4b02      	ldr	r3, [pc, #8]	; (8001d10 <HardFault_Handler+0x24>)
 8001d06:	3b01      	subs	r3, #1
 8001d08:	2b00      	cmp	r3, #0
 8001d0a:	d0ef      	beq.n	8001cec <HardFault_Handler>
 8001d0c:	46c0      	nop			; (mov r8, r8)
 8001d0e:	e7fa      	b.n	8001d06 <HardFault_Handler+0x1a>
 8001d10:	002dc6c1 	.word	0x002dc6c1

08001d14 <_reset_init>:
 8001d14:	4a07      	ldr	r2, [pc, #28]	; (8001d34 <_reset_init+0x20>)
 8001d16:	4908      	ldr	r1, [pc, #32]	; (8001d38 <_reset_init+0x24>)
 8001d18:	2300      	movs	r3, #0
 8001d1a:	1a89      	subs	r1, r1, r2
 8001d1c:	1089      	asrs	r1, r1, #2
 8001d1e:	1c10      	adds	r0, r2, #0
 8001d20:	428b      	cmp	r3, r1
 8001d22:	d005      	beq.n	8001d30 <_reset_init+0x1c>
 8001d24:	4c05      	ldr	r4, [pc, #20]	; (8001d3c <_reset_init+0x28>)
 8001d26:	009a      	lsls	r2, r3, #2
 8001d28:	58a4      	ldr	r4, [r4, r2]
 8001d2a:	3301      	adds	r3, #1
 8001d2c:	5084      	str	r4, [r0, r2]
 8001d2e:	e7f7      	b.n	8001d20 <_reset_init+0xc>
 8001d30:	f7fe fcaa 	bl	8000688 <main>
 8001d34:	20000000 	.word	0x20000000
 8001d38:	20000010 	.word	0x20000010
 8001d3c:	08001f34 	.word	0x08001f34

08001d40 <__gnu_thumb1_case_uqi>:
 8001d40:	b402      	push	{r1}
 8001d42:	4671      	mov	r1, lr
 8001d44:	0849      	lsrs	r1, r1, #1
 8001d46:	0049      	lsls	r1, r1, #1
 8001d48:	5c09      	ldrb	r1, [r1, r0]
 8001d4a:	0049      	lsls	r1, r1, #1
 8001d4c:	448e      	add	lr, r1
 8001d4e:	bc02      	pop	{r1}
 8001d50:	4770      	bx	lr
 8001d52:	46c0      	nop			; (mov r8, r8)

08001d54 <__aeabi_uidiv>:
 8001d54:	2900      	cmp	r1, #0
 8001d56:	d034      	beq.n	8001dc2 <.udivsi3_skip_div0_test+0x6a>

08001d58 <.udivsi3_skip_div0_test>:
 8001d58:	2301      	movs	r3, #1
 8001d5a:	2200      	movs	r2, #0
 8001d5c:	b410      	push	{r4}
 8001d5e:	4288      	cmp	r0, r1
 8001d60:	d32c      	bcc.n	8001dbc <.udivsi3_skip_div0_test+0x64>
 8001d62:	2401      	movs	r4, #1
 8001d64:	0724      	lsls	r4, r4, #28
 8001d66:	42a1      	cmp	r1, r4
 8001d68:	d204      	bcs.n	8001d74 <.udivsi3_skip_div0_test+0x1c>
 8001d6a:	4281      	cmp	r1, r0
 8001d6c:	d202      	bcs.n	8001d74 <.udivsi3_skip_div0_test+0x1c>
 8001d6e:	0109      	lsls	r1, r1, #4
 8001d70:	011b      	lsls	r3, r3, #4
 8001d72:	e7f8      	b.n	8001d66 <.udivsi3_skip_div0_test+0xe>
 8001d74:	00e4      	lsls	r4, r4, #3
 8001d76:	42a1      	cmp	r1, r4
 8001d78:	d204      	bcs.n	8001d84 <.udivsi3_skip_div0_test+0x2c>
 8001d7a:	4281      	cmp	r1, r0
 8001d7c:	d202      	bcs.n	8001d84 <.udivsi3_skip_div0_test+0x2c>
 8001d7e:	0049      	lsls	r1, r1, #1
 8001d80:	005b      	lsls	r3, r3, #1
 8001d82:	e7f8      	b.n	8001d76 <.udivsi3_skip_div0_test+0x1e>
 8001d84:	4288      	cmp	r0, r1
 8001d86:	d301      	bcc.n	8001d8c <.udivsi3_skip_div0_test+0x34>
 8001d88:	1a40      	subs	r0, r0, r1
 8001d8a:	431a      	orrs	r2, r3
 8001d8c:	084c      	lsrs	r4, r1, #1
 8001d8e:	42a0      	cmp	r0, r4
 8001d90:	d302      	bcc.n	8001d98 <.udivsi3_skip_div0_test+0x40>
 8001d92:	1b00      	subs	r0, r0, r4
 8001d94:	085c      	lsrs	r4, r3, #1
 8001d96:	4322      	orrs	r2, r4
 8001d98:	088c      	lsrs	r4, r1, #2
 8001d9a:	42a0      	cmp	r0, r4
 8001d9c:	d302      	bcc.n	8001da4 <.udivsi3_skip_div0_test+0x4c>
 8001d9e:	1b00      	subs	r0, r0, r4
 8001da0:	089c      	lsrs	r4, r3, #2
 8001da2:	4322      	orrs	r2, r4
 8001da4:	08cc      	lsrs	r4, r1, #3
 8001da6:	42a0      	cmp	r0, r4
 8001da8:	d302      	bcc.n	8001db0 <.udivsi3_skip_div0_test+0x58>
 8001daa:	1b00      	subs	r0, r0, r4
 8001dac:	08dc      	lsrs	r4, r3, #3
 8001dae:	4322      	orrs	r2, r4
 8001db0:	2800      	cmp	r0, #0
 8001db2:	d003      	beq.n	8001dbc <.udivsi3_skip_div0_test+0x64>
 8001db4:	091b      	lsrs	r3, r3, #4
 8001db6:	d001      	beq.n	8001dbc <.udivsi3_skip_div0_test+0x64>
 8001db8:	0909      	lsrs	r1, r1, #4
 8001dba:	e7e3      	b.n	8001d84 <.udivsi3_skip_div0_test+0x2c>
 8001dbc:	1c10      	adds	r0, r2, #0
 8001dbe:	bc10      	pop	{r4}
 8001dc0:	4770      	bx	lr
 8001dc2:	2800      	cmp	r0, #0
 8001dc4:	d001      	beq.n	8001dca <.udivsi3_skip_div0_test+0x72>
 8001dc6:	2000      	movs	r0, #0
 8001dc8:	43c0      	mvns	r0, r0
 8001dca:	b407      	push	{r0, r1, r2}
 8001dcc:	4802      	ldr	r0, [pc, #8]	; (8001dd8 <.udivsi3_skip_div0_test+0x80>)
 8001dce:	a102      	add	r1, pc, #8	; (adr r1, 8001dd8 <.udivsi3_skip_div0_test+0x80>)
 8001dd0:	1840      	adds	r0, r0, r1
 8001dd2:	9002      	str	r0, [sp, #8]
 8001dd4:	bd03      	pop	{r0, r1, pc}
 8001dd6:	46c0      	nop			; (mov r8, r8)
 8001dd8:	000000d9 	.word	0x000000d9

08001ddc <__aeabi_uidivmod>:
 8001ddc:	2900      	cmp	r1, #0
 8001dde:	d0f0      	beq.n	8001dc2 <.udivsi3_skip_div0_test+0x6a>
 8001de0:	b503      	push	{r0, r1, lr}
 8001de2:	f7ff ffb9 	bl	8001d58 <.udivsi3_skip_div0_test>
 8001de6:	bc0e      	pop	{r1, r2, r3}
 8001de8:	4342      	muls	r2, r0
 8001dea:	1a89      	subs	r1, r1, r2
 8001dec:	4718      	bx	r3
 8001dee:	46c0      	nop			; (mov r8, r8)

08001df0 <__aeabi_idiv>:
 8001df0:	2900      	cmp	r1, #0
 8001df2:	d041      	beq.n	8001e78 <.divsi3_skip_div0_test+0x84>

08001df4 <.divsi3_skip_div0_test>:
 8001df4:	b410      	push	{r4}
 8001df6:	1c04      	adds	r4, r0, #0
 8001df8:	404c      	eors	r4, r1
 8001dfa:	46a4      	mov	ip, r4
 8001dfc:	2301      	movs	r3, #1
 8001dfe:	2200      	movs	r2, #0
 8001e00:	2900      	cmp	r1, #0
 8001e02:	d500      	bpl.n	8001e06 <.divsi3_skip_div0_test+0x12>
 8001e04:	4249      	negs	r1, r1
 8001e06:	2800      	cmp	r0, #0
 8001e08:	d500      	bpl.n	8001e0c <.divsi3_skip_div0_test+0x18>
 8001e0a:	4240      	negs	r0, r0
 8001e0c:	4288      	cmp	r0, r1
 8001e0e:	d32c      	bcc.n	8001e6a <.divsi3_skip_div0_test+0x76>
 8001e10:	2401      	movs	r4, #1
 8001e12:	0724      	lsls	r4, r4, #28
 8001e14:	42a1      	cmp	r1, r4
 8001e16:	d204      	bcs.n	8001e22 <.divsi3_skip_div0_test+0x2e>
 8001e18:	4281      	cmp	r1, r0
 8001e1a:	d202      	bcs.n	8001e22 <.divsi3_skip_div0_test+0x2e>
 8001e1c:	0109      	lsls	r1, r1, #4
 8001e1e:	011b      	lsls	r3, r3, #4
 8001e20:	e7f8      	b.n	8001e14 <.divsi3_skip_div0_test+0x20>
 8001e22:	00e4      	lsls	r4, r4, #3
 8001e24:	42a1      	cmp	r1, r4
 8001e26:	d204      	bcs.n	8001e32 <.divsi3_skip_div0_test+0x3e>
 8001e28:	4281      	cmp	r1, r0
 8001e2a:	d202      	bcs.n	8001e32 <.divsi3_skip_div0_test+0x3e>
 8001e2c:	0049      	lsls	r1, r1, #1
 8001e2e:	005b      	lsls	r3, r3, #1
 8001e30:	e7f8      	b.n	8001e24 <.divsi3_skip_div0_test+0x30>
 8001e32:	4288      	cmp	r0, r1
 8001e34:	d301      	bcc.n	8001e3a <.divsi3_skip_div0_test+0x46>
 8001e36:	1a40      	subs	r0, r0, r1
 8001e38:	431a      	orrs	r2, r3
 8001e3a:	084c      	lsrs	r4, r1, #1
 8001e3c:	42a0      	cmp	r0, r4
 8001e3e:	d302      	bcc.n	8001e46 <.divsi3_skip_div0_test+0x52>
 8001e40:	1b00      	subs	r0, r0, r4
 8001e42:	085c      	lsrs	r4, r3, #1
 8001e44:	4322      	orrs	r2, r4
 8001e46:	088c      	lsrs	r4, r1, #2
 8001e48:	42a0      	cmp	r0, r4
 8001e4a:	d302      	bcc.n	8001e52 <.divsi3_skip_div0_test+0x5e>
 8001e4c:	1b00      	subs	r0, r0, r4
 8001e4e:	089c      	lsrs	r4, r3, #2
 8001e50:	4322      	orrs	r2, r4
 8001e52:	08cc      	lsrs	r4, r1, #3
 8001e54:	42a0      	cmp	r0, r4
 8001e56:	d302      	bcc.n	8001e5e <.divsi3_skip_div0_test+0x6a>
 8001e58:	1b00      	subs	r0, r0, r4
 8001e5a:	08dc      	lsrs	r4, r3, #3
 8001e5c:	4322      	orrs	r2, r4
 8001e5e:	2800      	cmp	r0, #0
 8001e60:	d003      	beq.n	8001e6a <.divsi3_skip_div0_test+0x76>
 8001e62:	091b      	lsrs	r3, r3, #4
 8001e64:	d001      	beq.n	8001e6a <.divsi3_skip_div0_test+0x76>
 8001e66:	0909      	lsrs	r1, r1, #4
 8001e68:	e7e3      	b.n	8001e32 <.divsi3_skip_div0_test+0x3e>
 8001e6a:	1c10      	adds	r0, r2, #0
 8001e6c:	4664      	mov	r4, ip
 8001e6e:	2c00      	cmp	r4, #0
 8001e70:	d500      	bpl.n	8001e74 <.divsi3_skip_div0_test+0x80>
 8001e72:	4240      	negs	r0, r0
 8001e74:	bc10      	pop	{r4}
 8001e76:	4770      	bx	lr
 8001e78:	2800      	cmp	r0, #0
 8001e7a:	d006      	beq.n	8001e8a <.divsi3_skip_div0_test+0x96>
 8001e7c:	db03      	blt.n	8001e86 <.divsi3_skip_div0_test+0x92>
 8001e7e:	2000      	movs	r0, #0
 8001e80:	43c0      	mvns	r0, r0
 8001e82:	0840      	lsrs	r0, r0, #1
 8001e84:	e001      	b.n	8001e8a <.divsi3_skip_div0_test+0x96>
 8001e86:	2080      	movs	r0, #128	; 0x80
 8001e88:	0600      	lsls	r0, r0, #24
 8001e8a:	b407      	push	{r0, r1, r2}
 8001e8c:	4802      	ldr	r0, [pc, #8]	; (8001e98 <.divsi3_skip_div0_test+0xa4>)
 8001e8e:	a102      	add	r1, pc, #8	; (adr r1, 8001e98 <.divsi3_skip_div0_test+0xa4>)
 8001e90:	1840      	adds	r0, r0, r1
 8001e92:	9002      	str	r0, [sp, #8]
 8001e94:	bd03      	pop	{r0, r1, pc}
 8001e96:	46c0      	nop			; (mov r8, r8)
 8001e98:	00000019 	.word	0x00000019

08001e9c <__aeabi_idivmod>:
 8001e9c:	2900      	cmp	r1, #0
 8001e9e:	d0eb      	beq.n	8001e78 <.divsi3_skip_div0_test+0x84>
 8001ea0:	b503      	push	{r0, r1, lr}
 8001ea2:	f7ff ffa7 	bl	8001df4 <.divsi3_skip_div0_test>
 8001ea6:	bc0e      	pop	{r1, r2, r3}
 8001ea8:	4342      	muls	r2, r0
 8001eaa:	1a89      	subs	r1, r1, r2
 8001eac:	4718      	bx	r3
 8001eae:	46c0      	nop			; (mov r8, r8)

08001eb0 <__aeabi_idiv0>:
 8001eb0:	4770      	bx	lr
 8001eb2:	46c0      	nop			; (mov r8, r8)

08001eb4 <_init>:
 8001eb4:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
 8001eb6:	46c0      	nop			; (mov r8, r8)
 8001eb8:	bcf8      	pop	{r3, r4, r5, r6, r7}
 8001eba:	bc08      	pop	{r3}
 8001ebc:	469e      	mov	lr, r3
 8001ebe:	4770      	bx	lr

08001ec0 <_fini>:
 8001ec0:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
 8001ec2:	46c0      	nop			; (mov r8, r8)
 8001ec4:	bcf8      	pop	{r3, r4, r5, r6, r7}
 8001ec6:	bc08      	pop	{r3}
 8001ec8:	469e      	mov	lr, r3
 8001eca:	4770      	bx	lr
 8001ecc:	69647473 	.word	0x69647473
 8001ed0:	6e69206f 	.word	0x6e69206f
 8001ed4:	64207469 	.word	0x64207469
 8001ed8:	0a656e6f 	.word	0x0a656e6f
 8001edc:	00          	.byte	0x00
 8001edd:	25          	.byte	0x25
 8001ede:	2075      	.short	0x2075
 8001ee0:	00          	.byte	0x00
 8001ee1:	62          	.byte	0x62
 8001ee2:	6f6f      	.short	0x6f6f
 8001ee4:	676e6974 	.word	0x676e6974
 8001ee8:	6f726620 	.word	0x6f726620
 8001eec:	7525206d 	.word	0x7525206d
 8001ef0:	6172000a 	.word	0x6172000a
 8001ef4:	7473206d 	.word	0x7473206d
 8001ef8:	20747261 	.word	0x20747261
 8001efc:	0a207525 	.word	0x0a207525
 8001f00:	6d617200 	.word	0x6d617200
 8001f04:	7a697320 	.word	0x7a697320
 8001f08:	75252065 	.word	0x75252065
 8001f0c:	72000a20 	.word	0x72000a20
 8001f10:	66206d61 	.word	0x66206d61
 8001f14:	20656572 	.word	0x20656572
 8001f18:	0a207525 	.word	0x0a207525
 8001f1c:	61656800 	.word	0x61656800
 8001f20:	74732070 	.word	0x74732070
 8001f24:	20747261 	.word	0x20747261
 8001f28:	0a207525 	.word	0x0a207525
 8001f2c:	000a0a00 	.word	0x000a0a00

08001f30 <__EH_FRAME_BEGIN__>:
 8001f30:	00000000                                ....
