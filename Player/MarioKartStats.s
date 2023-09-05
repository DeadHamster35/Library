	.file	1 "MarioKartStats.c"
	.section .mdebug.abi32
	.previous
	.nan	legacy
	.module	fp=32
	.module	nooddspreg
	.text
	.align	2
	.globl	SetEngine
	.set	nomips16
	.set	nomicromips
	.ent	SetEngine
	.type	SetEngine, @function
SetEngine:
	.frame	$sp,0,$31		# vars= 0, regs= 0/0, args= 0, gp= 0
	.mask	0x00000000,0
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	addiu	$3,$4,134
	lui	$6,%hi(GlobalStat)
	addiu	$6,$6,%lo(GlobalStat)
	sll	$3,$3,2
	addu	$3,$6,$3
	sll	$7,$5,1
	lui	$2,%hi(EngineSpeed)
	addiu	$2,$2,%lo(EngineSpeed)
	addu	$7,$7,$2
	lh	$7,0($7)
	mtc1	$7,$f0
	nop
	cvt.s.w	$f0,$f0
	swc1	$f0,4($3)
	addiu	$3,$5,3
	sll	$3,$3,1
	addu	$3,$3,$2
	lh	$3,0($3)
	mtc1	$3,$f0
	nop
	cvt.s.w	$f0,$f0
	addiu	$3,$4,142
	sll	$3,$3,2
	addu	$3,$6,$3
	swc1	$f0,4($3)
	addiu	$3,$4,150
	sll	$3,$3,2
	addu	$3,$6,$3
	addiu	$7,$5,6
	sll	$7,$7,1
	addu	$7,$7,$2
	lh	$7,0($7)
	mtc1	$7,$f2
	nop
	cvt.s.w	$f2,$f2
	swc1	$f2,4($3)
	addiu	$3,$4,158
	sll	$3,$3,2
	addu	$3,$6,$3
	swc1	$f0,4($3)
	addiu	$3,$4,166
	sll	$3,$3,2
	addu	$3,$6,$3
	addiu	$7,$5,9
	sll	$7,$7,1
	addu	$2,$7,$2
	lh	$2,0($2)
	mtc1	$2,$f0
	nop
	cvt.s.w	$f0,$f0
	swc1	$f0,4($3)
	sll	$7,$5,2
	addu	$7,$7,$5
	sll	$7,$7,2
	lui	$2,%hi(AccelerationCurve)
	addiu	$2,$2,%lo(AccelerationCurve)
	addu	$3,$2,$7
	sll	$8,$4,2
	addu	$8,$8,$4
	sll	$8,$8,3
	addiu	$8,$8,2928
	addu	$6,$6,$8
	addiu	$2,$2,20
	addu	$7,$2,$7
	lui	$2,%hi($LC0)
	lwc1	$f2,%lo($LC0)($2)
$L2:
	lh	$2,0($3)
	mtc1	$2,$f0
	nop
	cvt.s.w	$f0,$f0
	div.s	$f0,$f0,$f2
	swc1	$f0,0($6)
	addiu	$3,$3,2
	bne	$3,$7,$L2
	addiu	$6,$6,4

	sll	$8,$5,4
	subu	$8,$8,$5
	sll	$8,$8,1
	lui	$2,%hi(EnginePowerDownFT)
	addiu	$2,$2,%lo(EnginePowerDownFT)
	addu	$6,$2,$8
	lui	$7,%hi(EnginePowerDownRT)
	addiu	$7,$7,%lo(EnginePowerDownRT)
	addu	$7,$7,$8
	sll	$3,$4,4
	subu	$3,$3,$4
	sll	$3,$3,2
	addiu	$9,$3,2384
	lui	$3,%hi(GlobalStat)
	addiu	$3,$3,%lo(GlobalStat)
	addu	$3,$3,$9
	addiu	$2,$2,30
	addu	$8,$2,$8
	lui	$2,%hi($LC1)
	lwc1	$f2,%lo($LC1)($2)
$L3:
	lh	$2,0($6)
	mtc1	$2,$f0
	nop
	cvt.s.w	$f0,$f0
	div.s	$f0,$f0,$f2
	swc1	$f0,-480($3)
	lh	$2,0($7)
	mtc1	$2,$f0
	nop
	cvt.s.w	$f0,$f0
	div.s	$f0,$f0,$f2
	swc1	$f0,0($3)
	addiu	$6,$6,2
	addiu	$7,$7,2
	bne	$6,$8,$L3
	addiu	$3,$3,4

	addiu	$2,$4,1236
	sll	$2,$2,2
	lui	$3,%hi(GlobalStat)
	addiu	$3,$3,%lo(GlobalStat)
	addu	$2,$2,$3
	sll	$5,$5,1
	lui	$3,%hi(PowerBand)
	addiu	$3,$3,%lo(PowerBand)
	addu	$5,$5,$3
	lh	$3,0($5)
	mtc1	$3,$f0
	nop
	cvt.s.w	$f0,$f0
	lui	$3,%hi($LC0)
	lwc1	$f2,%lo($LC0)($3)
	div.s	$f0,$f0,$f2
	jr	$31
	swc1	$f0,0($2)

	.set	macro
	.set	reorder
	.end	SetEngine
	.size	SetEngine, .-SetEngine
	.align	2
	.globl	SetSteering
	.set	nomips16
	.set	nomicromips
	.ent	SetSteering
	.type	SetSteering, @function
