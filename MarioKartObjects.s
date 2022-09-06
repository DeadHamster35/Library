	.file	1 "MarioKartObjects.c"
	.section .mdebug.abi32
	.previous
	.nan	legacy
	.module	fp=32
	.module	nooddspreg
	.text
	.align	2
	.globl	CheckBump2Simple
	.set	nomips16
	.set	nomicromips
	.ent	CheckBump2Simple
	.type	CheckBump2Simple, @function
CheckBump2Simple:
	.frame	$sp,40,$31		# vars= 0, regs= 1/0, args= 32, gp= 0
	.mask	0x80000000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	addiu	$sp,$sp,-40
	sw	$31,36($sp)
	lwc1	$f2,24($4)
	lwc1	$f4,28($4)
	lwc1	$f6,32($4)
	lwc1	$f0,44($4)
	sub.s	$f0,$f6,$f0
	swc1	$f0,28($sp)
	lwc1	$f0,40($4)
	sub.s	$f0,$f4,$f0
	swc1	$f0,24($sp)
	lwc1	$f0,36($4)
	sub.s	$f0,$f2,$f0
	swc1	$f0,20($sp)
	swc1	$f6,16($sp)
	mfc1	$7,$f4
	mfc1	$6,$f2
	lw	$5,12($4)
	jal	CheckBump2
	addiu	$4,$4,48

	lw	$31,36($sp)
	jr	$31
	addiu	$sp,$sp,40

	.set	macro
	.set	reorder
	.end	CheckBump2Simple
	.size	CheckBump2Simple, .-CheckBump2Simple
	.align	2
	.globl	CheckBump2Simple2
	.set	nomips16
	.set	nomicromips
	.ent	CheckBump2Simple2
	.type	CheckBump2Simple2, @function
CheckBump2Simple2:
	.frame	$sp,40,$31		# vars= 0, regs= 1/0, args= 32, gp= 0
	.mask	0x80000000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	addiu	$sp,$sp,-40
	sw	$31,36($sp)
	move	$2,$6
	lw	$6,0($6)
	lw	$7,4($2)
	lwc1	$f0,8($2)
	swc1	$f0,28($sp)
	sw	$7,24($sp)
	sw	$6,20($sp)
	jal	CheckBump2
	swc1	$f0,16($sp)

	lw	$31,36($sp)
	jr	$31
	addiu	$sp,$sp,40

	.set	macro
	.set	reorder
	.end	CheckBump2Simple2
	.size	CheckBump2Simple2, .-CheckBump2Simple2
	.align	2
	.globl	MasterCreateObject
	.set	nomips16
	.set	nomicromips
	.ent	MasterCreateObject
	.type	MasterCreateObject, @function
MasterCreateObject:
	.frame	$sp,24,$31		# vars= 0, regs= 1/0, args= 16, gp= 0
	.mask	0x80000000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	addiu	$sp,$sp,-24
	sw	$31,20($sp)
	lui	$6,%hi(objectVelocity)
	jal	addObjectBuffer
	addiu	$6,$6,%lo(objectVelocity)

	lui	$3,%hi(GlobalShortA)
	sh	$2,%lo(GlobalShortA)($3)
	sll	$3,$2,3
	subu	$3,$3,$2
	sll	$4,$3,4
	lui	$3,%hi(g_SimpleObjectArray)
	addiu	$3,$3,%lo(g_SimpleObjectArray)
	addu	$3,$3,$4
	lui	$4,%hi(GlobalAddressA)
	sw	$3,%lo(GlobalAddressA)($4)
	lui	$4,%hi(GlobalObjectA)
	sw	$3,%lo(GlobalObjectA)($4)
	li	$4,-16384			# 0xffffffffffffc000
	sh	$4,2($3)
	lwc1	$f0,40($sp)
	swc1	$f0,12($3)
	lw	$31,20($sp)
	jr	$31
	addiu	$sp,$sp,24

	.set	macro
	.set	reorder
	.end	MasterCreateObject
	.size	MasterCreateObject, .-MasterCreateObject
	.align	2
	.globl	CreateObjectRotation
	.set	nomips16
	.set	nomicromips
	.ent	CreateObjectRotation
	.type	CreateObjectRotation, @function
