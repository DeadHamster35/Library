	.file	1 "CustomLevels.c"
	.section .mdebug.abi32
	.previous
	.nan	legacy
	.module	fp=32
	.module	nooddspreg
	.text
	.align	2
	.globl	FPS_Check
	.set	nomips16
	.set	nomicromips
	.ent	FPS_Check
	.type	FPS_Check, @function
FPS_Check:
	.frame	$sp,24,$31		# vars= 0, regs= 1/0, args= 16, gp= 0
	.mask	0x80000000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	addiu	$sp,$sp,-24
	sw	$31,20($sp)
	jal	osGetCount
	nop

	lui	$3,%hi(OldCycle.2)
	lw	$4,%lo(OldCycle.2)($3)
	subu	$4,$2,$4
	mtc1	$4,$f0
	bltz	$4,$L9
	cvt.d.w	$f0,$f0

$L2:
	cvt.s.d	$f2,$f0
	lui	$4,%hi($LC1)
	lwc1	$f0,%lo($LC1)($4)
	div.s	$f0,$f0,$f2
	trunc.w.s $f0,$f0
	mfc1	$3,$f0
	nop
	sll	$3,$3,16
	sra	$3,$3,16
	lui	$4,%hi(OldCycle.2)
	sw	$2,%lo(OldCycle.2)($4)
	slt	$2,$3,22
	bne	$2,$0,$L3
	slt	$2,$3,15

	lui	$2,%hi(DynFPSModifier)
	li	$3,2			# 0x2
	sh	$3,%lo(DynFPSModifier)($2)
$L1:
	lw	$31,20($sp)
	jr	$31
	addiu	$sp,$sp,24

$L9:
	lui	$3,%hi($LC0)
	ldc1	$f2,%lo($LC0)($3)
	b	$L2
	add.d	$f0,$f0,$f2

$L3:
	bne	$2,$0,$L5
	slt	$2,$3,11

	lui	$2,%hi(DynFPSModifier)
	li	$3,3			# 0x3
	b	$L1
	sh	$3,%lo(DynFPSModifier)($2)

$L5:
	bne	$2,$0,$L6
	slt	$3,$3,8

	lui	$2,%hi(DynFPSModifier)
	li	$3,4			# 0x4
	b	$L1
	sh	$3,%lo(DynFPSModifier)($2)

$L6:
	bne	$3,$0,$L7
	lui	$2,%hi(DynFPSModifier)

	li	$3,5			# 0x5
	b	$L1
	sh	$3,%lo(DynFPSModifier)($2)

$L7:
	li	$3,6			# 0x6
	b	$L1
	sh	$3,%lo(DynFPSModifier)($2)

	.set	macro
	.set	reorder
	.end	FPS_Check
	.size	FPS_Check, .-FPS_Check
	.align	2
	.globl	DynamicTempo
	.set	nomips16
	.set	nomicromips
	.ent	DynamicTempo
	.type	DynamicTempo, @function
DynamicTempo:
	.frame	$sp,24,$31		# vars= 0, regs= 1/0, args= 16, gp= 0
	.mask	0x80000000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	addiu	$sp,$sp,-24
	sw	$31,20($sp)
	jal	FPS_Check
	nop

	li	$3,604962816			# 0x240f0000
	lui	$2,%hi(asm_tempo1A)
	sw	$3,%lo(asm_tempo1A)($2)
	lui	$2,%hi(DynFPSModifier)
	lh	$2,%lo(DynFPSModifier)($2)
	lui	$4,%hi(asm_tempo1ASpeed)
	sh	$2,%lo(asm_tempo1ASpeed)($4)
	lui	$4,%hi(asm_tempo1B)
	sw	$3,%lo(asm_tempo1B)($4)
	lui	$3,%hi(asm_tempo1BSpeed)
	sh	$2,%lo(asm_tempo1BSpeed)($3)
	li	$3,604569600			# 0x24090000
	lui	$4,%hi(asm_tempo2A)
	sw	$3,%lo(asm_tempo2A)($4)
	lui	$4,%hi(asm_tempo2ASpeed)
	sh	$2,%lo(asm_tempo2ASpeed)($4)
	lui	$4,%hi(asm_tempo2B)
	sw	$3,%lo(asm_tempo2B)($4)
	lui	$3,%hi(asm_tempo2BSpeed)
	sh	$2,%lo(asm_tempo2BSpeed)($3)
	li	$3,604635136			# 0x240a0000
	lui	$4,%hi(asm_tempo3A)
	sw	$3,%lo(asm_tempo3A)($4)
	lui	$4,%hi(asm_tempo3ASpeed)
	sh	$2,%lo(asm_tempo3ASpeed)($4)
	lui	$4,%hi(asm_tempo3B)
	sw	$3,%lo(asm_tempo3B)($4)
	lui	$3,%hi(asm_tempo3BSpeed)
	sh	$2,%lo(asm_tempo3BSpeed)($3)
	lw	$31,20($sp)
	jr	$31
	addiu	$sp,$sp,24

	.set	macro
	.set	reorder
	.end	DynamicTempo
	.size	DynamicTempo, .-DynamicTempo
	.align	2
	.globl	previewRefresh
	.set	nomips16
	.set	nomicromips
	.ent	previewRefresh
	.type	previewRefresh, @function
previewRefresh:
	.frame	$sp,0,$31		# vars= 0, regs= 0/0, args= 0, gp= 0
	.mask	0x00000000,0
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	lui	$2,%hi(g_gameMode)
	lw	$3,%lo(g_gameMode)($2)
	li	$2,3			# 0x3
	beq	$3,$2,$L13
	li	$2,9			# 0x9

	lui	$3,%hi(g_menuPreviewValue1)
	sb	$2,%lo(g_menuPreviewValue1)($3)
	lui	$3,%hi(g_menuPreviewValue2)
	sb	$2,%lo(g_menuPreviewValue2)($3)
	lui	$3,%hi(g_menuPreviewValue3)
	sb	$2,%lo(g_menuPreviewValue3)($3)
	lui	$3,%hi(g_menuPreviewValue4)
	jr	$31
	sb	$2,%lo(g_menuPreviewValue4)($3)

$L13:
	lui	$3,%hi(g_BattlePreviewValue1)
	sb	$2,%lo(g_BattlePreviewValue1)($3)
	lui	$3,%hi(g_BattlePreviewValue2)
	sb	$2,%lo(g_BattlePreviewValue2)($3)
	lui	$3,%hi(g_BattlePreviewValue3)
	sb	$2,%lo(g_BattlePreviewValue3)($3)
	lui	$3,%hi(g_BattlePreviewValue4)
	jr	$31
	sb	$2,%lo(g_BattlePreviewValue4)($3)

	.set	macro
	.set	reorder
	.end	previewRefresh
	.size	previewRefresh, .-previewRefresh
	.align	2
	.globl	copyCourseTable
	.set	nomips16
	.set	nomicromips
	.ent	copyCourseTable
	.type	copyCourseTable, @function
copyCourseTable:
	.frame	$sp,24,$31		# vars= 0, regs= 1/0, args= 16, gp= 0
	.mask	0x80000000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	addiu	$sp,$sp,-24
	sw	$31,20($sp)
	lui	$2,%hi(dataLength)
	li	$3,40			# 0x28
	bne	$4,$0,$L16
	sw	$3,%lo(dataLength)($2)

	lui	$2,%hi(sourceAddress)
	lw	$3,%lo(sourceAddress)($2)
	lui	$2,%hi(ok_CourseTable)
	addiu	$2,$2,%lo(ok_CourseTable)
	sw	$2,0($3)
	lui	$2,%hi(targetAddress)
	lw	$3,%lo(targetAddress)($2)
	lui	$2,%hi(g_CupArray)
	addiu	$2,$2,%lo(g_CupArray)
	sw	$2,0($3)
$L17:
	jal	runRAM
	nop

	lw	$31,20($sp)
	jr	$31
	addiu	$sp,$sp,24

$L16:
	lui	$2,%hi(sourceAddress)
	lw	$3,%lo(sourceAddress)($2)
	lui	$2,%hi(g_CupArray)
	addiu	$2,$2,%lo(g_CupArray)
	sw	$2,0($3)
	lui	$2,%hi(targetAddress)
	lw	$3,%lo(targetAddress)($2)
	lui	$2,%hi(ok_CourseTable)
	addiu	$2,$2,%lo(ok_CourseTable)
	b	$L17
	sw	$2,0($3)

	.set	macro
	.set	reorder
	.end	copyCourseTable
	.size	copyCourseTable, .-copyCourseTable
	.align	2
	.globl	hsTableSet
	.set	nomips16
	.set	nomicromips
	.ent	hsTableSet
	.type	hsTableSet, @function
hsTableSet:
	.frame	$sp,0,$31		# vars= 0, regs= 0/0, args= 0, gp= 0
	.mask	0x00000000,0
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	lui	$2,%hi(g_cup0Array0)
	sh	$0,%lo(g_cup0Array0)($2)
	lui	$2,%hi(g_cup0Array1)
	sh	$0,%lo(g_cup0Array1)($2)
	lui	$2,%hi(g_cup0Array2)
	sh	$0,%lo(g_cup0Array2)($2)
	lui	$2,%hi(g_cup0Array3)
	sh	$0,%lo(g_cup0Array3)($2)
	lui	$2,%hi(g_cup1Array0)
	sh	$0,%lo(g_cup1Array0)($2)
	lui	$2,%hi(g_cup1Array1)
	sh	$0,%lo(g_cup1Array1)($2)
	lui	$2,%hi(g_cup1Array2)
	sh	$0,%lo(g_cup1Array2)($2)
	lui	$2,%hi(g_cup1Array3)
	sh	$0,%lo(g_cup1Array3)($2)
	lui	$2,%hi(g_cup2Array0)
	sh	$0,%lo(g_cup2Array0)($2)
	lui	$2,%hi(g_cup2Array1)
	sh	$0,%lo(g_cup2Array1)($2)
	lui	$2,%hi(g_cup2Array2)
	sh	$0,%lo(g_cup2Array2)($2)
	lui	$2,%hi(g_cup2Array3)
	sh	$0,%lo(g_cup2Array3)($2)
	lui	$2,%hi(g_cup3Array0)
	sh	$0,%lo(g_cup3Array0)($2)
	lui	$2,%hi(g_cup3Array1)
	sh	$0,%lo(g_cup3Array1)($2)
	lui	$2,%hi(g_cup3Array2)
	sh	$0,%lo(g_cup3Array2)($2)
	lui	$2,%hi(g_cup3Array3)
	sh	$0,%lo(g_cup3Array3)($2)
	li	$2,15			# 0xf
	lui	$3,%hi(g_cupBArray0)
	sh	$2,%lo(g_cupBArray0)($3)
	lui	$3,%hi(g_cupBArray1)
	sh	$2,%lo(g_cupBArray1)($3)
	lui	$3,%hi(g_cupBArray2)
	sh	$2,%lo(g_cupBArray2)($3)
	lui	$3,%hi(g_cupBArray3)
	jr	$31
	sh	$2,%lo(g_cupBArray3)($3)

	.set	macro
	.set	reorder
	.end	hsTableSet
	.size	hsTableSet, .-hsTableSet
	.align	2
	.globl	stockASM
	.set	nomips16
	.set	nomicromips
	.ent	stockASM
	.type	stockASM, @function
stockASM:
	.frame	$sp,24,$31		# vars= 0, regs= 2/0, args= 16, gp= 0
	.mask	0x80010000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	addiu	$sp,$sp,-24
	sw	$31,20($sp)
	sw	$16,16($sp)
	li	$8,1008271360			# 0x3c190000
	addiu	$31,$8,1792
	lui	$2,%hi(highpolypipeA)
	sw	$31,%lo(highpolypipeA)($2)
	li	$13,926482432			# 0x37390000
	addiu	$3,$13,2280
	lui	$2,%hi(highpolypipeB)
	sw	$3,%lo(highpolypipeB)($2)
	li	$3,1007288320			# 0x3c0a0000
	addiu	$4,$3,1792
	lui	$2,%hi(lowpolypipeA)
	sw	$4,%lo(lowpolypipeA)($2)
	lui	$4,%hi(lowpolypipeB)
	li	$2,894042112			# 0x354a0000
	addiu	$2,$2,11624
	sw	$2,%lo(lowpolypipeB)($4)
	li	$12,1007550464			# 0x3c0e0000
	addiu	$12,$12,1792
	lui	$2,%hi(uraGrpA)
	sw	$12,%lo(uraGrpA)($2)
	li	$9,902692864			# 0x35ce0000
	addiu	$4,$9,12368
	lui	$2,%hi(uraGrpB)
	sw	$4,%lo(uraGrpB)($2)
	li	$11,1008205824			# 0x3c180000
	addiu	$25,$11,1792
	lui	$2,%hi(bigmushroomA)
	sw	$25,%lo(bigmushroomA)($2)
	li	$6,924319744			# 0x37180000
	addiu	$4,$6,4416
	lui	$2,%hi(bigmushroomB)
	sw	$4,%lo(bigmushroomB)($2)
	li	$7,1006895104			# 0x3c040000
	addiu	$4,$7,1792
	lui	$2,%hi(bigmushroomsurfaceA)
	sw	$4,%lo(bigmushroomsurfaceA)($2)
	li	$2,881065984			# 0x34840000
	addiu	$14,$2,4416
	lui	$5,%hi(bigmushroomsurfaceB)
	sw	$14,%lo(bigmushroomsurfaceB)($5)
	li	$10,1007616000			# 0x3c0f0000
	addiu	$15,$10,1792
	lui	$5,%hi(audienceA)
	sw	$15,%lo(audienceA)($5)
	li	$5,904855552			# 0x35ef0000
	addiu	$16,$5,5280
	lui	$24,%hi(audienceB)
	sw	$16,%lo(audienceB)($24)
	lui	$16,%hi(audienceflagsA)
	li	$24,1007484928			# 0x3c0d0000
	addiu	$24,$24,1792
	sw	$24,%lo(audienceflagsA)($16)
	lui	$16,%hi(audienceflagsB)
	li	$24,900530176			# 0x35ad0000
	addiu	$24,$24,352
	sw	$24,%lo(audienceflagsB)($16)
	lui	$16,%hi(billboard1A)
	li	$24,1007419392			# 0x3c0c0000
	addiu	$24,$24,1792
	sw	$24,%lo(billboard1A)($16)
	lui	$16,%hi(billboard1B)
	li	$24,898367488			# 0x358c0000
	addiu	$24,$24,12864
	sw	$24,%lo(billboard1B)($16)
	lui	$24,%hi(billboard2A)
	sw	$15,%lo(billboard2A)($24)
	addiu	$16,$5,13576
	lui	$24,%hi(billboard2B)
	sw	$16,%lo(billboard2B)($24)
	lui	$24,%hi(billboardpost1A)
	sw	$31,%lo(billboardpost1A)($24)
	addiu	$13,$13,576
	lui	$24,%hi(billboardpost1B)
	sw	$13,%lo(billboardpost1B)($24)
	lui	$13,%hi(billboardpost2A)
	sw	$12,%lo(billboardpost2A)($13)
	addiu	$9,$9,1104
	lui	$12,%hi(billboardpost2B)
	sw	$9,%lo(billboardpost2B)($12)
	lui	$9,%hi(fencesA)
	sw	$25,%lo(fencesA)($9)
	addiu	$6,$6,224
	lui	$9,%hi(fencesB)
	sw	$6,%lo(fencesB)($9)
	addiu	$3,$3,1537
	lui	$6,%hi(bigsignA)
	sw	$3,%lo(bigsignA)($6)
	lui	$6,%hi(bigsignB)
	li	$3,625606656			# 0x254a0000
	ori	$3,$3,0x9330
	sw	$3,%lo(bigsignB)($6)
	addiu	$9,$7,1537
	lui	$3,%hi(itemboxesA)
	sw	$9,%lo(itemboxesA)($3)
	li	$6,612630528			# 0x24840000
	ori	$3,$6,0x9498
	lui	$12,%hi(itemboxesB)
	sw	$3,%lo(itemboxesB)($12)
	addiu	$13,$6,56
	lui	$12,%hi(battleItemBoxesA)
	sw	$13,%lo(battleItemBoxesA)($12)
	lui	$12,%hi(treeslistA)
	sw	$9,%lo(treeslistA)($12)
	addiu	$13,$3,216
	lui	$12,%hi(treeslistB)
	sw	$13,%lo(treeslistB)($12)
	addiu	$11,$11,1536
	lui	$12,%hi(treesdisplayA)
	sw	$11,%lo(treesdisplayA)($12)
	lui	$12,%hi(treesdisplayB)
	li	$11,655884288			# 0x27180000
	addiu	$11,$11,27240
	sw	$11,%lo(treesdisplayB)($12)
	lui	$11,%hi(piranhalistA)
	sw	$9,%lo(piranhalistA)($11)
	addiu	$12,$3,128
	lui	$11,%hi(piranhalistB)
	sw	$12,%lo(piranhalistB)($11)
	addiu	$10,$10,1536
	lui	$11,%hi(piranhadisplayA)
	sw	$10,%lo(piranhadisplayA)($11)
	lui	$11,%hi(piranhadisplayB)
	li	$10,636420096			# 0x25ef0000
	addiu	$10,$10,27024
	sw	$10,%lo(piranhadisplayB)($11)
	addiu	$7,$7,2304
	lui	$10,%hi(sectionviewA)
	sw	$7,%lo(sectionviewA)($10)
	addiu	$6,$6,496
	lui	$7,%hi(sectionviewB)
	sw	$6,%lo(sectionviewB)($7)
	lui	$6,%hi(battleDisplayA)
	sw	$15,%lo(battleDisplayA)($6)
	addiu	$5,$5,5568
	lui	$6,%hi(battleDisplayB)
	sw	$5,%lo(battleDisplayB)($6)
	lui	$5,%hi(battleSurfaceA)
	sw	$4,%lo(battleSurfaceA)($5)
	addiu	$6,$2,5568
	lui	$5,%hi(battleSurfaceB)
	sw	$6,%lo(battleSurfaceB)($5)
	lui	$5,%hi(surfacemapA)
	sw	$9,%lo(surfacemapA)($5)
	addiu	$3,$3,440
	lui	$5,%hi(surfacemapB)
	sw	$3,%lo(surfacemapB)($5)
	addiu	$8,$8,1537
	lui	$3,%hi(unknownA1)
	sw	$8,%lo(unknownA1)($3)
	lui	$3,%hi(unknownB1)
	sw	$4,%lo(unknownB1)($3)
	lui	$3,%hi(unknownC1)
	sw	$4,%lo(unknownC1)($3)
	lui	$3,%hi(unknownD1)
	sw	$4,%lo(unknownD1)($3)
	lui	$4,%hi(unknownA2)
	li	$3,658046976			# 0x27390000
	ori	$3,$3,0x9348
	sw	$3,%lo(unknownA2)($4)
	lui	$3,%hi(unknownB)
	sw	$14,%lo(unknownB)($3)
	addiu	$4,$2,2280
	lui	$3,%hi(unknownC)
	sw	$4,%lo(unknownC)($3)
	addiu	$2,$2,11624
	lui	$3,%hi(unknownD)
	sw	$2,%lo(unknownD)($3)
	lui	$2,%hi(g_pathLength)
	li	$3,600			# 0x258
	sh	$3,%lo(g_pathLength)($2)
	li	$2,100663296			# 0x6000000
	addiu	$4,$2,22448
	lui	$3,%hi(pathOffset)
	sw	$4,%lo(pathOffset)($3)
	addiu	$2,$2,21864
	lui	$3,%hi(pathOffsetB)
	sw	$2,%lo(pathOffsetB)($3)
	lui	$3,%hi(g_mapStartToggle)
	li	$2,201392128			# 0xc010000
	addiu	$2,$2,12980
	sw	$2,%lo(g_mapStartToggle)($3)
	lui	$3,%hi(asm_GPLevelSelect)
	li	$2,-1540554752			# 0xffffffffa42d0000
	ori	$2,$2,0xc5a0
	sw	$2,%lo(asm_GPLevelSelect)($3)
	jal	copyCourseTable
	move	$4,$0

	lw	$31,20($sp)
	lw	$16,16($sp)
	jr	$31
	addiu	$sp,$sp,24

	.set	macro
	.set	reorder
	.end	stockASM
	.size	stockASM, .-stockASM
	.align	2
	.globl	overkartASM
	.set	nomips16
	.set	nomicromips
	.ent	overkartASM
	.type	overkartASM, @function
