	.file	1 "PlayerEffects.c"
	.section .mdebug.abi32
	.previous
	.nan	legacy
	.module	fp=32
	.module	nooddspreg
	.text
	.align	2
	.globl	SetAnimMusicNote
	.set	nomips16
	.set	nomicromips
	.ent	SetAnimMusicNote
	.type	SetAnimMusicNote, @function
SetAnimMusicNote:
	.frame	$sp,0,$31		# vars= 0, regs= 0/0, args= 0, gp= 0
	.mask	0x00000000,0
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	lui	$5,%hi(GlobalPlayer)
	addiu	$5,$5,%lo(GlobalPlayer)
	sll	$2,$4,3
	subu	$3,$2,$4
	sll	$3,$3,4
	subu	$3,$3,$4
	sll	$3,$3,2
	subu	$3,$3,$4
	sll	$3,$3,3
	addu	$3,$5,$3
	lhu	$2,182($3)
	ori	$2,$2,0x20
	jr	$31
	sh	$2,182($3)

	.set	macro
	.set	reorder
	.end	SetAnimMusicNote
	.size	SetAnimMusicNote, .-SetAnimMusicNote
	.align	2
	.globl	SetAnimCrash
	.set	nomips16
	.set	nomicromips
	.ent	SetAnimCrash
	.type	SetAnimCrash, @function
SetAnimCrash:
	.frame	$sp,0,$31		# vars= 0, regs= 0/0, args= 0, gp= 0
	.mask	0x00000000,0
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	lui	$5,%hi(GlobalPlayer)
	addiu	$5,$5,%lo(GlobalPlayer)
	sll	$2,$4,3
	subu	$3,$2,$4
	sll	$3,$3,4
	subu	$3,$3,$4
	sll	$3,$3,2
	subu	$3,$3,$4
	sll	$3,$3,3
	addu	$3,$5,$3
	lhu	$2,182($3)
	ori	$2,$2,0x40
	jr	$31
	sh	$2,182($3)

	.set	macro
	.set	reorder
	.end	SetAnimCrash
	.size	SetAnimCrash, .-SetAnimCrash
	.align	2
	.globl	SetAnimPoomp
	.set	nomips16
	.set	nomicromips
	.ent	SetAnimPoomp
	.type	SetAnimPoomp, @function
SetAnimPoomp:
	.frame	$sp,0,$31		# vars= 0, regs= 0/0, args= 0, gp= 0
	.mask	0x00000000,0
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	lui	$5,%hi(GlobalPlayer)
	addiu	$5,$5,%lo(GlobalPlayer)
	sll	$2,$4,3
	subu	$3,$2,$4
	sll	$3,$3,4
	subu	$3,$3,$4
	sll	$3,$3,2
	subu	$3,$3,$4
	sll	$3,$3,3
	addu	$3,$5,$3
	lhu	$2,182($3)
	ori	$2,$2,0x100
	jr	$31
	sh	$2,182($3)

	.set	macro
	.set	reorder
	.end	SetAnimPoomp
	.size	SetAnimPoomp, .-SetAnimPoomp
	.align	2
	.globl	SetAnimBoing
	.set	nomips16
	.set	nomicromips
	.ent	SetAnimBoing
	.type	SetAnimBoing, @function
SetAnimBoing:
	.frame	$sp,0,$31		# vars= 0, regs= 0/0, args= 0, gp= 0
	.mask	0x00000000,0
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	lui	$5,%hi(GlobalPlayer)
	addiu	$5,$5,%lo(GlobalPlayer)
	sll	$2,$4,3
	subu	$3,$2,$4
	sll	$3,$3,4
	subu	$3,$3,$4
	sll	$3,$3,2
	subu	$3,$3,$4
	sll	$3,$3,3
	addu	$3,$5,$3
	lhu	$2,182($3)
	ori	$2,$2,0x800
	jr	$31
	sh	$2,182($3)

	.set	macro
	.set	reorder
	.end	SetAnimBoing
	.size	SetAnimBoing, .-SetAnimBoing
	.align	2
	.globl	SetAnimExplosion
	.set	nomips16
	.set	nomicromips
	.ent	SetAnimExplosion
	.type	SetAnimExplosion, @function
SetAnimExplosion:
	.frame	$sp,0,$31		# vars= 0, regs= 0/0, args= 0, gp= 0
	.mask	0x00000000,0
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	lui	$5,%hi(GlobalPlayer)
	addiu	$5,$5,%lo(GlobalPlayer)
	sll	$2,$4,3
	subu	$3,$2,$4
	sll	$3,$3,4
	subu	$3,$3,$4
	sll	$3,$3,2
	subu	$3,$3,$4
	sll	$3,$3,3
	addu	$3,$5,$3
	lhu	$2,182($3)
	ori	$2,$2,0x1000
	jr	$31
	sh	$2,182($3)

	.set	macro
	.set	reorder
	.end	SetAnimExplosion
	.size	SetAnimExplosion, .-SetAnimExplosion
	.align	2
	.globl	SetAnimBonkStars
	.set	nomips16
	.set	nomicromips
	.ent	SetAnimBonkStars
	.type	SetAnimBonkStars, @function
SetAnimBonkStars:
	.frame	$sp,0,$31		# vars= 0, regs= 0/0, args= 0, gp= 0
	.mask	0x00000000,0
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	lui	$5,%hi(GlobalPlayer)
	addiu	$5,$5,%lo(GlobalPlayer)
	sll	$2,$4,3
	subu	$3,$2,$4
	sll	$3,$3,4
	subu	$3,$3,$4
	sll	$3,$3,2
	subu	$3,$3,$4
	sll	$3,$3,3
	addu	$3,$5,$3
	lhu	$2,68($3)
	ori	$2,$2,0x1000
	jr	$31
	sh	$2,68($3)

	.set	macro
	.set	reorder
	.end	SetAnimBonkStars
	.size	SetAnimBonkStars, .-SetAnimBonkStars
	.align	2
	.globl	SetAnimLandingDust
	.set	nomips16
	.set	nomicromips
	.ent	SetAnimLandingDust
	.type	SetAnimLandingDust, @function
SetAnimLandingDust:
	.frame	$sp,0,$31		# vars= 0, regs= 0/0, args= 0, gp= 0
	.mask	0x00000000,0
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	lui	$5,%hi(GlobalPlayer)
	addiu	$5,$5,%lo(GlobalPlayer)
	sll	$2,$4,3
	subu	$3,$2,$4
	sll	$3,$3,4
	subu	$3,$3,$4
	sll	$3,$3,2
	subu	$3,$3,$4
	sll	$3,$3,3
	addu	$3,$5,$3
	lhu	$2,68($3)
	ori	$2,$2,0x100
	jr	$31
	sh	$2,68($3)

	.set	macro
	.set	reorder
	.end	SetAnimLandingDust
	.size	SetAnimLandingDust, .-SetAnimLandingDust
	.align	2
	.globl	SetAnimBooSmoke
	.set	nomips16
	.set	nomicromips
	.ent	SetAnimBooSmoke
	.type	SetAnimBooSmoke, @function