CreateObjectRotation:
	.frame	$sp,32,$31		# vars= 0, regs= 1/0, args= 24, gp= 0
	.mask	0x80000000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	addiu	$sp,$sp,-32
	sw	$31,28($sp)
	lui	$2,%hi(objectVelocity)
	sw	$0,%lo(objectVelocity)($2)
	addiu	$2,$2,%lo(objectVelocity)
	sw	$0,4($2)
	sw	$0,8($2)
	lui	$3,%hi($LC0)
	lwc1	$f0,%lo($LC0)($3)
	swc1	$f0,16($sp)
	move	$7,$6
	jal	MasterCreateObject
	move	$6,$2

	lui	$3,%hi(GlobalShortA)
	sh	$2,%lo(GlobalShortA)($3)
	lw	$31,28($sp)
	jr	$31
	addiu	$sp,$sp,32

	.set	macro
	.set	reorder
	.end	CreateObjectRotation
	.size	CreateObjectRotation, .-CreateObjectRotation
	.align	2
	.globl	CreateObjectRadius
	.set	nomips16
	.set	nomicromips
	.ent	CreateObjectRadius
	.type	CreateObjectRadius, @function
CreateObjectRadius:
	.frame	$sp,32,$31		# vars= 0, regs= 1/0, args= 24, gp= 0
	.mask	0x80000000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	addiu	$sp,$sp,-32
	sw	$31,28($sp)
	lui	$2,%hi(objectVelocity)
	sw	$0,%lo(objectVelocity)($2)
	addiu	$2,$2,%lo(objectVelocity)
	sw	$0,4($2)
	sw	$0,8($2)
	sw	$7,16($sp)
	move	$7,$6
	jal	MasterCreateObject
	move	$6,$2

	lui	$3,%hi(GlobalShortA)
	sh	$2,%lo(GlobalShortA)($3)
	lw	$31,28($sp)
	jr	$31
	addiu	$sp,$sp,32

	.set	macro
	.set	reorder
	.end	CreateObjectRadius
	.size	CreateObjectRadius, .-CreateObjectRadius
	.align	2
	.globl	CreateObject
	.set	nomips16
	.set	nomicromips
	.ent	CreateObject
	.type	CreateObject, @function
CreateObject:
	.frame	$sp,32,$31		# vars= 0, regs= 1/0, args= 24, gp= 0
	.mask	0x80000000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	addiu	$sp,$sp,-32
	sw	$31,28($sp)
	lui	$2,%hi(objectAngle)
	sh	$0,%lo(objectAngle)($2)
	addiu	$2,$2,%lo(objectAngle)
	sh	$0,2($2)
	sh	$0,4($2)
	lui	$6,%hi(objectVelocity)
	sw	$0,%lo(objectVelocity)($6)
	addiu	$6,$6,%lo(objectVelocity)
	sw	$0,4($6)
	sw	$0,8($6)
	lui	$3,%hi($LC0)
	lwc1	$f0,%lo($LC0)($3)
	swc1	$f0,16($sp)
	move	$7,$5
	jal	MasterCreateObject
	move	$5,$2

	lw	$31,28($sp)
	jr	$31
	addiu	$sp,$sp,32

	.set	macro
	.set	reorder
	.end	CreateObject
	.size	CreateObject, .-CreateObject
	.align	2
	.globl	CreateObjectSimple
	.set	nomips16
	.set	nomicromips
	.ent	CreateObjectSimple
	.type	CreateObjectSimple, @function
