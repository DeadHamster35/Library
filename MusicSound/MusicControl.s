	.file	1 "MusicControl.c"
	.section .mdebug.abi32
	.previous
	.nan	legacy
	.module	fp=32
	.module	nooddspreg
	.text
	.align	2
	.globl	MusSeqStart
	.set	nomips16
	.set	nomicromips
	.ent	MusSeqStart
	.type	MusSeqStart, @function
MusSeqStart:
	.frame	$sp,24,$31		# vars= 0, regs= 1/0, args= 16, gp= 0
	.mask	0x80000000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	addiu	$sp,$sp,-24
	sw	$31,20($sp)
	sll	$6,$6,16
	or	$6,$6,$5
	sll	$4,$4,24
	jal	NAISeqFlagEntry
	or	$4,$6,$4

	lw	$31,20($sp)
	jr	$31
	addiu	$sp,$sp,24

	.set	macro
	.set	reorder
	.end	MusSeqStart
	.size	MusSeqStart, .-MusSeqStart
	.align	2
	.globl	MusSeqStop
	.set	nomips16
	.set	nomicromips
	.ent	MusSeqStop
	.type	MusSeqStop, @function
MusSeqStop:
	.frame	$sp,24,$31		# vars= 0, regs= 1/0, args= 16, gp= 0
	.mask	0x80000000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	addiu	$sp,$sp,-24
	sw	$31,20($sp)
	sll	$4,$4,24
	sll	$5,$5,16
	or	$4,$4,$5
	li	$2,268435456			# 0x10000000
	addiu	$2,$2,255
	jal	NAISeqFlagEntry
	or	$4,$4,$2

	lw	$31,20($sp)
	jr	$31
	addiu	$sp,$sp,24

	.set	macro
	.set	reorder
	.end	MusSeqStop
	.size	MusSeqStop, .-MusSeqStop
	.align	2
	.globl	MusSeqVolumeChange
	.set	nomips16
	.set	nomicromips
	.ent	MusSeqVolumeChange
	.type	MusSeqVolumeChange, @function
MusSeqVolumeChange:
	.frame	$sp,24,$31		# vars= 0, regs= 1/0, args= 16, gp= 0
	.mask	0x80000000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	addiu	$sp,$sp,-24
	sw	$31,20($sp)
	sll	$4,$4,24
	or	$4,$4,$5
	sll	$6,$6,16
	or	$4,$4,$6
	li	$2,1073741824			# 0x40000000
	jal	NAISeqFlagEntry
	or	$4,$4,$2

	lw	$31,20($sp)
	jr	$31
	addiu	$sp,$sp,24

	.set	macro
	.set	reorder
	.end	MusSeqVolumeChange
	.size	MusSeqVolumeChange, .-MusSeqVolumeChange
	.align	2
	.globl	MusSeqVolumeRecover
	.set	nomips16
	.set	nomicromips
	.ent	MusSeqVolumeRecover
	.type	MusSeqVolumeRecover, @function
MusSeqVolumeRecover:
	.frame	$sp,24,$31		# vars= 0, regs= 1/0, args= 16, gp= 0
	.mask	0x80000000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	addiu	$sp,$sp,-24
	sw	$31,20($sp)
	sll	$4,$4,24
	sll	$5,$5,16
	or	$4,$4,$5
	li	$2,1073741824			# 0x40000000
	addiu	$2,$2,127
	jal	NAISeqFlagEntry
	or	$4,$4,$2

	lw	$31,20($sp)
	jr	$31
	addiu	$sp,$sp,24

	.set	macro
	.set	reorder
	.end	MusSeqVolumeRecover
	.size	MusSeqVolumeRecover, .-MusSeqVolumeRecover
	.align	2
	.globl	MusSeqPitchChange
	.set	nomips16
	.set	nomicromips
	.ent	MusSeqPitchChange
	.type	MusSeqPitchChange, @function
