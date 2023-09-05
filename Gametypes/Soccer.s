	.file	1 "Soccer.c"
	.section .mdebug.abi32
	.previous
	.nan	legacy
	.module	fp=32
	.module	nooddspreg
	.text
	.align	2
	.globl	PlaceBalls
	.set	nomips16
	.set	nomicromips
	.ent	PlaceBalls
	.type	PlaceBalls, @function
PlaceBalls:
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
	move	$20,$4
	lui	$2,%hi(HotSwapID)
	lh	$2,%lo(HotSwapID)($2)
	bgtz	$2,$L37
	move	$21,$6

	lui	$2,%hi(g_courseID)
	lh	$2,%lo(g_courseID)($2)
	li	$3,17			# 0x11
	beq	$2,$3,$L14
	slt	$3,$2,18

	beq	$3,$0,$L15
	li	$3,15			# 0xf

	beq	$2,$3,$L16
	li	$3,16			# 0x10

	bne	$2,$3,$L18
	lui	$2,%hi(ObjectiveMapID)

	li	$3,3			# 0x3
	b	$L20
	sw	$3,%lo(ObjectiveMapID)($2)

$L37:
	li	$4,100663296			# 0x6000000
	jal	GetRealAddress
	addiu	$4,$4,528

	lui	$3,%hi(CustomObjectivePoints)
	sw	$2,%lo(CustomObjectivePoints)($3)
	move	$16,$0
	move	$18,$3
	lui	$22,%hi(ObjectiveCount)
	li	$19,-32768			# 0xffffffffffff8000
	li	$17,1			# 0x1
	lui	$23,%hi(GameFlag)
	addiu	$23,$23,%lo(GameFlag)
	lui	$fp,%hi(GameBase)
	b	$L9
	addiu	$fp,$fp,%lo(GameBase)

$L10:
	lui	$2,%hi(g_playerCount)
$L43:
	lw	$16,%lo(g_playerCount)($2)
	blez	$16,$L5
	lui	$2,%hi(Objectives)

	addiu	$2,$2,%lo(Objectives)
	sll	$3,$16,3
	addu	$3,$3,$2
	li	$4,-1			# 0xffffffffffffffff
	sb	$4,0($2)
$L42:
	sh	$0,2($2)
	sh	$0,4($2)
	sh	$0,6($2)
	addiu	$2,$2,8
	bnel	$2,$3,$L42
	sb	$4,0($2)

	b	$L40
	lui	$2,%hi(TeamMode)

$L7:
	jal	PlaceFlagSpawn
	lh	$5,8($4)

	lw	$2,%lo(CustomObjectivePoints)($18)
	addu	$2,$2,$16
	lh	$4,8($2)
	sll	$3,$4,4
	subu	$3,$3,$4
	sll	$3,$3,3
	addu	$3,$23,$3
	sw	$20,52($3)
	lh	$4,8($2)
	sll	$3,$4,4
	subu	$3,$3,$4
	sll	$3,$3,3
	addu	$3,$23,$3
	sb	$4,45($3)
	lh	$4,8($2)
	sll	$3,$4,4
	subu	$3,$3,$4
	sll	$3,$3,3
	addu	$3,$3,$23
	li	$4,500			# 0x1f4
	sh	$4,32($3)
	lh	$4,8($2)
	sll	$3,$4,4
	subu	$3,$3,$4
	sll	$3,$3,3
	addu	$3,$23,$3
	li	$4,200			# 0xc8
	sh	$4,34($3)
	lh	$5,8($2)
	sll	$3,$5,4
	subu	$3,$3,$5
	sll	$3,$3,3
	addu	$3,$23,$3
	li	$5,400			# 0x190
	sh	$5,36($3)
	lh	$5,8($2)
	sll	$3,$5,4
	subu	$3,$3,$5
	sll	$3,$3,3
	addu	$3,$23,$3
	li	$5,10000			# 0x2710
	sh	$5,38($3)
	lh	$5,8($2)
	sll	$3,$5,4
	subu	$3,$3,$5
	sll	$3,$3,3
	addu	$3,$23,$3
	sh	$4,30($3)
	lh	$4,8($2)
	sll	$3,$4,4
	subu	$3,$3,$4
	sll	$3,$3,3
	addu	$3,$3,$23
	sh	$0,24($3)
	lh	$4,8($2)
	sll	$3,$4,4
	subu	$3,$3,$4
	sll	$3,$3,3
	addu	$3,$3,$23
	sh	$0,26($3)
	lh	$3,8($2)
	sll	$2,$3,4
	subu	$2,$2,$3
	sll	$2,$2,3
	addu	$2,$2,$23
	li	$3,2			# 0x2
	sh	$3,28($2)
