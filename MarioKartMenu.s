	.file	1 "MarioKartMenu.c"
	.section .mdebug.abi32
	.previous
	.nan	legacy
	.module	fp=32
	.module	nooddspreg
	.text
	.align	2
	.globl	PrintMenuTest
	.set	nomips16
	.set	nomicromips
	.ent	PrintMenuTest
	.type	PrintMenuTest, @function
PrintMenuTest:
	.frame	$sp,0,$31		# vars= 0, regs= 0/0, args= 0, gp= 0
	.mask	0x00000000,0
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	jr	$31
	nop

	.set	macro
	.set	reorder
	.end	PrintMenuTest
	.size	PrintMenuTest, .-PrintMenuTest
	.section	.rodata.str1.4,"aMS",@progbits,1
	.align	2
$LC1:
	.ascii	"Total Time:\000"
	.align	2
$LC2:
	.ascii	"'\000"
	.align	2
$LC3:
	.ascii	"\000"
	.align	2
$LC4:
	.ascii	"\"\000"
	.text
	.align	2
	.globl	printGPTime
	.set	nomips16
	.set	nomicromips
	.ent	printGPTime
	.type	printGPTime, @function
printGPTime:
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
	trunc.w.s $f0,$f12
	mfc1	$3,$f0
	lui	$2,%hi(wholeNumber)
	swc1	$f0,%lo(wholeNumber)($2)
	cvt.s.w	$f0,$f0
	sub.s	$f12,$f12,$f0
	lui	$2,%hi($LC0)
	lwc1	$f0,%lo($LC0)($2)
	mul.s	$f12,$f12,$f0
	trunc.w.s $f0,$f12
	mfc1	$2,$f0
	nop
	bltz	$2,$L3
	move	$16,$5

	lui	$4,%hi(decimalNumber)
	swc1	$f0,%lo(decimalNumber)($4)
$L4:
	slt	$2,$3,61
	bne	$2,$0,$L5
	lui	$2,%hi(seconds)

	li	$2,-2004353024			# 0xffffffff88880000
	ori	$2,$2,0x8889
	mult	$3,$2
	mfhi	$2
	addu	$2,$2,$3
	sra	$2,$2,5
	sra	$4,$3,31
	subu	$2,$2,$4
	lui	$4,%hi(minutes)
	sw	$2,%lo(minutes)($4)
	sll	$4,$2,4
	subu	$2,$2,$4
	sll	$2,$2,2
	addu	$2,$2,$3
	lui	$3,%hi(seconds)
	sw	$2,%lo(seconds)($3)
$L6:
	lui	$2,%hi(minutes)
	lw	$2,%lo(minutes)($2)
	slt	$3,$2,10
	bnel	$3,$0,$L7
	lui	$2,%hi(printOffsetA)

	slt	$3,$2,100
	bnel	$3,$0,$L8
	lui	$2,%hi(printOffsetA)

	slt	$2,$2,1000
	bne	$2,$0,$L9
	lui	$2,%hi(printOffsetA)

	li	$3,40			# 0x28
	b	$L10
	sw	$3,%lo(printOffsetA)($2)

$L3:
	subu	$2,$0,$2
	lui	$4,%hi(decimalNumber)
	b	$L4
	sw	$2,%lo(decimalNumber)($4)

$L5:
	b	$L6
	sw	$3,%lo(seconds)($2)

$L9:
	li	$3,32			# 0x20
	b	$L10
	sw	$3,%lo(printOffsetA)($2)

$L8:
	li	$3,24			# 0x18
	b	$L10
	sw	$3,%lo(printOffsetA)($2)

$L7:
	li	$3,16			# 0x10
	sw	$3,%lo(printOffsetA)($2)
$L10:
	lui	$2,%hi(seconds)
	lw	$2,%lo(seconds)($2)
	slt	$3,$2,10
	bnel	$3,$0,$L11
	lui	$2,%hi(printOffsetB)

	slt	$3,$2,100
	bnel	$3,$0,$L12
	lui	$2,%hi(printOffsetB)

	slt	$2,$2,1000
	bne	$2,$0,$L13
	lui	$2,%hi(printOffsetB)

	li	$3,40			# 0x28
	b	$L14
	sw	$3,%lo(printOffsetB)($2)

$L13:
	li	$3,32			# 0x20
	b	$L14
	sw	$3,%lo(printOffsetB)($2)

$L12:
	li	$3,24			# 0x18
	b	$L14
	sw	$3,%lo(printOffsetB)($2)

$L11:
	li	$3,16			# 0x10
	sw	$3,%lo(printOffsetB)($2)
$L14:
	lui	$3,%hi(printOffsetB)
	lui	$18,%hi(printOffsetA)
	lw	$2,%lo(printOffsetB)($3)
	lw	$4,%lo(printOffsetA)($18)
	addu	$2,$2,$4
	jal	loadFont
	sw	$2,%lo(printOffsetB)($3)

	addiu	$5,$16,170
	sll	$5,$5,16
	sra	$5,$5,16
	lui	$16,%hi(MenuPosition)
	addiu	$17,$16,%lo(MenuPosition)
	sh	$5,2($17)
	li	$2,55			# 0x37
	sh	$2,%lo(MenuPosition)($16)
	lui	$6,%hi($LC1)
	addiu	$6,$6,%lo($LC1)
	jal	printString
	li	$4,55			# 0x37

	li	$2,145			# 0x91
	sh	$2,%lo(MenuPosition)($16)
	lw	$4,%lo(printOffsetA)($18)
	lui	$6,%hi($LC2)
	addiu	$6,$6,%lo($LC2)
	lh	$5,2($17)
	jal	printString
	addiu	$4,$4,145

	lui	$2,%hi(seconds)
	lw	$2,%lo(seconds)($2)
	slt	$2,$2,10
	bnel	$2,$0,$L18
	lh	$4,%lo(MenuPosition)($16)

$L15:
	lui	$2,%hi(MenuPosition)
	addiu	$3,$2,%lo(MenuPosition)
	lh	$4,%lo(MenuPosition)($2)
	lui	$2,%hi(printOffsetB)
	lw	$2,%lo(printOffsetB)($2)
	lui	$6,%hi($LC4)
	addiu	$6,$6,%lo($LC4)
	lh	$5,2($3)
	jal	printString
	addu	$4,$4,$2

	lui	$2,%hi(decimalNumber)
	lw	$2,%lo(decimalNumber)($2)
	slt	$2,$2,10
	bne	$2,$0,$L19
	lui	$2,%hi(MenuPosition)

$L16:
	lui	$16,%hi(MenuPosition)
	addiu	$17,$16,%lo(MenuPosition)
	lui	$2,%hi(minutes)
	lw	$7,%lo(minutes)($2)
	lui	$18,%hi($LC3)
	addiu	$6,$18,%lo($LC3)
	lh	$5,2($17)
	jal	printStringNumber
	lh	$4,%lo(MenuPosition)($16)

	lh	$4,%lo(MenuPosition)($16)
	lui	$2,%hi(printOffsetA)
	lw	$2,%lo(printOffsetA)($2)
	lui	$3,%hi(seconds)
	lw	$7,%lo(seconds)($3)
	addiu	$6,$18,%lo($LC3)
	lh	$5,2($17)
	jal	printStringNumber
	addu	$4,$4,$2

	lh	$4,%lo(MenuPosition)($16)
	lui	$2,%hi(printOffsetB)
	lw	$2,%lo(printOffsetB)($2)
	lui	$3,%hi(decimalNumber)
	lw	$7,%lo(decimalNumber)($3)
	addiu	$6,$18,%lo($LC3)
	lh	$5,2($17)
	jal	printStringNumber
	addu	$4,$4,$2

	lw	$31,28($sp)
	lw	$18,24($sp)
	lw	$17,20($sp)
	lw	$16,16($sp)
	jr	$31
	addiu	$sp,$sp,32

$L18:
	lw	$2,%lo(printOffsetA)($18)
	move	$7,$0
	lui	$6,%hi($LC3)
	addiu	$6,$6,%lo($LC3)
	lh	$5,2($17)
	jal	printStringNumber
	addu	$4,$4,$2

	lw	$2,%lo(printOffsetA)($18)
	addiu	$2,$2,8
	sw	$2,%lo(printOffsetA)($18)
	lui	$3,%hi(printOffsetB)
	lw	$2,%lo(printOffsetB)($3)
	addiu	$2,$2,8
	b	$L15
	sw	$2,%lo(printOffsetB)($3)

$L19:
	addiu	$3,$2,%lo(MenuPosition)
	lh	$4,%lo(MenuPosition)($2)
	lui	$16,%hi(printOffsetB)
	lw	$2,%lo(printOffsetB)($16)
	move	$7,$0
	lui	$6,%hi($LC3)
	addiu	$6,$6,%lo($LC3)
	lh	$5,2($3)
	jal	printStringNumber
	addu	$4,$4,$2

	lw	$2,%lo(printOffsetB)($16)
	addiu	$2,$2,8
	b	$L16
	sw	$2,%lo(printOffsetB)($16)

	.set	macro
	.set	reorder
	.end	printGPTime
	.size	printGPTime, .-printGPTime
	.section	.rodata.str1.4
	.align	2
$LC5:
	.ascii	"  Map X:\000"
	.align	2
$LC6:
	.ascii	"  Map Y:\000"
	.align	2
$LC7:
	.ascii	"Start X:\000"
	.align	2
$LC8:
	.ascii	"Start Y:\000"
	.align	2
$LC9:
	.ascii	"  Scale:\000"
	.align	2
$LC11:
	.ascii	".\000"
	.text
	.align	2
	.globl	printMap
	.set	nomips16
	.set	nomicromips
	.ent	printMap
	.type	printMap, @function
printMap:
	.frame	$sp,64,$31		# vars= 0, regs= 6/0, args= 40, gp= 0
	.mask	0x801f0000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	lui	$2,%hi(g_playerCount)
	lw	$3,%lo(g_playerCount)($2)
	li	$2,1			# 0x1
	beql	$3,$2,$L36
	li	$2,25			# 0x19

	jr	$31
	nop

$L36:
	addiu	$sp,$sp,-64
	sw	$31,60($sp)
	sw	$20,56($sp)
	sw	$19,52($sp)
	sw	$18,48($sp)
	sw	$17,44($sp)
	sw	$16,40($sp)
	move	$16,$4
	lui	$17,%hi(MenuPosition)
	sh	$2,%lo(MenuPosition)($17)
	addiu	$18,$17,%lo(MenuPosition)
	li	$2,150			# 0x96
	sh	$2,2($18)
	lui	$19,%hi(GraphPtr)
	li	$20,175			# 0xaf
	sw	$20,32($sp)
	sw	$0,28($sp)
	sw	$0,24($sp)
	sw	$0,20($sp)
	li	$2,218			# 0xda
	sw	$2,16($sp)
	li	$7,210			# 0xd2
	li	$6,168			# 0xa8
	li	$5,43			# 0x2b
	jal	FillRect1ColorF
	lw	$4,%lo(GraphPtr)($19)

	move	$4,$2
	sw	$2,%lo(GraphPtr)($19)
	lh	$5,%lo(MenuPosition)($17)
	lh	$3,2($18)
	sll	$6,$16,2
	addu	$16,$6,$16
	sll	$16,$16,2
	addiu	$6,$3,18
	sw	$20,32($sp)
	sw	$0,28($sp)
	sw	$0,24($sp)
	li	$2,200			# 0xc8
	sw	$2,20($sp)
	addiu	$3,$3,28
	addu	$3,$3,$16
	sw	$3,16($sp)
	addiu	$7,$5,74
	addu	$6,$6,$16
	jal	FillRect1ColorF
	addiu	$5,$5,18

	jal	loadFont
	sw	$2,%lo(GraphPtr)($19)

	lui	$2,%hi(g_mapX)
	lh	$7,%lo(g_mapX)($2)
	lui	$6,%hi($LC5)
	addiu	$6,$6,%lo($LC5)
	lh	$5,2($18)
	jal	printStringNumber
	lh	$4,%lo(MenuPosition)($17)

	lh	$5,2($18)
	lui	$2,%hi(g_mapY)
	lh	$7,%lo(g_mapY)($2)
	lui	$6,%hi($LC6)
	addiu	$6,$6,%lo($LC6)
	addiu	$5,$5,10
	jal	printStringNumber
	lh	$4,%lo(MenuPosition)($17)

	lh	$5,2($18)
	lui	$2,%hi(g_startX)
	lh	$7,%lo(g_startX)($2)
	lui	$6,%hi($LC7)
	addiu	$6,$6,%lo($LC7)
	addiu	$5,$5,20
	jal	printStringNumber
	lh	$4,%lo(MenuPosition)($17)

	lh	$5,2($18)
	lui	$2,%hi(g_startY)
	lh	$7,%lo(g_startY)($2)
	lui	$6,%hi($LC8)
	addiu	$6,$6,%lo($LC8)
	addiu	$5,$5,30
	jal	printStringNumber
	lh	$4,%lo(MenuPosition)($17)

	lh	$5,2($18)
	lui	$6,%hi($LC9)
	addiu	$6,$6,%lo($LC9)
	addiu	$5,$5,40
	jal	printString
	lh	$4,%lo(MenuPosition)($17)

	lui	$2,%hi(g_mapScale)
	lwc1	$f0,%lo(g_mapScale)($2)
	lui	$2,%hi($LC0)
	lwc1	$f2,%lo($LC0)($2)
	mul.s	$f0,$f0,$f2
	trunc.w.s $f2,$f0
	mfc1	$3,$f2
	lui	$2,%hi(wholeNumber)
	swc1	$f2,%lo(wholeNumber)($2)
	cvt.s.w	$f2,$f2
	sub.s	$f0,$f0,$f2
	lui	$2,%hi($LC10)
	lwc1	$f2,%lo($LC10)($2)
	mul.s	$f0,$f0,$f2
	trunc.w.s $f0,$f0
	mfc1	$2,$f0
	nop
	bltz	$2,$L22
	lui	$4,%hi(decimalNumber)

	swc1	$f0,%lo(decimalNumber)($4)
$L23:
	slt	$2,$3,10
	bne	$2,$0,$L24
	lui	$2,%hi(printOffsetB)

	slt	$2,$3,100
	bne	$2,$0,$L25
	lui	$2,%hi(printOffsetB)

	slt	$3,$3,1000
	bne	$3,$0,$L26
	li	$3,16			# 0x10

	lui	$2,%hi(printOffsetB)
	li	$3,8			# 0x8
	b	$L31
	sw	$3,%lo(printOffsetB)($2)

$L22:
	subu	$2,$0,$2
	b	$L23
	sw	$2,%lo(decimalNumber)($4)

$L26:
	b	$L31
	sw	$3,%lo(printOffsetB)($2)

$L25:
	li	$3,24			# 0x18
	sw	$3,%lo(printOffsetB)($2)
$L31:
	lui	$3,%hi(printOffsetB)
$L38:
	lw	$2,%lo(printOffsetB)($3)
	addiu	$2,$2,8
	sw	$2,%lo(printOffsetB)($3)
$L28:
	lui	$2,%hi(printOffsetA)
	li	$3,56			# 0x38
	sw	$3,%lo(printOffsetA)($2)
	lui	$2,%hi(decimalNumber)
	lw	$2,%lo(decimalNumber)($2)
	slt	$2,$2,100
	bne	$2,$0,$L37
	lui	$2,%hi(printOffsetC)

	sw	$0,%lo(printOffsetC)($2)
$L30:
	lui	$16,%hi(MenuPosition)
	li	$2,50			# 0x32
	sh	$2,%lo(MenuPosition)($16)
	addiu	$17,$16,%lo(MenuPosition)
	lh	$5,2($17)
	lui	$2,%hi(printOffsetB)
	lw	$4,%lo(printOffsetB)($2)
	lui	$2,%hi(wholeNumber)
	lw	$7,%lo(wholeNumber)($2)
	lui	$18,%hi($LC3)
	addiu	$6,$18,%lo($LC3)
	addiu	$5,$5,40
	jal	printStringNumber
	addiu	$4,$4,50

	lh	$5,2($17)
	lh	$4,%lo(MenuPosition)($16)
	lui	$19,%hi(printOffsetA)
	lw	$2,%lo(printOffsetA)($19)
	lui	$6,%hi($LC11)
	addiu	$6,$6,%lo($LC11)
	addiu	$5,$5,40
	jal	printString
	addu	$4,$4,$2

	lh	$5,2($17)
	lh	$2,%lo(MenuPosition)($16)
	lw	$4,%lo(printOffsetA)($19)
	addu	$2,$2,$4
	addiu	$2,$2,-4
	lui	$3,%hi(printOffsetC)
	lw	$4,%lo(printOffsetC)($3)
	lui	$3,%hi(decimalNumber)
	lw	$7,%lo(decimalNumber)($3)
	addiu	$6,$18,%lo($LC3)
	addiu	$5,$5,40
	jal	printStringNumber
	addu	$4,$2,$4

	lw	$31,60($sp)
	lw	$20,56($sp)
	lw	$19,52($sp)
	lw	$18,48($sp)
	lw	$17,44($sp)
	lw	$16,40($sp)
	jr	$31
	addiu	$sp,$sp,64

$L24:
	li	$4,32			# 0x20
	bltz	$3,$L28
	sw	$4,%lo(printOffsetB)($2)

	b	$L38
	lui	$3,%hi(printOffsetB)

$L37:
	lui	$2,%hi(MenuPosition)
	addiu	$3,$2,%lo(MenuPosition)
	lh	$5,2($3)
	lh	$4,%lo(MenuPosition)($2)
	move	$7,$0
	lui	$6,%hi($LC3)
	addiu	$6,$6,%lo($LC3)
	addiu	$5,$5,40
	jal	printStringNumber
	addiu	$4,$4,52

	lui	$2,%hi(printOffsetC)
	li	$3,8			# 0x8
	b	$L30
	sw	$3,%lo(printOffsetC)($2)

	.set	macro
	.set	reorder
	.end	printMap
	.size	printMap, .-printMap
	.section	.rodata.str1.4
	.align	2
$LC12:
	.ascii	"Cup Editor\000"
	.text
	.align	2
	.globl	CourseMenu
	.set	nomips16
	.set	nomicromips
	.ent	CourseMenu
	.type	CourseMenu, @function
CourseMenu:
	.frame	$sp,80,$31		# vars= 0, regs= 9/0, args= 40, gp= 0
	.mask	0x80ff0000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	addiu	$sp,$sp,-80
	sw	$31,76($sp)
	sw	$23,72($sp)
	sw	$22,68($sp)
	sw	$21,64($sp)
	sw	$20,60($sp)
	sw	$19,56($sp)
	sw	$18,52($sp)
	sw	$17,48($sp)
	sw	$16,44($sp)
	sw	$4,28($sp)
	sw	$0,24($sp)
	sw	$0,20($sp)
	sw	$0,16($sp)
	li	$7,121			# 0x79
	li	$6,220			# 0xdc
	li	$5,10			# 0xa
	jal	DrawBox
	li	$4,50			# 0x32

	li	$16,255			# 0xff
	sw	$16,28($sp)
	sw	$0,24($sp)
	sw	$0,20($sp)
	sw	$16,16($sp)
	li	$7,124			# 0x7c
	li	$6,2			# 0x2
	li	$5,8			# 0x8
	jal	DrawBox
	li	$4,48			# 0x30

	sw	$16,28($sp)
	sw	$0,24($sp)
	sw	$0,20($sp)
	sw	$16,16($sp)
	li	$7,124			# 0x7c
	li	$6,2			# 0x2
	li	$5,8			# 0x8
	jal	DrawBox
	li	$4,270			# 0x10e

	sw	$16,28($sp)
	sw	$0,24($sp)
	sw	$0,20($sp)
	sw	$16,16($sp)
	li	$7,2			# 0x2
	li	$6,220			# 0xdc
	li	$5,8			# 0x8
	jal	DrawBox
	li	$4,50			# 0x32

	sw	$16,28($sp)
	sw	$0,24($sp)
	sw	$0,20($sp)
	sw	$16,16($sp)
	li	$7,2			# 0x2
	li	$6,220			# 0xdc
	li	$5,130			# 0x82
	jal	DrawBox
	li	$4,50			# 0x32

	sw	$16,28($sp)
	sw	$0,24($sp)
	sw	$0,20($sp)
	sw	$0,16($sp)
	li	$7,1			# 0x1
	li	$6,200			# 0xc8
	li	$5,32			# 0x20
	jal	DrawBox
	li	$4,60			# 0x3c

	lui	$2,%hi(lit_arrowsprite_l)
	addiu	$2,$2,%lo(lit_arrowsprite_l)
	sw	$2,16($sp)
	li	$7,16			# 0x10
	li	$6,16			# 0x10
	li	$5,22			# 0x16
	jal	KWSprite
	li	$4,80			# 0x50

	lui	$2,%hi(ParameterIndex)
	lw	$6,%lo(ParameterIndex)($2)
	beq	$6,$0,$L50
	li	$2,1			# 0x1

	beq	$6,$2,$L51
	lui	$2,%hi(SYSTEM_Region)

	lw	$2,%lo(SYSTEM_Region)($2)
	bne	$2,$0,$L43
	lui	$2,%hi(MenuCup)

	lw	$3,%lo(MenuCup)($2)
	sll	$3,$3,3
	li	$2,-2146500608			# 0xffffffff800f0000
	addiu	$2,$2,11284
	addu	$3,$3,$2
	addiu	$2,$6,-2
	sll	$2,$2,1
	addu	$3,$3,$2
$L44:
	lui	$2,%hi(GlobalAddressA)
	sw	$3,%lo(GlobalAddressA)($2)
	lh	$4,0($3)
	sll	$4,$4,2
	lui	$2,%hi(courseChar)
	addiu	$7,$2,%lo(courseChar)
	addu	$4,$4,$7
	lw	$5,0($4)
	sll	$2,$5,2
	li	$5,157			# 0x9d
	subu	$5,$5,$2
	sll	$5,$5,16
	sra	$5,$5,16
	lui	$4,%hi(MenuPosition)
	sh	$5,%lo(MenuPosition)($4)
	addiu	$2,$6,-1
	sll	$6,$2,3
	subu	$6,$6,$2
	sll	$6,$6,1
	addiu	$6,$6,44
	sll	$6,$6,16
	sra	$6,$6,16
	addiu	$4,$4,%lo(MenuPosition)
	sh	$6,2($4)
	lh	$2,0($3)
	sll	$2,$2,2
	addu	$2,$2,$7
	lw	$7,0($2)
	sll	$7,$7,3
	lui	$16,%hi(GraphPtr)
	li	$2,200			# 0xc8
	sw	$2,32($sp)
	sw	$2,28($sp)
	sw	$0,24($sp)
	sw	$0,20($sp)
	addiu	$2,$6,11
	sw	$2,16($sp)
	addu	$7,$7,$5
	jal	FillRect1ColorF
	lw	$4,%lo(GraphPtr)($16)

	sw	$2,%lo(GraphPtr)($16)
