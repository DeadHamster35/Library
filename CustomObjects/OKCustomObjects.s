	.file	1 "OKCustomObjects.c"
	.section .mdebug.abi32
	.previous
	.nan	legacy
	.module	fp=32
	.module	nooddspreg
	.text
	.align	2
	.globl	DisplayCoinSprite
	.set	nomips16
	.set	nomicromips
	.ent	DisplayCoinSprite
	.type	DisplayCoinSprite, @function
DisplayCoinSprite:
	.frame	$sp,48,$31		# vars= 0, regs= 6/0, args= 24, gp= 0
	.mask	0x801f0000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	addiu	$sp,$sp,-48
	sw	$31,44($sp)
	sw	$20,40($sp)
	sw	$19,36($sp)
	sw	$18,32($sp)
	sw	$17,28($sp)
	sw	$16,24($sp)
	lui	$2,%hi(CoinCount)
	lh	$3,%lo(CoinCount)($2)
	blez	$3,$L2
	li	$17,34			# 0x22

	li	$16,1			# 0x1
	lui	$18,%hi(ok_RedCoinSprite)
	addiu	$18,$18,%lo(ok_RedCoinSprite)
	move	$19,$2
	b	$L3
	li	$20,8			# 0x8

$L4:
	slt	$2,$2,$16
	bne	$2,$0,$L2
	nop

$L3:
	sw	$18,16($sp)
	li	$7,16			# 0x10
	li	$6,16			# 0x10
	li	$5,220			# 0xdc
	jal	KWSprite
	move	$4,$17

	addiu	$16,$16,1
	lh	$3,%lo(CoinCount)($19)
	addiu	$17,$17,4
	slt	$4,$3,9
	bne	$4,$0,$L4
	move	$2,$3

	b	$L4
	move	$2,$20

$L2:
	beq	$3,$0,$L10
	lw	$31,44($sp)

	slt	$3,$3,8
	bne	$3,$0,$L9
	lui	$2,%hi(lit_numberSpriteX)

	addiu	$2,$2,%lo(lit_numberSpriteX)
	sw	$2,16($sp)
	li	$7,16			# 0x10
	li	$6,16			# 0x10
	li	$5,219			# 0xdb
	jal	KWSprite
	li	$4,21			# 0x15

	lui	$2,%hi(lit_numberSprite8)
	addiu	$2,$2,%lo(lit_numberSprite8)
	sw	$2,16($sp)
	li	$7,16			# 0x10
	li	$6,16			# 0x10
	li	$5,219			# 0xdb
	jal	KWSprite
	li	$4,11			# 0xb

	lw	$31,44($sp)
$L10:
	lw	$20,40($sp)
	lw	$19,36($sp)
	lw	$18,32($sp)
	lw	$17,28($sp)
	lw	$16,24($sp)
	jr	$31
	addiu	$sp,$sp,48

$L9:
	addiu	$2,$2,%lo(lit_numberSpriteX)
	sw	$2,16($sp)
	li	$7,16			# 0x10
	li	$6,16			# 0x10
	li	$5,219			# 0xdb
	jal	KWSprite
	li	$4,21			# 0x15

	lui	$2,%hi(CoinCount)
	lh	$2,%lo(CoinCount)($2)
	sll	$3,$2,9
	lui	$2,%hi(lit_numberSprite)
	addiu	$2,$2,%lo(lit_numberSprite)
	addu	$2,$2,$3
	sw	$2,16($sp)
	li	$7,16			# 0x10
	li	$6,16			# 0x10
	li	$5,219			# 0xdb
	jal	KWSprite
	li	$4,11			# 0xb

	b	$L10
	lw	$31,44($sp)

	.set	macro
	.set	reorder
	.end	DisplayCoinSprite
	.size	DisplayCoinSprite, .-DisplayCoinSprite
	.align	2
	.globl	FindOKObject
	.set	nomips16
	.set	nomicromips
	.ent	FindOKObject
	.type	FindOKObject, @function
FindOKObject:
	.frame	$sp,0,$31		# vars= 0, regs= 0/0, args= 0, gp= 0
	.mask	0x00000000,0
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	lui	$3,%hi(OKObjectArray+6)
	addiu	$3,$3,%lo(OKObjectArray+6)
	move	$2,$0
	li	$5,-1			# 0xffffffffffffffff
	li	$6,100			# 0x64
$L14:
	lh	$4,0($3)
	beql	$4,$5,$L16
	sll	$2,$2,16

	addiu	$2,$2,1
	bne	$2,$6,$L14
	addiu	$3,$3,148

	jr	$31
	li	$2,-1			# 0xffffffffffffffff

$L16:
	jr	$31
	sra	$2,$2,16

	.set	macro
	.set	reorder
	.end	FindOKObject
	.size	FindOKObject, .-FindOKObject
	.align	2
	.globl	ClearOKObject
	.set	nomips16
	.set	nomicromips
	.ent	ClearOKObject
	.type	ClearOKObject, @function
ClearOKObject:
	.frame	$sp,0,$31		# vars= 0, regs= 0/0, args= 0, gp= 0
	.mask	0x00000000,0
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	lui	$5,%hi(OKObjectArray)
	addiu	$5,$5,%lo(OKObjectArray)
	sll	$3,$4,3
	addu	$2,$3,$4
	sll	$2,$2,2
	addu	$2,$2,$4
	sll	$2,$2,2
	addu	$2,$5,$2
	sh	$0,34($2)
	sh	$0,32($2)
	sw	$0,20($2)
	sb	$0,24($2)
	sb	$0,26($2)
	sb	$0,25($2)
	sb	$0,27($2)
	li	$6,-1			# 0xffffffffffffffff
	sh	$6,6($2)
	sw	$0,60($2)
	sw	$0,64($2)
	sw	$0,68($2)
	sh	$0,52($2)
	sh	$0,54($2)
	sh	$0,56($2)
	sw	$0,72($2)
	sw	$0,76($2)
	sw	$0,80($2)
	sw	$0,48($2)
	sh	$0,42($2)
	sw	$0,44($2)
	sh	$0,38($2)
	sh	$0,40($2)
	jr	$31
	sh	$0,36($2)

	.set	macro
	.set	reorder
	.end	ClearOKObject
	.size	ClearOKObject, .-ClearOKObject
	.align	2
	.globl	TestCollideSphere
	.set	nomips16
	.set	nomicromips
	.ent	TestCollideSphere
	.type	TestCollideSphere, @function
TestCollideSphere:
	.frame	$sp,0,$31		# vars= 0, regs= 0/0, args= 0, gp= 0
	.mask	0x00000000,0
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	mtc1	$5,$f0
	mtc1	$7,$f2
	nop
	add.s	$f2,$f0,$f2
	lui	$2,%hi(GlobalFloatA)
	swc1	$f2,%lo(GlobalFloatA)($2)
	lwc1	$f0,0($4)
	lwc1	$f4,0($6)
	sub.s	$f0,$f0,$f4
	lui	$2,%hi(GlobalFloatB)
	swc1	$f0,%lo(GlobalFloatB)($2)
	lwc1	$f6,4($4)
	lwc1	$f4,4($6)
	sub.s	$f6,$f6,$f4
	lui	$2,%hi(GlobalFloatC)
	swc1	$f6,%lo(GlobalFloatC)($2)
	lwc1	$f4,8($4)
	lwc1	$f8,8($6)
	sub.s	$f4,$f4,$f8
	lui	$2,%hi(GlobalFloatD)
	swc1	$f4,%lo(GlobalFloatD)($2)
	mul.s	$f0,$f0,$f0
	mul.s	$f6,$f6,$f6
	add.s	$f0,$f0,$f6
	mul.s	$f4,$f4,$f4
	add.s	$f0,$f0,$f4
	mul.s	$f2,$f2,$f2
	c.lt.s	$f2,$f0
	nop
	bc1t	$L19
	li	$2,1			# 0x1

	move	$2,$0
$L19:
	xori	$2,$2,0x1
	jr	$31
	andi	$2,$2,0x1

	.set	macro
	.set	reorder
	.end	TestCollideSphere
	.size	TestCollideSphere, .-TestCollideSphere
	.align	2
	.globl	TestCollideBox
	.set	nomips16
	.set	nomicromips
	.ent	TestCollideBox
	.type	TestCollideBox, @function