SetSteering:
	.frame	$sp,0,$31		# vars= 0, regs= 0/0, args= 0, gp= 0
	.mask	0x00000000,0
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	addiu	$2,$4,1204
	sll	$2,$2,2
	lui	$3,%hi(GlobalStat)
	addiu	$3,$3,%lo(GlobalStat)
	addu	$2,$2,$3
	sll	$5,$5,1
	lui	$6,%hi(SteerAngle)
	addiu	$6,$6,%lo(SteerAngle)
	addu	$6,$5,$6
	lh	$6,0($6)
	mtc1	$6,$f0
	nop
	cvt.s.w	$f0,$f0
	lui	$6,%hi($LC1)
	lwc1	$f2,%lo($LC1)($6)
	div.s	$f0,$f0,$f2
	swc1	$f0,0($2)
	lui	$2,%hi(SteerValue)
	addiu	$2,$2,%lo(SteerValue)
	addu	$5,$5,$2
	lh	$2,0($5)
	mtc1	$2,$f0
	nop
	cvt.s.w	$f0,$f0
	lui	$2,%hi($LC2)
	lwc1	$f2,%lo($LC2)($2)
	div.s	$f0,$f0,$f2
	addiu	$2,$4,1220
	sll	$2,$2,2
	addu	$2,$2,$3
	swc1	$f0,0($2)
	addiu	$4,$4,1228
	sll	$4,$4,2
	addu	$4,$4,$3
	jr	$31
	swc1	$f0,0($4)

	.set	macro
	.set	reorder
	.end	SetSteering
	.size	SetSteering, .-SetSteering
	.align	2
	.globl	dmaLoop
	.set	nomips16
	.set	nomicromips
	.ent	dmaLoop
	.type	dmaLoop, @function
dmaLoop:
	.frame	$sp,40,$31		# vars= 0, regs= 5/0, args= 16, gp= 0
	.mask	0x800f0000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	blez	$4,$L15
	nop

	addiu	$sp,$sp,-40
	sw	$31,36($sp)
	sw	$19,32($sp)
	sw	$18,28($sp)
	sw	$17,24($sp)
	sw	$16,20($sp)
	move	$17,$4
	move	$16,$0
	lui	$19,%hi(targetAddress)
	lui	$18,%hi(dataLength)
$L9:
	jal	runDMA
	addiu	$16,$16,1

	lw	$3,%lo(targetAddress)($19)
	lw	$2,0($3)
	lw	$5,%lo(dataLength)($18)
	addu	$2,$2,$5
	bne	$17,$16,$L9
	sw	$2,0($3)

	lw	$31,36($sp)
	lw	$19,32($sp)
	lw	$18,28($sp)
	lw	$17,24($sp)
	lw	$16,20($sp)
	jr	$31
	addiu	$sp,$sp,40

$L15:
	jr	$31
	nop

	.set	macro
	.set	reorder
	.end	dmaLoop
	.size	dmaLoop, .-dmaLoop
	.align	2
	.globl	RAMLoop
	.set	nomips16
	.set	nomicromips
	.ent	RAMLoop
	.type	RAMLoop, @function
RAMLoop:
	.frame	$sp,40,$31		# vars= 0, regs= 5/0, args= 16, gp= 0
	.mask	0x800f0000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	blez	$4,$L24
	nop

	addiu	$sp,$sp,-40
	sw	$31,36($sp)
	sw	$19,32($sp)
	sw	$18,28($sp)
	sw	$17,24($sp)
	sw	$16,20($sp)
	move	$17,$4
	move	$16,$0
	lui	$19,%hi(targetAddress)
	lui	$18,%hi(dataLength)
$L18:
	jal	runRAM
	addiu	$16,$16,1

	lw	$3,%lo(targetAddress)($19)
	lw	$2,0($3)
	lw	$5,%lo(dataLength)($18)
	addu	$2,$2,$5
	bne	$17,$16,$L18
	sw	$2,0($3)

	lw	$31,36($sp)
	lw	$19,32($sp)
	lw	$18,28($sp)
	lw	$17,24($sp)
	lw	$16,20($sp)
	jr	$31
	addiu	$sp,$sp,40

$L24:
	jr	$31
	nop

	.set	macro
	.set	reorder
	.end	RAMLoop
	.size	RAMLoop, .-RAMLoop
	.align	2
	.globl	Unknown33Func
	.set	nomips16
	.set	nomicromips
	.ent	Unknown33Func
	.type	Unknown33Func, @function
Unknown33Func:
	.frame	$sp,24,$31		# vars= 0, regs= 1/0, args= 16, gp= 0
	.mask	0x80000000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	addiu	$sp,$sp,-24
	beq	$4,$0,$L26
	sw	$31,20($sp)

	li	$2,1			# 0x1
	beq	$4,$2,$L27
	lui	$2,%hi(sourceAddress)

	lw	$31,20($sp)
$L30:
	jr	$31
	addiu	$sp,$sp,24

$L26:
	lui	$2,%hi(sourceAddress)
	lw	$3,%lo(sourceAddress)($2)
	li	$2,917504			# 0xe0000
	addiu	$2,$2,14032
	sw	$2,0($3)
	lui	$2,%hi(targetAddress)
	lw	$3,%lo(targetAddress)($2)
	li	$2,-2146566144			# 0xffffffff800e0000
	addiu	$2,$2,10960
	sw	$2,0($3)
	lui	$2,%hi(dataLength)
	li	$3,480			# 0x1e0
	jal	runDMA
	sw	$3,%lo(dataLength)($2)

	b	$L30
	lw	$31,20($sp)