$L41:
	lui	$2,%hi(LoopValue)
	jal	loadFont
	sw	$0,%lo(LoopValue)($2)

	lui	$6,%hi($LC12)
	addiu	$6,$6,%lo($LC12)
	move	$5,$0
	jal	printString
	li	$4,98			# 0x62

	lui	$2,%hi(MenuCup)
	lw	$2,%lo(MenuCup)($2)
	sll	$2,$2,2
	lui	$3,%hi(cupChar)
	addiu	$3,$3,%lo(cupChar)
	addu	$3,$2,$3
	lw	$4,0($3)
	sll	$3,$4,2
	li	$4,135			# 0x87
	subu	$4,$4,$3
	sll	$4,$4,16
	sra	$4,$4,16
	lui	$16,%hi(MenuPosition)
	sh	$4,%lo(MenuPosition)($16)
	lui	$3,%hi(cupNames)
	addiu	$3,$3,%lo(cupNames)
	addu	$2,$2,$3
	lw	$6,0($2)
	jal	printString
	li	$5,22			# 0x16

	addiu	$16,$16,%lo(MenuPosition)
	li	$2,40			# 0x28
	sh	$2,2($16)
	lui	$23,%hi(SYSTEM_Region)
	lui	$22,%hi(MenuCup)
	lui	$17,%hi(LoopValue)
	lui	$21,%hi(GlobalAddressA)
	lui	$19,%hi(courseChar)
	addiu	$19,$19,%lo(courseChar)
	lui	$20,%hi(MenuPosition)
	lui	$18,%hi(courseNames)
	b	$L47
	addiu	$18,$18,%lo(courseNames)

$L50:
	lui	$2,%hi(MenuPosition)
	li	$3,117			# 0x75
	sh	$3,%lo(MenuPosition)($2)
	lui	$16,%hi(GraphPtr)
	li	$2,200			# 0xc8
	sw	$2,32($sp)
	sw	$0,28($sp)
	sw	$0,24($sp)
	sw	$2,20($sp)
	li	$2,29			# 0x1d
	sw	$2,16($sp)
	li	$7,197			# 0xc5
	li	$6,19			# 0x13
	li	$5,117			# 0x75
	jal	FillRect1ColorF
	lw	$4,%lo(GraphPtr)($16)

	b	$L41
	sw	$2,%lo(GraphPtr)($16)

$L51:
	lui	$2,%hi(MenuCup)
	lw	$2,%lo(MenuCup)($2)
	sll	$2,$2,2
	lui	$3,%hi(cupChar)
	addiu	$3,$3,%lo(cupChar)
	addu	$2,$2,$3
	lw	$2,0($2)
	sll	$3,$2,2
	li	$5,155			# 0x9b
	subu	$5,$5,$3
	sll	$5,$5,16
	sra	$5,$5,16
	lui	$3,%hi(MenuPosition)
	sh	$5,%lo(MenuPosition)($3)
	sll	$2,$2,3
	lui	$16,%hi(GraphPtr)
	li	$3,200			# 0xc8
	sw	$3,32($sp)
	sw	$0,28($sp)
	sw	$3,24($sp)
	sw	$0,20($sp)
	li	$3,51			# 0x33
	sw	$3,16($sp)
	addu	$7,$2,$5
	li	$6,41			# 0x29
	jal	FillRect1ColorF
	lw	$4,%lo(GraphPtr)($16)

	b	$L41
	sw	$2,%lo(GraphPtr)($16)

$L43:
	lw	$3,%lo(MenuCup)($2)
	sll	$3,$3,3
	li	$2,-2146500608			# 0xffffffff800f0000
	addiu	$2,$2,11188
	addu	$3,$3,$2
	addiu	$2,$6,-2
	sll	$2,$2,1
	b	$L44
	addu	$3,$3,$2

$L53:
	sll	$2,$2,3
	lw	$3,%lo(LoopValue)($17)
	sll	$3,$3,1
	addu	$2,$2,$3
	li	$3,-2146500608			# 0xffffffff800f0000
	addiu	$3,$3,11284
	addu	$2,$2,$3
$L46:
	sw	$2,%lo(GlobalAddressA)($21)
	lh	$3,0($2)
	sll	$3,$3,2
	addu	$3,$3,$19
	lw	$4,0($3)
	sll	$3,$4,2
	li	$4,138			# 0x8a
	subu	$4,$4,$3
	sll	$4,$4,16
	sra	$4,$4,16
	sh	$4,%lo(MenuPosition)($20)
	lh	$2,0($2)
	sll	$2,$2,2
	addu	$2,$2,$18
	lw	$6,0($2)
	jal	printString
	lh	$5,2($16)

	lhu	$2,2($16)
	addiu	$2,$2,14
	sh	$2,2($16)
	lw	$2,%lo(LoopValue)($17)
	addiu	$2,$2,1
	sw	$2,%lo(LoopValue)($17)
	slt	$2,$2,4
	beq	$2,$0,$L52
	lw	$31,76($sp)

$L47:
	lw	$2,%lo(SYSTEM_Region)($23)
	beq	$2,$0,$L53
	lw	$2,%lo(MenuCup)($22)

	sll	$2,$2,3
	lw	$3,%lo(LoopValue)($17)
	sll	$3,$3,1
	addu	$2,$2,$3
	li	$3,-2146500608			# 0xffffffff800f0000
	addiu	$3,$3,11188
	b	$L46
	addu	$2,$2,$3

$L52:
	lw	$23,72($sp)
	lw	$22,68($sp)
	lw	$21,64($sp)
	lw	$20,60($sp)
	lw	$19,56($sp)
	lw	$18,52($sp)
	lw	$17,48($sp)
	lw	$16,44($sp)
	jr	$31
	addiu	$sp,$sp,80

	.set	macro
	.set	reorder
	.end	CourseMenu
	.size	CourseMenu, .-CourseMenu
	.align	2
	.globl	DrawFPS
	.set	nomips16
	.set	nomicromips
	.ent	DrawFPS
	.type	DrawFPS, @function
DrawFPS:
	.frame	$sp,32,$31		# vars= 0, regs= 3/0, args= 16, gp= 0
	.mask	0x80030000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	addiu	$sp,$sp,-32
	sw	$31,28($sp)
	sw	$17,24($sp)
	sw	$16,20($sp)
	move	$16,$4
	move	$17,$5
	li	$2,46858240			# 0x2cb0000
	addiu	$2,$2,24086
	lui	$3,%hi(CycleCount)
	lw	$3,%lo(CycleCount)($3)
	divu	$0,$2,$3
	teq	$3,$0,7
	mflo	$3
	mtc1	$3,$f0
	bltz	$3,$L58
	cvt.d.w	$f0,$f0

$L55:
	cvt.s.d	$f0,$f0
	mfc1	$6,$f0
	lui	$2,%hi(GlobalFloatA)
	swc1	$f0,%lo(GlobalFloatA)($2)
	li	$7,2			# 0x2
	move	$5,$17
	jal	printDecimal
	move	$4,$16

	li	$2,46858240			# 0x2cb0000
	addiu	$2,$2,24086
	lui	$3,%hi(CycleCount+4)
	lw	$3,%lo(CycleCount+4)($3)
	divu	$0,$2,$3
	teq	$3,$0,7
	mflo	$3
	mtc1	$3,$f0
	bltz	$3,$L59
	cvt.d.w	$f0,$f0

$L56:
	cvt.s.d	$f0,$f0
	mfc1	$6,$f0
	lui	$2,%hi(GlobalFloatA)
	swc1	$f0,%lo(GlobalFloatA)($2)
	li	$7,2			# 0x2
	addiu	$5,$17,10
	jal	printDecimal
	move	$4,$16

	lw	$31,28($sp)
	lw	$17,24($sp)
	lw	$16,20($sp)
	jr	$31
	addiu	$sp,$sp,32

$L58:
	lui	$2,%hi($LC13)
	ldc1	$f2,%lo($LC13)($2)
	b	$L55
	add.d	$f0,$f0,$f2

$L59:
	lui	$2,%hi($LC13)
	ldc1	$f2,%lo($LC13)($2)
	b	$L56
	add.d	$f0,$f0,$f2

	.set	macro
	.set	reorder
	.end	DrawFPS
	.size	DrawFPS, .-DrawFPS
	.align	2
	.globl	ModularMenu
	.set	nomips16
	.set	nomicromips
	.ent	ModularMenu
	.type	ModularMenu, @function
ModularMenu:
	.frame	$sp,88,$31		# vars= 8, regs= 10/0, args= 40, gp= 0
	.mask	0xc0ff0000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	addiu	$sp,$sp,-88
	sw	$31,84($sp)
	sw	$fp,80($sp)
	sw	$23,76($sp)
	sw	$22,72($sp)
	sw	$21,68($sp)
	sw	$20,64($sp)
	sw	$19,60($sp)
	sw	$18,56($sp)
	sw	$17,52($sp)
	sw	$16,48($sp)
	sw	$5,92($sp)
	sw	$6,96($sp)
	move	$18,$6
	sw	$4,28($sp)
	sw	$0,24($sp)
	sw	$0,20($sp)
	sw	$0,16($sp)
	li	$7,121			# 0x79
	li	$6,220			# 0xdc
	li	$5,10			# 0xa
	jal	DrawBox
	li	$4,50			# 0x32

	li	$16,255			# 0xff
	sw	$16,28($sp)
	sw	$0,24($sp)
	sw	$0,20($sp)
	sw	$16,16($sp)
	li	$7,124			# 0x7c
	li	$6,2			# 0x2
	li	$5,8			# 0x8
	jal	DrawBox
	li	$4,48			# 0x30

	sw	$16,28($sp)
	sw	$0,24($sp)
	sw	$0,20($sp)
	sw	$16,16($sp)
	li	$7,124			# 0x7c
	li	$6,2			# 0x2
	li	$5,8			# 0x8
	jal	DrawBox
	li	$4,270			# 0x10e

	sw	$16,28($sp)
	sw	$0,24($sp)
	sw	$0,20($sp)
	sw	$16,16($sp)
	li	$7,2			# 0x2
	li	$6,220			# 0xdc
	li	$5,8			# 0x8
	jal	DrawBox
	li	$4,50			# 0x32

	sw	$16,28($sp)
	sw	$0,24($sp)
	sw	$0,20($sp)
	sw	$16,16($sp)
	li	$7,2			# 0x2
	li	$6,220			# 0xdc
	li	$5,130			# 0x82
	jal	DrawBox
	li	$4,50			# 0x32

	sw	$16,28($sp)
	sw	$0,24($sp)
	sw	$0,20($sp)
	sw	$0,16($sp)
	li	$7,1			# 0x1
	li	$6,200			# 0xc8
	li	$5,32			# 0x20
	jal	DrawBox
	li	$4,60			# 0x3c

	lui	$2,%hi(ParameterIndex)
	lw	$2,%lo(ParameterIndex)($2)
	beq	$2,$0,$L72
	sll	$5,$2,3

	addu	$5,$2,$5
	sll	$5,$5,1
	addiu	$5,$5,33
	sll	$5,$5,16
	sra	$5,$5,16
	lui	$2,%hi(MenuPosition+2)
	sh	$5,%lo(MenuPosition+2)($2)
	lui	$2,%hi(MenuBlink)
	lhu	$2,%lo(MenuBlink)($2)
	sltu	$2,$2,29
	bne	$2,$0,$L73
	lui	$2,%hi(lit_red_selecter)

$L62:
	lui	$2,%hi(LoopValue)
$L77:
	sw	$0,%lo(LoopValue)($2)
	lui	$16,%hi(MenuPosition)
	lui	$17,%hi(MenuIndex)
	lw	$2,%lo(MenuIndex)($17)
	sll	$2,$2,4
	addu	$2,$18,$2
	lhu	$2,6($2)
	sll	$3,$2,2
	li	$2,138			# 0x8a
	subu	$2,$2,$3
	jal	loadFont
	sh	$2,%lo(MenuPosition)($16)

	lw	$2,%lo(MenuIndex)($17)
	sll	$2,$2,4
	addu	$2,$18,$2
	lw	$6,0($2)
	move	$5,$0
	jal	printString
	lh	$4,%lo(MenuPosition)($16)

	addiu	$16,$16,%lo(MenuPosition)
	li	$2,30			# 0x1e
	sh	$2,2($16)
	lw	$2,%lo(MenuIndex)($17)
	sll	$2,$2,4
	addu	$2,$18,$2
	lh	$2,4($2)
	slt	$4,$2,5
	bne	$4,$0,$L63
	move	$3,$2

	li	$3,4			# 0x4
$L63:
	lui	$4,%hi(GlobalShortB)
	sh	$3,%lo(GlobalShortB)($4)
	lui	$3,%hi(LoopValue)
	blez	$2,$L64
	sw	$0,%lo(LoopValue)($3)

	move	$16,$0
	lui	$21,%hi(MenuIndex)
	lui	$20,%hi(MenuOverflow)
	lui	$22,%hi(MenuPosition)
	addiu	$17,$22,%lo(MenuPosition)
	move	$19,$3
	lui	$fp,%hi(GlobalShortA)
	li	$23,50			# 0x32
	sw	$4,40($sp)
	lw	$2,%lo(MenuIndex)($21)
$L81:
	sll	$2,$2,4
	addu	$2,$18,$2
	lw	$3,%lo(MenuOverflow)($20)
	addu	$16,$16,$3
	sll	$16,$16,4
	lw	$2,8($2)
	addu	$16,$2,$16
	lw	$6,0($16)
	lh	$5,2($17)
	jal	printString
	li	$4,45			# 0x2d

	lw	$2,%lo(MenuIndex)($21)
	sll	$2,$2,4
	addu	$2,$18,$2
	lw	$2,12($2)
	lw	$4,%lo(LoopValue)($19)
	lw	$3,%lo(MenuOverflow)($20)
	addu	$2,$2,$4
	addu	$2,$2,$3
	lb	$2,0($2)
	sh	$2,%lo(GlobalShortA)($fp)
	sll	$2,$2,2
	lw	$3,12($16)
	addu	$3,$3,$2
	lw	$4,0($3)
	subu	$4,$23,$4
	sll	$4,$4,2
	sll	$4,$4,16
	sra	$4,$4,16
	sh	$4,%lo(MenuPosition)($22)
	lw	$3,8($16)
	addu	$2,$3,$2
	lw	$6,0($2)
	jal	printString
	lh	$5,2($17)

	lhu	$2,2($17)
	addiu	$2,$2,18
	sh	$2,2($17)
	lw	$16,%lo(LoopValue)($19)
	addiu	$16,$16,1
	sw	$16,%lo(LoopValue)($19)
	lw	$2,40($sp)
	lh	$2,%lo(GlobalShortB)($2)
	slt	$2,$16,$2
	bne	$2,$0,$L81
	lw	$2,%lo(MenuIndex)($21)

$L64:
	lui	$2,%hi(MenuOverflow)
	lw	$2,%lo(MenuOverflow)($2)
	addiu	$2,$2,4
	lui	$3,%hi(MenuIndex)
	lw	$3,%lo(MenuIndex)($3)
	sll	$3,$3,4
	addu	$3,$18,$3
	lh	$3,4($3)
	slt	$2,$2,$3
	beq	$2,$0,$L82
	lui	$2,%hi(MenuOverflow)

	lui	$2,%hi(MenuBlink)
	lhu	$2,%lo(MenuBlink)($2)
	sltu	$2,$2,15
	bne	$2,$0,$L74
	lui	$2,%hi(lit_arrowsprite_d)

	lui	$2,%hi(MenuIndex)
$L78:
	lw	$2,%lo(MenuIndex)($2)
	bgtz	$2,$L75
	lui	$2,%hi(lit_arrowsprite_l)

	lui	$2,%hi(MenuIndex)
$L79:
	lw	$3,%lo(MenuIndex)($2)
	lw	$2,92($sp)
	sltu	$2,$3,$2
	bne	$2,$0,$L76
	lui	$2,%hi(lit_arrowsprite_r)

	lw	$31,84($sp)
$L80:
	lw	$fp,80($sp)
	lw	$23,76($sp)
	lw	$22,72($sp)
	lw	$21,68($sp)
	lw	$20,64($sp)
	lw	$19,60($sp)
	lw	$18,56($sp)
	lw	$17,52($sp)
	lw	$16,48($sp)
	jr	$31
	addiu	$sp,$sp,88

$L72:
	lui	$2,%hi(MenuIndex)
	lw	$2,%lo(MenuIndex)($2)
	sll	$2,$2,4
	addu	$2,$18,$2
	lh	$7,6($2)
	sll	$2,$7,2
	li	$5,157			# 0x9d
	subu	$5,$5,$2
	sll	$5,$5,16
	sra	$5,$5,16
	lui	$2,%hi(MenuPosition)
	sh	$5,%lo(MenuPosition)($2)
	sll	$7,$7,3
	lui	$16,%hi(GraphPtr)
	li	$2,200			# 0xc8
	sw	$2,32($sp)
	sw	$0,28($sp)
	sw	$0,24($sp)
	sw	$2,20($sp)
	li	$2,29			# 0x1d
	sw	$2,16($sp)
	addu	$7,$7,$5
	li	$6,19			# 0x13
	jal	FillRect1ColorF
	lw	$4,%lo(GraphPtr)($16)

	b	$L62
	sw	$2,%lo(GraphPtr)($16)

$L73:
	addiu	$2,$2,%lo(lit_red_selecter)
	sw	$2,16($sp)
	li	$7,16			# 0x10
	li	$6,16			# 0x10
	addiu	$5,$5,2
	jal	KWSprite
	li	$4,57			# 0x39

	b	$L77
	lui	$2,%hi(LoopValue)

$L74:
	addiu	$2,$2,%lo(lit_arrowsprite_d)
	sw	$2,16($sp)
	li	$7,16			# 0x10
	li	$6,16			# 0x10
	li	$5,120			# 0x78
	jal	KWSprite
	li	$4,161			# 0xa1

	lui	$2,%hi(MenuOverflow)
$L82:
	lw	$2,%lo(MenuOverflow)($2)
	addiu	$2,$2,-3
	lui	$3,%hi(MenuIndex)
	lw	$6,%lo(MenuIndex)($3)
	sll	$6,$6,4
	addu	$18,$18,$6
	lh	$3,4($18)
	slt	$2,$3,$2
	bne	$2,$0,$L78
	lui	$2,%hi(MenuIndex)

	lui	$2,%hi(MenuBlink)
	lhu	$2,%lo(MenuBlink)($2)
	sltu	$2,$2,15
	beql	$2,$0,$L78
	lui	$2,%hi(MenuIndex)

	lui	$2,%hi(lit_arrowsprite_u)
	addiu	$2,$2,%lo(lit_arrowsprite_u)
	sw	$2,16($sp)
	li	$7,16			# 0x10
	li	$6,16			# 0x10
	li	$5,40			# 0x28
	jal	KWSprite
	li	$4,161			# 0xa1

	b	$L78
	lui	$2,%hi(MenuIndex)

$L75:
	addiu	$2,$2,%lo(lit_arrowsprite_l)
	sw	$2,16($sp)
	li	$7,16			# 0x10
	li	$6,16			# 0x10
	li	$5,22			# 0x16
	jal	KWSprite
	li	$4,80			# 0x50

	b	$L79
	lui	$2,%hi(MenuIndex)

$L76:
	addiu	$2,$2,%lo(lit_arrowsprite_r)
	sw	$2,16($sp)
	li	$7,16			# 0x10
	li	$6,16			# 0x10
	li	$5,22			# 0x16
	jal	KWSprite
	li	$4,240			# 0xf0

	b	$L80
	lw	$31,84($sp)

	.set	macro
	.set	reorder
	.end	ModularMenu
	.size	ModularMenu, .-ModularMenu
	.align	2
	.globl	MapSelectMenuDefault
	.set	nomips16
	.set	nomicromips
	.ent	MapSelectMenuDefault
	.type	MapSelectMenuDefault, @function
MapSelectMenuDefault:
	.frame	$sp,24,$31		# vars= 0, regs= 1/0, args= 16, gp= 0
	.mask	0x80000000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	addiu	$sp,$sp,-24
	sw	$31,20($sp)
	lui	$2,%hi(g_gameMode)
	lw	$3,%lo(g_gameMode)($2)
	li	$2,3			# 0x3
	beq	$3,$2,$L84
	li	$2,4			# 0x4

	li	$2,1			# 0x1
$L84:
	lui	$3,%hi(GlobalShortA)
	sh	$2,%lo(GlobalShortA)($3)
	lui	$3,%hi(menuScreenA)
	lb	$3,%lo(menuScreenA)($3)
	beq	$3,$2,$L93
	lui	$2,%hi(GlobalController+16)

$L85:
	lui	$2,%hi(PlayerOK)
$L98:
	addiu	$3,$2,%lo(PlayerOK)
	swl	$0,%lo(PlayerOK)($2)
	swr	$0,3($3)
	lui	$2,%hi(HotSwapID)
	lh	$2,%lo(HotSwapID)($2)
	blez	$2,$L88
	lui	$2,%hi(courseValue)

	li	$3,-1			# 0xffffffffffffffff
	sh	$3,%lo(courseValue)($2)
	lui	$2,%hi(gpCourseIndex)
	sh	$0,%lo(gpCourseIndex)($2)
	lui	$2,%hi(g_gameMode)
	lw	$2,%lo(g_gameMode)($2)
	beq	$2,$0,$L89
	addiu	$2,$2,-1

	sltu	$2,$2,3
	beq	$2,$0,$L83
	lui	$2,%hi(g_cupSelect)

	lb	$2,%lo(g_cupSelect)($2)
	sll	$2,$2,2
	lui	$3,%hi(g_courseSelect)
	lb	$3,%lo(g_courseSelect)($3)
	addu	$2,$2,$3
	lui	$3,%hi(courseValue)
	sh	$2,%lo(courseValue)($3)
$L83:
	lw	$31,20($sp)
$L97:
	jr	$31
	addiu	$sp,$sp,24

$L93:
	lw	$2,%lo(GlobalController+16)($2)
	lhu	$2,6($2)
	andi	$3,$2,0x2
	bne	$3,$0,$L94
	nop

	andi	$2,$2,0x1
	bne	$2,$0,$L95
	nop

	lui	$2,%hi(courseValue)
