	.file	1 "GameTypesGeneric.c"
	.section .mdebug.abi32
	.previous
	.nan	legacy
	.module	fp=32
	.module	nooddspreg
	.text
	.align	2
	.globl	ResetFlag
	.set	nomips16
	.set	nomicromips
	.ent	ResetFlag
	.type	ResetFlag, @function
ResetFlag:
	.frame	$sp,0,$31		# vars= 0, regs= 0/0, args= 0, gp= 0
	.mask	0x00000000,0
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	sll	$6,$4,4
	subu	$2,$6,$4
	sll	$2,$2,3
	lui	$5,%hi(GameFlag)
	addiu	$5,$5,%lo(GameFlag)
	addu	$2,$2,$5
	sll	$3,$4,1
	addu	$3,$3,$4
	sll	$3,$3,2
	lui	$7,%hi(SpawnPoint)
	addiu	$7,$7,%lo(SpawnPoint)
	addu	$3,$3,$7
	lwc1	$f0,0($3)
	swc1	$f0,0($2)
	lwc1	$f0,4($3)
	swc1	$f0,4($2)
	lwc1	$f0,8($3)
	swc1	$f0,8($2)
	sw	$0,12($2)
	sw	$0,16($2)
	sw	$0,20($2)
	li	$3,-1			# 0xffffffffffffffff
	sb	$3,44($2)
	sh	$0,42($2)
	sh	$0,40($2)
	sh	$0,46($2)
	sh	$0,48($2)
	jr	$31
	sh	$0,50($2)

	.set	macro
	.set	reorder
	.end	ResetFlag
	.size	ResetFlag, .-ResetFlag
	.align	2
	.globl	PlacePlayerSpawn
	.set	nomips16
	.set	nomicromips
	.ent	PlacePlayerSpawn
	.type	PlacePlayerSpawn, @function
PlacePlayerSpawn:
	.frame	$sp,32,$31		# vars= 0, regs= 4/0, args= 16, gp= 0
	.mask	0x80070000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	addiu	$sp,$sp,-32
	sw	$31,28($sp)
	sw	$18,24($sp)
	sw	$17,20($sp)
	sw	$16,16($sp)
	move	$18,$5
	lui	$17,%hi(GlobalPlayer)
	addiu	$17,$17,%lo(GlobalPlayer)
	sll	$16,$5,3
	subu	$2,$16,$5
	sll	$2,$2,4
	subu	$2,$2,$5
	sll	$2,$2,2
	subu	$2,$2,$5
	sll	$2,$2,3
	addu	$2,$17,$2
	lh	$3,0($4)
	mtc1	$3,$f0
	nop
	cvt.s.w	$f0,$f0
	swc1	$f0,20($2)
	lh	$3,2($4)
	mtc1	$3,$f0
	nop
	cvt.s.w	$f0,$f0
	lui	$3,%hi($LC0)
	lwc1	$f2,%lo($LC0)($3)
	add.s	$f0,$f0,$f2
	swc1	$f0,24($2)
	lh	$3,4($4)
	mtc1	$3,$f0
	nop
	cvt.s.w	$f0,$f0
	swc1	$f0,28($2)
	subu	$4,$16,$5
	sll	$4,$4,4
	subu	$4,$4,$5
	sll	$4,$4,2
	subu	$4,$4,$5
	sll	$4,$4,3
	addiu	$4,$4,20
	lui	$5,%hi(Origin)
	addiu	$5,$5,%lo(Origin)
	jal	CalcDirection
	addu	$4,$17,$4

	subu	$16,$16,$18
	sll	$16,$16,4
	subu	$16,$16,$18
	sll	$16,$16,2
	subu	$5,$16,$18
	sll	$5,$5,3
	addu	$5,$17,$5
	subu	$2,$0,$2
	sh	$2,46($5)
	lw	$31,28($sp)
	lw	$18,24($sp)
	lw	$17,20($sp)
	lw	$16,16($sp)
	jr	$31
	addiu	$sp,$sp,32

	.set	macro
	.set	reorder
	.end	PlacePlayerSpawn
	.size	PlacePlayerSpawn, .-PlacePlayerSpawn
	.align	2
	.globl	PlaceFlagSpawn
	.set	nomips16
	.set	nomicromips
	.ent	PlaceFlagSpawn
	.type	PlaceFlagSpawn, @function