$L6:
	addiu	$16,$16,12
$L41:
	li	$2,768			# 0x300
	beq	$16,$2,$L43
	lui	$2,%hi(g_playerCount)

$L9:
	lw	$4,%lo(CustomObjectivePoints)($18)
	lb	$3,%lo(ObjectiveCount)($22)
	sll	$2,$3,1
	addu	$2,$2,$3
	sll	$2,$2,2
	addu	$2,$4,$2
	lh	$2,0($2)
	beq	$2,$19,$L10
	addu	$4,$4,$16

	lh	$2,6($4)
	bnel	$2,$17,$L41
	addiu	$16,$16,12

	lh	$2,10($4)
	beq	$2,$17,$L7
	li	$3,2			# 0x2

	beq	$2,$3,$L8
	nop

	bnel	$2,$0,$L41
	addiu	$16,$16,12

	jal	PlacePlayerSpawn
	lh	$5,8($4)

	b	$L41
	addiu	$16,$16,12

$L8:
	jal	PlaceBaseSpawn
	lh	$5,8($4)

	lw	$2,%lo(CustomObjectivePoints)($18)
	addu	$2,$2,$16
	lh	$3,8($2)
	sll	$2,$3,2
	addu	$2,$21,$2
	lw	$4,0($2)
	sll	$2,$3,4
	subu	$2,$2,$3
	sll	$2,$2,3
	addu	$2,$fp,$2
	b	$L6
	sw	$4,52($2)

$L15:
	li	$3,19			# 0x13
	bne	$2,$3,$L18
	lui	$2,%hi(ObjectiveMapID)

	b	$L20
	sw	$0,%lo(ObjectiveMapID)($2)

$L16:
	lui	$2,%hi(ObjectiveMapID)
	li	$3,1			# 0x1
	sw	$3,%lo(ObjectiveMapID)($2)
$L20:
	lui	$2,%hi(g_playerCount)
	lw	$2,%lo(g_playerCount)($2)
	blez	$2,$L5
	sll	$19,$7,3

	addu	$7,$19,$7
	sll	$19,$7,3
	lui	$18,%hi(Objectives)
	addiu	$18,$18,%lo(Objectives)
	lui	$23,%hi(GameBase)
	addiu	$23,$23,%lo(GameBase)
	lui	$16,%hi(GameFlag)
	addiu	$16,$16,%lo(GameFlag)
	move	$17,$0
	lui	$fp,%hi(ObjectiveMapID)
	lui	$22,%hi(SoccerGameSpawns)
	addiu	$22,$22,%lo(SoccerGameSpawns)
	lui	$2,%hi(g_playerCount)
	sw	$2,16($sp)
$L22:
	li	$2,-1			# 0xffffffffffffffff
	sb	$2,0($18)
	sh	$0,2($18)
	sh	$0,4($18)
	sh	$0,6($18)
	lw	$2,%lo(ObjectiveMapID)($fp)
	sll	$4,$2,3
	addu	$4,$4,$2
	sll	$4,$4,4
	addu	$4,$4,$19
	move	$5,$17
	jal	PlaceBaseSpawn
	addu	$4,$22,$4

	lw	$2,0($21)
	sw	$2,52($23)
	lw	$2,%lo(ObjectiveMapID)($fp)
	sll	$4,$2,3
	addu	$4,$4,$2
	sll	$4,$4,4
	addiu	$4,$4,24
	addu	$4,$4,$19
	move	$5,$17
	jal	PlaceFlagSpawn
	addu	$4,$22,$4

	sw	$20,52($16)
	sb	$17,45($16)
	li	$3,500			# 0x1f4
	sh	$3,32($16)
	li	$2,200			# 0xc8
	sh	$2,34($16)
	sh	$3,36($16)
	li	$3,10000			# 0x2710
	sh	$3,38($16)
	sh	$2,30($16)
	sh	$0,24($16)
	sh	$0,26($16)
	li	$2,2			# 0x2
	sh	$2,28($16)
	lw	$2,%lo(ObjectiveMapID)($fp)
	sll	$4,$2,3
	addu	$4,$4,$2
	sll	$4,$4,4
	addiu	$4,$4,48
	addu	$4,$4,$19
	move	$5,$17
	jal	PlacePlayerSpawn
	addu	$4,$22,$4

	addiu	$17,$17,1
	addiu	$18,$18,8
	addiu	$19,$19,6
	addiu	$21,$21,4
	addiu	$23,$23,120
	lw	$2,16($sp)
	lw	$2,%lo(g_playerCount)($2)
	slt	$2,$17,$2
	bne	$2,$0,$L22
	addiu	$16,$16,120

