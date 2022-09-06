	.file	1 "Pathfinding.c"
	.section .mdebug.abi32
	.previous
	.nan	legacy
	.module	fp=32
	.module	nooddspreg
	.text
	.align	2
	.globl	GetItemBoxIndexes
	.set	nomips16
	.set	nomicromips
	.ent	GetItemBoxIndexes
	.type	GetItemBoxIndexes, @function
GetItemBoxIndexes:
	.frame	$sp,0,$31		# vars= 0, regs= 0/0, args= 0, gp= 0
	.mask	0x00000000,0
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	lui	$2,%hi(ItemBoxCount)
	sh	$0,%lo(ItemBoxCount)($2)
	lui	$3,%hi(g_SimpleObjectArray)
	addiu	$3,$3,%lo(g_SimpleObjectArray)
	move	$9,$0
	move	$5,$0
	move	$2,$0
	li	$7,12			# 0xc
	lui	$8,%hi(ItemBoxIndex)
	addiu	$8,$8,%lo(ItemBoxIndex)
	li	$10,1			# 0x1
	b	$L3
	li	$6,100			# 0x64

$L2:
	addiu	$2,$2,1
$L7:
	beq	$2,$6,$L6
	addiu	$3,$3,112

$L3:
	lh	$4,0($3)
	bnel	$4,$7,$L7
	addiu	$2,$2,1

	sll	$4,$5,1
	addu	$4,$4,$8
	sh	$2,0($4)
	addiu	$5,$5,1
	sll	$5,$5,16
	sra	$5,$5,16
	b	$L2
	move	$9,$10

$L6:
	beq	$9,$0,$L8
	lui	$2,%hi(ItemBoxCount)

	sh	$5,%lo(ItemBoxCount)($2)
$L8:
	jr	$31
	nop

	.set	macro
	.set	reorder
	.end	GetItemBoxIndexes
	.size	GetItemBoxIndexes, .-GetItemBoxIndexes
	.align	2
	.globl	PathfinderComplete
	.set	nomips16
	.set	nomicromips
	.ent	PathfinderComplete
	.type	PathfinderComplete, @function
PathfinderComplete:
	.frame	$sp,0,$31		# vars= 0, regs= 0/0, args= 0, gp= 0
	.mask	0x00000000,0
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	lb	$3,31($4)
	li	$2,1			# 0x1
	beql	$3,$2,$L10
	lh	$3,28($4)

	li	$2,2			# 0x2
	beql	$3,$2,$L11
	lh	$3,28($4)

	bne	$3,$0,$L65
	move	$2,$0

	lh	$3,28($4)
	slt	$3,$3,60
	beq	$3,$0,$L65
	li	$2,1			# 0x1

	lh	$2,0($4)
	li	$3,-1			# 0xffffffffffffffff
	beq	$2,$3,$L33
	nop

	lh	$3,22($4)
	bnel	$3,$0,$L14
	sll	$2,$2,1

	lb	$7,30($4)
	li	$6,-1			# 0xffffffffffffffff
	beq	$7,$6,$L55
	nop

	sll	$2,$2,1
	addu	$5,$5,$2
	lh	$5,0($5)
	beql	$5,$0,$L56
	lb	$4,30($4)

$L26:
	jr	$31
	slt	$2,$5,$3

$L14:
	addu	$5,$5,$2
	lh	$5,0($5)
	beql	$3,$5,$L57
	lb	$4,30($4)

$L16:
	bltz	$3,$L65
	li	$2,1			# 0x1

	b	$L26
	nop

$L57:
	li	$2,1			# 0x1
	bne	$4,$2,$L16
	nop

$L65:
	jr	$31
	nop

$L33:
	jr	$31
	li	$2,1			# 0x1

$L55:
	jr	$31
	li	$2,1			# 0x1

$L10:
	slt	$3,$3,60
	beq	$3,$0,$L65
	li	$2,1			# 0x1

	lh	$2,0($4)
	li	$3,-1			# 0xffffffffffffffff
	beq	$2,$3,$L38
	nop

	lh	$3,22($4)
	bnel	$3,$0,$L18
	sll	$2,$2,1

	lb	$7,30($4)
	li	$5,-1			# 0xffffffffffffffff
	beq	$7,$5,$L58
	nop

	sll	$2,$2,1
	addu	$6,$6,$2
	lh	$5,0($6)
	beql	$5,$0,$L59
	lb	$4,30($4)

$L28:
	jr	$31
	slt	$2,$5,$3

$L18:
	addu	$6,$6,$2
	lh	$5,0($6)
	beql	$3,$5,$L60
	lb	$4,30($4)

$L20:
	bltz	$3,$L65
	li	$2,1			# 0x1

	b	$L28
	nop

$L60:
	li	$2,1			# 0x1
	bne	$4,$2,$L20
	nop

	jr	$31
	nop

$L38:
	jr	$31
	li	$2,1			# 0x1

$L58:
	jr	$31
	li	$2,1			# 0x1