MusSeqPitchChange:
	.frame	$sp,24,$31		# vars= 0, regs= 1/0, args= 16, gp= 0
	.mask	0x80000000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	addiu	$sp,$sp,-24
	sw	$31,20($sp)
	sll	$4,$4,24
	or	$4,$4,$5
	sll	$6,$6,16
	or	$4,$4,$6
	li	$2,1342177280			# 0x50000000
	jal	NAISeqFlagEntry
	or	$4,$4,$2

	lw	$31,20($sp)
	jr	$31
	addiu	$sp,$sp,24

	.set	macro
	.set	reorder
	.end	MusSeqPitchChange
	.size	MusSeqPitchChange, .-MusSeqPitchChange
	.align	2
	.globl	MusSeqPitchRecover
	.set	nomips16
	.set	nomicromips
	.ent	MusSeqPitchRecover
	.type	MusSeqPitchRecover, @function
MusSeqPitchRecover:
	.frame	$sp,24,$31		# vars= 0, regs= 1/0, args= 16, gp= 0
	.mask	0x80000000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	addiu	$sp,$sp,-24
	sw	$31,20($sp)
	sll	$4,$4,24
	sll	$5,$5,16
	or	$4,$4,$5
	li	$2,1342177280			# 0x50000000
	addiu	$2,$2,1000
	jal	NAISeqFlagEntry
	or	$4,$4,$2

	lw	$31,20($sp)
	jr	$31
	addiu	$sp,$sp,24

	.set	macro
	.set	reorder
	.end	MusSeqPitchRecover
	.size	MusSeqPitchRecover, .-MusSeqPitchRecover
	.align	2
	.globl	MusSeqTempoDirect
	.set	nomips16
	.set	nomicromips
	.ent	MusSeqTempoDirect
	.type	MusSeqTempoDirect, @function
MusSeqTempoDirect:
	.frame	$sp,24,$31		# vars= 0, regs= 1/0, args= 16, gp= 0
	.mask	0x80000000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	addiu	$sp,$sp,-24
	sw	$31,20($sp)
	sll	$4,$4,24
	or	$4,$4,$5
	sll	$6,$6,16
	or	$4,$4,$6
	li	$2,-1342177280			# 0xffffffffb0000000
	jal	NAISeqFlagEntry
	or	$4,$4,$2

	lw	$31,20($sp)
	jr	$31
	addiu	$sp,$sp,24

	.set	macro
	.set	reorder
	.end	MusSeqTempoDirect
	.size	MusSeqTempoDirect, .-MusSeqTempoDirect
	.align	2
	.globl	MusSeqTempoAdd
	.set	nomips16
	.set	nomicromips
	.ent	MusSeqTempoAdd
	.type	MusSeqTempoAdd, @function
MusSeqTempoAdd:
	.frame	$sp,24,$31		# vars= 0, regs= 1/0, args= 16, gp= 0
	.mask	0x80000000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	addiu	$sp,$sp,-24
	sw	$31,20($sp)
	sll	$4,$4,24
	or	$4,$4,$5
	sll	$6,$6,16
	or	$4,$4,$6
	li	$2,-1342177280			# 0xffffffffb0000000
	addiu	$2,$2,4096
	jal	NAISeqFlagEntry
	or	$4,$4,$2

	lw	$31,20($sp)
	jr	$31
	addiu	$sp,$sp,24

	.set	macro
	.set	reorder
	.end	MusSeqTempoAdd
	.size	MusSeqTempoAdd, .-MusSeqTempoAdd
	.align	2
	.globl	MusSeqTempoSub
	.set	nomips16
	.set	nomicromips
	.ent	MusSeqTempoSub
	.type	MusSeqTempoSub, @function
