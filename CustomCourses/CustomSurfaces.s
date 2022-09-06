	.file	1 "CustomSurfaces.c"
	.section .mdebug.abi32
	.previous
	.nan	legacy
	.module	fp=32
	.module	nooddspreg
	.text
	.align	2
	.globl	SurfaceSFX
	.set	nomips16
	.set	nomicromips
	.ent	SurfaceSFX
	.type	SurfaceSFX, @function
SurfaceSFX:
	.frame	$sp,0,$31		# vars= 0, regs= 0/0, args= 0, gp= 0
	.mask	0x00000000,0
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	lwc1	$f0,148($4)
	lui	$2,%hi($LC0)
	lwc1	$f2,%lo($LC0)($2)
	div.s	$f0,$f0,$f2
	lui	$2,%hi($LC1)
	lwc1	$f2,%lo($LC1)($2)
	mul.s	$f0,$f0,$f2
	mtc1	$6,$f2
	nop
	c.le.s	$f2,$f0
	nop
	bc1f	$L5
	nop

	lhu	$2,0($4)
	andi	$2,$2,0x4000
	beq	$2,$0,$L5
	lui	$2,%hi(GlobalPlayer)

	addiu	$2,$2,%lo(GlobalPlayer)
	subu	$4,$4,$2
	sra	$4,$4,3
	li	$2,-1473708032			# 0xffffffffa8290000
	ori	$2,$2,0x9b73
	mult	$4,$2
	mflo	$2
	sll	$2,$2,16
	sra	$2,$2,16
	sll	$3,$2,2
	lui	$4,%hi(g_PlayerSurfaceSoundID)
	addiu	$4,$4,%lo(g_PlayerSurfaceSoundID)
	addu	$3,$3,$4
	lw	$3,0($3)
	bne	$3,$0,$L5
	sll	$2,$2,2

	addu	$2,$2,$4
	sw	$5,0($2)
$L5:
	jr	$31
	nop

	.set	macro
	.set	reorder
	.end	SurfaceSFX
	.size	SurfaceSFX, .-SurfaceSFX
	.align	2
	.globl	AddGravityEdit
	.set	nomips16
	.set	nomicromips
	.ent	AddGravityEdit
	.type	AddGravityEdit, @function
AddGravityEdit:
	.frame	$sp,48,$31		# vars= 0, regs= 7/0, args= 16, gp= 0
	.mask	0x803f0000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	addiu	$sp,$sp,-48
	sw	$31,44($sp)
	sw	$21,40($sp)
	sw	$20,36($sp)
	sw	$19,32($sp)
	sw	$18,28($sp)
	sw	$17,24($sp)
	sw	$16,20($sp)
	move	$16,$4
	lui	$2,%hi(GlobalPlayer)
	addiu	$2,$2,%lo(GlobalPlayer)
	subu	$2,$4,$2
	sra	$2,$2,3
	li	$3,-1473708032			# 0xffffffffa8290000
	ori	$3,$3,0x9b73
	mult	$2,$3
	mflo	$19
	sll	$17,$19,16
	sra	$17,$17,16
	lhu	$2,0($4)
	andi	$2,$2,0x100
	beq	$2,$0,$L7
	move	$18,$17

	beq	$17,$0,$L7
	li	$18,7			# 0x7

	addiu	$18,$19,4
	sll	$18,$18,16
	sra	$18,$18,16
$L7:
	jal	AddGravity
	move	$4,$16

	lui	$2,%hi(g_startingIndicator)
	lw	$2,%lo(g_startingIndicator)($2)
	addiu	$2,$2,-3
	sltu	$2,$2,3
	beq	$2,$0,$L8
	lui	$2,%hi(g_FadingFlag+4)

	lb	$2,%lo(g_FadingFlag+4)($2)
	bne	$2,$0,$L8
	li	$3,18			# 0x12

	lhu	$2,248($16)
	beq	$2,$3,$L11
	addiu	$3,$2,-237

	andi	$3,$3,0xffff
	sltu	$3,$3,15
	beq	$3,$0,$L12
	addiu	$2,$2,-237

	andi	$3,$2,0xffff
	sltu	$3,$3,15
	beq	$3,$0,$L12
	andi	$2,$2,0xffff

	sll	$2,$2,2
	lui	$3,%hi($L14)
	addiu	$3,$3,%lo($L14)
	addu	$2,$3,$2
	lw	$2,0($2)
	jr	$2
	nop

	.rdata
	.align	2
	.align	2
$L14:
	.word	$L19
	.word	$L18
	.word	$L17
	.word	$L16
	.word	$L12
	.word	$L12
	.word	$L12
	.word	$L12
	.word	$L12
	.word	$L12
	.word	$L12
	.word	$L12
	.word	$L15
	.word	$L12
	.word	$L13
	.text
$L8:
	sw	$0,528($16)
	lui	$2,%hi(CustomWaterHeight)
	addiu	$2,$2,%lo(CustomWaterHeight)
	addu	$2,$17,$2
	sb	$0,0($2)
	sll	$17,$17,1
	lui	$2,%hi(SurfaceStorage)
	addiu	$2,$2,%lo(SurfaceStorage)
	addu	$17,$17,$2
	sh	$0,0($17)
$L6:
	lw	$31,44($sp)
$L95:
	lw	$21,40($sp)
$L102:
	lw	$20,36($sp)
	lw	$19,32($sp)
	lw	$18,28($sp)
	lw	$17,24($sp)
	lw	$16,20($sp)
	jr	$31
	addiu	$sp,$sp,48

$L19:
	lh	$2,194($16)
	bnel	$2,$0,$L89
	lw	$3,188($16)

	lhu	$2,598($16)
	bnel	$2,$0,$L89
	lw	$3,188($16)

	move	$5,$0
	jal	RouletteStart
	move	$4,$17

	b	$L89
	lw	$3,188($16)

$L16:
	lh	$2,194($16)
	bnel	$2,$0,$L89
	lw	$3,188($16)

	lhu	$2,598($16)
	bnel	$2,$0,$L89
	lw	$3,188($16)

	li	$5,1			# 0x1
	sll	$4,$19,24
	jal	SetShrunken
	sra	$4,$4,24

	b	$L89
	lw	$3,188($16)

$L17:
	lh	$2,194($16)
	bnel	$2,$0,$L89
	lw	$3,188($16)

	lhu	$2,598($16)
	bnel	$2,$0,$L89
	lw	$3,188($16)

	lw	$2,188($16)
	li	$3,50397184			# 0x3010000
	addiu	$3,$3,3264
	and	$2,$2,$3
	bne	$2,$0,$L99
	move	$20,$17

	move	$5,$17
	jal	SetStar
	move	$4,$16

	b	$L89
	lw	$3,188($16)

$L13:
	lh	$2,194($16)
	bnel	$2,$0,$L89
	lw	$3,188($16)

	lhu	$2,598($16)
	bnel	$2,$0,$L89
	lw	$3,188($16)

	sll	$5,$19,24
	sra	$5,$5,24
	jal	SetFastOoB
	move	$4,$16

	b	$L89
	lw	$3,188($16)

