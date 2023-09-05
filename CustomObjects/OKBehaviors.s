	.file	1 "OKBehaviors.c"
	.section .mdebug.abi32
	.previous
	.nan	legacy
	.module	fp=32
	.module	nooddspreg
	.text
	.align	2
	.globl	ObjectSubBehaviorTurnTarget
	.set	nomips16
	.set	nomicromips
	.ent	ObjectSubBehaviorTurnTarget
	.type	ObjectSubBehaviorTurnTarget, @function
ObjectSubBehaviorTurnTarget:
	.frame	$sp,32,$31		# vars= 0, regs= 3/0, args= 16, gp= 0
	.mask	0x80030000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	addiu	$sp,$sp,-32
	sw	$31,28($sp)
	sw	$17,24($sp)
	sw	$16,20($sp)
	move	$17,$5
	move	$16,$7
	lw	$7,8($6)
	lw	$6,0($6)
	lwc1	$f14,8($4)
	jal	MakeDirection
	lwc1	$f12,0($4)

	addu	$3,$2,$17
	subu	$3,$0,$3
	sll	$3,$3,16
	sra	$3,$3,16
	lui	$2,%hi(GlobalShortA)
	sh	$3,%lo(GlobalShortA)($2)
	sll	$2,$16,1
	addu	$2,$2,$16
	sll	$2,$2,3
	subu	$2,$2,$16
	sll	$2,$2,2
	subu	$2,$2,$16
	sll	$2,$2,1
	slt	$2,$2,$3
	bne	$2,$0,$L5
	li	$2,1			# 0x1

	sll	$2,$16,1
	addu	$2,$2,$16
	sll	$2,$2,3
	subu	$2,$2,$16
	sll	$2,$2,2
	subu	$2,$16,$2
	sll	$2,$2,1
	slt	$2,$3,$2
	subu	$2,$0,$2
$L2:
$L5:
	lw	$31,28($sp)
	lw	$17,24($sp)
	lw	$16,20($sp)
	jr	$31
	addiu	$sp,$sp,32

	.set	macro
	.set	reorder
	.end	ObjectSubBehaviorTurnTarget
	.size	ObjectSubBehaviorTurnTarget, .-ObjectSubBehaviorTurnTarget
	.align	2
	.globl	ObjectSubBehaviorLookTarget
	.set	nomips16
	.set	nomicromips
	.ent	ObjectSubBehaviorLookTarget
	.type	ObjectSubBehaviorLookTarget, @function
ObjectSubBehaviorLookTarget:
	.frame	$sp,32,$31		# vars= 0, regs= 3/0, args= 16, gp= 0
	.mask	0x80030000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	addiu	$sp,$sp,-32
	sw	$31,28($sp)
	sw	$17,24($sp)
	sw	$16,20($sp)
	move	$16,$4
	lh	$4,2($4)
	sll	$2,$4,1
	addu	$2,$2,$4
	sll	$2,$2,2
	subu	$2,$2,$4
	sll	$2,$2,2
	lui	$4,%hi(OverKartRAMHeader+12)
	lw	$17,%lo(OverKartRAMHeader+12)($4)
	addu	$17,$17,$2
	lh	$2,2($17)
	mtc1	$2,$f0
	nop
	cvt.s.w	$f2,$f0
	lui	$2,%hi(GlobalFloatA)
	swc1	$f2,%lo(GlobalFloatA)($2)
	lwc1	$f0,60($16)
	lwc1	$f4,0($5)
	sub.s	$f0,$f0,$f4
	lui	$2,%hi(GlobalFloatB)
	swc1	$f0,%lo(GlobalFloatB)($2)
	lwc1	$f6,68($16)
	lwc1	$f4,8($5)
	sub.s	$f4,$f6,$f4
	lui	$2,%hi(GlobalFloatC)
	swc1	$f4,%lo(GlobalFloatC)($2)
	mul.s	$f0,$f0,$f0
	mul.s	$f4,$f4,$f4
	add.s	$f0,$f0,$f4
	mul.s	$f2,$f2,$f2
	div.s	$f0,$f0,$f2
	lui	$2,%hi(GlobalFloatD)
	swc1	$f0,%lo(GlobalFloatD)($2)
	jal	CalcDirection
	addiu	$4,$16,60

	lhu	$3,54($16)
	addu	$3,$2,$3
	subu	$3,$0,$3
	sll	$3,$3,16
	sra	$3,$3,16
	lui	$2,%hi(GlobalShortA)
	sh	$3,%lo(GlobalShortA)($2)
	lh	$5,10($17)
	srl	$2,$5,31
	addu	$2,$2,$5
	sra	$4,$2,1
	sll	$2,$4,1
	addu	$2,$2,$4
	sll	$2,$2,3
	subu	$2,$2,$4
	sll	$2,$2,2
	subu	$2,$2,$4
	sll	$2,$2,1
	slt	$2,$3,$2
	beq	$2,$0,$L8
	lui	$2,%hi($LC0)

	subu	$2,$0,$4
	sll	$4,$2,16
	sra	$4,$4,16
	sll	$2,$4,1
	addu	$2,$2,$4
	sll	$2,$2,3
	subu	$2,$2,$4
	sll	$2,$2,2
	subu	$2,$2,$4
	sll	$2,$2,1
	slt	$2,$2,$3
	bne	$2,$0,$L11
	lui	$2,%hi($LC0)

	b	$L6
	lwc1	$f0,%lo($LC0)($2)

$L11:
	lui	$2,%hi(GlobalFloatD)
	b	$L6
	lwc1	$f0,%lo(GlobalFloatD)($2)

$L8:
	lwc1	$f0,%lo($LC0)($2)
$L6:
	lw	$31,28($sp)
	lw	$17,24($sp)
	lw	$16,20($sp)
	jr	$31
	addiu	$sp,$sp,32

	.set	macro
	.set	reorder
	.end	ObjectSubBehaviorLookTarget
	.size	ObjectSubBehaviorLookTarget, .-ObjectSubBehaviorLookTarget
	.align	2
	.globl	ObjectSubBehaviorLookedAt
	.set	nomips16
	.set	nomicromips
	.ent	ObjectSubBehaviorLookedAt
	.type	ObjectSubBehaviorLookedAt, @function
ObjectSubBehaviorLookedAt:
	.frame	$sp,3568,$31		# vars= 3544, regs= 2/0, args= 16, gp= 0
	.mask	0x80010000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	addiu	$sp,$sp,-3568
	sw	$31,3564($sp)
	sw	$16,3560($sp)
	move	$16,$6
	lh	$2,2($4)
	sll	$3,$2,1
	addu	$3,$3,$2
	sll	$3,$3,2
	subu	$3,$3,$2
	sll	$3,$3,2
	lui	$2,%hi(OverKartRAMHeader+12)
	lw	$2,%lo(OverKartRAMHeader+12)($2)
	addu	$3,$2,$3
	sll	$2,$5,3
	subu	$2,$2,$5
	sll	$2,$2,4
	subu	$2,$2,$5
	sll	$2,$2,2
	subu	$2,$2,$5
	sll	$2,$2,3
	lui	$5,%hi(GlobalPlayer)
	addiu	$5,$5,%lo(GlobalPlayer)
	addu	$2,$2,$5
	addiu	$6,$sp,16
	addiu	$5,$2,3536
