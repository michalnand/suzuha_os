
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
 80000dc:	20000070 	.word	0x20000070
 80000e0:	20000010 	.word	0x20000010

080000e4 <null_thread>:
 80000e4:	b508      	push	{r3, lr}
 80000e6:	f001 f851 	bl	800118c <sleep>
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
 800014c:	20000010 	.word	0x20000010
 8000150:	20000070 	.word	0x20000070

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
 80001a4:	20000070 	.word	0x20000070
 80001a8:	20000010 	.word	0x20000010

080001ac <sched_off>:
 80001ac:	b672      	cpsid	i
 80001ae:	4770      	bx	lr

080001b0 <sched_on>:
 80001b0:	b662      	cpsie	i
 80001b2:	4770      	bx	lr

080001b4 <yield>:
 80001b4:	46c0      	nop			; (mov r8, r8)
 80001b6:	4770      	bx	lr

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
 80001cc:	20000070 	.word	0x20000070

080001d0 <kernel_start>:
 80001d0:	b508      	push	{r3, lr}
 80001d2:	f000 ffcf 	bl	8001174 <sys_tick_init>
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
 8000254:	20000010 	.word	0x20000010
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
 8000290:	20000010 	.word	0x20000010
 8000294:	20000070 	.word	0x20000070
 8000298:	20000074 	.word	0x20000074
 800029c:	080000e5 	.word	0x080000e5