$L27:
	lw	$3,%lo(sourceAddress)($2)
	lui	$2,%hi(Unknown33+120)
	addiu	$2,$2,%lo(Unknown33+120)
	sw	$2,0($3)
	lui	$2,%hi(dataLength)
	li	$3,60			# 0x3c
	sw	$3,%lo(dataLength)($2)
	lui	$2,%hi(targetAddress)
	lw	$3,%lo(targetAddress)($2)
	li	$2,-2146566144			# 0xffffffff800e0000
	addiu	$2,$2,10960
	sw	$2,0($3)
	jal	RAMLoop
	li	$4,8			# 0x8

	b	$L30
	lw	$31,20($sp)

	.set	macro
	.set	reorder
	.end	Unknown33Func
	.size	Unknown33Func, .-Unknown33Func
	.align	2
	.globl	Unknown41Func
	.set	nomips16
	.set	nomicromips
	.ent	Unknown41Func
	.type	Unknown41Func, @function
Unknown41Func:
	.frame	$sp,24,$31		# vars= 0, regs= 1/0, args= 16, gp= 0
	.mask	0x80000000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	addiu	$sp,$sp,-24
	beq	$4,$0,$L32
	sw	$31,20($sp)

	li	$2,1			# 0x1
	beq	$4,$2,$L33
	lui	$2,%hi(sourceAddress)

	lw	$31,20($sp)
$L36:
	jr	$31
	addiu	$sp,$sp,24

$L32:
	lui	$2,%hi(sourceAddress)
	lw	$3,%lo(sourceAddress)($2)
	li	$2,917504			# 0xe0000
	addiu	$2,$2,14512
	sw	$2,0($3)
	lui	$2,%hi(targetAddress)
	lw	$3,%lo(targetAddress)($2)
	li	$2,-2146566144			# 0xffffffff800e0000
	addiu	$2,$2,11440
	sw	$2,0($3)
	lui	$2,%hi(dataLength)
	li	$3,480			# 0x1e0
	jal	runDMA
	sw	$3,%lo(dataLength)($2)

	b	$L36
	lw	$31,20($sp)

$L33:
	lw	$3,%lo(sourceAddress)($2)
	lui	$2,%hi(Unknown41+120)
	addiu	$2,$2,%lo(Unknown41+120)
	sw	$2,0($3)
	lui	$2,%hi(targetAddress)
	lw	$3,%lo(targetAddress)($2)
	li	$2,-2146566144			# 0xffffffff800e0000
	addiu	$2,$2,11440
	sw	$2,0($3)
	lui	$2,%hi(dataLength)
	li	$3,60			# 0x3c
	sw	$3,%lo(dataLength)($2)
	jal	RAMLoop
	li	$4,8			# 0x8

	b	$L36
	lw	$31,20($sp)

	.set	macro
	.set	reorder
	.end	Unknown41Func
	.size	Unknown41Func, .-Unknown41Func
	.align	2
	.globl	AccelerationFunc
	.set	nomips16
	.set	nomicromips
	.ent	AccelerationFunc
	.type	AccelerationFunc, @function
AccelerationFunc:
	.frame	$sp,24,$31		# vars= 0, regs= 1/0, args= 16, gp= 0
	.mask	0x80000000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	addiu	$sp,$sp,-24
	beq	$4,$0,$L38
	sw	$31,20($sp)

	li	$2,1			# 0x1
	beq	$4,$2,$L39
	lui	$2,%hi(sourceAddress)

	lw	$31,20($sp)
$L42:
	jr	$31
	addiu	$sp,$sp,24

$L38:
	lui	$2,%hi(sourceAddress)
	lw	$3,%lo(sourceAddress)($2)
	li	$2,917504			# 0xe0000
	addiu	$2,$2,15056
	sw	$2,0($3)
	lui	$2,%hi(targetAddress)
	lw	$3,%lo(targetAddress)($2)
	li	$2,-2146566144			# 0xffffffff800e0000
	addiu	$2,$2,11984
	sw	$2,0($3)
	lui	$2,%hi(dataLength)
	li	$3,320			# 0x140
	jal	runDMA
	sw	$3,%lo(dataLength)($2)

	b	$L42
	lw	$31,20($sp)

$L39:
	lw	$3,%lo(sourceAddress)($2)
	lui	$2,%hi(AccelerationTable+80)
	addiu	$2,$2,%lo(AccelerationTable+80)
	sw	$2,0($3)
	lui	$2,%hi(dataLength)
	li	$3,40			# 0x28
	sw	$3,%lo(dataLength)($2)
	lui	$2,%hi(targetAddress)
	lw	$3,%lo(targetAddress)($2)
	li	$2,-2146566144			# 0xffffffff800e0000
	addiu	$2,$2,11984
	sw	$2,0($3)
	jal	RAMLoop
	li	$4,8			# 0x8

	b	$L42
	lw	$31,20($sp)

	.set	macro
	.set	reorder
	.end	AccelerationFunc
	.size	AccelerationFunc, .-AccelerationFunc
	.align	2
	.globl	equalStats
	.set	nomips16
	.set	nomicromips
	.ent	equalStats
	.type	equalStats, @function
equalStats:
	.frame	$sp,24,$31		# vars= 0, regs= 2/0, args= 16, gp= 0
	.mask	0x80010000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	addiu	$sp,$sp,-24
	sw	$31,20($sp)
	sw	$16,16($sp)
	beq	$4,$0,$L44
	move	$16,$4

	li	$2,1			# 0x1
	beq	$4,$2,$L45
	lui	$2,%hi($LC4)