PlaceFlagSpawn:
	.frame	$sp,24,$31		# vars= 0, regs= 1/0, args= 16, gp= 0
	.mask	0x80000000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	addiu	$sp,$sp,-24
	sw	$31,20($sp)
	move	$3,$4
	move	$4,$5
	sll	$2,$5,1
	addu	$2,$2,$5
	sll	$2,$2,2
	lui	$5,%hi(SpawnPoint)
	addiu	$5,$5,%lo(SpawnPoint)
	addu	$2,$2,$5
	lh	$5,0($3)
	mtc1	$5,$f0
	nop
	cvt.s.w	$f0,$f0
	swc1	$f0,0($2)
	lh	$5,2($3)
	mtc1	$5,$f0
	nop
	cvt.s.w	$f0,$f0
	lui	$5,%hi($LC0)
	lwc1	$f2,%lo($LC0)($5)
	add.s	$f0,$f0,$f2
	swc1	$f0,4($2)
	lh	$3,4($3)
	mtc1	$3,$f0
	nop
	cvt.s.w	$f0,$f0
	jal	ResetFlag
	swc1	$f0,8($2)

	lw	$31,20($sp)
	jr	$31
	addiu	$sp,$sp,24

	.set	macro
	.set	reorder
	.end	PlaceFlagSpawn
	.size	PlaceFlagSpawn, .-PlaceFlagSpawn
	.align	2
	.globl	PlaceBaseSpawn
	.set	nomips16
	.set	nomicromips
	.ent	PlaceBaseSpawn
	.type	PlaceBaseSpawn, @function
PlaceBaseSpawn:
	.frame	$sp,0,$31		# vars= 0, regs= 0/0, args= 0, gp= 0
	.mask	0x00000000,0
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	sll	$2,$5,4
	subu	$3,$2,$5
	sll	$3,$3,3
	lui	$6,%hi(GameBase)
	addiu	$6,$6,%lo(GameBase)
	addu	$3,$3,$6
	lh	$7,0($4)
	mtc1	$7,$f0
	nop
	cvt.s.w	$f0,$f0
	swc1	$f0,0($3)
	lh	$7,2($4)
	mtc1	$7,$f0
	nop
	cvt.s.w	$f0,$f0
	swc1	$f0,4($3)
	move	$2,$3
	lh	$3,4($4)
	mtc1	$3,$f0
	nop
	cvt.s.w	$f0,$f0
	jr	$31
	swc1	$f0,8($2)

	.set	macro
	.set	reorder
	.end	PlaceBaseSpawn
	.size	PlaceBaseSpawn, .-PlaceBaseSpawn
	.align	2
	.globl	DrawGameBase
	.set	nomips16
	.set	nomicromips
	.ent	DrawGameBase
	.type	DrawGameBase, @function
DrawGameBase:
	.frame	$sp,40,$31		# vars= 0, regs= 6/0, args= 16, gp= 0
	.mask	0x801f0000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	lui	$2,%hi(objectAngle)
	sh	$0,%lo(objectAngle)($2)
	addiu	$2,$2,%lo(objectAngle)
	sh	$0,2($2)
	sh	$0,4($2)
	lui	$2,%hi(FlagCount)
	lb	$2,%lo(FlagCount)($2)
	blez	$2,$L15
	lui	$2,%hi($LC1)

	addiu	$sp,$sp,-40
	sw	$31,36($sp)
	sw	$20,32($sp)
	sw	$19,28($sp)
	sw	$18,24($sp)
	sw	$17,20($sp)
	sw	$16,16($sp)
	lui	$16,%hi(GameBase)
	addiu	$16,$16,%lo(GameBase)
	move	$17,$0
	lw	$20,%lo($LC1)($2)
	lui	$18,%hi(objectAngle)
	addiu	$18,$18,%lo(objectAngle)
	lui	$19,%hi(FlagCount)
