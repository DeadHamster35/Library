	.file	1 "PlayerChecks.c"
	.section .mdebug.abi32
	.previous
	.nan	legacy
	.module	fp=32
	.module	nooddspreg
	.text
	.align	2
	.globl	CheckSplashRepl
	.set	nomips16
	.set	nomicromips
	.ent	CheckSplashRepl
	.type	CheckSplashRepl, @function
CheckSplashRepl:
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
	move	$21,$4
	lui	$17,%hi(GlobalPlayer)
	addiu	$17,$17,%lo(GlobalPlayer)
	lui	$19,%hi(g_waterlevelPlayer)
	addiu	$19,$19,%lo(g_waterlevelPlayer)
	lui	$20,%hi(CustomWaterHeight)
	addiu	$20,$20,%lo(CustomWaterHeight)
	move	$16,$0
	lui	$22,%hi(g_gamePausedFlag)
	lui	$23,%hi($LC0)
	lwc1	$f20,%lo($LC0)($23)
	lui	$fp,%hi(g_courseID)
	lui	$2,%hi(HotSwapID)
	b	$L29
	sw	$2,16($sp)

$L44:
	jal	CheckWaterLevel
	move	$4,$17

	b	$L3
	swc1	$f0,0($19)

$L45:
	lh	$2,%lo(HotSwapID)($2)
	bne	$2,$0,$L54
	lwc1	$f0,0($19)

	b	$L64
	lwc1	$f2,24($18)

$L36:
	b	$L8
	andi	$2,$2,0xfffd

$L37:
	c.lt.s	$f2,$f0
	nop
	bc1t	$L11
	sh	$2,222($18)

	lh	$3,%lo(g_courseID)($fp)
$L53:
	li	$2,6			# 0x6
$L59:
	beql	$3,$2,$L55
	lhu	$2,222($18)

$L5:
	lwc1	$f0,0($19)
$L54:
	lwc1	$f2,24($18)
	sub.s	$f0,$f0,$f2
	lwc1	$f2,112($18)
	c.lt.s	$f2,$f0
	nop
	bc1tl	$L56
	lwc1	$f2,292($18)

	lwc1	$f0,292($18)
$L61:
	c.le.s	$f20,$f0
	nop
	bc1tl	$L57
	lhu	$2,202($18)

	lw	$2,188($18)
	andi	$2,$2,0x8
	beql	$2,$0,$L58
	lhu	$2,0($18)

	lhu	$2,202($18)
	andi	$2,$2,0xfeff
	b	$L25
	sh	$2,202($18)

$L46:
	ori	$5,$5,0x801c
	jal	NAPlyTrgStart
	move	$4,$16

	b	$L49
	lw	$2,16($sp)

$L63:
	ori	$5,$5,0x8008
	jal	NAPlyTrgStart
	move	$4,$16

	lw	$2,16($sp)
$L49:
	lh	$2,%lo(HotSwapID)($2)
	blez	$2,$L53
	lh	$3,%lo(g_courseID)($fp)

	lhu	$2,0($18)
	andi	$2,$2,0x4000
	beq	$2,$0,$L59
	li	$2,6			# 0x6

	b	$L50
	lhu	$5,596($18)

$L15:
	lhu	$2,222($18)
$L55:
	andi	$2,$2,0xfff7
	b	$L5
	sh	$2,222($18)

$L42:
	jal	OoBCheck
	lhu	$4,282($18)

	bne	$2,$0,$L60
	lhu	$2,202($18)

	andi	$2,$2,0x1
	beql	$2,$0,$L52
	lhu	$2,0($18)

	lhu	$2,202($18)
$L60:
	andi	$2,$2,0xa
	bnel	$2,$0,$L52
	lhu	$2,0($18)

	lw	$2,188($18)
	andi	$2,$2,0x1000
	beq	$2,$0,$L41
	nop

	lhu	$2,0($18)
$L52:
	andi	$2,$2,0x1000
	beq	$2,$0,$L26
	li	$2,253			# 0xfd

	lhu	$3,248($18)
	bne	$3,$2,$L51
	move	$5,$16

	lw	$2,188($18)
	andi	$2,$2,0x8
	bne	$2,$0,$L51
	nop

	jal	SetLakitu
	move	$4,$18

	jal	CallLakitu
	move	$4,$18

	b	$L51
	move	$5,$16

$L41:
	jal	SetLakitu
	move	$4,$18

	jal	CallLakitu
	move	$4,$18

	b	$L52
	lhu	$2,0($18)

$L14:
	li	$2,6			# 0x6
	beql	$3,$2,$L55
	lhu	$2,222($18)

	lwc1	$f2,292($18)