$L18:
	lh	$2,194($16)
	bnel	$2,$0,$L89
	lw	$3,188($16)

	lhu	$2,598($16)
	bnel	$2,$0,$L89
	lw	$3,188($16)

	lw	$2,188($16)
	li	$3,50397184			# 0x3010000
	addiu	$3,$3,3264
	and	$2,$2,$3
	bne	$2,$0,$L99
	move	$20,$17

	li	$5,1			# 0x1
	sll	$4,$19,24
	jal	SetGhostEffect
	sra	$4,$4,24

	b	$L89
	lw	$3,188($16)

$L15:
	lwc1	$f2,156($16)
	lui	$2,%hi($LC2)
	lwc1	$f0,%lo($LC2)($2)
	c.lt.s	$f2,$f0
	nop
	bc1tl	$L21
	sw	$0,528($16)

$L21:
	li	$2,80			# 0x50
	sh	$2,220($16)
$L12:
	lw	$3,188($16)
$L89:
	li	$2,50397184			# 0x3010000
	addiu	$2,$2,3264
	and	$2,$3,$2
	bne	$2,$0,$L99
	move	$20,$17

	lhu	$2,202($16)
	andi	$2,$2,0x2
	beq	$2,$0,$L24
	sll	$2,$17,1

	move	$20,$17
$L99:
	sll	$17,$17,1
	lui	$2,%hi(SurfaceStorage)
	addiu	$2,$2,%lo(SurfaceStorage)
	addu	$17,$17,$2
	sh	$0,0($17)
	sw	$0,528($16)
$L25:
	lwc1	$f0,528($16)
$L90:
	trunc.w.s $f0,$f0
	mfc1	$2,$f0
	li	$3,235			# 0xeb
	beq	$2,$3,$L39
	li	$3,236			# 0xec

	bnel	$2,$3,$L100
	lhu	$3,248($16)

	lh	$2,194($16)
	slt	$2,$2,11
	beql	$2,$0,$L101
	lhu	$2,0($16)

	sll	$18,$18,2
	lui	$2,%hi(GlobalController)
	addiu	$2,$2,%lo(GlobalController)
	addu	$18,$18,$2
	lw	$2,0($18)
	lhu	$2,6($2)
	andi	$2,$2,0x10
	beql	$2,$0,$L101
	lhu	$2,0($16)

	lwc1	$f0,148($16)
	lui	$2,%hi($LC0)
	lwc1	$f2,%lo($LC0)($2)
	div.s	$f0,$f0,$f2
	lui	$2,%hi($LC1)
	lwc1	$f2,%lo($LC1)($2)
	mul.s	$f0,$f0,$f2
	lui	$2,%hi($LC9)
	lwc1	$f2,%lo($LC9)($2)
	c.le.s	$f2,$f0
	nop
	bc1fl	$L101
	lhu	$2,0($16)

	lw	$2,188($16)
	li	$3,50921472			# 0x3090000
	addiu	$3,$3,3264
	and	$2,$2,$3
	bnel	$2,$0,$L101
	lhu	$2,0($16)

	sll	$2,$20,1
	lui	$3,%hi(SurfaceStorage)
	addiu	$3,$3,%lo(SurfaceStorage)
	addu	$2,$2,$3
	lhu	$2,0($2)
	andi	$2,$2,0x1
	beq	$2,$0,$L83
	lhu	$2,0($16)

$L101:
	andi	$3,$2,0x1000
	beql	$3,$0,$L100
	lhu	$3,248($16)

	lbu	$4,420($16)
	li	$3,236			# 0xec
	bnel	$4,$3,$L84
	ori	$2,$2,0x80

$L40:
	lhu	$3,248($16)
$L100:
	mtc1	$3,$f0
	nop
	cvt.s.w	$f0,$f0
	lwc1	$f2,528($16)
	c.eq.s	$f2,$f0
	nop
	bc1t	$L95
	lw	$31,44($sp)

	lh	$2,194($16)
	bne	$2,$0,$L102
	lw	$21,40($sp)

	addiu	$2,$3,-235
$L110:
	andi	$4,$2,0xffff
	sltu	$4,$4,15
	beq	$4,$0,$L54
	andi	$2,$2,0xffff

	sll	$2,$2,2
	lui	$4,%hi($L56)
	addiu	$4,$4,%lo($L56)
	addu	$2,$4,$2
	lw	$2,0($2)
	jr	$2
	nop

	.rdata
	.align	2
	.align	2
$L56:
	.word	$L65
	.word	$L54
	.word	$L54
	.word	$L54
	.word	$L54
	.word	$L54
	.word	$L64
	.word	$L63
	.word	$L62
	.word	$L61
	.word	$L60
	.word	$L59
	.word	$L58
	.word	$L57
	.word	$L55
	.text
$L11:
	lh	$2,194($16)
	bnel	$2,$0,$L89
	lw	$3,188($16)

	lhu	$2,598($16)
	bnel	$2,$0,$L89
	lw	$3,188($16)

	lw	$2,188($16)
	andi	$2,$2,0x201
	bnel	$2,$0,$L89
	lw	$3,188($16)

	lui	$2,%hi($LC3)
	lw	$6,%lo($LC3)($2)
	li	$5,7			# 0x7
	jal	SurfaceSFX
	move	$4,$16

	lhu	$2,0($16)
	andi	$2,$2,0x1000
	beq	$2,$0,$L103
	lui	$2,%hi($LC4)

	lhu	$2,68($16)
	andi	$2,$2,0x10
	beq	$2,$0,$L23
	lui	$2,%hi($LC4)

	li	$2,1			# 0x1
	b	$L12
	sh	$2,248($16)

$L23:
$L103:
	lwc1	$f0,%lo($LC4)($2)
	b	$L12
	swc1	$f0,260($16)

$L24:
	lui	$4,%hi(SurfaceStorage)
	addiu	$4,$4,%lo(SurfaceStorage)
	addu	$2,$2,$4
	lhu	$2,0($2)
	andi	$2,$2,0x1
	beq	$2,$0,$L26
	move	$20,$17

	lwc1	$f2,292($16)
	lui	$2,%hi($LC5)
	lwc1	$f0,%lo($LC5)($2)
	c.le.s	$f0,$f2
	nop
	bc1fl	$L104
	lh	$2,194($16)

	lui	$2,%hi($LC6)
	lwc1	$f0,%lo($LC6)($2)
	swc1	$f0,256($16)
	lh	$2,194($16)
$L104:
	slt	$4,$2,40
	bne	$4,$0,$L29
	nop

	li	$2,-589824			# 0xfffffffffff70000
	ori	$2,$2,0xffff
	and	$3,$3,$2
	sw	$3,188($16)
	lhu	$2,46($16)
	sh	$2,174($16)
	lhu	$2,0($16)
$L91:
	andi	$2,$2,0x80
	beq	$2,$0,$L85
	sll	$21,$19,24

$L26:
	sll	$2,$17,1