TestCollideBox:
	.frame	$sp,56,$31		# vars= 16, regs= 3/2, args= 16, gp= 0
	.mask	0x80030000,-12
	.fmask	0x00300000,-8
	.set	noreorder
	.set	nomacro
	addiu	$sp,$sp,-56
	sw	$31,44($sp)
	sw	$17,40($sp)
	sw	$16,36($sp)
	sdc1	$f20,48($sp)
	move	$17,$5
	lwc1	$f20,72($sp)
	addiu	$16,$sp,16
	move	$3,$16
	move	$2,$0
	li	$9,12			# 0xc
$L21:
	addu	$8,$7,$2
	addu	$5,$4,$2
	lwc1	$f0,0($8)
	lwc1	$f2,0($5)
	sub.s	$f0,$f0,$f2
	swc1	$f0,0($3)
	addiu	$2,$2,4
	bne	$2,$9,$L21
	addiu	$3,$3,4

	lh	$5,2($6)
	jal	MakeAlignVector
	addiu	$4,$sp,16

	move	$2,$17
	addiu	$5,$17,12
	lui	$3,%hi($LC0)
	lwc1	$f4,%lo($LC0)($3)
	lui	$3,%hi(GlobalFloatA)
$L23:
	lwc1	$f0,0($2)
	mul.s	$f0,$f0,$f4
	add.s	$f0,$f0,$f20
	swc1	$f0,%lo(GlobalFloatA)($3)
	lwc1	$f2,0($16)
	mul.s	$f2,$f2,$f2
	mul.s	$f0,$f0,$f0
	c.lt.s	$f0,$f2
	nop
	bc1tl	$L28
	move	$2,$0

	addiu	$2,$2,4
	bne	$2,$5,$L23
	addiu	$16,$16,4

	li	$2,1			# 0x1
$L22:
$L28:
	lw	$31,44($sp)
	lw	$17,40($sp)
	lw	$16,36($sp)
	ldc1	$f20,48($sp)
	jr	$31
	addiu	$sp,$sp,56

	.set	macro
	.set	reorder
	.end	TestCollideBox
	.size	TestCollideBox, .-TestCollideBox
	.align	2
	.globl	OKObjectReaction
	.set	nomips16
	.set	nomicromips
	.ent	OKObjectReaction
	.type	OKObjectReaction, @function
OKObjectReaction:
	.frame	$sp,56,$31		# vars= 0, regs= 8/2, args= 16, gp= 0
	.mask	0x807f0000,-12
	.fmask	0x00300000,-8
	.set	noreorder
	.set	nomacro
	addiu	$sp,$sp,-56
	sw	$31,44($sp)
	sw	$22,40($sp)
	sw	$21,36($sp)
	sw	$20,32($sp)
	sw	$19,28($sp)
	sw	$18,24($sp)
	sw	$17,20($sp)
	sw	$16,16($sp)
	sdc1	$f20,48($sp)
	li	$2,2			# 0x2
	beq	$5,$2,$L30
	move	$16,$4

	li	$2,3			# 0x3
	beq	$5,$2,$L31
	li	$2,1			# 0x1

	beq	$5,$2,$L43
	li	$2,-1			# 0xffffffffffffffff

$L29:
	lw	$31,44($sp)
	lw	$22,40($sp)
	lw	$21,36($sp)
	lw	$20,32($sp)
	lw	$19,28($sp)
	lw	$18,24($sp)
	lw	$17,20($sp)
	lw	$16,16($sp)
	ldc1	$f20,48($sp)
	jr	$31
	addiu	$sp,$sp,56

$L43:
	b	$L29
	sh	$2,6($4)

$L30:
	lw	$3,72($4)
	lw	$2,80($4)
	mtc1	$3,$f0
	mtc1	$2,$f2
	nop
	c.lt.s	$f2,$f0
	nop
	bc1fl	$L40
	li	$3,-2147483648			# 0xffffffff80000000

	li	$2,-2147483648			# 0xffffffff80000000
	xor	$3,$3,$2
	b	$L29
	sw	$3,72($4)

$L40:
	xor	$2,$2,$3
	b	$L29
	sw	$2,80($4)

$L31:
	li	$2,-1			# 0xffffffffffffffff
	bnel	$6,$2,$L44
	sw	$0,72($4)

	lw	$3,72($4)
	lw	$2,80($4)
	mtc1	$3,$f0
	mtc1	$2,$f2
	nop
	c.lt.s	$f2,$f0
	nop
	bc1fl	$L41
	li	$3,-2147483648			# 0xffffffff80000000

	li	$2,-2147483648			# 0xffffffff80000000
	xor	$3,$3,$2
	b	$L29
	sw	$3,72($4)

$L44:
	lui	$2,%hi($LC1)
	lwc1	$f20,%lo($LC1)($2)
	swc1	$f20,76($4)
	lui	$22,%hi(GlobalPlayer)
	addiu	$22,$22,%lo(GlobalPlayer)
	sll	$18,$6,3
	subu	$19,$18,$6
	sll	$19,$19,4
	subu	$19,$19,$6
	sll	$19,$19,2
	subu	$19,$19,$6
	sll	$19,$19,3
	addu	$19,$22,$19
	lhu	$5,46($19)
	lhu	$2,192($19)
	addu	$5,$5,$2
	sll	$5,$5,16
	sra	$5,$5,16
	jal	MakeAlignVector
	addiu	$4,$4,72

	lui	$21,%hi(objectVelocity)
	sw	$0,%lo(objectVelocity)($21)
	addiu	$20,$21,%lo(objectVelocity)
	sw	$0,4($20)
	swc1	$f20,8($20)
	lhu	$5,46($19)
	lhu	$2,192($19)
	addu	$5,$5,$2
	sll	$5,$5,16
	sra	$5,$5,16
	jal	MakeAlignVector
	move	$4,$20

	lwc1	$f0,%lo(objectVelocity)($21)
	trunc.w.s $f0,$f0
	mfc1	$2,$f0
	nop
	sh	$2,8($16)
	lwc1	$f0,4($20)
	trunc.w.s $f0,$f0
	mfc1	$2,$f0
	nop
	sh	$2,10($16)
	lwc1	$f0,8($20)
	trunc.w.s $f0,$f0
	mfc1	$2,$f0
	b	$L29
	sh	$2,12($16)

$L41:
	xor	$2,$2,$3
	b	$L29
	sw	$2,80($4)

	.set	macro
	.set	reorder
	.end	OKObjectReaction
	.size	OKObjectReaction, .-OKObjectReaction
	.align	2
	.globl	CheckOKCollide
	.set	nomips16
	.set	nomicromips
	.ent	CheckOKCollide
	.type	CheckOKCollide, @function
CheckOKCollide:
	.frame	$sp,32,$31		# vars= 0, regs= 1/0, args= 24, gp= 0
	.mask	0x80000000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	addiu	$sp,$sp,-32
	sw	$31,28($sp)
	move	$2,$5
	lh	$3,0($4)
	beq	$3,$0,$L46
	move	$5,$6

	li	$4,1			# 0x1
	beq	$3,$4,$L47
	move	$6,$7

	move	$2,$0
	lw	$31,28($sp)
$L50:
	jr	$31
	addiu	$sp,$sp,32

$L46:
	lw	$7,52($sp)
	lw	$6,48($sp)
	lw	$5,0($5)
	jal	TestCollideSphere
	move	$4,$2

	b	$L50
	lw	$31,28($sp)

$L47:
	lwc1	$f0,52($sp)
	swc1	$f0,16($sp)
	lw	$7,48($sp)
	jal	TestCollideBox
	move	$4,$2

	b	$L50
	lw	$31,28($sp)

	.set	macro
	.set	reorder
	.end	CheckOKCollide
	.size	CheckOKCollide, .-CheckOKCollide
	.align	2
	.globl	OKObjectCollision
	.set	nomips16
	.set	nomicromips
	.ent	OKObjectCollision
	.type	OKObjectCollision, @function