$L21:
	lui	$2,%hi(g_playerCount)
	lw	$16,%lo(g_playerCount)($2)
	blez	$16,$L13
	lui	$2,%hi(TeamMode)

$L40:
	lb	$6,%lo(TeamMode)($2)
	lui	$3,%hi(Objectives)
	addiu	$3,$3,%lo(Objectives)
	move	$2,$0
	li	$5,1			# 0x1
	b	$L26
	li	$7,1			# 0x1

$L14:
	lui	$2,%hi(ObjectiveMapID)
	li	$3,2			# 0x2
	b	$L20
	sw	$3,%lo(ObjectiveMapID)($2)

$L18:
	lui	$2,%hi(ObjectiveMapID)
	li	$3,-1			# 0xffffffffffffffff
	b	$L21
	sw	$3,%lo(ObjectiveMapID)($2)

$L39:
	bnel	$4,$0,$L25
	sb	$0,1($3)

	sb	$7,1($3)
$L25:
	addiu	$2,$2,1
	slt	$4,$2,$16
	beq	$4,$0,$L13
	addiu	$3,$3,8

$L26:
	beq	$6,$5,$L39
	slt	$4,$2,2

	b	$L25
	sb	$2,1($3)

$L5:
	lui	$2,%hi(g_playerCount)
	lw	$16,%lo(g_playerCount)($2)
$L13:
	slt	$2,$16,4
	beq	$2,$0,$L27
	sll	$17,$16,1

	addu	$17,$17,$16
	sll	$2,$17,2
	lui	$17,%hi(SpawnPoint)
	addiu	$17,$17,%lo(SpawnPoint)
	addu	$17,$17,$2
	sll	$18,$16,4
	subu	$18,$18,$16
	sll	$18,$18,3
	lui	$2,%hi($LC0)
	lwc1	$f20,%lo($LC0)($2)
	lui	$21,%hi(GameBase)
	addiu	$21,$21,%lo(GameBase)
	lui	$19,%hi(GameFlag)
	addiu	$19,$19,%lo(GameFlag)
	li	$23,-1			# 0xffffffffffffffff
	li	$22,4			# 0x4
$L28:
	swc1	$f20,0($17)
	swc1	$f20,4($17)
	swc1	$f20,8($17)
	addu	$2,$21,$18
	sw	$20,52($2)
	addu	$2,$19,$18
	sb	$23,45($2)
	jal	ResetFlag
	move	$4,$16

	addiu	$16,$16,1
	addiu	$17,$17,12
	bne	$16,$22,$L28
	addiu	$18,$18,120

$L27:
	lui	$2,%hi(g_playerCount)
	lw	$3,%lo(g_playerCount)($2)
	lui	$2,%hi(FlagCount)
	sb	$3,%lo(FlagCount)($2)
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
	.end	PlaceBalls
	.size	PlaceBalls, .-PlaceBalls
	.align	2
	.globl	CaptureBalls
	.set	nomips16
	.set	nomicromips
	.ent	CaptureBalls
	.type	CaptureBalls, @function
CaptureBalls:
	.frame	$sp,88,$31		# vars= 16, regs= 10/4, args= 16, gp= 0
	.mask	0xc0ff0000,-20
	.fmask	0x00f00000,-8
	.set	noreorder
	.set	nomacro
	lui	$2,%hi(FlagCount)
	lb	$5,%lo(FlagCount)($2)
	blez	$5,$L45
	lui	$3,%hi(GameFlag+42)

	addiu	$3,$3,%lo(GameFlag+42)
	lui	$2,%hi(Objectives)
	addiu	$2,$2,%lo(Objectives)
	sll	$5,$5,3
	b	$L48
	addu	$5,$5,$2