$L11:
	slt	$3,$3,60
	beq	$3,$0,$L65
	li	$2,1			# 0x1

	lh	$2,0($4)
	li	$3,-1			# 0xffffffffffffffff
	beq	$2,$3,$L43
	nop

	lh	$3,22($4)
	bnel	$3,$0,$L22
	sll	$2,$2,1

	lb	$6,30($4)
	li	$5,-1			# 0xffffffffffffffff
	beq	$6,$5,$L61
	nop

	sll	$2,$2,1
	addu	$7,$7,$2
	lh	$5,0($7)
	beql	$5,$0,$L62
	lb	$4,30($4)

$L30:
	jr	$31
	slt	$2,$5,$3

$L22:
	addu	$7,$7,$2
	lh	$5,0($7)
	beql	$3,$5,$L63
	lb	$4,30($4)

$L24:
	bltz	$3,$L65
	li	$2,1			# 0x1

	b	$L30
	nop

$L63:
	li	$2,1			# 0x1
	bne	$4,$2,$L24
	nop

	jr	$31
	nop

$L43:
	jr	$31
	li	$2,1			# 0x1

$L61:
	jr	$31
	li	$2,1			# 0x1

$L56:
	li	$2,1			# 0x1
	bne	$4,$2,$L26
	nop

	jr	$31
	nop

$L62:
	li	$2,1			# 0x1
	bne	$4,$2,$L30
	nop

	jr	$31
	nop

$L59:
	li	$2,1			# 0x1
	bne	$4,$2,$L28
	nop

	jr	$31
	nop

	.set	macro
	.set	reorder
	.end	PathfinderComplete
	.size	PathfinderComplete, .-PathfinderComplete
	.align	2
	.globl	FindNearestRampNode
	.set	nomips16
	.set	nomicromips
	.ent	FindNearestRampNode
	.type	FindNearestRampNode, @function
FindNearestRampNode:
	.frame	$sp,8,$31		# vars= 0, regs= 0/2, args= 0, gp= 0
	.mask	0x00000000,0
	.fmask	0x00300000,0
	.set	noreorder
	.set	nomacro
	addiu	$sp,$sp,-8
	sdc1	$f20,0($sp)
	mtc1	$6,$f4
	lwc1	$f12,4($4)
	sub.s	$f14,$f12,$f4
	lh	$11,30($sp)
	blez	$11,$L77
	mul.s	$f14,$f14,$f14

	move	$9,$7
	lw	$8,24($sp)
	move	$6,$0
	move	$12,$0
	li	$2,-1			# 0xffffffffffffffff
	lui	$3,%hi($LC0)
	lwc1	$f6,%lo($LC0)($3)
	lui	$3,%hi($LC1)
	ldc1	$f10,%lo($LC1)($3)
	move	$13,$0
	b	$L76
	mov.d	$f8,$f10

$L68:
	sub.s	$f0,$f12,$f0
$L88:
	cvt.d.s	$f0,$f0
	mul.d	$f0,$f0,$f0
	c.lt.d	$f0,$f8
	nop
	bc1tl	$L86
	sub.s	$f0,$f16,$f4

$L72:
	addiu	$6,$6,1
$L89:
	addiu	$9,$9,4
	beq	$6,$11,$L87
	addiu	$8,$8,2

$L76:
	lw	$14,0($9)
	lh	$3,2($14)
	mtc1	$3,$f0
	nop
	cvt.s.w	$f16,$f0
	lh	$10,0($8)
	sll	$3,$10,3
	addu	$3,$14,$3
	lh	$15,2($3)
	mtc1	$15,$f0
	sub.s	$f2,$f12,$f16
	cvt.d.s	$f2,$f2
	mul.d	$f2,$f2,$f2
	c.lt.d	$f2,$f10
	nop
	bc1f	$L68
	cvt.s.w	$f0,$f0

	sub.s	$f2,$f0,$f4
	cvt.d.s	$f2,$f2
	cvt.d.s	$f18,$f14
	mul.d	$f2,$f2,$f2
	c.lt.d	$f2,$f18
	nop
	bc1fl	$L88
	sub.s	$f0,$f12,$f0

	lh	$15,0($14)
	mtc1	$15,$f2
	nop
	cvt.s.w	$f20,$f2
	lwc1	$f18,0($4)
	sub.s	$f20,$f18,$f20
	cvt.d.s	$f20,$f20
	lh	$14,4($14)
	mtc1	$14,$f2
	nop
	cvt.s.w	$f2,$f2
	lwc1	$f18,8($4)
	sub.s	$f2,$f18,$f2
	cvt.d.s	$f2,$f2
	mul.d	$f2,$f2,$f2
	mul.d	$f20,$f20,$f20
	add.d	$f2,$f2,$f20
	cvt.s.d	$f2,$f2
	c.lt.s	$f2,$f6
	nop
	bc1fl	$L88
	sub.s	$f0,$f12,$f0

	sll	$2,$6,16
	sra	$2,$2,16
	mov.s	$f6,$f2
	b	$L68
	move	$12,$13

