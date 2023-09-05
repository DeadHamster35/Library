	.file	1 "CustomSounds.c"
	.section .mdebug.abi32
	.previous
	.nan	legacy
	.module	fp=32
	.module	nooddspreg
	.text
	.align	2
	.globl	SetCustomSFXData
	.set	nomips16
	.set	nomicromips
	.ent	SetCustomSFXData
	.type	SetCustomSFXData, @function
SetCustomSFXData:
	.frame	$sp,0,$31		# vars= 0, regs= 0/0, args= 0, gp= 0
	.mask	0x00000000,0
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	lui	$2,%hi(g_sfxPointer)
	lw	$2,%lo(g_sfxPointer)($2)
	sll	$4,$4,2
	lw	$2,4($2)
	addu	$4,$4,$2
	lui	$2,%hi(GlobalAddressA)
	sw	$4,%lo(GlobalAddressA)($2)
	lw	$3,0($4)
	lui	$4,%hi(GlobalAddressB)
	sw	$3,%lo(GlobalAddressB)($4)
	addiu	$8,$3,16
	lui	$4,%hi(GlobalAddressC)
	sw	$8,%lo(GlobalAddressC)($4)
	lw	$3,16($3)
	sw	$3,%lo(GlobalAddressA)($2)
	sw	$5,4($3)
	lw	$3,%lo(GlobalAddressA)($2)
	sw	$6,8($3)
	lw	$2,%lo(GlobalAddressA)($2)
	jr	$31
	sw	$7,12($2)

	.set	macro
	.set	reorder
	.end	SetCustomSFXData
	.size	SetCustomSFXData, .-SetCustomSFXData
	.align	2
	.globl	PlayCustomSound
	.set	nomips16
	.set	nomicromips
	.ent	PlayCustomSound
	.type	PlayCustomSound, @function
PlayCustomSound:
	.frame	$sp,24,$31		# vars= 0, regs= 1/0, args= 16, gp= 0
	.mask	0x80000000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	addiu	$sp,$sp,-24
	sw	$31,20($sp)
	li	$6,-2143354880			# 0xffffffff803f0000
	addiu	$7,$6,26928
	addiu	$6,$6,27008
	li	$5,11337728			# 0xad0000
	ori	$5,$5,0xe1c0
	jal	SetCustomSFXData
	li	$4,122			# 0x7a

	li	$4,1224736768			# 0x49000000
	jal	playSound
	ori	$4,$4,0x8026

	lw	$31,20($sp)
	jr	$31
	addiu	$sp,$sp,24

	.set	macro
	.set	reorder
	.end	PlayCustomSound
	.size	PlayCustomSound, .-PlayCustomSound
	.align	2
	.globl	isAnyPlayerNear
	.set	nomips16
	.set	nomicromips
	.ent	isAnyPlayerNear
	.type	isAnyPlayerNear, @function
isAnyPlayerNear:
	.frame	$sp,72,$31		# vars= 8, regs= 8/2, args= 24, gp= 0
	.mask	0x807f0000,-12
	.fmask	0x00300000,-8
	.set	noreorder
	.set	nomacro
	addiu	$sp,$sp,-72
	sw	$31,60($sp)
	sw	$22,56($sp)
	sw	$21,52($sp)
	sw	$20,48($sp)
	sw	$19,44($sp)
	sw	$18,40($sp)
	sw	$17,36($sp)
	sw	$16,32($sp)
	sdc1	$f20,64($sp)
	move	$20,$4
	mtc1	$5,$f20
	lui	$16,%hi(GlobalPlayer)
	addiu	$16,$16,%lo(GlobalPlayer)
	addiu	$19,$sp,24
	addiu	$18,$16,14176
	li	$17,16384			# 0x4000
	li	$21,1			# 0x1
	b	$L7
	li	$22,1			# 0x1

$L15:
$L5:
	addiu	$16,$16,3544
$L16:
	beq	$16,$18,$L14
	addiu	$19,$19,1

$L7:
	lhu	$2,0($16)
	andi	$2,$2,0x4100
	bnel	$2,$17,$L16
	addiu	$16,$16,3544

	swc1	$f20,16($sp)
	lw	$7,8($20)
	lw	$6,0($20)
	lwc1	$f14,28($16)
	jal	KWCheckRadiusXZ
	lwc1	$f12,20($16)

	beql	$2,$21,$L15
	sb	$22,0($19)

	b	$L5
	sb	$0,0($19)