$L47:
	addiu	$2,$2,8
	beq	$2,$5,$L84
	addiu	$3,$3,120

$L48:
	lh	$4,0($3)
	blez	$4,$L46
	addiu	$4,$4,-1

	sh	$4,0($3)
$L46:
	lh	$4,4($2)
	blez	$4,$L47
	addiu	$4,$4,-1

	b	$L47
	sh	$4,4($2)

$L45:
	lui	$2,%hi(g_playerCount)
	lw	$2,%lo(g_playerCount)($2)
	bgtz	$2,$L65
	lui	$2,%hi(FlagCount)

	lb	$5,%lo(FlagCount)($2)
	bgtzl	$5,$L89
	lui	$2,%hi(GameFlag)

$L92:
	jr	$31
	nop

$L52:
	addiu	$23,$23,1
$L88:
	lb	$2,%lo(FlagCount)($fp)
	slt	$2,$23,$2
	beq	$2,$0,$L51
	addiu	$20,$20,120

$L53:
	sw	$20,20($sp)
	lb	$3,45($20)
	lw	$2,16($sp)
	lb	$2,1($2)
	beq	$3,$2,$L52
	li	$2,-1			# 0xffffffffffffffff

	lb	$3,44($20)
	bnel	$3,$2,$L88
	addiu	$23,$23,1

	lh	$2,42($20)
	bnel	$2,$0,$L88
	addiu	$23,$23,1

	mfc1	$7,$f20
	move	$6,$20
	lw	$2,28($sp)
	lw	$5,92($2)
	jal	TestCollideSphere
	move	$4,$2

	beql	$2,$0,$L88
	addiu	$23,$23,1

	lw	$2,16($sp)
	sb	$23,0($2)
	sll	$4,$17,24
	sra	$4,$4,24
	lw	$2,20($sp)
	mfc1	$5,$f22
	jal	ChangeMaxSpeed
	sb	$4,44($2)

	b	$L88
	addiu	$23,$23,1

$L51:
	addiu	$17,$17,1
$L90:
	lw	$2,%lo(g_playerCount)($21)
	addiu	$16,$16,8
	slt	$3,$17,$2
	beq	$3,$0,$L85
	addiu	$18,$18,3544

$L54:
	sw	$16,16($sp)
	lb	$3,0($16)
	li	$2,-1			# 0xffffffffffffffff
	bnel	$3,$2,$L90
	addiu	$17,$17,1

	lh	$2,4($16)
	bnel	$2,$0,$L90
	addiu	$17,$17,1

	lb	$2,%lo(FlagCount)($fp)
	blez	$2,$L51
	move	$23,$0

	sw	$18,28($sp)
	lw	$2,24($sp)
	b	$L53
	addiu	$20,$2,%lo(GameFlag)

$L85:
	blez	$2,$L50
	move	$21,$0

	lui	$2,%hi($LC3)
	lwc1	$f0,%lo($LC3)($2)
	swc1	$f0,16($sp)
	lui	$2,%hi($LC4)
	lwc1	$f0,%lo($LC4)($2)
	swc1	$f0,24($sp)
	lui	$2,%hi(TeamScore)
	addiu	$2,$2,%lo(TeamScore)
	b	$L60
	sw	$2,28($sp)

$L86:
	sll	$2,$2,1
	lw	$3,28($sp)
	addu	$2,$2,$3
	lhu	$3,0($2)
	addiu	$3,$3,1
	sh	$3,0($2)
$L58:
	lw	$5,24($sp)
	jal	ChangeMaxSpeed
	lw	$4,20($sp)

	jal	ResetFlag
	lb	$4,0($18)

	li	$2,-1			# 0xffffffffffffffff
	sb	$2,0($18)
	addiu	$17,$17,1
$L91:
	lb	$2,%lo(FlagCount)($23)
	slt	$2,$17,$2
	beq	$2,$0,$L55
	addiu	$16,$16,120