overkartASM:
	.frame	$sp,24,$31		# vars= 0, regs= 1/0, args= 16, gp= 0
	.mask	0x80000000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	addiu	$sp,$sp,-24
	sw	$31,20($sp)
	li	$3,1008271360			# 0x3c190000
	addiu	$3,$3,1536
	lui	$2,%hi(highpolypipeA)
	sw	$3,%lo(highpolypipeA)($2)
	li	$12,926482432			# 0x37390000
	lui	$2,%hi(highpolypipeB)
	sw	$12,%lo(highpolypipeB)($2)
	li	$4,1007288320			# 0x3c0a0000
	addiu	$4,$4,1536
	lui	$2,%hi(lowpolypipeA)
	sw	$4,%lo(lowpolypipeA)($2)
	lui	$2,%hi(lowpolypipeB)
	li	$5,894042112			# 0x354a0000
	sw	$5,%lo(lowpolypipeB)($2)
	li	$7,1007550464			# 0x3c0e0000
	addiu	$7,$7,1536
	lui	$2,%hi(uraGrpA)
	sw	$7,%lo(uraGrpA)($2)
	li	$11,902692864			# 0x35ce0000
	lui	$2,%hi(uraGrpB)
	sw	$11,%lo(uraGrpB)($2)
	li	$6,1008205824			# 0x3c180000
	addiu	$6,$6,1536
	lui	$2,%hi(bigmushroomA)
	sw	$6,%lo(bigmushroomA)($2)
	li	$10,924319744			# 0x37180000
	lui	$2,%hi(bigmushroomB)
	sw	$10,%lo(bigmushroomB)($2)
	li	$2,1006895104			# 0x3c040000
	addiu	$2,$2,1536
	lui	$5,%hi(bigmushroomsurfaceA)
	sw	$2,%lo(bigmushroomsurfaceA)($5)
	li	$5,881065984			# 0x34840000
	lui	$8,%hi(bigmushroomsurfaceB)
	sw	$5,%lo(bigmushroomsurfaceB)($8)
	li	$8,1007616000			# 0x3c0f0000
	addiu	$8,$8,1536
	lui	$9,%hi(audienceA)
	sw	$8,%lo(audienceA)($9)
	li	$13,904855552			# 0x35ef0000
	lui	$9,%hi(audienceB)
	sw	$13,%lo(audienceB)($9)
	lui	$14,%hi(audienceflagsA)
	li	$9,1007484928			# 0x3c0d0000
	addiu	$9,$9,1536
	sw	$9,%lo(audienceflagsA)($14)
	lui	$9,%hi(audienceflagsB)
	li	$14,900530176			# 0x35ad0000
	sw	$14,%lo(audienceflagsB)($9)
	lui	$14,%hi(billboard1A)
	li	$9,1007419392			# 0x3c0c0000
	addiu	$9,$9,1536
	sw	$9,%lo(billboard1A)($14)
	lui	$9,%hi(billboard1B)
	li	$14,898367488			# 0x358c0000
	sw	$14,%lo(billboard1B)($9)
	lui	$9,%hi(billboard2A)
	sw	$8,%lo(billboard2A)($9)
	lui	$8,%hi(billboard2B)
	sw	$13,%lo(billboard2B)($8)
	lui	$8,%hi(billboardpost1A)
	sw	$3,%lo(billboardpost1A)($8)
	lui	$8,%hi(billboardpost1B)
	sw	$12,%lo(billboardpost1B)($8)
	lui	$8,%hi(billboardpost2A)
	sw	$7,%lo(billboardpost2A)($8)
	lui	$7,%hi(billboardpost2B)
	sw	$11,%lo(billboardpost2B)($7)
	lui	$7,%hi(fencesA)
	sw	$6,%lo(fencesA)($7)
	lui	$6,%hi(fencesB)
	sw	$10,%lo(fencesB)($6)
	lui	$6,%hi(bigsignA)
	sw	$4,%lo(bigsignA)($6)
	lui	$4,%hi(bigsignB)
	li	$6,625606656			# 0x254a0000
	sw	$6,%lo(bigsignB)($4)
	lui	$4,%hi(itemboxesA)
	sw	$2,%lo(itemboxesA)($4)
	li	$4,612630528			# 0x24840000
	addiu	$6,$4,8
	lui	$7,%hi(itemboxesB)
	sw	$6,%lo(itemboxesB)($7)
	lui	$7,%hi(battleItemBoxesA)
	sw	$6,%lo(battleItemBoxesA)($7)
	lui	$6,%hi(treeslistA)
	sw	$2,%lo(treeslistA)($6)
	addiu	$7,$4,528
	lui	$6,%hi(treeslistB)
	sw	$7,%lo(treeslistB)($6)
	lui	$6,%hi(piranhalistA)
	sw	$2,%lo(piranhalistA)($6)
	addiu	$4,$4,1048
	lui	$6,%hi(piranhalistB)
	sw	$4,%lo(piranhalistB)($6)
	lui	$4,%hi(unknownA1)
	sw	$3,%lo(unknownA1)($4)
	lui	$3,%hi(unknownB1)
	sw	$2,%lo(unknownB1)($3)
	lui	$3,%hi(unknownC1)
	sw	$2,%lo(unknownC1)($3)
	lui	$3,%hi(unknownD1)
	sw	$2,%lo(unknownD1)($3)
	lui	$2,%hi(unknownA2)
	li	$3,658046976			# 0x27390000
	sw	$3,%lo(unknownA2)($2)
	lui	$2,%hi(unknownB)
	sw	$5,%lo(unknownB)($2)
	lui	$2,%hi(unknownC)
	sw	$5,%lo(unknownC)($2)
	lui	$2,%hi(unknownD)
	sw	$5,%lo(unknownD)($2)
	lui	$2,%hi(g_mapStartToggle)
	sw	$0,%lo(g_mapStartToggle)($2)
	jal	copyCourseTable
	li	$4,1			# 0x1

	lui	$2,%hi(g_cup0Array0)
	sh	$0,%lo(g_cup0Array0)($2)
	lui	$2,%hi(g_cup0Array1)
	li	$3,1			# 0x1
	sh	$3,%lo(g_cup0Array1)($2)
	lui	$2,%hi(g_cup0Array2)
	li	$3,2			# 0x2
	sh	$3,%lo(g_cup0Array2)($2)
	lui	$2,%hi(g_cup0Array3)
	li	$3,3			# 0x3
	sh	$3,%lo(g_cup0Array3)($2)
	lui	$2,%hi(g_cup1Array0)
	li	$3,4			# 0x4
	sh	$3,%lo(g_cup1Array0)($2)
	lui	$2,%hi(g_cup1Array1)
	li	$3,5			# 0x5
	sh	$3,%lo(g_cup1Array1)($2)
	lui	$2,%hi(g_cup1Array2)
	li	$3,6			# 0x6
	sh	$3,%lo(g_cup1Array2)($2)
	lui	$2,%hi(g_cup1Array3)
	li	$3,7			# 0x7
	sh	$3,%lo(g_cup1Array3)($2)
	lui	$2,%hi(g_cup2Array0)
	li	$3,8			# 0x8
	sh	$3,%lo(g_cup2Array0)($2)
	lui	$2,%hi(g_cup2Array1)
	li	$3,9			# 0x9
	sh	$3,%lo(g_cup2Array1)($2)
	lui	$2,%hi(g_cup2Array2)
	li	$3,10			# 0xa
	sh	$3,%lo(g_cup2Array2)($2)
	lui	$2,%hi(g_cup2Array3)
	li	$3,11			# 0xb
	sh	$3,%lo(g_cup2Array3)($2)
	lui	$2,%hi(g_cup3Array0)
	li	$3,12			# 0xc
	sh	$3,%lo(g_cup3Array0)($2)
	lui	$2,%hi(g_cup3Array1)
	li	$3,13			# 0xd
	sh	$3,%lo(g_cup3Array1)($2)
	lui	$2,%hi(g_cup3Array2)
	li	$3,14			# 0xe
	sh	$3,%lo(g_cup3Array2)($2)
	lui	$2,%hi(g_cup3Array3)
	li	$3,15			# 0xf
	sh	$3,%lo(g_cup3Array3)($2)
	lui	$2,%hi(g_cupBArray0)
	li	$3,16			# 0x10
	sh	$3,%lo(g_cupBArray0)($2)
	lui	$2,%hi(g_cupBArray1)
	li	$3,17			# 0x11
	sh	$3,%lo(g_cupBArray1)($2)
	lui	$2,%hi(g_cupBArray2)
	li	$3,18			# 0x12
	sh	$3,%lo(g_cupBArray2)($2)
	lui	$2,%hi(g_cupBArray3)
	li	$3,19			# 0x13
	sh	$3,%lo(g_cupBArray3)($2)
	lui	$3,%hi(asm_GPLevelSelect)
	li	$2,-1541406720			# 0xffffffffa4200000
	ori	$2,$2,0xc5a0
	sw	$2,%lo(asm_GPLevelSelect)($3)
	lw	$31,20($sp)
	jr	$31
	addiu	$sp,$sp,24

	.set	macro
	.set	reorder
	.end	overkartASM
	.size	overkartASM, .-overkartASM
	.align	2
	.globl	setSong
	.set	nomips16
	.set	nomicromips
	.ent	setSong
	.type	setSong, @function
setSong:
	.frame	$sp,32,$31		# vars= 0, regs= 3/0, args= 16, gp= 0
	.mask	0x80030000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	addiu	$sp,$sp,-32
	sw	$31,28($sp)
	sw	$17,24($sp)
	sw	$16,20($sp)
	lui	$2,%hi(HotSwapID)
	lh	$2,%lo(HotSwapID)($2)
	blez	$2,$L25
	lui	$2,%hi(OverKartHeader)

	lw	$3,%lo(OverKartHeader)($2)
	li	$2,-1			# 0xffffffffffffffff
	beq	$3,$2,$L25
	lui	$2,%hi(OverKartHeader+128)

	lw	$2,%lo(OverKartHeader+128)($2)
	sltu	$3,$2,80
	beq	$3,$0,$L26
	lui	$3,%hi(songID)

	sh	$2,%lo(songID)($3)
	lui	$2,%hi(dataLength)
	li	$3,8			# 0x8
	sw	$3,%lo(dataLength)($2)
	lui	$17,%hi(sourceAddress)
	lw	$3,%lo(sourceAddress)($17)
	lui	$2,%hi(ok_Sequence)
	addiu	$2,$2,%lo(ok_Sequence)
	sw	$2,0($3)
	lui	$16,%hi(targetAddress)
	lw	$3,%lo(targetAddress)($16)
	lui	$2,%hi(g_SequenceTable+28)
	addiu	$2,$2,%lo(g_SequenceTable+28)
	jal	runRAM
	sw	$2,0($3)

	lw	$3,%lo(sourceAddress)($17)
	lui	$2,%hi(ok_Instrument)
	addiu	$2,$2,%lo(ok_Instrument)
	sw	$2,0($3)
	lw	$3,%lo(targetAddress)($16)
	lui	$2,%hi(g_InstrumentTable+28)
	addiu	$2,$2,%lo(g_InstrumentTable+28)
	jal	runRAM
	sw	$2,0($3)

	b	$L29
	lw	$31,28($sp)

$L26:
	li	$4,3			# 0x3
	sh	$4,%lo(songID)($3)
	lui	$17,%hi(sourceAddress)
	lw	$3,%lo(sourceAddress)($17)
	sw	$2,0($3)
	lui	$2,%hi(dataLength)
	li	$3,8			# 0x8
	sw	$3,%lo(dataLength)($2)
	lui	$16,%hi(targetAddress)
	lw	$3,%lo(targetAddress)($16)
	lui	$2,%hi(g_SequenceTable+28)
	addiu	$2,$2,%lo(g_SequenceTable+28)
	jal	runDMA
	sw	$2,0($3)

	lw	$3,%lo(sourceAddress)($17)
	lw	$2,0($3)
	addiu	$2,$2,8
	sw	$2,0($3)
	lw	$3,%lo(targetAddress)($16)
	lui	$2,%hi(g_InstrumentTable+28)
	addiu	$2,$2,%lo(g_InstrumentTable+28)
	jal	runDMA
	sw	$2,0($3)

	b	$L29
	lw	$31,28($sp)

$L25:
	lui	$2,%hi(songID)
	li	$3,3			# 0x3
	sh	$3,%lo(songID)($2)
	lui	$17,%hi(sourceAddress)
	lw	$3,%lo(sourceAddress)($17)
	lui	$2,%hi(ok_Sequence)
	addiu	$2,$2,%lo(ok_Sequence)
	sw	$2,0($3)
	lui	$2,%hi(dataLength)
	li	$3,8			# 0x8
	sw	$3,%lo(dataLength)($2)
	lui	$16,%hi(targetAddress)
	lw	$3,%lo(targetAddress)($16)
	lui	$2,%hi(g_SequenceTable+28)
	addiu	$2,$2,%lo(g_SequenceTable+28)
	jal	runRAM
	sw	$2,0($3)

	lw	$3,%lo(sourceAddress)($17)
	lui	$2,%hi(ok_Instrument)
	addiu	$2,$2,%lo(ok_Instrument)
	sw	$2,0($3)
	lw	$3,%lo(targetAddress)($16)
	lui	$2,%hi(g_InstrumentTable+28)
	addiu	$2,$2,%lo(g_InstrumentTable+28)
	jal	runRAM
	sw	$2,0($3)

	lw	$31,28($sp)
$L29:
	lw	$17,24($sp)
	lw	$16,20($sp)
	jr	$31
	addiu	$sp,$sp,32

	.set	macro
	.set	reorder
	.end	setSong
	.size	setSong, .-setSong
	.align	2
	.globl	SetGhostData
	.set	nomips16
	.set	nomicromips
	.ent	SetGhostData
	.type	SetGhostData, @function
SetGhostData:
	.frame	$sp,32,$31		# vars= 0, regs= 4/0, args= 16, gp= 0
	.mask	0x80070000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	lui	$2,%hi(HotSwapID)
	lh	$2,%lo(HotSwapID)($2)
	blez	$2,$L42
	lui	$2,%hi(OverKartHeader)

	lw	$3,%lo(OverKartHeader)($2)
	li	$2,-1			# 0xffffffffffffffff
	beq	$3,$2,$L42
	lui	$2,%hi(g_gameMode)

	lw	$3,%lo(g_gameMode)($2)
	li	$2,1			# 0x1
	bne	$3,$2,$L42
	lui	$2,%hi(OverKartHeader+84)

	lw	$2,%lo(OverKartHeader+84)($2)
	bne	$2,$0,$L40
	li	$3,16711680			# 0xff0000

	lui	$2,%hi(KeystockBuffer)
	addiu	$2,$2,%lo(KeystockBuffer)
	addiu	$4,$2,256
	sw	$3,0($2)
$L41:
	addiu	$2,$2,4
	bnel	$2,$4,$L41
	sw	$3,0($2)

$L42:
	jr	$31
	nop

$L40:
	addiu	$sp,$sp,-32
	sw	$31,28($sp)
	sw	$18,24($sp)
	sw	$17,20($sp)
	sw	$16,16($sp)
	lui	$18,%hi(sourceAddress)
	lw	$3,%lo(sourceAddress)($18)
	sw	$2,0($3)
	lui	$17,%hi(targetAddress)
	lw	$2,%lo(targetAddress)($17)
	lui	$16,%hi(ok_FreeSpace)
	addiu	$16,$16,%lo(ok_FreeSpace)
	sw	$16,0($2)
	lui	$2,%hi(dataLength)
	li	$3,15360			# 0x3c00
	jal	runDMA
	sw	$3,%lo(dataLength)($2)

	lw	$2,%lo(sourceAddress)($18)
	sw	$16,0($2)
	lw	$2,%lo(targetAddress)($17)
	lui	$16,%hi(KeystockBuffer)
	addiu	$3,$16,%lo(KeystockBuffer)
	jal	runMIO
	sw	$3,0($2)

	lw	$2,%lo(KeystockBuffer)($16)
	li	$3,16711680			# 0xff0000
	and	$2,$2,$3
	lui	$3,%hi(KeystockCounter)
	sw	$2,%lo(KeystockCounter)($3)
	lw	$31,28($sp)
	lw	$18,24($sp)
	lw	$17,20($sp)
	lw	$16,16($sp)
	jr	$31
	addiu	$sp,$sp,32

	.set	macro
	.set	reorder
	.end	SetGhostData
	.size	SetGhostData, .-SetGhostData
	.align	2
	.globl	setPath
	.set	nomips16
	.set	nomicromips
	.ent	setPath
	.type	setPath, @function
setPath:
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
	lui	$2,%hi(HotSwapID)
	lh	$2,%lo(HotSwapID)($2)
	blez	$2,$L44
	lui	$2,%hi(OverKartHeader)

	lw	$3,%lo(OverKartHeader)($2)
	li	$2,-1			# 0xffffffffffffffff
	beq	$3,$2,$L44
	lui	$2,%hi(OverKartHeader)

	addiu	$2,$2,%lo(OverKartHeader)
	lh	$4,132($2)
	lui	$3,%hi(g_pathLength)
	sh	$4,%lo(g_pathLength)($3)
	addiu	$3,$3,%lo(g_pathLength)
	lhu	$5,134($2)
	sh	$5,2($3)
	lhu	$5,136($2)
	sh	$5,4($3)
	lhu	$5,138($2)
	sh	$5,6($3)
	lui	$3,%hi(g_pathBLength)
	sh	$4,%lo(g_pathBLength)($3)
	lui	$3,%hi(sourceAddress)
	lw	$3,%lo(sourceAddress)($3)
	lw	$2,156($2)
	sw	$2,0($3)
	lui	$2,%hi(dataLength)
	li	$3,16			# 0x10
	sw	$3,%lo(dataLength)($2)
	lui	$2,%hi(g_gameMode)
	lw	$3,%lo(g_gameMode)($2)
	li	$2,3			# 0x3
	beq	$3,$2,$L45
	lui	$2,%hi(targetAddress)

	lw	$2,%lo(targetAddress)($2)
	lui	$16,%hi(pathOffset)
	addiu	$3,$16,%lo(pathOffset)
	jal	runDMA
	sw	$3,0($2)

	lui	$2,%hi(OverKartHeader+132)
	lh	$2,%lo(OverKartHeader+132)($2)
	addiu	$2,$2,1
	sll	$2,$2,3
	lw	$3,%lo(pathOffset)($16)
	addu	$2,$2,$3
	lui	$3,%hi(pathOffsetB)
	sw	$2,%lo(pathOffsetB)($3)
	lui	$17,%hi(g_pathBLength)
	b	$L46
	addiu	$17,$17,%lo(g_pathBLength)

$L45:
	lw	$3,%lo(targetAddress)($2)
	lui	$2,%hi(pathOffsetBlock)
	addiu	$2,$2,%lo(pathOffsetBlock)
	jal	runDMA
	sw	$2,0($3)

	lui	$17,%hi(g_pathBLength)
	b	$L46
	addiu	$17,$17,%lo(g_pathBLength)

$L44:
	lui	$2,%hi(g_pathLength)
	li	$3,600			# 0x258
	sh	$3,%lo(g_pathLength)($2)
	lui	$2,%hi(sourceAddress)
	lw	$3,%lo(sourceAddress)($2)
	li	$2,851968			# 0xd0000
	ori	$2,$2,0xd380
	sw	$2,0($3)
	lui	$2,%hi(targetAddress)
	lw	$3,%lo(targetAddress)($2)
	lui	$2,%hi(pathOffsetB)
	addiu	$2,$2,%lo(pathOffsetB)
	sw	$2,0($3)
	lui	$2,%hi(dataLength)
	li	$3,16			# 0x10
	jal	runDMA
	sw	$3,%lo(dataLength)($2)

	lui	$2,%hi(g_gameMode)
	lw	$3,%lo(g_gameMode)($2)
	li	$2,3			# 0x3
	beq	$3,$2,$L47
	lui	$2,%hi(sourceAddress)

	lw	$3,%lo(sourceAddress)($2)
	li	$2,851968			# 0xd0000
	ori	$2,$2,0xd4d0
	sw	$2,0($3)
	lui	$2,%hi(targetAddress)
	lw	$3,%lo(targetAddress)($2)
	lui	$2,%hi(pathOffset)
	addiu	$2,$2,%lo(pathOffset)
	sw	$2,0($3)
$L48:
	jal	runDMA
	lui	$17,%hi(g_pathLength)

	addiu	$17,$17,%lo(g_pathLength)
$L46:
	lui	$2,%hi(OverKartHeader+71)
	lb	$2,%lo(OverKartHeader+71)($2)
	slt	$2,$2,2
	bne	$2,$0,$L43
	lui	$18,%hi(pathOffset+4)

	addiu	$18,$18,%lo(pathOffset+4)
	addiu	$17,$17,2
	li	$16,1			# 0x1
	lui	$19,%hi(OverKartHeader)
	addiu	$19,$19,%lo(OverKartHeader)