$L56:
	lwc1	$f0,%lo($LC0)($23)
	c.le.s	$f0,$f2
	nop
	bc1fl	$L61
	lwc1	$f0,292($18)

	lhu	$2,202($18)
	ori	$2,$2,0x1
	sh	$2,202($18)
	lhu	$2,202($18)
$L57:
	ori	$2,$2,0x100
	sh	$2,202($18)
$L25:
	lhu	$2,0($18)
$L58:
	andi	$2,$2,0x1000
	bne	$2,$0,$L42
	nop

$L26:
	move	$5,$16
$L51:
	jal	LakituCheck
	move	$4,$18

$L2:
	addiu	$16,$16,1
$L62:
	sll	$16,$16,24
	sra	$16,$16,24
	addiu	$17,$17,3544
	addiu	$19,$19,4
	li	$2,8			# 0x8
	beq	$16,$2,$L43
	addiu	$20,$20,1

$L29:
	lh	$2,0($17)
	bgez	$2,$L2
	move	$18,$17

	lb	$2,%lo(g_gamePausedFlag)($22)
	bnel	$2,$0,$L62
	addiu	$16,$16,1

	lbu	$2,0($20)
	beq	$2,$0,$L44
	nop

$L3:
	li	$2,1			# 0x1
	beq	$21,$2,$L45
	lw	$2,16($sp)

	lwc1	$f0,0($19)
	lwc1	$f2,24($18)
$L64:
	c.le.s	$f2,$f0
	nop
	bc1f	$L36
	lhu	$2,222($18)

	ori	$2,$2,0x2
$L8:
	sub.s	$f0,$f0,$f2
	lwc1	$f2,112($18)
	c.lt.s	$f2,$f0
	nop
	bc1fl	$L37
	andi	$2,$2,0xfffe

	andi	$2,$2,0xfffd
	ori	$2,$2,0x1
	sh	$2,222($18)
$L11:
	andi	$3,$2,0x4
	bne	$3,$0,$L14
	lh	$3,%lo(g_courseID)($fp)

	ori	$2,$2,0xc
	sh	$2,222($18)
	lh	$2,%lo(g_courseID)($fp)
	li	$3,6			# 0x6
	beq	$2,$3,$L15
	li	$3,16			# 0x10

	beq	$2,$3,$L5
	li	$3,13			# 0xd

	beql	$2,$3,$L54
	lwc1	$f0,0($19)

	lhu	$2,0($18)
	andi	$2,$2,0x4000
	beql	$2,$0,$L54
	lwc1	$f0,0($19)

	li	$2,2			# 0x2
	beq	$21,$2,$L46
	li	$5,419430400			# 0x19000000

	li	$2,1			# 0x1
	bne	$21,$2,$L63
	lw	$2,16($sp)

	lh	$2,%lo(HotSwapID)($2)
	blezl	$2,$L54
	lwc1	$f0,0($19)

	lhu	$5,596($18)
$L50:
	sll	$5,$5,4
	li	$2,687865856			# 0x29000000
	ori	$2,$2,0x8004
	addu	$5,$5,$2
	jal	NAPlyTrgStart
	move	$4,$16

	b	$L53
	lh	$3,%lo(g_courseID)($fp)

$L43:
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
	ldc1	$f20,64($sp)
	jr	$31
	addiu	$sp,$sp,72

	.set	macro
	.set	reorder
	.end	CheckSplashRepl
	.size	CheckSplashRepl, .-CheckSplashRepl
	.align	2
	.globl	SetWaterType
	.set	nomips16
	.set	nomicromips
	.ent	SetWaterType
	.type	SetWaterType, @function
SetWaterType:
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
	li	$2,3			# 0x3
	beq	$4,$2,$L89
	move	$16,$4

	lui	$3,%hi(LakituIceBehavior)
	lw	$2,%lo(LakituIceBehavior)($3)
	li	$4,-65536			# 0xffffffffffff0000
	and	$2,$2,$4
	addiu	$2,$2,12
	sw	$2,%lo(LakituIceBehavior)($3)
	lui	$2,%hi(g_startingIndicator)
	lw	$2,%lo(g_startingIndicator)($2)
	addiu	$2,$2,-1
	sltu	$2,$2,6
	bne	$2,$0,$L90
	nop

$L65:
	lw	$31,44($sp)
$L100:
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

$L89:
	lui	$2,%hi(HotSwapID)
	lh	$2,%lo(HotSwapID)($2)
	beq	$2,$0,$L67
	lui	$3,%hi(LakituIceBehavior)

	lw	$2,%lo(LakituIceBehavior)($3)
	li	$4,-65536			# 0xffffffffffff0000
	and	$2,$2,$4
	sw	$2,%lo(LakituIceBehavior)($3)
	lui	$2,%hi(g_startingIndicator)
	lw	$2,%lo(g_startingIndicator)($2)
	addiu	$2,$2,-1
	sltu	$2,$2,6
	beq	$2,$0,$L100
	lw	$31,44($sp)

	jal	CheckSplashRepl
	li	$4,3			# 0x3

	lui	$2,%hi(HotSwapID)