$L86:
	cvt.d.s	$f0,$f0
	cvt.d.s	$f2,$f14
	mul.d	$f0,$f0,$f0
	c.lt.d	$f0,$f2
	nop
	bc1fl	$L89
	addiu	$6,$6,1

	lh	$14,0($3)
	mtc1	$14,$f0
	nop
	cvt.s.w	$f0,$f0
	lwc1	$f2,0($4)
	sub.s	$f0,$f2,$f0
	cvt.d.s	$f0,$f0
	lh	$3,4($3)
	mtc1	$3,$f2
	nop
	cvt.s.w	$f2,$f2
	lwc1	$f16,8($4)
	sub.s	$f2,$f16,$f2
	cvt.d.s	$f2,$f2
	mul.d	$f0,$f0,$f0
	mul.d	$f2,$f2,$f2
	add.d	$f0,$f0,$f2
	cvt.s.d	$f0,$f0
	c.lt.s	$f0,$f6
	nop
	bc1fl	$L89
	addiu	$6,$6,1

	sll	$2,$6,16
	sra	$2,$2,16
	move	$12,$10
	b	$L72
	mov.s	$f6,$f0

$L87:
	li	$3,-1			# 0xffffffffffffffff
	beq	$2,$3,$L67
	sll	$3,$2,2

	addu	$7,$7,$3
	sll	$12,$12,3
	lw	$3,0($7)
	addu	$3,$3,$12
	lh	$3,0($3)
	mtc1	$3,$f0
	nop
	cvt.s.w	$f0,$f0
	swc1	$f0,0($5)
	lw	$3,0($7)
	addu	$3,$3,$12
	lh	$3,2($3)
	mtc1	$3,$f0
	nop
	cvt.s.w	$f0,$f0
	swc1	$f0,4($5)
	lw	$3,0($7)
	addu	$12,$3,$12
	lh	$3,4($12)
	mtc1	$3,$f0
	nop
	cvt.s.w	$f0,$f0
	swc1	$f0,8($5)
$L67:
	ldc1	$f20,0($sp)
	jr	$31
	addiu	$sp,$sp,8

$L77:
	b	$L67
	li	$2,-1			# 0xffffffffffffffff

	.set	macro
	.set	reorder
	.end	FindNearestRampNode
	.size	FindNearestRampNode, .-FindNearestRampNode
	.align	2
	.globl	FindNearestItemBox
	.set	nomips16
	.set	nomicromips
	.ent	FindNearestItemBox
	.type	FindNearestItemBox, @function
FindNearestItemBox:
	.frame	$sp,0,$31		# vars= 0, regs= 0/0, args= 0, gp= 0
	.mask	0x00000000,0
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	lwc1	$f10,0($4)
	lwc1	$f8,4($4)
	lui	$2,%hi(ItemBoxCount)
	lh	$2,%lo(ItemBoxCount)($2)
	blez	$2,$L96
	lwc1	$f12,8($4)

	lui	$6,%hi(ItemBoxIndex)
	addiu	$6,$6,%lo(ItemBoxIndex)
	move	$7,$0
	li	$2,-1			# 0xffffffffffffffff
	lui	$3,%hi($LC2)
	lwc1	$f4,%lo($LC2)($3)
	lui	$8,%hi(g_SimpleObjectArray)
	addiu	$8,$8,%lo(g_SimpleObjectArray)
	lui	$3,%hi($LC1)
	ldc1	$f6,%lo($LC1)($3)
	b	$L95
	lui	$9,%hi(ItemBoxCount)

$L92:
	addiu	$7,$7,1
$L101:
	lh	$3,%lo(ItemBoxCount)($9)
	slt	$3,$7,$3
	beq	$3,$0,$L102
	addiu	$6,$6,2

$L95:
	lh	$4,0($6)
	sll	$3,$4,3
	subu	$3,$3,$4
	sll	$3,$3,4
	addu	$3,$3,$8
	lwc1	$f14,28($3)
	sub.s	$f0,$f8,$f14
	cvt.d.s	$f0,$f0
	mul.d	$f0,$f0,$f0
	c.lt.d	$f0,$f6
	nop
	bc1fl	$L101
	addiu	$7,$7,1

	sll	$3,$4,3
	subu	$3,$3,$4
	sll	$3,$3,4
	addu	$3,$3,$8
	lwc1	$f18,24($3)
	lwc1	$f16,32($3)
	sub.s	$f2,$f18,$f10
	cvt.d.s	$f2,$f2
	sub.s	$f0,$f16,$f12
	cvt.d.s	$f0,$f0
	mul.d	$f0,$f0,$f0
	mul.d	$f2,$f2,$f2
	add.d	$f0,$f0,$f2
	cvt.s.d	$f0,$f0
	c.lt.s	$f0,$f4
	nop
	bc1fl	$L101
	addiu	$7,$7,1

	swc1	$f18,0($5)
	swc1	$f14,4($5)
	swc1	$f16,8($5)
	move	$2,$4
	b	$L92
	mov.s	$f4,$f0