$L50:
	jal	GetRealAddress
	lw	$4,0($18)

	sll	$6,$16,24
	sra	$6,$6,24
	lh	$5,0($17)
	jal	MakeAlternativePath
	move	$4,$2

	addiu	$16,$16,1
	addiu	$18,$18,4
	lb	$2,71($19)
	slt	$2,$16,$2
	bne	$2,$0,$L50
	addiu	$17,$17,2

$L43:
	lw	$31,36($sp)
	lw	$19,32($sp)
	lw	$18,28($sp)
	lw	$17,24($sp)
	lw	$16,20($sp)
	jr	$31
	addiu	$sp,$sp,40

$L47:
	lw	$3,%lo(sourceAddress)($2)
	li	$2,851968			# 0xd0000
	ori	$2,$2,0xd5c0
	sw	$2,0($3)
	lui	$2,%hi(targetAddress)
	lw	$3,%lo(targetAddress)($2)
	lui	$2,%hi(pathOffsetBlock)
	addiu	$2,$2,%lo(pathOffsetBlock)
	b	$L48
	sw	$2,0($3)

	.set	macro
	.set	reorder
	.end	setPath
	.size	setPath, .-setPath
	.align	2
	.globl	setWater
	.set	nomips16
	.set	nomicromips
	.ent	setWater
	.type	setWater, @function
setWater:
	.frame	$sp,0,$31		# vars= 0, regs= 0/0, args= 0, gp= 0
	.mask	0x00000000,0
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	lui	$2,%hi(HotSwapID)
	lh	$2,%lo(HotSwapID)($2)
	blez	$2,$L55
	lui	$2,%hi(OverKartHeader+142)

	lh	$2,%lo(OverKartHeader+142)($2)
	mtc1	$2,$f0
	nop
	cvt.s.w	$f0,$f0
	lui	$2,%hi(g_waterHeight)
	swc1	$f0,%lo(g_waterHeight)($2)
$L55:
	jr	$31
	nop

	.set	macro
	.set	reorder
	.end	setWater
	.size	setWater, .-setWater
	.align	2
	.globl	CheckEcho
	.set	nomips16
	.set	nomicromips
	.ent	CheckEcho
	.type	CheckEcho, @function
CheckEcho:
	.frame	$sp,0,$31		# vars= 0, regs= 0/0, args= 0, gp= 0
	.mask	0x00000000,0
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	jr	$31
	nop

	.set	macro
	.set	reorder
	.end	CheckEcho
	.size	CheckEcho, .-CheckEcho
	.align	2
	.globl	setEcho
	.set	nomips16
	.set	nomicromips
	.ent	setEcho
	.type	setEcho, @function
setEcho:
	.frame	$sp,24,$31		# vars= 0, regs= 2/0, args= 16, gp= 0
	.mask	0x80010000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	lui	$2,%hi(HotSwapID)
	lh	$2,%lo(HotSwapID)($2)
	blez	$2,$L58
	lui	$2,%hi(OverKartHeader)

	lw	$3,%lo(OverKartHeader)($2)
	li	$2,-1			# 0xffffffffffffffff
	bne	$3,$2,$L64
	lui	$2,%hi(OverKartHeader)

$L58:
	lui	$2,%hi(OverKartRAMHeader+4)
	sw	$0,%lo(OverKartRAMHeader+4)($2)
	lui	$2,%hi(g_EchoStart)
	li	$3,411			# 0x19b
	sh	$3,%lo(g_EchoStart)($2)
	lui	$2,%hi(g_EchoStop)
	li	$3,441			# 0x1b9
	jr	$31
	sh	$3,%lo(g_EchoStop)($2)

$L64:
	addiu	$sp,$sp,-24
	sw	$31,20($sp)
	sw	$16,16($sp)
	lui	$16,%hi(OverKartRAMHeader)
	addiu	$16,$16,%lo(OverKartRAMHeader)
	sw	$0,4($16)
	addiu	$2,$2,%lo(OverKartHeader)
	lw	$4,112($2)
	lw	$5,116($2)
	subu	$5,$5,$4
	lui	$2,%hi(GlobalUIntA)
	jal	LoadOKData
	sw	$5,%lo(GlobalUIntA)($2)

	sw	$2,4($16)
	lui	$2,%hi(g_EchoStart)
	sh	$0,%lo(g_EchoStart)($2)
	lui	$2,%hi(g_EchoStop)
	sh	$0,%lo(g_EchoStop)($2)
	lw	$31,20($sp)
	lw	$16,16($sp)
	jr	$31
	addiu	$sp,$sp,24

	.set	macro
	.set	reorder
	.end	setEcho
	.size	setEcho, .-setEcho
	.align	2
	.globl	SetWeatherType
	.set	nomips16
	.set	nomicromips
	.ent	SetWeatherType
	.type	SetWeatherType, @function
SetWeatherType:
	.frame	$sp,0,$31		# vars= 0, regs= 0/0, args= 0, gp= 0
	.mask	0x00000000,0
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	li	$2,1			# 0x1
	beq	$4,$2,$L75
	lui	$2,%hi(A4Snow)

	addiu	$2,$2,%lo(A4Snow)
	lui	$3,%hi(g_SnowParticleTex)
	addiu	$3,$3,%lo(g_SnowParticleTex)
	addiu	$5,$2,144
$L69:
	lw	$4,0($2)
	sw	$4,0($3)
	addiu	$2,$2,4
	bne	$2,$5,$L69
	addiu	$3,$3,4

	lui	$2,%hi(HotSwapID)
$L76:
	lh	$2,%lo(HotSwapID)($2)
	bne	$2,$0,$L77
	lui	$2,%hi(A4Snow)

	addiu	$2,$2,%lo(A4Snow)
	lui	$3,%hi(g_SnowParticleTex)
	addiu	$3,$3,%lo(g_SnowParticleTex)
	addiu	$5,$2,144
$L71:
	lw	$4,0($2)
	sw	$4,0($3)
	addiu	$2,$2,4
	bne	$2,$5,$L71
	addiu	$3,$3,4

$L77:
	jr	$31
	nop

$L75:
	lui	$2,%hi(A4Rain)
	addiu	$2,$2,%lo(A4Rain)
	lui	$3,%hi(g_SnowParticleTex)
	addiu	$3,$3,%lo(g_SnowParticleTex)
	addiu	$5,$2,144
$L67:
	lw	$4,0($2)
	sw	$4,0($3)
	addiu	$2,$2,4
	bne	$2,$5,$L67
	addiu	$3,$3,4

	b	$L76
	lui	$2,%hi(HotSwapID)

	.set	macro
	.set	reorder
	.end	SetWeatherType
	.size	SetWeatherType, .-SetWeatherType
	.align	2
	.globl	SetCloudType
	.set	nomips16
	.set	nomicromips
	.ent	SetCloudType
	.type	SetCloudType, @function
SetCloudType:
	.frame	$sp,0,$31		# vars= 0, regs= 0/0, args= 0, gp= 0
	.mask	0x00000000,0
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	lui	$2,%hi(g_InGame)
	lb	$2,%lo(g_InGame)($2)
	beq	$2,$0,$L85
	lui	$2,%hi(HotSwapID)

	li	$2,2			# 0x2
	beq	$4,$2,$L80
	li	$2,3			# 0x3

	beq	$4,$2,$L81
	lui	$2,%hi(CloudCourseID)

	beq	$4,$0,$L84
	li	$3,2			# 0x2

	b	$L79
	sh	$0,%lo(CloudCourseID)($2)

$L84:
	sh	$3,%lo(CloudCourseID)($2)
$L79:
	lui	$2,%hi(HotSwapID)
$L85:
	lh	$2,%lo(HotSwapID)($2)
	bne	$2,$0,$L86
	lui	$2,%hi(g_courseID)

	lhu	$3,%lo(g_courseID)($2)
	lui	$2,%hi(CloudCourseID)
	sh	$3,%lo(CloudCourseID)($2)
$L86:
	jr	$31
	nop

$L80:
	lui	$2,%hi(CloudCourseID)
	li	$3,14			# 0xe
	b	$L79
	sh	$3,%lo(CloudCourseID)($2)

$L81:
	li	$3,5			# 0x5
	b	$L79
	sh	$3,%lo(CloudCourseID)($2)

	.set	macro
	.set	reorder
	.end	SetCloudType
	.size	SetCloudType, .-SetCloudType
	.align	2
	.globl	Snow3DTrigger
	.set	nomips16
	.set	nomicromips
	.ent	Snow3DTrigger
	.type	Snow3DTrigger, @function
Snow3DTrigger:
	.frame	$sp,0,$31		# vars= 0, regs= 0/0, args= 0, gp= 0
	.mask	0x00000000,0
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	lui	$2,%hi(Snow3DCourseID)
	lh	$3,%lo(Snow3DCourseID)($2)
	li	$2,5			# 0x5
	beq	$3,$2,$L89
	lui	$3,%hi(g_3DSnowSpawnHeight)

	jr	$31
	nop

$L89:
	lw	$2,%lo(g_3DSnowSpawnHeight)($3)
	li	$4,-65536			# 0xffffffffffff0000
	and	$2,$2,$4
	addiu	$2,$2,45
	and	$2,$2,$4
	addiu	$2,$2,45
	jr	$31
	sw	$2,%lo(g_3DSnowSpawnHeight)($3)

	.set	macro
	.set	reorder
	.end	Snow3DTrigger
	.size	Snow3DTrigger, .-Snow3DTrigger
	.align	2
	.globl	SetWeather3D
	.set	nomips16
	.set	nomicromips
	.ent	SetWeather3D
	.type	SetWeather3D, @function
SetWeather3D:
	.frame	$sp,24,$31		# vars= 0, regs= 1/0, args= 16, gp= 0
	.mask	0x80000000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	lui	$2,%hi(currentMenu)
	lw	$3,%lo(currentMenu)($2)
	li	$2,37			# 0x25
	beq	$3,$2,$L92
	lui	$2,%hi(g_fadeOutCounter)

	lh	$3,%lo(g_fadeOutCounter)($2)
	li	$2,1			# 0x1
	beq	$3,$2,$L106
	lui	$2,%hi(HotSwapID)

	beq	$4,$0,$L105
	lui	$2,%hi(g_courseID)

	lui	$2,%hi(HotSwapID)
	lh	$2,%lo(HotSwapID)($2)
	bgtzl	$2,$L107
	lui	$2,%hi(g_startingIndicator)

	b	$L105
	lui	$2,%hi(g_courseID)

$L92:
	lui	$2,%hi(HotSwapID)
$L106:
	lh	$2,%lo(HotSwapID)($2)
	blez	$2,$L94
	lui	$2,%hi(Snow3DCourseID)

	addiu	$2,$2,%lo(Snow3DCourseID)
	srl	$8,$2,16
	lui	$3,%hi(Snow3DAllocMapCheck1)
	lw	$6,%lo(Snow3DAllocMapCheck1)($3)
	li	$7,-65536			# 0xffffffffffff0000
	and	$6,$6,$7
	addu	$6,$6,$8
	sw	$6,%lo(Snow3DAllocMapCheck1)($3)
	andi	$2,$2,0xffff
	lui	$3,%hi(Snow3DAllocMapCheck2)
	lw	$6,%lo(Snow3DAllocMapCheck2)($3)
	and	$6,$6,$7
	or	$6,$6,$2
	sw	$6,%lo(Snow3DAllocMapCheck2)($3)
	lui	$3,%hi(Snow3DDisplayAfterMapCheck1)
	lw	$5,%lo(Snow3DDisplayAfterMapCheck1)($3)
	and	$5,$5,$7
	addu	$5,$5,$8
	sw	$5,%lo(Snow3DDisplayAfterMapCheck1)($3)
	lui	$5,%hi(Snow3DDisplayAfterMapCheck2)
	lw	$3,%lo(Snow3DDisplayAfterMapCheck2)($5)
	and	$3,$3,$7
	or	$2,$3,$2
	sw	$2,%lo(Snow3DDisplayAfterMapCheck2)($5)
	lui	$3,%hi(g_skySnowHitGoal)
	li	$2,201457664			# 0xc020000
	addiu	$2,$2,7068
	beq	$4,$0,$L96
	sw	$2,%lo(g_skySnowHitGoal)($3)

	lui	$2,%hi(g_startingIndicator)
$L107:
	lw	$2,%lo(g_startingIndicator)($2)
	sltu	$2,$2,5
	beq	$2,$0,$L108
	lui	$2,%hi(Snow3DCourseID)

	lui	$2,%hi(g_gamePausedFlag)
	lb	$2,%lo(g_gamePausedFlag)($2)
	bne	$2,$0,$L108
	lui	$2,%hi(Snow3DCourseID)

	lui	$2,%hi(g_playerCount)
	lw	$3,%lo(g_playerCount)($2)
	li	$2,1			# 0x1
	beq	$3,$2,$L104
	lui	$2,%hi(Snow3DCourseID)

$L108:
	li	$3,5			# 0x5
	jr	$31
	sh	$3,%lo(Snow3DCourseID)($2)

$L94:
	lui	$2,%hi(g_courseID)
	addiu	$2,$2,%lo(g_courseID)
	srl	$4,$2,16
	addiu	$3,$4,1
	lui	$4,%hi(Snow3DAllocMapCheck1)
	lw	$5,%lo(Snow3DAllocMapCheck1)($4)
	li	$6,-65536			# 0xffffffffffff0000
	and	$5,$5,$6
	addu	$5,$5,$3
	sw	$5,%lo(Snow3DAllocMapCheck1)($4)
	andi	$2,$2,0xffff
	lui	$4,%hi(Snow3DAllocMapCheck2)
	lw	$5,%lo(Snow3DAllocMapCheck2)($4)
	and	$5,$5,$6
	or	$5,$5,$2
	sw	$5,%lo(Snow3DAllocMapCheck2)($4)
	lui	$5,%hi(Snow3DDisplayAfterMapCheck1)
	lw	$4,%lo(Snow3DDisplayAfterMapCheck1)($5)
	and	$4,$4,$6
	addu	$4,$4,$3
	sw	$4,%lo(Snow3DDisplayAfterMapCheck1)($5)
	lui	$4,%hi(Snow3DDisplayAfterMapCheck2)
	lw	$3,%lo(Snow3DDisplayAfterMapCheck2)($4)
	and	$3,$3,$6
	or	$2,$3,$2
	sw	$2,%lo(Snow3DDisplayAfterMapCheck2)($4)
	lui	$3,%hi(g_skySnowHitGoal)
	li	$2,201457664			# 0xc020000
	addiu	$2,$2,7157
	sw	$2,%lo(g_skySnowHitGoal)($3)
$L96:
	lui	$2,%hi(g_courseID)
$L105:
	lhu	$3,%lo(g_courseID)($2)
	lui	$2,%hi(Snow3DCourseID)
	jr	$31
	sh	$3,%lo(Snow3DCourseID)($2)

$L104:
	addiu	$sp,$sp,-24
	sw	$31,20($sp)
	jal	KWChartSnow
	nop

	jal	Snow3DTrigger
	nop

	lui	$2,%hi(Snow3DCourseID)
	li	$3,5			# 0x5
	sh	$3,%lo(Snow3DCourseID)($2)
	lw	$31,20($sp)
	jr	$31
	addiu	$sp,$sp,24

	.set	macro
	.set	reorder
	.end	SetWeather3D
	.size	SetWeather3D, .-SetWeather3D
	.align	2
	.globl	SnowCustomCheck
	.set	nomips16
	.set	nomicromips
	.ent	SnowCustomCheck
	.type	SnowCustomCheck, @function
SnowCustomCheck:
	.frame	$sp,0,$31		# vars= 0, regs= 0/0, args= 0, gp= 0
	.mask	0x00000000,0
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	lui	$2,%hi(g_DynamicObjects)
	sll	$3,$4,3
	subu	$3,$3,$4
	sll	$3,$3,5
	addiu	$2,$2,%lo(g_DynamicObjects)
	addu	$2,$2,$3
	lwc1	$f2,8($2)
	cvt.d.s	$f2,$f2
	lui	$2,%hi(GlobalPlayer+24)
	lwc1	$f0,%lo(GlobalPlayer+24)($2)
	cvt.d.s	$f0,$f0
	lui	$2,%hi($LC2)
	ldc1	$f4,%lo($LC2)($2)
	sub.d	$f4,$f0,$f4
	c.le.d	$f2,$f4
	nop
	bc1t	$L113
	lui	$2,%hi(g_DynamicObjects)

	lui	$2,%hi($LC3)
	ldc1	$f4,%lo($LC3)($2)
	add.d	$f0,$f0,$f4
	c.le.d	$f0,$f2
	nop
	bc1f	$L114
	lui	$2,%hi(g_DynamicObjects)

$L113:
	sll	$3,$4,3
	subu	$4,$3,$4
	sll	$3,$4,5
	addiu	$4,$2,%lo(g_DynamicObjects)
	addu	$4,$4,$3
	li	$2,1			# 0x1
	sh	$2,166($4)
$L114:
	jr	$31
	nop

	.set	macro
	.set	reorder
	.end	SnowCustomCheck
	.size	SnowCustomCheck, .-SnowCustomCheck
	.align	2
	.globl	KWChart_Kumo_Hook
	.set	nomips16
	.set	nomicromips
	.ent	KWChart_Kumo_Hook
	.type	KWChart_Kumo_Hook, @function
KWChart_Kumo_Hook:
	.frame	$sp,32,$31		# vars= 0, regs= 3/0, args= 16, gp= 0
	.mask	0x80030000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	addiu	$sp,$sp,-32
	sw	$31,28($sp)
	sw	$17,24($sp)
	sw	$16,20($sp)
	lui	$2,%hi(HotSwapID)
	lh	$2,%lo(HotSwapID)($2)
	blez	$2,$L116
	lui	$17,%hi(GlobalShortA)

	lui	$16,%hi(g_courseID)
	lhu	$2,%lo(g_courseID)($16)
	sh	$2,%lo(GlobalShortA)($17)
	lui	$2,%hi(CloudCourseID)
	lhu	$2,%lo(CloudCourseID)($2)
	jal	KWChart_Kumo
	sh	$2,%lo(g_courseID)($16)

	lhu	$2,%lo(GlobalShortA)($17)
	sh	$2,%lo(g_courseID)($16)
	lui	$2,%hi(OverKartHeader+69)
$L124:
	lb	$2,%lo(OverKartHeader+69)($2)
	beq	$2,$0,$L115
	lui	$2,%hi(CloudCount1P)

	lw	$8,%lo(CloudCount1P)($2)
	lui	$2,%hi(g_playerCount)
	lw	$3,%lo(g_playerCount)($2)
	li	$2,2			# 0x2
	beq	$3,$2,$L123
	lui	$2,%hi(CloudCount2P)

$L119:
	blez	$8,$L115
	lui	$2,%hi($LC4)

	lui	$5,%hi(g_CloudAllocate)
	addiu	$5,$5,%lo(g_CloudAllocate)
	move	$6,$0
	lui	$7,%hi(g_DynamicObjects)
	addiu	$7,$7,%lo(g_DynamicObjects)
	lwc1	$f2,%lo($LC4)($2)
	lui	$2,%hi($LC5)
	lwc1	$f0,%lo($LC5)($2)
$L120:
	lw	$4,0($5)
	beq	$4,$0,$L115
	sll	$2,$4,3

	subu	$3,$2,$4
	sll	$3,$3,5
	addu	$3,$3,$7
	swc1	$f2,60($3)
	swc1	$f0,0($3)
	addiu	$6,$6,1
	bne	$8,$6,$L120
	addiu	$5,$5,4

$L115:
	lw	$31,28($sp)
	lw	$17,24($sp)
	lw	$16,20($sp)
	jr	$31
	addiu	$sp,$sp,32

$L116:
	jal	KWChart_Kumo
	nop

	b	$L124
	lui	$2,%hi(OverKartHeader+69)

$L123:
	b	$L119
	lw	$8,%lo(CloudCount2P)($2)

	.set	macro
	.set	reorder
	.end	KWChart_Kumo_Hook
	.size	KWChart_Kumo_Hook, .-KWChart_Kumo_Hook
	.align	2
	.globl	EventDisplay
	.set	nomips16
	.set	nomicromips
	.ent	EventDisplay
	.type	EventDisplay, @function
EventDisplay:
	.frame	$sp,24,$31		# vars= 0, regs= 2/0, args= 16, gp= 0
	.mask	0x80010000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	addiu	$sp,$sp,-24
	sw	$31,20($sp)
	sw	$16,16($sp)
	lui	$2,%hi(HotSwapID)
	lh	$2,%lo(HotSwapID)($2)
	bne	$2,$0,$L126
	move	$16,$4

	jal	KWDisplayEvent
	nop

	lw	$31,20($sp)
$L129:
	lw	$16,16($sp)
	jr	$31
	addiu	$sp,$sp,24