$L9:
	move	$7,$20
	lw	$6,52($16)
	move	$5,$18
	jal	DrawGeometryScale
	move	$4,$16

	addiu	$17,$17,1
	lb	$2,%lo(FlagCount)($19)
	slt	$2,$17,$2
	bne	$2,$0,$L9
	addiu	$16,$16,120

	lw	$31,36($sp)
	lw	$20,32($sp)
	lw	$19,28($sp)
	lw	$18,24($sp)
	lw	$17,20($sp)
	lw	$16,16($sp)
	jr	$31
	addiu	$sp,$sp,40

$L15:
	jr	$31
	nop

	.set	macro
	.set	reorder
	.end	DrawGameBase
	.size	DrawGameBase, .-DrawGameBase
	.align	2
	.globl	DrawGameFlags
	.set	nomips16
	.set	nomicromips
	.ent	DrawGameFlags
	.type	DrawGameFlags, @function
DrawGameFlags:
	.frame	$sp,96,$31		# vars= 0, regs= 5/10, args= 32, gp= 0
	.mask	0x800f0000,-44
	.fmask	0x3ff00000,-8
	.set	noreorder
	.set	nomacro
	lui	$2,%hi(FlagCount)
	lb	$2,%lo(FlagCount)($2)
	blez	$2,$L48
	lui	$2,%hi($LC2)

	addiu	$sp,$sp,-96
	sw	$31,52($sp)
	sw	$19,48($sp)
	sw	$18,44($sp)
	sw	$17,40($sp)
	sw	$16,36($sp)
	sdc1	$f28,88($sp)
	sdc1	$f26,80($sp)
	sdc1	$f24,72($sp)
	sdc1	$f22,64($sp)
	sdc1	$f20,56($sp)
	lui	$16,%hi(GameFlag)
	addiu	$16,$16,%lo(GameFlag)
	move	$18,$0
	lwc1	$f28,%lo($LC2)($2)
	lui	$2,%hi($LC4)
	ldc1	$f24,%lo($LC4)($2)
	lui	$3,%hi($LC5)
	ldc1	$f22,%lo($LC5)($3)
	mov.d	$f26,$f24
	lui	$2,%hi($LC7)
	b	$L28
	ldc1	$f20,%lo($LC7)($2)

$L18:
	lwc1	$f2,12($16)
	lwc1	$f0,0($16)
	add.s	$f0,$f2,$f0
	mfc1	$6,$f0
	swc1	$f0,0($16)
	lwc1	$f4,16($16)
	lwc1	$f0,4($16)
	add.s	$f0,$f4,$f0
	mfc1	$7,$f0
	swc1	$f0,4($16)
	lwc1	$f6,20($16)
	lwc1	$f0,8($16)
	add.s	$f0,$f6,$f0
	swc1	$f0,8($16)
	addiu	$19,$16,56
	sub.s	$f6,$f0,$f6
	swc1	$f6,28($sp)
	mtc1	$7,$f6
	nop
	sub.s	$f4,$f6,$f4
	swc1	$f4,24($sp)
	mtc1	$6,$f4
	nop
	sub.s	$f2,$f4,$f2
	swc1	$f2,20($sp)
	swc1	$f0,16($sp)
	mfc1	$5,$f28
	jal	CheckBump2
	move	$4,$19

	move	$5,$16
	jal	ManualBump
	move	$4,$19

	lwc1	$f2,68($16)
	mtc1	$0,$f0
	nop
	c.lt.s	$f2,$f0
	nop
	bc1t	$L41
	addiu	$5,$16,12

	lwc1	$f2,72($17)
$L45:
	mtc1	$0,$f0
	nop
	c.lt.s	$f2,$f0
	nop
	bc1t	$L42
	addiu	$5,$16,12

	lwc1	$f2,76($17)