$L102:
	jr	$31
	nop

$L96:
	jr	$31
	li	$2,-1			# 0xffffffffffffffff

	.set	macro
	.set	reorder
	.end	FindNearestItemBox
	.size	FindNearestItemBox, .-FindNearestItemBox
	.align	2
	.globl	FindNearestDropNode
	.set	nomips16
	.set	nomicromips
	.ent	FindNearestDropNode
	.type	FindNearestDropNode, @function
FindNearestDropNode:
	.frame	$sp,0,$31		# vars= 0, regs= 0/0, args= 0, gp= 0
	.mask	0x00000000,0
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	lh	$9,22($sp)
	blez	$9,$L109
	move	$8,$7

	lwc1	$f10,4($4)
	move	$6,$0
	li	$2,-1			# 0xffffffffffffffff
	lui	$3,%hi($LC0)
	lwc1	$f4,%lo($LC0)($3)
	lui	$3,%hi($LC1)
	b	$L108
	ldc1	$f8,%lo($LC1)($3)

$L105:
	addiu	$6,$6,1
$L114:
	beq	$6,$9,$L113
	addiu	$8,$8,4

$L108:
	lw	$10,0($8)
	lh	$3,2($10)
	mtc1	$3,$f0
	nop
	cvt.s.w	$f0,$f0
	sub.s	$f0,$f10,$f0
	cvt.d.s	$f0,$f0
	mul.d	$f0,$f0,$f0
	c.lt.d	$f0,$f8
	nop
	bc1fl	$L114
	addiu	$6,$6,1

	lh	$3,0($10)
	mtc1	$3,$f0
	nop
	cvt.s.w	$f6,$f0
	lwc1	$f2,0($4)
	sub.s	$f6,$f2,$f6
	cvt.d.s	$f6,$f6
	lh	$3,4($10)
	mtc1	$3,$f0
	nop
	cvt.s.w	$f0,$f0
	lwc1	$f2,8($4)
	sub.s	$f0,$f2,$f0
	cvt.d.s	$f0,$f0
	mul.d	$f0,$f0,$f0
	mul.d	$f6,$f6,$f6
	add.d	$f0,$f0,$f6
	cvt.s.d	$f0,$f0
	c.lt.s	$f0,$f4
	nop
	bc1fl	$L114
	addiu	$6,$6,1

	sll	$2,$6,16
	sra	$2,$2,16
	b	$L105
	mov.s	$f4,$f0

$L113:
	li	$3,-1			# 0xffffffffffffffff
	beq	$2,$3,$L115
	sll	$3,$2,2

	addu	$7,$7,$3
	lw	$3,0($7)
	lh	$3,0($3)
	mtc1	$3,$f0
	nop
	cvt.s.w	$f0,$f0
	swc1	$f0,0($5)
	lw	$3,0($7)
	lh	$3,2($3)
	mtc1	$3,$f0
	nop
	cvt.s.w	$f0,$f0
	swc1	$f0,4($5)
	lw	$3,0($7)
	lh	$3,4($3)
	mtc1	$3,$f0
	nop
	cvt.s.w	$f0,$f0
	jr	$31
	swc1	$f0,8($5)

$L109:
	li	$2,-1			# 0xffffffffffffffff
$L115:
	jr	$31
	nop

	.set	macro
	.set	reorder
	.end	FindNearestDropNode
	.size	FindNearestDropNode, .-FindNearestDropNode
	.align	2
	.globl	UpdateBKPath
	.set	nomips16
	.set	nomicromips
	.ent	UpdateBKPath
	.type	UpdateBKPath, @function
UpdateBKPath:
	.frame	$sp,96,$31		# vars= 24, regs= 10/4, args= 16, gp= 0
	.mask	0xc0ff0000,-20
	.fmask	0x00f00000,-8
	.set	noreorder
	.set	nomacro
	addiu	$sp,$sp,-96
	sw	$31,76($sp)
	sw	$fp,72($sp)
	sw	$23,68($sp)
	sw	$22,64($sp)
	sw	$21,60($sp)
	sw	$20,56($sp)
	sw	$19,52($sp)
	sw	$18,48($sp)
	sw	$17,44($sp)
	sw	$16,40($sp)
	sdc1	$f22,88($sp)
	sdc1	$f20,80($sp)
	move	$21,$4
	sw	$5,100($sp)
	sw	$7,108($sp)
	lh	$22,118($sp)
	lb	$2,123($sp)
	sw	$2,36($sp)
	lui	$2,%hi($LC0)
	lwc1	$f0,%lo($LC0)($2)
	swc1	$f0,4($4)
	lh	$2,0($4)
	li	$3,-1			# 0xffffffffffffffff
	beq	$2,$3,$L117
	move	$16,$6

	sh	$2,2($4)
