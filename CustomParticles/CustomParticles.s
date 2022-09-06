	.file	1 "CustomParticles.c"
	.section .mdebug.abi32
	.previous
	.nan	legacy
	.module	fp=32
	.module	nooddspreg
	.text
	.align	2
	.globl	InitialCustomParticleBuffer
	.set	nomips16
	.set	nomicromips
	.ent	InitialCustomParticleBuffer
	.type	InitialCustomParticleBuffer, @function
InitialCustomParticleBuffer:
	.frame	$sp,0,$31		# vars= 0, regs= 0/0, args= 0, gp= 0
	.mask	0x00000000,0
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	lui	$2,%hi(C_particle_count)
	sh	$0,%lo(C_particle_count)($2)
	lui	$2,%hi(CustomParticleBuffer)
	addiu	$2,$2,%lo(CustomParticleBuffer)
	addiu	$4,$2,12800
	li	$3,1			# 0x1
	sh	$0,0($2)
$L4:
	sb	$0,2($2)
	sb	$0,3($2)
	sb	$0,51($2)
	sw	$0,8($2)
	sh	$0,4($2)
	sb	$0,48($2)
	sb	$0,49($2)
	sw	$0,12($2)
	sw	$0,16($2)
	sw	$0,20($2)
	sw	$0,24($2)
	sw	$0,28($2)
	sw	$0,32($2)
	sw	$0,36($2)
	sh	$0,42($2)
	sh	$0,44($2)
	sh	$0,46($2)
	sb	$0,52($2)
	sb	$0,53($2)
	sb	$0,54($2)
	sb	$0,55($2)
	sb	$0,56($2)
	sb	$3,57($2)
	sb	$0,58($2)
	sb	$3,59($2)
	sb	$0,50($2)
	sb	$0,40($2)
	sb	$3,41($2)
	sh	$0,62($2)
	addiu	$2,$2,64
	bnel	$2,$4,$L4
	sh	$0,0($2)

	jr	$31
	nop

	.set	macro
	.set	reorder
	.end	InitialCustomParticleBuffer
	.size	InitialCustomParticleBuffer, .-InitialCustomParticleBuffer
	.align	2
	.globl	DeleteCustomParticleBuffer
	.set	nomips16
	.set	nomicromips
	.ent	DeleteCustomParticleBuffer
	.type	DeleteCustomParticleBuffer, @function
DeleteCustomParticleBuffer:
	.frame	$sp,0,$31		# vars= 0, regs= 0/0, args= 0, gp= 0
	.mask	0x00000000,0
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	sh	$0,0($4)
	sb	$0,2($4)
	lui	$3,%hi(C_particle_count)
	lhu	$2,%lo(C_particle_count)($3)
	addiu	$2,$2,-1
	jr	$31
	sh	$2,%lo(C_particle_count)($3)

	.set	macro
	.set	reorder
	.end	DeleteCustomParticleBuffer
	.size	DeleteCustomParticleBuffer, .-DeleteCustomParticleBuffer
	.align	2
	.globl	SetCustomParticleBuffer
	.set	nomips16
	.set	nomicromips
	.ent	SetCustomParticleBuffer
	.type	SetCustomParticleBuffer, @function
SetCustomParticleBuffer:
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
	move	$17,$6
	move	$18,$7
	jal	CopyVector
	addiu	$4,$4,16

	move	$5,$18
	jal	CopyVector
	addiu	$4,$16,28

	lhu	$2,0($17)
	sh	$2,42($16)
	lhu	$2,2($17)
	sh	$2,44($16)
	lhu	$2,4($17)
	sh	$2,46($16)
	lh	$2,54($sp)
	sb	$2,2($16)
	lhu	$2,0($16)
	li	$3,-32768			# 0xffffffffffff8000
	or	$2,$2,$3
	sh	$2,0($16)
	sb	$0,3($16)
	sb	$0,51($16)
	sw	$0,8($16)
	li	$2,500			# 0x1f4
	sh	$2,4($16)
	lwc1	$f0,48($sp)
	swc1	$f0,12($16)
	sb	$0,40($16)
	li	$2,1			# 0x1
	sb	$2,41($16)
	lw	$31,28($sp)
	lw	$18,24($sp)
	lw	$17,20($sp)
	lw	$16,16($sp)
	jr	$31
	addiu	$sp,$sp,32

	.set	macro
	.set	reorder
	.end	SetCustomParticleBuffer
	.size	SetCustomParticleBuffer, .-SetCustomParticleBuffer
	.align	2
	.globl	AddCustomParticleBuffer
	.set	nomips16
	.set	nomicromips
	.ent	AddCustomParticleBuffer
	.type	AddCustomParticleBuffer, @function