$L96:
	jal	LoadCustomHeader
	lh	$4,%lo(courseValue)($2)

	lui	$2,%hi(GlobalController+16)
	lw	$2,%lo(GlobalController+16)($2)
	lhu	$2,6($2)
	andi	$2,$2,0x10
	beq	$2,$0,$L98
	lui	$2,%hi(PlayerOK)

	lui	$3,%hi(MenuToggle)
	lbu	$2,%lo(MenuToggle)($3)
	xori	$2,$2,0x1
	b	$L85
	sb	$2,%lo(MenuToggle)($3)

$L94:
	jal	swapHS
	move	$4,$0

	b	$L96
	lui	$2,%hi(courseValue)

$L95:
	jal	swapHS
	li	$4,1			# 0x1

	b	$L96
	lui	$2,%hi(courseValue)

$L89:
	lui	$2,%hi(g_cupSelect)
	lb	$2,%lo(g_cupSelect)($2)
	sll	$2,$2,2
	lui	$3,%hi(courseValue)
	b	$L83
	sh	$2,%lo(courseValue)($3)

$L88:
	jal	LoadCustomHeader
	li	$4,-1			# 0xffffffffffffffff

	b	$L97
	lw	$31,20($sp)

	.set	macro
	.set	reorder
	.end	MapSelectMenuDefault
	.size	MapSelectMenuDefault, .-MapSelectMenuDefault
	.align	2
	.globl	numPlaces
	.set	nomips16
	.set	nomicromips
	.ent	numPlaces
	.type	numPlaces, @function
numPlaces:
	.frame	$sp,0,$31		# vars= 0, regs= 0/0, args= 0, gp= 0
	.mask	0x00000000,0
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	bltz	$4,$L101
	nop

	slt	$2,$4,10
	bne	$2,$0,$L102
	nop

	slt	$2,$4,100
	bne	$2,$0,$L103
	nop

	slt	$2,$4,1000
	bne	$2,$0,$L104
	nop

	slt	$2,$4,10000
	bne	$2,$0,$L105
	nop

	li	$2,65536			# 0x10000
	ori	$2,$2,0x86a0
	slt	$2,$4,$2
	bne	$2,$0,$L106
	nop

	li	$2,983040			# 0xf0000
	addiu	$2,$2,16960
	slt	$2,$4,$2
	bne	$2,$0,$L107
	nop

	li	$2,9961472			# 0x980000
	ori	$2,$2,0x9680
	slt	$2,$4,$2
	bne	$2,$0,$L108
	nop

	li	$2,99942400			# 0x5f50000
	ori	$2,$2,0xe100
	slt	$4,$4,$2
	sltu	$2,$4,1
	jr	$31
	addiu	$2,$2,8

$L101:
	jr	$31
	move	$2,$0

$L102:
	jr	$31
	li	$2,1			# 0x1

$L103:
	jr	$31
	li	$2,2			# 0x2

$L104:
	jr	$31
	li	$2,3			# 0x3

$L105:
	jr	$31
	li	$2,4			# 0x4

$L106:
	jr	$31
	li	$2,5			# 0x5

$L107:
	jr	$31
	li	$2,6			# 0x6

$L108:
	jr	$31
	li	$2,7			# 0x7

	.set	macro
	.set	reorder
	.end	numPlaces
	.size	numPlaces, .-numPlaces
	.align	2
	.globl	DrawNumberSprite
	.set	nomips16
	.set	nomicromips
	.ent	DrawNumberSprite
	.type	DrawNumberSprite, @function
DrawNumberSprite:
	.frame	$sp,40,$31		# vars= 0, regs= 1/0, args= 32, gp= 0
	.mask	0x80000000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	addiu	$sp,$sp,-40
	sw	$31,36($sp)
	li	$2,1			# 0x1
	sw	$2,24($sp)
	sw	$0,20($sp)
	sll	$6,$6,3
	sw	$6,16($sp)
	li	$7,16			# 0x10
	jal	SprDrawClipST
	li	$6,8			# 0x8

	lw	$31,36($sp)
	jr	$31
	addiu	$sp,$sp,40

	.set	macro
	.set	reorder
	.end	DrawNumberSprite
	.size	DrawNumberSprite, .-DrawNumberSprite
	.align	2
	.globl	printNumberSprite
	.set	nomips16
	.set	nomicromips
	.ent	printNumberSprite
	.type	printNumberSprite, @function
printNumberSprite:
	.frame	$sp,104,$31		# vars= 40, regs= 10/0, args= 24, gp= 0
	.mask	0xc0ff0000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	addiu	$sp,$sp,-104
	sw	$31,100($sp)
	sw	$fp,96($sp)
	sw	$23,92($sp)
	sw	$22,88($sp)
	sw	$21,84($sp)
	sw	$20,80($sp)
	sw	$19,76($sp)
	sw	$18,72($sp)
	sw	$17,68($sp)
	sw	$16,64($sp)
	move	$22,$4
	move	$21,$5
	move	$16,$6
	lui	$2,%hi(StockNumberSprites)
	addiu	$2,$2,%lo(StockNumberSprites)
	sw	$2,16($sp)
	li	$7,16			# 0x10
	li	$6,104			# 0x68
	li	$5,1000			# 0x3e8
	jal	KWSprite
	li	$4,1000			# 0x3e8

	bltz	$16,$L119
	move	$19,$0

$L113:
	li	$4,1717960704			# 0x66660000
	addiu	$4,$4,26215
	mult	$16,$4
	mfhi	$2
	sra	$2,$2,2
	sra	$3,$16,31
	subu	$5,$2,$3
	sll	$2,$5,2
	addu	$2,$2,$5
	sll	$2,$2,1
	subu	$2,$16,$2
	sw	$2,24($sp)
	li	$5,1374355456			# 0x51eb0000
	ori	$5,$5,0x851f
	mult	$16,$5
	mfhi	$2
	sra	$2,$2,5
	subu	$6,$2,$3
	sll	$2,$6,1
	addu	$2,$2,$6
	sll	$2,$2,3
	addu	$2,$2,$6
	sll	$2,$2,2
	subu	$2,$16,$2
	mult	$2,$4
	mfhi	$4
	sra	$4,$4,2
	sra	$2,$2,31
	subu	$2,$4,$2
	sw	$2,28($sp)
	li	$4,274857984			# 0x10620000
	addiu	$4,$4,19923
	mult	$16,$4
	mfhi	$2
	sra	$2,$2,6
	subu	$6,$2,$3
	sll	$2,$6,5
	subu	$2,$2,$6
	sll	$2,$2,2
	addu	$2,$2,$6
	sll	$2,$2,3
	subu	$2,$16,$2
	mult	$2,$5
	mfhi	$5
	sra	$5,$5,5
	sra	$2,$2,31
	subu	$2,$5,$2
	sw	$2,32($sp)
	li	$5,1759182848			# 0x68db0000
	ori	$5,$5,0x8bad
	mult	$16,$5
	mfhi	$2
	sra	$2,$2,12
	subu	$6,$2,$3
	sll	$2,$6,2
	addu	$2,$2,$6
	sll	$2,$2,3
	subu	$2,$2,$6
	sll	$2,$2,4
	addu	$2,$2,$6
	sll	$2,$2,4
	subu	$2,$16,$2
	mult	$2,$4
	mfhi	$4
	sra	$4,$4,6
	sra	$2,$2,31
	subu	$2,$4,$2
	sw	$2,36($sp)
	li	$4,351797248			# 0x14f80000
	ori	$4,$4,0xb589
	mult	$16,$4
	mfhi	$2
	sra	$2,$2,13
	subu	$6,$2,$3
	sll	$2,$6,1
	addu	$2,$2,$6
	sll	$7,$2,6
	addu	$2,$2,$7
	sll	$2,$2,2
	addu	$2,$2,$6
	sll	$2,$2,2
	addu	$2,$2,$6
	sll	$2,$2,5
	subu	$2,$16,$2
	mult	$2,$5
	mfhi	$5
	sra	$5,$5,12
	sra	$2,$2,31
	subu	$2,$5,$2
	sw	$2,40($sp)
	li	$5,1125842944			# 0x431b0000
	ori	$5,$5,0xde83
	mult	$16,$5
	mfhi	$2
	sra	$2,$2,18
	subu	$6,$2,$3
	sll	$2,$6,5
	subu	$7,$2,$6
	sll	$2,$7,6
	subu	$2,$2,$7
	sll	$2,$2,3
	addu	$2,$2,$6
	sll	$2,$2,6
	subu	$2,$16,$2
	mult	$2,$4
	mfhi	$4
	sra	$4,$4,13
	sra	$2,$2,31
	subu	$2,$4,$2
	sw	$2,44($sp)
	li	$4,1801388032			# 0x6b5f0000
	ori	$4,$4,0xca6b
	mult	$16,$4
	mfhi	$2
	sra	$2,$2,22
	subu	$6,$2,$3
	sll	$2,$6,5
	subu	$7,$2,$6
	sll	$2,$7,6
	subu	$2,$2,$7
	sll	$2,$2,3
	addu	$2,$2,$6
	sll	$6,$2,2
	addu	$2,$2,$6
	sll	$2,$2,7
	subu	$2,$16,$2
	mult	$2,$5
	mfhi	$5
	sra	$5,$5,18
	sra	$2,$2,31
	subu	$2,$5,$2
	sw	$2,48($sp)
	li	$2,1441136640			# 0x55e60000
	addiu	$2,$2,15241
	mult	$16,$2
	mfhi	$5
	sra	$5,$5,25
	subu	$5,$5,$3
	li	$6,99942400			# 0x5f50000
	ori	$6,$6,0xe100
	mult	$5,$6
	mflo	$5
	subu	$5,$16,$5
	nop
	mult	$5,$4
	mfhi	$4
	sra	$4,$4,22
	sra	$5,$5,31
	subu	$4,$4,$5
	sw	$4,52($sp)
	li	$4,1152909312			# 0x44b80000
	addiu	$4,$4,12193
	mult	$16,$4
	mfhi	$4
	sra	$4,$4,28
	subu	$3,$4,$3
	li	$4,999948288			# 0x3b9a0000
	ori	$4,$4,0xca00
	mult	$3,$4
	mflo	$3
	subu	$3,$16,$3
	nop
	mult	$3,$2
	mfhi	$2
	sra	$2,$2,25
	sra	$3,$3,31
	subu	$2,$2,$3
	sw	$2,56($sp)
	jal	numPlaces
	move	$4,$16

	move	$20,$2
	move	$18,$22
	sll	$4,$2,3
	addu	$4,$4,$2
	subu	$22,$22,$4
	addiu	$17,$sp,24
	move	$16,$0
	li	$23,1			# 0x1
	b	$L114
	addiu	$fp,$21,4

$L119:
	subu	$16,$0,$16
	b	$L113
	li	$19,1			# 0x1

$L115:
$L121:
	addiu	$17,$17,4
	addiu	$18,$18,-9
	move	$19,$0
$L114:
	slt	$2,$16,$20
	beq	$2,$0,$L120
	move	$5,$21

	lw	$6,0($17)
	jal	DrawNumberSprite
	move	$4,$18

	bnel	$19,$23,$L115
	addiu	$16,$16,1

	li	$6,11			# 0xb
	move	$5,$fp
	jal	DrawNumberSprite
	move	$4,$22

	li	$6,10			# 0xa
	move	$5,$fp
	jal	DrawNumberSprite
	move	$4,$22

	b	$L121
	addiu	$16,$16,1

$L120:
	lw	$31,100($sp)
	lw	$fp,96($sp)
	lw	$23,92($sp)
	lw	$22,88($sp)
	lw	$21,84($sp)
	lw	$20,80($sp)
	lw	$19,76($sp)
	lw	$18,72($sp)
	lw	$17,68($sp)
	lw	$16,64($sp)
	jr	$31
	addiu	$sp,$sp,104

	.set	macro
	.set	reorder
	.end	printNumberSprite
	.size	printNumberSprite, .-printNumberSprite
	.align	2
	.globl	ReturnStringLength
	.set	nomips16
	.set	nomicromips
	.ent	ReturnStringLength
	.type	ReturnStringLength, @function
ReturnStringLength:
	.frame	$sp,0,$31		# vars= 0, regs= 0/0, args= 0, gp= 0
	.mask	0x00000000,0
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	lui	$2,%hi(GlobalIntA)
	sw	$0,%lo(GlobalIntA)($2)
	lb	$2,0($4)
	lui	$3,%hi(GlobalCharA)
	beq	$2,$0,$L123
	sb	$2,%lo(GlobalCharA)($3)

	lui	$3,%hi(GlobalIntA)
	lui	$5,%hi(GlobalCharA)
$L124:
	lw	$2,%lo(GlobalIntA)($3)
	addiu	$2,$2,1
	sw	$2,%lo(GlobalIntA)($3)
	addu	$2,$4,$2
	lb	$2,0($2)
	bne	$2,$0,$L124
	sb	$2,%lo(GlobalCharA)($5)

$L123:
	lui	$2,%hi(GlobalIntA)
	jr	$31
	lw	$2,%lo(GlobalIntA)($2)

	.set	macro
	.set	reorder
	.end	ReturnStringLength
	.size	ReturnStringLength, .-ReturnStringLength
	.align	2
	.globl	loadHudButtons
	.set	nomips16
	.set	nomicromips
	.ent	loadHudButtons
	.type	loadHudButtons, @function
loadHudButtons:
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
	lui	$18,%hi(sourceAddress)
	lw	$3,%lo(sourceAddress)($18)
	lui	$2,%hi(HudButtonsROM)
	addiu	$2,$2,%lo(HudButtonsROM)
	sw	$2,0($3)
	lui	$17,%hi(targetAddress)
	lw	$2,%lo(targetAddress)($17)
	lui	$16,%hi(ok_FreeSpace)
	addiu	$16,$16,%lo(ok_FreeSpace)
	sw	$16,0($2)
	lui	$2,%hi(dataLength)
	li	$3,17408			# 0x4400
	jal	runDMA
	sw	$3,%lo(dataLength)($2)

	lw	$2,%lo(sourceAddress)($18)
	sw	$16,0($2)
	lw	$3,%lo(targetAddress)($17)
	lui	$2,%hi(hud_buttons)
	addiu	$2,$2,%lo(hud_buttons)
	jal	runMIO
	sw	$2,0($3)

	lw	$31,28($sp)
	lw	$18,24($sp)
	lw	$17,20($sp)
	lw	$16,16($sp)
	jr	$31
	addiu	$sp,$sp,32

	.set	macro
	.set	reorder
	.end	loadHudButtons
	.size	loadHudButtons, .-loadHudButtons
	.align	2
	.globl	SpriteBtnA
	.set	nomips16
	.set	nomicromips
	.ent	SpriteBtnA
	.type	SpriteBtnA, @function
SpriteBtnA:
	.frame	$sp,48,$31		# vars= 0, regs= 4/2, args= 24, gp= 0
	.mask	0x80070000,-12
	.fmask	0x00300000,-8
	.set	noreorder
	.set	nomacro
	addiu	$sp,$sp,-48
	sw	$31,36($sp)
	sw	$18,32($sp)
	sw	$17,28($sp)
	sw	$16,24($sp)
	sdc1	$f20,40($sp)
	move	$17,$4
	mtc1	$6,$f20
	beq	$7,$0,$L129
	move	$16,$5

	lui	$2,%hi($LC14)
	lwc1	$f0,%lo($LC14)($2)
	c.eq.s	$f20,$f0
	nop
	bc1t	$L137
	lui	$2,%hi(hud_buttons+512)

	mtc1	$0,$f0
	nop
	c.eq.s	$f20,$f0
	nop
	bc1fl	$L131
	lui	$2,%hi(hud_buttons)

$L137:
	addiu	$2,$2,%lo(hud_buttons+512)
	sw	$2,16($sp)
	li	$7,16			# 0x10
	li	$6,16			# 0x10
	move	$5,$16
	jal	KWSprite
	move	$4,$17

	lw	$31,36($sp)
$L136:
	lw	$18,32($sp)
	lw	$17,28($sp)
	lw	$16,24($sp)
	ldc1	$f20,40($sp)
	jr	$31
	addiu	$sp,$sp,48

$L131:
	addiu	$2,$2,%lo(hud_buttons)
	sw	$2,16($sp)
	move	$7,$0
	move	$6,$0
	move	$5,$0
	jal	KWSprite
	move	$4,$0

	li	$2,16			# 0x10
	sw	$2,20($sp)
	sw	$2,16($sp)
	lui	$7,%hi(hud_buttons+512)
	addiu	$7,$7,%lo(hud_buttons+512)
	mfc1	$6,$f20
	move	$5,$16
	jal	KWSpriteScale
	move	$4,$17

	b	$L136
	lw	$31,36($sp)

$L129:
	lui	$2,%hi($LC14)
	lwc1	$f0,%lo($LC14)($2)
	c.eq.s	$f20,$f0
	nop
	bc1t	$L138
	lui	$2,%hi(hud_buttons)

	mtc1	$0,$f0
	nop
	c.eq.s	$f20,$f0
	nop
	bc1f	$L134
	lui	$18,%hi(hud_buttons)

$L138:
	addiu	$2,$2,%lo(hud_buttons)
	sw	$2,16($sp)
	li	$7,16			# 0x10
	li	$6,16			# 0x10
	move	$5,$16
	jal	KWSprite
	move	$4,$17

	b	$L136
	lw	$31,36($sp)

$L134:
	addiu	$18,$18,%lo(hud_buttons)
	sw	$18,16($sp)
	move	$7,$0
	move	$6,$0
	move	$5,$0
	jal	KWSprite
	move	$4,$0

	li	$2,16			# 0x10
	sw	$2,20($sp)
	sw	$2,16($sp)
	move	$7,$18
	mfc1	$6,$f20
	move	$5,$16
	jal	KWSpriteScale
	move	$4,$17

	b	$L136
	lw	$31,36($sp)

	.set	macro
	.set	reorder
	.end	SpriteBtnA
	.size	SpriteBtnA, .-SpriteBtnA
	.align	2
	.globl	SpriteBtnB
	.set	nomips16
	.set	nomicromips
	.ent	SpriteBtnB
	.type	SpriteBtnB, @function
SpriteBtnB:
	.frame	$sp,48,$31		# vars= 0, regs= 3/2, args= 24, gp= 0
	.mask	0x80030000,-12
	.fmask	0x00300000,-8
	.set	noreorder
	.set	nomacro
	addiu	$sp,$sp,-48
	sw	$31,36($sp)
	sw	$17,32($sp)
	sw	$16,28($sp)
	sdc1	$f20,40($sp)
	move	$17,$4
	mtc1	$6,$f20
	beq	$7,$0,$L140
	move	$16,$5

	lui	$2,%hi($LC14)
	lwc1	$f0,%lo($LC14)($2)
	c.eq.s	$f20,$f0
	nop
	bc1t	$L148
	lui	$2,%hi(hud_buttons+1536)

	mtc1	$0,$f0
	nop
	c.eq.s	$f20,$f0
	nop
	bc1fl	$L142
	lui	$2,%hi(hud_buttons)

$L148:
	addiu	$2,$2,%lo(hud_buttons+1536)
	sw	$2,16($sp)
	li	$7,16			# 0x10
	li	$6,16			# 0x10
	move	$5,$16
	jal	KWSprite
	move	$4,$17

	lw	$31,36($sp)
$L147:
	lw	$17,32($sp)
	lw	$16,28($sp)
	ldc1	$f20,40($sp)
	jr	$31
	addiu	$sp,$sp,48

$L142:
	addiu	$2,$2,%lo(hud_buttons)
	sw	$2,16($sp)
	move	$7,$0
	move	$6,$0
	move	$5,$0
	jal	KWSprite
	move	$4,$0

	li	$2,16			# 0x10
	sw	$2,20($sp)
	sw	$2,16($sp)
	lui	$7,%hi(hud_buttons+1536)
	addiu	$7,$7,%lo(hud_buttons+1536)
	mfc1	$6,$f20
	move	$5,$16
	jal	KWSpriteScale
	move	$4,$17

	b	$L147
	lw	$31,36($sp)

$L140:
	lui	$2,%hi($LC14)
	lwc1	$f0,%lo($LC14)($2)
	c.eq.s	$f20,$f0
	nop
	bc1t	$L149
	lui	$2,%hi(hud_buttons+1024)

	mtc1	$0,$f0
	nop
	c.eq.s	$f20,$f0
	nop
	bc1fl	$L145
	lui	$2,%hi(hud_buttons)

$L149:
	addiu	$2,$2,%lo(hud_buttons+1024)
	sw	$2,16($sp)
	li	$7,16			# 0x10
	li	$6,16			# 0x10
	move	$5,$16
	jal	KWSprite
	move	$4,$17

	b	$L147
	lw	$31,36($sp)

$L145:
	addiu	$2,$2,%lo(hud_buttons)
	sw	$2,16($sp)
	move	$7,$0
	move	$6,$0
	move	$5,$0
	jal	KWSprite
	move	$4,$0

	li	$2,16			# 0x10
	sw	$2,20($sp)
	sw	$2,16($sp)
	lui	$7,%hi(hud_buttons+1024)
	addiu	$7,$7,%lo(hud_buttons+1024)
	mfc1	$6,$f20
	move	$5,$16
	jal	KWSpriteScale
	move	$4,$17

	b	$L147
	lw	$31,36($sp)

	.set	macro
	.set	reorder
	.end	SpriteBtnB
	.size	SpriteBtnB, .-SpriteBtnB
	.align	2
	.globl	SpriteBtnStart
	.set	nomips16
	.set	nomicromips
	.ent	SpriteBtnStart
	.type	SpriteBtnStart, @function
SpriteBtnStart:
	.frame	$sp,48,$31		# vars= 0, regs= 3/2, args= 24, gp= 0
	.mask	0x80030000,-12
	.fmask	0x00300000,-8
	.set	noreorder
	.set	nomacro
	addiu	$sp,$sp,-48
	sw	$31,36($sp)
	sw	$17,32($sp)
	sw	$16,28($sp)
	sdc1	$f20,40($sp)
	move	$17,$4
	mtc1	$6,$f20
	beq	$7,$0,$L151
	move	$16,$5

	lui	$2,%hi($LC14)
	lwc1	$f0,%lo($LC14)($2)
	c.eq.s	$f20,$f0
	nop
	bc1t	$L159
	lui	$2,%hi(hud_buttons+2560)

	mtc1	$0,$f0
	nop
	c.eq.s	$f20,$f0
	nop
	bc1fl	$L153
	lui	$2,%hi(hud_buttons)

$L159:
	addiu	$2,$2,%lo(hud_buttons+2560)
	sw	$2,16($sp)
	li	$7,16			# 0x10
	li	$6,16			# 0x10
	move	$5,$16
	jal	KWSprite
	move	$4,$17

	lw	$31,36($sp)
$L158:
	lw	$17,32($sp)
	lw	$16,28($sp)
	ldc1	$f20,40($sp)
	jr	$31
	addiu	$sp,$sp,48