SetAnimBooSmoke:
	.frame	$sp,0,$31		# vars= 0, regs= 0/0, args= 0, gp= 0
	.mask	0x00000000,0
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	lui	$5,%hi(GlobalPlayer)
	addiu	$5,$5,%lo(GlobalPlayer)
	sll	$2,$4,3
	subu	$3,$2,$4
	sll	$3,$3,4
	subu	$3,$3,$4
	sll	$3,$3,2
	subu	$3,$3,$4
	sll	$3,$3,3
	addu	$3,$5,$3
	lhu	$2,68($3)
	ori	$2,$2,0x200
	jr	$31
	sh	$2,68($3)

	.set	macro
	.set	reorder
	.end	SetAnimBooSmoke
	.size	SetAnimBooSmoke, .-SetAnimBooSmoke
	.align	2
	.globl	SetAnimWaterDrip
	.set	nomips16
	.set	nomicromips
	.ent	SetAnimWaterDrip
	.type	SetAnimWaterDrip, @function
SetAnimWaterDrip:
	.frame	$sp,0,$31		# vars= 0, regs= 0/0, args= 0, gp= 0
	.mask	0x00000000,0
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	bne	$5,$0,$L12
	lui	$3,%hi(GlobalPlayer)

	sll	$2,$4,3
	subu	$2,$2,$4
	sll	$2,$2,4
	subu	$2,$2,$4
	sll	$2,$2,2
	subu	$2,$2,$4
	sll	$2,$2,3
	addiu	$3,$3,%lo(GlobalPlayer)
	addu	$2,$3,$2
	lh	$3,202($2)
	andi	$2,$3,0x2000
	bne	$2,$0,$L13
	lui	$5,%hi(GlobalPlayer)

	jr	$31
	nop

$L12:
	lui	$5,%hi(GlobalPlayer)
	addiu	$5,$5,%lo(GlobalPlayer)
	sll	$2,$4,3
	subu	$3,$2,$4
	sll	$3,$3,4
	subu	$3,$3,$4
	sll	$3,$3,2
	subu	$3,$3,$4
	sll	$3,$3,3
	addu	$3,$5,$3
	lhu	$2,202($3)
	ori	$2,$2,0x2000
	jr	$31
	sh	$2,202($3)

$L13:
	sll	$2,$4,3
	subu	$2,$2,$4
	sll	$2,$2,4
	subu	$2,$2,$4
	sll	$2,$2,2
	subu	$4,$2,$4
	sll	$4,$4,3
	addiu	$2,$5,%lo(GlobalPlayer)
	addu	$4,$2,$4
	xori	$3,$3,0x2000
	jr	$31
	sh	$3,202($4)

	.set	macro
	.set	reorder
	.end	SetAnimWaterDrip
	.size	SetAnimWaterDrip, .-SetAnimWaterDrip
	.align	2
	.globl	SetAnimSmoking
	.set	nomips16
	.set	nomicromips
	.ent	SetAnimSmoking
	.type	SetAnimSmoking, @function
SetAnimSmoking:
	.frame	$sp,0,$31		# vars= 0, regs= 0/0, args= 0, gp= 0
	.mask	0x00000000,0
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	bne	$5,$0,$L18
	lui	$3,%hi(GlobalPlayer)

	sll	$2,$4,3
	subu	$2,$2,$4
	sll	$2,$2,4
	subu	$2,$2,$4
	sll	$2,$2,2
	subu	$2,$2,$4
	sll	$2,$2,3
	addiu	$3,$3,%lo(GlobalPlayer)
	addu	$2,$3,$2
	lh	$3,202($2)
	andi	$2,$3,0x1000
	bne	$2,$0,$L19
	lui	$5,%hi(GlobalPlayer)

	jr	$31
	nop

$L18:
	lui	$5,%hi(GlobalPlayer)
	addiu	$5,$5,%lo(GlobalPlayer)
	sll	$2,$4,3
	subu	$3,$2,$4
	sll	$3,$3,4
	subu	$3,$3,$4
	sll	$3,$3,2
	subu	$3,$3,$4
	sll	$3,$3,3
	addu	$3,$5,$3
	lhu	$2,202($3)
	ori	$2,$2,0x1000
	jr	$31
	sh	$2,202($3)

$L19:
	sll	$2,$4,3
	subu	$2,$2,$4
	sll	$2,$2,4
	subu	$2,$2,$4
	sll	$2,$2,2
	subu	$4,$2,$4
	sll	$4,$4,3
	addiu	$2,$5,%lo(GlobalPlayer)
	addu	$4,$2,$4
	xori	$3,$3,0x1000
	jr	$31
	sh	$3,202($4)

	.set	macro
	.set	reorder
	.end	SetAnimSmoking
	.size	SetAnimSmoking, .-SetAnimSmoking
	.align	2
	.globl	DisableOutline
	.set	nomips16
	.set	nomicromips
	.ent	DisableOutline
	.type	DisableOutline, @function
DisableOutline:
	.frame	$sp,0,$31		# vars= 0, regs= 0/0, args= 0, gp= 0
	.mask	0x00000000,0
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	lui	$3,%hi(GlobalPlayer)
	sll	$2,$4,3
	subu	$2,$2,$4
	sll	$2,$2,4
	subu	$2,$2,$4
	sll	$2,$2,2
	subu	$2,$2,$4
	sll	$2,$2,3
	addiu	$3,$3,%lo(GlobalPlayer)
	addu	$2,$3,$2
	lbu	$3,199($2)
	li	$2,255			# 0xff
	beq	$3,$2,$L23
	lui	$3,%hi(GlobalPlayer)

	jr	$31
	nop

$L23:
	sll	$2,$4,3
	subu	$2,$2,$4
	sll	$2,$2,4
	subu	$2,$2,$4
	sll	$2,$2,2
	subu	$4,$2,$4
	sll	$4,$4,3
	addiu	$2,$3,%lo(GlobalPlayer)
	addu	$4,$2,$4
	li	$2,48			# 0x30
	jr	$31
	sh	$2,198($4)

	.set	macro
	.set	reorder
	.end	DisableOutline
	.size	DisableOutline, .-DisableOutline
	.align	2
	.globl	SetMapObjectHit
	.set	nomips16
	.set	nomicromips
	.ent	SetMapObjectHit
	.type	SetMapObjectHit, @function