$L14:
	lb	$3,24($sp)
	li	$2,1			# 0x1
	beq	$3,$2,$L9
	lb	$3,25($sp)

	beq	$3,$2,$L10
	lb	$3,26($sp)

	beq	$3,$2,$L18
	lw	$31,60($sp)

	lb	$2,27($sp)
	xori	$2,$2,0x1
	sltu	$2,$2,1
$L8:
	lw	$31,60($sp)
$L18:
	lw	$22,56($sp)
	lw	$21,52($sp)
	lw	$20,48($sp)
	lw	$19,44($sp)
	lw	$18,40($sp)
	lw	$17,36($sp)
	lw	$16,32($sp)
	ldc1	$f20,64($sp)
	jr	$31
	addiu	$sp,$sp,72

$L9:
	b	$L8
	li	$2,1			# 0x1

$L10:
	b	$L8
	li	$2,1			# 0x1

	.set	macro
	.set	reorder
	.end	isAnyPlayerNear
	.size	isAnyPlayerNear, .-isAnyPlayerNear
	.align	2
	.globl	LevelSoundDistanceCheck
	.set	nomips16
	.set	nomicromips
	.ent	LevelSoundDistanceCheck
	.type	LevelSoundDistanceCheck, @function
LevelSoundDistanceCheck:
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
	lui	$2,%hi(g_startingIndicator)
	lw	$3,%lo(g_startingIndicator)($2)
	li	$2,1			# 0x1
	beq	$3,$2,$L40
	lui	$16,%hi(SFX)

$L48:
	addiu	$16,$16,%lo(SFX)
	lui	$17,%hi(FireParticleAllocArray)
	addiu	$17,$17,%lo(FireParticleAllocArray)
	lui	$18,%hi(isPlaying)
	addiu	$18,$18,%lo(isPlaying)
	lui	$19,%hi(SFX_rad)
	addiu	$19,$19,%lo(SFX_rad)
	lui	$20,%hi(SFX_global)
	addiu	$20,$20,%lo(SFX_global)
	addiu	$23,$16,32
	lui	$22,%hi(g_startingIndicator)
	lui	$fp,%hi(g_DynamicObjects)
	addiu	$fp,$fp,%lo(g_DynamicObjects)
	li	$21,16777216			# 0x1000000
	ori	$2,$21,0xff2c
	sw	$2,20($sp)
	lui	$2,%hi(g_playerCount)
	sw	$2,24($sp)
	lui	$2,%hi(ZeroVector)
	addiu	$2,$2,%lo(ZeroVector)
	b	$L34
	sw	$2,28($sp)

$L40:
	lui	$2,%hi(isPlaying)
	addiu	$2,$2,%lo(isPlaying)
	addiu	$3,$2,50
	sb	$0,0($2)
$L51:
	addiu	$2,$2,1
	bnel	$2,$3,$L51
	sb	$0,0($2)

	b	$L48
	lui	$16,%hi(SFX)

$L44:
	jal	NaPlyLevelStart
	move	$4,$0

	b	$L49
	addiu	$16,$16,4

$L23:
	lw	$5,0($16)
	lw	$2,20($sp)
	beq	$5,$2,$L25
	ori	$2,$21,0xff2d

	slt	$2,$5,$2
	beq	$2,$0,$L26
	li	$2,1359020032			# 0x51010000

	ori	$2,$21,0xf81d
	beq	$5,$2,$L25
	ori	$2,$21,0xf81e

	slt	$2,$5,$2
	bne	$2,$0,$L41
	ori	$2,$21,0xfa4c

	beq	$5,$2,$L25
	ori	$2,$21,0xfa4d

	slt	$2,$5,$2
	bne	$2,$0,$L42
	ori	$2,$21,0xfe1c

	beql	$5,$2,$L50
	lb	$3,0($20)

$L22:
	addiu	$16,$16,4
$L49:
	addiu	$17,$17,4
	addiu	$18,$18,1
	addiu	$19,$19,4
	beq	$16,$23,$L43
	addiu	$20,$20,1

$L34:
	lw	$2,%lo(g_startingIndicator)($22)
	slt	$2,$2,2
	bnel	$2,$0,$L49
	addiu	$16,$16,4

	sw	$17,16($sp)
	lw	$2,0($17)
	sll	$4,$2,3
	subu	$4,$4,$2
	sll	$4,$4,5
	addiu	$4,$4,16
	lw	$5,0($19)
	jal	isAnyPlayerNear
	addu	$4,$fp,$4

	beql	$2,$0,$L23
	sb	$0,0($18)

	lb	$2,0($18)
	bnel	$2,$0,$L49
	addiu	$16,$16,4

	li	$2,1			# 0x1
	sb	$2,0($18)
	lb	$3,0($20)
	li	$2,1			# 0x1
	bne	$3,$2,$L24
	lw	$2,24($sp)

	lw	$3,%lo(g_playerCount)($2)
	li	$2,1			# 0x1
	beql	$3,$2,$L44
	lw	$5,0($16)