$L153:
	addiu	$2,$2,%lo(hud_buttons)
	sw	$2,16($sp)
	move	$7,$0
	move	$6,$0
	move	$5,$0
	jal	KWSprite
	move	$4,$0

	li	$2,16			# 0x10
	sw	$2,20($sp)
	sw	$2,16($sp)
	lui	$7,%hi(hud_buttons+2560)
	addiu	$7,$7,%lo(hud_buttons+2560)
	mfc1	$6,$f20
	move	$5,$16
	jal	KWSpriteScale
	move	$4,$17

	b	$L158
	lw	$31,36($sp)

$L151:
	lui	$2,%hi($LC14)
	lwc1	$f0,%lo($LC14)($2)
	c.eq.s	$f20,$f0
	nop
	bc1t	$L160
	lui	$2,%hi(hud_buttons+2048)

	mtc1	$0,$f0
	nop
	c.eq.s	$f20,$f0
	nop
	bc1fl	$L156
	lui	$2,%hi(hud_buttons)

$L160:
	addiu	$2,$2,%lo(hud_buttons+2048)
	sw	$2,16($sp)
	li	$7,16			# 0x10
	li	$6,16			# 0x10
	move	$5,$16
	jal	KWSprite
	move	$4,$17

	b	$L158
	lw	$31,36($sp)

$L156:
	addiu	$2,$2,%lo(hud_buttons)
	sw	$2,16($sp)
	move	$7,$0
	move	$6,$0
	move	$5,$0
	jal	KWSprite
	move	$4,$0

	li	$2,16			# 0x10
	sw	$2,20($sp)
	sw	$2,16($sp)
	lui	$7,%hi(hud_buttons+2048)
	addiu	$7,$7,%lo(hud_buttons+2048)
	mfc1	$6,$f20
	move	$5,$16
	jal	KWSpriteScale
	move	$4,$17

	b	$L158
	lw	$31,36($sp)

	.set	macro
	.set	reorder
	.end	SpriteBtnStart
	.size	SpriteBtnStart, .-SpriteBtnStart
	.align	2
	.globl	SpriteBtnCUp
	.set	nomips16
	.set	nomicromips
	.ent	SpriteBtnCUp
	.type	SpriteBtnCUp, @function
SpriteBtnCUp:
	.frame	$sp,48,$31		# vars= 0, regs= 3/2, args= 24, gp= 0
	.mask	0x80030000,-12
	.fmask	0x00300000,-8
	.set	noreorder
	.set	nomacro
	addiu	$sp,$sp,-48
	sw	$31,36($sp)
	sw	$17,32($sp)
	sw	$16,28($sp)
	sdc1	$f20,40($sp)
	move	$17,$4
	mtc1	$6,$f20
	beq	$7,$0,$L162
	move	$16,$5

	lui	$2,%hi($LC14)
	lwc1	$f0,%lo($LC14)($2)
	c.eq.s	$f20,$f0
	nop
	bc1t	$L170
	lui	$2,%hi(hud_buttons+3584)

	mtc1	$0,$f0
	nop
	c.eq.s	$f20,$f0
	nop
	bc1fl	$L164
	lui	$2,%hi(hud_buttons)

$L170:
	addiu	$2,$2,%lo(hud_buttons+3584)
	sw	$2,16($sp)
	li	$7,16			# 0x10
	li	$6,16			# 0x10
	move	$5,$16
	jal	KWSprite
	move	$4,$17

	lw	$31,36($sp)
$L169:
	lw	$17,32($sp)
	lw	$16,28($sp)
	ldc1	$f20,40($sp)
	jr	$31
	addiu	$sp,$sp,48

$L164:
	addiu	$2,$2,%lo(hud_buttons)
	sw	$2,16($sp)
	move	$7,$0
	move	$6,$0
	move	$5,$0
	jal	KWSprite
	move	$4,$0

	li	$2,16			# 0x10
	sw	$2,20($sp)
	sw	$2,16($sp)
	lui	$7,%hi(hud_buttons+3584)
	addiu	$7,$7,%lo(hud_buttons+3584)
	mfc1	$6,$f20
	move	$5,$16
	jal	KWSpriteScale
	move	$4,$17

	b	$L169
	lw	$31,36($sp)

$L162:
	lui	$2,%hi($LC14)
	lwc1	$f0,%lo($LC14)($2)
	c.eq.s	$f20,$f0
	nop
	bc1t	$L171
	lui	$2,%hi(hud_buttons+3072)

	mtc1	$0,$f0
	nop
	c.eq.s	$f20,$f0
	nop
	bc1fl	$L167
	lui	$2,%hi(hud_buttons)

$L171:
	addiu	$2,$2,%lo(hud_buttons+3072)
	sw	$2,16($sp)
	li	$7,16			# 0x10
	li	$6,16			# 0x10
	move	$5,$16
	jal	KWSprite
	move	$4,$17

	b	$L169
	lw	$31,36($sp)

$L167:
	addiu	$2,$2,%lo(hud_buttons)
	sw	$2,16($sp)
	move	$7,$0
	move	$6,$0
	move	$5,$0
	jal	KWSprite
	move	$4,$0

	li	$2,16			# 0x10
	sw	$2,20($sp)
	sw	$2,16($sp)
	lui	$7,%hi(hud_buttons+3072)
	addiu	$7,$7,%lo(hud_buttons+3072)
	mfc1	$6,$f20
	move	$5,$16
	jal	KWSpriteScale
	move	$4,$17

	b	$L169
	lw	$31,36($sp)

	.set	macro
	.set	reorder
	.end	SpriteBtnCUp
	.size	SpriteBtnCUp, .-SpriteBtnCUp
	.align	2
	.globl	SpriteBtnCDown
	.set	nomips16
	.set	nomicromips
	.ent	SpriteBtnCDown
	.type	SpriteBtnCDown, @function
SpriteBtnCDown:
	.frame	$sp,48,$31		# vars= 0, regs= 3/2, args= 24, gp= 0
	.mask	0x80030000,-12
	.fmask	0x00300000,-8
	.set	noreorder
	.set	nomacro
	addiu	$sp,$sp,-48
	sw	$31,36($sp)
	sw	$17,32($sp)
	sw	$16,28($sp)
	sdc1	$f20,40($sp)
	move	$17,$4
	mtc1	$6,$f20
	beq	$7,$0,$L173
	move	$16,$5

	lui	$2,%hi($LC14)
	lwc1	$f0,%lo($LC14)($2)
	c.eq.s	$f20,$f0
	nop
	bc1t	$L181
	lui	$2,%hi(hud_buttons+4608)

	mtc1	$0,$f0
	nop
	c.eq.s	$f20,$f0
	nop
	bc1fl	$L175
	lui	$2,%hi(hud_buttons)

$L181:
	addiu	$2,$2,%lo(hud_buttons+4608)
	sw	$2,16($sp)
	li	$7,16			# 0x10
	li	$6,16			# 0x10
	move	$5,$16
	jal	KWSprite
	move	$4,$17

	lw	$31,36($sp)
$L180:
	lw	$17,32($sp)
	lw	$16,28($sp)
	ldc1	$f20,40($sp)
	jr	$31
	addiu	$sp,$sp,48

$L175:
	addiu	$2,$2,%lo(hud_buttons)
	sw	$2,16($sp)
	move	$7,$0
	move	$6,$0
	move	$5,$0
	jal	KWSprite
	move	$4,$0

	li	$2,16			# 0x10
	sw	$2,20($sp)
	sw	$2,16($sp)
	lui	$7,%hi(hud_buttons+4608)
	addiu	$7,$7,%lo(hud_buttons+4608)
	mfc1	$6,$f20
	move	$5,$16
	jal	KWSpriteScale
	move	$4,$17

	b	$L180
	lw	$31,36($sp)

$L173:
	lui	$2,%hi($LC14)
	lwc1	$f0,%lo($LC14)($2)
	c.eq.s	$f20,$f0
	nop
	bc1t	$L182
	lui	$2,%hi(hud_buttons+4096)

	mtc1	$0,$f0
	nop
	c.eq.s	$f20,$f0
	nop
	bc1fl	$L178
	lui	$2,%hi(hud_buttons)

$L182:
	addiu	$2,$2,%lo(hud_buttons+4096)
	sw	$2,16($sp)
	li	$7,16			# 0x10
	li	$6,16			# 0x10
	move	$5,$16
	jal	KWSprite
	move	$4,$17

	b	$L180
	lw	$31,36($sp)

$L178:
	addiu	$2,$2,%lo(hud_buttons)
	sw	$2,16($sp)
	move	$7,$0
	move	$6,$0
	move	$5,$0
	jal	KWSprite
	move	$4,$0

	li	$2,16			# 0x10
	sw	$2,20($sp)
	sw	$2,16($sp)
	lui	$7,%hi(hud_buttons+4096)
	addiu	$7,$7,%lo(hud_buttons+4096)
	mfc1	$6,$f20
	move	$5,$16
	jal	KWSpriteScale
	move	$4,$17

	b	$L180
	lw	$31,36($sp)

	.set	macro
	.set	reorder
	.end	SpriteBtnCDown
	.size	SpriteBtnCDown, .-SpriteBtnCDown
	.align	2
	.globl	SpriteBtnCLeft
	.set	nomips16
	.set	nomicromips
	.ent	SpriteBtnCLeft
	.type	SpriteBtnCLeft, @function
SpriteBtnCLeft:
	.frame	$sp,48,$31		# vars= 0, regs= 3/2, args= 24, gp= 0
	.mask	0x80030000,-12
	.fmask	0x00300000,-8
	.set	noreorder
	.set	nomacro
	addiu	$sp,$sp,-48
	sw	$31,36($sp)
	sw	$17,32($sp)
	sw	$16,28($sp)
	sdc1	$f20,40($sp)
	move	$17,$4
	mtc1	$6,$f20
	beq	$7,$0,$L184
	move	$16,$5

	lui	$2,%hi($LC14)
	lwc1	$f0,%lo($LC14)($2)
	c.eq.s	$f20,$f0
	nop
	bc1t	$L192
	lui	$2,%hi(hud_buttons+5632)

	mtc1	$0,$f0
	nop
	c.eq.s	$f20,$f0
	nop
	bc1fl	$L186
	lui	$2,%hi(hud_buttons)

$L192:
	addiu	$2,$2,%lo(hud_buttons+5632)
	sw	$2,16($sp)
	li	$7,16			# 0x10
	li	$6,16			# 0x10
	move	$5,$16
	jal	KWSprite
	move	$4,$17

	lw	$31,36($sp)
$L191:
	lw	$17,32($sp)
	lw	$16,28($sp)
	ldc1	$f20,40($sp)
	jr	$31
	addiu	$sp,$sp,48

$L186:
	addiu	$2,$2,%lo(hud_buttons)
	sw	$2,16($sp)
	move	$7,$0
	move	$6,$0
	move	$5,$0
	jal	KWSprite
	move	$4,$0

	li	$2,16			# 0x10
	sw	$2,20($sp)
	sw	$2,16($sp)
	lui	$7,%hi(hud_buttons+5632)
	addiu	$7,$7,%lo(hud_buttons+5632)
	mfc1	$6,$f20
	move	$5,$16
	jal	KWSpriteScale
	move	$4,$17

	b	$L191
	lw	$31,36($sp)

$L184:
	lui	$2,%hi($LC14)
	lwc1	$f0,%lo($LC14)($2)
	c.eq.s	$f20,$f0
	nop
	bc1t	$L193
	lui	$2,%hi(hud_buttons+5120)

	mtc1	$0,$f0
	nop
	c.eq.s	$f20,$f0
	nop
	bc1fl	$L189
	lui	$2,%hi(hud_buttons)

$L193:
	addiu	$2,$2,%lo(hud_buttons+5120)
	sw	$2,16($sp)
	li	$7,16			# 0x10
	li	$6,16			# 0x10
	move	$5,$16
	jal	KWSprite
	move	$4,$17

	b	$L191
	lw	$31,36($sp)

$L189:
	addiu	$2,$2,%lo(hud_buttons)
	sw	$2,16($sp)
	move	$7,$0
	move	$6,$0
	move	$5,$0
	jal	KWSprite
	move	$4,$0

	li	$2,16			# 0x10
	sw	$2,20($sp)
	sw	$2,16($sp)
	lui	$7,%hi(hud_buttons+5120)
	addiu	$7,$7,%lo(hud_buttons+5120)
	mfc1	$6,$f20
	move	$5,$16
	jal	KWSpriteScale
	move	$4,$17

	b	$L191
	lw	$31,36($sp)

	.set	macro
	.set	reorder
	.end	SpriteBtnCLeft
	.size	SpriteBtnCLeft, .-SpriteBtnCLeft
	.align	2
	.globl	SpriteBtnCRight
	.set	nomips16
	.set	nomicromips
	.ent	SpriteBtnCRight
	.type	SpriteBtnCRight, @function
SpriteBtnCRight:
	.frame	$sp,48,$31		# vars= 0, regs= 3/2, args= 24, gp= 0
	.mask	0x80030000,-12
	.fmask	0x00300000,-8
	.set	noreorder
	.set	nomacro
	addiu	$sp,$sp,-48
	sw	$31,36($sp)
	sw	$17,32($sp)
	sw	$16,28($sp)
	sdc1	$f20,40($sp)
	move	$17,$4
	mtc1	$6,$f20
	beq	$7,$0,$L195
	move	$16,$5

	lui	$2,%hi($LC14)
	lwc1	$f0,%lo($LC14)($2)
	c.eq.s	$f20,$f0
	nop
	bc1t	$L203
	lui	$2,%hi(hud_buttons+6656)

	mtc1	$0,$f0
	nop
	c.eq.s	$f20,$f0
	nop
	bc1fl	$L197
	lui	$2,%hi(hud_buttons)

$L203:
	addiu	$2,$2,%lo(hud_buttons+6656)
	sw	$2,16($sp)
	li	$7,16			# 0x10
	li	$6,16			# 0x10
	move	$5,$16
	jal	KWSprite
	move	$4,$17

	lw	$31,36($sp)
$L202:
	lw	$17,32($sp)
	lw	$16,28($sp)
	ldc1	$f20,40($sp)
	jr	$31
	addiu	$sp,$sp,48

$L197:
	addiu	$2,$2,%lo(hud_buttons)
	sw	$2,16($sp)
	move	$7,$0
	move	$6,$0
	move	$5,$0
	jal	KWSprite
	move	$4,$0

	li	$2,16			# 0x10
	sw	$2,20($sp)
	sw	$2,16($sp)
	lui	$7,%hi(hud_buttons+6656)
	addiu	$7,$7,%lo(hud_buttons+6656)
	mfc1	$6,$f20
	move	$5,$16
	jal	KWSpriteScale
	move	$4,$17

	b	$L202
	lw	$31,36($sp)

$L195:
	lui	$2,%hi($LC14)
	lwc1	$f0,%lo($LC14)($2)
	c.eq.s	$f20,$f0
	nop
	bc1t	$L204
	lui	$2,%hi(hud_buttons+6144)

	mtc1	$0,$f0
	nop
	c.eq.s	$f20,$f0
	nop
	bc1fl	$L200
	lui	$2,%hi(hud_buttons)

$L204:
	addiu	$2,$2,%lo(hud_buttons+6144)
	sw	$2,16($sp)
	li	$7,16			# 0x10
	li	$6,16			# 0x10
	move	$5,$16
	jal	KWSprite
	move	$4,$17

	b	$L202
	lw	$31,36($sp)

$L200:
	addiu	$2,$2,%lo(hud_buttons)
	sw	$2,16($sp)
	move	$7,$0
	move	$6,$0
	move	$5,$0
	jal	KWSprite
	move	$4,$0

	li	$2,16			# 0x10
	sw	$2,20($sp)
	sw	$2,16($sp)
	lui	$7,%hi(hud_buttons+6144)
	addiu	$7,$7,%lo(hud_buttons+6144)
	mfc1	$6,$f20
	move	$5,$16
	jal	KWSpriteScale
	move	$4,$17

	b	$L202
	lw	$31,36($sp)

	.set	macro
	.set	reorder
	.end	SpriteBtnCRight
	.size	SpriteBtnCRight, .-SpriteBtnCRight
	.align	2
	.globl	SpriteBtnL
	.set	nomips16
	.set	nomicromips
	.ent	SpriteBtnL
	.type	SpriteBtnL, @function
SpriteBtnL:
	.frame	$sp,48,$31		# vars= 0, regs= 3/2, args= 24, gp= 0
	.mask	0x80030000,-12
	.fmask	0x00300000,-8
	.set	noreorder
	.set	nomacro
	addiu	$sp,$sp,-48
	sw	$31,36($sp)
	sw	$17,32($sp)
	sw	$16,28($sp)
	sdc1	$f20,40($sp)
	move	$17,$4
	mtc1	$6,$f20
	beq	$7,$0,$L206
	move	$16,$5

	lui	$2,%hi($LC14)
	lwc1	$f0,%lo($LC14)($2)
	c.eq.s	$f20,$f0
	nop
	bc1t	$L214
	lui	$2,%hi(hud_buttons+7680)

	mtc1	$0,$f0
	nop
	c.eq.s	$f20,$f0
	nop
	bc1fl	$L208
	lui	$2,%hi(hud_buttons)

$L214:
	addiu	$2,$2,%lo(hud_buttons+7680)
	sw	$2,16($sp)
	li	$7,16			# 0x10
	li	$6,16			# 0x10
	move	$5,$16
	jal	KWSprite
	move	$4,$17

	lw	$31,36($sp)
$L213:
	lw	$17,32($sp)
	lw	$16,28($sp)
	ldc1	$f20,40($sp)
	jr	$31
	addiu	$sp,$sp,48

$L208:
	addiu	$2,$2,%lo(hud_buttons)
	sw	$2,16($sp)
	move	$7,$0
	move	$6,$0
	move	$5,$0
	jal	KWSprite
	move	$4,$0

	li	$2,16			# 0x10
	sw	$2,20($sp)
	sw	$2,16($sp)
	lui	$7,%hi(hud_buttons+7680)
	addiu	$7,$7,%lo(hud_buttons+7680)
	mfc1	$6,$f20
	move	$5,$16
	jal	KWSpriteScale
	move	$4,$17

	b	$L213
	lw	$31,36($sp)

$L206:
	lui	$2,%hi($LC14)
	lwc1	$f0,%lo($LC14)($2)
	c.eq.s	$f20,$f0
	nop
	bc1t	$L215
	lui	$2,%hi(hud_buttons+7168)

	mtc1	$0,$f0
	nop
	c.eq.s	$f20,$f0
	nop
	bc1fl	$L211
	lui	$2,%hi(hud_buttons)

$L215:
	addiu	$2,$2,%lo(hud_buttons+7168)
	sw	$2,16($sp)
	li	$7,16			# 0x10
	li	$6,16			# 0x10
	move	$5,$16
	jal	KWSprite
	move	$4,$17

	b	$L213
	lw	$31,36($sp)

$L211:
	addiu	$2,$2,%lo(hud_buttons)
	sw	$2,16($sp)
	move	$7,$0
	move	$6,$0
	move	$5,$0
	jal	KWSprite
	move	$4,$0

	li	$2,16			# 0x10
	sw	$2,20($sp)
	sw	$2,16($sp)
	lui	$7,%hi(hud_buttons+7168)
	addiu	$7,$7,%lo(hud_buttons+7168)
	mfc1	$6,$f20
	move	$5,$16
	jal	KWSpriteScale
	move	$4,$17

	b	$L213
	lw	$31,36($sp)

	.set	macro
	.set	reorder
	.end	SpriteBtnL
	.size	SpriteBtnL, .-SpriteBtnL
	.align	2
	.globl	SpriteBtnR
	.set	nomips16
	.set	nomicromips
	.ent	SpriteBtnR
	.type	SpriteBtnR, @function
SpriteBtnR:
	.frame	$sp,48,$31		# vars= 0, regs= 3/2, args= 24, gp= 0
	.mask	0x80030000,-12
	.fmask	0x00300000,-8
	.set	noreorder
	.set	nomacro
	addiu	$sp,$sp,-48
	sw	$31,36($sp)
	sw	$17,32($sp)
	sw	$16,28($sp)
	sdc1	$f20,40($sp)
	move	$17,$4
	mtc1	$6,$f20
	beq	$7,$0,$L217
	move	$16,$5

	lui	$2,%hi($LC14)
	lwc1	$f0,%lo($LC14)($2)
	c.eq.s	$f20,$f0
	nop
	bc1t	$L225
	lui	$2,%hi(hud_buttons+8704)

	mtc1	$0,$f0
	nop
	c.eq.s	$f20,$f0
	nop
	bc1fl	$L219
	lui	$2,%hi(hud_buttons)

$L225:
	addiu	$2,$2,%lo(hud_buttons+8704)
	sw	$2,16($sp)
	li	$7,16			# 0x10
	li	$6,16			# 0x10
	move	$5,$16
	jal	KWSprite
	move	$4,$17

	lw	$31,36($sp)
$L224:
	lw	$17,32($sp)
	lw	$16,28($sp)
	ldc1	$f20,40($sp)
	jr	$31
	addiu	$sp,$sp,48

$L219:
	addiu	$2,$2,%lo(hud_buttons)
	sw	$2,16($sp)
	move	$7,$0
	move	$6,$0
	move	$5,$0
	jal	KWSprite
	move	$4,$0

	li	$2,16			# 0x10
	sw	$2,20($sp)
	sw	$2,16($sp)
	lui	$7,%hi(hud_buttons+8704)
	addiu	$7,$7,%lo(hud_buttons+8704)
	mfc1	$6,$f20
	move	$5,$16
	jal	KWSpriteScale
	move	$4,$17

	b	$L224
	lw	$31,36($sp)

$L217:
	lui	$2,%hi($LC14)
	lwc1	$f0,%lo($LC14)($2)
	c.eq.s	$f20,$f0
	nop
	bc1t	$L226
	lui	$2,%hi(hud_buttons+8192)

	mtc1	$0,$f0
	nop
	c.eq.s	$f20,$f0
	nop
	bc1fl	$L222
	lui	$2,%hi(hud_buttons)

$L226:
	addiu	$2,$2,%lo(hud_buttons+8192)
	sw	$2,16($sp)
	li	$7,16			# 0x10
	li	$6,16			# 0x10
	move	$5,$16
	jal	KWSprite
	move	$4,$17

	b	$L224
	lw	$31,36($sp)

