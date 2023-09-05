	.file	1 "SharedFunctions.c"
	.section .mdebug.abi32
	.previous
	.nan	legacy
	.module	fp=32
	.module	nooddspreg
	.text
	.align	2
	.globl	gameCodeDefault
	.set	nomips16
	.set	nomicromips
	.ent	gameCodeDefault
	.type	gameCodeDefault, @function
gameCodeDefault:
	.frame	$sp,0,$31		# vars= 0, regs= 0/0, args= 0, gp= 0
	.mask	0x00000000,0
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	jr	$31
	nop

	.set	macro
	.set	reorder
	.end	gameCodeDefault
	.size	gameCodeDefault, .-gameCodeDefault
	.align	2
	.globl	CollideObjectDefault
	.set	nomips16
	.set	nomicromips
	.ent	CollideObjectDefault
	.type	CollideObjectDefault, @function
CollideObjectDefault:
	.frame	$sp,0,$31		# vars= 0, regs= 0/0, args= 0, gp= 0
	.mask	0x00000000,0
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	jr	$31
	move	$2,$0

	.set	macro
	.set	reorder
	.end	CollideObjectDefault
	.size	CollideObjectDefault, .-CollideObjectDefault
	.align	2
	.globl	DrawPerScreenDefault
	.set	nomips16
	.set	nomicromips
	.ent	DrawPerScreenDefault
	.type	DrawPerScreenDefault, @function
DrawPerScreenDefault:
	.frame	$sp,24,$31		# vars= 0, regs= 2/0, args= 16, gp= 0
	.mask	0x80010000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	addiu	$sp,$sp,-24
	sw	$31,20($sp)
	sw	$16,16($sp)
	lui	$2,%hi(scrollLock)
	lbu	$2,%lo(scrollLock)($2)
	beq	$2,$0,$L4
	move	$16,$4

	lui	$2,%hi(HotSwapID)
	lh	$2,%lo(HotSwapID)($2)
	bgtz	$2,$L9
	nop

$L5:
	bne	$2,$0,$L10
	lw	$31,20($sp)

$L6:
	jal	DisplayFlagGate
	move	$4,$16

	lw	$31,20($sp)
$L10:
	lw	$16,16($sp)
$L11:
	jr	$31
	addiu	$sp,$sp,24

$L9:
	jal	DrawOKObjects
	nop

$L4:
	lui	$2,%hi(HotSwapID)
	lh	$2,%lo(HotSwapID)($2)
	blez	$2,$L5
	nop

	lui	$2,%hi(OverKartHeader+120)
	lb	$2,%lo(OverKartHeader+120)($2)
	bne	$2,$0,$L6
	lw	$31,20($sp)

	b	$L11
	lw	$16,16($sp)

	.set	macro
	.set	reorder
	.end	DrawPerScreenDefault
	.size	DrawPerScreenDefault, .-DrawPerScreenDefault
	.align	2
	.globl	allRunDefault
	.set	nomips16
	.set	nomicromips
	.ent	allRunDefault
	.type	allRunDefault, @function
allRunDefault:
	.frame	$sp,0,$31		# vars= 0, regs= 0/0, args= 0, gp= 0
	.mask	0x00000000,0
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	lui	$2,%hi(gBackgroundFlag)
	li	$3,1			# 0x1
	jr	$31
	sh	$3,%lo(gBackgroundFlag)($2)

	.set	macro
	.set	reorder
	.end	allRunDefault
	.size	allRunDefault, .-allRunDefault
	.align	2
	.globl	ExecuteItemHookDefault
	.set	nomips16
	.set	nomicromips
	.ent	ExecuteItemHookDefault
	.type	ExecuteItemHookDefault, @function
ExecuteItemHookDefault:
	.frame	$sp,24,$31		# vars= 0, regs= 1/0, args= 16, gp= 0
	.mask	0x80000000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	addiu	$sp,$sp,-24
	sw	$31,20($sp)
	jal	ExecuteItem
	nop

	lw	$31,20($sp)
	jr	$31
	addiu	$sp,$sp,24

	.set	macro
	.set	reorder
	.end	ExecuteItemHookDefault
	.size	ExecuteItemHookDefault, .-ExecuteItemHookDefault
	.align	2
	.globl	runDMA
	.set	nomips16
	.set	nomicromips
	.ent	runDMA
	.type	runDMA, @function
runDMA:
	.frame	$sp,24,$31		# vars= 0, regs= 1/0, args= 16, gp= 0
	.mask	0x80000000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	addiu	$sp,$sp,-24
	sw	$31,20($sp)
	lui	$2,%hi(sourceAddress)
	lw	$3,%lo(sourceAddress)($2)
	lui	$2,%hi(targetAddress)
	lw	$2,%lo(targetAddress)($2)
	lui	$4,%hi(dataLength)
	lw	$6,%lo(dataLength)($4)
	lw	$5,0($3)
	jal	DMA
	lw	$4,0($2)

	lw	$31,20($sp)
	jr	$31
	addiu	$sp,$sp,24

	.set	macro
	.set	reorder
	.end	runDMA
	.size	runDMA, .-runDMA
	.align	2
	.globl	runRAM
	.set	nomips16
	.set	nomicromips
	.ent	runRAM
	.type	runRAM, @function
runRAM:
	.frame	$sp,24,$31		# vars= 0, regs= 1/0, args= 16, gp= 0
	.mask	0x80000000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	addiu	$sp,$sp,-24
	sw	$31,20($sp)
	lui	$2,%hi(sourceAddress)
	lw	$3,%lo(sourceAddress)($2)
	lui	$2,%hi(targetAddress)
	lw	$2,%lo(targetAddress)($2)
	lui	$4,%hi(dataLength)
	lw	$6,%lo(dataLength)($4)
	lw	$5,0($3)
	jal	ramCopy
	lw	$4,0($2)

	lw	$31,20($sp)
	jr	$31
	addiu	$sp,$sp,24

	.set	macro
	.set	reorder
	.end	runRAM
	.size	runRAM, .-runRAM
	.align	2
	.globl	runMIO
	.set	nomips16
	.set	nomicromips
	.ent	runMIO
	.type	runMIO, @function