AddCustomParticleBuffer:
	.frame	$sp,40,$31		# vars= 0, regs= 3/0, args= 24, gp= 0
	.mask	0x80030000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	lui	$2,%hi(C_particle_count)
	lhu	$9,%lo(C_particle_count)($2)
	sltu	$2,$9,200
	beq	$2,$0,$L12
	li	$8,200			# 0xc8

	addiu	$sp,$sp,-40
	sw	$31,36($sp)
	sw	$17,32($sp)
	sw	$16,28($sp)
	mtc1	$7,$f0
	lui	$2,%hi(CustomParticleBuffer)
	addiu	$2,$2,%lo(CustomParticleBuffer)
	move	$16,$0
$L11:
	lh	$3,0($2)
	beql	$3,$0,$L18
	addiu	$9,$9,1

	addiu	$16,$16,1
	bne	$16,$8,$L11
	addiu	$2,$2,64

	b	$L9
	li	$2,-1			# 0xffffffffffffffff

$L18:
	lui	$2,%hi(C_particle_count)
	sh	$9,%lo(C_particle_count)($2)
	sll	$2,$16,6
	lui	$17,%hi(CustomParticleBuffer)
	addiu	$17,$17,%lo(CustomParticleBuffer)
	addu	$17,$17,$2
	lh	$2,58($sp)
	sw	$2,20($sp)
	swc1	$f0,16($sp)
	move	$7,$6
	move	$6,$5
	move	$5,$4
	jal	SetCustomParticleBuffer
	move	$4,$17

	lb	$2,63($sp)
	sb	$2,48($17)
	sll	$2,$16,16
	sra	$2,$2,16
$L9:
	lw	$31,36($sp)
	lw	$17,32($sp)
	lw	$16,28($sp)
	jr	$31
	addiu	$sp,$sp,40

$L12:
	jr	$31
	li	$2,-1			# 0xffffffffffffffff

	.set	macro
	.set	reorder
	.end	AddCustomParticleBuffer
	.size	AddCustomParticleBuffer, .-AddCustomParticleBuffer
	.align	2
	.globl	Particle_Colormode
	.set	nomips16
	.set	nomicromips
	.ent	Particle_Colormode
	.type	Particle_Colormode, @function
Particle_Colormode:
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
	lbu	$2,48($4)
	addiu	$2,$2,-2
	sltu	$2,$2,2
	bne	$2,$0,$L23
	move	$16,$4

	lbu	$7,55($4)
	lbu	$6,54($4)
	lbu	$5,53($4)
	jal	ToumeIMode
	lbu	$4,52($4)

	lw	$31,28($sp)
$L24:
	lw	$18,24($sp)
	lw	$17,20($sp)
	lw	$16,16($sp)
	jr	$31
	addiu	$sp,$sp,32

$L23:
	jal	MakeRandomLimmit
	li	$4,200			# 0xc8

	move	$17,$2
	jal	MakeRandomLimmit
	li	$4,200			# 0xc8

	move	$18,$2
	jal	MakeRandomLimmit
	li	$4,200			# 0xc8

	lbu	$7,55($16)
	addiu	$6,$2,40
	addiu	$5,$18,40
	jal	ToumeIMode
	addiu	$4,$17,40

	b	$L24
	lw	$31,28($sp)

	.set	macro
	.set	reorder
	.end	Particle_Colormode
	.size	Particle_Colormode, .-Particle_Colormode
	.align	2
	.globl	Particle_Filtermode
	.set	nomips16
	.set	nomicromips
	.ent	Particle_Filtermode
	.type	Particle_Filtermode, @function
Particle_Filtermode:
	.frame	$sp,0,$31		# vars= 0, regs= 0/0, args= 0, gp= 0
	.mask	0x00000000,0
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	lbu	$2,48($4)
	li	$3,2			# 0x2
	beq	$2,$3,$L26
	sltu	$3,$2,3

	beq	$3,$0,$L27
	li	$3,3			# 0x3

	beq	$2,$0,$L30
	lui	$3,%hi(GraphPtrOffset)

$L31:
	lw	$2,%lo(GraphPtrOffset)($3)
	addiu	$4,$2,8
	sw	$4,%lo(GraphPtrOffset)($3)
	li	$3,-1174405120			# 0xffffffffba000000
	addiu	$3,$3,3074
	sw	$3,0($2)
	jr	$31
	sw	$0,4($2)

$L27:
	beq	$2,$3,$L31
	lui	$3,%hi(GraphPtrOffset)

	jr	$31
	nop

$L26:
	lui	$3,%hi(GraphPtrOffset)
$L30:
	lw	$2,%lo(GraphPtrOffset)($3)
	addiu	$4,$2,8
	sw	$4,%lo(GraphPtrOffset)($3)
	li	$3,-1174405120			# 0xffffffffba000000
	addiu	$3,$3,3074
	sw	$3,0($2)
	li	$3,8192			# 0x2000
	jr	$31
	sw	$3,4($2)

	.set	macro
	.set	reorder
	.end	Particle_Filtermode
	.size	Particle_Filtermode, .-Particle_Filtermode
	.align	2
	.globl	Particle_Onscreen
	.set	nomips16
	.set	nomicromips
	.ent	Particle_Onscreen
	.type	Particle_Onscreen, @function