$L24:
	lw	$2,16($sp)
	lw	$2,0($2)
	sll	$4,$2,3
	subu	$4,$4,$2
	sll	$4,$4,5
	addiu	$4,$4,16
	lw	$6,0($16)
	lw	$5,28($sp)
	jal	NaSceneLevelStart
	addu	$4,$fp,$4

	b	$L49
	addiu	$16,$16,4

$L41:
	ori	$2,$21,0x8046
	beq	$5,$2,$L25
	li	$2,-16842752			# 0xfffffffffeff0000

	addiu	$2,$2,4064
	addu	$2,$5,$2
	sltu	$3,$2,6
	beq	$3,$0,$L22
	li	$3,1			# 0x1

	sll	$2,$3,$2
	andi	$2,$2,0x29
	bnel	$2,$0,$L50
	lb	$3,0($20)

	b	$L49
	addiu	$16,$16,4

$L42:
	ori	$2,$21,0xf822
	beq	$5,$2,$L25
	ori	$2,$21,0xfa28

	bnel	$5,$2,$L49
	addiu	$16,$16,4

	b	$L50
	lb	$3,0($20)

$L26:
	ori	$2,$2,0xc00c
	beq	$5,$2,$L25
	li	$2,1359020032			# 0x51010000

	ori	$2,$2,0xc00d
	slt	$2,$5,$2
	bne	$2,$0,$L45
	li	$2,1359151104			# 0x51030000

	addiu	$2,$2,28683
	beq	$5,$2,$L25
	li	$2,1359151104			# 0x51030000

	addiu	$2,$2,28684
	slt	$2,$5,$2
	bne	$2,$0,$L46
	li	$2,1359151104			# 0x51030000

	ori	$2,$2,0x8007
	bnel	$5,$2,$L49
	addiu	$16,$16,4

	b	$L50
	lb	$3,0($20)

$L45:
	li	$2,24117248			# 0x1700000
	ori	$2,$2,0x802d
	beq	$5,$2,$L25
	li	$2,-1359085568			# 0xffffffffaefe0000

	ori	$2,$2,0x8000
	addu	$2,$5,$2
	sltu	$3,$2,9
	beq	$3,$0,$L22
	li	$3,1			# 0x1

	sll	$2,$3,$2
	andi	$2,$2,0x13d
	beql	$2,$0,$L49
	addiu	$16,$16,4

$L25:
	lb	$3,0($20)
$L50:
	li	$2,1			# 0x1
	bne	$3,$2,$L33
	lw	$2,24($sp)

	lw	$3,%lo(g_playerCount)($2)
	li	$2,1			# 0x1
	beq	$3,$2,$L47
	nop

$L33:
	lw	$2,16($sp)
	lw	$2,0($2)
	sll	$4,$2,3
	subu	$4,$4,$2
	sll	$4,$4,5
	addiu	$4,$4,16
	jal	NaSceneLevelStop
	addu	$4,$fp,$4

	b	$L49
	addiu	$16,$16,4

$L46:
	li	$2,1359085568			# 0x51020000
	ori	$2,$2,0x8001
	beq	$5,$2,$L25
	li	$2,1359085568			# 0x51020000

	ori	$2,$2,0x8006
	bnel	$5,$2,$L49
	addiu	$16,$16,4

	b	$L50
	lb	$3,0($20)

$L47:
	jal	NaPlyLevelStop
	move	$4,$0

	b	$L49
	addiu	$16,$16,4

$L43:
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
	.end	LevelSoundDistanceCheck
	.size	LevelSoundDistanceCheck, .-LevelSoundDistanceCheck
	.align	2
	.globl	MapDelayInit
	.set	nomips16
	.set	nomicromips
	.ent	MapDelayInit
	.type	MapDelayInit, @function
MapDelayInit:
	.frame	$sp,24,$31		# vars= 0, regs= 1/0, args= 16, gp= 0
	.mask	0x80000000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	lui	$2,%hi(HotSwapID)
	lh	$2,%lo(HotSwapID)($2)
	beq	$2,$0,$L58
	nop

	jr	$31
	nop