SetMapObjectHit:
	.frame	$sp,0,$31		# vars= 0, regs= 0/0, args= 0, gp= 0
	.mask	0x00000000,0
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	lui	$5,%hi(GlobalPlayer)
	addiu	$5,$5,%lo(GlobalPlayer)
	sll	$2,$4,3
	subu	$3,$2,$4
	sll	$3,$3,4
	subu	$3,$3,$4
	sll	$3,$3,2
	subu	$3,$3,$4
	sll	$3,$3,3
	addu	$3,$5,$3
	lw	$2,12($3)
	li	$4,4194304			# 0x400000
	or	$2,$2,$4
	jr	$31
	sw	$2,12($3)

	.set	macro
	.set	reorder
	.end	SetMapObjectHit
	.size	SetMapObjectHit, .-SetMapObjectHit
	.align	2
	.globl	SetMushroomBoost
	.set	nomips16
	.set	nomicromips
	.ent	SetMushroomBoost
	.type	SetMushroomBoost, @function
SetMushroomBoost:
	.frame	$sp,0,$31		# vars= 0, regs= 0/0, args= 0, gp= 0
	.mask	0x00000000,0
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	lui	$5,%hi(GlobalPlayer)
	addiu	$5,$5,%lo(GlobalPlayer)
	sll	$2,$4,3
	subu	$3,$2,$4
	sll	$3,$3,4
	subu	$3,$3,$4
	sll	$3,$3,2
	subu	$3,$3,$4
	sll	$3,$3,3
	addu	$3,$5,$3
	lw	$2,12($3)
	ori	$2,$2,0x200
	jr	$31
	sw	$2,12($3)

	.set	macro
	.set	reorder
	.end	SetMushroomBoost
	.size	SetMushroomBoost, .-SetMushroomBoost
	.align	2
	.globl	SetLightningHit
	.set	nomips16
	.set	nomicromips
	.ent	SetLightningHit
	.type	SetLightningHit, @function
SetLightningHit:
	.frame	$sp,0,$31		# vars= 0, regs= 0/0, args= 0, gp= 0
	.mask	0x00000000,0
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	lui	$5,%hi(GlobalPlayer)
	addiu	$5,$5,%lo(GlobalPlayer)
	sll	$2,$4,3
	subu	$3,$2,$4
	sll	$3,$3,4
	subu	$3,$3,$4
	sll	$3,$3,2
	subu	$3,$3,$4
	sll	$3,$3,3
	addu	$3,$5,$3
	lw	$2,12($3)
	ori	$2,$2,0x4000
	jr	$31
	sw	$2,12($3)

	.set	macro
	.set	reorder
	.end	SetLightningHit
	.size	SetLightningHit, .-SetLightningHit
	.align	2
	.globl	SetShrunken
	.set	nomips16
	.set	nomicromips
	.ent	SetShrunken
	.type	SetShrunken, @function
SetShrunken:
	.frame	$sp,0,$31		# vars= 0, regs= 0/0, args= 0, gp= 0
	.mask	0x00000000,0
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	beq	$5,$0,$L29
	lui	$5,%hi(GlobalPlayer)

	addiu	$5,$5,%lo(GlobalPlayer)
	sll	$2,$4,3
	subu	$3,$2,$4
	sll	$3,$3,4
	subu	$3,$3,$4
	sll	$3,$3,2
	subu	$3,$3,$4
	sll	$3,$3,3
	addu	$3,$5,$3
	lw	$6,188($3)
	li	$7,1073741824			# 0x40000000
	or	$6,$6,$7
	sw	$6,188($3)
	li	$2,255			# 0xff
	jr	$31
	sh	$2,176($3)

$L29:
	addiu	$5,$5,%lo(GlobalPlayer)
	sll	$2,$4,3
	subu	$3,$2,$4
	sll	$3,$3,4
	subu	$3,$3,$4
	sll	$3,$3,2
	subu	$3,$3,$4
	sll	$3,$3,3
	addu	$3,$5,$3
	lw	$6,188($3)
	li	$7,134217728			# 0x8000000
	or	$6,$6,$7
	sw	$6,188($3)
	li	$2,460			# 0x1cc
	jr	$31
	sh	$2,176($3)

	.set	macro
	.set	reorder
	.end	SetShrunken
	.size	SetShrunken, .-SetShrunken
	.align	2
	.globl	SetStarMan
	.set	nomips16
	.set	nomicromips
	.ent	SetStarMan
	.type	SetStarMan, @function
SetStarMan:
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
	beq	$5,$0,$L32
	move	$16,$4

	lui	$3,%hi(GlobalPlayer)
	sll	$2,$4,3
	subu	$2,$2,$4
	sll	$2,$2,4
	subu	$2,$2,$4
	sll	$2,$2,2
	subu	$2,$2,$4
	sll	$2,$2,3
	addiu	$3,$3,%lo(GlobalPlayer)
	addu	$2,$3,$2
	lw	$2,188($2)
	andi	$2,$2,0x200
	beq	$2,$0,$L36
	sll	$2,$4,3

	lui	$3,%hi(GlobalPlayer)
$L37:
	sll	$2,$16,3
	subu	$2,$2,$16
	sll	$2,$2,4
	subu	$2,$2,$16
	sll	$2,$2,2
	subu	$2,$2,$16
	sll	$2,$2,3
	addiu	$3,$3,%lo(GlobalPlayer)
	addu	$2,$3,$2
	lw	$3,188($2)
	ori	$3,$3,0x200
	sw	$3,188($2)
	sll	$16,$16,2
	lui	$4,%hi(g_StarUseCounter)
	addiu	$4,$4,%lo(g_StarUseCounter)
	addu	$16,$16,$4
	li	$2,65535			# 0xffff
	sw	$2,0($16)
	lw	$31,28($sp)
$L38:
	lw	$18,24($sp)
	lw	$17,20($sp)
	lw	$16,16($sp)
	jr	$31
	addiu	$sp,$sp,32

$L36:
	subu	$2,$2,$4
	sll	$2,$2,4
	subu	$2,$2,$4
	sll	$2,$2,2
	subu	$2,$2,$4
	sll	$2,$2,3
	addiu	$5,$2,52
	addiu	$2,$2,20
	li	$6,16777216			# 0x1000000
	ori	$6,$6,0xff2c
	addu	$5,$3,$5
	jal	NAEnmTrgStart
	addu	$4,$3,$2

	b	$L37
	lui	$3,%hi(GlobalPlayer)