$L13:
	lw	$10,0($2)
	lw	$9,4($2)
	lw	$8,8($2)
	lw	$7,12($2)
	sw	$10,0($6)
	sw	$9,4($6)
	sw	$8,8($6)
	sw	$7,12($6)
	addiu	$2,$2,16
	bne	$2,$5,$L13
	addiu	$6,$6,16

	lw	$5,0($2)
	lw	$2,4($2)
	sw	$5,0($6)
	sw	$2,4($6)
	lh	$2,2($3)
	mtc1	$2,$f0
	nop
	cvt.s.w	$f2,$f0
	lui	$2,%hi(GlobalFloatA)
	swc1	$f2,%lo(GlobalFloatA)($2)
	lwc1	$f4,60($4)
	lwc1	$f0,36($sp)
	sub.s	$f0,$f0,$f4
	lui	$2,%hi(GlobalFloatB)
	swc1	$f0,%lo(GlobalFloatB)($2)
	lwc1	$f6,68($4)
	lwc1	$f4,44($sp)
	sub.s	$f4,$f4,$f6
	lui	$2,%hi(GlobalFloatC)
	swc1	$f4,%lo(GlobalFloatC)($2)
	mul.s	$f0,$f0,$f0
	mul.s	$f4,$f4,$f4
	add.s	$f0,$f0,$f4
	mul.s	$f2,$f2,$f2
	div.s	$f0,$f0,$f2
	lui	$2,%hi(GlobalFloatD)
	swc1	$f0,%lo(GlobalFloatD)($2)
	addiu	$5,$4,60
	jal	CalcDirection
	addiu	$4,$sp,36

	lhu	$3,62($sp)
	addu	$3,$2,$3
	subu	$3,$0,$3
	sll	$3,$3,16
	sra	$3,$3,16
	lui	$2,%hi(GlobalShortA)
	sh	$3,%lo(GlobalShortA)($2)
	srl	$2,$16,31
	addu	$2,$2,$16
	sra	$4,$2,1
	sll	$2,$4,1
	addu	$2,$2,$4
	sll	$2,$2,3
	subu	$2,$2,$4
	sll	$2,$2,2
	subu	$2,$2,$4
	sll	$2,$2,1
	slt	$2,$3,$2
	beq	$2,$0,$L15
	lui	$2,%hi($LC0)

	subu	$2,$0,$4
	sll	$16,$2,16
	sra	$16,$16,16
	sll	$2,$16,1
	addu	$2,$2,$16
	sll	$2,$2,3
	subu	$2,$2,$16
	sll	$2,$2,2
	subu	$2,$2,$16
	sll	$2,$2,1
	slt	$3,$2,$3
	bne	$3,$0,$L19
	lui	$2,%hi($LC0)

	b	$L12
	lwc1	$f0,%lo($LC0)($2)

$L19:
	lui	$2,%hi(GlobalFloatD)
	b	$L12
	lwc1	$f0,%lo(GlobalFloatD)($2)

$L15:
	lwc1	$f0,%lo($LC0)($2)
$L12:
	lw	$31,3564($sp)
	lw	$16,3560($sp)
	jr	$31
	addiu	$sp,$sp,3568

	.set	macro
	.set	reorder
	.end	ObjectSubBehaviorLookedAt
	.size	ObjectSubBehaviorLookedAt, .-ObjectSubBehaviorLookedAt
	.align	2
	.globl	ObjectBehaviorExist
	.set	nomips16
	.set	nomicromips
	.ent	ObjectBehaviorExist
	.type	ObjectBehaviorExist, @function
ObjectBehaviorExist:
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
	lh	$3,2($4)
	sll	$2,$3,1
	addu	$2,$2,$3
	sll	$2,$2,2
	subu	$2,$2,$3
	sll	$2,$2,2
	lui	$3,%hi(OverKartRAMHeader+12)
	lw	$17,%lo(OverKartRAMHeader+12)($3)
	addu	$17,$17,$2
	lb	$3,18($17)
	li	$2,1			# 0x1
	beq	$3,$2,$L26
	move	$16,$4

	addiu	$18,$16,36
$L28:
	jal	UpdateObjectVelocity
	move	$4,$18

	lh	$2,4($17)
	bgtz	$2,$L27
	nop

$L20:
	lw	$31,28($sp)
$L29:
	lw	$18,24($sp)
	lw	$17,20($sp)
	lw	$16,16($sp)
	jr	$31
	addiu	$sp,$sp,32

$L26:
	jal	UpdateObjectGravity
	addiu	$4,$4,36

	b	$L28
	addiu	$18,$16,36

$L27:
	jal	UpdateObjectBump
	move	$4,$18

	lwc1	$f2,104($16)
	mtc1	$0,$f0
	nop
	c.lt.s	$f2,$f0
	nop
	bc1tl	$L20
	swc1	$f0,76($16)

	b	$L29
	lw	$31,28($sp)

	.set	macro
	.set	reorder
	.end	ObjectBehaviorExist
	.size	ObjectBehaviorExist, .-ObjectBehaviorExist
	.align	2
	.globl	ObjectBehaviorWalk
	.set	nomips16
	.set	nomicromips
	.ent	ObjectBehaviorWalk
	.type	ObjectBehaviorWalk, @function
ObjectBehaviorWalk:
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
	move	$16,$4
	lui	$18,%hi(objectVelocity)
	sw	$0,%lo(objectVelocity)($18)
	addiu	$17,$18,%lo(objectVelocity)
	lwc1	$f0,76($4)
	swc1	$f0,4($17)
	sw	$5,8($17)
	lh	$5,54($4)
	jal	MakeAlignVector
	move	$4,$17

	lwc1	$f0,%lo(objectVelocity)($18)
	swc1	$f0,72($16)
	lwc1	$f0,4($17)
	swc1	$f0,76($16)
	lwc1	$f0,8($17)
	swc1	$f0,80($16)
	jal	ObjectBehaviorExist
	move	$4,$16

	lw	$31,28($sp)
	lw	$18,24($sp)
	lw	$17,20($sp)
	lw	$16,16($sp)
	jr	$31
	addiu	$sp,$sp,32

	.set	macro
	.set	reorder
	.end	ObjectBehaviorWalk
	.size	ObjectBehaviorWalk, .-ObjectBehaviorWalk
	.align	2
	.globl	ObjectBehaviorStrafe
	.set	nomips16
	.set	nomicromips
	.ent	ObjectBehaviorStrafe
	.type	ObjectBehaviorStrafe, @function