$L126:
	jal	KWDisplayIceBlockShadow
	nop

	jal	KWDisplayBombKartBT
	move	$4,$16

	jal	KWDisplayEvent
	move	$4,$16

	b	$L129
	lw	$31,20($sp)

	.set	macro
	.set	reorder
	.end	EventDisplay
	.size	EventDisplay, .-EventDisplay
	.align	2
	.globl	EventDisplay_After
	.set	nomips16
	.set	nomicromips
	.ent	EventDisplay_After
	.type	EventDisplay_After, @function
EventDisplay_After:
	.frame	$sp,24,$31		# vars= 0, regs= 2/0, args= 16, gp= 0
	.mask	0x80010000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	addiu	$sp,$sp,-24
	sw	$31,20($sp)
	sw	$16,16($sp)
	lui	$2,%hi(HotSwapID)
	lh	$2,%lo(HotSwapID)($2)
	bne	$2,$0,$L131
	move	$16,$4

	jal	KWDisplayEvent_After
	nop

$L132:
	jal	DrawCustomParticle
	move	$4,$16

	lw	$31,20($sp)
	lw	$16,16($sp)
	jr	$31
	addiu	$sp,$sp,24

$L131:
	jal	KWDisplayIceBlock
	nop

	jal	KWDisplayEvent_After
	move	$4,$16

	b	$L132
	nop

	.set	macro
	.set	reorder
	.end	EventDisplay_After
	.size	EventDisplay_After, .-EventDisplay_After
	.align	2
	.globl	CommonGameEventChart
	.set	nomips16
	.set	nomicromips
	.ent	CommonGameEventChart
	.type	CommonGameEventChart, @function
CommonGameEventChart:
	.frame	$sp,24,$31		# vars= 0, regs= 1/0, args= 16, gp= 0
	.mask	0x80000000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	addiu	$sp,$sp,-24
	sw	$31,20($sp)
	lui	$2,%hi(HotSwapID)
	lh	$2,%lo(HotSwapID)($2)
	beq	$2,$0,$L139
	lui	$2,%hi(g_resetToggle)

	lw	$3,%lo(g_resetToggle)($2)
	li	$2,4			# 0x4
	bne	$3,$2,$L140
	nop

$L137:
	jal	KWGameEventCommon
	nop

$L136:
	jal	MoveCustomParticle
	nop

	lw	$31,20($sp)
	jr	$31
	addiu	$sp,$sp,24

$L139:
	jal	KWGameEventCommon
	nop

	b	$L136
	nop

$L140:
	jal	KWChartIceBlock
	nop

	b	$L137
	nop

	.set	macro
	.set	reorder
	.end	CommonGameEventChart
	.size	CommonGameEventChart, .-CommonGameEventChart
	.align	2
	.globl	setSky
	.set	nomips16
	.set	nomicromips
	.ent	setSky
	.type	setSky, @function
setSky:
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
	lui	$2,%hi(HotSwapID)
	lh	$2,%lo(HotSwapID)($2)
	blez	$2,$L142
	lui	$17,%hi(targetAddress)

	lw	$3,%lo(targetAddress)($17)
	lui	$2,%hi(g_skyColorTopTable)
	addiu	$2,$2,%lo(g_skyColorTopTable)
	sw	$2,0($3)
	lui	$16,%hi(sourceAddress)
	lw	$2,%lo(sourceAddress)($16)
	lui	$3,%hi(OverKartHeader+64)
	lw	$3,%lo(OverKartHeader+64)($3)
	sw	$3,0($2)
	lui	$2,%hi(dataLength)
	li	$3,12			# 0xc
	jal	runDMA
	sw	$3,%lo(dataLength)($2)

	lw	$3,%lo(targetAddress)($17)
	lui	$2,%hi(g_skyColorBotTable)
	addiu	$2,$2,%lo(g_skyColorBotTable)
	sw	$2,0($3)
	lw	$3,%lo(sourceAddress)($16)
	lw	$2,0($3)
	addiu	$2,$2,12
	jal	runDMA
	sw	$2,0($3)

	lw	$31,28($sp)
$L145:
	lw	$18,24($sp)
	lw	$17,20($sp)
	lw	$16,16($sp)
	jr	$31
	addiu	$sp,$sp,32

$L142:
	lui	$18,%hi(targetAddress)
	lw	$3,%lo(targetAddress)($18)
	lui	$2,%hi(g_skyColorTopTable)
	addiu	$2,$2,%lo(g_skyColorTopTable)
	sw	$2,0($3)
	lui	$17,%hi(sourceAddress)
	lw	$2,%lo(sourceAddress)($17)
	li	$16,1179648			# 0x120000
	addiu	$3,$16,8416
	sw	$3,0($2)
	lui	$2,%hi(dataLength)
	li	$3,12			# 0xc
	jal	runDMA
	sw	$3,%lo(dataLength)($2)

	lw	$3,%lo(targetAddress)($18)
	lui	$2,%hi(g_skyColorBotTable)
	addiu	$2,$2,%lo(g_skyColorBotTable)
	sw	$2,0($3)
	lw	$2,%lo(sourceAddress)($17)
	addiu	$16,$16,8668
	jal	runDMA
	sw	$16,0($2)

	b	$L145
	lw	$31,28($sp)

	.set	macro
	.set	reorder
	.end	setSky
	.size	setSky, .-setSky
	.align	2
	.globl	loadTextureScrollTranslucent
	.set	nomips16
	.set	nomicromips
	.ent	loadTextureScrollTranslucent
	.type	loadTextureScrollTranslucent, @function
loadTextureScrollTranslucent:
	.frame	$sp,24,$31		# vars= 0, regs= 1/0, args= 16, gp= 0
	.mask	0x80000000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	lui	$2,%hi(ok_scrolltranslucent)
	li	$3,-1			# 0xffffffffffffffff
	sw	$3,%lo(ok_scrolltranslucent)($2)
	lui	$2,%hi(HotSwapID)
	lh	$2,%lo(HotSwapID)($2)
	blez	$2,$L153
	lui	$2,%hi(sourceAddress)

	lw	$3,%lo(sourceAddress)($2)
	lui	$4,%hi(OverKartHeader+144)
	lw	$4,%lo(OverKartHeader+144)($4)
	sw	$4,0($3)
	lw	$2,%lo(sourceAddress)($2)
	lw	$2,0($2)
	bne	$2,$0,$L152
	lui	$2,%hi(targetAddress)

$L153:
	jr	$31
	nop

$L152:
	addiu	$sp,$sp,-24
	sw	$31,20($sp)
	lw	$3,%lo(targetAddress)($2)
	lui	$2,%hi(ok_scrolltranslucent)
	addiu	$2,$2,%lo(ok_scrolltranslucent)
	sw	$2,0($3)
	lui	$2,%hi(OverKartHeader+154)
	lh	$2,%lo(OverKartHeader+154)($2)
	addiu	$2,$2,4
	lui	$3,%hi(dataLength)
	jal	runDMA
	sw	$2,%lo(dataLength)($3)

	lw	$31,20($sp)
	jr	$31
	addiu	$sp,$sp,24

	.set	macro
	.set	reorder
	.end	loadTextureScrollTranslucent
	.size	loadTextureScrollTranslucent, .-loadTextureScrollTranslucent
	.align	2
	.globl	runTextureScroll
	.set	nomips16
	.set	nomicromips
	.ent	runTextureScroll
	.type	runTextureScroll, @function
runTextureScroll:
	.frame	$sp,56,$31		# vars= 0, regs= 9/0, args= 16, gp= 0
	.mask	0x80ff0000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	lui	$2,%hi(ok_scrolltranslucent)
	addiu	$4,$2,%lo(ok_scrolltranslucent)
	lui	$3,%hi(GlobalAddressA)
	sw	$4,%lo(GlobalAddressA)($3)
	lw	$2,%lo(ok_scrolltranslucent)($2)
	lui	$3,%hi(LoopValue)
	blez	$2,$L167
	sw	$2,%lo(LoopValue)($3)

	addiu	$sp,$sp,-56
	sw	$31,52($sp)
	sw	$23,48($sp)
	sw	$22,44($sp)
	sw	$21,40($sp)
	sw	$20,36($sp)
	sw	$19,32($sp)
	sw	$18,28($sp)
	sw	$17,24($sp)
	sw	$16,20($sp)
	lui	$16,%hi(ScrollValues)
	addiu	$16,$16,%lo(ScrollValues)
	move	$17,$0
	lui	$23,%hi(GlobalAddressA)
	lui	$22,%hi(GlobalAddressB)
	lui	$21,%hi(GlobalIntA)
	lui	$20,%hi(GlobalShortA)
	lui	$19,%hi(GlobalShortB)
	b	$L160
	move	$18,$3

$L156:
	bgez	$3,$L157
	addiu	$3,$3,255

	b	$L157
	sw	$3,0($16)

$L158:
	bgez	$2,$L159
	addiu	$2,$2,255

	sw	$2,4($5)
$L159:
	lw	$6,4($5)
	jal	ScrollMapImage
	lw	$5,0($5)

	addiu	$17,$17,1
	lw	$2,%lo(LoopValue)($18)
	slt	$2,$17,$2
	beq	$2,$0,$L166
	addiu	$16,$16,8

$L160:
	sll	$2,$17,3
	lw	$3,%lo(GlobalAddressA)($23)
	addu	$2,$2,$3
	lw	$4,4($2)
	sw	$4,%lo(GlobalAddressB)($22)
	lw	$2,8($2)
	sw	$2,%lo(GlobalIntA)($21)
	sra	$3,$2,16
	sh	$3,%lo(GlobalShortA)($20)
	sll	$2,$2,16
	sra	$2,$2,16
	sh	$2,%lo(GlobalShortB)($19)
	move	$5,$16
	lw	$6,0($16)
	addu	$3,$3,$6
	slt	$6,$3,256
	bne	$6,$0,$L156
	sw	$3,0($16)

	addiu	$3,$3,-255
	sw	$3,0($16)
$L157:
	lw	$3,4($5)
	addu	$2,$2,$3
	slt	$3,$2,256
	bne	$3,$0,$L158
	sw	$2,4($5)

	addiu	$2,$2,-255
	b	$L159
	sw	$2,4($5)

$L166:
	lw	$31,52($sp)
	lw	$23,48($sp)
	lw	$22,44($sp)
	lw	$21,40($sp)
	lw	$20,36($sp)
	lw	$19,32($sp)
	lw	$18,28($sp)
	lw	$17,24($sp)
	lw	$16,20($sp)
	jr	$31
	addiu	$sp,$sp,56

$L167:
	jr	$31
	nop

	.set	macro
	.set	reorder
	.end	runTextureScroll
	.size	runTextureScroll, .-runTextureScroll
	.align	2
	.globl	runWaterVertex
	.set	nomips16
	.set	nomicromips
	.ent	runWaterVertex
	.type	runWaterVertex, @function
runWaterVertex:
	.frame	$sp,48,$31		# vars= 0, regs= 8/0, args= 16, gp= 0
	.mask	0x807f0000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	lui	$2,%hi(OverKartHeader+148)
	lh	$3,%lo(OverKartHeader+148)($2)
	lui	$2,%hi(ok_scrolltranslucent)
	addiu	$2,$2,%lo(ok_scrolltranslucent)
	addu	$2,$2,$3
	lui	$3,%hi(GlobalAddressA)
	sw	$2,%lo(GlobalAddressA)($3)
	lw	$3,0($2)
	lui	$2,%hi(LoopValue)
	sw	$3,%lo(LoopValue)($2)
	li	$2,-1			# 0xffffffffffffffff
	beq	$3,$2,$L179
	lui	$2,%hi(WaveTime)

	lh	$2,%lo(WaveTime)($2)
	slt	$4,$2,31001
	bne	$4,$0,$L170
	slt	$4,$2,-31000

	lui	$4,%hi(WaveDirection)
	li	$5,-1			# 0xffffffffffffffff
	sh	$5,%lo(WaveDirection)($4)
$L171:
	lui	$4,%hi(WaveDirection)
$L180:
	lhu	$4,%lo(WaveDirection)($4)
	addu	$2,$2,$4
	andi	$2,$2,0xffff
	lui	$4,%hi(WaveTime)
	sh	$2,%lo(WaveTime)($4)
	andi	$2,$2,0x1
	bne	$2,$0,$L179
	nop

	blez	$3,$L179
	lui	$2,%hi($LC6)

	addiu	$sp,$sp,-48
	sw	$31,44($sp)
	sw	$22,40($sp)
	sw	$21,36($sp)
	sw	$20,32($sp)
	sw	$19,28($sp)
	sw	$18,24($sp)
	sw	$17,20($sp)
	sw	$16,16($sp)
	move	$17,$0
	lui	$22,%hi(GlobalAddressA)
	lui	$21,%hi(GlobalAddressB)
	li	$20,67108864			# 0x4000000
	lw	$19,%lo($LC6)($2)
	lui	$18,%hi(LoopValue)
	lw	$16,%lo(GlobalAddressA)($22)
$L178:
	addiu	$16,$16,4
	sll	$2,$17,3
	addu	$16,$16,$2
	sw	$16,%lo(GlobalAddressB)($21)
	lw	$4,4($16)
	jal	GetRealAddress
	or	$4,$4,$20

	move	$6,$19
	lw	$5,0($16)
	jal	WaveRace
	move	$4,$2

	addiu	$17,$17,1
	lw	$2,%lo(LoopValue)($18)
	slt	$2,$17,$2
	bne	$2,$0,$L178
	lw	$16,%lo(GlobalAddressA)($22)

	lw	$31,44($sp)
	lw	$22,40($sp)
	lw	$21,36($sp)
	lw	$20,32($sp)
	lw	$19,28($sp)
	lw	$18,24($sp)
	lw	$17,20($sp)
	lw	$16,16($sp)
	jr	$31
	addiu	$sp,$sp,48

$L170:
	beq	$4,$0,$L171
	lui	$4,%hi(WaveDirection)

	li	$5,1			# 0x1
	b	$L180
	sh	$5,%lo(WaveDirection)($4)

$L179:
	jr	$31
	nop

	.set	macro
	.set	reorder
	.end	runWaterVertex
	.size	runWaterVertex, .-runWaterVertex
	.align	2
	.globl	runDisplayScreen
	.set	nomips16
	.set	nomicromips
	.ent	runDisplayScreen
	.type	runDisplayScreen, @function
runDisplayScreen:
	.frame	$sp,72,$31		# vars= 8, regs= 10/0, args= 24, gp= 0
	.mask	0xc0ff0000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	lui	$2,%hi(OverKartHeader+150)
	lh	$3,%lo(OverKartHeader+150)($2)
	lui	$2,%hi(ok_scrolltranslucent)
	addiu	$2,$2,%lo(ok_scrolltranslucent)
	addu	$2,$2,$3
	lui	$3,%hi(GlobalAddressA)
	sw	$2,%lo(GlobalAddressA)($3)
	lw	$2,0($2)
	lui	$3,%hi(LoopValue)
	sw	$2,%lo(LoopValue)($3)
	li	$3,6			# 0x6
	bne	$2,$3,$L204
	nop

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
	li	$17,1			# 0x1
	move	$16,$0
	lui	$fp,%hi(GlobalAddressA)
	lui	$23,%hi(GlobalAddressC)
	lui	$22,%hi(GlobalIntA)
	li	$18,88			# 0x58
	lui	$21,%hi(GlobalIntB)
	li	$20,72			# 0x48
	lui	$19,%hi($L188)
	addiu	$19,$19,%lo($L188)
	lui	$2,%hi(g_CfbPtrs)
	addiu	$2,$2,%lo(g_CfbPtrs)
	b	$L195
	sw	$2,24($sp)

$L201:
	lui	$2,%hi(GlobalShortA)
	li	$3,2			# 0x2
	sh	$3,%lo(GlobalShortA)($2)
$L184:
	sltu	$2,$16,6
	beq	$2,$0,$L186
	sll	$2,$16,2

	addu	$2,$19,$2
	lw	$2,0($2)
	jr	$2
	nop

	.rdata
	.align	2
	.align	2
$L188:
	.word	$L193
	.word	$L192
	.word	$L191
	.word	$L190
	.word	$L189
	.word	$L187
	.text
$L185:
	b	$L184
	sh	$0,%lo(GlobalShortA)($2)

$L193:
	lui	$2,%hi(GlobalShortA)
	lh	$2,%lo(GlobalShortA)($2)
	sll	$2,$2,2
	lw	$3,24($sp)
	addu	$2,$2,$3
	lw	$3,0($2)
	li	$2,-2147483648			# 0xffffffff80000000
	or	$2,$3,$2
	jal	GetRealAddress
	sw	$2,28($sp)

	sw	$2,20($sp)
	lw	$2,28($sp)
	sw	$2,16($sp)
	li	$7,32			# 0x20
	li	$6,64			# 0x40
	move	$5,$20
	jal	GetFramebuffer
	move	$4,$18

	addiu	$16,$16,1
$L202:
	addiu	$17,$17,1
$L195:
	lw	$3,%lo(GlobalAddressA)($fp)
	sll	$2,$16,2
	addu	$2,$2,$3
	lw	$4,4($2)
	sw	$4,%lo(GlobalAddressC)($23)
	sw	$18,%lo(GlobalIntA)($22)
	sw	$20,%lo(GlobalIntB)($21)
	lui	$2,%hi(g_DispFrame)
	lhu	$2,%lo(g_DispFrame)($2)
	addiu	$2,$2,-1
	sll	$2,$2,16
	sra	$2,$2,16
	bltz	$2,$L201
	slt	$3,$2,3

	beql	$3,$0,$L185
	lui	$2,%hi(GlobalShortA)

	lui	$3,%hi(GlobalShortA)
	b	$L184
	sh	$2,%lo(GlobalShortA)($3)

$L192:
	lui	$2,%hi(GlobalShortA)
	lh	$2,%lo(GlobalShortA)($2)
	sll	$2,$2,2
	lw	$3,24($sp)
	addu	$2,$2,$3
	lw	$3,0($2)
	li	$2,-2147483648			# 0xffffffff80000000
	or	$2,$3,$2
	jal	GetRealAddress
	sw	$2,28($sp)

	sw	$2,20($sp)
	lw	$2,28($sp)
	sw	$2,16($sp)
	li	$7,32			# 0x20
	li	$6,64			# 0x40
	move	$5,$20
	jal	GetFramebuffer
	li	$4,152			# 0x98

	b	$L202
	addiu	$16,$16,1

$L191:
	lui	$2,%hi(GlobalShortA)
	lh	$2,%lo(GlobalShortA)($2)
	sll	$2,$2,2
	lw	$3,24($sp)
	addu	$2,$2,$3
	lw	$3,0($2)
	li	$2,-2147483648			# 0xffffffff80000000
	or	$2,$3,$2
	jal	GetRealAddress
	sw	$2,28($sp)

	sw	$2,20($sp)
	lw	$2,28($sp)
	sw	$2,16($sp)
	li	$7,32			# 0x20
	li	$6,64			# 0x40
	li	$5,104			# 0x68
	jal	GetFramebuffer
	move	$4,$18

	b	$L202
	addiu	$16,$16,1

$L190:
	lui	$2,%hi(GlobalShortA)
	lh	$2,%lo(GlobalShortA)($2)
	sll	$2,$2,2
	lw	$3,24($sp)
	addu	$2,$2,$3
	lw	$3,0($2)
	li	$2,-2147483648			# 0xffffffff80000000
	or	$2,$3,$2
	jal	GetRealAddress
	sw	$2,28($sp)

	sw	$2,20($sp)
	lw	$2,28($sp)
	sw	$2,16($sp)
	li	$7,32			# 0x20
	li	$6,64			# 0x40
	li	$5,104			# 0x68
	jal	GetFramebuffer
	li	$4,152			# 0x98

	b	$L202
	addiu	$16,$16,1

$L189:
	lui	$2,%hi(GlobalShortA)
	lh	$2,%lo(GlobalShortA)($2)
	sll	$2,$2,2
	lw	$3,24($sp)
	addu	$2,$2,$3
	lw	$3,0($2)
	li	$2,-2147483648			# 0xffffffff80000000
	or	$2,$3,$2
	jal	GetRealAddress
	sw	$2,28($sp)

	sw	$2,20($sp)
	lw	$2,28($sp)
	sw	$2,16($sp)
	li	$7,32			# 0x20
	li	$6,64			# 0x40
	li	$5,136			# 0x88
	jal	GetFramebuffer
	move	$4,$18

	b	$L202
	addiu	$16,$16,1

$L187:
	lui	$2,%hi(GlobalShortA)
	lh	$2,%lo(GlobalShortA)($2)
	sll	$2,$2,2
	lui	$3,%hi(g_CfbPtrs)
	addiu	$3,$3,%lo(g_CfbPtrs)
	addu	$2,$2,$3
	lw	$16,0($2)
	li	$2,-2147483648			# 0xffffffff80000000
	jal	GetRealAddress
	or	$16,$16,$2

	sw	$2,20($sp)
	sw	$16,16($sp)
	li	$7,32			# 0x20
	li	$6,64			# 0x40
	li	$5,136			# 0x88
	jal	GetFramebuffer
	li	$4,152			# 0x98

	lw	$31,68($sp)