$L95:
	lh	$2,%lo(HotSwapID)($2)
	beq	$2,$0,$L100
	lw	$31,44($sp)

	lui	$18,%hi(GlobalPlayer)
	addiu	$18,$18,%lo(GlobalPlayer)
	lui	$19,%hi(g_waterlevelPlayer)
	addiu	$19,$19,%lo(g_waterlevelPlayer)
	move	$17,$0
	lui	$20,%hi(g_gamePausedFlag)
	move	$21,$18
	lui	$2,%hi($LC1)
	b	$L81
	lwc1	$f20,%lo($LC1)($2)

$L90:
	jal	CheckSplashRepl
	move	$4,$16

	beq	$16,$0,$L100
	lw	$31,44($sp)

	b	$L95
	lui	$2,%hi(HotSwapID)

$L71:
	lwc1	$f0,0($19)
	lwc1	$f2,24($18)
	sub.s	$f0,$f0,$f2
	lwc1	$f2,112($18)
	c.lt.s	$f2,$f0
	nop
	bc1t	$L91
	move	$2,$18

	lhu	$2,202($21)
$L97:
	andi	$2,$2,0x2
	beql	$2,$0,$L96
	addiu	$17,$17,1

	move	$5,$0
	jal	SetAnimWaterDrip
	move	$4,$0

	b	$L96
	addiu	$17,$17,1

$L91:
	addiu	$3,$18,720
	sh	$0,628($2)
$L101:
	sh	$0,2068($2)
	sh	$0,1348($2)
	sh	$0,2788($2)
	addiu	$2,$2,72
	bnel	$2,$3,$L101
	sh	$0,628($2)

	b	$L97
	lhu	$2,202($21)

$L76:
$L98:
	andi	$2,$2,0x3
	bne	$2,$0,$L92
	li	$5,1			# 0x1

	lhu	$2,222($22)
$L99:
	andi	$2,$2,0x4
	bne	$2,$0,$L93
	move	$2,$18

$L70:
	addiu	$17,$17,1
$L96:
	sll	$17,$17,24
	sra	$17,$17,24
	addiu	$18,$18,3544
	li	$2,8			# 0x8
	beq	$17,$2,$L65
	addiu	$19,$19,4

$L81:
	lh	$2,0($18)
	bgez	$2,$L70
	move	$22,$18

	lb	$2,%lo(g_gamePausedFlag)($20)
	bnel	$2,$0,$L96
	addiu	$17,$17,1

	li	$2,1			# 0x1
	beq	$16,$2,$L71
	li	$2,2			# 0x2

	bnel	$16,$2,$L96
	addiu	$17,$17,1

	lhu	$2,202($18)
	andi	$3,$2,0x100
	beql	$3,$0,$L98
	lhu	$2,222($22)

	andi	$2,$2,0x3
	bnel	$2,$0,$L98
	lhu	$2,222($22)

	lw	$2,188($18)
	andi	$2,$2,0x200
	bnel	$2,$0,$L76
	lhu	$2,222($22)

	mfc1	$7,$f20
	li	$6,16448			# 0x4040
	li	$5,3407872			# 0x340000
	jal	SetPlayerColor
	move	$4,$17

	b	$L98
	lhu	$2,222($22)

$L92:
	jal	SetAnimSmoking
	move	$4,$17

	b	$L99
	lhu	$2,222($22)

$L93:
	li	$7,5			# 0x5
	li	$9,3			# 0x3
	li	$5,255			# 0xff
	li	$8,63			# 0x3f
	b	$L80
	addiu	$6,$18,720

$L94:
	sh	$0,658($2)
	sh	$0,660($2)
	sh	$5,662($2)
$L79:
	addiu	$2,$2,72
$L102:
	beql	$2,$6,$L96
	addiu	$17,$17,1

$L80:
	lhu	$3,618($2)
	beql	$3,$7,$L94
	sh	$5,656($2)

	bnel	$3,$9,$L102
	addiu	$2,$2,72

	sh	$5,656($2)
	sh	$8,658($2)
	sh	$8,660($2)
	b	$L79
	sh	$5,662($2)

$L67:
	lw	$2,%lo(LakituIceBehavior)($3)
	li	$4,-65536			# 0xffffffffffff0000
	and	$2,$2,$4
	addiu	$2,$2,12
	sw	$2,%lo(LakituIceBehavior)($3)
	lui	$2,%hi(g_startingIndicator)
	lw	$2,%lo(g_startingIndicator)($2)
	addiu	$2,$2,-1
	sltu	$2,$2,6
	beq	$2,$0,$L100
	lw	$31,44($sp)

	jal	CheckSplashRepl
	move	$4,$16

	b	$L95
	lui	$2,%hi(HotSwapID)

	.set	macro
	.set	reorder
	.end	SetWaterType
	.size	SetWaterType, .-SetWaterType
	.align	2
	.globl	NopSplashCheckCode
	.set	nomips16
	.set	nomicromips
	.ent	NopSplashCheckCode
	.type	NopSplashCheckCode, @function
