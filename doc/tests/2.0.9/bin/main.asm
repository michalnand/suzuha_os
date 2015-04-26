
bin/main.elf:     file format elf32-littlearm


Disassembly of section .text:

00000000 <InterruptVector>:
   0:	00 80 00 20 51 11 00 00 41 11 00 00 4d 11 00 00     ... Q...A...M...
  10:	41 11 00 00 41 11 00 00 41 11 00 00 00 00 00 00     A...A...A.......
	...
  2c:	41 11 00 00 41 11 00 00 41 11 00 00 41 11 00 00     A...A...A...A...
  3c:	b5 05 00 00 41 11 00 00 41 11 00 00 41 11 00 00     ....A...A...A...
  4c:	41 11 00 00 41 11 00 00 41 11 00 00 41 11 00 00     A...A...A...A...
  5c:	41 11 00 00 41 11 00 00 41 11 00 00 41 11 00 00     A...A...A...A...
  6c:	41 11 00 00 41 11 00 00 41 11 00 00 41 11 00 00     A...A...A...A...
  7c:	41 11 00 00 41 11 00 00 41 11 00 00 41 11 00 00     A...A...A...A...
  8c:	d9 0e 00 00 41 11 00 00 41 11 00 00 41 11 00 00     ....A...A...A...
  9c:	41 11 00 00 41 11 00 00 41 11 00 00 41 11 00 00     A...A...A...A...
  ac:	41 11 00 00 41 11 00 00 41 11 00 00 41 11 00 00     A...A...A...A...
  bc:	41 11 00 00 41 11 00 00 41 11 00 00 41 11 00 00     A...A...A...A...
  cc:	41 11 00 00 41 11 00 00 41 11 00 00 41 11 00 00     A...A...A...A...
  dc:	41 11 00 00 41 11 00 00 41 11 00 00 41 11 00 00     A...A...A...A...
  ec:	41 11 00 00 41 11 00 00 41 11 00 00 41 11 00 00     A...A...A...A...
  fc:	41 11 00 00 41 11 00 00 41 11 00 00 41 11 00 00     A...A...A...A...
 10c:	41 11 00 00 41 11 00 00 41 11 00 00 41 11 00 00     A...A...A...A...
 11c:	41 11 00 00 41 11 00 00 41 11 00 00 41 11 00 00     A...A...A...A...
 12c:	41 11 00 00 41 11 00 00 41 11 00 00 41 11 00 00     A...A...A...A...
 13c:	41 11 00 00 00 00 00 00 00 00 00 00 00 00 00 00     A...............
 14c:	00 00 00 00 41 11 00 00 41 11 00 00 41 11 00 00     ....A...A...A...
 15c:	41 11 00 00 00 00 00 00 00 00 00 00 00 00 00 00     A...............
	...
 1b0:	41 11 00 00 41 11 00 00 41 11 00 00 41 11 00 00     A...A...A...A...
 1c0:	41 11 00 00 41 11 00 00 41 11 00 00 41 11 00 00     A...A...A...A...
 1d0:	41 11 00 00 41 11 00 00 41 11 00 00 41 11 00 00     A...A...A...A...
 1e0:	41 11 00 00 41 11 00 00 41 11 00 00 41 11 00 00     A...A...A...A...
 1f0:	41 11 00 00 41 11 00 00 41 11 00 00 41 11 00 00     A...A...A...A...
 200:	41 11 00 00 41 11 00 00 41 11 00 00 00 00 00 00     A...A...A.......
 210:	41 11 00 00 41 11 00 00 41 11 00 00 41 11 00 00     A...A...A...A...
 220:	41 11 00 00 41 11 00 00 41 11 00 00 41 11 00 00     A...A...A...A...
 230:	41 11 00 00 41 11 00 00 41 11 00 00 41 11 00 00     A...A...A...A...
 240:	41 11 00 00 41 11 00 00 41 11 00 00 41 11 00 00     A...A...A...A...
 250:	41 11 00 00 41 11 00 00 41 11 00 00 41 11 00 00     A...A...A...A...
 260:	41 11 00 00 41 11 00 00 41 11 00 00                 A...A...A...

Disassembly of section .text.thread_ending:

00000528 <thread_ending>:
 528:	b672      	cpsid	i
 52a:	4b05      	ldr	r3, [pc, #20]	; (540 <thread_ending+0x18>)
 52c:	4a05      	ldr	r2, [pc, #20]	; (544 <thread_ending+0x1c>)
 52e:	681b      	ldr	r3, [r3, #0]
 530:	210c      	movs	r1, #12
 532:	fb01 2303 	mla	r3, r1, r3, r2
 536:	2200      	movs	r2, #0
 538:	605a      	str	r2, [r3, #4]
 53a:	b662      	cpsie	i
 53c:	bf00      	nop
 53e:	e7fd      	b.n	53c <thread_ending+0x14>
 540:	20000060 	.word	0x20000060
 544:	20000000 	.word	0x20000000

Disassembly of section .text.null_thread:

00000548 <null_thread>:
 548:	b508      	push	{r3, lr}
 54a:	f000 fdf7 	bl	113c <sleep>
 54e:	e7fc      	b.n	54a <null_thread+0x2>

Disassembly of section .text.scheduler:

00000550 <scheduler>:
 550:	b570      	push	{r4, r5, r6, lr}
 552:	2200      	movs	r2, #0
 554:	4611      	mov	r1, r2
 556:	4b15      	ldr	r3, [pc, #84]	; (5ac <scheduler+0x5c>)
 558:	200c      	movs	r0, #12
 55a:	fb00 f501 	mul.w	r5, r0, r1
 55e:	195e      	adds	r6, r3, r5
 560:	6874      	ldr	r4, [r6, #4]
 562:	f014 0f02 	tst.w	r4, #2
 566:	461c      	mov	r4, r3
 568:	d10a      	bne.n	580 <scheduler+0x30>
 56a:	6876      	ldr	r6, [r6, #4]
 56c:	07f6      	lsls	r6, r6, #31
 56e:	d507      	bpl.n	580 <scheduler+0x30>
 570:	4350      	muls	r0, r2
 572:	5b5d      	ldrh	r5, [r3, r5]
 574:	5a18      	ldrh	r0, [r3, r0]
 576:	b2ad      	uxth	r5, r5
 578:	b280      	uxth	r0, r0
 57a:	4285      	cmp	r5, r0
 57c:	bf38      	it	cc
 57e:	460a      	movcc	r2, r1
 580:	200c      	movs	r0, #12
 582:	4348      	muls	r0, r1
 584:	5a1d      	ldrh	r5, [r3, r0]
 586:	b2ad      	uxth	r5, r5
 588:	b125      	cbz	r5, 594 <scheduler+0x44>
 58a:	5a1d      	ldrh	r5, [r3, r0]
 58c:	b2ad      	uxth	r5, r5
 58e:	3d01      	subs	r5, #1
 590:	b2ad      	uxth	r5, r5
 592:	521d      	strh	r5, [r3, r0]
 594:	3101      	adds	r1, #1
 596:	2908      	cmp	r1, #8
 598:	d1dd      	bne.n	556 <scheduler+0x6>
 59a:	230c      	movs	r3, #12
 59c:	4353      	muls	r3, r2
 59e:	18e1      	adds	r1, r4, r3
 5a0:	8849      	ldrh	r1, [r1, #2]
 5a2:	b289      	uxth	r1, r1
 5a4:	52e1      	strh	r1, [r4, r3]
 5a6:	4b02      	ldr	r3, [pc, #8]	; (5b0 <scheduler+0x60>)
 5a8:	601a      	str	r2, [r3, #0]
 5aa:	bd70      	pop	{r4, r5, r6, pc}
 5ac:	20000000 	.word	0x20000000
 5b0:	20000060 	.word	0x20000060

Disassembly of section .text.SysTick_Handler:

000005b4 <SysTick_Handler>:
 5b4:	e92d 0ff0 	stmdb	sp!, {r4, r5, r6, r7, r8, r9, sl, fp}
 5b8:	4c0e      	ldr	r4, [pc, #56]	; (5f4 <SysTick_Handler+0x40>)
 5ba:	4d0f      	ldr	r5, [pc, #60]	; (5f8 <SysTick_Handler+0x44>)
 5bc:	f000 fdba 	bl	1134 <__get_MSP>
 5c0:	6823      	ldr	r3, [r4, #0]
 5c2:	3301      	adds	r3, #1
 5c4:	d005      	beq.n	5d2 <SysTick_Handler+0x1e>
 5c6:	6823      	ldr	r3, [r4, #0]
 5c8:	220c      	movs	r2, #12
 5ca:	fb02 5303 	mla	r3, r2, r3, r5
 5ce:	6098      	str	r0, [r3, #8]
 5d0:	e001      	b.n	5d6 <SysTick_Handler+0x22>
 5d2:	2300      	movs	r3, #0
 5d4:	6023      	str	r3, [r4, #0]
 5d6:	f7ff ffbb 	bl	550 <scheduler>
 5da:	6823      	ldr	r3, [r4, #0]
 5dc:	220c      	movs	r2, #12
 5de:	fb02 5503 	mla	r5, r2, r3, r5
 5e2:	f06f 0306 	mvn.w	r3, #6
 5e6:	68aa      	ldr	r2, [r5, #8]
 5e8:	469e      	mov	lr, r3
 5ea:	f382 8808 	msr	MSP, r2
 5ee:	e8bd 0ff0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, sl, fp}
 5f2:	4770      	bx	lr
 5f4:	20000060 	.word	0x20000060
 5f8:	20000000 	.word	0x20000000

Disassembly of section .text.sched_off:

000005fc <sched_off>:
 5fc:	b672      	cpsid	i
 5fe:	4770      	bx	lr

Disassembly of section .text.sched_on:

00000600 <sched_on>:
 600:	b662      	cpsie	i
 602:	4770      	bx	lr

Disassembly of section .text.yield:

00000604 <yield>:
 604:	bf00      	nop
 606:	4770      	bx	lr

Disassembly of section .text.get_thread_id:

00000608 <get_thread_id>:
 608:	b082      	sub	sp, #8
 60a:	b672      	cpsid	i
 60c:	4b03      	ldr	r3, [pc, #12]	; (61c <get_thread_id+0x14>)
 60e:	681b      	ldr	r3, [r3, #0]
 610:	9301      	str	r3, [sp, #4]
 612:	b662      	cpsie	i
 614:	9801      	ldr	r0, [sp, #4]
 616:	b002      	add	sp, #8
 618:	4770      	bx	lr
 61a:	bf00      	nop
 61c:	20000060 	.word	0x20000060

Disassembly of section .text.kernel_start:

00000620 <kernel_start>:
 620:	b508      	push	{r3, lr}
 622:	f000 fd71 	bl	1108 <sys_tick_init>
 626:	bf00      	nop
 628:	e7fd      	b.n	626 <kernel_start+0x6>

Disassembly of section .text.create_thread:

0000062c <create_thread>:
 62c:	f022 0203 	bic.w	r2, r2, #3
 630:	3a40      	subs	r2, #64	; 0x40
 632:	e92d 43f0 	stmdb	sp!, {r4, r5, r6, r7, r8, r9, lr}
 636:	eb01 0c02 	add.w	ip, r1, r2
 63a:	f102 0834 	add.w	r8, r2, #52	; 0x34
 63e:	f102 0938 	add.w	r9, r2, #56	; 0x38
 642:	323c      	adds	r2, #60	; 0x3c
 644:	4488      	add	r8, r1
 646:	4489      	add	r9, r1
 648:	4607      	mov	r7, r0
 64a:	4411      	add	r1, r2
 64c:	2200      	movs	r2, #0
 64e:	b672      	cpsid	i
 650:	4e11      	ldr	r6, [pc, #68]	; (698 <create_thread+0x6c>)
 652:	250c      	movs	r5, #12
 654:	4355      	muls	r5, r2
 656:	1974      	adds	r4, r6, r5
 658:	6860      	ldr	r0, [r4, #4]
 65a:	07c0      	lsls	r0, r0, #31
 65c:	d412      	bmi.n	684 <create_thread+0x58>
 65e:	480f      	ldr	r0, [pc, #60]	; (69c <create_thread+0x70>)
 660:	f8c4 c008 	str.w	ip, [r4, #8]
 664:	f8c8 0000 	str.w	r0, [r8]
 668:	f04f 5004 	mov.w	r0, #553648128	; 0x21000000
 66c:	f8c9 7000 	str.w	r7, [r9]
 670:	2b07      	cmp	r3, #7
 672:	bf98      	it	ls
 674:	2308      	movls	r3, #8
 676:	6008      	str	r0, [r1, #0]
 678:	2001      	movs	r0, #1
 67a:	8063      	strh	r3, [r4, #2]
 67c:	5373      	strh	r3, [r6, r5]
 67e:	6060      	str	r0, [r4, #4]
 680:	4610      	mov	r0, r2
 682:	e000      	b.n	686 <create_thread+0x5a>
 684:	2008      	movs	r0, #8
 686:	b662      	cpsie	i
 688:	3201      	adds	r2, #1
 68a:	2a08      	cmp	r2, #8
 68c:	d001      	beq.n	692 <create_thread+0x66>
 68e:	2808      	cmp	r0, #8
 690:	d0dd      	beq.n	64e <create_thread+0x22>
 692:	e8bd 83f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, pc}
 696:	bf00      	nop
 698:	20000000 	.word	0x20000000
 69c:	00000529 	.word	0x00000529

Disassembly of section .text.kernel_init:

000006a0 <kernel_init>:
 6a0:	b510      	push	{r4, lr}
 6a2:	2300      	movs	r3, #0
 6a4:	490b      	ldr	r1, [pc, #44]	; (6d4 <kernel_init+0x34>)
 6a6:	220c      	movs	r2, #12
 6a8:	435a      	muls	r2, r3
 6aa:	188c      	adds	r4, r1, r2
 6ac:	2000      	movs	r0, #0
 6ae:	6060      	str	r0, [r4, #4]
 6b0:	3301      	adds	r3, #1
 6b2:	2008      	movs	r0, #8
 6b4:	4283      	cmp	r3, r0
 6b6:	8060      	strh	r0, [r4, #2]
 6b8:	5288      	strh	r0, [r1, r2]
 6ba:	d1f3      	bne.n	6a4 <kernel_init+0x4>
 6bc:	4b06      	ldr	r3, [pc, #24]	; (6d8 <kernel_init+0x38>)
 6be:	4807      	ldr	r0, [pc, #28]	; (6dc <kernel_init+0x3c>)
 6c0:	4907      	ldr	r1, [pc, #28]	; (6e0 <kernel_init+0x40>)
 6c2:	f04f 32ff 	mov.w	r2, #4294967295
 6c6:	601a      	str	r2, [r3, #0]
 6c8:	e8bd 4010 	ldmia.w	sp!, {r4, lr}
 6cc:	2280      	movs	r2, #128	; 0x80
 6ce:	23ff      	movs	r3, #255	; 0xff
 6d0:	f7ff bfac 	b.w	62c <create_thread>
 6d4:	20000000 	.word	0x20000000
 6d8:	20000060 	.word	0x20000060
 6dc:	00000549 	.word	0x00000549
 6e0:	200004e4 	.word	0x200004e4

Disassembly of section .text.set_wait_state:

000006e4 <set_wait_state>:
 6e4:	b507      	push	{r0, r1, r2, lr}
 6e6:	f7ff ff8f 	bl	608 <get_thread_id>
 6ea:	9000      	str	r0, [sp, #0]
 6ec:	b672      	cpsid	i
 6ee:	4b0d      	ldr	r3, [pc, #52]	; (724 <set_wait_state+0x40>)
 6f0:	9a00      	ldr	r2, [sp, #0]
 6f2:	210c      	movs	r1, #12
 6f4:	fb01 3202 	mla	r2, r1, r2, r3
 6f8:	6851      	ldr	r1, [r2, #4]
 6fa:	f041 0102 	orr.w	r1, r1, #2
 6fe:	6051      	str	r1, [r2, #4]
 700:	b672      	cpsid	i
 702:	9a00      	ldr	r2, [sp, #0]
 704:	210c      	movs	r1, #12
 706:	fb01 3202 	mla	r2, r1, r2, r3
 70a:	6852      	ldr	r2, [r2, #4]
 70c:	9201      	str	r2, [sp, #4]
 70e:	b662      	cpsie	i
 710:	9a01      	ldr	r2, [sp, #4]
 712:	0791      	lsls	r1, r2, #30
 714:	d500      	bpl.n	718 <set_wait_state+0x34>
 716:	bf00      	nop
 718:	9a01      	ldr	r2, [sp, #4]
 71a:	0792      	lsls	r2, r2, #30
 71c:	d4f0      	bmi.n	700 <set_wait_state+0x1c>
 71e:	b003      	add	sp, #12
 720:	f85d fb04 	ldr.w	pc, [sp], #4
 724:	20000000 	.word	0x20000000

Disassembly of section .text.wake_up_threads:

00000728 <wake_up_threads>:
 728:	2300      	movs	r3, #0
 72a:	b672      	cpsid	i
 72c:	4a06      	ldr	r2, [pc, #24]	; (748 <wake_up_threads+0x20>)
 72e:	210c      	movs	r1, #12
 730:	fb01 2203 	mla	r2, r1, r3, r2
 734:	6851      	ldr	r1, [r2, #4]
 736:	f021 0102 	bic.w	r1, r1, #2
 73a:	6051      	str	r1, [r2, #4]
 73c:	b662      	cpsie	i
 73e:	3301      	adds	r3, #1
 740:	2b08      	cmp	r3, #8
 742:	d1f2      	bne.n	72a <wake_up_threads+0x2>
 744:	4770      	bx	lr
 746:	bf00      	nop
 748:	20000000 	.word	0x20000000

Disassembly of section .text.lib_os_init:

0000074c <lib_os_init>:
 74c:	b508      	push	{r3, lr}
 74e:	f7ff ffa7 	bl	6a0 <kernel_init>
 752:	f000 f805 	bl	760 <messages_init>
 756:	e8bd 4008 	ldmia.w	sp!, {r3, lr}
 75a:	f000 b8e7 	b.w	92c <stdio_init>

Disassembly of section .text.messages_init:

00000760 <messages_init>:
 760:	b510      	push	{r4, lr}
 762:	2200      	movs	r2, #0
 764:	4909      	ldr	r1, [pc, #36]	; (78c <messages_init+0x2c>)
 766:	2300      	movs	r3, #0
 768:	f841 3022 	str.w	r3, [r1, r2, lsl #2]
 76c:	3201      	adds	r2, #1
 76e:	2a08      	cmp	r2, #8
 770:	d1f8      	bne.n	764 <messages_init+0x4>
 772:	4c07      	ldr	r4, [pc, #28]	; (790 <messages_init+0x30>)
 774:	0118      	lsls	r0, r3, #4
 776:	1821      	adds	r1, r4, r0
 778:	3301      	adds	r3, #1
 77a:	2200      	movs	r2, #0
 77c:	2b04      	cmp	r3, #4
 77e:	604a      	str	r2, [r1, #4]
 780:	5022      	str	r2, [r4, r0]
 782:	60ca      	str	r2, [r1, #12]
 784:	608a      	str	r2, [r1, #8]
 786:	d1f4      	bne.n	772 <messages_init+0x12>
 788:	bd10      	pop	{r4, pc}
 78a:	bf00      	nop
 78c:	20000564 	.word	0x20000564
 790:	20000584 	.word	0x20000584

Disassembly of section .text.putc_:

00000794 <putc_>:
 794:	b538      	push	{r3, r4, r5, lr}
 796:	4c06      	ldr	r4, [pc, #24]	; (7b0 <putc_+0x1c>)
 798:	4605      	mov	r5, r0
 79a:	4620      	mov	r0, r4
 79c:	f000 f8f8 	bl	990 <mutex_lock>
 7a0:	4628      	mov	r0, r5
 7a2:	f000 fc1d 	bl	fe0 <uart_write>
 7a6:	4620      	mov	r0, r4
 7a8:	e8bd 4038 	ldmia.w	sp!, {r3, r4, r5, lr}
 7ac:	f000 b90c 	b.w	9c8 <mutex_unlock>
 7b0:	200005c4 	.word	0x200005c4

Disassembly of section .text.puts_:

000007b4 <puts_>:
 7b4:	b510      	push	{r4, lr}
 7b6:	4604      	mov	r4, r0
 7b8:	4807      	ldr	r0, [pc, #28]	; (7d8 <puts_+0x24>)
 7ba:	f000 f8e9 	bl	990 <mutex_lock>
 7be:	3c01      	subs	r4, #1
 7c0:	f814 0f01 	ldrb.w	r0, [r4, #1]!
 7c4:	b110      	cbz	r0, 7cc <puts_+0x18>
 7c6:	f7ff ffe5 	bl	794 <putc_>
 7ca:	e7f9      	b.n	7c0 <puts_+0xc>
 7cc:	4802      	ldr	r0, [pc, #8]	; (7d8 <puts_+0x24>)
 7ce:	e8bd 4010 	ldmia.w	sp!, {r4, lr}
 7d2:	f000 b8f9 	b.w	9c8 <mutex_unlock>
 7d6:	bf00      	nop
 7d8:	200005d0 	.word	0x200005d0

Disassembly of section .text.puti_:

000007dc <puti_>:
 7dc:	b530      	push	{r4, r5, lr}
 7de:	b085      	sub	sp, #20
 7e0:	1e03      	subs	r3, r0, #0
 7e2:	f04f 0200 	mov.w	r2, #0
 7e6:	bfa8      	it	ge
 7e8:	4614      	movge	r4, r2
 7ea:	f88d 200f 	strb.w	r2, [sp, #15]
 7ee:	bfbc      	itt	lt
 7f0:	425b      	neglt	r3, r3
 7f2:	2401      	movlt	r4, #1
 7f4:	220a      	movs	r2, #10
 7f6:	210a      	movs	r1, #10
 7f8:	fb93 f5f1 	sdiv	r5, r3, r1
 7fc:	fb01 3315 	mls	r3, r1, r5, r3
 800:	a801      	add	r0, sp, #4
 802:	3330      	adds	r3, #48	; 0x30
 804:	5413      	strb	r3, [r2, r0]
 806:	1e51      	subs	r1, r2, #1
 808:	462b      	mov	r3, r5
 80a:	b10d      	cbz	r5, 810 <puti_+0x34>
 80c:	460a      	mov	r2, r1
 80e:	e7f2      	b.n	7f6 <puti_+0x1a>
 810:	b12c      	cbz	r4, 81e <puti_+0x42>
 812:	ab04      	add	r3, sp, #16
 814:	440b      	add	r3, r1
 816:	222d      	movs	r2, #45	; 0x2d
 818:	f803 2c0c 	strb.w	r2, [r3, #-12]
 81c:	460a      	mov	r2, r1
 81e:	4410      	add	r0, r2
 820:	f7ff ffc8 	bl	7b4 <puts_>
 824:	b005      	add	sp, #20
 826:	bd30      	pop	{r4, r5, pc}

Disassembly of section .text.putui_:

00000828 <putui_>:
 828:	b51f      	push	{r0, r1, r2, r3, r4, lr}
 82a:	2300      	movs	r3, #0
 82c:	f88d 300f 	strb.w	r3, [sp, #15]
 830:	230a      	movs	r3, #10
 832:	240a      	movs	r4, #10
 834:	fbb0 f1f4 	udiv	r1, r0, r4
 838:	fb04 0011 	mls	r0, r4, r1, r0
 83c:	aa01      	add	r2, sp, #4
 83e:	3030      	adds	r0, #48	; 0x30
 840:	5498      	strb	r0, [r3, r2]
 842:	1e5c      	subs	r4, r3, #1
 844:	4608      	mov	r0, r1
 846:	b109      	cbz	r1, 84c <putui_+0x24>
 848:	4623      	mov	r3, r4
 84a:	e7f2      	b.n	832 <putui_+0xa>
 84c:	18d0      	adds	r0, r2, r3
 84e:	f7ff ffb1 	bl	7b4 <puts_>
 852:	b004      	add	sp, #16
 854:	bd10      	pop	{r4, pc}

Disassembly of section .text.putx_:

00000856 <putx_>:
 856:	b51f      	push	{r0, r1, r2, r3, r4, lr}
 858:	2300      	movs	r3, #0
 85a:	f88d 300f 	strb.w	r3, [sp, #15]
 85e:	230a      	movs	r3, #10
 860:	f000 010f 	and.w	r1, r0, #15
 864:	2909      	cmp	r1, #9
 866:	aa01      	add	r2, sp, #4
 868:	bf94      	ite	ls
 86a:	3130      	addls	r1, #48	; 0x30
 86c:	3157      	addhi	r1, #87	; 0x57
 86e:	0900      	lsrs	r0, r0, #4
 870:	54d1      	strb	r1, [r2, r3]
 872:	f103 31ff 	add.w	r1, r3, #4294967295
 876:	d001      	beq.n	87c <putx_+0x26>
 878:	460b      	mov	r3, r1
 87a:	e7f1      	b.n	860 <putx_+0xa>
 87c:	18d0      	adds	r0, r2, r3
 87e:	f7ff ff99 	bl	7b4 <puts_>
 882:	b005      	add	sp, #20
 884:	f85d fb04 	ldr.w	pc, [sp], #4

Disassembly of section .text.printf_:

00000888 <printf_>:
 888:	b40f      	push	{r0, r1, r2, r3}
 88a:	b537      	push	{r0, r1, r2, r4, r5, lr}
 88c:	ac06      	add	r4, sp, #24
 88e:	4826      	ldr	r0, [pc, #152]	; (928 <printf_+0xa0>)
 890:	f854 5b04 	ldr.w	r5, [r4], #4
 894:	f000 f87c 	bl	990 <mutex_lock>
 898:	9401      	str	r4, [sp, #4]
 89a:	2400      	movs	r4, #0
 89c:	5d28      	ldrb	r0, [r5, r4]
 89e:	2800      	cmp	r0, #0
 8a0:	d039      	beq.n	916 <printf_+0x8e>
 8a2:	2825      	cmp	r0, #37	; 0x25
 8a4:	d003      	beq.n	8ae <printf_+0x26>
 8a6:	f7ff ff75 	bl	794 <putc_>
 8aa:	3401      	adds	r4, #1
 8ac:	e7f6      	b.n	89c <printf_+0x14>
 8ae:	192b      	adds	r3, r5, r4
 8b0:	7858      	ldrb	r0, [r3, #1]
 8b2:	2869      	cmp	r0, #105	; 0x69
 8b4:	d016      	beq.n	8e4 <printf_+0x5c>
 8b6:	d808      	bhi.n	8ca <printf_+0x42>
 8b8:	2825      	cmp	r0, #37	; 0x25
 8ba:	d028      	beq.n	90e <printf_+0x86>
 8bc:	2863      	cmp	r0, #99	; 0x63
 8be:	d128      	bne.n	912 <printf_+0x8a>
 8c0:	9b01      	ldr	r3, [sp, #4]
 8c2:	1d1a      	adds	r2, r3, #4
 8c4:	9201      	str	r2, [sp, #4]
 8c6:	7818      	ldrb	r0, [r3, #0]
 8c8:	e021      	b.n	90e <printf_+0x86>
 8ca:	2875      	cmp	r0, #117	; 0x75
 8cc:	d011      	beq.n	8f2 <printf_+0x6a>
 8ce:	2878      	cmp	r0, #120	; 0x78
 8d0:	d016      	beq.n	900 <printf_+0x78>
 8d2:	2873      	cmp	r0, #115	; 0x73
 8d4:	d11d      	bne.n	912 <printf_+0x8a>
 8d6:	9b01      	ldr	r3, [sp, #4]
 8d8:	1d1a      	adds	r2, r3, #4
 8da:	6818      	ldr	r0, [r3, #0]
 8dc:	9201      	str	r2, [sp, #4]
 8de:	f7ff ff69 	bl	7b4 <puts_>
 8e2:	e016      	b.n	912 <printf_+0x8a>
 8e4:	9b01      	ldr	r3, [sp, #4]
 8e6:	1d1a      	adds	r2, r3, #4
 8e8:	6818      	ldr	r0, [r3, #0]
 8ea:	9201      	str	r2, [sp, #4]
 8ec:	f7ff ff76 	bl	7dc <puti_>
 8f0:	e00f      	b.n	912 <printf_+0x8a>
 8f2:	9b01      	ldr	r3, [sp, #4]
 8f4:	1d1a      	adds	r2, r3, #4
 8f6:	6818      	ldr	r0, [r3, #0]
 8f8:	9201      	str	r2, [sp, #4]
 8fa:	f7ff ff95 	bl	828 <putui_>
 8fe:	e008      	b.n	912 <printf_+0x8a>
 900:	9b01      	ldr	r3, [sp, #4]
 902:	1d1a      	adds	r2, r3, #4
 904:	6818      	ldr	r0, [r3, #0]
 906:	9201      	str	r2, [sp, #4]
 908:	f7ff ffa5 	bl	856 <putx_>
 90c:	e001      	b.n	912 <printf_+0x8a>
 90e:	f7ff ff41 	bl	794 <putc_>
 912:	3402      	adds	r4, #2
 914:	e7c2      	b.n	89c <printf_+0x14>
 916:	4804      	ldr	r0, [pc, #16]	; (928 <printf_+0xa0>)
 918:	f000 f856 	bl	9c8 <mutex_unlock>
 91c:	b003      	add	sp, #12
 91e:	e8bd 4030 	ldmia.w	sp!, {r4, r5, lr}
 922:	b004      	add	sp, #16
 924:	4770      	bx	lr
 926:	bf00      	nop
 928:	200005cc 	.word	0x200005cc

Disassembly of section .text.stdio_init:

0000092c <stdio_init>:
 92c:	b510      	push	{r4, lr}
 92e:	480e      	ldr	r0, [pc, #56]	; (968 <stdio_init+0x3c>)
 930:	f000 f824 	bl	97c <mutex_init>
 934:	480d      	ldr	r0, [pc, #52]	; (96c <stdio_init+0x40>)
 936:	f000 f821 	bl	97c <mutex_init>
 93a:	480d      	ldr	r0, [pc, #52]	; (970 <stdio_init+0x44>)
 93c:	f000 f81e 	bl	97c <mutex_init>
 940:	480c      	ldr	r0, [pc, #48]	; (974 <stdio_init+0x48>)
 942:	f000 f81b 	bl	97c <mutex_init>
 946:	2408      	movs	r4, #8
 948:	2020      	movs	r0, #32
 94a:	f7ff ff23 	bl	794 <putc_>
 94e:	3c01      	subs	r4, #1
 950:	d1fa      	bne.n	948 <stdio_init+0x1c>
 952:	2420      	movs	r4, #32
 954:	200a      	movs	r0, #10
 956:	f7ff ff1d 	bl	794 <putc_>
 95a:	3c01      	subs	r4, #1
 95c:	d1fa      	bne.n	954 <stdio_init+0x28>
 95e:	4806      	ldr	r0, [pc, #24]	; (978 <stdio_init+0x4c>)
 960:	e8bd 4010 	ldmia.w	sp!, {r4, lr}
 964:	f7ff bf90 	b.w	888 <printf_>
 968:	200005c4 	.word	0x200005c4
 96c:	200005c8 	.word	0x200005c8
 970:	200005d0 	.word	0x200005d0
 974:	200005cc 	.word	0x200005cc
 978:	0000026c 	.word	0x0000026c

Disassembly of section .text.mutex_init:

0000097c <mutex_init>:
 97c:	b510      	push	{r4, lr}
 97e:	4604      	mov	r4, r0
 980:	f7ff fe3c 	bl	5fc <sched_off>
 984:	2300      	movs	r3, #0
 986:	6023      	str	r3, [r4, #0]
 988:	e8bd 4010 	ldmia.w	sp!, {r4, lr}
 98c:	f7ff be38 	b.w	600 <sched_on>

Disassembly of section .text.mutex_lock:

00000990 <mutex_lock>:
 990:	b513      	push	{r0, r1, r4, lr}
 992:	4604      	mov	r4, r0
 994:	f7ff fe32 	bl	5fc <sched_off>
 998:	6823      	ldr	r3, [r4, #0]
 99a:	9301      	str	r3, [sp, #4]
 99c:	f7ff fe30 	bl	600 <sched_on>
 9a0:	9b01      	ldr	r3, [sp, #4]
 9a2:	b10b      	cbz	r3, 9a8 <mutex_lock+0x18>
 9a4:	f7ff fe9e 	bl	6e4 <set_wait_state>
 9a8:	9b01      	ldr	r3, [sp, #4]
 9aa:	2b00      	cmp	r3, #0
 9ac:	d1f2      	bne.n	994 <mutex_lock+0x4>
 9ae:	f7ff fe25 	bl	5fc <sched_off>
 9b2:	6823      	ldr	r3, [r4, #0]
 9b4:	9301      	str	r3, [sp, #4]
 9b6:	9b01      	ldr	r3, [sp, #4]
 9b8:	2b00      	cmp	r3, #0
 9ba:	d1eb      	bne.n	994 <mutex_lock+0x4>
 9bc:	2301      	movs	r3, #1
 9be:	6023      	str	r3, [r4, #0]
 9c0:	f7ff fe1e 	bl	600 <sched_on>
 9c4:	b002      	add	sp, #8
 9c6:	bd10      	pop	{r4, pc}

Disassembly of section .text.mutex_unlock:

000009c8 <mutex_unlock>:
 9c8:	b508      	push	{r3, lr}
 9ca:	f7ff ffd7 	bl	97c <mutex_init>
 9ce:	f7ff feab 	bl	728 <wake_up_threads>
 9d2:	e8bd 4008 	ldmia.w	sp!, {r3, lr}
 9d6:	f7ff be15 	b.w	604 <yield>

Disassembly of section .text.startup.main:

000009dc <main>:
 9dc:	b508      	push	{r3, lr}
 9de:	f000 fbdf 	bl	11a0 <lib_low_level_init>
 9e2:	f7ff feb3 	bl	74c <lib_os_init>
 9e6:	4905      	ldr	r1, [pc, #20]	; (9fc <main+0x20>)
 9e8:	4805      	ldr	r0, [pc, #20]	; (a00 <main+0x24>)
 9ea:	f44f 7200 	mov.w	r2, #512	; 0x200
 9ee:	2308      	movs	r3, #8
 9f0:	f7ff fe1c 	bl	62c <create_thread>
 9f4:	f7ff fe14 	bl	620 <kernel_start>
 9f8:	2000      	movs	r0, #0
 9fa:	bd08      	pop	{r3, pc}
 9fc:	200007d4 	.word	0x200007d4
 a00:	00000b81 	.word	0x00000b81

Disassembly of section .text.julia_set:

00000a04 <julia_set>:
 a04:	b570      	push	{r4, r5, r6, lr}
 a06:	ed2d 8b06 	vpush	{d8-d10}
 a0a:	ee08 1a90 	vmov	s17, r1
 a0e:	ed9f 8a31 	vldr	s16, [pc, #196]	; ad4 <julia_set+0xd0>
 a12:	ee08 8ae8 	vmls.f32	s16, s17, s17
 a16:	eef5 8ac0 	vcmpe.f32	s17, #0.0
 a1a:	eef1 fa10 	vmrs	APSR_nzcv, fpscr
 a1e:	4606      	mov	r6, r0
 a20:	bf48      	it	mi
 a22:	eeb1 8a48 	vnegmi.f32	s16, s16
 a26:	2500      	movs	r5, #0
 a28:	ee07 5a90 	vmov	s15, r5
 a2c:	eddf 6a2a 	vldr	s13, [pc, #168]	; ad8 <julia_set+0xd4>
 a30:	eef8 aae7 	vcvt.f32.s32	s21, s15
 a34:	ed9f 7a29 	vldr	s14, [pc, #164]	; adc <julia_set+0xd8>
 a38:	eeca aaa6 	vdiv.f32	s21, s21, s13
 a3c:	2400      	movs	r4, #0
 a3e:	eddf 7a28 	vldr	s15, [pc, #160]	; ae0 <julia_set+0xdc>
 a42:	ee7a aac7 	vsub.f32	s21, s21, s14
 a46:	eeb0 aa66 	vmov.f32	s20, s13
 a4a:	ee6a aaa7 	vmul.f32	s21, s21, s15
 a4e:	eef0 9a47 	vmov.f32	s19, s14
 a52:	eeb0 9a67 	vmov.f32	s18, s15
 a56:	ee06 4a10 	vmov	s12, r4
 a5a:	eeb8 7ac6 	vcvt.f32.s32	s14, s12
 a5e:	4633      	mov	r3, r6
 a60:	ee87 7a0a 	vdiv.f32	s14, s14, s20
 a64:	eef0 7a6a 	vmov.f32	s15, s21
 a68:	ee37 7a69 	vsub.f32	s14, s14, s19
 a6c:	ee27 7a09 	vmul.f32	s14, s14, s18
 a70:	ee67 6aa7 	vmul.f32	s13, s15, s15
 a74:	ee57 6a07 	vnmls.f32	s13, s14, s14
 a78:	ee37 7a07 	vadd.f32	s14, s14, s14
 a7c:	eeb0 6a48 	vmov.f32	s12, s16
 a80:	ee07 6a27 	vmla.f32	s12, s14, s15
 a84:	ee76 6aa8 	vadd.f32	s13, s13, s17
 a88:	ee26 7a06 	vmul.f32	s14, s12, s12
 a8c:	ee06 7aa6 	vmla.f32	s14, s13, s13
 a90:	eef0 7a46 	vmov.f32	s15, s12
 a94:	ed9f 6a13 	vldr	s12, [pc, #76]	; ae4 <julia_set+0xe0>
 a98:	eeb4 7ac6 	vcmpe.f32	s14, s12
 a9c:	eef1 fa10 	vmrs	APSR_nzcv, fpscr
 aa0:	f103 33ff 	add.w	r3, r3, #4294967295
 aa4:	d503      	bpl.n	aae <julia_set+0xaa>
 aa6:	b11b      	cbz	r3, ab0 <julia_set+0xac>
 aa8:	eeb0 7a66 	vmov.f32	s14, s13
 aac:	e7e0      	b.n	a70 <julia_set+0x6c>
 aae:	b91b      	cbnz	r3, ab8 <julia_set+0xb4>
 ab0:	4620      	mov	r0, r4
 ab2:	4629      	mov	r1, r5
 ab4:	2201      	movs	r2, #1
 ab6:	e002      	b.n	abe <julia_set+0xba>
 ab8:	4620      	mov	r0, r4
 aba:	4629      	mov	r1, r5
 abc:	2200      	movs	r2, #0
 abe:	3401      	adds	r4, #1
 ac0:	f000 f950 	bl	d64 <lcd_sharp96_put_pixel>
 ac4:	2c60      	cmp	r4, #96	; 0x60
 ac6:	d1c6      	bne.n	a56 <julia_set+0x52>
 ac8:	3501      	adds	r5, #1
 aca:	2d60      	cmp	r5, #96	; 0x60
 acc:	d1ac      	bne.n	a28 <julia_set+0x24>
 ace:	ecbd 8b06 	vpop	{d8-d10}
 ad2:	bd70      	pop	{r4, r5, r6, pc}
 ad4:	3f800000 	.word	0x3f800000
 ad8:	42c00000 	.word	0x42c00000
 adc:	3f000000 	.word	0x3f000000
 ae0:	40800000 	.word	0x40800000
 ae4:	40000000 	.word	0x40000000

Disassembly of section .text.lcd_demo:

00000ae8 <lcd_demo>:
 ae8:	e92d 41f3 	stmdb	sp!, {r0, r1, r4, r5, r6, r7, r8, lr}
 aec:	20ff      	movs	r0, #255	; 0xff
 aee:	f000 f929 	bl	d44 <lcd_sharp96_clear>
 af2:	481e      	ldr	r0, [pc, #120]	; (b6c <lcd_demo+0x84>)
 af4:	4e1e      	ldr	r6, [pc, #120]	; (b70 <lcd_demo+0x88>)
 af6:	f000 f953 	bl	da0 <lcd_sharp96_put_string>
 afa:	f000 f8f5 	bl	ce8 <lcd_sharp96_flush>
 afe:	f44f 607a 	mov.w	r0, #4000	; 0xfa0
 b02:	f000 fa29 	bl	f58 <timer_delay_ms>
 b06:	2400      	movs	r4, #0
 b08:	4627      	mov	r7, r4
 b0a:	4625      	mov	r5, r4
 b0c:	f000 fa16 	bl	f3c <timer_get_time>
 b10:	ee07 5a10 	vmov	s14, r5
 b14:	eef8 7ac7 	vcvt.f32.s32	s15, s14
 b18:	ed9f 7a16 	vldr	s14, [pc, #88]	; b74 <lcd_demo+0x8c>
 b1c:	ee77 7aa7 	vadd.f32	s15, s15, s15
 b20:	4680      	mov	r8, r0
 b22:	eec7 7a87 	vdiv.f32	s15, s15, s14
 b26:	2010      	movs	r0, #16
 b28:	3501      	adds	r5, #1
 b2a:	ed9f 7a13 	vldr	s14, [pc, #76]	; b78 <lcd_demo+0x90>
 b2e:	ee37 7ac7 	vsub.f32	s14, s15, s14
 b32:	ee17 1a10 	vmov	r1, s14
 b36:	f7ff ff65 	bl	a04 <julia_set>
 b3a:	f000 f9ff 	bl	f3c <timer_get_time>
 b3e:	ebc8 0000 	rsb	r0, r8, r0
 b42:	4284      	cmp	r4, r0
 b44:	bf38      	it	cc
 b46:	4604      	movcc	r4, r0
 b48:	4286      	cmp	r6, r0
 b4a:	bf28      	it	cs
 b4c:	4606      	movcs	r6, r0
 b4e:	4407      	add	r7, r0
 b50:	f000 f8ca 	bl	ce8 <lcd_sharp96_flush>
 b54:	2d19      	cmp	r5, #25
 b56:	d1d9      	bne.n	b0c <lcd_demo+0x24>
 b58:	9400      	str	r4, [sp, #0]
 b5a:	4808      	ldr	r0, [pc, #32]	; (b7c <lcd_demo+0x94>)
 b5c:	2110      	movs	r1, #16
 b5e:	463a      	mov	r2, r7
 b60:	4633      	mov	r3, r6
 b62:	f7ff fe91 	bl	888 <printf_>
 b66:	b002      	add	sp, #8
 b68:	e8bd 81f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, pc}
 b6c:	0000027d 	.word	0x0000027d
 b70:	000f4240 	.word	0x000f4240
 b74:	42c80000 	.word	0x42c80000
 b78:	3f800000 	.word	0x3f800000
 b7c:	000002b8 	.word	0x000002b8

Disassembly of section .text.main_thread:

00000b80 <main_thread>:
 b80:	b508      	push	{r3, lr}
 b82:	4806      	ldr	r0, [pc, #24]	; (b9c <main_thread+0x1c>)
 b84:	f7ff fe80 	bl	888 <printf_>
 b88:	f000 f9d8 	bl	f3c <timer_get_time>
 b8c:	4601      	mov	r1, r0
 b8e:	4804      	ldr	r0, [pc, #16]	; (ba0 <main_thread+0x20>)
 b90:	f7ff fe7a 	bl	888 <printf_>
 b94:	f7ff ffa8 	bl	ae8 <lcd_demo>
 b98:	e7f6      	b.n	b88 <main_thread+0x8>
 b9a:	bf00      	nop
 b9c:	0000027d 	.word	0x0000027d
 ba0:	000002c5 	.word	0x000002c5

Disassembly of section .text.pwm_init:

00000ba4 <pwm_init>:
 ba4:	4770      	bx	lr

Disassembly of section .text.lcd_sharp96_us_delay:

00000ba6 <lcd_sharp96_us_delay>:
 ba6:	2330      	movs	r3, #48	; 0x30
 ba8:	4358      	muls	r0, r3
 baa:	2206      	movs	r2, #6
 bac:	fbb0 f0f2 	udiv	r0, r0, r2
 bb0:	f110 30ff 	adds.w	r0, r0, #4294967295
 bb4:	d301      	bcc.n	bba <lcd_sharp96_us_delay+0x14>
 bb6:	bf00      	nop
 bb8:	e7fa      	b.n	bb0 <lcd_sharp96_us_delay+0xa>
 bba:	4770      	bx	lr

Disassembly of section .text.lcd_sharp96_set_cs:

00000bbc <lcd_sharp96_set_cs>:
 bbc:	b508      	push	{r3, lr}
 bbe:	4b06      	ldr	r3, [pc, #24]	; (bd8 <lcd_sharp96_set_cs+0x1c>)
 bc0:	4806      	ldr	r0, [pc, #24]	; (bdc <lcd_sharp96_set_cs+0x20>)
 bc2:	681b      	ldr	r3, [r3, #0]
 bc4:	2120      	movs	r1, #32
 bc6:	681b      	ldr	r3, [r3, #0]
 bc8:	460a      	mov	r2, r1
 bca:	4798      	blx	r3
 bcc:	2001      	movs	r0, #1
 bce:	e8bd 4008 	ldmia.w	sp!, {r3, lr}
 bd2:	f7ff bfe8 	b.w	ba6 <lcd_sharp96_us_delay>
 bd6:	bf00      	nop
 bd8:	01000020 	.word	0x01000020
 bdc:	40024000 	.word	0x40024000

Disassembly of section .text.lcd_sharp96_clear_cs:

00000be0 <lcd_sharp96_clear_cs>:
 be0:	b508      	push	{r3, lr}
 be2:	4b06      	ldr	r3, [pc, #24]	; (bfc <lcd_sharp96_clear_cs+0x1c>)
 be4:	4806      	ldr	r0, [pc, #24]	; (c00 <lcd_sharp96_clear_cs+0x20>)
 be6:	681b      	ldr	r3, [r3, #0]
 be8:	2120      	movs	r1, #32
 bea:	681b      	ldr	r3, [r3, #0]
 bec:	2200      	movs	r2, #0
 bee:	4798      	blx	r3
 bf0:	2001      	movs	r0, #1
 bf2:	e8bd 4008 	ldmia.w	sp!, {r3, lr}
 bf6:	f7ff bfd6 	b.w	ba6 <lcd_sharp96_us_delay>
 bfa:	bf00      	nop
 bfc:	01000020 	.word	0x01000020
 c00:	40024000 	.word	0x40024000

Disassembly of section .text.lcd_sharp96_spib:

00000c04 <lcd_sharp96_spib>:
 c04:	b570      	push	{r4, r5, r6, lr}
 c06:	4604      	mov	r4, r0
 c08:	2508      	movs	r5, #8
 c0a:	4b14      	ldr	r3, [pc, #80]	; (c5c <lcd_sharp96_spib+0x58>)
 c0c:	4814      	ldr	r0, [pc, #80]	; (c60 <lcd_sharp96_spib+0x5c>)
 c0e:	681b      	ldr	r3, [r3, #0]
 c10:	4e12      	ldr	r6, [pc, #72]	; (c5c <lcd_sharp96_spib+0x58>)
 c12:	681b      	ldr	r3, [r3, #0]
 c14:	f014 0f80 	tst.w	r4, #128	; 0x80
 c18:	f04f 0180 	mov.w	r1, #128	; 0x80
 c1c:	bf14      	ite	ne
 c1e:	460a      	movne	r2, r1
 c20:	2200      	moveq	r2, #0
 c22:	4798      	blx	r3
 c24:	2001      	movs	r0, #1
 c26:	f7ff ffbe 	bl	ba6 <lcd_sharp96_us_delay>
 c2a:	6833      	ldr	r3, [r6, #0]
 c2c:	480c      	ldr	r0, [pc, #48]	; (c60 <lcd_sharp96_spib+0x5c>)
 c2e:	681b      	ldr	r3, [r3, #0]
 c30:	2110      	movs	r1, #16
 c32:	460a      	mov	r2, r1
 c34:	4798      	blx	r3
 c36:	2001      	movs	r0, #1
 c38:	f7ff ffb5 	bl	ba6 <lcd_sharp96_us_delay>
 c3c:	6833      	ldr	r3, [r6, #0]
 c3e:	4808      	ldr	r0, [pc, #32]	; (c60 <lcd_sharp96_spib+0x5c>)
 c40:	681b      	ldr	r3, [r3, #0]
 c42:	2110      	movs	r1, #16
 c44:	2200      	movs	r2, #0
 c46:	4798      	blx	r3
 c48:	3d01      	subs	r5, #1
 c4a:	2001      	movs	r0, #1
 c4c:	f7ff ffab 	bl	ba6 <lcd_sharp96_us_delay>
 c50:	0064      	lsls	r4, r4, #1
 c52:	f015 05ff 	ands.w	r5, r5, #255	; 0xff
 c56:	b2e4      	uxtb	r4, r4
 c58:	d1d7      	bne.n	c0a <lcd_sharp96_spib+0x6>
 c5a:	bd70      	pop	{r4, r5, r6, pc}
 c5c:	01000020 	.word	0x01000020
 c60:	40005000 	.word	0x40005000

Disassembly of section .text.lcd_sharp96_init:

00000c64 <lcd_sharp96_init>:
 c64:	b570      	push	{r4, r5, r6, lr}
 c66:	4c17      	ldr	r4, [pc, #92]	; (cc4 <lcd_sharp96_init+0x60>)
 c68:	4d17      	ldr	r5, [pc, #92]	; (cc8 <lcd_sharp96_init+0x64>)
 c6a:	6823      	ldr	r3, [r4, #0]
 c6c:	4e17      	ldr	r6, [pc, #92]	; (ccc <lcd_sharp96_init+0x68>)
 c6e:	6bdb      	ldr	r3, [r3, #60]	; 0x3c
 c70:	4628      	mov	r0, r5
 c72:	2120      	movs	r1, #32
 c74:	4798      	blx	r3
 c76:	6823      	ldr	r3, [r4, #0]
 c78:	4630      	mov	r0, r6
 c7a:	6bdb      	ldr	r3, [r3, #60]	; 0x3c
 c7c:	2110      	movs	r1, #16
 c7e:	4798      	blx	r3
 c80:	6823      	ldr	r3, [r4, #0]
 c82:	4630      	mov	r0, r6
 c84:	6bdb      	ldr	r3, [r3, #60]	; 0x3c
 c86:	2120      	movs	r1, #32
 c88:	4798      	blx	r3
 c8a:	6823      	ldr	r3, [r4, #0]
 c8c:	4628      	mov	r0, r5
 c8e:	6bdb      	ldr	r3, [r3, #60]	; 0x3c
 c90:	2110      	movs	r1, #16
 c92:	4798      	blx	r3
 c94:	6823      	ldr	r3, [r4, #0]
 c96:	4628      	mov	r0, r5
 c98:	6bdb      	ldr	r3, [r3, #60]	; 0x3c
 c9a:	2180      	movs	r1, #128	; 0x80
 c9c:	4798      	blx	r3
 c9e:	6823      	ldr	r3, [r4, #0]
 ca0:	2120      	movs	r1, #32
 ca2:	4628      	mov	r0, r5
 ca4:	460a      	mov	r2, r1
 ca6:	681b      	ldr	r3, [r3, #0]
 ca8:	4798      	blx	r3
 caa:	6823      	ldr	r3, [r4, #0]
 cac:	2110      	movs	r1, #16
 cae:	4630      	mov	r0, r6
 cb0:	681b      	ldr	r3, [r3, #0]
 cb2:	460a      	mov	r2, r1
 cb4:	4798      	blx	r3
 cb6:	f7ff ff93 	bl	be0 <lcd_sharp96_clear_cs>
 cba:	20ff      	movs	r0, #255	; 0xff
 cbc:	e8bd 4070 	ldmia.w	sp!, {r4, r5, r6, lr}
 cc0:	f7ff bfa0 	b.w	c04 <lcd_sharp96_spib>
 cc4:	01000020 	.word	0x01000020
 cc8:	40005000 	.word	0x40005000
 ccc:	40024000 	.word	0x40024000

Disassembly of section .text.lcd_sharp96_reverse:

00000cd0 <lcd_sharp96_reverse>:
 cd0:	4b04      	ldr	r3, [pc, #16]	; (ce4 <lcd_sharp96_reverse+0x14>)
 cd2:	f000 020f 	and.w	r2, r0, #15
 cd6:	0900      	lsrs	r0, r0, #4
 cd8:	5c9a      	ldrb	r2, [r3, r2]
 cda:	5c18      	ldrb	r0, [r3, r0]
 cdc:	0112      	lsls	r2, r2, #4
 cde:	b2d2      	uxtb	r2, r2
 ce0:	4310      	orrs	r0, r2
 ce2:	4770      	bx	lr
 ce4:	000002d0 	.word	0x000002d0

Disassembly of section .text.lcd_sharp96_flush:

00000ce8 <lcd_sharp96_flush>:
 ce8:	b570      	push	{r4, r5, r6, lr}
 cea:	f7ff ff67 	bl	bbc <lcd_sharp96_set_cs>
 cee:	20c0      	movs	r0, #192	; 0xc0
 cf0:	f7ff ff88 	bl	c04 <lcd_sharp96_spib>
 cf4:	2401      	movs	r4, #1
 cf6:	260c      	movs	r6, #12
 cf8:	4366      	muls	r6, r4
 cfa:	b2b6      	uxth	r6, r6
 cfc:	f1a6 050c 	sub.w	r5, r6, #12
 d00:	b2e0      	uxtb	r0, r4
 d02:	b2ad      	uxth	r5, r5
 d04:	f7ff ffe4 	bl	cd0 <lcd_sharp96_reverse>
 d08:	f7ff ff7c 	bl	c04 <lcd_sharp96_spib>
 d0c:	4b0c      	ldr	r3, [pc, #48]	; (d40 <lcd_sharp96_flush+0x58>)
 d0e:	5d58      	ldrb	r0, [r3, r5]
 d10:	3501      	adds	r5, #1
 d12:	b2ad      	uxth	r5, r5
 d14:	f7ff ff76 	bl	c04 <lcd_sharp96_spib>
 d18:	42b5      	cmp	r5, r6
 d1a:	d1f7      	bne.n	d0c <lcd_sharp96_flush+0x24>
 d1c:	3401      	adds	r4, #1
 d1e:	2000      	movs	r0, #0
 d20:	b2a4      	uxth	r4, r4
 d22:	f7ff ff6f 	bl	c04 <lcd_sharp96_spib>
 d26:	2c61      	cmp	r4, #97	; 0x61
 d28:	d1e5      	bne.n	cf6 <lcd_sharp96_flush+0xe>
 d2a:	2000      	movs	r0, #0
 d2c:	f7ff ff6a 	bl	c04 <lcd_sharp96_spib>
 d30:	2002      	movs	r0, #2
 d32:	f7ff ff38 	bl	ba6 <lcd_sharp96_us_delay>
 d36:	e8bd 4070 	ldmia.w	sp!, {r4, r5, r6, lr}
 d3a:	f7ff bf51 	b.w	be0 <lcd_sharp96_clear_cs>
 d3e:	bf00      	nop
 d40:	200009d4 	.word	0x200009d4

Disassembly of section .text.lcd_sharp96_clear:

00000d44 <lcd_sharp96_clear>:
 d44:	2200      	movs	r2, #0
 d46:	4906      	ldr	r1, [pc, #24]	; (d60 <lcd_sharp96_clear+0x1c>)
 d48:	2300      	movs	r3, #0
 d4a:	4411      	add	r1, r2
 d4c:	54c8      	strb	r0, [r1, r3]
 d4e:	3301      	adds	r3, #1
 d50:	2b0c      	cmp	r3, #12
 d52:	d1fb      	bne.n	d4c <lcd_sharp96_clear+0x8>
 d54:	320c      	adds	r2, #12
 d56:	f5b2 6f90 	cmp.w	r2, #1152	; 0x480
 d5a:	d1f4      	bne.n	d46 <lcd_sharp96_clear+0x2>
 d5c:	4770      	bx	lr
 d5e:	bf00      	nop
 d60:	200009d4 	.word	0x200009d4

Disassembly of section .text.lcd_sharp96_put_pixel:

00000d64 <lcd_sharp96_put_pixel>:
 d64:	2960      	cmp	r1, #96	; 0x60
 d66:	bf28      	it	cs
 d68:	2160      	movcs	r1, #96	; 0x60
 d6a:	230c      	movs	r3, #12
 d6c:	2860      	cmp	r0, #96	; 0x60
 d6e:	bf28      	it	cs
 d70:	2060      	movcs	r0, #96	; 0x60
 d72:	434b      	muls	r3, r1
 d74:	b510      	push	{r4, lr}
 d76:	eb03 03d0 	add.w	r3, r3, r0, lsr #3
 d7a:	b672      	cpsid	i
 d7c:	43c0      	mvns	r0, r0
 d7e:	2401      	movs	r4, #1
 d80:	f000 0007 	and.w	r0, r0, #7
 d84:	4905      	ldr	r1, [pc, #20]	; (d9c <lcd_sharp96_put_pixel+0x38>)
 d86:	4084      	lsls	r4, r0
 d88:	b912      	cbnz	r2, d90 <lcd_sharp96_put_pixel+0x2c>
 d8a:	5cca      	ldrb	r2, [r1, r3]
 d8c:	4314      	orrs	r4, r2
 d8e:	e002      	b.n	d96 <lcd_sharp96_put_pixel+0x32>
 d90:	5cca      	ldrb	r2, [r1, r3]
 d92:	ea22 0404 	bic.w	r4, r2, r4
 d96:	54cc      	strb	r4, [r1, r3]
 d98:	b662      	cpsie	i
 d9a:	bd10      	pop	{r4, pc}
 d9c:	200009d4 	.word	0x200009d4

Disassembly of section .text.lcd_sharp96_put_string:

00000da0 <lcd_sharp96_put_string>:
 da0:	2100      	movs	r1, #0
 da2:	e92d 43f0 	stmdb	sp!, {r4, r5, r6, r7, r8, r9, lr}
 da6:	460b      	mov	r3, r1
 da8:	2601      	movs	r6, #1
 daa:	1e72      	subs	r2, r6, #1
 dac:	b292      	uxth	r2, r2
 dae:	5c82      	ldrb	r2, [r0, r2]
 db0:	2a00      	cmp	r2, #0
 db2:	d043      	beq.n	e3c <lcd_sharp96_put_string+0x9c>
 db4:	2a0a      	cmp	r2, #10
 db6:	d036      	beq.n	e26 <lcd_sharp96_put_string+0x86>
 db8:	3a20      	subs	r2, #32
 dba:	f04f 0c05 	mov.w	ip, #5
 dbe:	fb0c fc02 	mul.w	ip, ip, r2
 dc2:	2400      	movs	r4, #0
 dc4:	fa1f fc8c 	uxth.w	ip, ip
 dc8:	4622      	mov	r2, r4
 dca:	2701      	movs	r7, #1
 dcc:	40a7      	lsls	r7, r4
 dce:	2500      	movs	r5, #0
 dd0:	f8df 8070 	ldr.w	r8, [pc, #112]	; e44 <lcd_sharp96_put_string+0xa4>
 dd4:	44e0      	add	r8, ip
 dd6:	f818 8005 	ldrb.w	r8, [r8, r5]
 dda:	ea18 0f07 	tst.w	r8, r7
 dde:	bf18      	it	ne
 de0:	f042 0201 	orrne.w	r2, r2, #1
 de4:	3501      	adds	r5, #1
 de6:	0052      	lsls	r2, r2, #1
 de8:	2d05      	cmp	r5, #5
 dea:	b2d2      	uxtb	r2, r2
 dec:	d1f0      	bne.n	dd0 <lcd_sharp96_put_string+0x30>
 dee:	4d14      	ldr	r5, [pc, #80]	; (e40 <lcd_sharp96_put_string+0xa0>)
 df0:	0092      	lsls	r2, r2, #2
 df2:	eb03 0805 	add.w	r8, r3, r5
 df6:	250c      	movs	r5, #12
 df8:	fb05 f704 	mul.w	r7, r5, r4
 dfc:	b2d2      	uxtb	r2, r2
 dfe:	3401      	adds	r4, #1
 e00:	ea6f 0902 	mvn.w	r9, r2
 e04:	2c08      	cmp	r4, #8
 e06:	f808 9007 	strb.w	r9, [r8, r7]
 e0a:	d1de      	bne.n	dca <lcd_sharp96_put_string+0x2a>
 e0c:	3101      	adds	r1, #1
 e0e:	b289      	uxth	r1, r1
 e10:	fbb1 f2f5 	udiv	r2, r1, r5
 e14:	fb05 1512 	mls	r5, r5, r2, r1
 e18:	b2ad      	uxth	r5, r5
 e1a:	b10d      	cbz	r5, e20 <lcd_sharp96_put_string+0x80>
 e1c:	3301      	adds	r3, #1
 e1e:	e000      	b.n	e22 <lcd_sharp96_put_string+0x82>
 e20:	3361      	adds	r3, #97	; 0x61
 e22:	b29b      	uxth	r3, r3
 e24:	e007      	b.n	e36 <lcd_sharp96_put_string+0x96>
 e26:	220c      	movs	r2, #12
 e28:	fbb3 f3f2 	udiv	r3, r3, r2
 e2c:	4353      	muls	r3, r2
 e2e:	b29b      	uxth	r3, r3
 e30:	3360      	adds	r3, #96	; 0x60
 e32:	b29b      	uxth	r3, r3
 e34:	2100      	movs	r1, #0
 e36:	3601      	adds	r6, #1
 e38:	b2b6      	uxth	r6, r6
 e3a:	e7b6      	b.n	daa <lcd_sharp96_put_string+0xa>
 e3c:	e8bd 83f0 	ldmia.w	sp!, {r4, r5, r6, r7, r8, r9, pc}
 e40:	200009d4 	.word	0x200009d4
 e44:	000002e0 	.word	0x000002e0

Disassembly of section .text.timer_init:

00000e48 <timer_init>:
 e48:	b510      	push	{r4, lr}
 e4a:	2300      	movs	r3, #0
 e4c:	4919      	ldr	r1, [pc, #100]	; (eb4 <timer_init+0x6c>)
 e4e:	f44f 6280 	mov.w	r2, #1024	; 0x400
 e52:	f821 2013 	strh.w	r2, [r1, r3, lsl #1]
 e56:	4918      	ldr	r1, [pc, #96]	; (eb8 <timer_init+0x70>)
 e58:	f821 2013 	strh.w	r2, [r1, r3, lsl #1]
 e5c:	4917      	ldr	r1, [pc, #92]	; (ebc <timer_init+0x74>)
 e5e:	2200      	movs	r2, #0
 e60:	f821 2013 	strh.w	r2, [r1, r3, lsl #1]
 e64:	3301      	adds	r3, #1
 e66:	2b04      	cmp	r3, #4
 e68:	d1f0      	bne.n	e4c <timer_init+0x4>
 e6a:	4b15      	ldr	r3, [pc, #84]	; (ec0 <timer_init+0x78>)
 e6c:	4c15      	ldr	r4, [pc, #84]	; (ec4 <timer_init+0x7c>)
 e6e:	601a      	str	r2, [r3, #0]
 e70:	4b15      	ldr	r3, [pc, #84]	; (ec8 <timer_init+0x80>)
 e72:	4816      	ldr	r0, [pc, #88]	; (ecc <timer_init+0x84>)
 e74:	681b      	ldr	r3, [r3, #0]
 e76:	699b      	ldr	r3, [r3, #24]
 e78:	4798      	blx	r3
 e7a:	6823      	ldr	r3, [r4, #0]
 e7c:	4814      	ldr	r0, [pc, #80]	; (ed0 <timer_init+0x88>)
 e7e:	68db      	ldr	r3, [r3, #12]
 e80:	2122      	movs	r1, #34	; 0x22
 e82:	4798      	blx	r3
 e84:	6823      	ldr	r3, [r4, #0]
 e86:	4812      	ldr	r0, [pc, #72]	; (ed0 <timer_init+0x88>)
 e88:	6b9b      	ldr	r3, [r3, #56]	; 0x38
 e8a:	f241 3288 	movw	r2, #5000	; 0x1388
 e8e:	21ff      	movs	r1, #255	; 0xff
 e90:	4798      	blx	r3
 e92:	4b10      	ldr	r3, [pc, #64]	; (ed4 <timer_init+0x8c>)
 e94:	681b      	ldr	r3, [r3, #0]
 e96:	2023      	movs	r0, #35	; 0x23
 e98:	681b      	ldr	r3, [r3, #0]
 e9a:	4798      	blx	r3
 e9c:	6823      	ldr	r3, [r4, #0]
 e9e:	480c      	ldr	r0, [pc, #48]	; (ed0 <timer_init+0x88>)
 ea0:	6cdb      	ldr	r3, [r3, #76]	; 0x4c
 ea2:	2101      	movs	r1, #1
 ea4:	4798      	blx	r3
 ea6:	6823      	ldr	r3, [r4, #0]
 ea8:	4809      	ldr	r0, [pc, #36]	; (ed0 <timer_init+0x88>)
 eaa:	685b      	ldr	r3, [r3, #4]
 eac:	21ff      	movs	r1, #255	; 0xff
 eae:	4798      	blx	r3
 eb0:	bd10      	pop	{r4, pc}
 eb2:	bf00      	nop
 eb4:	20002de8 	.word	0x20002de8
 eb8:	20002ddc 	.word	0x20002ddc
 ebc:	20002dd4 	.word	0x20002dd4
 ec0:	20002de4 	.word	0x20002de4
 ec4:	0100003c 	.word	0x0100003c
 ec8:	01000044 	.word	0x01000044
 ecc:	f0000400 	.word	0xf0000400
 ed0:	40030000 	.word	0x40030000
 ed4:	01000048 	.word	0x01000048

Disassembly of section .text.Timer0A_Handler:

00000ed8 <Timer0A_Handler>:
 ed8:	b508      	push	{r3, lr}
 eda:	2300      	movs	r3, #0
 edc:	4a11      	ldr	r2, [pc, #68]	; (f24 <Timer0A_Handler+0x4c>)
 ede:	f832 1013 	ldrh.w	r1, [r2, r3, lsl #1]
 ee2:	b289      	uxth	r1, r1
 ee4:	b129      	cbz	r1, ef2 <Timer0A_Handler+0x1a>
 ee6:	f832 1013 	ldrh.w	r1, [r2, r3, lsl #1]
 eea:	b289      	uxth	r1, r1
 eec:	3901      	subs	r1, #1
 eee:	b289      	uxth	r1, r1
 ef0:	e007      	b.n	f02 <Timer0A_Handler+0x2a>
 ef2:	490d      	ldr	r1, [pc, #52]	; (f28 <Timer0A_Handler+0x50>)
 ef4:	f831 1013 	ldrh.w	r1, [r1, r3, lsl #1]
 ef8:	b289      	uxth	r1, r1
 efa:	f822 1013 	strh.w	r1, [r2, r3, lsl #1]
 efe:	4a0b      	ldr	r2, [pc, #44]	; (f2c <Timer0A_Handler+0x54>)
 f00:	2101      	movs	r1, #1
 f02:	f822 1013 	strh.w	r1, [r2, r3, lsl #1]
 f06:	3301      	adds	r3, #1
 f08:	2b04      	cmp	r3, #4
 f0a:	d1e7      	bne.n	edc <Timer0A_Handler+0x4>
 f0c:	4b08      	ldr	r3, [pc, #32]	; (f30 <Timer0A_Handler+0x58>)
 f0e:	4809      	ldr	r0, [pc, #36]	; (f34 <Timer0A_Handler+0x5c>)
 f10:	681a      	ldr	r2, [r3, #0]
 f12:	3201      	adds	r2, #1
 f14:	601a      	str	r2, [r3, #0]
 f16:	4b08      	ldr	r3, [pc, #32]	; (f38 <Timer0A_Handler+0x60>)
 f18:	681b      	ldr	r3, [r3, #0]
 f1a:	2101      	movs	r1, #1
 f1c:	681b      	ldr	r3, [r3, #0]
 f1e:	4798      	blx	r3
 f20:	bd08      	pop	{r3, pc}
 f22:	bf00      	nop
 f24:	20002de8 	.word	0x20002de8
 f28:	20002ddc 	.word	0x20002ddc
 f2c:	20002dd4 	.word	0x20002dd4
 f30:	20002de4 	.word	0x20002de4
 f34:	40030000 	.word	0x40030000
 f38:	0100003c 	.word	0x0100003c

Disassembly of section .text.timer_get_time:

00000f3c <timer_get_time>:
 f3c:	b082      	sub	sp, #8
 f3e:	b672      	cpsid	i
 f40:	4b04      	ldr	r3, [pc, #16]	; (f54 <timer_get_time+0x18>)
 f42:	681b      	ldr	r3, [r3, #0]
 f44:	9301      	str	r3, [sp, #4]
 f46:	b662      	cpsie	i
 f48:	9801      	ldr	r0, [sp, #4]
 f4a:	230a      	movs	r3, #10
 f4c:	fbb0 f0f3 	udiv	r0, r0, r3
 f50:	b002      	add	sp, #8
 f52:	4770      	bx	lr
 f54:	20002de4 	.word	0x20002de4

Disassembly of section .text.timer_delay_ms:

00000f58 <timer_delay_ms>:
 f58:	b513      	push	{r0, r1, r4, lr}
 f5a:	4604      	mov	r4, r0
 f5c:	f7ff ffee 	bl	f3c <timer_get_time>
 f60:	4420      	add	r0, r4
 f62:	9001      	str	r0, [sp, #4]
 f64:	9c01      	ldr	r4, [sp, #4]
 f66:	f7ff ffe9 	bl	f3c <timer_get_time>
 f6a:	4284      	cmp	r4, r0
 f6c:	d902      	bls.n	f74 <timer_delay_ms+0x1c>
 f6e:	f000 f8e5 	bl	113c <sleep>
 f72:	e7f7      	b.n	f64 <timer_delay_ms+0xc>
 f74:	b002      	add	sp, #8
 f76:	bd10      	pop	{r4, pc}

Disassembly of section .text.i2c_0_init:

00000f78 <i2c_0_init>:
 f78:	b538      	push	{r3, r4, r5, lr}
 f7a:	4d13      	ldr	r5, [pc, #76]	; (fc8 <i2c_0_init+0x50>)
 f7c:	4c13      	ldr	r4, [pc, #76]	; (fcc <i2c_0_init+0x54>)
 f7e:	682b      	ldr	r3, [r5, #0]
 f80:	4620      	mov	r0, r4
 f82:	699b      	ldr	r3, [r3, #24]
 f84:	4798      	blx	r3
 f86:	682b      	ldr	r3, [r5, #0]
 f88:	4620      	mov	r0, r4
 f8a:	4c11      	ldr	r4, [pc, #68]	; (fd0 <i2c_0_init+0x58>)
 f8c:	695b      	ldr	r3, [r3, #20]
 f8e:	4798      	blx	r3
 f90:	6823      	ldr	r3, [r4, #0]
 f92:	2004      	movs	r0, #4
 f94:	6e9b      	ldr	r3, [r3, #104]	; 0x68
 f96:	4798      	blx	r3
 f98:	6823      	ldr	r3, [r4, #0]
 f9a:	4c0e      	ldr	r4, [pc, #56]	; (fd4 <i2c_0_init+0x5c>)
 f9c:	6e9b      	ldr	r3, [r3, #104]	; 0x68
 f9e:	2008      	movs	r0, #8
 fa0:	4798      	blx	r3
 fa2:	4620      	mov	r0, r4
 fa4:	2104      	movs	r1, #4
 fa6:	f000 fae7 	bl	1578 <GPIOPinTypeI2CSCL>
 faa:	4620      	mov	r0, r4
 fac:	2108      	movs	r1, #8
 fae:	f000 fad5 	bl	155c <GPIOPinTypeI2C>
 fb2:	4b09      	ldr	r3, [pc, #36]	; (fd8 <i2c_0_init+0x60>)
 fb4:	681b      	ldr	r3, [r3, #0]
 fb6:	685c      	ldr	r4, [r3, #4]
 fb8:	f000 faec 	bl	1594 <SysCtlClockGet>
 fbc:	2201      	movs	r2, #1
 fbe:	4601      	mov	r1, r0
 fc0:	4806      	ldr	r0, [pc, #24]	; (fdc <i2c_0_init+0x64>)
 fc2:	47a0      	blx	r4
 fc4:	bd38      	pop	{r3, r4, r5, pc}
 fc6:	bf00      	nop
 fc8:	01000044 	.word	0x01000044
 fcc:	f0002000 	.word	0xf0002000
 fd0:	01000020 	.word	0x01000020
 fd4:	40005000 	.word	0x40005000
 fd8:	0100001c 	.word	0x0100001c
 fdc:	40020000 	.word	0x40020000

Disassembly of section .text.uart_write:

00000fe0 <uart_write>:
 fe0:	b508      	push	{r3, lr}
 fe2:	4b03      	ldr	r3, [pc, #12]	; (ff0 <uart_write+0x10>)
 fe4:	681b      	ldr	r3, [r3, #0]
 fe6:	4601      	mov	r1, r0
 fe8:	681b      	ldr	r3, [r3, #0]
 fea:	4802      	ldr	r0, [pc, #8]	; (ff4 <uart_write+0x14>)
 fec:	4798      	blx	r3
 fee:	bd08      	pop	{r3, pc}
 ff0:	01000014 	.word	0x01000014
 ff4:	4000c000 	.word	0x4000c000

Disassembly of section .text.uart_init:

00000ff8 <uart_init>:
     ff8:	b538      	push	{r3, r4, r5, lr}
     ffa:	4c0e      	ldr	r4, [pc, #56]	; (1034 <uart_init+0x3c>)
     ffc:	480e      	ldr	r0, [pc, #56]	; (1038 <uart_init+0x40>)
     ffe:	6823      	ldr	r3, [r4, #0]
    1000:	699b      	ldr	r3, [r3, #24]
    1002:	4798      	blx	r3
    1004:	6823      	ldr	r3, [r4, #0]
    1006:	480d      	ldr	r0, [pc, #52]	; (103c <uart_init+0x44>)
    1008:	699b      	ldr	r3, [r3, #24]
    100a:	4798      	blx	r3
    100c:	4b0c      	ldr	r3, [pc, #48]	; (1040 <uart_init+0x48>)
    100e:	681b      	ldr	r3, [r3, #0]
    1010:	2103      	movs	r1, #3
    1012:	6d5b      	ldr	r3, [r3, #84]	; 0x54
    1014:	f04f 2040 	mov.w	r0, #1073758208	; 0x40004000
    1018:	4798      	blx	r3
    101a:	4b0a      	ldr	r3, [pc, #40]	; (1044 <uart_init+0x4c>)
    101c:	681b      	ldr	r3, [r3, #0]
    101e:	695d      	ldr	r5, [r3, #20]
    1020:	6823      	ldr	r3, [r4, #0]
    1022:	6e1b      	ldr	r3, [r3, #96]	; 0x60
    1024:	4798      	blx	r3
    1026:	f44f 32e1 	mov.w	r2, #115200	; 0x1c200
    102a:	4601      	mov	r1, r0
    102c:	2360      	movs	r3, #96	; 0x60
    102e:	4806      	ldr	r0, [pc, #24]	; (1048 <uart_init+0x50>)
    1030:	47a8      	blx	r5
    1032:	bd38      	pop	{r3, r4, r5, pc}
    1034:	01000044 	.word	0x01000044
    1038:	f0001800 	.word	0xf0001800
    103c:	f0000800 	.word	0xf0000800
    1040:	01000020 	.word	0x01000020
    1044:	01000014 	.word	0x01000014
    1048:	4000c000 	.word	0x4000c000

Disassembly of section .text.spi_delay:

0000104c <spi_delay>:
    104c:	bf00      	nop
    104e:	bf00      	nop
    1050:	bf00      	nop
    1052:	bf00      	nop
    1054:	4770      	bx	lr

Disassembly of section .text.spib:

00001058 <spib>:
    1058:	b570      	push	{r4, r5, r6, lr}
    105a:	4604      	mov	r4, r0
    105c:	2508      	movs	r5, #8
    105e:	4b18      	ldr	r3, [pc, #96]	; (10c0 <spib+0x68>)
    1060:	4e17      	ldr	r6, [pc, #92]	; (10c0 <spib+0x68>)
    1062:	681b      	ldr	r3, [r3, #0]
    1064:	4817      	ldr	r0, [pc, #92]	; (10c4 <spib+0x6c>)
    1066:	681b      	ldr	r3, [r3, #0]
    1068:	f014 0f80 	tst.w	r4, #128	; 0x80
    106c:	f04f 0180 	mov.w	r1, #128	; 0x80
    1070:	bf14      	ite	ne
    1072:	460a      	movne	r2, r1
    1074:	2200      	moveq	r2, #0
    1076:	4798      	blx	r3
    1078:	f7ff ffe8 	bl	104c <spi_delay>
    107c:	6833      	ldr	r3, [r6, #0]
    107e:	4811      	ldr	r0, [pc, #68]	; (10c4 <spib+0x6c>)
    1080:	681b      	ldr	r3, [r3, #0]
    1082:	2110      	movs	r1, #16
    1084:	460a      	mov	r2, r1
    1086:	4798      	blx	r3
    1088:	f7ff ffe0 	bl	104c <spi_delay>
    108c:	2140      	movs	r1, #64	; 0x40
    108e:	480d      	ldr	r0, [pc, #52]	; (10c4 <spib+0x6c>)
    1090:	f000 fa61 	bl	1556 <GPIOPinRead>
    1094:	0643      	lsls	r3, r0, #25
    1096:	6833      	ldr	r3, [r6, #0]
    1098:	480a      	ldr	r0, [pc, #40]	; (10c4 <spib+0x6c>)
    109a:	681b      	ldr	r3, [r3, #0]
    109c:	ea4f 0444 	mov.w	r4, r4, lsl #1
    10a0:	f04f 0110 	mov.w	r1, #16
    10a4:	f04f 0200 	mov.w	r2, #0
    10a8:	b2e4      	uxtb	r4, r4
    10aa:	bf48      	it	mi
    10ac:	f044 0401 	orrmi.w	r4, r4, #1
    10b0:	4798      	blx	r3
    10b2:	f7ff ffcb 	bl	104c <spi_delay>
    10b6:	3d01      	subs	r5, #1
    10b8:	d1d1      	bne.n	105e <spib+0x6>
    10ba:	4620      	mov	r0, r4
    10bc:	bd70      	pop	{r4, r5, r6, pc}
    10be:	bf00      	nop
    10c0:	01000020 	.word	0x01000020
    10c4:	40005000 	.word	0x40005000

Disassembly of section .text.spi_init:

000010c8 <spi_init>:
    10c8:	b510      	push	{r4, lr}
    10ca:	4c0c      	ldr	r4, [pc, #48]	; (10fc <spi_init+0x34>)
    10cc:	480c      	ldr	r0, [pc, #48]	; (1100 <spi_init+0x38>)
    10ce:	6823      	ldr	r3, [r4, #0]
    10d0:	2190      	movs	r1, #144	; 0x90
    10d2:	6bdb      	ldr	r3, [r3, #60]	; 0x3c
    10d4:	4798      	blx	r3
    10d6:	6823      	ldr	r3, [r4, #0]
    10d8:	4809      	ldr	r0, [pc, #36]	; (1100 <spi_init+0x38>)
    10da:	6b9b      	ldr	r3, [r3, #56]	; 0x38
    10dc:	2140      	movs	r1, #64	; 0x40
    10de:	4798      	blx	r3
    10e0:	6823      	ldr	r3, [r4, #0]
    10e2:	4807      	ldr	r0, [pc, #28]	; (1100 <spi_init+0x38>)
    10e4:	695c      	ldr	r4, [r3, #20]
    10e6:	2140      	movs	r1, #64	; 0x40
    10e8:	2201      	movs	r2, #1
    10ea:	230a      	movs	r3, #10
    10ec:	47a0      	blx	r4
    10ee:	240a      	movs	r4, #10
    10f0:	20ff      	movs	r0, #255	; 0xff
    10f2:	f7ff ffb1 	bl	1058 <spib>
    10f6:	3c01      	subs	r4, #1
    10f8:	d1fa      	bne.n	10f0 <spi_init+0x28>
    10fa:	bd10      	pop	{r4, pc}
    10fc:	01000020 	.word	0x01000020
    1100:	40005000 	.word	0x40005000

Disassembly of section .text.adc_init:

00001104 <adc_init>:
    1104:	4770      	bx	lr

Disassembly of section .text.sys_tick_init:

00001108 <sys_tick_init>:
    1108:	b510      	push	{r4, lr}
    110a:	4c08      	ldr	r4, [pc, #32]	; (112c <sys_tick_init+0x24>)
    110c:	6823      	ldr	r3, [r4, #0]
    110e:	f44f 50fa 	mov.w	r0, #8000	; 0x1f40
    1112:	695b      	ldr	r3, [r3, #20]
    1114:	4798      	blx	r3
    1116:	6823      	ldr	r3, [r4, #0]
    1118:	68db      	ldr	r3, [r3, #12]
    111a:	4798      	blx	r3
    111c:	6823      	ldr	r3, [r4, #0]
    111e:	685b      	ldr	r3, [r3, #4]
    1120:	4798      	blx	r3
    1122:	4b03      	ldr	r3, [pc, #12]	; (1130 <sys_tick_init+0x28>)
    1124:	681b      	ldr	r3, [r3, #0]
    1126:	685b      	ldr	r3, [r3, #4]
    1128:	4798      	blx	r3
    112a:	bd10      	pop	{r4, pc}
    112c:	01000038 	.word	0x01000038
    1130:	01000048 	.word	0x01000048

Disassembly of section .text.__get_MSP:

00001134 <__get_MSP>:
    1134:	f3ef 8008 	mrs	r0, MSP
    1138:	4600      	mov	r0, r0
    113a:	4770      	bx	lr

Disassembly of section .text.sleep:

0000113c <sleep>:
    113c:	bf30      	wfi
    113e:	4770      	bx	lr

Disassembly of section .text.Default_Handler:

00001140 <Default_Handler>:
    1140:	4668      	mov	r0, sp
    1142:	f020 0107 	bic.w	r1, r0, #7
    1146:	468d      	mov	sp, r1
    1148:	bf00      	nop
    114a:	e7fd      	b.n	1148 <Default_Handler+0x8>

Disassembly of section .text.HardFault_Handler:

0000114c <HardFault_Handler>:
    114c:	bf00      	nop
    114e:	e7fd      	b.n	114c <HardFault_Handler>

Disassembly of section .text._reset_init:

00001150 <_reset_init>:
    1150:	4a09      	ldr	r2, [pc, #36]	; (1178 <_reset_init+0x28>)
    1152:	480a      	ldr	r0, [pc, #40]	; (117c <_reset_init+0x2c>)
    1154:	1a80      	subs	r0, r0, r2
    1156:	1080      	asrs	r0, r0, #2
    1158:	2300      	movs	r3, #0
    115a:	4283      	cmp	r3, r0
    115c:	d006      	beq.n	116c <_reset_init+0x1c>
    115e:	4908      	ldr	r1, [pc, #32]	; (1180 <_reset_init+0x30>)
    1160:	f851 1023 	ldr.w	r1, [r1, r3, lsl #2]
    1164:	f842 1023 	str.w	r1, [r2, r3, lsl #2]
    1168:	3301      	adds	r3, #1
    116a:	e7f6      	b.n	115a <_reset_init+0xa>
    116c:	f000 f934 	bl	13d8 <FPUEnable>
    1170:	f000 f93a 	bl	13e8 <FPUStackingDisable>
    1174:	f7ff bc32 	b.w	9dc <main>
    1178:	20000000 	.word	0x20000000
    117c:	20000000 	.word	0x20000000
    1180:	20000000 	.word	0x20000000
    1184:	f3af 8000 	nop.w

Disassembly of section .text.sytem_clock_init:

00001188 <sytem_clock_init>:
    1188:	b508      	push	{r3, lr}
    118a:	4b03      	ldr	r3, [pc, #12]	; (1198 <sytem_clock_init+0x10>)
    118c:	4803      	ldr	r0, [pc, #12]	; (119c <sytem_clock_init+0x14>)
    118e:	681b      	ldr	r3, [r3, #0]
    1190:	6ddb      	ldr	r3, [r3, #92]	; 0x5c
    1192:	4798      	blx	r3
    1194:	bd08      	pop	{r3, pc}
    1196:	bf00      	nop
    1198:	01000044 	.word	0x01000044
    119c:	01c00540 	.word	0x01c00540

Disassembly of section .text.lib_low_level_init:

000011a0 <lib_low_level_init>:
    11a0:	b508      	push	{r3, lr}
    11a2:	f7ff fff1 	bl	1188 <sytem_clock_init>
    11a6:	4b0c      	ldr	r3, [pc, #48]	; (11d8 <lib_low_level_init+0x38>)
    11a8:	681b      	ldr	r3, [r3, #0]
    11aa:	681b      	ldr	r3, [r3, #0]
    11ac:	4798      	blx	r3
    11ae:	f000 f837 	bl	1220 <gpio_init>
    11b2:	f7ff ff21 	bl	ff8 <uart_init>
    11b6:	f7ff fe47 	bl	e48 <timer_init>
    11ba:	f7ff fcf3 	bl	ba4 <pwm_init>
    11be:	f7ff fedb 	bl	f78 <i2c_0_init>
    11c2:	f7ff ff81 	bl	10c8 <spi_init>
    11c6:	f7ff ff9d 	bl	1104 <adc_init>
    11ca:	f000 f8dd 	bl	1388 <lcd_init>
    11ce:	e8bd 4008 	ldmia.w	sp!, {r3, lr}
    11d2:	f7ff bd47 	b.w	c64 <lcd_sharp96_init>
    11d6:	bf00      	nop
    11d8:	01000078 	.word	0x01000078

Disassembly of section .text.led_off:

000011dc <led_off>:
    11dc:	07c2      	lsls	r2, r0, #31
    11de:	b510      	push	{r4, lr}
    11e0:	4604      	mov	r4, r0
    11e2:	d506      	bpl.n	11f2 <led_off+0x16>
    11e4:	4b0c      	ldr	r3, [pc, #48]	; (1218 <led_off+0x3c>)
    11e6:	480d      	ldr	r0, [pc, #52]	; (121c <led_off+0x40>)
    11e8:	681b      	ldr	r3, [r3, #0]
    11ea:	2102      	movs	r1, #2
    11ec:	681b      	ldr	r3, [r3, #0]
    11ee:	2200      	movs	r2, #0
    11f0:	4798      	blx	r3
    11f2:	07a3      	lsls	r3, r4, #30
    11f4:	d506      	bpl.n	1204 <led_off+0x28>
    11f6:	4b08      	ldr	r3, [pc, #32]	; (1218 <led_off+0x3c>)
    11f8:	4808      	ldr	r0, [pc, #32]	; (121c <led_off+0x40>)
    11fa:	681b      	ldr	r3, [r3, #0]
    11fc:	2108      	movs	r1, #8
    11fe:	681b      	ldr	r3, [r3, #0]
    1200:	2200      	movs	r2, #0
    1202:	4798      	blx	r3
    1204:	0760      	lsls	r0, r4, #29
    1206:	d506      	bpl.n	1216 <led_off+0x3a>
    1208:	4b03      	ldr	r3, [pc, #12]	; (1218 <led_off+0x3c>)
    120a:	4804      	ldr	r0, [pc, #16]	; (121c <led_off+0x40>)
    120c:	681b      	ldr	r3, [r3, #0]
    120e:	2104      	movs	r1, #4
    1210:	681b      	ldr	r3, [r3, #0]
    1212:	2200      	movs	r2, #0
    1214:	4798      	blx	r3
    1216:	bd10      	pop	{r4, pc}
    1218:	01000020 	.word	0x01000020
    121c:	40025000 	.word	0x40025000

Disassembly of section .text.gpio_init:

00001220 <gpio_init>:
    1220:	b570      	push	{r4, r5, r6, lr}
    1222:	4c1c      	ldr	r4, [pc, #112]	; (1294 <gpio_init+0x74>)
    1224:	481c      	ldr	r0, [pc, #112]	; (1298 <gpio_init+0x78>)
    1226:	6823      	ldr	r3, [r4, #0]
    1228:	4d1c      	ldr	r5, [pc, #112]	; (129c <gpio_init+0x7c>)
    122a:	699b      	ldr	r3, [r3, #24]
    122c:	4798      	blx	r3
    122e:	6823      	ldr	r3, [r4, #0]
    1230:	481b      	ldr	r0, [pc, #108]	; (12a0 <gpio_init+0x80>)
    1232:	699b      	ldr	r3, [r3, #24]
    1234:	4798      	blx	r3
    1236:	6823      	ldr	r3, [r4, #0]
    1238:	481a      	ldr	r0, [pc, #104]	; (12a4 <gpio_init+0x84>)
    123a:	699b      	ldr	r3, [r3, #24]
    123c:	4798      	blx	r3
    123e:	6823      	ldr	r3, [r4, #0]
    1240:	4819      	ldr	r0, [pc, #100]	; (12a8 <gpio_init+0x88>)
    1242:	699b      	ldr	r3, [r3, #24]
    1244:	4798      	blx	r3
    1246:	6823      	ldr	r3, [r4, #0]
    1248:	4818      	ldr	r0, [pc, #96]	; (12ac <gpio_init+0x8c>)
    124a:	699b      	ldr	r3, [r3, #24]
    124c:	4798      	blx	r3
    124e:	6823      	ldr	r3, [r4, #0]
    1250:	4817      	ldr	r0, [pc, #92]	; (12b0 <gpio_init+0x90>)
    1252:	699b      	ldr	r3, [r3, #24]
    1254:	4c17      	ldr	r4, [pc, #92]	; (12b4 <gpio_init+0x94>)
    1256:	4798      	blx	r3
    1258:	682b      	ldr	r3, [r5, #0]
    125a:	4620      	mov	r0, r4
    125c:	6bdb      	ldr	r3, [r3, #60]	; 0x3c
    125e:	210e      	movs	r1, #14
    1260:	4798      	blx	r3
    1262:	682b      	ldr	r3, [r5, #0]
    1264:	4620      	mov	r0, r4
    1266:	6b9b      	ldr	r3, [r3, #56]	; 0x38
    1268:	2111      	movs	r1, #17
    126a:	4798      	blx	r3
    126c:	682b      	ldr	r3, [r5, #0]
    126e:	4620      	mov	r0, r4
    1270:	695e      	ldr	r6, [r3, #20]
    1272:	2110      	movs	r1, #16
    1274:	2201      	movs	r2, #1
    1276:	230a      	movs	r3, #10
    1278:	47b0      	blx	r6
    127a:	682b      	ldr	r3, [r5, #0]
    127c:	2101      	movs	r1, #1
    127e:	695d      	ldr	r5, [r3, #20]
    1280:	4620      	mov	r0, r4
    1282:	460a      	mov	r2, r1
    1284:	230a      	movs	r3, #10
    1286:	47a8      	blx	r5
    1288:	2007      	movs	r0, #7
    128a:	e8bd 4070 	ldmia.w	sp!, {r4, r5, r6, lr}
    128e:	f7ff bfa5 	b.w	11dc <led_off>
    1292:	bf00      	nop
    1294:	01000044 	.word	0x01000044
    1298:	f0000800 	.word	0xf0000800
    129c:	01000020 	.word	0x01000020
    12a0:	f0000801 	.word	0xf0000801
    12a4:	f0000802 	.word	0xf0000802
    12a8:	f0000803 	.word	0xf0000803
    12ac:	f0000804 	.word	0xf0000804
    12b0:	f0000805 	.word	0xf0000805
    12b4:	40025000 	.word	0x40025000

Disassembly of section .text.LCD_CS_HIGH:

000012b8 <LCD_CS_HIGH>:
    12b8:	b508      	push	{r3, lr}
    12ba:	4b06      	ldr	r3, [pc, #24]	; (12d4 <LCD_CS_HIGH+0x1c>)
    12bc:	4806      	ldr	r0, [pc, #24]	; (12d8 <LCD_CS_HIGH+0x20>)
    12be:	681b      	ldr	r3, [r3, #0]
    12c0:	2120      	movs	r1, #32
    12c2:	681b      	ldr	r3, [r3, #0]
    12c4:	460a      	mov	r2, r1
    12c6:	4798      	blx	r3
    12c8:	2365      	movs	r3, #101	; 0x65
    12ca:	3b01      	subs	r3, #1
    12cc:	d001      	beq.n	12d2 <LCD_CS_HIGH+0x1a>
    12ce:	bf00      	nop
    12d0:	e7fb      	b.n	12ca <LCD_CS_HIGH+0x12>
    12d2:	bd08      	pop	{r3, pc}
    12d4:	01000020 	.word	0x01000020
    12d8:	40024000 	.word	0x40024000

Disassembly of section .text.LCD_CS_LOW:

000012dc <LCD_CS_LOW>:
    12dc:	b508      	push	{r3, lr}
    12de:	4b06      	ldr	r3, [pc, #24]	; (12f8 <LCD_CS_LOW+0x1c>)
    12e0:	4806      	ldr	r0, [pc, #24]	; (12fc <LCD_CS_LOW+0x20>)
    12e2:	681b      	ldr	r3, [r3, #0]
    12e4:	2120      	movs	r1, #32
    12e6:	681b      	ldr	r3, [r3, #0]
    12e8:	2200      	movs	r2, #0
    12ea:	4798      	blx	r3
    12ec:	2365      	movs	r3, #101	; 0x65
    12ee:	3b01      	subs	r3, #1
    12f0:	d001      	beq.n	12f6 <LCD_CS_LOW+0x1a>
    12f2:	bf00      	nop
    12f4:	e7fb      	b.n	12ee <LCD_CS_LOW+0x12>
    12f6:	bd08      	pop	{r3, pc}
    12f8:	01000020 	.word	0x01000020
    12fc:	40024000 	.word	0x40024000

Disassembly of section .text.reverse:

00001300 <reverse>:
    1300:	4b04      	ldr	r3, [pc, #16]	; (1314 <reverse+0x14>)
    1302:	f000 020f 	and.w	r2, r0, #15
    1306:	0900      	lsrs	r0, r0, #4
    1308:	5c9a      	ldrb	r2, [r3, r2]
    130a:	5c18      	ldrb	r0, [r3, r0]
    130c:	0112      	lsls	r2, r2, #4
    130e:	b2d2      	uxtb	r2, r2
    1310:	4310      	orrs	r0, r2
    1312:	4770      	bx	lr
    1314:	000004ac 	.word	0x000004ac

Disassembly of section .text.lcd_send_mem:

00001318 <lcd_send_mem>:
    1318:	b5f8      	push	{r3, r4, r5, r6, r7, lr}
    131a:	4607      	mov	r7, r0
    131c:	f7ff ffcc 	bl	12b8 <LCD_CS_HIGH>
    1320:	20c0      	movs	r0, #192	; 0xc0
    1322:	f7ff fe99 	bl	1058 <spib>
    1326:	2400      	movs	r4, #0
    1328:	1c66      	adds	r6, r4, #1
    132a:	b2f0      	uxtb	r0, r6
    132c:	f7ff ffe8 	bl	1300 <reverse>
    1330:	f7ff fe92 	bl	1058 <spib>
    1334:	230c      	movs	r3, #12
    1336:	fb03 7404 	mla	r4, r3, r4, r7
    133a:	2500      	movs	r5, #0
    133c:	5d60      	ldrb	r0, [r4, r5]
    133e:	3501      	adds	r5, #1
    1340:	f7ff fe8a 	bl	1058 <spib>
    1344:	2d0c      	cmp	r5, #12
    1346:	d1f9      	bne.n	133c <lcd_send_mem+0x24>
    1348:	2000      	movs	r0, #0
    134a:	f7ff fe85 	bl	1058 <spib>
    134e:	2e60      	cmp	r6, #96	; 0x60
    1350:	4634      	mov	r4, r6
    1352:	d1e9      	bne.n	1328 <lcd_send_mem+0x10>
    1354:	2000      	movs	r0, #0
    1356:	f7ff fe7f 	bl	1058 <spib>
    135a:	23c9      	movs	r3, #201	; 0xc9
    135c:	3b01      	subs	r3, #1
    135e:	d001      	beq.n	1364 <lcd_send_mem+0x4c>
    1360:	bf00      	nop
    1362:	e7fb      	b.n	135c <lcd_send_mem+0x44>
    1364:	e8bd 40f8 	ldmia.w	sp!, {r3, r4, r5, r6, r7, lr}
    1368:	f7ff bfb8 	b.w	12dc <LCD_CS_LOW>

Disassembly of section .text.lcd_clear_screen:

0000136c <lcd_clear_screen>:
    136c:	b510      	push	{r4, lr}
    136e:	2200      	movs	r2, #0
    1370:	2300      	movs	r3, #0
    1372:	1884      	adds	r4, r0, r2
    1374:	54e1      	strb	r1, [r4, r3]
    1376:	3301      	adds	r3, #1
    1378:	2b0c      	cmp	r3, #12
    137a:	d1fa      	bne.n	1372 <lcd_clear_screen+0x6>
    137c:	320c      	adds	r2, #12
    137e:	f5b2 6f90 	cmp.w	r2, #1152	; 0x480
    1382:	d1f5      	bne.n	1370 <lcd_clear_screen+0x4>
    1384:	bd10      	pop	{r4, pc}

Disassembly of section .text.lcd_init:

00001388 <lcd_init>:
    1388:	b538      	push	{r3, r4, r5, lr}
    138a:	4c0f      	ldr	r4, [pc, #60]	; (13c8 <lcd_init+0x40>)
    138c:	480f      	ldr	r0, [pc, #60]	; (13cc <lcd_init+0x44>)
    138e:	6823      	ldr	r3, [r4, #0]
    1390:	4d0f      	ldr	r5, [pc, #60]	; (13d0 <lcd_init+0x48>)
    1392:	6bdb      	ldr	r3, [r3, #60]	; 0x3c
    1394:	2120      	movs	r1, #32
    1396:	4798      	blx	r3
    1398:	6823      	ldr	r3, [r4, #0]
    139a:	4628      	mov	r0, r5
    139c:	6bdb      	ldr	r3, [r3, #60]	; 0x3c
    139e:	2120      	movs	r1, #32
    13a0:	4798      	blx	r3
    13a2:	f7ff ff9b 	bl	12dc <LCD_CS_LOW>
    13a6:	6823      	ldr	r3, [r4, #0]
    13a8:	4c0a      	ldr	r4, [pc, #40]	; (13d4 <lcd_init+0x4c>)
    13aa:	681b      	ldr	r3, [r3, #0]
    13ac:	2120      	movs	r1, #32
    13ae:	4628      	mov	r0, r5
    13b0:	460a      	mov	r2, r1
    13b2:	4798      	blx	r3
    13b4:	4620      	mov	r0, r4
    13b6:	21ff      	movs	r1, #255	; 0xff
    13b8:	f7ff ffd8 	bl	136c <lcd_clear_screen>
    13bc:	4620      	mov	r0, r4
    13be:	e8bd 4038 	ldmia.w	sp!, {r3, r4, r5, lr}
    13c2:	f7ff bfa9 	b.w	1318 <lcd_send_mem>
    13c6:	bf00      	nop
    13c8:	01000020 	.word	0x01000020
    13cc:	40024000 	.word	0x40024000
    13d0:	40005000 	.word	0x40005000
    13d4:	20000064 	.word	0x20000064

Disassembly of section .text.FPUEnable:

000013d8 <FPUEnable>:
    13d8:	4b02      	ldr	r3, [pc, #8]	; (13e4 <FPUEnable+0xc>)
    13da:	681a      	ldr	r2, [r3, #0]
    13dc:	f442 0270 	orr.w	r2, r2, #15728640	; 0xf00000
    13e0:	601a      	str	r2, [r3, #0]
    13e2:	4770      	bx	lr
    13e4:	e000ed88 	.word	0xe000ed88

Disassembly of section .text.FPUStackingDisable:

000013e8 <FPUStackingDisable>:
    13e8:	4b02      	ldr	r3, [pc, #8]	; (13f4 <FPUStackingDisable+0xc>)
    13ea:	681a      	ldr	r2, [r3, #0]
    13ec:	f022 4240 	bic.w	r2, r2, #3221225472	; 0xc0000000
    13f0:	601a      	str	r2, [r3, #0]
    13f2:	4770      	bx	lr
    13f4:	e000ef34 	.word	0xe000ef34

Disassembly of section .text.GPIODirModeSet:

000013f8 <GPIODirModeSet>:
    13f8:	f8d0 3400 	ldr.w	r3, [r0, #1024]	; 0x400
    13fc:	f012 0f01 	tst.w	r2, #1
    1400:	b510      	push	{r4, lr}
    1402:	f500 6480 	add.w	r4, r0, #1024	; 0x400
    1406:	bf14      	ite	ne
    1408:	430b      	orrne	r3, r1
    140a:	438b      	biceq	r3, r1
    140c:	6023      	str	r3, [r4, #0]
    140e:	f012 0f02 	tst.w	r2, #2
    1412:	f8d0 2420 	ldr.w	r2, [r0, #1056]	; 0x420
    1416:	f500 6384 	add.w	r3, r0, #1056	; 0x420
    141a:	bf14      	ite	ne
    141c:	4311      	orrne	r1, r2
    141e:	ea22 0101 	biceq.w	r1, r2, r1
    1422:	6019      	str	r1, [r3, #0]
    1424:	bd10      	pop	{r4, pc}

Disassembly of section .text.GPIOPadConfigSet:

00001426 <GPIOPadConfigSet>:
    1426:	b5f0      	push	{r4, r5, r6, r7, lr}
    1428:	f3c2 1641 	ubfx	r6, r2, #5, #2
    142c:	2400      	movs	r4, #0
    142e:	fa41 f504 	asr.w	r5, r1, r4
    1432:	07ed      	lsls	r5, r5, #31
    1434:	d511      	bpl.n	145a <GPIOPadConfigSet+0x34>
    1436:	f8d0 7fc4 	ldr.w	r7, [r0, #4036]	; 0xfc4
    143a:	0065      	lsls	r5, r4, #1
    143c:	f04f 0c03 	mov.w	ip, #3
    1440:	fa0c fc05 	lsl.w	ip, ip, r5
    1444:	ea27 070c 	bic.w	r7, r7, ip
    1448:	f8c0 7fc4 	str.w	r7, [r0, #4036]	; 0xfc4
    144c:	f8d0 7fc4 	ldr.w	r7, [r0, #4036]	; 0xfc4
    1450:	fa06 f505 	lsl.w	r5, r6, r5
    1454:	433d      	orrs	r5, r7
    1456:	f8c0 5fc4 	str.w	r5, [r0, #4036]	; 0xfc4
    145a:	3401      	adds	r4, #1
    145c:	2c08      	cmp	r4, #8
    145e:	d1e6      	bne.n	142e <GPIOPadConfigSet+0x8>
    1460:	f8d0 4500 	ldr.w	r4, [r0, #1280]	; 0x500
    1464:	f012 0f01 	tst.w	r2, #1
    1468:	f500 65a0 	add.w	r5, r0, #1280	; 0x500
    146c:	bf14      	ite	ne
    146e:	430c      	orrne	r4, r1
    1470:	438c      	biceq	r4, r1
    1472:	602c      	str	r4, [r5, #0]
    1474:	f8d0 4504 	ldr.w	r4, [r0, #1284]	; 0x504
    1478:	f012 0f02 	tst.w	r2, #2
    147c:	f200 5504 	addw	r5, r0, #1284	; 0x504
    1480:	bf14      	ite	ne
    1482:	430c      	orrne	r4, r1
    1484:	438c      	biceq	r4, r1
    1486:	602c      	str	r4, [r5, #0]
    1488:	f8d0 4508 	ldr.w	r4, [r0, #1288]	; 0x508
    148c:	f012 0f04 	tst.w	r2, #4
    1490:	f500 65a1 	add.w	r5, r0, #1288	; 0x508
    1494:	bf14      	ite	ne
    1496:	430c      	orrne	r4, r1
    1498:	438c      	biceq	r4, r1
    149a:	602c      	str	r4, [r5, #0]
    149c:	f8d0 4518 	ldr.w	r4, [r0, #1304]	; 0x518
    14a0:	f012 0f08 	tst.w	r2, #8
    14a4:	f500 65a3 	add.w	r5, r0, #1304	; 0x518
    14a8:	bf14      	ite	ne
    14aa:	430c      	orrne	r4, r1
    14ac:	438c      	biceq	r4, r1
    14ae:	602c      	str	r4, [r5, #0]
    14b0:	f012 0f10 	tst.w	r2, #16
    14b4:	f8d0 253c 	ldr.w	r2, [r0, #1340]	; 0x53c
    14b8:	f200 543c 	addw	r4, r0, #1340	; 0x53c
    14bc:	bf14      	ite	ne
    14be:	430a      	orrne	r2, r1
    14c0:	438a      	biceq	r2, r1
    14c2:	6022      	str	r2, [r4, #0]
    14c4:	f8d0 250c 	ldr.w	r2, [r0, #1292]	; 0x50c
    14c8:	f013 0f01 	tst.w	r3, #1
    14cc:	f200 540c 	addw	r4, r0, #1292	; 0x50c
    14d0:	bf14      	ite	ne
    14d2:	430a      	orrne	r2, r1
    14d4:	438a      	biceq	r2, r1
    14d6:	6022      	str	r2, [r4, #0]
    14d8:	f8d0 2510 	ldr.w	r2, [r0, #1296]	; 0x510
    14dc:	f013 0f02 	tst.w	r3, #2
    14e0:	f500 64a2 	add.w	r4, r0, #1296	; 0x510
    14e4:	bf14      	ite	ne
    14e6:	430a      	orrne	r2, r1
    14e8:	438a      	biceq	r2, r1
    14ea:	6022      	str	r2, [r4, #0]
    14ec:	f8d0 2514 	ldr.w	r2, [r0, #1300]	; 0x514
    14f0:	f013 0f04 	tst.w	r3, #4
    14f4:	f200 5414 	addw	r4, r0, #1300	; 0x514
    14f8:	bf14      	ite	ne
    14fa:	430a      	orrne	r2, r1
    14fc:	438a      	biceq	r2, r1
    14fe:	6022      	str	r2, [r4, #0]
    1500:	f8d0 251c 	ldr.w	r2, [r0, #1308]	; 0x51c
    1504:	f013 0f08 	tst.w	r3, #8
    1508:	f200 541c 	addw	r4, r0, #1308	; 0x51c
    150c:	bf14      	ite	ne
    150e:	430a      	orrne	r2, r1
    1510:	438a      	biceq	r2, r1
    1512:	6022      	str	r2, [r4, #0]
    1514:	f8d0 2544 	ldr.w	r2, [r0, #1348]	; 0x544
    1518:	f413 7f00 	tst.w	r3, #512	; 0x200
    151c:	f200 5444 	addw	r4, r0, #1348	; 0x544
    1520:	bf14      	ite	ne
    1522:	430a      	orrne	r2, r1
    1524:	438a      	biceq	r2, r1
    1526:	6022      	str	r2, [r4, #0]
    1528:	f8d0 2540 	ldr.w	r2, [r0, #1344]	; 0x540
    152c:	f413 7f40 	tst.w	r3, #768	; 0x300
    1530:	f500 64a8 	add.w	r4, r0, #1344	; 0x540
    1534:	bf14      	ite	ne
    1536:	430a      	orrne	r2, r1
    1538:	438a      	biceq	r2, r1
    153a:	6022      	str	r2, [r4, #0]
    153c:	f500 62a5 	add.w	r2, r0, #1320	; 0x528
    1540:	b91b      	cbnz	r3, 154a <GPIOPadConfigSet+0x124>
    1542:	f8d0 3528 	ldr.w	r3, [r0, #1320]	; 0x528
    1546:	4319      	orrs	r1, r3
    1548:	e003      	b.n	1552 <GPIOPadConfigSet+0x12c>
    154a:	f8d0 3528 	ldr.w	r3, [r0, #1320]	; 0x528
    154e:	ea23 0101 	bic.w	r1, r3, r1
    1552:	6011      	str	r1, [r2, #0]
    1554:	bdf0      	pop	{r4, r5, r6, r7, pc}

Disassembly of section .text.GPIOPinRead:

00001556 <GPIOPinRead>:
    1556:	f850 0021 	ldr.w	r0, [r0, r1, lsl #2]
    155a:	4770      	bx	lr

Disassembly of section .text.GPIOPinTypeI2C:

0000155c <GPIOPinTypeI2C>:
    155c:	b570      	push	{r4, r5, r6, lr}
    155e:	2202      	movs	r2, #2
    1560:	4605      	mov	r5, r0
    1562:	460c      	mov	r4, r1
    1564:	f7ff ff48 	bl	13f8 <GPIODirModeSet>
    1568:	4628      	mov	r0, r5
    156a:	4621      	mov	r1, r4
    156c:	2201      	movs	r2, #1
    156e:	2309      	movs	r3, #9
    1570:	e8bd 4070 	ldmia.w	sp!, {r4, r5, r6, lr}
    1574:	f7ff bf57 	b.w	1426 <GPIOPadConfigSet>

Disassembly of section .text.GPIOPinTypeI2CSCL:

00001578 <GPIOPinTypeI2CSCL>:
    1578:	b570      	push	{r4, r5, r6, lr}
    157a:	2202      	movs	r2, #2
    157c:	4605      	mov	r5, r0
    157e:	460c      	mov	r4, r1
    1580:	f7ff ff3a 	bl	13f8 <GPIODirModeSet>
    1584:	4628      	mov	r0, r5
    1586:	4621      	mov	r1, r4
    1588:	2201      	movs	r2, #1
    158a:	2308      	movs	r3, #8
    158c:	e8bd 4070 	ldmia.w	sp!, {r4, r5, r6, lr}
    1590:	f7ff bf49 	b.w	1426 <GPIOPadConfigSet>

Disassembly of section .text.SysCtlClockGet:

00001594 <SysCtlClockGet>:
    1594:	4b41      	ldr	r3, [pc, #260]	; (169c <SysCtlClockGet+0x108>)
    1596:	6819      	ldr	r1, [r3, #0]
    1598:	691a      	ldr	r2, [r3, #16]
    159a:	2a00      	cmp	r2, #0
    159c:	bfb4      	ite	lt
    159e:	f002 0370 	andlt.w	r3, r2, #112	; 0x70
    15a2:	f001 0330 	andge.w	r3, r1, #48	; 0x30
    15a6:	2b20      	cmp	r3, #32
    15a8:	b570      	push	{r4, r5, r6, lr}
    15aa:	d015      	beq.n	15d8 <SysCtlClockGet+0x44>
    15ac:	d804      	bhi.n	15b8 <SysCtlClockGet+0x24>
    15ae:	b153      	cbz	r3, 15c6 <SysCtlClockGet+0x32>
    15b0:	2b10      	cmp	r3, #16
    15b2:	d171      	bne.n	1698 <SysCtlClockGet+0x104>
    15b4:	4b3a      	ldr	r3, [pc, #232]	; (16a0 <SysCtlClockGet+0x10c>)
    15b6:	e010      	b.n	15da <SysCtlClockGet+0x46>
    15b8:	2b30      	cmp	r3, #48	; 0x30
    15ba:	d00a      	beq.n	15d2 <SysCtlClockGet+0x3e>
    15bc:	2b70      	cmp	r3, #112	; 0x70
    15be:	d16b      	bne.n	1698 <SysCtlClockGet+0x104>
    15c0:	f44f 4300 	mov.w	r3, #32768	; 0x8000
    15c4:	e009      	b.n	15da <SysCtlClockGet+0x46>
    15c6:	f3c1 1084 	ubfx	r0, r1, #6, #5
    15ca:	4b36      	ldr	r3, [pc, #216]	; (16a4 <SysCtlClockGet+0x110>)
    15cc:	f853 3020 	ldr.w	r3, [r3, r0, lsl #2]
    15d0:	e003      	b.n	15da <SysCtlClockGet+0x46>
    15d2:	f247 5330 	movw	r3, #30000	; 0x7530
    15d6:	e000      	b.n	15da <SysCtlClockGet+0x46>
    15d8:	4b33      	ldr	r3, [pc, #204]	; (16a8 <SysCtlClockGet+0x114>)
    15da:	2a00      	cmp	r2, #0
    15dc:	da02      	bge.n	15e4 <SysCtlClockGet+0x50>
    15de:	f412 6f00 	tst.w	r2, #2048	; 0x800
    15e2:	e001      	b.n	15e8 <SysCtlClockGet+0x54>
    15e4:	f411 6f00 	tst.w	r1, #2048	; 0x800
    15e8:	d137      	bne.n	165a <SysCtlClockGet+0xc6>
    15ea:	4830      	ldr	r0, [pc, #192]	; (16ac <SysCtlClockGet+0x118>)
    15ec:	6804      	ldr	r4, [r0, #0]
    15ee:	6845      	ldr	r5, [r0, #4]
    15f0:	f005 061f 	and.w	r6, r5, #31
    15f4:	f3c5 2004 	ubfx	r0, r5, #8, #5
    15f8:	3601      	adds	r6, #1
    15fa:	0076      	lsls	r6, r6, #1
    15fc:	3001      	adds	r0, #1
    15fe:	4370      	muls	r0, r6
    1600:	fbb3 f0f0 	udiv	r0, r3, r0
    1604:	f3c4 2389 	ubfx	r3, r4, #10, #10
    1608:	4343      	muls	r3, r0
    160a:	f3c4 0509 	ubfx	r5, r4, #0, #10
    160e:	0a9b      	lsrs	r3, r3, #10
    1610:	fb05 3300 	mla	r3, r5, r0, r3
    1614:	4826      	ldr	r0, [pc, #152]	; (16b0 <SysCtlClockGet+0x11c>)
    1616:	6800      	ldr	r0, [r0, #0]
    1618:	f400 4070 	and.w	r0, r0, #61440	; 0xf000
    161c:	f5b0 5f40 	cmp.w	r0, #12288	; 0x3000
    1620:	f441 0180 	orr.w	r1, r1, #4194304	; 0x400000
    1624:	d013      	beq.n	164e <SysCtlClockGet+0xba>
    1626:	d807      	bhi.n	1638 <SysCtlClockGet+0xa4>
    1628:	f5b0 5f80 	cmp.w	r0, #4096	; 0x1000
    162c:	d018      	beq.n	1660 <SysCtlClockGet+0xcc>
    162e:	f5b0 5f00 	cmp.w	r0, #8192	; 0x2000
    1632:	d112      	bne.n	165a <SysCtlClockGet+0xc6>
    1634:	481f      	ldr	r0, [pc, #124]	; (16b4 <SysCtlClockGet+0x120>)
    1636:	e014      	b.n	1662 <SysCtlClockGet+0xce>
    1638:	f5b0 4fe0 	cmp.w	r0, #28672	; 0x7000
    163c:	d009      	beq.n	1652 <SysCtlClockGet+0xbe>
    163e:	f5b0 4f10 	cmp.w	r0, #36864	; 0x9000
    1642:	d008      	beq.n	1656 <SysCtlClockGet+0xc2>
    1644:	f5b0 4f80 	cmp.w	r0, #16384	; 0x4000
    1648:	d107      	bne.n	165a <SysCtlClockGet+0xc6>
    164a:	481b      	ldr	r0, [pc, #108]	; (16b8 <SysCtlClockGet+0x124>)
    164c:	e009      	b.n	1662 <SysCtlClockGet+0xce>
    164e:	481b      	ldr	r0, [pc, #108]	; (16bc <SysCtlClockGet+0x128>)
    1650:	e007      	b.n	1662 <SysCtlClockGet+0xce>
    1652:	481b      	ldr	r0, [pc, #108]	; (16c0 <SysCtlClockGet+0x12c>)
    1654:	e005      	b.n	1662 <SysCtlClockGet+0xce>
    1656:	481b      	ldr	r0, [pc, #108]	; (16c4 <SysCtlClockGet+0x130>)
    1658:	e003      	b.n	1662 <SysCtlClockGet+0xce>
    165a:	f04f 30ff 	mov.w	r0, #4294967295
    165e:	e000      	b.n	1662 <SysCtlClockGet+0xce>
    1660:	4819      	ldr	r0, [pc, #100]	; (16c8 <SysCtlClockGet+0x134>)
    1662:	024c      	lsls	r4, r1, #9
    1664:	d514      	bpl.n	1690 <SysCtlClockGet+0xfc>
    1666:	2a00      	cmp	r2, #0
    1668:	da0d      	bge.n	1686 <SysCtlClockGet+0xf2>
    166a:	0051      	lsls	r1, r2, #1
    166c:	d505      	bpl.n	167a <SysCtlClockGet+0xe6>
    166e:	0516      	lsls	r6, r2, #20
    1670:	d403      	bmi.n	167a <SysCtlClockGet+0xe6>
    1672:	005b      	lsls	r3, r3, #1
    1674:	f3c2 5286 	ubfx	r2, r2, #22, #7
    1678:	e001      	b.n	167e <SysCtlClockGet+0xea>
    167a:	f3c2 52c5 	ubfx	r2, r2, #23, #6
    167e:	3201      	adds	r2, #1
    1680:	fbb3 f3f2 	udiv	r3, r3, r2
    1684:	e004      	b.n	1690 <SysCtlClockGet+0xfc>
    1686:	f3c1 51c3 	ubfx	r1, r1, #23, #4
    168a:	3101      	adds	r1, #1
    168c:	fbb3 f3f1 	udiv	r3, r3, r1
    1690:	4283      	cmp	r3, r0
    1692:	bf38      	it	cc
    1694:	4618      	movcc	r0, r3
    1696:	bd70      	pop	{r4, r5, r6, pc}
    1698:	2000      	movs	r0, #0
    169a:	bd70      	pop	{r4, r5, r6, pc}
    169c:	400fe060 	.word	0x400fe060
    16a0:	00f42400 	.word	0x00f42400
    16a4:	000004bc 	.word	0x000004bc
    16a8:	003d0900 	.word	0x003d0900
    16ac:	400fe160 	.word	0x400fe160
    16b0:	400fe010 	.word	0x400fe010
    16b4:	03f940aa 	.word	0x03f940aa
    16b8:	02625a00 	.word	0x02625a00
    16bc:	02faf080 	.word	0x02faf080
    16c0:	017d7840 	.word	0x017d7840
    16c4:	01312d00 	.word	0x01312d00
    16c8:	04c4b400 	.word	0x04c4b400