runMIO:
	.frame	$sp,24,$31		# vars= 0, regs= 1/0, args= 16, gp= 0
	.mask	0x80000000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	addiu	$sp,$sp,-24
	sw	$31,20($sp)
	lui	$2,%hi(targetAddress)
	lw	$3,%lo(targetAddress)($2)
	lui	$2,%hi(sourceAddress)
	lw	$2,%lo(sourceAddress)($2)
	lw	$5,0($3)
	jal	decodeMIO0
	lw	$4,0($2)

	lw	$31,20($sp)
	jr	$31
	addiu	$sp,$sp,24

	.set	macro
	.set	reorder
	.end	runMIO
	.size	runMIO, .-runMIO
	.align	2
	.globl	runTKM
	.set	nomips16
	.set	nomicromips
	.ent	runTKM
	.type	runTKM, @function
runTKM:
	.frame	$sp,24,$31		# vars= 0, regs= 1/0, args= 16, gp= 0
	.mask	0x80000000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	addiu	$sp,$sp,-24
	sw	$31,20($sp)
	lui	$2,%hi(targetAddress)
	lw	$3,%lo(targetAddress)($2)
	lui	$2,%hi(sourceAddress)
	lw	$2,%lo(sourceAddress)($2)
	li	$7,190			# 0xbe
	lw	$6,0($3)
	lui	$3,%hi(tkmPoint)
	lw	$5,%lo(tkmPoint)($3)
	jal	decodeTKMK
	lw	$4,0($2)

	lw	$31,20($sp)
	jr	$31
	addiu	$sp,$sp,24

	.set	macro
	.set	reorder
	.end	runTKM
	.size	runTKM, .-runTKM
	.align	2
	.globl	loadEEPROM
	.set	nomips16
	.set	nomicromips
	.ent	loadEEPROM
	.type	loadEEPROM, @function
loadEEPROM:
	.frame	$sp,24,$31		# vars= 0, regs= 1/0, args= 16, gp= 0
	.mask	0x80000000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	addiu	$sp,$sp,-24
	sw	$31,20($sp)
	li	$7,512			# 0x200
	move	$6,$4
	move	$5,$0
	li	$4,-2146172928			# 0xffffffff80140000
	jal	osEepromLongRead
	ori	$4,$4,0xf0b8

	lw	$31,20($sp)
	jr	$31
	addiu	$sp,$sp,24

	.set	macro
	.set	reorder
	.end	loadEEPROM
	.size	loadEEPROM, .-loadEEPROM
	.align	2
	.globl	saveEEPROM
	.set	nomips16
	.set	nomicromips
	.ent	saveEEPROM
	.type	saveEEPROM, @function
saveEEPROM:
	.frame	$sp,24,$31		# vars= 0, regs= 1/0, args= 16, gp= 0
	.mask	0x80000000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	addiu	$sp,$sp,-24
	sw	$31,20($sp)
	li	$7,512			# 0x200
	move	$6,$4
	move	$5,$0
	li	$4,-2146172928			# 0xffffffff80140000
	jal	osEepromLongWrite
	ori	$4,$4,0xf0b8

	lw	$31,20($sp)
	jr	$31
	addiu	$sp,$sp,24

	.set	macro
	.set	reorder
	.end	saveEEPROM
	.size	saveEEPROM, .-saveEEPROM
	.align	2
	.globl	GetRGBA16
	.set	nomips16
	.set	nomicromips
	.ent	GetRGBA16
	.type	GetRGBA16, @function
GetRGBA16:
	.frame	$sp,0,$31		# vars= 0, regs= 0/0, args= 0, gp= 0
	.mask	0x00000000,0
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	sll	$6,$6,1
	andi	$6,$6,0x3e
	andi	$7,$7,0x1
	or	$6,$6,$7
	sll	$4,$4,11
	or	$6,$6,$4
	sll	$5,$5,6
	andi	$5,$5,0x7c0
	or	$6,$6,$5
	jr	$31
	andi	$2,$6,0xffff

	.set	macro
	.set	reorder
	.end	GetRGBA16
	.size	GetRGBA16, .-GetRGBA16
	.align	2
	.globl	GetRGB32
	.set	nomips16
	.set	nomicromips
	.ent	GetRGB32
	.type	GetRGB32, @function
GetRGB32:
	.frame	$sp,0,$31		# vars= 0, regs= 0/0, args= 0, gp= 0
	.mask	0x00000000,0
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	sll	$5,$5,8
	or	$5,$5,$6
	sll	$2,$4,16
	jr	$31
	or	$2,$5,$2

	.set	macro
	.set	reorder
	.end	GetRGB32
	.size	GetRGB32, .-GetRGB32
	.align	2
	.globl	SetFontColor
	.set	nomips16
	.set	nomicromips
	.ent	SetFontColor
	.type	SetFontColor, @function
SetFontColor:
	.frame	$sp,32,$31		# vars= 0, regs= 3/0, args= 16, gp= 0
	.mask	0x80030000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	addiu	$sp,$sp,-32
	sw	$31,28($sp)
	sw	$17,24($sp)
	sw	$16,20($sp)
	move	$17,$7
	lui	$16,%hi(g_DebugTextPalette)
	sh	$0,%lo(g_DebugTextPalette)($16)
	jal	GetRGBA16
	li	$7,1			# 0x1

	addiu	$16,$16,%lo(g_DebugTextPalette)
	sh	$2,2($16)
	li	$7,1			# 0x1
	lw	$6,52($sp)
	lw	$5,48($sp)
	jal	GetRGBA16
	move	$4,$17

	sh	$2,4($16)
	li	$2,1			# 0x1
	sh	$2,6($16)
	lw	$31,28($sp)
	lw	$17,24($sp)
	lw	$16,20($sp)
	jr	$31
	addiu	$sp,$sp,32

	.set	macro
	.set	reorder
	.end	SetFontColor
	.size	SetFontColor, .-SetFontColor
	.align	2
	.globl	SetFontColorPalette
	.set	nomips16
	.set	nomicromips
	.ent	SetFontColorPalette
	.type	SetFontColorPalette, @function