$L117:
	li	$2,-1			# 0xffffffffffffffff
	sh	$2,0($21)
	lh	$fp,114($sp)
	blez	$fp,$L118
	sll	$2,$22,3

	subu	$2,$2,$22
	sll	$2,$2,4
	subu	$2,$2,$22
	sll	$2,$2,2
	subu	$2,$2,$22
	sll	$2,$2,3
	addiu	$2,$2,20
	lui	$3,%hi(GlobalPlayer)
	addiu	$3,$3,%lo(GlobalPlayer)
	addu	$2,$3,$2
	sw	$2,20($sp)
	lw	$18,108($sp)
	move	$19,$0
	lui	$3,%hi(GlobalPlayer)
	sll	$2,$22,3
	subu	$2,$2,$22
	sll	$2,$2,4
	subu	$2,$2,$22
	sll	$2,$2,2
	subu	$2,$2,$22
	sll	$2,$2,3
	addiu	$22,$3,%lo(GlobalPlayer)
	addu	$22,$22,$2
	lui	$2,%hi($LC3)
	ldc1	$f22,%lo($LC3)($2)
	lui	$2,%hi(objectPosition)
	sw	$2,24($sp)
	addiu	$23,$2,%lo(objectPosition)
	lui	$2,%hi($LC4)
	lwc1	$f0,%lo($LC4)($2)
	swc1	$f0,28($sp)
	lui	$3,%hi($LC1)
	ldc1	$f20,%lo($LC1)($3)
	b	$L125
	swc1	$f0,32($sp)

$L119:
	sll	$17,$17,3
$L137:
	lw	$2,0($20)
	addu	$2,$2,$17
	lh	$3,2($2)
	mtc1	$3,$f0
	nop
	cvt.s.w	$f0,$f0
	lwc1	$f2,24($22)
	sub.s	$f0,$f2,$f0
	cvt.d.s	$f0,$f0
	mul.d	$f0,$f0,$f0
	c.lt.d	$f0,$f20
	nop
	bc1tl	$L134
	lh	$2,0($2)

$L122:
	addiu	$19,$19,1
$L138:
	addiu	$18,$18,2
	beq	$19,$fp,$L135
	addiu	$16,$16,4

$L125:
	sw	$18,16($sp)
	lh	$17,0($18)
	lw	$3,0($16)
	lh	$2,2($3)
	mtc1	$2,$f0
	nop
	cvt.s.w	$f0,$f0
	lwc1	$f2,24($22)
	sub.s	$f0,$f2,$f0
	cvt.d.s	$f0,$f0
	mul.d	$f0,$f0,$f0
	c.lt.d	$f0,$f22
	nop
	bc1f	$L119
	move	$20,$16

	lh	$2,0($3)
	mtc1	$2,$f0
	nop
	cvt.s.w	$f0,$f0
	lw	$2,24($sp)
	swc1	$f0,%lo(objectPosition)($2)
	lw	$2,0($16)
	lh	$2,2($2)
	mtc1	$2,$f0
	nop
	cvt.s.w	$f0,$f0
	swc1	$f0,4($23)
	lw	$2,0($16)
	lh	$2,4($2)
	mtc1	$2,$f0
	nop
	cvt.s.w	$f0,$f0
	swc1	$f0,8($23)
	lw	$7,28($sp)
	move	$6,$23
	lwc1	$f0,100($sp)
	cvt.s.w	$f0,$f0
	mfc1	$5,$f0
	jal	TestCollideSphere
	lw	$4,20($sp)

	beql	$2,$0,$L137
	sll	$17,$17,3

	sll	$3,$17,3
	lw	$2,0($16)
	addu	$3,$2,$3
	lh	$2,0($3)
	mtc1	$2,$f0
	nop
	cvt.s.w	$f0,$f0
	lwc1	$f2,8($21)
	sub.s	$f0,$f0,$f2
	cvt.d.s	$f0,$f0
	lh	$2,4($3)
	mtc1	$2,$f2
	nop
	cvt.s.w	$f2,$f2
	lwc1	$f4,16($21)
	sub.s	$f2,$f2,$f4
	cvt.d.s	$f2,$f2
	mul.d	$f0,$f0,$f0
	mul.d	$f2,$f2,$f2
	add.d	$f0,$f0,$f2
	cvt.s.d	$f0,$f0
	lwc1	$f2,4($21)
	c.lt.s	$f0,$f2
	nop
	bc1fl	$L137
	sll	$17,$17,3

	swc1	$f0,4($21)
	sh	$19,0($21)
	sh	$0,20($21)
	li	$2,1			# 0x1
	sb	$2,30($21)
	lw	$2,36($sp)
	sb	$2,31($21)
	sh	$0,22($21)
	lw	$2,0($16)
	lh	$2,2($2)
	mtc1	$2,$f0
	nop
	cvt.s.w	$f0,$f0
	swc1	$f0,24($21)
	b	$L119
	sh	$0,28($21)