$L46:
	jal	AccelerationFunc
	move	$4,$16

	jal	Unknown33Func
	move	$4,$16

	jal	Unknown41Func
	move	$4,$16

	lw	$31,20($sp)
	lw	$16,16($sp)
	jr	$31
	addiu	$sp,$sp,24

$L44:
	lui	$2,%hi($LC3)
	lwc1	$f0,%lo($LC3)($2)
	lui	$2,%hi(u11_Mario)
	swc1	$f0,%lo(u11_Mario)($2)
	lui	$2,%hi(u11_Luigi)
	swc1	$f0,%lo(u11_Luigi)($2)
	lui	$2,%hi($LC4)
	lwc1	$f2,%lo($LC4)($2)
	lui	$2,%hi(u11_Yoshi)
	swc1	$f2,%lo(u11_Yoshi)($2)
	lui	$2,%hi(u11_Toad)
	swc1	$f2,%lo(u11_Toad)($2)
	lui	$2,%hi(u11_DK)
	swc1	$f0,%lo(u11_DK)($2)
	lui	$2,%hi(u11_Wario)
	swc1	$f0,%lo(u11_Wario)($2)
	lui	$2,%hi(u11_Peach)
	swc1	$f2,%lo(u11_Peach)($2)
	lui	$2,%hi(u11_Bowser)
	swc1	$f0,%lo(u11_Bowser)($2)
	lui	$2,%hi($LC5)
	lwc1	$f0,%lo($LC5)($2)
	lui	$2,%hi(u12_Mario)
	swc1	$f0,%lo(u12_Mario)($2)
	lui	$2,%hi(u12_Luigi)
	swc1	$f0,%lo(u12_Luigi)($2)
	lui	$2,%hi($LC6)
	lwc1	$f2,%lo($LC6)($2)
	lui	$2,%hi(u12_Yoshi)
	swc1	$f2,%lo(u12_Yoshi)($2)
	lui	$2,%hi(u12_Toad)
	swc1	$f2,%lo(u12_Toad)($2)
	lui	$2,%hi(u12_DK)
	swc1	$f0,%lo(u12_DK)($2)
	lui	$2,%hi(u12_Wario)
	swc1	$f0,%lo(u12_Wario)($2)
	lui	$2,%hi(u12_Peach)
	swc1	$f2,%lo(u12_Peach)($2)
	lui	$2,%hi(u12_Bowser)
	swc1	$f0,%lo(u12_Bowser)($2)
	lui	$2,%hi($LC7)
	lwc1	$f4,%lo($LC7)($2)
	lui	$2,%hi(u13_Mario)
	swc1	$f4,%lo(u13_Mario)($2)
	lui	$2,%hi(u13_Luigi)
	swc1	$f4,%lo(u13_Luigi)($2)
	lui	$2,%hi($LC8)
	lwc1	$f6,%lo($LC8)($2)
	lui	$2,%hi(u13_Yoshi)
	swc1	$f6,%lo(u13_Yoshi)($2)
	lui	$2,%hi(u13_Toad)
	swc1	$f6,%lo(u13_Toad)($2)
	lui	$2,%hi(u13_DK)
	swc1	$f4,%lo(u13_DK)($2)
	lui	$2,%hi(u13_Wario)
	swc1	$f4,%lo(u13_Wario)($2)
	lui	$2,%hi(u13_Peach)
	swc1	$f6,%lo(u13_Peach)($2)
	lui	$2,%hi(u13_Bowser)
	swc1	$f4,%lo(u13_Bowser)($2)
	lui	$2,%hi(u14_Mario)
	swc1	$f0,%lo(u14_Mario)($2)
	lui	$2,%hi(u14_Luigi)
	swc1	$f0,%lo(u14_Luigi)($2)
	lui	$2,%hi(u14_Yoshi)
	swc1	$f2,%lo(u14_Yoshi)($2)
	lui	$2,%hi(u14_Toad)
	swc1	$f2,%lo(u14_Toad)($2)
	lui	$2,%hi(u14_DK)
	swc1	$f0,%lo(u14_DK)($2)
	lui	$2,%hi(u14_Wario)
	swc1	$f0,%lo(u14_Wario)($2)
	lui	$2,%hi(u14_Peach)
	swc1	$f2,%lo(u14_Peach)($2)
	lui	$2,%hi(u14_Bowser)
	swc1	$f0,%lo(u14_Bowser)($2)
	lui	$2,%hi($LC9)
	lwc1	$f0,%lo($LC9)($2)
	lui	$2,%hi(cc50_Mario)
	swc1	$f0,%lo(cc50_Mario)($2)
	lui	$2,%hi(cc50_Luigi)
	swc1	$f0,%lo(cc50_Luigi)($2)
	lui	$2,%hi($LC10)
	lwc1	$f2,%lo($LC10)($2)
	lui	$2,%hi(cc50_Yoshi)
	swc1	$f2,%lo(cc50_Yoshi)($2)
	lui	$2,%hi(cc50_Toad)
	swc1	$f2,%lo(cc50_Toad)($2)
	lui	$2,%hi(cc50_DK)
	swc1	$f0,%lo(cc50_DK)($2)
	lui	$2,%hi(cc50_Wario)
	swc1	$f0,%lo(cc50_Wario)($2)
	lui	$2,%hi(cc50_Peach)
	swc1	$f2,%lo(cc50_Peach)($2)
	lui	$2,%hi(cc50_Bowser)
	swc1	$f0,%lo(cc50_Bowser)($2)
	lui	$2,%hi($LC11)
	lwc1	$f0,%lo($LC11)($2)
	lui	$2,%hi(cc100_Mario)
	swc1	$f0,%lo(cc100_Mario)($2)
	lui	$2,%hi(cc100_Luigi)
	swc1	$f0,%lo(cc100_Luigi)($2)
	lui	$2,%hi($LC12)
	lwc1	$f2,%lo($LC12)($2)
	lui	$2,%hi(cc100_Yoshi)
	swc1	$f2,%lo(cc100_Yoshi)($2)
	lui	$2,%hi(cc100_Toad)
	swc1	$f2,%lo(cc100_Toad)($2)
	lui	$2,%hi(cc100_DK)
	swc1	$f0,%lo(cc100_DK)($2)
	lui	$2,%hi(cc100_Wario)
	swc1	$f0,%lo(cc100_Wario)($2)
	lui	$2,%hi(cc100_Peach)
	swc1	$f2,%lo(cc100_Peach)($2)
	lui	$2,%hi(cc100_Bowser)
	swc1	$f0,%lo(cc100_Bowser)($2)
	lui	$2,%hi($LC13)
	lwc1	$f4,%lo($LC13)($2)
	lui	$2,%hi(cc150_Mario)
	swc1	$f4,%lo(cc150_Mario)($2)
	lui	$2,%hi(cc150_Luigi)
	swc1	$f4,%lo(cc150_Luigi)($2)
	lui	$2,%hi($LC14)
	lwc1	$f6,%lo($LC14)($2)
	lui	$2,%hi(cc150_Yoshi)
	swc1	$f6,%lo(cc150_Yoshi)($2)
	lui	$2,%hi(cc150_Toad)
	swc1	$f6,%lo(cc150_Toad)($2)
	lui	$2,%hi(cc150_DK)
	swc1	$f4,%lo(cc150_DK)($2)
	lui	$2,%hi(cc150_Wario)
	swc1	$f4,%lo(cc150_Wario)($2)
	lui	$2,%hi(cc150_Peach)
	swc1	$f6,%lo(cc150_Peach)($2)
	lui	$2,%hi(cc150_Bowser)
	swc1	$f4,%lo(cc150_Bowser)($2)
	lui	$2,%hi(ccextra_Mario)
	swc1	$f0,%lo(ccextra_Mario)($2)
	lui	$2,%hi(ccextra_Luigi)
	swc1	$f0,%lo(ccextra_Luigi)($2)
	lui	$2,%hi(ccextra_Yoshi)
	swc1	$f2,%lo(ccextra_Yoshi)($2)
	lui	$2,%hi(ccextra_Toad)
	swc1	$f2,%lo(ccextra_Toad)($2)
	lui	$2,%hi(ccextra_DK)
	swc1	$f0,%lo(ccextra_DK)($2)
	lui	$2,%hi(ccextra_Wario)
	swc1	$f0,%lo(ccextra_Wario)($2)
	lui	$2,%hi(ccextra_Peach)
	swc1	$f2,%lo(ccextra_Peach)($2)
	lui	$2,%hi(ccextra_Bowser)
	swc1	$f0,%lo(ccextra_Bowser)($2)
	lui	$2,%hi(turncoA_Mario)
	sw	$0,%lo(turncoA_Mario)($2)
	lui	$2,%hi(turncoA_Luigi)
	sw	$0,%lo(turncoA_Luigi)($2)
	lui	$2,%hi($LC15)
	lwc1	$f2,%lo($LC15)($2)
	lui	$2,%hi(turncoA_Yoshi)
	swc1	$f2,%lo(turncoA_Yoshi)($2)
	lui	$2,%hi(turncoA_Toad)
	swc1	$f2,%lo(turncoA_Toad)($2)
	lui	$2,%hi($LC16)
	lwc1	$f0,%lo($LC16)($2)
	lui	$2,%hi(turncoA_DK)
	swc1	$f0,%lo(turncoA_DK)($2)
	lui	$2,%hi(turncoA_Wario)
	swc1	$f0,%lo(turncoA_Wario)($2)
	lui	$2,%hi(turncoA_Peach)
	swc1	$f2,%lo(turncoA_Peach)($2)
	lui	$2,%hi(turncoA_Bowser)
	swc1	$f0,%lo(turncoA_Bowser)($2)
	lui	$2,%hi(turncoB_Mario)
	sw	$0,%lo(turncoB_Mario)($2)
	lui	$2,%hi(turncoB_Luigi)
	sw	$0,%lo(turncoB_Luigi)($2)
	lui	$2,%hi(turncoB_Yoshi)
	swc1	$f2,%lo(turncoB_Yoshi)($2)
	lui	$2,%hi(turncoB_Toad)
	swc1	$f2,%lo(turncoB_Toad)($2)
	lui	$2,%hi(turncoB_DK)
	swc1	$f0,%lo(turncoB_DK)($2)
	lui	$2,%hi(turncoB_Wario)
	swc1	$f0,%lo(turncoB_Wario)($2)
	lui	$2,%hi(turncoB_Peach)
	swc1	$f2,%lo(turncoB_Peach)($2)
	lui	$2,%hi(turncoB_Bowser)
	swc1	$f0,%lo(turncoB_Bowser)($2)
	lui	$2,%hi($LC17)
	lwc1	$f0,%lo($LC17)($2)
	lui	$2,%hi(tripleTap_Mario)
	swc1	$f0,%lo(tripleTap_Mario)($2)
	lui	$2,%hi(tripleTap_Luigi)
	swc1	$f0,%lo(tripleTap_Luigi)($2)
	lui	$2,%hi($LC18)
	lwc1	$f0,%lo($LC18)($2)
	lui	$2,%hi(tripleTap_Yoshi)
	swc1	$f0,%lo(tripleTap_Yoshi)($2)
	lui	$2,%hi(tripleTap_Toad)
	swc1	$f0,%lo(tripleTap_Toad)($2)
	lui	$2,%hi($LC19)
	lwc1	$f2,%lo($LC19)($2)
	lui	$2,%hi(tripleTap_DK)
	swc1	$f2,%lo(tripleTap_DK)($2)
	lui	$2,%hi(tripleTap_Wario)
	swc1	$f2,%lo(tripleTap_Wario)($2)
	lui	$2,%hi(tripleTap_Peach)
	swc1	$f0,%lo(tripleTap_Peach)($2)
	lui	$2,%hi(tripleTap_Bowser)
	swc1	$f0,%lo(tripleTap_Bowser)($2)
	lui	$2,%hi($LC20)
	lwc1	$f0,%lo($LC20)($2)
	lui	$2,%hi(turncontr_Mario)
	swc1	$f0,%lo(turncontr_Mario)($2)
	lui	$2,%hi(turncontr_Luigi)
	swc1	$f0,%lo(turncontr_Luigi)($2)
	lui	$2,%hi($LC21)
	lwc1	$f2,%lo($LC21)($2)
	lui	$2,%hi(turncontr_Yoshi)
	swc1	$f2,%lo(turncontr_Yoshi)($2)
	lui	$2,%hi(turncontr_Toad)
	swc1	$f2,%lo(turncontr_Toad)($2)
	lui	$2,%hi($LC22)
	lwc1	$f0,%lo($LC22)($2)
	lui	$2,%hi(turncontr_DK)
	swc1	$f0,%lo(turncontr_DK)($2)
	lui	$2,%hi(turncontr_Wario)
	swc1	$f0,%lo(turncontr_Wario)($2)
	lui	$2,%hi(turncontr_Peach)
	swc1	$f2,%lo(turncontr_Peach)($2)
	lui	$2,%hi(turncontr_Bowser)
	b	$L46
	swc1	$f0,%lo(turncontr_Bowser)($2)