SetFontColorPalette:
	.frame	$sp,24,$31		# vars= 0, regs= 2/0, args= 16, gp= 0
	.mask	0x80010000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	addiu	$sp,$sp,-24
	sw	$31,20($sp)
	sw	$16,16($sp)
	move	$16,$4
	move	$4,$5
	move	$5,$6
	move	$6,$7
	sh	$0,0($16)
	jal	GetRGBA16
	li	$7,1			# 0x1

	sh	$2,2($16)
	li	$7,1			# 0x1
	lw	$6,48($sp)
	lw	$5,44($sp)
	jal	GetRGBA16
	lw	$4,40($sp)

	sh	$2,4($16)
	li	$2,1			# 0x1
	sh	$2,6($16)
	lw	$31,20($sp)
	lw	$16,16($sp)
	jr	$31
	addiu	$sp,$sp,24

	.set	macro
	.set	reorder
	.end	SetFontColorPalette
	.size	SetFontColorPalette, .-SetFontColorPalette
	.align	2
	.globl	LoadFontF3D
	.set	nomips16
	.set	nomicromips
	.ent	LoadFontF3D
	.type	LoadFontF3D, @function
LoadFontF3D:
	.frame	$sp,0,$31		# vars= 0, regs= 0/0, args= 0, gp= 0
	.mask	0x00000000,0
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	lui	$2,%hi(GraphPtrOffset)
	lw	$3,%lo(GraphPtrOffset)($2)
	addiu	$5,$3,8
	sw	$5,%lo(GraphPtrOffset)($2)
	li	$6,100663296			# 0x6000000
	sw	$6,0($3)
	li	$5,218103808			# 0xd000000
	ori	$5,$5,0x8108
	sw	$5,4($3)
	lw	$3,%lo(GraphPtrOffset)($2)
	addiu	$5,$3,8
	sw	$5,%lo(GraphPtrOffset)($2)
	sw	$6,0($3)
	sw	$4,4($3)
	lw	$3,%lo(GraphPtrOffset)($2)
	addiu	$4,$3,8
	sw	$4,%lo(GraphPtrOffset)($2)
	li	$2,-1191182336			# 0xffffffffb9000000
	addiu	$2,$2,2
	sw	$2,0($3)
	li	$2,1			# 0x1
	jr	$31
	sw	$2,4($3)

	.set	macro
	.set	reorder
	.end	LoadFontF3D
	.size	LoadFontF3D, .-LoadFontF3D
	.align	2
	.globl	LoadOKData
	.set	nomips16
	.set	nomicromips
	.ent	LoadOKData
	.type	LoadOKData, @function
LoadOKData:
	.frame	$sp,24,$31		# vars= 0, regs= 2/0, args= 16, gp= 0
	.mask	0x80010000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	addiu	$sp,$sp,-24
	sw	$31,20($sp)
	sw	$16,16($sp)
	lui	$2,%hi(sourceAddress)
	lw	$2,%lo(sourceAddress)($2)
	sw	$4,0($2)
	lui	$16,%hi(targetAddress)
	lw	$2,%lo(targetAddress)($16)
	lui	$3,%hi(FreeSpaceAddress)
	lw	$4,%lo(FreeSpaceAddress)($3)
	sw	$4,0($2)
	lui	$2,%hi(dataLength)
	sw	$5,%lo(dataLength)($2)
	andi	$4,$5,0xf
	li	$2,16			# 0x10
	subu	$2,$2,$4
	lui	$4,%hi(GlobalShortA)
	sh	$2,%lo(GlobalShortA)($4)
	lw	$4,%lo(FreeSpaceAddress)($3)
	addu	$5,$5,$4
	addu	$5,$5,$2
	jal	runDMA
	sw	$5,%lo(FreeSpaceAddress)($3)

	lw	$2,%lo(targetAddress)($16)
	lw	$2,0($2)
	lw	$31,20($sp)
	lw	$16,16($sp)
	jr	$31
	addiu	$sp,$sp,24

	.set	macro
	.set	reorder
	.end	LoadOKData
	.size	LoadOKData, .-LoadOKData
	.align	2
	.globl	LoadDataBypass
	.set	nomips16
	.set	nomicromips
	.ent	LoadDataBypass
	.type	LoadDataBypass, @function
LoadDataBypass:
	.frame	$sp,24,$31		# vars= 0, regs= 2/0, args= 16, gp= 0
	.mask	0x80010000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	addiu	$sp,$sp,-24
	sw	$31,20($sp)
	sw	$16,16($sp)
	lui	$2,%hi(sourceAddress)
	lw	$2,%lo(sourceAddress)($2)
	sw	$4,0($2)
	subu	$3,$5,$4
	lui	$2,%hi(dataLength)
	sw	$3,%lo(dataLength)($2)
	lui	$16,%hi(LastMemoryPointer)
	subu	$4,$4,$5
	lw	$5,%lo(LastMemoryPointer)($16)
	addu	$4,$4,$5
	sw	$4,%lo(LastMemoryPointer)($16)
	lui	$2,%hi(targetAddress)
	lw	$2,%lo(targetAddress)($2)
	jal	runDMA
	sw	$4,0($2)

	lw	$2,%lo(LastMemoryPointer)($16)
	lw	$31,20($sp)
	lw	$16,16($sp)
	jr	$31
	addiu	$sp,$sp,24

	.set	macro
	.set	reorder
	.end	LoadDataBypass
	.size	LoadDataBypass, .-LoadDataBypass
	.align	2
	.globl	LoadPressDataBypass
	.set	nomips16
	.set	nomicromips
	.ent	LoadPressDataBypass
	.type	LoadPressDataBypass, @function
LoadPressDataBypass:
	.frame	$sp,40,$31		# vars= 0, regs= 6/0, args= 16, gp= 0
	.mask	0x801f0000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	addiu	$sp,$sp,-40
	sw	$31,36($sp)
	sw	$20,32($sp)
	sw	$19,28($sp)
	sw	$18,24($sp)
	sw	$17,20($sp)
	sw	$16,16($sp)
	lui	$19,%hi(sourceAddress)
	lw	$2,%lo(sourceAddress)($19)
	sw	$4,0($2)
	lui	$18,%hi(dataLength)
	subu	$2,$5,$4
	sw	$2,%lo(dataLength)($18)
	lui	$16,%hi(LastMemoryPointer)
	subu	$4,$4,$5
	lw	$5,%lo(LastMemoryPointer)($16)
	addu	$4,$5,$4
	sw	$4,%lo(LastMemoryPointer)($16)
	lui	$17,%hi(targetAddress)
	lw	$2,%lo(targetAddress)($17)
	lui	$20,%hi(FreeMemoryPointer)
	lw	$3,%lo(FreeMemoryPointer)($20)
	jal	runDMA
	sw	$3,0($2)

	lw	$2,%lo(targetAddress)($17)
	lw	$2,0($2)
	lw	$2,4($2)
	sw	$2,%lo(dataLength)($18)
	lw	$2,%lo(sourceAddress)($19)
	lw	$3,%lo(FreeMemoryPointer)($20)
	sw	$3,0($2)
	lw	$2,%lo(LastMemoryPointer)($16)
	lw	$3,%lo(dataLength)($18)
	subu	$2,$2,$3
	sw	$2,%lo(LastMemoryPointer)($16)
	lw	$3,%lo(targetAddress)($17)
	jal	runMIO
	sw	$2,0($3)

	lw	$2,%lo(LastMemoryPointer)($16)
	lw	$31,36($sp)
	lw	$20,32($sp)
	lw	$19,28($sp)
	lw	$18,24($sp)
	lw	$17,20($sp)
	lw	$16,16($sp)
	jr	$31
	addiu	$sp,$sp,40

	.set	macro
	.set	reorder
	.end	LoadPressDataBypass
	.size	LoadPressDataBypass, .-LoadPressDataBypass
	.align	2
	.globl	getStarTimer
	.set	nomips16
	.set	nomicromips
	.ent	getStarTimer
	.type	getStarTimer, @function