CreateObjectSimple:
	.frame	$sp,32,$31		# vars= 0, regs= 1/0, args= 24, gp= 0
	.mask	0x80000000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	addiu	$sp,$sp,-32
	sw	$31,28($sp)
	lui	$2,%hi(objectPosition)
	mtc1	$4,$f0
	nop
	cvt.s.w	$f0,$f0
	swc1	$f0,%lo(objectPosition)($2)
	addiu	$4,$2,%lo(objectPosition)
	mtc1	$5,$f0
	nop
	cvt.s.w	$f0,$f0
	swc1	$f0,4($4)
	mtc1	$6,$f0
	nop
	cvt.s.w	$f0,$f0
	swc1	$f0,8($4)
	lui	$5,%hi(objectAngle)
	sh	$0,%lo(objectAngle)($5)
	addiu	$5,$5,%lo(objectAngle)
	sh	$7,2($5)
	sh	$0,4($5)
	lui	$6,%hi(objectVelocity)
	sw	$0,%lo(objectVelocity)($6)
	addiu	$6,$6,%lo(objectVelocity)
	sw	$0,4($6)
	sw	$0,8($6)
	lui	$2,%hi($LC0)
	lwc1	$f0,%lo($LC0)($2)
	swc1	$f0,16($sp)
	jal	MasterCreateObject
	lh	$7,50($sp)

	lw	$31,28($sp)
	jr	$31
	addiu	$sp,$sp,32

	.set	macro
	.set	reorder
	.end	CreateObjectSimple
	.size	CreateObjectSimple, .-CreateObjectSimple
	.align	2
	.globl	UpdateObjectVelocity
	.set	nomips16
	.set	nomicromips
	.ent	UpdateObjectVelocity
	.type	UpdateObjectVelocity, @function
UpdateObjectVelocity:
	.frame	$sp,0,$31		# vars= 0, regs= 0/0, args= 0, gp= 0
	.mask	0x00000000,0
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	lwc1	$f0,24($4)
	lwc1	$f2,36($4)
	add.s	$f0,$f0,$f2
	swc1	$f0,24($4)
	lwc1	$f0,28($4)
	lwc1	$f2,40($4)
	add.s	$f0,$f0,$f2
	swc1	$f0,28($4)
	lwc1	$f0,32($4)
	lwc1	$f2,44($4)
	add.s	$f0,$f0,$f2
	jr	$31
	swc1	$f0,32($4)

	.set	macro
	.set	reorder
	.end	UpdateObjectVelocity
	.size	UpdateObjectVelocity, .-UpdateObjectVelocity
	.align	2
	.globl	UpdateObjectAngle
	.set	nomips16
	.set	nomicromips
	.ent	UpdateObjectAngle
	.type	UpdateObjectAngle, @function
UpdateObjectAngle:
	.frame	$sp,0,$31		# vars= 0, regs= 0/0, args= 0, gp= 0
	.mask	0x00000000,0
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	lhu	$2,16($4)
	lhu	$3,0($5)
	addu	$2,$2,$3
	sh	$2,16($4)
	lhu	$2,18($4)
	lhu	$3,2($5)
	addu	$2,$2,$3
	sh	$2,18($4)
	lhu	$2,20($4)
	lhu	$3,4($5)
	addu	$2,$2,$3
	jr	$31
	sh	$2,20($4)

	.set	macro
	.set	reorder
	.end	UpdateObjectAngle
	.size	UpdateObjectAngle, .-UpdateObjectAngle
	.align	2
	.globl	UpdateObjectGravity
	.set	nomips16
	.set	nomicromips
	.ent	UpdateObjectGravity
	.type	UpdateObjectGravity, @function
UpdateObjectGravity:
	.frame	$sp,0,$31		# vars= 0, regs= 0/0, args= 0, gp= 0
	.mask	0x00000000,0
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	lwc1	$f0,40($4)
	lui	$2,%hi($LC1)
	lwc1	$f2,%lo($LC1)($2)
	sub.s	$f0,$f0,$f2
	jr	$31
	swc1	$f0,40($4)

	.set	macro
	.set	reorder
	.end	UpdateObjectGravity
	.size	UpdateObjectGravity, .-UpdateObjectGravity
	.align	2
	.globl	ManualBump
	.set	nomips16
	.set	nomicromips
	.ent	ManualBump
	.type	ManualBump, @function
ManualBump:
	.frame	$sp,0,$31		# vars= 0, regs= 0/0, args= 0, gp= 0
	.mask	0x00000000,0
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	lwc1	$f0,20($4)
	mtc1	$0,$f2
	nop
	c.lt.s	$f0,$f2
	nop
	bc1tl	$L28
	lhu	$3,4($4)

$L19:
	lwc1	$f0,12($4)
$L31:
	mtc1	$0,$f2
	nop
	c.lt.s	$f0,$f2
	nop
	bc1tl	$L29
	lhu	$3,0($4)

