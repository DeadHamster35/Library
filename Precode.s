	.file	1 "Precode.c"
	.section .mdebug.abi32
	.previous
	.nan	legacy
	.module	fp=32
	.module	nooddspreg
	.text
	.align	2
	.globl	CheckExpansion
	.set	nomips16
	.set	nomicromips
	.ent	CheckExpansion
	.type	CheckExpansion, @function
CheckExpansion:
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
	lui	$5,%hi(PRELOAD_RAM)
	addiu	$17,$5,%lo(PRELOAD_RAM)
	li	$6,512			# 0x200
	lui	$5,%hi(BootCode)
	addiu	$5,$5,%lo(BootCode)
	jal	DMA
	addiu	$4,$17,512

	li	$2,-2141192192			# 0xffffffff80600000
	li	$5,891617280			# 0x35250000
	ori	$5,$5,0x3525
	li	$4,891617280			# 0x35250000
	ori	$4,$4,0x3525
	sw	$5,4($2)
	sw	$4,0($2)
	lw	$3,4($2)
	li	$2,891617280			# 0x35250000
	addiu	$2,$2,13605
	beq	$3,$2,$L2
	lui	$3,%hi(ExpansionCheckAddress)

	li	$2,287440896			# 0x11220000
	addiu	$2,$2,13124
	sw	$2,%lo(ExpansionCheckAddress)($3)
	addiu	$19,$17,1024
	lui	$18,%hi(RAMCheck)
	addiu	$18,$18,%lo(RAMCheck)
	lui	$16,%hi(RAMCheckEnd)
	addiu	$16,$16,%lo(RAMCheckEnd)
	subu	$6,$16,$18
	move	$5,$18
	jal	DMA
	move	$4,$19

	addu	$5,$16,$17
	addiu	$5,$5,1024
	subu	$5,$5,$18
	jal	decodeMIO0
	move	$4,$19

	lw	$31,36($sp)
$L5:
	lw	$19,32($sp)
	lw	$18,28($sp)
	lw	$17,24($sp)
	lw	$16,20($sp)
	jr	$31
	addiu	$sp,$sp,40

$L2:
	li	$2,-2293760			# 0xffffffffffdd0000
	ori	$2,$2,0xeecc
	sw	$2,%lo(ExpansionCheckAddress)($3)
	lui	$6,%hi(DMA_MAX_LENGTH)
	addiu	$6,$6,%lo(DMA_MAX_LENGTH)
	lui	$5,%hi(PAYLOAD_ROM)
	addiu	$5,$5,%lo(PAYLOAD_ROM)
	jal	DMA
	li	$4,-2143289344			# 0xffffffff80400000

	b	$L5
	lw	$31,36($sp)

	.set	macro
	.set	reorder
	.end	CheckExpansion
	.size	CheckExpansion, .-CheckExpansion
	.ident	"GCC: (GNU) 10.1.0"