$L45:
	lwc1	$f0,%lo($LC4)($2)
	lui	$2,%hi(u11_Mario)
	swc1	$f0,%lo(u11_Mario)($2)
	lui	$2,%hi(u11_Luigi)
	swc1	$f0,%lo(u11_Luigi)($2)
	lui	$2,%hi(u11_Yoshi)
	swc1	$f0,%lo(u11_Yoshi)($2)
	lui	$2,%hi(u11_Toad)
	swc1	$f0,%lo(u11_Toad)($2)
	lui	$2,%hi(u11_DK)
	swc1	$f0,%lo(u11_DK)($2)
	lui	$2,%hi(u11_Wario)
	swc1	$f0,%lo(u11_Wario)($2)
	lui	$2,%hi(u11_Peach)
	swc1	$f0,%lo(u11_Peach)($2)
	lui	$2,%hi(u11_Bowser)
	swc1	$f0,%lo(u11_Bowser)($2)
	lui	$2,%hi($LC6)
	lwc1	$f0,%lo($LC6)($2)
	lui	$2,%hi(u12_Mario)
	swc1	$f0,%lo(u12_Mario)($2)
	lui	$2,%hi(u12_Luigi)
	swc1	$f0,%lo(u12_Luigi)($2)
	lui	$2,%hi(u12_Yoshi)
	swc1	$f0,%lo(u12_Yoshi)($2)
	lui	$2,%hi(u12_Toad)
	swc1	$f0,%lo(u12_Toad)($2)
	lui	$2,%hi(u12_DK)
	swc1	$f0,%lo(u12_DK)($2)
	lui	$2,%hi(u12_Wario)
	swc1	$f0,%lo(u12_Wario)($2)
	lui	$2,%hi(u12_Peach)
	swc1	$f0,%lo(u12_Peach)($2)
	lui	$2,%hi(u12_Bowser)
	swc1	$f0,%lo(u12_Bowser)($2)
	lui	$2,%hi($LC8)
	lwc1	$f2,%lo($LC8)($2)
	lui	$2,%hi(u13_Mario)
	swc1	$f2,%lo(u13_Mario)($2)
	lui	$2,%hi(u13_Luigi)
	swc1	$f2,%lo(u13_Luigi)($2)
	lui	$2,%hi(u13_Yoshi)
	swc1	$f2,%lo(u13_Yoshi)($2)
	lui	$2,%hi(u13_Toad)
	swc1	$f2,%lo(u13_Toad)($2)
	lui	$2,%hi(u13_DK)
	swc1	$f2,%lo(u13_DK)($2)
	lui	$2,%hi(u13_Wario)
	swc1	$f2,%lo(u13_Wario)($2)
	lui	$2,%hi(u13_Peach)
	swc1	$f2,%lo(u13_Peach)($2)
	lui	$2,%hi(u13_Bowser)
	swc1	$f2,%lo(u13_Bowser)($2)
	lui	$2,%hi(u14_Mario)
	swc1	$f0,%lo(u14_Mario)($2)
	lui	$2,%hi(u14_Luigi)
	swc1	$f0,%lo(u14_Luigi)($2)
	lui	$2,%hi(u14_Yoshi)
	swc1	$f0,%lo(u14_Yoshi)($2)
	lui	$2,%hi(u14_Toad)
	swc1	$f0,%lo(u14_Toad)($2)
	lui	$2,%hi(u14_DK)
	swc1	$f0,%lo(u14_DK)($2)
	lui	$2,%hi(u14_Wario)
	swc1	$f0,%lo(u14_Wario)($2)
	lui	$2,%hi(u14_Peach)
	swc1	$f0,%lo(u14_Peach)($2)
	lui	$2,%hi(u14_Bowser)
	swc1	$f0,%lo(u14_Bowser)($2)
	lui	$2,%hi($LC10)
	lwc1	$f0,%lo($LC10)($2)
	lui	$2,%hi(cc50_Mario)
	swc1	$f0,%lo(cc50_Mario)($2)
	lui	$2,%hi(cc50_Luigi)
	swc1	$f0,%lo(cc50_Luigi)($2)
	lui	$2,%hi(cc50_Yoshi)
	swc1	$f0,%lo(cc50_Yoshi)($2)
	lui	$2,%hi(cc50_Toad)
	swc1	$f0,%lo(cc50_Toad)($2)
	lui	$2,%hi(cc50_DK)
	swc1	$f0,%lo(cc50_DK)($2)
	lui	$2,%hi(cc50_Wario)
	swc1	$f0,%lo(cc50_Wario)($2)
	lui	$2,%hi(cc50_Peach)
	swc1	$f0,%lo(cc50_Peach)($2)
	lui	$2,%hi(cc50_Bowser)
	swc1	$f0,%lo(cc50_Bowser)($2)
	lui	$2,%hi($LC12)
	lwc1	$f0,%lo($LC12)($2)
	lui	$2,%hi(cc100_Mario)
	swc1	$f0,%lo(cc100_Mario)($2)
	lui	$2,%hi(cc100_Luigi)
	swc1	$f0,%lo(cc100_Luigi)($2)
	lui	$2,%hi(cc100_Yoshi)
	swc1	$f0,%lo(cc100_Yoshi)($2)
	lui	$2,%hi(cc100_Toad)
	swc1	$f0,%lo(cc100_Toad)($2)
	lui	$2,%hi(cc100_DK)
	swc1	$f0,%lo(cc100_DK)($2)
	lui	$2,%hi(cc100_Wario)
	swc1	$f0,%lo(cc100_Wario)($2)
	lui	$2,%hi(cc100_Peach)
	swc1	$f0,%lo(cc100_Peach)($2)
	lui	$2,%hi(cc100_Bowser)
	swc1	$f0,%lo(cc100_Bowser)($2)
	lui	$2,%hi($LC14)
	lwc1	$f2,%lo($LC14)($2)
	lui	$2,%hi(cc150_Mario)
	swc1	$f2,%lo(cc150_Mario)($2)
	lui	$2,%hi(cc150_Luigi)
	swc1	$f2,%lo(cc150_Luigi)($2)
	lui	$2,%hi(cc150_Yoshi)
	swc1	$f2,%lo(cc150_Yoshi)($2)
	lui	$2,%hi(cc150_Toad)
	swc1	$f2,%lo(cc150_Toad)($2)
	lui	$2,%hi(cc150_DK)
	swc1	$f2,%lo(cc150_DK)($2)
	lui	$2,%hi(cc150_Wario)
	swc1	$f2,%lo(cc150_Wario)($2)
	lui	$2,%hi(cc150_Peach)
	swc1	$f2,%lo(cc150_Peach)($2)
	lui	$2,%hi(cc150_Bowser)
	swc1	$f2,%lo(cc150_Bowser)($2)
	lui	$2,%hi(ccextra_Mario)
	swc1	$f0,%lo(ccextra_Mario)($2)
	lui	$2,%hi(ccextra_Luigi)
	swc1	$f0,%lo(ccextra_Luigi)($2)
	lui	$2,%hi(ccextra_Yoshi)
	swc1	$f0,%lo(ccextra_Yoshi)($2)
	lui	$2,%hi(ccextra_Toad)
	swc1	$f0,%lo(ccextra_Toad)($2)
	lui	$2,%hi(ccextra_DK)
	swc1	$f0,%lo(ccextra_DK)($2)
	lui	$2,%hi(ccextra_Wario)
	swc1	$f0,%lo(ccextra_Wario)($2)
	lui	$2,%hi(ccextra_Peach)
	swc1	$f0,%lo(ccextra_Peach)($2)
	lui	$2,%hi(ccextra_Bowser)
	swc1	$f0,%lo(ccextra_Bowser)($2)
	lui	$2,%hi($LC15)
	lwc1	$f0,%lo($LC15)($2)
	lui	$2,%hi(turncoA_Mario)
	swc1	$f0,%lo(turncoA_Mario)($2)
	lui	$2,%hi(turncoA_Luigi)
	swc1	$f0,%lo(turncoA_Luigi)($2)
	lui	$2,%hi(turncoA_Yoshi)
	swc1	$f0,%lo(turncoA_Yoshi)($2)
	lui	$2,%hi(turncoA_Toad)
	swc1	$f0,%lo(turncoA_Toad)($2)
	lui	$2,%hi(turncoA_DK)
	swc1	$f0,%lo(turncoA_DK)($2)
	lui	$2,%hi(turncoA_Wario)
	swc1	$f0,%lo(turncoA_Wario)($2)
	lui	$2,%hi(turncoA_Peach)
	swc1	$f0,%lo(turncoA_Peach)($2)
	lui	$2,%hi(turncoA_Bowser)
	swc1	$f0,%lo(turncoA_Bowser)($2)
	lui	$2,%hi(turncoB_Mario)
	swc1	$f0,%lo(turncoB_Mario)($2)
	lui	$2,%hi(turncoB_Luigi)
	swc1	$f0,%lo(turncoB_Luigi)($2)
	lui	$2,%hi(turncoB_Yoshi)
	swc1	$f0,%lo(turncoB_Yoshi)($2)
	lui	$2,%hi(turncoB_Toad)
	swc1	$f0,%lo(turncoB_Toad)($2)
	lui	$2,%hi(turncoB_DK)
	swc1	$f0,%lo(turncoB_DK)($2)
	lui	$2,%hi(turncoB_Wario)
	swc1	$f0,%lo(turncoB_Wario)($2)
	lui	$2,%hi(turncoB_Peach)
	swc1	$f0,%lo(turncoB_Peach)($2)
	lui	$2,%hi(turncoB_Bowser)
	swc1	$f0,%lo(turncoB_Bowser)($2)
	lui	$2,%hi($LC18)
	lwc1	$f0,%lo($LC18)($2)
	lui	$2,%hi(tripleTap_Mario)
	swc1	$f0,%lo(tripleTap_Mario)($2)
	lui	$2,%hi(tripleTap_Luigi)
	swc1	$f0,%lo(tripleTap_Luigi)($2)
	lui	$2,%hi(tripleTap_Yoshi)
	swc1	$f0,%lo(tripleTap_Yoshi)($2)
	lui	$2,%hi(tripleTap_Toad)
	swc1	$f0,%lo(tripleTap_Toad)($2)
	lui	$2,%hi(tripleTap_DK)
	swc1	$f0,%lo(tripleTap_DK)($2)
	lui	$2,%hi(tripleTap_Wario)
	swc1	$f0,%lo(tripleTap_Wario)($2)
	lui	$2,%hi(tripleTap_Peach)
	swc1	$f0,%lo(tripleTap_Peach)($2)
	lui	$2,%hi(tripleTap_Bowser)
	swc1	$f0,%lo(tripleTap_Bowser)($2)
	lui	$2,%hi($LC21)
	lwc1	$f0,%lo($LC21)($2)
	lui	$2,%hi(turncontr_Mario)
	swc1	$f0,%lo(turncontr_Mario)($2)
	lui	$2,%hi(turncontr_Luigi)
	swc1	$f0,%lo(turncontr_Luigi)($2)
	lui	$2,%hi(turncontr_Yoshi)
	swc1	$f0,%lo(turncontr_Yoshi)($2)
	lui	$2,%hi(turncontr_Toad)
	swc1	$f0,%lo(turncontr_Toad)($2)
	lui	$2,%hi(turncontr_DK)
	swc1	$f0,%lo(turncontr_DK)($2)
	lui	$2,%hi(turncontr_Wario)
	swc1	$f0,%lo(turncontr_Wario)($2)
	lui	$2,%hi(turncontr_Peach)
	swc1	$f0,%lo(turncontr_Peach)($2)
	lui	$2,%hi(turncontr_Bowser)
	b	$L46
	swc1	$f0,%lo(turncontr_Bowser)($2)

	.set	macro
	.set	reorder
	.end	equalStats
	.size	equalStats, .-equalStats
	.align	2
	.globl	checkStats
	.set	nomips16
	.set	nomicromips
	.ent	checkStats
	.type	checkStats, @function