Particle_Onscreen:
	.frame	$sp,0,$31		# vars= 0, regs= 0/0, args= 0, gp= 0
	.mask	0x00000000,0
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	beq	$6,$0,$L33
	li	$2,2			# 0x2

	beq	$5,$2,$L34
	slt	$2,$5,3

	beq	$2,$0,$L35
	li	$2,3			# 0x3

	beq	$5,$0,$L36
	li	$2,1			# 0x1

	bne	$5,$2,$L50
	nop

	lbu	$2,56($4)
	ori	$2,$2,0x2
	jr	$31
	sb	$2,56($4)

$L35:
	bne	$5,$2,$L50
	nop

	lbu	$2,56($4)
	ori	$2,$2,0x8
	jr	$31
	sb	$2,56($4)

$L36:
	lbu	$2,56($4)
	ori	$2,$2,0x1
	jr	$31
	sb	$2,56($4)

$L34:
	lbu	$2,56($4)
	ori	$2,$2,0x4
	jr	$31
	sb	$2,56($4)

$L33:
	beq	$5,$2,$L41
	slt	$2,$5,3

	beq	$2,$0,$L42
	li	$2,3			# 0x3

	beq	$5,$0,$L43
	li	$2,1			# 0x1

	bne	$5,$2,$L50
	nop

	lbu	$2,56($4)
	andi	$2,$2,0xfd
	jr	$31
	sb	$2,56($4)

$L42:
	bne	$5,$2,$L50
	nop

	lbu	$2,56($4)
	andi	$2,$2,0xf7
	jr	$31
	sb	$2,56($4)

$L50:
	jr	$31
	nop

$L43:
	lbu	$2,56($4)
	andi	$2,$2,0xfe
	jr	$31
	sb	$2,56($4)

$L41:
	lbu	$2,56($4)
	andi	$2,$2,0xfb
	jr	$31
	sb	$2,56($4)

	.set	macro
	.set	reorder
	.end	Particle_Onscreen
	.size	Particle_Onscreen, .-Particle_Onscreen
	.align	2
	.globl	Particle_UpdateVel_Move
	.set	nomips16
	.set	nomicromips
	.ent	Particle_UpdateVel_Move
	.type	Particle_UpdateVel_Move, @function
Particle_UpdateVel_Move:
	.frame	$sp,24,$31		# vars= 0, regs= 2/0, args= 16, gp= 0
	.mask	0x80010000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	addiu	$sp,$sp,-24
	sw	$31,20($sp)
	sw	$16,16($sp)
	move	$16,$4
	lbu	$4,57($4)
	sltu	$2,$4,10
	beq	$2,$0,$L52
	sll	$2,$4,2

	lui	$3,%hi($L54)
	addiu	$3,$3,%lo($L54)
	addu	$2,$3,$2
	lw	$2,0($2)
	jr	$2
	nop

	.rdata
	.align	2
	.align	2
$L54:
	.word	$L52
	.word	$L62
	.word	$L61
	.word	$L60
	.word	$L59
	.word	$L58
	.word	$L77
	.word	$L56
	.word	$L55
	.word	$L53
	.text
$L58:
	li	$2,2			# 0x2
$L57:
	lui	$3,%hi(g_InGame)
	lb	$5,%lo(g_InGame)($3)
	bne	$5,$0,$L68
	li	$3,1			# 0x1

$L76:
	li	$2,2			# 0x2
	beq	$4,$2,$L92
	lui	$2,%hi(GlobalFrameChar)

	sltu	$2,$4,3
	bne	$2,$0,$L86
	li	$2,3			# 0x3

	beq	$4,$2,$L93
	lui	$2,%hi(GlobalFrameChar)

	li	$2,4			# 0x4
	bnel	$4,$2,$L68
	move	$2,$0

$L67:
	lui	$2,%hi(GlobalFrameChar)
	lb	$4,%lo(GlobalFrameChar)($2)
	srl	$2,$4,31
	addu	$2,$2,$4
	b	$L68
	sra	$2,$2,1

$L62:
	lui	$2,%hi(KW2GFTimer)
	lb	$2,%lo(KW2GFTimer+3)($2)
	lui	$3,%hi(g_InGame)
	lb	$4,%lo(g_InGame)($3)
	beq	$4,$0,$L63
	move	$3,$0

	b	$L90
	lbu	$3,58($16)

$L61:
	lui	$2,%hi(KW4GFTimer)
	lb	$2,%lo(KW4GFTimer+3)($2)
	lui	$3,%hi(g_InGame)
	lb	$4,%lo(g_InGame)($3)
	bne	$4,$0,$L64
	move	$3,$0

	lui	$2,%hi(GlobalFrameChar)