$L134:
	mtc1	$2,$f0
	nop
	cvt.s.w	$f0,$f0
	lw	$2,24($sp)
	swc1	$f0,%lo(objectPosition)($2)
	lw	$2,0($20)
	addu	$2,$2,$17
	lh	$2,2($2)
	mtc1	$2,$f0
	nop
	cvt.s.w	$f0,$f0
	swc1	$f0,4($23)
	lw	$2,0($20)
	addu	$17,$2,$17
	lh	$2,4($17)
	mtc1	$2,$f0
	nop
	cvt.s.w	$f0,$f0
	swc1	$f0,8($23)
	lw	$7,32($sp)
	move	$6,$23
	lwc1	$f0,100($sp)
	cvt.s.w	$f0,$f0
	mfc1	$5,$f0
	jal	TestCollideSphere
	lw	$4,20($sp)

	beql	$2,$0,$L138
	addiu	$19,$19,1

	lw	$3,0($20)
	lh	$2,0($3)
	mtc1	$2,$f0
	nop
	cvt.s.w	$f0,$f0
	lwc1	$f2,8($21)
	sub.s	$f0,$f0,$f2
	cvt.d.s	$f0,$f0
	lh	$2,4($3)
	mtc1	$2,$f2
	nop
	cvt.s.w	$f2,$f2
	lwc1	$f4,16($21)
	sub.s	$f2,$f2,$f4
	cvt.d.s	$f2,$f2
	mul.d	$f0,$f0,$f0
	mul.d	$f2,$f2,$f2
	add.d	$f0,$f0,$f2
	cvt.s.d	$f0,$f0
	lwc1	$f2,4($21)
	c.lt.s	$f0,$f2
	nop
	bc1fl	$L138
	addiu	$19,$19,1

	swc1	$f0,4($21)
	sh	$19,0($21)
	lw	$3,16($sp)
	lh	$2,0($3)
	sh	$2,20($21)
	li	$2,-1			# 0xffffffffffffffff
	sb	$2,30($21)
	lw	$2,36($sp)
	sb	$2,31($21)
	lh	$2,0($3)
	sh	$2,22($21)
	lw	$3,0($20)
	sll	$2,$2,3
	addu	$2,$3,$2
	lh	$2,2($2)
	mtc1	$2,$f0
	nop
	cvt.s.w	$f0,$f0
	swc1	$f0,24($21)
	b	$L122
	sh	$0,28($21)

$L135:
	lh	$3,0($21)
	li	$2,-1			# 0xffffffffffffffff
	beql	$3,$2,$L139
	lh	$7,2($21)

$L116:
	lw	$31,76($sp)
	lw	$fp,72($sp)
	lw	$23,68($sp)
	lw	$22,64($sp)
	lw	$21,60($sp)
	lw	$20,56($sp)
	lw	$19,52($sp)
	lw	$18,48($sp)
	lw	$17,44($sp)
	lw	$16,40($sp)
	ldc1	$f22,88($sp)
	ldc1	$f20,80($sp)
	jr	$31
	addiu	$sp,$sp,96

$L118:
	lh	$7,2($21)
$L139:
	sh	$7,0($21)
	lb	$3,30($21)
	li	$2,1			# 0x1
	beq	$3,$2,$L136
	sll	$7,$7,1

	lw	$2,108($sp)
	addu	$7,$2,$7
	lh	$2,0($7)
	b	$L116
	sh	$2,20($21)

$L136:
	b	$L116
	sh	$0,20($21)

	.set	macro
	.set	reorder
	.end	UpdateBKPath
	.size	UpdateBKPath, .-UpdateBKPath
	.align	2
	.globl	ResetLaneDefaultOffset
	.set	nomips16
	.set	nomicromips
	.ent	ResetLaneDefaultOffset
	.type	ResetLaneDefaultOffset, @function
ResetLaneDefaultOffset:
	.frame	$sp,24,$31		# vars= 0, regs= 2/0, args= 16, gp= 0
	.mask	0x80010000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	addiu	$sp,$sp,-24
	sw	$31,20($sp)
	sw	$16,16($sp)
	move	$16,$4
	jal	MakeRandomLimmit
	li	$4,3			# 0x3

	li	$3,1			# 0x1
	beq	$2,$3,$L141
	li	$3,2			# 0x2

	beql	$2,$3,$L142
	lui	$2,%hi(LaneData)

	beq	$2,$0,$L145
	lui	$2,%hi(LaneData)

$L143:
	sll	$16,$16,4
	lui	$4,%hi(LaneData)
	addiu	$4,$4,%lo(LaneData)
	addu	$16,$16,$4
	lui	$2,%hi($LC6)
	lwc1	$f0,%lo($LC6)($2)
	swc1	$f0,8($16)
	lw	$31,20($sp)
	lw	$16,16($sp)
	jr	$31
	addiu	$sp,$sp,24