$L92:
	lui	$3,%hi(SurfaceStorage)
	addiu	$3,$3,%lo(SurfaceStorage)
	addu	$2,$2,$3
	lhu	$2,0($2)
	andi	$2,$2,0x2
	beq	$2,$0,$L25
	lui	$2,%hi($LC5)

	lwc1	$f2,292($16)
	lwc1	$f0,%lo($LC5)($2)
	c.le.s	$f0,$f2
	nop
	bc1fl	$L105
	lh	$2,194($16)

	lui	$3,%hi(GlobalPlayer)
	sll	$2,$17,3
	subu	$2,$2,$17
	sll	$2,$2,4
	subu	$2,$2,$17
	sll	$2,$2,2
	subu	$2,$2,$17
	sll	$2,$2,3
	addiu	$3,$3,%lo(GlobalPlayer)
	addu	$2,$3,$2
	lw	$2,332($2)
	mtc1	$2,$f0
	nop
	cvt.d.w	$f0,$f0
	lui	$2,%hi($LC8)
	ldc1	$f2,%lo($LC8)($2)
	mul.d	$f0,$f0,$f2
	cvt.s.d	$f0,$f0
	swc1	$f0,256($16)
	lh	$2,194($16)
$L105:
	slt	$3,$2,40
	bne	$3,$0,$L35
	li	$3,-589824			# 0xfffffffffff70000

	lw	$2,188($16)
	ori	$3,$3,0xffff
	and	$2,$2,$3
	sw	$2,188($16)
	lhu	$2,46($16)
	sh	$2,174($16)
	lhu	$2,0($16)
$L93:
	andi	$2,$2,0x80
	bnel	$2,$0,$L90
	lwc1	$f0,528($16)

	sll	$21,$19,24
	sra	$21,$21,24
	jal	SetAnimMusicNote
	move	$4,$21

	lw	$2,188($16)
	andi	$3,$2,0x2000
	beq	$3,$0,$L37
	li	$3,50397184			# 0x3010000

	lhu	$2,220($16)
	addiu	$2,$2,15
	sh	$2,220($16)
$L38:
	sll	$17,$17,1
$L107:
	lui	$2,%hi(SurfaceStorage)
	addiu	$2,$2,%lo(SurfaceStorage)
	addu	$17,$17,$2
	sh	$0,0($17)
	sw	$0,56($16)
	lui	$2,%hi($LC7)
	lw	$7,%lo($LC7)($2)
	li	$6,5242880			# 0x500000
	addiu	$6,$6,80
	move	$5,$21
	jal	MakeBodyColor
	move	$4,$16

	b	$L90
	lwc1	$f0,528($16)

$L29:
	bnel	$2,$0,$L91
	lhu	$2,0($16)

	jal	ResetWing
	move	$4,$16

	b	$L91
	lhu	$2,0($16)

$L85:
	sra	$21,$21,24
	jal	SetAnimMusicNote
	move	$4,$21

	lw	$2,188($16)
	andi	$3,$2,0x2000
	beq	$3,$0,$L31
	li	$3,50397184			# 0x3010000

	lhu	$2,220($16)
	addiu	$2,$2,15
	sh	$2,220($16)
$L32:
	sll	$2,$17,1
$L106:
	lui	$3,%hi(SurfaceStorage)
	addiu	$3,$3,%lo(SurfaceStorage)
	addu	$2,$2,$3
	sh	$0,0($2)
	sw	$0,56($16)
	lui	$2,%hi($LC7)
	lw	$7,%lo($LC7)($2)
	li	$6,5242880			# 0x500000
	addiu	$6,$6,80
	move	$5,$21
	jal	MakeBodyColor
	move	$4,$16

	b	$L92
	sll	$2,$17,1

$L31:
	addiu	$3,$3,3264
	and	$2,$2,$3
	bnel	$2,$0,$L106
	sll	$2,$17,1

	move	$5,$21
	jal	SetTurbo
	move	$4,$16

	li	$2,3			# 0x3
	b	$L32
	sh	$2,220($16)

$L35:
	bnel	$2,$0,$L93
	lhu	$2,0($16)

	jal	ResetWing
	move	$4,$16

	b	$L93
	lhu	$2,0($16)

$L37:
	addiu	$3,$3,3264
	and	$2,$2,$3
	bnel	$2,$0,$L107
	sll	$17,$17,1

	move	$5,$21
	jal	SetTurbo
	move	$4,$16

	li	$2,3			# 0x3
	b	$L38
	sh	$2,220($16)

$L83:
	ori	$2,$2,0x80
	sh	$2,0($16)
	sll	$17,$19,24
	sra	$17,$17,24
	jal	SetAnimBonkStars
	move	$4,$17

	lw	$2,188($16)
	andi	$2,$2,0x2000
	beq	$2,$0,$L43
	move	$5,$17

	lh	$18,220($16)
	jal	SetWing
	move	$4,$16

	lw	$2,188($16)
	ori	$2,$2,0x2000
	sw	$2,188($16)
	sh	$18,220($16)
	sh	$0,194($16)
$L94:
	lhu	$2,248($16)
	mtc1	$2,$f0
	nop
	cvt.s.w	$f0,$f0
	lwc1	$f2,528($16)
	c.eq.s	$f2,$f0
	nop
	bc1tl	$L108
	sll	$2,$20,1

	mtc1	$2,$f0
	nop
	cvt.s.w	$f0,$f0
	swc1	$f0,528($16)
	sll	$2,$20,1
$L108:
	lui	$3,%hi(SurfaceStorage)
	addiu	$3,$3,%lo(SurfaceStorage)
	addu	$2,$2,$3
	li	$3,1			# 0x1
	b	$L46
	sh	$3,0($2)

$L43:
	jal	SetWing
	move	$4,$16

	b	$L94
	sh	$0,194($16)

$L84:
	sh	$2,0($16)
	sll	$17,$19,24
	sra	$17,$17,24
	jal	SetAnimBonkStars
	move	$4,$17

	move	$5,$17
	jal	SetWing
	move	$4,$16

	sh	$0,194($16)
	lhu	$2,248($16)
	mtc1	$2,$f0
	nop
	cvt.s.w	$f0,$f0
	lwc1	$f2,528($16)
	c.eq.s	$f2,$f0
	nop
	bc1t	$L109
	sll	$20,$20,1

	mtc1	$2,$f0
	nop
	cvt.s.w	$f0,$f0
	swc1	$f0,528($16)
$L109:
	lui	$2,%hi(SurfaceStorage)
	addiu	$2,$2,%lo(SurfaceStorage)
	addu	$20,$20,$2
	li	$2,1			# 0x1
	sh	$2,0($20)
$L46:
	lhu	$3,248($16)
	mtc1	$3,$f0
	nop
	cvt.s.w	$f0,$f0
	lwc1	$f2,528($16)
	c.eq.s	$f2,$f0
	nop
	bc1f	$L110
	addiu	$2,$3,-235

	b	$L95
	lw	$31,44($sp)

$L39:
	lh	$2,194($16)
	slt	$2,$2,11
	beql	$2,$0,$L111
	lhu	$2,0($16)

	sll	$18,$18,2
	lui	$2,%hi(GlobalController)
	addiu	$2,$2,%lo(GlobalController)
	addu	$18,$18,$2
	lw	$2,0($18)
	lhu	$2,6($2)
	andi	$2,$2,0x10
	beql	$2,$0,$L111
	lhu	$2,0($16)

	lwc1	$f0,148($16)
	lui	$2,%hi($LC0)
	lwc1	$f2,%lo($LC0)($2)
	div.s	$f0,$f0,$f2
	lui	$2,%hi($LC1)
	lwc1	$f2,%lo($LC1)($2)
	mul.s	$f0,$f0,$f2
	lui	$2,%hi($LC9)
	lwc1	$f2,%lo($LC9)($2)
	c.le.s	$f2,$f0
	nop
	bc1fl	$L111
	lhu	$2,0($16)

	lw	$2,188($16)
	li	$3,50921472			# 0x3090000
	addiu	$3,$3,3264
	and	$2,$2,$3
	bnel	$2,$0,$L111
	lhu	$2,0($16)

	sll	$2,$20,1
	lui	$3,%hi(SurfaceStorage)
	addiu	$3,$3,%lo(SurfaceStorage)
	addu	$2,$2,$3
	lhu	$2,0($2)
	andi	$2,$2,0x2
	beq	$2,$0,$L86
	lhu	$2,0($16)