ObjectBehaviorStrafe:
	.frame	$sp,24,$31		# vars= 0, regs= 2/0, args= 16, gp= 0
	.mask	0x80010000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	addiu	$sp,$sp,-24
	sw	$31,20($sp)
	sw	$16,16($sp)
	move	$16,$4
	lui	$4,%hi(OverKartRAMHeader)
	addiu	$4,$4,%lo(OverKartRAMHeader)
	lh	$3,2($16)
	sll	$2,$3,1
	addu	$2,$2,$3
	sll	$2,$2,2
	subu	$2,$2,$3
	sll	$2,$2,2
	lw	$3,12($4)
	addu	$2,$3,$2
	lh	$5,0($16)
	sll	$3,$5,3
	subu	$3,$3,$5
	sll	$3,$3,2
	lw	$4,20($4)
	addu	$3,$4,$3
	lh	$4,2($2)
	mtc1	$4,$f0
	nop
	cvt.s.w	$f6,$f0
	lui	$4,%hi(GlobalFloatA)
	swc1	$f6,%lo(GlobalFloatA)($4)
	cvt.d.s	$f0,$f6
	lui	$4,%hi($LC1)
	ldc1	$f2,%lo($LC1)($4)
	mul.d	$f0,$f0,$f2
	cvt.s.d	$f4,$f0
	lui	$4,%hi(GlobalFloatB)
	swc1	$f4,%lo(GlobalFloatB)($4)
	lh	$4,4($3)
	mtc1	$4,$f0
	nop
	cvt.s.w	$f2,$f0
	lwc1	$f0,60($16)
	sub.s	$f0,$f0,$f2
	trunc.w.s $f0,$f0
	mfc1	$6,$f0
	lui	$4,%hi(GlobalIntA)
	swc1	$f0,%lo(GlobalIntA)($4)
	lh	$3,8($3)
	mtc1	$3,$f0
	nop
	cvt.s.w	$f2,$f0
	lwc1	$f0,68($16)
	sub.s	$f0,$f0,$f2
	trunc.w.s $f0,$f0
	lui	$3,%hi(GlobalIntB)
	swc1	$f0,%lo(GlobalIntB)($3)
	lbu	$3,25($16)
	sltu	$3,$3,6
	beql	$3,$0,$L50
	lhu	$5,54($16)

	mfc1	$5,$f0
	lbu	$3,25($16)
	sll	$4,$3,2
	lui	$3,%hi($L35)
	addiu	$3,$3,%lo($L35)
	addu	$3,$3,$4
	lw	$3,0($3)
	jr	$3
	nop

	.rdata
	.align	2
	.align	2
$L35:
	.word	$L40
	.word	$L39
	.word	$L38
	.word	$L37
	.word	$L36
	.word	$L34
	.text
$L40:
	lh	$3,6($2)
	li	$2,1374355456			# 0x51eb0000
	ori	$2,$2,0x851f
	mult	$3,$2
	mfhi	$2
	sra	$2,$2,5
	sra	$3,$3,31
	subu	$2,$2,$3
	sll	$2,$2,16
	sra	$2,$2,16
	mtc1	$2,$f0
	nop
	cvt.s.w	$f0,$f0
	swc1	$f0,72($16)
	sw	$0,76($16)
	mult	$6,$6
	mflo	$2
	mtc1	$2,$f0
	nop
	cvt.s.w	$f2,$f0
	mult	$5,$5
	mflo	$2
	mtc1	$2,$f0
	nop
	cvt.s.w	$f0,$f0
	add.s	$f2,$f2,$f0
	mul.s	$f6,$f6,$f6
	c.lt.s	$f6,$f2
	nop
	bc1f	$L33
	sw	$0,80($16)

	li	$2,1			# 0x1
	b	$L33
	sb	$2,25($16)

$L39:
	lh	$2,6($2)
	li	$3,1374355456			# 0x51eb0000
	ori	$3,$3,0x851f
	mult	$2,$3
	mfhi	$3
	sra	$3,$3,5
	sra	$2,$2,31
	subu	$2,$2,$3
	sll	$2,$2,16
	sra	$2,$2,16
	mtc1	$2,$f0
	nop
	cvt.s.w	$f0,$f0
	swc1	$f0,20($16)
	li	$2,2			# 0x2
	sb	$2,25($16)
$L33:
	lhu	$5,54($16)
$L50:
	subu	$5,$0,$5
	sll	$5,$5,16
	sra	$5,$5,16
	jal	MakeAlignVector
	addiu	$4,$16,72

	jal	ObjectBehaviorExist
	move	$4,$16

	lw	$31,20($sp)
	lw	$16,16($sp)
	jr	$31
	addiu	$sp,$sp,24

$L38:
	lh	$2,6($2)
	mtc1	$2,$f0
	nop
	cvt.s.w	$f0,$f0
	lui	$2,%hi($LC2)
	lwc1	$f2,%lo($LC2)($2)
	div.s	$f0,$f0,$f2
	lwc1	$f2,20($16)
	add.s	$f0,$f0,$f2
	swc1	$f0,20($16)
	swc1	$f0,72($16)
	sw	$0,76($16)
	mult	$6,$6
	mflo	$2
	nop
	nop
	mult	$5,$5
	mflo	$3
	addu	$2,$2,$3
	mtc1	$2,$f0
	nop
	cvt.s.w	$f2,$f0
	mul.s	$f4,$f4,$f4
	c.lt.s	$f2,$f4
	nop
	bc1f	$L33
	sw	$0,80($16)

	li	$2,3			# 0x3
	b	$L33
	sb	$2,25($16)

$L37:
	lh	$2,6($2)
	li	$3,1374355456			# 0x51eb0000
	ori	$3,$3,0x851f
	mult	$2,$3
	mfhi	$3
	sra	$3,$3,5
	sra	$2,$2,31
	subu	$2,$2,$3
	sll	$2,$2,16
	sra	$2,$2,16
	mtc1	$2,$f0
	nop
	cvt.s.w	$f0,$f0
	swc1	$f0,72($16)
	sw	$0,76($16)
	mult	$6,$6
	mflo	$2
	nop
	nop
	mult	$5,$5
	mflo	$3
	addu	$2,$2,$3
	mtc1	$2,$f0
	nop
	cvt.s.w	$f2,$f0
	mul.s	$f6,$f6,$f6
	c.lt.s	$f6,$f2
	nop
	bc1f	$L33
	sw	$0,80($16)

	li	$2,4			# 0x4
	b	$L33
	sb	$2,25($16)

$L36:
	lh	$3,6($2)
	li	$2,1374355456			# 0x51eb0000
	ori	$2,$2,0x851f
	mult	$3,$2
	mfhi	$2
	sra	$2,$2,5
	sra	$3,$3,31
	subu	$2,$2,$3
	sll	$2,$2,16
	sra	$2,$2,16
	mtc1	$2,$f0
	nop
	cvt.s.w	$f0,$f0
	swc1	$f0,20($16)
	li	$2,5			# 0x5
	b	$L33
	sb	$2,25($16)

$L34:
	lh	$2,6($2)
	mtc1	$2,$f0
	nop
	cvt.s.w	$f0,$f0
	lui	$2,%hi($LC2)
	lwc1	$f2,%lo($LC2)($2)
	div.s	$f0,$f0,$f2
	lwc1	$f2,20($16)
	sub.s	$f0,$f2,$f0
	swc1	$f0,20($16)
	swc1	$f0,72($16)
	sw	$0,76($16)
	mult	$6,$6
	mflo	$2
	nop
	nop
	mult	$5,$5
	mflo	$3
	addu	$2,$2,$3
	mtc1	$2,$f0
	nop
	cvt.s.w	$f2,$f0
	mul.s	$f4,$f4,$f4
	c.lt.s	$f2,$f4
	nop
	bc1f	$L33
	sw	$0,80($16)

	b	$L33
	sb	$0,25($16)

	.set	macro
	.set	reorder
	.end	ObjectBehaviorStrafe
	.size	ObjectBehaviorStrafe, .-ObjectBehaviorStrafe
	.align	2
	.globl	ObjectBehaviorWander
	.set	nomips16
	.set	nomicromips
	.ent	ObjectBehaviorWander
	.type	ObjectBehaviorWander, @function