MusSeqTempoSub:
	.frame	$sp,24,$31		# vars= 0, regs= 1/0, args= 16, gp= 0
	.mask	0x80000000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	addiu	$sp,$sp,-24
	sw	$31,20($sp)
	sll	$4,$4,24
	or	$4,$4,$5
	sll	$6,$6,16
	or	$4,$4,$6
	li	$2,-1342177280			# 0xffffffffb0000000
	addiu	$2,$2,8192
	jal	NAISeqFlagEntry
	or	$4,$4,$2

	lw	$31,20($sp)
	jr	$31
	addiu	$sp,$sp,24

	.set	macro
	.set	reorder
	.end	MusSeqTempoSub
	.size	MusSeqTempoSub, .-MusSeqTempoSub
	.align	2
	.globl	MusSeqTempoPercent
	.set	nomips16
	.set	nomicromips
	.ent	MusSeqTempoPercent
	.type	MusSeqTempoPercent, @function
MusSeqTempoPercent:
	.frame	$sp,24,$31		# vars= 0, regs= 1/0, args= 16, gp= 0
	.mask	0x80000000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	addiu	$sp,$sp,-24
	sw	$31,20($sp)
	sll	$4,$4,24
	or	$4,$4,$5
	sll	$6,$6,16
	or	$4,$4,$6
	li	$2,-1342177280			# 0xffffffffb0000000
	addiu	$2,$2,12288
	jal	NAISeqFlagEntry
	or	$4,$4,$2

	lw	$31,20($sp)
	jr	$31
	addiu	$sp,$sp,24

	.set	macro
	.set	reorder
	.end	MusSeqTempoPercent
	.size	MusSeqTempoPercent, .-MusSeqTempoPercent
	.align	2
	.globl	MusSeqTempoRecover
	.set	nomips16
	.set	nomicromips
	.ent	MusSeqTempoRecover
	.type	MusSeqTempoRecover, @function
MusSeqTempoRecover:
	.frame	$sp,24,$31		# vars= 0, regs= 1/0, args= 16, gp= 0
	.mask	0x80000000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	addiu	$sp,$sp,-24
	sw	$31,20($sp)
	sll	$4,$4,24
	sll	$5,$5,16
	or	$4,$4,$5
	li	$2,-1342177280			# 0xffffffffb0000000
	addiu	$2,$2,16384
	jal	NAISeqFlagEntry
	or	$4,$4,$2

	lw	$31,20($sp)
	jr	$31
	addiu	$sp,$sp,24

	.set	macro
	.set	reorder
	.end	MusSeqTempoRecover
	.size	MusSeqTempoRecover, .-MusSeqTempoRecover
	.align	2
	.globl	MusSeqPreventNext
	.set	nomips16
	.set	nomicromips
	.ent	MusSeqPreventNext
	.type	MusSeqPreventNext, @function
MusSeqPreventNext:
	.frame	$sp,24,$31		# vars= 0, regs= 1/0, args= 16, gp= 0
	.mask	0x80000000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	addiu	$sp,$sp,-24
	sw	$31,20($sp)
	li	$2,-536870912			# 0xffffffffe0000000
	addiu	$2,$2,256
	jal	NAISeqFlagEntry
	or	$4,$4,$2

	lw	$31,20($sp)
	jr	$31
	addiu	$sp,$sp,24

	.set	macro
	.set	reorder
	.end	MusSeqPreventNext
	.size	MusSeqPreventNext, .-MusSeqPreventNext
	.align	2
	.globl	MusSeqSoundMode
	.set	nomips16
	.set	nomicromips
	.ent	MusSeqSoundMode
	.type	MusSeqSoundMode, @function
MusSeqSoundMode:
	.frame	$sp,24,$31		# vars= 0, regs= 1/0, args= 16, gp= 0
	.mask	0x80000000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	addiu	$sp,$sp,-24
	sw	$31,20($sp)
	li	$2,-536870912			# 0xffffffffe0000000
	jal	NAISeqFlagEntry
	or	$4,$4,$2

	lw	$31,20($sp)
	jr	$31
	addiu	$sp,$sp,24

	.set	macro
	.set	reorder
	.end	MusSeqSoundMode
	.size	MusSeqSoundMode, .-MusSeqSoundMode
	.align	2
	.globl	MusSeqGetCurrentID
	.set	nomips16
	.set	nomicromips
	.ent	MusSeqGetCurrentID
	.type	MusSeqGetCurrentID, @function
