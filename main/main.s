	.cpu arm7tdmi
	.fpu softvfp
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 1
	.eabi_attribute 30, 2
	.eabi_attribute 18, 4
	.file	"main.c"
	.text
	.align	2
	.global	hideSprites
	.type	hideSprites, %function
hideSprites:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r2, .L5
	mov	r3, #0
.L2:
	mov	r1, #512	@ movhi
	strh	r1, [r2, r3]	@ movhi
	add	r3, r3, #8
	cmp	r3, #1024
	bne	.L2
	bx	lr
.L6:
	.align	2
.L5:
	.word	shadowOAM
	.size	hideSprites, .-hideSprites
	.align	2
	.global	initSplash
	.type	initSplash, %function
initSplash:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	str	lr, [sp, #-4]!
	mov	ip, #1024
	add	ip, ip, #4
	mov	lr, #67108864
	sub	sp, sp, #12
	mov	r0, #0
	strh	ip, [lr, #0]	@ movhi
	mov	ip, #1
	mov	r2, #160
	mov	r3, #240
	str	ip, [sp, #0]
	mov	r1, r0
	ldr	ip, .L8
	mov	lr, pc
	bx	ip
	ldr	r3, .L8+4
	mov	r2, #0
	str	r2, [r3, #0]
	add	sp, sp, #12
	ldr	lr, [sp], #4
	bx	lr
.L9:
	.align	2
.L8:
	.word	drawRect4
	.word	state
	.size	initSplash, .-initSplash
	.align	2
	.global	initInstruct
	.type	initInstruct, %function
initInstruct:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	str	lr, [sp, #-4]!
	mov	r0, #0
	sub	sp, sp, #12
	mov	ip, #5
	mov	r2, #160
	mov	r3, #240
	str	ip, [sp, #0]
	mov	r1, r0
	ldr	ip, .L11
	mov	lr, pc
	bx	ip
	ldr	r3, .L11+4
	mov	r2, #1
	str	r2, [r3, #0]
	add	sp, sp, #12
	ldr	lr, [sp], #4
	bx	lr
.L12:
	.align	2
.L11:
	.word	drawRect4
	.word	state
	.size	initInstruct, .-initInstruct
	.align	2
	.global	initGame
	.type	initGame, %function
initGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, lr}
	mov	ip, #0
	sub	sp, sp, #8
	mov	lr, #67108864
	mov	r4, #4352	@ movhi
	mov	r0, ip
	mov	r1, ip
	mov	r2, #160
	mov	r3, #240
	strh	r4, [lr, #0]	@ movhi
	str	ip, [sp, #0]
	ldr	ip, .L14
	mov	lr, pc
	bx	ip
	ldr	r3, .L14+4
	mov	r2, #2
	str	r2, [r3, #0]
	add	sp, sp, #8
	ldmfd	sp!, {r4, lr}
	bx	lr
.L15:
	.align	2
.L14:
	.word	drawRect4
	.word	state
	.size	initGame, .-initGame
	.align	2
	.global	initPause
	.type	initPause, %function
initPause:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	str	lr, [sp, #-4]!
	mov	ip, #1024
	add	ip, ip, #4
	mov	lr, #67108864
	sub	sp, sp, #12
	mov	r0, #0
	strh	ip, [lr, #0]	@ movhi
	mov	ip, #2
	mov	r2, #160
	mov	r3, #240
	str	ip, [sp, #0]
	mov	r1, r0
	ldr	ip, .L17
	mov	lr, pc
	bx	ip
	ldr	r3, .L17+4
	mov	r2, #3
	str	r2, [r3, #0]
	add	sp, sp, #12
	ldr	lr, [sp], #4
	bx	lr
.L18:
	.align	2
.L17:
	.word	drawRect4
	.word	state
	.size	initPause, .-initPause
	.align	2
	.global	initWin
	.type	initWin, %function
initWin:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	str	lr, [sp, #-4]!
	mov	ip, #1024
	add	ip, ip, #4
	mov	lr, #67108864
	sub	sp, sp, #12
	mov	r0, #0
	strh	ip, [lr, #0]	@ movhi
	mov	ip, #3
	mov	r2, #160
	mov	r3, #240
	str	ip, [sp, #0]
	mov	r1, r0
	ldr	ip, .L20
	mov	lr, pc
	bx	ip
	ldr	r3, .L20+4
	mov	r2, #4
	str	r2, [r3, #0]
	add	sp, sp, #12
	ldr	lr, [sp], #4
	bx	lr
.L21:
	.align	2
.L20:
	.word	drawRect4
	.word	state
	.size	initWin, .-initWin
	.align	2
	.global	initLose
	.type	initLose, %function
initLose:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	str	lr, [sp, #-4]!
	mov	ip, #1024
	add	ip, ip, #4
	mov	lr, #67108864
	sub	sp, sp, #12
	mov	r0, #0
	strh	ip, [lr, #0]	@ movhi
	mov	ip, #4
	mov	r2, #160
	mov	r3, #240
	str	ip, [sp, #0]
	mov	r1, r0
	ldr	ip, .L23
	mov	lr, pc
	bx	ip
	ldr	r3, .L23+4
	mov	r2, #5
	str	r2, [r3, #0]
	add	sp, sp, #12
	ldr	lr, [sp], #4
	bx	lr
.L24:
	.align	2
.L23:
	.word	drawRect4
	.word	state
	.size	initLose, .-initLose
	.align	2
	.global	initialize
	.type	initialize, %function
initialize:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r2, .L26
	stmfd	sp!, {r4, r5}
	ldr	r3, .L26+4
	mov	r1, #16
	mov	r0, #1
	mov	ip, #0
	mov	r4, #144
	mov	r5, #20
	str	r1, [r2, #16]
	str	r1, [r2, #20]
	str	r0, [r2, #12]
	stmia	r2, {r4, r5}	@ phole stm
	str	ip, [r2, #36]
	str	ip, [r2, #28]
	mov	r2, #200
	str	r1, [r3, #16]
	str	r1, [r3, #20]
	str	r0, [r3, #12]
	str	r4, [r3, #0]
	str	r2, [r3, #4]
	str	ip, [r3, #36]
	str	r0, [r3, #28]
	ldmfd	sp!, {r4, r5}
	bx	lr
.L27:
	.align	2
.L26:
	.word	pacman
	.word	ghost
	.size	initialize, .-initialize
	.align	2
	.global	splash
	.type	splash, %function
splash:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, lr}
	ldr	r4, .L33
	ldr	r3, [r4, #0]
	tst	r3, #8
	beq	.L29
	ldr	r2, .L33+4
	ldr	r2, [r2, #0]
	tst	r2, #8
	beq	.L31
.L29:
	tst	r3, #4
	beq	.L28
	ldr	r3, .L33+4
	ldr	r3, [r3, #0]
	tst	r3, #4
	beq	.L32
.L28:
	ldmfd	sp!, {r4, lr}
	bx	lr
.L32:
	ldmfd	sp!, {r4, lr}
	b	initInstruct
.L31:
	bl	initGame
	ldr	r3, [r4, #0]
	b	.L29
.L34:
	.align	2
.L33:
	.word	oldButtons
	.word	buttons
	.size	splash, .-splash
	.align	2
	.global	instruct
	.type	instruct, %function
instruct:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L37
	ldr	r3, [r3, #0]
	tst	r3, #8
	bxeq	lr
	ldr	r3, .L37+4
	ldr	r3, [r3, #0]
	tst	r3, #8
	bxne	lr
	b	initSplash
.L38:
	.align	2
.L37:
	.word	oldButtons
	.word	buttons
	.size	instruct, .-instruct
	.align	2
	.global	pause
	.type	pause, %function
pause:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, lr}
	ldr	r4, .L44
	ldr	r3, [r4, #0]
	tst	r3, #8
	beq	.L40
	ldr	r2, .L44+4
	ldr	r2, [r2, #0]
	tst	r2, #8
	beq	.L42
.L40:
	tst	r3, #4
	beq	.L39
	ldr	r3, .L44+4
	ldr	r3, [r3, #0]
	tst	r3, #4
	beq	.L43
.L39:
	ldmfd	sp!, {r4, lr}
	bx	lr
.L43:
	bl	initialize
	ldmfd	sp!, {r4, lr}
	b	initSplash
.L42:
	bl	initGame
	ldr	r3, [r4, #0]
	b	.L40
.L45:
	.align	2
.L44:
	.word	oldButtons
	.word	buttons
	.size	pause, .-pause
	.align	2
	.global	win
	.type	win, %function
win:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L49
	stmfd	sp!, {r4, lr}
	ldr	r3, [r3, #0]
	tst	r3, #8
	beq	.L46
	ldr	r3, .L49+4
	ldr	r3, [r3, #0]
	tst	r3, #8
	beq	.L48
.L46:
	ldmfd	sp!, {r4, lr}
	bx	lr
.L48:
	bl	initialize
	ldmfd	sp!, {r4, lr}
	b	initSplash
.L50:
	.align	2
.L49:
	.word	oldButtons
	.word	buttons
	.size	win, .-win
	.align	2
	.global	lose
	.type	lose, %function
lose:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L54
	stmfd	sp!, {r4, lr}
	ldr	r3, [r3, #0]
	tst	r3, #8
	beq	.L51
	ldr	r3, .L54+4
	ldr	r3, [r3, #0]
	tst	r3, #8
	beq	.L53
.L51:
	ldmfd	sp!, {r4, lr}
	bx	lr
.L53:
	bl	initialize
	ldmfd	sp!, {r4, lr}
	b	initSplash
.L55:
	.align	2
.L54:
	.word	oldButtons
	.word	buttons
	.size	lose, .-lose
	.align	2
	.global	update
	.type	update, %function
update:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L62
	ldr	r2, [r3, #4]
	ldr	r1, [r3, #12]
	add	r2, r1, r2
	cmp	r2, #223
	str	r2, [r3, #4]
	bgt	.L61
	cmp	r2, #0
	bgt	.L58
.L61:
	rsb	r1, r1, #0
	str	r1, [r3, #12]
.L58:
	ldr	r3, .L62+4
	ldr	r2, [r3, #4]
	cmp	r2, #222
	movgt	r2, #223
	strgt	r2, [r3, #4]
	bxgt	lr
	cmp	r2, #1
	movle	r2, #1
	strle	r2, [r3, #4]
	bx	lr
.L63:
	.align	2
.L62:
	.word	ghost
	.word	pacman
	.size	update, .-update
	.align	2
	.global	game
	.type	game, %function
game:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, lr}
	ldr	r4, .L74
	ldr	r3, [r4, #0]
	tst	r3, #4
	beq	.L65
	ldr	r2, .L74+4
	ldr	r2, [r2, #0]
	tst	r2, #4
	beq	.L71
.L65:
	tst	r3, #1
	beq	.L66
	ldr	r2, .L74+4
	ldr	r2, [r2, #0]
	tst	r2, #1
	beq	.L72
.L66:
	tst	r3, #2
	beq	.L67
	ldr	r3, .L74+4
	ldr	r3, [r3, #0]
	tst	r3, #2
	beq	.L73
.L67:
	mov	r3, #67108864
	ldr	r3, [r3, #304]
	tst	r3, #32
	ldreq	r3, .L74+8
	ldreq	r6, [r3, #4]
	subeq	r6, r6, #1
	streq	r6, [r3, #4]
	mov	r2, #67108864
	ldr	r2, [r2, #304]
	ldrne	r3, .L74+8
	ldrne	r6, [r3, #4]
	tst	r2, #16
	ldr	r2, .L74+12
	ldr	r8, [r2, #4]
	addeq	r6, r6, #1
	ldr	r0, [r3, #28]
	ldr	r1, [r2, #28]
	ldr	r5, [r3, #36]
	ldr	lr, [r2, #36]
	streq	r6, [r3, #4]
	mov	r8, r8, asl #23
	mov	r6, r6, asl #23
	ldr	ip, .L74+16
	ldrb	r7, [r3, #0]	@ zero_extendqisi2
	ldrb	r4, [r2, #0]	@ zero_extendqisi2
	add	r5, r0, r5, asl #5
	add	lr, r1, lr, asl #5
	mov	r6, r6, lsr #23
	mov	r8, r8, lsr #23
	mov	lr, lr, asl #1
	orr	r6, r6, #16384
	mov	r5, r5, asl #1
	orr	r8, r8, #16384
	mov	r1, ip
	strh	lr, [ip, #12]	@ movhi
	mov	r0, #3
	mov	r2, #117440512
	mov	r3, #512
	strh	r7, [ip, #0]	@ movhi
	strh	r6, [ip, #2]	@ movhi
	strh	r5, [ip, #4]	@ movhi
	strh	r4, [ip, #8]	@ movhi
	strh	r8, [ip, #10]	@ movhi
	ldr	ip, .L74+20
	mov	lr, pc
	bx	ip
	bl	update
	ldr	r3, .L74+24
	mov	lr, pc
	bx	r3
	ldmfd	sp!, {r4, r5, r6, r7, r8, lr}
	bx	lr
.L72:
	bl	initWin
	ldr	r3, [r4, #0]
	b	.L66
.L71:
	bl	initPause
	ldr	r3, [r4, #0]
	b	.L65
.L73:
	bl	initLose
	b	.L67
.L75:
	.align	2
.L74:
	.word	oldButtons
	.word	buttons
	.word	pacman
	.word	ghost
	.word	shadowOAM
	.word	DMANow
	.word	waitForVblank
	.size	game, .-game
	.align	2
	.global	main
	.type	main, %function
main:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r2, #1024
	mov	r3, #-1224736768
	mov	r1, #67108864
	add	r2, r2, #4
	mov	r3, r3, asr #17
	stmfd	sp!, {r4, r5, r6, r7, r8, lr}
	ldr	r0, .L88
	strh	r2, [r1, #0]	@ movhi
	strh	r3, [r1, #8]	@ movhi
	ldr	r3, .L88+4
	mov	lr, pc
	bx	r3
	ldr	r4, .L88+8
	mov	r0, #3
	ldr	r1, .L88+12
	mov	r2, #100663296
	mov	r3, #16
	mov	lr, pc
	bx	r4
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L88+16
	add	r2, r2, #55296
	mov	r3, #1024
	mov	lr, pc
	bx	r4
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L88+20
	add	r2, r2, #512
	mov	r3, #256
	mov	lr, pc
	bx	r4
	mov	r2, #100663296
	add	r2, r2, #65536
	mov	r3, #16384
	mov	r0, #3
	ldr	r1, .L88+24
	mov	lr, pc
	bx	r4
	bl	initialize
	ldr	r2, .L88+28
	mov	r3, #0
.L77:
	mov	r1, #512	@ movhi
	strh	r1, [r2, r3]	@ movhi
	add	r3, r3, #8
	cmp	r3, #1024
	bne	.L77
	bl	initSplash
	ldr	r8, .L88+32
	ldr	r4, .L88+36
	ldr	r7, .L88+40
	ldr	r5, .L88+44
	mov	r6, #67108864
.L86:
	ldr	r1, [r4, #0]
	ldr	r2, [r6, #304]
	ldr	r3, [r7, #0]
	str	r1, [r8, #0]
	str	r2, [r4, #0]
	cmp	r3, #5
	ldrls	pc, [pc, r3, asl #2]
	b	.L78
.L85:
	.word	.L79
	.word	.L80
	.word	.L81
	.word	.L82
	.word	.L83
	.word	.L84
.L84:
	bl	lose
.L78:
	mov	lr, pc
	bx	r5
	b	.L86
.L83:
	bl	win
	mov	lr, pc
	bx	r5
	b	.L86
.L82:
	bl	pause
	mov	lr, pc
	bx	r5
	b	.L86
.L81:
	bl	game
	mov	lr, pc
	bx	r5
	b	.L86
.L80:
	bl	instruct
	mov	lr, pc
	bx	r5
	b	.L86
.L79:
	bl	splash
	mov	lr, pc
	bx	r5
	b	.L86
.L89:
	.align	2
.L88:
	.word	M02_TempPal
	.word	loadPalette
	.word	DMANow
	.word	M02_TempTiles
	.word	M02_TempMap
	.word	SpritesPal
	.word	SpritesTiles
	.word	shadowOAM
	.word	oldButtons
	.word	buttons
	.word	state
	.word	waitForVblank
	.size	main, .-main
	.global	hOff
	.global	vOff
	.comm	oldButtons,4,4
	.comm	buttons,4,4
	.comm	state,4,4
	.comm	shadowOAM,1024,4
	.comm	pacman,44,4
	.comm	ghost,44,4
	.bss
	.align	2
	.type	hOff, %object
	.size	hOff, 4
hOff:
	.space	4
	.type	vOff, %object
	.size	vOff, 4
vOff:
	.space	4
	.ident	"GCC: (devkitARM release 31) 4.5.0"