$L32:
	sll	$2,$4,2
	lui	$3,%hi(g_StarUseCounter)
	addiu	$3,$3,%lo(g_StarUseCounter)
	addu	$2,$2,$3
	sw	$0,0($2)
	sll	$17,$4,3
	subu	$17,$17,$4
	sll	$17,$17,4
	subu	$17,$17,$4
	sll	$17,$17,2
	subu	$17,$17,$4
	sll	$17,$17,3
	lui	$18,%hi(GlobalPlayer)
	addiu	$18,$18,%lo(GlobalPlayer)
	move	$5,$4
	jal	ResetStar
	addu	$4,$18,$17

	addiu	$4,$17,20
	li	$5,16777216			# 0x1000000
	ori	$5,$5,0xff2c
	jal	NAEnmTrgStop
	addu	$4,$18,$4

	b	$L38
	lw	$31,28($sp)

	.set	macro
	.set	reorder
	.end	SetStarMan
	.size	SetStarMan, .-SetStarMan
	.align	2
	.globl	SetGhostEffect
	.set	nomips16
	.set	nomicromips
	.ent	SetGhostEffect
	.type	SetGhostEffect, @function
SetGhostEffect:
	.frame	$sp,24,$31		# vars= 0, regs= 2/0, args= 16, gp= 0
	.mask	0x80010000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	addiu	$sp,$sp,-24
	sw	$31,20($sp)
	sw	$16,16($sp)
	beq	$5,$0,$L40
	move	$16,$4

	lui	$3,%hi(GlobalPlayer)
	sll	$2,$4,3
	subu	$2,$2,$4
	sll	$2,$2,4
	subu	$2,$2,$4
	sll	$2,$2,2
	subu	$2,$2,$4
	sll	$2,$2,3
	addiu	$3,$3,%lo(GlobalPlayer)
	addu	$2,$3,$2
	lw	$2,188($2)
	bgez	$2,$L44
	sll	$2,$4,3

	sll	$16,$16,2
$L45:
	lui	$4,%hi(g_GhostUseCounter)
	addiu	$4,$4,%lo(g_GhostUseCounter)
	addu	$16,$16,$4
	li	$2,65535			# 0xffff
	sw	$2,0($16)
	lw	$31,20($sp)
$L46:
	lw	$16,16($sp)
	jr	$31
	addiu	$sp,$sp,24

$L44:
	subu	$2,$2,$4
	sll	$2,$2,4
	subu	$2,$2,$4
	sll	$2,$2,2
	subu	$2,$2,$4
	sll	$2,$2,3
	move	$5,$4
	jal	SetVSGhost
	addu	$4,$3,$2

	b	$L45
	sll	$16,$16,2

$L40:
	sll	$3,$4,2
	lui	$2,%hi(g_GhostUseCounter)
	addiu	$2,$2,%lo(g_GhostUseCounter)
	addu	$2,$3,$2
	sw	$0,0($2)
	lui	$2,%hi(g_GhostUseTimer)
	addiu	$2,$2,%lo(g_GhostUseTimer)
	addu	$3,$3,$2
	li	$2,-1			# 0xffffffffffffffff
	sw	$2,0($3)
	sll	$2,$4,3
	subu	$2,$2,$4
	sll	$2,$2,4
	subu	$2,$2,$4
	sll	$2,$2,2
	subu	$2,$2,$4
	sll	$2,$2,3
	move	$5,$4
	lui	$4,%hi(GlobalPlayer)
	addiu	$4,$4,%lo(GlobalPlayer)
	jal	ResetVSGhost
	addu	$4,$4,$2

	b	$L46
	lw	$31,20($sp)

	.set	macro
	.set	reorder
	.end	SetGhostEffect
	.size	SetGhostEffect, .-SetGhostEffect
	.align	2
	.globl	SetBooTranslucent
	.set	nomips16
	.set	nomicromips
	.ent	SetBooTranslucent
	.type	SetBooTranslucent, @function
SetBooTranslucent:
	.frame	$sp,0,$31		# vars= 0, regs= 0/0, args= 0, gp= 0
	.mask	0x00000000,0
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	lui	$5,%hi(GlobalPlayer)
	addiu	$5,$5,%lo(GlobalPlayer)
	sll	$2,$4,3
	subu	$3,$2,$4
	sll	$3,$3,4
	subu	$3,$3,$4
	sll	$3,$3,2
	subu	$3,$3,$4
	sll	$3,$3,3
	addu	$3,$5,$3
	lw	$2,12($3)
	ori	$2,$2,0x800
	jr	$31
	sw	$2,12($3)

	.set	macro
	.set	reorder
	.end	SetBooTranslucent
	.size	SetBooTranslucent, .-SetBooTranslucent
	.align	2
	.globl	SetBecomeBomb
	.set	nomips16
	.set	nomicromips
	.ent	SetBecomeBomb
	.type	SetBecomeBomb, @function
SetBecomeBomb:
	.frame	$sp,0,$31		# vars= 0, regs= 0/0, args= 0, gp= 0
	.mask	0x00000000,0
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	beq	$5,$0,$L49
	sll	$2,$4,3

	lui	$5,%hi(GlobalPlayer)
	addiu	$5,$5,%lo(GlobalPlayer)
	subu	$3,$2,$4
	sll	$3,$3,4
	subu	$3,$3,$4
	sll	$3,$3,2
	subu	$3,$3,$4
	sll	$3,$3,3
	addu	$3,$5,$3
	lw	$2,12($3)
	li	$4,67108864			# 0x4000000
	or	$2,$2,$4
	jr	$31
	sw	$2,12($3)

$L51:
	subu	$2,$2,$4
	sll	$2,$2,4
	subu	$2,$2,$4
	sll	$2,$2,2
	subu	$4,$2,$4
	sll	$4,$4,3
	lui	$2,%hi(GlobalPlayer)
	addiu	$2,$2,%lo(GlobalPlayer)
	addu	$4,$4,$2
	xori	$3,$3,0x40
	jr	$31
	sh	$3,0($4)

$L49:
	subu	$2,$2,$4
	sll	$2,$2,4
	subu	$2,$2,$4
	sll	$2,$2,2
	subu	$2,$2,$4
	sll	$2,$2,3
	lui	$3,%hi(GlobalPlayer)
	addiu	$3,$3,%lo(GlobalPlayer)
	addu	$2,$2,$3
	lhu	$3,0($2)
	andi	$2,$3,0x40
	bne	$2,$0,$L51
	sll	$2,$4,3

	jr	$31
	nop

	.set	macro
	.set	reorder
	.end	SetBecomeBomb
	.size	SetBecomeBomb, .-SetBecomeBomb
	.align	2
	.globl	SetFlattened
	.set	nomips16
	.set	nomicromips
	.ent	SetFlattened
	.type	SetFlattened, @function