OKObjectCollision:
	.frame	$sp,112,$31		# vars= 48, regs= 10/0, args= 24, gp= 0
	.mask	0xc0ff0000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	addiu	$sp,$sp,-112
	sw	$31,108($sp)
	sw	$fp,104($sp)
	sw	$23,100($sp)
	sw	$22,96($sp)
	sw	$21,92($sp)
	sw	$20,88($sp)
	sw	$19,84($sp)
	sw	$18,80($sp)
	sw	$17,76($sp)
	sw	$16,72($sp)
	move	$19,$4
	lh	$4,2($4)
	lui	$2,%hi(OverKartRAMHeader+12)
	lw	$3,%lo(OverKartRAMHeader+12)($2)
	sll	$2,$4,1
	addu	$2,$2,$4
	sll	$2,$2,2
	subu	$2,$2,$4
	sll	$2,$2,2
	addu	$2,$3,$2
	lw	$4,28($2)
	li	$2,167772160			# 0xa000000
	jal	GetRealAddress
	or	$4,$4,$2

	sw	$2,60($sp)
	sw	$0,24($sp)
	sw	$0,28($sp)
	sw	$0,32($sp)
	lui	$2,%hi($LC2)
	lwc1	$f0,%lo($LC2)($2)
	swc1	$f0,36($sp)
	swc1	$f0,40($sp)
	swc1	$f0,44($sp)
	sh	$0,48($sp)
	sh	$0,50($sp)
	sh	$0,52($sp)
	lui	$2,%hi(g_gameMode)
	lw	$3,%lo(g_gameMode)($2)
	beq	$3,$0,$L52
	li	$2,8			# 0x8

	lui	$2,%hi(g_playerCount)
	lh	$2,%lo(g_playerCount+2)($2)
$L52:
	lui	$3,%hi(GlobalShortA)
	sh	$2,%lo(GlobalShortA)($3)
	lui	$2,%hi(GlobalBoolA)
	sb	$0,%lo(GlobalBoolA)($2)
	lui	$2,%hi(GlobalBoolD)
	sb	$0,%lo(GlobalBoolD)($2)
	lh	$3,2($19)
	sll	$2,$3,1
	addu	$2,$2,$3
	sll	$2,$2,2
	subu	$2,$2,$3
	sll	$3,$2,2
	move	$4,$3
	lui	$2,%hi(OverKartRAMHeader+12)
	lw	$2,%lo(OverKartRAMHeader+12)($2)
	addu	$2,$2,$3
	lb	$3,22($2)
	blez	$3,$L53
	lw	$20,60($sp)

	sw	$0,56($sp)
	lui	$22,%hi(GlobalShortA)
	lui	$fp,%hi(GlobalBoolD)
	lui	$2,%hi(g_SimpleObjectArray)
	addiu	$2,$2,%lo(g_SimpleObjectArray)
	sw	$2,68($sp)
	lui	$2,%hi(OverKartRAMHeader)
	addiu	$2,$2,%lo(OverKartRAMHeader)
	b	$L64
	sw	$2,64($sp)

$L74:
	jal	MakeAlignVector
	addiu	$4,$sp,24

	b	$L77
	lwc1	$f2,60($19)

$L57:
	lbu	$5,26($18)
	jal	OKObjectReaction
	move	$4,$19

	lbu	$5,24($18)
$L78:
	jal	MasterStatus
	move	$4,$17

	lbu	$5,25($18)
	jal	MasterEffect
	move	$4,$17

	addiu	$17,$17,1
$L81:
	lh	$2,%lo(GlobalShortA)($22)
	slt	$2,$17,$2
	beq	$2,$0,$L55
	addiu	$16,$16,3544

$L59:
	lwc1	$f0,92($16)
	swc1	$f0,20($sp)
	sw	$16,16($sp)
	addiu	$7,$sp,48
	addiu	$6,$sp,36
	addiu	$5,$sp,24
	jal	CheckOKCollide
	move	$4,$18

	beql	$2,$0,$L81
	addiu	$17,$17,1

	li	$2,1			# 0x1
	sb	$2,%lo(GlobalBoolD)($fp)
	lw	$2,168($16)
	andi	$2,$2,0x200
	beq	$2,$0,$L57
	move	$6,$17

	lbu	$5,27($18)
	jal	OKObjectReaction
	move	$4,$19

	b	$L78
	lbu	$5,24($18)

$L55:
	lui	$2,%hi(g_StaticObjectCount)
	lh	$2,%lo(g_StaticObjectCount)($2)
	slt	$3,$2,100
	beq	$3,$0,$L60
	move	$17,$2

	sll	$16,$2,3
	subu	$16,$16,$2
	sll	$16,$16,4
	lw	$2,68($sp)
	addu	$16,$2,$16
	b	$L63
	li	$23,100			# 0x64

$L62:
$L79:
	lbu	$5,27($18)
	jal	OKObjectReaction
	move	$4,$19

	addiu	$17,$17,1
$L82:
	beq	$17,$23,$L60
	addiu	$16,$16,112

$L63:
	lh	$2,2($16)
	bgezl	$2,$L82
	addiu	$17,$17,1

	andi	$2,$2,0x4000
	beql	$2,$0,$L82
	addiu	$17,$17,1

	lwc1	$f0,12($16)
	swc1	$f0,20($sp)
	addiu	$2,$16,24
	sw	$2,16($sp)
	addiu	$7,$sp,48
	addiu	$6,$sp,36
	addiu	$5,$sp,24
	jal	CheckOKCollide
	move	$4,$18

	beql	$2,$0,$L82
	addiu	$17,$17,1

	lh	$2,0($16)
	li	$3,42			# 0x2a
	beql	$2,$3,$L62
	li	$6,-1			# 0xffffffffffffffff

	jal	KillObject
	move	$4,$16

	b	$L79
	li	$6,-1			# 0xffffffffffffffff

$L60:
	lw	$2,56($sp)
	addiu	$5,$2,1
	sw	$5,56($sp)
	lh	$3,2($19)
	sll	$2,$3,1
	addu	$2,$2,$3
	sll	$2,$2,2
	subu	$2,$2,$3
	sll	$2,$2,2
	move	$4,$2
	lw	$3,64($sp)
	lw	$3,12($3)
	addu	$2,$3,$2
	lb	$3,22($2)
	slt	$3,$5,$3
	beq	$3,$0,$L53
	addiu	$20,$20,28

$L64:
	move	$18,$20
	lh	$2,16($20)
	mtc1	$2,$f0
	nop
	cvt.s.w	$f0,$f0
	swc1	$f0,24($sp)
	lh	$2,18($20)
	mtc1	$2,$f0
	nop
	cvt.s.w	$f0,$f0
	swc1	$f0,28($sp)
	lh	$2,20($20)
	mtc1	$2,$f0
	nop
	cvt.s.w	$f0,$f0
	swc1	$f0,32($sp)
	lh	$5,54($19)
	jal	MakeAlignVector
	addiu	$4,$sp,24

	lw	$3,60($sp)
	lh	$2,10($3)
	mtc1	$2,$f0
	nop
	cvt.s.w	$f0,$f0
	lh	$2,2($20)
	mtc1	$2,$f2
	nop
	cvt.s.w	$f2,$f2
	div.s	$f0,$f0,$f2
	swc1	$f0,36($sp)
	lh	$2,12($3)
	mtc1	$2,$f0
	nop
	cvt.s.w	$f0,$f0
	lh	$2,2($20)
	mtc1	$2,$f2
	nop
	cvt.s.w	$f2,$f2
	div.s	$f0,$f0,$f2
	swc1	$f0,40($sp)
	lh	$2,14($3)
	mtc1	$2,$f0
	nop
	cvt.s.w	$f0,$f0
	lh	$2,2($20)
	mtc1	$2,$f2
	nop
	cvt.s.w	$f2,$f2
	div.s	$f0,$f0,$f2
	swc1	$f0,44($sp)
	lhu	$2,4($20)
	lhu	$3,52($19)
	addu	$2,$2,$3
	sh	$2,48($sp)
	lh	$5,54($19)
	lhu	$2,6($20)
	addu	$2,$5,$2
	sh	$2,50($sp)
	lhu	$2,8($20)
	lhu	$3,56($19)
	addu	$2,$2,$3
	sh	$2,52($sp)
	lbu	$3,22($20)
	li	$2,1			# 0x1
	beq	$3,$2,$L74
	nop

	lwc1	$f2,60($19)