$L203:
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

$L186:
	slt	$2,$17,6
	bne	$2,$0,$L202
	addiu	$16,$16,1

	b	$L203
	lw	$31,68($sp)

$L204:
	jr	$31
	nop

	.set	macro
	.set	reorder
	.end	runDisplayScreen
	.size	runDisplayScreen, .-runDisplayScreen
	.align	2
	.globl	runKillDisplayObjects
	.set	nomips16
	.set	nomicromips
	.ent	runKillDisplayObjects
	.type	runKillDisplayObjects, @function
runKillDisplayObjects:
	.frame	$sp,64,$31		# vars= 8, regs= 10/0, args= 16, gp= 0
	.mask	0xc0ff0000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	lui	$2,%hi(OverKartHeader+152)
	lh	$3,%lo(OverKartHeader+152)($2)
	lui	$2,%hi(ok_scrolltranslucent)
	addiu	$2,$2,%lo(ok_scrolltranslucent)
	addu	$2,$2,$3
	lw	$3,0($2)
	lui	$4,%hi(LoopValue)
	sw	$3,%lo(LoopValue)($4)
	addiu	$2,$2,4
	lui	$4,%hi(GlobalAddressA)
	blez	$3,$L246
	sw	$2,%lo(GlobalAddressA)($4)

	addiu	$sp,$sp,-64
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
	move	$20,$0
	move	$19,$4
	lui	$23,%hi(g_gameMode)
	li	$21,2			# 0x2
	lui	$22,%hi(g_raceClass)
	lui	$2,%hi(LoopValue)
	b	$L227
	sw	$2,16($sp)

$L208:
	bne	$17,$2,$L244
	lw	$17,%lo(g_raceClass)($22)

	lb	$2,3($16)
	beq	$2,$0,$L244
	nop

	lw	$2,8($16)
	beq	$2,$0,$L244
	move	$fp,$18

	move	$17,$0
$L216:
	lw	$4,0($fp)
	li	$2,117440512			# 0x7000000
	jal	KillDisplayList
	or	$4,$4,$2

	addiu	$17,$17,1
	lw	$2,8($16)
	sltu	$2,$17,$2
	bne	$2,$0,$L216
	addiu	$fp,$fp,4

	b	$L244
	lw	$17,%lo(g_raceClass)($22)

$L209:
	lb	$2,0($16)
	bnel	$2,$0,$L241
	lw	$2,8($16)

$L211:
	lw	$17,%lo(g_raceClass)($22)
$L244:
$L247:
$L249:
	beq	$17,$21,$L217
	slt	$2,$17,3

	beq	$2,$0,$L218
	li	$2,3			# 0x3

	beq	$17,$0,$L219
	li	$2,1			# 0x1

	bnel	$17,$2,$L245
	lw	$2,8($16)

	lb	$2,5($16)
	beq	$2,$0,$L245
	lw	$2,8($16)

	beq	$2,$0,$L245
	move	$17,$0

	li	$fp,117440512			# 0x7000000
$L224:
	lw	$4,0($18)
	jal	KillDisplayList
	or	$4,$4,$fp

	addiu	$17,$17,1
	lw	$2,8($16)
	sltu	$2,$17,$2
	bne	$2,$0,$L224
	addiu	$18,$18,4

	b	$L245
	lw	$2,8($16)

$L241:
	beq	$2,$0,$L211
	move	$fp,$18

$L213:
	lw	$4,0($fp)
	li	$2,117440512			# 0x7000000
	jal	KillDisplayList
	or	$4,$4,$2

	addiu	$17,$17,1
	lw	$2,8($16)
	sltu	$2,$17,$2
	bne	$2,$0,$L213
	addiu	$fp,$fp,4

	b	$L244
	lw	$17,%lo(g_raceClass)($22)

$L207:
	lb	$2,2($16)
	beq	$2,$0,$L244
	lw	$17,%lo(g_raceClass)($22)

	lw	$2,8($16)
	beq	$2,$0,$L247
	move	$fp,$18

	move	$17,$0
$L215:
	lw	$4,0($fp)
	li	$2,117440512			# 0x7000000
	jal	KillDisplayList
	or	$4,$4,$2

	addiu	$17,$17,1
	lw	$2,8($16)
	sltu	$2,$17,$2
	bne	$2,$0,$L215
	addiu	$fp,$fp,4

	b	$L244
	lw	$17,%lo(g_raceClass)($22)

$L218:
	bnel	$17,$2,$L245
	lw	$2,8($16)

	lb	$2,7($16)
	beq	$2,$0,$L245
	lw	$2,8($16)

	beq	$2,$0,$L248
	move	$17,$0

	li	$fp,117440512			# 0x7000000
$L226:
	lw	$4,0($18)
	jal	KillDisplayList
	or	$4,$4,$fp

	addiu	$17,$17,1
	lw	$2,8($16)
	sltu	$2,$17,$2
	bne	$2,$0,$L226
	addiu	$18,$18,4

	b	$L245
	lw	$2,8($16)

$L219:
	lb	$2,4($16)
	bnel	$2,$0,$L242
	lw	$2,8($16)

$L221:
	lw	$2,8($16)
$L245:
$L248:
$L250:
	sll	$2,$2,2
	lw	$3,%lo(GlobalAddressA)($19)
	addiu	$3,$3,12
	addu	$2,$2,$3
	sw	$2,%lo(GlobalAddressA)($19)
	addiu	$20,$20,1
	lw	$2,16($sp)
	lw	$2,%lo(LoopValue)($2)
	slt	$2,$20,$2
	beq	$2,$0,$L243
	lw	$31,60($sp)

$L227:
	lw	$16,%lo(GlobalAddressA)($19)
	lw	$17,%lo(g_gameMode)($23)
	beq	$17,$21,$L207
	addiu	$18,$16,12

	slt	$2,$17,3
	beq	$2,$0,$L208
	li	$2,3			# 0x3

	beq	$17,$0,$L209
	li	$2,1			# 0x1

	bne	$17,$2,$L244
	lw	$17,%lo(g_raceClass)($22)

	lb	$2,1($16)
	beq	$2,$0,$L244
	nop

	lw	$2,8($16)
	beq	$2,$0,$L249
	move	$fp,$18

	move	$17,$0
$L214:
	lw	$4,0($fp)
	li	$2,117440512			# 0x7000000
	jal	KillDisplayList
	or	$4,$4,$2

	addiu	$17,$17,1
	lw	$2,8($16)
	sltu	$2,$17,$2
	bne	$2,$0,$L214
	addiu	$fp,$fp,4

	b	$L244
	lw	$17,%lo(g_raceClass)($22)

$L242:
	beq	$2,$0,$L221
	li	$fp,117440512			# 0x7000000

$L223:
	lw	$4,0($18)
	jal	KillDisplayList
	or	$4,$4,$fp

	addiu	$17,$17,1
	lw	$2,8($16)
	sltu	$2,$17,$2
	bne	$2,$0,$L223
	addiu	$18,$18,4

	b	$L245
	lw	$2,8($16)

$L217:
	lb	$2,6($16)
	beq	$2,$0,$L245
	lw	$2,8($16)

	beq	$2,$0,$L250
	move	$17,$0

	li	$fp,117440512			# 0x7000000
$L225:
	lw	$4,0($18)
	jal	KillDisplayList
	or	$4,$4,$fp

	addiu	$17,$17,1
	lw	$2,8($16)
	sltu	$2,$17,$2
	bne	$2,$0,$L225
	addiu	$18,$18,4

	b	$L245
	lw	$2,8($16)

$L243:
	lw	$fp,56($sp)
	lw	$23,52($sp)
	lw	$22,48($sp)
	lw	$21,44($sp)
	lw	$20,40($sp)
	lw	$19,36($sp)
	lw	$18,32($sp)
	lw	$17,28($sp)
	lw	$16,24($sp)
	jr	$31
	addiu	$sp,$sp,64

$L246:
	jr	$31
	nop

	.set	macro
	.set	reorder
	.end	runKillDisplayObjects
	.size	runKillDisplayObjects, .-runKillDisplayObjects
	.align	2
	.globl	setText
	.set	nomips16
	.set	nomicromips
	.ent	setText
	.type	setText, @function
setText:
	.frame	$sp,24,$31		# vars= 0, regs= 1/0, args= 16, gp= 0
	.mask	0x80000000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	addiu	$sp,$sp,-24
	sw	$31,20($sp)
	lui	$2,%hi(sourceAddress)
	lw	$2,%lo(sourceAddress)($2)
	lui	$3,%hi(OverKartHeader+72)
	lw	$3,%lo(OverKartHeader+72)($3)
	sw	$3,0($2)
	lui	$2,%hi(targetAddress)
	lw	$3,%lo(targetAddress)($2)
	lui	$2,%hi(ok_Credits)
	addiu	$2,$2,%lo(ok_Credits)
	sw	$2,0($3)
	lui	$2,%hi(dataLength)
	li	$3,32			# 0x20
	sw	$3,%lo(dataLength)($2)
	lui	$2,%hi(HotSwapID)
	lh	$2,%lo(HotSwapID)($2)
	blez	$2,$L252
	lui	$2,%hi(sourceAddress)

	lw	$2,%lo(sourceAddress)($2)
	lw	$2,0($2)
	bne	$2,$0,$L259
	nop

$L252:
	lui	$2,%hi(ok_Credits)
	sw	$0,%lo(ok_Credits)($2)
	lui	$2,%hi(sourceAddress)
$L262:
	lw	$2,%lo(sourceAddress)($2)
	lui	$3,%hi(OverKartHeader+76)
	lw	$3,%lo(OverKartHeader+76)($3)
	sw	$3,0($2)
	lui	$2,%hi(targetAddress)
	lw	$3,%lo(targetAddress)($2)
	lui	$2,%hi(ok_CourseName)
	addiu	$2,$2,%lo(ok_CourseName)
	sw	$2,0($3)
	lui	$2,%hi(dataLength)
	li	$3,64			# 0x40
	sw	$3,%lo(dataLength)($2)
	lui	$2,%hi(HotSwapID)
	lh	$2,%lo(HotSwapID)($2)
	blez	$2,$L254
	lui	$2,%hi(sourceAddress)

	lw	$2,%lo(sourceAddress)($2)
	lw	$2,0($2)
	bne	$2,$0,$L260
	nop

$L254:
	lui	$2,%hi(ok_CourseName)
	sw	$0,%lo(ok_CourseName)($2)
	lui	$2,%hi(sourceAddress)
$L263:
	lw	$2,%lo(sourceAddress)($2)
	lui	$3,%hi(OverKartHeader+80)
	lw	$3,%lo(OverKartHeader+80)($3)
	sw	$3,0($2)
	lui	$2,%hi(targetAddress)
	lw	$3,%lo(targetAddress)($2)
	lui	$2,%hi(ok_SerialKey)
	addiu	$2,$2,%lo(ok_SerialKey)
	sw	$2,0($3)
	lui	$2,%hi(dataLength)
	li	$3,64			# 0x40
	sw	$3,%lo(dataLength)($2)
	lui	$2,%hi(HotSwapID)
	lh	$2,%lo(HotSwapID)($2)
	blez	$2,$L256
	lui	$2,%hi(sourceAddress)

	lw	$2,%lo(sourceAddress)($2)
	lw	$2,0($2)
	bne	$2,$0,$L261
	nop

$L256:
	lui	$2,%hi(ok_SerialKey)
	sw	$0,%lo(ok_SerialKey)($2)
	lw	$31,20($sp)
$L264:
	jr	$31
	addiu	$sp,$sp,24

$L259:
	jal	runDMA
	nop

	b	$L262
	lui	$2,%hi(sourceAddress)

$L260:
	jal	runDMA
	nop

	b	$L263
	lui	$2,%hi(sourceAddress)

$L261:
	jal	runDMA
	nop

	b	$L264
	lw	$31,20($sp)

	.set	macro
	.set	reorder
	.end	setText
	.size	setText, .-setText
	.align	2
	.globl	SetCourseNames
	.set	nomips16
	.set	nomicromips
	.ent	SetCourseNames
	.type	SetCourseNames, @function
SetCourseNames:
	.frame	$sp,0,$31		# vars= 0, regs= 0/0, args= 0, gp= 0
	.mask	0x00000000,0
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	bne	$4,$0,$L266
	lui	$2,%hi(sourceAddress)

	lui	$2,%hi(stockCourseNames)
$L273:
	addiu	$2,$2,%lo(stockCourseNames)
	lui	$4,%hi(g_StringTableCourse)
	addiu	$4,$4,%lo(g_StringTableCourse)
	lui	$3,%hi(g_StringTableCourseGP)
	addiu	$3,$3,%lo(g_StringTableCourseGP)
	addiu	$6,$2,80
$L267:
	lw	$5,0($2)
	sw	$5,0($4)
	sw	$5,0($3)
	addiu	$2,$2,4
	addiu	$4,$4,4
	bne	$2,$6,$L267
	addiu	$3,$3,4

	jr	$31
	nop

$L266:
	lw	$2,%lo(sourceAddress)($2)
	lw	$2,0($2)
	beq	$2,$0,$L273
	lui	$2,%hi(stockCourseNames)

	lui	$2,%hi(g_StringTableCourse)
	addiu	$2,$2,%lo(g_StringTableCourse)
	lui	$3,%hi(g_StringTableCourseGP)
	addiu	$3,$3,%lo(g_StringTableCourseGP)
	addiu	$5,$2,80
	lui	$4,%hi(ok_CourseName+4)
	addiu	$4,$4,%lo(ok_CourseName+4)
$L269:
	sw	$4,0($2)
	sw	$4,0($3)
	addiu	$2,$2,4
	bne	$2,$5,$L269
	addiu	$3,$3,4

	jr	$31
	nop

	.set	macro
	.set	reorder
	.end	SetCourseNames
	.size	SetCourseNames, .-SetCourseNames
	.align	2
	.globl	setOKObjects
	.set	nomips16
	.set	nomicromips
	.ent	setOKObjects
	.type	setOKObjects, @function
setOKObjects:
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
	lui	$2,%hi(GlobalShortA)
	li	$3,1			# 0x1
	sh	$3,%lo(GlobalShortA)($2)
	lui	$2,%hi(g_mirrorMode)
	lw	$3,%lo(g_mirrorMode)($2)
	li	$2,1			# 0x1
	beq	$3,$2,$L283
	lui	$2,%hi(GlobalShortA)

$L275:
	move	$16,$0
	li	$17,100			# 0x64
	sll	$4,$16,16
$L284:
	jal	ClearOKObject
	sra	$4,$4,16

	addiu	$16,$16,1
	bne	$16,$17,$L284
	sll	$4,$16,16

	lui	$3,%hi(OverKartRAMHeader)
	addiu	$3,$3,%lo(OverKartRAMHeader)
	lw	$5,24($3)
	lw	$4,0($5)
	sw	$4,8($3)
	addiu	$2,$5,4
	lui	$6,%hi(GlobalAddressC)
	sw	$2,%lo(GlobalAddressC)($6)
	sw	$2,12($3)
	sll	$2,$4,1
	addu	$2,$2,$4
	sll	$2,$2,2
	subu	$2,$2,$4
	sll	$2,$2,2
	addu	$2,$2,$5
	addiu	$5,$2,4
	lui	$4,%hi(GlobalAddressB)
	sw	$5,%lo(GlobalAddressB)($4)
	lw	$4,4($2)
	sw	$4,16($3)
	addiu	$2,$2,8
	lui	$5,%hi(GlobalAddressD)
	sw	$2,%lo(GlobalAddressD)($5)
	blez	$4,$L274
	sw	$2,20($3)

	lui	$16,%hi(OKObjectArray)
	addiu	$16,$16,%lo(OKObjectArray)
	move	$19,$0
	move	$18,$0
	move	$17,$3
	li	$22,-16384			# 0xffffffffffffc000
	li	$20,1374355456			# 0x51eb0000
	ori	$20,$20,0x851f
	lui	$21,%hi(GlobalShortA)
	b	$L279
	lui	$23,%hi(GlobalAddressA)

$L283:
	li	$3,-1			# 0xffffffffffffffff
	b	$L275
	sh	$3,%lo(GlobalShortA)($2)

$L278:
	addiu	$18,$18,1
$L285:
	addiu	$16,$16,148
	lw	$2,16($17)
	slt	$2,$18,$2
	beq	$2,$0,$L274
	addiu	$19,$19,28

$L279:
	sh	$18,0($16)
	lw	$3,20($17)
	addu	$3,$3,$19
	lh	$4,0($3)
	sh	$4,2($16)
	sh	$0,6($16)
	sll	$2,$4,1
	addu	$2,$2,$4
	sll	$2,$2,2
	subu	$2,$2,$4
	sll	$2,$2,2
	lw	$4,12($17)
	addu	$2,$4,$2
	lh	$5,4($2)
	lw	$4,40($2)
	sh	$22,38($16)
	mult	$5,$20
	mfhi	$2
	sra	$2,$2,5
	sra	$5,$5,31
	subu	$2,$2,$5
	sll	$2,$2,16
	sra	$2,$2,16
	mtc1	$2,$f0
	nop
	cvt.s.w	$f0,$f0
	swc1	$f0,48($16)
	lhu	$5,4($3)
	lhu	$2,%lo(GlobalShortA)($21)
	mult	$5,$2
	mflo	$2
	sh	$2,4($3)
	lw	$2,20($17)
	addu	$2,$2,$19
	lh	$3,4($2)
	mtc1	$3,$f0
	nop
	cvt.s.w	$f0,$f0
	swc1	$f0,60($16)
	lh	$3,6($2)
	mtc1	$3,$f0
	nop
	cvt.s.w	$f0,$f0
	swc1	$f0,64($16)
	lh	$3,8($2)
	mtc1	$3,$f0
	nop
	cvt.s.w	$f0,$f0
	swc1	$f0,68($16)
	lhu	$5,10($2)
	sll	$3,$5,1
	addu	$3,$3,$5
	sll	$3,$3,3
	subu	$3,$3,$5
	sll	$3,$3,2
	subu	$3,$3,$5
	sll	$3,$3,1
	sh	$3,52($16)
	lhu	$5,14($2)
	sll	$3,$5,1
	addu	$3,$3,$5
	sll	$3,$3,3
	subu	$3,$3,$5
	sll	$3,$3,2
	subu	$3,$3,$5
	sll	$3,$3,1
	sh	$3,54($16)
	lhu	$5,12($2)
	sll	$3,$5,1
	addu	$3,$3,$5
	sll	$3,$3,3
	subu	$3,$3,$5
	sll	$3,$3,2
	subu	$3,$3,$5
	sll	$3,$3,1
	sh	$3,56($16)
	lh	$5,16($2)
	sll	$3,$5,1
	addu	$3,$3,$5
	sll	$3,$3,3
	addu	$3,$3,$5
	sll	$3,$3,2
	mtc1	$3,$f0
	nop
	cvt.s.w	$f0,$f0
	swc1	$f0,72($16)
	lh	$5,18($2)
	sll	$3,$5,1
	addu	$3,$3,$5
	sll	$3,$3,3
	addu	$3,$3,$5
	sll	$3,$3,2
	mtc1	$3,$f0
	nop
	cvt.s.w	$f0,$f0
	swc1	$f0,76($16)
	lh	$5,20($2)
	sll	$3,$5,1
	addu	$3,$3,$5
	sll	$3,$3,3
	addu	$3,$3,$5
	sll	$3,$3,2
	mtc1	$3,$f0
	nop
	cvt.s.w	$f0,$f0
	swc1	$f0,80($16)
	lhu	$5,22($2)
	sll	$3,$5,1
	addu	$3,$3,$5
	sll	$3,$3,3
	subu	$3,$3,$5
	sll	$3,$3,2
	subu	$3,$3,$5
	sll	$3,$3,1
	sh	$3,8($16)
	lhu	$5,26($2)
	sll	$3,$5,1
	addu	$3,$3,$5
	sll	$3,$3,3
	subu	$3,$3,$5
	sll	$3,$3,2
	subu	$3,$3,$5
	sll	$3,$3,1
	sh	$3,10($16)
	lhu	$3,24($2)
	sll	$2,$3,1
	addu	$2,$2,$3
	sll	$2,$2,3
	subu	$2,$2,$3
	sll	$2,$2,2
	subu	$2,$2,$3
	sll	$2,$2,1
	sh	$2,12($16)
	li	$2,-1			# 0xffffffffffffffff
	sh	$2,32($16)
	li	$2,-1			# 0xffffffffffffffff
	beql	$4,$2,$L285
	addiu	$18,$18,1

	li	$fp,167772160			# 0xa000000
	jal	GetRealAddress
	or	$4,$4,$fp

	lw	$4,0($2)
	jal	GetRealAddress
	or	$4,$4,$fp

	sw	$2,%lo(GlobalAddressA)($23)
	lw	$2,0($2)
	b	$L278
	sb	$2,15($16)