$L46:
	mtc1	$0,$f0
	nop
	c.lt.s	$f2,$f0
	nop
	bc1tl	$L43
	lh	$2,32($17)

	lh	$2,36($17)
	mtc1	$2,$f0
	nop
	cvt.s.w	$f0,$f0
	lui	$2,%hi($LC6)
	lwc1	$f2,%lo($LC6)($2)
	div.s	$f0,$f0,$f2
	lwc1	$f2,16($17)
	sub.s	$f0,$f2,$f0
	swc1	$f0,16($17)
$L19:
	lh	$7,30($17)
	mtc1	$7,$f0
	nop
	cvt.d.w	$f0,$f0
	div.d	$f0,$f0,$f20
	cvt.s.d	$f0,$f0
	mfc1	$7,$f0
	lw	$6,52($17)
	addiu	$5,$16,46
	jal	DrawGeometryScale
	move	$4,$17

	addiu	$18,$18,1
	lui	$2,%hi(FlagCount)
	lb	$2,%lo(FlagCount)($2)
	slt	$2,$18,$2
	beq	$2,$0,$L44
	addiu	$16,$16,120

$L28:
	lb	$3,44($16)
	lui	$2,%hi(GlobalIntA)
	sw	$3,%lo(GlobalIntA)($2)
	lhu	$4,24($16)
	sll	$2,$4,1
	addu	$2,$2,$4
	sll	$2,$2,3
	subu	$2,$2,$4
	sll	$2,$2,2
	subu	$2,$2,$4
	sll	$2,$2,1
	lhu	$4,46($16)
	addu	$2,$2,$4
	sh	$2,46($16)
	lhu	$4,26($16)
	sll	$2,$4,1
	addu	$2,$2,$4
	sll	$2,$2,3
	subu	$2,$2,$4
	sll	$2,$2,2
	subu	$2,$2,$4
	sll	$2,$2,1
	lhu	$4,48($16)
	addu	$2,$2,$4
	sh	$2,48($16)
	lhu	$4,28($16)
	sll	$2,$4,1
	addu	$2,$2,$4
	sll	$2,$2,3
	subu	$2,$2,$4
	sll	$2,$2,2
	subu	$2,$2,$4
	sll	$2,$2,1
	lhu	$4,50($16)
	addu	$2,$2,$4
	sh	$2,50($16)
	li	$2,-1			# 0xffffffffffffffff
	beq	$3,$2,$L18
	move	$17,$16

	lui	$5,%hi(GlobalPlayer)
	addiu	$5,$5,%lo(GlobalPlayer)
	sll	$2,$3,3
	subu	$4,$2,$3
	sll	$4,$4,4
	subu	$4,$4,$3
	sll	$4,$4,2
	subu	$4,$4,$3
	sll	$4,$4,3
	addu	$4,$5,$4
	lwc1	$f0,20($4)
	swc1	$f0,0($16)
	lwc1	$f0,24($4)
	lui	$4,%hi($LC0)
	lwc1	$f2,%lo($LC0)($4)
	add.s	$f0,$f0,$f2
	swc1	$f0,4($16)
	subu	$2,$2,$3
	sll	$2,$2,4
	subu	$2,$2,$3
	sll	$2,$2,2
	subu	$3,$2,$3
	sll	$3,$3,3
	addu	$3,$5,$3
	lwc1	$f0,28($3)
	swc1	$f0,8($16)
	sw	$0,12($16)
	sw	$0,16($16)
	b	$L19
	sw	$0,20($16)

$L41:
	jal	ManualBounce
	addiu	$4,$16,80

	b	$L45
	lwc1	$f2,72($17)

$L42:
	jal	ManualBounce
	addiu	$4,$16,92

	b	$L46
	lwc1	$f2,76($17)