$L59:
	lw	$7,16($sp)
	move	$6,$16
	lw	$5,92($20)
	jal	TestCollideSphere
	move	$4,$20

	beql	$2,$0,$L91
	addiu	$17,$17,1

	lb	$3,%lo(TeamMode)($fp)
	li	$2,1			# 0x1
	beql	$3,$2,$L86
	lb	$2,1($18)

	lhu	$2,6($18)
	addiu	$2,$2,1
	b	$L58
	sh	$2,6($18)

$L55:
	addiu	$21,$21,1
	addiu	$19,$19,8
	lui	$2,%hi(g_playerCount)
	lw	$2,%lo(g_playerCount)($2)
	slt	$2,$21,$2
	beq	$2,$0,$L50
	addiu	$22,$22,3544

$L60:
	lb	$2,0($19)
	beq	$2,$0,$L55
	move	$18,$19

	lui	$2,%hi(FlagCount)
	lb	$2,%lo(FlagCount)($2)
	blez	$2,$L55
	move	$20,$22

	lui	$16,%hi(GameBase)
	addiu	$16,$16,%lo(GameBase)
	move	$17,$0
	lui	$fp,%hi(TeamMode)
	sll	$2,$21,24
	sra	$2,$2,24
	sw	$2,20($sp)
	b	$L59
	lui	$23,%hi(FlagCount)

$L50:
	lui	$2,%hi(FlagCount)
	lb	$5,%lo(FlagCount)($2)
	blez	$5,$L44
	lui	$2,%hi(GameFlag)

	addiu	$2,$2,%lo(GameFlag)
	b	$L63
	move	$4,$0

$L62:
	addiu	$4,$4,1
	slt	$3,$4,$5
	beq	$3,$0,$L44
	addiu	$2,$2,120

$L63:
	lh	$3,40($2)
	blez	$3,$L62
	addiu	$3,$3,-1

	b	$L62
	sh	$3,40($2)

$L87:
	lb	$5,%lo(FlagCount)($2)
	lui	$2,%hi(GameFlag)
$L89:
	addiu	$2,$2,%lo(GameFlag)
	b	$L79
	move	$4,$0

$L84:
	lui	$2,%hi(g_playerCount)
	lw	$2,%lo(g_playerCount)($2)
	blez	$2,$L87
	lui	$2,%hi(FlagCount)

$L65:
	addiu	$sp,$sp,-88
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
	sdc1	$f22,80($sp)
	sdc1	$f20,72($sp)
	lui	$19,%hi(Objectives)
	addiu	$19,$19,%lo(Objectives)
	lui	$22,%hi(GlobalPlayer+20)
	addiu	$22,$22,%lo(GlobalPlayer+20)
	move	$18,$22
	move	$16,$19
	move	$17,$0
	lui	$fp,%hi(FlagCount)
	lui	$2,%hi(GameFlag)
	sw	$2,24($sp)
	lui	$2,%hi($LC1)
	lwc1	$f20,%lo($LC1)($2)
	lui	$2,%hi($LC2)
	lwc1	$f22,%lo($LC2)($2)
	b	$L54
	lui	$21,%hi(g_playerCount)

$L44:
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
	ldc1	$f22,80($sp)
	ldc1	$f20,72($sp)
	jr	$31
	addiu	$sp,$sp,88

$L81:
	addiu	$4,$4,1
	slt	$3,$4,$5
	beq	$3,$0,$L92
	addiu	$2,$2,120

$L79:
	lh	$3,40($2)
	blez	$3,$L81
	addiu	$3,$3,-1

	b	$L81
	sh	$3,40($2)

	.set	macro
	.set	reorder
	.end	CaptureBalls
	.size	CaptureBalls, .-CaptureBalls
	.align	2
	.globl	ShootBall
	.set	nomips16
	.set	nomicromips
	.ent	ShootBall
	.type	ShootBall, @function
ShootBall:
	.frame	$sp,32,$31		# vars= 0, regs= 4/0, args= 16, gp= 0
	.mask	0x80070000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	sll	$2,$4,3
	lui	$3,%hi(Objectives)
	addiu	$3,$3,%lo(Objectives)
	addu	$2,$2,$3
	lb	$6,0($2)
	li	$2,-1			# 0xffffffffffffffff
	bne	$6,$2,$L99
	lui	$2,%hi(GlobalIntA)

	jr	$31
	nop