SetFlattened:
	.frame	$sp,0,$31		# vars= 0, regs= 0/0, args= 0, gp= 0
	.mask	0x00000000,0
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	beq	$5,$0,$L53
	lui	$3,%hi(GlobalPlayer)

	lui	$5,%hi(GlobalPlayer)
	addiu	$5,$5,%lo(GlobalPlayer)
	sll	$2,$4,3
	subu	$3,$2,$4
	sll	$3,$3,4
	subu	$3,$3,$4
	sll	$3,$3,2
	subu	$3,$3,$4
	sll	$3,$3,3
	addu	$3,$5,$3
	lw	$2,12($3)
	ori	$2,$2,0x100
	jr	$31
	sw	$2,12($3)

$L55:
	sll	$2,$4,3
	subu	$2,$2,$4
	sll	$2,$2,4
	subu	$2,$2,$4
	sll	$2,$2,2
	subu	$4,$2,$4
	sll	$4,$4,3
	addiu	$2,$5,%lo(GlobalPlayer)
	addu	$4,$2,$4
	xori	$3,$3,0x100
	jr	$31
	sw	$3,12($4)

$L53:
	sll	$2,$4,3
	subu	$2,$2,$4
	sll	$2,$2,4
	subu	$2,$2,$4
	sll	$2,$2,2
	subu	$2,$2,$4
	sll	$2,$2,3
	addiu	$3,$3,%lo(GlobalPlayer)
	addu	$2,$3,$2
	lw	$3,12($2)
	andi	$2,$3,0x100
	bne	$2,$0,$L55
	lui	$5,%hi(GlobalPlayer)

	jr	$31
	nop

	.set	macro
	.set	reorder
	.end	SetFlattened
	.size	SetFlattened, .-SetFlattened
	.align	2
	.globl	SetSpinOutSaveable
	.set	nomips16
	.set	nomicromips
	.ent	SetSpinOutSaveable
	.type	SetSpinOutSaveable, @function
SetSpinOutSaveable:
	.frame	$sp,0,$31		# vars= 0, regs= 0/0, args= 0, gp= 0
	.mask	0x00000000,0
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	lui	$5,%hi(GlobalPlayer)
	addiu	$5,$5,%lo(GlobalPlayer)
	sll	$2,$4,3
	subu	$3,$2,$4
	sll	$3,$3,4
	subu	$3,$3,$4
	sll	$3,$3,2
	subu	$3,$3,$4
	sll	$3,$3,3
	addu	$3,$5,$3
	lw	$2,12($3)
	ori	$2,$2,0x1
	jr	$31
	sw	$2,12($3)

	.set	macro
	.set	reorder
	.end	SetSpinOutSaveable
	.size	SetSpinOutSaveable, .-SetSpinOutSaveable
	.align	2
	.globl	SetSpinOut
	.set	nomips16
	.set	nomicromips
	.ent	SetSpinOut
	.type	SetSpinOut, @function
SetSpinOut:
	.frame	$sp,0,$31		# vars= 0, regs= 0/0, args= 0, gp= 0
	.mask	0x00000000,0
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	lui	$5,%hi(GlobalPlayer)
	addiu	$5,$5,%lo(GlobalPlayer)
	sll	$2,$4,3
	subu	$3,$2,$4
	sll	$3,$3,4
	subu	$3,$3,$4
	sll	$3,$3,2
	subu	$3,$3,$4
	sll	$3,$3,3
	addu	$3,$5,$3
	lw	$2,12($3)
	li	$4,2097152			# 0x200000
	or	$2,$2,$4
	jr	$31
	sw	$2,12($3)

	.set	macro
	.set	reorder
	.end	SetSpinOut
	.size	SetSpinOut, .-SetSpinOut
	.align	2
	.globl	SetFailedStart
	.set	nomips16
	.set	nomicromips
	.ent	SetFailedStart
	.type	SetFailedStart, @function
SetFailedStart:
	.frame	$sp,0,$31		# vars= 0, regs= 0/0, args= 0, gp= 0
	.mask	0x00000000,0
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	lui	$5,%hi(GlobalPlayer)
	addiu	$5,$5,%lo(GlobalPlayer)
	sll	$2,$4,3
	subu	$3,$2,$4
	sll	$3,$3,4
	subu	$3,$3,$4
	sll	$3,$3,2
	subu	$3,$3,$4
	sll	$3,$3,3
	addu	$3,$5,$3
	lw	$2,12($3)
	li	$4,268435456			# 0x10000000
	or	$2,$2,$4
	jr	$31
	sw	$2,12($3)

	.set	macro
	.set	reorder
	.end	SetFailedStart
	.size	SetFailedStart, .-SetFailedStart
	.align	2
	.globl	SetGreenShellHit
	.set	nomips16
	.set	nomicromips
	.ent	SetGreenShellHit
	.type	SetGreenShellHit, @function
SetGreenShellHit:
	.frame	$sp,0,$31		# vars= 0, regs= 0/0, args= 0, gp= 0
	.mask	0x00000000,0
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	lui	$5,%hi(GlobalPlayer)
	addiu	$5,$5,%lo(GlobalPlayer)
	sll	$2,$4,3
	subu	$3,$2,$4
	sll	$3,$3,4
	subu	$3,$3,$4
	sll	$3,$3,2
	subu	$3,$3,$4
	sll	$3,$3,3
	addu	$3,$5,$3
	lw	$2,12($3)
	ori	$2,$2,0x4
	jr	$31
	sw	$2,12($3)

	.set	macro
	.set	reorder
	.end	SetGreenShellHit
	.size	SetGreenShellHit, .-SetGreenShellHit
	.align	2
	.globl	SetRedShellHit
	.set	nomips16
	.set	nomicromips
	.ent	SetRedShellHit
	.type	SetRedShellHit, @function
SetRedShellHit:
	.frame	$sp,0,$31		# vars= 0, regs= 0/0, args= 0, gp= 0
	.mask	0x00000000,0
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	lui	$5,%hi(GlobalPlayer)
	addiu	$5,$5,%lo(GlobalPlayer)
	sll	$2,$4,3
	subu	$3,$2,$4
	sll	$3,$3,4
	subu	$3,$3,$4
	sll	$3,$3,2
	subu	$3,$3,$4
	sll	$3,$3,3
	addu	$3,$5,$3
	lw	$2,12($3)
	ori	$2,$2,0x2
	jr	$31
	sw	$2,12($3)

	.set	macro
	.set	reorder
	.end	SetRedShellHit
	.size	SetRedShellHit, .-SetRedShellHit
	.align	2
	.globl	SetBonk
	.set	nomips16
	.set	nomicromips
	.ent	SetBonk
	.type	SetBonk, @function
