	.file	1 "ObjectHandler.c"
	.section .mdebug.abi32
	.previous
	.nan	legacy
	.module	fp=32
	.module	nooddspreg
	.text
	.align	2
	.globl	BombThrowRolloverWrap
	.set	nomips16
	.set	nomicromips
	.ent	BombThrowRolloverWrap
	.type	BombThrowRolloverWrap, @function
BombThrowRolloverWrap:
	.frame	$sp,32,$31		# vars= 0, regs= 3/0, args= 16, gp= 0
	.mask	0x80030000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	addiu	$sp,$sp,-32
	sw	$31,28($sp)
	sw	$17,24($sp)
	sw	$16,20($sp)
	move	$17,$4
	lui	$2,%hi(g_PlayerStructTable)
	addiu	$2,$2,%lo(g_PlayerStructTable)
	subu	$2,$4,$2
	li	$16,1240924160			# 0x49f70000
	ori	$16,$16,0xe8e3
	mult	$2,$16
	mfhi	$16
	sra	$16,$16,10
	sra	$2,$2,31
	subu	$16,$16,$2
	move	$5,$0
	jal	CheckHit
	move	$4,$16

	sll	$5,$16,24
	sra	$5,$5,24
	jal	SetBombThrowRollover
	move	$4,$17

	lw	$31,28($sp)
	lw	$17,24($sp)
	lw	$16,20($sp)
	jr	$31
	addiu	$sp,$sp,32

	.set	macro
	.set	reorder
	.end	BombThrowRolloverWrap
	.size	BombThrowRolloverWrap, .-BombThrowRolloverWrap
	.align	2
	.globl	RolloverWrap
	.set	nomips16
	.set	nomicromips
	.ent	RolloverWrap
	.type	RolloverWrap, @function
RolloverWrap:
	.frame	$sp,32,$31		# vars= 0, regs= 3/0, args= 16, gp= 0
	.mask	0x80030000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	addiu	$sp,$sp,-32
	sw	$31,28($sp)
	sw	$17,24($sp)
	sw	$16,20($sp)
	move	$17,$4
	lui	$2,%hi(g_PlayerStructTable)
	addiu	$2,$2,%lo(g_PlayerStructTable)
	subu	$2,$4,$2
	li	$16,1240924160			# 0x49f70000
	ori	$16,$16,0xe8e3
	mult	$2,$16
	mfhi	$16
	sra	$16,$16,10
	sra	$2,$2,31
	subu	$16,$16,$2
	li	$5,1			# 0x1
	jal	CheckHit
	move	$4,$16

	sll	$5,$16,24
	sra	$5,$5,24
	jal	SetRollover
	move	$4,$17

	lw	$31,28($sp)
	lw	$17,24($sp)
	lw	$16,20($sp)
	jr	$31
	addiu	$sp,$sp,32

	.set	macro
	.set	reorder
	.end	RolloverWrap
	.size	RolloverWrap, .-RolloverWrap
	.align	2
	.globl	WheelSpinWrap
	.set	nomips16
	.set	nomicromips
	.ent	WheelSpinWrap
	.type	WheelSpinWrap, @function
WheelSpinWrap:
	.frame	$sp,32,$31		# vars= 0, regs= 3/0, args= 16, gp= 0
	.mask	0x80030000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	addiu	$sp,$sp,-32
	sw	$31,28($sp)
	sw	$17,24($sp)
	sw	$16,20($sp)
	move	$17,$4
	lui	$2,%hi(g_PlayerStructTable)
	addiu	$2,$2,%lo(g_PlayerStructTable)
	subu	$2,$4,$2
	li	$16,1240924160			# 0x49f70000
	ori	$16,$16,0xe8e3
	mult	$2,$16
	mfhi	$16
	sra	$16,$16,10
	sra	$2,$2,31
	subu	$16,$16,$2
	li	$5,2			# 0x2
	jal	CheckHit
	move	$4,$16

	sll	$5,$16,24
	sra	$5,$5,24
	jal	SetWheelspin
	move	$4,$17

	lw	$31,28($sp)
	lw	$17,24($sp)
	lw	$16,20($sp)
	jr	$31
	addiu	$sp,$sp,32

	.set	macro
	.set	reorder
	.end	WheelSpinWrap
	.size	WheelSpinWrap, .-WheelSpinWrap
	.align	2
	.globl	BrokenWrap
	.set	nomips16
	.set	nomicromips
	.ent	BrokenWrap
	.type	BrokenWrap, @function
BrokenWrap:
	.frame	$sp,32,$31		# vars= 0, regs= 3/0, args= 16, gp= 0
	.mask	0x80030000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	addiu	$sp,$sp,-32
	sw	$31,28($sp)
	sw	$17,24($sp)
	sw	$16,20($sp)
	move	$17,$4
	lui	$2,%hi(g_PlayerStructTable)
	addiu	$2,$2,%lo(g_PlayerStructTable)
	subu	$2,$4,$2
	li	$16,1240924160			# 0x49f70000
	ori	$16,$16,0xe8e3
	mult	$2,$16
	mfhi	$16
	sra	$16,$16,10
	sra	$2,$2,31
	subu	$16,$16,$2
	li	$5,3			# 0x3
	jal	CheckHit
	move	$4,$16

	sll	$5,$16,24
	sra	$5,$5,24
	jal	SetBroken
	move	$4,$17

	lw	$31,28($sp)
	lw	$17,24($sp)
	lw	$16,20($sp)
	jr	$31
	addiu	$sp,$sp,32

	.set	macro
	.set	reorder
	.end	BrokenWrap
	.size	BrokenWrap, .-BrokenWrap
	.align	2
	.globl	ThunderWrap
	.set	nomips16
	.set	nomicromips
	.ent	ThunderWrap
	.type	ThunderWrap, @function
