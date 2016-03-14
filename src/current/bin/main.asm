
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
 80000d8:	20000060 	.word	0x20000060
 80000dc:	20000000 	.word	0x20000000

080000e0 <null_thread>:
 80000e0:	b508      	push	{r3, lr}
 80000e2:	f000 ff93 	bl	800100c <sleep>
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
 8000148:	20000000 	.word	0x20000000
 800014c:	20000060 	.word	0x20000060

08000150 <SysTick_Handler>:
 8000150:	b4f0      	push	{r4, r5, r6, r7}
 8000152:	4644      	mov	r4, r8
 8000154:	464d      	mov	r5, r9
 8000156:	4656      	mov	r6, sl
 8000158:	465f      	mov	r7, fp
 800015a:	b4f0      	push	{r4, r5, r6, r7}
 800015c:	f000 ff3b 	bl	8000fd6 <__get_MSP>
 8000160:	4c11      	ldr	r4, [pc, #68]	; (80001a8 <SysTick_Handler+0x58>)
 8000162:	4d12      	ldr	r5, [pc, #72]	; (80001ac <SysTick_Handler+0x5c>)
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
 800017a:	2008      	movs	r0, #8
 800017c:	f001 f87a 	bl	8001274 <led_on>
 8000180:	f7ff ffb2 	bl	80000e8 <scheduler>
 8000184:	6823      	ldr	r3, [r4, #0]
 8000186:	220c      	movs	r2, #12
 8000188:	4353      	muls	r3, r2
 800018a:	18ed      	adds	r5, r5, r3
 800018c:	2307      	movs	r3, #7
 800018e:	68aa      	ldr	r2, [r5, #8]
 8000190:	425b      	negs	r3, r3
 8000192:	469e      	mov	lr, r3
 8000194:	f382 8808 	msr	MSP, r2
 8000198:	bcf0      	pop	{r4, r5, r6, r7}
 800019a:	46a0      	mov	r8, r4
 800019c:	46a9      	mov	r9, r5
 800019e:	46b2      	mov	sl, r6
 80001a0:	46bb      	mov	fp, r7
 80001a2:	bcf0      	pop	{r4, r5, r6, r7}
 80001a4:	4770      	bx	lr
 80001a6:	46c0      	nop			; (mov r8, r8)
 80001a8:	20000060 	.word	0x20000060
 80001ac:	20000000 	.word	0x20000000

080001b0 <sched_off>:
 80001b0:	b672      	cpsid	i
 80001b2:	4770      	bx	lr

080001b4 <sched_on>:
 80001b4:	b662      	cpsie	i
 80001b6:	4770      	bx	lr

080001b8 <yield>:
 80001b8:	46c0      	nop			; (mov r8, r8)
 80001ba:	4770      	bx	lr

080001bc <get_thread_id>:
 80001bc:	b082      	sub	sp, #8
 80001be:	b672      	cpsid	i
 80001c0:	4b03      	ldr	r3, [pc, #12]	; (80001d0 <get_thread_id+0x14>)
 80001c2:	681b      	ldr	r3, [r3, #0]
 80001c4:	9301      	str	r3, [sp, #4]
 80001c6:	b662      	cpsie	i
 80001c8:	9801      	ldr	r0, [sp, #4]
 80001ca:	b002      	add	sp, #8
 80001cc:	4770      	bx	lr
 80001ce:	46c0      	nop			; (mov r8, r8)
 80001d0:	20000060 	.word	0x20000060

080001d4 <kernel_start>:
 80001d4:	b508      	push	{r3, lr}
 80001d6:	f000 ff03 	bl	8000fe0 <sys_tick_init>
 80001da:	46c0      	nop			; (mov r8, r8)
 80001dc:	e7fd      	b.n	80001da <kernel_start+0x6>
	...

080001e0 <create_thread>:
 80001e0:	b5f0      	push	{r4, r5, r6, r7, lr}
 80001e2:	b085      	sub	sp, #20
 80001e4:	9003      	str	r0, [sp, #12]
 80001e6:	481b      	ldr	r0, [pc, #108]	; (8000254 <create_thread+0x74>)
 80001e8:	0892      	lsrs	r2, r2, #2
 80001ea:	1812      	adds	r2, r2, r0
 80001ec:	0092      	lsls	r2, r2, #2
 80001ee:	1888      	adds	r0, r1, r2
 80001f0:	1c17      	adds	r7, r2, #0
 80001f2:	9002      	str	r0, [sp, #8]
 80001f4:	1c10      	adds	r0, r2, #0
 80001f6:	323c      	adds	r2, #60	; 0x3c
 80001f8:	188a      	adds	r2, r1, r2
 80001fa:	3034      	adds	r0, #52	; 0x34
 80001fc:	3738      	adds	r7, #56	; 0x38
 80001fe:	9201      	str	r2, [sp, #4]
 8000200:	180e      	adds	r6, r1, r0
 8000202:	19cf      	adds	r7, r1, r7
 8000204:	2200      	movs	r2, #0
 8000206:	b672      	cpsid	i
 8000208:	250c      	movs	r5, #12
 800020a:	4355      	muls	r5, r2
 800020c:	4c12      	ldr	r4, [pc, #72]	; (8000258 <create_thread+0x78>)
 800020e:	2008      	movs	r0, #8
 8000210:	1965      	adds	r5, r4, r5
 8000212:	6869      	ldr	r1, [r5, #4]
 8000214:	07c9      	lsls	r1, r1, #31
 8000216:	d415      	bmi.n	8000244 <create_thread+0x64>
 8000218:	9902      	ldr	r1, [sp, #8]
 800021a:	60a9      	str	r1, [r5, #8]
 800021c:	4d0f      	ldr	r5, [pc, #60]	; (800025c <create_thread+0x7c>)
 800021e:	9903      	ldr	r1, [sp, #12]
 8000220:	6035      	str	r5, [r6, #0]
 8000222:	6039      	str	r1, [r7, #0]
 8000224:	2584      	movs	r5, #132	; 0x84
 8000226:	9901      	ldr	r1, [sp, #4]
 8000228:	05ad      	lsls	r5, r5, #22
 800022a:	600d      	str	r5, [r1, #0]
 800022c:	2b07      	cmp	r3, #7
 800022e:	d800      	bhi.n	8000232 <create_thread+0x52>
 8000230:	1c03      	adds	r3, r0, #0
 8000232:	200c      	movs	r0, #12
 8000234:	4350      	muls	r0, r2
 8000236:	4908      	ldr	r1, [pc, #32]	; (8000258 <create_thread+0x78>)
 8000238:	180d      	adds	r5, r1, r0
 800023a:	806b      	strh	r3, [r5, #2]
 800023c:	5223      	strh	r3, [r4, r0]
 800023e:	2001      	movs	r0, #1
 8000240:	6068      	str	r0, [r5, #4]
 8000242:	1c10      	adds	r0, r2, #0
 8000244:	b662      	cpsie	i
 8000246:	3201      	adds	r2, #1
 8000248:	2a08      	cmp	r2, #8
 800024a:	d001      	beq.n	8000250 <create_thread+0x70>
 800024c:	2808      	cmp	r0, #8
 800024e:	d0da      	beq.n	8000206 <create_thread+0x26>
 8000250:	b005      	add	sp, #20
 8000252:	bdf0      	pop	{r4, r5, r6, r7, pc}
 8000254:	3ffffff0 	.word	0x3ffffff0
 8000258:	20000000 	.word	0x20000000
 800025c:	080000c1 	.word	0x080000c1

08000260 <kernel_init>:
 8000260:	b510      	push	{r4, lr}
 8000262:	2300      	movs	r3, #0
 8000264:	210c      	movs	r1, #12
 8000266:	4359      	muls	r1, r3
 8000268:	4a0a      	ldr	r2, [pc, #40]	; (8000294 <kernel_init+0x34>)
 800026a:	2000      	movs	r0, #0
 800026c:	1854      	adds	r4, r2, r1
 800026e:	6060      	str	r0, [r4, #4]
 8000270:	3301      	adds	r3, #1
 8000272:	2008      	movs	r0, #8
 8000274:	8060      	strh	r0, [r4, #2]
 8000276:	5288      	strh	r0, [r1, r2]
 8000278:	4283      	cmp	r3, r0
 800027a:	d1f3      	bne.n	8000264 <kernel_init+0x4>
 800027c:	4b06      	ldr	r3, [pc, #24]	; (8000298 <kernel_init+0x38>)
 800027e:	2201      	movs	r2, #1
 8000280:	4252      	negs	r2, r2
 8000282:	601a      	str	r2, [r3, #0]
 8000284:	4905      	ldr	r1, [pc, #20]	; (800029c <kernel_init+0x3c>)
 8000286:	2280      	movs	r2, #128	; 0x80
 8000288:	23ff      	movs	r3, #255	; 0xff
 800028a:	4805      	ldr	r0, [pc, #20]	; (80002a0 <kernel_init+0x40>)
 800028c:	f7ff ffa8 	bl	80001e0 <create_thread>
 8000290:	bd10      	pop	{r4, pc}
 8000292:	46c0      	nop			; (mov r8, r8)
 8000294:	20000000 	.word	0x20000000
 8000298:	20000060 	.word	0x20000060
 800029c:	20000064 	.word	0x20000064
 80002a0:	080000e1 	.word	0x080000e1

080002a4 <set_wait_state>:
 80002a4:	b507      	push	{r0, r1, r2, lr}
 80002a6:	f7ff ff89 	bl	80001bc <get_thread_id>
 80002aa:	9000      	str	r0, [sp, #0]
 80002ac:	b672      	cpsid	i
 80002ae:	9a00      	ldr	r2, [sp, #0]
 80002b0:	210c      	movs	r1, #12
 80002b2:	434a      	muls	r2, r1
 80002b4:	4b0b      	ldr	r3, [pc, #44]	; (80002e4 <set_wait_state+0x40>)
 80002b6:	2002      	movs	r0, #2
 80002b8:	189a      	adds	r2, r3, r2
 80002ba:	6851      	ldr	r1, [r2, #4]
 80002bc:	4301      	orrs	r1, r0
 80002be:	6051      	str	r1, [r2, #4]
 80002c0:	1c19      	adds	r1, r3, #0
 80002c2:	b672      	cpsid	i
 80002c4:	9b00      	ldr	r3, [sp, #0]
 80002c6:	220c      	movs	r2, #12
 80002c8:	4353      	muls	r3, r2
 80002ca:	18cb      	adds	r3, r1, r3
 80002cc:	685b      	ldr	r3, [r3, #4]
 80002ce:	9301      	str	r3, [sp, #4]
 80002d0:	b662      	cpsie	i
 80002d2:	9a01      	ldr	r2, [sp, #4]
 80002d4:	2302      	movs	r3, #2
 80002d6:	421a      	tst	r2, r3
 80002d8:	d000      	beq.n	80002dc <set_wait_state+0x38>
 80002da:	46c0      	nop			; (mov r8, r8)
 80002dc:	9a01      	ldr	r2, [sp, #4]
 80002de:	421a      	tst	r2, r3
 80002e0:	d1ef      	bne.n	80002c2 <set_wait_state+0x1e>
 80002e2:	bd07      	pop	{r0, r1, r2, pc}
 80002e4:	20000000 	.word	0x20000000

080002e8 <wake_up_threads>:
 80002e8:	2300      	movs	r3, #0
 80002ea:	b672      	cpsid	i
 80002ec:	220c      	movs	r2, #12
 80002ee:	435a      	muls	r2, r3
 80002f0:	4905      	ldr	r1, [pc, #20]	; (8000308 <wake_up_threads+0x20>)
 80002f2:	2002      	movs	r0, #2
 80002f4:	188a      	adds	r2, r1, r2
 80002f6:	6851      	ldr	r1, [r2, #4]
 80002f8:	4381      	bics	r1, r0
 80002fa:	6051      	str	r1, [r2, #4]
 80002fc:	b662      	cpsie	i
 80002fe:	3301      	adds	r3, #1
 8000300:	2b08      	cmp	r3, #8
 8000302:	d1f2      	bne.n	80002ea <wake_up_threads+0x2>
 8000304:	4770      	bx	lr
 8000306:	46c0      	nop			; (mov r8, r8)
 8000308:	20000000 	.word	0x20000000

0800030c <messages_init>:
 800030c:	b510      	push	{r4, lr}
 800030e:	2200      	movs	r2, #0
 8000310:	4909      	ldr	r1, [pc, #36]	; (8000338 <messages_init+0x2c>)
 8000312:	0090      	lsls	r0, r2, #2
 8000314:	2300      	movs	r3, #0
 8000316:	3201      	adds	r2, #1
 8000318:	5043      	str	r3, [r0, r1]
 800031a:	2a08      	cmp	r2, #8
 800031c:	d1f8      	bne.n	8000310 <messages_init+0x4>
 800031e:	4807      	ldr	r0, [pc, #28]	; (800033c <messages_init+0x30>)
 8000320:	011c      	lsls	r4, r3, #4
 8000322:	2200      	movs	r2, #0
 8000324:	1901      	adds	r1, r0, r4
 8000326:	3301      	adds	r3, #1
 8000328:	604a      	str	r2, [r1, #4]
 800032a:	5022      	str	r2, [r4, r0]
 800032c:	60ca      	str	r2, [r1, #12]
 800032e:	608a      	str	r2, [r1, #8]
 8000330:	2b04      	cmp	r3, #4
 8000332:	d1f4      	bne.n	800031e <messages_init+0x12>
 8000334:	bd10      	pop	{r4, pc}
 8000336:	46c0      	nop			; (mov r8, r8)
 8000338:	200000e4 	.word	0x200000e4
 800033c:	20000104 	.word	0x20000104

08000340 <putc_>:
 8000340:	b538      	push	{r3, r4, r5, lr}
 8000342:	4c06      	ldr	r4, [pc, #24]	; (800035c <putc_+0x1c>)
 8000344:	1c05      	adds	r5, r0, #0
 8000346:	1c20      	adds	r0, r4, #0
 8000348:	f000 f8ff 	bl	800054a <mutex_lock>
 800034c:	1c28      	adds	r0, r5, #0
 800034e:	f000 fd11 	bl	8000d74 <uart_write>
 8000352:	1c20      	adds	r0, r4, #0
 8000354:	f000 f915 	bl	8000582 <mutex_unlock>
 8000358:	bd38      	pop	{r3, r4, r5, pc}
 800035a:	46c0      	nop			; (mov r8, r8)
 800035c:	20000144 	.word	0x20000144

08000360 <puts_>:
 8000360:	b538      	push	{r3, r4, r5, lr}
 8000362:	4d08      	ldr	r5, [pc, #32]	; (8000384 <puts_+0x24>)
 8000364:	1c04      	adds	r4, r0, #0
 8000366:	1c28      	adds	r0, r5, #0
 8000368:	f000 f8ef 	bl	800054a <mutex_lock>
 800036c:	3401      	adds	r4, #1
 800036e:	1e63      	subs	r3, r4, #1
 8000370:	7818      	ldrb	r0, [r3, #0]
 8000372:	2800      	cmp	r0, #0
 8000374:	d002      	beq.n	800037c <puts_+0x1c>
 8000376:	f7ff ffe3 	bl	8000340 <putc_>
 800037a:	e7f7      	b.n	800036c <puts_+0xc>
 800037c:	1c28      	adds	r0, r5, #0
 800037e:	f000 f900 	bl	8000582 <mutex_unlock>
 8000382:	bd38      	pop	{r3, r4, r5, pc}
 8000384:	20000150 	.word	0x20000150

08000388 <puti_>:
 8000388:	b5f0      	push	{r4, r5, r6, r7, lr}
 800038a:	2300      	movs	r3, #0
 800038c:	b085      	sub	sp, #20
 800038e:	1c04      	adds	r4, r0, #0
 8000390:	1c1f      	adds	r7, r3, #0
 8000392:	4298      	cmp	r0, r3
 8000394:	da01      	bge.n	800039a <puti_+0x12>
 8000396:	4244      	negs	r4, r0
 8000398:	2701      	movs	r7, #1
 800039a:	ae01      	add	r6, sp, #4
 800039c:	72f3      	strb	r3, [r6, #11]
 800039e:	250a      	movs	r5, #10
 80003a0:	1c20      	adds	r0, r4, #0
 80003a2:	210a      	movs	r1, #10
 80003a4:	f001 f842 	bl	800142c <__aeabi_idivmod>
 80003a8:	3130      	adds	r1, #48	; 0x30
 80003aa:	5571      	strb	r1, [r6, r5]
 80003ac:	1c20      	adds	r0, r4, #0
 80003ae:	210a      	movs	r1, #10
 80003b0:	f000 ffe6 	bl	8001380 <__aeabi_idiv>
 80003b4:	1e6b      	subs	r3, r5, #1
 80003b6:	1e04      	subs	r4, r0, #0
 80003b8:	d001      	beq.n	80003be <puti_+0x36>
 80003ba:	1c1d      	adds	r5, r3, #0
 80003bc:	e7f0      	b.n	80003a0 <puti_+0x18>
 80003be:	2f00      	cmp	r7, #0
 80003c0:	d002      	beq.n	80003c8 <puti_+0x40>
 80003c2:	222d      	movs	r2, #45	; 0x2d
 80003c4:	54f2      	strb	r2, [r6, r3]
 80003c6:	1c1d      	adds	r5, r3, #0
 80003c8:	1970      	adds	r0, r6, r5
 80003ca:	f7ff ffc9 	bl	8000360 <puts_>
 80003ce:	b005      	add	sp, #20
 80003d0:	bdf0      	pop	{r4, r5, r6, r7, pc}

080003d2 <putui_>:
 80003d2:	b57f      	push	{r0, r1, r2, r3, r4, r5, r6, lr}
 80003d4:	2300      	movs	r3, #0
 80003d6:	ae01      	add	r6, sp, #4
 80003d8:	1c05      	adds	r5, r0, #0
 80003da:	72f3      	strb	r3, [r6, #11]
 80003dc:	240a      	movs	r4, #10
 80003de:	1c28      	adds	r0, r5, #0
 80003e0:	210a      	movs	r1, #10
 80003e2:	f000 ffc3 	bl	800136c <__aeabi_uidivmod>
 80003e6:	3130      	adds	r1, #48	; 0x30
 80003e8:	5531      	strb	r1, [r6, r4]
 80003ea:	1c28      	adds	r0, r5, #0
 80003ec:	210a      	movs	r1, #10
 80003ee:	f000 ff79 	bl	80012e4 <__aeabi_uidiv>
 80003f2:	1e63      	subs	r3, r4, #1
 80003f4:	1e05      	subs	r5, r0, #0
 80003f6:	d001      	beq.n	80003fc <putui_+0x2a>
 80003f8:	1c1c      	adds	r4, r3, #0
 80003fa:	e7f0      	b.n	80003de <putui_+0xc>
 80003fc:	1930      	adds	r0, r6, r4
 80003fe:	f7ff ffaf 	bl	8000360 <puts_>
 8000402:	bd7f      	pop	{r0, r1, r2, r3, r4, r5, r6, pc}

08000404 <putx_>:
 8000404:	b51f      	push	{r0, r1, r2, r3, r4, lr}
 8000406:	2300      	movs	r3, #0
 8000408:	aa01      	add	r2, sp, #4
 800040a:	72d3      	strb	r3, [r2, #11]
 800040c:	230a      	movs	r3, #10
 800040e:	210f      	movs	r1, #15
 8000410:	4001      	ands	r1, r0
 8000412:	2909      	cmp	r1, #9
 8000414:	d801      	bhi.n	800041a <putx_+0x16>
 8000416:	3130      	adds	r1, #48	; 0x30
 8000418:	e000      	b.n	800041c <putx_+0x18>
 800041a:	3157      	adds	r1, #87	; 0x57
 800041c:	54d1      	strb	r1, [r2, r3]
 800041e:	0900      	lsrs	r0, r0, #4
 8000420:	1e59      	subs	r1, r3, #1
 8000422:	2800      	cmp	r0, #0
 8000424:	d001      	beq.n	800042a <putx_+0x26>
 8000426:	1c0b      	adds	r3, r1, #0
 8000428:	e7f1      	b.n	800040e <putx_+0xa>
 800042a:	18d0      	adds	r0, r2, r3
 800042c:	f7ff ff98 	bl	8000360 <puts_>
 8000430:	b005      	add	sp, #20
 8000432:	bd00      	pop	{pc}

08000434 <printf_>:
 8000434:	b40f      	push	{r0, r1, r2, r3}
 8000436:	b573      	push	{r0, r1, r4, r5, r6, lr}
 8000438:	4e25      	ldr	r6, [pc, #148]	; (80004d0 <printf_+0x9c>)
 800043a:	ac06      	add	r4, sp, #24
 800043c:	cc20      	ldmia	r4!, {r5}
 800043e:	1c30      	adds	r0, r6, #0
 8000440:	f000 f883 	bl	800054a <mutex_lock>
 8000444:	9401      	str	r4, [sp, #4]
 8000446:	2400      	movs	r4, #0
 8000448:	5d28      	ldrb	r0, [r5, r4]
 800044a:	2800      	cmp	r0, #0
 800044c:	d039      	beq.n	80004c2 <printf_+0x8e>
 800044e:	2825      	cmp	r0, #37	; 0x25
 8000450:	d003      	beq.n	800045a <printf_+0x26>
 8000452:	f7ff ff75 	bl	8000340 <putc_>
 8000456:	3401      	adds	r4, #1
 8000458:	e7f6      	b.n	8000448 <printf_+0x14>
 800045a:	192b      	adds	r3, r5, r4
 800045c:	7858      	ldrb	r0, [r3, #1]
 800045e:	2869      	cmp	r0, #105	; 0x69
 8000460:	d016      	beq.n	8000490 <printf_+0x5c>
 8000462:	d808      	bhi.n	8000476 <printf_+0x42>
 8000464:	2825      	cmp	r0, #37	; 0x25
 8000466:	d028      	beq.n	80004ba <printf_+0x86>
 8000468:	2863      	cmp	r0, #99	; 0x63
 800046a:	d128      	bne.n	80004be <printf_+0x8a>
 800046c:	9b01      	ldr	r3, [sp, #4]
 800046e:	1d1a      	adds	r2, r3, #4
 8000470:	9201      	str	r2, [sp, #4]
 8000472:	7818      	ldrb	r0, [r3, #0]
 8000474:	e021      	b.n	80004ba <printf_+0x86>
 8000476:	2875      	cmp	r0, #117	; 0x75
 8000478:	d011      	beq.n	800049e <printf_+0x6a>
 800047a:	2878      	cmp	r0, #120	; 0x78
 800047c:	d016      	beq.n	80004ac <printf_+0x78>
 800047e:	2873      	cmp	r0, #115	; 0x73
 8000480:	d11d      	bne.n	80004be <printf_+0x8a>
 8000482:	9b01      	ldr	r3, [sp, #4]
 8000484:	1d1a      	adds	r2, r3, #4
 8000486:	6818      	ldr	r0, [r3, #0]
 8000488:	9201      	str	r2, [sp, #4]
 800048a:	f7ff ff69 	bl	8000360 <puts_>
 800048e:	e016      	b.n	80004be <printf_+0x8a>
 8000490:	9b01      	ldr	r3, [sp, #4]
 8000492:	1d1a      	adds	r2, r3, #4
 8000494:	6818      	ldr	r0, [r3, #0]
 8000496:	9201      	str	r2, [sp, #4]
 8000498:	f7ff ff76 	bl	8000388 <puti_>
 800049c:	e00f      	b.n	80004be <printf_+0x8a>
 800049e:	9b01      	ldr	r3, [sp, #4]
 80004a0:	1d1a      	adds	r2, r3, #4
 80004a2:	6818      	ldr	r0, [r3, #0]
 80004a4:	9201      	str	r2, [sp, #4]
 80004a6:	f7ff ff94 	bl	80003d2 <putui_>
 80004aa:	e008      	b.n	80004be <printf_+0x8a>
 80004ac:	9b01      	ldr	r3, [sp, #4]
 80004ae:	1d1a      	adds	r2, r3, #4
 80004b0:	6818      	ldr	r0, [r3, #0]
 80004b2:	9201      	str	r2, [sp, #4]
 80004b4:	f7ff ffa6 	bl	8000404 <putx_>
 80004b8:	e001      	b.n	80004be <printf_+0x8a>
 80004ba:	f7ff ff41 	bl	8000340 <putc_>
 80004be:	3402      	adds	r4, #2
 80004c0:	e7c2      	b.n	8000448 <printf_+0x14>
 80004c2:	1c30      	adds	r0, r6, #0
 80004c4:	f000 f85d 	bl	8000582 <mutex_unlock>
 80004c8:	bc73      	pop	{r0, r1, r4, r5, r6}
 80004ca:	bc08      	pop	{r3}
 80004cc:	b004      	add	sp, #16
 80004ce:	4718      	bx	r3
 80004d0:	2000014c 	.word	0x2000014c

080004d4 <stdio_init>:
 80004d4:	b510      	push	{r4, lr}
 80004d6:	480f      	ldr	r0, [pc, #60]	; (8000514 <stdio_init+0x40>)
 80004d8:	f000 f82e 	bl	8000538 <mutex_init>
 80004dc:	480e      	ldr	r0, [pc, #56]	; (8000518 <stdio_init+0x44>)
 80004de:	f000 f82b 	bl	8000538 <mutex_init>
 80004e2:	480e      	ldr	r0, [pc, #56]	; (800051c <stdio_init+0x48>)
 80004e4:	f000 f828 	bl	8000538 <mutex_init>
 80004e8:	480d      	ldr	r0, [pc, #52]	; (8000520 <stdio_init+0x4c>)
 80004ea:	f000 f825 	bl	8000538 <mutex_init>
 80004ee:	2408      	movs	r4, #8
 80004f0:	2020      	movs	r0, #32
 80004f2:	3c01      	subs	r4, #1
 80004f4:	f7ff ff24 	bl	8000340 <putc_>
 80004f8:	2c00      	cmp	r4, #0
 80004fa:	d1f9      	bne.n	80004f0 <stdio_init+0x1c>
 80004fc:	2420      	movs	r4, #32
 80004fe:	200a      	movs	r0, #10
 8000500:	3c01      	subs	r4, #1
 8000502:	f7ff ff1d 	bl	8000340 <putc_>
 8000506:	2c00      	cmp	r4, #0
 8000508:	d1f9      	bne.n	80004fe <stdio_init+0x2a>
 800050a:	4806      	ldr	r0, [pc, #24]	; (8000524 <stdio_init+0x50>)
 800050c:	f7ff ff92 	bl	8000434 <printf_>
 8000510:	bd10      	pop	{r4, pc}
 8000512:	46c0      	nop			; (mov r8, r8)
 8000514:	20000144 	.word	0x20000144
 8000518:	20000148 	.word	0x20000148
 800051c:	20000150 	.word	0x20000150
 8000520:	2000014c 	.word	0x2000014c
 8000524:	0800145c 	.word	0x0800145c

08000528 <lib_os_init>:
 8000528:	b508      	push	{r3, lr}
 800052a:	f7ff fe99 	bl	8000260 <kernel_init>
 800052e:	f7ff feed 	bl	800030c <messages_init>
 8000532:	f7ff ffcf 	bl	80004d4 <stdio_init>
 8000536:	bd08      	pop	{r3, pc}

08000538 <mutex_init>:
 8000538:	b510      	push	{r4, lr}
 800053a:	1c04      	adds	r4, r0, #0
 800053c:	f7ff fe38 	bl	80001b0 <sched_off>
 8000540:	2300      	movs	r3, #0
 8000542:	6023      	str	r3, [r4, #0]
 8000544:	f7ff fe36 	bl	80001b4 <sched_on>
 8000548:	bd10      	pop	{r4, pc}

0800054a <mutex_lock>:
 800054a:	b513      	push	{r0, r1, r4, lr}
 800054c:	1c04      	adds	r4, r0, #0
 800054e:	f7ff fe2f 	bl	80001b0 <sched_off>
 8000552:	6823      	ldr	r3, [r4, #0]
 8000554:	9301      	str	r3, [sp, #4]
 8000556:	f7ff fe2d 	bl	80001b4 <sched_on>
 800055a:	9b01      	ldr	r3, [sp, #4]
 800055c:	2b00      	cmp	r3, #0
 800055e:	d001      	beq.n	8000564 <mutex_lock+0x1a>
 8000560:	f7ff fea0 	bl	80002a4 <set_wait_state>
 8000564:	9b01      	ldr	r3, [sp, #4]
 8000566:	2b00      	cmp	r3, #0
 8000568:	d1f1      	bne.n	800054e <mutex_lock+0x4>
 800056a:	f7ff fe21 	bl	80001b0 <sched_off>
 800056e:	6823      	ldr	r3, [r4, #0]
 8000570:	9301      	str	r3, [sp, #4]
 8000572:	9b01      	ldr	r3, [sp, #4]
 8000574:	2b00      	cmp	r3, #0
 8000576:	d1ea      	bne.n	800054e <mutex_lock+0x4>
 8000578:	2301      	movs	r3, #1
 800057a:	6023      	str	r3, [r4, #0]
 800057c:	f7ff fe1a 	bl	80001b4 <sched_on>
 8000580:	bd13      	pop	{r0, r1, r4, pc}

08000582 <mutex_unlock>:
 8000582:	b508      	push	{r3, lr}
 8000584:	f7ff ffd8 	bl	8000538 <mutex_init>
 8000588:	f7ff feae 	bl	80002e8 <wake_up_threads>
 800058c:	f7ff fe14 	bl	80001b8 <yield>
 8000590:	bd08      	pop	{r3, pc}
	...

08000594 <hmc5883_init>:
 8000594:	b510      	push	{r4, lr}
 8000596:	4b16      	ldr	r3, [pc, #88]	; (80005f0 <hmc5883_init+0x5c>)
 8000598:	2400      	movs	r4, #0
 800059a:	203c      	movs	r0, #60	; 0x3c
 800059c:	1c21      	adds	r1, r4, #0
 800059e:	2218      	movs	r2, #24
 80005a0:	801c      	strh	r4, [r3, #0]
 80005a2:	805c      	strh	r4, [r3, #2]
 80005a4:	809c      	strh	r4, [r3, #4]
 80005a6:	f000 fceb 	bl	8000f80 <i2c_write_reg>
 80005aa:	203c      	movs	r0, #60	; 0x3c
 80005ac:	2101      	movs	r1, #1
 80005ae:	1c22      	adds	r2, r4, #0
 80005b0:	f000 fce6 	bl	8000f80 <i2c_write_reg>
 80005b4:	203c      	movs	r0, #60	; 0x3c
 80005b6:	2102      	movs	r1, #2
 80005b8:	1c22      	adds	r2, r4, #0
 80005ba:	f000 fce1 	bl	8000f80 <i2c_write_reg>
 80005be:	203c      	movs	r0, #60	; 0x3c
 80005c0:	210a      	movs	r1, #10
 80005c2:	f000 fcef 	bl	8000fa4 <i2c_read_reg>
 80005c6:	2301      	movs	r3, #1
 80005c8:	2848      	cmp	r0, #72	; 0x48
 80005ca:	d10f      	bne.n	80005ec <hmc5883_init+0x58>
 80005cc:	203c      	movs	r0, #60	; 0x3c
 80005ce:	210b      	movs	r1, #11
 80005d0:	f000 fce8 	bl	8000fa4 <i2c_read_reg>
 80005d4:	2302      	movs	r3, #2
 80005d6:	2834      	cmp	r0, #52	; 0x34
 80005d8:	d108      	bne.n	80005ec <hmc5883_init+0x58>
 80005da:	203c      	movs	r0, #60	; 0x3c
 80005dc:	210c      	movs	r1, #12
 80005de:	f000 fce1 	bl	8000fa4 <i2c_read_reg>
 80005e2:	2833      	cmp	r0, #51	; 0x33
 80005e4:	d001      	beq.n	80005ea <hmc5883_init+0x56>
 80005e6:	2303      	movs	r3, #3
 80005e8:	e000      	b.n	80005ec <hmc5883_init+0x58>
 80005ea:	1c23      	adds	r3, r4, #0
 80005ec:	1c18      	adds	r0, r3, #0
 80005ee:	bd10      	pop	{r4, pc}
 80005f0:	20000154 	.word	0x20000154

080005f4 <hmc5883_read>:
 80005f4:	b538      	push	{r3, r4, r5, lr}
 80005f6:	2103      	movs	r1, #3
 80005f8:	203c      	movs	r0, #60	; 0x3c
 80005fa:	f000 fcd3 	bl	8000fa4 <i2c_read_reg>
 80005fe:	4c12      	ldr	r4, [pc, #72]	; (8000648 <hmc5883_read+0x54>)
 8000600:	0205      	lsls	r5, r0, #8
 8000602:	b2ad      	uxth	r5, r5
 8000604:	2104      	movs	r1, #4
 8000606:	203c      	movs	r0, #60	; 0x3c
 8000608:	8025      	strh	r5, [r4, #0]
 800060a:	f000 fccb 	bl	8000fa4 <i2c_read_reg>
 800060e:	2107      	movs	r1, #7
 8000610:	4305      	orrs	r5, r0
 8000612:	203c      	movs	r0, #60	; 0x3c
 8000614:	8025      	strh	r5, [r4, #0]
 8000616:	f000 fcc5 	bl	8000fa4 <i2c_read_reg>
 800061a:	0205      	lsls	r5, r0, #8
 800061c:	b2ad      	uxth	r5, r5
 800061e:	2108      	movs	r1, #8
 8000620:	203c      	movs	r0, #60	; 0x3c
 8000622:	8065      	strh	r5, [r4, #2]
 8000624:	f000 fcbe 	bl	8000fa4 <i2c_read_reg>
 8000628:	2105      	movs	r1, #5
 800062a:	4305      	orrs	r5, r0
 800062c:	203c      	movs	r0, #60	; 0x3c
 800062e:	8065      	strh	r5, [r4, #2]
 8000630:	f000 fcb8 	bl	8000fa4 <i2c_read_reg>
 8000634:	0205      	lsls	r5, r0, #8
 8000636:	b2ad      	uxth	r5, r5
 8000638:	2106      	movs	r1, #6
 800063a:	203c      	movs	r0, #60	; 0x3c
 800063c:	80a5      	strh	r5, [r4, #4]
 800063e:	f000 fcb1 	bl	8000fa4 <i2c_read_reg>
 8000642:	4305      	orrs	r5, r0
 8000644:	80a5      	strh	r5, [r4, #4]
 8000646:	bd38      	pop	{r3, r4, r5, pc}
 8000648:	20000154 	.word	0x20000154

0800064c <LCD_SH1106_write_command>:
 800064c:	b508      	push	{r3, lr}
 800064e:	1c02      	adds	r2, r0, #0
 8000650:	2100      	movs	r1, #0
 8000652:	2078      	movs	r0, #120	; 0x78
 8000654:	f000 fc94 	bl	8000f80 <i2c_write_reg>
 8000658:	bd08      	pop	{r3, pc}

0800065a <LCD_SH1106_set_cursor>:
 800065a:	b510      	push	{r4, lr}
 800065c:	1c84      	adds	r4, r0, #2
 800065e:	1c08      	adds	r0, r1, #0
 8000660:	3850      	subs	r0, #80	; 0x50
 8000662:	b2c0      	uxtb	r0, r0
 8000664:	f7ff fff2 	bl	800064c <LCD_SH1106_write_command>
 8000668:	b2e4      	uxtb	r4, r4
 800066a:	200f      	movs	r0, #15
 800066c:	4020      	ands	r0, r4
 800066e:	f7ff ffed 	bl	800064c <LCD_SH1106_write_command>
 8000672:	0924      	lsrs	r4, r4, #4
 8000674:	2010      	movs	r0, #16
 8000676:	4320      	orrs	r0, r4
 8000678:	f7ff ffe8 	bl	800064c <LCD_SH1106_write_command>
 800067c:	bd10      	pop	{r4, pc}
	...

08000680 <LCD_SH1106_set_pixel>:
 8000680:	b570      	push	{r4, r5, r6, lr}
 8000682:	1c0c      	adds	r4, r1, #0
 8000684:	1c05      	adds	r5, r0, #0
 8000686:	1c16      	adds	r6, r2, #0
 8000688:	f7ff fd92 	bl	80001b0 <sched_off>
 800068c:	08e2      	lsrs	r2, r4, #3
 800068e:	2107      	movs	r1, #7
 8000690:	400c      	ands	r4, r1
 8000692:	01d2      	lsls	r2, r2, #7
 8000694:	4b08      	ldr	r3, [pc, #32]	; (80006b8 <LCD_SH1106_set_pixel+0x38>)
 8000696:	2101      	movs	r1, #1
 8000698:	1955      	adds	r5, r2, r5
 800069a:	40a1      	lsls	r1, r4
 800069c:	5d5a      	ldrb	r2, [r3, r5]
 800069e:	1c0c      	adds	r4, r1, #0
 80006a0:	2e00      	cmp	r6, #0
 80006a2:	d003      	beq.n	80006ac <LCD_SH1106_set_pixel+0x2c>
 80006a4:	4314      	orrs	r4, r2
 80006a6:	b2e4      	uxtb	r4, r4
 80006a8:	555c      	strb	r4, [r3, r5]
 80006aa:	e001      	b.n	80006b0 <LCD_SH1106_set_pixel+0x30>
 80006ac:	438a      	bics	r2, r1
 80006ae:	555a      	strb	r2, [r3, r5]
 80006b0:	f7ff fd80 	bl	80001b4 <sched_on>
 80006b4:	bd70      	pop	{r4, r5, r6, pc}
 80006b6:	46c0      	nop			; (mov r8, r8)
 80006b8:	2000015c 	.word	0x2000015c

080006bc <LCD_SH1106_clear_buffer>:
 80006bc:	b082      	sub	sp, #8
 80006be:	2300      	movs	r3, #0
 80006c0:	9300      	str	r3, [sp, #0]
 80006c2:	9b00      	ldr	r3, [sp, #0]
 80006c4:	2b07      	cmp	r3, #7
 80006c6:	d810      	bhi.n	80006ea <LCD_SH1106_clear_buffer+0x2e>
 80006c8:	2300      	movs	r3, #0
 80006ca:	9301      	str	r3, [sp, #4]
 80006cc:	9b01      	ldr	r3, [sp, #4]
 80006ce:	2b7f      	cmp	r3, #127	; 0x7f
 80006d0:	d808      	bhi.n	80006e4 <LCD_SH1106_clear_buffer+0x28>
 80006d2:	9a00      	ldr	r2, [sp, #0]
 80006d4:	9b01      	ldr	r3, [sp, #4]
 80006d6:	01d2      	lsls	r2, r2, #7
 80006d8:	18d2      	adds	r2, r2, r3
 80006da:	4b05      	ldr	r3, [pc, #20]	; (80006f0 <LCD_SH1106_clear_buffer+0x34>)
 80006dc:	54d0      	strb	r0, [r2, r3]
 80006de:	9b01      	ldr	r3, [sp, #4]
 80006e0:	3301      	adds	r3, #1
 80006e2:	e7f2      	b.n	80006ca <LCD_SH1106_clear_buffer+0xe>
 80006e4:	9b00      	ldr	r3, [sp, #0]
 80006e6:	3301      	adds	r3, #1
 80006e8:	e7ea      	b.n	80006c0 <LCD_SH1106_clear_buffer+0x4>
 80006ea:	b002      	add	sp, #8
 80006ec:	4770      	bx	lr
 80006ee:	46c0      	nop			; (mov r8, r8)
 80006f0:	2000015c 	.word	0x2000015c

080006f4 <LCD_SH1106_flush_buffer>:
 80006f4:	b530      	push	{r4, r5, lr}
 80006f6:	2000      	movs	r0, #0
 80006f8:	b085      	sub	sp, #20
 80006fa:	f7ff ffa7 	bl	800064c <LCD_SH1106_write_command>
 80006fe:	2010      	movs	r0, #16
 8000700:	f7ff ffa4 	bl	800064c <LCD_SH1106_write_command>
 8000704:	2040      	movs	r0, #64	; 0x40
 8000706:	f7ff ffa1 	bl	800064c <LCD_SH1106_write_command>
 800070a:	2300      	movs	r3, #0
 800070c:	9301      	str	r3, [sp, #4]
 800070e:	9b01      	ldr	r3, [sp, #4]
 8000710:	2b07      	cmp	r3, #7
 8000712:	d833      	bhi.n	800077c <LCD_SH1106_flush_buffer+0x88>
 8000714:	9801      	ldr	r0, [sp, #4]
 8000716:	2400      	movs	r4, #0
 8000718:	3850      	subs	r0, #80	; 0x50
 800071a:	b2c0      	uxtb	r0, r0
 800071c:	f7ff ff96 	bl	800064c <LCD_SH1106_write_command>
 8000720:	2002      	movs	r0, #2
 8000722:	f7ff ff93 	bl	800064c <LCD_SH1106_write_command>
 8000726:	2010      	movs	r0, #16
 8000728:	f7ff ff90 	bl	800064c <LCD_SH1106_write_command>
 800072c:	9402      	str	r4, [sp, #8]
 800072e:	9b02      	ldr	r3, [sp, #8]
 8000730:	2b07      	cmp	r3, #7
 8000732:	d820      	bhi.n	8000776 <LCD_SH1106_flush_buffer+0x82>
 8000734:	f000 fbbc 	bl	8000eb0 <i2cStart>
 8000738:	2078      	movs	r0, #120	; 0x78
 800073a:	f000 fbd5 	bl	8000ee8 <i2cWrite>
 800073e:	2040      	movs	r0, #64	; 0x40
 8000740:	f000 fbd2 	bl	8000ee8 <i2cWrite>
 8000744:	2300      	movs	r3, #0
 8000746:	9303      	str	r3, [sp, #12]
 8000748:	9b03      	ldr	r3, [sp, #12]
 800074a:	2b0f      	cmp	r3, #15
 800074c:	d80d      	bhi.n	800076a <LCD_SH1106_flush_buffer+0x76>
 800074e:	9b01      	ldr	r3, [sp, #4]
 8000750:	1c65      	adds	r5, r4, #1
 8000752:	01db      	lsls	r3, r3, #7
 8000754:	191c      	adds	r4, r3, r4
 8000756:	4b0c      	ldr	r3, [pc, #48]	; (8000788 <LCD_SH1106_flush_buffer+0x94>)
 8000758:	5ce0      	ldrb	r0, [r4, r3]
 800075a:	1c2c      	adds	r4, r5, #0
 800075c:	b2c0      	uxtb	r0, r0
 800075e:	f000 fbc3 	bl	8000ee8 <i2cWrite>
 8000762:	9b03      	ldr	r3, [sp, #12]
 8000764:	3301      	adds	r3, #1
 8000766:	9303      	str	r3, [sp, #12]
 8000768:	e7ee      	b.n	8000748 <LCD_SH1106_flush_buffer+0x54>
 800076a:	f000 fbaf 	bl	8000ecc <i2cStop>
 800076e:	9b02      	ldr	r3, [sp, #8]
 8000770:	3301      	adds	r3, #1
 8000772:	9302      	str	r3, [sp, #8]
 8000774:	e7db      	b.n	800072e <LCD_SH1106_flush_buffer+0x3a>
 8000776:	9b01      	ldr	r3, [sp, #4]
 8000778:	3301      	adds	r3, #1
 800077a:	e7c7      	b.n	800070c <LCD_SH1106_flush_buffer+0x18>
 800077c:	2000      	movs	r0, #0
 800077e:	1c01      	adds	r1, r0, #0
 8000780:	f7ff ff6b 	bl	800065a <LCD_SH1106_set_cursor>
 8000784:	b005      	add	sp, #20
 8000786:	bd30      	pop	{r4, r5, pc}
 8000788:	2000015c 	.word	0x2000015c

0800078c <LCD_SH1106_flush_buffer_partial>:
 800078c:	b5f0      	push	{r4, r5, r6, r7, lr}
 800078e:	4c32      	ldr	r4, [pc, #200]	; (8000858 <LCD_SH1106_flush_buffer_partial+0xcc>)
 8000790:	b085      	sub	sp, #20
 8000792:	8826      	ldrh	r6, [r4, #0]
 8000794:	1c25      	adds	r5, r4, #0
 8000796:	b2b6      	uxth	r6, r6
 8000798:	2e01      	cmp	r6, #1
 800079a:	d019      	beq.n	80007d0 <LCD_SH1106_flush_buffer_partial+0x44>
 800079c:	2e00      	cmp	r6, #0
 800079e:	d009      	beq.n	80007b4 <LCD_SH1106_flush_buffer_partial+0x28>
 80007a0:	2500      	movs	r5, #0
 80007a2:	2e02      	cmp	r6, #2
 80007a4:	d154      	bne.n	8000850 <LCD_SH1106_flush_buffer_partial+0xc4>
 80007a6:	1c28      	adds	r0, r5, #0
 80007a8:	1c29      	adds	r1, r5, #0
 80007aa:	f7ff ff56 	bl	800065a <LCD_SH1106_set_cursor>
 80007ae:	8025      	strh	r5, [r4, #0]
 80007b0:	1c28      	adds	r0, r5, #0
 80007b2:	e04f      	b.n	8000854 <LCD_SH1106_flush_buffer_partial+0xc8>
 80007b4:	1c30      	adds	r0, r6, #0
 80007b6:	f7ff ff49 	bl	800064c <LCD_SH1106_write_command>
 80007ba:	2010      	movs	r0, #16
 80007bc:	f7ff ff46 	bl	800064c <LCD_SH1106_write_command>
 80007c0:	2040      	movs	r0, #64	; 0x40
 80007c2:	f7ff ff43 	bl	800064c <LCD_SH1106_write_command>
 80007c6:	4b25      	ldr	r3, [pc, #148]	; (800085c <LCD_SH1106_flush_buffer_partial+0xd0>)
 80007c8:	2001      	movs	r0, #1
 80007ca:	801e      	strh	r6, [r3, #0]
 80007cc:	8020      	strh	r0, [r4, #0]
 80007ce:	e041      	b.n	8000854 <LCD_SH1106_flush_buffer_partial+0xc8>
 80007d0:	4c22      	ldr	r4, [pc, #136]	; (800085c <LCD_SH1106_flush_buffer_partial+0xd0>)
 80007d2:	2600      	movs	r6, #0
 80007d4:	8823      	ldrh	r3, [r4, #0]
 80007d6:	b29b      	uxth	r3, r3
 80007d8:	9301      	str	r3, [sp, #4]
 80007da:	9801      	ldr	r0, [sp, #4]
 80007dc:	3850      	subs	r0, #80	; 0x50
 80007de:	b2c0      	uxtb	r0, r0
 80007e0:	f7ff ff34 	bl	800064c <LCD_SH1106_write_command>
 80007e4:	2002      	movs	r0, #2
 80007e6:	f7ff ff31 	bl	800064c <LCD_SH1106_write_command>
 80007ea:	2010      	movs	r0, #16
 80007ec:	f7ff ff2e 	bl	800064c <LCD_SH1106_write_command>
 80007f0:	9602      	str	r6, [sp, #8]
 80007f2:	9b02      	ldr	r3, [sp, #8]
 80007f4:	2b07      	cmp	r3, #7
 80007f6:	d820      	bhi.n	800083a <LCD_SH1106_flush_buffer_partial+0xae>
 80007f8:	f000 fb5a 	bl	8000eb0 <i2cStart>
 80007fc:	2078      	movs	r0, #120	; 0x78
 80007fe:	f000 fb73 	bl	8000ee8 <i2cWrite>
 8000802:	2040      	movs	r0, #64	; 0x40
 8000804:	f000 fb70 	bl	8000ee8 <i2cWrite>
 8000808:	2300      	movs	r3, #0
 800080a:	9303      	str	r3, [sp, #12]
 800080c:	9b03      	ldr	r3, [sp, #12]
 800080e:	2b0f      	cmp	r3, #15
 8000810:	d80d      	bhi.n	800082e <LCD_SH1106_flush_buffer_partial+0xa2>
 8000812:	9b01      	ldr	r3, [sp, #4]
 8000814:	1c77      	adds	r7, r6, #1
 8000816:	01db      	lsls	r3, r3, #7
 8000818:	199e      	adds	r6, r3, r6
 800081a:	4b11      	ldr	r3, [pc, #68]	; (8000860 <LCD_SH1106_flush_buffer_partial+0xd4>)
 800081c:	5cf0      	ldrb	r0, [r6, r3]
 800081e:	1c3e      	adds	r6, r7, #0
 8000820:	b2c0      	uxtb	r0, r0
 8000822:	f000 fb61 	bl	8000ee8 <i2cWrite>
 8000826:	9b03      	ldr	r3, [sp, #12]
 8000828:	3301      	adds	r3, #1
 800082a:	9303      	str	r3, [sp, #12]
 800082c:	e7ee      	b.n	800080c <LCD_SH1106_flush_buffer_partial+0x80>
 800082e:	f000 fb4d 	bl	8000ecc <i2cStop>
 8000832:	9b02      	ldr	r3, [sp, #8]
 8000834:	3301      	adds	r3, #1
 8000836:	9302      	str	r3, [sp, #8]
 8000838:	e7db      	b.n	80007f2 <LCD_SH1106_flush_buffer_partial+0x66>
 800083a:	8823      	ldrh	r3, [r4, #0]
 800083c:	2001      	movs	r0, #1
 800083e:	3301      	adds	r3, #1
 8000840:	b29b      	uxth	r3, r3
 8000842:	8023      	strh	r3, [r4, #0]
 8000844:	8823      	ldrh	r3, [r4, #0]
 8000846:	2b07      	cmp	r3, #7
 8000848:	d904      	bls.n	8000854 <LCD_SH1106_flush_buffer_partial+0xc8>
 800084a:	2302      	movs	r3, #2
 800084c:	802b      	strh	r3, [r5, #0]
 800084e:	e001      	b.n	8000854 <LCD_SH1106_flush_buffer_partial+0xc8>
 8000850:	8025      	strh	r5, [r4, #0]
 8000852:	2001      	movs	r0, #1
 8000854:	b005      	add	sp, #20
 8000856:	bdf0      	pop	{r4, r5, r6, r7, pc}
 8000858:	2000015a 	.word	0x2000015a
 800085c:	2000055c 	.word	0x2000055c
 8000860:	2000015c 	.word	0x2000015c

08000864 <LCD_SH1106_init>:
 8000864:	b508      	push	{r3, lr}
 8000866:	20ae      	movs	r0, #174	; 0xae
 8000868:	f7ff fef0 	bl	800064c <LCD_SH1106_write_command>
 800086c:	2002      	movs	r0, #2
 800086e:	f7ff feed 	bl	800064c <LCD_SH1106_write_command>
 8000872:	2010      	movs	r0, #16
 8000874:	f7ff feea 	bl	800064c <LCD_SH1106_write_command>
 8000878:	2040      	movs	r0, #64	; 0x40
 800087a:	f7ff fee7 	bl	800064c <LCD_SH1106_write_command>
 800087e:	20b0      	movs	r0, #176	; 0xb0
 8000880:	f7ff fee4 	bl	800064c <LCD_SH1106_write_command>
 8000884:	2081      	movs	r0, #129	; 0x81
 8000886:	f7ff fee1 	bl	800064c <LCD_SH1106_write_command>
 800088a:	2080      	movs	r0, #128	; 0x80
 800088c:	f7ff fede 	bl	800064c <LCD_SH1106_write_command>
 8000890:	20a1      	movs	r0, #161	; 0xa1
 8000892:	f7ff fedb 	bl	800064c <LCD_SH1106_write_command>
 8000896:	20a6      	movs	r0, #166	; 0xa6
 8000898:	f7ff fed8 	bl	800064c <LCD_SH1106_write_command>
 800089c:	20a8      	movs	r0, #168	; 0xa8
 800089e:	f7ff fed5 	bl	800064c <LCD_SH1106_write_command>
 80008a2:	203f      	movs	r0, #63	; 0x3f
 80008a4:	f7ff fed2 	bl	800064c <LCD_SH1106_write_command>
 80008a8:	20ad      	movs	r0, #173	; 0xad
 80008aa:	f7ff fecf 	bl	800064c <LCD_SH1106_write_command>
 80008ae:	208b      	movs	r0, #139	; 0x8b
 80008b0:	f7ff fecc 	bl	800064c <LCD_SH1106_write_command>
 80008b4:	2030      	movs	r0, #48	; 0x30
 80008b6:	f7ff fec9 	bl	800064c <LCD_SH1106_write_command>
 80008ba:	20c8      	movs	r0, #200	; 0xc8
 80008bc:	f7ff fec6 	bl	800064c <LCD_SH1106_write_command>
 80008c0:	20d3      	movs	r0, #211	; 0xd3
 80008c2:	f7ff fec3 	bl	800064c <LCD_SH1106_write_command>
 80008c6:	2000      	movs	r0, #0
 80008c8:	f7ff fec0 	bl	800064c <LCD_SH1106_write_command>
 80008cc:	20d5      	movs	r0, #213	; 0xd5
 80008ce:	f7ff febd 	bl	800064c <LCD_SH1106_write_command>
 80008d2:	2080      	movs	r0, #128	; 0x80
 80008d4:	f7ff feba 	bl	800064c <LCD_SH1106_write_command>
 80008d8:	20d9      	movs	r0, #217	; 0xd9
 80008da:	f7ff feb7 	bl	800064c <LCD_SH1106_write_command>
 80008de:	201f      	movs	r0, #31
 80008e0:	f7ff feb4 	bl	800064c <LCD_SH1106_write_command>
 80008e4:	20da      	movs	r0, #218	; 0xda
 80008e6:	f7ff feb1 	bl	800064c <LCD_SH1106_write_command>
 80008ea:	2012      	movs	r0, #18
 80008ec:	f7ff feae 	bl	800064c <LCD_SH1106_write_command>
 80008f0:	20db      	movs	r0, #219	; 0xdb
 80008f2:	f7ff feab 	bl	800064c <LCD_SH1106_write_command>
 80008f6:	2040      	movs	r0, #64	; 0x40
 80008f8:	f7ff fea8 	bl	800064c <LCD_SH1106_write_command>
 80008fc:	20af      	movs	r0, #175	; 0xaf
 80008fe:	f7ff fea5 	bl	800064c <LCD_SH1106_write_command>
 8000902:	2000      	movs	r0, #0
 8000904:	f7ff feda 	bl	80006bc <LCD_SH1106_clear_buffer>
 8000908:	f7ff fef4 	bl	80006f4 <LCD_SH1106_flush_buffer>
 800090c:	4a02      	ldr	r2, [pc, #8]	; (8000918 <LCD_SH1106_init+0xb4>)
 800090e:	2300      	movs	r3, #0
 8000910:	8013      	strh	r3, [r2, #0]
 8000912:	4a02      	ldr	r2, [pc, #8]	; (800091c <LCD_SH1106_init+0xb8>)
 8000914:	8013      	strh	r3, [r2, #0]
 8000916:	bd08      	pop	{r3, pc}
 8000918:	2000015a 	.word	0x2000015a
 800091c:	2000055c 	.word	0x2000055c

08000920 <lcd_put_char_xy>:
 8000920:	b5f7      	push	{r0, r1, r2, r4, r5, r6, r7, lr}
 8000922:	2300      	movs	r3, #0
 8000924:	1c06      	adds	r6, r0, #0
 8000926:	1c0f      	adds	r7, r1, #0
 8000928:	2a1f      	cmp	r2, #31
 800092a:	d902      	bls.n	8000932 <lcd_put_char_xy+0x12>
 800092c:	1c13      	adds	r3, r2, #0
 800092e:	3b20      	subs	r3, #32
 8000930:	b2db      	uxtb	r3, r3
 8000932:	011b      	lsls	r3, r3, #4
 8000934:	9300      	str	r3, [sp, #0]
 8000936:	2500      	movs	r5, #0
 8000938:	2301      	movs	r3, #1
 800093a:	40ab      	lsls	r3, r5
 800093c:	b2db      	uxtb	r3, r3
 800093e:	9301      	str	r3, [sp, #4]
 8000940:	2400      	movs	r4, #0
 8000942:	1c30      	adds	r0, r6, #0
 8000944:	3008      	adds	r0, #8
 8000946:	19e1      	adds	r1, r4, r7
 8000948:	1b40      	subs	r0, r0, r5
 800094a:	2880      	cmp	r0, #128	; 0x80
 800094c:	d900      	bls.n	8000950 <lcd_put_char_xy+0x30>
 800094e:	2080      	movs	r0, #128	; 0x80
 8000950:	2940      	cmp	r1, #64	; 0x40
 8000952:	d900      	bls.n	8000956 <lcd_put_char_xy+0x36>
 8000954:	2140      	movs	r1, #64	; 0x40
 8000956:	9a00      	ldr	r2, [sp, #0]
 8000958:	4b06      	ldr	r3, [pc, #24]	; (8000974 <lcd_put_char_xy+0x54>)
 800095a:	189b      	adds	r3, r3, r2
 800095c:	5d1a      	ldrb	r2, [r3, r4]
 800095e:	9b01      	ldr	r3, [sp, #4]
 8000960:	3401      	adds	r4, #1
 8000962:	401a      	ands	r2, r3
 8000964:	f7ff fe8c 	bl	8000680 <LCD_SH1106_set_pixel>
 8000968:	2c10      	cmp	r4, #16
 800096a:	d1ea      	bne.n	8000942 <lcd_put_char_xy+0x22>
 800096c:	3501      	adds	r5, #1
 800096e:	2d08      	cmp	r5, #8
 8000970:	d1e2      	bne.n	8000938 <lcd_put_char_xy+0x18>
 8000972:	bdf7      	pop	{r0, r1, r2, r4, r5, r6, r7, pc}
 8000974:	0800146d 	.word	0x0800146d

08000978 <mpu6050_init>:
 8000978:	b508      	push	{r3, lr}
 800097a:	4b06      	ldr	r3, [pc, #24]	; (8000994 <mpu6050_init+0x1c>)
 800097c:	2200      	movs	r2, #0
 800097e:	20d0      	movs	r0, #208	; 0xd0
 8000980:	216b      	movs	r1, #107	; 0x6b
 8000982:	801a      	strh	r2, [r3, #0]
 8000984:	805a      	strh	r2, [r3, #2]
 8000986:	809a      	strh	r2, [r3, #4]
 8000988:	80da      	strh	r2, [r3, #6]
 800098a:	811a      	strh	r2, [r3, #8]
 800098c:	815a      	strh	r2, [r3, #10]
 800098e:	f000 faf7 	bl	8000f80 <i2c_write_reg>
 8000992:	bd08      	pop	{r3, pc}
 8000994:	2000055e 	.word	0x2000055e

08000998 <mpu6050_read>:
 8000998:	b538      	push	{r3, r4, r5, lr}
 800099a:	213b      	movs	r1, #59	; 0x3b
 800099c:	20d0      	movs	r0, #208	; 0xd0
 800099e:	f000 fb01 	bl	8000fa4 <i2c_read_reg>
 80009a2:	4c2c      	ldr	r4, [pc, #176]	; (8000a54 <mpu6050_read+0xbc>)
 80009a4:	0205      	lsls	r5, r0, #8
 80009a6:	b2ad      	uxth	r5, r5
 80009a8:	213c      	movs	r1, #60	; 0x3c
 80009aa:	20d0      	movs	r0, #208	; 0xd0
 80009ac:	8025      	strh	r5, [r4, #0]
 80009ae:	f000 faf9 	bl	8000fa4 <i2c_read_reg>
 80009b2:	213d      	movs	r1, #61	; 0x3d
 80009b4:	4305      	orrs	r5, r0
 80009b6:	20d0      	movs	r0, #208	; 0xd0
 80009b8:	8025      	strh	r5, [r4, #0]
 80009ba:	f000 faf3 	bl	8000fa4 <i2c_read_reg>
 80009be:	0205      	lsls	r5, r0, #8
 80009c0:	b2ad      	uxth	r5, r5
 80009c2:	213e      	movs	r1, #62	; 0x3e
 80009c4:	20d0      	movs	r0, #208	; 0xd0
 80009c6:	8065      	strh	r5, [r4, #2]
 80009c8:	f000 faec 	bl	8000fa4 <i2c_read_reg>
 80009cc:	213f      	movs	r1, #63	; 0x3f
 80009ce:	4305      	orrs	r5, r0
 80009d0:	20d0      	movs	r0, #208	; 0xd0
 80009d2:	8065      	strh	r5, [r4, #2]
 80009d4:	f000 fae6 	bl	8000fa4 <i2c_read_reg>
 80009d8:	0205      	lsls	r5, r0, #8
 80009da:	b2ad      	uxth	r5, r5
 80009dc:	2140      	movs	r1, #64	; 0x40
 80009de:	20d0      	movs	r0, #208	; 0xd0
 80009e0:	80a5      	strh	r5, [r4, #4]
 80009e2:	f000 fadf 	bl	8000fa4 <i2c_read_reg>
 80009e6:	2141      	movs	r1, #65	; 0x41
 80009e8:	4305      	orrs	r5, r0
 80009ea:	20d0      	movs	r0, #208	; 0xd0
 80009ec:	80a5      	strh	r5, [r4, #4]
 80009ee:	f000 fad9 	bl	8000fa4 <i2c_read_reg>
 80009f2:	0205      	lsls	r5, r0, #8
 80009f4:	b2ad      	uxth	r5, r5
 80009f6:	2142      	movs	r1, #66	; 0x42
 80009f8:	20d0      	movs	r0, #208	; 0xd0
 80009fa:	81a5      	strh	r5, [r4, #12]
 80009fc:	f000 fad2 	bl	8000fa4 <i2c_read_reg>
 8000a00:	2143      	movs	r1, #67	; 0x43
 8000a02:	4305      	orrs	r5, r0
 8000a04:	20d0      	movs	r0, #208	; 0xd0
 8000a06:	81a5      	strh	r5, [r4, #12]
 8000a08:	f000 facc 	bl	8000fa4 <i2c_read_reg>
 8000a0c:	0205      	lsls	r5, r0, #8
 8000a0e:	b2ad      	uxth	r5, r5
 8000a10:	2144      	movs	r1, #68	; 0x44
 8000a12:	20d0      	movs	r0, #208	; 0xd0
 8000a14:	80e5      	strh	r5, [r4, #6]
 8000a16:	f000 fac5 	bl	8000fa4 <i2c_read_reg>
 8000a1a:	2145      	movs	r1, #69	; 0x45
 8000a1c:	4305      	orrs	r5, r0
 8000a1e:	20d0      	movs	r0, #208	; 0xd0
 8000a20:	80e5      	strh	r5, [r4, #6]
 8000a22:	f000 fabf 	bl	8000fa4 <i2c_read_reg>
 8000a26:	0205      	lsls	r5, r0, #8
 8000a28:	b2ad      	uxth	r5, r5
 8000a2a:	2146      	movs	r1, #70	; 0x46
 8000a2c:	20d0      	movs	r0, #208	; 0xd0
 8000a2e:	8125      	strh	r5, [r4, #8]
 8000a30:	f000 fab8 	bl	8000fa4 <i2c_read_reg>
 8000a34:	2147      	movs	r1, #71	; 0x47
 8000a36:	4305      	orrs	r5, r0
 8000a38:	20d0      	movs	r0, #208	; 0xd0
 8000a3a:	8125      	strh	r5, [r4, #8]
 8000a3c:	f000 fab2 	bl	8000fa4 <i2c_read_reg>
 8000a40:	0205      	lsls	r5, r0, #8
 8000a42:	b2ad      	uxth	r5, r5
 8000a44:	2148      	movs	r1, #72	; 0x48
 8000a46:	20d0      	movs	r0, #208	; 0xd0
 8000a48:	8165      	strh	r5, [r4, #10]
 8000a4a:	f000 faab 	bl	8000fa4 <i2c_read_reg>
 8000a4e:	4305      	orrs	r5, r0
 8000a50:	8165      	strh	r5, [r4, #10]
 8000a52:	bd38      	pop	{r3, r4, r5, pc}
 8000a54:	2000055e 	.word	0x2000055e

08000a58 <child_thread>:
 8000a58:	b538      	push	{r3, r4, r5, lr}
 8000a5a:	2008      	movs	r0, #8
 8000a5c:	f000 fc0a 	bl	8001274 <led_on>
 8000a60:	f000 f96a 	bl	8000d38 <timer_get_time>
 8000a64:	1c01      	adds	r1, r0, #0
 8000a66:	4816      	ldr	r0, [pc, #88]	; (8000ac0 <child_thread+0x68>)
 8000a68:	f7ff fce4 	bl	8000434 <printf_>
 8000a6c:	4c15      	ldr	r4, [pc, #84]	; (8000ac4 <child_thread+0x6c>)
 8000a6e:	4d16      	ldr	r5, [pc, #88]	; (8000ac8 <child_thread+0x70>)
 8000a70:	2302      	movs	r3, #2
 8000a72:	5ee2      	ldrsh	r2, [r4, r3]
 8000a74:	2000      	movs	r0, #0
 8000a76:	5e21      	ldrsh	r1, [r4, r0]
 8000a78:	2004      	movs	r0, #4
 8000a7a:	5e23      	ldrsh	r3, [r4, r0]
 8000a7c:	1c28      	adds	r0, r5, #0
 8000a7e:	f7ff fcd9 	bl	8000434 <printf_>
 8000a82:	2206      	movs	r2, #6
 8000a84:	5ea1      	ldrsh	r1, [r4, r2]
 8000a86:	2308      	movs	r3, #8
 8000a88:	5ee2      	ldrsh	r2, [r4, r3]
 8000a8a:	200a      	movs	r0, #10
 8000a8c:	5e23      	ldrsh	r3, [r4, r0]
 8000a8e:	1c28      	adds	r0, r5, #0
 8000a90:	f7ff fcd0 	bl	8000434 <printf_>
 8000a94:	4b0d      	ldr	r3, [pc, #52]	; (8000acc <child_thread+0x74>)
 8000a96:	2200      	movs	r2, #0
 8000a98:	5e99      	ldrsh	r1, [r3, r2]
 8000a9a:	2002      	movs	r0, #2
 8000a9c:	5e1a      	ldrsh	r2, [r3, r0]
 8000a9e:	2004      	movs	r0, #4
 8000aa0:	5e1b      	ldrsh	r3, [r3, r0]
 8000aa2:	1c28      	adds	r0, r5, #0
 8000aa4:	f7ff fcc6 	bl	8000434 <printf_>
 8000aa8:	4809      	ldr	r0, [pc, #36]	; (8000ad0 <child_thread+0x78>)
 8000aaa:	f7ff fcc3 	bl	8000434 <printf_>
 8000aae:	2008      	movs	r0, #8
 8000ab0:	f000 fbe6 	bl	8001280 <led_off>
 8000ab4:	2096      	movs	r0, #150	; 0x96
 8000ab6:	0040      	lsls	r0, r0, #1
 8000ab8:	f000 f94a 	bl	8000d50 <timer_delay_ms>
 8000abc:	e7cd      	b.n	8000a5a <child_thread+0x2>
 8000abe:	46c0      	nop			; (mov r8, r8)
 8000ac0:	08001a6d 	.word	0x08001a6d
 8000ac4:	2000055e 	.word	0x2000055e
 8000ac8:	08001a74 	.word	0x08001a74
 8000acc:	20000154 	.word	0x20000154
 8000ad0:	08001b08 	.word	0x08001b08

08000ad4 <lcd_put_int>:
 8000ad4:	b5f0      	push	{r4, r5, r6, r7, lr}
 8000ad6:	2300      	movs	r3, #0
 8000ad8:	b087      	sub	sp, #28
 8000ada:	1c04      	adds	r4, r0, #0
 8000adc:	9100      	str	r1, [sp, #0]
 8000ade:	9201      	str	r2, [sp, #4]
 8000ae0:	1c1f      	adds	r7, r3, #0
 8000ae2:	4298      	cmp	r0, r3
 8000ae4:	da01      	bge.n	8000aea <lcd_put_int+0x16>
 8000ae6:	4244      	negs	r4, r0
 8000ae8:	2701      	movs	r7, #1
 8000aea:	ae03      	add	r6, sp, #12
 8000aec:	72f3      	strb	r3, [r6, #11]
 8000aee:	250a      	movs	r5, #10
 8000af0:	1c20      	adds	r0, r4, #0
 8000af2:	210a      	movs	r1, #10
 8000af4:	f000 fc9a 	bl	800142c <__aeabi_idivmod>
 8000af8:	3130      	adds	r1, #48	; 0x30
 8000afa:	5571      	strb	r1, [r6, r5]
 8000afc:	1c20      	adds	r0, r4, #0
 8000afe:	210a      	movs	r1, #10
 8000b00:	f000 fc3e 	bl	8001380 <__aeabi_idiv>
 8000b04:	1e6b      	subs	r3, r5, #1
 8000b06:	1e04      	subs	r4, r0, #0
 8000b08:	d001      	beq.n	8000b0e <lcd_put_int+0x3a>
 8000b0a:	1c1d      	adds	r5, r3, #0
 8000b0c:	e7f0      	b.n	8000af0 <lcd_put_int+0x1c>
 8000b0e:	2f00      	cmp	r7, #0
 8000b10:	d002      	beq.n	8000b18 <lcd_put_int+0x44>
 8000b12:	222d      	movs	r2, #45	; 0x2d
 8000b14:	54f2      	strb	r2, [r6, r3]
 8000b16:	1c1d      	adds	r5, r3, #0
 8000b18:	2400      	movs	r4, #0
 8000b1a:	1973      	adds	r3, r6, r5
 8000b1c:	5d1f      	ldrb	r7, [r3, r4]
 8000b1e:	9b00      	ldr	r3, [sp, #0]
 8000b20:	00e0      	lsls	r0, r4, #3
 8000b22:	18c0      	adds	r0, r0, r3
 8000b24:	9901      	ldr	r1, [sp, #4]
 8000b26:	1c3a      	adds	r2, r7, #0
 8000b28:	f7ff fefa 	bl	8000920 <lcd_put_char_xy>
 8000b2c:	2f00      	cmp	r7, #0
 8000b2e:	d002      	beq.n	8000b36 <lcd_put_int+0x62>
 8000b30:	3401      	adds	r4, #1
 8000b32:	2c0c      	cmp	r4, #12
 8000b34:	d1f1      	bne.n	8000b1a <lcd_put_int+0x46>
 8000b36:	b007      	add	sp, #28
 8000b38:	bdf0      	pop	{r4, r5, r6, r7, pc}
	...

08000b3c <main_thread>:
 8000b3c:	b538      	push	{r3, r4, r5, lr}
 8000b3e:	2008      	movs	r0, #8
 8000b40:	f000 fb98 	bl	8001274 <led_on>
 8000b44:	4824      	ldr	r0, [pc, #144]	; (8000bd8 <main_thread+0x9c>)
 8000b46:	f7ff fc75 	bl	8000434 <printf_>
 8000b4a:	f7ff fd23 	bl	8000594 <hmc5883_init>
 8000b4e:	f7ff ff13 	bl	8000978 <mpu6050_init>
 8000b52:	f7ff fe87 	bl	8000864 <LCD_SH1106_init>
 8000b56:	20ff      	movs	r0, #255	; 0xff
 8000b58:	f7ff fdb0 	bl	80006bc <LCD_SH1106_clear_buffer>
 8000b5c:	2280      	movs	r2, #128	; 0x80
 8000b5e:	481f      	ldr	r0, [pc, #124]	; (8000bdc <main_thread+0xa0>)
 8000b60:	491f      	ldr	r1, [pc, #124]	; (8000be0 <main_thread+0xa4>)
 8000b62:	00d2      	lsls	r2, r2, #3
 8000b64:	2308      	movs	r3, #8
 8000b66:	f7ff fb3b 	bl	80001e0 <create_thread>
 8000b6a:	f7ff fd43 	bl	80005f4 <hmc5883_read>
 8000b6e:	f7ff ff13 	bl	8000998 <mpu6050_read>
 8000b72:	f7ff fe0b 	bl	800078c <LCD_SH1106_flush_buffer_partial>
 8000b76:	1e04      	subs	r4, r0, #0
 8000b78:	d1f7      	bne.n	8000b6a <main_thread+0x2e>
 8000b7a:	f7ff fd9f 	bl	80006bc <LCD_SH1106_clear_buffer>
 8000b7e:	4d19      	ldr	r5, [pc, #100]	; (8000be4 <main_thread+0xa8>)
 8000b80:	1c21      	adds	r1, r4, #0
 8000b82:	2306      	movs	r3, #6
 8000b84:	5ee8      	ldrsh	r0, [r5, r3]
 8000b86:	1c22      	adds	r2, r4, #0
 8000b88:	f7ff ffa4 	bl	8000ad4 <lcd_put_int>
 8000b8c:	2308      	movs	r3, #8
 8000b8e:	5ee8      	ldrsh	r0, [r5, r3]
 8000b90:	1c21      	adds	r1, r4, #0
 8000b92:	2210      	movs	r2, #16
 8000b94:	f7ff ff9e 	bl	8000ad4 <lcd_put_int>
 8000b98:	230a      	movs	r3, #10
 8000b9a:	5ee8      	ldrsh	r0, [r5, r3]
 8000b9c:	1c21      	adds	r1, r4, #0
 8000b9e:	2220      	movs	r2, #32
 8000ba0:	f7ff ff98 	bl	8000ad4 <lcd_put_int>
 8000ba4:	4d10      	ldr	r5, [pc, #64]	; (8000be8 <main_thread+0xac>)
 8000ba6:	1c22      	adds	r2, r4, #0
 8000ba8:	2300      	movs	r3, #0
 8000baa:	5ee8      	ldrsh	r0, [r5, r3]
 8000bac:	2140      	movs	r1, #64	; 0x40
 8000bae:	f7ff ff91 	bl	8000ad4 <lcd_put_int>
 8000bb2:	2302      	movs	r3, #2
 8000bb4:	5ee8      	ldrsh	r0, [r5, r3]
 8000bb6:	2140      	movs	r1, #64	; 0x40
 8000bb8:	2210      	movs	r2, #16
 8000bba:	f7ff ff8b 	bl	8000ad4 <lcd_put_int>
 8000bbe:	2304      	movs	r3, #4
 8000bc0:	5ee8      	ldrsh	r0, [r5, r3]
 8000bc2:	2140      	movs	r1, #64	; 0x40
 8000bc4:	2220      	movs	r2, #32
 8000bc6:	f7ff ff85 	bl	8000ad4 <lcd_put_int>
 8000bca:	f000 f8b5 	bl	8000d38 <timer_get_time>
 8000bce:	1c21      	adds	r1, r4, #0
 8000bd0:	2230      	movs	r2, #48	; 0x30
 8000bd2:	f7ff ff7f 	bl	8000ad4 <lcd_put_int>
 8000bd6:	e7c8      	b.n	8000b6a <main_thread+0x2e>
 8000bd8:	08001a80 	.word	0x08001a80
 8000bdc:	08000a59 	.word	0x08000a59
 8000be0:	2000056c 	.word	0x2000056c
 8000be4:	2000055e 	.word	0x2000055e
 8000be8:	20000154 	.word	0x20000154

08000bec <mem_info_print>:
 8000bec:	b538      	push	{r3, r4, r5, lr}
 8000bee:	490e      	ldr	r1, [pc, #56]	; (8000c28 <mem_info_print+0x3c>)
 8000bf0:	480e      	ldr	r0, [pc, #56]	; (8000c2c <mem_info_print+0x40>)
 8000bf2:	f7ff fc1f 	bl	8000434 <printf_>
 8000bf6:	4c0e      	ldr	r4, [pc, #56]	; (8000c30 <mem_info_print+0x44>)
 8000bf8:	480e      	ldr	r0, [pc, #56]	; (8000c34 <mem_info_print+0x48>)
 8000bfa:	1c21      	adds	r1, r4, #0
 8000bfc:	f7ff fc1a 	bl	8000434 <printf_>
 8000c00:	4d0d      	ldr	r5, [pc, #52]	; (8000c38 <mem_info_print+0x4c>)
 8000c02:	480e      	ldr	r0, [pc, #56]	; (8000c3c <mem_info_print+0x50>)
 8000c04:	1b2d      	subs	r5, r5, r4
 8000c06:	1c29      	adds	r1, r5, #0
 8000c08:	f7ff fc14 	bl	8000434 <printf_>
 8000c0c:	490c      	ldr	r1, [pc, #48]	; (8000c40 <mem_info_print+0x54>)
 8000c0e:	480d      	ldr	r0, [pc, #52]	; (8000c44 <mem_info_print+0x58>)
 8000c10:	1a64      	subs	r4, r4, r1
 8000c12:	1929      	adds	r1, r5, r4
 8000c14:	f7ff fc0e 	bl	8000434 <printf_>
 8000c18:	490b      	ldr	r1, [pc, #44]	; (8000c48 <mem_info_print+0x5c>)
 8000c1a:	480c      	ldr	r0, [pc, #48]	; (8000c4c <mem_info_print+0x60>)
 8000c1c:	f7ff fc0a 	bl	8000434 <printf_>
 8000c20:	480b      	ldr	r0, [pc, #44]	; (8000c50 <mem_info_print+0x64>)
 8000c22:	f7ff fc07 	bl	8000434 <printf_>
 8000c26:	bd38      	pop	{r3, r4, r5, pc}
 8000c28:	08001444 	.word	0x08001444
 8000c2c:	08001abb 	.word	0x08001abb
 8000c30:	20000000 	.word	0x20000000
 8000c34:	08001acc 	.word	0x08001acc
 8000c38:	20002000 	.word	0x20002000
 8000c3c:	08001adb 	.word	0x08001adb
 8000c40:	20000dc0 	.word	0x20000dc0
 8000c44:	08001ae9 	.word	0x08001ae9
 8000c48:	20000dc0 	.word	0x20000dc0
 8000c4c:	08001af7 	.word	0x08001af7
 8000c50:	08001b07 	.word	0x08001b07

08000c54 <main>:
 8000c54:	b508      	push	{r3, lr}
 8000c56:	f000 fae9 	bl	800122c <lib_low_level_init>
 8000c5a:	f7ff fc65 	bl	8000528 <lib_os_init>
 8000c5e:	f7ff ffc5 	bl	8000bec <mem_info_print>
 8000c62:	2280      	movs	r2, #128	; 0x80
 8000c64:	4904      	ldr	r1, [pc, #16]	; (8000c78 <main+0x24>)
 8000c66:	00d2      	lsls	r2, r2, #3
 8000c68:	2308      	movs	r3, #8
 8000c6a:	4804      	ldr	r0, [pc, #16]	; (8000c7c <main+0x28>)
 8000c6c:	f7ff fab8 	bl	80001e0 <create_thread>
 8000c70:	f7ff fab0 	bl	80001d4 <kernel_start>
 8000c74:	2000      	movs	r0, #0
 8000c76:	bd08      	pop	{r3, pc}
 8000c78:	2000096c 	.word	0x2000096c
 8000c7c:	08000b3d 	.word	0x08000b3d

08000c80 <timer_init>:
 8000c80:	b510      	push	{r4, lr}
 8000c82:	2200      	movs	r2, #0
 8000c84:	4813      	ldr	r0, [pc, #76]	; (8000cd4 <timer_init+0x54>)
 8000c86:	2380      	movs	r3, #128	; 0x80
 8000c88:	0051      	lsls	r1, r2, #1
 8000c8a:	00db      	lsls	r3, r3, #3
 8000c8c:	520b      	strh	r3, [r1, r0]
 8000c8e:	4812      	ldr	r0, [pc, #72]	; (8000cd8 <timer_init+0x58>)
 8000c90:	3201      	adds	r2, #1
 8000c92:	520b      	strh	r3, [r1, r0]
 8000c94:	4811      	ldr	r0, [pc, #68]	; (8000cdc <timer_init+0x5c>)
 8000c96:	2300      	movs	r3, #0
 8000c98:	520b      	strh	r3, [r1, r0]
 8000c9a:	2a04      	cmp	r2, #4
 8000c9c:	d1f2      	bne.n	8000c84 <timer_init+0x4>
 8000c9e:	4a10      	ldr	r2, [pc, #64]	; (8000ce0 <timer_init+0x60>)
 8000ca0:	2001      	movs	r0, #1
 8000ca2:	6013      	str	r3, [r2, #0]
 8000ca4:	4a0f      	ldr	r2, [pc, #60]	; (8000ce4 <timer_init+0x64>)
 8000ca6:	4c10      	ldr	r4, [pc, #64]	; (8000ce8 <timer_init+0x68>)
 8000ca8:	6b91      	ldr	r1, [r2, #56]	; 0x38
 8000caa:	4301      	orrs	r1, r0
 8000cac:	6391      	str	r1, [r2, #56]	; 0x38
 8000cae:	2280      	movs	r2, #128	; 0x80
 8000cb0:	05d2      	lsls	r2, r2, #23
 8000cb2:	6022      	str	r2, [r4, #0]
 8000cb4:	22f9      	movs	r2, #249	; 0xf9
 8000cb6:	60e2      	str	r2, [r4, #12]
 8000cb8:	1c20      	adds	r0, r4, #0
 8000cba:	2208      	movs	r2, #8
 8000cbc:	6062      	str	r2, [r4, #4]
 8000cbe:	6123      	str	r3, [r4, #16]
 8000cc0:	60a3      	str	r3, [r4, #8]
 8000cc2:	f000 f9dc 	bl	800107e <HAL_TIM_Base_Init>
 8000cc6:	1c20      	adds	r0, r4, #0
 8000cc8:	f000 f9f5 	bl	80010b6 <HAL_TIM_Base_Start_IT>
 8000ccc:	200f      	movs	r0, #15
 8000cce:	f000 f99f 	bl	8001010 <HAL_NVIC_EnableIRQ>
 8000cd2:	bd10      	pop	{r4, pc}
 8000cd4:	20000d80 	.word	0x20000d80
 8000cd8:	20000d74 	.word	0x20000d74
 8000cdc:	20000d6c 	.word	0x20000d6c
 8000ce0:	20000d7c 	.word	0x20000d7c
 8000ce4:	40021000 	.word	0x40021000
 8000ce8:	20000d88 	.word	0x20000d88

08000cec <TIM2_IRQHandler>:
 8000cec:	2200      	movs	r2, #0
 8000cee:	490e      	ldr	r1, [pc, #56]	; (8000d28 <TIM2_IRQHandler+0x3c>)
 8000cf0:	0053      	lsls	r3, r2, #1
 8000cf2:	5a58      	ldrh	r0, [r3, r1]
 8000cf4:	2800      	cmp	r0, #0
 8000cf6:	d003      	beq.n	8000d00 <TIM2_IRQHandler+0x14>
 8000cf8:	5a58      	ldrh	r0, [r3, r1]
 8000cfa:	3801      	subs	r0, #1
 8000cfc:	b280      	uxth	r0, r0
 8000cfe:	e005      	b.n	8000d0c <TIM2_IRQHandler+0x20>
 8000d00:	480a      	ldr	r0, [pc, #40]	; (8000d2c <TIM2_IRQHandler+0x40>)
 8000d02:	5a18      	ldrh	r0, [r3, r0]
 8000d04:	b280      	uxth	r0, r0
 8000d06:	5258      	strh	r0, [r3, r1]
 8000d08:	4909      	ldr	r1, [pc, #36]	; (8000d30 <TIM2_IRQHandler+0x44>)
 8000d0a:	2001      	movs	r0, #1
 8000d0c:	3201      	adds	r2, #1
 8000d0e:	5258      	strh	r0, [r3, r1]
 8000d10:	2a04      	cmp	r2, #4
 8000d12:	d1ec      	bne.n	8000cee <TIM2_IRQHandler+0x2>
 8000d14:	4b07      	ldr	r3, [pc, #28]	; (8000d34 <TIM2_IRQHandler+0x48>)
 8000d16:	681a      	ldr	r2, [r3, #0]
 8000d18:	3201      	adds	r2, #1
 8000d1a:	601a      	str	r2, [r3, #0]
 8000d1c:	2202      	movs	r2, #2
 8000d1e:	2380      	movs	r3, #128	; 0x80
 8000d20:	4252      	negs	r2, r2
 8000d22:	05db      	lsls	r3, r3, #23
 8000d24:	611a      	str	r2, [r3, #16]
 8000d26:	4770      	bx	lr
 8000d28:	20000d80 	.word	0x20000d80
 8000d2c:	20000d74 	.word	0x20000d74
 8000d30:	20000d6c 	.word	0x20000d6c
 8000d34:	20000d7c 	.word	0x20000d7c

08000d38 <timer_get_time>:
 8000d38:	b082      	sub	sp, #8
 8000d3a:	b672      	cpsid	i
 8000d3c:	4b03      	ldr	r3, [pc, #12]	; (8000d4c <timer_get_time+0x14>)
 8000d3e:	681b      	ldr	r3, [r3, #0]
 8000d40:	9301      	str	r3, [sp, #4]
 8000d42:	b662      	cpsie	i
 8000d44:	9801      	ldr	r0, [sp, #4]
 8000d46:	b002      	add	sp, #8
 8000d48:	4770      	bx	lr
 8000d4a:	46c0      	nop			; (mov r8, r8)
 8000d4c:	20000d7c 	.word	0x20000d7c

08000d50 <timer_delay_ms>:
 8000d50:	b513      	push	{r0, r1, r4, lr}
 8000d52:	1c04      	adds	r4, r0, #0
 8000d54:	f7ff fff0 	bl	8000d38 <timer_get_time>
 8000d58:	1904      	adds	r4, r0, r4
 8000d5a:	9401      	str	r4, [sp, #4]
 8000d5c:	9c01      	ldr	r4, [sp, #4]
 8000d5e:	f7ff ffeb 	bl	8000d38 <timer_get_time>
 8000d62:	4284      	cmp	r4, r0
 8000d64:	d904      	bls.n	8000d70 <timer_delay_ms+0x20>
 8000d66:	f7ff fa27 	bl	80001b8 <yield>
 8000d6a:	f000 f94f 	bl	800100c <sleep>
 8000d6e:	e7f5      	b.n	8000d5c <timer_delay_ms+0xc>
 8000d70:	bd13      	pop	{r0, r1, r4, pc}
	...

08000d74 <uart_write>:
 8000d74:	4b03      	ldr	r3, [pc, #12]	; (8000d84 <uart_write+0x10>)
 8000d76:	6298      	str	r0, [r3, #40]	; 0x28
 8000d78:	69da      	ldr	r2, [r3, #28]
 8000d7a:	0651      	lsls	r1, r2, #25
 8000d7c:	d401      	bmi.n	8000d82 <uart_write+0xe>
 8000d7e:	46c0      	nop			; (mov r8, r8)
 8000d80:	e7fa      	b.n	8000d78 <uart_write+0x4>
 8000d82:	4770      	bx	lr
 8000d84:	40004400 	.word	0x40004400

08000d88 <uart_init>:
 8000d88:	4b1d      	ldr	r3, [pc, #116]	; (8000e00 <uart_init+0x78>)
 8000d8a:	b510      	push	{r4, lr}
 8000d8c:	6ad9      	ldr	r1, [r3, #44]	; 0x2c
 8000d8e:	2201      	movs	r2, #1
 8000d90:	4311      	orrs	r1, r2
 8000d92:	62d9      	str	r1, [r3, #44]	; 0x2c
 8000d94:	6ad9      	ldr	r1, [r3, #44]	; 0x2c
 8000d96:	b088      	sub	sp, #32
 8000d98:	4011      	ands	r1, r2
 8000d9a:	9101      	str	r1, [sp, #4]
 8000d9c:	9901      	ldr	r1, [sp, #4]
 8000d9e:	6ad9      	ldr	r1, [r3, #44]	; 0x2c
 8000da0:	2404      	movs	r4, #4
 8000da2:	4311      	orrs	r1, r2
 8000da4:	62d9      	str	r1, [r3, #44]	; 0x2c
 8000da6:	6ad9      	ldr	r1, [r3, #44]	; 0x2c
 8000da8:	4011      	ands	r1, r2
 8000daa:	9102      	str	r1, [sp, #8]
 8000dac:	9902      	ldr	r1, [sp, #8]
 8000dae:	6b98      	ldr	r0, [r3, #56]	; 0x38
 8000db0:	2180      	movs	r1, #128	; 0x80
 8000db2:	0289      	lsls	r1, r1, #10
 8000db4:	4301      	orrs	r1, r0
 8000db6:	6399      	str	r1, [r3, #56]	; 0x38
 8000db8:	20a0      	movs	r0, #160	; 0xa0
 8000dba:	2302      	movs	r3, #2
 8000dbc:	9304      	str	r3, [sp, #16]
 8000dbe:	05c0      	lsls	r0, r0, #23
 8000dc0:	2303      	movs	r3, #3
 8000dc2:	a903      	add	r1, sp, #12
 8000dc4:	9205      	str	r2, [sp, #20]
 8000dc6:	9306      	str	r3, [sp, #24]
 8000dc8:	9403      	str	r4, [sp, #12]
 8000dca:	9407      	str	r4, [sp, #28]
 8000dcc:	f000 f97e 	bl	80010cc <HAL_GPIO_Init>
 8000dd0:	20a0      	movs	r0, #160	; 0xa0
 8000dd2:	2308      	movs	r3, #8
 8000dd4:	05c0      	lsls	r0, r0, #23
 8000dd6:	a903      	add	r1, sp, #12
 8000dd8:	9303      	str	r3, [sp, #12]
 8000dda:	9407      	str	r4, [sp, #28]
 8000ddc:	f000 f976 	bl	80010cc <HAL_GPIO_Init>
 8000de0:	4b08      	ldr	r3, [pc, #32]	; (8000e04 <uart_init+0x7c>)
 8000de2:	22d0      	movs	r2, #208	; 0xd0
 8000de4:	60da      	str	r2, [r3, #12]
 8000de6:	220d      	movs	r2, #13
 8000de8:	601a      	str	r2, [r3, #0]
 8000dea:	69d8      	ldr	r0, [r3, #28]
 8000dec:	2140      	movs	r1, #64	; 0x40
 8000dee:	4a05      	ldr	r2, [pc, #20]	; (8000e04 <uart_init+0x7c>)
 8000df0:	4208      	tst	r0, r1
 8000df2:	d0fa      	beq.n	8000dea <uart_init+0x62>
 8000df4:	6a13      	ldr	r3, [r2, #32]
 8000df6:	4319      	orrs	r1, r3
 8000df8:	6211      	str	r1, [r2, #32]
 8000dfa:	b008      	add	sp, #32
 8000dfc:	bd10      	pop	{r4, pc}
 8000dfe:	46c0      	nop			; (mov r8, r8)
 8000e00:	40021000 	.word	0x40021000
 8000e04:	40004400 	.word	0x40004400

08000e08 <SetLowSDA>:
 8000e08:	b57f      	push	{r0, r1, r2, r3, r4, r5, r6, lr}
 8000e0a:	2301      	movs	r3, #1
 8000e0c:	9302      	str	r3, [sp, #8]
 8000e0e:	9303      	str	r3, [sp, #12]
 8000e10:	4805      	ldr	r0, [pc, #20]	; (8000e28 <SetLowSDA+0x20>)
 8000e12:	2303      	movs	r3, #3
 8000e14:	9304      	str	r3, [sp, #16]
 8000e16:	2310      	movs	r3, #16
 8000e18:	9301      	str	r3, [sp, #4]
 8000e1a:	a901      	add	r1, sp, #4
 8000e1c:	6283      	str	r3, [r0, #40]	; 0x28
 8000e1e:	f000 f955 	bl	80010cc <HAL_GPIO_Init>
 8000e22:	46c0      	nop			; (mov r8, r8)
 8000e24:	b007      	add	sp, #28
 8000e26:	bd00      	pop	{pc}
 8000e28:	50000400 	.word	0x50000400

08000e2c <SetHighSDA>:
 8000e2c:	b57f      	push	{r0, r1, r2, r3, r4, r5, r6, lr}
 8000e2e:	2300      	movs	r3, #0
 8000e30:	9302      	str	r3, [sp, #8]
 8000e32:	2301      	movs	r3, #1
 8000e34:	9303      	str	r3, [sp, #12]
 8000e36:	4806      	ldr	r0, [pc, #24]	; (8000e50 <SetHighSDA+0x24>)
 8000e38:	2303      	movs	r3, #3
 8000e3a:	9304      	str	r3, [sp, #16]
 8000e3c:	2310      	movs	r3, #16
 8000e3e:	9301      	str	r3, [sp, #4]
 8000e40:	a901      	add	r1, sp, #4
 8000e42:	6183      	str	r3, [r0, #24]
 8000e44:	f000 f942 	bl	80010cc <HAL_GPIO_Init>
 8000e48:	46c0      	nop			; (mov r8, r8)
 8000e4a:	b007      	add	sp, #28
 8000e4c:	bd00      	pop	{pc}
 8000e4e:	46c0      	nop			; (mov r8, r8)
 8000e50:	50000400 	.word	0x50000400

08000e54 <SetLowSCL>:
 8000e54:	4b02      	ldr	r3, [pc, #8]	; (8000e60 <SetLowSCL+0xc>)
 8000e56:	2220      	movs	r2, #32
 8000e58:	629a      	str	r2, [r3, #40]	; 0x28
 8000e5a:	46c0      	nop			; (mov r8, r8)
 8000e5c:	4770      	bx	lr
 8000e5e:	46c0      	nop			; (mov r8, r8)
 8000e60:	50000400 	.word	0x50000400

08000e64 <SetHighSCL>:
 8000e64:	4b02      	ldr	r3, [pc, #8]	; (8000e70 <SetHighSCL+0xc>)
 8000e66:	2220      	movs	r2, #32
 8000e68:	619a      	str	r2, [r3, #24]
 8000e6a:	46c0      	nop			; (mov r8, r8)
 8000e6c:	4770      	bx	lr
 8000e6e:	46c0      	nop			; (mov r8, r8)
 8000e70:	50000400 	.word	0x50000400

08000e74 <i2c_init>:
 8000e74:	b57f      	push	{r0, r1, r2, r3, r4, r5, r6, lr}
 8000e76:	4b0c      	ldr	r3, [pc, #48]	; (8000ea8 <i2c_init+0x34>)
 8000e78:	2102      	movs	r1, #2
 8000e7a:	6ada      	ldr	r2, [r3, #44]	; 0x2c
 8000e7c:	480b      	ldr	r0, [pc, #44]	; (8000eac <i2c_init+0x38>)
 8000e7e:	430a      	orrs	r2, r1
 8000e80:	62da      	str	r2, [r3, #44]	; 0x2c
 8000e82:	2301      	movs	r3, #1
 8000e84:	9302      	str	r3, [sp, #8]
 8000e86:	9303      	str	r3, [sp, #12]
 8000e88:	2303      	movs	r3, #3
 8000e8a:	a901      	add	r1, sp, #4
 8000e8c:	9304      	str	r3, [sp, #16]
 8000e8e:	2330      	movs	r3, #48	; 0x30
 8000e90:	9301      	str	r3, [sp, #4]
 8000e92:	f000 f91b 	bl	80010cc <HAL_GPIO_Init>
 8000e96:	f7ff ffe5 	bl	8000e64 <SetHighSCL>
 8000e9a:	f7ff ffb5 	bl	8000e08 <SetLowSDA>
 8000e9e:	f7ff ffc5 	bl	8000e2c <SetHighSDA>
 8000ea2:	b007      	add	sp, #28
 8000ea4:	bd00      	pop	{pc}
 8000ea6:	46c0      	nop			; (mov r8, r8)
 8000ea8:	40021000 	.word	0x40021000
 8000eac:	50000400 	.word	0x50000400

08000eb0 <i2cStart>:
 8000eb0:	b508      	push	{r3, lr}
 8000eb2:	f7ff ffd7 	bl	8000e64 <SetHighSCL>
 8000eb6:	f7ff ffb9 	bl	8000e2c <SetHighSDA>
 8000eba:	f7ff ffd3 	bl	8000e64 <SetHighSCL>
 8000ebe:	f7ff ffa3 	bl	8000e08 <SetLowSDA>
 8000ec2:	f7ff ffc7 	bl	8000e54 <SetLowSCL>
 8000ec6:	f7ff ffb1 	bl	8000e2c <SetHighSDA>
 8000eca:	bd08      	pop	{r3, pc}

08000ecc <i2cStop>:
 8000ecc:	b508      	push	{r3, lr}
 8000ece:	f7ff ffc1 	bl	8000e54 <SetLowSCL>
 8000ed2:	f7ff ff99 	bl	8000e08 <SetLowSDA>
 8000ed6:	f7ff ffc5 	bl	8000e64 <SetHighSCL>
 8000eda:	f7ff ff95 	bl	8000e08 <SetLowSDA>
 8000ede:	f7ff ffc1 	bl	8000e64 <SetHighSCL>
 8000ee2:	f7ff ffa3 	bl	8000e2c <SetHighSDA>
 8000ee6:	bd08      	pop	{r3, pc}

08000ee8 <i2cWrite>:
 8000ee8:	b538      	push	{r3, r4, r5, lr}
 8000eea:	1c05      	adds	r5, r0, #0
 8000eec:	2408      	movs	r4, #8
 8000eee:	f7ff ffb1 	bl	8000e54 <SetLowSCL>
 8000ef2:	b26b      	sxtb	r3, r5
 8000ef4:	2b00      	cmp	r3, #0
 8000ef6:	da02      	bge.n	8000efe <i2cWrite+0x16>
 8000ef8:	f7ff ff98 	bl	8000e2c <SetHighSDA>
 8000efc:	e001      	b.n	8000f02 <i2cWrite+0x1a>
 8000efe:	f7ff ff83 	bl	8000e08 <SetLowSDA>
 8000f02:	3c01      	subs	r4, #1
 8000f04:	006d      	lsls	r5, r5, #1
 8000f06:	b2e4      	uxtb	r4, r4
 8000f08:	f7ff ffac 	bl	8000e64 <SetHighSCL>
 8000f0c:	b2ed      	uxtb	r5, r5
 8000f0e:	2c00      	cmp	r4, #0
 8000f10:	d1ed      	bne.n	8000eee <i2cWrite+0x6>
 8000f12:	f7ff ff9f 	bl	8000e54 <SetLowSCL>
 8000f16:	f7ff ff89 	bl	8000e2c <SetHighSDA>
 8000f1a:	f7ff ffa3 	bl	8000e64 <SetHighSCL>
 8000f1e:	4b04      	ldr	r3, [pc, #16]	; (8000f30 <i2cWrite+0x48>)
 8000f20:	691c      	ldr	r4, [r3, #16]
 8000f22:	f7ff ff97 	bl	8000e54 <SetLowSCL>
 8000f26:	46c0      	nop			; (mov r8, r8)
 8000f28:	2001      	movs	r0, #1
 8000f2a:	0924      	lsrs	r4, r4, #4
 8000f2c:	43a0      	bics	r0, r4
 8000f2e:	bd38      	pop	{r3, r4, r5, pc}
 8000f30:	50000400 	.word	0x50000400

08000f34 <i2cRead>:
 8000f34:	b570      	push	{r4, r5, r6, lr}
 8000f36:	1c06      	adds	r6, r0, #0
 8000f38:	f7ff ff8c 	bl	8000e54 <SetLowSCL>
 8000f3c:	f7ff ff76 	bl	8000e2c <SetHighSDA>
 8000f40:	2508      	movs	r5, #8
 8000f42:	2400      	movs	r4, #0
 8000f44:	f7ff ff8e 	bl	8000e64 <SetHighSCL>
 8000f48:	4b0c      	ldr	r3, [pc, #48]	; (8000f7c <i2cRead+0x48>)
 8000f4a:	0064      	lsls	r4, r4, #1
 8000f4c:	691b      	ldr	r3, [r3, #16]
 8000f4e:	b2e4      	uxtb	r4, r4
 8000f50:	06da      	lsls	r2, r3, #27
 8000f52:	d501      	bpl.n	8000f58 <i2cRead+0x24>
 8000f54:	3401      	adds	r4, #1
 8000f56:	b2e4      	uxtb	r4, r4
 8000f58:	3d01      	subs	r5, #1
 8000f5a:	b2ed      	uxtb	r5, r5
 8000f5c:	f7ff ff7a 	bl	8000e54 <SetLowSCL>
 8000f60:	2d00      	cmp	r5, #0
 8000f62:	d1ef      	bne.n	8000f44 <i2cRead+0x10>
 8000f64:	2e00      	cmp	r6, #0
 8000f66:	d001      	beq.n	8000f6c <i2cRead+0x38>
 8000f68:	f7ff ff4e 	bl	8000e08 <SetLowSDA>
 8000f6c:	f7ff ff7a 	bl	8000e64 <SetHighSCL>
 8000f70:	f7ff ff70 	bl	8000e54 <SetLowSCL>
 8000f74:	46c0      	nop			; (mov r8, r8)
 8000f76:	1c20      	adds	r0, r4, #0
 8000f78:	bd70      	pop	{r4, r5, r6, pc}
 8000f7a:	46c0      	nop			; (mov r8, r8)
 8000f7c:	50000400 	.word	0x50000400

08000f80 <i2c_write_reg>:
 8000f80:	b570      	push	{r4, r5, r6, lr}
 8000f82:	1c06      	adds	r6, r0, #0
 8000f84:	1c0d      	adds	r5, r1, #0
 8000f86:	1c14      	adds	r4, r2, #0
 8000f88:	f7ff ff92 	bl	8000eb0 <i2cStart>
 8000f8c:	1c30      	adds	r0, r6, #0
 8000f8e:	f7ff ffab 	bl	8000ee8 <i2cWrite>
 8000f92:	1c28      	adds	r0, r5, #0
 8000f94:	f7ff ffa8 	bl	8000ee8 <i2cWrite>
 8000f98:	1c20      	adds	r0, r4, #0
 8000f9a:	f7ff ffa5 	bl	8000ee8 <i2cWrite>
 8000f9e:	f7ff ff95 	bl	8000ecc <i2cStop>
 8000fa2:	bd70      	pop	{r4, r5, r6, pc}

08000fa4 <i2c_read_reg>:
 8000fa4:	b538      	push	{r3, r4, r5, lr}
 8000fa6:	1c04      	adds	r4, r0, #0
 8000fa8:	1c0d      	adds	r5, r1, #0
 8000faa:	f7ff ff81 	bl	8000eb0 <i2cStart>
 8000fae:	1c20      	adds	r0, r4, #0
 8000fb0:	f7ff ff9a 	bl	8000ee8 <i2cWrite>
 8000fb4:	1c28      	adds	r0, r5, #0
 8000fb6:	f7ff ff97 	bl	8000ee8 <i2cWrite>
 8000fba:	f7ff ff79 	bl	8000eb0 <i2cStart>
 8000fbe:	2001      	movs	r0, #1
 8000fc0:	4320      	orrs	r0, r4
 8000fc2:	f7ff ff91 	bl	8000ee8 <i2cWrite>
 8000fc6:	2000      	movs	r0, #0
 8000fc8:	f7ff ffb4 	bl	8000f34 <i2cRead>
 8000fcc:	1c04      	adds	r4, r0, #0
 8000fce:	f7ff ff7d 	bl	8000ecc <i2cStop>
 8000fd2:	1c20      	adds	r0, r4, #0
 8000fd4:	bd38      	pop	{r3, r4, r5, pc}

08000fd6 <__get_MSP>:
 8000fd6:	f3ef 8008 	mrs	r0, MSP
 8000fda:	1c00      	adds	r0, r0, #0
 8000fdc:	4770      	bx	lr
	...

08000fe0 <sys_tick_init>:
 8000fe0:	4b08      	ldr	r3, [pc, #32]	; (8001004 <sys_tick_init+0x24>)
 8000fe2:	22c0      	movs	r2, #192	; 0xc0
 8000fe4:	6a19      	ldr	r1, [r3, #32]
 8000fe6:	0612      	lsls	r2, r2, #24
 8000fe8:	0209      	lsls	r1, r1, #8
 8000fea:	0a09      	lsrs	r1, r1, #8
 8000fec:	430a      	orrs	r2, r1
 8000fee:	621a      	str	r2, [r3, #32]
 8000ff0:	4b05      	ldr	r3, [pc, #20]	; (8001008 <sys_tick_init+0x28>)
 8000ff2:	22fa      	movs	r2, #250	; 0xfa
 8000ff4:	01d2      	lsls	r2, r2, #7
 8000ff6:	605a      	str	r2, [r3, #4]
 8000ff8:	2200      	movs	r2, #0
 8000ffa:	609a      	str	r2, [r3, #8]
 8000ffc:	2207      	movs	r2, #7
 8000ffe:	601a      	str	r2, [r3, #0]
 8001000:	4770      	bx	lr
 8001002:	46c0      	nop			; (mov r8, r8)
 8001004:	e000ed00 	.word	0xe000ed00
 8001008:	e000e010 	.word	0xe000e010

0800100c <sleep>:
 800100c:	bf30      	wfi
 800100e:	4770      	bx	lr

08001010 <HAL_NVIC_EnableIRQ>:
 8001010:	231f      	movs	r3, #31
 8001012:	4018      	ands	r0, r3
 8001014:	2301      	movs	r3, #1
 8001016:	4083      	lsls	r3, r0
 8001018:	1c18      	adds	r0, r3, #0
 800101a:	4b01      	ldr	r3, [pc, #4]	; (8001020 <HAL_NVIC_EnableIRQ+0x10>)
 800101c:	6018      	str	r0, [r3, #0]
 800101e:	4770      	bx	lr
 8001020:	e000e100 	.word	0xe000e100

08001024 <TIM_Base_SetConfig>:
 8001024:	2280      	movs	r2, #128	; 0x80
 8001026:	b510      	push	{r4, lr}
 8001028:	6803      	ldr	r3, [r0, #0]
 800102a:	05d2      	lsls	r2, r2, #23
 800102c:	4290      	cmp	r0, r2
 800102e:	d005      	beq.n	800103c <TIM_Base_SetConfig+0x18>
 8001030:	4c0f      	ldr	r4, [pc, #60]	; (8001070 <TIM_Base_SetConfig+0x4c>)
 8001032:	42a0      	cmp	r0, r4
 8001034:	d002      	beq.n	800103c <TIM_Base_SetConfig+0x18>
 8001036:	4c0f      	ldr	r4, [pc, #60]	; (8001074 <TIM_Base_SetConfig+0x50>)
 8001038:	42a0      	cmp	r0, r4
 800103a:	d10b      	bne.n	8001054 <TIM_Base_SetConfig+0x30>
 800103c:	2470      	movs	r4, #112	; 0x70
 800103e:	43a3      	bics	r3, r4
 8001040:	684c      	ldr	r4, [r1, #4]
 8001042:	4323      	orrs	r3, r4
 8001044:	4290      	cmp	r0, r2
 8001046:	d00d      	beq.n	8001064 <TIM_Base_SetConfig+0x40>
 8001048:	4a09      	ldr	r2, [pc, #36]	; (8001070 <TIM_Base_SetConfig+0x4c>)
 800104a:	4290      	cmp	r0, r2
 800104c:	d00a      	beq.n	8001064 <TIM_Base_SetConfig+0x40>
 800104e:	4a09      	ldr	r2, [pc, #36]	; (8001074 <TIM_Base_SetConfig+0x50>)
 8001050:	4290      	cmp	r0, r2
 8001052:	d007      	beq.n	8001064 <TIM_Base_SetConfig+0x40>
 8001054:	6003      	str	r3, [r0, #0]
 8001056:	688a      	ldr	r2, [r1, #8]
 8001058:	680b      	ldr	r3, [r1, #0]
 800105a:	62c2      	str	r2, [r0, #44]	; 0x2c
 800105c:	6283      	str	r3, [r0, #40]	; 0x28
 800105e:	2301      	movs	r3, #1
 8001060:	6143      	str	r3, [r0, #20]
 8001062:	bd10      	pop	{r4, pc}
 8001064:	4a04      	ldr	r2, [pc, #16]	; (8001078 <TIM_Base_SetConfig+0x54>)
 8001066:	4013      	ands	r3, r2
 8001068:	68ca      	ldr	r2, [r1, #12]
 800106a:	4313      	orrs	r3, r2
 800106c:	e7f2      	b.n	8001054 <TIM_Base_SetConfig+0x30>
 800106e:	46c0      	nop			; (mov r8, r8)
 8001070:	40010800 	.word	0x40010800
 8001074:	40011400 	.word	0x40011400
 8001078:	fffffcff 	.word	0xfffffcff

0800107c <HAL_TIM_Base_MspInit>:
 800107c:	4770      	bx	lr

0800107e <HAL_TIM_Base_Init>:
 800107e:	b538      	push	{r3, r4, r5, lr}
 8001080:	1e04      	subs	r4, r0, #0
 8001082:	d016      	beq.n	80010b2 <HAL_TIM_Base_Init+0x34>
 8001084:	6b43      	ldr	r3, [r0, #52]	; 0x34
 8001086:	041b      	lsls	r3, r3, #16
 8001088:	0e1b      	lsrs	r3, r3, #24
 800108a:	b2da      	uxtb	r2, r3
 800108c:	2a00      	cmp	r2, #0
 800108e:	d104      	bne.n	800109a <HAL_TIM_Base_Init+0x1c>
 8001090:	1c02      	adds	r2, r0, #0
 8001092:	3234      	adds	r2, #52	; 0x34
 8001094:	7013      	strb	r3, [r2, #0]
 8001096:	f7ff fff1 	bl	800107c <HAL_TIM_Base_MspInit>
 800109a:	1c25      	adds	r5, r4, #0
 800109c:	2302      	movs	r3, #2
 800109e:	3535      	adds	r5, #53	; 0x35
 80010a0:	1c21      	adds	r1, r4, #0
 80010a2:	702b      	strb	r3, [r5, #0]
 80010a4:	c901      	ldmia	r1!, {r0}
 80010a6:	f7ff ffbd 	bl	8001024 <TIM_Base_SetConfig>
 80010aa:	2301      	movs	r3, #1
 80010ac:	702b      	strb	r3, [r5, #0]
 80010ae:	2000      	movs	r0, #0
 80010b0:	e000      	b.n	80010b4 <HAL_TIM_Base_Init+0x36>
 80010b2:	2001      	movs	r0, #1
 80010b4:	bd38      	pop	{r3, r4, r5, pc}

080010b6 <HAL_TIM_Base_Start_IT>:
 80010b6:	6803      	ldr	r3, [r0, #0]
 80010b8:	2201      	movs	r2, #1
 80010ba:	68d9      	ldr	r1, [r3, #12]
 80010bc:	2000      	movs	r0, #0
 80010be:	4311      	orrs	r1, r2
 80010c0:	60d9      	str	r1, [r3, #12]
 80010c2:	6819      	ldr	r1, [r3, #0]
 80010c4:	430a      	orrs	r2, r1
 80010c6:	601a      	str	r2, [r3, #0]
 80010c8:	4770      	bx	lr
	...

080010cc <HAL_GPIO_Init>:
 80010cc:	b5f0      	push	{r4, r5, r6, r7, lr}
 80010ce:	680a      	ldr	r2, [r1, #0]
 80010d0:	b085      	sub	sp, #20
 80010d2:	9203      	str	r2, [sp, #12]
 80010d4:	2300      	movs	r3, #0
 80010d6:	9a03      	ldr	r2, [sp, #12]
 80010d8:	40da      	lsrs	r2, r3
 80010da:	d100      	bne.n	80010de <HAL_GPIO_Init+0x12>
 80010dc:	e097      	b.n	800120e <HAL_GPIO_Init+0x142>
 80010de:	2201      	movs	r2, #1
 80010e0:	9c03      	ldr	r4, [sp, #12]
 80010e2:	409a      	lsls	r2, r3
 80010e4:	4014      	ands	r4, r2
 80010e6:	46a4      	mov	ip, r4
 80010e8:	d100      	bne.n	80010ec <HAL_GPIO_Init+0x20>
 80010ea:	e08e      	b.n	800120a <HAL_GPIO_Init+0x13e>
 80010ec:	684a      	ldr	r2, [r1, #4]
 80010ee:	2410      	movs	r4, #16
 80010f0:	1c15      	adds	r5, r2, #0
 80010f2:	43a5      	bics	r5, r4
 80010f4:	1c2c      	adds	r4, r5, #0
 80010f6:	3d01      	subs	r5, #1
 80010f8:	2c02      	cmp	r4, #2
 80010fa:	d10e      	bne.n	800111a <HAL_GPIO_Init+0x4e>
 80010fc:	08dc      	lsrs	r4, r3, #3
 80010fe:	00a4      	lsls	r4, r4, #2
 8001100:	2507      	movs	r5, #7
 8001102:	1904      	adds	r4, r0, r4
 8001104:	401d      	ands	r5, r3
 8001106:	6a26      	ldr	r6, [r4, #32]
 8001108:	00ad      	lsls	r5, r5, #2
 800110a:	270f      	movs	r7, #15
 800110c:	40af      	lsls	r7, r5
 800110e:	43be      	bics	r6, r7
 8001110:	690f      	ldr	r7, [r1, #16]
 8001112:	40af      	lsls	r7, r5
 8001114:	433e      	orrs	r6, r7
 8001116:	6226      	str	r6, [r4, #32]
 8001118:	e001      	b.n	800111e <HAL_GPIO_Init+0x52>
 800111a:	2d01      	cmp	r5, #1
 800111c:	d812      	bhi.n	8001144 <HAL_GPIO_Init+0x78>
 800111e:	6886      	ldr	r6, [r0, #8]
 8001120:	005c      	lsls	r4, r3, #1
 8001122:	2503      	movs	r5, #3
 8001124:	40a5      	lsls	r5, r4
 8001126:	43ae      	bics	r6, r5
 8001128:	68cd      	ldr	r5, [r1, #12]
 800112a:	40a5      	lsls	r5, r4
 800112c:	1c34      	adds	r4, r6, #0
 800112e:	432c      	orrs	r4, r5
 8001130:	6084      	str	r4, [r0, #8]
 8001132:	6844      	ldr	r4, [r0, #4]
 8001134:	2501      	movs	r5, #1
 8001136:	409d      	lsls	r5, r3
 8001138:	43ac      	bics	r4, r5
 800113a:	06d5      	lsls	r5, r2, #27
 800113c:	0fed      	lsrs	r5, r5, #31
 800113e:	409d      	lsls	r5, r3
 8001140:	432c      	orrs	r4, r5
 8001142:	6044      	str	r4, [r0, #4]
 8001144:	2403      	movs	r4, #3
 8001146:	005d      	lsls	r5, r3, #1
 8001148:	1c26      	adds	r6, r4, #0
 800114a:	6807      	ldr	r7, [r0, #0]
 800114c:	40ae      	lsls	r6, r5
 800114e:	43f6      	mvns	r6, r6
 8001150:	9600      	str	r6, [sp, #0]
 8001152:	403e      	ands	r6, r7
 8001154:	1c17      	adds	r7, r2, #0
 8001156:	4027      	ands	r7, r4
 8001158:	40af      	lsls	r7, r5
 800115a:	4337      	orrs	r7, r6
 800115c:	6007      	str	r7, [r0, #0]
 800115e:	68c7      	ldr	r7, [r0, #12]
 8001160:	9e00      	ldr	r6, [sp, #0]
 8001162:	403e      	ands	r6, r7
 8001164:	688f      	ldr	r7, [r1, #8]
 8001166:	40af      	lsls	r7, r5
 8001168:	433e      	orrs	r6, r7
 800116a:	60c6      	str	r6, [r0, #12]
 800116c:	00d5      	lsls	r5, r2, #3
 800116e:	d54c      	bpl.n	800120a <HAL_GPIO_Init+0x13e>
 8001170:	4d28      	ldr	r5, [pc, #160]	; (8001214 <HAL_GPIO_Init+0x148>)
 8001172:	2601      	movs	r6, #1
 8001174:	6b6f      	ldr	r7, [r5, #52]	; 0x34
 8001176:	401c      	ands	r4, r3
 8001178:	4337      	orrs	r7, r6
 800117a:	636f      	str	r7, [r5, #52]	; 0x34
 800117c:	4f26      	ldr	r7, [pc, #152]	; (8001218 <HAL_GPIO_Init+0x14c>)
 800117e:	089d      	lsrs	r5, r3, #2
 8001180:	00ad      	lsls	r5, r5, #2
 8001182:	19ed      	adds	r5, r5, r7
 8001184:	68af      	ldr	r7, [r5, #8]
 8001186:	00a4      	lsls	r4, r4, #2
 8001188:	9402      	str	r4, [sp, #8]
 800118a:	9701      	str	r7, [sp, #4]
 800118c:	9f02      	ldr	r7, [sp, #8]
 800118e:	240f      	movs	r4, #15
 8001190:	40bc      	lsls	r4, r7
 8001192:	9f01      	ldr	r7, [sp, #4]
 8001194:	43a7      	bics	r7, r4
 8001196:	24a0      	movs	r4, #160	; 0xa0
 8001198:	05e4      	lsls	r4, r4, #23
 800119a:	42a0      	cmp	r0, r4
 800119c:	d00b      	beq.n	80011b6 <HAL_GPIO_Init+0xea>
 800119e:	4c1f      	ldr	r4, [pc, #124]	; (800121c <HAL_GPIO_Init+0x150>)
 80011a0:	42a0      	cmp	r0, r4
 80011a2:	d00b      	beq.n	80011bc <HAL_GPIO_Init+0xf0>
 80011a4:	4c1e      	ldr	r4, [pc, #120]	; (8001220 <HAL_GPIO_Init+0x154>)
 80011a6:	42a0      	cmp	r0, r4
 80011a8:	d007      	beq.n	80011ba <HAL_GPIO_Init+0xee>
 80011aa:	4c1e      	ldr	r4, [pc, #120]	; (8001224 <HAL_GPIO_Init+0x158>)
 80011ac:	1906      	adds	r6, r0, r4
 80011ae:	1e74      	subs	r4, r6, #1
 80011b0:	41a6      	sbcs	r6, r4
 80011b2:	3605      	adds	r6, #5
 80011b4:	e002      	b.n	80011bc <HAL_GPIO_Init+0xf0>
 80011b6:	2600      	movs	r6, #0
 80011b8:	e000      	b.n	80011bc <HAL_GPIO_Init+0xf0>
 80011ba:	2602      	movs	r6, #2
 80011bc:	9c02      	ldr	r4, [sp, #8]
 80011be:	40a6      	lsls	r6, r4
 80011c0:	4337      	orrs	r7, r6
 80011c2:	4c19      	ldr	r4, [pc, #100]	; (8001228 <HAL_GPIO_Init+0x15c>)
 80011c4:	60af      	str	r7, [r5, #8]
 80011c6:	4667      	mov	r7, ip
 80011c8:	6826      	ldr	r6, [r4, #0]
 80011ca:	43fd      	mvns	r5, r7
 80011cc:	03d7      	lsls	r7, r2, #15
 80011ce:	d401      	bmi.n	80011d4 <HAL_GPIO_Init+0x108>
 80011d0:	402e      	ands	r6, r5
 80011d2:	e001      	b.n	80011d8 <HAL_GPIO_Init+0x10c>
 80011d4:	4667      	mov	r7, ip
 80011d6:	433e      	orrs	r6, r7
 80011d8:	6026      	str	r6, [r4, #0]
 80011da:	6866      	ldr	r6, [r4, #4]
 80011dc:	0397      	lsls	r7, r2, #14
 80011de:	d401      	bmi.n	80011e4 <HAL_GPIO_Init+0x118>
 80011e0:	402e      	ands	r6, r5
 80011e2:	e001      	b.n	80011e8 <HAL_GPIO_Init+0x11c>
 80011e4:	4667      	mov	r7, ip
 80011e6:	433e      	orrs	r6, r7
 80011e8:	6066      	str	r6, [r4, #4]
 80011ea:	68a6      	ldr	r6, [r4, #8]
 80011ec:	02d7      	lsls	r7, r2, #11
 80011ee:	d401      	bmi.n	80011f4 <HAL_GPIO_Init+0x128>
 80011f0:	402e      	ands	r6, r5
 80011f2:	e001      	b.n	80011f8 <HAL_GPIO_Init+0x12c>
 80011f4:	4667      	mov	r7, ip
 80011f6:	433e      	orrs	r6, r7
 80011f8:	60a6      	str	r6, [r4, #8]
 80011fa:	68e6      	ldr	r6, [r4, #12]
 80011fc:	0297      	lsls	r7, r2, #10
 80011fe:	d401      	bmi.n	8001204 <HAL_GPIO_Init+0x138>
 8001200:	4035      	ands	r5, r6
 8001202:	e001      	b.n	8001208 <HAL_GPIO_Init+0x13c>
 8001204:	4665      	mov	r5, ip
 8001206:	4335      	orrs	r5, r6
 8001208:	60e5      	str	r5, [r4, #12]
 800120a:	3301      	adds	r3, #1
 800120c:	e763      	b.n	80010d6 <HAL_GPIO_Init+0xa>
 800120e:	b005      	add	sp, #20
 8001210:	bdf0      	pop	{r4, r5, r6, r7, pc}
 8001212:	46c0      	nop			; (mov r8, r8)
 8001214:	40021000 	.word	0x40021000
 8001218:	40010000 	.word	0x40010000
 800121c:	50000400 	.word	0x50000400
 8001220:	50000800 	.word	0x50000800
 8001224:	afffe400 	.word	0xafffe400
 8001228:	40010400 	.word	0x40010400

0800122c <lib_low_level_init>:
 800122c:	b508      	push	{r3, lr}
 800122e:	f000 f807 	bl	8001240 <gpio_init>
 8001232:	f7ff fda9 	bl	8000d88 <uart_init>
 8001236:	f7ff fd23 	bl	8000c80 <timer_init>
 800123a:	f7ff fe1b 	bl	8000e74 <i2c_init>
 800123e:	bd08      	pop	{r3, pc}

08001240 <gpio_init>:
 8001240:	b530      	push	{r4, r5, lr}
 8001242:	4a0a      	ldr	r2, [pc, #40]	; (800126c <gpio_init+0x2c>)
 8001244:	2303      	movs	r3, #3
 8001246:	6ad1      	ldr	r1, [r2, #44]	; 0x2c
 8001248:	4c09      	ldr	r4, [pc, #36]	; (8001270 <gpio_init+0x30>)
 800124a:	b087      	sub	sp, #28
 800124c:	4319      	orrs	r1, r3
 800124e:	62d1      	str	r1, [r2, #44]	; 0x2c
 8001250:	2508      	movs	r5, #8
 8001252:	2201      	movs	r2, #1
 8001254:	1c20      	adds	r0, r4, #0
 8001256:	a901      	add	r1, sp, #4
 8001258:	9202      	str	r2, [sp, #8]
 800125a:	9203      	str	r2, [sp, #12]
 800125c:	9304      	str	r3, [sp, #16]
 800125e:	9501      	str	r5, [sp, #4]
 8001260:	f7ff ff34 	bl	80010cc <HAL_GPIO_Init>
 8001264:	61a5      	str	r5, [r4, #24]
 8001266:	b007      	add	sp, #28
 8001268:	bd30      	pop	{r4, r5, pc}
 800126a:	46c0      	nop			; (mov r8, r8)
 800126c:	40021000 	.word	0x40021000
 8001270:	50000400 	.word	0x50000400

08001274 <led_on>:
 8001274:	4b01      	ldr	r3, [pc, #4]	; (800127c <led_on+0x8>)
 8001276:	6298      	str	r0, [r3, #40]	; 0x28
 8001278:	4770      	bx	lr
 800127a:	46c0      	nop			; (mov r8, r8)
 800127c:	50000400 	.word	0x50000400

08001280 <led_off>:
 8001280:	4b01      	ldr	r3, [pc, #4]	; (8001288 <led_off+0x8>)
 8001282:	6198      	str	r0, [r3, #24]
 8001284:	4770      	bx	lr
 8001286:	46c0      	nop			; (mov r8, r8)
 8001288:	50000400 	.word	0x50000400

0800128c <Default_Handler>:
 800128c:	46c0      	nop			; (mov r8, r8)
 800128e:	e7fd      	b.n	800128c <Default_Handler>

08001290 <HardFault_Handler>:
 8001290:	2008      	movs	r0, #8
 8001292:	f7ff ffef 	bl	8001274 <led_on>
 8001296:	4b07      	ldr	r3, [pc, #28]	; (80012b4 <HardFault_Handler+0x24>)
 8001298:	3b01      	subs	r3, #1
 800129a:	2b00      	cmp	r3, #0
 800129c:	d001      	beq.n	80012a2 <HardFault_Handler+0x12>
 800129e:	46c0      	nop			; (mov r8, r8)
 80012a0:	e7fa      	b.n	8001298 <HardFault_Handler+0x8>
 80012a2:	2008      	movs	r0, #8
 80012a4:	f7ff ffec 	bl	8001280 <led_off>
 80012a8:	4b02      	ldr	r3, [pc, #8]	; (80012b4 <HardFault_Handler+0x24>)
 80012aa:	3b01      	subs	r3, #1
 80012ac:	2b00      	cmp	r3, #0
 80012ae:	d0ef      	beq.n	8001290 <HardFault_Handler>
 80012b0:	46c0      	nop			; (mov r8, r8)
 80012b2:	e7fa      	b.n	80012aa <HardFault_Handler+0x1a>
 80012b4:	000186a1 	.word	0x000186a1

080012b8 <_reset_init>:
 80012b8:	4a07      	ldr	r2, [pc, #28]	; (80012d8 <_reset_init+0x20>)
 80012ba:	4908      	ldr	r1, [pc, #32]	; (80012dc <_reset_init+0x24>)
 80012bc:	2300      	movs	r3, #0
 80012be:	1a89      	subs	r1, r1, r2
 80012c0:	1089      	asrs	r1, r1, #2
 80012c2:	1c10      	adds	r0, r2, #0
 80012c4:	428b      	cmp	r3, r1
 80012c6:	d005      	beq.n	80012d4 <_reset_init+0x1c>
 80012c8:	4c05      	ldr	r4, [pc, #20]	; (80012e0 <_reset_init+0x28>)
 80012ca:	009a      	lsls	r2, r3, #2
 80012cc:	58a4      	ldr	r4, [r4, r2]
 80012ce:	3301      	adds	r3, #1
 80012d0:	5084      	str	r4, [r0, r2]
 80012d2:	e7f7      	b.n	80012c4 <_reset_init+0xc>
 80012d4:	f7ff fcbe 	bl	8000c54 <main>
 80012d8:	20000000 	.word	0x20000000
 80012dc:	20000000 	.word	0x20000000
 80012e0:	08001b10 	.word	0x08001b10

080012e4 <__aeabi_uidiv>:
 80012e4:	2900      	cmp	r1, #0
 80012e6:	d034      	beq.n	8001352 <.udivsi3_skip_div0_test+0x6a>

080012e8 <.udivsi3_skip_div0_test>:
 80012e8:	2301      	movs	r3, #1
 80012ea:	2200      	movs	r2, #0
 80012ec:	b410      	push	{r4}
 80012ee:	4288      	cmp	r0, r1
 80012f0:	d32c      	bcc.n	800134c <.udivsi3_skip_div0_test+0x64>
 80012f2:	2401      	movs	r4, #1
 80012f4:	0724      	lsls	r4, r4, #28
 80012f6:	42a1      	cmp	r1, r4
 80012f8:	d204      	bcs.n	8001304 <.udivsi3_skip_div0_test+0x1c>
 80012fa:	4281      	cmp	r1, r0
 80012fc:	d202      	bcs.n	8001304 <.udivsi3_skip_div0_test+0x1c>
 80012fe:	0109      	lsls	r1, r1, #4
 8001300:	011b      	lsls	r3, r3, #4
 8001302:	e7f8      	b.n	80012f6 <.udivsi3_skip_div0_test+0xe>
 8001304:	00e4      	lsls	r4, r4, #3
 8001306:	42a1      	cmp	r1, r4
 8001308:	d204      	bcs.n	8001314 <.udivsi3_skip_div0_test+0x2c>
 800130a:	4281      	cmp	r1, r0
 800130c:	d202      	bcs.n	8001314 <.udivsi3_skip_div0_test+0x2c>
 800130e:	0049      	lsls	r1, r1, #1
 8001310:	005b      	lsls	r3, r3, #1
 8001312:	e7f8      	b.n	8001306 <.udivsi3_skip_div0_test+0x1e>
 8001314:	4288      	cmp	r0, r1
 8001316:	d301      	bcc.n	800131c <.udivsi3_skip_div0_test+0x34>
 8001318:	1a40      	subs	r0, r0, r1
 800131a:	431a      	orrs	r2, r3
 800131c:	084c      	lsrs	r4, r1, #1
 800131e:	42a0      	cmp	r0, r4
 8001320:	d302      	bcc.n	8001328 <.udivsi3_skip_div0_test+0x40>
 8001322:	1b00      	subs	r0, r0, r4
 8001324:	085c      	lsrs	r4, r3, #1
 8001326:	4322      	orrs	r2, r4
 8001328:	088c      	lsrs	r4, r1, #2
 800132a:	42a0      	cmp	r0, r4
 800132c:	d302      	bcc.n	8001334 <.udivsi3_skip_div0_test+0x4c>
 800132e:	1b00      	subs	r0, r0, r4
 8001330:	089c      	lsrs	r4, r3, #2
 8001332:	4322      	orrs	r2, r4
 8001334:	08cc      	lsrs	r4, r1, #3
 8001336:	42a0      	cmp	r0, r4
 8001338:	d302      	bcc.n	8001340 <.udivsi3_skip_div0_test+0x58>
 800133a:	1b00      	subs	r0, r0, r4
 800133c:	08dc      	lsrs	r4, r3, #3
 800133e:	4322      	orrs	r2, r4
 8001340:	2800      	cmp	r0, #0
 8001342:	d003      	beq.n	800134c <.udivsi3_skip_div0_test+0x64>
 8001344:	091b      	lsrs	r3, r3, #4
 8001346:	d001      	beq.n	800134c <.udivsi3_skip_div0_test+0x64>
 8001348:	0909      	lsrs	r1, r1, #4
 800134a:	e7e3      	b.n	8001314 <.udivsi3_skip_div0_test+0x2c>
 800134c:	1c10      	adds	r0, r2, #0
 800134e:	bc10      	pop	{r4}
 8001350:	4770      	bx	lr
 8001352:	2800      	cmp	r0, #0
 8001354:	d001      	beq.n	800135a <.udivsi3_skip_div0_test+0x72>
 8001356:	2000      	movs	r0, #0
 8001358:	43c0      	mvns	r0, r0
 800135a:	b407      	push	{r0, r1, r2}
 800135c:	4802      	ldr	r0, [pc, #8]	; (8001368 <.udivsi3_skip_div0_test+0x80>)
 800135e:	a102      	add	r1, pc, #8	; (adr r1, 8001368 <.udivsi3_skip_div0_test+0x80>)
 8001360:	1840      	adds	r0, r0, r1
 8001362:	9002      	str	r0, [sp, #8]
 8001364:	bd03      	pop	{r0, r1, pc}
 8001366:	46c0      	nop			; (mov r8, r8)
 8001368:	000000d9 	.word	0x000000d9

0800136c <__aeabi_uidivmod>:
 800136c:	2900      	cmp	r1, #0
 800136e:	d0f0      	beq.n	8001352 <.udivsi3_skip_div0_test+0x6a>
 8001370:	b503      	push	{r0, r1, lr}
 8001372:	f7ff ffb9 	bl	80012e8 <.udivsi3_skip_div0_test>
 8001376:	bc0e      	pop	{r1, r2, r3}
 8001378:	4342      	muls	r2, r0
 800137a:	1a89      	subs	r1, r1, r2
 800137c:	4718      	bx	r3
 800137e:	46c0      	nop			; (mov r8, r8)

08001380 <__aeabi_idiv>:
 8001380:	2900      	cmp	r1, #0
 8001382:	d041      	beq.n	8001408 <.divsi3_skip_div0_test+0x84>

08001384 <.divsi3_skip_div0_test>:
 8001384:	b410      	push	{r4}
 8001386:	1c04      	adds	r4, r0, #0
 8001388:	404c      	eors	r4, r1
 800138a:	46a4      	mov	ip, r4
 800138c:	2301      	movs	r3, #1
 800138e:	2200      	movs	r2, #0
 8001390:	2900      	cmp	r1, #0
 8001392:	d500      	bpl.n	8001396 <.divsi3_skip_div0_test+0x12>
 8001394:	4249      	negs	r1, r1
 8001396:	2800      	cmp	r0, #0
 8001398:	d500      	bpl.n	800139c <.divsi3_skip_div0_test+0x18>
 800139a:	4240      	negs	r0, r0
 800139c:	4288      	cmp	r0, r1
 800139e:	d32c      	bcc.n	80013fa <.divsi3_skip_div0_test+0x76>
 80013a0:	2401      	movs	r4, #1
 80013a2:	0724      	lsls	r4, r4, #28
 80013a4:	42a1      	cmp	r1, r4
 80013a6:	d204      	bcs.n	80013b2 <.divsi3_skip_div0_test+0x2e>
 80013a8:	4281      	cmp	r1, r0
 80013aa:	d202      	bcs.n	80013b2 <.divsi3_skip_div0_test+0x2e>
 80013ac:	0109      	lsls	r1, r1, #4
 80013ae:	011b      	lsls	r3, r3, #4
 80013b0:	e7f8      	b.n	80013a4 <.divsi3_skip_div0_test+0x20>
 80013b2:	00e4      	lsls	r4, r4, #3
 80013b4:	42a1      	cmp	r1, r4
 80013b6:	d204      	bcs.n	80013c2 <.divsi3_skip_div0_test+0x3e>
 80013b8:	4281      	cmp	r1, r0
 80013ba:	d202      	bcs.n	80013c2 <.divsi3_skip_div0_test+0x3e>
 80013bc:	0049      	lsls	r1, r1, #1
 80013be:	005b      	lsls	r3, r3, #1
 80013c0:	e7f8      	b.n	80013b4 <.divsi3_skip_div0_test+0x30>
 80013c2:	4288      	cmp	r0, r1
 80013c4:	d301      	bcc.n	80013ca <.divsi3_skip_div0_test+0x46>
 80013c6:	1a40      	subs	r0, r0, r1
 80013c8:	431a      	orrs	r2, r3
 80013ca:	084c      	lsrs	r4, r1, #1
 80013cc:	42a0      	cmp	r0, r4
 80013ce:	d302      	bcc.n	80013d6 <.divsi3_skip_div0_test+0x52>
 80013d0:	1b00      	subs	r0, r0, r4
 80013d2:	085c      	lsrs	r4, r3, #1
 80013d4:	4322      	orrs	r2, r4
 80013d6:	088c      	lsrs	r4, r1, #2
 80013d8:	42a0      	cmp	r0, r4
 80013da:	d302      	bcc.n	80013e2 <.divsi3_skip_div0_test+0x5e>
 80013dc:	1b00      	subs	r0, r0, r4
 80013de:	089c      	lsrs	r4, r3, #2
 80013e0:	4322      	orrs	r2, r4
 80013e2:	08cc      	lsrs	r4, r1, #3
 80013e4:	42a0      	cmp	r0, r4
 80013e6:	d302      	bcc.n	80013ee <.divsi3_skip_div0_test+0x6a>
 80013e8:	1b00      	subs	r0, r0, r4
 80013ea:	08dc      	lsrs	r4, r3, #3
 80013ec:	4322      	orrs	r2, r4
 80013ee:	2800      	cmp	r0, #0
 80013f0:	d003      	beq.n	80013fa <.divsi3_skip_div0_test+0x76>
 80013f2:	091b      	lsrs	r3, r3, #4
 80013f4:	d001      	beq.n	80013fa <.divsi3_skip_div0_test+0x76>
 80013f6:	0909      	lsrs	r1, r1, #4
 80013f8:	e7e3      	b.n	80013c2 <.divsi3_skip_div0_test+0x3e>
 80013fa:	1c10      	adds	r0, r2, #0
 80013fc:	4664      	mov	r4, ip
 80013fe:	2c00      	cmp	r4, #0
 8001400:	d500      	bpl.n	8001404 <.divsi3_skip_div0_test+0x80>
 8001402:	4240      	negs	r0, r0
 8001404:	bc10      	pop	{r4}
 8001406:	4770      	bx	lr
 8001408:	2800      	cmp	r0, #0
 800140a:	d006      	beq.n	800141a <.divsi3_skip_div0_test+0x96>
 800140c:	db03      	blt.n	8001416 <.divsi3_skip_div0_test+0x92>
 800140e:	2000      	movs	r0, #0
 8001410:	43c0      	mvns	r0, r0
 8001412:	0840      	lsrs	r0, r0, #1
 8001414:	e001      	b.n	800141a <.divsi3_skip_div0_test+0x96>
 8001416:	2080      	movs	r0, #128	; 0x80
 8001418:	0600      	lsls	r0, r0, #24
 800141a:	b407      	push	{r0, r1, r2}
 800141c:	4802      	ldr	r0, [pc, #8]	; (8001428 <.divsi3_skip_div0_test+0xa4>)
 800141e:	a102      	add	r1, pc, #8	; (adr r1, 8001428 <.divsi3_skip_div0_test+0xa4>)
 8001420:	1840      	adds	r0, r0, r1
 8001422:	9002      	str	r0, [sp, #8]
 8001424:	bd03      	pop	{r0, r1, pc}
 8001426:	46c0      	nop			; (mov r8, r8)
 8001428:	00000019 	.word	0x00000019

0800142c <__aeabi_idivmod>:
 800142c:	2900      	cmp	r1, #0
 800142e:	d0eb      	beq.n	8001408 <.divsi3_skip_div0_test+0x84>
 8001430:	b503      	push	{r0, r1, lr}
 8001432:	f7ff ffa7 	bl	8001384 <.divsi3_skip_div0_test>
 8001436:	bc0e      	pop	{r1, r2, r3}
 8001438:	4342      	muls	r2, r0
 800143a:	1a89      	subs	r1, r1, r2
 800143c:	4718      	bx	r3
 800143e:	46c0      	nop			; (mov r8, r8)

08001440 <__aeabi_idiv0>:
 8001440:	4770      	bx	lr
 8001442:	46c0      	nop			; (mov r8, r8)

08001444 <_init>:
 8001444:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
 8001446:	46c0      	nop			; (mov r8, r8)
 8001448:	bcf8      	pop	{r3, r4, r5, r6, r7}
 800144a:	bc08      	pop	{r3}
 800144c:	469e      	mov	lr, r3
 800144e:	4770      	bx	lr

08001450 <_fini>:
 8001450:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
 8001452:	46c0      	nop			; (mov r8, r8)
 8001454:	bcf8      	pop	{r3, r4, r5, r6, r7}
 8001456:	bc08      	pop	{r3}
 8001458:	469e      	mov	lr, r3
 800145a:	4770      	bx	lr
 800145c:	69647473 	.word	0x69647473
 8001460:	6e69206f 	.word	0x6e69206f
 8001464:	64207469 	.word	0x64207469
 8001468:	0a656e6f 	.word	0x0a656e6f
	...

0800146d <font_data>:
	...
 800147d:	3c180000 18183c3c 18180018 00000000     ...<<<..........
 800148d:	63636300 00000022 00000000 00000000     .ccc"...........
 800149d:	36000000 36367f36 36367f36 00000000     ...66.666.66....
 80014ad:	633e0c0c 033e6061 3e634303 00000c0c     ..>ca`>..Cc>....
 80014bd:	00000000 06636100 6333180c 00000000     .....ac...3c....
 80014cd:	1c000000 3b1c3636 3b66666e 00000000     ....66.;nff;....
 80014dd:	30303000 00000060 00000000 00000000     .000`...........
 80014ed:	180c0000 30303018 0c181830 00000000     .....0000.......
 80014fd:	0c180000 0606060c 180c0c06 00000000     ................
 800150d:	00000000 ff3c6642 0042663c 00000000     ....Bf<.<fB.....
 800151d:	00000000 ff181818 00181818 00000000     ................
	...
 8001535:	18180000 00003018 00000000 ff000000     .....0..........
	...
 8001555:	18180000 00000000 03010000 381c0e07     ...............8
 8001565:	80c0e070 00000000 633e0000 6b6b6363     p.........>ccckk
 8001575:	3e636363 00000000 1c0c0000 0c0c0c3c     ccc>........<...
 8001585:	3f0c0c0c 00000000 633e0000 180c0603     ...?......>c....
 8001595:	7f636130 00000000 633e0000 031e0303     0ac.......>c....
 80015a5:	3e630303 00000000 0e060000 6666361e     ..c>.........6ff
 80015b5:	0f06067f 00000000 607f0000 037e6060     ...........```~.
 80015c5:	3e736303 00000000 301c0000 637e6060     .cs>.......0``~c
 80015d5:	3e636363 00000000 637f0000 0c060603     ccc>.......c....
 80015e5:	1818180c 00000000 633e0000 633e6363     ..........>ccc>c
 80015f5:	3e636363 00000000 633e0000 3f636363     ccc>......>cccc?
 8001605:	3c060303 00000000 00000000 00181800     ...<............
 8001615:	18180000 00000000 00000000 00181800     ................
 8001625:	18180000 00003018 06000000 6030180c     .....0........0`
 8001635:	060c1830 00000000 00000000 007e0000     0.............~.
 8001645:	00007e00 00000000 60000000 060c1830     .~.........`0...
 8001655:	6030180c 00000000 633e0000 0c0c0663     ..0`......>cc...
 8001665:	0c0c000c 00000000 633e0000 6b6b6f63     ..........>ccokk
 8001675:	3e60606e 00000000 1c080000 63636336     n``>........6ccc
 8001685:	6363637f 00000000 337e0000 333e3333     .ccc......~333>3
 8001695:	7e333333 00000000 331e0000 60606061     333~.......3a```
 80016a5:	1e336160 00000000 367c0000 33333333     `a3.......|63333
 80016b5:	7c363333 00000000 337f0000 343c3431     336|.......314<4
 80016c5:	7f333130 00000000 337f0000 343c3431     013........314<4
 80016d5:	78303030 00000000 331e0000 6f606061     000x.......3a``o
 80016e5:	1d376363 00000000 63630000 637f6363     cc7.......cccc.c
 80016f5:	63636363 00000000 183c0000 18181818     cccc......<.....
 8001705:	3c181818 00000000 060f0000 06060606     ...<............
 8001715:	3c666606 00000000 33730000 363c3636     .ff<......s366<6
 8001725:	73333336 00000000 30780000 30303030     633s......x00000
 8001735:	7f333130 00000000 77630000 63636b7f     013.......cw.kcc
 8001745:	63636363 00000000 63630000 6f7f7b73     cccc......ccs{.o
 8001755:	63636367 00000000 361c0000 63636363     gccc.......6cccc
 8001765:	1c366363 00000000 337e0000 303e3333     cc6.......~333>0
 8001775:	78303030 00000000 633e0000 63636363     000x......>ccccc
 8001785:	3e6f6b63 00000706 337e0000 363e3333     cko>......~333>6
 8001795:	73333336 00000000 633e0000 061c3063     633s......>cc0..
 80017a5:	3e636303 00000000 dbff0000 18181899     .cc>............
 80017b5:	3c181818 00000000 63630000 63636363     ...<......cccccc
 80017c5:	3e636363 00000000 63630000 63636363     ccc>......cccccc
 80017d5:	081c3663 00000000 63630000 6b636363     c6........ccccck
 80017e5:	36367f6b 00000000 c3c30000 18183c66     k.66........f<..
 80017f5:	c3c3663c 00000000 c3c30000 183c66c3     <f...........f<.
 8001805:	3c181818 00000000 637f0000 180c0643     ...<.......cC...
 8001815:	7f636130 00000000 303c0000 30303030     0ac.......<00000
 8001825:	3c303030 00000000 c0800000 1c3870e0     000<.........p8.
 8001835:	0103070e 00000000 0c3c0000 0c0c0c0c     ..........<.....
 8001845:	3c0c0c0c 00000000 63361c08 00000000     ...<......6c....
	...
 8001869:	000000ff 000c1818 00000000 00000000     ................
	...
 8001881:	06463c00 3b66663e 00000000 30700000     .<F.>ff;......p0
 8001891:	33363c30 6e333333 00000000 00000000     0<63333n........
 80018a1:	60633e00 3e636060 00000000 060e0000     .>c```c>........
 80018b1:	66361e06 3b666666 00000000 00000000     ..6ffff;........
 80018c1:	63633e00 3e63607e 00000000 361c0000     .>cc~`c>.......6
 80018d1:	307c3032 78303030 00000000 00000000     20|0000x........
 80018e1:	66663b00 063e6666 00003c66 30700000     .;ffff>.f<....p0
 80018f1:	333b3630 73333333 00000000 0c0c0000     06;3333s........
 8001901:	0c0c1c00 1e0c0c0c 00000000 06060000     ................
 8001911:	06060e00 66060606 00003c66 30700000     .......ff<....p0
 8001921:	36333330 7333363c 00000000 0c1c0000     0336<63s........
 8001931:	0c0c0c0c 1e0c0c0c 00000000 00000000     ................
 8001941:	6b7f6e00 6b6b6b6b 00000000 00000000     .n.kkkkk........
 8001951:	33336e00 33333333 00000000 00000000     .n333333........
 8001961:	63633e00 3e636363 00000000 00000000     .>ccccc>........
 8001971:	33336e00 303e3333 00007830 00000000     .n3333>00x......
 8001981:	66663b00 063e6666 00000f06 00000000     .;ffff>.........
 8001991:	333b6e00 78303030 00000000 00000000     .n;3000x........
 80019a1:	38633e00 3e63030e 00000000 18080000     .>c8..c>........
 80019b1:	18187e18 0e1b1818 00000000 00000000     .~..............
 80019c1:	66666600 3b666666 00000000 00000000     .ffffff;........
 80019d1:	36636300 081c1c36 00000000 00000000     .cc66...........
 80019e1:	63636300 367f6b6b 00000000 00000000     .ccckk.6........
 80019f1:	1c366300 63361c1c 00000000 00000000     .c6...6c........
 8001a01:	63636300 033f6363 00003c06 00000000     .ccccc?..<......
 8001a11:	0c667f00 7f633018 00000000 180e0000     ..f..0c.........
 8001a21:	18701818 0e181818 00000000 18180000     ..p.............
 8001a31:	00181818 18181818 00000018 18700000     ..............p.
 8001a41:	180e1818 70181818 00000000 6e3b0000     .......p......;n
	...
 8001a5d:	d8d87000 00000070 00000000 00000000     .p..p...........
 8001a6d:	3a207525 5b000a20 25206925 69252069     %u : ..[%i %i %i
 8001a7d:	0a00205d 636c6577 20656d6f 53206f74     ] ..welcome to S
 8001a8d:	68757a75 20534f61 205e5f5e 2e322e32     uzuhaOS ^_^ 2.2.
 8001a9d:	55420a30 20444c49 2072614d 32203431     0.BUILD Mar 14 2
 8001aad:	20363130 353a3132 37313a32 6f62000a     016 21:52:17..bo
 8001abd:	6e69746f 72662067 25206d6f 72000a75     oting from %u..r
 8001acd:	73206d61 74726174 20752520 6172000a     am start %u ..ra
 8001add:	6973206d 2520657a 000a2075 206d6172     m size %u ..ram 
 8001aed:	65657266 20752520 6568000a 73207061     free %u ..heap s
 8001afd:	74726174 20752520 0a0a000a 00000000              tart %u .......

08001b0c <__EH_FRAME_BEGIN__>:
 8001b0c:	00000000                                ....