$L222:
	addiu	$2,$2,%lo(hud_buttons)
	sw	$2,16($sp)
	move	$7,$0
	move	$6,$0
	move	$5,$0
	jal	KWSprite
	move	$4,$0

	li	$2,16			# 0x10
	sw	$2,20($sp)
	sw	$2,16($sp)
	lui	$7,%hi(hud_buttons+8192)
	addiu	$7,$7,%lo(hud_buttons+8192)
	mfc1	$6,$f20
	move	$5,$16
	jal	KWSpriteScale
	move	$4,$17

	b	$L224
	lw	$31,36($sp)

	.set	macro
	.set	reorder
	.end	SpriteBtnR
	.size	SpriteBtnR, .-SpriteBtnR
	.align	2
	.globl	SpriteBtnZ
	.set	nomips16
	.set	nomicromips
	.ent	SpriteBtnZ
	.type	SpriteBtnZ, @function
SpriteBtnZ:
	.frame	$sp,48,$31		# vars= 0, regs= 3/2, args= 24, gp= 0
	.mask	0x80030000,-12
	.fmask	0x00300000,-8
	.set	noreorder
	.set	nomacro
	addiu	$sp,$sp,-48
	sw	$31,36($sp)
	sw	$17,32($sp)
	sw	$16,28($sp)
	sdc1	$f20,40($sp)
	move	$17,$4
	mtc1	$6,$f20
	beq	$7,$0,$L228
	move	$16,$5

	lui	$2,%hi($LC14)
	lwc1	$f0,%lo($LC14)($2)
	c.eq.s	$f20,$f0
	nop
	bc1t	$L236
	lui	$2,%hi(hud_buttons+9728)

	mtc1	$0,$f0
	nop
	c.eq.s	$f20,$f0
	nop
	bc1fl	$L230
	lui	$2,%hi(hud_buttons)

$L236:
	addiu	$2,$2,%lo(hud_buttons+9728)
	sw	$2,16($sp)
	li	$7,16			# 0x10
	li	$6,16			# 0x10
	move	$5,$16
	jal	KWSprite
	move	$4,$17

	lw	$31,36($sp)
$L235:
	lw	$17,32($sp)
	lw	$16,28($sp)
	ldc1	$f20,40($sp)
	jr	$31
	addiu	$sp,$sp,48

$L230:
	addiu	$2,$2,%lo(hud_buttons)
	sw	$2,16($sp)
	move	$7,$0
	move	$6,$0
	move	$5,$0
	jal	KWSprite
	move	$4,$0

	li	$2,16			# 0x10
	sw	$2,20($sp)
	sw	$2,16($sp)
	lui	$7,%hi(hud_buttons+9728)
	addiu	$7,$7,%lo(hud_buttons+9728)
	mfc1	$6,$f20
	move	$5,$16
	jal	KWSpriteScale
	move	$4,$17

	b	$L235
	lw	$31,36($sp)

$L228:
	lui	$2,%hi($LC14)
	lwc1	$f0,%lo($LC14)($2)
	c.eq.s	$f20,$f0
	nop
	bc1t	$L237
	lui	$2,%hi(hud_buttons+9216)

	mtc1	$0,$f0
	nop
	c.eq.s	$f20,$f0
	nop
	bc1fl	$L233
	lui	$2,%hi(hud_buttons)

$L237:
	addiu	$2,$2,%lo(hud_buttons+9216)
	sw	$2,16($sp)
	li	$7,16			# 0x10
	li	$6,16			# 0x10
	move	$5,$16
	jal	KWSprite
	move	$4,$17

	b	$L235
	lw	$31,36($sp)

$L233:
	addiu	$2,$2,%lo(hud_buttons)
	sw	$2,16($sp)
	move	$7,$0
	move	$6,$0
	move	$5,$0
	jal	KWSprite
	move	$4,$0

	li	$2,16			# 0x10
	sw	$2,20($sp)
	sw	$2,16($sp)
	lui	$7,%hi(hud_buttons+9216)
	addiu	$7,$7,%lo(hud_buttons+9216)
	mfc1	$6,$f20
	move	$5,$16
	jal	KWSpriteScale
	move	$4,$17

	b	$L235
	lw	$31,36($sp)

	.set	macro
	.set	reorder
	.end	SpriteBtnZ
	.size	SpriteBtnZ, .-SpriteBtnZ
	.align	2
	.globl	SpriteBtnDUp
	.set	nomips16
	.set	nomicromips
	.ent	SpriteBtnDUp
	.type	SpriteBtnDUp, @function
SpriteBtnDUp:
	.frame	$sp,48,$31		# vars= 0, regs= 3/2, args= 24, gp= 0
	.mask	0x80030000,-12
	.fmask	0x00300000,-8
	.set	noreorder
	.set	nomacro
	addiu	$sp,$sp,-48
	sw	$31,36($sp)
	sw	$17,32($sp)
	sw	$16,28($sp)
	sdc1	$f20,40($sp)
	move	$17,$4
	mtc1	$6,$f20
	beq	$7,$0,$L239
	move	$16,$5

	lui	$2,%hi($LC14)
	lwc1	$f0,%lo($LC14)($2)
	c.eq.s	$f20,$f0
	nop
	bc1t	$L247
	lui	$2,%hi(hud_buttons+10752)

	mtc1	$0,$f0
	nop
	c.eq.s	$f20,$f0
	nop
	bc1fl	$L241
	lui	$2,%hi(hud_buttons)

$L247:
	addiu	$2,$2,%lo(hud_buttons+10752)
	sw	$2,16($sp)
	li	$7,16			# 0x10
	li	$6,16			# 0x10
	move	$5,$16
	jal	KWSprite
	move	$4,$17

	lw	$31,36($sp)
$L246:
	lw	$17,32($sp)
	lw	$16,28($sp)
	ldc1	$f20,40($sp)
	jr	$31
	addiu	$sp,$sp,48

$L241:
	addiu	$2,$2,%lo(hud_buttons)
	sw	$2,16($sp)
	move	$7,$0
	move	$6,$0
	move	$5,$0
	jal	KWSprite
	move	$4,$0

	li	$2,16			# 0x10
	sw	$2,20($sp)
	sw	$2,16($sp)
	lui	$7,%hi(hud_buttons+10752)
	addiu	$7,$7,%lo(hud_buttons+10752)
	mfc1	$6,$f20
	move	$5,$16
	jal	KWSpriteScale
	move	$4,$17

	b	$L246
	lw	$31,36($sp)

$L239:
	lui	$2,%hi($LC14)
	lwc1	$f0,%lo($LC14)($2)
	c.eq.s	$f20,$f0
	nop
	bc1t	$L248
	lui	$2,%hi(hud_buttons+10240)

	mtc1	$0,$f0
	nop
	c.eq.s	$f20,$f0
	nop
	bc1fl	$L244
	lui	$2,%hi(hud_buttons)

$L248:
	addiu	$2,$2,%lo(hud_buttons+10240)
	sw	$2,16($sp)
	li	$7,16			# 0x10
	li	$6,16			# 0x10
	move	$5,$16
	jal	KWSprite
	move	$4,$17

	b	$L246
	lw	$31,36($sp)

$L244:
	addiu	$2,$2,%lo(hud_buttons)
	sw	$2,16($sp)
	move	$7,$0
	move	$6,$0
	move	$5,$0
	jal	KWSprite
	move	$4,$0

	li	$2,16			# 0x10
	sw	$2,20($sp)
	sw	$2,16($sp)
	lui	$7,%hi(hud_buttons+10240)
	addiu	$7,$7,%lo(hud_buttons+10240)
	mfc1	$6,$f20
	move	$5,$16
	jal	KWSpriteScale
	move	$4,$17

	b	$L246
	lw	$31,36($sp)

	.set	macro
	.set	reorder
	.end	SpriteBtnDUp
	.size	SpriteBtnDUp, .-SpriteBtnDUp
	.align	2
	.globl	SpriteBtnDDown
	.set	nomips16
	.set	nomicromips
	.ent	SpriteBtnDDown
	.type	SpriteBtnDDown, @function
SpriteBtnDDown:
	.frame	$sp,48,$31		# vars= 0, regs= 3/2, args= 24, gp= 0
	.mask	0x80030000,-12
	.fmask	0x00300000,-8
	.set	noreorder
	.set	nomacro
	addiu	$sp,$sp,-48
	sw	$31,36($sp)
	sw	$17,32($sp)
	sw	$16,28($sp)
	sdc1	$f20,40($sp)
	move	$17,$4
	mtc1	$6,$f20
	beq	$7,$0,$L250
	move	$16,$5

	lui	$2,%hi($LC14)
	lwc1	$f0,%lo($LC14)($2)
	c.eq.s	$f20,$f0
	nop
	bc1t	$L258
	lui	$2,%hi(hud_buttons+11776)

	mtc1	$0,$f0
	nop
	c.eq.s	$f20,$f0
	nop
	bc1fl	$L252
	lui	$2,%hi(hud_buttons)

$L258:
	addiu	$2,$2,%lo(hud_buttons+11776)
	sw	$2,16($sp)
	li	$7,16			# 0x10
	li	$6,16			# 0x10
	move	$5,$16
	jal	KWSprite
	move	$4,$17

	lw	$31,36($sp)
$L257:
	lw	$17,32($sp)
	lw	$16,28($sp)
	ldc1	$f20,40($sp)
	jr	$31
	addiu	$sp,$sp,48

$L252:
	addiu	$2,$2,%lo(hud_buttons)
	sw	$2,16($sp)
	move	$7,$0
	move	$6,$0
	move	$5,$0
	jal	KWSprite
	move	$4,$0

	li	$2,16			# 0x10
	sw	$2,20($sp)
	sw	$2,16($sp)
	lui	$7,%hi(hud_buttons+11776)
	addiu	$7,$7,%lo(hud_buttons+11776)
	mfc1	$6,$f20
	move	$5,$16
	jal	KWSpriteScale
	move	$4,$17

	b	$L257
	lw	$31,36($sp)

$L250:
	lui	$2,%hi($LC14)
	lwc1	$f0,%lo($LC14)($2)
	c.eq.s	$f20,$f0
	nop
	bc1t	$L259
	lui	$2,%hi(hud_buttons+11264)

	mtc1	$0,$f0
	nop
	c.eq.s	$f20,$f0
	nop
	bc1fl	$L255
	lui	$2,%hi(hud_buttons)

$L259:
	addiu	$2,$2,%lo(hud_buttons+11264)
	sw	$2,16($sp)
	li	$7,16			# 0x10
	li	$6,16			# 0x10
	move	$5,$16
	jal	KWSprite
	move	$4,$17

	b	$L257
	lw	$31,36($sp)

$L255:
	addiu	$2,$2,%lo(hud_buttons)
	sw	$2,16($sp)
	move	$7,$0
	move	$6,$0
	move	$5,$0
	jal	KWSprite
	move	$4,$0

	li	$2,16			# 0x10
	sw	$2,20($sp)
	sw	$2,16($sp)
	lui	$7,%hi(hud_buttons+11264)
	addiu	$7,$7,%lo(hud_buttons+11264)
	mfc1	$6,$f20
	move	$5,$16
	jal	KWSpriteScale
	move	$4,$17

	b	$L257
	lw	$31,36($sp)

	.set	macro
	.set	reorder
	.end	SpriteBtnDDown
	.size	SpriteBtnDDown, .-SpriteBtnDDown
	.align	2
	.globl	SpriteBtnDLeft
	.set	nomips16
	.set	nomicromips
	.ent	SpriteBtnDLeft
	.type	SpriteBtnDLeft, @function
SpriteBtnDLeft:
	.frame	$sp,48,$31		# vars= 0, regs= 3/2, args= 24, gp= 0
	.mask	0x80030000,-12
	.fmask	0x00300000,-8
	.set	noreorder
	.set	nomacro
	addiu	$sp,$sp,-48
	sw	$31,36($sp)
	sw	$17,32($sp)
	sw	$16,28($sp)
	sdc1	$f20,40($sp)
	move	$17,$4
	mtc1	$6,$f20
	beq	$7,$0,$L261
	move	$16,$5

	lui	$2,%hi($LC14)
	lwc1	$f0,%lo($LC14)($2)
	c.eq.s	$f20,$f0
	nop
	bc1t	$L269
	lui	$2,%hi(hud_buttons+12800)

	mtc1	$0,$f0
	nop
	c.eq.s	$f20,$f0
	nop
	bc1fl	$L263
	lui	$2,%hi(hud_buttons)

$L269:
	addiu	$2,$2,%lo(hud_buttons+12800)
	sw	$2,16($sp)
	li	$7,16			# 0x10
	li	$6,16			# 0x10
	move	$5,$16
	jal	KWSprite
	move	$4,$17

	lw	$31,36($sp)
$L268:
	lw	$17,32($sp)
	lw	$16,28($sp)
	ldc1	$f20,40($sp)
	jr	$31
	addiu	$sp,$sp,48

$L263:
	addiu	$2,$2,%lo(hud_buttons)
	sw	$2,16($sp)
	move	$7,$0
	move	$6,$0
	move	$5,$0
	jal	KWSprite
	move	$4,$0

	li	$2,16			# 0x10
	sw	$2,20($sp)
	sw	$2,16($sp)
	lui	$7,%hi(hud_buttons+12800)
	addiu	$7,$7,%lo(hud_buttons+12800)
	mfc1	$6,$f20
	move	$5,$16
	jal	KWSpriteScale
	move	$4,$17

	b	$L268
	lw	$31,36($sp)

$L261:
	lui	$2,%hi($LC14)
	lwc1	$f0,%lo($LC14)($2)
	c.eq.s	$f20,$f0
	nop
	bc1t	$L270
	lui	$2,%hi(hud_buttons+12288)

	mtc1	$0,$f0
	nop
	c.eq.s	$f20,$f0
	nop
	bc1fl	$L266
	lui	$2,%hi(hud_buttons)

$L270:
	addiu	$2,$2,%lo(hud_buttons+12288)
	sw	$2,16($sp)
	li	$7,16			# 0x10
	li	$6,16			# 0x10
	move	$5,$16
	jal	KWSprite
	move	$4,$17

	b	$L268
	lw	$31,36($sp)

$L266:
	addiu	$2,$2,%lo(hud_buttons)
	sw	$2,16($sp)
	move	$7,$0
	move	$6,$0
	move	$5,$0
	jal	KWSprite
	move	$4,$0

	li	$2,16			# 0x10
	sw	$2,20($sp)
	sw	$2,16($sp)
	lui	$7,%hi(hud_buttons+12288)
	addiu	$7,$7,%lo(hud_buttons+12288)
	mfc1	$6,$f20
	move	$5,$16
	jal	KWSpriteScale
	move	$4,$17

	b	$L268
	lw	$31,36($sp)

	.set	macro
	.set	reorder
	.end	SpriteBtnDLeft
	.size	SpriteBtnDLeft, .-SpriteBtnDLeft
	.align	2
	.globl	SpriteBtnDRight
	.set	nomips16
	.set	nomicromips
	.ent	SpriteBtnDRight
	.type	SpriteBtnDRight, @function
SpriteBtnDRight:
	.frame	$sp,48,$31		# vars= 0, regs= 3/2, args= 24, gp= 0
	.mask	0x80030000,-12
	.fmask	0x00300000,-8
	.set	noreorder
	.set	nomacro
	addiu	$sp,$sp,-48
	sw	$31,36($sp)
	sw	$17,32($sp)
	sw	$16,28($sp)
	sdc1	$f20,40($sp)
	move	$17,$4
	mtc1	$6,$f20
	beq	$7,$0,$L272
	move	$16,$5

	lui	$2,%hi($LC14)
	lwc1	$f0,%lo($LC14)($2)
	c.eq.s	$f20,$f0
	nop
	bc1t	$L280
	lui	$2,%hi(hud_buttons+13824)

	mtc1	$0,$f0
	nop
	c.eq.s	$f20,$f0
	nop
	bc1fl	$L274
	lui	$2,%hi(hud_buttons)

$L280:
	addiu	$2,$2,%lo(hud_buttons+13824)
	sw	$2,16($sp)
	li	$7,16			# 0x10
	li	$6,16			# 0x10
	move	$5,$16
	jal	KWSprite
	move	$4,$17

	lw	$31,36($sp)
$L279:
	lw	$17,32($sp)
	lw	$16,28($sp)
	ldc1	$f20,40($sp)
	jr	$31
	addiu	$sp,$sp,48

$L274:
	addiu	$2,$2,%lo(hud_buttons)
	sw	$2,16($sp)
	move	$7,$0
	move	$6,$0
	move	$5,$0
	jal	KWSprite
	move	$4,$0

	li	$2,16			# 0x10
	sw	$2,20($sp)
	sw	$2,16($sp)
	lui	$7,%hi(hud_buttons+13824)
	addiu	$7,$7,%lo(hud_buttons+13824)
	mfc1	$6,$f20
	move	$5,$16
	jal	KWSpriteScale
	move	$4,$17

	b	$L279
	lw	$31,36($sp)

$L272:
	lui	$2,%hi($LC14)
	lwc1	$f0,%lo($LC14)($2)
	c.eq.s	$f20,$f0
	nop
	bc1t	$L281
	lui	$2,%hi(hud_buttons+13312)

	mtc1	$0,$f0
	nop
	c.eq.s	$f20,$f0
	nop
	bc1fl	$L277
	lui	$2,%hi(hud_buttons)

$L281:
	addiu	$2,$2,%lo(hud_buttons+13312)
	sw	$2,16($sp)
	li	$7,16			# 0x10
	li	$6,16			# 0x10
	move	$5,$16
	jal	KWSprite
	move	$4,$17

	b	$L279
	lw	$31,36($sp)

$L277:
	addiu	$2,$2,%lo(hud_buttons)
	sw	$2,16($sp)
	move	$7,$0
	move	$6,$0
	move	$5,$0
	jal	KWSprite
	move	$4,$0

	li	$2,16			# 0x10
	sw	$2,20($sp)
	sw	$2,16($sp)
	lui	$7,%hi(hud_buttons+13312)
	addiu	$7,$7,%lo(hud_buttons+13312)
	mfc1	$6,$f20
	move	$5,$16
	jal	KWSpriteScale
	move	$4,$17

	b	$L279
	lw	$31,36($sp)

	.set	macro
	.set	reorder
	.end	SpriteBtnDRight
	.size	SpriteBtnDRight, .-SpriteBtnDRight
	.align	2
	.globl	SpriteBtnDMid
	.set	nomips16
	.set	nomicromips
	.ent	SpriteBtnDMid
	.type	SpriteBtnDMid, @function
SpriteBtnDMid:
	.frame	$sp,48,$31		# vars= 0, regs= 3/2, args= 24, gp= 0
	.mask	0x80030000,-12
	.fmask	0x00300000,-8
	.set	noreorder
	.set	nomacro
	addiu	$sp,$sp,-48
	sw	$31,36($sp)
	sw	$17,32($sp)
	sw	$16,28($sp)
	sdc1	$f20,40($sp)
	move	$17,$4
	mtc1	$6,$f20
	lui	$2,%hi($LC14)
	lwc1	$f0,%lo($LC14)($2)
	c.eq.s	$f20,$f0
	nop
	bc1t	$L283
	move	$16,$5

	mtc1	$0,$f0
	nop
	c.eq.s	$f20,$f0
	nop
	bc1f	$L284
	lui	$2,%hi(hud_buttons)

$L283:
	lui	$2,%hi(hud_buttons+14336)
	addiu	$2,$2,%lo(hud_buttons+14336)
	sw	$2,16($sp)
	li	$7,16			# 0x10
	li	$6,16			# 0x10
	move	$5,$16
	jal	KWSprite
	move	$4,$17

	lw	$31,36($sp)
$L287:
	lw	$17,32($sp)
	lw	$16,28($sp)
	ldc1	$f20,40($sp)
	jr	$31
	addiu	$sp,$sp,48

$L284:
	addiu	$2,$2,%lo(hud_buttons)
	sw	$2,16($sp)
	move	$7,$0
	move	$6,$0
	move	$5,$0
	jal	KWSprite
	move	$4,$0

	li	$2,16			# 0x10
	sw	$2,20($sp)
	sw	$2,16($sp)
	lui	$7,%hi(hud_buttons+14336)
	addiu	$7,$7,%lo(hud_buttons+14336)
	mfc1	$6,$f20
	move	$5,$16
	jal	KWSpriteScale
	move	$4,$17

	b	$L287
	lw	$31,36($sp)

	.set	macro
	.set	reorder
	.end	SpriteBtnDMid
	.size	SpriteBtnDMid, .-SpriteBtnDMid
	.align	2
	.globl	SpriteAnalogStick
	.set	nomips16
	.set	nomicromips
	.ent	SpriteAnalogStick
	.type	SpriteAnalogStick, @function
SpriteAnalogStick:
	.frame	$sp,48,$31		# vars= 0, regs= 3/2, args= 24, gp= 0
	.mask	0x80030000,-12
	.fmask	0x00300000,-8
	.set	noreorder
	.set	nomacro
	addiu	$sp,$sp,-48
	sw	$31,36($sp)
	sw	$17,32($sp)
	sw	$16,28($sp)
	sdc1	$f20,40($sp)
	move	$16,$4
	mtc1	$6,$f20
	li	$2,3			# 0x3
	beq	$7,$2,$L289
	move	$17,$5

	slt	$2,$7,4
	beq	$2,$0,$L290
	li	$2,1			# 0x1

	beq	$7,$2,$L291
	li	$2,2			# 0x2

	bne	$7,$2,$L293
	lui	$2,%hi($LC14)

	lwc1	$f0,%lo($LC14)($2)
	c.eq.s	$f20,$f0
	nop
	bc1t	$L308
	lui	$2,%hi(hud_buttons+15872)

	mtc1	$0,$f0
	nop
	c.eq.s	$f20,$f0
	nop
	bc1fl	$L299
	lui	$2,%hi(hud_buttons)

$L308:
	addiu	$2,$2,%lo(hud_buttons+15872)
	sw	$2,16($sp)
	li	$7,16			# 0x10
	li	$6,16			# 0x10
	move	$5,$17
	jal	KWSprite
	move	$4,$16

	b	$L307
	lw	$31,36($sp)

$L290:
	li	$2,4			# 0x4
	bne	$7,$2,$L293
	lui	$2,%hi($LC14)

	lwc1	$f0,%lo($LC14)($2)
	c.eq.s	$f20,$f0
	nop
	bc1t	$L309
	lui	$2,%hi(hud_buttons+16896)

	mtc1	$0,$f0
	nop
	c.eq.s	$f20,$f0
	nop
	bc1fl	$L303
	lui	$2,%hi(hud_buttons)

$L309:
	addiu	$2,$2,%lo(hud_buttons+16896)
	sw	$2,16($sp)
	li	$7,16			# 0x10
	li	$6,16			# 0x10
	move	$5,$17
	jal	KWSprite
	move	$4,$16

	b	$L307
	lw	$31,36($sp)

