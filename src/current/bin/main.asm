
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
 80000e6:	f000 ffd3 	bl	8001090 <sleep>
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
 8000164:	4c11      	ldr	r4, [pc, #68]	; (80001ac <SysTick_Handler+0x58>)
 8000166:	4d12      	ldr	r5, [pc, #72]	; (80001b0 <SysTick_Handler+0x5c>)
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
 800017e:	2008      	movs	r0, #8
 8000180:	f001 fcce 	bl	8001b20 <led_on>
 8000184:	f7ff ffb2 	bl	80000ec <scheduler>
 8000188:	6823      	ldr	r3, [r4, #0]
 800018a:	220c      	movs	r2, #12
 800018c:	4353      	muls	r3, r2
 800018e:	18ed      	adds	r5, r5, r3
 8000190:	2307      	movs	r3, #7
 8000192:	68aa      	ldr	r2, [r5, #8]
 8000194:	425b      	negs	r3, r3
 8000196:	469e      	mov	lr, r3
 8000198:	f382 8808 	msr	MSP, r2
 800019c:	bcf0      	pop	{r4, r5, r6, r7}
 800019e:	46a0      	mov	r8, r4
 80001a0:	46a9      	mov	r9, r5
 80001a2:	46b2      	mov	sl, r6
 80001a4:	46bb      	mov	fp, r7
 80001a6:	bcf0      	pop	{r4, r5, r6, r7}
 80001a8:	4770      	bx	lr
 80001aa:	46c0      	nop			; (mov r8, r8)
 80001ac:	20000070 	.word	0x20000070
 80001b0:	20000010 	.word	0x20000010

080001b4 <sched_off>:
 80001b4:	b672      	cpsid	i
 80001b6:	4770      	bx	lr

080001b8 <sched_on>:
 80001b8:	b662      	cpsie	i
 80001ba:	4770      	bx	lr

080001bc <yield>:
 80001bc:	46c0      	nop			; (mov r8, r8)
 80001be:	4770      	bx	lr

080001c0 <get_thread_id>:
 80001c0:	b082      	sub	sp, #8
 80001c2:	b672      	cpsid	i
 80001c4:	4b03      	ldr	r3, [pc, #12]	; (80001d4 <get_thread_id+0x14>)
 80001c6:	681b      	ldr	r3, [r3, #0]
 80001c8:	9301      	str	r3, [sp, #4]
 80001ca:	b662      	cpsie	i
 80001cc:	9801      	ldr	r0, [sp, #4]
 80001ce:	b002      	add	sp, #8
 80001d0:	4770      	bx	lr
 80001d2:	46c0      	nop			; (mov r8, r8)
 80001d4:	20000070 	.word	0x20000070

080001d8 <kernel_start>:
 80001d8:	b508      	push	{r3, lr}
 80001da:	f000 ff4d 	bl	8001078 <sys_tick_init>
 80001de:	46c0      	nop			; (mov r8, r8)
 80001e0:	e7fd      	b.n	80001de <kernel_start+0x6>
	...

080001e4 <create_thread>:
 80001e4:	b5f0      	push	{r4, r5, r6, r7, lr}
 80001e6:	b085      	sub	sp, #20
 80001e8:	9003      	str	r0, [sp, #12]
 80001ea:	481b      	ldr	r0, [pc, #108]	; (8000258 <create_thread+0x74>)
 80001ec:	0892      	lsrs	r2, r2, #2
 80001ee:	1812      	adds	r2, r2, r0
 80001f0:	0092      	lsls	r2, r2, #2
 80001f2:	1888      	adds	r0, r1, r2
 80001f4:	1c17      	adds	r7, r2, #0
 80001f6:	9002      	str	r0, [sp, #8]
 80001f8:	1c10      	adds	r0, r2, #0
 80001fa:	323c      	adds	r2, #60	; 0x3c
 80001fc:	188a      	adds	r2, r1, r2
 80001fe:	3034      	adds	r0, #52	; 0x34
 8000200:	3738      	adds	r7, #56	; 0x38
 8000202:	9201      	str	r2, [sp, #4]
 8000204:	180e      	adds	r6, r1, r0
 8000206:	19cf      	adds	r7, r1, r7
 8000208:	2200      	movs	r2, #0
 800020a:	b672      	cpsid	i
 800020c:	250c      	movs	r5, #12
 800020e:	4355      	muls	r5, r2
 8000210:	4c12      	ldr	r4, [pc, #72]	; (800025c <create_thread+0x78>)
 8000212:	2008      	movs	r0, #8
 8000214:	1965      	adds	r5, r4, r5
 8000216:	6869      	ldr	r1, [r5, #4]
 8000218:	07c9      	lsls	r1, r1, #31
 800021a:	d415      	bmi.n	8000248 <create_thread+0x64>
 800021c:	9902      	ldr	r1, [sp, #8]
 800021e:	60a9      	str	r1, [r5, #8]
 8000220:	4d0f      	ldr	r5, [pc, #60]	; (8000260 <create_thread+0x7c>)
 8000222:	9903      	ldr	r1, [sp, #12]
 8000224:	6035      	str	r5, [r6, #0]
 8000226:	6039      	str	r1, [r7, #0]
 8000228:	2584      	movs	r5, #132	; 0x84
 800022a:	9901      	ldr	r1, [sp, #4]
 800022c:	05ad      	lsls	r5, r5, #22
 800022e:	600d      	str	r5, [r1, #0]
 8000230:	2b07      	cmp	r3, #7
 8000232:	d800      	bhi.n	8000236 <create_thread+0x52>
 8000234:	1c03      	adds	r3, r0, #0
 8000236:	200c      	movs	r0, #12
 8000238:	4350      	muls	r0, r2
 800023a:	4908      	ldr	r1, [pc, #32]	; (800025c <create_thread+0x78>)
 800023c:	180d      	adds	r5, r1, r0
 800023e:	806b      	strh	r3, [r5, #2]
 8000240:	5223      	strh	r3, [r4, r0]
 8000242:	2001      	movs	r0, #1
 8000244:	6068      	str	r0, [r5, #4]
 8000246:	1c10      	adds	r0, r2, #0
 8000248:	b662      	cpsie	i
 800024a:	3201      	adds	r2, #1
 800024c:	2a08      	cmp	r2, #8
 800024e:	d001      	beq.n	8000254 <create_thread+0x70>
 8000250:	2808      	cmp	r0, #8
 8000252:	d0da      	beq.n	800020a <create_thread+0x26>
 8000254:	b005      	add	sp, #20
 8000256:	bdf0      	pop	{r4, r5, r6, r7, pc}
 8000258:	3ffffff0 	.word	0x3ffffff0
 800025c:	20000010 	.word	0x20000010
 8000260:	080000c5 	.word	0x080000c5

08000264 <kernel_init>:
 8000264:	b510      	push	{r4, lr}
 8000266:	2300      	movs	r3, #0
 8000268:	210c      	movs	r1, #12
 800026a:	4359      	muls	r1, r3
 800026c:	4a0a      	ldr	r2, [pc, #40]	; (8000298 <kernel_init+0x34>)
 800026e:	2000      	movs	r0, #0
 8000270:	1854      	adds	r4, r2, r1
 8000272:	6060      	str	r0, [r4, #4]
 8000274:	3301      	adds	r3, #1
 8000276:	2008      	movs	r0, #8
 8000278:	8060      	strh	r0, [r4, #2]
 800027a:	5288      	strh	r0, [r1, r2]
 800027c:	4283      	cmp	r3, r0
 800027e:	d1f3      	bne.n	8000268 <kernel_init+0x4>
 8000280:	4b06      	ldr	r3, [pc, #24]	; (800029c <kernel_init+0x38>)
 8000282:	2201      	movs	r2, #1
 8000284:	4252      	negs	r2, r2
 8000286:	601a      	str	r2, [r3, #0]
 8000288:	4905      	ldr	r1, [pc, #20]	; (80002a0 <kernel_init+0x3c>)
 800028a:	2280      	movs	r2, #128	; 0x80
 800028c:	23ff      	movs	r3, #255	; 0xff
 800028e:	4805      	ldr	r0, [pc, #20]	; (80002a4 <kernel_init+0x40>)
 8000290:	f7ff ffa8 	bl	80001e4 <create_thread>
 8000294:	bd10      	pop	{r4, pc}
 8000296:	46c0      	nop			; (mov r8, r8)
 8000298:	20000010 	.word	0x20000010
 800029c:	20000070 	.word	0x20000070
 80002a0:	20000074 	.word	0x20000074
 80002a4:	080000e5 	.word	0x080000e5

080002a8 <set_wait_state>:
 80002a8:	b507      	push	{r0, r1, r2, lr}
 80002aa:	f7ff ff89 	bl	80001c0 <get_thread_id>
 80002ae:	9000      	str	r0, [sp, #0]
 80002b0:	b672      	cpsid	i
 80002b2:	9a00      	ldr	r2, [sp, #0]
 80002b4:	210c      	movs	r1, #12
 80002b6:	434a      	muls	r2, r1
 80002b8:	4b0b      	ldr	r3, [pc, #44]	; (80002e8 <set_wait_state+0x40>)
 80002ba:	2002      	movs	r0, #2
 80002bc:	189a      	adds	r2, r3, r2
 80002be:	6851      	ldr	r1, [r2, #4]
 80002c0:	4301      	orrs	r1, r0
 80002c2:	6051      	str	r1, [r2, #4]
 80002c4:	1c19      	adds	r1, r3, #0
 80002c6:	b672      	cpsid	i
 80002c8:	9b00      	ldr	r3, [sp, #0]
 80002ca:	220c      	movs	r2, #12
 80002cc:	4353      	muls	r3, r2
 80002ce:	18cb      	adds	r3, r1, r3
 80002d0:	685b      	ldr	r3, [r3, #4]
 80002d2:	9301      	str	r3, [sp, #4]
 80002d4:	b662      	cpsie	i
 80002d6:	9a01      	ldr	r2, [sp, #4]
 80002d8:	2302      	movs	r3, #2
 80002da:	421a      	tst	r2, r3
 80002dc:	d000      	beq.n	80002e0 <set_wait_state+0x38>
 80002de:	46c0      	nop			; (mov r8, r8)
 80002e0:	9a01      	ldr	r2, [sp, #4]
 80002e2:	421a      	tst	r2, r3
 80002e4:	d1ef      	bne.n	80002c6 <set_wait_state+0x1e>
 80002e6:	bd07      	pop	{r0, r1, r2, pc}
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
 8000352:	f000 fd51 	bl	8000df8 <uart_write>
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
 80003a8:	f001 fca4 	bl	8001cf4 <__aeabi_idivmod>
 80003ac:	3130      	adds	r1, #48	; 0x30
 80003ae:	5571      	strb	r1, [r6, r5]
 80003b0:	1c20      	adds	r0, r4, #0
 80003b2:	210a      	movs	r1, #10
 80003b4:	f001 fc48 	bl	8001c48 <__aeabi_idiv>
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
 80003e6:	f001 fc25 	bl	8001c34 <__aeabi_uidivmod>
 80003ea:	3130      	adds	r1, #48	; 0x30
 80003ec:	5531      	strb	r1, [r6, r4]
 80003ee:	1c28      	adds	r0, r5, #0
 80003f0:	210a      	movs	r1, #10
 80003f2:	f001 fbdb 	bl	8001bac <__aeabi_uidiv>
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
 8000528:	08001d24 	.word	0x08001d24

0800052c <lib_os_init>:
 800052c:	b508      	push	{r3, lr}
 800052e:	f7ff fe99 	bl	8000264 <kernel_init>
 8000532:	f7ff feed 	bl	8000310 <messages_init>
 8000536:	f7ff ffcf 	bl	80004d8 <stdio_init>
 800053a:	bd08      	pop	{r3, pc}

0800053c <mutex_init>:
 800053c:	b510      	push	{r4, lr}
 800053e:	1c04      	adds	r4, r0, #0
 8000540:	f7ff fe38 	bl	80001b4 <sched_off>
 8000544:	2300      	movs	r3, #0
 8000546:	6023      	str	r3, [r4, #0]
 8000548:	f7ff fe36 	bl	80001b8 <sched_on>
 800054c:	bd10      	pop	{r4, pc}

0800054e <mutex_lock>:
 800054e:	b513      	push	{r0, r1, r4, lr}
 8000550:	1c04      	adds	r4, r0, #0
 8000552:	f7ff fe2f 	bl	80001b4 <sched_off>
 8000556:	6823      	ldr	r3, [r4, #0]
 8000558:	9301      	str	r3, [sp, #4]
 800055a:	f7ff fe2d 	bl	80001b8 <sched_on>
 800055e:	9b01      	ldr	r3, [sp, #4]
 8000560:	2b00      	cmp	r3, #0
 8000562:	d001      	beq.n	8000568 <mutex_lock+0x1a>
 8000564:	f7ff fea0 	bl	80002a8 <set_wait_state>
 8000568:	9b01      	ldr	r3, [sp, #4]
 800056a:	2b00      	cmp	r3, #0
 800056c:	d1f1      	bne.n	8000552 <mutex_lock+0x4>
 800056e:	f7ff fe21 	bl	80001b4 <sched_off>
 8000572:	6823      	ldr	r3, [r4, #0]
 8000574:	9301      	str	r3, [sp, #4]
 8000576:	9b01      	ldr	r3, [sp, #4]
 8000578:	2b00      	cmp	r3, #0
 800057a:	d1ea      	bne.n	8000552 <mutex_lock+0x4>
 800057c:	2301      	movs	r3, #1
 800057e:	6023      	str	r3, [r4, #0]
 8000580:	f7ff fe1a 	bl	80001b8 <sched_on>
 8000584:	bd13      	pop	{r0, r1, r4, pc}

08000586 <mutex_unlock>:
 8000586:	b508      	push	{r3, lr}
 8000588:	f7ff ffd8 	bl	800053c <mutex_init>
 800058c:	f7ff feae 	bl	80002ec <wake_up_threads>
 8000590:	f7ff fe14 	bl	80001bc <yield>
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
 80005aa:	f000 fd39 	bl	8001020 <i2c_write_reg>
 80005ae:	203c      	movs	r0, #60	; 0x3c
 80005b0:	2101      	movs	r1, #1
 80005b2:	1c22      	adds	r2, r4, #0
 80005b4:	f000 fd34 	bl	8001020 <i2c_write_reg>
 80005b8:	203c      	movs	r0, #60	; 0x3c
 80005ba:	2102      	movs	r1, #2
 80005bc:	1c22      	adds	r2, r4, #0
 80005be:	f000 fd2f 	bl	8001020 <i2c_write_reg>
 80005c2:	203c      	movs	r0, #60	; 0x3c
 80005c4:	210a      	movs	r1, #10
 80005c6:	f000 fd3d 	bl	8001044 <i2c_read_reg>
 80005ca:	2301      	movs	r3, #1
 80005cc:	2848      	cmp	r0, #72	; 0x48
 80005ce:	d10f      	bne.n	80005f0 <hmc5883_init+0x58>
 80005d0:	203c      	movs	r0, #60	; 0x3c
 80005d2:	210b      	movs	r1, #11
 80005d4:	f000 fd36 	bl	8001044 <i2c_read_reg>
 80005d8:	2302      	movs	r3, #2
 80005da:	2834      	cmp	r0, #52	; 0x34
 80005dc:	d108      	bne.n	80005f0 <hmc5883_init+0x58>
 80005de:	203c      	movs	r0, #60	; 0x3c
 80005e0:	210c      	movs	r1, #12
 80005e2:	f000 fd2f 	bl	8001044 <i2c_read_reg>
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
 80005fe:	f000 fd21 	bl	8001044 <i2c_read_reg>
 8000602:	4c12      	ldr	r4, [pc, #72]	; (800064c <hmc5883_read+0x54>)
 8000604:	0205      	lsls	r5, r0, #8
 8000606:	b2ad      	uxth	r5, r5
 8000608:	2104      	movs	r1, #4
 800060a:	203c      	movs	r0, #60	; 0x3c
 800060c:	8025      	strh	r5, [r4, #0]
 800060e:	f000 fd19 	bl	8001044 <i2c_read_reg>
 8000612:	2107      	movs	r1, #7
 8000614:	4305      	orrs	r5, r0
 8000616:	203c      	movs	r0, #60	; 0x3c
 8000618:	8025      	strh	r5, [r4, #0]
 800061a:	f000 fd13 	bl	8001044 <i2c_read_reg>
 800061e:	0205      	lsls	r5, r0, #8
 8000620:	b2ad      	uxth	r5, r5
 8000622:	2108      	movs	r1, #8
 8000624:	203c      	movs	r0, #60	; 0x3c
 8000626:	8065      	strh	r5, [r4, #2]
 8000628:	f000 fd0c 	bl	8001044 <i2c_read_reg>
 800062c:	2105      	movs	r1, #5
 800062e:	4305      	orrs	r5, r0
 8000630:	203c      	movs	r0, #60	; 0x3c
 8000632:	8065      	strh	r5, [r4, #2]
 8000634:	f000 fd06 	bl	8001044 <i2c_read_reg>
 8000638:	0205      	lsls	r5, r0, #8
 800063a:	b2ad      	uxth	r5, r5
 800063c:	2106      	movs	r1, #6
 800063e:	203c      	movs	r0, #60	; 0x3c
 8000640:	80a5      	strh	r5, [r4, #4]
 8000642:	f000 fcff 	bl	8001044 <i2c_read_reg>
 8000646:	4305      	orrs	r5, r0
 8000648:	80a5      	strh	r5, [r4, #4]
 800064a:	bd38      	pop	{r3, r4, r5, pc}
 800064c:	20000164 	.word	0x20000164

08000650 <LCD_SH1106_write_command>:
 8000650:	b508      	push	{r3, lr}
 8000652:	1c02      	adds	r2, r0, #0
 8000654:	2100      	movs	r1, #0
 8000656:	2078      	movs	r0, #120	; 0x78
 8000658:	f000 fce2 	bl	8001020 <i2c_write_reg>
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
 800068c:	f7ff fd92 	bl	80001b4 <sched_off>
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
 80006b4:	f7ff fd80 	bl	80001b8 <sched_on>
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
 8000738:	f000 fc08 	bl	8000f4c <i2cStart>
 800073c:	2078      	movs	r0, #120	; 0x78
 800073e:	f000 fc21 	bl	8000f84 <i2cWrite>
 8000742:	2040      	movs	r0, #64	; 0x40
 8000744:	f000 fc1e 	bl	8000f84 <i2cWrite>
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
 8000762:	f000 fc0f 	bl	8000f84 <i2cWrite>
 8000766:	9b03      	ldr	r3, [sp, #12]
 8000768:	3301      	adds	r3, #1
 800076a:	9303      	str	r3, [sp, #12]
 800076c:	e7ee      	b.n	800074c <LCD_SH1106_flush_buffer+0x54>
 800076e:	f000 fbfb 	bl	8000f68 <i2cStop>
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
 80007fc:	f000 fba6 	bl	8000f4c <i2cStart>
 8000800:	2078      	movs	r0, #120	; 0x78
 8000802:	f000 fbbf 	bl	8000f84 <i2cWrite>
 8000806:	2040      	movs	r0, #64	; 0x40
 8000808:	f000 fbbc 	bl	8000f84 <i2cWrite>
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
 8000826:	f000 fbad 	bl	8000f84 <i2cWrite>
 800082a:	9b03      	ldr	r3, [sp, #12]
 800082c:	3301      	adds	r3, #1
 800082e:	9303      	str	r3, [sp, #12]
 8000830:	e7ee      	b.n	8000810 <LCD_SH1106_flush_buffer_partial+0x80>
 8000832:	f000 fb99 	bl	8000f68 <i2cStop>
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
 8000978:	08001d35 	.word	0x08001d35

0800097c <mpu6050_init>:
 800097c:	b508      	push	{r3, lr}
 800097e:	4b06      	ldr	r3, [pc, #24]	; (8000998 <mpu6050_init+0x1c>)
 8000980:	2200      	movs	r2, #0
 8000982:	20d0      	movs	r0, #208	; 0xd0
 8000984:	216b      	movs	r1, #107	; 0x6b
 8000986:	801a      	strh	r2, [r3, #0]
 8000988:	805a      	strh	r2, [r3, #2]
 800098a:	809a      	strh	r2, [r3, #4]
 800098c:	80da      	strh	r2, [r3, #6]
 800098e:	811a      	strh	r2, [r3, #8]
 8000990:	815a      	strh	r2, [r3, #10]
 8000992:	f000 fb45 	bl	8001020 <i2c_write_reg>
 8000996:	bd08      	pop	{r3, pc}
 8000998:	2000056e 	.word	0x2000056e

0800099c <mpu6050_read>:
 800099c:	b538      	push	{r3, r4, r5, lr}
 800099e:	213b      	movs	r1, #59	; 0x3b
 80009a0:	20d0      	movs	r0, #208	; 0xd0
 80009a2:	f000 fb4f 	bl	8001044 <i2c_read_reg>
 80009a6:	4c2c      	ldr	r4, [pc, #176]	; (8000a58 <mpu6050_read+0xbc>)
 80009a8:	0205      	lsls	r5, r0, #8
 80009aa:	b2ad      	uxth	r5, r5
 80009ac:	213c      	movs	r1, #60	; 0x3c
 80009ae:	20d0      	movs	r0, #208	; 0xd0
 80009b0:	8025      	strh	r5, [r4, #0]
 80009b2:	f000 fb47 	bl	8001044 <i2c_read_reg>
 80009b6:	213d      	movs	r1, #61	; 0x3d
 80009b8:	4305      	orrs	r5, r0
 80009ba:	20d0      	movs	r0, #208	; 0xd0
 80009bc:	8025      	strh	r5, [r4, #0]
 80009be:	f000 fb41 	bl	8001044 <i2c_read_reg>
 80009c2:	0205      	lsls	r5, r0, #8
 80009c4:	b2ad      	uxth	r5, r5
 80009c6:	213e      	movs	r1, #62	; 0x3e
 80009c8:	20d0      	movs	r0, #208	; 0xd0
 80009ca:	8065      	strh	r5, [r4, #2]
 80009cc:	f000 fb3a 	bl	8001044 <i2c_read_reg>
 80009d0:	213f      	movs	r1, #63	; 0x3f
 80009d2:	4305      	orrs	r5, r0
 80009d4:	20d0      	movs	r0, #208	; 0xd0
 80009d6:	8065      	strh	r5, [r4, #2]
 80009d8:	f000 fb34 	bl	8001044 <i2c_read_reg>
 80009dc:	0205      	lsls	r5, r0, #8
 80009de:	b2ad      	uxth	r5, r5
 80009e0:	2140      	movs	r1, #64	; 0x40
 80009e2:	20d0      	movs	r0, #208	; 0xd0
 80009e4:	80a5      	strh	r5, [r4, #4]
 80009e6:	f000 fb2d 	bl	8001044 <i2c_read_reg>
 80009ea:	2141      	movs	r1, #65	; 0x41
 80009ec:	4305      	orrs	r5, r0
 80009ee:	20d0      	movs	r0, #208	; 0xd0
 80009f0:	80a5      	strh	r5, [r4, #4]
 80009f2:	f000 fb27 	bl	8001044 <i2c_read_reg>
 80009f6:	0205      	lsls	r5, r0, #8
 80009f8:	b2ad      	uxth	r5, r5
 80009fa:	2142      	movs	r1, #66	; 0x42
 80009fc:	20d0      	movs	r0, #208	; 0xd0
 80009fe:	81a5      	strh	r5, [r4, #12]
 8000a00:	f000 fb20 	bl	8001044 <i2c_read_reg>
 8000a04:	2143      	movs	r1, #67	; 0x43
 8000a06:	4305      	orrs	r5, r0
 8000a08:	20d0      	movs	r0, #208	; 0xd0
 8000a0a:	81a5      	strh	r5, [r4, #12]
 8000a0c:	f000 fb1a 	bl	8001044 <i2c_read_reg>
 8000a10:	0205      	lsls	r5, r0, #8
 8000a12:	b2ad      	uxth	r5, r5
 8000a14:	2144      	movs	r1, #68	; 0x44
 8000a16:	20d0      	movs	r0, #208	; 0xd0
 8000a18:	80e5      	strh	r5, [r4, #6]
 8000a1a:	f000 fb13 	bl	8001044 <i2c_read_reg>
 8000a1e:	2145      	movs	r1, #69	; 0x45
 8000a20:	4305      	orrs	r5, r0
 8000a22:	20d0      	movs	r0, #208	; 0xd0
 8000a24:	80e5      	strh	r5, [r4, #6]
 8000a26:	f000 fb0d 	bl	8001044 <i2c_read_reg>
 8000a2a:	0205      	lsls	r5, r0, #8
 8000a2c:	b2ad      	uxth	r5, r5
 8000a2e:	2146      	movs	r1, #70	; 0x46
 8000a30:	20d0      	movs	r0, #208	; 0xd0
 8000a32:	8125      	strh	r5, [r4, #8]
 8000a34:	f000 fb06 	bl	8001044 <i2c_read_reg>
 8000a38:	2147      	movs	r1, #71	; 0x47
 8000a3a:	4305      	orrs	r5, r0
 8000a3c:	20d0      	movs	r0, #208	; 0xd0
 8000a3e:	8125      	strh	r5, [r4, #8]
 8000a40:	f000 fb00 	bl	8001044 <i2c_read_reg>
 8000a44:	0205      	lsls	r5, r0, #8
 8000a46:	b2ad      	uxth	r5, r5
 8000a48:	2148      	movs	r1, #72	; 0x48
 8000a4a:	20d0      	movs	r0, #208	; 0xd0
 8000a4c:	8165      	strh	r5, [r4, #10]
 8000a4e:	f000 faf9 	bl	8001044 <i2c_read_reg>
 8000a52:	4305      	orrs	r5, r0
 8000a54:	8165      	strh	r5, [r4, #10]
 8000a56:	bd38      	pop	{r3, r4, r5, pc}
 8000a58:	2000056e 	.word	0x2000056e

08000a5c <child_thread>:
 8000a5c:	b538      	push	{r3, r4, r5, lr}
 8000a5e:	2008      	movs	r0, #8
 8000a60:	f001 f85e 	bl	8001b20 <led_on>
 8000a64:	f000 f982 	bl	8000d6c <timer_get_time>
 8000a68:	1c01      	adds	r1, r0, #0
 8000a6a:	4816      	ldr	r0, [pc, #88]	; (8000ac4 <child_thread+0x68>)
 8000a6c:	f7ff fce4 	bl	8000438 <printf_>
 8000a70:	4c15      	ldr	r4, [pc, #84]	; (8000ac8 <child_thread+0x6c>)
 8000a72:	4d16      	ldr	r5, [pc, #88]	; (8000acc <child_thread+0x70>)
 8000a74:	2302      	movs	r3, #2
 8000a76:	5ee2      	ldrsh	r2, [r4, r3]
 8000a78:	2000      	movs	r0, #0
 8000a7a:	5e21      	ldrsh	r1, [r4, r0]
 8000a7c:	2004      	movs	r0, #4
 8000a7e:	5e23      	ldrsh	r3, [r4, r0]
 8000a80:	1c28      	adds	r0, r5, #0
 8000a82:	f7ff fcd9 	bl	8000438 <printf_>
 8000a86:	2206      	movs	r2, #6
 8000a88:	5ea1      	ldrsh	r1, [r4, r2]
 8000a8a:	2308      	movs	r3, #8
 8000a8c:	5ee2      	ldrsh	r2, [r4, r3]
 8000a8e:	200a      	movs	r0, #10
 8000a90:	5e23      	ldrsh	r3, [r4, r0]
 8000a92:	1c28      	adds	r0, r5, #0
 8000a94:	f7ff fcd0 	bl	8000438 <printf_>
 8000a98:	4b0d      	ldr	r3, [pc, #52]	; (8000ad0 <child_thread+0x74>)
 8000a9a:	2200      	movs	r2, #0
 8000a9c:	5e99      	ldrsh	r1, [r3, r2]
 8000a9e:	2002      	movs	r0, #2
 8000aa0:	5e1a      	ldrsh	r2, [r3, r0]
 8000aa2:	2004      	movs	r0, #4
 8000aa4:	5e1b      	ldrsh	r3, [r3, r0]
 8000aa6:	1c28      	adds	r0, r5, #0
 8000aa8:	f7ff fcc6 	bl	8000438 <printf_>
 8000aac:	4809      	ldr	r0, [pc, #36]	; (8000ad4 <child_thread+0x78>)
 8000aae:	f7ff fcc3 	bl	8000438 <printf_>
 8000ab2:	2008      	movs	r0, #8
 8000ab4:	f001 f83c 	bl	8001b30 <led_off>
 8000ab8:	20fa      	movs	r0, #250	; 0xfa
 8000aba:	0080      	lsls	r0, r0, #2
 8000abc:	f000 f962 	bl	8000d84 <timer_delay_ms>
 8000ac0:	e7cd      	b.n	8000a5e <child_thread+0x2>
 8000ac2:	46c0      	nop			; (mov r8, r8)
 8000ac4:	08002335 	.word	0x08002335
 8000ac8:	2000056e 	.word	0x2000056e
 8000acc:	0800233c 	.word	0x0800233c
 8000ad0:	20000164 	.word	0x20000164
 8000ad4:	080023d0 	.word	0x080023d0

08000ad8 <lcd_put_int>:
 8000ad8:	b5f0      	push	{r4, r5, r6, r7, lr}
 8000ada:	2300      	movs	r3, #0
 8000adc:	b087      	sub	sp, #28
 8000ade:	1c04      	adds	r4, r0, #0
 8000ae0:	9100      	str	r1, [sp, #0]
 8000ae2:	9201      	str	r2, [sp, #4]
 8000ae4:	1c1f      	adds	r7, r3, #0
 8000ae6:	4298      	cmp	r0, r3
 8000ae8:	da01      	bge.n	8000aee <lcd_put_int+0x16>
 8000aea:	4244      	negs	r4, r0
 8000aec:	2701      	movs	r7, #1
 8000aee:	ae03      	add	r6, sp, #12
 8000af0:	72f3      	strb	r3, [r6, #11]
 8000af2:	250a      	movs	r5, #10
 8000af4:	1c20      	adds	r0, r4, #0
 8000af6:	210a      	movs	r1, #10
 8000af8:	f001 f8fc 	bl	8001cf4 <__aeabi_idivmod>
 8000afc:	3130      	adds	r1, #48	; 0x30
 8000afe:	5571      	strb	r1, [r6, r5]
 8000b00:	1c20      	adds	r0, r4, #0
 8000b02:	210a      	movs	r1, #10
 8000b04:	f001 f8a0 	bl	8001c48 <__aeabi_idiv>
 8000b08:	1e6b      	subs	r3, r5, #1
 8000b0a:	1e04      	subs	r4, r0, #0
 8000b0c:	d001      	beq.n	8000b12 <lcd_put_int+0x3a>
 8000b0e:	1c1d      	adds	r5, r3, #0
 8000b10:	e7f0      	b.n	8000af4 <lcd_put_int+0x1c>
 8000b12:	2f00      	cmp	r7, #0
 8000b14:	d002      	beq.n	8000b1c <lcd_put_int+0x44>
 8000b16:	222d      	movs	r2, #45	; 0x2d
 8000b18:	54f2      	strb	r2, [r6, r3]
 8000b1a:	1c1d      	adds	r5, r3, #0
 8000b1c:	2400      	movs	r4, #0
 8000b1e:	1973      	adds	r3, r6, r5
 8000b20:	5d1f      	ldrb	r7, [r3, r4]
 8000b22:	9b00      	ldr	r3, [sp, #0]
 8000b24:	00e0      	lsls	r0, r4, #3
 8000b26:	18c0      	adds	r0, r0, r3
 8000b28:	9901      	ldr	r1, [sp, #4]
 8000b2a:	1c3a      	adds	r2, r7, #0
 8000b2c:	f7ff fefa 	bl	8000924 <lcd_put_char_xy>
 8000b30:	2f00      	cmp	r7, #0
 8000b32:	d002      	beq.n	8000b3a <lcd_put_int+0x62>
 8000b34:	3401      	adds	r4, #1
 8000b36:	2c0c      	cmp	r4, #12
 8000b38:	d1f1      	bne.n	8000b1e <lcd_put_int+0x46>
 8000b3a:	b007      	add	sp, #28
 8000b3c:	bdf0      	pop	{r4, r5, r6, r7, pc}
	...

08000b40 <main_thread>:
 8000b40:	b538      	push	{r3, r4, r5, lr}
 8000b42:	2008      	movs	r0, #8
 8000b44:	f000 ffec 	bl	8001b20 <led_on>
 8000b48:	482a      	ldr	r0, [pc, #168]	; (8000bf4 <main_thread+0xb4>)
 8000b4a:	f7ff fc75 	bl	8000438 <printf_>
 8000b4e:	f7ff fd23 	bl	8000598 <hmc5883_init>
 8000b52:	f7ff ff13 	bl	800097c <mpu6050_init>
 8000b56:	f7ff fe87 	bl	8000868 <LCD_SH1106_init>
 8000b5a:	20ff      	movs	r0, #255	; 0xff
 8000b5c:	f7ff fdb0 	bl	80006c0 <LCD_SH1106_clear_buffer>
 8000b60:	2280      	movs	r2, #128	; 0x80
 8000b62:	4925      	ldr	r1, [pc, #148]	; (8000bf8 <main_thread+0xb8>)
 8000b64:	4825      	ldr	r0, [pc, #148]	; (8000bfc <main_thread+0xbc>)
 8000b66:	0052      	lsls	r2, r2, #1
 8000b68:	2308      	movs	r3, #8
 8000b6a:	f7ff fb3b 	bl	80001e4 <create_thread>
 8000b6e:	2000      	movs	r0, #0
 8000b70:	2132      	movs	r1, #50	; 0x32
 8000b72:	f000 f917 	bl	8000da4 <event_timer_set_period>
 8000b76:	2000      	movs	r0, #0
 8000b78:	f000 f926 	bl	8000dc8 <event_timer_get_flag>
 8000b7c:	2800      	cmp	r0, #0
 8000b7e:	d006      	beq.n	8000b8e <main_thread+0x4e>
 8000b80:	2000      	movs	r0, #0
 8000b82:	f000 f92f 	bl	8000de4 <event_timer_clear_flag>
 8000b86:	f7ff fd37 	bl	80005f8 <hmc5883_read>
 8000b8a:	f7ff ff07 	bl	800099c <mpu6050_read>
 8000b8e:	f7ff fdff 	bl	8000790 <LCD_SH1106_flush_buffer_partial>
 8000b92:	1e04      	subs	r4, r0, #0
 8000b94:	d1ef      	bne.n	8000b76 <main_thread+0x36>
 8000b96:	f7ff fd93 	bl	80006c0 <LCD_SH1106_clear_buffer>
 8000b9a:	4d19      	ldr	r5, [pc, #100]	; (8000c00 <main_thread+0xc0>)
 8000b9c:	1c21      	adds	r1, r4, #0
 8000b9e:	2306      	movs	r3, #6
 8000ba0:	5ee8      	ldrsh	r0, [r5, r3]
 8000ba2:	1c22      	adds	r2, r4, #0
 8000ba4:	f7ff ff98 	bl	8000ad8 <lcd_put_int>
 8000ba8:	2308      	movs	r3, #8
 8000baa:	5ee8      	ldrsh	r0, [r5, r3]
 8000bac:	1c21      	adds	r1, r4, #0
 8000bae:	2210      	movs	r2, #16
 8000bb0:	f7ff ff92 	bl	8000ad8 <lcd_put_int>
 8000bb4:	230a      	movs	r3, #10
 8000bb6:	5ee8      	ldrsh	r0, [r5, r3]
 8000bb8:	1c21      	adds	r1, r4, #0
 8000bba:	2220      	movs	r2, #32
 8000bbc:	f7ff ff8c 	bl	8000ad8 <lcd_put_int>
 8000bc0:	4d10      	ldr	r5, [pc, #64]	; (8000c04 <main_thread+0xc4>)
 8000bc2:	1c22      	adds	r2, r4, #0
 8000bc4:	2300      	movs	r3, #0
 8000bc6:	5ee8      	ldrsh	r0, [r5, r3]
 8000bc8:	2140      	movs	r1, #64	; 0x40
 8000bca:	f7ff ff85 	bl	8000ad8 <lcd_put_int>
 8000bce:	2302      	movs	r3, #2
 8000bd0:	5ee8      	ldrsh	r0, [r5, r3]
 8000bd2:	2140      	movs	r1, #64	; 0x40
 8000bd4:	2210      	movs	r2, #16
 8000bd6:	f7ff ff7f 	bl	8000ad8 <lcd_put_int>
 8000bda:	2304      	movs	r3, #4
 8000bdc:	5ee8      	ldrsh	r0, [r5, r3]
 8000bde:	2140      	movs	r1, #64	; 0x40
 8000be0:	2220      	movs	r2, #32
 8000be2:	f7ff ff79 	bl	8000ad8 <lcd_put_int>
 8000be6:	f000 f8c1 	bl	8000d6c <timer_get_time>
 8000bea:	1c21      	adds	r1, r4, #0
 8000bec:	2230      	movs	r2, #48	; 0x30
 8000bee:	f7ff ff73 	bl	8000ad8 <lcd_put_int>
 8000bf2:	e7c0      	b.n	8000b76 <main_thread+0x36>
 8000bf4:	08002348 	.word	0x08002348
 8000bf8:	2000057c 	.word	0x2000057c
 8000bfc:	08000a5d 	.word	0x08000a5d
 8000c00:	2000056e 	.word	0x2000056e
 8000c04:	20000164 	.word	0x20000164

08000c08 <mem_info_print>:
 8000c08:	b538      	push	{r3, r4, r5, lr}
 8000c0a:	480e      	ldr	r0, [pc, #56]	; (8000c44 <mem_info_print+0x3c>)
 8000c0c:	490e      	ldr	r1, [pc, #56]	; (8000c48 <mem_info_print+0x40>)
 8000c0e:	f7ff fc13 	bl	8000438 <printf_>
 8000c12:	4c0e      	ldr	r4, [pc, #56]	; (8000c4c <mem_info_print+0x44>)
 8000c14:	480e      	ldr	r0, [pc, #56]	; (8000c50 <mem_info_print+0x48>)
 8000c16:	1c21      	adds	r1, r4, #0
 8000c18:	f7ff fc0e 	bl	8000438 <printf_>
 8000c1c:	4d0d      	ldr	r5, [pc, #52]	; (8000c54 <mem_info_print+0x4c>)
 8000c1e:	480e      	ldr	r0, [pc, #56]	; (8000c58 <mem_info_print+0x50>)
 8000c20:	1b2d      	subs	r5, r5, r4
 8000c22:	1c29      	adds	r1, r5, #0
 8000c24:	f7ff fc08 	bl	8000438 <printf_>
 8000c28:	490c      	ldr	r1, [pc, #48]	; (8000c5c <mem_info_print+0x54>)
 8000c2a:	480d      	ldr	r0, [pc, #52]	; (8000c60 <mem_info_print+0x58>)
 8000c2c:	1a64      	subs	r4, r4, r1
 8000c2e:	1929      	adds	r1, r5, r4
 8000c30:	f7ff fc02 	bl	8000438 <printf_>
 8000c34:	490b      	ldr	r1, [pc, #44]	; (8000c64 <mem_info_print+0x5c>)
 8000c36:	480c      	ldr	r0, [pc, #48]	; (8000c68 <mem_info_print+0x60>)
 8000c38:	f7ff fbfe 	bl	8000438 <printf_>
 8000c3c:	480b      	ldr	r0, [pc, #44]	; (8000c6c <mem_info_print+0x64>)
 8000c3e:	f7ff fbfb 	bl	8000438 <printf_>
 8000c42:	bd38      	pop	{r3, r4, r5, pc}
 8000c44:	08002383 	.word	0x08002383
 8000c48:	08001d0c 	.word	0x08001d0c
 8000c4c:	20000000 	.word	0x20000000
 8000c50:	08002394 	.word	0x08002394
 8000c54:	20001000 	.word	0x20001000
 8000c58:	080023a3 	.word	0x080023a3
 8000c5c:	20000798 	.word	0x20000798
 8000c60:	080023b1 	.word	0x080023b1
 8000c64:	20000798 	.word	0x20000798
 8000c68:	080023bf 	.word	0x080023bf
 8000c6c:	080023cf 	.word	0x080023cf

08000c70 <main>:
 8000c70:	b508      	push	{r3, lr}
 8000c72:	f000 fa6d 	bl	8001150 <lib_low_level_init>
 8000c76:	f7ff fc59 	bl	800052c <lib_os_init>
 8000c7a:	f7ff ffc5 	bl	8000c08 <mem_info_print>
 8000c7e:	2280      	movs	r2, #128	; 0x80
 8000c80:	4904      	ldr	r1, [pc, #16]	; (8000c94 <main+0x24>)
 8000c82:	0052      	lsls	r2, r2, #1
 8000c84:	2308      	movs	r3, #8
 8000c86:	4804      	ldr	r0, [pc, #16]	; (8000c98 <main+0x28>)
 8000c88:	f7ff faac 	bl	80001e4 <create_thread>
 8000c8c:	f7ff faa4 	bl	80001d8 <kernel_start>
 8000c90:	2000      	movs	r0, #0
 8000c92:	bd08      	pop	{r3, pc}
 8000c94:	2000067c 	.word	0x2000067c
 8000c98:	08000b41 	.word	0x08000b41

08000c9c <timer_init>:
 8000c9c:	b530      	push	{r4, r5, lr}
 8000c9e:	2300      	movs	r3, #0
 8000ca0:	b085      	sub	sp, #20
 8000ca2:	481b      	ldr	r0, [pc, #108]	; (8000d10 <timer_init+0x74>)
 8000ca4:	2180      	movs	r1, #128	; 0x80
 8000ca6:	005a      	lsls	r2, r3, #1
 8000ca8:	00c9      	lsls	r1, r1, #3
 8000caa:	5211      	strh	r1, [r2, r0]
 8000cac:	4819      	ldr	r0, [pc, #100]	; (8000d14 <timer_init+0x78>)
 8000cae:	2400      	movs	r4, #0
 8000cb0:	5211      	strh	r1, [r2, r0]
 8000cb2:	4919      	ldr	r1, [pc, #100]	; (8000d18 <timer_init+0x7c>)
 8000cb4:	3301      	adds	r3, #1
 8000cb6:	5254      	strh	r4, [r2, r1]
 8000cb8:	2b04      	cmp	r3, #4
 8000cba:	d1f2      	bne.n	8000ca2 <timer_init+0x6>
 8000cbc:	4b17      	ldr	r3, [pc, #92]	; (8000d1c <timer_init+0x80>)
 8000cbe:	2001      	movs	r0, #1
 8000cc0:	1c01      	adds	r1, r0, #0
 8000cc2:	601c      	str	r4, [r3, #0]
 8000cc4:	f000 fef0 	bl	8001aa8 <RCC_APB1PeriphClockCmd>
 8000cc8:	a901      	add	r1, sp, #4
 8000cca:	2330      	movs	r3, #48	; 0x30
 8000ccc:	800b      	strh	r3, [r1, #0]
 8000cce:	2080      	movs	r0, #128	; 0x80
 8000cd0:	23fa      	movs	r3, #250	; 0xfa
 8000cd2:	009b      	lsls	r3, r3, #2
 8000cd4:	05c0      	lsls	r0, r0, #23
 8000cd6:	604b      	str	r3, [r1, #4]
 8000cd8:	804c      	strh	r4, [r1, #2]
 8000cda:	810c      	strh	r4, [r1, #8]
 8000cdc:	728c      	strb	r4, [r1, #10]
 8000cde:	f000 fb0d 	bl	80012fc <TIM_TimeBaseInit>
 8000ce2:	2080      	movs	r0, #128	; 0x80
 8000ce4:	05c0      	lsls	r0, r0, #23
 8000ce6:	2101      	movs	r1, #1
 8000ce8:	f000 fb8a 	bl	8001400 <TIM_Cmd>
 8000cec:	2080      	movs	r0, #128	; 0x80
 8000cee:	2102      	movs	r1, #2
 8000cf0:	05c0      	lsls	r0, r0, #23
 8000cf2:	2201      	movs	r2, #1
 8000cf4:	f000 fbc8 	bl	8001488 <TIM_ITConfig>
 8000cf8:	466a      	mov	r2, sp
 8000cfa:	230f      	movs	r3, #15
 8000cfc:	7013      	strb	r3, [r2, #0]
 8000cfe:	4668      	mov	r0, sp
 8000d00:	2301      	movs	r3, #1
 8000d02:	7053      	strb	r3, [r2, #1]
 8000d04:	7093      	strb	r3, [r2, #2]
 8000d06:	f000 fd91 	bl	800182c <NVIC_Init>
 8000d0a:	b005      	add	sp, #20
 8000d0c:	bd30      	pop	{r4, r5, pc}
 8000d0e:	46c0      	nop			; (mov r8, r8)
 8000d10:	20000790 	.word	0x20000790
 8000d14:	20000784 	.word	0x20000784
 8000d18:	2000077c 	.word	0x2000077c
 8000d1c:	2000078c 	.word	0x2000078c

08000d20 <TIM2_IRQHandler>:
 8000d20:	2200      	movs	r2, #0
 8000d22:	490e      	ldr	r1, [pc, #56]	; (8000d5c <TIM2_IRQHandler+0x3c>)
 8000d24:	0053      	lsls	r3, r2, #1
 8000d26:	5a58      	ldrh	r0, [r3, r1]
 8000d28:	2800      	cmp	r0, #0
 8000d2a:	d003      	beq.n	8000d34 <TIM2_IRQHandler+0x14>
 8000d2c:	5a58      	ldrh	r0, [r3, r1]
 8000d2e:	3801      	subs	r0, #1
 8000d30:	b280      	uxth	r0, r0
 8000d32:	e005      	b.n	8000d40 <TIM2_IRQHandler+0x20>
 8000d34:	480a      	ldr	r0, [pc, #40]	; (8000d60 <TIM2_IRQHandler+0x40>)
 8000d36:	5a18      	ldrh	r0, [r3, r0]
 8000d38:	b280      	uxth	r0, r0
 8000d3a:	5258      	strh	r0, [r3, r1]
 8000d3c:	4909      	ldr	r1, [pc, #36]	; (8000d64 <TIM2_IRQHandler+0x44>)
 8000d3e:	2001      	movs	r0, #1
 8000d40:	3201      	adds	r2, #1
 8000d42:	5258      	strh	r0, [r3, r1]
 8000d44:	2a04      	cmp	r2, #4
 8000d46:	d1ec      	bne.n	8000d22 <TIM2_IRQHandler+0x2>
 8000d48:	4b07      	ldr	r3, [pc, #28]	; (8000d68 <TIM2_IRQHandler+0x48>)
 8000d4a:	681a      	ldr	r2, [r3, #0]
 8000d4c:	3201      	adds	r2, #1
 8000d4e:	601a      	str	r2, [r3, #0]
 8000d50:	2380      	movs	r3, #128	; 0x80
 8000d52:	2200      	movs	r2, #0
 8000d54:	05db      	lsls	r3, r3, #23
 8000d56:	821a      	strh	r2, [r3, #16]
 8000d58:	4770      	bx	lr
 8000d5a:	46c0      	nop			; (mov r8, r8)
 8000d5c:	20000790 	.word	0x20000790
 8000d60:	20000784 	.word	0x20000784
 8000d64:	2000077c 	.word	0x2000077c
 8000d68:	2000078c 	.word	0x2000078c

08000d6c <timer_get_time>:
 8000d6c:	b082      	sub	sp, #8
 8000d6e:	b672      	cpsid	i
 8000d70:	4b03      	ldr	r3, [pc, #12]	; (8000d80 <timer_get_time+0x14>)
 8000d72:	681b      	ldr	r3, [r3, #0]
 8000d74:	9301      	str	r3, [sp, #4]
 8000d76:	b662      	cpsie	i
 8000d78:	9801      	ldr	r0, [sp, #4]
 8000d7a:	b002      	add	sp, #8
 8000d7c:	4770      	bx	lr
 8000d7e:	46c0      	nop			; (mov r8, r8)
 8000d80:	2000078c 	.word	0x2000078c

08000d84 <timer_delay_ms>:
 8000d84:	b513      	push	{r0, r1, r4, lr}
 8000d86:	1c04      	adds	r4, r0, #0
 8000d88:	f7ff fff0 	bl	8000d6c <timer_get_time>
 8000d8c:	1904      	adds	r4, r0, r4
 8000d8e:	9401      	str	r4, [sp, #4]
 8000d90:	9c01      	ldr	r4, [sp, #4]
 8000d92:	f7ff ffeb 	bl	8000d6c <timer_get_time>
 8000d96:	4284      	cmp	r4, r0
 8000d98:	d902      	bls.n	8000da0 <timer_delay_ms+0x1c>
 8000d9a:	f000 f979 	bl	8001090 <sleep>
 8000d9e:	e7f7      	b.n	8000d90 <timer_delay_ms+0xc>
 8000da0:	bd13      	pop	{r0, r1, r4, pc}
	...

08000da4 <event_timer_set_period>:
 8000da4:	b672      	cpsid	i
 8000da6:	4b05      	ldr	r3, [pc, #20]	; (8000dbc <event_timer_set_period+0x18>)
 8000da8:	0040      	lsls	r0, r0, #1
 8000daa:	52c1      	strh	r1, [r0, r3]
 8000dac:	4b04      	ldr	r3, [pc, #16]	; (8000dc0 <event_timer_set_period+0x1c>)
 8000dae:	2200      	movs	r2, #0
 8000db0:	52c1      	strh	r1, [r0, r3]
 8000db2:	4b04      	ldr	r3, [pc, #16]	; (8000dc4 <event_timer_set_period+0x20>)
 8000db4:	52c2      	strh	r2, [r0, r3]
 8000db6:	b662      	cpsie	i
 8000db8:	4770      	bx	lr
 8000dba:	46c0      	nop			; (mov r8, r8)
 8000dbc:	20000790 	.word	0x20000790
 8000dc0:	20000784 	.word	0x20000784
 8000dc4:	2000077c 	.word	0x2000077c

08000dc8 <event_timer_get_flag>:
 8000dc8:	b082      	sub	sp, #8
 8000dca:	b672      	cpsid	i
 8000dcc:	4b04      	ldr	r3, [pc, #16]	; (8000de0 <event_timer_get_flag+0x18>)
 8000dce:	0040      	lsls	r0, r0, #1
 8000dd0:	5ac3      	ldrh	r3, [r0, r3]
 8000dd2:	b29b      	uxth	r3, r3
 8000dd4:	9301      	str	r3, [sp, #4]
 8000dd6:	b662      	cpsie	i
 8000dd8:	9801      	ldr	r0, [sp, #4]
 8000dda:	b002      	add	sp, #8
 8000ddc:	4770      	bx	lr
 8000dde:	46c0      	nop			; (mov r8, r8)
 8000de0:	2000077c 	.word	0x2000077c

08000de4 <event_timer_clear_flag>:
 8000de4:	b672      	cpsid	i
 8000de6:	4b03      	ldr	r3, [pc, #12]	; (8000df4 <event_timer_clear_flag+0x10>)
 8000de8:	0040      	lsls	r0, r0, #1
 8000dea:	2200      	movs	r2, #0
 8000dec:	52c2      	strh	r2, [r0, r3]
 8000dee:	b662      	cpsie	i
 8000df0:	4770      	bx	lr
 8000df2:	46c0      	nop			; (mov r8, r8)
 8000df4:	2000077c 	.word	0x2000077c

08000df8 <uart_write>:
 8000df8:	4b03      	ldr	r3, [pc, #12]	; (8000e08 <uart_write+0x10>)
 8000dfa:	69da      	ldr	r2, [r3, #28]
 8000dfc:	0611      	lsls	r1, r2, #24
 8000dfe:	d401      	bmi.n	8000e04 <uart_write+0xc>
 8000e00:	46c0      	nop			; (mov r8, r8)
 8000e02:	e7f9      	b.n	8000df8 <uart_write>
 8000e04:	8518      	strh	r0, [r3, #40]	; 0x28
 8000e06:	4770      	bx	lr
 8000e08:	40013800 	.word	0x40013800

08000e0c <uart_init>:
 8000e0c:	b570      	push	{r4, r5, r6, lr}
 8000e0e:	2080      	movs	r0, #128	; 0x80
 8000e10:	b088      	sub	sp, #32
 8000e12:	0280      	lsls	r0, r0, #10
 8000e14:	2101      	movs	r1, #1
 8000e16:	f000 fe07 	bl	8001a28 <RCC_AHBPeriphClockCmd>
 8000e1a:	2690      	movs	r6, #144	; 0x90
 8000e1c:	2080      	movs	r0, #128	; 0x80
 8000e1e:	05f6      	lsls	r6, r6, #23
 8000e20:	01c0      	lsls	r0, r0, #7
 8000e22:	2101      	movs	r1, #1
 8000e24:	f000 fe20 	bl	8001a68 <RCC_APB2PeriphClockCmd>
 8000e28:	1c30      	adds	r0, r6, #0
 8000e2a:	2102      	movs	r1, #2
 8000e2c:	2201      	movs	r2, #1
 8000e2e:	f000 fa1f 	bl	8001270 <GPIO_PinAFConfig>
 8000e32:	1c30      	adds	r0, r6, #0
 8000e34:	210f      	movs	r1, #15
 8000e36:	2201      	movs	r2, #1
 8000e38:	f000 fa1a 	bl	8001270 <GPIO_PinAFConfig>
 8000e3c:	4b10      	ldr	r3, [pc, #64]	; (8000e80 <uart_init+0x74>)
 8000e3e:	466a      	mov	r2, sp
 8000e40:	2400      	movs	r4, #0
 8000e42:	2501      	movs	r5, #1
 8000e44:	9300      	str	r3, [sp, #0]
 8000e46:	1c30      	adds	r0, r6, #0
 8000e48:	2302      	movs	r3, #2
 8000e4a:	4669      	mov	r1, sp
 8000e4c:	7113      	strb	r3, [r2, #4]
 8000e4e:	7194      	strb	r4, [r2, #6]
 8000e50:	7155      	strb	r5, [r2, #5]
 8000e52:	71d5      	strb	r5, [r2, #7]
 8000e54:	f000 f988 	bl	8001168 <GPIO_Init>
 8000e58:	9403      	str	r4, [sp, #12]
 8000e5a:	9404      	str	r4, [sp, #16]
 8000e5c:	9405      	str	r4, [sp, #20]
 8000e5e:	9407      	str	r4, [sp, #28]
 8000e60:	23e1      	movs	r3, #225	; 0xe1
 8000e62:	4c08      	ldr	r4, [pc, #32]	; (8000e84 <uart_init+0x78>)
 8000e64:	025b      	lsls	r3, r3, #9
 8000e66:	9302      	str	r3, [sp, #8]
 8000e68:	1c20      	adds	r0, r4, #0
 8000e6a:	230c      	movs	r3, #12
 8000e6c:	a902      	add	r1, sp, #8
 8000e6e:	9306      	str	r3, [sp, #24]
 8000e70:	f000 fb5a 	bl	8001528 <USART_Init>
 8000e74:	1c20      	adds	r0, r4, #0
 8000e76:	1c29      	adds	r1, r5, #0
 8000e78:	f000 fc24 	bl	80016c4 <USART_Cmd>
 8000e7c:	b008      	add	sp, #32
 8000e7e:	bd70      	pop	{r4, r5, r6, pc}
 8000e80:	00008004 	.word	0x00008004
 8000e84:	40013800 	.word	0x40013800

08000e88 <USART1_IRQHandler>:
 8000e88:	b508      	push	{r3, lr}
 8000e8a:	4802      	ldr	r0, [pc, #8]	; (8000e94 <USART1_IRQHandler+0xc>)
 8000e8c:	4902      	ldr	r1, [pc, #8]	; (8000e98 <USART1_IRQHandler+0x10>)
 8000e8e:	f000 fc59 	bl	8001744 <USART_ClearITPendingBit>
 8000e92:	bd08      	pop	{r3, pc}
 8000e94:	40013800 	.word	0x40013800
 8000e98:	00050105 	.word	0x00050105

08000e9c <i2c_delay>:
 8000e9c:	46c0      	nop			; (mov r8, r8)
 8000e9e:	4770      	bx	lr

08000ea0 <SetLowSDA>:
 8000ea0:	b508      	push	{r3, lr}
 8000ea2:	b672      	cpsid	i
 8000ea4:	4b07      	ldr	r3, [pc, #28]	; (8000ec4 <SetLowSDA+0x24>)
 8000ea6:	2210      	movs	r2, #16
 8000ea8:	851a      	strh	r2, [r3, #40]	; 0x28
 8000eaa:	685a      	ldr	r2, [r3, #4]
 8000eac:	b292      	uxth	r2, r2
 8000eae:	809a      	strh	r2, [r3, #4]
 8000eb0:	6819      	ldr	r1, [r3, #0]
 8000eb2:	2280      	movs	r2, #128	; 0x80
 8000eb4:	0052      	lsls	r2, r2, #1
 8000eb6:	430a      	orrs	r2, r1
 8000eb8:	601a      	str	r2, [r3, #0]
 8000eba:	b662      	cpsie	i
 8000ebc:	f7ff ffee 	bl	8000e9c <i2c_delay>
 8000ec0:	bd08      	pop	{r3, pc}
 8000ec2:	46c0      	nop			; (mov r8, r8)
 8000ec4:	48000400 	.word	0x48000400

08000ec8 <SetHighSDA>:
 8000ec8:	b508      	push	{r3, lr}
 8000eca:	b672      	cpsid	i
 8000ecc:	4b07      	ldr	r3, [pc, #28]	; (8000eec <SetHighSDA+0x24>)
 8000ece:	2210      	movs	r2, #16
 8000ed0:	619a      	str	r2, [r3, #24]
 8000ed2:	6859      	ldr	r1, [r3, #4]
 8000ed4:	b289      	uxth	r1, r1
 8000ed6:	4391      	bics	r1, r2
 8000ed8:	8099      	strh	r1, [r3, #4]
 8000eda:	6819      	ldr	r1, [r3, #0]
 8000edc:	4a04      	ldr	r2, [pc, #16]	; (8000ef0 <SetHighSDA+0x28>)
 8000ede:	400a      	ands	r2, r1
 8000ee0:	601a      	str	r2, [r3, #0]
 8000ee2:	b662      	cpsie	i
 8000ee4:	f7ff ffda 	bl	8000e9c <i2c_delay>
 8000ee8:	bd08      	pop	{r3, pc}
 8000eea:	46c0      	nop			; (mov r8, r8)
 8000eec:	48000400 	.word	0x48000400
 8000ef0:	fffffcff 	.word	0xfffffcff

08000ef4 <SetLowSCL>:
 8000ef4:	b508      	push	{r3, lr}
 8000ef6:	4b03      	ldr	r3, [pc, #12]	; (8000f04 <SetLowSCL+0x10>)
 8000ef8:	2220      	movs	r2, #32
 8000efa:	851a      	strh	r2, [r3, #40]	; 0x28
 8000efc:	f7ff ffce 	bl	8000e9c <i2c_delay>
 8000f00:	bd08      	pop	{r3, pc}
 8000f02:	46c0      	nop			; (mov r8, r8)
 8000f04:	48000400 	.word	0x48000400

08000f08 <SetHighSCL>:
 8000f08:	b508      	push	{r3, lr}
 8000f0a:	4b03      	ldr	r3, [pc, #12]	; (8000f18 <SetHighSCL+0x10>)
 8000f0c:	2220      	movs	r2, #32
 8000f0e:	619a      	str	r2, [r3, #24]
 8000f10:	f7ff ffc4 	bl	8000e9c <i2c_delay>
 8000f14:	bd08      	pop	{r3, pc}
 8000f16:	46c0      	nop			; (mov r8, r8)
 8000f18:	48000400 	.word	0x48000400

08000f1c <i2c_0_init>:
 8000f1c:	b507      	push	{r0, r1, r2, lr}
 8000f1e:	2330      	movs	r3, #48	; 0x30
 8000f20:	4669      	mov	r1, sp
 8000f22:	9300      	str	r3, [sp, #0]
 8000f24:	2301      	movs	r3, #1
 8000f26:	710b      	strb	r3, [r1, #4]
 8000f28:	2203      	movs	r2, #3
 8000f2a:	2300      	movs	r3, #0
 8000f2c:	4806      	ldr	r0, [pc, #24]	; (8000f48 <i2c_0_init+0x2c>)
 8000f2e:	718b      	strb	r3, [r1, #6]
 8000f30:	714a      	strb	r2, [r1, #5]
 8000f32:	71cb      	strb	r3, [r1, #7]
 8000f34:	f000 f918 	bl	8001168 <GPIO_Init>
 8000f38:	f7ff ffe6 	bl	8000f08 <SetHighSCL>
 8000f3c:	f7ff ffb0 	bl	8000ea0 <SetLowSDA>
 8000f40:	f7ff ffc2 	bl	8000ec8 <SetHighSDA>
 8000f44:	bd07      	pop	{r0, r1, r2, pc}
 8000f46:	46c0      	nop			; (mov r8, r8)
 8000f48:	48000400 	.word	0x48000400

08000f4c <i2cStart>:
 8000f4c:	b508      	push	{r3, lr}
 8000f4e:	f7ff ffdb 	bl	8000f08 <SetHighSCL>
 8000f52:	f7ff ffb9 	bl	8000ec8 <SetHighSDA>
 8000f56:	f7ff ffd7 	bl	8000f08 <SetHighSCL>
 8000f5a:	f7ff ffa1 	bl	8000ea0 <SetLowSDA>
 8000f5e:	f7ff ffc9 	bl	8000ef4 <SetLowSCL>
 8000f62:	f7ff ffb1 	bl	8000ec8 <SetHighSDA>
 8000f66:	bd08      	pop	{r3, pc}

08000f68 <i2cStop>:
 8000f68:	b508      	push	{r3, lr}
 8000f6a:	f7ff ffc3 	bl	8000ef4 <SetLowSCL>
 8000f6e:	f7ff ff97 	bl	8000ea0 <SetLowSDA>
 8000f72:	f7ff ffc9 	bl	8000f08 <SetHighSCL>
 8000f76:	f7ff ff93 	bl	8000ea0 <SetLowSDA>
 8000f7a:	f7ff ffc5 	bl	8000f08 <SetHighSCL>
 8000f7e:	f7ff ffa3 	bl	8000ec8 <SetHighSDA>
 8000f82:	bd08      	pop	{r3, pc}

08000f84 <i2cWrite>:
 8000f84:	b538      	push	{r3, r4, r5, lr}
 8000f86:	1c05      	adds	r5, r0, #0
 8000f88:	2408      	movs	r4, #8
 8000f8a:	f7ff ffb3 	bl	8000ef4 <SetLowSCL>
 8000f8e:	b26b      	sxtb	r3, r5
 8000f90:	2b00      	cmp	r3, #0
 8000f92:	da02      	bge.n	8000f9a <i2cWrite+0x16>
 8000f94:	f7ff ff98 	bl	8000ec8 <SetHighSDA>
 8000f98:	e001      	b.n	8000f9e <i2cWrite+0x1a>
 8000f9a:	f7ff ff81 	bl	8000ea0 <SetLowSDA>
 8000f9e:	3c01      	subs	r4, #1
 8000fa0:	006d      	lsls	r5, r5, #1
 8000fa2:	b2e4      	uxtb	r4, r4
 8000fa4:	f7ff ffb0 	bl	8000f08 <SetHighSCL>
 8000fa8:	b2ed      	uxtb	r5, r5
 8000faa:	2c00      	cmp	r4, #0
 8000fac:	d1ed      	bne.n	8000f8a <i2cWrite+0x6>
 8000fae:	f7ff ffa1 	bl	8000ef4 <SetLowSCL>
 8000fb2:	f7ff ff89 	bl	8000ec8 <SetHighSDA>
 8000fb6:	f7ff ffa7 	bl	8000f08 <SetHighSCL>
 8000fba:	4b05      	ldr	r3, [pc, #20]	; (8000fd0 <i2cWrite+0x4c>)
 8000fbc:	691c      	ldr	r4, [r3, #16]
 8000fbe:	f7ff ff99 	bl	8000ef4 <SetLowSCL>
 8000fc2:	b2a4      	uxth	r4, r4
 8000fc4:	f7ff ff6a 	bl	8000e9c <i2c_delay>
 8000fc8:	0924      	lsrs	r4, r4, #4
 8000fca:	2001      	movs	r0, #1
 8000fcc:	43a0      	bics	r0, r4
 8000fce:	bd38      	pop	{r3, r4, r5, pc}
 8000fd0:	48000400 	.word	0x48000400

08000fd4 <i2cRead>:
 8000fd4:	b570      	push	{r4, r5, r6, lr}
 8000fd6:	1c06      	adds	r6, r0, #0
 8000fd8:	f7ff ff8c 	bl	8000ef4 <SetLowSCL>
 8000fdc:	f7ff ff74 	bl	8000ec8 <SetHighSDA>
 8000fe0:	2508      	movs	r5, #8
 8000fe2:	2400      	movs	r4, #0
 8000fe4:	f7ff ff90 	bl	8000f08 <SetHighSCL>
 8000fe8:	4b0c      	ldr	r3, [pc, #48]	; (800101c <i2cRead+0x48>)
 8000fea:	0064      	lsls	r4, r4, #1
 8000fec:	691b      	ldr	r3, [r3, #16]
 8000fee:	b2e4      	uxtb	r4, r4
 8000ff0:	06da      	lsls	r2, r3, #27
 8000ff2:	d501      	bpl.n	8000ff8 <i2cRead+0x24>
 8000ff4:	3401      	adds	r4, #1
 8000ff6:	b2e4      	uxtb	r4, r4
 8000ff8:	3d01      	subs	r5, #1
 8000ffa:	b2ed      	uxtb	r5, r5
 8000ffc:	f7ff ff7a 	bl	8000ef4 <SetLowSCL>
 8001000:	2d00      	cmp	r5, #0
 8001002:	d1ef      	bne.n	8000fe4 <i2cRead+0x10>
 8001004:	2e00      	cmp	r6, #0
 8001006:	d001      	beq.n	800100c <i2cRead+0x38>
 8001008:	f7ff ff4a 	bl	8000ea0 <SetLowSDA>
 800100c:	f7ff ff7c 	bl	8000f08 <SetHighSCL>
 8001010:	f7ff ff70 	bl	8000ef4 <SetLowSCL>
 8001014:	f7ff ff42 	bl	8000e9c <i2c_delay>
 8001018:	1c20      	adds	r0, r4, #0
 800101a:	bd70      	pop	{r4, r5, r6, pc}
 800101c:	48000400 	.word	0x48000400

08001020 <i2c_write_reg>:
 8001020:	b570      	push	{r4, r5, r6, lr}
 8001022:	1c06      	adds	r6, r0, #0
 8001024:	1c0d      	adds	r5, r1, #0
 8001026:	1c14      	adds	r4, r2, #0
 8001028:	f7ff ff90 	bl	8000f4c <i2cStart>
 800102c:	1c30      	adds	r0, r6, #0
 800102e:	f7ff ffa9 	bl	8000f84 <i2cWrite>
 8001032:	1c28      	adds	r0, r5, #0
 8001034:	f7ff ffa6 	bl	8000f84 <i2cWrite>
 8001038:	1c20      	adds	r0, r4, #0
 800103a:	f7ff ffa3 	bl	8000f84 <i2cWrite>
 800103e:	f7ff ff93 	bl	8000f68 <i2cStop>
 8001042:	bd70      	pop	{r4, r5, r6, pc}

08001044 <i2c_read_reg>:
 8001044:	b538      	push	{r3, r4, r5, lr}
 8001046:	1c04      	adds	r4, r0, #0
 8001048:	1c0d      	adds	r5, r1, #0
 800104a:	f7ff ff7f 	bl	8000f4c <i2cStart>
 800104e:	1c20      	adds	r0, r4, #0
 8001050:	f7ff ff98 	bl	8000f84 <i2cWrite>
 8001054:	1c28      	adds	r0, r5, #0
 8001056:	f7ff ff95 	bl	8000f84 <i2cWrite>
 800105a:	f7ff ff77 	bl	8000f4c <i2cStart>
 800105e:	2001      	movs	r0, #1
 8001060:	4320      	orrs	r0, r4
 8001062:	f7ff ff8f 	bl	8000f84 <i2cWrite>
 8001066:	2000      	movs	r0, #0
 8001068:	f7ff ffb4 	bl	8000fd4 <i2cRead>
 800106c:	1c04      	adds	r4, r0, #0
 800106e:	f7ff ff7b 	bl	8000f68 <i2cStop>
 8001072:	1c20      	adds	r0, r4, #0
 8001074:	bd38      	pop	{r3, r4, r5, pc}

08001076 <assert_param>:
 8001076:	4770      	bx	lr

08001078 <sys_tick_init>:
 8001078:	4b03      	ldr	r3, [pc, #12]	; (8001088 <sys_tick_init+0x10>)
 800107a:	4a04      	ldr	r2, [pc, #16]	; (800108c <sys_tick_init+0x14>)
 800107c:	605a      	str	r2, [r3, #4]
 800107e:	2200      	movs	r2, #0
 8001080:	609a      	str	r2, [r3, #8]
 8001082:	2207      	movs	r2, #7
 8001084:	601a      	str	r2, [r3, #0]
 8001086:	4770      	bx	lr
 8001088:	e000e010 	.word	0xe000e010
 800108c:	0000bb80 	.word	0x0000bb80

08001090 <sleep>:
 8001090:	bf30      	wfi
 8001092:	4770      	bx	lr

08001094 <SystemInit>:
 8001094:	4b26      	ldr	r3, [pc, #152]	; (8001130 <SystemInit+0x9c>)
 8001096:	2201      	movs	r2, #1
 8001098:	6819      	ldr	r1, [r3, #0]
 800109a:	b082      	sub	sp, #8
 800109c:	4311      	orrs	r1, r2
 800109e:	6019      	str	r1, [r3, #0]
 80010a0:	6858      	ldr	r0, [r3, #4]
 80010a2:	4924      	ldr	r1, [pc, #144]	; (8001134 <SystemInit+0xa0>)
 80010a4:	4001      	ands	r1, r0
 80010a6:	6059      	str	r1, [r3, #4]
 80010a8:	6818      	ldr	r0, [r3, #0]
 80010aa:	4923      	ldr	r1, [pc, #140]	; (8001138 <SystemInit+0xa4>)
 80010ac:	4001      	ands	r1, r0
 80010ae:	6019      	str	r1, [r3, #0]
 80010b0:	6818      	ldr	r0, [r3, #0]
 80010b2:	4922      	ldr	r1, [pc, #136]	; (800113c <SystemInit+0xa8>)
 80010b4:	4001      	ands	r1, r0
 80010b6:	6019      	str	r1, [r3, #0]
 80010b8:	6858      	ldr	r0, [r3, #4]
 80010ba:	4921      	ldr	r1, [pc, #132]	; (8001140 <SystemInit+0xac>)
 80010bc:	4001      	ands	r1, r0
 80010be:	6059      	str	r1, [r3, #4]
 80010c0:	6ad9      	ldr	r1, [r3, #44]	; 0x2c
 80010c2:	200f      	movs	r0, #15
 80010c4:	4381      	bics	r1, r0
 80010c6:	62d9      	str	r1, [r3, #44]	; 0x2c
 80010c8:	6b18      	ldr	r0, [r3, #48]	; 0x30
 80010ca:	491e      	ldr	r1, [pc, #120]	; (8001144 <SystemInit+0xb0>)
 80010cc:	4001      	ands	r1, r0
 80010ce:	6319      	str	r1, [r3, #48]	; 0x30
 80010d0:	6b59      	ldr	r1, [r3, #52]	; 0x34
 80010d2:	4391      	bics	r1, r2
 80010d4:	2200      	movs	r2, #0
 80010d6:	6359      	str	r1, [r3, #52]	; 0x34
 80010d8:	609a      	str	r2, [r3, #8]
 80010da:	9200      	str	r2, [sp, #0]
 80010dc:	9201      	str	r2, [sp, #4]
 80010de:	4a1a      	ldr	r2, [pc, #104]	; (8001148 <SystemInit+0xb4>)
 80010e0:	2111      	movs	r1, #17
 80010e2:	6011      	str	r1, [r2, #0]
 80010e4:	685a      	ldr	r2, [r3, #4]
 80010e6:	605a      	str	r2, [r3, #4]
 80010e8:	685a      	ldr	r2, [r3, #4]
 80010ea:	605a      	str	r2, [r3, #4]
 80010ec:	6859      	ldr	r1, [r3, #4]
 80010ee:	4a17      	ldr	r2, [pc, #92]	; (800114c <SystemInit+0xb8>)
 80010f0:	400a      	ands	r2, r1
 80010f2:	605a      	str	r2, [r3, #4]
 80010f4:	6859      	ldr	r1, [r3, #4]
 80010f6:	22a0      	movs	r2, #160	; 0xa0
 80010f8:	0392      	lsls	r2, r2, #14
 80010fa:	430a      	orrs	r2, r1
 80010fc:	605a      	str	r2, [r3, #4]
 80010fe:	6819      	ldr	r1, [r3, #0]
 8001100:	2280      	movs	r2, #128	; 0x80
 8001102:	0452      	lsls	r2, r2, #17
 8001104:	430a      	orrs	r2, r1
 8001106:	601a      	str	r2, [r3, #0]
 8001108:	6819      	ldr	r1, [r3, #0]
 800110a:	4a09      	ldr	r2, [pc, #36]	; (8001130 <SystemInit+0x9c>)
 800110c:	0188      	lsls	r0, r1, #6
 800110e:	d5fb      	bpl.n	8001108 <SystemInit+0x74>
 8001110:	6851      	ldr	r1, [r2, #4]
 8001112:	2003      	movs	r0, #3
 8001114:	4381      	bics	r1, r0
 8001116:	6051      	str	r1, [r2, #4]
 8001118:	6851      	ldr	r1, [r2, #4]
 800111a:	2002      	movs	r0, #2
 800111c:	4301      	orrs	r1, r0
 800111e:	6051      	str	r1, [r2, #4]
 8001120:	6859      	ldr	r1, [r3, #4]
 8001122:	220c      	movs	r2, #12
 8001124:	400a      	ands	r2, r1
 8001126:	2a08      	cmp	r2, #8
 8001128:	d1fa      	bne.n	8001120 <SystemInit+0x8c>
 800112a:	b002      	add	sp, #8
 800112c:	4770      	bx	lr
 800112e:	46c0      	nop			; (mov r8, r8)
 8001130:	40021000 	.word	0x40021000
 8001134:	f8ffb80c 	.word	0xf8ffb80c
 8001138:	fef6ffff 	.word	0xfef6ffff
 800113c:	fffbffff 	.word	0xfffbffff
 8001140:	ffc0ffff 	.word	0xffc0ffff
 8001144:	fffffeac 	.word	0xfffffeac
 8001148:	40022000 	.word	0x40022000
 800114c:	ffc07fff 	.word	0xffc07fff

08001150 <lib_low_level_init>:
 8001150:	b508      	push	{r3, lr}
 8001152:	f7ff ff9f 	bl	8001094 <SystemInit>
 8001156:	f000 fcc7 	bl	8001ae8 <gpio_init>
 800115a:	f7ff fe57 	bl	8000e0c <uart_init>
 800115e:	f7ff fd9d 	bl	8000c9c <timer_init>
 8001162:	f7ff fedb 	bl	8000f1c <i2c_0_init>
 8001166:	bd08      	pop	{r3, pc}

08001168 <GPIO_Init>:
 8001168:	2390      	movs	r3, #144	; 0x90
 800116a:	b5f7      	push	{r0, r1, r2, r4, r5, r6, r7, lr}
 800116c:	05db      	lsls	r3, r3, #23
 800116e:	1c04      	adds	r4, r0, #0
 8001170:	1c0d      	adds	r5, r1, #0
 8001172:	4298      	cmp	r0, r3
 8001174:	d010      	beq.n	8001198 <GPIO_Init+0x30>
 8001176:	4b39      	ldr	r3, [pc, #228]	; (800125c <GPIO_Init+0xf4>)
 8001178:	4298      	cmp	r0, r3
 800117a:	d00d      	beq.n	8001198 <GPIO_Init+0x30>
 800117c:	4b38      	ldr	r3, [pc, #224]	; (8001260 <GPIO_Init+0xf8>)
 800117e:	4298      	cmp	r0, r3
 8001180:	d00a      	beq.n	8001198 <GPIO_Init+0x30>
 8001182:	4b38      	ldr	r3, [pc, #224]	; (8001264 <GPIO_Init+0xfc>)
 8001184:	4298      	cmp	r0, r3
 8001186:	d007      	beq.n	8001198 <GPIO_Init+0x30>
 8001188:	4b37      	ldr	r3, [pc, #220]	; (8001268 <GPIO_Init+0x100>)
 800118a:	4298      	cmp	r0, r3
 800118c:	d004      	beq.n	8001198 <GPIO_Init+0x30>
 800118e:	4a37      	ldr	r2, [pc, #220]	; (800126c <GPIO_Init+0x104>)
 8001190:	1880      	adds	r0, r0, r2
 8001192:	4243      	negs	r3, r0
 8001194:	4158      	adcs	r0, r3
 8001196:	e000      	b.n	800119a <GPIO_Init+0x32>
 8001198:	2001      	movs	r0, #1
 800119a:	f7ff ff6c 	bl	8001076 <assert_param>
 800119e:	6828      	ldr	r0, [r5, #0]
 80011a0:	2600      	movs	r6, #0
 80011a2:	1e43      	subs	r3, r0, #1
 80011a4:	4198      	sbcs	r0, r3
 80011a6:	f7ff ff66 	bl	8001076 <assert_param>
 80011aa:	792b      	ldrb	r3, [r5, #4]
 80011ac:	2203      	movs	r2, #3
 80011ae:	1c30      	adds	r0, r6, #0
 80011b0:	429a      	cmp	r2, r3
 80011b2:	4170      	adcs	r0, r6
 80011b4:	f7ff ff5f 	bl	8001076 <assert_param>
 80011b8:	79eb      	ldrb	r3, [r5, #7]
 80011ba:	2202      	movs	r2, #2
 80011bc:	1c30      	adds	r0, r6, #0
 80011be:	429a      	cmp	r2, r3
 80011c0:	4170      	adcs	r0, r6
 80011c2:	f7ff ff58 	bl	8001076 <assert_param>
 80011c6:	2001      	movs	r0, #1
 80011c8:	1c03      	adds	r3, r0, #0
 80011ca:	682a      	ldr	r2, [r5, #0]
 80011cc:	40b3      	lsls	r3, r6
 80011ce:	401a      	ands	r2, r3
 80011d0:	9201      	str	r2, [sp, #4]
 80011d2:	429a      	cmp	r2, r3
 80011d4:	d13d      	bne.n	8001252 <GPIO_Init+0xea>
 80011d6:	792b      	ldrb	r3, [r5, #4]
 80011d8:	0077      	lsls	r7, r6, #1
 80011da:	3b01      	subs	r3, #1
 80011dc:	b2db      	uxtb	r3, r3
 80011de:	4283      	cmp	r3, r0
 80011e0:	d823      	bhi.n	800122a <GPIO_Init+0xc2>
 80011e2:	796b      	ldrb	r3, [r5, #5]
 80011e4:	4283      	cmp	r3, r0
 80011e6:	d902      	bls.n	80011ee <GPIO_Init+0x86>
 80011e8:	1ed8      	subs	r0, r3, #3
 80011ea:	4243      	negs	r3, r0
 80011ec:	4158      	adcs	r0, r3
 80011ee:	f7ff ff42 	bl	8001076 <assert_param>
 80011f2:	68a3      	ldr	r3, [r4, #8]
 80011f4:	2203      	movs	r2, #3
 80011f6:	40ba      	lsls	r2, r7
 80011f8:	4393      	bics	r3, r2
 80011fa:	60a3      	str	r3, [r4, #8]
 80011fc:	796b      	ldrb	r3, [r5, #5]
 80011fe:	68a2      	ldr	r2, [r4, #8]
 8001200:	40bb      	lsls	r3, r7
 8001202:	4313      	orrs	r3, r2
 8001204:	60a3      	str	r3, [r4, #8]
 8001206:	79ab      	ldrb	r3, [r5, #6]
 8001208:	2201      	movs	r2, #1
 800120a:	2000      	movs	r0, #0
 800120c:	429a      	cmp	r2, r3
 800120e:	4140      	adcs	r0, r0
 8001210:	f7ff ff31 	bl	8001076 <assert_param>
 8001214:	6863      	ldr	r3, [r4, #4]
 8001216:	9a01      	ldr	r2, [sp, #4]
 8001218:	b29b      	uxth	r3, r3
 800121a:	4393      	bics	r3, r2
 800121c:	80a3      	strh	r3, [r4, #4]
 800121e:	79ab      	ldrb	r3, [r5, #6]
 8001220:	6862      	ldr	r2, [r4, #4]
 8001222:	40b3      	lsls	r3, r6
 8001224:	4313      	orrs	r3, r2
 8001226:	b29b      	uxth	r3, r3
 8001228:	80a3      	strh	r3, [r4, #4]
 800122a:	2303      	movs	r3, #3
 800122c:	6822      	ldr	r2, [r4, #0]
 800122e:	40bb      	lsls	r3, r7
 8001230:	43db      	mvns	r3, r3
 8001232:	401a      	ands	r2, r3
 8001234:	6022      	str	r2, [r4, #0]
 8001236:	792a      	ldrb	r2, [r5, #4]
 8001238:	6821      	ldr	r1, [r4, #0]
 800123a:	40ba      	lsls	r2, r7
 800123c:	430a      	orrs	r2, r1
 800123e:	6022      	str	r2, [r4, #0]
 8001240:	68e2      	ldr	r2, [r4, #12]
 8001242:	4013      	ands	r3, r2
 8001244:	79ea      	ldrb	r2, [r5, #7]
 8001246:	60e3      	str	r3, [r4, #12]
 8001248:	68e3      	ldr	r3, [r4, #12]
 800124a:	40ba      	lsls	r2, r7
 800124c:	1c17      	adds	r7, r2, #0
 800124e:	431f      	orrs	r7, r3
 8001250:	60e7      	str	r7, [r4, #12]
 8001252:	3601      	adds	r6, #1
 8001254:	2e10      	cmp	r6, #16
 8001256:	d1b6      	bne.n	80011c6 <GPIO_Init+0x5e>
 8001258:	bdf7      	pop	{r0, r1, r2, r4, r5, r6, r7, pc}
 800125a:	46c0      	nop			; (mov r8, r8)
 800125c:	48000400 	.word	0x48000400
 8001260:	48000800 	.word	0x48000800
 8001264:	48000c00 	.word	0x48000c00
 8001268:	48001000 	.word	0x48001000
 800126c:	b7ffec00 	.word	0xb7ffec00

08001270 <GPIO_PinAFConfig>:
 8001270:	b5f7      	push	{r0, r1, r2, r4, r5, r6, r7, lr}
 8001272:	2390      	movs	r3, #144	; 0x90
 8001274:	1c04      	adds	r4, r0, #0
 8001276:	1c0e      	adds	r6, r1, #0
 8001278:	9201      	str	r2, [sp, #4]
 800127a:	05db      	lsls	r3, r3, #23
 800127c:	4298      	cmp	r0, r3
 800127e:	d010      	beq.n	80012a2 <GPIO_PinAFConfig+0x32>
 8001280:	4b19      	ldr	r3, [pc, #100]	; (80012e8 <GPIO_PinAFConfig+0x78>)
 8001282:	4298      	cmp	r0, r3
 8001284:	d00d      	beq.n	80012a2 <GPIO_PinAFConfig+0x32>
 8001286:	4b19      	ldr	r3, [pc, #100]	; (80012ec <GPIO_PinAFConfig+0x7c>)
 8001288:	4298      	cmp	r0, r3
 800128a:	d00a      	beq.n	80012a2 <GPIO_PinAFConfig+0x32>
 800128c:	4b18      	ldr	r3, [pc, #96]	; (80012f0 <GPIO_PinAFConfig+0x80>)
 800128e:	4298      	cmp	r0, r3
 8001290:	d007      	beq.n	80012a2 <GPIO_PinAFConfig+0x32>
 8001292:	4b18      	ldr	r3, [pc, #96]	; (80012f4 <GPIO_PinAFConfig+0x84>)
 8001294:	4298      	cmp	r0, r3
 8001296:	d004      	beq.n	80012a2 <GPIO_PinAFConfig+0x32>
 8001298:	4a17      	ldr	r2, [pc, #92]	; (80012f8 <GPIO_PinAFConfig+0x88>)
 800129a:	1880      	adds	r0, r0, r2
 800129c:	4243      	negs	r3, r0
 800129e:	4158      	adcs	r0, r3
 80012a0:	e000      	b.n	80012a4 <GPIO_PinAFConfig+0x34>
 80012a2:	2001      	movs	r0, #1
 80012a4:	2500      	movs	r5, #0
 80012a6:	f7ff fee6 	bl	8001076 <assert_param>
 80012aa:	230f      	movs	r3, #15
 80012ac:	1c28      	adds	r0, r5, #0
 80012ae:	42b3      	cmp	r3, r6
 80012b0:	4168      	adcs	r0, r5
 80012b2:	f7ff fee0 	bl	8001076 <assert_param>
 80012b6:	9a01      	ldr	r2, [sp, #4]
 80012b8:	1c28      	adds	r0, r5, #0
 80012ba:	2707      	movs	r7, #7
 80012bc:	4297      	cmp	r7, r2
 80012be:	4168      	adcs	r0, r5
 80012c0:	4037      	ands	r7, r6
 80012c2:	08f6      	lsrs	r6, r6, #3
 80012c4:	00b6      	lsls	r6, r6, #2
 80012c6:	19a4      	adds	r4, r4, r6
 80012c8:	f7ff fed5 	bl	8001076 <assert_param>
 80012cc:	00bf      	lsls	r7, r7, #2
 80012ce:	6a23      	ldr	r3, [r4, #32]
 80012d0:	220f      	movs	r2, #15
 80012d2:	40ba      	lsls	r2, r7
 80012d4:	4393      	bics	r3, r2
 80012d6:	9a01      	ldr	r2, [sp, #4]
 80012d8:	6223      	str	r3, [r4, #32]
 80012da:	6a23      	ldr	r3, [r4, #32]
 80012dc:	40ba      	lsls	r2, r7
 80012de:	1c17      	adds	r7, r2, #0
 80012e0:	431f      	orrs	r7, r3
 80012e2:	6227      	str	r7, [r4, #32]
 80012e4:	bdf7      	pop	{r0, r1, r2, r4, r5, r6, r7, pc}
 80012e6:	46c0      	nop			; (mov r8, r8)
 80012e8:	48000400 	.word	0x48000400
 80012ec:	48000800 	.word	0x48000800
 80012f0:	48000c00 	.word	0x48000c00
 80012f4:	48001000 	.word	0x48001000
 80012f8:	b7ffec00 	.word	0xb7ffec00

080012fc <TIM_TimeBaseInit>:
 80012fc:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
 80012fe:	4e34      	ldr	r6, [pc, #208]	; (80013d0 <TIM_TimeBaseInit+0xd4>)
 8001300:	1c04      	adds	r4, r0, #0
 8001302:	1c0d      	adds	r5, r1, #0
 8001304:	4f33      	ldr	r7, [pc, #204]	; (80013d4 <TIM_TimeBaseInit+0xd8>)
 8001306:	42b0      	cmp	r0, r6
 8001308:	d019      	beq.n	800133e <TIM_TimeBaseInit+0x42>
 800130a:	2380      	movs	r3, #128	; 0x80
 800130c:	05db      	lsls	r3, r3, #23
 800130e:	4298      	cmp	r0, r3
 8001310:	d015      	beq.n	800133e <TIM_TimeBaseInit+0x42>
 8001312:	4b31      	ldr	r3, [pc, #196]	; (80013d8 <TIM_TimeBaseInit+0xdc>)
 8001314:	4298      	cmp	r0, r3
 8001316:	d012      	beq.n	800133e <TIM_TimeBaseInit+0x42>
 8001318:	42b8      	cmp	r0, r7
 800131a:	d010      	beq.n	800133e <TIM_TimeBaseInit+0x42>
 800131c:	4b2f      	ldr	r3, [pc, #188]	; (80013dc <TIM_TimeBaseInit+0xe0>)
 800131e:	4298      	cmp	r0, r3
 8001320:	d00d      	beq.n	800133e <TIM_TimeBaseInit+0x42>
 8001322:	4b2f      	ldr	r3, [pc, #188]	; (80013e0 <TIM_TimeBaseInit+0xe4>)
 8001324:	4298      	cmp	r0, r3
 8001326:	d00a      	beq.n	800133e <TIM_TimeBaseInit+0x42>
 8001328:	4b2e      	ldr	r3, [pc, #184]	; (80013e4 <TIM_TimeBaseInit+0xe8>)
 800132a:	4298      	cmp	r0, r3
 800132c:	d007      	beq.n	800133e <TIM_TimeBaseInit+0x42>
 800132e:	4b2e      	ldr	r3, [pc, #184]	; (80013e8 <TIM_TimeBaseInit+0xec>)
 8001330:	4298      	cmp	r0, r3
 8001332:	d004      	beq.n	800133e <TIM_TimeBaseInit+0x42>
 8001334:	492d      	ldr	r1, [pc, #180]	; (80013ec <TIM_TimeBaseInit+0xf0>)
 8001336:	1840      	adds	r0, r0, r1
 8001338:	4243      	negs	r3, r0
 800133a:	4158      	adcs	r0, r3
 800133c:	e000      	b.n	8001340 <TIM_TimeBaseInit+0x44>
 800133e:	2001      	movs	r0, #1
 8001340:	f7ff fe99 	bl	8001076 <assert_param>
 8001344:	886b      	ldrh	r3, [r5, #2]
 8001346:	2210      	movs	r2, #16
 8001348:	1c19      	adds	r1, r3, #0
 800134a:	4391      	bics	r1, r2
 800134c:	d101      	bne.n	8001352 <TIM_TimeBaseInit+0x56>
 800134e:	2001      	movs	r0, #1
 8001350:	e007      	b.n	8001362 <TIM_TimeBaseInit+0x66>
 8001352:	2240      	movs	r2, #64	; 0x40
 8001354:	1c19      	adds	r1, r3, #0
 8001356:	4391      	bics	r1, r2
 8001358:	2920      	cmp	r1, #32
 800135a:	d0f8      	beq.n	800134e <TIM_TimeBaseInit+0x52>
 800135c:	2b40      	cmp	r3, #64	; 0x40
 800135e:	d0f6      	beq.n	800134e <TIM_TimeBaseInit+0x52>
 8001360:	2000      	movs	r0, #0
 8001362:	f7ff fe88 	bl	8001076 <assert_param>
 8001366:	892b      	ldrh	r3, [r5, #8]
 8001368:	4a21      	ldr	r2, [pc, #132]	; (80013f0 <TIM_TimeBaseInit+0xf4>)
 800136a:	2001      	movs	r0, #1
 800136c:	4213      	tst	r3, r2
 800136e:	d003      	beq.n	8001378 <TIM_TimeBaseInit+0x7c>
 8001370:	4a20      	ldr	r2, [pc, #128]	; (80013f4 <TIM_TimeBaseInit+0xf8>)
 8001372:	1898      	adds	r0, r3, r2
 8001374:	4243      	negs	r3, r0
 8001376:	4158      	adcs	r0, r3
 8001378:	f7ff fe7d 	bl	8001076 <assert_param>
 800137c:	6823      	ldr	r3, [r4, #0]
 800137e:	b29b      	uxth	r3, r3
 8001380:	42b4      	cmp	r4, r6
 8001382:	d006      	beq.n	8001392 <TIM_TimeBaseInit+0x96>
 8001384:	2280      	movs	r2, #128	; 0x80
 8001386:	05d2      	lsls	r2, r2, #23
 8001388:	4294      	cmp	r4, r2
 800138a:	d002      	beq.n	8001392 <TIM_TimeBaseInit+0x96>
 800138c:	4a12      	ldr	r2, [pc, #72]	; (80013d8 <TIM_TimeBaseInit+0xdc>)
 800138e:	4294      	cmp	r4, r2
 8001390:	d103      	bne.n	800139a <TIM_TimeBaseInit+0x9e>
 8001392:	2270      	movs	r2, #112	; 0x70
 8001394:	4393      	bics	r3, r2
 8001396:	886a      	ldrh	r2, [r5, #2]
 8001398:	4313      	orrs	r3, r2
 800139a:	42bc      	cmp	r4, r7
 800139c:	d003      	beq.n	80013a6 <TIM_TimeBaseInit+0xaa>
 800139e:	4916      	ldr	r1, [pc, #88]	; (80013f8 <TIM_TimeBaseInit+0xfc>)
 80013a0:	892a      	ldrh	r2, [r5, #8]
 80013a2:	400b      	ands	r3, r1
 80013a4:	4313      	orrs	r3, r2
 80013a6:	8023      	strh	r3, [r4, #0]
 80013a8:	686b      	ldr	r3, [r5, #4]
 80013aa:	62e3      	str	r3, [r4, #44]	; 0x2c
 80013ac:	882b      	ldrh	r3, [r5, #0]
 80013ae:	8523      	strh	r3, [r4, #40]	; 0x28
 80013b0:	42b4      	cmp	r4, r6
 80013b2:	d008      	beq.n	80013c6 <TIM_TimeBaseInit+0xca>
 80013b4:	4b0b      	ldr	r3, [pc, #44]	; (80013e4 <TIM_TimeBaseInit+0xe8>)
 80013b6:	429c      	cmp	r4, r3
 80013b8:	d005      	beq.n	80013c6 <TIM_TimeBaseInit+0xca>
 80013ba:	4b0b      	ldr	r3, [pc, #44]	; (80013e8 <TIM_TimeBaseInit+0xec>)
 80013bc:	429c      	cmp	r4, r3
 80013be:	d002      	beq.n	80013c6 <TIM_TimeBaseInit+0xca>
 80013c0:	4b0e      	ldr	r3, [pc, #56]	; (80013fc <TIM_TimeBaseInit+0x100>)
 80013c2:	429c      	cmp	r4, r3
 80013c4:	d101      	bne.n	80013ca <TIM_TimeBaseInit+0xce>
 80013c6:	7aab      	ldrb	r3, [r5, #10]
 80013c8:	8623      	strh	r3, [r4, #48]	; 0x30
 80013ca:	2301      	movs	r3, #1
 80013cc:	82a3      	strh	r3, [r4, #20]
 80013ce:	bdf8      	pop	{r3, r4, r5, r6, r7, pc}
 80013d0:	40012c00 	.word	0x40012c00
 80013d4:	40001000 	.word	0x40001000
 80013d8:	40000400 	.word	0x40000400
 80013dc:	40001400 	.word	0x40001400
 80013e0:	40002000 	.word	0x40002000
 80013e4:	40014000 	.word	0x40014000
 80013e8:	40014400 	.word	0x40014400
 80013ec:	bffeb800 	.word	0xbffeb800
 80013f0:	fffffeff 	.word	0xfffffeff
 80013f4:	fffffe00 	.word	0xfffffe00
 80013f8:	fffffcff 	.word	0xfffffcff
 80013fc:	40014800 	.word	0x40014800

08001400 <TIM_Cmd>:
 8001400:	4b19      	ldr	r3, [pc, #100]	; (8001468 <TIM_Cmd+0x68>)
 8001402:	b570      	push	{r4, r5, r6, lr}
 8001404:	1c04      	adds	r4, r0, #0
 8001406:	1c0e      	adds	r6, r1, #0
 8001408:	4298      	cmp	r0, r3
 800140a:	d01a      	beq.n	8001442 <TIM_Cmd+0x42>
 800140c:	2380      	movs	r3, #128	; 0x80
 800140e:	05db      	lsls	r3, r3, #23
 8001410:	4298      	cmp	r0, r3
 8001412:	d016      	beq.n	8001442 <TIM_Cmd+0x42>
 8001414:	4b15      	ldr	r3, [pc, #84]	; (800146c <TIM_Cmd+0x6c>)
 8001416:	4298      	cmp	r0, r3
 8001418:	d013      	beq.n	8001442 <TIM_Cmd+0x42>
 800141a:	4b15      	ldr	r3, [pc, #84]	; (8001470 <TIM_Cmd+0x70>)
 800141c:	4298      	cmp	r0, r3
 800141e:	d010      	beq.n	8001442 <TIM_Cmd+0x42>
 8001420:	4b14      	ldr	r3, [pc, #80]	; (8001474 <TIM_Cmd+0x74>)
 8001422:	4298      	cmp	r0, r3
 8001424:	d00d      	beq.n	8001442 <TIM_Cmd+0x42>
 8001426:	4b14      	ldr	r3, [pc, #80]	; (8001478 <TIM_Cmd+0x78>)
 8001428:	4298      	cmp	r0, r3
 800142a:	d00a      	beq.n	8001442 <TIM_Cmd+0x42>
 800142c:	4b13      	ldr	r3, [pc, #76]	; (800147c <TIM_Cmd+0x7c>)
 800142e:	4298      	cmp	r0, r3
 8001430:	d007      	beq.n	8001442 <TIM_Cmd+0x42>
 8001432:	4b13      	ldr	r3, [pc, #76]	; (8001480 <TIM_Cmd+0x80>)
 8001434:	4298      	cmp	r0, r3
 8001436:	d004      	beq.n	8001442 <TIM_Cmd+0x42>
 8001438:	4b12      	ldr	r3, [pc, #72]	; (8001484 <TIM_Cmd+0x84>)
 800143a:	18c0      	adds	r0, r0, r3
 800143c:	4243      	negs	r3, r0
 800143e:	4158      	adcs	r0, r3
 8001440:	e000      	b.n	8001444 <TIM_Cmd+0x44>
 8001442:	2001      	movs	r0, #1
 8001444:	f7ff fe17 	bl	8001076 <assert_param>
 8001448:	2501      	movs	r5, #1
 800144a:	2000      	movs	r0, #0
 800144c:	42b5      	cmp	r5, r6
 800144e:	4140      	adcs	r0, r0
 8001450:	f7ff fe11 	bl	8001076 <assert_param>
 8001454:	6823      	ldr	r3, [r4, #0]
 8001456:	b29b      	uxth	r3, r3
 8001458:	2e00      	cmp	r6, #0
 800145a:	d002      	beq.n	8001462 <TIM_Cmd+0x62>
 800145c:	431d      	orrs	r5, r3
 800145e:	8025      	strh	r5, [r4, #0]
 8001460:	e001      	b.n	8001466 <TIM_Cmd+0x66>
 8001462:	43ab      	bics	r3, r5
 8001464:	8023      	strh	r3, [r4, #0]
 8001466:	bd70      	pop	{r4, r5, r6, pc}
 8001468:	40012c00 	.word	0x40012c00
 800146c:	40000400 	.word	0x40000400
 8001470:	40001000 	.word	0x40001000
 8001474:	40001400 	.word	0x40001400
 8001478:	40002000 	.word	0x40002000
 800147c:	40014000 	.word	0x40014000
 8001480:	40014400 	.word	0x40014400
 8001484:	bffeb800 	.word	0xbffeb800

08001488 <TIM_ITConfig>:
 8001488:	4b1f      	ldr	r3, [pc, #124]	; (8001508 <TIM_ITConfig+0x80>)
 800148a:	b570      	push	{r4, r5, r6, lr}
 800148c:	1c04      	adds	r4, r0, #0
 800148e:	1c0d      	adds	r5, r1, #0
 8001490:	1c16      	adds	r6, r2, #0
 8001492:	4298      	cmp	r0, r3
 8001494:	d01a      	beq.n	80014cc <TIM_ITConfig+0x44>
 8001496:	2380      	movs	r3, #128	; 0x80
 8001498:	05db      	lsls	r3, r3, #23
 800149a:	4298      	cmp	r0, r3
 800149c:	d016      	beq.n	80014cc <TIM_ITConfig+0x44>
 800149e:	4b1b      	ldr	r3, [pc, #108]	; (800150c <TIM_ITConfig+0x84>)
 80014a0:	4298      	cmp	r0, r3
 80014a2:	d013      	beq.n	80014cc <TIM_ITConfig+0x44>
 80014a4:	4b1a      	ldr	r3, [pc, #104]	; (8001510 <TIM_ITConfig+0x88>)
 80014a6:	4298      	cmp	r0, r3
 80014a8:	d010      	beq.n	80014cc <TIM_ITConfig+0x44>
 80014aa:	4b1a      	ldr	r3, [pc, #104]	; (8001514 <TIM_ITConfig+0x8c>)
 80014ac:	4298      	cmp	r0, r3
 80014ae:	d00d      	beq.n	80014cc <TIM_ITConfig+0x44>
 80014b0:	4b19      	ldr	r3, [pc, #100]	; (8001518 <TIM_ITConfig+0x90>)
 80014b2:	4298      	cmp	r0, r3
 80014b4:	d00a      	beq.n	80014cc <TIM_ITConfig+0x44>
 80014b6:	4b19      	ldr	r3, [pc, #100]	; (800151c <TIM_ITConfig+0x94>)
 80014b8:	4298      	cmp	r0, r3
 80014ba:	d007      	beq.n	80014cc <TIM_ITConfig+0x44>
 80014bc:	4b18      	ldr	r3, [pc, #96]	; (8001520 <TIM_ITConfig+0x98>)
 80014be:	4298      	cmp	r0, r3
 80014c0:	d004      	beq.n	80014cc <TIM_ITConfig+0x44>
 80014c2:	4a18      	ldr	r2, [pc, #96]	; (8001524 <TIM_ITConfig+0x9c>)
 80014c4:	1880      	adds	r0, r0, r2
 80014c6:	4243      	negs	r3, r0
 80014c8:	4158      	adcs	r0, r3
 80014ca:	e000      	b.n	80014ce <TIM_ITConfig+0x46>
 80014cc:	2001      	movs	r0, #1
 80014ce:	f7ff fdd2 	bl	8001076 <assert_param>
 80014d2:	23ff      	movs	r3, #255	; 0xff
 80014d4:	1c2a      	adds	r2, r5, #0
 80014d6:	2000      	movs	r0, #0
 80014d8:	439a      	bics	r2, r3
 80014da:	4282      	cmp	r2, r0
 80014dc:	d102      	bne.n	80014e4 <TIM_ITConfig+0x5c>
 80014de:	1c28      	adds	r0, r5, #0
 80014e0:	1e43      	subs	r3, r0, #1
 80014e2:	4198      	sbcs	r0, r3
 80014e4:	f7ff fdc7 	bl	8001076 <assert_param>
 80014e8:	2301      	movs	r3, #1
 80014ea:	2000      	movs	r0, #0
 80014ec:	42b3      	cmp	r3, r6
 80014ee:	4140      	adcs	r0, r0
 80014f0:	f7ff fdc1 	bl	8001076 <assert_param>
 80014f4:	68e3      	ldr	r3, [r4, #12]
 80014f6:	b29b      	uxth	r3, r3
 80014f8:	2e00      	cmp	r6, #0
 80014fa:	d002      	beq.n	8001502 <TIM_ITConfig+0x7a>
 80014fc:	431d      	orrs	r5, r3
 80014fe:	81a5      	strh	r5, [r4, #12]
 8001500:	e001      	b.n	8001506 <TIM_ITConfig+0x7e>
 8001502:	43ab      	bics	r3, r5
 8001504:	81a3      	strh	r3, [r4, #12]
 8001506:	bd70      	pop	{r4, r5, r6, pc}
 8001508:	40012c00 	.word	0x40012c00
 800150c:	40000400 	.word	0x40000400
 8001510:	40001000 	.word	0x40001000
 8001514:	40001400 	.word	0x40001400
 8001518:	40002000 	.word	0x40002000
 800151c:	40014000 	.word	0x40014000
 8001520:	40014400 	.word	0x40014400
 8001524:	bffeb800 	.word	0xbffeb800

08001528 <USART_Init>:
 8001528:	b5f0      	push	{r4, r5, r6, r7, lr}
 800152a:	4e53      	ldr	r6, [pc, #332]	; (8001678 <USART_Init+0x150>)
 800152c:	b08b      	sub	sp, #44	; 0x2c
 800152e:	1c04      	adds	r4, r0, #0
 8001530:	1c0d      	adds	r5, r1, #0
 8001532:	42b0      	cmp	r0, r6
 8001534:	d016      	beq.n	8001564 <USART_Init+0x3c>
 8001536:	4b51      	ldr	r3, [pc, #324]	; (800167c <USART_Init+0x154>)
 8001538:	4298      	cmp	r0, r3
 800153a:	d013      	beq.n	8001564 <USART_Init+0x3c>
 800153c:	4b50      	ldr	r3, [pc, #320]	; (8001680 <USART_Init+0x158>)
 800153e:	4298      	cmp	r0, r3
 8001540:	d010      	beq.n	8001564 <USART_Init+0x3c>
 8001542:	4b50      	ldr	r3, [pc, #320]	; (8001684 <USART_Init+0x15c>)
 8001544:	4298      	cmp	r0, r3
 8001546:	d00d      	beq.n	8001564 <USART_Init+0x3c>
 8001548:	4b4f      	ldr	r3, [pc, #316]	; (8001688 <USART_Init+0x160>)
 800154a:	4298      	cmp	r0, r3
 800154c:	d00a      	beq.n	8001564 <USART_Init+0x3c>
 800154e:	4b4f      	ldr	r3, [pc, #316]	; (800168c <USART_Init+0x164>)
 8001550:	4298      	cmp	r0, r3
 8001552:	d007      	beq.n	8001564 <USART_Init+0x3c>
 8001554:	4b4e      	ldr	r3, [pc, #312]	; (8001690 <USART_Init+0x168>)
 8001556:	4298      	cmp	r0, r3
 8001558:	d004      	beq.n	8001564 <USART_Init+0x3c>
 800155a:	494e      	ldr	r1, [pc, #312]	; (8001694 <USART_Init+0x16c>)
 800155c:	1840      	adds	r0, r0, r1
 800155e:	4243      	negs	r3, r0
 8001560:	4158      	adcs	r0, r3
 8001562:	e000      	b.n	8001566 <USART_Init+0x3e>
 8001564:	2001      	movs	r0, #1
 8001566:	f7ff fd86 	bl	8001076 <assert_param>
 800156a:	682b      	ldr	r3, [r5, #0]
 800156c:	4a4a      	ldr	r2, [pc, #296]	; (8001698 <USART_Init+0x170>)
 800156e:	3b01      	subs	r3, #1
 8001570:	2000      	movs	r0, #0
 8001572:	429a      	cmp	r2, r3
 8001574:	4140      	adcs	r0, r0
 8001576:	f7ff fd7e 	bl	8001076 <assert_param>
 800157a:	686b      	ldr	r3, [r5, #4]
 800157c:	4a47      	ldr	r2, [pc, #284]	; (800169c <USART_Init+0x174>)
 800157e:	2001      	movs	r0, #1
 8001580:	4213      	tst	r3, r2
 8001582:	d003      	beq.n	800158c <USART_Init+0x64>
 8001584:	4a46      	ldr	r2, [pc, #280]	; (80016a0 <USART_Init+0x178>)
 8001586:	1898      	adds	r0, r3, r2
 8001588:	4243      	negs	r3, r0
 800158a:	4158      	adcs	r0, r3
 800158c:	f7ff fd73 	bl	8001076 <assert_param>
 8001590:	68ab      	ldr	r3, [r5, #8]
 8001592:	4a44      	ldr	r2, [pc, #272]	; (80016a4 <USART_Init+0x17c>)
 8001594:	2001      	movs	r0, #1
 8001596:	4213      	tst	r3, r2
 8001598:	d003      	beq.n	80015a2 <USART_Init+0x7a>
 800159a:	4943      	ldr	r1, [pc, #268]	; (80016a8 <USART_Init+0x180>)
 800159c:	1858      	adds	r0, r3, r1
 800159e:	4243      	negs	r3, r0
 80015a0:	4158      	adcs	r0, r3
 80015a2:	f7ff fd68 	bl	8001076 <assert_param>
 80015a6:	68eb      	ldr	r3, [r5, #12]
 80015a8:	4a40      	ldr	r2, [pc, #256]	; (80016ac <USART_Init+0x184>)
 80015aa:	2001      	movs	r0, #1
 80015ac:	4213      	tst	r3, r2
 80015ae:	d003      	beq.n	80015b8 <USART_Init+0x90>
 80015b0:	4a3f      	ldr	r2, [pc, #252]	; (80016b0 <USART_Init+0x188>)
 80015b2:	1898      	adds	r0, r3, r2
 80015b4:	4243      	negs	r3, r0
 80015b6:	4158      	adcs	r0, r3
 80015b8:	f7ff fd5d 	bl	8001076 <assert_param>
 80015bc:	692b      	ldr	r3, [r5, #16]
 80015be:	220c      	movs	r2, #12
 80015c0:	1c19      	adds	r1, r3, #0
 80015c2:	2000      	movs	r0, #0
 80015c4:	4391      	bics	r1, r2
 80015c6:	4281      	cmp	r1, r0
 80015c8:	d102      	bne.n	80015d0 <USART_Init+0xa8>
 80015ca:	1c18      	adds	r0, r3, #0
 80015cc:	1e43      	subs	r3, r0, #1
 80015ce:	4198      	sbcs	r0, r3
 80015d0:	f7ff fd51 	bl	8001076 <assert_param>
 80015d4:	4f37      	ldr	r7, [pc, #220]	; (80016b4 <USART_Init+0x18c>)
 80015d6:	6968      	ldr	r0, [r5, #20]
 80015d8:	4038      	ands	r0, r7
 80015da:	4243      	negs	r3, r0
 80015dc:	4158      	adcs	r0, r3
 80015de:	f7ff fd4a 	bl	8001076 <assert_param>
 80015e2:	6823      	ldr	r3, [r4, #0]
 80015e4:	2201      	movs	r2, #1
 80015e6:	4393      	bics	r3, r2
 80015e8:	6023      	str	r3, [r4, #0]
 80015ea:	6862      	ldr	r2, [r4, #4]
 80015ec:	4b32      	ldr	r3, [pc, #200]	; (80016b8 <USART_Init+0x190>)
 80015ee:	6869      	ldr	r1, [r5, #4]
 80015f0:	4013      	ands	r3, r2
 80015f2:	68aa      	ldr	r2, [r5, #8]
 80015f4:	4668      	mov	r0, sp
 80015f6:	4313      	orrs	r3, r2
 80015f8:	6063      	str	r3, [r4, #4]
 80015fa:	6822      	ldr	r2, [r4, #0]
 80015fc:	4b2f      	ldr	r3, [pc, #188]	; (80016bc <USART_Init+0x194>)
 80015fe:	401a      	ands	r2, r3
 8001600:	68eb      	ldr	r3, [r5, #12]
 8001602:	430b      	orrs	r3, r1
 8001604:	6929      	ldr	r1, [r5, #16]
 8001606:	430b      	orrs	r3, r1
 8001608:	4313      	orrs	r3, r2
 800160a:	6023      	str	r3, [r4, #0]
 800160c:	68a3      	ldr	r3, [r4, #8]
 800160e:	696a      	ldr	r2, [r5, #20]
 8001610:	401f      	ands	r7, r3
 8001612:	4317      	orrs	r7, r2
 8001614:	60a7      	str	r7, [r4, #8]
 8001616:	f000 f943 	bl	80018a0 <RCC_GetClocksFreq>
 800161a:	42b4      	cmp	r4, r6
 800161c:	d101      	bne.n	8001622 <USART_Init+0xfa>
 800161e:	9e06      	ldr	r6, [sp, #24]
 8001620:	e00a      	b.n	8001638 <USART_Init+0x110>
 8001622:	4b16      	ldr	r3, [pc, #88]	; (800167c <USART_Init+0x154>)
 8001624:	429c      	cmp	r4, r3
 8001626:	d101      	bne.n	800162c <USART_Init+0x104>
 8001628:	9e07      	ldr	r6, [sp, #28]
 800162a:	e005      	b.n	8001638 <USART_Init+0x110>
 800162c:	4b14      	ldr	r3, [pc, #80]	; (8001680 <USART_Init+0x158>)
 800162e:	429c      	cmp	r4, r3
 8001630:	d101      	bne.n	8001636 <USART_Init+0x10e>
 8001632:	9e08      	ldr	r6, [sp, #32]
 8001634:	e000      	b.n	8001638 <USART_Init+0x110>
 8001636:	9e02      	ldr	r6, [sp, #8]
 8001638:	6823      	ldr	r3, [r4, #0]
 800163a:	682f      	ldr	r7, [r5, #0]
 800163c:	0419      	lsls	r1, r3, #16
 800163e:	d500      	bpl.n	8001642 <USART_Init+0x11a>
 8001640:	0076      	lsls	r6, r6, #1
 8001642:	1c39      	adds	r1, r7, #0
 8001644:	1c30      	adds	r0, r6, #0
 8001646:	f000 fab1 	bl	8001bac <__aeabi_uidiv>
 800164a:	1c39      	adds	r1, r7, #0
 800164c:	1c05      	adds	r5, r0, #0
 800164e:	1c30      	adds	r0, r6, #0
 8001650:	f000 faf0 	bl	8001c34 <__aeabi_uidivmod>
 8001654:	087f      	lsrs	r7, r7, #1
 8001656:	2300      	movs	r3, #0
 8001658:	42b9      	cmp	r1, r7
 800165a:	415b      	adcs	r3, r3
 800165c:	18ed      	adds	r5, r5, r3
 800165e:	6823      	ldr	r3, [r4, #0]
 8001660:	041a      	lsls	r2, r3, #16
 8001662:	d504      	bpl.n	800166e <USART_Init+0x146>
 8001664:	4a16      	ldr	r2, [pc, #88]	; (80016c0 <USART_Init+0x198>)
 8001666:	072b      	lsls	r3, r5, #28
 8001668:	0f5b      	lsrs	r3, r3, #29
 800166a:	4015      	ands	r5, r2
 800166c:	431d      	orrs	r5, r3
 800166e:	b2ad      	uxth	r5, r5
 8001670:	81a5      	strh	r5, [r4, #12]
 8001672:	b00b      	add	sp, #44	; 0x2c
 8001674:	bdf0      	pop	{r4, r5, r6, r7, pc}
 8001676:	46c0      	nop			; (mov r8, r8)
 8001678:	40013800 	.word	0x40013800
 800167c:	40004400 	.word	0x40004400
 8001680:	40004800 	.word	0x40004800
 8001684:	40004c00 	.word	0x40004c00
 8001688:	40005000 	.word	0x40005000
 800168c:	40011400 	.word	0x40011400
 8001690:	40011800 	.word	0x40011800
 8001694:	bffee400 	.word	0xbffee400
 8001698:	005b8d7f 	.word	0x005b8d7f
 800169c:	ffffefff 	.word	0xffffefff
 80016a0:	effff000 	.word	0xeffff000
 80016a4:	ffffdfff 	.word	0xffffdfff
 80016a8:	ffffd000 	.word	0xffffd000
 80016ac:	fffffbff 	.word	0xfffffbff
 80016b0:	fffffa00 	.word	0xfffffa00
 80016b4:	fffffcff 	.word	0xfffffcff
 80016b8:	ffffcfff 	.word	0xffffcfff
 80016bc:	ffffe9f3 	.word	0xffffe9f3
 80016c0:	0000fff0 	.word	0x0000fff0

080016c4 <USART_Cmd>:
 80016c4:	4b17      	ldr	r3, [pc, #92]	; (8001724 <USART_Cmd+0x60>)
 80016c6:	b570      	push	{r4, r5, r6, lr}
 80016c8:	1c04      	adds	r4, r0, #0
 80016ca:	1c0e      	adds	r6, r1, #0
 80016cc:	4298      	cmp	r0, r3
 80016ce:	d016      	beq.n	80016fe <USART_Cmd+0x3a>
 80016d0:	4b15      	ldr	r3, [pc, #84]	; (8001728 <USART_Cmd+0x64>)
 80016d2:	4298      	cmp	r0, r3
 80016d4:	d013      	beq.n	80016fe <USART_Cmd+0x3a>
 80016d6:	4b15      	ldr	r3, [pc, #84]	; (800172c <USART_Cmd+0x68>)
 80016d8:	4298      	cmp	r0, r3
 80016da:	d010      	beq.n	80016fe <USART_Cmd+0x3a>
 80016dc:	4b14      	ldr	r3, [pc, #80]	; (8001730 <USART_Cmd+0x6c>)
 80016de:	4298      	cmp	r0, r3
 80016e0:	d00d      	beq.n	80016fe <USART_Cmd+0x3a>
 80016e2:	4b14      	ldr	r3, [pc, #80]	; (8001734 <USART_Cmd+0x70>)
 80016e4:	4298      	cmp	r0, r3
 80016e6:	d00a      	beq.n	80016fe <USART_Cmd+0x3a>
 80016e8:	4b13      	ldr	r3, [pc, #76]	; (8001738 <USART_Cmd+0x74>)
 80016ea:	4298      	cmp	r0, r3
 80016ec:	d007      	beq.n	80016fe <USART_Cmd+0x3a>
 80016ee:	4b13      	ldr	r3, [pc, #76]	; (800173c <USART_Cmd+0x78>)
 80016f0:	4298      	cmp	r0, r3
 80016f2:	d004      	beq.n	80016fe <USART_Cmd+0x3a>
 80016f4:	4b12      	ldr	r3, [pc, #72]	; (8001740 <USART_Cmd+0x7c>)
 80016f6:	18c0      	adds	r0, r0, r3
 80016f8:	4243      	negs	r3, r0
 80016fa:	4158      	adcs	r0, r3
 80016fc:	e000      	b.n	8001700 <USART_Cmd+0x3c>
 80016fe:	2001      	movs	r0, #1
 8001700:	f7ff fcb9 	bl	8001076 <assert_param>
 8001704:	2501      	movs	r5, #1
 8001706:	2000      	movs	r0, #0
 8001708:	42b5      	cmp	r5, r6
 800170a:	4140      	adcs	r0, r0
 800170c:	f7ff fcb3 	bl	8001076 <assert_param>
 8001710:	6823      	ldr	r3, [r4, #0]
 8001712:	2e00      	cmp	r6, #0
 8001714:	d002      	beq.n	800171c <USART_Cmd+0x58>
 8001716:	431d      	orrs	r5, r3
 8001718:	6025      	str	r5, [r4, #0]
 800171a:	e001      	b.n	8001720 <USART_Cmd+0x5c>
 800171c:	43ab      	bics	r3, r5
 800171e:	6023      	str	r3, [r4, #0]
 8001720:	bd70      	pop	{r4, r5, r6, pc}
 8001722:	46c0      	nop			; (mov r8, r8)
 8001724:	40013800 	.word	0x40013800
 8001728:	40004400 	.word	0x40004400
 800172c:	40004800 	.word	0x40004800
 8001730:	40004c00 	.word	0x40004c00
 8001734:	40005000 	.word	0x40005000
 8001738:	40011400 	.word	0x40011400
 800173c:	40011800 	.word	0x40011800
 8001740:	bffee400 	.word	0xbffee400

08001744 <USART_ClearITPendingBit>:
 8001744:	b538      	push	{r3, r4, r5, lr}
 8001746:	4b26      	ldr	r3, [pc, #152]	; (80017e0 <USART_ClearITPendingBit+0x9c>)
 8001748:	1c05      	adds	r5, r0, #0
 800174a:	1c0c      	adds	r4, r1, #0
 800174c:	4298      	cmp	r0, r3
 800174e:	d016      	beq.n	800177e <USART_ClearITPendingBit+0x3a>
 8001750:	4b24      	ldr	r3, [pc, #144]	; (80017e4 <USART_ClearITPendingBit+0xa0>)
 8001752:	4298      	cmp	r0, r3
 8001754:	d013      	beq.n	800177e <USART_ClearITPendingBit+0x3a>
 8001756:	4b24      	ldr	r3, [pc, #144]	; (80017e8 <USART_ClearITPendingBit+0xa4>)
 8001758:	4298      	cmp	r0, r3
 800175a:	d010      	beq.n	800177e <USART_ClearITPendingBit+0x3a>
 800175c:	4b23      	ldr	r3, [pc, #140]	; (80017ec <USART_ClearITPendingBit+0xa8>)
 800175e:	4298      	cmp	r0, r3
 8001760:	d00d      	beq.n	800177e <USART_ClearITPendingBit+0x3a>
 8001762:	4b23      	ldr	r3, [pc, #140]	; (80017f0 <USART_ClearITPendingBit+0xac>)
 8001764:	4298      	cmp	r0, r3
 8001766:	d00a      	beq.n	800177e <USART_ClearITPendingBit+0x3a>
 8001768:	4b22      	ldr	r3, [pc, #136]	; (80017f4 <USART_ClearITPendingBit+0xb0>)
 800176a:	4298      	cmp	r0, r3
 800176c:	d007      	beq.n	800177e <USART_ClearITPendingBit+0x3a>
 800176e:	4b22      	ldr	r3, [pc, #136]	; (80017f8 <USART_ClearITPendingBit+0xb4>)
 8001770:	4298      	cmp	r0, r3
 8001772:	d004      	beq.n	800177e <USART_ClearITPendingBit+0x3a>
 8001774:	4a21      	ldr	r2, [pc, #132]	; (80017fc <USART_ClearITPendingBit+0xb8>)
 8001776:	1880      	adds	r0, r0, r2
 8001778:	4243      	negs	r3, r0
 800177a:	4158      	adcs	r0, r3
 800177c:	e000      	b.n	8001780 <USART_ClearITPendingBit+0x3c>
 800177e:	2001      	movs	r0, #1
 8001780:	f7ff fc79 	bl	8001076 <assert_param>
 8001784:	4b1e      	ldr	r3, [pc, #120]	; (8001800 <USART_ClearITPendingBit+0xbc>)
 8001786:	429c      	cmp	r4, r3
 8001788:	d022      	beq.n	80017d0 <USART_ClearITPendingBit+0x8c>
 800178a:	2384      	movs	r3, #132	; 0x84
 800178c:	005b      	lsls	r3, r3, #1
 800178e:	429c      	cmp	r4, r3
 8001790:	d01e      	beq.n	80017d0 <USART_ClearITPendingBit+0x8c>
 8001792:	4a1c      	ldr	r2, [pc, #112]	; (8001804 <USART_ClearITPendingBit+0xc0>)
 8001794:	4b1c      	ldr	r3, [pc, #112]	; (8001808 <USART_ClearITPendingBit+0xc4>)
 8001796:	4022      	ands	r2, r4
 8001798:	429a      	cmp	r2, r3
 800179a:	d019      	beq.n	80017d0 <USART_ClearITPendingBit+0x8c>
 800179c:	4b1b      	ldr	r3, [pc, #108]	; (800180c <USART_ClearITPendingBit+0xc8>)
 800179e:	429c      	cmp	r4, r3
 80017a0:	d016      	beq.n	80017d0 <USART_ClearITPendingBit+0x8c>
 80017a2:	4b1b      	ldr	r3, [pc, #108]	; (8001810 <USART_ClearITPendingBit+0xcc>)
 80017a4:	429c      	cmp	r4, r3
 80017a6:	d013      	beq.n	80017d0 <USART_ClearITPendingBit+0x8c>
 80017a8:	4b1a      	ldr	r3, [pc, #104]	; (8001814 <USART_ClearITPendingBit+0xd0>)
 80017aa:	429c      	cmp	r4, r3
 80017ac:	d010      	beq.n	80017d0 <USART_ClearITPendingBit+0x8c>
 80017ae:	4b1a      	ldr	r3, [pc, #104]	; (8001818 <USART_ClearITPendingBit+0xd4>)
 80017b0:	429c      	cmp	r4, r3
 80017b2:	d00d      	beq.n	80017d0 <USART_ClearITPendingBit+0x8c>
 80017b4:	4b19      	ldr	r3, [pc, #100]	; (800181c <USART_ClearITPendingBit+0xd8>)
 80017b6:	429c      	cmp	r4, r3
 80017b8:	d00a      	beq.n	80017d0 <USART_ClearITPendingBit+0x8c>
 80017ba:	4b19      	ldr	r3, [pc, #100]	; (8001820 <USART_ClearITPendingBit+0xdc>)
 80017bc:	429c      	cmp	r4, r3
 80017be:	d007      	beq.n	80017d0 <USART_ClearITPendingBit+0x8c>
 80017c0:	4b18      	ldr	r3, [pc, #96]	; (8001824 <USART_ClearITPendingBit+0xe0>)
 80017c2:	429c      	cmp	r4, r3
 80017c4:	d004      	beq.n	80017d0 <USART_ClearITPendingBit+0x8c>
 80017c6:	4a18      	ldr	r2, [pc, #96]	; (8001828 <USART_ClearITPendingBit+0xe4>)
 80017c8:	18a3      	adds	r3, r4, r2
 80017ca:	4258      	negs	r0, r3
 80017cc:	4158      	adcs	r0, r3
 80017ce:	e000      	b.n	80017d2 <USART_ClearITPendingBit+0x8e>
 80017d0:	2001      	movs	r0, #1
 80017d2:	f7ff fc50 	bl	8001076 <assert_param>
 80017d6:	0c24      	lsrs	r4, r4, #16
 80017d8:	2301      	movs	r3, #1
 80017da:	40a3      	lsls	r3, r4
 80017dc:	622b      	str	r3, [r5, #32]
 80017de:	bd38      	pop	{r3, r4, r5, pc}
 80017e0:	40013800 	.word	0x40013800
 80017e4:	40004400 	.word	0x40004400
 80017e8:	40004800 	.word	0x40004800
 80017ec:	40004c00 	.word	0x40004c00
 80017f0:	40005000 	.word	0x40005000
 80017f4:	40011400 	.word	0x40011400
 80017f8:	40011800 	.word	0x40011800
 80017fc:	bffee400 	.word	0xbffee400
 8001800:	00060106 	.word	0x00060106
 8001804:	fffdffff 	.word	0xfffdffff
 8001808:	00010300 	.word	0x00010300
 800180c:	00020300 	.word	0x00020300
 8001810:	00040104 	.word	0x00040104
 8001814:	00080206 	.word	0x00080206
 8001818:	0009030a 	.word	0x0009030a
 800181c:	000b011a 	.word	0x000b011a
 8001820:	000c011b 	.word	0x000c011b
 8001824:	0011010e 	.word	0x0011010e
 8001828:	ffebfcea 	.word	0xffebfcea

0800182c <NVIC_Init>:
 800182c:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
 800182e:	2500      	movs	r5, #0
 8001830:	7883      	ldrb	r3, [r0, #2]
 8001832:	1c04      	adds	r4, r0, #0
 8001834:	2601      	movs	r6, #1
 8001836:	1c28      	adds	r0, r5, #0
 8001838:	429e      	cmp	r6, r3
 800183a:	4168      	adcs	r0, r5
 800183c:	f7ff fc1b 	bl	8001076 <assert_param>
 8001840:	7863      	ldrb	r3, [r4, #1]
 8001842:	2703      	movs	r7, #3
 8001844:	1c28      	adds	r0, r5, #0
 8001846:	429f      	cmp	r7, r3
 8001848:	4168      	adcs	r0, r5
 800184a:	f7ff fc14 	bl	8001076 <assert_param>
 800184e:	78a2      	ldrb	r2, [r4, #2]
 8001850:	7823      	ldrb	r3, [r4, #0]
 8001852:	42aa      	cmp	r2, r5
 8001854:	d01a      	beq.n	800188c <NVIC_Init+0x60>
 8001856:	0899      	lsrs	r1, r3, #2
 8001858:	4a0f      	ldr	r2, [pc, #60]	; (8001898 <NVIC_Init+0x6c>)
 800185a:	0089      	lsls	r1, r1, #2
 800185c:	1889      	adds	r1, r1, r2
 800185e:	22c0      	movs	r2, #192	; 0xc0
 8001860:	0092      	lsls	r2, r2, #2
 8001862:	401f      	ands	r7, r3
 8001864:	20ff      	movs	r0, #255	; 0xff
 8001866:	588d      	ldr	r5, [r1, r2]
 8001868:	00ff      	lsls	r7, r7, #3
 800186a:	1c03      	adds	r3, r0, #0
 800186c:	40bb      	lsls	r3, r7
 800186e:	439d      	bics	r5, r3
 8001870:	7863      	ldrb	r3, [r4, #1]
 8001872:	019b      	lsls	r3, r3, #6
 8001874:	4018      	ands	r0, r3
 8001876:	40b8      	lsls	r0, r7
 8001878:	1c2f      	adds	r7, r5, #0
 800187a:	4307      	orrs	r7, r0
 800187c:	508f      	str	r7, [r1, r2]
 800187e:	7822      	ldrb	r2, [r4, #0]
 8001880:	231f      	movs	r3, #31
 8001882:	4013      	ands	r3, r2
 8001884:	409e      	lsls	r6, r3
 8001886:	4b04      	ldr	r3, [pc, #16]	; (8001898 <NVIC_Init+0x6c>)
 8001888:	601e      	str	r6, [r3, #0]
 800188a:	e004      	b.n	8001896 <NVIC_Init+0x6a>
 800188c:	271f      	movs	r7, #31
 800188e:	403b      	ands	r3, r7
 8001890:	4a02      	ldr	r2, [pc, #8]	; (800189c <NVIC_Init+0x70>)
 8001892:	409e      	lsls	r6, r3
 8001894:	67d6      	str	r6, [r2, #124]	; 0x7c
 8001896:	bdf8      	pop	{r3, r4, r5, r6, r7, pc}
 8001898:	e000e100 	.word	0xe000e100
 800189c:	e000e104 	.word	0xe000e104

080018a0 <RCC_GetClocksFreq>:
 80018a0:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
 80018a2:	4d5a      	ldr	r5, [pc, #360]	; (8001a0c <RCC_GetClocksFreq+0x16c>)
 80018a4:	1c04      	adds	r4, r0, #0
 80018a6:	6868      	ldr	r0, [r5, #4]
 80018a8:	230c      	movs	r3, #12
 80018aa:	4018      	ands	r0, r3
 80018ac:	f000 f974 	bl	8001b98 <__gnu_thumb1_case_uqi>
 80018b0:	1f1f1f1f 	.word	0x1f1f1f1f
 80018b4:	1f1f1f1f 	.word	0x1f1f1f1f
 80018b8:	1f1f1f07 	.word	0x1f1f1f07
 80018bc:	1d          	.byte	0x1d
 80018bd:	00          	.byte	0x00
 80018be:	686e      	ldr	r6, [r5, #4]
 80018c0:	23c0      	movs	r3, #192	; 0xc0
 80018c2:	02b6      	lsls	r6, r6, #10
 80018c4:	686a      	ldr	r2, [r5, #4]
 80018c6:	0f36      	lsrs	r6, r6, #28
 80018c8:	025b      	lsls	r3, r3, #9
 80018ca:	3602      	adds	r6, #2
 80018cc:	421a      	tst	r2, r3
 80018ce:	d101      	bne.n	80018d4 <RCC_GetClocksFreq+0x34>
 80018d0:	484f      	ldr	r0, [pc, #316]	; (8001a10 <RCC_GetClocksFreq+0x170>)
 80018d2:	e007      	b.n	80018e4 <RCC_GetClocksFreq+0x44>
 80018d4:	4b4d      	ldr	r3, [pc, #308]	; (8001a0c <RCC_GetClocksFreq+0x16c>)
 80018d6:	484f      	ldr	r0, [pc, #316]	; (8001a14 <RCC_GetClocksFreq+0x174>)
 80018d8:	6ad9      	ldr	r1, [r3, #44]	; 0x2c
 80018da:	230f      	movs	r3, #15
 80018dc:	4019      	ands	r1, r3
 80018de:	3101      	adds	r1, #1
 80018e0:	f000 f964 	bl	8001bac <__aeabi_uidiv>
 80018e4:	4370      	muls	r0, r6
 80018e6:	6020      	str	r0, [r4, #0]
 80018e8:	e004      	b.n	80018f4 <RCC_GetClocksFreq+0x54>
 80018ea:	4b4b      	ldr	r3, [pc, #300]	; (8001a18 <RCC_GetClocksFreq+0x178>)
 80018ec:	e000      	b.n	80018f0 <RCC_GetClocksFreq+0x50>
 80018ee:	4b49      	ldr	r3, [pc, #292]	; (8001a14 <RCC_GetClocksFreq+0x174>)
 80018f0:	6023      	str	r3, [r4, #0]
 80018f2:	2000      	movs	r0, #0
 80018f4:	686b      	ldr	r3, [r5, #4]
 80018f6:	4a49      	ldr	r2, [pc, #292]	; (8001a1c <RCC_GetClocksFreq+0x17c>)
 80018f8:	061b      	lsls	r3, r3, #24
 80018fa:	0f1b      	lsrs	r3, r3, #28
 80018fc:	6821      	ldr	r1, [r4, #0]
 80018fe:	5cd3      	ldrb	r3, [r2, r3]
 8001900:	1c0e      	adds	r6, r1, #0
 8001902:	40de      	lsrs	r6, r3
 8001904:	6066      	str	r6, [r4, #4]
 8001906:	1c33      	adds	r3, r6, #0
 8001908:	686e      	ldr	r6, [r5, #4]
 800190a:	0576      	lsls	r6, r6, #21
 800190c:	0f76      	lsrs	r6, r6, #29
 800190e:	5d92      	ldrb	r2, [r2, r6]
 8001910:	40d3      	lsrs	r3, r2
 8001912:	60a3      	str	r3, [r4, #8]
 8001914:	6b2a      	ldr	r2, [r5, #48]	; 0x30
 8001916:	05d6      	lsls	r6, r2, #23
 8001918:	d401      	bmi.n	800191e <RCC_GetClocksFreq+0x7e>
 800191a:	4a41      	ldr	r2, [pc, #260]	; (8001a20 <RCC_GetClocksFreq+0x180>)
 800191c:	e006      	b.n	800192c <RCC_GetClocksFreq+0x8c>
 800191e:	4a3b      	ldr	r2, [pc, #236]	; (8001a0c <RCC_GetClocksFreq+0x16c>)
 8001920:	6852      	ldr	r2, [r2, #4]
 8001922:	0456      	lsls	r6, r2, #17
 8001924:	d401      	bmi.n	800192a <RCC_GetClocksFreq+0x8a>
 8001926:	085a      	lsrs	r2, r3, #1
 8001928:	e000      	b.n	800192c <RCC_GetClocksFreq+0x8c>
 800192a:	089a      	lsrs	r2, r3, #2
 800192c:	60e2      	str	r2, [r4, #12]
 800192e:	6b2a      	ldr	r2, [r5, #48]	; 0x30
 8001930:	0656      	lsls	r6, r2, #25
 8001932:	d401      	bmi.n	8001938 <RCC_GetClocksFreq+0x98>
 8001934:	4a3b      	ldr	r2, [pc, #236]	; (8001a24 <RCC_GetClocksFreq+0x184>)
 8001936:	e001      	b.n	800193c <RCC_GetClocksFreq+0x9c>
 8001938:	2280      	movs	r2, #128	; 0x80
 800193a:	0212      	lsls	r2, r2, #8
 800193c:	6122      	str	r2, [r4, #16]
 800193e:	6b2a      	ldr	r2, [r5, #48]	; 0x30
 8001940:	06d6      	lsls	r6, r2, #27
 8001942:	d402      	bmi.n	800194a <RCC_GetClocksFreq+0xaa>
 8001944:	4a33      	ldr	r2, [pc, #204]	; (8001a14 <RCC_GetClocksFreq+0x174>)
 8001946:	6162      	str	r2, [r4, #20]
 8001948:	e000      	b.n	800194c <RCC_GetClocksFreq+0xac>
 800194a:	6161      	str	r1, [r4, #20]
 800194c:	6b2f      	ldr	r7, [r5, #48]	; 0x30
 800194e:	2203      	movs	r2, #3
 8001950:	4e2e      	ldr	r6, [pc, #184]	; (8001a0c <RCC_GetClocksFreq+0x16c>)
 8001952:	4217      	tst	r7, r2
 8001954:	d101      	bne.n	800195a <RCC_GetClocksFreq+0xba>
 8001956:	61a3      	str	r3, [r4, #24]
 8001958:	e012      	b.n	8001980 <RCC_GetClocksFreq+0xe0>
 800195a:	6b37      	ldr	r7, [r6, #48]	; 0x30
 800195c:	4017      	ands	r7, r2
 800195e:	2f01      	cmp	r7, #1
 8001960:	d101      	bne.n	8001966 <RCC_GetClocksFreq+0xc6>
 8001962:	61a1      	str	r1, [r4, #24]
 8001964:	e00c      	b.n	8001980 <RCC_GetClocksFreq+0xe0>
 8001966:	6b37      	ldr	r7, [r6, #48]	; 0x30
 8001968:	4017      	ands	r7, r2
 800196a:	2f02      	cmp	r7, #2
 800196c:	d102      	bne.n	8001974 <RCC_GetClocksFreq+0xd4>
 800196e:	2280      	movs	r2, #128	; 0x80
 8001970:	0212      	lsls	r2, r2, #8
 8001972:	e004      	b.n	800197e <RCC_GetClocksFreq+0xde>
 8001974:	6b36      	ldr	r6, [r6, #48]	; 0x30
 8001976:	4032      	ands	r2, r6
 8001978:	2a03      	cmp	r2, #3
 800197a:	d101      	bne.n	8001980 <RCC_GetClocksFreq+0xe0>
 800197c:	4a25      	ldr	r2, [pc, #148]	; (8001a14 <RCC_GetClocksFreq+0x174>)
 800197e:	61a2      	str	r2, [r4, #24]
 8001980:	22c0      	movs	r2, #192	; 0xc0
 8001982:	6b2f      	ldr	r7, [r5, #48]	; 0x30
 8001984:	0292      	lsls	r2, r2, #10
 8001986:	4e21      	ldr	r6, [pc, #132]	; (8001a0c <RCC_GetClocksFreq+0x16c>)
 8001988:	4217      	tst	r7, r2
 800198a:	d101      	bne.n	8001990 <RCC_GetClocksFreq+0xf0>
 800198c:	61e3      	str	r3, [r4, #28]
 800198e:	e018      	b.n	80019c2 <RCC_GetClocksFreq+0x122>
 8001990:	6b37      	ldr	r7, [r6, #48]	; 0x30
 8001992:	4017      	ands	r7, r2
 8001994:	46bc      	mov	ip, r7
 8001996:	2780      	movs	r7, #128	; 0x80
 8001998:	027f      	lsls	r7, r7, #9
 800199a:	45bc      	cmp	ip, r7
 800199c:	d101      	bne.n	80019a2 <RCC_GetClocksFreq+0x102>
 800199e:	61e1      	str	r1, [r4, #28]
 80019a0:	e00f      	b.n	80019c2 <RCC_GetClocksFreq+0x122>
 80019a2:	6b37      	ldr	r7, [r6, #48]	; 0x30
 80019a4:	4017      	ands	r7, r2
 80019a6:	46bc      	mov	ip, r7
 80019a8:	2780      	movs	r7, #128	; 0x80
 80019aa:	02bf      	lsls	r7, r7, #10
 80019ac:	45bc      	cmp	ip, r7
 80019ae:	d102      	bne.n	80019b6 <RCC_GetClocksFreq+0x116>
 80019b0:	2280      	movs	r2, #128	; 0x80
 80019b2:	0212      	lsls	r2, r2, #8
 80019b4:	e004      	b.n	80019c0 <RCC_GetClocksFreq+0x120>
 80019b6:	6b36      	ldr	r6, [r6, #48]	; 0x30
 80019b8:	4016      	ands	r6, r2
 80019ba:	4296      	cmp	r6, r2
 80019bc:	d101      	bne.n	80019c2 <RCC_GetClocksFreq+0x122>
 80019be:	4a15      	ldr	r2, [pc, #84]	; (8001a14 <RCC_GetClocksFreq+0x174>)
 80019c0:	61e2      	str	r2, [r4, #28]
 80019c2:	22c0      	movs	r2, #192	; 0xc0
 80019c4:	6b2f      	ldr	r7, [r5, #48]	; 0x30
 80019c6:	0312      	lsls	r2, r2, #12
 80019c8:	4e10      	ldr	r6, [pc, #64]	; (8001a0c <RCC_GetClocksFreq+0x16c>)
 80019ca:	4217      	tst	r7, r2
 80019cc:	d015      	beq.n	80019fa <RCC_GetClocksFreq+0x15a>
 80019ce:	6b37      	ldr	r7, [r6, #48]	; 0x30
 80019d0:	2380      	movs	r3, #128	; 0x80
 80019d2:	4017      	ands	r7, r2
 80019d4:	02db      	lsls	r3, r3, #11
 80019d6:	429f      	cmp	r7, r3
 80019d8:	d101      	bne.n	80019de <RCC_GetClocksFreq+0x13e>
 80019da:	6221      	str	r1, [r4, #32]
 80019dc:	e00e      	b.n	80019fc <RCC_GetClocksFreq+0x15c>
 80019de:	6b31      	ldr	r1, [r6, #48]	; 0x30
 80019e0:	2380      	movs	r3, #128	; 0x80
 80019e2:	4011      	ands	r1, r2
 80019e4:	031b      	lsls	r3, r3, #12
 80019e6:	4299      	cmp	r1, r3
 80019e8:	d102      	bne.n	80019f0 <RCC_GetClocksFreq+0x150>
 80019ea:	2380      	movs	r3, #128	; 0x80
 80019ec:	021b      	lsls	r3, r3, #8
 80019ee:	e004      	b.n	80019fa <RCC_GetClocksFreq+0x15a>
 80019f0:	6b33      	ldr	r3, [r6, #48]	; 0x30
 80019f2:	4013      	ands	r3, r2
 80019f4:	4293      	cmp	r3, r2
 80019f6:	d101      	bne.n	80019fc <RCC_GetClocksFreq+0x15c>
 80019f8:	4b06      	ldr	r3, [pc, #24]	; (8001a14 <RCC_GetClocksFreq+0x174>)
 80019fa:	6223      	str	r3, [r4, #32]
 80019fc:	6b2b      	ldr	r3, [r5, #48]	; 0x30
 80019fe:	061a      	lsls	r2, r3, #24
 8001a00:	d402      	bmi.n	8001a08 <RCC_GetClocksFreq+0x168>
 8001a02:	4b05      	ldr	r3, [pc, #20]	; (8001a18 <RCC_GetClocksFreq+0x178>)
 8001a04:	6263      	str	r3, [r4, #36]	; 0x24
 8001a06:	e000      	b.n	8001a0a <RCC_GetClocksFreq+0x16a>
 8001a08:	6260      	str	r0, [r4, #36]	; 0x24
 8001a0a:	bdf8      	pop	{r3, r4, r5, r6, r7, pc}
 8001a0c:	40021000 	.word	0x40021000
 8001a10:	003d0900 	.word	0x003d0900
 8001a14:	007a1200 	.word	0x007a1200
 8001a18:	02dc6c00 	.word	0x02dc6c00
 8001a1c:	20000000 	.word	0x20000000
 8001a20:	00d59f80 	.word	0x00d59f80
 8001a24:	00008012 	.word	0x00008012

08001a28 <RCC_AHBPeriphClockCmd>:
 8001a28:	b538      	push	{r3, r4, r5, lr}
 8001a2a:	4b0d      	ldr	r3, [pc, #52]	; (8001a60 <RCC_AHBPeriphClockCmd+0x38>)
 8001a2c:	1c04      	adds	r4, r0, #0
 8001a2e:	1c0d      	adds	r5, r1, #0
 8001a30:	2000      	movs	r0, #0
 8001a32:	421c      	tst	r4, r3
 8001a34:	d102      	bne.n	8001a3c <RCC_AHBPeriphClockCmd+0x14>
 8001a36:	1c20      	adds	r0, r4, #0
 8001a38:	1e43      	subs	r3, r0, #1
 8001a3a:	4198      	sbcs	r0, r3
 8001a3c:	f7ff fb1b 	bl	8001076 <assert_param>
 8001a40:	2301      	movs	r3, #1
 8001a42:	2000      	movs	r0, #0
 8001a44:	42ab      	cmp	r3, r5
 8001a46:	4140      	adcs	r0, r0
 8001a48:	f7ff fb15 	bl	8001076 <assert_param>
 8001a4c:	4b05      	ldr	r3, [pc, #20]	; (8001a64 <RCC_AHBPeriphClockCmd+0x3c>)
 8001a4e:	695a      	ldr	r2, [r3, #20]
 8001a50:	2d00      	cmp	r5, #0
 8001a52:	d002      	beq.n	8001a5a <RCC_AHBPeriphClockCmd+0x32>
 8001a54:	4314      	orrs	r4, r2
 8001a56:	615c      	str	r4, [r3, #20]
 8001a58:	e001      	b.n	8001a5e <RCC_AHBPeriphClockCmd+0x36>
 8001a5a:	43a2      	bics	r2, r4
 8001a5c:	615a      	str	r2, [r3, #20]
 8001a5e:	bd38      	pop	{r3, r4, r5, pc}
 8001a60:	fe81ffa8 	.word	0xfe81ffa8
 8001a64:	40021000 	.word	0x40021000

08001a68 <RCC_APB2PeriphClockCmd>:
 8001a68:	b538      	push	{r3, r4, r5, lr}
 8001a6a:	4b0d      	ldr	r3, [pc, #52]	; (8001aa0 <RCC_APB2PeriphClockCmd+0x38>)
 8001a6c:	1c04      	adds	r4, r0, #0
 8001a6e:	1c0d      	adds	r5, r1, #0
 8001a70:	2000      	movs	r0, #0
 8001a72:	421c      	tst	r4, r3
 8001a74:	d102      	bne.n	8001a7c <RCC_APB2PeriphClockCmd+0x14>
 8001a76:	1c20      	adds	r0, r4, #0
 8001a78:	1e43      	subs	r3, r0, #1
 8001a7a:	4198      	sbcs	r0, r3
 8001a7c:	f7ff fafb 	bl	8001076 <assert_param>
 8001a80:	2301      	movs	r3, #1
 8001a82:	2000      	movs	r0, #0
 8001a84:	42ab      	cmp	r3, r5
 8001a86:	4140      	adcs	r0, r0
 8001a88:	f7ff faf5 	bl	8001076 <assert_param>
 8001a8c:	4b05      	ldr	r3, [pc, #20]	; (8001aa4 <RCC_APB2PeriphClockCmd+0x3c>)
 8001a8e:	699a      	ldr	r2, [r3, #24]
 8001a90:	2d00      	cmp	r5, #0
 8001a92:	d002      	beq.n	8001a9a <RCC_APB2PeriphClockCmd+0x32>
 8001a94:	4314      	orrs	r4, r2
 8001a96:	619c      	str	r4, [r3, #24]
 8001a98:	e001      	b.n	8001a9e <RCC_APB2PeriphClockCmd+0x36>
 8001a9a:	43a2      	bics	r2, r4
 8001a9c:	619a      	str	r2, [r3, #24]
 8001a9e:	bd38      	pop	{r3, r4, r5, pc}
 8001aa0:	ffb8a51e 	.word	0xffb8a51e
 8001aa4:	40021000 	.word	0x40021000

08001aa8 <RCC_APB1PeriphClockCmd>:
 8001aa8:	b538      	push	{r3, r4, r5, lr}
 8001aaa:	4b0d      	ldr	r3, [pc, #52]	; (8001ae0 <RCC_APB1PeriphClockCmd+0x38>)
 8001aac:	1c04      	adds	r4, r0, #0
 8001aae:	1c0d      	adds	r5, r1, #0
 8001ab0:	2000      	movs	r0, #0
 8001ab2:	421c      	tst	r4, r3
 8001ab4:	d102      	bne.n	8001abc <RCC_APB1PeriphClockCmd+0x14>
 8001ab6:	1c20      	adds	r0, r4, #0
 8001ab8:	1e43      	subs	r3, r0, #1
 8001aba:	4198      	sbcs	r0, r3
 8001abc:	f7ff fadb 	bl	8001076 <assert_param>
 8001ac0:	2301      	movs	r3, #1
 8001ac2:	2000      	movs	r0, #0
 8001ac4:	42ab      	cmp	r3, r5
 8001ac6:	4140      	adcs	r0, r0
 8001ac8:	f7ff fad5 	bl	8001076 <assert_param>
 8001acc:	4b05      	ldr	r3, [pc, #20]	; (8001ae4 <RCC_APB1PeriphClockCmd+0x3c>)
 8001ace:	69da      	ldr	r2, [r3, #28]
 8001ad0:	2d00      	cmp	r5, #0
 8001ad2:	d002      	beq.n	8001ada <RCC_APB1PeriphClockCmd+0x32>
 8001ad4:	4314      	orrs	r4, r2
 8001ad6:	61dc      	str	r4, [r3, #28]
 8001ad8:	e001      	b.n	8001ade <RCC_APB1PeriphClockCmd+0x36>
 8001ada:	43a2      	bics	r2, r4
 8001adc:	61da      	str	r2, [r3, #28]
 8001ade:	bd38      	pop	{r3, r4, r5, pc}
 8001ae0:	8581b6cc 	.word	0x8581b6cc
 8001ae4:	40021000 	.word	0x40021000

08001ae8 <gpio_init>:
 8001ae8:	b507      	push	{r0, r1, r2, lr}
 8001aea:	2080      	movs	r0, #128	; 0x80
 8001aec:	0280      	lsls	r0, r0, #10
 8001aee:	2101      	movs	r1, #1
 8001af0:	f7ff ff9a 	bl	8001a28 <RCC_AHBPeriphClockCmd>
 8001af4:	2080      	movs	r0, #128	; 0x80
 8001af6:	02c0      	lsls	r0, r0, #11
 8001af8:	2101      	movs	r1, #1
 8001afa:	f7ff ff95 	bl	8001a28 <RCC_AHBPeriphClockCmd>
 8001afe:	2308      	movs	r3, #8
 8001b00:	4669      	mov	r1, sp
 8001b02:	9300      	str	r3, [sp, #0]
 8001b04:	2301      	movs	r3, #1
 8001b06:	710b      	strb	r3, [r1, #4]
 8001b08:	2203      	movs	r2, #3
 8001b0a:	2300      	movs	r3, #0
 8001b0c:	4803      	ldr	r0, [pc, #12]	; (8001b1c <gpio_init+0x34>)
 8001b0e:	718b      	strb	r3, [r1, #6]
 8001b10:	714a      	strb	r2, [r1, #5]
 8001b12:	71cb      	strb	r3, [r1, #7]
 8001b14:	f7ff fb28 	bl	8001168 <GPIO_Init>
 8001b18:	bd07      	pop	{r0, r1, r2, pc}
 8001b1a:	46c0      	nop			; (mov r8, r8)
 8001b1c:	48000400 	.word	0x48000400

08001b20 <led_on>:
 8001b20:	2808      	cmp	r0, #8
 8001b22:	d101      	bne.n	8001b28 <led_on+0x8>
 8001b24:	4b01      	ldr	r3, [pc, #4]	; (8001b2c <led_on+0xc>)
 8001b26:	6198      	str	r0, [r3, #24]
 8001b28:	4770      	bx	lr
 8001b2a:	46c0      	nop			; (mov r8, r8)
 8001b2c:	48000400 	.word	0x48000400

08001b30 <led_off>:
 8001b30:	2808      	cmp	r0, #8
 8001b32:	d101      	bne.n	8001b38 <led_off+0x8>
 8001b34:	4b01      	ldr	r3, [pc, #4]	; (8001b3c <led_off+0xc>)
 8001b36:	8518      	strh	r0, [r3, #40]	; 0x28
 8001b38:	4770      	bx	lr
 8001b3a:	46c0      	nop			; (mov r8, r8)
 8001b3c:	48000400 	.word	0x48000400

08001b40 <Default_Handler>:
 8001b40:	46c0      	nop			; (mov r8, r8)
 8001b42:	e7fd      	b.n	8001b40 <Default_Handler>

08001b44 <HardFault_Handler>:
 8001b44:	2008      	movs	r0, #8
 8001b46:	f7ff ffeb 	bl	8001b20 <led_on>
 8001b4a:	4b07      	ldr	r3, [pc, #28]	; (8001b68 <HardFault_Handler+0x24>)
 8001b4c:	3b01      	subs	r3, #1
 8001b4e:	2b00      	cmp	r3, #0
 8001b50:	d001      	beq.n	8001b56 <HardFault_Handler+0x12>
 8001b52:	46c0      	nop			; (mov r8, r8)
 8001b54:	e7fa      	b.n	8001b4c <HardFault_Handler+0x8>
 8001b56:	2008      	movs	r0, #8
 8001b58:	f7ff ffea 	bl	8001b30 <led_off>
 8001b5c:	4b02      	ldr	r3, [pc, #8]	; (8001b68 <HardFault_Handler+0x24>)
 8001b5e:	3b01      	subs	r3, #1
 8001b60:	2b00      	cmp	r3, #0
 8001b62:	d0ef      	beq.n	8001b44 <HardFault_Handler>
 8001b64:	46c0      	nop			; (mov r8, r8)
 8001b66:	e7fa      	b.n	8001b5e <HardFault_Handler+0x1a>
 8001b68:	002dc6c1 	.word	0x002dc6c1

08001b6c <_reset_init>:
 8001b6c:	4a07      	ldr	r2, [pc, #28]	; (8001b8c <_reset_init+0x20>)
 8001b6e:	4908      	ldr	r1, [pc, #32]	; (8001b90 <_reset_init+0x24>)
 8001b70:	2300      	movs	r3, #0
 8001b72:	1a89      	subs	r1, r1, r2
 8001b74:	1089      	asrs	r1, r1, #2
 8001b76:	1c10      	adds	r0, r2, #0
 8001b78:	428b      	cmp	r3, r1
 8001b7a:	d005      	beq.n	8001b88 <_reset_init+0x1c>
 8001b7c:	4c05      	ldr	r4, [pc, #20]	; (8001b94 <_reset_init+0x28>)
 8001b7e:	009a      	lsls	r2, r3, #2
 8001b80:	58a4      	ldr	r4, [r4, r2]
 8001b82:	3301      	adds	r3, #1
 8001b84:	5084      	str	r4, [r0, r2]
 8001b86:	e7f7      	b.n	8001b78 <_reset_init+0xc>
 8001b88:	f7ff f872 	bl	8000c70 <main>
 8001b8c:	20000000 	.word	0x20000000
 8001b90:	20000010 	.word	0x20000010
 8001b94:	080023d8 	.word	0x080023d8

08001b98 <__gnu_thumb1_case_uqi>:
 8001b98:	b402      	push	{r1}
 8001b9a:	4671      	mov	r1, lr
 8001b9c:	0849      	lsrs	r1, r1, #1
 8001b9e:	0049      	lsls	r1, r1, #1
 8001ba0:	5c09      	ldrb	r1, [r1, r0]
 8001ba2:	0049      	lsls	r1, r1, #1
 8001ba4:	448e      	add	lr, r1
 8001ba6:	bc02      	pop	{r1}
 8001ba8:	4770      	bx	lr
 8001baa:	46c0      	nop			; (mov r8, r8)

08001bac <__aeabi_uidiv>:
 8001bac:	2900      	cmp	r1, #0
 8001bae:	d034      	beq.n	8001c1a <.udivsi3_skip_div0_test+0x6a>

08001bb0 <.udivsi3_skip_div0_test>:
 8001bb0:	2301      	movs	r3, #1
 8001bb2:	2200      	movs	r2, #0
 8001bb4:	b410      	push	{r4}
 8001bb6:	4288      	cmp	r0, r1
 8001bb8:	d32c      	bcc.n	8001c14 <.udivsi3_skip_div0_test+0x64>
 8001bba:	2401      	movs	r4, #1
 8001bbc:	0724      	lsls	r4, r4, #28
 8001bbe:	42a1      	cmp	r1, r4
 8001bc0:	d204      	bcs.n	8001bcc <.udivsi3_skip_div0_test+0x1c>
 8001bc2:	4281      	cmp	r1, r0
 8001bc4:	d202      	bcs.n	8001bcc <.udivsi3_skip_div0_test+0x1c>
 8001bc6:	0109      	lsls	r1, r1, #4
 8001bc8:	011b      	lsls	r3, r3, #4
 8001bca:	e7f8      	b.n	8001bbe <.udivsi3_skip_div0_test+0xe>
 8001bcc:	00e4      	lsls	r4, r4, #3
 8001bce:	42a1      	cmp	r1, r4
 8001bd0:	d204      	bcs.n	8001bdc <.udivsi3_skip_div0_test+0x2c>
 8001bd2:	4281      	cmp	r1, r0
 8001bd4:	d202      	bcs.n	8001bdc <.udivsi3_skip_div0_test+0x2c>
 8001bd6:	0049      	lsls	r1, r1, #1
 8001bd8:	005b      	lsls	r3, r3, #1
 8001bda:	e7f8      	b.n	8001bce <.udivsi3_skip_div0_test+0x1e>
 8001bdc:	4288      	cmp	r0, r1
 8001bde:	d301      	bcc.n	8001be4 <.udivsi3_skip_div0_test+0x34>
 8001be0:	1a40      	subs	r0, r0, r1
 8001be2:	431a      	orrs	r2, r3
 8001be4:	084c      	lsrs	r4, r1, #1
 8001be6:	42a0      	cmp	r0, r4
 8001be8:	d302      	bcc.n	8001bf0 <.udivsi3_skip_div0_test+0x40>
 8001bea:	1b00      	subs	r0, r0, r4
 8001bec:	085c      	lsrs	r4, r3, #1
 8001bee:	4322      	orrs	r2, r4
 8001bf0:	088c      	lsrs	r4, r1, #2
 8001bf2:	42a0      	cmp	r0, r4
 8001bf4:	d302      	bcc.n	8001bfc <.udivsi3_skip_div0_test+0x4c>
 8001bf6:	1b00      	subs	r0, r0, r4
 8001bf8:	089c      	lsrs	r4, r3, #2
 8001bfa:	4322      	orrs	r2, r4
 8001bfc:	08cc      	lsrs	r4, r1, #3
 8001bfe:	42a0      	cmp	r0, r4
 8001c00:	d302      	bcc.n	8001c08 <.udivsi3_skip_div0_test+0x58>
 8001c02:	1b00      	subs	r0, r0, r4
 8001c04:	08dc      	lsrs	r4, r3, #3
 8001c06:	4322      	orrs	r2, r4
 8001c08:	2800      	cmp	r0, #0
 8001c0a:	d003      	beq.n	8001c14 <.udivsi3_skip_div0_test+0x64>
 8001c0c:	091b      	lsrs	r3, r3, #4
 8001c0e:	d001      	beq.n	8001c14 <.udivsi3_skip_div0_test+0x64>
 8001c10:	0909      	lsrs	r1, r1, #4
 8001c12:	e7e3      	b.n	8001bdc <.udivsi3_skip_div0_test+0x2c>
 8001c14:	1c10      	adds	r0, r2, #0
 8001c16:	bc10      	pop	{r4}
 8001c18:	4770      	bx	lr
 8001c1a:	2800      	cmp	r0, #0
 8001c1c:	d001      	beq.n	8001c22 <.udivsi3_skip_div0_test+0x72>
 8001c1e:	2000      	movs	r0, #0
 8001c20:	43c0      	mvns	r0, r0
 8001c22:	b407      	push	{r0, r1, r2}
 8001c24:	4802      	ldr	r0, [pc, #8]	; (8001c30 <.udivsi3_skip_div0_test+0x80>)
 8001c26:	a102      	add	r1, pc, #8	; (adr r1, 8001c30 <.udivsi3_skip_div0_test+0x80>)
 8001c28:	1840      	adds	r0, r0, r1
 8001c2a:	9002      	str	r0, [sp, #8]
 8001c2c:	bd03      	pop	{r0, r1, pc}
 8001c2e:	46c0      	nop			; (mov r8, r8)
 8001c30:	000000d9 	.word	0x000000d9

08001c34 <__aeabi_uidivmod>:
 8001c34:	2900      	cmp	r1, #0
 8001c36:	d0f0      	beq.n	8001c1a <.udivsi3_skip_div0_test+0x6a>
 8001c38:	b503      	push	{r0, r1, lr}
 8001c3a:	f7ff ffb9 	bl	8001bb0 <.udivsi3_skip_div0_test>
 8001c3e:	bc0e      	pop	{r1, r2, r3}
 8001c40:	4342      	muls	r2, r0
 8001c42:	1a89      	subs	r1, r1, r2
 8001c44:	4718      	bx	r3
 8001c46:	46c0      	nop			; (mov r8, r8)

08001c48 <__aeabi_idiv>:
 8001c48:	2900      	cmp	r1, #0
 8001c4a:	d041      	beq.n	8001cd0 <.divsi3_skip_div0_test+0x84>

08001c4c <.divsi3_skip_div0_test>:
 8001c4c:	b410      	push	{r4}
 8001c4e:	1c04      	adds	r4, r0, #0
 8001c50:	404c      	eors	r4, r1
 8001c52:	46a4      	mov	ip, r4
 8001c54:	2301      	movs	r3, #1
 8001c56:	2200      	movs	r2, #0
 8001c58:	2900      	cmp	r1, #0
 8001c5a:	d500      	bpl.n	8001c5e <.divsi3_skip_div0_test+0x12>
 8001c5c:	4249      	negs	r1, r1
 8001c5e:	2800      	cmp	r0, #0
 8001c60:	d500      	bpl.n	8001c64 <.divsi3_skip_div0_test+0x18>
 8001c62:	4240      	negs	r0, r0
 8001c64:	4288      	cmp	r0, r1
 8001c66:	d32c      	bcc.n	8001cc2 <.divsi3_skip_div0_test+0x76>
 8001c68:	2401      	movs	r4, #1
 8001c6a:	0724      	lsls	r4, r4, #28
 8001c6c:	42a1      	cmp	r1, r4
 8001c6e:	d204      	bcs.n	8001c7a <.divsi3_skip_div0_test+0x2e>
 8001c70:	4281      	cmp	r1, r0
 8001c72:	d202      	bcs.n	8001c7a <.divsi3_skip_div0_test+0x2e>
 8001c74:	0109      	lsls	r1, r1, #4
 8001c76:	011b      	lsls	r3, r3, #4
 8001c78:	e7f8      	b.n	8001c6c <.divsi3_skip_div0_test+0x20>
 8001c7a:	00e4      	lsls	r4, r4, #3
 8001c7c:	42a1      	cmp	r1, r4
 8001c7e:	d204      	bcs.n	8001c8a <.divsi3_skip_div0_test+0x3e>
 8001c80:	4281      	cmp	r1, r0
 8001c82:	d202      	bcs.n	8001c8a <.divsi3_skip_div0_test+0x3e>
 8001c84:	0049      	lsls	r1, r1, #1
 8001c86:	005b      	lsls	r3, r3, #1
 8001c88:	e7f8      	b.n	8001c7c <.divsi3_skip_div0_test+0x30>
 8001c8a:	4288      	cmp	r0, r1
 8001c8c:	d301      	bcc.n	8001c92 <.divsi3_skip_div0_test+0x46>
 8001c8e:	1a40      	subs	r0, r0, r1
 8001c90:	431a      	orrs	r2, r3
 8001c92:	084c      	lsrs	r4, r1, #1
 8001c94:	42a0      	cmp	r0, r4
 8001c96:	d302      	bcc.n	8001c9e <.divsi3_skip_div0_test+0x52>
 8001c98:	1b00      	subs	r0, r0, r4
 8001c9a:	085c      	lsrs	r4, r3, #1
 8001c9c:	4322      	orrs	r2, r4
 8001c9e:	088c      	lsrs	r4, r1, #2
 8001ca0:	42a0      	cmp	r0, r4
 8001ca2:	d302      	bcc.n	8001caa <.divsi3_skip_div0_test+0x5e>
 8001ca4:	1b00      	subs	r0, r0, r4
 8001ca6:	089c      	lsrs	r4, r3, #2
 8001ca8:	4322      	orrs	r2, r4
 8001caa:	08cc      	lsrs	r4, r1, #3
 8001cac:	42a0      	cmp	r0, r4
 8001cae:	d302      	bcc.n	8001cb6 <.divsi3_skip_div0_test+0x6a>
 8001cb0:	1b00      	subs	r0, r0, r4
 8001cb2:	08dc      	lsrs	r4, r3, #3
 8001cb4:	4322      	orrs	r2, r4
 8001cb6:	2800      	cmp	r0, #0
 8001cb8:	d003      	beq.n	8001cc2 <.divsi3_skip_div0_test+0x76>
 8001cba:	091b      	lsrs	r3, r3, #4
 8001cbc:	d001      	beq.n	8001cc2 <.divsi3_skip_div0_test+0x76>
 8001cbe:	0909      	lsrs	r1, r1, #4
 8001cc0:	e7e3      	b.n	8001c8a <.divsi3_skip_div0_test+0x3e>
 8001cc2:	1c10      	adds	r0, r2, #0
 8001cc4:	4664      	mov	r4, ip
 8001cc6:	2c00      	cmp	r4, #0
 8001cc8:	d500      	bpl.n	8001ccc <.divsi3_skip_div0_test+0x80>
 8001cca:	4240      	negs	r0, r0
 8001ccc:	bc10      	pop	{r4}
 8001cce:	4770      	bx	lr
 8001cd0:	2800      	cmp	r0, #0
 8001cd2:	d006      	beq.n	8001ce2 <.divsi3_skip_div0_test+0x96>
 8001cd4:	db03      	blt.n	8001cde <.divsi3_skip_div0_test+0x92>
 8001cd6:	2000      	movs	r0, #0
 8001cd8:	43c0      	mvns	r0, r0
 8001cda:	0840      	lsrs	r0, r0, #1
 8001cdc:	e001      	b.n	8001ce2 <.divsi3_skip_div0_test+0x96>
 8001cde:	2080      	movs	r0, #128	; 0x80
 8001ce0:	0600      	lsls	r0, r0, #24
 8001ce2:	b407      	push	{r0, r1, r2}
 8001ce4:	4802      	ldr	r0, [pc, #8]	; (8001cf0 <.divsi3_skip_div0_test+0xa4>)
 8001ce6:	a102      	add	r1, pc, #8	; (adr r1, 8001cf0 <.divsi3_skip_div0_test+0xa4>)
 8001ce8:	1840      	adds	r0, r0, r1
 8001cea:	9002      	str	r0, [sp, #8]
 8001cec:	bd03      	pop	{r0, r1, pc}
 8001cee:	46c0      	nop			; (mov r8, r8)
 8001cf0:	00000019 	.word	0x00000019

08001cf4 <__aeabi_idivmod>:
 8001cf4:	2900      	cmp	r1, #0
 8001cf6:	d0eb      	beq.n	8001cd0 <.divsi3_skip_div0_test+0x84>
 8001cf8:	b503      	push	{r0, r1, lr}
 8001cfa:	f7ff ffa7 	bl	8001c4c <.divsi3_skip_div0_test>
 8001cfe:	bc0e      	pop	{r1, r2, r3}
 8001d00:	4342      	muls	r2, r0
 8001d02:	1a89      	subs	r1, r1, r2
 8001d04:	4718      	bx	r3
 8001d06:	46c0      	nop			; (mov r8, r8)

08001d08 <__aeabi_idiv0>:
 8001d08:	4770      	bx	lr
 8001d0a:	46c0      	nop			; (mov r8, r8)

08001d0c <_init>:
 8001d0c:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
 8001d0e:	46c0      	nop			; (mov r8, r8)
 8001d10:	bcf8      	pop	{r3, r4, r5, r6, r7}
 8001d12:	bc08      	pop	{r3}
 8001d14:	469e      	mov	lr, r3
 8001d16:	4770      	bx	lr

08001d18 <_fini>:
 8001d18:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
 8001d1a:	46c0      	nop			; (mov r8, r8)
 8001d1c:	bcf8      	pop	{r3, r4, r5, r6, r7}
 8001d1e:	bc08      	pop	{r3}
 8001d20:	469e      	mov	lr, r3
 8001d22:	4770      	bx	lr
 8001d24:	69647473 	.word	0x69647473
 8001d28:	6e69206f 	.word	0x6e69206f
 8001d2c:	64207469 	.word	0x64207469
 8001d30:	0a656e6f 	.word	0x0a656e6f
	...

08001d35 <font_data>:
	...
 8001d45:	3c180000 18183c3c 18180018 00000000     ...<<<..........
 8001d55:	63636300 00000022 00000000 00000000     .ccc"...........
 8001d65:	36000000 36367f36 36367f36 00000000     ...66.666.66....
 8001d75:	633e0c0c 033e6061 3e634303 00000c0c     ..>ca`>..Cc>....
 8001d85:	00000000 06636100 6333180c 00000000     .....ac...3c....
 8001d95:	1c000000 3b1c3636 3b66666e 00000000     ....66.;nff;....
 8001da5:	30303000 00000060 00000000 00000000     .000`...........
 8001db5:	180c0000 30303018 0c181830 00000000     .....0000.......
 8001dc5:	0c180000 0606060c 180c0c06 00000000     ................
 8001dd5:	00000000 ff3c6642 0042663c 00000000     ....Bf<.<fB.....
 8001de5:	00000000 ff181818 00181818 00000000     ................
	...
 8001dfd:	18180000 00003018 00000000 ff000000     .....0..........
	...
 8001e1d:	18180000 00000000 03010000 381c0e07     ...............8
 8001e2d:	80c0e070 00000000 633e0000 6b6b6363     p.........>ccckk
 8001e3d:	3e636363 00000000 1c0c0000 0c0c0c3c     ccc>........<...
 8001e4d:	3f0c0c0c 00000000 633e0000 180c0603     ...?......>c....
 8001e5d:	7f636130 00000000 633e0000 031e0303     0ac.......>c....
 8001e6d:	3e630303 00000000 0e060000 6666361e     ..c>.........6ff
 8001e7d:	0f06067f 00000000 607f0000 037e6060     ...........```~.
 8001e8d:	3e736303 00000000 301c0000 637e6060     .cs>.......0``~c
 8001e9d:	3e636363 00000000 637f0000 0c060603     ccc>.......c....
 8001ead:	1818180c 00000000 633e0000 633e6363     ..........>ccc>c
 8001ebd:	3e636363 00000000 633e0000 3f636363     ccc>......>cccc?
 8001ecd:	3c060303 00000000 00000000 00181800     ...<............
 8001edd:	18180000 00000000 00000000 00181800     ................
 8001eed:	18180000 00003018 06000000 6030180c     .....0........0`
 8001efd:	060c1830 00000000 00000000 007e0000     0.............~.
 8001f0d:	00007e00 00000000 60000000 060c1830     .~.........`0...
 8001f1d:	6030180c 00000000 633e0000 0c0c0663     ..0`......>cc...
 8001f2d:	0c0c000c 00000000 633e0000 6b6b6f63     ..........>ccokk
 8001f3d:	3e60606e 00000000 1c080000 63636336     n``>........6ccc
 8001f4d:	6363637f 00000000 337e0000 333e3333     .ccc......~333>3
 8001f5d:	7e333333 00000000 331e0000 60606061     333~.......3a```
 8001f6d:	1e336160 00000000 367c0000 33333333     `a3.......|63333
 8001f7d:	7c363333 00000000 337f0000 343c3431     336|.......314<4
 8001f8d:	7f333130 00000000 337f0000 343c3431     013........314<4
 8001f9d:	78303030 00000000 331e0000 6f606061     000x.......3a``o
 8001fad:	1d376363 00000000 63630000 637f6363     cc7.......cccc.c
 8001fbd:	63636363 00000000 183c0000 18181818     cccc......<.....
 8001fcd:	3c181818 00000000 060f0000 06060606     ...<............
 8001fdd:	3c666606 00000000 33730000 363c3636     .ff<......s366<6
 8001fed:	73333336 00000000 30780000 30303030     633s......x00000
 8001ffd:	7f333130 00000000 77630000 63636b7f     013.......cw.kcc
 800200d:	63636363 00000000 63630000 6f7f7b73     cccc......ccs{.o
 800201d:	63636367 00000000 361c0000 63636363     gccc.......6cccc
 800202d:	1c366363 00000000 337e0000 303e3333     cc6.......~333>0
 800203d:	78303030 00000000 633e0000 63636363     000x......>ccccc
 800204d:	3e6f6b63 00000706 337e0000 363e3333     cko>......~333>6
 800205d:	73333336 00000000 633e0000 061c3063     633s......>cc0..
 800206d:	3e636303 00000000 dbff0000 18181899     .cc>............
 800207d:	3c181818 00000000 63630000 63636363     ...<......cccccc
 800208d:	3e636363 00000000 63630000 63636363     ccc>......cccccc
 800209d:	081c3663 00000000 63630000 6b636363     c6........ccccck
 80020ad:	36367f6b 00000000 c3c30000 18183c66     k.66........f<..
 80020bd:	c3c3663c 00000000 c3c30000 183c66c3     <f...........f<.
 80020cd:	3c181818 00000000 637f0000 180c0643     ...<.......cC...
 80020dd:	7f636130 00000000 303c0000 30303030     0ac.......<00000
 80020ed:	3c303030 00000000 c0800000 1c3870e0     000<.........p8.
 80020fd:	0103070e 00000000 0c3c0000 0c0c0c0c     ..........<.....
 800210d:	3c0c0c0c 00000000 63361c08 00000000     ...<......6c....
	...
 8002131:	000000ff 000c1818 00000000 00000000     ................
	...
 8002149:	06463c00 3b66663e 00000000 30700000     .<F.>ff;......p0
 8002159:	33363c30 6e333333 00000000 00000000     0<63333n........
 8002169:	60633e00 3e636060 00000000 060e0000     .>c```c>........
 8002179:	66361e06 3b666666 00000000 00000000     ..6ffff;........
 8002189:	63633e00 3e63607e 00000000 361c0000     .>cc~`c>.......6
 8002199:	307c3032 78303030 00000000 00000000     20|0000x........
 80021a9:	66663b00 063e6666 00003c66 30700000     .;ffff>.f<....p0
 80021b9:	333b3630 73333333 00000000 0c0c0000     06;3333s........
 80021c9:	0c0c1c00 1e0c0c0c 00000000 06060000     ................
 80021d9:	06060e00 66060606 00003c66 30700000     .......ff<....p0
 80021e9:	36333330 7333363c 00000000 0c1c0000     0336<63s........
 80021f9:	0c0c0c0c 1e0c0c0c 00000000 00000000     ................
 8002209:	6b7f6e00 6b6b6b6b 00000000 00000000     .n.kkkkk........
 8002219:	33336e00 33333333 00000000 00000000     .n333333........
 8002229:	63633e00 3e636363 00000000 00000000     .>ccccc>........
 8002239:	33336e00 303e3333 00007830 00000000     .n3333>00x......
 8002249:	66663b00 063e6666 00000f06 00000000     .;ffff>.........
 8002259:	333b6e00 78303030 00000000 00000000     .n;3000x........
 8002269:	38633e00 3e63030e 00000000 18080000     .>c8..c>........
 8002279:	18187e18 0e1b1818 00000000 00000000     .~..............
 8002289:	66666600 3b666666 00000000 00000000     .ffffff;........
 8002299:	36636300 081c1c36 00000000 00000000     .cc66...........
 80022a9:	63636300 367f6b6b 00000000 00000000     .ccckk.6........
 80022b9:	1c366300 63361c1c 00000000 00000000     .c6...6c........
 80022c9:	63636300 033f6363 00003c06 00000000     .ccccc?..<......
 80022d9:	0c667f00 7f633018 00000000 180e0000     ..f..0c.........
 80022e9:	18701818 0e181818 00000000 18180000     ..p.............
 80022f9:	00181818 18181818 00000018 18700000     ..............p.
 8002309:	180e1818 70181818 00000000 6e3b0000     .......p......;n
	...
 8002325:	d8d87000 00000070 00000000 00000000     .p..p...........
 8002335:	3a207525 5b000a20 25206925 69252069     %u : ..[%i %i %i
 8002345:	0a00205d 636c6577 20656d6f 53206f74     ] ..welcome to S
 8002355:	68757a75 20534f61 205e5f5e 2e322e32     uzuhaOS ^_^ 2.2.
 8002365:	55420a30 20444c49 2072614d 32203232     0.BUILD Mar 22 2
 8002375:	20363130 343a3032 37343a39 6f62000a     016 20:49:47..bo
 8002385:	6e69746f 72662067 25206d6f 72000a75     oting from %u..r
 8002395:	73206d61 74726174 20752520 6172000a     am start %u ..ra
 80023a5:	6973206d 2520657a 000a2075 206d6172     m size %u ..ram 
 80023b5:	65657266 20752520 6568000a 73207061     free %u ..heap s
 80023c5:	74726174 20752520 0a0a000a 00000000              tart %u .......

080023d4 <__EH_FRAME_BEGIN__>:
 80023d4:	00000000                                ....