$L21:
	lwc1	$f0,16($4)
$L32:
	mtc1	$0,$f2
	nop
	c.lt.s	$f0,$f2
	nop
	bc1tl	$L30
	lhu	$3,2($4)

$L33:
	jr	$31
	nop

$L28:
	li	$2,1			# 0x1
	bnel	$3,$2,$L31
	lwc1	$f0,12($4)

	lwc1	$f2,48($4)
	mul.s	$f2,$f0,$f2
	lwc1	$f4,0($5)
	sub.s	$f2,$f4,$f2
	swc1	$f2,0($5)
	lwc1	$f2,52($4)
	mul.s	$f2,$f0,$f2
	lwc1	$f4,4($5)
	sub.s	$f2,$f4,$f2
	swc1	$f2,4($5)
	lwc1	$f2,56($4)
	mul.s	$f0,$f0,$f2
	lwc1	$f2,8($5)
	sub.s	$f0,$f2,$f0
	b	$L19
	swc1	$f0,8($5)

$L29:
	li	$2,1			# 0x1
	bnel	$3,$2,$L32
	lwc1	$f0,16($4)

	lwc1	$f2,24($4)
	mul.s	$f2,$f0,$f2
	lwc1	$f4,0($5)
	sub.s	$f2,$f4,$f2
	swc1	$f2,0($5)
	lwc1	$f2,28($4)
	mul.s	$f2,$f0,$f2
	lwc1	$f4,4($5)
	sub.s	$f2,$f4,$f2
	swc1	$f2,4($5)
	lwc1	$f2,32($4)
	mul.s	$f0,$f0,$f2
	lwc1	$f2,8($5)
	sub.s	$f0,$f2,$f0
	b	$L21
	swc1	$f0,8($5)

$L30:
	li	$2,1			# 0x1
	bne	$3,$2,$L33
	nop

	lwc1	$f2,36($4)
	mul.s	$f2,$f0,$f2
	lwc1	$f4,0($5)
	sub.s	$f2,$f4,$f2
	swc1	$f2,0($5)
	lwc1	$f2,40($4)
	mul.s	$f2,$f0,$f2
	lwc1	$f4,4($5)
	sub.s	$f2,$f4,$f2
	swc1	$f2,4($5)
	lwc1	$f2,44($4)
	mul.s	$f0,$f0,$f2
	lwc1	$f2,8($5)
	sub.s	$f0,$f2,$f0
	jr	$31
	swc1	$f0,8($5)

	.set	macro
	.set	reorder
	.end	ManualBump
	.size	ManualBump, .-ManualBump
	.align	2
	.globl	ManualBounce
	.set	nomips16
	.set	nomicromips
	.ent	ManualBounce
	.type	ManualBounce, @function
ManualBounce:
	.frame	$sp,64,$31		# vars= 0, regs= 3/8, args= 16, gp= 0
	.mask	0x80030000,-36
	.fmask	0x0ff00000,-8
	.set	noreorder
	.set	nomacro
	addiu	$sp,$sp,-64
	sw	$31,28($sp)
	sw	$17,24($sp)
	sw	$16,20($sp)
	sdc1	$f26,56($sp)
	sdc1	$f24,48($sp)
	sdc1	$f22,40($sp)
	sdc1	$f20,32($sp)
	move	$17,$4
	lwc1	$f26,0($5)
	lwc1	$f24,4($5)
	lwc1	$f20,8($5)
	mul.s	$f22,$f26,$f26
	mul.s	$f12,$f24,$f24
	add.s	$f22,$f22,$f12
	mul.s	$f12,$f20,$f20
	add.s	$f22,$f22,$f12
	mtc1	$0,$f0
	nop
	c.ule.s	$f0,$f22
	nop
	bc1f	$L43
	move	$16,$5

	sqrt.s	$f22,$f22