$L111:
	andi	$2,$2,0x1000
	beql	$2,$0,$L100
	lhu	$3,248($16)

	lbu	$3,420($16)
	li	$2,235			# 0xeb
	beql	$3,$2,$L100
	lhu	$3,248($16)

	lui	$3,%hi(GlobalPlayer)
	sll	$2,$20,3
	subu	$2,$2,$20
	sll	$2,$2,4
	subu	$2,$2,$20
	sll	$2,$2,2
	subu	$2,$2,$20
	sll	$2,$2,3
	addiu	$3,$3,%lo(GlobalPlayer)
	addu	$2,$3,$2
	lhu	$4,282($2)
	lui	$3,%hi(gFaceBuffer)
	lw	$5,%lo(gFaceBuffer)($3)
	sll	$3,$4,1
	addu	$3,$3,$4
	sll	$3,$3,2
	subu	$3,$3,$4
	sll	$3,$3,2
	addu	$3,$3,$5
	lw	$3,16($3)
	lbu	$3,14($3)
	sw	$3,332($2)
	lhu	$2,0($16)
	ori	$2,$2,0x80
	sh	$2,0($16)
	sll	$17,$19,24
	sra	$17,$17,24
	jal	SetAnimBonkStars
	move	$4,$17

	move	$5,$17
	jal	SetWing
	move	$4,$16

	sh	$0,194($16)
	lhu	$2,248($16)
	mtc1	$2,$f0
	nop
	cvt.s.w	$f0,$f0
	lwc1	$f2,528($16)
	c.eq.s	$f2,$f0
	nop
	bc1t	$L112
	sll	$20,$20,1

	mtc1	$2,$f0
	nop
	cvt.s.w	$f0,$f0
	swc1	$f0,528($16)
$L112:
	lui	$2,%hi(SurfaceStorage)
	addiu	$2,$2,%lo(SurfaceStorage)
	addu	$20,$20,$2
	li	$2,2			# 0x2
	b	$L46
	sh	$2,0($20)

$L86:
	ori	$2,$2,0x80
	sh	$2,0($16)
	sll	$17,$19,24
	sra	$17,$17,24
	jal	SetAnimBonkStars
	move	$4,$17

	lw	$2,188($16)
	andi	$2,$2,0x2000
	beq	$2,$0,$L50
	move	$5,$17

	lh	$18,220($16)
	jal	SetWing
	move	$4,$16

	lw	$2,188($16)
	ori	$2,$2,0x2000
	sw	$2,188($16)
	sh	$18,220($16)
	sh	$0,194($16)
$L96:
	lhu	$2,248($16)
	mtc1	$2,$f0
	nop
	cvt.s.w	$f0,$f0
	lwc1	$f2,528($16)
	c.eq.s	$f2,$f0
	nop
	bc1t	$L113
	lui	$3,%hi(GlobalPlayer)

	mtc1	$2,$f0
	nop
	cvt.s.w	$f0,$f0
	swc1	$f0,528($16)
$L113:
	sll	$2,$20,3
	subu	$2,$2,$20
	sll	$2,$2,4
	subu	$2,$2,$20
	sll	$2,$2,2
	subu	$2,$2,$20
	sll	$2,$2,3
	addiu	$3,$3,%lo(GlobalPlayer)
	addu	$3,$3,$2
	lhu	$4,282($3)
	lui	$2,%hi(gFaceBuffer)
	lw	$5,%lo(gFaceBuffer)($2)
	sll	$2,$4,1
	addu	$2,$2,$4
	sll	$2,$2,2
	subu	$2,$2,$4
	sll	$2,$2,2
	addu	$2,$2,$5
	lw	$2,16($2)
	lbu	$2,14($2)
	sw	$2,332($3)
	sll	$2,$20,1
	lui	$3,%hi(SurfaceStorage)
	addiu	$3,$3,%lo(SurfaceStorage)
	addu	$2,$2,$3
	li	$3,2			# 0x2
	b	$L40
	sh	$3,0($2)

$L50:
	jal	SetWing
	move	$4,$16

	b	$L96
	sh	$0,194($16)

$L64:
	lhu	$2,598($16)
	bnel	$2,$0,$L114
	lwc1	$f0,528($16)

	lw	$2,188($16)
	li	$3,50397184			# 0x3010000
	addiu	$3,$3,3264
	and	$2,$2,$3
	beq	$2,$0,$L87
	sll	$4,$19,24

	lwc1	$f0,528($16)
$L114:
	trunc.w.s $f0,$f0
	mfc1	$2,$f0
	li	$3,239			# 0xef
	beq	$2,$3,$L69
	li	$3,240			# 0xf0

	beq	$2,$3,$L72
	li	$3,238			# 0xee

	bne	$2,$3,$L95
	lw	$31,44($sp)

	lhu	$3,248($16)
$L98:
	li	$2,238			# 0xee
	beql	$3,$2,$L95
	lw	$31,44($sp)

	b	$L97
	move	$5,$0

$L87:
	jal	SetMapObjectHit
	sra	$4,$4,24

	lhu	$2,248($16)
	mtc1	$2,$f0
	nop
	cvt.s.w	$f0,$f0
	lwc1	$f2,528($16)
	c.eq.s	$f2,$f0
	nop
	bc1tl	$L115
	lwc1	$f0,528($16)

	mtc1	$2,$f0
	nop
	cvt.s.w	$f0,$f0
	b	$L67
	swc1	$f0,528($16)

$L63:
	lhu	$2,598($16)
	bnel	$2,$0,$L114
	lwc1	$f0,528($16)

	lw	$2,188($16)
	li	$3,50397184			# 0x3010000
	addiu	$3,$3,3264
	and	$2,$2,$3
	bnel	$2,$0,$L114
	lwc1	$f0,528($16)

	sll	$4,$19,24
	jal	SetRedShellHit
	sra	$4,$4,24

	lhu	$2,248($16)
	mtc1	$2,$f0
	nop
	cvt.s.w	$f0,$f0
	lwc1	$f2,528($16)
	c.eq.s	$f2,$f0
	nop
	bc1tl	$L115
	lwc1	$f0,528($16)

	mtc1	$2,$f0
	nop
	cvt.s.w	$f0,$f0
	b	$L67
	swc1	$f0,528($16)

$L62:
	lhu	$2,598($16)
	bnel	$2,$0,$L114
	lwc1	$f0,528($16)

	lw	$2,188($16)
	li	$3,50397184			# 0x3010000
	addiu	$3,$3,3264
	and	$2,$2,$3
	bnel	$2,$0,$L114
	lwc1	$f0,528($16)

	sll	$4,$19,24
	jal	SetGreenShellHit
	sra	$4,$4,24

	lhu	$2,248($16)
	mtc1	$2,$f0
	nop
	cvt.s.w	$f0,$f0
	lwc1	$f2,528($16)
	c.eq.s	$f2,$f0
	nop
	bc1tl	$L115
	lwc1	$f0,528($16)

	mtc1	$2,$f0
	nop
	cvt.s.w	$f0,$f0
	b	$L67
	swc1	$f0,528($16)