$L77:
	lwc1	$f0,24($sp)
	add.s	$f0,$f0,$f2
	swc1	$f0,24($sp)
	lwc1	$f2,64($19)
	lwc1	$f0,28($sp)
	add.s	$f0,$f0,$f2
	swc1	$f0,28($sp)
	lwc1	$f2,68($19)
	lwc1	$f0,32($sp)
	add.s	$f0,$f0,$f2
	swc1	$f0,32($sp)
	lh	$2,%lo(GlobalShortA)($22)
	blez	$2,$L55
	lui	$16,%hi(GlobalPlayer+20)

	addiu	$16,$16,%lo(GlobalPlayer+20)
	b	$L59
	move	$17,$0

$L53:
	lw	$3,24($2)
	li	$2,-1			# 0xffffffffffffffff
	beq	$3,$2,$L80
	lw	$31,108($sp)

	lh	$2,4($19)
	bnel	$2,$0,$L66
	li	$3,1			# 0x1

	lui	$2,%hi(GlobalBoolA)
	lbu	$2,%lo(GlobalBoolA)($2)
	beq	$2,$0,$L83
	lw	$fp,104($sp)

	li	$2,1			# 0x1
	sh	$2,4($19)
	lui	$2,%hi(OverKartRAMHeader+12)
	lw	$2,%lo(OverKartRAMHeader+12)($2)
	addu	$4,$2,$4
	lb	$2,16($4)
	bne	$2,$0,$L67
	lui	$2,%hi(g_playerCount)

	lw	$3,%lo(g_playerCount)($2)
	li	$2,1			# 0x1
	beql	$3,$2,$L75
	lw	$5,24($4)

$L67:
	lw	$6,24($4)
	lui	$5,%hi(ZeroVector)
	addiu	$5,$5,%lo(ZeroVector)
	lui	$4,%hi(objectPosition)
	jal	NaSceneLevelStart
	addiu	$4,$4,%lo(objectPosition)

$L51:
	lw	$31,108($sp)
$L80:
	lw	$fp,104($sp)
$L83:
	lw	$23,100($sp)
	lw	$22,96($sp)
	lw	$21,92($sp)
	lw	$20,88($sp)
	lw	$19,84($sp)
	lw	$18,80($sp)
	lw	$17,76($sp)
	lw	$16,72($sp)
	jr	$31
	addiu	$sp,$sp,112

$L75:
	jal	NaPlyLevelStart
	move	$4,$0

	b	$L80
	lw	$31,108($sp)

$L66:
	bne	$2,$3,$L51
	lui	$2,%hi(GlobalBoolA)

	lbu	$2,%lo(GlobalBoolA)($2)
	bne	$2,$0,$L80
	lw	$31,108($sp)

	sh	$0,4($19)
	lui	$2,%hi(OverKartRAMHeader+12)
	lw	$2,%lo(OverKartRAMHeader+12)($2)
	addu	$4,$2,$4
	lb	$2,16($4)
	bne	$2,$0,$L68
	lui	$2,%hi(g_playerCount)

	lw	$3,%lo(g_playerCount)($2)
	li	$2,1			# 0x1
	beql	$3,$2,$L76
	lw	$5,24($4)

$L68:
	lw	$5,24($4)
	lui	$4,%hi(objectPosition)
	jal	NaSceneLevelStop
	addiu	$4,$4,%lo(objectPosition)

	b	$L80
	lw	$31,108($sp)

$L76:
	jal	NaPlyLevelStop
	move	$4,$0

	b	$L80
	lw	$31,108($sp)

	.set	macro
	.set	reorder
	.end	OKObjectCollision
	.size	OKObjectCollision, .-OKObjectCollision
	.align	2
	.globl	DrawOKObjectLoop
	.set	nomips16
	.set	nomicromips
	.ent	DrawOKObjectLoop
	.type	DrawOKObjectLoop, @function
DrawOKObjectLoop:
	.frame	$sp,72,$31		# vars= 16, regs= 10/0, args= 16, gp= 0
	.mask	0xc0ff0000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	addiu	$sp,$sp,-72
	sw	$31,68($sp)
	sw	$fp,64($sp)
	sw	$23,60($sp)
	sw	$22,56($sp)
	sw	$21,52($sp)
	sw	$20,48($sp)
	sw	$19,44($sp)
	sw	$18,40($sp)
	sw	$17,36($sp)
	sw	$16,32($sp)
	move	$fp,$4
	lui	$3,%hi(GraphPtrOffset)
	lw	$2,%lo(GraphPtrOffset)($3)
	addiu	$4,$2,8
	sw	$4,%lo(GraphPtrOffset)($3)
	li	$3,100663296			# 0x6000000
	sw	$3,0($2)
	lw	$3,0($fp)
	li	$4,167772160			# 0xa000000
	or	$3,$3,$4
	sw	$3,4($2)
	lui	$2,%hi(OverKartRAMHeader+16)
	lw	$2,%lo(OverKartRAMHeader+16)($2)
	blez	$2,$L84
	move	$22,$5

	move	$18,$6
	sll	$23,$6,1
	addu	$23,$23,$6
	sll	$23,$23,2
	subu	$23,$23,$6
	sll	$23,$23,2
	sll	$2,$5,3
	subu	$2,$2,$5
	sll	$2,$2,4
	subu	$2,$2,$5
	sll	$2,$2,2
	subu	$2,$2,$5
	sll	$2,$2,3
	addiu	$2,$2,20
	lui	$3,%hi(GlobalPlayer)
	addiu	$3,$3,%lo(GlobalPlayer)
	addu	$2,$3,$2
	sw	$2,16($sp)
	lui	$16,%hi(OKObjectArray+60)
	addiu	$16,$16,%lo(OKObjectArray+60)
	move	$17,$0
	sll	$21,$5,3
	subu	$21,$21,$5
	sll	$21,$21,4
	subu	$21,$21,$5
	sll	$21,$21,2
	subu	$21,$21,$5
	lui	$19,%hi(OverKartRAMHeader)
	b	$L90
	addiu	$19,$19,%lo(OverKartRAMHeader)

$L87:
	lhu	$2,-8($16)
	sh	$2,%lo(objectAngle)($6)
	addiu	$6,$6,%lo(objectAngle)
	lhu	$2,-6($16)
	subu	$2,$0,$2
	sh	$2,2($6)
	lhu	$2,-4($16)
	sh	$2,4($6)
	lui	$5,%hi(objectPosition)
	addiu	$5,$5,%lo(objectPosition)
	lui	$4,%hi(AffineMatrix)
	jal	CreateModelingMatrix
	addiu	$4,$4,%lo(AffineMatrix)

$L88:
	lh	$5,10($fp)
	mtc1	$5,$f0
	nop
	cvt.s.w	$f0,$f0
	lui	$2,%hi($LC3)
	lwc1	$f2,%lo($LC3)($2)
	div.s	$f0,$f0,$f2
	mfc1	$5,$f0
	lui	$20,%hi(AffineMatrix)
	jal	ScalingMatrix
	addiu	$4,$20,%lo(AffineMatrix)

	move	$5,$0
	jal	SetMatrix
	addiu	$4,$20,%lo(AffineMatrix)

	bnel	$2,$0,$L94
	lh	$2,8($fp)

$L86:
	addiu	$17,$17,1
$L95:
	lw	$2,16($19)
	slt	$2,$17,$2
	beq	$2,$0,$L84
	addiu	$16,$16,148