NopSplashCheckCode:
	.frame	$sp,0,$31		# vars= 0, regs= 0/0, args= 0, gp= 0
	.mask	0x00000000,0
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	lui	$2,%hi(CheckSplashJAL1)
	sw	$0,%lo(CheckSplashJAL1)($2)
	lui	$2,%hi(CheckSplashJAL2)
	sw	$0,%lo(CheckSplashJAL2)($2)
	lui	$2,%hi(CheckSplashJAL3)
	jr	$31
	sw	$0,%lo(CheckSplashJAL3)($2)

	.set	macro
	.set	reorder
	.end	NopSplashCheckCode
	.size	NopSplashCheckCode, .-NopSplashCheckCode
	.align	2
	.globl	EffectBGMReplace
	.set	nomips16
	.set	nomicromips
	.ent	EffectBGMReplace
	.type	EffectBGMReplace, @function
EffectBGMReplace:
	.frame	$sp,56,$31		# vars= 0, regs= 10/0, args= 16, gp= 0
	.mask	0xc0ff0000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	addiu	$sp,$sp,-56
	sw	$31,52($sp)
	sw	$fp,48($sp)
	sw	$23,44($sp)
	sw	$22,40($sp)
	sw	$21,36($sp)
	sw	$20,32($sp)
	sw	$19,28($sp)
	sw	$18,24($sp)
	sw	$17,20($sp)
	sw	$16,16($sp)
	lui	$2,%hi(g_startingIndicator)
	lw	$2,%lo(g_startingIndicator)($2)
	slt	$3,$2,3
	beql	$3,$0,$L105
	li	$3,3			# 0x3

	lui	$2,%hi(EffectStarBGM)
	addiu	$2,$2,%lo(EffectStarBGM)
	lui	$4,%hi(EffectFinalLapBGM)
	addiu	$4,$4,%lo(EffectFinalLapBGM)
	lui	$3,%hi(FinalLapAnim)
	addiu	$3,$3,%lo(FinalLapAnim)
	addiu	$5,$2,4
$L106:
	sb	$0,0($2)
	sb	$0,0($4)
	sb	$0,0($3)
	addiu	$2,$2,1
	addiu	$4,$4,1
	bne	$2,$5,$L106
	addiu	$3,$3,1

	lui	$2,%hi(FinalLapActive)
	sb	$0,%lo(FinalLapActive)($2)
$L108:
	lui	$2,%hi(g_gameMode)
	lw	$3,%lo(g_gameMode)($2)
	li	$2,3			# 0x3
	beq	$3,$2,$L138
	lui	$2,%hi(g_playerCount)

	lw	$31,52($sp)
$L152:
	lw	$fp,48($sp)
$L156:
	lw	$23,44($sp)
	lw	$22,40($sp)
	lw	$21,36($sp)
	lw	$20,32($sp)
	lw	$19,28($sp)
	lw	$18,24($sp)
	lw	$17,20($sp)
	lw	$16,16($sp)
	jr	$31
	addiu	$sp,$sp,56

$L105:
	bne	$2,$3,$L108
	lui	$2,%hi(EffectStarBGM)

	lbu	$2,%lo(EffectStarBGM)($2)
	bne	$2,$0,$L153
	lui	$2,%hi(g_musicUserVolumeFlag)

	lui	$2,%hi(EffectStarBGM+1)
	lbu	$2,%lo(EffectStarBGM+1)($2)
	bne	$2,$0,$L153
	lui	$2,%hi(g_musicUserVolumeFlag)

	lui	$2,%hi(EffectStarBGM+2)
	lbu	$2,%lo(EffectStarBGM+2)($2)
	bne	$2,$0,$L153
	lui	$2,%hi(g_musicUserVolumeFlag)

	lui	$2,%hi(EffectStarBGM+3)
	lbu	$2,%lo(EffectStarBGM+3)($2)
	bne	$2,$0,$L153
	lui	$2,%hi(g_musicUserVolumeFlag)

	lui	$2,%hi(FinalLapAnim)
	lbu	$2,%lo(FinalLapAnim)($2)
	bne	$2,$0,$L153
	lui	$2,%hi(g_musicUserVolumeFlag)

	lui	$2,%hi(FinalLapAnim+1)
	lbu	$2,%lo(FinalLapAnim+1)($2)
	bne	$2,$0,$L153
	lui	$2,%hi(g_musicUserVolumeFlag)

	lui	$2,%hi(FinalLapAnim+2)
	lbu	$2,%lo(FinalLapAnim+2)($2)
	bne	$2,$0,$L153
	lui	$2,%hi(g_musicUserVolumeFlag)

	lui	$2,%hi(FinalLapAnim+3)
	lbu	$2,%lo(FinalLapAnim+3)($2)
	beq	$2,$0,$L110
	lui	$2,%hi(g_musicUserVolumeFlag)