ThunderWrap:
	.frame	$sp,32,$31		# vars= 0, regs= 3/0, args= 16, gp= 0
	.mask	0x80030000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	addiu	$sp,$sp,-32
	sw	$31,28($sp)
	sw	$17,24($sp)
	sw	$16,20($sp)
	move	$17,$4
	lui	$2,%hi(g_PlayerStructTable)
	addiu	$2,$2,%lo(g_PlayerStructTable)
	subu	$2,$4,$2
	li	$16,1240924160			# 0x49f70000
	ori	$16,$16,0xe8e3
	mult	$2,$16
	mfhi	$16
	sra	$16,$16,10
	sra	$2,$2,31
	subu	$16,$16,$2
	li	$5,4			# 0x4
	jal	CheckHit
	move	$4,$16

	sll	$5,$16,24
	sra	$5,$5,24
	jal	SetThunder
	move	$4,$17

	lw	$31,28($sp)
	lw	$17,24($sp)
	lw	$16,20($sp)
	jr	$31
	addiu	$sp,$sp,32

	.set	macro
	.set	reorder
	.end	ThunderWrap
	.size	ThunderWrap, .-ThunderWrap
	.align	2
	.globl	SpinWrap
	.set	nomips16
	.set	nomicromips
	.ent	SpinWrap
	.type	SpinWrap, @function
SpinWrap:
	.frame	$sp,32,$31		# vars= 0, regs= 3/0, args= 16, gp= 0
	.mask	0x80030000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	addiu	$sp,$sp,-32
	sw	$31,28($sp)
	sw	$17,24($sp)
	sw	$16,20($sp)
	move	$17,$4
	lui	$2,%hi(g_PlayerStructTable)
	addiu	$2,$2,%lo(g_PlayerStructTable)
	subu	$2,$4,$2
	li	$16,1240924160			# 0x49f70000
	ori	$16,$16,0xe8e3
	mult	$2,$16
	mfhi	$16
	sra	$16,$16,10
	sra	$2,$2,31
	subu	$16,$16,$2
	li	$5,5			# 0x5
	jal	CheckHit
	move	$4,$16

	sll	$5,$16,24
	sra	$5,$5,24
	jal	SetSpin
	move	$4,$17

	lw	$31,28($sp)
	lw	$17,24($sp)
	lw	$16,20($sp)
	jr	$31
	addiu	$sp,$sp,32

	.set	macro
	.set	reorder
	.end	SpinWrap
	.size	SpinWrap, .-SpinWrap
	.align	2
	.globl	BombRolloverWrap
	.set	nomips16
	.set	nomicromips
	.ent	BombRolloverWrap
	.type	BombRolloverWrap, @function
BombRolloverWrap:
	.frame	$sp,32,$31		# vars= 0, regs= 3/0, args= 16, gp= 0
	.mask	0x80030000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	addiu	$sp,$sp,-32
	sw	$31,28($sp)
	sw	$17,24($sp)
	sw	$16,20($sp)
	move	$17,$4
	lui	$2,%hi(g_PlayerStructTable)
	addiu	$2,$2,%lo(g_PlayerStructTable)
	subu	$2,$4,$2
	li	$16,1240924160			# 0x49f70000
	ori	$16,$16,0xe8e3
	mult	$2,$16
	mfhi	$16
	sra	$16,$16,10
	sra	$2,$2,31
	subu	$16,$16,$2
	li	$5,6			# 0x6
	jal	CheckHit
	move	$4,$16

	sll	$5,$16,24
	sra	$5,$5,24
	jal	SetBombRollover
	move	$4,$17

	lw	$31,28($sp)
	lw	$17,24($sp)
	lw	$16,20($sp)
	jr	$31
	addiu	$sp,$sp,32

	.set	macro
	.set	reorder
	.end	BombRolloverWrap
	.size	BombRolloverWrap, .-BombRolloverWrap
	.align	2
	.globl	ProWheelSpinWrap
	.set	nomips16
	.set	nomicromips
	.ent	ProWheelSpinWrap
	.type	ProWheelSpinWrap, @function
ProWheelSpinWrap:
	.frame	$sp,32,$31		# vars= 0, regs= 3/0, args= 16, gp= 0
	.mask	0x80030000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	addiu	$sp,$sp,-32
	sw	$31,28($sp)
	sw	$17,24($sp)
	sw	$16,20($sp)
	move	$17,$4
	lui	$2,%hi(g_PlayerStructTable)
	addiu	$2,$2,%lo(g_PlayerStructTable)
	subu	$2,$4,$2
	li	$16,1240924160			# 0x49f70000
	ori	$16,$16,0xe8e3
	mult	$2,$16
	mfhi	$16
	sra	$16,$16,10
	sra	$2,$2,31
	subu	$16,$16,$2
	li	$5,7			# 0x7
	jal	CheckHit
	move	$4,$16

	sll	$5,$16,24
	sra	$5,$5,24
	jal	SetProWheelSpin
	move	$4,$17

	lw	$31,28($sp)
	lw	$17,24($sp)
	lw	$16,20($sp)
	jr	$31
	addiu	$sp,$sp,32

	.set	macro
	.set	reorder
	.end	ProWheelSpinWrap
	.size	ProWheelSpinWrap, .-ProWheelSpinWrap
	.ident	"GCC: (GNU) 10.1.0"