$L37:
	lwc1	$f8,0($17)
	lwc1	$f6,4($17)
	lwc1	$f12,8($17)
	mul.s	$f0,$f8,$f26
	mul.s	$f2,$f6,$f24
	add.s	$f0,$f0,$f2
	mul.s	$f2,$f12,$f20
	add.s	$f0,$f0,$f2
	mul.s	$f8,$f8,$f0
	sub.s	$f26,$f26,$f8
	mul.s	$f6,$f6,$f0
	sub.s	$f24,$f24,$f6
	mul.s	$f0,$f12,$f0
	sub.s	$f20,$f20,$f0
	sub.s	$f26,$f26,$f8
	sub.s	$f24,$f24,$f6
	sub.s	$f20,$f20,$f0
	mul.s	$f0,$f26,$f26
	mul.s	$f12,$f24,$f24
	add.s	$f0,$f0,$f12
	mul.s	$f12,$f20,$f20
	add.s	$f0,$f0,$f12
	mtc1	$0,$f2
	nop
	c.ule.s	$f2,$f0
	nop
	bc1f	$L44
	nop

	sqrt.s	$f0,$f0
	lui	$2,%hi($LC2)
$L46:
	lwc1	$f12,%lo($LC2)($2)
	div.s	$f0,$f12,$f0
	mul.s	$f22,$f0,$f22
	mul.s	$f26,$f26,$f22
	swc1	$f26,0($16)
	mul.s	$f24,$f24,$f22
	swc1	$f24,4($16)
	mul.s	$f22,$f20,$f22
	swc1	$f22,8($16)
	lw	$31,28($sp)
	lw	$17,24($sp)
	lw	$16,20($sp)
	ldc1	$f26,56($sp)
	ldc1	$f24,48($sp)
	ldc1	$f22,40($sp)
	ldc1	$f20,32($sp)
	jr	$31
	addiu	$sp,$sp,64

$L43:
	jal	sqrtf
	mov.s	$f12,$f22

	b	$L37
	mov.s	$f22,$f0

$L44:
	jal	sqrtf
	mov.s	$f12,$f0

	b	$L46
	lui	$2,%hi($LC2)

	.set	macro
	.set	reorder
	.end	ManualBounce
	.size	ManualBounce, .-ManualBounce
	.align	2
	.globl	UpdateObjectBump
	.set	nomips16
	.set	nomicromips
	.ent	UpdateObjectBump
	.type	UpdateObjectBump, @function
UpdateObjectBump:
	.frame	$sp,24,$31		# vars= 0, regs= 2/0, args= 16, gp= 0
	.mask	0x80010000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	addiu	$sp,$sp,-24
	sw	$31,20($sp)
	sw	$16,16($sp)
	jal	CheckBump2Simple
	move	$16,$4

	jal	BumpObject
	move	$4,$16

	lw	$31,20($sp)
	lw	$16,16($sp)
	jr	$31
	addiu	$sp,$sp,24

	.set	macro
	.set	reorder
	.end	UpdateObjectBump
	.size	UpdateObjectBump, .-UpdateObjectBump
	.align	2
	.globl	UpdateObjectFriction
	.set	nomips16
	.set	nomicromips
	.ent	UpdateObjectFriction
	.type	UpdateObjectFriction, @function
UpdateObjectFriction:
	.frame	$sp,0,$31		# vars= 0, regs= 0/0, args= 0, gp= 0
	.mask	0x00000000,0
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	mtc1	$5,$f0
	lwc1	$f2,36($4)
	sub.s	$f2,$f2,$f0
	swc1	$f2,36($4)
	lwc1	$f2,40($4)
	sub.s	$f2,$f2,$f0
	swc1	$f2,40($4)
	lwc1	$f2,44($4)
	sub.s	$f0,$f2,$f0
	jr	$31
	swc1	$f0,44($4)

	.set	macro
	.set	reorder
	.end	UpdateObjectFriction
	.size	UpdateObjectFriction, .-UpdateObjectFriction
	.align	2
	.globl	UpdateObjectFrictionScale
	.set	nomips16
	.set	nomicromips
	.ent	UpdateObjectFrictionScale
	.type	UpdateObjectFrictionScale, @function