$L61:
	lhu	$2,598($16)
	bnel	$2,$0,$L114
	lwc1	$f0,528($16)

	lw	$2,188($16)
	li	$3,50397184			# 0x3010000
	addiu	$3,$3,3264
	and	$2,$2,$3
	bnel	$2,$0,$L114
	lwc1	$f0,528($16)

	sll	$4,$19,24
	jal	SetFailedStart
	sra	$4,$4,24

	lhu	$2,248($16)
	mtc1	$2,$f0
	nop
	cvt.s.w	$f0,$f0
	lwc1	$f2,528($16)
	c.eq.s	$f2,$f0
	nop
	bc1tl	$L115
	lwc1	$f0,528($16)

	mtc1	$2,$f0
	nop
	cvt.s.w	$f0,$f0
	b	$L67
	swc1	$f0,528($16)

$L60:
	lhu	$2,598($16)
	bnel	$2,$0,$L114
	lwc1	$f0,528($16)

	lw	$2,188($16)
	li	$3,50397184			# 0x3010000
	addiu	$3,$3,3264
	and	$2,$2,$3
	bnel	$2,$0,$L114
	lwc1	$f0,528($16)

	sll	$4,$19,24
	jal	SetSpinOut
	sra	$4,$4,24

	lhu	$2,248($16)
	mtc1	$2,$f0
	nop
	cvt.s.w	$f0,$f0
	lwc1	$f2,528($16)
	c.eq.s	$f2,$f0
	nop
	bc1tl	$L115
	lwc1	$f0,528($16)

	mtc1	$2,$f0
	nop
	cvt.s.w	$f0,$f0
	b	$L67
	swc1	$f0,528($16)

$L59:
	lhu	$2,598($16)
	bnel	$2,$0,$L114
	lwc1	$f0,528($16)

	lw	$2,188($16)
	li	$3,50397184			# 0x3010000
	addiu	$3,$3,3264
	and	$2,$2,$3
	beq	$2,$0,$L88
	sll	$4,$19,24

	lwc1	$f0,528($16)
$L116:
	trunc.w.s $f0,$f0
	mfc1	$2,$f0
	li	$3,239			# 0xef
	beq	$2,$3,$L69
	li	$3,240			# 0xf0

	beq	$2,$3,$L70
	li	$3,238			# 0xee

	bnel	$2,$3,$L95
	lw	$31,44($sp)

	move	$5,$0
$L97:
	sll	$4,$19,24
	jal	SetGhostEffect
	sra	$4,$4,24

	b	$L95
	lw	$31,44($sp)

$L88:
	jal	SetSpinOutSaveable
	sra	$4,$4,24

	lhu	$2,248($16)
	mtc1	$2,$f0
	nop
	cvt.s.w	$f0,$f0
	lwc1	$f2,528($16)
	c.eq.s	$f2,$f0
	nop
	bc1tl	$L115
	lwc1	$f0,528($16)

	mtc1	$2,$f0
	nop
	cvt.s.w	$f0,$f0
	b	$L67
	swc1	$f0,528($16)

$L57:
	lhu	$2,598($16)
	bnel	$2,$0,$L116
	lwc1	$f0,528($16)

	lw	$2,188($16)
	li	$3,50397184			# 0x3010000
	addiu	$3,$3,3264
	and	$2,$2,$3
	bnel	$2,$0,$L116
	lwc1	$f0,528($16)

	sll	$5,$19,24
	sra	$5,$5,24
	jal	SetWing
	move	$4,$16

	lhu	$2,248($16)
	mtc1	$2,$f0
	nop
	cvt.s.w	$f0,$f0
	lwc1	$f2,528($16)
	c.eq.s	$f2,$f0
	nop
	bc1tl	$L115
	lwc1	$f0,528($16)

	mtc1	$2,$f0
	nop
	cvt.s.w	$f0,$f0
	b	$L67
	swc1	$f0,528($16)

$L58:
	lhu	$2,598($16)
	bnel	$2,$0,$L116
	lwc1	$f0,528($16)

	lw	$2,188($16)
	li	$3,50397184			# 0x3010000
	addiu	$3,$3,3264
	and	$2,$2,$3
	bnel	$2,$0,$L116
	lwc1	$f0,528($16)

	sll	$5,$19,24
	sra	$5,$5,24
	jal	SetStorm
	move	$4,$16

	lhu	$2,248($16)
	mtc1	$2,$f0
	nop
	cvt.s.w	$f0,$f0
	lwc1	$f2,528($16)
	c.eq.s	$f2,$f0
	nop
	bc1tl	$L115
	lwc1	$f0,528($16)

	mtc1	$2,$f0
	nop
	cvt.s.w	$f0,$f0
	b	$L67
	swc1	$f0,528($16)

$L55:
	lhu	$2,598($16)
	bnel	$2,$0,$L116
	lwc1	$f0,528($16)

	lw	$2,188($16)
	li	$3,50397184			# 0x3010000
	addiu	$3,$3,3264
	and	$2,$2,$3
	bnel	$2,$0,$L116
	lwc1	$f0,528($16)

	sll	$5,$19,24
	sra	$5,$5,24
	jal	SetTurbo
	move	$4,$16

	lhu	$2,248($16)
	mtc1	$2,$f0
	nop
	cvt.s.w	$f0,$f0
	lwc1	$f2,528($16)
	c.eq.s	$f2,$f0
	nop
	bc1tl	$L115
	lwc1	$f0,528($16)

	mtc1	$2,$f0
	nop
	cvt.s.w	$f0,$f0
	b	$L67
	swc1	$f0,528($16)

$L65:
	lui	$2,%hi($LC10)
	lwc1	$f0,%lo($LC10)($2)
	b	$L6
	swc1	$f0,528($16)

$L54:
	mtc1	$3,$f0
	nop
	cvt.s.w	$f0,$f0
	swc1	$f0,528($16)
$L67:
	lwc1	$f0,528($16)
$L115:
	trunc.w.s $f0,$f0
	mfc1	$2,$f0
	li	$3,239			# 0xef
	beq	$2,$3,$L69
	li	$3,240			# 0xf0

	beq	$2,$3,$L70
	li	$3,238			# 0xee

	bne	$2,$3,$L95
	lw	$31,44($sp)

	b	$L98
	lhu	$3,248($16)

$L70:
	lhu	$3,248($16)
	li	$2,240			# 0xf0
	beql	$3,$2,$L95
	lw	$31,44($sp)

$L72:
	move	$5,$0
	sll	$4,$19,24
	jal	SetShrunken
	sra	$4,$4,24

	b	$L95
	lw	$31,44($sp)

$L69:
	lhu	$3,248($16)
	li	$2,239			# 0xef
	beql	$3,$2,$L95
	lw	$31,44($sp)

	sll	$5,$19,24
	sra	$5,$5,24
	jal	ResetStar
	move	$4,$16

	b	$L95
	lw	$31,44($sp)

	.set	macro
	.set	reorder
	.end	AddGravityEdit
	.size	AddGravityEdit, .-AddGravityEdit
	.align	2
	.globl	CheckMapBG_ZX_Hook
	.set	nomips16
	.set	nomicromips
	.ent	CheckMapBG_ZX_Hook
	.type	CheckMapBG_ZX_Hook, @function