MusSeqGetCurrentID:
	.frame	$sp,24,$31		# vars= 0, regs= 1/0, args= 16, gp= 0
	.mask	0x80000000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	addiu	$sp,$sp,-24
	sw	$31,20($sp)
	jal	NAIGetPlayingSeqFlag
	nop

	sll	$2,$2,16
	sra	$2,$2,16
	lw	$31,20($sp)
	jr	$31
	addiu	$sp,$sp,24

	.set	macro
	.set	reorder
	.end	MusSeqGetCurrentID
	.size	MusSeqGetCurrentID, .-MusSeqGetCurrentID
	.align	2
	.globl	MusSeqGetLoopCounter
	.set	nomips16
	.set	nomicromips
	.ent	MusSeqGetLoopCounter
	.type	MusSeqGetLoopCounter, @function
MusSeqGetLoopCounter:
	.frame	$sp,0,$31		# vars= 0, regs= 0/0, args= 0, gp= 0
	.mask	0x00000000,0
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	lui	$3,%hi(SeqPlayer)
	sll	$2,$4,2
	addu	$2,$2,$4
	sll	$2,$2,3
	addu	$4,$2,$4
	sll	$4,$4,3
	addiu	$2,$3,%lo(SeqPlayer)
	addu	$4,$2,$4
	jr	$31
	lw	$2,12($4)

	.set	macro
	.set	reorder
	.end	MusSeqGetLoopCounter
	.size	MusSeqGetLoopCounter, .-MusSeqGetLoopCounter
	.align	2
	.globl	MusSeqLoopImmediately
	.set	nomips16
	.set	nomicromips
	.ent	MusSeqLoopImmediately
	.type	MusSeqLoopImmediately, @function
MusSeqLoopImmediately:
	.frame	$sp,0,$31		# vars= 0, regs= 0/0, args= 0, gp= 0
	.mask	0x00000000,0
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	lui	$3,%hi(SeqPlayer)
	sll	$2,$4,2
	addu	$2,$2,$4
	sll	$2,$2,3
	addu	$4,$2,$4
	sll	$4,$4,3
	addiu	$2,$3,%lo(SeqPlayer)
	addu	$4,$2,$4
	jr	$31
	sw	$0,12($4)

	.set	macro
	.set	reorder
	.end	MusSeqLoopImmediately
	.size	MusSeqLoopImmediately, .-MusSeqLoopImmediately
	.align	2
	.globl	MusChanMute
	.set	nomips16
	.set	nomicromips
	.ent	MusChanMute
	.type	MusChanMute, @function
MusChanMute:
	.frame	$sp,0,$31		# vars= 0, regs= 0/0, args= 0, gp= 0
	.mask	0x00000000,0
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	bne	$6,$0,$L32
	sll	$3,$4,2

	addu	$3,$3,$4
	sll	$3,$3,3
	addu	$4,$3,$4
	sll	$4,$4,1
	addu	$2,$4,$5
	addiu	$2,$2,12
	sll	$2,$2,2
	lui	$3,%hi(SeqPlayer)
	addiu	$3,$3,%lo(SeqPlayer)
	addu	$2,$2,$3
	lw	$3,0($2)
	lw	$2,0($3)
	li	$4,268435456			# 0x10000000
	xor	$2,$2,$4
	jr	$31
	sw	$2,0($3)

$L32:
	addu	$3,$3,$4
	sll	$3,$3,3
	addu	$2,$3,$4
	sll	$2,$2,1
	addu	$2,$2,$5
	addiu	$2,$2,12
	sll	$2,$2,2
	lui	$3,%hi(SeqPlayer)
	addiu	$3,$3,%lo(SeqPlayer)
	addu	$2,$2,$3
	lw	$3,0($2)
	lw	$2,0($3)
	li	$4,268435456			# 0x10000000
	or	$2,$2,$4
	jr	$31
	sw	$2,0($3)

	.set	macro
	.set	reorder
	.end	MusChanMute
	.size	MusChanMute, .-MusChanMute
	.align	2
	.globl	MusChanGetVolume
	.set	nomips16
	.set	nomicromips
	.ent	MusChanGetVolume
	.type	MusChanGetVolume, @function