$L291:
	lui	$2,%hi($LC14)
	lwc1	$f0,%lo($LC14)($2)
	c.eq.s	$f20,$f0
	nop
	bc1t	$L310
	lui	$2,%hi(hud_buttons+15360)

	mtc1	$0,$f0
	nop
	c.eq.s	$f20,$f0
	nop
	bc1fl	$L296
	lui	$2,%hi(hud_buttons)

$L310:
	addiu	$2,$2,%lo(hud_buttons+15360)
	sw	$2,16($sp)
	li	$7,16			# 0x10
	li	$6,16			# 0x10
	move	$5,$17
	jal	KWSprite
	move	$4,$16

	lw	$31,36($sp)
$L307:
	lw	$17,32($sp)
	lw	$16,28($sp)
	ldc1	$f20,40($sp)
	jr	$31
	addiu	$sp,$sp,48

$L296:
	addiu	$2,$2,%lo(hud_buttons)
	sw	$2,16($sp)
	move	$7,$0
	move	$6,$0
	move	$5,$0
	jal	KWSprite
	move	$4,$0

	li	$2,16			# 0x10
	sw	$2,20($sp)
	sw	$2,16($sp)
	lui	$7,%hi(hud_buttons+15360)
	addiu	$7,$7,%lo(hud_buttons+15360)
	mfc1	$6,$f20
	move	$5,$17
	jal	KWSpriteScale
	move	$4,$16

	b	$L307
	lw	$31,36($sp)

$L299:
	addiu	$2,$2,%lo(hud_buttons)
	sw	$2,16($sp)
	move	$7,$0
	move	$6,$0
	move	$5,$0
	jal	KWSprite
	move	$4,$0

	li	$2,16			# 0x10
	sw	$2,20($sp)
	sw	$2,16($sp)
	lui	$7,%hi(hud_buttons+15872)
	addiu	$7,$7,%lo(hud_buttons+15872)
	mfc1	$6,$f20
	move	$5,$17
	jal	KWSpriteScale
	move	$4,$16

	b	$L307
	lw	$31,36($sp)

$L289:
	lui	$2,%hi($LC14)
	lwc1	$f0,%lo($LC14)($2)
	c.eq.s	$f20,$f0
	nop
	bc1t	$L311
	lui	$2,%hi(hud_buttons+16384)

	mtc1	$0,$f0
	nop
	c.eq.s	$f20,$f0
	nop
	bc1fl	$L301
	lui	$2,%hi(hud_buttons)

$L311:
	addiu	$2,$2,%lo(hud_buttons+16384)
	sw	$2,16($sp)
	li	$7,16			# 0x10
	li	$6,16			# 0x10
	move	$5,$17
	jal	KWSprite
	move	$4,$16

	b	$L307
	lw	$31,36($sp)

$L301:
	addiu	$2,$2,%lo(hud_buttons)
	sw	$2,16($sp)
	move	$7,$0
	move	$6,$0
	move	$5,$0
	jal	KWSprite
	move	$4,$0

	li	$2,16			# 0x10
	sw	$2,20($sp)
	sw	$2,16($sp)
	lui	$7,%hi(hud_buttons+16384)
	addiu	$7,$7,%lo(hud_buttons+16384)
	mfc1	$6,$f20
	move	$5,$17
	jal	KWSpriteScale
	move	$4,$16

	b	$L307
	lw	$31,36($sp)

$L303:
	addiu	$2,$2,%lo(hud_buttons)
	sw	$2,16($sp)
	move	$7,$0
	move	$6,$0
	move	$5,$0
	jal	KWSprite
	move	$4,$0

	li	$2,16			# 0x10
	sw	$2,20($sp)
	sw	$2,16($sp)
	lui	$7,%hi(hud_buttons+16896)
	addiu	$7,$7,%lo(hud_buttons+16896)
	mfc1	$6,$f20
	move	$5,$17
	jal	KWSpriteScale
	move	$4,$16

	b	$L307
	lw	$31,36($sp)

$L293:
	lui	$2,%hi($LC14)
	lwc1	$f0,%lo($LC14)($2)
	c.eq.s	$f20,$f0
	nop
	bc1t	$L312
	lui	$2,%hi(hud_buttons+14848)

	mtc1	$0,$f0
	nop
	c.eq.s	$f20,$f0
	nop
	bc1fl	$L305
	lui	$2,%hi(hud_buttons)

$L312:
	addiu	$2,$2,%lo(hud_buttons+14848)
	sw	$2,16($sp)
	li	$7,16			# 0x10
	li	$6,16			# 0x10
	move	$5,$17
	jal	KWSprite
	move	$4,$16

	b	$L307
	lw	$31,36($sp)

$L305:
	addiu	$2,$2,%lo(hud_buttons)
	sw	$2,16($sp)
	move	$7,$0
	move	$6,$0
	move	$5,$0
	jal	KWSprite
	move	$4,$0

	li	$2,16			# 0x10
	sw	$2,20($sp)
	sw	$2,16($sp)
	lui	$7,%hi(hud_buttons+14848)
	addiu	$7,$7,%lo(hud_buttons+14848)
	mfc1	$6,$f20
	move	$5,$17
	jal	KWSpriteScale
	move	$4,$16

	b	$L307
	lw	$31,36($sp)

	.set	macro
	.set	reorder
	.end	SpriteAnalogStick
	.size	SpriteAnalogStick, .-SpriteAnalogStick
	.align	2
	.globl	PrintNiceText
	.set	nomips16
	.set	nomicromips
	.ent	PrintNiceText
	.type	PrintNiceText, @function
PrintNiceText:
	.frame	$sp,88,$31		# vars= 0, regs= 10/6, args= 24, gp= 0
	.mask	0xc0ff0000,-28
	.fmask	0x03f00000,-8
	.set	noreorder
	.set	nomacro
	addiu	$sp,$sp,-88
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
	sdc1	$f24,80($sp)
	sdc1	$f22,72($sp)
	sdc1	$f20,64($sp)
	move	$23,$4
	move	$22,$5
	mtc1	$6,$f20
	move	$17,$7
	move	$18,$4
	move	$16,$7
	move	$19,$0
	lui	$fp,%hi($LC14)
	lwc1	$f22,%lo($LC14)($fp)
	lui	$20,%hi(nicefont)
	addiu	$20,$20,%lo(nicefont)
	b	$L314
	mov.s	$f24,$f22

$L327:
	lwc1	$f0,%lo($LC14)($fp)
	c.eq.s	$f20,$f0
	nop
	bc1t	$L330
	li	$3,16711680			# 0xff0000

	mtc1	$0,$f0
	nop
	c.eq.s	$f20,$f0
	nop
	bc1fl	$L318
	sw	$20,16($sp)

$L330:
	ori	$3,$3,0xffbf
	addu	$2,$2,$3
	sll	$2,$2,8
	addu	$2,$20,$2
	sw	$2,16($sp)
	li	$7,16			# 0x10
	li	$6,8			# 0x8
	move	$5,$22
	jal	KWSprite
	move	$4,$18

	b	$L329
	addiu	$18,$18,7

$L318:
	move	$7,$0
	move	$6,$0
	move	$5,$0
	jal	KWSprite
	move	$4,$0

	lb	$7,0($16)
	li	$2,16711680			# 0xff0000
	ori	$2,$2,0xffbf
	addu	$7,$7,$2
	sll	$7,$7,8
	mtc1	$19,$f0
	nop
	cvt.s.w	$f0,$f0
	mul.s	$f0,$f0,$f20
	mtc1	$23,$f2
	nop
	cvt.s.w	$f2,$f2
	add.s	$f0,$f0,$f2
	li	$2,16			# 0x10
	sw	$2,20($sp)
	li	$2,8			# 0x8
	sw	$2,16($sp)
	addu	$7,$20,$7
	mfc1	$6,$f20
	trunc.w.s $f0,$f0
	mfc1	$4,$f0
	jal	KWSpriteScale
	move	$5,$22

	b	$L329
	addiu	$18,$18,7

$L328:
	c.eq.s	$f20,$f24
	nop
	bc1t	$L331
	li	$3,16711680			# 0xff0000

	mtc1	$0,$f0
	nop
	c.eq.s	$f20,$f0
	nop
	bc1fl	$L321
	sw	$20,16($sp)

$L331:
	ori	$3,$3,0xffc5
	addu	$2,$2,$3
	sll	$2,$2,8
	addu	$2,$20,$2
	sw	$2,16($sp)
	li	$7,16			# 0x10
	li	$6,8			# 0x8
	move	$5,$22
	jal	KWSprite
	move	$4,$18

	b	$L329
	addiu	$18,$18,7

$L321:
	move	$7,$0
	move	$6,$0
	move	$5,$0
	jal	KWSprite
	move	$4,$0

	lb	$7,0($16)
	li	$2,16711680			# 0xff0000
	ori	$2,$2,0xffc5
	addu	$7,$7,$2
	sll	$7,$7,8
	mtc1	$19,$f0
	nop
	cvt.s.w	$f0,$f0
	mul.s	$f0,$f0,$f20
	mtc1	$23,$f2
	nop
	cvt.s.w	$f2,$f2
	add.s	$f0,$f0,$f2
	li	$2,16			# 0x10
	sw	$2,20($sp)
	li	$2,8			# 0x8
	sw	$2,16($sp)
	addu	$7,$20,$7
	mfc1	$6,$f20
	trunc.w.s $f0,$f0
	mfc1	$4,$f0
	jal	KWSpriteScale
	move	$5,$22

	b	$L329
	addiu	$18,$18,7

$L332:
	ori	$3,$3,0xffdf
$L333:
	addu	$2,$2,$3
	sll	$2,$2,8
	addu	$2,$20,$2
	sw	$2,16($sp)
	li	$7,16			# 0x10
	li	$6,8			# 0x8
	move	$5,$22
	jal	KWSprite
	move	$4,$18

$L315:
	addiu	$18,$18,7
$L329:
	addiu	$19,$19,8
	addiu	$16,$16,1
$L314:
	jal	ReturnStringLength
	move	$4,$17

	subu	$3,$16,$17
	slt	$2,$3,$2
	beq	$2,$0,$L326
	lw	$31,60($sp)

	lb	$2,0($16)
	slt	$3,$2,33
	bne	$3,$0,$L315
	addiu	$3,$2,-97

	andi	$3,$3,0x00ff
	sltu	$3,$3,26
	bne	$3,$0,$L327
	slt	$3,$2,123

	beq	$3,$0,$L328
	nop

	c.eq.s	$f20,$f22
	nop
	bc1t	$L332
	li	$3,16711680			# 0xff0000

	mtc1	$0,$f0
	nop
	c.eq.s	$f20,$f0
	nop
	bc1t	$L333
	ori	$3,$3,0xffdf

	sw	$20,16($sp)
	move	$7,$0
	move	$6,$0
	move	$5,$0
	jal	KWSprite
	move	$4,$0

	lb	$7,0($16)
	li	$2,16711680			# 0xff0000
	ori	$2,$2,0xffdf
	addu	$7,$7,$2
	sll	$7,$7,8
	mtc1	$19,$f0
	nop
	cvt.s.w	$f0,$f0
	mul.s	$f0,$f0,$f20
	mtc1	$23,$f2
	nop
	cvt.s.w	$f2,$f2
	add.s	$f0,$f0,$f2
	li	$2,16			# 0x10
	sw	$2,20($sp)
	li	$2,8			# 0x8
	sw	$2,16($sp)
	addu	$7,$20,$7
	mfc1	$6,$f20
	trunc.w.s $f0,$f0
	mfc1	$4,$f0
	jal	KWSpriteScale
	move	$5,$22

	b	$L329
	addiu	$18,$18,7

$L326:
	lw	$fp,56($sp)
	lw	$23,52($sp)
	lw	$22,48($sp)
	lw	$21,44($sp)
	lw	$20,40($sp)
	lw	$19,36($sp)
	lw	$18,32($sp)
	lw	$17,28($sp)
	lw	$16,24($sp)
	ldc1	$f24,80($sp)
	ldc1	$f22,72($sp)
	ldc1	$f20,64($sp)
	jr	$31
	addiu	$sp,$sp,88

	.set	macro
	.set	reorder
	.end	PrintNiceText
	.size	PrintNiceText, .-PrintNiceText
	.align	2
	.globl	PrintBigText
	.set	nomips16
	.set	nomicromips
	.ent	PrintBigText
	.type	PrintBigText, @function
PrintBigText:
	.frame	$sp,104,$31		# vars= 0, regs= 9/6, args= 40, gp= 0
	.mask	0x80ff0000,-28
	.fmask	0x03f00000,-8
	.set	noreorder
	.set	nomacro
	addiu	$sp,$sp,-104
	sw	$31,76($sp)
	sw	$23,72($sp)
	sw	$22,68($sp)
	sw	$21,64($sp)
	sw	$20,60($sp)
	sw	$19,56($sp)
	sw	$18,52($sp)
	sw	$17,48($sp)
	sw	$16,44($sp)
	sdc1	$f24,96($sp)
	sdc1	$f22,88($sp)
	sdc1	$f20,80($sp)
	move	$21,$4
	move	$20,$5
	mtc1	$6,$f20
	move	$17,$7
	move	$16,$0
	lui	$19,%hi(nicefont)
	addiu	$19,$19,%lo(nicefont)
	lui	$22,%hi(GlobalAddressA)
	lui	$23,%hi($LC15)
	lwc1	$f22,%lo($LC15)($23)
	lui	$18,%hi(V1632)
	addiu	$18,$18,%lo(V1632)
	b	$L335
	mov.s	$f24,$f22

$L342:
	li	$3,4128768			# 0x3f0000
	ori	$3,$3,0xffbf
	addu	$2,$2,$3
	sll	$2,$2,10
	addu	$2,$19,$2
	sw	$2,%lo(GlobalAddressA)($22)
	mtc1	$16,$f0
	nop
	cvt.s.w	$f0,$f0
	mul.s	$f0,$f0,$f20
	lwc1	$f2,%lo($LC15)($23)
	mul.s	$f0,$f0,$f2
	mtc1	$21,$f2
	nop
	cvt.s.w	$f2,$f2
	add.s	$f0,$f0,$f2
	li	$4,32			# 0x20
	sw	$4,36($sp)
	li	$3,16			# 0x10
	sw	$3,32($sp)
	sw	$4,28($sp)
	sw	$3,24($sp)
	sw	$18,20($sp)
	sw	$2,16($sp)
	mfc1	$7,$f20
	move	$6,$0
	trunc.w.s $f0,$f0
	mfc1	$4,$f0
	jal	KWTexture2DRGBA
	move	$5,$20

	b	$L344
	addiu	$16,$16,1

$L343:
	ori	$3,$3,0xffc5
	addu	$2,$2,$3
	sll	$2,$2,10
	addu	$2,$19,$2
	sw	$2,%lo(GlobalAddressA)($22)
	mtc1	$16,$f0
	nop
	cvt.s.w	$f0,$f0
	mul.s	$f0,$f0,$f20
	mul.s	$f0,$f0,$f24
	mtc1	$21,$f2
	nop
	cvt.s.w	$f2,$f2
	add.s	$f0,$f0,$f2
	li	$4,32			# 0x20
	sw	$4,36($sp)
	li	$3,16			# 0x10
	sw	$3,32($sp)
	sw	$4,28($sp)
	sw	$3,24($sp)
	sw	$18,20($sp)
	sw	$2,16($sp)
	mfc1	$7,$f20
	move	$6,$0
	trunc.w.s $f0,$f0
	mfc1	$4,$f0
	jal	KWTexture2DRGBA
	move	$5,$20

$L336:
	addiu	$16,$16,1
$L335:
$L344:
	jal	ReturnStringLength
	move	$4,$17

	slt	$2,$16,$2
	beq	$2,$0,$L341
	addu	$2,$17,$16

	lb	$2,0($2)
	slt	$3,$2,33
	bne	$3,$0,$L336
	addiu	$3,$2,-97

	andi	$3,$3,0x00ff
	sltu	$3,$3,26
	bne	$3,$0,$L342
	slt	$3,$2,123

	beq	$3,$0,$L343
	li	$3,4128768			# 0x3f0000

	ori	$3,$3,0xffdf
	addu	$2,$2,$3
	sll	$2,$2,10
	addu	$2,$19,$2
	sw	$2,%lo(GlobalAddressA)($22)
	mtc1	$16,$f0
	nop
	cvt.s.w	$f0,$f0
	mul.s	$f0,$f0,$f20
	mul.s	$f0,$f0,$f22
	mtc1	$21,$f2
	nop
	cvt.s.w	$f2,$f2
	add.s	$f0,$f0,$f2
	li	$4,32			# 0x20
	sw	$4,36($sp)
	li	$3,16			# 0x10
	sw	$3,32($sp)
	sw	$4,28($sp)
	sw	$3,24($sp)
	sw	$18,20($sp)
	sw	$2,16($sp)
	mfc1	$7,$f20
	move	$6,$0
	trunc.w.s $f0,$f0
	mfc1	$4,$f0
	jal	KWTexture2DRGBA
	move	$5,$20

	b	$L344
	addiu	$16,$16,1

$L341:
	lw	$31,76($sp)
	lw	$23,72($sp)
	lw	$22,68($sp)
	lw	$21,64($sp)
	lw	$20,60($sp)
	lw	$19,56($sp)
	lw	$18,52($sp)
	lw	$17,48($sp)
	lw	$16,44($sp)
	ldc1	$f24,96($sp)
	ldc1	$f22,88($sp)
	ldc1	$f20,80($sp)
	jr	$31
	addiu	$sp,$sp,104

	.set	macro
	.set	reorder
	.end	PrintBigText
	.size	PrintBigText, .-PrintBigText
	.section	.rodata.str1.4
	.align	2
$LC18:
	.ascii	"-\000"
	.text
	.align	2
	.globl	PrintBigTextNumber
	.set	nomips16
	.set	nomicromips
	.ent	PrintBigTextNumber
	.type	PrintBigTextNumber, @function
PrintBigTextNumber:
	.frame	$sp,160,$31		# vars= 88, regs= 7/6, args= 16, gp= 0
	.mask	0x803f0000,-28
	.fmask	0x03f00000,-8
	.set	noreorder
	.set	nomacro
	addiu	$sp,$sp,-160
	sw	$31,132($sp)
	sw	$21,128($sp)
	sw	$20,124($sp)
	sw	$19,120($sp)
	sw	$18,116($sp)
	sw	$17,112($sp)
	sw	$16,108($sp)
	sdc1	$f24,152($sp)
	sdc1	$f22,144($sp)
	sdc1	$f20,136($sp)
	move	$17,$4
	move	$18,$5
	mtc1	$6,$f20
	move	$19,$7
	jal	PrintBigText
	lw	$21,176($sp)

	bltz	$21,$L355
	move	$20,$0

$L346:
	li	$4,1717960704			# 0x66660000
	addiu	$4,$4,26215
	mult	$21,$4
	mfhi	$2
	sra	$2,$2,2
	sra	$3,$21,31
	subu	$5,$2,$3
	sll	$2,$5,2
	addu	$2,$2,$5
	sll	$2,$2,1
	subu	$2,$21,$2
	sw	$2,16($sp)
	li	$5,1374355456			# 0x51eb0000
	ori	$5,$5,0x851f
	mult	$21,$5
	mfhi	$2
	sra	$2,$2,5
	subu	$6,$2,$3
	sll	$2,$6,1
	addu	$2,$2,$6
	sll	$2,$2,3
	addu	$2,$2,$6
	sll	$2,$2,2
	subu	$2,$21,$2
	mult	$2,$4
	mfhi	$4
	sra	$4,$4,2
	sra	$2,$2,31
	subu	$2,$4,$2
	sw	$2,20($sp)
	li	$4,274857984			# 0x10620000
	addiu	$4,$4,19923
	mult	$21,$4
	mfhi	$2
	sra	$2,$2,6
	subu	$6,$2,$3
	sll	$2,$6,5
	subu	$2,$2,$6
	sll	$2,$2,2
	addu	$2,$2,$6
	sll	$2,$2,3
	subu	$2,$21,$2
	mult	$2,$5
	mfhi	$5
	sra	$5,$5,5
	sra	$2,$2,31
	subu	$2,$5,$2
	sw	$2,24($sp)
	li	$5,1759182848			# 0x68db0000
	ori	$5,$5,0x8bad
	mult	$21,$5
	mfhi	$2
	sra	$2,$2,12
	subu	$6,$2,$3
	sll	$2,$6,2
	addu	$2,$2,$6
	sll	$2,$2,3
	subu	$2,$2,$6
	sll	$2,$2,4
	addu	$2,$2,$6
	sll	$2,$2,4
	subu	$2,$21,$2
	mult	$2,$4
	mfhi	$4
	sra	$4,$4,6
	sra	$2,$2,31
	subu	$2,$4,$2
	sw	$2,28($sp)
	li	$4,351797248			# 0x14f80000
	ori	$4,$4,0xb589
	mult	$21,$4
	mfhi	$2
	sra	$2,$2,13
	subu	$6,$2,$3
	sll	$2,$6,1
	addu	$2,$2,$6
	sll	$7,$2,6
	addu	$2,$2,$7
	sll	$2,$2,2
	addu	$2,$2,$6
	sll	$2,$2,2
	addu	$2,$2,$6
	sll	$2,$2,5
	subu	$2,$21,$2
	mult	$2,$5
	mfhi	$5
	sra	$5,$5,12
	sra	$2,$2,31
	subu	$2,$5,$2
	sw	$2,32($sp)
	li	$5,1125842944			# 0x431b0000
	ori	$5,$5,0xde83
	mult	$21,$5
	mfhi	$2
	sra	$2,$2,18
	subu	$6,$2,$3
	sll	$2,$6,5
	subu	$7,$2,$6
	sll	$2,$7,6
	subu	$2,$2,$7
	sll	$2,$2,3
	addu	$2,$2,$6
	sll	$2,$2,6
	subu	$2,$21,$2
	mult	$2,$4
	mfhi	$4
	sra	$4,$4,13
	sra	$2,$2,31
	subu	$2,$4,$2
	sw	$2,36($sp)
	li	$4,1801388032			# 0x6b5f0000
	ori	$4,$4,0xca6b
	mult	$21,$4
	mfhi	$2
	sra	$2,$2,22
	subu	$6,$2,$3
	sll	$2,$6,5
	subu	$7,$2,$6
	sll	$2,$7,6
	subu	$2,$2,$7
	sll	$2,$2,3
	addu	$2,$2,$6
	sll	$6,$2,2
	addu	$2,$2,$6
	sll	$2,$2,7
	subu	$2,$21,$2
	mult	$2,$5
	mfhi	$5
	sra	$5,$5,18
	sra	$2,$2,31
	subu	$2,$5,$2
	sw	$2,40($sp)
	li	$2,1441136640			# 0x55e60000
	addiu	$2,$2,15241
	mult	$21,$2
	mfhi	$5
	sra	$5,$5,25
	subu	$5,$5,$3
	li	$6,99942400			# 0x5f50000
	ori	$6,$6,0xe100
	mult	$5,$6
	mflo	$5
	subu	$5,$21,$5
	nop
	mult	$5,$4
	mfhi	$4
	sra	$4,$4,22
	sra	$5,$5,31
	subu	$4,$4,$5
	sw	$4,44($sp)
	li	$4,1152909312			# 0x44b80000
	addiu	$4,$4,12193
	mult	$21,$4
	mfhi	$4
	sra	$4,$4,28
	subu	$3,$4,$3
	li	$4,999948288			# 0x3b9a0000
	ori	$4,$4,0xca00
	mult	$3,$4
	mflo	$3
	subu	$3,$21,$3
	nop
	mult	$3,$2
	mfhi	$2
	sra	$2,$2,25
	sra	$3,$3,31
	subu	$2,$2,$3
	sw	$2,48($sp)
	addiu	$16,$sp,52
	addiu	$6,$sp,102
	move	$2,$16
	li	$3,32			# 0x20
	sb	$3,0($2)