SetBonk:
	.frame	$sp,0,$31		# vars= 0, regs= 0/0, args= 0, gp= 0
	.mask	0x00000000,0
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	lui	$5,%hi(GlobalPlayer)
	addiu	$5,$5,%lo(GlobalPlayer)
	sll	$2,$4,3
	subu	$3,$2,$4
	sll	$3,$3,4
	subu	$3,$3,$4
	sll	$3,$3,2
	subu	$3,$3,$4
	sll	$3,$3,3
	addu	$3,$5,$3
	lw	$2,188($3)
	ori	$2,$2,0x8000
	jr	$31
	sw	$2,188($3)

	.set	macro
	.set	reorder
	.end	SetBonk
	.size	SetBonk, .-SetBonk
	.align	2
	.globl	ChangeMaxSpeed
	.set	nomips16
	.set	nomicromips
	.ent	ChangeMaxSpeed
	.type	ChangeMaxSpeed, @function
ChangeMaxSpeed:
	.frame	$sp,0,$31		# vars= 0, regs= 0/0, args= 0, gp= 0
	.mask	0x00000000,0
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	lui	$6,%hi(GlobalPlayer)
	addiu	$6,$6,%lo(GlobalPlayer)
	sll	$2,$4,3
	subu	$3,$2,$4
	sll	$3,$3,4
	subu	$3,$3,$4
	sll	$3,$3,2
	subu	$3,$3,$4
	sll	$3,$3,3
	addu	$3,$6,$3
	lwc1	$f0,532($3)
	mtc1	$5,$f2
	nop
	add.s	$f0,$f0,$f2
	jr	$31
	swc1	$f0,532($3)

	.set	macro
	.set	reorder
	.end	ChangeMaxSpeed
	.size	ChangeMaxSpeed, .-ChangeMaxSpeed
	.align	2
	.globl	SetCamShiftUp
	.set	nomips16
	.set	nomicromips
	.ent	SetCamShiftUp
	.type	SetCamShiftUp, @function
SetCamShiftUp:
	.frame	$sp,0,$31		# vars= 0, regs= 0/0, args= 0, gp= 0
	.mask	0x00000000,0
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	sll	$4,$4,2
	lui	$2,%hi(GlobalCamera)
	addiu	$2,$2,%lo(GlobalCamera)
	addu	$4,$4,$2
	lw	$2,0($4)
	lui	$3,%hi($LC0)
	lwc1	$f0,%lo($LC0)($3)
	mtc1	$5,$f2
	nop
	add.s	$f0,$f2,$f0
	jr	$31
	swc1	$f0,52($2)

	.set	macro
	.set	reorder
	.end	SetCamShiftUp
	.size	SetCamShiftUp, .-SetCamShiftUp
	.align	2
	.globl	ChangePlayerSize
	.set	nomips16
	.set	nomicromips
	.ent	ChangePlayerSize
	.type	ChangePlayerSize, @function
ChangePlayerSize:
	.frame	$sp,0,$31		# vars= 0, regs= 0/0, args= 0, gp= 0
	.mask	0x00000000,0
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	mtc1	$5,$f0
	lui	$3,%hi(GlobalPlayer)
	sll	$2,$4,3
	subu	$2,$2,$4
	sll	$2,$2,4
	subu	$2,$2,$4
	sll	$2,$2,2
	subu	$2,$2,$4
	sll	$2,$2,3
	addiu	$3,$3,%lo(GlobalPlayer)
	addu	$2,$3,$2
	lhu	$2,596($2)
	andi	$2,$2,0xfffd
	li	$3,5			# 0x5
	beq	$2,$3,$L68
	lui	$2,%hi($LC2)

	lwc1	$f2,%lo($LC2)($2)
	b	$L66
	mul.s	$f2,$f0,$f2

$L68:
	lui	$2,%hi($LC1)
	lwc1	$f2,%lo($LC1)($2)
	mul.s	$f2,$f0,$f2
$L66:
	sll	$2,$4,3
	subu	$2,$2,$4
	sll	$2,$2,4
	subu	$2,$2,$4
	sll	$2,$2,2
	subu	$2,$2,$4
	sll	$2,$2,3
	lui	$3,%hi(GlobalPlayer)
	addiu	$3,$3,%lo(GlobalPlayer)
	addu	$2,$2,$3
	swc1	$f2,112($2)
	swc1	$f0,548($2)
	slt	$2,$4,4
	beq	$2,$0,$L69
	sll	$4,$4,2

	lui	$2,%hi(GlobalCamera)
	addiu	$2,$2,%lo(GlobalCamera)
	addu	$4,$4,$2
	lw	$2,0($4)
	lui	$3,%hi($LC0)
	lwc1	$f2,%lo($LC0)($3)
	mul.s	$f0,$f0,$f2
	swc1	$f0,52($2)
$L69:
	jr	$31
	nop

	.set	macro
	.set	reorder
	.end	ChangePlayerSize
	.size	ChangePlayerSize, .-ChangePlayerSize
	.align	2
	.globl	SetPlayerColor
	.set	nomips16
	.set	nomicromips
	.ent	SetPlayerColor
	.type	SetPlayerColor, @function
SetPlayerColor:
	.frame	$sp,40,$31		# vars= 0, regs= 4/2, args= 16, gp= 0
	.mask	0x80070000,-12
	.fmask	0x00300000,-8
	.set	noreorder
	.set	nomacro
	addiu	$sp,$sp,-40
	sw	$31,28($sp)
	sw	$18,24($sp)
	sw	$17,20($sp)
	sw	$16,16($sp)
	sdc1	$f20,32($sp)
	move	$16,$4
	move	$17,$6
	mtc1	$7,$f20
	sll	$2,$4,3
	subu	$2,$2,$4
	sll	$2,$2,4
	subu	$2,$2,$4
	sll	$2,$2,2
	subu	$2,$2,$4
	sll	$2,$2,3
	lui	$18,%hi(GlobalPlayer)
	addiu	$18,$18,%lo(GlobalPlayer)
	addu	$18,$18,$2
	move	$6,$5
	move	$5,$4
	jal	MakeBodyColor
	move	$4,$18

	mfc1	$7,$f20
	move	$6,$17
	move	$5,$16
	jal	MakeBodyColorAdjust
	move	$4,$18

	lw	$31,28($sp)
	lw	$18,24($sp)
	lw	$17,20($sp)
	lw	$16,16($sp)
	ldc1	$f20,32($sp)
	jr	$31
	addiu	$sp,$sp,40

	.set	macro
	.set	reorder
	.end	SetPlayerColor
	.size	SetPlayerColor, .-SetPlayerColor
	.align	2
	.globl	SetPlayerEcho
	.set	nomips16
	.set	nomicromips
	.ent	SetPlayerEcho
	.type	SetPlayerEcho, @function