$L99:
	addiu	$sp,$sp,-32
	sw	$31,28($sp)
	sw	$18,24($sp)
	sw	$17,20($sp)
	sw	$16,16($sp)
	move	$16,$4
	sw	$6,%lo(GlobalIntA)($2)
	sll	$4,$6,4
	subu	$3,$4,$6
	sll	$3,$3,3
	lui	$17,%hi(GameFlag)
	addiu	$17,$17,%lo(GameFlag)
	addu	$3,$3,$17
	lui	$5,%hi(GlobalPlayer)
	sll	$18,$16,3
	subu	$2,$18,$16
	sll	$2,$2,4
	subu	$2,$2,$16
	sll	$2,$2,2
	subu	$2,$2,$16
	sll	$2,$2,3
	addiu	$5,$5,%lo(GlobalPlayer)
	addu	$2,$5,$2
	lwc1	$f0,20($2)
	swc1	$f0,0($3)
	lwc1	$f0,24($2)
	lui	$5,%hi($LC1)
	lwc1	$f2,%lo($LC1)($5)
	add.s	$f0,$f0,$f2
	swc1	$f0,4($3)
	lwc1	$f0,28($2)
	swc1	$f0,8($3)
	sw	$0,12($3)
	swc1	$f2,16($3)
	lui	$5,%hi($LC5)
	lwc1	$f0,%lo($LC5)($5)
	swc1	$f0,20($3)
	lh	$5,46($2)
	sh	$5,48($3)
	subu	$4,$4,$6
	sll	$4,$4,3
	addiu	$4,$4,12
	jal	MakeAlignVector
	addu	$4,$17,$4

	lui	$2,%hi($LC4)
	lw	$5,%lo($LC4)($2)
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
	li	$2,30			# 0x1e
	sh	$2,42($3)
	sb	$5,0($18)
	li	$2,90			# 0x5a
	sh	$2,4($18)
	lw	$31,28($sp)
	lw	$18,24($sp)
	lw	$17,20($sp)
	lw	$16,16($sp)
	jr	$31
	addiu	$sp,$sp,32

	.set	macro
	.set	reorder
	.end	ShootBall
	.size	ShootBall, .-ShootBall
	.globl	SoccerGameSpawns
	.data
	.align	2
	.type	SoccerGameSpawns, @object
	.size	SoccerGameSpawns, 576
