
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
 80000e6:	f001 f841 	bl	800116c <sleep>
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
 80001b4:	b508      	push	{r3, lr}
 80001b6:	f000 ffdb 	bl	8001170 <sys_tick_trigger>
 80001ba:	bd08      	pop	{r3, pc}

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
 80001d0:	20000070 	.word	0x20000070

080001d4 <kernel_start>:
 80001d4:	b508      	push	{r3, lr}
 80001d6:	f000 ffbd 	bl	8001154 <sys_tick_init>
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
 8000258:	20000010 	.word	0x20000010
 800025c:	080000c5 	.word	0x080000c5

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
 8000294:	20000010 	.word	0x20000010
 8000298:	20000070 	.word	0x20000070
 800029c:	20000074 	.word	0x20000074
 80002a0:	080000e5 	.word	0x080000e5

080002a4 <set_wait_state>:
 80002a4:	b537      	push	{r0, r1, r2, r4, r5, lr}
 80002a6:	f7ff ff89 	bl	80001bc <get_thread_id>
 80002aa:	9000      	str	r0, [sp, #0]
 80002ac:	b672      	cpsid	i
 80002ae:	9a00      	ldr	r2, [sp, #0]
 80002b0:	210c      	movs	r1, #12
 80002b2:	434a      	muls	r2, r1
 80002b4:	4b0c      	ldr	r3, [pc, #48]	; (80002e8 <set_wait_state+0x44>)
 80002b6:	2002      	movs	r0, #2
 80002b8:	189a      	adds	r2, r3, r2
 80002ba:	6851      	ldr	r1, [r2, #4]
 80002bc:	1c1d      	adds	r5, r3, #0
 80002be:	4301      	orrs	r1, r0
 80002c0:	6051      	str	r1, [r2, #4]
 80002c2:	b672      	cpsid	i
 80002c4:	9b00      	ldr	r3, [sp, #0]
 80002c6:	220c      	movs	r2, #12
 80002c8:	4353      	muls	r3, r2
 80002ca:	18eb      	adds	r3, r5, r3
 80002cc:	685b      	ldr	r3, [r3, #4]
 80002ce:	9301      	str	r3, [sp, #4]
 80002d0:	b662      	cpsie	i
 80002d2:	9b01      	ldr	r3, [sp, #4]
 80002d4:	2402      	movs	r4, #2
 80002d6:	4223      	tst	r3, r4
 80002d8:	d001      	beq.n	80002de <set_wait_state+0x3a>
 80002da:	f000 ff49 	bl	8001170 <sys_tick_trigger>
 80002de:	9b01      	ldr	r3, [sp, #4]
 80002e0:	4223      	tst	r3, r4
 80002e2:	d1ee      	bne.n	80002c2 <set_wait_state+0x1e>
 80002e4:	bd37      	pop	{r0, r1, r2, r4, r5, pc}
 80002e6:	46c0      	nop			; (mov r8, r8)
 80002e8:	20000010 	.word	0x20000010

080002ec <wake_up_threads>:
 80002ec:	2300      	movs	r3, #0
 80002ee:	b672      	cpsid	i
 80002f0:	220c      	movs	r2, #12
 80002f2:	435a      	muls	r2, r3
 80002f4:	4905      	ldr	r1, [pc, #20]	; (800030c <wake_up_threads+0x20>)
 80002f6:	2002      	movs	r0, #2
 80002f8:	188a      	adds	r2, r1, r2
 80002fa:	6851      	ldr	r1, [r2, #4]
 80002fc:	4381      	bics	r1, r0
 80002fe:	6051      	str	r1, [r2, #4]
 8000300:	b662      	cpsie	i
 8000302:	3301      	adds	r3, #1
 8000304:	2b08      	cmp	r3, #8
 8000306:	d1f2      	bne.n	80002ee <wake_up_threads+0x2>
 8000308:	4770      	bx	lr
 800030a:	46c0      	nop			; (mov r8, r8)
 800030c:	20000010 	.word	0x20000010

08000310 <messages_init>:
 8000310:	b510      	push	{r4, lr}
 8000312:	2200      	movs	r2, #0
 8000314:	4909      	ldr	r1, [pc, #36]	; (800033c <messages_init+0x2c>)
 8000316:	0090      	lsls	r0, r2, #2
 8000318:	2300      	movs	r3, #0
 800031a:	3201      	adds	r2, #1
 800031c:	5043      	str	r3, [r0, r1]
 800031e:	2a08      	cmp	r2, #8
 8000320:	d1f8      	bne.n	8000314 <messages_init+0x4>
 8000322:	4807      	ldr	r0, [pc, #28]	; (8000340 <messages_init+0x30>)
 8000324:	011c      	lsls	r4, r3, #4
 8000326:	2200      	movs	r2, #0
 8000328:	1901      	adds	r1, r0, r4
 800032a:	3301      	adds	r3, #1
 800032c:	604a      	str	r2, [r1, #4]
 800032e:	5022      	str	r2, [r4, r0]
 8000330:	60ca      	str	r2, [r1, #12]
 8000332:	608a      	str	r2, [r1, #8]
 8000334:	2b04      	cmp	r3, #4
 8000336:	d1f4      	bne.n	8000322 <messages_init+0x12>
 8000338:	bd10      	pop	{r4, pc}
 800033a:	46c0      	nop			; (mov r8, r8)
 800033c:	200000f4 	.word	0x200000f4
 8000340:	20000114 	.word	0x20000114

08000344 <putc_>:
 8000344:	b538      	push	{r3, r4, r5, lr}
 8000346:	4c06      	ldr	r4, [pc, #24]	; (8000360 <putc_+0x1c>)
 8000348:	1c05      	adds	r5, r0, #0
 800034a:	1c20      	adds	r0, r4, #0
 800034c:	f000 f8ff 	bl	800054e <mutex_lock>
 8000350:	1c28      	adds	r0, r5, #0
 8000352:	f000 fdbf 	bl	8000ed4 <uart_write>
 8000356:	1c20      	adds	r0, r4, #0
 8000358:	f000 f915 	bl	8000586 <mutex_unlock>
 800035c:	bd38      	pop	{r3, r4, r5, pc}
 800035e:	46c0      	nop			; (mov r8, r8)
 8000360:	20000154 	.word	0x20000154

08000364 <puts_>:
 8000364:	b538      	push	{r3, r4, r5, lr}
 8000366:	4d08      	ldr	r5, [pc, #32]	; (8000388 <puts_+0x24>)
 8000368:	1c04      	adds	r4, r0, #0
 800036a:	1c28      	adds	r0, r5, #0
 800036c:	f000 f8ef 	bl	800054e <mutex_lock>
 8000370:	3401      	adds	r4, #1
 8000372:	1e63      	subs	r3, r4, #1
 8000374:	7818      	ldrb	r0, [r3, #0]
 8000376:	2800      	cmp	r0, #0
 8000378:	d002      	beq.n	8000380 <puts_+0x1c>
 800037a:	f7ff ffe3 	bl	8000344 <putc_>
 800037e:	e7f7      	b.n	8000370 <puts_+0xc>
 8000380:	1c28      	adds	r0, r5, #0
 8000382:	f000 f900 	bl	8000586 <mutex_unlock>
 8000386:	bd38      	pop	{r3, r4, r5, pc}
 8000388:	20000160 	.word	0x20000160

0800038c <puti_>:
 800038c:	b5f0      	push	{r4, r5, r6, r7, lr}
 800038e:	2300      	movs	r3, #0
 8000390:	b085      	sub	sp, #20
 8000392:	1c04      	adds	r4, r0, #0
 8000394:	1c1f      	adds	r7, r3, #0
 8000396:	4298      	cmp	r0, r3
 8000398:	da01      	bge.n	800039e <puti_+0x12>
 800039a:	4244      	negs	r4, r0
 800039c:	2701      	movs	r7, #1
 800039e:	ae01      	add	r6, sp, #4
 80003a0:	72f3      	strb	r3, [r6, #11]
 80003a2:	250a      	movs	r5, #10
 80003a4:	1c20      	adds	r0, r4, #0
 80003a6:	210a      	movs	r1, #10
 80003a8:	f001 fd5e 	bl	8001e68 <__aeabi_idivmod>
 80003ac:	3130      	adds	r1, #48	; 0x30
 80003ae:	5571      	strb	r1, [r6, r5]
 80003b0:	1c20      	adds	r0, r4, #0
 80003b2:	210a      	movs	r1, #10
 80003b4:	f001 fd02 	bl	8001dbc <__aeabi_idiv>
 80003b8:	1e6b      	subs	r3, r5, #1
 80003ba:	1e04      	subs	r4, r0, #0
 80003bc:	d001      	beq.n	80003c2 <puti_+0x36>
 80003be:	1c1d      	adds	r5, r3, #0
 80003c0:	e7f0      	b.n	80003a4 <puti_+0x18>
 80003c2:	2f00      	cmp	r7, #0
 80003c4:	d002      	beq.n	80003cc <puti_+0x40>
 80003c6:	222d      	movs	r2, #45	; 0x2d
 80003c8:	54f2      	strb	r2, [r6, r3]
 80003ca:	1c1d      	adds	r5, r3, #0
 80003cc:	1970      	adds	r0, r6, r5
 80003ce:	f7ff ffc9 	bl	8000364 <puts_>
 80003d2:	b005      	add	sp, #20
 80003d4:	bdf0      	pop	{r4, r5, r6, r7, pc}

080003d6 <putui_>:
 80003d6:	b57f      	push	{r0, r1, r2, r3, r4, r5, r6, lr}
 80003d8:	2300      	movs	r3, #0
 80003da:	ae01      	add	r6, sp, #4
 80003dc:	1c05      	adds	r5, r0, #0
 80003de:	72f3      	strb	r3, [r6, #11]
 80003e0:	240a      	movs	r4, #10
 80003e2:	1c28      	adds	r0, r5, #0
 80003e4:	210a      	movs	r1, #10
 80003e6:	f001 fcdf 	bl	8001da8 <__aeabi_uidivmod>
 80003ea:	3130      	adds	r1, #48	; 0x30
 80003ec:	5531      	strb	r1, [r6, r4]
 80003ee:	1c28      	adds	r0, r5, #0
 80003f0:	210a      	movs	r1, #10
 80003f2:	f001 fc95 	bl	8001d20 <__aeabi_uidiv>
 80003f6:	1e63      	subs	r3, r4, #1
 80003f8:	1e05      	subs	r5, r0, #0
 80003fa:	d001      	beq.n	8000400 <putui_+0x2a>
 80003fc:	1c1c      	adds	r4, r3, #0
 80003fe:	e7f0      	b.n	80003e2 <putui_+0xc>
 8000400:	1930      	adds	r0, r6, r4
 8000402:	f7ff ffaf 	bl	8000364 <puts_>
 8000406:	bd7f      	pop	{r0, r1, r2, r3, r4, r5, r6, pc}

08000408 <putx_>:
 8000408:	b51f      	push	{r0, r1, r2, r3, r4, lr}
 800040a:	2300      	movs	r3, #0
 800040c:	aa01      	add	r2, sp, #4
 800040e:	72d3      	strb	r3, [r2, #11]
 8000410:	230a      	movs	r3, #10
 8000412:	210f      	movs	r1, #15
 8000414:	4001      	ands	r1, r0
 8000416:	2909      	cmp	r1, #9
 8000418:	d801      	bhi.n	800041e <putx_+0x16>
 800041a:	3130      	adds	r1, #48	; 0x30
 800041c:	e000      	b.n	8000420 <putx_+0x18>
 800041e:	3157      	adds	r1, #87	; 0x57
 8000420:	54d1      	strb	r1, [r2, r3]
 8000422:	0900      	lsrs	r0, r0, #4
 8000424:	1e59      	subs	r1, r3, #1
 8000426:	2800      	cmp	r0, #0
 8000428:	d001      	beq.n	800042e <putx_+0x26>
 800042a:	1c0b      	adds	r3, r1, #0
 800042c:	e7f1      	b.n	8000412 <putx_+0xa>
 800042e:	18d0      	adds	r0, r2, r3
 8000430:	f7ff ff98 	bl	8000364 <puts_>
 8000434:	b005      	add	sp, #20
 8000436:	bd00      	pop	{pc}

08000438 <printf_>:
 8000438:	b40f      	push	{r0, r1, r2, r3}
 800043a:	b573      	push	{r0, r1, r4, r5, r6, lr}
 800043c:	4e25      	ldr	r6, [pc, #148]	; (80004d4 <printf_+0x9c>)
 800043e:	ac06      	add	r4, sp, #24
 8000440:	cc20      	ldmia	r4!, {r5}
 8000442:	1c30      	adds	r0, r6, #0
 8000444:	f000 f883 	bl	800054e <mutex_lock>
 8000448:	9401      	str	r4, [sp, #4]
 800044a:	2400      	movs	r4, #0
 800044c:	5d28      	ldrb	r0, [r5, r4]
 800044e:	2800      	cmp	r0, #0
 8000450:	d039      	beq.n	80004c6 <printf_+0x8e>
 8000452:	2825      	cmp	r0, #37	; 0x25
 8000454:	d003      	beq.n	800045e <printf_+0x26>
 8000456:	f7ff ff75 	bl	8000344 <putc_>
 800045a:	3401      	adds	r4, #1
 800045c:	e7f6      	b.n	800044c <printf_+0x14>
 800045e:	192b      	adds	r3, r5, r4
 8000460:	7858      	ldrb	r0, [r3, #1]
 8000462:	2869      	cmp	r0, #105	; 0x69
 8000464:	d016      	beq.n	8000494 <printf_+0x5c>
 8000466:	d808      	bhi.n	800047a <printf_+0x42>
 8000468:	2825      	cmp	r0, #37	; 0x25
 800046a:	d028      	beq.n	80004be <printf_+0x86>
 800046c:	2863      	cmp	r0, #99	; 0x63
 800046e:	d128      	bne.n	80004c2 <printf_+0x8a>
 8000470:	9b01      	ldr	r3, [sp, #4]
 8000472:	1d1a      	adds	r2, r3, #4
 8000474:	9201      	str	r2, [sp, #4]
 8000476:	7818      	ldrb	r0, [r3, #0]
 8000478:	e021      	b.n	80004be <printf_+0x86>
 800047a:	2875      	cmp	r0, #117	; 0x75
 800047c:	d011      	beq.n	80004a2 <printf_+0x6a>
 800047e:	2878      	cmp	r0, #120	; 0x78
 8000480:	d016      	beq.n	80004b0 <printf_+0x78>
 8000482:	2873      	cmp	r0, #115	; 0x73
 8000484:	d11d      	bne.n	80004c2 <printf_+0x8a>
 8000486:	9b01      	ldr	r3, [sp, #4]
 8000488:	1d1a      	adds	r2, r3, #4
 800048a:	6818      	ldr	r0, [r3, #0]
 800048c:	9201      	str	r2, [sp, #4]
 800048e:	f7ff ff69 	bl	8000364 <puts_>
 8000492:	e016      	b.n	80004c2 <printf_+0x8a>
 8000494:	9b01      	ldr	r3, [sp, #4]
 8000496:	1d1a      	adds	r2, r3, #4
 8000498:	6818      	ldr	r0, [r3, #0]
 800049a:	9201      	str	r2, [sp, #4]
 800049c:	f7ff ff76 	bl	800038c <puti_>
 80004a0:	e00f      	b.n	80004c2 <printf_+0x8a>
 80004a2:	9b01      	ldr	r3, [sp, #4]
 80004a4:	1d1a      	adds	r2, r3, #4
 80004a6:	6818      	ldr	r0, [r3, #0]
 80004a8:	9201      	str	r2, [sp, #4]
 80004aa:	f7ff ff94 	bl	80003d6 <putui_>
 80004ae:	e008      	b.n	80004c2 <printf_+0x8a>
 80004b0:	9b01      	ldr	r3, [sp, #4]
 80004b2:	1d1a      	adds	r2, r3, #4
 80004b4:	6818      	ldr	r0, [r3, #0]
 80004b6:	9201      	str	r2, [sp, #4]
 80004b8:	f7ff ffa6 	bl	8000408 <putx_>
 80004bc:	e001      	b.n	80004c2 <printf_+0x8a>
 80004be:	f7ff ff41 	bl	8000344 <putc_>
 80004c2:	3402      	adds	r4, #2
 80004c4:	e7c2      	b.n	800044c <printf_+0x14>
 80004c6:	1c30      	adds	r0, r6, #0
 80004c8:	f000 f85d 	bl	8000586 <mutex_unlock>
 80004cc:	bc73      	pop	{r0, r1, r4, r5, r6}
 80004ce:	bc08      	pop	{r3}
 80004d0:	b004      	add	sp, #16
 80004d2:	4718      	bx	r3
 80004d4:	2000015c 	.word	0x2000015c

080004d8 <stdio_init>:
 80004d8:	b510      	push	{r4, lr}
 80004da:	480f      	ldr	r0, [pc, #60]	; (8000518 <stdio_init+0x40>)
 80004dc:	f000 f82e 	bl	800053c <mutex_init>
 80004e0:	480e      	ldr	r0, [pc, #56]	; (800051c <stdio_init+0x44>)
 80004e2:	f000 f82b 	bl	800053c <mutex_init>
 80004e6:	480e      	ldr	r0, [pc, #56]	; (8000520 <stdio_init+0x48>)
 80004e8:	f000 f828 	bl	800053c <mutex_init>
 80004ec:	480d      	ldr	r0, [pc, #52]	; (8000524 <stdio_init+0x4c>)
 80004ee:	f000 f825 	bl	800053c <mutex_init>
 80004f2:	2408      	movs	r4, #8
 80004f4:	2020      	movs	r0, #32
 80004f6:	3c01      	subs	r4, #1
 80004f8:	f7ff ff24 	bl	8000344 <putc_>
 80004fc:	2c00      	cmp	r4, #0
 80004fe:	d1f9      	bne.n	80004f4 <stdio_init+0x1c>
 8000500:	2420      	movs	r4, #32
 8000502:	200a      	movs	r0, #10
 8000504:	3c01      	subs	r4, #1
 8000506:	f7ff ff1d 	bl	8000344 <putc_>
 800050a:	2c00      	cmp	r4, #0
 800050c:	d1f9      	bne.n	8000502 <stdio_init+0x2a>
 800050e:	4806      	ldr	r0, [pc, #24]	; (8000528 <stdio_init+0x50>)
 8000510:	f7ff ff92 	bl	8000438 <printf_>
 8000514:	bd10      	pop	{r4, pc}
 8000516:	46c0      	nop			; (mov r8, r8)
 8000518:	20000154 	.word	0x20000154
 800051c:	20000158 	.word	0x20000158
 8000520:	20000160 	.word	0x20000160
 8000524:	2000015c 	.word	0x2000015c
 8000528:	08001e98 	.word	0x08001e98

0800052c <lib_os_init>:
 800052c:	b508      	push	{r3, lr}
 800052e:	f7ff fe97 	bl	8000260 <kernel_init>
 8000532:	f7ff feed 	bl	8000310 <messages_init>
 8000536:	f7ff ffcf 	bl	80004d8 <stdio_init>
 800053a:	bd08      	pop	{r3, pc}

0800053c <mutex_init>:
 800053c:	b510      	push	{r4, lr}
 800053e:	1c04      	adds	r4, r0, #0
 8000540:	f7ff fe34 	bl	80001ac <sched_off>
 8000544:	2300      	movs	r3, #0
 8000546:	6023      	str	r3, [r4, #0]
 8000548:	f7ff fe32 	bl	80001b0 <sched_on>
 800054c:	bd10      	pop	{r4, pc}

0800054e <mutex_lock>:
 800054e:	b513      	push	{r0, r1, r4, lr}
 8000550:	1c04      	adds	r4, r0, #0
 8000552:	f7ff fe2b 	bl	80001ac <sched_off>
 8000556:	6823      	ldr	r3, [r4, #0]
 8000558:	9301      	str	r3, [sp, #4]
 800055a:	f7ff fe29 	bl	80001b0 <sched_on>
 800055e:	9b01      	ldr	r3, [sp, #4]
 8000560:	2b00      	cmp	r3, #0
 8000562:	d001      	beq.n	8000568 <mutex_lock+0x1a>
 8000564:	f7ff fe9e 	bl	80002a4 <set_wait_state>
 8000568:	9b01      	ldr	r3, [sp, #4]
 800056a:	2b00      	cmp	r3, #0
 800056c:	d1f1      	bne.n	8000552 <mutex_lock+0x4>
 800056e:	f7ff fe1d 	bl	80001ac <sched_off>
 8000572:	6823      	ldr	r3, [r4, #0]
 8000574:	9301      	str	r3, [sp, #4]
 8000576:	9b01      	ldr	r3, [sp, #4]
 8000578:	2b00      	cmp	r3, #0
 800057a:	d1ea      	bne.n	8000552 <mutex_lock+0x4>
 800057c:	2301      	movs	r3, #1
 800057e:	6023      	str	r3, [r4, #0]
 8000580:	f7ff fe16 	bl	80001b0 <sched_on>
 8000584:	bd13      	pop	{r0, r1, r4, pc}

08000586 <mutex_unlock>:
 8000586:	b508      	push	{r3, lr}
 8000588:	f7ff ffd8 	bl	800053c <mutex_init>
 800058c:	f7ff feae 	bl	80002ec <wake_up_threads>
 8000590:	f7ff fe10 	bl	80001b4 <yield>
 8000594:	bd08      	pop	{r3, pc}
	...

08000598 <hmc5883_init>:
 8000598:	b510      	push	{r4, lr}
 800059a:	4b16      	ldr	r3, [pc, #88]	; (80005f4 <hmc5883_init+0x5c>)
 800059c:	2400      	movs	r4, #0
 800059e:	203c      	movs	r0, #60	; 0x3c
 80005a0:	1c21      	adds	r1, r4, #0
 80005a2:	2218      	movs	r2, #24
 80005a4:	801c      	strh	r4, [r3, #0]
 80005a6:	805c      	strh	r4, [r3, #2]
 80005a8:	809c      	strh	r4, [r3, #4]
 80005aa:	f000 fda7 	bl	80010fc <i2c_write_reg>
 80005ae:	203c      	movs	r0, #60	; 0x3c
 80005b0:	2101      	movs	r1, #1
 80005b2:	1c22      	adds	r2, r4, #0
 80005b4:	f000 fda2 	bl	80010fc <i2c_write_reg>
 80005b8:	203c      	movs	r0, #60	; 0x3c
 80005ba:	2102      	movs	r1, #2
 80005bc:	1c22      	adds	r2, r4, #0
 80005be:	f000 fd9d 	bl	80010fc <i2c_write_reg>
 80005c2:	203c      	movs	r0, #60	; 0x3c
 80005c4:	210a      	movs	r1, #10
 80005c6:	f000 fdab 	bl	8001120 <i2c_read_reg>
 80005ca:	2301      	movs	r3, #1
 80005cc:	2848      	cmp	r0, #72	; 0x48
 80005ce:	d10f      	bne.n	80005f0 <hmc5883_init+0x58>
 80005d0:	203c      	movs	r0, #60	; 0x3c
 80005d2:	210b      	movs	r1, #11
 80005d4:	f000 fda4 	bl	8001120 <i2c_read_reg>
 80005d8:	2302      	movs	r3, #2
 80005da:	2834      	cmp	r0, #52	; 0x34
 80005dc:	d108      	bne.n	80005f0 <hmc5883_init+0x58>
 80005de:	203c      	movs	r0, #60	; 0x3c
 80005e0:	210c      	movs	r1, #12
 80005e2:	f000 fd9d 	bl	8001120 <i2c_read_reg>
 80005e6:	2833      	cmp	r0, #51	; 0x33
 80005e8:	d001      	beq.n	80005ee <hmc5883_init+0x56>
 80005ea:	2303      	movs	r3, #3
 80005ec:	e000      	b.n	80005f0 <hmc5883_init+0x58>
 80005ee:	1c23      	adds	r3, r4, #0
 80005f0:	1c18      	adds	r0, r3, #0
 80005f2:	bd10      	pop	{r4, pc}
 80005f4:	20000164 	.word	0x20000164

080005f8 <hmc5883_read>:
 80005f8:	b538      	push	{r3, r4, r5, lr}
 80005fa:	2103      	movs	r1, #3
 80005fc:	203c      	movs	r0, #60	; 0x3c
 80005fe:	f000 fd8f 	bl	8001120 <i2c_read_reg>
 8000602:	4c12      	ldr	r4, [pc, #72]	; (800064c <hmc5883_read+0x54>)
 8000604:	0205      	lsls	r5, r0, #8
 8000606:	b2ad      	uxth	r5, r5
 8000608:	2104      	movs	r1, #4
 800060a:	203c      	movs	r0, #60	; 0x3c
 800060c:	8025      	strh	r5, [r4, #0]
 800060e:	f000 fd87 	bl	8001120 <i2c_read_reg>
 8000612:	2107      	movs	r1, #7
 8000614:	4305      	orrs	r5, r0
 8000616:	203c      	movs	r0, #60	; 0x3c
 8000618:	8025      	strh	r5, [r4, #0]
 800061a:	f000 fd81 	bl	8001120 <i2c_read_reg>
 800061e:	0205      	lsls	r5, r0, #8
 8000620:	b2ad      	uxth	r5, r5
 8000622:	2108      	movs	r1, #8
 8000624:	203c      	movs	r0, #60	; 0x3c
 8000626:	8065      	strh	r5, [r4, #2]
 8000628:	f000 fd7a 	bl	8001120 <i2c_read_reg>
 800062c:	2105      	movs	r1, #5
 800062e:	4305      	orrs	r5, r0
 8000630:	203c      	movs	r0, #60	; 0x3c
 8000632:	8065      	strh	r5, [r4, #2]
 8000634:	f000 fd74 	bl	8001120 <i2c_read_reg>
 8000638:	0205      	lsls	r5, r0, #8
 800063a:	b2ad      	uxth	r5, r5
 800063c:	2106      	movs	r1, #6
 800063e:	203c      	movs	r0, #60	; 0x3c
 8000640:	80a5      	strh	r5, [r4, #4]
 8000642:	f000 fd6d 	bl	8001120 <i2c_read_reg>
 8000646:	4305      	orrs	r5, r0
 8000648:	80a5      	strh	r5, [r4, #4]
 800064a:	bd38      	pop	{r3, r4, r5, pc}
 800064c:	20000164 	.word	0x20000164

08000650 <mint_abs>:
 8000650:	17c3      	asrs	r3, r0, #31
 8000652:	18c0      	adds	r0, r0, r3
 8000654:	4058      	eors	r0, r3
 8000656:	4770      	bx	lr

08000658 <LCD_SH1106_write_command>:
 8000658:	b508      	push	{r3, lr}
 800065a:	1c02      	adds	r2, r0, #0
 800065c:	2100      	movs	r1, #0
 800065e:	2078      	movs	r0, #120	; 0x78
 8000660:	f000 fd4c 	bl	80010fc <i2c_write_reg>
 8000664:	bd08      	pop	{r3, pc}

08000666 <LCD_SH1106_set_cursor>:
 8000666:	b510      	push	{r4, lr}
 8000668:	1c84      	adds	r4, r0, #2
 800066a:	1c08      	adds	r0, r1, #0
 800066c:	3850      	subs	r0, #80	; 0x50
 800066e:	b2c0      	uxtb	r0, r0
 8000670:	f7ff fff2 	bl	8000658 <LCD_SH1106_write_command>
 8000674:	b2e4      	uxtb	r4, r4
 8000676:	200f      	movs	r0, #15
 8000678:	4020      	ands	r0, r4
 800067a:	f7ff ffed 	bl	8000658 <LCD_SH1106_write_command>
 800067e:	0924      	lsrs	r4, r4, #4
 8000680:	2010      	movs	r0, #16
 8000682:	4320      	orrs	r0, r4
 8000684:	f7ff ffe8 	bl	8000658 <LCD_SH1106_write_command>
 8000688:	bd10      	pop	{r4, pc}
	...

0800068c <LCD_SH1106_set_pixel>:
 800068c:	b570      	push	{r4, r5, r6, lr}
 800068e:	1c0c      	adds	r4, r1, #0
 8000690:	1c05      	adds	r5, r0, #0
 8000692:	1c16      	adds	r6, r2, #0
 8000694:	f7ff fd8a 	bl	80001ac <sched_off>
 8000698:	08e2      	lsrs	r2, r4, #3
 800069a:	2107      	movs	r1, #7
 800069c:	400c      	ands	r4, r1
 800069e:	01d2      	lsls	r2, r2, #7
 80006a0:	4b08      	ldr	r3, [pc, #32]	; (80006c4 <LCD_SH1106_set_pixel+0x38>)
 80006a2:	2101      	movs	r1, #1
 80006a4:	1955      	adds	r5, r2, r5
 80006a6:	40a1      	lsls	r1, r4
 80006a8:	5d5a      	ldrb	r2, [r3, r5]
 80006aa:	1c0c      	adds	r4, r1, #0
 80006ac:	2e00      	cmp	r6, #0
 80006ae:	d003      	beq.n	80006b8 <LCD_SH1106_set_pixel+0x2c>
 80006b0:	4314      	orrs	r4, r2
 80006b2:	b2e4      	uxtb	r4, r4
 80006b4:	555c      	strb	r4, [r3, r5]
 80006b6:	e001      	b.n	80006bc <LCD_SH1106_set_pixel+0x30>
 80006b8:	438a      	bics	r2, r1
 80006ba:	555a      	strb	r2, [r3, r5]
 80006bc:	f7ff fd78 	bl	80001b0 <sched_on>
 80006c0:	bd70      	pop	{r4, r5, r6, pc}
 80006c2:	46c0      	nop			; (mov r8, r8)
 80006c4:	2000016c 	.word	0x2000016c

080006c8 <LCD_SH1106_clear_buffer>:
 80006c8:	b082      	sub	sp, #8
 80006ca:	2300      	movs	r3, #0
 80006cc:	9300      	str	r3, [sp, #0]
 80006ce:	9b00      	ldr	r3, [sp, #0]
 80006d0:	2b07      	cmp	r3, #7
 80006d2:	d810      	bhi.n	80006f6 <LCD_SH1106_clear_buffer+0x2e>
 80006d4:	2300      	movs	r3, #0
 80006d6:	9301      	str	r3, [sp, #4]
 80006d8:	9b01      	ldr	r3, [sp, #4]
 80006da:	2b7f      	cmp	r3, #127	; 0x7f
 80006dc:	d808      	bhi.n	80006f0 <LCD_SH1106_clear_buffer+0x28>
 80006de:	9a00      	ldr	r2, [sp, #0]
 80006e0:	9b01      	ldr	r3, [sp, #4]
 80006e2:	01d2      	lsls	r2, r2, #7
 80006e4:	18d2      	adds	r2, r2, r3
 80006e6:	4b05      	ldr	r3, [pc, #20]	; (80006fc <LCD_SH1106_clear_buffer+0x34>)
 80006e8:	54d0      	strb	r0, [r2, r3]
 80006ea:	9b01      	ldr	r3, [sp, #4]
 80006ec:	3301      	adds	r3, #1
 80006ee:	e7f2      	b.n	80006d6 <LCD_SH1106_clear_buffer+0xe>
 80006f0:	9b00      	ldr	r3, [sp, #0]
 80006f2:	3301      	adds	r3, #1
 80006f4:	e7ea      	b.n	80006cc <LCD_SH1106_clear_buffer+0x4>
 80006f6:	b002      	add	sp, #8
 80006f8:	4770      	bx	lr
 80006fa:	46c0      	nop			; (mov r8, r8)
 80006fc:	2000016c 	.word	0x2000016c

08000700 <LCD_SH1106_flush_buffer>:
 8000700:	b530      	push	{r4, r5, lr}
 8000702:	2000      	movs	r0, #0
 8000704:	b085      	sub	sp, #20
 8000706:	f7ff ffa7 	bl	8000658 <LCD_SH1106_write_command>
 800070a:	2010      	movs	r0, #16
 800070c:	f7ff ffa4 	bl	8000658 <LCD_SH1106_write_command>
 8000710:	2040      	movs	r0, #64	; 0x40
 8000712:	f7ff ffa1 	bl	8000658 <LCD_SH1106_write_command>
 8000716:	2300      	movs	r3, #0
 8000718:	9301      	str	r3, [sp, #4]
 800071a:	9b01      	ldr	r3, [sp, #4]
 800071c:	2b07      	cmp	r3, #7
 800071e:	d833      	bhi.n	8000788 <LCD_SH1106_flush_buffer+0x88>
 8000720:	9801      	ldr	r0, [sp, #4]
 8000722:	2400      	movs	r4, #0
 8000724:	3850      	subs	r0, #80	; 0x50
 8000726:	b2c0      	uxtb	r0, r0
 8000728:	f7ff ff96 	bl	8000658 <LCD_SH1106_write_command>
 800072c:	2002      	movs	r0, #2
 800072e:	f7ff ff93 	bl	8000658 <LCD_SH1106_write_command>
 8000732:	2010      	movs	r0, #16
 8000734:	f7ff ff90 	bl	8000658 <LCD_SH1106_write_command>
 8000738:	9402      	str	r4, [sp, #8]
 800073a:	9b02      	ldr	r3, [sp, #8]
 800073c:	2b07      	cmp	r3, #7
 800073e:	d820      	bhi.n	8000782 <LCD_SH1106_flush_buffer+0x82>
 8000740:	f000 fc72 	bl	8001028 <i2cStart>
 8000744:	2078      	movs	r0, #120	; 0x78
 8000746:	f000 fc8b 	bl	8001060 <i2cWrite>
 800074a:	2040      	movs	r0, #64	; 0x40
 800074c:	f000 fc88 	bl	8001060 <i2cWrite>
 8000750:	2300      	movs	r3, #0
 8000752:	9303      	str	r3, [sp, #12]
 8000754:	9b03      	ldr	r3, [sp, #12]
 8000756:	2b0f      	cmp	r3, #15
 8000758:	d80d      	bhi.n	8000776 <LCD_SH1106_flush_buffer+0x76>
 800075a:	9b01      	ldr	r3, [sp, #4]
 800075c:	1c65      	adds	r5, r4, #1
 800075e:	01db      	lsls	r3, r3, #7
 8000760:	191c      	adds	r4, r3, r4
 8000762:	4b0c      	ldr	r3, [pc, #48]	; (8000794 <LCD_SH1106_flush_buffer+0x94>)
 8000764:	5ce0      	ldrb	r0, [r4, r3]
 8000766:	1c2c      	adds	r4, r5, #0
 8000768:	b2c0      	uxtb	r0, r0
 800076a:	f000 fc79 	bl	8001060 <i2cWrite>
 800076e:	9b03      	ldr	r3, [sp, #12]
 8000770:	3301      	adds	r3, #1
 8000772:	9303      	str	r3, [sp, #12]
 8000774:	e7ee      	b.n	8000754 <LCD_SH1106_flush_buffer+0x54>
 8000776:	f000 fc65 	bl	8001044 <i2cStop>
 800077a:	9b02      	ldr	r3, [sp, #8]
 800077c:	3301      	adds	r3, #1
 800077e:	9302      	str	r3, [sp, #8]
 8000780:	e7db      	b.n	800073a <LCD_SH1106_flush_buffer+0x3a>
 8000782:	9b01      	ldr	r3, [sp, #4]
 8000784:	3301      	adds	r3, #1
 8000786:	e7c7      	b.n	8000718 <LCD_SH1106_flush_buffer+0x18>
 8000788:	2000      	movs	r0, #0
 800078a:	1c01      	adds	r1, r0, #0
 800078c:	f7ff ff6b 	bl	8000666 <LCD_SH1106_set_cursor>
 8000790:	b005      	add	sp, #20
 8000792:	bd30      	pop	{r4, r5, pc}
 8000794:	2000016c 	.word	0x2000016c

08000798 <LCD_SH1106_flush_buffer_partial>:
 8000798:	b5f0      	push	{r4, r5, r6, r7, lr}
 800079a:	4c32      	ldr	r4, [pc, #200]	; (8000864 <LCD_SH1106_flush_buffer_partial+0xcc>)
 800079c:	b085      	sub	sp, #20
 800079e:	8826      	ldrh	r6, [r4, #0]
 80007a0:	1c25      	adds	r5, r4, #0
 80007a2:	b2b6      	uxth	r6, r6
 80007a4:	2e01      	cmp	r6, #1
 80007a6:	d019      	beq.n	80007dc <LCD_SH1106_flush_buffer_partial+0x44>
 80007a8:	2e00      	cmp	r6, #0
 80007aa:	d009      	beq.n	80007c0 <LCD_SH1106_flush_buffer_partial+0x28>
 80007ac:	2500      	movs	r5, #0
 80007ae:	2e02      	cmp	r6, #2
 80007b0:	d154      	bne.n	800085c <LCD_SH1106_flush_buffer_partial+0xc4>
 80007b2:	1c28      	adds	r0, r5, #0
 80007b4:	1c29      	adds	r1, r5, #0
 80007b6:	f7ff ff56 	bl	8000666 <LCD_SH1106_set_cursor>
 80007ba:	8025      	strh	r5, [r4, #0]
 80007bc:	1c28      	adds	r0, r5, #0
 80007be:	e04f      	b.n	8000860 <LCD_SH1106_flush_buffer_partial+0xc8>
 80007c0:	1c30      	adds	r0, r6, #0
 80007c2:	f7ff ff49 	bl	8000658 <LCD_SH1106_write_command>
 80007c6:	2010      	movs	r0, #16
 80007c8:	f7ff ff46 	bl	8000658 <LCD_SH1106_write_command>
 80007cc:	2040      	movs	r0, #64	; 0x40
 80007ce:	f7ff ff43 	bl	8000658 <LCD_SH1106_write_command>
 80007d2:	4b25      	ldr	r3, [pc, #148]	; (8000868 <LCD_SH1106_flush_buffer_partial+0xd0>)
 80007d4:	2001      	movs	r0, #1
 80007d6:	801e      	strh	r6, [r3, #0]
 80007d8:	8020      	strh	r0, [r4, #0]
 80007da:	e041      	b.n	8000860 <LCD_SH1106_flush_buffer_partial+0xc8>
 80007dc:	4c22      	ldr	r4, [pc, #136]	; (8000868 <LCD_SH1106_flush_buffer_partial+0xd0>)
 80007de:	2600      	movs	r6, #0
 80007e0:	8823      	ldrh	r3, [r4, #0]
 80007e2:	b29b      	uxth	r3, r3
 80007e4:	9301      	str	r3, [sp, #4]
 80007e6:	9801      	ldr	r0, [sp, #4]
 80007e8:	3850      	subs	r0, #80	; 0x50
 80007ea:	b2c0      	uxtb	r0, r0
 80007ec:	f7ff ff34 	bl	8000658 <LCD_SH1106_write_command>
 80007f0:	2002      	movs	r0, #2
 80007f2:	f7ff ff31 	bl	8000658 <LCD_SH1106_write_command>
 80007f6:	2010      	movs	r0, #16
 80007f8:	f7ff ff2e 	bl	8000658 <LCD_SH1106_write_command>
 80007fc:	9602      	str	r6, [sp, #8]
 80007fe:	9b02      	ldr	r3, [sp, #8]
 8000800:	2b07      	cmp	r3, #7
 8000802:	d820      	bhi.n	8000846 <LCD_SH1106_flush_buffer_partial+0xae>
 8000804:	f000 fc10 	bl	8001028 <i2cStart>
 8000808:	2078      	movs	r0, #120	; 0x78
 800080a:	f000 fc29 	bl	8001060 <i2cWrite>
 800080e:	2040      	movs	r0, #64	; 0x40
 8000810:	f000 fc26 	bl	8001060 <i2cWrite>
 8000814:	2300      	movs	r3, #0
 8000816:	9303      	str	r3, [sp, #12]
 8000818:	9b03      	ldr	r3, [sp, #12]
 800081a:	2b0f      	cmp	r3, #15
 800081c:	d80d      	bhi.n	800083a <LCD_SH1106_flush_buffer_partial+0xa2>
 800081e:	9b01      	ldr	r3, [sp, #4]
 8000820:	1c77      	adds	r7, r6, #1
 8000822:	01db      	lsls	r3, r3, #7
 8000824:	199e      	adds	r6, r3, r6
 8000826:	4b11      	ldr	r3, [pc, #68]	; (800086c <LCD_SH1106_flush_buffer_partial+0xd4>)
 8000828:	5cf0      	ldrb	r0, [r6, r3]
 800082a:	1c3e      	adds	r6, r7, #0
 800082c:	b2c0      	uxtb	r0, r0
 800082e:	f000 fc17 	bl	8001060 <i2cWrite>
 8000832:	9b03      	ldr	r3, [sp, #12]
 8000834:	3301      	adds	r3, #1
 8000836:	9303      	str	r3, [sp, #12]
 8000838:	e7ee      	b.n	8000818 <LCD_SH1106_flush_buffer_partial+0x80>
 800083a:	f000 fc03 	bl	8001044 <i2cStop>
 800083e:	9b02      	ldr	r3, [sp, #8]
 8000840:	3301      	adds	r3, #1
 8000842:	9302      	str	r3, [sp, #8]
 8000844:	e7db      	b.n	80007fe <LCD_SH1106_flush_buffer_partial+0x66>
 8000846:	8823      	ldrh	r3, [r4, #0]
 8000848:	2001      	movs	r0, #1
 800084a:	3301      	adds	r3, #1
 800084c:	b29b      	uxth	r3, r3
 800084e:	8023      	strh	r3, [r4, #0]
 8000850:	8823      	ldrh	r3, [r4, #0]
 8000852:	2b07      	cmp	r3, #7
 8000854:	d904      	bls.n	8000860 <LCD_SH1106_flush_buffer_partial+0xc8>
 8000856:	2302      	movs	r3, #2
 8000858:	802b      	strh	r3, [r5, #0]
 800085a:	e001      	b.n	8000860 <LCD_SH1106_flush_buffer_partial+0xc8>
 800085c:	8025      	strh	r5, [r4, #0]
 800085e:	2001      	movs	r0, #1
 8000860:	b005      	add	sp, #20
 8000862:	bdf0      	pop	{r4, r5, r6, r7, pc}
 8000864:	2000016a 	.word	0x2000016a
 8000868:	2000056c 	.word	0x2000056c
 800086c:	2000016c 	.word	0x2000016c

08000870 <LCD_SH1106_init>:
 8000870:	b508      	push	{r3, lr}
 8000872:	20ae      	movs	r0, #174	; 0xae
 8000874:	f7ff fef0 	bl	8000658 <LCD_SH1106_write_command>
 8000878:	2002      	movs	r0, #2
 800087a:	f7ff feed 	bl	8000658 <LCD_SH1106_write_command>
 800087e:	2010      	movs	r0, #16
 8000880:	f7ff feea 	bl	8000658 <LCD_SH1106_write_command>
 8000884:	2040      	movs	r0, #64	; 0x40
 8000886:	f7ff fee7 	bl	8000658 <LCD_SH1106_write_command>
 800088a:	20b0      	movs	r0, #176	; 0xb0
 800088c:	f7ff fee4 	bl	8000658 <LCD_SH1106_write_command>
 8000890:	2081      	movs	r0, #129	; 0x81
 8000892:	f7ff fee1 	bl	8000658 <LCD_SH1106_write_command>
 8000896:	2080      	movs	r0, #128	; 0x80
 8000898:	f7ff fede 	bl	8000658 <LCD_SH1106_write_command>
 800089c:	20a1      	movs	r0, #161	; 0xa1
 800089e:	f7ff fedb 	bl	8000658 <LCD_SH1106_write_command>
 80008a2:	20a6      	movs	r0, #166	; 0xa6
 80008a4:	f7ff fed8 	bl	8000658 <LCD_SH1106_write_command>
 80008a8:	20a8      	movs	r0, #168	; 0xa8
 80008aa:	f7ff fed5 	bl	8000658 <LCD_SH1106_write_command>
 80008ae:	203f      	movs	r0, #63	; 0x3f
 80008b0:	f7ff fed2 	bl	8000658 <LCD_SH1106_write_command>
 80008b4:	20ad      	movs	r0, #173	; 0xad
 80008b6:	f7ff fecf 	bl	8000658 <LCD_SH1106_write_command>
 80008ba:	208b      	movs	r0, #139	; 0x8b
 80008bc:	f7ff fecc 	bl	8000658 <LCD_SH1106_write_command>
 80008c0:	2030      	movs	r0, #48	; 0x30
 80008c2:	f7ff fec9 	bl	8000658 <LCD_SH1106_write_command>
 80008c6:	20c8      	movs	r0, #200	; 0xc8
 80008c8:	f7ff fec6 	bl	8000658 <LCD_SH1106_write_command>
 80008cc:	20d3      	movs	r0, #211	; 0xd3
 80008ce:	f7ff fec3 	bl	8000658 <LCD_SH1106_write_command>
 80008d2:	2000      	movs	r0, #0
 80008d4:	f7ff fec0 	bl	8000658 <LCD_SH1106_write_command>
 80008d8:	20d5      	movs	r0, #213	; 0xd5
 80008da:	f7ff febd 	bl	8000658 <LCD_SH1106_write_command>
 80008de:	2080      	movs	r0, #128	; 0x80
 80008e0:	f7ff feba 	bl	8000658 <LCD_SH1106_write_command>
 80008e4:	20d9      	movs	r0, #217	; 0xd9
 80008e6:	f7ff feb7 	bl	8000658 <LCD_SH1106_write_command>
 80008ea:	201f      	movs	r0, #31
 80008ec:	f7ff feb4 	bl	8000658 <LCD_SH1106_write_command>
 80008f0:	20da      	movs	r0, #218	; 0xda
 80008f2:	f7ff feb1 	bl	8000658 <LCD_SH1106_write_command>
 80008f6:	2012      	movs	r0, #18
 80008f8:	f7ff feae 	bl	8000658 <LCD_SH1106_write_command>
 80008fc:	20db      	movs	r0, #219	; 0xdb
 80008fe:	f7ff feab 	bl	8000658 <LCD_SH1106_write_command>
 8000902:	2040      	movs	r0, #64	; 0x40
 8000904:	f7ff fea8 	bl	8000658 <LCD_SH1106_write_command>
 8000908:	20af      	movs	r0, #175	; 0xaf
 800090a:	f7ff fea5 	bl	8000658 <LCD_SH1106_write_command>
 800090e:	2000      	movs	r0, #0
 8000910:	f7ff feda 	bl	80006c8 <LCD_SH1106_clear_buffer>
 8000914:	f7ff fef4 	bl	8000700 <LCD_SH1106_flush_buffer>
 8000918:	4a02      	ldr	r2, [pc, #8]	; (8000924 <LCD_SH1106_init+0xb4>)
 800091a:	2300      	movs	r3, #0
 800091c:	8013      	strh	r3, [r2, #0]
 800091e:	4a02      	ldr	r2, [pc, #8]	; (8000928 <LCD_SH1106_init+0xb8>)
 8000920:	8013      	strh	r3, [r2, #0]
 8000922:	bd08      	pop	{r3, pc}
 8000924:	2000016a 	.word	0x2000016a
 8000928:	2000056c 	.word	0x2000056c

0800092c <lcd_put_char_xy>:
 800092c:	b5f7      	push	{r0, r1, r2, r4, r5, r6, r7, lr}
 800092e:	2300      	movs	r3, #0
 8000930:	1c06      	adds	r6, r0, #0
 8000932:	1c0f      	adds	r7, r1, #0
 8000934:	2a1f      	cmp	r2, #31
 8000936:	d902      	bls.n	800093e <lcd_put_char_xy+0x12>
 8000938:	1c13      	adds	r3, r2, #0
 800093a:	3b20      	subs	r3, #32
 800093c:	b2db      	uxtb	r3, r3
 800093e:	011b      	lsls	r3, r3, #4
 8000940:	9300      	str	r3, [sp, #0]
 8000942:	2500      	movs	r5, #0
 8000944:	2301      	movs	r3, #1
 8000946:	40ab      	lsls	r3, r5
 8000948:	b2db      	uxtb	r3, r3
 800094a:	9301      	str	r3, [sp, #4]
 800094c:	2400      	movs	r4, #0
 800094e:	1c30      	adds	r0, r6, #0
 8000950:	3008      	adds	r0, #8
 8000952:	19e1      	adds	r1, r4, r7
 8000954:	1b40      	subs	r0, r0, r5
 8000956:	2880      	cmp	r0, #128	; 0x80
 8000958:	d900      	bls.n	800095c <lcd_put_char_xy+0x30>
 800095a:	2080      	movs	r0, #128	; 0x80
 800095c:	2940      	cmp	r1, #64	; 0x40
 800095e:	d900      	bls.n	8000962 <lcd_put_char_xy+0x36>
 8000960:	2140      	movs	r1, #64	; 0x40
 8000962:	9a00      	ldr	r2, [sp, #0]
 8000964:	4b06      	ldr	r3, [pc, #24]	; (8000980 <lcd_put_char_xy+0x54>)
 8000966:	189b      	adds	r3, r3, r2
 8000968:	5d1a      	ldrb	r2, [r3, r4]
 800096a:	9b01      	ldr	r3, [sp, #4]
 800096c:	3401      	adds	r4, #1
 800096e:	401a      	ands	r2, r3
 8000970:	f7ff fe8c 	bl	800068c <LCD_SH1106_set_pixel>
 8000974:	2c10      	cmp	r4, #16
 8000976:	d1ea      	bne.n	800094e <lcd_put_char_xy+0x22>
 8000978:	3501      	adds	r5, #1
 800097a:	2d08      	cmp	r5, #8
 800097c:	d1e2      	bne.n	8000944 <lcd_put_char_xy+0x18>
 800097e:	bdf7      	pop	{r0, r1, r2, r4, r5, r6, r7, pc}
 8000980:	08001ea9 	.word	0x08001ea9

08000984 <mpu6050_read>:
 8000984:	b538      	push	{r3, r4, r5, lr}
 8000986:	213b      	movs	r1, #59	; 0x3b
 8000988:	20d0      	movs	r0, #208	; 0xd0
 800098a:	f000 fbc9 	bl	8001120 <i2c_read_reg>
 800098e:	4c38      	ldr	r4, [pc, #224]	; (8000a70 <mpu6050_read+0xec>)
 8000990:	0205      	lsls	r5, r0, #8
 8000992:	b2ad      	uxth	r5, r5
 8000994:	213c      	movs	r1, #60	; 0x3c
 8000996:	20d0      	movs	r0, #208	; 0xd0
 8000998:	8025      	strh	r5, [r4, #0]
 800099a:	f000 fbc1 	bl	8001120 <i2c_read_reg>
 800099e:	213d      	movs	r1, #61	; 0x3d
 80009a0:	4305      	orrs	r5, r0
 80009a2:	20d0      	movs	r0, #208	; 0xd0
 80009a4:	8025      	strh	r5, [r4, #0]
 80009a6:	f000 fbbb 	bl	8001120 <i2c_read_reg>
 80009aa:	0205      	lsls	r5, r0, #8
 80009ac:	b2ad      	uxth	r5, r5
 80009ae:	213e      	movs	r1, #62	; 0x3e
 80009b0:	20d0      	movs	r0, #208	; 0xd0
 80009b2:	8065      	strh	r5, [r4, #2]
 80009b4:	f000 fbb4 	bl	8001120 <i2c_read_reg>
 80009b8:	213f      	movs	r1, #63	; 0x3f
 80009ba:	4305      	orrs	r5, r0
 80009bc:	20d0      	movs	r0, #208	; 0xd0
 80009be:	8065      	strh	r5, [r4, #2]
 80009c0:	f000 fbae 	bl	8001120 <i2c_read_reg>
 80009c4:	0205      	lsls	r5, r0, #8
 80009c6:	b2ad      	uxth	r5, r5
 80009c8:	2140      	movs	r1, #64	; 0x40
 80009ca:	20d0      	movs	r0, #208	; 0xd0
 80009cc:	80a5      	strh	r5, [r4, #4]
 80009ce:	f000 fba7 	bl	8001120 <i2c_read_reg>
 80009d2:	2141      	movs	r1, #65	; 0x41
 80009d4:	4305      	orrs	r5, r0
 80009d6:	20d0      	movs	r0, #208	; 0xd0
 80009d8:	80a5      	strh	r5, [r4, #4]
 80009da:	f000 fba1 	bl	8001120 <i2c_read_reg>
 80009de:	0205      	lsls	r5, r0, #8
 80009e0:	b2ad      	uxth	r5, r5
 80009e2:	2142      	movs	r1, #66	; 0x42
 80009e4:	20d0      	movs	r0, #208	; 0xd0
 80009e6:	8425      	strh	r5, [r4, #32]
 80009e8:	f000 fb9a 	bl	8001120 <i2c_read_reg>
 80009ec:	2143      	movs	r1, #67	; 0x43
 80009ee:	4305      	orrs	r5, r0
 80009f0:	20d0      	movs	r0, #208	; 0xd0
 80009f2:	8425      	strh	r5, [r4, #32]
 80009f4:	f000 fb94 	bl	8001120 <i2c_read_reg>
 80009f8:	0205      	lsls	r5, r0, #8
 80009fa:	b2ad      	uxth	r5, r5
 80009fc:	2144      	movs	r1, #68	; 0x44
 80009fe:	20d0      	movs	r0, #208	; 0xd0
 8000a00:	80e5      	strh	r5, [r4, #6]
 8000a02:	f000 fb8d 	bl	8001120 <i2c_read_reg>
 8000a06:	2145      	movs	r1, #69	; 0x45
 8000a08:	4305      	orrs	r5, r0
 8000a0a:	20d0      	movs	r0, #208	; 0xd0
 8000a0c:	80e5      	strh	r5, [r4, #6]
 8000a0e:	f000 fb87 	bl	8001120 <i2c_read_reg>
 8000a12:	0205      	lsls	r5, r0, #8
 8000a14:	b2ad      	uxth	r5, r5
 8000a16:	2146      	movs	r1, #70	; 0x46
 8000a18:	20d0      	movs	r0, #208	; 0xd0
 8000a1a:	8125      	strh	r5, [r4, #8]
 8000a1c:	f000 fb80 	bl	8001120 <i2c_read_reg>
 8000a20:	2147      	movs	r1, #71	; 0x47
 8000a22:	4305      	orrs	r5, r0
 8000a24:	20d0      	movs	r0, #208	; 0xd0
 8000a26:	8125      	strh	r5, [r4, #8]
 8000a28:	f000 fb7a 	bl	8001120 <i2c_read_reg>
 8000a2c:	0205      	lsls	r5, r0, #8
 8000a2e:	2148      	movs	r1, #72	; 0x48
 8000a30:	b2ad      	uxth	r5, r5
 8000a32:	20d0      	movs	r0, #208	; 0xd0
 8000a34:	8165      	strh	r5, [r4, #10]
 8000a36:	f000 fb73 	bl	8001120 <i2c_read_reg>
 8000a3a:	2106      	movs	r1, #6
 8000a3c:	5e62      	ldrsh	r2, [r4, r1]
 8000a3e:	210c      	movs	r1, #12
 8000a40:	5e63      	ldrsh	r3, [r4, r1]
 8000a42:	4305      	orrs	r5, r0
 8000a44:	1ad3      	subs	r3, r2, r3
 8000a46:	6962      	ldr	r2, [r4, #20]
 8000a48:	b2ad      	uxth	r5, r5
 8000a4a:	18d3      	adds	r3, r2, r3
 8000a4c:	6163      	str	r3, [r4, #20]
 8000a4e:	2308      	movs	r3, #8
 8000a50:	5ee2      	ldrsh	r2, [r4, r3]
 8000a52:	210e      	movs	r1, #14
 8000a54:	5e63      	ldrsh	r3, [r4, r1]
 8000a56:	8165      	strh	r5, [r4, #10]
 8000a58:	1ad3      	subs	r3, r2, r3
 8000a5a:	69a2      	ldr	r2, [r4, #24]
 8000a5c:	b22d      	sxth	r5, r5
 8000a5e:	18d3      	adds	r3, r2, r3
 8000a60:	61a3      	str	r3, [r4, #24]
 8000a62:	2110      	movs	r1, #16
 8000a64:	5e63      	ldrsh	r3, [r4, r1]
 8000a66:	69e2      	ldr	r2, [r4, #28]
 8000a68:	1aed      	subs	r5, r5, r3
 8000a6a:	1955      	adds	r5, r2, r5
 8000a6c:	61e5      	str	r5, [r4, #28]
 8000a6e:	bd38      	pop	{r3, r4, r5, pc}
 8000a70:	20000570 	.word	0x20000570

08000a74 <mpu6050_init>:
 8000a74:	b5f7      	push	{r0, r1, r2, r4, r5, r6, r7, lr}
 8000a76:	2600      	movs	r6, #0
 8000a78:	4c1a      	ldr	r4, [pc, #104]	; (8000ae4 <mpu6050_init+0x70>)
 8000a7a:	20d0      	movs	r0, #208	; 0xd0
 8000a7c:	216b      	movs	r1, #107	; 0x6b
 8000a7e:	1c32      	adds	r2, r6, #0
 8000a80:	8026      	strh	r6, [r4, #0]
 8000a82:	8066      	strh	r6, [r4, #2]
 8000a84:	80a6      	strh	r6, [r4, #4]
 8000a86:	80e6      	strh	r6, [r4, #6]
 8000a88:	8126      	strh	r6, [r4, #8]
 8000a8a:	8166      	strh	r6, [r4, #10]
 8000a8c:	2564      	movs	r5, #100	; 0x64
 8000a8e:	f000 fb35 	bl	80010fc <i2c_write_reg>
 8000a92:	1c37      	adds	r7, r6, #0
 8000a94:	9601      	str	r6, [sp, #4]
 8000a96:	f7ff ff75 	bl	8000984 <mpu6050_read>
 8000a9a:	200a      	movs	r0, #10
 8000a9c:	f000 f9e0 	bl	8000e60 <timer_delay_ms>
 8000aa0:	2206      	movs	r2, #6
 8000aa2:	5ea3      	ldrsh	r3, [r4, r2]
 8000aa4:	3d01      	subs	r5, #1
 8000aa6:	18ff      	adds	r7, r7, r3
 8000aa8:	2208      	movs	r2, #8
 8000aaa:	5ea3      	ldrsh	r3, [r4, r2]
 8000aac:	9a01      	ldr	r2, [sp, #4]
 8000aae:	18d2      	adds	r2, r2, r3
 8000ab0:	9201      	str	r2, [sp, #4]
 8000ab2:	220a      	movs	r2, #10
 8000ab4:	5ea3      	ldrsh	r3, [r4, r2]
 8000ab6:	18f6      	adds	r6, r6, r3
 8000ab8:	2d00      	cmp	r5, #0
 8000aba:	d1ec      	bne.n	8000a96 <mpu6050_init+0x22>
 8000abc:	1c38      	adds	r0, r7, #0
 8000abe:	2164      	movs	r1, #100	; 0x64
 8000ac0:	f001 f97c 	bl	8001dbc <__aeabi_idiv>
 8000ac4:	2164      	movs	r1, #100	; 0x64
 8000ac6:	81a0      	strh	r0, [r4, #12]
 8000ac8:	9801      	ldr	r0, [sp, #4]
 8000aca:	f001 f977 	bl	8001dbc <__aeabi_idiv>
 8000ace:	2164      	movs	r1, #100	; 0x64
 8000ad0:	81e0      	strh	r0, [r4, #14]
 8000ad2:	1c30      	adds	r0, r6, #0
 8000ad4:	f001 f972 	bl	8001dbc <__aeabi_idiv>
 8000ad8:	6165      	str	r5, [r4, #20]
 8000ada:	61a5      	str	r5, [r4, #24]
 8000adc:	61e5      	str	r5, [r4, #28]
 8000ade:	8220      	strh	r0, [r4, #16]
 8000ae0:	bdf7      	pop	{r0, r1, r2, r4, r5, r6, r7, pc}
 8000ae2:	46c0      	nop			; (mov r8, r8)
 8000ae4:	20000570 	.word	0x20000570

08000ae8 <child_thread>:
 8000ae8:	b538      	push	{r3, r4, r5, lr}
 8000aea:	2008      	movs	r0, #8
 8000aec:	f001 f8ba 	bl	8001c64 <led_on>
 8000af0:	f000 f9aa 	bl	8000e48 <timer_get_time>
 8000af4:	1c01      	adds	r1, r0, #0
 8000af6:	482d      	ldr	r0, [pc, #180]	; (8000bac <child_thread+0xc4>)
 8000af8:	f7ff fc9e 	bl	8000438 <printf_>
 8000afc:	4c2c      	ldr	r4, [pc, #176]	; (8000bb0 <child_thread+0xc8>)
 8000afe:	4d2d      	ldr	r5, [pc, #180]	; (8000bb4 <child_thread+0xcc>)
 8000b00:	2302      	movs	r3, #2
 8000b02:	5ee2      	ldrsh	r2, [r4, r3]
 8000b04:	2000      	movs	r0, #0
 8000b06:	5e21      	ldrsh	r1, [r4, r0]
 8000b08:	2004      	movs	r0, #4
 8000b0a:	5e23      	ldrsh	r3, [r4, r0]
 8000b0c:	1c28      	adds	r0, r5, #0
 8000b0e:	f7ff fc93 	bl	8000438 <printf_>
 8000b12:	2206      	movs	r2, #6
 8000b14:	5ea1      	ldrsh	r1, [r4, r2]
 8000b16:	2308      	movs	r3, #8
 8000b18:	5ee2      	ldrsh	r2, [r4, r3]
 8000b1a:	200a      	movs	r0, #10
 8000b1c:	5e23      	ldrsh	r3, [r4, r0]
 8000b1e:	1c28      	adds	r0, r5, #0
 8000b20:	f7ff fc8a 	bl	8000438 <printf_>
 8000b24:	4b24      	ldr	r3, [pc, #144]	; (8000bb8 <child_thread+0xd0>)
 8000b26:	2200      	movs	r2, #0
 8000b28:	5e99      	ldrsh	r1, [r3, r2]
 8000b2a:	2002      	movs	r0, #2
 8000b2c:	5e1a      	ldrsh	r2, [r3, r0]
 8000b2e:	2004      	movs	r0, #4
 8000b30:	5e1b      	ldrsh	r3, [r3, r0]
 8000b32:	1c28      	adds	r0, r5, #0
 8000b34:	f7ff fc80 	bl	8000438 <printf_>
 8000b38:	4820      	ldr	r0, [pc, #128]	; (8000bbc <child_thread+0xd4>)
 8000b3a:	f7ff fc7d 	bl	8000438 <printf_>
 8000b3e:	2008      	movs	r0, #8
 8000b40:	f001 f8a4 	bl	8001c8c <led_off>
 8000b44:	2206      	movs	r2, #6
 8000b46:	5ea0      	ldrsh	r0, [r4, r2]
 8000b48:	f7ff fd82 	bl	8000650 <mint_abs>
 8000b4c:	25fa      	movs	r5, #250	; 0xfa
 8000b4e:	00ad      	lsls	r5, r5, #2
 8000b50:	42a8      	cmp	r0, r5
 8000b52:	dd04      	ble.n	8000b5e <child_thread+0x76>
 8000b54:	2080      	movs	r0, #128	; 0x80
 8000b56:	0040      	lsls	r0, r0, #1
 8000b58:	f001 f884 	bl	8001c64 <led_on>
 8000b5c:	e003      	b.n	8000b66 <child_thread+0x7e>
 8000b5e:	2080      	movs	r0, #128	; 0x80
 8000b60:	0040      	lsls	r0, r0, #1
 8000b62:	f001 f893 	bl	8001c8c <led_off>
 8000b66:	2308      	movs	r3, #8
 8000b68:	5ee0      	ldrsh	r0, [r4, r3]
 8000b6a:	f7ff fd71 	bl	8000650 <mint_abs>
 8000b6e:	42a8      	cmp	r0, r5
 8000b70:	dd04      	ble.n	8000b7c <child_thread+0x94>
 8000b72:	2080      	movs	r0, #128	; 0x80
 8000b74:	0100      	lsls	r0, r0, #4
 8000b76:	f001 f875 	bl	8001c64 <led_on>
 8000b7a:	e003      	b.n	8000b84 <child_thread+0x9c>
 8000b7c:	2080      	movs	r0, #128	; 0x80
 8000b7e:	0100      	lsls	r0, r0, #4
 8000b80:	f001 f884 	bl	8001c8c <led_off>
 8000b84:	220a      	movs	r2, #10
 8000b86:	5ea0      	ldrsh	r0, [r4, r2]
 8000b88:	f7ff fd62 	bl	8000650 <mint_abs>
 8000b8c:	23fa      	movs	r3, #250	; 0xfa
 8000b8e:	009b      	lsls	r3, r3, #2
 8000b90:	4298      	cmp	r0, r3
 8000b92:	dd03      	ble.n	8000b9c <child_thread+0xb4>
 8000b94:	2002      	movs	r0, #2
 8000b96:	f001 f865 	bl	8001c64 <led_on>
 8000b9a:	e002      	b.n	8000ba2 <child_thread+0xba>
 8000b9c:	2002      	movs	r0, #2
 8000b9e:	f001 f875 	bl	8001c8c <led_off>
 8000ba2:	2064      	movs	r0, #100	; 0x64
 8000ba4:	f000 f95c 	bl	8000e60 <timer_delay_ms>
 8000ba8:	e79f      	b.n	8000aea <child_thread+0x2>
 8000baa:	46c0      	nop			; (mov r8, r8)
 8000bac:	080024a9 	.word	0x080024a9
 8000bb0:	20000570 	.word	0x20000570
 8000bb4:	080024b0 	.word	0x080024b0
 8000bb8:	20000164 	.word	0x20000164
 8000bbc:	08002544 	.word	0x08002544

08000bc0 <lcd_put_int>:
 8000bc0:	b5f0      	push	{r4, r5, r6, r7, lr}
 8000bc2:	2300      	movs	r3, #0
 8000bc4:	b087      	sub	sp, #28
 8000bc6:	1c04      	adds	r4, r0, #0
 8000bc8:	9100      	str	r1, [sp, #0]
 8000bca:	9201      	str	r2, [sp, #4]
 8000bcc:	1c1f      	adds	r7, r3, #0
 8000bce:	4298      	cmp	r0, r3
 8000bd0:	da01      	bge.n	8000bd6 <lcd_put_int+0x16>
 8000bd2:	4244      	negs	r4, r0
 8000bd4:	2701      	movs	r7, #1
 8000bd6:	ae03      	add	r6, sp, #12
 8000bd8:	72f3      	strb	r3, [r6, #11]
 8000bda:	250a      	movs	r5, #10
 8000bdc:	1c20      	adds	r0, r4, #0
 8000bde:	210a      	movs	r1, #10
 8000be0:	f001 f942 	bl	8001e68 <__aeabi_idivmod>
 8000be4:	3130      	adds	r1, #48	; 0x30
 8000be6:	5571      	strb	r1, [r6, r5]
 8000be8:	1c20      	adds	r0, r4, #0
 8000bea:	210a      	movs	r1, #10
 8000bec:	f001 f8e6 	bl	8001dbc <__aeabi_idiv>
 8000bf0:	1e6b      	subs	r3, r5, #1
 8000bf2:	1e04      	subs	r4, r0, #0
 8000bf4:	d001      	beq.n	8000bfa <lcd_put_int+0x3a>
 8000bf6:	1c1d      	adds	r5, r3, #0
 8000bf8:	e7f0      	b.n	8000bdc <lcd_put_int+0x1c>
 8000bfa:	2f00      	cmp	r7, #0
 8000bfc:	d002      	beq.n	8000c04 <lcd_put_int+0x44>
 8000bfe:	222d      	movs	r2, #45	; 0x2d
 8000c00:	54f2      	strb	r2, [r6, r3]
 8000c02:	1c1d      	adds	r5, r3, #0
 8000c04:	2400      	movs	r4, #0
 8000c06:	1973      	adds	r3, r6, r5
 8000c08:	5d1f      	ldrb	r7, [r3, r4]
 8000c0a:	9b00      	ldr	r3, [sp, #0]
 8000c0c:	00e0      	lsls	r0, r4, #3
 8000c0e:	18c0      	adds	r0, r0, r3
 8000c10:	9901      	ldr	r1, [sp, #4]
 8000c12:	1c3a      	adds	r2, r7, #0
 8000c14:	f7ff fe8a 	bl	800092c <lcd_put_char_xy>
 8000c18:	2f00      	cmp	r7, #0
 8000c1a:	d002      	beq.n	8000c22 <lcd_put_int+0x62>
 8000c1c:	3401      	adds	r4, #1
 8000c1e:	2c0c      	cmp	r4, #12
 8000c20:	d1f1      	bne.n	8000c06 <lcd_put_int+0x46>
 8000c22:	b007      	add	sp, #28
 8000c24:	bdf0      	pop	{r4, r5, r6, r7, pc}
	...

08000c28 <main_thread>:
 8000c28:	b538      	push	{r3, r4, r5, lr}
 8000c2a:	2008      	movs	r0, #8
 8000c2c:	f001 f81a 	bl	8001c64 <led_on>
 8000c30:	4828      	ldr	r0, [pc, #160]	; (8000cd4 <main_thread+0xac>)
 8000c32:	f7ff fc01 	bl	8000438 <printf_>
 8000c36:	f7ff fcaf 	bl	8000598 <hmc5883_init>
 8000c3a:	f7ff ff1b 	bl	8000a74 <mpu6050_init>
 8000c3e:	f7ff fe17 	bl	8000870 <LCD_SH1106_init>
 8000c42:	20ff      	movs	r0, #255	; 0xff
 8000c44:	f7ff fd40 	bl	80006c8 <LCD_SH1106_clear_buffer>
 8000c48:	2280      	movs	r2, #128	; 0x80
 8000c4a:	4923      	ldr	r1, [pc, #140]	; (8000cd8 <main_thread+0xb0>)
 8000c4c:	4823      	ldr	r0, [pc, #140]	; (8000cdc <main_thread+0xb4>)
 8000c4e:	0052      	lsls	r2, r2, #1
 8000c50:	2308      	movs	r3, #8
 8000c52:	f7ff fac5 	bl	80001e0 <create_thread>
 8000c56:	2000      	movs	r0, #0
 8000c58:	2132      	movs	r1, #50	; 0x32
 8000c5a:	f000 f911 	bl	8000e80 <event_timer_set_period>
 8000c5e:	2000      	movs	r0, #0
 8000c60:	f000 f920 	bl	8000ea4 <event_timer_get_flag>
 8000c64:	2800      	cmp	r0, #0
 8000c66:	d006      	beq.n	8000c76 <main_thread+0x4e>
 8000c68:	2000      	movs	r0, #0
 8000c6a:	f000 f929 	bl	8000ec0 <event_timer_clear_flag>
 8000c6e:	f7ff fcc3 	bl	80005f8 <hmc5883_read>
 8000c72:	f7ff fe87 	bl	8000984 <mpu6050_read>
 8000c76:	f7ff fd8f 	bl	8000798 <LCD_SH1106_flush_buffer_partial>
 8000c7a:	1e04      	subs	r4, r0, #0
 8000c7c:	d1ef      	bne.n	8000c5e <main_thread+0x36>
 8000c7e:	f7ff fd23 	bl	80006c8 <LCD_SH1106_clear_buffer>
 8000c82:	4d17      	ldr	r5, [pc, #92]	; (8000ce0 <main_thread+0xb8>)
 8000c84:	1c21      	adds	r1, r4, #0
 8000c86:	2306      	movs	r3, #6
 8000c88:	5ee8      	ldrsh	r0, [r5, r3]
 8000c8a:	1c22      	adds	r2, r4, #0
 8000c8c:	f7ff ff98 	bl	8000bc0 <lcd_put_int>
 8000c90:	2308      	movs	r3, #8
 8000c92:	5ee8      	ldrsh	r0, [r5, r3]
 8000c94:	1c21      	adds	r1, r4, #0
 8000c96:	2210      	movs	r2, #16
 8000c98:	f7ff ff92 	bl	8000bc0 <lcd_put_int>
 8000c9c:	230a      	movs	r3, #10
 8000c9e:	5ee8      	ldrsh	r0, [r5, r3]
 8000ca0:	1c21      	adds	r1, r4, #0
 8000ca2:	2220      	movs	r2, #32
 8000ca4:	f7ff ff8c 	bl	8000bc0 <lcd_put_int>
 8000ca8:	6968      	ldr	r0, [r5, #20]
 8000caa:	1c22      	adds	r2, r4, #0
 8000cac:	2140      	movs	r1, #64	; 0x40
 8000cae:	f7ff ff87 	bl	8000bc0 <lcd_put_int>
 8000cb2:	69a8      	ldr	r0, [r5, #24]
 8000cb4:	2140      	movs	r1, #64	; 0x40
 8000cb6:	2210      	movs	r2, #16
 8000cb8:	f7ff ff82 	bl	8000bc0 <lcd_put_int>
 8000cbc:	69e8      	ldr	r0, [r5, #28]
 8000cbe:	2140      	movs	r1, #64	; 0x40
 8000cc0:	2220      	movs	r2, #32
 8000cc2:	f7ff ff7d 	bl	8000bc0 <lcd_put_int>
 8000cc6:	f000 f8bf 	bl	8000e48 <timer_get_time>
 8000cca:	1c21      	adds	r1, r4, #0
 8000ccc:	2230      	movs	r2, #48	; 0x30
 8000cce:	f7ff ff77 	bl	8000bc0 <lcd_put_int>
 8000cd2:	e7c4      	b.n	8000c5e <main_thread+0x36>
 8000cd4:	080024bc 	.word	0x080024bc
 8000cd8:	20000594 	.word	0x20000594
 8000cdc:	08000ae9 	.word	0x08000ae9
 8000ce0:	20000570 	.word	0x20000570

08000ce4 <mem_info_print>:
 8000ce4:	b538      	push	{r3, r4, r5, lr}
 8000ce6:	480e      	ldr	r0, [pc, #56]	; (8000d20 <mem_info_print+0x3c>)
 8000ce8:	490e      	ldr	r1, [pc, #56]	; (8000d24 <mem_info_print+0x40>)
 8000cea:	f7ff fba5 	bl	8000438 <printf_>
 8000cee:	4c0e      	ldr	r4, [pc, #56]	; (8000d28 <mem_info_print+0x44>)
 8000cf0:	480e      	ldr	r0, [pc, #56]	; (8000d2c <mem_info_print+0x48>)
 8000cf2:	1c21      	adds	r1, r4, #0
 8000cf4:	f7ff fba0 	bl	8000438 <printf_>
 8000cf8:	4d0d      	ldr	r5, [pc, #52]	; (8000d30 <mem_info_print+0x4c>)
 8000cfa:	480e      	ldr	r0, [pc, #56]	; (8000d34 <mem_info_print+0x50>)
 8000cfc:	1b2d      	subs	r5, r5, r4
 8000cfe:	1c29      	adds	r1, r5, #0
 8000d00:	f7ff fb9a 	bl	8000438 <printf_>
 8000d04:	490c      	ldr	r1, [pc, #48]	; (8000d38 <mem_info_print+0x54>)
 8000d06:	480d      	ldr	r0, [pc, #52]	; (8000d3c <mem_info_print+0x58>)
 8000d08:	1a64      	subs	r4, r4, r1
 8000d0a:	1929      	adds	r1, r5, r4
 8000d0c:	f7ff fb94 	bl	8000438 <printf_>
 8000d10:	490b      	ldr	r1, [pc, #44]	; (8000d40 <mem_info_print+0x5c>)
 8000d12:	480c      	ldr	r0, [pc, #48]	; (8000d44 <mem_info_print+0x60>)
 8000d14:	f7ff fb90 	bl	8000438 <printf_>
 8000d18:	480b      	ldr	r0, [pc, #44]	; (8000d48 <mem_info_print+0x64>)
 8000d1a:	f7ff fb8d 	bl	8000438 <printf_>
 8000d1e:	bd38      	pop	{r3, r4, r5, pc}
 8000d20:	080024f7 	.word	0x080024f7
 8000d24:	08001e80 	.word	0x08001e80
 8000d28:	20000000 	.word	0x20000000
 8000d2c:	08002508 	.word	0x08002508
 8000d30:	20001000 	.word	0x20001000
 8000d34:	08002517 	.word	0x08002517
 8000d38:	200007b0 	.word	0x200007b0
 8000d3c:	08002525 	.word	0x08002525
 8000d40:	200007b0 	.word	0x200007b0
 8000d44:	08002533 	.word	0x08002533
 8000d48:	08002543 	.word	0x08002543

08000d4c <main>:
 8000d4c:	b508      	push	{r3, lr}
 8000d4e:	f000 fa6f 	bl	8001230 <lib_low_level_init>
 8000d52:	f7ff fbeb 	bl	800052c <lib_os_init>
 8000d56:	f7ff ffc5 	bl	8000ce4 <mem_info_print>
 8000d5a:	2280      	movs	r2, #128	; 0x80
 8000d5c:	4904      	ldr	r1, [pc, #16]	; (8000d70 <main+0x24>)
 8000d5e:	0052      	lsls	r2, r2, #1
 8000d60:	2308      	movs	r3, #8
 8000d62:	4804      	ldr	r0, [pc, #16]	; (8000d74 <main+0x28>)
 8000d64:	f7ff fa3c 	bl	80001e0 <create_thread>
 8000d68:	f7ff fa34 	bl	80001d4 <kernel_start>
 8000d6c:	2000      	movs	r0, #0
 8000d6e:	bd08      	pop	{r3, pc}
 8000d70:	20000694 	.word	0x20000694
 8000d74:	08000c29 	.word	0x08000c29

08000d78 <timer_init>:
 8000d78:	b530      	push	{r4, r5, lr}
 8000d7a:	2300      	movs	r3, #0
 8000d7c:	b085      	sub	sp, #20
 8000d7e:	481b      	ldr	r0, [pc, #108]	; (8000dec <timer_init+0x74>)
 8000d80:	2180      	movs	r1, #128	; 0x80
 8000d82:	005a      	lsls	r2, r3, #1
 8000d84:	00c9      	lsls	r1, r1, #3
 8000d86:	5211      	strh	r1, [r2, r0]
 8000d88:	4819      	ldr	r0, [pc, #100]	; (8000df0 <timer_init+0x78>)
 8000d8a:	2400      	movs	r4, #0
 8000d8c:	5211      	strh	r1, [r2, r0]
 8000d8e:	4919      	ldr	r1, [pc, #100]	; (8000df4 <timer_init+0x7c>)
 8000d90:	3301      	adds	r3, #1
 8000d92:	5254      	strh	r4, [r2, r1]
 8000d94:	2b04      	cmp	r3, #4
 8000d96:	d1f2      	bne.n	8000d7e <timer_init+0x6>
 8000d98:	4b17      	ldr	r3, [pc, #92]	; (8000df8 <timer_init+0x80>)
 8000d9a:	2001      	movs	r0, #1
 8000d9c:	1c01      	adds	r1, r0, #0
 8000d9e:	601c      	str	r4, [r3, #0]
 8000da0:	f000 fef2 	bl	8001b88 <RCC_APB1PeriphClockCmd>
 8000da4:	a901      	add	r1, sp, #4
 8000da6:	2330      	movs	r3, #48	; 0x30
 8000da8:	800b      	strh	r3, [r1, #0]
 8000daa:	2080      	movs	r0, #128	; 0x80
 8000dac:	23fa      	movs	r3, #250	; 0xfa
 8000dae:	009b      	lsls	r3, r3, #2
 8000db0:	05c0      	lsls	r0, r0, #23
 8000db2:	604b      	str	r3, [r1, #4]
 8000db4:	804c      	strh	r4, [r1, #2]
 8000db6:	810c      	strh	r4, [r1, #8]
 8000db8:	728c      	strb	r4, [r1, #10]
 8000dba:	f000 fb0f 	bl	80013dc <TIM_TimeBaseInit>
 8000dbe:	2080      	movs	r0, #128	; 0x80
 8000dc0:	05c0      	lsls	r0, r0, #23
 8000dc2:	2101      	movs	r1, #1
 8000dc4:	f000 fb8c 	bl	80014e0 <TIM_Cmd>
 8000dc8:	2080      	movs	r0, #128	; 0x80
 8000dca:	2102      	movs	r1, #2
 8000dcc:	05c0      	lsls	r0, r0, #23
 8000dce:	2201      	movs	r2, #1
 8000dd0:	f000 fbca 	bl	8001568 <TIM_ITConfig>
 8000dd4:	466a      	mov	r2, sp
 8000dd6:	230f      	movs	r3, #15
 8000dd8:	7013      	strb	r3, [r2, #0]
 8000dda:	4668      	mov	r0, sp
 8000ddc:	2301      	movs	r3, #1
 8000dde:	7053      	strb	r3, [r2, #1]
 8000de0:	7093      	strb	r3, [r2, #2]
 8000de2:	f000 fd93 	bl	800190c <NVIC_Init>
 8000de6:	b005      	add	sp, #20
 8000de8:	bd30      	pop	{r4, r5, pc}
 8000dea:	46c0      	nop			; (mov r8, r8)
 8000dec:	200007a8 	.word	0x200007a8
 8000df0:	2000079c 	.word	0x2000079c
 8000df4:	20000794 	.word	0x20000794
 8000df8:	200007a4 	.word	0x200007a4

08000dfc <TIM2_IRQHandler>:
 8000dfc:	2200      	movs	r2, #0
 8000dfe:	490e      	ldr	r1, [pc, #56]	; (8000e38 <TIM2_IRQHandler+0x3c>)
 8000e00:	0053      	lsls	r3, r2, #1
 8000e02:	5a58      	ldrh	r0, [r3, r1]
 8000e04:	2800      	cmp	r0, #0
 8000e06:	d003      	beq.n	8000e10 <TIM2_IRQHandler+0x14>
 8000e08:	5a58      	ldrh	r0, [r3, r1]
 8000e0a:	3801      	subs	r0, #1
 8000e0c:	b280      	uxth	r0, r0
 8000e0e:	e005      	b.n	8000e1c <TIM2_IRQHandler+0x20>
 8000e10:	480a      	ldr	r0, [pc, #40]	; (8000e3c <TIM2_IRQHandler+0x40>)
 8000e12:	5a18      	ldrh	r0, [r3, r0]
 8000e14:	b280      	uxth	r0, r0
 8000e16:	5258      	strh	r0, [r3, r1]
 8000e18:	4909      	ldr	r1, [pc, #36]	; (8000e40 <TIM2_IRQHandler+0x44>)
 8000e1a:	2001      	movs	r0, #1
 8000e1c:	3201      	adds	r2, #1
 8000e1e:	5258      	strh	r0, [r3, r1]
 8000e20:	2a04      	cmp	r2, #4
 8000e22:	d1ec      	bne.n	8000dfe <TIM2_IRQHandler+0x2>
 8000e24:	4b07      	ldr	r3, [pc, #28]	; (8000e44 <TIM2_IRQHandler+0x48>)
 8000e26:	681a      	ldr	r2, [r3, #0]
 8000e28:	3201      	adds	r2, #1
 8000e2a:	601a      	str	r2, [r3, #0]
 8000e2c:	2380      	movs	r3, #128	; 0x80
 8000e2e:	2200      	movs	r2, #0
 8000e30:	05db      	lsls	r3, r3, #23
 8000e32:	821a      	strh	r2, [r3, #16]
 8000e34:	4770      	bx	lr
 8000e36:	46c0      	nop			; (mov r8, r8)
 8000e38:	200007a8 	.word	0x200007a8
 8000e3c:	2000079c 	.word	0x2000079c
 8000e40:	20000794 	.word	0x20000794
 8000e44:	200007a4 	.word	0x200007a4

08000e48 <timer_get_time>:
 8000e48:	b082      	sub	sp, #8
 8000e4a:	b672      	cpsid	i
 8000e4c:	4b03      	ldr	r3, [pc, #12]	; (8000e5c <timer_get_time+0x14>)
 8000e4e:	681b      	ldr	r3, [r3, #0]
 8000e50:	9301      	str	r3, [sp, #4]
 8000e52:	b662      	cpsie	i
 8000e54:	9801      	ldr	r0, [sp, #4]
 8000e56:	b002      	add	sp, #8
 8000e58:	4770      	bx	lr
 8000e5a:	46c0      	nop			; (mov r8, r8)
 8000e5c:	200007a4 	.word	0x200007a4

08000e60 <timer_delay_ms>:
 8000e60:	b513      	push	{r0, r1, r4, lr}
 8000e62:	1c04      	adds	r4, r0, #0
 8000e64:	f7ff fff0 	bl	8000e48 <timer_get_time>
 8000e68:	1904      	adds	r4, r0, r4
 8000e6a:	9401      	str	r4, [sp, #4]
 8000e6c:	9c01      	ldr	r4, [sp, #4]
 8000e6e:	f7ff ffeb 	bl	8000e48 <timer_get_time>
 8000e72:	4284      	cmp	r4, r0
 8000e74:	d902      	bls.n	8000e7c <timer_delay_ms+0x1c>
 8000e76:	f000 f979 	bl	800116c <sleep>
 8000e7a:	e7f7      	b.n	8000e6c <timer_delay_ms+0xc>
 8000e7c:	bd13      	pop	{r0, r1, r4, pc}
	...

08000e80 <event_timer_set_period>:
 8000e80:	b672      	cpsid	i
 8000e82:	4b05      	ldr	r3, [pc, #20]	; (8000e98 <event_timer_set_period+0x18>)
 8000e84:	0040      	lsls	r0, r0, #1
 8000e86:	52c1      	strh	r1, [r0, r3]
 8000e88:	4b04      	ldr	r3, [pc, #16]	; (8000e9c <event_timer_set_period+0x1c>)
 8000e8a:	2200      	movs	r2, #0
 8000e8c:	52c1      	strh	r1, [r0, r3]
 8000e8e:	4b04      	ldr	r3, [pc, #16]	; (8000ea0 <event_timer_set_period+0x20>)
 8000e90:	52c2      	strh	r2, [r0, r3]
 8000e92:	b662      	cpsie	i
 8000e94:	4770      	bx	lr
 8000e96:	46c0      	nop			; (mov r8, r8)
 8000e98:	200007a8 	.word	0x200007a8
 8000e9c:	2000079c 	.word	0x2000079c
 8000ea0:	20000794 	.word	0x20000794

08000ea4 <event_timer_get_flag>:
 8000ea4:	b082      	sub	sp, #8
 8000ea6:	b672      	cpsid	i
 8000ea8:	4b04      	ldr	r3, [pc, #16]	; (8000ebc <event_timer_get_flag+0x18>)
 8000eaa:	0040      	lsls	r0, r0, #1
 8000eac:	5ac3      	ldrh	r3, [r0, r3]
 8000eae:	b29b      	uxth	r3, r3
 8000eb0:	9301      	str	r3, [sp, #4]
 8000eb2:	b662      	cpsie	i
 8000eb4:	9801      	ldr	r0, [sp, #4]
 8000eb6:	b002      	add	sp, #8
 8000eb8:	4770      	bx	lr
 8000eba:	46c0      	nop			; (mov r8, r8)
 8000ebc:	20000794 	.word	0x20000794

08000ec0 <event_timer_clear_flag>:
 8000ec0:	b672      	cpsid	i
 8000ec2:	4b03      	ldr	r3, [pc, #12]	; (8000ed0 <event_timer_clear_flag+0x10>)
 8000ec4:	0040      	lsls	r0, r0, #1
 8000ec6:	2200      	movs	r2, #0
 8000ec8:	52c2      	strh	r2, [r0, r3]
 8000eca:	b662      	cpsie	i
 8000ecc:	4770      	bx	lr
 8000ece:	46c0      	nop			; (mov r8, r8)
 8000ed0:	20000794 	.word	0x20000794

08000ed4 <uart_write>:
 8000ed4:	4b03      	ldr	r3, [pc, #12]	; (8000ee4 <uart_write+0x10>)
 8000ed6:	69da      	ldr	r2, [r3, #28]
 8000ed8:	0611      	lsls	r1, r2, #24
 8000eda:	d401      	bmi.n	8000ee0 <uart_write+0xc>
 8000edc:	46c0      	nop			; (mov r8, r8)
 8000ede:	e7f9      	b.n	8000ed4 <uart_write>
 8000ee0:	8518      	strh	r0, [r3, #40]	; 0x28
 8000ee2:	4770      	bx	lr
 8000ee4:	40013800 	.word	0x40013800

08000ee8 <uart_init>:
 8000ee8:	b570      	push	{r4, r5, r6, lr}
 8000eea:	2080      	movs	r0, #128	; 0x80
 8000eec:	b088      	sub	sp, #32
 8000eee:	0280      	lsls	r0, r0, #10
 8000ef0:	2101      	movs	r1, #1
 8000ef2:	f000 fe09 	bl	8001b08 <RCC_AHBPeriphClockCmd>
 8000ef6:	2690      	movs	r6, #144	; 0x90
 8000ef8:	2080      	movs	r0, #128	; 0x80
 8000efa:	05f6      	lsls	r6, r6, #23
 8000efc:	01c0      	lsls	r0, r0, #7
 8000efe:	2101      	movs	r1, #1
 8000f00:	f000 fe22 	bl	8001b48 <RCC_APB2PeriphClockCmd>
 8000f04:	1c30      	adds	r0, r6, #0
 8000f06:	2102      	movs	r1, #2
 8000f08:	2201      	movs	r2, #1
 8000f0a:	f000 fa21 	bl	8001350 <GPIO_PinAFConfig>
 8000f0e:	1c30      	adds	r0, r6, #0
 8000f10:	210f      	movs	r1, #15
 8000f12:	2201      	movs	r2, #1
 8000f14:	f000 fa1c 	bl	8001350 <GPIO_PinAFConfig>
 8000f18:	4b10      	ldr	r3, [pc, #64]	; (8000f5c <uart_init+0x74>)
 8000f1a:	466a      	mov	r2, sp
 8000f1c:	2400      	movs	r4, #0
 8000f1e:	2501      	movs	r5, #1
 8000f20:	9300      	str	r3, [sp, #0]
 8000f22:	1c30      	adds	r0, r6, #0
 8000f24:	2302      	movs	r3, #2
 8000f26:	4669      	mov	r1, sp
 8000f28:	7113      	strb	r3, [r2, #4]
 8000f2a:	7194      	strb	r4, [r2, #6]
 8000f2c:	7155      	strb	r5, [r2, #5]
 8000f2e:	71d5      	strb	r5, [r2, #7]
 8000f30:	f000 f98a 	bl	8001248 <GPIO_Init>
 8000f34:	9403      	str	r4, [sp, #12]
 8000f36:	9404      	str	r4, [sp, #16]
 8000f38:	9405      	str	r4, [sp, #20]
 8000f3a:	9407      	str	r4, [sp, #28]
 8000f3c:	23e1      	movs	r3, #225	; 0xe1
 8000f3e:	4c08      	ldr	r4, [pc, #32]	; (8000f60 <uart_init+0x78>)
 8000f40:	025b      	lsls	r3, r3, #9
 8000f42:	9302      	str	r3, [sp, #8]
 8000f44:	1c20      	adds	r0, r4, #0
 8000f46:	230c      	movs	r3, #12
 8000f48:	a902      	add	r1, sp, #8
 8000f4a:	9306      	str	r3, [sp, #24]
 8000f4c:	f000 fb5c 	bl	8001608 <USART_Init>
 8000f50:	1c20      	adds	r0, r4, #0
 8000f52:	1c29      	adds	r1, r5, #0
 8000f54:	f000 fc26 	bl	80017a4 <USART_Cmd>
 8000f58:	b008      	add	sp, #32
 8000f5a:	bd70      	pop	{r4, r5, r6, pc}
 8000f5c:	00008004 	.word	0x00008004
 8000f60:	40013800 	.word	0x40013800

08000f64 <USART1_IRQHandler>:
 8000f64:	b508      	push	{r3, lr}
 8000f66:	4802      	ldr	r0, [pc, #8]	; (8000f70 <USART1_IRQHandler+0xc>)
 8000f68:	4902      	ldr	r1, [pc, #8]	; (8000f74 <USART1_IRQHandler+0x10>)
 8000f6a:	f000 fc5b 	bl	8001824 <USART_ClearITPendingBit>
 8000f6e:	bd08      	pop	{r3, pc}
 8000f70:	40013800 	.word	0x40013800
 8000f74:	00050105 	.word	0x00050105

08000f78 <i2c_delay>:
 8000f78:	46c0      	nop			; (mov r8, r8)
 8000f7a:	4770      	bx	lr

08000f7c <SetLowSDA>:
 8000f7c:	b508      	push	{r3, lr}
 8000f7e:	b672      	cpsid	i
 8000f80:	4b07      	ldr	r3, [pc, #28]	; (8000fa0 <SetLowSDA+0x24>)
 8000f82:	2210      	movs	r2, #16
 8000f84:	851a      	strh	r2, [r3, #40]	; 0x28
 8000f86:	685a      	ldr	r2, [r3, #4]
 8000f88:	b292      	uxth	r2, r2
 8000f8a:	809a      	strh	r2, [r3, #4]
 8000f8c:	6819      	ldr	r1, [r3, #0]
 8000f8e:	2280      	movs	r2, #128	; 0x80
 8000f90:	0052      	lsls	r2, r2, #1
 8000f92:	430a      	orrs	r2, r1
 8000f94:	601a      	str	r2, [r3, #0]
 8000f96:	b662      	cpsie	i
 8000f98:	f7ff ffee 	bl	8000f78 <i2c_delay>
 8000f9c:	bd08      	pop	{r3, pc}
 8000f9e:	46c0      	nop			; (mov r8, r8)
 8000fa0:	48000400 	.word	0x48000400

08000fa4 <SetHighSDA>:
 8000fa4:	b508      	push	{r3, lr}
 8000fa6:	b672      	cpsid	i
 8000fa8:	4b07      	ldr	r3, [pc, #28]	; (8000fc8 <SetHighSDA+0x24>)
 8000faa:	2210      	movs	r2, #16
 8000fac:	619a      	str	r2, [r3, #24]
 8000fae:	6859      	ldr	r1, [r3, #4]
 8000fb0:	b289      	uxth	r1, r1
 8000fb2:	4391      	bics	r1, r2
 8000fb4:	8099      	strh	r1, [r3, #4]
 8000fb6:	6819      	ldr	r1, [r3, #0]
 8000fb8:	4a04      	ldr	r2, [pc, #16]	; (8000fcc <SetHighSDA+0x28>)
 8000fba:	400a      	ands	r2, r1
 8000fbc:	601a      	str	r2, [r3, #0]
 8000fbe:	b662      	cpsie	i
 8000fc0:	f7ff ffda 	bl	8000f78 <i2c_delay>
 8000fc4:	bd08      	pop	{r3, pc}
 8000fc6:	46c0      	nop			; (mov r8, r8)
 8000fc8:	48000400 	.word	0x48000400
 8000fcc:	fffffcff 	.word	0xfffffcff

08000fd0 <SetLowSCL>:
 8000fd0:	b508      	push	{r3, lr}
 8000fd2:	4b03      	ldr	r3, [pc, #12]	; (8000fe0 <SetLowSCL+0x10>)
 8000fd4:	2220      	movs	r2, #32
 8000fd6:	851a      	strh	r2, [r3, #40]	; 0x28
 8000fd8:	f7ff ffce 	bl	8000f78 <i2c_delay>
 8000fdc:	bd08      	pop	{r3, pc}
 8000fde:	46c0      	nop			; (mov r8, r8)
 8000fe0:	48000400 	.word	0x48000400

08000fe4 <SetHighSCL>:
 8000fe4:	b508      	push	{r3, lr}
 8000fe6:	4b03      	ldr	r3, [pc, #12]	; (8000ff4 <SetHighSCL+0x10>)
 8000fe8:	2220      	movs	r2, #32
 8000fea:	619a      	str	r2, [r3, #24]
 8000fec:	f7ff ffc4 	bl	8000f78 <i2c_delay>
 8000ff0:	bd08      	pop	{r3, pc}
 8000ff2:	46c0      	nop			; (mov r8, r8)
 8000ff4:	48000400 	.word	0x48000400

08000ff8 <i2c_0_init>:
 8000ff8:	b507      	push	{r0, r1, r2, lr}
 8000ffa:	2330      	movs	r3, #48	; 0x30
 8000ffc:	4669      	mov	r1, sp
 8000ffe:	9300      	str	r3, [sp, #0]
 8001000:	2301      	movs	r3, #1
 8001002:	710b      	strb	r3, [r1, #4]
 8001004:	2203      	movs	r2, #3
 8001006:	2300      	movs	r3, #0
 8001008:	4806      	ldr	r0, [pc, #24]	; (8001024 <i2c_0_init+0x2c>)
 800100a:	718b      	strb	r3, [r1, #6]
 800100c:	714a      	strb	r2, [r1, #5]
 800100e:	71cb      	strb	r3, [r1, #7]
 8001010:	f000 f91a 	bl	8001248 <GPIO_Init>
 8001014:	f7ff ffe6 	bl	8000fe4 <SetHighSCL>
 8001018:	f7ff ffb0 	bl	8000f7c <SetLowSDA>
 800101c:	f7ff ffc2 	bl	8000fa4 <SetHighSDA>
 8001020:	bd07      	pop	{r0, r1, r2, pc}
 8001022:	46c0      	nop			; (mov r8, r8)
 8001024:	48000400 	.word	0x48000400

08001028 <i2cStart>:
 8001028:	b508      	push	{r3, lr}
 800102a:	f7ff ffdb 	bl	8000fe4 <SetHighSCL>
 800102e:	f7ff ffb9 	bl	8000fa4 <SetHighSDA>
 8001032:	f7ff ffd7 	bl	8000fe4 <SetHighSCL>
 8001036:	f7ff ffa1 	bl	8000f7c <SetLowSDA>
 800103a:	f7ff ffc9 	bl	8000fd0 <SetLowSCL>
 800103e:	f7ff ffb1 	bl	8000fa4 <SetHighSDA>
 8001042:	bd08      	pop	{r3, pc}

08001044 <i2cStop>:
 8001044:	b508      	push	{r3, lr}
 8001046:	f7ff ffc3 	bl	8000fd0 <SetLowSCL>
 800104a:	f7ff ff97 	bl	8000f7c <SetLowSDA>
 800104e:	f7ff ffc9 	bl	8000fe4 <SetHighSCL>
 8001052:	f7ff ff93 	bl	8000f7c <SetLowSDA>
 8001056:	f7ff ffc5 	bl	8000fe4 <SetHighSCL>
 800105a:	f7ff ffa3 	bl	8000fa4 <SetHighSDA>
 800105e:	bd08      	pop	{r3, pc}

08001060 <i2cWrite>:
 8001060:	b538      	push	{r3, r4, r5, lr}
 8001062:	1c05      	adds	r5, r0, #0
 8001064:	2408      	movs	r4, #8
 8001066:	f7ff ffb3 	bl	8000fd0 <SetLowSCL>
 800106a:	b26b      	sxtb	r3, r5
 800106c:	2b00      	cmp	r3, #0
 800106e:	da02      	bge.n	8001076 <i2cWrite+0x16>
 8001070:	f7ff ff98 	bl	8000fa4 <SetHighSDA>
 8001074:	e001      	b.n	800107a <i2cWrite+0x1a>
 8001076:	f7ff ff81 	bl	8000f7c <SetLowSDA>
 800107a:	3c01      	subs	r4, #1
 800107c:	006d      	lsls	r5, r5, #1
 800107e:	b2e4      	uxtb	r4, r4
 8001080:	f7ff ffb0 	bl	8000fe4 <SetHighSCL>
 8001084:	b2ed      	uxtb	r5, r5
 8001086:	2c00      	cmp	r4, #0
 8001088:	d1ed      	bne.n	8001066 <i2cWrite+0x6>
 800108a:	f7ff ffa1 	bl	8000fd0 <SetLowSCL>
 800108e:	f7ff ff89 	bl	8000fa4 <SetHighSDA>
 8001092:	f7ff ffa7 	bl	8000fe4 <SetHighSCL>
 8001096:	4b05      	ldr	r3, [pc, #20]	; (80010ac <i2cWrite+0x4c>)
 8001098:	691c      	ldr	r4, [r3, #16]
 800109a:	f7ff ff99 	bl	8000fd0 <SetLowSCL>
 800109e:	b2a4      	uxth	r4, r4
 80010a0:	f7ff ff6a 	bl	8000f78 <i2c_delay>
 80010a4:	0924      	lsrs	r4, r4, #4
 80010a6:	2001      	movs	r0, #1
 80010a8:	43a0      	bics	r0, r4
 80010aa:	bd38      	pop	{r3, r4, r5, pc}
 80010ac:	48000400 	.word	0x48000400

080010b0 <i2cRead>:
 80010b0:	b570      	push	{r4, r5, r6, lr}
 80010b2:	1c06      	adds	r6, r0, #0
 80010b4:	f7ff ff8c 	bl	8000fd0 <SetLowSCL>
 80010b8:	f7ff ff74 	bl	8000fa4 <SetHighSDA>
 80010bc:	2508      	movs	r5, #8
 80010be:	2400      	movs	r4, #0
 80010c0:	f7ff ff90 	bl	8000fe4 <SetHighSCL>
 80010c4:	4b0c      	ldr	r3, [pc, #48]	; (80010f8 <i2cRead+0x48>)
 80010c6:	0064      	lsls	r4, r4, #1
 80010c8:	691b      	ldr	r3, [r3, #16]
 80010ca:	b2e4      	uxtb	r4, r4
 80010cc:	06da      	lsls	r2, r3, #27
 80010ce:	d501      	bpl.n	80010d4 <i2cRead+0x24>
 80010d0:	3401      	adds	r4, #1
 80010d2:	b2e4      	uxtb	r4, r4
 80010d4:	3d01      	subs	r5, #1
 80010d6:	b2ed      	uxtb	r5, r5
 80010d8:	f7ff ff7a 	bl	8000fd0 <SetLowSCL>
 80010dc:	2d00      	cmp	r5, #0
 80010de:	d1ef      	bne.n	80010c0 <i2cRead+0x10>
 80010e0:	2e00      	cmp	r6, #0
 80010e2:	d001      	beq.n	80010e8 <i2cRead+0x38>
 80010e4:	f7ff ff4a 	bl	8000f7c <SetLowSDA>
 80010e8:	f7ff ff7c 	bl	8000fe4 <SetHighSCL>
 80010ec:	f7ff ff70 	bl	8000fd0 <SetLowSCL>
 80010f0:	f7ff ff42 	bl	8000f78 <i2c_delay>
 80010f4:	1c20      	adds	r0, r4, #0
 80010f6:	bd70      	pop	{r4, r5, r6, pc}
 80010f8:	48000400 	.word	0x48000400

080010fc <i2c_write_reg>:
 80010fc:	b570      	push	{r4, r5, r6, lr}
 80010fe:	1c06      	adds	r6, r0, #0
 8001100:	1c0d      	adds	r5, r1, #0
 8001102:	1c14      	adds	r4, r2, #0
 8001104:	f7ff ff90 	bl	8001028 <i2cStart>
 8001108:	1c30      	adds	r0, r6, #0
 800110a:	f7ff ffa9 	bl	8001060 <i2cWrite>
 800110e:	1c28      	adds	r0, r5, #0
 8001110:	f7ff ffa6 	bl	8001060 <i2cWrite>
 8001114:	1c20      	adds	r0, r4, #0
 8001116:	f7ff ffa3 	bl	8001060 <i2cWrite>
 800111a:	f7ff ff93 	bl	8001044 <i2cStop>
 800111e:	bd70      	pop	{r4, r5, r6, pc}

08001120 <i2c_read_reg>:
 8001120:	b538      	push	{r3, r4, r5, lr}
 8001122:	1c04      	adds	r4, r0, #0
 8001124:	1c0d      	adds	r5, r1, #0
 8001126:	f7ff ff7f 	bl	8001028 <i2cStart>
 800112a:	1c20      	adds	r0, r4, #0
 800112c:	f7ff ff98 	bl	8001060 <i2cWrite>
 8001130:	1c28      	adds	r0, r5, #0
 8001132:	f7ff ff95 	bl	8001060 <i2cWrite>
 8001136:	f7ff ff77 	bl	8001028 <i2cStart>
 800113a:	2001      	movs	r0, #1
 800113c:	4320      	orrs	r0, r4
 800113e:	f7ff ff8f 	bl	8001060 <i2cWrite>
 8001142:	2000      	movs	r0, #0
 8001144:	f7ff ffb4 	bl	80010b0 <i2cRead>
 8001148:	1c04      	adds	r4, r0, #0
 800114a:	f7ff ff7b 	bl	8001044 <i2cStop>
 800114e:	1c20      	adds	r0, r4, #0
 8001150:	bd38      	pop	{r3, r4, r5, pc}

08001152 <assert_param>:
 8001152:	4770      	bx	lr

08001154 <sys_tick_init>:
 8001154:	4b03      	ldr	r3, [pc, #12]	; (8001164 <sys_tick_init+0x10>)
 8001156:	4a04      	ldr	r2, [pc, #16]	; (8001168 <sys_tick_init+0x14>)
 8001158:	605a      	str	r2, [r3, #4]
 800115a:	2200      	movs	r2, #0
 800115c:	609a      	str	r2, [r3, #8]
 800115e:	2207      	movs	r2, #7
 8001160:	601a      	str	r2, [r3, #0]
 8001162:	4770      	bx	lr
 8001164:	e000e010 	.word	0xe000e010
 8001168:	0000bb80 	.word	0x0000bb80

0800116c <sleep>:
 800116c:	bf30      	wfi
 800116e:	4770      	bx	lr

08001170 <sys_tick_trigger>:
 8001170:	4770      	bx	lr
	...

08001174 <SystemInit>:
 8001174:	4b26      	ldr	r3, [pc, #152]	; (8001210 <SystemInit+0x9c>)
 8001176:	2201      	movs	r2, #1
 8001178:	6819      	ldr	r1, [r3, #0]
 800117a:	b082      	sub	sp, #8
 800117c:	4311      	orrs	r1, r2
 800117e:	6019      	str	r1, [r3, #0]
 8001180:	6858      	ldr	r0, [r3, #4]
 8001182:	4924      	ldr	r1, [pc, #144]	; (8001214 <SystemInit+0xa0>)
 8001184:	4001      	ands	r1, r0
 8001186:	6059      	str	r1, [r3, #4]
 8001188:	6818      	ldr	r0, [r3, #0]
 800118a:	4923      	ldr	r1, [pc, #140]	; (8001218 <SystemInit+0xa4>)
 800118c:	4001      	ands	r1, r0
 800118e:	6019      	str	r1, [r3, #0]
 8001190:	6818      	ldr	r0, [r3, #0]
 8001192:	4922      	ldr	r1, [pc, #136]	; (800121c <SystemInit+0xa8>)
 8001194:	4001      	ands	r1, r0
 8001196:	6019      	str	r1, [r3, #0]
 8001198:	6858      	ldr	r0, [r3, #4]
 800119a:	4921      	ldr	r1, [pc, #132]	; (8001220 <SystemInit+0xac>)
 800119c:	4001      	ands	r1, r0
 800119e:	6059      	str	r1, [r3, #4]
 80011a0:	6ad9      	ldr	r1, [r3, #44]	; 0x2c
 80011a2:	200f      	movs	r0, #15
 80011a4:	4381      	bics	r1, r0
 80011a6:	62d9      	str	r1, [r3, #44]	; 0x2c
 80011a8:	6b18      	ldr	r0, [r3, #48]	; 0x30
 80011aa:	491e      	ldr	r1, [pc, #120]	; (8001224 <SystemInit+0xb0>)
 80011ac:	4001      	ands	r1, r0
 80011ae:	6319      	str	r1, [r3, #48]	; 0x30
 80011b0:	6b59      	ldr	r1, [r3, #52]	; 0x34
 80011b2:	4391      	bics	r1, r2
 80011b4:	2200      	movs	r2, #0
 80011b6:	6359      	str	r1, [r3, #52]	; 0x34
 80011b8:	609a      	str	r2, [r3, #8]
 80011ba:	9200      	str	r2, [sp, #0]
 80011bc:	9201      	str	r2, [sp, #4]
 80011be:	4a1a      	ldr	r2, [pc, #104]	; (8001228 <SystemInit+0xb4>)
 80011c0:	2111      	movs	r1, #17
 80011c2:	6011      	str	r1, [r2, #0]
 80011c4:	685a      	ldr	r2, [r3, #4]
 80011c6:	605a      	str	r2, [r3, #4]
 80011c8:	685a      	ldr	r2, [r3, #4]
 80011ca:	605a      	str	r2, [r3, #4]
 80011cc:	6859      	ldr	r1, [r3, #4]
 80011ce:	4a17      	ldr	r2, [pc, #92]	; (800122c <SystemInit+0xb8>)
 80011d0:	400a      	ands	r2, r1
 80011d2:	605a      	str	r2, [r3, #4]
 80011d4:	6859      	ldr	r1, [r3, #4]
 80011d6:	22a0      	movs	r2, #160	; 0xa0
 80011d8:	0392      	lsls	r2, r2, #14
 80011da:	430a      	orrs	r2, r1
 80011dc:	605a      	str	r2, [r3, #4]
 80011de:	6819      	ldr	r1, [r3, #0]
 80011e0:	2280      	movs	r2, #128	; 0x80
 80011e2:	0452      	lsls	r2, r2, #17
 80011e4:	430a      	orrs	r2, r1
 80011e6:	601a      	str	r2, [r3, #0]
 80011e8:	6819      	ldr	r1, [r3, #0]
 80011ea:	4a09      	ldr	r2, [pc, #36]	; (8001210 <SystemInit+0x9c>)
 80011ec:	0188      	lsls	r0, r1, #6
 80011ee:	d5fb      	bpl.n	80011e8 <SystemInit+0x74>
 80011f0:	6851      	ldr	r1, [r2, #4]
 80011f2:	2003      	movs	r0, #3
 80011f4:	4381      	bics	r1, r0
 80011f6:	6051      	str	r1, [r2, #4]
 80011f8:	6851      	ldr	r1, [r2, #4]
 80011fa:	2002      	movs	r0, #2
 80011fc:	4301      	orrs	r1, r0
 80011fe:	6051      	str	r1, [r2, #4]
 8001200:	6859      	ldr	r1, [r3, #4]
 8001202:	220c      	movs	r2, #12
 8001204:	400a      	ands	r2, r1
 8001206:	2a08      	cmp	r2, #8
 8001208:	d1fa      	bne.n	8001200 <SystemInit+0x8c>
 800120a:	b002      	add	sp, #8
 800120c:	4770      	bx	lr
 800120e:	46c0      	nop			; (mov r8, r8)
 8001210:	40021000 	.word	0x40021000
 8001214:	f8ffb80c 	.word	0xf8ffb80c
 8001218:	fef6ffff 	.word	0xfef6ffff
 800121c:	fffbffff 	.word	0xfffbffff
 8001220:	ffc0ffff 	.word	0xffc0ffff
 8001224:	fffffeac 	.word	0xfffffeac
 8001228:	40022000 	.word	0x40022000
 800122c:	ffc07fff 	.word	0xffc07fff

08001230 <lib_low_level_init>:
 8001230:	b508      	push	{r3, lr}
 8001232:	f7ff ff9f 	bl	8001174 <SystemInit>
 8001236:	f000 fcc7 	bl	8001bc8 <gpio_init>
 800123a:	f7ff fe55 	bl	8000ee8 <uart_init>
 800123e:	f7ff fd9b 	bl	8000d78 <timer_init>
 8001242:	f7ff fed9 	bl	8000ff8 <i2c_0_init>
 8001246:	bd08      	pop	{r3, pc}

08001248 <GPIO_Init>:
 8001248:	2390      	movs	r3, #144	; 0x90
 800124a:	b5f7      	push	{r0, r1, r2, r4, r5, r6, r7, lr}
 800124c:	05db      	lsls	r3, r3, #23
 800124e:	1c04      	adds	r4, r0, #0
 8001250:	1c0d      	adds	r5, r1, #0
 8001252:	4298      	cmp	r0, r3
 8001254:	d010      	beq.n	8001278 <GPIO_Init+0x30>
 8001256:	4b39      	ldr	r3, [pc, #228]	; (800133c <GPIO_Init+0xf4>)
 8001258:	4298      	cmp	r0, r3
 800125a:	d00d      	beq.n	8001278 <GPIO_Init+0x30>
 800125c:	4b38      	ldr	r3, [pc, #224]	; (8001340 <GPIO_Init+0xf8>)
 800125e:	4298      	cmp	r0, r3
 8001260:	d00a      	beq.n	8001278 <GPIO_Init+0x30>
 8001262:	4b38      	ldr	r3, [pc, #224]	; (8001344 <GPIO_Init+0xfc>)
 8001264:	4298      	cmp	r0, r3
 8001266:	d007      	beq.n	8001278 <GPIO_Init+0x30>
 8001268:	4b37      	ldr	r3, [pc, #220]	; (8001348 <GPIO_Init+0x100>)
 800126a:	4298      	cmp	r0, r3
 800126c:	d004      	beq.n	8001278 <GPIO_Init+0x30>
 800126e:	4a37      	ldr	r2, [pc, #220]	; (800134c <GPIO_Init+0x104>)
 8001270:	1880      	adds	r0, r0, r2
 8001272:	4243      	negs	r3, r0
 8001274:	4158      	adcs	r0, r3
 8001276:	e000      	b.n	800127a <GPIO_Init+0x32>
 8001278:	2001      	movs	r0, #1
 800127a:	f7ff ff6a 	bl	8001152 <assert_param>
 800127e:	6828      	ldr	r0, [r5, #0]
 8001280:	2600      	movs	r6, #0
 8001282:	1e43      	subs	r3, r0, #1
 8001284:	4198      	sbcs	r0, r3
 8001286:	f7ff ff64 	bl	8001152 <assert_param>
 800128a:	792b      	ldrb	r3, [r5, #4]
 800128c:	2203      	movs	r2, #3
 800128e:	1c30      	adds	r0, r6, #0
 8001290:	429a      	cmp	r2, r3
 8001292:	4170      	adcs	r0, r6
 8001294:	f7ff ff5d 	bl	8001152 <assert_param>
 8001298:	79eb      	ldrb	r3, [r5, #7]
 800129a:	2202      	movs	r2, #2
 800129c:	1c30      	adds	r0, r6, #0
 800129e:	429a      	cmp	r2, r3
 80012a0:	4170      	adcs	r0, r6
 80012a2:	f7ff ff56 	bl	8001152 <assert_param>
 80012a6:	2001      	movs	r0, #1
 80012a8:	1c03      	adds	r3, r0, #0
 80012aa:	682a      	ldr	r2, [r5, #0]
 80012ac:	40b3      	lsls	r3, r6
 80012ae:	401a      	ands	r2, r3
 80012b0:	9201      	str	r2, [sp, #4]
 80012b2:	429a      	cmp	r2, r3
 80012b4:	d13d      	bne.n	8001332 <GPIO_Init+0xea>
 80012b6:	792b      	ldrb	r3, [r5, #4]
 80012b8:	0077      	lsls	r7, r6, #1
 80012ba:	3b01      	subs	r3, #1
 80012bc:	b2db      	uxtb	r3, r3
 80012be:	4283      	cmp	r3, r0
 80012c0:	d823      	bhi.n	800130a <GPIO_Init+0xc2>
 80012c2:	796b      	ldrb	r3, [r5, #5]
 80012c4:	4283      	cmp	r3, r0
 80012c6:	d902      	bls.n	80012ce <GPIO_Init+0x86>
 80012c8:	1ed8      	subs	r0, r3, #3
 80012ca:	4243      	negs	r3, r0
 80012cc:	4158      	adcs	r0, r3
 80012ce:	f7ff ff40 	bl	8001152 <assert_param>
 80012d2:	68a3      	ldr	r3, [r4, #8]
 80012d4:	2203      	movs	r2, #3
 80012d6:	40ba      	lsls	r2, r7
 80012d8:	4393      	bics	r3, r2
 80012da:	60a3      	str	r3, [r4, #8]
 80012dc:	796b      	ldrb	r3, [r5, #5]
 80012de:	68a2      	ldr	r2, [r4, #8]
 80012e0:	40bb      	lsls	r3, r7
 80012e2:	4313      	orrs	r3, r2
 80012e4:	60a3      	str	r3, [r4, #8]
 80012e6:	79ab      	ldrb	r3, [r5, #6]
 80012e8:	2201      	movs	r2, #1
 80012ea:	2000      	movs	r0, #0
 80012ec:	429a      	cmp	r2, r3
 80012ee:	4140      	adcs	r0, r0
 80012f0:	f7ff ff2f 	bl	8001152 <assert_param>
 80012f4:	6863      	ldr	r3, [r4, #4]
 80012f6:	9a01      	ldr	r2, [sp, #4]
 80012f8:	b29b      	uxth	r3, r3
 80012fa:	4393      	bics	r3, r2
 80012fc:	80a3      	strh	r3, [r4, #4]
 80012fe:	79ab      	ldrb	r3, [r5, #6]
 8001300:	6862      	ldr	r2, [r4, #4]
 8001302:	40b3      	lsls	r3, r6
 8001304:	4313      	orrs	r3, r2
 8001306:	b29b      	uxth	r3, r3
 8001308:	80a3      	strh	r3, [r4, #4]
 800130a:	2303      	movs	r3, #3
 800130c:	6822      	ldr	r2, [r4, #0]
 800130e:	40bb      	lsls	r3, r7
 8001310:	43db      	mvns	r3, r3
 8001312:	401a      	ands	r2, r3
 8001314:	6022      	str	r2, [r4, #0]
 8001316:	792a      	ldrb	r2, [r5, #4]
 8001318:	6821      	ldr	r1, [r4, #0]
 800131a:	40ba      	lsls	r2, r7
 800131c:	430a      	orrs	r2, r1
 800131e:	6022      	str	r2, [r4, #0]
 8001320:	68e2      	ldr	r2, [r4, #12]
 8001322:	4013      	ands	r3, r2
 8001324:	79ea      	ldrb	r2, [r5, #7]
 8001326:	60e3      	str	r3, [r4, #12]
 8001328:	68e3      	ldr	r3, [r4, #12]
 800132a:	40ba      	lsls	r2, r7
 800132c:	1c17      	adds	r7, r2, #0
 800132e:	431f      	orrs	r7, r3
 8001330:	60e7      	str	r7, [r4, #12]
 8001332:	3601      	adds	r6, #1
 8001334:	2e10      	cmp	r6, #16
 8001336:	d1b6      	bne.n	80012a6 <GPIO_Init+0x5e>
 8001338:	bdf7      	pop	{r0, r1, r2, r4, r5, r6, r7, pc}
 800133a:	46c0      	nop			; (mov r8, r8)
 800133c:	48000400 	.word	0x48000400
 8001340:	48000800 	.word	0x48000800
 8001344:	48000c00 	.word	0x48000c00
 8001348:	48001000 	.word	0x48001000
 800134c:	b7ffec00 	.word	0xb7ffec00

08001350 <GPIO_PinAFConfig>:
 8001350:	b5f7      	push	{r0, r1, r2, r4, r5, r6, r7, lr}
 8001352:	2390      	movs	r3, #144	; 0x90
 8001354:	1c04      	adds	r4, r0, #0
 8001356:	1c0e      	adds	r6, r1, #0
 8001358:	9201      	str	r2, [sp, #4]
 800135a:	05db      	lsls	r3, r3, #23
 800135c:	4298      	cmp	r0, r3
 800135e:	d010      	beq.n	8001382 <GPIO_PinAFConfig+0x32>
 8001360:	4b19      	ldr	r3, [pc, #100]	; (80013c8 <GPIO_PinAFConfig+0x78>)
 8001362:	4298      	cmp	r0, r3
 8001364:	d00d      	beq.n	8001382 <GPIO_PinAFConfig+0x32>
 8001366:	4b19      	ldr	r3, [pc, #100]	; (80013cc <GPIO_PinAFConfig+0x7c>)
 8001368:	4298      	cmp	r0, r3
 800136a:	d00a      	beq.n	8001382 <GPIO_PinAFConfig+0x32>
 800136c:	4b18      	ldr	r3, [pc, #96]	; (80013d0 <GPIO_PinAFConfig+0x80>)
 800136e:	4298      	cmp	r0, r3
 8001370:	d007      	beq.n	8001382 <GPIO_PinAFConfig+0x32>
 8001372:	4b18      	ldr	r3, [pc, #96]	; (80013d4 <GPIO_PinAFConfig+0x84>)
 8001374:	4298      	cmp	r0, r3
 8001376:	d004      	beq.n	8001382 <GPIO_PinAFConfig+0x32>
 8001378:	4a17      	ldr	r2, [pc, #92]	; (80013d8 <GPIO_PinAFConfig+0x88>)
 800137a:	1880      	adds	r0, r0, r2
 800137c:	4243      	negs	r3, r0
 800137e:	4158      	adcs	r0, r3
 8001380:	e000      	b.n	8001384 <GPIO_PinAFConfig+0x34>
 8001382:	2001      	movs	r0, #1
 8001384:	2500      	movs	r5, #0
 8001386:	f7ff fee4 	bl	8001152 <assert_param>
 800138a:	230f      	movs	r3, #15
 800138c:	1c28      	adds	r0, r5, #0
 800138e:	42b3      	cmp	r3, r6
 8001390:	4168      	adcs	r0, r5
 8001392:	f7ff fede 	bl	8001152 <assert_param>
 8001396:	9a01      	ldr	r2, [sp, #4]
 8001398:	1c28      	adds	r0, r5, #0
 800139a:	2707      	movs	r7, #7
 800139c:	4297      	cmp	r7, r2
 800139e:	4168      	adcs	r0, r5
 80013a0:	4037      	ands	r7, r6
 80013a2:	08f6      	lsrs	r6, r6, #3
 80013a4:	00b6      	lsls	r6, r6, #2
 80013a6:	19a4      	adds	r4, r4, r6
 80013a8:	f7ff fed3 	bl	8001152 <assert_param>
 80013ac:	00bf      	lsls	r7, r7, #2
 80013ae:	6a23      	ldr	r3, [r4, #32]
 80013b0:	220f      	movs	r2, #15
 80013b2:	40ba      	lsls	r2, r7
 80013b4:	4393      	bics	r3, r2
 80013b6:	9a01      	ldr	r2, [sp, #4]
 80013b8:	6223      	str	r3, [r4, #32]
 80013ba:	6a23      	ldr	r3, [r4, #32]
 80013bc:	40ba      	lsls	r2, r7
 80013be:	1c17      	adds	r7, r2, #0
 80013c0:	431f      	orrs	r7, r3
 80013c2:	6227      	str	r7, [r4, #32]
 80013c4:	bdf7      	pop	{r0, r1, r2, r4, r5, r6, r7, pc}
 80013c6:	46c0      	nop			; (mov r8, r8)
 80013c8:	48000400 	.word	0x48000400
 80013cc:	48000800 	.word	0x48000800
 80013d0:	48000c00 	.word	0x48000c00
 80013d4:	48001000 	.word	0x48001000
 80013d8:	b7ffec00 	.word	0xb7ffec00

080013dc <TIM_TimeBaseInit>:
 80013dc:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
 80013de:	4e34      	ldr	r6, [pc, #208]	; (80014b0 <TIM_TimeBaseInit+0xd4>)
 80013e0:	1c04      	adds	r4, r0, #0
 80013e2:	1c0d      	adds	r5, r1, #0
 80013e4:	4f33      	ldr	r7, [pc, #204]	; (80014b4 <TIM_TimeBaseInit+0xd8>)
 80013e6:	42b0      	cmp	r0, r6
 80013e8:	d019      	beq.n	800141e <TIM_TimeBaseInit+0x42>
 80013ea:	2380      	movs	r3, #128	; 0x80
 80013ec:	05db      	lsls	r3, r3, #23
 80013ee:	4298      	cmp	r0, r3
 80013f0:	d015      	beq.n	800141e <TIM_TimeBaseInit+0x42>
 80013f2:	4b31      	ldr	r3, [pc, #196]	; (80014b8 <TIM_TimeBaseInit+0xdc>)
 80013f4:	4298      	cmp	r0, r3
 80013f6:	d012      	beq.n	800141e <TIM_TimeBaseInit+0x42>
 80013f8:	42b8      	cmp	r0, r7
 80013fa:	d010      	beq.n	800141e <TIM_TimeBaseInit+0x42>
 80013fc:	4b2f      	ldr	r3, [pc, #188]	; (80014bc <TIM_TimeBaseInit+0xe0>)
 80013fe:	4298      	cmp	r0, r3
 8001400:	d00d      	beq.n	800141e <TIM_TimeBaseInit+0x42>
 8001402:	4b2f      	ldr	r3, [pc, #188]	; (80014c0 <TIM_TimeBaseInit+0xe4>)
 8001404:	4298      	cmp	r0, r3
 8001406:	d00a      	beq.n	800141e <TIM_TimeBaseInit+0x42>
 8001408:	4b2e      	ldr	r3, [pc, #184]	; (80014c4 <TIM_TimeBaseInit+0xe8>)
 800140a:	4298      	cmp	r0, r3
 800140c:	d007      	beq.n	800141e <TIM_TimeBaseInit+0x42>
 800140e:	4b2e      	ldr	r3, [pc, #184]	; (80014c8 <TIM_TimeBaseInit+0xec>)
 8001410:	4298      	cmp	r0, r3
 8001412:	d004      	beq.n	800141e <TIM_TimeBaseInit+0x42>
 8001414:	492d      	ldr	r1, [pc, #180]	; (80014cc <TIM_TimeBaseInit+0xf0>)
 8001416:	1840      	adds	r0, r0, r1
 8001418:	4243      	negs	r3, r0
 800141a:	4158      	adcs	r0, r3
 800141c:	e000      	b.n	8001420 <TIM_TimeBaseInit+0x44>
 800141e:	2001      	movs	r0, #1
 8001420:	f7ff fe97 	bl	8001152 <assert_param>
 8001424:	886b      	ldrh	r3, [r5, #2]
 8001426:	2210      	movs	r2, #16
 8001428:	1c19      	adds	r1, r3, #0
 800142a:	4391      	bics	r1, r2
 800142c:	d101      	bne.n	8001432 <TIM_TimeBaseInit+0x56>
 800142e:	2001      	movs	r0, #1
 8001430:	e007      	b.n	8001442 <TIM_TimeBaseInit+0x66>
 8001432:	2240      	movs	r2, #64	; 0x40
 8001434:	1c19      	adds	r1, r3, #0
 8001436:	4391      	bics	r1, r2
 8001438:	2920      	cmp	r1, #32
 800143a:	d0f8      	beq.n	800142e <TIM_TimeBaseInit+0x52>
 800143c:	2b40      	cmp	r3, #64	; 0x40
 800143e:	d0f6      	beq.n	800142e <TIM_TimeBaseInit+0x52>
 8001440:	2000      	movs	r0, #0
 8001442:	f7ff fe86 	bl	8001152 <assert_param>
 8001446:	892b      	ldrh	r3, [r5, #8]
 8001448:	4a21      	ldr	r2, [pc, #132]	; (80014d0 <TIM_TimeBaseInit+0xf4>)
 800144a:	2001      	movs	r0, #1
 800144c:	4213      	tst	r3, r2
 800144e:	d003      	beq.n	8001458 <TIM_TimeBaseInit+0x7c>
 8001450:	4a20      	ldr	r2, [pc, #128]	; (80014d4 <TIM_TimeBaseInit+0xf8>)
 8001452:	1898      	adds	r0, r3, r2
 8001454:	4243      	negs	r3, r0
 8001456:	4158      	adcs	r0, r3
 8001458:	f7ff fe7b 	bl	8001152 <assert_param>
 800145c:	6823      	ldr	r3, [r4, #0]
 800145e:	b29b      	uxth	r3, r3
 8001460:	42b4      	cmp	r4, r6
 8001462:	d006      	beq.n	8001472 <TIM_TimeBaseInit+0x96>
 8001464:	2280      	movs	r2, #128	; 0x80
 8001466:	05d2      	lsls	r2, r2, #23
 8001468:	4294      	cmp	r4, r2
 800146a:	d002      	beq.n	8001472 <TIM_TimeBaseInit+0x96>
 800146c:	4a12      	ldr	r2, [pc, #72]	; (80014b8 <TIM_TimeBaseInit+0xdc>)
 800146e:	4294      	cmp	r4, r2
 8001470:	d103      	bne.n	800147a <TIM_TimeBaseInit+0x9e>
 8001472:	2270      	movs	r2, #112	; 0x70
 8001474:	4393      	bics	r3, r2
 8001476:	886a      	ldrh	r2, [r5, #2]
 8001478:	4313      	orrs	r3, r2
 800147a:	42bc      	cmp	r4, r7
 800147c:	d003      	beq.n	8001486 <TIM_TimeBaseInit+0xaa>
 800147e:	4916      	ldr	r1, [pc, #88]	; (80014d8 <TIM_TimeBaseInit+0xfc>)
 8001480:	892a      	ldrh	r2, [r5, #8]
 8001482:	400b      	ands	r3, r1
 8001484:	4313      	orrs	r3, r2
 8001486:	8023      	strh	r3, [r4, #0]
 8001488:	686b      	ldr	r3, [r5, #4]
 800148a:	62e3      	str	r3, [r4, #44]	; 0x2c
 800148c:	882b      	ldrh	r3, [r5, #0]
 800148e:	8523      	strh	r3, [r4, #40]	; 0x28
 8001490:	42b4      	cmp	r4, r6
 8001492:	d008      	beq.n	80014a6 <TIM_TimeBaseInit+0xca>
 8001494:	4b0b      	ldr	r3, [pc, #44]	; (80014c4 <TIM_TimeBaseInit+0xe8>)
 8001496:	429c      	cmp	r4, r3
 8001498:	d005      	beq.n	80014a6 <TIM_TimeBaseInit+0xca>
 800149a:	4b0b      	ldr	r3, [pc, #44]	; (80014c8 <TIM_TimeBaseInit+0xec>)
 800149c:	429c      	cmp	r4, r3
 800149e:	d002      	beq.n	80014a6 <TIM_TimeBaseInit+0xca>
 80014a0:	4b0e      	ldr	r3, [pc, #56]	; (80014dc <TIM_TimeBaseInit+0x100>)
 80014a2:	429c      	cmp	r4, r3
 80014a4:	d101      	bne.n	80014aa <TIM_TimeBaseInit+0xce>
 80014a6:	7aab      	ldrb	r3, [r5, #10]
 80014a8:	8623      	strh	r3, [r4, #48]	; 0x30
 80014aa:	2301      	movs	r3, #1
 80014ac:	82a3      	strh	r3, [r4, #20]
 80014ae:	bdf8      	pop	{r3, r4, r5, r6, r7, pc}
 80014b0:	40012c00 	.word	0x40012c00
 80014b4:	40001000 	.word	0x40001000
 80014b8:	40000400 	.word	0x40000400
 80014bc:	40001400 	.word	0x40001400
 80014c0:	40002000 	.word	0x40002000
 80014c4:	40014000 	.word	0x40014000
 80014c8:	40014400 	.word	0x40014400
 80014cc:	bffeb800 	.word	0xbffeb800
 80014d0:	fffffeff 	.word	0xfffffeff
 80014d4:	fffffe00 	.word	0xfffffe00
 80014d8:	fffffcff 	.word	0xfffffcff
 80014dc:	40014800 	.word	0x40014800

080014e0 <TIM_Cmd>:
 80014e0:	4b19      	ldr	r3, [pc, #100]	; (8001548 <TIM_Cmd+0x68>)
 80014e2:	b570      	push	{r4, r5, r6, lr}
 80014e4:	1c04      	adds	r4, r0, #0
 80014e6:	1c0e      	adds	r6, r1, #0
 80014e8:	4298      	cmp	r0, r3
 80014ea:	d01a      	beq.n	8001522 <TIM_Cmd+0x42>
 80014ec:	2380      	movs	r3, #128	; 0x80
 80014ee:	05db      	lsls	r3, r3, #23
 80014f0:	4298      	cmp	r0, r3
 80014f2:	d016      	beq.n	8001522 <TIM_Cmd+0x42>
 80014f4:	4b15      	ldr	r3, [pc, #84]	; (800154c <TIM_Cmd+0x6c>)
 80014f6:	4298      	cmp	r0, r3
 80014f8:	d013      	beq.n	8001522 <TIM_Cmd+0x42>
 80014fa:	4b15      	ldr	r3, [pc, #84]	; (8001550 <TIM_Cmd+0x70>)
 80014fc:	4298      	cmp	r0, r3
 80014fe:	d010      	beq.n	8001522 <TIM_Cmd+0x42>
 8001500:	4b14      	ldr	r3, [pc, #80]	; (8001554 <TIM_Cmd+0x74>)
 8001502:	4298      	cmp	r0, r3
 8001504:	d00d      	beq.n	8001522 <TIM_Cmd+0x42>
 8001506:	4b14      	ldr	r3, [pc, #80]	; (8001558 <TIM_Cmd+0x78>)
 8001508:	4298      	cmp	r0, r3
 800150a:	d00a      	beq.n	8001522 <TIM_Cmd+0x42>
 800150c:	4b13      	ldr	r3, [pc, #76]	; (800155c <TIM_Cmd+0x7c>)
 800150e:	4298      	cmp	r0, r3
 8001510:	d007      	beq.n	8001522 <TIM_Cmd+0x42>
 8001512:	4b13      	ldr	r3, [pc, #76]	; (8001560 <TIM_Cmd+0x80>)
 8001514:	4298      	cmp	r0, r3
 8001516:	d004      	beq.n	8001522 <TIM_Cmd+0x42>
 8001518:	4b12      	ldr	r3, [pc, #72]	; (8001564 <TIM_Cmd+0x84>)
 800151a:	18c0      	adds	r0, r0, r3
 800151c:	4243      	negs	r3, r0
 800151e:	4158      	adcs	r0, r3
 8001520:	e000      	b.n	8001524 <TIM_Cmd+0x44>
 8001522:	2001      	movs	r0, #1
 8001524:	f7ff fe15 	bl	8001152 <assert_param>
 8001528:	2501      	movs	r5, #1
 800152a:	2000      	movs	r0, #0
 800152c:	42b5      	cmp	r5, r6
 800152e:	4140      	adcs	r0, r0
 8001530:	f7ff fe0f 	bl	8001152 <assert_param>
 8001534:	6823      	ldr	r3, [r4, #0]
 8001536:	b29b      	uxth	r3, r3
 8001538:	2e00      	cmp	r6, #0
 800153a:	d002      	beq.n	8001542 <TIM_Cmd+0x62>
 800153c:	431d      	orrs	r5, r3
 800153e:	8025      	strh	r5, [r4, #0]
 8001540:	e001      	b.n	8001546 <TIM_Cmd+0x66>
 8001542:	43ab      	bics	r3, r5
 8001544:	8023      	strh	r3, [r4, #0]
 8001546:	bd70      	pop	{r4, r5, r6, pc}
 8001548:	40012c00 	.word	0x40012c00
 800154c:	40000400 	.word	0x40000400
 8001550:	40001000 	.word	0x40001000
 8001554:	40001400 	.word	0x40001400
 8001558:	40002000 	.word	0x40002000
 800155c:	40014000 	.word	0x40014000
 8001560:	40014400 	.word	0x40014400
 8001564:	bffeb800 	.word	0xbffeb800

08001568 <TIM_ITConfig>:
 8001568:	4b1f      	ldr	r3, [pc, #124]	; (80015e8 <TIM_ITConfig+0x80>)
 800156a:	b570      	push	{r4, r5, r6, lr}
 800156c:	1c04      	adds	r4, r0, #0
 800156e:	1c0d      	adds	r5, r1, #0
 8001570:	1c16      	adds	r6, r2, #0
 8001572:	4298      	cmp	r0, r3
 8001574:	d01a      	beq.n	80015ac <TIM_ITConfig+0x44>
 8001576:	2380      	movs	r3, #128	; 0x80
 8001578:	05db      	lsls	r3, r3, #23
 800157a:	4298      	cmp	r0, r3
 800157c:	d016      	beq.n	80015ac <TIM_ITConfig+0x44>
 800157e:	4b1b      	ldr	r3, [pc, #108]	; (80015ec <TIM_ITConfig+0x84>)
 8001580:	4298      	cmp	r0, r3
 8001582:	d013      	beq.n	80015ac <TIM_ITConfig+0x44>
 8001584:	4b1a      	ldr	r3, [pc, #104]	; (80015f0 <TIM_ITConfig+0x88>)
 8001586:	4298      	cmp	r0, r3
 8001588:	d010      	beq.n	80015ac <TIM_ITConfig+0x44>
 800158a:	4b1a      	ldr	r3, [pc, #104]	; (80015f4 <TIM_ITConfig+0x8c>)
 800158c:	4298      	cmp	r0, r3
 800158e:	d00d      	beq.n	80015ac <TIM_ITConfig+0x44>
 8001590:	4b19      	ldr	r3, [pc, #100]	; (80015f8 <TIM_ITConfig+0x90>)
 8001592:	4298      	cmp	r0, r3
 8001594:	d00a      	beq.n	80015ac <TIM_ITConfig+0x44>
 8001596:	4b19      	ldr	r3, [pc, #100]	; (80015fc <TIM_ITConfig+0x94>)
 8001598:	4298      	cmp	r0, r3
 800159a:	d007      	beq.n	80015ac <TIM_ITConfig+0x44>
 800159c:	4b18      	ldr	r3, [pc, #96]	; (8001600 <TIM_ITConfig+0x98>)
 800159e:	4298      	cmp	r0, r3
 80015a0:	d004      	beq.n	80015ac <TIM_ITConfig+0x44>
 80015a2:	4a18      	ldr	r2, [pc, #96]	; (8001604 <TIM_ITConfig+0x9c>)
 80015a4:	1880      	adds	r0, r0, r2
 80015a6:	4243      	negs	r3, r0
 80015a8:	4158      	adcs	r0, r3
 80015aa:	e000      	b.n	80015ae <TIM_ITConfig+0x46>
 80015ac:	2001      	movs	r0, #1
 80015ae:	f7ff fdd0 	bl	8001152 <assert_param>
 80015b2:	23ff      	movs	r3, #255	; 0xff
 80015b4:	1c2a      	adds	r2, r5, #0
 80015b6:	2000      	movs	r0, #0
 80015b8:	439a      	bics	r2, r3
 80015ba:	4282      	cmp	r2, r0
 80015bc:	d102      	bne.n	80015c4 <TIM_ITConfig+0x5c>
 80015be:	1c28      	adds	r0, r5, #0
 80015c0:	1e43      	subs	r3, r0, #1
 80015c2:	4198      	sbcs	r0, r3
 80015c4:	f7ff fdc5 	bl	8001152 <assert_param>
 80015c8:	2301      	movs	r3, #1
 80015ca:	2000      	movs	r0, #0
 80015cc:	42b3      	cmp	r3, r6
 80015ce:	4140      	adcs	r0, r0
 80015d0:	f7ff fdbf 	bl	8001152 <assert_param>
 80015d4:	68e3      	ldr	r3, [r4, #12]
 80015d6:	b29b      	uxth	r3, r3
 80015d8:	2e00      	cmp	r6, #0
 80015da:	d002      	beq.n	80015e2 <TIM_ITConfig+0x7a>
 80015dc:	431d      	orrs	r5, r3
 80015de:	81a5      	strh	r5, [r4, #12]
 80015e0:	e001      	b.n	80015e6 <TIM_ITConfig+0x7e>
 80015e2:	43ab      	bics	r3, r5
 80015e4:	81a3      	strh	r3, [r4, #12]
 80015e6:	bd70      	pop	{r4, r5, r6, pc}
 80015e8:	40012c00 	.word	0x40012c00
 80015ec:	40000400 	.word	0x40000400
 80015f0:	40001000 	.word	0x40001000
 80015f4:	40001400 	.word	0x40001400
 80015f8:	40002000 	.word	0x40002000
 80015fc:	40014000 	.word	0x40014000
 8001600:	40014400 	.word	0x40014400
 8001604:	bffeb800 	.word	0xbffeb800

08001608 <USART_Init>:
 8001608:	b5f0      	push	{r4, r5, r6, r7, lr}
 800160a:	4e53      	ldr	r6, [pc, #332]	; (8001758 <USART_Init+0x150>)
 800160c:	b08b      	sub	sp, #44	; 0x2c
 800160e:	1c04      	adds	r4, r0, #0
 8001610:	1c0d      	adds	r5, r1, #0
 8001612:	42b0      	cmp	r0, r6
 8001614:	d016      	beq.n	8001644 <USART_Init+0x3c>
 8001616:	4b51      	ldr	r3, [pc, #324]	; (800175c <USART_Init+0x154>)
 8001618:	4298      	cmp	r0, r3
 800161a:	d013      	beq.n	8001644 <USART_Init+0x3c>
 800161c:	4b50      	ldr	r3, [pc, #320]	; (8001760 <USART_Init+0x158>)
 800161e:	4298      	cmp	r0, r3
 8001620:	d010      	beq.n	8001644 <USART_Init+0x3c>
 8001622:	4b50      	ldr	r3, [pc, #320]	; (8001764 <USART_Init+0x15c>)
 8001624:	4298      	cmp	r0, r3
 8001626:	d00d      	beq.n	8001644 <USART_Init+0x3c>
 8001628:	4b4f      	ldr	r3, [pc, #316]	; (8001768 <USART_Init+0x160>)
 800162a:	4298      	cmp	r0, r3
 800162c:	d00a      	beq.n	8001644 <USART_Init+0x3c>
 800162e:	4b4f      	ldr	r3, [pc, #316]	; (800176c <USART_Init+0x164>)
 8001630:	4298      	cmp	r0, r3
 8001632:	d007      	beq.n	8001644 <USART_Init+0x3c>
 8001634:	4b4e      	ldr	r3, [pc, #312]	; (8001770 <USART_Init+0x168>)
 8001636:	4298      	cmp	r0, r3
 8001638:	d004      	beq.n	8001644 <USART_Init+0x3c>
 800163a:	494e      	ldr	r1, [pc, #312]	; (8001774 <USART_Init+0x16c>)
 800163c:	1840      	adds	r0, r0, r1
 800163e:	4243      	negs	r3, r0
 8001640:	4158      	adcs	r0, r3
 8001642:	e000      	b.n	8001646 <USART_Init+0x3e>
 8001644:	2001      	movs	r0, #1
 8001646:	f7ff fd84 	bl	8001152 <assert_param>
 800164a:	682b      	ldr	r3, [r5, #0]
 800164c:	4a4a      	ldr	r2, [pc, #296]	; (8001778 <USART_Init+0x170>)
 800164e:	3b01      	subs	r3, #1
 8001650:	2000      	movs	r0, #0
 8001652:	429a      	cmp	r2, r3
 8001654:	4140      	adcs	r0, r0
 8001656:	f7ff fd7c 	bl	8001152 <assert_param>
 800165a:	686b      	ldr	r3, [r5, #4]
 800165c:	4a47      	ldr	r2, [pc, #284]	; (800177c <USART_Init+0x174>)
 800165e:	2001      	movs	r0, #1
 8001660:	4213      	tst	r3, r2
 8001662:	d003      	beq.n	800166c <USART_Init+0x64>
 8001664:	4a46      	ldr	r2, [pc, #280]	; (8001780 <USART_Init+0x178>)
 8001666:	1898      	adds	r0, r3, r2
 8001668:	4243      	negs	r3, r0
 800166a:	4158      	adcs	r0, r3
 800166c:	f7ff fd71 	bl	8001152 <assert_param>
 8001670:	68ab      	ldr	r3, [r5, #8]
 8001672:	4a44      	ldr	r2, [pc, #272]	; (8001784 <USART_Init+0x17c>)
 8001674:	2001      	movs	r0, #1
 8001676:	4213      	tst	r3, r2
 8001678:	d003      	beq.n	8001682 <USART_Init+0x7a>
 800167a:	4943      	ldr	r1, [pc, #268]	; (8001788 <USART_Init+0x180>)
 800167c:	1858      	adds	r0, r3, r1
 800167e:	4243      	negs	r3, r0
 8001680:	4158      	adcs	r0, r3
 8001682:	f7ff fd66 	bl	8001152 <assert_param>
 8001686:	68eb      	ldr	r3, [r5, #12]
 8001688:	4a40      	ldr	r2, [pc, #256]	; (800178c <USART_Init+0x184>)
 800168a:	2001      	movs	r0, #1
 800168c:	4213      	tst	r3, r2
 800168e:	d003      	beq.n	8001698 <USART_Init+0x90>
 8001690:	4a3f      	ldr	r2, [pc, #252]	; (8001790 <USART_Init+0x188>)
 8001692:	1898      	adds	r0, r3, r2
 8001694:	4243      	negs	r3, r0
 8001696:	4158      	adcs	r0, r3
 8001698:	f7ff fd5b 	bl	8001152 <assert_param>
 800169c:	692b      	ldr	r3, [r5, #16]
 800169e:	220c      	movs	r2, #12
 80016a0:	1c19      	adds	r1, r3, #0
 80016a2:	2000      	movs	r0, #0
 80016a4:	4391      	bics	r1, r2
 80016a6:	4281      	cmp	r1, r0
 80016a8:	d102      	bne.n	80016b0 <USART_Init+0xa8>
 80016aa:	1c18      	adds	r0, r3, #0
 80016ac:	1e43      	subs	r3, r0, #1
 80016ae:	4198      	sbcs	r0, r3
 80016b0:	f7ff fd4f 	bl	8001152 <assert_param>
 80016b4:	4f37      	ldr	r7, [pc, #220]	; (8001794 <USART_Init+0x18c>)
 80016b6:	6968      	ldr	r0, [r5, #20]
 80016b8:	4038      	ands	r0, r7
 80016ba:	4243      	negs	r3, r0
 80016bc:	4158      	adcs	r0, r3
 80016be:	f7ff fd48 	bl	8001152 <assert_param>
 80016c2:	6823      	ldr	r3, [r4, #0]
 80016c4:	2201      	movs	r2, #1
 80016c6:	4393      	bics	r3, r2
 80016c8:	6023      	str	r3, [r4, #0]
 80016ca:	6862      	ldr	r2, [r4, #4]
 80016cc:	4b32      	ldr	r3, [pc, #200]	; (8001798 <USART_Init+0x190>)
 80016ce:	6869      	ldr	r1, [r5, #4]
 80016d0:	4013      	ands	r3, r2
 80016d2:	68aa      	ldr	r2, [r5, #8]
 80016d4:	4668      	mov	r0, sp
 80016d6:	4313      	orrs	r3, r2
 80016d8:	6063      	str	r3, [r4, #4]
 80016da:	6822      	ldr	r2, [r4, #0]
 80016dc:	4b2f      	ldr	r3, [pc, #188]	; (800179c <USART_Init+0x194>)
 80016de:	401a      	ands	r2, r3
 80016e0:	68eb      	ldr	r3, [r5, #12]
 80016e2:	430b      	orrs	r3, r1
 80016e4:	6929      	ldr	r1, [r5, #16]
 80016e6:	430b      	orrs	r3, r1
 80016e8:	4313      	orrs	r3, r2
 80016ea:	6023      	str	r3, [r4, #0]
 80016ec:	68a3      	ldr	r3, [r4, #8]
 80016ee:	696a      	ldr	r2, [r5, #20]
 80016f0:	401f      	ands	r7, r3
 80016f2:	4317      	orrs	r7, r2
 80016f4:	60a7      	str	r7, [r4, #8]
 80016f6:	f000 f943 	bl	8001980 <RCC_GetClocksFreq>
 80016fa:	42b4      	cmp	r4, r6
 80016fc:	d101      	bne.n	8001702 <USART_Init+0xfa>
 80016fe:	9e06      	ldr	r6, [sp, #24]
 8001700:	e00a      	b.n	8001718 <USART_Init+0x110>
 8001702:	4b16      	ldr	r3, [pc, #88]	; (800175c <USART_Init+0x154>)
 8001704:	429c      	cmp	r4, r3
 8001706:	d101      	bne.n	800170c <USART_Init+0x104>
 8001708:	9e07      	ldr	r6, [sp, #28]
 800170a:	e005      	b.n	8001718 <USART_Init+0x110>
 800170c:	4b14      	ldr	r3, [pc, #80]	; (8001760 <USART_Init+0x158>)
 800170e:	429c      	cmp	r4, r3
 8001710:	d101      	bne.n	8001716 <USART_Init+0x10e>
 8001712:	9e08      	ldr	r6, [sp, #32]
 8001714:	e000      	b.n	8001718 <USART_Init+0x110>
 8001716:	9e02      	ldr	r6, [sp, #8]
 8001718:	6823      	ldr	r3, [r4, #0]
 800171a:	682f      	ldr	r7, [r5, #0]
 800171c:	0419      	lsls	r1, r3, #16
 800171e:	d500      	bpl.n	8001722 <USART_Init+0x11a>
 8001720:	0076      	lsls	r6, r6, #1
 8001722:	1c39      	adds	r1, r7, #0
 8001724:	1c30      	adds	r0, r6, #0
 8001726:	f000 fafb 	bl	8001d20 <__aeabi_uidiv>
 800172a:	1c39      	adds	r1, r7, #0
 800172c:	1c05      	adds	r5, r0, #0
 800172e:	1c30      	adds	r0, r6, #0
 8001730:	f000 fb3a 	bl	8001da8 <__aeabi_uidivmod>
 8001734:	087f      	lsrs	r7, r7, #1
 8001736:	2300      	movs	r3, #0
 8001738:	42b9      	cmp	r1, r7
 800173a:	415b      	adcs	r3, r3
 800173c:	18ed      	adds	r5, r5, r3
 800173e:	6823      	ldr	r3, [r4, #0]
 8001740:	041a      	lsls	r2, r3, #16
 8001742:	d504      	bpl.n	800174e <USART_Init+0x146>
 8001744:	4a16      	ldr	r2, [pc, #88]	; (80017a0 <USART_Init+0x198>)
 8001746:	072b      	lsls	r3, r5, #28
 8001748:	0f5b      	lsrs	r3, r3, #29
 800174a:	4015      	ands	r5, r2
 800174c:	431d      	orrs	r5, r3
 800174e:	b2ad      	uxth	r5, r5
 8001750:	81a5      	strh	r5, [r4, #12]
 8001752:	b00b      	add	sp, #44	; 0x2c
 8001754:	bdf0      	pop	{r4, r5, r6, r7, pc}
 8001756:	46c0      	nop			; (mov r8, r8)
 8001758:	40013800 	.word	0x40013800
 800175c:	40004400 	.word	0x40004400
 8001760:	40004800 	.word	0x40004800
 8001764:	40004c00 	.word	0x40004c00
 8001768:	40005000 	.word	0x40005000
 800176c:	40011400 	.word	0x40011400
 8001770:	40011800 	.word	0x40011800
 8001774:	bffee400 	.word	0xbffee400
 8001778:	005b8d7f 	.word	0x005b8d7f
 800177c:	ffffefff 	.word	0xffffefff
 8001780:	effff000 	.word	0xeffff000
 8001784:	ffffdfff 	.word	0xffffdfff
 8001788:	ffffd000 	.word	0xffffd000
 800178c:	fffffbff 	.word	0xfffffbff
 8001790:	fffffa00 	.word	0xfffffa00
 8001794:	fffffcff 	.word	0xfffffcff
 8001798:	ffffcfff 	.word	0xffffcfff
 800179c:	ffffe9f3 	.word	0xffffe9f3
 80017a0:	0000fff0 	.word	0x0000fff0

080017a4 <USART_Cmd>:
 80017a4:	4b17      	ldr	r3, [pc, #92]	; (8001804 <USART_Cmd+0x60>)
 80017a6:	b570      	push	{r4, r5, r6, lr}
 80017a8:	1c04      	adds	r4, r0, #0
 80017aa:	1c0e      	adds	r6, r1, #0
 80017ac:	4298      	cmp	r0, r3
 80017ae:	d016      	beq.n	80017de <USART_Cmd+0x3a>
 80017b0:	4b15      	ldr	r3, [pc, #84]	; (8001808 <USART_Cmd+0x64>)
 80017b2:	4298      	cmp	r0, r3
 80017b4:	d013      	beq.n	80017de <USART_Cmd+0x3a>
 80017b6:	4b15      	ldr	r3, [pc, #84]	; (800180c <USART_Cmd+0x68>)
 80017b8:	4298      	cmp	r0, r3
 80017ba:	d010      	beq.n	80017de <USART_Cmd+0x3a>
 80017bc:	4b14      	ldr	r3, [pc, #80]	; (8001810 <USART_Cmd+0x6c>)
 80017be:	4298      	cmp	r0, r3
 80017c0:	d00d      	beq.n	80017de <USART_Cmd+0x3a>
 80017c2:	4b14      	ldr	r3, [pc, #80]	; (8001814 <USART_Cmd+0x70>)
 80017c4:	4298      	cmp	r0, r3
 80017c6:	d00a      	beq.n	80017de <USART_Cmd+0x3a>
 80017c8:	4b13      	ldr	r3, [pc, #76]	; (8001818 <USART_Cmd+0x74>)
 80017ca:	4298      	cmp	r0, r3
 80017cc:	d007      	beq.n	80017de <USART_Cmd+0x3a>
 80017ce:	4b13      	ldr	r3, [pc, #76]	; (800181c <USART_Cmd+0x78>)
 80017d0:	4298      	cmp	r0, r3
 80017d2:	d004      	beq.n	80017de <USART_Cmd+0x3a>
 80017d4:	4b12      	ldr	r3, [pc, #72]	; (8001820 <USART_Cmd+0x7c>)
 80017d6:	18c0      	adds	r0, r0, r3
 80017d8:	4243      	negs	r3, r0
 80017da:	4158      	adcs	r0, r3
 80017dc:	e000      	b.n	80017e0 <USART_Cmd+0x3c>
 80017de:	2001      	movs	r0, #1
 80017e0:	f7ff fcb7 	bl	8001152 <assert_param>
 80017e4:	2501      	movs	r5, #1
 80017e6:	2000      	movs	r0, #0
 80017e8:	42b5      	cmp	r5, r6
 80017ea:	4140      	adcs	r0, r0
 80017ec:	f7ff fcb1 	bl	8001152 <assert_param>
 80017f0:	6823      	ldr	r3, [r4, #0]
 80017f2:	2e00      	cmp	r6, #0
 80017f4:	d002      	beq.n	80017fc <USART_Cmd+0x58>
 80017f6:	431d      	orrs	r5, r3
 80017f8:	6025      	str	r5, [r4, #0]
 80017fa:	e001      	b.n	8001800 <USART_Cmd+0x5c>
 80017fc:	43ab      	bics	r3, r5
 80017fe:	6023      	str	r3, [r4, #0]
 8001800:	bd70      	pop	{r4, r5, r6, pc}
 8001802:	46c0      	nop			; (mov r8, r8)
 8001804:	40013800 	.word	0x40013800
 8001808:	40004400 	.word	0x40004400
 800180c:	40004800 	.word	0x40004800
 8001810:	40004c00 	.word	0x40004c00
 8001814:	40005000 	.word	0x40005000
 8001818:	40011400 	.word	0x40011400
 800181c:	40011800 	.word	0x40011800
 8001820:	bffee400 	.word	0xbffee400

08001824 <USART_ClearITPendingBit>:
 8001824:	b538      	push	{r3, r4, r5, lr}
 8001826:	4b26      	ldr	r3, [pc, #152]	; (80018c0 <USART_ClearITPendingBit+0x9c>)
 8001828:	1c05      	adds	r5, r0, #0
 800182a:	1c0c      	adds	r4, r1, #0
 800182c:	4298      	cmp	r0, r3
 800182e:	d016      	beq.n	800185e <USART_ClearITPendingBit+0x3a>
 8001830:	4b24      	ldr	r3, [pc, #144]	; (80018c4 <USART_ClearITPendingBit+0xa0>)
 8001832:	4298      	cmp	r0, r3
 8001834:	d013      	beq.n	800185e <USART_ClearITPendingBit+0x3a>
 8001836:	4b24      	ldr	r3, [pc, #144]	; (80018c8 <USART_ClearITPendingBit+0xa4>)
 8001838:	4298      	cmp	r0, r3
 800183a:	d010      	beq.n	800185e <USART_ClearITPendingBit+0x3a>
 800183c:	4b23      	ldr	r3, [pc, #140]	; (80018cc <USART_ClearITPendingBit+0xa8>)
 800183e:	4298      	cmp	r0, r3
 8001840:	d00d      	beq.n	800185e <USART_ClearITPendingBit+0x3a>
 8001842:	4b23      	ldr	r3, [pc, #140]	; (80018d0 <USART_ClearITPendingBit+0xac>)
 8001844:	4298      	cmp	r0, r3
 8001846:	d00a      	beq.n	800185e <USART_ClearITPendingBit+0x3a>
 8001848:	4b22      	ldr	r3, [pc, #136]	; (80018d4 <USART_ClearITPendingBit+0xb0>)
 800184a:	4298      	cmp	r0, r3
 800184c:	d007      	beq.n	800185e <USART_ClearITPendingBit+0x3a>
 800184e:	4b22      	ldr	r3, [pc, #136]	; (80018d8 <USART_ClearITPendingBit+0xb4>)
 8001850:	4298      	cmp	r0, r3
 8001852:	d004      	beq.n	800185e <USART_ClearITPendingBit+0x3a>
 8001854:	4a21      	ldr	r2, [pc, #132]	; (80018dc <USART_ClearITPendingBit+0xb8>)
 8001856:	1880      	adds	r0, r0, r2
 8001858:	4243      	negs	r3, r0
 800185a:	4158      	adcs	r0, r3
 800185c:	e000      	b.n	8001860 <USART_ClearITPendingBit+0x3c>
 800185e:	2001      	movs	r0, #1
 8001860:	f7ff fc77 	bl	8001152 <assert_param>
 8001864:	4b1e      	ldr	r3, [pc, #120]	; (80018e0 <USART_ClearITPendingBit+0xbc>)
 8001866:	429c      	cmp	r4, r3
 8001868:	d022      	beq.n	80018b0 <USART_ClearITPendingBit+0x8c>
 800186a:	2384      	movs	r3, #132	; 0x84
 800186c:	005b      	lsls	r3, r3, #1
 800186e:	429c      	cmp	r4, r3
 8001870:	d01e      	beq.n	80018b0 <USART_ClearITPendingBit+0x8c>
 8001872:	4a1c      	ldr	r2, [pc, #112]	; (80018e4 <USART_ClearITPendingBit+0xc0>)
 8001874:	4b1c      	ldr	r3, [pc, #112]	; (80018e8 <USART_ClearITPendingBit+0xc4>)
 8001876:	4022      	ands	r2, r4
 8001878:	429a      	cmp	r2, r3
 800187a:	d019      	beq.n	80018b0 <USART_ClearITPendingBit+0x8c>
 800187c:	4b1b      	ldr	r3, [pc, #108]	; (80018ec <USART_ClearITPendingBit+0xc8>)
 800187e:	429c      	cmp	r4, r3
 8001880:	d016      	beq.n	80018b0 <USART_ClearITPendingBit+0x8c>
 8001882:	4b1b      	ldr	r3, [pc, #108]	; (80018f0 <USART_ClearITPendingBit+0xcc>)
 8001884:	429c      	cmp	r4, r3
 8001886:	d013      	beq.n	80018b0 <USART_ClearITPendingBit+0x8c>
 8001888:	4b1a      	ldr	r3, [pc, #104]	; (80018f4 <USART_ClearITPendingBit+0xd0>)
 800188a:	429c      	cmp	r4, r3
 800188c:	d010      	beq.n	80018b0 <USART_ClearITPendingBit+0x8c>
 800188e:	4b1a      	ldr	r3, [pc, #104]	; (80018f8 <USART_ClearITPendingBit+0xd4>)
 8001890:	429c      	cmp	r4, r3
 8001892:	d00d      	beq.n	80018b0 <USART_ClearITPendingBit+0x8c>
 8001894:	4b19      	ldr	r3, [pc, #100]	; (80018fc <USART_ClearITPendingBit+0xd8>)
 8001896:	429c      	cmp	r4, r3
 8001898:	d00a      	beq.n	80018b0 <USART_ClearITPendingBit+0x8c>
 800189a:	4b19      	ldr	r3, [pc, #100]	; (8001900 <USART_ClearITPendingBit+0xdc>)
 800189c:	429c      	cmp	r4, r3
 800189e:	d007      	beq.n	80018b0 <USART_ClearITPendingBit+0x8c>
 80018a0:	4b18      	ldr	r3, [pc, #96]	; (8001904 <USART_ClearITPendingBit+0xe0>)
 80018a2:	429c      	cmp	r4, r3
 80018a4:	d004      	beq.n	80018b0 <USART_ClearITPendingBit+0x8c>
 80018a6:	4a18      	ldr	r2, [pc, #96]	; (8001908 <USART_ClearITPendingBit+0xe4>)
 80018a8:	18a3      	adds	r3, r4, r2
 80018aa:	4258      	negs	r0, r3
 80018ac:	4158      	adcs	r0, r3
 80018ae:	e000      	b.n	80018b2 <USART_ClearITPendingBit+0x8e>
 80018b0:	2001      	movs	r0, #1
 80018b2:	f7ff fc4e 	bl	8001152 <assert_param>
 80018b6:	0c24      	lsrs	r4, r4, #16
 80018b8:	2301      	movs	r3, #1
 80018ba:	40a3      	lsls	r3, r4
 80018bc:	622b      	str	r3, [r5, #32]
 80018be:	bd38      	pop	{r3, r4, r5, pc}
 80018c0:	40013800 	.word	0x40013800
 80018c4:	40004400 	.word	0x40004400
 80018c8:	40004800 	.word	0x40004800
 80018cc:	40004c00 	.word	0x40004c00
 80018d0:	40005000 	.word	0x40005000
 80018d4:	40011400 	.word	0x40011400
 80018d8:	40011800 	.word	0x40011800
 80018dc:	bffee400 	.word	0xbffee400
 80018e0:	00060106 	.word	0x00060106
 80018e4:	fffdffff 	.word	0xfffdffff
 80018e8:	00010300 	.word	0x00010300
 80018ec:	00020300 	.word	0x00020300
 80018f0:	00040104 	.word	0x00040104
 80018f4:	00080206 	.word	0x00080206
 80018f8:	0009030a 	.word	0x0009030a
 80018fc:	000b011a 	.word	0x000b011a
 8001900:	000c011b 	.word	0x000c011b
 8001904:	0011010e 	.word	0x0011010e
 8001908:	ffebfcea 	.word	0xffebfcea

0800190c <NVIC_Init>:
 800190c:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
 800190e:	2500      	movs	r5, #0
 8001910:	7883      	ldrb	r3, [r0, #2]
 8001912:	1c04      	adds	r4, r0, #0
 8001914:	2601      	movs	r6, #1
 8001916:	1c28      	adds	r0, r5, #0
 8001918:	429e      	cmp	r6, r3
 800191a:	4168      	adcs	r0, r5
 800191c:	f7ff fc19 	bl	8001152 <assert_param>
 8001920:	7863      	ldrb	r3, [r4, #1]
 8001922:	2703      	movs	r7, #3
 8001924:	1c28      	adds	r0, r5, #0
 8001926:	429f      	cmp	r7, r3
 8001928:	4168      	adcs	r0, r5
 800192a:	f7ff fc12 	bl	8001152 <assert_param>
 800192e:	78a2      	ldrb	r2, [r4, #2]
 8001930:	7823      	ldrb	r3, [r4, #0]
 8001932:	42aa      	cmp	r2, r5
 8001934:	d01a      	beq.n	800196c <NVIC_Init+0x60>
 8001936:	0899      	lsrs	r1, r3, #2
 8001938:	4a0f      	ldr	r2, [pc, #60]	; (8001978 <NVIC_Init+0x6c>)
 800193a:	0089      	lsls	r1, r1, #2
 800193c:	1889      	adds	r1, r1, r2
 800193e:	22c0      	movs	r2, #192	; 0xc0
 8001940:	0092      	lsls	r2, r2, #2
 8001942:	401f      	ands	r7, r3
 8001944:	20ff      	movs	r0, #255	; 0xff
 8001946:	588d      	ldr	r5, [r1, r2]
 8001948:	00ff      	lsls	r7, r7, #3
 800194a:	1c03      	adds	r3, r0, #0
 800194c:	40bb      	lsls	r3, r7
 800194e:	439d      	bics	r5, r3
 8001950:	7863      	ldrb	r3, [r4, #1]
 8001952:	019b      	lsls	r3, r3, #6
 8001954:	4018      	ands	r0, r3
 8001956:	40b8      	lsls	r0, r7
 8001958:	1c2f      	adds	r7, r5, #0
 800195a:	4307      	orrs	r7, r0
 800195c:	508f      	str	r7, [r1, r2]
 800195e:	7822      	ldrb	r2, [r4, #0]
 8001960:	231f      	movs	r3, #31
 8001962:	4013      	ands	r3, r2
 8001964:	409e      	lsls	r6, r3
 8001966:	4b04      	ldr	r3, [pc, #16]	; (8001978 <NVIC_Init+0x6c>)
 8001968:	601e      	str	r6, [r3, #0]
 800196a:	e004      	b.n	8001976 <NVIC_Init+0x6a>
 800196c:	271f      	movs	r7, #31
 800196e:	403b      	ands	r3, r7
 8001970:	4a02      	ldr	r2, [pc, #8]	; (800197c <NVIC_Init+0x70>)
 8001972:	409e      	lsls	r6, r3
 8001974:	67d6      	str	r6, [r2, #124]	; 0x7c
 8001976:	bdf8      	pop	{r3, r4, r5, r6, r7, pc}
 8001978:	e000e100 	.word	0xe000e100
 800197c:	e000e104 	.word	0xe000e104

08001980 <RCC_GetClocksFreq>:
 8001980:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
 8001982:	4d5a      	ldr	r5, [pc, #360]	; (8001aec <RCC_GetClocksFreq+0x16c>)
 8001984:	1c04      	adds	r4, r0, #0
 8001986:	6868      	ldr	r0, [r5, #4]
 8001988:	230c      	movs	r3, #12
 800198a:	4018      	ands	r0, r3
 800198c:	f000 f9be 	bl	8001d0c <__gnu_thumb1_case_uqi>
 8001990:	1f1f1f1f 	.word	0x1f1f1f1f
 8001994:	1f1f1f1f 	.word	0x1f1f1f1f
 8001998:	1f1f1f07 	.word	0x1f1f1f07
 800199c:	1d          	.byte	0x1d
 800199d:	00          	.byte	0x00
 800199e:	686e      	ldr	r6, [r5, #4]
 80019a0:	23c0      	movs	r3, #192	; 0xc0
 80019a2:	02b6      	lsls	r6, r6, #10
 80019a4:	686a      	ldr	r2, [r5, #4]
 80019a6:	0f36      	lsrs	r6, r6, #28
 80019a8:	025b      	lsls	r3, r3, #9
 80019aa:	3602      	adds	r6, #2
 80019ac:	421a      	tst	r2, r3
 80019ae:	d101      	bne.n	80019b4 <RCC_GetClocksFreq+0x34>
 80019b0:	484f      	ldr	r0, [pc, #316]	; (8001af0 <RCC_GetClocksFreq+0x170>)
 80019b2:	e007      	b.n	80019c4 <RCC_GetClocksFreq+0x44>
 80019b4:	4b4d      	ldr	r3, [pc, #308]	; (8001aec <RCC_GetClocksFreq+0x16c>)
 80019b6:	484f      	ldr	r0, [pc, #316]	; (8001af4 <RCC_GetClocksFreq+0x174>)
 80019b8:	6ad9      	ldr	r1, [r3, #44]	; 0x2c
 80019ba:	230f      	movs	r3, #15
 80019bc:	4019      	ands	r1, r3
 80019be:	3101      	adds	r1, #1
 80019c0:	f000 f9ae 	bl	8001d20 <__aeabi_uidiv>
 80019c4:	4370      	muls	r0, r6
 80019c6:	6020      	str	r0, [r4, #0]
 80019c8:	e004      	b.n	80019d4 <RCC_GetClocksFreq+0x54>
 80019ca:	4b4b      	ldr	r3, [pc, #300]	; (8001af8 <RCC_GetClocksFreq+0x178>)
 80019cc:	e000      	b.n	80019d0 <RCC_GetClocksFreq+0x50>
 80019ce:	4b49      	ldr	r3, [pc, #292]	; (8001af4 <RCC_GetClocksFreq+0x174>)
 80019d0:	6023      	str	r3, [r4, #0]
 80019d2:	2000      	movs	r0, #0
 80019d4:	686b      	ldr	r3, [r5, #4]
 80019d6:	4a49      	ldr	r2, [pc, #292]	; (8001afc <RCC_GetClocksFreq+0x17c>)
 80019d8:	061b      	lsls	r3, r3, #24
 80019da:	0f1b      	lsrs	r3, r3, #28
 80019dc:	6821      	ldr	r1, [r4, #0]
 80019de:	5cd3      	ldrb	r3, [r2, r3]
 80019e0:	1c0e      	adds	r6, r1, #0
 80019e2:	40de      	lsrs	r6, r3
 80019e4:	6066      	str	r6, [r4, #4]
 80019e6:	1c33      	adds	r3, r6, #0
 80019e8:	686e      	ldr	r6, [r5, #4]
 80019ea:	0576      	lsls	r6, r6, #21
 80019ec:	0f76      	lsrs	r6, r6, #29
 80019ee:	5d92      	ldrb	r2, [r2, r6]
 80019f0:	40d3      	lsrs	r3, r2
 80019f2:	60a3      	str	r3, [r4, #8]
 80019f4:	6b2a      	ldr	r2, [r5, #48]	; 0x30
 80019f6:	05d6      	lsls	r6, r2, #23
 80019f8:	d401      	bmi.n	80019fe <RCC_GetClocksFreq+0x7e>
 80019fa:	4a41      	ldr	r2, [pc, #260]	; (8001b00 <RCC_GetClocksFreq+0x180>)
 80019fc:	e006      	b.n	8001a0c <RCC_GetClocksFreq+0x8c>
 80019fe:	4a3b      	ldr	r2, [pc, #236]	; (8001aec <RCC_GetClocksFreq+0x16c>)
 8001a00:	6852      	ldr	r2, [r2, #4]
 8001a02:	0456      	lsls	r6, r2, #17
 8001a04:	d401      	bmi.n	8001a0a <RCC_GetClocksFreq+0x8a>
 8001a06:	085a      	lsrs	r2, r3, #1
 8001a08:	e000      	b.n	8001a0c <RCC_GetClocksFreq+0x8c>
 8001a0a:	089a      	lsrs	r2, r3, #2
 8001a0c:	60e2      	str	r2, [r4, #12]
 8001a0e:	6b2a      	ldr	r2, [r5, #48]	; 0x30
 8001a10:	0656      	lsls	r6, r2, #25
 8001a12:	d401      	bmi.n	8001a18 <RCC_GetClocksFreq+0x98>
 8001a14:	4a3b      	ldr	r2, [pc, #236]	; (8001b04 <RCC_GetClocksFreq+0x184>)
 8001a16:	e001      	b.n	8001a1c <RCC_GetClocksFreq+0x9c>
 8001a18:	2280      	movs	r2, #128	; 0x80
 8001a1a:	0212      	lsls	r2, r2, #8
 8001a1c:	6122      	str	r2, [r4, #16]
 8001a1e:	6b2a      	ldr	r2, [r5, #48]	; 0x30
 8001a20:	06d6      	lsls	r6, r2, #27
 8001a22:	d402      	bmi.n	8001a2a <RCC_GetClocksFreq+0xaa>
 8001a24:	4a33      	ldr	r2, [pc, #204]	; (8001af4 <RCC_GetClocksFreq+0x174>)
 8001a26:	6162      	str	r2, [r4, #20]
 8001a28:	e000      	b.n	8001a2c <RCC_GetClocksFreq+0xac>
 8001a2a:	6161      	str	r1, [r4, #20]
 8001a2c:	6b2f      	ldr	r7, [r5, #48]	; 0x30
 8001a2e:	2203      	movs	r2, #3
 8001a30:	4e2e      	ldr	r6, [pc, #184]	; (8001aec <RCC_GetClocksFreq+0x16c>)
 8001a32:	4217      	tst	r7, r2
 8001a34:	d101      	bne.n	8001a3a <RCC_GetClocksFreq+0xba>
 8001a36:	61a3      	str	r3, [r4, #24]
 8001a38:	e012      	b.n	8001a60 <RCC_GetClocksFreq+0xe0>
 8001a3a:	6b37      	ldr	r7, [r6, #48]	; 0x30
 8001a3c:	4017      	ands	r7, r2
 8001a3e:	2f01      	cmp	r7, #1
 8001a40:	d101      	bne.n	8001a46 <RCC_GetClocksFreq+0xc6>
 8001a42:	61a1      	str	r1, [r4, #24]
 8001a44:	e00c      	b.n	8001a60 <RCC_GetClocksFreq+0xe0>
 8001a46:	6b37      	ldr	r7, [r6, #48]	; 0x30
 8001a48:	4017      	ands	r7, r2
 8001a4a:	2f02      	cmp	r7, #2
 8001a4c:	d102      	bne.n	8001a54 <RCC_GetClocksFreq+0xd4>
 8001a4e:	2280      	movs	r2, #128	; 0x80
 8001a50:	0212      	lsls	r2, r2, #8
 8001a52:	e004      	b.n	8001a5e <RCC_GetClocksFreq+0xde>
 8001a54:	6b36      	ldr	r6, [r6, #48]	; 0x30
 8001a56:	4032      	ands	r2, r6
 8001a58:	2a03      	cmp	r2, #3
 8001a5a:	d101      	bne.n	8001a60 <RCC_GetClocksFreq+0xe0>
 8001a5c:	4a25      	ldr	r2, [pc, #148]	; (8001af4 <RCC_GetClocksFreq+0x174>)
 8001a5e:	61a2      	str	r2, [r4, #24]
 8001a60:	22c0      	movs	r2, #192	; 0xc0
 8001a62:	6b2f      	ldr	r7, [r5, #48]	; 0x30
 8001a64:	0292      	lsls	r2, r2, #10
 8001a66:	4e21      	ldr	r6, [pc, #132]	; (8001aec <RCC_GetClocksFreq+0x16c>)
 8001a68:	4217      	tst	r7, r2
 8001a6a:	d101      	bne.n	8001a70 <RCC_GetClocksFreq+0xf0>
 8001a6c:	61e3      	str	r3, [r4, #28]
 8001a6e:	e018      	b.n	8001aa2 <RCC_GetClocksFreq+0x122>
 8001a70:	6b37      	ldr	r7, [r6, #48]	; 0x30
 8001a72:	4017      	ands	r7, r2
 8001a74:	46bc      	mov	ip, r7
 8001a76:	2780      	movs	r7, #128	; 0x80
 8001a78:	027f      	lsls	r7, r7, #9
 8001a7a:	45bc      	cmp	ip, r7
 8001a7c:	d101      	bne.n	8001a82 <RCC_GetClocksFreq+0x102>
 8001a7e:	61e1      	str	r1, [r4, #28]
 8001a80:	e00f      	b.n	8001aa2 <RCC_GetClocksFreq+0x122>
 8001a82:	6b37      	ldr	r7, [r6, #48]	; 0x30
 8001a84:	4017      	ands	r7, r2
 8001a86:	46bc      	mov	ip, r7
 8001a88:	2780      	movs	r7, #128	; 0x80
 8001a8a:	02bf      	lsls	r7, r7, #10
 8001a8c:	45bc      	cmp	ip, r7
 8001a8e:	d102      	bne.n	8001a96 <RCC_GetClocksFreq+0x116>
 8001a90:	2280      	movs	r2, #128	; 0x80
 8001a92:	0212      	lsls	r2, r2, #8
 8001a94:	e004      	b.n	8001aa0 <RCC_GetClocksFreq+0x120>
 8001a96:	6b36      	ldr	r6, [r6, #48]	; 0x30
 8001a98:	4016      	ands	r6, r2
 8001a9a:	4296      	cmp	r6, r2
 8001a9c:	d101      	bne.n	8001aa2 <RCC_GetClocksFreq+0x122>
 8001a9e:	4a15      	ldr	r2, [pc, #84]	; (8001af4 <RCC_GetClocksFreq+0x174>)
 8001aa0:	61e2      	str	r2, [r4, #28]
 8001aa2:	22c0      	movs	r2, #192	; 0xc0
 8001aa4:	6b2f      	ldr	r7, [r5, #48]	; 0x30
 8001aa6:	0312      	lsls	r2, r2, #12
 8001aa8:	4e10      	ldr	r6, [pc, #64]	; (8001aec <RCC_GetClocksFreq+0x16c>)
 8001aaa:	4217      	tst	r7, r2
 8001aac:	d015      	beq.n	8001ada <RCC_GetClocksFreq+0x15a>
 8001aae:	6b37      	ldr	r7, [r6, #48]	; 0x30
 8001ab0:	2380      	movs	r3, #128	; 0x80
 8001ab2:	4017      	ands	r7, r2
 8001ab4:	02db      	lsls	r3, r3, #11
 8001ab6:	429f      	cmp	r7, r3
 8001ab8:	d101      	bne.n	8001abe <RCC_GetClocksFreq+0x13e>
 8001aba:	6221      	str	r1, [r4, #32]
 8001abc:	e00e      	b.n	8001adc <RCC_GetClocksFreq+0x15c>
 8001abe:	6b31      	ldr	r1, [r6, #48]	; 0x30
 8001ac0:	2380      	movs	r3, #128	; 0x80
 8001ac2:	4011      	ands	r1, r2
 8001ac4:	031b      	lsls	r3, r3, #12
 8001ac6:	4299      	cmp	r1, r3
 8001ac8:	d102      	bne.n	8001ad0 <RCC_GetClocksFreq+0x150>
 8001aca:	2380      	movs	r3, #128	; 0x80
 8001acc:	021b      	lsls	r3, r3, #8
 8001ace:	e004      	b.n	8001ada <RCC_GetClocksFreq+0x15a>
 8001ad0:	6b33      	ldr	r3, [r6, #48]	; 0x30
 8001ad2:	4013      	ands	r3, r2
 8001ad4:	4293      	cmp	r3, r2
 8001ad6:	d101      	bne.n	8001adc <RCC_GetClocksFreq+0x15c>
 8001ad8:	4b06      	ldr	r3, [pc, #24]	; (8001af4 <RCC_GetClocksFreq+0x174>)
 8001ada:	6223      	str	r3, [r4, #32]
 8001adc:	6b2b      	ldr	r3, [r5, #48]	; 0x30
 8001ade:	061a      	lsls	r2, r3, #24
 8001ae0:	d402      	bmi.n	8001ae8 <RCC_GetClocksFreq+0x168>
 8001ae2:	4b05      	ldr	r3, [pc, #20]	; (8001af8 <RCC_GetClocksFreq+0x178>)
 8001ae4:	6263      	str	r3, [r4, #36]	; 0x24
 8001ae6:	e000      	b.n	8001aea <RCC_GetClocksFreq+0x16a>
 8001ae8:	6260      	str	r0, [r4, #36]	; 0x24
 8001aea:	bdf8      	pop	{r3, r4, r5, r6, r7, pc}
 8001aec:	40021000 	.word	0x40021000
 8001af0:	003d0900 	.word	0x003d0900
 8001af4:	007a1200 	.word	0x007a1200
 8001af8:	02dc6c00 	.word	0x02dc6c00
 8001afc:	20000000 	.word	0x20000000
 8001b00:	00d59f80 	.word	0x00d59f80
 8001b04:	00008012 	.word	0x00008012

08001b08 <RCC_AHBPeriphClockCmd>:
 8001b08:	b538      	push	{r3, r4, r5, lr}
 8001b0a:	4b0d      	ldr	r3, [pc, #52]	; (8001b40 <RCC_AHBPeriphClockCmd+0x38>)
 8001b0c:	1c04      	adds	r4, r0, #0
 8001b0e:	1c0d      	adds	r5, r1, #0
 8001b10:	2000      	movs	r0, #0
 8001b12:	421c      	tst	r4, r3
 8001b14:	d102      	bne.n	8001b1c <RCC_AHBPeriphClockCmd+0x14>
 8001b16:	1c20      	adds	r0, r4, #0
 8001b18:	1e43      	subs	r3, r0, #1
 8001b1a:	4198      	sbcs	r0, r3
 8001b1c:	f7ff fb19 	bl	8001152 <assert_param>
 8001b20:	2301      	movs	r3, #1
 8001b22:	2000      	movs	r0, #0
 8001b24:	42ab      	cmp	r3, r5
 8001b26:	4140      	adcs	r0, r0
 8001b28:	f7ff fb13 	bl	8001152 <assert_param>
 8001b2c:	4b05      	ldr	r3, [pc, #20]	; (8001b44 <RCC_AHBPeriphClockCmd+0x3c>)
 8001b2e:	695a      	ldr	r2, [r3, #20]
 8001b30:	2d00      	cmp	r5, #0
 8001b32:	d002      	beq.n	8001b3a <RCC_AHBPeriphClockCmd+0x32>
 8001b34:	4314      	orrs	r4, r2
 8001b36:	615c      	str	r4, [r3, #20]
 8001b38:	e001      	b.n	8001b3e <RCC_AHBPeriphClockCmd+0x36>
 8001b3a:	43a2      	bics	r2, r4
 8001b3c:	615a      	str	r2, [r3, #20]
 8001b3e:	bd38      	pop	{r3, r4, r5, pc}
 8001b40:	fe81ffa8 	.word	0xfe81ffa8
 8001b44:	40021000 	.word	0x40021000

08001b48 <RCC_APB2PeriphClockCmd>:
 8001b48:	b538      	push	{r3, r4, r5, lr}
 8001b4a:	4b0d      	ldr	r3, [pc, #52]	; (8001b80 <RCC_APB2PeriphClockCmd+0x38>)
 8001b4c:	1c04      	adds	r4, r0, #0
 8001b4e:	1c0d      	adds	r5, r1, #0
 8001b50:	2000      	movs	r0, #0
 8001b52:	421c      	tst	r4, r3
 8001b54:	d102      	bne.n	8001b5c <RCC_APB2PeriphClockCmd+0x14>
 8001b56:	1c20      	adds	r0, r4, #0
 8001b58:	1e43      	subs	r3, r0, #1
 8001b5a:	4198      	sbcs	r0, r3
 8001b5c:	f7ff faf9 	bl	8001152 <assert_param>
 8001b60:	2301      	movs	r3, #1
 8001b62:	2000      	movs	r0, #0
 8001b64:	42ab      	cmp	r3, r5
 8001b66:	4140      	adcs	r0, r0
 8001b68:	f7ff faf3 	bl	8001152 <assert_param>
 8001b6c:	4b05      	ldr	r3, [pc, #20]	; (8001b84 <RCC_APB2PeriphClockCmd+0x3c>)
 8001b6e:	699a      	ldr	r2, [r3, #24]
 8001b70:	2d00      	cmp	r5, #0
 8001b72:	d002      	beq.n	8001b7a <RCC_APB2PeriphClockCmd+0x32>
 8001b74:	4314      	orrs	r4, r2
 8001b76:	619c      	str	r4, [r3, #24]
 8001b78:	e001      	b.n	8001b7e <RCC_APB2PeriphClockCmd+0x36>
 8001b7a:	43a2      	bics	r2, r4
 8001b7c:	619a      	str	r2, [r3, #24]
 8001b7e:	bd38      	pop	{r3, r4, r5, pc}
 8001b80:	ffb8a51e 	.word	0xffb8a51e
 8001b84:	40021000 	.word	0x40021000

08001b88 <RCC_APB1PeriphClockCmd>:
 8001b88:	b538      	push	{r3, r4, r5, lr}
 8001b8a:	4b0d      	ldr	r3, [pc, #52]	; (8001bc0 <RCC_APB1PeriphClockCmd+0x38>)
 8001b8c:	1c04      	adds	r4, r0, #0
 8001b8e:	1c0d      	adds	r5, r1, #0
 8001b90:	2000      	movs	r0, #0
 8001b92:	421c      	tst	r4, r3
 8001b94:	d102      	bne.n	8001b9c <RCC_APB1PeriphClockCmd+0x14>
 8001b96:	1c20      	adds	r0, r4, #0
 8001b98:	1e43      	subs	r3, r0, #1
 8001b9a:	4198      	sbcs	r0, r3
 8001b9c:	f7ff fad9 	bl	8001152 <assert_param>
 8001ba0:	2301      	movs	r3, #1
 8001ba2:	2000      	movs	r0, #0
 8001ba4:	42ab      	cmp	r3, r5
 8001ba6:	4140      	adcs	r0, r0
 8001ba8:	f7ff fad3 	bl	8001152 <assert_param>
 8001bac:	4b05      	ldr	r3, [pc, #20]	; (8001bc4 <RCC_APB1PeriphClockCmd+0x3c>)
 8001bae:	69da      	ldr	r2, [r3, #28]
 8001bb0:	2d00      	cmp	r5, #0
 8001bb2:	d002      	beq.n	8001bba <RCC_APB1PeriphClockCmd+0x32>
 8001bb4:	4314      	orrs	r4, r2
 8001bb6:	61dc      	str	r4, [r3, #28]
 8001bb8:	e001      	b.n	8001bbe <RCC_APB1PeriphClockCmd+0x36>
 8001bba:	43a2      	bics	r2, r4
 8001bbc:	61da      	str	r2, [r3, #28]
 8001bbe:	bd38      	pop	{r3, r4, r5, pc}
 8001bc0:	8581b6cc 	.word	0x8581b6cc
 8001bc4:	40021000 	.word	0x40021000

08001bc8 <gpio_init>:
 8001bc8:	b5f7      	push	{r0, r1, r2, r4, r5, r6, r7, lr}
 8001bca:	2080      	movs	r0, #128	; 0x80
 8001bcc:	0280      	lsls	r0, r0, #10
 8001bce:	2101      	movs	r1, #1
 8001bd0:	f7ff ff9a 	bl	8001b08 <RCC_AHBPeriphClockCmd>
 8001bd4:	2080      	movs	r0, #128	; 0x80
 8001bd6:	02c0      	lsls	r0, r0, #11
 8001bd8:	2101      	movs	r1, #1
 8001bda:	f7ff ff95 	bl	8001b08 <RCC_AHBPeriphClockCmd>
 8001bde:	2208      	movs	r2, #8
 8001be0:	2400      	movs	r4, #0
 8001be2:	466b      	mov	r3, sp
 8001be4:	2603      	movs	r6, #3
 8001be6:	9200      	str	r2, [sp, #0]
 8001be8:	4669      	mov	r1, sp
 8001bea:	2201      	movs	r2, #1
 8001bec:	481c      	ldr	r0, [pc, #112]	; (8001c60 <gpio_init+0x98>)
 8001bee:	715e      	strb	r6, [r3, #5]
 8001bf0:	711a      	strb	r2, [r3, #4]
 8001bf2:	719c      	strb	r4, [r3, #6]
 8001bf4:	71dc      	strb	r4, [r3, #7]
 8001bf6:	2590      	movs	r5, #144	; 0x90
 8001bf8:	f7ff fb26 	bl	8001248 <GPIO_Init>
 8001bfc:	2380      	movs	r3, #128	; 0x80
 8001bfe:	05ed      	lsls	r5, r5, #23
 8001c00:	005b      	lsls	r3, r3, #1
 8001c02:	466a      	mov	r2, sp
 8001c04:	1c28      	adds	r0, r5, #0
 8001c06:	9300      	str	r3, [sp, #0]
 8001c08:	4669      	mov	r1, sp
 8001c0a:	2301      	movs	r3, #1
 8001c0c:	2780      	movs	r7, #128	; 0x80
 8001c0e:	7156      	strb	r6, [r2, #5]
 8001c10:	013f      	lsls	r7, r7, #4
 8001c12:	7113      	strb	r3, [r2, #4]
 8001c14:	7194      	strb	r4, [r2, #6]
 8001c16:	71d4      	strb	r4, [r2, #7]
 8001c18:	f7ff fb16 	bl	8001248 <GPIO_Init>
 8001c1c:	466a      	mov	r2, sp
 8001c1e:	1c28      	adds	r0, r5, #0
 8001c20:	2301      	movs	r3, #1
 8001c22:	4669      	mov	r1, sp
 8001c24:	7156      	strb	r6, [r2, #5]
 8001c26:	9700      	str	r7, [sp, #0]
 8001c28:	7113      	strb	r3, [r2, #4]
 8001c2a:	7194      	strb	r4, [r2, #6]
 8001c2c:	71d4      	strb	r4, [r2, #7]
 8001c2e:	f7ff fb0b 	bl	8001248 <GPIO_Init>
 8001c32:	2202      	movs	r2, #2
 8001c34:	466b      	mov	r3, sp
 8001c36:	9200      	str	r2, [sp, #0]
 8001c38:	1c28      	adds	r0, r5, #0
 8001c3a:	2201      	movs	r2, #1
 8001c3c:	4669      	mov	r1, sp
 8001c3e:	715e      	strb	r6, [r3, #5]
 8001c40:	711a      	strb	r2, [r3, #4]
 8001c42:	719c      	strb	r4, [r3, #6]
 8001c44:	71dc      	strb	r4, [r3, #7]
 8001c46:	f7ff faff 	bl	8001248 <GPIO_Init>
 8001c4a:	4b05      	ldr	r3, [pc, #20]	; (8001c60 <gpio_init+0x98>)
 8001c4c:	2208      	movs	r2, #8
 8001c4e:	851a      	strh	r2, [r3, #40]	; 0x28
 8001c50:	2380      	movs	r3, #128	; 0x80
 8001c52:	005b      	lsls	r3, r3, #1
 8001c54:	2202      	movs	r2, #2
 8001c56:	852b      	strh	r3, [r5, #40]	; 0x28
 8001c58:	852f      	strh	r7, [r5, #40]	; 0x28
 8001c5a:	852a      	strh	r2, [r5, #40]	; 0x28
 8001c5c:	bdf7      	pop	{r0, r1, r2, r4, r5, r6, r7, pc}
 8001c5e:	46c0      	nop			; (mov r8, r8)
 8001c60:	48000400 	.word	0x48000400

08001c64 <led_on>:
 8001c64:	2808      	cmp	r0, #8
 8001c66:	d101      	bne.n	8001c6c <led_on+0x8>
 8001c68:	4b07      	ldr	r3, [pc, #28]	; (8001c88 <led_on+0x24>)
 8001c6a:	e00b      	b.n	8001c84 <led_on+0x20>
 8001c6c:	2380      	movs	r3, #128	; 0x80
 8001c6e:	005b      	lsls	r3, r3, #1
 8001c70:	4298      	cmp	r0, r3
 8001c72:	d005      	beq.n	8001c80 <led_on+0x1c>
 8001c74:	2380      	movs	r3, #128	; 0x80
 8001c76:	011b      	lsls	r3, r3, #4
 8001c78:	4298      	cmp	r0, r3
 8001c7a:	d001      	beq.n	8001c80 <led_on+0x1c>
 8001c7c:	2802      	cmp	r0, #2
 8001c7e:	d102      	bne.n	8001c86 <led_on+0x22>
 8001c80:	2390      	movs	r3, #144	; 0x90
 8001c82:	05db      	lsls	r3, r3, #23
 8001c84:	6198      	str	r0, [r3, #24]
 8001c86:	4770      	bx	lr
 8001c88:	48000400 	.word	0x48000400

08001c8c <led_off>:
 8001c8c:	2808      	cmp	r0, #8
 8001c8e:	d101      	bne.n	8001c94 <led_off+0x8>
 8001c90:	4b07      	ldr	r3, [pc, #28]	; (8001cb0 <led_off+0x24>)
 8001c92:	e00b      	b.n	8001cac <led_off+0x20>
 8001c94:	2380      	movs	r3, #128	; 0x80
 8001c96:	005b      	lsls	r3, r3, #1
 8001c98:	4298      	cmp	r0, r3
 8001c9a:	d005      	beq.n	8001ca8 <led_off+0x1c>
 8001c9c:	2380      	movs	r3, #128	; 0x80
 8001c9e:	011b      	lsls	r3, r3, #4
 8001ca0:	4298      	cmp	r0, r3
 8001ca2:	d001      	beq.n	8001ca8 <led_off+0x1c>
 8001ca4:	2802      	cmp	r0, #2
 8001ca6:	d102      	bne.n	8001cae <led_off+0x22>
 8001ca8:	2390      	movs	r3, #144	; 0x90
 8001caa:	05db      	lsls	r3, r3, #23
 8001cac:	8518      	strh	r0, [r3, #40]	; 0x28
 8001cae:	4770      	bx	lr
 8001cb0:	48000400 	.word	0x48000400

08001cb4 <Default_Handler>:
 8001cb4:	4770      	bx	lr
	...

08001cb8 <HardFault_Handler>:
 8001cb8:	2008      	movs	r0, #8
 8001cba:	f7ff ffd3 	bl	8001c64 <led_on>
 8001cbe:	4b07      	ldr	r3, [pc, #28]	; (8001cdc <HardFault_Handler+0x24>)
 8001cc0:	3b01      	subs	r3, #1
 8001cc2:	2b00      	cmp	r3, #0
 8001cc4:	d001      	beq.n	8001cca <HardFault_Handler+0x12>
 8001cc6:	46c0      	nop			; (mov r8, r8)
 8001cc8:	e7fa      	b.n	8001cc0 <HardFault_Handler+0x8>
 8001cca:	2008      	movs	r0, #8
 8001ccc:	f7ff ffde 	bl	8001c8c <led_off>
 8001cd0:	4b02      	ldr	r3, [pc, #8]	; (8001cdc <HardFault_Handler+0x24>)
 8001cd2:	3b01      	subs	r3, #1
 8001cd4:	2b00      	cmp	r3, #0
 8001cd6:	d0ef      	beq.n	8001cb8 <HardFault_Handler>
 8001cd8:	46c0      	nop			; (mov r8, r8)
 8001cda:	e7fa      	b.n	8001cd2 <HardFault_Handler+0x1a>
 8001cdc:	002dc6c1 	.word	0x002dc6c1

08001ce0 <_reset_init>:
 8001ce0:	4a07      	ldr	r2, [pc, #28]	; (8001d00 <_reset_init+0x20>)
 8001ce2:	4908      	ldr	r1, [pc, #32]	; (8001d04 <_reset_init+0x24>)
 8001ce4:	2300      	movs	r3, #0
 8001ce6:	1a89      	subs	r1, r1, r2
 8001ce8:	1089      	asrs	r1, r1, #2
 8001cea:	1c10      	adds	r0, r2, #0
 8001cec:	428b      	cmp	r3, r1
 8001cee:	d005      	beq.n	8001cfc <_reset_init+0x1c>
 8001cf0:	4c05      	ldr	r4, [pc, #20]	; (8001d08 <_reset_init+0x28>)
 8001cf2:	009a      	lsls	r2, r3, #2
 8001cf4:	58a4      	ldr	r4, [r4, r2]
 8001cf6:	3301      	adds	r3, #1
 8001cf8:	5084      	str	r4, [r0, r2]
 8001cfa:	e7f7      	b.n	8001cec <_reset_init+0xc>
 8001cfc:	f7ff f826 	bl	8000d4c <main>
 8001d00:	20000000 	.word	0x20000000
 8001d04:	20000010 	.word	0x20000010
 8001d08:	0800254c 	.word	0x0800254c

08001d0c <__gnu_thumb1_case_uqi>:
 8001d0c:	b402      	push	{r1}
 8001d0e:	4671      	mov	r1, lr
 8001d10:	0849      	lsrs	r1, r1, #1
 8001d12:	0049      	lsls	r1, r1, #1
 8001d14:	5c09      	ldrb	r1, [r1, r0]
 8001d16:	0049      	lsls	r1, r1, #1
 8001d18:	448e      	add	lr, r1
 8001d1a:	bc02      	pop	{r1}
 8001d1c:	4770      	bx	lr
 8001d1e:	46c0      	nop			; (mov r8, r8)

08001d20 <__aeabi_uidiv>:
 8001d20:	2900      	cmp	r1, #0
 8001d22:	d034      	beq.n	8001d8e <.udivsi3_skip_div0_test+0x6a>

08001d24 <.udivsi3_skip_div0_test>:
 8001d24:	2301      	movs	r3, #1
 8001d26:	2200      	movs	r2, #0
 8001d28:	b410      	push	{r4}
 8001d2a:	4288      	cmp	r0, r1
 8001d2c:	d32c      	bcc.n	8001d88 <.udivsi3_skip_div0_test+0x64>
 8001d2e:	2401      	movs	r4, #1
 8001d30:	0724      	lsls	r4, r4, #28
 8001d32:	42a1      	cmp	r1, r4
 8001d34:	d204      	bcs.n	8001d40 <.udivsi3_skip_div0_test+0x1c>
 8001d36:	4281      	cmp	r1, r0
 8001d38:	d202      	bcs.n	8001d40 <.udivsi3_skip_div0_test+0x1c>
 8001d3a:	0109      	lsls	r1, r1, #4
 8001d3c:	011b      	lsls	r3, r3, #4
 8001d3e:	e7f8      	b.n	8001d32 <.udivsi3_skip_div0_test+0xe>
 8001d40:	00e4      	lsls	r4, r4, #3
 8001d42:	42a1      	cmp	r1, r4
 8001d44:	d204      	bcs.n	8001d50 <.udivsi3_skip_div0_test+0x2c>
 8001d46:	4281      	cmp	r1, r0
 8001d48:	d202      	bcs.n	8001d50 <.udivsi3_skip_div0_test+0x2c>
 8001d4a:	0049      	lsls	r1, r1, #1
 8001d4c:	005b      	lsls	r3, r3, #1
 8001d4e:	e7f8      	b.n	8001d42 <.udivsi3_skip_div0_test+0x1e>
 8001d50:	4288      	cmp	r0, r1
 8001d52:	d301      	bcc.n	8001d58 <.udivsi3_skip_div0_test+0x34>
 8001d54:	1a40      	subs	r0, r0, r1
 8001d56:	431a      	orrs	r2, r3
 8001d58:	084c      	lsrs	r4, r1, #1
 8001d5a:	42a0      	cmp	r0, r4
 8001d5c:	d302      	bcc.n	8001d64 <.udivsi3_skip_div0_test+0x40>
 8001d5e:	1b00      	subs	r0, r0, r4
 8001d60:	085c      	lsrs	r4, r3, #1
 8001d62:	4322      	orrs	r2, r4
 8001d64:	088c      	lsrs	r4, r1, #2
 8001d66:	42a0      	cmp	r0, r4
 8001d68:	d302      	bcc.n	8001d70 <.udivsi3_skip_div0_test+0x4c>
 8001d6a:	1b00      	subs	r0, r0, r4
 8001d6c:	089c      	lsrs	r4, r3, #2
 8001d6e:	4322      	orrs	r2, r4
 8001d70:	08cc      	lsrs	r4, r1, #3
 8001d72:	42a0      	cmp	r0, r4
 8001d74:	d302      	bcc.n	8001d7c <.udivsi3_skip_div0_test+0x58>
 8001d76:	1b00      	subs	r0, r0, r4
 8001d78:	08dc      	lsrs	r4, r3, #3
 8001d7a:	4322      	orrs	r2, r4
 8001d7c:	2800      	cmp	r0, #0
 8001d7e:	d003      	beq.n	8001d88 <.udivsi3_skip_div0_test+0x64>
 8001d80:	091b      	lsrs	r3, r3, #4
 8001d82:	d001      	beq.n	8001d88 <.udivsi3_skip_div0_test+0x64>
 8001d84:	0909      	lsrs	r1, r1, #4
 8001d86:	e7e3      	b.n	8001d50 <.udivsi3_skip_div0_test+0x2c>
 8001d88:	1c10      	adds	r0, r2, #0
 8001d8a:	bc10      	pop	{r4}
 8001d8c:	4770      	bx	lr
 8001d8e:	2800      	cmp	r0, #0
 8001d90:	d001      	beq.n	8001d96 <.udivsi3_skip_div0_test+0x72>
 8001d92:	2000      	movs	r0, #0
 8001d94:	43c0      	mvns	r0, r0
 8001d96:	b407      	push	{r0, r1, r2}
 8001d98:	4802      	ldr	r0, [pc, #8]	; (8001da4 <.udivsi3_skip_div0_test+0x80>)
 8001d9a:	a102      	add	r1, pc, #8	; (adr r1, 8001da4 <.udivsi3_skip_div0_test+0x80>)
 8001d9c:	1840      	adds	r0, r0, r1
 8001d9e:	9002      	str	r0, [sp, #8]
 8001da0:	bd03      	pop	{r0, r1, pc}
 8001da2:	46c0      	nop			; (mov r8, r8)
 8001da4:	000000d9 	.word	0x000000d9

08001da8 <__aeabi_uidivmod>:
 8001da8:	2900      	cmp	r1, #0
 8001daa:	d0f0      	beq.n	8001d8e <.udivsi3_skip_div0_test+0x6a>
 8001dac:	b503      	push	{r0, r1, lr}
 8001dae:	f7ff ffb9 	bl	8001d24 <.udivsi3_skip_div0_test>
 8001db2:	bc0e      	pop	{r1, r2, r3}
 8001db4:	4342      	muls	r2, r0
 8001db6:	1a89      	subs	r1, r1, r2
 8001db8:	4718      	bx	r3
 8001dba:	46c0      	nop			; (mov r8, r8)

08001dbc <__aeabi_idiv>:
 8001dbc:	2900      	cmp	r1, #0
 8001dbe:	d041      	beq.n	8001e44 <.divsi3_skip_div0_test+0x84>

08001dc0 <.divsi3_skip_div0_test>:
 8001dc0:	b410      	push	{r4}
 8001dc2:	1c04      	adds	r4, r0, #0
 8001dc4:	404c      	eors	r4, r1
 8001dc6:	46a4      	mov	ip, r4
 8001dc8:	2301      	movs	r3, #1
 8001dca:	2200      	movs	r2, #0
 8001dcc:	2900      	cmp	r1, #0
 8001dce:	d500      	bpl.n	8001dd2 <.divsi3_skip_div0_test+0x12>
 8001dd0:	4249      	negs	r1, r1
 8001dd2:	2800      	cmp	r0, #0
 8001dd4:	d500      	bpl.n	8001dd8 <.divsi3_skip_div0_test+0x18>
 8001dd6:	4240      	negs	r0, r0
 8001dd8:	4288      	cmp	r0, r1
 8001dda:	d32c      	bcc.n	8001e36 <.divsi3_skip_div0_test+0x76>
 8001ddc:	2401      	movs	r4, #1
 8001dde:	0724      	lsls	r4, r4, #28
 8001de0:	42a1      	cmp	r1, r4
 8001de2:	d204      	bcs.n	8001dee <.divsi3_skip_div0_test+0x2e>
 8001de4:	4281      	cmp	r1, r0
 8001de6:	d202      	bcs.n	8001dee <.divsi3_skip_div0_test+0x2e>
 8001de8:	0109      	lsls	r1, r1, #4
 8001dea:	011b      	lsls	r3, r3, #4
 8001dec:	e7f8      	b.n	8001de0 <.divsi3_skip_div0_test+0x20>
 8001dee:	00e4      	lsls	r4, r4, #3
 8001df0:	42a1      	cmp	r1, r4
 8001df2:	d204      	bcs.n	8001dfe <.divsi3_skip_div0_test+0x3e>
 8001df4:	4281      	cmp	r1, r0
 8001df6:	d202      	bcs.n	8001dfe <.divsi3_skip_div0_test+0x3e>
 8001df8:	0049      	lsls	r1, r1, #1
 8001dfa:	005b      	lsls	r3, r3, #1
 8001dfc:	e7f8      	b.n	8001df0 <.divsi3_skip_div0_test+0x30>
 8001dfe:	4288      	cmp	r0, r1
 8001e00:	d301      	bcc.n	8001e06 <.divsi3_skip_div0_test+0x46>
 8001e02:	1a40      	subs	r0, r0, r1
 8001e04:	431a      	orrs	r2, r3
 8001e06:	084c      	lsrs	r4, r1, #1
 8001e08:	42a0      	cmp	r0, r4
 8001e0a:	d302      	bcc.n	8001e12 <.divsi3_skip_div0_test+0x52>
 8001e0c:	1b00      	subs	r0, r0, r4
 8001e0e:	085c      	lsrs	r4, r3, #1
 8001e10:	4322      	orrs	r2, r4
 8001e12:	088c      	lsrs	r4, r1, #2
 8001e14:	42a0      	cmp	r0, r4
 8001e16:	d302      	bcc.n	8001e1e <.divsi3_skip_div0_test+0x5e>
 8001e18:	1b00      	subs	r0, r0, r4
 8001e1a:	089c      	lsrs	r4, r3, #2
 8001e1c:	4322      	orrs	r2, r4
 8001e1e:	08cc      	lsrs	r4, r1, #3
 8001e20:	42a0      	cmp	r0, r4
 8001e22:	d302      	bcc.n	8001e2a <.divsi3_skip_div0_test+0x6a>
 8001e24:	1b00      	subs	r0, r0, r4
 8001e26:	08dc      	lsrs	r4, r3, #3
 8001e28:	4322      	orrs	r2, r4
 8001e2a:	2800      	cmp	r0, #0
 8001e2c:	d003      	beq.n	8001e36 <.divsi3_skip_div0_test+0x76>
 8001e2e:	091b      	lsrs	r3, r3, #4
 8001e30:	d001      	beq.n	8001e36 <.divsi3_skip_div0_test+0x76>
 8001e32:	0909      	lsrs	r1, r1, #4
 8001e34:	e7e3      	b.n	8001dfe <.divsi3_skip_div0_test+0x3e>
 8001e36:	1c10      	adds	r0, r2, #0
 8001e38:	4664      	mov	r4, ip
 8001e3a:	2c00      	cmp	r4, #0
 8001e3c:	d500      	bpl.n	8001e40 <.divsi3_skip_div0_test+0x80>
 8001e3e:	4240      	negs	r0, r0
 8001e40:	bc10      	pop	{r4}
 8001e42:	4770      	bx	lr
 8001e44:	2800      	cmp	r0, #0
 8001e46:	d006      	beq.n	8001e56 <.divsi3_skip_div0_test+0x96>
 8001e48:	db03      	blt.n	8001e52 <.divsi3_skip_div0_test+0x92>
 8001e4a:	2000      	movs	r0, #0
 8001e4c:	43c0      	mvns	r0, r0
 8001e4e:	0840      	lsrs	r0, r0, #1
 8001e50:	e001      	b.n	8001e56 <.divsi3_skip_div0_test+0x96>
 8001e52:	2080      	movs	r0, #128	; 0x80
 8001e54:	0600      	lsls	r0, r0, #24
 8001e56:	b407      	push	{r0, r1, r2}
 8001e58:	4802      	ldr	r0, [pc, #8]	; (8001e64 <.divsi3_skip_div0_test+0xa4>)
 8001e5a:	a102      	add	r1, pc, #8	; (adr r1, 8001e64 <.divsi3_skip_div0_test+0xa4>)
 8001e5c:	1840      	adds	r0, r0, r1
 8001e5e:	9002      	str	r0, [sp, #8]
 8001e60:	bd03      	pop	{r0, r1, pc}
 8001e62:	46c0      	nop			; (mov r8, r8)
 8001e64:	00000019 	.word	0x00000019

08001e68 <__aeabi_idivmod>:
 8001e68:	2900      	cmp	r1, #0
 8001e6a:	d0eb      	beq.n	8001e44 <.divsi3_skip_div0_test+0x84>
 8001e6c:	b503      	push	{r0, r1, lr}
 8001e6e:	f7ff ffa7 	bl	8001dc0 <.divsi3_skip_div0_test>
 8001e72:	bc0e      	pop	{r1, r2, r3}
 8001e74:	4342      	muls	r2, r0
 8001e76:	1a89      	subs	r1, r1, r2
 8001e78:	4718      	bx	r3
 8001e7a:	46c0      	nop			; (mov r8, r8)

08001e7c <__aeabi_idiv0>:
 8001e7c:	4770      	bx	lr
 8001e7e:	46c0      	nop			; (mov r8, r8)

08001e80 <_init>:
 8001e80:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
 8001e82:	46c0      	nop			; (mov r8, r8)
 8001e84:	bcf8      	pop	{r3, r4, r5, r6, r7}
 8001e86:	bc08      	pop	{r3}
 8001e88:	469e      	mov	lr, r3
 8001e8a:	4770      	bx	lr

08001e8c <_fini>:
 8001e8c:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
 8001e8e:	46c0      	nop			; (mov r8, r8)
 8001e90:	bcf8      	pop	{r3, r4, r5, r6, r7}
 8001e92:	bc08      	pop	{r3}
 8001e94:	469e      	mov	lr, r3
 8001e96:	4770      	bx	lr
 8001e98:	69647473 	.word	0x69647473
 8001e9c:	6e69206f 	.word	0x6e69206f
 8001ea0:	64207469 	.word	0x64207469
 8001ea4:	0a656e6f 	.word	0x0a656e6f
	...

08001ea9 <font_data>:
	...
 8001eb9:	3c180000 18183c3c 18180018 00000000     ...<<<..........
 8001ec9:	63636300 00000022 00000000 00000000     .ccc"...........
 8001ed9:	36000000 36367f36 36367f36 00000000     ...66.666.66....
 8001ee9:	633e0c0c 033e6061 3e634303 00000c0c     ..>ca`>..Cc>....
 8001ef9:	00000000 06636100 6333180c 00000000     .....ac...3c....
 8001f09:	1c000000 3b1c3636 3b66666e 00000000     ....66.;nff;....
 8001f19:	30303000 00000060 00000000 00000000     .000`...........
 8001f29:	180c0000 30303018 0c181830 00000000     .....0000.......
 8001f39:	0c180000 0606060c 180c0c06 00000000     ................
 8001f49:	00000000 ff3c6642 0042663c 00000000     ....Bf<.<fB.....
 8001f59:	00000000 ff181818 00181818 00000000     ................
	...
 8001f71:	18180000 00003018 00000000 ff000000     .....0..........
	...
 8001f91:	18180000 00000000 03010000 381c0e07     ...............8
 8001fa1:	80c0e070 00000000 633e0000 6b6b6363     p.........>ccckk
 8001fb1:	3e636363 00000000 1c0c0000 0c0c0c3c     ccc>........<...
 8001fc1:	3f0c0c0c 00000000 633e0000 180c0603     ...?......>c....
 8001fd1:	7f636130 00000000 633e0000 031e0303     0ac.......>c....
 8001fe1:	3e630303 00000000 0e060000 6666361e     ..c>.........6ff
 8001ff1:	0f06067f 00000000 607f0000 037e6060     ...........```~.
 8002001:	3e736303 00000000 301c0000 637e6060     .cs>.......0``~c
 8002011:	3e636363 00000000 637f0000 0c060603     ccc>.......c....
 8002021:	1818180c 00000000 633e0000 633e6363     ..........>ccc>c
 8002031:	3e636363 00000000 633e0000 3f636363     ccc>......>cccc?
 8002041:	3c060303 00000000 00000000 00181800     ...<............
 8002051:	18180000 00000000 00000000 00181800     ................
 8002061:	18180000 00003018 06000000 6030180c     .....0........0`
 8002071:	060c1830 00000000 00000000 007e0000     0.............~.
 8002081:	00007e00 00000000 60000000 060c1830     .~.........`0...
 8002091:	6030180c 00000000 633e0000 0c0c0663     ..0`......>cc...
 80020a1:	0c0c000c 00000000 633e0000 6b6b6f63     ..........>ccokk
 80020b1:	3e60606e 00000000 1c080000 63636336     n``>........6ccc
 80020c1:	6363637f 00000000 337e0000 333e3333     .ccc......~333>3
 80020d1:	7e333333 00000000 331e0000 60606061     333~.......3a```
 80020e1:	1e336160 00000000 367c0000 33333333     `a3.......|63333
 80020f1:	7c363333 00000000 337f0000 343c3431     336|.......314<4
 8002101:	7f333130 00000000 337f0000 343c3431     013........314<4
 8002111:	78303030 00000000 331e0000 6f606061     000x.......3a``o
 8002121:	1d376363 00000000 63630000 637f6363     cc7.......cccc.c
 8002131:	63636363 00000000 183c0000 18181818     cccc......<.....
 8002141:	3c181818 00000000 060f0000 06060606     ...<............
 8002151:	3c666606 00000000 33730000 363c3636     .ff<......s366<6
 8002161:	73333336 00000000 30780000 30303030     633s......x00000
 8002171:	7f333130 00000000 77630000 63636b7f     013.......cw.kcc
 8002181:	63636363 00000000 63630000 6f7f7b73     cccc......ccs{.o
 8002191:	63636367 00000000 361c0000 63636363     gccc.......6cccc
 80021a1:	1c366363 00000000 337e0000 303e3333     cc6.......~333>0
 80021b1:	78303030 00000000 633e0000 63636363     000x......>ccccc
 80021c1:	3e6f6b63 00000706 337e0000 363e3333     cko>......~333>6
 80021d1:	73333336 00000000 633e0000 061c3063     633s......>cc0..
 80021e1:	3e636303 00000000 dbff0000 18181899     .cc>............
 80021f1:	3c181818 00000000 63630000 63636363     ...<......cccccc
 8002201:	3e636363 00000000 63630000 63636363     ccc>......cccccc
 8002211:	081c3663 00000000 63630000 6b636363     c6........ccccck
 8002221:	36367f6b 00000000 c3c30000 18183c66     k.66........f<..
 8002231:	c3c3663c 00000000 c3c30000 183c66c3     <f...........f<.
 8002241:	3c181818 00000000 637f0000 180c0643     ...<.......cC...
 8002251:	7f636130 00000000 303c0000 30303030     0ac.......<00000
 8002261:	3c303030 00000000 c0800000 1c3870e0     000<.........p8.
 8002271:	0103070e 00000000 0c3c0000 0c0c0c0c     ..........<.....
 8002281:	3c0c0c0c 00000000 63361c08 00000000     ...<......6c....
	...
 80022a5:	000000ff 000c1818 00000000 00000000     ................
	...
 80022bd:	06463c00 3b66663e 00000000 30700000     .<F.>ff;......p0
 80022cd:	33363c30 6e333333 00000000 00000000     0<63333n........
 80022dd:	60633e00 3e636060 00000000 060e0000     .>c```c>........
 80022ed:	66361e06 3b666666 00000000 00000000     ..6ffff;........
 80022fd:	63633e00 3e63607e 00000000 361c0000     .>cc~`c>.......6
 800230d:	307c3032 78303030 00000000 00000000     20|0000x........
 800231d:	66663b00 063e6666 00003c66 30700000     .;ffff>.f<....p0
 800232d:	333b3630 73333333 00000000 0c0c0000     06;3333s........
 800233d:	0c0c1c00 1e0c0c0c 00000000 06060000     ................
 800234d:	06060e00 66060606 00003c66 30700000     .......ff<....p0
 800235d:	36333330 7333363c 00000000 0c1c0000     0336<63s........
 800236d:	0c0c0c0c 1e0c0c0c 00000000 00000000     ................
 800237d:	6b7f6e00 6b6b6b6b 00000000 00000000     .n.kkkkk........
 800238d:	33336e00 33333333 00000000 00000000     .n333333........
 800239d:	63633e00 3e636363 00000000 00000000     .>ccccc>........
 80023ad:	33336e00 303e3333 00007830 00000000     .n3333>00x......
 80023bd:	66663b00 063e6666 00000f06 00000000     .;ffff>.........
 80023cd:	333b6e00 78303030 00000000 00000000     .n;3000x........
 80023dd:	38633e00 3e63030e 00000000 18080000     .>c8..c>........
 80023ed:	18187e18 0e1b1818 00000000 00000000     .~..............
 80023fd:	66666600 3b666666 00000000 00000000     .ffffff;........
 800240d:	36636300 081c1c36 00000000 00000000     .cc66...........
 800241d:	63636300 367f6b6b 00000000 00000000     .ccckk.6........
 800242d:	1c366300 63361c1c 00000000 00000000     .c6...6c........
 800243d:	63636300 033f6363 00003c06 00000000     .ccccc?..<......
 800244d:	0c667f00 7f633018 00000000 180e0000     ..f..0c.........
 800245d:	18701818 0e181818 00000000 18180000     ..p.............
 800246d:	00181818 18181818 00000018 18700000     ..............p.
 800247d:	180e1818 70181818 00000000 6e3b0000     .......p......;n
	...
 8002499:	d8d87000 00000070 00000000 00000000     .p..p...........
 80024a9:	3a207525 5b000a20 25206925 69252069     %u : ..[%i %i %i
 80024b9:	0a00205d 636c6577 20656d6f 53206f74     ] ..welcome to S
 80024c9:	68757a75 20534f61 205e5f5e 2e322e32     uzuhaOS ^_^ 2.2.
 80024d9:	55420a30 20444c49 2072614d 32203332     0.BUILD Mar 23 2
 80024e9:	20363130 333a3032 32313a32 6f62000a     016 20:32:12..bo
 80024f9:	6e69746f 72662067 25206d6f 72000a75     oting from %u..r
 8002509:	73206d61 74726174 20752520 6172000a     am start %u ..ra
 8002519:	6973206d 2520657a 000a2075 206d6172     m size %u ..ram 
 8002529:	65657266 20752520 6568000a 73207061     free %u ..heap s
 8002539:	74726174 20752520 0a0a000a 00000000              tart %u .......

08002548 <__EH_FRAME_BEGIN__>:
 8002548:	00000000                                ....