080002a0 <set_wait_state>:
 80002a0:	b507      	push	{r0, r1, r2, lr}
 80002a2:	f7ff ff89 	bl	80001b8 <get_thread_id>
 80002a6:	9000      	str	r0, [sp, #0]
 80002a8:	b672      	cpsid	i
 80002aa:	9a00      	ldr	r2, [sp, #0]
 80002ac:	210c      	movs	r1, #12
 80002ae:	434a      	muls	r2, r1
 80002b0:	4b0b      	ldr	r3, [pc, #44]	; (80002e0 <set_wait_state+0x40>)
 80002b2:	2002      	movs	r0, #2
 80002b4:	189a      	adds	r2, r3, r2
 80002b6:	6851      	ldr	r1, [r2, #4]
 80002b8:	4301      	orrs	r1, r0
 80002ba:	6051      	str	r1, [r2, #4]
 80002bc:	1c19      	adds	r1, r3, #0
 80002be:	b672      	cpsid	i
 80002c0:	9b00      	ldr	r3, [sp, #0]
 80002c2:	220c      	movs	r2, #12
 80002c4:	4353      	muls	r3, r2
 80002c6:	18cb      	adds	r3, r1, r3
 80002c8:	685b      	ldr	r3, [r3, #4]
 80002ca:	9301      	str	r3, [sp, #4]
 80002cc:	b662      	cpsie	i
 80002ce:	9a01      	ldr	r2, [sp, #4]
 80002d0:	2302      	movs	r3, #2
 80002d2:	421a      	tst	r2, r3
 80002d4:	d000      	beq.n	80002d8 <set_wait_state+0x38>
 80002d6:	46c0      	nop			; (mov r8, r8)
 80002d8:	9a01      	ldr	r2, [sp, #4]
 80002da:	421a      	tst	r2, r3
 80002dc:	d1ef      	bne.n	80002be <set_wait_state+0x1e>
 80002de:	bd07      	pop	{r0, r1, r2, pc}
 80002e0:	20000010 	.word	0x20000010

080002e4 <wake_up_threads>:
 80002e4:	2300      	movs	r3, #0
 80002e6:	b672      	cpsid	i
 80002e8:	220c      	movs	r2, #12
 80002ea:	435a      	muls	r2, r3
 80002ec:	4905      	ldr	r1, [pc, #20]	; (8000304 <wake_up_threads+0x20>)
 80002ee:	2002      	movs	r0, #2
 80002f0:	188a      	adds	r2, r1, r2
 80002f2:	6851      	ldr	r1, [r2, #4]
 80002f4:	4381      	bics	r1, r0
 80002f6:	6051      	str	r1, [r2, #4]
 80002f8:	b662      	cpsie	i
 80002fa:	3301      	adds	r3, #1
 80002fc:	2b08      	cmp	r3, #8
 80002fe:	d1f2      	bne.n	80002e6 <wake_up_threads+0x2>
 8000300:	4770      	bx	lr
 8000302:	46c0      	nop			; (mov r8, r8)
 8000304:	20000010 	.word	0x20000010

08000308 <messages_init>:
 8000308:	b510      	push	{r4, lr}
 800030a:	2200      	movs	r2, #0
 800030c:	4909      	ldr	r1, [pc, #36]	; (8000334 <messages_init+0x2c>)
 800030e:	0090      	lsls	r0, r2, #2
 8000310:	2300      	movs	r3, #0
 8000312:	3201      	adds	r2, #1
 8000314:	5043      	str	r3, [r0, r1]
 8000316:	2a08      	cmp	r2, #8
 8000318:	d1f8      	bne.n	800030c <messages_init+0x4>
 800031a:	4807      	ldr	r0, [pc, #28]	; (8000338 <messages_init+0x30>)
 800031c:	011c      	lsls	r4, r3, #4
 800031e:	2200      	movs	r2, #0
 8000320:	1901      	adds	r1, r0, r4
 8000322:	3301      	adds	r3, #1
 8000324:	604a      	str	r2, [r1, #4]
 8000326:	5022      	str	r2, [r4, r0]
 8000328:	60ca      	str	r2, [r1, #12]
 800032a:	608a      	str	r2, [r1, #8]
 800032c:	2b04      	cmp	r3, #4
 800032e:	d1f4      	bne.n	800031a <messages_init+0x12>
 8000330:	bd10      	pop	{r4, pc}
 8000332:	46c0      	nop			; (mov r8, r8)
 8000334:	200000f4 	.word	0x200000f4
 8000338:	20000114 	.word	0x20000114

0800033c <putc_>:
 800033c:	b538      	push	{r3, r4, r5, lr}
 800033e:	4c06      	ldr	r4, [pc, #24]	; (8000358 <putc_+0x1c>)
 8000340:	1c05      	adds	r5, r0, #0
 8000342:	1c20      	adds	r0, r4, #0
 8000344:	f000 f8ff 	bl	8000546 <mutex_lock>
 8000348:	1c28      	adds	r0, r5, #0
 800034a:	f000 fdd3 	bl	8000ef4 <uart_write>
 800034e:	1c20      	adds	r0, r4, #0
 8000350:	f000 f915 	bl	800057e <mutex_unlock>
 8000354:	bd38      	pop	{r3, r4, r5, pc}
 8000356:	46c0      	nop			; (mov r8, r8)
 8000358:	20000154 	.word	0x20000154

0800035c <puts_>:
 800035c:	b538      	push	{r3, r4, r5, lr}
 800035e:	4d08      	ldr	r5, [pc, #32]	; (8000380 <puts_+0x24>)
 8000360:	1c04      	adds	r4, r0, #0
 8000362:	1c28      	adds	r0, r5, #0
 8000364:	f000 f8ef 	bl	8000546 <mutex_lock>
 8000368:	3401      	adds	r4, #1
 800036a:	1e63      	subs	r3, r4, #1
 800036c:	7818      	ldrb	r0, [r3, #0]
 800036e:	2800      	cmp	r0, #0
 8000370:	d002      	beq.n	8000378 <puts_+0x1c>
 8000372:	f7ff ffe3 	bl	800033c <putc_>
 8000376:	e7f7      	b.n	8000368 <puts_+0xc>
 8000378:	1c28      	adds	r0, r5, #0
 800037a:	f000 f900 	bl	800057e <mutex_unlock>
 800037e:	bd38      	pop	{r3, r4, r5, pc}
 8000380:	20000160 	.word	0x20000160

08000384 <puti_>:
 8000384:	b5f0      	push	{r4, r5, r6, r7, lr}
 8000386:	2300      	movs	r3, #0
 8000388:	b085      	sub	sp, #20
 800038a:	1c04      	adds	r4, r0, #0
 800038c:	1c1f      	adds	r7, r3, #0
 800038e:	4298      	cmp	r0, r3
 8000390:	da01      	bge.n	8000396 <puti_+0x12>
 8000392:	4244      	negs	r4, r0
 8000394:	2701      	movs	r7, #1
 8000396:	ae01      	add	r6, sp, #4
 8000398:	72f3      	strb	r3, [r6, #11]
 800039a:	250a      	movs	r5, #10
 800039c:	1c20      	adds	r0, r4, #0
 800039e:	210a      	movs	r1, #10
 80003a0:	f001 fd70 	bl	8001e84 <__aeabi_idivmod>
 80003a4:	3130      	adds	r1, #48	; 0x30
 80003a6:	5571      	strb	r1, [r6, r5]
 80003a8:	1c20      	adds	r0, r4, #0
 80003aa:	210a      	movs	r1, #10
 80003ac:	f001 fd14 	bl	8001dd8 <__aeabi_idiv>
 80003b0:	1e6b      	subs	r3, r5, #1
 80003b2:	1e04      	subs	r4, r0, #0
 80003b4:	d001      	beq.n	80003ba <puti_+0x36>
 80003b6:	1c1d      	adds	r5, r3, #0
 80003b8:	e7f0      	b.n	800039c <puti_+0x18>
 80003ba:	2f00      	cmp	r7, #0
 80003bc:	d002      	beq.n	80003c4 <puti_+0x40>
 80003be:	222d      	movs	r2, #45	; 0x2d
 80003c0:	54f2      	strb	r2, [r6, r3]
 80003c2:	1c1d      	adds	r5, r3, #0
 80003c4:	1970      	adds	r0, r6, r5
 80003c6:	f7ff ffc9 	bl	800035c <puts_>
 80003ca:	b005      	add	sp, #20
 80003cc:	bdf0      	pop	{r4, r5, r6, r7, pc}

080003ce <putui_>:
 80003ce:	b57f      	push	{r0, r1, r2, r3, r4, r5, r6, lr}
 80003d0:	2300      	movs	r3, #0
 80003d2:	ae01      	add	r6, sp, #4
 80003d4:	1c05      	adds	r5, r0, #0
 80003d6:	72f3      	strb	r3, [r6, #11]
 80003d8:	240a      	movs	r4, #10
 80003da:	1c28      	adds	r0, r5, #0
 80003dc:	210a      	movs	r1, #10
 80003de:	f001 fcf1 	bl	8001dc4 <__aeabi_uidivmod>
 80003e2:	3130      	adds	r1, #48	; 0x30
 80003e4:	5531      	strb	r1, [r6, r4]
 80003e6:	1c28      	adds	r0, r5, #0
 80003e8:	210a      	movs	r1, #10
 80003ea:	f001 fca7 	bl	8001d3c <__aeabi_uidiv>
 80003ee:	1e63      	subs	r3, r4, #1
 80003f0:	1e05      	subs	r5, r0, #0
 80003f2:	d001      	beq.n	80003f8 <putui_+0x2a>
 80003f4:	1c1c      	adds	r4, r3, #0
 80003f6:	e7f0      	b.n	80003da <putui_+0xc>
 80003f8:	1930      	adds	r0, r6, r4
 80003fa:	f7ff ffaf 	bl	800035c <puts_>
 80003fe:	bd7f      	pop	{r0, r1, r2, r3, r4, r5, r6, pc}

08000400 <putx_>:
 8000400:	b51f      	push	{r0, r1, r2, r3, r4, lr}
 8000402:	2300      	movs	r3, #0
 8000404:	aa01      	add	r2, sp, #4
 8000406:	72d3      	strb	r3, [r2, #11]
 8000408:	230a      	movs	r3, #10
 800040a:	210f      	movs	r1, #15
 800040c:	4001      	ands	r1, r0
 800040e:	2909      	cmp	r1, #9
 8000410:	d801      	bhi.n	8000416 <putx_+0x16>
 8000412:	3130      	adds	r1, #48	; 0x30
 8000414:	e000      	b.n	8000418 <putx_+0x18>
 8000416:	3157      	adds	r1, #87	; 0x57
 8000418:	54d1      	strb	r1, [r2, r3]
 800041a:	0900      	lsrs	r0, r0, #4
 800041c:	1e59      	subs	r1, r3, #1
 800041e:	2800      	cmp	r0, #0
 8000420:	d001      	beq.n	8000426 <putx_+0x26>
 8000422:	1c0b      	adds	r3, r1, #0
 8000424:	e7f1      	b.n	800040a <putx_+0xa>
 8000426:	18d0      	adds	r0, r2, r3
 8000428:	f7ff ff98 	bl	800035c <puts_>
 800042c:	b005      	add	sp, #20
 800042e:	bd00      	pop	{pc}

08000430 <printf_>:
 8000430:	b40f      	push	{r0, r1, r2, r3}
 8000432:	b573      	push	{r0, r1, r4, r5, r6, lr}
 8000434:	4e25      	ldr	r6, [pc, #148]	; (80004cc <printf_+0x9c>)
 8000436:	ac06      	add	r4, sp, #24
 8000438:	cc20      	ldmia	r4!, {r5}
 800043a:	1c30      	adds	r0, r6, #0
 800043c:	f000 f883 	bl	8000546 <mutex_lock>
 8000440:	9401      	str	r4, [sp, #4]
 8000442:	2400      	movs	r4, #0
 8000444:	5d28      	ldrb	r0, [r5, r4]
 8000446:	2800      	cmp	r0, #0
 8000448:	d039      	beq.n	80004be <printf_+0x8e>
 800044a:	2825      	cmp	r0, #37	; 0x25
 800044c:	d003      	beq.n	8000456 <printf_+0x26>
 800044e:	f7ff ff75 	bl	800033c <putc_>
 8000452:	3401      	adds	r4, #1
 8000454:	e7f6      	b.n	8000444 <printf_+0x14>
 8000456:	192b      	adds	r3, r5, r4
 8000458:	7858      	ldrb	r0, [r3, #1]
 800045a:	2869      	cmp	r0, #105	; 0x69
 800045c:	d016      	beq.n	800048c <printf_+0x5c>
 800045e:	d808      	bhi.n	8000472 <printf_+0x42>
 8000460:	2825      	cmp	r0, #37	; 0x25
 8000462:	d028      	beq.n	80004b6 <printf_+0x86>
 8000464:	2863      	cmp	r0, #99	; 0x63
 8000466:	d128      	bne.n	80004ba <printf_+0x8a>
 8000468:	9b01      	ldr	r3, [sp, #4]
 800046a:	1d1a      	adds	r2, r3, #4
 800046c:	9201      	str	r2, [sp, #4]
 800046e:	7818      	ldrb	r0, [r3, #0]
 8000470:	e021      	b.n	80004b6 <printf_+0x86>
 8000472:	2875      	cmp	r0, #117	; 0x75
 8000474:	d011      	beq.n	800049a <printf_+0x6a>
 8000476:	2878      	cmp	r0, #120	; 0x78
 8000478:	d016      	beq.n	80004a8 <printf_+0x78>
 800047a:	2873      	cmp	r0, #115	; 0x73
 800047c:	d11d      	bne.n	80004ba <printf_+0x8a>
 800047e:	9b01      	ldr	r3, [sp, #4]
 8000480:	1d1a      	adds	r2, r3, #4
 8000482:	6818      	ldr	r0, [r3, #0]
 8000484:	9201      	str	r2, [sp, #4]
 8000486:	f7ff ff69 	bl	800035c <puts_>
 800048a:	e016      	b.n	80004ba <printf_+0x8a>
 800048c:	9b01      	ldr	r3, [sp, #4]
 800048e:	1d1a      	adds	r2, r3, #4
 8000490:	6818      	ldr	r0, [r3, #0]
 8000492:	9201      	str	r2, [sp, #4]
 8000494:	f7ff ff76 	bl	8000384 <puti_>
 8000498:	e00f      	b.n	80004ba <printf_+0x8a>
 800049a:	9b01      	ldr	r3, [sp, #4]
 800049c:	1d1a      	adds	r2, r3, #4
 800049e:	6818      	ldr	r0, [r3, #0]
 80004a0:	9201      	str	r2, [sp, #4]
 80004a2:	f7ff ff94 	bl	80003ce <putui_>
 80004a6:	e008      	b.n	80004ba <printf_+0x8a>
 80004a8:	9b01      	ldr	r3, [sp, #4]
 80004aa:	1d1a      	adds	r2, r3, #4
 80004ac:	6818      	ldr	r0, [r3, #0]
 80004ae:	9201      	str	r2, [sp, #4]
 80004b0:	f7ff ffa6 	bl	8000400 <putx_>
 80004b4:	e001      	b.n	80004ba <printf_+0x8a>
 80004b6:	f7ff ff41 	bl	800033c <putc_>
 80004ba:	3402      	adds	r4, #2
 80004bc:	e7c2      	b.n	8000444 <printf_+0x14>
 80004be:	1c30      	adds	r0, r6, #0
 80004c0:	f000 f85d 	bl	800057e <mutex_unlock>
 80004c4:	bc73      	pop	{r0, r1, r4, r5, r6}
 80004c6:	bc08      	pop	{r3}
 80004c8:	b004      	add	sp, #16
 80004ca:	4718      	bx	r3
 80004cc:	2000015c 	.word	0x2000015c

080004d0 <stdio_init>:
 80004d0:	b510      	push	{r4, lr}
 80004d2:	480f      	ldr	r0, [pc, #60]	; (8000510 <stdio_init+0x40>)
 80004d4:	f000 f82e 	bl	8000534 <mutex_init>
 80004d8:	480e      	ldr	r0, [pc, #56]	; (8000514 <stdio_init+0x44>)
 80004da:	f000 f82b 	bl	8000534 <mutex_init>
 80004de:	480e      	ldr	r0, [pc, #56]	; (8000518 <stdio_init+0x48>)
 80004e0:	f000 f828 	bl	8000534 <mutex_init>
 80004e4:	480d      	ldr	r0, [pc, #52]	; (800051c <stdio_init+0x4c>)
 80004e6:	f000 f825 	bl	8000534 <mutex_init>
 80004ea:	2408      	movs	r4, #8
 80004ec:	2020      	movs	r0, #32
 80004ee:	3c01      	subs	r4, #1
 80004f0:	f7ff ff24 	bl	800033c <putc_>
 80004f4:	2c00      	cmp	r4, #0
 80004f6:	d1f9      	bne.n	80004ec <stdio_init+0x1c>
 80004f8:	2420      	movs	r4, #32
 80004fa:	200a      	movs	r0, #10
 80004fc:	3c01      	subs	r4, #1
 80004fe:	f7ff ff1d 	bl	800033c <putc_>
 8000502:	2c00      	cmp	r4, #0
 8000504:	d1f9      	bne.n	80004fa <stdio_init+0x2a>
 8000506:	4806      	ldr	r0, [pc, #24]	; (8000520 <stdio_init+0x50>)
 8000508:	f7ff ff92 	bl	8000430 <printf_>
 800050c:	bd10      	pop	{r4, pc}
 800050e:	46c0      	nop			; (mov r8, r8)
 8000510:	20000154 	.word	0x20000154
 8000514:	20000158 	.word	0x20000158
 8000518:	20000160 	.word	0x20000160
 800051c:	2000015c 	.word	0x2000015c
 8000520:	08001eb4 	.word	0x08001eb4

08000524 <lib_os_init>:
 8000524:	b508      	push	{r3, lr}
 8000526:	f7ff fe99 	bl	800025c <kernel_init>
 800052a:	f7ff feed 	bl	8000308 <messages_init>
 800052e:	f7ff ffcf 	bl	80004d0 <stdio_init>
 8000532:	bd08      	pop	{r3, pc}

08000534 <mutex_init>:
 8000534:	b510      	push	{r4, lr}
 8000536:	1c04      	adds	r4, r0, #0
 8000538:	f7ff fe38 	bl	80001ac <sched_off>
 800053c:	2300      	movs	r3, #0
 800053e:	6023      	str	r3, [r4, #0]
 8000540:	f7ff fe36 	bl	80001b0 <sched_on>
 8000544:	bd10      	pop	{r4, pc}

08000546 <mutex_lock>:
 8000546:	b513      	push	{r0, r1, r4, lr}
 8000548:	1c04      	adds	r4, r0, #0
 800054a:	f7ff fe2f 	bl	80001ac <sched_off>
 800054e:	6823      	ldr	r3, [r4, #0]
 8000550:	9301      	str	r3, [sp, #4]
 8000552:	f7ff fe2d 	bl	80001b0 <sched_on>
 8000556:	9b01      	ldr	r3, [sp, #4]
 8000558:	2b00      	cmp	r3, #0
 800055a:	d001      	beq.n	8000560 <mutex_lock+0x1a>
 800055c:	f7ff fea0 	bl	80002a0 <set_wait_state>
 8000560:	9b01      	ldr	r3, [sp, #4]
 8000562:	2b00      	cmp	r3, #0
 8000564:	d1f1      	bne.n	800054a <mutex_lock+0x4>
 8000566:	f7ff fe21 	bl	80001ac <sched_off>
 800056a:	6823      	ldr	r3, [r4, #0]
 800056c:	9301      	str	r3, [sp, #4]
 800056e:	9b01      	ldr	r3, [sp, #4]
 8000570:	2b00      	cmp	r3, #0
 8000572:	d1ea      	bne.n	800054a <mutex_lock+0x4>
 8000574:	2301      	movs	r3, #1
 8000576:	6023      	str	r3, [r4, #0]
 8000578:	f7ff fe1a 	bl	80001b0 <sched_on>
 800057c:	bd13      	pop	{r0, r1, r4, pc}

0800057e <mutex_unlock>:
 800057e:	b508      	push	{r3, lr}
 8000580:	f7ff ffd8 	bl	8000534 <mutex_init>
 8000584:	f7ff feae 	bl	80002e4 <wake_up_threads>
 8000588:	f7ff fe14 	bl	80001b4 <yield>
 800058c:	bd08      	pop	{r3, pc}
	...

08000590 <hmc5883_init>:
 8000590:	b510      	push	{r4, lr}
 8000592:	4b16      	ldr	r3, [pc, #88]	; (80005ec <hmc5883_init+0x5c>)
 8000594:	2400      	movs	r4, #0
 8000596:	203c      	movs	r0, #60	; 0x3c
 8000598:	1c21      	adds	r1, r4, #0
 800059a:	2218      	movs	r2, #24
 800059c:	801c      	strh	r4, [r3, #0]
 800059e:	805c      	strh	r4, [r3, #2]
 80005a0:	809c      	strh	r4, [r3, #4]
 80005a2:	f000 fdbb 	bl	800111c <i2c_write_reg>
 80005a6:	203c      	movs	r0, #60	; 0x3c
 80005a8:	2101      	movs	r1, #1
 80005aa:	1c22      	adds	r2, r4, #0
 80005ac:	f000 fdb6 	bl	800111c <i2c_write_reg>
 80005b0:	203c      	movs	r0, #60	; 0x3c
 80005b2:	2102      	movs	r1, #2
 80005b4:	1c22      	adds	r2, r4, #0
 80005b6:	f000 fdb1 	bl	800111c <i2c_write_reg>
 80005ba:	203c      	movs	r0, #60	; 0x3c
 80005bc:	210a      	movs	r1, #10
 80005be:	f000 fdbf 	bl	8001140 <i2c_read_reg>
 80005c2:	2301      	movs	r3, #1
 80005c4:	2848      	cmp	r0, #72	; 0x48
 80005c6:	d10f      	bne.n	80005e8 <hmc5883_init+0x58>
 80005c8:	203c      	movs	r0, #60	; 0x3c
 80005ca:	210b      	movs	r1, #11
 80005cc:	f000 fdb8 	bl	8001140 <i2c_read_reg>
 80005d0:	2302      	movs	r3, #2
 80005d2:	2834      	cmp	r0, #52	; 0x34
 80005d4:	d108      	bne.n	80005e8 <hmc5883_init+0x58>
 80005d6:	203c      	movs	r0, #60	; 0x3c
 80005d8:	210c      	movs	r1, #12
 80005da:	f000 fdb1 	bl	8001140 <i2c_read_reg>
 80005de:	2833      	cmp	r0, #51	; 0x33
 80005e0:	d001      	beq.n	80005e6 <hmc5883_init+0x56>
 80005e2:	2303      	movs	r3, #3
 80005e4:	e000      	b.n	80005e8 <hmc5883_init+0x58>
 80005e6:	1c23      	adds	r3, r4, #0
 80005e8:	1c18      	adds	r0, r3, #0
 80005ea:	bd10      	pop	{r4, pc}
 80005ec:	20000164 	.word	0x20000164

080005f0 <hmc5883_read>:
 80005f0:	b538      	push	{r3, r4, r5, lr}
 80005f2:	2103      	movs	r1, #3
 80005f4:	203c      	movs	r0, #60	; 0x3c
 80005f6:	f000 fda3 	bl	8001140 <i2c_read_reg>
 80005fa:	4c12      	ldr	r4, [pc, #72]	; (8000644 <hmc5883_read+0x54>)
 80005fc:	0205      	lsls	r5, r0, #8
 80005fe:	b2ad      	uxth	r5, r5
 8000600:	2104      	movs	r1, #4
 8000602:	203c      	movs	r0, #60	; 0x3c
 8000604:	8025      	strh	r5, [r4, #0]
 8000606:	f000 fd9b 	bl	8001140 <i2c_read_reg>
 800060a:	2107      	movs	r1, #7
 800060c:	4305      	orrs	r5, r0
 800060e:	203c      	movs	r0, #60	; 0x3c
 8000610:	8025      	strh	r5, [r4, #0]
 8000612:	f000 fd95 	bl	8001140 <i2c_read_reg>
 8000616:	0205      	lsls	r5, r0, #8
 8000618:	b2ad      	uxth	r5, r5
 800061a:	2108      	movs	r1, #8
 800061c:	203c      	movs	r0, #60	; 0x3c
 800061e:	8065      	strh	r5, [r4, #2]
 8000620:	f000 fd8e 	bl	8001140 <i2c_read_reg>
 8000624:	2105      	movs	r1, #5
 8000626:	4305      	orrs	r5, r0
 8000628:	203c      	movs	r0, #60	; 0x3c
 800062a:	8065      	strh	r5, [r4, #2]
 800062c:	f000 fd88 	bl	8001140 <i2c_read_reg>
 8000630:	0205      	lsls	r5, r0, #8
 8000632:	b2ad      	uxth	r5, r5
 8000634:	2106      	movs	r1, #6
 8000636:	203c      	movs	r0, #60	; 0x3c
 8000638:	80a5      	strh	r5, [r4, #4]
 800063a:	f000 fd81 	bl	8001140 <i2c_read_reg>
 800063e:	4305      	orrs	r5, r0
 8000640:	80a5      	strh	r5, [r4, #4]
 8000642:	bd38      	pop	{r3, r4, r5, pc}
 8000644:	20000164 	.word	0x20000164

08000648 <mint_abs>:
 8000648:	17c3      	asrs	r3, r0, #31
 800064a:	18c0      	adds	r0, r0, r3
 800064c:	4058      	eors	r0, r3
 800064e:	4770      	bx	lr

08000650 <LCD_SH1106_write_command>:
 8000650:	b508      	push	{r3, lr}
 8000652:	1c02      	adds	r2, r0, #0
 8000654:	2100      	movs	r1, #0
 8000656:	2078      	movs	r0, #120	; 0x78
 8000658:	f000 fd60 	bl	800111c <i2c_write_reg>
 800065c:	bd08      	pop	{r3, pc}

0800065e <LCD_SH1106_set_cursor>:
 800065e:	b510      	push	{r4, lr}
 8000660:	1c84      	adds	r4, r0, #2
 8000662:	1c08      	adds	r0, r1, #0
 8000664:	3850      	subs	r0, #80	; 0x50
 8000666:	b2c0      	uxtb	r0, r0
 8000668:	f7ff fff2 	bl	8000650 <LCD_SH1106_write_command>
 800066c:	b2e4      	uxtb	r4, r4
 800066e:	200f      	movs	r0, #15
 8000670:	4020      	ands	r0, r4
 8000672:	f7ff ffed 	bl	8000650 <LCD_SH1106_write_command>
 8000676:	0924      	lsrs	r4, r4, #4
 8000678:	2010      	movs	r0, #16
 800067a:	4320      	orrs	r0, r4
 800067c:	f7ff ffe8 	bl	8000650 <LCD_SH1106_write_command>
 8000680:	bd10      	pop	{r4, pc}
	...

08000684 <LCD_SH1106_set_pixel>:
 8000684:	b570      	push	{r4, r5, r6, lr}
 8000686:	1c0c      	adds	r4, r1, #0
 8000688:	1c05      	adds	r5, r0, #0
 800068a:	1c16      	adds	r6, r2, #0
 800068c:	f7ff fd8e 	bl	80001ac <sched_off>
 8000690:	08e2      	lsrs	r2, r4, #3
 8000692:	2107      	movs	r1, #7
 8000694:	400c      	ands	r4, r1
 8000696:	01d2      	lsls	r2, r2, #7
 8000698:	4b08      	ldr	r3, [pc, #32]	; (80006bc <LCD_SH1106_set_pixel+0x38>)
 800069a:	2101      	movs	r1, #1
 800069c:	1955      	adds	r5, r2, r5
 800069e:	40a1      	lsls	r1, r4
 80006a0:	5d5a      	ldrb	r2, [r3, r5]
 80006a2:	1c0c      	adds	r4, r1, #0
 80006a4:	2e00      	cmp	r6, #0
 80006a6:	d003      	beq.n	80006b0 <LCD_SH1106_set_pixel+0x2c>
 80006a8:	4314      	orrs	r4, r2
 80006aa:	b2e4      	uxtb	r4, r4
 80006ac:	555c      	strb	r4, [r3, r5]
 80006ae:	e001      	b.n	80006b4 <LCD_SH1106_set_pixel+0x30>
 80006b0:	438a      	bics	r2, r1
 80006b2:	555a      	strb	r2, [r3, r5]
 80006b4:	f7ff fd7c 	bl	80001b0 <sched_on>
 80006b8:	bd70      	pop	{r4, r5, r6, pc}
 80006ba:	46c0      	nop			; (mov r8, r8)
 80006bc:	2000016c 	.word	0x2000016c

080006c0 <LCD_SH1106_clear_buffer>:
 80006c0:	b082      	sub	sp, #8
 80006c2:	2300      	movs	r3, #0
 80006c4:	9300      	str	r3, [sp, #0]
 80006c6:	9b00      	ldr	r3, [sp, #0]
 80006c8:	2b07      	cmp	r3, #7
 80006ca:	d810      	bhi.n	80006ee <LCD_SH1106_clear_buffer+0x2e>
 80006cc:	2300      	movs	r3, #0
 80006ce:	9301      	str	r3, [sp, #4]
 80006d0:	9b01      	ldr	r3, [sp, #4]
 80006d2:	2b7f      	cmp	r3, #127	; 0x7f
 80006d4:	d808      	bhi.n	80006e8 <LCD_SH1106_clear_buffer+0x28>
 80006d6:	9a00      	ldr	r2, [sp, #0]
 80006d8:	9b01      	ldr	r3, [sp, #4]
 80006da:	01d2      	lsls	r2, r2, #7
 80006dc:	18d2      	adds	r2, r2, r3
 80006de:	4b05      	ldr	r3, [pc, #20]	; (80006f4 <LCD_SH1106_clear_buffer+0x34>)
 80006e0:	54d0      	strb	r0, [r2, r3]
 80006e2:	9b01      	ldr	r3, [sp, #4]
 80006e4:	3301      	adds	r3, #1
 80006e6:	e7f2      	b.n	80006ce <LCD_SH1106_clear_buffer+0xe>
 80006e8:	9b00      	ldr	r3, [sp, #0]
 80006ea:	3301      	adds	r3, #1
 80006ec:	e7ea      	b.n	80006c4 <LCD_SH1106_clear_buffer+0x4>
 80006ee:	b002      	add	sp, #8
 80006f0:	4770      	bx	lr
 80006f2:	46c0      	nop			; (mov r8, r8)
 80006f4:	2000016c 	.word	0x2000016c

080006f8 <LCD_SH1106_flush_buffer>:
 80006f8:	b530      	push	{r4, r5, lr}
 80006fa:	2000      	movs	r0, #0
 80006fc:	b085      	sub	sp, #20
 80006fe:	f7ff ffa7 	bl	8000650 <LCD_SH1106_write_command>
 8000702:	2010      	movs	r0, #16
 8000704:	f7ff ffa4 	bl	8000650 <LCD_SH1106_write_command>
 8000708:	2040      	movs	r0, #64	; 0x40
 800070a:	f7ff ffa1 	bl	8000650 <LCD_SH1106_write_command>
 800070e:	2300      	movs	r3, #0
 8000710:	9301      	str	r3, [sp, #4]
 8000712:	9b01      	ldr	r3, [sp, #4]
 8000714:	2b07      	cmp	r3, #7
 8000716:	d833      	bhi.n	8000780 <LCD_SH1106_flush_buffer+0x88>
 8000718:	9801      	ldr	r0, [sp, #4]
 800071a:	2400      	movs	r4, #0
 800071c:	3850      	subs	r0, #80	; 0x50
 800071e:	b2c0      	uxtb	r0, r0
 8000720:	f7ff ff96 	bl	8000650 <LCD_SH1106_write_command>
 8000724:	2002      	movs	r0, #2
 8000726:	f7ff ff93 	bl	8000650 <LCD_SH1106_write_command>
 800072a:	2010      	movs	r0, #16
 800072c:	f7ff ff90 	bl	8000650 <LCD_SH1106_write_command>
 8000730:	9402      	str	r4, [sp, #8]
 8000732:	9b02      	ldr	r3, [sp, #8]
 8000734:	2b07      	cmp	r3, #7
 8000736:	d820      	bhi.n	800077a <LCD_SH1106_flush_buffer+0x82>
 8000738:	f000 fc86 	bl	8001048 <i2cStart>
 800073c:	2078      	movs	r0, #120	; 0x78
 800073e:	f000 fc9f 	bl	8001080 <i2cWrite>
 8000742:	2040      	movs	r0, #64	; 0x40
 8000744:	f000 fc9c 	bl	8001080 <i2cWrite>
 8000748:	2300      	movs	r3, #0
 800074a:	9303      	str	r3, [sp, #12]
 800074c:	9b03      	ldr	r3, [sp, #12]
 800074e:	2b0f      	cmp	r3, #15
 8000750:	d80d      	bhi.n	800076e <LCD_SH1106_flush_buffer+0x76>
 8000752:	9b01      	ldr	r3, [sp, #4]
 8000754:	1c65      	adds	r5, r4, #1
 8000756:	01db      	lsls	r3, r3, #7
 8000758:	191c      	adds	r4, r3, r4
 800075a:	4b0c      	ldr	r3, [pc, #48]	; (800078c <LCD_SH1106_flush_buffer+0x94>)
 800075c:	5ce0      	ldrb	r0, [r4, r3]
 800075e:	1c2c      	adds	r4, r5, #0
 8000760:	b2c0      	uxtb	r0, r0
 8000762:	f000 fc8d 	bl	8001080 <i2cWrite>
 8000766:	9b03      	ldr	r3, [sp, #12]
 8000768:	3301      	adds	r3, #1
 800076a:	9303      	str	r3, [sp, #12]
 800076c:	e7ee      	b.n	800074c <LCD_SH1106_flush_buffer+0x54>
 800076e:	f000 fc79 	bl	8001064 <i2cStop>
 8000772:	9b02      	ldr	r3, [sp, #8]
 8000774:	3301      	adds	r3, #1
 8000776:	9302      	str	r3, [sp, #8]
 8000778:	e7db      	b.n	8000732 <LCD_SH1106_flush_buffer+0x3a>
 800077a:	9b01      	ldr	r3, [sp, #4]
 800077c:	3301      	adds	r3, #1
 800077e:	e7c7      	b.n	8000710 <LCD_SH1106_flush_buffer+0x18>
 8000780:	2000      	movs	r0, #0
 8000782:	1c01      	adds	r1, r0, #0
 8000784:	f7ff ff6b 	bl	800065e <LCD_SH1106_set_cursor>
 8000788:	b005      	add	sp, #20
 800078a:	bd30      	pop	{r4, r5, pc}
 800078c:	2000016c 	.word	0x2000016c

08000790 <LCD_SH1106_flush_buffer_partial>:
 8000790:	b5f0      	push	{r4, r5, r6, r7, lr}
 8000792:	4c32      	ldr	r4, [pc, #200]	; (800085c <LCD_SH1106_flush_buffer_partial+0xcc>)
 8000794:	b085      	sub	sp, #20
 8000796:	8826      	ldrh	r6, [r4, #0]
 8000798:	1c25      	adds	r5, r4, #0
 800079a:	b2b6      	uxth	r6, r6
 800079c:	2e01      	cmp	r6, #1
 800079e:	d019      	beq.n	80007d4 <LCD_SH1106_flush_buffer_partial+0x44>
 80007a0:	2e00      	cmp	r6, #0
 80007a2:	d009      	beq.n	80007b8 <LCD_SH1106_flush_buffer_partial+0x28>
 80007a4:	2500      	movs	r5, #0
 80007a6:	2e02      	cmp	r6, #2
 80007a8:	d154      	bne.n	8000854 <LCD_SH1106_flush_buffer_partial+0xc4>
 80007aa:	1c28      	adds	r0, r5, #0
 80007ac:	1c29      	adds	r1, r5, #0
 80007ae:	f7ff ff56 	bl	800065e <LCD_SH1106_set_cursor>
 80007b2:	8025      	strh	r5, [r4, #0]
 80007b4:	1c28      	adds	r0, r5, #0
 80007b6:	e04f      	b.n	8000858 <LCD_SH1106_flush_buffer_partial+0xc8>
 80007b8:	1c30      	adds	r0, r6, #0
 80007ba:	f7ff ff49 	bl	8000650 <LCD_SH1106_write_command>
 80007be:	2010      	movs	r0, #16
 80007c0:	f7ff ff46 	bl	8000650 <LCD_SH1106_write_command>
 80007c4:	2040      	movs	r0, #64	; 0x40
 80007c6:	f7ff ff43 	bl	8000650 <LCD_SH1106_write_command>
 80007ca:	4b25      	ldr	r3, [pc, #148]	; (8000860 <LCD_SH1106_flush_buffer_partial+0xd0>)
 80007cc:	2001      	movs	r0, #1
 80007ce:	801e      	strh	r6, [r3, #0]
 80007d0:	8020      	strh	r0, [r4, #0]
 80007d2:	e041      	b.n	8000858 <LCD_SH1106_flush_buffer_partial+0xc8>
 80007d4:	4c22      	ldr	r4, [pc, #136]	; (8000860 <LCD_SH1106_flush_buffer_partial+0xd0>)
 80007d6:	2600      	movs	r6, #0
 80007d8:	8823      	ldrh	r3, [r4, #0]
 80007da:	b29b      	uxth	r3, r3
 80007dc:	9301      	str	r3, [sp, #4]
 80007de:	9801      	ldr	r0, [sp, #4]
 80007e0:	3850      	subs	r0, #80	; 0x50
 80007e2:	b2c0      	uxtb	r0, r0
 80007e4:	f7ff ff34 	bl	8000650 <LCD_SH1106_write_command>
 80007e8:	2002      	movs	r0, #2
 80007ea:	f7ff ff31 	bl	8000650 <LCD_SH1106_write_command>
 80007ee:	2010      	movs	r0, #16
 80007f0:	f7ff ff2e 	bl	8000650 <LCD_SH1106_write_command>
 80007f4:	9602      	str	r6, [sp, #8]
 80007f6:	9b02      	ldr	r3, [sp, #8]
 80007f8:	2b07      	cmp	r3, #7
 80007fa:	d820      	bhi.n	800083e <LCD_SH1106_flush_buffer_partial+0xae>
 80007fc:	f000 fc24 	bl	8001048 <i2cStart>
 8000800:	2078      	movs	r0, #120	; 0x78
 8000802:	f000 fc3d 	bl	8001080 <i2cWrite>
 8000806:	2040      	movs	r0, #64	; 0x40
 8000808:	f000 fc3a 	bl	8001080 <i2cWrite>
 800080c:	2300      	movs	r3, #0
 800080e:	9303      	str	r3, [sp, #12]
 8000810:	9b03      	ldr	r3, [sp, #12]
 8000812:	2b0f      	cmp	r3, #15
 8000814:	d80d      	bhi.n	8000832 <LCD_SH1106_flush_buffer_partial+0xa2>
 8000816:	9b01      	ldr	r3, [sp, #4]
 8000818:	1c77      	adds	r7, r6, #1
 800081a:	01db      	lsls	r3, r3, #7
 800081c:	199e      	adds	r6, r3, r6
 800081e:	4b11      	ldr	r3, [pc, #68]	; (8000864 <LCD_SH1106_flush_buffer_partial+0xd4>)
 8000820:	5cf0      	ldrb	r0, [r6, r3]
 8000822:	1c3e      	adds	r6, r7, #0
 8000824:	b2c0      	uxtb	r0, r0
 8000826:	f000 fc2b 	bl	8001080 <i2cWrite>
 800082a:	9b03      	ldr	r3, [sp, #12]
 800082c:	3301      	adds	r3, #1
 800082e:	9303      	str	r3, [sp, #12]
 8000830:	e7ee      	b.n	8000810 <LCD_SH1106_flush_buffer_partial+0x80>
 8000832:	f000 fc17 	bl	8001064 <i2cStop>
 8000836:	9b02      	ldr	r3, [sp, #8]
 8000838:	3301      	adds	r3, #1
 800083a:	9302      	str	r3, [sp, #8]
 800083c:	e7db      	b.n	80007f6 <LCD_SH1106_flush_buffer_partial+0x66>
 800083e:	8823      	ldrh	r3, [r4, #0]
 8000840:	2001      	movs	r0, #1
 8000842:	3301      	adds	r3, #1
 8000844:	b29b      	uxth	r3, r3
 8000846:	8023      	strh	r3, [r4, #0]
 8000848:	8823      	ldrh	r3, [r4, #0]
 800084a:	2b07      	cmp	r3, #7
 800084c:	d904      	bls.n	8000858 <LCD_SH1106_flush_buffer_partial+0xc8>
 800084e:	2302      	movs	r3, #2
 8000850:	802b      	strh	r3, [r5, #0]
 8000852:	e001      	b.n	8000858 <LCD_SH1106_flush_buffer_partial+0xc8>
 8000854:	8025      	strh	r5, [r4, #0]
 8000856:	2001      	movs	r0, #1
 8000858:	b005      	add	sp, #20
 800085a:	bdf0      	pop	{r4, r5, r6, r7, pc}
 800085c:	2000016a 	.word	0x2000016a
 8000860:	2000056c 	.word	0x2000056c
 8000864:	2000016c 	.word	0x2000016c

08000868 <LCD_SH1106_init>:
 8000868:	b508      	push	{r3, lr}
 800086a:	20ae      	movs	r0, #174	; 0xae
 800086c:	f7ff fef0 	bl	8000650 <LCD_SH1106_write_command>
 8000870:	2002      	movs	r0, #2
 8000872:	f7ff feed 	bl	8000650 <LCD_SH1106_write_command>
 8000876:	2010      	movs	r0, #16
 8000878:	f7ff feea 	bl	8000650 <LCD_SH1106_write_command>
 800087c:	2040      	movs	r0, #64	; 0x40
 800087e:	f7ff fee7 	bl	8000650 <LCD_SH1106_write_command>
 8000882:	20b0      	movs	r0, #176	; 0xb0
 8000884:	f7ff fee4 	bl	8000650 <LCD_SH1106_write_command>
 8000888:	2081      	movs	r0, #129	; 0x81
 800088a:	f7ff fee1 	bl	8000650 <LCD_SH1106_write_command>
 800088e:	2080      	movs	r0, #128	; 0x80
 8000890:	f7ff fede 	bl	8000650 <LCD_SH1106_write_command>
 8000894:	20a1      	movs	r0, #161	; 0xa1
 8000896:	f7ff fedb 	bl	8000650 <LCD_SH1106_write_command>
 800089a:	20a6      	movs	r0, #166	; 0xa6
 800089c:	f7ff fed8 	bl	8000650 <LCD_SH1106_write_command>
 80008a0:	20a8      	movs	r0, #168	; 0xa8
 80008a2:	f7ff fed5 	bl	8000650 <LCD_SH1106_write_command>
 80008a6:	203f      	movs	r0, #63	; 0x3f
 80008a8:	f7ff fed2 	bl	8000650 <LCD_SH1106_write_command>
 80008ac:	20ad      	movs	r0, #173	; 0xad
 80008ae:	f7ff fecf 	bl	8000650 <LCD_SH1106_write_command>
 80008b2:	208b      	movs	r0, #139	; 0x8b
 80008b4:	f7ff fecc 	bl	8000650 <LCD_SH1106_write_command>
 80008b8:	2030      	movs	r0, #48	; 0x30
 80008ba:	f7ff fec9 	bl	8000650 <LCD_SH1106_write_command>
 80008be:	20c8      	movs	r0, #200	; 0xc8
 80008c0:	f7ff fec6 	bl	8000650 <LCD_SH1106_write_command>
 80008c4:	20d3      	movs	r0, #211	; 0xd3
 80008c6:	f7ff fec3 	bl	8000650 <LCD_SH1106_write_command>
 80008ca:	2000      	movs	r0, #0
 80008cc:	f7ff fec0 	bl	8000650 <LCD_SH1106_write_command>
 80008d0:	20d5      	movs	r0, #213	; 0xd5
 80008d2:	f7ff febd 	bl	8000650 <LCD_SH1106_write_command>
 80008d6:	2080      	movs	r0, #128	; 0x80
 80008d8:	f7ff feba 	bl	8000650 <LCD_SH1106_write_command>
 80008dc:	20d9      	movs	r0, #217	; 0xd9
 80008de:	f7ff feb7 	bl	8000650 <LCD_SH1106_write_command>
 80008e2:	201f      	movs	r0, #31
 80008e4:	f7ff feb4 	bl	8000650 <LCD_SH1106_write_command>
 80008e8:	20da      	movs	r0, #218	; 0xda
 80008ea:	f7ff feb1 	bl	8000650 <LCD_SH1106_write_command>
 80008ee:	2012      	movs	r0, #18
 80008f0:	f7ff feae 	bl	8000650 <LCD_SH1106_write_command>
 80008f4:	20db      	movs	r0, #219	; 0xdb
 80008f6:	f7ff feab 	bl	8000650 <LCD_SH1106_write_command>
 80008fa:	2040      	movs	r0, #64	; 0x40
 80008fc:	f7ff fea8 	bl	8000650 <LCD_SH1106_write_command>
 8000900:	20af      	movs	r0, #175	; 0xaf
 8000902:	f7ff fea5 	bl	8000650 <LCD_SH1106_write_command>
 8000906:	2000      	movs	r0, #0
 8000908:	f7ff feda 	bl	80006c0 <LCD_SH1106_clear_buffer>
 800090c:	f7ff fef4 	bl	80006f8 <LCD_SH1106_flush_buffer>
 8000910:	4a02      	ldr	r2, [pc, #8]	; (800091c <LCD_SH1106_init+0xb4>)
 8000912:	2300      	movs	r3, #0
 8000914:	8013      	strh	r3, [r2, #0]
 8000916:	4a02      	ldr	r2, [pc, #8]	; (8000920 <LCD_SH1106_init+0xb8>)
 8000918:	8013      	strh	r3, [r2, #0]
 800091a:	bd08      	pop	{r3, pc}
 800091c:	2000016a 	.word	0x2000016a
 8000920:	2000056c 	.word	0x2000056c

08000924 <lcd_put_char_xy>:
 8000924:	b5f7      	push	{r0, r1, r2, r4, r5, r6, r7, lr}
 8000926:	2300      	movs	r3, #0
 8000928:	1c06      	adds	r6, r0, #0
 800092a:	1c0f      	adds	r7, r1, #0
 800092c:	2a1f      	cmp	r2, #31
 800092e:	d902      	bls.n	8000936 <lcd_put_char_xy+0x12>
 8000930:	1c13      	adds	r3, r2, #0
 8000932:	3b20      	subs	r3, #32
 8000934:	b2db      	uxtb	r3, r3
 8000936:	011b      	lsls	r3, r3, #4
 8000938:	9300      	str	r3, [sp, #0]
 800093a:	2500      	movs	r5, #0
 800093c:	2301      	movs	r3, #1
 800093e:	40ab      	lsls	r3, r5
 8000940:	b2db      	uxtb	r3, r3
 8000942:	9301      	str	r3, [sp, #4]
 8000944:	2400      	movs	r4, #0
 8000946:	1c30      	adds	r0, r6, #0
 8000948:	3008      	adds	r0, #8
 800094a:	19e1      	adds	r1, r4, r7
 800094c:	1b40      	subs	r0, r0, r5
 800094e:	2880      	cmp	r0, #128	; 0x80
 8000950:	d900      	bls.n	8000954 <lcd_put_char_xy+0x30>
 8000952:	2080      	movs	r0, #128	; 0x80
 8000954:	2940      	cmp	r1, #64	; 0x40
 8000956:	d900      	bls.n	800095a <lcd_put_char_xy+0x36>
 8000958:	2140      	movs	r1, #64	; 0x40
 800095a:	9a00      	ldr	r2, [sp, #0]
 800095c:	4b06      	ldr	r3, [pc, #24]	; (8000978 <lcd_put_char_xy+0x54>)
 800095e:	189b      	adds	r3, r3, r2
 8000960:	5d1a      	ldrb	r2, [r3, r4]
 8000962:	9b01      	ldr	r3, [sp, #4]
 8000964:	3401      	adds	r4, #1
 8000966:	401a      	ands	r2, r3
 8000968:	f7ff fe8c 	bl	8000684 <LCD_SH1106_set_pixel>
 800096c:	2c10      	cmp	r4, #16
 800096e:	d1ea      	bne.n	8000946 <lcd_put_char_xy+0x22>
 8000970:	3501      	adds	r5, #1
 8000972:	2d08      	cmp	r5, #8
 8000974:	d1e2      	bne.n	800093c <lcd_put_char_xy+0x18>
 8000976:	bdf7      	pop	{r0, r1, r2, r4, r5, r6, r7, pc}
 8000978:	08001ec5 	.word	0x08001ec5

0800097c <mpu6050_read>:
 800097c:	b538      	push	{r3, r4, r5, lr}
 800097e:	213b      	movs	r1, #59	; 0x3b
 8000980:	20d0      	movs	r0, #208	; 0xd0
 8000982:	f000 fbdd 	bl	8001140 <i2c_read_reg>
 8000986:	4c2c      	ldr	r4, [pc, #176]	; (8000a38 <mpu6050_read+0xbc>)
 8000988:	0205      	lsls	r5, r0, #8
 800098a:	b2ad      	uxth	r5, r5
 800098c:	213c      	movs	r1, #60	; 0x3c
 800098e:	20d0      	movs	r0, #208	; 0xd0
 8000990:	8025      	strh	r5, [r4, #0]
 8000992:	f000 fbd5 	bl	8001140 <i2c_read_reg>
 8000996:	213d      	movs	r1, #61	; 0x3d
 8000998:	4305      	orrs	r5, r0
 800099a:	20d0      	movs	r0, #208	; 0xd0
 800099c:	8025      	strh	r5, [r4, #0]
 800099e:	f000 fbcf 	bl	8001140 <i2c_read_reg>
 80009a2:	0205      	lsls	r5, r0, #8
 80009a4:	b2ad      	uxth	r5, r5
 80009a6:	213e      	movs	r1, #62	; 0x3e
 80009a8:	20d0      	movs	r0, #208	; 0xd0
 80009aa:	8065      	strh	r5, [r4, #2]
 80009ac:	f000 fbc8 	bl	8001140 <i2c_read_reg>
 80009b0:	213f      	movs	r1, #63	; 0x3f
 80009b2:	4305      	orrs	r5, r0
 80009b4:	20d0      	movs	r0, #208	; 0xd0
 80009b6:	8065      	strh	r5, [r4, #2]
 80009b8:	f000 fbc2 	bl	8001140 <i2c_read_reg>
 80009bc:	0205      	lsls	r5, r0, #8
 80009be:	b2ad      	uxth	r5, r5
 80009c0:	2140      	movs	r1, #64	; 0x40
 80009c2:	20d0      	movs	r0, #208	; 0xd0
 80009c4:	80a5      	strh	r5, [r4, #4]
 80009c6:	f000 fbbb 	bl	8001140 <i2c_read_reg>
 80009ca:	2141      	movs	r1, #65	; 0x41
 80009cc:	4305      	orrs	r5, r0
 80009ce:	20d0      	movs	r0, #208	; 0xd0
 80009d0:	80a5      	strh	r5, [r4, #4]
 80009d2:	f000 fbb5 	bl	8001140 <i2c_read_reg>
 80009d6:	0205      	lsls	r5, r0, #8
 80009d8:	b2ad      	uxth	r5, r5
 80009da:	2142      	movs	r1, #66	; 0x42
 80009dc:	20d0      	movs	r0, #208	; 0xd0
 80009de:	8265      	strh	r5, [r4, #18]
 80009e0:	f000 fbae 	bl	8001140 <i2c_read_reg>
 80009e4:	2143      	movs	r1, #67	; 0x43
 80009e6:	4305      	orrs	r5, r0
 80009e8:	20d0      	movs	r0, #208	; 0xd0
 80009ea:	8265      	strh	r5, [r4, #18]
 80009ec:	f000 fba8 	bl	8001140 <i2c_read_reg>
 80009f0:	0205      	lsls	r5, r0, #8
 80009f2:	b2ad      	uxth	r5, r5
 80009f4:	2144      	movs	r1, #68	; 0x44
 80009f6:	20d0      	movs	r0, #208	; 0xd0
 80009f8:	80e5      	strh	r5, [r4, #6]
 80009fa:	f000 fba1 	bl	8001140 <i2c_read_reg>
 80009fe:	2145      	movs	r1, #69	; 0x45
 8000a00:	4305      	orrs	r5, r0
 8000a02:	20d0      	movs	r0, #208	; 0xd0
 8000a04:	80e5      	strh	r5, [r4, #6]
 8000a06:	f000 fb9b 	bl	8001140 <i2c_read_reg>
 8000a0a:	0205      	lsls	r5, r0, #8
 8000a0c:	b2ad      	uxth	r5, r5
 8000a0e:	2146      	movs	r1, #70	; 0x46
 8000a10:	20d0      	movs	r0, #208	; 0xd0
 8000a12:	8125      	strh	r5, [r4, #8]
 8000a14:	f000 fb94 	bl	8001140 <i2c_read_reg>
 8000a18:	2147      	movs	r1, #71	; 0x47
 8000a1a:	4305      	orrs	r5, r0
 8000a1c:	20d0      	movs	r0, #208	; 0xd0
 8000a1e:	8125      	strh	r5, [r4, #8]
 8000a20:	f000 fb8e 	bl	8001140 <i2c_read_reg>
 8000a24:	0205      	lsls	r5, r0, #8
 8000a26:	b2ad      	uxth	r5, r5
 8000a28:	2148      	movs	r1, #72	; 0x48
 8000a2a:	20d0      	movs	r0, #208	; 0xd0
 8000a2c:	8165      	strh	r5, [r4, #10]
 8000a2e:	f000 fb87 	bl	8001140 <i2c_read_reg>
 8000a32:	4305      	orrs	r5, r0
 8000a34:	8165      	strh	r5, [r4, #10]
 8000a36:	bd38      	pop	{r3, r4, r5, pc}
 8000a38:	2000056e 	.word	0x2000056e

08000a3c <mpu6050_init>:
 8000a3c:	b5f7      	push	{r0, r1, r2, r4, r5, r6, r7, lr}
 8000a3e:	2500      	movs	r5, #0
 8000a40:	4c19      	ldr	r4, [pc, #100]	; (8000aa8 <mpu6050_init+0x6c>)
 8000a42:	1c2a      	adds	r2, r5, #0
 8000a44:	20d0      	movs	r0, #208	; 0xd0
 8000a46:	216b      	movs	r1, #107	; 0x6b
 8000a48:	8025      	strh	r5, [r4, #0]
 8000a4a:	8065      	strh	r5, [r4, #2]
 8000a4c:	80a5      	strh	r5, [r4, #4]
 8000a4e:	80e5      	strh	r5, [r4, #6]
 8000a50:	8125      	strh	r5, [r4, #8]
 8000a52:	8165      	strh	r5, [r4, #10]
 8000a54:	f000 fb62 	bl	800111c <i2c_write_reg>
 8000a58:	2264      	movs	r2, #100	; 0x64
 8000a5a:	9201      	str	r2, [sp, #4]
 8000a5c:	1c2e      	adds	r6, r5, #0
 8000a5e:	1c2f      	adds	r7, r5, #0
 8000a60:	f7ff ff8c 	bl	800097c <mpu6050_read>
 8000a64:	200a      	movs	r0, #10
 8000a66:	f000 fa0b 	bl	8000e80 <timer_delay_ms>
 8000a6a:	2206      	movs	r2, #6
 8000a6c:	5ea3      	ldrsh	r3, [r4, r2]
 8000a6e:	18ff      	adds	r7, r7, r3
 8000a70:	2208      	movs	r2, #8
 8000a72:	5ea3      	ldrsh	r3, [r4, r2]
 8000a74:	18f6      	adds	r6, r6, r3
 8000a76:	220a      	movs	r2, #10
 8000a78:	5ea3      	ldrsh	r3, [r4, r2]
 8000a7a:	18ed      	adds	r5, r5, r3
 8000a7c:	9b01      	ldr	r3, [sp, #4]
 8000a7e:	3b01      	subs	r3, #1
 8000a80:	9301      	str	r3, [sp, #4]
 8000a82:	2b00      	cmp	r3, #0
 8000a84:	d1ec      	bne.n	8000a60 <mpu6050_init+0x24>
 8000a86:	1c38      	adds	r0, r7, #0
 8000a88:	2164      	movs	r1, #100	; 0x64
 8000a8a:	f001 f9a5 	bl	8001dd8 <__aeabi_idiv>
 8000a8e:	2164      	movs	r1, #100	; 0x64
 8000a90:	81a0      	strh	r0, [r4, #12]
 8000a92:	1c30      	adds	r0, r6, #0
 8000a94:	f001 f9a0 	bl	8001dd8 <__aeabi_idiv>
 8000a98:	2164      	movs	r1, #100	; 0x64
 8000a9a:	81e0      	strh	r0, [r4, #14]
 8000a9c:	1c28      	adds	r0, r5, #0
 8000a9e:	f001 f99b 	bl	8001dd8 <__aeabi_idiv>
 8000aa2:	8220      	strh	r0, [r4, #16]
 8000aa4:	bdf7      	pop	{r0, r1, r2, r4, r5, r6, r7, pc}
 8000aa6:	46c0      	nop			; (mov r8, r8)
 8000aa8:	2000056e 	.word	0x2000056e

08000aac <child_thread>:
 8000aac:	b570      	push	{r4, r5, r6, lr}
 8000aae:	2008      	movs	r0, #8
 8000ab0:	f001 f8e6 	bl	8001c80 <led_on>
 8000ab4:	f000 f9d8 	bl	8000e68 <timer_get_time>
 8000ab8:	1c01      	adds	r1, r0, #0
 8000aba:	4831      	ldr	r0, [pc, #196]	; (8000b80 <child_thread+0xd4>)
 8000abc:	f7ff fcb8 	bl	8000430 <printf_>
 8000ac0:	4c30      	ldr	r4, [pc, #192]	; (8000b84 <child_thread+0xd8>)
 8000ac2:	4d31      	ldr	r5, [pc, #196]	; (8000b88 <child_thread+0xdc>)
 8000ac4:	2302      	movs	r3, #2
 8000ac6:	5ee2      	ldrsh	r2, [r4, r3]
 8000ac8:	2000      	movs	r0, #0
 8000aca:	5e21      	ldrsh	r1, [r4, r0]
 8000acc:	2604      	movs	r6, #4
 8000ace:	5fa3      	ldrsh	r3, [r4, r6]
 8000ad0:	1c28      	adds	r0, r5, #0
 8000ad2:	f7ff fcad 	bl	8000430 <printf_>
 8000ad6:	220c      	movs	r2, #12
 8000ad8:	5ea3      	ldrsh	r3, [r4, r2]
 8000ada:	2006      	movs	r0, #6
 8000adc:	5e21      	ldrsh	r1, [r4, r0]
 8000ade:	1ac9      	subs	r1, r1, r3
 8000ae0:	2308      	movs	r3, #8
 8000ae2:	5ee2      	ldrsh	r2, [r4, r3]
 8000ae4:	260e      	movs	r6, #14
 8000ae6:	5fa3      	ldrsh	r3, [r4, r6]
 8000ae8:	1ad2      	subs	r2, r2, r3
 8000aea:	230a      	movs	r3, #10
 8000aec:	5ee0      	ldrsh	r0, [r4, r3]
 8000aee:	2610      	movs	r6, #16
 8000af0:	5fa3      	ldrsh	r3, [r4, r6]
 8000af2:	1ac3      	subs	r3, r0, r3
 8000af4:	1c28      	adds	r0, r5, #0
 8000af6:	f7ff fc9b 	bl	8000430 <printf_>
 8000afa:	4b24      	ldr	r3, [pc, #144]	; (8000b8c <child_thread+0xe0>)
 8000afc:	2000      	movs	r0, #0
 8000afe:	5e19      	ldrsh	r1, [r3, r0]
 8000b00:	2602      	movs	r6, #2
 8000b02:	5f9a      	ldrsh	r2, [r3, r6]
 8000b04:	2004      	movs	r0, #4
 8000b06:	5e1b      	ldrsh	r3, [r3, r0]
 8000b08:	1c28      	adds	r0, r5, #0
 8000b0a:	f7ff fc91 	bl	8000430 <printf_>
 8000b0e:	4820      	ldr	r0, [pc, #128]	; (8000b90 <child_thread+0xe4>)
 8000b10:	f7ff fc8e 	bl	8000430 <printf_>
 8000b14:	2008      	movs	r0, #8
 8000b16:	f001 f8c7 	bl	8001ca8 <led_off>
 8000b1a:	2206      	movs	r2, #6
 8000b1c:	5ea0      	ldrsh	r0, [r4, r2]
 8000b1e:	f7ff fd93 	bl	8000648 <mint_abs>
 8000b22:	25fa      	movs	r5, #250	; 0xfa
 8000b24:	00ad      	lsls	r5, r5, #2
 8000b26:	42a8      	cmp	r0, r5
 8000b28:	dd04      	ble.n	8000b34 <child_thread+0x88>
 8000b2a:	2080      	movs	r0, #128	; 0x80
 8000b2c:	0040      	lsls	r0, r0, #1
 8000b2e:	f001 f8a7 	bl	8001c80 <led_on>
 8000b32:	e003      	b.n	8000b3c <child_thread+0x90>
 8000b34:	2080      	movs	r0, #128	; 0x80
 8000b36:	0040      	lsls	r0, r0, #1
 8000b38:	f001 f8b6 	bl	8001ca8 <led_off>
 8000b3c:	2308      	movs	r3, #8
 8000b3e:	5ee0      	ldrsh	r0, [r4, r3]
 8000b40:	f7ff fd82 	bl	8000648 <mint_abs>
 8000b44:	42a8      	cmp	r0, r5
 8000b46:	dd04      	ble.n	8000b52 <child_thread+0xa6>
 8000b48:	2080      	movs	r0, #128	; 0x80
 8000b4a:	0100      	lsls	r0, r0, #4
 8000b4c:	f001 f898 	bl	8001c80 <led_on>
 8000b50:	e003      	b.n	8000b5a <child_thread+0xae>
 8000b52:	2080      	movs	r0, #128	; 0x80
 8000b54:	0100      	lsls	r0, r0, #4
 8000b56:	f001 f8a7 	bl	8001ca8 <led_off>
 8000b5a:	260a      	movs	r6, #10
 8000b5c:	5fa0      	ldrsh	r0, [r4, r6]
 8000b5e:	f7ff fd73 	bl	8000648 <mint_abs>
 8000b62:	23fa      	movs	r3, #250	; 0xfa
 8000b64:	009b      	lsls	r3, r3, #2
 8000b66:	4298      	cmp	r0, r3
 8000b68:	dd03      	ble.n	8000b72 <child_thread+0xc6>
 8000b6a:	2002      	movs	r0, #2
 8000b6c:	f001 f888 	bl	8001c80 <led_on>
 8000b70:	e002      	b.n	8000b78 <child_thread+0xcc>
 8000b72:	2002      	movs	r0, #2
 8000b74:	f001 f898 	bl	8001ca8 <led_off>
 8000b78:	2064      	movs	r0, #100	; 0x64
 8000b7a:	f000 f981 	bl	8000e80 <timer_delay_ms>
 8000b7e:	e796      	b.n	8000aae <child_thread+0x2>
 8000b80:	080024c5 	.word	0x080024c5
 8000b84:	2000056e 	.word	0x2000056e
 8000b88:	080024cc 	.word	0x080024cc
 8000b8c:	20000164 	.word	0x20000164
 8000b90:	08002560 	.word	0x08002560

08000b94 <lcd_put_int>:
 8000b94:	b5f0      	push	{r4, r5, r6, r7, lr}
 8000b96:	2300      	movs	r3, #0
 8000b98:	b087      	sub	sp, #28
 8000b9a:	1c04      	adds	r4, r0, #0
 8000b9c:	9100      	str	r1, [sp, #0]
 8000b9e:	9201      	str	r2, [sp, #4]
 8000ba0:	1c1f      	adds	r7, r3, #0
 8000ba2:	4298      	cmp	r0, r3
 8000ba4:	da01      	bge.n	8000baa <lcd_put_int+0x16>
 8000ba6:	4244      	negs	r4, r0
 8000ba8:	2701      	movs	r7, #1
 8000baa:	ae03      	add	r6, sp, #12
 8000bac:	72f3      	strb	r3, [r6, #11]
 8000bae:	250a      	movs	r5, #10
 8000bb0:	1c20      	adds	r0, r4, #0
 8000bb2:	210a      	movs	r1, #10
 8000bb4:	f001 f966 	bl	8001e84 <__aeabi_idivmod>
 8000bb8:	3130      	adds	r1, #48	; 0x30
 8000bba:	5571      	strb	r1, [r6, r5]
 8000bbc:	1c20      	adds	r0, r4, #0
 8000bbe:	210a      	movs	r1, #10
 8000bc0:	f001 f90a 	bl	8001dd8 <__aeabi_idiv>
 8000bc4:	1e6b      	subs	r3, r5, #1
 8000bc6:	1e04      	subs	r4, r0, #0
 8000bc8:	d001      	beq.n	8000bce <lcd_put_int+0x3a>
 8000bca:	1c1d      	adds	r5, r3, #0
 8000bcc:	e7f0      	b.n	8000bb0 <lcd_put_int+0x1c>
 8000bce:	2f00      	cmp	r7, #0
 8000bd0:	d002      	beq.n	8000bd8 <lcd_put_int+0x44>
 8000bd2:	222d      	movs	r2, #45	; 0x2d
 8000bd4:	54f2      	strb	r2, [r6, r3]
 8000bd6:	1c1d      	adds	r5, r3, #0
 8000bd8:	2400      	movs	r4, #0
 8000bda:	1973      	adds	r3, r6, r5
 8000bdc:	5d1f      	ldrb	r7, [r3, r4]
 8000bde:	9b00      	ldr	r3, [sp, #0]
 8000be0:	00e0      	lsls	r0, r4, #3
 8000be2:	18c0      	adds	r0, r0, r3
 8000be4:	9901      	ldr	r1, [sp, #4]
 8000be6:	1c3a      	adds	r2, r7, #0
 8000be8:	f7ff fe9c 	bl	8000924 <lcd_put_char_xy>
 8000bec:	2f00      	cmp	r7, #0
 8000bee:	d002      	beq.n	8000bf6 <lcd_put_int+0x62>
 8000bf0:	3401      	adds	r4, #1
 8000bf2:	2c0c      	cmp	r4, #12
 8000bf4:	d1f1      	bne.n	8000bda <lcd_put_int+0x46>
 8000bf6:	b007      	add	sp, #28
 8000bf8:	bdf0      	pop	{r4, r5, r6, r7, pc}
	...

08000bfc <main_thread>:
 8000bfc:	b5f0      	push	{r4, r5, r6, r7, lr}
 8000bfe:	2008      	movs	r0, #8
 8000c00:	b085      	sub	sp, #20
 8000c02:	f001 f83d 	bl	8001c80 <led_on>
 8000c06:	483b      	ldr	r0, [pc, #236]	; (8000cf4 <main_thread+0xf8>)
 8000c08:	f7ff fc12 	bl	8000430 <printf_>
 8000c0c:	f7ff fcc0 	bl	8000590 <hmc5883_init>
 8000c10:	f7ff ff14 	bl	8000a3c <mpu6050_init>
 8000c14:	f7ff fe28 	bl	8000868 <LCD_SH1106_init>
 8000c18:	20ff      	movs	r0, #255	; 0xff
 8000c1a:	f7ff fd51 	bl	80006c0 <LCD_SH1106_clear_buffer>
 8000c1e:	2280      	movs	r2, #128	; 0x80
 8000c20:	4935      	ldr	r1, [pc, #212]	; (8000cf8 <main_thread+0xfc>)
 8000c22:	0052      	lsls	r2, r2, #1
 8000c24:	2308      	movs	r3, #8
 8000c26:	4835      	ldr	r0, [pc, #212]	; (8000cfc <main_thread+0x100>)
 8000c28:	2500      	movs	r5, #0
 8000c2a:	f7ff fad7 	bl	80001dc <create_thread>
 8000c2e:	2000      	movs	r0, #0
 8000c30:	2132      	movs	r1, #50	; 0x32
 8000c32:	f000 f935 	bl	8000ea0 <event_timer_set_period>
 8000c36:	1c2e      	adds	r6, r5, #0
 8000c38:	9503      	str	r5, [sp, #12]
 8000c3a:	9502      	str	r5, [sp, #8]
 8000c3c:	9501      	str	r5, [sp, #4]
 8000c3e:	1c2f      	adds	r7, r5, #0
 8000c40:	2000      	movs	r0, #0
 8000c42:	f000 f93f 	bl	8000ec4 <event_timer_get_flag>
 8000c46:	2800      	cmp	r0, #0
 8000c48:	d01f      	beq.n	8000c8a <main_thread+0x8e>
 8000c4a:	2000      	movs	r0, #0
 8000c4c:	f000 f948 	bl	8000ee0 <event_timer_clear_flag>
 8000c50:	f7ff fcce 	bl	80005f0 <hmc5883_read>
 8000c54:	f7ff fe92 	bl	800097c <mpu6050_read>
 8000c58:	4b29      	ldr	r3, [pc, #164]	; (8000d00 <main_thread+0x104>)
 8000c5a:	210c      	movs	r1, #12
 8000c5c:	5e5a      	ldrsh	r2, [r3, r1]
 8000c5e:	2106      	movs	r1, #6
 8000c60:	5e5f      	ldrsh	r7, [r3, r1]
 8000c62:	1abf      	subs	r7, r7, r2
 8000c64:	2208      	movs	r2, #8
 8000c66:	5e9e      	ldrsh	r6, [r3, r2]
 8000c68:	210e      	movs	r1, #14
 8000c6a:	5e5a      	ldrsh	r2, [r3, r1]
 8000c6c:	1ab6      	subs	r6, r6, r2
 8000c6e:	210a      	movs	r1, #10
 8000c70:	5e5a      	ldrsh	r2, [r3, r1]
 8000c72:	2110      	movs	r1, #16
 8000c74:	5e5b      	ldrsh	r3, [r3, r1]
 8000c76:	1ad3      	subs	r3, r2, r3
 8000c78:	9301      	str	r3, [sp, #4]
 8000c7a:	9a02      	ldr	r2, [sp, #8]
 8000c7c:	9b03      	ldr	r3, [sp, #12]
 8000c7e:	9901      	ldr	r1, [sp, #4]
 8000c80:	19d2      	adds	r2, r2, r7
 8000c82:	199b      	adds	r3, r3, r6
 8000c84:	9202      	str	r2, [sp, #8]
 8000c86:	9303      	str	r3, [sp, #12]
 8000c88:	186d      	adds	r5, r5, r1
 8000c8a:	f7ff fd81 	bl	8000790 <LCD_SH1106_flush_buffer_partial>
 8000c8e:	1e04      	subs	r4, r0, #0
 8000c90:	d1d6      	bne.n	8000c40 <main_thread+0x44>
 8000c92:	f7ff fd15 	bl	80006c0 <LCD_SH1106_clear_buffer>
 8000c96:	1c38      	adds	r0, r7, #0
 8000c98:	1c21      	adds	r1, r4, #0
 8000c9a:	1c22      	adds	r2, r4, #0
 8000c9c:	f7ff ff7a 	bl	8000b94 <lcd_put_int>
 8000ca0:	1c30      	adds	r0, r6, #0
 8000ca2:	1c21      	adds	r1, r4, #0
 8000ca4:	2210      	movs	r2, #16
 8000ca6:	f7ff ff75 	bl	8000b94 <lcd_put_int>
 8000caa:	9801      	ldr	r0, [sp, #4]
 8000cac:	1c21      	adds	r1, r4, #0
 8000cae:	2220      	movs	r2, #32
 8000cb0:	f7ff ff70 	bl	8000b94 <lcd_put_int>
 8000cb4:	9802      	ldr	r0, [sp, #8]
 8000cb6:	210a      	movs	r1, #10
 8000cb8:	f001 f88e 	bl	8001dd8 <__aeabi_idiv>
 8000cbc:	1c22      	adds	r2, r4, #0
 8000cbe:	2140      	movs	r1, #64	; 0x40
 8000cc0:	f7ff ff68 	bl	8000b94 <lcd_put_int>
 8000cc4:	9803      	ldr	r0, [sp, #12]
 8000cc6:	210a      	movs	r1, #10
 8000cc8:	f001 f886 	bl	8001dd8 <__aeabi_idiv>
 8000ccc:	2210      	movs	r2, #16
 8000cce:	2140      	movs	r1, #64	; 0x40
 8000cd0:	f7ff ff60 	bl	8000b94 <lcd_put_int>
 8000cd4:	1c28      	adds	r0, r5, #0
 8000cd6:	210a      	movs	r1, #10
 8000cd8:	f001 f87e 	bl	8001dd8 <__aeabi_idiv>
 8000cdc:	2140      	movs	r1, #64	; 0x40
 8000cde:	2220      	movs	r2, #32
 8000ce0:	f7ff ff58 	bl	8000b94 <lcd_put_int>
 8000ce4:	f000 f8c0 	bl	8000e68 <timer_get_time>
 8000ce8:	1c21      	adds	r1, r4, #0
 8000cea:	2230      	movs	r2, #48	; 0x30
 8000cec:	f7ff ff52 	bl	8000b94 <lcd_put_int>
 8000cf0:	e7a6      	b.n	8000c40 <main_thread+0x44>
 8000cf2:	46c0      	nop			; (mov r8, r8)
 8000cf4:	080024d8 	.word	0x080024d8
 8000cf8:	20000584 	.word	0x20000584
 8000cfc:	08000aad 	.word	0x08000aad
 8000d00:	2000056e 	.word	0x2000056e

08000d04 <mem_info_print>:
 8000d04:	b538      	push	{r3, r4, r5, lr}
 8000d06:	480e      	ldr	r0, [pc, #56]	; (8000d40 <mem_info_print+0x3c>)
 8000d08:	490e      	ldr	r1, [pc, #56]	; (8000d44 <mem_info_print+0x40>)
 8000d0a:	f7ff fb91 	bl	8000430 <printf_>
 8000d0e:	4c0e      	ldr	r4, [pc, #56]	; (8000d48 <mem_info_print+0x44>)
 8000d10:	480e      	ldr	r0, [pc, #56]	; (8000d4c <mem_info_print+0x48>)
 8000d12:	1c21      	adds	r1, r4, #0
 8000d14:	f7ff fb8c 	bl	8000430 <printf_>
 8000d18:	4d0d      	ldr	r5, [pc, #52]	; (8000d50 <mem_info_print+0x4c>)
 8000d1a:	480e      	ldr	r0, [pc, #56]	; (8000d54 <mem_info_print+0x50>)
 8000d1c:	1b2d      	subs	r5, r5, r4
 8000d1e:	1c29      	adds	r1, r5, #0
 8000d20:	f7ff fb86 	bl	8000430 <printf_>
 8000d24:	490c      	ldr	r1, [pc, #48]	; (8000d58 <mem_info_print+0x54>)
 8000d26:	480d      	ldr	r0, [pc, #52]	; (8000d5c <mem_info_print+0x58>)
 8000d28:	1a64      	subs	r4, r4, r1
 8000d2a:	1929      	adds	r1, r5, r4
 8000d2c:	f7ff fb80 	bl	8000430 <printf_>
 8000d30:	490b      	ldr	r1, [pc, #44]	; (8000d60 <mem_info_print+0x5c>)
 8000d32:	480c      	ldr	r0, [pc, #48]	; (8000d64 <mem_info_print+0x60>)
 8000d34:	f7ff fb7c 	bl	8000430 <printf_>
 8000d38:	480b      	ldr	r0, [pc, #44]	; (8000d68 <mem_info_print+0x64>)
 8000d3a:	f7ff fb79 	bl	8000430 <printf_>
 8000d3e:	bd38      	pop	{r3, r4, r5, pc}
 8000d40:	08002513 	.word	0x08002513
 8000d44:	08001e9c 	.word	0x08001e9c
 8000d48:	20000000 	.word	0x20000000
 8000d4c:	08002524 	.word	0x08002524
 8000d50:	20001000 	.word	0x20001000
 8000d54:	08002533 	.word	0x08002533
 8000d58:	200008c0 	.word	0x200008c0
 8000d5c:	08002541 	.word	0x08002541
 8000d60:	200008c0 	.word	0x200008c0
 8000d64:	0800254f 	.word	0x0800254f
 8000d68:	0800255f 	.word	0x0800255f

08000d6c <main>:
 8000d6c:	b508      	push	{r3, lr}
 8000d6e:	f000 fa6d 	bl	800124c <lib_low_level_init>
 8000d72:	f7ff fbd7 	bl	8000524 <lib_os_init>
 8000d76:	f7ff ffc5 	bl	8000d04 <mem_info_print>
 8000d7a:	22c8      	movs	r2, #200	; 0xc8
 8000d7c:	4904      	ldr	r1, [pc, #16]	; (8000d90 <main+0x24>)
 8000d7e:	0052      	lsls	r2, r2, #1
 8000d80:	2308      	movs	r3, #8
 8000d82:	4804      	ldr	r0, [pc, #16]	; (8000d94 <main+0x28>)
 8000d84:	f7ff fa2a 	bl	80001dc <create_thread>
 8000d88:	f7ff fa22 	bl	80001d0 <kernel_start>
 8000d8c:	2000      	movs	r0, #0
 8000d8e:	bd08      	pop	{r3, pc}
 8000d90:	20000714 	.word	0x20000714
 8000d94:	08000bfd 	.word	0x08000bfd

08000d98 <timer_init>:
 8000d98:	b530      	push	{r4, r5, lr}
 8000d9a:	2300      	movs	r3, #0
 8000d9c:	b085      	sub	sp, #20
 8000d9e:	481b      	ldr	r0, [pc, #108]	; (8000e0c <timer_init+0x74>)
 8000da0:	2180      	movs	r1, #128	; 0x80
 8000da2:	005a      	lsls	r2, r3, #1
 8000da4:	00c9      	lsls	r1, r1, #3
 8000da6:	5211      	strh	r1, [r2, r0]
 8000da8:	4819      	ldr	r0, [pc, #100]	; (8000e10 <timer_init+0x78>)
 8000daa:	2400      	movs	r4, #0
 8000dac:	5211      	strh	r1, [r2, r0]
 8000dae:	4919      	ldr	r1, [pc, #100]	; (8000e14 <timer_init+0x7c>)
 8000db0:	3301      	adds	r3, #1
 8000db2:	5254      	strh	r4, [r2, r1]
 8000db4:	2b04      	cmp	r3, #4
 8000db6:	d1f2      	bne.n	8000d9e <timer_init+0x6>
 8000db8:	4b17      	ldr	r3, [pc, #92]	; (8000e18 <timer_init+0x80>)
 8000dba:	2001      	movs	r0, #1
 8000dbc:	1c01      	adds	r1, r0, #0
 8000dbe:	601c      	str	r4, [r3, #0]
 8000dc0:	f000 fef0 	bl	8001ba4 <RCC_APB1PeriphClockCmd>
 8000dc4:	a901      	add	r1, sp, #4
 8000dc6:	2330      	movs	r3, #48	; 0x30
 8000dc8:	800b      	strh	r3, [r1, #0]
 8000dca:	2080      	movs	r0, #128	; 0x80
 8000dcc:	23fa      	movs	r3, #250	; 0xfa
 8000dce:	009b      	lsls	r3, r3, #2
 8000dd0:	05c0      	lsls	r0, r0, #23
 8000dd2:	604b      	str	r3, [r1, #4]
 8000dd4:	804c      	strh	r4, [r1, #2]
 8000dd6:	810c      	strh	r4, [r1, #8]
 8000dd8:	728c      	strb	r4, [r1, #10]
 8000dda:	f000 fb0d 	bl	80013f8 <TIM_TimeBaseInit>
 8000dde:	2080      	movs	r0, #128	; 0x80
 8000de0:	05c0      	lsls	r0, r0, #23
 8000de2:	2101      	movs	r1, #1
 8000de4:	f000 fb8a 	bl	80014fc <TIM_Cmd>
 8000de8:	2080      	movs	r0, #128	; 0x80
 8000dea:	2102      	movs	r1, #2
 8000dec:	05c0      	lsls	r0, r0, #23
 8000dee:	2201      	movs	r2, #1
 8000df0:	f000 fbc8 	bl	8001584 <TIM_ITConfig>
 8000df4:	466a      	mov	r2, sp
 8000df6:	230f      	movs	r3, #15
 8000df8:	7013      	strb	r3, [r2, #0]
 8000dfa:	4668      	mov	r0, sp
 8000dfc:	2301      	movs	r3, #1
 8000dfe:	7053      	strb	r3, [r2, #1]
 8000e00:	7093      	strb	r3, [r2, #2]
 8000e02:	f000 fd91 	bl	8001928 <NVIC_Init>
 8000e06:	b005      	add	sp, #20
 8000e08:	bd30      	pop	{r4, r5, pc}
 8000e0a:	46c0      	nop			; (mov r8, r8)
 8000e0c:	200008b8 	.word	0x200008b8
 8000e10:	200008ac 	.word	0x200008ac
 8000e14:	200008a4 	.word	0x200008a4
 8000e18:	200008b4 	.word	0x200008b4

08000e1c <TIM2_IRQHandler>:
 8000e1c:	2200      	movs	r2, #0
 8000e1e:	490e      	ldr	r1, [pc, #56]	; (8000e58 <TIM2_IRQHandler+0x3c>)
 8000e20:	0053      	lsls	r3, r2, #1
 8000e22:	5a58      	ldrh	r0, [r3, r1]
 8000e24:	2800      	cmp	r0, #0
 8000e26:	d003      	beq.n	8000e30 <TIM2_IRQHandler+0x14>
 8000e28:	5a58      	ldrh	r0, [r3, r1]
 8000e2a:	3801      	subs	r0, #1
 8000e2c:	b280      	uxth	r0, r0
 8000e2e:	e005      	b.n	8000e3c <TIM2_IRQHandler+0x20>
 8000e30:	480a      	ldr	r0, [pc, #40]	; (8000e5c <TIM2_IRQHandler+0x40>)
 8000e32:	5a18      	ldrh	r0, [r3, r0]
 8000e34:	b280      	uxth	r0, r0
 8000e36:	5258      	strh	r0, [r3, r1]
 8000e38:	4909      	ldr	r1, [pc, #36]	; (8000e60 <TIM2_IRQHandler+0x44>)
 8000e3a:	2001      	movs	r0, #1
 8000e3c:	3201      	adds	r2, #1
 8000e3e:	5258      	strh	r0, [r3, r1]
 8000e40:	2a04      	cmp	r2, #4
 8000e42:	d1ec      	bne.n	8000e1e <TIM2_IRQHandler+0x2>
 8000e44:	4b07      	ldr	r3, [pc, #28]	; (8000e64 <TIM2_IRQHandler+0x48>)
 8000e46:	681a      	ldr	r2, [r3, #0]
 8000e48:	3201      	adds	r2, #1
 8000e4a:	601a      	str	r2, [r3, #0]
 8000e4c:	2380      	movs	r3, #128	; 0x80
 8000e4e:	2200      	movs	r2, #0
 8000e50:	05db      	lsls	r3, r3, #23
 8000e52:	821a      	strh	r2, [r3, #16]
 8000e54:	4770      	bx	lr
 8000e56:	46c0      	nop			; (mov r8, r8)
 8000e58:	200008b8 	.word	0x200008b8
 8000e5c:	200008ac 	.word	0x200008ac
 8000e60:	200008a4 	.word	0x200008a4
 8000e64:	200008b4 	.word	0x200008b4

08000e68 <timer_get_time>:
 8000e68:	b082      	sub	sp, #8
 8000e6a:	b672      	cpsid	i
 8000e6c:	4b03      	ldr	r3, [pc, #12]	; (8000e7c <timer_get_time+0x14>)
 8000e6e:	681b      	ldr	r3, [r3, #0]
 8000e70:	9301      	str	r3, [sp, #4]
 8000e72:	b662      	cpsie	i
 8000e74:	9801      	ldr	r0, [sp, #4]
 8000e76:	b002      	add	sp, #8
 8000e78:	4770      	bx	lr
 8000e7a:	46c0      	nop			; (mov r8, r8)
 8000e7c:	200008b4 	.word	0x200008b4

08000e80 <timer_delay_ms>:
 8000e80:	b513      	push	{r0, r1, r4, lr}
 8000e82:	1c04      	adds	r4, r0, #0
 8000e84:	f7ff fff0 	bl	8000e68 <timer_get_time>
 8000e88:	1904      	adds	r4, r0, r4
 8000e8a:	9401      	str	r4, [sp, #4]
 8000e8c:	9c01      	ldr	r4, [sp, #4]
 8000e8e:	f7ff ffeb 	bl	8000e68 <timer_get_time>
 8000e92:	4284      	cmp	r4, r0
 8000e94:	d902      	bls.n	8000e9c <timer_delay_ms+0x1c>
 8000e96:	f000 f979 	bl	800118c <sleep>
 8000e9a:	e7f7      	b.n	8000e8c <timer_delay_ms+0xc>
 8000e9c:	bd13      	pop	{r0, r1, r4, pc}
	...

08000ea0 <event_timer_set_period>:
 8000ea0:	b672      	cpsid	i
 8000ea2:	4b05      	ldr	r3, [pc, #20]	; (8000eb8 <event_timer_set_period+0x18>)
 8000ea4:	0040      	lsls	r0, r0, #1
 8000ea6:	52c1      	strh	r1, [r0, r3]
 8000ea8:	4b04      	ldr	r3, [pc, #16]	; (8000ebc <event_timer_set_period+0x1c>)
 8000eaa:	2200      	movs	r2, #0
 8000eac:	52c1      	strh	r1, [r0, r3]
 8000eae:	4b04      	ldr	r3, [pc, #16]	; (8000ec0 <event_timer_set_period+0x20>)
 8000eb0:	52c2      	strh	r2, [r0, r3]
 8000eb2:	b662      	cpsie	i
 8000eb4:	4770      	bx	lr
 8000eb6:	46c0      	nop			; (mov r8, r8)
 8000eb8:	200008b8 	.word	0x200008b8
 8000ebc:	200008ac 	.word	0x200008ac
 8000ec0:	200008a4 	.word	0x200008a4

08000ec4 <event_timer_get_flag>:
 8000ec4:	b082      	sub	sp, #8
 8000ec6:	b672      	cpsid	i
 8000ec8:	4b04      	ldr	r3, [pc, #16]	; (8000edc <event_timer_get_flag+0x18>)
 8000eca:	0040      	lsls	r0, r0, #1
 8000ecc:	5ac3      	ldrh	r3, [r0, r3]
 8000ece:	b29b      	uxth	r3, r3
 8000ed0:	9301      	str	r3, [sp, #4]
 8000ed2:	b662      	cpsie	i
 8000ed4:	9801      	ldr	r0, [sp, #4]
 8000ed6:	b002      	add	sp, #8
 8000ed8:	4770      	bx	lr
 8000eda:	46c0      	nop			; (mov r8, r8)
 8000edc:	200008a4 	.word	0x200008a4

08000ee0 <event_timer_clear_flag>:
 8000ee0:	b672      	cpsid	i
 8000ee2:	4b03      	ldr	r3, [pc, #12]	; (8000ef0 <event_timer_clear_flag+0x10>)
 8000ee4:	0040      	lsls	r0, r0, #1
 8000ee6:	2200      	movs	r2, #0
 8000ee8:	52c2      	strh	r2, [r0, r3]
 8000eea:	b662      	cpsie	i
 8000eec:	4770      	bx	lr
 8000eee:	46c0      	nop			; (mov r8, r8)
 8000ef0:	200008a4 	.word	0x200008a4

08000ef4 <uart_write>:
 8000ef4:	4b03      	ldr	r3, [pc, #12]	; (8000f04 <uart_write+0x10>)
 8000ef6:	69da      	ldr	r2, [r3, #28]
 8000ef8:	0611      	lsls	r1, r2, #24
 8000efa:	d401      	bmi.n	8000f00 <uart_write+0xc>
 8000efc:	46c0      	nop			; (mov r8, r8)
 8000efe:	e7f9      	b.n	8000ef4 <uart_write>
 8000f00:	8518      	strh	r0, [r3, #40]	; 0x28
 8000f02:	4770      	bx	lr
 8000f04:	40013800 	.word	0x40013800

08000f08 <uart_init>:
 8000f08:	b570      	push	{r4, r5, r6, lr}
 8000f0a:	2080      	movs	r0, #128	; 0x80
 8000f0c:	b088      	sub	sp, #32
 8000f0e:	0280      	lsls	r0, r0, #10
 8000f10:	2101      	movs	r1, #1
 8000f12:	f000 fe07 	bl	8001b24 <RCC_AHBPeriphClockCmd>
 8000f16:	2690      	movs	r6, #144	; 0x90
 8000f18:	2080      	movs	r0, #128	; 0x80
 8000f1a:	05f6      	lsls	r6, r6, #23
 8000f1c:	01c0      	lsls	r0, r0, #7
 8000f1e:	2101      	movs	r1, #1
 8000f20:	f000 fe20 	bl	8001b64 <RCC_APB2PeriphClockCmd>
 8000f24:	1c30      	adds	r0, r6, #0
 8000f26:	2102      	movs	r1, #2
 8000f28:	2201      	movs	r2, #1
 8000f2a:	f000 fa1f 	bl	800136c <GPIO_PinAFConfig>
 8000f2e:	1c30      	adds	r0, r6, #0
 8000f30:	210f      	movs	r1, #15
 8000f32:	2201      	movs	r2, #1
 8000f34:	f000 fa1a 	bl	800136c <GPIO_PinAFConfig>
 8000f38:	4b10      	ldr	r3, [pc, #64]	; (8000f7c <uart_init+0x74>)
 8000f3a:	466a      	mov	r2, sp
 8000f3c:	2400      	movs	r4, #0
 8000f3e:	2501      	movs	r5, #1
 8000f40:	9300      	str	r3, [sp, #0]
 8000f42:	1c30      	adds	r0, r6, #0
 8000f44:	2302      	movs	r3, #2
 8000f46:	4669      	mov	r1, sp
 8000f48:	7113      	strb	r3, [r2, #4]
 8000f4a:	7194      	strb	r4, [r2, #6]
 8000f4c:	7155      	strb	r5, [r2, #5]
 8000f4e:	71d5      	strb	r5, [r2, #7]
 8000f50:	f000 f988 	bl	8001264 <GPIO_Init>
 8000f54:	9403      	str	r4, [sp, #12]
 8000f56:	9404      	str	r4, [sp, #16]
 8000f58:	9405      	str	r4, [sp, #20]
 8000f5a:	9407      	str	r4, [sp, #28]
 8000f5c:	23e1      	movs	r3, #225	; 0xe1
 8000f5e:	4c08      	ldr	r4, [pc, #32]	; (8000f80 <uart_init+0x78>)
 8000f60:	025b      	lsls	r3, r3, #9
 8000f62:	9302      	str	r3, [sp, #8]
 8000f64:	1c20      	adds	r0, r4, #0
 8000f66:	230c      	movs	r3, #12
 8000f68:	a902      	add	r1, sp, #8
 8000f6a:	9306      	str	r3, [sp, #24]
 8000f6c:	f000 fb5a 	bl	8001624 <USART_Init>
 8000f70:	1c20      	adds	r0, r4, #0
 8000f72:	1c29      	adds	r1, r5, #0
 8000f74:	f000 fc24 	bl	80017c0 <USART_Cmd>
 8000f78:	b008      	add	sp, #32
 8000f7a:	bd70      	pop	{r4, r5, r6, pc}
 8000f7c:	00008004 	.word	0x00008004
 8000f80:	40013800 	.word	0x40013800

08000f84 <USART1_IRQHandler>:
 8000f84:	b508      	push	{r3, lr}
 8000f86:	4802      	ldr	r0, [pc, #8]	; (8000f90 <USART1_IRQHandler+0xc>)
 8000f88:	4902      	ldr	r1, [pc, #8]	; (8000f94 <USART1_IRQHandler+0x10>)
 8000f8a:	f000 fc59 	bl	8001840 <USART_ClearITPendingBit>
 8000f8e:	bd08      	pop	{r3, pc}
 8000f90:	40013800 	.word	0x40013800
 8000f94:	00050105 	.word	0x00050105

08000f98 <i2c_delay>:
 8000f98:	46c0      	nop			; (mov r8, r8)
 8000f9a:	4770      	bx	lr

08000f9c <SetLowSDA>:
 8000f9c:	b508      	push	{r3, lr}
 8000f9e:	b672      	cpsid	i
 8000fa0:	4b07      	ldr	r3, [pc, #28]	; (8000fc0 <SetLowSDA+0x24>)
 8000fa2:	2210      	movs	r2, #16
 8000fa4:	851a      	strh	r2, [r3, #40]	; 0x28
 8000fa6:	685a      	ldr	r2, [r3, #4]
 8000fa8:	b292      	uxth	r2, r2
 8000faa:	809a      	strh	r2, [r3, #4]
 8000fac:	6819      	ldr	r1, [r3, #0]
 8000fae:	2280      	movs	r2, #128	; 0x80
 8000fb0:	0052      	lsls	r2, r2, #1
 8000fb2:	430a      	orrs	r2, r1
 8000fb4:	601a      	str	r2, [r3, #0]
 8000fb6:	b662      	cpsie	i
 8000fb8:	f7ff ffee 	bl	8000f98 <i2c_delay>
 8000fbc:	bd08      	pop	{r3, pc}
 8000fbe:	46c0      	nop			; (mov r8, r8)
 8000fc0:	48000400 	.word	0x48000400

08000fc4 <SetHighSDA>:
 8000fc4:	b508      	push	{r3, lr}
 8000fc6:	b672      	cpsid	i
 8000fc8:	4b07      	ldr	r3, [pc, #28]	; (8000fe8 <SetHighSDA+0x24>)
 8000fca:	2210      	movs	r2, #16
 8000fcc:	619a      	str	r2, [r3, #24]
 8000fce:	6859      	ldr	r1, [r3, #4]
 8000fd0:	b289      	uxth	r1, r1
 8000fd2:	4391      	bics	r1, r2
 8000fd4:	8099      	strh	r1, [r3, #4]
 8000fd6:	6819      	ldr	r1, [r3, #0]
 8000fd8:	4a04      	ldr	r2, [pc, #16]	; (8000fec <SetHighSDA+0x28>)
 8000fda:	400a      	ands	r2, r1
 8000fdc:	601a      	str	r2, [r3, #0]
 8000fde:	b662      	cpsie	i
 8000fe0:	f7ff ffda 	bl	8000f98 <i2c_delay>
 8000fe4:	bd08      	pop	{r3, pc}
 8000fe6:	46c0      	nop			; (mov r8, r8)
 8000fe8:	48000400 	.word	0x48000400
 8000fec:	fffffcff 	.word	0xfffffcff

08000ff0 <SetLowSCL>:
 8000ff0:	b508      	push	{r3, lr}
 8000ff2:	4b03      	ldr	r3, [pc, #12]	; (8001000 <SetLowSCL+0x10>)
 8000ff4:	2220      	movs	r2, #32
 8000ff6:	851a      	strh	r2, [r3, #40]	; 0x28
 8000ff8:	f7ff ffce 	bl	8000f98 <i2c_delay>
 8000ffc:	bd08      	pop	{r3, pc}
 8000ffe:	46c0      	nop			; (mov r8, r8)
 8001000:	48000400 	.word	0x48000400

08001004 <SetHighSCL>:
 8001004:	b508      	push	{r3, lr}
 8001006:	4b03      	ldr	r3, [pc, #12]	; (8001014 <SetHighSCL+0x10>)
 8001008:	2220      	movs	r2, #32
 800100a:	619a      	str	r2, [r3, #24]
 800100c:	f7ff ffc4 	bl	8000f98 <i2c_delay>
 8001010:	bd08      	pop	{r3, pc}
 8001012:	46c0      	nop			; (mov r8, r8)
 8001014:	48000400 	.word	0x48000400

08001018 <i2c_0_init>:
 8001018:	b507      	push	{r0, r1, r2, lr}
 800101a:	2330      	movs	r3, #48	; 0x30
 800101c:	4669      	mov	r1, sp
 800101e:	9300      	str	r3, [sp, #0]
 8001020:	2301      	movs	r3, #1
 8001022:	710b      	strb	r3, [r1, #4]
 8001024:	2203      	movs	r2, #3
 8001026:	2300      	movs	r3, #0
 8001028:	4806      	ldr	r0, [pc, #24]	; (8001044 <i2c_0_init+0x2c>)
 800102a:	718b      	strb	r3, [r1, #6]
 800102c:	714a      	strb	r2, [r1, #5]
 800102e:	71cb      	strb	r3, [r1, #7]
 8001030:	f000 f918 	bl	8001264 <GPIO_Init>
 8001034:	f7ff ffe6 	bl	8001004 <SetHighSCL>
 8001038:	f7ff ffb0 	bl	8000f9c <SetLowSDA>
 800103c:	f7ff ffc2 	bl	8000fc4 <SetHighSDA>
 8001040:	bd07      	pop	{r0, r1, r2, pc}
 8001042:	46c0      	nop			; (mov r8, r8)
 8001044:	48000400 	.word	0x48000400

08001048 <i2cStart>:
 8001048:	b508      	push	{r3, lr}
 800104a:	f7ff ffdb 	bl	8001004 <SetHighSCL>
 800104e:	f7ff ffb9 	bl	8000fc4 <SetHighSDA>
 8001052:	f7ff ffd7 	bl	8001004 <SetHighSCL>
 8001056:	f7ff ffa1 	bl	8000f9c <SetLowSDA>
 800105a:	f7ff ffc9 	bl	8000ff0 <SetLowSCL>
 800105e:	f7ff ffb1 	bl	8000fc4 <SetHighSDA>
 8001062:	bd08      	pop	{r3, pc}

08001064 <i2cStop>:
 8001064:	b508      	push	{r3, lr}
 8001066:	f7ff ffc3 	bl	8000ff0 <SetLowSCL>
 800106a:	f7ff ff97 	bl	8000f9c <SetLowSDA>
 800106e:	f7ff ffc9 	bl	8001004 <SetHighSCL>
 8001072:	f7ff ff93 	bl	8000f9c <SetLowSDA>
 8001076:	f7ff ffc5 	bl	8001004 <SetHighSCL>
 800107a:	f7ff ffa3 	bl	8000fc4 <SetHighSDA>
 800107e:	bd08      	pop	{r3, pc}

08001080 <i2cWrite>:
 8001080:	b538      	push	{r3, r4, r5, lr}
 8001082:	1c05      	adds	r5, r0, #0
 8001084:	2408      	movs	r4, #8
 8001086:	f7ff ffb3 	bl	8000ff0 <SetLowSCL>
 800108a:	b26b      	sxtb	r3, r5
 800108c:	2b00      	cmp	r3, #0
 800108e:	da02      	bge.n	8001096 <i2cWrite+0x16>
 8001090:	f7ff ff98 	bl	8000fc4 <SetHighSDA>
 8001094:	e001      	b.n	800109a <i2cWrite+0x1a>
 8001096:	f7ff ff81 	bl	8000f9c <SetLowSDA>
 800109a:	3c01      	subs	r4, #1
 800109c:	006d      	lsls	r5, r5, #1
 800109e:	b2e4      	uxtb	r4, r4
 80010a0:	f7ff ffb0 	bl	8001004 <SetHighSCL>
 80010a4:	b2ed      	uxtb	r5, r5
 80010a6:	2c00      	cmp	r4, #0
 80010a8:	d1ed      	bne.n	8001086 <i2cWrite+0x6>
 80010aa:	f7ff ffa1 	bl	8000ff0 <SetLowSCL>
 80010ae:	f7ff ff89 	bl	8000fc4 <SetHighSDA>
 80010b2:	f7ff ffa7 	bl	8001004 <SetHighSCL>
 80010b6:	4b05      	ldr	r3, [pc, #20]	; (80010cc <i2cWrite+0x4c>)
 80010b8:	691c      	ldr	r4, [r3, #16]
 80010ba:	f7ff ff99 	bl	8000ff0 <SetLowSCL>
 80010be:	b2a4      	uxth	r4, r4
 80010c0:	f7ff ff6a 	bl	8000f98 <i2c_delay>
 80010c4:	0924      	lsrs	r4, r4, #4
 80010c6:	2001      	movs	r0, #1
 80010c8:	43a0      	bics	r0, r4
 80010ca:	bd38      	pop	{r3, r4, r5, pc}
 80010cc:	48000400 	.word	0x48000400

080010d0 <i2cRead>:
 80010d0:	b570      	push	{r4, r5, r6, lr}
 80010d2:	1c06      	adds	r6, r0, #0
 80010d4:	f7ff ff8c 	bl	8000ff0 <SetLowSCL>
 80010d8:	f7ff ff74 	bl	8000fc4 <SetHighSDA>
 80010dc:	2508      	movs	r5, #8
 80010de:	2400      	movs	r4, #0
 80010e0:	f7ff ff90 	bl	8001004 <SetHighSCL>
 80010e4:	4b0c      	ldr	r3, [pc, #48]	; (8001118 <i2cRead+0x48>)
 80010e6:	0064      	lsls	r4, r4, #1
 80010e8:	691b      	ldr	r3, [r3, #16]
 80010ea:	b2e4      	uxtb	r4, r4
 80010ec:	06da      	lsls	r2, r3, #27
 80010ee:	d501      	bpl.n	80010f4 <i2cRead+0x24>
 80010f0:	3401      	adds	r4, #1
 80010f2:	b2e4      	uxtb	r4, r4
 80010f4:	3d01      	subs	r5, #1
 80010f6:	b2ed      	uxtb	r5, r5
 80010f8:	f7ff ff7a 	bl	8000ff0 <SetLowSCL>
 80010fc:	2d00      	cmp	r5, #0
 80010fe:	d1ef      	bne.n	80010e0 <i2cRead+0x10>
 8001100:	2e00      	cmp	r6, #0
 8001102:	d001      	beq.n	8001108 <i2cRead+0x38>
 8001104:	f7ff ff4a 	bl	8000f9c <SetLowSDA>
 8001108:	f7ff ff7c 	bl	8001004 <SetHighSCL>
 800110c:	f7ff ff70 	bl	8000ff0 <SetLowSCL>
 8001110:	f7ff ff42 	bl	8000f98 <i2c_delay>
 8001114:	1c20      	adds	r0, r4, #0
 8001116:	bd70      	pop	{r4, r5, r6, pc}
 8001118:	48000400 	.word	0x48000400

0800111c <i2c_write_reg>:
 800111c:	b570      	push	{r4, r5, r6, lr}
 800111e:	1c06      	adds	r6, r0, #0
 8001120:	1c0d      	adds	r5, r1, #0
 8001122:	1c14      	adds	r4, r2, #0
 8001124:	f7ff ff90 	bl	8001048 <i2cStart>
 8001128:	1c30      	adds	r0, r6, #0
 800112a:	f7ff ffa9 	bl	8001080 <i2cWrite>
 800112e:	1c28      	adds	r0, r5, #0
 8001130:	f7ff ffa6 	bl	8001080 <i2cWrite>
 8001134:	1c20      	adds	r0, r4, #0
 8001136:	f7ff ffa3 	bl	8001080 <i2cWrite>
 800113a:	f7ff ff93 	bl	8001064 <i2cStop>
 800113e:	bd70      	pop	{r4, r5, r6, pc}

08001140 <i2c_read_reg>:
 8001140:	b538      	push	{r3, r4, r5, lr}
 8001142:	1c04      	adds	r4, r0, #0
 8001144:	1c0d      	adds	r5, r1, #0
 8001146:	f7ff ff7f 	bl	8001048 <i2cStart>
 800114a:	1c20      	adds	r0, r4, #0
 800114c:	f7ff ff98 	bl	8001080 <i2cWrite>
 8001150:	1c28      	adds	r0, r5, #0
 8001152:	f7ff ff95 	bl	8001080 <i2cWrite>
 8001156:	f7ff ff77 	bl	8001048 <i2cStart>
 800115a:	2001      	movs	r0, #1
 800115c:	4320      	orrs	r0, r4
 800115e:	f7ff ff8f 	bl	8001080 <i2cWrite>
 8001162:	2000      	movs	r0, #0
 8001164:	f7ff ffb4 	bl	80010d0 <i2cRead>
 8001168:	1c04      	adds	r4, r0, #0
 800116a:	f7ff ff7b 	bl	8001064 <i2cStop>
 800116e:	1c20      	adds	r0, r4, #0
 8001170:	bd38      	pop	{r3, r4, r5, pc}

08001172 <assert_param>:
 8001172:	4770      	bx	lr

08001174 <sys_tick_init>:
 8001174:	4b03      	ldr	r3, [pc, #12]	; (8001184 <sys_tick_init+0x10>)
 8001176:	4a04      	ldr	r2, [pc, #16]	; (8001188 <sys_tick_init+0x14>)
 8001178:	605a      	str	r2, [r3, #4]
 800117a:	2200      	movs	r2, #0
 800117c:	609a      	str	r2, [r3, #8]
 800117e:	2207      	movs	r2, #7
 8001180:	601a      	str	r2, [r3, #0]
 8001182:	4770      	bx	lr
 8001184:	e000e010 	.word	0xe000e010
 8001188:	0000bb80 	.word	0x0000bb80

0800118c <sleep>:
 800118c:	bf30      	wfi
 800118e:	4770      	bx	lr

08001190 <SystemInit>:
 8001190:	4b26      	ldr	r3, [pc, #152]	; (800122c <SystemInit+0x9c>)
 8001192:	2201      	movs	r2, #1
 8001194:	6819      	ldr	r1, [r3, #0]
 8001196:	b082      	sub	sp, #8
 8001198:	4311      	orrs	r1, r2
 800119a:	6019      	str	r1, [r3, #0]
 800119c:	6858      	ldr	r0, [r3, #4]
 800119e:	4924      	ldr	r1, [pc, #144]	; (8001230 <SystemInit+0xa0>)
 80011a0:	4001      	ands	r1, r0
 80011a2:	6059      	str	r1, [r3, #4]
 80011a4:	6818      	ldr	r0, [r3, #0]
 80011a6:	4923      	ldr	r1, [pc, #140]	; (8001234 <SystemInit+0xa4>)
 80011a8:	4001      	ands	r1, r0
 80011aa:	6019      	str	r1, [r3, #0]
 80011ac:	6818      	ldr	r0, [r3, #0]
 80011ae:	4922      	ldr	r1, [pc, #136]	; (8001238 <SystemInit+0xa8>)
 80011b0:	4001      	ands	r1, r0
 80011b2:	6019      	str	r1, [r3, #0]
 80011b4:	6858      	ldr	r0, [r3, #4]
 80011b6:	4921      	ldr	r1, [pc, #132]	; (800123c <SystemInit+0xac>)
 80011b8:	4001      	ands	r1, r0
 80011ba:	6059      	str	r1, [r3, #4]
 80011bc:	6ad9      	ldr	r1, [r3, #44]	; 0x2c
 80011be:	200f      	movs	r0, #15
 80011c0:	4381      	bics	r1, r0
 80011c2:	62d9      	str	r1, [r3, #44]	; 0x2c
 80011c4:	6b18      	ldr	r0, [r3, #48]	; 0x30
 80011c6:	491e      	ldr	r1, [pc, #120]	; (8001240 <SystemInit+0xb0>)
 80011c8:	4001      	ands	r1, r0
 80011ca:	6319      	str	r1, [r3, #48]	; 0x30
 80011cc:	6b59      	ldr	r1, [r3, #52]	; 0x34
 80011ce:	4391      	bics	r1, r2
 80011d0:	2200      	movs	r2, #0
 80011d2:	6359      	str	r1, [r3, #52]	; 0x34
 80011d4:	609a      	str	r2, [r3, #8]
 80011d6:	9200      	str	r2, [sp, #0]
 80011d8:	9201      	str	r2, [sp, #4]
 80011da:	4a1a      	ldr	r2, [pc, #104]	; (8001244 <SystemInit+0xb4>)
 80011dc:	2111      	movs	r1, #17
 80011de:	6011      	str	r1, [r2, #0]
 80011e0:	685a      	ldr	r2, [r3, #4]
 80011e2:	605a      	str	r2, [r3, #4]
 80011e4:	685a      	ldr	r2, [r3, #4]
 80011e6:	605a      	str	r2, [r3, #4]
 80011e8:	6859      	ldr	r1, [r3, #4]
 80011ea:	4a17      	ldr	r2, [pc, #92]	; (8001248 <SystemInit+0xb8>)
 80011ec:	400a      	ands	r2, r1
 80011ee:	605a      	str	r2, [r3, #4]
 80011f0:	6859      	ldr	r1, [r3, #4]
 80011f2:	22a0      	movs	r2, #160	; 0xa0
 80011f4:	0392      	lsls	r2, r2, #14
 80011f6:	430a      	orrs	r2, r1
 80011f8:	605a      	str	r2, [r3, #4]
 80011fa:	6819      	ldr	r1, [r3, #0]
 80011fc:	2280      	movs	r2, #128	; 0x80
 80011fe:	0452      	lsls	r2, r2, #17
 8001200:	430a      	orrs	r2, r1
 8001202:	601a      	str	r2, [r3, #0]
 8001204:	6819      	ldr	r1, [r3, #0]
 8001206:	4a09      	ldr	r2, [pc, #36]	; (800122c <SystemInit+0x9c>)
 8001208:	0188      	lsls	r0, r1, #6
 800120a:	d5fb      	bpl.n	8001204 <SystemInit+0x74>
 800120c:	6851      	ldr	r1, [r2, #4]
 800120e:	2003      	movs	r0, #3
 8001210:	4381      	bics	r1, r0
 8001212:	6051      	str	r1, [r2, #4]
 8001214:	6851      	ldr	r1, [r2, #4]
 8001216:	2002      	movs	r0, #2
 8001218:	4301      	orrs	r1, r0
 800121a:	6051      	str	r1, [r2, #4]
 800121c:	6859      	ldr	r1, [r3, #4]
 800121e:	220c      	movs	r2, #12
 8001220:	400a      	ands	r2, r1
 8001222:	2a08      	cmp	r2, #8
 8001224:	d1fa      	bne.n	800121c <SystemInit+0x8c>
 8001226:	b002      	add	sp, #8
 8001228:	4770      	bx	lr
 800122a:	46c0      	nop			; (mov r8, r8)
 800122c:	40021000 	.word	0x40021000
 8001230:	f8ffb80c 	.word	0xf8ffb80c
 8001234:	fef6ffff 	.word	0xfef6ffff
 8001238:	fffbffff 	.word	0xfffbffff
 800123c:	ffc0ffff 	.word	0xffc0ffff
 8001240:	fffffeac 	.word	0xfffffeac
 8001244:	40022000 	.word	0x40022000
 8001248:	ffc07fff 	.word	0xffc07fff

0800124c <lib_low_level_init>:
 800124c:	b508      	push	{r3, lr}
 800124e:	f7ff ff9f 	bl	8001190 <SystemInit>
 8001252:	f000 fcc7 	bl	8001be4 <gpio_init>
 8001256:	f7ff fe57 	bl	8000f08 <uart_init>
 800125a:	f7ff fd9d 	bl	8000d98 <timer_init>
 800125e:	f7ff fedb 	bl	8001018 <i2c_0_init>
 8001262:	bd08      	pop	{r3, pc}

08001264 <GPIO_Init>:
 8001264:	2390      	movs	r3, #144	; 0x90
 8001266:	b5f7      	push	{r0, r1, r2, r4, r5, r6, r7, lr}
 8001268:	05db      	lsls	r3, r3, #23
 800126a:	1c04      	adds	r4, r0, #0
 800126c:	1c0d      	adds	r5, r1, #0
 800126e:	4298      	cmp	r0, r3
 8001270:	d010      	beq.n	8001294 <GPIO_Init+0x30>
 8001272:	4b39      	ldr	r3, [pc, #228]	; (8001358 <GPIO_Init+0xf4>)
 8001274:	4298      	cmp	r0, r3
 8001276:	d00d      	beq.n	8001294 <GPIO_Init+0x30>
 8001278:	4b38      	ldr	r3, [pc, #224]	; (800135c <GPIO_Init+0xf8>)
 800127a:	4298      	cmp	r0, r3
 800127c:	d00a      	beq.n	8001294 <GPIO_Init+0x30>
 800127e:	4b38      	ldr	r3, [pc, #224]	; (8001360 <GPIO_Init+0xfc>)
 8001280:	4298      	cmp	r0, r3
 8001282:	d007      	beq.n	8001294 <GPIO_Init+0x30>
 8001284:	4b37      	ldr	r3, [pc, #220]	; (8001364 <GPIO_Init+0x100>)
 8001286:	4298      	cmp	r0, r3
 8001288:	d004      	beq.n	8001294 <GPIO_Init+0x30>
 800128a:	4a37      	ldr	r2, [pc, #220]	; (8001368 <GPIO_Init+0x104>)
 800128c:	1880      	adds	r0, r0, r2
 800128e:	4243      	negs	r3, r0
 8001290:	4158      	adcs	r0, r3
 8001292:	e000      	b.n	8001296 <GPIO_Init+0x32>
 8001294:	2001      	movs	r0, #1
 8001296:	f7ff ff6c 	bl	8001172 <assert_param>
 800129a:	6828      	ldr	r0, [r5, #0]
 800129c:	2600      	movs	r6, #0
 800129e:	1e43      	subs	r3, r0, #1
 80012a0:	4198      	sbcs	r0, r3
 80012a2:	f7ff ff66 	bl	8001172 <assert_param>
 80012a6:	792b      	ldrb	r3, [r5, #4]
 80012a8:	2203      	movs	r2, #3
 80012aa:	1c30      	adds	r0, r6, #0
 80012ac:	429a      	cmp	r2, r3
 80012ae:	4170      	adcs	r0, r6
 80012b0:	f7ff ff5f 	bl	8001172 <assert_param>
 80012b4:	79eb      	ldrb	r3, [r5, #7]
 80012b6:	2202      	movs	r2, #2
 80012b8:	1c30      	adds	r0, r6, #0
 80012ba:	429a      	cmp	r2, r3
 80012bc:	4170      	adcs	r0, r6
 80012be:	f7ff ff58 	bl	8001172 <assert_param>
 80012c2:	2001      	movs	r0, #1
 80012c4:	1c03      	adds	r3, r0, #0
 80012c6:	682a      	ldr	r2, [r5, #0]
 80012c8:	40b3      	lsls	r3, r6
 80012ca:	401a      	ands	r2, r3
 80012cc:	9201      	str	r2, [sp, #4]
 80012ce:	429a      	cmp	r2, r3
 80012d0:	d13d      	bne.n	800134e <GPIO_Init+0xea>
 80012d2:	792b      	ldrb	r3, [r5, #4]
 80012d4:	0077      	lsls	r7, r6, #1
 80012d6:	3b01      	subs	r3, #1
 80012d8:	b2db      	uxtb	r3, r3
 80012da:	4283      	cmp	r3, r0
 80012dc:	d823      	bhi.n	8001326 <GPIO_Init+0xc2>
 80012de:	796b      	ldrb	r3, [r5, #5]
 80012e0:	4283      	cmp	r3, r0
 80012e2:	d902      	bls.n	80012ea <GPIO_Init+0x86>
 80012e4:	1ed8      	subs	r0, r3, #3
 80012e6:	4243      	negs	r3, r0
 80012e8:	4158      	adcs	r0, r3
 80012ea:	f7ff ff42 	bl	8001172 <assert_param>
 80012ee:	68a3      	ldr	r3, [r4, #8]
 80012f0:	2203      	movs	r2, #3
 80012f2:	40ba      	lsls	r2, r7
 80012f4:	4393      	bics	r3, r2
 80012f6:	60a3      	str	r3, [r4, #8]
 80012f8:	796b      	ldrb	r3, [r5, #5]
 80012fa:	68a2      	ldr	r2, [r4, #8]
 80012fc:	40bb      	lsls	r3, r7
 80012fe:	4313      	orrs	r3, r2
 8001300:	60a3      	str	r3, [r4, #8]
 8001302:	79ab      	ldrb	r3, [r5, #6]
 8001304:	2201      	movs	r2, #1
 8001306:	2000      	movs	r0, #0
 8001308:	429a      	cmp	r2, r3
 800130a:	4140      	adcs	r0, r0
 800130c:	f7ff ff31 	bl	8001172 <assert_param>
 8001310:	6863      	ldr	r3, [r4, #4]
 8001312:	9a01      	ldr	r2, [sp, #4]
 8001314:	b29b      	uxth	r3, r3
 8001316:	4393      	bics	r3, r2
 8001318:	80a3      	strh	r3, [r4, #4]
 800131a:	79ab      	ldrb	r3, [r5, #6]
 800131c:	6862      	ldr	r2, [r4, #4]
 800131e:	40b3      	lsls	r3, r6
 8001320:	4313      	orrs	r3, r2
 8001322:	b29b      	uxth	r3, r3
 8001324:	80a3      	strh	r3, [r4, #4]
 8001326:	2303      	movs	r3, #3
 8001328:	6822      	ldr	r2, [r4, #0]
 800132a:	40bb      	lsls	r3, r7
 800132c:	43db      	mvns	r3, r3
 800132e:	401a      	ands	r2, r3
 8001330:	6022      	str	r2, [r4, #0]
 8001332:	792a      	ldrb	r2, [r5, #4]
 8001334:	6821      	ldr	r1, [r4, #0]
 8001336:	40ba      	lsls	r2, r7
 8001338:	430a      	orrs	r2, r1
 800133a:	6022      	str	r2, [r4, #0]
 800133c:	68e2      	ldr	r2, [r4, #12]
 800133e:	4013      	ands	r3, r2
 8001340:	79ea      	ldrb	r2, [r5, #7]
 8001342:	60e3      	str	r3, [r4, #12]
 8001344:	68e3      	ldr	r3, [r4, #12]
 8001346:	40ba      	lsls	r2, r7
 8001348:	1c17      	adds	r7, r2, #0
 800134a:	431f      	orrs	r7, r3
 800134c:	60e7      	str	r7, [r4, #12]
 800134e:	3601      	adds	r6, #1
 8001350:	2e10      	cmp	r6, #16
 8001352:	d1b6      	bne.n	80012c2 <GPIO_Init+0x5e>
 8001354:	bdf7      	pop	{r0, r1, r2, r4, r5, r6, r7, pc}
 8001356:	46c0      	nop			; (mov r8, r8)
 8001358:	48000400 	.word	0x48000400
 800135c:	48000800 	.word	0x48000800
 8001360:	48000c00 	.word	0x48000c00
 8001364:	48001000 	.word	0x48001000
 8001368:	b7ffec00 	.word	0xb7ffec00

0800136c <GPIO_PinAFConfig>:
 800136c:	b5f7      	push	{r0, r1, r2, r4, r5, r6, r7, lr}
 800136e:	2390      	movs	r3, #144	; 0x90
 8001370:	1c04      	adds	r4, r0, #0
 8001372:	1c0e      	adds	r6, r1, #0
 8001374:	9201      	str	r2, [sp, #4]
 8001376:	05db      	lsls	r3, r3, #23
 8001378:	4298      	cmp	r0, r3
 800137a:	d010      	beq.n	800139e <GPIO_PinAFConfig+0x32>
 800137c:	4b19      	ldr	r3, [pc, #100]	; (80013e4 <GPIO_PinAFConfig+0x78>)
 800137e:	4298      	cmp	r0, r3
 8001380:	d00d      	beq.n	800139e <GPIO_PinAFConfig+0x32>
 8001382:	4b19      	ldr	r3, [pc, #100]	; (80013e8 <GPIO_PinAFConfig+0x7c>)
 8001384:	4298      	cmp	r0, r3
 8001386:	d00a      	beq.n	800139e <GPIO_PinAFConfig+0x32>
 8001388:	4b18      	ldr	r3, [pc, #96]	; (80013ec <GPIO_PinAFConfig+0x80>)
 800138a:	4298      	cmp	r0, r3
 800138c:	d007      	beq.n	800139e <GPIO_PinAFConfig+0x32>
 800138e:	4b18      	ldr	r3, [pc, #96]	; (80013f0 <GPIO_PinAFConfig+0x84>)
 8001390:	4298      	cmp	r0, r3
 8001392:	d004      	beq.n	800139e <GPIO_PinAFConfig+0x32>
 8001394:	4a17      	ldr	r2, [pc, #92]	; (80013f4 <GPIO_PinAFConfig+0x88>)
 8001396:	1880      	adds	r0, r0, r2
 8001398:	4243      	negs	r3, r0
 800139a:	4158      	adcs	r0, r3
 800139c:	e000      	b.n	80013a0 <GPIO_PinAFConfig+0x34>
 800139e:	2001      	movs	r0, #1
 80013a0:	2500      	movs	r5, #0
 80013a2:	f7ff fee6 	bl	8001172 <assert_param>
 80013a6:	230f      	movs	r3, #15
 80013a8:	1c28      	adds	r0, r5, #0
 80013aa:	42b3      	cmp	r3, r6
 80013ac:	4168      	adcs	r0, r5
 80013ae:	f7ff fee0 	bl	8001172 <assert_param>
 80013b2:	9a01      	ldr	r2, [sp, #4]
 80013b4:	1c28      	adds	r0, r5, #0
 80013b6:	2707      	movs	r7, #7
 80013b8:	4297      	cmp	r7, r2
 80013ba:	4168      	adcs	r0, r5
 80013bc:	4037      	ands	r7, r6
 80013be:	08f6      	lsrs	r6, r6, #3
 80013c0:	00b6      	lsls	r6, r6, #2
 80013c2:	19a4      	adds	r4, r4, r6
 80013c4:	f7ff fed5 	bl	8001172 <assert_param>
 80013c8:	00bf      	lsls	r7, r7, #2
 80013ca:	6a23      	ldr	r3, [r4, #32]
 80013cc:	220f      	movs	r2, #15
 80013ce:	40ba      	lsls	r2, r7
 80013d0:	4393      	bics	r3, r2
 80013d2:	9a01      	ldr	r2, [sp, #4]
 80013d4:	6223      	str	r3, [r4, #32]
 80013d6:	6a23      	ldr	r3, [r4, #32]
 80013d8:	40ba      	lsls	r2, r7
 80013da:	1c17      	adds	r7, r2, #0
 80013dc:	431f      	orrs	r7, r3
 80013de:	6227      	str	r7, [r4, #32]
 80013e0:	bdf7      	pop	{r0, r1, r2, r4, r5, r6, r7, pc}
 80013e2:	46c0      	nop			; (mov r8, r8)
 80013e4:	48000400 	.word	0x48000400
 80013e8:	48000800 	.word	0x48000800
 80013ec:	48000c00 	.word	0x48000c00
 80013f0:	48001000 	.word	0x48001000
 80013f4:	b7ffec00 	.word	0xb7ffec00

080013f8 <TIM_TimeBaseInit>:
 80013f8:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
 80013fa:	4e34      	ldr	r6, [pc, #208]	; (80014cc <TIM_TimeBaseInit+0xd4>)
 80013fc:	1c04      	adds	r4, r0, #0
 80013fe:	1c0d      	adds	r5, r1, #0
 8001400:	4f33      	ldr	r7, [pc, #204]	; (80014d0 <TIM_TimeBaseInit+0xd8>)
 8001402:	42b0      	cmp	r0, r6
 8001404:	d019      	beq.n	800143a <TIM_TimeBaseInit+0x42>
 8001406:	2380      	movs	r3, #128	; 0x80
 8001408:	05db      	lsls	r3, r3, #23
 800140a:	4298      	cmp	r0, r3
 800140c:	d015      	beq.n	800143a <TIM_TimeBaseInit+0x42>
 800140e:	4b31      	ldr	r3, [pc, #196]	; (80014d4 <TIM_TimeBaseInit+0xdc>)
 8001410:	4298      	cmp	r0, r3
 8001412:	d012      	beq.n	800143a <TIM_TimeBaseInit+0x42>
 8001414:	42b8      	cmp	r0, r7
 8001416:	d010      	beq.n	800143a <TIM_TimeBaseInit+0x42>
 8001418:	4b2f      	ldr	r3, [pc, #188]	; (80014d8 <TIM_TimeBaseInit+0xe0>)
 800141a:	4298      	cmp	r0, r3
 800141c:	d00d      	beq.n	800143a <TIM_TimeBaseInit+0x42>
 800141e:	4b2f      	ldr	r3, [pc, #188]	; (80014dc <TIM_TimeBaseInit+0xe4>)
 8001420:	4298      	cmp	r0, r3
 8001422:	d00a      	beq.n	800143a <TIM_TimeBaseInit+0x42>
 8001424:	4b2e      	ldr	r3, [pc, #184]	; (80014e0 <TIM_TimeBaseInit+0xe8>)
 8001426:	4298      	cmp	r0, r3
 8001428:	d007      	beq.n	800143a <TIM_TimeBaseInit+0x42>
 800142a:	4b2e      	ldr	r3, [pc, #184]	; (80014e4 <TIM_TimeBaseInit+0xec>)
 800142c:	4298      	cmp	r0, r3
 800142e:	d004      	beq.n	800143a <TIM_TimeBaseInit+0x42>
 8001430:	492d      	ldr	r1, [pc, #180]	; (80014e8 <TIM_TimeBaseInit+0xf0>)
 8001432:	1840      	adds	r0, r0, r1
 8001434:	4243      	negs	r3, r0
 8001436:	4158      	adcs	r0, r3
 8001438:	e000      	b.n	800143c <TIM_TimeBaseInit+0x44>
 800143a:	2001      	movs	r0, #1
 800143c:	f7ff fe99 	bl	8001172 <assert_param>
 8001440:	886b      	ldrh	r3, [r5, #2]
 8001442:	2210      	movs	r2, #16
 8001444:	1c19      	adds	r1, r3, #0
 8001446:	4391      	bics	r1, r2
 8001448:	d101      	bne.n	800144e <TIM_TimeBaseInit+0x56>
 800144a:	2001      	movs	r0, #1
 800144c:	e007      	b.n	800145e <TIM_TimeBaseInit+0x66>
 800144e:	2240      	movs	r2, #64	; 0x40
 8001450:	1c19      	adds	r1, r3, #0
 8001452:	4391      	bics	r1, r2
 8001454:	2920      	cmp	r1, #32
 8001456:	d0f8      	beq.n	800144a <TIM_TimeBaseInit+0x52>
 8001458:	2b40      	cmp	r3, #64	; 0x40
 800145a:	d0f6      	beq.n	800144a <TIM_TimeBaseInit+0x52>
 800145c:	2000      	movs	r0, #0
 800145e:	f7ff fe88 	bl	8001172 <assert_param>
 8001462:	892b      	ldrh	r3, [r5, #8]
 8001464:	4a21      	ldr	r2, [pc, #132]	; (80014ec <TIM_TimeBaseInit+0xf4>)
 8001466:	2001      	movs	r0, #1
 8001468:	4213      	tst	r3, r2
 800146a:	d003      	beq.n	8001474 <TIM_TimeBaseInit+0x7c>
 800146c:	4a20      	ldr	r2, [pc, #128]	; (80014f0 <TIM_TimeBaseInit+0xf8>)
 800146e:	1898      	adds	r0, r3, r2
 8001470:	4243      	negs	r3, r0
 8001472:	4158      	adcs	r0, r3
 8001474:	f7ff fe7d 	bl	8001172 <assert_param>
 8001478:	6823      	ldr	r3, [r4, #0]
 800147a:	b29b      	uxth	r3, r3
 800147c:	42b4      	cmp	r4, r6
 800147e:	d006      	beq.n	800148e <TIM_TimeBaseInit+0x96>
 8001480:	2280      	movs	r2, #128	; 0x80
 8001482:	05d2      	lsls	r2, r2, #23
 8001484:	4294      	cmp	r4, r2
 8001486:	d002      	beq.n	800148e <TIM_TimeBaseInit+0x96>
 8001488:	4a12      	ldr	r2, [pc, #72]	; (80014d4 <TIM_TimeBaseInit+0xdc>)
 800148a:	4294      	cmp	r4, r2
 800148c:	d103      	bne.n	8001496 <TIM_TimeBaseInit+0x9e>
 800148e:	2270      	movs	r2, #112	; 0x70
 8001490:	4393      	bics	r3, r2
 8001492:	886a      	ldrh	r2, [r5, #2]
 8001494:	4313      	orrs	r3, r2
 8001496:	42bc      	cmp	r4, r7
 8001498:	d003      	beq.n	80014a2 <TIM_TimeBaseInit+0xaa>
 800149a:	4916      	ldr	r1, [pc, #88]	; (80014f4 <TIM_TimeBaseInit+0xfc>)
 800149c:	892a      	ldrh	r2, [r5, #8]
 800149e:	400b      	ands	r3, r1
 80014a0:	4313      	orrs	r3, r2
 80014a2:	8023      	strh	r3, [r4, #0]
 80014a4:	686b      	ldr	r3, [r5, #4]
 80014a6:	62e3      	str	r3, [r4, #44]	; 0x2c
 80014a8:	882b      	ldrh	r3, [r5, #0]
 80014aa:	8523      	strh	r3, [r4, #40]	; 0x28
 80014ac:	42b4      	cmp	r4, r6
 80014ae:	d008      	beq.n	80014c2 <TIM_TimeBaseInit+0xca>
 80014b0:	4b0b      	ldr	r3, [pc, #44]	; (80014e0 <TIM_TimeBaseInit+0xe8>)
 80014b2:	429c      	cmp	r4, r3
 80014b4:	d005      	beq.n	80014c2 <TIM_TimeBaseInit+0xca>
 80014b6:	4b0b      	ldr	r3, [pc, #44]	; (80014e4 <TIM_TimeBaseInit+0xec>)
 80014b8:	429c      	cmp	r4, r3
 80014ba:	d002      	beq.n	80014c2 <TIM_TimeBaseInit+0xca>
 80014bc:	4b0e      	ldr	r3, [pc, #56]	; (80014f8 <TIM_TimeBaseInit+0x100>)
 80014be:	429c      	cmp	r4, r3
 80014c0:	d101      	bne.n	80014c6 <TIM_TimeBaseInit+0xce>
 80014c2:	7aab      	ldrb	r3, [r5, #10]
 80014c4:	8623      	strh	r3, [r4, #48]	; 0x30
 80014c6:	2301      	movs	r3, #1
 80014c8:	82a3      	strh	r3, [r4, #20]
 80014ca:	bdf8      	pop	{r3, r4, r5, r6, r7, pc}
 80014cc:	40012c00 	.word	0x40012c00
 80014d0:	40001000 	.word	0x40001000
 80014d4:	40000400 	.word	0x40000400
 80014d8:	40001400 	.word	0x40001400
 80014dc:	40002000 	.word	0x40002000
 80014e0:	40014000 	.word	0x40014000
 80014e4:	40014400 	.word	0x40014400
 80014e8:	bffeb800 	.word	0xbffeb800
 80014ec:	fffffeff 	.word	0xfffffeff
 80014f0:	fffffe00 	.word	0xfffffe00
 80014f4:	fffffcff 	.word	0xfffffcff
 80014f8:	40014800 	.word	0x40014800

080014fc <TIM_Cmd>:
 80014fc:	4b19      	ldr	r3, [pc, #100]	; (8001564 <TIM_Cmd+0x68>)
 80014fe:	b570      	push	{r4, r5, r6, lr}
 8001500:	1c04      	adds	r4, r0, #0
 8001502:	1c0e      	adds	r6, r1, #0
 8001504:	4298      	cmp	r0, r3
 8001506:	d01a      	beq.n	800153e <TIM_Cmd+0x42>
 8001508:	2380      	movs	r3, #128	; 0x80
 800150a:	05db      	lsls	r3, r3, #23
 800150c:	4298      	cmp	r0, r3
 800150e:	d016      	beq.n	800153e <TIM_Cmd+0x42>
 8001510:	4b15      	ldr	r3, [pc, #84]	; (8001568 <TIM_Cmd+0x6c>)
 8001512:	4298      	cmp	r0, r3
 8001514:	d013      	beq.n	800153e <TIM_Cmd+0x42>
 8001516:	4b15      	ldr	r3, [pc, #84]	; (800156c <TIM_Cmd+0x70>)
 8001518:	4298      	cmp	r0, r3
 800151a:	d010      	beq.n	800153e <TIM_Cmd+0x42>
 800151c:	4b14      	ldr	r3, [pc, #80]	; (8001570 <TIM_Cmd+0x74>)
 800151e:	4298      	cmp	r0, r3
 8001520:	d00d      	beq.n	800153e <TIM_Cmd+0x42>
 8001522:	4b14      	ldr	r3, [pc, #80]	; (8001574 <TIM_Cmd+0x78>)
 8001524:	4298      	cmp	r0, r3
 8001526:	d00a      	beq.n	800153e <TIM_Cmd+0x42>
 8001528:	4b13      	ldr	r3, [pc, #76]	; (8001578 <TIM_Cmd+0x7c>)
 800152a:	4298      	cmp	r0, r3
 800152c:	d007      	beq.n	800153e <TIM_Cmd+0x42>
 800152e:	4b13      	ldr	r3, [pc, #76]	; (800157c <TIM_Cmd+0x80>)
 8001530:	4298      	cmp	r0, r3
 8001532:	d004      	beq.n	800153e <TIM_Cmd+0x42>
 8001534:	4b12      	ldr	r3, [pc, #72]	; (8001580 <TIM_Cmd+0x84>)
 8001536:	18c0      	adds	r0, r0, r3
 8001538:	4243      	negs	r3, r0
 800153a:	4158      	adcs	r0, r3
 800153c:	e000      	b.n	8001540 <TIM_Cmd+0x44>
 800153e:	2001      	movs	r0, #1
 8001540:	f7ff fe17 	bl	8001172 <assert_param>
 8001544:	2501      	movs	r5, #1
 8001546:	2000      	movs	r0, #0
 8001548:	42b5      	cmp	r5, r6
 800154a:	4140      	adcs	r0, r0
 800154c:	f7ff fe11 	bl	8001172 <assert_param>
 8001550:	6823      	ldr	r3, [r4, #0]
 8001552:	b29b      	uxth	r3, r3
 8001554:	2e00      	cmp	r6, #0
 8001556:	d002      	beq.n	800155e <TIM_Cmd+0x62>
 8001558:	431d      	orrs	r5, r3
 800155a:	8025      	strh	r5, [r4, #0]
 800155c:	e001      	b.n	8001562 <TIM_Cmd+0x66>
 800155e:	43ab      	bics	r3, r5
 8001560:	8023      	strh	r3, [r4, #0]
 8001562:	bd70      	pop	{r4, r5, r6, pc}
 8001564:	40012c00 	.word	0x40012c00
 8001568:	40000400 	.word	0x40000400
 800156c:	40001000 	.word	0x40001000
 8001570:	40001400 	.word	0x40001400
 8001574:	40002000 	.word	0x40002000
 8001578:	40014000 	.word	0x40014000
 800157c:	40014400 	.word	0x40014400
 8001580:	bffeb800 	.word	0xbffeb800

08001584 <TIM_ITConfig>:
 8001584:	4b1f      	ldr	r3, [pc, #124]	; (8001604 <TIM_ITConfig+0x80>)
 8001586:	b570      	push	{r4, r5, r6, lr}
 8001588:	1c04      	adds	r4, r0, #0
 800158a:	1c0d      	adds	r5, r1, #0
 800158c:	1c16      	adds	r6, r2, #0
 800158e:	4298      	cmp	r0, r3
 8001590:	d01a      	beq.n	80015c8 <TIM_ITConfig+0x44>
 8001592:	2380      	movs	r3, #128	; 0x80
 8001594:	05db      	lsls	r3, r3, #23
 8001596:	4298      	cmp	r0, r3
 8001598:	d016      	beq.n	80015c8 <TIM_ITConfig+0x44>
 800159a:	4b1b      	ldr	r3, [pc, #108]	; (8001608 <TIM_ITConfig+0x84>)
 800159c:	4298      	cmp	r0, r3
 800159e:	d013      	beq.n	80015c8 <TIM_ITConfig+0x44>
 80015a0:	4b1a      	ldr	r3, [pc, #104]	; (800160c <TIM_ITConfig+0x88>)
 80015a2:	4298      	cmp	r0, r3
 80015a4:	d010      	beq.n	80015c8 <TIM_ITConfig+0x44>
 80015a6:	4b1a      	ldr	r3, [pc, #104]	; (8001610 <TIM_ITConfig+0x8c>)
 80015a8:	4298      	cmp	r0, r3
 80015aa:	d00d      	beq.n	80015c8 <TIM_ITConfig+0x44>
 80015ac:	4b19      	ldr	r3, [pc, #100]	; (8001614 <TIM_ITConfig+0x90>)
 80015ae:	4298      	cmp	r0, r3
 80015b0:	d00a      	beq.n	80015c8 <TIM_ITConfig+0x44>
 80015b2:	4b19      	ldr	r3, [pc, #100]	; (8001618 <TIM_ITConfig+0x94>)
 80015b4:	4298      	cmp	r0, r3
 80015b6:	d007      	beq.n	80015c8 <TIM_ITConfig+0x44>
 80015b8:	4b18      	ldr	r3, [pc, #96]	; (800161c <TIM_ITConfig+0x98>)
 80015ba:	4298      	cmp	r0, r3
 80015bc:	d004      	beq.n	80015c8 <TIM_ITConfig+0x44>
 80015be:	4a18      	ldr	r2, [pc, #96]	; (8001620 <TIM_ITConfig+0x9c>)
 80015c0:	1880      	adds	r0, r0, r2
 80015c2:	4243      	negs	r3, r0
 80015c4:	4158      	adcs	r0, r3
 80015c6:	e000      	b.n	80015ca <TIM_ITConfig+0x46>
 80015c8:	2001      	movs	r0, #1
 80015ca:	f7ff fdd2 	bl	8001172 <assert_param>
 80015ce:	23ff      	movs	r3, #255	; 0xff
 80015d0:	1c2a      	adds	r2, r5, #0
 80015d2:	2000      	movs	r0, #0
 80015d4:	439a      	bics	r2, r3
 80015d6:	4282      	cmp	r2, r0
 80015d8:	d102      	bne.n	80015e0 <TIM_ITConfig+0x5c>
 80015da:	1c28      	adds	r0, r5, #0
 80015dc:	1e43      	subs	r3, r0, #1
 80015de:	4198      	sbcs	r0, r3
 80015e0:	f7ff fdc7 	bl	8001172 <assert_param>
 80015e4:	2301      	movs	r3, #1
 80015e6:	2000      	movs	r0, #0
 80015e8:	42b3      	cmp	r3, r6
 80015ea:	4140      	adcs	r0, r0
 80015ec:	f7ff fdc1 	bl	8001172 <assert_param>
 80015f0:	68e3      	ldr	r3, [r4, #12]
 80015f2:	b29b      	uxth	r3, r3
 80015f4:	2e00      	cmp	r6, #0
 80015f6:	d002      	beq.n	80015fe <TIM_ITConfig+0x7a>
 80015f8:	431d      	orrs	r5, r3
 80015fa:	81a5      	strh	r5, [r4, #12]
 80015fc:	e001      	b.n	8001602 <TIM_ITConfig+0x7e>
 80015fe:	43ab      	bics	r3, r5
 8001600:	81a3      	strh	r3, [r4, #12]
 8001602:	bd70      	pop	{r4, r5, r6, pc}
 8001604:	40012c00 	.word	0x40012c00
 8001608:	40000400 	.word	0x40000400
 800160c:	40001000 	.word	0x40001000
 8001610:	40001400 	.word	0x40001400
 8001614:	40002000 	.word	0x40002000
 8001618:	40014000 	.word	0x40014000
 800161c:	40014400 	.word	0x40014400
 8001620:	bffeb800 	.word	0xbffeb800

08001624 <USART_Init>:
 8001624:	b5f0      	push	{r4, r5, r6, r7, lr}
 8001626:	4e53      	ldr	r6, [pc, #332]	; (8001774 <USART_Init+0x150>)
 8001628:	b08b      	sub	sp, #44	; 0x2c
 800162a:	1c04      	adds	r4, r0, #0
 800162c:	1c0d      	adds	r5, r1, #0
 800162e:	42b0      	cmp	r0, r6
 8001630:	d016      	beq.n	8001660 <USART_Init+0x3c>
 8001632:	4b51      	ldr	r3, [pc, #324]	; (8001778 <USART_Init+0x154>)
 8001634:	4298      	cmp	r0, r3
 8001636:	d013      	beq.n	8001660 <USART_Init+0x3c>
 8001638:	4b50      	ldr	r3, [pc, #320]	; (800177c <USART_Init+0x158>)
 800163a:	4298      	cmp	r0, r3
 800163c:	d010      	beq.n	8001660 <USART_Init+0x3c>
 800163e:	4b50      	ldr	r3, [pc, #320]	; (8001780 <USART_Init+0x15c>)
 8001640:	4298      	cmp	r0, r3
 8001642:	d00d      	beq.n	8001660 <USART_Init+0x3c>
 8001644:	4b4f      	ldr	r3, [pc, #316]	; (8001784 <USART_Init+0x160>)
 8001646:	4298      	cmp	r0, r3
 8001648:	d00a      	beq.n	8001660 <USART_Init+0x3c>
 800164a:	4b4f      	ldr	r3, [pc, #316]	; (8001788 <USART_Init+0x164>)
 800164c:	4298      	cmp	r0, r3
 800164e:	d007      	beq.n	8001660 <USART_Init+0x3c>
 8001650:	4b4e      	ldr	r3, [pc, #312]	; (800178c <USART_Init+0x168>)
 8001652:	4298      	cmp	r0, r3
 8001654:	d004      	beq.n	8001660 <USART_Init+0x3c>
 8001656:	494e      	ldr	r1, [pc, #312]	; (8001790 <USART_Init+0x16c>)
 8001658:	1840      	adds	r0, r0, r1
 800165a:	4243      	negs	r3, r0
 800165c:	4158      	adcs	r0, r3
 800165e:	e000      	b.n	8001662 <USART_Init+0x3e>
 8001660:	2001      	movs	r0, #1
 8001662:	f7ff fd86 	bl	8001172 <assert_param>
 8001666:	682b      	ldr	r3, [r5, #0]
 8001668:	4a4a      	ldr	r2, [pc, #296]	; (8001794 <USART_Init+0x170>)
 800166a:	3b01      	subs	r3, #1
 800166c:	2000      	movs	r0, #0
 800166e:	429a      	cmp	r2, r3
 8001670:	4140      	adcs	r0, r0
 8001672:	f7ff fd7e 	bl	8001172 <assert_param>
 8001676:	686b      	ldr	r3, [r5, #4]
 8001678:	4a47      	ldr	r2, [pc, #284]	; (8001798 <USART_Init+0x174>)
 800167a:	2001      	movs	r0, #1
 800167c:	4213      	tst	r3, r2
 800167e:	d003      	beq.n	8001688 <USART_Init+0x64>
 8001680:	4a46      	ldr	r2, [pc, #280]	; (800179c <USART_Init+0x178>)
 8001682:	1898      	adds	r0, r3, r2
 8001684:	4243      	negs	r3, r0
 8001686:	4158      	adcs	r0, r3
 8001688:	f7ff fd73 	bl	8001172 <assert_param>
 800168c:	68ab      	ldr	r3, [r5, #8]
 800168e:	4a44      	ldr	r2, [pc, #272]	; (80017a0 <USART_Init+0x17c>)
 8001690:	2001      	movs	r0, #1
 8001692:	4213      	tst	r3, r2
 8001694:	d003      	beq.n	800169e <USART_Init+0x7a>
 8001696:	4943      	ldr	r1, [pc, #268]	; (80017a4 <USART_Init+0x180>)
 8001698:	1858      	adds	r0, r3, r1
 800169a:	4243      	negs	r3, r0
 800169c:	4158      	adcs	r0, r3
 800169e:	f7ff fd68 	bl	8001172 <assert_param>
 80016a2:	68eb      	ldr	r3, [r5, #12]
 80016a4:	4a40      	ldr	r2, [pc, #256]	; (80017a8 <USART_Init+0x184>)
 80016a6:	2001      	movs	r0, #1
 80016a8:	4213      	tst	r3, r2
 80016aa:	d003      	beq.n	80016b4 <USART_Init+0x90>
 80016ac:	4a3f      	ldr	r2, [pc, #252]	; (80017ac <USART_Init+0x188>)
 80016ae:	1898      	adds	r0, r3, r2
 80016b0:	4243      	negs	r3, r0
 80016b2:	4158      	adcs	r0, r3
 80016b4:	f7ff fd5d 	bl	8001172 <assert_param>
 80016b8:	692b      	ldr	r3, [r5, #16]
 80016ba:	220c      	movs	r2, #12
 80016bc:	1c19      	adds	r1, r3, #0
 80016be:	2000      	movs	r0, #0
 80016c0:	4391      	bics	r1, r2
 80016c2:	4281      	cmp	r1, r0
 80016c4:	d102      	bne.n	80016cc <USART_Init+0xa8>
 80016c6:	1c18      	adds	r0, r3, #0
 80016c8:	1e43      	subs	r3, r0, #1
 80016ca:	4198      	sbcs	r0, r3
 80016cc:	f7ff fd51 	bl	8001172 <assert_param>
 80016d0:	4f37      	ldr	r7, [pc, #220]	; (80017b0 <USART_Init+0x18c>)
 80016d2:	6968      	ldr	r0, [r5, #20]
 80016d4:	4038      	ands	r0, r7
 80016d6:	4243      	negs	r3, r0
 80016d8:	4158      	adcs	r0, r3
 80016da:	f7ff fd4a 	bl	8001172 <assert_param>
 80016de:	6823      	ldr	r3, [r4, #0]
 80016e0:	2201      	movs	r2, #1
 80016e2:	4393      	bics	r3, r2
 80016e4:	6023      	str	r3, [r4, #0]
 80016e6:	6862      	ldr	r2, [r4, #4]
 80016e8:	4b32      	ldr	r3, [pc, #200]	; (80017b4 <USART_Init+0x190>)
 80016ea:	6869      	ldr	r1, [r5, #4]
 80016ec:	4013      	ands	r3, r2
 80016ee:	68aa      	ldr	r2, [r5, #8]
 80016f0:	4668      	mov	r0, sp
 80016f2:	4313      	orrs	r3, r2
 80016f4:	6063      	str	r3, [r4, #4]
 80016f6:	6822      	ldr	r2, [r4, #0]
 80016f8:	4b2f      	ldr	r3, [pc, #188]	; (80017b8 <USART_Init+0x194>)
 80016fa:	401a      	ands	r2, r3
 80016fc:	68eb      	ldr	r3, [r5, #12]
 80016fe:	430b      	orrs	r3, r1
 8001700:	6929      	ldr	r1, [r5, #16]
 8001702:	430b      	orrs	r3, r1
 8001704:	4313      	orrs	r3, r2
 8001706:	6023      	str	r3, [r4, #0]
 8001708:	68a3      	ldr	r3, [r4, #8]
 800170a:	696a      	ldr	r2, [r5, #20]
 800170c:	401f      	ands	r7, r3
 800170e:	4317      	orrs	r7, r2
 8001710:	60a7      	str	r7, [r4, #8]
 8001712:	f000 f943 	bl	800199c <RCC_GetClocksFreq>
 8001716:	42b4      	cmp	r4, r6
 8001718:	d101      	bne.n	800171e <USART_Init+0xfa>
 800171a:	9e06      	ldr	r6, [sp, #24]
 800171c:	e00a      	b.n	8001734 <USART_Init+0x110>
 800171e:	4b16      	ldr	r3, [pc, #88]	; (8001778 <USART_Init+0x154>)
 8001720:	429c      	cmp	r4, r3
 8001722:	d101      	bne.n	8001728 <USART_Init+0x104>
 8001724:	9e07      	ldr	r6, [sp, #28]
 8001726:	e005      	b.n	8001734 <USART_Init+0x110>
 8001728:	4b14      	ldr	r3, [pc, #80]	; (800177c <USART_Init+0x158>)
 800172a:	429c      	cmp	r4, r3
 800172c:	d101      	bne.n	8001732 <USART_Init+0x10e>
 800172e:	9e08      	ldr	r6, [sp, #32]
 8001730:	e000      	b.n	8001734 <USART_Init+0x110>
 8001732:	9e02      	ldr	r6, [sp, #8]
 8001734:	6823      	ldr	r3, [r4, #0]
 8001736:	682f      	ldr	r7, [r5, #0]
 8001738:	0419      	lsls	r1, r3, #16
 800173a:	d500      	bpl.n	800173e <USART_Init+0x11a>
 800173c:	0076      	lsls	r6, r6, #1
 800173e:	1c39      	adds	r1, r7, #0
 8001740:	1c30      	adds	r0, r6, #0
 8001742:	f000 fafb 	bl	8001d3c <__aeabi_uidiv>
 8001746:	1c39      	adds	r1, r7, #0
 8001748:	1c05      	adds	r5, r0, #0
 800174a:	1c30      	adds	r0, r6, #0
 800174c:	f000 fb3a 	bl	8001dc4 <__aeabi_uidivmod>
 8001750:	087f      	lsrs	r7, r7, #1
 8001752:	2300      	movs	r3, #0
 8001754:	42b9      	cmp	r1, r7
 8001756:	415b      	adcs	r3, r3
 8001758:	18ed      	adds	r5, r5, r3
 800175a:	6823      	ldr	r3, [r4, #0]
 800175c:	041a      	lsls	r2, r3, #16
 800175e:	d504      	bpl.n	800176a <USART_Init+0x146>
 8001760:	4a16      	ldr	r2, [pc, #88]	; (80017bc <USART_Init+0x198>)
 8001762:	072b      	lsls	r3, r5, #28
 8001764:	0f5b      	lsrs	r3, r3, #29
 8001766:	4015      	ands	r5, r2
 8001768:	431d      	orrs	r5, r3
 800176a:	b2ad      	uxth	r5, r5
 800176c:	81a5      	strh	r5, [r4, #12]
 800176e:	b00b      	add	sp, #44	; 0x2c
 8001770:	bdf0      	pop	{r4, r5, r6, r7, pc}
 8001772:	46c0      	nop			; (mov r8, r8)
 8001774:	40013800 	.word	0x40013800
 8001778:	40004400 	.word	0x40004400
 800177c:	40004800 	.word	0x40004800
 8001780:	40004c00 	.word	0x40004c00
 8001784:	40005000 	.word	0x40005000
 8001788:	40011400 	.word	0x40011400
 800178c:	40011800 	.word	0x40011800
 8001790:	bffee400 	.word	0xbffee400
 8001794:	005b8d7f 	.word	0x005b8d7f
 8001798:	ffffefff 	.word	0xffffefff
 800179c:	effff000 	.word	0xeffff000
 80017a0:	ffffdfff 	.word	0xffffdfff
 80017a4:	ffffd000 	.word	0xffffd000
 80017a8:	fffffbff 	.word	0xfffffbff
 80017ac:	fffffa00 	.word	0xfffffa00
 80017b0:	fffffcff 	.word	0xfffffcff
 80017b4:	ffffcfff 	.word	0xffffcfff
 80017b8:	ffffe9f3 	.word	0xffffe9f3
 80017bc:	0000fff0 	.word	0x0000fff0

080017c0 <USART_Cmd>:
 80017c0:	4b17      	ldr	r3, [pc, #92]	; (8001820 <USART_Cmd+0x60>)
 80017c2:	b570      	push	{r4, r5, r6, lr}
 80017c4:	1c04      	adds	r4, r0, #0
 80017c6:	1c0e      	adds	r6, r1, #0
 80017c8:	4298      	cmp	r0, r3
 80017ca:	d016      	beq.n	80017fa <USART_Cmd+0x3a>
 80017cc:	4b15      	ldr	r3, [pc, #84]	; (8001824 <USART_Cmd+0x64>)
 80017ce:	4298      	cmp	r0, r3
 80017d0:	d013      	beq.n	80017fa <USART_Cmd+0x3a>
 80017d2:	4b15      	ldr	r3, [pc, #84]	; (8001828 <USART_Cmd+0x68>)
 80017d4:	4298      	cmp	r0, r3
 80017d6:	d010      	beq.n	80017fa <USART_Cmd+0x3a>
 80017d8:	4b14      	ldr	r3, [pc, #80]	; (800182c <USART_Cmd+0x6c>)
 80017da:	4298      	cmp	r0, r3
 80017dc:	d00d      	beq.n	80017fa <USART_Cmd+0x3a>
 80017de:	4b14      	ldr	r3, [pc, #80]	; (8001830 <USART_Cmd+0x70>)
 80017e0:	4298      	cmp	r0, r3
 80017e2:	d00a      	beq.n	80017fa <USART_Cmd+0x3a>
 80017e4:	4b13      	ldr	r3, [pc, #76]	; (8001834 <USART_Cmd+0x74>)
 80017e6:	4298      	cmp	r0, r3
 80017e8:	d007      	beq.n	80017fa <USART_Cmd+0x3a>
 80017ea:	4b13      	ldr	r3, [pc, #76]	; (8001838 <USART_Cmd+0x78>)
 80017ec:	4298      	cmp	r0, r3
 80017ee:	d004      	beq.n	80017fa <USART_Cmd+0x3a>
 80017f0:	4b12      	ldr	r3, [pc, #72]	; (800183c <USART_Cmd+0x7c>)
 80017f2:	18c0      	adds	r0, r0, r3
 80017f4:	4243      	negs	r3, r0
 80017f6:	4158      	adcs	r0, r3
 80017f8:	e000      	b.n	80017fc <USART_Cmd+0x3c>
 80017fa:	2001      	movs	r0, #1
 80017fc:	f7ff fcb9 	bl	8001172 <assert_param>
 8001800:	2501      	movs	r5, #1
 8001802:	2000      	movs	r0, #0
 8001804:	42b5      	cmp	r5, r6
 8001806:	4140      	adcs	r0, r0
 8001808:	f7ff fcb3 	bl	8001172 <assert_param>
 800180c:	6823      	ldr	r3, [r4, #0]
 800180e:	2e00      	cmp	r6, #0
 8001810:	d002      	beq.n	8001818 <USART_Cmd+0x58>
 8001812:	431d      	orrs	r5, r3
 8001814:	6025      	str	r5, [r4, #0]
 8001816:	e001      	b.n	800181c <USART_Cmd+0x5c>
 8001818:	43ab      	bics	r3, r5
 800181a:	6023      	str	r3, [r4, #0]
 800181c:	bd70      	pop	{r4, r5, r6, pc}
 800181e:	46c0      	nop			; (mov r8, r8)
 8001820:	40013800 	.word	0x40013800
 8001824:	40004400 	.word	0x40004400
 8001828:	40004800 	.word	0x40004800
 800182c:	40004c00 	.word	0x40004c00
 8001830:	40005000 	.word	0x40005000
 8001834:	40011400 	.word	0x40011400
 8001838:	40011800 	.word	0x40011800
 800183c:	bffee400 	.word	0xbffee400

08001840 <USART_ClearITPendingBit>:
 8001840:	b538      	push	{r3, r4, r5, lr}
 8001842:	4b26      	ldr	r3, [pc, #152]	; (80018dc <USART_ClearITPendingBit+0x9c>)
 8001844:	1c05      	adds	r5, r0, #0
 8001846:	1c0c      	adds	r4, r1, #0
 8001848:	4298      	cmp	r0, r3
 800184a:	d016      	beq.n	800187a <USART_ClearITPendingBit+0x3a>
 800184c:	4b24      	ldr	r3, [pc, #144]	; (80018e0 <USART_ClearITPendingBit+0xa0>)
 800184e:	4298      	cmp	r0, r3
 8001850:	d013      	beq.n	800187a <USART_ClearITPendingBit+0x3a>
 8001852:	4b24      	ldr	r3, [pc, #144]	; (80018e4 <USART_ClearITPendingBit+0xa4>)
 8001854:	4298      	cmp	r0, r3
 8001856:	d010      	beq.n	800187a <USART_ClearITPendingBit+0x3a>
 8001858:	4b23      	ldr	r3, [pc, #140]	; (80018e8 <USART_ClearITPendingBit+0xa8>)
 800185a:	4298      	cmp	r0, r3
 800185c:	d00d      	beq.n	800187a <USART_ClearITPendingBit+0x3a>
 800185e:	4b23      	ldr	r3, [pc, #140]	; (80018ec <USART_ClearITPendingBit+0xac>)
 8001860:	4298      	cmp	r0, r3
 8001862:	d00a      	beq.n	800187a <USART_ClearITPendingBit+0x3a>
 8001864:	4b22      	ldr	r3, [pc, #136]	; (80018f0 <USART_ClearITPendingBit+0xb0>)
 8001866:	4298      	cmp	r0, r3
 8001868:	d007      	beq.n	800187a <USART_ClearITPendingBit+0x3a>
 800186a:	4b22      	ldr	r3, [pc, #136]	; (80018f4 <USART_ClearITPendingBit+0xb4>)
 800186c:	4298      	cmp	r0, r3
 800186e:	d004      	beq.n	800187a <USART_ClearITPendingBit+0x3a>
 8001870:	4a21      	ldr	r2, [pc, #132]	; (80018f8 <USART_ClearITPendingBit+0xb8>)
 8001872:	1880      	adds	r0, r0, r2
 8001874:	4243      	negs	r3, r0
 8001876:	4158      	adcs	r0, r3
 8001878:	e000      	b.n	800187c <USART_ClearITPendingBit+0x3c>
 800187a:	2001      	movs	r0, #1
 800187c:	f7ff fc79 	bl	8001172 <assert_param>
 8001880:	4b1e      	ldr	r3, [pc, #120]	; (80018fc <USART_ClearITPendingBit+0xbc>)
 8001882:	429c      	cmp	r4, r3
 8001884:	d022      	beq.n	80018cc <USART_ClearITPendingBit+0x8c>
 8001886:	2384      	movs	r3, #132	; 0x84
 8001888:	005b      	lsls	r3, r3, #1
 800188a:	429c      	cmp	r4, r3
 800188c:	d01e      	beq.n	80018cc <USART_ClearITPendingBit+0x8c>
 800188e:	4a1c      	ldr	r2, [pc, #112]	; (8001900 <USART_ClearITPendingBit+0xc0>)
 8001890:	4b1c      	ldr	r3, [pc, #112]	; (8001904 <USART_ClearITPendingBit+0xc4>)
 8001892:	4022      	ands	r2, r4
 8001894:	429a      	cmp	r2, r3
 8001896:	d019      	beq.n	80018cc <USART_ClearITPendingBit+0x8c>
 8001898:	4b1b      	ldr	r3, [pc, #108]	; (8001908 <USART_ClearITPendingBit+0xc8>)
 800189a:	429c      	cmp	r4, r3
 800189c:	d016      	beq.n	80018cc <USART_ClearITPendingBit+0x8c>
 800189e:	4b1b      	ldr	r3, [pc, #108]	; (800190c <USART_ClearITPendingBit+0xcc>)
 80018a0:	429c      	cmp	r4, r3
 80018a2:	d013      	beq.n	80018cc <USART_ClearITPendingBit+0x8c>
 80018a4:	4b1a      	ldr	r3, [pc, #104]	; (8001910 <USART_ClearITPendingBit+0xd0>)
 80018a6:	429c      	cmp	r4, r3
 80018a8:	d010      	beq.n	80018cc <USART_ClearITPendingBit+0x8c>
 80018aa:	4b1a      	ldr	r3, [pc, #104]	; (8001914 <USART_ClearITPendingBit+0xd4>)
 80018ac:	429c      	cmp	r4, r3
 80018ae:	d00d      	beq.n	80018cc <USART_ClearITPendingBit+0x8c>
 80018b0:	4b19      	ldr	r3, [pc, #100]	; (8001918 <USART_ClearITPendingBit+0xd8>)
 80018b2:	429c      	cmp	r4, r3
 80018b4:	d00a      	beq.n	80018cc <USART_ClearITPendingBit+0x8c>
 80018b6:	4b19      	ldr	r3, [pc, #100]	; (800191c <USART_ClearITPendingBit+0xdc>)
 80018b8:	429c      	cmp	r4, r3
 80018ba:	d007      	beq.n	80018cc <USART_ClearITPendingBit+0x8c>
 80018bc:	4b18      	ldr	r3, [pc, #96]	; (8001920 <USART_ClearITPendingBit+0xe0>)
 80018be:	429c      	cmp	r4, r3
 80018c0:	d004      	beq.n	80018cc <USART_ClearITPendingBit+0x8c>
 80018c2:	4a18      	ldr	r2, [pc, #96]	; (8001924 <USART_ClearITPendingBit+0xe4>)
 80018c4:	18a3      	adds	r3, r4, r2
 80018c6:	4258      	negs	r0, r3
 80018c8:	4158      	adcs	r0, r3
 80018ca:	e000      	b.n	80018ce <USART_ClearITPendingBit+0x8e>
 80018cc:	2001      	movs	r0, #1
 80018ce:	f7ff fc50 	bl	8001172 <assert_param>
 80018d2:	0c24      	lsrs	r4, r4, #16
 80018d4:	2301      	movs	r3, #1
 80018d6:	40a3      	lsls	r3, r4
 80018d8:	622b      	str	r3, [r5, #32]
 80018da:	bd38      	pop	{r3, r4, r5, pc}
 80018dc:	40013800 	.word	0x40013800
 80018e0:	40004400 	.word	0x40004400
 80018e4:	40004800 	.word	0x40004800
 80018e8:	40004c00 	.word	0x40004c00
 80018ec:	40005000 	.word	0x40005000
 80018f0:	40011400 	.word	0x40011400
 80018f4:	40011800 	.word	0x40011800
 80018f8:	bffee400 	.word	0xbffee400
 80018fc:	00060106 	.word	0x00060106
 8001900:	fffdffff 	.word	0xfffdffff
 8001904:	00010300 	.word	0x00010300
 8001908:	00020300 	.word	0x00020300
 800190c:	00040104 	.word	0x00040104
 8001910:	00080206 	.word	0x00080206
 8001914:	0009030a 	.word	0x0009030a
 8001918:	000b011a 	.word	0x000b011a
 800191c:	000c011b 	.word	0x000c011b
 8001920:	0011010e 	.word	0x0011010e
 8001924:	ffebfcea 	.word	0xffebfcea

08001928 <NVIC_Init>:
 8001928:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
 800192a:	2500      	movs	r5, #0
 800192c:	7883      	ldrb	r3, [r0, #2]
 800192e:	1c04      	adds	r4, r0, #0
 8001930:	2601      	movs	r6, #1
 8001932:	1c28      	adds	r0, r5, #0
 8001934:	429e      	cmp	r6, r3
 8001936:	4168      	adcs	r0, r5
 8001938:	f7ff fc1b 	bl	8001172 <assert_param>
 800193c:	7863      	ldrb	r3, [r4, #1]
 800193e:	2703      	movs	r7, #3
 8001940:	1c28      	adds	r0, r5, #0
 8001942:	429f      	cmp	r7, r3
 8001944:	4168      	adcs	r0, r5
 8001946:	f7ff fc14 	bl	8001172 <assert_param>
 800194a:	78a2      	ldrb	r2, [r4, #2]
 800194c:	7823      	ldrb	r3, [r4, #0]
 800194e:	42aa      	cmp	r2, r5
 8001950:	d01a      	beq.n	8001988 <NVIC_Init+0x60>
 8001952:	0899      	lsrs	r1, r3, #2
 8001954:	4a0f      	ldr	r2, [pc, #60]	; (8001994 <NVIC_Init+0x6c>)
 8001956:	0089      	lsls	r1, r1, #2
 8001958:	1889      	adds	r1, r1, r2
 800195a:	22c0      	movs	r2, #192	; 0xc0
 800195c:	0092      	lsls	r2, r2, #2
 800195e:	401f      	ands	r7, r3
 8001960:	20ff      	movs	r0, #255	; 0xff
 8001962:	588d      	ldr	r5, [r1, r2]
 8001964:	00ff      	lsls	r7, r7, #3
 8001966:	1c03      	adds	r3, r0, #0
 8001968:	40bb      	lsls	r3, r7
 800196a:	439d      	bics	r5, r3
 800196c:	7863      	ldrb	r3, [r4, #1]
 800196e:	019b      	lsls	r3, r3, #6
 8001970:	4018      	ands	r0, r3
 8001972:	40b8      	lsls	r0, r7
 8001974:	1c2f      	adds	r7, r5, #0
 8001976:	4307      	orrs	r7, r0
 8001978:	508f      	str	r7, [r1, r2]
 800197a:	7822      	ldrb	r2, [r4, #0]
 800197c:	231f      	movs	r3, #31
 800197e:	4013      	ands	r3, r2
 8001980:	409e      	lsls	r6, r3
 8001982:	4b04      	ldr	r3, [pc, #16]	; (8001994 <NVIC_Init+0x6c>)
 8001984:	601e      	str	r6, [r3, #0]
 8001986:	e004      	b.n	8001992 <NVIC_Init+0x6a>
 8001988:	271f      	movs	r7, #31
 800198a:	403b      	ands	r3, r7
 800198c:	4a02      	ldr	r2, [pc, #8]	; (8001998 <NVIC_Init+0x70>)
 800198e:	409e      	lsls	r6, r3
 8001990:	67d6      	str	r6, [r2, #124]	; 0x7c
 8001992:	bdf8      	pop	{r3, r4, r5, r6, r7, pc}
 8001994:	e000e100 	.word	0xe000e100
 8001998:	e000e104 	.word	0xe000e104

0800199c <RCC_GetClocksFreq>:
 800199c:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
 800199e:	4d5a      	ldr	r5, [pc, #360]	; (8001b08 <RCC_GetClocksFreq+0x16c>)
 80019a0:	1c04      	adds	r4, r0, #0
 80019a2:	6868      	ldr	r0, [r5, #4]
 80019a4:	230c      	movs	r3, #12
 80019a6:	4018      	ands	r0, r3
 80019a8:	f000 f9be 	bl	8001d28 <__gnu_thumb1_case_uqi>
 80019ac:	1f1f1f1f 	.word	0x1f1f1f1f
 80019b0:	1f1f1f1f 	.word	0x1f1f1f1f
 80019b4:	1f1f1f07 	.word	0x1f1f1f07
 80019b8:	1d          	.byte	0x1d
 80019b9:	00          	.byte	0x00
 80019ba:	686e      	ldr	r6, [r5, #4]
 80019bc:	23c0      	movs	r3, #192	; 0xc0
 80019be:	02b6      	lsls	r6, r6, #10
 80019c0:	686a      	ldr	r2, [r5, #4]
 80019c2:	0f36      	lsrs	r6, r6, #28
 80019c4:	025b      	lsls	r3, r3, #9
 80019c6:	3602      	adds	r6, #2
 80019c8:	421a      	tst	r2, r3
 80019ca:	d101      	bne.n	80019d0 <RCC_GetClocksFreq+0x34>
 80019cc:	484f      	ldr	r0, [pc, #316]	; (8001b0c <RCC_GetClocksFreq+0x170>)
 80019ce:	e007      	b.n	80019e0 <RCC_GetClocksFreq+0x44>
 80019d0:	4b4d      	ldr	r3, [pc, #308]	; (8001b08 <RCC_GetClocksFreq+0x16c>)
 80019d2:	484f      	ldr	r0, [pc, #316]	; (8001b10 <RCC_GetClocksFreq+0x174>)
 80019d4:	6ad9      	ldr	r1, [r3, #44]	; 0x2c
 80019d6:	230f      	movs	r3, #15
 80019d8:	4019      	ands	r1, r3
 80019da:	3101      	adds	r1, #1
 80019dc:	f000 f9ae 	bl	8001d3c <__aeabi_uidiv>
 80019e0:	4370      	muls	r0, r6
 80019e2:	6020      	str	r0, [r4, #0]
 80019e4:	e004      	b.n	80019f0 <RCC_GetClocksFreq+0x54>
 80019e6:	4b4b      	ldr	r3, [pc, #300]	; (8001b14 <RCC_GetClocksFreq+0x178>)
 80019e8:	e000      	b.n	80019ec <RCC_GetClocksFreq+0x50>
 80019ea:	4b49      	ldr	r3, [pc, #292]	; (8001b10 <RCC_GetClocksFreq+0x174>)
 80019ec:	6023      	str	r3, [r4, #0]
 80019ee:	2000      	movs	r0, #0
 80019f0:	686b      	ldr	r3, [r5, #4]
 80019f2:	4a49      	ldr	r2, [pc, #292]	; (8001b18 <RCC_GetClocksFreq+0x17c>)
 80019f4:	061b      	lsls	r3, r3, #24
 80019f6:	0f1b      	lsrs	r3, r3, #28
 80019f8:	6821      	ldr	r1, [r4, #0]
 80019fa:	5cd3      	ldrb	r3, [r2, r3]
 80019fc:	1c0e      	adds	r6, r1, #0
 80019fe:	40de      	lsrs	r6, r3
 8001a00:	6066      	str	r6, [r4, #4]
 8001a02:	1c33      	adds	r3, r6, #0
 8001a04:	686e      	ldr	r6, [r5, #4]
 8001a06:	0576      	lsls	r6, r6, #21
 8001a08:	0f76      	lsrs	r6, r6, #29
 8001a0a:	5d92      	ldrb	r2, [r2, r6]
 8001a0c:	40d3      	lsrs	r3, r2
 8001a0e:	60a3      	str	r3, [r4, #8]
 8001a10:	6b2a      	ldr	r2, [r5, #48]	; 0x30
 8001a12:	05d6      	lsls	r6, r2, #23
 8001a14:	d401      	bmi.n	8001a1a <RCC_GetClocksFreq+0x7e>
 8001a16:	4a41      	ldr	r2, [pc, #260]	; (8001b1c <RCC_GetClocksFreq+0x180>)
 8001a18:	e006      	b.n	8001a28 <RCC_GetClocksFreq+0x8c>
 8001a1a:	4a3b      	ldr	r2, [pc, #236]	; (8001b08 <RCC_GetClocksFreq+0x16c>)
 8001a1c:	6852      	ldr	r2, [r2, #4]
 8001a1e:	0456      	lsls	r6, r2, #17
 8001a20:	d401      	bmi.n	8001a26 <RCC_GetClocksFreq+0x8a>
 8001a22:	085a      	lsrs	r2, r3, #1
 8001a24:	e000      	b.n	8001a28 <RCC_GetClocksFreq+0x8c>
 8001a26:	089a      	lsrs	r2, r3, #2
 8001a28:	60e2      	str	r2, [r4, #12]
 8001a2a:	6b2a      	ldr	r2, [r5, #48]	; 0x30
 8001a2c:	0656      	lsls	r6, r2, #25
 8001a2e:	d401      	bmi.n	8001a34 <RCC_GetClocksFreq+0x98>
 8001a30:	4a3b      	ldr	r2, [pc, #236]	; (8001b20 <RCC_GetClocksFreq+0x184>)
 8001a32:	e001      	b.n	8001a38 <RCC_GetClocksFreq+0x9c>
 8001a34:	2280      	movs	r2, #128	; 0x80
 8001a36:	0212      	lsls	r2, r2, #8
 8001a38:	6122      	str	r2, [r4, #16]
 8001a3a:	6b2a      	ldr	r2, [r5, #48]	; 0x30
 8001a3c:	06d6      	lsls	r6, r2, #27
 8001a3e:	d402      	bmi.n	8001a46 <RCC_GetClocksFreq+0xaa>
 8001a40:	4a33      	ldr	r2, [pc, #204]	; (8001b10 <RCC_GetClocksFreq+0x174>)
 8001a42:	6162      	str	r2, [r4, #20]
 8001a44:	e000      	b.n	8001a48 <RCC_GetClocksFreq+0xac>
 8001a46:	6161      	str	r1, [r4, #20]
 8001a48:	6b2f      	ldr	r7, [r5, #48]	; 0x30
 8001a4a:	2203      	movs	r2, #3
 8001a4c:	4e2e      	ldr	r6, [pc, #184]	; (8001b08 <RCC_GetClocksFreq+0x16c>)
 8001a4e:	4217      	tst	r7, r2
 8001a50:	d101      	bne.n	8001a56 <RCC_GetClocksFreq+0xba>
 8001a52:	61a3      	str	r3, [r4, #24]
 8001a54:	e012      	b.n	8001a7c <RCC_GetClocksFreq+0xe0>
 8001a56:	6b37      	ldr	r7, [r6, #48]	; 0x30
 8001a58:	4017      	ands	r7, r2
 8001a5a:	2f01      	cmp	r7, #1
 8001a5c:	d101      	bne.n	8001a62 <RCC_GetClocksFreq+0xc6>
 8001a5e:	61a1      	str	r1, [r4, #24]
 8001a60:	e00c      	b.n	8001a7c <RCC_GetClocksFreq+0xe0>
 8001a62:	6b37      	ldr	r7, [r6, #48]	; 0x30
 8001a64:	4017      	ands	r7, r2
 8001a66:	2f02      	cmp	r7, #2
 8001a68:	d102      	bne.n	8001a70 <RCC_GetClocksFreq+0xd4>
 8001a6a:	2280      	movs	r2, #128	; 0x80
 8001a6c:	0212      	lsls	r2, r2, #8
 8001a6e:	e004      	b.n	8001a7a <RCC_GetClocksFreq+0xde>
 8001a70:	6b36      	ldr	r6, [r6, #48]	; 0x30
 8001a72:	4032      	ands	r2, r6
 8001a74:	2a03      	cmp	r2, #3
 8001a76:	d101      	bne.n	8001a7c <RCC_GetClocksFreq+0xe0>
 8001a78:	4a25      	ldr	r2, [pc, #148]	; (8001b10 <RCC_GetClocksFreq+0x174>)
 8001a7a:	61a2      	str	r2, [r4, #24]
 8001a7c:	22c0      	movs	r2, #192	; 0xc0
 8001a7e:	6b2f      	ldr	r7, [r5, #48]	; 0x30
 8001a80:	0292      	lsls	r2, r2, #10
 8001a82:	4e21      	ldr	r6, [pc, #132]	; (8001b08 <RCC_GetClocksFreq+0x16c>)
 8001a84:	4217      	tst	r7, r2
 8001a86:	d101      	bne.n	8001a8c <RCC_GetClocksFreq+0xf0>
 8001a88:	61e3      	str	r3, [r4, #28]
 8001a8a:	e018      	b.n	8001abe <RCC_GetClocksFreq+0x122>
 8001a8c:	6b37      	ldr	r7, [r6, #48]	; 0x30
 8001a8e:	4017      	ands	r7, r2
 8001a90:	46bc      	mov	ip, r7
 8001a92:	2780      	movs	r7, #128	; 0x80
 8001a94:	027f      	lsls	r7, r7, #9
 8001a96:	45bc      	cmp	ip, r7
 8001a98:	d101      	bne.n	8001a9e <RCC_GetClocksFreq+0x102>
 8001a9a:	61e1      	str	r1, [r4, #28]
 8001a9c:	e00f      	b.n	8001abe <RCC_GetClocksFreq+0x122>
 8001a9e:	6b37      	ldr	r7, [r6, #48]	; 0x30
 8001aa0:	4017      	ands	r7, r2
 8001aa2:	46bc      	mov	ip, r7
 8001aa4:	2780      	movs	r7, #128	; 0x80
 8001aa6:	02bf      	lsls	r7, r7, #10
 8001aa8:	45bc      	cmp	ip, r7
 8001aaa:	d102      	bne.n	8001ab2 <RCC_GetClocksFreq+0x116>
 8001aac:	2280      	movs	r2, #128	; 0x80
 8001aae:	0212      	lsls	r2, r2, #8
 8001ab0:	e004      	b.n	8001abc <RCC_GetClocksFreq+0x120>
 8001ab2:	6b36      	ldr	r6, [r6, #48]	; 0x30
 8001ab4:	4016      	ands	r6, r2
 8001ab6:	4296      	cmp	r6, r2
 8001ab8:	d101      	bne.n	8001abe <RCC_GetClocksFreq+0x122>
 8001aba:	4a15      	ldr	r2, [pc, #84]	; (8001b10 <RCC_GetClocksFreq+0x174>)
 8001abc:	61e2      	str	r2, [r4, #28]
 8001abe:	22c0      	movs	r2, #192	; 0xc0
 8001ac0:	6b2f      	ldr	r7, [r5, #48]	; 0x30
 8001ac2:	0312      	lsls	r2, r2, #12
 8001ac4:	4e10      	ldr	r6, [pc, #64]	; (8001b08 <RCC_GetClocksFreq+0x16c>)
 8001ac6:	4217      	tst	r7, r2
 8001ac8:	d015      	beq.n	8001af6 <RCC_GetClocksFreq+0x15a>
 8001aca:	6b37      	ldr	r7, [r6, #48]	; 0x30
 8001acc:	2380      	movs	r3, #128	; 0x80
 8001ace:	4017      	ands	r7, r2
 8001ad0:	02db      	lsls	r3, r3, #11
 8001ad2:	429f      	cmp	r7, r3
 8001ad4:	d101      	bne.n	8001ada <RCC_GetClocksFreq+0x13e>
 8001ad6:	6221      	str	r1, [r4, #32]
 8001ad8:	e00e      	b.n	8001af8 <RCC_GetClocksFreq+0x15c>
 8001ada:	6b31      	ldr	r1, [r6, #48]	; 0x30
 8001adc:	2380      	movs	r3, #128	; 0x80
 8001ade:	4011      	ands	r1, r2
 8001ae0:	031b      	lsls	r3, r3, #12
 8001ae2:	4299      	cmp	r1, r3
 8001ae4:	d102      	bne.n	8001aec <RCC_GetClocksFreq+0x150>
 8001ae6:	2380      	movs	r3, #128	; 0x80
 8001ae8:	021b      	lsls	r3, r3, #8
 8001aea:	e004      	b.n	8001af6 <RCC_GetClocksFreq+0x15a>
 8001aec:	6b33      	ldr	r3, [r6, #48]	; 0x30
 8001aee:	4013      	ands	r3, r2
 8001af0:	4293      	cmp	r3, r2
 8001af2:	d101      	bne.n	8001af8 <RCC_GetClocksFreq+0x15c>
 8001af4:	4b06      	ldr	r3, [pc, #24]	; (8001b10 <RCC_GetClocksFreq+0x174>)
 8001af6:	6223      	str	r3, [r4, #32]
 8001af8:	6b2b      	ldr	r3, [r5, #48]	; 0x30
 8001afa:	061a      	lsls	r2, r3, #24
 8001afc:	d402      	bmi.n	8001b04 <RCC_GetClocksFreq+0x168>
 8001afe:	4b05      	ldr	r3, [pc, #20]	; (8001b14 <RCC_GetClocksFreq+0x178>)
 8001b00:	6263      	str	r3, [r4, #36]	; 0x24
 8001b02:	e000      	b.n	8001b06 <RCC_GetClocksFreq+0x16a>
 8001b04:	6260      	str	r0, [r4, #36]	; 0x24
 8001b06:	bdf8      	pop	{r3, r4, r5, r6, r7, pc}
 8001b08:	40021000 	.word	0x40021000
 8001b0c:	003d0900 	.word	0x003d0900
 8001b10:	007a1200 	.word	0x007a1200
 8001b14:	02dc6c00 	.word	0x02dc6c00
 8001b18:	20000000 	.word	0x20000000
 8001b1c:	00d59f80 	.word	0x00d59f80
 8001b20:	00008012 	.word	0x00008012

08001b24 <RCC_AHBPeriphClockCmd>:
 8001b24:	b538      	push	{r3, r4, r5, lr}
 8001b26:	4b0d      	ldr	r3, [pc, #52]	; (8001b5c <RCC_AHBPeriphClockCmd+0x38>)
 8001b28:	1c04      	adds	r4, r0, #0
 8001b2a:	1c0d      	adds	r5, r1, #0
 8001b2c:	2000      	movs	r0, #0
 8001b2e:	421c      	tst	r4, r3
 8001b30:	d102      	bne.n	8001b38 <RCC_AHBPeriphClockCmd+0x14>
 8001b32:	1c20      	adds	r0, r4, #0
 8001b34:	1e43      	subs	r3, r0, #1
 8001b36:	4198      	sbcs	r0, r3
 8001b38:	f7ff fb1b 	bl	8001172 <assert_param>
 8001b3c:	2301      	movs	r3, #1
 8001b3e:	2000      	movs	r0, #0
 8001b40:	42ab      	cmp	r3, r5
 8001b42:	4140      	adcs	r0, r0
 8001b44:	f7ff fb15 	bl	8001172 <assert_param>
 8001b48:	4b05      	ldr	r3, [pc, #20]	; (8001b60 <RCC_AHBPeriphClockCmd+0x3c>)
 8001b4a:	695a      	ldr	r2, [r3, #20]
 8001b4c:	2d00      	cmp	r5, #0
 8001b4e:	d002      	beq.n	8001b56 <RCC_AHBPeriphClockCmd+0x32>
 8001b50:	4314      	orrs	r4, r2
 8001b52:	615c      	str	r4, [r3, #20]
 8001b54:	e001      	b.n	8001b5a <RCC_AHBPeriphClockCmd+0x36>
 8001b56:	43a2      	bics	r2, r4
 8001b58:	615a      	str	r2, [r3, #20]
 8001b5a:	bd38      	pop	{r3, r4, r5, pc}
 8001b5c:	fe81ffa8 	.word	0xfe81ffa8
 8001b60:	40021000 	.word	0x40021000

08001b64 <RCC_APB2PeriphClockCmd>:
 8001b64:	b538      	push	{r3, r4, r5, lr}
 8001b66:	4b0d      	ldr	r3, [pc, #52]	; (8001b9c <RCC_APB2PeriphClockCmd+0x38>)
 8001b68:	1c04      	adds	r4, r0, #0
 8001b6a:	1c0d      	adds	r5, r1, #0
 8001b6c:	2000      	movs	r0, #0
 8001b6e:	421c      	tst	r4, r3
 8001b70:	d102      	bne.n	8001b78 <RCC_APB2PeriphClockCmd+0x14>
 8001b72:	1c20      	adds	r0, r4, #0
 8001b74:	1e43      	subs	r3, r0, #1
 8001b76:	4198      	sbcs	r0, r3
 8001b78:	f7ff fafb 	bl	8001172 <assert_param>
 8001b7c:	2301      	movs	r3, #1
 8001b7e:	2000      	movs	r0, #0
 8001b80:	42ab      	cmp	r3, r5
 8001b82:	4140      	adcs	r0, r0
 8001b84:	f7ff faf5 	bl	8001172 <assert_param>
 8001b88:	4b05      	ldr	r3, [pc, #20]	; (8001ba0 <RCC_APB2PeriphClockCmd+0x3c>)
 8001b8a:	699a      	ldr	r2, [r3, #24]
 8001b8c:	2d00      	cmp	r5, #0
 8001b8e:	d002      	beq.n	8001b96 <RCC_APB2PeriphClockCmd+0x32>
 8001b90:	4314      	orrs	r4, r2
 8001b92:	619c      	str	r4, [r3, #24]
 8001b94:	e001      	b.n	8001b9a <RCC_APB2PeriphClockCmd+0x36>
 8001b96:	43a2      	bics	r2, r4
 8001b98:	619a      	str	r2, [r3, #24]
 8001b9a:	bd38      	pop	{r3, r4, r5, pc}
 8001b9c:	ffb8a51e 	.word	0xffb8a51e
 8001ba0:	40021000 	.word	0x40021000

08001ba4 <RCC_APB1PeriphClockCmd>:
 8001ba4:	b538      	push	{r3, r4, r5, lr}
 8001ba6:	4b0d      	ldr	r3, [pc, #52]	; (8001bdc <RCC_APB1PeriphClockCmd+0x38>)
 8001ba8:	1c04      	adds	r4, r0, #0
 8001baa:	1c0d      	adds	r5, r1, #0
 8001bac:	2000      	movs	r0, #0
 8001bae:	421c      	tst	r4, r3
 8001bb0:	d102      	bne.n	8001bb8 <RCC_APB1PeriphClockCmd+0x14>
 8001bb2:	1c20      	adds	r0, r4, #0
 8001bb4:	1e43      	subs	r3, r0, #1
 8001bb6:	4198      	sbcs	r0, r3
 8001bb8:	f7ff fadb 	bl	8001172 <assert_param>
 8001bbc:	2301      	movs	r3, #1
 8001bbe:	2000      	movs	r0, #0
 8001bc0:	42ab      	cmp	r3, r5
 8001bc2:	4140      	adcs	r0, r0
 8001bc4:	f7ff fad5 	bl	8001172 <assert_param>
 8001bc8:	4b05      	ldr	r3, [pc, #20]	; (8001be0 <RCC_APB1PeriphClockCmd+0x3c>)
 8001bca:	69da      	ldr	r2, [r3, #28]
 8001bcc:	2d00      	cmp	r5, #0
 8001bce:	d002      	beq.n	8001bd6 <RCC_APB1PeriphClockCmd+0x32>
 8001bd0:	4314      	orrs	r4, r2
 8001bd2:	61dc      	str	r4, [r3, #28]
 8001bd4:	e001      	b.n	8001bda <RCC_APB1PeriphClockCmd+0x36>
 8001bd6:	43a2      	bics	r2, r4
 8001bd8:	61da      	str	r2, [r3, #28]
 8001bda:	bd38      	pop	{r3, r4, r5, pc}
 8001bdc:	8581b6cc 	.word	0x8581b6cc
 8001be0:	40021000 	.word	0x40021000

08001be4 <gpio_init>:
 8001be4:	b5f7      	push	{r0, r1, r2, r4, r5, r6, r7, lr}
 8001be6:	2080      	movs	r0, #128	; 0x80
 8001be8:	0280      	lsls	r0, r0, #10
 8001bea:	2101      	movs	r1, #1
 8001bec:	f7ff ff9a 	bl	8001b24 <RCC_AHBPeriphClockCmd>
 8001bf0:	2080      	movs	r0, #128	; 0x80
 8001bf2:	02c0      	lsls	r0, r0, #11
 8001bf4:	2101      	movs	r1, #1
 8001bf6:	f7ff ff95 	bl	8001b24 <RCC_AHBPeriphClockCmd>
 8001bfa:	2208      	movs	r2, #8
 8001bfc:	2400      	movs	r4, #0
 8001bfe:	466b      	mov	r3, sp
 8001c00:	2603      	movs	r6, #3
 8001c02:	9200      	str	r2, [sp, #0]
 8001c04:	4669      	mov	r1, sp
 8001c06:	2201      	movs	r2, #1
 8001c08:	481c      	ldr	r0, [pc, #112]	; (8001c7c <gpio_init+0x98>)
 8001c0a:	715e      	strb	r6, [r3, #5]
 8001c0c:	711a      	strb	r2, [r3, #4]
 8001c0e:	719c      	strb	r4, [r3, #6]
 8001c10:	71dc      	strb	r4, [r3, #7]
 8001c12:	2590      	movs	r5, #144	; 0x90
 8001c14:	f7ff fb26 	bl	8001264 <GPIO_Init>
 8001c18:	2380      	movs	r3, #128	; 0x80
 8001c1a:	05ed      	lsls	r5, r5, #23
 8001c1c:	005b      	lsls	r3, r3, #1
 8001c1e:	466a      	mov	r2, sp
 8001c20:	1c28      	adds	r0, r5, #0
 8001c22:	9300      	str	r3, [sp, #0]
 8001c24:	4669      	mov	r1, sp
 8001c26:	2301      	movs	r3, #1
 8001c28:	2780      	movs	r7, #128	; 0x80
 8001c2a:	7156      	strb	r6, [r2, #5]
 8001c2c:	013f      	lsls	r7, r7, #4
 8001c2e:	7113      	strb	r3, [r2, #4]
 8001c30:	7194      	strb	r4, [r2, #6]
 8001c32:	71d4      	strb	r4, [r2, #7]
 8001c34:	f7ff fb16 	bl	8001264 <GPIO_Init>
 8001c38:	466a      	mov	r2, sp
 8001c3a:	1c28      	adds	r0, r5, #0
 8001c3c:	2301      	movs	r3, #1
 8001c3e:	4669      	mov	r1, sp
 8001c40:	7156      	strb	r6, [r2, #5]
 8001c42:	9700      	str	r7, [sp, #0]
 8001c44:	7113      	strb	r3, [r2, #4]
 8001c46:	7194      	strb	r4, [r2, #6]
 8001c48:	71d4      	strb	r4, [r2, #7]
 8001c4a:	f7ff fb0b 	bl	8001264 <GPIO_Init>
 8001c4e:	2202      	movs	r2, #2
 8001c50:	466b      	mov	r3, sp
 8001c52:	9200      	str	r2, [sp, #0]
 8001c54:	1c28      	adds	r0, r5, #0
 8001c56:	2201      	movs	r2, #1
 8001c58:	4669      	mov	r1, sp
 8001c5a:	715e      	strb	r6, [r3, #5]
 8001c5c:	711a      	strb	r2, [r3, #4]
 8001c5e:	719c      	strb	r4, [r3, #6]
 8001c60:	71dc      	strb	r4, [r3, #7]
 8001c62:	f7ff faff 	bl	8001264 <GPIO_Init>
 8001c66:	4b05      	ldr	r3, [pc, #20]	; (8001c7c <gpio_init+0x98>)
 8001c68:	2208      	movs	r2, #8
 8001c6a:	851a      	strh	r2, [r3, #40]	; 0x28
 8001c6c:	2380      	movs	r3, #128	; 0x80
 8001c6e:	005b      	lsls	r3, r3, #1
 8001c70:	2202      	movs	r2, #2
 8001c72:	852b      	strh	r3, [r5, #40]	; 0x28
 8001c74:	852f      	strh	r7, [r5, #40]	; 0x28
 8001c76:	852a      	strh	r2, [r5, #40]	; 0x28
 8001c78:	bdf7      	pop	{r0, r1, r2, r4, r5, r6, r7, pc}
 8001c7a:	46c0      	nop			; (mov r8, r8)
 8001c7c:	48000400 	.word	0x48000400

08001c80 <led_on>:
 8001c80:	2808      	cmp	r0, #8
 8001c82:	d101      	bne.n	8001c88 <led_on+0x8>
 8001c84:	4b07      	ldr	r3, [pc, #28]	; (8001ca4 <led_on+0x24>)
 8001c86:	e00b      	b.n	8001ca0 <led_on+0x20>
 8001c88:	2380      	movs	r3, #128	; 0x80
 8001c8a:	005b      	lsls	r3, r3, #1
 8001c8c:	4298      	cmp	r0, r3
 8001c8e:	d005      	beq.n	8001c9c <led_on+0x1c>
 8001c90:	2380      	movs	r3, #128	; 0x80
 8001c92:	011b      	lsls	r3, r3, #4
 8001c94:	4298      	cmp	r0, r3
 8001c96:	d001      	beq.n	8001c9c <led_on+0x1c>
 8001c98:	2802      	cmp	r0, #2
 8001c9a:	d102      	bne.n	8001ca2 <led_on+0x22>
 8001c9c:	2390      	movs	r3, #144	; 0x90
 8001c9e:	05db      	lsls	r3, r3, #23
 8001ca0:	6198      	str	r0, [r3, #24]
 8001ca2:	4770      	bx	lr
 8001ca4:	48000400 	.word	0x48000400

08001ca8 <led_off>:
 8001ca8:	2808      	cmp	r0, #8
 8001caa:	d101      	bne.n	8001cb0 <led_off+0x8>
 8001cac:	4b07      	ldr	r3, [pc, #28]	; (8001ccc <led_off+0x24>)
 8001cae:	e00b      	b.n	8001cc8 <led_off+0x20>
 8001cb0:	2380      	movs	r3, #128	; 0x80
 8001cb2:	005b      	lsls	r3, r3, #1
 8001cb4:	4298      	cmp	r0, r3
 8001cb6:	d005      	beq.n	8001cc4 <led_off+0x1c>
 8001cb8:	2380      	movs	r3, #128	; 0x80
 8001cba:	011b      	lsls	r3, r3, #4
 8001cbc:	4298      	cmp	r0, r3
 8001cbe:	d001      	beq.n	8001cc4 <led_off+0x1c>
 8001cc0:	2802      	cmp	r0, #2
 8001cc2:	d102      	bne.n	8001cca <led_off+0x22>
 8001cc4:	2390      	movs	r3, #144	; 0x90
 8001cc6:	05db      	lsls	r3, r3, #23
 8001cc8:	8518      	strh	r0, [r3, #40]	; 0x28
 8001cca:	4770      	bx	lr
 8001ccc:	48000400 	.word	0x48000400

08001cd0 <Default_Handler>:
 8001cd0:	46c0      	nop			; (mov r8, r8)
 8001cd2:	e7fd      	b.n	8001cd0 <Default_Handler>

08001cd4 <HardFault_Handler>:
 8001cd4:	2008      	movs	r0, #8
 8001cd6:	f7ff ffd3 	bl	8001c80 <led_on>
 8001cda:	4b07      	ldr	r3, [pc, #28]	; (8001cf8 <HardFault_Handler+0x24>)
 8001cdc:	3b01      	subs	r3, #1
 8001cde:	2b00      	cmp	r3, #0
 8001ce0:	d001      	beq.n	8001ce6 <HardFault_Handler+0x12>
 8001ce2:	46c0      	nop			; (mov r8, r8)
 8001ce4:	e7fa      	b.n	8001cdc <HardFault_Handler+0x8>
 8001ce6:	2008      	movs	r0, #8
 8001ce8:	f7ff ffde 	bl	8001ca8 <led_off>
 8001cec:	4b02      	ldr	r3, [pc, #8]	; (8001cf8 <HardFault_Handler+0x24>)
 8001cee:	3b01      	subs	r3, #1
 8001cf0:	2b00      	cmp	r3, #0
 8001cf2:	d0ef      	beq.n	8001cd4 <HardFault_Handler>
 8001cf4:	46c0      	nop			; (mov r8, r8)
 8001cf6:	e7fa      	b.n	8001cee <HardFault_Handler+0x1a>
 8001cf8:	002dc6c1 	.word	0x002dc6c1

08001cfc <_reset_init>:
 8001cfc:	4a07      	ldr	r2, [pc, #28]	; (8001d1c <_reset_init+0x20>)
 8001cfe:	4908      	ldr	r1, [pc, #32]	; (8001d20 <_reset_init+0x24>)
 8001d00:	2300      	movs	r3, #0
 8001d02:	1a89      	subs	r1, r1, r2
 8001d04:	1089      	asrs	r1, r1, #2
 8001d06:	1c10      	adds	r0, r2, #0
 8001d08:	428b      	cmp	r3, r1
 8001d0a:	d005      	beq.n	8001d18 <_reset_init+0x1c>
 8001d0c:	4c05      	ldr	r4, [pc, #20]	; (8001d24 <_reset_init+0x28>)
 8001d0e:	009a      	lsls	r2, r3, #2
 8001d10:	58a4      	ldr	r4, [r4, r2]
 8001d12:	3301      	adds	r3, #1
 8001d14:	5084      	str	r4, [r0, r2]
 8001d16:	e7f7      	b.n	8001d08 <_reset_init+0xc>
 8001d18:	f7ff f828 	bl	8000d6c <main>
 8001d1c:	20000000 	.word	0x20000000
 8001d20:	20000010 	.word	0x20000010
 8001d24:	08002568 	.word	0x08002568

08001d28 <__gnu_thumb1_case_uqi>:
 8001d28:	b402      	push	{r1}
 8001d2a:	4671      	mov	r1, lr
 8001d2c:	0849      	lsrs	r1, r1, #1
 8001d2e:	0049      	lsls	r1, r1, #1
 8001d30:	5c09      	ldrb	r1, [r1, r0]
 8001d32:	0049      	lsls	r1, r1, #1
 8001d34:	448e      	add	lr, r1
 8001d36:	bc02      	pop	{r1}
 8001d38:	4770      	bx	lr
 8001d3a:	46c0      	nop			; (mov r8, r8)

08001d3c <__aeabi_uidiv>:
 8001d3c:	2900      	cmp	r1, #0
 8001d3e:	d034      	beq.n	8001daa <.udivsi3_skip_div0_test+0x6a>

08001d40 <.udivsi3_skip_div0_test>:
 8001d40:	2301      	movs	r3, #1
 8001d42:	2200      	movs	r2, #0
 8001d44:	b410      	push	{r4}
 8001d46:	4288      	cmp	r0, r1
 8001d48:	d32c      	bcc.n	8001da4 <.udivsi3_skip_div0_test+0x64>
 8001d4a:	2401      	movs	r4, #1
 8001d4c:	0724      	lsls	r4, r4, #28
 8001d4e:	42a1      	cmp	r1, r4
 8001d50:	d204      	bcs.n	8001d5c <.udivsi3_skip_div0_test+0x1c>
 8001d52:	4281      	cmp	r1, r0
 8001d54:	d202      	bcs.n	8001d5c <.udivsi3_skip_div0_test+0x1c>
 8001d56:	0109      	lsls	r1, r1, #4
 8001d58:	011b      	lsls	r3, r3, #4
 8001d5a:	e7f8      	b.n	8001d4e <.udivsi3_skip_div0_test+0xe>
 8001d5c:	00e4      	lsls	r4, r4, #3
 8001d5e:	42a1      	cmp	r1, r4
 8001d60:	d204      	bcs.n	8001d6c <.udivsi3_skip_div0_test+0x2c>
 8001d62:	4281      	cmp	r1, r0
 8001d64:	d202      	bcs.n	8001d6c <.udivsi3_skip_div0_test+0x2c>
 8001d66:	0049      	lsls	r1, r1, #1
 8001d68:	005b      	lsls	r3, r3, #1
 8001d6a:	e7f8      	b.n	8001d5e <.udivsi3_skip_div0_test+0x1e>
 8001d6c:	4288      	cmp	r0, r1
 8001d6e:	d301      	bcc.n	8001d74 <.udivsi3_skip_div0_test+0x34>
 8001d70:	1a40      	subs	r0, r0, r1
 8001d72:	431a      	orrs	r2, r3
 8001d74:	084c      	lsrs	r4, r1, #1
 8001d76:	42a0      	cmp	r0, r4
 8001d78:	d302      	bcc.n	8001d80 <.udivsi3_skip_div0_test+0x40>
 8001d7a:	1b00      	subs	r0, r0, r4
 8001d7c:	085c      	lsrs	r4, r3, #1
 8001d7e:	4322      	orrs	r2, r4
 8001d80:	088c      	lsrs	r4, r1, #2
 8001d82:	42a0      	cmp	r0, r4
 8001d84:	d302      	bcc.n	8001d8c <.udivsi3_skip_div0_test+0x4c>
 8001d86:	1b00      	subs	r0, r0, r4
 8001d88:	089c      	lsrs	r4, r3, #2
 8001d8a:	4322      	orrs	r2, r4
 8001d8c:	08cc      	lsrs	r4, r1, #3
 8001d8e:	42a0      	cmp	r0, r4
 8001d90:	d302      	bcc.n	8001d98 <.udivsi3_skip_div0_test+0x58>
 8001d92:	1b00      	subs	r0, r0, r4
 8001d94:	08dc      	lsrs	r4, r3, #3
 8001d96:	4322      	orrs	r2, r4
 8001d98:	2800      	cmp	r0, #0
 8001d9a:	d003      	beq.n	8001da4 <.udivsi3_skip_div0_test+0x64>
 8001d9c:	091b      	lsrs	r3, r3, #4
 8001d9e:	d001      	beq.n	8001da4 <.udivsi3_skip_div0_test+0x64>
 8001da0:	0909      	lsrs	r1, r1, #4
 8001da2:	e7e3      	b.n	8001d6c <.udivsi3_skip_div0_test+0x2c>
 8001da4:	1c10      	adds	r0, r2, #0
 8001da6:	bc10      	pop	{r4}
 8001da8:	4770      	bx	lr
 8001daa:	2800      	cmp	r0, #0
 8001dac:	d001      	beq.n	8001db2 <.udivsi3_skip_div0_test+0x72>
 8001dae:	2000      	movs	r0, #0
 8001db0:	43c0      	mvns	r0, r0
 8001db2:	b407      	push	{r0, r1, r2}
 8001db4:	4802      	ldr	r0, [pc, #8]	; (8001dc0 <.udivsi3_skip_div0_test+0x80>)
 8001db6:	a102      	add	r1, pc, #8	; (adr r1, 8001dc0 <.udivsi3_skip_div0_test+0x80>)
 8001db8:	1840      	adds	r0, r0, r1
 8001dba:	9002      	str	r0, [sp, #8]
 8001dbc:	bd03      	pop	{r0, r1, pc}
 8001dbe:	46c0      	nop			; (mov r8, r8)
 8001dc0:	000000d9 	.word	0x000000d9

08001dc4 <__aeabi_uidivmod>:
 8001dc4:	2900      	cmp	r1, #0
 8001dc6:	d0f0      	beq.n	8001daa <.udivsi3_skip_div0_test+0x6a>
 8001dc8:	b503      	push	{r0, r1, lr}
 8001dca:	f7ff ffb9 	bl	8001d40 <.udivsi3_skip_div0_test>
 8001dce:	bc0e      	pop	{r1, r2, r3}
 8001dd0:	4342      	muls	r2, r0
 8001dd2:	1a89      	subs	r1, r1, r2
 8001dd4:	4718      	bx	r3
 8001dd6:	46c0      	nop			; (mov r8, r8)

08001dd8 <__aeabi_idiv>:
 8001dd8:	2900      	cmp	r1, #0
 8001dda:	d041      	beq.n	8001e60 <.divsi3_skip_div0_test+0x84>

08001ddc <.divsi3_skip_div0_test>:
 8001ddc:	b410      	push	{r4}
 8001dde:	1c04      	adds	r4, r0, #0
 8001de0:	404c      	eors	r4, r1
 8001de2:	46a4      	mov	ip, r4
 8001de4:	2301      	movs	r3, #1
 8001de6:	2200      	movs	r2, #0
 8001de8:	2900      	cmp	r1, #0
 8001dea:	d500      	bpl.n	8001dee <.divsi3_skip_div0_test+0x12>
 8001dec:	4249      	negs	r1, r1
 8001dee:	2800      	cmp	r0, #0
 8001df0:	d500      	bpl.n	8001df4 <.divsi3_skip_div0_test+0x18>
 8001df2:	4240      	negs	r0, r0
 8001df4:	4288      	cmp	r0, r1
 8001df6:	d32c      	bcc.n	8001e52 <.divsi3_skip_div0_test+0x76>
 8001df8:	2401      	movs	r4, #1
 8001dfa:	0724      	lsls	r4, r4, #28
 8001dfc:	42a1      	cmp	r1, r4
 8001dfe:	d204      	bcs.n	8001e0a <.divsi3_skip_div0_test+0x2e>
 8001e00:	4281      	cmp	r1, r0
 8001e02:	d202      	bcs.n	8001e0a <.divsi3_skip_div0_test+0x2e>
 8001e04:	0109      	lsls	r1, r1, #4
 8001e06:	011b      	lsls	r3, r3, #4
 8001e08:	e7f8      	b.n	8001dfc <.divsi3_skip_div0_test+0x20>
 8001e0a:	00e4      	lsls	r4, r4, #3
 8001e0c:	42a1      	cmp	r1, r4
 8001e0e:	d204      	bcs.n	8001e1a <.divsi3_skip_div0_test+0x3e>
 8001e10:	4281      	cmp	r1, r0
 8001e12:	d202      	bcs.n	8001e1a <.divsi3_skip_div0_test+0x3e>
 8001e14:	0049      	lsls	r1, r1, #1
 8001e16:	005b      	lsls	r3, r3, #1
 8001e18:	e7f8      	b.n	8001e0c <.divsi3_skip_div0_test+0x30>
 8001e1a:	4288      	cmp	r0, r1
 8001e1c:	d301      	bcc.n	8001e22 <.divsi3_skip_div0_test+0x46>
 8001e1e:	1a40      	subs	r0, r0, r1
 8001e20:	431a      	orrs	r2, r3
 8001e22:	084c      	lsrs	r4, r1, #1
 8001e24:	42a0      	cmp	r0, r4
 8001e26:	d302      	bcc.n	8001e2e <.divsi3_skip_div0_test+0x52>
 8001e28:	1b00      	subs	r0, r0, r4
 8001e2a:	085c      	lsrs	r4, r3, #1
 8001e2c:	4322      	orrs	r2, r4
 8001e2e:	088c      	lsrs	r4, r1, #2
 8001e30:	42a0      	cmp	r0, r4
 8001e32:	d302      	bcc.n	8001e3a <.divsi3_skip_div0_test+0x5e>
 8001e34:	1b00      	subs	r0, r0, r4
 8001e36:	089c      	lsrs	r4, r3, #2
 8001e38:	4322      	orrs	r2, r4
 8001e3a:	08cc      	lsrs	r4, r1, #3
 8001e3c:	42a0      	cmp	r0, r4
 8001e3e:	d302      	bcc.n	8001e46 <.divsi3_skip_div0_test+0x6a>
 8001e40:	1b00      	subs	r0, r0, r4
 8001e42:	08dc      	lsrs	r4, r3, #3
 8001e44:	4322      	orrs	r2, r4
 8001e46:	2800      	cmp	r0, #0
 8001e48:	d003      	beq.n	8001e52 <.divsi3_skip_div0_test+0x76>
 8001e4a:	091b      	lsrs	r3, r3, #4
 8001e4c:	d001      	beq.n	8001e52 <.divsi3_skip_div0_test+0x76>
 8001e4e:	0909      	lsrs	r1, r1, #4
 8001e50:	e7e3      	b.n	8001e1a <.divsi3_skip_div0_test+0x3e>
 8001e52:	1c10      	adds	r0, r2, #0
 8001e54:	4664      	mov	r4, ip
 8001e56:	2c00      	cmp	r4, #0
 8001e58:	d500      	bpl.n	8001e5c <.divsi3_skip_div0_test+0x80>
 8001e5a:	4240      	negs	r0, r0
 8001e5c:	bc10      	pop	{r4}
 8001e5e:	4770      	bx	lr
 8001e60:	2800      	cmp	r0, #0
 8001e62:	d006      	beq.n	8001e72 <.divsi3_skip_div0_test+0x96>
 8001e64:	db03      	blt.n	8001e6e <.divsi3_skip_div0_test+0x92>
 8001e66:	2000      	movs	r0, #0
 8001e68:	43c0      	mvns	r0, r0
 8001e6a:	0840      	lsrs	r0, r0, #1
 8001e6c:	e001      	b.n	8001e72 <.divsi3_skip_div0_test+0x96>
 8001e6e:	2080      	movs	r0, #128	; 0x80
 8001e70:	0600      	lsls	r0, r0, #24
 8001e72:	b407      	push	{r0, r1, r2}
 8001e74:	4802      	ldr	r0, [pc, #8]	; (8001e80 <.divsi3_skip_div0_test+0xa4>)
 8001e76:	a102      	add	r1, pc, #8	; (adr r1, 8001e80 <.divsi3_skip_div0_test+0xa4>)
 8001e78:	1840      	adds	r0, r0, r1
 8001e7a:	9002      	str	r0, [sp, #8]
 8001e7c:	bd03      	pop	{r0, r1, pc}
 8001e7e:	46c0      	nop			; (mov r8, r8)
 8001e80:	00000019 	.word	0x00000019

08001e84 <__aeabi_idivmod>:
 8001e84:	2900      	cmp	r1, #0
 8001e86:	d0eb      	beq.n	8001e60 <.divsi3_skip_div0_test+0x84>
 8001e88:	b503      	push	{r0, r1, lr}
 8001e8a:	f7ff ffa7 	bl	8001ddc <.divsi3_skip_div0_test>
 8001e8e:	bc0e      	pop	{r1, r2, r3}
 8001e90:	4342      	muls	r2, r0
 8001e92:	1a89      	subs	r1, r1, r2
 8001e94:	4718      	bx	r3
 8001e96:	46c0      	nop			; (mov r8, r8)

08001e98 <__aeabi_idiv0>:
 8001e98:	4770      	bx	lr
 8001e9a:	46c0      	nop			; (mov r8, r8)

08001e9c <_init>:
 8001e9c:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
 8001e9e:	46c0      	nop			; (mov r8, r8)
 8001ea0:	bcf8      	pop	{r3, r4, r5, r6, r7}
 8001ea2:	bc08      	pop	{r3}
 8001ea4:	469e      	mov	lr, r3
 8001ea6:	4770      	bx	lr

08001ea8 <_fini>:
 8001ea8:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
 8001eaa:	46c0      	nop			; (mov r8, r8)
 8001eac:	bcf8      	pop	{r3, r4, r5, r6, r7}
 8001eae:	bc08      	pop	{r3}
 8001eb0:	469e      	mov	lr, r3
 8001eb2:	4770      	bx	lr
 8001eb4:	69647473 	.word	0x69647473
 8001eb8:	6e69206f 	.word	0x6e69206f
 8001ebc:	64207469 	.word	0x64207469
 8001ec0:	0a656e6f 	.word	0x0a656e6f
	...

08001ec5 <font_data>:
	...
 8001ed5:	3c180000 18183c3c 18180018 00000000     ...<<<..........
 8001ee5:	63636300 00000022 00000000 00000000     .ccc"...........
 8001ef5:	36000000 36367f36 36367f36 00000000     ...66.666.66....
 8001f05:	633e0c0c 033e6061 3e634303 00000c0c     ..>ca`>..Cc>....
 8001f15:	00000000 06636100 6333180c 00000000     .....ac...3c....
 8001f25:	1c000000 3b1c3636 3b66666e 00000000     ....66.;nff;....
 8001f35:	30303000 00000060 00000000 00000000     .000`...........
 8001f45:	180c0000 30303018 0c181830 00000000     .....0000.......
 8001f55:	0c180000 0606060c 180c0c06 00000000     ................
 8001f65:	00000000 ff3c6642 0042663c 00000000     ....Bf<.<fB.....
 8001f75:	00000000 ff181818 00181818 00000000     ................
	...
 8001f8d:	18180000 00003018 00000000 ff000000     .....0..........
	...
 8001fad:	18180000 00000000 03010000 381c0e07     ...............8
 8001fbd:	80c0e070 00000000 633e0000 6b6b6363     p.........>ccckk
 8001fcd:	3e636363 00000000 1c0c0000 0c0c0c3c     ccc>........<...
 8001fdd:	3f0c0c0c 00000000 633e0000 180c0603     ...?......>c....
 8001fed:	7f636130 00000000 633e0000 031e0303     0ac.......>c....
 8001ffd:	3e630303 00000000 0e060000 6666361e     ..c>.........6ff
 800200d:	0f06067f 00000000 607f0000 037e6060     ...........```~.
 800201d:	3e736303 00000000 301c0000 637e6060     .cs>.......0``~c
 800202d:	3e636363 00000000 637f0000 0c060603     ccc>.......c....
 800203d:	1818180c 00000000 633e0000 633e6363     ..........>ccc>c
 800204d:	3e636363 00000000 633e0000 3f636363     ccc>......>cccc?
 800205d:	3c060303 00000000 00000000 00181800     ...<............
 800206d:	18180000 00000000 00000000 00181800     ................
 800207d:	18180000 00003018 06000000 6030180c     .....0........0`
 800208d:	060c1830 00000000 00000000 007e0000     0.............~.
 800209d:	00007e00 00000000 60000000 060c1830     .~.........`0...
 80020ad:	6030180c 00000000 633e0000 0c0c0663     ..0`......>cc...
 80020bd:	0c0c000c 00000000 633e0000 6b6b6f63     ..........>ccokk
 80020cd:	3e60606e 00000000 1c080000 63636336     n``>........6ccc
 80020dd:	6363637f 00000000 337e0000 333e3333     .ccc......~333>3
 80020ed:	7e333333 00000000 331e0000 60606061     333~.......3a```
 80020fd:	1e336160 00000000 367c0000 33333333     `a3.......|63333
 800210d:	7c363333 00000000 337f0000 343c3431     336|.......314<4
 800211d:	7f333130 00000000 337f0000 343c3431     013........314<4
 800212d:	78303030 00000000 331e0000 6f606061     000x.......3a``o
 800213d:	1d376363 00000000 63630000 637f6363     cc7.......cccc.c
 800214d:	63636363 00000000 183c0000 18181818     cccc......<.....
 800215d:	3c181818 00000000 060f0000 06060606     ...<............
 800216d:	3c666606 00000000 33730000 363c3636     .ff<......s366<6
 800217d:	73333336 00000000 30780000 30303030     633s......x00000
 800218d:	7f333130 00000000 77630000 63636b7f     013.......cw.kcc
 800219d:	63636363 00000000 63630000 6f7f7b73     cccc......ccs{.o
 80021ad:	63636367 00000000 361c0000 63636363     gccc.......6cccc
 80021bd:	1c366363 00000000 337e0000 303e3333     cc6.......~333>0
 80021cd:	78303030 00000000 633e0000 63636363     000x......>ccccc
 80021dd:	3e6f6b63 00000706 337e0000 363e3333     cko>......~333>6
 80021ed:	73333336 00000000 633e0000 061c3063     633s......>cc0..
 80021fd:	3e636303 00000000 dbff0000 18181899     .cc>............
 800220d:	3c181818 00000000 63630000 63636363     ...<......cccccc
 800221d:	3e636363 00000000 63630000 63636363     ccc>......cccccc
 800222d:	081c3663 00000000 63630000 6b636363     c6........ccccck
 800223d:	36367f6b 00000000 c3c30000 18183c66     k.66........f<..
 800224d:	c3c3663c 00000000 c3c30000 183c66c3     <f...........f<.
 800225d:	3c181818 00000000 637f0000 180c0643     ...<.......cC...
 800226d:	7f636130 00000000 303c0000 30303030     0ac.......<00000
 800227d:	3c303030 00000000 c0800000 1c3870e0     000<.........p8.
 800228d:	0103070e 00000000 0c3c0000 0c0c0c0c     ..........<.....
 800229d:	3c0c0c0c 00000000 63361c08 00000000     ...<......6c....
	...
 80022c1:	000000ff 000c1818 00000000 00000000     ................
	...
 80022d9:	06463c00 3b66663e 00000000 30700000     .<F.>ff;......p0
 80022e9:	33363c30 6e333333 00000000 00000000     0<63333n........
 80022f9:	60633e00 3e636060 00000000 060e0000     .>c```c>........
 8002309:	66361e06 3b666666 00000000 00000000     ..6ffff;........
 8002319:	63633e00 3e63607e 00000000 361c0000     .>cc~`c>.......6
 8002329:	307c3032 78303030 00000000 00000000     20|0000x........
 8002339:	66663b00 063e6666 00003c66 30700000     .;ffff>.f<....p0
 8002349:	333b3630 73333333 00000000 0c0c0000     06;3333s........
 8002359:	0c0c1c00 1e0c0c0c 00000000 06060000     ................
 8002369:	06060e00 66060606 00003c66 30700000     .......ff<....p0
 8002379:	36333330 7333363c 00000000 0c1c0000     0336<63s........
 8002389:	0c0c0c0c 1e0c0c0c 00000000 00000000     ................
 8002399:	6b7f6e00 6b6b6b6b 00000000 00000000     .n.kkkkk........
 80023a9:	33336e00 33333333 00000000 00000000     .n333333........
 80023b9:	63633e00 3e636363 00000000 00000000     .>ccccc>........
 80023c9:	33336e00 303e3333 00007830 00000000     .n3333>00x......
 80023d9:	66663b00 063e6666 00000f06 00000000     .;ffff>.........
 80023e9:	333b6e00 78303030 00000000 00000000     .n;3000x........
 80023f9:	38633e00 3e63030e 00000000 18080000     .>c8..c>........
 8002409:	18187e18 0e1b1818 00000000 00000000     .~..............
 8002419:	66666600 3b666666 00000000 00000000     .ffffff;........
 8002429:	36636300 081c1c36 00000000 00000000     .cc66...........
 8002439:	63636300 367f6b6b 00000000 00000000     .ccckk.6........
 8002449:	1c366300 63361c1c 00000000 00000000     .c6...6c........
 8002459:	63636300 033f6363 00003c06 00000000     .ccccc?..<......
 8002469:	0c667f00 7f633018 00000000 180e0000     ..f..0c.........
 8002479:	18701818 0e181818 00000000 18180000     ..p.............
 8002489:	00181818 18181818 00000018 18700000     ..............p.
 8002499:	180e1818 70181818 00000000 6e3b0000     .......p......;n
	...
 80024b5:	d8d87000 00000070 00000000 00000000     .p..p...........
 80024c5:	3a207525 5b000a20 25206925 69252069     %u : ..[%i %i %i
 80024d5:	0a00205d 636c6577 20656d6f 53206f74     ] ..welcome to S
 80024e5:	68757a75 20534f61 205e5f5e 2e322e32     uzuhaOS ^_^ 2.2.
 80024f5:	55420a30 20444c49 2072614d 32203332     0.BUILD Mar 23 2
 8002505:	20363130 353a3831 33303a30 6f62000a     016 18:50:03..bo
 8002515:	6e69746f 72662067 25206d6f 72000a75     oting from %u..r
 8002525:	73206d61 74726174 20752520 6172000a     am start %u ..ra
 8002535:	6973206d 2520657a 000a2075 206d6172     m size %u ..ram 
 8002545:	65657266 20752520 6568000a 73207061     free %u ..heap s
 8002555:	74726174 20752520 0a0a000a 00000000              tart %u .......

08002564 <__EH_FRAME_BEGIN__>:
 8002564:	00000000                                ....