SetPlayerEcho:
	.frame	$sp,0,$31		# vars= 0, regs= 0/0, args= 0, gp= 0
	.mask	0x00000000,0
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	sll	$2,$4,3
	subu	$2,$2,$4
	sll	$2,$2,4
	subu	$2,$2,$4
	sll	$2,$2,2
	subu	$2,$2,$4
	sll	$2,$2,3
	lui	$3,%hi(GlobalPlayer)
	addiu	$3,$3,%lo(GlobalPlayer)
	addu	$2,$2,$3
	lhu	$2,0($2)
	andi	$2,$2,0x4000
	beq	$2,$0,$L74
	sll	$2,$4,4

	subu	$4,$2,$4
	sll	$2,$4,2
	lui	$4,%hi(g_playerEcho)
	addiu	$4,$4,%lo(g_playerEcho)
	addu	$4,$4,$2
	lui	$2,%hi(GlobalAddressA)
	sw	$4,%lo(GlobalAddressA)($2)
	sb	$5,0($4)
$L74:
	jr	$31
	nop

	.set	macro
	.set	reorder
	.end	SetPlayerEcho
	.size	SetPlayerEcho, .-SetPlayerEcho
	.align	2
	.globl	playrandmCharacterSFX
	.set	nomips16
	.set	nomicromips
	.ent	playrandmCharacterSFX
	.type	playrandmCharacterSFX, @function
playrandmCharacterSFX:
	.frame	$sp,24,$31		# vars= 0, regs= 1/0, args= 16, gp= 0
	.mask	0x80000000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	addiu	$sp,$sp,-24
	sw	$31,20($sp)
	lui	$2,%hi(g_RNG)
	lhu	$2,%lo(g_RNG)($2)
	sltu	$3,$2,13108
	bne	$3,$0,$L81
	sltu	$3,$2,30584

	bne	$3,$0,$L82
	li	$3,39322			# 0x999a

	sltu	$2,$2,$3
	bne	$2,$0,$L83
	lui	$3,%hi(GlobalPlayer)

	sll	$2,$4,3
	subu	$2,$2,$4
	sll	$2,$2,4
	subu	$2,$2,$4
	sll	$2,$2,2
	subu	$2,$2,$4
	sll	$2,$2,3
	addiu	$3,$3,%lo(GlobalPlayer)
	addu	$2,$3,$2
	lhu	$5,596($2)
	sll	$5,$5,4
	li	$2,687865856			# 0x29000000
	ori	$2,$2,0x800c
	jal	NAPlyVoiceStart
	addu	$5,$5,$2

	lw	$31,20($sp)
$L84:
	jr	$31
	addiu	$sp,$sp,24

$L81:
	lui	$3,%hi(GlobalPlayer)
	sll	$2,$4,3
	subu	$2,$2,$4
	sll	$2,$2,4
	subu	$2,$2,$4
	sll	$2,$2,2
	subu	$2,$2,$4
	sll	$2,$2,3
	addiu	$3,$3,%lo(GlobalPlayer)
	addu	$2,$3,$2
	lhu	$5,596($2)
	sll	$5,$5,4
	li	$2,687865856			# 0x29000000
	ori	$2,$2,0x8008
	jal	NAPlyVoiceStart
	addu	$5,$5,$2

	b	$L84
	lw	$31,20($sp)

$L82:
	lui	$3,%hi(GlobalPlayer)
	sll	$2,$4,3
	subu	$2,$2,$4
	sll	$2,$2,4
	subu	$2,$2,$4
	sll	$2,$2,2
	subu	$2,$2,$4
	sll	$2,$2,3
	addiu	$3,$3,%lo(GlobalPlayer)
	addu	$2,$3,$2
	lhu	$5,596($2)
	sll	$5,$5,4
	li	$2,687865856			# 0x29000000
	ori	$2,$2,0x800d
	jal	NAPlyVoiceStart
	addu	$5,$5,$2

	b	$L84
	lw	$31,20($sp)

$L83:
	sll	$2,$4,3
	subu	$2,$2,$4
	sll	$2,$2,4
	subu	$2,$2,$4
	sll	$2,$2,2
	subu	$2,$2,$4
	sll	$2,$2,3
	addiu	$3,$3,%lo(GlobalPlayer)
	addu	$2,$3,$2
	lhu	$5,596($2)
	sll	$5,$5,4
	li	$2,687865856			# 0x29000000
	ori	$2,$2,0x8001
	jal	NAPlyVoiceStart
	addu	$5,$5,$2

	b	$L84
	lw	$31,20($sp)

	.set	macro
	.set	reorder
	.end	playrandmCharacterSFX
	.size	playrandmCharacterSFX, .-playrandmCharacterSFX
	.align	2
	.globl	ProStickAngleHook
	.set	nomips16
	.set	nomicromips
	.ent	ProStickAngleHook
	.type	ProStickAngleHook, @function
ProStickAngleHook:
	.frame	$sp,24,$31		# vars= 0, regs= 1/0, args= 16, gp= 0
	.mask	0x80000000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	addiu	$sp,$sp,-24
	sw	$31,20($sp)
	lhu	$2,182($4)
	andi	$2,$2,0x2
	beq	$2,$0,$L96
	lw	$2,188($4)

	andi	$3,$2,0x10
	beq	$3,$0,$L87
	andi	$2,$2,0x12

	li	$3,18			# 0x12
	beq	$2,$3,$L87
	nop

	lw	$2,188($4)
$L96:
	andi	$3,$2,0x8
	beq	$3,$0,$L93
	andi	$2,$2,0x2

	beq	$2,$0,$L95
	lw	$31,20($sp)

	lwc1	$f2,292($4)
	lui	$2,%hi($LC3)
	lwc1	$f0,%lo($LC3)($2)
	c.le.s	$f2,$f0
	nop
	bc1f	$L95
	nop

	jal	ProStickAngle
	nop

	b	$L94
	lw	$31,20($sp)

$L87:
	jal	ProStickAngle
	nop

	lw	$31,20($sp)
$L94:
$L95:
	jr	$31
	addiu	$sp,$sp,24

$L93:
	jal	ProStickAngle
	nop

	b	$L95
	lw	$31,20($sp)

	.set	macro
	.set	reorder
	.end	ProStickAngleHook
	.size	ProStickAngleHook, .-ProStickAngleHook
	.align	2
	.globl	MasterEffect
	.set	nomips16
	.set	nomicromips
	.ent	MasterEffect
	.type	MasterEffect, @function