$L90:
	lh	$2,-58($16)
	bnel	$2,$18,$L95
	addiu	$17,$17,1

	lh	$3,-54($16)
	li	$2,-1			# 0xffffffffffffffff
	beql	$3,$2,$L95
	addiu	$17,$17,1

	sll	$2,$21,3
	lui	$3,%hi(GlobalPlayer)
	addiu	$3,$3,%lo(GlobalPlayer)
	addu	$2,$2,$3
	lw	$3,12($19)
	addu	$3,$3,$23
	lh	$5,14($3)
	lw	$7,112($2)
	lw	$6,16($sp)
	mtc1	$5,$f0
	nop
	cvt.s.w	$f0,$f0
	mfc1	$5,$f0
	jal	TestCollideSphere
	move	$4,$16

	beql	$2,$0,$L95
	addiu	$17,$17,1

	lw	$4,4($fp)
	li	$2,167772160			# 0xa000000
	jal	GetRealAddress
	or	$4,$4,$2

	sw	$2,20($sp)
	lui	$2,%hi(objectPosition)
	lwc1	$f0,0($16)
	swc1	$f0,%lo(objectPosition)($2)
	addiu	$2,$2,%lo(objectPosition)
	lwc1	$f0,4($16)
	swc1	$f0,4($2)
	lwc1	$f0,8($16)
	swc1	$f0,8($2)
	lw	$2,12($19)
	addu	$2,$2,$23
	lb	$3,19($2)
	li	$2,1			# 0x1
	bne	$3,$2,$L87
	lui	$6,%hi(objectAngle)

	lui	$2,%hi(objectAngle)
	sh	$0,%lo(objectAngle)($2)
	addiu	$2,$2,%lo(objectAngle)
	sh	$0,2($2)
	sh	$0,4($2)
	sll	$20,$22,2
	lui	$2,%hi(GlobalCamera)
	addiu	$2,$2,%lo(GlobalCamera)
	addu	$20,$20,$2
	lw	$2,0($20)
	lhu	$4,38($2)
	addiu	$4,$4,-32760
	jal	sinT
	andi	$4,$4,0xffff

	swc1	$f0,24($sp)
	lw	$2,0($20)
	lhu	$4,38($2)
	addiu	$4,$4,-32760
	jal	cosT
	andi	$4,$4,0xffff

	lui	$2,%hi(AffineMatrix)
	swc1	$f0,%lo(AffineMatrix)($2)
	addiu	$2,$2,%lo(AffineMatrix)
	sw	$0,16($2)
	lwc1	$f2,24($sp)
	swc1	$f2,32($2)
	sw	$0,4($2)
	lui	$3,%hi($LC2)
	lwc1	$f2,%lo($LC2)($3)
	swc1	$f2,20($2)
	sw	$0,36($2)
	li	$3,-2147483648			# 0xffffffff80000000
	lw	$4,24($sp)
	xor	$3,$4,$3
	sw	$3,8($2)
	sw	$0,24($2)
	swc1	$f0,40($2)
	sw	$0,12($2)
	sw	$0,28($2)
	sw	$0,44($2)
	swc1	$f2,60($2)
	lui	$3,%hi(objectPosition)
	lwc1	$f0,%lo(objectPosition)($3)
	swc1	$f0,48($2)
	addiu	$3,$3,%lo(objectPosition)
	lwc1	$f0,4($3)
	swc1	$f0,52($2)
	lwc1	$f0,8($3)
	b	$L88
	swc1	$f0,56($2)

$L94:
	blez	$2,$L86
	lw	$2,20($sp)

	move	$5,$0
	lui	$6,%hi(GraphPtrOffset)
	li	$8,100663296			# 0x6000000
	li	$7,167772160			# 0xa000000
$L89:
	lw	$3,%lo(GraphPtrOffset)($6)
	addiu	$4,$3,8
	sw	$4,%lo(GraphPtrOffset)($6)
	sw	$8,0($3)
	lw	$4,0($2)
	or	$4,$4,$7
	sw	$4,4($3)
	addiu	$5,$5,1
	lh	$3,8($fp)
	slt	$3,$5,$3
	bne	$3,$0,$L89
	addiu	$2,$2,4

	b	$L95
	addiu	$17,$17,1

$L84:
	lw	$31,68($sp)
	lw	$fp,64($sp)
	lw	$23,60($sp)
	lw	$22,56($sp)
	lw	$21,52($sp)
	lw	$20,48($sp)
	lw	$19,44($sp)
	lw	$18,40($sp)
	lw	$17,36($sp)
	lw	$16,32($sp)
	jr	$31
	addiu	$sp,$sp,72

	.set	macro
	.set	reorder
	.end	DrawOKObjectLoop
	.size	DrawOKObjectLoop, .-DrawOKObjectLoop
	.align	2
	.globl	SkeletalMatrix
	.set	nomips16
	.set	nomicromips
	.ent	SkeletalMatrix
	.type	SkeletalMatrix, @function
SkeletalMatrix:
	.frame	$sp,48,$31		# vars= 0, regs= 8/0, args= 16, gp= 0
	.mask	0x807f0000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	addiu	$sp,$sp,-48
	sw	$31,44($sp)
	sw	$22,40($sp)
	sw	$21,36($sp)
	sw	$20,32($sp)
	sw	$19,28($sp)
	sw	$18,24($sp)
	sw	$17,20($sp)
	sw	$16,16($sp)
	move	$19,$4
	sw	$5,52($sp)
	sw	$6,56($sp)
	sw	$7,60($sp)
	lw	$16,164($sp)
	lw	$18,168($sp)
	lh	$20,70($sp)
	lw	$2,0($4)
	addiu	$2,$2,8
	lui	$22,%hi(GlobalUIntA)
	sw	$2,%lo(GlobalUIntA)($22)
	li	$4,167772160			# 0xa000000
	jal	GetRealAddress
	or	$4,$2,$4

	move	$17,$2
	sll	$21,$16,1
	addu	$21,$21,$16
	sll	$21,$21,1
	lw	$4,%lo(GlobalUIntA)($22)
	addu	$4,$21,$4
	srl	$2,$16,31
	addu	$16,$16,$2
	andi	$16,$16,0x1
	addiu	$16,$16,-1
	beq	$16,$2,$L101
	sw	$4,%lo(GlobalUIntA)($22)

	li	$2,167772160			# 0xa000000
	jal	GetRealAddress
	or	$4,$4,$2

	move	$16,$2
	lui	$3,%hi(GlobalUIntA)
	lw	$2,%lo(GlobalUIntA)($3)
	addu	$21,$2,$21
	sw	$21,%lo(GlobalUIntA)($3)
$L98:
	lui	$2,%hi(GlobalUIntA)
	lw	$4,%lo(GlobalUIntA)($2)
	li	$2,167772160			# 0xa000000
	jal	GetRealAddress
	or	$4,$4,$2

	move	$22,$2
	lwc1	$f4,8($19)
	sll	$2,$18,1
	addu	$18,$2,$18
	sll	$18,$18,1
	addu	$3,$16,$18
	lui	$21,%hi(objectPosition)
	lh	$2,0($3)
	mtc1	$2,$f0
	nop
	cvt.s.w	$f2,$f0
	lui	$2,%hi($LC3)
	lwc1	$f6,%lo($LC3)($2)
	div.s	$f2,$f2,$f6
	mul.s	$f2,$f2,$f4
	swc1	$f2,%lo(objectPosition)($21)
	addiu	$16,$21,%lo(objectPosition)
	lh	$2,2($3)
	mtc1	$2,$f0
	nop
	cvt.s.w	$f2,$f0
	div.s	$f2,$f2,$f6
	mul.s	$f2,$f2,$f4
	swc1	$f2,4($16)
	lh	$3,4($3)
	mtc1	$3,$f0
	nop
	cvt.s.w	$f0,$f0
	div.s	$f0,$f0,$f6
	mul.s	$f0,$f0,$f4
	swc1	$f0,8($16)
	move	$5,$20
	jal	MakeAlignVector
	move	$4,$16

	lwc1	$f0,%lo(objectPosition)($21)
	lwc1	$f2,76($sp)
	add.s	$f0,$f0,$f2
	swc1	$f0,%lo(objectPosition)($21)
	lwc1	$f0,4($16)
	lwc1	$f2,80($sp)
	add.s	$f0,$f0,$f2
	swc1	$f0,4($16)
	lwc1	$f0,8($16)
	lwc1	$f2,84($sp)
	add.s	$f0,$f0,$f2
	swc1	$f0,8($16)
	addu	$17,$17,$18
	lui	$6,%hi(objectAngle)
	lhu	$2,68($sp)
	lhu	$3,0($17)
	addu	$2,$2,$3
	sh	$2,%lo(objectAngle)($6)
	addiu	$6,$6,%lo(objectAngle)
	lhu	$2,2($17)
	subu	$20,$2,$20
	sh	$20,2($6)
	lhu	$2,72($sp)
	lhu	$3,4($17)
	addu	$2,$2,$3
	sh	$2,4($6)
	move	$5,$16
	lui	$16,%hi(AffineMatrix)
	jal	CreateModelingMatrix
	addiu	$4,$16,%lo(AffineMatrix)

	addu	$5,$22,$18
	jal	ScaleMatrixXYZFixed
	addiu	$4,$16,%lo(AffineMatrix)

	lw	$5,8($19)
	jal	ScalingMatrix
	addiu	$4,$16,%lo(AffineMatrix)

	move	$5,$0
	jal	SetMatrix
	addiu	$4,$16,%lo(AffineMatrix)

	sltu	$2,$0,$2
	lw	$31,44($sp)
	lw	$22,40($sp)
	lw	$21,36($sp)
	lw	$20,32($sp)
	lw	$19,28($sp)
	lw	$18,24($sp)
	lw	$17,20($sp)
	lw	$16,16($sp)
	jr	$31
	addiu	$sp,$sp,48