UpdateObjectFrictionScale:
	.frame	$sp,0,$31		# vars= 0, regs= 0/0, args= 0, gp= 0
	.mask	0x00000000,0
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	lui	$2,%hi($LC3)
	lwc1	$f4,%lo($LC3)($2)
	mtc1	$5,$f0
	nop
	div.s	$f4,$f0,$f4
	cvt.d.s	$f4,$f4
	lui	$2,%hi($LC4)
	ldc1	$f0,%lo($LC4)($2)
	sub.d	$f4,$f0,$f4
	lwc1	$f2,36($4)
	cvt.d.s	$f2,$f2
	mul.d	$f2,$f2,$f4
	cvt.s.d	$f2,$f2
	swc1	$f2,36($4)
	lwc1	$f2,40($4)
	cvt.d.s	$f2,$f2
	mul.d	$f2,$f2,$f4
	cvt.s.d	$f2,$f2
	swc1	$f2,40($4)
	lwc1	$f0,44($4)
	cvt.d.s	$f0,$f0
	mul.d	$f0,$f0,$f4
	cvt.s.d	$f0,$f0
	jr	$31
	swc1	$f0,44($4)

	.set	macro
	.set	reorder
	.end	UpdateObjectFrictionScale
	.size	UpdateObjectFrictionScale, .-UpdateObjectFrictionScale
	.align	2
	.globl	CreateCustomItemBox
	.set	nomips16
	.set	nomicromips
	.ent	CreateCustomItemBox
	.type	CreateCustomItemBox, @function
CreateCustomItemBox:
	.frame	$sp,80,$31		# vars= 8, regs= 10/4, args= 16, gp= 0
	.mask	0xc0ff0000,-20
	.fmask	0x00f00000,-8
	.set	noreorder
	.set	nomacro
	addiu	$sp,$sp,-80
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
	sdc1	$f22,72($sp)
	jal	GetRealAddress
	sdc1	$f20,64($sp)

	move	$fp,$2
	lui	$2,%hi(GlobalAddressA)
	sw	$fp,%lo(GlobalAddressA)($2)
	lui	$2,%hi(objectVelocity)
	sw	$0,%lo(objectVelocity)($2)
	addiu	$2,$2,%lo(objectVelocity)
	sw	$0,4($2)
	sw	$0,8($2)
	addiu	$19,$fp,6
	move	$20,$fp
	move	$22,$0
	lui	$21,%hi(objectPosition)
	lui	$2,%hi(objectAngle)
	sw	$2,16($sp)
	lui	$2,%hi($LC5)
	lwc1	$f22,%lo($LC5)($2)
	lui	$23,%hi(g_SimpleObjectArray)
	addiu	$23,$23,%lo(g_SimpleObjectArray)
	lui	$2,%hi($LC6)
	b	$L55
	lwc1	$f20,%lo($LC6)($2)

$L59:
	sw	$22,4($2)
$L51:
	lw	$31,60($sp)
	lw	$fp,56($sp)
	lw	$23,52($sp)
	lw	$22,48($sp)
	lw	$21,44($sp)
	lw	$20,40($sp)
	lw	$19,36($sp)
	lw	$18,32($sp)
	lw	$17,28($sp)
	lw	$16,24($sp)
	ldc1	$f22,72($sp)
	ldc1	$f20,64($sp)
	jr	$31
	addiu	$sp,$sp,80

$L60:
	lui	$2,%hi(g_mirrorValue)
	lwc1	$f2,%lo(g_mirrorValue)($2)
	mul.s	$f0,$f0,$f2
	swc1	$f0,%lo(objectPosition)($21)
	li	$7,12			# 0xc
	lui	$6,%hi(objectVelocity)
	addiu	$6,$6,%lo(objectVelocity)
	lw	$2,16($sp)
	addiu	$5,$2,%lo(objectAngle)
	jal	addObjectBuffer
	addiu	$4,$21,%lo(objectPosition)

	lui	$17,%hi(GlobalIntA)
	sw	$2,%lo(GlobalIntA)($17)
	li	$3,-2140864512			# 0xffffffff80650000
	addiu	$3,$3,6
	subu	$3,$3,$fp
	addu	$3,$3,$19
	sw	$2,0($3)
	lw	$18,%lo(GlobalIntA)($17)
	addiu	$16,$21,%lo(objectPosition)
	lwc1	$f14,4($16)
	lw	$6,8($16)
	add.s	$f14,$f14,$f22
	jal	CheckHight
	lwc1	$f12,%lo(objectPosition)($21)

	sll	$2,$18,3
	subu	$18,$2,$18
	sll	$18,$18,4
	addu	$18,$18,$23
	swc1	$f0,8($18)
	lw	$4,%lo(GlobalIntA)($17)
	sll	$2,$4,3
	subu	$3,$2,$4
	sll	$3,$3,4
	addu	$3,$23,$3
	lwc1	$f0,4($16)
	swc1	$f0,36($3)
	lwc1	$f0,8($3)
	sub.s	$f0,$f0,$f20
	swc1	$f0,28($3)
	lw	$3,20($sp)
	lh	$3,6($3)
	subu	$2,$2,$4
	sll	$2,$2,4
	addu	$2,$23,$2
	sh	$3,2($2)
	addiu	$22,$22,1
	addiu	$20,$20,8
	li	$2,999			# 0x3e7
	beq	$22,$2,$L51
	addiu	$19,$19,8