CheckMapBG_ZX_Hook:
	.frame	$sp,40,$31		# vars= 0, regs= 1/0, args= 32, gp= 0
	.mask	0x80000000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	addiu	$sp,$sp,-40
	sw	$31,36($sp)
	lui	$2,%hi(HotSwapID)
	lh	$2,%lo(HotSwapID)($2)
	blez	$2,$L118
	lui	$2,%hi(GlobalPlayer)

	addiu	$2,$2,%lo(GlobalPlayer)
	subu	$2,$4,$2
	sra	$2,$2,3
	li	$3,-1473708032			# 0xffffffffa8290000
	ori	$3,$3,0x9b73
	mult	$2,$3
	mflo	$2
	sll	$2,$2,16
	lhu	$8,248($4)
	li	$3,250			# 0xfa
	bne	$8,$3,$L119
	sra	$2,$2,16

	lui	$3,%hi(CustomWaterHeight)
	addiu	$3,$3,%lo(CustomWaterHeight)
	addu	$3,$2,$3
	li	$5,1			# 0x1
	sb	$5,0($3)
	sll	$2,$2,2
	lui	$3,%hi(g_waterlevelPlayer)
	addiu	$3,$3,%lo(g_waterlevelPlayer)
	addu	$2,$2,$3
	lwc1	$f0,24($4)
	lwc1	$f2,548($4)
	sub.s	$f0,$f0,$f2
	lwc1	$f2,112($4)
	sub.s	$f0,$f0,$f2
	lwc1	$f2,292($4)
	sub.s	$f0,$f0,$f2
	swc1	$f0,0($2)
	lw	$31,36($sp)
$L122:
	jr	$31
	addiu	$sp,$sp,40

$L119:
	lui	$3,%hi(CustomWaterHeight)
	addiu	$3,$3,%lo(CustomWaterHeight)
	addu	$2,$2,$3
	sb	$0,0($2)
	lw	$2,68($sp)
	sw	$2,28($sp)
	lw	$2,64($sp)
	sw	$2,24($sp)
	lw	$2,60($sp)
	sw	$2,20($sp)
	lw	$2,56($sp)
	jal	CheckMapBG_ZX
	sw	$2,16($sp)

	b	$L122
	lw	$31,36($sp)

$L118:
	lw	$2,68($sp)
	sw	$2,28($sp)
	lw	$2,64($sp)
	sw	$2,24($sp)
	lw	$2,60($sp)
	sw	$2,20($sp)
	lw	$2,56($sp)
	jal	CheckMapBG_ZX
	sw	$2,16($sp)

	b	$L122
	lw	$31,36($sp)

	.set	macro
	.set	reorder
	.end	CheckMapBG_ZX_Hook
	.size	CheckMapBG_ZX_Hook, .-CheckMapBG_ZX_Hook
	.align	2
	.globl	InitCustomSmoke
	.set	nomips16
	.set	nomicromips
	.ent	InitCustomSmoke
	.type	InitCustomSmoke, @function
InitCustomSmoke:
	.frame	$sp,96,$31		# vars= 0, regs= 7/0, args= 64, gp= 0
	.mask	0x803f0000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	addiu	$sp,$sp,-96
	sw	$31,92($sp)
	sw	$21,88($sp)
	sw	$20,84($sp)
	sw	$19,80($sp)
	sw	$18,76($sp)
	sw	$17,72($sp)
	sw	$16,68($sp)
	lw	$3,116($sp)
	li	$2,18			# 0x12
	beq	$3,$2,$L132
	move	$16,$4

$L123:
	lw	$31,92($sp)
$L134:
	lw	$21,88($sp)
	lw	$20,84($sp)
	lw	$19,80($sp)
	lw	$18,76($sp)
	lw	$17,72($sp)
	lw	$16,68($sp)
	jr	$31
	addiu	$sp,$sp,96

$L132:
	move	$17,$5
	move	$18,$7
	lui	$2,%hi(GlobalPlayer)
	addiu	$2,$2,%lo(GlobalPlayer)
	subu	$2,$4,$2
	sra	$2,$2,3
	li	$3,-1473708032			# 0xffffffffa8290000
	ori	$3,$3,0x9b73
	mult	$2,$3
	mflo	$19
	sll	$19,$19,16
	bne	$7,$0,$L125
	sra	$19,$19,16

	lw	$2,112($sp)
	sll	$2,$2,3
	lw	$3,112($sp)
	addu	$2,$2,$3
	sll	$2,$2,3
	addu	$2,$4,$2
	lh	$2,1350($2)
	blez	$2,$L133
	sll	$2,$3,3

	lwc1	$f0,148($16)
$L135:
	lui	$2,%hi($LC0)
	lwc1	$f2,%lo($LC0)($2)
	div.s	$f0,$f0,$f2
	lui	$2,%hi($LC1)
	lwc1	$f2,%lo($LC1)($2)
	mul.s	$f0,$f0,$f2
	lui	$2,%hi($LC11)
	lwc1	$f2,%lo($LC11)($2)
	c.le.s	$f2,$f0
	nop
	bc1fl	$L134
	lw	$31,92($sp)

	addiu	$18,$16,1320
	lw	$2,120($sp)
	sll	$2,$2,24
	sra	$2,$2,24
	sw	$2,24($sp)
	li	$2,18			# 0x12
	sw	$2,20($sp)
	lwc1	$f0,8($17)
	swc1	$f0,16($sp)
	lw	$7,4($17)
	lw	$6,0($17)
	move	$5,$18
	jal	MakePos
	move	$4,$16

	lui	$2,%hi($LC12)
	lw	$6,%lo($LC12)($2)
	li	$5,2			# 0x2
	jal	MakeStartup
	move	$4,$18

	li	$6,100			# 0x64
	li	$5,1048576			# 0x100000
	jal	MakeRDP
	move	$4,$18

	li	$2,1			# 0x1
	sh	$2,1384($16)
	lhu	$7,46($16)
	subu	$7,$0,$7
	li	$2,-427032576			# 0xffffffffe68c0000
	addiu	$2,$2,10415
	sw	$2,56($sp)
	lw	$2,120($sp)
	andi	$2,$2,0x00ff
	sw	$2,52($sp)
	li	$2,1			# 0x1
	sw	$2,48($sp)
	sw	$0,44($sp)
	sw	$0,40($sp)
	sw	$2,36($sp)
	sw	$0,32($sp)
	sw	$0,28($sp)
	lwc1	$f0,148($16)
	lui	$2,%hi($LC0)
	lwc1	$f2,%lo($LC0)($2)
	div.s	$f0,$f0,$f2
	lui	$2,%hi($LC1)
	lwc1	$f2,%lo($LC1)($2)
	mul.s	$f0,$f0,$f2
	lui	$2,%hi($LC13)
	lwc1	$f2,%lo($LC13)($2)
	div.s	$f0,$f0,$f2
	swc1	$f0,24($sp)
	lui	$2,%hi($LC14)
	lwc1	$f0,%lo($LC14)($2)
	swc1	$f0,20($sp)
	sw	$17,16($sp)
	sll	$7,$7,16
	sra	$7,$7,16
	move	$6,$0
	move	$5,$19
	jal	ParticleCreate_Local
	li	$4,10			# 0xa

	b	$L134
	lw	$31,92($sp)