$L145:
	sll	$3,$16,4
	addiu	$2,$2,%lo(LaneData)
	addu	$2,$2,$3
	lui	$3,%hi(g_RoadWidth)
	lwc1	$f0,%lo(g_RoadWidth)($3)
	lui	$3,%hi($LC5)
	lwc1	$f2,%lo($LC5)($3)
	mul.s	$f0,$f0,$f2
	mfc1	$3,$f0
	li	$4,-2147483648			# 0xffffffff80000000
	xor	$3,$3,$4
	b	$L143
	sw	$3,12($2)

$L141:
	lui	$2,%hi(LaneData)
	sll	$3,$16,4
	addiu	$2,$2,%lo(LaneData)
	addu	$2,$2,$3
	b	$L143
	sw	$0,12($2)

$L142:
	sll	$3,$16,4
	addiu	$2,$2,%lo(LaneData)
	addu	$2,$2,$3
	lui	$3,%hi(g_RoadWidth)
	lwc1	$f0,%lo(g_RoadWidth)($3)
	lui	$3,%hi($LC5)
	lwc1	$f2,%lo($LC5)($3)
	mul.s	$f0,$f0,$f2
	b	$L143
	swc1	$f0,12($2)

	.set	macro
	.set	reorder
	.end	ResetLaneDefaultOffset
	.size	ResetLaneDefaultOffset, .-ResetLaneDefaultOffset
	.align	2
	.globl	ChooseAlternativePathRandm
	.set	nomips16
	.set	nomicromips
	.ent	ChooseAlternativePathRandm
	.type	ChooseAlternativePathRandm, @function
ChooseAlternativePathRandm:
	.frame	$sp,24,$31		# vars= 0, regs= 2/0, args= 16, gp= 0
	.mask	0x80010000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	sll	$2,$4,1
	lui	$3,%hi(g_playerPathPointTable)
	addiu	$3,$3,%lo(g_playerPathPointTable)
	addu	$2,$2,$3
	lh	$2,0($2)
	slt	$5,$2,$5
	bne	$5,$0,$L154
	nop

	addiu	$sp,$sp,-24
	sw	$31,20($sp)
	sw	$16,16($sp)
	slt	$2,$6,$2
	beq	$2,$0,$L152
	move	$16,$4

	lw	$31,20($sp)
$L153:
	lw	$16,16($sp)
	jr	$31
	addiu	$sp,$sp,24

$L152:
	jal	MakeRandomLimmit
	move	$4,$7

	sll	$3,$16,1
	lui	$4,%hi(CurrentPathID)
	addiu	$4,$4,%lo(CurrentPathID)
	addu	$3,$3,$4
	sh	$2,0($3)
	jal	ResetLaneDefaultOffset
	move	$4,$16

	b	$L153
	lw	$31,20($sp)

$L154:
	jr	$31
	nop

	.set	macro
	.set	reorder
	.end	ChooseAlternativePathRandm
	.size	ChooseAlternativePathRandm, .-ChooseAlternativePathRandm
	.align	2
	.globl	ChangePathAndPoint
	.set	nomips16
	.set	nomicromips
	.ent	ChangePathAndPoint
	.type	ChangePathAndPoint, @function
ChangePathAndPoint:
	.frame	$sp,24,$31		# vars= 0, regs= 1/0, args= 16, gp= 0
	.mask	0x80000000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	sll	$2,$4,1
	lui	$3,%hi(CurrentPathID)
	addiu	$3,$3,%lo(CurrentPathID)
	addu	$2,$2,$3
	lhu	$2,0($2)
	bne	$2,$7,$L162
	sll	$2,$4,1

	lui	$3,%hi(g_playerPathPointTable)
	addiu	$3,$3,%lo(g_playerPathPointTable)
	addu	$2,$2,$3
	lh	$2,0($2)
	slt	$5,$2,$5
	bne	$5,$0,$L162
	slt	$2,$6,$2

	beq	$2,$0,$L161
	sll	$3,$4,1

$L162:
	jr	$31
	nop

$L161:
	addiu	$sp,$sp,-24
	sw	$31,20($sp)
	lui	$2,%hi(CurrentPathID)
	addiu	$2,$2,%lo(CurrentPathID)
	addu	$2,$3,$2
	lhu	$5,42($sp)
	sh	$5,0($2)
	lui	$2,%hi(g_playerPathPointTable)
	addiu	$2,$2,%lo(g_playerPathPointTable)
	addu	$3,$3,$2
	jal	ResetLaneDefaultOffset
	sh	$6,0($3)

	lw	$31,20($sp)
	jr	$31
	addiu	$sp,$sp,24

	.set	macro
	.set	reorder
	.end	ChangePathAndPoint
	.size	ChangePathAndPoint, .-ChangePathAndPoint
	.align	2
	.globl	MakeAlternativePath
	.set	nomips16
	.set	nomicromips
	.ent	MakeAlternativePath
	.type	MakeAlternativePath, @function