$L92:
	lb	$4,%lo(GlobalFrameChar)($2)
	li	$2,715784192			# 0x2aaa0000
	ori	$2,$2,0xaaab
	mult	$4,$2
	mfhi	$2
	sra	$4,$4,31
	subu	$2,$2,$4
	sll	$2,$2,24
	b	$L68
	sra	$2,$2,24

$L60:
	lui	$2,%hi(KW8GFTimer)
	lui	$3,%hi(g_InGame)
	lb	$3,%lo(g_InGame)($3)
	bne	$3,$0,$L64
	lb	$2,%lo(KW8GFTimer+3)($2)

	move	$3,$0
	lui	$2,%hi(GlobalFrameChar)
$L93:
	lb	$4,%lo(GlobalFrameChar)($2)
	li	$2,1431633920			# 0x55550000
	addiu	$2,$2,21846
	mult	$4,$2
	mfhi	$2
	sra	$4,$4,31
	subu	$2,$2,$4
	sll	$2,$2,24
	b	$L68
	sra	$2,$2,24

$L59:
	lui	$2,%hi(KW16GFTimer)
	lui	$3,%hi(g_InGame)
	lb	$3,%lo(g_InGame)($3)
	beq	$3,$0,$L81
	lw	$2,%lo(KW16GFTimer)($2)

	sll	$2,$2,24
	b	$L64
	sra	$2,$2,24

$L56:
	b	$L57
	li	$2,4			# 0x4

$L55:
	b	$L57
	li	$2,5			# 0x5

$L53:
	b	$L57
	li	$2,6			# 0x6

$L77:
	b	$L57
	li	$2,3			# 0x3

$L86:
	li	$2,1			# 0x1
	bnel	$4,$2,$L88
	move	$2,$0

$L63:
	lui	$2,%hi(GlobalFrameChar)
	lb	$4,%lo(GlobalFrameChar)($2)
	li	$2,1717960704			# 0x66660000
	addiu	$2,$2,26215
	mult	$4,$2
	mfhi	$2
	sra	$2,$2,2
	sra	$4,$4,31
	subu	$2,$2,$4
	sll	$2,$2,24
	sra	$2,$2,24
$L88:
$L68:
	bnel	$3,$0,$L70
	lbu	$3,58($16)

$L64:
	lbu	$3,58($16)
$L90:
	lbu	$4,59($16)
	sltu	$5,$3,$4
	beql	$5,$0,$L94
	sb	$0,58($16)

	bnel	$2,$0,$L95
	lbu	$2,40($16)

	addiu	$3,$3,1
	andi	$3,$3,0x00ff
	sb	$3,58($16)
	sltu	$3,$3,$4
	bnel	$3,$0,$L95
	lbu	$2,40($16)

	sb	$0,58($16)
$L94:
	lbu	$2,40($16)
	addiu	$2,$2,1
	b	$L72
	sb	$2,40($16)

$L81:
	b	$L67
	move	$3,$0

$L70:
	lbu	$4,59($16)
	sltu	$5,$3,$4
	beql	$5,$0,$L96
	lbu	$2,40($16)

	addu	$5,$3,$2
	slt	$5,$5,$4
	bne	$5,$0,$L74
	addu	$2,$3,$2

	sb	$4,58($16)
$L73:
	lbu	$2,40($16)
$L96:
	addiu	$2,$2,1
	sb	$2,40($16)
$L72:
	lbu	$2,40($16)
$L95:
	lbu	$3,41($16)
	sltu	$2,$2,$3
	beq	$2,$0,$L89
	nop

	lwc1	$f0,16($16)
$L91:
	lwc1	$f2,28($16)
	add.s	$f0,$f0,$f2
	swc1	$f0,16($16)
	lwc1	$f0,20($16)
	lwc1	$f2,32($16)
	add.s	$f0,$f0,$f2
	swc1	$f0,20($16)
	lwc1	$f0,24($16)
	lwc1	$f2,36($16)
	add.s	$f0,$f0,$f2
	swc1	$f0,24($16)
	lw	$31,20($sp)
	lw	$16,16($sp)
	jr	$31
	addiu	$sp,$sp,24

$L74:
	b	$L73
	sb	$2,58($16)

$L89:
	jal	DeleteCustomParticleBuffer
	move	$4,$16

	b	$L91
	lwc1	$f0,16($16)

$L52:
	lui	$2,%hi(g_InGame)
	lb	$2,%lo(g_InGame)($2)
	beq	$2,$0,$L76
	move	$3,$0

	b	$L64
	move	$2,$0

	.set	macro
	.set	reorder
	.end	Particle_UpdateVel_Move
	.size	Particle_UpdateVel_Move, .-Particle_UpdateVel_Move
	.align	2
	.globl	ParticleCreate_Local
	.set	nomips16
	.set	nomicromips
	.ent	ParticleCreate_Local
	.type	ParticleCreate_Local, @function
