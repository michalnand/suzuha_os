
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
 80000dc:	20000084 	.word	0x20000084
 80000e0:	2000001c 	.word	0x2000001c

080000e4 <null_thread>:
 80000e4:	b508      	push	{r3, lr}
 80000e6:	f000 fd97 	bl	8000c18 <sleep>
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
 800014c:	2000001c 	.word	0x2000001c
 8000150:	20000084 	.word	0x20000084

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
 80001a4:	20000084 	.word	0x20000084
 80001a8:	2000001c 	.word	0x2000001c

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
 80001cc:	20000084 	.word	0x20000084

080001d0 <kernel_start>:
 80001d0:	b508      	push	{r3, lr}
 80001d2:	f000 fd15 	bl	8000c00 <sys_tick_init>
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
 8000254:	2000001c 	.word	0x2000001c
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
 8000290:	2000001c 	.word	0x2000001c
 8000294:	20000084 	.word	0x20000084
 8000298:	200000a4 	.word	0x200000a4
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
 80002d8:	2000001c 	.word	0x2000001c

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
 80002fc:	2000001c 	.word	0x2000001c

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
 800032c:	20000124 	.word	0x20000124
 8000330:	20000144 	.word	0x20000144

08000334 <putc_>:
 8000334:	b538      	push	{r3, r4, r5, lr}
 8000336:	4c06      	ldr	r4, [pc, #24]	; (8000350 <putc_+0x1c>)
 8000338:	1c05      	adds	r5, r0, #0
 800033a:	1c20      	adds	r0, r4, #0
 800033c:	f000 f8ff 	bl	800053e <mutex_lock>
 8000340:	1c28      	adds	r0, r5, #0
 8000342:	f000 fafb 	bl	800093c <uart_write>
 8000346:	1c20      	adds	r0, r4, #0
 8000348:	f000 f915 	bl	8000576 <mutex_unlock>
 800034c:	bd38      	pop	{r3, r4, r5, pc}
 800034e:	46c0      	nop			; (mov r8, r8)
 8000350:	20000184 	.word	0x20000184

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
 8000378:	20000190 	.word	0x20000190

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
 8000398:	f001 ffb6 	bl	8002308 <__aeabi_idivmod>
 800039c:	3130      	adds	r1, #48	; 0x30
 800039e:	5571      	strb	r1, [r6, r5]
 80003a0:	1c20      	adds	r0, r4, #0
 80003a2:	210a      	movs	r1, #10
 80003a4:	f001 ff5a 	bl	800225c <__aeabi_idiv>
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
 80003d6:	f001 ff37 	bl	8002248 <__aeabi_uidivmod>
 80003da:	3130      	adds	r1, #48	; 0x30
 80003dc:	5531      	strb	r1, [r6, r4]
 80003de:	1c28      	adds	r0, r5, #0
 80003e0:	210a      	movs	r1, #10
 80003e2:	f001 feed 	bl	80021c0 <__aeabi_uidiv>
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
 80004c4:	2000018c 	.word	0x2000018c

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
 8000508:	20000184 	.word	0x20000184
 800050c:	20000188 	.word	0x20000188
 8000510:	20000190 	.word	0x20000190
 8000514:	2000018c 	.word	0x2000018c
 8000518:	08002338 	.word	0x08002338

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

08000588 <m_rnd>:
 8000588:	4809      	ldr	r0, [pc, #36]	; (80005b0 <m_rnd+0x28>)
 800058a:	490a      	ldr	r1, [pc, #40]	; (80005b4 <m_rnd+0x2c>)
 800058c:	6803      	ldr	r3, [r0, #0]
 800058e:	b510      	push	{r4, lr}
 8000590:	4359      	muls	r1, r3
 8000592:	4b09      	ldr	r3, [pc, #36]	; (80005b8 <m_rnd+0x30>)
 8000594:	4c09      	ldr	r4, [pc, #36]	; (80005bc <m_rnd+0x34>)
 8000596:	18c9      	adds	r1, r1, r3
 8000598:	6001      	str	r1, [r0, #0]
 800059a:	4809      	ldr	r0, [pc, #36]	; (80005c0 <m_rnd+0x38>)
 800059c:	6802      	ldr	r2, [r0, #0]
 800059e:	07d3      	lsls	r3, r2, #31
 80005a0:	17db      	asrs	r3, r3, #31
 80005a2:	4023      	ands	r3, r4
 80005a4:	0852      	lsrs	r2, r2, #1
 80005a6:	4053      	eors	r3, r2
 80005a8:	6003      	str	r3, [r0, #0]
 80005aa:	1c18      	adds	r0, r3, #0
 80005ac:	4048      	eors	r0, r1
 80005ae:	bd10      	pop	{r4, pc}
 80005b0:	20000004 	.word	0x20000004
 80005b4:	41c64e6d 	.word	0x41c64e6d
 80005b8:	00003039 	.word	0x00003039
 80005bc:	d0000001 	.word	0xd0000001
 80005c0:	20000000 	.word	0x20000000

080005c4 <ir_comm_thread>:
 80005c4:	b570      	push	{r4, r5, r6, lr}
 80005c6:	484a      	ldr	r0, [pc, #296]	; (80006f0 <ir_comm_thread+0x12c>)
 80005c8:	b088      	sub	sp, #32
 80005ca:	f7ff ff2d 	bl	8000428 <printf_>
 80005ce:	f000 fbd7 	bl	8000d80 <ir_comm_init>
 80005d2:	2160      	movs	r1, #96	; 0x60
 80005d4:	31ff      	adds	r1, #255	; 0xff
 80005d6:	2001      	movs	r0, #1
 80005d8:	f000 f986 	bl	80008e8 <event_timer_set_period>
 80005dc:	ae04      	add	r6, sp, #16
 80005de:	4668      	mov	r0, sp
 80005e0:	f000 fd6e 	bl	80010c0 <ir_packet_init>
 80005e4:	1c30      	adds	r0, r6, #0
 80005e6:	f000 fd6b 	bl	80010c0 <ir_packet_init>
 80005ea:	2500      	movs	r5, #0
 80005ec:	1c30      	adds	r0, r6, #0
 80005ee:	f000 fda5 	bl	800113c <ir_receive_packet>
 80005f2:	1e04      	subs	r4, r0, #0
 80005f4:	d117      	bne.n	8000626 <ir_comm_thread+0x62>
 80005f6:	2008      	movs	r0, #8
 80005f8:	f001 fd84 	bl	8002104 <led_on>
 80005fc:	89b1      	ldrh	r1, [r6, #12]
 80005fe:	483d      	ldr	r0, [pc, #244]	; (80006f4 <ir_comm_thread+0x130>)
 8000600:	1c22      	adds	r2, r4, #0
 8000602:	f7ff ff11 	bl	8000428 <printf_>
 8000606:	aa00      	add	r2, sp, #0
 8000608:	1913      	adds	r3, r2, r4
 800060a:	7919      	ldrb	r1, [r3, #4]
 800060c:	483a      	ldr	r0, [pc, #232]	; (80006f8 <ir_comm_thread+0x134>)
 800060e:	3401      	adds	r4, #1
 8000610:	f7ff ff0a 	bl	8000428 <printf_>
 8000614:	2c08      	cmp	r4, #8
 8000616:	d1f6      	bne.n	8000606 <ir_comm_thread+0x42>
 8000618:	4838      	ldr	r0, [pc, #224]	; (80006fc <ir_comm_thread+0x138>)
 800061a:	f7ff ff05 	bl	8000428 <printf_>
 800061e:	1c20      	adds	r0, r4, #0
 8000620:	f001 fd84 	bl	800212c <led_off>
 8000624:	e008      	b.n	8000638 <ir_comm_thread+0x74>
 8000626:	2801      	cmp	r0, #1
 8000628:	d101      	bne.n	800062e <ir_comm_thread+0x6a>
 800062a:	4835      	ldr	r0, [pc, #212]	; (8000700 <ir_comm_thread+0x13c>)
 800062c:	e002      	b.n	8000634 <ir_comm_thread+0x70>
 800062e:	2802      	cmp	r0, #2
 8000630:	d102      	bne.n	8000638 <ir_comm_thread+0x74>
 8000632:	4834      	ldr	r0, [pc, #208]	; (8000704 <ir_comm_thread+0x140>)
 8000634:	f7ff fef8 	bl	8000428 <printf_>
 8000638:	2001      	movs	r0, #1
 800063a:	f000 f967 	bl	800090c <event_timer_get_flag>
 800063e:	2800      	cmp	r0, #0
 8000640:	d0d4      	beq.n	80005ec <ir_comm_thread+0x28>
 8000642:	2001      	movs	r0, #1
 8000644:	f000 f970 	bl	8000928 <event_timer_clear_flag>
 8000648:	2008      	movs	r0, #8
 800064a:	f001 fd5b 	bl	8002104 <led_on>
 800064e:	4668      	mov	r0, sp
 8000650:	f000 fd4a 	bl	80010e8 <ir_send_packet>
 8000654:	2800      	cmp	r0, #0
 8000656:	d1c9      	bne.n	80005ec <ir_comm_thread+0x28>
 8000658:	2d03      	cmp	r5, #3
 800065a:	d841      	bhi.n	80006e0 <ir_comm_thread+0x11c>
 800065c:	1c28      	adds	r0, r5, #0
 800065e:	f001 fda5 	bl	80021ac <__gnu_thumb1_case_uqi>
 8000662:	1302      	.short	0x1302
 8000664:	3625      	.short	0x3625
 8000666:	466a      	mov	r2, sp
 8000668:	2361      	movs	r3, #97	; 0x61
 800066a:	7113      	strb	r3, [r2, #4]
 800066c:	2362      	movs	r3, #98	; 0x62
 800066e:	7153      	strb	r3, [r2, #5]
 8000670:	2363      	movs	r3, #99	; 0x63
 8000672:	7193      	strb	r3, [r2, #6]
 8000674:	2364      	movs	r3, #100	; 0x64
 8000676:	71d3      	strb	r3, [r2, #7]
 8000678:	2365      	movs	r3, #101	; 0x65
 800067a:	7213      	strb	r3, [r2, #8]
 800067c:	2366      	movs	r3, #102	; 0x66
 800067e:	7253      	strb	r3, [r2, #9]
 8000680:	2367      	movs	r3, #103	; 0x67
 8000682:	7293      	strb	r3, [r2, #10]
 8000684:	2368      	movs	r3, #104	; 0x68
 8000686:	e00f      	b.n	80006a8 <ir_comm_thread+0xe4>
 8000688:	466a      	mov	r2, sp
 800068a:	2341      	movs	r3, #65	; 0x41
 800068c:	7113      	strb	r3, [r2, #4]
 800068e:	2342      	movs	r3, #66	; 0x42
 8000690:	7153      	strb	r3, [r2, #5]
 8000692:	2343      	movs	r3, #67	; 0x43
 8000694:	7193      	strb	r3, [r2, #6]
 8000696:	2344      	movs	r3, #68	; 0x44
 8000698:	71d3      	strb	r3, [r2, #7]
 800069a:	2345      	movs	r3, #69	; 0x45
 800069c:	7213      	strb	r3, [r2, #8]
 800069e:	2346      	movs	r3, #70	; 0x46
 80006a0:	7253      	strb	r3, [r2, #9]
 80006a2:	2347      	movs	r3, #71	; 0x47
 80006a4:	7293      	strb	r3, [r2, #10]
 80006a6:	2348      	movs	r3, #72	; 0x48
 80006a8:	72d3      	strb	r3, [r2, #11]
 80006aa:	e019      	b.n	80006e0 <ir_comm_thread+0x11c>
 80006ac:	466a      	mov	r2, sp
 80006ae:	2330      	movs	r3, #48	; 0x30
 80006b0:	7113      	strb	r3, [r2, #4]
 80006b2:	2331      	movs	r3, #49	; 0x31
 80006b4:	7153      	strb	r3, [r2, #5]
 80006b6:	2332      	movs	r3, #50	; 0x32
 80006b8:	7193      	strb	r3, [r2, #6]
 80006ba:	2333      	movs	r3, #51	; 0x33
 80006bc:	71d3      	strb	r3, [r2, #7]
 80006be:	2334      	movs	r3, #52	; 0x34
 80006c0:	7213      	strb	r3, [r2, #8]
 80006c2:	2335      	movs	r3, #53	; 0x35
 80006c4:	7253      	strb	r3, [r2, #9]
 80006c6:	2336      	movs	r3, #54	; 0x36
 80006c8:	7293      	strb	r3, [r2, #10]
 80006ca:	2337      	movs	r3, #55	; 0x37
 80006cc:	e7ec      	b.n	80006a8 <ir_comm_thread+0xe4>
 80006ce:	2400      	movs	r4, #0
 80006d0:	f7ff ff5a 	bl	8000588 <m_rnd>
 80006d4:	aa00      	add	r2, sp, #0
 80006d6:	1913      	adds	r3, r2, r4
 80006d8:	3401      	adds	r4, #1
 80006da:	7118      	strb	r0, [r3, #4]
 80006dc:	2c08      	cmp	r4, #8
 80006de:	d1f7      	bne.n	80006d0 <ir_comm_thread+0x10c>
 80006e0:	2303      	movs	r3, #3
 80006e2:	3501      	adds	r5, #1
 80006e4:	2008      	movs	r0, #8
 80006e6:	401d      	ands	r5, r3
 80006e8:	f001 fd20 	bl	800212c <led_off>
 80006ec:	e77e      	b.n	80005ec <ir_comm_thread+0x28>
 80006ee:	46c0      	nop			; (mov r8, r8)
 80006f0:	08002349 	.word	0x08002349
 80006f4:	0800235f 	.word	0x0800235f
 80006f8:	08002371 	.word	0x08002371
 80006fc:	0800241a 	.word	0x0800241a
 8000700:	08002374 	.word	0x08002374
 8000704:	08002384 	.word	0x08002384

08000708 <main_thread>:
 8000708:	b508      	push	{r3, lr}
 800070a:	2008      	movs	r0, #8
 800070c:	f001 fcfa 	bl	8002104 <led_on>
 8000710:	480b      	ldr	r0, [pc, #44]	; (8000740 <main_thread+0x38>)
 8000712:	f7ff fe89 	bl	8000428 <printf_>
 8000716:	2280      	movs	r2, #128	; 0x80
 8000718:	480a      	ldr	r0, [pc, #40]	; (8000744 <main_thread+0x3c>)
 800071a:	490b      	ldr	r1, [pc, #44]	; (8000748 <main_thread+0x40>)
 800071c:	0052      	lsls	r2, r2, #1
 800071e:	2308      	movs	r3, #8
 8000720:	f7ff fd5c 	bl	80001dc <create_thread>
 8000724:	2008      	movs	r0, #8
 8000726:	f001 fced 	bl	8002104 <led_on>
 800072a:	2064      	movs	r0, #100	; 0x64
 800072c:	f000 f8cc 	bl	80008c8 <timer_delay_ms>
 8000730:	2008      	movs	r0, #8
 8000732:	f001 fcfb 	bl	800212c <led_off>
 8000736:	20e1      	movs	r0, #225	; 0xe1
 8000738:	0080      	lsls	r0, r0, #2
 800073a:	f000 f8c5 	bl	80008c8 <timer_delay_ms>
 800073e:	e7f1      	b.n	8000724 <main_thread+0x1c>
 8000740:	08002392 	.word	0x08002392
 8000744:	080005c5 	.word	0x080005c5
 8000748:	20000194 	.word	0x20000194

0800074c <mem_info_print>:
 800074c:	b538      	push	{r3, r4, r5, lr}
 800074e:	480e      	ldr	r0, [pc, #56]	; (8000788 <mem_info_print+0x3c>)
 8000750:	490e      	ldr	r1, [pc, #56]	; (800078c <mem_info_print+0x40>)
 8000752:	f7ff fe69 	bl	8000428 <printf_>
 8000756:	4c0e      	ldr	r4, [pc, #56]	; (8000790 <mem_info_print+0x44>)
 8000758:	480e      	ldr	r0, [pc, #56]	; (8000794 <mem_info_print+0x48>)
 800075a:	1c21      	adds	r1, r4, #0
 800075c:	f7ff fe64 	bl	8000428 <printf_>
 8000760:	4d0d      	ldr	r5, [pc, #52]	; (8000798 <mem_info_print+0x4c>)
 8000762:	480e      	ldr	r0, [pc, #56]	; (800079c <mem_info_print+0x50>)
 8000764:	1b2d      	subs	r5, r5, r4
 8000766:	1c29      	adds	r1, r5, #0
 8000768:	f7ff fe5e 	bl	8000428 <printf_>
 800076c:	490c      	ldr	r1, [pc, #48]	; (80007a0 <mem_info_print+0x54>)
 800076e:	480d      	ldr	r0, [pc, #52]	; (80007a4 <mem_info_print+0x58>)
 8000770:	1a64      	subs	r4, r4, r1
 8000772:	1929      	adds	r1, r5, r4
 8000774:	f7ff fe58 	bl	8000428 <printf_>
 8000778:	490b      	ldr	r1, [pc, #44]	; (80007a8 <mem_info_print+0x5c>)
 800077a:	480c      	ldr	r0, [pc, #48]	; (80007ac <mem_info_print+0x60>)
 800077c:	f7ff fe54 	bl	8000428 <printf_>
 8000780:	480b      	ldr	r0, [pc, #44]	; (80007b0 <mem_info_print+0x64>)
 8000782:	f7ff fe51 	bl	8000428 <printf_>
 8000786:	bd38      	pop	{r3, r4, r5, pc}
 8000788:	080023cd 	.word	0x080023cd
 800078c:	08002320 	.word	0x08002320
 8000790:	20000000 	.word	0x20000000
 8000794:	080023de 	.word	0x080023de
 8000798:	20001000 	.word	0x20001000
 800079c:	080023ed 	.word	0x080023ed
 80007a0:	200003e4 	.word	0x200003e4
 80007a4:	080023fb 	.word	0x080023fb
 80007a8:	200003e4 	.word	0x200003e4
 80007ac:	08002409 	.word	0x08002409
 80007b0:	08002419 	.word	0x08002419

080007b4 <main>:
 80007b4:	b508      	push	{r3, lr}
 80007b6:	f000 fad5 	bl	8000d64 <lib_low_level_init>
 80007ba:	f7ff feaf 	bl	800051c <lib_os_init>
 80007be:	f7ff ffc5 	bl	800074c <mem_info_print>
 80007c2:	2280      	movs	r2, #128	; 0x80
 80007c4:	4904      	ldr	r1, [pc, #16]	; (80007d8 <main+0x24>)
 80007c6:	0052      	lsls	r2, r2, #1
 80007c8:	2308      	movs	r3, #8
 80007ca:	4804      	ldr	r0, [pc, #16]	; (80007dc <main+0x28>)
 80007cc:	f7ff fd06 	bl	80001dc <create_thread>
 80007d0:	f7ff fcfe 	bl	80001d0 <kernel_start>
 80007d4:	2000      	movs	r0, #0
 80007d6:	bd08      	pop	{r3, pc}
 80007d8:	20000294 	.word	0x20000294
 80007dc:	08000709 	.word	0x08000709

080007e0 <timer_init>:
 80007e0:	b530      	push	{r4, r5, lr}
 80007e2:	2300      	movs	r3, #0
 80007e4:	b085      	sub	sp, #20
 80007e6:	481b      	ldr	r0, [pc, #108]	; (8000854 <timer_init+0x74>)
 80007e8:	2180      	movs	r1, #128	; 0x80
 80007ea:	005a      	lsls	r2, r3, #1
 80007ec:	00c9      	lsls	r1, r1, #3
 80007ee:	5211      	strh	r1, [r2, r0]
 80007f0:	4819      	ldr	r0, [pc, #100]	; (8000858 <timer_init+0x78>)
 80007f2:	2400      	movs	r4, #0
 80007f4:	5211      	strh	r1, [r2, r0]
 80007f6:	4919      	ldr	r1, [pc, #100]	; (800085c <timer_init+0x7c>)
 80007f8:	3301      	adds	r3, #1
 80007fa:	5254      	strh	r4, [r2, r1]
 80007fc:	2b04      	cmp	r3, #4
 80007fe:	d1f2      	bne.n	80007e6 <timer_init+0x6>
 8000800:	4b17      	ldr	r3, [pc, #92]	; (8000860 <timer_init+0x80>)
 8000802:	2001      	movs	r0, #1
 8000804:	1c01      	adds	r1, r0, #0
 8000806:	601c      	str	r4, [r3, #0]
 8000808:	f001 fbb8 	bl	8001f7c <RCC_APB1PeriphClockCmd>
 800080c:	a901      	add	r1, sp, #4
 800080e:	2330      	movs	r3, #48	; 0x30
 8000810:	800b      	strh	r3, [r1, #0]
 8000812:	2080      	movs	r0, #128	; 0x80
 8000814:	23fa      	movs	r3, #250	; 0xfa
 8000816:	009b      	lsls	r3, r3, #2
 8000818:	05c0      	lsls	r0, r0, #23
 800081a:	604b      	str	r3, [r1, #4]
 800081c:	804c      	strh	r4, [r1, #2]
 800081e:	810c      	strh	r4, [r1, #8]
 8000820:	728c      	strb	r4, [r1, #10]
 8000822:	f000 fd89 	bl	8001338 <TIM_TimeBaseInit>
 8000826:	2080      	movs	r0, #128	; 0x80
 8000828:	05c0      	lsls	r0, r0, #23
 800082a:	2101      	movs	r1, #1
 800082c:	f000 fe06 	bl	800143c <TIM_Cmd>
 8000830:	2080      	movs	r0, #128	; 0x80
 8000832:	2102      	movs	r1, #2
 8000834:	05c0      	lsls	r0, r0, #23
 8000836:	2201      	movs	r2, #1
 8000838:	f000 fe44 	bl	80014c4 <TIM_ITConfig>
 800083c:	466a      	mov	r2, sp
 800083e:	230f      	movs	r3, #15
 8000840:	7013      	strb	r3, [r2, #0]
 8000842:	4668      	mov	r0, sp
 8000844:	2301      	movs	r3, #1
 8000846:	7053      	strb	r3, [r2, #1]
 8000848:	7093      	strb	r3, [r2, #2]
 800084a:	f001 fa1d 	bl	8001c88 <NVIC_Init>
 800084e:	b005      	add	sp, #20
 8000850:	bd30      	pop	{r4, r5, pc}
 8000852:	46c0      	nop			; (mov r8, r8)
 8000854:	200003a8 	.word	0x200003a8
 8000858:	2000039c 	.word	0x2000039c
 800085c:	20000394 	.word	0x20000394
 8000860:	200003a4 	.word	0x200003a4

08000864 <TIM2_IRQHandler>:
 8000864:	2200      	movs	r2, #0
 8000866:	490e      	ldr	r1, [pc, #56]	; (80008a0 <TIM2_IRQHandler+0x3c>)
 8000868:	0053      	lsls	r3, r2, #1
 800086a:	5a58      	ldrh	r0, [r3, r1]
 800086c:	2800      	cmp	r0, #0
 800086e:	d003      	beq.n	8000878 <TIM2_IRQHandler+0x14>
 8000870:	5a58      	ldrh	r0, [r3, r1]
 8000872:	3801      	subs	r0, #1
 8000874:	b280      	uxth	r0, r0
 8000876:	e005      	b.n	8000884 <TIM2_IRQHandler+0x20>
 8000878:	480a      	ldr	r0, [pc, #40]	; (80008a4 <TIM2_IRQHandler+0x40>)
 800087a:	5a18      	ldrh	r0, [r3, r0]
 800087c:	b280      	uxth	r0, r0
 800087e:	5258      	strh	r0, [r3, r1]
 8000880:	4909      	ldr	r1, [pc, #36]	; (80008a8 <TIM2_IRQHandler+0x44>)
 8000882:	2001      	movs	r0, #1
 8000884:	3201      	adds	r2, #1
 8000886:	5258      	strh	r0, [r3, r1]
 8000888:	2a04      	cmp	r2, #4
 800088a:	d1ec      	bne.n	8000866 <TIM2_IRQHandler+0x2>
 800088c:	4b07      	ldr	r3, [pc, #28]	; (80008ac <TIM2_IRQHandler+0x48>)
 800088e:	681a      	ldr	r2, [r3, #0]
 8000890:	3201      	adds	r2, #1
 8000892:	601a      	str	r2, [r3, #0]
 8000894:	2380      	movs	r3, #128	; 0x80
 8000896:	2200      	movs	r2, #0
 8000898:	05db      	lsls	r3, r3, #23
 800089a:	821a      	strh	r2, [r3, #16]
 800089c:	4770      	bx	lr
 800089e:	46c0      	nop			; (mov r8, r8)
 80008a0:	200003a8 	.word	0x200003a8
 80008a4:	2000039c 	.word	0x2000039c
 80008a8:	20000394 	.word	0x20000394
 80008ac:	200003a4 	.word	0x200003a4

080008b0 <timer_get_time>:
 80008b0:	b082      	sub	sp, #8
 80008b2:	b672      	cpsid	i
 80008b4:	4b03      	ldr	r3, [pc, #12]	; (80008c4 <timer_get_time+0x14>)
 80008b6:	681b      	ldr	r3, [r3, #0]
 80008b8:	9301      	str	r3, [sp, #4]
 80008ba:	b662      	cpsie	i
 80008bc:	9801      	ldr	r0, [sp, #4]
 80008be:	b002      	add	sp, #8
 80008c0:	4770      	bx	lr
 80008c2:	46c0      	nop			; (mov r8, r8)
 80008c4:	200003a4 	.word	0x200003a4

080008c8 <timer_delay_ms>:
 80008c8:	b513      	push	{r0, r1, r4, lr}
 80008ca:	1c04      	adds	r4, r0, #0
 80008cc:	f7ff fff0 	bl	80008b0 <timer_get_time>
 80008d0:	1904      	adds	r4, r0, r4
 80008d2:	9401      	str	r4, [sp, #4]
 80008d4:	9c01      	ldr	r4, [sp, #4]
 80008d6:	f7ff ffeb 	bl	80008b0 <timer_get_time>
 80008da:	4284      	cmp	r4, r0
 80008dc:	d902      	bls.n	80008e4 <timer_delay_ms+0x1c>
 80008de:	f000 f99b 	bl	8000c18 <sleep>
 80008e2:	e7f7      	b.n	80008d4 <timer_delay_ms+0xc>
 80008e4:	bd13      	pop	{r0, r1, r4, pc}
	...

080008e8 <event_timer_set_period>:
 80008e8:	b672      	cpsid	i
 80008ea:	4b05      	ldr	r3, [pc, #20]	; (8000900 <event_timer_set_period+0x18>)
 80008ec:	0040      	lsls	r0, r0, #1
 80008ee:	52c1      	strh	r1, [r0, r3]
 80008f0:	4b04      	ldr	r3, [pc, #16]	; (8000904 <event_timer_set_period+0x1c>)
 80008f2:	2200      	movs	r2, #0
 80008f4:	52c1      	strh	r1, [r0, r3]
 80008f6:	4b04      	ldr	r3, [pc, #16]	; (8000908 <event_timer_set_period+0x20>)
 80008f8:	52c2      	strh	r2, [r0, r3]
 80008fa:	b662      	cpsie	i
 80008fc:	4770      	bx	lr
 80008fe:	46c0      	nop			; (mov r8, r8)
 8000900:	200003a8 	.word	0x200003a8
 8000904:	2000039c 	.word	0x2000039c
 8000908:	20000394 	.word	0x20000394

0800090c <event_timer_get_flag>:
 800090c:	b082      	sub	sp, #8
 800090e:	b672      	cpsid	i
 8000910:	4b04      	ldr	r3, [pc, #16]	; (8000924 <event_timer_get_flag+0x18>)
 8000912:	0040      	lsls	r0, r0, #1
 8000914:	5ac3      	ldrh	r3, [r0, r3]
 8000916:	b29b      	uxth	r3, r3
 8000918:	9301      	str	r3, [sp, #4]
 800091a:	b662      	cpsie	i
 800091c:	9801      	ldr	r0, [sp, #4]
 800091e:	b002      	add	sp, #8
 8000920:	4770      	bx	lr
 8000922:	46c0      	nop			; (mov r8, r8)
 8000924:	20000394 	.word	0x20000394

08000928 <event_timer_clear_flag>:
 8000928:	b672      	cpsid	i
 800092a:	4b03      	ldr	r3, [pc, #12]	; (8000938 <event_timer_clear_flag+0x10>)
 800092c:	0040      	lsls	r0, r0, #1
 800092e:	2200      	movs	r2, #0
 8000930:	52c2      	strh	r2, [r0, r3]
 8000932:	b662      	cpsie	i
 8000934:	4770      	bx	lr
 8000936:	46c0      	nop			; (mov r8, r8)
 8000938:	20000394 	.word	0x20000394

0800093c <uart_write>:
 800093c:	4b03      	ldr	r3, [pc, #12]	; (800094c <uart_write+0x10>)
 800093e:	69da      	ldr	r2, [r3, #28]
 8000940:	0611      	lsls	r1, r2, #24
 8000942:	d401      	bmi.n	8000948 <uart_write+0xc>
 8000944:	46c0      	nop			; (mov r8, r8)
 8000946:	e7f9      	b.n	800093c <uart_write>
 8000948:	8518      	strh	r0, [r3, #40]	; 0x28
 800094a:	4770      	bx	lr
 800094c:	40013800 	.word	0x40013800

08000950 <USART1_IRQHandler>:
 8000950:	b508      	push	{r3, lr}
 8000952:	480e      	ldr	r0, [pc, #56]	; (800098c <USART1_IRQHandler+0x3c>)
 8000954:	490e      	ldr	r1, [pc, #56]	; (8000990 <USART1_IRQHandler+0x40>)
 8000956:	f000 ff47 	bl	80017e8 <USART_GetITStatus>
 800095a:	2800      	cmp	r0, #0
 800095c:	d011      	beq.n	8000982 <USART1_IRQHandler+0x32>
 800095e:	480b      	ldr	r0, [pc, #44]	; (800098c <USART1_IRQHandler+0x3c>)
 8000960:	f000 ff0e 	bl	8001780 <USART_ReceiveData>
 8000964:	4b0b      	ldr	r3, [pc, #44]	; (8000994 <USART1_IRQHandler+0x44>)
 8000966:	490c      	ldr	r1, [pc, #48]	; (8000998 <USART1_IRQHandler+0x48>)
 8000968:	881a      	ldrh	r2, [r3, #0]
 800096a:	b2c0      	uxtb	r0, r0
 800096c:	b292      	uxth	r2, r2
 800096e:	5488      	strb	r0, [r1, r2]
 8000970:	881a      	ldrh	r2, [r3, #0]
 8000972:	3201      	adds	r2, #1
 8000974:	b292      	uxth	r2, r2
 8000976:	801a      	strh	r2, [r3, #0]
 8000978:	881a      	ldrh	r2, [r3, #0]
 800097a:	2a0f      	cmp	r2, #15
 800097c:	d901      	bls.n	8000982 <USART1_IRQHandler+0x32>
 800097e:	2200      	movs	r2, #0
 8000980:	801a      	strh	r2, [r3, #0]
 8000982:	4802      	ldr	r0, [pc, #8]	; (800098c <USART1_IRQHandler+0x3c>)
 8000984:	4902      	ldr	r1, [pc, #8]	; (8000990 <USART1_IRQHandler+0x40>)
 8000986:	f000 ffc7 	bl	8001918 <USART_ClearITPendingBit>
 800098a:	bd08      	pop	{r3, pc}
 800098c:	40013800 	.word	0x40013800
 8000990:	00050105 	.word	0x00050105
 8000994:	200003c0 	.word	0x200003c0
 8000998:	200003b0 	.word	0x200003b0

0800099c <uart_init>:
 800099c:	b530      	push	{r4, r5, lr}
 800099e:	4a21      	ldr	r2, [pc, #132]	; (8000a24 <uart_init+0x88>)
 80009a0:	2300      	movs	r3, #0
 80009a2:	8013      	strh	r3, [r2, #0]
 80009a4:	4a20      	ldr	r2, [pc, #128]	; (8000a28 <uart_init+0x8c>)
 80009a6:	b089      	sub	sp, #36	; 0x24
 80009a8:	8013      	strh	r3, [r2, #0]
 80009aa:	4a20      	ldr	r2, [pc, #128]	; (8000a2c <uart_init+0x90>)
 80009ac:	2400      	movs	r4, #0
 80009ae:	54d4      	strb	r4, [r2, r3]
 80009b0:	3301      	adds	r3, #1
 80009b2:	2b10      	cmp	r3, #16
 80009b4:	d1f9      	bne.n	80009aa <uart_init+0xe>
 80009b6:	2080      	movs	r0, #128	; 0x80
 80009b8:	0280      	lsls	r0, r0, #10
 80009ba:	2101      	movs	r1, #1
 80009bc:	f001 fa9e 	bl	8001efc <RCC_AHBPeriphClockCmd>
 80009c0:	2080      	movs	r0, #128	; 0x80
 80009c2:	01c0      	lsls	r0, r0, #7
 80009c4:	2101      	movs	r1, #1
 80009c6:	f001 fab9 	bl	8001f3c <RCC_APB2PeriphClockCmd>
 80009ca:	2090      	movs	r0, #144	; 0x90
 80009cc:	05c0      	lsls	r0, r0, #23
 80009ce:	2102      	movs	r1, #2
 80009d0:	2201      	movs	r2, #1
 80009d2:	f000 fc6b 	bl	80012ac <GPIO_PinAFConfig>
 80009d6:	2090      	movs	r0, #144	; 0x90
 80009d8:	05c0      	lsls	r0, r0, #23
 80009da:	210f      	movs	r1, #15
 80009dc:	2201      	movs	r2, #1
 80009de:	f000 fc65 	bl	80012ac <GPIO_PinAFConfig>
 80009e2:	4b13      	ldr	r3, [pc, #76]	; (8000a30 <uart_init+0x94>)
 80009e4:	2090      	movs	r0, #144	; 0x90
 80009e6:	466a      	mov	r2, sp
 80009e8:	2501      	movs	r5, #1
 80009ea:	9300      	str	r3, [sp, #0]
 80009ec:	4669      	mov	r1, sp
 80009ee:	2302      	movs	r3, #2
 80009f0:	05c0      	lsls	r0, r0, #23
 80009f2:	7113      	strb	r3, [r2, #4]
 80009f4:	7155      	strb	r5, [r2, #5]
 80009f6:	7194      	strb	r4, [r2, #6]
 80009f8:	71d5      	strb	r5, [r2, #7]
 80009fa:	f000 fbd3 	bl	80011a4 <GPIO_Init>
 80009fe:	23e1      	movs	r3, #225	; 0xe1
 8000a00:	025b      	lsls	r3, r3, #9
 8000a02:	9302      	str	r3, [sp, #8]
 8000a04:	a902      	add	r1, sp, #8
 8000a06:	230c      	movs	r3, #12
 8000a08:	480a      	ldr	r0, [pc, #40]	; (8000a34 <uart_init+0x98>)
 8000a0a:	9306      	str	r3, [sp, #24]
 8000a0c:	9403      	str	r4, [sp, #12]
 8000a0e:	9404      	str	r4, [sp, #16]
 8000a10:	9405      	str	r4, [sp, #20]
 8000a12:	9407      	str	r4, [sp, #28]
 8000a14:	f000 fda6 	bl	8001564 <USART_Init>
 8000a18:	4806      	ldr	r0, [pc, #24]	; (8000a34 <uart_init+0x98>)
 8000a1a:	1c29      	adds	r1, r5, #0
 8000a1c:	f000 fe70 	bl	8001700 <USART_Cmd>
 8000a20:	b009      	add	sp, #36	; 0x24
 8000a22:	bd30      	pop	{r4, r5, pc}
 8000a24:	200003c0 	.word	0x200003c0
 8000a28:	200003c2 	.word	0x200003c2
 8000a2c:	200003b0 	.word	0x200003b0
 8000a30:	00008004 	.word	0x00008004
 8000a34:	40013800 	.word	0x40013800

08000a38 <i2c_delay>:
 8000a38:	46c0      	nop			; (mov r8, r8)
 8000a3a:	4770      	bx	lr

08000a3c <SetLowSDA>:
 8000a3c:	b508      	push	{r3, lr}
 8000a3e:	b672      	cpsid	i
 8000a40:	4b07      	ldr	r3, [pc, #28]	; (8000a60 <SetLowSDA+0x24>)
 8000a42:	2210      	movs	r2, #16
 8000a44:	851a      	strh	r2, [r3, #40]	; 0x28
 8000a46:	685a      	ldr	r2, [r3, #4]
 8000a48:	b292      	uxth	r2, r2
 8000a4a:	809a      	strh	r2, [r3, #4]
 8000a4c:	6819      	ldr	r1, [r3, #0]
 8000a4e:	2280      	movs	r2, #128	; 0x80
 8000a50:	0052      	lsls	r2, r2, #1
 8000a52:	430a      	orrs	r2, r1
 8000a54:	601a      	str	r2, [r3, #0]
 8000a56:	b662      	cpsie	i
 8000a58:	f7ff ffee 	bl	8000a38 <i2c_delay>
 8000a5c:	bd08      	pop	{r3, pc}
 8000a5e:	46c0      	nop			; (mov r8, r8)
 8000a60:	48000400 	.word	0x48000400

08000a64 <SetHighSDA>:
 8000a64:	b508      	push	{r3, lr}
 8000a66:	b672      	cpsid	i
 8000a68:	4b07      	ldr	r3, [pc, #28]	; (8000a88 <SetHighSDA+0x24>)
 8000a6a:	2210      	movs	r2, #16
 8000a6c:	619a      	str	r2, [r3, #24]
 8000a6e:	6859      	ldr	r1, [r3, #4]
 8000a70:	b289      	uxth	r1, r1
 8000a72:	4391      	bics	r1, r2
 8000a74:	8099      	strh	r1, [r3, #4]
 8000a76:	6819      	ldr	r1, [r3, #0]
 8000a78:	4a04      	ldr	r2, [pc, #16]	; (8000a8c <SetHighSDA+0x28>)
 8000a7a:	400a      	ands	r2, r1
 8000a7c:	601a      	str	r2, [r3, #0]
 8000a7e:	b662      	cpsie	i
 8000a80:	f7ff ffda 	bl	8000a38 <i2c_delay>
 8000a84:	bd08      	pop	{r3, pc}
 8000a86:	46c0      	nop			; (mov r8, r8)
 8000a88:	48000400 	.word	0x48000400
 8000a8c:	fffffcff 	.word	0xfffffcff

08000a90 <SetHighSCL>:
 8000a90:	b508      	push	{r3, lr}
 8000a92:	4b03      	ldr	r3, [pc, #12]	; (8000aa0 <SetHighSCL+0x10>)
 8000a94:	2220      	movs	r2, #32
 8000a96:	619a      	str	r2, [r3, #24]
 8000a98:	f7ff ffce 	bl	8000a38 <i2c_delay>
 8000a9c:	bd08      	pop	{r3, pc}
 8000a9e:	46c0      	nop			; (mov r8, r8)
 8000aa0:	48000400 	.word	0x48000400

08000aa4 <i2c_0_init>:
 8000aa4:	b507      	push	{r0, r1, r2, lr}
 8000aa6:	2330      	movs	r3, #48	; 0x30
 8000aa8:	4669      	mov	r1, sp
 8000aaa:	9300      	str	r3, [sp, #0]
 8000aac:	2301      	movs	r3, #1
 8000aae:	710b      	strb	r3, [r1, #4]
 8000ab0:	2203      	movs	r2, #3
 8000ab2:	2300      	movs	r3, #0
 8000ab4:	4806      	ldr	r0, [pc, #24]	; (8000ad0 <i2c_0_init+0x2c>)
 8000ab6:	718b      	strb	r3, [r1, #6]
 8000ab8:	714a      	strb	r2, [r1, #5]
 8000aba:	71cb      	strb	r3, [r1, #7]
 8000abc:	f000 fb72 	bl	80011a4 <GPIO_Init>
 8000ac0:	f7ff ffe6 	bl	8000a90 <SetHighSCL>
 8000ac4:	f7ff ffba 	bl	8000a3c <SetLowSDA>
 8000ac8:	f7ff ffcc 	bl	8000a64 <SetHighSDA>
 8000acc:	bd07      	pop	{r0, r1, r2, pc}
 8000ace:	46c0      	nop			; (mov r8, r8)
 8000ad0:	48000400 	.word	0x48000400

08000ad4 <adc_random_init>:
 8000ad4:	b570      	push	{r4, r5, r6, lr}
 8000ad6:	2001      	movs	r0, #1
 8000ad8:	f001 f818 	bl	8001b0c <ADC_TempSensorCmd>
 8000adc:	2180      	movs	r1, #128	; 0x80
 8000ade:	4813      	ldr	r0, [pc, #76]	; (8000b2c <adc_random_init+0x58>)
 8000ae0:	0249      	lsls	r1, r1, #9
 8000ae2:	2200      	movs	r2, #0
 8000ae4:	f001 f82a 	bl	8001b3c <ADC_ChannelConfig>
 8000ae8:	2420      	movs	r4, #32
 8000aea:	2500      	movs	r5, #0
 8000aec:	480f      	ldr	r0, [pc, #60]	; (8000b2c <adc_random_init+0x58>)
 8000aee:	f001 f865 	bl	8001bbc <ADC_StartOfConversion>
 8000af2:	480e      	ldr	r0, [pc, #56]	; (8000b2c <adc_random_init+0x58>)
 8000af4:	2104      	movs	r1, #4
 8000af6:	f001 f87f 	bl	8001bf8 <ADC_GetFlagStatus>
 8000afa:	2800      	cmp	r0, #0
 8000afc:	d101      	bne.n	8000b02 <adc_random_init+0x2e>
 8000afe:	46c0      	nop			; (mov r8, r8)
 8000b00:	e7f7      	b.n	8000af2 <adc_random_init+0x1e>
 8000b02:	480a      	ldr	r0, [pc, #40]	; (8000b2c <adc_random_init+0x58>)
 8000b04:	f001 f86a 	bl	8001bdc <ADC_GetConversionValue>
 8000b08:	006e      	lsls	r6, r5, #1
 8000b0a:	2301      	movs	r3, #1
 8000b0c:	1c05      	adds	r5, r0, #0
 8000b0e:	401d      	ands	r5, r3
 8000b10:	4806      	ldr	r0, [pc, #24]	; (8000b2c <adc_random_init+0x58>)
 8000b12:	2104      	movs	r1, #4
 8000b14:	3c01      	subs	r4, #1
 8000b16:	4335      	orrs	r5, r6
 8000b18:	f001 f89e 	bl	8001c58 <ADC_ClearFlag>
 8000b1c:	2c00      	cmp	r4, #0
 8000b1e:	d1e5      	bne.n	8000aec <adc_random_init+0x18>
 8000b20:	1c20      	adds	r0, r4, #0
 8000b22:	f000 fff3 	bl	8001b0c <ADC_TempSensorCmd>
 8000b26:	1c28      	adds	r0, r5, #0
 8000b28:	bd70      	pop	{r4, r5, r6, pc}
 8000b2a:	46c0      	nop			; (mov r8, r8)
 8000b2c:	40012400 	.word	0x40012400

08000b30 <adc_init>:
 8000b30:	b530      	push	{r4, r5, lr}
 8000b32:	2090      	movs	r0, #144	; 0x90
 8000b34:	b089      	sub	sp, #36	; 0x24
 8000b36:	466a      	mov	r2, sp
 8000b38:	2303      	movs	r3, #3
 8000b3a:	2401      	movs	r4, #1
 8000b3c:	2500      	movs	r5, #0
 8000b3e:	05c0      	lsls	r0, r0, #23
 8000b40:	4669      	mov	r1, sp
 8000b42:	7113      	strb	r3, [r2, #4]
 8000b44:	71d5      	strb	r5, [r2, #7]
 8000b46:	9400      	str	r4, [sp, #0]
 8000b48:	f000 fb2c 	bl	80011a4 <GPIO_Init>
 8000b4c:	2080      	movs	r0, #128	; 0x80
 8000b4e:	0080      	lsls	r0, r0, #2
 8000b50:	1c21      	adds	r1, r4, #0
 8000b52:	f001 f9f3 	bl	8001f3c <RCC_APB2PeriphClockCmd>
 8000b56:	1c28      	adds	r0, r5, #0
 8000b58:	f001 f8e4 	bl	8001d24 <RCC_ADCCLKConfig>
 8000b5c:	1c20      	adds	r0, r4, #0
 8000b5e:	f001 f8cd 	bl	8001cfc <RCC_HSI14Cmd>
 8000b62:	2061      	movs	r0, #97	; 0x61
 8000b64:	f001 fa4a 	bl	8001ffc <RCC_GetFlagStatus>
 8000b68:	2800      	cmp	r0, #0
 8000b6a:	d101      	bne.n	8000b70 <adc_init+0x40>
 8000b6c:	46c0      	nop			; (mov r8, r8)
 8000b6e:	e7f8      	b.n	8000b62 <adc_init+0x32>
 8000b70:	4811      	ldr	r0, [pc, #68]	; (8000bb8 <adc_init+0x88>)
 8000b72:	f000 ff45 	bl	8001a00 <ADC_DeInit>
 8000b76:	a902      	add	r1, sp, #8
 8000b78:	2300      	movs	r3, #0
 8000b7a:	480f      	ldr	r0, [pc, #60]	; (8000bb8 <adc_init+0x88>)
 8000b7c:	710b      	strb	r3, [r1, #4]
 8000b7e:	610b      	str	r3, [r1, #16]
 8000b80:	614b      	str	r3, [r1, #20]
 8000b82:	608b      	str	r3, [r1, #8]
 8000b84:	60cb      	str	r3, [r1, #12]
 8000b86:	9302      	str	r3, [sp, #8]
 8000b88:	f000 ff52 	bl	8001a30 <ADC_Init>
 8000b8c:	480a      	ldr	r0, [pc, #40]	; (8000bb8 <adc_init+0x88>)
 8000b8e:	f000 fff5 	bl	8001b7c <ADC_GetCalibrationFactor>
 8000b92:	4809      	ldr	r0, [pc, #36]	; (8000bb8 <adc_init+0x88>)
 8000b94:	2101      	movs	r1, #1
 8000b96:	f000 ff9d 	bl	8001ad4 <ADC_Cmd>
 8000b9a:	4807      	ldr	r0, [pc, #28]	; (8000bb8 <adc_init+0x88>)
 8000b9c:	2101      	movs	r1, #1
 8000b9e:	f001 f82b 	bl	8001bf8 <ADC_GetFlagStatus>
 8000ba2:	2800      	cmp	r0, #0
 8000ba4:	d101      	bne.n	8000baa <adc_init+0x7a>
 8000ba6:	46c0      	nop			; (mov r8, r8)
 8000ba8:	e7f7      	b.n	8000b9a <adc_init+0x6a>
 8000baa:	f7ff ff93 	bl	8000ad4 <adc_random_init>
 8000bae:	4b03      	ldr	r3, [pc, #12]	; (8000bbc <adc_init+0x8c>)
 8000bb0:	6018      	str	r0, [r3, #0]
 8000bb2:	b009      	add	sp, #36	; 0x24
 8000bb4:	bd30      	pop	{r4, r5, pc}
 8000bb6:	46c0      	nop			; (mov r8, r8)
 8000bb8:	40012400 	.word	0x40012400
 8000bbc:	20000018 	.word	0x20000018

08000bc0 <adc_read>:
 8000bc0:	4b07      	ldr	r3, [pc, #28]	; (8000be0 <adc_read+0x20>)
 8000bc2:	2104      	movs	r1, #4
 8000bc4:	689a      	ldr	r2, [r3, #8]
 8000bc6:	430a      	orrs	r2, r1
 8000bc8:	609a      	str	r2, [r3, #8]
 8000bca:	6818      	ldr	r0, [r3, #0]
 8000bcc:	2104      	movs	r1, #4
 8000bce:	4a04      	ldr	r2, [pc, #16]	; (8000be0 <adc_read+0x20>)
 8000bd0:	4208      	tst	r0, r1
 8000bd2:	d101      	bne.n	8000bd8 <adc_read+0x18>
 8000bd4:	46c0      	nop			; (mov r8, r8)
 8000bd6:	e7f8      	b.n	8000bca <adc_read+0xa>
 8000bd8:	6c10      	ldr	r0, [r2, #64]	; 0x40
 8000bda:	6011      	str	r1, [r2, #0]
 8000bdc:	4770      	bx	lr
 8000bde:	46c0      	nop			; (mov r8, r8)
 8000be0:	40012400 	.word	0x40012400

08000be4 <adc_config_ch>:
 8000be4:	b508      	push	{r3, lr}
 8000be6:	1c01      	adds	r1, r0, #0
 8000be8:	2200      	movs	r2, #0
 8000bea:	4803      	ldr	r0, [pc, #12]	; (8000bf8 <adc_config_ch+0x14>)
 8000bec:	f000 ffa6 	bl	8001b3c <ADC_ChannelConfig>
 8000bf0:	f7ff ffe6 	bl	8000bc0 <adc_read>
 8000bf4:	bd08      	pop	{r3, pc}
 8000bf6:	46c0      	nop			; (mov r8, r8)
 8000bf8:	40012400 	.word	0x40012400

08000bfc <assert_param>:
 8000bfc:	4770      	bx	lr
	...

08000c00 <sys_tick_init>:
 8000c00:	4b03      	ldr	r3, [pc, #12]	; (8000c10 <sys_tick_init+0x10>)
 8000c02:	4a04      	ldr	r2, [pc, #16]	; (8000c14 <sys_tick_init+0x14>)
 8000c04:	605a      	str	r2, [r3, #4]
 8000c06:	2200      	movs	r2, #0
 8000c08:	609a      	str	r2, [r3, #8]
 8000c0a:	2207      	movs	r2, #7
 8000c0c:	601a      	str	r2, [r3, #0]
 8000c0e:	4770      	bx	lr
 8000c10:	e000e010 	.word	0xe000e010
 8000c14:	0000bb80 	.word	0x0000bb80

08000c18 <sleep>:
 8000c18:	bf30      	wfi
 8000c1a:	4770      	bx	lr

08000c1c <SystemInit>:
 8000c1c:	4b26      	ldr	r3, [pc, #152]	; (8000cb8 <SystemInit+0x9c>)
 8000c1e:	2201      	movs	r2, #1
 8000c20:	6819      	ldr	r1, [r3, #0]
 8000c22:	b082      	sub	sp, #8
 8000c24:	4311      	orrs	r1, r2
 8000c26:	6019      	str	r1, [r3, #0]
 8000c28:	6858      	ldr	r0, [r3, #4]
 8000c2a:	4924      	ldr	r1, [pc, #144]	; (8000cbc <SystemInit+0xa0>)
 8000c2c:	4001      	ands	r1, r0
 8000c2e:	6059      	str	r1, [r3, #4]
 8000c30:	6818      	ldr	r0, [r3, #0]
 8000c32:	4923      	ldr	r1, [pc, #140]	; (8000cc0 <SystemInit+0xa4>)
 8000c34:	4001      	ands	r1, r0
 8000c36:	6019      	str	r1, [r3, #0]
 8000c38:	6818      	ldr	r0, [r3, #0]
 8000c3a:	4922      	ldr	r1, [pc, #136]	; (8000cc4 <SystemInit+0xa8>)
 8000c3c:	4001      	ands	r1, r0
 8000c3e:	6019      	str	r1, [r3, #0]
 8000c40:	6858      	ldr	r0, [r3, #4]
 8000c42:	4921      	ldr	r1, [pc, #132]	; (8000cc8 <SystemInit+0xac>)
 8000c44:	4001      	ands	r1, r0
 8000c46:	6059      	str	r1, [r3, #4]
 8000c48:	6ad9      	ldr	r1, [r3, #44]	; 0x2c
 8000c4a:	200f      	movs	r0, #15
 8000c4c:	4381      	bics	r1, r0
 8000c4e:	62d9      	str	r1, [r3, #44]	; 0x2c
 8000c50:	6b18      	ldr	r0, [r3, #48]	; 0x30
 8000c52:	491e      	ldr	r1, [pc, #120]	; (8000ccc <SystemInit+0xb0>)
 8000c54:	4001      	ands	r1, r0
 8000c56:	6319      	str	r1, [r3, #48]	; 0x30
 8000c58:	6b59      	ldr	r1, [r3, #52]	; 0x34
 8000c5a:	4391      	bics	r1, r2
 8000c5c:	2200      	movs	r2, #0
 8000c5e:	6359      	str	r1, [r3, #52]	; 0x34
 8000c60:	609a      	str	r2, [r3, #8]
 8000c62:	9200      	str	r2, [sp, #0]
 8000c64:	9201      	str	r2, [sp, #4]
 8000c66:	4a1a      	ldr	r2, [pc, #104]	; (8000cd0 <SystemInit+0xb4>)
 8000c68:	2111      	movs	r1, #17
 8000c6a:	6011      	str	r1, [r2, #0]
 8000c6c:	685a      	ldr	r2, [r3, #4]
 8000c6e:	605a      	str	r2, [r3, #4]
 8000c70:	685a      	ldr	r2, [r3, #4]
 8000c72:	605a      	str	r2, [r3, #4]
 8000c74:	6859      	ldr	r1, [r3, #4]
 8000c76:	4a17      	ldr	r2, [pc, #92]	; (8000cd4 <SystemInit+0xb8>)
 8000c78:	400a      	ands	r2, r1
 8000c7a:	605a      	str	r2, [r3, #4]
 8000c7c:	6859      	ldr	r1, [r3, #4]
 8000c7e:	22a0      	movs	r2, #160	; 0xa0
 8000c80:	0392      	lsls	r2, r2, #14
 8000c82:	430a      	orrs	r2, r1
 8000c84:	605a      	str	r2, [r3, #4]
 8000c86:	6819      	ldr	r1, [r3, #0]
 8000c88:	2280      	movs	r2, #128	; 0x80
 8000c8a:	0452      	lsls	r2, r2, #17
 8000c8c:	430a      	orrs	r2, r1
 8000c8e:	601a      	str	r2, [r3, #0]
 8000c90:	6819      	ldr	r1, [r3, #0]
 8000c92:	4a09      	ldr	r2, [pc, #36]	; (8000cb8 <SystemInit+0x9c>)
 8000c94:	0188      	lsls	r0, r1, #6
 8000c96:	d5fb      	bpl.n	8000c90 <SystemInit+0x74>
 8000c98:	6851      	ldr	r1, [r2, #4]
 8000c9a:	2003      	movs	r0, #3
 8000c9c:	4381      	bics	r1, r0
 8000c9e:	6051      	str	r1, [r2, #4]
 8000ca0:	6851      	ldr	r1, [r2, #4]
 8000ca2:	2002      	movs	r0, #2
 8000ca4:	4301      	orrs	r1, r0
 8000ca6:	6051      	str	r1, [r2, #4]
 8000ca8:	6859      	ldr	r1, [r3, #4]
 8000caa:	220c      	movs	r2, #12
 8000cac:	400a      	ands	r2, r1
 8000cae:	2a08      	cmp	r2, #8
 8000cb0:	d1fa      	bne.n	8000ca8 <SystemInit+0x8c>
 8000cb2:	b002      	add	sp, #8
 8000cb4:	4770      	bx	lr
 8000cb6:	46c0      	nop			; (mov r8, r8)
 8000cb8:	40021000 	.word	0x40021000
 8000cbc:	f8ffb80c 	.word	0xf8ffb80c
 8000cc0:	fef6ffff 	.word	0xfef6ffff
 8000cc4:	fffbffff 	.word	0xfffbffff
 8000cc8:	ffc0ffff 	.word	0xffc0ffff
 8000ccc:	fffffeac 	.word	0xfffffeac
 8000cd0:	40022000 	.word	0x40022000
 8000cd4:	ffc07fff 	.word	0xffc07fff

08000cd8 <TIM16_IRQHandler>:
 8000cd8:	4b20      	ldr	r3, [pc, #128]	; (8000d5c <TIM16_IRQHandler+0x84>)
 8000cda:	799a      	ldrb	r2, [r3, #6]
 8000cdc:	78d9      	ldrb	r1, [r3, #3]
 8000cde:	4291      	cmp	r1, r2
 8000ce0:	d805      	bhi.n	8000cee <TIM16_IRQHandler+0x16>
 8000ce2:	2080      	movs	r0, #128	; 0x80
 8000ce4:	2190      	movs	r1, #144	; 0x90
 8000ce6:	0040      	lsls	r0, r0, #1
 8000ce8:	05c9      	lsls	r1, r1, #23
 8000cea:	8508      	strh	r0, [r1, #40]	; 0x28
 8000cec:	e006      	b.n	8000cfc <TIM16_IRQHandler+0x24>
 8000cee:	2a00      	cmp	r2, #0
 8000cf0:	d104      	bne.n	8000cfc <TIM16_IRQHandler+0x24>
 8000cf2:	2080      	movs	r0, #128	; 0x80
 8000cf4:	2190      	movs	r1, #144	; 0x90
 8000cf6:	0040      	lsls	r0, r0, #1
 8000cf8:	05c9      	lsls	r1, r1, #23
 8000cfa:	6188      	str	r0, [r1, #24]
 8000cfc:	7919      	ldrb	r1, [r3, #4]
 8000cfe:	4291      	cmp	r1, r2
 8000d00:	d805      	bhi.n	8000d0e <TIM16_IRQHandler+0x36>
 8000d02:	2080      	movs	r0, #128	; 0x80
 8000d04:	2190      	movs	r1, #144	; 0x90
 8000d06:	0100      	lsls	r0, r0, #4
 8000d08:	05c9      	lsls	r1, r1, #23
 8000d0a:	8508      	strh	r0, [r1, #40]	; 0x28
 8000d0c:	e006      	b.n	8000d1c <TIM16_IRQHandler+0x44>
 8000d0e:	2a00      	cmp	r2, #0
 8000d10:	d104      	bne.n	8000d1c <TIM16_IRQHandler+0x44>
 8000d12:	2080      	movs	r0, #128	; 0x80
 8000d14:	2190      	movs	r1, #144	; 0x90
 8000d16:	0100      	lsls	r0, r0, #4
 8000d18:	05c9      	lsls	r1, r1, #23
 8000d1a:	6188      	str	r0, [r1, #24]
 8000d1c:	7959      	ldrb	r1, [r3, #5]
 8000d1e:	4291      	cmp	r1, r2
 8000d20:	d806      	bhi.n	8000d30 <TIM16_IRQHandler+0x58>
 8000d22:	2190      	movs	r1, #144	; 0x90
 8000d24:	2002      	movs	r0, #2
 8000d26:	05c9      	lsls	r1, r1, #23
 8000d28:	8508      	strh	r0, [r1, #40]	; 0x28
 8000d2a:	2a00      	cmp	r2, #0
 8000d2c:	d006      	beq.n	8000d3c <TIM16_IRQHandler+0x64>
 8000d2e:	e00b      	b.n	8000d48 <TIM16_IRQHandler+0x70>
 8000d30:	2a00      	cmp	r2, #0
 8000d32:	d109      	bne.n	8000d48 <TIM16_IRQHandler+0x70>
 8000d34:	2190      	movs	r1, #144	; 0x90
 8000d36:	2002      	movs	r0, #2
 8000d38:	05c9      	lsls	r1, r1, #23
 8000d3a:	6188      	str	r0, [r1, #24]
 8000d3c:	7819      	ldrb	r1, [r3, #0]
 8000d3e:	70d9      	strb	r1, [r3, #3]
 8000d40:	7859      	ldrb	r1, [r3, #1]
 8000d42:	7119      	strb	r1, [r3, #4]
 8000d44:	7899      	ldrb	r1, [r3, #2]
 8000d46:	7159      	strb	r1, [r3, #5]
 8000d48:	3201      	adds	r2, #1
 8000d4a:	b2d2      	uxtb	r2, r2
 8000d4c:	2a10      	cmp	r2, #16
 8000d4e:	d900      	bls.n	8000d52 <TIM16_IRQHandler+0x7a>
 8000d50:	2200      	movs	r2, #0
 8000d52:	719a      	strb	r2, [r3, #6]
 8000d54:	4b02      	ldr	r3, [pc, #8]	; (8000d60 <TIM16_IRQHandler+0x88>)
 8000d56:	2200      	movs	r2, #0
 8000d58:	821a      	strh	r2, [r3, #16]
 8000d5a:	4770      	bx	lr
 8000d5c:	2000007c 	.word	0x2000007c
 8000d60:	40014400 	.word	0x40014400

08000d64 <lib_low_level_init>:
 8000d64:	b508      	push	{r3, lr}
 8000d66:	f7ff ff59 	bl	8000c1c <SystemInit>
 8000d6a:	f001 f97d 	bl	8002068 <gpio_init>
 8000d6e:	f7ff fe15 	bl	800099c <uart_init>
 8000d72:	f7ff fd35 	bl	80007e0 <timer_init>
 8000d76:	f7ff fe95 	bl	8000aa4 <i2c_0_init>
 8000d7a:	f7ff fed9 	bl	8000b30 <adc_init>
 8000d7e:	bd08      	pop	{r3, pc}

08000d80 <ir_comm_init>:
 8000d80:	4a35      	ldr	r2, [pc, #212]	; (8000e58 <ir_comm_init+0xd8>)
 8000d82:	2300      	movs	r3, #0
 8000d84:	b5f0      	push	{r4, r5, r6, r7, lr}
 8000d86:	6013      	str	r3, [r2, #0]
 8000d88:	4a34      	ldr	r2, [pc, #208]	; (8000e5c <ir_comm_init+0xdc>)
 8000d8a:	b087      	sub	sp, #28
 8000d8c:	6013      	str	r3, [r2, #0]
 8000d8e:	4a34      	ldr	r2, [pc, #208]	; (8000e60 <ir_comm_init+0xe0>)
 8000d90:	6013      	str	r3, [r2, #0]
 8000d92:	4a34      	ldr	r2, [pc, #208]	; (8000e64 <ir_comm_init+0xe4>)
 8000d94:	6013      	str	r3, [r2, #0]
 8000d96:	4a34      	ldr	r2, [pc, #208]	; (8000e68 <ir_comm_init+0xe8>)
 8000d98:	8013      	strh	r3, [r2, #0]
 8000d9a:	4a34      	ldr	r2, [pc, #208]	; (8000e6c <ir_comm_init+0xec>)
 8000d9c:	7013      	strb	r3, [r2, #0]
 8000d9e:	4a34      	ldr	r2, [pc, #208]	; (8000e70 <ir_comm_init+0xf0>)
 8000da0:	7013      	strb	r3, [r2, #0]
 8000da2:	4a34      	ldr	r2, [pc, #208]	; (8000e74 <ir_comm_init+0xf4>)
 8000da4:	7013      	strb	r3, [r2, #0]
 8000da6:	4a34      	ldr	r2, [pc, #208]	; (8000e78 <ir_comm_init+0xf8>)
 8000da8:	2500      	movs	r5, #0
 8000daa:	189a      	adds	r2, r3, r2
 8000dac:	3301      	adds	r3, #1
 8000dae:	7015      	strb	r5, [r2, #0]
 8000db0:	2b0e      	cmp	r3, #14
 8000db2:	d1f8      	bne.n	8000da6 <ir_comm_init+0x26>
 8000db4:	2690      	movs	r6, #144	; 0x90
 8000db6:	ac01      	add	r4, sp, #4
 8000db8:	2301      	movs	r3, #1
 8000dba:	05f6      	lsls	r6, r6, #23
 8000dbc:	2780      	movs	r7, #128	; 0x80
 8000dbe:	007f      	lsls	r7, r7, #1
 8000dc0:	7123      	strb	r3, [r4, #4]
 8000dc2:	1c30      	adds	r0, r6, #0
 8000dc4:	2303      	movs	r3, #3
 8000dc6:	1c21      	adds	r1, r4, #0
 8000dc8:	7163      	strb	r3, [r4, #5]
 8000dca:	9701      	str	r7, [sp, #4]
 8000dcc:	71a5      	strb	r5, [r4, #6]
 8000dce:	71e5      	strb	r5, [r4, #7]
 8000dd0:	f000 f9e8 	bl	80011a4 <GPIO_Init>
 8000dd4:	4b29      	ldr	r3, [pc, #164]	; (8000e7c <ir_comm_init+0xfc>)
 8000dd6:	8537      	strh	r7, [r6, #40]	; 0x28
 8000dd8:	801d      	strh	r5, [r3, #0]
 8000dda:	4b29      	ldr	r3, [pc, #164]	; (8000e80 <ir_comm_init+0x100>)
 8000ddc:	701d      	strb	r5, [r3, #0]
 8000dde:	4b29      	ldr	r3, [pc, #164]	; (8000e84 <ir_comm_init+0x104>)
 8000de0:	701d      	strb	r5, [r3, #0]
 8000de2:	4b29      	ldr	r3, [pc, #164]	; (8000e88 <ir_comm_init+0x108>)
 8000de4:	701d      	strb	r5, [r3, #0]
 8000de6:	4b29      	ldr	r3, [pc, #164]	; (8000e8c <ir_comm_init+0x10c>)
 8000de8:	2600      	movs	r6, #0
 8000dea:	18eb      	adds	r3, r5, r3
 8000dec:	3501      	adds	r5, #1
 8000dee:	701e      	strb	r6, [r3, #0]
 8000df0:	2d0e      	cmp	r5, #14
 8000df2:	d1f8      	bne.n	8000de6 <ir_comm_init+0x66>
 8000df4:	2090      	movs	r0, #144	; 0x90
 8000df6:	2501      	movs	r5, #1
 8000df8:	2303      	movs	r3, #3
 8000dfa:	1c21      	adds	r1, r4, #0
 8000dfc:	05c0      	lsls	r0, r0, #23
 8000dfe:	7123      	strb	r3, [r4, #4]
 8000e00:	9501      	str	r5, [sp, #4]
 8000e02:	71e6      	strb	r6, [r4, #7]
 8000e04:	f000 f9ce 	bl	80011a4 <GPIO_Init>
 8000e08:	1c28      	adds	r0, r5, #0
 8000e0a:	f7ff feeb 	bl	8000be4 <adc_config_ch>
 8000e0e:	2080      	movs	r0, #128	; 0x80
 8000e10:	1c29      	adds	r1, r5, #0
 8000e12:	40a8      	lsls	r0, r5
 8000e14:	f001 f8b2 	bl	8001f7c <RCC_APB1PeriphClockCmd>
 8000e18:	a903      	add	r1, sp, #12
 8000e1a:	2330      	movs	r3, #48	; 0x30
 8000e1c:	800b      	strh	r3, [r1, #0]
 8000e1e:	23d0      	movs	r3, #208	; 0xd0
 8000e20:	40ab      	lsls	r3, r5
 8000e22:	481b      	ldr	r0, [pc, #108]	; (8000e90 <ir_comm_init+0x110>)
 8000e24:	604b      	str	r3, [r1, #4]
 8000e26:	804e      	strh	r6, [r1, #2]
 8000e28:	810e      	strh	r6, [r1, #8]
 8000e2a:	728e      	strb	r6, [r1, #10]
 8000e2c:	f000 fa84 	bl	8001338 <TIM_TimeBaseInit>
 8000e30:	1c29      	adds	r1, r5, #0
 8000e32:	4817      	ldr	r0, [pc, #92]	; (8000e90 <ir_comm_init+0x110>)
 8000e34:	f000 fb02 	bl	800143c <TIM_Cmd>
 8000e38:	2102      	movs	r1, #2
 8000e3a:	1c2a      	adds	r2, r5, #0
 8000e3c:	4814      	ldr	r0, [pc, #80]	; (8000e90 <ir_comm_init+0x110>)
 8000e3e:	f000 fb41 	bl	80014c4 <TIM_ITConfig>
 8000e42:	466a      	mov	r2, sp
 8000e44:	2313      	movs	r3, #19
 8000e46:	7013      	strb	r3, [r2, #0]
 8000e48:	4668      	mov	r0, sp
 8000e4a:	2304      	movs	r3, #4
 8000e4c:	7053      	strb	r3, [r2, #1]
 8000e4e:	7095      	strb	r5, [r2, #2]
 8000e50:	f000 ff1a 	bl	8001c88 <NVIC_Init>
 8000e54:	b007      	add	sp, #28
 8000e56:	bdf0      	pop	{r4, r5, r6, r7, pc}
 8000e58:	200003d4 	.word	0x200003d4
 8000e5c:	200003c8 	.word	0x200003c8
 8000e60:	200003d8 	.word	0x200003d8
 8000e64:	200003e0 	.word	0x200003e0
 8000e68:	200003ce 	.word	0x200003ce
 8000e6c:	200003dc 	.word	0x200003dc
 8000e70:	200003c7 	.word	0x200003c7
 8000e74:	200003c6 	.word	0x200003c6
 8000e78:	20000096 	.word	0x20000096
 8000e7c:	200003c4 	.word	0x200003c4
 8000e80:	200003d1 	.word	0x200003d1
 8000e84:	200003cc 	.word	0x200003cc
 8000e88:	200003d0 	.word	0x200003d0
 8000e8c:	20000088 	.word	0x20000088
 8000e90:	40002000 	.word	0x40002000

08000e94 <ir_comm_start_tx>:
 8000e94:	4b03      	ldr	r3, [pc, #12]	; (8000ea4 <ir_comm_start_tx+0x10>)
 8000e96:	2200      	movs	r2, #0
 8000e98:	701a      	strb	r2, [r3, #0]
 8000e9a:	4b03      	ldr	r3, [pc, #12]	; (8000ea8 <ir_comm_start_tx+0x14>)
 8000e9c:	2201      	movs	r2, #1
 8000e9e:	701a      	strb	r2, [r3, #0]
 8000ea0:	4770      	bx	lr
 8000ea2:	46c0      	nop			; (mov r8, r8)
 8000ea4:	200003c6 	.word	0x200003c6
 8000ea8:	200003c7 	.word	0x200003c7

08000eac <ir_comm_get_tx_flag>:
 8000eac:	4b03      	ldr	r3, [pc, #12]	; (8000ebc <ir_comm_get_tx_flag+0x10>)
 8000eae:	2000      	movs	r0, #0
 8000eb0:	781a      	ldrb	r2, [r3, #0]
 8000eb2:	4282      	cmp	r2, r0
 8000eb4:	d001      	beq.n	8000eba <ir_comm_get_tx_flag+0xe>
 8000eb6:	7818      	ldrb	r0, [r3, #0]
 8000eb8:	b2c0      	uxtb	r0, r0
 8000eba:	4770      	bx	lr
 8000ebc:	200003c7 	.word	0x200003c7

08000ec0 <ir_comm_start_rx>:
 8000ec0:	4b03      	ldr	r3, [pc, #12]	; (8000ed0 <ir_comm_start_rx+0x10>)
 8000ec2:	2200      	movs	r2, #0
 8000ec4:	701a      	strb	r2, [r3, #0]
 8000ec6:	4b03      	ldr	r3, [pc, #12]	; (8000ed4 <ir_comm_start_rx+0x14>)
 8000ec8:	2201      	movs	r2, #1
 8000eca:	701a      	strb	r2, [r3, #0]
 8000ecc:	4770      	bx	lr
 8000ece:	46c0      	nop			; (mov r8, r8)
 8000ed0:	200003d0 	.word	0x200003d0
 8000ed4:	200003cc 	.word	0x200003cc

08000ed8 <ir_comm_get_rx_flag>:
 8000ed8:	4b03      	ldr	r3, [pc, #12]	; (8000ee8 <ir_comm_get_rx_flag+0x10>)
 8000eda:	2000      	movs	r0, #0
 8000edc:	781a      	ldrb	r2, [r3, #0]
 8000ede:	4282      	cmp	r2, r0
 8000ee0:	d001      	beq.n	8000ee6 <ir_comm_get_rx_flag+0xe>
 8000ee2:	7818      	ldrb	r0, [r3, #0]
 8000ee4:	b2c0      	uxtb	r0, r0
 8000ee6:	4770      	bx	lr
 8000ee8:	200003cc 	.word	0x200003cc

08000eec <ir_comm_received_signal_strength>:
 8000eec:	4b01      	ldr	r3, [pc, #4]	; (8000ef4 <ir_comm_received_signal_strength+0x8>)
 8000eee:	8818      	ldrh	r0, [r3, #0]
 8000ef0:	4770      	bx	lr
 8000ef2:	46c0      	nop			; (mov r8, r8)
 8000ef4:	200003c8 	.word	0x200003c8

08000ef8 <TIM14_IRQHandler>:
 8000ef8:	b570      	push	{r4, r5, r6, lr}
 8000efa:	4b60      	ldr	r3, [pc, #384]	; (800107c <TIM14_IRQHandler+0x184>)
 8000efc:	7818      	ldrb	r0, [r3, #0]
 8000efe:	b2c0      	uxtb	r0, r0
 8000f00:	2803      	cmp	r0, #3
 8000f02:	d83f      	bhi.n	8000f84 <TIM14_IRQHandler+0x8c>
 8000f04:	f001 f952 	bl	80021ac <__gnu_thumb1_case_uqi>
 8000f08:	32220a02 	.word	0x32220a02
 8000f0c:	2280      	movs	r2, #128	; 0x80
 8000f0e:	2390      	movs	r3, #144	; 0x90
 8000f10:	0052      	lsls	r2, r2, #1
 8000f12:	05db      	lsls	r3, r3, #23
 8000f14:	851a      	strh	r2, [r3, #40]	; 0x28
 8000f16:	2200      	movs	r2, #0
 8000f18:	4b59      	ldr	r3, [pc, #356]	; (8001080 <TIM14_IRQHandler+0x188>)
 8000f1a:	e032      	b.n	8000f82 <TIM14_IRQHandler+0x8a>
 8000f1c:	4a58      	ldr	r2, [pc, #352]	; (8001080 <TIM14_IRQHandler+0x188>)
 8000f1e:	7811      	ldrb	r1, [r2, #0]
 8000f20:	290d      	cmp	r1, #13
 8000f22:	d901      	bls.n	8000f28 <TIM14_IRQHandler+0x30>
 8000f24:	2200      	movs	r2, #0
 8000f26:	e02c      	b.n	8000f82 <TIM14_IRQHandler+0x8a>
 8000f28:	7811      	ldrb	r1, [r2, #0]
 8000f2a:	4856      	ldr	r0, [pc, #344]	; (8001084 <TIM14_IRQHandler+0x18c>)
 8000f2c:	5c41      	ldrb	r1, [r0, r1]
 8000f2e:	20ff      	movs	r0, #255	; 0xff
 8000f30:	4388      	bics	r0, r1
 8000f32:	0040      	lsls	r0, r0, #1
 8000f34:	2101      	movs	r1, #1
 8000f36:	4308      	orrs	r0, r1
 8000f38:	4953      	ldr	r1, [pc, #332]	; (8001088 <TIM14_IRQHandler+0x190>)
 8000f3a:	8008      	strh	r0, [r1, #0]
 8000f3c:	7811      	ldrb	r1, [r2, #0]
 8000f3e:	3101      	adds	r1, #1
 8000f40:	b2c9      	uxtb	r1, r1
 8000f42:	7011      	strb	r1, [r2, #0]
 8000f44:	4a51      	ldr	r2, [pc, #324]	; (800108c <TIM14_IRQHandler+0x194>)
 8000f46:	2100      	movs	r1, #0
 8000f48:	7011      	strb	r1, [r2, #0]
 8000f4a:	e019      	b.n	8000f80 <TIM14_IRQHandler+0x88>
 8000f4c:	4a4e      	ldr	r2, [pc, #312]	; (8001088 <TIM14_IRQHandler+0x190>)
 8000f4e:	2190      	movs	r1, #144	; 0x90
 8000f50:	8814      	ldrh	r4, [r2, #0]
 8000f52:	2080      	movs	r0, #128	; 0x80
 8000f54:	05c9      	lsls	r1, r1, #23
 8000f56:	0040      	lsls	r0, r0, #1
 8000f58:	07e5      	lsls	r5, r4, #31
 8000f5a:	d501      	bpl.n	8000f60 <TIM14_IRQHandler+0x68>
 8000f5c:	6188      	str	r0, [r1, #24]
 8000f5e:	e000      	b.n	8000f62 <TIM14_IRQHandler+0x6a>
 8000f60:	8508      	strh	r0, [r1, #40]	; 0x28
 8000f62:	8811      	ldrh	r1, [r2, #0]
 8000f64:	0849      	lsrs	r1, r1, #1
 8000f66:	8011      	strh	r1, [r2, #0]
 8000f68:	2203      	movs	r2, #3
 8000f6a:	e00a      	b.n	8000f82 <TIM14_IRQHandler+0x8a>
 8000f6c:	4a47      	ldr	r2, [pc, #284]	; (800108c <TIM14_IRQHandler+0x194>)
 8000f6e:	7811      	ldrb	r1, [r2, #0]
 8000f70:	3101      	adds	r1, #1
 8000f72:	b2c9      	uxtb	r1, r1
 8000f74:	7011      	strb	r1, [r2, #0]
 8000f76:	7812      	ldrb	r2, [r2, #0]
 8000f78:	2a09      	cmp	r2, #9
 8000f7a:	d901      	bls.n	8000f80 <TIM14_IRQHandler+0x88>
 8000f7c:	2201      	movs	r2, #1
 8000f7e:	e000      	b.n	8000f82 <TIM14_IRQHandler+0x8a>
 8000f80:	2202      	movs	r2, #2
 8000f82:	701a      	strb	r2, [r3, #0]
 8000f84:	4b42      	ldr	r3, [pc, #264]	; (8001090 <TIM14_IRQHandler+0x198>)
 8000f86:	2104      	movs	r1, #4
 8000f88:	6c1a      	ldr	r2, [r3, #64]	; 0x40
 8000f8a:	6019      	str	r1, [r3, #0]
 8000f8c:	6898      	ldr	r0, [r3, #8]
 8000f8e:	4301      	orrs	r1, r0
 8000f90:	6099      	str	r1, [r3, #8]
 8000f92:	4b40      	ldr	r3, [pc, #256]	; (8001094 <TIM14_IRQHandler+0x19c>)
 8000f94:	2101      	movs	r1, #1
 8000f96:	429a      	cmp	r2, r3
 8000f98:	d80b      	bhi.n	8000fb2 <TIM14_IRQHandler+0xba>
 8000f9a:	4b3f      	ldr	r3, [pc, #252]	; (8001098 <TIM14_IRQHandler+0x1a0>)
 8000f9c:	2480      	movs	r4, #128	; 0x80
 8000f9e:	6818      	ldr	r0, [r3, #0]
 8000fa0:	0164      	lsls	r4, r4, #5
 8000fa2:	1901      	adds	r1, r0, r4
 8000fa4:	1a8a      	subs	r2, r1, r2
 8000fa6:	601a      	str	r2, [r3, #0]
 8000fa8:	4b3c      	ldr	r3, [pc, #240]	; (800109c <TIM14_IRQHandler+0x1a4>)
 8000faa:	2100      	movs	r1, #0
 8000fac:	681a      	ldr	r2, [r3, #0]
 8000fae:	3201      	adds	r2, #1
 8000fb0:	601a      	str	r2, [r3, #0]
 8000fb2:	4b3b      	ldr	r3, [pc, #236]	; (80010a0 <TIM14_IRQHandler+0x1a8>)
 8000fb4:	7818      	ldrb	r0, [r3, #0]
 8000fb6:	b2c0      	uxtb	r0, r0
 8000fb8:	2804      	cmp	r0, #4
 8000fba:	d85a      	bhi.n	8001072 <TIM14_IRQHandler+0x17a>
 8000fbc:	f001 f8f6 	bl	80021ac <__gnu_thumb1_case_uqi>
 8000fc0:	36110603 	.word	0x36110603
 8000fc4:	38          	.byte	0x38
 8000fc5:	00          	.byte	0x00
 8000fc6:	2200      	movs	r2, #0
 8000fc8:	4b36      	ldr	r3, [pc, #216]	; (80010a4 <TIM14_IRQHandler+0x1ac>)
 8000fca:	e051      	b.n	8001070 <TIM14_IRQHandler+0x178>
 8000fcc:	4a35      	ldr	r2, [pc, #212]	; (80010a4 <TIM14_IRQHandler+0x1ac>)
 8000fce:	7811      	ldrb	r1, [r2, #0]
 8000fd0:	2200      	movs	r2, #0
 8000fd2:	290d      	cmp	r1, #13
 8000fd4:	d84c      	bhi.n	8001070 <TIM14_IRQHandler+0x178>
 8000fd6:	4934      	ldr	r1, [pc, #208]	; (80010a8 <TIM14_IRQHandler+0x1b0>)
 8000fd8:	800a      	strh	r2, [r1, #0]
 8000fda:	4934      	ldr	r1, [pc, #208]	; (80010ac <TIM14_IRQHandler+0x1b4>)
 8000fdc:	700a      	strb	r2, [r1, #0]
 8000fde:	2202      	movs	r2, #2
 8000fe0:	e046      	b.n	8001070 <TIM14_IRQHandler+0x178>
 8000fe2:	4a33      	ldr	r2, [pc, #204]	; (80010b0 <TIM14_IRQHandler+0x1b8>)
 8000fe4:	2900      	cmp	r1, #0
 8000fe6:	d103      	bne.n	8000ff0 <TIM14_IRQHandler+0xf8>
 8000fe8:	2003      	movs	r0, #3
 8000fea:	7018      	strb	r0, [r3, #0]
 8000fec:	6011      	str	r1, [r2, #0]
 8000fee:	e040      	b.n	8001072 <TIM14_IRQHandler+0x17a>
 8000ff0:	6811      	ldr	r1, [r2, #0]
 8000ff2:	3101      	adds	r1, #1
 8000ff4:	6011      	str	r1, [r2, #0]
 8000ff6:	6810      	ldr	r0, [r2, #0]
 8000ff8:	21d2      	movs	r1, #210	; 0xd2
 8000ffa:	0049      	lsls	r1, r1, #1
 8000ffc:	4288      	cmp	r0, r1
 8000ffe:	d938      	bls.n	8001072 <TIM14_IRQHandler+0x17a>
 8001000:	2100      	movs	r1, #0
 8001002:	6011      	str	r1, [r2, #0]
 8001004:	4e25      	ldr	r6, [pc, #148]	; (800109c <TIM14_IRQHandler+0x1a4>)
 8001006:	4a27      	ldr	r2, [pc, #156]	; (80010a4 <TIM14_IRQHandler+0x1ac>)
 8001008:	4c23      	ldr	r4, [pc, #140]	; (8001098 <TIM14_IRQHandler+0x1a0>)
 800100a:	7011      	strb	r1, [r2, #0]
 800100c:	6831      	ldr	r1, [r6, #0]
 800100e:	2201      	movs	r2, #1
 8001010:	701a      	strb	r2, [r3, #0]
 8001012:	4d28      	ldr	r5, [pc, #160]	; (80010b4 <TIM14_IRQHandler+0x1bc>)
 8001014:	2900      	cmp	r1, #0
 8001016:	d004      	beq.n	8001022 <TIM14_IRQHandler+0x12a>
 8001018:	6820      	ldr	r0, [r4, #0]
 800101a:	f001 f8d1 	bl	80021c0 <__aeabi_uidiv>
 800101e:	6028      	str	r0, [r5, #0]
 8001020:	e000      	b.n	8001024 <TIM14_IRQHandler+0x12c>
 8001022:	6029      	str	r1, [r5, #0]
 8001024:	2300      	movs	r3, #0
 8001026:	6023      	str	r3, [r4, #0]
 8001028:	6033      	str	r3, [r6, #0]
 800102a:	e022      	b.n	8001072 <TIM14_IRQHandler+0x17a>
 800102c:	2204      	movs	r2, #4
 800102e:	e01f      	b.n	8001070 <TIM14_IRQHandler+0x178>
 8001030:	4a1e      	ldr	r2, [pc, #120]	; (80010ac <TIM14_IRQHandler+0x1b4>)
 8001032:	2900      	cmp	r1, #0
 8001034:	d008      	beq.n	8001048 <TIM14_IRQHandler+0x150>
 8001036:	491c      	ldr	r1, [pc, #112]	; (80010a8 <TIM14_IRQHandler+0x1b0>)
 8001038:	2501      	movs	r5, #1
 800103a:	880c      	ldrh	r4, [r1, #0]
 800103c:	7810      	ldrb	r0, [r2, #0]
 800103e:	4085      	lsls	r5, r0
 8001040:	1c28      	adds	r0, r5, #0
 8001042:	4320      	orrs	r0, r4
 8001044:	b280      	uxth	r0, r0
 8001046:	8008      	strh	r0, [r1, #0]
 8001048:	7811      	ldrb	r1, [r2, #0]
 800104a:	3101      	adds	r1, #1
 800104c:	b2c9      	uxtb	r1, r1
 800104e:	7011      	strb	r1, [r2, #0]
 8001050:	7812      	ldrb	r2, [r2, #0]
 8001052:	2a07      	cmp	r2, #7
 8001054:	d90b      	bls.n	800106e <TIM14_IRQHandler+0x176>
 8001056:	4a13      	ldr	r2, [pc, #76]	; (80010a4 <TIM14_IRQHandler+0x1ac>)
 8001058:	4813      	ldr	r0, [pc, #76]	; (80010a8 <TIM14_IRQHandler+0x1b0>)
 800105a:	7811      	ldrb	r1, [r2, #0]
 800105c:	8804      	ldrh	r4, [r0, #0]
 800105e:	4816      	ldr	r0, [pc, #88]	; (80010b8 <TIM14_IRQHandler+0x1c0>)
 8001060:	5444      	strb	r4, [r0, r1]
 8001062:	7811      	ldrb	r1, [r2, #0]
 8001064:	3101      	adds	r1, #1
 8001066:	b2c9      	uxtb	r1, r1
 8001068:	7011      	strb	r1, [r2, #0]
 800106a:	2201      	movs	r2, #1
 800106c:	e000      	b.n	8001070 <TIM14_IRQHandler+0x178>
 800106e:	2203      	movs	r2, #3
 8001070:	701a      	strb	r2, [r3, #0]
 8001072:	4b12      	ldr	r3, [pc, #72]	; (80010bc <TIM14_IRQHandler+0x1c4>)
 8001074:	2200      	movs	r2, #0
 8001076:	821a      	strh	r2, [r3, #16]
 8001078:	bd70      	pop	{r4, r5, r6, pc}
 800107a:	46c0      	nop			; (mov r8, r8)
 800107c:	200003c7 	.word	0x200003c7
 8001080:	200003c6 	.word	0x200003c6
 8001084:	20000096 	.word	0x20000096
 8001088:	200003ce 	.word	0x200003ce
 800108c:	200003dc 	.word	0x200003dc
 8001090:	40012400 	.word	0x40012400
 8001094:	000003e7 	.word	0x000003e7
 8001098:	200003d8 	.word	0x200003d8
 800109c:	200003e0 	.word	0x200003e0
 80010a0:	200003cc 	.word	0x200003cc
 80010a4:	200003d0 	.word	0x200003d0
 80010a8:	200003c4 	.word	0x200003c4
 80010ac:	200003d1 	.word	0x200003d1
 80010b0:	200003d4 	.word	0x200003d4
 80010b4:	200003c8 	.word	0x200003c8
 80010b8:	20000088 	.word	0x20000088
 80010bc:	40002000 	.word	0x40002000

080010c0 <ir_packet_init>:
 80010c0:	2300      	movs	r3, #0
 80010c2:	8003      	strh	r3, [r0, #0]
 80010c4:	8043      	strh	r3, [r0, #2]
 80010c6:	7103      	strb	r3, [r0, #4]
 80010c8:	7143      	strb	r3, [r0, #5]
 80010ca:	7183      	strb	r3, [r0, #6]
 80010cc:	71c3      	strb	r3, [r0, #7]
 80010ce:	8183      	strh	r3, [r0, #12]
 80010d0:	4770      	bx	lr

080010d2 <ir_packet_crc>:
 80010d2:	1841      	adds	r1, r0, r1
 80010d4:	2300      	movs	r3, #0
 80010d6:	4288      	cmp	r0, r1
 80010d8:	d004      	beq.n	80010e4 <ir_packet_crc+0x12>
 80010da:	7802      	ldrb	r2, [r0, #0]
 80010dc:	3001      	adds	r0, #1
 80010de:	189b      	adds	r3, r3, r2
 80010e0:	b2db      	uxtb	r3, r3
 80010e2:	e7f8      	b.n	80010d6 <ir_packet_crc+0x4>
 80010e4:	b2d8      	uxtb	r0, r3
 80010e6:	4770      	bx	lr

080010e8 <ir_send_packet>:
 80010e8:	b538      	push	{r3, r4, r5, lr}
 80010ea:	1c04      	adds	r4, r0, #0
 80010ec:	f7ff fede 	bl	8000eac <ir_comm_get_tx_flag>
 80010f0:	2301      	movs	r3, #1
 80010f2:	2800      	cmp	r0, #0
 80010f4:	d11d      	bne.n	8001132 <ir_send_packet+0x4a>
 80010f6:	4b10      	ldr	r3, [pc, #64]	; (8001138 <ir_send_packet+0x50>)
 80010f8:	22ab      	movs	r2, #171	; 0xab
 80010fa:	701a      	strb	r2, [r3, #0]
 80010fc:	8822      	ldrh	r2, [r4, #0]
 80010fe:	1c1d      	adds	r5, r3, #0
 8001100:	0a12      	lsrs	r2, r2, #8
 8001102:	705a      	strb	r2, [r3, #1]
 8001104:	8822      	ldrh	r2, [r4, #0]
 8001106:	709a      	strb	r2, [r3, #2]
 8001108:	8862      	ldrh	r2, [r4, #2]
 800110a:	0a12      	lsrs	r2, r2, #8
 800110c:	70da      	strb	r2, [r3, #3]
 800110e:	8862      	ldrh	r2, [r4, #2]
 8001110:	711a      	strb	r2, [r3, #4]
 8001112:	1c02      	adds	r2, r0, #0
 8001114:	18a3      	adds	r3, r4, r2
 8001116:	7919      	ldrb	r1, [r3, #4]
 8001118:	18ab      	adds	r3, r5, r2
 800111a:	3201      	adds	r2, #1
 800111c:	7159      	strb	r1, [r3, #5]
 800111e:	2a08      	cmp	r2, #8
 8001120:	d1f8      	bne.n	8001114 <ir_send_packet+0x2c>
 8001122:	210d      	movs	r1, #13
 8001124:	1c28      	adds	r0, r5, #0
 8001126:	f7ff ffd4 	bl	80010d2 <ir_packet_crc>
 800112a:	7368      	strb	r0, [r5, #13]
 800112c:	f7ff feb2 	bl	8000e94 <ir_comm_start_tx>
 8001130:	2300      	movs	r3, #0
 8001132:	1c18      	adds	r0, r3, #0
 8001134:	bd38      	pop	{r3, r4, r5, pc}
 8001136:	46c0      	nop			; (mov r8, r8)
 8001138:	20000096 	.word	0x20000096

0800113c <ir_receive_packet>:
 800113c:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
 800113e:	1c04      	adds	r4, r0, #0
 8001140:	f7ff feca 	bl	8000ed8 <ir_comm_get_rx_flag>
 8001144:	2504      	movs	r5, #4
 8001146:	1e06      	subs	r6, r0, #0
 8001148:	d128      	bne.n	800119c <ir_receive_packet+0x60>
 800114a:	4d15      	ldr	r5, [pc, #84]	; (80011a0 <ir_receive_packet+0x64>)
 800114c:	210d      	movs	r1, #13
 800114e:	1c28      	adds	r0, r5, #0
 8001150:	f7ff ffbf 	bl	80010d2 <ir_packet_crc>
 8001154:	786b      	ldrb	r3, [r5, #1]
 8001156:	1c07      	adds	r7, r0, #0
 8001158:	021b      	lsls	r3, r3, #8
 800115a:	8023      	strh	r3, [r4, #0]
 800115c:	78aa      	ldrb	r2, [r5, #2]
 800115e:	4313      	orrs	r3, r2
 8001160:	8023      	strh	r3, [r4, #0]
 8001162:	78eb      	ldrb	r3, [r5, #3]
 8001164:	021b      	lsls	r3, r3, #8
 8001166:	8063      	strh	r3, [r4, #2]
 8001168:	792a      	ldrb	r2, [r5, #4]
 800116a:	4313      	orrs	r3, r2
 800116c:	8063      	strh	r3, [r4, #2]
 800116e:	1c33      	adds	r3, r6, #0
 8001170:	1c2e      	adds	r6, r5, #0
 8001172:	18f2      	adds	r2, r6, r3
 8001174:	7951      	ldrb	r1, [r2, #5]
 8001176:	18e2      	adds	r2, r4, r3
 8001178:	3301      	adds	r3, #1
 800117a:	7111      	strb	r1, [r2, #4]
 800117c:	2b08      	cmp	r3, #8
 800117e:	d1f8      	bne.n	8001172 <ir_receive_packet+0x36>
 8001180:	f7ff feb4 	bl	8000eec <ir_comm_received_signal_strength>
 8001184:	81a0      	strh	r0, [r4, #12]
 8001186:	7833      	ldrb	r3, [r6, #0]
 8001188:	2501      	movs	r5, #1
 800118a:	2bab      	cmp	r3, #171	; 0xab
 800118c:	d104      	bne.n	8001198 <ir_receive_packet+0x5c>
 800118e:	7b75      	ldrb	r5, [r6, #13]
 8001190:	1bef      	subs	r7, r5, r7
 8001192:	1e7d      	subs	r5, r7, #1
 8001194:	41af      	sbcs	r7, r5
 8001196:	007d      	lsls	r5, r7, #1
 8001198:	f7ff fe92 	bl	8000ec0 <ir_comm_start_rx>
 800119c:	1c28      	adds	r0, r5, #0
 800119e:	bdf8      	pop	{r3, r4, r5, r6, r7, pc}
 80011a0:	20000088 	.word	0x20000088

080011a4 <GPIO_Init>:
 80011a4:	2390      	movs	r3, #144	; 0x90
 80011a6:	b5f7      	push	{r0, r1, r2, r4, r5, r6, r7, lr}
 80011a8:	05db      	lsls	r3, r3, #23
 80011aa:	1c04      	adds	r4, r0, #0
 80011ac:	1c0d      	adds	r5, r1, #0
 80011ae:	4298      	cmp	r0, r3
 80011b0:	d010      	beq.n	80011d4 <GPIO_Init+0x30>
 80011b2:	4b39      	ldr	r3, [pc, #228]	; (8001298 <GPIO_Init+0xf4>)
 80011b4:	4298      	cmp	r0, r3
 80011b6:	d00d      	beq.n	80011d4 <GPIO_Init+0x30>
 80011b8:	4b38      	ldr	r3, [pc, #224]	; (800129c <GPIO_Init+0xf8>)
 80011ba:	4298      	cmp	r0, r3
 80011bc:	d00a      	beq.n	80011d4 <GPIO_Init+0x30>
 80011be:	4b38      	ldr	r3, [pc, #224]	; (80012a0 <GPIO_Init+0xfc>)
 80011c0:	4298      	cmp	r0, r3
 80011c2:	d007      	beq.n	80011d4 <GPIO_Init+0x30>
 80011c4:	4b37      	ldr	r3, [pc, #220]	; (80012a4 <GPIO_Init+0x100>)
 80011c6:	4298      	cmp	r0, r3
 80011c8:	d004      	beq.n	80011d4 <GPIO_Init+0x30>
 80011ca:	4a37      	ldr	r2, [pc, #220]	; (80012a8 <GPIO_Init+0x104>)
 80011cc:	1880      	adds	r0, r0, r2
 80011ce:	4243      	negs	r3, r0
 80011d0:	4158      	adcs	r0, r3
 80011d2:	e000      	b.n	80011d6 <GPIO_Init+0x32>
 80011d4:	2001      	movs	r0, #1
 80011d6:	f7ff fd11 	bl	8000bfc <assert_param>
 80011da:	6828      	ldr	r0, [r5, #0]
 80011dc:	2600      	movs	r6, #0
 80011de:	1e43      	subs	r3, r0, #1
 80011e0:	4198      	sbcs	r0, r3
 80011e2:	f7ff fd0b 	bl	8000bfc <assert_param>
 80011e6:	792b      	ldrb	r3, [r5, #4]
 80011e8:	2203      	movs	r2, #3
 80011ea:	1c30      	adds	r0, r6, #0
 80011ec:	429a      	cmp	r2, r3
 80011ee:	4170      	adcs	r0, r6
 80011f0:	f7ff fd04 	bl	8000bfc <assert_param>
 80011f4:	79eb      	ldrb	r3, [r5, #7]
 80011f6:	2202      	movs	r2, #2
 80011f8:	1c30      	adds	r0, r6, #0
 80011fa:	429a      	cmp	r2, r3
 80011fc:	4170      	adcs	r0, r6
 80011fe:	f7ff fcfd 	bl	8000bfc <assert_param>
 8001202:	2001      	movs	r0, #1
 8001204:	1c03      	adds	r3, r0, #0
 8001206:	682a      	ldr	r2, [r5, #0]
 8001208:	40b3      	lsls	r3, r6
 800120a:	401a      	ands	r2, r3
 800120c:	9201      	str	r2, [sp, #4]
 800120e:	429a      	cmp	r2, r3
 8001210:	d13d      	bne.n	800128e <GPIO_Init+0xea>
 8001212:	792b      	ldrb	r3, [r5, #4]
 8001214:	0077      	lsls	r7, r6, #1
 8001216:	3b01      	subs	r3, #1
 8001218:	b2db      	uxtb	r3, r3
 800121a:	4283      	cmp	r3, r0
 800121c:	d823      	bhi.n	8001266 <GPIO_Init+0xc2>
 800121e:	796b      	ldrb	r3, [r5, #5]
 8001220:	4283      	cmp	r3, r0
 8001222:	d902      	bls.n	800122a <GPIO_Init+0x86>
 8001224:	1ed8      	subs	r0, r3, #3
 8001226:	4243      	negs	r3, r0
 8001228:	4158      	adcs	r0, r3
 800122a:	f7ff fce7 	bl	8000bfc <assert_param>
 800122e:	68a3      	ldr	r3, [r4, #8]
 8001230:	2203      	movs	r2, #3
 8001232:	40ba      	lsls	r2, r7
 8001234:	4393      	bics	r3, r2
 8001236:	60a3      	str	r3, [r4, #8]
 8001238:	796b      	ldrb	r3, [r5, #5]
 800123a:	68a2      	ldr	r2, [r4, #8]
 800123c:	40bb      	lsls	r3, r7
 800123e:	4313      	orrs	r3, r2
 8001240:	60a3      	str	r3, [r4, #8]
 8001242:	79ab      	ldrb	r3, [r5, #6]
 8001244:	2201      	movs	r2, #1
 8001246:	2000      	movs	r0, #0
 8001248:	429a      	cmp	r2, r3
 800124a:	4140      	adcs	r0, r0
 800124c:	f7ff fcd6 	bl	8000bfc <assert_param>
 8001250:	6863      	ldr	r3, [r4, #4]
 8001252:	9a01      	ldr	r2, [sp, #4]
 8001254:	b29b      	uxth	r3, r3
 8001256:	4393      	bics	r3, r2
 8001258:	80a3      	strh	r3, [r4, #4]
 800125a:	79ab      	ldrb	r3, [r5, #6]
 800125c:	6862      	ldr	r2, [r4, #4]
 800125e:	40b3      	lsls	r3, r6
 8001260:	4313      	orrs	r3, r2
 8001262:	b29b      	uxth	r3, r3
 8001264:	80a3      	strh	r3, [r4, #4]
 8001266:	2303      	movs	r3, #3
 8001268:	6822      	ldr	r2, [r4, #0]
 800126a:	40bb      	lsls	r3, r7
 800126c:	43db      	mvns	r3, r3
 800126e:	401a      	ands	r2, r3
 8001270:	6022      	str	r2, [r4, #0]
 8001272:	792a      	ldrb	r2, [r5, #4]
 8001274:	6821      	ldr	r1, [r4, #0]
 8001276:	40ba      	lsls	r2, r7
 8001278:	430a      	orrs	r2, r1
 800127a:	6022      	str	r2, [r4, #0]
 800127c:	68e2      	ldr	r2, [r4, #12]
 800127e:	4013      	ands	r3, r2
 8001280:	79ea      	ldrb	r2, [r5, #7]
 8001282:	60e3      	str	r3, [r4, #12]
 8001284:	68e3      	ldr	r3, [r4, #12]
 8001286:	40ba      	lsls	r2, r7
 8001288:	1c17      	adds	r7, r2, #0
 800128a:	431f      	orrs	r7, r3
 800128c:	60e7      	str	r7, [r4, #12]
 800128e:	3601      	adds	r6, #1
 8001290:	2e10      	cmp	r6, #16
 8001292:	d1b6      	bne.n	8001202 <GPIO_Init+0x5e>
 8001294:	bdf7      	pop	{r0, r1, r2, r4, r5, r6, r7, pc}
 8001296:	46c0      	nop			; (mov r8, r8)
 8001298:	48000400 	.word	0x48000400
 800129c:	48000800 	.word	0x48000800
 80012a0:	48000c00 	.word	0x48000c00
 80012a4:	48001000 	.word	0x48001000
 80012a8:	b7ffec00 	.word	0xb7ffec00

080012ac <GPIO_PinAFConfig>:
 80012ac:	b5f7      	push	{r0, r1, r2, r4, r5, r6, r7, lr}
 80012ae:	2390      	movs	r3, #144	; 0x90
 80012b0:	1c04      	adds	r4, r0, #0
 80012b2:	1c0e      	adds	r6, r1, #0
 80012b4:	9201      	str	r2, [sp, #4]
 80012b6:	05db      	lsls	r3, r3, #23
 80012b8:	4298      	cmp	r0, r3
 80012ba:	d010      	beq.n	80012de <GPIO_PinAFConfig+0x32>
 80012bc:	4b19      	ldr	r3, [pc, #100]	; (8001324 <GPIO_PinAFConfig+0x78>)
 80012be:	4298      	cmp	r0, r3
 80012c0:	d00d      	beq.n	80012de <GPIO_PinAFConfig+0x32>
 80012c2:	4b19      	ldr	r3, [pc, #100]	; (8001328 <GPIO_PinAFConfig+0x7c>)
 80012c4:	4298      	cmp	r0, r3
 80012c6:	d00a      	beq.n	80012de <GPIO_PinAFConfig+0x32>
 80012c8:	4b18      	ldr	r3, [pc, #96]	; (800132c <GPIO_PinAFConfig+0x80>)
 80012ca:	4298      	cmp	r0, r3
 80012cc:	d007      	beq.n	80012de <GPIO_PinAFConfig+0x32>
 80012ce:	4b18      	ldr	r3, [pc, #96]	; (8001330 <GPIO_PinAFConfig+0x84>)
 80012d0:	4298      	cmp	r0, r3
 80012d2:	d004      	beq.n	80012de <GPIO_PinAFConfig+0x32>
 80012d4:	4a17      	ldr	r2, [pc, #92]	; (8001334 <GPIO_PinAFConfig+0x88>)
 80012d6:	1880      	adds	r0, r0, r2
 80012d8:	4243      	negs	r3, r0
 80012da:	4158      	adcs	r0, r3
 80012dc:	e000      	b.n	80012e0 <GPIO_PinAFConfig+0x34>
 80012de:	2001      	movs	r0, #1
 80012e0:	2500      	movs	r5, #0
 80012e2:	f7ff fc8b 	bl	8000bfc <assert_param>
 80012e6:	230f      	movs	r3, #15
 80012e8:	1c28      	adds	r0, r5, #0
 80012ea:	42b3      	cmp	r3, r6
 80012ec:	4168      	adcs	r0, r5
 80012ee:	f7ff fc85 	bl	8000bfc <assert_param>
 80012f2:	9a01      	ldr	r2, [sp, #4]
 80012f4:	1c28      	adds	r0, r5, #0
 80012f6:	2707      	movs	r7, #7
 80012f8:	4297      	cmp	r7, r2
 80012fa:	4168      	adcs	r0, r5
 80012fc:	4037      	ands	r7, r6
 80012fe:	08f6      	lsrs	r6, r6, #3
 8001300:	00b6      	lsls	r6, r6, #2
 8001302:	19a4      	adds	r4, r4, r6
 8001304:	f7ff fc7a 	bl	8000bfc <assert_param>
 8001308:	00bf      	lsls	r7, r7, #2
 800130a:	6a23      	ldr	r3, [r4, #32]
 800130c:	220f      	movs	r2, #15
 800130e:	40ba      	lsls	r2, r7
 8001310:	4393      	bics	r3, r2
 8001312:	9a01      	ldr	r2, [sp, #4]
 8001314:	6223      	str	r3, [r4, #32]
 8001316:	6a23      	ldr	r3, [r4, #32]
 8001318:	40ba      	lsls	r2, r7
 800131a:	1c17      	adds	r7, r2, #0
 800131c:	431f      	orrs	r7, r3
 800131e:	6227      	str	r7, [r4, #32]
 8001320:	bdf7      	pop	{r0, r1, r2, r4, r5, r6, r7, pc}
 8001322:	46c0      	nop			; (mov r8, r8)
 8001324:	48000400 	.word	0x48000400
 8001328:	48000800 	.word	0x48000800
 800132c:	48000c00 	.word	0x48000c00
 8001330:	48001000 	.word	0x48001000
 8001334:	b7ffec00 	.word	0xb7ffec00

08001338 <TIM_TimeBaseInit>:
 8001338:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
 800133a:	4e34      	ldr	r6, [pc, #208]	; (800140c <TIM_TimeBaseInit+0xd4>)
 800133c:	1c04      	adds	r4, r0, #0
 800133e:	1c0d      	adds	r5, r1, #0
 8001340:	4f33      	ldr	r7, [pc, #204]	; (8001410 <TIM_TimeBaseInit+0xd8>)
 8001342:	42b0      	cmp	r0, r6
 8001344:	d019      	beq.n	800137a <TIM_TimeBaseInit+0x42>
 8001346:	2380      	movs	r3, #128	; 0x80
 8001348:	05db      	lsls	r3, r3, #23
 800134a:	4298      	cmp	r0, r3
 800134c:	d015      	beq.n	800137a <TIM_TimeBaseInit+0x42>
 800134e:	4b31      	ldr	r3, [pc, #196]	; (8001414 <TIM_TimeBaseInit+0xdc>)
 8001350:	4298      	cmp	r0, r3
 8001352:	d012      	beq.n	800137a <TIM_TimeBaseInit+0x42>
 8001354:	42b8      	cmp	r0, r7
 8001356:	d010      	beq.n	800137a <TIM_TimeBaseInit+0x42>
 8001358:	4b2f      	ldr	r3, [pc, #188]	; (8001418 <TIM_TimeBaseInit+0xe0>)
 800135a:	4298      	cmp	r0, r3
 800135c:	d00d      	beq.n	800137a <TIM_TimeBaseInit+0x42>
 800135e:	4b2f      	ldr	r3, [pc, #188]	; (800141c <TIM_TimeBaseInit+0xe4>)
 8001360:	4298      	cmp	r0, r3
 8001362:	d00a      	beq.n	800137a <TIM_TimeBaseInit+0x42>
 8001364:	4b2e      	ldr	r3, [pc, #184]	; (8001420 <TIM_TimeBaseInit+0xe8>)
 8001366:	4298      	cmp	r0, r3
 8001368:	d007      	beq.n	800137a <TIM_TimeBaseInit+0x42>
 800136a:	4b2e      	ldr	r3, [pc, #184]	; (8001424 <TIM_TimeBaseInit+0xec>)
 800136c:	4298      	cmp	r0, r3
 800136e:	d004      	beq.n	800137a <TIM_TimeBaseInit+0x42>
 8001370:	492d      	ldr	r1, [pc, #180]	; (8001428 <TIM_TimeBaseInit+0xf0>)
 8001372:	1840      	adds	r0, r0, r1
 8001374:	4243      	negs	r3, r0
 8001376:	4158      	adcs	r0, r3
 8001378:	e000      	b.n	800137c <TIM_TimeBaseInit+0x44>
 800137a:	2001      	movs	r0, #1
 800137c:	f7ff fc3e 	bl	8000bfc <assert_param>
 8001380:	886b      	ldrh	r3, [r5, #2]
 8001382:	2210      	movs	r2, #16
 8001384:	1c19      	adds	r1, r3, #0
 8001386:	4391      	bics	r1, r2
 8001388:	d101      	bne.n	800138e <TIM_TimeBaseInit+0x56>
 800138a:	2001      	movs	r0, #1
 800138c:	e007      	b.n	800139e <TIM_TimeBaseInit+0x66>
 800138e:	2240      	movs	r2, #64	; 0x40
 8001390:	1c19      	adds	r1, r3, #0
 8001392:	4391      	bics	r1, r2
 8001394:	2920      	cmp	r1, #32
 8001396:	d0f8      	beq.n	800138a <TIM_TimeBaseInit+0x52>
 8001398:	2b40      	cmp	r3, #64	; 0x40
 800139a:	d0f6      	beq.n	800138a <TIM_TimeBaseInit+0x52>
 800139c:	2000      	movs	r0, #0
 800139e:	f7ff fc2d 	bl	8000bfc <assert_param>
 80013a2:	892b      	ldrh	r3, [r5, #8]
 80013a4:	4a21      	ldr	r2, [pc, #132]	; (800142c <TIM_TimeBaseInit+0xf4>)
 80013a6:	2001      	movs	r0, #1
 80013a8:	4213      	tst	r3, r2
 80013aa:	d003      	beq.n	80013b4 <TIM_TimeBaseInit+0x7c>
 80013ac:	4a20      	ldr	r2, [pc, #128]	; (8001430 <TIM_TimeBaseInit+0xf8>)
 80013ae:	1898      	adds	r0, r3, r2
 80013b0:	4243      	negs	r3, r0
 80013b2:	4158      	adcs	r0, r3
 80013b4:	f7ff fc22 	bl	8000bfc <assert_param>
 80013b8:	6823      	ldr	r3, [r4, #0]
 80013ba:	b29b      	uxth	r3, r3
 80013bc:	42b4      	cmp	r4, r6
 80013be:	d006      	beq.n	80013ce <TIM_TimeBaseInit+0x96>
 80013c0:	2280      	movs	r2, #128	; 0x80
 80013c2:	05d2      	lsls	r2, r2, #23
 80013c4:	4294      	cmp	r4, r2
 80013c6:	d002      	beq.n	80013ce <TIM_TimeBaseInit+0x96>
 80013c8:	4a12      	ldr	r2, [pc, #72]	; (8001414 <TIM_TimeBaseInit+0xdc>)
 80013ca:	4294      	cmp	r4, r2
 80013cc:	d103      	bne.n	80013d6 <TIM_TimeBaseInit+0x9e>
 80013ce:	2270      	movs	r2, #112	; 0x70
 80013d0:	4393      	bics	r3, r2
 80013d2:	886a      	ldrh	r2, [r5, #2]
 80013d4:	4313      	orrs	r3, r2
 80013d6:	42bc      	cmp	r4, r7
 80013d8:	d003      	beq.n	80013e2 <TIM_TimeBaseInit+0xaa>
 80013da:	4916      	ldr	r1, [pc, #88]	; (8001434 <TIM_TimeBaseInit+0xfc>)
 80013dc:	892a      	ldrh	r2, [r5, #8]
 80013de:	400b      	ands	r3, r1
 80013e0:	4313      	orrs	r3, r2
 80013e2:	8023      	strh	r3, [r4, #0]
 80013e4:	686b      	ldr	r3, [r5, #4]
 80013e6:	62e3      	str	r3, [r4, #44]	; 0x2c
 80013e8:	882b      	ldrh	r3, [r5, #0]
 80013ea:	8523      	strh	r3, [r4, #40]	; 0x28
 80013ec:	42b4      	cmp	r4, r6
 80013ee:	d008      	beq.n	8001402 <TIM_TimeBaseInit+0xca>
 80013f0:	4b0b      	ldr	r3, [pc, #44]	; (8001420 <TIM_TimeBaseInit+0xe8>)
 80013f2:	429c      	cmp	r4, r3
 80013f4:	d005      	beq.n	8001402 <TIM_TimeBaseInit+0xca>
 80013f6:	4b0b      	ldr	r3, [pc, #44]	; (8001424 <TIM_TimeBaseInit+0xec>)
 80013f8:	429c      	cmp	r4, r3
 80013fa:	d002      	beq.n	8001402 <TIM_TimeBaseInit+0xca>
 80013fc:	4b0e      	ldr	r3, [pc, #56]	; (8001438 <TIM_TimeBaseInit+0x100>)
 80013fe:	429c      	cmp	r4, r3
 8001400:	d101      	bne.n	8001406 <TIM_TimeBaseInit+0xce>
 8001402:	7aab      	ldrb	r3, [r5, #10]
 8001404:	8623      	strh	r3, [r4, #48]	; 0x30
 8001406:	2301      	movs	r3, #1
 8001408:	82a3      	strh	r3, [r4, #20]
 800140a:	bdf8      	pop	{r3, r4, r5, r6, r7, pc}
 800140c:	40012c00 	.word	0x40012c00
 8001410:	40001000 	.word	0x40001000
 8001414:	40000400 	.word	0x40000400
 8001418:	40001400 	.word	0x40001400
 800141c:	40002000 	.word	0x40002000
 8001420:	40014000 	.word	0x40014000
 8001424:	40014400 	.word	0x40014400
 8001428:	bffeb800 	.word	0xbffeb800
 800142c:	fffffeff 	.word	0xfffffeff
 8001430:	fffffe00 	.word	0xfffffe00
 8001434:	fffffcff 	.word	0xfffffcff
 8001438:	40014800 	.word	0x40014800

0800143c <TIM_Cmd>:
 800143c:	4b19      	ldr	r3, [pc, #100]	; (80014a4 <TIM_Cmd+0x68>)
 800143e:	b570      	push	{r4, r5, r6, lr}
 8001440:	1c04      	adds	r4, r0, #0
 8001442:	1c0e      	adds	r6, r1, #0
 8001444:	4298      	cmp	r0, r3
 8001446:	d01a      	beq.n	800147e <TIM_Cmd+0x42>
 8001448:	2380      	movs	r3, #128	; 0x80
 800144a:	05db      	lsls	r3, r3, #23
 800144c:	4298      	cmp	r0, r3
 800144e:	d016      	beq.n	800147e <TIM_Cmd+0x42>
 8001450:	4b15      	ldr	r3, [pc, #84]	; (80014a8 <TIM_Cmd+0x6c>)
 8001452:	4298      	cmp	r0, r3
 8001454:	d013      	beq.n	800147e <TIM_Cmd+0x42>
 8001456:	4b15      	ldr	r3, [pc, #84]	; (80014ac <TIM_Cmd+0x70>)
 8001458:	4298      	cmp	r0, r3
 800145a:	d010      	beq.n	800147e <TIM_Cmd+0x42>
 800145c:	4b14      	ldr	r3, [pc, #80]	; (80014b0 <TIM_Cmd+0x74>)
 800145e:	4298      	cmp	r0, r3
 8001460:	d00d      	beq.n	800147e <TIM_Cmd+0x42>
 8001462:	4b14      	ldr	r3, [pc, #80]	; (80014b4 <TIM_Cmd+0x78>)
 8001464:	4298      	cmp	r0, r3
 8001466:	d00a      	beq.n	800147e <TIM_Cmd+0x42>
 8001468:	4b13      	ldr	r3, [pc, #76]	; (80014b8 <TIM_Cmd+0x7c>)
 800146a:	4298      	cmp	r0, r3
 800146c:	d007      	beq.n	800147e <TIM_Cmd+0x42>
 800146e:	4b13      	ldr	r3, [pc, #76]	; (80014bc <TIM_Cmd+0x80>)
 8001470:	4298      	cmp	r0, r3
 8001472:	d004      	beq.n	800147e <TIM_Cmd+0x42>
 8001474:	4b12      	ldr	r3, [pc, #72]	; (80014c0 <TIM_Cmd+0x84>)
 8001476:	18c0      	adds	r0, r0, r3
 8001478:	4243      	negs	r3, r0
 800147a:	4158      	adcs	r0, r3
 800147c:	e000      	b.n	8001480 <TIM_Cmd+0x44>
 800147e:	2001      	movs	r0, #1
 8001480:	f7ff fbbc 	bl	8000bfc <assert_param>
 8001484:	2501      	movs	r5, #1
 8001486:	2000      	movs	r0, #0
 8001488:	42b5      	cmp	r5, r6
 800148a:	4140      	adcs	r0, r0
 800148c:	f7ff fbb6 	bl	8000bfc <assert_param>
 8001490:	6823      	ldr	r3, [r4, #0]
 8001492:	b29b      	uxth	r3, r3
 8001494:	2e00      	cmp	r6, #0
 8001496:	d002      	beq.n	800149e <TIM_Cmd+0x62>
 8001498:	431d      	orrs	r5, r3
 800149a:	8025      	strh	r5, [r4, #0]
 800149c:	e001      	b.n	80014a2 <TIM_Cmd+0x66>
 800149e:	43ab      	bics	r3, r5
 80014a0:	8023      	strh	r3, [r4, #0]
 80014a2:	bd70      	pop	{r4, r5, r6, pc}
 80014a4:	40012c00 	.word	0x40012c00
 80014a8:	40000400 	.word	0x40000400
 80014ac:	40001000 	.word	0x40001000
 80014b0:	40001400 	.word	0x40001400
 80014b4:	40002000 	.word	0x40002000
 80014b8:	40014000 	.word	0x40014000
 80014bc:	40014400 	.word	0x40014400
 80014c0:	bffeb800 	.word	0xbffeb800

080014c4 <TIM_ITConfig>:
 80014c4:	4b1f      	ldr	r3, [pc, #124]	; (8001544 <TIM_ITConfig+0x80>)
 80014c6:	b570      	push	{r4, r5, r6, lr}
 80014c8:	1c04      	adds	r4, r0, #0
 80014ca:	1c0d      	adds	r5, r1, #0
 80014cc:	1c16      	adds	r6, r2, #0
 80014ce:	4298      	cmp	r0, r3
 80014d0:	d01a      	beq.n	8001508 <TIM_ITConfig+0x44>
 80014d2:	2380      	movs	r3, #128	; 0x80
 80014d4:	05db      	lsls	r3, r3, #23
 80014d6:	4298      	cmp	r0, r3
 80014d8:	d016      	beq.n	8001508 <TIM_ITConfig+0x44>
 80014da:	4b1b      	ldr	r3, [pc, #108]	; (8001548 <TIM_ITConfig+0x84>)
 80014dc:	4298      	cmp	r0, r3
 80014de:	d013      	beq.n	8001508 <TIM_ITConfig+0x44>
 80014e0:	4b1a      	ldr	r3, [pc, #104]	; (800154c <TIM_ITConfig+0x88>)
 80014e2:	4298      	cmp	r0, r3
 80014e4:	d010      	beq.n	8001508 <TIM_ITConfig+0x44>
 80014e6:	4b1a      	ldr	r3, [pc, #104]	; (8001550 <TIM_ITConfig+0x8c>)
 80014e8:	4298      	cmp	r0, r3
 80014ea:	d00d      	beq.n	8001508 <TIM_ITConfig+0x44>
 80014ec:	4b19      	ldr	r3, [pc, #100]	; (8001554 <TIM_ITConfig+0x90>)
 80014ee:	4298      	cmp	r0, r3
 80014f0:	d00a      	beq.n	8001508 <TIM_ITConfig+0x44>
 80014f2:	4b19      	ldr	r3, [pc, #100]	; (8001558 <TIM_ITConfig+0x94>)
 80014f4:	4298      	cmp	r0, r3
 80014f6:	d007      	beq.n	8001508 <TIM_ITConfig+0x44>
 80014f8:	4b18      	ldr	r3, [pc, #96]	; (800155c <TIM_ITConfig+0x98>)
 80014fa:	4298      	cmp	r0, r3
 80014fc:	d004      	beq.n	8001508 <TIM_ITConfig+0x44>
 80014fe:	4a18      	ldr	r2, [pc, #96]	; (8001560 <TIM_ITConfig+0x9c>)
 8001500:	1880      	adds	r0, r0, r2
 8001502:	4243      	negs	r3, r0
 8001504:	4158      	adcs	r0, r3
 8001506:	e000      	b.n	800150a <TIM_ITConfig+0x46>
 8001508:	2001      	movs	r0, #1
 800150a:	f7ff fb77 	bl	8000bfc <assert_param>
 800150e:	23ff      	movs	r3, #255	; 0xff
 8001510:	1c2a      	adds	r2, r5, #0
 8001512:	2000      	movs	r0, #0
 8001514:	439a      	bics	r2, r3
 8001516:	4282      	cmp	r2, r0
 8001518:	d102      	bne.n	8001520 <TIM_ITConfig+0x5c>
 800151a:	1c28      	adds	r0, r5, #0
 800151c:	1e43      	subs	r3, r0, #1
 800151e:	4198      	sbcs	r0, r3
 8001520:	f7ff fb6c 	bl	8000bfc <assert_param>
 8001524:	2301      	movs	r3, #1
 8001526:	2000      	movs	r0, #0
 8001528:	42b3      	cmp	r3, r6
 800152a:	4140      	adcs	r0, r0
 800152c:	f7ff fb66 	bl	8000bfc <assert_param>
 8001530:	68e3      	ldr	r3, [r4, #12]
 8001532:	b29b      	uxth	r3, r3
 8001534:	2e00      	cmp	r6, #0
 8001536:	d002      	beq.n	800153e <TIM_ITConfig+0x7a>
 8001538:	431d      	orrs	r5, r3
 800153a:	81a5      	strh	r5, [r4, #12]
 800153c:	e001      	b.n	8001542 <TIM_ITConfig+0x7e>
 800153e:	43ab      	bics	r3, r5
 8001540:	81a3      	strh	r3, [r4, #12]
 8001542:	bd70      	pop	{r4, r5, r6, pc}
 8001544:	40012c00 	.word	0x40012c00
 8001548:	40000400 	.word	0x40000400
 800154c:	40001000 	.word	0x40001000
 8001550:	40001400 	.word	0x40001400
 8001554:	40002000 	.word	0x40002000
 8001558:	40014000 	.word	0x40014000
 800155c:	40014400 	.word	0x40014400
 8001560:	bffeb800 	.word	0xbffeb800

08001564 <USART_Init>:
 8001564:	b5f0      	push	{r4, r5, r6, r7, lr}
 8001566:	4e53      	ldr	r6, [pc, #332]	; (80016b4 <USART_Init+0x150>)
 8001568:	b08b      	sub	sp, #44	; 0x2c
 800156a:	1c04      	adds	r4, r0, #0
 800156c:	1c0d      	adds	r5, r1, #0
 800156e:	42b0      	cmp	r0, r6
 8001570:	d016      	beq.n	80015a0 <USART_Init+0x3c>
 8001572:	4b51      	ldr	r3, [pc, #324]	; (80016b8 <USART_Init+0x154>)
 8001574:	4298      	cmp	r0, r3
 8001576:	d013      	beq.n	80015a0 <USART_Init+0x3c>
 8001578:	4b50      	ldr	r3, [pc, #320]	; (80016bc <USART_Init+0x158>)
 800157a:	4298      	cmp	r0, r3
 800157c:	d010      	beq.n	80015a0 <USART_Init+0x3c>
 800157e:	4b50      	ldr	r3, [pc, #320]	; (80016c0 <USART_Init+0x15c>)
 8001580:	4298      	cmp	r0, r3
 8001582:	d00d      	beq.n	80015a0 <USART_Init+0x3c>
 8001584:	4b4f      	ldr	r3, [pc, #316]	; (80016c4 <USART_Init+0x160>)
 8001586:	4298      	cmp	r0, r3
 8001588:	d00a      	beq.n	80015a0 <USART_Init+0x3c>
 800158a:	4b4f      	ldr	r3, [pc, #316]	; (80016c8 <USART_Init+0x164>)
 800158c:	4298      	cmp	r0, r3
 800158e:	d007      	beq.n	80015a0 <USART_Init+0x3c>
 8001590:	4b4e      	ldr	r3, [pc, #312]	; (80016cc <USART_Init+0x168>)
 8001592:	4298      	cmp	r0, r3
 8001594:	d004      	beq.n	80015a0 <USART_Init+0x3c>
 8001596:	494e      	ldr	r1, [pc, #312]	; (80016d0 <USART_Init+0x16c>)
 8001598:	1840      	adds	r0, r0, r1
 800159a:	4243      	negs	r3, r0
 800159c:	4158      	adcs	r0, r3
 800159e:	e000      	b.n	80015a2 <USART_Init+0x3e>
 80015a0:	2001      	movs	r0, #1
 80015a2:	f7ff fb2b 	bl	8000bfc <assert_param>
 80015a6:	682b      	ldr	r3, [r5, #0]
 80015a8:	4a4a      	ldr	r2, [pc, #296]	; (80016d4 <USART_Init+0x170>)
 80015aa:	3b01      	subs	r3, #1
 80015ac:	2000      	movs	r0, #0
 80015ae:	429a      	cmp	r2, r3
 80015b0:	4140      	adcs	r0, r0
 80015b2:	f7ff fb23 	bl	8000bfc <assert_param>
 80015b6:	686b      	ldr	r3, [r5, #4]
 80015b8:	4a47      	ldr	r2, [pc, #284]	; (80016d8 <USART_Init+0x174>)
 80015ba:	2001      	movs	r0, #1
 80015bc:	4213      	tst	r3, r2
 80015be:	d003      	beq.n	80015c8 <USART_Init+0x64>
 80015c0:	4a46      	ldr	r2, [pc, #280]	; (80016dc <USART_Init+0x178>)
 80015c2:	1898      	adds	r0, r3, r2
 80015c4:	4243      	negs	r3, r0
 80015c6:	4158      	adcs	r0, r3
 80015c8:	f7ff fb18 	bl	8000bfc <assert_param>
 80015cc:	68ab      	ldr	r3, [r5, #8]
 80015ce:	4a44      	ldr	r2, [pc, #272]	; (80016e0 <USART_Init+0x17c>)
 80015d0:	2001      	movs	r0, #1
 80015d2:	4213      	tst	r3, r2
 80015d4:	d003      	beq.n	80015de <USART_Init+0x7a>
 80015d6:	4943      	ldr	r1, [pc, #268]	; (80016e4 <USART_Init+0x180>)
 80015d8:	1858      	adds	r0, r3, r1
 80015da:	4243      	negs	r3, r0
 80015dc:	4158      	adcs	r0, r3
 80015de:	f7ff fb0d 	bl	8000bfc <assert_param>
 80015e2:	68eb      	ldr	r3, [r5, #12]
 80015e4:	4a40      	ldr	r2, [pc, #256]	; (80016e8 <USART_Init+0x184>)
 80015e6:	2001      	movs	r0, #1
 80015e8:	4213      	tst	r3, r2
 80015ea:	d003      	beq.n	80015f4 <USART_Init+0x90>
 80015ec:	4a3f      	ldr	r2, [pc, #252]	; (80016ec <USART_Init+0x188>)
 80015ee:	1898      	adds	r0, r3, r2
 80015f0:	4243      	negs	r3, r0
 80015f2:	4158      	adcs	r0, r3
 80015f4:	f7ff fb02 	bl	8000bfc <assert_param>
 80015f8:	692b      	ldr	r3, [r5, #16]
 80015fa:	220c      	movs	r2, #12
 80015fc:	1c19      	adds	r1, r3, #0
 80015fe:	2000      	movs	r0, #0
 8001600:	4391      	bics	r1, r2
 8001602:	4281      	cmp	r1, r0
 8001604:	d102      	bne.n	800160c <USART_Init+0xa8>
 8001606:	1c18      	adds	r0, r3, #0
 8001608:	1e43      	subs	r3, r0, #1
 800160a:	4198      	sbcs	r0, r3
 800160c:	f7ff faf6 	bl	8000bfc <assert_param>
 8001610:	4f37      	ldr	r7, [pc, #220]	; (80016f0 <USART_Init+0x18c>)
 8001612:	6968      	ldr	r0, [r5, #20]
 8001614:	4038      	ands	r0, r7
 8001616:	4243      	negs	r3, r0
 8001618:	4158      	adcs	r0, r3
 800161a:	f7ff faef 	bl	8000bfc <assert_param>
 800161e:	6823      	ldr	r3, [r4, #0]
 8001620:	2201      	movs	r2, #1
 8001622:	4393      	bics	r3, r2
 8001624:	6023      	str	r3, [r4, #0]
 8001626:	6862      	ldr	r2, [r4, #4]
 8001628:	4b32      	ldr	r3, [pc, #200]	; (80016f4 <USART_Init+0x190>)
 800162a:	6869      	ldr	r1, [r5, #4]
 800162c:	4013      	ands	r3, r2
 800162e:	68aa      	ldr	r2, [r5, #8]
 8001630:	4668      	mov	r0, sp
 8001632:	4313      	orrs	r3, r2
 8001634:	6063      	str	r3, [r4, #4]
 8001636:	6822      	ldr	r2, [r4, #0]
 8001638:	4b2f      	ldr	r3, [pc, #188]	; (80016f8 <USART_Init+0x194>)
 800163a:	401a      	ands	r2, r3
 800163c:	68eb      	ldr	r3, [r5, #12]
 800163e:	430b      	orrs	r3, r1
 8001640:	6929      	ldr	r1, [r5, #16]
 8001642:	430b      	orrs	r3, r1
 8001644:	4313      	orrs	r3, r2
 8001646:	6023      	str	r3, [r4, #0]
 8001648:	68a3      	ldr	r3, [r4, #8]
 800164a:	696a      	ldr	r2, [r5, #20]
 800164c:	401f      	ands	r7, r3
 800164e:	4317      	orrs	r7, r2
 8001650:	60a7      	str	r7, [r4, #8]
 8001652:	f000 fb8f 	bl	8001d74 <RCC_GetClocksFreq>
 8001656:	42b4      	cmp	r4, r6
 8001658:	d101      	bne.n	800165e <USART_Init+0xfa>
 800165a:	9e06      	ldr	r6, [sp, #24]
 800165c:	e00a      	b.n	8001674 <USART_Init+0x110>
 800165e:	4b16      	ldr	r3, [pc, #88]	; (80016b8 <USART_Init+0x154>)
 8001660:	429c      	cmp	r4, r3
 8001662:	d101      	bne.n	8001668 <USART_Init+0x104>
 8001664:	9e07      	ldr	r6, [sp, #28]
 8001666:	e005      	b.n	8001674 <USART_Init+0x110>
 8001668:	4b14      	ldr	r3, [pc, #80]	; (80016bc <USART_Init+0x158>)
 800166a:	429c      	cmp	r4, r3
 800166c:	d101      	bne.n	8001672 <USART_Init+0x10e>
 800166e:	9e08      	ldr	r6, [sp, #32]
 8001670:	e000      	b.n	8001674 <USART_Init+0x110>
 8001672:	9e02      	ldr	r6, [sp, #8]
 8001674:	6823      	ldr	r3, [r4, #0]
 8001676:	682f      	ldr	r7, [r5, #0]
 8001678:	0419      	lsls	r1, r3, #16
 800167a:	d500      	bpl.n	800167e <USART_Init+0x11a>
 800167c:	0076      	lsls	r6, r6, #1
 800167e:	1c39      	adds	r1, r7, #0
 8001680:	1c30      	adds	r0, r6, #0
 8001682:	f000 fd9d 	bl	80021c0 <__aeabi_uidiv>
 8001686:	1c39      	adds	r1, r7, #0
 8001688:	1c05      	adds	r5, r0, #0
 800168a:	1c30      	adds	r0, r6, #0
 800168c:	f000 fddc 	bl	8002248 <__aeabi_uidivmod>
 8001690:	087f      	lsrs	r7, r7, #1
 8001692:	2300      	movs	r3, #0
 8001694:	42b9      	cmp	r1, r7
 8001696:	415b      	adcs	r3, r3
 8001698:	18ed      	adds	r5, r5, r3
 800169a:	6823      	ldr	r3, [r4, #0]
 800169c:	041a      	lsls	r2, r3, #16
 800169e:	d504      	bpl.n	80016aa <USART_Init+0x146>
 80016a0:	4a16      	ldr	r2, [pc, #88]	; (80016fc <USART_Init+0x198>)
 80016a2:	072b      	lsls	r3, r5, #28
 80016a4:	0f5b      	lsrs	r3, r3, #29
 80016a6:	4015      	ands	r5, r2
 80016a8:	431d      	orrs	r5, r3
 80016aa:	b2ad      	uxth	r5, r5
 80016ac:	81a5      	strh	r5, [r4, #12]
 80016ae:	b00b      	add	sp, #44	; 0x2c
 80016b0:	bdf0      	pop	{r4, r5, r6, r7, pc}
 80016b2:	46c0      	nop			; (mov r8, r8)
 80016b4:	40013800 	.word	0x40013800
 80016b8:	40004400 	.word	0x40004400
 80016bc:	40004800 	.word	0x40004800
 80016c0:	40004c00 	.word	0x40004c00
 80016c4:	40005000 	.word	0x40005000
 80016c8:	40011400 	.word	0x40011400
 80016cc:	40011800 	.word	0x40011800
 80016d0:	bffee400 	.word	0xbffee400
 80016d4:	005b8d7f 	.word	0x005b8d7f
 80016d8:	ffffefff 	.word	0xffffefff
 80016dc:	effff000 	.word	0xeffff000
 80016e0:	ffffdfff 	.word	0xffffdfff
 80016e4:	ffffd000 	.word	0xffffd000
 80016e8:	fffffbff 	.word	0xfffffbff
 80016ec:	fffffa00 	.word	0xfffffa00
 80016f0:	fffffcff 	.word	0xfffffcff
 80016f4:	ffffcfff 	.word	0xffffcfff
 80016f8:	ffffe9f3 	.word	0xffffe9f3
 80016fc:	0000fff0 	.word	0x0000fff0

08001700 <USART_Cmd>:
 8001700:	4b17      	ldr	r3, [pc, #92]	; (8001760 <USART_Cmd+0x60>)
 8001702:	b570      	push	{r4, r5, r6, lr}
 8001704:	1c04      	adds	r4, r0, #0
 8001706:	1c0e      	adds	r6, r1, #0
 8001708:	4298      	cmp	r0, r3
 800170a:	d016      	beq.n	800173a <USART_Cmd+0x3a>
 800170c:	4b15      	ldr	r3, [pc, #84]	; (8001764 <USART_Cmd+0x64>)
 800170e:	4298      	cmp	r0, r3
 8001710:	d013      	beq.n	800173a <USART_Cmd+0x3a>
 8001712:	4b15      	ldr	r3, [pc, #84]	; (8001768 <USART_Cmd+0x68>)
 8001714:	4298      	cmp	r0, r3
 8001716:	d010      	beq.n	800173a <USART_Cmd+0x3a>
 8001718:	4b14      	ldr	r3, [pc, #80]	; (800176c <USART_Cmd+0x6c>)
 800171a:	4298      	cmp	r0, r3
 800171c:	d00d      	beq.n	800173a <USART_Cmd+0x3a>
 800171e:	4b14      	ldr	r3, [pc, #80]	; (8001770 <USART_Cmd+0x70>)
 8001720:	4298      	cmp	r0, r3
 8001722:	d00a      	beq.n	800173a <USART_Cmd+0x3a>
 8001724:	4b13      	ldr	r3, [pc, #76]	; (8001774 <USART_Cmd+0x74>)
 8001726:	4298      	cmp	r0, r3
 8001728:	d007      	beq.n	800173a <USART_Cmd+0x3a>
 800172a:	4b13      	ldr	r3, [pc, #76]	; (8001778 <USART_Cmd+0x78>)
 800172c:	4298      	cmp	r0, r3
 800172e:	d004      	beq.n	800173a <USART_Cmd+0x3a>
 8001730:	4b12      	ldr	r3, [pc, #72]	; (800177c <USART_Cmd+0x7c>)
 8001732:	18c0      	adds	r0, r0, r3
 8001734:	4243      	negs	r3, r0
 8001736:	4158      	adcs	r0, r3
 8001738:	e000      	b.n	800173c <USART_Cmd+0x3c>
 800173a:	2001      	movs	r0, #1
 800173c:	f7ff fa5e 	bl	8000bfc <assert_param>
 8001740:	2501      	movs	r5, #1
 8001742:	2000      	movs	r0, #0
 8001744:	42b5      	cmp	r5, r6
 8001746:	4140      	adcs	r0, r0
 8001748:	f7ff fa58 	bl	8000bfc <assert_param>
 800174c:	6823      	ldr	r3, [r4, #0]
 800174e:	2e00      	cmp	r6, #0
 8001750:	d002      	beq.n	8001758 <USART_Cmd+0x58>
 8001752:	431d      	orrs	r5, r3
 8001754:	6025      	str	r5, [r4, #0]
 8001756:	e001      	b.n	800175c <USART_Cmd+0x5c>
 8001758:	43ab      	bics	r3, r5
 800175a:	6023      	str	r3, [r4, #0]
 800175c:	bd70      	pop	{r4, r5, r6, pc}
 800175e:	46c0      	nop			; (mov r8, r8)
 8001760:	40013800 	.word	0x40013800
 8001764:	40004400 	.word	0x40004400
 8001768:	40004800 	.word	0x40004800
 800176c:	40004c00 	.word	0x40004c00
 8001770:	40005000 	.word	0x40005000
 8001774:	40011400 	.word	0x40011400
 8001778:	40011800 	.word	0x40011800
 800177c:	bffee400 	.word	0xbffee400

08001780 <USART_ReceiveData>:
 8001780:	4b11      	ldr	r3, [pc, #68]	; (80017c8 <USART_ReceiveData+0x48>)
 8001782:	b510      	push	{r4, lr}
 8001784:	1e04      	subs	r4, r0, #0
 8001786:	429c      	cmp	r4, r3
 8001788:	d016      	beq.n	80017b8 <USART_ReceiveData+0x38>
 800178a:	4b10      	ldr	r3, [pc, #64]	; (80017cc <USART_ReceiveData+0x4c>)
 800178c:	4298      	cmp	r0, r3
 800178e:	d013      	beq.n	80017b8 <USART_ReceiveData+0x38>
 8001790:	4b0f      	ldr	r3, [pc, #60]	; (80017d0 <USART_ReceiveData+0x50>)
 8001792:	4298      	cmp	r0, r3
 8001794:	d010      	beq.n	80017b8 <USART_ReceiveData+0x38>
 8001796:	4b0f      	ldr	r3, [pc, #60]	; (80017d4 <USART_ReceiveData+0x54>)
 8001798:	4298      	cmp	r0, r3
 800179a:	d00d      	beq.n	80017b8 <USART_ReceiveData+0x38>
 800179c:	4b0e      	ldr	r3, [pc, #56]	; (80017d8 <USART_ReceiveData+0x58>)
 800179e:	4298      	cmp	r0, r3
 80017a0:	d00a      	beq.n	80017b8 <USART_ReceiveData+0x38>
 80017a2:	4b0e      	ldr	r3, [pc, #56]	; (80017dc <USART_ReceiveData+0x5c>)
 80017a4:	4298      	cmp	r0, r3
 80017a6:	d007      	beq.n	80017b8 <USART_ReceiveData+0x38>
 80017a8:	4b0d      	ldr	r3, [pc, #52]	; (80017e0 <USART_ReceiveData+0x60>)
 80017aa:	4298      	cmp	r0, r3
 80017ac:	d004      	beq.n	80017b8 <USART_ReceiveData+0x38>
 80017ae:	4b0d      	ldr	r3, [pc, #52]	; (80017e4 <USART_ReceiveData+0x64>)
 80017b0:	18c0      	adds	r0, r0, r3
 80017b2:	4243      	negs	r3, r0
 80017b4:	4158      	adcs	r0, r3
 80017b6:	e000      	b.n	80017ba <USART_ReceiveData+0x3a>
 80017b8:	2001      	movs	r0, #1
 80017ba:	f7ff fa1f 	bl	8000bfc <assert_param>
 80017be:	6a60      	ldr	r0, [r4, #36]	; 0x24
 80017c0:	05c0      	lsls	r0, r0, #23
 80017c2:	0dc0      	lsrs	r0, r0, #23
 80017c4:	bd10      	pop	{r4, pc}
 80017c6:	46c0      	nop			; (mov r8, r8)
 80017c8:	40013800 	.word	0x40013800
 80017cc:	40004400 	.word	0x40004400
 80017d0:	40004800 	.word	0x40004800
 80017d4:	40004c00 	.word	0x40004c00
 80017d8:	40005000 	.word	0x40005000
 80017dc:	40011400 	.word	0x40011400
 80017e0:	40011800 	.word	0x40011800
 80017e4:	bffee400 	.word	0xbffee400

080017e8 <USART_GetITStatus>:
 80017e8:	b538      	push	{r3, r4, r5, lr}
 80017ea:	4b36      	ldr	r3, [pc, #216]	; (80018c4 <USART_GetITStatus+0xdc>)
 80017ec:	1c05      	adds	r5, r0, #0
 80017ee:	1c0c      	adds	r4, r1, #0
 80017f0:	4298      	cmp	r0, r3
 80017f2:	d016      	beq.n	8001822 <USART_GetITStatus+0x3a>
 80017f4:	4b34      	ldr	r3, [pc, #208]	; (80018c8 <USART_GetITStatus+0xe0>)
 80017f6:	4298      	cmp	r0, r3
 80017f8:	d013      	beq.n	8001822 <USART_GetITStatus+0x3a>
 80017fa:	4b34      	ldr	r3, [pc, #208]	; (80018cc <USART_GetITStatus+0xe4>)
 80017fc:	4298      	cmp	r0, r3
 80017fe:	d010      	beq.n	8001822 <USART_GetITStatus+0x3a>
 8001800:	4b33      	ldr	r3, [pc, #204]	; (80018d0 <USART_GetITStatus+0xe8>)
 8001802:	4298      	cmp	r0, r3
 8001804:	d00d      	beq.n	8001822 <USART_GetITStatus+0x3a>
 8001806:	4b33      	ldr	r3, [pc, #204]	; (80018d4 <USART_GetITStatus+0xec>)
 8001808:	4298      	cmp	r0, r3
 800180a:	d00a      	beq.n	8001822 <USART_GetITStatus+0x3a>
 800180c:	4b32      	ldr	r3, [pc, #200]	; (80018d8 <USART_GetITStatus+0xf0>)
 800180e:	4298      	cmp	r0, r3
 8001810:	d007      	beq.n	8001822 <USART_GetITStatus+0x3a>
 8001812:	4b32      	ldr	r3, [pc, #200]	; (80018dc <USART_GetITStatus+0xf4>)
 8001814:	4298      	cmp	r0, r3
 8001816:	d004      	beq.n	8001822 <USART_GetITStatus+0x3a>
 8001818:	4a31      	ldr	r2, [pc, #196]	; (80018e0 <USART_GetITStatus+0xf8>)
 800181a:	1880      	adds	r0, r0, r2
 800181c:	4243      	negs	r3, r0
 800181e:	4158      	adcs	r0, r3
 8001820:	e000      	b.n	8001824 <USART_GetITStatus+0x3c>
 8001822:	2001      	movs	r0, #1
 8001824:	f7ff f9ea 	bl	8000bfc <assert_param>
 8001828:	2384      	movs	r3, #132	; 0x84
 800182a:	005b      	lsls	r3, r3, #1
 800182c:	429c      	cmp	r4, r3
 800182e:	d027      	beq.n	8001880 <USART_GetITStatus+0x98>
 8001830:	4b2c      	ldr	r3, [pc, #176]	; (80018e4 <USART_GetITStatus+0xfc>)
 8001832:	429c      	cmp	r4, r3
 8001834:	d024      	beq.n	8001880 <USART_GetITStatus+0x98>
 8001836:	4b2c      	ldr	r3, [pc, #176]	; (80018e8 <USART_GetITStatus+0x100>)
 8001838:	429c      	cmp	r4, r3
 800183a:	d021      	beq.n	8001880 <USART_GetITStatus+0x98>
 800183c:	4b2b      	ldr	r3, [pc, #172]	; (80018ec <USART_GetITStatus+0x104>)
 800183e:	429c      	cmp	r4, r3
 8001840:	d01e      	beq.n	8001880 <USART_GetITStatus+0x98>
 8001842:	4b2b      	ldr	r3, [pc, #172]	; (80018f0 <USART_GetITStatus+0x108>)
 8001844:	429c      	cmp	r4, r3
 8001846:	d01b      	beq.n	8001880 <USART_GetITStatus+0x98>
 8001848:	4b2a      	ldr	r3, [pc, #168]	; (80018f4 <USART_GetITStatus+0x10c>)
 800184a:	429c      	cmp	r4, r3
 800184c:	d018      	beq.n	8001880 <USART_GetITStatus+0x98>
 800184e:	4b2a      	ldr	r3, [pc, #168]	; (80018f8 <USART_GetITStatus+0x110>)
 8001850:	429c      	cmp	r4, r3
 8001852:	d015      	beq.n	8001880 <USART_GetITStatus+0x98>
 8001854:	4b29      	ldr	r3, [pc, #164]	; (80018fc <USART_GetITStatus+0x114>)
 8001856:	429c      	cmp	r4, r3
 8001858:	d012      	beq.n	8001880 <USART_GetITStatus+0x98>
 800185a:	4a29      	ldr	r2, [pc, #164]	; (8001900 <USART_GetITStatus+0x118>)
 800185c:	4b29      	ldr	r3, [pc, #164]	; (8001904 <USART_GetITStatus+0x11c>)
 800185e:	4022      	ands	r2, r4
 8001860:	429a      	cmp	r2, r3
 8001862:	d00d      	beq.n	8001880 <USART_GetITStatus+0x98>
 8001864:	4b28      	ldr	r3, [pc, #160]	; (8001908 <USART_GetITStatus+0x120>)
 8001866:	429c      	cmp	r4, r3
 8001868:	d00a      	beq.n	8001880 <USART_GetITStatus+0x98>
 800186a:	4b28      	ldr	r3, [pc, #160]	; (800190c <USART_GetITStatus+0x124>)
 800186c:	429c      	cmp	r4, r3
 800186e:	d007      	beq.n	8001880 <USART_GetITStatus+0x98>
 8001870:	4b27      	ldr	r3, [pc, #156]	; (8001910 <USART_GetITStatus+0x128>)
 8001872:	429c      	cmp	r4, r3
 8001874:	d004      	beq.n	8001880 <USART_GetITStatus+0x98>
 8001876:	4a27      	ldr	r2, [pc, #156]	; (8001914 <USART_GetITStatus+0x12c>)
 8001878:	18a3      	adds	r3, r4, r2
 800187a:	4258      	negs	r0, r3
 800187c:	4158      	adcs	r0, r3
 800187e:	e000      	b.n	8001882 <USART_GetITStatus+0x9a>
 8001880:	2001      	movs	r0, #1
 8001882:	f7ff f9bb 	bl	8000bfc <assert_param>
 8001886:	b2e3      	uxtb	r3, r4
 8001888:	2101      	movs	r1, #1
 800188a:	b2a2      	uxth	r2, r4
 800188c:	4099      	lsls	r1, r3
 800188e:	0a12      	lsrs	r2, r2, #8
 8001890:	1c0b      	adds	r3, r1, #0
 8001892:	2a01      	cmp	r2, #1
 8001894:	d101      	bne.n	800189a <USART_GetITStatus+0xb2>
 8001896:	682a      	ldr	r2, [r5, #0]
 8001898:	e004      	b.n	80018a4 <USART_GetITStatus+0xbc>
 800189a:	2a02      	cmp	r2, #2
 800189c:	d101      	bne.n	80018a2 <USART_GetITStatus+0xba>
 800189e:	686a      	ldr	r2, [r5, #4]
 80018a0:	e000      	b.n	80018a4 <USART_GetITStatus+0xbc>
 80018a2:	68aa      	ldr	r2, [r5, #8]
 80018a4:	2000      	movs	r0, #0
 80018a6:	4013      	ands	r3, r2
 80018a8:	69ea      	ldr	r2, [r5, #28]
 80018aa:	4283      	cmp	r3, r0
 80018ac:	d008      	beq.n	80018c0 <USART_GetITStatus+0xd8>
 80018ae:	0c24      	lsrs	r4, r4, #16
 80018b0:	2001      	movs	r0, #1
 80018b2:	40a0      	lsls	r0, r4
 80018b4:	1c04      	adds	r4, r0, #0
 80018b6:	1c10      	adds	r0, r2, #0
 80018b8:	4020      	ands	r0, r4
 80018ba:	1e44      	subs	r4, r0, #1
 80018bc:	41a0      	sbcs	r0, r4
 80018be:	b2c0      	uxtb	r0, r0
 80018c0:	bd38      	pop	{r3, r4, r5, pc}
 80018c2:	46c0      	nop			; (mov r8, r8)
 80018c4:	40013800 	.word	0x40013800
 80018c8:	40004400 	.word	0x40004400
 80018cc:	40004800 	.word	0x40004800
 80018d0:	40004c00 	.word	0x40004c00
 80018d4:	40005000 	.word	0x40005000
 80018d8:	40011400 	.word	0x40011400
 80018dc:	40011800 	.word	0x40011800
 80018e0:	bffee400 	.word	0xbffee400
 80018e4:	00070107 	.word	0x00070107
 80018e8:	00060106 	.word	0x00060106
 80018ec:	00050105 	.word	0x00050105
 80018f0:	00040104 	.word	0x00040104
 80018f4:	00080206 	.word	0x00080206
 80018f8:	0009030a 	.word	0x0009030a
 80018fc:	00020300 	.word	0x00020300
 8001900:	fffdffff 	.word	0xfffdffff
 8001904:	00010300 	.word	0x00010300
 8001908:	000b011a 	.word	0x000b011a
 800190c:	000c011b 	.word	0x000c011b
 8001910:	0011010e 	.word	0x0011010e
 8001914:	ffebfcea 	.word	0xffebfcea

08001918 <USART_ClearITPendingBit>:
 8001918:	b538      	push	{r3, r4, r5, lr}
 800191a:	4b26      	ldr	r3, [pc, #152]	; (80019b4 <USART_ClearITPendingBit+0x9c>)
 800191c:	1c05      	adds	r5, r0, #0
 800191e:	1c0c      	adds	r4, r1, #0
 8001920:	4298      	cmp	r0, r3
 8001922:	d016      	beq.n	8001952 <USART_ClearITPendingBit+0x3a>
 8001924:	4b24      	ldr	r3, [pc, #144]	; (80019b8 <USART_ClearITPendingBit+0xa0>)
 8001926:	4298      	cmp	r0, r3
 8001928:	d013      	beq.n	8001952 <USART_ClearITPendingBit+0x3a>
 800192a:	4b24      	ldr	r3, [pc, #144]	; (80019bc <USART_ClearITPendingBit+0xa4>)
 800192c:	4298      	cmp	r0, r3
 800192e:	d010      	beq.n	8001952 <USART_ClearITPendingBit+0x3a>
 8001930:	4b23      	ldr	r3, [pc, #140]	; (80019c0 <USART_ClearITPendingBit+0xa8>)
 8001932:	4298      	cmp	r0, r3
 8001934:	d00d      	beq.n	8001952 <USART_ClearITPendingBit+0x3a>
 8001936:	4b23      	ldr	r3, [pc, #140]	; (80019c4 <USART_ClearITPendingBit+0xac>)
 8001938:	4298      	cmp	r0, r3
 800193a:	d00a      	beq.n	8001952 <USART_ClearITPendingBit+0x3a>
 800193c:	4b22      	ldr	r3, [pc, #136]	; (80019c8 <USART_ClearITPendingBit+0xb0>)
 800193e:	4298      	cmp	r0, r3
 8001940:	d007      	beq.n	8001952 <USART_ClearITPendingBit+0x3a>
 8001942:	4b22      	ldr	r3, [pc, #136]	; (80019cc <USART_ClearITPendingBit+0xb4>)
 8001944:	4298      	cmp	r0, r3
 8001946:	d004      	beq.n	8001952 <USART_ClearITPendingBit+0x3a>
 8001948:	4a21      	ldr	r2, [pc, #132]	; (80019d0 <USART_ClearITPendingBit+0xb8>)
 800194a:	1880      	adds	r0, r0, r2
 800194c:	4243      	negs	r3, r0
 800194e:	4158      	adcs	r0, r3
 8001950:	e000      	b.n	8001954 <USART_ClearITPendingBit+0x3c>
 8001952:	2001      	movs	r0, #1
 8001954:	f7ff f952 	bl	8000bfc <assert_param>
 8001958:	4b1e      	ldr	r3, [pc, #120]	; (80019d4 <USART_ClearITPendingBit+0xbc>)
 800195a:	429c      	cmp	r4, r3
 800195c:	d022      	beq.n	80019a4 <USART_ClearITPendingBit+0x8c>
 800195e:	2384      	movs	r3, #132	; 0x84
 8001960:	005b      	lsls	r3, r3, #1
 8001962:	429c      	cmp	r4, r3
 8001964:	d01e      	beq.n	80019a4 <USART_ClearITPendingBit+0x8c>
 8001966:	4a1c      	ldr	r2, [pc, #112]	; (80019d8 <USART_ClearITPendingBit+0xc0>)
 8001968:	4b1c      	ldr	r3, [pc, #112]	; (80019dc <USART_ClearITPendingBit+0xc4>)
 800196a:	4022      	ands	r2, r4
 800196c:	429a      	cmp	r2, r3
 800196e:	d019      	beq.n	80019a4 <USART_ClearITPendingBit+0x8c>
 8001970:	4b1b      	ldr	r3, [pc, #108]	; (80019e0 <USART_ClearITPendingBit+0xc8>)
 8001972:	429c      	cmp	r4, r3
 8001974:	d016      	beq.n	80019a4 <USART_ClearITPendingBit+0x8c>
 8001976:	4b1b      	ldr	r3, [pc, #108]	; (80019e4 <USART_ClearITPendingBit+0xcc>)
 8001978:	429c      	cmp	r4, r3
 800197a:	d013      	beq.n	80019a4 <USART_ClearITPendingBit+0x8c>
 800197c:	4b1a      	ldr	r3, [pc, #104]	; (80019e8 <USART_ClearITPendingBit+0xd0>)
 800197e:	429c      	cmp	r4, r3
 8001980:	d010      	beq.n	80019a4 <USART_ClearITPendingBit+0x8c>
 8001982:	4b1a      	ldr	r3, [pc, #104]	; (80019ec <USART_ClearITPendingBit+0xd4>)
 8001984:	429c      	cmp	r4, r3
 8001986:	d00d      	beq.n	80019a4 <USART_ClearITPendingBit+0x8c>
 8001988:	4b19      	ldr	r3, [pc, #100]	; (80019f0 <USART_ClearITPendingBit+0xd8>)
 800198a:	429c      	cmp	r4, r3
 800198c:	d00a      	beq.n	80019a4 <USART_ClearITPendingBit+0x8c>
 800198e:	4b19      	ldr	r3, [pc, #100]	; (80019f4 <USART_ClearITPendingBit+0xdc>)
 8001990:	429c      	cmp	r4, r3
 8001992:	d007      	beq.n	80019a4 <USART_ClearITPendingBit+0x8c>
 8001994:	4b18      	ldr	r3, [pc, #96]	; (80019f8 <USART_ClearITPendingBit+0xe0>)
 8001996:	429c      	cmp	r4, r3
 8001998:	d004      	beq.n	80019a4 <USART_ClearITPendingBit+0x8c>
 800199a:	4a18      	ldr	r2, [pc, #96]	; (80019fc <USART_ClearITPendingBit+0xe4>)
 800199c:	18a3      	adds	r3, r4, r2
 800199e:	4258      	negs	r0, r3
 80019a0:	4158      	adcs	r0, r3
 80019a2:	e000      	b.n	80019a6 <USART_ClearITPendingBit+0x8e>
 80019a4:	2001      	movs	r0, #1
 80019a6:	f7ff f929 	bl	8000bfc <assert_param>
 80019aa:	0c24      	lsrs	r4, r4, #16
 80019ac:	2301      	movs	r3, #1
 80019ae:	40a3      	lsls	r3, r4
 80019b0:	622b      	str	r3, [r5, #32]
 80019b2:	bd38      	pop	{r3, r4, r5, pc}
 80019b4:	40013800 	.word	0x40013800
 80019b8:	40004400 	.word	0x40004400
 80019bc:	40004800 	.word	0x40004800
 80019c0:	40004c00 	.word	0x40004c00
 80019c4:	40005000 	.word	0x40005000
 80019c8:	40011400 	.word	0x40011400
 80019cc:	40011800 	.word	0x40011800
 80019d0:	bffee400 	.word	0xbffee400
 80019d4:	00060106 	.word	0x00060106
 80019d8:	fffdffff 	.word	0xfffdffff
 80019dc:	00010300 	.word	0x00010300
 80019e0:	00020300 	.word	0x00020300
 80019e4:	00040104 	.word	0x00040104
 80019e8:	00080206 	.word	0x00080206
 80019ec:	0009030a 	.word	0x0009030a
 80019f0:	000b011a 	.word	0x000b011a
 80019f4:	000c011b 	.word	0x000c011b
 80019f8:	0011010e 	.word	0x0011010e
 80019fc:	ffebfcea 	.word	0xffebfcea

08001a00 <ADC_DeInit>:
 8001a00:	4b0a      	ldr	r3, [pc, #40]	; (8001a2c <ADC_DeInit+0x2c>)
 8001a02:	b510      	push	{r4, lr}
 8001a04:	18c4      	adds	r4, r0, r3
 8001a06:	4263      	negs	r3, r4
 8001a08:	415c      	adcs	r4, r3
 8001a0a:	b2e4      	uxtb	r4, r4
 8001a0c:	1c20      	adds	r0, r4, #0
 8001a0e:	f7ff f8f5 	bl	8000bfc <assert_param>
 8001a12:	2c00      	cmp	r4, #0
 8001a14:	d009      	beq.n	8001a2a <ADC_DeInit+0x2a>
 8001a16:	2080      	movs	r0, #128	; 0x80
 8001a18:	0080      	lsls	r0, r0, #2
 8001a1a:	2101      	movs	r1, #1
 8001a1c:	f000 face 	bl	8001fbc <RCC_APB2PeriphResetCmd>
 8001a20:	2080      	movs	r0, #128	; 0x80
 8001a22:	0080      	lsls	r0, r0, #2
 8001a24:	2100      	movs	r1, #0
 8001a26:	f000 fac9 	bl	8001fbc <RCC_APB2PeriphResetCmd>
 8001a2a:	bd10      	pop	{r4, pc}
 8001a2c:	bffedc00 	.word	0xbffedc00

08001a30 <ADC_Init>:
 8001a30:	b570      	push	{r4, r5, r6, lr}
 8001a32:	1c0c      	adds	r4, r1, #0
 8001a34:	4924      	ldr	r1, [pc, #144]	; (8001ac8 <ADC_Init+0x98>)
 8001a36:	1c05      	adds	r5, r0, #0
 8001a38:	1840      	adds	r0, r0, r1
 8001a3a:	4243      	negs	r3, r0
 8001a3c:	4158      	adcs	r0, r3
 8001a3e:	f7ff f8dd 	bl	8000bfc <assert_param>
 8001a42:	6820      	ldr	r0, [r4, #0]
 8001a44:	2318      	movs	r3, #24
 8001a46:	4398      	bics	r0, r3
 8001a48:	4243      	negs	r3, r0
 8001a4a:	4158      	adcs	r0, r3
 8001a4c:	f7ff f8d6 	bl	8000bfc <assert_param>
 8001a50:	7923      	ldrb	r3, [r4, #4]
 8001a52:	2601      	movs	r6, #1
 8001a54:	2000      	movs	r0, #0
 8001a56:	429e      	cmp	r6, r3
 8001a58:	4140      	adcs	r0, r0
 8001a5a:	f7ff f8cf 	bl	8000bfc <assert_param>
 8001a5e:	68a3      	ldr	r3, [r4, #8]
 8001a60:	481a      	ldr	r0, [pc, #104]	; (8001acc <ADC_Init+0x9c>)
 8001a62:	4018      	ands	r0, r3
 8001a64:	4243      	negs	r3, r0
 8001a66:	4158      	adcs	r0, r3
 8001a68:	f7ff f8c8 	bl	8000bfc <assert_param>
 8001a6c:	68e3      	ldr	r3, [r4, #12]
 8001a6e:	22c0      	movs	r2, #192	; 0xc0
 8001a70:	1c19      	adds	r1, r3, #0
 8001a72:	4391      	bics	r1, r2
 8001a74:	1c30      	adds	r0, r6, #0
 8001a76:	2900      	cmp	r1, #0
 8001a78:	d003      	beq.n	8001a82 <ADC_Init+0x52>
 8001a7a:	1e58      	subs	r0, r3, #1
 8001a7c:	38ff      	subs	r0, #255	; 0xff
 8001a7e:	4243      	negs	r3, r0
 8001a80:	4158      	adcs	r0, r3
 8001a82:	f7ff f8bb 	bl	8000bfc <assert_param>
 8001a86:	6920      	ldr	r0, [r4, #16]
 8001a88:	2320      	movs	r3, #32
 8001a8a:	4398      	bics	r0, r3
 8001a8c:	4243      	negs	r3, r0
 8001a8e:	4158      	adcs	r0, r3
 8001a90:	f7ff f8b4 	bl	8000bfc <assert_param>
 8001a94:	6960      	ldr	r0, [r4, #20]
 8001a96:	2304      	movs	r3, #4
 8001a98:	4398      	bics	r0, r3
 8001a9a:	4243      	negs	r3, r0
 8001a9c:	4158      	adcs	r0, r3
 8001a9e:	f7ff f8ad 	bl	8000bfc <assert_param>
 8001aa2:	6823      	ldr	r3, [r4, #0]
 8001aa4:	68a2      	ldr	r2, [r4, #8]
 8001aa6:	68e9      	ldr	r1, [r5, #12]
 8001aa8:	431a      	orrs	r2, r3
 8001aaa:	68e3      	ldr	r3, [r4, #12]
 8001aac:	431a      	orrs	r2, r3
 8001aae:	6923      	ldr	r3, [r4, #16]
 8001ab0:	431a      	orrs	r2, r3
 8001ab2:	6963      	ldr	r3, [r4, #20]
 8001ab4:	431a      	orrs	r2, r3
 8001ab6:	4b06      	ldr	r3, [pc, #24]	; (8001ad0 <ADC_Init+0xa0>)
 8001ab8:	400b      	ands	r3, r1
 8001aba:	4313      	orrs	r3, r2
 8001abc:	7922      	ldrb	r2, [r4, #4]
 8001abe:	0352      	lsls	r2, r2, #13
 8001ac0:	4313      	orrs	r3, r2
 8001ac2:	60eb      	str	r3, [r5, #12]
 8001ac4:	bd70      	pop	{r4, r5, r6, pc}
 8001ac6:	46c0      	nop			; (mov r8, r8)
 8001ac8:	bffedc00 	.word	0xbffedc00
 8001acc:	fffff3ff 	.word	0xfffff3ff
 8001ad0:	ffffd203 	.word	0xffffd203

08001ad4 <ADC_Cmd>:
 8001ad4:	4b0c      	ldr	r3, [pc, #48]	; (8001b08 <ADC_Cmd+0x34>)
 8001ad6:	b570      	push	{r4, r5, r6, lr}
 8001ad8:	1c04      	adds	r4, r0, #0
 8001ada:	18c0      	adds	r0, r0, r3
 8001adc:	4243      	negs	r3, r0
 8001ade:	4158      	adcs	r0, r3
 8001ae0:	1c0e      	adds	r6, r1, #0
 8001ae2:	2501      	movs	r5, #1
 8001ae4:	f7ff f88a 	bl	8000bfc <assert_param>
 8001ae8:	2000      	movs	r0, #0
 8001aea:	42b5      	cmp	r5, r6
 8001aec:	4140      	adcs	r0, r0
 8001aee:	f7ff f885 	bl	8000bfc <assert_param>
 8001af2:	68a3      	ldr	r3, [r4, #8]
 8001af4:	2e00      	cmp	r6, #0
 8001af6:	d002      	beq.n	8001afe <ADC_Cmd+0x2a>
 8001af8:	431d      	orrs	r5, r3
 8001afa:	60a5      	str	r5, [r4, #8]
 8001afc:	e002      	b.n	8001b04 <ADC_Cmd+0x30>
 8001afe:	2202      	movs	r2, #2
 8001b00:	4313      	orrs	r3, r2
 8001b02:	60a3      	str	r3, [r4, #8]
 8001b04:	bd70      	pop	{r4, r5, r6, pc}
 8001b06:	46c0      	nop			; (mov r8, r8)
 8001b08:	bffedc00 	.word	0xbffedc00

08001b0c <ADC_TempSensorCmd>:
 8001b0c:	2301      	movs	r3, #1
 8001b0e:	b510      	push	{r4, lr}
 8001b10:	1c04      	adds	r4, r0, #0
 8001b12:	2000      	movs	r0, #0
 8001b14:	42a3      	cmp	r3, r4
 8001b16:	4140      	adcs	r0, r0
 8001b18:	f7ff f870 	bl	8000bfc <assert_param>
 8001b1c:	4b05      	ldr	r3, [pc, #20]	; (8001b34 <ADC_TempSensorCmd+0x28>)
 8001b1e:	6819      	ldr	r1, [r3, #0]
 8001b20:	2c00      	cmp	r4, #0
 8001b22:	d003      	beq.n	8001b2c <ADC_TempSensorCmd+0x20>
 8001b24:	2280      	movs	r2, #128	; 0x80
 8001b26:	0412      	lsls	r2, r2, #16
 8001b28:	430a      	orrs	r2, r1
 8001b2a:	e001      	b.n	8001b30 <ADC_TempSensorCmd+0x24>
 8001b2c:	4a02      	ldr	r2, [pc, #8]	; (8001b38 <ADC_TempSensorCmd+0x2c>)
 8001b2e:	400a      	ands	r2, r1
 8001b30:	601a      	str	r2, [r3, #0]
 8001b32:	bd10      	pop	{r4, pc}
 8001b34:	40012708 	.word	0x40012708
 8001b38:	ff7fffff 	.word	0xff7fffff

08001b3c <ADC_ChannelConfig>:
 8001b3c:	4b0e      	ldr	r3, [pc, #56]	; (8001b78 <ADC_ChannelConfig+0x3c>)
 8001b3e:	b570      	push	{r4, r5, r6, lr}
 8001b40:	1c04      	adds	r4, r0, #0
 8001b42:	18c0      	adds	r0, r0, r3
 8001b44:	4243      	negs	r3, r0
 8001b46:	4158      	adcs	r0, r3
 8001b48:	1c0d      	adds	r5, r1, #0
 8001b4a:	1c16      	adds	r6, r2, #0
 8001b4c:	f7ff f856 	bl	8000bfc <assert_param>
 8001b50:	2000      	movs	r0, #0
 8001b52:	4285      	cmp	r5, r0
 8001b54:	d002      	beq.n	8001b5c <ADC_ChannelConfig+0x20>
 8001b56:	0ce8      	lsrs	r0, r5, #19
 8001b58:	4243      	negs	r3, r0
 8001b5a:	4158      	adcs	r0, r3
 8001b5c:	f7ff f84e 	bl	8000bfc <assert_param>
 8001b60:	2307      	movs	r3, #7
 8001b62:	2000      	movs	r0, #0
 8001b64:	42b3      	cmp	r3, r6
 8001b66:	4140      	adcs	r0, r0
 8001b68:	f7ff f848 	bl	8000bfc <assert_param>
 8001b6c:	6aa3      	ldr	r3, [r4, #40]	; 0x28
 8001b6e:	431d      	orrs	r5, r3
 8001b70:	62a5      	str	r5, [r4, #40]	; 0x28
 8001b72:	6166      	str	r6, [r4, #20]
 8001b74:	bd70      	pop	{r4, r5, r6, pc}
 8001b76:	46c0      	nop			; (mov r8, r8)
 8001b78:	bffedc00 	.word	0xbffedc00

08001b7c <ADC_GetCalibrationFactor>:
 8001b7c:	4b0e      	ldr	r3, [pc, #56]	; (8001bb8 <ADC_GetCalibrationFactor+0x3c>)
 8001b7e:	b510      	push	{r4, lr}
 8001b80:	1c04      	adds	r4, r0, #0
 8001b82:	18c0      	adds	r0, r0, r3
 8001b84:	4243      	negs	r3, r0
 8001b86:	4158      	adcs	r0, r3
 8001b88:	f7ff f838 	bl	8000bfc <assert_param>
 8001b8c:	68a2      	ldr	r2, [r4, #8]
 8001b8e:	2380      	movs	r3, #128	; 0x80
 8001b90:	061b      	lsls	r3, r3, #24
 8001b92:	4313      	orrs	r3, r2
 8001b94:	60a3      	str	r3, [r4, #8]
 8001b96:	23f0      	movs	r3, #240	; 0xf0
 8001b98:	021b      	lsls	r3, r3, #8
 8001b9a:	68a2      	ldr	r2, [r4, #8]
 8001b9c:	3b01      	subs	r3, #1
 8001b9e:	0fd2      	lsrs	r2, r2, #31
 8001ba0:	07d2      	lsls	r2, r2, #31
 8001ba2:	2b00      	cmp	r3, #0
 8001ba4:	d001      	beq.n	8001baa <ADC_GetCalibrationFactor+0x2e>
 8001ba6:	2a00      	cmp	r2, #0
 8001ba8:	d1f7      	bne.n	8001b9a <ADC_GetCalibrationFactor+0x1e>
 8001baa:	68a3      	ldr	r3, [r4, #8]
 8001bac:	2b00      	cmp	r3, #0
 8001bae:	db01      	blt.n	8001bb4 <ADC_GetCalibrationFactor+0x38>
 8001bb0:	6c20      	ldr	r0, [r4, #64]	; 0x40
 8001bb2:	e000      	b.n	8001bb6 <ADC_GetCalibrationFactor+0x3a>
 8001bb4:	2000      	movs	r0, #0
 8001bb6:	bd10      	pop	{r4, pc}
 8001bb8:	bffedc00 	.word	0xbffedc00

08001bbc <ADC_StartOfConversion>:
 8001bbc:	4b06      	ldr	r3, [pc, #24]	; (8001bd8 <ADC_StartOfConversion+0x1c>)
 8001bbe:	b510      	push	{r4, lr}
 8001bc0:	1c04      	adds	r4, r0, #0
 8001bc2:	18c0      	adds	r0, r0, r3
 8001bc4:	4243      	negs	r3, r0
 8001bc6:	4158      	adcs	r0, r3
 8001bc8:	f7ff f818 	bl	8000bfc <assert_param>
 8001bcc:	68a3      	ldr	r3, [r4, #8]
 8001bce:	2204      	movs	r2, #4
 8001bd0:	4313      	orrs	r3, r2
 8001bd2:	60a3      	str	r3, [r4, #8]
 8001bd4:	bd10      	pop	{r4, pc}
 8001bd6:	46c0      	nop			; (mov r8, r8)
 8001bd8:	bffedc00 	.word	0xbffedc00

08001bdc <ADC_GetConversionValue>:
 8001bdc:	4b05      	ldr	r3, [pc, #20]	; (8001bf4 <ADC_GetConversionValue+0x18>)
 8001bde:	b510      	push	{r4, lr}
 8001be0:	1c04      	adds	r4, r0, #0
 8001be2:	18c0      	adds	r0, r0, r3
 8001be4:	4243      	negs	r3, r0
 8001be6:	4158      	adcs	r0, r3
 8001be8:	f7ff f808 	bl	8000bfc <assert_param>
 8001bec:	6c20      	ldr	r0, [r4, #64]	; 0x40
 8001bee:	b280      	uxth	r0, r0
 8001bf0:	bd10      	pop	{r4, pc}
 8001bf2:	46c0      	nop			; (mov r8, r8)
 8001bf4:	bffedc00 	.word	0xbffedc00

08001bf8 <ADC_GetFlagStatus>:
 8001bf8:	4a15      	ldr	r2, [pc, #84]	; (8001c50 <ADC_GetFlagStatus+0x58>)
 8001bfa:	b570      	push	{r4, r5, r6, lr}
 8001bfc:	1c05      	adds	r5, r0, #0
 8001bfe:	1880      	adds	r0, r0, r2
 8001c00:	1c0c      	adds	r4, r1, #0
 8001c02:	4243      	negs	r3, r0
 8001c04:	4158      	adcs	r0, r3
 8001c06:	4e13      	ldr	r6, [pc, #76]	; (8001c54 <ADC_GetFlagStatus+0x5c>)
 8001c08:	f7fe fff8 	bl	8000bfc <assert_param>
 8001c0c:	1c23      	adds	r3, r4, #0
 8001c0e:	4033      	ands	r3, r6
 8001c10:	1e5a      	subs	r2, r3, #1
 8001c12:	2a01      	cmp	r2, #1
 8001c14:	d90d      	bls.n	8001c32 <ADC_GetFlagStatus+0x3a>
 8001c16:	2b04      	cmp	r3, #4
 8001c18:	d00b      	beq.n	8001c32 <ADC_GetFlagStatus+0x3a>
 8001c1a:	2c08      	cmp	r4, #8
 8001c1c:	d009      	beq.n	8001c32 <ADC_GetFlagStatus+0x3a>
 8001c1e:	2c80      	cmp	r4, #128	; 0x80
 8001c20:	d007      	beq.n	8001c32 <ADC_GetFlagStatus+0x3a>
 8001c22:	2b10      	cmp	r3, #16
 8001c24:	d005      	beq.n	8001c32 <ADC_GetFlagStatus+0x3a>
 8001c26:	22fe      	movs	r2, #254	; 0xfe
 8001c28:	05d2      	lsls	r2, r2, #23
 8001c2a:	18a3      	adds	r3, r4, r2
 8001c2c:	4258      	negs	r0, r3
 8001c2e:	4158      	adcs	r0, r3
 8001c30:	e000      	b.n	8001c34 <ADC_GetFlagStatus+0x3c>
 8001c32:	2001      	movs	r0, #1
 8001c34:	f7fe ffe2 	bl	8000bfc <assert_param>
 8001c38:	01e3      	lsls	r3, r4, #7
 8001c3a:	d502      	bpl.n	8001c42 <ADC_GetFlagStatus+0x4a>
 8001c3c:	68ab      	ldr	r3, [r5, #8]
 8001c3e:	401e      	ands	r6, r3
 8001c40:	e000      	b.n	8001c44 <ADC_GetFlagStatus+0x4c>
 8001c42:	682e      	ldr	r6, [r5, #0]
 8001c44:	4026      	ands	r6, r4
 8001c46:	1e74      	subs	r4, r6, #1
 8001c48:	41a6      	sbcs	r6, r4
 8001c4a:	b2f0      	uxtb	r0, r6
 8001c4c:	bd70      	pop	{r4, r5, r6, pc}
 8001c4e:	46c0      	nop			; (mov r8, r8)
 8001c50:	bffedc00 	.word	0xbffedc00
 8001c54:	feffffff 	.word	0xfeffffff

08001c58 <ADC_ClearFlag>:
 8001c58:	b538      	push	{r3, r4, r5, lr}
 8001c5a:	4b0a      	ldr	r3, [pc, #40]	; (8001c84 <ADC_ClearFlag+0x2c>)
 8001c5c:	1c05      	adds	r5, r0, #0
 8001c5e:	18c0      	adds	r0, r0, r3
 8001c60:	4243      	negs	r3, r0
 8001c62:	4158      	adcs	r0, r3
 8001c64:	1c0c      	adds	r4, r1, #0
 8001c66:	f7fe ffc9 	bl	8000bfc <assert_param>
 8001c6a:	2000      	movs	r0, #0
 8001c6c:	4284      	cmp	r4, r0
 8001c6e:	d004      	beq.n	8001c7a <ADC_ClearFlag+0x22>
 8001c70:	239f      	movs	r3, #159	; 0x9f
 8001c72:	1c20      	adds	r0, r4, #0
 8001c74:	4398      	bics	r0, r3
 8001c76:	4243      	negs	r3, r0
 8001c78:	4158      	adcs	r0, r3
 8001c7a:	f7fe ffbf 	bl	8000bfc <assert_param>
 8001c7e:	602c      	str	r4, [r5, #0]
 8001c80:	bd38      	pop	{r3, r4, r5, pc}
 8001c82:	46c0      	nop			; (mov r8, r8)
 8001c84:	bffedc00 	.word	0xbffedc00

08001c88 <NVIC_Init>:
 8001c88:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
 8001c8a:	2500      	movs	r5, #0
 8001c8c:	7883      	ldrb	r3, [r0, #2]
 8001c8e:	1c04      	adds	r4, r0, #0
 8001c90:	2601      	movs	r6, #1
 8001c92:	1c28      	adds	r0, r5, #0
 8001c94:	429e      	cmp	r6, r3
 8001c96:	4168      	adcs	r0, r5
 8001c98:	f7fe ffb0 	bl	8000bfc <assert_param>
 8001c9c:	7863      	ldrb	r3, [r4, #1]
 8001c9e:	2703      	movs	r7, #3
 8001ca0:	1c28      	adds	r0, r5, #0
 8001ca2:	429f      	cmp	r7, r3
 8001ca4:	4168      	adcs	r0, r5
 8001ca6:	f7fe ffa9 	bl	8000bfc <assert_param>
 8001caa:	78a2      	ldrb	r2, [r4, #2]
 8001cac:	7823      	ldrb	r3, [r4, #0]
 8001cae:	42aa      	cmp	r2, r5
 8001cb0:	d01a      	beq.n	8001ce8 <NVIC_Init+0x60>
 8001cb2:	0899      	lsrs	r1, r3, #2
 8001cb4:	4a0f      	ldr	r2, [pc, #60]	; (8001cf4 <NVIC_Init+0x6c>)
 8001cb6:	0089      	lsls	r1, r1, #2
 8001cb8:	1889      	adds	r1, r1, r2
 8001cba:	22c0      	movs	r2, #192	; 0xc0
 8001cbc:	0092      	lsls	r2, r2, #2
 8001cbe:	401f      	ands	r7, r3
 8001cc0:	20ff      	movs	r0, #255	; 0xff
 8001cc2:	588d      	ldr	r5, [r1, r2]
 8001cc4:	00ff      	lsls	r7, r7, #3
 8001cc6:	1c03      	adds	r3, r0, #0
 8001cc8:	40bb      	lsls	r3, r7
 8001cca:	439d      	bics	r5, r3
 8001ccc:	7863      	ldrb	r3, [r4, #1]
 8001cce:	019b      	lsls	r3, r3, #6
 8001cd0:	4018      	ands	r0, r3
 8001cd2:	40b8      	lsls	r0, r7
 8001cd4:	1c2f      	adds	r7, r5, #0
 8001cd6:	4307      	orrs	r7, r0
 8001cd8:	508f      	str	r7, [r1, r2]
 8001cda:	7822      	ldrb	r2, [r4, #0]
 8001cdc:	231f      	movs	r3, #31
 8001cde:	4013      	ands	r3, r2
 8001ce0:	409e      	lsls	r6, r3
 8001ce2:	4b04      	ldr	r3, [pc, #16]	; (8001cf4 <NVIC_Init+0x6c>)
 8001ce4:	601e      	str	r6, [r3, #0]
 8001ce6:	e004      	b.n	8001cf2 <NVIC_Init+0x6a>
 8001ce8:	271f      	movs	r7, #31
 8001cea:	403b      	ands	r3, r7
 8001cec:	4a02      	ldr	r2, [pc, #8]	; (8001cf8 <NVIC_Init+0x70>)
 8001cee:	409e      	lsls	r6, r3
 8001cf0:	67d6      	str	r6, [r2, #124]	; 0x7c
 8001cf2:	bdf8      	pop	{r3, r4, r5, r6, r7, pc}
 8001cf4:	e000e100 	.word	0xe000e100
 8001cf8:	e000e104 	.word	0xe000e104

08001cfc <RCC_HSI14Cmd>:
 8001cfc:	b538      	push	{r3, r4, r5, lr}
 8001cfe:	1c05      	adds	r5, r0, #0
 8001d00:	2401      	movs	r4, #1
 8001d02:	2000      	movs	r0, #0
 8001d04:	42ac      	cmp	r4, r5
 8001d06:	4140      	adcs	r0, r0
 8001d08:	f7fe ff78 	bl	8000bfc <assert_param>
 8001d0c:	4b04      	ldr	r3, [pc, #16]	; (8001d20 <RCC_HSI14Cmd+0x24>)
 8001d0e:	6b5a      	ldr	r2, [r3, #52]	; 0x34
 8001d10:	2d00      	cmp	r5, #0
 8001d12:	d002      	beq.n	8001d1a <RCC_HSI14Cmd+0x1e>
 8001d14:	4314      	orrs	r4, r2
 8001d16:	635c      	str	r4, [r3, #52]	; 0x34
 8001d18:	e001      	b.n	8001d1e <RCC_HSI14Cmd+0x22>
 8001d1a:	43a2      	bics	r2, r4
 8001d1c:	635a      	str	r2, [r3, #52]	; 0x34
 8001d1e:	bd38      	pop	{r3, r4, r5, pc}
 8001d20:	40021000 	.word	0x40021000

08001d24 <RCC_ADCCLKConfig>:
 8001d24:	4b0e      	ldr	r3, [pc, #56]	; (8001d60 <RCC_ADCCLKConfig+0x3c>)
 8001d26:	b510      	push	{r4, lr}
 8001d28:	1c04      	adds	r4, r0, #0
 8001d2a:	2001      	movs	r0, #1
 8001d2c:	421c      	tst	r4, r3
 8001d2e:	d003      	beq.n	8001d38 <RCC_ADCCLKConfig+0x14>
 8001d30:	4b0c      	ldr	r3, [pc, #48]	; (8001d64 <RCC_ADCCLKConfig+0x40>)
 8001d32:	18e0      	adds	r0, r4, r3
 8001d34:	4243      	negs	r3, r0
 8001d36:	4158      	adcs	r0, r3
 8001d38:	f7fe ff60 	bl	8000bfc <assert_param>
 8001d3c:	4b0a      	ldr	r3, [pc, #40]	; (8001d68 <RCC_ADCCLKConfig+0x44>)
 8001d3e:	4a0b      	ldr	r2, [pc, #44]	; (8001d6c <RCC_ADCCLKConfig+0x48>)
 8001d40:	6859      	ldr	r1, [r3, #4]
 8001d42:	400a      	ands	r2, r1
 8001d44:	605a      	str	r2, [r3, #4]
 8001d46:	685a      	ldr	r2, [r3, #4]
 8001d48:	b2a1      	uxth	r1, r4
 8001d4a:	430a      	orrs	r2, r1
 8001d4c:	605a      	str	r2, [r3, #4]
 8001d4e:	6b19      	ldr	r1, [r3, #48]	; 0x30
 8001d50:	4a07      	ldr	r2, [pc, #28]	; (8001d70 <RCC_ADCCLKConfig+0x4c>)
 8001d52:	0c24      	lsrs	r4, r4, #16
 8001d54:	400a      	ands	r2, r1
 8001d56:	631a      	str	r2, [r3, #48]	; 0x30
 8001d58:	6b1a      	ldr	r2, [r3, #48]	; 0x30
 8001d5a:	4314      	orrs	r4, r2
 8001d5c:	631c      	str	r4, [r3, #48]	; 0x30
 8001d5e:	bd10      	pop	{r4, pc}
 8001d60:	feffffff 	.word	0xfeffffff
 8001d64:	feffc000 	.word	0xfeffc000
 8001d68:	40021000 	.word	0x40021000
 8001d6c:	ffffbfff 	.word	0xffffbfff
 8001d70:	fffffeff 	.word	0xfffffeff

08001d74 <RCC_GetClocksFreq>:
 8001d74:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
 8001d76:	4d5a      	ldr	r5, [pc, #360]	; (8001ee0 <RCC_GetClocksFreq+0x16c>)
 8001d78:	1c04      	adds	r4, r0, #0
 8001d7a:	6868      	ldr	r0, [r5, #4]
 8001d7c:	230c      	movs	r3, #12
 8001d7e:	4018      	ands	r0, r3
 8001d80:	f000 fa14 	bl	80021ac <__gnu_thumb1_case_uqi>
 8001d84:	1f1f1f1f 	.word	0x1f1f1f1f
 8001d88:	1f1f1f1f 	.word	0x1f1f1f1f
 8001d8c:	1f1f1f07 	.word	0x1f1f1f07
 8001d90:	1d          	.byte	0x1d
 8001d91:	00          	.byte	0x00
 8001d92:	686e      	ldr	r6, [r5, #4]
 8001d94:	23c0      	movs	r3, #192	; 0xc0
 8001d96:	02b6      	lsls	r6, r6, #10
 8001d98:	686a      	ldr	r2, [r5, #4]
 8001d9a:	0f36      	lsrs	r6, r6, #28
 8001d9c:	025b      	lsls	r3, r3, #9
 8001d9e:	3602      	adds	r6, #2
 8001da0:	421a      	tst	r2, r3
 8001da2:	d101      	bne.n	8001da8 <RCC_GetClocksFreq+0x34>
 8001da4:	484f      	ldr	r0, [pc, #316]	; (8001ee4 <RCC_GetClocksFreq+0x170>)
 8001da6:	e007      	b.n	8001db8 <RCC_GetClocksFreq+0x44>
 8001da8:	4b4d      	ldr	r3, [pc, #308]	; (8001ee0 <RCC_GetClocksFreq+0x16c>)
 8001daa:	484f      	ldr	r0, [pc, #316]	; (8001ee8 <RCC_GetClocksFreq+0x174>)
 8001dac:	6ad9      	ldr	r1, [r3, #44]	; 0x2c
 8001dae:	230f      	movs	r3, #15
 8001db0:	4019      	ands	r1, r3
 8001db2:	3101      	adds	r1, #1
 8001db4:	f000 fa04 	bl	80021c0 <__aeabi_uidiv>
 8001db8:	4370      	muls	r0, r6
 8001dba:	6020      	str	r0, [r4, #0]
 8001dbc:	e004      	b.n	8001dc8 <RCC_GetClocksFreq+0x54>
 8001dbe:	4b4b      	ldr	r3, [pc, #300]	; (8001eec <RCC_GetClocksFreq+0x178>)
 8001dc0:	e000      	b.n	8001dc4 <RCC_GetClocksFreq+0x50>
 8001dc2:	4b49      	ldr	r3, [pc, #292]	; (8001ee8 <RCC_GetClocksFreq+0x174>)
 8001dc4:	6023      	str	r3, [r4, #0]
 8001dc6:	2000      	movs	r0, #0
 8001dc8:	686b      	ldr	r3, [r5, #4]
 8001dca:	4a49      	ldr	r2, [pc, #292]	; (8001ef0 <RCC_GetClocksFreq+0x17c>)
 8001dcc:	061b      	lsls	r3, r3, #24
 8001dce:	0f1b      	lsrs	r3, r3, #28
 8001dd0:	6821      	ldr	r1, [r4, #0]
 8001dd2:	5cd3      	ldrb	r3, [r2, r3]
 8001dd4:	1c0e      	adds	r6, r1, #0
 8001dd6:	40de      	lsrs	r6, r3
 8001dd8:	6066      	str	r6, [r4, #4]
 8001dda:	1c33      	adds	r3, r6, #0
 8001ddc:	686e      	ldr	r6, [r5, #4]
 8001dde:	0576      	lsls	r6, r6, #21
 8001de0:	0f76      	lsrs	r6, r6, #29
 8001de2:	5d92      	ldrb	r2, [r2, r6]
 8001de4:	40d3      	lsrs	r3, r2
 8001de6:	60a3      	str	r3, [r4, #8]
 8001de8:	6b2a      	ldr	r2, [r5, #48]	; 0x30
 8001dea:	05d6      	lsls	r6, r2, #23
 8001dec:	d401      	bmi.n	8001df2 <RCC_GetClocksFreq+0x7e>
 8001dee:	4a41      	ldr	r2, [pc, #260]	; (8001ef4 <RCC_GetClocksFreq+0x180>)
 8001df0:	e006      	b.n	8001e00 <RCC_GetClocksFreq+0x8c>
 8001df2:	4a3b      	ldr	r2, [pc, #236]	; (8001ee0 <RCC_GetClocksFreq+0x16c>)
 8001df4:	6852      	ldr	r2, [r2, #4]
 8001df6:	0456      	lsls	r6, r2, #17
 8001df8:	d401      	bmi.n	8001dfe <RCC_GetClocksFreq+0x8a>
 8001dfa:	085a      	lsrs	r2, r3, #1
 8001dfc:	e000      	b.n	8001e00 <RCC_GetClocksFreq+0x8c>
 8001dfe:	089a      	lsrs	r2, r3, #2
 8001e00:	60e2      	str	r2, [r4, #12]
 8001e02:	6b2a      	ldr	r2, [r5, #48]	; 0x30
 8001e04:	0656      	lsls	r6, r2, #25
 8001e06:	d401      	bmi.n	8001e0c <RCC_GetClocksFreq+0x98>
 8001e08:	4a3b      	ldr	r2, [pc, #236]	; (8001ef8 <RCC_GetClocksFreq+0x184>)
 8001e0a:	e001      	b.n	8001e10 <RCC_GetClocksFreq+0x9c>
 8001e0c:	2280      	movs	r2, #128	; 0x80
 8001e0e:	0212      	lsls	r2, r2, #8
 8001e10:	6122      	str	r2, [r4, #16]
 8001e12:	6b2a      	ldr	r2, [r5, #48]	; 0x30
 8001e14:	06d6      	lsls	r6, r2, #27
 8001e16:	d402      	bmi.n	8001e1e <RCC_GetClocksFreq+0xaa>
 8001e18:	4a33      	ldr	r2, [pc, #204]	; (8001ee8 <RCC_GetClocksFreq+0x174>)
 8001e1a:	6162      	str	r2, [r4, #20]
 8001e1c:	e000      	b.n	8001e20 <RCC_GetClocksFreq+0xac>
 8001e1e:	6161      	str	r1, [r4, #20]
 8001e20:	6b2f      	ldr	r7, [r5, #48]	; 0x30
 8001e22:	2203      	movs	r2, #3
 8001e24:	4e2e      	ldr	r6, [pc, #184]	; (8001ee0 <RCC_GetClocksFreq+0x16c>)
 8001e26:	4217      	tst	r7, r2
 8001e28:	d101      	bne.n	8001e2e <RCC_GetClocksFreq+0xba>
 8001e2a:	61a3      	str	r3, [r4, #24]
 8001e2c:	e012      	b.n	8001e54 <RCC_GetClocksFreq+0xe0>
 8001e2e:	6b37      	ldr	r7, [r6, #48]	; 0x30
 8001e30:	4017      	ands	r7, r2
 8001e32:	2f01      	cmp	r7, #1
 8001e34:	d101      	bne.n	8001e3a <RCC_GetClocksFreq+0xc6>
 8001e36:	61a1      	str	r1, [r4, #24]
 8001e38:	e00c      	b.n	8001e54 <RCC_GetClocksFreq+0xe0>
 8001e3a:	6b37      	ldr	r7, [r6, #48]	; 0x30
 8001e3c:	4017      	ands	r7, r2
 8001e3e:	2f02      	cmp	r7, #2
 8001e40:	d102      	bne.n	8001e48 <RCC_GetClocksFreq+0xd4>
 8001e42:	2280      	movs	r2, #128	; 0x80
 8001e44:	0212      	lsls	r2, r2, #8
 8001e46:	e004      	b.n	8001e52 <RCC_GetClocksFreq+0xde>
 8001e48:	6b36      	ldr	r6, [r6, #48]	; 0x30
 8001e4a:	4032      	ands	r2, r6
 8001e4c:	2a03      	cmp	r2, #3
 8001e4e:	d101      	bne.n	8001e54 <RCC_GetClocksFreq+0xe0>
 8001e50:	4a25      	ldr	r2, [pc, #148]	; (8001ee8 <RCC_GetClocksFreq+0x174>)
 8001e52:	61a2      	str	r2, [r4, #24]
 8001e54:	22c0      	movs	r2, #192	; 0xc0
 8001e56:	6b2f      	ldr	r7, [r5, #48]	; 0x30
 8001e58:	0292      	lsls	r2, r2, #10
 8001e5a:	4e21      	ldr	r6, [pc, #132]	; (8001ee0 <RCC_GetClocksFreq+0x16c>)
 8001e5c:	4217      	tst	r7, r2
 8001e5e:	d101      	bne.n	8001e64 <RCC_GetClocksFreq+0xf0>
 8001e60:	61e3      	str	r3, [r4, #28]
 8001e62:	e018      	b.n	8001e96 <RCC_GetClocksFreq+0x122>
 8001e64:	6b37      	ldr	r7, [r6, #48]	; 0x30
 8001e66:	4017      	ands	r7, r2
 8001e68:	46bc      	mov	ip, r7
 8001e6a:	2780      	movs	r7, #128	; 0x80
 8001e6c:	027f      	lsls	r7, r7, #9
 8001e6e:	45bc      	cmp	ip, r7
 8001e70:	d101      	bne.n	8001e76 <RCC_GetClocksFreq+0x102>
 8001e72:	61e1      	str	r1, [r4, #28]
 8001e74:	e00f      	b.n	8001e96 <RCC_GetClocksFreq+0x122>
 8001e76:	6b37      	ldr	r7, [r6, #48]	; 0x30
 8001e78:	4017      	ands	r7, r2
 8001e7a:	46bc      	mov	ip, r7
 8001e7c:	2780      	movs	r7, #128	; 0x80
 8001e7e:	02bf      	lsls	r7, r7, #10
 8001e80:	45bc      	cmp	ip, r7
 8001e82:	d102      	bne.n	8001e8a <RCC_GetClocksFreq+0x116>
 8001e84:	2280      	movs	r2, #128	; 0x80
 8001e86:	0212      	lsls	r2, r2, #8
 8001e88:	e004      	b.n	8001e94 <RCC_GetClocksFreq+0x120>
 8001e8a:	6b36      	ldr	r6, [r6, #48]	; 0x30
 8001e8c:	4016      	ands	r6, r2
 8001e8e:	4296      	cmp	r6, r2
 8001e90:	d101      	bne.n	8001e96 <RCC_GetClocksFreq+0x122>
 8001e92:	4a15      	ldr	r2, [pc, #84]	; (8001ee8 <RCC_GetClocksFreq+0x174>)
 8001e94:	61e2      	str	r2, [r4, #28]
 8001e96:	22c0      	movs	r2, #192	; 0xc0
 8001e98:	6b2f      	ldr	r7, [r5, #48]	; 0x30
 8001e9a:	0312      	lsls	r2, r2, #12
 8001e9c:	4e10      	ldr	r6, [pc, #64]	; (8001ee0 <RCC_GetClocksFreq+0x16c>)
 8001e9e:	4217      	tst	r7, r2
 8001ea0:	d015      	beq.n	8001ece <RCC_GetClocksFreq+0x15a>
 8001ea2:	6b37      	ldr	r7, [r6, #48]	; 0x30
 8001ea4:	2380      	movs	r3, #128	; 0x80
 8001ea6:	4017      	ands	r7, r2
 8001ea8:	02db      	lsls	r3, r3, #11
 8001eaa:	429f      	cmp	r7, r3
 8001eac:	d101      	bne.n	8001eb2 <RCC_GetClocksFreq+0x13e>
 8001eae:	6221      	str	r1, [r4, #32]
 8001eb0:	e00e      	b.n	8001ed0 <RCC_GetClocksFreq+0x15c>
 8001eb2:	6b31      	ldr	r1, [r6, #48]	; 0x30
 8001eb4:	2380      	movs	r3, #128	; 0x80
 8001eb6:	4011      	ands	r1, r2
 8001eb8:	031b      	lsls	r3, r3, #12
 8001eba:	4299      	cmp	r1, r3
 8001ebc:	d102      	bne.n	8001ec4 <RCC_GetClocksFreq+0x150>
 8001ebe:	2380      	movs	r3, #128	; 0x80
 8001ec0:	021b      	lsls	r3, r3, #8
 8001ec2:	e004      	b.n	8001ece <RCC_GetClocksFreq+0x15a>
 8001ec4:	6b33      	ldr	r3, [r6, #48]	; 0x30
 8001ec6:	4013      	ands	r3, r2
 8001ec8:	4293      	cmp	r3, r2
 8001eca:	d101      	bne.n	8001ed0 <RCC_GetClocksFreq+0x15c>
 8001ecc:	4b06      	ldr	r3, [pc, #24]	; (8001ee8 <RCC_GetClocksFreq+0x174>)
 8001ece:	6223      	str	r3, [r4, #32]
 8001ed0:	6b2b      	ldr	r3, [r5, #48]	; 0x30
 8001ed2:	061a      	lsls	r2, r3, #24
 8001ed4:	d402      	bmi.n	8001edc <RCC_GetClocksFreq+0x168>
 8001ed6:	4b05      	ldr	r3, [pc, #20]	; (8001eec <RCC_GetClocksFreq+0x178>)
 8001ed8:	6263      	str	r3, [r4, #36]	; 0x24
 8001eda:	e000      	b.n	8001ede <RCC_GetClocksFreq+0x16a>
 8001edc:	6260      	str	r0, [r4, #36]	; 0x24
 8001ede:	bdf8      	pop	{r3, r4, r5, r6, r7, pc}
 8001ee0:	40021000 	.word	0x40021000
 8001ee4:	003d0900 	.word	0x003d0900
 8001ee8:	007a1200 	.word	0x007a1200
 8001eec:	02dc6c00 	.word	0x02dc6c00
 8001ef0:	20000008 	.word	0x20000008
 8001ef4:	00d59f80 	.word	0x00d59f80
 8001ef8:	00008012 	.word	0x00008012

08001efc <RCC_AHBPeriphClockCmd>:
 8001efc:	b538      	push	{r3, r4, r5, lr}
 8001efe:	4b0d      	ldr	r3, [pc, #52]	; (8001f34 <RCC_AHBPeriphClockCmd+0x38>)
 8001f00:	1c04      	adds	r4, r0, #0
 8001f02:	1c0d      	adds	r5, r1, #0
 8001f04:	2000      	movs	r0, #0
 8001f06:	421c      	tst	r4, r3
 8001f08:	d102      	bne.n	8001f10 <RCC_AHBPeriphClockCmd+0x14>
 8001f0a:	1c20      	adds	r0, r4, #0
 8001f0c:	1e43      	subs	r3, r0, #1
 8001f0e:	4198      	sbcs	r0, r3
 8001f10:	f7fe fe74 	bl	8000bfc <assert_param>
 8001f14:	2301      	movs	r3, #1
 8001f16:	2000      	movs	r0, #0
 8001f18:	42ab      	cmp	r3, r5
 8001f1a:	4140      	adcs	r0, r0
 8001f1c:	f7fe fe6e 	bl	8000bfc <assert_param>
 8001f20:	4b05      	ldr	r3, [pc, #20]	; (8001f38 <RCC_AHBPeriphClockCmd+0x3c>)
 8001f22:	695a      	ldr	r2, [r3, #20]
 8001f24:	2d00      	cmp	r5, #0
 8001f26:	d002      	beq.n	8001f2e <RCC_AHBPeriphClockCmd+0x32>
 8001f28:	4314      	orrs	r4, r2
 8001f2a:	615c      	str	r4, [r3, #20]
 8001f2c:	e001      	b.n	8001f32 <RCC_AHBPeriphClockCmd+0x36>
 8001f2e:	43a2      	bics	r2, r4
 8001f30:	615a      	str	r2, [r3, #20]
 8001f32:	bd38      	pop	{r3, r4, r5, pc}
 8001f34:	fe81ffa8 	.word	0xfe81ffa8
 8001f38:	40021000 	.word	0x40021000

08001f3c <RCC_APB2PeriphClockCmd>:
 8001f3c:	b538      	push	{r3, r4, r5, lr}
 8001f3e:	4b0d      	ldr	r3, [pc, #52]	; (8001f74 <RCC_APB2PeriphClockCmd+0x38>)
 8001f40:	1c04      	adds	r4, r0, #0
 8001f42:	1c0d      	adds	r5, r1, #0
 8001f44:	2000      	movs	r0, #0
 8001f46:	421c      	tst	r4, r3
 8001f48:	d102      	bne.n	8001f50 <RCC_APB2PeriphClockCmd+0x14>
 8001f4a:	1c20      	adds	r0, r4, #0
 8001f4c:	1e43      	subs	r3, r0, #1
 8001f4e:	4198      	sbcs	r0, r3
 8001f50:	f7fe fe54 	bl	8000bfc <assert_param>
 8001f54:	2301      	movs	r3, #1
 8001f56:	2000      	movs	r0, #0
 8001f58:	42ab      	cmp	r3, r5
 8001f5a:	4140      	adcs	r0, r0
 8001f5c:	f7fe fe4e 	bl	8000bfc <assert_param>
 8001f60:	4b05      	ldr	r3, [pc, #20]	; (8001f78 <RCC_APB2PeriphClockCmd+0x3c>)
 8001f62:	699a      	ldr	r2, [r3, #24]
 8001f64:	2d00      	cmp	r5, #0
 8001f66:	d002      	beq.n	8001f6e <RCC_APB2PeriphClockCmd+0x32>
 8001f68:	4314      	orrs	r4, r2
 8001f6a:	619c      	str	r4, [r3, #24]
 8001f6c:	e001      	b.n	8001f72 <RCC_APB2PeriphClockCmd+0x36>
 8001f6e:	43a2      	bics	r2, r4
 8001f70:	619a      	str	r2, [r3, #24]
 8001f72:	bd38      	pop	{r3, r4, r5, pc}
 8001f74:	ffb8a51e 	.word	0xffb8a51e
 8001f78:	40021000 	.word	0x40021000

08001f7c <RCC_APB1PeriphClockCmd>:
 8001f7c:	b538      	push	{r3, r4, r5, lr}
 8001f7e:	4b0d      	ldr	r3, [pc, #52]	; (8001fb4 <RCC_APB1PeriphClockCmd+0x38>)
 8001f80:	1c04      	adds	r4, r0, #0
 8001f82:	1c0d      	adds	r5, r1, #0
 8001f84:	2000      	movs	r0, #0
 8001f86:	421c      	tst	r4, r3
 8001f88:	d102      	bne.n	8001f90 <RCC_APB1PeriphClockCmd+0x14>
 8001f8a:	1c20      	adds	r0, r4, #0
 8001f8c:	1e43      	subs	r3, r0, #1
 8001f8e:	4198      	sbcs	r0, r3
 8001f90:	f7fe fe34 	bl	8000bfc <assert_param>
 8001f94:	2301      	movs	r3, #1
 8001f96:	2000      	movs	r0, #0
 8001f98:	42ab      	cmp	r3, r5
 8001f9a:	4140      	adcs	r0, r0
 8001f9c:	f7fe fe2e 	bl	8000bfc <assert_param>
 8001fa0:	4b05      	ldr	r3, [pc, #20]	; (8001fb8 <RCC_APB1PeriphClockCmd+0x3c>)
 8001fa2:	69da      	ldr	r2, [r3, #28]
 8001fa4:	2d00      	cmp	r5, #0
 8001fa6:	d002      	beq.n	8001fae <RCC_APB1PeriphClockCmd+0x32>
 8001fa8:	4314      	orrs	r4, r2
 8001faa:	61dc      	str	r4, [r3, #28]
 8001fac:	e001      	b.n	8001fb2 <RCC_APB1PeriphClockCmd+0x36>
 8001fae:	43a2      	bics	r2, r4
 8001fb0:	61da      	str	r2, [r3, #28]
 8001fb2:	bd38      	pop	{r3, r4, r5, pc}
 8001fb4:	8581b6cc 	.word	0x8581b6cc
 8001fb8:	40021000 	.word	0x40021000

08001fbc <RCC_APB2PeriphResetCmd>:
 8001fbc:	b538      	push	{r3, r4, r5, lr}
 8001fbe:	4b0d      	ldr	r3, [pc, #52]	; (8001ff4 <RCC_APB2PeriphResetCmd+0x38>)
 8001fc0:	1c04      	adds	r4, r0, #0
 8001fc2:	1c0d      	adds	r5, r1, #0
 8001fc4:	2000      	movs	r0, #0
 8001fc6:	421c      	tst	r4, r3
 8001fc8:	d102      	bne.n	8001fd0 <RCC_APB2PeriphResetCmd+0x14>
 8001fca:	1c20      	adds	r0, r4, #0
 8001fcc:	1e43      	subs	r3, r0, #1
 8001fce:	4198      	sbcs	r0, r3
 8001fd0:	f7fe fe14 	bl	8000bfc <assert_param>
 8001fd4:	2301      	movs	r3, #1
 8001fd6:	2000      	movs	r0, #0
 8001fd8:	42ab      	cmp	r3, r5
 8001fda:	4140      	adcs	r0, r0
 8001fdc:	f7fe fe0e 	bl	8000bfc <assert_param>
 8001fe0:	4b05      	ldr	r3, [pc, #20]	; (8001ff8 <RCC_APB2PeriphResetCmd+0x3c>)
 8001fe2:	68da      	ldr	r2, [r3, #12]
 8001fe4:	2d00      	cmp	r5, #0
 8001fe6:	d002      	beq.n	8001fee <RCC_APB2PeriphResetCmd+0x32>
 8001fe8:	4314      	orrs	r4, r2
 8001fea:	60dc      	str	r4, [r3, #12]
 8001fec:	e001      	b.n	8001ff2 <RCC_APB2PeriphResetCmd+0x36>
 8001fee:	43a2      	bics	r2, r4
 8001ff0:	60da      	str	r2, [r3, #12]
 8001ff2:	bd38      	pop	{r3, r4, r5, pc}
 8001ff4:	ffb8a51e 	.word	0xffb8a51e
 8001ff8:	40021000 	.word	0x40021000

08001ffc <RCC_GetFlagStatus>:
 8001ffc:	2310      	movs	r3, #16
 8001ffe:	b510      	push	{r4, lr}
 8002000:	1c04      	adds	r4, r0, #0
 8002002:	4398      	bics	r0, r3
 8002004:	2801      	cmp	r0, #1
 8002006:	d015      	beq.n	8002034 <RCC_GetFlagStatus+0x38>
 8002008:	2c19      	cmp	r4, #25
 800200a:	d012      	beq.n	8002032 <RCC_GetFlagStatus+0x36>
 800200c:	2340      	movs	r3, #64	; 0x40
 800200e:	1c22      	adds	r2, r4, #0
 8002010:	439a      	bics	r2, r3
 8002012:	2a21      	cmp	r2, #33	; 0x21
 8002014:	d00d      	beq.n	8002032 <RCC_GetFlagStatus+0x36>
 8002016:	2c41      	cmp	r4, #65	; 0x41
 8002018:	d00b      	beq.n	8002032 <RCC_GetFlagStatus+0x36>
 800201a:	1c23      	adds	r3, r4, #0
 800201c:	3b59      	subs	r3, #89	; 0x59
 800201e:	b2db      	uxtb	r3, r3
 8002020:	2b06      	cmp	r3, #6
 8002022:	d906      	bls.n	8002032 <RCC_GetFlagStatus+0x36>
 8002024:	2c71      	cmp	r4, #113	; 0x71
 8002026:	d004      	beq.n	8002032 <RCC_GetFlagStatus+0x36>
 8002028:	1c20      	adds	r0, r4, #0
 800202a:	3857      	subs	r0, #87	; 0x57
 800202c:	4243      	negs	r3, r0
 800202e:	4158      	adcs	r0, r3
 8002030:	e000      	b.n	8002034 <RCC_GetFlagStatus+0x38>
 8002032:	2001      	movs	r0, #1
 8002034:	f7fe fde2 	bl	8000bfc <assert_param>
 8002038:	0962      	lsrs	r2, r4, #5
 800203a:	4b0a      	ldr	r3, [pc, #40]	; (8002064 <RCC_GetFlagStatus+0x68>)
 800203c:	d101      	bne.n	8002042 <RCC_GetFlagStatus+0x46>
 800203e:	681b      	ldr	r3, [r3, #0]
 8002040:	e008      	b.n	8002054 <RCC_GetFlagStatus+0x58>
 8002042:	2a01      	cmp	r2, #1
 8002044:	d101      	bne.n	800204a <RCC_GetFlagStatus+0x4e>
 8002046:	6a1b      	ldr	r3, [r3, #32]
 8002048:	e004      	b.n	8002054 <RCC_GetFlagStatus+0x58>
 800204a:	2a02      	cmp	r2, #2
 800204c:	d101      	bne.n	8002052 <RCC_GetFlagStatus+0x56>
 800204e:	6a5b      	ldr	r3, [r3, #36]	; 0x24
 8002050:	e000      	b.n	8002054 <RCC_GetFlagStatus+0x58>
 8002052:	6b5b      	ldr	r3, [r3, #52]	; 0x34
 8002054:	201f      	movs	r0, #31
 8002056:	4004      	ands	r4, r0
 8002058:	1c18      	adds	r0, r3, #0
 800205a:	40e0      	lsrs	r0, r4
 800205c:	2201      	movs	r2, #1
 800205e:	4010      	ands	r0, r2
 8002060:	bd10      	pop	{r4, pc}
 8002062:	46c0      	nop			; (mov r8, r8)
 8002064:	40021000 	.word	0x40021000

08002068 <gpio_init>:
 8002068:	b5f7      	push	{r0, r1, r2, r4, r5, r6, r7, lr}
 800206a:	2080      	movs	r0, #128	; 0x80
 800206c:	0280      	lsls	r0, r0, #10
 800206e:	2101      	movs	r1, #1
 8002070:	f7ff ff44 	bl	8001efc <RCC_AHBPeriphClockCmd>
 8002074:	2080      	movs	r0, #128	; 0x80
 8002076:	02c0      	lsls	r0, r0, #11
 8002078:	2101      	movs	r1, #1
 800207a:	f7ff ff3f 	bl	8001efc <RCC_AHBPeriphClockCmd>
 800207e:	2208      	movs	r2, #8
 8002080:	2400      	movs	r4, #0
 8002082:	466b      	mov	r3, sp
 8002084:	2603      	movs	r6, #3
 8002086:	9200      	str	r2, [sp, #0]
 8002088:	4669      	mov	r1, sp
 800208a:	2201      	movs	r2, #1
 800208c:	481c      	ldr	r0, [pc, #112]	; (8002100 <gpio_init+0x98>)
 800208e:	715e      	strb	r6, [r3, #5]
 8002090:	711a      	strb	r2, [r3, #4]
 8002092:	719c      	strb	r4, [r3, #6]
 8002094:	71dc      	strb	r4, [r3, #7]
 8002096:	2590      	movs	r5, #144	; 0x90
 8002098:	f7ff f884 	bl	80011a4 <GPIO_Init>
 800209c:	2380      	movs	r3, #128	; 0x80
 800209e:	05ed      	lsls	r5, r5, #23
 80020a0:	005b      	lsls	r3, r3, #1
 80020a2:	466a      	mov	r2, sp
 80020a4:	1c28      	adds	r0, r5, #0
 80020a6:	9300      	str	r3, [sp, #0]
 80020a8:	4669      	mov	r1, sp
 80020aa:	2301      	movs	r3, #1
 80020ac:	2780      	movs	r7, #128	; 0x80
 80020ae:	7156      	strb	r6, [r2, #5]
 80020b0:	013f      	lsls	r7, r7, #4
 80020b2:	7113      	strb	r3, [r2, #4]
 80020b4:	7194      	strb	r4, [r2, #6]
 80020b6:	71d4      	strb	r4, [r2, #7]
 80020b8:	f7ff f874 	bl	80011a4 <GPIO_Init>
 80020bc:	466a      	mov	r2, sp
 80020be:	1c28      	adds	r0, r5, #0
 80020c0:	2301      	movs	r3, #1
 80020c2:	4669      	mov	r1, sp
 80020c4:	7156      	strb	r6, [r2, #5]
 80020c6:	9700      	str	r7, [sp, #0]
 80020c8:	7113      	strb	r3, [r2, #4]
 80020ca:	7194      	strb	r4, [r2, #6]
 80020cc:	71d4      	strb	r4, [r2, #7]
 80020ce:	f7ff f869 	bl	80011a4 <GPIO_Init>
 80020d2:	2202      	movs	r2, #2
 80020d4:	466b      	mov	r3, sp
 80020d6:	9200      	str	r2, [sp, #0]
 80020d8:	1c28      	adds	r0, r5, #0
 80020da:	2201      	movs	r2, #1
 80020dc:	4669      	mov	r1, sp
 80020de:	715e      	strb	r6, [r3, #5]
 80020e0:	711a      	strb	r2, [r3, #4]
 80020e2:	719c      	strb	r4, [r3, #6]
 80020e4:	71dc      	strb	r4, [r3, #7]
 80020e6:	f7ff f85d 	bl	80011a4 <GPIO_Init>
 80020ea:	4b05      	ldr	r3, [pc, #20]	; (8002100 <gpio_init+0x98>)
 80020ec:	2208      	movs	r2, #8
 80020ee:	851a      	strh	r2, [r3, #40]	; 0x28
 80020f0:	2380      	movs	r3, #128	; 0x80
 80020f2:	005b      	lsls	r3, r3, #1
 80020f4:	2202      	movs	r2, #2
 80020f6:	852b      	strh	r3, [r5, #40]	; 0x28
 80020f8:	852f      	strh	r7, [r5, #40]	; 0x28
 80020fa:	852a      	strh	r2, [r5, #40]	; 0x28
 80020fc:	bdf7      	pop	{r0, r1, r2, r4, r5, r6, r7, pc}
 80020fe:	46c0      	nop			; (mov r8, r8)
 8002100:	48000400 	.word	0x48000400

08002104 <led_on>:
 8002104:	2808      	cmp	r0, #8
 8002106:	d101      	bne.n	800210c <led_on+0x8>
 8002108:	4b07      	ldr	r3, [pc, #28]	; (8002128 <led_on+0x24>)
 800210a:	e00b      	b.n	8002124 <led_on+0x20>
 800210c:	2380      	movs	r3, #128	; 0x80
 800210e:	005b      	lsls	r3, r3, #1
 8002110:	4298      	cmp	r0, r3
 8002112:	d005      	beq.n	8002120 <led_on+0x1c>
 8002114:	2380      	movs	r3, #128	; 0x80
 8002116:	011b      	lsls	r3, r3, #4
 8002118:	4298      	cmp	r0, r3
 800211a:	d001      	beq.n	8002120 <led_on+0x1c>
 800211c:	2802      	cmp	r0, #2
 800211e:	d102      	bne.n	8002126 <led_on+0x22>
 8002120:	2390      	movs	r3, #144	; 0x90
 8002122:	05db      	lsls	r3, r3, #23
 8002124:	6198      	str	r0, [r3, #24]
 8002126:	4770      	bx	lr
 8002128:	48000400 	.word	0x48000400

0800212c <led_off>:
 800212c:	2808      	cmp	r0, #8
 800212e:	d101      	bne.n	8002134 <led_off+0x8>
 8002130:	4b07      	ldr	r3, [pc, #28]	; (8002150 <led_off+0x24>)
 8002132:	e00b      	b.n	800214c <led_off+0x20>
 8002134:	2380      	movs	r3, #128	; 0x80
 8002136:	005b      	lsls	r3, r3, #1
 8002138:	4298      	cmp	r0, r3
 800213a:	d005      	beq.n	8002148 <led_off+0x1c>
 800213c:	2380      	movs	r3, #128	; 0x80
 800213e:	011b      	lsls	r3, r3, #4
 8002140:	4298      	cmp	r0, r3
 8002142:	d001      	beq.n	8002148 <led_off+0x1c>
 8002144:	2802      	cmp	r0, #2
 8002146:	d102      	bne.n	800214e <led_off+0x22>
 8002148:	2390      	movs	r3, #144	; 0x90
 800214a:	05db      	lsls	r3, r3, #23
 800214c:	8518      	strh	r0, [r3, #40]	; 0x28
 800214e:	4770      	bx	lr
 8002150:	48000400 	.word	0x48000400

08002154 <Default_Handler>:
 8002154:	4770      	bx	lr
	...

08002158 <HardFault_Handler>:
 8002158:	2008      	movs	r0, #8
 800215a:	f7ff ffd3 	bl	8002104 <led_on>
 800215e:	4b07      	ldr	r3, [pc, #28]	; (800217c <HardFault_Handler+0x24>)
 8002160:	3b01      	subs	r3, #1
 8002162:	2b00      	cmp	r3, #0
 8002164:	d001      	beq.n	800216a <HardFault_Handler+0x12>
 8002166:	46c0      	nop			; (mov r8, r8)
 8002168:	e7fa      	b.n	8002160 <HardFault_Handler+0x8>
 800216a:	2008      	movs	r0, #8
 800216c:	f7ff ffde 	bl	800212c <led_off>
 8002170:	4b02      	ldr	r3, [pc, #8]	; (800217c <HardFault_Handler+0x24>)
 8002172:	3b01      	subs	r3, #1
 8002174:	2b00      	cmp	r3, #0
 8002176:	d0ef      	beq.n	8002158 <HardFault_Handler>
 8002178:	46c0      	nop			; (mov r8, r8)
 800217a:	e7fa      	b.n	8002172 <HardFault_Handler+0x1a>
 800217c:	002dc6c1 	.word	0x002dc6c1

08002180 <_reset_init>:
 8002180:	4a07      	ldr	r2, [pc, #28]	; (80021a0 <_reset_init+0x20>)
 8002182:	4908      	ldr	r1, [pc, #32]	; (80021a4 <_reset_init+0x24>)
 8002184:	2300      	movs	r3, #0
 8002186:	1a89      	subs	r1, r1, r2
 8002188:	1089      	asrs	r1, r1, #2
 800218a:	1c10      	adds	r0, r2, #0
 800218c:	428b      	cmp	r3, r1
 800218e:	d005      	beq.n	800219c <_reset_init+0x1c>
 8002190:	4c05      	ldr	r4, [pc, #20]	; (80021a8 <_reset_init+0x28>)
 8002192:	009a      	lsls	r2, r3, #2
 8002194:	58a4      	ldr	r4, [r4, r2]
 8002196:	3301      	adds	r3, #1
 8002198:	5084      	str	r4, [r0, r2]
 800219a:	e7f7      	b.n	800218c <_reset_init+0xc>
 800219c:	f7fe fb0a 	bl	80007b4 <main>
 80021a0:	20000000 	.word	0x20000000
 80021a4:	20000018 	.word	0x20000018
 80021a8:	08002420 	.word	0x08002420

080021ac <__gnu_thumb1_case_uqi>:
 80021ac:	b402      	push	{r1}
 80021ae:	4671      	mov	r1, lr
 80021b0:	0849      	lsrs	r1, r1, #1
 80021b2:	0049      	lsls	r1, r1, #1
 80021b4:	5c09      	ldrb	r1, [r1, r0]
 80021b6:	0049      	lsls	r1, r1, #1
 80021b8:	448e      	add	lr, r1
 80021ba:	bc02      	pop	{r1}
 80021bc:	4770      	bx	lr
 80021be:	46c0      	nop			; (mov r8, r8)

080021c0 <__aeabi_uidiv>:
 80021c0:	2900      	cmp	r1, #0
 80021c2:	d034      	beq.n	800222e <.udivsi3_skip_div0_test+0x6a>

080021c4 <.udivsi3_skip_div0_test>:
 80021c4:	2301      	movs	r3, #1
 80021c6:	2200      	movs	r2, #0
 80021c8:	b410      	push	{r4}
 80021ca:	4288      	cmp	r0, r1
 80021cc:	d32c      	bcc.n	8002228 <.udivsi3_skip_div0_test+0x64>
 80021ce:	2401      	movs	r4, #1
 80021d0:	0724      	lsls	r4, r4, #28
 80021d2:	42a1      	cmp	r1, r4
 80021d4:	d204      	bcs.n	80021e0 <.udivsi3_skip_div0_test+0x1c>
 80021d6:	4281      	cmp	r1, r0
 80021d8:	d202      	bcs.n	80021e0 <.udivsi3_skip_div0_test+0x1c>
 80021da:	0109      	lsls	r1, r1, #4
 80021dc:	011b      	lsls	r3, r3, #4
 80021de:	e7f8      	b.n	80021d2 <.udivsi3_skip_div0_test+0xe>
 80021e0:	00e4      	lsls	r4, r4, #3
 80021e2:	42a1      	cmp	r1, r4
 80021e4:	d204      	bcs.n	80021f0 <.udivsi3_skip_div0_test+0x2c>
 80021e6:	4281      	cmp	r1, r0
 80021e8:	d202      	bcs.n	80021f0 <.udivsi3_skip_div0_test+0x2c>
 80021ea:	0049      	lsls	r1, r1, #1
 80021ec:	005b      	lsls	r3, r3, #1
 80021ee:	e7f8      	b.n	80021e2 <.udivsi3_skip_div0_test+0x1e>
 80021f0:	4288      	cmp	r0, r1
 80021f2:	d301      	bcc.n	80021f8 <.udivsi3_skip_div0_test+0x34>
 80021f4:	1a40      	subs	r0, r0, r1
 80021f6:	431a      	orrs	r2, r3
 80021f8:	084c      	lsrs	r4, r1, #1
 80021fa:	42a0      	cmp	r0, r4
 80021fc:	d302      	bcc.n	8002204 <.udivsi3_skip_div0_test+0x40>
 80021fe:	1b00      	subs	r0, r0, r4
 8002200:	085c      	lsrs	r4, r3, #1
 8002202:	4322      	orrs	r2, r4
 8002204:	088c      	lsrs	r4, r1, #2
 8002206:	42a0      	cmp	r0, r4
 8002208:	d302      	bcc.n	8002210 <.udivsi3_skip_div0_test+0x4c>
 800220a:	1b00      	subs	r0, r0, r4
 800220c:	089c      	lsrs	r4, r3, #2
 800220e:	4322      	orrs	r2, r4
 8002210:	08cc      	lsrs	r4, r1, #3
 8002212:	42a0      	cmp	r0, r4
 8002214:	d302      	bcc.n	800221c <.udivsi3_skip_div0_test+0x58>
 8002216:	1b00      	subs	r0, r0, r4
 8002218:	08dc      	lsrs	r4, r3, #3
 800221a:	4322      	orrs	r2, r4
 800221c:	2800      	cmp	r0, #0
 800221e:	d003      	beq.n	8002228 <.udivsi3_skip_div0_test+0x64>
 8002220:	091b      	lsrs	r3, r3, #4
 8002222:	d001      	beq.n	8002228 <.udivsi3_skip_div0_test+0x64>
 8002224:	0909      	lsrs	r1, r1, #4
 8002226:	e7e3      	b.n	80021f0 <.udivsi3_skip_div0_test+0x2c>
 8002228:	1c10      	adds	r0, r2, #0
 800222a:	bc10      	pop	{r4}
 800222c:	4770      	bx	lr
 800222e:	2800      	cmp	r0, #0
 8002230:	d001      	beq.n	8002236 <.udivsi3_skip_div0_test+0x72>
 8002232:	2000      	movs	r0, #0
 8002234:	43c0      	mvns	r0, r0
 8002236:	b407      	push	{r0, r1, r2}
 8002238:	4802      	ldr	r0, [pc, #8]	; (8002244 <.udivsi3_skip_div0_test+0x80>)
 800223a:	a102      	add	r1, pc, #8	; (adr r1, 8002244 <.udivsi3_skip_div0_test+0x80>)
 800223c:	1840      	adds	r0, r0, r1
 800223e:	9002      	str	r0, [sp, #8]
 8002240:	bd03      	pop	{r0, r1, pc}
 8002242:	46c0      	nop			; (mov r8, r8)
 8002244:	000000d9 	.word	0x000000d9

08002248 <__aeabi_uidivmod>:
 8002248:	2900      	cmp	r1, #0
 800224a:	d0f0      	beq.n	800222e <.udivsi3_skip_div0_test+0x6a>
 800224c:	b503      	push	{r0, r1, lr}
 800224e:	f7ff ffb9 	bl	80021c4 <.udivsi3_skip_div0_test>
 8002252:	bc0e      	pop	{r1, r2, r3}
 8002254:	4342      	muls	r2, r0
 8002256:	1a89      	subs	r1, r1, r2
 8002258:	4718      	bx	r3
 800225a:	46c0      	nop			; (mov r8, r8)

0800225c <__aeabi_idiv>:
 800225c:	2900      	cmp	r1, #0
 800225e:	d041      	beq.n	80022e4 <.divsi3_skip_div0_test+0x84>

08002260 <.divsi3_skip_div0_test>:
 8002260:	b410      	push	{r4}
 8002262:	1c04      	adds	r4, r0, #0
 8002264:	404c      	eors	r4, r1
 8002266:	46a4      	mov	ip, r4
 8002268:	2301      	movs	r3, #1
 800226a:	2200      	movs	r2, #0
 800226c:	2900      	cmp	r1, #0
 800226e:	d500      	bpl.n	8002272 <.divsi3_skip_div0_test+0x12>
 8002270:	4249      	negs	r1, r1
 8002272:	2800      	cmp	r0, #0
 8002274:	d500      	bpl.n	8002278 <.divsi3_skip_div0_test+0x18>
 8002276:	4240      	negs	r0, r0
 8002278:	4288      	cmp	r0, r1
 800227a:	d32c      	bcc.n	80022d6 <.divsi3_skip_div0_test+0x76>
 800227c:	2401      	movs	r4, #1
 800227e:	0724      	lsls	r4, r4, #28
 8002280:	42a1      	cmp	r1, r4
 8002282:	d204      	bcs.n	800228e <.divsi3_skip_div0_test+0x2e>
 8002284:	4281      	cmp	r1, r0
 8002286:	d202      	bcs.n	800228e <.divsi3_skip_div0_test+0x2e>
 8002288:	0109      	lsls	r1, r1, #4
 800228a:	011b      	lsls	r3, r3, #4
 800228c:	e7f8      	b.n	8002280 <.divsi3_skip_div0_test+0x20>
 800228e:	00e4      	lsls	r4, r4, #3
 8002290:	42a1      	cmp	r1, r4
 8002292:	d204      	bcs.n	800229e <.divsi3_skip_div0_test+0x3e>
 8002294:	4281      	cmp	r1, r0
 8002296:	d202      	bcs.n	800229e <.divsi3_skip_div0_test+0x3e>
 8002298:	0049      	lsls	r1, r1, #1
 800229a:	005b      	lsls	r3, r3, #1
 800229c:	e7f8      	b.n	8002290 <.divsi3_skip_div0_test+0x30>
 800229e:	4288      	cmp	r0, r1
 80022a0:	d301      	bcc.n	80022a6 <.divsi3_skip_div0_test+0x46>
 80022a2:	1a40      	subs	r0, r0, r1
 80022a4:	431a      	orrs	r2, r3
 80022a6:	084c      	lsrs	r4, r1, #1
 80022a8:	42a0      	cmp	r0, r4
 80022aa:	d302      	bcc.n	80022b2 <.divsi3_skip_div0_test+0x52>
 80022ac:	1b00      	subs	r0, r0, r4
 80022ae:	085c      	lsrs	r4, r3, #1
 80022b0:	4322      	orrs	r2, r4
 80022b2:	088c      	lsrs	r4, r1, #2
 80022b4:	42a0      	cmp	r0, r4
 80022b6:	d302      	bcc.n	80022be <.divsi3_skip_div0_test+0x5e>
 80022b8:	1b00      	subs	r0, r0, r4
 80022ba:	089c      	lsrs	r4, r3, #2
 80022bc:	4322      	orrs	r2, r4
 80022be:	08cc      	lsrs	r4, r1, #3
 80022c0:	42a0      	cmp	r0, r4
 80022c2:	d302      	bcc.n	80022ca <.divsi3_skip_div0_test+0x6a>
 80022c4:	1b00      	subs	r0, r0, r4
 80022c6:	08dc      	lsrs	r4, r3, #3
 80022c8:	4322      	orrs	r2, r4
 80022ca:	2800      	cmp	r0, #0
 80022cc:	d003      	beq.n	80022d6 <.divsi3_skip_div0_test+0x76>
 80022ce:	091b      	lsrs	r3, r3, #4
 80022d0:	d001      	beq.n	80022d6 <.divsi3_skip_div0_test+0x76>
 80022d2:	0909      	lsrs	r1, r1, #4
 80022d4:	e7e3      	b.n	800229e <.divsi3_skip_div0_test+0x3e>
 80022d6:	1c10      	adds	r0, r2, #0
 80022d8:	4664      	mov	r4, ip
 80022da:	2c00      	cmp	r4, #0
 80022dc:	d500      	bpl.n	80022e0 <.divsi3_skip_div0_test+0x80>
 80022de:	4240      	negs	r0, r0
 80022e0:	bc10      	pop	{r4}
 80022e2:	4770      	bx	lr
 80022e4:	2800      	cmp	r0, #0
 80022e6:	d006      	beq.n	80022f6 <.divsi3_skip_div0_test+0x96>
 80022e8:	db03      	blt.n	80022f2 <.divsi3_skip_div0_test+0x92>
 80022ea:	2000      	movs	r0, #0
 80022ec:	43c0      	mvns	r0, r0
 80022ee:	0840      	lsrs	r0, r0, #1
 80022f0:	e001      	b.n	80022f6 <.divsi3_skip_div0_test+0x96>
 80022f2:	2080      	movs	r0, #128	; 0x80
 80022f4:	0600      	lsls	r0, r0, #24
 80022f6:	b407      	push	{r0, r1, r2}
 80022f8:	4802      	ldr	r0, [pc, #8]	; (8002304 <.divsi3_skip_div0_test+0xa4>)
 80022fa:	a102      	add	r1, pc, #8	; (adr r1, 8002304 <.divsi3_skip_div0_test+0xa4>)
 80022fc:	1840      	adds	r0, r0, r1
 80022fe:	9002      	str	r0, [sp, #8]
 8002300:	bd03      	pop	{r0, r1, pc}
 8002302:	46c0      	nop			; (mov r8, r8)
 8002304:	00000019 	.word	0x00000019

08002308 <__aeabi_idivmod>:
 8002308:	2900      	cmp	r1, #0
 800230a:	d0eb      	beq.n	80022e4 <.divsi3_skip_div0_test+0x84>
 800230c:	b503      	push	{r0, r1, lr}
 800230e:	f7ff ffa7 	bl	8002260 <.divsi3_skip_div0_test>
 8002312:	bc0e      	pop	{r1, r2, r3}
 8002314:	4342      	muls	r2, r0
 8002316:	1a89      	subs	r1, r1, r2
 8002318:	4718      	bx	r3
 800231a:	46c0      	nop			; (mov r8, r8)

0800231c <__aeabi_idiv0>:
 800231c:	4770      	bx	lr
 800231e:	46c0      	nop			; (mov r8, r8)

08002320 <_init>:
 8002320:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
 8002322:	46c0      	nop			; (mov r8, r8)
 8002324:	bcf8      	pop	{r3, r4, r5, r6, r7}
 8002326:	bc08      	pop	{r3}
 8002328:	469e      	mov	lr, r3
 800232a:	4770      	bx	lr

0800232c <_fini>:
 800232c:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
 800232e:	46c0      	nop			; (mov r8, r8)
 8002330:	bcf8      	pop	{r3, r4, r5, r6, r7}
 8002332:	bc08      	pop	{r3}
 8002334:	469e      	mov	lr, r3
 8002336:	4770      	bx	lr
 8002338:	69647473 	.word	0x69647473
 800233c:	6e69206f 	.word	0x6e69206f
 8002340:	64207469 	.word	0x64207469
 8002344:	0a656e6f 	.word	0x0a656e6f
 8002348:	00          	.byte	0x00
 8002349:	63          	.byte	0x63
 800234a:	6d6f      	.short	0x6d6f
 800234c:	6874206d 	.word	0x6874206d
 8002350:	64616572 	.word	0x64616572
 8002354:	61747320 	.word	0x61747320
 8002358:	6e697472 	.word	0x6e697472
 800235c:	4f000a67 	.word	0x4f000a67
 8002360:	203a204b 	.word	0x203a204b
 8002364:	6e676973 	.word	0x6e676973
 8002368:	25206c61 	.word	0x25206c61
 800236c:	203e2075 	.word	0x203e2075
 8002370:	00632500 	.word	0x00632500
 8002374:	73205852 	.word	0x73205852
 8002378:	74726174 	.word	0x74726174
 800237c:	72726520 	.word	0x72726520
 8002380:	000a726f 	.word	0x000a726f
 8002384:	63205852 	.word	0x63205852
 8002388:	65206372 	.word	0x65206372
 800238c:	726f7272 	.word	0x726f7272
 8002390:	770a000a 	.word	0x770a000a
 8002394:	6f636c65 	.word	0x6f636c65
 8002398:	7420656d 	.word	0x7420656d
 800239c:	7553206f 	.word	0x7553206f
 80023a0:	6168757a 	.word	0x6168757a
 80023a4:	5e20534f 	.word	0x5e20534f
 80023a8:	32205e5f 	.word	0x32205e5f
 80023ac:	302e322e 	.word	0x302e322e
 80023b0:	4955420a 	.word	0x4955420a
 80023b4:	4d20444c 	.word	0x4d20444c
 80023b8:	32207261 	.word	0x32207261
 80023bc:	30322036 	.word	0x30322036
 80023c0:	31203631 	.word	0x31203631
 80023c4:	37343a33 	.word	0x37343a33
 80023c8:	0a30313a 	.word	0x0a30313a
 80023cc:	00          	.byte	0x00
 80023cd:	62          	.byte	0x62
 80023ce:	6f6f      	.short	0x6f6f
 80023d0:	676e6974 	.word	0x676e6974
 80023d4:	6f726620 	.word	0x6f726620
 80023d8:	7525206d 	.word	0x7525206d
 80023dc:	6172000a 	.word	0x6172000a
 80023e0:	7473206d 	.word	0x7473206d
 80023e4:	20747261 	.word	0x20747261
 80023e8:	0a207525 	.word	0x0a207525
 80023ec:	6d617200 	.word	0x6d617200
 80023f0:	7a697320 	.word	0x7a697320
 80023f4:	75252065 	.word	0x75252065
 80023f8:	72000a20 	.word	0x72000a20
 80023fc:	66206d61 	.word	0x66206d61
 8002400:	20656572 	.word	0x20656572
 8002404:	0a207525 	.word	0x0a207525
 8002408:	61656800 	.word	0x61656800
 800240c:	74732070 	.word	0x74732070
 8002410:	20747261 	.word	0x20747261
 8002414:	0a207525 	.word	0x0a207525
 8002418:	000a0a00 	.word	0x000a0a00

0800241c <__EH_FRAME_BEGIN__>:
 800241c:	00000000                                ....