$L153:
	lh	$2,%lo(g_musicUserVolumeFlag)($2)
	slt	$3,$2,2
	bne	$3,$0,$L139
	li	$3,2			# 0x2

	bnel	$2,$3,$L149
	lui	$2,%hi(g_playerCount)

	jal	NAMusicVolume
	move	$4,$0

	b	$L149
	lui	$2,%hi(g_playerCount)

$L139:
	bgez	$2,$L140
	nop

	lui	$2,%hi(g_playerCount)
$L149:
	lw	$6,%lo(g_playerCount)($2)
	blez	$6,$L118
	lui	$2,%hi(g_gamePausedFlag)

	lb	$11,%lo(g_gamePausedFlag)($2)
	lui	$2,%hi(FinalLapActive)
	lbu	$24,%lo(FinalLapActive)($2)
	lui	$2,%hi(g_musicTempo)
	lhu	$12,%lo(g_musicTempo)($2)
	move	$17,$0
	move	$15,$0
	move	$4,$0
	move	$3,$0
	lui	$5,%hi(GlobalPlayer)
	addiu	$5,$5,%lo(GlobalPlayer)
	li	$7,16384			# 0x4000
	lui	$9,%hi(g_GameLapTable)
	addiu	$9,$9,%lo(g_GameLapTable)
	li	$14,2			# 0x2
	lui	$8,%hi(AnimatedLakituStruct)
	addiu	$8,$8,%lo(AnimatedLakituStruct)
	li	$13,5			# 0x5
	lui	$10,%hi(FinalLapAnim)
	addiu	$10,$10,%lo(FinalLapAnim)
	li	$16,1			# 0x1
	lui	$2,%hi($LC2)
	ldc1	$f4,%lo($LC2)($2)
	lui	$2,%hi($LC3)
	ldc1	$f2,%lo($LC3)($2)
	li	$25,1			# 0x1
	b	$L124
	li	$18,-2147483648			# 0xffffffff80000000

$L140:
	jal	NAMusicVolume
	li	$4,75			# 0x4b

	b	$L149
	lui	$2,%hi(g_playerCount)

$L110:
	lh	$2,%lo(g_musicUserVolumeFlag)($2)
	li	$3,1			# 0x1
	beq	$2,$3,$L115
	li	$3,2			# 0x2

	beq	$2,$3,$L116
	nop

	bnel	$2,$0,$L149
	lui	$2,%hi(g_playerCount)

	jal	NAMusicVolume
	li	$4,127			# 0x7f

	b	$L149
	lui	$2,%hi(g_playerCount)

$L115:
	jal	NAMusicVolume
	li	$4,75			# 0x4b

	b	$L149
	lui	$2,%hi(g_playerCount)

$L116:
	jal	NAMusicVolume
	move	$4,$0

	b	$L149
	lui	$2,%hi(g_playerCount)

$L142:
	bne	$24,$0,$L154
	sll	$2,$3,3

	mtc1	$12,$f0
	nop
	cvt.d.w	$f0,$f0
	mul.d	$f0,$f0,$f4
	c.le.d	$f2,$f0
	nop
	bc1tl	$L121
	sub.d	$f0,$f0,$f2

	trunc.w.d $f0,$f0
	mfc1	$12,$f0
	nop
$L122:
	andi	$12,$12,0xffff
	move	$17,$25
	move	$15,$25
	b	$L120
	move	$24,$25

$L121:
	trunc.w.d $f0,$f0
	mfc1	$12,$f0
	b	$L122
	or	$12,$12,$18

$L143:
	sb	$16,0($3)
$L119:
	addiu	$4,$4,1
$L155:
	sll	$4,$4,24
	sra	$4,$4,24
	slt	$2,$4,$6
	beq	$2,$0,$L141
	move	$3,$4

$L124:
	sll	$2,$3,3
	subu	$2,$2,$3
	sll	$2,$2,4
	subu	$2,$2,$3
	sll	$2,$2,2
	subu	$2,$2,$3
	sll	$2,$2,3
	addu	$2,$2,$5
	lhu	$2,0($2)
	andi	$2,$2,0x4100
	bnel	$2,$7,$L155
	addiu	$4,$4,1

	bnel	$11,$0,$L155
	addiu	$4,$4,1

	sll	$2,$3,2
	addu	$2,$2,$9
	lw	$2,0($2)
	beq	$2,$14,$L142
	nop