ParticleCreate_Local:
	.frame	$sp,96,$31		# vars= 24, regs= 6/6, args= 24, gp= 0
	.mask	0x801f0000,-28
	.fmask	0x03f00000,-8
	.set	noreorder
	.set	nomacro
	addiu	$sp,$sp,-96
	sw	$31,68($sp)
	sw	$20,64($sp)
	sw	$19,60($sp)
	sw	$18,56($sp)
	sw	$17,52($sp)
	sw	$16,48($sp)
	sdc1	$f24,88($sp)
	sdc1	$f22,80($sp)
	sdc1	$f20,72($sp)
	move	$16,$4
	move	$20,$5
	move	$17,$6
	move	$5,$7
	lhu	$19,134($sp)
	lw	$18,152($sp)
	sw	$0,24($sp)
	lwc1	$f0,124($sp)
	swc1	$f0,28($sp)
	lwc1	$f0,120($sp)
	swc1	$f0,32($sp)
	sh	$0,36($sp)
	sh	$0,38($sp)
	li	$2,32760			# 0x7ff8
	sh	$2,40($sp)
	jal	MakeAlignVector
	addiu	$4,$sp,24

	lb	$2,139($sp)
	sw	$2,20($sp)
	sw	$16,16($sp)
	lw	$7,116($sp)
	addiu	$6,$sp,24
	addiu	$5,$sp,36
	jal	AddCustomParticleBuffer
	lw	$4,112($sp)

	move	$16,$2
	lui	$3,%hi(CustomParticleBuffer)
	sll	$2,$2,6
	addiu	$3,$3,%lo(CustomParticleBuffer)
	addu	$3,$3,$2
	sb	$20,7($3)
	lbu	$2,143($sp)
	sb	$2,57($3)
	sb	$0,58($3)
	lbu	$2,151($sp)
	sb	$2,6($3)
	lbu	$2,147($sp)
	sb	$2,41($3)
	lh	$2,130($sp)
	sh	$2,62($3)
	srl	$2,$18,24
	sb	$2,52($3)
	srl	$2,$18,16
	sb	$2,53($3)
	srl	$2,$18,8
	sb	$2,54($3)
	sb	$18,55($3)
	jal	MakeRandomLimmit
	move	$4,$19

	mtc1	$2,$f0
	nop
	cvt.s.w	$f24,$f0
	jal	MakeRandomLimmit
	move	$4,$19

	mtc1	$2,$f0
	nop
	cvt.s.w	$f22,$f0
	jal	MakeRandomLimmit
	move	$4,$19

	mtc1	$2,$f0
	nop
	cvt.s.w	$f20,$f0
	jal	MakeRandomLimmit
	li	$4,2			# 0x2

	bne	$2,$0,$L98
	sll	$3,$16,6

	lui	$2,%hi(CustomParticleBuffer)
	addiu	$2,$2,%lo(CustomParticleBuffer)
	addu	$3,$3,$2
	lwc1	$f0,16($3)
	add.s	$f0,$f0,$f24
	swc1	$f0,16($3)
	lwc1	$f0,20($3)
	add.s	$f0,$f0,$f22
	swc1	$f0,20($3)
	lwc1	$f0,24($3)
	add.s	$f0,$f0,$f20
	swc1	$f0,24($3)
$L99:
	beq	$17,$0,$L110
	lui	$3,%hi(CustomParticleBuffer)

	sll	$2,$16,6
	addiu	$3,$3,%lo(CustomParticleBuffer)
	addu	$2,$2,$3
	lhu	$3,0($2)
	ori	$3,$3,0x400
	sh	$3,0($2)
	lui	$3,%hi(CustomParticleBuffer)
$L110:
	sll	$2,$16,6
	addiu	$3,$3,%lo(CustomParticleBuffer)
	addu	$2,$3,$2
	lbu	$2,2($2)
	addiu	$2,$2,-3
	andi	$3,$2,0x00ff
	sltu	$3,$3,9
	beq	$3,$0,$L101
	andi	$2,$2,0x00ff

	sll	$2,$2,2
	lui	$3,%hi($L103)
	addiu	$3,$3,%lo($L103)
	addu	$2,$3,$2
	lw	$2,0($2)
	jr	$2
	nop

	.rdata
	.align	2
	.align	2
$L103:
	.word	$L107
	.word	$L101
	.word	$L107
	.word	$L107
	.word	$L106
	.word	$L105
	.word	$L104
	.word	$L101
	.word	$L102
	.text
$L98:
	lui	$2,%hi(CustomParticleBuffer)
	addiu	$2,$2,%lo(CustomParticleBuffer)
	addu	$3,$3,$2
	lwc1	$f0,16($3)
	sub.s	$f0,$f0,$f24
	swc1	$f0,16($3)
	lwc1	$f0,20($3)
	sub.s	$f0,$f0,$f22
	swc1	$f0,20($3)
	lwc1	$f0,24($3)
	sub.s	$f0,$f0,$f20
	b	$L99
	swc1	$f0,24($3)