$L133:
	addu	$2,$2,$3
	sll	$2,$2,3
	addu	$2,$4,$2
	lh	$2,1348($2)
	bne	$2,$0,$L134
	lw	$31,92($sp)

	b	$L135
	lwc1	$f0,148($16)

$L125:
	lw	$2,112($sp)
	sll	$2,$2,3
	lw	$3,112($sp)
	addu	$2,$2,$3
	sll	$2,$2,3
	addu	$2,$4,$2
	lh	$2,1350($2)
	blez	$2,$L123
	lui	$2,%hi($LC0)

	lwc1	$f0,148($4)
	lwc1	$f2,%lo($LC0)($2)
	div.s	$f0,$f0,$f2
	lui	$2,%hi($LC1)
	lwc1	$f2,%lo($LC1)($2)
	mul.s	$f0,$f0,$f2
	lui	$2,%hi($LC11)
	lwc1	$f2,%lo($LC11)($2)
	c.le.s	$f2,$f0
	nop
	bc1fl	$L134
	lw	$31,92($sp)

	sll	$21,$7,3
	addu	$20,$21,$7
	sll	$20,$20,3
	addiu	$20,$20,1320
	addu	$20,$4,$20
	lw	$2,120($sp)
	sll	$2,$2,24
	sra	$2,$2,24
	sw	$2,24($sp)
	li	$2,18			# 0x12
	sw	$2,20($sp)
	lwc1	$f0,8($5)
	swc1	$f0,16($sp)
	lw	$7,4($5)
	lw	$6,0($5)
	jal	MakePos
	move	$5,$20

	lui	$2,%hi($LC15)
	lw	$6,%lo($LC15)($2)
	li	$5,5			# 0x5
	jal	MakeStartup
	move	$4,$20

	li	$6,100			# 0x64
	li	$5,1048576			# 0x100000
	jal	MakeRDP
	move	$4,$20

	addu	$2,$21,$18
	sll	$2,$2,3
	addu	$2,$16,$2
	li	$3,1			# 0x1
	sh	$3,1384($2)
	lhu	$7,46($16)
	subu	$7,$0,$7
	li	$2,-427032576			# 0xffffffffe68c0000
	addiu	$2,$2,10415
	sw	$2,56($sp)
	lw	$2,120($sp)
	andi	$2,$2,0x00ff
	sw	$2,52($sp)
	li	$2,1			# 0x1
	sw	$2,48($sp)
	sw	$0,44($sp)
	sw	$0,40($sp)
	sw	$2,36($sp)
	sw	$0,32($sp)
	sw	$0,28($sp)
	lwc1	$f0,148($16)
	lui	$2,%hi($LC0)
	lwc1	$f2,%lo($LC0)($2)
	div.s	$f0,$f0,$f2
	lui	$2,%hi($LC1)
	lwc1	$f2,%lo($LC1)($2)
	mul.s	$f0,$f0,$f2
	lui	$2,%hi($LC13)
	lwc1	$f2,%lo($LC13)($2)
	div.s	$f0,$f0,$f2
	swc1	$f0,24($sp)
	lui	$2,%hi($LC14)
	lwc1	$f0,%lo($LC14)($2)
	swc1	$f0,20($sp)
	sw	$17,16($sp)
	sll	$7,$7,16
	sra	$7,$7,16
	move	$6,$0
	move	$5,$19
	jal	ParticleCreate_Local
	li	$4,10			# 0xa

	b	$L134
	lw	$31,92($sp)

	.set	macro
	.set	reorder
	.end	InitCustomSmoke
	.size	InitCustomSmoke, .-InitCustomSmoke
	.align	2
	.globl	InitRndSmokeHook
	.set	nomips16
	.set	nomicromips
	.ent	InitRndSmokeHook
	.type	InitRndSmokeHook, @function
InitRndSmokeHook:
	.frame	$sp,72,$31		# vars= 24, regs= 4/0, args= 32, gp= 0
	.mask	0x80070000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	addiu	$sp,$sp,-72
	sw	$31,68($sp)
	sw	$18,64($sp)
	sw	$17,60($sp)
	sw	$16,56($sp)
	move	$16,$4
	move	$17,$5
	move	$18,$6
	lb	$2,91($sp)
	jal	InitRndSmoke
	sw	$2,16($sp)

	jal	MakeRandomLimmit
	li	$4,10			# 0xa

	sw	$0,32($sp)
	sw	$0,36($sp)
	sw	$0,40($sp)
	sw	$0,44($sp)
	sw	$0,48($sp)
	sw	$0,52($sp)
	andi	$4,$2,0xfff7
	bne	$4,$0,$L137
	li	$3,255			# 0xff

	lwc1	$f0,456($16)
	swc1	$f0,32($sp)
	lwc1	$f2,472($16)
	lui	$3,%hi($LC7)
	lwc1	$f4,%lo($LC7)($3)
	add.s	$f2,$f2,$f4
	swc1	$f2,36($sp)
	lwc1	$f0,464($16)
	swc1	$f0,40($sp)
	lwc1	$f0,408($16)
	swc1	$f0,44($sp)
	lwc1	$f0,424($16)
	add.s	$f0,$f0,$f4
	swc1	$f0,48($sp)
	lwc1	$f0,416($16)
	swc1	$f0,52($sp)
	lbu	$3,468($16)
$L137:
	andi	$2,$2,0xfffb
	li	$5,2			# 0x2
	beq	$2,$5,$L142
	li	$4,1			# 0x1

$L138:
	sw	$4,24($sp)
	sw	$3,20($sp)
	sw	$18,16($sp)
	move	$7,$17
	addiu	$6,$sp,44
	addiu	$5,$sp,32
	jal	InitCustomSmoke
	move	$4,$16

	lw	$31,68($sp)
	lw	$18,64($sp)
	lw	$17,60($sp)
	lw	$16,56($sp)
	jr	$31
	addiu	$sp,$sp,72

$L142:
	lwc1	$f0,480($16)
	swc1	$f0,32($sp)
	lwc1	$f2,496($16)
	lui	$2,%hi($LC7)
	lwc1	$f4,%lo($LC7)($2)
	add.s	$f2,$f2,$f4
	swc1	$f2,36($sp)
	lwc1	$f0,488($16)
	swc1	$f0,40($sp)
	lwc1	$f0,432($16)
	swc1	$f0,44($sp)
	lwc1	$f0,448($16)
	add.s	$f0,$f0,$f4
	swc1	$f0,48($sp)
	lwc1	$f0,440($16)
	swc1	$f0,52($sp)
	lbu	$3,492($16)
	b	$L138
	move	$4,$0

	.set	macro
	.set	reorder
	.end	InitRndSmokeHook
	.size	InitRndSmokeHook, .-InitRndSmokeHook
	.align	2
	.globl	InitRapidSmokeHook
	.set	nomips16
	.set	nomicromips
	.ent	InitRapidSmokeHook
	.type	InitRapidSmokeHook, @function