$L274:
	lw	$31,52($sp)
	lw	$fp,48($sp)
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

	.set	macro
	.set	reorder
	.end	setOKObjects
	.size	setOKObjects, .-setOKObjects
	.align	2
	.globl	InitialMapCode
	.set	nomips16
	.set	nomicromips
	.ent	InitialMapCode
	.type	InitialMapCode, @function
InitialMapCode:
	.frame	$sp,24,$31		# vars= 0, regs= 1/0, args= 16, gp= 0
	.mask	0x80000000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	addiu	$sp,$sp,-24
	sw	$31,20($sp)
	jal	InitialMap
	nop

	lui	$2,%hi(HotSwapID)
	lh	$2,%lo(HotSwapID)($2)
	blez	$2,$L286
	lui	$2,%hi(g_gameMode)

	lw	$3,%lo(g_gameMode)($2)
	li	$2,3			# 0x3
	beq	$3,$2,$L289
	lui	$2,%hi(OverKartHeader+60)

$L286:
	lw	$31,20($sp)
$L290:
	jr	$31
	addiu	$sp,$sp,24

$L289:
	lw	$4,%lo(OverKartHeader+60)($2)
	li	$2,100663296			# 0x6000000
	jal	SearchListFile
	or	$4,$4,$2

	jal	MakeCollision
	nop

	b	$L290
	lw	$31,20($sp)

	.set	macro
	.set	reorder
	.end	InitialMapCode
	.size	InitialMapCode, .-InitialMapCode
	.align	2
	.globl	loadOKObjects
	.set	nomips16
	.set	nomicromips
	.ent	loadOKObjects
	.type	loadOKObjects, @function
loadOKObjects:
	.frame	$sp,32,$31		# vars= 0, regs= 3/0, args= 16, gp= 0
	.mask	0x80030000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	addiu	$sp,$sp,-32
	sw	$31,28($sp)
	sw	$17,24($sp)
	sw	$16,20($sp)
	lui	$16,%hi(OverKartHeader)
	addiu	$16,$16,%lo(OverKartHeader)
	lw	$4,96($16)
	lw	$5,104($16)
	subu	$5,$5,$4
	lui	$17,%hi(GlobalUIntA)
	jal	LoadOKData
	sw	$5,%lo(GlobalUIntA)($17)

	move	$5,$2
	jal	SetSegment
	li	$4,10			# 0xa

	lw	$4,92($16)
	lw	$5,96($16)
	subu	$5,$5,$4
	jal	LoadOKData
	sw	$5,%lo(GlobalUIntA)($17)

	lui	$3,%hi(GlobalAddressA)
	sw	$2,%lo(GlobalAddressA)($3)
	lui	$3,%hi(OverKartRAMHeader+24)
	sw	$2,%lo(OverKartRAMHeader+24)($3)
	lw	$31,28($sp)
	lw	$17,24($sp)
	lw	$16,20($sp)
	jr	$31
	addiu	$sp,$sp,32

	.set	macro
	.set	reorder
	.end	loadOKObjects
	.size	loadOKObjects, .-loadOKObjects
	.align	2
	.globl	loadHeaderOffsets
	.set	nomips16
	.set	nomicromips
	.ent	loadHeaderOffsets
	.type	loadHeaderOffsets, @function
loadHeaderOffsets:
	.frame	$sp,24,$31		# vars= 0, regs= 1/0, args= 16, gp= 0
	.mask	0x80000000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	addiu	$sp,$sp,-24
	sw	$31,20($sp)
	lui	$2,%hi(targetAddress)
	lw	$3,%lo(targetAddress)($2)
	lui	$2,%hi(ok_HeaderOffsets)
	addiu	$2,$2,%lo(ok_HeaderOffsets)
	sw	$2,0($3)
	lui	$2,%hi(sourceAddress)
	lw	$3,%lo(sourceAddress)($2)
	li	$2,12451840			# 0xbe0000
	ori	$2,$2,0x9178
	sw	$2,0($3)
	lui	$2,%hi(dataLength)
	li	$3,15360			# 0x3c00
	jal	runDMA
	sw	$3,%lo(dataLength)($2)

	lw	$31,20($sp)
	jr	$31
	addiu	$sp,$sp,24

	.set	macro
	.set	reorder
	.end	loadHeaderOffsets
	.size	loadHeaderOffsets, .-loadHeaderOffsets
	.align	2
	.globl	LoadBomb
	.set	nomips16
	.set	nomicromips
	.ent	LoadBomb
	.type	LoadBomb, @function
LoadBomb:
	.frame	$sp,24,$31		# vars= 0, regs= 1/0, args= 16, gp= 0
	.mask	0x80000000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	addiu	$sp,$sp,-24
	sw	$31,20($sp)
	lui	$2,%hi(HotSwapID)
	lh	$2,%lo(HotSwapID)($2)
	blez	$2,$L296
	lui	$2,%hi(sourceAddress)

	lw	$2,%lo(sourceAddress)($2)
	lui	$3,%hi(OverKartHeader+108)
	lw	$3,%lo(OverKartHeader+108)($3)
	sw	$3,0($2)
$L297:
	lui	$2,%hi(targetAddress)
	lw	$3,%lo(targetAddress)($2)
	lui	$2,%hi(g_BombTable)
	addiu	$2,$2,%lo(g_BombTable)
	sw	$2,0($3)
	lui	$2,%hi(dataLength)
	li	$3,168			# 0xa8
	jal	runDMA
	sw	$3,%lo(dataLength)($2)

	lw	$31,20($sp)
	jr	$31
	addiu	$sp,$sp,24

$L296:
	lw	$3,%lo(sourceAddress)($2)
	lui	$2,%hi(ok_Bomb)
	addiu	$2,$2,%lo(ok_Bomb)
	b	$L297
	sw	$2,0($3)

	.set	macro
	.set	reorder
	.end	LoadBomb
	.size	LoadBomb, .-LoadBomb
	.align	2
	.globl	LoadCustomHeader
	.set	nomips16
	.set	nomicromips
	.ent	LoadCustomHeader
	.type	LoadCustomHeader, @function
LoadCustomHeader:
	.frame	$sp,24,$31		# vars= 0, regs= 1/0, args= 16, gp= 0
	.mask	0x80000000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	addiu	$sp,$sp,-24
	sw	$31,20($sp)
	lui	$2,%hi(HotSwapID)
	lh	$2,%lo(HotSwapID)($2)
	blez	$2,$L300
	li	$2,-1			# 0xffffffffffffffff

	beq	$4,$2,$L300
	lui	$2,%hi(targetAddress)

	lw	$3,%lo(targetAddress)($2)
	lui	$2,%hi(ok_CourseHeader)
	addiu	$2,$2,%lo(ok_CourseHeader)
	sw	$2,0($3)
	lui	$5,%hi(sourceAddress)
	lw	$6,%lo(sourceAddress)($5)
	lui	$2,%hi(HotSwapID)
	lh	$2,%lo(HotSwapID)($2)
	addiu	$3,$2,-1
	sll	$2,$3,2
	addu	$2,$2,$3
	sll	$2,$2,2
	addu	$4,$2,$4
	sll	$4,$4,2
	lui	$2,%hi(ok_HeaderOffsets)
	addiu	$2,$2,%lo(ok_HeaderOffsets)
	addu	$4,$2,$4
	lw	$2,0($4)
	sw	$2,0($6)
	lui	$2,%hi(dataLength)
	li	$3,172			# 0xac
	sw	$3,%lo(dataLength)($2)
	lw	$2,%lo(sourceAddress)($5)
	lw	$3,0($2)
	li	$2,-1			# 0xffffffffffffffff
	bne	$3,$2,$L305
	lui	$2,%hi(OverKartHeader)

	li	$3,-1			# 0xffffffffffffffff
	b	$L299
	sw	$3,%lo(OverKartHeader)($2)

$L305:
	jal	runDMA
	nop

	lui	$2,%hi(OverKartHeader)
	lw	$3,%lo(OverKartHeader)($2)
	lui	$2,%hi(VersionNumber)
	sw	$3,%lo(VersionNumber)($2)
	lui	$2,%hi(targetAddress)
	lw	$3,%lo(targetAddress)($2)
	lui	$2,%hi(g_courseTable)
	addiu	$2,$2,%lo(g_courseTable)
	sw	$2,0($3)
	lui	$2,%hi(g_gameMode)
	lw	$3,%lo(g_gameMode)($2)
	li	$2,3			# 0x3
	beq	$3,$2,$L306
	lui	$2,%hi(targetAddress)

$L302:
	lui	$2,%hi(sourceAddress)
	lw	$3,%lo(sourceAddress)($2)
	lui	$2,%hi(OverKartHeader+4)
	addiu	$2,$2,%lo(OverKartHeader+4)
	sw	$2,0($3)
	lui	$2,%hi(dataLength)
	li	$3,48			# 0x30
	jal	runRAM
	sw	$3,%lo(dataLength)($2)

	li	$2,1006895104			# 0x3c040000
	addiu	$2,$2,1536
	lui	$3,%hi(surfacemapA)
	sw	$2,%lo(surfacemapA)($3)
	lui	$3,%hi(OverKartHeader)
	addiu	$3,$3,%lo(OverKartHeader)
	lhu	$5,62($3)
	li	$4,612630528			# 0x24840000
	or	$5,$5,$4
	lui	$6,%hi(surfacemapB)
	sw	$5,%lo(surfacemapB)($6)
	lui	$5,%hi(sectionviewA)
	sw	$2,%lo(sectionviewA)($5)
	lhu	$3,54($3)
	or	$4,$3,$4
	lui	$5,%hi(sectionviewB)
	sw	$4,%lo(sectionviewB)($5)
	lui	$5,%hi(battleDisplayA)
	li	$4,1007616000			# 0x3c0f0000
	addiu	$4,$4,1536
	sw	$4,%lo(battleDisplayA)($5)
	li	$4,904855552			# 0x35ef0000
	or	$3,$3,$4
	lui	$4,%hi(battleDisplayB)
	sw	$3,%lo(battleDisplayB)($4)
	lui	$3,%hi(battleSurfaceA)
	sw	$2,%lo(battleSurfaceA)($3)
	lui	$2,%hi(battleSurfaceB)
	li	$3,881065984			# 0x34840000
	sw	$3,%lo(battleSurfaceB)($2)
	lui	$3,%hi(pathOffset)
	li	$2,100663296			# 0x6000000
	addiu	$2,$2,2592
	b	$L299
	sw	$2,%lo(pathOffset)($3)

$L306:
	lw	$3,%lo(targetAddress)($2)
	lw	$2,0($3)
	addiu	$2,$2,720
	b	$L302
	sw	$2,0($3)

$L300:
	lui	$2,%hi(OverKartHeader)
	li	$3,-1			# 0xffffffffffffffff
	sw	$3,%lo(OverKartHeader)($2)
	lui	$2,%hi(VersionNumber)
	sw	$0,%lo(VersionNumber)($2)
	lui	$2,%hi(sourceAddress)
	lw	$3,%lo(sourceAddress)($2)
	li	$2,1179648			# 0x120000
	addiu	$2,$2,9104
	sw	$2,0($3)
	lui	$2,%hi(targetAddress)
	lw	$3,%lo(targetAddress)($2)
	lui	$2,%hi(g_courseTable)
	addiu	$2,$2,%lo(g_courseTable)
	sw	$2,0($3)
	lui	$2,%hi(dataLength)
	li	$3,48			# 0x30
	jal	runDMA
	sw	$3,%lo(dataLength)($2)

$L299:
	lw	$31,20($sp)
	jr	$31
	addiu	$sp,$sp,24

	.set	macro
	.set	reorder
	.end	LoadCustomHeader
	.size	LoadCustomHeader, .-LoadCustomHeader
	.align	2
	.globl	KWKumo_Alloc_Hook
	.set	nomips16
	.set	nomicromips
	.ent	KWKumo_Alloc_Hook
	.type	KWKumo_Alloc_Hook, @function
KWKumo_Alloc_Hook:
	.frame	$sp,32,$31		# vars= 0, regs= 3/0, args= 16, gp= 0
	.mask	0x80030000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	addiu	$sp,$sp,-32
	sw	$31,28($sp)
	sw	$17,24($sp)
	sw	$16,20($sp)
	lui	$2,%hi(HotSwapID)
	lh	$2,%lo(HotSwapID)($2)
	blez	$2,$L308
	lui	$2,%hi(courseValue)

	lh	$4,%lo(courseValue)($2)
	lui	$2,%hi(gpCourseIndex)
	lh	$2,%lo(gpCourseIndex)($2)
	jal	LoadCustomHeader
	addu	$4,$4,$2

	lui	$16,%hi(OverKartHeader)
	addiu	$16,$16,%lo(OverKartHeader)
	jal	SetCloudType
	lb	$4,68($16)

	jal	SetWeatherType
	lb	$4,69($16)

	lui	$17,%hi(GlobalShortA)
	lui	$16,%hi(g_courseID)
	lhu	$2,%lo(g_courseID)($16)
	sh	$2,%lo(GlobalShortA)($17)
	lui	$2,%hi(CloudCourseID)
	lhu	$2,%lo(CloudCourseID)($2)
	jal	KWKumo_Alloc
	sh	$2,%lo(g_courseID)($16)

	lhu	$2,%lo(GlobalShortA)($17)
	sh	$2,%lo(g_courseID)($16)
	lw	$31,28($sp)
$L311:
	lw	$17,24($sp)
	lw	$16,20($sp)
	jr	$31
	addiu	$sp,$sp,32

$L308:
	jal	KWKumo_Alloc
	nop

	b	$L311
	lw	$31,28($sp)

	.set	macro
	.set	reorder
	.end	KWKumo_Alloc_Hook
	.size	KWKumo_Alloc_Hook, .-KWKumo_Alloc_Hook
	.align	2
	.globl	SetCustomData
	.set	nomips16
	.set	nomicromips
	.ent	SetCustomData
	.type	SetCustomData, @function
SetCustomData:
	.frame	$sp,24,$31		# vars= 0, regs= 1/0, args= 16, gp= 0
	.mask	0x80000000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	addiu	$sp,$sp,-24
	sw	$31,20($sp)
	jal	setText
	nop

	jal	setEcho
	nop

	jal	setSong
	nop

	jal	LoadBomb
	nop

	lui	$2,%hi(OverKartHeader)
	lw	$3,%lo(OverKartHeader)($2)
	li	$2,-1			# 0xffffffffffffffff
	beq	$3,$2,$L313
	lui	$2,%hi(HotSwapID)

	lh	$2,%lo(HotSwapID)($2)
	bgtz	$2,$L316
	nop

$L313:
	jal	SetCourseNames
	move	$4,$0

	lw	$31,20($sp)
$L317:
	jr	$31
	addiu	$sp,$sp,24

$L316:
	jal	SetCourseNames
	li	$4,1			# 0x1

	b	$L317
	lw	$31,20($sp)

	.set	macro
	.set	reorder
	.end	SetCustomData
	.size	SetCustomData, .-SetCustomData
	.align	2
	.globl	MapStartup
	.set	nomips16
	.set	nomicromips
	.ent	MapStartup
	.type	MapStartup, @function
MapStartup:
	.frame	$sp,24,$31		# vars= 0, regs= 2/0, args= 16, gp= 0
	.mask	0x80010000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	addiu	$sp,$sp,-24
	sw	$31,20($sp)
	sw	$16,16($sp)
	move	$16,$4
	lui	$2,%hi(FreeMemoryPointer)
	li	$3,-2141192192			# 0xffffffff80600000
	sw	$3,%lo(FreeMemoryPointer)($2)
	lui	$2,%hi(LastMemoryPointer)
	li	$3,-2139095040			# 0xffffffff80800000
	sw	$3,%lo(LastMemoryPointer)($2)
	lui	$2,%hi(courseValue)
	lh	$4,%lo(courseValue)($2)
	lui	$2,%hi(gpCourseIndex)
	lh	$2,%lo(gpCourseIndex)($2)
	jal	LoadCustomHeader
	addu	$4,$4,$2

	jal	SetCustomData
	nop

	jal	LoadMapData
	move	$4,$16

	jal	setPath
	nop

	lui	$2,%hi(HotSwapID)
	lh	$2,%lo(HotSwapID)($2)
	bgtz	$2,$L321
	nop

	lw	$31,20($sp)
$L322:
	lw	$16,16($sp)
	jr	$31
	addiu	$sp,$sp,24

$L321:
	jal	loadTextureScrollTranslucent
	nop

	jal	runKillDisplayObjects
	nop

	b	$L322
	lw	$31,20($sp)

	.set	macro
	.set	reorder
	.end	MapStartup
	.size	MapStartup, .-MapStartup
	.align	2
	.globl	setBanners
	.set	nomips16
	.set	nomicromips
	.ent	setBanners
	.type	setBanners, @function
setBanners:
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
	lui	$2,%hi(HotSwapID)
	lh	$2,%lo(HotSwapID)($2)
	blez	$2,$L324
	lui	$2,%hi(g_gameMode)

	lw	$3,%lo(g_gameMode)($2)
	li	$2,3			# 0x3
	beql	$3,$2,$L325
	lui	$18,%hi(ok_MenuOffsets+128)

	lui	$18,%hi(ok_MenuOffsets)
	addiu	$18,$18,%lo(ok_MenuOffsets)
	lui	$16,%hi(g_CourseBannerOffsets)
	addiu	$16,$16,%lo(g_CourseBannerOffsets)
	li	$21,65536			# 0x10000
	addiu	$21,$21,15360
	addu	$21,$16,$21
	lui	$22,%hi(HotSwapID)
	lui	$19,%hi(GlobalAddressA)
	lui	$17,%hi(sourceAddress)
	lui	$20,%hi(targetAddress)
	lui	$23,%hi(ok_FreeSpace)
	addiu	$23,$23,%lo(ok_FreeSpace)
	lui	$fp,%hi(bannerU)
	b	$L329
	addiu	$fp,$fp,%lo(bannerU)

$L339:
	sw	$23,0($2)
	lw	$2,%lo(GlobalAddressA)($19)
	addiu	$4,$2,4
	lui	$3,%hi(GlobalAddressB)
	sw	$4,%lo(GlobalAddressB)($3)
	lw	$3,%lo(sourceAddress)($17)
	lw	$2,4($2)
	lw	$3,0($3)
	subu	$2,$2,$3
	addiu	$2,$2,16
	lui	$3,%hi(dataLength)
	jal	runDMA
	sw	$2,%lo(dataLength)($3)

	lw	$2,%lo(sourceAddress)($17)
	b	$L326
	sw	$23,0($2)

$L327:
	lw	$2,%lo(sourceAddress)($17)
	lw	$4,0($2)
$L343:
	li	$3,-1			# 0xffffffffffffffff
	beq	$4,$3,$L338
	lui	$3,%hi(bannerN)

$L328:
	sw	$16,%lo(GlobalAddressA)($19)
	lw	$2,%lo(targetAddress)($20)
	jal	runMIO
	sw	$16,0($2)

	addiu	$16,$16,5056
	beq	$16,$21,$L323
	addiu	$18,$18,8

$L329:
	lh	$2,%lo(HotSwapID)($22)
	addiu	$3,$2,-1
	sll	$2,$3,2
	addu	$2,$2,$3
	sll	$2,$2,5
	addu	$2,$2,$18
	sw	$2,%lo(GlobalAddressA)($19)
	lw	$3,%lo(sourceAddress)($17)
	lw	$2,0($2)
	sw	$2,0($3)
	lw	$2,%lo(sourceAddress)($17)
	lw	$2,0($2)
	addiu	$2,$2,1
	sltu	$2,$2,2
	beq	$2,$0,$L339
	lw	$2,%lo(targetAddress)($20)

$L326:
	lw	$2,%lo(sourceAddress)($17)
	lw	$3,0($2)
	beql	$3,$0,$L327
	sw	$fp,0($2)

	b	$L343
	lw	$4,0($2)

$L338:
	addiu	$3,$3,%lo(bannerN)
	b	$L328
	sw	$3,0($2)

$L325:
	addiu	$18,$18,%lo(ok_MenuOffsets+128)
	lui	$16,%hi(g_BattleBannerOffsets)
	addiu	$16,$16,%lo(g_BattleBannerOffsets)
	addiu	$23,$16,20224
	lui	$22,%hi(HotSwapID)
	lui	$19,%hi(GlobalAddressA)
	lui	$17,%hi(sourceAddress)
	lui	$20,%hi(targetAddress)
	lui	$21,%hi(ok_FreeSpace)
	addiu	$21,$21,%lo(ok_FreeSpace)
	lui	$fp,%hi(bannerU)
	b	$L334
	addiu	$fp,$fp,%lo(bannerU)

