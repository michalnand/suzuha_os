
bin/main.elf:     file format elf32-littlearm


Disassembly of section .text:

080000c0 <mem_info_print>:
 80000c0:	b538      	push	{r3, r4, r5, lr}
 80000c2:	490e      	ldr	r1, [pc, #56]	; (80000fc <mem_info_print+0x3c>)
 80000c4:	480e      	ldr	r0, [pc, #56]	; (8000100 <mem_info_print+0x40>)
 80000c6:	f000 f9e9 	bl	800049c <printf_>
 80000ca:	4c0e      	ldr	r4, [pc, #56]	; (8000104 <mem_info_print+0x44>)
 80000cc:	480e      	ldr	r0, [pc, #56]	; (8000108 <mem_info_print+0x48>)
 80000ce:	1c21      	adds	r1, r4, #0
 80000d0:	f000 f9e4 	bl	800049c <printf_>
 80000d4:	4d0d      	ldr	r5, [pc, #52]	; (800010c <mem_info_print+0x4c>)
 80000d6:	480e      	ldr	r0, [pc, #56]	; (8000110 <mem_info_print+0x50>)
 80000d8:	1b2d      	subs	r5, r5, r4
 80000da:	1c29      	adds	r1, r5, #0
 80000dc:	f000 f9de 	bl	800049c <printf_>
 80000e0:	490c      	ldr	r1, [pc, #48]	; (8000114 <mem_info_print+0x54>)
 80000e2:	480d      	ldr	r0, [pc, #52]	; (8000118 <mem_info_print+0x58>)
 80000e4:	1a64      	subs	r4, r4, r1
 80000e6:	1929      	adds	r1, r5, r4
 80000e8:	f000 f9d8 	bl	800049c <printf_>
 80000ec:	490b      	ldr	r1, [pc, #44]	; (800011c <mem_info_print+0x5c>)
 80000ee:	480c      	ldr	r0, [pc, #48]	; (8000120 <mem_info_print+0x60>)
 80000f0:	f000 f9d4 	bl	800049c <printf_>
 80000f4:	480b      	ldr	r0, [pc, #44]	; (8000124 <mem_info_print+0x64>)
 80000f6:	f000 f9d1 	bl	800049c <printf_>
 80000fa:	bd38      	pop	{r3, r4, r5, pc}
 80000fc:	080015e4 	.word	0x080015e4
 8000100:	080015fc 	.word	0x080015fc
 8000104:	20000000 	.word	0x20000000
 8000108:	0800160d 	.word	0x0800160d
 800010c:	20002000 	.word	0x20002000
 8000110:	0800161c 	.word	0x0800161c
 8000114:	20000980 	.word	0x20000980
 8000118:	0800162a 	.word	0x0800162a
 800011c:	20000980 	.word	0x20000980
 8000120:	08001638 	.word	0x08001638
 8000124:	08001648 	.word	0x08001648

08000128 <main>:
 8000128:	b508      	push	{r3, lr}
 800012a:	f000 fb99 	bl	8000860 <lib_low_level_init>
 800012e:	f000 f933 	bl	8000398 <lib_os_init>
 8000132:	f7ff ffc5 	bl	80000c0 <mem_info_print>
 8000136:	2280      	movs	r2, #128	; 0x80
 8000138:	4904      	ldr	r1, [pc, #16]	; (800014c <main+0x24>)
 800013a:	00d2      	lsls	r2, r2, #3
 800013c:	2308      	movs	r3, #8
 800013e:	4804      	ldr	r0, [pc, #16]	; (8000150 <main+0x28>)
 8000140:	f000 f894 	bl	800026c <create_thread>
 8000144:	f000 f88c 	bl	8000260 <kernel_start>
 8000148:	2000      	movs	r0, #0
 800014a:	bd08      	pop	{r3, pc}
 800014c:	20000408 	.word	0x20000408
 8000150:	080006d9 	.word	0x080006d9

08000154 <thread_ending>:
 8000154:	b672      	cpsid	i
 8000156:	4b05      	ldr	r3, [pc, #20]	; (800016c <thread_ending+0x18>)
 8000158:	220c      	movs	r2, #12
 800015a:	681b      	ldr	r3, [r3, #0]
 800015c:	4353      	muls	r3, r2
 800015e:	4a04      	ldr	r2, [pc, #16]	; (8000170 <thread_ending+0x1c>)
 8000160:	18d3      	adds	r3, r2, r3
 8000162:	2200      	movs	r2, #0
 8000164:	605a      	str	r2, [r3, #4]
 8000166:	b662      	cpsie	i
 8000168:	46c0      	nop			; (mov r8, r8)
 800016a:	e7fd      	b.n	8000168 <thread_ending+0x14>
 800016c:	20000868 	.word	0x20000868
 8000170:	20000808 	.word	0x20000808

08000174 <null_thread>:
 8000174:	b508      	push	{r3, lr}
 8000176:	f000 fc0f 	bl	8000998 <sleep>
 800017a:	e7fc      	b.n	8000176 <null_thread+0x2>

0800017c <scheduler>:
 800017c:	b5f0      	push	{r4, r5, r6, r7, lr}
 800017e:	2100      	movs	r1, #0
 8000180:	1c0a      	adds	r2, r1, #0
 8000182:	200c      	movs	r0, #12
 8000184:	1c05      	adds	r5, r0, #0
 8000186:	4355      	muls	r5, r2
 8000188:	4b14      	ldr	r3, [pc, #80]	; (80001dc <scheduler+0x60>)
 800018a:	195e      	adds	r6, r3, r5
 800018c:	6874      	ldr	r4, [r6, #4]
 800018e:	46a4      	mov	ip, r4
 8000190:	4667      	mov	r7, ip
 8000192:	1c1c      	adds	r4, r3, #0
 8000194:	07bf      	lsls	r7, r7, #30
 8000196:	d40a      	bmi.n	80001ae <scheduler+0x32>
 8000198:	6876      	ldr	r6, [r6, #4]
 800019a:	07f7      	lsls	r7, r6, #31
 800019c:	d507      	bpl.n	80001ae <scheduler+0x32>
 800019e:	4348      	muls	r0, r1
 80001a0:	595d      	ldr	r5, [r3, r5]
 80001a2:	5818      	ldr	r0, [r3, r0]
 80001a4:	b2ad      	uxth	r5, r5
 80001a6:	b280      	uxth	r0, r0
 80001a8:	4285      	cmp	r5, r0
 80001aa:	d200      	bcs.n	80001ae <scheduler+0x32>
 80001ac:	1c11      	adds	r1, r2, #0
 80001ae:	200c      	movs	r0, #12
 80001b0:	4350      	muls	r0, r2
 80001b2:	581d      	ldr	r5, [r3, r0]
 80001b4:	b2ad      	uxth	r5, r5
 80001b6:	2d00      	cmp	r5, #0
 80001b8:	d004      	beq.n	80001c4 <scheduler+0x48>
 80001ba:	581d      	ldr	r5, [r3, r0]
 80001bc:	b2ad      	uxth	r5, r5
 80001be:	3d01      	subs	r5, #1
 80001c0:	b2ad      	uxth	r5, r5
 80001c2:	521d      	strh	r5, [r3, r0]
 80001c4:	3201      	adds	r2, #1
 80001c6:	2a08      	cmp	r2, #8
 80001c8:	d1db      	bne.n	8000182 <scheduler+0x6>
 80001ca:	230c      	movs	r3, #12
 80001cc:	434b      	muls	r3, r1
 80001ce:	58e2      	ldr	r2, [r4, r3]
 80001d0:	0c12      	lsrs	r2, r2, #16
 80001d2:	52e2      	strh	r2, [r4, r3]
 80001d4:	4b02      	ldr	r3, [pc, #8]	; (80001e0 <scheduler+0x64>)
 80001d6:	6019      	str	r1, [r3, #0]
 80001d8:	bdf0      	pop	{r4, r5, r6, r7, pc}
 80001da:	46c0      	nop			; (mov r8, r8)
 80001dc:	20000808 	.word	0x20000808
 80001e0:	20000868 	.word	0x20000868

080001e4 <SysTick_Handler>:
 80001e4:	b4f0      	push	{r4, r5, r6, r7}
 80001e6:	4644      	mov	r4, r8
 80001e8:	464d      	mov	r5, r9
 80001ea:	4656      	mov	r6, sl
 80001ec:	465f      	mov	r7, fp
 80001ee:	b4f0      	push	{r4, r5, r6, r7}
 80001f0:	f000 fbc2 	bl	8000978 <__get_MSP>
 80001f4:	4c0f      	ldr	r4, [pc, #60]	; (8000234 <SysTick_Handler+0x50>)
 80001f6:	4d10      	ldr	r5, [pc, #64]	; (8000238 <SysTick_Handler+0x54>)
 80001f8:	6823      	ldr	r3, [r4, #0]
 80001fa:	3301      	adds	r3, #1
 80001fc:	d005      	beq.n	800020a <SysTick_Handler+0x26>
 80001fe:	6823      	ldr	r3, [r4, #0]
 8000200:	220c      	movs	r2, #12
 8000202:	4353      	muls	r3, r2
 8000204:	18eb      	adds	r3, r5, r3
 8000206:	6098      	str	r0, [r3, #8]
 8000208:	e001      	b.n	800020e <SysTick_Handler+0x2a>
 800020a:	2300      	movs	r3, #0
 800020c:	6023      	str	r3, [r4, #0]
 800020e:	f7ff ffb5 	bl	800017c <scheduler>
 8000212:	6823      	ldr	r3, [r4, #0]
 8000214:	220c      	movs	r2, #12
 8000216:	4353      	muls	r3, r2
 8000218:	18ed      	adds	r5, r5, r3
 800021a:	2307      	movs	r3, #7
 800021c:	68aa      	ldr	r2, [r5, #8]
 800021e:	425b      	negs	r3, r3
 8000220:	469e      	mov	lr, r3
 8000222:	f382 8808 	msr	MSP, r2
 8000226:	bcf0      	pop	{r4, r5, r6, r7}
 8000228:	46a0      	mov	r8, r4
 800022a:	46a9      	mov	r9, r5
 800022c:	46b2      	mov	sl, r6
 800022e:	46bb      	mov	fp, r7
 8000230:	bcf0      	pop	{r4, r5, r6, r7}
 8000232:	4770      	bx	lr
 8000234:	20000868 	.word	0x20000868
 8000238:	20000808 	.word	0x20000808

0800023c <sched_off>:
 800023c:	b672      	cpsid	i
 800023e:	4770      	bx	lr

08000240 <sched_on>:
 8000240:	b662      	cpsie	i
 8000242:	4770      	bx	lr

08000244 <yield>:
 8000244:	46c0      	nop			; (mov r8, r8)
 8000246:	4770      	bx	lr

08000248 <get_thread_id>:
 8000248:	b082      	sub	sp, #8
 800024a:	b672      	cpsid	i
 800024c:	4b03      	ldr	r3, [pc, #12]	; (800025c <get_thread_id+0x14>)
 800024e:	681b      	ldr	r3, [r3, #0]
 8000250:	9301      	str	r3, [sp, #4]
 8000252:	b662      	cpsie	i
 8000254:	9801      	ldr	r0, [sp, #4]
 8000256:	b002      	add	sp, #8
 8000258:	4770      	bx	lr
 800025a:	46c0      	nop			; (mov r8, r8)
 800025c:	20000868 	.word	0x20000868

08000260 <kernel_start>:
 8000260:	b508      	push	{r3, lr}
 8000262:	f000 fb8d 	bl	8000980 <sys_tick_init>
 8000266:	46c0      	nop			; (mov r8, r8)
 8000268:	e7fd      	b.n	8000266 <kernel_start+0x6>
	...

0800026c <create_thread>:
 800026c:	b5f0      	push	{r4, r5, r6, r7, lr}
 800026e:	b085      	sub	sp, #20
 8000270:	9003      	str	r0, [sp, #12]
 8000272:	481b      	ldr	r0, [pc, #108]	; (80002e0 <create_thread+0x74>)
 8000274:	0892      	lsrs	r2, r2, #2
 8000276:	1812      	adds	r2, r2, r0
 8000278:	0092      	lsls	r2, r2, #2
 800027a:	1888      	adds	r0, r1, r2
 800027c:	1c17      	adds	r7, r2, #0
 800027e:	9002      	str	r0, [sp, #8]
 8000280:	1c10      	adds	r0, r2, #0
 8000282:	323c      	adds	r2, #60	; 0x3c
 8000284:	188a      	adds	r2, r1, r2
 8000286:	3034      	adds	r0, #52	; 0x34
 8000288:	3738      	adds	r7, #56	; 0x38
 800028a:	9201      	str	r2, [sp, #4]
 800028c:	180e      	adds	r6, r1, r0
 800028e:	19cf      	adds	r7, r1, r7
 8000290:	2200      	movs	r2, #0
 8000292:	b672      	cpsid	i
 8000294:	250c      	movs	r5, #12
 8000296:	4355      	muls	r5, r2
 8000298:	4c12      	ldr	r4, [pc, #72]	; (80002e4 <create_thread+0x78>)
 800029a:	2008      	movs	r0, #8
 800029c:	1965      	adds	r5, r4, r5
 800029e:	6869      	ldr	r1, [r5, #4]
 80002a0:	07c9      	lsls	r1, r1, #31
 80002a2:	d415      	bmi.n	80002d0 <create_thread+0x64>
 80002a4:	9902      	ldr	r1, [sp, #8]
 80002a6:	60a9      	str	r1, [r5, #8]
 80002a8:	4d0f      	ldr	r5, [pc, #60]	; (80002e8 <create_thread+0x7c>)
 80002aa:	9903      	ldr	r1, [sp, #12]
 80002ac:	6035      	str	r5, [r6, #0]
 80002ae:	6039      	str	r1, [r7, #0]
 80002b0:	2584      	movs	r5, #132	; 0x84
 80002b2:	9901      	ldr	r1, [sp, #4]
 80002b4:	05ad      	lsls	r5, r5, #22
 80002b6:	600d      	str	r5, [r1, #0]
 80002b8:	2b07      	cmp	r3, #7
 80002ba:	d800      	bhi.n	80002be <create_thread+0x52>
 80002bc:	1c03      	adds	r3, r0, #0
 80002be:	200c      	movs	r0, #12
 80002c0:	4350      	muls	r0, r2
 80002c2:	4908      	ldr	r1, [pc, #32]	; (80002e4 <create_thread+0x78>)
 80002c4:	180d      	adds	r5, r1, r0
 80002c6:	806b      	strh	r3, [r5, #2]
 80002c8:	5223      	strh	r3, [r4, r0]
 80002ca:	2001      	movs	r0, #1
 80002cc:	6068      	str	r0, [r5, #4]
 80002ce:	1c10      	adds	r0, r2, #0
 80002d0:	b662      	cpsie	i
 80002d2:	3201      	adds	r2, #1
 80002d4:	2a08      	cmp	r2, #8
 80002d6:	d001      	beq.n	80002dc <create_thread+0x70>
 80002d8:	2808      	cmp	r0, #8
 80002da:	d0da      	beq.n	8000292 <create_thread+0x26>
 80002dc:	b005      	add	sp, #20
 80002de:	bdf0      	pop	{r4, r5, r6, r7, pc}
 80002e0:	3ffffff0 	.word	0x3ffffff0
 80002e4:	20000808 	.word	0x20000808
 80002e8:	08000155 	.word	0x08000155

080002ec <kernel_init>:
 80002ec:	b510      	push	{r4, lr}
 80002ee:	2300      	movs	r3, #0
 80002f0:	210c      	movs	r1, #12
 80002f2:	4359      	muls	r1, r3
 80002f4:	4a0a      	ldr	r2, [pc, #40]	; (8000320 <kernel_init+0x34>)
 80002f6:	2000      	movs	r0, #0
 80002f8:	1854      	adds	r4, r2, r1
 80002fa:	6060      	str	r0, [r4, #4]
 80002fc:	3301      	adds	r3, #1
 80002fe:	2008      	movs	r0, #8
 8000300:	8060      	strh	r0, [r4, #2]
 8000302:	5288      	strh	r0, [r1, r2]
 8000304:	4283      	cmp	r3, r0
 8000306:	d1f3      	bne.n	80002f0 <kernel_init+0x4>
 8000308:	4b06      	ldr	r3, [pc, #24]	; (8000324 <kernel_init+0x38>)
 800030a:	2201      	movs	r2, #1
 800030c:	4252      	negs	r2, r2
 800030e:	601a      	str	r2, [r3, #0]
 8000310:	4905      	ldr	r1, [pc, #20]	; (8000328 <kernel_init+0x3c>)
 8000312:	2280      	movs	r2, #128	; 0x80
 8000314:	23ff      	movs	r3, #255	; 0xff
 8000316:	4805      	ldr	r0, [pc, #20]	; (800032c <kernel_init+0x40>)
 8000318:	f7ff ffa8 	bl	800026c <create_thread>
 800031c:	bd10      	pop	{r4, pc}
 800031e:	46c0      	nop			; (mov r8, r8)
 8000320:	20000808 	.word	0x20000808
 8000324:	20000868 	.word	0x20000868
 8000328:	2000086c 	.word	0x2000086c
 800032c:	08000175 	.word	0x08000175

08000330 <set_wait_state>:
 8000330:	b507      	push	{r0, r1, r2, lr}
 8000332:	f7ff ff89 	bl	8000248 <get_thread_id>
 8000336:	9000      	str	r0, [sp, #0]
 8000338:	b672      	cpsid	i
 800033a:	9a00      	ldr	r2, [sp, #0]
 800033c:	210c      	movs	r1, #12
 800033e:	434a      	muls	r2, r1
 8000340:	4b0b      	ldr	r3, [pc, #44]	; (8000370 <set_wait_state+0x40>)
 8000342:	2002      	movs	r0, #2
 8000344:	189a      	adds	r2, r3, r2
 8000346:	6851      	ldr	r1, [r2, #4]
 8000348:	4301      	orrs	r1, r0
 800034a:	6051      	str	r1, [r2, #4]
 800034c:	1c19      	adds	r1, r3, #0
 800034e:	b672      	cpsid	i
 8000350:	9b00      	ldr	r3, [sp, #0]
 8000352:	220c      	movs	r2, #12
 8000354:	4353      	muls	r3, r2
 8000356:	18cb      	adds	r3, r1, r3
 8000358:	685b      	ldr	r3, [r3, #4]
 800035a:	9301      	str	r3, [sp, #4]
 800035c:	b662      	cpsie	i
 800035e:	9a01      	ldr	r2, [sp, #4]
 8000360:	2302      	movs	r3, #2
 8000362:	421a      	tst	r2, r3
 8000364:	d000      	beq.n	8000368 <set_wait_state+0x38>
 8000366:	46c0      	nop			; (mov r8, r8)
 8000368:	9a01      	ldr	r2, [sp, #4]
 800036a:	421a      	tst	r2, r3
 800036c:	d1ef      	bne.n	800034e <set_wait_state+0x1e>
 800036e:	bd07      	pop	{r0, r1, r2, pc}
 8000370:	20000808 	.word	0x20000808

08000374 <wake_up_threads>:
 8000374:	2300      	movs	r3, #0
 8000376:	b672      	cpsid	i
 8000378:	220c      	movs	r2, #12
 800037a:	435a      	muls	r2, r3
 800037c:	4905      	ldr	r1, [pc, #20]	; (8000394 <wake_up_threads+0x20>)
 800037e:	2002      	movs	r0, #2
 8000380:	188a      	adds	r2, r1, r2
 8000382:	6851      	ldr	r1, [r2, #4]
 8000384:	4381      	bics	r1, r0
 8000386:	6051      	str	r1, [r2, #4]
 8000388:	b662      	cpsie	i
 800038a:	3301      	adds	r3, #1
 800038c:	2b08      	cmp	r3, #8
 800038e:	d1f2      	bne.n	8000376 <wake_up_threads+0x2>
 8000390:	4770      	bx	lr
 8000392:	46c0      	nop			; (mov r8, r8)
 8000394:	20000808 	.word	0x20000808

08000398 <lib_os_init>:
 8000398:	b508      	push	{r3, lr}
 800039a:	f7ff ffa7 	bl	80002ec <kernel_init>
 800039e:	f000 f8f7 	bl	8000590 <messages_init>
 80003a2:	f000 f8cb 	bl	800053c <stdio_init>
 80003a6:	bd08      	pop	{r3, pc}

080003a8 <putc_>:
 80003a8:	b538      	push	{r3, r4, r5, lr}
 80003aa:	4c06      	ldr	r4, [pc, #24]	; (80003c4 <putc_+0x1c>)
 80003ac:	1c05      	adds	r5, r0, #0
 80003ae:	1c20      	adds	r0, r4, #0
 80003b0:	f000 f911 	bl	80005d6 <mutex_lock>
 80003b4:	1c28      	adds	r0, r5, #0
 80003b6:	f000 f9af 	bl	8000718 <uart_write>
 80003ba:	1c20      	adds	r0, r4, #0
 80003bc:	f000 f927 	bl	800060e <mutex_unlock>
 80003c0:	bd38      	pop	{r3, r4, r5, pc}
 80003c2:	46c0      	nop			; (mov r8, r8)
 80003c4:	200008ec 	.word	0x200008ec

080003c8 <puts_>:
 80003c8:	b538      	push	{r3, r4, r5, lr}
 80003ca:	4d08      	ldr	r5, [pc, #32]	; (80003ec <puts_+0x24>)
 80003cc:	1c04      	adds	r4, r0, #0
 80003ce:	1c28      	adds	r0, r5, #0
 80003d0:	f000 f901 	bl	80005d6 <mutex_lock>
 80003d4:	3401      	adds	r4, #1
 80003d6:	1e63      	subs	r3, r4, #1
 80003d8:	7818      	ldrb	r0, [r3, #0]
 80003da:	2800      	cmp	r0, #0
 80003dc:	d002      	beq.n	80003e4 <puts_+0x1c>
 80003de:	f7ff ffe3 	bl	80003a8 <putc_>
 80003e2:	e7f7      	b.n	80003d4 <puts_+0xc>
 80003e4:	1c28      	adds	r0, r5, #0
 80003e6:	f000 f912 	bl	800060e <mutex_unlock>
 80003ea:	bd38      	pop	{r3, r4, r5, pc}
 80003ec:	200008f8 	.word	0x200008f8

080003f0 <puti_>:
 80003f0:	b5f0      	push	{r4, r5, r6, r7, lr}
 80003f2:	2300      	movs	r3, #0
 80003f4:	b085      	sub	sp, #20
 80003f6:	1c04      	adds	r4, r0, #0
 80003f8:	1c1f      	adds	r7, r3, #0
 80003fa:	4298      	cmp	r0, r3
 80003fc:	da01      	bge.n	8000402 <puti_+0x12>
 80003fe:	4244      	negs	r4, r0
 8000400:	2701      	movs	r7, #1
 8000402:	ae01      	add	r6, sp, #4
 8000404:	72f3      	strb	r3, [r6, #11]
 8000406:	250a      	movs	r5, #10
 8000408:	1c20      	adds	r0, r4, #0
 800040a:	210a      	movs	r1, #10
 800040c:	f001 f890 	bl	8001530 <__aeabi_idivmod>
 8000410:	3130      	adds	r1, #48	; 0x30
 8000412:	5571      	strb	r1, [r6, r5]
 8000414:	1c20      	adds	r0, r4, #0
 8000416:	210a      	movs	r1, #10
 8000418:	f001 f834 	bl	8001484 <__aeabi_idiv>
 800041c:	1e6b      	subs	r3, r5, #1
 800041e:	1e04      	subs	r4, r0, #0
 8000420:	d001      	beq.n	8000426 <puti_+0x36>
 8000422:	1c1d      	adds	r5, r3, #0
 8000424:	e7f0      	b.n	8000408 <puti_+0x18>
 8000426:	2f00      	cmp	r7, #0
 8000428:	d002      	beq.n	8000430 <puti_+0x40>
 800042a:	222d      	movs	r2, #45	; 0x2d
 800042c:	54f2      	strb	r2, [r6, r3]
 800042e:	1c1d      	adds	r5, r3, #0
 8000430:	1970      	adds	r0, r6, r5
 8000432:	f7ff ffc9 	bl	80003c8 <puts_>
 8000436:	b005      	add	sp, #20
 8000438:	bdf0      	pop	{r4, r5, r6, r7, pc}

0800043a <putui_>:
 800043a:	b57f      	push	{r0, r1, r2, r3, r4, r5, r6, lr}
 800043c:	2300      	movs	r3, #0
 800043e:	ae01      	add	r6, sp, #4
 8000440:	1c05      	adds	r5, r0, #0
 8000442:	72f3      	strb	r3, [r6, #11]
 8000444:	240a      	movs	r4, #10
 8000446:	1c28      	adds	r0, r5, #0
 8000448:	210a      	movs	r1, #10
 800044a:	f001 f811 	bl	8001470 <__aeabi_uidivmod>
 800044e:	3130      	adds	r1, #48	; 0x30
 8000450:	5531      	strb	r1, [r6, r4]
 8000452:	1c28      	adds	r0, r5, #0
 8000454:	210a      	movs	r1, #10
 8000456:	f000 ffc7 	bl	80013e8 <__aeabi_uidiv>
 800045a:	1e63      	subs	r3, r4, #1
 800045c:	1e05      	subs	r5, r0, #0
 800045e:	d001      	beq.n	8000464 <putui_+0x2a>
 8000460:	1c1c      	adds	r4, r3, #0
 8000462:	e7f0      	b.n	8000446 <putui_+0xc>
 8000464:	1930      	adds	r0, r6, r4
 8000466:	f7ff ffaf 	bl	80003c8 <puts_>
 800046a:	bd7f      	pop	{r0, r1, r2, r3, r4, r5, r6, pc}

0800046c <putx_>:
 800046c:	b51f      	push	{r0, r1, r2, r3, r4, lr}
 800046e:	2300      	movs	r3, #0
 8000470:	aa01      	add	r2, sp, #4
 8000472:	72d3      	strb	r3, [r2, #11]
 8000474:	230a      	movs	r3, #10
 8000476:	210f      	movs	r1, #15
 8000478:	4001      	ands	r1, r0
 800047a:	2909      	cmp	r1, #9
 800047c:	d801      	bhi.n	8000482 <putx_+0x16>
 800047e:	3130      	adds	r1, #48	; 0x30
 8000480:	e000      	b.n	8000484 <putx_+0x18>
 8000482:	3157      	adds	r1, #87	; 0x57
 8000484:	54d1      	strb	r1, [r2, r3]
 8000486:	0900      	lsrs	r0, r0, #4
 8000488:	1e59      	subs	r1, r3, #1
 800048a:	2800      	cmp	r0, #0
 800048c:	d001      	beq.n	8000492 <putx_+0x26>
 800048e:	1c0b      	adds	r3, r1, #0
 8000490:	e7f1      	b.n	8000476 <putx_+0xa>
 8000492:	18d0      	adds	r0, r2, r3
 8000494:	f7ff ff98 	bl	80003c8 <puts_>
 8000498:	b005      	add	sp, #20
 800049a:	bd00      	pop	{pc}

0800049c <printf_>:
 800049c:	b40f      	push	{r0, r1, r2, r3}
 800049e:	b573      	push	{r0, r1, r4, r5, r6, lr}
 80004a0:	4e25      	ldr	r6, [pc, #148]	; (8000538 <printf_+0x9c>)
 80004a2:	ac06      	add	r4, sp, #24
 80004a4:	cc20      	ldmia	r4!, {r5}
 80004a6:	1c30      	adds	r0, r6, #0
 80004a8:	f000 f895 	bl	80005d6 <mutex_lock>
 80004ac:	9401      	str	r4, [sp, #4]
 80004ae:	2400      	movs	r4, #0
 80004b0:	5d28      	ldrb	r0, [r5, r4]
 80004b2:	2800      	cmp	r0, #0
 80004b4:	d039      	beq.n	800052a <printf_+0x8e>
 80004b6:	2825      	cmp	r0, #37	; 0x25
 80004b8:	d003      	beq.n	80004c2 <printf_+0x26>
 80004ba:	f7ff ff75 	bl	80003a8 <putc_>
 80004be:	3401      	adds	r4, #1
 80004c0:	e7f6      	b.n	80004b0 <printf_+0x14>
 80004c2:	192b      	adds	r3, r5, r4
 80004c4:	7858      	ldrb	r0, [r3, #1]
 80004c6:	2869      	cmp	r0, #105	; 0x69
 80004c8:	d016      	beq.n	80004f8 <printf_+0x5c>
 80004ca:	d808      	bhi.n	80004de <printf_+0x42>
 80004cc:	2825      	cmp	r0, #37	; 0x25
 80004ce:	d028      	beq.n	8000522 <printf_+0x86>
 80004d0:	2863      	cmp	r0, #99	; 0x63
 80004d2:	d128      	bne.n	8000526 <printf_+0x8a>
 80004d4:	9b01      	ldr	r3, [sp, #4]
 80004d6:	1d1a      	adds	r2, r3, #4
 80004d8:	9201      	str	r2, [sp, #4]
 80004da:	7818      	ldrb	r0, [r3, #0]
 80004dc:	e021      	b.n	8000522 <printf_+0x86>
 80004de:	2875      	cmp	r0, #117	; 0x75
 80004e0:	d011      	beq.n	8000506 <printf_+0x6a>
 80004e2:	2878      	cmp	r0, #120	; 0x78
 80004e4:	d016      	beq.n	8000514 <printf_+0x78>
 80004e6:	2873      	cmp	r0, #115	; 0x73
 80004e8:	d11d      	bne.n	8000526 <printf_+0x8a>
 80004ea:	9b01      	ldr	r3, [sp, #4]
 80004ec:	1d1a      	adds	r2, r3, #4
 80004ee:	6818      	ldr	r0, [r3, #0]
 80004f0:	9201      	str	r2, [sp, #4]
 80004f2:	f7ff ff69 	bl	80003c8 <puts_>
 80004f6:	e016      	b.n	8000526 <printf_+0x8a>
 80004f8:	9b01      	ldr	r3, [sp, #4]
 80004fa:	1d1a      	adds	r2, r3, #4
 80004fc:	6818      	ldr	r0, [r3, #0]
 80004fe:	9201      	str	r2, [sp, #4]
 8000500:	f7ff ff76 	bl	80003f0 <puti_>
 8000504:	e00f      	b.n	8000526 <printf_+0x8a>
 8000506:	9b01      	ldr	r3, [sp, #4]
 8000508:	1d1a      	adds	r2, r3, #4
 800050a:	6818      	ldr	r0, [r3, #0]
 800050c:	9201      	str	r2, [sp, #4]
 800050e:	f7ff ff94 	bl	800043a <putui_>
 8000512:	e008      	b.n	8000526 <printf_+0x8a>
 8000514:	9b01      	ldr	r3, [sp, #4]
 8000516:	1d1a      	adds	r2, r3, #4
 8000518:	6818      	ldr	r0, [r3, #0]
 800051a:	9201      	str	r2, [sp, #4]
 800051c:	f7ff ffa6 	bl	800046c <putx_>
 8000520:	e001      	b.n	8000526 <printf_+0x8a>
 8000522:	f7ff ff41 	bl	80003a8 <putc_>
 8000526:	3402      	adds	r4, #2
 8000528:	e7c2      	b.n	80004b0 <printf_+0x14>
 800052a:	1c30      	adds	r0, r6, #0
 800052c:	f000 f86f 	bl	800060e <mutex_unlock>
 8000530:	bc73      	pop	{r0, r1, r4, r5, r6}
 8000532:	bc08      	pop	{r3}
 8000534:	b004      	add	sp, #16
 8000536:	4718      	bx	r3
 8000538:	200008f4 	.word	0x200008f4

0800053c <stdio_init>:
 800053c:	b510      	push	{r4, lr}
 800053e:	480f      	ldr	r0, [pc, #60]	; (800057c <stdio_init+0x40>)
 8000540:	f000 f840 	bl	80005c4 <mutex_init>
 8000544:	480e      	ldr	r0, [pc, #56]	; (8000580 <stdio_init+0x44>)
 8000546:	f000 f83d 	bl	80005c4 <mutex_init>
 800054a:	480e      	ldr	r0, [pc, #56]	; (8000584 <stdio_init+0x48>)
 800054c:	f000 f83a 	bl	80005c4 <mutex_init>
 8000550:	480d      	ldr	r0, [pc, #52]	; (8000588 <stdio_init+0x4c>)
 8000552:	f000 f837 	bl	80005c4 <mutex_init>
 8000556:	2408      	movs	r4, #8
 8000558:	2020      	movs	r0, #32
 800055a:	3c01      	subs	r4, #1
 800055c:	f7ff ff24 	bl	80003a8 <putc_>
 8000560:	2c00      	cmp	r4, #0
 8000562:	d1f9      	bne.n	8000558 <stdio_init+0x1c>
 8000564:	2420      	movs	r4, #32
 8000566:	200a      	movs	r0, #10
 8000568:	3c01      	subs	r4, #1
 800056a:	f7ff ff1d 	bl	80003a8 <putc_>
 800056e:	2c00      	cmp	r4, #0
 8000570:	d1f9      	bne.n	8000566 <stdio_init+0x2a>
 8000572:	4806      	ldr	r0, [pc, #24]	; (800058c <stdio_init+0x50>)
 8000574:	f7ff ff92 	bl	800049c <printf_>
 8000578:	bd10      	pop	{r4, pc}
 800057a:	46c0      	nop			; (mov r8, r8)
 800057c:	200008ec 	.word	0x200008ec
 8000580:	200008f0 	.word	0x200008f0
 8000584:	200008f8 	.word	0x200008f8
 8000588:	200008f4 	.word	0x200008f4
 800058c:	0800164b 	.word	0x0800164b

08000590 <messages_init>:
 8000590:	b510      	push	{r4, lr}
 8000592:	2200      	movs	r2, #0
 8000594:	4909      	ldr	r1, [pc, #36]	; (80005bc <messages_init+0x2c>)
 8000596:	0090      	lsls	r0, r2, #2
 8000598:	2300      	movs	r3, #0
 800059a:	3201      	adds	r2, #1
 800059c:	5043      	str	r3, [r0, r1]
 800059e:	2a08      	cmp	r2, #8
 80005a0:	d1f8      	bne.n	8000594 <messages_init+0x4>
 80005a2:	4807      	ldr	r0, [pc, #28]	; (80005c0 <messages_init+0x30>)
 80005a4:	011c      	lsls	r4, r3, #4
 80005a6:	2200      	movs	r2, #0
 80005a8:	1901      	adds	r1, r0, r4
 80005aa:	3301      	adds	r3, #1
 80005ac:	604a      	str	r2, [r1, #4]
 80005ae:	5022      	str	r2, [r4, r0]
 80005b0:	60ca      	str	r2, [r1, #12]
 80005b2:	608a      	str	r2, [r1, #8]
 80005b4:	2b04      	cmp	r3, #4
 80005b6:	d1f4      	bne.n	80005a2 <messages_init+0x12>
 80005b8:	bd10      	pop	{r4, pc}
 80005ba:	46c0      	nop			; (mov r8, r8)
 80005bc:	200008fc 	.word	0x200008fc
 80005c0:	2000091c 	.word	0x2000091c

080005c4 <mutex_init>:
 80005c4:	b510      	push	{r4, lr}
 80005c6:	1c04      	adds	r4, r0, #0
 80005c8:	f7ff fe38 	bl	800023c <sched_off>
 80005cc:	2300      	movs	r3, #0
 80005ce:	6023      	str	r3, [r4, #0]
 80005d0:	f7ff fe36 	bl	8000240 <sched_on>
 80005d4:	bd10      	pop	{r4, pc}

080005d6 <mutex_lock>:
 80005d6:	b513      	push	{r0, r1, r4, lr}
 80005d8:	1c04      	adds	r4, r0, #0
 80005da:	f7ff fe2f 	bl	800023c <sched_off>
 80005de:	6823      	ldr	r3, [r4, #0]
 80005e0:	9301      	str	r3, [sp, #4]
 80005e2:	f7ff fe2d 	bl	8000240 <sched_on>
 80005e6:	9b01      	ldr	r3, [sp, #4]
 80005e8:	2b00      	cmp	r3, #0
 80005ea:	d001      	beq.n	80005f0 <mutex_lock+0x1a>
 80005ec:	f7ff fea0 	bl	8000330 <set_wait_state>
 80005f0:	9b01      	ldr	r3, [sp, #4]
 80005f2:	2b00      	cmp	r3, #0
 80005f4:	d1f1      	bne.n	80005da <mutex_lock+0x4>
 80005f6:	f7ff fe21 	bl	800023c <sched_off>
 80005fa:	6823      	ldr	r3, [r4, #0]
 80005fc:	9301      	str	r3, [sp, #4]
 80005fe:	9b01      	ldr	r3, [sp, #4]
 8000600:	2b00      	cmp	r3, #0
 8000602:	d1ea      	bne.n	80005da <mutex_lock+0x4>
 8000604:	2301      	movs	r3, #1
 8000606:	6023      	str	r3, [r4, #0]
 8000608:	f7ff fe1a 	bl	8000240 <sched_on>
 800060c:	bd13      	pop	{r0, r1, r4, pc}

0800060e <mutex_unlock>:
 800060e:	b508      	push	{r3, lr}
 8000610:	f7ff ffd8 	bl	80005c4 <mutex_init>
 8000614:	f7ff feae 	bl	8000374 <wake_up_threads>
 8000618:	f7ff fe14 	bl	8000244 <yield>
 800061c:	bd08      	pop	{r3, pc}
	...

08000620 <hmc5883_init>:
 8000620:	b510      	push	{r4, lr}
 8000622:	4b16      	ldr	r3, [pc, #88]	; (800067c <hmc5883_init+0x5c>)
 8000624:	2400      	movs	r4, #0
 8000626:	203c      	movs	r0, #60	; 0x3c
 8000628:	1c21      	adds	r1, r4, #0
 800062a:	2218      	movs	r2, #24
 800062c:	801c      	strh	r4, [r3, #0]
 800062e:	805c      	strh	r4, [r3, #2]
 8000630:	809c      	strh	r4, [r3, #4]
 8000632:	f000 f942 	bl	80008ba <i2c_write_reg>
 8000636:	203c      	movs	r0, #60	; 0x3c
 8000638:	2101      	movs	r1, #1
 800063a:	2280      	movs	r2, #128	; 0x80
 800063c:	f000 f93d 	bl	80008ba <i2c_write_reg>
 8000640:	203c      	movs	r0, #60	; 0x3c
 8000642:	2102      	movs	r1, #2
 8000644:	1c22      	adds	r2, r4, #0
 8000646:	f000 f938 	bl	80008ba <i2c_write_reg>
 800064a:	203c      	movs	r0, #60	; 0x3c
 800064c:	210a      	movs	r1, #10
 800064e:	f000 f935 	bl	80008bc <i2c_read_reg>
 8000652:	2301      	movs	r3, #1
 8000654:	2848      	cmp	r0, #72	; 0x48
 8000656:	d10f      	bne.n	8000678 <hmc5883_init+0x58>
 8000658:	203c      	movs	r0, #60	; 0x3c
 800065a:	210b      	movs	r1, #11
 800065c:	f000 f92e 	bl	80008bc <i2c_read_reg>
 8000660:	2302      	movs	r3, #2
 8000662:	2834      	cmp	r0, #52	; 0x34
 8000664:	d108      	bne.n	8000678 <hmc5883_init+0x58>
 8000666:	203c      	movs	r0, #60	; 0x3c
 8000668:	210c      	movs	r1, #12
 800066a:	f000 f927 	bl	80008bc <i2c_read_reg>
 800066e:	2833      	cmp	r0, #51	; 0x33
 8000670:	d001      	beq.n	8000676 <hmc5883_init+0x56>
 8000672:	2303      	movs	r3, #3
 8000674:	e000      	b.n	8000678 <hmc5883_init+0x58>
 8000676:	1c23      	adds	r3, r4, #0
 8000678:	1c18      	adds	r0, r3, #0
 800067a:	bd10      	pop	{r4, pc}
 800067c:	2000095c 	.word	0x2000095c

08000680 <hmc5883_read>:
 8000680:	b538      	push	{r3, r4, r5, lr}
 8000682:	2103      	movs	r1, #3
 8000684:	203c      	movs	r0, #60	; 0x3c
 8000686:	f000 f919 	bl	80008bc <i2c_read_reg>
 800068a:	4c12      	ldr	r4, [pc, #72]	; (80006d4 <hmc5883_read+0x54>)
 800068c:	0205      	lsls	r5, r0, #8
 800068e:	b2ad      	uxth	r5, r5
 8000690:	2104      	movs	r1, #4
 8000692:	203c      	movs	r0, #60	; 0x3c
 8000694:	8025      	strh	r5, [r4, #0]
 8000696:	f000 f911 	bl	80008bc <i2c_read_reg>
 800069a:	2107      	movs	r1, #7
 800069c:	4305      	orrs	r5, r0
 800069e:	203c      	movs	r0, #60	; 0x3c
 80006a0:	8025      	strh	r5, [r4, #0]
 80006a2:	f000 f90b 	bl	80008bc <i2c_read_reg>
 80006a6:	0205      	lsls	r5, r0, #8
 80006a8:	b2ad      	uxth	r5, r5
 80006aa:	2108      	movs	r1, #8
 80006ac:	203c      	movs	r0, #60	; 0x3c
 80006ae:	8065      	strh	r5, [r4, #2]
 80006b0:	f000 f904 	bl	80008bc <i2c_read_reg>
 80006b4:	2105      	movs	r1, #5
 80006b6:	4305      	orrs	r5, r0
 80006b8:	203c      	movs	r0, #60	; 0x3c
 80006ba:	8065      	strh	r5, [r4, #2]
 80006bc:	f000 f8fe 	bl	80008bc <i2c_read_reg>
 80006c0:	0205      	lsls	r5, r0, #8
 80006c2:	b2ad      	uxth	r5, r5
 80006c4:	2106      	movs	r1, #6
 80006c6:	203c      	movs	r0, #60	; 0x3c
 80006c8:	80a5      	strh	r5, [r4, #4]
 80006ca:	f000 f8f7 	bl	80008bc <i2c_read_reg>
 80006ce:	4305      	orrs	r5, r0
 80006d0:	80a5      	strh	r5, [r4, #4]
 80006d2:	bd38      	pop	{r3, r4, r5, pc}
 80006d4:	2000095c 	.word	0x2000095c

080006d8 <main_thread>:
 80006d8:	b510      	push	{r4, lr}
 80006da:	480c      	ldr	r0, [pc, #48]	; (800070c <main_thread+0x34>)
 80006dc:	f7ff fede 	bl	800049c <printf_>
 80006e0:	f7ff ff9e 	bl	8000620 <hmc5883_init>
 80006e4:	1c04      	adds	r4, r0, #0
 80006e6:	2008      	movs	r0, #8
 80006e8:	f000 fa4e 	bl	8000b88 <led_on>
 80006ec:	f7ff ffc8 	bl	8000680 <hmc5883_read>
 80006f0:	4b07      	ldr	r3, [pc, #28]	; (8000710 <main_thread+0x38>)
 80006f2:	4808      	ldr	r0, [pc, #32]	; (8000714 <main_thread+0x3c>)
 80006f4:	2104      	movs	r1, #4
 80006f6:	5e5a      	ldrsh	r2, [r3, r1]
 80006f8:	1c21      	adds	r1, r4, #0
 80006fa:	f7ff fecf 	bl	800049c <printf_>
 80006fe:	2008      	movs	r0, #8
 8000700:	f000 fa48 	bl	8000b94 <led_off>
 8000704:	2064      	movs	r0, #100	; 0x64
 8000706:	f000 fa13 	bl	8000b30 <timer_delay_ms>
 800070a:	e7ec      	b.n	80006e6 <main_thread+0xe>
 800070c:	0800165c 	.word	0x0800165c
 8000710:	2000095c 	.word	0x2000095c
 8000714:	08001697 	.word	0x08001697

08000718 <uart_write>:
 8000718:	4b03      	ldr	r3, [pc, #12]	; (8000728 <uart_write+0x10>)
 800071a:	6298      	str	r0, [r3, #40]	; 0x28
 800071c:	69da      	ldr	r2, [r3, #28]
 800071e:	0651      	lsls	r1, r2, #25
 8000720:	d401      	bmi.n	8000726 <uart_write+0xe>
 8000722:	46c0      	nop			; (mov r8, r8)
 8000724:	e7fa      	b.n	800071c <uart_write+0x4>
 8000726:	4770      	bx	lr
 8000728:	40004400 	.word	0x40004400

0800072c <uart_init>:
 800072c:	4b11      	ldr	r3, [pc, #68]	; (8000774 <uart_init+0x48>)
 800072e:	2101      	movs	r1, #1
 8000730:	6ada      	ldr	r2, [r3, #44]	; 0x2c
 8000732:	430a      	orrs	r2, r1
 8000734:	62da      	str	r2, [r3, #44]	; 0x2c
 8000736:	22a0      	movs	r2, #160	; 0xa0
 8000738:	05d2      	lsls	r2, r2, #23
 800073a:	6810      	ldr	r0, [r2, #0]
 800073c:	490e      	ldr	r1, [pc, #56]	; (8000778 <uart_init+0x4c>)
 800073e:	4001      	ands	r1, r0
 8000740:	480e      	ldr	r0, [pc, #56]	; (800077c <uart_init+0x50>)
 8000742:	4301      	orrs	r1, r0
 8000744:	6011      	str	r1, [r2, #0]
 8000746:	6a50      	ldr	r0, [r2, #36]	; 0x24
 8000748:	490d      	ldr	r1, [pc, #52]	; (8000780 <uart_init+0x54>)
 800074a:	4001      	ands	r1, r0
 800074c:	2088      	movs	r0, #136	; 0x88
 800074e:	00c0      	lsls	r0, r0, #3
 8000750:	4301      	orrs	r1, r0
 8000752:	6251      	str	r1, [r2, #36]	; 0x24
 8000754:	6b99      	ldr	r1, [r3, #56]	; 0x38
 8000756:	2280      	movs	r2, #128	; 0x80
 8000758:	0292      	lsls	r2, r2, #10
 800075a:	430a      	orrs	r2, r1
 800075c:	639a      	str	r2, [r3, #56]	; 0x38
 800075e:	4b09      	ldr	r3, [pc, #36]	; (8000784 <uart_init+0x58>)
 8000760:	2268      	movs	r2, #104	; 0x68
 8000762:	60da      	str	r2, [r3, #12]
 8000764:	220d      	movs	r2, #13
 8000766:	601a      	str	r2, [r3, #0]
 8000768:	6a1a      	ldr	r2, [r3, #32]
 800076a:	2140      	movs	r1, #64	; 0x40
 800076c:	430a      	orrs	r2, r1
 800076e:	621a      	str	r2, [r3, #32]
 8000770:	4770      	bx	lr
 8000772:	46c0      	nop			; (mov r8, r8)
 8000774:	40021000 	.word	0x40021000
 8000778:	ffcfffcf 	.word	0xffcfffcf
 800077c:	00200020 	.word	0x00200020
 8000780:	fffff00f 	.word	0xfffff00f
 8000784:	40004400 	.word	0x40004400

08000788 <SystemClock_Config_MSI>:
 8000788:	4b11      	ldr	r3, [pc, #68]	; (80007d0 <SystemClock_Config_MSI+0x48>)
 800078a:	4a12      	ldr	r2, [pc, #72]	; (80007d4 <SystemClock_Config_MSI+0x4c>)
 800078c:	6859      	ldr	r1, [r3, #4]
 800078e:	b510      	push	{r4, lr}
 8000790:	400a      	ands	r2, r1
 8000792:	2180      	movs	r1, #128	; 0x80
 8000794:	0209      	lsls	r1, r1, #8
 8000796:	430a      	orrs	r2, r1
 8000798:	605a      	str	r2, [r3, #4]
 800079a:	2200      	movs	r2, #0
 800079c:	60da      	str	r2, [r3, #12]
 800079e:	4a0e      	ldr	r2, [pc, #56]	; (80007d8 <SystemClock_Config_MSI+0x50>)
 80007a0:	2101      	movs	r1, #1
 80007a2:	6810      	ldr	r0, [r2, #0]
 80007a4:	1c04      	adds	r4, r0, #0
 80007a6:	438c      	bics	r4, r1
 80007a8:	6014      	str	r4, [r2, #0]
 80007aa:	2403      	movs	r4, #3
 80007ac:	43a0      	bics	r0, r4
 80007ae:	6010      	str	r0, [r2, #0]
 80007b0:	6010      	str	r0, [r2, #0]
 80007b2:	681a      	ldr	r2, [r3, #0]
 80007b4:	400a      	ands	r2, r1
 80007b6:	601a      	str	r2, [r3, #0]
 80007b8:	4b08      	ldr	r3, [pc, #32]	; (80007dc <SystemClock_Config_MSI+0x54>)
 80007ba:	681a      	ldr	r2, [r3, #0]
 80007bc:	4311      	orrs	r1, r2
 80007be:	6019      	str	r1, [r3, #0]
 80007c0:	4b07      	ldr	r3, [pc, #28]	; (80007e0 <SystemClock_Config_MSI+0x58>)
 80007c2:	3b01      	subs	r3, #1
 80007c4:	2b00      	cmp	r3, #0
 80007c6:	d001      	beq.n	80007cc <SystemClock_Config_MSI+0x44>
 80007c8:	46c0      	nop			; (mov r8, r8)
 80007ca:	e7fa      	b.n	80007c2 <SystemClock_Config_MSI+0x3a>
 80007cc:	bd10      	pop	{r4, pc}
 80007ce:	46c0      	nop			; (mov r8, r8)
 80007d0:	40021000 	.word	0x40021000
 80007d4:	ffff1fff 	.word	0xffff1fff
 80007d8:	40022000 	.word	0x40022000
 80007dc:	40007000 	.word	0x40007000
 80007e0:	00001389 	.word	0x00001389

080007e4 <SystemClock_Config>:
 80007e4:	b500      	push	{lr}
 80007e6:	b093      	sub	sp, #76	; 0x4c
 80007e8:	2100      	movs	r1, #0
 80007ea:	2214      	movs	r2, #20
 80007ec:	4668      	mov	r0, sp
 80007ee:	f000 feab 	bl	8001548 <memset>
 80007f2:	2100      	movs	r1, #0
 80007f4:	2234      	movs	r2, #52	; 0x34
 80007f6:	a805      	add	r0, sp, #20
 80007f8:	f000 fea6 	bl	8001548 <memset>
 80007fc:	2310      	movs	r3, #16
 80007fe:	9305      	str	r3, [sp, #20]
 8000800:	2301      	movs	r3, #1
 8000802:	930b      	str	r3, [sp, #44]	; 0x2c
 8000804:	23a0      	movs	r3, #160	; 0xa0
 8000806:	021b      	lsls	r3, r3, #8
 8000808:	a805      	add	r0, sp, #20
 800080a:	930d      	str	r3, [sp, #52]	; 0x34
 800080c:	f000 f9e0 	bl	8000bd0 <HAL_RCC_OscConfig>
 8000810:	1e01      	subs	r1, r0, #0
 8000812:	d000      	beq.n	8000816 <SystemClock_Config+0x32>
 8000814:	e7fe      	b.n	8000814 <SystemClock_Config+0x30>
 8000816:	230f      	movs	r3, #15
 8000818:	9001      	str	r0, [sp, #4]
 800081a:	9002      	str	r0, [sp, #8]
 800081c:	9003      	str	r0, [sp, #12]
 800081e:	9004      	str	r0, [sp, #16]
 8000820:	4668      	mov	r0, sp
 8000822:	9300      	str	r3, [sp, #0]
 8000824:	f000 fbda 	bl	8000fdc <HAL_RCC_ClockConfig>
 8000828:	2800      	cmp	r0, #0
 800082a:	d000      	beq.n	800082e <SystemClock_Config+0x4a>
 800082c:	e7fe      	b.n	800082c <SystemClock_Config+0x48>
 800082e:	4b09      	ldr	r3, [pc, #36]	; (8000854 <SystemClock_Config+0x70>)
 8000830:	2280      	movs	r2, #128	; 0x80
 8000832:	6b99      	ldr	r1, [r3, #56]	; 0x38
 8000834:	0552      	lsls	r2, r2, #21
 8000836:	430a      	orrs	r2, r1
 8000838:	639a      	str	r2, [r3, #56]	; 0x38
 800083a:	4a07      	ldr	r2, [pc, #28]	; (8000858 <SystemClock_Config+0x74>)
 800083c:	21c0      	movs	r1, #192	; 0xc0
 800083e:	6810      	ldr	r0, [r2, #0]
 8000840:	0149      	lsls	r1, r1, #5
 8000842:	4301      	orrs	r1, r0
 8000844:	6011      	str	r1, [r2, #0]
 8000846:	6b99      	ldr	r1, [r3, #56]	; 0x38
 8000848:	4a04      	ldr	r2, [pc, #16]	; (800085c <SystemClock_Config+0x78>)
 800084a:	400a      	ands	r2, r1
 800084c:	639a      	str	r2, [r3, #56]	; 0x38
 800084e:	b013      	add	sp, #76	; 0x4c
 8000850:	bd00      	pop	{pc}
 8000852:	46c0      	nop			; (mov r8, r8)
 8000854:	40021000 	.word	0x40021000
 8000858:	40007000 	.word	0x40007000
 800085c:	efffffff 	.word	0xefffffff

08000860 <lib_low_level_init>:
 8000860:	b508      	push	{r3, lr}
 8000862:	f000 f85b 	bl	800091c <SystemInit>
 8000866:	f7ff ff8f 	bl	8000788 <SystemClock_Config_MSI>
 800086a:	f7ff ffbb 	bl	80007e4 <SystemClock_Config>
 800086e:	f000 f971 	bl	8000b54 <gpio_init>
 8000872:	f7ff ff5b 	bl	800072c <uart_init>
 8000876:	f000 f8a5 	bl	80009c4 <timer_init>
 800087a:	f000 f81d 	bl	80008b8 <i2c_0_init>
 800087e:	f000 f84b 	bl	8000918 <adc_init>
 8000882:	2008      	movs	r0, #8
 8000884:	f000 f986 	bl	8000b94 <led_off>
 8000888:	4b09      	ldr	r3, [pc, #36]	; (80008b0 <lib_low_level_init+0x50>)
 800088a:	3b01      	subs	r3, #1
 800088c:	2b00      	cmp	r3, #0
 800088e:	d001      	beq.n	8000894 <lib_low_level_init+0x34>
 8000890:	46c0      	nop			; (mov r8, r8)
 8000892:	e7fa      	b.n	800088a <lib_low_level_init+0x2a>
 8000894:	2008      	movs	r0, #8
 8000896:	f000 f977 	bl	8000b88 <led_on>
 800089a:	4b06      	ldr	r3, [pc, #24]	; (80008b4 <lib_low_level_init+0x54>)
 800089c:	3b01      	subs	r3, #1
 800089e:	2b00      	cmp	r3, #0
 80008a0:	d001      	beq.n	80008a6 <lib_low_level_init+0x46>
 80008a2:	46c0      	nop			; (mov r8, r8)
 80008a4:	e7fa      	b.n	800089c <lib_low_level_init+0x3c>
 80008a6:	2041      	movs	r0, #65	; 0x41
 80008a8:	f7ff fd7e 	bl	80003a8 <putc_>
 80008ac:	e7e9      	b.n	8000882 <lib_low_level_init+0x22>
 80008ae:	46c0      	nop			; (mov r8, r8)
 80008b0:	000186a1 	.word	0x000186a1
 80008b4:	00002711 	.word	0x00002711

080008b8 <i2c_0_init>:
 80008b8:	4770      	bx	lr

080008ba <i2c_write_reg>:
 80008ba:	4770      	bx	lr

080008bc <i2c_read_reg>:
 80008bc:	20ff      	movs	r0, #255	; 0xff
 80008be:	4770      	bx	lr

080008c0 <Default_Handler>:
 80008c0:	46c0      	nop			; (mov r8, r8)
 80008c2:	e7fd      	b.n	80008c0 <Default_Handler>

080008c4 <HardFault_Handler>:
 80008c4:	2008      	movs	r0, #8
 80008c6:	f000 f95f 	bl	8000b88 <led_on>
 80008ca:	4b07      	ldr	r3, [pc, #28]	; (80008e8 <HardFault_Handler+0x24>)
 80008cc:	3b01      	subs	r3, #1
 80008ce:	2b00      	cmp	r3, #0
 80008d0:	d001      	beq.n	80008d6 <HardFault_Handler+0x12>
 80008d2:	46c0      	nop			; (mov r8, r8)
 80008d4:	e7fa      	b.n	80008cc <HardFault_Handler+0x8>
 80008d6:	2008      	movs	r0, #8
 80008d8:	f000 f95c 	bl	8000b94 <led_off>
 80008dc:	4b02      	ldr	r3, [pc, #8]	; (80008e8 <HardFault_Handler+0x24>)
 80008de:	3b01      	subs	r3, #1
 80008e0:	2b00      	cmp	r3, #0
 80008e2:	d0ef      	beq.n	80008c4 <HardFault_Handler>
 80008e4:	46c0      	nop			; (mov r8, r8)
 80008e6:	e7fa      	b.n	80008de <HardFault_Handler+0x1a>
 80008e8:	00989681 	.word	0x00989681

080008ec <_reset_init>:
 80008ec:	4a07      	ldr	r2, [pc, #28]	; (800090c <_reset_init+0x20>)
 80008ee:	4908      	ldr	r1, [pc, #32]	; (8000910 <_reset_init+0x24>)
 80008f0:	2300      	movs	r3, #0
 80008f2:	1a89      	subs	r1, r1, r2
 80008f4:	1089      	asrs	r1, r1, #2
 80008f6:	1c10      	adds	r0, r2, #0
 80008f8:	428b      	cmp	r3, r1
 80008fa:	d005      	beq.n	8000908 <_reset_init+0x1c>
 80008fc:	4c05      	ldr	r4, [pc, #20]	; (8000914 <_reset_init+0x28>)
 80008fe:	009a      	lsls	r2, r3, #2
 8000900:	58a4      	ldr	r4, [r4, r2]
 8000902:	3301      	adds	r3, #1
 8000904:	5084      	str	r4, [r0, r2]
 8000906:	e7f7      	b.n	80008f8 <_reset_init+0xc>
 8000908:	f7ff fc0e 	bl	8000128 <main>
 800090c:	20000000 	.word	0x20000000
 8000910:	20000004 	.word	0x20000004
 8000914:	080016c0 	.word	0x080016c0

08000918 <adc_init>:
 8000918:	4770      	bx	lr
	...

0800091c <SystemInit>:
 800091c:	4b10      	ldr	r3, [pc, #64]	; (8000960 <SystemInit+0x44>)
 800091e:	2280      	movs	r2, #128	; 0x80
 8000920:	6819      	ldr	r1, [r3, #0]
 8000922:	0052      	lsls	r2, r2, #1
 8000924:	430a      	orrs	r2, r1
 8000926:	601a      	str	r2, [r3, #0]
 8000928:	68d9      	ldr	r1, [r3, #12]
 800092a:	4a0e      	ldr	r2, [pc, #56]	; (8000964 <SystemInit+0x48>)
 800092c:	400a      	ands	r2, r1
 800092e:	60da      	str	r2, [r3, #12]
 8000930:	6819      	ldr	r1, [r3, #0]
 8000932:	4a0d      	ldr	r2, [pc, #52]	; (8000968 <SystemInit+0x4c>)
 8000934:	400a      	ands	r2, r1
 8000936:	601a      	str	r2, [r3, #0]
 8000938:	689a      	ldr	r2, [r3, #8]
 800093a:	2101      	movs	r1, #1
 800093c:	438a      	bics	r2, r1
 800093e:	609a      	str	r2, [r3, #8]
 8000940:	6819      	ldr	r1, [r3, #0]
 8000942:	4a0a      	ldr	r2, [pc, #40]	; (800096c <SystemInit+0x50>)
 8000944:	400a      	ands	r2, r1
 8000946:	601a      	str	r2, [r3, #0]
 8000948:	68d9      	ldr	r1, [r3, #12]
 800094a:	4a09      	ldr	r2, [pc, #36]	; (8000970 <SystemInit+0x54>)
 800094c:	400a      	ands	r2, r1
 800094e:	60da      	str	r2, [r3, #12]
 8000950:	2200      	movs	r2, #0
 8000952:	611a      	str	r2, [r3, #16]
 8000954:	4b07      	ldr	r3, [pc, #28]	; (8000974 <SystemInit+0x58>)
 8000956:	2280      	movs	r2, #128	; 0x80
 8000958:	0512      	lsls	r2, r2, #20
 800095a:	609a      	str	r2, [r3, #8]
 800095c:	4770      	bx	lr
 800095e:	46c0      	nop			; (mov r8, r8)
 8000960:	40021000 	.word	0x40021000
 8000964:	88ff400c 	.word	0x88ff400c
 8000968:	fef6fff6 	.word	0xfef6fff6
 800096c:	fffbffff 	.word	0xfffbffff
 8000970:	ff02ffff 	.word	0xff02ffff
 8000974:	e000ed00 	.word	0xe000ed00

08000978 <__get_MSP>:
 8000978:	f3ef 8008 	mrs	r0, MSP
 800097c:	1c00      	adds	r0, r0, #0
 800097e:	4770      	bx	lr

08000980 <sys_tick_init>:
 8000980:	4b03      	ldr	r3, [pc, #12]	; (8000990 <sys_tick_init+0x10>)
 8000982:	4a04      	ldr	r2, [pc, #16]	; (8000994 <sys_tick_init+0x14>)
 8000984:	605a      	str	r2, [r3, #4]
 8000986:	2200      	movs	r2, #0
 8000988:	609a      	str	r2, [r3, #8]
 800098a:	2203      	movs	r2, #3
 800098c:	601a      	str	r2, [r3, #0]
 800098e:	4770      	bx	lr
 8000990:	e000e010 	.word	0xe000e010
 8000994:	00001388 	.word	0x00001388

08000998 <sleep>:
 8000998:	4b08      	ldr	r3, [pc, #32]	; (80009bc <sleep+0x24>)
 800099a:	2104      	movs	r1, #4
 800099c:	691a      	ldr	r2, [r3, #16]
 800099e:	430a      	orrs	r2, r1
 80009a0:	611a      	str	r2, [r3, #16]
 80009a2:	4b07      	ldr	r3, [pc, #28]	; (80009c0 <sleep+0x28>)
 80009a4:	2203      	movs	r2, #3
 80009a6:	6819      	ldr	r1, [r3, #0]
 80009a8:	4391      	bics	r1, r2
 80009aa:	2201      	movs	r2, #1
 80009ac:	4311      	orrs	r1, r2
 80009ae:	6019      	str	r1, [r3, #0]
 80009b0:	6859      	ldr	r1, [r3, #4]
 80009b2:	4391      	bics	r1, r2
 80009b4:	6059      	str	r1, [r3, #4]
 80009b6:	bf30      	wfi
 80009b8:	4770      	bx	lr
 80009ba:	46c0      	nop			; (mov r8, r8)
 80009bc:	e000ed00 	.word	0xe000ed00
 80009c0:	40007000 	.word	0x40007000

080009c4 <timer_init>:
 80009c4:	b510      	push	{r4, lr}
 80009c6:	2300      	movs	r3, #0
 80009c8:	482b      	ldr	r0, [pc, #172]	; (8000a78 <timer_init+0xb4>)
 80009ca:	2180      	movs	r1, #128	; 0x80
 80009cc:	005a      	lsls	r2, r3, #1
 80009ce:	00c9      	lsls	r1, r1, #3
 80009d0:	5211      	strh	r1, [r2, r0]
 80009d2:	482a      	ldr	r0, [pc, #168]	; (8000a7c <timer_init+0xb8>)
 80009d4:	3301      	adds	r3, #1
 80009d6:	5211      	strh	r1, [r2, r0]
 80009d8:	4829      	ldr	r0, [pc, #164]	; (8000a80 <timer_init+0xbc>)
 80009da:	2100      	movs	r1, #0
 80009dc:	5211      	strh	r1, [r2, r0]
 80009de:	2b04      	cmp	r3, #4
 80009e0:	d1f2      	bne.n	80009c8 <timer_init+0x4>
 80009e2:	4b28      	ldr	r3, [pc, #160]	; (8000a84 <timer_init+0xc0>)
 80009e4:	6019      	str	r1, [r3, #0]
 80009e6:	4b28      	ldr	r3, [pc, #160]	; (8000a88 <timer_init+0xc4>)
 80009e8:	2101      	movs	r1, #1
 80009ea:	6d1a      	ldr	r2, [r3, #80]	; 0x50
 80009ec:	430a      	orrs	r2, r1
 80009ee:	651a      	str	r2, [r3, #80]	; 0x50
 80009f0:	1c19      	adds	r1, r3, #0
 80009f2:	6d0a      	ldr	r2, [r1, #80]	; 0x50
 80009f4:	4b24      	ldr	r3, [pc, #144]	; (8000a88 <timer_init+0xc4>)
 80009f6:	0790      	lsls	r0, r2, #30
 80009f8:	d5fb      	bpl.n	80009f2 <timer_init+0x2e>
 80009fa:	6b99      	ldr	r1, [r3, #56]	; 0x38
 80009fc:	2280      	movs	r2, #128	; 0x80
 80009fe:	0552      	lsls	r2, r2, #21
 8000a00:	430a      	orrs	r2, r1
 8000a02:	639a      	str	r2, [r3, #56]	; 0x38
 8000a04:	4a21      	ldr	r2, [pc, #132]	; (8000a8c <timer_init+0xc8>)
 8000a06:	2180      	movs	r1, #128	; 0x80
 8000a08:	6810      	ldr	r0, [r2, #0]
 8000a0a:	0049      	lsls	r1, r1, #1
 8000a0c:	4301      	orrs	r1, r0
 8000a0e:	6011      	str	r1, [r2, #0]
 8000a10:	6d19      	ldr	r1, [r3, #80]	; 0x50
 8000a12:	4a1f      	ldr	r2, [pc, #124]	; (8000a90 <timer_init+0xcc>)
 8000a14:	400a      	ands	r2, r1
 8000a16:	21c0      	movs	r1, #192	; 0xc0
 8000a18:	02c9      	lsls	r1, r1, #11
 8000a1a:	430a      	orrs	r2, r1
 8000a1c:	651a      	str	r2, [r3, #80]	; 0x50
 8000a1e:	6b99      	ldr	r1, [r3, #56]	; 0x38
 8000a20:	4a1c      	ldr	r2, [pc, #112]	; (8000a94 <timer_init+0xd0>)
 8000a22:	400a      	ands	r2, r1
 8000a24:	639a      	str	r2, [r3, #56]	; 0x38
 8000a26:	4b1c      	ldr	r3, [pc, #112]	; (8000a98 <timer_init+0xd4>)
 8000a28:	22ca      	movs	r2, #202	; 0xca
 8000a2a:	625a      	str	r2, [r3, #36]	; 0x24
 8000a2c:	2253      	movs	r2, #83	; 0x53
 8000a2e:	625a      	str	r2, [r3, #36]	; 0x24
 8000a30:	6899      	ldr	r1, [r3, #8]
 8000a32:	4a1a      	ldr	r2, [pc, #104]	; (8000a9c <timer_init+0xd8>)
 8000a34:	400a      	ands	r2, r1
 8000a36:	609a      	str	r2, [r3, #8]
 8000a38:	68d8      	ldr	r0, [r3, #12]
 8000a3a:	2104      	movs	r1, #4
 8000a3c:	4a16      	ldr	r2, [pc, #88]	; (8000a98 <timer_init+0xd4>)
 8000a3e:	4208      	tst	r0, r1
 8000a40:	d0fa      	beq.n	8000a38 <timer_init+0x74>
 8000a42:	2319      	movs	r3, #25
 8000a44:	6153      	str	r3, [r2, #20]
 8000a46:	2388      	movs	r3, #136	; 0x88
 8000a48:	01db      	lsls	r3, r3, #7
 8000a4a:	6093      	str	r3, [r2, #8]
 8000a4c:	23fe      	movs	r3, #254	; 0xfe
 8000a4e:	6253      	str	r3, [r2, #36]	; 0x24
 8000a50:	2364      	movs	r3, #100	; 0x64
 8000a52:	6253      	str	r3, [r2, #36]	; 0x24
 8000a54:	4b12      	ldr	r3, [pc, #72]	; (8000aa0 <timer_init+0xdc>)
 8000a56:	2280      	movs	r2, #128	; 0x80
 8000a58:	6818      	ldr	r0, [r3, #0]
 8000a5a:	0352      	lsls	r2, r2, #13
 8000a5c:	4310      	orrs	r0, r2
 8000a5e:	6018      	str	r0, [r3, #0]
 8000a60:	6898      	ldr	r0, [r3, #8]
 8000a62:	4302      	orrs	r2, r0
 8000a64:	609a      	str	r2, [r3, #8]
 8000a66:	4b0f      	ldr	r3, [pc, #60]	; (8000aa4 <timer_init+0xe0>)
 8000a68:	22c0      	movs	r2, #192	; 0xc0
 8000a6a:	0092      	lsls	r2, r2, #2
 8000a6c:	589c      	ldr	r4, [r3, r2]
 8000a6e:	480e      	ldr	r0, [pc, #56]	; (8000aa8 <timer_init+0xe4>)
 8000a70:	4020      	ands	r0, r4
 8000a72:	5098      	str	r0, [r3, r2]
 8000a74:	6019      	str	r1, [r3, #0]
 8000a76:	bd10      	pop	{r4, pc}
 8000a78:	20000978 	.word	0x20000978
 8000a7c:	2000096c 	.word	0x2000096c
 8000a80:	20000964 	.word	0x20000964
 8000a84:	20000974 	.word	0x20000974
 8000a88:	40021000 	.word	0x40021000
 8000a8c:	40007000 	.word	0x40007000
 8000a90:	fff8ffff 	.word	0xfff8ffff
 8000a94:	efffffff 	.word	0xefffffff
 8000a98:	40002800 	.word	0x40002800
 8000a9c:	fffffbff 	.word	0xfffffbff
 8000aa0:	40010400 	.word	0x40010400
 8000aa4:	e000e100 	.word	0xe000e100
 8000aa8:	ff00ffff 	.word	0xff00ffff

08000aac <RTC_IRQHandler>:
 8000aac:	b508      	push	{r3, lr}
 8000aae:	2008      	movs	r0, #8
 8000ab0:	f000 f86a 	bl	8000b88 <led_on>
 8000ab4:	2200      	movs	r2, #0
 8000ab6:	4911      	ldr	r1, [pc, #68]	; (8000afc <RTC_IRQHandler+0x50>)
 8000ab8:	0053      	lsls	r3, r2, #1
 8000aba:	5a58      	ldrh	r0, [r3, r1]
 8000abc:	2800      	cmp	r0, #0
 8000abe:	d003      	beq.n	8000ac8 <RTC_IRQHandler+0x1c>
 8000ac0:	5a58      	ldrh	r0, [r3, r1]
 8000ac2:	3801      	subs	r0, #1
 8000ac4:	b280      	uxth	r0, r0
 8000ac6:	e005      	b.n	8000ad4 <RTC_IRQHandler+0x28>
 8000ac8:	480d      	ldr	r0, [pc, #52]	; (8000b00 <RTC_IRQHandler+0x54>)
 8000aca:	5a18      	ldrh	r0, [r3, r0]
 8000acc:	b280      	uxth	r0, r0
 8000ace:	5258      	strh	r0, [r3, r1]
 8000ad0:	490c      	ldr	r1, [pc, #48]	; (8000b04 <RTC_IRQHandler+0x58>)
 8000ad2:	2001      	movs	r0, #1
 8000ad4:	3201      	adds	r2, #1
 8000ad6:	5258      	strh	r0, [r3, r1]
 8000ad8:	2a04      	cmp	r2, #4
 8000ada:	d1ec      	bne.n	8000ab6 <RTC_IRQHandler+0xa>
 8000adc:	4b0a      	ldr	r3, [pc, #40]	; (8000b08 <RTC_IRQHandler+0x5c>)
 8000ade:	681a      	ldr	r2, [r3, #0]
 8000ae0:	320a      	adds	r2, #10
 8000ae2:	601a      	str	r2, [r3, #0]
 8000ae4:	4b09      	ldr	r3, [pc, #36]	; (8000b0c <RTC_IRQHandler+0x60>)
 8000ae6:	4a0a      	ldr	r2, [pc, #40]	; (8000b10 <RTC_IRQHandler+0x64>)
 8000ae8:	68d9      	ldr	r1, [r3, #12]
 8000aea:	400a      	ands	r2, r1
 8000aec:	60da      	str	r2, [r3, #12]
 8000aee:	4b09      	ldr	r3, [pc, #36]	; (8000b14 <RTC_IRQHandler+0x68>)
 8000af0:	2280      	movs	r2, #128	; 0x80
 8000af2:	6959      	ldr	r1, [r3, #20]
 8000af4:	0352      	lsls	r2, r2, #13
 8000af6:	430a      	orrs	r2, r1
 8000af8:	615a      	str	r2, [r3, #20]
 8000afa:	bd08      	pop	{r3, pc}
 8000afc:	20000978 	.word	0x20000978
 8000b00:	2000096c 	.word	0x2000096c
 8000b04:	20000964 	.word	0x20000964
 8000b08:	20000974 	.word	0x20000974
 8000b0c:	40002800 	.word	0x40002800
 8000b10:	fffffbff 	.word	0xfffffbff
 8000b14:	40010400 	.word	0x40010400

08000b18 <timer_get_time>:
 8000b18:	b082      	sub	sp, #8
 8000b1a:	b672      	cpsid	i
 8000b1c:	4b03      	ldr	r3, [pc, #12]	; (8000b2c <timer_get_time+0x14>)
 8000b1e:	681b      	ldr	r3, [r3, #0]
 8000b20:	9301      	str	r3, [sp, #4]
 8000b22:	b662      	cpsie	i
 8000b24:	9801      	ldr	r0, [sp, #4]
 8000b26:	b002      	add	sp, #8
 8000b28:	4770      	bx	lr
 8000b2a:	46c0      	nop			; (mov r8, r8)
 8000b2c:	20000974 	.word	0x20000974

08000b30 <timer_delay_ms>:
 8000b30:	b513      	push	{r0, r1, r4, lr}
 8000b32:	1c04      	adds	r4, r0, #0
 8000b34:	f7ff fff0 	bl	8000b18 <timer_get_time>
 8000b38:	1904      	adds	r4, r0, r4
 8000b3a:	9401      	str	r4, [sp, #4]
 8000b3c:	9c01      	ldr	r4, [sp, #4]
 8000b3e:	f7ff ffeb 	bl	8000b18 <timer_get_time>
 8000b42:	4284      	cmp	r4, r0
 8000b44:	d904      	bls.n	8000b50 <timer_delay_ms+0x20>
 8000b46:	f7ff fb7d 	bl	8000244 <yield>
 8000b4a:	f7ff ff25 	bl	8000998 <sleep>
 8000b4e:	e7f5      	b.n	8000b3c <timer_delay_ms+0xc>
 8000b50:	bd13      	pop	{r0, r1, r4, pc}
	...

08000b54 <gpio_init>:
 8000b54:	b530      	push	{r4, r5, lr}
 8000b56:	4a0a      	ldr	r2, [pc, #40]	; (8000b80 <gpio_init+0x2c>)
 8000b58:	2303      	movs	r3, #3
 8000b5a:	6ad1      	ldr	r1, [r2, #44]	; 0x2c
 8000b5c:	4c09      	ldr	r4, [pc, #36]	; (8000b84 <gpio_init+0x30>)
 8000b5e:	b087      	sub	sp, #28
 8000b60:	4319      	orrs	r1, r3
 8000b62:	62d1      	str	r1, [r2, #44]	; 0x2c
 8000b64:	2508      	movs	r5, #8
 8000b66:	2201      	movs	r2, #1
 8000b68:	1c20      	adds	r0, r4, #0
 8000b6a:	a901      	add	r1, sp, #4
 8000b6c:	9202      	str	r2, [sp, #8]
 8000b6e:	9203      	str	r2, [sp, #12]
 8000b70:	9304      	str	r3, [sp, #16]
 8000b72:	9501      	str	r5, [sp, #4]
 8000b74:	f000 fb32 	bl	80011dc <HAL_GPIO_Init>
 8000b78:	62a5      	str	r5, [r4, #40]	; 0x28
 8000b7a:	b007      	add	sp, #28
 8000b7c:	bd30      	pop	{r4, r5, pc}
 8000b7e:	46c0      	nop			; (mov r8, r8)
 8000b80:	40021000 	.word	0x40021000
 8000b84:	50000400 	.word	0x50000400

08000b88 <led_on>:
 8000b88:	4b01      	ldr	r3, [pc, #4]	; (8000b90 <led_on+0x8>)
 8000b8a:	6198      	str	r0, [r3, #24]
 8000b8c:	4770      	bx	lr
 8000b8e:	46c0      	nop			; (mov r8, r8)
 8000b90:	50000400 	.word	0x50000400

08000b94 <led_off>:
 8000b94:	4b01      	ldr	r3, [pc, #4]	; (8000b9c <led_off+0x8>)
 8000b96:	6298      	str	r0, [r3, #40]	; 0x28
 8000b98:	4770      	bx	lr
 8000b9a:	46c0      	nop			; (mov r8, r8)
 8000b9c:	50000400 	.word	0x50000400

08000ba0 <HAL_InitTick>:
 8000ba0:	b510      	push	{r4, lr}
 8000ba2:	1c04      	adds	r4, r0, #0
 8000ba4:	f000 fb06 	bl	80011b4 <HAL_RCC_GetHCLKFreq>
 8000ba8:	21fa      	movs	r1, #250	; 0xfa
 8000baa:	0089      	lsls	r1, r1, #2
 8000bac:	f000 fc1c 	bl	80013e8 <__aeabi_uidiv>
 8000bb0:	f000 fbf6 	bl	80013a0 <HAL_SYSTICK_Config>
 8000bb4:	2001      	movs	r0, #1
 8000bb6:	4240      	negs	r0, r0
 8000bb8:	1c21      	adds	r1, r4, #0
 8000bba:	2200      	movs	r2, #0
 8000bbc:	f000 fbbe 	bl	800133c <HAL_NVIC_SetPriority>
 8000bc0:	2000      	movs	r0, #0
 8000bc2:	bd10      	pop	{r4, pc}

08000bc4 <HAL_GetTick>:
 8000bc4:	4b01      	ldr	r3, [pc, #4]	; (8000bcc <HAL_GetTick+0x8>)
 8000bc6:	6818      	ldr	r0, [r3, #0]
 8000bc8:	4770      	bx	lr
 8000bca:	46c0      	nop			; (mov r8, r8)
 8000bcc:	20000004 	.word	0x20000004

08000bd0 <HAL_RCC_OscConfig>:
 8000bd0:	b5f0      	push	{r4, r5, r6, r7, lr}
 8000bd2:	1c04      	adds	r4, r0, #0
 8000bd4:	6800      	ldr	r0, [r0, #0]
 8000bd6:	b085      	sub	sp, #20
 8000bd8:	07c0      	lsls	r0, r0, #31
 8000bda:	d403      	bmi.n	8000be4 <HAL_RCC_OscConfig+0x14>
 8000bdc:	6821      	ldr	r1, [r4, #0]
 8000bde:	0789      	lsls	r1, r1, #30
 8000be0:	d457      	bmi.n	8000c92 <HAL_RCC_OscConfig+0xc2>
 8000be2:	e09d      	b.n	8000d20 <HAL_RCC_OscConfig+0x150>
 8000be4:	4dbc      	ldr	r5, [pc, #752]	; (8000ed8 <HAL_RCC_OscConfig+0x308>)
 8000be6:	230c      	movs	r3, #12
 8000be8:	68ea      	ldr	r2, [r5, #12]
 8000bea:	401a      	ands	r2, r3
 8000bec:	2a08      	cmp	r2, #8
 8000bee:	d008      	beq.n	8000c02 <HAL_RCC_OscConfig+0x32>
 8000bf0:	68ea      	ldr	r2, [r5, #12]
 8000bf2:	4013      	ands	r3, r2
 8000bf4:	2280      	movs	r2, #128	; 0x80
 8000bf6:	0252      	lsls	r2, r2, #9
 8000bf8:	2b0c      	cmp	r3, #12
 8000bfa:	d10a      	bne.n	8000c12 <HAL_RCC_OscConfig+0x42>
 8000bfc:	68eb      	ldr	r3, [r5, #12]
 8000bfe:	4213      	tst	r3, r2
 8000c00:	d007      	beq.n	8000c12 <HAL_RCC_OscConfig+0x42>
 8000c02:	682b      	ldr	r3, [r5, #0]
 8000c04:	039a      	lsls	r2, r3, #14
 8000c06:	d5e9      	bpl.n	8000bdc <HAL_RCC_OscConfig+0xc>
 8000c08:	6863      	ldr	r3, [r4, #4]
 8000c0a:	2b00      	cmp	r3, #0
 8000c0c:	d1e6      	bne.n	8000bdc <HAL_RCC_OscConfig+0xc>
 8000c0e:	2001      	movs	r0, #1
 8000c10:	e1d5      	b.n	8000fbe <HAL_RCC_OscConfig+0x3ee>
 8000c12:	6863      	ldr	r3, [r4, #4]
 8000c14:	2180      	movs	r1, #128	; 0x80
 8000c16:	0249      	lsls	r1, r1, #9
 8000c18:	4293      	cmp	r3, r2
 8000c1a:	d103      	bne.n	8000c24 <HAL_RCC_OscConfig+0x54>
 8000c1c:	682b      	ldr	r3, [r5, #0]
 8000c1e:	431a      	orrs	r2, r3
 8000c20:	602a      	str	r2, [r5, #0]
 8000c22:	e01d      	b.n	8000c60 <HAL_RCC_OscConfig+0x90>
 8000c24:	20a0      	movs	r0, #160	; 0xa0
 8000c26:	4aad      	ldr	r2, [pc, #692]	; (8000edc <HAL_RCC_OscConfig+0x30c>)
 8000c28:	02c0      	lsls	r0, r0, #11
 8000c2a:	4283      	cmp	r3, r0
 8000c2c:	d10b      	bne.n	8000c46 <HAL_RCC_OscConfig+0x76>
 8000c2e:	682b      	ldr	r3, [r5, #0]
 8000c30:	401a      	ands	r2, r3
 8000c32:	602a      	str	r2, [r5, #0]
 8000c34:	682a      	ldr	r2, [r5, #0]
 8000c36:	2380      	movs	r3, #128	; 0x80
 8000c38:	02db      	lsls	r3, r3, #11
 8000c3a:	4313      	orrs	r3, r2
 8000c3c:	602b      	str	r3, [r5, #0]
 8000c3e:	682b      	ldr	r3, [r5, #0]
 8000c40:	4319      	orrs	r1, r3
 8000c42:	6029      	str	r1, [r5, #0]
 8000c44:	e00c      	b.n	8000c60 <HAL_RCC_OscConfig+0x90>
 8000c46:	6828      	ldr	r0, [r5, #0]
 8000c48:	4002      	ands	r2, r0
 8000c4a:	602a      	str	r2, [r5, #0]
 8000c4c:	682a      	ldr	r2, [r5, #0]
 8000c4e:	4011      	ands	r1, r2
 8000c50:	9103      	str	r1, [sp, #12]
 8000c52:	9a03      	ldr	r2, [sp, #12]
 8000c54:	6829      	ldr	r1, [r5, #0]
 8000c56:	4aa2      	ldr	r2, [pc, #648]	; (8000ee0 <HAL_RCC_OscConfig+0x310>)
 8000c58:	400a      	ands	r2, r1
 8000c5a:	602a      	str	r2, [r5, #0]
 8000c5c:	2b00      	cmp	r3, #0
 8000c5e:	d00c      	beq.n	8000c7a <HAL_RCC_OscConfig+0xaa>
 8000c60:	f7ff ffb0 	bl	8000bc4 <HAL_GetTick>
 8000c64:	1c06      	adds	r6, r0, #0
 8000c66:	682b      	ldr	r3, [r5, #0]
 8000c68:	0398      	lsls	r0, r3, #14
 8000c6a:	d4b7      	bmi.n	8000bdc <HAL_RCC_OscConfig+0xc>
 8000c6c:	f7ff ffaa 	bl	8000bc4 <HAL_GetTick>
 8000c70:	1b80      	subs	r0, r0, r6
 8000c72:	2864      	cmp	r0, #100	; 0x64
 8000c74:	d9f7      	bls.n	8000c66 <HAL_RCC_OscConfig+0x96>
 8000c76:	2003      	movs	r0, #3
 8000c78:	e1a1      	b.n	8000fbe <HAL_RCC_OscConfig+0x3ee>
 8000c7a:	f7ff ffa3 	bl	8000bc4 <HAL_GetTick>
 8000c7e:	1c06      	adds	r6, r0, #0
 8000c80:	682b      	ldr	r3, [r5, #0]
 8000c82:	0399      	lsls	r1, r3, #14
 8000c84:	d5aa      	bpl.n	8000bdc <HAL_RCC_OscConfig+0xc>
 8000c86:	f7ff ff9d 	bl	8000bc4 <HAL_GetTick>
 8000c8a:	1b80      	subs	r0, r0, r6
 8000c8c:	2864      	cmp	r0, #100	; 0x64
 8000c8e:	d9f7      	bls.n	8000c80 <HAL_RCC_OscConfig+0xb0>
 8000c90:	e7f1      	b.n	8000c76 <HAL_RCC_OscConfig+0xa6>
 8000c92:	4d91      	ldr	r5, [pc, #580]	; (8000ed8 <HAL_RCC_OscConfig+0x308>)
 8000c94:	230c      	movs	r3, #12
 8000c96:	68ea      	ldr	r2, [r5, #12]
 8000c98:	401a      	ands	r2, r3
 8000c9a:	2a04      	cmp	r2, #4
 8000c9c:	d006      	beq.n	8000cac <HAL_RCC_OscConfig+0xdc>
 8000c9e:	68ea      	ldr	r2, [r5, #12]
 8000ca0:	4013      	ands	r3, r2
 8000ca2:	2b0c      	cmp	r3, #12
 8000ca4:	d110      	bne.n	8000cc8 <HAL_RCC_OscConfig+0xf8>
 8000ca6:	68eb      	ldr	r3, [r5, #12]
 8000ca8:	03da      	lsls	r2, r3, #15
 8000caa:	d40d      	bmi.n	8000cc8 <HAL_RCC_OscConfig+0xf8>
 8000cac:	682b      	ldr	r3, [r5, #0]
 8000cae:	0758      	lsls	r0, r3, #29
 8000cb0:	d502      	bpl.n	8000cb8 <HAL_RCC_OscConfig+0xe8>
 8000cb2:	68e1      	ldr	r1, [r4, #12]
 8000cb4:	2901      	cmp	r1, #1
 8000cb6:	d1aa      	bne.n	8000c0e <HAL_RCC_OscConfig+0x3e>
 8000cb8:	6923      	ldr	r3, [r4, #16]
 8000cba:	6869      	ldr	r1, [r5, #4]
 8000cbc:	021a      	lsls	r2, r3, #8
 8000cbe:	4b89      	ldr	r3, [pc, #548]	; (8000ee4 <HAL_RCC_OscConfig+0x314>)
 8000cc0:	400b      	ands	r3, r1
 8000cc2:	4313      	orrs	r3, r2
 8000cc4:	606b      	str	r3, [r5, #4]
 8000cc6:	e02b      	b.n	8000d20 <HAL_RCC_OscConfig+0x150>
 8000cc8:	68e2      	ldr	r2, [r4, #12]
 8000cca:	2309      	movs	r3, #9
 8000ccc:	2a00      	cmp	r2, #0
 8000cce:	d018      	beq.n	8000d02 <HAL_RCC_OscConfig+0x132>
 8000cd0:	6829      	ldr	r1, [r5, #0]
 8000cd2:	4399      	bics	r1, r3
 8000cd4:	430a      	orrs	r2, r1
 8000cd6:	602a      	str	r2, [r5, #0]
 8000cd8:	f7ff ff74 	bl	8000bc4 <HAL_GetTick>
 8000cdc:	1c06      	adds	r6, r0, #0
 8000cde:	682a      	ldr	r2, [r5, #0]
 8000ce0:	4b7d      	ldr	r3, [pc, #500]	; (8000ed8 <HAL_RCC_OscConfig+0x308>)
 8000ce2:	0750      	lsls	r0, r2, #29
 8000ce4:	d405      	bmi.n	8000cf2 <HAL_RCC_OscConfig+0x122>
 8000ce6:	f7ff ff6d 	bl	8000bc4 <HAL_GetTick>
 8000cea:	1b80      	subs	r0, r0, r6
 8000cec:	2802      	cmp	r0, #2
 8000cee:	d9f6      	bls.n	8000cde <HAL_RCC_OscConfig+0x10e>
 8000cf0:	e7c1      	b.n	8000c76 <HAL_RCC_OscConfig+0xa6>
 8000cf2:	6922      	ldr	r2, [r4, #16]
 8000cf4:	6858      	ldr	r0, [r3, #4]
 8000cf6:	0211      	lsls	r1, r2, #8
 8000cf8:	4a7a      	ldr	r2, [pc, #488]	; (8000ee4 <HAL_RCC_OscConfig+0x314>)
 8000cfa:	4002      	ands	r2, r0
 8000cfc:	430a      	orrs	r2, r1
 8000cfe:	605a      	str	r2, [r3, #4]
 8000d00:	e00e      	b.n	8000d20 <HAL_RCC_OscConfig+0x150>
 8000d02:	682a      	ldr	r2, [r5, #0]
 8000d04:	439a      	bics	r2, r3
 8000d06:	602a      	str	r2, [r5, #0]
 8000d08:	f7ff ff5c 	bl	8000bc4 <HAL_GetTick>
 8000d0c:	1c06      	adds	r6, r0, #0
 8000d0e:	682b      	ldr	r3, [r5, #0]
 8000d10:	0758      	lsls	r0, r3, #29
 8000d12:	d505      	bpl.n	8000d20 <HAL_RCC_OscConfig+0x150>
 8000d14:	f7ff ff56 	bl	8000bc4 <HAL_GetTick>
 8000d18:	1b80      	subs	r0, r0, r6
 8000d1a:	2802      	cmp	r0, #2
 8000d1c:	d9f7      	bls.n	8000d0e <HAL_RCC_OscConfig+0x13e>
 8000d1e:	e7aa      	b.n	8000c76 <HAL_RCC_OscConfig+0xa6>
 8000d20:	6821      	ldr	r1, [r4, #0]
 8000d22:	06c9      	lsls	r1, r1, #27
 8000d24:	d54f      	bpl.n	8000dc6 <HAL_RCC_OscConfig+0x1f6>
 8000d26:	4d6c      	ldr	r5, [pc, #432]	; (8000ed8 <HAL_RCC_OscConfig+0x308>)
 8000d28:	230c      	movs	r3, #12
 8000d2a:	68ea      	ldr	r2, [r5, #12]
 8000d2c:	421a      	tst	r2, r3
 8000d2e:	d117      	bne.n	8000d60 <HAL_RCC_OscConfig+0x190>
 8000d30:	682b      	ldr	r3, [r5, #0]
 8000d32:	059a      	lsls	r2, r3, #22
 8000d34:	d503      	bpl.n	8000d3e <HAL_RCC_OscConfig+0x16e>
 8000d36:	69a3      	ldr	r3, [r4, #24]
 8000d38:	2b00      	cmp	r3, #0
 8000d3a:	d100      	bne.n	8000d3e <HAL_RCC_OscConfig+0x16e>
 8000d3c:	e767      	b.n	8000c0e <HAL_RCC_OscConfig+0x3e>
 8000d3e:	686a      	ldr	r2, [r5, #4]
 8000d40:	4b69      	ldr	r3, [pc, #420]	; (8000ee8 <HAL_RCC_OscConfig+0x318>)
 8000d42:	6a20      	ldr	r0, [r4, #32]
 8000d44:	4013      	ands	r3, r2
 8000d46:	4303      	orrs	r3, r0
 8000d48:	606b      	str	r3, [r5, #4]
 8000d4a:	686b      	ldr	r3, [r5, #4]
 8000d4c:	69e1      	ldr	r1, [r4, #28]
 8000d4e:	021b      	lsls	r3, r3, #8
 8000d50:	060a      	lsls	r2, r1, #24
 8000d52:	0a1b      	lsrs	r3, r3, #8
 8000d54:	4313      	orrs	r3, r2
 8000d56:	606b      	str	r3, [r5, #4]
 8000d58:	2003      	movs	r0, #3
 8000d5a:	f7ff ff21 	bl	8000ba0 <HAL_InitTick>
 8000d5e:	e032      	b.n	8000dc6 <HAL_RCC_OscConfig+0x1f6>
 8000d60:	69a2      	ldr	r2, [r4, #24]
 8000d62:	2a00      	cmp	r2, #0
 8000d64:	d01f      	beq.n	8000da6 <HAL_RCC_OscConfig+0x1d6>
 8000d66:	682a      	ldr	r2, [r5, #0]
 8000d68:	2380      	movs	r3, #128	; 0x80
 8000d6a:	005b      	lsls	r3, r3, #1
 8000d6c:	4313      	orrs	r3, r2
 8000d6e:	602b      	str	r3, [r5, #0]
 8000d70:	f7ff ff28 	bl	8000bc4 <HAL_GetTick>
 8000d74:	1c06      	adds	r6, r0, #0
 8000d76:	682a      	ldr	r2, [r5, #0]
 8000d78:	4b57      	ldr	r3, [pc, #348]	; (8000ed8 <HAL_RCC_OscConfig+0x308>)
 8000d7a:	0590      	lsls	r0, r2, #22
 8000d7c:	d405      	bmi.n	8000d8a <HAL_RCC_OscConfig+0x1ba>
 8000d7e:	f7ff ff21 	bl	8000bc4 <HAL_GetTick>
 8000d82:	1b80      	subs	r0, r0, r6
 8000d84:	2802      	cmp	r0, #2
 8000d86:	d9f6      	bls.n	8000d76 <HAL_RCC_OscConfig+0x1a6>
 8000d88:	e775      	b.n	8000c76 <HAL_RCC_OscConfig+0xa6>
 8000d8a:	6859      	ldr	r1, [r3, #4]
 8000d8c:	4a56      	ldr	r2, [pc, #344]	; (8000ee8 <HAL_RCC_OscConfig+0x318>)
 8000d8e:	400a      	ands	r2, r1
 8000d90:	6a21      	ldr	r1, [r4, #32]
 8000d92:	430a      	orrs	r2, r1
 8000d94:	605a      	str	r2, [r3, #4]
 8000d96:	685a      	ldr	r2, [r3, #4]
 8000d98:	69e0      	ldr	r0, [r4, #28]
 8000d9a:	0212      	lsls	r2, r2, #8
 8000d9c:	0601      	lsls	r1, r0, #24
 8000d9e:	0a12      	lsrs	r2, r2, #8
 8000da0:	430a      	orrs	r2, r1
 8000da2:	605a      	str	r2, [r3, #4]
 8000da4:	e00f      	b.n	8000dc6 <HAL_RCC_OscConfig+0x1f6>
 8000da6:	682a      	ldr	r2, [r5, #0]
 8000da8:	4b50      	ldr	r3, [pc, #320]	; (8000eec <HAL_RCC_OscConfig+0x31c>)
 8000daa:	4013      	ands	r3, r2
 8000dac:	602b      	str	r3, [r5, #0]
 8000dae:	f7ff ff09 	bl	8000bc4 <HAL_GetTick>
 8000db2:	1c06      	adds	r6, r0, #0
 8000db4:	682b      	ldr	r3, [r5, #0]
 8000db6:	0599      	lsls	r1, r3, #22
 8000db8:	d505      	bpl.n	8000dc6 <HAL_RCC_OscConfig+0x1f6>
 8000dba:	f7ff ff03 	bl	8000bc4 <HAL_GetTick>
 8000dbe:	1b80      	subs	r0, r0, r6
 8000dc0:	2802      	cmp	r0, #2
 8000dc2:	d9f7      	bls.n	8000db4 <HAL_RCC_OscConfig+0x1e4>
 8000dc4:	e757      	b.n	8000c76 <HAL_RCC_OscConfig+0xa6>
 8000dc6:	6822      	ldr	r2, [r4, #0]
 8000dc8:	0712      	lsls	r2, r2, #28
 8000dca:	d403      	bmi.n	8000dd4 <HAL_RCC_OscConfig+0x204>
 8000dcc:	6823      	ldr	r3, [r4, #0]
 8000dce:	075b      	lsls	r3, r3, #29
 8000dd0:	d422      	bmi.n	8000e18 <HAL_RCC_OscConfig+0x248>
 8000dd2:	e0ab      	b.n	8000f2c <HAL_RCC_OscConfig+0x35c>
 8000dd4:	4d40      	ldr	r5, [pc, #256]	; (8000ed8 <HAL_RCC_OscConfig+0x308>)
 8000dd6:	6960      	ldr	r0, [r4, #20]
 8000dd8:	2301      	movs	r3, #1
 8000dda:	6d2a      	ldr	r2, [r5, #80]	; 0x50
 8000ddc:	2800      	cmp	r0, #0
 8000dde:	d00d      	beq.n	8000dfc <HAL_RCC_OscConfig+0x22c>
 8000de0:	4313      	orrs	r3, r2
 8000de2:	652b      	str	r3, [r5, #80]	; 0x50
 8000de4:	f7ff feee 	bl	8000bc4 <HAL_GetTick>
 8000de8:	1c06      	adds	r6, r0, #0
 8000dea:	6d2b      	ldr	r3, [r5, #80]	; 0x50
 8000dec:	0799      	lsls	r1, r3, #30
 8000dee:	d4ed      	bmi.n	8000dcc <HAL_RCC_OscConfig+0x1fc>
 8000df0:	f7ff fee8 	bl	8000bc4 <HAL_GetTick>
 8000df4:	1b80      	subs	r0, r0, r6
 8000df6:	2802      	cmp	r0, #2
 8000df8:	d9f7      	bls.n	8000dea <HAL_RCC_OscConfig+0x21a>
 8000dfa:	e73c      	b.n	8000c76 <HAL_RCC_OscConfig+0xa6>
 8000dfc:	439a      	bics	r2, r3
 8000dfe:	652a      	str	r2, [r5, #80]	; 0x50
 8000e00:	f7ff fee0 	bl	8000bc4 <HAL_GetTick>
 8000e04:	1c06      	adds	r6, r0, #0
 8000e06:	6d2b      	ldr	r3, [r5, #80]	; 0x50
 8000e08:	079a      	lsls	r2, r3, #30
 8000e0a:	d5df      	bpl.n	8000dcc <HAL_RCC_OscConfig+0x1fc>
 8000e0c:	f7ff feda 	bl	8000bc4 <HAL_GetTick>
 8000e10:	1b80      	subs	r0, r0, r6
 8000e12:	2802      	cmp	r0, #2
 8000e14:	d9f7      	bls.n	8000e06 <HAL_RCC_OscConfig+0x236>
 8000e16:	e72e      	b.n	8000c76 <HAL_RCC_OscConfig+0xa6>
 8000e18:	4d2f      	ldr	r5, [pc, #188]	; (8000ed8 <HAL_RCC_OscConfig+0x308>)
 8000e1a:	2380      	movs	r3, #128	; 0x80
 8000e1c:	6baa      	ldr	r2, [r5, #56]	; 0x38
 8000e1e:	2000      	movs	r0, #0
 8000e20:	055b      	lsls	r3, r3, #21
 8000e22:	9000      	str	r0, [sp, #0]
 8000e24:	421a      	tst	r2, r3
 8000e26:	d104      	bne.n	8000e32 <HAL_RCC_OscConfig+0x262>
 8000e28:	6baa      	ldr	r2, [r5, #56]	; 0x38
 8000e2a:	2101      	movs	r1, #1
 8000e2c:	4313      	orrs	r3, r2
 8000e2e:	63ab      	str	r3, [r5, #56]	; 0x38
 8000e30:	9100      	str	r1, [sp, #0]
 8000e32:	4e2f      	ldr	r6, [pc, #188]	; (8000ef0 <HAL_RCC_OscConfig+0x320>)
 8000e34:	2380      	movs	r3, #128	; 0x80
 8000e36:	6832      	ldr	r2, [r6, #0]
 8000e38:	2000      	movs	r0, #0
 8000e3a:	005b      	lsls	r3, r3, #1
 8000e3c:	9001      	str	r0, [sp, #4]
 8000e3e:	421a      	tst	r2, r3
 8000e40:	d110      	bne.n	8000e64 <HAL_RCC_OscConfig+0x294>
 8000e42:	6832      	ldr	r2, [r6, #0]
 8000e44:	4313      	orrs	r3, r2
 8000e46:	6033      	str	r3, [r6, #0]
 8000e48:	f7ff febc 	bl	8000bc4 <HAL_GetTick>
 8000e4c:	1c07      	adds	r7, r0, #0
 8000e4e:	6833      	ldr	r3, [r6, #0]
 8000e50:	05d9      	lsls	r1, r3, #23
 8000e52:	d405      	bmi.n	8000e60 <HAL_RCC_OscConfig+0x290>
 8000e54:	f7ff feb6 	bl	8000bc4 <HAL_GetTick>
 8000e58:	1bc0      	subs	r0, r0, r7
 8000e5a:	2864      	cmp	r0, #100	; 0x64
 8000e5c:	d9f7      	bls.n	8000e4e <HAL_RCC_OscConfig+0x27e>
 8000e5e:	e70a      	b.n	8000c76 <HAL_RCC_OscConfig+0xa6>
 8000e60:	2201      	movs	r2, #1
 8000e62:	9201      	str	r2, [sp, #4]
 8000e64:	68a3      	ldr	r3, [r4, #8]
 8000e66:	2180      	movs	r1, #128	; 0x80
 8000e68:	0049      	lsls	r1, r1, #1
 8000e6a:	428b      	cmp	r3, r1
 8000e6c:	d102      	bne.n	8000e74 <HAL_RCC_OscConfig+0x2a4>
 8000e6e:	6d2a      	ldr	r2, [r5, #80]	; 0x50
 8000e70:	4313      	orrs	r3, r2
 8000e72:	e023      	b.n	8000ebc <HAL_RCC_OscConfig+0x2ec>
 8000e74:	4a1d      	ldr	r2, [pc, #116]	; (8000eec <HAL_RCC_OscConfig+0x31c>)
 8000e76:	2b00      	cmp	r3, #0
 8000e78:	d10a      	bne.n	8000e90 <HAL_RCC_OscConfig+0x2c0>
 8000e7a:	6d2b      	ldr	r3, [r5, #80]	; 0x50
 8000e7c:	401a      	ands	r2, r3
 8000e7e:	652a      	str	r2, [r5, #80]	; 0x50
 8000e80:	6d2a      	ldr	r2, [r5, #80]	; 0x50
 8000e82:	4b1c      	ldr	r3, [pc, #112]	; (8000ef4 <HAL_RCC_OscConfig+0x324>)
 8000e84:	4013      	ands	r3, r2
 8000e86:	652b      	str	r3, [r5, #80]	; 0x50
 8000e88:	f7ff fe9c 	bl	8000bc4 <HAL_GetTick>
 8000e8c:	1c07      	adds	r7, r0, #0
 8000e8e:	e03c      	b.n	8000f0a <HAL_RCC_OscConfig+0x33a>
 8000e90:	20a0      	movs	r0, #160	; 0xa0
 8000e92:	00c0      	lsls	r0, r0, #3
 8000e94:	4283      	cmp	r3, r0
 8000e96:	d10b      	bne.n	8000eb0 <HAL_RCC_OscConfig+0x2e0>
 8000e98:	6d2b      	ldr	r3, [r5, #80]	; 0x50
 8000e9a:	401a      	ands	r2, r3
 8000e9c:	652a      	str	r2, [r5, #80]	; 0x50
 8000e9e:	6d2a      	ldr	r2, [r5, #80]	; 0x50
 8000ea0:	2380      	movs	r3, #128	; 0x80
 8000ea2:	00db      	lsls	r3, r3, #3
 8000ea4:	4313      	orrs	r3, r2
 8000ea6:	652b      	str	r3, [r5, #80]	; 0x50
 8000ea8:	6d2b      	ldr	r3, [r5, #80]	; 0x50
 8000eaa:	4319      	orrs	r1, r3
 8000eac:	6529      	str	r1, [r5, #80]	; 0x50
 8000eae:	e006      	b.n	8000ebe <HAL_RCC_OscConfig+0x2ee>
 8000eb0:	6d2b      	ldr	r3, [r5, #80]	; 0x50
 8000eb2:	401a      	ands	r2, r3
 8000eb4:	652a      	str	r2, [r5, #80]	; 0x50
 8000eb6:	6d2a      	ldr	r2, [r5, #80]	; 0x50
 8000eb8:	4b0e      	ldr	r3, [pc, #56]	; (8000ef4 <HAL_RCC_OscConfig+0x324>)
 8000eba:	4013      	ands	r3, r2
 8000ebc:	652b      	str	r3, [r5, #80]	; 0x50
 8000ebe:	f7ff fe81 	bl	8000bc4 <HAL_GetTick>
 8000ec2:	1c07      	adds	r7, r0, #0
 8000ec4:	6d2b      	ldr	r3, [r5, #80]	; 0x50
 8000ec6:	0598      	lsls	r0, r3, #22
 8000ec8:	d422      	bmi.n	8000f10 <HAL_RCC_OscConfig+0x340>
 8000eca:	f7ff fe7b 	bl	8000bc4 <HAL_GetTick>
 8000ece:	4b0a      	ldr	r3, [pc, #40]	; (8000ef8 <HAL_RCC_OscConfig+0x328>)
 8000ed0:	1bc0      	subs	r0, r0, r7
 8000ed2:	4298      	cmp	r0, r3
 8000ed4:	d9f6      	bls.n	8000ec4 <HAL_RCC_OscConfig+0x2f4>
 8000ed6:	e6ce      	b.n	8000c76 <HAL_RCC_OscConfig+0xa6>
 8000ed8:	40021000 	.word	0x40021000
 8000edc:	fffeffff 	.word	0xfffeffff
 8000ee0:	fffbffff 	.word	0xfffbffff
 8000ee4:	ffffe0ff 	.word	0xffffe0ff
 8000ee8:	ffff1fff 	.word	0xffff1fff
 8000eec:	fffffeff 	.word	0xfffffeff
 8000ef0:	40007000 	.word	0x40007000
 8000ef4:	fffffbff 	.word	0xfffffbff
 8000ef8:	00001388 	.word	0x00001388
 8000efc:	f7ff fe62 	bl	8000bc4 <HAL_GetTick>
 8000f00:	4b30      	ldr	r3, [pc, #192]	; (8000fc4 <HAL_RCC_OscConfig+0x3f4>)
 8000f02:	1bc0      	subs	r0, r0, r7
 8000f04:	4298      	cmp	r0, r3
 8000f06:	d900      	bls.n	8000f0a <HAL_RCC_OscConfig+0x33a>
 8000f08:	e6b5      	b.n	8000c76 <HAL_RCC_OscConfig+0xa6>
 8000f0a:	6d2b      	ldr	r3, [r5, #80]	; 0x50
 8000f0c:	059a      	lsls	r2, r3, #22
 8000f0e:	d4f5      	bmi.n	8000efc <HAL_RCC_OscConfig+0x32c>
 8000f10:	9901      	ldr	r1, [sp, #4]
 8000f12:	2901      	cmp	r1, #1
 8000f14:	d103      	bne.n	8000f1e <HAL_RCC_OscConfig+0x34e>
 8000f16:	6832      	ldr	r2, [r6, #0]
 8000f18:	4b2b      	ldr	r3, [pc, #172]	; (8000fc8 <HAL_RCC_OscConfig+0x3f8>)
 8000f1a:	4013      	ands	r3, r2
 8000f1c:	6033      	str	r3, [r6, #0]
 8000f1e:	9b00      	ldr	r3, [sp, #0]
 8000f20:	2b01      	cmp	r3, #1
 8000f22:	d103      	bne.n	8000f2c <HAL_RCC_OscConfig+0x35c>
 8000f24:	6baa      	ldr	r2, [r5, #56]	; 0x38
 8000f26:	4b29      	ldr	r3, [pc, #164]	; (8000fcc <HAL_RCC_OscConfig+0x3fc>)
 8000f28:	4013      	ands	r3, r2
 8000f2a:	63ab      	str	r3, [r5, #56]	; 0x38
 8000f2c:	6a62      	ldr	r2, [r4, #36]	; 0x24
 8000f2e:	2a00      	cmp	r2, #0
 8000f30:	d101      	bne.n	8000f36 <HAL_RCC_OscConfig+0x366>
 8000f32:	2000      	movs	r0, #0
 8000f34:	e043      	b.n	8000fbe <HAL_RCC_OscConfig+0x3ee>
 8000f36:	4d26      	ldr	r5, [pc, #152]	; (8000fd0 <HAL_RCC_OscConfig+0x400>)
 8000f38:	230c      	movs	r3, #12
 8000f3a:	68e9      	ldr	r1, [r5, #12]
 8000f3c:	400b      	ands	r3, r1
 8000f3e:	2b0c      	cmp	r3, #12
 8000f40:	d100      	bne.n	8000f44 <HAL_RCC_OscConfig+0x374>
 8000f42:	e664      	b.n	8000c0e <HAL_RCC_OscConfig+0x3e>
 8000f44:	4b23      	ldr	r3, [pc, #140]	; (8000fd4 <HAL_RCC_OscConfig+0x404>)
 8000f46:	2a02      	cmp	r2, #2
 8000f48:	d12a      	bne.n	8000fa0 <HAL_RCC_OscConfig+0x3d0>
 8000f4a:	682a      	ldr	r2, [r5, #0]
 8000f4c:	4013      	ands	r3, r2
 8000f4e:	602b      	str	r3, [r5, #0]
 8000f50:	f7ff fe38 	bl	8000bc4 <HAL_GetTick>
 8000f54:	1c06      	adds	r6, r0, #0
 8000f56:	682a      	ldr	r2, [r5, #0]
 8000f58:	4b1d      	ldr	r3, [pc, #116]	; (8000fd0 <HAL_RCC_OscConfig+0x400>)
 8000f5a:	0190      	lsls	r0, r2, #6
 8000f5c:	d505      	bpl.n	8000f6a <HAL_RCC_OscConfig+0x39a>
 8000f5e:	f7ff fe31 	bl	8000bc4 <HAL_GetTick>
 8000f62:	1b80      	subs	r0, r0, r6
 8000f64:	2802      	cmp	r0, #2
 8000f66:	d9f6      	bls.n	8000f56 <HAL_RCC_OscConfig+0x386>
 8000f68:	e685      	b.n	8000c76 <HAL_RCC_OscConfig+0xa6>
 8000f6a:	6ae2      	ldr	r2, [r4, #44]	; 0x2c
 8000f6c:	6b21      	ldr	r1, [r4, #48]	; 0x30
 8000f6e:	68d8      	ldr	r0, [r3, #12]
 8000f70:	4311      	orrs	r1, r2
 8000f72:	6aa2      	ldr	r2, [r4, #40]	; 0x28
 8000f74:	4311      	orrs	r1, r2
 8000f76:	4a18      	ldr	r2, [pc, #96]	; (8000fd8 <HAL_RCC_OscConfig+0x408>)
 8000f78:	4002      	ands	r2, r0
 8000f7a:	430a      	orrs	r2, r1
 8000f7c:	60da      	str	r2, [r3, #12]
 8000f7e:	6819      	ldr	r1, [r3, #0]
 8000f80:	2280      	movs	r2, #128	; 0x80
 8000f82:	0452      	lsls	r2, r2, #17
 8000f84:	430a      	orrs	r2, r1
 8000f86:	601a      	str	r2, [r3, #0]
 8000f88:	f7ff fe1c 	bl	8000bc4 <HAL_GetTick>
 8000f8c:	1c04      	adds	r4, r0, #0
 8000f8e:	682b      	ldr	r3, [r5, #0]
 8000f90:	0198      	lsls	r0, r3, #6
 8000f92:	d4ce      	bmi.n	8000f32 <HAL_RCC_OscConfig+0x362>
 8000f94:	f7ff fe16 	bl	8000bc4 <HAL_GetTick>
 8000f98:	1b00      	subs	r0, r0, r4
 8000f9a:	2802      	cmp	r0, #2
 8000f9c:	d9f7      	bls.n	8000f8e <HAL_RCC_OscConfig+0x3be>
 8000f9e:	e66a      	b.n	8000c76 <HAL_RCC_OscConfig+0xa6>
 8000fa0:	682a      	ldr	r2, [r5, #0]
 8000fa2:	4013      	ands	r3, r2
 8000fa4:	602b      	str	r3, [r5, #0]
 8000fa6:	f7ff fe0d 	bl	8000bc4 <HAL_GetTick>
 8000faa:	1c04      	adds	r4, r0, #0
 8000fac:	682b      	ldr	r3, [r5, #0]
 8000fae:	0199      	lsls	r1, r3, #6
 8000fb0:	d5bf      	bpl.n	8000f32 <HAL_RCC_OscConfig+0x362>
 8000fb2:	f7ff fe07 	bl	8000bc4 <HAL_GetTick>
 8000fb6:	1b00      	subs	r0, r0, r4
 8000fb8:	2802      	cmp	r0, #2
 8000fba:	d9f7      	bls.n	8000fac <HAL_RCC_OscConfig+0x3dc>
 8000fbc:	e65b      	b.n	8000c76 <HAL_RCC_OscConfig+0xa6>
 8000fbe:	b005      	add	sp, #20
 8000fc0:	bdf0      	pop	{r4, r5, r6, r7, pc}
 8000fc2:	46c0      	nop			; (mov r8, r8)
 8000fc4:	00001388 	.word	0x00001388
 8000fc8:	fffffeff 	.word	0xfffffeff
 8000fcc:	efffffff 	.word	0xefffffff
 8000fd0:	40021000 	.word	0x40021000
 8000fd4:	feffffff 	.word	0xfeffffff
 8000fd8:	ff02ffff 	.word	0xff02ffff

08000fdc <HAL_RCC_ClockConfig>:
 8000fdc:	b5f7      	push	{r0, r1, r2, r4, r5, r6, r7, lr}
 8000fde:	4f4f      	ldr	r7, [pc, #316]	; (800111c <HAL_RCC_ClockConfig+0x140>)
 8000fe0:	2301      	movs	r3, #1
 8000fe2:	683a      	ldr	r2, [r7, #0]
 8000fe4:	1c05      	adds	r5, r0, #0
 8000fe6:	1c0e      	adds	r6, r1, #0
 8000fe8:	401a      	ands	r2, r3
 8000fea:	4291      	cmp	r1, r2
 8000fec:	d80a      	bhi.n	8001004 <HAL_RCC_ClockConfig+0x28>
 8000fee:	682b      	ldr	r3, [r5, #0]
 8000ff0:	0798      	lsls	r0, r3, #30
 8000ff2:	d511      	bpl.n	8001018 <HAL_RCC_ClockConfig+0x3c>
 8000ff4:	4a4a      	ldr	r2, [pc, #296]	; (8001120 <HAL_RCC_ClockConfig+0x144>)
 8000ff6:	20f0      	movs	r0, #240	; 0xf0
 8000ff8:	68d1      	ldr	r1, [r2, #12]
 8000ffa:	4381      	bics	r1, r0
 8000ffc:	68a8      	ldr	r0, [r5, #8]
 8000ffe:	4301      	orrs	r1, r0
 8001000:	60d1      	str	r1, [r2, #12]
 8001002:	e009      	b.n	8001018 <HAL_RCC_ClockConfig+0x3c>
 8001004:	683a      	ldr	r2, [r7, #0]
 8001006:	439a      	bics	r2, r3
 8001008:	430a      	orrs	r2, r1
 800100a:	603a      	str	r2, [r7, #0]
 800100c:	683a      	ldr	r2, [r7, #0]
 800100e:	4013      	ands	r3, r2
 8001010:	428b      	cmp	r3, r1
 8001012:	d0ec      	beq.n	8000fee <HAL_RCC_ClockConfig+0x12>
 8001014:	2001      	movs	r0, #1
 8001016:	e080      	b.n	800111a <HAL_RCC_ClockConfig+0x13e>
 8001018:	07d9      	lsls	r1, r3, #31
 800101a:	d406      	bmi.n	800102a <HAL_RCC_ClockConfig+0x4e>
 800101c:	6839      	ldr	r1, [r7, #0]
 800101e:	2301      	movs	r3, #1
 8001020:	4a3e      	ldr	r2, [pc, #248]	; (800111c <HAL_RCC_ClockConfig+0x140>)
 8001022:	4019      	ands	r1, r3
 8001024:	428e      	cmp	r6, r1
 8001026:	d958      	bls.n	80010da <HAL_RCC_ClockConfig+0xfe>
 8001028:	e05f      	b.n	80010ea <HAL_RCC_ClockConfig+0x10e>
 800102a:	4c3d      	ldr	r4, [pc, #244]	; (8001120 <HAL_RCC_ClockConfig+0x144>)
 800102c:	686b      	ldr	r3, [r5, #4]
 800102e:	6822      	ldr	r2, [r4, #0]
 8001030:	2b02      	cmp	r3, #2
 8001032:	d102      	bne.n	800103a <HAL_RCC_ClockConfig+0x5e>
 8001034:	0390      	lsls	r0, r2, #14
 8001036:	d40c      	bmi.n	8001052 <HAL_RCC_ClockConfig+0x76>
 8001038:	e7ec      	b.n	8001014 <HAL_RCC_ClockConfig+0x38>
 800103a:	2b00      	cmp	r3, #0
 800103c:	d102      	bne.n	8001044 <HAL_RCC_ClockConfig+0x68>
 800103e:	0591      	lsls	r1, r2, #22
 8001040:	d407      	bmi.n	8001052 <HAL_RCC_ClockConfig+0x76>
 8001042:	e7e7      	b.n	8001014 <HAL_RCC_ClockConfig+0x38>
 8001044:	2b03      	cmp	r3, #3
 8001046:	d102      	bne.n	800104e <HAL_RCC_ClockConfig+0x72>
 8001048:	0190      	lsls	r0, r2, #6
 800104a:	d402      	bmi.n	8001052 <HAL_RCC_ClockConfig+0x76>
 800104c:	e7e2      	b.n	8001014 <HAL_RCC_ClockConfig+0x38>
 800104e:	0751      	lsls	r1, r2, #29
 8001050:	d5e0      	bpl.n	8001014 <HAL_RCC_ClockConfig+0x38>
 8001052:	68e2      	ldr	r2, [r4, #12]
 8001054:	2103      	movs	r1, #3
 8001056:	438a      	bics	r2, r1
 8001058:	4313      	orrs	r3, r2
 800105a:	60e3      	str	r3, [r4, #12]
 800105c:	f7ff fdb2 	bl	8000bc4 <HAL_GetTick>
 8001060:	686b      	ldr	r3, [r5, #4]
 8001062:	9001      	str	r0, [sp, #4]
 8001064:	2b02      	cmp	r3, #2
 8001066:	d10d      	bne.n	8001084 <HAL_RCC_ClockConfig+0xa8>
 8001068:	68e2      	ldr	r2, [r4, #12]
 800106a:	230c      	movs	r3, #12
 800106c:	4013      	ands	r3, r2
 800106e:	2b08      	cmp	r3, #8
 8001070:	d0d4      	beq.n	800101c <HAL_RCC_ClockConfig+0x40>
 8001072:	f7ff fda7 	bl	8000bc4 <HAL_GetTick>
 8001076:	9a01      	ldr	r2, [sp, #4]
 8001078:	4b2a      	ldr	r3, [pc, #168]	; (8001124 <HAL_RCC_ClockConfig+0x148>)
 800107a:	1a80      	subs	r0, r0, r2
 800107c:	4298      	cmp	r0, r3
 800107e:	d9f3      	bls.n	8001068 <HAL_RCC_ClockConfig+0x8c>
 8001080:	2003      	movs	r0, #3
 8001082:	e04a      	b.n	800111a <HAL_RCC_ClockConfig+0x13e>
 8001084:	2b03      	cmp	r3, #3
 8001086:	d10c      	bne.n	80010a2 <HAL_RCC_ClockConfig+0xc6>
 8001088:	68e2      	ldr	r2, [r4, #12]
 800108a:	230c      	movs	r3, #12
 800108c:	4013      	ands	r3, r2
 800108e:	2b0c      	cmp	r3, #12
 8001090:	d0c4      	beq.n	800101c <HAL_RCC_ClockConfig+0x40>
 8001092:	f7ff fd97 	bl	8000bc4 <HAL_GetTick>
 8001096:	9b01      	ldr	r3, [sp, #4]
 8001098:	1ac0      	subs	r0, r0, r3
 800109a:	4b22      	ldr	r3, [pc, #136]	; (8001124 <HAL_RCC_ClockConfig+0x148>)
 800109c:	4298      	cmp	r0, r3
 800109e:	d9f3      	bls.n	8001088 <HAL_RCC_ClockConfig+0xac>
 80010a0:	e7ee      	b.n	8001080 <HAL_RCC_ClockConfig+0xa4>
 80010a2:	2b00      	cmp	r3, #0
 80010a4:	d00c      	beq.n	80010c0 <HAL_RCC_ClockConfig+0xe4>
 80010a6:	68e2      	ldr	r2, [r4, #12]
 80010a8:	230c      	movs	r3, #12
 80010aa:	4013      	ands	r3, r2
 80010ac:	2b04      	cmp	r3, #4
 80010ae:	d10c      	bne.n	80010ca <HAL_RCC_ClockConfig+0xee>
 80010b0:	e7b4      	b.n	800101c <HAL_RCC_ClockConfig+0x40>
 80010b2:	f7ff fd87 	bl	8000bc4 <HAL_GetTick>
 80010b6:	9901      	ldr	r1, [sp, #4]
 80010b8:	4b1a      	ldr	r3, [pc, #104]	; (8001124 <HAL_RCC_ClockConfig+0x148>)
 80010ba:	1a40      	subs	r0, r0, r1
 80010bc:	4298      	cmp	r0, r3
 80010be:	d8df      	bhi.n	8001080 <HAL_RCC_ClockConfig+0xa4>
 80010c0:	68e2      	ldr	r2, [r4, #12]
 80010c2:	230c      	movs	r3, #12
 80010c4:	421a      	tst	r2, r3
 80010c6:	d1f4      	bne.n	80010b2 <HAL_RCC_ClockConfig+0xd6>
 80010c8:	e7a8      	b.n	800101c <HAL_RCC_ClockConfig+0x40>
 80010ca:	f7ff fd7b 	bl	8000bc4 <HAL_GetTick>
 80010ce:	9a01      	ldr	r2, [sp, #4]
 80010d0:	4b14      	ldr	r3, [pc, #80]	; (8001124 <HAL_RCC_ClockConfig+0x148>)
 80010d2:	1a80      	subs	r0, r0, r2
 80010d4:	4298      	cmp	r0, r3
 80010d6:	d9e6      	bls.n	80010a6 <HAL_RCC_ClockConfig+0xca>
 80010d8:	e7d2      	b.n	8001080 <HAL_RCC_ClockConfig+0xa4>
 80010da:	6811      	ldr	r1, [r2, #0]
 80010dc:	4399      	bics	r1, r3
 80010de:	4331      	orrs	r1, r6
 80010e0:	6011      	str	r1, [r2, #0]
 80010e2:	6812      	ldr	r2, [r2, #0]
 80010e4:	4013      	ands	r3, r2
 80010e6:	42b3      	cmp	r3, r6
 80010e8:	d194      	bne.n	8001014 <HAL_RCC_ClockConfig+0x38>
 80010ea:	682b      	ldr	r3, [r5, #0]
 80010ec:	0758      	lsls	r0, r3, #29
 80010ee:	d506      	bpl.n	80010fe <HAL_RCC_ClockConfig+0x122>
 80010f0:	4a0b      	ldr	r2, [pc, #44]	; (8001120 <HAL_RCC_ClockConfig+0x144>)
 80010f2:	490d      	ldr	r1, [pc, #52]	; (8001128 <HAL_RCC_ClockConfig+0x14c>)
 80010f4:	68d0      	ldr	r0, [r2, #12]
 80010f6:	4001      	ands	r1, r0
 80010f8:	68e8      	ldr	r0, [r5, #12]
 80010fa:	4301      	orrs	r1, r0
 80010fc:	60d1      	str	r1, [r2, #12]
 80010fe:	0719      	lsls	r1, r3, #28
 8001100:	d507      	bpl.n	8001112 <HAL_RCC_ClockConfig+0x136>
 8001102:	4b07      	ldr	r3, [pc, #28]	; (8001120 <HAL_RCC_ClockConfig+0x144>)
 8001104:	6929      	ldr	r1, [r5, #16]
 8001106:	68d8      	ldr	r0, [r3, #12]
 8001108:	4a08      	ldr	r2, [pc, #32]	; (800112c <HAL_RCC_ClockConfig+0x150>)
 800110a:	00c9      	lsls	r1, r1, #3
 800110c:	4002      	ands	r2, r0
 800110e:	430a      	orrs	r2, r1
 8001110:	60da      	str	r2, [r3, #12]
 8001112:	2003      	movs	r0, #3
 8001114:	f7ff fd44 	bl	8000ba0 <HAL_InitTick>
 8001118:	2000      	movs	r0, #0
 800111a:	bdfe      	pop	{r1, r2, r3, r4, r5, r6, r7, pc}
 800111c:	40022000 	.word	0x40022000
 8001120:	40021000 	.word	0x40021000
 8001124:	00001388 	.word	0x00001388
 8001128:	fffff8ff 	.word	0xfffff8ff
 800112c:	ffffc7ff 	.word	0xffffc7ff

08001130 <HAL_RCC_GetSysClockFreq>:
 8001130:	b508      	push	{r3, lr}
 8001132:	4b1b      	ldr	r3, [pc, #108]	; (80011a0 <HAL_RCC_GetSysClockFreq+0x70>)
 8001134:	210c      	movs	r1, #12
 8001136:	685a      	ldr	r2, [r3, #4]
 8001138:	68d8      	ldr	r0, [r3, #12]
 800113a:	0412      	lsls	r2, r2, #16
 800113c:	4008      	ands	r0, r1
 800113e:	0f52      	lsrs	r2, r2, #29
 8001140:	f000 f948 	bl	80013d4 <__gnu_thumb1_case_uqi>
 8001144:	25252525 	.word	0x25252525
 8001148:	25252507 	.word	0x25252507
 800114c:	2525252a 	.word	0x2525252a
 8001150:	0c          	.byte	0x0c
 8001151:	00          	.byte	0x00
 8001152:	681b      	ldr	r3, [r3, #0]
 8001154:	06d8      	lsls	r0, r3, #27
 8001156:	d521      	bpl.n	800119c <HAL_RCC_GetSysClockFreq+0x6c>
 8001158:	4812      	ldr	r0, [pc, #72]	; (80011a4 <HAL_RCC_GetSysClockFreq+0x74>)
 800115a:	e020      	b.n	800119e <HAL_RCC_GetSysClockFreq+0x6e>
 800115c:	68da      	ldr	r2, [r3, #12]
 800115e:	68d9      	ldr	r1, [r3, #12]
 8001160:	0292      	lsls	r2, r2, #10
 8001162:	4811      	ldr	r0, [pc, #68]	; (80011a8 <HAL_RCC_GetSysClockFreq+0x78>)
 8001164:	0209      	lsls	r1, r1, #8
 8001166:	68db      	ldr	r3, [r3, #12]
 8001168:	0f12      	lsrs	r2, r2, #28
 800116a:	0f89      	lsrs	r1, r1, #30
 800116c:	5c82      	ldrb	r2, [r0, r2]
 800116e:	3101      	adds	r1, #1
 8001170:	03d8      	lsls	r0, r3, #15
 8001172:	d407      	bmi.n	8001184 <HAL_RCC_GetSysClockFreq+0x54>
 8001174:	4b0a      	ldr	r3, [pc, #40]	; (80011a0 <HAL_RCC_GetSysClockFreq+0x70>)
 8001176:	681b      	ldr	r3, [r3, #0]
 8001178:	06d8      	lsls	r0, r3, #27
 800117a:	d501      	bpl.n	8001180 <HAL_RCC_GetSysClockFreq+0x50>
 800117c:	4809      	ldr	r0, [pc, #36]	; (80011a4 <HAL_RCC_GetSysClockFreq+0x74>)
 800117e:	e002      	b.n	8001186 <HAL_RCC_GetSysClockFreq+0x56>
 8001180:	480a      	ldr	r0, [pc, #40]	; (80011ac <HAL_RCC_GetSysClockFreq+0x7c>)
 8001182:	e000      	b.n	8001186 <HAL_RCC_GetSysClockFreq+0x56>
 8001184:	480a      	ldr	r0, [pc, #40]	; (80011b0 <HAL_RCC_GetSysClockFreq+0x80>)
 8001186:	4350      	muls	r0, r2
 8001188:	f000 f92e 	bl	80013e8 <__aeabi_uidiv>
 800118c:	e007      	b.n	800119e <HAL_RCC_GetSysClockFreq+0x6e>
 800118e:	2080      	movs	r0, #128	; 0x80
 8001190:	3201      	adds	r2, #1
 8001192:	0200      	lsls	r0, r0, #8
 8001194:	4090      	lsls	r0, r2
 8001196:	e002      	b.n	800119e <HAL_RCC_GetSysClockFreq+0x6e>
 8001198:	4805      	ldr	r0, [pc, #20]	; (80011b0 <HAL_RCC_GetSysClockFreq+0x80>)
 800119a:	e000      	b.n	800119e <HAL_RCC_GetSysClockFreq+0x6e>
 800119c:	4803      	ldr	r0, [pc, #12]	; (80011ac <HAL_RCC_GetSysClockFreq+0x7c>)
 800119e:	bd08      	pop	{r3, pc}
 80011a0:	40021000 	.word	0x40021000
 80011a4:	003d0900 	.word	0x003d0900
 80011a8:	080016a1 	.word	0x080016a1
 80011ac:	00f42400 	.word	0x00f42400
 80011b0:	007a1200 	.word	0x007a1200

080011b4 <HAL_RCC_GetHCLKFreq>:
 80011b4:	b508      	push	{r3, lr}
 80011b6:	f7ff ffbb 	bl	8001130 <HAL_RCC_GetSysClockFreq>
 80011ba:	4b05      	ldr	r3, [pc, #20]	; (80011d0 <HAL_RCC_GetHCLKFreq+0x1c>)
 80011bc:	4a05      	ldr	r2, [pc, #20]	; (80011d4 <HAL_RCC_GetHCLKFreq+0x20>)
 80011be:	68db      	ldr	r3, [r3, #12]
 80011c0:	061b      	lsls	r3, r3, #24
 80011c2:	0f1b      	lsrs	r3, r3, #28
 80011c4:	5cd3      	ldrb	r3, [r2, r3]
 80011c6:	40d8      	lsrs	r0, r3
 80011c8:	4b03      	ldr	r3, [pc, #12]	; (80011d8 <HAL_RCC_GetHCLKFreq+0x24>)
 80011ca:	6018      	str	r0, [r3, #0]
 80011cc:	bd08      	pop	{r3, pc}
 80011ce:	46c0      	nop			; (mov r8, r8)
 80011d0:	40021000 	.word	0x40021000
 80011d4:	080016aa 	.word	0x080016aa
 80011d8:	20000000 	.word	0x20000000

080011dc <HAL_GPIO_Init>:
 80011dc:	b5f0      	push	{r4, r5, r6, r7, lr}
 80011de:	680a      	ldr	r2, [r1, #0]
 80011e0:	b085      	sub	sp, #20
 80011e2:	9203      	str	r2, [sp, #12]
 80011e4:	2300      	movs	r3, #0
 80011e6:	9a03      	ldr	r2, [sp, #12]
 80011e8:	40da      	lsrs	r2, r3
 80011ea:	d100      	bne.n	80011ee <HAL_GPIO_Init+0x12>
 80011ec:	e097      	b.n	800131e <HAL_GPIO_Init+0x142>
 80011ee:	2201      	movs	r2, #1
 80011f0:	9c03      	ldr	r4, [sp, #12]
 80011f2:	409a      	lsls	r2, r3
 80011f4:	4014      	ands	r4, r2
 80011f6:	46a4      	mov	ip, r4
 80011f8:	d100      	bne.n	80011fc <HAL_GPIO_Init+0x20>
 80011fa:	e08e      	b.n	800131a <HAL_GPIO_Init+0x13e>
 80011fc:	684a      	ldr	r2, [r1, #4]
 80011fe:	2410      	movs	r4, #16
 8001200:	1c15      	adds	r5, r2, #0
 8001202:	43a5      	bics	r5, r4
 8001204:	1c2c      	adds	r4, r5, #0
 8001206:	3d01      	subs	r5, #1
 8001208:	2c02      	cmp	r4, #2
 800120a:	d10e      	bne.n	800122a <HAL_GPIO_Init+0x4e>
 800120c:	08dc      	lsrs	r4, r3, #3
 800120e:	00a4      	lsls	r4, r4, #2
 8001210:	2507      	movs	r5, #7
 8001212:	1904      	adds	r4, r0, r4
 8001214:	401d      	ands	r5, r3
 8001216:	6a26      	ldr	r6, [r4, #32]
 8001218:	00ad      	lsls	r5, r5, #2
 800121a:	270f      	movs	r7, #15
 800121c:	40af      	lsls	r7, r5
 800121e:	43be      	bics	r6, r7
 8001220:	690f      	ldr	r7, [r1, #16]
 8001222:	40af      	lsls	r7, r5
 8001224:	433e      	orrs	r6, r7
 8001226:	6226      	str	r6, [r4, #32]
 8001228:	e001      	b.n	800122e <HAL_GPIO_Init+0x52>
 800122a:	2d01      	cmp	r5, #1
 800122c:	d812      	bhi.n	8001254 <HAL_GPIO_Init+0x78>
 800122e:	6886      	ldr	r6, [r0, #8]
 8001230:	005c      	lsls	r4, r3, #1
 8001232:	2503      	movs	r5, #3
 8001234:	40a5      	lsls	r5, r4
 8001236:	43ae      	bics	r6, r5
 8001238:	68cd      	ldr	r5, [r1, #12]
 800123a:	40a5      	lsls	r5, r4
 800123c:	1c34      	adds	r4, r6, #0
 800123e:	432c      	orrs	r4, r5
 8001240:	6084      	str	r4, [r0, #8]
 8001242:	6844      	ldr	r4, [r0, #4]
 8001244:	2501      	movs	r5, #1
 8001246:	409d      	lsls	r5, r3
 8001248:	43ac      	bics	r4, r5
 800124a:	06d5      	lsls	r5, r2, #27
 800124c:	0fed      	lsrs	r5, r5, #31
 800124e:	409d      	lsls	r5, r3
 8001250:	432c      	orrs	r4, r5
 8001252:	6044      	str	r4, [r0, #4]
 8001254:	2403      	movs	r4, #3
 8001256:	005d      	lsls	r5, r3, #1
 8001258:	1c26      	adds	r6, r4, #0
 800125a:	6807      	ldr	r7, [r0, #0]
 800125c:	40ae      	lsls	r6, r5
 800125e:	43f6      	mvns	r6, r6
 8001260:	9600      	str	r6, [sp, #0]
 8001262:	403e      	ands	r6, r7
 8001264:	1c17      	adds	r7, r2, #0
 8001266:	4027      	ands	r7, r4
 8001268:	40af      	lsls	r7, r5
 800126a:	4337      	orrs	r7, r6
 800126c:	6007      	str	r7, [r0, #0]
 800126e:	68c7      	ldr	r7, [r0, #12]
 8001270:	9e00      	ldr	r6, [sp, #0]
 8001272:	403e      	ands	r6, r7
 8001274:	688f      	ldr	r7, [r1, #8]
 8001276:	40af      	lsls	r7, r5
 8001278:	433e      	orrs	r6, r7
 800127a:	60c6      	str	r6, [r0, #12]
 800127c:	00d5      	lsls	r5, r2, #3
 800127e:	d54c      	bpl.n	800131a <HAL_GPIO_Init+0x13e>
 8001280:	4d28      	ldr	r5, [pc, #160]	; (8001324 <HAL_GPIO_Init+0x148>)
 8001282:	2601      	movs	r6, #1
 8001284:	6b6f      	ldr	r7, [r5, #52]	; 0x34
 8001286:	401c      	ands	r4, r3
 8001288:	4337      	orrs	r7, r6
 800128a:	636f      	str	r7, [r5, #52]	; 0x34
 800128c:	4f26      	ldr	r7, [pc, #152]	; (8001328 <HAL_GPIO_Init+0x14c>)
 800128e:	089d      	lsrs	r5, r3, #2
 8001290:	00ad      	lsls	r5, r5, #2
 8001292:	19ed      	adds	r5, r5, r7
 8001294:	68af      	ldr	r7, [r5, #8]
 8001296:	00a4      	lsls	r4, r4, #2
 8001298:	9402      	str	r4, [sp, #8]
 800129a:	9701      	str	r7, [sp, #4]
 800129c:	9f02      	ldr	r7, [sp, #8]
 800129e:	240f      	movs	r4, #15
 80012a0:	40bc      	lsls	r4, r7
 80012a2:	9f01      	ldr	r7, [sp, #4]
 80012a4:	43a7      	bics	r7, r4
 80012a6:	24a0      	movs	r4, #160	; 0xa0
 80012a8:	05e4      	lsls	r4, r4, #23
 80012aa:	42a0      	cmp	r0, r4
 80012ac:	d00b      	beq.n	80012c6 <HAL_GPIO_Init+0xea>
 80012ae:	4c1f      	ldr	r4, [pc, #124]	; (800132c <HAL_GPIO_Init+0x150>)
 80012b0:	42a0      	cmp	r0, r4
 80012b2:	d00b      	beq.n	80012cc <HAL_GPIO_Init+0xf0>
 80012b4:	4c1e      	ldr	r4, [pc, #120]	; (8001330 <HAL_GPIO_Init+0x154>)
 80012b6:	42a0      	cmp	r0, r4
 80012b8:	d007      	beq.n	80012ca <HAL_GPIO_Init+0xee>
 80012ba:	4c1e      	ldr	r4, [pc, #120]	; (8001334 <HAL_GPIO_Init+0x158>)
 80012bc:	1906      	adds	r6, r0, r4
 80012be:	1e74      	subs	r4, r6, #1
 80012c0:	41a6      	sbcs	r6, r4
 80012c2:	3605      	adds	r6, #5
 80012c4:	e002      	b.n	80012cc <HAL_GPIO_Init+0xf0>
 80012c6:	2600      	movs	r6, #0
 80012c8:	e000      	b.n	80012cc <HAL_GPIO_Init+0xf0>
 80012ca:	2602      	movs	r6, #2
 80012cc:	9c02      	ldr	r4, [sp, #8]
 80012ce:	40a6      	lsls	r6, r4
 80012d0:	4337      	orrs	r7, r6
 80012d2:	4c19      	ldr	r4, [pc, #100]	; (8001338 <HAL_GPIO_Init+0x15c>)
 80012d4:	60af      	str	r7, [r5, #8]
 80012d6:	4667      	mov	r7, ip
 80012d8:	6826      	ldr	r6, [r4, #0]
 80012da:	43fd      	mvns	r5, r7
 80012dc:	03d7      	lsls	r7, r2, #15
 80012de:	d401      	bmi.n	80012e4 <HAL_GPIO_Init+0x108>
 80012e0:	402e      	ands	r6, r5
 80012e2:	e001      	b.n	80012e8 <HAL_GPIO_Init+0x10c>
 80012e4:	4667      	mov	r7, ip
 80012e6:	433e      	orrs	r6, r7
 80012e8:	6026      	str	r6, [r4, #0]
 80012ea:	6866      	ldr	r6, [r4, #4]
 80012ec:	0397      	lsls	r7, r2, #14
 80012ee:	d401      	bmi.n	80012f4 <HAL_GPIO_Init+0x118>
 80012f0:	402e      	ands	r6, r5
 80012f2:	e001      	b.n	80012f8 <HAL_GPIO_Init+0x11c>
 80012f4:	4667      	mov	r7, ip
 80012f6:	433e      	orrs	r6, r7
 80012f8:	6066      	str	r6, [r4, #4]
 80012fa:	68a6      	ldr	r6, [r4, #8]
 80012fc:	02d7      	lsls	r7, r2, #11
 80012fe:	d401      	bmi.n	8001304 <HAL_GPIO_Init+0x128>
 8001300:	402e      	ands	r6, r5
 8001302:	e001      	b.n	8001308 <HAL_GPIO_Init+0x12c>
 8001304:	4667      	mov	r7, ip
 8001306:	433e      	orrs	r6, r7
 8001308:	60a6      	str	r6, [r4, #8]
 800130a:	68e6      	ldr	r6, [r4, #12]
 800130c:	0297      	lsls	r7, r2, #10
 800130e:	d401      	bmi.n	8001314 <HAL_GPIO_Init+0x138>
 8001310:	4035      	ands	r5, r6
 8001312:	e001      	b.n	8001318 <HAL_GPIO_Init+0x13c>
 8001314:	4665      	mov	r5, ip
 8001316:	4335      	orrs	r5, r6
 8001318:	60e5      	str	r5, [r4, #12]
 800131a:	3301      	adds	r3, #1
 800131c:	e763      	b.n	80011e6 <HAL_GPIO_Init+0xa>
 800131e:	b005      	add	sp, #20
 8001320:	bdf0      	pop	{r4, r5, r6, r7, pc}
 8001322:	46c0      	nop			; (mov r8, r8)
 8001324:	40021000 	.word	0x40021000
 8001328:	40010000 	.word	0x40010000
 800132c:	50000400 	.word	0x50000400
 8001330:	50000800 	.word	0x50000800
 8001334:	afffe400 	.word	0xafffe400
 8001338:	40010400 	.word	0x40010400

0800133c <HAL_NVIC_SetPriority>:
 800133c:	b570      	push	{r4, r5, r6, lr}
 800133e:	0189      	lsls	r1, r1, #6
 8001340:	2800      	cmp	r0, #0
 8001342:	da15      	bge.n	8001370 <HAL_NVIC_SetPriority+0x34>
 8001344:	b2c0      	uxtb	r0, r0
 8001346:	230f      	movs	r3, #15
 8001348:	4003      	ands	r3, r0
 800134a:	3b08      	subs	r3, #8
 800134c:	4a12      	ldr	r2, [pc, #72]	; (8001398 <HAL_NVIC_SetPriority+0x5c>)
 800134e:	089b      	lsrs	r3, r3, #2
 8001350:	009b      	lsls	r3, r3, #2
 8001352:	189b      	adds	r3, r3, r2
 8001354:	2203      	movs	r2, #3
 8001356:	4010      	ands	r0, r2
 8001358:	24ff      	movs	r4, #255	; 0xff
 800135a:	00c2      	lsls	r2, r0, #3
 800135c:	69dd      	ldr	r5, [r3, #28]
 800135e:	1c20      	adds	r0, r4, #0
 8001360:	4090      	lsls	r0, r2
 8001362:	4385      	bics	r5, r0
 8001364:	400c      	ands	r4, r1
 8001366:	4094      	lsls	r4, r2
 8001368:	1c2a      	adds	r2, r5, #0
 800136a:	4322      	orrs	r2, r4
 800136c:	61da      	str	r2, [r3, #28]
 800136e:	e012      	b.n	8001396 <HAL_NVIC_SetPriority+0x5a>
 8001370:	0882      	lsrs	r2, r0, #2
 8001372:	4b0a      	ldr	r3, [pc, #40]	; (800139c <HAL_NVIC_SetPriority+0x60>)
 8001374:	2403      	movs	r4, #3
 8001376:	0092      	lsls	r2, r2, #2
 8001378:	18d2      	adds	r2, r2, r3
 800137a:	4020      	ands	r0, r4
 800137c:	23c0      	movs	r3, #192	; 0xc0
 800137e:	40a0      	lsls	r0, r4
 8001380:	009b      	lsls	r3, r3, #2
 8001382:	24ff      	movs	r4, #255	; 0xff
 8001384:	58d5      	ldr	r5, [r2, r3]
 8001386:	1c26      	adds	r6, r4, #0
 8001388:	4086      	lsls	r6, r0
 800138a:	43b5      	bics	r5, r6
 800138c:	400c      	ands	r4, r1
 800138e:	4084      	lsls	r4, r0
 8001390:	1c28      	adds	r0, r5, #0
 8001392:	4320      	orrs	r0, r4
 8001394:	50d0      	str	r0, [r2, r3]
 8001396:	bd70      	pop	{r4, r5, r6, pc}
 8001398:	e000ed00 	.word	0xe000ed00
 800139c:	e000e100 	.word	0xe000e100

080013a0 <HAL_SYSTICK_Config>:
 80013a0:	4b09      	ldr	r3, [pc, #36]	; (80013c8 <HAL_SYSTICK_Config+0x28>)
 80013a2:	1e42      	subs	r2, r0, #1
 80013a4:	2001      	movs	r0, #1
 80013a6:	429a      	cmp	r2, r3
 80013a8:	d80d      	bhi.n	80013c6 <HAL_SYSTICK_Config+0x26>
 80013aa:	4b08      	ldr	r3, [pc, #32]	; (80013cc <HAL_SYSTICK_Config+0x2c>)
 80013ac:	21c0      	movs	r1, #192	; 0xc0
 80013ae:	605a      	str	r2, [r3, #4]
 80013b0:	4a07      	ldr	r2, [pc, #28]	; (80013d0 <HAL_SYSTICK_Config+0x30>)
 80013b2:	0609      	lsls	r1, r1, #24
 80013b4:	6a10      	ldr	r0, [r2, #32]
 80013b6:	0200      	lsls	r0, r0, #8
 80013b8:	0a00      	lsrs	r0, r0, #8
 80013ba:	4301      	orrs	r1, r0
 80013bc:	6211      	str	r1, [r2, #32]
 80013be:	2000      	movs	r0, #0
 80013c0:	2207      	movs	r2, #7
 80013c2:	6098      	str	r0, [r3, #8]
 80013c4:	601a      	str	r2, [r3, #0]
 80013c6:	4770      	bx	lr
 80013c8:	00ffffff 	.word	0x00ffffff
 80013cc:	e000e010 	.word	0xe000e010
 80013d0:	e000ed00 	.word	0xe000ed00

080013d4 <__gnu_thumb1_case_uqi>:
 80013d4:	b402      	push	{r1}
 80013d6:	4671      	mov	r1, lr
 80013d8:	0849      	lsrs	r1, r1, #1
 80013da:	0049      	lsls	r1, r1, #1
 80013dc:	5c09      	ldrb	r1, [r1, r0]
 80013de:	0049      	lsls	r1, r1, #1
 80013e0:	448e      	add	lr, r1
 80013e2:	bc02      	pop	{r1}
 80013e4:	4770      	bx	lr
 80013e6:	46c0      	nop			; (mov r8, r8)

080013e8 <__aeabi_uidiv>:
 80013e8:	2900      	cmp	r1, #0
 80013ea:	d034      	beq.n	8001456 <.udivsi3_skip_div0_test+0x6a>

080013ec <.udivsi3_skip_div0_test>:
 80013ec:	2301      	movs	r3, #1
 80013ee:	2200      	movs	r2, #0
 80013f0:	b410      	push	{r4}
 80013f2:	4288      	cmp	r0, r1
 80013f4:	d32c      	bcc.n	8001450 <.udivsi3_skip_div0_test+0x64>
 80013f6:	2401      	movs	r4, #1
 80013f8:	0724      	lsls	r4, r4, #28
 80013fa:	42a1      	cmp	r1, r4
 80013fc:	d204      	bcs.n	8001408 <.udivsi3_skip_div0_test+0x1c>
 80013fe:	4281      	cmp	r1, r0
 8001400:	d202      	bcs.n	8001408 <.udivsi3_skip_div0_test+0x1c>
 8001402:	0109      	lsls	r1, r1, #4
 8001404:	011b      	lsls	r3, r3, #4
 8001406:	e7f8      	b.n	80013fa <.udivsi3_skip_div0_test+0xe>
 8001408:	00e4      	lsls	r4, r4, #3
 800140a:	42a1      	cmp	r1, r4
 800140c:	d204      	bcs.n	8001418 <.udivsi3_skip_div0_test+0x2c>
 800140e:	4281      	cmp	r1, r0
 8001410:	d202      	bcs.n	8001418 <.udivsi3_skip_div0_test+0x2c>
 8001412:	0049      	lsls	r1, r1, #1
 8001414:	005b      	lsls	r3, r3, #1
 8001416:	e7f8      	b.n	800140a <.udivsi3_skip_div0_test+0x1e>
 8001418:	4288      	cmp	r0, r1
 800141a:	d301      	bcc.n	8001420 <.udivsi3_skip_div0_test+0x34>
 800141c:	1a40      	subs	r0, r0, r1
 800141e:	431a      	orrs	r2, r3
 8001420:	084c      	lsrs	r4, r1, #1
 8001422:	42a0      	cmp	r0, r4
 8001424:	d302      	bcc.n	800142c <.udivsi3_skip_div0_test+0x40>
 8001426:	1b00      	subs	r0, r0, r4
 8001428:	085c      	lsrs	r4, r3, #1
 800142a:	4322      	orrs	r2, r4
 800142c:	088c      	lsrs	r4, r1, #2
 800142e:	42a0      	cmp	r0, r4
 8001430:	d302      	bcc.n	8001438 <.udivsi3_skip_div0_test+0x4c>
 8001432:	1b00      	subs	r0, r0, r4
 8001434:	089c      	lsrs	r4, r3, #2
 8001436:	4322      	orrs	r2, r4
 8001438:	08cc      	lsrs	r4, r1, #3
 800143a:	42a0      	cmp	r0, r4
 800143c:	d302      	bcc.n	8001444 <.udivsi3_skip_div0_test+0x58>
 800143e:	1b00      	subs	r0, r0, r4
 8001440:	08dc      	lsrs	r4, r3, #3
 8001442:	4322      	orrs	r2, r4
 8001444:	2800      	cmp	r0, #0
 8001446:	d003      	beq.n	8001450 <.udivsi3_skip_div0_test+0x64>
 8001448:	091b      	lsrs	r3, r3, #4
 800144a:	d001      	beq.n	8001450 <.udivsi3_skip_div0_test+0x64>
 800144c:	0909      	lsrs	r1, r1, #4
 800144e:	e7e3      	b.n	8001418 <.udivsi3_skip_div0_test+0x2c>
 8001450:	1c10      	adds	r0, r2, #0
 8001452:	bc10      	pop	{r4}
 8001454:	4770      	bx	lr
 8001456:	2800      	cmp	r0, #0
 8001458:	d001      	beq.n	800145e <.udivsi3_skip_div0_test+0x72>
 800145a:	2000      	movs	r0, #0
 800145c:	43c0      	mvns	r0, r0
 800145e:	b407      	push	{r0, r1, r2}
 8001460:	4802      	ldr	r0, [pc, #8]	; (800146c <.udivsi3_skip_div0_test+0x80>)
 8001462:	a102      	add	r1, pc, #8	; (adr r1, 800146c <.udivsi3_skip_div0_test+0x80>)
 8001464:	1840      	adds	r0, r0, r1
 8001466:	9002      	str	r0, [sp, #8]
 8001468:	bd03      	pop	{r0, r1, pc}
 800146a:	46c0      	nop			; (mov r8, r8)
 800146c:	000000d9 	.word	0x000000d9

08001470 <__aeabi_uidivmod>:
 8001470:	2900      	cmp	r1, #0
 8001472:	d0f0      	beq.n	8001456 <.udivsi3_skip_div0_test+0x6a>
 8001474:	b503      	push	{r0, r1, lr}
 8001476:	f7ff ffb9 	bl	80013ec <.udivsi3_skip_div0_test>
 800147a:	bc0e      	pop	{r1, r2, r3}
 800147c:	4342      	muls	r2, r0
 800147e:	1a89      	subs	r1, r1, r2
 8001480:	4718      	bx	r3
 8001482:	46c0      	nop			; (mov r8, r8)

08001484 <__aeabi_idiv>:
 8001484:	2900      	cmp	r1, #0
 8001486:	d041      	beq.n	800150c <.divsi3_skip_div0_test+0x84>

08001488 <.divsi3_skip_div0_test>:
 8001488:	b410      	push	{r4}
 800148a:	1c04      	adds	r4, r0, #0
 800148c:	404c      	eors	r4, r1
 800148e:	46a4      	mov	ip, r4
 8001490:	2301      	movs	r3, #1
 8001492:	2200      	movs	r2, #0
 8001494:	2900      	cmp	r1, #0
 8001496:	d500      	bpl.n	800149a <.divsi3_skip_div0_test+0x12>
 8001498:	4249      	negs	r1, r1
 800149a:	2800      	cmp	r0, #0
 800149c:	d500      	bpl.n	80014a0 <.divsi3_skip_div0_test+0x18>
 800149e:	4240      	negs	r0, r0
 80014a0:	4288      	cmp	r0, r1
 80014a2:	d32c      	bcc.n	80014fe <.divsi3_skip_div0_test+0x76>
 80014a4:	2401      	movs	r4, #1
 80014a6:	0724      	lsls	r4, r4, #28
 80014a8:	42a1      	cmp	r1, r4
 80014aa:	d204      	bcs.n	80014b6 <.divsi3_skip_div0_test+0x2e>
 80014ac:	4281      	cmp	r1, r0
 80014ae:	d202      	bcs.n	80014b6 <.divsi3_skip_div0_test+0x2e>
 80014b0:	0109      	lsls	r1, r1, #4
 80014b2:	011b      	lsls	r3, r3, #4
 80014b4:	e7f8      	b.n	80014a8 <.divsi3_skip_div0_test+0x20>
 80014b6:	00e4      	lsls	r4, r4, #3
 80014b8:	42a1      	cmp	r1, r4
 80014ba:	d204      	bcs.n	80014c6 <.divsi3_skip_div0_test+0x3e>
 80014bc:	4281      	cmp	r1, r0
 80014be:	d202      	bcs.n	80014c6 <.divsi3_skip_div0_test+0x3e>
 80014c0:	0049      	lsls	r1, r1, #1
 80014c2:	005b      	lsls	r3, r3, #1
 80014c4:	e7f8      	b.n	80014b8 <.divsi3_skip_div0_test+0x30>
 80014c6:	4288      	cmp	r0, r1
 80014c8:	d301      	bcc.n	80014ce <.divsi3_skip_div0_test+0x46>
 80014ca:	1a40      	subs	r0, r0, r1
 80014cc:	431a      	orrs	r2, r3
 80014ce:	084c      	lsrs	r4, r1, #1
 80014d0:	42a0      	cmp	r0, r4
 80014d2:	d302      	bcc.n	80014da <.divsi3_skip_div0_test+0x52>
 80014d4:	1b00      	subs	r0, r0, r4
 80014d6:	085c      	lsrs	r4, r3, #1
 80014d8:	4322      	orrs	r2, r4
 80014da:	088c      	lsrs	r4, r1, #2
 80014dc:	42a0      	cmp	r0, r4
 80014de:	d302      	bcc.n	80014e6 <.divsi3_skip_div0_test+0x5e>
 80014e0:	1b00      	subs	r0, r0, r4
 80014e2:	089c      	lsrs	r4, r3, #2
 80014e4:	4322      	orrs	r2, r4
 80014e6:	08cc      	lsrs	r4, r1, #3
 80014e8:	42a0      	cmp	r0, r4
 80014ea:	d302      	bcc.n	80014f2 <.divsi3_skip_div0_test+0x6a>
 80014ec:	1b00      	subs	r0, r0, r4
 80014ee:	08dc      	lsrs	r4, r3, #3
 80014f0:	4322      	orrs	r2, r4
 80014f2:	2800      	cmp	r0, #0
 80014f4:	d003      	beq.n	80014fe <.divsi3_skip_div0_test+0x76>
 80014f6:	091b      	lsrs	r3, r3, #4
 80014f8:	d001      	beq.n	80014fe <.divsi3_skip_div0_test+0x76>
 80014fa:	0909      	lsrs	r1, r1, #4
 80014fc:	e7e3      	b.n	80014c6 <.divsi3_skip_div0_test+0x3e>
 80014fe:	1c10      	adds	r0, r2, #0
 8001500:	4664      	mov	r4, ip
 8001502:	2c00      	cmp	r4, #0
 8001504:	d500      	bpl.n	8001508 <.divsi3_skip_div0_test+0x80>
 8001506:	4240      	negs	r0, r0
 8001508:	bc10      	pop	{r4}
 800150a:	4770      	bx	lr
 800150c:	2800      	cmp	r0, #0
 800150e:	d006      	beq.n	800151e <.divsi3_skip_div0_test+0x96>
 8001510:	db03      	blt.n	800151a <.divsi3_skip_div0_test+0x92>
 8001512:	2000      	movs	r0, #0
 8001514:	43c0      	mvns	r0, r0
 8001516:	0840      	lsrs	r0, r0, #1
 8001518:	e001      	b.n	800151e <.divsi3_skip_div0_test+0x96>
 800151a:	2080      	movs	r0, #128	; 0x80
 800151c:	0600      	lsls	r0, r0, #24
 800151e:	b407      	push	{r0, r1, r2}
 8001520:	4802      	ldr	r0, [pc, #8]	; (800152c <.divsi3_skip_div0_test+0xa4>)
 8001522:	a102      	add	r1, pc, #8	; (adr r1, 800152c <.divsi3_skip_div0_test+0xa4>)
 8001524:	1840      	adds	r0, r0, r1
 8001526:	9002      	str	r0, [sp, #8]
 8001528:	bd03      	pop	{r0, r1, pc}
 800152a:	46c0      	nop			; (mov r8, r8)
 800152c:	00000019 	.word	0x00000019

08001530 <__aeabi_idivmod>:
 8001530:	2900      	cmp	r1, #0
 8001532:	d0eb      	beq.n	800150c <.divsi3_skip_div0_test+0x84>
 8001534:	b503      	push	{r0, r1, lr}
 8001536:	f7ff ffa7 	bl	8001488 <.divsi3_skip_div0_test>
 800153a:	bc0e      	pop	{r1, r2, r3}
 800153c:	4342      	muls	r2, r0
 800153e:	1a89      	subs	r1, r1, r2
 8001540:	4718      	bx	r3
 8001542:	46c0      	nop			; (mov r8, r8)

08001544 <__aeabi_idiv0>:
 8001544:	4770      	bx	lr
 8001546:	46c0      	nop			; (mov r8, r8)

08001548 <memset>:
 8001548:	b5f0      	push	{r4, r5, r6, r7, lr}
 800154a:	0783      	lsls	r3, r0, #30
 800154c:	d046      	beq.n	80015dc <memset+0x94>
 800154e:	1e54      	subs	r4, r2, #1
 8001550:	2a00      	cmp	r2, #0
 8001552:	d042      	beq.n	80015da <memset+0x92>
 8001554:	b2ce      	uxtb	r6, r1
 8001556:	1c03      	adds	r3, r0, #0
 8001558:	2503      	movs	r5, #3
 800155a:	e003      	b.n	8001564 <memset+0x1c>
 800155c:	1e62      	subs	r2, r4, #1
 800155e:	2c00      	cmp	r4, #0
 8001560:	d03b      	beq.n	80015da <memset+0x92>
 8001562:	1c14      	adds	r4, r2, #0
 8001564:	3301      	adds	r3, #1
 8001566:	1e5a      	subs	r2, r3, #1
 8001568:	7016      	strb	r6, [r2, #0]
 800156a:	422b      	tst	r3, r5
 800156c:	d1f6      	bne.n	800155c <memset+0x14>
 800156e:	2c03      	cmp	r4, #3
 8001570:	d92b      	bls.n	80015ca <memset+0x82>
 8001572:	25ff      	movs	r5, #255	; 0xff
 8001574:	400d      	ands	r5, r1
 8001576:	022a      	lsls	r2, r5, #8
 8001578:	4315      	orrs	r5, r2
 800157a:	042a      	lsls	r2, r5, #16
 800157c:	4315      	orrs	r5, r2
 800157e:	2c0f      	cmp	r4, #15
 8001580:	d915      	bls.n	80015ae <memset+0x66>
 8001582:	1c27      	adds	r7, r4, #0
 8001584:	3f10      	subs	r7, #16
 8001586:	093f      	lsrs	r7, r7, #4
 8001588:	1c1e      	adds	r6, r3, #0
 800158a:	013a      	lsls	r2, r7, #4
 800158c:	3610      	adds	r6, #16
 800158e:	18b6      	adds	r6, r6, r2
 8001590:	1c1a      	adds	r2, r3, #0
 8001592:	6015      	str	r5, [r2, #0]
 8001594:	6055      	str	r5, [r2, #4]
 8001596:	6095      	str	r5, [r2, #8]
 8001598:	60d5      	str	r5, [r2, #12]
 800159a:	3210      	adds	r2, #16
 800159c:	42b2      	cmp	r2, r6
 800159e:	d1f8      	bne.n	8001592 <memset+0x4a>
 80015a0:	3701      	adds	r7, #1
 80015a2:	013f      	lsls	r7, r7, #4
 80015a4:	220f      	movs	r2, #15
 80015a6:	19db      	adds	r3, r3, r7
 80015a8:	4014      	ands	r4, r2
 80015aa:	2c03      	cmp	r4, #3
 80015ac:	d90d      	bls.n	80015ca <memset+0x82>
 80015ae:	1f27      	subs	r7, r4, #4
 80015b0:	08bf      	lsrs	r7, r7, #2
 80015b2:	00ba      	lsls	r2, r7, #2
 80015b4:	1d1e      	adds	r6, r3, #4
 80015b6:	18b6      	adds	r6, r6, r2
 80015b8:	1c1a      	adds	r2, r3, #0
 80015ba:	c220      	stmia	r2!, {r5}
 80015bc:	42b2      	cmp	r2, r6
 80015be:	d1fc      	bne.n	80015ba <memset+0x72>
 80015c0:	3701      	adds	r7, #1
 80015c2:	00bf      	lsls	r7, r7, #2
 80015c4:	2203      	movs	r2, #3
 80015c6:	19db      	adds	r3, r3, r7
 80015c8:	4014      	ands	r4, r2
 80015ca:	2c00      	cmp	r4, #0
 80015cc:	d005      	beq.n	80015da <memset+0x92>
 80015ce:	191c      	adds	r4, r3, r4
 80015d0:	b2c9      	uxtb	r1, r1
 80015d2:	7019      	strb	r1, [r3, #0]
 80015d4:	3301      	adds	r3, #1
 80015d6:	42a3      	cmp	r3, r4
 80015d8:	d1fb      	bne.n	80015d2 <memset+0x8a>
 80015da:	bdf0      	pop	{r4, r5, r6, r7, pc}
 80015dc:	1c14      	adds	r4, r2, #0
 80015de:	1c03      	adds	r3, r0, #0
 80015e0:	e7c5      	b.n	800156e <memset+0x26>
 80015e2:	46c0      	nop			; (mov r8, r8)

080015e4 <_init>:
 80015e4:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
 80015e6:	46c0      	nop			; (mov r8, r8)
 80015e8:	bcf8      	pop	{r3, r4, r5, r6, r7}
 80015ea:	bc08      	pop	{r3}
 80015ec:	469e      	mov	lr, r3
 80015ee:	4770      	bx	lr

080015f0 <_fini>:
 80015f0:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
 80015f2:	46c0      	nop			; (mov r8, r8)
 80015f4:	bcf8      	pop	{r3, r4, r5, r6, r7}
 80015f6:	bc08      	pop	{r3}
 80015f8:	469e      	mov	lr, r3
 80015fa:	4770      	bx	lr
 80015fc:	746f6f62 	.word	0x746f6f62
 8001600:	20676e69 	.word	0x20676e69
 8001604:	6d6f7266 	.word	0x6d6f7266
 8001608:	0a752520 	.word	0x0a752520
 800160c:	6d617200 	.word	0x6d617200
 8001610:	61747320 	.word	0x61747320
 8001614:	25207472 	.word	0x25207472
 8001618:	000a2075 	.word	0x000a2075
 800161c:	206d6172 	.word	0x206d6172
 8001620:	657a6973 	.word	0x657a6973
 8001624:	20752520 	.word	0x20752520
 8001628:	6172000a 	.word	0x6172000a
 800162c:	7266206d 	.word	0x7266206d
 8001630:	25206565 	.word	0x25206565
 8001634:	000a2075 	.word	0x000a2075
 8001638:	70616568 	.word	0x70616568
 800163c:	61747320 	.word	0x61747320
 8001640:	25207472 	.word	0x25207472
 8001644:	000a2075 	.word	0x000a2075
 8001648:	0a0a      	.short	0x0a0a
 800164a:	00          	.byte	0x00
 800164b:	73          	.byte	0x73
 800164c:	6f696474 	.word	0x6f696474
 8001650:	696e6920 	.word	0x696e6920
 8001654:	6f642074 	.word	0x6f642074
 8001658:	000a656e 	.word	0x000a656e
 800165c:	6c65770a 	.word	0x6c65770a
 8001660:	656d6f63 	.word	0x656d6f63
 8001664:	206f7420 	.word	0x206f7420
 8001668:	757a7553 	.word	0x757a7553
 800166c:	534f6168 	.word	0x534f6168
 8001670:	5e5f5e20 	.word	0x5e5f5e20
 8001674:	322e3220 	.word	0x322e3220
 8001678:	420a302e 	.word	0x420a302e
 800167c:	444c4955 	.word	0x444c4955
 8001680:	62654620 	.word	0x62654620
 8001684:	20373120 	.word	0x20373120
 8001688:	36313032 	.word	0x36313032
 800168c:	3a383020 	.word	0x3a383020
 8001690:	303a3430 	.word	0x303a3430
 8001694:	25000a38 	.word	0x25000a38
 8001698:	203a2075 	.word	0x203a2075
 800169c:	0a206925 	.word	0x0a206925
	...

080016a1 <PLLMulTable>:
 80016a1:	08060403 2018100c 00000030                       ....... 0

080016aa <APBAHBPrescTable>:
 80016aa:	00000000 04030201 04030201 09080706     ................
	...

080016bc <__EH_FRAME_BEGIN__>:
 80016bc:	00000000                                ....