$L43:
	mtc1	$2,$f0
	nop
	cvt.s.w	$f0,$f0
	lui	$2,%hi($LC3)
	lwc1	$f2,%lo($LC3)($2)
	div.s	$f0,$f0,$f2
	cvt.d.s	$f0,$f0
	sub.d	$f0,$f24,$f0
	lwc1	$f2,12($17)
	cvt.d.s	$f2,$f2
	mul.d	$f2,$f2,$f0
	cvt.s.d	$f2,$f2
	swc1	$f2,12($17)
	lwc1	$f2,16($17)
	cvt.d.s	$f6,$f2
	lh	$2,36($17)
	mtc1	$2,$f2
	nop
	cvt.d.w	$f4,$f2
	div.d	$f4,$f4,$f22
	c.lt.d	$f6,$f4
	nop
	bc1f	$L36
	nop

	lh	$2,34($17)
	mtc1	$2,$f2
	nop
	cvt.s.w	$f2,$f2
	lui	$2,%hi($LC6)
	lwc1	$f4,%lo($LC6)($2)
	div.s	$f2,$f2,$f4
	cvt.d.s	$f2,$f2
	sub.d	$f2,$f2,$f26
	mul.d	$f2,$f2,$f6
	cvt.s.d	$f2,$f2
	swc1	$f2,16($17)
$L47:
	lwc1	$f2,20($17)
	cvt.d.s	$f2,$f2
	mul.d	$f0,$f2,$f0
	cvt.s.d	$f0,$f0
	b	$L19
	swc1	$f0,20($17)

$L36:
	mtc1	$0,$f2
	b	$L47
	swc1	$f2,16($17)

$L44:
	lw	$31,52($sp)
	lw	$19,48($sp)
	lw	$18,44($sp)
	lw	$17,40($sp)
	lw	$16,36($sp)
	ldc1	$f28,88($sp)
	ldc1	$f26,80($sp)
	ldc1	$f24,72($sp)
	ldc1	$f22,64($sp)
	ldc1	$f20,56($sp)
	jr	$31
	addiu	$sp,$sp,96

$L48:
	jr	$31
	nop

	.set	macro
	.set	reorder
	.end	DrawGameFlags
	.size	DrawGameFlags, .-DrawGameFlags
	.align	2
	.globl	DropFlag
	.set	nomips16
	.set	nomicromips
	.ent	DropFlag
	.type	DropFlag, @function
DropFlag:
	.frame	$sp,40,$31		# vars= 0, regs= 6/0, args= 16, gp= 0
	.mask	0x801f0000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	addiu	$sp,$sp,-40
	sw	$31,36($sp)
	sw	$20,32($sp)
	sw	$19,28($sp)
	sw	$18,24($sp)
	sw	$17,20($sp)
	sw	$16,16($sp)
	move	$16,$4
	sll	$2,$4,3
	lui	$3,%hi(Objectives)
	addiu	$3,$3,%lo(Objectives)
	addu	$2,$2,$3
	lb	$4,0($2)
	li	$2,-1			# 0xffffffffffffffff
	bne	$4,$2,$L52
	lui	$19,%hi(GlobalIntA)

$L49:
	lw	$31,36($sp)
	lw	$20,32($sp)
	lw	$19,28($sp)
	lw	$18,24($sp)
	lw	$17,20($sp)
	lw	$16,16($sp)
	jr	$31
	addiu	$sp,$sp,40