$L120:
	sll	$2,$3,3
$L154:
	subu	$2,$2,$3
	sll	$2,$2,5
	addu	$2,$2,$8
	lb	$2,216($2)
	beq	$2,$13,$L143
	addu	$3,$3,$10

	b	$L119
	sb	$0,0($3)

$L141:
	bne	$15,$0,$L144
	lui	$2,%hi(FinalLapActive)

$L125:
	bne	$17,$0,$L145
	lui	$2,%hi(g_musicTempo)

$L118:
	lui	$17,%hi(GlobalPlayer)
	addiu	$17,$17,%lo(GlobalPlayer)
	lui	$18,%hi(EffectStarBGM)
	addiu	$18,$18,%lo(EffectStarBGM)
	lui	$20,%hi(EffectFinalLapBGM)
	addiu	$20,$20,%lo(EffectFinalLapBGM)
	lui	$19,%hi(g_GameLapTable)
	addiu	$19,$19,%lo(g_GameLapTable)
	move	$16,$0
	li	$fp,419430400			# 0x19000000
	ori	$fp,$fp,0xff3a
	lui	$22,%hi(g_gamePausedFlag)
	li	$23,687865856			# 0x29000000
	b	$L130
	ori	$23,$23,0x8008

$L144:
	b	$L125
	sb	$24,%lo(FinalLapActive)($2)

$L145:
	b	$L118
	sh	$12,%lo(g_musicTempo)($2)

$L147:
	bnel	$2,$0,$L150
	addiu	$16,$16,1

	li	$2,1			# 0x1
	sb	$2,0($18)
	li	$5,16777216			# 0x1000000
	ori	$5,$5,0xff2c
	jal	NaPlyLevelStart
	move	$4,$16

	b	$L150
	addiu	$16,$16,1

$L148:
	sb	$0,0($18)
	li	$5,16777216			# 0x1000000
	ori	$5,$5,0xff2c
	jal	NaPlyLevelStop
	move	$4,$16

	lhu	$5,596($17)
	sll	$5,$5,4
	addu	$5,$5,$23
	jal	NAPlyVoiceStart
	move	$4,$16

	b	$L150
	addiu	$16,$16,1

$L126:
	li	$3,16384			# 0x4000
	beq	$2,$3,$L146
	lb	$2,%lo(g_gamePausedFlag)($22)

	addiu	$16,$16,1
$L150:
	sll	$16,$16,24
	sra	$16,$16,24
	addiu	$17,$17,3544
	addiu	$18,$18,1
	addiu	$20,$20,1
	li	$2,4			# 0x4
	beq	$16,$2,$L108
	addiu	$19,$19,4

$L130:
	lhu	$2,0($17)
	andi	$3,$2,0x4000
	beql	$3,$0,$L126
	andi	$2,$2,0x4100

	lb	$3,%lo(g_gamePausedFlag)($22)
	bnel	$3,$0,$L150
	addiu	$16,$16,1

	lw	$3,188($17)
	andi	$3,$3,0x200
	bnel	$3,$0,$L147
	lbu	$2,0($18)

	lbu	$3,0($18)
	bne	$3,$0,$L148
	andi	$2,$2,0x4100

	li	$3,16384			# 0x4000
	bnel	$2,$3,$L150
	addiu	$16,$16,1

	b	$L151
	lw	$3,0($19)

$L146:
	bnel	$2,$0,$L150
	addiu	$16,$16,1

	lw	$3,0($19)
$L151:
	li	$2,2			# 0x2
	bnel	$3,$2,$L150
	addiu	$16,$16,1

	lbu	$2,0($20)
	bnel	$2,$0,$L150
	addiu	$16,$16,1

	li	$2,1			# 0x1
	sb	$2,0($20)
	move	$5,$fp
	jal	NaPlyLevelStart
	move	$4,$16

	b	$L150
	addiu	$16,$16,1

$L138:
	lw	$2,%lo(g_playerCount)($2)
	slt	$2,$2,3
	bne	$2,$0,$L152
	lw	$31,52($sp)

	lui	$2,%hi(g_startingIndicator)
	lw	$3,%lo(g_startingIndicator)($2)
	li	$2,5			# 0x5
	bne	$3,$2,$L156
	lw	$fp,48($sp)

	jal	NAMusicVolume
	move	$4,$0

	b	$L152
	lw	$31,52($sp)

	.set	macro
	.set	reorder
	.end	EffectBGMReplace
	.size	EffectBGMReplace, .-EffectBGMReplace
	.align	2
	.globl	NopPlayEffectBGMCode
	.set	nomips16
	.set	nomicromips
	.ent	NopPlayEffectBGMCode
	.type	NopPlayEffectBGMCode, @function