InitRapidSmokeHook:
	.frame	$sp,72,$31		# vars= 24, regs= 4/0, args= 32, gp= 0
	.mask	0x80070000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	addiu	$sp,$sp,-72
	sw	$31,68($sp)
	sw	$18,64($sp)
	sw	$17,60($sp)
	sw	$16,56($sp)
	move	$16,$4
	move	$17,$5
	move	$18,$6
	lb	$2,91($sp)
	jal	InitRapidSmoke
	sw	$2,16($sp)

	jal	MakeRandomLimmit
	li	$4,10			# 0xa

	sw	$0,32($sp)
	sw	$0,36($sp)
	sw	$0,40($sp)
	sw	$0,44($sp)
	sw	$0,48($sp)
	sw	$0,52($sp)
	andi	$4,$2,0xfff7
	bne	$4,$0,$L144
	li	$3,255			# 0xff

	lwc1	$f0,456($16)
	swc1	$f0,32($sp)
	lwc1	$f2,472($16)
	lui	$3,%hi($LC7)
	lwc1	$f4,%lo($LC7)($3)
	add.s	$f2,$f2,$f4
	swc1	$f2,36($sp)
	lwc1	$f0,464($16)
	swc1	$f0,40($sp)
	lwc1	$f0,408($16)
	swc1	$f0,44($sp)
	lwc1	$f0,424($16)
	add.s	$f0,$f0,$f4
	swc1	$f0,48($sp)
	lwc1	$f0,416($16)
	swc1	$f0,52($sp)
	lbu	$3,468($16)
$L144:
	andi	$2,$2,0xfffb
	li	$5,2			# 0x2
	beq	$2,$5,$L149
	li	$4,1			# 0x1

$L145:
	sw	$4,24($sp)
	sw	$3,20($sp)
	sw	$18,16($sp)
	move	$7,$17
	addiu	$6,$sp,44
	addiu	$5,$sp,32
	jal	InitCustomSmoke
	move	$4,$16

	lw	$31,68($sp)
	lw	$18,64($sp)
	lw	$17,60($sp)
	lw	$16,56($sp)
	jr	$31
	addiu	$sp,$sp,72

$L149:
	lwc1	$f0,480($16)
	swc1	$f0,32($sp)
	lwc1	$f2,496($16)
	lui	$2,%hi($LC7)
	lwc1	$f4,%lo($LC7)($2)
	add.s	$f2,$f2,$f4
	swc1	$f2,36($sp)
	lwc1	$f0,488($16)
	swc1	$f0,40($sp)
	lwc1	$f0,432($16)
	swc1	$f0,44($sp)
	lwc1	$f0,448($16)
	add.s	$f0,$f0,$f4
	swc1	$f0,48($sp)
	lwc1	$f0,440($16)
	swc1	$f0,52($sp)
	lbu	$3,492($16)
	b	$L145
	move	$4,$0

	.set	macro
	.set	reorder
	.end	InitRapidSmokeHook
	.size	InitRapidSmokeHook, .-InitRapidSmokeHook
	.align	2
	.globl	InitSpinSmokeHook
	.set	nomips16
	.set	nomicromips
	.ent	InitSpinSmokeHook
	.type	InitSpinSmokeHook, @function
InitSpinSmokeHook:
	.frame	$sp,72,$31		# vars= 24, regs= 4/0, args= 32, gp= 0
	.mask	0x80070000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	addiu	$sp,$sp,-72
	sw	$31,68($sp)
	sw	$18,64($sp)
	sw	$17,60($sp)
	sw	$16,56($sp)
	move	$16,$4
	move	$17,$5
	move	$18,$6
	lb	$2,91($sp)
	jal	InitSpinSmoke
	sw	$2,16($sp)

	jal	MakeRandomLimmit
	li	$4,10			# 0xa

	sw	$0,32($sp)
	sw	$0,36($sp)
	sw	$0,40($sp)
	sw	$0,44($sp)
	sw	$0,48($sp)
	sw	$0,52($sp)
	andi	$4,$2,0xfff7
	bne	$4,$0,$L151
	li	$3,255			# 0xff

	lwc1	$f0,456($16)
	swc1	$f0,32($sp)
	lwc1	$f2,472($16)
	lui	$3,%hi($LC7)
	lwc1	$f4,%lo($LC7)($3)
	add.s	$f2,$f2,$f4
	swc1	$f2,36($sp)
	lwc1	$f0,464($16)
	swc1	$f0,40($sp)
	lwc1	$f0,408($16)
	swc1	$f0,44($sp)
	lwc1	$f0,424($16)
	add.s	$f0,$f0,$f4
	swc1	$f0,48($sp)
	lwc1	$f0,416($16)
	swc1	$f0,52($sp)
	lbu	$3,468($16)
$L151:
	andi	$2,$2,0xfffb
	li	$5,2			# 0x2
	beq	$2,$5,$L156
	li	$4,1			# 0x1

$L152:
	sw	$4,24($sp)
	sw	$3,20($sp)
	sw	$18,16($sp)
	move	$7,$17
	addiu	$6,$sp,44
	addiu	$5,$sp,32
	jal	InitCustomSmoke
	move	$4,$16

	lw	$31,68($sp)
	lw	$18,64($sp)
	lw	$17,60($sp)
	lw	$16,56($sp)
	jr	$31
	addiu	$sp,$sp,72

$L156:
	lwc1	$f0,480($16)
	swc1	$f0,32($sp)
	lwc1	$f2,496($16)
	lui	$2,%hi($LC7)
	lwc1	$f4,%lo($LC7)($2)
	add.s	$f2,$f2,$f4
	swc1	$f2,36($sp)
	lwc1	$f0,488($16)
	swc1	$f0,40($sp)
	lwc1	$f0,432($16)
	swc1	$f0,44($sp)
	lwc1	$f0,448($16)
	add.s	$f0,$f0,$f4
	swc1	$f0,48($sp)
	lwc1	$f0,440($16)
	swc1	$f0,52($sp)
	lbu	$3,492($16)
	b	$L152
	move	$4,$0

	.set	macro
	.set	reorder
	.end	InitSpinSmokeHook
	.size	InitSpinSmokeHook, .-InitSpinSmokeHook
	.globl	SurfaceStorage
	.section	.bss,"aw",@nobits
	.align	2
	.type	SurfaceStorage, @object
	.size	SurfaceStorage, 16
SurfaceStorage:
	.space	16
	.section	.rodata.cst4,"aM",@progbits,4
	.align	2
$LC0:
	.word	1099956224
	.align	2
$LC1:
	.word	1129840640
	.align	2
$LC2:
	.word	1133903872
	.align	2
$LC3:
	.word	1092616192
	.align	2
$LC4:
	.word	1059481190
	.align	2
$LC5:
	.word	1045220557
	.align	2
$LC6:
	.word	1165623296
	.align	2
$LC7:
	.word	1073741824
	.section	.rodata.cst8,"aM",@progbits,8
	.align	3
$LC8:
	.word	1079574528
	.word	0
	.section	.rodata.cst4
	.align	2
$LC9:
	.word	1106247680
	.align	2
$LC10:
	.word	1131085824
	.align	2
$LC11:
	.word	1084227584
	.align	2
$LC12:
	.word	1061158912
	.align	2
$LC13:
	.word	1128792064
	.align	2
$LC14:
	.word	1050253722
	.align	2
$LC15:
	.word	1065353216
	.ident	"GCC: (GNU) 10.1.0"