$L359:
	addiu	$2,$2,1
	bnel	$2,$6,$L359
	sb	$3,0($2)

	jal	numPlaces
	move	$4,$21

	li	$4,1073676288			# 0x3fff0000
	ori	$4,$4,0xffff
	addu	$4,$2,$4
	sll	$4,$4,2
	addiu	$3,$sp,16
	addu	$4,$3,$4
	b	$L348
	move	$3,$0

$L355:
	subu	$21,$0,$21
	b	$L346
	li	$20,1			# 0x1

$L349:
	addiu	$3,$3,1
$L360:
	addiu	$4,$4,-4
	addiu	$16,$16,1
$L348:
	slt	$5,$3,$2
	beq	$5,$0,$L356
	slt	$5,$3,10

	beql	$5,$0,$L360
	addiu	$3,$3,1

	lw	$5,0($4)
	addiu	$5,$5,48
	b	$L349
	sb	$5,0($16)

$L356:
	mtc1	$17,$f0
	nop
	cvt.s.w	$f24,$f0
	lui	$2,%hi($LC16)
	lwc1	$f0,%lo($LC16)($2)
	mul.s	$f0,$f20,$f0
	add.s	$f22,$f0,$f24
	jal	ReturnStringLength
	move	$4,$19

	sll	$3,$2,4
	subu	$3,$3,$2
	mtc1	$3,$f0
	nop
	cvt.s.w	$f0,$f0
	mul.s	$f0,$f0,$f20
	add.s	$f0,$f0,$f22
	addiu	$7,$sp,52
	mfc1	$6,$f20
	trunc.w.s $f0,$f0
	mfc1	$4,$f0
	jal	PrintBigText
	move	$5,$18

	bne	$20,$0,$L357
	lui	$2,%hi($LC17)

	lw	$31,132($sp)
$L358:
	lw	$21,128($sp)
	lw	$20,124($sp)
	lw	$19,120($sp)
	lw	$18,116($sp)
	lw	$17,112($sp)
	lw	$16,108($sp)
	ldc1	$f24,152($sp)
	ldc1	$f22,144($sp)
	ldc1	$f20,136($sp)
	jr	$31
	addiu	$sp,$sp,160

$L357:
	lwc1	$f22,%lo($LC17)($2)
	mul.s	$f22,$f20,$f22
	add.s	$f22,$f22,$f24
	jal	ReturnStringLength
	move	$4,$19

	sll	$3,$2,4
	subu	$3,$3,$2
	mtc1	$3,$f0
	nop
	cvt.s.w	$f24,$f0
	mul.s	$f24,$f24,$f20
	add.s	$f24,$f24,$f22
	lui	$7,%hi($LC18)
	addiu	$7,$7,%lo($LC18)
	mfc1	$6,$f20
	trunc.w.s $f0,$f24
	mfc1	$4,$f0
	jal	PrintBigText
	move	$5,$18

	b	$L358
	lw	$31,132($sp)

	.set	macro
	.set	reorder
	.end	PrintBigTextNumber
	.size	PrintBigTextNumber, .-PrintBigTextNumber
	.align	2
	.globl	PrintBigTextNumberNoGap
	.set	nomips16
	.set	nomicromips
	.ent	PrintBigTextNumberNoGap
	.type	PrintBigTextNumberNoGap, @function
PrintBigTextNumberNoGap:
	.frame	$sp,160,$31		# vars= 88, regs= 7/6, args= 16, gp= 0
	.mask	0x803f0000,-28
	.fmask	0x03f00000,-8
	.set	noreorder
	.set	nomacro
	addiu	$sp,$sp,-160
	sw	$31,132($sp)
	sw	$21,128($sp)
	sw	$20,124($sp)
	sw	$19,120($sp)
	sw	$18,116($sp)
	sw	$17,112($sp)
	sw	$16,108($sp)
	sdc1	$f24,152($sp)
	sdc1	$f22,144($sp)
	sdc1	$f20,136($sp)
	move	$17,$4
	move	$18,$5
	mtc1	$6,$f20
	move	$19,$7
	jal	PrintBigText
	lw	$21,176($sp)

	bltz	$21,$L371
	move	$20,$0

$L362:
	li	$4,1717960704			# 0x66660000
	addiu	$4,$4,26215
	mult	$21,$4
	mfhi	$2
	sra	$2,$2,2
	sra	$3,$21,31
	subu	$5,$2,$3
	sll	$2,$5,2
	addu	$2,$2,$5
	sll	$2,$2,1
	subu	$2,$21,$2
	sw	$2,16($sp)
	li	$5,1374355456			# 0x51eb0000
	ori	$5,$5,0x851f
	mult	$21,$5
	mfhi	$2
	sra	$2,$2,5
	subu	$6,$2,$3
	sll	$2,$6,1
	addu	$2,$2,$6
	sll	$2,$2,3
	addu	$2,$2,$6
	sll	$2,$2,2
	subu	$2,$21,$2
	mult	$2,$4
	mfhi	$4
	sra	$4,$4,2
	sra	$2,$2,31
	subu	$2,$4,$2
	sw	$2,20($sp)
	li	$4,274857984			# 0x10620000
	addiu	$4,$4,19923
	mult	$21,$4
	mfhi	$2
	sra	$2,$2,6
	subu	$6,$2,$3
	sll	$2,$6,5
	subu	$2,$2,$6
	sll	$2,$2,2
	addu	$2,$2,$6
	sll	$2,$2,3
	subu	$2,$21,$2
	mult	$2,$5
	mfhi	$5
	sra	$5,$5,5
	sra	$2,$2,31
	subu	$2,$5,$2
	sw	$2,24($sp)
	li	$5,1759182848			# 0x68db0000
	ori	$5,$5,0x8bad
	mult	$21,$5
	mfhi	$2
	sra	$2,$2,12
	subu	$6,$2,$3
	sll	$2,$6,2
	addu	$2,$2,$6
	sll	$2,$2,3
	subu	$2,$2,$6
	sll	$2,$2,4
	addu	$2,$2,$6
	sll	$2,$2,4
	subu	$2,$21,$2
	mult	$2,$4
	mfhi	$4
	sra	$4,$4,6
	sra	$2,$2,31
	subu	$2,$4,$2
	sw	$2,28($sp)
	li	$4,351797248			# 0x14f80000
	ori	$4,$4,0xb589
	mult	$21,$4
	mfhi	$2
	sra	$2,$2,13
	subu	$6,$2,$3
	sll	$2,$6,1
	addu	$2,$2,$6
	sll	$7,$2,6
	addu	$2,$2,$7
	sll	$2,$2,2
	addu	$2,$2,$6
	sll	$2,$2,2
	addu	$2,$2,$6
	sll	$2,$2,5
	subu	$2,$21,$2
	mult	$2,$5
	mfhi	$5
	sra	$5,$5,12
	sra	$2,$2,31
	subu	$2,$5,$2
	sw	$2,32($sp)
	li	$5,1125842944			# 0x431b0000
	ori	$5,$5,0xde83
	mult	$21,$5
	mfhi	$2
	sra	$2,$2,18
	subu	$6,$2,$3
	sll	$2,$6,5
	subu	$7,$2,$6
	sll	$2,$7,6
	subu	$2,$2,$7
	sll	$2,$2,3
	addu	$2,$2,$6
	sll	$2,$2,6
	subu	$2,$21,$2
	mult	$2,$4
	mfhi	$4
	sra	$4,$4,13
	sra	$2,$2,31
	subu	$2,$4,$2
	sw	$2,36($sp)
	li	$4,1801388032			# 0x6b5f0000
	ori	$4,$4,0xca6b
	mult	$21,$4
	mfhi	$2
	sra	$2,$2,22
	subu	$6,$2,$3
	sll	$2,$6,5
	subu	$7,$2,$6
	sll	$2,$7,6
	subu	$2,$2,$7
	sll	$2,$2,3
	addu	$2,$2,$6
	sll	$6,$2,2
	addu	$2,$2,$6
	sll	$2,$2,7
	subu	$2,$21,$2
	mult	$2,$5
	mfhi	$5
	sra	$5,$5,18
	sra	$2,$2,31
	subu	$2,$5,$2
	sw	$2,40($sp)
	li	$2,1441136640			# 0x55e60000
	addiu	$2,$2,15241
	mult	$21,$2
	mfhi	$5
	sra	$5,$5,25
	subu	$5,$5,$3
	li	$6,99942400			# 0x5f50000
	ori	$6,$6,0xe100
	mult	$5,$6
	mflo	$5
	subu	$5,$21,$5
	nop
	mult	$5,$4
	mfhi	$4
	sra	$4,$4,22
	sra	$5,$5,31
	subu	$4,$4,$5
	sw	$4,44($sp)
	li	$4,1152909312			# 0x44b80000
	addiu	$4,$4,12193
	mult	$21,$4
	mfhi	$4
	sra	$4,$4,28
	subu	$3,$4,$3
	li	$4,999948288			# 0x3b9a0000
	ori	$4,$4,0xca00
	mult	$3,$4
	mflo	$3
	subu	$3,$21,$3
	nop
	mult	$3,$2
	mfhi	$2
	sra	$2,$2,25
	sra	$3,$3,31
	subu	$2,$2,$3
	sw	$2,48($sp)
	addiu	$16,$sp,52
	addiu	$6,$sp,102
	move	$2,$16
	li	$3,32			# 0x20
	sb	$3,0($2)
$L375:
	addiu	$2,$2,1
	bnel	$2,$6,$L375
	sb	$3,0($2)

	jal	numPlaces
	move	$4,$21

	li	$4,1073676288			# 0x3fff0000
	ori	$4,$4,0xffff
	addu	$4,$2,$4
	sll	$4,$4,2
	addiu	$3,$sp,16
	addu	$4,$3,$4
	b	$L364
	move	$3,$0

$L371:
	subu	$21,$0,$21
	b	$L362
	li	$20,1			# 0x1

$L365:
	addiu	$3,$3,1
$L376:
	addiu	$4,$4,-4
	addiu	$16,$16,1
$L364:
	slt	$5,$3,$2
	beq	$5,$0,$L372
	slt	$5,$3,10

	beql	$5,$0,$L376
	addiu	$3,$3,1

	lw	$5,0($4)
	addiu	$5,$5,48
	b	$L365
	sb	$5,0($16)

$L372:
	mtc1	$17,$f0
	nop
	cvt.s.w	$f24,$f0
	lui	$2,%hi($LC16)
	lwc1	$f0,%lo($LC16)($2)
	mul.s	$f0,$f20,$f0
	add.s	$f22,$f0,$f24
	jal	ReturnStringLength
	move	$4,$19

	addiu	$3,$2,-1
	sll	$2,$3,4
	subu	$2,$2,$3
	mtc1	$2,$f0
	nop
	cvt.s.w	$f0,$f0
	mul.s	$f0,$f0,$f20
	add.s	$f0,$f0,$f22
	addiu	$7,$sp,52
	mfc1	$6,$f20
	trunc.w.s $f0,$f0
	mfc1	$4,$f0
	jal	PrintBigText
	move	$5,$18

	bne	$20,$0,$L373
	lui	$2,%hi($LC17)

	lw	$31,132($sp)
$L374:
	lw	$21,128($sp)
	lw	$20,124($sp)
	lw	$19,120($sp)
	lw	$18,116($sp)
	lw	$17,112($sp)
	lw	$16,108($sp)
	ldc1	$f24,152($sp)
	ldc1	$f22,144($sp)
	ldc1	$f20,136($sp)
	jr	$31
	addiu	$sp,$sp,160

$L373:
	lwc1	$f22,%lo($LC17)($2)
	mul.s	$f22,$f20,$f22
	add.s	$f22,$f22,$f24
	jal	ReturnStringLength
	move	$4,$19

	addiu	$3,$2,-1
	sll	$2,$3,4
	subu	$2,$2,$3
	mtc1	$2,$f0
	nop
	cvt.s.w	$f24,$f0
	mul.s	$f24,$f24,$f20
	add.s	$f24,$f24,$f22
	lui	$7,%hi($LC18)
	addiu	$7,$7,%lo($LC18)
	mfc1	$6,$f20
	trunc.w.s $f0,$f24
	mfc1	$4,$f0
	jal	PrintBigText
	move	$5,$18

	b	$L374
	lw	$31,132($sp)

	.set	macro
	.set	reorder
	.end	PrintBigTextNumberNoGap
	.size	PrintBigTextNumberNoGap, .-PrintBigTextNumberNoGap
	.section	.rodata.str1.4
	.align	2
$LC19:
	.ascii	"Original Set\000"
	.align	2
$LC21:
	.ascii	"Custom Set \000"
	.align	2
$LC22:
	.ascii	"Custom Set\000"
	.text
	.align	2
	.globl	DrawMapSelectDefault
	.set	nomips16
	.set	nomicromips
	.ent	DrawMapSelectDefault
	.type	DrawMapSelectDefault, @function
DrawMapSelectDefault:
	.frame	$sp,40,$31		# vars= 0, regs= 2/0, args= 32, gp= 0
	.mask	0x80010000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	addiu	$sp,$sp,-40
	sw	$31,36($sp)
	sw	$16,32($sp)
	li	$2,175			# 0xaf
	sw	$2,28($sp)
	sw	$0,24($sp)
	sw	$0,20($sp)
	sw	$0,16($sp)
	li	$7,25			# 0x19
	li	$6,190			# 0xbe
	li	$5,18			# 0x12
	jal	DrawBox
	li	$4,65			# 0x41

	lui	$2,%hi(HotSwapID)
	lh	$2,%lo(HotSwapID)($2)
	beq	$2,$0,$L382
	slt	$3,$2,10

	beq	$3,$0,$L380
	sw	$2,16($sp)

	lui	$7,%hi($LC21)
	addiu	$7,$7,%lo($LC21)
	lui	$2,%hi($LC20)
	lw	$6,%lo($LC20)($2)
	li	$5,16			# 0x10
	jal	PrintBigTextNumberNoGap
	li	$4,80			# 0x50

	lui	$2,%hi($LC14)
$L383:
	lw	$16,%lo($LC14)($2)
	move	$7,$0
	move	$6,$16
	li	$5,35			# 0x23
	jal	SpriteBtnCLeft
	li	$4,45			# 0x2d

	move	$7,$0
	move	$6,$16
	li	$5,35			# 0x23
	jal	SpriteBtnCRight
	li	$4,279			# 0x117

	lw	$31,36($sp)
	lw	$16,32($sp)
	jr	$31
	addiu	$sp,$sp,40

$L382:
	lui	$7,%hi($LC19)
	addiu	$7,$7,%lo($LC19)
	lui	$2,%hi($LC20)
	lw	$6,%lo($LC20)($2)
	li	$5,16			# 0x10
	jal	PrintBigText
	li	$4,80			# 0x50

	b	$L383
	lui	$2,%hi($LC14)

$L380:
	lui	$7,%hi($LC22)
	addiu	$7,$7,%lo($LC22)
	lui	$2,%hi($LC20)
	lw	$6,%lo($LC20)($2)
	li	$5,16			# 0x10
	jal	PrintBigTextNumberNoGap
	li	$4,80			# 0x50

	b	$L383
	lui	$2,%hi($LC14)

	.set	macro
	.set	reorder
	.end	DrawMapSelectDefault
	.size	DrawMapSelectDefault, .-DrawMapSelectDefault
	.align	2
	.globl	PrintNiceTextNumber
	.set	nomips16
	.set	nomicromips
	.ent	PrintNiceTextNumber
	.type	PrintNiceTextNumber, @function
PrintNiceTextNumber:
	.frame	$sp,160,$31		# vars= 88, regs= 7/6, args= 16, gp= 0
	.mask	0x803f0000,-28
	.fmask	0x03f00000,-8
	.set	noreorder
	.set	nomacro
	addiu	$sp,$sp,-160
	sw	$31,132($sp)
	sw	$21,128($sp)
	sw	$20,124($sp)
	sw	$19,120($sp)
	sw	$18,116($sp)
	sw	$17,112($sp)
	sw	$16,108($sp)
	sdc1	$f24,152($sp)
	sdc1	$f22,144($sp)
	sdc1	$f20,136($sp)
	move	$17,$4
	move	$18,$5
	mtc1	$6,$f20
	move	$19,$7
	jal	PrintNiceText
	lw	$21,176($sp)

	bltz	$21,$L394
	move	$20,$0

$L385:
	li	$4,1717960704			# 0x66660000
	addiu	$4,$4,26215
	mult	$21,$4
	mfhi	$2
	sra	$2,$2,2
	sra	$3,$21,31
	subu	$5,$2,$3
	sll	$2,$5,2
	addu	$2,$2,$5
	sll	$2,$2,1
	subu	$2,$21,$2
	sw	$2,16($sp)
	li	$5,1374355456			# 0x51eb0000
	ori	$5,$5,0x851f
	mult	$21,$5
	mfhi	$2
	sra	$2,$2,5
	subu	$6,$2,$3
	sll	$2,$6,1
	addu	$2,$2,$6
	sll	$2,$2,3
	addu	$2,$2,$6
	sll	$2,$2,2
	subu	$2,$21,$2
	mult	$2,$4
	mfhi	$4
	sra	$4,$4,2
	sra	$2,$2,31
	subu	$2,$4,$2
	sw	$2,20($sp)
	li	$4,274857984			# 0x10620000
	addiu	$4,$4,19923
	mult	$21,$4
	mfhi	$2
	sra	$2,$2,6
	subu	$6,$2,$3
	sll	$2,$6,5
	subu	$2,$2,$6
	sll	$2,$2,2
	addu	$2,$2,$6
	sll	$2,$2,3
	subu	$2,$21,$2
	mult	$2,$5
	mfhi	$5
	sra	$5,$5,5
	sra	$2,$2,31
	subu	$2,$5,$2
	sw	$2,24($sp)
	li	$5,1759182848			# 0x68db0000
	ori	$5,$5,0x8bad
	mult	$21,$5
	mfhi	$2
	sra	$2,$2,12
	subu	$6,$2,$3
	sll	$2,$6,2
	addu	$2,$2,$6
	sll	$2,$2,3
	subu	$2,$2,$6
	sll	$2,$2,4
	addu	$2,$2,$6
	sll	$2,$2,4
	subu	$2,$21,$2
	mult	$2,$4
	mfhi	$4
	sra	$4,$4,6
	sra	$2,$2,31
	subu	$2,$4,$2
	sw	$2,28($sp)
	li	$4,351797248			# 0x14f80000
	ori	$4,$4,0xb589
	mult	$21,$4
	mfhi	$2
	sra	$2,$2,13
	subu	$6,$2,$3
	sll	$2,$6,1
	addu	$2,$2,$6
	sll	$7,$2,6
	addu	$2,$2,$7
	sll	$2,$2,2
	addu	$2,$2,$6
	sll	$2,$2,2
	addu	$2,$2,$6
	sll	$2,$2,5
	subu	$2,$21,$2
	mult	$2,$5
	mfhi	$5
	sra	$5,$5,12
	sra	$2,$2,31
	subu	$2,$5,$2
	sw	$2,32($sp)
	li	$5,1125842944			# 0x431b0000
	ori	$5,$5,0xde83
	mult	$21,$5
	mfhi	$2
	sra	$2,$2,18
	subu	$6,$2,$3
	sll	$2,$6,5
	subu	$7,$2,$6
	sll	$2,$7,6
	subu	$2,$2,$7
	sll	$2,$2,3
	addu	$2,$2,$6
	sll	$2,$2,6
	subu	$2,$21,$2
	mult	$2,$4
	mfhi	$4
	sra	$4,$4,13
	sra	$2,$2,31
	subu	$2,$4,$2
	sw	$2,36($sp)
	li	$4,1801388032			# 0x6b5f0000
	ori	$4,$4,0xca6b
	mult	$21,$4
	mfhi	$2
	sra	$2,$2,22
	subu	$6,$2,$3
	sll	$2,$6,5
	subu	$7,$2,$6
	sll	$2,$7,6
	subu	$2,$2,$7
	sll	$2,$2,3
	addu	$2,$2,$6
	sll	$6,$2,2
	addu	$2,$2,$6
	sll	$2,$2,7
	subu	$2,$21,$2
	mult	$2,$5
	mfhi	$5
	sra	$5,$5,18
	sra	$2,$2,31
	subu	$2,$5,$2
	sw	$2,40($sp)
	li	$2,1441136640			# 0x55e60000
	addiu	$2,$2,15241
	mult	$21,$2
	mfhi	$5
	sra	$5,$5,25
	subu	$5,$5,$3
	li	$6,99942400			# 0x5f50000
	ori	$6,$6,0xe100
	mult	$5,$6
	mflo	$5
	subu	$5,$21,$5
	nop
	mult	$5,$4
	mfhi	$4
	sra	$4,$4,22
	sra	$5,$5,31
	subu	$4,$4,$5
	sw	$4,44($sp)
	li	$4,1152909312			# 0x44b80000
	addiu	$4,$4,12193
	mult	$21,$4
	mfhi	$4
	sra	$4,$4,28
	subu	$3,$4,$3
	li	$4,999948288			# 0x3b9a0000
	ori	$4,$4,0xca00
	mult	$3,$4
	mflo	$3
	subu	$3,$21,$3
	nop
	mult	$3,$2
	mfhi	$2
	sra	$2,$2,25
	sra	$3,$3,31
	subu	$2,$2,$3
	sw	$2,48($sp)
	addiu	$16,$sp,52
	addiu	$6,$sp,102
	move	$2,$16
	li	$3,32			# 0x20
	sb	$3,0($2)