NopPlayEffectBGMCode:
	.frame	$sp,0,$31		# vars= 0, regs= 0/0, args= 0, gp= 0
	.mask	0x00000000,0
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	lui	$2,%hi(CheckFinalLapFanfareJAL)
	sw	$0,%lo(CheckFinalLapFanfareJAL)($2)
	lui	$2,%hi(CheckPlayStarBGMJAL)
	jr	$31
	sw	$0,%lo(CheckPlayStarBGMJAL)($2)

	.set	macro
	.set	reorder
	.end	NopPlayEffectBGMCode
	.size	NopPlayEffectBGMCode, .-NopPlayEffectBGMCode
	.align	2
	.globl	CheckPaths
	.set	nomips16
	.set	nomicromips
	.ent	CheckPaths
	.type	CheckPaths, @function
CheckPaths:
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
	lui	$2,%hi(OverKartRAMHeader+4)
	lw	$2,%lo(OverKartRAMHeader+4)($2)
	beql	$2,$0,$L187
	lui	$2,%hi(OverKartHeader+71)

	lw	$3,0($2)
	lui	$4,%hi(GlobalIntA)
	beq	$3,$0,$L159
	sw	$3,%lo(GlobalIntA)($4)

	addiu	$2,$2,4
	move	$3,$2
	sw	$2,24($sp)
	lui	$2,%hi(GlobalAddressA)
	sw	$3,%lo(GlobalAddressA)($2)
	lui	$19,%hi(GlobalPlayer)
	addiu	$19,$19,%lo(GlobalPlayer)
	lui	$22,%hi(g_noSimpleKartFlag)
	addiu	$22,$22,%lo(g_noSimpleKartFlag)
	lui	$17,%hi(g_playerPathPointTable)
	addiu	$17,$17,%lo(g_playerPathPointTable)
	move	$20,$0
	mtc1	$0,$f20
	move	$23,$4
	lui	$fp,%hi($L163)
	addiu	$fp,$fp,%lo($L163)
	lui	$2,%hi($LC4)
	b	$L170
	lwc1	$f22,%lo($LC4)($2)

$L168:
	lb	$5,5($16)
	jal	SetPlayerEcho
	lw	$4,20($sp)

$L161:
	addiu	$18,$18,1
$L186:
	lw	$2,%lo(GlobalIntA)($23)
	slt	$2,$18,$2
	beq	$2,$0,$L160
	addiu	$16,$16,12

$L169:
	lh	$2,0($17)
	lh	$3,0($16)
	slt	$4,$2,$3
	bnel	$4,$0,$L186
	addiu	$18,$18,1

	lh	$4,2($16)
	slt	$2,$4,$2
	bnel	$2,$0,$L186
	addiu	$18,$18,1

	lbu	$2,4($16)
	sltu	$2,$2,6
	beql	$2,$0,$L186
	addiu	$18,$18,1

	lbu	$2,4($16)
	sll	$2,$2,2
	addu	$2,$fp,$2
	lw	$2,0($2)
	jr	$2
	nop

	.rdata
	.align	2
	.align	2
$L163:
	.word	$L168
	.word	$L167
	.word	$L166
	.word	$L165
	.word	$L164
	.word	$L162
	.text
$L167:
	lbu	$6,8($16)
	lbu	$5,7($16)
	jal	GetRGB32
	lbu	$4,6($16)

	sw	$2,32($sp)
	lbu	$6,11($16)
	lbu	$5,10($16)
	jal	GetRGB32
	lbu	$4,9($16)

	move	$21,$2
	mfc1	$7,$f22
	lw	$6,32($sp)
	lw	$5,20($sp)
	jal	MakeBodyColor
	lw	$4,16($sp)

	mfc1	$7,$f22
	move	$6,$21
	lw	$5,20($sp)
	jal	MakeBodyColorAdjust
	lw	$4,16($sp)

	b	$L186
	addiu	$18,$18,1

$L166:
	lbu	$5,5($16)
	mtc1	$5,$f0
	nop
	cvt.s.w	$f0,$f0
	mfc1	$5,$f0
	jal	SetCamShiftUp
	lw	$4,20($sp)

	b	$L186
	addiu	$18,$18,1

$L162:
	li	$2,1			# 0x1
	lw	$3,28($sp)
	b	$L161
	sh	$2,0($3)

$L164:
	lw	$2,16($sp)
	lh	$2,202($2)
	bnel	$2,$0,$L161
	sh	$3,0($17)

	b	$L186
	addiu	$18,$18,1

$L165:
	lw	$3,16($sp)
	lhu	$2,182($3)
	ori	$2,$2,0x2
	b	$L161
	sh	$2,182($3)

$L160:
	addiu	$20,$20,1