$L52:
	sw	$4,%lo(GlobalIntA)($19)
	sll	$3,$4,4
	subu	$5,$3,$4
	sll	$5,$5,3
	lui	$17,%hi(GameFlag)
	addiu	$17,$17,%lo(GameFlag)
	addu	$5,$5,$17
	lui	$20,%hi(GlobalPlayer)
	sll	$18,$16,3
	subu	$2,$18,$16
	sll	$2,$2,4
	subu	$2,$2,$16
	sll	$2,$2,2
	subu	$2,$2,$16
	sll	$2,$2,3
	addiu	$20,$20,%lo(GlobalPlayer)
	addu	$20,$20,$2
	lwc1	$f0,20($20)
	swc1	$f0,0($5)
	lwc1	$f0,24($20)
	lui	$2,%hi($LC0)
	lwc1	$f2,%lo($LC0)($2)
	add.s	$f0,$f0,$f2
	swc1	$f0,4($5)
	lwc1	$f0,28($20)
	swc1	$f0,8($5)
	jal	MakeRandomLimmit
	li	$4,4			# 0x4

	lw	$5,%lo(GlobalIntA)($19)
	sll	$3,$5,4
	subu	$4,$3,$5
	sll	$4,$4,3
	addu	$4,$17,$4
	addiu	$2,$2,-2
	mtc1	$2,$f0
	nop
	cvt.s.w	$f0,$f0
	swc1	$f0,12($4)
	lh	$2,38($4)
	mtc1	$2,$f0
	nop
	cvt.s.w	$f0,$f0
	lui	$2,%hi($LC6)
	lwc1	$f2,%lo($LC6)($2)
	div.s	$f0,$f0,$f2
	swc1	$f0,16($4)
	jal	MakeRandomLimmit
	li	$4,6			# 0x6

	lw	$4,%lo(GlobalIntA)($19)
	sll	$3,$4,4
	subu	$3,$3,$4
	sll	$3,$3,3
	addu	$3,$17,$3
	addiu	$2,$2,-3
	mtc1	$2,$f0
	nop
	cvt.s.w	$f0,$f0
	swc1	$f0,20($3)
	lh	$5,46($20)
	lui	$4,%hi(objectVelocity)
	jal	MakeAlignVector
	addiu	$4,$4,%lo(objectVelocity)

	lui	$2,%hi($LC8)
	lw	$5,%lo($LC8)($2)
	sll	$4,$16,24
	jal	ChangeMaxSpeed
	sra	$4,$4,24

	lui	$2,%hi(Objectives)
	addiu	$2,$2,%lo(Objectives)
	addu	$18,$18,$2
	lb	$4,0($18)
	sll	$2,$4,4
	subu	$3,$2,$4
	sll	$3,$3,3
	addu	$3,$17,$3
	li	$5,-1			# 0xffffffffffffffff
	sb	$5,44($3)
	li	$6,30			# 0x1e
	sh	$6,42($3)
	li	$2,120			# 0x78
	sh	$2,40($3)
	sb	$5,0($18)
	li	$2,100			# 0x64
	b	$L49
	sh	$2,4($18)

	.set	macro
	.set	reorder
	.end	DropFlag
	.size	DropFlag, .-DropFlag
	.align	2
	.globl	CheckExecuteItem
	.set	nomips16
	.set	nomicromips
	.ent	CheckExecuteItem
	.type	CheckExecuteItem, @function
CheckExecuteItem:
	.frame	$sp,0,$31		# vars= 0, regs= 0/0, args= 0, gp= 0
	.mask	0x00000000,0
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	sll	$4,$4,3
	lui	$2,%hi(Objectives)
	addiu	$2,$2,%lo(Objectives)
	addu	$4,$4,$2
	lb	$2,0($4)
	addiu	$2,$2,1
	jr	$31
	sltu	$2,$2,1

	.set	macro
	.set	reorder
	.end	CheckExecuteItem
	.size	CheckExecuteItem, .-CheckExecuteItem
	.globl	ObjectiveMapID
	.section	.bss,"aw",@nobits
	.align	2
	.type	ObjectiveMapID, @object
	.size	ObjectiveMapID, 4
ObjectiveMapID:
	.space	4
	.section	.rodata.cst4,"aM",@progbits,4
	.align	2
$LC0:
	.word	1084227584
	.align	2
$LC1:
	.word	1051931443
	.align	2
$LC2:
	.word	1082130432
	.align	2
$LC3:
	.word	1189765120
	.section	.rodata.cst8,"aM",@progbits,8
	.align	3
$LC4:
	.word	1072693248
	.word	0
	.align	3
$LC5:
	.word	-1066450944
	.word	0
	.section	.rodata.cst4
	.align	2
$LC6:
	.word	1148846080
	.section	.rodata.cst8
	.align	3
$LC7:
	.word	1083129856
	.word	0
	.section	.rodata.cst4
	.align	2
$LC8:
	.word	1114636288
	.ident	"GCC: (GNU) 10.1.0"