MakeAlternativePath:
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
	move	$16,$6
	sll	$3,$6,2
	lui	$2,%hi(CenterPathBP)
	addiu	$2,$2,%lo(CenterPathBP)
	addu	$2,$3,$2
	sw	$4,0($2)
	sll	$2,$6,1
	lui	$4,%hi(g_courseTotalPathPoints)
	addiu	$4,$4,%lo(g_courseTotalPathPoints)
	addu	$2,$2,$4
	sh	$5,0($2)
	lui	$2,%hi(MaxPathPoints)
	addiu	$2,$2,%lo(MaxPathPoints)
	addu	$3,$3,$2
	blez	$5,$L164
	sw	$5,0($3)

	move	$7,$5
	move	$5,$0
	lui	$8,%hi(CenterPathBP)
	sll	$6,$6,2
	addiu	$2,$8,%lo(CenterPathBP)
	addu	$6,$6,$2
	lui	$9,%hi(g_mirrorValue)
$L165:
	sll	$4,$5,3
	lw	$3,0($6)
	addu	$3,$3,$4
	lh	$2,0($3)
	mtc1	$2,$f0
	nop
	cvt.s.w	$f0,$f0
	lwc1	$f2,%lo(g_mirrorValue)($9)
	mul.s	$f0,$f0,$f2
	trunc.w.s $f0,$f0
	mfc1	$2,$f0
	nop
	sh	$2,0($3)
	lw	$2,%lo(CenterPathBP)($8)
	addu	$2,$2,$4
	lh	$3,6($2)
	lw	$2,0($6)
	addu	$2,$2,$4
	addiu	$5,$5,1
	bne	$5,$7,$L165
	sh	$3,6($2)

$L164:
	sll	$18,$16,2
	lui	$17,%hi(MaxPathPoints)
	addiu	$17,$17,%lo(MaxPathPoints)
	addu	$17,$18,$17
	lw	$4,0($17)
	jal	AllocateMemory
	sll	$4,$4,3

	lui	$3,%hi(SideLPathBP)
	addiu	$3,$3,%lo(SideLPathBP)
	addu	$3,$18,$3
	sw	$2,0($3)
	lw	$4,0($17)
	jal	AllocateMemory
	sll	$4,$4,3

	lui	$3,%hi(SideRPathBP)
	addiu	$3,$3,%lo(SideRPathBP)
	addu	$3,$18,$3
	sw	$2,0($3)
	lw	$4,0($17)
	jal	AllocateMemory
	sll	$4,$4,1

	lui	$3,%hi(CurvePathDataBP)
	addiu	$3,$3,%lo(CurvePathDataBP)
	addu	$3,$18,$3
	sw	$2,0($3)
	lw	$4,0($17)
	jal	AllocateMemory
	sll	$4,$4,1

	lui	$3,%hi(AnglePathDataBP)
	addiu	$3,$3,%lo(AnglePathDataBP)
	addu	$3,$18,$3
	sw	$2,0($3)
	lw	$4,0($17)
	jal	AllocateMemory
	sll	$4,$4,1

	lui	$3,%hi(ShortCutPathDataBP)
	addiu	$3,$3,%lo(ShortCutPathDataBP)
	addu	$18,$18,$3
	sw	$2,0($18)
	jal	SidePointCalcBP
	move	$4,$16

	jal	CurveDataCalcBP
	move	$4,$16

	jal	AngleDataCalcBP
	move	$4,$16

	jal	ShortcutDataCalcBP
	move	$4,$16

	lw	$31,28($sp)
	lw	$18,24($sp)
	lw	$17,20($sp)
	lw	$16,16($sp)
	jr	$31
	addiu	$sp,$sp,32

	.set	macro
	.set	reorder
	.end	MakeAlternativePath
	.size	MakeAlternativePath, .-MakeAlternativePath
	.globl	ItemBoxIndex
	.section	.bss,"aw",@nobits
	.align	2
	.type	ItemBoxIndex, @object
	.size	ItemBoxIndex, 200
ItemBoxIndex:
	.space	200
	.globl	ItemBoxCount
	.align	1
	.type	ItemBoxCount, @object
	.size	ItemBoxCount, 2
ItemBoxCount:
	.space	2
	.globl	AIPathfinder
	.align	2
	.type	AIPathfinder, @object
	.size	AIPathfinder, 128
AIPathfinder:
	.space	128
	.section	.rodata.cst4,"aM",@progbits,4
	.align	2
$LC0:
	.word	1259902591
	.section	.rodata.cst8,"aM",@progbits,8
	.align	3
$LC1:
	.word	1080827904
	.word	0
	.section	.rodata.cst4
	.align	2
$LC2:
	.word	1343554297
	.section	.rodata.cst8
	.align	3
$LC3:
	.word	1081671680
	.word	0
	.section	.rodata.cst4
	.align	2
$LC4:
	.word	1084227584
	.align	2
$LC5:
	.word	1000593162
	.align	2
$LC6:
	.word	1092616192
	.ident	"GCC: (GNU) 10.1.0"