ObjectBehaviorWander:
	.frame	$sp,24,$31		# vars= 0, regs= 2/0, args= 16, gp= 0
	.mask	0x80010000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	addiu	$sp,$sp,-24
	sw	$31,20($sp)
	sw	$16,16($sp)
	move	$16,$4
	lui	$3,%hi(OverKartRAMHeader)
	addiu	$3,$3,%lo(OverKartRAMHeader)
	lh	$4,0($4)
	sll	$2,$4,3
	subu	$2,$2,$4
	sll	$2,$2,2
	lw	$4,20($3)
	addu	$4,$4,$2
	lh	$5,2($16)
	lw	$3,12($3)
	sll	$2,$5,1
	addu	$2,$2,$5
	sll	$2,$2,2
	subu	$2,$2,$5
	sll	$2,$2,2
	addu	$2,$3,$2
	lh	$2,2($2)
	mtc1	$2,$f0
	nop
	cvt.s.w	$f4,$f0
	lui	$2,%hi(GlobalFloatA)
	swc1	$f4,%lo(GlobalFloatA)($2)
	cvt.d.s	$f0,$f4
	lui	$2,%hi($LC3)
	ldc1	$f2,%lo($LC3)($2)
	mul.d	$f0,$f0,$f2
	cvt.s.d	$f0,$f0
	lui	$2,%hi(GlobalFloatB)
	swc1	$f0,%lo(GlobalFloatB)($2)
	lh	$2,4($4)
	mtc1	$2,$f2
	nop
	cvt.s.w	$f8,$f2
	lwc1	$f2,60($16)
	sub.s	$f2,$f2,$f8
	trunc.w.s $f2,$f2
	mfc1	$3,$f2
	lui	$2,%hi(GlobalIntA)
	swc1	$f2,%lo(GlobalIntA)($2)
	lh	$2,8($4)
	mtc1	$2,$f2
	nop
	cvt.s.w	$f6,$f2
	lwc1	$f2,68($16)
	sub.s	$f2,$f2,$f6
	trunc.w.s $f2,$f2
	mfc1	$2,$f2
	lui	$5,%hi(GlobalIntB)
	swc1	$f2,%lo(GlobalIntB)($5)
	mult	$3,$3
	mflo	$3
	nop
	nop
	mult	$2,$2
	mflo	$2
	addu	$2,$3,$2
	mtc1	$2,$f2
	nop
	cvt.s.w	$f2,$f2
	mul.s	$f0,$f0,$f0
	c.lt.s	$f2,$f0
	nop
	bc1fl	$L63
	lbu	$2,25($16)

	sb	$0,25($16)
$L54:
	mul.s	$f4,$f4,$f4
	c.lt.s	$f4,$f2
	nop
	bc1fl	$L64
	lh	$2,28($16)

	li	$2,1			# 0x1
	sb	$2,25($16)
$L55:
	lui	$2,%hi($LC4)
$L66:
	lw	$5,%lo($LC4)($2)
	jal	ObjectBehaviorWalk
	move	$4,$16

	lw	$31,20($sp)
	lw	$16,16($sp)
	jr	$31
	addiu	$sp,$sp,24

$L63:
	beq	$2,$0,$L54
	lui	$6,%hi(objectPosition)

	swc1	$f8,%lo(objectPosition)($6)
	addiu	$6,$6,%lo(objectPosition)
	lh	$2,6($4)
	mtc1	$2,$f0
	nop
	cvt.s.w	$f0,$f0
	swc1	$f0,4($6)
	swc1	$f6,8($6)
	li	$7,3			# 0x3
	lh	$5,54($16)
	jal	ObjectSubBehaviorTurnTarget
	addiu	$4,$16,60

	sll	$3,$2,1
	addu	$3,$3,$2
	sll	$3,$3,3
	subu	$3,$3,$2
	sll	$3,$3,2
	subu	$2,$3,$2
	sll	$2,$2,2
	lhu	$3,54($16)
	addu	$2,$2,$3
	b	$L55
	sh	$2,54($16)

$L64:
	blez	$2,$L58
	addiu	$2,$2,-1

	sh	$2,28($16)
	lbu	$2,24($16)
	li	$3,1			# 0x1
	beq	$2,$3,$L59
	li	$3,2			# 0x2

	bne	$2,$3,$L66
	lui	$2,%hi($LC4)

	lhu	$2,54($16)
	addiu	$2,$2,-364
	b	$L55
	sh	$2,54($16)

$L59:
	lhu	$2,54($16)
	addiu	$2,$2,364
	b	$L55
	sh	$2,54($16)

$L58:
	jal	MakeRandomLimmit
	li	$4,4			# 0x4

	sb	$2,24($16)
	jal	MakeRandomLimmit
	li	$4,60			# 0x3c

	addiu	$2,$2,15
	b	$L55
	sh	$2,28($16)

	.set	macro
	.set	reorder
	.end	ObjectBehaviorWander
	.size	ObjectBehaviorWander, .-ObjectBehaviorWander
	.align	2
	.globl	ObjectBehaviorFlee
	.set	nomips16
	.set	nomicromips
	.ent	ObjectBehaviorFlee
	.type	ObjectBehaviorFlee, @function
ObjectBehaviorFlee:
	.frame	$sp,64,$31		# vars= 0, regs= 6/6, args= 16, gp= 0
	.mask	0x801f0000,-28
	.fmask	0x03f00000,-8
	.set	noreorder
	.set	nomacro
	addiu	$sp,$sp,-64
	sw	$31,36($sp)
	sw	$20,32($sp)
	sw	$19,28($sp)
	sw	$18,24($sp)
	sw	$17,20($sp)
	sw	$16,16($sp)
	sdc1	$f24,56($sp)
	sdc1	$f22,48($sp)
	sdc1	$f20,40($sp)
	lh	$2,6($4)
	li	$3,2			# 0x2
	beq	$2,$3,$L68
	move	$16,$4

	li	$3,3			# 0x3
	beql	$2,$3,$L69
	lh	$2,30($4)

	beq	$2,$0,$L95
	lui	$2,%hi($LC5)

	lw	$31,36($sp)
$L98:
	lw	$20,32($sp)
	lw	$19,28($sp)
	lw	$18,24($sp)
	lw	$17,20($sp)
	lw	$16,16($sp)
	ldc1	$f24,56($sp)
	ldc1	$f22,48($sp)
	ldc1	$f20,40($sp)
	jr	$31
	addiu	$sp,$sp,64

$L95:
	lwc1	$f0,%lo($LC5)($2)
	swc1	$f0,20($4)
	lui	$2,%hi(g_gameMode)
	lw	$2,%lo(g_gameMode)($2)
	beq	$2,$0,$L71
	lui	$2,%hi(GlobalIntA)

	lui	$2,%hi(g_playerCount)
	lw	$2,%lo(g_playerCount)($2)
	lui	$3,%hi(GlobalIntA)
	bgtz	$2,$L86
	sw	$2,%lo(GlobalIntA)($3)

	b	$L72
	nop

$L73:
	addiu	$17,$17,1