$L55:
	sw	$20,20($sp)
	lh	$3,0($20)
	li	$2,-32768			# 0xffffffffffff8000
	beq	$3,$2,$L59
	li	$2,-2140864512			# 0xffffffff80650000

	addiu	$2,$2,2
	subu	$2,$2,$fp
	addu	$2,$2,$19
	sw	$20,0($2)
	addiu	$18,$21,%lo(objectPosition)
	lw	$2,16($sp)
	addiu	$17,$2,%lo(objectAngle)
	move	$16,$20
$L54:
	lh	$2,0($16)
	mtc1	$2,$f0
	nop
	cvt.s.w	$f0,$f0
	jal	MakeRandom
	swc1	$f0,0($18)

	sh	$2,0($17)
	addiu	$16,$16,2
	addiu	$18,$18,4
	bne	$16,$19,$L54
	addiu	$17,$17,2

	b	$L60
	lwc1	$f0,%lo(objectPosition)($21)

	.set	macro
	.set	reorder
	.end	CreateCustomItemBox
	.size	CreateCustomItemBox, .-CreateCustomItemBox
	.align	2
	.globl	PakkunStrategyOverride
	.set	nomips16
	.set	nomicromips
	.ent	PakkunStrategyOverride
	.type	PakkunStrategyOverride, @function
PakkunStrategyOverride:
	.frame	$sp,0,$31		# vars= 0, regs= 0/0, args= 0, gp= 0
	.mask	0x00000000,0
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	lh	$2,2($4)
	andi	$5,$2,0x800
	bne	$5,$0,$L69
	andi	$3,$2,0xffff

	andi	$3,$3,0x400
	beql	$3,$0,$L68
	lhu	$2,36($4)

	lwc1	$f2,28($4)
	lui	$3,%hi($LC7)
	lwc1	$f0,%lo($LC7)($3)
	add.s	$f0,$f2,$f0
	lui	$3,%hi($LC8)
	lwc1	$f2,%lo($LC8)($3)
	c.lt.s	$f2,$f0
	nop
	bc1t	$L67
	swc1	$f0,28($4)

	lhu	$2,36($4)
$L68:
	addiu	$2,$2,1
	sll	$2,$2,16
	sra	$2,$2,16
	slt	$3,$2,61
	beql	$3,$0,$L69
	sh	$0,36($4)

	jr	$31
	sh	$2,36($4)

$L67:
	ori	$2,$2,0x800
	jr	$31
	sh	$2,2($4)

$L69:
	jr	$31
	nop

	.set	macro
	.set	reorder
	.end	PakkunStrategyOverride
	.size	PakkunStrategyOverride, .-PakkunStrategyOverride
	.section	.rodata.cst4,"aM",@progbits,4
	.align	2
$LC0:
	.word	1084227584
	.align	2
$LC1:
	.word	1056964608
	.align	2
$LC2:
	.word	1065353216
	.align	2
$LC3:
	.word	1106247680
	.section	.rodata.cst8,"aM",@progbits,8
	.align	3
$LC4:
	.word	1072693248
	.word	0
	.section	.rodata.cst4
	.align	2
$LC5:
	.word	1092616192
	.align	2
$LC6:
	.word	1101004800
	.align	2
$LC7:
	.word	1082130432
	.align	2
$LC8:
	.word	1145569280
	.ident	"GCC: (GNU) 10.1.0"