$L101:
	lui	$3,%hi(CustomParticleBuffer)
	sll	$2,$16,6
	addiu	$3,$3,%lo(CustomParticleBuffer)
	addu	$2,$3,$2
	li	$3,6			# 0x6
	sb	$3,59($2)
$L108:
	move	$2,$16
	lw	$31,68($sp)
	lw	$20,64($sp)
	lw	$19,60($sp)
	lw	$18,56($sp)
	lw	$17,52($sp)
	lw	$16,48($sp)
	ldc1	$f24,88($sp)
	ldc1	$f22,80($sp)
	ldc1	$f20,72($sp)
	jr	$31
	addiu	$sp,$sp,96

$L107:
	lui	$3,%hi(CustomParticleBuffer)
	sll	$2,$16,6
	addiu	$3,$3,%lo(CustomParticleBuffer)
	addu	$2,$3,$2
	li	$3,7			# 0x7
	b	$L108
	sb	$3,59($2)

$L104:
	lui	$3,%hi(CustomParticleBuffer)
	sll	$2,$16,6
	addiu	$3,$3,%lo(CustomParticleBuffer)
	addu	$2,$3,$2
	li	$3,4			# 0x4
	b	$L108
	sb	$3,59($2)

$L102:
	lui	$3,%hi(CustomParticleBuffer)
	sll	$2,$16,6
	addiu	$3,$3,%lo(CustomParticleBuffer)
	addu	$2,$3,$2
	li	$3,3			# 0x3
	b	$L108
	sb	$3,59($2)

$L106:
	lui	$3,%hi(CustomParticleBuffer)
	sll	$2,$16,6
	addiu	$3,$3,%lo(CustomParticleBuffer)
	addu	$2,$3,$2
	li	$3,3000			# 0xbb8
	sh	$3,4($2)
	li	$3,1			# 0x1
	b	$L108
	sb	$3,59($2)

$L105:
	lui	$3,%hi(CustomParticleBuffer)
	sll	$2,$16,6
	addiu	$3,$3,%lo(CustomParticleBuffer)
	addu	$2,$3,$2
	li	$3,1			# 0x1
	b	$L108
	sb	$3,59($2)

	.set	macro
	.set	reorder
	.end	ParticleCreate_Local
	.size	ParticleCreate_Local, .-ParticleCreate_Local
	.align	2
	.globl	ParticleDraw_Common_32x32
	.set	nomips16
	.set	nomicromips
	.ent	ParticleDraw_Common_32x32
	.type	ParticleDraw_Common_32x32, @function
ParticleDraw_Common_32x32:
	.frame	$sp,56,$31		# vars= 0, regs= 8/0, args= 24, gp= 0
	.mask	0x807f0000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	addiu	$sp,$sp,-56
	sw	$31,52($sp)
	sw	$22,48($sp)
	sw	$21,44($sp)
	sw	$20,40($sp)
	sw	$19,36($sp)
	sw	$18,32($sp)
	sw	$17,28($sp)
	sw	$16,24($sp)
	move	$16,$4
	move	$17,$5
	lhu	$2,0($4)
	andi	$2,$2,0x400
	bne	$2,$0,$L112
	move	$18,$6

	lbu	$2,7($4)
	bne	$2,$5,$L140
	lw	$31,52($sp)

$L112:
	lhu	$5,4($16)
	sll	$3,$17,2
	lui	$2,%hi(GlobalCamera)
	addiu	$2,$2,%lo(GlobalCamera)
	addu	$2,$3,$2
	lw	$4,0($2)
	addiu	$20,$16,16
	lhu	$6,38($4)
	mult	$5,$5
	mflo	$2
	mtc1	$2,$f0
	nop
	cvt.s.w	$f0,$f0
	swc1	$f0,20($sp)
	lui	$2,%hi(g_screenViewAngle)
	addiu	$2,$2,%lo(g_screenViewAngle)
	addu	$3,$3,$2
	lwc1	$f0,0($3)
	swc1	$f0,16($sp)
	lui	$2,%hi($LC0)
	lw	$7,%lo($LC0)($2)
	jal	CheckDisplayRange
	move	$5,$20

	mtc1	$0,$f2
	nop
	c.lt.s	$f0,$f2
	nop
	bc1t	$L138
	lui	$2,%hi(g_InGame)

$L114:
	beq	$18,$0,$L133
	move	$21,$0

	li	$21,1			# 0x1
	lui	$19,%hi(KWTextureRGBA_AAZBBL_Init)
	addiu	$19,$19,%lo(KWTextureRGBA_AAZBBL_Init)
$L116:
	lbu	$2,6($16)
	beq	$2,$0,$L134
	lui	$18,%hi(Vtx_KTile32x32)

	lui	$18,%hi(Vtx_KTile32x32XFlip)
	addiu	$18,$18,%lo(Vtx_KTile32x32XFlip)