$L99:
	lw	$2,%lo(GlobalIntA)($19)
	slt	$2,$17,$2
	beql	$2,$0,$L96
	lh	$2,6($16)

$L76:
	li	$6,90			# 0x5a
	move	$5,$17
	jal	ObjectSubBehaviorLookedAt
	move	$4,$16

	c.lt.s	$f0,$f22
	nop
	bc1f	$L73
	swc1	$f0,%lo(GlobalFloatD)($18)

	lwc1	$f2,20($16)
	c.lt.s	$f0,$f2
	nop
	bc1fl	$L99
	addiu	$17,$17,1

	sh	$20,6($16)
	swc1	$f0,20($16)
	cvt.d.s	$f0,$f0
	sub.d	$f0,$f20,$f0
	cvt.s.d	$f0,$f0
	swc1	$f0,%lo(GlobalFloatD)($18)
	sh	$17,34($16)
	mul.s	$f2,$f0,$f24
	trunc.w.s $f2,$f2
	mfc1	$2,$f2
	nop
	sh	$2,30($16)
	sw	$0,72($16)
	add.s	$f0,$f0,$f0
	lwc1	$f2,76($16)
	add.s	$f0,$f2,$f0
	swc1	$f0,76($16)
	b	$L73
	sw	$0,80($16)

$L96:
	bnel	$2,$0,$L98
	lw	$31,36($sp)

$L72:
	jal	ObjectBehaviorWander
	move	$4,$16

	b	$L98
	lw	$31,36($sp)

$L69:
	blez	$2,$L97
	addiu	$2,$2,-1

	sh	$2,30($4)
$L78:
	jal	ObjectBehaviorExist
	move	$4,$16

	b	$L98
	lw	$31,36($sp)

$L97:
	li	$2,2			# 0x2
	b	$L78
	sh	$2,6($4)

$L68:
	lh	$5,34($4)
	sll	$2,$5,3
	subu	$2,$2,$5
	sll	$2,$2,4
	subu	$2,$2,$5
	sll	$2,$2,2
	subu	$2,$2,$5
	sll	$2,$2,3
	addiu	$2,$2,20
	lui	$5,%hi(GlobalPlayer)
	addiu	$5,$5,%lo(GlobalPlayer)
	jal	ObjectSubBehaviorLookTarget
	addu	$5,$5,$2

	lui	$2,%hi(GlobalFloatD)
	swc1	$f0,%lo(GlobalFloatD)($2)
	lui	$2,%hi($LC9)
	lwc1	$f2,%lo($LC9)($2)
	c.lt.s	$f0,$f2
	nop
	bc1fl	$L92
	sh	$0,6($16)

	lh	$3,34($16)
	sll	$2,$3,3
	subu	$2,$2,$3
	sll	$2,$2,4
	subu	$2,$2,$3
	sll	$2,$2,2
	subu	$2,$2,$3
	sll	$2,$2,3
	addiu	$2,$2,20
	li	$7,4			# 0x4
	lui	$6,%hi(GlobalPlayer)
	addiu	$6,$6,%lo(GlobalPlayer)
	addu	$6,$6,$2
	lh	$5,54($16)
	jal	ObjectSubBehaviorTurnTarget
	addiu	$4,$16,60

	lui	$3,%hi(GlobalShortC)
	sh	$2,%lo(GlobalShortC)($3)
	sll	$3,$2,1
	addu	$3,$2,$3
	sll	$3,$3,3
	subu	$3,$3,$2
	sll	$3,$3,2
	subu	$2,$2,$3
	sll	$2,$2,3
	lhu	$3,54($16)
	addu	$2,$2,$3
	sh	$2,54($16)
	lwc1	$f12,72($16)
	lwc1	$f0,80($16)
	mul.s	$f12,$f12,$f12
	mul.s	$f0,$f0,$f0
	add.s	$f12,$f12,$f0
	lui	$2,%hi(GlobalFloatA)
	swc1	$f12,%lo(GlobalFloatA)($2)
	lui	$2,%hi($LC10)
	lwc1	$f0,%lo($LC10)($2)
	c.lt.s	$f12,$f0
	nop
	bc1f	$L93
	lui	$3,%hi($LC9)

	mtc1	$0,$f0
	nop
	c.eq.s	$f12,$f0
	nop
	bc1f	$L83
	lui	$3,%hi($LC11)

	lui	$2,%hi(GlobalFloatA)
	lwc1	$f0,%lo($LC11)($3)
	b	$L84
	swc1	$f0,%lo(GlobalFloatA)($2)

$L83:
	jal	Sqrtf
	nop

	lui	$2,%hi($LC11)
	lwc1	$f2,%lo($LC11)($2)
	add.s	$f0,$f0,$f2
	lui	$2,%hi(GlobalFloatA)
	b	$L84
	swc1	$f0,%lo(GlobalFloatA)($2)

$L93:
	lui	$2,%hi(GlobalFloatA)
	lwc1	$f0,%lo($LC9)($3)
	swc1	$f0,%lo(GlobalFloatA)($2)
$L84:
	lui	$2,%hi(GlobalShortC)
	lh	$2,%lo(GlobalShortC)($2)
	beq	$2,$0,$L85
	lui	$2,%hi(GlobalFloatA)

	lwc1	$f0,%lo(GlobalFloatA)($2)
	lui	$2,%hi($LC12)
	lwc1	$f2,%lo($LC12)($2)
	div.s	$f0,$f0,$f2
	mfc1	$5,$f0
	lui	$2,%hi(GlobalFloatB)
	swc1	$f0,%lo(GlobalFloatB)($2)
	jal	ObjectBehaviorWalk
	move	$4,$16

	b	$L98
	lw	$31,36($sp)

$L85:
	lw	$5,%lo(GlobalFloatA)($2)
	jal	ObjectBehaviorWalk
	move	$4,$16

	b	$L98
	lw	$31,36($sp)

$L92:
	sh	$0,30($16)
	jal	ObjectBehaviorExist
	move	$4,$16

	b	$L98
	lw	$31,36($sp)

$L71:
	li	$3,8			# 0x8
	sw	$3,%lo(GlobalIntA)($2)
$L86:
	move	$17,$0
	lui	$18,%hi(GlobalFloatD)
	lui	$2,%hi($LC6)
	lwc1	$f22,%lo($LC6)($2)
	li	$20,3			# 0x3
	lui	$2,%hi($LC7)
	ldc1	$f20,%lo($LC7)($2)
	lui	$2,%hi($LC8)
	lwc1	$f24,%lo($LC8)($2)
	b	$L76
	lui	$19,%hi(GlobalIntA)

	.set	macro
	.set	reorder
	.end	ObjectBehaviorFlee
	.size	ObjectBehaviorFlee, .-ObjectBehaviorFlee
	.align	2
	.globl	ObjectBehaviorSearch
	.set	nomips16
	.set	nomicromips
	.ent	ObjectBehaviorSearch
	.type	ObjectBehaviorSearch, @function