$L101:
	addiu	$4,$4,2
	sw	$4,%lo(GlobalUIntA)($22)
	li	$2,167772160			# 0xa000000
	jal	GetRealAddress
	or	$4,$4,$2

	move	$16,$2
	lw	$2,%lo(GlobalUIntA)($22)
	addiu	$2,$2,2
	addu	$21,$2,$21
	b	$L98
	sw	$21,%lo(GlobalUIntA)($22)

	.set	macro
	.set	reorder
	.end	SkeletalMatrix
	.size	SkeletalMatrix, .-SkeletalMatrix
	.align	2
	.globl	DrawOKAnimationLoop
	.set	nomips16
	.set	nomicromips
	.ent	DrawOKAnimationLoop
	.type	DrawOKAnimationLoop, @function
DrawOKAnimationLoop:
	.frame	$sp,192,$31		# vars= 24, regs= 10/0, args= 128, gp= 0
	.mask	0xc0ff0000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	addiu	$sp,$sp,-192
	sw	$31,188($sp)
	sw	$fp,184($sp)
	sw	$23,180($sp)
	sw	$22,176($sp)
	sw	$21,172($sp)
	sw	$20,168($sp)
	sw	$19,164($sp)
	sw	$18,160($sp)
	sw	$17,156($sp)
	sw	$16,152($sp)
	move	$fp,$4
	sw	$5,196($sp)
	lw	$2,4($4)
	blez	$2,$L103
	move	$21,$6

	sll	$2,$6,1
	addu	$2,$2,$6
	sll	$2,$2,2
	subu	$2,$2,$6
	sll	$2,$2,2
	sw	$2,136($sp)
	sll	$2,$5,3
	subu	$2,$2,$5
	sll	$2,$2,4
	subu	$2,$2,$5
	sll	$2,$2,2
	subu	$2,$2,$5
	sll	$2,$2,3
	addiu	$2,$2,20
	lui	$3,%hi(GlobalPlayer)
	addiu	$3,$3,%lo(GlobalPlayer)
	addu	$2,$3,$2
	sw	$2,132($sp)
	move	$22,$0
	lui	$19,%hi(OverKartRAMHeader)
	addiu	$19,$19,%lo(OverKartRAMHeader)
	sll	$2,$5,3
	subu	$2,$2,$5
	sll	$2,$2,4
	subu	$2,$2,$5
	sll	$2,$2,2
	subu	$2,$2,$5
	sll	$2,$2,3
	b	$L110
	sw	$2,140($sp)

$L106:
	lw	$4,8($20)
$L122:
	li	$2,167772160			# 0xa000000
	jal	GetRealAddress
	or	$4,$4,$2

	sw	$2,144($sp)
	sll	$4,$17,3
	addu	$4,$4,$17
	sll	$4,$4,2
	addu	$4,$4,$17
	sll	$4,$4,2
	lui	$2,%hi(OKObjectArray)
	addiu	$2,$2,%lo(OKObjectArray)
	addu	$4,$4,$2
	lbu	$2,-46($18)
	sw	$2,120($sp)
	lbu	$2,-45($18)
	sw	$2,116($sp)
	addiu	$2,$4,48
	addiu	$3,$sp,16
	addiu	$9,$4,144
$L107:
	lw	$8,0($2)
	lw	$7,4($2)
	lw	$6,8($2)
	lw	$5,12($2)
	sw	$8,0($3)
	sw	$7,4($3)
	sw	$6,8($3)
	sw	$5,12($3)
	addiu	$2,$2,16
	bne	$2,$9,$L107
	addiu	$3,$3,16

	lw	$2,0($2)
	sw	$2,0($3)
	lw	$5,36($4)
	lw	$6,40($4)
	lw	$7,44($4)
	jal	SkeletalMatrix
	move	$4,$fp

	bne	$2,$0,$L120
	move	$23,$2

	lw	$23,128($sp)
$L105:
	addiu	$17,$17,1
$L121:
	lw	$2,16($19)
	slt	$2,$17,$2
	beq	$2,$0,$L104
	addiu	$16,$16,148

$L109:
	lh	$2,-58($16)
	bne	$2,$21,$L105
	move	$18,$16

	lh	$3,-54($16)
	li	$2,-1			# 0xffffffffffffffff
	beql	$3,$2,$L121
	addiu	$17,$17,1

	lui	$2,%hi(GlobalPlayer)
	addiu	$2,$2,%lo(GlobalPlayer)
	lw	$3,140($sp)
	addu	$2,$3,$2
	lw	$3,12($19)
	lw	$4,136($sp)
	addu	$3,$3,$4
	lh	$5,14($3)
	lw	$7,112($2)
	lw	$6,132($sp)
	mtc1	$5,$f0
	nop
	cvt.s.w	$f0,$f0
	mfc1	$5,$f0
	jal	TestCollideSphere
	move	$4,$16

	beq	$2,$0,$L105
	sw	$2,128($sp)

	bnel	$23,$0,$L122
	lw	$4,8($20)

	lui	$3,%hi(GraphPtrOffset)
	lw	$2,%lo(GraphPtrOffset)($3)
	addiu	$4,$2,8
	sw	$4,%lo(GraphPtrOffset)($3)
	li	$3,100663296			# 0x6000000
	sw	$3,0($2)
	lw	$3,0($20)
	li	$4,167772160			# 0xa000000
	or	$3,$3,$4
	b	$L106
	sw	$3,4($2)

$L120:
	lw	$2,4($20)
	beq	$2,$0,$L105
	lw	$2,144($sp)

	move	$5,$0
	lui	$6,%hi(GraphPtrOffset)
	li	$8,100663296			# 0x6000000
	li	$7,167772160			# 0xa000000
$L108:
	lw	$3,%lo(GraphPtrOffset)($6)
	addiu	$4,$3,8
	sw	$4,%lo(GraphPtrOffset)($6)
	sw	$8,0($3)
	lw	$4,0($2)
	or	$4,$4,$7
	sw	$4,4($3)
	addiu	$5,$5,1
	lw	$3,4($20)
	sltu	$3,$5,$3
	bne	$3,$0,$L108
	addiu	$2,$2,4

	b	$L121
	addiu	$17,$17,1

$L104:
	addiu	$22,$22,1
	lw	$2,4($fp)
	slt	$2,$22,$2
	beql	$2,$0,$L123
	lw	$2,16($fp)

$L110:
	lw	$4,12($fp)
	li	$2,167772160			# 0xa000000
	jal	GetRealAddress
	or	$4,$4,$2

	sll	$20,$22,1
	addu	$20,$20,$22
	sll	$20,$20,2
	addu	$20,$20,$2
	lui	$2,%hi(GlobalAddressB)
	sw	$20,%lo(GlobalAddressB)($2)
	lw	$2,16($19)
	blez	$2,$L104
	lui	$16,%hi(OKObjectArray+60)

	addiu	$16,$16,%lo(OKObjectArray+60)
	move	$17,$0
	b	$L109
	move	$23,$0

$L103:
	lw	$2,16($fp)