$L398:
	addiu	$2,$2,1
	bnel	$2,$6,$L398
	sb	$3,0($2)

	jal	numPlaces
	move	$4,$21

	li	$4,1073676288			# 0x3fff0000
	ori	$4,$4,0xffff
	addu	$4,$2,$4
	sll	$4,$4,2
	addiu	$3,$sp,16
	addu	$4,$3,$4
	b	$L387
	move	$3,$0

$L394:
	subu	$21,$0,$21
	b	$L385
	li	$20,1			# 0x1

$L388:
	addiu	$3,$3,1
$L399:
	addiu	$4,$4,-4
	addiu	$16,$16,1
$L387:
	slt	$5,$3,$2
	beq	$5,$0,$L395
	slt	$5,$3,10

	beql	$5,$0,$L399
	addiu	$3,$3,1

	lw	$5,0($4)
	addiu	$5,$5,48
	b	$L388
	sb	$5,0($16)

$L395:
	mtc1	$17,$f0
	nop
	cvt.s.w	$f24,$f0
	lui	$2,%hi($LC23)
	lwc1	$f0,%lo($LC23)($2)
	mul.s	$f0,$f20,$f0
	add.s	$f22,$f0,$f24
	jal	ReturnStringLength
	move	$4,$19

	sll	$3,$2,3
	subu	$3,$3,$2
	mtc1	$3,$f0
	nop
	cvt.s.w	$f0,$f0
	mul.s	$f0,$f0,$f20
	add.s	$f0,$f0,$f22
	addiu	$7,$sp,52
	mfc1	$6,$f20
	trunc.w.s $f0,$f0
	mfc1	$4,$f0
	jal	PrintNiceText
	move	$5,$18

	bne	$20,$0,$L396
	lui	$2,%hi($LC24)

	lw	$31,132($sp)
$L397:
	lw	$21,128($sp)
	lw	$20,124($sp)
	lw	$19,120($sp)
	lw	$18,116($sp)
	lw	$17,112($sp)
	lw	$16,108($sp)
	ldc1	$f24,152($sp)
	ldc1	$f22,144($sp)
	ldc1	$f20,136($sp)
	jr	$31
	addiu	$sp,$sp,160

$L396:
	lwc1	$f22,%lo($LC24)($2)
	mul.s	$f22,$f20,$f22
	add.s	$f22,$f22,$f24
	jal	ReturnStringLength
	move	$4,$19

	sll	$3,$2,3
	subu	$3,$3,$2
	mtc1	$3,$f0
	nop
	cvt.s.w	$f24,$f0
	mul.s	$f24,$f24,$f20
	add.s	$f24,$f24,$f22
	lui	$7,%hi($LC18)
	addiu	$7,$7,%lo($LC18)
	mfc1	$6,$f20
	trunc.w.s $f0,$f24
	mfc1	$4,$f0
	jal	PrintNiceText
	move	$5,$18

	b	$L397
	lw	$31,132($sp)

	.set	macro
	.set	reorder
	.end	PrintNiceTextNumber
	.size	PrintNiceTextNumber, .-PrintNiceTextNumber
	.align	2
	.globl	DisplayCrashScreen
	.set	nomips16
	.set	nomicromips
	.ent	DisplayCrashScreen
	.type	DisplayCrashScreen, @function
DisplayCrashScreen:
	.frame	$sp,24,$31		# vars= 0, regs= 1/0, args= 16, gp= 0
	.mask	0x80000000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	addiu	$sp,$sp,-24
	sw	$31,20($sp)
	lui	$2,%hi(sourceAddress)
	lw	$4,%lo(sourceAddress)($2)
	lui	$2,%hi(Crash)
	addiu	$3,$2,%lo(Crash)
	sw	$3,0($4)
	lui	$2,%hi(targetAddress)
	lw	$2,%lo(targetAddress)($2)
	li	$4,-2146041856			# 0xffffffff80160000
	lw	$4,11612($4)
	sw	$4,0($2)
	lui	$2,%hi(CrashEnd)
	addiu	$2,$2,%lo(CrashEnd)
	subu	$2,$2,$3
	lui	$3,%hi(dataLength)
	jal	runDMA
	sw	$2,%lo(dataLength)($3)

	lw	$31,20($sp)
	jr	$31
	addiu	$sp,$sp,24

	.set	macro
	.set	reorder
	.end	DisplayCrashScreen
	.size	DisplayCrashScreen, .-DisplayCrashScreen
	.align	2
	.globl	drawButtonInputDisplay
	.set	nomips16
	.set	nomicromips
	.ent	drawButtonInputDisplay
	.type	drawButtonInputDisplay, @function
drawButtonInputDisplay:
	.frame	$sp,112,$31		# vars= 16, regs= 10/4, args= 40, gp= 0
	.mask	0xc0ff0000,-20
	.fmask	0x00f00000,-8
	.set	noreorder
	.set	nomacro
	addiu	$sp,$sp,-112
	sw	$31,92($sp)
	sw	$fp,88($sp)
	sw	$23,84($sp)
	sw	$22,80($sp)
	sw	$21,76($sp)
	sw	$20,72($sp)
	sw	$19,68($sp)
	sw	$18,64($sp)
	sw	$17,60($sp)
	sw	$16,56($sp)
	sdc1	$f22,104($sp)
	sdc1	$f20,96($sp)
	sw	$4,112($sp)
	lui	$2,%hi(g_startingIndicator)
	lw	$2,%lo(g_startingIndicator)($2)
	addiu	$2,$2,-3
	sltu	$2,$2,2
	beq	$2,$0,$L402
	lui	$2,%hi(g_playerCount)

	lw	$2,%lo(g_playerCount)($2)
	slt	$3,$2,3
	beq	$3,$0,$L402
	li	$3,2			# 0x2

	beql	$2,$3,$L435
	li	$2,30			# 0x1e

	blez	$2,$L402
	li	$2,55			# 0x37

	sw	$2,48($sp)
$L404:
	lui	$21,%hi(GlobalPlayer)
	addiu	$21,$21,%lo(GlobalPlayer)
	lui	$20,%hi(GlobalController)
	addiu	$20,$20,%lo(GlobalController)
	lui	$23,%hi(GlobalScreen)
	addiu	$23,$23,%lo(GlobalScreen)
	move	$22,$0
	lui	$fp,%hi(GraphPtr)
	lui	$19,%hi($LC25)
	lwc1	$f0,%lo($LC25)($19)
	swc1	$f0,52($sp)
	lui	$2,%hi($LC26)
	lwc1	$f22,%lo($LC26)($2)
	lui	$2,%hi($LC27)
	lwc1	$f20,%lo($LC27)($2)
	lui	$2,%hi(g_playerCount)
	b	$L434
	sw	$2,40($sp)

$L435:
	b	$L404
	sw	$2,48($sp)

$L439:
	li	$7,1			# 0x1
	lw	$6,%lo($LC25)($19)
	addiu	$5,$16,3
	jal	SpriteBtnA
	addiu	$4,$17,21

	b	$L440
	lw	$2,0($18)

$L408:
	lw	$6,%lo($LC25)($19)
	addiu	$5,$16,-3
	jal	SpriteBtnB
	addiu	$4,$17,15

	b	$L441
	lw	$2,0($18)

$L410:
	lw	$6,%lo($LC25)($19)
	addiu	$5,$16,5
	jal	SpriteBtnStart
	addiu	$4,$17,4

	b	$L442
	lw	$2,0($18)

$L412:
	lw	$6,%lo($LC25)($19)
	move	$5,$16
	jal	SpriteBtnCDown
	addiu	$4,$17,30

	b	$L443
	lw	$2,0($18)

$L414:
	lw	$6,%lo($LC25)($19)
	addiu	$5,$16,-5
	jal	SpriteBtnCLeft
	addiu	$4,$17,25

	b	$L444
	lw	$2,0($18)

$L416:
	lw	$6,%lo($LC25)($19)
	addiu	$5,$16,-5
	jal	SpriteBtnCRight
	addiu	$4,$17,35

	b	$L445
	lw	$2,0($18)

$L418:
	lw	$6,%lo($LC25)($19)
	addiu	$5,$16,-10
	jal	SpriteBtnCUp
	addiu	$4,$17,30

	b	$L446
	lw	$2,0($18)

$L420:
	lw	$6,%lo($LC25)($19)
	addiu	$5,$16,-17
	jal	SpriteBtnR
	addiu	$4,$17,35

	b	$L447
	lw	$2,0($18)

$L422:
	lw	$6,%lo($LC25)($19)
	addiu	$5,$16,-17
	jal	SpriteBtnZ
	addiu	$4,$17,17

	lw	$2,112($sp)
$L448:
	bne	$2,$0,$L438
	addiu	$2,$17,-10

	lw	$2,0($18)
$L449:
	lh	$5,2($2)
	mtc1	$5,$f0
	nop
	cvt.s.w	$f2,$f0
	mul.s	$f2,$f2,$f22
	addiu	$16,$16,-10
	mtc1	$16,$f0
	nop
	cvt.s.w	$f0,$f0
	add.s	$f0,$f2,$f0
	lh	$4,0($2)
	mtc1	$4,$f2
	nop
	cvt.s.w	$f4,$f2
	mul.s	$f4,$f4,$f20
	addiu	$17,$17,4
	mtc1	$17,$f2
	nop
	cvt.s.w	$f2,$f2
	add.s	$f2,$f4,$f2
	move	$7,$0
	trunc.w.s $f0,$f0
	mfc1	$5,$f0
	trunc.w.s $f0,$f2
	mfc1	$4,$f0
	jal	SpriteAnalogStick
	lw	$6,52($sp)

	addiu	$22,$22,1
$L454:
	addiu	$21,$21,3544
	addiu	$20,$20,4
	lw	$2,40($sp)
	lw	$2,%lo(g_playerCount)($2)
	slt	$2,$22,$2
	beq	$2,$0,$L402
	addiu	$23,$23,4

$L434:
	lhu	$2,0($21)
	andi	$2,$2,0x1000
	bnel	$2,$0,$L454
	addiu	$22,$22,1

	lw	$3,0($23)
	lhu	$17,48($3)
	addiu	$17,$17,85
	lh	$4,44($3)
	srl	$2,$4,31
	addu	$2,$2,$4
	sra	$2,$2,1
	subu	$17,$17,$2
	sll	$17,$17,16
	sra	$17,$17,16
	lhu	$16,50($3)
	lw	$2,48($sp)
	addu	$16,$2,$16
	lh	$3,46($3)
	srl	$2,$3,31
	addu	$2,$2,$3
	sra	$2,$2,1
	subu	$16,$16,$2
	sll	$16,$16,16
	sra	$16,$16,16
	li	$2,64			# 0x40
	sw	$2,32($sp)
	sw	$0,28($sp)
	sw	$0,24($sp)
	sw	$0,20($sp)
	addiu	$2,$16,10
	sw	$2,16($sp)
	addiu	$7,$17,40
	addiu	$6,$16,-22
	addiu	$5,$17,-20
	jal	FillRect1ColorF
	lw	$4,%lo(GraphPtr)($fp)

	sw	$2,%lo(GraphPtr)($fp)
	lw	$2,0($20)
	lh	$2,4($2)
	bltz	$2,$L439
	move	$18,$20

	move	$7,$0
	lw	$6,%lo($LC25)($19)
	addiu	$5,$16,3
	jal	SpriteBtnA
	addiu	$4,$17,21

	lw	$2,0($18)
$L440:
	lhu	$2,4($2)
	andi	$2,$2,0x4000
	beq	$2,$0,$L408
	move	$7,$0

	li	$7,1			# 0x1
	lw	$6,%lo($LC25)($19)
	addiu	$5,$16,-3
	jal	SpriteBtnB
	addiu	$4,$17,15

	lw	$2,0($18)
$L441:
	lhu	$2,4($2)
	andi	$2,$2,0x1000
	beq	$2,$0,$L410
	move	$7,$0

	li	$7,1			# 0x1
	lw	$6,%lo($LC25)($19)
	addiu	$5,$16,5
	jal	SpriteBtnStart
	addiu	$4,$17,4

	lw	$2,0($18)
$L442:
	lhu	$2,4($2)
	andi	$2,$2,0x4
	beq	$2,$0,$L412
	move	$7,$0

	li	$7,1			# 0x1
	lw	$6,%lo($LC25)($19)
	move	$5,$16
	jal	SpriteBtnCDown
	addiu	$4,$17,30

	lw	$2,0($18)
$L443:
	lhu	$2,4($2)
	andi	$2,$2,0x2
	beq	$2,$0,$L414
	move	$7,$0

	li	$7,1			# 0x1
	lw	$6,%lo($LC25)($19)
	addiu	$5,$16,-5
	jal	SpriteBtnCLeft
	addiu	$4,$17,25

	lw	$2,0($18)
$L444:
	lhu	$2,4($2)
	andi	$2,$2,0x1
	beq	$2,$0,$L416
	move	$7,$0

	li	$7,1			# 0x1
	lw	$6,%lo($LC25)($19)
	addiu	$5,$16,-5
	jal	SpriteBtnCRight
	addiu	$4,$17,35

	lw	$2,0($18)
$L445:
	lhu	$2,4($2)
	andi	$2,$2,0x8
	beq	$2,$0,$L418
	move	$7,$0

	li	$7,1			# 0x1
	lw	$6,%lo($LC25)($19)
	addiu	$5,$16,-10
	jal	SpriteBtnCUp
	addiu	$4,$17,30

	lw	$2,0($18)
$L446:
	lhu	$2,4($2)
	andi	$2,$2,0x10
	beq	$2,$0,$L420
	move	$7,$0

	li	$7,1			# 0x1
	lw	$6,%lo($LC25)($19)
	addiu	$5,$16,-17
	jal	SpriteBtnR
	addiu	$4,$17,35

	lw	$2,0($18)
$L447:
	lhu	$2,4($2)
	andi	$2,$2,0x2000
	beq	$2,$0,$L422
	move	$7,$0

	li	$7,1			# 0x1
	lw	$6,%lo($LC25)($19)
	addiu	$5,$16,-17
	jal	SpriteBtnZ
	addiu	$4,$17,17

	b	$L448
	lw	$2,112($sp)

$L438:
	lw	$6,%lo($LC25)($19)
	move	$5,$16
	sw	$2,44($sp)
	jal	SpriteBtnDMid
	move	$4,$2

	lw	$2,0($18)
	lhu	$2,4($2)
	andi	$2,$2,0x400
	beq	$2,$0,$L425
	move	$7,$0

	li	$7,1			# 0x1
	lw	$6,%lo($LC25)($19)
	addiu	$5,$16,7
	jal	SpriteBtnDDown
	lw	$4,44($sp)

	lw	$2,0($18)
$L450:
	lhu	$2,4($2)
	andi	$2,$2,0x800
	beq	$2,$0,$L427
	move	$7,$0

	li	$7,1			# 0x1
	lw	$6,%lo($LC25)($19)
	addiu	$5,$16,-7
	jal	SpriteBtnDUp
	lw	$4,44($sp)

	lw	$2,0($18)
$L451:
	lhu	$2,4($2)
	andi	$2,$2,0x200
	beq	$2,$0,$L429
	move	$7,$0

	li	$7,1			# 0x1
	lw	$6,%lo($LC25)($19)
	move	$5,$16
	jal	SpriteBtnDLeft
	addiu	$4,$17,-17

	lw	$2,0($18)
$L452:
	lhu	$2,4($2)
	andi	$2,$2,0x100
	beq	$2,$0,$L431
	move	$7,$0

	li	$7,1			# 0x1
	lw	$6,%lo($LC25)($19)
	move	$5,$16
	jal	SpriteBtnDRight
	addiu	$4,$17,-3

	lw	$2,0($18)
$L453:
	lhu	$2,4($2)
	andi	$2,$2,0x20
	beq	$2,$0,$L433
	move	$7,$0

	li	$7,1			# 0x1
	lw	$6,%lo($LC25)($19)
	addiu	$5,$16,-17
	jal	SpriteBtnL
	lw	$4,44($sp)

	b	$L449
	lw	$2,0($18)

$L425:
	lw	$6,%lo($LC25)($19)
	addiu	$5,$16,7
	jal	SpriteBtnDDown
	lw	$4,44($sp)

	b	$L450
	lw	$2,0($18)

$L427:
	lw	$6,%lo($LC25)($19)
	addiu	$5,$16,-7
	jal	SpriteBtnDUp
	lw	$4,44($sp)

	b	$L451
	lw	$2,0($18)

$L429:
	lw	$6,%lo($LC25)($19)
	move	$5,$16
	jal	SpriteBtnDLeft
	addiu	$4,$17,-17

	b	$L452
	lw	$2,0($18)

$L431:
	lw	$6,%lo($LC25)($19)
	move	$5,$16
	jal	SpriteBtnDRight
	addiu	$4,$17,-3

	b	$L453
	lw	$2,0($18)

$L433:
	lw	$6,%lo($LC25)($19)
	addiu	$5,$16,-17
	jal	SpriteBtnL
	lw	$4,44($sp)

	b	$L449
	lw	$2,0($18)

$L402:
	lw	$31,92($sp)
	lw	$fp,88($sp)
	lw	$23,84($sp)
	lw	$22,80($sp)
	lw	$21,76($sp)
	lw	$20,72($sp)
	lw	$19,68($sp)
	lw	$18,64($sp)
	lw	$17,60($sp)
	lw	$16,56($sp)
	ldc1	$f22,104($sp)
	ldc1	$f20,96($sp)
	jr	$31
	addiu	$sp,$sp,112

	.set	macro
	.set	reorder
	.end	drawButtonInputDisplay
	.size	drawButtonInputDisplay, .-drawButtonInputDisplay
	.section	.rodata.str1.4
	.align	2
$LC28:
	.ascii	"LAP\000"
	.align	2
$LC30:
	.ascii	"/\000"
	.text
	.align	2
	.globl	DrawLapCounter
	.set	nomips16
	.set	nomicromips
	.ent	DrawLapCounter
	.type	DrawLapCounter, @function
DrawLapCounter:
	.frame	$sp,40,$31		# vars= 0, regs= 4/0, args= 24, gp= 0
	.mask	0x80070000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	lui	$2,%hi(g_ScreenSplitA)
	lw	$2,%lo(g_ScreenSplitA)($2)
	beql	$2,$0,$L462
	lui	$2,%hi(AnchorPoint)

	jr	$31
	nop

$L462:
	addiu	$sp,$sp,-40
	sw	$31,36($sp)
	sw	$18,32($sp)
	sw	$17,28($sp)
	sw	$16,24($sp)
	addiu	$3,$2,%lo(AnchorPoint)
	lui	$7,%hi($LC28)
	addiu	$7,$7,%lo($LC28)
	lui	$4,%hi($LC29)
	lw	$6,%lo($LC29)($4)
	lh	$5,2($3)
	jal	PrintBigText
	lh	$4,%lo(AnchorPoint)($2)

	lui	$2,%hi(GlobalPlayer+8)
	lh	$2,%lo(GlobalPlayer+8)($2)
	slt	$3,$2,-1
	bne	$3,$0,$L457
	lui	$3,%hi($LC25)

	lw	$17,%lo($LC25)($3)
	lui	$16,%hi(AnchorPoint)
	addiu	$16,$16,%lo(AnchorPoint)
	addiu	$2,$2,1
	sw	$2,16($sp)
	lui	$18,%hi($LC3)
	addiu	$7,$18,%lo($LC3)
	move	$6,$17
	lh	$5,6($16)
	jal	PrintBigTextNumber
	lh	$4,4($16)

	lh	$4,4($16)
	lui	$7,%hi($LC30)
	addiu	$7,$7,%lo($LC30)
	move	$6,$17
	lh	$5,6($16)
	jal	PrintBigText
	addiu	$4,$4,24

	lh	$4,4($16)
	li	$2,3			# 0x3
	sw	$2,16($sp)
	addiu	$7,$18,%lo($LC3)
	move	$6,$17
	lh	$5,6($16)
	jal	PrintBigTextNumber
	addiu	$4,$4,16

	lw	$31,36($sp)
$L463:
	lw	$18,32($sp)
	lw	$17,28($sp)
	lw	$16,24($sp)
	jr	$31
	addiu	$sp,$sp,40

$L457:
	lw	$17,%lo($LC25)($3)
	lui	$16,%hi(AnchorPoint)
	addiu	$16,$16,%lo(AnchorPoint)
	lh	$4,4($16)
	addiu	$2,$2,1
	sw	$2,16($sp)
	lui	$18,%hi($LC3)
	addiu	$7,$18,%lo($LC3)
	move	$6,$17
	lh	$5,6($16)
	jal	PrintBigTextNumber
	addiu	$4,$4,8

	lh	$4,4($16)
	lui	$7,%hi($LC30)
	addiu	$7,$7,%lo($LC30)
	move	$6,$17
	lh	$5,6($16)
	jal	PrintBigText
	addiu	$4,$4,32

	lh	$4,4($16)
	li	$2,3			# 0x3
	sw	$2,16($sp)
	addiu	$7,$18,%lo($LC3)
	move	$6,$17
	lh	$5,6($16)
	jal	PrintBigTextNumber
	addiu	$4,$4,24

	b	$L463
	lw	$31,36($sp)

	.set	macro
	.set	reorder
	.end	DrawLapCounter
	.size	DrawLapCounter, .-DrawLapCounter
	.globl	AnchorPoint
	.data
	.align	2
	.type	AnchorPoint, @object
	.size	AnchorPoint, 40
AnchorPoint:
	.half	85
	.half	23
	.half	95
	.half	20
	.half	120
	.half	90
	.half	130
	.half	85
	.half	180
	.half	210
	.half	190
	.half	205
	.half	120
	.half	90
	.half	130
	.half	85
	.half	180
	.half	210
	.half	190
	.half	205
	.section	.rodata.cst4,"aM",@progbits,4
	.align	2
$LC0:
	.word	1120403456
	.align	2
$LC10:
	.word	1148846080
	.section	.rodata.cst8,"aM",@progbits,8
	.align	3
$LC13:
	.word	1106247680
	.word	0
	.section	.rodata.cst4
	.align	2
$LC14:
	.word	1065353216
	.align	2
$LC15:
	.word	1098907648
	.align	2
$LC16:
	.word	1107296256
	.align	2
$LC17:
	.word	1097859072
	.align	2
$LC20:
	.word	1063675494
	.align	2
$LC23:
	.word	1096810496
	.align	2
$LC24:
	.word	1088421888
	.align	2
$LC25:
	.word	1056964608
	.align	2
$LC26:
	.word	-1119040307
	.align	2
$LC27:
	.word	1028443341
	.align	2
$LC29:
	.word	1052770304
	.ident	"GCC: (GNU) 10.1.0"
