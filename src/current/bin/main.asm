
bin/main.elf:     file format elf32-littlearm


Disassembly of section .text:

080000c0 <mem_info_print>:
 80000c0:	b538      	push	{r3, r4, r5, lr}
 80000c2:	490e      	ldr	r1, [pc, #56]	; (80000fc <mem_info_print+0x3c>)
 80000c4:	480e      	ldr	r0, [pc, #56]	; (8000100 <mem_info_print+0x40>)
 80000c6:	f000 f97a 	bl	80003be <printf_>
 80000ca:	4c0e      	ldr	r4, [pc, #56]	; (8000104 <mem_info_print+0x44>)
 80000cc:	480e      	ldr	r0, [pc, #56]	; (8000108 <mem_info_print+0x48>)
 80000ce:	1c21      	adds	r1, r4, #0
 80000d0:	f000 f975 	bl	80003be <printf_>
 80000d4:	4d0d      	ldr	r5, [pc, #52]	; (800010c <mem_info_print+0x4c>)
 80000d6:	480e      	ldr	r0, [pc, #56]	; (8000110 <mem_info_print+0x50>)
 80000d8:	1b2d      	subs	r5, r5, r4
 80000da:	1c29      	adds	r1, r5, #0
 80000dc:	f000 f96f 	bl	80003be <printf_>
 80000e0:	490c      	ldr	r1, [pc, #48]	; (8000114 <mem_info_print+0x54>)
 80000e2:	480d      	ldr	r0, [pc, #52]	; (8000118 <mem_info_print+0x58>)
 80000e4:	1a64      	subs	r4, r4, r1
 80000e6:	1929      	adds	r1, r5, r4
 80000e8:	f000 f969 	bl	80003be <printf_>
 80000ec:	490b      	ldr	r1, [pc, #44]	; (800011c <mem_info_print+0x5c>)
 80000ee:	480c      	ldr	r0, [pc, #48]	; (8000120 <mem_info_print+0x60>)
 80000f0:	f000 f965 	bl	80003be <printf_>
 80000f4:	480b      	ldr	r0, [pc, #44]	; (8000124 <mem_info_print+0x64>)
 80000f6:	f000 f962 	bl	80003be <printf_>
 80000fa:	bd38      	pop	{r3, r4, r5, pc}
 80000fc:	08001174 	.word	0x08001174
 8000100:	0800118c 	.word	0x0800118c
 8000104:	20000000 	.word	0x20000000
 8000108:	0800119d 	.word	0x0800119d
 800010c:	20002000 	.word	0x20002000
 8000110:	080011ac 	.word	0x080011ac
 8000114:	20000168 	.word	0x20000168
 8000118:	080011ba 	.word	0x080011ba
 800011c:	20000168 	.word	0x20000168
 8000120:	080011c8 	.word	0x080011c8
 8000124:	080011d8 	.word	0x080011d8

08000128 <main>:
 8000128:	b508      	push	{r3, lr}
 800012a:	f000 fa47 	bl	80005bc <lib_low_level_init>
 800012e:	f000 f8dd 	bl	80002ec <lib_os_init>
 8000132:	f7ff ffc5 	bl	80000c0 <mem_info_print>
 8000136:	2008      	movs	r0, #8
 8000138:	f000 fadc 	bl	80006f4 <led_on>
 800013c:	e7fb      	b.n	8000136 <main+0xe>
	...

08000140 <thread_ending>:
 8000140:	b672      	cpsid	i
 8000142:	4b05      	ldr	r3, [pc, #20]	; (8000158 <thread_ending+0x18>)
 8000144:	220c      	movs	r2, #12
 8000146:	681b      	ldr	r3, [r3, #0]
 8000148:	4353      	muls	r3, r2
 800014a:	4a04      	ldr	r2, [pc, #16]	; (800015c <thread_ending+0x1c>)
 800014c:	18d3      	adds	r3, r2, r3
 800014e:	2200      	movs	r2, #0
 8000150:	605a      	str	r2, [r3, #4]
 8000152:	b662      	cpsie	i
 8000154:	46c0      	nop			; (mov r8, r8)
 8000156:	e7fd      	b.n	8000154 <thread_ending+0x14>
 8000158:	20000068 	.word	0x20000068
 800015c:	20000008 	.word	0x20000008

08000160 <null_thread>:
 8000160:	b508      	push	{r3, lr}
 8000162:	f000 fa65 	bl	8000630 <sleep>
 8000166:	e7fc      	b.n	8000162 <null_thread+0x2>

08000168 <scheduler>:
 8000168:	b5f0      	push	{r4, r5, r6, r7, lr}
 800016a:	2100      	movs	r1, #0
 800016c:	1c0a      	adds	r2, r1, #0
 800016e:	200c      	movs	r0, #12
 8000170:	1c05      	adds	r5, r0, #0
 8000172:	4355      	muls	r5, r2
 8000174:	4b14      	ldr	r3, [pc, #80]	; (80001c8 <scheduler+0x60>)
 8000176:	195e      	adds	r6, r3, r5
 8000178:	6874      	ldr	r4, [r6, #4]
 800017a:	46a4      	mov	ip, r4
 800017c:	4667      	mov	r7, ip
 800017e:	1c1c      	adds	r4, r3, #0
 8000180:	07bf      	lsls	r7, r7, #30
 8000182:	d40a      	bmi.n	800019a <scheduler+0x32>
 8000184:	6876      	ldr	r6, [r6, #4]
 8000186:	07f7      	lsls	r7, r6, #31
 8000188:	d507      	bpl.n	800019a <scheduler+0x32>
 800018a:	4348      	muls	r0, r1
 800018c:	595d      	ldr	r5, [r3, r5]
 800018e:	5818      	ldr	r0, [r3, r0]
 8000190:	b2ad      	uxth	r5, r5
 8000192:	b280      	uxth	r0, r0
 8000194:	4285      	cmp	r5, r0
 8000196:	d200      	bcs.n	800019a <scheduler+0x32>
 8000198:	1c11      	adds	r1, r2, #0
 800019a:	200c      	movs	r0, #12
 800019c:	4350      	muls	r0, r2
 800019e:	581d      	ldr	r5, [r3, r0]
 80001a0:	b2ad      	uxth	r5, r5
 80001a2:	2d00      	cmp	r5, #0
 80001a4:	d004      	beq.n	80001b0 <scheduler+0x48>
 80001a6:	581d      	ldr	r5, [r3, r0]
 80001a8:	b2ad      	uxth	r5, r5
 80001aa:	3d01      	subs	r5, #1
 80001ac:	b2ad      	uxth	r5, r5
 80001ae:	521d      	strh	r5, [r3, r0]
 80001b0:	3201      	adds	r2, #1
 80001b2:	2a08      	cmp	r2, #8
 80001b4:	d1db      	bne.n	800016e <scheduler+0x6>
 80001b6:	230c      	movs	r3, #12
 80001b8:	434b      	muls	r3, r1
 80001ba:	58e2      	ldr	r2, [r4, r3]
 80001bc:	0c12      	lsrs	r2, r2, #16
 80001be:	52e2      	strh	r2, [r4, r3]
 80001c0:	4b02      	ldr	r3, [pc, #8]	; (80001cc <scheduler+0x64>)
 80001c2:	6019      	str	r1, [r3, #0]
 80001c4:	bdf0      	pop	{r4, r5, r6, r7, pc}
 80001c6:	46c0      	nop			; (mov r8, r8)
 80001c8:	20000008 	.word	0x20000008
 80001cc:	20000068 	.word	0x20000068

080001d0 <SysTick_Handler>:
 80001d0:	b4f0      	push	{r4, r5, r6, r7}
 80001d2:	4644      	mov	r4, r8
 80001d4:	464d      	mov	r5, r9
 80001d6:	4656      	mov	r6, sl
 80001d8:	465f      	mov	r7, fp
 80001da:	b4f0      	push	{r4, r5, r6, r7}
 80001dc:	f000 fa24 	bl	8000628 <__get_MSP>
 80001e0:	4c0f      	ldr	r4, [pc, #60]	; (8000220 <SysTick_Handler+0x50>)
 80001e2:	4d10      	ldr	r5, [pc, #64]	; (8000224 <SysTick_Handler+0x54>)
 80001e4:	6823      	ldr	r3, [r4, #0]
 80001e6:	3301      	adds	r3, #1
 80001e8:	d005      	beq.n	80001f6 <SysTick_Handler+0x26>
 80001ea:	6823      	ldr	r3, [r4, #0]
 80001ec:	220c      	movs	r2, #12
 80001ee:	4353      	muls	r3, r2
 80001f0:	18eb      	adds	r3, r5, r3
 80001f2:	6098      	str	r0, [r3, #8]
 80001f4:	e001      	b.n	80001fa <SysTick_Handler+0x2a>
 80001f6:	2300      	movs	r3, #0
 80001f8:	6023      	str	r3, [r4, #0]
 80001fa:	f7ff ffb5 	bl	8000168 <scheduler>
 80001fe:	6823      	ldr	r3, [r4, #0]
 8000200:	220c      	movs	r2, #12
 8000202:	4353      	muls	r3, r2
 8000204:	18ed      	adds	r5, r5, r3
 8000206:	2307      	movs	r3, #7
 8000208:	68aa      	ldr	r2, [r5, #8]
 800020a:	425b      	negs	r3, r3
 800020c:	469e      	mov	lr, r3
 800020e:	f382 8808 	msr	MSP, r2
 8000212:	bcf0      	pop	{r4, r5, r6, r7}
 8000214:	46a0      	mov	r8, r4
 8000216:	46a9      	mov	r9, r5
 8000218:	46b2      	mov	sl, r6
 800021a:	46bb      	mov	fp, r7
 800021c:	bcf0      	pop	{r4, r5, r6, r7}
 800021e:	4770      	bx	lr
 8000220:	20000068 	.word	0x20000068
 8000224:	20000008 	.word	0x20000008

08000228 <create_thread>:
 8000228:	b5f0      	push	{r4, r5, r6, r7, lr}
 800022a:	b085      	sub	sp, #20
 800022c:	9003      	str	r0, [sp, #12]
 800022e:	481b      	ldr	r0, [pc, #108]	; (800029c <create_thread+0x74>)
 8000230:	0892      	lsrs	r2, r2, #2
 8000232:	1812      	adds	r2, r2, r0
 8000234:	0092      	lsls	r2, r2, #2
 8000236:	1888      	adds	r0, r1, r2
 8000238:	1c17      	adds	r7, r2, #0
 800023a:	9002      	str	r0, [sp, #8]
 800023c:	1c10      	adds	r0, r2, #0
 800023e:	323c      	adds	r2, #60	; 0x3c
 8000240:	188a      	adds	r2, r1, r2
 8000242:	3034      	adds	r0, #52	; 0x34
 8000244:	3738      	adds	r7, #56	; 0x38
 8000246:	9201      	str	r2, [sp, #4]
 8000248:	180e      	adds	r6, r1, r0
 800024a:	19cf      	adds	r7, r1, r7
 800024c:	2200      	movs	r2, #0
 800024e:	b672      	cpsid	i
 8000250:	250c      	movs	r5, #12
 8000252:	4355      	muls	r5, r2
 8000254:	4c12      	ldr	r4, [pc, #72]	; (80002a0 <create_thread+0x78>)
 8000256:	2008      	movs	r0, #8
 8000258:	1965      	adds	r5, r4, r5
 800025a:	6869      	ldr	r1, [r5, #4]
 800025c:	07c9      	lsls	r1, r1, #31
 800025e:	d415      	bmi.n	800028c <create_thread+0x64>
 8000260:	9902      	ldr	r1, [sp, #8]
 8000262:	60a9      	str	r1, [r5, #8]
 8000264:	4d0f      	ldr	r5, [pc, #60]	; (80002a4 <create_thread+0x7c>)
 8000266:	9903      	ldr	r1, [sp, #12]
 8000268:	6035      	str	r5, [r6, #0]
 800026a:	6039      	str	r1, [r7, #0]
 800026c:	2584      	movs	r5, #132	; 0x84
 800026e:	9901      	ldr	r1, [sp, #4]
 8000270:	05ad      	lsls	r5, r5, #22
 8000272:	600d      	str	r5, [r1, #0]
 8000274:	2b07      	cmp	r3, #7
 8000276:	d800      	bhi.n	800027a <create_thread+0x52>
 8000278:	1c03      	adds	r3, r0, #0
 800027a:	200c      	movs	r0, #12
 800027c:	4350      	muls	r0, r2
 800027e:	4908      	ldr	r1, [pc, #32]	; (80002a0 <create_thread+0x78>)
 8000280:	180d      	adds	r5, r1, r0
 8000282:	806b      	strh	r3, [r5, #2]
 8000284:	5223      	strh	r3, [r4, r0]
 8000286:	2001      	movs	r0, #1
 8000288:	6068      	str	r0, [r5, #4]
 800028a:	1c10      	adds	r0, r2, #0
 800028c:	b662      	cpsie	i
 800028e:	3201      	adds	r2, #1
 8000290:	2a08      	cmp	r2, #8
 8000292:	d001      	beq.n	8000298 <create_thread+0x70>
 8000294:	2808      	cmp	r0, #8
 8000296:	d0da      	beq.n	800024e <create_thread+0x26>
 8000298:	b005      	add	sp, #20
 800029a:	bdf0      	pop	{r4, r5, r6, r7, pc}
 800029c:	3ffffff0 	.word	0x3ffffff0
 80002a0:	20000008 	.word	0x20000008
 80002a4:	08000141 	.word	0x08000141

080002a8 <kernel_init>:
 80002a8:	b510      	push	{r4, lr}
 80002aa:	2300      	movs	r3, #0
 80002ac:	210c      	movs	r1, #12
 80002ae:	4359      	muls	r1, r3
 80002b0:	4a0a      	ldr	r2, [pc, #40]	; (80002dc <kernel_init+0x34>)
 80002b2:	2000      	movs	r0, #0
 80002b4:	1854      	adds	r4, r2, r1
 80002b6:	6060      	str	r0, [r4, #4]
 80002b8:	3301      	adds	r3, #1
 80002ba:	2008      	movs	r0, #8
 80002bc:	8060      	strh	r0, [r4, #2]
 80002be:	5288      	strh	r0, [r1, r2]
 80002c0:	4283      	cmp	r3, r0
 80002c2:	d1f3      	bne.n	80002ac <kernel_init+0x4>
 80002c4:	4b06      	ldr	r3, [pc, #24]	; (80002e0 <kernel_init+0x38>)
 80002c6:	2201      	movs	r2, #1
 80002c8:	4252      	negs	r2, r2
 80002ca:	601a      	str	r2, [r3, #0]
 80002cc:	4905      	ldr	r1, [pc, #20]	; (80002e4 <kernel_init+0x3c>)
 80002ce:	2280      	movs	r2, #128	; 0x80
 80002d0:	23ff      	movs	r3, #255	; 0xff
 80002d2:	4805      	ldr	r0, [pc, #20]	; (80002e8 <kernel_init+0x40>)
 80002d4:	f7ff ffa8 	bl	8000228 <create_thread>
 80002d8:	bd10      	pop	{r4, pc}
 80002da:	46c0      	nop			; (mov r8, r8)
 80002dc:	20000008 	.word	0x20000008
 80002e0:	20000068 	.word	0x20000068
 80002e4:	2000006c 	.word	0x2000006c
 80002e8:	08000161 	.word	0x08000161

080002ec <lib_os_init>:
 80002ec:	b508      	push	{r3, lr}
 80002ee:	f7ff ffdb 	bl	80002a8 <kernel_init>
 80002f2:	f000 f8c1 	bl	8000478 <messages_init>
 80002f6:	f000 f8a9 	bl	800044c <stdio_init>
 80002fa:	bd08      	pop	{r3, pc}

080002fc <puts_>:
 80002fc:	b510      	push	{r4, lr}
 80002fe:	1c04      	adds	r4, r0, #0
 8000300:	3401      	adds	r4, #1
 8000302:	1e63      	subs	r3, r4, #1
 8000304:	7818      	ldrb	r0, [r3, #0]
 8000306:	2800      	cmp	r0, #0
 8000308:	d002      	beq.n	8000310 <puts_+0x14>
 800030a:	f000 f8cf 	bl	80004ac <uart_write>
 800030e:	e7f7      	b.n	8000300 <puts_+0x4>
 8000310:	bd10      	pop	{r4, pc}

08000312 <puti_>:
 8000312:	b5f0      	push	{r4, r5, r6, r7, lr}
 8000314:	2300      	movs	r3, #0
 8000316:	b085      	sub	sp, #20
 8000318:	1c04      	adds	r4, r0, #0
 800031a:	1c1f      	adds	r7, r3, #0
 800031c:	4298      	cmp	r0, r3
 800031e:	da01      	bge.n	8000324 <puti_+0x12>
 8000320:	4244      	negs	r4, r0
 8000322:	2701      	movs	r7, #1
 8000324:	ae01      	add	r6, sp, #4
 8000326:	72f3      	strb	r3, [r6, #11]
 8000328:	250a      	movs	r5, #10
 800032a:	1c20      	adds	r0, r4, #0
 800032c:	210a      	movs	r1, #10
 800032e:	f000 fec7 	bl	80010c0 <__aeabi_idivmod>
 8000332:	3130      	adds	r1, #48	; 0x30
 8000334:	5571      	strb	r1, [r6, r5]
 8000336:	1c20      	adds	r0, r4, #0
 8000338:	210a      	movs	r1, #10
 800033a:	f000 fe6b 	bl	8001014 <__aeabi_idiv>
 800033e:	1e6b      	subs	r3, r5, #1
 8000340:	1e04      	subs	r4, r0, #0
 8000342:	d001      	beq.n	8000348 <puti_+0x36>
 8000344:	1c1d      	adds	r5, r3, #0
 8000346:	e7f0      	b.n	800032a <puti_+0x18>
 8000348:	2f00      	cmp	r7, #0
 800034a:	d002      	beq.n	8000352 <puti_+0x40>
 800034c:	222d      	movs	r2, #45	; 0x2d
 800034e:	54f2      	strb	r2, [r6, r3]
 8000350:	1c1d      	adds	r5, r3, #0
 8000352:	1970      	adds	r0, r6, r5
 8000354:	f7ff ffd2 	bl	80002fc <puts_>
 8000358:	b005      	add	sp, #20
 800035a:	bdf0      	pop	{r4, r5, r6, r7, pc}

0800035c <putui_>:
 800035c:	b57f      	push	{r0, r1, r2, r3, r4, r5, r6, lr}
 800035e:	2300      	movs	r3, #0
 8000360:	ae01      	add	r6, sp, #4
 8000362:	1c05      	adds	r5, r0, #0
 8000364:	72f3      	strb	r3, [r6, #11]
 8000366:	240a      	movs	r4, #10
 8000368:	1c28      	adds	r0, r5, #0
 800036a:	210a      	movs	r1, #10
 800036c:	f000 fe48 	bl	8001000 <__aeabi_uidivmod>
 8000370:	3130      	adds	r1, #48	; 0x30
 8000372:	5531      	strb	r1, [r6, r4]
 8000374:	1c28      	adds	r0, r5, #0
 8000376:	210a      	movs	r1, #10
 8000378:	f000 fdfe 	bl	8000f78 <__aeabi_uidiv>
 800037c:	1e63      	subs	r3, r4, #1
 800037e:	1e05      	subs	r5, r0, #0
 8000380:	d001      	beq.n	8000386 <putui_+0x2a>
 8000382:	1c1c      	adds	r4, r3, #0
 8000384:	e7f0      	b.n	8000368 <putui_+0xc>
 8000386:	1930      	adds	r0, r6, r4
 8000388:	f7ff ffb8 	bl	80002fc <puts_>
 800038c:	bd7f      	pop	{r0, r1, r2, r3, r4, r5, r6, pc}

0800038e <putx_>:
 800038e:	b51f      	push	{r0, r1, r2, r3, r4, lr}
 8000390:	2300      	movs	r3, #0
 8000392:	aa01      	add	r2, sp, #4
 8000394:	72d3      	strb	r3, [r2, #11]
 8000396:	230a      	movs	r3, #10
 8000398:	210f      	movs	r1, #15
 800039a:	4001      	ands	r1, r0
 800039c:	2909      	cmp	r1, #9
 800039e:	d801      	bhi.n	80003a4 <putx_+0x16>
 80003a0:	3130      	adds	r1, #48	; 0x30
 80003a2:	e000      	b.n	80003a6 <putx_+0x18>
 80003a4:	3157      	adds	r1, #87	; 0x57
 80003a6:	54d1      	strb	r1, [r2, r3]
 80003a8:	0900      	lsrs	r0, r0, #4
 80003aa:	1e59      	subs	r1, r3, #1
 80003ac:	2800      	cmp	r0, #0
 80003ae:	d001      	beq.n	80003b4 <putx_+0x26>
 80003b0:	1c0b      	adds	r3, r1, #0
 80003b2:	e7f1      	b.n	8000398 <putx_+0xa>
 80003b4:	18d0      	adds	r0, r2, r3
 80003b6:	f7ff ffa1 	bl	80002fc <puts_>
 80003ba:	b005      	add	sp, #20
 80003bc:	bd00      	pop	{pc}

080003be <printf_>:
 80003be:	b40f      	push	{r0, r1, r2, r3}
 80003c0:	b537      	push	{r0, r1, r2, r4, r5, lr}
 80003c2:	ab06      	add	r3, sp, #24
 80003c4:	cb20      	ldmia	r3!, {r5}
 80003c6:	2400      	movs	r4, #0
 80003c8:	9301      	str	r3, [sp, #4]
 80003ca:	5d28      	ldrb	r0, [r5, r4]
 80003cc:	2800      	cmp	r0, #0
 80003ce:	d039      	beq.n	8000444 <printf_+0x86>
 80003d0:	2825      	cmp	r0, #37	; 0x25
 80003d2:	d003      	beq.n	80003dc <printf_+0x1e>
 80003d4:	f000 f86a 	bl	80004ac <uart_write>
 80003d8:	3401      	adds	r4, #1
 80003da:	e7f6      	b.n	80003ca <printf_+0xc>
 80003dc:	192b      	adds	r3, r5, r4
 80003de:	7858      	ldrb	r0, [r3, #1]
 80003e0:	2869      	cmp	r0, #105	; 0x69
 80003e2:	d016      	beq.n	8000412 <printf_+0x54>
 80003e4:	d808      	bhi.n	80003f8 <printf_+0x3a>
 80003e6:	2825      	cmp	r0, #37	; 0x25
 80003e8:	d028      	beq.n	800043c <printf_+0x7e>
 80003ea:	2863      	cmp	r0, #99	; 0x63
 80003ec:	d128      	bne.n	8000440 <printf_+0x82>
 80003ee:	9b01      	ldr	r3, [sp, #4]
 80003f0:	1d1a      	adds	r2, r3, #4
 80003f2:	9201      	str	r2, [sp, #4]
 80003f4:	7818      	ldrb	r0, [r3, #0]
 80003f6:	e021      	b.n	800043c <printf_+0x7e>
 80003f8:	2875      	cmp	r0, #117	; 0x75
 80003fa:	d011      	beq.n	8000420 <printf_+0x62>
 80003fc:	2878      	cmp	r0, #120	; 0x78
 80003fe:	d016      	beq.n	800042e <printf_+0x70>
 8000400:	2873      	cmp	r0, #115	; 0x73
 8000402:	d11d      	bne.n	8000440 <printf_+0x82>
 8000404:	9b01      	ldr	r3, [sp, #4]
 8000406:	1d1a      	adds	r2, r3, #4
 8000408:	6818      	ldr	r0, [r3, #0]
 800040a:	9201      	str	r2, [sp, #4]
 800040c:	f7ff ff76 	bl	80002fc <puts_>
 8000410:	e016      	b.n	8000440 <printf_+0x82>
 8000412:	9b01      	ldr	r3, [sp, #4]
 8000414:	1d1a      	adds	r2, r3, #4
 8000416:	6818      	ldr	r0, [r3, #0]
 8000418:	9201      	str	r2, [sp, #4]
 800041a:	f7ff ff7a 	bl	8000312 <puti_>
 800041e:	e00f      	b.n	8000440 <printf_+0x82>
 8000420:	9b01      	ldr	r3, [sp, #4]
 8000422:	1d1a      	adds	r2, r3, #4
 8000424:	6818      	ldr	r0, [r3, #0]
 8000426:	9201      	str	r2, [sp, #4]
 8000428:	f7ff ff98 	bl	800035c <putui_>
 800042c:	e008      	b.n	8000440 <printf_+0x82>
 800042e:	9b01      	ldr	r3, [sp, #4]
 8000430:	1d1a      	adds	r2, r3, #4
 8000432:	6818      	ldr	r0, [r3, #0]
 8000434:	9201      	str	r2, [sp, #4]
 8000436:	f7ff ffaa 	bl	800038e <putx_>
 800043a:	e001      	b.n	8000440 <printf_+0x82>
 800043c:	f000 f836 	bl	80004ac <uart_write>
 8000440:	3402      	adds	r4, #2
 8000442:	e7c2      	b.n	80003ca <printf_+0xc>
 8000444:	bc37      	pop	{r0, r1, r2, r4, r5}
 8000446:	bc08      	pop	{r3}
 8000448:	b004      	add	sp, #16
 800044a:	4718      	bx	r3

0800044c <stdio_init>:
 800044c:	b510      	push	{r4, lr}
 800044e:	2408      	movs	r4, #8
 8000450:	2020      	movs	r0, #32
 8000452:	3c01      	subs	r4, #1
 8000454:	f000 f82a 	bl	80004ac <uart_write>
 8000458:	2c00      	cmp	r4, #0
 800045a:	d1f9      	bne.n	8000450 <stdio_init+0x4>
 800045c:	2420      	movs	r4, #32
 800045e:	200a      	movs	r0, #10
 8000460:	3c01      	subs	r4, #1
 8000462:	f000 f823 	bl	80004ac <uart_write>
 8000466:	2c00      	cmp	r4, #0
 8000468:	d1f9      	bne.n	800045e <stdio_init+0x12>
 800046a:	4802      	ldr	r0, [pc, #8]	; (8000474 <stdio_init+0x28>)
 800046c:	f7ff ffa7 	bl	80003be <printf_>
 8000470:	bd10      	pop	{r4, pc}
 8000472:	46c0      	nop			; (mov r8, r8)
 8000474:	080011db 	.word	0x080011db

08000478 <messages_init>:
 8000478:	b510      	push	{r4, lr}
 800047a:	2200      	movs	r2, #0
 800047c:	4909      	ldr	r1, [pc, #36]	; (80004a4 <messages_init+0x2c>)
 800047e:	0090      	lsls	r0, r2, #2
 8000480:	2300      	movs	r3, #0
 8000482:	3201      	adds	r2, #1
 8000484:	5043      	str	r3, [r0, r1]
 8000486:	2a08      	cmp	r2, #8
 8000488:	d1f8      	bne.n	800047c <messages_init+0x4>
 800048a:	4807      	ldr	r0, [pc, #28]	; (80004a8 <messages_init+0x30>)
 800048c:	011c      	lsls	r4, r3, #4
 800048e:	2200      	movs	r2, #0
 8000490:	1901      	adds	r1, r0, r4
 8000492:	3301      	adds	r3, #1
 8000494:	604a      	str	r2, [r1, #4]
 8000496:	5022      	str	r2, [r4, r0]
 8000498:	60ca      	str	r2, [r1, #12]
 800049a:	608a      	str	r2, [r1, #8]
 800049c:	2b04      	cmp	r3, #4
 800049e:	d1f4      	bne.n	800048a <messages_init+0x12>
 80004a0:	bd10      	pop	{r4, pc}
 80004a2:	46c0      	nop			; (mov r8, r8)
 80004a4:	200000ec 	.word	0x200000ec
 80004a8:	2000010c 	.word	0x2000010c

080004ac <uart_write>:
 80004ac:	4b03      	ldr	r3, [pc, #12]	; (80004bc <uart_write+0x10>)
 80004ae:	6298      	str	r0, [r3, #40]	; 0x28
 80004b0:	69da      	ldr	r2, [r3, #28]
 80004b2:	0651      	lsls	r1, r2, #25
 80004b4:	d401      	bmi.n	80004ba <uart_write+0xe>
 80004b6:	46c0      	nop			; (mov r8, r8)
 80004b8:	e7fa      	b.n	80004b0 <uart_write+0x4>
 80004ba:	4770      	bx	lr
 80004bc:	40004400 	.word	0x40004400

080004c0 <uart_init>:
 80004c0:	4b1d      	ldr	r3, [pc, #116]	; (8000538 <uart_init+0x78>)
 80004c2:	b510      	push	{r4, lr}
 80004c4:	6ad9      	ldr	r1, [r3, #44]	; 0x2c
 80004c6:	2201      	movs	r2, #1
 80004c8:	4311      	orrs	r1, r2
 80004ca:	62d9      	str	r1, [r3, #44]	; 0x2c
 80004cc:	6ad9      	ldr	r1, [r3, #44]	; 0x2c
 80004ce:	b088      	sub	sp, #32
 80004d0:	4011      	ands	r1, r2
 80004d2:	9101      	str	r1, [sp, #4]
 80004d4:	9901      	ldr	r1, [sp, #4]
 80004d6:	6ad9      	ldr	r1, [r3, #44]	; 0x2c
 80004d8:	2404      	movs	r4, #4
 80004da:	4311      	orrs	r1, r2
 80004dc:	62d9      	str	r1, [r3, #44]	; 0x2c
 80004de:	6ad9      	ldr	r1, [r3, #44]	; 0x2c
 80004e0:	4011      	ands	r1, r2
 80004e2:	9102      	str	r1, [sp, #8]
 80004e4:	9902      	ldr	r1, [sp, #8]
 80004e6:	6b98      	ldr	r0, [r3, #56]	; 0x38
 80004e8:	2180      	movs	r1, #128	; 0x80
 80004ea:	0289      	lsls	r1, r1, #10
 80004ec:	4301      	orrs	r1, r0
 80004ee:	6399      	str	r1, [r3, #56]	; 0x38
 80004f0:	20a0      	movs	r0, #160	; 0xa0
 80004f2:	2302      	movs	r3, #2
 80004f4:	9304      	str	r3, [sp, #16]
 80004f6:	05c0      	lsls	r0, r0, #23
 80004f8:	2303      	movs	r3, #3
 80004fa:	a903      	add	r1, sp, #12
 80004fc:	9205      	str	r2, [sp, #20]
 80004fe:	9306      	str	r3, [sp, #24]
 8000500:	9403      	str	r4, [sp, #12]
 8000502:	9407      	str	r4, [sp, #28]
 8000504:	f000 fc32 	bl	8000d6c <HAL_GPIO_Init>
 8000508:	20a0      	movs	r0, #160	; 0xa0
 800050a:	2308      	movs	r3, #8
 800050c:	05c0      	lsls	r0, r0, #23
 800050e:	a903      	add	r1, sp, #12
 8000510:	9303      	str	r3, [sp, #12]
 8000512:	9407      	str	r4, [sp, #28]
 8000514:	f000 fc2a 	bl	8000d6c <HAL_GPIO_Init>
 8000518:	4b08      	ldr	r3, [pc, #32]	; (800053c <uart_init+0x7c>)
 800051a:	22d0      	movs	r2, #208	; 0xd0
 800051c:	60da      	str	r2, [r3, #12]
 800051e:	220d      	movs	r2, #13
 8000520:	601a      	str	r2, [r3, #0]
 8000522:	69d8      	ldr	r0, [r3, #28]
 8000524:	2140      	movs	r1, #64	; 0x40
 8000526:	4a05      	ldr	r2, [pc, #20]	; (800053c <uart_init+0x7c>)
 8000528:	4208      	tst	r0, r1
 800052a:	d0fa      	beq.n	8000522 <uart_init+0x62>
 800052c:	6a13      	ldr	r3, [r2, #32]
 800052e:	4319      	orrs	r1, r3
 8000530:	6211      	str	r1, [r2, #32]
 8000532:	b008      	add	sp, #32
 8000534:	bd10      	pop	{r4, pc}
 8000536:	46c0      	nop			; (mov r8, r8)
 8000538:	40021000 	.word	0x40021000
 800053c:	40004400 	.word	0x40004400

08000540 <SystemClock_Config>:
 8000540:	b500      	push	{lr}
 8000542:	b093      	sub	sp, #76	; 0x4c
 8000544:	2100      	movs	r1, #0
 8000546:	2214      	movs	r2, #20
 8000548:	4668      	mov	r0, sp
 800054a:	f000 fdc5 	bl	80010d8 <memset>
 800054e:	2100      	movs	r1, #0
 8000550:	2234      	movs	r2, #52	; 0x34
 8000552:	a805      	add	r0, sp, #20
 8000554:	f000 fdc0 	bl	80010d8 <memset>
 8000558:	2310      	movs	r3, #16
 800055a:	9305      	str	r3, [sp, #20]
 800055c:	2301      	movs	r3, #1
 800055e:	930b      	str	r3, [sp, #44]	; 0x2c
 8000560:	23a0      	movs	r3, #160	; 0xa0
 8000562:	021b      	lsls	r3, r3, #8
 8000564:	a805      	add	r0, sp, #20
 8000566:	930d      	str	r3, [sp, #52]	; 0x34
 8000568:	f000 f8f8 	bl	800075c <HAL_RCC_OscConfig>
 800056c:	1e01      	subs	r1, r0, #0
 800056e:	d000      	beq.n	8000572 <SystemClock_Config+0x32>
 8000570:	e7fe      	b.n	8000570 <SystemClock_Config+0x30>
 8000572:	230f      	movs	r3, #15
 8000574:	9001      	str	r0, [sp, #4]
 8000576:	9002      	str	r0, [sp, #8]
 8000578:	9003      	str	r0, [sp, #12]
 800057a:	9004      	str	r0, [sp, #16]
 800057c:	4668      	mov	r0, sp
 800057e:	9300      	str	r3, [sp, #0]
 8000580:	f000 faf2 	bl	8000b68 <HAL_RCC_ClockConfig>
 8000584:	2800      	cmp	r0, #0
 8000586:	d000      	beq.n	800058a <SystemClock_Config+0x4a>
 8000588:	e7fe      	b.n	8000588 <SystemClock_Config+0x48>
 800058a:	4b09      	ldr	r3, [pc, #36]	; (80005b0 <SystemClock_Config+0x70>)
 800058c:	2280      	movs	r2, #128	; 0x80
 800058e:	6b99      	ldr	r1, [r3, #56]	; 0x38
 8000590:	0552      	lsls	r2, r2, #21
 8000592:	430a      	orrs	r2, r1
 8000594:	639a      	str	r2, [r3, #56]	; 0x38
 8000596:	4a07      	ldr	r2, [pc, #28]	; (80005b4 <SystemClock_Config+0x74>)
 8000598:	21c0      	movs	r1, #192	; 0xc0
 800059a:	6810      	ldr	r0, [r2, #0]
 800059c:	0149      	lsls	r1, r1, #5
 800059e:	4301      	orrs	r1, r0
 80005a0:	6011      	str	r1, [r2, #0]
 80005a2:	6b99      	ldr	r1, [r3, #56]	; 0x38
 80005a4:	4a04      	ldr	r2, [pc, #16]	; (80005b8 <SystemClock_Config+0x78>)
 80005a6:	400a      	ands	r2, r1
 80005a8:	639a      	str	r2, [r3, #56]	; 0x38
 80005aa:	b013      	add	sp, #76	; 0x4c
 80005ac:	bd00      	pop	{pc}
 80005ae:	46c0      	nop			; (mov r8, r8)
 80005b0:	40021000 	.word	0x40021000
 80005b4:	40007000 	.word	0x40007000
 80005b8:	efffffff 	.word	0xefffffff

080005bc <lib_low_level_init>:
 80005bc:	b508      	push	{r3, lr}
 80005be:	f000 f8b7 	bl	8000730 <HAL_Init>
 80005c2:	f7ff ffbd 	bl	8000540 <SystemClock_Config>
 80005c6:	f000 f87b 	bl	80006c0 <gpio_init>
 80005ca:	f7ff ff79 	bl	80004c0 <uart_init>
 80005ce:	bd08      	pop	{r3, pc}

080005d0 <Default_Handler>:
 80005d0:	46c0      	nop			; (mov r8, r8)
 80005d2:	e7fd      	b.n	80005d0 <Default_Handler>

080005d4 <HardFault_Handler>:
 80005d4:	2008      	movs	r0, #8
 80005d6:	f000 f88d 	bl	80006f4 <led_on>
 80005da:	4b07      	ldr	r3, [pc, #28]	; (80005f8 <HardFault_Handler+0x24>)
 80005dc:	3b01      	subs	r3, #1
 80005de:	2b00      	cmp	r3, #0
 80005e0:	d001      	beq.n	80005e6 <HardFault_Handler+0x12>
 80005e2:	46c0      	nop			; (mov r8, r8)
 80005e4:	e7fa      	b.n	80005dc <HardFault_Handler+0x8>
 80005e6:	2008      	movs	r0, #8
 80005e8:	f000 f88a 	bl	8000700 <led_off>
 80005ec:	4b02      	ldr	r3, [pc, #8]	; (80005f8 <HardFault_Handler+0x24>)
 80005ee:	3b01      	subs	r3, #1
 80005f0:	2b00      	cmp	r3, #0
 80005f2:	d0ef      	beq.n	80005d4 <HardFault_Handler>
 80005f4:	46c0      	nop			; (mov r8, r8)
 80005f6:	e7fa      	b.n	80005ee <HardFault_Handler+0x1a>
 80005f8:	00989681 	.word	0x00989681

080005fc <_reset_init>:
 80005fc:	4a07      	ldr	r2, [pc, #28]	; (800061c <_reset_init+0x20>)
 80005fe:	4908      	ldr	r1, [pc, #32]	; (8000620 <_reset_init+0x24>)
 8000600:	2300      	movs	r3, #0
 8000602:	1a89      	subs	r1, r1, r2
 8000604:	1089      	asrs	r1, r1, #2
 8000606:	1c10      	adds	r0, r2, #0
 8000608:	428b      	cmp	r3, r1
 800060a:	d005      	beq.n	8000618 <_reset_init+0x1c>
 800060c:	4c05      	ldr	r4, [pc, #20]	; (8000624 <_reset_init+0x28>)
 800060e:	009a      	lsls	r2, r3, #2
 8000610:	58a4      	ldr	r4, [r4, r2]
 8000612:	3301      	adds	r3, #1
 8000614:	5084      	str	r4, [r0, r2]
 8000616:	e7f7      	b.n	8000608 <_reset_init+0xc>
 8000618:	f7ff fd86 	bl	8000128 <main>
 800061c:	20000000 	.word	0x20000000
 8000620:	20000004 	.word	0x20000004
 8000624:	0800120c 	.word	0x0800120c

08000628 <__get_MSP>:
 8000628:	f3ef 8008 	mrs	r0, MSP
 800062c:	1c00      	adds	r0, r0, #0
 800062e:	4770      	bx	lr

08000630 <sleep>:
 8000630:	4b08      	ldr	r3, [pc, #32]	; (8000654 <sleep+0x24>)
 8000632:	2104      	movs	r1, #4
 8000634:	691a      	ldr	r2, [r3, #16]
 8000636:	430a      	orrs	r2, r1
 8000638:	611a      	str	r2, [r3, #16]
 800063a:	4b07      	ldr	r3, [pc, #28]	; (8000658 <sleep+0x28>)
 800063c:	2203      	movs	r2, #3
 800063e:	6819      	ldr	r1, [r3, #0]
 8000640:	4391      	bics	r1, r2
 8000642:	2201      	movs	r2, #1
 8000644:	4311      	orrs	r1, r2
 8000646:	6019      	str	r1, [r3, #0]
 8000648:	6859      	ldr	r1, [r3, #4]
 800064a:	4391      	bics	r1, r2
 800064c:	6059      	str	r1, [r3, #4]
 800064e:	bf30      	wfi
 8000650:	4770      	bx	lr
 8000652:	46c0      	nop			; (mov r8, r8)
 8000654:	e000ed00 	.word	0xe000ed00
 8000658:	40007000 	.word	0x40007000

0800065c <RTC_IRQHandler>:
 800065c:	2200      	movs	r2, #0
 800065e:	4911      	ldr	r1, [pc, #68]	; (80006a4 <RTC_IRQHandler+0x48>)
 8000660:	0053      	lsls	r3, r2, #1
 8000662:	5a58      	ldrh	r0, [r3, r1]
 8000664:	2800      	cmp	r0, #0
 8000666:	d003      	beq.n	8000670 <RTC_IRQHandler+0x14>
 8000668:	5a58      	ldrh	r0, [r3, r1]
 800066a:	3801      	subs	r0, #1
 800066c:	b280      	uxth	r0, r0
 800066e:	e005      	b.n	800067c <RTC_IRQHandler+0x20>
 8000670:	480d      	ldr	r0, [pc, #52]	; (80006a8 <RTC_IRQHandler+0x4c>)
 8000672:	5a18      	ldrh	r0, [r3, r0]
 8000674:	b280      	uxth	r0, r0
 8000676:	5258      	strh	r0, [r3, r1]
 8000678:	490c      	ldr	r1, [pc, #48]	; (80006ac <RTC_IRQHandler+0x50>)
 800067a:	2001      	movs	r0, #1
 800067c:	3201      	adds	r2, #1
 800067e:	5258      	strh	r0, [r3, r1]
 8000680:	2a04      	cmp	r2, #4
 8000682:	d1ec      	bne.n	800065e <RTC_IRQHandler+0x2>
 8000684:	4b0a      	ldr	r3, [pc, #40]	; (80006b0 <RTC_IRQHandler+0x54>)
 8000686:	681a      	ldr	r2, [r3, #0]
 8000688:	320a      	adds	r2, #10
 800068a:	601a      	str	r2, [r3, #0]
 800068c:	4b09      	ldr	r3, [pc, #36]	; (80006b4 <RTC_IRQHandler+0x58>)
 800068e:	4a0a      	ldr	r2, [pc, #40]	; (80006b8 <RTC_IRQHandler+0x5c>)
 8000690:	68d9      	ldr	r1, [r3, #12]
 8000692:	400a      	ands	r2, r1
 8000694:	60da      	str	r2, [r3, #12]
 8000696:	4b09      	ldr	r3, [pc, #36]	; (80006bc <RTC_IRQHandler+0x60>)
 8000698:	2280      	movs	r2, #128	; 0x80
 800069a:	6959      	ldr	r1, [r3, #20]
 800069c:	0352      	lsls	r2, r2, #13
 800069e:	430a      	orrs	r2, r1
 80006a0:	615a      	str	r2, [r3, #20]
 80006a2:	4770      	bx	lr
 80006a4:	20000160 	.word	0x20000160
 80006a8:	20000154 	.word	0x20000154
 80006ac:	2000014c 	.word	0x2000014c
 80006b0:	2000015c 	.word	0x2000015c
 80006b4:	40002800 	.word	0x40002800
 80006b8:	fffffbff 	.word	0xfffffbff
 80006bc:	40010400 	.word	0x40010400

080006c0 <gpio_init>:
 80006c0:	b530      	push	{r4, r5, lr}
 80006c2:	4a0a      	ldr	r2, [pc, #40]	; (80006ec <gpio_init+0x2c>)
 80006c4:	2303      	movs	r3, #3
 80006c6:	6ad1      	ldr	r1, [r2, #44]	; 0x2c
 80006c8:	4c09      	ldr	r4, [pc, #36]	; (80006f0 <gpio_init+0x30>)
 80006ca:	b087      	sub	sp, #28
 80006cc:	4319      	orrs	r1, r3
 80006ce:	62d1      	str	r1, [r2, #44]	; 0x2c
 80006d0:	2508      	movs	r5, #8
 80006d2:	2201      	movs	r2, #1
 80006d4:	1c20      	adds	r0, r4, #0
 80006d6:	a901      	add	r1, sp, #4
 80006d8:	9202      	str	r2, [sp, #8]
 80006da:	9203      	str	r2, [sp, #12]
 80006dc:	9304      	str	r3, [sp, #16]
 80006de:	9501      	str	r5, [sp, #4]
 80006e0:	f000 fb44 	bl	8000d6c <HAL_GPIO_Init>
 80006e4:	62a5      	str	r5, [r4, #40]	; 0x28
 80006e6:	b007      	add	sp, #28
 80006e8:	bd30      	pop	{r4, r5, pc}
 80006ea:	46c0      	nop			; (mov r8, r8)
 80006ec:	40021000 	.word	0x40021000
 80006f0:	50000400 	.word	0x50000400

080006f4 <led_on>:
 80006f4:	4b01      	ldr	r3, [pc, #4]	; (80006fc <led_on+0x8>)
 80006f6:	6198      	str	r0, [r3, #24]
 80006f8:	4770      	bx	lr
 80006fa:	46c0      	nop			; (mov r8, r8)
 80006fc:	50000400 	.word	0x50000400

08000700 <led_off>:
 8000700:	4b01      	ldr	r3, [pc, #4]	; (8000708 <led_off+0x8>)
 8000702:	6298      	str	r0, [r3, #40]	; 0x28
 8000704:	4770      	bx	lr
 8000706:	46c0      	nop			; (mov r8, r8)
 8000708:	50000400 	.word	0x50000400

0800070c <HAL_InitTick>:
 800070c:	b510      	push	{r4, lr}
 800070e:	1c04      	adds	r4, r0, #0
 8000710:	f000 fb16 	bl	8000d40 <HAL_RCC_GetHCLKFreq>
 8000714:	21fa      	movs	r1, #250	; 0xfa
 8000716:	0089      	lsls	r1, r1, #2
 8000718:	f000 fc2e 	bl	8000f78 <__aeabi_uidiv>
 800071c:	f000 fc08 	bl	8000f30 <HAL_SYSTICK_Config>
 8000720:	2001      	movs	r0, #1
 8000722:	4240      	negs	r0, r0
 8000724:	1c21      	adds	r1, r4, #0
 8000726:	2200      	movs	r2, #0
 8000728:	f000 fbd0 	bl	8000ecc <HAL_NVIC_SetPriority>
 800072c:	2000      	movs	r0, #0
 800072e:	bd10      	pop	{r4, pc}

08000730 <HAL_Init>:
 8000730:	b508      	push	{r3, lr}
 8000732:	4b06      	ldr	r3, [pc, #24]	; (800074c <HAL_Init+0x1c>)
 8000734:	2102      	movs	r1, #2
 8000736:	681a      	ldr	r2, [r3, #0]
 8000738:	2003      	movs	r0, #3
 800073a:	438a      	bics	r2, r1
 800073c:	601a      	str	r2, [r3, #0]
 800073e:	f7ff ffe5 	bl	800070c <HAL_InitTick>
 8000742:	f000 fb11 	bl	8000d68 <HAL_MspInit>
 8000746:	2000      	movs	r0, #0
 8000748:	bd08      	pop	{r3, pc}
 800074a:	46c0      	nop			; (mov r8, r8)
 800074c:	40022000 	.word	0x40022000

08000750 <HAL_GetTick>:
 8000750:	4b01      	ldr	r3, [pc, #4]	; (8000758 <HAL_GetTick+0x8>)
 8000752:	6818      	ldr	r0, [r3, #0]
 8000754:	4770      	bx	lr
 8000756:	46c0      	nop			; (mov r8, r8)
 8000758:	20000004 	.word	0x20000004

0800075c <HAL_RCC_OscConfig>:
 800075c:	b5f0      	push	{r4, r5, r6, r7, lr}
 800075e:	1c04      	adds	r4, r0, #0
 8000760:	6800      	ldr	r0, [r0, #0]
 8000762:	b085      	sub	sp, #20
 8000764:	07c0      	lsls	r0, r0, #31
 8000766:	d403      	bmi.n	8000770 <HAL_RCC_OscConfig+0x14>
 8000768:	6821      	ldr	r1, [r4, #0]
 800076a:	0789      	lsls	r1, r1, #30
 800076c:	d457      	bmi.n	800081e <HAL_RCC_OscConfig+0xc2>
 800076e:	e09d      	b.n	80008ac <HAL_RCC_OscConfig+0x150>
 8000770:	4dbc      	ldr	r5, [pc, #752]	; (8000a64 <HAL_RCC_OscConfig+0x308>)
 8000772:	230c      	movs	r3, #12
 8000774:	68ea      	ldr	r2, [r5, #12]
 8000776:	401a      	ands	r2, r3
 8000778:	2a08      	cmp	r2, #8
 800077a:	d008      	beq.n	800078e <HAL_RCC_OscConfig+0x32>
 800077c:	68ea      	ldr	r2, [r5, #12]
 800077e:	4013      	ands	r3, r2
 8000780:	2280      	movs	r2, #128	; 0x80
 8000782:	0252      	lsls	r2, r2, #9
 8000784:	2b0c      	cmp	r3, #12
 8000786:	d10a      	bne.n	800079e <HAL_RCC_OscConfig+0x42>
 8000788:	68eb      	ldr	r3, [r5, #12]
 800078a:	4213      	tst	r3, r2
 800078c:	d007      	beq.n	800079e <HAL_RCC_OscConfig+0x42>
 800078e:	682b      	ldr	r3, [r5, #0]
 8000790:	039a      	lsls	r2, r3, #14
 8000792:	d5e9      	bpl.n	8000768 <HAL_RCC_OscConfig+0xc>
 8000794:	6863      	ldr	r3, [r4, #4]
 8000796:	2b00      	cmp	r3, #0
 8000798:	d1e6      	bne.n	8000768 <HAL_RCC_OscConfig+0xc>
 800079a:	2001      	movs	r0, #1
 800079c:	e1d5      	b.n	8000b4a <HAL_RCC_OscConfig+0x3ee>
 800079e:	6863      	ldr	r3, [r4, #4]
 80007a0:	2180      	movs	r1, #128	; 0x80
 80007a2:	0249      	lsls	r1, r1, #9
 80007a4:	4293      	cmp	r3, r2
 80007a6:	d103      	bne.n	80007b0 <HAL_RCC_OscConfig+0x54>
 80007a8:	682b      	ldr	r3, [r5, #0]
 80007aa:	431a      	orrs	r2, r3
 80007ac:	602a      	str	r2, [r5, #0]
 80007ae:	e01d      	b.n	80007ec <HAL_RCC_OscConfig+0x90>
 80007b0:	20a0      	movs	r0, #160	; 0xa0
 80007b2:	4aad      	ldr	r2, [pc, #692]	; (8000a68 <HAL_RCC_OscConfig+0x30c>)
 80007b4:	02c0      	lsls	r0, r0, #11
 80007b6:	4283      	cmp	r3, r0
 80007b8:	d10b      	bne.n	80007d2 <HAL_RCC_OscConfig+0x76>
 80007ba:	682b      	ldr	r3, [r5, #0]
 80007bc:	401a      	ands	r2, r3
 80007be:	602a      	str	r2, [r5, #0]
 80007c0:	682a      	ldr	r2, [r5, #0]
 80007c2:	2380      	movs	r3, #128	; 0x80
 80007c4:	02db      	lsls	r3, r3, #11
 80007c6:	4313      	orrs	r3, r2
 80007c8:	602b      	str	r3, [r5, #0]
 80007ca:	682b      	ldr	r3, [r5, #0]
 80007cc:	4319      	orrs	r1, r3
 80007ce:	6029      	str	r1, [r5, #0]
 80007d0:	e00c      	b.n	80007ec <HAL_RCC_OscConfig+0x90>
 80007d2:	6828      	ldr	r0, [r5, #0]
 80007d4:	4002      	ands	r2, r0
 80007d6:	602a      	str	r2, [r5, #0]
 80007d8:	682a      	ldr	r2, [r5, #0]
 80007da:	4011      	ands	r1, r2
 80007dc:	9103      	str	r1, [sp, #12]
 80007de:	9a03      	ldr	r2, [sp, #12]
 80007e0:	6829      	ldr	r1, [r5, #0]
 80007e2:	4aa2      	ldr	r2, [pc, #648]	; (8000a6c <HAL_RCC_OscConfig+0x310>)
 80007e4:	400a      	ands	r2, r1
 80007e6:	602a      	str	r2, [r5, #0]
 80007e8:	2b00      	cmp	r3, #0
 80007ea:	d00c      	beq.n	8000806 <HAL_RCC_OscConfig+0xaa>
 80007ec:	f7ff ffb0 	bl	8000750 <HAL_GetTick>
 80007f0:	1c06      	adds	r6, r0, #0
 80007f2:	682b      	ldr	r3, [r5, #0]
 80007f4:	0398      	lsls	r0, r3, #14
 80007f6:	d4b7      	bmi.n	8000768 <HAL_RCC_OscConfig+0xc>
 80007f8:	f7ff ffaa 	bl	8000750 <HAL_GetTick>
 80007fc:	1b80      	subs	r0, r0, r6
 80007fe:	2864      	cmp	r0, #100	; 0x64
 8000800:	d9f7      	bls.n	80007f2 <HAL_RCC_OscConfig+0x96>
 8000802:	2003      	movs	r0, #3
 8000804:	e1a1      	b.n	8000b4a <HAL_RCC_OscConfig+0x3ee>
 8000806:	f7ff ffa3 	bl	8000750 <HAL_GetTick>
 800080a:	1c06      	adds	r6, r0, #0
 800080c:	682b      	ldr	r3, [r5, #0]
 800080e:	0399      	lsls	r1, r3, #14
 8000810:	d5aa      	bpl.n	8000768 <HAL_RCC_OscConfig+0xc>
 8000812:	f7ff ff9d 	bl	8000750 <HAL_GetTick>
 8000816:	1b80      	subs	r0, r0, r6
 8000818:	2864      	cmp	r0, #100	; 0x64
 800081a:	d9f7      	bls.n	800080c <HAL_RCC_OscConfig+0xb0>
 800081c:	e7f1      	b.n	8000802 <HAL_RCC_OscConfig+0xa6>
 800081e:	4d91      	ldr	r5, [pc, #580]	; (8000a64 <HAL_RCC_OscConfig+0x308>)
 8000820:	230c      	movs	r3, #12
 8000822:	68ea      	ldr	r2, [r5, #12]
 8000824:	401a      	ands	r2, r3
 8000826:	2a04      	cmp	r2, #4
 8000828:	d006      	beq.n	8000838 <HAL_RCC_OscConfig+0xdc>
 800082a:	68ea      	ldr	r2, [r5, #12]
 800082c:	4013      	ands	r3, r2
 800082e:	2b0c      	cmp	r3, #12
 8000830:	d110      	bne.n	8000854 <HAL_RCC_OscConfig+0xf8>
 8000832:	68eb      	ldr	r3, [r5, #12]
 8000834:	03da      	lsls	r2, r3, #15
 8000836:	d40d      	bmi.n	8000854 <HAL_RCC_OscConfig+0xf8>
 8000838:	682b      	ldr	r3, [r5, #0]
 800083a:	0758      	lsls	r0, r3, #29
 800083c:	d502      	bpl.n	8000844 <HAL_RCC_OscConfig+0xe8>
 800083e:	68e1      	ldr	r1, [r4, #12]
 8000840:	2901      	cmp	r1, #1
 8000842:	d1aa      	bne.n	800079a <HAL_RCC_OscConfig+0x3e>
 8000844:	6923      	ldr	r3, [r4, #16]
 8000846:	6869      	ldr	r1, [r5, #4]
 8000848:	021a      	lsls	r2, r3, #8
 800084a:	4b89      	ldr	r3, [pc, #548]	; (8000a70 <HAL_RCC_OscConfig+0x314>)
 800084c:	400b      	ands	r3, r1
 800084e:	4313      	orrs	r3, r2
 8000850:	606b      	str	r3, [r5, #4]
 8000852:	e02b      	b.n	80008ac <HAL_RCC_OscConfig+0x150>
 8000854:	68e2      	ldr	r2, [r4, #12]
 8000856:	2309      	movs	r3, #9
 8000858:	2a00      	cmp	r2, #0
 800085a:	d018      	beq.n	800088e <HAL_RCC_OscConfig+0x132>
 800085c:	6829      	ldr	r1, [r5, #0]
 800085e:	4399      	bics	r1, r3
 8000860:	430a      	orrs	r2, r1
 8000862:	602a      	str	r2, [r5, #0]
 8000864:	f7ff ff74 	bl	8000750 <HAL_GetTick>
 8000868:	1c06      	adds	r6, r0, #0
 800086a:	682a      	ldr	r2, [r5, #0]
 800086c:	4b7d      	ldr	r3, [pc, #500]	; (8000a64 <HAL_RCC_OscConfig+0x308>)
 800086e:	0750      	lsls	r0, r2, #29
 8000870:	d405      	bmi.n	800087e <HAL_RCC_OscConfig+0x122>
 8000872:	f7ff ff6d 	bl	8000750 <HAL_GetTick>
 8000876:	1b80      	subs	r0, r0, r6
 8000878:	2802      	cmp	r0, #2
 800087a:	d9f6      	bls.n	800086a <HAL_RCC_OscConfig+0x10e>
 800087c:	e7c1      	b.n	8000802 <HAL_RCC_OscConfig+0xa6>
 800087e:	6922      	ldr	r2, [r4, #16]
 8000880:	6858      	ldr	r0, [r3, #4]
 8000882:	0211      	lsls	r1, r2, #8
 8000884:	4a7a      	ldr	r2, [pc, #488]	; (8000a70 <HAL_RCC_OscConfig+0x314>)
 8000886:	4002      	ands	r2, r0
 8000888:	430a      	orrs	r2, r1
 800088a:	605a      	str	r2, [r3, #4]
 800088c:	e00e      	b.n	80008ac <HAL_RCC_OscConfig+0x150>
 800088e:	682a      	ldr	r2, [r5, #0]
 8000890:	439a      	bics	r2, r3
 8000892:	602a      	str	r2, [r5, #0]
 8000894:	f7ff ff5c 	bl	8000750 <HAL_GetTick>
 8000898:	1c06      	adds	r6, r0, #0
 800089a:	682b      	ldr	r3, [r5, #0]
 800089c:	0758      	lsls	r0, r3, #29
 800089e:	d505      	bpl.n	80008ac <HAL_RCC_OscConfig+0x150>
 80008a0:	f7ff ff56 	bl	8000750 <HAL_GetTick>
 80008a4:	1b80      	subs	r0, r0, r6
 80008a6:	2802      	cmp	r0, #2
 80008a8:	d9f7      	bls.n	800089a <HAL_RCC_OscConfig+0x13e>
 80008aa:	e7aa      	b.n	8000802 <HAL_RCC_OscConfig+0xa6>
 80008ac:	6821      	ldr	r1, [r4, #0]
 80008ae:	06c9      	lsls	r1, r1, #27
 80008b0:	d54f      	bpl.n	8000952 <HAL_RCC_OscConfig+0x1f6>
 80008b2:	4d6c      	ldr	r5, [pc, #432]	; (8000a64 <HAL_RCC_OscConfig+0x308>)
 80008b4:	230c      	movs	r3, #12
 80008b6:	68ea      	ldr	r2, [r5, #12]
 80008b8:	421a      	tst	r2, r3
 80008ba:	d117      	bne.n	80008ec <HAL_RCC_OscConfig+0x190>
 80008bc:	682b      	ldr	r3, [r5, #0]
 80008be:	059a      	lsls	r2, r3, #22
 80008c0:	d503      	bpl.n	80008ca <HAL_RCC_OscConfig+0x16e>
 80008c2:	69a3      	ldr	r3, [r4, #24]
 80008c4:	2b00      	cmp	r3, #0
 80008c6:	d100      	bne.n	80008ca <HAL_RCC_OscConfig+0x16e>
 80008c8:	e767      	b.n	800079a <HAL_RCC_OscConfig+0x3e>
 80008ca:	686a      	ldr	r2, [r5, #4]
 80008cc:	4b69      	ldr	r3, [pc, #420]	; (8000a74 <HAL_RCC_OscConfig+0x318>)
 80008ce:	6a20      	ldr	r0, [r4, #32]
 80008d0:	4013      	ands	r3, r2
 80008d2:	4303      	orrs	r3, r0
 80008d4:	606b      	str	r3, [r5, #4]
 80008d6:	686b      	ldr	r3, [r5, #4]
 80008d8:	69e1      	ldr	r1, [r4, #28]
 80008da:	021b      	lsls	r3, r3, #8
 80008dc:	060a      	lsls	r2, r1, #24
 80008de:	0a1b      	lsrs	r3, r3, #8
 80008e0:	4313      	orrs	r3, r2
 80008e2:	606b      	str	r3, [r5, #4]
 80008e4:	2003      	movs	r0, #3
 80008e6:	f7ff ff11 	bl	800070c <HAL_InitTick>
 80008ea:	e032      	b.n	8000952 <HAL_RCC_OscConfig+0x1f6>
 80008ec:	69a2      	ldr	r2, [r4, #24]
 80008ee:	2a00      	cmp	r2, #0
 80008f0:	d01f      	beq.n	8000932 <HAL_RCC_OscConfig+0x1d6>
 80008f2:	682a      	ldr	r2, [r5, #0]
 80008f4:	2380      	movs	r3, #128	; 0x80
 80008f6:	005b      	lsls	r3, r3, #1
 80008f8:	4313      	orrs	r3, r2
 80008fa:	602b      	str	r3, [r5, #0]
 80008fc:	f7ff ff28 	bl	8000750 <HAL_GetTick>
 8000900:	1c06      	adds	r6, r0, #0
 8000902:	682a      	ldr	r2, [r5, #0]
 8000904:	4b57      	ldr	r3, [pc, #348]	; (8000a64 <HAL_RCC_OscConfig+0x308>)
 8000906:	0590      	lsls	r0, r2, #22
 8000908:	d405      	bmi.n	8000916 <HAL_RCC_OscConfig+0x1ba>
 800090a:	f7ff ff21 	bl	8000750 <HAL_GetTick>
 800090e:	1b80      	subs	r0, r0, r6
 8000910:	2802      	cmp	r0, #2
 8000912:	d9f6      	bls.n	8000902 <HAL_RCC_OscConfig+0x1a6>
 8000914:	e775      	b.n	8000802 <HAL_RCC_OscConfig+0xa6>
 8000916:	6859      	ldr	r1, [r3, #4]
 8000918:	4a56      	ldr	r2, [pc, #344]	; (8000a74 <HAL_RCC_OscConfig+0x318>)
 800091a:	400a      	ands	r2, r1
 800091c:	6a21      	ldr	r1, [r4, #32]
 800091e:	430a      	orrs	r2, r1
 8000920:	605a      	str	r2, [r3, #4]
 8000922:	685a      	ldr	r2, [r3, #4]
 8000924:	69e0      	ldr	r0, [r4, #28]
 8000926:	0212      	lsls	r2, r2, #8
 8000928:	0601      	lsls	r1, r0, #24
 800092a:	0a12      	lsrs	r2, r2, #8
 800092c:	430a      	orrs	r2, r1
 800092e:	605a      	str	r2, [r3, #4]
 8000930:	e00f      	b.n	8000952 <HAL_RCC_OscConfig+0x1f6>
 8000932:	682a      	ldr	r2, [r5, #0]
 8000934:	4b50      	ldr	r3, [pc, #320]	; (8000a78 <HAL_RCC_OscConfig+0x31c>)
 8000936:	4013      	ands	r3, r2
 8000938:	602b      	str	r3, [r5, #0]
 800093a:	f7ff ff09 	bl	8000750 <HAL_GetTick>
 800093e:	1c06      	adds	r6, r0, #0
 8000940:	682b      	ldr	r3, [r5, #0]
 8000942:	0599      	lsls	r1, r3, #22
 8000944:	d505      	bpl.n	8000952 <HAL_RCC_OscConfig+0x1f6>
 8000946:	f7ff ff03 	bl	8000750 <HAL_GetTick>
 800094a:	1b80      	subs	r0, r0, r6
 800094c:	2802      	cmp	r0, #2
 800094e:	d9f7      	bls.n	8000940 <HAL_RCC_OscConfig+0x1e4>
 8000950:	e757      	b.n	8000802 <HAL_RCC_OscConfig+0xa6>
 8000952:	6822      	ldr	r2, [r4, #0]
 8000954:	0712      	lsls	r2, r2, #28
 8000956:	d403      	bmi.n	8000960 <HAL_RCC_OscConfig+0x204>
 8000958:	6823      	ldr	r3, [r4, #0]
 800095a:	075b      	lsls	r3, r3, #29
 800095c:	d422      	bmi.n	80009a4 <HAL_RCC_OscConfig+0x248>
 800095e:	e0ab      	b.n	8000ab8 <HAL_RCC_OscConfig+0x35c>
 8000960:	4d40      	ldr	r5, [pc, #256]	; (8000a64 <HAL_RCC_OscConfig+0x308>)
 8000962:	6960      	ldr	r0, [r4, #20]
 8000964:	2301      	movs	r3, #1
 8000966:	6d2a      	ldr	r2, [r5, #80]	; 0x50
 8000968:	2800      	cmp	r0, #0
 800096a:	d00d      	beq.n	8000988 <HAL_RCC_OscConfig+0x22c>
 800096c:	4313      	orrs	r3, r2
 800096e:	652b      	str	r3, [r5, #80]	; 0x50
 8000970:	f7ff feee 	bl	8000750 <HAL_GetTick>
 8000974:	1c06      	adds	r6, r0, #0
 8000976:	6d2b      	ldr	r3, [r5, #80]	; 0x50
 8000978:	0799      	lsls	r1, r3, #30
 800097a:	d4ed      	bmi.n	8000958 <HAL_RCC_OscConfig+0x1fc>
 800097c:	f7ff fee8 	bl	8000750 <HAL_GetTick>
 8000980:	1b80      	subs	r0, r0, r6
 8000982:	2802      	cmp	r0, #2
 8000984:	d9f7      	bls.n	8000976 <HAL_RCC_OscConfig+0x21a>
 8000986:	e73c      	b.n	8000802 <HAL_RCC_OscConfig+0xa6>
 8000988:	439a      	bics	r2, r3
 800098a:	652a      	str	r2, [r5, #80]	; 0x50
 800098c:	f7ff fee0 	bl	8000750 <HAL_GetTick>
 8000990:	1c06      	adds	r6, r0, #0
 8000992:	6d2b      	ldr	r3, [r5, #80]	; 0x50
 8000994:	079a      	lsls	r2, r3, #30
 8000996:	d5df      	bpl.n	8000958 <HAL_RCC_OscConfig+0x1fc>
 8000998:	f7ff feda 	bl	8000750 <HAL_GetTick>
 800099c:	1b80      	subs	r0, r0, r6
 800099e:	2802      	cmp	r0, #2
 80009a0:	d9f7      	bls.n	8000992 <HAL_RCC_OscConfig+0x236>
 80009a2:	e72e      	b.n	8000802 <HAL_RCC_OscConfig+0xa6>
 80009a4:	4d2f      	ldr	r5, [pc, #188]	; (8000a64 <HAL_RCC_OscConfig+0x308>)
 80009a6:	2380      	movs	r3, #128	; 0x80
 80009a8:	6baa      	ldr	r2, [r5, #56]	; 0x38
 80009aa:	2000      	movs	r0, #0
 80009ac:	055b      	lsls	r3, r3, #21
 80009ae:	9000      	str	r0, [sp, #0]
 80009b0:	421a      	tst	r2, r3
 80009b2:	d104      	bne.n	80009be <HAL_RCC_OscConfig+0x262>
 80009b4:	6baa      	ldr	r2, [r5, #56]	; 0x38
 80009b6:	2101      	movs	r1, #1
 80009b8:	4313      	orrs	r3, r2
 80009ba:	63ab      	str	r3, [r5, #56]	; 0x38
 80009bc:	9100      	str	r1, [sp, #0]
 80009be:	4e2f      	ldr	r6, [pc, #188]	; (8000a7c <HAL_RCC_OscConfig+0x320>)
 80009c0:	2380      	movs	r3, #128	; 0x80
 80009c2:	6832      	ldr	r2, [r6, #0]
 80009c4:	2000      	movs	r0, #0
 80009c6:	005b      	lsls	r3, r3, #1
 80009c8:	9001      	str	r0, [sp, #4]
 80009ca:	421a      	tst	r2, r3
 80009cc:	d110      	bne.n	80009f0 <HAL_RCC_OscConfig+0x294>
 80009ce:	6832      	ldr	r2, [r6, #0]
 80009d0:	4313      	orrs	r3, r2
 80009d2:	6033      	str	r3, [r6, #0]
 80009d4:	f7ff febc 	bl	8000750 <HAL_GetTick>
 80009d8:	1c07      	adds	r7, r0, #0
 80009da:	6833      	ldr	r3, [r6, #0]
 80009dc:	05d9      	lsls	r1, r3, #23
 80009de:	d405      	bmi.n	80009ec <HAL_RCC_OscConfig+0x290>
 80009e0:	f7ff feb6 	bl	8000750 <HAL_GetTick>
 80009e4:	1bc0      	subs	r0, r0, r7
 80009e6:	2864      	cmp	r0, #100	; 0x64
 80009e8:	d9f7      	bls.n	80009da <HAL_RCC_OscConfig+0x27e>
 80009ea:	e70a      	b.n	8000802 <HAL_RCC_OscConfig+0xa6>
 80009ec:	2201      	movs	r2, #1
 80009ee:	9201      	str	r2, [sp, #4]
 80009f0:	68a3      	ldr	r3, [r4, #8]
 80009f2:	2180      	movs	r1, #128	; 0x80
 80009f4:	0049      	lsls	r1, r1, #1
 80009f6:	428b      	cmp	r3, r1
 80009f8:	d102      	bne.n	8000a00 <HAL_RCC_OscConfig+0x2a4>
 80009fa:	6d2a      	ldr	r2, [r5, #80]	; 0x50
 80009fc:	4313      	orrs	r3, r2
 80009fe:	e023      	b.n	8000a48 <HAL_RCC_OscConfig+0x2ec>
 8000a00:	4a1d      	ldr	r2, [pc, #116]	; (8000a78 <HAL_RCC_OscConfig+0x31c>)
 8000a02:	2b00      	cmp	r3, #0
 8000a04:	d10a      	bne.n	8000a1c <HAL_RCC_OscConfig+0x2c0>
 8000a06:	6d2b      	ldr	r3, [r5, #80]	; 0x50
 8000a08:	401a      	ands	r2, r3
 8000a0a:	652a      	str	r2, [r5, #80]	; 0x50
 8000a0c:	6d2a      	ldr	r2, [r5, #80]	; 0x50
 8000a0e:	4b1c      	ldr	r3, [pc, #112]	; (8000a80 <HAL_RCC_OscConfig+0x324>)
 8000a10:	4013      	ands	r3, r2
 8000a12:	652b      	str	r3, [r5, #80]	; 0x50
 8000a14:	f7ff fe9c 	bl	8000750 <HAL_GetTick>
 8000a18:	1c07      	adds	r7, r0, #0
 8000a1a:	e03c      	b.n	8000a96 <HAL_RCC_OscConfig+0x33a>
 8000a1c:	20a0      	movs	r0, #160	; 0xa0
 8000a1e:	00c0      	lsls	r0, r0, #3
 8000a20:	4283      	cmp	r3, r0
 8000a22:	d10b      	bne.n	8000a3c <HAL_RCC_OscConfig+0x2e0>
 8000a24:	6d2b      	ldr	r3, [r5, #80]	; 0x50
 8000a26:	401a      	ands	r2, r3
 8000a28:	652a      	str	r2, [r5, #80]	; 0x50
 8000a2a:	6d2a      	ldr	r2, [r5, #80]	; 0x50
 8000a2c:	2380      	movs	r3, #128	; 0x80
 8000a2e:	00db      	lsls	r3, r3, #3
 8000a30:	4313      	orrs	r3, r2
 8000a32:	652b      	str	r3, [r5, #80]	; 0x50
 8000a34:	6d2b      	ldr	r3, [r5, #80]	; 0x50
 8000a36:	4319      	orrs	r1, r3
 8000a38:	6529      	str	r1, [r5, #80]	; 0x50
 8000a3a:	e006      	b.n	8000a4a <HAL_RCC_OscConfig+0x2ee>
 8000a3c:	6d2b      	ldr	r3, [r5, #80]	; 0x50
 8000a3e:	401a      	ands	r2, r3
 8000a40:	652a      	str	r2, [r5, #80]	; 0x50
 8000a42:	6d2a      	ldr	r2, [r5, #80]	; 0x50
 8000a44:	4b0e      	ldr	r3, [pc, #56]	; (8000a80 <HAL_RCC_OscConfig+0x324>)
 8000a46:	4013      	ands	r3, r2
 8000a48:	652b      	str	r3, [r5, #80]	; 0x50
 8000a4a:	f7ff fe81 	bl	8000750 <HAL_GetTick>
 8000a4e:	1c07      	adds	r7, r0, #0
 8000a50:	6d2b      	ldr	r3, [r5, #80]	; 0x50
 8000a52:	0598      	lsls	r0, r3, #22
 8000a54:	d422      	bmi.n	8000a9c <HAL_RCC_OscConfig+0x340>
 8000a56:	f7ff fe7b 	bl	8000750 <HAL_GetTick>
 8000a5a:	4b0a      	ldr	r3, [pc, #40]	; (8000a84 <HAL_RCC_OscConfig+0x328>)
 8000a5c:	1bc0      	subs	r0, r0, r7
 8000a5e:	4298      	cmp	r0, r3
 8000a60:	d9f6      	bls.n	8000a50 <HAL_RCC_OscConfig+0x2f4>
 8000a62:	e6ce      	b.n	8000802 <HAL_RCC_OscConfig+0xa6>
 8000a64:	40021000 	.word	0x40021000
 8000a68:	fffeffff 	.word	0xfffeffff
 8000a6c:	fffbffff 	.word	0xfffbffff
 8000a70:	ffffe0ff 	.word	0xffffe0ff
 8000a74:	ffff1fff 	.word	0xffff1fff
 8000a78:	fffffeff 	.word	0xfffffeff
 8000a7c:	40007000 	.word	0x40007000
 8000a80:	fffffbff 	.word	0xfffffbff
 8000a84:	00001388 	.word	0x00001388
 8000a88:	f7ff fe62 	bl	8000750 <HAL_GetTick>
 8000a8c:	4b30      	ldr	r3, [pc, #192]	; (8000b50 <HAL_RCC_OscConfig+0x3f4>)
 8000a8e:	1bc0      	subs	r0, r0, r7
 8000a90:	4298      	cmp	r0, r3
 8000a92:	d900      	bls.n	8000a96 <HAL_RCC_OscConfig+0x33a>
 8000a94:	e6b5      	b.n	8000802 <HAL_RCC_OscConfig+0xa6>
 8000a96:	6d2b      	ldr	r3, [r5, #80]	; 0x50
 8000a98:	059a      	lsls	r2, r3, #22
 8000a9a:	d4f5      	bmi.n	8000a88 <HAL_RCC_OscConfig+0x32c>
 8000a9c:	9901      	ldr	r1, [sp, #4]
 8000a9e:	2901      	cmp	r1, #1
 8000aa0:	d103      	bne.n	8000aaa <HAL_RCC_OscConfig+0x34e>
 8000aa2:	6832      	ldr	r2, [r6, #0]
 8000aa4:	4b2b      	ldr	r3, [pc, #172]	; (8000b54 <HAL_RCC_OscConfig+0x3f8>)
 8000aa6:	4013      	ands	r3, r2
 8000aa8:	6033      	str	r3, [r6, #0]
 8000aaa:	9b00      	ldr	r3, [sp, #0]
 8000aac:	2b01      	cmp	r3, #1
 8000aae:	d103      	bne.n	8000ab8 <HAL_RCC_OscConfig+0x35c>
 8000ab0:	6baa      	ldr	r2, [r5, #56]	; 0x38
 8000ab2:	4b29      	ldr	r3, [pc, #164]	; (8000b58 <HAL_RCC_OscConfig+0x3fc>)
 8000ab4:	4013      	ands	r3, r2
 8000ab6:	63ab      	str	r3, [r5, #56]	; 0x38
 8000ab8:	6a62      	ldr	r2, [r4, #36]	; 0x24
 8000aba:	2a00      	cmp	r2, #0
 8000abc:	d101      	bne.n	8000ac2 <HAL_RCC_OscConfig+0x366>
 8000abe:	2000      	movs	r0, #0
 8000ac0:	e043      	b.n	8000b4a <HAL_RCC_OscConfig+0x3ee>
 8000ac2:	4d26      	ldr	r5, [pc, #152]	; (8000b5c <HAL_RCC_OscConfig+0x400>)
 8000ac4:	230c      	movs	r3, #12
 8000ac6:	68e9      	ldr	r1, [r5, #12]
 8000ac8:	400b      	ands	r3, r1
 8000aca:	2b0c      	cmp	r3, #12
 8000acc:	d100      	bne.n	8000ad0 <HAL_RCC_OscConfig+0x374>
 8000ace:	e664      	b.n	800079a <HAL_RCC_OscConfig+0x3e>
 8000ad0:	4b23      	ldr	r3, [pc, #140]	; (8000b60 <HAL_RCC_OscConfig+0x404>)
 8000ad2:	2a02      	cmp	r2, #2
 8000ad4:	d12a      	bne.n	8000b2c <HAL_RCC_OscConfig+0x3d0>
 8000ad6:	682a      	ldr	r2, [r5, #0]
 8000ad8:	4013      	ands	r3, r2
 8000ada:	602b      	str	r3, [r5, #0]
 8000adc:	f7ff fe38 	bl	8000750 <HAL_GetTick>
 8000ae0:	1c06      	adds	r6, r0, #0
 8000ae2:	682a      	ldr	r2, [r5, #0]
 8000ae4:	4b1d      	ldr	r3, [pc, #116]	; (8000b5c <HAL_RCC_OscConfig+0x400>)
 8000ae6:	0190      	lsls	r0, r2, #6
 8000ae8:	d505      	bpl.n	8000af6 <HAL_RCC_OscConfig+0x39a>
 8000aea:	f7ff fe31 	bl	8000750 <HAL_GetTick>
 8000aee:	1b80      	subs	r0, r0, r6
 8000af0:	2802      	cmp	r0, #2
 8000af2:	d9f6      	bls.n	8000ae2 <HAL_RCC_OscConfig+0x386>
 8000af4:	e685      	b.n	8000802 <HAL_RCC_OscConfig+0xa6>
 8000af6:	6ae2      	ldr	r2, [r4, #44]	; 0x2c
 8000af8:	6b21      	ldr	r1, [r4, #48]	; 0x30
 8000afa:	68d8      	ldr	r0, [r3, #12]
 8000afc:	4311      	orrs	r1, r2
 8000afe:	6aa2      	ldr	r2, [r4, #40]	; 0x28
 8000b00:	4311      	orrs	r1, r2
 8000b02:	4a18      	ldr	r2, [pc, #96]	; (8000b64 <HAL_RCC_OscConfig+0x408>)
 8000b04:	4002      	ands	r2, r0
 8000b06:	430a      	orrs	r2, r1
 8000b08:	60da      	str	r2, [r3, #12]
 8000b0a:	6819      	ldr	r1, [r3, #0]
 8000b0c:	2280      	movs	r2, #128	; 0x80
 8000b0e:	0452      	lsls	r2, r2, #17
 8000b10:	430a      	orrs	r2, r1
 8000b12:	601a      	str	r2, [r3, #0]
 8000b14:	f7ff fe1c 	bl	8000750 <HAL_GetTick>
 8000b18:	1c04      	adds	r4, r0, #0
 8000b1a:	682b      	ldr	r3, [r5, #0]
 8000b1c:	0198      	lsls	r0, r3, #6
 8000b1e:	d4ce      	bmi.n	8000abe <HAL_RCC_OscConfig+0x362>
 8000b20:	f7ff fe16 	bl	8000750 <HAL_GetTick>
 8000b24:	1b00      	subs	r0, r0, r4
 8000b26:	2802      	cmp	r0, #2
 8000b28:	d9f7      	bls.n	8000b1a <HAL_RCC_OscConfig+0x3be>
 8000b2a:	e66a      	b.n	8000802 <HAL_RCC_OscConfig+0xa6>
 8000b2c:	682a      	ldr	r2, [r5, #0]
 8000b2e:	4013      	ands	r3, r2
 8000b30:	602b      	str	r3, [r5, #0]
 8000b32:	f7ff fe0d 	bl	8000750 <HAL_GetTick>
 8000b36:	1c04      	adds	r4, r0, #0
 8000b38:	682b      	ldr	r3, [r5, #0]
 8000b3a:	0199      	lsls	r1, r3, #6
 8000b3c:	d5bf      	bpl.n	8000abe <HAL_RCC_OscConfig+0x362>
 8000b3e:	f7ff fe07 	bl	8000750 <HAL_GetTick>
 8000b42:	1b00      	subs	r0, r0, r4
 8000b44:	2802      	cmp	r0, #2
 8000b46:	d9f7      	bls.n	8000b38 <HAL_RCC_OscConfig+0x3dc>
 8000b48:	e65b      	b.n	8000802 <HAL_RCC_OscConfig+0xa6>
 8000b4a:	b005      	add	sp, #20
 8000b4c:	bdf0      	pop	{r4, r5, r6, r7, pc}
 8000b4e:	46c0      	nop			; (mov r8, r8)
 8000b50:	00001388 	.word	0x00001388
 8000b54:	fffffeff 	.word	0xfffffeff
 8000b58:	efffffff 	.word	0xefffffff
 8000b5c:	40021000 	.word	0x40021000
 8000b60:	feffffff 	.word	0xfeffffff
 8000b64:	ff02ffff 	.word	0xff02ffff

08000b68 <HAL_RCC_ClockConfig>:
 8000b68:	b5f7      	push	{r0, r1, r2, r4, r5, r6, r7, lr}
 8000b6a:	4f4f      	ldr	r7, [pc, #316]	; (8000ca8 <HAL_RCC_ClockConfig+0x140>)
 8000b6c:	2301      	movs	r3, #1
 8000b6e:	683a      	ldr	r2, [r7, #0]
 8000b70:	1c05      	adds	r5, r0, #0
 8000b72:	1c0e      	adds	r6, r1, #0
 8000b74:	401a      	ands	r2, r3
 8000b76:	4291      	cmp	r1, r2
 8000b78:	d80a      	bhi.n	8000b90 <HAL_RCC_ClockConfig+0x28>
 8000b7a:	682b      	ldr	r3, [r5, #0]
 8000b7c:	0798      	lsls	r0, r3, #30
 8000b7e:	d511      	bpl.n	8000ba4 <HAL_RCC_ClockConfig+0x3c>
 8000b80:	4a4a      	ldr	r2, [pc, #296]	; (8000cac <HAL_RCC_ClockConfig+0x144>)
 8000b82:	20f0      	movs	r0, #240	; 0xf0
 8000b84:	68d1      	ldr	r1, [r2, #12]
 8000b86:	4381      	bics	r1, r0
 8000b88:	68a8      	ldr	r0, [r5, #8]
 8000b8a:	4301      	orrs	r1, r0
 8000b8c:	60d1      	str	r1, [r2, #12]
 8000b8e:	e009      	b.n	8000ba4 <HAL_RCC_ClockConfig+0x3c>
 8000b90:	683a      	ldr	r2, [r7, #0]
 8000b92:	439a      	bics	r2, r3
 8000b94:	430a      	orrs	r2, r1
 8000b96:	603a      	str	r2, [r7, #0]
 8000b98:	683a      	ldr	r2, [r7, #0]
 8000b9a:	4013      	ands	r3, r2
 8000b9c:	428b      	cmp	r3, r1
 8000b9e:	d0ec      	beq.n	8000b7a <HAL_RCC_ClockConfig+0x12>
 8000ba0:	2001      	movs	r0, #1
 8000ba2:	e080      	b.n	8000ca6 <HAL_RCC_ClockConfig+0x13e>
 8000ba4:	07d9      	lsls	r1, r3, #31
 8000ba6:	d406      	bmi.n	8000bb6 <HAL_RCC_ClockConfig+0x4e>
 8000ba8:	6839      	ldr	r1, [r7, #0]
 8000baa:	2301      	movs	r3, #1
 8000bac:	4a3e      	ldr	r2, [pc, #248]	; (8000ca8 <HAL_RCC_ClockConfig+0x140>)
 8000bae:	4019      	ands	r1, r3
 8000bb0:	428e      	cmp	r6, r1
 8000bb2:	d958      	bls.n	8000c66 <HAL_RCC_ClockConfig+0xfe>
 8000bb4:	e05f      	b.n	8000c76 <HAL_RCC_ClockConfig+0x10e>
 8000bb6:	4c3d      	ldr	r4, [pc, #244]	; (8000cac <HAL_RCC_ClockConfig+0x144>)
 8000bb8:	686b      	ldr	r3, [r5, #4]
 8000bba:	6822      	ldr	r2, [r4, #0]
 8000bbc:	2b02      	cmp	r3, #2
 8000bbe:	d102      	bne.n	8000bc6 <HAL_RCC_ClockConfig+0x5e>
 8000bc0:	0390      	lsls	r0, r2, #14
 8000bc2:	d40c      	bmi.n	8000bde <HAL_RCC_ClockConfig+0x76>
 8000bc4:	e7ec      	b.n	8000ba0 <HAL_RCC_ClockConfig+0x38>
 8000bc6:	2b00      	cmp	r3, #0
 8000bc8:	d102      	bne.n	8000bd0 <HAL_RCC_ClockConfig+0x68>
 8000bca:	0591      	lsls	r1, r2, #22
 8000bcc:	d407      	bmi.n	8000bde <HAL_RCC_ClockConfig+0x76>
 8000bce:	e7e7      	b.n	8000ba0 <HAL_RCC_ClockConfig+0x38>
 8000bd0:	2b03      	cmp	r3, #3
 8000bd2:	d102      	bne.n	8000bda <HAL_RCC_ClockConfig+0x72>
 8000bd4:	0190      	lsls	r0, r2, #6
 8000bd6:	d402      	bmi.n	8000bde <HAL_RCC_ClockConfig+0x76>
 8000bd8:	e7e2      	b.n	8000ba0 <HAL_RCC_ClockConfig+0x38>
 8000bda:	0751      	lsls	r1, r2, #29
 8000bdc:	d5e0      	bpl.n	8000ba0 <HAL_RCC_ClockConfig+0x38>
 8000bde:	68e2      	ldr	r2, [r4, #12]
 8000be0:	2103      	movs	r1, #3
 8000be2:	438a      	bics	r2, r1
 8000be4:	4313      	orrs	r3, r2
 8000be6:	60e3      	str	r3, [r4, #12]
 8000be8:	f7ff fdb2 	bl	8000750 <HAL_GetTick>
 8000bec:	686b      	ldr	r3, [r5, #4]
 8000bee:	9001      	str	r0, [sp, #4]
 8000bf0:	2b02      	cmp	r3, #2
 8000bf2:	d10d      	bne.n	8000c10 <HAL_RCC_ClockConfig+0xa8>
 8000bf4:	68e2      	ldr	r2, [r4, #12]
 8000bf6:	230c      	movs	r3, #12
 8000bf8:	4013      	ands	r3, r2
 8000bfa:	2b08      	cmp	r3, #8
 8000bfc:	d0d4      	beq.n	8000ba8 <HAL_RCC_ClockConfig+0x40>
 8000bfe:	f7ff fda7 	bl	8000750 <HAL_GetTick>
 8000c02:	9a01      	ldr	r2, [sp, #4]
 8000c04:	4b2a      	ldr	r3, [pc, #168]	; (8000cb0 <HAL_RCC_ClockConfig+0x148>)
 8000c06:	1a80      	subs	r0, r0, r2
 8000c08:	4298      	cmp	r0, r3
 8000c0a:	d9f3      	bls.n	8000bf4 <HAL_RCC_ClockConfig+0x8c>
 8000c0c:	2003      	movs	r0, #3
 8000c0e:	e04a      	b.n	8000ca6 <HAL_RCC_ClockConfig+0x13e>
 8000c10:	2b03      	cmp	r3, #3
 8000c12:	d10c      	bne.n	8000c2e <HAL_RCC_ClockConfig+0xc6>
 8000c14:	68e2      	ldr	r2, [r4, #12]
 8000c16:	230c      	movs	r3, #12
 8000c18:	4013      	ands	r3, r2
 8000c1a:	2b0c      	cmp	r3, #12
 8000c1c:	d0c4      	beq.n	8000ba8 <HAL_RCC_ClockConfig+0x40>
 8000c1e:	f7ff fd97 	bl	8000750 <HAL_GetTick>
 8000c22:	9b01      	ldr	r3, [sp, #4]
 8000c24:	1ac0      	subs	r0, r0, r3
 8000c26:	4b22      	ldr	r3, [pc, #136]	; (8000cb0 <HAL_RCC_ClockConfig+0x148>)
 8000c28:	4298      	cmp	r0, r3
 8000c2a:	d9f3      	bls.n	8000c14 <HAL_RCC_ClockConfig+0xac>
 8000c2c:	e7ee      	b.n	8000c0c <HAL_RCC_ClockConfig+0xa4>
 8000c2e:	2b00      	cmp	r3, #0
 8000c30:	d00c      	beq.n	8000c4c <HAL_RCC_ClockConfig+0xe4>
 8000c32:	68e2      	ldr	r2, [r4, #12]
 8000c34:	230c      	movs	r3, #12
 8000c36:	4013      	ands	r3, r2
 8000c38:	2b04      	cmp	r3, #4
 8000c3a:	d10c      	bne.n	8000c56 <HAL_RCC_ClockConfig+0xee>
 8000c3c:	e7b4      	b.n	8000ba8 <HAL_RCC_ClockConfig+0x40>
 8000c3e:	f7ff fd87 	bl	8000750 <HAL_GetTick>
 8000c42:	9901      	ldr	r1, [sp, #4]
 8000c44:	4b1a      	ldr	r3, [pc, #104]	; (8000cb0 <HAL_RCC_ClockConfig+0x148>)
 8000c46:	1a40      	subs	r0, r0, r1
 8000c48:	4298      	cmp	r0, r3
 8000c4a:	d8df      	bhi.n	8000c0c <HAL_RCC_ClockConfig+0xa4>
 8000c4c:	68e2      	ldr	r2, [r4, #12]
 8000c4e:	230c      	movs	r3, #12
 8000c50:	421a      	tst	r2, r3
 8000c52:	d1f4      	bne.n	8000c3e <HAL_RCC_ClockConfig+0xd6>
 8000c54:	e7a8      	b.n	8000ba8 <HAL_RCC_ClockConfig+0x40>
 8000c56:	f7ff fd7b 	bl	8000750 <HAL_GetTick>
 8000c5a:	9a01      	ldr	r2, [sp, #4]
 8000c5c:	4b14      	ldr	r3, [pc, #80]	; (8000cb0 <HAL_RCC_ClockConfig+0x148>)
 8000c5e:	1a80      	subs	r0, r0, r2
 8000c60:	4298      	cmp	r0, r3
 8000c62:	d9e6      	bls.n	8000c32 <HAL_RCC_ClockConfig+0xca>
 8000c64:	e7d2      	b.n	8000c0c <HAL_RCC_ClockConfig+0xa4>
 8000c66:	6811      	ldr	r1, [r2, #0]
 8000c68:	4399      	bics	r1, r3
 8000c6a:	4331      	orrs	r1, r6
 8000c6c:	6011      	str	r1, [r2, #0]
 8000c6e:	6812      	ldr	r2, [r2, #0]
 8000c70:	4013      	ands	r3, r2
 8000c72:	42b3      	cmp	r3, r6
 8000c74:	d194      	bne.n	8000ba0 <HAL_RCC_ClockConfig+0x38>
 8000c76:	682b      	ldr	r3, [r5, #0]
 8000c78:	0758      	lsls	r0, r3, #29
 8000c7a:	d506      	bpl.n	8000c8a <HAL_RCC_ClockConfig+0x122>
 8000c7c:	4a0b      	ldr	r2, [pc, #44]	; (8000cac <HAL_RCC_ClockConfig+0x144>)
 8000c7e:	490d      	ldr	r1, [pc, #52]	; (8000cb4 <HAL_RCC_ClockConfig+0x14c>)
 8000c80:	68d0      	ldr	r0, [r2, #12]
 8000c82:	4001      	ands	r1, r0
 8000c84:	68e8      	ldr	r0, [r5, #12]
 8000c86:	4301      	orrs	r1, r0
 8000c88:	60d1      	str	r1, [r2, #12]
 8000c8a:	0719      	lsls	r1, r3, #28
 8000c8c:	d507      	bpl.n	8000c9e <HAL_RCC_ClockConfig+0x136>
 8000c8e:	4b07      	ldr	r3, [pc, #28]	; (8000cac <HAL_RCC_ClockConfig+0x144>)
 8000c90:	6929      	ldr	r1, [r5, #16]
 8000c92:	68d8      	ldr	r0, [r3, #12]
 8000c94:	4a08      	ldr	r2, [pc, #32]	; (8000cb8 <HAL_RCC_ClockConfig+0x150>)
 8000c96:	00c9      	lsls	r1, r1, #3
 8000c98:	4002      	ands	r2, r0
 8000c9a:	430a      	orrs	r2, r1
 8000c9c:	60da      	str	r2, [r3, #12]
 8000c9e:	2003      	movs	r0, #3
 8000ca0:	f7ff fd34 	bl	800070c <HAL_InitTick>
 8000ca4:	2000      	movs	r0, #0
 8000ca6:	bdfe      	pop	{r1, r2, r3, r4, r5, r6, r7, pc}
 8000ca8:	40022000 	.word	0x40022000
 8000cac:	40021000 	.word	0x40021000
 8000cb0:	00001388 	.word	0x00001388
 8000cb4:	fffff8ff 	.word	0xfffff8ff
 8000cb8:	ffffc7ff 	.word	0xffffc7ff

08000cbc <HAL_RCC_GetSysClockFreq>:
 8000cbc:	b508      	push	{r3, lr}
 8000cbe:	4b1b      	ldr	r3, [pc, #108]	; (8000d2c <HAL_RCC_GetSysClockFreq+0x70>)
 8000cc0:	210c      	movs	r1, #12
 8000cc2:	685a      	ldr	r2, [r3, #4]
 8000cc4:	68d8      	ldr	r0, [r3, #12]
 8000cc6:	0412      	lsls	r2, r2, #16
 8000cc8:	4008      	ands	r0, r1
 8000cca:	0f52      	lsrs	r2, r2, #29
 8000ccc:	f000 f94a 	bl	8000f64 <__gnu_thumb1_case_uqi>
 8000cd0:	25252525 	.word	0x25252525
 8000cd4:	25252507 	.word	0x25252507
 8000cd8:	2525252a 	.word	0x2525252a
 8000cdc:	0c          	.byte	0x0c
 8000cdd:	00          	.byte	0x00
 8000cde:	681b      	ldr	r3, [r3, #0]
 8000ce0:	06d8      	lsls	r0, r3, #27
 8000ce2:	d521      	bpl.n	8000d28 <HAL_RCC_GetSysClockFreq+0x6c>
 8000ce4:	4812      	ldr	r0, [pc, #72]	; (8000d30 <HAL_RCC_GetSysClockFreq+0x74>)
 8000ce6:	e020      	b.n	8000d2a <HAL_RCC_GetSysClockFreq+0x6e>
 8000ce8:	68da      	ldr	r2, [r3, #12]
 8000cea:	68d9      	ldr	r1, [r3, #12]
 8000cec:	0292      	lsls	r2, r2, #10
 8000cee:	4811      	ldr	r0, [pc, #68]	; (8000d34 <HAL_RCC_GetSysClockFreq+0x78>)
 8000cf0:	0209      	lsls	r1, r1, #8
 8000cf2:	68db      	ldr	r3, [r3, #12]
 8000cf4:	0f12      	lsrs	r2, r2, #28
 8000cf6:	0f89      	lsrs	r1, r1, #30
 8000cf8:	5c82      	ldrb	r2, [r0, r2]
 8000cfa:	3101      	adds	r1, #1
 8000cfc:	03d8      	lsls	r0, r3, #15
 8000cfe:	d407      	bmi.n	8000d10 <HAL_RCC_GetSysClockFreq+0x54>
 8000d00:	4b0a      	ldr	r3, [pc, #40]	; (8000d2c <HAL_RCC_GetSysClockFreq+0x70>)
 8000d02:	681b      	ldr	r3, [r3, #0]
 8000d04:	06d8      	lsls	r0, r3, #27
 8000d06:	d501      	bpl.n	8000d0c <HAL_RCC_GetSysClockFreq+0x50>
 8000d08:	4809      	ldr	r0, [pc, #36]	; (8000d30 <HAL_RCC_GetSysClockFreq+0x74>)
 8000d0a:	e002      	b.n	8000d12 <HAL_RCC_GetSysClockFreq+0x56>
 8000d0c:	480a      	ldr	r0, [pc, #40]	; (8000d38 <HAL_RCC_GetSysClockFreq+0x7c>)
 8000d0e:	e000      	b.n	8000d12 <HAL_RCC_GetSysClockFreq+0x56>
 8000d10:	480a      	ldr	r0, [pc, #40]	; (8000d3c <HAL_RCC_GetSysClockFreq+0x80>)
 8000d12:	4350      	muls	r0, r2
 8000d14:	f000 f930 	bl	8000f78 <__aeabi_uidiv>
 8000d18:	e007      	b.n	8000d2a <HAL_RCC_GetSysClockFreq+0x6e>
 8000d1a:	2080      	movs	r0, #128	; 0x80
 8000d1c:	3201      	adds	r2, #1
 8000d1e:	0200      	lsls	r0, r0, #8
 8000d20:	4090      	lsls	r0, r2
 8000d22:	e002      	b.n	8000d2a <HAL_RCC_GetSysClockFreq+0x6e>
 8000d24:	4805      	ldr	r0, [pc, #20]	; (8000d3c <HAL_RCC_GetSysClockFreq+0x80>)
 8000d26:	e000      	b.n	8000d2a <HAL_RCC_GetSysClockFreq+0x6e>
 8000d28:	4803      	ldr	r0, [pc, #12]	; (8000d38 <HAL_RCC_GetSysClockFreq+0x7c>)
 8000d2a:	bd08      	pop	{r3, pc}
 8000d2c:	40021000 	.word	0x40021000
 8000d30:	003d0900 	.word	0x003d0900
 8000d34:	080011ec 	.word	0x080011ec
 8000d38:	00f42400 	.word	0x00f42400
 8000d3c:	007a1200 	.word	0x007a1200

08000d40 <HAL_RCC_GetHCLKFreq>:
 8000d40:	b508      	push	{r3, lr}
 8000d42:	f7ff ffbb 	bl	8000cbc <HAL_RCC_GetSysClockFreq>
 8000d46:	4b05      	ldr	r3, [pc, #20]	; (8000d5c <HAL_RCC_GetHCLKFreq+0x1c>)
 8000d48:	4a05      	ldr	r2, [pc, #20]	; (8000d60 <HAL_RCC_GetHCLKFreq+0x20>)
 8000d4a:	68db      	ldr	r3, [r3, #12]
 8000d4c:	061b      	lsls	r3, r3, #24
 8000d4e:	0f1b      	lsrs	r3, r3, #28
 8000d50:	5cd3      	ldrb	r3, [r2, r3]
 8000d52:	40d8      	lsrs	r0, r3
 8000d54:	4b03      	ldr	r3, [pc, #12]	; (8000d64 <HAL_RCC_GetHCLKFreq+0x24>)
 8000d56:	6018      	str	r0, [r3, #0]
 8000d58:	bd08      	pop	{r3, pc}
 8000d5a:	46c0      	nop			; (mov r8, r8)
 8000d5c:	40021000 	.word	0x40021000
 8000d60:	080011f5 	.word	0x080011f5
 8000d64:	20000000 	.word	0x20000000

08000d68 <HAL_MspInit>:
 8000d68:	4770      	bx	lr
	...

08000d6c <HAL_GPIO_Init>:
 8000d6c:	b5f0      	push	{r4, r5, r6, r7, lr}
 8000d6e:	680a      	ldr	r2, [r1, #0]
 8000d70:	b085      	sub	sp, #20
 8000d72:	9203      	str	r2, [sp, #12]
 8000d74:	2300      	movs	r3, #0
 8000d76:	9a03      	ldr	r2, [sp, #12]
 8000d78:	40da      	lsrs	r2, r3
 8000d7a:	d100      	bne.n	8000d7e <HAL_GPIO_Init+0x12>
 8000d7c:	e097      	b.n	8000eae <HAL_GPIO_Init+0x142>
 8000d7e:	2201      	movs	r2, #1
 8000d80:	9c03      	ldr	r4, [sp, #12]
 8000d82:	409a      	lsls	r2, r3
 8000d84:	4014      	ands	r4, r2
 8000d86:	46a4      	mov	ip, r4
 8000d88:	d100      	bne.n	8000d8c <HAL_GPIO_Init+0x20>
 8000d8a:	e08e      	b.n	8000eaa <HAL_GPIO_Init+0x13e>
 8000d8c:	684a      	ldr	r2, [r1, #4]
 8000d8e:	2410      	movs	r4, #16
 8000d90:	1c15      	adds	r5, r2, #0
 8000d92:	43a5      	bics	r5, r4
 8000d94:	1c2c      	adds	r4, r5, #0
 8000d96:	3d01      	subs	r5, #1
 8000d98:	2c02      	cmp	r4, #2
 8000d9a:	d10e      	bne.n	8000dba <HAL_GPIO_Init+0x4e>
 8000d9c:	08dc      	lsrs	r4, r3, #3
 8000d9e:	00a4      	lsls	r4, r4, #2
 8000da0:	2507      	movs	r5, #7
 8000da2:	1904      	adds	r4, r0, r4
 8000da4:	401d      	ands	r5, r3
 8000da6:	6a26      	ldr	r6, [r4, #32]
 8000da8:	00ad      	lsls	r5, r5, #2
 8000daa:	270f      	movs	r7, #15
 8000dac:	40af      	lsls	r7, r5
 8000dae:	43be      	bics	r6, r7
 8000db0:	690f      	ldr	r7, [r1, #16]
 8000db2:	40af      	lsls	r7, r5
 8000db4:	433e      	orrs	r6, r7
 8000db6:	6226      	str	r6, [r4, #32]
 8000db8:	e001      	b.n	8000dbe <HAL_GPIO_Init+0x52>
 8000dba:	2d01      	cmp	r5, #1
 8000dbc:	d812      	bhi.n	8000de4 <HAL_GPIO_Init+0x78>
 8000dbe:	6886      	ldr	r6, [r0, #8]
 8000dc0:	005c      	lsls	r4, r3, #1
 8000dc2:	2503      	movs	r5, #3
 8000dc4:	40a5      	lsls	r5, r4
 8000dc6:	43ae      	bics	r6, r5
 8000dc8:	68cd      	ldr	r5, [r1, #12]
 8000dca:	40a5      	lsls	r5, r4
 8000dcc:	1c34      	adds	r4, r6, #0
 8000dce:	432c      	orrs	r4, r5
 8000dd0:	6084      	str	r4, [r0, #8]
 8000dd2:	6844      	ldr	r4, [r0, #4]
 8000dd4:	2501      	movs	r5, #1
 8000dd6:	409d      	lsls	r5, r3
 8000dd8:	43ac      	bics	r4, r5
 8000dda:	06d5      	lsls	r5, r2, #27
 8000ddc:	0fed      	lsrs	r5, r5, #31
 8000dde:	409d      	lsls	r5, r3
 8000de0:	432c      	orrs	r4, r5
 8000de2:	6044      	str	r4, [r0, #4]
 8000de4:	2403      	movs	r4, #3
 8000de6:	005d      	lsls	r5, r3, #1
 8000de8:	1c26      	adds	r6, r4, #0
 8000dea:	6807      	ldr	r7, [r0, #0]
 8000dec:	40ae      	lsls	r6, r5
 8000dee:	43f6      	mvns	r6, r6
 8000df0:	9600      	str	r6, [sp, #0]
 8000df2:	403e      	ands	r6, r7
 8000df4:	1c17      	adds	r7, r2, #0
 8000df6:	4027      	ands	r7, r4
 8000df8:	40af      	lsls	r7, r5
 8000dfa:	4337      	orrs	r7, r6
 8000dfc:	6007      	str	r7, [r0, #0]
 8000dfe:	68c7      	ldr	r7, [r0, #12]
 8000e00:	9e00      	ldr	r6, [sp, #0]
 8000e02:	403e      	ands	r6, r7
 8000e04:	688f      	ldr	r7, [r1, #8]
 8000e06:	40af      	lsls	r7, r5
 8000e08:	433e      	orrs	r6, r7
 8000e0a:	60c6      	str	r6, [r0, #12]
 8000e0c:	00d5      	lsls	r5, r2, #3
 8000e0e:	d54c      	bpl.n	8000eaa <HAL_GPIO_Init+0x13e>
 8000e10:	4d28      	ldr	r5, [pc, #160]	; (8000eb4 <HAL_GPIO_Init+0x148>)
 8000e12:	2601      	movs	r6, #1
 8000e14:	6b6f      	ldr	r7, [r5, #52]	; 0x34
 8000e16:	401c      	ands	r4, r3
 8000e18:	4337      	orrs	r7, r6
 8000e1a:	636f      	str	r7, [r5, #52]	; 0x34
 8000e1c:	4f26      	ldr	r7, [pc, #152]	; (8000eb8 <HAL_GPIO_Init+0x14c>)
 8000e1e:	089d      	lsrs	r5, r3, #2
 8000e20:	00ad      	lsls	r5, r5, #2
 8000e22:	19ed      	adds	r5, r5, r7
 8000e24:	68af      	ldr	r7, [r5, #8]
 8000e26:	00a4      	lsls	r4, r4, #2
 8000e28:	9402      	str	r4, [sp, #8]
 8000e2a:	9701      	str	r7, [sp, #4]
 8000e2c:	9f02      	ldr	r7, [sp, #8]
 8000e2e:	240f      	movs	r4, #15
 8000e30:	40bc      	lsls	r4, r7
 8000e32:	9f01      	ldr	r7, [sp, #4]
 8000e34:	43a7      	bics	r7, r4
 8000e36:	24a0      	movs	r4, #160	; 0xa0
 8000e38:	05e4      	lsls	r4, r4, #23
 8000e3a:	42a0      	cmp	r0, r4
 8000e3c:	d00b      	beq.n	8000e56 <HAL_GPIO_Init+0xea>
 8000e3e:	4c1f      	ldr	r4, [pc, #124]	; (8000ebc <HAL_GPIO_Init+0x150>)
 8000e40:	42a0      	cmp	r0, r4
 8000e42:	d00b      	beq.n	8000e5c <HAL_GPIO_Init+0xf0>
 8000e44:	4c1e      	ldr	r4, [pc, #120]	; (8000ec0 <HAL_GPIO_Init+0x154>)
 8000e46:	42a0      	cmp	r0, r4
 8000e48:	d007      	beq.n	8000e5a <HAL_GPIO_Init+0xee>
 8000e4a:	4c1e      	ldr	r4, [pc, #120]	; (8000ec4 <HAL_GPIO_Init+0x158>)
 8000e4c:	1906      	adds	r6, r0, r4
 8000e4e:	1e74      	subs	r4, r6, #1
 8000e50:	41a6      	sbcs	r6, r4
 8000e52:	3605      	adds	r6, #5
 8000e54:	e002      	b.n	8000e5c <HAL_GPIO_Init+0xf0>
 8000e56:	2600      	movs	r6, #0
 8000e58:	e000      	b.n	8000e5c <HAL_GPIO_Init+0xf0>
 8000e5a:	2602      	movs	r6, #2
 8000e5c:	9c02      	ldr	r4, [sp, #8]
 8000e5e:	40a6      	lsls	r6, r4
 8000e60:	4337      	orrs	r7, r6
 8000e62:	4c19      	ldr	r4, [pc, #100]	; (8000ec8 <HAL_GPIO_Init+0x15c>)
 8000e64:	60af      	str	r7, [r5, #8]
 8000e66:	4667      	mov	r7, ip
 8000e68:	6826      	ldr	r6, [r4, #0]
 8000e6a:	43fd      	mvns	r5, r7
 8000e6c:	03d7      	lsls	r7, r2, #15
 8000e6e:	d401      	bmi.n	8000e74 <HAL_GPIO_Init+0x108>
 8000e70:	402e      	ands	r6, r5
 8000e72:	e001      	b.n	8000e78 <HAL_GPIO_Init+0x10c>
 8000e74:	4667      	mov	r7, ip
 8000e76:	433e      	orrs	r6, r7
 8000e78:	6026      	str	r6, [r4, #0]
 8000e7a:	6866      	ldr	r6, [r4, #4]
 8000e7c:	0397      	lsls	r7, r2, #14
 8000e7e:	d401      	bmi.n	8000e84 <HAL_GPIO_Init+0x118>
 8000e80:	402e      	ands	r6, r5
 8000e82:	e001      	b.n	8000e88 <HAL_GPIO_Init+0x11c>
 8000e84:	4667      	mov	r7, ip
 8000e86:	433e      	orrs	r6, r7
 8000e88:	6066      	str	r6, [r4, #4]
 8000e8a:	68a6      	ldr	r6, [r4, #8]
 8000e8c:	02d7      	lsls	r7, r2, #11
 8000e8e:	d401      	bmi.n	8000e94 <HAL_GPIO_Init+0x128>
 8000e90:	402e      	ands	r6, r5
 8000e92:	e001      	b.n	8000e98 <HAL_GPIO_Init+0x12c>
 8000e94:	4667      	mov	r7, ip
 8000e96:	433e      	orrs	r6, r7
 8000e98:	60a6      	str	r6, [r4, #8]
 8000e9a:	68e6      	ldr	r6, [r4, #12]
 8000e9c:	0297      	lsls	r7, r2, #10
 8000e9e:	d401      	bmi.n	8000ea4 <HAL_GPIO_Init+0x138>
 8000ea0:	4035      	ands	r5, r6
 8000ea2:	e001      	b.n	8000ea8 <HAL_GPIO_Init+0x13c>
 8000ea4:	4665      	mov	r5, ip
 8000ea6:	4335      	orrs	r5, r6
 8000ea8:	60e5      	str	r5, [r4, #12]
 8000eaa:	3301      	adds	r3, #1
 8000eac:	e763      	b.n	8000d76 <HAL_GPIO_Init+0xa>
 8000eae:	b005      	add	sp, #20
 8000eb0:	bdf0      	pop	{r4, r5, r6, r7, pc}
 8000eb2:	46c0      	nop			; (mov r8, r8)
 8000eb4:	40021000 	.word	0x40021000
 8000eb8:	40010000 	.word	0x40010000
 8000ebc:	50000400 	.word	0x50000400
 8000ec0:	50000800 	.word	0x50000800
 8000ec4:	afffe400 	.word	0xafffe400
 8000ec8:	40010400 	.word	0x40010400

08000ecc <HAL_NVIC_SetPriority>:
 8000ecc:	b570      	push	{r4, r5, r6, lr}
 8000ece:	0189      	lsls	r1, r1, #6
 8000ed0:	2800      	cmp	r0, #0
 8000ed2:	da15      	bge.n	8000f00 <HAL_NVIC_SetPriority+0x34>
 8000ed4:	b2c0      	uxtb	r0, r0
 8000ed6:	230f      	movs	r3, #15
 8000ed8:	4003      	ands	r3, r0
 8000eda:	3b08      	subs	r3, #8
 8000edc:	4a12      	ldr	r2, [pc, #72]	; (8000f28 <HAL_NVIC_SetPriority+0x5c>)
 8000ede:	089b      	lsrs	r3, r3, #2
 8000ee0:	009b      	lsls	r3, r3, #2
 8000ee2:	189b      	adds	r3, r3, r2
 8000ee4:	2203      	movs	r2, #3
 8000ee6:	4010      	ands	r0, r2
 8000ee8:	24ff      	movs	r4, #255	; 0xff
 8000eea:	00c2      	lsls	r2, r0, #3
 8000eec:	69dd      	ldr	r5, [r3, #28]
 8000eee:	1c20      	adds	r0, r4, #0
 8000ef0:	4090      	lsls	r0, r2
 8000ef2:	4385      	bics	r5, r0
 8000ef4:	400c      	ands	r4, r1
 8000ef6:	4094      	lsls	r4, r2
 8000ef8:	1c2a      	adds	r2, r5, #0
 8000efa:	4322      	orrs	r2, r4
 8000efc:	61da      	str	r2, [r3, #28]
 8000efe:	e012      	b.n	8000f26 <HAL_NVIC_SetPriority+0x5a>
 8000f00:	0882      	lsrs	r2, r0, #2
 8000f02:	4b0a      	ldr	r3, [pc, #40]	; (8000f2c <HAL_NVIC_SetPriority+0x60>)
 8000f04:	2403      	movs	r4, #3
 8000f06:	0092      	lsls	r2, r2, #2
 8000f08:	18d2      	adds	r2, r2, r3
 8000f0a:	4020      	ands	r0, r4
 8000f0c:	23c0      	movs	r3, #192	; 0xc0
 8000f0e:	40a0      	lsls	r0, r4
 8000f10:	009b      	lsls	r3, r3, #2
 8000f12:	24ff      	movs	r4, #255	; 0xff
 8000f14:	58d5      	ldr	r5, [r2, r3]
 8000f16:	1c26      	adds	r6, r4, #0
 8000f18:	4086      	lsls	r6, r0
 8000f1a:	43b5      	bics	r5, r6
 8000f1c:	400c      	ands	r4, r1
 8000f1e:	4084      	lsls	r4, r0
 8000f20:	1c28      	adds	r0, r5, #0
 8000f22:	4320      	orrs	r0, r4
 8000f24:	50d0      	str	r0, [r2, r3]
 8000f26:	bd70      	pop	{r4, r5, r6, pc}
 8000f28:	e000ed00 	.word	0xe000ed00
 8000f2c:	e000e100 	.word	0xe000e100

08000f30 <HAL_SYSTICK_Config>:
 8000f30:	4b09      	ldr	r3, [pc, #36]	; (8000f58 <HAL_SYSTICK_Config+0x28>)
 8000f32:	1e42      	subs	r2, r0, #1
 8000f34:	2001      	movs	r0, #1
 8000f36:	429a      	cmp	r2, r3
 8000f38:	d80d      	bhi.n	8000f56 <HAL_SYSTICK_Config+0x26>
 8000f3a:	4b08      	ldr	r3, [pc, #32]	; (8000f5c <HAL_SYSTICK_Config+0x2c>)
 8000f3c:	21c0      	movs	r1, #192	; 0xc0
 8000f3e:	605a      	str	r2, [r3, #4]
 8000f40:	4a07      	ldr	r2, [pc, #28]	; (8000f60 <HAL_SYSTICK_Config+0x30>)
 8000f42:	0609      	lsls	r1, r1, #24
 8000f44:	6a10      	ldr	r0, [r2, #32]
 8000f46:	0200      	lsls	r0, r0, #8
 8000f48:	0a00      	lsrs	r0, r0, #8
 8000f4a:	4301      	orrs	r1, r0
 8000f4c:	6211      	str	r1, [r2, #32]
 8000f4e:	2000      	movs	r0, #0
 8000f50:	2207      	movs	r2, #7
 8000f52:	6098      	str	r0, [r3, #8]
 8000f54:	601a      	str	r2, [r3, #0]
 8000f56:	4770      	bx	lr
 8000f58:	00ffffff 	.word	0x00ffffff
 8000f5c:	e000e010 	.word	0xe000e010
 8000f60:	e000ed00 	.word	0xe000ed00

08000f64 <__gnu_thumb1_case_uqi>:
 8000f64:	b402      	push	{r1}
 8000f66:	4671      	mov	r1, lr
 8000f68:	0849      	lsrs	r1, r1, #1
 8000f6a:	0049      	lsls	r1, r1, #1
 8000f6c:	5c09      	ldrb	r1, [r1, r0]
 8000f6e:	0049      	lsls	r1, r1, #1
 8000f70:	448e      	add	lr, r1
 8000f72:	bc02      	pop	{r1}
 8000f74:	4770      	bx	lr
 8000f76:	46c0      	nop			; (mov r8, r8)

08000f78 <__aeabi_uidiv>:
 8000f78:	2900      	cmp	r1, #0
 8000f7a:	d034      	beq.n	8000fe6 <.udivsi3_skip_div0_test+0x6a>

08000f7c <.udivsi3_skip_div0_test>:
 8000f7c:	2301      	movs	r3, #1
 8000f7e:	2200      	movs	r2, #0
 8000f80:	b410      	push	{r4}
 8000f82:	4288      	cmp	r0, r1
 8000f84:	d32c      	bcc.n	8000fe0 <.udivsi3_skip_div0_test+0x64>
 8000f86:	2401      	movs	r4, #1
 8000f88:	0724      	lsls	r4, r4, #28
 8000f8a:	42a1      	cmp	r1, r4
 8000f8c:	d204      	bcs.n	8000f98 <.udivsi3_skip_div0_test+0x1c>
 8000f8e:	4281      	cmp	r1, r0
 8000f90:	d202      	bcs.n	8000f98 <.udivsi3_skip_div0_test+0x1c>
 8000f92:	0109      	lsls	r1, r1, #4
 8000f94:	011b      	lsls	r3, r3, #4
 8000f96:	e7f8      	b.n	8000f8a <.udivsi3_skip_div0_test+0xe>
 8000f98:	00e4      	lsls	r4, r4, #3
 8000f9a:	42a1      	cmp	r1, r4
 8000f9c:	d204      	bcs.n	8000fa8 <.udivsi3_skip_div0_test+0x2c>
 8000f9e:	4281      	cmp	r1, r0
 8000fa0:	d202      	bcs.n	8000fa8 <.udivsi3_skip_div0_test+0x2c>
 8000fa2:	0049      	lsls	r1, r1, #1
 8000fa4:	005b      	lsls	r3, r3, #1
 8000fa6:	e7f8      	b.n	8000f9a <.udivsi3_skip_div0_test+0x1e>
 8000fa8:	4288      	cmp	r0, r1
 8000faa:	d301      	bcc.n	8000fb0 <.udivsi3_skip_div0_test+0x34>
 8000fac:	1a40      	subs	r0, r0, r1
 8000fae:	431a      	orrs	r2, r3
 8000fb0:	084c      	lsrs	r4, r1, #1
 8000fb2:	42a0      	cmp	r0, r4
 8000fb4:	d302      	bcc.n	8000fbc <.udivsi3_skip_div0_test+0x40>
 8000fb6:	1b00      	subs	r0, r0, r4
 8000fb8:	085c      	lsrs	r4, r3, #1
 8000fba:	4322      	orrs	r2, r4
 8000fbc:	088c      	lsrs	r4, r1, #2
 8000fbe:	42a0      	cmp	r0, r4
 8000fc0:	d302      	bcc.n	8000fc8 <.udivsi3_skip_div0_test+0x4c>
 8000fc2:	1b00      	subs	r0, r0, r4
 8000fc4:	089c      	lsrs	r4, r3, #2
 8000fc6:	4322      	orrs	r2, r4
 8000fc8:	08cc      	lsrs	r4, r1, #3
 8000fca:	42a0      	cmp	r0, r4
 8000fcc:	d302      	bcc.n	8000fd4 <.udivsi3_skip_div0_test+0x58>
 8000fce:	1b00      	subs	r0, r0, r4
 8000fd0:	08dc      	lsrs	r4, r3, #3
 8000fd2:	4322      	orrs	r2, r4
 8000fd4:	2800      	cmp	r0, #0
 8000fd6:	d003      	beq.n	8000fe0 <.udivsi3_skip_div0_test+0x64>
 8000fd8:	091b      	lsrs	r3, r3, #4
 8000fda:	d001      	beq.n	8000fe0 <.udivsi3_skip_div0_test+0x64>
 8000fdc:	0909      	lsrs	r1, r1, #4
 8000fde:	e7e3      	b.n	8000fa8 <.udivsi3_skip_div0_test+0x2c>
 8000fe0:	1c10      	adds	r0, r2, #0
 8000fe2:	bc10      	pop	{r4}
 8000fe4:	4770      	bx	lr
 8000fe6:	2800      	cmp	r0, #0
 8000fe8:	d001      	beq.n	8000fee <.udivsi3_skip_div0_test+0x72>
 8000fea:	2000      	movs	r0, #0
 8000fec:	43c0      	mvns	r0, r0
 8000fee:	b407      	push	{r0, r1, r2}
 8000ff0:	4802      	ldr	r0, [pc, #8]	; (8000ffc <.udivsi3_skip_div0_test+0x80>)
 8000ff2:	a102      	add	r1, pc, #8	; (adr r1, 8000ffc <.udivsi3_skip_div0_test+0x80>)
 8000ff4:	1840      	adds	r0, r0, r1
 8000ff6:	9002      	str	r0, [sp, #8]
 8000ff8:	bd03      	pop	{r0, r1, pc}
 8000ffa:	46c0      	nop			; (mov r8, r8)
 8000ffc:	000000d9 	.word	0x000000d9

08001000 <__aeabi_uidivmod>:
 8001000:	2900      	cmp	r1, #0
 8001002:	d0f0      	beq.n	8000fe6 <.udivsi3_skip_div0_test+0x6a>
 8001004:	b503      	push	{r0, r1, lr}
 8001006:	f7ff ffb9 	bl	8000f7c <.udivsi3_skip_div0_test>
 800100a:	bc0e      	pop	{r1, r2, r3}
 800100c:	4342      	muls	r2, r0
 800100e:	1a89      	subs	r1, r1, r2
 8001010:	4718      	bx	r3
 8001012:	46c0      	nop			; (mov r8, r8)

08001014 <__aeabi_idiv>:
 8001014:	2900      	cmp	r1, #0
 8001016:	d041      	beq.n	800109c <.divsi3_skip_div0_test+0x84>

08001018 <.divsi3_skip_div0_test>:
 8001018:	b410      	push	{r4}
 800101a:	1c04      	adds	r4, r0, #0
 800101c:	404c      	eors	r4, r1
 800101e:	46a4      	mov	ip, r4
 8001020:	2301      	movs	r3, #1
 8001022:	2200      	movs	r2, #0
 8001024:	2900      	cmp	r1, #0
 8001026:	d500      	bpl.n	800102a <.divsi3_skip_div0_test+0x12>
 8001028:	4249      	negs	r1, r1
 800102a:	2800      	cmp	r0, #0
 800102c:	d500      	bpl.n	8001030 <.divsi3_skip_div0_test+0x18>
 800102e:	4240      	negs	r0, r0
 8001030:	4288      	cmp	r0, r1
 8001032:	d32c      	bcc.n	800108e <.divsi3_skip_div0_test+0x76>
 8001034:	2401      	movs	r4, #1
 8001036:	0724      	lsls	r4, r4, #28
 8001038:	42a1      	cmp	r1, r4
 800103a:	d204      	bcs.n	8001046 <.divsi3_skip_div0_test+0x2e>
 800103c:	4281      	cmp	r1, r0
 800103e:	d202      	bcs.n	8001046 <.divsi3_skip_div0_test+0x2e>
 8001040:	0109      	lsls	r1, r1, #4
 8001042:	011b      	lsls	r3, r3, #4
 8001044:	e7f8      	b.n	8001038 <.divsi3_skip_div0_test+0x20>
 8001046:	00e4      	lsls	r4, r4, #3
 8001048:	42a1      	cmp	r1, r4
 800104a:	d204      	bcs.n	8001056 <.divsi3_skip_div0_test+0x3e>
 800104c:	4281      	cmp	r1, r0
 800104e:	d202      	bcs.n	8001056 <.divsi3_skip_div0_test+0x3e>
 8001050:	0049      	lsls	r1, r1, #1
 8001052:	005b      	lsls	r3, r3, #1
 8001054:	e7f8      	b.n	8001048 <.divsi3_skip_div0_test+0x30>
 8001056:	4288      	cmp	r0, r1
 8001058:	d301      	bcc.n	800105e <.divsi3_skip_div0_test+0x46>
 800105a:	1a40      	subs	r0, r0, r1
 800105c:	431a      	orrs	r2, r3
 800105e:	084c      	lsrs	r4, r1, #1
 8001060:	42a0      	cmp	r0, r4
 8001062:	d302      	bcc.n	800106a <.divsi3_skip_div0_test+0x52>
 8001064:	1b00      	subs	r0, r0, r4
 8001066:	085c      	lsrs	r4, r3, #1
 8001068:	4322      	orrs	r2, r4
 800106a:	088c      	lsrs	r4, r1, #2
 800106c:	42a0      	cmp	r0, r4
 800106e:	d302      	bcc.n	8001076 <.divsi3_skip_div0_test+0x5e>
 8001070:	1b00      	subs	r0, r0, r4
 8001072:	089c      	lsrs	r4, r3, #2
 8001074:	4322      	orrs	r2, r4
 8001076:	08cc      	lsrs	r4, r1, #3
 8001078:	42a0      	cmp	r0, r4
 800107a:	d302      	bcc.n	8001082 <.divsi3_skip_div0_test+0x6a>
 800107c:	1b00      	subs	r0, r0, r4
 800107e:	08dc      	lsrs	r4, r3, #3
 8001080:	4322      	orrs	r2, r4
 8001082:	2800      	cmp	r0, #0
 8001084:	d003      	beq.n	800108e <.divsi3_skip_div0_test+0x76>
 8001086:	091b      	lsrs	r3, r3, #4
 8001088:	d001      	beq.n	800108e <.divsi3_skip_div0_test+0x76>
 800108a:	0909      	lsrs	r1, r1, #4
 800108c:	e7e3      	b.n	8001056 <.divsi3_skip_div0_test+0x3e>
 800108e:	1c10      	adds	r0, r2, #0
 8001090:	4664      	mov	r4, ip
 8001092:	2c00      	cmp	r4, #0
 8001094:	d500      	bpl.n	8001098 <.divsi3_skip_div0_test+0x80>
 8001096:	4240      	negs	r0, r0
 8001098:	bc10      	pop	{r4}
 800109a:	4770      	bx	lr
 800109c:	2800      	cmp	r0, #0
 800109e:	d006      	beq.n	80010ae <.divsi3_skip_div0_test+0x96>
 80010a0:	db03      	blt.n	80010aa <.divsi3_skip_div0_test+0x92>
 80010a2:	2000      	movs	r0, #0
 80010a4:	43c0      	mvns	r0, r0
 80010a6:	0840      	lsrs	r0, r0, #1
 80010a8:	e001      	b.n	80010ae <.divsi3_skip_div0_test+0x96>
 80010aa:	2080      	movs	r0, #128	; 0x80
 80010ac:	0600      	lsls	r0, r0, #24
 80010ae:	b407      	push	{r0, r1, r2}
 80010b0:	4802      	ldr	r0, [pc, #8]	; (80010bc <.divsi3_skip_div0_test+0xa4>)
 80010b2:	a102      	add	r1, pc, #8	; (adr r1, 80010bc <.divsi3_skip_div0_test+0xa4>)
 80010b4:	1840      	adds	r0, r0, r1
 80010b6:	9002      	str	r0, [sp, #8]
 80010b8:	bd03      	pop	{r0, r1, pc}
 80010ba:	46c0      	nop			; (mov r8, r8)
 80010bc:	00000019 	.word	0x00000019

080010c0 <__aeabi_idivmod>:
 80010c0:	2900      	cmp	r1, #0
 80010c2:	d0eb      	beq.n	800109c <.divsi3_skip_div0_test+0x84>
 80010c4:	b503      	push	{r0, r1, lr}
 80010c6:	f7ff ffa7 	bl	8001018 <.divsi3_skip_div0_test>
 80010ca:	bc0e      	pop	{r1, r2, r3}
 80010cc:	4342      	muls	r2, r0
 80010ce:	1a89      	subs	r1, r1, r2
 80010d0:	4718      	bx	r3
 80010d2:	46c0      	nop			; (mov r8, r8)

080010d4 <__aeabi_idiv0>:
 80010d4:	4770      	bx	lr
 80010d6:	46c0      	nop			; (mov r8, r8)

080010d8 <memset>:
 80010d8:	b5f0      	push	{r4, r5, r6, r7, lr}
 80010da:	0783      	lsls	r3, r0, #30
 80010dc:	d046      	beq.n	800116c <memset+0x94>
 80010de:	1e54      	subs	r4, r2, #1
 80010e0:	2a00      	cmp	r2, #0
 80010e2:	d042      	beq.n	800116a <memset+0x92>
 80010e4:	b2ce      	uxtb	r6, r1
 80010e6:	1c03      	adds	r3, r0, #0
 80010e8:	2503      	movs	r5, #3
 80010ea:	e003      	b.n	80010f4 <memset+0x1c>
 80010ec:	1e62      	subs	r2, r4, #1
 80010ee:	2c00      	cmp	r4, #0
 80010f0:	d03b      	beq.n	800116a <memset+0x92>
 80010f2:	1c14      	adds	r4, r2, #0
 80010f4:	3301      	adds	r3, #1
 80010f6:	1e5a      	subs	r2, r3, #1
 80010f8:	7016      	strb	r6, [r2, #0]
 80010fa:	422b      	tst	r3, r5
 80010fc:	d1f6      	bne.n	80010ec <memset+0x14>
 80010fe:	2c03      	cmp	r4, #3
 8001100:	d92b      	bls.n	800115a <memset+0x82>
 8001102:	25ff      	movs	r5, #255	; 0xff
 8001104:	400d      	ands	r5, r1
 8001106:	022a      	lsls	r2, r5, #8
 8001108:	4315      	orrs	r5, r2
 800110a:	042a      	lsls	r2, r5, #16
 800110c:	4315      	orrs	r5, r2
 800110e:	2c0f      	cmp	r4, #15
 8001110:	d915      	bls.n	800113e <memset+0x66>
 8001112:	1c27      	adds	r7, r4, #0
 8001114:	3f10      	subs	r7, #16
 8001116:	093f      	lsrs	r7, r7, #4
 8001118:	1c1e      	adds	r6, r3, #0
 800111a:	013a      	lsls	r2, r7, #4
 800111c:	3610      	adds	r6, #16
 800111e:	18b6      	adds	r6, r6, r2
 8001120:	1c1a      	adds	r2, r3, #0
 8001122:	6015      	str	r5, [r2, #0]
 8001124:	6055      	str	r5, [r2, #4]
 8001126:	6095      	str	r5, [r2, #8]
 8001128:	60d5      	str	r5, [r2, #12]
 800112a:	3210      	adds	r2, #16
 800112c:	42b2      	cmp	r2, r6
 800112e:	d1f8      	bne.n	8001122 <memset+0x4a>
 8001130:	3701      	adds	r7, #1
 8001132:	013f      	lsls	r7, r7, #4
 8001134:	220f      	movs	r2, #15
 8001136:	19db      	adds	r3, r3, r7
 8001138:	4014      	ands	r4, r2
 800113a:	2c03      	cmp	r4, #3
 800113c:	d90d      	bls.n	800115a <memset+0x82>
 800113e:	1f27      	subs	r7, r4, #4
 8001140:	08bf      	lsrs	r7, r7, #2
 8001142:	00ba      	lsls	r2, r7, #2
 8001144:	1d1e      	adds	r6, r3, #4
 8001146:	18b6      	adds	r6, r6, r2
 8001148:	1c1a      	adds	r2, r3, #0
 800114a:	c220      	stmia	r2!, {r5}
 800114c:	42b2      	cmp	r2, r6
 800114e:	d1fc      	bne.n	800114a <memset+0x72>
 8001150:	3701      	adds	r7, #1
 8001152:	00bf      	lsls	r7, r7, #2
 8001154:	2203      	movs	r2, #3
 8001156:	19db      	adds	r3, r3, r7
 8001158:	4014      	ands	r4, r2
 800115a:	2c00      	cmp	r4, #0
 800115c:	d005      	beq.n	800116a <memset+0x92>
 800115e:	191c      	adds	r4, r3, r4
 8001160:	b2c9      	uxtb	r1, r1
 8001162:	7019      	strb	r1, [r3, #0]
 8001164:	3301      	adds	r3, #1
 8001166:	42a3      	cmp	r3, r4
 8001168:	d1fb      	bne.n	8001162 <memset+0x8a>
 800116a:	bdf0      	pop	{r4, r5, r6, r7, pc}
 800116c:	1c14      	adds	r4, r2, #0
 800116e:	1c03      	adds	r3, r0, #0
 8001170:	e7c5      	b.n	80010fe <memset+0x26>
 8001172:	46c0      	nop			; (mov r8, r8)

08001174 <_init>:
 8001174:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
 8001176:	46c0      	nop			; (mov r8, r8)
 8001178:	bcf8      	pop	{r3, r4, r5, r6, r7}
 800117a:	bc08      	pop	{r3}
 800117c:	469e      	mov	lr, r3
 800117e:	4770      	bx	lr

08001180 <_fini>:
 8001180:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
 8001182:	46c0      	nop			; (mov r8, r8)
 8001184:	bcf8      	pop	{r3, r4, r5, r6, r7}
 8001186:	bc08      	pop	{r3}
 8001188:	469e      	mov	lr, r3
 800118a:	4770      	bx	lr
 800118c:	746f6f62 	.word	0x746f6f62
 8001190:	20676e69 	.word	0x20676e69
 8001194:	6d6f7266 	.word	0x6d6f7266
 8001198:	0a752520 	.word	0x0a752520
 800119c:	6d617200 	.word	0x6d617200
 80011a0:	61747320 	.word	0x61747320
 80011a4:	25207472 	.word	0x25207472
 80011a8:	000a2075 	.word	0x000a2075
 80011ac:	206d6172 	.word	0x206d6172
 80011b0:	657a6973 	.word	0x657a6973
 80011b4:	20752520 	.word	0x20752520
 80011b8:	6172000a 	.word	0x6172000a
 80011bc:	7266206d 	.word	0x7266206d
 80011c0:	25206565 	.word	0x25206565
 80011c4:	000a2075 	.word	0x000a2075
 80011c8:	70616568 	.word	0x70616568
 80011cc:	61747320 	.word	0x61747320
 80011d0:	25207472 	.word	0x25207472
 80011d4:	000a2075 	.word	0x000a2075
 80011d8:	0a0a      	.short	0x0a0a
 80011da:	00          	.byte	0x00
 80011db:	73          	.byte	0x73
 80011dc:	6f696474 	.word	0x6f696474
 80011e0:	696e6920 	.word	0x696e6920
 80011e4:	6f642074 	.word	0x6f642074
 80011e8:	000a656e 	.word	0x000a656e

080011ec <PLLMulTable>:
 80011ec:	08060403 2018100c 00000030                       ....... 0

080011f5 <APBAHBPrescTable>:
 80011f5:	00000000 04030201 04030201 09080706     ................
 8001205:	00000000                                         ...

08001208 <__EH_FRAME_BEGIN__>:
 8001208:	00000000                                ....