$L123:
	blez	$2,$L102
	move	$17,$0

	lui	$16,%hi(GlobalAddressA)
	move	$6,$21
$L124:
	lw	$5,196($sp)
	jal	DrawOKAnimationLoop
	lw	$4,%lo(GlobalAddressA)($16)

	lw	$2,%lo(GlobalAddressA)($16)
	addiu	$2,$2,20
	sw	$2,%lo(GlobalAddressA)($16)
	addiu	$17,$17,1
	lw	$2,16($fp)
	slt	$2,$17,$2
	bne	$2,$0,$L124
	move	$6,$21

$L102:
	lw	$31,188($sp)
	lw	$fp,184($sp)
	lw	$23,180($sp)
	lw	$22,176($sp)
	lw	$21,172($sp)
	lw	$20,168($sp)
	lw	$19,164($sp)
	lw	$18,160($sp)
	lw	$17,156($sp)
	lw	$16,152($sp)
	jr	$31
	addiu	$sp,$sp,192

	.set	macro
	.set	reorder
	.end	DrawOKAnimationLoop
	.size	DrawOKAnimationLoop, .-DrawOKAnimationLoop
	.align	2
	.globl	DrawOKObjects
	.set	nomips16
	.set	nomicromips
	.ent	DrawOKObjects
	.type	DrawOKObjects, @function
DrawOKObjects:
	.frame	$sp,72,$31		# vars= 8, regs= 10/2, args= 16, gp= 0
	.mask	0xc0ff0000,-12
	.fmask	0x00300000,-8
	.set	noreorder
	.set	nomacro
	addiu	$sp,$sp,-72
	sw	$31,60($sp)
	sw	$fp,56($sp)
	sw	$23,52($sp)
	sw	$22,48($sp)
	sw	$21,44($sp)
	sw	$20,40($sp)
	sw	$19,36($sp)
	sw	$18,32($sp)
	sw	$17,28($sp)
	sw	$16,24($sp)
	sdc1	$f20,64($sp)
	lui	$2,%hi(scrollLock)
	lbu	$16,%lo(scrollLock)($2)
	beql	$16,$0,$L167
	lw	$31,60($sp)

	lui	$2,%hi(g_Camera1)
	addiu	$2,$2,%lo(g_Camera1)
	subu	$2,$4,$2
	li	$19,-1307181056			# 0xffffffffb2160000
	addiu	$19,$19,17097
	mult	$2,$19
	mfhi	$19
	addu	$19,$19,$2
	sra	$19,$19,7
	sra	$2,$2,31
	subu	$19,$19,$2
	lui	$2,%hi(OverKartRAMHeader+8)
	lw	$2,%lo(OverKartRAMHeader+8)($2)
	blez	$2,$L127
	li	$23,-2141192192			# 0xffffffff80600000

	move	$18,$0
	move	$17,$0
	lui	$22,%hi(OverKartRAMHeader)
	addiu	$22,$22,%lo(OverKartRAMHeader)
	li	$fp,167772160			# 0xa000000
	lui	$2,%hi(GlobalIntA)
	sw	$2,16($sp)
	lui	$2,%hi(GlobalAddressA)
	b	$L133
	sw	$2,20($sp)

$L159:
	jal	GetRealAddress
	or	$4,$4,$fp

	lw	$3,12($22)
	addu	$3,$3,$18
	lb	$4,20($3)
	blezl	$4,$L168
	lb	$2,17($3)

	move	$20,$2
	move	$21,$0
$L130:
	move	$6,$17
	move	$5,$19
	jal	DrawOKObjectLoop
	move	$4,$20

	addiu	$21,$21,1
	lw	$3,12($22)
	addu	$3,$3,$18
	lb	$2,20($3)
	slt	$2,$21,$2
	bne	$2,$0,$L130
	addiu	$20,$20,12

	lb	$2,17($3)
$L168:
	beql	$2,$0,$L158
	lw	$4,36($3)

	addiu	$17,$17,1
$L164:
	addiu	$18,$18,44
	lw	$2,8($22)
	slt	$2,$17,$2
	beq	$2,$0,$L127
	addiu	$23,$23,4

$L133:
	lw	$2,12($22)
	addu	$2,$2,$18
	lw	$4,40($2)
	li	$3,-1			# 0xffffffffffffffff
	beql	$4,$3,$L159
	lw	$4,32($2)

	jal	GetRealAddress
	or	$4,$4,$fp

	lw	$20,16($sp)
	sw	$2,%lo(GlobalIntA)($20)
	lw	$4,0($2)
	jal	GetRealAddress
	or	$4,$4,$fp

	addiu	$4,$2,4
	sw	$4,%lo(GlobalIntA)($20)
	addiu	$2,$2,24
	lw	$3,20($sp)
	sw	$2,%lo(GlobalAddressA)($3)
	sw	$4,0($23)
	move	$6,$17
	jal	DrawOKAnimationLoop
	move	$5,$19

	b	$L164
	addiu	$17,$17,1

$L158:
	jal	GetRealAddress
	or	$4,$4,$fp

	move	$21,$2
	lw	$2,12($22)
	addu	$2,$2,$18
	lb	$2,21($2)
	blezl	$2,$L164
	addiu	$17,$17,1

	move	$20,$0
$L132:
	move	$6,$17
	move	$5,$19
	jal	DrawOKObjectLoop
	move	$4,$21

	addiu	$20,$20,1
	lw	$2,12($22)
	addu	$2,$2,$18
	lb	$2,21($2)
	slt	$2,$20,$2
	bne	$2,$0,$L132
	addiu	$21,$21,12

	b	$L164
	addiu	$17,$17,1

$L127:
	lui	$2,%hi(OverKartRAMHeader+16)
	lw	$2,%lo(OverKartRAMHeader+16)($2)
	blez	$2,$L125
	sll	$2,$19,3

	subu	$2,$2,$19
	sll	$2,$2,4
	subu	$2,$2,$19
	sll	$2,$2,2
	subu	$2,$2,$19
	sll	$2,$2,3
	addiu	$2,$2,20
	lui	$21,%hi(GlobalPlayer)
	addiu	$21,$21,%lo(GlobalPlayer)
	addu	$21,$21,$2
	lui	$17,%hi(OKObjectArray+60)
	addiu	$17,$17,%lo(OKObjectArray+60)
	move	$18,$0
	lui	$20,%hi(OverKartRAMHeader)
	addiu	$20,$20,%lo(OverKartRAMHeader)
	lui	$2,%hi($LC4)
	b	$L136
	lwc1	$f20,%lo($LC4)($2)

$L161:
	jal	CalcDistance
	move	$4,$21

	swc1	$f0,-44($17)
$L135:
	addiu	$18,$18,1
	lw	$5,16($20)
	slt	$2,$18,$5
	beq	$2,$0,$L160
	addiu	$17,$17,148

$L136:
	lh	$4,-58($17)
	lw	$3,12($20)
	sll	$2,$4,1
	addu	$2,$2,$4
	sll	$2,$2,2
	subu	$2,$2,$4
	sll	$2,$2,2
	addu	$2,$3,$2
	lb	$2,17($2)
	bne	$2,$0,$L161
	move	$5,$17

	b	$L135
	swc1	$f20,-44($17)

$L160:
	blez	$5,$L125
	move	$18,$0

	lui	$fp,%hi(GlobalIntA)
	lui	$17,%hi(GlobalShortA)
	lui	$20,%hi(OverKartRAMHeader)
	addiu	$20,$20,%lo(OverKartRAMHeader)
	lui	$21,%hi(OKObjectArray)
	addiu	$21,$21,%lo(OKObjectArray)
	lui	$2,%hi($LC4)
	b	$L146
	lwc1	$f20,%lo($LC4)($2)

$L138:
	addiu	$2,$2,1
$L169:
	beq	$2,$5,$L162
	addiu	$3,$3,148

$L140:
	lwc1	$f0,0($3)
	mtc1	$4,$f2
	nop
	cvt.s.w	$f2,$f2
	c.lt.s	$f2,$f0
	nop
	bc1fl	$L169
	addiu	$2,$2,1

	trunc.w.s $f0,$f0
	mfc1	$4,$f0
	sll	$8,$2,16
	sra	$8,$8,16
	move	$6,$16
	b	$L138
	move	$7,$16