getStarTimer:
	.frame	$sp,0,$31		# vars= 0, regs= 0/0, args= 0, gp= 0
	.mask	0x00000000,0
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	lui	$2,%hi(g_gameTimer)
	lwc1	$f0,%lo(g_gameTimer)($2)
	trunc.w.s $f0,$f0
	mfc1	$2,$f0
	sll	$4,$4,2
	lui	$3,%hi(g_StarUseCounter)
	addiu	$3,$3,%lo(g_StarUseCounter)
	addu	$4,$4,$3
	lw	$3,0($4)
	jr	$31
	subu	$2,$2,$3

	.set	macro
	.set	reorder
	.end	getStarTimer
	.size	getStarTimer, .-getStarTimer
	.align	2
	.globl	getBooTimer
	.set	nomips16
	.set	nomicromips
	.ent	getBooTimer
	.type	getBooTimer, @function
getBooTimer:
	.frame	$sp,0,$31		# vars= 0, regs= 0/0, args= 0, gp= 0
	.mask	0x00000000,0
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	lui	$2,%hi(g_gameTimer)
	lwc1	$f0,%lo(g_gameTimer)($2)
	trunc.w.s $f0,$f0
	mfc1	$2,$f0
	sll	$4,$4,2
	lui	$3,%hi(g_GhostUseCounter)
	addiu	$3,$3,%lo(g_GhostUseCounter)
	addu	$4,$4,$3
	lw	$3,0($4)
	jr	$31
	subu	$2,$2,$3

	.set	macro
	.set	reorder
	.end	getBooTimer
	.size	getBooTimer, .-getBooTimer
	.align	2
	.globl	CustomLevelID
	.set	nomips16
	.set	nomicromips
	.ent	CustomLevelID
	.type	CustomLevelID, @function
CustomLevelID:
	.frame	$sp,0,$31		# vars= 0, regs= 0/0, args= 0, gp= 0
	.mask	0x00000000,0
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	lui	$2,%hi(HotSwapID)
	lh	$2,%lo(HotSwapID)($2)
	beq	$2,$0,$L49
	lui	$3,%hi(g_cupSelect)

	lb	$3,%lo(g_cupSelect)($3)
	li	$4,2			# 0x2
	beq	$3,$4,$L44
	slt	$4,$3,3

	beq	$4,$0,$L45
	li	$4,3			# 0x3

	beq	$3,$0,$L46
	li	$4,1			# 0x1

	bne	$3,$4,$L50
	lui	$3,%hi(g_courseSelect)

	addiu	$2,$2,-1
	sll	$2,$2,4
	lb	$3,%lo(g_courseSelect)($3)
	addiu	$3,$3,4
	addu	$2,$2,$3
	sll	$2,$2,16
	jr	$31
	sra	$2,$2,16

$L50:
	jr	$31
	li	$2,-1			# 0xffffffffffffffff

$L45:
	bne	$3,$4,$L51
	lui	$3,%hi(g_courseSelect)

	addiu	$2,$2,-1
	sll	$2,$2,4
	lb	$3,%lo(g_courseSelect)($3)
	addiu	$3,$3,12
	addu	$2,$2,$3
	sll	$2,$2,16
	jr	$31
	sra	$2,$2,16

$L51:
	jr	$31
	li	$2,-1			# 0xffffffffffffffff

$L46:
	addiu	$2,$2,-1
	sll	$2,$2,4
	lui	$3,%hi(g_courseSelect)
	lb	$3,%lo(g_courseSelect)($3)
	addu	$2,$2,$3
	sll	$2,$2,16
	jr	$31
	sra	$2,$2,16

$L44:
	addiu	$2,$2,-1
	sll	$2,$2,4
	lui	$3,%hi(g_courseSelect)
	lb	$3,%lo(g_courseSelect)($3)
	addiu	$3,$3,8
	addu	$2,$2,$3
	sll	$2,$2,16
	jr	$31
	sra	$2,$2,16

$L49:
	jr	$31
	li	$2,-1			# 0xffffffffffffffff

	.set	macro
	.set	reorder
	.end	CustomLevelID
	.size	CustomLevelID, .-CustomLevelID
	.align	2
	.globl	CheckPlatform
	.set	nomips16
	.set	nomicromips
	.ent	CheckPlatform
	.type	CheckPlatform, @function
CheckPlatform:
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
	lui	$18,%hi(targetAddress)
	lw	$2,%lo(targetAddress)($18)
	li	$16,-2139881472			# 0xffffffff80740000
	addiu	$3,$16,16384
	sw	$3,0($2)
	lui	$17,%hi(sourceAddress)
	lw	$2,%lo(sourceAddress)($17)
	li	$3,48			# 0x30
	sw	$3,0($2)
	lui	$2,%hi(dataLength)
	li	$3,12			# 0xc
	jal	runDMA
	sw	$3,%lo(dataLength)($2)

	lw	$2,%lo(targetAddress)($18)
	addiu	$3,$16,16396
	sw	$3,0($2)
	lw	$3,%lo(sourceAddress)($17)
	lw	$2,0($3)
	addiu	$2,$2,12
	jal	runDMA
	sw	$2,0($3)

	lw	$2,16404($16)
	li	$3,-1082195968			# 0xffffffffbf7f0000
	ori	$3,$3,0xb800
	addu	$2,$2,$3
	sltu	$2,$0,$2
	lw	$31,28($sp)
	lw	$18,24($sp)
	lw	$17,20($sp)
	lw	$16,16($sp)
	jr	$31
	addiu	$sp,$sp,32

	.set	macro
	.set	reorder
	.end	CheckPlatform
	.size	CheckPlatform, .-CheckPlatform
	.align	2
	.globl	CheckEmulator
	.set	nomips16
	.set	nomicromips
	.ent	CheckEmulator
	.type	CheckEmulator, @function