$L341:
	sw	$21,0($2)
	lw	$2,%lo(GlobalAddressA)($19)
	addiu	$4,$2,4
	lui	$3,%hi(GlobalAddressB)
	sw	$4,%lo(GlobalAddressB)($3)
	lw	$3,%lo(sourceAddress)($17)
	lw	$2,4($2)
	lw	$3,0($3)
	subu	$2,$2,$3
	addiu	$2,$2,16
	lui	$3,%hi(dataLength)
	jal	runDMA
	sw	$2,%lo(dataLength)($3)

	lw	$2,%lo(sourceAddress)($17)
	b	$L331
	sw	$21,0($2)

$L332:
	lw	$2,%lo(sourceAddress)($17)
	lw	$4,0($2)
$L344:
	li	$3,-1			# 0xffffffffffffffff
	beq	$4,$3,$L340
	lui	$3,%hi(bannerN)

$L333:
	sw	$16,%lo(GlobalAddressA)($19)
	lw	$2,%lo(targetAddress)($20)
	jal	runMIO
	sw	$16,0($2)

	addiu	$16,$16,5056
	beq	$16,$23,$L323
	addiu	$18,$18,8

$L334:
	lh	$2,%lo(HotSwapID)($22)
	addiu	$3,$2,-1
	sll	$2,$3,2
	addu	$2,$2,$3
	sll	$2,$2,5
	addu	$2,$2,$18
	sw	$2,%lo(GlobalAddressA)($19)
	lw	$3,%lo(sourceAddress)($17)
	lw	$2,0($2)
	sw	$2,0($3)
	lw	$2,%lo(sourceAddress)($17)
	lw	$2,0($2)
	addiu	$2,$2,1
	sltu	$2,$2,2
	beq	$2,$0,$L341
	lw	$2,%lo(targetAddress)($20)

$L331:
	lw	$2,%lo(sourceAddress)($17)
	lw	$3,0($2)
	beql	$3,$0,$L332
	sw	$fp,0($2)

	b	$L344
	lw	$4,0($2)

$L340:
	addiu	$3,$3,%lo(bannerN)
	b	$L333
	sw	$3,0($2)

$L324:
	lw	$3,%lo(g_gameMode)($2)
	li	$2,3			# 0x3
	bne	$3,$2,$L342
	lui	$2,%hi(dataLength)

$L323:
	lw	$31,52($sp)
	lw	$fp,48($sp)
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

$L342:
	li	$3,4096			# 0x1000
	sw	$3,%lo(dataLength)($2)
	lui	$16,%hi(GlobalAddressA)
	lui	$2,%hi(g_CourseBannerOffsets)
	addiu	$2,$2,%lo(g_CourseBannerOffsets)
	sw	$2,%lo(GlobalAddressA)($16)
	lui	$19,%hi(targetAddress)
	lw	$2,%lo(targetAddress)($19)
	lui	$17,%hi(ok_FreeSpace)
	addiu	$17,$17,%lo(ok_FreeSpace)
	sw	$17,0($2)
	lui	$18,%hi(sourceAddress)
	lw	$2,%lo(sourceAddress)($18)
	li	$20,8323072			# 0x7f0000
	ori	$20,$20,0xefc0
	jal	runDMA
	sw	$20,0($2)

	lw	$2,%lo(targetAddress)($19)
	lw	$3,%lo(GlobalAddressA)($16)
	sw	$3,0($2)
	lw	$2,%lo(sourceAddress)($18)
	jal	runTKM
	sw	$17,0($2)

	lw	$2,%lo(GlobalAddressA)($16)
	addiu	$2,$2,5056
	sw	$2,%lo(GlobalAddressA)($16)
	lw	$2,%lo(targetAddress)($19)
	sw	$17,0($2)
	lw	$2,%lo(sourceAddress)($18)
	addiu	$3,$20,1024
	jal	runDMA
	sw	$3,0($2)

	lw	$2,%lo(targetAddress)($19)
	lw	$3,%lo(GlobalAddressA)($16)
	sw	$3,0($2)
	lw	$2,%lo(sourceAddress)($18)
	jal	runTKM
	sw	$17,0($2)

	lw	$2,%lo(GlobalAddressA)($16)
	addiu	$2,$2,5056
	sw	$2,%lo(GlobalAddressA)($16)
	lw	$2,%lo(targetAddress)($19)
	sw	$17,0($2)
	lw	$2,%lo(sourceAddress)($18)
	addiu	$3,$20,-2304
	jal	runDMA
	sw	$3,0($2)

	lw	$2,%lo(targetAddress)($19)
	lw	$3,%lo(GlobalAddressA)($16)
	sw	$3,0($2)
	lw	$2,%lo(sourceAddress)($18)
	jal	runTKM
	sw	$17,0($2)

	lw	$2,%lo(GlobalAddressA)($16)
	addiu	$2,$2,5056
	sw	$2,%lo(GlobalAddressA)($16)
	lw	$2,%lo(targetAddress)($19)
	sw	$17,0($2)
	lw	$2,%lo(sourceAddress)($18)
	addiu	$3,$20,3328
	jal	runDMA
	sw	$3,0($2)

	lw	$2,%lo(targetAddress)($19)
	lw	$3,%lo(GlobalAddressA)($16)
	sw	$3,0($2)
	lw	$2,%lo(sourceAddress)($18)
	jal	runTKM
	sw	$17,0($2)

	lw	$2,%lo(GlobalAddressA)($16)
	addiu	$2,$2,5056
	sw	$2,%lo(GlobalAddressA)($16)
	lw	$2,%lo(targetAddress)($19)
	sw	$17,0($2)
	lw	$2,%lo(sourceAddress)($18)
	addiu	$3,$20,2048
	jal	runDMA
	sw	$3,0($2)

	lw	$2,%lo(targetAddress)($19)
	lw	$3,%lo(GlobalAddressA)($16)
	sw	$3,0($2)
	lw	$2,%lo(sourceAddress)($18)
	jal	runTKM
	sw	$17,0($2)

	lw	$2,%lo(GlobalAddressA)($16)
	addiu	$2,$2,5056
	sw	$2,%lo(GlobalAddressA)($16)
	lw	$2,%lo(targetAddress)($19)
	sw	$17,0($2)
	lw	$2,%lo(sourceAddress)($18)
	addiu	$3,$20,-3584
	jal	runDMA
	sw	$3,0($2)

	lw	$2,%lo(targetAddress)($19)
	lw	$3,%lo(GlobalAddressA)($16)
	sw	$3,0($2)
	lw	$2,%lo(sourceAddress)($18)
	jal	runTKM
	sw	$17,0($2)

	lw	$2,%lo(GlobalAddressA)($16)
	addiu	$2,$2,5056
	sw	$2,%lo(GlobalAddressA)($16)
	lw	$2,%lo(targetAddress)($19)
	sw	$17,0($2)
	lw	$2,%lo(sourceAddress)($18)
	addiu	$3,$20,-8704
	jal	runDMA
	sw	$3,0($2)

	lw	$2,%lo(targetAddress)($19)
	lw	$3,%lo(GlobalAddressA)($16)
	sw	$3,0($2)
	lw	$2,%lo(sourceAddress)($18)
	jal	runTKM
	sw	$17,0($2)

	lw	$2,%lo(GlobalAddressA)($16)
	addiu	$2,$2,5056
	sw	$2,%lo(GlobalAddressA)($16)
	lw	$2,%lo(targetAddress)($19)
	sw	$17,0($2)
	lw	$2,%lo(sourceAddress)($18)
	addiu	$3,$20,-9984
	jal	runDMA
	sw	$3,0($2)

	lw	$2,%lo(targetAddress)($19)
	lw	$3,%lo(GlobalAddressA)($16)
	sw	$3,0($2)
	lw	$2,%lo(sourceAddress)($18)
	jal	runTKM
	sw	$17,0($2)

	lw	$2,%lo(GlobalAddressA)($16)
	addiu	$2,$2,5056
	sw	$2,%lo(GlobalAddressA)($16)
	lw	$2,%lo(targetAddress)($19)
	sw	$17,0($2)
	lw	$2,%lo(sourceAddress)($18)
	addiu	$3,$20,6400
	jal	runDMA
	sw	$3,0($2)

	lw	$2,%lo(targetAddress)($19)
	lw	$3,%lo(GlobalAddressA)($16)
	sw	$3,0($2)
	lw	$2,%lo(sourceAddress)($18)
	jal	runTKM
	sw	$17,0($2)

	lw	$2,%lo(GlobalAddressA)($16)
	addiu	$2,$2,5056
	sw	$2,%lo(GlobalAddressA)($16)
	lw	$2,%lo(targetAddress)($19)
	sw	$17,0($2)
	lw	$2,%lo(sourceAddress)($18)
	addiu	$3,$20,4352
	jal	runDMA
	sw	$3,0($2)

	lw	$2,%lo(targetAddress)($19)
	lw	$3,%lo(GlobalAddressA)($16)
	sw	$3,0($2)
	lw	$2,%lo(sourceAddress)($18)
	jal	runTKM
	sw	$17,0($2)

	lw	$2,%lo(GlobalAddressA)($16)
	addiu	$2,$2,5056
	sw	$2,%lo(GlobalAddressA)($16)
	lw	$2,%lo(targetAddress)($19)
	sw	$17,0($2)
	lw	$2,%lo(sourceAddress)($18)
	addiu	$3,$20,-1024
	jal	runDMA
	sw	$3,0($2)

	lw	$2,%lo(targetAddress)($19)
	lw	$3,%lo(GlobalAddressA)($16)
	sw	$3,0($2)
	lw	$2,%lo(sourceAddress)($18)
	jal	runTKM
	sw	$17,0($2)

	lw	$2,%lo(GlobalAddressA)($16)
	addiu	$2,$2,5056
	sw	$2,%lo(GlobalAddressA)($16)
	lw	$2,%lo(targetAddress)($19)
	sw	$17,0($2)
	lw	$2,%lo(sourceAddress)($18)
	addiu	$3,$20,-7424
	jal	runDMA
	sw	$3,0($2)

	lw	$2,%lo(targetAddress)($19)
	lw	$3,%lo(GlobalAddressA)($16)
	sw	$3,0($2)
	lw	$2,%lo(sourceAddress)($18)
	jal	runTKM
	sw	$17,0($2)

	lw	$2,%lo(GlobalAddressA)($16)
	addiu	$2,$2,5056
	sw	$2,%lo(GlobalAddressA)($16)
	lw	$2,%lo(targetAddress)($19)
	sw	$17,0($2)
	lw	$2,%lo(sourceAddress)($18)
	addiu	$3,$20,10496
	jal	runDMA
	sw	$3,0($2)

	lw	$2,%lo(targetAddress)($19)
	lw	$3,%lo(GlobalAddressA)($16)
	sw	$3,0($2)
	lw	$2,%lo(sourceAddress)($18)
	jal	runTKM
	sw	$17,0($2)

	lw	$2,%lo(GlobalAddressA)($16)
	addiu	$2,$2,5056
	sw	$2,%lo(GlobalAddressA)($16)
	lw	$2,%lo(targetAddress)($19)
	sw	$17,0($2)
	lw	$2,%lo(sourceAddress)($18)
	addiu	$3,$20,-4608
	jal	runDMA
	sw	$3,0($2)

	lw	$2,%lo(targetAddress)($19)
	lw	$3,%lo(GlobalAddressA)($16)
	sw	$3,0($2)
	lw	$2,%lo(sourceAddress)($18)
	jal	runTKM
	sw	$17,0($2)

	lw	$2,%lo(GlobalAddressA)($16)
	addiu	$2,$2,5056
	sw	$2,%lo(GlobalAddressA)($16)
	lw	$2,%lo(targetAddress)($19)
	sw	$17,0($2)
	lw	$2,%lo(sourceAddress)($18)
	addiu	$3,$20,-6144
	jal	runDMA
	sw	$3,0($2)

	lw	$2,%lo(targetAddress)($19)
	lw	$3,%lo(GlobalAddressA)($16)
	sw	$3,0($2)
	lw	$2,%lo(sourceAddress)($18)
	jal	runTKM
	sw	$17,0($2)

	lw	$2,%lo(GlobalAddressA)($16)
	addiu	$2,$2,5056
	sw	$2,%lo(GlobalAddressA)($16)
	lw	$2,%lo(targetAddress)($19)
	sw	$17,0($2)
	lw	$2,%lo(sourceAddress)($18)
	addiu	$20,$20,5376
	jal	runDMA
	sw	$20,0($2)

	lw	$2,%lo(targetAddress)($19)
	lw	$3,%lo(GlobalAddressA)($16)
	sw	$3,0($2)
	lw	$2,%lo(sourceAddress)($18)
	jal	runTKM
	sw	$17,0($2)

	lw	$2,%lo(GlobalAddressA)($16)
	addiu	$2,$2,5056
	b	$L323
	sw	$2,%lo(GlobalAddressA)($16)

	.set	macro
	.set	reorder
	.end	setBanners
	.size	setBanners, .-setBanners
	.align	2
	.globl	setPreviews
	.set	nomips16
	.set	nomicromips
	.ent	setPreviews
	.type	setPreviews, @function
setPreviews:
	.frame	$sp,24,$31		# vars= 0, regs= 1/0, args= 16, gp= 0
	.mask	0x80000000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	lui	$2,%hi(HotSwapID)
	lh	$2,%lo(HotSwapID)($2)
	blez	$2,$L346
	lui	$6,%hi(ok_MenuOffsets+4)

	addiu	$6,$6,%lo(ok_MenuOffsets+4)
	lui	$5,%hi(g_CoursePreviewOffsets+4)
	addiu	$5,$5,%lo(g_CoursePreviewOffsets+4)
	lui	$8,%hi(g_CoursePreviewOffsets+804)
	addiu	$8,$8,%lo(g_CoursePreviewOffsets+804)
	lui	$11,%hi(HotSwapID)
	lui	$10,%hi(GlobalAddressA)
	lui	$3,%hi(sourceAddress)
	lui	$12,%hi(previewU)
	addiu	$12,$12,%lo(previewU)
	li	$9,-1			# 0xffffffffffffffff
	lui	$13,%hi(previewN)
	addiu	$13,$13,%lo(previewN)
	li	$7,160235520			# 0x98d0000
	b	$L349
	addiu	$7,$7,26064

$L347:
	lw	$2,%lo(sourceAddress)($3)
	lw	$4,0($2)
$L357:
	beql	$4,$9,$L348
	sw	$13,0($2)

$L348:
	lw	$4,%lo(sourceAddress)($3)
	lw	$2,0($4)
	addu	$2,$2,$7
	sw	$2,0($4)
	lw	$2,%lo(sourceAddress)($3)
	lw	$2,0($2)
	sw	$2,0($5)
	addiu	$5,$5,40
	beq	$5,$8,$L358
	addiu	$6,$6,8

$L349:
	lh	$2,%lo(HotSwapID)($11)
	addiu	$4,$2,-1
	sll	$2,$4,2
	addu	$2,$2,$4
	sll	$2,$2,5
	addu	$2,$2,$6
	sw	$2,%lo(GlobalAddressA)($10)
	lw	$4,%lo(sourceAddress)($3)
	lw	$2,0($2)
	sw	$2,0($4)
	lw	$2,%lo(sourceAddress)($3)
	lw	$4,0($2)
	beql	$4,$0,$L347
	sw	$12,0($2)

	b	$L357
	nop

$L358:
	jr	$31
	nop

$L346:
	addiu	$sp,$sp,-24
	sw	$31,20($sp)
	lui	$2,%hi(targetAddress)
	lw	$3,%lo(targetAddress)($2)
	lui	$2,%hi(g_CoursePreviewOffsets)
	addiu	$2,$2,%lo(g_CoursePreviewOffsets)
	sw	$2,0($3)
	lui	$2,%hi(sourceAddress)
	lw	$3,%lo(sourceAddress)($2)
	lui	$2,%hi(r_CoursePreviewOffsets)
	addiu	$2,$2,%lo(r_CoursePreviewOffsets)
	sw	$2,0($3)
	lui	$2,%hi(dataLength)
	li	$3,800			# 0x320
	jal	runDMA
	sw	$3,%lo(dataLength)($2)

	lw	$31,20($sp)
	jr	$31
	addiu	$sp,$sp,24

	.set	macro
	.set	reorder
	.end	setPreviews
	.size	setPreviews, .-setPreviews
	.align	2
	.globl	swapHS
	.set	nomips16
	.set	nomicromips
	.ent	swapHS
	.type	swapHS, @function
swapHS:
	.frame	$sp,24,$31		# vars= 0, regs= 1/0, args= 16, gp= 0
	.mask	0x80000000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	addiu	$sp,$sp,-24
	bne	$4,$0,$L360
	sw	$31,20($sp)

	lui	$2,%hi(HotSwapID)
	lh	$2,%lo(HotSwapID)($2)
	blez	$2,$L361
	li	$3,1			# 0x1

	beq	$2,$3,$L365
	nop

	lui	$3,%hi(HotSwapID)
$L367:
	lhu	$2,%lo(HotSwapID)($3)
	addiu	$2,$2,-1
	sh	$2,%lo(HotSwapID)($3)
	li	$4,1224736768			# 0x49000000
	jal	playSound
	ori	$4,$4,0x801a

$L361:
	jal	setPreviews
	nop

	jal	previewRefresh
	nop

	jal	setBanners
	nop

	lui	$2,%hi(courseValue)
	li	$3,-1			# 0xffffffffffffffff
	sh	$3,%lo(courseValue)($2)
	lw	$31,20($sp)
	jr	$31
	addiu	$sp,$sp,24

$L365:
	jal	stockASM
	nop

	b	$L367
	lui	$3,%hi(HotSwapID)

$L360:
	lui	$2,%hi(HotSwapID)
	lh	$2,%lo(HotSwapID)($2)
	slt	$3,$2,4
	beq	$3,$0,$L361
	nop

	beq	$2,$0,$L366
	nop

	lui	$3,%hi(HotSwapID)
$L368:
	lhu	$2,%lo(HotSwapID)($3)
	addiu	$2,$2,1
	sh	$2,%lo(HotSwapID)($3)
	li	$4,1224736768			# 0x49000000
	jal	playSound
	ori	$4,$4,0x801a

	b	$L361
	nop

$L366:
	jal	overkartASM
	nop

	b	$L368
	lui	$3,%hi(HotSwapID)

	.set	macro
	.set	reorder
	.end	swapHS
	.size	swapHS, .-swapHS
	.align	2
	.globl	loadMinimap
	.set	nomips16
	.set	nomicromips
	.ent	loadMinimap
	.type	loadMinimap, @function
loadMinimap:
	.frame	$sp,32,$31		# vars= 0, regs= 3/0, args= 16, gp= 0
	.mask	0x80030000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	lui	$2,%hi(sourceAddress)
	lw	$3,%lo(sourceAddress)($2)
	lui	$4,%hi(OverKartHeader+88)
	lw	$4,%lo(OverKartHeader+88)($4)
	sw	$4,0($3)
	lw	$2,%lo(sourceAddress)($2)
	lw	$2,0($2)
	bnel	$2,$0,$L376
	lui	$2,%hi(targetAddress)

	jr	$31
	nop

$L376:
	addiu	$sp,$sp,-32
	sw	$31,28($sp)
	sw	$17,24($sp)
	sw	$16,20($sp)
	lw	$2,%lo(targetAddress)($2)
	lui	$17,%hi(ok_FreeSpace)
	addiu	$16,$17,%lo(ok_FreeSpace)
	sw	$16,0($2)
	lui	$2,%hi(dataLength)
	li	$3,4096			# 0x1000
	jal	runDMA
	sw	$3,%lo(dataLength)($2)

	lw	$2,%lo(ok_FreeSpace)($17)
	sra	$4,$2,16
	lui	$3,%hi(g_mapX)
	sh	$4,%lo(g_mapX)($3)
	lui	$3,%hi(g_mapY)
	sh	$2,%lo(g_mapY)($3)
	lw	$3,4($16)
	sra	$4,$3,16
	lui	$2,%hi(g_startX)
	sh	$4,%lo(g_startX)($2)
	lui	$2,%hi(g_startY)
	sh	$3,%lo(g_startY)($2)
	lw	$2,8($16)
	sra	$5,$2,16
	lui	$3,%hi(g_mapHeight)
	sh	$5,%lo(g_mapHeight)($3)
	lui	$3,%hi(g_mapWidth)
	sh	$2,%lo(g_mapWidth)($3)
	lw	$3,12($16)
	sra	$6,$3,16
	lui	$5,%hi(g_mapR)
	sh	$6,%lo(g_mapR)($5)
	lui	$5,%hi(g_mapG)
	sh	$3,%lo(g_mapG)($5)
	lh	$5,16($16)
	lui	$3,%hi(g_mapB)
	sh	$5,%lo(g_mapB)($3)
	lwc1	$f0,20($16)
	lui	$3,%hi($LC7)
	lwc1	$f2,%lo($LC7)($3)
	div.s	$f0,$f0,$f2
	lui	$3,%hi(g_mapScale)
	swc1	$f0,%lo(g_mapScale)($3)
	lui	$3,%hi(g_mirrorMode)
	lw	$5,%lo(g_mirrorMode)($3)
	li	$3,1			# 0x1
	beq	$5,$3,$L377
	subu	$2,$2,$4