$L162:
	beq	$7,$0,$L141
	nop

	beq	$6,$0,$L142
	sh	$8,%lo(GlobalShortA)($17)

	sw	$4,%lo(GlobalIntA)($fp)
$L142:
	lh	$4,%lo(GlobalShortA)($17)
	li	$2,-1			# 0xffffffffffffffff
	beq	$4,$2,$L137
	sll	$2,$4,3

	addu	$2,$2,$4
	sll	$2,$2,2
	addu	$2,$2,$4
	sll	$2,$2,2
	addu	$2,$21,$2
	lh	$5,2($2)
	sll	$3,$5,1
	addu	$3,$3,$5
	sll	$3,$3,2
	subu	$3,$3,$5
	sll	$3,$3,2
	lw	$5,12($20)
	addu	$3,$5,$3
	lh	$5,14($3)
	mtc1	$5,$f0
	nop
	cvt.s.w	$f0,$f0
	lwc1	$f2,16($2)
	c.lt.s	$f2,$f0
	nop
	bc1fl	$L165
	lh	$3,%lo(GlobalShortA)($17)

	sll	$2,$4,3
	addu	$2,$2,$4
	sll	$2,$2,2
	addu	$2,$2,$4
	sll	$2,$2,2
	addu	$2,$21,$2
	lh	$4,6($2)
	li	$2,-1			# 0xffffffffffffffff
	bnel	$4,$2,$L163
	lw	$4,36($3)

$L143:
	lh	$3,%lo(GlobalShortA)($17)
$L165:
	sll	$2,$3,3
	addu	$2,$2,$3
	sll	$2,$2,2
	addu	$2,$2,$3
	sll	$2,$2,2
	addu	$2,$2,$21
	swc1	$f20,16($2)
$L137:
	addiu	$18,$18,1
$L166:
	lw	$5,16($20)
	slt	$2,$18,$5
	beq	$2,$0,$L167
	lw	$31,60($sp)

$L146:
	sw	$0,%lo(GlobalIntA)($fp)
	li	$2,-1			# 0xffffffffffffffff
	blez	$5,$L137
	sh	$2,%lo(GlobalShortA)($17)

	lui	$3,%hi(OKObjectArray+16)
	addiu	$3,$3,%lo(OKObjectArray+16)
	move	$6,$0
	move	$4,$0
	move	$7,$0
	li	$8,-1			# 0xffffffffffffffff
	b	$L140
	move	$2,$0

$L163:
	li	$2,167772160			# 0xa000000
	jal	GetRealAddress
	or	$4,$4,$2

	move	$22,$2
	lh	$4,%lo(GlobalShortA)($17)
	sll	$3,$4,3
	addu	$3,$3,$4
	sll	$3,$3,2
	addu	$3,$3,$4
	sll	$3,$3,2
	addu	$3,$21,$3
	lh	$6,2($3)
	lw	$4,12($20)
	sll	$3,$6,1
	addu	$3,$3,$6
	sll	$3,$3,2
	subu	$3,$3,$6
	sll	$3,$3,2
	addu	$3,$4,$3
	lb	$2,21($3)
	blez	$2,$L143
	move	$23,$0

$L145:
	move	$5,$19
	jal	DrawOKObjectLoop
	move	$4,$22

	addiu	$23,$23,1
	lh	$3,%lo(GlobalShortA)($17)
	sll	$2,$3,3
	addu	$2,$2,$3
	sll	$2,$2,2
	addu	$2,$2,$3
	sll	$2,$2,2
	addu	$2,$21,$2
	lh	$6,2($2)
	lw	$3,12($20)
	sll	$2,$6,1
	addu	$2,$2,$6
	sll	$2,$2,2
	subu	$2,$2,$6
	sll	$2,$2,2
	addu	$2,$3,$2
	lb	$2,21($2)
	slt	$2,$23,$2
	bne	$2,$0,$L145
	addiu	$22,$22,12

	b	$L165
	lh	$3,%lo(GlobalShortA)($17)

$L141:
	bnel	$6,$0,$L142
	sw	$4,%lo(GlobalIntA)($fp)

	b	$L166
	addiu	$18,$18,1

$L125:
	lw	$31,60($sp)
$L167:
	lw	$fp,56($sp)
	lw	$23,52($sp)
	lw	$22,48($sp)
	lw	$21,44($sp)
	lw	$20,40($sp)
	lw	$19,36($sp)
	lw	$18,32($sp)
	lw	$17,28($sp)
	lw	$16,24($sp)
	ldc1	$f20,64($sp)
	jr	$31
	addiu	$sp,$sp,72

	.set	macro
	.set	reorder
	.end	DrawOKObjects
	.size	DrawOKObjects, .-DrawOKObjects
	.align	2
	.globl	CheckOKObjects
	.set	nomips16
	.set	nomicromips
	.ent	CheckOKObjects
	.type	CheckOKObjects, @function
CheckOKObjects:
	.frame	$sp,40,$31		# vars= 0, regs= 6/0, args= 16, gp= 0
	.mask	0x801f0000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	lui	$2,%hi(scrollLock)
	lbu	$2,%lo(scrollLock)($2)
	beq	$2,$0,$L184
	lui	$2,%hi(OverKartRAMHeader+16)

	lw	$2,%lo(OverKartRAMHeader+16)($2)
	blez	$2,$L184
	nop

	addiu	$sp,$sp,-40
	sw	$31,36($sp)
	sw	$20,32($sp)
	sw	$19,28($sp)
	sw	$18,24($sp)
	sw	$17,20($sp)
	sw	$16,16($sp)
	lui	$16,%hi(OKObjectArray)
	addiu	$16,$16,%lo(OKObjectArray)
	move	$18,$0
	lui	$19,%hi(OverKartRAMHeader)
	addiu	$19,$19,%lo(OverKartRAMHeader)
	b	$L174
	li	$20,-1			# 0xffffffffffffffff

$L172:
	lh	$2,6($17)
$L182:
	bne	$2,$20,$L180
	nop

	addiu	$18,$18,1
$L183:
	lw	$2,16($19)
	slt	$2,$18,$2
	beq	$2,$0,$L181
	addiu	$16,$16,148

$L174:
	lh	$4,2($16)
	lw	$3,12($19)
	sll	$2,$4,1
	addu	$2,$2,$4
	sll	$2,$2,2
	subu	$2,$2,$4
	sll	$2,$2,2
	addu	$2,$3,$2
	lw	$2,40($2)
	beq	$2,$20,$L172
	move	$17,$16

	lbu	$2,14($16)
	addiu	$2,$2,1
	andi	$2,$2,0x00ff
	sb	$2,14($16)
	lbu	$3,15($16)
	sltu	$2,$2,$3
	beql	$2,$0,$L172
	sb	$0,14($16)

	b	$L182
	lh	$2,6($17)

$L180:
	jal	Misbehave
	move	$4,$17

	lh	$4,2($17)
	lw	$3,12($19)
	sll	$2,$4,1
	addu	$2,$2,$4
	sll	$2,$2,2
	subu	$2,$2,$4
	sll	$2,$2,2
	addu	$2,$3,$2
	lb	$2,22($2)
	blezl	$2,$L183
	addiu	$18,$18,1

	jal	OKObjectCollision
	move	$4,$17

	b	$L183
	addiu	$18,$18,1

$L181:
	lw	$31,36($sp)
	lw	$20,32($sp)
	lw	$19,28($sp)
	lw	$18,24($sp)
	lw	$17,20($sp)
	lw	$16,16($sp)
	jr	$31
	addiu	$sp,$sp,40

$L184:
	jr	$31
	nop

	.set	macro
	.set	reorder
	.end	CheckOKObjects
	.size	CheckOKObjects, .-CheckOKObjects
	.section	.rodata.cst4,"aM",@progbits,4
	.align	2
$LC0:
	.word	1056964608
	.align	2
$LC1:
	.word	1084227584
	.align	2
$LC2:
	.word	1065353216
	.align	2
$LC3:
	.word	1120403456
	.align	2
$LC4:
	.word	-1082130432
	.ident	"GCC: (GNU) 10.1.0"