CheckEmulator:
	.frame	$sp,40,$31		# vars= 0, regs= 6/0, args= 16, gp= 0
	.mask	0x801f0000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	addiu	$sp,$sp,-40
	sw	$31,36($sp)
	sw	$20,32($sp)
	sw	$19,28($sp)
	sw	$18,24($sp)
	sw	$17,20($sp)
	sw	$16,16($sp)
	lui	$20,%hi(sourceAddress)
	lw	$3,%lo(sourceAddress)($20)
	li	$2,12517376			# 0xbf0000
	ori	$2,$2,0xfffc
	sw	$2,0($3)
	lui	$19,%hi(targetAddress)
	lw	$2,%lo(targetAddress)($19)
	li	$16,-2139881472			# 0xffffffff80740000
	addiu	$3,$16,16384
	sw	$3,0($2)
	lui	$17,%hi(dataLength)
	li	$18,8			# 0x8
	jal	runDMA
	sw	$18,%lo(dataLength)($17)

	lw	$2,%lo(sourceAddress)($20)
	lw	$3,16384($16)
	sw	$3,0($2)
	lw	$2,%lo(targetAddress)($19)
	addiu	$3,$16,16400
	sw	$3,0($2)
	jal	runDMA
	sw	$18,%lo(dataLength)($17)

	lw	$2,16400($16)
	sltu	$2,$0,$2
	lw	$31,36($sp)
	lw	$20,32($sp)
	lw	$19,28($sp)
	lw	$18,24($sp)
	lw	$17,20($sp)
	lw	$16,16($sp)
	jr	$31
	addiu	$sp,$sp,40

	.set	macro
	.set	reorder
	.end	CheckEmulator
	.size	CheckEmulator, .-CheckEmulator
	.align	2
	.globl	loadBigFont
	.set	nomips16
	.set	nomicromips
	.ent	loadBigFont
	.type	loadBigFont, @function
loadBigFont:
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
	lui	$2,%hi(BigFontROM)
	addiu	$2,$2,%lo(BigFontROM)
	sw	$2,0($3)
	lui	$17,%hi(targetAddress)
	lw	$2,%lo(targetAddress)($17)
	lui	$16,%hi(ok_FreeSpace)
	addiu	$16,$16,%lo(ok_FreeSpace)
	sw	$16,0($2)
	lui	$2,%hi(dataLength)
	li	$3,20480			# 0x5000
	jal	runDMA
	sw	$3,%lo(dataLength)($2)

	lw	$2,%lo(sourceAddress)($18)
	sw	$16,0($2)
	lw	$3,%lo(targetAddress)($17)
	lui	$2,%hi(nicefont)
	addiu	$2,$2,%lo(nicefont)
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
	.end	loadBigFont
	.size	loadBigFont, .-loadBigFont
	.align	2
	.globl	GetRealAddress
	.set	nomips16
	.set	nomicromips
	.ent	GetRealAddress
	.type	GetRealAddress, @function
GetRealAddress:
	.frame	$sp,0,$31		# vars= 0, regs= 0/0, args= 0, gp= 0
	.mask	0x00000000,0
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	sll	$3,$4,4
	srl	$3,$3,28
	lui	$2,%hi(RSPNumber)
	sw	$3,%lo(RSPNumber)($2)
	li	$2,16711680			# 0xff0000
	ori	$2,$2,0xffff
	and	$2,$4,$2
	lui	$4,%hi(RSPOffset)
	sw	$2,%lo(RSPOffset)($4)
	sll	$3,$3,2
	lui	$4,%hi(SegmentTable)
	addiu	$4,$4,%lo(SegmentTable)
	addu	$3,$3,$4
	lw	$4,0($3)
	addu	$2,$2,$4
	li	$3,-2147483648			# 0xffffffff80000000
	jr	$31
	or	$2,$2,$3

	.set	macro
	.set	reorder
	.end	GetRealAddress
	.size	GetRealAddress, .-GetRealAddress
	.align	2
	.globl	SetupFontF3D
	.set	nomips16
	.set	nomicromips
	.ent	SetupFontF3D
	.type	SetupFontF3D, @function