SoccerGameSpawns:
	.half	0
	.half	200
	.half	-615
	.half	0
	.half	200
	.half	615
	.half	-615
	.half	200
	.half	0
	.half	615
	.half	200
	.half	0
	.half	0
	.half	210
	.half	-750
	.half	0
	.half	210
	.half	750
	.half	-750
	.half	210
	.half	0
	.half	750
	.half	210
	.half	0
	.half	0
	.half	230
	.half	-875
	.half	0
	.half	230
	.half	875
	.half	-875
	.half	230
	.half	0
	.half	875
	.half	230
	.half	0
	.half	0
	.half	230
	.half	-875
	.half	0
	.half	230
	.half	875
	.half	-875
	.half	230
	.half	0
	.half	875
	.half	230
	.half	0
	.half	0
	.half	210
	.half	-750
	.half	0
	.half	210
	.half	750
	.half	-750
	.half	210
	.half	0
	.half	750
	.half	210
	.half	0
	.half	0
	.half	200
	.half	-615
	.half	0
	.half	200
	.half	615
	.half	-615
	.half	200
	.half	0
	.half	615
	.half	200
	.half	0
	.half	0
	.half	0
	.half	-650
	.half	0
	.half	0
	.half	650
	.half	-650
	.half	0
	.half	0
	.half	650
	.half	0
	.half	0
	.half	0
	.half	0
	.half	-700
	.half	0
	.half	0
	.half	700
	.half	-700
	.half	0
	.half	0
	.half	700
	.half	0
	.half	0
	.half	0
	.half	0
	.half	-500
	.half	0
	.half	0
	.half	500
	.half	-500
	.half	0
	.half	0
	.half	500
	.half	0
	.half	0
	.half	-450
	.half	92
	.half	-450
	.half	450
	.half	92
	.half	450
	.half	-450
	.half	92
	.half	450
	.half	450
	.half	92
	.half	-450
	.half	-700
	.half	0
	.half	-700
	.half	700
	.half	0
	.half	700
	.half	-700
	.half	0
	.half	700
	.half	700
	.half	0
	.half	-700
	.half	-150
	.half	47
	.half	-150
	.half	150
	.half	47
	.half	150
	.half	-150
	.half	47
	.half	150
	.half	150
	.half	47
	.half	-150
	.half	0
	.half	60
	.half	-675
	.half	0
	.half	60
	.half	675
	.half	-675
	.half	60
	.half	0
	.half	675
	.half	60
	.half	0
	.half	0
	.half	50
	.half	-50
	.half	0
	.half	50
	.half	50
	.half	-50
	.half	50
	.half	0
	.half	50
	.half	50
	.half	0
	.half	0
	.half	100
	.half	-635
	.half	0
	.half	100
	.half	635
	.half	-635
	.half	100
	.half	0
	.half	635
	.half	100
	.half	0
	.half	0
	.half	90
	.half	-275
	.half	0
	.half	90
	.half	275
	.half	-275
	.half	90
	.half	0
	.half	275
	.half	90
	.half	0
	.half	0
	.half	0
	.half	-675
	.half	0
	.half	0
	.half	675
	.half	-675
	.half	0
	.half	0
	.half	675
	.half	0
	.half	0
	.half	0
	.half	0
	.half	-635
	.half	0
	.half	0
	.half	635
	.half	-635
	.half	0
	.half	0
	.half	635
	.half	0
	.half	0
	.half	0
	.half	480
	.half	-480
	.half	0
	.half	480
	.half	480
	.half	-480
	.half	480
	.half	0
	.half	480
	.half	480
	.half	0
	.half	0
	.half	480
	.half	-435
	.half	0
	.half	480
	.half	435
	.half	-435
	.half	480
	.half	0
	.half	435
	.half	480
	.half	0
	.half	0
	.half	480
	.half	-350
	.half	0
	.half	480
	.half	350
	.half	-350
	.half	480
	.half	0
	.half	350
	.half	480
	.half	0
	.half	0
	.half	480
	.half	-75
	.half	0
	.half	480
	.half	75
	.half	-75
	.half	480
	.half	0
	.half	75
	.half	480
	.half	0
	.half	0
	.half	480
	.half	-435
	.half	0
	.half	480
	.half	435
	.half	-435
	.half	480
	.half	0
	.half	435
	.half	480
	.half	0
	.half	0
	.half	480
	.half	-350
	.half	0
	.half	480
	.half	350
	.half	-350
	.half	480
	.half	0
	.half	350
	.half	480
	.half	0
	.globl	SoccerBigDonutSpawns
	.rdata
	.align	2
	.type	SoccerBigDonutSpawns, @object
	.size	SoccerBigDonutSpawns, 144
SoccerBigDonutSpawns:
	.half	0
	.half	200
	.half	-615
	.half	0
	.half	200
	.half	615
	.half	-615
	.half	200
	.half	0
	.half	615
	.half	200
	.half	0
	.half	0
	.half	210
	.half	-750
	.half	0
	.half	210
	.half	750
	.half	-750
	.half	210
	.half	0
	.half	750
	.half	210
	.half	0
	.half	0
	.half	230
	.half	-875
	.half	0
	.half	230
	.half	875
	.half	-875
	.half	230
	.half	0
	.half	875
	.half	230
	.half	0
	.half	0
	.half	230
	.half	-875
	.half	0
	.half	230
	.half	875
	.half	-875
	.half	230
	.half	0
	.half	875
	.half	230
	.half	0
	.half	0
	.half	210
	.half	-750
	.half	0
	.half	210
	.half	750
	.half	-750
	.half	210
	.half	0
	.half	750
	.half	210
	.half	0
	.half	0
	.half	200
	.half	-615
	.half	0
	.half	200
	.half	615
	.half	-615
	.half	200
	.half	0
	.half	615
	.half	200
	.half	0
	.globl	SoccerDoubleDeckerSpawns
	.align	2
	.type	SoccerDoubleDeckerSpawns, @object
	.size	SoccerDoubleDeckerSpawns, 144