ObjectBehaviorSearch:
	.frame	$sp,72,$31		# vars= 0, regs= 7/6, args= 16, gp= 0
	.mask	0x803f0000,-28
	.fmask	0x03f00000,-8
	.set	noreorder
	.set	nomacro
	addiu	$sp,$sp,-72
	sw	$31,44($sp)
	sw	$21,40($sp)
	sw	$20,36($sp)
	sw	$19,32($sp)
	sw	$18,28($sp)
	sw	$17,24($sp)
	sw	$16,20($sp)
	sdc1	$f24,64($sp)
	sdc1	$f22,56($sp)
	sdc1	$f20,48($sp)
	lh	$2,6($4)
	li	$3,2			# 0x2
	beq	$2,$3,$L101
	move	$16,$4

	li	$3,3			# 0x3
	beql	$2,$3,$L102
	lh	$2,30($4)

	beq	$2,$0,$L128
	lui	$2,%hi($LC5)

	lw	$31,44($sp)
$L131:
	lw	$21,40($sp)
	lw	$20,36($sp)
	lw	$19,32($sp)
	lw	$18,28($sp)
	lw	$17,24($sp)
	lw	$16,20($sp)
	ldc1	$f24,64($sp)
	ldc1	$f22,56($sp)
	ldc1	$f20,48($sp)
	jr	$31
	addiu	$sp,$sp,72

$L128:
	lwc1	$f0,%lo($LC5)($2)
	swc1	$f0,20($4)
	lui	$2,%hi(g_gameMode)
	lw	$2,%lo(g_gameMode)($2)
	beq	$2,$0,$L104
	lui	$2,%hi(GlobalIntA)

	lui	$2,%hi(g_playerCount)
	lw	$2,%lo(g_playerCount)($2)
	lui	$3,%hi(GlobalIntA)
	bgtz	$2,$L119
	sw	$2,%lo(GlobalIntA)($3)

	b	$L105
	nop

$L106:
	addiu	$18,$18,1
$L132:
	lw	$2,%lo(GlobalIntA)($20)
	slt	$2,$18,$2
	beq	$2,$0,$L129
	addiu	$17,$17,3544

$L109:
	move	$5,$17
	jal	ObjectSubBehaviorLookTarget
	move	$4,$16

	c.lt.s	$f0,$f22
	nop
	bc1f	$L106
	swc1	$f0,%lo(GlobalFloatD)($19)

	lwc1	$f2,20($16)
	c.lt.s	$f0,$f2
	nop
	bc1fl	$L132
	addiu	$18,$18,1

	sh	$21,6($16)
	swc1	$f0,20($16)
	cvt.d.s	$f0,$f0
	sub.d	$f0,$f20,$f0
	cvt.s.d	$f0,$f0
	swc1	$f0,%lo(GlobalFloatD)($19)
	sh	$18,34($16)
	mul.s	$f2,$f0,$f24
	trunc.w.s $f2,$f2
	mfc1	$2,$f2
	nop
	sh	$2,30($16)
	sw	$0,72($16)
	add.s	$f0,$f0,$f0
	lwc1	$f2,76($16)
	add.s	$f0,$f2,$f0
	swc1	$f0,76($16)
	b	$L106
	sw	$0,80($16)

$L129:
	lh	$2,6($16)
	bnel	$2,$0,$L131
	lw	$31,44($sp)

$L105:
	jal	ObjectBehaviorWander
	move	$4,$16

	b	$L131
	lw	$31,44($sp)

$L102:
	blez	$2,$L130
	addiu	$2,$2,-1

	sh	$2,30($4)
$L111:
	jal	ObjectBehaviorExist
	move	$4,$16

	b	$L131
	lw	$31,44($sp)

$L130:
	li	$2,2			# 0x2
	b	$L111
	sh	$2,6($4)

$L101:
	lh	$5,34($4)
	sll	$2,$5,3
	subu	$2,$2,$5
	sll	$2,$2,4
	subu	$2,$2,$5
	sll	$2,$2,2
	subu	$2,$2,$5
	sll	$2,$2,3
	addiu	$2,$2,20
	lui	$5,%hi(GlobalPlayer)
	addiu	$5,$5,%lo(GlobalPlayer)
	jal	ObjectSubBehaviorLookTarget
	addu	$5,$5,$2

	lui	$2,%hi(GlobalFloatD)
	swc1	$f0,%lo(GlobalFloatD)($2)
	lui	$2,%hi($LC9)
	lwc1	$f2,%lo($LC9)($2)
	c.lt.s	$f0,$f2
	nop
	bc1fl	$L125
	sh	$0,6($16)

	lh	$3,34($16)
	sll	$2,$3,3
	subu	$2,$2,$3
	sll	$2,$2,4
	subu	$2,$2,$3
	sll	$2,$2,2
	subu	$2,$2,$3
	sll	$2,$2,3
	addiu	$2,$2,20
	li	$7,4			# 0x4
	lui	$6,%hi(GlobalPlayer)
	addiu	$6,$6,%lo(GlobalPlayer)
	addu	$6,$6,$2
	lh	$5,54($16)
	jal	ObjectSubBehaviorTurnTarget
	addiu	$4,$16,60

	lui	$3,%hi(GlobalShortC)
	sh	$2,%lo(GlobalShortC)($3)
	sll	$3,$2,1
	addu	$3,$2,$3
	sll	$3,$3,3
	subu	$3,$3,$2
	sll	$3,$3,2
	subu	$2,$3,$2
	sll	$2,$2,3
	lhu	$3,54($16)
	addu	$2,$2,$3
	sh	$2,54($16)
	lwc1	$f12,72($16)
	lwc1	$f0,80($16)
	mul.s	$f12,$f12,$f12
	mul.s	$f0,$f0,$f0
	add.s	$f12,$f12,$f0
	lui	$2,%hi(GlobalFloatA)
	swc1	$f12,%lo(GlobalFloatA)($2)
	lui	$2,%hi($LC10)
	lwc1	$f0,%lo($LC10)($2)
	c.lt.s	$f12,$f0
	nop
	bc1f	$L126
	lui	$3,%hi($LC9)

	mtc1	$0,$f0
	nop
	c.eq.s	$f12,$f0
	nop
	bc1f	$L116
	lui	$3,%hi($LC11)

	lui	$2,%hi(GlobalFloatA)
	lwc1	$f0,%lo($LC11)($3)
	b	$L117
	swc1	$f0,%lo(GlobalFloatA)($2)

$L116:
	jal	Sqrtf
	nop

	lui	$2,%hi($LC11)
	lwc1	$f2,%lo($LC11)($2)
	add.s	$f0,$f0,$f2
	lui	$2,%hi(GlobalFloatA)
	b	$L117
	swc1	$f0,%lo(GlobalFloatA)($2)

$L126:
	lui	$2,%hi(GlobalFloatA)
	lwc1	$f0,%lo($LC9)($3)
	swc1	$f0,%lo(GlobalFloatA)($2)
$L117:
	lui	$2,%hi(GlobalShortC)
	lh	$2,%lo(GlobalShortC)($2)
	beq	$2,$0,$L118
	lui	$2,%hi(GlobalFloatA)

	lwc1	$f0,%lo(GlobalFloatA)($2)
	lui	$2,%hi($LC12)
	lwc1	$f2,%lo($LC12)($2)
	div.s	$f0,$f0,$f2
	mfc1	$5,$f0
	lui	$2,%hi(GlobalFloatB)
	swc1	$f0,%lo(GlobalFloatB)($2)
	jal	ObjectBehaviorWalk
	move	$4,$16

	b	$L131
	lw	$31,44($sp)