SetupFontF3D:
	.frame	$sp,56,$31		# vars= 0, regs= 6/0, args= 32, gp= 0
	.mask	0x801f0000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	addiu	$sp,$sp,-56
	sw	$31,52($sp)
	sw	$20,48($sp)
	sw	$19,44($sp)
	sw	$18,40($sp)
	sw	$17,36($sp)
	sw	$16,32($sp)
	lui	$20,%hi(RedTextPalette)
	addiu	$20,$20,%lo(RedTextPalette)
	li	$17,5			# 0x5
	sw	$17,24($sp)
	sw	$17,20($sp)
	li	$16,14			# 0xe
	sw	$16,16($sp)
	li	$7,11			# 0xb
	li	$6,11			# 0xb
	li	$5,31			# 0x1f
	jal	SetFontColorPalette
	move	$4,$20

	lui	$19,%hi(BlueTextPalette)
	addiu	$19,$19,%lo(BlueTextPalette)
	sw	$16,24($sp)
	sw	$17,20($sp)
	sw	$17,16($sp)
	li	$7,31			# 0x1f
	li	$6,11			# 0xb
	li	$5,11			# 0xb
	jal	SetFontColorPalette
	move	$4,$19

	lui	$18,%hi(GreenTextPalette)
	addiu	$18,$18,%lo(GreenTextPalette)
	sw	$17,24($sp)
	sw	$16,20($sp)
	sw	$17,16($sp)
	li	$7,11			# 0xb
	li	$6,31			# 0x1f
	li	$5,11			# 0xb
	jal	SetFontColorPalette
	move	$4,$18

	lui	$17,%hi(WhiteTextPalette)
	addiu	$17,$17,%lo(WhiteTextPalette)
	sw	$16,24($sp)
	sw	$16,20($sp)
	sw	$16,16($sp)
	li	$7,30			# 0x1e
	li	$6,30			# 0x1e
	li	$5,30			# 0x1e
	jal	SetFontColorPalette
	move	$4,$17

	lui	$2,%hi(sourceAddress)
	lw	$16,%lo(sourceAddress)($2)
	li	$4,218103808			# 0xd000000
	jal	GetRealAddress
	ori	$4,$4,0x8080

	sw	$2,0($16)
	lui	$2,%hi(dataLength)
	li	$3,184			# 0xb8
	sw	$3,%lo(dataLength)($2)
	lui	$16,%hi(targetAddress)
	lw	$3,%lo(targetAddress)($16)
	lui	$2,%hi(RedPaletteF3D)
	addiu	$2,$2,%lo(RedPaletteF3D)
	jal	runRAM
	sw	$2,0($3)

	lw	$3,%lo(targetAddress)($16)
	lui	$2,%hi(BluePaletteF3D)
	addiu	$2,$2,%lo(BluePaletteF3D)
	jal	runRAM
	sw	$2,0($3)

	lw	$3,%lo(targetAddress)($16)
	lui	$2,%hi(GreenPaletteF3D)
	addiu	$2,$2,%lo(GreenPaletteF3D)
	jal	runRAM
	sw	$2,0($3)

	lw	$2,%lo(targetAddress)($16)
	lui	$16,%hi(WhitePaletteF3D)
	addiu	$16,$16,%lo(WhitePaletteF3D)
	jal	runRAM
	sw	$16,0($2)

	lui	$2,%hi(RedPaletteF3D+20)
	sw	$20,%lo(RedPaletteF3D+20)($2)
	lui	$2,%hi(BluePaletteF3D+20)
	sw	$19,%lo(BluePaletteF3D+20)($2)
	lui	$2,%hi(GreenPaletteF3D+20)
	sw	$18,%lo(GreenPaletteF3D+20)($2)
	addiu	$3,$16,20
	lui	$2,%hi(GlobalAddressA)
	sw	$3,%lo(GlobalAddressA)($2)
	sw	$17,20($16)
	lw	$31,52($sp)
	lw	$20,48($sp)
	lw	$19,44($sp)
	lw	$18,40($sp)
	lw	$17,36($sp)
	lw	$16,32($sp)
	jr	$31
	addiu	$sp,$sp,56

	.set	macro
	.set	reorder
	.end	SetupFontF3D
	.size	SetupFontF3D, .-SetupFontF3D
	.align	2
	.globl	ShiftVertColor
	.set	nomips16
	.set	nomicromips
	.ent	ShiftVertColor
	.type	ShiftVertColor, @function
ShiftVertColor:
	.frame	$sp,40,$31		# vars= 0, regs= 6/0, args= 16, gp= 0
	.mask	0x801f0000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	addiu	$sp,$sp,-40
	sw	$31,36($sp)
	sw	$20,32($sp)
	sw	$19,28($sp)
	sw	$18,24($sp)
	sw	$17,20($sp)
	sw	$16,16($sp)
	move	$20,$5
	move	$16,$7
	lb	$17,59($sp)
	lb	$18,63($sp)
	lb	$19,67($sp)
	srl	$2,$4,22
	andi	$2,$2,0x3c
	lui	$3,%hi(SegmentTable)
	addiu	$3,$3,%lo(SegmentTable)
	addu	$2,$2,$3
	li	$3,16711680			# 0xff0000
	ori	$3,$3,0xffff
	and	$4,$4,$3
	lw	$2,0($2)
	jal	GetRealAddress
	addu	$4,$4,$2

	beq	$20,$0,$L66
	lw	$31,36($sp)

	move	$5,$20
	move	$4,$0
$L63:
	lbu	$3,12($2)
	addu	$3,$17,$3
	sb	$3,12($2)
	lbu	$3,13($2)
	addu	$3,$18,$3
	sb	$3,13($2)
	lbu	$3,14($2)
	addu	$3,$19,$3
	sb	$3,14($2)
	lbu	$3,15($2)
	addu	$3,$16,$3
	sb	$3,15($2)
	addiu	$4,$4,1
	bne	$5,$4,$L63
	addiu	$2,$2,16

	lw	$31,36($sp)
$L66:
	lw	$20,32($sp)
	lw	$19,28($sp)
	lw	$18,24($sp)
	lw	$17,20($sp)
	lw	$16,16($sp)
	jr	$31
	addiu	$sp,$sp,40

	.set	macro
	.set	reorder
	.end	ShiftVertColor
	.size	ShiftVertColor, .-ShiftVertColor
	.align	2
	.globl	DrawBox
	.set	nomips16
	.set	nomicromips
	.ent	DrawBox
	.type	DrawBox, @function
DrawBox:
	.frame	$sp,48,$31		# vars= 0, regs= 2/0, args= 40, gp= 0
	.mask	0x80010000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	addiu	$sp,$sp,-48
	sw	$31,44($sp)
	sw	$16,40($sp)
	lui	$16,%hi(GraphPtr)
	lw	$2,76($sp)
	sw	$2,32($sp)
	lw	$2,72($sp)
	sw	$2,28($sp)
	lw	$2,68($sp)
	sw	$2,24($sp)
	lw	$2,64($sp)
	sw	$2,20($sp)
	addu	$7,$5,$7
	sw	$7,16($sp)
	addu	$7,$4,$6
	move	$6,$5
	move	$5,$4
	jal	FillRect1ColorF
	lw	$4,%lo(GraphPtr)($16)

	sw	$2,%lo(GraphPtr)($16)
	lw	$31,44($sp)
	lw	$16,40($sp)
	jr	$31
	addiu	$sp,$sp,48

	.set	macro
	.set	reorder
	.end	DrawBox
	.size	DrawBox, .-DrawBox
	.align	2
	.globl	GetIntLength
	.set	nomips16
	.set	nomicromips
	.ent	GetIntLength
	.type	GetIntLength, @function
