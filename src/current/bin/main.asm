
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
 80000dc:	2000013c 	.word	0x2000013c
 80000e0:	200000d4 	.word	0x200000d4

080000e4 <null_thread>:
 80000e4:	b508      	push	{r3, lr}
 80000e6:	f000 fefd 	bl	8000ee4 <sleep>
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
 800014c:	200000d4 	.word	0x200000d4
 8000150:	2000013c 	.word	0x2000013c

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
 80001a4:	2000013c 	.word	0x2000013c
 80001a8:	200000d4 	.word	0x200000d4

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
 80001cc:	2000013c 	.word	0x2000013c

080001d0 <kernel_start>:
 80001d0:	b508      	push	{r3, lr}
 80001d2:	f000 fe7b 	bl	8000ecc <sys_tick_init>
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
 8000254:	200000d4 	.word	0x200000d4
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
 8000290:	200000d4 	.word	0x200000d4
 8000294:	2000013c 	.word	0x2000013c
 8000298:	2000015c 	.word	0x2000015c
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
 80002d8:	200000d4 	.word	0x200000d4

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
 80002fc:	200000d4 	.word	0x200000d4

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
 800032c:	200001dc 	.word	0x200001dc
 8000330:	200001fc 	.word	0x200001fc

08000334 <putc_>:
 8000334:	b538      	push	{r3, r4, r5, lr}
 8000336:	4c06      	ldr	r4, [pc, #24]	; (8000350 <putc_+0x1c>)
 8000338:	1c05      	adds	r5, r0, #0
 800033a:	1c20      	adds	r0, r4, #0
 800033c:	f000 f8ff 	bl	800053e <mutex_lock>
 8000340:	1c28      	adds	r0, r5, #0
 8000342:	f000 fb81 	bl	8000a48 <uart_write>
 8000346:	1c20      	adds	r0, r4, #0
 8000348:	f000 f915 	bl	8000576 <mutex_unlock>
 800034c:	bd38      	pop	{r3, r4, r5, pc}
 800034e:	46c0      	nop			; (mov r8, r8)
 8000350:	2000023c 	.word	0x2000023c

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
 8000378:	20000248 	.word	0x20000248

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
 8000398:	f002 f8f6 	bl	8002588 <__aeabi_idivmod>
 800039c:	3130      	adds	r1, #48	; 0x30
 800039e:	5571      	strb	r1, [r6, r5]
 80003a0:	1c20      	adds	r0, r4, #0
 80003a2:	210a      	movs	r1, #10
 80003a4:	f002 f89a 	bl	80024dc <__aeabi_idiv>
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
 80003d6:	f002 f877 	bl	80024c8 <__aeabi_uidivmod>
 80003da:	3130      	adds	r1, #48	; 0x30
 80003dc:	5531      	strb	r1, [r6, r4]
 80003de:	1c28      	adds	r0, r5, #0
 80003e0:	210a      	movs	r1, #10
 80003e2:	f002 f82d 	bl	8002440 <__aeabi_uidiv>
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
 80004c4:	20000244 	.word	0x20000244

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
 8000508:	2000023c 	.word	0x2000023c
 800050c:	20000240 	.word	0x20000240
 8000510:	20000248 	.word	0x20000248
 8000514:	20000244 	.word	0x20000244
 8000518:	080025b8 	.word	0x080025b8

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

08000586 <LCD_SH1106_write_command>:
 8000586:	b508      	push	{r3, lr}
 8000588:	1c02      	adds	r2, r0, #0
 800058a:	2100      	movs	r1, #0
 800058c:	2078      	movs	r0, #120	; 0x78
 800058e:	f000 fb73 	bl	8000c78 <i2c_write_reg>
 8000592:	bd08      	pop	{r3, pc}

08000594 <LCD_SH1106_set_cursor>:
 8000594:	b510      	push	{r4, lr}
 8000596:	1c84      	adds	r4, r0, #2
 8000598:	1c08      	adds	r0, r1, #0
 800059a:	3850      	subs	r0, #80	; 0x50
 800059c:	b2c0      	uxtb	r0, r0
 800059e:	f7ff fff2 	bl	8000586 <LCD_SH1106_write_command>
 80005a2:	b2e4      	uxtb	r4, r4
 80005a4:	200f      	movs	r0, #15
 80005a6:	4020      	ands	r0, r4
 80005a8:	f7ff ffed 	bl	8000586 <LCD_SH1106_write_command>
 80005ac:	0924      	lsrs	r4, r4, #4
 80005ae:	2010      	movs	r0, #16
 80005b0:	4320      	orrs	r0, r4
 80005b2:	f7ff ffe8 	bl	8000586 <LCD_SH1106_write_command>
 80005b6:	bd10      	pop	{r4, pc}

080005b8 <LCD_SH1106_clear_buffer>:
 80005b8:	b082      	sub	sp, #8
 80005ba:	2300      	movs	r3, #0
 80005bc:	9300      	str	r3, [sp, #0]
 80005be:	9b00      	ldr	r3, [sp, #0]
 80005c0:	2b07      	cmp	r3, #7
 80005c2:	d810      	bhi.n	80005e6 <LCD_SH1106_clear_buffer+0x2e>
 80005c4:	2300      	movs	r3, #0
 80005c6:	9301      	str	r3, [sp, #4]
 80005c8:	9b01      	ldr	r3, [sp, #4]
 80005ca:	2b7f      	cmp	r3, #127	; 0x7f
 80005cc:	d808      	bhi.n	80005e0 <LCD_SH1106_clear_buffer+0x28>
 80005ce:	9a00      	ldr	r2, [sp, #0]
 80005d0:	9b01      	ldr	r3, [sp, #4]
 80005d2:	01d2      	lsls	r2, r2, #7
 80005d4:	18d2      	adds	r2, r2, r3
 80005d6:	4b05      	ldr	r3, [pc, #20]	; (80005ec <LCD_SH1106_clear_buffer+0x34>)
 80005d8:	54d0      	strb	r0, [r2, r3]
 80005da:	9b01      	ldr	r3, [sp, #4]
 80005dc:	3301      	adds	r3, #1
 80005de:	e7f2      	b.n	80005c6 <LCD_SH1106_clear_buffer+0xe>
 80005e0:	9b00      	ldr	r3, [sp, #0]
 80005e2:	3301      	adds	r3, #1
 80005e4:	e7ea      	b.n	80005bc <LCD_SH1106_clear_buffer+0x4>
 80005e6:	b002      	add	sp, #8
 80005e8:	4770      	bx	lr
 80005ea:	46c0      	nop			; (mov r8, r8)
 80005ec:	2000024e 	.word	0x2000024e

080005f0 <LCD_SH1106_flush_buffer>:
 80005f0:	b530      	push	{r4, r5, lr}
 80005f2:	2000      	movs	r0, #0
 80005f4:	b085      	sub	sp, #20
 80005f6:	f7ff ffc6 	bl	8000586 <LCD_SH1106_write_command>
 80005fa:	2010      	movs	r0, #16
 80005fc:	f7ff ffc3 	bl	8000586 <LCD_SH1106_write_command>
 8000600:	2040      	movs	r0, #64	; 0x40
 8000602:	f7ff ffc0 	bl	8000586 <LCD_SH1106_write_command>
 8000606:	2300      	movs	r3, #0
 8000608:	9301      	str	r3, [sp, #4]
 800060a:	9b01      	ldr	r3, [sp, #4]
 800060c:	2b07      	cmp	r3, #7
 800060e:	d833      	bhi.n	8000678 <LCD_SH1106_flush_buffer+0x88>
 8000610:	9801      	ldr	r0, [sp, #4]
 8000612:	2400      	movs	r4, #0
 8000614:	3850      	subs	r0, #80	; 0x50
 8000616:	b2c0      	uxtb	r0, r0
 8000618:	f7ff ffb5 	bl	8000586 <LCD_SH1106_write_command>
 800061c:	2002      	movs	r0, #2
 800061e:	f7ff ffb2 	bl	8000586 <LCD_SH1106_write_command>
 8000622:	2010      	movs	r0, #16
 8000624:	f7ff ffaf 	bl	8000586 <LCD_SH1106_write_command>
 8000628:	9402      	str	r4, [sp, #8]
 800062a:	9b02      	ldr	r3, [sp, #8]
 800062c:	2b07      	cmp	r3, #7
 800062e:	d820      	bhi.n	8000672 <LCD_SH1106_flush_buffer+0x82>
 8000630:	f000 fadf 	bl	8000bf2 <i2cStart>
 8000634:	2078      	movs	r0, #120	; 0x78
 8000636:	f000 faf8 	bl	8000c2a <i2cWrite>
 800063a:	2040      	movs	r0, #64	; 0x40
 800063c:	f000 faf5 	bl	8000c2a <i2cWrite>
 8000640:	2300      	movs	r3, #0
 8000642:	9303      	str	r3, [sp, #12]
 8000644:	9b03      	ldr	r3, [sp, #12]
 8000646:	2b0f      	cmp	r3, #15
 8000648:	d80d      	bhi.n	8000666 <LCD_SH1106_flush_buffer+0x76>
 800064a:	9b01      	ldr	r3, [sp, #4]
 800064c:	1c65      	adds	r5, r4, #1
 800064e:	01db      	lsls	r3, r3, #7
 8000650:	191c      	adds	r4, r3, r4
 8000652:	4b0c      	ldr	r3, [pc, #48]	; (8000684 <LCD_SH1106_flush_buffer+0x94>)
 8000654:	5ce0      	ldrb	r0, [r4, r3]
 8000656:	1c2c      	adds	r4, r5, #0
 8000658:	b2c0      	uxtb	r0, r0
 800065a:	f000 fae6 	bl	8000c2a <i2cWrite>
 800065e:	9b03      	ldr	r3, [sp, #12]
 8000660:	3301      	adds	r3, #1
 8000662:	9303      	str	r3, [sp, #12]
 8000664:	e7ee      	b.n	8000644 <LCD_SH1106_flush_buffer+0x54>
 8000666:	f000 fad2 	bl	8000c0e <i2cStop>
 800066a:	9b02      	ldr	r3, [sp, #8]
 800066c:	3301      	adds	r3, #1
 800066e:	9302      	str	r3, [sp, #8]
 8000670:	e7db      	b.n	800062a <LCD_SH1106_flush_buffer+0x3a>
 8000672:	9b01      	ldr	r3, [sp, #4]
 8000674:	3301      	adds	r3, #1
 8000676:	e7c7      	b.n	8000608 <LCD_SH1106_flush_buffer+0x18>
 8000678:	2000      	movs	r0, #0
 800067a:	1c01      	adds	r1, r0, #0
 800067c:	f7ff ff8a 	bl	8000594 <LCD_SH1106_set_cursor>
 8000680:	b005      	add	sp, #20
 8000682:	bd30      	pop	{r4, r5, pc}
 8000684:	2000024e 	.word	0x2000024e

08000688 <LCD_SH1106_init>:
 8000688:	b508      	push	{r3, lr}
 800068a:	20ae      	movs	r0, #174	; 0xae
 800068c:	f7ff ff7b 	bl	8000586 <LCD_SH1106_write_command>
 8000690:	2002      	movs	r0, #2
 8000692:	f7ff ff78 	bl	8000586 <LCD_SH1106_write_command>
 8000696:	2010      	movs	r0, #16
 8000698:	f7ff ff75 	bl	8000586 <LCD_SH1106_write_command>
 800069c:	2040      	movs	r0, #64	; 0x40
 800069e:	f7ff ff72 	bl	8000586 <LCD_SH1106_write_command>
 80006a2:	20b0      	movs	r0, #176	; 0xb0
 80006a4:	f7ff ff6f 	bl	8000586 <LCD_SH1106_write_command>
 80006a8:	2081      	movs	r0, #129	; 0x81
 80006aa:	f7ff ff6c 	bl	8000586 <LCD_SH1106_write_command>
 80006ae:	2080      	movs	r0, #128	; 0x80
 80006b0:	f7ff ff69 	bl	8000586 <LCD_SH1106_write_command>
 80006b4:	20a1      	movs	r0, #161	; 0xa1
 80006b6:	f7ff ff66 	bl	8000586 <LCD_SH1106_write_command>
 80006ba:	20a6      	movs	r0, #166	; 0xa6
 80006bc:	f7ff ff63 	bl	8000586 <LCD_SH1106_write_command>
 80006c0:	20a8      	movs	r0, #168	; 0xa8
 80006c2:	f7ff ff60 	bl	8000586 <LCD_SH1106_write_command>
 80006c6:	203f      	movs	r0, #63	; 0x3f
 80006c8:	f7ff ff5d 	bl	8000586 <LCD_SH1106_write_command>
 80006cc:	20ad      	movs	r0, #173	; 0xad
 80006ce:	f7ff ff5a 	bl	8000586 <LCD_SH1106_write_command>
 80006d2:	208b      	movs	r0, #139	; 0x8b
 80006d4:	f7ff ff57 	bl	8000586 <LCD_SH1106_write_command>
 80006d8:	2030      	movs	r0, #48	; 0x30
 80006da:	f7ff ff54 	bl	8000586 <LCD_SH1106_write_command>
 80006de:	20c8      	movs	r0, #200	; 0xc8
 80006e0:	f7ff ff51 	bl	8000586 <LCD_SH1106_write_command>
 80006e4:	20d3      	movs	r0, #211	; 0xd3
 80006e6:	f7ff ff4e 	bl	8000586 <LCD_SH1106_write_command>
 80006ea:	2000      	movs	r0, #0
 80006ec:	f7ff ff4b 	bl	8000586 <LCD_SH1106_write_command>
 80006f0:	20d5      	movs	r0, #213	; 0xd5
 80006f2:	f7ff ff48 	bl	8000586 <LCD_SH1106_write_command>
 80006f6:	2080      	movs	r0, #128	; 0x80
 80006f8:	f7ff ff45 	bl	8000586 <LCD_SH1106_write_command>
 80006fc:	20d9      	movs	r0, #217	; 0xd9
 80006fe:	f7ff ff42 	bl	8000586 <LCD_SH1106_write_command>
 8000702:	201f      	movs	r0, #31
 8000704:	f7ff ff3f 	bl	8000586 <LCD_SH1106_write_command>
 8000708:	20da      	movs	r0, #218	; 0xda
 800070a:	f7ff ff3c 	bl	8000586 <LCD_SH1106_write_command>
 800070e:	2012      	movs	r0, #18
 8000710:	f7ff ff39 	bl	8000586 <LCD_SH1106_write_command>
 8000714:	20db      	movs	r0, #219	; 0xdb
 8000716:	f7ff ff36 	bl	8000586 <LCD_SH1106_write_command>
 800071a:	2040      	movs	r0, #64	; 0x40
 800071c:	f7ff ff33 	bl	8000586 <LCD_SH1106_write_command>
 8000720:	20af      	movs	r0, #175	; 0xaf
 8000722:	f7ff ff30 	bl	8000586 <LCD_SH1106_write_command>
 8000726:	2000      	movs	r0, #0
 8000728:	f7ff ff46 	bl	80005b8 <LCD_SH1106_clear_buffer>
 800072c:	f7ff ff60 	bl	80005f0 <LCD_SH1106_flush_buffer>
 8000730:	4a02      	ldr	r2, [pc, #8]	; (800073c <LCD_SH1106_init+0xb4>)
 8000732:	2300      	movs	r3, #0
 8000734:	8013      	strh	r3, [r2, #0]
 8000736:	4a02      	ldr	r2, [pc, #8]	; (8000740 <LCD_SH1106_init+0xb8>)
 8000738:	8013      	strh	r3, [r2, #0]
 800073a:	bd08      	pop	{r3, pc}
 800073c:	2000024c 	.word	0x2000024c
 8000740:	2000064e 	.word	0x2000064e

08000744 <plasma_init>:
 8000744:	2200      	movs	r2, #0
 8000746:	2300      	movs	r3, #0
 8000748:	4905      	ldr	r1, [pc, #20]	; (8000760 <plasma_init+0x1c>)
 800074a:	2000      	movs	r0, #0
 800074c:	1851      	adds	r1, r2, r1
 800074e:	54c8      	strb	r0, [r1, r3]
 8000750:	3301      	adds	r3, #1
 8000752:	2b08      	cmp	r3, #8
 8000754:	d1f8      	bne.n	8000748 <plasma_init+0x4>
 8000756:	3208      	adds	r2, #8
 8000758:	2a40      	cmp	r2, #64	; 0x40
 800075a:	d1f4      	bne.n	8000746 <plasma_init+0x2>
 800075c:	4770      	bx	lr
 800075e:	46c0      	nop			; (mov r8, r8)
 8000760:	20000750 	.word	0x20000750

08000764 <plasma_process>:
 8000764:	b5f0      	push	{r4, r5, r6, r7, lr}
 8000766:	b08b      	sub	sp, #44	; 0x2c
 8000768:	f000 f952 	bl	8000a10 <timer_get_time>
 800076c:	210a      	movs	r1, #10
 800076e:	f001 fe67 	bl	8002440 <__aeabi_uidiv>
 8000772:	210a      	movs	r1, #10
 8000774:	1c04      	adds	r4, r0, #0
 8000776:	f001 fe63 	bl	8002440 <__aeabi_uidiv>
 800077a:	2303      	movs	r3, #3
 800077c:	4363      	muls	r3, r4
 800077e:	9003      	str	r0, [sp, #12]
 8000780:	210d      	movs	r1, #13
 8000782:	1c20      	adds	r0, r4, #0
 8000784:	9302      	str	r3, [sp, #8]
 8000786:	f001 fe5b 	bl	8002440 <__aeabi_uidiv>
 800078a:	9007      	str	r0, [sp, #28]
 800078c:	0060      	lsls	r0, r4, #1
 800078e:	9008      	str	r0, [sp, #32]
 8000790:	2300      	movs	r3, #0
 8000792:	2217      	movs	r2, #23
 8000794:	2012      	movs	r0, #18
 8000796:	435a      	muls	r2, r3
 8000798:	4358      	muls	r0, r3
 800079a:	9e02      	ldr	r6, [sp, #8]
 800079c:	21ff      	movs	r1, #255	; 0xff
 800079e:	1980      	adds	r0, r0, r6
 80007a0:	9206      	str	r2, [sp, #24]
 80007a2:	4a2a      	ldr	r2, [pc, #168]	; (800084c <plasma_process+0xe8>)
 80007a4:	4008      	ands	r0, r1
 80007a6:	9f07      	ldr	r7, [sp, #28]
 80007a8:	5c15      	ldrb	r5, [r2, r0]
 80007aa:	0098      	lsls	r0, r3, #2
 80007ac:	19c0      	adds	r0, r0, r7
 80007ae:	4008      	ands	r0, r1
 80007b0:	5c10      	ldrb	r0, [r2, r0]
 80007b2:	9e08      	ldr	r6, [sp, #32]
 80007b4:	1828      	adds	r0, r5, r0
 80007b6:	2511      	movs	r5, #17
 80007b8:	435d      	muls	r5, r3
 80007ba:	19ad      	adds	r5, r5, r6
 80007bc:	4029      	ands	r1, r5
 80007be:	5c52      	ldrb	r2, [r2, r1]
 80007c0:	4923      	ldr	r1, [pc, #140]	; (8000850 <plasma_process+0xec>)
 80007c2:	1882      	adds	r2, r0, r2
 80007c4:	9205      	str	r2, [sp, #20]
 80007c6:	00da      	lsls	r2, r3, #3
 80007c8:	1a9f      	subs	r7, r3, r2
 80007ca:	1851      	adds	r1, r2, r1
 80007cc:	9d02      	ldr	r5, [sp, #8]
 80007ce:	9704      	str	r7, [sp, #16]
 80007d0:	9109      	str	r1, [sp, #36]	; 0x24
 80007d2:	2200      	movs	r2, #0
 80007d4:	2611      	movs	r6, #17
 80007d6:	491d      	ldr	r1, [pc, #116]	; (800084c <plasma_process+0xe8>)
 80007d8:	20ff      	movs	r0, #255	; 0xff
 80007da:	4356      	muls	r6, r2
 80007dc:	1c2f      	adds	r7, r5, #0
 80007de:	4007      	ands	r7, r0
 80007e0:	5dcf      	ldrb	r7, [r1, r7]
 80007e2:	1936      	adds	r6, r6, r4
 80007e4:	46bc      	mov	ip, r7
 80007e6:	2703      	movs	r7, #3
 80007e8:	9600      	str	r6, [sp, #0]
 80007ea:	4357      	muls	r7, r2
 80007ec:	9e05      	ldr	r6, [sp, #20]
 80007ee:	44b4      	add	ip, r6
 80007f0:	9e03      	ldr	r6, [sp, #12]
 80007f2:	19bf      	adds	r7, r7, r6
 80007f4:	4007      	ands	r7, r0
 80007f6:	5dcf      	ldrb	r7, [r1, r7]
 80007f8:	44bc      	add	ip, r7
 80007fa:	9f00      	ldr	r7, [sp, #0]
 80007fc:	4007      	ands	r7, r0
 80007fe:	5dcf      	ldrb	r7, [r1, r7]
 8000800:	4467      	add	r7, ip
 8000802:	9701      	str	r7, [sp, #4]
 8000804:	270e      	movs	r7, #14
 8000806:	1c3e      	adds	r6, r7, #0
 8000808:	4356      	muls	r6, r2
 800080a:	9f00      	ldr	r7, [sp, #0]
 800080c:	1bbf      	subs	r7, r7, r6
 800080e:	007f      	lsls	r7, r7, #1
 8000810:	26fe      	movs	r6, #254	; 0xfe
 8000812:	403e      	ands	r6, r7
 8000814:	5d8e      	ldrb	r6, [r1, r6]
 8000816:	9f01      	ldr	r7, [sp, #4]
 8000818:	19be      	adds	r6, r7, r6
 800081a:	9f04      	ldr	r7, [sp, #16]
 800081c:	9601      	str	r6, [sp, #4]
 800081e:	193e      	adds	r6, r7, r4
 8000820:	2707      	movs	r7, #7
 8000822:	4357      	muls	r7, r2
 8000824:	46bc      	mov	ip, r7
 8000826:	4466      	add	r6, ip
 8000828:	4006      	ands	r6, r0
 800082a:	5d89      	ldrb	r1, [r1, r6]
 800082c:	9801      	ldr	r0, [sp, #4]
 800082e:	9e09      	ldr	r6, [sp, #36]	; 0x24
 8000830:	1841      	adds	r1, r0, r1
 8000832:	08c9      	lsrs	r1, r1, #3
 8000834:	9f06      	ldr	r7, [sp, #24]
 8000836:	54b1      	strb	r1, [r6, r2]
 8000838:	3201      	adds	r2, #1
 800083a:	19ed      	adds	r5, r5, r7
 800083c:	2a08      	cmp	r2, #8
 800083e:	d1c9      	bne.n	80007d4 <plasma_process+0x70>
 8000840:	3301      	adds	r3, #1
 8000842:	2b08      	cmp	r3, #8
 8000844:	d1a5      	bne.n	8000792 <plasma_process+0x2e>
 8000846:	b00b      	add	sp, #44	; 0x2c
 8000848:	bdf0      	pop	{r4, r5, r6, r7, pc}
 800084a:	46c0      	nop			; (mov r8, r8)
 800084c:	080025c9 	.word	0x080025c9
 8000850:	20000750 	.word	0x20000750

08000854 <main_thread>:
 8000854:	b538      	push	{r3, r4, r5, lr}
 8000856:	f000 fa71 	bl	8000d3c <ws2812_init>
 800085a:	f7ff ff15 	bl	8000688 <LCD_SH1106_init>
 800085e:	2000      	movs	r0, #0
 8000860:	f7ff feaa 	bl	80005b8 <LCD_SH1106_clear_buffer>
 8000864:	f7ff ff6e 	bl	8000744 <plasma_init>
 8000868:	f000 fa24 	bl	8000cb4 <ws2812_clear>
 800086c:	2400      	movs	r4, #0
 800086e:	1c25      	adds	r5, r4, #0
 8000870:	3508      	adds	r5, #8
 8000872:	4b0d      	ldr	r3, [pc, #52]	; (80008a8 <main_thread+0x54>)
 8000874:	5d18      	ldrb	r0, [r3, r4]
 8000876:	23ff      	movs	r3, #255	; 0xff
 8000878:	1c02      	adds	r2, r0, #0
 800087a:	0941      	lsrs	r1, r0, #5
 800087c:	3255      	adds	r2, #85	; 0x55
 800087e:	30aa      	adds	r0, #170	; 0xaa
 8000880:	401a      	ands	r2, r3
 8000882:	4003      	ands	r3, r0
 8000884:	0952      	lsrs	r2, r2, #5
 8000886:	1c20      	adds	r0, r4, #0
 8000888:	095b      	lsrs	r3, r3, #5
 800088a:	3401      	adds	r4, #1
 800088c:	f000 fa06 	bl	8000c9c <ws2812_set_led>
 8000890:	42ac      	cmp	r4, r5
 8000892:	d1ee      	bne.n	8000872 <main_thread+0x1e>
 8000894:	2c40      	cmp	r4, #64	; 0x40
 8000896:	d1ea      	bne.n	800086e <main_thread+0x1a>
 8000898:	f000 fa1a 	bl	8000cd0 <ws2812_refresh>
 800089c:	f7ff ff62 	bl	8000764 <plasma_process>
 80008a0:	2064      	movs	r0, #100	; 0x64
 80008a2:	f000 f8c1 	bl	8000a28 <timer_delay_ms>
 80008a6:	e7df      	b.n	8000868 <main_thread+0x14>
 80008a8:	20000750 	.word	0x20000750

080008ac <mem_info_print>:
 80008ac:	b538      	push	{r3, r4, r5, lr}
 80008ae:	480e      	ldr	r0, [pc, #56]	; (80008e8 <mem_info_print+0x3c>)
 80008b0:	490e      	ldr	r1, [pc, #56]	; (80008ec <mem_info_print+0x40>)
 80008b2:	f7ff fdb9 	bl	8000428 <printf_>
 80008b6:	4c0e      	ldr	r4, [pc, #56]	; (80008f0 <mem_info_print+0x44>)
 80008b8:	480e      	ldr	r0, [pc, #56]	; (80008f4 <mem_info_print+0x48>)
 80008ba:	1c21      	adds	r1, r4, #0
 80008bc:	f7ff fdb4 	bl	8000428 <printf_>
 80008c0:	4d0d      	ldr	r5, [pc, #52]	; (80008f8 <mem_info_print+0x4c>)
 80008c2:	480e      	ldr	r0, [pc, #56]	; (80008fc <mem_info_print+0x50>)
 80008c4:	1b2d      	subs	r5, r5, r4
 80008c6:	1c29      	adds	r1, r5, #0
 80008c8:	f7ff fdae 	bl	8000428 <printf_>
 80008cc:	490c      	ldr	r1, [pc, #48]	; (8000900 <mem_info_print+0x54>)
 80008ce:	480d      	ldr	r0, [pc, #52]	; (8000904 <mem_info_print+0x58>)
 80008d0:	1a64      	subs	r4, r4, r1
 80008d2:	1929      	adds	r1, r5, r4
 80008d4:	f7ff fda8 	bl	8000428 <printf_>
 80008d8:	490b      	ldr	r1, [pc, #44]	; (8000908 <mem_info_print+0x5c>)
 80008da:	480c      	ldr	r0, [pc, #48]	; (800090c <mem_info_print+0x60>)
 80008dc:	f7ff fda4 	bl	8000428 <printf_>
 80008e0:	480b      	ldr	r0, [pc, #44]	; (8000910 <mem_info_print+0x64>)
 80008e2:	f7ff fda1 	bl	8000428 <printf_>
 80008e6:	bd38      	pop	{r3, r4, r5, pc}
 80008e8:	080026c9 	.word	0x080026c9
 80008ec:	080025a0 	.word	0x080025a0
 80008f0:	20000000 	.word	0x20000000
 80008f4:	080026da 	.word	0x080026da
 80008f8:	20001000 	.word	0x20001000
 80008fc:	080026e9 	.word	0x080026e9
 8000900:	200007e0 	.word	0x200007e0
 8000904:	080026f7 	.word	0x080026f7
 8000908:	200007e0 	.word	0x200007e0
 800090c:	08002705 	.word	0x08002705
 8000910:	08002715 	.word	0x08002715

08000914 <main>:
 8000914:	b508      	push	{r3, lr}
 8000916:	f000 fb8b 	bl	8001030 <lib_low_level_init>
 800091a:	f7ff fdff 	bl	800051c <lib_os_init>
 800091e:	f7ff ffc5 	bl	80008ac <mem_info_print>
 8000922:	2280      	movs	r2, #128	; 0x80
 8000924:	4904      	ldr	r1, [pc, #16]	; (8000938 <main+0x24>)
 8000926:	0052      	lsls	r2, r2, #1
 8000928:	2308      	movs	r3, #8
 800092a:	4804      	ldr	r0, [pc, #16]	; (800093c <main+0x28>)
 800092c:	f7ff fc56 	bl	80001dc <create_thread>
 8000930:	f7ff fc4e 	bl	80001d0 <kernel_start>
 8000934:	2000      	movs	r0, #0
 8000936:	bd08      	pop	{r3, pc}
 8000938:	20000650 	.word	0x20000650
 800093c:	08000855 	.word	0x08000855

08000940 <timer_init>:
 8000940:	b530      	push	{r4, r5, lr}
 8000942:	2300      	movs	r3, #0
 8000944:	b085      	sub	sp, #20
 8000946:	481b      	ldr	r0, [pc, #108]	; (80009b4 <timer_init+0x74>)
 8000948:	2180      	movs	r1, #128	; 0x80
 800094a:	005a      	lsls	r2, r3, #1
 800094c:	00c9      	lsls	r1, r1, #3
 800094e:	5211      	strh	r1, [r2, r0]
 8000950:	4819      	ldr	r0, [pc, #100]	; (80009b8 <timer_init+0x78>)
 8000952:	2400      	movs	r4, #0
 8000954:	5211      	strh	r1, [r2, r0]
 8000956:	4919      	ldr	r1, [pc, #100]	; (80009bc <timer_init+0x7c>)
 8000958:	3301      	adds	r3, #1
 800095a:	5254      	strh	r4, [r2, r1]
 800095c:	2b04      	cmp	r3, #4
 800095e:	d1f2      	bne.n	8000946 <timer_init+0x6>
 8000960:	4b17      	ldr	r3, [pc, #92]	; (80009c0 <timer_init+0x80>)
 8000962:	2001      	movs	r0, #1
 8000964:	1c01      	adds	r1, r0, #0
 8000966:	601c      	str	r4, [r3, #0]
 8000968:	f001 fc48 	bl	80021fc <RCC_APB1PeriphClockCmd>
 800096c:	a901      	add	r1, sp, #4
 800096e:	2330      	movs	r3, #48	; 0x30
 8000970:	800b      	strh	r3, [r1, #0]
 8000972:	2080      	movs	r0, #128	; 0x80
 8000974:	23fa      	movs	r3, #250	; 0xfa
 8000976:	009b      	lsls	r3, r3, #2
 8000978:	05c0      	lsls	r0, r0, #23
 800097a:	604b      	str	r3, [r1, #4]
 800097c:	804c      	strh	r4, [r1, #2]
 800097e:	810c      	strh	r4, [r1, #8]
 8000980:	728c      	strb	r4, [r1, #10]
 8000982:	f000 fd11 	bl	80013a8 <TIM_TimeBaseInit>
 8000986:	2080      	movs	r0, #128	; 0x80
 8000988:	05c0      	lsls	r0, r0, #23
 800098a:	2101      	movs	r1, #1
 800098c:	f000 fd8e 	bl	80014ac <TIM_Cmd>
 8000990:	2080      	movs	r0, #128	; 0x80
 8000992:	2102      	movs	r1, #2
 8000994:	05c0      	lsls	r0, r0, #23
 8000996:	2201      	movs	r2, #1
 8000998:	f000 fdcc 	bl	8001534 <TIM_ITConfig>
 800099c:	466a      	mov	r2, sp
 800099e:	230f      	movs	r3, #15
 80009a0:	7013      	strb	r3, [r2, #0]
 80009a2:	4668      	mov	r0, sp
 80009a4:	2301      	movs	r3, #1
 80009a6:	7053      	strb	r3, [r2, #1]
 80009a8:	7093      	strb	r3, [r2, #2]
 80009aa:	f001 faad 	bl	8001f08 <NVIC_Init>
 80009ae:	b005      	add	sp, #20
 80009b0:	bd30      	pop	{r4, r5, pc}
 80009b2:	46c0      	nop			; (mov r8, r8)
 80009b4:	200007a4 	.word	0x200007a4
 80009b8:	20000798 	.word	0x20000798
 80009bc:	20000790 	.word	0x20000790
 80009c0:	200007a0 	.word	0x200007a0

080009c4 <TIM2_IRQHandler>:
 80009c4:	2200      	movs	r2, #0
 80009c6:	490e      	ldr	r1, [pc, #56]	; (8000a00 <TIM2_IRQHandler+0x3c>)
 80009c8:	0053      	lsls	r3, r2, #1
 80009ca:	5a58      	ldrh	r0, [r3, r1]
 80009cc:	2800      	cmp	r0, #0
 80009ce:	d003      	beq.n	80009d8 <TIM2_IRQHandler+0x14>
 80009d0:	5a58      	ldrh	r0, [r3, r1]
 80009d2:	3801      	subs	r0, #1
 80009d4:	b280      	uxth	r0, r0
 80009d6:	e005      	b.n	80009e4 <TIM2_IRQHandler+0x20>
 80009d8:	480a      	ldr	r0, [pc, #40]	; (8000a04 <TIM2_IRQHandler+0x40>)
 80009da:	5a18      	ldrh	r0, [r3, r0]
 80009dc:	b280      	uxth	r0, r0
 80009de:	5258      	strh	r0, [r3, r1]
 80009e0:	4909      	ldr	r1, [pc, #36]	; (8000a08 <TIM2_IRQHandler+0x44>)
 80009e2:	2001      	movs	r0, #1
 80009e4:	3201      	adds	r2, #1
 80009e6:	5258      	strh	r0, [r3, r1]
 80009e8:	2a04      	cmp	r2, #4
 80009ea:	d1ec      	bne.n	80009c6 <TIM2_IRQHandler+0x2>
 80009ec:	4b07      	ldr	r3, [pc, #28]	; (8000a0c <TIM2_IRQHandler+0x48>)
 80009ee:	681a      	ldr	r2, [r3, #0]
 80009f0:	3201      	adds	r2, #1
 80009f2:	601a      	str	r2, [r3, #0]
 80009f4:	2380      	movs	r3, #128	; 0x80
 80009f6:	2200      	movs	r2, #0
 80009f8:	05db      	lsls	r3, r3, #23
 80009fa:	821a      	strh	r2, [r3, #16]
 80009fc:	4770      	bx	lr
 80009fe:	46c0      	nop			; (mov r8, r8)
 8000a00:	200007a4 	.word	0x200007a4
 8000a04:	20000798 	.word	0x20000798
 8000a08:	20000790 	.word	0x20000790
 8000a0c:	200007a0 	.word	0x200007a0

08000a10 <timer_get_time>:
 8000a10:	b082      	sub	sp, #8
 8000a12:	b672      	cpsid	i
 8000a14:	4b03      	ldr	r3, [pc, #12]	; (8000a24 <timer_get_time+0x14>)
 8000a16:	681b      	ldr	r3, [r3, #0]
 8000a18:	9301      	str	r3, [sp, #4]
 8000a1a:	b662      	cpsie	i
 8000a1c:	9801      	ldr	r0, [sp, #4]
 8000a1e:	b002      	add	sp, #8
 8000a20:	4770      	bx	lr
 8000a22:	46c0      	nop			; (mov r8, r8)
 8000a24:	200007a0 	.word	0x200007a0

08000a28 <timer_delay_ms>:
 8000a28:	b513      	push	{r0, r1, r4, lr}
 8000a2a:	1c04      	adds	r4, r0, #0
 8000a2c:	f7ff fff0 	bl	8000a10 <timer_get_time>
 8000a30:	1904      	adds	r4, r0, r4
 8000a32:	9401      	str	r4, [sp, #4]
 8000a34:	9c01      	ldr	r4, [sp, #4]
 8000a36:	f7ff ffeb 	bl	8000a10 <timer_get_time>
 8000a3a:	4284      	cmp	r4, r0
 8000a3c:	d902      	bls.n	8000a44 <timer_delay_ms+0x1c>
 8000a3e:	f000 fa51 	bl	8000ee4 <sleep>
 8000a42:	e7f7      	b.n	8000a34 <timer_delay_ms+0xc>
 8000a44:	bd13      	pop	{r0, r1, r4, pc}
	...

08000a48 <uart_write>:
 8000a48:	4b03      	ldr	r3, [pc, #12]	; (8000a58 <uart_write+0x10>)
 8000a4a:	69da      	ldr	r2, [r3, #28]
 8000a4c:	0611      	lsls	r1, r2, #24
 8000a4e:	d401      	bmi.n	8000a54 <uart_write+0xc>
 8000a50:	46c0      	nop			; (mov r8, r8)
 8000a52:	e7f9      	b.n	8000a48 <uart_write>
 8000a54:	8518      	strh	r0, [r3, #40]	; 0x28
 8000a56:	4770      	bx	lr
 8000a58:	40013800 	.word	0x40013800

08000a5c <USART1_IRQHandler>:
 8000a5c:	b508      	push	{r3, lr}
 8000a5e:	480e      	ldr	r0, [pc, #56]	; (8000a98 <USART1_IRQHandler+0x3c>)
 8000a60:	490e      	ldr	r1, [pc, #56]	; (8000a9c <USART1_IRQHandler+0x40>)
 8000a62:	f000 fef9 	bl	8001858 <USART_GetITStatus>
 8000a66:	2800      	cmp	r0, #0
 8000a68:	d011      	beq.n	8000a8e <USART1_IRQHandler+0x32>
 8000a6a:	480b      	ldr	r0, [pc, #44]	; (8000a98 <USART1_IRQHandler+0x3c>)
 8000a6c:	f000 fec0 	bl	80017f0 <USART_ReceiveData>
 8000a70:	4b0b      	ldr	r3, [pc, #44]	; (8000aa0 <USART1_IRQHandler+0x44>)
 8000a72:	490c      	ldr	r1, [pc, #48]	; (8000aa4 <USART1_IRQHandler+0x48>)
 8000a74:	881a      	ldrh	r2, [r3, #0]
 8000a76:	b2c0      	uxtb	r0, r0
 8000a78:	b292      	uxth	r2, r2
 8000a7a:	5488      	strb	r0, [r1, r2]
 8000a7c:	881a      	ldrh	r2, [r3, #0]
 8000a7e:	3201      	adds	r2, #1
 8000a80:	b292      	uxth	r2, r2
 8000a82:	801a      	strh	r2, [r3, #0]
 8000a84:	881a      	ldrh	r2, [r3, #0]
 8000a86:	2a0f      	cmp	r2, #15
 8000a88:	d901      	bls.n	8000a8e <USART1_IRQHandler+0x32>
 8000a8a:	2200      	movs	r2, #0
 8000a8c:	801a      	strh	r2, [r3, #0]
 8000a8e:	4802      	ldr	r0, [pc, #8]	; (8000a98 <USART1_IRQHandler+0x3c>)
 8000a90:	4902      	ldr	r1, [pc, #8]	; (8000a9c <USART1_IRQHandler+0x40>)
 8000a92:	f000 ff79 	bl	8001988 <USART_ClearITPendingBit>
 8000a96:	bd08      	pop	{r3, pc}
 8000a98:	40013800 	.word	0x40013800
 8000a9c:	00050105 	.word	0x00050105
 8000aa0:	200007bc 	.word	0x200007bc
 8000aa4:	200007ac 	.word	0x200007ac

08000aa8 <uart_init>:
 8000aa8:	b530      	push	{r4, r5, lr}
 8000aaa:	4a21      	ldr	r2, [pc, #132]	; (8000b30 <uart_init+0x88>)
 8000aac:	2300      	movs	r3, #0
 8000aae:	8013      	strh	r3, [r2, #0]
 8000ab0:	4a20      	ldr	r2, [pc, #128]	; (8000b34 <uart_init+0x8c>)
 8000ab2:	b089      	sub	sp, #36	; 0x24
 8000ab4:	8013      	strh	r3, [r2, #0]
 8000ab6:	4a20      	ldr	r2, [pc, #128]	; (8000b38 <uart_init+0x90>)
 8000ab8:	2400      	movs	r4, #0
 8000aba:	54d4      	strb	r4, [r2, r3]
 8000abc:	3301      	adds	r3, #1
 8000abe:	2b10      	cmp	r3, #16
 8000ac0:	d1f9      	bne.n	8000ab6 <uart_init+0xe>
 8000ac2:	2080      	movs	r0, #128	; 0x80
 8000ac4:	0280      	lsls	r0, r0, #10
 8000ac6:	2101      	movs	r1, #1
 8000ac8:	f001 fb58 	bl	800217c <RCC_AHBPeriphClockCmd>
 8000acc:	2080      	movs	r0, #128	; 0x80
 8000ace:	01c0      	lsls	r0, r0, #7
 8000ad0:	2101      	movs	r1, #1
 8000ad2:	f001 fb73 	bl	80021bc <RCC_APB2PeriphClockCmd>
 8000ad6:	2090      	movs	r0, #144	; 0x90
 8000ad8:	05c0      	lsls	r0, r0, #23
 8000ada:	2102      	movs	r1, #2
 8000adc:	2201      	movs	r2, #1
 8000ade:	f000 fc1d 	bl	800131c <GPIO_PinAFConfig>
 8000ae2:	2090      	movs	r0, #144	; 0x90
 8000ae4:	05c0      	lsls	r0, r0, #23
 8000ae6:	210f      	movs	r1, #15
 8000ae8:	2201      	movs	r2, #1
 8000aea:	f000 fc17 	bl	800131c <GPIO_PinAFConfig>
 8000aee:	4b13      	ldr	r3, [pc, #76]	; (8000b3c <uart_init+0x94>)
 8000af0:	2090      	movs	r0, #144	; 0x90
 8000af2:	466a      	mov	r2, sp
 8000af4:	2501      	movs	r5, #1
 8000af6:	9300      	str	r3, [sp, #0]
 8000af8:	4669      	mov	r1, sp
 8000afa:	2302      	movs	r3, #2
 8000afc:	05c0      	lsls	r0, r0, #23
 8000afe:	7113      	strb	r3, [r2, #4]
 8000b00:	7155      	strb	r5, [r2, #5]
 8000b02:	7194      	strb	r4, [r2, #6]
 8000b04:	71d5      	strb	r5, [r2, #7]
 8000b06:	f000 fb85 	bl	8001214 <GPIO_Init>
 8000b0a:	23e1      	movs	r3, #225	; 0xe1
 8000b0c:	025b      	lsls	r3, r3, #9
 8000b0e:	9302      	str	r3, [sp, #8]
 8000b10:	a902      	add	r1, sp, #8
 8000b12:	230c      	movs	r3, #12
 8000b14:	480a      	ldr	r0, [pc, #40]	; (8000b40 <uart_init+0x98>)
 8000b16:	9306      	str	r3, [sp, #24]
 8000b18:	9403      	str	r4, [sp, #12]
 8000b1a:	9404      	str	r4, [sp, #16]
 8000b1c:	9405      	str	r4, [sp, #20]
 8000b1e:	9407      	str	r4, [sp, #28]
 8000b20:	f000 fd58 	bl	80015d4 <USART_Init>
 8000b24:	4806      	ldr	r0, [pc, #24]	; (8000b40 <uart_init+0x98>)
 8000b26:	1c29      	adds	r1, r5, #0
 8000b28:	f000 fe22 	bl	8001770 <USART_Cmd>
 8000b2c:	b009      	add	sp, #36	; 0x24
 8000b2e:	bd30      	pop	{r4, r5, pc}
 8000b30:	200007bc 	.word	0x200007bc
 8000b34:	200007be 	.word	0x200007be
 8000b38:	200007ac 	.word	0x200007ac
 8000b3c:	00008004 	.word	0x00008004
 8000b40:	40013800 	.word	0x40013800

08000b44 <i2c_delay>:
 8000b44:	46c0      	nop			; (mov r8, r8)
 8000b46:	4770      	bx	lr

08000b48 <SetLowSDA>:
 8000b48:	b508      	push	{r3, lr}
 8000b4a:	b672      	cpsid	i
 8000b4c:	2390      	movs	r3, #144	; 0x90
 8000b4e:	2280      	movs	r2, #128	; 0x80
 8000b50:	05db      	lsls	r3, r3, #23
 8000b52:	0112      	lsls	r2, r2, #4
 8000b54:	851a      	strh	r2, [r3, #40]	; 0x28
 8000b56:	685a      	ldr	r2, [r3, #4]
 8000b58:	b292      	uxth	r2, r2
 8000b5a:	809a      	strh	r2, [r3, #4]
 8000b5c:	6819      	ldr	r1, [r3, #0]
 8000b5e:	2280      	movs	r2, #128	; 0x80
 8000b60:	03d2      	lsls	r2, r2, #15
 8000b62:	430a      	orrs	r2, r1
 8000b64:	601a      	str	r2, [r3, #0]
 8000b66:	b662      	cpsie	i
 8000b68:	f7ff ffec 	bl	8000b44 <i2c_delay>
 8000b6c:	bd08      	pop	{r3, pc}
	...

08000b70 <SetHighSDA>:
 8000b70:	b508      	push	{r3, lr}
 8000b72:	b672      	cpsid	i
 8000b74:	2390      	movs	r3, #144	; 0x90
 8000b76:	2280      	movs	r2, #128	; 0x80
 8000b78:	05db      	lsls	r3, r3, #23
 8000b7a:	0112      	lsls	r2, r2, #4
 8000b7c:	619a      	str	r2, [r3, #24]
 8000b7e:	6859      	ldr	r1, [r3, #4]
 8000b80:	4a05      	ldr	r2, [pc, #20]	; (8000b98 <SetHighSDA+0x28>)
 8000b82:	400a      	ands	r2, r1
 8000b84:	809a      	strh	r2, [r3, #4]
 8000b86:	6819      	ldr	r1, [r3, #0]
 8000b88:	4a04      	ldr	r2, [pc, #16]	; (8000b9c <SetHighSDA+0x2c>)
 8000b8a:	400a      	ands	r2, r1
 8000b8c:	601a      	str	r2, [r3, #0]
 8000b8e:	b662      	cpsie	i
 8000b90:	f7ff ffd8 	bl	8000b44 <i2c_delay>
 8000b94:	bd08      	pop	{r3, pc}
 8000b96:	46c0      	nop			; (mov r8, r8)
 8000b98:	0000f7ff 	.word	0x0000f7ff
 8000b9c:	ff3fffff 	.word	0xff3fffff

08000ba0 <SetLowSCL>:
 8000ba0:	b508      	push	{r3, lr}
 8000ba2:	2280      	movs	r2, #128	; 0x80
 8000ba4:	2390      	movs	r3, #144	; 0x90
 8000ba6:	0052      	lsls	r2, r2, #1
 8000ba8:	05db      	lsls	r3, r3, #23
 8000baa:	851a      	strh	r2, [r3, #40]	; 0x28
 8000bac:	f7ff ffca 	bl	8000b44 <i2c_delay>
 8000bb0:	bd08      	pop	{r3, pc}

08000bb2 <SetHighSCL>:
 8000bb2:	b508      	push	{r3, lr}
 8000bb4:	2280      	movs	r2, #128	; 0x80
 8000bb6:	2390      	movs	r3, #144	; 0x90
 8000bb8:	0052      	lsls	r2, r2, #1
 8000bba:	05db      	lsls	r3, r3, #23
 8000bbc:	619a      	str	r2, [r3, #24]
 8000bbe:	f7ff ffc1 	bl	8000b44 <i2c_delay>
 8000bc2:	bd08      	pop	{r3, pc}

08000bc4 <i2c_0_init>:
 8000bc4:	b507      	push	{r0, r1, r2, lr}
 8000bc6:	2390      	movs	r3, #144	; 0x90
 8000bc8:	011b      	lsls	r3, r3, #4
 8000bca:	4669      	mov	r1, sp
 8000bcc:	9300      	str	r3, [sp, #0]
 8000bce:	2090      	movs	r0, #144	; 0x90
 8000bd0:	2301      	movs	r3, #1
 8000bd2:	710b      	strb	r3, [r1, #4]
 8000bd4:	2203      	movs	r2, #3
 8000bd6:	2300      	movs	r3, #0
 8000bd8:	05c0      	lsls	r0, r0, #23
 8000bda:	718b      	strb	r3, [r1, #6]
 8000bdc:	714a      	strb	r2, [r1, #5]
 8000bde:	71cb      	strb	r3, [r1, #7]
 8000be0:	f000 fb18 	bl	8001214 <GPIO_Init>
 8000be4:	f7ff ffe5 	bl	8000bb2 <SetHighSCL>
 8000be8:	f7ff ffae 	bl	8000b48 <SetLowSDA>
 8000bec:	f7ff ffc0 	bl	8000b70 <SetHighSDA>
 8000bf0:	bd07      	pop	{r0, r1, r2, pc}

08000bf2 <i2cStart>:
 8000bf2:	b508      	push	{r3, lr}
 8000bf4:	f7ff ffdd 	bl	8000bb2 <SetHighSCL>
 8000bf8:	f7ff ffba 	bl	8000b70 <SetHighSDA>
 8000bfc:	f7ff ffd9 	bl	8000bb2 <SetHighSCL>
 8000c00:	f7ff ffa2 	bl	8000b48 <SetLowSDA>
 8000c04:	f7ff ffcc 	bl	8000ba0 <SetLowSCL>
 8000c08:	f7ff ffb2 	bl	8000b70 <SetHighSDA>
 8000c0c:	bd08      	pop	{r3, pc}

08000c0e <i2cStop>:
 8000c0e:	b508      	push	{r3, lr}
 8000c10:	f7ff ffc6 	bl	8000ba0 <SetLowSCL>
 8000c14:	f7ff ff98 	bl	8000b48 <SetLowSDA>
 8000c18:	f7ff ffcb 	bl	8000bb2 <SetHighSCL>
 8000c1c:	f7ff ff94 	bl	8000b48 <SetLowSDA>
 8000c20:	f7ff ffc7 	bl	8000bb2 <SetHighSCL>
 8000c24:	f7ff ffa4 	bl	8000b70 <SetHighSDA>
 8000c28:	bd08      	pop	{r3, pc}

08000c2a <i2cWrite>:
 8000c2a:	b538      	push	{r3, r4, r5, lr}
 8000c2c:	1c05      	adds	r5, r0, #0
 8000c2e:	2408      	movs	r4, #8
 8000c30:	f7ff ffb6 	bl	8000ba0 <SetLowSCL>
 8000c34:	b26b      	sxtb	r3, r5
 8000c36:	2b00      	cmp	r3, #0
 8000c38:	da02      	bge.n	8000c40 <i2cWrite+0x16>
 8000c3a:	f7ff ff99 	bl	8000b70 <SetHighSDA>
 8000c3e:	e001      	b.n	8000c44 <i2cWrite+0x1a>
 8000c40:	f7ff ff82 	bl	8000b48 <SetLowSDA>
 8000c44:	3c01      	subs	r4, #1
 8000c46:	006d      	lsls	r5, r5, #1
 8000c48:	b2e4      	uxtb	r4, r4
 8000c4a:	f7ff ffb2 	bl	8000bb2 <SetHighSCL>
 8000c4e:	b2ed      	uxtb	r5, r5
 8000c50:	2c00      	cmp	r4, #0
 8000c52:	d1ed      	bne.n	8000c30 <i2cWrite+0x6>
 8000c54:	f7ff ffa4 	bl	8000ba0 <SetLowSCL>
 8000c58:	f7ff ff8a 	bl	8000b70 <SetHighSDA>
 8000c5c:	f7ff ffa9 	bl	8000bb2 <SetHighSCL>
 8000c60:	2390      	movs	r3, #144	; 0x90
 8000c62:	05db      	lsls	r3, r3, #23
 8000c64:	691c      	ldr	r4, [r3, #16]
 8000c66:	f7ff ff9b 	bl	8000ba0 <SetLowSCL>
 8000c6a:	b2a4      	uxth	r4, r4
 8000c6c:	f7ff ff6a 	bl	8000b44 <i2c_delay>
 8000c70:	0ae4      	lsrs	r4, r4, #11
 8000c72:	2001      	movs	r0, #1
 8000c74:	43a0      	bics	r0, r4
 8000c76:	bd38      	pop	{r3, r4, r5, pc}

08000c78 <i2c_write_reg>:
 8000c78:	b570      	push	{r4, r5, r6, lr}
 8000c7a:	1c06      	adds	r6, r0, #0
 8000c7c:	1c0d      	adds	r5, r1, #0
 8000c7e:	1c14      	adds	r4, r2, #0
 8000c80:	f7ff ffb7 	bl	8000bf2 <i2cStart>
 8000c84:	1c30      	adds	r0, r6, #0
 8000c86:	f7ff ffd0 	bl	8000c2a <i2cWrite>
 8000c8a:	1c28      	adds	r0, r5, #0
 8000c8c:	f7ff ffcd 	bl	8000c2a <i2cWrite>
 8000c90:	1c20      	adds	r0, r4, #0
 8000c92:	f7ff ffca 	bl	8000c2a <i2cWrite>
 8000c96:	f7ff ffba 	bl	8000c0e <i2cStop>
 8000c9a:	bd70      	pop	{r4, r5, r6, pc}

08000c9c <ws2812_set_led>:
 8000c9c:	b530      	push	{r4, r5, lr}
 8000c9e:	2503      	movs	r5, #3
 8000ca0:	4368      	muls	r0, r5
 8000ca2:	4c03      	ldr	r4, [pc, #12]	; (8000cb0 <ws2812_set_led+0x14>)
 8000ca4:	5501      	strb	r1, [r0, r4]
 8000ca6:	1820      	adds	r0, r4, r0
 8000ca8:	7042      	strb	r2, [r0, #1]
 8000caa:	7083      	strb	r3, [r0, #2]
 8000cac:	bd30      	pop	{r4, r5, pc}
 8000cae:	46c0      	nop			; (mov r8, r8)
 8000cb0:	20000010 	.word	0x20000010

08000cb4 <ws2812_clear>:
 8000cb4:	2300      	movs	r3, #0
 8000cb6:	4905      	ldr	r1, [pc, #20]	; (8000ccc <ws2812_clear+0x18>)
 8000cb8:	2200      	movs	r2, #0
 8000cba:	545a      	strb	r2, [r3, r1]
 8000cbc:	18c9      	adds	r1, r1, r3
 8000cbe:	3303      	adds	r3, #3
 8000cc0:	704a      	strb	r2, [r1, #1]
 8000cc2:	708a      	strb	r2, [r1, #2]
 8000cc4:	2bc0      	cmp	r3, #192	; 0xc0
 8000cc6:	d1f6      	bne.n	8000cb6 <ws2812_clear+0x2>
 8000cc8:	4770      	bx	lr
 8000cca:	46c0      	nop			; (mov r8, r8)
 8000ccc:	20000010 	.word	0x20000010

08000cd0 <ws2812_refresh>:
 8000cd0:	b5f0      	push	{r4, r5, r6, r7, lr}
 8000cd2:	b085      	sub	sp, #20
 8000cd4:	b672      	cpsid	i
 8000cd6:	2400      	movs	r4, #0
 8000cd8:	4a15      	ldr	r2, [pc, #84]	; (8000d30 <ws2812_refresh+0x60>)
 8000cda:	ae03      	add	r6, sp, #12
 8000cdc:	1913      	adds	r3, r2, r4
 8000cde:	7859      	ldrb	r1, [r3, #1]
 8000ce0:	5ca2      	ldrb	r2, [r4, r2]
 8000ce2:	789b      	ldrb	r3, [r3, #2]
 8000ce4:	7031      	strb	r1, [r6, #0]
 8000ce6:	7072      	strb	r2, [r6, #1]
 8000ce8:	70b3      	strb	r3, [r6, #2]
 8000cea:	2500      	movs	r5, #0
 8000cec:	2308      	movs	r3, #8
 8000cee:	5d77      	ldrb	r7, [r6, r5]
 8000cf0:	9301      	str	r3, [sp, #4]
 8000cf2:	b27b      	sxtb	r3, r7
 8000cf4:	480f      	ldr	r0, [pc, #60]	; (8000d34 <ws2812_refresh+0x64>)
 8000cf6:	21f0      	movs	r1, #240	; 0xf0
 8000cf8:	2b00      	cmp	r3, #0
 8000cfa:	db00      	blt.n	8000cfe <ws2812_refresh+0x2e>
 8000cfc:	21c0      	movs	r1, #192	; 0xc0
 8000cfe:	f001 f8ef 	bl	8001ee0 <SPI_SendData8>
 8000d02:	9b01      	ldr	r3, [sp, #4]
 8000d04:	007f      	lsls	r7, r7, #1
 8000d06:	3b01      	subs	r3, #1
 8000d08:	b2ff      	uxtb	r7, r7
 8000d0a:	9301      	str	r3, [sp, #4]
 8000d0c:	2b00      	cmp	r3, #0
 8000d0e:	d1f0      	bne.n	8000cf2 <ws2812_refresh+0x22>
 8000d10:	3501      	adds	r5, #1
 8000d12:	2d03      	cmp	r5, #3
 8000d14:	d1ea      	bne.n	8000cec <ws2812_refresh+0x1c>
 8000d16:	3403      	adds	r4, #3
 8000d18:	2cc0      	cmp	r4, #192	; 0xc0
 8000d1a:	d1dd      	bne.n	8000cd8 <ws2812_refresh+0x8>
 8000d1c:	b662      	cpsie	i
 8000d1e:	4b06      	ldr	r3, [pc, #24]	; (8000d38 <ws2812_refresh+0x68>)
 8000d20:	3b01      	subs	r3, #1
 8000d22:	2b00      	cmp	r3, #0
 8000d24:	d001      	beq.n	8000d2a <ws2812_refresh+0x5a>
 8000d26:	46c0      	nop			; (mov r8, r8)
 8000d28:	e7fa      	b.n	8000d20 <ws2812_refresh+0x50>
 8000d2a:	b005      	add	sp, #20
 8000d2c:	bdf0      	pop	{r4, r5, r6, r7, pc}
 8000d2e:	46c0      	nop			; (mov r8, r8)
 8000d30:	20000010 	.word	0x20000010
 8000d34:	40013000 	.word	0x40013000
 8000d38:	00000961 	.word	0x00000961

08000d3c <ws2812_init>:
 8000d3c:	b5f0      	push	{r4, r5, r6, r7, lr}
 8000d3e:	2680      	movs	r6, #128	; 0x80
 8000d40:	0176      	lsls	r6, r6, #5
 8000d42:	b089      	sub	sp, #36	; 0x24
 8000d44:	1c30      	adds	r0, r6, #0
 8000d46:	2101      	movs	r1, #1
 8000d48:	f001 fa38 	bl	80021bc <RCC_APB2PeriphClockCmd>
 8000d4c:	4f1c      	ldr	r7, [pc, #112]	; (8000dc0 <ws2812_init+0x84>)
 8000d4e:	2320      	movs	r3, #32
 8000d50:	a901      	add	r1, sp, #4
 8000d52:	9301      	str	r3, [sp, #4]
 8000d54:	2302      	movs	r3, #2
 8000d56:	2400      	movs	r4, #0
 8000d58:	2501      	movs	r5, #1
 8000d5a:	710b      	strb	r3, [r1, #4]
 8000d5c:	1c38      	adds	r0, r7, #0
 8000d5e:	2303      	movs	r3, #3
 8000d60:	714b      	strb	r3, [r1, #5]
 8000d62:	718c      	strb	r4, [r1, #6]
 8000d64:	71cd      	strb	r5, [r1, #7]
 8000d66:	f000 fa55 	bl	8001214 <GPIO_Init>
 8000d6a:	1c22      	adds	r2, r4, #0
 8000d6c:	1c38      	adds	r0, r7, #0
 8000d6e:	2105      	movs	r1, #5
 8000d70:	f000 fad4 	bl	800131c <GPIO_PinAFConfig>
 8000d74:	2382      	movs	r3, #130	; 0x82
 8000d76:	a903      	add	r1, sp, #12
 8000d78:	40ab      	lsls	r3, r5
 8000d7a:	804b      	strh	r3, [r1, #2]
 8000d7c:	23e0      	movs	r3, #224	; 0xe0
 8000d7e:	00db      	lsls	r3, r3, #3
 8000d80:	808b      	strh	r3, [r1, #4]
 8000d82:	2302      	movs	r3, #2
 8000d84:	80cb      	strh	r3, [r1, #6]
 8000d86:	2380      	movs	r3, #128	; 0x80
 8000d88:	800c      	strh	r4, [r1, #0]
 8000d8a:	81cc      	strh	r4, [r1, #14]
 8000d8c:	009b      	lsls	r3, r3, #2
 8000d8e:	4c0d      	ldr	r4, [pc, #52]	; (8000dc4 <ws2812_init+0x88>)
 8000d90:	814b      	strh	r3, [r1, #10]
 8000d92:	2310      	movs	r3, #16
 8000d94:	818b      	strh	r3, [r1, #12]
 8000d96:	1c20      	adds	r0, r4, #0
 8000d98:	2307      	movs	r3, #7
 8000d9a:	820b      	strh	r3, [r1, #16]
 8000d9c:	810d      	strh	r5, [r1, #8]
 8000d9e:	f000 ffab 	bl	8001cf8 <SPI_Init>
 8000da2:	1c20      	adds	r0, r4, #0
 8000da4:	1c31      	adds	r1, r6, #0
 8000da6:	f001 f879 	bl	8001e9c <SPI_RxFIFOThresholdConfig>
 8000daa:	1c20      	adds	r0, r4, #0
 8000dac:	1c29      	adds	r1, r5, #0
 8000dae:	f001 f853 	bl	8001e58 <SPI_Cmd>
 8000db2:	f7ff ff7f 	bl	8000cb4 <ws2812_clear>
 8000db6:	f7ff ff8b 	bl	8000cd0 <ws2812_refresh>
 8000dba:	b009      	add	sp, #36	; 0x24
 8000dbc:	bdf0      	pop	{r4, r5, r6, r7, pc}
 8000dbe:	46c0      	nop			; (mov r8, r8)
 8000dc0:	48000400 	.word	0x48000400
 8000dc4:	40013000 	.word	0x40013000

08000dc8 <adc_random_seed>:
 8000dc8:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
 8000dca:	2400      	movs	r4, #0
 8000dcc:	1c25      	adds	r5, r4, #0
 8000dce:	2720      	movs	r7, #32
 8000dd0:	2600      	movs	r6, #0
 8000dd2:	2001      	movs	r0, #1
 8000dd4:	f000 fed2 	bl	8001b7c <ADC_TempSensorCmd>
 8000dd8:	2201      	movs	r2, #1
 8000dda:	402a      	ands	r2, r5
 8000ddc:	4815      	ldr	r0, [pc, #84]	; (8000e34 <adc_random_seed+0x6c>)
 8000dde:	2180      	movs	r1, #128	; 0x80
 8000de0:	2a00      	cmp	r2, #0
 8000de2:	d002      	beq.n	8000dea <adc_random_seed+0x22>
 8000de4:	0249      	lsls	r1, r1, #9
 8000de6:	2200      	movs	r2, #0
 8000de8:	e000      	b.n	8000dec <adc_random_seed+0x24>
 8000dea:	0289      	lsls	r1, r1, #10
 8000dec:	f000 fede 	bl	8001bac <ADC_ChannelConfig>
 8000df0:	4810      	ldr	r0, [pc, #64]	; (8000e34 <adc_random_seed+0x6c>)
 8000df2:	f000 ff1b 	bl	8001c2c <ADC_StartOfConversion>
 8000df6:	480f      	ldr	r0, [pc, #60]	; (8000e34 <adc_random_seed+0x6c>)
 8000df8:	2104      	movs	r1, #4
 8000dfa:	f000 ff35 	bl	8001c68 <ADC_GetFlagStatus>
 8000dfe:	2800      	cmp	r0, #0
 8000e00:	d101      	bne.n	8000e06 <adc_random_seed+0x3e>
 8000e02:	46c0      	nop			; (mov r8, r8)
 8000e04:	e7f7      	b.n	8000df6 <adc_random_seed+0x2e>
 8000e06:	480b      	ldr	r0, [pc, #44]	; (8000e34 <adc_random_seed+0x6c>)
 8000e08:	f000 ff20 	bl	8001c4c <ADC_GetConversionValue>
 8000e0c:	2301      	movs	r3, #1
 8000e0e:	4018      	ands	r0, r3
 8000e10:	0076      	lsls	r6, r6, #1
 8000e12:	2104      	movs	r1, #4
 8000e14:	4306      	orrs	r6, r0
 8000e16:	4807      	ldr	r0, [pc, #28]	; (8000e34 <adc_random_seed+0x6c>)
 8000e18:	f000 ff56 	bl	8001cc8 <ADC_ClearFlag>
 8000e1c:	3f01      	subs	r7, #1
 8000e1e:	2000      	movs	r0, #0
 8000e20:	f000 feac 	bl	8001b7c <ADC_TempSensorCmd>
 8000e24:	2f00      	cmp	r7, #0
 8000e26:	d1d4      	bne.n	8000dd2 <adc_random_seed+0xa>
 8000e28:	3501      	adds	r5, #1
 8000e2a:	4074      	eors	r4, r6
 8000e2c:	2d08      	cmp	r5, #8
 8000e2e:	d1ce      	bne.n	8000dce <adc_random_seed+0x6>
 8000e30:	1c20      	adds	r0, r4, #0
 8000e32:	bdf8      	pop	{r3, r4, r5, r6, r7, pc}
 8000e34:	40012400 	.word	0x40012400

08000e38 <adc_init>:
 8000e38:	b530      	push	{r4, r5, lr}
 8000e3a:	2090      	movs	r0, #144	; 0x90
 8000e3c:	b089      	sub	sp, #36	; 0x24
 8000e3e:	466a      	mov	r2, sp
 8000e40:	2303      	movs	r3, #3
 8000e42:	2401      	movs	r4, #1
 8000e44:	2500      	movs	r5, #0
 8000e46:	05c0      	lsls	r0, r0, #23
 8000e48:	4669      	mov	r1, sp
 8000e4a:	7113      	strb	r3, [r2, #4]
 8000e4c:	71d5      	strb	r5, [r2, #7]
 8000e4e:	9400      	str	r4, [sp, #0]
 8000e50:	f000 f9e0 	bl	8001214 <GPIO_Init>
 8000e54:	2080      	movs	r0, #128	; 0x80
 8000e56:	0080      	lsls	r0, r0, #2
 8000e58:	1c21      	adds	r1, r4, #0
 8000e5a:	f001 f9af 	bl	80021bc <RCC_APB2PeriphClockCmd>
 8000e5e:	1c28      	adds	r0, r5, #0
 8000e60:	f001 f8a0 	bl	8001fa4 <RCC_ADCCLKConfig>
 8000e64:	1c20      	adds	r0, r4, #0
 8000e66:	f001 f889 	bl	8001f7c <RCC_HSI14Cmd>
 8000e6a:	2061      	movs	r0, #97	; 0x61
 8000e6c:	f001 fa06 	bl	800227c <RCC_GetFlagStatus>
 8000e70:	2800      	cmp	r0, #0
 8000e72:	d101      	bne.n	8000e78 <adc_init+0x40>
 8000e74:	46c0      	nop			; (mov r8, r8)
 8000e76:	e7f8      	b.n	8000e6a <adc_init+0x32>
 8000e78:	4811      	ldr	r0, [pc, #68]	; (8000ec0 <adc_init+0x88>)
 8000e7a:	f000 fdf9 	bl	8001a70 <ADC_DeInit>
 8000e7e:	a902      	add	r1, sp, #8
 8000e80:	2300      	movs	r3, #0
 8000e82:	480f      	ldr	r0, [pc, #60]	; (8000ec0 <adc_init+0x88>)
 8000e84:	710b      	strb	r3, [r1, #4]
 8000e86:	610b      	str	r3, [r1, #16]
 8000e88:	614b      	str	r3, [r1, #20]
 8000e8a:	608b      	str	r3, [r1, #8]
 8000e8c:	60cb      	str	r3, [r1, #12]
 8000e8e:	9302      	str	r3, [sp, #8]
 8000e90:	f000 fe06 	bl	8001aa0 <ADC_Init>
 8000e94:	480a      	ldr	r0, [pc, #40]	; (8000ec0 <adc_init+0x88>)
 8000e96:	f000 fea9 	bl	8001bec <ADC_GetCalibrationFactor>
 8000e9a:	4809      	ldr	r0, [pc, #36]	; (8000ec0 <adc_init+0x88>)
 8000e9c:	2101      	movs	r1, #1
 8000e9e:	f000 fe51 	bl	8001b44 <ADC_Cmd>
 8000ea2:	4807      	ldr	r0, [pc, #28]	; (8000ec0 <adc_init+0x88>)
 8000ea4:	2101      	movs	r1, #1
 8000ea6:	f000 fedf 	bl	8001c68 <ADC_GetFlagStatus>
 8000eaa:	2800      	cmp	r0, #0
 8000eac:	d101      	bne.n	8000eb2 <adc_init+0x7a>
 8000eae:	46c0      	nop			; (mov r8, r8)
 8000eb0:	e7f7      	b.n	8000ea2 <adc_init+0x6a>
 8000eb2:	f7ff ff89 	bl	8000dc8 <adc_random_seed>
 8000eb6:	4b03      	ldr	r3, [pc, #12]	; (8000ec4 <adc_init+0x8c>)
 8000eb8:	6018      	str	r0, [r3, #0]
 8000eba:	b009      	add	sp, #36	; 0x24
 8000ebc:	bd30      	pop	{r4, r5, pc}
 8000ebe:	46c0      	nop			; (mov r8, r8)
 8000ec0:	40012400 	.word	0x40012400
 8000ec4:	200000d0 	.word	0x200000d0

08000ec8 <assert_param>:
 8000ec8:	4770      	bx	lr
	...

08000ecc <sys_tick_init>:
 8000ecc:	4b03      	ldr	r3, [pc, #12]	; (8000edc <sys_tick_init+0x10>)
 8000ece:	4a04      	ldr	r2, [pc, #16]	; (8000ee0 <sys_tick_init+0x14>)
 8000ed0:	605a      	str	r2, [r3, #4]
 8000ed2:	2200      	movs	r2, #0
 8000ed4:	609a      	str	r2, [r3, #8]
 8000ed6:	2207      	movs	r2, #7
 8000ed8:	601a      	str	r2, [r3, #0]
 8000eda:	4770      	bx	lr
 8000edc:	e000e010 	.word	0xe000e010
 8000ee0:	0000bb80 	.word	0x0000bb80

08000ee4 <sleep>:
 8000ee4:	bf30      	wfi
 8000ee6:	4770      	bx	lr

08000ee8 <SystemInit>:
 8000ee8:	4b26      	ldr	r3, [pc, #152]	; (8000f84 <SystemInit+0x9c>)
 8000eea:	2201      	movs	r2, #1
 8000eec:	6819      	ldr	r1, [r3, #0]
 8000eee:	b082      	sub	sp, #8
 8000ef0:	4311      	orrs	r1, r2
 8000ef2:	6019      	str	r1, [r3, #0]
 8000ef4:	6858      	ldr	r0, [r3, #4]
 8000ef6:	4924      	ldr	r1, [pc, #144]	; (8000f88 <SystemInit+0xa0>)
 8000ef8:	4001      	ands	r1, r0
 8000efa:	6059      	str	r1, [r3, #4]
 8000efc:	6818      	ldr	r0, [r3, #0]
 8000efe:	4923      	ldr	r1, [pc, #140]	; (8000f8c <SystemInit+0xa4>)
 8000f00:	4001      	ands	r1, r0
 8000f02:	6019      	str	r1, [r3, #0]
 8000f04:	6818      	ldr	r0, [r3, #0]
 8000f06:	4922      	ldr	r1, [pc, #136]	; (8000f90 <SystemInit+0xa8>)
 8000f08:	4001      	ands	r1, r0
 8000f0a:	6019      	str	r1, [r3, #0]
 8000f0c:	6858      	ldr	r0, [r3, #4]
 8000f0e:	4921      	ldr	r1, [pc, #132]	; (8000f94 <SystemInit+0xac>)
 8000f10:	4001      	ands	r1, r0
 8000f12:	6059      	str	r1, [r3, #4]
 8000f14:	6ad9      	ldr	r1, [r3, #44]	; 0x2c
 8000f16:	200f      	movs	r0, #15
 8000f18:	4381      	bics	r1, r0
 8000f1a:	62d9      	str	r1, [r3, #44]	; 0x2c
 8000f1c:	6b18      	ldr	r0, [r3, #48]	; 0x30
 8000f1e:	491e      	ldr	r1, [pc, #120]	; (8000f98 <SystemInit+0xb0>)
 8000f20:	4001      	ands	r1, r0
 8000f22:	6319      	str	r1, [r3, #48]	; 0x30
 8000f24:	6b59      	ldr	r1, [r3, #52]	; 0x34
 8000f26:	4391      	bics	r1, r2
 8000f28:	2200      	movs	r2, #0
 8000f2a:	6359      	str	r1, [r3, #52]	; 0x34
 8000f2c:	609a      	str	r2, [r3, #8]
 8000f2e:	9200      	str	r2, [sp, #0]
 8000f30:	9201      	str	r2, [sp, #4]
 8000f32:	4a1a      	ldr	r2, [pc, #104]	; (8000f9c <SystemInit+0xb4>)
 8000f34:	2111      	movs	r1, #17
 8000f36:	6011      	str	r1, [r2, #0]
 8000f38:	685a      	ldr	r2, [r3, #4]
 8000f3a:	605a      	str	r2, [r3, #4]
 8000f3c:	685a      	ldr	r2, [r3, #4]
 8000f3e:	605a      	str	r2, [r3, #4]
 8000f40:	6859      	ldr	r1, [r3, #4]
 8000f42:	4a17      	ldr	r2, [pc, #92]	; (8000fa0 <SystemInit+0xb8>)
 8000f44:	400a      	ands	r2, r1
 8000f46:	605a      	str	r2, [r3, #4]
 8000f48:	6859      	ldr	r1, [r3, #4]
 8000f4a:	22a0      	movs	r2, #160	; 0xa0
 8000f4c:	0392      	lsls	r2, r2, #14
 8000f4e:	430a      	orrs	r2, r1
 8000f50:	605a      	str	r2, [r3, #4]
 8000f52:	6819      	ldr	r1, [r3, #0]
 8000f54:	2280      	movs	r2, #128	; 0x80
 8000f56:	0452      	lsls	r2, r2, #17
 8000f58:	430a      	orrs	r2, r1
 8000f5a:	601a      	str	r2, [r3, #0]
 8000f5c:	6819      	ldr	r1, [r3, #0]
 8000f5e:	4a09      	ldr	r2, [pc, #36]	; (8000f84 <SystemInit+0x9c>)
 8000f60:	0188      	lsls	r0, r1, #6
 8000f62:	d5fb      	bpl.n	8000f5c <SystemInit+0x74>
 8000f64:	6851      	ldr	r1, [r2, #4]
 8000f66:	2003      	movs	r0, #3
 8000f68:	4381      	bics	r1, r0
 8000f6a:	6051      	str	r1, [r2, #4]
 8000f6c:	6851      	ldr	r1, [r2, #4]
 8000f6e:	2002      	movs	r0, #2
 8000f70:	4301      	orrs	r1, r0
 8000f72:	6051      	str	r1, [r2, #4]
 8000f74:	6859      	ldr	r1, [r3, #4]
 8000f76:	220c      	movs	r2, #12
 8000f78:	400a      	ands	r2, r1
 8000f7a:	2a08      	cmp	r2, #8
 8000f7c:	d1fa      	bne.n	8000f74 <SystemInit+0x8c>
 8000f7e:	b002      	add	sp, #8
 8000f80:	4770      	bx	lr
 8000f82:	46c0      	nop			; (mov r8, r8)
 8000f84:	40021000 	.word	0x40021000
 8000f88:	f8ffb80c 	.word	0xf8ffb80c
 8000f8c:	fef6ffff 	.word	0xfef6ffff
 8000f90:	fffbffff 	.word	0xfffbffff
 8000f94:	ffc0ffff 	.word	0xffc0ffff
 8000f98:	fffffeac 	.word	0xfffffeac
 8000f9c:	40022000 	.word	0x40022000
 8000fa0:	ffc07fff 	.word	0xffc07fff

08000fa4 <TIM16_IRQHandler>:
 8000fa4:	4b20      	ldr	r3, [pc, #128]	; (8001028 <TIM16_IRQHandler+0x84>)
 8000fa6:	799a      	ldrb	r2, [r3, #6]
 8000fa8:	78d9      	ldrb	r1, [r3, #3]
 8000faa:	4291      	cmp	r1, r2
 8000fac:	d805      	bhi.n	8000fba <TIM16_IRQHandler+0x16>
 8000fae:	2080      	movs	r0, #128	; 0x80
 8000fb0:	2190      	movs	r1, #144	; 0x90
 8000fb2:	0040      	lsls	r0, r0, #1
 8000fb4:	05c9      	lsls	r1, r1, #23
 8000fb6:	8508      	strh	r0, [r1, #40]	; 0x28
 8000fb8:	e006      	b.n	8000fc8 <TIM16_IRQHandler+0x24>
 8000fba:	2a00      	cmp	r2, #0
 8000fbc:	d104      	bne.n	8000fc8 <TIM16_IRQHandler+0x24>
 8000fbe:	2080      	movs	r0, #128	; 0x80
 8000fc0:	2190      	movs	r1, #144	; 0x90
 8000fc2:	0040      	lsls	r0, r0, #1
 8000fc4:	05c9      	lsls	r1, r1, #23
 8000fc6:	6188      	str	r0, [r1, #24]
 8000fc8:	7919      	ldrb	r1, [r3, #4]
 8000fca:	4291      	cmp	r1, r2
 8000fcc:	d805      	bhi.n	8000fda <TIM16_IRQHandler+0x36>
 8000fce:	2080      	movs	r0, #128	; 0x80
 8000fd0:	2190      	movs	r1, #144	; 0x90
 8000fd2:	0100      	lsls	r0, r0, #4
 8000fd4:	05c9      	lsls	r1, r1, #23
 8000fd6:	8508      	strh	r0, [r1, #40]	; 0x28
 8000fd8:	e006      	b.n	8000fe8 <TIM16_IRQHandler+0x44>
 8000fda:	2a00      	cmp	r2, #0
 8000fdc:	d104      	bne.n	8000fe8 <TIM16_IRQHandler+0x44>
 8000fde:	2080      	movs	r0, #128	; 0x80
 8000fe0:	2190      	movs	r1, #144	; 0x90
 8000fe2:	0100      	lsls	r0, r0, #4
 8000fe4:	05c9      	lsls	r1, r1, #23
 8000fe6:	6188      	str	r0, [r1, #24]
 8000fe8:	7959      	ldrb	r1, [r3, #5]
 8000fea:	4291      	cmp	r1, r2
 8000fec:	d806      	bhi.n	8000ffc <TIM16_IRQHandler+0x58>
 8000fee:	2190      	movs	r1, #144	; 0x90
 8000ff0:	2002      	movs	r0, #2
 8000ff2:	05c9      	lsls	r1, r1, #23
 8000ff4:	8508      	strh	r0, [r1, #40]	; 0x28
 8000ff6:	2a00      	cmp	r2, #0
 8000ff8:	d006      	beq.n	8001008 <TIM16_IRQHandler+0x64>
 8000ffa:	e00b      	b.n	8001014 <TIM16_IRQHandler+0x70>
 8000ffc:	2a00      	cmp	r2, #0
 8000ffe:	d109      	bne.n	8001014 <TIM16_IRQHandler+0x70>
 8001000:	2190      	movs	r1, #144	; 0x90
 8001002:	2002      	movs	r0, #2
 8001004:	05c9      	lsls	r1, r1, #23
 8001006:	6188      	str	r0, [r1, #24]
 8001008:	7819      	ldrb	r1, [r3, #0]
 800100a:	70d9      	strb	r1, [r3, #3]
 800100c:	7859      	ldrb	r1, [r3, #1]
 800100e:	7119      	strb	r1, [r3, #4]
 8001010:	7899      	ldrb	r1, [r3, #2]
 8001012:	7159      	strb	r1, [r3, #5]
 8001014:	3201      	adds	r2, #1
 8001016:	b2d2      	uxtb	r2, r2
 8001018:	2a10      	cmp	r2, #16
 800101a:	d900      	bls.n	800101e <TIM16_IRQHandler+0x7a>
 800101c:	2200      	movs	r2, #0
 800101e:	719a      	strb	r2, [r3, #6]
 8001020:	4b02      	ldr	r3, [pc, #8]	; (800102c <TIM16_IRQHandler+0x88>)
 8001022:	2200      	movs	r2, #0
 8001024:	821a      	strh	r2, [r3, #16]
 8001026:	4770      	bx	lr
 8001028:	20000134 	.word	0x20000134
 800102c:	40014400 	.word	0x40014400

08001030 <lib_low_level_init>:
 8001030:	b508      	push	{r3, lr}
 8001032:	f7ff ff59 	bl	8000ee8 <SystemInit>
 8001036:	f001 f957 	bl	80022e8 <gpio_init>
 800103a:	f7ff fd35 	bl	8000aa8 <uart_init>
 800103e:	f7ff fc7f 	bl	8000940 <timer_init>
 8001042:	f7ff fdbf 	bl	8000bc4 <i2c_0_init>
 8001046:	f7ff fef7 	bl	8000e38 <adc_init>
 800104a:	bd08      	pop	{r3, pc}

0800104c <TIM14_IRQHandler>:
 800104c:	b570      	push	{r4, r5, r6, lr}
 800104e:	4b60      	ldr	r3, [pc, #384]	; (80011d0 <TIM14_IRQHandler+0x184>)
 8001050:	7818      	ldrb	r0, [r3, #0]
 8001052:	b2c0      	uxtb	r0, r0
 8001054:	2803      	cmp	r0, #3
 8001056:	d83f      	bhi.n	80010d8 <TIM14_IRQHandler+0x8c>
 8001058:	f001 f9e8 	bl	800242c <__gnu_thumb1_case_uqi>
 800105c:	32220a02 	.word	0x32220a02
 8001060:	2280      	movs	r2, #128	; 0x80
 8001062:	2390      	movs	r3, #144	; 0x90
 8001064:	0052      	lsls	r2, r2, #1
 8001066:	05db      	lsls	r3, r3, #23
 8001068:	851a      	strh	r2, [r3, #40]	; 0x28
 800106a:	2200      	movs	r2, #0
 800106c:	4b59      	ldr	r3, [pc, #356]	; (80011d4 <TIM14_IRQHandler+0x188>)
 800106e:	e032      	b.n	80010d6 <TIM14_IRQHandler+0x8a>
 8001070:	4a58      	ldr	r2, [pc, #352]	; (80011d4 <TIM14_IRQHandler+0x188>)
 8001072:	7811      	ldrb	r1, [r2, #0]
 8001074:	290d      	cmp	r1, #13
 8001076:	d901      	bls.n	800107c <TIM14_IRQHandler+0x30>
 8001078:	2200      	movs	r2, #0
 800107a:	e02c      	b.n	80010d6 <TIM14_IRQHandler+0x8a>
 800107c:	7811      	ldrb	r1, [r2, #0]
 800107e:	4856      	ldr	r0, [pc, #344]	; (80011d8 <TIM14_IRQHandler+0x18c>)
 8001080:	5c41      	ldrb	r1, [r0, r1]
 8001082:	20ff      	movs	r0, #255	; 0xff
 8001084:	4388      	bics	r0, r1
 8001086:	0040      	lsls	r0, r0, #1
 8001088:	2101      	movs	r1, #1
 800108a:	4308      	orrs	r0, r1
 800108c:	4953      	ldr	r1, [pc, #332]	; (80011dc <TIM14_IRQHandler+0x190>)
 800108e:	8008      	strh	r0, [r1, #0]
 8001090:	7811      	ldrb	r1, [r2, #0]
 8001092:	3101      	adds	r1, #1
 8001094:	b2c9      	uxtb	r1, r1
 8001096:	7011      	strb	r1, [r2, #0]
 8001098:	4a51      	ldr	r2, [pc, #324]	; (80011e0 <TIM14_IRQHandler+0x194>)
 800109a:	2100      	movs	r1, #0
 800109c:	7011      	strb	r1, [r2, #0]
 800109e:	e019      	b.n	80010d4 <TIM14_IRQHandler+0x88>
 80010a0:	4a4e      	ldr	r2, [pc, #312]	; (80011dc <TIM14_IRQHandler+0x190>)
 80010a2:	2190      	movs	r1, #144	; 0x90
 80010a4:	8814      	ldrh	r4, [r2, #0]
 80010a6:	2080      	movs	r0, #128	; 0x80
 80010a8:	05c9      	lsls	r1, r1, #23
 80010aa:	0040      	lsls	r0, r0, #1
 80010ac:	07e5      	lsls	r5, r4, #31
 80010ae:	d501      	bpl.n	80010b4 <TIM14_IRQHandler+0x68>
 80010b0:	6188      	str	r0, [r1, #24]
 80010b2:	e000      	b.n	80010b6 <TIM14_IRQHandler+0x6a>
 80010b4:	8508      	strh	r0, [r1, #40]	; 0x28
 80010b6:	8811      	ldrh	r1, [r2, #0]
 80010b8:	0849      	lsrs	r1, r1, #1
 80010ba:	8011      	strh	r1, [r2, #0]
 80010bc:	2203      	movs	r2, #3
 80010be:	e00a      	b.n	80010d6 <TIM14_IRQHandler+0x8a>
 80010c0:	4a47      	ldr	r2, [pc, #284]	; (80011e0 <TIM14_IRQHandler+0x194>)
 80010c2:	7811      	ldrb	r1, [r2, #0]
 80010c4:	3101      	adds	r1, #1
 80010c6:	b2c9      	uxtb	r1, r1
 80010c8:	7011      	strb	r1, [r2, #0]
 80010ca:	7812      	ldrb	r2, [r2, #0]
 80010cc:	2a09      	cmp	r2, #9
 80010ce:	d901      	bls.n	80010d4 <TIM14_IRQHandler+0x88>
 80010d0:	2201      	movs	r2, #1
 80010d2:	e000      	b.n	80010d6 <TIM14_IRQHandler+0x8a>
 80010d4:	2202      	movs	r2, #2
 80010d6:	701a      	strb	r2, [r3, #0]
 80010d8:	4b42      	ldr	r3, [pc, #264]	; (80011e4 <TIM14_IRQHandler+0x198>)
 80010da:	2104      	movs	r1, #4
 80010dc:	6c1a      	ldr	r2, [r3, #64]	; 0x40
 80010de:	6019      	str	r1, [r3, #0]
 80010e0:	6898      	ldr	r0, [r3, #8]
 80010e2:	4301      	orrs	r1, r0
 80010e4:	6099      	str	r1, [r3, #8]
 80010e6:	4b40      	ldr	r3, [pc, #256]	; (80011e8 <TIM14_IRQHandler+0x19c>)
 80010e8:	2101      	movs	r1, #1
 80010ea:	429a      	cmp	r2, r3
 80010ec:	d80b      	bhi.n	8001106 <TIM14_IRQHandler+0xba>
 80010ee:	4b3f      	ldr	r3, [pc, #252]	; (80011ec <TIM14_IRQHandler+0x1a0>)
 80010f0:	2480      	movs	r4, #128	; 0x80
 80010f2:	6818      	ldr	r0, [r3, #0]
 80010f4:	0164      	lsls	r4, r4, #5
 80010f6:	1901      	adds	r1, r0, r4
 80010f8:	1a8a      	subs	r2, r1, r2
 80010fa:	601a      	str	r2, [r3, #0]
 80010fc:	4b3c      	ldr	r3, [pc, #240]	; (80011f0 <TIM14_IRQHandler+0x1a4>)
 80010fe:	2100      	movs	r1, #0
 8001100:	681a      	ldr	r2, [r3, #0]
 8001102:	3201      	adds	r2, #1
 8001104:	601a      	str	r2, [r3, #0]
 8001106:	4b3b      	ldr	r3, [pc, #236]	; (80011f4 <TIM14_IRQHandler+0x1a8>)
 8001108:	7818      	ldrb	r0, [r3, #0]
 800110a:	b2c0      	uxtb	r0, r0
 800110c:	2804      	cmp	r0, #4
 800110e:	d85a      	bhi.n	80011c6 <TIM14_IRQHandler+0x17a>
 8001110:	f001 f98c 	bl	800242c <__gnu_thumb1_case_uqi>
 8001114:	36110603 	.word	0x36110603
 8001118:	38          	.byte	0x38
 8001119:	00          	.byte	0x00
 800111a:	2200      	movs	r2, #0
 800111c:	4b36      	ldr	r3, [pc, #216]	; (80011f8 <TIM14_IRQHandler+0x1ac>)
 800111e:	e051      	b.n	80011c4 <TIM14_IRQHandler+0x178>
 8001120:	4a35      	ldr	r2, [pc, #212]	; (80011f8 <TIM14_IRQHandler+0x1ac>)
 8001122:	7811      	ldrb	r1, [r2, #0]
 8001124:	2200      	movs	r2, #0
 8001126:	290d      	cmp	r1, #13
 8001128:	d84c      	bhi.n	80011c4 <TIM14_IRQHandler+0x178>
 800112a:	4934      	ldr	r1, [pc, #208]	; (80011fc <TIM14_IRQHandler+0x1b0>)
 800112c:	800a      	strh	r2, [r1, #0]
 800112e:	4934      	ldr	r1, [pc, #208]	; (8001200 <TIM14_IRQHandler+0x1b4>)
 8001130:	700a      	strb	r2, [r1, #0]
 8001132:	2202      	movs	r2, #2
 8001134:	e046      	b.n	80011c4 <TIM14_IRQHandler+0x178>
 8001136:	4a33      	ldr	r2, [pc, #204]	; (8001204 <TIM14_IRQHandler+0x1b8>)
 8001138:	2900      	cmp	r1, #0
 800113a:	d103      	bne.n	8001144 <TIM14_IRQHandler+0xf8>
 800113c:	2003      	movs	r0, #3
 800113e:	7018      	strb	r0, [r3, #0]
 8001140:	6011      	str	r1, [r2, #0]
 8001142:	e040      	b.n	80011c6 <TIM14_IRQHandler+0x17a>
 8001144:	6811      	ldr	r1, [r2, #0]
 8001146:	3101      	adds	r1, #1
 8001148:	6011      	str	r1, [r2, #0]
 800114a:	6810      	ldr	r0, [r2, #0]
 800114c:	21d2      	movs	r1, #210	; 0xd2
 800114e:	0049      	lsls	r1, r1, #1
 8001150:	4288      	cmp	r0, r1
 8001152:	d938      	bls.n	80011c6 <TIM14_IRQHandler+0x17a>
 8001154:	2100      	movs	r1, #0
 8001156:	6011      	str	r1, [r2, #0]
 8001158:	4e25      	ldr	r6, [pc, #148]	; (80011f0 <TIM14_IRQHandler+0x1a4>)
 800115a:	4a27      	ldr	r2, [pc, #156]	; (80011f8 <TIM14_IRQHandler+0x1ac>)
 800115c:	4c23      	ldr	r4, [pc, #140]	; (80011ec <TIM14_IRQHandler+0x1a0>)
 800115e:	7011      	strb	r1, [r2, #0]
 8001160:	6831      	ldr	r1, [r6, #0]
 8001162:	2201      	movs	r2, #1
 8001164:	701a      	strb	r2, [r3, #0]
 8001166:	4d28      	ldr	r5, [pc, #160]	; (8001208 <TIM14_IRQHandler+0x1bc>)
 8001168:	2900      	cmp	r1, #0
 800116a:	d004      	beq.n	8001176 <TIM14_IRQHandler+0x12a>
 800116c:	6820      	ldr	r0, [r4, #0]
 800116e:	f001 f967 	bl	8002440 <__aeabi_uidiv>
 8001172:	6028      	str	r0, [r5, #0]
 8001174:	e000      	b.n	8001178 <TIM14_IRQHandler+0x12c>
 8001176:	6029      	str	r1, [r5, #0]
 8001178:	2300      	movs	r3, #0
 800117a:	6023      	str	r3, [r4, #0]
 800117c:	6033      	str	r3, [r6, #0]
 800117e:	e022      	b.n	80011c6 <TIM14_IRQHandler+0x17a>
 8001180:	2204      	movs	r2, #4
 8001182:	e01f      	b.n	80011c4 <TIM14_IRQHandler+0x178>
 8001184:	4a1e      	ldr	r2, [pc, #120]	; (8001200 <TIM14_IRQHandler+0x1b4>)
 8001186:	2900      	cmp	r1, #0
 8001188:	d008      	beq.n	800119c <TIM14_IRQHandler+0x150>
 800118a:	491c      	ldr	r1, [pc, #112]	; (80011fc <TIM14_IRQHandler+0x1b0>)
 800118c:	2501      	movs	r5, #1
 800118e:	880c      	ldrh	r4, [r1, #0]
 8001190:	7810      	ldrb	r0, [r2, #0]
 8001192:	4085      	lsls	r5, r0
 8001194:	1c28      	adds	r0, r5, #0
 8001196:	4320      	orrs	r0, r4
 8001198:	b280      	uxth	r0, r0
 800119a:	8008      	strh	r0, [r1, #0]
 800119c:	7811      	ldrb	r1, [r2, #0]
 800119e:	3101      	adds	r1, #1
 80011a0:	b2c9      	uxtb	r1, r1
 80011a2:	7011      	strb	r1, [r2, #0]
 80011a4:	7812      	ldrb	r2, [r2, #0]
 80011a6:	2a07      	cmp	r2, #7
 80011a8:	d90b      	bls.n	80011c2 <TIM14_IRQHandler+0x176>
 80011aa:	4a13      	ldr	r2, [pc, #76]	; (80011f8 <TIM14_IRQHandler+0x1ac>)
 80011ac:	4813      	ldr	r0, [pc, #76]	; (80011fc <TIM14_IRQHandler+0x1b0>)
 80011ae:	7811      	ldrb	r1, [r2, #0]
 80011b0:	8804      	ldrh	r4, [r0, #0]
 80011b2:	4816      	ldr	r0, [pc, #88]	; (800120c <TIM14_IRQHandler+0x1c0>)
 80011b4:	5444      	strb	r4, [r0, r1]
 80011b6:	7811      	ldrb	r1, [r2, #0]
 80011b8:	3101      	adds	r1, #1
 80011ba:	b2c9      	uxtb	r1, r1
 80011bc:	7011      	strb	r1, [r2, #0]
 80011be:	2201      	movs	r2, #1
 80011c0:	e000      	b.n	80011c4 <TIM14_IRQHandler+0x178>
 80011c2:	2203      	movs	r2, #3
 80011c4:	701a      	strb	r2, [r3, #0]
 80011c6:	4b12      	ldr	r3, [pc, #72]	; (8001210 <TIM14_IRQHandler+0x1c4>)
 80011c8:	2200      	movs	r2, #0
 80011ca:	821a      	strh	r2, [r3, #16]
 80011cc:	bd70      	pop	{r4, r5, r6, pc}
 80011ce:	46c0      	nop			; (mov r8, r8)
 80011d0:	200007c3 	.word	0x200007c3
 80011d4:	200007c2 	.word	0x200007c2
 80011d8:	2000014e 	.word	0x2000014e
 80011dc:	200007ca 	.word	0x200007ca
 80011e0:	200007d8 	.word	0x200007d8
 80011e4:	40012400 	.word	0x40012400
 80011e8:	000003e7 	.word	0x000003e7
 80011ec:	200007d4 	.word	0x200007d4
 80011f0:	200007dc 	.word	0x200007dc
 80011f4:	200007c8 	.word	0x200007c8
 80011f8:	200007cc 	.word	0x200007cc
 80011fc:	200007c0 	.word	0x200007c0
 8001200:	200007cd 	.word	0x200007cd
 8001204:	200007d0 	.word	0x200007d0
 8001208:	200007c4 	.word	0x200007c4
 800120c:	20000140 	.word	0x20000140
 8001210:	40002000 	.word	0x40002000

08001214 <GPIO_Init>:
 8001214:	2390      	movs	r3, #144	; 0x90
 8001216:	b5f7      	push	{r0, r1, r2, r4, r5, r6, r7, lr}
 8001218:	05db      	lsls	r3, r3, #23
 800121a:	1c04      	adds	r4, r0, #0
 800121c:	1c0d      	adds	r5, r1, #0
 800121e:	4298      	cmp	r0, r3
 8001220:	d010      	beq.n	8001244 <GPIO_Init+0x30>
 8001222:	4b39      	ldr	r3, [pc, #228]	; (8001308 <GPIO_Init+0xf4>)
 8001224:	4298      	cmp	r0, r3
 8001226:	d00d      	beq.n	8001244 <GPIO_Init+0x30>
 8001228:	4b38      	ldr	r3, [pc, #224]	; (800130c <GPIO_Init+0xf8>)
 800122a:	4298      	cmp	r0, r3
 800122c:	d00a      	beq.n	8001244 <GPIO_Init+0x30>
 800122e:	4b38      	ldr	r3, [pc, #224]	; (8001310 <GPIO_Init+0xfc>)
 8001230:	4298      	cmp	r0, r3
 8001232:	d007      	beq.n	8001244 <GPIO_Init+0x30>
 8001234:	4b37      	ldr	r3, [pc, #220]	; (8001314 <GPIO_Init+0x100>)
 8001236:	4298      	cmp	r0, r3
 8001238:	d004      	beq.n	8001244 <GPIO_Init+0x30>
 800123a:	4a37      	ldr	r2, [pc, #220]	; (8001318 <GPIO_Init+0x104>)
 800123c:	1880      	adds	r0, r0, r2
 800123e:	4243      	negs	r3, r0
 8001240:	4158      	adcs	r0, r3
 8001242:	e000      	b.n	8001246 <GPIO_Init+0x32>
 8001244:	2001      	movs	r0, #1
 8001246:	f7ff fe3f 	bl	8000ec8 <assert_param>
 800124a:	6828      	ldr	r0, [r5, #0]
 800124c:	2600      	movs	r6, #0
 800124e:	1e43      	subs	r3, r0, #1
 8001250:	4198      	sbcs	r0, r3
 8001252:	f7ff fe39 	bl	8000ec8 <assert_param>
 8001256:	792b      	ldrb	r3, [r5, #4]
 8001258:	2203      	movs	r2, #3
 800125a:	1c30      	adds	r0, r6, #0
 800125c:	429a      	cmp	r2, r3
 800125e:	4170      	adcs	r0, r6
 8001260:	f7ff fe32 	bl	8000ec8 <assert_param>
 8001264:	79eb      	ldrb	r3, [r5, #7]
 8001266:	2202      	movs	r2, #2
 8001268:	1c30      	adds	r0, r6, #0
 800126a:	429a      	cmp	r2, r3
 800126c:	4170      	adcs	r0, r6
 800126e:	f7ff fe2b 	bl	8000ec8 <assert_param>
 8001272:	2001      	movs	r0, #1
 8001274:	1c03      	adds	r3, r0, #0
 8001276:	682a      	ldr	r2, [r5, #0]
 8001278:	40b3      	lsls	r3, r6
 800127a:	401a      	ands	r2, r3
 800127c:	9201      	str	r2, [sp, #4]
 800127e:	429a      	cmp	r2, r3
 8001280:	d13d      	bne.n	80012fe <GPIO_Init+0xea>
 8001282:	792b      	ldrb	r3, [r5, #4]
 8001284:	0077      	lsls	r7, r6, #1
 8001286:	3b01      	subs	r3, #1
 8001288:	b2db      	uxtb	r3, r3
 800128a:	4283      	cmp	r3, r0
 800128c:	d823      	bhi.n	80012d6 <GPIO_Init+0xc2>
 800128e:	796b      	ldrb	r3, [r5, #5]
 8001290:	4283      	cmp	r3, r0
 8001292:	d902      	bls.n	800129a <GPIO_Init+0x86>
 8001294:	1ed8      	subs	r0, r3, #3
 8001296:	4243      	negs	r3, r0
 8001298:	4158      	adcs	r0, r3
 800129a:	f7ff fe15 	bl	8000ec8 <assert_param>
 800129e:	68a3      	ldr	r3, [r4, #8]
 80012a0:	2203      	movs	r2, #3
 80012a2:	40ba      	lsls	r2, r7
 80012a4:	4393      	bics	r3, r2
 80012a6:	60a3      	str	r3, [r4, #8]
 80012a8:	796b      	ldrb	r3, [r5, #5]
 80012aa:	68a2      	ldr	r2, [r4, #8]
 80012ac:	40bb      	lsls	r3, r7
 80012ae:	4313      	orrs	r3, r2
 80012b0:	60a3      	str	r3, [r4, #8]
 80012b2:	79ab      	ldrb	r3, [r5, #6]
 80012b4:	2201      	movs	r2, #1
 80012b6:	2000      	movs	r0, #0
 80012b8:	429a      	cmp	r2, r3
 80012ba:	4140      	adcs	r0, r0
 80012bc:	f7ff fe04 	bl	8000ec8 <assert_param>
 80012c0:	6863      	ldr	r3, [r4, #4]
 80012c2:	9a01      	ldr	r2, [sp, #4]
 80012c4:	b29b      	uxth	r3, r3
 80012c6:	4393      	bics	r3, r2
 80012c8:	80a3      	strh	r3, [r4, #4]
 80012ca:	79ab      	ldrb	r3, [r5, #6]
 80012cc:	6862      	ldr	r2, [r4, #4]
 80012ce:	40b3      	lsls	r3, r6
 80012d0:	4313      	orrs	r3, r2
 80012d2:	b29b      	uxth	r3, r3
 80012d4:	80a3      	strh	r3, [r4, #4]
 80012d6:	2303      	movs	r3, #3
 80012d8:	6822      	ldr	r2, [r4, #0]
 80012da:	40bb      	lsls	r3, r7
 80012dc:	43db      	mvns	r3, r3
 80012de:	401a      	ands	r2, r3
 80012e0:	6022      	str	r2, [r4, #0]
 80012e2:	792a      	ldrb	r2, [r5, #4]
 80012e4:	6821      	ldr	r1, [r4, #0]
 80012e6:	40ba      	lsls	r2, r7
 80012e8:	430a      	orrs	r2, r1
 80012ea:	6022      	str	r2, [r4, #0]
 80012ec:	68e2      	ldr	r2, [r4, #12]
 80012ee:	4013      	ands	r3, r2
 80012f0:	79ea      	ldrb	r2, [r5, #7]
 80012f2:	60e3      	str	r3, [r4, #12]
 80012f4:	68e3      	ldr	r3, [r4, #12]
 80012f6:	40ba      	lsls	r2, r7
 80012f8:	1c17      	adds	r7, r2, #0
 80012fa:	431f      	orrs	r7, r3
 80012fc:	60e7      	str	r7, [r4, #12]
 80012fe:	3601      	adds	r6, #1
 8001300:	2e10      	cmp	r6, #16
 8001302:	d1b6      	bne.n	8001272 <GPIO_Init+0x5e>
 8001304:	bdf7      	pop	{r0, r1, r2, r4, r5, r6, r7, pc}
 8001306:	46c0      	nop			; (mov r8, r8)
 8001308:	48000400 	.word	0x48000400
 800130c:	48000800 	.word	0x48000800
 8001310:	48000c00 	.word	0x48000c00
 8001314:	48001000 	.word	0x48001000
 8001318:	b7ffec00 	.word	0xb7ffec00

0800131c <GPIO_PinAFConfig>:
 800131c:	b5f7      	push	{r0, r1, r2, r4, r5, r6, r7, lr}
 800131e:	2390      	movs	r3, #144	; 0x90
 8001320:	1c04      	adds	r4, r0, #0
 8001322:	1c0e      	adds	r6, r1, #0
 8001324:	9201      	str	r2, [sp, #4]
 8001326:	05db      	lsls	r3, r3, #23
 8001328:	4298      	cmp	r0, r3
 800132a:	d010      	beq.n	800134e <GPIO_PinAFConfig+0x32>
 800132c:	4b19      	ldr	r3, [pc, #100]	; (8001394 <GPIO_PinAFConfig+0x78>)
 800132e:	4298      	cmp	r0, r3
 8001330:	d00d      	beq.n	800134e <GPIO_PinAFConfig+0x32>
 8001332:	4b19      	ldr	r3, [pc, #100]	; (8001398 <GPIO_PinAFConfig+0x7c>)
 8001334:	4298      	cmp	r0, r3
 8001336:	d00a      	beq.n	800134e <GPIO_PinAFConfig+0x32>
 8001338:	4b18      	ldr	r3, [pc, #96]	; (800139c <GPIO_PinAFConfig+0x80>)
 800133a:	4298      	cmp	r0, r3
 800133c:	d007      	beq.n	800134e <GPIO_PinAFConfig+0x32>
 800133e:	4b18      	ldr	r3, [pc, #96]	; (80013a0 <GPIO_PinAFConfig+0x84>)
 8001340:	4298      	cmp	r0, r3
 8001342:	d004      	beq.n	800134e <GPIO_PinAFConfig+0x32>
 8001344:	4a17      	ldr	r2, [pc, #92]	; (80013a4 <GPIO_PinAFConfig+0x88>)
 8001346:	1880      	adds	r0, r0, r2
 8001348:	4243      	negs	r3, r0
 800134a:	4158      	adcs	r0, r3
 800134c:	e000      	b.n	8001350 <GPIO_PinAFConfig+0x34>
 800134e:	2001      	movs	r0, #1
 8001350:	2500      	movs	r5, #0
 8001352:	f7ff fdb9 	bl	8000ec8 <assert_param>
 8001356:	230f      	movs	r3, #15
 8001358:	1c28      	adds	r0, r5, #0
 800135a:	42b3      	cmp	r3, r6
 800135c:	4168      	adcs	r0, r5
 800135e:	f7ff fdb3 	bl	8000ec8 <assert_param>
 8001362:	9a01      	ldr	r2, [sp, #4]
 8001364:	1c28      	adds	r0, r5, #0
 8001366:	2707      	movs	r7, #7
 8001368:	4297      	cmp	r7, r2
 800136a:	4168      	adcs	r0, r5
 800136c:	4037      	ands	r7, r6
 800136e:	08f6      	lsrs	r6, r6, #3
 8001370:	00b6      	lsls	r6, r6, #2
 8001372:	19a4      	adds	r4, r4, r6
 8001374:	f7ff fda8 	bl	8000ec8 <assert_param>
 8001378:	00bf      	lsls	r7, r7, #2
 800137a:	6a23      	ldr	r3, [r4, #32]
 800137c:	220f      	movs	r2, #15
 800137e:	40ba      	lsls	r2, r7
 8001380:	4393      	bics	r3, r2
 8001382:	9a01      	ldr	r2, [sp, #4]
 8001384:	6223      	str	r3, [r4, #32]
 8001386:	6a23      	ldr	r3, [r4, #32]
 8001388:	40ba      	lsls	r2, r7
 800138a:	1c17      	adds	r7, r2, #0
 800138c:	431f      	orrs	r7, r3
 800138e:	6227      	str	r7, [r4, #32]
 8001390:	bdf7      	pop	{r0, r1, r2, r4, r5, r6, r7, pc}
 8001392:	46c0      	nop			; (mov r8, r8)
 8001394:	48000400 	.word	0x48000400
 8001398:	48000800 	.word	0x48000800
 800139c:	48000c00 	.word	0x48000c00
 80013a0:	48001000 	.word	0x48001000
 80013a4:	b7ffec00 	.word	0xb7ffec00

080013a8 <TIM_TimeBaseInit>:
 80013a8:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
 80013aa:	4e34      	ldr	r6, [pc, #208]	; (800147c <TIM_TimeBaseInit+0xd4>)
 80013ac:	1c04      	adds	r4, r0, #0
 80013ae:	1c0d      	adds	r5, r1, #0
 80013b0:	4f33      	ldr	r7, [pc, #204]	; (8001480 <TIM_TimeBaseInit+0xd8>)
 80013b2:	42b0      	cmp	r0, r6
 80013b4:	d019      	beq.n	80013ea <TIM_TimeBaseInit+0x42>
 80013b6:	2380      	movs	r3, #128	; 0x80
 80013b8:	05db      	lsls	r3, r3, #23
 80013ba:	4298      	cmp	r0, r3
 80013bc:	d015      	beq.n	80013ea <TIM_TimeBaseInit+0x42>
 80013be:	4b31      	ldr	r3, [pc, #196]	; (8001484 <TIM_TimeBaseInit+0xdc>)
 80013c0:	4298      	cmp	r0, r3
 80013c2:	d012      	beq.n	80013ea <TIM_TimeBaseInit+0x42>
 80013c4:	42b8      	cmp	r0, r7
 80013c6:	d010      	beq.n	80013ea <TIM_TimeBaseInit+0x42>
 80013c8:	4b2f      	ldr	r3, [pc, #188]	; (8001488 <TIM_TimeBaseInit+0xe0>)
 80013ca:	4298      	cmp	r0, r3
 80013cc:	d00d      	beq.n	80013ea <TIM_TimeBaseInit+0x42>
 80013ce:	4b2f      	ldr	r3, [pc, #188]	; (800148c <TIM_TimeBaseInit+0xe4>)
 80013d0:	4298      	cmp	r0, r3
 80013d2:	d00a      	beq.n	80013ea <TIM_TimeBaseInit+0x42>
 80013d4:	4b2e      	ldr	r3, [pc, #184]	; (8001490 <TIM_TimeBaseInit+0xe8>)
 80013d6:	4298      	cmp	r0, r3
 80013d8:	d007      	beq.n	80013ea <TIM_TimeBaseInit+0x42>
 80013da:	4b2e      	ldr	r3, [pc, #184]	; (8001494 <TIM_TimeBaseInit+0xec>)
 80013dc:	4298      	cmp	r0, r3
 80013de:	d004      	beq.n	80013ea <TIM_TimeBaseInit+0x42>
 80013e0:	492d      	ldr	r1, [pc, #180]	; (8001498 <TIM_TimeBaseInit+0xf0>)
 80013e2:	1840      	adds	r0, r0, r1
 80013e4:	4243      	negs	r3, r0
 80013e6:	4158      	adcs	r0, r3
 80013e8:	e000      	b.n	80013ec <TIM_TimeBaseInit+0x44>
 80013ea:	2001      	movs	r0, #1
 80013ec:	f7ff fd6c 	bl	8000ec8 <assert_param>
 80013f0:	886b      	ldrh	r3, [r5, #2]
 80013f2:	2210      	movs	r2, #16
 80013f4:	1c19      	adds	r1, r3, #0
 80013f6:	4391      	bics	r1, r2
 80013f8:	d101      	bne.n	80013fe <TIM_TimeBaseInit+0x56>
 80013fa:	2001      	movs	r0, #1
 80013fc:	e007      	b.n	800140e <TIM_TimeBaseInit+0x66>
 80013fe:	2240      	movs	r2, #64	; 0x40
 8001400:	1c19      	adds	r1, r3, #0
 8001402:	4391      	bics	r1, r2
 8001404:	2920      	cmp	r1, #32
 8001406:	d0f8      	beq.n	80013fa <TIM_TimeBaseInit+0x52>
 8001408:	2b40      	cmp	r3, #64	; 0x40
 800140a:	d0f6      	beq.n	80013fa <TIM_TimeBaseInit+0x52>
 800140c:	2000      	movs	r0, #0
 800140e:	f7ff fd5b 	bl	8000ec8 <assert_param>
 8001412:	892b      	ldrh	r3, [r5, #8]
 8001414:	4a21      	ldr	r2, [pc, #132]	; (800149c <TIM_TimeBaseInit+0xf4>)
 8001416:	2001      	movs	r0, #1
 8001418:	4213      	tst	r3, r2
 800141a:	d003      	beq.n	8001424 <TIM_TimeBaseInit+0x7c>
 800141c:	4a20      	ldr	r2, [pc, #128]	; (80014a0 <TIM_TimeBaseInit+0xf8>)
 800141e:	1898      	adds	r0, r3, r2
 8001420:	4243      	negs	r3, r0
 8001422:	4158      	adcs	r0, r3
 8001424:	f7ff fd50 	bl	8000ec8 <assert_param>
 8001428:	6823      	ldr	r3, [r4, #0]
 800142a:	b29b      	uxth	r3, r3
 800142c:	42b4      	cmp	r4, r6
 800142e:	d006      	beq.n	800143e <TIM_TimeBaseInit+0x96>
 8001430:	2280      	movs	r2, #128	; 0x80
 8001432:	05d2      	lsls	r2, r2, #23
 8001434:	4294      	cmp	r4, r2
 8001436:	d002      	beq.n	800143e <TIM_TimeBaseInit+0x96>
 8001438:	4a12      	ldr	r2, [pc, #72]	; (8001484 <TIM_TimeBaseInit+0xdc>)
 800143a:	4294      	cmp	r4, r2
 800143c:	d103      	bne.n	8001446 <TIM_TimeBaseInit+0x9e>
 800143e:	2270      	movs	r2, #112	; 0x70
 8001440:	4393      	bics	r3, r2
 8001442:	886a      	ldrh	r2, [r5, #2]
 8001444:	4313      	orrs	r3, r2
 8001446:	42bc      	cmp	r4, r7
 8001448:	d003      	beq.n	8001452 <TIM_TimeBaseInit+0xaa>
 800144a:	4916      	ldr	r1, [pc, #88]	; (80014a4 <TIM_TimeBaseInit+0xfc>)
 800144c:	892a      	ldrh	r2, [r5, #8]
 800144e:	400b      	ands	r3, r1
 8001450:	4313      	orrs	r3, r2
 8001452:	8023      	strh	r3, [r4, #0]
 8001454:	686b      	ldr	r3, [r5, #4]
 8001456:	62e3      	str	r3, [r4, #44]	; 0x2c
 8001458:	882b      	ldrh	r3, [r5, #0]
 800145a:	8523      	strh	r3, [r4, #40]	; 0x28
 800145c:	42b4      	cmp	r4, r6
 800145e:	d008      	beq.n	8001472 <TIM_TimeBaseInit+0xca>
 8001460:	4b0b      	ldr	r3, [pc, #44]	; (8001490 <TIM_TimeBaseInit+0xe8>)
 8001462:	429c      	cmp	r4, r3
 8001464:	d005      	beq.n	8001472 <TIM_TimeBaseInit+0xca>
 8001466:	4b0b      	ldr	r3, [pc, #44]	; (8001494 <TIM_TimeBaseInit+0xec>)
 8001468:	429c      	cmp	r4, r3
 800146a:	d002      	beq.n	8001472 <TIM_TimeBaseInit+0xca>
 800146c:	4b0e      	ldr	r3, [pc, #56]	; (80014a8 <TIM_TimeBaseInit+0x100>)
 800146e:	429c      	cmp	r4, r3
 8001470:	d101      	bne.n	8001476 <TIM_TimeBaseInit+0xce>
 8001472:	7aab      	ldrb	r3, [r5, #10]
 8001474:	8623      	strh	r3, [r4, #48]	; 0x30
 8001476:	2301      	movs	r3, #1
 8001478:	82a3      	strh	r3, [r4, #20]
 800147a:	bdf8      	pop	{r3, r4, r5, r6, r7, pc}
 800147c:	40012c00 	.word	0x40012c00
 8001480:	40001000 	.word	0x40001000
 8001484:	40000400 	.word	0x40000400
 8001488:	40001400 	.word	0x40001400
 800148c:	40002000 	.word	0x40002000
 8001490:	40014000 	.word	0x40014000
 8001494:	40014400 	.word	0x40014400
 8001498:	bffeb800 	.word	0xbffeb800
 800149c:	fffffeff 	.word	0xfffffeff
 80014a0:	fffffe00 	.word	0xfffffe00
 80014a4:	fffffcff 	.word	0xfffffcff
 80014a8:	40014800 	.word	0x40014800

080014ac <TIM_Cmd>:
 80014ac:	4b19      	ldr	r3, [pc, #100]	; (8001514 <TIM_Cmd+0x68>)
 80014ae:	b570      	push	{r4, r5, r6, lr}
 80014b0:	1c04      	adds	r4, r0, #0
 80014b2:	1c0e      	adds	r6, r1, #0
 80014b4:	4298      	cmp	r0, r3
 80014b6:	d01a      	beq.n	80014ee <TIM_Cmd+0x42>
 80014b8:	2380      	movs	r3, #128	; 0x80
 80014ba:	05db      	lsls	r3, r3, #23
 80014bc:	4298      	cmp	r0, r3
 80014be:	d016      	beq.n	80014ee <TIM_Cmd+0x42>
 80014c0:	4b15      	ldr	r3, [pc, #84]	; (8001518 <TIM_Cmd+0x6c>)
 80014c2:	4298      	cmp	r0, r3
 80014c4:	d013      	beq.n	80014ee <TIM_Cmd+0x42>
 80014c6:	4b15      	ldr	r3, [pc, #84]	; (800151c <TIM_Cmd+0x70>)
 80014c8:	4298      	cmp	r0, r3
 80014ca:	d010      	beq.n	80014ee <TIM_Cmd+0x42>
 80014cc:	4b14      	ldr	r3, [pc, #80]	; (8001520 <TIM_Cmd+0x74>)
 80014ce:	4298      	cmp	r0, r3
 80014d0:	d00d      	beq.n	80014ee <TIM_Cmd+0x42>
 80014d2:	4b14      	ldr	r3, [pc, #80]	; (8001524 <TIM_Cmd+0x78>)
 80014d4:	4298      	cmp	r0, r3
 80014d6:	d00a      	beq.n	80014ee <TIM_Cmd+0x42>
 80014d8:	4b13      	ldr	r3, [pc, #76]	; (8001528 <TIM_Cmd+0x7c>)
 80014da:	4298      	cmp	r0, r3
 80014dc:	d007      	beq.n	80014ee <TIM_Cmd+0x42>
 80014de:	4b13      	ldr	r3, [pc, #76]	; (800152c <TIM_Cmd+0x80>)
 80014e0:	4298      	cmp	r0, r3
 80014e2:	d004      	beq.n	80014ee <TIM_Cmd+0x42>
 80014e4:	4b12      	ldr	r3, [pc, #72]	; (8001530 <TIM_Cmd+0x84>)
 80014e6:	18c0      	adds	r0, r0, r3
 80014e8:	4243      	negs	r3, r0
 80014ea:	4158      	adcs	r0, r3
 80014ec:	e000      	b.n	80014f0 <TIM_Cmd+0x44>
 80014ee:	2001      	movs	r0, #1
 80014f0:	f7ff fcea 	bl	8000ec8 <assert_param>
 80014f4:	2501      	movs	r5, #1
 80014f6:	2000      	movs	r0, #0
 80014f8:	42b5      	cmp	r5, r6
 80014fa:	4140      	adcs	r0, r0
 80014fc:	f7ff fce4 	bl	8000ec8 <assert_param>
 8001500:	6823      	ldr	r3, [r4, #0]
 8001502:	b29b      	uxth	r3, r3
 8001504:	2e00      	cmp	r6, #0
 8001506:	d002      	beq.n	800150e <TIM_Cmd+0x62>
 8001508:	431d      	orrs	r5, r3
 800150a:	8025      	strh	r5, [r4, #0]
 800150c:	e001      	b.n	8001512 <TIM_Cmd+0x66>
 800150e:	43ab      	bics	r3, r5
 8001510:	8023      	strh	r3, [r4, #0]
 8001512:	bd70      	pop	{r4, r5, r6, pc}
 8001514:	40012c00 	.word	0x40012c00
 8001518:	40000400 	.word	0x40000400
 800151c:	40001000 	.word	0x40001000
 8001520:	40001400 	.word	0x40001400
 8001524:	40002000 	.word	0x40002000
 8001528:	40014000 	.word	0x40014000
 800152c:	40014400 	.word	0x40014400
 8001530:	bffeb800 	.word	0xbffeb800

08001534 <TIM_ITConfig>:
 8001534:	4b1f      	ldr	r3, [pc, #124]	; (80015b4 <TIM_ITConfig+0x80>)
 8001536:	b570      	push	{r4, r5, r6, lr}
 8001538:	1c04      	adds	r4, r0, #0
 800153a:	1c0d      	adds	r5, r1, #0
 800153c:	1c16      	adds	r6, r2, #0
 800153e:	4298      	cmp	r0, r3
 8001540:	d01a      	beq.n	8001578 <TIM_ITConfig+0x44>
 8001542:	2380      	movs	r3, #128	; 0x80
 8001544:	05db      	lsls	r3, r3, #23
 8001546:	4298      	cmp	r0, r3
 8001548:	d016      	beq.n	8001578 <TIM_ITConfig+0x44>
 800154a:	4b1b      	ldr	r3, [pc, #108]	; (80015b8 <TIM_ITConfig+0x84>)
 800154c:	4298      	cmp	r0, r3
 800154e:	d013      	beq.n	8001578 <TIM_ITConfig+0x44>
 8001550:	4b1a      	ldr	r3, [pc, #104]	; (80015bc <TIM_ITConfig+0x88>)
 8001552:	4298      	cmp	r0, r3
 8001554:	d010      	beq.n	8001578 <TIM_ITConfig+0x44>
 8001556:	4b1a      	ldr	r3, [pc, #104]	; (80015c0 <TIM_ITConfig+0x8c>)
 8001558:	4298      	cmp	r0, r3
 800155a:	d00d      	beq.n	8001578 <TIM_ITConfig+0x44>
 800155c:	4b19      	ldr	r3, [pc, #100]	; (80015c4 <TIM_ITConfig+0x90>)
 800155e:	4298      	cmp	r0, r3
 8001560:	d00a      	beq.n	8001578 <TIM_ITConfig+0x44>
 8001562:	4b19      	ldr	r3, [pc, #100]	; (80015c8 <TIM_ITConfig+0x94>)
 8001564:	4298      	cmp	r0, r3
 8001566:	d007      	beq.n	8001578 <TIM_ITConfig+0x44>
 8001568:	4b18      	ldr	r3, [pc, #96]	; (80015cc <TIM_ITConfig+0x98>)
 800156a:	4298      	cmp	r0, r3
 800156c:	d004      	beq.n	8001578 <TIM_ITConfig+0x44>
 800156e:	4a18      	ldr	r2, [pc, #96]	; (80015d0 <TIM_ITConfig+0x9c>)
 8001570:	1880      	adds	r0, r0, r2
 8001572:	4243      	negs	r3, r0
 8001574:	4158      	adcs	r0, r3
 8001576:	e000      	b.n	800157a <TIM_ITConfig+0x46>
 8001578:	2001      	movs	r0, #1
 800157a:	f7ff fca5 	bl	8000ec8 <assert_param>
 800157e:	23ff      	movs	r3, #255	; 0xff
 8001580:	1c2a      	adds	r2, r5, #0
 8001582:	2000      	movs	r0, #0
 8001584:	439a      	bics	r2, r3
 8001586:	4282      	cmp	r2, r0
 8001588:	d102      	bne.n	8001590 <TIM_ITConfig+0x5c>
 800158a:	1c28      	adds	r0, r5, #0
 800158c:	1e43      	subs	r3, r0, #1
 800158e:	4198      	sbcs	r0, r3
 8001590:	f7ff fc9a 	bl	8000ec8 <assert_param>
 8001594:	2301      	movs	r3, #1
 8001596:	2000      	movs	r0, #0
 8001598:	42b3      	cmp	r3, r6
 800159a:	4140      	adcs	r0, r0
 800159c:	f7ff fc94 	bl	8000ec8 <assert_param>
 80015a0:	68e3      	ldr	r3, [r4, #12]
 80015a2:	b29b      	uxth	r3, r3
 80015a4:	2e00      	cmp	r6, #0
 80015a6:	d002      	beq.n	80015ae <TIM_ITConfig+0x7a>
 80015a8:	431d      	orrs	r5, r3
 80015aa:	81a5      	strh	r5, [r4, #12]
 80015ac:	e001      	b.n	80015b2 <TIM_ITConfig+0x7e>
 80015ae:	43ab      	bics	r3, r5
 80015b0:	81a3      	strh	r3, [r4, #12]
 80015b2:	bd70      	pop	{r4, r5, r6, pc}
 80015b4:	40012c00 	.word	0x40012c00
 80015b8:	40000400 	.word	0x40000400
 80015bc:	40001000 	.word	0x40001000
 80015c0:	40001400 	.word	0x40001400
 80015c4:	40002000 	.word	0x40002000
 80015c8:	40014000 	.word	0x40014000
 80015cc:	40014400 	.word	0x40014400
 80015d0:	bffeb800 	.word	0xbffeb800

080015d4 <USART_Init>:
 80015d4:	b5f0      	push	{r4, r5, r6, r7, lr}
 80015d6:	4e53      	ldr	r6, [pc, #332]	; (8001724 <USART_Init+0x150>)
 80015d8:	b08b      	sub	sp, #44	; 0x2c
 80015da:	1c04      	adds	r4, r0, #0
 80015dc:	1c0d      	adds	r5, r1, #0
 80015de:	42b0      	cmp	r0, r6
 80015e0:	d016      	beq.n	8001610 <USART_Init+0x3c>
 80015e2:	4b51      	ldr	r3, [pc, #324]	; (8001728 <USART_Init+0x154>)
 80015e4:	4298      	cmp	r0, r3
 80015e6:	d013      	beq.n	8001610 <USART_Init+0x3c>
 80015e8:	4b50      	ldr	r3, [pc, #320]	; (800172c <USART_Init+0x158>)
 80015ea:	4298      	cmp	r0, r3
 80015ec:	d010      	beq.n	8001610 <USART_Init+0x3c>
 80015ee:	4b50      	ldr	r3, [pc, #320]	; (8001730 <USART_Init+0x15c>)
 80015f0:	4298      	cmp	r0, r3
 80015f2:	d00d      	beq.n	8001610 <USART_Init+0x3c>
 80015f4:	4b4f      	ldr	r3, [pc, #316]	; (8001734 <USART_Init+0x160>)
 80015f6:	4298      	cmp	r0, r3
 80015f8:	d00a      	beq.n	8001610 <USART_Init+0x3c>
 80015fa:	4b4f      	ldr	r3, [pc, #316]	; (8001738 <USART_Init+0x164>)
 80015fc:	4298      	cmp	r0, r3
 80015fe:	d007      	beq.n	8001610 <USART_Init+0x3c>
 8001600:	4b4e      	ldr	r3, [pc, #312]	; (800173c <USART_Init+0x168>)
 8001602:	4298      	cmp	r0, r3
 8001604:	d004      	beq.n	8001610 <USART_Init+0x3c>
 8001606:	494e      	ldr	r1, [pc, #312]	; (8001740 <USART_Init+0x16c>)
 8001608:	1840      	adds	r0, r0, r1
 800160a:	4243      	negs	r3, r0
 800160c:	4158      	adcs	r0, r3
 800160e:	e000      	b.n	8001612 <USART_Init+0x3e>
 8001610:	2001      	movs	r0, #1
 8001612:	f7ff fc59 	bl	8000ec8 <assert_param>
 8001616:	682b      	ldr	r3, [r5, #0]
 8001618:	4a4a      	ldr	r2, [pc, #296]	; (8001744 <USART_Init+0x170>)
 800161a:	3b01      	subs	r3, #1
 800161c:	2000      	movs	r0, #0
 800161e:	429a      	cmp	r2, r3
 8001620:	4140      	adcs	r0, r0
 8001622:	f7ff fc51 	bl	8000ec8 <assert_param>
 8001626:	686b      	ldr	r3, [r5, #4]
 8001628:	4a47      	ldr	r2, [pc, #284]	; (8001748 <USART_Init+0x174>)
 800162a:	2001      	movs	r0, #1
 800162c:	4213      	tst	r3, r2
 800162e:	d003      	beq.n	8001638 <USART_Init+0x64>
 8001630:	4a46      	ldr	r2, [pc, #280]	; (800174c <USART_Init+0x178>)
 8001632:	1898      	adds	r0, r3, r2
 8001634:	4243      	negs	r3, r0
 8001636:	4158      	adcs	r0, r3
 8001638:	f7ff fc46 	bl	8000ec8 <assert_param>
 800163c:	68ab      	ldr	r3, [r5, #8]
 800163e:	4a44      	ldr	r2, [pc, #272]	; (8001750 <USART_Init+0x17c>)
 8001640:	2001      	movs	r0, #1
 8001642:	4213      	tst	r3, r2
 8001644:	d003      	beq.n	800164e <USART_Init+0x7a>
 8001646:	4943      	ldr	r1, [pc, #268]	; (8001754 <USART_Init+0x180>)
 8001648:	1858      	adds	r0, r3, r1
 800164a:	4243      	negs	r3, r0
 800164c:	4158      	adcs	r0, r3
 800164e:	f7ff fc3b 	bl	8000ec8 <assert_param>
 8001652:	68eb      	ldr	r3, [r5, #12]
 8001654:	4a40      	ldr	r2, [pc, #256]	; (8001758 <USART_Init+0x184>)
 8001656:	2001      	movs	r0, #1
 8001658:	4213      	tst	r3, r2
 800165a:	d003      	beq.n	8001664 <USART_Init+0x90>
 800165c:	4a3f      	ldr	r2, [pc, #252]	; (800175c <USART_Init+0x188>)
 800165e:	1898      	adds	r0, r3, r2
 8001660:	4243      	negs	r3, r0
 8001662:	4158      	adcs	r0, r3
 8001664:	f7ff fc30 	bl	8000ec8 <assert_param>
 8001668:	692b      	ldr	r3, [r5, #16]
 800166a:	220c      	movs	r2, #12
 800166c:	1c19      	adds	r1, r3, #0
 800166e:	2000      	movs	r0, #0
 8001670:	4391      	bics	r1, r2
 8001672:	4281      	cmp	r1, r0
 8001674:	d102      	bne.n	800167c <USART_Init+0xa8>
 8001676:	1c18      	adds	r0, r3, #0
 8001678:	1e43      	subs	r3, r0, #1
 800167a:	4198      	sbcs	r0, r3
 800167c:	f7ff fc24 	bl	8000ec8 <assert_param>
 8001680:	4f37      	ldr	r7, [pc, #220]	; (8001760 <USART_Init+0x18c>)
 8001682:	6968      	ldr	r0, [r5, #20]
 8001684:	4038      	ands	r0, r7
 8001686:	4243      	negs	r3, r0
 8001688:	4158      	adcs	r0, r3
 800168a:	f7ff fc1d 	bl	8000ec8 <assert_param>
 800168e:	6823      	ldr	r3, [r4, #0]
 8001690:	2201      	movs	r2, #1
 8001692:	4393      	bics	r3, r2
 8001694:	6023      	str	r3, [r4, #0]
 8001696:	6862      	ldr	r2, [r4, #4]
 8001698:	4b32      	ldr	r3, [pc, #200]	; (8001764 <USART_Init+0x190>)
 800169a:	6869      	ldr	r1, [r5, #4]
 800169c:	4013      	ands	r3, r2
 800169e:	68aa      	ldr	r2, [r5, #8]
 80016a0:	4668      	mov	r0, sp
 80016a2:	4313      	orrs	r3, r2
 80016a4:	6063      	str	r3, [r4, #4]
 80016a6:	6822      	ldr	r2, [r4, #0]
 80016a8:	4b2f      	ldr	r3, [pc, #188]	; (8001768 <USART_Init+0x194>)
 80016aa:	401a      	ands	r2, r3
 80016ac:	68eb      	ldr	r3, [r5, #12]
 80016ae:	430b      	orrs	r3, r1
 80016b0:	6929      	ldr	r1, [r5, #16]
 80016b2:	430b      	orrs	r3, r1
 80016b4:	4313      	orrs	r3, r2
 80016b6:	6023      	str	r3, [r4, #0]
 80016b8:	68a3      	ldr	r3, [r4, #8]
 80016ba:	696a      	ldr	r2, [r5, #20]
 80016bc:	401f      	ands	r7, r3
 80016be:	4317      	orrs	r7, r2
 80016c0:	60a7      	str	r7, [r4, #8]
 80016c2:	f000 fc97 	bl	8001ff4 <RCC_GetClocksFreq>
 80016c6:	42b4      	cmp	r4, r6
 80016c8:	d101      	bne.n	80016ce <USART_Init+0xfa>
 80016ca:	9e06      	ldr	r6, [sp, #24]
 80016cc:	e00a      	b.n	80016e4 <USART_Init+0x110>
 80016ce:	4b16      	ldr	r3, [pc, #88]	; (8001728 <USART_Init+0x154>)
 80016d0:	429c      	cmp	r4, r3
 80016d2:	d101      	bne.n	80016d8 <USART_Init+0x104>
 80016d4:	9e07      	ldr	r6, [sp, #28]
 80016d6:	e005      	b.n	80016e4 <USART_Init+0x110>
 80016d8:	4b14      	ldr	r3, [pc, #80]	; (800172c <USART_Init+0x158>)
 80016da:	429c      	cmp	r4, r3
 80016dc:	d101      	bne.n	80016e2 <USART_Init+0x10e>
 80016de:	9e08      	ldr	r6, [sp, #32]
 80016e0:	e000      	b.n	80016e4 <USART_Init+0x110>
 80016e2:	9e02      	ldr	r6, [sp, #8]
 80016e4:	6823      	ldr	r3, [r4, #0]
 80016e6:	682f      	ldr	r7, [r5, #0]
 80016e8:	0419      	lsls	r1, r3, #16
 80016ea:	d500      	bpl.n	80016ee <USART_Init+0x11a>
 80016ec:	0076      	lsls	r6, r6, #1
 80016ee:	1c39      	adds	r1, r7, #0
 80016f0:	1c30      	adds	r0, r6, #0
 80016f2:	f000 fea5 	bl	8002440 <__aeabi_uidiv>
 80016f6:	1c39      	adds	r1, r7, #0
 80016f8:	1c05      	adds	r5, r0, #0
 80016fa:	1c30      	adds	r0, r6, #0
 80016fc:	f000 fee4 	bl	80024c8 <__aeabi_uidivmod>
 8001700:	087f      	lsrs	r7, r7, #1
 8001702:	2300      	movs	r3, #0
 8001704:	42b9      	cmp	r1, r7
 8001706:	415b      	adcs	r3, r3
 8001708:	18ed      	adds	r5, r5, r3
 800170a:	6823      	ldr	r3, [r4, #0]
 800170c:	041a      	lsls	r2, r3, #16
 800170e:	d504      	bpl.n	800171a <USART_Init+0x146>
 8001710:	4a16      	ldr	r2, [pc, #88]	; (800176c <USART_Init+0x198>)
 8001712:	072b      	lsls	r3, r5, #28
 8001714:	0f5b      	lsrs	r3, r3, #29
 8001716:	4015      	ands	r5, r2
 8001718:	431d      	orrs	r5, r3
 800171a:	b2ad      	uxth	r5, r5
 800171c:	81a5      	strh	r5, [r4, #12]
 800171e:	b00b      	add	sp, #44	; 0x2c
 8001720:	bdf0      	pop	{r4, r5, r6, r7, pc}
 8001722:	46c0      	nop			; (mov r8, r8)
 8001724:	40013800 	.word	0x40013800
 8001728:	40004400 	.word	0x40004400
 800172c:	40004800 	.word	0x40004800
 8001730:	40004c00 	.word	0x40004c00
 8001734:	40005000 	.word	0x40005000
 8001738:	40011400 	.word	0x40011400
 800173c:	40011800 	.word	0x40011800
 8001740:	bffee400 	.word	0xbffee400
 8001744:	005b8d7f 	.word	0x005b8d7f
 8001748:	ffffefff 	.word	0xffffefff
 800174c:	effff000 	.word	0xeffff000
 8001750:	ffffdfff 	.word	0xffffdfff
 8001754:	ffffd000 	.word	0xffffd000
 8001758:	fffffbff 	.word	0xfffffbff
 800175c:	fffffa00 	.word	0xfffffa00
 8001760:	fffffcff 	.word	0xfffffcff
 8001764:	ffffcfff 	.word	0xffffcfff
 8001768:	ffffe9f3 	.word	0xffffe9f3
 800176c:	0000fff0 	.word	0x0000fff0

08001770 <USART_Cmd>:
 8001770:	4b17      	ldr	r3, [pc, #92]	; (80017d0 <USART_Cmd+0x60>)
 8001772:	b570      	push	{r4, r5, r6, lr}
 8001774:	1c04      	adds	r4, r0, #0
 8001776:	1c0e      	adds	r6, r1, #0
 8001778:	4298      	cmp	r0, r3
 800177a:	d016      	beq.n	80017aa <USART_Cmd+0x3a>
 800177c:	4b15      	ldr	r3, [pc, #84]	; (80017d4 <USART_Cmd+0x64>)
 800177e:	4298      	cmp	r0, r3
 8001780:	d013      	beq.n	80017aa <USART_Cmd+0x3a>
 8001782:	4b15      	ldr	r3, [pc, #84]	; (80017d8 <USART_Cmd+0x68>)
 8001784:	4298      	cmp	r0, r3
 8001786:	d010      	beq.n	80017aa <USART_Cmd+0x3a>
 8001788:	4b14      	ldr	r3, [pc, #80]	; (80017dc <USART_Cmd+0x6c>)
 800178a:	4298      	cmp	r0, r3
 800178c:	d00d      	beq.n	80017aa <USART_Cmd+0x3a>
 800178e:	4b14      	ldr	r3, [pc, #80]	; (80017e0 <USART_Cmd+0x70>)
 8001790:	4298      	cmp	r0, r3
 8001792:	d00a      	beq.n	80017aa <USART_Cmd+0x3a>
 8001794:	4b13      	ldr	r3, [pc, #76]	; (80017e4 <USART_Cmd+0x74>)
 8001796:	4298      	cmp	r0, r3
 8001798:	d007      	beq.n	80017aa <USART_Cmd+0x3a>
 800179a:	4b13      	ldr	r3, [pc, #76]	; (80017e8 <USART_Cmd+0x78>)
 800179c:	4298      	cmp	r0, r3
 800179e:	d004      	beq.n	80017aa <USART_Cmd+0x3a>
 80017a0:	4b12      	ldr	r3, [pc, #72]	; (80017ec <USART_Cmd+0x7c>)
 80017a2:	18c0      	adds	r0, r0, r3
 80017a4:	4243      	negs	r3, r0
 80017a6:	4158      	adcs	r0, r3
 80017a8:	e000      	b.n	80017ac <USART_Cmd+0x3c>
 80017aa:	2001      	movs	r0, #1
 80017ac:	f7ff fb8c 	bl	8000ec8 <assert_param>
 80017b0:	2501      	movs	r5, #1
 80017b2:	2000      	movs	r0, #0
 80017b4:	42b5      	cmp	r5, r6
 80017b6:	4140      	adcs	r0, r0
 80017b8:	f7ff fb86 	bl	8000ec8 <assert_param>
 80017bc:	6823      	ldr	r3, [r4, #0]
 80017be:	2e00      	cmp	r6, #0
 80017c0:	d002      	beq.n	80017c8 <USART_Cmd+0x58>
 80017c2:	431d      	orrs	r5, r3
 80017c4:	6025      	str	r5, [r4, #0]
 80017c6:	e001      	b.n	80017cc <USART_Cmd+0x5c>
 80017c8:	43ab      	bics	r3, r5
 80017ca:	6023      	str	r3, [r4, #0]
 80017cc:	bd70      	pop	{r4, r5, r6, pc}
 80017ce:	46c0      	nop			; (mov r8, r8)
 80017d0:	40013800 	.word	0x40013800
 80017d4:	40004400 	.word	0x40004400
 80017d8:	40004800 	.word	0x40004800
 80017dc:	40004c00 	.word	0x40004c00
 80017e0:	40005000 	.word	0x40005000
 80017e4:	40011400 	.word	0x40011400
 80017e8:	40011800 	.word	0x40011800
 80017ec:	bffee400 	.word	0xbffee400

080017f0 <USART_ReceiveData>:
 80017f0:	4b11      	ldr	r3, [pc, #68]	; (8001838 <USART_ReceiveData+0x48>)
 80017f2:	b510      	push	{r4, lr}
 80017f4:	1e04      	subs	r4, r0, #0
 80017f6:	429c      	cmp	r4, r3
 80017f8:	d016      	beq.n	8001828 <USART_ReceiveData+0x38>
 80017fa:	4b10      	ldr	r3, [pc, #64]	; (800183c <USART_ReceiveData+0x4c>)
 80017fc:	4298      	cmp	r0, r3
 80017fe:	d013      	beq.n	8001828 <USART_ReceiveData+0x38>
 8001800:	4b0f      	ldr	r3, [pc, #60]	; (8001840 <USART_ReceiveData+0x50>)
 8001802:	4298      	cmp	r0, r3
 8001804:	d010      	beq.n	8001828 <USART_ReceiveData+0x38>
 8001806:	4b0f      	ldr	r3, [pc, #60]	; (8001844 <USART_ReceiveData+0x54>)
 8001808:	4298      	cmp	r0, r3
 800180a:	d00d      	beq.n	8001828 <USART_ReceiveData+0x38>
 800180c:	4b0e      	ldr	r3, [pc, #56]	; (8001848 <USART_ReceiveData+0x58>)
 800180e:	4298      	cmp	r0, r3
 8001810:	d00a      	beq.n	8001828 <USART_ReceiveData+0x38>
 8001812:	4b0e      	ldr	r3, [pc, #56]	; (800184c <USART_ReceiveData+0x5c>)
 8001814:	4298      	cmp	r0, r3
 8001816:	d007      	beq.n	8001828 <USART_ReceiveData+0x38>
 8001818:	4b0d      	ldr	r3, [pc, #52]	; (8001850 <USART_ReceiveData+0x60>)
 800181a:	4298      	cmp	r0, r3
 800181c:	d004      	beq.n	8001828 <USART_ReceiveData+0x38>
 800181e:	4b0d      	ldr	r3, [pc, #52]	; (8001854 <USART_ReceiveData+0x64>)
 8001820:	18c0      	adds	r0, r0, r3
 8001822:	4243      	negs	r3, r0
 8001824:	4158      	adcs	r0, r3
 8001826:	e000      	b.n	800182a <USART_ReceiveData+0x3a>
 8001828:	2001      	movs	r0, #1
 800182a:	f7ff fb4d 	bl	8000ec8 <assert_param>
 800182e:	6a60      	ldr	r0, [r4, #36]	; 0x24
 8001830:	05c0      	lsls	r0, r0, #23
 8001832:	0dc0      	lsrs	r0, r0, #23
 8001834:	bd10      	pop	{r4, pc}
 8001836:	46c0      	nop			; (mov r8, r8)
 8001838:	40013800 	.word	0x40013800
 800183c:	40004400 	.word	0x40004400
 8001840:	40004800 	.word	0x40004800
 8001844:	40004c00 	.word	0x40004c00
 8001848:	40005000 	.word	0x40005000
 800184c:	40011400 	.word	0x40011400
 8001850:	40011800 	.word	0x40011800
 8001854:	bffee400 	.word	0xbffee400

08001858 <USART_GetITStatus>:
 8001858:	b538      	push	{r3, r4, r5, lr}
 800185a:	4b36      	ldr	r3, [pc, #216]	; (8001934 <USART_GetITStatus+0xdc>)
 800185c:	1c05      	adds	r5, r0, #0
 800185e:	1c0c      	adds	r4, r1, #0
 8001860:	4298      	cmp	r0, r3
 8001862:	d016      	beq.n	8001892 <USART_GetITStatus+0x3a>
 8001864:	4b34      	ldr	r3, [pc, #208]	; (8001938 <USART_GetITStatus+0xe0>)
 8001866:	4298      	cmp	r0, r3
 8001868:	d013      	beq.n	8001892 <USART_GetITStatus+0x3a>
 800186a:	4b34      	ldr	r3, [pc, #208]	; (800193c <USART_GetITStatus+0xe4>)
 800186c:	4298      	cmp	r0, r3
 800186e:	d010      	beq.n	8001892 <USART_GetITStatus+0x3a>
 8001870:	4b33      	ldr	r3, [pc, #204]	; (8001940 <USART_GetITStatus+0xe8>)
 8001872:	4298      	cmp	r0, r3
 8001874:	d00d      	beq.n	8001892 <USART_GetITStatus+0x3a>
 8001876:	4b33      	ldr	r3, [pc, #204]	; (8001944 <USART_GetITStatus+0xec>)
 8001878:	4298      	cmp	r0, r3
 800187a:	d00a      	beq.n	8001892 <USART_GetITStatus+0x3a>
 800187c:	4b32      	ldr	r3, [pc, #200]	; (8001948 <USART_GetITStatus+0xf0>)
 800187e:	4298      	cmp	r0, r3
 8001880:	d007      	beq.n	8001892 <USART_GetITStatus+0x3a>
 8001882:	4b32      	ldr	r3, [pc, #200]	; (800194c <USART_GetITStatus+0xf4>)
 8001884:	4298      	cmp	r0, r3
 8001886:	d004      	beq.n	8001892 <USART_GetITStatus+0x3a>
 8001888:	4a31      	ldr	r2, [pc, #196]	; (8001950 <USART_GetITStatus+0xf8>)
 800188a:	1880      	adds	r0, r0, r2
 800188c:	4243      	negs	r3, r0
 800188e:	4158      	adcs	r0, r3
 8001890:	e000      	b.n	8001894 <USART_GetITStatus+0x3c>
 8001892:	2001      	movs	r0, #1
 8001894:	f7ff fb18 	bl	8000ec8 <assert_param>
 8001898:	2384      	movs	r3, #132	; 0x84
 800189a:	005b      	lsls	r3, r3, #1
 800189c:	429c      	cmp	r4, r3
 800189e:	d027      	beq.n	80018f0 <USART_GetITStatus+0x98>
 80018a0:	4b2c      	ldr	r3, [pc, #176]	; (8001954 <USART_GetITStatus+0xfc>)
 80018a2:	429c      	cmp	r4, r3
 80018a4:	d024      	beq.n	80018f0 <USART_GetITStatus+0x98>
 80018a6:	4b2c      	ldr	r3, [pc, #176]	; (8001958 <USART_GetITStatus+0x100>)
 80018a8:	429c      	cmp	r4, r3
 80018aa:	d021      	beq.n	80018f0 <USART_GetITStatus+0x98>
 80018ac:	4b2b      	ldr	r3, [pc, #172]	; (800195c <USART_GetITStatus+0x104>)
 80018ae:	429c      	cmp	r4, r3
 80018b0:	d01e      	beq.n	80018f0 <USART_GetITStatus+0x98>
 80018b2:	4b2b      	ldr	r3, [pc, #172]	; (8001960 <USART_GetITStatus+0x108>)
 80018b4:	429c      	cmp	r4, r3
 80018b6:	d01b      	beq.n	80018f0 <USART_GetITStatus+0x98>
 80018b8:	4b2a      	ldr	r3, [pc, #168]	; (8001964 <USART_GetITStatus+0x10c>)
 80018ba:	429c      	cmp	r4, r3
 80018bc:	d018      	beq.n	80018f0 <USART_GetITStatus+0x98>
 80018be:	4b2a      	ldr	r3, [pc, #168]	; (8001968 <USART_GetITStatus+0x110>)
 80018c0:	429c      	cmp	r4, r3
 80018c2:	d015      	beq.n	80018f0 <USART_GetITStatus+0x98>
 80018c4:	4b29      	ldr	r3, [pc, #164]	; (800196c <USART_GetITStatus+0x114>)
 80018c6:	429c      	cmp	r4, r3
 80018c8:	d012      	beq.n	80018f0 <USART_GetITStatus+0x98>
 80018ca:	4a29      	ldr	r2, [pc, #164]	; (8001970 <USART_GetITStatus+0x118>)
 80018cc:	4b29      	ldr	r3, [pc, #164]	; (8001974 <USART_GetITStatus+0x11c>)
 80018ce:	4022      	ands	r2, r4
 80018d0:	429a      	cmp	r2, r3
 80018d2:	d00d      	beq.n	80018f0 <USART_GetITStatus+0x98>
 80018d4:	4b28      	ldr	r3, [pc, #160]	; (8001978 <USART_GetITStatus+0x120>)
 80018d6:	429c      	cmp	r4, r3
 80018d8:	d00a      	beq.n	80018f0 <USART_GetITStatus+0x98>
 80018da:	4b28      	ldr	r3, [pc, #160]	; (800197c <USART_GetITStatus+0x124>)
 80018dc:	429c      	cmp	r4, r3
 80018de:	d007      	beq.n	80018f0 <USART_GetITStatus+0x98>
 80018e0:	4b27      	ldr	r3, [pc, #156]	; (8001980 <USART_GetITStatus+0x128>)
 80018e2:	429c      	cmp	r4, r3
 80018e4:	d004      	beq.n	80018f0 <USART_GetITStatus+0x98>
 80018e6:	4a27      	ldr	r2, [pc, #156]	; (8001984 <USART_GetITStatus+0x12c>)
 80018e8:	18a3      	adds	r3, r4, r2
 80018ea:	4258      	negs	r0, r3
 80018ec:	4158      	adcs	r0, r3
 80018ee:	e000      	b.n	80018f2 <USART_GetITStatus+0x9a>
 80018f0:	2001      	movs	r0, #1
 80018f2:	f7ff fae9 	bl	8000ec8 <assert_param>
 80018f6:	b2e3      	uxtb	r3, r4
 80018f8:	2101      	movs	r1, #1
 80018fa:	b2a2      	uxth	r2, r4
 80018fc:	4099      	lsls	r1, r3
 80018fe:	0a12      	lsrs	r2, r2, #8
 8001900:	1c0b      	adds	r3, r1, #0
 8001902:	2a01      	cmp	r2, #1
 8001904:	d101      	bne.n	800190a <USART_GetITStatus+0xb2>
 8001906:	682a      	ldr	r2, [r5, #0]
 8001908:	e004      	b.n	8001914 <USART_GetITStatus+0xbc>
 800190a:	2a02      	cmp	r2, #2
 800190c:	d101      	bne.n	8001912 <USART_GetITStatus+0xba>
 800190e:	686a      	ldr	r2, [r5, #4]
 8001910:	e000      	b.n	8001914 <USART_GetITStatus+0xbc>
 8001912:	68aa      	ldr	r2, [r5, #8]
 8001914:	2000      	movs	r0, #0
 8001916:	4013      	ands	r3, r2
 8001918:	69ea      	ldr	r2, [r5, #28]
 800191a:	4283      	cmp	r3, r0
 800191c:	d008      	beq.n	8001930 <USART_GetITStatus+0xd8>
 800191e:	0c24      	lsrs	r4, r4, #16
 8001920:	2001      	movs	r0, #1
 8001922:	40a0      	lsls	r0, r4
 8001924:	1c04      	adds	r4, r0, #0
 8001926:	1c10      	adds	r0, r2, #0
 8001928:	4020      	ands	r0, r4
 800192a:	1e44      	subs	r4, r0, #1
 800192c:	41a0      	sbcs	r0, r4
 800192e:	b2c0      	uxtb	r0, r0
 8001930:	bd38      	pop	{r3, r4, r5, pc}
 8001932:	46c0      	nop			; (mov r8, r8)
 8001934:	40013800 	.word	0x40013800
 8001938:	40004400 	.word	0x40004400
 800193c:	40004800 	.word	0x40004800
 8001940:	40004c00 	.word	0x40004c00
 8001944:	40005000 	.word	0x40005000
 8001948:	40011400 	.word	0x40011400
 800194c:	40011800 	.word	0x40011800
 8001950:	bffee400 	.word	0xbffee400
 8001954:	00070107 	.word	0x00070107
 8001958:	00060106 	.word	0x00060106
 800195c:	00050105 	.word	0x00050105
 8001960:	00040104 	.word	0x00040104
 8001964:	00080206 	.word	0x00080206
 8001968:	0009030a 	.word	0x0009030a
 800196c:	00020300 	.word	0x00020300
 8001970:	fffdffff 	.word	0xfffdffff
 8001974:	00010300 	.word	0x00010300
 8001978:	000b011a 	.word	0x000b011a
 800197c:	000c011b 	.word	0x000c011b
 8001980:	0011010e 	.word	0x0011010e
 8001984:	ffebfcea 	.word	0xffebfcea

08001988 <USART_ClearITPendingBit>:
 8001988:	b538      	push	{r3, r4, r5, lr}
 800198a:	4b26      	ldr	r3, [pc, #152]	; (8001a24 <USART_ClearITPendingBit+0x9c>)
 800198c:	1c05      	adds	r5, r0, #0
 800198e:	1c0c      	adds	r4, r1, #0
 8001990:	4298      	cmp	r0, r3
 8001992:	d016      	beq.n	80019c2 <USART_ClearITPendingBit+0x3a>
 8001994:	4b24      	ldr	r3, [pc, #144]	; (8001a28 <USART_ClearITPendingBit+0xa0>)
 8001996:	4298      	cmp	r0, r3
 8001998:	d013      	beq.n	80019c2 <USART_ClearITPendingBit+0x3a>
 800199a:	4b24      	ldr	r3, [pc, #144]	; (8001a2c <USART_ClearITPendingBit+0xa4>)
 800199c:	4298      	cmp	r0, r3
 800199e:	d010      	beq.n	80019c2 <USART_ClearITPendingBit+0x3a>
 80019a0:	4b23      	ldr	r3, [pc, #140]	; (8001a30 <USART_ClearITPendingBit+0xa8>)
 80019a2:	4298      	cmp	r0, r3
 80019a4:	d00d      	beq.n	80019c2 <USART_ClearITPendingBit+0x3a>
 80019a6:	4b23      	ldr	r3, [pc, #140]	; (8001a34 <USART_ClearITPendingBit+0xac>)
 80019a8:	4298      	cmp	r0, r3
 80019aa:	d00a      	beq.n	80019c2 <USART_ClearITPendingBit+0x3a>
 80019ac:	4b22      	ldr	r3, [pc, #136]	; (8001a38 <USART_ClearITPendingBit+0xb0>)
 80019ae:	4298      	cmp	r0, r3
 80019b0:	d007      	beq.n	80019c2 <USART_ClearITPendingBit+0x3a>
 80019b2:	4b22      	ldr	r3, [pc, #136]	; (8001a3c <USART_ClearITPendingBit+0xb4>)
 80019b4:	4298      	cmp	r0, r3
 80019b6:	d004      	beq.n	80019c2 <USART_ClearITPendingBit+0x3a>
 80019b8:	4a21      	ldr	r2, [pc, #132]	; (8001a40 <USART_ClearITPendingBit+0xb8>)
 80019ba:	1880      	adds	r0, r0, r2
 80019bc:	4243      	negs	r3, r0
 80019be:	4158      	adcs	r0, r3
 80019c0:	e000      	b.n	80019c4 <USART_ClearITPendingBit+0x3c>
 80019c2:	2001      	movs	r0, #1
 80019c4:	f7ff fa80 	bl	8000ec8 <assert_param>
 80019c8:	4b1e      	ldr	r3, [pc, #120]	; (8001a44 <USART_ClearITPendingBit+0xbc>)
 80019ca:	429c      	cmp	r4, r3
 80019cc:	d022      	beq.n	8001a14 <USART_ClearITPendingBit+0x8c>
 80019ce:	2384      	movs	r3, #132	; 0x84
 80019d0:	005b      	lsls	r3, r3, #1
 80019d2:	429c      	cmp	r4, r3
 80019d4:	d01e      	beq.n	8001a14 <USART_ClearITPendingBit+0x8c>
 80019d6:	4a1c      	ldr	r2, [pc, #112]	; (8001a48 <USART_ClearITPendingBit+0xc0>)
 80019d8:	4b1c      	ldr	r3, [pc, #112]	; (8001a4c <USART_ClearITPendingBit+0xc4>)
 80019da:	4022      	ands	r2, r4
 80019dc:	429a      	cmp	r2, r3
 80019de:	d019      	beq.n	8001a14 <USART_ClearITPendingBit+0x8c>
 80019e0:	4b1b      	ldr	r3, [pc, #108]	; (8001a50 <USART_ClearITPendingBit+0xc8>)
 80019e2:	429c      	cmp	r4, r3
 80019e4:	d016      	beq.n	8001a14 <USART_ClearITPendingBit+0x8c>
 80019e6:	4b1b      	ldr	r3, [pc, #108]	; (8001a54 <USART_ClearITPendingBit+0xcc>)
 80019e8:	429c      	cmp	r4, r3
 80019ea:	d013      	beq.n	8001a14 <USART_ClearITPendingBit+0x8c>
 80019ec:	4b1a      	ldr	r3, [pc, #104]	; (8001a58 <USART_ClearITPendingBit+0xd0>)
 80019ee:	429c      	cmp	r4, r3
 80019f0:	d010      	beq.n	8001a14 <USART_ClearITPendingBit+0x8c>
 80019f2:	4b1a      	ldr	r3, [pc, #104]	; (8001a5c <USART_ClearITPendingBit+0xd4>)
 80019f4:	429c      	cmp	r4, r3
 80019f6:	d00d      	beq.n	8001a14 <USART_ClearITPendingBit+0x8c>
 80019f8:	4b19      	ldr	r3, [pc, #100]	; (8001a60 <USART_ClearITPendingBit+0xd8>)
 80019fa:	429c      	cmp	r4, r3
 80019fc:	d00a      	beq.n	8001a14 <USART_ClearITPendingBit+0x8c>
 80019fe:	4b19      	ldr	r3, [pc, #100]	; (8001a64 <USART_ClearITPendingBit+0xdc>)
 8001a00:	429c      	cmp	r4, r3
 8001a02:	d007      	beq.n	8001a14 <USART_ClearITPendingBit+0x8c>
 8001a04:	4b18      	ldr	r3, [pc, #96]	; (8001a68 <USART_ClearITPendingBit+0xe0>)
 8001a06:	429c      	cmp	r4, r3
 8001a08:	d004      	beq.n	8001a14 <USART_ClearITPendingBit+0x8c>
 8001a0a:	4a18      	ldr	r2, [pc, #96]	; (8001a6c <USART_ClearITPendingBit+0xe4>)
 8001a0c:	18a3      	adds	r3, r4, r2
 8001a0e:	4258      	negs	r0, r3
 8001a10:	4158      	adcs	r0, r3
 8001a12:	e000      	b.n	8001a16 <USART_ClearITPendingBit+0x8e>
 8001a14:	2001      	movs	r0, #1
 8001a16:	f7ff fa57 	bl	8000ec8 <assert_param>
 8001a1a:	0c24      	lsrs	r4, r4, #16
 8001a1c:	2301      	movs	r3, #1
 8001a1e:	40a3      	lsls	r3, r4
 8001a20:	622b      	str	r3, [r5, #32]
 8001a22:	bd38      	pop	{r3, r4, r5, pc}
 8001a24:	40013800 	.word	0x40013800
 8001a28:	40004400 	.word	0x40004400
 8001a2c:	40004800 	.word	0x40004800
 8001a30:	40004c00 	.word	0x40004c00
 8001a34:	40005000 	.word	0x40005000
 8001a38:	40011400 	.word	0x40011400
 8001a3c:	40011800 	.word	0x40011800
 8001a40:	bffee400 	.word	0xbffee400
 8001a44:	00060106 	.word	0x00060106
 8001a48:	fffdffff 	.word	0xfffdffff
 8001a4c:	00010300 	.word	0x00010300
 8001a50:	00020300 	.word	0x00020300
 8001a54:	00040104 	.word	0x00040104
 8001a58:	00080206 	.word	0x00080206
 8001a5c:	0009030a 	.word	0x0009030a
 8001a60:	000b011a 	.word	0x000b011a
 8001a64:	000c011b 	.word	0x000c011b
 8001a68:	0011010e 	.word	0x0011010e
 8001a6c:	ffebfcea 	.word	0xffebfcea

08001a70 <ADC_DeInit>:
 8001a70:	4b0a      	ldr	r3, [pc, #40]	; (8001a9c <ADC_DeInit+0x2c>)
 8001a72:	b510      	push	{r4, lr}
 8001a74:	18c4      	adds	r4, r0, r3
 8001a76:	4263      	negs	r3, r4
 8001a78:	415c      	adcs	r4, r3
 8001a7a:	b2e4      	uxtb	r4, r4
 8001a7c:	1c20      	adds	r0, r4, #0
 8001a7e:	f7ff fa23 	bl	8000ec8 <assert_param>
 8001a82:	2c00      	cmp	r4, #0
 8001a84:	d009      	beq.n	8001a9a <ADC_DeInit+0x2a>
 8001a86:	2080      	movs	r0, #128	; 0x80
 8001a88:	0080      	lsls	r0, r0, #2
 8001a8a:	2101      	movs	r1, #1
 8001a8c:	f000 fbd6 	bl	800223c <RCC_APB2PeriphResetCmd>
 8001a90:	2080      	movs	r0, #128	; 0x80
 8001a92:	0080      	lsls	r0, r0, #2
 8001a94:	2100      	movs	r1, #0
 8001a96:	f000 fbd1 	bl	800223c <RCC_APB2PeriphResetCmd>
 8001a9a:	bd10      	pop	{r4, pc}
 8001a9c:	bffedc00 	.word	0xbffedc00

08001aa0 <ADC_Init>:
 8001aa0:	b570      	push	{r4, r5, r6, lr}
 8001aa2:	1c0c      	adds	r4, r1, #0
 8001aa4:	4924      	ldr	r1, [pc, #144]	; (8001b38 <ADC_Init+0x98>)
 8001aa6:	1c05      	adds	r5, r0, #0
 8001aa8:	1840      	adds	r0, r0, r1
 8001aaa:	4243      	negs	r3, r0
 8001aac:	4158      	adcs	r0, r3
 8001aae:	f7ff fa0b 	bl	8000ec8 <assert_param>
 8001ab2:	6820      	ldr	r0, [r4, #0]
 8001ab4:	2318      	movs	r3, #24
 8001ab6:	4398      	bics	r0, r3
 8001ab8:	4243      	negs	r3, r0
 8001aba:	4158      	adcs	r0, r3
 8001abc:	f7ff fa04 	bl	8000ec8 <assert_param>
 8001ac0:	7923      	ldrb	r3, [r4, #4]
 8001ac2:	2601      	movs	r6, #1
 8001ac4:	2000      	movs	r0, #0
 8001ac6:	429e      	cmp	r6, r3
 8001ac8:	4140      	adcs	r0, r0
 8001aca:	f7ff f9fd 	bl	8000ec8 <assert_param>
 8001ace:	68a3      	ldr	r3, [r4, #8]
 8001ad0:	481a      	ldr	r0, [pc, #104]	; (8001b3c <ADC_Init+0x9c>)
 8001ad2:	4018      	ands	r0, r3
 8001ad4:	4243      	negs	r3, r0
 8001ad6:	4158      	adcs	r0, r3
 8001ad8:	f7ff f9f6 	bl	8000ec8 <assert_param>
 8001adc:	68e3      	ldr	r3, [r4, #12]
 8001ade:	22c0      	movs	r2, #192	; 0xc0
 8001ae0:	1c19      	adds	r1, r3, #0
 8001ae2:	4391      	bics	r1, r2
 8001ae4:	1c30      	adds	r0, r6, #0
 8001ae6:	2900      	cmp	r1, #0
 8001ae8:	d003      	beq.n	8001af2 <ADC_Init+0x52>
 8001aea:	1e58      	subs	r0, r3, #1
 8001aec:	38ff      	subs	r0, #255	; 0xff
 8001aee:	4243      	negs	r3, r0
 8001af0:	4158      	adcs	r0, r3
 8001af2:	f7ff f9e9 	bl	8000ec8 <assert_param>
 8001af6:	6920      	ldr	r0, [r4, #16]
 8001af8:	2320      	movs	r3, #32
 8001afa:	4398      	bics	r0, r3
 8001afc:	4243      	negs	r3, r0
 8001afe:	4158      	adcs	r0, r3
 8001b00:	f7ff f9e2 	bl	8000ec8 <assert_param>
 8001b04:	6960      	ldr	r0, [r4, #20]
 8001b06:	2304      	movs	r3, #4
 8001b08:	4398      	bics	r0, r3
 8001b0a:	4243      	negs	r3, r0
 8001b0c:	4158      	adcs	r0, r3
 8001b0e:	f7ff f9db 	bl	8000ec8 <assert_param>
 8001b12:	6823      	ldr	r3, [r4, #0]
 8001b14:	68a2      	ldr	r2, [r4, #8]
 8001b16:	68e9      	ldr	r1, [r5, #12]
 8001b18:	431a      	orrs	r2, r3
 8001b1a:	68e3      	ldr	r3, [r4, #12]
 8001b1c:	431a      	orrs	r2, r3
 8001b1e:	6923      	ldr	r3, [r4, #16]
 8001b20:	431a      	orrs	r2, r3
 8001b22:	6963      	ldr	r3, [r4, #20]
 8001b24:	431a      	orrs	r2, r3
 8001b26:	4b06      	ldr	r3, [pc, #24]	; (8001b40 <ADC_Init+0xa0>)
 8001b28:	400b      	ands	r3, r1
 8001b2a:	4313      	orrs	r3, r2
 8001b2c:	7922      	ldrb	r2, [r4, #4]
 8001b2e:	0352      	lsls	r2, r2, #13
 8001b30:	4313      	orrs	r3, r2
 8001b32:	60eb      	str	r3, [r5, #12]
 8001b34:	bd70      	pop	{r4, r5, r6, pc}
 8001b36:	46c0      	nop			; (mov r8, r8)
 8001b38:	bffedc00 	.word	0xbffedc00
 8001b3c:	fffff3ff 	.word	0xfffff3ff
 8001b40:	ffffd203 	.word	0xffffd203

08001b44 <ADC_Cmd>:
 8001b44:	4b0c      	ldr	r3, [pc, #48]	; (8001b78 <ADC_Cmd+0x34>)
 8001b46:	b570      	push	{r4, r5, r6, lr}
 8001b48:	1c04      	adds	r4, r0, #0
 8001b4a:	18c0      	adds	r0, r0, r3
 8001b4c:	4243      	negs	r3, r0
 8001b4e:	4158      	adcs	r0, r3
 8001b50:	1c0e      	adds	r6, r1, #0
 8001b52:	2501      	movs	r5, #1
 8001b54:	f7ff f9b8 	bl	8000ec8 <assert_param>
 8001b58:	2000      	movs	r0, #0
 8001b5a:	42b5      	cmp	r5, r6
 8001b5c:	4140      	adcs	r0, r0
 8001b5e:	f7ff f9b3 	bl	8000ec8 <assert_param>
 8001b62:	68a3      	ldr	r3, [r4, #8]
 8001b64:	2e00      	cmp	r6, #0
 8001b66:	d002      	beq.n	8001b6e <ADC_Cmd+0x2a>
 8001b68:	431d      	orrs	r5, r3
 8001b6a:	60a5      	str	r5, [r4, #8]
 8001b6c:	e002      	b.n	8001b74 <ADC_Cmd+0x30>
 8001b6e:	2202      	movs	r2, #2
 8001b70:	4313      	orrs	r3, r2
 8001b72:	60a3      	str	r3, [r4, #8]
 8001b74:	bd70      	pop	{r4, r5, r6, pc}
 8001b76:	46c0      	nop			; (mov r8, r8)
 8001b78:	bffedc00 	.word	0xbffedc00

08001b7c <ADC_TempSensorCmd>:
 8001b7c:	2301      	movs	r3, #1
 8001b7e:	b510      	push	{r4, lr}
 8001b80:	1c04      	adds	r4, r0, #0
 8001b82:	2000      	movs	r0, #0
 8001b84:	42a3      	cmp	r3, r4
 8001b86:	4140      	adcs	r0, r0
 8001b88:	f7ff f99e 	bl	8000ec8 <assert_param>
 8001b8c:	4b05      	ldr	r3, [pc, #20]	; (8001ba4 <ADC_TempSensorCmd+0x28>)
 8001b8e:	6819      	ldr	r1, [r3, #0]
 8001b90:	2c00      	cmp	r4, #0
 8001b92:	d003      	beq.n	8001b9c <ADC_TempSensorCmd+0x20>
 8001b94:	2280      	movs	r2, #128	; 0x80
 8001b96:	0412      	lsls	r2, r2, #16
 8001b98:	430a      	orrs	r2, r1
 8001b9a:	e001      	b.n	8001ba0 <ADC_TempSensorCmd+0x24>
 8001b9c:	4a02      	ldr	r2, [pc, #8]	; (8001ba8 <ADC_TempSensorCmd+0x2c>)
 8001b9e:	400a      	ands	r2, r1
 8001ba0:	601a      	str	r2, [r3, #0]
 8001ba2:	bd10      	pop	{r4, pc}
 8001ba4:	40012708 	.word	0x40012708
 8001ba8:	ff7fffff 	.word	0xff7fffff

08001bac <ADC_ChannelConfig>:
 8001bac:	4b0e      	ldr	r3, [pc, #56]	; (8001be8 <ADC_ChannelConfig+0x3c>)
 8001bae:	b570      	push	{r4, r5, r6, lr}
 8001bb0:	1c04      	adds	r4, r0, #0
 8001bb2:	18c0      	adds	r0, r0, r3
 8001bb4:	4243      	negs	r3, r0
 8001bb6:	4158      	adcs	r0, r3
 8001bb8:	1c0d      	adds	r5, r1, #0
 8001bba:	1c16      	adds	r6, r2, #0
 8001bbc:	f7ff f984 	bl	8000ec8 <assert_param>
 8001bc0:	2000      	movs	r0, #0
 8001bc2:	4285      	cmp	r5, r0
 8001bc4:	d002      	beq.n	8001bcc <ADC_ChannelConfig+0x20>
 8001bc6:	0ce8      	lsrs	r0, r5, #19
 8001bc8:	4243      	negs	r3, r0
 8001bca:	4158      	adcs	r0, r3
 8001bcc:	f7ff f97c 	bl	8000ec8 <assert_param>
 8001bd0:	2307      	movs	r3, #7
 8001bd2:	2000      	movs	r0, #0
 8001bd4:	42b3      	cmp	r3, r6
 8001bd6:	4140      	adcs	r0, r0
 8001bd8:	f7ff f976 	bl	8000ec8 <assert_param>
 8001bdc:	6aa3      	ldr	r3, [r4, #40]	; 0x28
 8001bde:	431d      	orrs	r5, r3
 8001be0:	62a5      	str	r5, [r4, #40]	; 0x28
 8001be2:	6166      	str	r6, [r4, #20]
 8001be4:	bd70      	pop	{r4, r5, r6, pc}
 8001be6:	46c0      	nop			; (mov r8, r8)
 8001be8:	bffedc00 	.word	0xbffedc00

08001bec <ADC_GetCalibrationFactor>:
 8001bec:	4b0e      	ldr	r3, [pc, #56]	; (8001c28 <ADC_GetCalibrationFactor+0x3c>)
 8001bee:	b510      	push	{r4, lr}
 8001bf0:	1c04      	adds	r4, r0, #0
 8001bf2:	18c0      	adds	r0, r0, r3
 8001bf4:	4243      	negs	r3, r0
 8001bf6:	4158      	adcs	r0, r3
 8001bf8:	f7ff f966 	bl	8000ec8 <assert_param>
 8001bfc:	68a2      	ldr	r2, [r4, #8]
 8001bfe:	2380      	movs	r3, #128	; 0x80
 8001c00:	061b      	lsls	r3, r3, #24
 8001c02:	4313      	orrs	r3, r2
 8001c04:	60a3      	str	r3, [r4, #8]
 8001c06:	23f0      	movs	r3, #240	; 0xf0
 8001c08:	021b      	lsls	r3, r3, #8
 8001c0a:	68a2      	ldr	r2, [r4, #8]
 8001c0c:	3b01      	subs	r3, #1
 8001c0e:	0fd2      	lsrs	r2, r2, #31
 8001c10:	07d2      	lsls	r2, r2, #31
 8001c12:	2b00      	cmp	r3, #0
 8001c14:	d001      	beq.n	8001c1a <ADC_GetCalibrationFactor+0x2e>
 8001c16:	2a00      	cmp	r2, #0
 8001c18:	d1f7      	bne.n	8001c0a <ADC_GetCalibrationFactor+0x1e>
 8001c1a:	68a3      	ldr	r3, [r4, #8]
 8001c1c:	2b00      	cmp	r3, #0
 8001c1e:	db01      	blt.n	8001c24 <ADC_GetCalibrationFactor+0x38>
 8001c20:	6c20      	ldr	r0, [r4, #64]	; 0x40
 8001c22:	e000      	b.n	8001c26 <ADC_GetCalibrationFactor+0x3a>
 8001c24:	2000      	movs	r0, #0
 8001c26:	bd10      	pop	{r4, pc}
 8001c28:	bffedc00 	.word	0xbffedc00

08001c2c <ADC_StartOfConversion>:
 8001c2c:	4b06      	ldr	r3, [pc, #24]	; (8001c48 <ADC_StartOfConversion+0x1c>)
 8001c2e:	b510      	push	{r4, lr}
 8001c30:	1c04      	adds	r4, r0, #0
 8001c32:	18c0      	adds	r0, r0, r3
 8001c34:	4243      	negs	r3, r0
 8001c36:	4158      	adcs	r0, r3
 8001c38:	f7ff f946 	bl	8000ec8 <assert_param>
 8001c3c:	68a3      	ldr	r3, [r4, #8]
 8001c3e:	2204      	movs	r2, #4
 8001c40:	4313      	orrs	r3, r2
 8001c42:	60a3      	str	r3, [r4, #8]
 8001c44:	bd10      	pop	{r4, pc}
 8001c46:	46c0      	nop			; (mov r8, r8)
 8001c48:	bffedc00 	.word	0xbffedc00

08001c4c <ADC_GetConversionValue>:
 8001c4c:	4b05      	ldr	r3, [pc, #20]	; (8001c64 <ADC_GetConversionValue+0x18>)
 8001c4e:	b510      	push	{r4, lr}
 8001c50:	1c04      	adds	r4, r0, #0
 8001c52:	18c0      	adds	r0, r0, r3
 8001c54:	4243      	negs	r3, r0
 8001c56:	4158      	adcs	r0, r3
 8001c58:	f7ff f936 	bl	8000ec8 <assert_param>
 8001c5c:	6c20      	ldr	r0, [r4, #64]	; 0x40
 8001c5e:	b280      	uxth	r0, r0
 8001c60:	bd10      	pop	{r4, pc}
 8001c62:	46c0      	nop			; (mov r8, r8)
 8001c64:	bffedc00 	.word	0xbffedc00

08001c68 <ADC_GetFlagStatus>:
 8001c68:	4a15      	ldr	r2, [pc, #84]	; (8001cc0 <ADC_GetFlagStatus+0x58>)
 8001c6a:	b570      	push	{r4, r5, r6, lr}
 8001c6c:	1c05      	adds	r5, r0, #0
 8001c6e:	1880      	adds	r0, r0, r2
 8001c70:	1c0c      	adds	r4, r1, #0
 8001c72:	4243      	negs	r3, r0
 8001c74:	4158      	adcs	r0, r3
 8001c76:	4e13      	ldr	r6, [pc, #76]	; (8001cc4 <ADC_GetFlagStatus+0x5c>)
 8001c78:	f7ff f926 	bl	8000ec8 <assert_param>
 8001c7c:	1c23      	adds	r3, r4, #0
 8001c7e:	4033      	ands	r3, r6
 8001c80:	1e5a      	subs	r2, r3, #1
 8001c82:	2a01      	cmp	r2, #1
 8001c84:	d90d      	bls.n	8001ca2 <ADC_GetFlagStatus+0x3a>
 8001c86:	2b04      	cmp	r3, #4
 8001c88:	d00b      	beq.n	8001ca2 <ADC_GetFlagStatus+0x3a>
 8001c8a:	2c08      	cmp	r4, #8
 8001c8c:	d009      	beq.n	8001ca2 <ADC_GetFlagStatus+0x3a>
 8001c8e:	2c80      	cmp	r4, #128	; 0x80
 8001c90:	d007      	beq.n	8001ca2 <ADC_GetFlagStatus+0x3a>
 8001c92:	2b10      	cmp	r3, #16
 8001c94:	d005      	beq.n	8001ca2 <ADC_GetFlagStatus+0x3a>
 8001c96:	22fe      	movs	r2, #254	; 0xfe
 8001c98:	05d2      	lsls	r2, r2, #23
 8001c9a:	18a3      	adds	r3, r4, r2
 8001c9c:	4258      	negs	r0, r3
 8001c9e:	4158      	adcs	r0, r3
 8001ca0:	e000      	b.n	8001ca4 <ADC_GetFlagStatus+0x3c>
 8001ca2:	2001      	movs	r0, #1
 8001ca4:	f7ff f910 	bl	8000ec8 <assert_param>
 8001ca8:	01e3      	lsls	r3, r4, #7
 8001caa:	d502      	bpl.n	8001cb2 <ADC_GetFlagStatus+0x4a>
 8001cac:	68ab      	ldr	r3, [r5, #8]
 8001cae:	401e      	ands	r6, r3
 8001cb0:	e000      	b.n	8001cb4 <ADC_GetFlagStatus+0x4c>
 8001cb2:	682e      	ldr	r6, [r5, #0]
 8001cb4:	4026      	ands	r6, r4
 8001cb6:	1e74      	subs	r4, r6, #1
 8001cb8:	41a6      	sbcs	r6, r4
 8001cba:	b2f0      	uxtb	r0, r6
 8001cbc:	bd70      	pop	{r4, r5, r6, pc}
 8001cbe:	46c0      	nop			; (mov r8, r8)
 8001cc0:	bffedc00 	.word	0xbffedc00
 8001cc4:	feffffff 	.word	0xfeffffff

08001cc8 <ADC_ClearFlag>:
 8001cc8:	b538      	push	{r3, r4, r5, lr}
 8001cca:	4b0a      	ldr	r3, [pc, #40]	; (8001cf4 <ADC_ClearFlag+0x2c>)
 8001ccc:	1c05      	adds	r5, r0, #0
 8001cce:	18c0      	adds	r0, r0, r3
 8001cd0:	4243      	negs	r3, r0
 8001cd2:	4158      	adcs	r0, r3
 8001cd4:	1c0c      	adds	r4, r1, #0
 8001cd6:	f7ff f8f7 	bl	8000ec8 <assert_param>
 8001cda:	2000      	movs	r0, #0
 8001cdc:	4284      	cmp	r4, r0
 8001cde:	d004      	beq.n	8001cea <ADC_ClearFlag+0x22>
 8001ce0:	239f      	movs	r3, #159	; 0x9f
 8001ce2:	1c20      	adds	r0, r4, #0
 8001ce4:	4398      	bics	r0, r3
 8001ce6:	4243      	negs	r3, r0
 8001ce8:	4158      	adcs	r0, r3
 8001cea:	f7ff f8ed 	bl	8000ec8 <assert_param>
 8001cee:	602c      	str	r4, [r5, #0]
 8001cf0:	bd38      	pop	{r3, r4, r5, pc}
 8001cf2:	46c0      	nop			; (mov r8, r8)
 8001cf4:	bffedc00 	.word	0xbffedc00

08001cf8 <SPI_Init>:
 8001cf8:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
 8001cfa:	4b4d      	ldr	r3, [pc, #308]	; (8001e30 <SPI_Init+0x138>)
 8001cfc:	1c05      	adds	r5, r0, #0
 8001cfe:	1c0c      	adds	r4, r1, #0
 8001d00:	4298      	cmp	r0, r3
 8001d02:	d004      	beq.n	8001d0e <SPI_Init+0x16>
 8001d04:	4b4b      	ldr	r3, [pc, #300]	; (8001e34 <SPI_Init+0x13c>)
 8001d06:	18c0      	adds	r0, r0, r3
 8001d08:	4243      	negs	r3, r0
 8001d0a:	4158      	adcs	r0, r3
 8001d0c:	e000      	b.n	8001d10 <SPI_Init+0x18>
 8001d0e:	2001      	movs	r0, #1
 8001d10:	f7ff f8da 	bl	8000ec8 <assert_param>
 8001d14:	4e48      	ldr	r6, [pc, #288]	; (8001e38 <SPI_Init+0x140>)
 8001d16:	8823      	ldrh	r3, [r4, #0]
 8001d18:	4233      	tst	r3, r6
 8001d1a:	d101      	bne.n	8001d20 <SPI_Init+0x28>
 8001d1c:	2001      	movs	r0, #1
 8001d1e:	e006      	b.n	8001d2e <SPI_Init+0x36>
 8001d20:	4a46      	ldr	r2, [pc, #280]	; (8001e3c <SPI_Init+0x144>)
 8001d22:	4013      	ands	r3, r2
 8001d24:	2280      	movs	r2, #128	; 0x80
 8001d26:	0212      	lsls	r2, r2, #8
 8001d28:	4293      	cmp	r3, r2
 8001d2a:	d0f7      	beq.n	8001d1c <SPI_Init+0x24>
 8001d2c:	2000      	movs	r0, #0
 8001d2e:	f7ff f8cb 	bl	8000ec8 <assert_param>
 8001d32:	8860      	ldrh	r0, [r4, #2]
 8001d34:	2382      	movs	r3, #130	; 0x82
 8001d36:	005b      	lsls	r3, r3, #1
 8001d38:	4298      	cmp	r0, r3
 8001d3a:	d002      	beq.n	8001d42 <SPI_Init+0x4a>
 8001d3c:	4243      	negs	r3, r0
 8001d3e:	4158      	adcs	r0, r3
 8001d40:	e000      	b.n	8001d44 <SPI_Init+0x4c>
 8001d42:	2001      	movs	r0, #1
 8001d44:	f7ff f8c0 	bl	8000ec8 <assert_param>
 8001d48:	88a0      	ldrh	r0, [r4, #4]
 8001d4a:	23c0      	movs	r3, #192	; 0xc0
 8001d4c:	1c02      	adds	r2, r0, #0
 8001d4e:	4032      	ands	r2, r6
 8001d50:	009b      	lsls	r3, r3, #2
 8001d52:	4e3b      	ldr	r6, [pc, #236]	; (8001e40 <SPI_Init+0x148>)
 8001d54:	429a      	cmp	r2, r3
 8001d56:	d016      	beq.n	8001d86 <SPI_Init+0x8e>
 8001d58:	4a3a      	ldr	r2, [pc, #232]	; (8001e44 <SPI_Init+0x14c>)
 8001d5a:	2380      	movs	r3, #128	; 0x80
 8001d5c:	4002      	ands	r2, r0
 8001d5e:	00db      	lsls	r3, r3, #3
 8001d60:	429a      	cmp	r2, r3
 8001d62:	d010      	beq.n	8001d86 <SPI_Init+0x8e>
 8001d64:	1c02      	adds	r2, r0, #0
 8001d66:	23c0      	movs	r3, #192	; 0xc0
 8001d68:	4032      	ands	r2, r6
 8001d6a:	00db      	lsls	r3, r3, #3
 8001d6c:	429a      	cmp	r2, r3
 8001d6e:	d00a      	beq.n	8001d86 <SPI_Init+0x8e>
 8001d70:	4a35      	ldr	r2, [pc, #212]	; (8001e48 <SPI_Init+0x150>)
 8001d72:	2380      	movs	r3, #128	; 0x80
 8001d74:	4002      	ands	r2, r0
 8001d76:	011b      	lsls	r3, r3, #4
 8001d78:	429a      	cmp	r2, r3
 8001d7a:	d004      	beq.n	8001d86 <SPI_Init+0x8e>
 8001d7c:	4b33      	ldr	r3, [pc, #204]	; (8001e4c <SPI_Init+0x154>)
 8001d7e:	18c0      	adds	r0, r0, r3
 8001d80:	4243      	negs	r3, r0
 8001d82:	4158      	adcs	r0, r3
 8001d84:	e000      	b.n	8001d88 <SPI_Init+0x90>
 8001d86:	2001      	movs	r0, #1
 8001d88:	f7ff f89e 	bl	8000ec8 <assert_param>
 8001d8c:	88e0      	ldrh	r0, [r4, #6]
 8001d8e:	2302      	movs	r3, #2
 8001d90:	4398      	bics	r0, r3
 8001d92:	4243      	negs	r3, r0
 8001d94:	4158      	adcs	r0, r3
 8001d96:	f7ff f897 	bl	8000ec8 <assert_param>
 8001d9a:	2700      	movs	r7, #0
 8001d9c:	8923      	ldrh	r3, [r4, #8]
 8001d9e:	2201      	movs	r2, #1
 8001da0:	1c38      	adds	r0, r7, #0
 8001da2:	429a      	cmp	r2, r3
 8001da4:	4178      	adcs	r0, r7
 8001da6:	f7ff f88f 	bl	8000ec8 <assert_param>
 8001daa:	4b29      	ldr	r3, [pc, #164]	; (8001e50 <SPI_Init+0x158>)
 8001dac:	8960      	ldrh	r0, [r4, #10]
 8001dae:	4018      	ands	r0, r3
 8001db0:	4243      	negs	r3, r0
 8001db2:	4158      	adcs	r0, r3
 8001db4:	f7ff f888 	bl	8000ec8 <assert_param>
 8001db8:	89a3      	ldrh	r3, [r4, #12]
 8001dba:	2218      	movs	r2, #24
 8001dbc:	4393      	bics	r3, r2
 8001dbe:	42bb      	cmp	r3, r7
 8001dc0:	d101      	bne.n	8001dc6 <SPI_Init+0xce>
 8001dc2:	2001      	movs	r0, #1
 8001dc4:	e002      	b.n	8001dcc <SPI_Init+0xd4>
 8001dc6:	2b20      	cmp	r3, #32
 8001dc8:	d0fb      	beq.n	8001dc2 <SPI_Init+0xca>
 8001dca:	1c38      	adds	r0, r7, #0
 8001dcc:	f7ff f87c 	bl	8000ec8 <assert_param>
 8001dd0:	89e0      	ldrh	r0, [r4, #14]
 8001dd2:	2380      	movs	r3, #128	; 0x80
 8001dd4:	4398      	bics	r0, r3
 8001dd6:	4243      	negs	r3, r0
 8001dd8:	4158      	adcs	r0, r3
 8001dda:	f7ff f875 	bl	8000ec8 <assert_param>
 8001dde:	8a20      	ldrh	r0, [r4, #16]
 8001de0:	1e43      	subs	r3, r0, #1
 8001de2:	4198      	sbcs	r0, r3
 8001de4:	f7ff f870 	bl	8000ec8 <assert_param>
 8001de8:	882b      	ldrh	r3, [r5, #0]
 8001dea:	22c1      	movs	r2, #193	; 0xc1
 8001dec:	0192      	lsls	r2, r2, #6
 8001dee:	89e1      	ldrh	r1, [r4, #14]
 8001df0:	401a      	ands	r2, r3
 8001df2:	8823      	ldrh	r3, [r4, #0]
 8001df4:	430b      	orrs	r3, r1
 8001df6:	88e1      	ldrh	r1, [r4, #6]
 8001df8:	430b      	orrs	r3, r1
 8001dfa:	8921      	ldrh	r1, [r4, #8]
 8001dfc:	430b      	orrs	r3, r1
 8001dfe:	8961      	ldrh	r1, [r4, #10]
 8001e00:	430b      	orrs	r3, r1
 8001e02:	89a1      	ldrh	r1, [r4, #12]
 8001e04:	430b      	orrs	r3, r1
 8001e06:	4313      	orrs	r3, r2
 8001e08:	802b      	strh	r3, [r5, #0]
 8001e0a:	88aa      	ldrh	r2, [r5, #4]
 8001e0c:	4b11      	ldr	r3, [pc, #68]	; (8001e54 <SPI_Init+0x15c>)
 8001e0e:	4013      	ands	r3, r2
 8001e10:	88a2      	ldrh	r2, [r4, #4]
 8001e12:	4313      	orrs	r3, r2
 8001e14:	80ab      	strh	r3, [r5, #4]
 8001e16:	8a23      	ldrh	r3, [r4, #16]
 8001e18:	2204      	movs	r2, #4
 8001e1a:	822b      	strh	r3, [r5, #16]
 8001e1c:	882b      	ldrh	r3, [r5, #0]
 8001e1e:	4393      	bics	r3, r2
 8001e20:	8862      	ldrh	r2, [r4, #2]
 8001e22:	4313      	orrs	r3, r2
 8001e24:	802b      	strh	r3, [r5, #0]
 8001e26:	8bab      	ldrh	r3, [r5, #28]
 8001e28:	401e      	ands	r6, r3
 8001e2a:	83ae      	strh	r6, [r5, #28]
 8001e2c:	bdf8      	pop	{r3, r4, r5, r6, r7, pc}
 8001e2e:	46c0      	nop			; (mov r8, r8)
 8001e30:	40013000 	.word	0x40013000
 8001e34:	bfffc800 	.word	0xbfffc800
 8001e38:	fffffbff 	.word	0xfffffbff
 8001e3c:	ffffbfff 	.word	0xffffbfff
 8001e40:	fffff7ff 	.word	0xfffff7ff
 8001e44:	fffff6ff 	.word	0xfffff6ff
 8001e48:	fffffcff 	.word	0xfffffcff
 8001e4c:	fffff100 	.word	0xfffff100
 8001e50:	fffffdff 	.word	0xfffffdff
 8001e54:	fffff0ff 	.word	0xfffff0ff

08001e58 <SPI_Cmd>:
 8001e58:	b538      	push	{r3, r4, r5, lr}
 8001e5a:	4b0e      	ldr	r3, [pc, #56]	; (8001e94 <SPI_Cmd+0x3c>)
 8001e5c:	1c04      	adds	r4, r0, #0
 8001e5e:	1c0d      	adds	r5, r1, #0
 8001e60:	4298      	cmp	r0, r3
 8001e62:	d004      	beq.n	8001e6e <SPI_Cmd+0x16>
 8001e64:	4b0c      	ldr	r3, [pc, #48]	; (8001e98 <SPI_Cmd+0x40>)
 8001e66:	18c0      	adds	r0, r0, r3
 8001e68:	4243      	negs	r3, r0
 8001e6a:	4158      	adcs	r0, r3
 8001e6c:	e000      	b.n	8001e70 <SPI_Cmd+0x18>
 8001e6e:	2001      	movs	r0, #1
 8001e70:	f7ff f82a 	bl	8000ec8 <assert_param>
 8001e74:	2301      	movs	r3, #1
 8001e76:	2000      	movs	r0, #0
 8001e78:	42ab      	cmp	r3, r5
 8001e7a:	4140      	adcs	r0, r0
 8001e7c:	f7ff f824 	bl	8000ec8 <assert_param>
 8001e80:	2340      	movs	r3, #64	; 0x40
 8001e82:	8822      	ldrh	r2, [r4, #0]
 8001e84:	2d00      	cmp	r5, #0
 8001e86:	d001      	beq.n	8001e8c <SPI_Cmd+0x34>
 8001e88:	4313      	orrs	r3, r2
 8001e8a:	e001      	b.n	8001e90 <SPI_Cmd+0x38>
 8001e8c:	439a      	bics	r2, r3
 8001e8e:	1c13      	adds	r3, r2, #0
 8001e90:	8023      	strh	r3, [r4, #0]
 8001e92:	bd38      	pop	{r3, r4, r5, pc}
 8001e94:	40013000 	.word	0x40013000
 8001e98:	bfffc800 	.word	0xbfffc800

08001e9c <SPI_RxFIFOThresholdConfig>:
 8001e9c:	4b0d      	ldr	r3, [pc, #52]	; (8001ed4 <SPI_RxFIFOThresholdConfig+0x38>)
 8001e9e:	b570      	push	{r4, r5, r6, lr}
 8001ea0:	1c04      	adds	r4, r0, #0
 8001ea2:	1c0d      	adds	r5, r1, #0
 8001ea4:	4298      	cmp	r0, r3
 8001ea6:	d004      	beq.n	8001eb2 <SPI_RxFIFOThresholdConfig+0x16>
 8001ea8:	4b0b      	ldr	r3, [pc, #44]	; (8001ed8 <SPI_RxFIFOThresholdConfig+0x3c>)
 8001eaa:	18c0      	adds	r0, r0, r3
 8001eac:	4243      	negs	r3, r0
 8001eae:	4158      	adcs	r0, r3
 8001eb0:	e000      	b.n	8001eb4 <SPI_RxFIFOThresholdConfig+0x18>
 8001eb2:	2001      	movs	r0, #1
 8001eb4:	4e09      	ldr	r6, [pc, #36]	; (8001edc <SPI_RxFIFOThresholdConfig+0x40>)
 8001eb6:	f7ff f807 	bl	8000ec8 <assert_param>
 8001eba:	1c28      	adds	r0, r5, #0
 8001ebc:	4030      	ands	r0, r6
 8001ebe:	4243      	negs	r3, r0
 8001ec0:	4158      	adcs	r0, r3
 8001ec2:	f7ff f801 	bl	8000ec8 <assert_param>
 8001ec6:	88a3      	ldrh	r3, [r4, #4]
 8001ec8:	401e      	ands	r6, r3
 8001eca:	80a6      	strh	r6, [r4, #4]
 8001ecc:	88a3      	ldrh	r3, [r4, #4]
 8001ece:	431d      	orrs	r5, r3
 8001ed0:	80a5      	strh	r5, [r4, #4]
 8001ed2:	bd70      	pop	{r4, r5, r6, pc}
 8001ed4:	40013000 	.word	0x40013000
 8001ed8:	bfffc800 	.word	0xbfffc800
 8001edc:	ffffefff 	.word	0xffffefff

08001ee0 <SPI_SendData8>:
 8001ee0:	b538      	push	{r3, r4, r5, lr}
 8001ee2:	4b07      	ldr	r3, [pc, #28]	; (8001f00 <SPI_SendData8+0x20>)
 8001ee4:	1c04      	adds	r4, r0, #0
 8001ee6:	1c0d      	adds	r5, r1, #0
 8001ee8:	4298      	cmp	r0, r3
 8001eea:	d004      	beq.n	8001ef6 <SPI_SendData8+0x16>
 8001eec:	4b05      	ldr	r3, [pc, #20]	; (8001f04 <SPI_SendData8+0x24>)
 8001eee:	18c0      	adds	r0, r0, r3
 8001ef0:	4243      	negs	r3, r0
 8001ef2:	4158      	adcs	r0, r3
 8001ef4:	e000      	b.n	8001ef8 <SPI_SendData8+0x18>
 8001ef6:	2001      	movs	r0, #1
 8001ef8:	f7fe ffe6 	bl	8000ec8 <assert_param>
 8001efc:	7325      	strb	r5, [r4, #12]
 8001efe:	bd38      	pop	{r3, r4, r5, pc}
 8001f00:	40013000 	.word	0x40013000
 8001f04:	bfffc800 	.word	0xbfffc800

08001f08 <NVIC_Init>:
 8001f08:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
 8001f0a:	2500      	movs	r5, #0
 8001f0c:	7883      	ldrb	r3, [r0, #2]
 8001f0e:	1c04      	adds	r4, r0, #0
 8001f10:	2601      	movs	r6, #1
 8001f12:	1c28      	adds	r0, r5, #0
 8001f14:	429e      	cmp	r6, r3
 8001f16:	4168      	adcs	r0, r5
 8001f18:	f7fe ffd6 	bl	8000ec8 <assert_param>
 8001f1c:	7863      	ldrb	r3, [r4, #1]
 8001f1e:	2703      	movs	r7, #3
 8001f20:	1c28      	adds	r0, r5, #0
 8001f22:	429f      	cmp	r7, r3
 8001f24:	4168      	adcs	r0, r5
 8001f26:	f7fe ffcf 	bl	8000ec8 <assert_param>
 8001f2a:	78a2      	ldrb	r2, [r4, #2]
 8001f2c:	7823      	ldrb	r3, [r4, #0]
 8001f2e:	42aa      	cmp	r2, r5
 8001f30:	d01a      	beq.n	8001f68 <NVIC_Init+0x60>
 8001f32:	0899      	lsrs	r1, r3, #2
 8001f34:	4a0f      	ldr	r2, [pc, #60]	; (8001f74 <NVIC_Init+0x6c>)
 8001f36:	0089      	lsls	r1, r1, #2
 8001f38:	1889      	adds	r1, r1, r2
 8001f3a:	22c0      	movs	r2, #192	; 0xc0
 8001f3c:	0092      	lsls	r2, r2, #2
 8001f3e:	401f      	ands	r7, r3
 8001f40:	20ff      	movs	r0, #255	; 0xff
 8001f42:	588d      	ldr	r5, [r1, r2]
 8001f44:	00ff      	lsls	r7, r7, #3
 8001f46:	1c03      	adds	r3, r0, #0
 8001f48:	40bb      	lsls	r3, r7
 8001f4a:	439d      	bics	r5, r3
 8001f4c:	7863      	ldrb	r3, [r4, #1]
 8001f4e:	019b      	lsls	r3, r3, #6
 8001f50:	4018      	ands	r0, r3
 8001f52:	40b8      	lsls	r0, r7
 8001f54:	1c2f      	adds	r7, r5, #0
 8001f56:	4307      	orrs	r7, r0
 8001f58:	508f      	str	r7, [r1, r2]
 8001f5a:	7822      	ldrb	r2, [r4, #0]
 8001f5c:	231f      	movs	r3, #31
 8001f5e:	4013      	ands	r3, r2
 8001f60:	409e      	lsls	r6, r3
 8001f62:	4b04      	ldr	r3, [pc, #16]	; (8001f74 <NVIC_Init+0x6c>)
 8001f64:	601e      	str	r6, [r3, #0]
 8001f66:	e004      	b.n	8001f72 <NVIC_Init+0x6a>
 8001f68:	271f      	movs	r7, #31
 8001f6a:	403b      	ands	r3, r7
 8001f6c:	4a02      	ldr	r2, [pc, #8]	; (8001f78 <NVIC_Init+0x70>)
 8001f6e:	409e      	lsls	r6, r3
 8001f70:	67d6      	str	r6, [r2, #124]	; 0x7c
 8001f72:	bdf8      	pop	{r3, r4, r5, r6, r7, pc}
 8001f74:	e000e100 	.word	0xe000e100
 8001f78:	e000e104 	.word	0xe000e104

08001f7c <RCC_HSI14Cmd>:
 8001f7c:	b538      	push	{r3, r4, r5, lr}
 8001f7e:	1c05      	adds	r5, r0, #0
 8001f80:	2401      	movs	r4, #1
 8001f82:	2000      	movs	r0, #0
 8001f84:	42ac      	cmp	r4, r5
 8001f86:	4140      	adcs	r0, r0
 8001f88:	f7fe ff9e 	bl	8000ec8 <assert_param>
 8001f8c:	4b04      	ldr	r3, [pc, #16]	; (8001fa0 <RCC_HSI14Cmd+0x24>)
 8001f8e:	6b5a      	ldr	r2, [r3, #52]	; 0x34
 8001f90:	2d00      	cmp	r5, #0
 8001f92:	d002      	beq.n	8001f9a <RCC_HSI14Cmd+0x1e>
 8001f94:	4314      	orrs	r4, r2
 8001f96:	635c      	str	r4, [r3, #52]	; 0x34
 8001f98:	e001      	b.n	8001f9e <RCC_HSI14Cmd+0x22>
 8001f9a:	43a2      	bics	r2, r4
 8001f9c:	635a      	str	r2, [r3, #52]	; 0x34
 8001f9e:	bd38      	pop	{r3, r4, r5, pc}
 8001fa0:	40021000 	.word	0x40021000

08001fa4 <RCC_ADCCLKConfig>:
 8001fa4:	4b0e      	ldr	r3, [pc, #56]	; (8001fe0 <RCC_ADCCLKConfig+0x3c>)
 8001fa6:	b510      	push	{r4, lr}
 8001fa8:	1c04      	adds	r4, r0, #0
 8001faa:	2001      	movs	r0, #1
 8001fac:	421c      	tst	r4, r3
 8001fae:	d003      	beq.n	8001fb8 <RCC_ADCCLKConfig+0x14>
 8001fb0:	4b0c      	ldr	r3, [pc, #48]	; (8001fe4 <RCC_ADCCLKConfig+0x40>)
 8001fb2:	18e0      	adds	r0, r4, r3
 8001fb4:	4243      	negs	r3, r0
 8001fb6:	4158      	adcs	r0, r3
 8001fb8:	f7fe ff86 	bl	8000ec8 <assert_param>
 8001fbc:	4b0a      	ldr	r3, [pc, #40]	; (8001fe8 <RCC_ADCCLKConfig+0x44>)
 8001fbe:	4a0b      	ldr	r2, [pc, #44]	; (8001fec <RCC_ADCCLKConfig+0x48>)
 8001fc0:	6859      	ldr	r1, [r3, #4]
 8001fc2:	400a      	ands	r2, r1
 8001fc4:	605a      	str	r2, [r3, #4]
 8001fc6:	685a      	ldr	r2, [r3, #4]
 8001fc8:	b2a1      	uxth	r1, r4
 8001fca:	430a      	orrs	r2, r1
 8001fcc:	605a      	str	r2, [r3, #4]
 8001fce:	6b19      	ldr	r1, [r3, #48]	; 0x30
 8001fd0:	4a07      	ldr	r2, [pc, #28]	; (8001ff0 <RCC_ADCCLKConfig+0x4c>)
 8001fd2:	0c24      	lsrs	r4, r4, #16
 8001fd4:	400a      	ands	r2, r1
 8001fd6:	631a      	str	r2, [r3, #48]	; 0x30
 8001fd8:	6b1a      	ldr	r2, [r3, #48]	; 0x30
 8001fda:	4314      	orrs	r4, r2
 8001fdc:	631c      	str	r4, [r3, #48]	; 0x30
 8001fde:	bd10      	pop	{r4, pc}
 8001fe0:	feffffff 	.word	0xfeffffff
 8001fe4:	feffc000 	.word	0xfeffc000
 8001fe8:	40021000 	.word	0x40021000
 8001fec:	ffffbfff 	.word	0xffffbfff
 8001ff0:	fffffeff 	.word	0xfffffeff

08001ff4 <RCC_GetClocksFreq>:
 8001ff4:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
 8001ff6:	4d5a      	ldr	r5, [pc, #360]	; (8002160 <RCC_GetClocksFreq+0x16c>)
 8001ff8:	1c04      	adds	r4, r0, #0
 8001ffa:	6868      	ldr	r0, [r5, #4]
 8001ffc:	230c      	movs	r3, #12
 8001ffe:	4018      	ands	r0, r3
 8002000:	f000 fa14 	bl	800242c <__gnu_thumb1_case_uqi>
 8002004:	1f1f1f1f 	.word	0x1f1f1f1f
 8002008:	1f1f1f1f 	.word	0x1f1f1f1f
 800200c:	1f1f1f07 	.word	0x1f1f1f07
 8002010:	1d          	.byte	0x1d
 8002011:	00          	.byte	0x00
 8002012:	686e      	ldr	r6, [r5, #4]
 8002014:	23c0      	movs	r3, #192	; 0xc0
 8002016:	02b6      	lsls	r6, r6, #10
 8002018:	686a      	ldr	r2, [r5, #4]
 800201a:	0f36      	lsrs	r6, r6, #28
 800201c:	025b      	lsls	r3, r3, #9
 800201e:	3602      	adds	r6, #2
 8002020:	421a      	tst	r2, r3
 8002022:	d101      	bne.n	8002028 <RCC_GetClocksFreq+0x34>
 8002024:	484f      	ldr	r0, [pc, #316]	; (8002164 <RCC_GetClocksFreq+0x170>)
 8002026:	e007      	b.n	8002038 <RCC_GetClocksFreq+0x44>
 8002028:	4b4d      	ldr	r3, [pc, #308]	; (8002160 <RCC_GetClocksFreq+0x16c>)
 800202a:	484f      	ldr	r0, [pc, #316]	; (8002168 <RCC_GetClocksFreq+0x174>)
 800202c:	6ad9      	ldr	r1, [r3, #44]	; 0x2c
 800202e:	230f      	movs	r3, #15
 8002030:	4019      	ands	r1, r3
 8002032:	3101      	adds	r1, #1
 8002034:	f000 fa04 	bl	8002440 <__aeabi_uidiv>
 8002038:	4370      	muls	r0, r6
 800203a:	6020      	str	r0, [r4, #0]
 800203c:	e004      	b.n	8002048 <RCC_GetClocksFreq+0x54>
 800203e:	4b4b      	ldr	r3, [pc, #300]	; (800216c <RCC_GetClocksFreq+0x178>)
 8002040:	e000      	b.n	8002044 <RCC_GetClocksFreq+0x50>
 8002042:	4b49      	ldr	r3, [pc, #292]	; (8002168 <RCC_GetClocksFreq+0x174>)
 8002044:	6023      	str	r3, [r4, #0]
 8002046:	2000      	movs	r0, #0
 8002048:	686b      	ldr	r3, [r5, #4]
 800204a:	4a49      	ldr	r2, [pc, #292]	; (8002170 <RCC_GetClocksFreq+0x17c>)
 800204c:	061b      	lsls	r3, r3, #24
 800204e:	0f1b      	lsrs	r3, r3, #28
 8002050:	6821      	ldr	r1, [r4, #0]
 8002052:	5cd3      	ldrb	r3, [r2, r3]
 8002054:	1c0e      	adds	r6, r1, #0
 8002056:	40de      	lsrs	r6, r3
 8002058:	6066      	str	r6, [r4, #4]
 800205a:	1c33      	adds	r3, r6, #0
 800205c:	686e      	ldr	r6, [r5, #4]
 800205e:	0576      	lsls	r6, r6, #21
 8002060:	0f76      	lsrs	r6, r6, #29
 8002062:	5d92      	ldrb	r2, [r2, r6]
 8002064:	40d3      	lsrs	r3, r2
 8002066:	60a3      	str	r3, [r4, #8]
 8002068:	6b2a      	ldr	r2, [r5, #48]	; 0x30
 800206a:	05d6      	lsls	r6, r2, #23
 800206c:	d401      	bmi.n	8002072 <RCC_GetClocksFreq+0x7e>
 800206e:	4a41      	ldr	r2, [pc, #260]	; (8002174 <RCC_GetClocksFreq+0x180>)
 8002070:	e006      	b.n	8002080 <RCC_GetClocksFreq+0x8c>
 8002072:	4a3b      	ldr	r2, [pc, #236]	; (8002160 <RCC_GetClocksFreq+0x16c>)
 8002074:	6852      	ldr	r2, [r2, #4]
 8002076:	0456      	lsls	r6, r2, #17
 8002078:	d401      	bmi.n	800207e <RCC_GetClocksFreq+0x8a>
 800207a:	085a      	lsrs	r2, r3, #1
 800207c:	e000      	b.n	8002080 <RCC_GetClocksFreq+0x8c>
 800207e:	089a      	lsrs	r2, r3, #2
 8002080:	60e2      	str	r2, [r4, #12]
 8002082:	6b2a      	ldr	r2, [r5, #48]	; 0x30
 8002084:	0656      	lsls	r6, r2, #25
 8002086:	d401      	bmi.n	800208c <RCC_GetClocksFreq+0x98>
 8002088:	4a3b      	ldr	r2, [pc, #236]	; (8002178 <RCC_GetClocksFreq+0x184>)
 800208a:	e001      	b.n	8002090 <RCC_GetClocksFreq+0x9c>
 800208c:	2280      	movs	r2, #128	; 0x80
 800208e:	0212      	lsls	r2, r2, #8
 8002090:	6122      	str	r2, [r4, #16]
 8002092:	6b2a      	ldr	r2, [r5, #48]	; 0x30
 8002094:	06d6      	lsls	r6, r2, #27
 8002096:	d402      	bmi.n	800209e <RCC_GetClocksFreq+0xaa>
 8002098:	4a33      	ldr	r2, [pc, #204]	; (8002168 <RCC_GetClocksFreq+0x174>)
 800209a:	6162      	str	r2, [r4, #20]
 800209c:	e000      	b.n	80020a0 <RCC_GetClocksFreq+0xac>
 800209e:	6161      	str	r1, [r4, #20]
 80020a0:	6b2f      	ldr	r7, [r5, #48]	; 0x30
 80020a2:	2203      	movs	r2, #3
 80020a4:	4e2e      	ldr	r6, [pc, #184]	; (8002160 <RCC_GetClocksFreq+0x16c>)
 80020a6:	4217      	tst	r7, r2
 80020a8:	d101      	bne.n	80020ae <RCC_GetClocksFreq+0xba>
 80020aa:	61a3      	str	r3, [r4, #24]
 80020ac:	e012      	b.n	80020d4 <RCC_GetClocksFreq+0xe0>
 80020ae:	6b37      	ldr	r7, [r6, #48]	; 0x30
 80020b0:	4017      	ands	r7, r2
 80020b2:	2f01      	cmp	r7, #1
 80020b4:	d101      	bne.n	80020ba <RCC_GetClocksFreq+0xc6>
 80020b6:	61a1      	str	r1, [r4, #24]
 80020b8:	e00c      	b.n	80020d4 <RCC_GetClocksFreq+0xe0>
 80020ba:	6b37      	ldr	r7, [r6, #48]	; 0x30
 80020bc:	4017      	ands	r7, r2
 80020be:	2f02      	cmp	r7, #2
 80020c0:	d102      	bne.n	80020c8 <RCC_GetClocksFreq+0xd4>
 80020c2:	2280      	movs	r2, #128	; 0x80
 80020c4:	0212      	lsls	r2, r2, #8
 80020c6:	e004      	b.n	80020d2 <RCC_GetClocksFreq+0xde>
 80020c8:	6b36      	ldr	r6, [r6, #48]	; 0x30
 80020ca:	4032      	ands	r2, r6
 80020cc:	2a03      	cmp	r2, #3
 80020ce:	d101      	bne.n	80020d4 <RCC_GetClocksFreq+0xe0>
 80020d0:	4a25      	ldr	r2, [pc, #148]	; (8002168 <RCC_GetClocksFreq+0x174>)
 80020d2:	61a2      	str	r2, [r4, #24]
 80020d4:	22c0      	movs	r2, #192	; 0xc0
 80020d6:	6b2f      	ldr	r7, [r5, #48]	; 0x30
 80020d8:	0292      	lsls	r2, r2, #10
 80020da:	4e21      	ldr	r6, [pc, #132]	; (8002160 <RCC_GetClocksFreq+0x16c>)
 80020dc:	4217      	tst	r7, r2
 80020de:	d101      	bne.n	80020e4 <RCC_GetClocksFreq+0xf0>
 80020e0:	61e3      	str	r3, [r4, #28]
 80020e2:	e018      	b.n	8002116 <RCC_GetClocksFreq+0x122>
 80020e4:	6b37      	ldr	r7, [r6, #48]	; 0x30
 80020e6:	4017      	ands	r7, r2
 80020e8:	46bc      	mov	ip, r7
 80020ea:	2780      	movs	r7, #128	; 0x80
 80020ec:	027f      	lsls	r7, r7, #9
 80020ee:	45bc      	cmp	ip, r7
 80020f0:	d101      	bne.n	80020f6 <RCC_GetClocksFreq+0x102>
 80020f2:	61e1      	str	r1, [r4, #28]
 80020f4:	e00f      	b.n	8002116 <RCC_GetClocksFreq+0x122>
 80020f6:	6b37      	ldr	r7, [r6, #48]	; 0x30
 80020f8:	4017      	ands	r7, r2
 80020fa:	46bc      	mov	ip, r7
 80020fc:	2780      	movs	r7, #128	; 0x80
 80020fe:	02bf      	lsls	r7, r7, #10
 8002100:	45bc      	cmp	ip, r7
 8002102:	d102      	bne.n	800210a <RCC_GetClocksFreq+0x116>
 8002104:	2280      	movs	r2, #128	; 0x80
 8002106:	0212      	lsls	r2, r2, #8
 8002108:	e004      	b.n	8002114 <RCC_GetClocksFreq+0x120>
 800210a:	6b36      	ldr	r6, [r6, #48]	; 0x30
 800210c:	4016      	ands	r6, r2
 800210e:	4296      	cmp	r6, r2
 8002110:	d101      	bne.n	8002116 <RCC_GetClocksFreq+0x122>
 8002112:	4a15      	ldr	r2, [pc, #84]	; (8002168 <RCC_GetClocksFreq+0x174>)
 8002114:	61e2      	str	r2, [r4, #28]
 8002116:	22c0      	movs	r2, #192	; 0xc0
 8002118:	6b2f      	ldr	r7, [r5, #48]	; 0x30
 800211a:	0312      	lsls	r2, r2, #12
 800211c:	4e10      	ldr	r6, [pc, #64]	; (8002160 <RCC_GetClocksFreq+0x16c>)
 800211e:	4217      	tst	r7, r2
 8002120:	d015      	beq.n	800214e <RCC_GetClocksFreq+0x15a>
 8002122:	6b37      	ldr	r7, [r6, #48]	; 0x30
 8002124:	2380      	movs	r3, #128	; 0x80
 8002126:	4017      	ands	r7, r2
 8002128:	02db      	lsls	r3, r3, #11
 800212a:	429f      	cmp	r7, r3
 800212c:	d101      	bne.n	8002132 <RCC_GetClocksFreq+0x13e>
 800212e:	6221      	str	r1, [r4, #32]
 8002130:	e00e      	b.n	8002150 <RCC_GetClocksFreq+0x15c>
 8002132:	6b31      	ldr	r1, [r6, #48]	; 0x30
 8002134:	2380      	movs	r3, #128	; 0x80
 8002136:	4011      	ands	r1, r2
 8002138:	031b      	lsls	r3, r3, #12
 800213a:	4299      	cmp	r1, r3
 800213c:	d102      	bne.n	8002144 <RCC_GetClocksFreq+0x150>
 800213e:	2380      	movs	r3, #128	; 0x80
 8002140:	021b      	lsls	r3, r3, #8
 8002142:	e004      	b.n	800214e <RCC_GetClocksFreq+0x15a>
 8002144:	6b33      	ldr	r3, [r6, #48]	; 0x30
 8002146:	4013      	ands	r3, r2
 8002148:	4293      	cmp	r3, r2
 800214a:	d101      	bne.n	8002150 <RCC_GetClocksFreq+0x15c>
 800214c:	4b06      	ldr	r3, [pc, #24]	; (8002168 <RCC_GetClocksFreq+0x174>)
 800214e:	6223      	str	r3, [r4, #32]
 8002150:	6b2b      	ldr	r3, [r5, #48]	; 0x30
 8002152:	061a      	lsls	r2, r3, #24
 8002154:	d402      	bmi.n	800215c <RCC_GetClocksFreq+0x168>
 8002156:	4b05      	ldr	r3, [pc, #20]	; (800216c <RCC_GetClocksFreq+0x178>)
 8002158:	6263      	str	r3, [r4, #36]	; 0x24
 800215a:	e000      	b.n	800215e <RCC_GetClocksFreq+0x16a>
 800215c:	6260      	str	r0, [r4, #36]	; 0x24
 800215e:	bdf8      	pop	{r3, r4, r5, r6, r7, pc}
 8002160:	40021000 	.word	0x40021000
 8002164:	003d0900 	.word	0x003d0900
 8002168:	007a1200 	.word	0x007a1200
 800216c:	02dc6c00 	.word	0x02dc6c00
 8002170:	20000000 	.word	0x20000000
 8002174:	00d59f80 	.word	0x00d59f80
 8002178:	00008012 	.word	0x00008012

0800217c <RCC_AHBPeriphClockCmd>:
 800217c:	b538      	push	{r3, r4, r5, lr}
 800217e:	4b0d      	ldr	r3, [pc, #52]	; (80021b4 <RCC_AHBPeriphClockCmd+0x38>)
 8002180:	1c04      	adds	r4, r0, #0
 8002182:	1c0d      	adds	r5, r1, #0
 8002184:	2000      	movs	r0, #0
 8002186:	421c      	tst	r4, r3
 8002188:	d102      	bne.n	8002190 <RCC_AHBPeriphClockCmd+0x14>
 800218a:	1c20      	adds	r0, r4, #0
 800218c:	1e43      	subs	r3, r0, #1
 800218e:	4198      	sbcs	r0, r3
 8002190:	f7fe fe9a 	bl	8000ec8 <assert_param>
 8002194:	2301      	movs	r3, #1
 8002196:	2000      	movs	r0, #0
 8002198:	42ab      	cmp	r3, r5
 800219a:	4140      	adcs	r0, r0
 800219c:	f7fe fe94 	bl	8000ec8 <assert_param>
 80021a0:	4b05      	ldr	r3, [pc, #20]	; (80021b8 <RCC_AHBPeriphClockCmd+0x3c>)
 80021a2:	695a      	ldr	r2, [r3, #20]
 80021a4:	2d00      	cmp	r5, #0
 80021a6:	d002      	beq.n	80021ae <RCC_AHBPeriphClockCmd+0x32>
 80021a8:	4314      	orrs	r4, r2
 80021aa:	615c      	str	r4, [r3, #20]
 80021ac:	e001      	b.n	80021b2 <RCC_AHBPeriphClockCmd+0x36>
 80021ae:	43a2      	bics	r2, r4
 80021b0:	615a      	str	r2, [r3, #20]
 80021b2:	bd38      	pop	{r3, r4, r5, pc}
 80021b4:	fe81ffa8 	.word	0xfe81ffa8
 80021b8:	40021000 	.word	0x40021000

080021bc <RCC_APB2PeriphClockCmd>:
 80021bc:	b538      	push	{r3, r4, r5, lr}
 80021be:	4b0d      	ldr	r3, [pc, #52]	; (80021f4 <RCC_APB2PeriphClockCmd+0x38>)
 80021c0:	1c04      	adds	r4, r0, #0
 80021c2:	1c0d      	adds	r5, r1, #0
 80021c4:	2000      	movs	r0, #0
 80021c6:	421c      	tst	r4, r3
 80021c8:	d102      	bne.n	80021d0 <RCC_APB2PeriphClockCmd+0x14>
 80021ca:	1c20      	adds	r0, r4, #0
 80021cc:	1e43      	subs	r3, r0, #1
 80021ce:	4198      	sbcs	r0, r3
 80021d0:	f7fe fe7a 	bl	8000ec8 <assert_param>
 80021d4:	2301      	movs	r3, #1
 80021d6:	2000      	movs	r0, #0
 80021d8:	42ab      	cmp	r3, r5
 80021da:	4140      	adcs	r0, r0
 80021dc:	f7fe fe74 	bl	8000ec8 <assert_param>
 80021e0:	4b05      	ldr	r3, [pc, #20]	; (80021f8 <RCC_APB2PeriphClockCmd+0x3c>)
 80021e2:	699a      	ldr	r2, [r3, #24]
 80021e4:	2d00      	cmp	r5, #0
 80021e6:	d002      	beq.n	80021ee <RCC_APB2PeriphClockCmd+0x32>
 80021e8:	4314      	orrs	r4, r2
 80021ea:	619c      	str	r4, [r3, #24]
 80021ec:	e001      	b.n	80021f2 <RCC_APB2PeriphClockCmd+0x36>
 80021ee:	43a2      	bics	r2, r4
 80021f0:	619a      	str	r2, [r3, #24]
 80021f2:	bd38      	pop	{r3, r4, r5, pc}
 80021f4:	ffb8a51e 	.word	0xffb8a51e
 80021f8:	40021000 	.word	0x40021000

080021fc <RCC_APB1PeriphClockCmd>:
 80021fc:	b538      	push	{r3, r4, r5, lr}
 80021fe:	4b0d      	ldr	r3, [pc, #52]	; (8002234 <RCC_APB1PeriphClockCmd+0x38>)
 8002200:	1c04      	adds	r4, r0, #0
 8002202:	1c0d      	adds	r5, r1, #0
 8002204:	2000      	movs	r0, #0
 8002206:	421c      	tst	r4, r3
 8002208:	d102      	bne.n	8002210 <RCC_APB1PeriphClockCmd+0x14>
 800220a:	1c20      	adds	r0, r4, #0
 800220c:	1e43      	subs	r3, r0, #1
 800220e:	4198      	sbcs	r0, r3
 8002210:	f7fe fe5a 	bl	8000ec8 <assert_param>
 8002214:	2301      	movs	r3, #1
 8002216:	2000      	movs	r0, #0
 8002218:	42ab      	cmp	r3, r5
 800221a:	4140      	adcs	r0, r0
 800221c:	f7fe fe54 	bl	8000ec8 <assert_param>
 8002220:	4b05      	ldr	r3, [pc, #20]	; (8002238 <RCC_APB1PeriphClockCmd+0x3c>)
 8002222:	69da      	ldr	r2, [r3, #28]
 8002224:	2d00      	cmp	r5, #0
 8002226:	d002      	beq.n	800222e <RCC_APB1PeriphClockCmd+0x32>
 8002228:	4314      	orrs	r4, r2
 800222a:	61dc      	str	r4, [r3, #28]
 800222c:	e001      	b.n	8002232 <RCC_APB1PeriphClockCmd+0x36>
 800222e:	43a2      	bics	r2, r4
 8002230:	61da      	str	r2, [r3, #28]
 8002232:	bd38      	pop	{r3, r4, r5, pc}
 8002234:	8581b6cc 	.word	0x8581b6cc
 8002238:	40021000 	.word	0x40021000

0800223c <RCC_APB2PeriphResetCmd>:
 800223c:	b538      	push	{r3, r4, r5, lr}
 800223e:	4b0d      	ldr	r3, [pc, #52]	; (8002274 <RCC_APB2PeriphResetCmd+0x38>)
 8002240:	1c04      	adds	r4, r0, #0
 8002242:	1c0d      	adds	r5, r1, #0
 8002244:	2000      	movs	r0, #0
 8002246:	421c      	tst	r4, r3
 8002248:	d102      	bne.n	8002250 <RCC_APB2PeriphResetCmd+0x14>
 800224a:	1c20      	adds	r0, r4, #0
 800224c:	1e43      	subs	r3, r0, #1
 800224e:	4198      	sbcs	r0, r3
 8002250:	f7fe fe3a 	bl	8000ec8 <assert_param>
 8002254:	2301      	movs	r3, #1
 8002256:	2000      	movs	r0, #0
 8002258:	42ab      	cmp	r3, r5
 800225a:	4140      	adcs	r0, r0
 800225c:	f7fe fe34 	bl	8000ec8 <assert_param>
 8002260:	4b05      	ldr	r3, [pc, #20]	; (8002278 <RCC_APB2PeriphResetCmd+0x3c>)
 8002262:	68da      	ldr	r2, [r3, #12]
 8002264:	2d00      	cmp	r5, #0
 8002266:	d002      	beq.n	800226e <RCC_APB2PeriphResetCmd+0x32>
 8002268:	4314      	orrs	r4, r2
 800226a:	60dc      	str	r4, [r3, #12]
 800226c:	e001      	b.n	8002272 <RCC_APB2PeriphResetCmd+0x36>
 800226e:	43a2      	bics	r2, r4
 8002270:	60da      	str	r2, [r3, #12]
 8002272:	bd38      	pop	{r3, r4, r5, pc}
 8002274:	ffb8a51e 	.word	0xffb8a51e
 8002278:	40021000 	.word	0x40021000

0800227c <RCC_GetFlagStatus>:
 800227c:	2310      	movs	r3, #16
 800227e:	b510      	push	{r4, lr}
 8002280:	1c04      	adds	r4, r0, #0
 8002282:	4398      	bics	r0, r3
 8002284:	2801      	cmp	r0, #1
 8002286:	d015      	beq.n	80022b4 <RCC_GetFlagStatus+0x38>
 8002288:	2c19      	cmp	r4, #25
 800228a:	d012      	beq.n	80022b2 <RCC_GetFlagStatus+0x36>
 800228c:	2340      	movs	r3, #64	; 0x40
 800228e:	1c22      	adds	r2, r4, #0
 8002290:	439a      	bics	r2, r3
 8002292:	2a21      	cmp	r2, #33	; 0x21
 8002294:	d00d      	beq.n	80022b2 <RCC_GetFlagStatus+0x36>
 8002296:	2c41      	cmp	r4, #65	; 0x41
 8002298:	d00b      	beq.n	80022b2 <RCC_GetFlagStatus+0x36>
 800229a:	1c23      	adds	r3, r4, #0
 800229c:	3b59      	subs	r3, #89	; 0x59
 800229e:	b2db      	uxtb	r3, r3
 80022a0:	2b06      	cmp	r3, #6
 80022a2:	d906      	bls.n	80022b2 <RCC_GetFlagStatus+0x36>
 80022a4:	2c71      	cmp	r4, #113	; 0x71
 80022a6:	d004      	beq.n	80022b2 <RCC_GetFlagStatus+0x36>
 80022a8:	1c20      	adds	r0, r4, #0
 80022aa:	3857      	subs	r0, #87	; 0x57
 80022ac:	4243      	negs	r3, r0
 80022ae:	4158      	adcs	r0, r3
 80022b0:	e000      	b.n	80022b4 <RCC_GetFlagStatus+0x38>
 80022b2:	2001      	movs	r0, #1
 80022b4:	f7fe fe08 	bl	8000ec8 <assert_param>
 80022b8:	0962      	lsrs	r2, r4, #5
 80022ba:	4b0a      	ldr	r3, [pc, #40]	; (80022e4 <RCC_GetFlagStatus+0x68>)
 80022bc:	d101      	bne.n	80022c2 <RCC_GetFlagStatus+0x46>
 80022be:	681b      	ldr	r3, [r3, #0]
 80022c0:	e008      	b.n	80022d4 <RCC_GetFlagStatus+0x58>
 80022c2:	2a01      	cmp	r2, #1
 80022c4:	d101      	bne.n	80022ca <RCC_GetFlagStatus+0x4e>
 80022c6:	6a1b      	ldr	r3, [r3, #32]
 80022c8:	e004      	b.n	80022d4 <RCC_GetFlagStatus+0x58>
 80022ca:	2a02      	cmp	r2, #2
 80022cc:	d101      	bne.n	80022d2 <RCC_GetFlagStatus+0x56>
 80022ce:	6a5b      	ldr	r3, [r3, #36]	; 0x24
 80022d0:	e000      	b.n	80022d4 <RCC_GetFlagStatus+0x58>
 80022d2:	6b5b      	ldr	r3, [r3, #52]	; 0x34
 80022d4:	201f      	movs	r0, #31
 80022d6:	4004      	ands	r4, r0
 80022d8:	1c18      	adds	r0, r3, #0
 80022da:	40e0      	lsrs	r0, r4
 80022dc:	2201      	movs	r2, #1
 80022de:	4010      	ands	r0, r2
 80022e0:	bd10      	pop	{r4, pc}
 80022e2:	46c0      	nop			; (mov r8, r8)
 80022e4:	40021000 	.word	0x40021000

080022e8 <gpio_init>:
 80022e8:	b5f7      	push	{r0, r1, r2, r4, r5, r6, r7, lr}
 80022ea:	2080      	movs	r0, #128	; 0x80
 80022ec:	0280      	lsls	r0, r0, #10
 80022ee:	2101      	movs	r1, #1
 80022f0:	f7ff ff44 	bl	800217c <RCC_AHBPeriphClockCmd>
 80022f4:	2080      	movs	r0, #128	; 0x80
 80022f6:	02c0      	lsls	r0, r0, #11
 80022f8:	2101      	movs	r1, #1
 80022fa:	f7ff ff3f 	bl	800217c <RCC_AHBPeriphClockCmd>
 80022fe:	2208      	movs	r2, #8
 8002300:	2400      	movs	r4, #0
 8002302:	466b      	mov	r3, sp
 8002304:	2603      	movs	r6, #3
 8002306:	9200      	str	r2, [sp, #0]
 8002308:	4669      	mov	r1, sp
 800230a:	2201      	movs	r2, #1
 800230c:	481c      	ldr	r0, [pc, #112]	; (8002380 <gpio_init+0x98>)
 800230e:	715e      	strb	r6, [r3, #5]
 8002310:	711a      	strb	r2, [r3, #4]
 8002312:	719c      	strb	r4, [r3, #6]
 8002314:	71dc      	strb	r4, [r3, #7]
 8002316:	2590      	movs	r5, #144	; 0x90
 8002318:	f7fe ff7c 	bl	8001214 <GPIO_Init>
 800231c:	2380      	movs	r3, #128	; 0x80
 800231e:	05ed      	lsls	r5, r5, #23
 8002320:	005b      	lsls	r3, r3, #1
 8002322:	466a      	mov	r2, sp
 8002324:	1c28      	adds	r0, r5, #0
 8002326:	9300      	str	r3, [sp, #0]
 8002328:	4669      	mov	r1, sp
 800232a:	2301      	movs	r3, #1
 800232c:	2780      	movs	r7, #128	; 0x80
 800232e:	7156      	strb	r6, [r2, #5]
 8002330:	013f      	lsls	r7, r7, #4
 8002332:	7113      	strb	r3, [r2, #4]
 8002334:	7194      	strb	r4, [r2, #6]
 8002336:	71d4      	strb	r4, [r2, #7]
 8002338:	f7fe ff6c 	bl	8001214 <GPIO_Init>
 800233c:	466a      	mov	r2, sp
 800233e:	1c28      	adds	r0, r5, #0
 8002340:	2301      	movs	r3, #1
 8002342:	4669      	mov	r1, sp
 8002344:	7156      	strb	r6, [r2, #5]
 8002346:	9700      	str	r7, [sp, #0]
 8002348:	7113      	strb	r3, [r2, #4]
 800234a:	7194      	strb	r4, [r2, #6]
 800234c:	71d4      	strb	r4, [r2, #7]
 800234e:	f7fe ff61 	bl	8001214 <GPIO_Init>
 8002352:	2202      	movs	r2, #2
 8002354:	466b      	mov	r3, sp
 8002356:	9200      	str	r2, [sp, #0]
 8002358:	1c28      	adds	r0, r5, #0
 800235a:	2201      	movs	r2, #1
 800235c:	4669      	mov	r1, sp
 800235e:	715e      	strb	r6, [r3, #5]
 8002360:	711a      	strb	r2, [r3, #4]
 8002362:	719c      	strb	r4, [r3, #6]
 8002364:	71dc      	strb	r4, [r3, #7]
 8002366:	f7fe ff55 	bl	8001214 <GPIO_Init>
 800236a:	4b05      	ldr	r3, [pc, #20]	; (8002380 <gpio_init+0x98>)
 800236c:	2208      	movs	r2, #8
 800236e:	851a      	strh	r2, [r3, #40]	; 0x28
 8002370:	2380      	movs	r3, #128	; 0x80
 8002372:	005b      	lsls	r3, r3, #1
 8002374:	2202      	movs	r2, #2
 8002376:	852b      	strh	r3, [r5, #40]	; 0x28
 8002378:	852f      	strh	r7, [r5, #40]	; 0x28
 800237a:	852a      	strh	r2, [r5, #40]	; 0x28
 800237c:	bdf7      	pop	{r0, r1, r2, r4, r5, r6, r7, pc}
 800237e:	46c0      	nop			; (mov r8, r8)
 8002380:	48000400 	.word	0x48000400

08002384 <led_on>:
 8002384:	2808      	cmp	r0, #8
 8002386:	d101      	bne.n	800238c <led_on+0x8>
 8002388:	4b07      	ldr	r3, [pc, #28]	; (80023a8 <led_on+0x24>)
 800238a:	e00b      	b.n	80023a4 <led_on+0x20>
 800238c:	2380      	movs	r3, #128	; 0x80
 800238e:	005b      	lsls	r3, r3, #1
 8002390:	4298      	cmp	r0, r3
 8002392:	d005      	beq.n	80023a0 <led_on+0x1c>
 8002394:	2380      	movs	r3, #128	; 0x80
 8002396:	011b      	lsls	r3, r3, #4
 8002398:	4298      	cmp	r0, r3
 800239a:	d001      	beq.n	80023a0 <led_on+0x1c>
 800239c:	2802      	cmp	r0, #2
 800239e:	d102      	bne.n	80023a6 <led_on+0x22>
 80023a0:	2390      	movs	r3, #144	; 0x90
 80023a2:	05db      	lsls	r3, r3, #23
 80023a4:	6198      	str	r0, [r3, #24]
 80023a6:	4770      	bx	lr
 80023a8:	48000400 	.word	0x48000400

080023ac <led_off>:
 80023ac:	2808      	cmp	r0, #8
 80023ae:	d101      	bne.n	80023b4 <led_off+0x8>
 80023b0:	4b07      	ldr	r3, [pc, #28]	; (80023d0 <led_off+0x24>)
 80023b2:	e00b      	b.n	80023cc <led_off+0x20>
 80023b4:	2380      	movs	r3, #128	; 0x80
 80023b6:	005b      	lsls	r3, r3, #1
 80023b8:	4298      	cmp	r0, r3
 80023ba:	d005      	beq.n	80023c8 <led_off+0x1c>
 80023bc:	2380      	movs	r3, #128	; 0x80
 80023be:	011b      	lsls	r3, r3, #4
 80023c0:	4298      	cmp	r0, r3
 80023c2:	d001      	beq.n	80023c8 <led_off+0x1c>
 80023c4:	2802      	cmp	r0, #2
 80023c6:	d102      	bne.n	80023ce <led_off+0x22>
 80023c8:	2390      	movs	r3, #144	; 0x90
 80023ca:	05db      	lsls	r3, r3, #23
 80023cc:	8518      	strh	r0, [r3, #40]	; 0x28
 80023ce:	4770      	bx	lr
 80023d0:	48000400 	.word	0x48000400

080023d4 <Default_Handler>:
 80023d4:	4770      	bx	lr
	...

080023d8 <HardFault_Handler>:
 80023d8:	2008      	movs	r0, #8
 80023da:	f7ff ffd3 	bl	8002384 <led_on>
 80023de:	4b07      	ldr	r3, [pc, #28]	; (80023fc <HardFault_Handler+0x24>)
 80023e0:	3b01      	subs	r3, #1
 80023e2:	2b00      	cmp	r3, #0
 80023e4:	d001      	beq.n	80023ea <HardFault_Handler+0x12>
 80023e6:	46c0      	nop			; (mov r8, r8)
 80023e8:	e7fa      	b.n	80023e0 <HardFault_Handler+0x8>
 80023ea:	2008      	movs	r0, #8
 80023ec:	f7ff ffde 	bl	80023ac <led_off>
 80023f0:	4b02      	ldr	r3, [pc, #8]	; (80023fc <HardFault_Handler+0x24>)
 80023f2:	3b01      	subs	r3, #1
 80023f4:	2b00      	cmp	r3, #0
 80023f6:	d0ef      	beq.n	80023d8 <HardFault_Handler>
 80023f8:	46c0      	nop			; (mov r8, r8)
 80023fa:	e7fa      	b.n	80023f2 <HardFault_Handler+0x1a>
 80023fc:	002dc6c1 	.word	0x002dc6c1

08002400 <_reset_init>:
 8002400:	4a07      	ldr	r2, [pc, #28]	; (8002420 <_reset_init+0x20>)
 8002402:	4908      	ldr	r1, [pc, #32]	; (8002424 <_reset_init+0x24>)
 8002404:	2300      	movs	r3, #0
 8002406:	1a89      	subs	r1, r1, r2
 8002408:	1089      	asrs	r1, r1, #2
 800240a:	1c10      	adds	r0, r2, #0
 800240c:	428b      	cmp	r3, r1
 800240e:	d005      	beq.n	800241c <_reset_init+0x1c>
 8002410:	4c05      	ldr	r4, [pc, #20]	; (8002428 <_reset_init+0x28>)
 8002412:	009a      	lsls	r2, r3, #2
 8002414:	58a4      	ldr	r4, [r4, r2]
 8002416:	3301      	adds	r3, #1
 8002418:	5084      	str	r4, [r0, r2]
 800241a:	e7f7      	b.n	800240c <_reset_init+0xc>
 800241c:	f7fe fa7a 	bl	8000914 <main>
 8002420:	20000000 	.word	0x20000000
 8002424:	20000010 	.word	0x20000010
 8002428:	0800271c 	.word	0x0800271c

0800242c <__gnu_thumb1_case_uqi>:
 800242c:	b402      	push	{r1}
 800242e:	4671      	mov	r1, lr
 8002430:	0849      	lsrs	r1, r1, #1
 8002432:	0049      	lsls	r1, r1, #1
 8002434:	5c09      	ldrb	r1, [r1, r0]
 8002436:	0049      	lsls	r1, r1, #1
 8002438:	448e      	add	lr, r1
 800243a:	bc02      	pop	{r1}
 800243c:	4770      	bx	lr
 800243e:	46c0      	nop			; (mov r8, r8)

08002440 <__aeabi_uidiv>:
 8002440:	2900      	cmp	r1, #0
 8002442:	d034      	beq.n	80024ae <.udivsi3_skip_div0_test+0x6a>

08002444 <.udivsi3_skip_div0_test>:
 8002444:	2301      	movs	r3, #1
 8002446:	2200      	movs	r2, #0
 8002448:	b410      	push	{r4}
 800244a:	4288      	cmp	r0, r1
 800244c:	d32c      	bcc.n	80024a8 <.udivsi3_skip_div0_test+0x64>
 800244e:	2401      	movs	r4, #1
 8002450:	0724      	lsls	r4, r4, #28
 8002452:	42a1      	cmp	r1, r4
 8002454:	d204      	bcs.n	8002460 <.udivsi3_skip_div0_test+0x1c>
 8002456:	4281      	cmp	r1, r0
 8002458:	d202      	bcs.n	8002460 <.udivsi3_skip_div0_test+0x1c>
 800245a:	0109      	lsls	r1, r1, #4
 800245c:	011b      	lsls	r3, r3, #4
 800245e:	e7f8      	b.n	8002452 <.udivsi3_skip_div0_test+0xe>
 8002460:	00e4      	lsls	r4, r4, #3
 8002462:	42a1      	cmp	r1, r4
 8002464:	d204      	bcs.n	8002470 <.udivsi3_skip_div0_test+0x2c>
 8002466:	4281      	cmp	r1, r0
 8002468:	d202      	bcs.n	8002470 <.udivsi3_skip_div0_test+0x2c>
 800246a:	0049      	lsls	r1, r1, #1
 800246c:	005b      	lsls	r3, r3, #1
 800246e:	e7f8      	b.n	8002462 <.udivsi3_skip_div0_test+0x1e>
 8002470:	4288      	cmp	r0, r1
 8002472:	d301      	bcc.n	8002478 <.udivsi3_skip_div0_test+0x34>
 8002474:	1a40      	subs	r0, r0, r1
 8002476:	431a      	orrs	r2, r3
 8002478:	084c      	lsrs	r4, r1, #1
 800247a:	42a0      	cmp	r0, r4
 800247c:	d302      	bcc.n	8002484 <.udivsi3_skip_div0_test+0x40>
 800247e:	1b00      	subs	r0, r0, r4
 8002480:	085c      	lsrs	r4, r3, #1
 8002482:	4322      	orrs	r2, r4
 8002484:	088c      	lsrs	r4, r1, #2
 8002486:	42a0      	cmp	r0, r4
 8002488:	d302      	bcc.n	8002490 <.udivsi3_skip_div0_test+0x4c>
 800248a:	1b00      	subs	r0, r0, r4
 800248c:	089c      	lsrs	r4, r3, #2
 800248e:	4322      	orrs	r2, r4
 8002490:	08cc      	lsrs	r4, r1, #3
 8002492:	42a0      	cmp	r0, r4
 8002494:	d302      	bcc.n	800249c <.udivsi3_skip_div0_test+0x58>
 8002496:	1b00      	subs	r0, r0, r4
 8002498:	08dc      	lsrs	r4, r3, #3
 800249a:	4322      	orrs	r2, r4
 800249c:	2800      	cmp	r0, #0
 800249e:	d003      	beq.n	80024a8 <.udivsi3_skip_div0_test+0x64>
 80024a0:	091b      	lsrs	r3, r3, #4
 80024a2:	d001      	beq.n	80024a8 <.udivsi3_skip_div0_test+0x64>
 80024a4:	0909      	lsrs	r1, r1, #4
 80024a6:	e7e3      	b.n	8002470 <.udivsi3_skip_div0_test+0x2c>
 80024a8:	1c10      	adds	r0, r2, #0
 80024aa:	bc10      	pop	{r4}
 80024ac:	4770      	bx	lr
 80024ae:	2800      	cmp	r0, #0
 80024b0:	d001      	beq.n	80024b6 <.udivsi3_skip_div0_test+0x72>
 80024b2:	2000      	movs	r0, #0
 80024b4:	43c0      	mvns	r0, r0
 80024b6:	b407      	push	{r0, r1, r2}
 80024b8:	4802      	ldr	r0, [pc, #8]	; (80024c4 <.udivsi3_skip_div0_test+0x80>)
 80024ba:	a102      	add	r1, pc, #8	; (adr r1, 80024c4 <.udivsi3_skip_div0_test+0x80>)
 80024bc:	1840      	adds	r0, r0, r1
 80024be:	9002      	str	r0, [sp, #8]
 80024c0:	bd03      	pop	{r0, r1, pc}
 80024c2:	46c0      	nop			; (mov r8, r8)
 80024c4:	000000d9 	.word	0x000000d9

080024c8 <__aeabi_uidivmod>:
 80024c8:	2900      	cmp	r1, #0
 80024ca:	d0f0      	beq.n	80024ae <.udivsi3_skip_div0_test+0x6a>
 80024cc:	b503      	push	{r0, r1, lr}
 80024ce:	f7ff ffb9 	bl	8002444 <.udivsi3_skip_div0_test>
 80024d2:	bc0e      	pop	{r1, r2, r3}
 80024d4:	4342      	muls	r2, r0
 80024d6:	1a89      	subs	r1, r1, r2
 80024d8:	4718      	bx	r3
 80024da:	46c0      	nop			; (mov r8, r8)

080024dc <__aeabi_idiv>:
 80024dc:	2900      	cmp	r1, #0
 80024de:	d041      	beq.n	8002564 <.divsi3_skip_div0_test+0x84>

080024e0 <.divsi3_skip_div0_test>:
 80024e0:	b410      	push	{r4}
 80024e2:	1c04      	adds	r4, r0, #0
 80024e4:	404c      	eors	r4, r1
 80024e6:	46a4      	mov	ip, r4
 80024e8:	2301      	movs	r3, #1
 80024ea:	2200      	movs	r2, #0
 80024ec:	2900      	cmp	r1, #0
 80024ee:	d500      	bpl.n	80024f2 <.divsi3_skip_div0_test+0x12>
 80024f0:	4249      	negs	r1, r1
 80024f2:	2800      	cmp	r0, #0
 80024f4:	d500      	bpl.n	80024f8 <.divsi3_skip_div0_test+0x18>
 80024f6:	4240      	negs	r0, r0
 80024f8:	4288      	cmp	r0, r1
 80024fa:	d32c      	bcc.n	8002556 <.divsi3_skip_div0_test+0x76>
 80024fc:	2401      	movs	r4, #1
 80024fe:	0724      	lsls	r4, r4, #28
 8002500:	42a1      	cmp	r1, r4
 8002502:	d204      	bcs.n	800250e <.divsi3_skip_div0_test+0x2e>
 8002504:	4281      	cmp	r1, r0
 8002506:	d202      	bcs.n	800250e <.divsi3_skip_div0_test+0x2e>
 8002508:	0109      	lsls	r1, r1, #4
 800250a:	011b      	lsls	r3, r3, #4
 800250c:	e7f8      	b.n	8002500 <.divsi3_skip_div0_test+0x20>
 800250e:	00e4      	lsls	r4, r4, #3
 8002510:	42a1      	cmp	r1, r4
 8002512:	d204      	bcs.n	800251e <.divsi3_skip_div0_test+0x3e>
 8002514:	4281      	cmp	r1, r0
 8002516:	d202      	bcs.n	800251e <.divsi3_skip_div0_test+0x3e>
 8002518:	0049      	lsls	r1, r1, #1
 800251a:	005b      	lsls	r3, r3, #1
 800251c:	e7f8      	b.n	8002510 <.divsi3_skip_div0_test+0x30>
 800251e:	4288      	cmp	r0, r1
 8002520:	d301      	bcc.n	8002526 <.divsi3_skip_div0_test+0x46>
 8002522:	1a40      	subs	r0, r0, r1
 8002524:	431a      	orrs	r2, r3
 8002526:	084c      	lsrs	r4, r1, #1
 8002528:	42a0      	cmp	r0, r4
 800252a:	d302      	bcc.n	8002532 <.divsi3_skip_div0_test+0x52>
 800252c:	1b00      	subs	r0, r0, r4
 800252e:	085c      	lsrs	r4, r3, #1
 8002530:	4322      	orrs	r2, r4
 8002532:	088c      	lsrs	r4, r1, #2
 8002534:	42a0      	cmp	r0, r4
 8002536:	d302      	bcc.n	800253e <.divsi3_skip_div0_test+0x5e>
 8002538:	1b00      	subs	r0, r0, r4
 800253a:	089c      	lsrs	r4, r3, #2
 800253c:	4322      	orrs	r2, r4
 800253e:	08cc      	lsrs	r4, r1, #3
 8002540:	42a0      	cmp	r0, r4
 8002542:	d302      	bcc.n	800254a <.divsi3_skip_div0_test+0x6a>
 8002544:	1b00      	subs	r0, r0, r4
 8002546:	08dc      	lsrs	r4, r3, #3
 8002548:	4322      	orrs	r2, r4
 800254a:	2800      	cmp	r0, #0
 800254c:	d003      	beq.n	8002556 <.divsi3_skip_div0_test+0x76>
 800254e:	091b      	lsrs	r3, r3, #4
 8002550:	d001      	beq.n	8002556 <.divsi3_skip_div0_test+0x76>
 8002552:	0909      	lsrs	r1, r1, #4
 8002554:	e7e3      	b.n	800251e <.divsi3_skip_div0_test+0x3e>
 8002556:	1c10      	adds	r0, r2, #0
 8002558:	4664      	mov	r4, ip
 800255a:	2c00      	cmp	r4, #0
 800255c:	d500      	bpl.n	8002560 <.divsi3_skip_div0_test+0x80>
 800255e:	4240      	negs	r0, r0
 8002560:	bc10      	pop	{r4}
 8002562:	4770      	bx	lr
 8002564:	2800      	cmp	r0, #0
 8002566:	d006      	beq.n	8002576 <.divsi3_skip_div0_test+0x96>
 8002568:	db03      	blt.n	8002572 <.divsi3_skip_div0_test+0x92>
 800256a:	2000      	movs	r0, #0
 800256c:	43c0      	mvns	r0, r0
 800256e:	0840      	lsrs	r0, r0, #1
 8002570:	e001      	b.n	8002576 <.divsi3_skip_div0_test+0x96>
 8002572:	2080      	movs	r0, #128	; 0x80
 8002574:	0600      	lsls	r0, r0, #24
 8002576:	b407      	push	{r0, r1, r2}
 8002578:	4802      	ldr	r0, [pc, #8]	; (8002584 <.divsi3_skip_div0_test+0xa4>)
 800257a:	a102      	add	r1, pc, #8	; (adr r1, 8002584 <.divsi3_skip_div0_test+0xa4>)
 800257c:	1840      	adds	r0, r0, r1
 800257e:	9002      	str	r0, [sp, #8]
 8002580:	bd03      	pop	{r0, r1, pc}
 8002582:	46c0      	nop			; (mov r8, r8)
 8002584:	00000019 	.word	0x00000019

08002588 <__aeabi_idivmod>:
 8002588:	2900      	cmp	r1, #0
 800258a:	d0eb      	beq.n	8002564 <.divsi3_skip_div0_test+0x84>
 800258c:	b503      	push	{r0, r1, lr}
 800258e:	f7ff ffa7 	bl	80024e0 <.divsi3_skip_div0_test>
 8002592:	bc0e      	pop	{r1, r2, r3}
 8002594:	4342      	muls	r2, r0
 8002596:	1a89      	subs	r1, r1, r2
 8002598:	4718      	bx	r3
 800259a:	46c0      	nop			; (mov r8, r8)

0800259c <__aeabi_idiv0>:
 800259c:	4770      	bx	lr
 800259e:	46c0      	nop			; (mov r8, r8)

080025a0 <_init>:
 80025a0:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
 80025a2:	46c0      	nop			; (mov r8, r8)
 80025a4:	bcf8      	pop	{r3, r4, r5, r6, r7}
 80025a6:	bc08      	pop	{r3}
 80025a8:	469e      	mov	lr, r3
 80025aa:	4770      	bx	lr

080025ac <_fini>:
 80025ac:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
 80025ae:	46c0      	nop			; (mov r8, r8)
 80025b0:	bcf8      	pop	{r3, r4, r5, r6, r7}
 80025b2:	bc08      	pop	{r3}
 80025b4:	469e      	mov	lr, r3
 80025b6:	4770      	bx	lr
 80025b8:	69647473 	.word	0x69647473
 80025bc:	6e69206f 	.word	0x6e69206f
 80025c0:	64207469 	.word	0x64207469
 80025c4:	0a656e6f 	.word	0x0a656e6f
	...

080025c9 <cos_table>:
 80025c9:	fdfdfdfe fcfcfdfd f9fafafb f5f6f7f8     ................
 80025d9:	f0f1f3f4 eaebedef e3e5e6e8 dadddfe1     ................
 80025e9:	d1d4d6d8 c8cacdcf bdc0c2c5 b2b5b8ba     ................
 80025f9:	a6a9acaf 9a9da0a3 8e919497 8285888b     ................
 8002609:	75787b7e 696c6f72 5d606366 5154575a     ~{xurolifc`]ZWTQ
 8002619:	45484b4e 3b3d4043 30333538 27292c2e     NKHEC@=;8530.,)'
 8002629:	1e202325 17181a1c 10121315 0a0c0d0e     %# .............
 8002639:	06070809 03030405 00010102 00000000     ................
 8002649:	00000000 01010000 04030302 08070605     ................
 8002659:	0d0c0a09 1312100e 1a181715 23201e1c     .............. #
 8002669:	2c292725 3533302e 403d3b38 4b484543     %'),.0358;=@CEHK
 8002679:	5754514e 63605d5a 6f6c6966 7b787572     NQTWZ]`cfilorux{
 8002689:	8885827f 94918e8b a09d9a97 aca9a6a3     ................
 8002699:	b8b5b2af c2c0bdba cdcac8c5 d6d4d1cf     ................
 80026a9:	dfdddad8 e6e5e3e1 edebeae8 f3f1f0ef     ................
 80026b9:	f7f6f5f4 fafaf9f8 fdfcfcfb fdfdfdfd     ................
 80026c9:	746f6f62 20676e69 6d6f7266 0a752520     booting from %u.
 80026d9:	6d617200 61747320 25207472 000a2075     .ram start %u ..
 80026e9:	206d6172 657a6973 20752520 6172000a     ram size %u ..ra
 80026f9:	7266206d 25206565 000a2075 70616568     m free %u ..heap
 8002709:	61747320 25207472 000a2075 00000a0a               start %u .....

08002718 <__EH_FRAME_BEGIN__>:
 8002718:	00000000                                ....