$L118:
	lw	$5,%lo(GlobalFloatA)($2)
	jal	ObjectBehaviorWalk
	move	$4,$16

	b	$L131
	lw	$31,44($sp)

$L125:
	sh	$0,30($16)
	jal	ObjectBehaviorExist
	move	$4,$16

	b	$L131
	lw	$31,44($sp)

$L104:
	li	$3,8			# 0x8
	sw	$3,%lo(GlobalIntA)($2)
$L119:
	lui	$17,%hi(GlobalPlayer+20)
	addiu	$17,$17,%lo(GlobalPlayer+20)
	move	$18,$0
	lui	$19,%hi(GlobalFloatD)
	lui	$2,%hi($LC6)
	lwc1	$f22,%lo($LC6)($2)
	li	$21,3			# 0x3
	lui	$2,%hi($LC7)
	ldc1	$f20,%lo($LC7)($2)
	lui	$2,%hi($LC8)
	lwc1	$f24,%lo($LC8)($2)
	b	$L109
	lui	$20,%hi(GlobalIntA)

	.set	macro
	.set	reorder
	.end	ObjectBehaviorSearch
	.size	ObjectBehaviorSearch, .-ObjectBehaviorSearch
	.align	2
	.globl	ObjectSearchClosestMarker
	.set	nomips16
	.set	nomicromips
	.ent	ObjectSearchClosestMarker
	.type	ObjectSearchClosestMarker, @function
ObjectSearchClosestMarker:
	.frame	$sp,0,$31		# vars= 0, regs= 0/0, args= 0, gp= 0
	.mask	0x00000000,0
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	lui	$2,%hi(GlobalShortB)
	sh	$0,%lo(GlobalShortB)($2)
	lui	$3,%hi($LC0)
	lui	$2,%hi(GlobalFloatB)
	lwc1	$f0,%lo($LC0)($3)
	swc1	$f0,%lo(GlobalFloatB)($2)
	lh	$2,0($5)
	li	$3,-32768			# 0xffffffffffff8000
	beq	$2,$3,$L137
	addiu	$5,$5,8

	lwc1	$f6,4($4)
	move	$3,$0
	lui	$8,%hi(GlobalFloatA)
	lui	$6,%hi(GlobalFloatB)
	lui	$9,%hi(GlobalShortB)
	b	$L138
	li	$7,-32768			# 0xffffffffffff8000

$L135:
	addiu	$5,$5,8
$L141:
	lh	$2,-8($5)
	beq	$2,$7,$L137
	addiu	$3,$3,1

$L138:
	mtc1	$2,$f0
	nop
	cvt.s.w	$f2,$f0
	lwc1	$f4,0($4)
	sub.s	$f2,$f4,$f2
	lh	$2,-6($5)
	mtc1	$2,$f0
	nop
	cvt.s.w	$f0,$f0
	sub.s	$f0,$f6,$f0
	mul.s	$f2,$f2,$f2
	mul.s	$f0,$f0,$f0
	add.s	$f0,$f2,$f0
	swc1	$f0,%lo(GlobalFloatA)($8)
	lwc1	$f2,%lo(GlobalFloatB)($6)
	c.lt.s	$f0,$f2
	nop
	bc1fl	$L141
	addiu	$5,$5,8

	sh	$3,%lo(GlobalShortB)($9)
	b	$L135
	swc1	$f0,%lo(GlobalFloatB)($6)

$L137:
	lui	$2,%hi(GlobalShortB)
	jr	$31
	lh	$2,%lo(GlobalShortB)($2)

	.set	macro
	.set	reorder
	.end	ObjectSearchClosestMarker
	.size	ObjectSearchClosestMarker, .-ObjectSearchClosestMarker
	.align	2
	.globl	ObjectBehaviorFollowPath
	.set	nomips16
	.set	nomicromips
	.ent	ObjectBehaviorFollowPath
	.type	ObjectBehaviorFollowPath, @function
ObjectBehaviorFollowPath:
	.frame	$sp,40,$31		# vars= 0, regs= 5/0, args= 16, gp= 0
	.mask	0x800f0000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	addiu	$sp,$sp,-40
	sw	$31,36($sp)
	sw	$19,32($sp)
	sw	$18,28($sp)
	sw	$17,24($sp)
	sw	$16,20($sp)
	move	$16,$4
	lh	$3,2($4)
	sll	$2,$3,1
	addu	$2,$2,$3
	sll	$2,$2,2
	subu	$2,$2,$3
	sll	$2,$2,2
	lui	$3,%hi(OverKartRAMHeader+12)
	lw	$17,%lo(OverKartRAMHeader+12)($3)
	addu	$17,$17,$2
	lh	$2,2($17)
	sll	$3,$2,2
	lui	$2,%hi(pathOffset)
	addiu	$2,$2,%lo(pathOffset)
	addu	$2,$2,$3
	jal	GetRealAddress
	lw	$4,0($2)

	move	$18,$2
	lh	$3,32($16)
	li	$2,-1			# 0xffffffffffffffff
	beql	$3,$2,$L146
	addiu	$17,$16,60

	bgtzl	$3,$L147
	sll	$3,$3,3

$L142:
	lw	$31,36($sp)
$L148:
	lw	$19,32($sp)
	lw	$18,28($sp)
	lw	$17,24($sp)
	lw	$16,20($sp)
	jr	$31
	addiu	$sp,$sp,40

$L146:
	move	$5,$18
	jal	ObjectSearchClosestMarker
	move	$4,$17

	sh	$2,32($16)
	sll	$2,$2,3
	addu	$18,$18,$2
	lui	$5,%hi(objectPosition)
	lh	$2,0($18)
	mtc1	$2,$f0
	nop
	cvt.s.w	$f0,$f0
	swc1	$f0,%lo(objectPosition)($5)
	addiu	$5,$5,%lo(objectPosition)
	lh	$2,2($18)
	mtc1	$2,$f0
	nop
	cvt.s.w	$f0,$f0
	swc1	$f0,4($5)
	lh	$2,4($18)
	mtc1	$2,$f0
	nop
	cvt.s.w	$f0,$f0
	swc1	$f0,8($5)
	jal	CalcDirection
	move	$4,$17

	subu	$2,$0,$2
	b	$L142
	sh	$2,54($16)