GetIntLength:
	.frame	$sp,0,$31		# vars= 0, regs= 0/0, args= 0, gp= 0
	.mask	0x00000000,0
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	sra	$2,$4,31
	xor	$4,$2,$4
	subu	$4,$4,$2
	slt	$2,$4,10
	bne	$2,$0,$L71
	nop

	slt	$2,$4,100
	bne	$2,$0,$L72
	nop

	slt	$2,$4,1000
	bne	$2,$0,$L73
	nop

	slt	$2,$4,10000
	bne	$2,$0,$L74
	nop

	li	$2,65536			# 0x10000
	ori	$2,$2,0x86a0
	slt	$2,$4,$2
	bne	$2,$0,$L75
	nop

	li	$2,983040			# 0xf0000
	addiu	$2,$2,16960
	slt	$2,$4,$2
	bne	$2,$0,$L76
	nop

	li	$2,9961472			# 0x980000
	ori	$2,$2,0x9680
	slt	$2,$4,$2
	bne	$2,$0,$L77
	nop

	li	$2,99942400			# 0x5f50000
	ori	$2,$2,0xe100
	slt	$2,$4,$2
	bnel	$2,$0,$L81
	li	$2,8			# 0x8

	li	$2,999948288			# 0x3b9a0000
	ori	$2,$2,0xca00
	slt	$4,$4,$2
	bne	$4,$0,$L80
	move	$2,$0

$L69:
$L81:
	jr	$31
	nop

$L80:
	jr	$31
	li	$2,9			# 0x9

$L71:
	jr	$31
	li	$2,1			# 0x1

$L72:
	jr	$31
	li	$2,2			# 0x2

$L73:
	jr	$31
	li	$2,3			# 0x3

$L74:
	jr	$31
	li	$2,4			# 0x4

$L75:
	jr	$31
	li	$2,5			# 0x5

$L76:
	jr	$31
	li	$2,6			# 0x6

$L77:
	jr	$31
	li	$2,7			# 0x7

	.set	macro
	.set	reorder
	.end	GetIntLength
	.size	GetIntLength, .-GetIntLength
	.section	.rodata.str1.4,"aMS",@progbits,1
	.align	2
$LC0:
	.ascii	"\000"
	.align	2
$LC1:
	.ascii	".\000"
	.text
	.align	2
	.globl	printDecimal
	.set	nomips16
	.set	nomicromips
	.ent	printDecimal
	.type	printDecimal, @function
printDecimal:
	.frame	$sp,48,$31		# vars= 0, regs= 6/2, args= 16, gp= 0
	.mask	0x801f0000,-12
	.fmask	0x00300000,-8
	.set	noreorder
	.set	nomacro
	addiu	$sp,$sp,-48
	sw	$31,36($sp)
	sw	$20,32($sp)
	sw	$19,28($sp)
	sw	$18,24($sp)
	sw	$17,20($sp)
	sw	$16,16($sp)
	sdc1	$f20,40($sp)
	move	$17,$4
	mtc1	$6,$f20
	slt	$2,$7,2
	bne	$2,$0,$L90
	move	$18,$5

	li	$3,1			# 0x1
	li	$16,10			# 0xa
$L84:
	sll	$2,$16,2
	addu	$2,$2,$16
	addiu	$3,$3,1
	bne	$7,$3,$L84
	sll	$16,$2,1

$L83:
	trunc.w.s $f0,$f20
	mfc1	$20,$f0
	lui	$2,%hi(wholeNumber)
	swc1	$f0,%lo(wholeNumber)($2)
	cvt.s.w	$f0,$f0
	sub.s	$f0,$f20,$f0
	mtc1	$16,$f2
	nop
	cvt.s.w	$f2,$f2
	mul.s	$f0,$f0,$f2
	trunc.w.s $f2,$f0
	mfc1	$2,$f2
	cvt.s.w	$f2,$f2
	c.lt.s	$f0,$f2
	nop
	bc1tl	$L85
	addiu	$2,$2,-1

	lui	$3,%hi(decimalNumber)
	sw	$2,%lo(decimalNumber)($3)
$L86:
	jal	GetIntLength
	move	$4,$20

	mtc1	$0,$f0
	nop
	c.lt.s	$f20,$f0
	nop
	bc1t	$L94
	sll	$19,$2,3

$L87:
	move	$7,$20
	lui	$6,%hi($LC0)
	addiu	$6,$6,%lo($LC0)
	move	$5,$18
	jal	printStringNumber
	move	$4,$17

	addu	$4,$17,$19
	lui	$6,%hi($LC1)
	addiu	$6,$6,%lo($LC1)
	move	$5,$18
	jal	printString
	addiu	$4,$4,10

	lui	$2,%hi(decimalNumber)
	lw	$5,%lo(decimalNumber)($2)
	li	$3,1717960704			# 0x66660000
	addiu	$3,$3,26215
	mult	$16,$3
	mfhi	$3
	sra	$3,$3,2
	sra	$2,$16,31
	subu	$16,$3,$2
	slt	$16,$5,$16
	beq	$16,$0,$L89
	addiu	$4,$19,8

	bne	$5,$0,$L95
	move	$7,$0

$L89:
	lui	$2,%hi(decimalNumber)
	lw	$7,%lo(decimalNumber)($2)
	lui	$6,%hi($LC0)
	addiu	$6,$6,%lo($LC0)
	move	$5,$18
	jal	printStringNumber
	addu	$4,$17,$4

	lw	$31,36($sp)
	lw	$20,32($sp)
	lw	$19,28($sp)
	lw	$18,24($sp)
	lw	$17,20($sp)
	lw	$16,16($sp)
	ldc1	$f20,40($sp)
	jr	$31
	addiu	$sp,$sp,48

$L90:
	b	$L83
	li	$16,10			# 0xa

$L85:
	lui	$3,%hi(decimalNumber)
	b	$L86
	sw	$2,%lo(decimalNumber)($3)

$L94:
	addiu	$17,$17,-8
	addiu	$19,$19,8
	lui	$3,%hi(decimalNumber)
	lw	$2,%lo(decimalNumber)($3)
	subu	$2,$0,$2
	b	$L87
	sw	$2,%lo(decimalNumber)($3)

$L95:
	lui	$6,%hi($LC0)
	addiu	$6,$6,%lo($LC0)
	move	$5,$18
	jal	printStringNumber
	addu	$4,$17,$4

	b	$L89
	addiu	$4,$19,16

	.set	macro
	.set	reorder
	.end	printDecimal
	.size	printDecimal, .-printDecimal
	.align	2
	.globl	printFloat
	.set	nomips16
	.set	nomicromips
	.ent	printFloat
	.type	printFloat, @function