SoccerDoubleDeckerSpawns:
	.half	0
	.half	60
	.half	-675
	.half	0
	.half	60
	.half	675
	.half	-675
	.half	60
	.half	0
	.half	675
	.half	60
	.half	0
	.half	0
	.half	50
	.half	-50
	.half	0
	.half	50
	.half	50
	.half	-50
	.half	50
	.half	0
	.half	50
	.half	50
	.half	0
	.half	0
	.half	100
	.half	-635
	.half	0
	.half	100
	.half	635
	.half	-635
	.half	100
	.half	0
	.half	635
	.half	100
	.half	0
	.half	0
	.half	90
	.half	-275
	.half	0
	.half	90
	.half	275
	.half	-275
	.half	90
	.half	0
	.half	275
	.half	90
	.half	0
	.half	0
	.half	0
	.half	-675
	.half	0
	.half	0
	.half	675
	.half	-675
	.half	0
	.half	0
	.half	675
	.half	0
	.half	0
	.half	0
	.half	0
	.half	-635
	.half	0
	.half	0
	.half	635
	.half	-635
	.half	0
	.half	0
	.half	635
	.half	0
	.half	0
	.globl	SoccerBlockFortSpawns
	.align	2
	.type	SoccerBlockFortSpawns, @object
	.size	SoccerBlockFortSpawns, 144
SoccerBlockFortSpawns:
	.half	0
	.half	0
	.half	-650
	.half	0
	.half	0
	.half	650
	.half	-650
	.half	0
	.half	0
	.half	650
	.half	0
	.half	0
	.half	0
	.half	0
	.half	-700
	.half	0
	.half	0
	.half	700
	.half	-700
	.half	0
	.half	0
	.half	700
	.half	0
	.half	0
	.half	0
	.half	0
	.half	-500
	.half	0
	.half	0
	.half	500
	.half	-500
	.half	0
	.half	0
	.half	500
	.half	0
	.half	0
	.half	-450
	.half	92
	.half	-450
	.half	450
	.half	92
	.half	450
	.half	-450
	.half	92
	.half	450
	.half	450
	.half	92
	.half	-450
	.half	-700
	.half	0
	.half	-700
	.half	700
	.half	0
	.half	700
	.half	-700
	.half	0
	.half	700
	.half	700
	.half	0
	.half	-700
	.half	-150
	.half	47
	.half	-150
	.half	150
	.half	47
	.half	150
	.half	-150
	.half	47
	.half	150
	.half	150
	.half	47
	.half	-150
	.globl	SoccerSkyscraperSpawns
	.align	2
	.type	SoccerSkyscraperSpawns, @object
	.size	SoccerSkyscraperSpawns, 144
SoccerSkyscraperSpawns:
	.half	0
	.half	480
	.half	-480
	.half	0
	.half	480
	.half	480
	.half	-480
	.half	480
	.half	0
	.half	480
	.half	480
	.half	0
	.half	0
	.half	480
	.half	-435
	.half	0
	.half	480
	.half	435
	.half	-435
	.half	480
	.half	0
	.half	435
	.half	480
	.half	0
	.half	0
	.half	480
	.half	-350
	.half	0
	.half	480
	.half	350
	.half	-350
	.half	480
	.half	0
	.half	350
	.half	480
	.half	0
	.half	0
	.half	480
	.half	-75
	.half	0
	.half	480
	.half	75
	.half	-75
	.half	480
	.half	0
	.half	75
	.half	480
	.half	0
	.half	0
	.half	480
	.half	-435
	.half	0
	.half	480
	.half	435
	.half	-435
	.half	480
	.half	0
	.half	435
	.half	480
	.half	0
	.half	0
	.half	480
	.half	-350
	.half	0
	.half	480
	.half	350
	.half	-350
	.half	480
	.half	0
	.half	350
	.half	480
	.half	0
	.section	.rodata.cst4,"aM",@progbits,4
	.align	2
$LC0:
	.word	-947912960
	.align	2
$LC1:
	.word	1084227584
	.align	2
$LC2:
	.word	-1028390912
	.align	2
$LC3:
	.word	1090519040
	.align	2
$LC4:
	.word	1119092736
	.align	2
$LC5:
	.word	1082130432
	.ident	"GCC: (GNU) 10.1.0"