$L371:
	lui	$2,%hi(sourceAddress)
	lw	$3,%lo(sourceAddress)($2)
	lui	$2,%hi(ok_FreeSpace+24)
	addiu	$2,$2,%lo(ok_FreeSpace+24)
	sw	$2,0($3)
	lui	$2,%hi(targetAddress)
	lw	$2,%lo(targetAddress)($2)
	lui	$16,%hi(ok_MapTextureData)
	addiu	$16,$16,%lo(ok_MapTextureData)
	jal	runMIO
	sw	$16,0($2)

	lui	$2,%hi(g_mapTexture)
	sw	$16,%lo(g_mapTexture)($2)
	lw	$31,28($sp)
	lw	$17,24($sp)
	lw	$16,20($sp)
	jr	$31
	addiu	$sp,$sp,32

$L377:
	lui	$3,%hi(g_startX)
	b	$L371
	sh	$2,%lo(g_startX)($3)

	.set	macro
	.set	reorder
	.end	loadMinimap
	.size	loadMinimap, .-loadMinimap
	.align	2
	.globl	initFireParticles
	.set	nomips16
	.set	nomicromips
	.ent	initFireParticles
	.type	initFireParticles, @function
initFireParticles:
	.frame	$sp,56,$31		# vars= 0, regs= 6/4, args= 16, gp= 0
	.mask	0x801f0000,-20
	.fmask	0x00f00000,-8
	.set	noreorder
	.set	nomacro
	lui	$2,%hi(tempPointer)
	lw	$2,%lo(tempPointer)($2)
	sw	$4,0($2)
	lui	$2,%hi(sourceAddress)
	lw	$3,%lo(sourceAddress)($2)
	lui	$2,%hi(FireParticlePositions)
	addiu	$2,$2,%lo(FireParticlePositions)
	sw	$2,0($3)
	lui	$2,%hi(targetAddress)
	lw	$3,%lo(targetAddress)($2)
	lui	$2,%hi(objectPosition)
	addiu	$2,$2,%lo(objectPosition)
	sw	$2,0($3)
	lui	$2,%hi(tempFireParticleMax)
	lw	$7,%lo(tempFireParticleMax)($2)
	blez	$7,$L393
	li	$8,-32768			# 0xffffffffffff8000

	addiu	$sp,$sp,-56
	sw	$31,36($sp)
	sw	$20,32($sp)
	sw	$19,28($sp)
	sw	$18,24($sp)
	sw	$17,20($sp)
	sw	$16,16($sp)
	sdc1	$f22,48($sp)
	sdc1	$f20,40($sp)
	lui	$16,%hi(FireParticlePositions)
	addiu	$16,$16,%lo(FireParticlePositions)
	move	$2,$16
	move	$5,$0
$L382:
	lh	$3,0($4)
	sh	$3,0($2)
	lh	$6,2($4)
	sh	$6,2($2)
	lh	$6,4($4)
	beq	$3,$8,$L390
	sh	$6,4($2)

	addiu	$4,$4,8
	addiu	$5,$5,1
	bne	$5,$7,$L382
	addiu	$2,$2,6

	lui	$18,%hi(FireParticleAllocArray)
$L392:
	addiu	$18,$18,%lo(FireParticleAllocArray)
	move	$17,$0
	lui	$19,%hi(g_DynamicObjects)
	addiu	$19,$19,%lo(g_DynamicObjects)
	lui	$2,%hi($LC8)
	lwc1	$f22,%lo($LC8)($2)
	lui	$2,%hi($LC9)
	lwc1	$f20,%lo($LC9)($2)
	lui	$20,%hi(tempFireParticleMax)
$L383:
	jal	KWGetCaveFire
	move	$4,$17

	lw	$5,0($18)
	sll	$2,$5,3
	subu	$3,$2,$5
	sll	$3,$3,5
	addu	$3,$3,$19
	lh	$4,0($16)
	mtc1	$4,$f0
	nop
	cvt.s.w	$f0,$f0
	swc1	$f0,16($3)
	lh	$4,2($16)
	mtc1	$4,$f0
	nop
	cvt.s.w	$f0,$f0
	add.s	$f0,$f0,$f22
	swc1	$f0,20($3)
	lh	$4,4($16)
	mtc1	$4,$f0
	nop
	cvt.s.w	$f0,$f0
	swc1	$f0,24($3)
	swc1	$f20,0($3)
	addiu	$17,$17,1
	addiu	$16,$16,6
	lw	$2,%lo(tempFireParticleMax)($20)
	slt	$2,$17,$2
	bne	$2,$0,$L383
	addiu	$18,$18,4

	lw	$31,36($sp)
$L391:
	lw	$20,32($sp)
	lw	$19,28($sp)
	lw	$18,24($sp)
	lw	$17,20($sp)
	lw	$16,16($sp)
	ldc1	$f22,48($sp)
	ldc1	$f20,40($sp)
	jr	$31
	addiu	$sp,$sp,56

$L390:
	addiu	$7,$7,-1
	slt	$5,$5,$7
	beq	$5,$0,$L392
	lui	$18,%hi(FireParticleAllocArray)

	b	$L391
	lw	$31,36($sp)

$L393:
	jr	$31
	nop

	.set	macro
	.set	reorder
	.end	initFireParticles
	.size	initFireParticles, .-initFireParticles
	.align	2
	.globl	DisplayFireParticleSub
	.set	nomips16
	.set	nomicromips
	.ent	DisplayFireParticleSub
	.type	DisplayFireParticleSub, @function
DisplayFireParticleSub:
	.frame	$sp,48,$31		# vars= 0, regs= 4/0, args= 32, gp= 0
	.mask	0x80070000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	addiu	$sp,$sp,-48
	sw	$31,44($sp)
	sw	$18,40($sp)
	sw	$17,36($sp)
	sw	$16,32($sp)
	move	$17,$4
	move	$16,$5
	lui	$2,%hi(FireParticleAllocArray)
	lw	$3,%lo(FireParticleAllocArray)($2)
	lui	$2,%hi(HotSwapID)
	lh	$2,%lo(HotSwapID)($2)
	blez	$2,$L399
	move	$18,$6

	li	$2,604045312			# 0x24010000
	addiu	$2,$2,4
$L395:
	lui	$4,%hi(CaveFireColCheck)
	sw	$2,%lo(CaveFireColCheck)($4)
	li	$2,3			# 0x3
	beq	$16,$2,$L400
	subu	$3,$17,$3

	move	$6,$18
$L401:
	move	$5,$16
	jal	KWDisplayFireParticleSub
	move	$4,$17

	lw	$31,44($sp)
	lw	$18,40($sp)
	lw	$17,36($sp)
	lw	$16,32($sp)
	jr	$31
	addiu	$sp,$sp,48

$L399:
	li	$2,604045312			# 0x24010000
	b	$L395
	addiu	$2,$2,3

$L400:
	sll	$3,$3,2
	lui	$2,%hi(FireRGBA)
	addiu	$2,$2,%lo(FireRGBA)
	addu	$3,$3,$2
	lb	$4,0($3)
	lb	$5,1($3)
	lb	$6,2($3)
	li	$2,1431633920			# 0x55550000
	addiu	$2,$2,21846
	mult	$4,$2
	mfhi	$7
	sra	$8,$4,31
	subu	$7,$7,$8
	lb	$3,3($3)
	sw	$3,24($sp)
	mult	$6,$2
	mfhi	$3
	sra	$8,$6,31
	subu	$3,$3,$8
	sll	$3,$3,24
	sra	$3,$3,24
	sw	$3,20($sp)
	mult	$5,$2
	mfhi	$2
	sra	$3,$5,31
	subu	$2,$2,$3
	sll	$2,$2,24
	sra	$2,$2,24
	sw	$2,16($sp)
	sll	$7,$7,24
	jal	KWSet2Color
	sra	$7,$7,24

	b	$L401
	move	$6,$18

	.set	macro
	.set	reorder
	.end	DisplayFireParticleSub
	.size	DisplayFireParticleSub, .-DisplayFireParticleSub
	.align	2
	.globl	EmptyActionData
	.set	nomips16
	.set	nomicromips
	.ent	EmptyActionData
	.type	EmptyActionData, @function
EmptyActionData:
	.frame	$sp,0,$31		# vars= 0, regs= 0/0, args= 0, gp= 0
	.mask	0x00000000,0
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	lui	$4,%hi(ActionData_Pointer)
	addiu	$2,$4,%lo(ActionData_Pointer)
	lw	$3,76($2)
	lui	$2,%hi(GlobalAddressA)
	sw	$3,%lo(GlobalAddressA)($2)
	sw	$3,%lo(ActionData_Pointer)($4)
	li	$4,1			# 0x1
	sh	$4,0($3)
	lw	$3,%lo(GlobalAddressA)($2)
	lui	$4,%hi(MaxPathPoints)
	lw	$4,%lo(MaxPathPoints)($4)
	sh	$4,2($3)
	lw	$2,%lo(GlobalAddressA)($2)
	li	$3,6			# 0x6
	jr	$31
	sh	$3,6($2)

	.set	macro
	.set	reorder
	.end	EmptyActionData
	.size	EmptyActionData, .-EmptyActionData
	.align	2
	.globl	DisplayKT1Hook
	.set	nomips16
	.set	nomicromips
	.ent	DisplayKT1Hook
	.type	DisplayKT1Hook, @function
DisplayKT1Hook:
	.frame	$sp,24,$31		# vars= 0, regs= 2/0, args= 16, gp= 0
	.mask	0x80010000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	addiu	$sp,$sp,-24
	sw	$31,20($sp)
	sw	$16,16($sp)
	jal	osGetCount
	move	$16,$4

	lui	$3,%hi(ClockCycle+4)
	sw	$2,%lo(ClockCycle+4)($3)
	lui	$3,%hi(OldCycle)
	addiu	$3,$3,%lo(OldCycle)
	lw	$4,4($3)
	subu	$4,$2,$4
	lui	$5,%hi(CycleCount+4)
	sw	$4,%lo(CycleCount+4)($5)
	sw	$2,4($3)
	lui	$2,%hi(HotSwapID)
	lh	$2,%lo(HotSwapID)($2)
	blez	$2,$L404
	lui	$2,%hi(OverKartHeader+160)

	lh	$2,%lo(OverKartHeader+160)($2)
	blez	$2,$L405
	lui	$2,%hi(GraphPtrOffset)

	lw	$3,%lo(GraphPtrOffset)($2)
	addiu	$4,$3,8
	sw	$4,%lo(GraphPtrOffset)($2)
	li	$4,-1174405120			# 0xffffffffba000000
	addiu	$4,$4,5122
	sw	$4,0($3)
	li	$4,1048576			# 0x100000
	sw	$4,4($3)
	lw	$5,%lo(GraphPtrOffset)($2)
	addiu	$3,$5,8
	sw	$3,%lo(GraphPtrOffset)($2)
	li	$3,-134217728			# 0xfffffffff8000000
	sw	$3,0($5)
	lui	$4,%hi(OverKartHeader)
	addiu	$4,$4,%lo(OverKartHeader)
	lbu	$3,164($4)
	sll	$3,$3,24
	lbu	$6,165($4)
	sll	$6,$6,16
	or	$3,$3,$6
	lbu	$6,167($4)
	or	$3,$3,$6
	lbu	$6,166($4)
	sll	$6,$6,8
	or	$3,$3,$6
	sw	$3,4($5)
	lw	$6,%lo(GraphPtrOffset)($2)
	addiu	$3,$6,8
	sw	$3,%lo(GraphPtrOffset)($2)
	li	$3,-1140850688			# 0xffffffffbc000000
	addiu	$3,$3,8
	sw	$3,0($6)
	lh	$5,160($4)
	lh	$4,162($4)
	subu	$4,$4,$5
	li	$3,500			# 0x1f4
	subu	$3,$3,$5
	sll	$3,$3,8
	div	$0,$3,$4
	teq	$4,$0,7
	mflo	$3
	andi	$3,$3,0xffff
	li	$5,65536			# 0x10000
	ori	$7,$5,0xf400
	div	$0,$7,$4
	teq	$4,$0,7
	mflo	$4
	sll	$4,$4,16
	or	$3,$3,$4
	sw	$3,4($6)
	lw	$3,%lo(GraphPtrOffset)($2)
	addiu	$4,$3,8
	sw	$4,%lo(GraphPtrOffset)($2)
	li	$4,-1191182336			# 0xffffffffb9000000
	addiu	$4,$4,797
	sw	$4,0($3)
	li	$4,-938409984			# 0xffffffffc8110000
	addiu	$4,$4,8312
	sw	$4,4($3)
	lw	$3,%lo(GraphPtrOffset)($2)
	addiu	$4,$3,8
	sw	$4,%lo(GraphPtrOffset)($2)
	li	$2,-1224736768			# 0xffffffffb7000000
	sw	$2,0($3)
	addiu	$5,$5,512
	sw	$5,4($3)
$L405:
	lui	$2,%hi(OverKartHeader+52)
	lw	$4,%lo(OverKartHeader+52)($2)
	move	$5,$16
	li	$2,100663296			# 0x6000000
	jal	DisplayGroupmap
	addu	$4,$4,$2

	lw	$31,20($sp)
$L408:
	lw	$16,16($sp)
	jr	$31
	addiu	$sp,$sp,24

$L404:
	jal	DisplayKT1
	move	$4,$16

	b	$L408
	lw	$31,20($sp)

	.set	macro
	.set	reorder
	.end	DisplayKT1Hook
	.size	DisplayKT1Hook, .-DisplayKT1Hook
	.align	2
	.globl	XLUDisplay
	.set	nomips16
	.set	nomicromips
	.ent	XLUDisplay
	.type	XLUDisplay, @function
XLUDisplay:
	.frame	$sp,24,$31		# vars= 0, regs= 1/0, args= 16, gp= 0
	.mask	0x80000000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	lui	$2,%hi(OverKartHeader)
	lw	$2,%lo(OverKartHeader)($2)
	slt	$2,$2,5
	bne	$2,$0,$L419
	lui	$2,%hi(OverKartHeader+160)

	lui	$2,%hi(HotSwapID)
	lh	$2,%lo(HotSwapID)($2)
	blez	$2,$L414
	lui	$2,%hi(g_gameMode)

	lw	$3,%lo(g_gameMode)($2)
	li	$2,3			# 0x3
	bne	$3,$2,$L418
	lui	$2,%hi(graphPointer)

	lw	$3,%lo(graphPointer)($2)
	lw	$3,0($3)
	li	$5,100663296			# 0x6000000
	sw	$5,0($3)
	lw	$3,%lo(graphPointer)($2)
	lw	$4,0($3)
	addiu	$4,$4,4
	sw	$4,0($3)
	lw	$3,%lo(graphPointer)($2)
	lw	$4,0($3)
	lui	$3,%hi(OverKartHeader+56)
	lw	$3,%lo(OverKartHeader+56)($3)
	addu	$3,$3,$5
	sw	$3,0($4)
	lw	$3,%lo(graphPointer)($2)
	lw	$2,0($3)
	addiu	$2,$2,4
	sw	$2,0($3)
$L414:
	lui	$2,%hi(OverKartHeader+160)
$L419:
	lh	$2,%lo(OverKartHeader+160)($2)
	blez	$2,$L420
	lui	$2,%hi(GraphPtrOffset)

	lw	$3,%lo(GraphPtrOffset)($2)
	addiu	$4,$3,8
	sw	$4,%lo(GraphPtrOffset)($2)
	li	$4,-1174405120			# 0xffffffffba000000
	addiu	$4,$4,5122
	sw	$4,0($3)
	sw	$0,4($3)
	lw	$3,%lo(GraphPtrOffset)($2)
	addiu	$4,$3,8
	sw	$4,%lo(GraphPtrOffset)($2)
	li	$2,-1241513984			# 0xffffffffb6000000
	sw	$2,0($3)
	li	$2,65536			# 0x10000
	jr	$31
	sw	$2,4($3)

$L418:
	addiu	$sp,$sp,-24
	sw	$31,20($sp)
	lui	$2,%hi(OverKartHeader+56)
	lw	$3,%lo(OverKartHeader+56)($2)
	move	$5,$4
	li	$4,100663296			# 0x6000000
	jal	DisplayGroupmap
	addu	$4,$3,$4

	lui	$2,%hi(OverKartHeader+160)
	lh	$2,%lo(OverKartHeader+160)($2)
	blez	$2,$L409
	lui	$2,%hi(GraphPtrOffset)

	lw	$3,%lo(GraphPtrOffset)($2)
	addiu	$4,$3,8
	sw	$4,%lo(GraphPtrOffset)($2)
	li	$4,-1174405120			# 0xffffffffba000000
	addiu	$4,$4,5122
	sw	$4,0($3)
	sw	$0,4($3)
	lw	$3,%lo(GraphPtrOffset)($2)
	addiu	$4,$3,8
	sw	$4,%lo(GraphPtrOffset)($2)
	li	$2,-1241513984			# 0xffffffffb6000000
	sw	$2,0($3)
	li	$2,65536			# 0x10000
	sw	$2,4($3)
$L409:
	lw	$31,20($sp)
	jr	$31
	addiu	$sp,$sp,24

$L420:
	jr	$31
	nop

	.set	macro
	.set	reorder
	.end	XLUDisplay
	.size	XLUDisplay, .-XLUDisplay
	.local	OldCycle.2
	.comm	OldCycle.2,4,4
	.globl	FireRGBA
	.data
	.align	2
	.type	FireRGBA, @object
	.size	FireRGBA, 32
FireRGBA:
	.ascii	"\226\000\031\377"
	.ascii	"\226\0247\377"
	.ascii	"22\377\377"
	.ascii	"2\3772\377"
	.ascii	"\226Z\377\377"
	.ascii	"\37277\233"
	.ascii	"d\377\031\377"
	.ascii	"\372i7\377"
	.globl	tempFireParticleMax
	.align	2
	.type	tempFireParticleMax, @object
	.size	tempFireParticleMax, 4
tempFireParticleMax:
	.word	8
	.globl	A4Rain
	.align	2
	.type	A4Rain, @object
	.size	A4Rain, 144
A4Rain:
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	1
	.word	0
	.word	2
	.word	0
	.word	4
	.word	0
	.word	6
	.word	0
	.word	8
	.word	0
	.word	8
	.word	0
	.word	10
	.word	0
	.word	12
	.word	0
	.word	11
	.word	0
	.word	10
	.word	0
	.word	9
	.word	0
	.word	8
	.word	0
	.word	6
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.globl	A4Snow
	.align	2
	.type	A4Snow, @object
	.size	A4Snow, 144
A4Snow:
	.word	0
	.word	0
	.word	0
	.word	0
	.word	273
	.word	286261248
	.word	70179
	.word	841027584
	.word	1123141
	.word	1412567296
	.word	1197432
	.word	-2024529664
	.word	19093659
	.word	-1165676016
	.word	19167693
	.word	-594066928
	.word	20286431
	.word	-38251760
	.word	20286431
	.word	-38251760
	.word	19167693
	.word	-593018352
	.word	19093659
	.word	-1165676016
	.word	1197432
	.word	-2024529664
	.word	1123141
	.word	1412567296
	.word	70179
	.word	841027584
	.word	273
	.word	286261248
	.word	0
	.word	0
	.word	0
	.word	0
	.section	.rodata.cst8,"aM",@progbits,8
	.align	3
$LC0:
	.word	1106247680
	.word	0
	.section	.rodata.cst4,"aM",@progbits,4
	.align	2
$LC1:
	.word	1278400390
	.section	.rodata.cst8
	.align	3
$LC2:
	.word	1075052544
	.word	0
	.align	3
$LC3:
	.word	1078853632
	.word	0
	.section	.rodata.cst4
	.align	2
$LC4:
	.word	-1063256064
	.align	2
$LC5:
	.word	1053609165
	.align	2
$LC6:
	.word	1110704128
	.align	2
$LC7:
	.word	1120403456
	.align	2
$LC8:
	.word	1092616192
	.align	2
$LC9:
	.word	1061997773
	.ident	"GCC: (GNU) 10.1.0"