MasterEffect:
	.frame	$sp,24,$31		# vars= 0, regs= 1/0, args= 16, gp= 0
	.mask	0x80000000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	andi	$2,$5,0xffff
	sltu	$2,$2,7
	beq	$2,$0,$L112
	nop

	addiu	$sp,$sp,-24
	sll	$5,$5,2
	lui	$2,%hi($L100)
	addiu	$2,$2,%lo($L100)
	addu	$5,$2,$5
	lw	$2,0($5)
	jr	$2
	sw	$31,20($sp)

	.rdata
	.align	2
	.align	2
$L100:
	.word	$L106
	.word	$L105
	.word	$L104
	.word	$L103
	.word	$L102
	.word	$L101
	.word	$L99
	.text
$L106:
	sll	$4,$4,24
	jal	SetAnimMusicNote
	sra	$4,$4,24

	lw	$31,20($sp)
$L111:
	jr	$31
	addiu	$sp,$sp,24

$L105:
	sll	$4,$4,24
	jal	SetAnimCrash
	sra	$4,$4,24

	b	$L111
	lw	$31,20($sp)

$L104:
	sll	$4,$4,24
	jal	SetAnimPoomp
	sra	$4,$4,24

	b	$L111
	lw	$31,20($sp)

$L103:
	sll	$4,$4,24
	jal	SetAnimBoing
	sra	$4,$4,24

	b	$L111
	lw	$31,20($sp)

$L102:
	sll	$4,$4,24
	jal	SetAnimExplosion
	sra	$4,$4,24

	b	$L111
	lw	$31,20($sp)

$L101:
	sll	$4,$4,24
	jal	SetAnimBonkStars
	sra	$4,$4,24

	b	$L111
	lw	$31,20($sp)

$L99:
	sll	$4,$4,24
	jal	SetAnimLandingDust
	sra	$4,$4,24

	b	$L111
	lw	$31,20($sp)

$L112:
	jr	$31
	nop

	.set	macro
	.set	reorder
	.end	MasterEffect
	.size	MasterEffect, .-MasterEffect
	.align	2
	.globl	MasterStatus
	.set	nomips16
	.set	nomicromips
	.ent	MasterStatus
	.type	MasterStatus, @function
MasterStatus:
	.frame	$sp,24,$31		# vars= 0, regs= 2/0, args= 16, gp= 0
	.mask	0x80010000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	addiu	$5,$5,-7
	andi	$2,$5,0xffff
	sltu	$2,$2,17
	beq	$2,$0,$L138
	andi	$5,$5,0xffff

	addiu	$sp,$sp,-24
	sw	$31,20($sp)
	sw	$16,16($sp)
	sll	$5,$5,2
	lui	$2,%hi($L116)
	addiu	$2,$2,%lo($L116)
	addu	$5,$2,$5
	lw	$2,0($5)
	jr	$2
	move	$16,$4

	.rdata
	.align	2
	.align	2
$L116:
	.word	$L132
	.word	$L131
	.word	$L130
	.word	$L129
	.word	$L128
	.word	$L127
	.word	$L126
	.word	$L125
	.word	$L124
	.word	$L123
	.word	$L122
	.word	$L121
	.word	$L120
	.word	$L119
	.word	$L118
	.word	$L117
	.word	$L115
	.text
$L132:
	sll	$4,$4,24
	jal	SetMapObjectHit
	sra	$4,$4,24

	b	$L137
	lw	$31,20($sp)

$L131:
	sll	$4,$4,24
	jal	SetLightningHit
	sra	$4,$4,24

	b	$L137
	lw	$31,20($sp)

$L130:
	sll	$4,$4,24
	jal	SetBooTranslucent
	sra	$4,$4,24

	b	$L137
	lw	$31,20($sp)

$L129:
	li	$5,1			# 0x1
	sll	$4,$4,24
	jal	SetBecomeBomb
	sra	$4,$4,24

	b	$L137
	lw	$31,20($sp)

$L128:
	move	$5,$0
	sll	$4,$4,24
	jal	SetBecomeBomb
	sra	$4,$4,24

	b	$L137
	lw	$31,20($sp)

$L127:
	li	$5,1			# 0x1
	sll	$4,$4,24
	jal	SetFlattened
	sra	$4,$4,24

	b	$L137
	lw	$31,20($sp)

$L126:
	move	$5,$0
	sll	$4,$4,24
	jal	SetFlattened
	sra	$4,$4,24

	b	$L137
	lw	$31,20($sp)

$L125:
	sll	$4,$4,24
	jal	SetMushroomBoost
	sra	$4,$4,24

	b	$L137
	lw	$31,20($sp)

$L124:
	sll	$4,$4,24
	jal	SetSpinOutSaveable
	sra	$4,$4,24

	b	$L137
	lw	$31,20($sp)

$L123:
	sll	$4,$4,24
	jal	SetSpinOut
	sra	$4,$4,24

	b	$L137
	lw	$31,20($sp)

$L122:
	sll	$4,$4,24
	jal	SetGreenShellHit
	sra	$4,$4,24

	b	$L137
	lw	$31,20($sp)

$L121:
	sll	$4,$4,24
	jal	SetRedShellHit
	sra	$4,$4,24

	b	$L137
	lw	$31,20($sp)

$L120:
	sll	$4,$4,24
	jal	SetBonk
	sra	$4,$4,24

	b	$L137
	lw	$31,20($sp)

$L119:
	li	$5,1			# 0x1
	sll	$4,$4,24
	jal	SetStarMan
	sra	$4,$4,24

$L117:
	move	$5,$0
	sll	$4,$16,24
	jal	SetStarMan
	sra	$4,$4,24

$L118:
	li	$5,1			# 0x1
	sll	$4,$16,24
	jal	SetGhostEffect
	sra	$4,$4,24

$L115:
	move	$5,$0
	sll	$4,$16,24
	jal	SetGhostEffect
	sra	$4,$4,24

	lw	$31,20($sp)
$L137:
	lw	$16,16($sp)
	jr	$31
	addiu	$sp,$sp,24

$L138:
	jr	$31
	nop

	.set	macro
	.set	reorder
	.end	MasterStatus
	.size	MasterStatus, .-MasterStatus
	.section	.rodata.cst4,"aM",@progbits,4
	.align	2
$LC0:
	.word	1091567616
	.align	2
$LC1:
	.word	1086324736
	.align	2
$LC2:
	.word	1085276160
	.align	2
$LC3:
	.word	1084227584
	.ident	"GCC: (GNU) 10.1.0"