$L117:
	lbu	$2,2($16)
	sltu	$2,$2,12
	beq	$2,$0,$L141
	lui	$22,%hi(ParticleSmokePuffIA16)

	lbu	$2,2($16)
	sll	$3,$2,2
	lui	$2,%hi($L120)
	addiu	$2,$2,%lo($L120)
	addu	$2,$2,$3
	lw	$2,0($2)
	jr	$2
	nop

	.rdata
	.align	2
	.align	2
$L120:
	.word	$L135
	.word	$L129
	.word	$L128
	.word	$L135
	.word	$L127
	.word	$L126
	.word	$L125
	.word	$L124
	.word	$L123
	.word	$L122
	.word	$L121
	.word	$L119
	.text
$L138:
	lb	$3,%lo(g_InGame)($2)
	li	$2,1			# 0x1
	bne	$3,$2,$L114
	lw	$31,52($sp)

	b	$L143
	lw	$22,48($sp)

$L133:
	lui	$19,%hi(KWTextureIA_AAZBBL_Init)
	b	$L116
	addiu	$19,$19,%lo(KWTextureIA_AAZBBL_Init)

$L134:
	b	$L117
	addiu	$18,$18,%lo(Vtx_KTile32x32)

$L128:
	lui	$22,%hi(ParticlePuffIA16)
	addiu	$22,$22,%lo(ParticlePuffIA16)
$L118:
	lbu	$2,59($16)
	sltu	$2,$2,2
	bne	$2,$0,$L142
	lui	$2,%hi(g_InGame)

	lbu	$2,58($16)
	sll	$2,$2,11
	addu	$22,$22,$2
	lui	$2,%hi(g_InGame)
$L142:
	lb	$2,%lo(g_InGame)($2)
	bnel	$2,$0,$L139
	lhu	$2,46($16)

$L131:
	lw	$6,12($16)
	addiu	$5,$16,42
	jal	KWCreateAffine3D
	move	$4,$20

	bne	$21,$0,$L132
	lui	$3,%hi(GraphPtrOffset)

	lw	$2,%lo(GraphPtrOffset)($3)
	addiu	$4,$2,8
	sw	$4,%lo(GraphPtrOffset)($3)
	li	$3,100663296			# 0x6000000
	sw	$3,0($2)
	sw	$19,4($2)
	jal	Particle_Colormode
	move	$4,$16

	jal	Particle_Filtermode
	move	$4,$16

	li	$2,32			# 0x20
	sw	$2,20($sp)
	sw	$2,16($sp)
	li	$7,32			# 0x20
	li	$6,32			# 0x20
	move	$5,$18
	jal	KWTextureIA16_Sub
	move	$4,$22

	lw	$31,52($sp)
$L140:
	lw	$22,48($sp)
$L143:
	lw	$21,44($sp)
	lw	$20,40($sp)
	lw	$19,36($sp)
	lw	$18,32($sp)
	lw	$17,28($sp)
	lw	$16,24($sp)
	jr	$31
	addiu	$sp,$sp,56

$L127:
	lui	$22,%hi(ParticlePopIA16)
	b	$L118
	addiu	$22,$22,%lo(ParticlePopIA16)

$L129:
	lui	$22,%hi(ParticleSparkleIA16)
	b	$L118
	addiu	$22,$22,%lo(ParticleSparkleIA16)

$L121:
	lui	$22,%hi(ParticleMudSplatIA16)
	b	$L118
	addiu	$22,$22,%lo(ParticleMudSplatIA16)

$L126:
	lui	$22,%hi(ParticleBubblePopIA16)
	b	$L118
	addiu	$22,$22,%lo(ParticleBubblePopIA16)

$L124:
	lui	$22,%hi(ParticlePebbleIA16)
	b	$L118
	addiu	$22,$22,%lo(ParticlePebbleIA16)

$L123:
	lui	$22,%hi(ParticleBubbleIA16)
	b	$L118
	addiu	$22,$22,%lo(ParticleBubbleIA16)

$L125:
	lui	$22,%hi(ParticleExplosionRGBA16)
	b	$L118
	addiu	$22,$22,%lo(ParticleExplosionRGBA16)

$L122:
	lui	$22,%hi(ParticleSplatterIA16)
	b	$L118
	addiu	$22,$22,%lo(ParticleSplatterIA16)

$L119:
	lui	$22,%hi(ParticleDirtIA16)
	b	$L118
	addiu	$22,$22,%lo(ParticleDirtIA16)

$L135:
	lui	$22,%hi(ParticleSmokePuffIA16)
$L141:
	b	$L118
	addiu	$22,$22,%lo(ParticleSmokePuffIA16)

$L139:
	lhu	$3,62($16)
	addu	$2,$2,$3
	sh	$2,46($16)
	sll	$17,$17,2
	lui	$2,%hi(GlobalCamera)
	addiu	$2,$2,%lo(GlobalCamera)
	addu	$17,$17,$2
	lw	$6,0($17)
	lwc1	$f14,24($16)
	jal	KWLookCamera
	lwc1	$f12,16($16)

	b	$L131
	sh	$2,44($16)