MusChanGetVolume:
	.frame	$sp,0,$31		# vars= 0, regs= 0/0, args= 0, gp= 0
	.mask	0x00000000,0
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	sll	$2,$4,2
	addu	$2,$2,$4
	sll	$2,$2,3
	addu	$4,$2,$4
	sll	$4,$4,1
	addu	$4,$4,$5
	addiu	$4,$4,12
	sll	$4,$4,2
	lui	$2,%hi(SeqPlayer)
	addiu	$2,$2,%lo(SeqPlayer)
	addu	$4,$4,$2
	lw	$2,0($4)
	jr	$31
	lwc1	$f0,44($2)

	.set	macro
	.set	reorder
	.end	MusChanGetVolume
	.size	MusChanGetVolume, .-MusChanGetVolume
	.align	2
	.globl	MusChanSetVolume
	.set	nomips16
	.set	nomicromips
	.ent	MusChanSetVolume
	.type	MusChanSetVolume, @function
MusChanSetVolume:
	.frame	$sp,0,$31		# vars= 0, regs= 0/0, args= 0, gp= 0
	.mask	0x00000000,0
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	sll	$2,$4,2
	addu	$2,$2,$4
	sll	$2,$2,3
	addu	$4,$2,$4
	sll	$4,$4,1
	addu	$4,$4,$5
	addiu	$4,$4,12
	sll	$4,$4,2
	lui	$2,%hi(SeqPlayer)
	addiu	$2,$2,%lo(SeqPlayer)
	addu	$4,$4,$2
	lw	$2,0($4)
	jr	$31
	sw	$6,44($2)

	.set	macro
	.set	reorder
	.end	MusChanSetVolume
	.size	MusChanSetVolume, .-MusChanSetVolume
	.align	2
	.globl	MusChanGetPitch
	.set	nomips16
	.set	nomicromips
	.ent	MusChanGetPitch
	.type	MusChanGetPitch, @function
MusChanGetPitch:
	.frame	$sp,0,$31		# vars= 0, regs= 0/0, args= 0, gp= 0
	.mask	0x00000000,0
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	sll	$2,$4,2
	addu	$2,$2,$4
	sll	$2,$2,3
	addu	$4,$2,$4
	sll	$4,$4,1
	addu	$4,$4,$5
	addiu	$4,$4,12
	sll	$4,$4,2
	lui	$2,%hi(SeqPlayer)
	addiu	$2,$2,%lo(SeqPlayer)
	addu	$4,$4,$2
	lw	$2,0($4)
	jr	$31
	lwc1	$f0,48($2)

	.set	macro
	.set	reorder
	.end	MusChanGetPitch
	.size	MusChanGetPitch, .-MusChanGetPitch
	.align	2
	.globl	MusChanSetPitch
	.set	nomips16
	.set	nomicromips
	.ent	MusChanSetPitch
	.type	MusChanSetPitch, @function
MusChanSetPitch:
	.frame	$sp,0,$31		# vars= 0, regs= 0/0, args= 0, gp= 0
	.mask	0x00000000,0
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	sll	$2,$4,2
	addu	$2,$2,$4
	sll	$2,$2,3
	addu	$4,$2,$4
	sll	$4,$4,1
	addu	$4,$4,$5
	addiu	$4,$4,12
	sll	$4,$4,2
	lui	$2,%hi(SeqPlayer)
	addiu	$2,$2,%lo(SeqPlayer)
	addu	$4,$4,$2
	lw	$2,0($4)
	jr	$31
	sw	$6,48($2)

	.set	macro
	.set	reorder
	.end	MusChanSetPitch
	.size	MusChanSetPitch, .-MusChanSetPitch
	.ident	"GCC: (GNU) 10.1.0"