$L58:
	addiu	$sp,$sp,-24
	sw	$31,20($sp)
	jal	DelayInitialMap
	nop

	lw	$31,20($sp)
	jr	$31
	addiu	$sp,$sp,24

	.set	macro
	.set	reorder
	.end	MapDelayInit
	.size	MapDelayInit, .-MapDelayInit
	.align	2
	.globl	SetLevelSounds
	.set	nomips16
	.set	nomicromips
	.ent	SetLevelSounds
	.type	SetLevelSounds, @function
SetLevelSounds:
	.frame	$sp,24,$31		# vars= 0, regs= 1/0, args= 16, gp= 0
	.mask	0x80000000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	addiu	$sp,$sp,-24
	sw	$31,20($sp)
	jal	LevelSoundDistanceCheck
	nop

	lw	$31,20($sp)
	jr	$31
	addiu	$sp,$sp,24

	.set	macro
	.set	reorder
	.end	SetLevelSounds
	.size	SetLevelSounds, .-SetLevelSounds
	.align	2
	.globl	PlayStarMusicHook
	.set	nomips16
	.set	nomicromips
	.ent	PlayStarMusicHook
	.type	PlayStarMusicHook, @function
PlayStarMusicHook:
	.frame	$sp,24,$31		# vars= 0, regs= 1/0, args= 16, gp= 0
	.mask	0x80000000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	addiu	$sp,$sp,-24
	sw	$31,20($sp)
	li	$5,17301504			# 0x1080000
	ori	$5,$5,0xff2c
	sll	$4,$4,24
	jal	NaPlyLevelStart
	sra	$4,$4,24

	lw	$31,20($sp)
	jr	$31
	addiu	$sp,$sp,24

	.set	macro
	.set	reorder
	.end	PlayStarMusicHook
	.size	PlayStarMusicHook, .-PlayStarMusicHook
	.align	2
	.globl	StopStarMusicHook
	.set	nomips16
	.set	nomicromips
	.ent	StopStarMusicHook
	.type	StopStarMusicHook, @function
StopStarMusicHook:
	.frame	$sp,24,$31		# vars= 0, regs= 1/0, args= 16, gp= 0
	.mask	0x80000000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	addiu	$sp,$sp,-24
	sw	$31,20($sp)
	li	$5,17301504			# 0x1080000
	ori	$5,$5,0xff2c
	sll	$4,$4,24
	jal	NaPlyLevelStop
	sra	$4,$4,24

	lw	$31,20($sp)
	jr	$31
	addiu	$sp,$sp,24

	.set	macro
	.set	reorder
	.end	StopStarMusicHook
	.size	StopStarMusicHook, .-StopStarMusicHook
	.align	2
	.globl	PlayFinalLapMusicHook
	.set	nomips16
	.set	nomicromips
	.ent	PlayFinalLapMusicHook
	.type	PlayFinalLapMusicHook, @function
PlayFinalLapMusicHook:
	.frame	$sp,24,$31		# vars= 0, regs= 1/0, args= 16, gp= 0
	.mask	0x80000000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	addiu	$sp,$sp,-24
	sw	$31,20($sp)
	li	$5,419954688			# 0x19080000
	ori	$5,$5,0xff3a
	sll	$4,$4,24
	jal	NaPlyLevelStart
	sra	$4,$4,24

	li	$6,150			# 0x96
	li	$5,125			# 0x7d
	jal	MusSeqTempoPercent
	move	$4,$0

	lw	$31,20($sp)
	jr	$31
	addiu	$sp,$sp,24

	.set	macro
	.set	reorder
	.end	PlayFinalLapMusicHook
	.size	PlayFinalLapMusicHook, .-PlayFinalLapMusicHook
	.globl	SFX_global
	.data
	.align	2
	.type	SFX_global, @object
	.size	SFX_global, 8
SFX_global:
	.ascii	"\000\000\000\001\001\000\001\000"
	.globl	SFX_rad
	.align	2
	.type	SFX_rad, @object
	.size	SFX_rad, 32
SFX_rad:
	.word	1120403456
	.word	1117126656
	.word	1133903872
	.word	1117126656
	.word	1112014848
	.word	1120403456
	.word	1120403456
	.word	1133903872
	.globl	SFX
	.align	2
	.type	SFX, @object
	.size	SFX, 32
SFX:
	.word	419524668
	.word	419467343
	.word	1359118342
	.word	419467345
	.word	419524675
	.word	419459145
	.word	419471430
	.word	1359052808
	.globl	isPlaying
	.section	.bss,"aw",@nobits
	.align	2
	.type	isPlaying, @object
	.size	isPlaying, 50
isPlaying:
	.space	50
	.ident	"GCC: (GNU) 10.1.0"