$L132:
	lw	$2,%lo(GraphPtrOffset)($3)
	addiu	$4,$2,8
	sw	$4,%lo(GraphPtrOffset)($3)
	li	$3,100663296			# 0x6000000
	sw	$3,0($2)
	sw	$19,4($2)
	jal	Particle_Colormode
	move	$4,$16

	jal	Particle_Filtermode
	move	$4,$16

	li	$2,32			# 0x20
	sw	$2,16($sp)
	li	$7,32			# 0x20
	li	$6,32			# 0x20
	move	$5,$18
	jal	KWTextureRGBA_SubBL
	move	$4,$22

	b	$L140
	lw	$31,52($sp)

	.set	macro
	.set	reorder
	.end	ParticleDraw_Common_32x32
	.size	ParticleDraw_Common_32x32, .-ParticleDraw_Common_32x32
	.align	2
	.globl	DrawCustomParticle
	.set	nomips16
	.set	nomicromips
	.ent	DrawCustomParticle
	.type	DrawCustomParticle, @function
DrawCustomParticle:
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
	move	$19,$4
	lui	$16,%hi(CustomParticleBuffer)
	addiu	$16,$16,%lo(CustomParticleBuffer)
	addiu	$17,$16,12800
	b	$L149
	li	$18,6			# 0x6

$L153:
	andi	$2,$2,0x00ff
	sltu	$2,$2,5
	beql	$2,$0,$L155
	addiu	$16,$16,64

	move	$6,$0
$L154:
	jal	ParticleDraw_Common_32x32
	move	$5,$19

$L145:
	addiu	$16,$16,64
$L155:
	beq	$16,$17,$L152
	lw	$31,36($sp)

$L149:
	lh	$2,0($16)
	bgez	$2,$L145
	move	$4,$16

	andi	$2,$2,0x800
	bnel	$2,$0,$L155
	addiu	$16,$16,64

	lbu	$2,2($16)
	beq	$2,$18,$L146
	sltu	$3,$2,7

	bnel	$3,$0,$L153
	addiu	$2,$2,-1

	addiu	$2,$2,-7
	andi	$2,$2,0x00ff
	sltu	$2,$2,5
	beql	$2,$0,$L155
	addiu	$16,$16,64

	b	$L154
	move	$6,$0

$L146:
	li	$6,1			# 0x1
	jal	ParticleDraw_Common_32x32
	move	$5,$19

	b	$L155
	addiu	$16,$16,64

$L152:
	lw	$19,32($sp)
	lw	$18,28($sp)
	lw	$17,24($sp)
	lw	$16,20($sp)
	jr	$31
	addiu	$sp,$sp,40

	.set	macro
	.set	reorder
	.end	DrawCustomParticle
	.size	DrawCustomParticle, .-DrawCustomParticle
	.align	2
	.globl	MoveCustomParticle
	.set	nomips16
	.set	nomicromips
	.ent	MoveCustomParticle
	.type	MoveCustomParticle, @function
MoveCustomParticle:
	.frame	$sp,32,$31		# vars= 0, regs= 3/0, args= 16, gp= 0
	.mask	0x80030000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	lui	$2,%hi(g_gamePausedFlag)
	lb	$2,%lo(g_gamePausedFlag)($2)
	bne	$2,$0,$L167
	nop

	addiu	$sp,$sp,-32
	sw	$31,28($sp)
	sw	$17,24($sp)
	sw	$16,20($sp)
	lui	$16,%hi(CustomParticleBuffer)
	addiu	$16,$16,%lo(CustomParticleBuffer)
	b	$L159
	addiu	$17,$16,12800

$L158:
	addiu	$16,$16,64
$L166:
	beq	$16,$17,$L165
	lw	$31,28($sp)

$L159:
	lh	$2,0($16)
	bgez	$2,$L158
	move	$4,$16

	andi	$2,$2,0x800
	bne	$2,$0,$L166
	addiu	$16,$16,64

	jal	Particle_UpdateVel_Move
	nop

	b	$L166
	nop

$L165:
	lw	$17,24($sp)
	lw	$16,20($sp)
	jr	$31
	addiu	$sp,$sp,32

$L167:
	jr	$31
	nop

	.set	macro
	.set	reorder
	.end	MoveCustomParticle
	.size	MoveCustomParticle, .-MoveCustomParticle
	.globl	CustomParticleBuffer
	.section	.bss,"aw",@nobits
	.align	4
	.type	CustomParticleBuffer, @object
	.size	CustomParticleBuffer, 12800
CustomParticleBuffer:
	.space	12800
	.globl	C_particle_count
	.align	1
	.type	C_particle_count, @object
	.size	C_particle_count, 2
C_particle_count:
	.space	2
	.section	.rodata.cst4,"aM",@progbits,4
	.align	2
$LC0:
	.word	1137180672
	.ident	"GCC: (GNU) 10.1.0"