checkStats:
	.frame	$sp,24,$31		# vars= 0, regs= 2/0, args= 16, gp= 0
	.mask	0x80010000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	lui	$2,%hi(StatsID)
	lb	$2,%lo(StatsID)($2)
	bne	$2,$4,$L54
	nop

	jr	$31
	nop

$L54:
	addiu	$sp,$sp,-24
	sw	$31,20($sp)
	sw	$16,16($sp)
	jal	equalStats
	move	$16,$4

	lui	$2,%hi(StatsID)
	sb	$16,%lo(StatsID)($2)
	lw	$31,20($sp)
	lw	$16,16($sp)
	jr	$31
	addiu	$sp,$sp,24

	.set	macro
	.set	reorder
	.end	checkStats
	.size	checkStats, .-checkStats
	.section	.rodata.cst4,"aM",@progbits,4
	.align	2
$LC0:
	.word	1092616192
	.align	2
$LC1:
	.word	1120403456
	.align	2
$LC2:
	.word	1148846080
	.align	2
$LC3:
	.word	1163018240
	.align	2
$LC4:
	.word	1163399168
	.align	2
$LC5:
	.word	1164984320
	.align	2
$LC6:
	.word	1165389824
	.align	2
$LC7:
	.word	1166016512
	.align	2
$LC8:
	.word	1166227456
	.align	2
$LC9:
	.word	1133576192
	.align	2
$LC10:
	.word	1133707264
	.align	2
$LC11:
	.word	1134231552
	.align	2
$LC12:
	.word	1134362624
	.align	2
$LC13:
	.word	1134559232
	.align	2
$LC14:
	.word	1134690304
	.align	2
$LC15:
	.word	990057071
	.align	2
$LC16:
	.word	-1157426577
	.align	2
$LC17:
	.word	1073741824
	.align	2
$LC18:
	.word	1077936128
	.align	2
$LC19:
	.word	1069547520
	.align	2
$LC20:
	.word	1067450368
	.align	2
$LC21:
	.word	1067702026
	.align	2
$LC22:
	.word	1066611507
	.ident	"GCC: (GNU) 10.1.0"