printFloat:
	.frame	$sp,24,$31		# vars= 0, regs= 1/0, args= 16, gp= 0
	.mask	0x80000000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	addiu	$sp,$sp,-24
	sw	$31,20($sp)
	jal	printDecimal
	li	$7,2			# 0x2

	lw	$31,20($sp)
	jr	$31
	addiu	$sp,$sp,24

	.set	macro
	.set	reorder
	.end	printFloat
	.size	printFloat, .-printFloat
	.align	2
	.globl	ResetObject
	.set	nomips16
	.set	nomicromips
	.ent	ResetObject
	.type	ResetObject, @function
ResetObject:
	.frame	$sp,0,$31		# vars= 0, regs= 0/0, args= 0, gp= 0
	.mask	0x00000000,0
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	lui	$4,%hi(objectPosition)
	sw	$0,%lo(objectPosition)($4)
	lui	$3,%hi(objectAngle)
	sh	$0,%lo(objectAngle)($3)
	lui	$2,%hi(objectVelocity)
	sw	$0,%lo(objectVelocity)($2)
	addiu	$4,$4,%lo(objectPosition)
	sw	$0,4($4)
	addiu	$3,$3,%lo(objectAngle)
	sh	$0,2($3)
	addiu	$2,$2,%lo(objectVelocity)
	sw	$0,4($2)
	sw	$0,8($4)
	sh	$0,4($3)
	jr	$31
	sw	$0,8($2)

	.set	macro
	.set	reorder
	.end	ResetObject
	.size	ResetObject, .-ResetObject
	.align	2
	.globl	printHex
	.set	nomips16
	.set	nomicromips
	.ent	printHex
	.type	printHex, @function
printHex:
	.frame	$sp,0,$31		# vars= 0, regs= 0/0, args= 0, gp= 0
	.mask	0x00000000,0
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	move	$7,$4
	addu	$2,$4,$6
	sb	$0,0($2)
	beq	$6,$0,$L103
	addiu	$3,$6,-1

	addu	$3,$4,$3
	lui	$8,%hi(hex)
$L101:
	andi	$6,$5,0xf
	lw	$4,%lo(hex)($8)
	addu	$4,$4,$6
	lb	$4,0($4)
	sb	$4,0($3)
	sra	$5,$5,4
	move	$4,$3
	bne	$4,$7,$L101
	addiu	$3,$3,-1

$L103:
	jr	$31
	nop

	.set	macro
	.set	reorder
	.end	printHex
	.size	printHex, .-printHex
	.align	2
	.globl	RunWaveSpeed
	.set	nomips16
	.set	nomicromips
	.ent	RunWaveSpeed
	.type	RunWaveSpeed, @function
RunWaveSpeed:
	.frame	$sp,0,$31		# vars= 0, regs= 0/0, args= 0, gp= 0
	.mask	0x00000000,0
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	lhu	$2,0($4)
	addu	$5,$5,$2
	jr	$31
	sh	$5,0($4)

	.set	macro
	.set	reorder
	.end	RunWaveSpeed
	.size	RunWaveSpeed, .-RunWaveSpeed
	.align	2
	.globl	SpriteDrawWave
	.set	nomips16
	.set	nomicromips
	.ent	SpriteDrawWave
	.type	SpriteDrawWave, @function
SpriteDrawWave:
	.frame	$sp,72,$31		# vars= 0, regs= 9/2, args= 24, gp= 0
	.mask	0x80ff0000,-12
	.fmask	0x00300000,-8
	.set	noreorder
	.set	nomacro
	addiu	$sp,$sp,-72
	sw	$31,60($sp)
	sw	$23,56($sp)
	sw	$22,52($sp)
	sw	$21,48($sp)
	sw	$20,44($sp)
	sw	$19,40($sp)
	sw	$18,36($sp)
	sw	$17,32($sp)
	sw	$16,28($sp)
	sdc1	$f20,64($sp)
	lw	$20,88($sp)
	lwc1	$f20,92($sp)
	lhu	$16,102($sp)
	srl	$2,$7,31
	addu	$2,$2,$7
	sra	$2,$2,1
	subu	$21,$4,$2
	srl	$2,$20,31
	addu	$2,$2,$20
	sra	$2,$2,1
	blez	$20,$L105
	subu	$17,$5,$2

	move	$19,$7
	sll	$23,$7,1
	move	$18,$6
	lhu	$22,98($sp)
	addu	$20,$20,$17
$L107:
	li	$6,1			# 0x1
	move	$5,$19
	jal	KWLoadTextureBlockRGBA16B
	move	$4,$18

	jal	sinT
	move	$4,$16

	mtc1	$21,$f2
	nop
	cvt.s.w	$f2,$f2
	mul.s	$f0,$f0,$f20
	add.s	$f2,$f2,$f0
	li	$2,1			# 0x1
	sw	$2,16($sp)
	li	$7,1			# 0x1
	move	$6,$19
	trunc.w.s $f0,$f2
	mfc1	$4,$f0
	jal	SPRDrawClip
	move	$5,$17

	addiu	$17,$17,1
	addu	$18,$18,$23
	addu	$16,$16,$22
	bne	$17,$20,$L107
	andi	$16,$16,0xffff

$L105:
	lw	$31,60($sp)
	lw	$23,56($sp)
	lw	$22,52($sp)
	lw	$21,48($sp)
	lw	$20,44($sp)
	lw	$19,40($sp)
	lw	$18,36($sp)
	lw	$17,32($sp)
	lw	$16,28($sp)
	ldc1	$f20,64($sp)
	jr	$31
	addiu	$sp,$sp,72

	.set	macro
	.set	reorder
	.end	SpriteDrawWave
	.size	SpriteDrawWave, .-SpriteDrawWave
	.globl	CharacterUnconvert
	.data
	.align	2
	.type	CharacterUnconvert, @object
	.size	CharacterUnconvert, 9
CharacterUnconvert:
	.ascii	"\377\000\001\004\003\005\006\002\007"
	.globl	CharacterConvert
	.align	2
	.type	CharacterConvert, @object
	.size	CharacterConvert, 9
CharacterConvert:
	.ascii	"\377\000\001\006\003\002\004\005\007"
	.globl	RAMCheckEndDefault
	.section	.bss,"aw",@nobits
	.align	2
	.type	RAMCheckEndDefault, @object
	.size	RAMCheckEndDefault, 4
RAMCheckEndDefault:
	.space	4
	.globl	RAMCheckDefault
	.align	2
	.type	RAMCheckDefault, @object
	.size	RAMCheckDefault, 4
RAMCheckDefault:
	.space	4
	.ident	"GCC: (GNU) 10.1.0"