$L147:
	addu	$3,$18,$3
	lh	$6,0($3)
	mtc1	$6,$f0
	nop
	cvt.s.w	$f0,$f0
	mfc1	$6,$f0
	lui	$19,%hi(objectPosition)
	swc1	$f0,%lo(objectPosition)($19)
	addiu	$19,$19,%lo(objectPosition)
	lh	$2,2($3)
	mtc1	$2,$f0
	nop
	cvt.s.w	$f0,$f0
	swc1	$f0,4($19)
	lh	$7,4($3)
	mtc1	$7,$f0
	nop
	cvt.s.w	$f0,$f0
	mfc1	$7,$f0
	swc1	$f0,8($19)
	lwc1	$f14,68($16)
	jal	MakeDirection
	lwc1	$f12,60($16)

	subu	$5,$0,$2
	li	$6,910			# 0x38e
	sll	$5,$5,16
	sra	$5,$5,16
	jal	ChaseDir
	addiu	$4,$16,54

	lh	$5,6($17)
	mtc1	$5,$f0
	nop
	cvt.s.w	$f0,$f0
	lui	$2,%hi($LC13)
	lwc1	$f2,%lo($LC13)($2)
	div.s	$f0,$f0,$f2
	mfc1	$5,$f0
	jal	ObjectBehaviorWalk
	move	$4,$16

	lui	$2,%hi($LC14)
	lw	$5,%lo($LC14)($2)
	move	$7,$5
	move	$6,$19
	jal	TestCollideSphere
	addiu	$4,$16,60

	beq	$2,$0,$L148
	lw	$31,36($sp)

	lhu	$2,32($16)
	addiu	$2,$2,1
	sll	$2,$2,16
	sra	$2,$2,16
	sh	$2,32($16)
	sll	$2,$2,3
	addu	$18,$18,$2
	lh	$3,0($18)
	li	$2,-32768			# 0xffffffffffff8000
	bne	$3,$2,$L148
	lw	$31,36($sp)

	li	$2,1			# 0x1
	b	$L142
	sh	$2,32($16)

	.set	macro
	.set	reorder
	.end	ObjectBehaviorFollowPath
	.size	ObjectBehaviorFollowPath, .-ObjectBehaviorFollowPath
	.align	2
	.globl	ObjectBehaviorBounce
	.set	nomips16
	.set	nomicromips
	.ent	ObjectBehaviorBounce
	.type	ObjectBehaviorBounce, @function
ObjectBehaviorBounce:
	.frame	$sp,24,$31		# vars= 0, regs= 1/0, args= 16, gp= 0
	.mask	0x80000000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	addiu	$sp,$sp,-24
	sw	$31,20($sp)
	jal	MoveIWA
	addiu	$4,$4,36

	lw	$31,20($sp)
	jr	$31
	addiu	$sp,$sp,24

	.set	macro
	.set	reorder
	.end	ObjectBehaviorBounce
	.size	ObjectBehaviorBounce, .-ObjectBehaviorBounce
	.align	2
	.globl	Misbehave
	.set	nomips16
	.set	nomicromips
	.ent	Misbehave
	.type	Misbehave, @function
Misbehave:
	.frame	$sp,48,$31		# vars= 24, regs= 2/0, args= 16, gp= 0
	.mask	0x80010000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	addiu	$sp,$sp,-48
	sw	$31,44($sp)
	sw	$16,40($sp)
	move	$16,$4
	lh	$4,2($4)
	lui	$2,%hi(OverKartRAMHeader+12)
	lw	$3,%lo(OverKartRAMHeader+12)($2)
	sll	$2,$4,1
	addu	$2,$2,$4
	sll	$2,$2,2
	subu	$2,$2,$4
	sll	$2,$2,2
	addu	$2,$3,$2
	lhu	$3,0($2)
	sltu	$3,$3,8
	beql	$3,$0,$L165
	lwc1	$f2,64($16)

	lhu	$2,0($2)
	sll	$3,$2,2
	lui	$2,%hi($L154)
	addiu	$2,$2,%lo($L154)
	addu	$2,$2,$3
	lw	$2,0($2)
	jr	$2
	nop

	.rdata
	.align	2
	.align	2
$L154:
	.word	$L160
	.word	$L159
	.word	$L158
	.word	$L157
	.word	$L156
	.word	$L155
	.word	$L152
	.word	$L153
	.text
$L160:
	lh	$2,8($16)
	mtc1	$2,$f0
	nop
	cvt.s.w	$f0,$f0
	swc1	$f0,16($sp)
	lh	$2,10($16)
	mtc1	$2,$f0
	nop
	cvt.s.w	$f0,$f0
	swc1	$f0,20($sp)
	lh	$2,12($16)
	mtc1	$2,$f0
	nop
	cvt.s.w	$f0,$f0
	swc1	$f0,24($sp)
	lh	$4,0($16)
	lui	$2,%hi(OverKartRAMHeader+20)
	lw	$3,%lo(OverKartRAMHeader+20)($2)
	sll	$2,$4,3
	subu	$2,$2,$4
	sll	$2,$2,2
	addu	$2,$3,$2
	lh	$5,12($2)
	jal	MakeAlignVector
	addiu	$4,$sp,16

	lwc1	$f0,16($sp)
	trunc.w.s $f0,$f0
	mfc1	$2,$f0
	nop
	sh	$2,28($sp)
	lwc1	$f0,20($sp)
	trunc.w.s $f0,$f0
	mfc1	$2,$f0
	nop
	sh	$2,30($sp)
	lwc1	$f0,24($sp)
	trunc.w.s $f0,$f0
	mfc1	$2,$f0
	nop
	sh	$2,32($sp)
	addiu	$5,$sp,28
	jal	UpdateObjectAngle
	addiu	$4,$16,36

	jal	ObjectBehaviorExist
	move	$4,$16

	b	$L165
	lwc1	$f2,64($16)

$L159:
	addiu	$5,$16,8
	jal	UpdateObjectAngle
	addiu	$4,$16,36

	b	$L165
	lwc1	$f2,64($16)

$L158:
	jal	ObjectBehaviorFollowPath
	move	$4,$16

$L157:
	jal	ObjectBehaviorWander
	move	$4,$16

$L152:
	lwc1	$f2,64($16)
$L165:
	lui	$2,%hi(g_waterHeight)
	lwc1	$f0,%lo(g_waterHeight)($2)
	c.lt.s	$f2,$f0
	nop
	bc1f	$L166
	lw	$31,44($sp)

	li	$2,-1			# 0xffffffffffffffff
	sh	$2,6($16)
	lw	$31,44($sp)
$L166:
	lw	$16,40($sp)
	jr	$31
	addiu	$sp,$sp,48

$L156:
	jal	ObjectBehaviorSearch
	move	$4,$16

	b	$L165
	lwc1	$f2,64($16)

$L155:
	jal	MoveIWA
	addiu	$4,$16,36

	b	$L165
	lwc1	$f2,64($16)

$L153:
	jal	ObjectBehaviorStrafe
	move	$4,$16

	b	$L165
	lwc1	$f2,64($16)

	.set	macro
	.set	reorder
	.end	Misbehave
	.size	Misbehave, .-Misbehave
	.section	.rodata.cst4,"aM",@progbits,4
	.align	2
$LC0:
	.word	1191753728
	.section	.rodata.cst8,"aM",@progbits,8
	.align	3
$LC1:
	.word	1069128089
	.word	-1717986918
	.section	.rodata.cst4
	.align	2
$LC2:
	.word	1157234688
	.section	.rodata.cst8
	.align	3
$LC3:
	.word	1071854387
	.word	858993459
	.section	.rodata.cst4
	.align	2
$LC4:
	.word	1058642330
	.align	2
$LC5:
	.word	1145569280
	.align	2
$LC6:
	.word	1065353216
	.section	.rodata.cst8
	.align	3
$LC7:
	.word	1073747066
	.word	-515396076
	.section	.rodata.cst4
	.align	2
$LC8:
	.word	1097859072
	.align	2
$LC9:
	.word	1073741824
	.align	2
$LC10:
	.word	1082130432
	.align	2
$LC11:
	.word	1048576000
	.align	2
$LC12:
	.word	1067450368
	.align	2
$LC13:
	.word	1120403456
	.align	2
$LC14:
	.word	1114636288
	.ident	"GCC: (GNU) 10.1.0"
