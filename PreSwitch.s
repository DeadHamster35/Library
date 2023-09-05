	.file	1 "PreSwitch.c"
	.section .mdebug.abi32
	.previous
	.nan	legacy
	.module	fp=32
	.module	nooddspreg
	.text
	.align	2
	.globl	allRunSwitch
	.set	nomips16
	.set	nomicromips
	.ent	allRunSwitch
	.type	allRunSwitch, @function
allRunSwitch:
	.frame	$sp,24,$31		# vars= 0, regs= 1/0, args= 16, gp= 0
	.mask	0x80000000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	lui	$2,%hi(ExpansionCheckAddress)
	lw	$3,%lo(ExpansionCheckAddress)($2)
	li	$2,-2293760			# 0xffffffffffdd0000
	ori	$2,$2,0xeecc
	beq	$3,$2,$L7
	nop

	jr	$31
	nop

$L7:
	addiu	$sp,$sp,-24
	sw	$31,20($sp)
	jal	allRun
	nop

	lw	$31,20($sp)
	jr	$31
	addiu	$sp,$sp,24

	.set	macro
	.set	reorder
	.end	allRunSwitch
	.size	allRunSwitch, .-allRunSwitch
	.align	2
	.globl	printMenuSwitch
	.set	nomips16
	.set	nomicromips
	.ent	printMenuSwitch
	.type	printMenuSwitch, @function
printMenuSwitch:
	.frame	$sp,32,$31		# vars= 0, regs= 1/0, args= 24, gp= 0
	.mask	0x80000000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	addiu	$sp,$sp,-32
	sw	$31,28($sp)
	lui	$2,%hi(ExpansionCheckAddress)
	lw	$3,%lo(ExpansionCheckAddress)($2)
	li	$2,-2293760			# 0xffffffffffdd0000
	ori	$2,$2,0xeecc
	beq	$3,$2,$L12
	li	$2,287440896			# 0x11220000

	addiu	$2,$2,13124
	beq	$3,$2,$L13
	lui	$2,%hi(PRELOAD_RAM)

$L8:
	lw	$31,28($sp)
$L14:
	jr	$31
	addiu	$sp,$sp,32

$L12:
	jal	PrintMenuFunction
	nop

	b	$L14
	lw	$31,28($sp)

$L13:
	addiu	$2,$2,%lo(PRELOAD_RAM)
	lui	$6,%hi(RAMCheckEnd)
	addiu	$6,$6,%lo(RAMCheckEnd)
	addu	$2,$2,$6
	addiu	$2,$2,1024
	li	$3,4			# 0x4
	sw	$3,20($sp)
	li	$3,240			# 0xf0
	sw	$3,16($sp)
	li	$7,512			# 0x200
	lui	$6,%hi(RAMCheck)
	addiu	$6,$6,%lo(RAMCheck)
	subu	$6,$2,$6
	li	$5,120			# 0x78
	jal	KWSpriteDiv
	li	$4,256			# 0x100

	lui	$2,%hi(g_FadeCounter2+16)
	li	$3,1			# 0x1
	b	$L8
	sw	$3,%lo(g_FadeCounter2+16)($2)

	.set	macro
	.set	reorder
	.end	printMenuSwitch
	.size	printMenuSwitch, .-printMenuSwitch
	.ident	"GCC: (GNU) 10.1.0"