$L188:
	addiu	$19,$19,3544
	addiu	$22,$22,2
	li	$2,8			# 0x8
	beq	$20,$2,$L159
	addiu	$17,$17,2

$L170:
	sw	$19,16($sp)
	lh	$2,0($19)
	bgezl	$2,$L188
	addiu	$20,$20,1

	sll	$2,$20,24
	sra	$2,$2,24
	move	$16,$2
	sw	$2,20($sp)
	move	$5,$0
	jal	SetPlayerEcho
	move	$4,$2

	mfc1	$5,$f20
	jal	SetCamShiftUp
	move	$4,$16

	sw	$22,28($sp)
	sh	$0,0($22)
	lhu	$2,182($19)
	li	$3,-3			# 0xfffffffffffffffd
	and	$2,$2,$3
	sh	$2,182($19)
	lw	$2,%lo(GlobalIntA)($23)
	blez	$2,$L160
	lw	$16,24($sp)

	b	$L169
	move	$18,$0

$L159:
	lui	$2,%hi(OverKartHeader+71)
$L187:
	lb	$2,%lo(OverKartHeader+71)($2)
	slt	$2,$2,2
	bne	$2,$0,$L158
	lui	$18,%hi(CPUPaths)

	addiu	$18,$18,%lo(CPUPaths)
	lui	$21,%hi(GlobalPlayer)
	addiu	$21,$21,%lo(GlobalPlayer)
	lui	$22,%hi(CurrentPathID)
	addiu	$22,$22,%lo(CurrentPathID)
	addiu	$fp,$18,32
	lui	$19,%hi(GlobalBoolA)
	lui	$16,%hi(OverKartHeader)
	addiu	$16,$16,%lo(OverKartHeader)
	lui	$17,%hi(GlobalShortA)
	b	$L178
	li	$20,1			# 0x1

$L185:
	lb	$3,0($23)
	lh	$2,%lo(GlobalShortA)($17)
	beq	$3,$2,$L175
	li	$2,1			# 0x1

	b	$L179
	sb	$2,%lo(GlobalBoolA)($19)

$L175:
	lbu	$2,%lo(GlobalBoolA)($19)
	bne	$2,$0,$L189
	lh	$2,%lo(GlobalShortA)($17)

$L177:
	lb	$4,71($16)
	jal	MakeRandomLimmit
	andi	$4,$4,0xffff

	sll	$2,$2,16
	sra	$2,$2,16
	sh	$2,%lo(GlobalShortA)($17)
	lb	$3,71($16)
	slt	$2,$3,$2
	beq	$2,$0,$L173
	lb	$4,71($16)

	sh	$4,%lo(GlobalShortA)($17)
$L173:
	lb	$2,70($16)
	beq	$2,$20,$L185
	li	$2,1			# 0x1

	sb	$2,%lo(GlobalBoolA)($19)
$L179:
	lh	$2,%lo(GlobalShortA)($17)
$L189:
	sb	$2,1($23)
	sh	$2,0($22)
$L172:
	addiu	$18,$18,4
	addiu	$21,$21,3544
	beq	$18,$fp,$L158
	addiu	$22,$22,2

$L178:
	lh	$2,8($21)
	lb	$3,2($18)
	beq	$3,$2,$L172
	move	$23,$18

	sb	$2,2($18)
	lbu	$2,1($18)
	sb	$2,0($18)
	b	$L177
	sb	$0,%lo(GlobalBoolA)($19)

$L158:
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

	.set	macro
	.set	reorder
	.end	CheckPaths
	.size	CheckPaths, .-CheckPaths
	.globl	FinalLapAnim
	.section	.bss,"aw",@nobits
	.align	2
	.type	FinalLapAnim, @object
	.size	FinalLapAnim, 4
FinalLapAnim:
	.space	4
	.globl	FinalLapActive
	.type	FinalLapActive, @object
	.size	FinalLapActive, 1
FinalLapActive:
	.space	1
	.globl	EffectFinalLapBGM
	.align	2
	.type	EffectFinalLapBGM, @object
	.size	EffectFinalLapBGM, 4
EffectFinalLapBGM:
	.space	4
	.globl	EffectStarBGM
	.align	2
	.type	EffectStarBGM, @object
	.size	EffectStarBGM, 4
EffectStarBGM:
	.space	4
	.section	.rodata.cst4,"aM",@progbits,4
	.align	2
$LC0:
	.word	1142292480
	.align	2
$LC1:
	.word	1069547520
	.section	.rodata.cst8,"aM",@progbits,8
	.align	3
$LC2:
	.word	1072955392
	.word	0
	.align	3
$LC3:
	.word	1105199104
	.word	0
	.section	.rodata.cst4
	.align	2
$LC4:
	.word	1065353216
	.ident	"GCC: (GNU) 10.1.0"
